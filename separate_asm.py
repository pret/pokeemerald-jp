""" Separates ASM into modules. """
import re
import os
import glob
import struct
from statistics import mean, stdev
from typing import List

from collections import defaultdict
from graph_search import elf_funcs, decode


def us_first_funcs(paths):
    funcs = {}  # Maps function names to path names
    func_exp = re.compile(r'\s*\.type\s+(\w+),function')
    for path in paths:
        with open(path, 'r') as f:
            for line in f:
                m = func_exp.match(line)
                if m:
                    if m.group(1) in funcs:
                        print(f'Duplicate {m.group(1)}')
                    funcs[m.group(1)] = os.path.basename(path)
                    break
    return funcs


def label_funcs(symbols, first_funcs):  # Maps function names to (label, addr, size) triples
    labels = {}
    for name, (addr, size) in symbols.items():
        if name in first_funcs:
            labels[name] = (first_funcs[name], addr, size)
        else:
            labels[name] = (None, addr, size)
    curr_label = None
    for addr, label, name, size in sorted((addr, label, name, size) for name, (label, addr, size) in labels.items()):
        if not label and curr_label:  # name is not labeled, use current label
            labels[name] = (curr_label, addr, size)
        elif label:  # Name is labeled, switch current label
            curr_label = label
    return labels


def label_jp(jp_symbols, us_labels):  # Maps function names to (label, addr, size) triples
    jp_labels = {}
    for name, (addr, size) in jp_symbols.items():
        if not name.startswith('sub_') and name in us_labels:
            jp_labels[name] = (us_labels[name][0], addr, size)
        else:
            jp_labels[name] = (None, addr, size)
    return jp_labels


def module_funcs(labels):  # Maps module names to a set of function names
    func_map = defaultdict(set)
    for name, (label, addr, size) in labels.items():
        func_map[label].add(name)
    return func_map


def edit_distance(a: List[int], b: List[int]) -> int:  # Computes instruction edit distance
    m, n = len(a)+1, len(b)+1
    d = [[0 for j in range(n)] for i in range(m)]
    for i in range(m):
        d[i][0] = i
    for j in range(n):
        d[0][j] = j
    for j in range(1, n):
        for i in range(1, m):
            sub_cost = 0 if a[i-1] == b[j-1] else 1
            d[i][j] = min(d[i-1][j]+1,  # deletion
                          d[i][j-1]+1,  # insertion
                          d[i-1][j-1]+sub_cost)  # substitution
    return d[-1][-1]


def read_func(addr: int, size: int, f):
    f.seek(addr & 0xfffffe)
    instrs = [t[0] for t in struct.iter_unpack('<H', f.read(size))]
    for i in range(len(instrs)-1, -1, -1):  # Slice off data after the last return
        if instrs[i] in (0x4770, 0x4700, 0x4708, 0x4710):  # BX lr, BX r0, BX r1
            instrs = instrs[:i+1]
            break
    return instrs


def fix_jp(jp_labels, us_labels, jp_f, us_f):
    mod_map = module_funcs(us_labels)
    replace = {}  # Maps old names to new names
    ordered = [(addr, name, label, size) for name, (label, addr, size) in jp_labels.items()]
    ordered.sort()
    last_label = None
    wrong_c = new_c = 0
    out = open('replace.txt', 'w')
    print(f'{wrong_c} wrong, {new_c} new, 0/{len(ordered)}', end='')
    for i, (addr, name, label, size) in enumerate(ordered[:-1], 0):
        next_label = ordered[i+1][2]
        # print(f'{name}: {last_label} >{label} {next_label}')
        jp_instrs = read_func(addr, size, jp_f)
        modules = []
        if label:  # Check against label and adjacent
            modules.append(label)
            if last_label != label and last_label:
                modules.append(last_label)
            if next_label != label and next_label:
                modules.append(next_label)
            threshold = 0  # Minimum threshold to beat
        else:  # Check against adjacent labels
            if last_label:
                modules.append(last_label)
            if next_label and next_label != last_label:
                modules.append(next_label)
            threshold = max(1, len(jp_instrs)//10)
        diff = []
        for mod_label in modules:
            for us_name in mod_map[mod_label]:
                us_instrs = read_func(us_labels[us_name][1], us_labels[us_name][2], us_f)
                dist = edit_distance(jp_instrs, us_instrs)
                diff.append((dist, mod_label, us_name))
                if us_name == name:
                    threshold = dist
        diff.sort()
        # Replace the function if a better match was found with a known name
        if diff and diff[0][0] < threshold:
            new_name = diff[0][2]
            if new_name in jp_labels:  # New name already used, replace it with sub
                _, old_addr, old_size = jp_labels[new_name]
                jp_labels[f'sub_{old_addr:08X}'] = None, old_addr, old_size
                replace[new_name] = f'sub_{old_addr:08X}'
                out.write(f'{old_addr:08x} None {new_name} sub_{old_addr:08X}\n')
            if new_name.startswith('sub_'):  # Replace with correct name
                new_name = f'SUB_{addr:08X}'
            replace[name] = new_name
            out.write(f'{addr:08x} {diff[0][1]} {name} {new_name}\n')
            jp_labels[new_name] = (diff[0][1], addr, size)
            jp_labels.pop(name)
            if label:
                wrong_c += 1
            else:
                new_c += 1
            print(f'\r{wrong_c} wrong, {new_c} new, {i}/{len(ordered)}', end='')
        elif i % 100 == 0:
            out.flush()
            print(f'\r{wrong_c} wrong, {new_c} new, {i}/{len(ordered)}', end='')
        #     print(f'Replace with {new_name} ({diff[0][0]} vs {threshold})')
        # elif diff:
        #     print(f'{diff[0][1]} {diff[0][2]} ({diff[0][0]} vs {threshold})')
        last_label = label
    out.close()


def modularize(jp_addr, us_labels, jp_f, us_f):
    modmap = module_funcs(us_labels)
    func_reg = re.compile(r'([\da-fA-F]{8}) (.+) (.+)\r?\n')
    mod_reg = re.compile(r'([\w\.]+)\r?\n')
    jp_modules = []
    module = None
    func_list = []
    with open('funcmap_jp.txt', 'r') as f_in:
        for line in f_in:
            m = mod_reg.match(line)
            if m:
                if module:
                    jp_modules.append((module, func_list))
                module = m.group(1)
                func_list = []
                continue
            m = func_reg.match(line)
            addr, label, name = m.groups()
            addr, label = int(addr, 16), None if label == 'None' else label
            func_list.append((addr, label, name, jp_addr[addr][2]))
    f_out = open('funcmap_jp_3.txt', 'w', buffering=1)
    for module, func_list in jp_modules:  # For each module
        print(f'\r{module} 0', end='')
        count = 0
        func_map = defaultdict(list)  # Maps addresses to [(dist, name)]
        f_out.write(f'{module}\n')
        for addr, _, _, size in func_list:  # For each function
            jp_instrs = read_func(addr, size, jp_f)
            for func_name in modmap[module]:  # Calculate distance between it and all US functions
                us_instrs = read_func(us_labels[func_name][1], us_labels[func_name][2], us_f)
                dist = edit_distance(jp_instrs, us_instrs)
                func_map[addr].append((dist, func_name))
            func_map[addr].sort()
            count += 1
            print(f'\r{module} {count}', end='')
        print(f'\r{module} {count}')
        pool = modmap[module] #- {name for _, _, name, _ in func_list}
        for addr, label, name, _ in func_list:
            if True or label is None or label != module:
                for dist, name in func_map[addr]:  # Keep looking for a good match
                    if name in pool:
                        pool.discard(name)
                        if name.startswith('sub_'):
                            name = f'sub_{addr:08X}_jp'
                        break
                else:
                    name = f'sub_{addr:08X}'

            f_out.write(f'{addr:08x} {module} {name}\n')
    f_out.close()


def find_anomalies():
    addr_map = {}  # Maps addresses to (label, name) tuples
    mod_map = defaultdict(list)  # Maps module names to list of addresses
    reg = re.compile(r'([\da-f]{8}) (.+) (.+)\r?\n')
    with open('modmap.txt', 'r') as f:
        for line in f:
            addr, label, name = reg.match(line).groups()
            addr = int(addr, 16)
            if label == 'None':
                label = None
            addr_map[addr] = label, name
            if label:
                mod_map[label].append(addr)
    dev_map = defaultdict(dict)
    count = 0
    print(f'Remove {count} outliers', end='')
    for label, items in mod_map.items():
        label_mean = mean(items)
        if len(items) == 1:
            label_dev = float('inf')
        else:
            label_dev = stdev(items)
        for item in items:
            dev_map[label][item] = abs(item-label_mean)/label_dev
            if dev_map[label][item] > 2:
                count += 1
                print(f'\rRemove {count} outliers', end='')
                addr_map[item] = None, f'sub_{item:08X}'
    print(f'\rRemove {count} outliers')
    with open('modmap2.txt', 'w') as f:
        for addr, (label, name) in sorted(addr_map.items()):
            f.write(f'{addr:08x} {label} {name}\n')


def read_funcmap(path):  # Read funcmap
    addr_map = {}
    reg = re.compile(r'([\da-fA-F]{8}) (.+) (.+)\r?\n')
    with open(path, 'r') as f:
        for line in f:
            m = reg.match(line)
            if m is None:
                continue
            addr, module, name = m.groups()
            addr, module = int(addr, 16), None if module == 'None' else module
            addr_map[addr] = (module, name)
    return addr_map


def read_config(path):  # Read config file
    addr_map = {}
    arm_funcs = set()
    func_re = re.compile(r'(thumb_func|arm_func)\s+(0x[\da-fA-F]{7,8})(?:\s+(\S+)\r?\n)?')
    mod_re = re.compile(r'#\s+(\S+)\r?\n')  # Matches module names
    module = None
    with open(path, 'r') as f:
        for line in f:
            m = func_re.match(line)
            if m:
                func_type, addr, name = m.groups()
                addr = int(addr, 16)
                name = name if name else f'sub_{addr:07X}'
                if func_type == 'arm_func':
                    arm_funcs.add(addr)
                addr_map[addr] = (module, name)
                continue
            m = mod_re.match(line)
            if m:
                module = m.group(1)
    return addr_map, arm_funcs


def write_config(map_path, cfg_path, out):  # Write config data
    modmap = read_funcmap(map_path)
    cfgmap, arm_funcs = read_config(cfg_path)
    for addr in cfgmap:
        if addr not in modmap:
            modmap[addr] = cfgmap[addr]
            # print(f'{addr:08x} {cfgmap[addr][0]} {cfgmap[addr][1]}')
    last_module = None
    unk_re = re.compile(r'sub_([\da-fA-F]{7,8})')
    with open(out, 'w') as f:
        for addr in sorted(modmap):
            module, name = modmap[addr]
            if module != last_module:
                f.write(f'# {module}\n')
                last_module = module
            func_type = 'arm_func' if addr in arm_funcs else 'thumb_func'
            if unk_re.match(name):
                name = ''
            else:
                name = ' ' + name
            f.write(f'{func_type} 0x{addr:07x}{name}\n')


def compare():
    us_addr = read_funcmap('funcmap_us.txt')
    jp_addr = read_funcmap('funcmap_jp.txt')
    jp_names = {name: (label, addr) for addr, (label, name) in jp_addr.items()}
    us_only = {}
    print('US only:')
    out = open('exclusive.txt', 'w')
    out.write('US only:\n')
    for addr, (label, name) in us_addr.items():
        if not name.startswith('sub_') and name not in jp_names:
            us_only[addr] = (label, name)
            print(f'{addr:08x} {label} {name}')
            out.write(f'{addr:08x} {label} {name}\n')
    print('JP only:')
    out.write('JP only:\n')
    for addr, (label, name) in jp_addr.items():
        if name.startswith('sub_') and name[-2:] != 'jp':
            print(f'{addr:08x} {label} {name}')
            out.write(f'{addr:08x} {label} {name}\n')
    out.close()


def sequence(path):  # Write the sequence of functions to a file, for diffing
    unk_re = re.compile(r'sub_([\da-fA-F]{7,8})')
    with open('funcs.txt', 'w') as f_out:
        func_map = read_funcmap(path)
        for addr in sorted(func_map):
            _, name = func_map[addr]
            if unk_re.match(name):
                name = '<unk>'
            f_out.write(name + '\n')


def disasmfix(path):  # Fix gbadisasm output
    func_re = re.compile(r'\s+(ARM_FUNC_START|THUMB_FUNC_START)\s+(\S+)\r?\n')
    func = is_arm = None
    with open(path, 'r') as f_in, open(path+'.temp', 'w') as f_out:
        lines = [line for line in f_in]
        f_out.write(ASM_HEADER)  # Write header to start of ROM
        for i, line in enumerate(lines):
            m = func_re.match(line)
            if m is None:
                if i+1 < len(lines) and line in ('\r\n', '\n'):
                    next_line = lines[i+1]
                    if func_re.match(next_line) and func:
                        f_out.write(f'\t{"arm" if is_arm else "thumb"}_func_end {func}\n\n')
                        func = None
                    else:
                        f_out.write(line)
                else:
                    f_out.write(line)
                continue
            line = line.replace('ARM_FUNC_START', 'arm_func_start')
            line = line.replace('THUMB_FUNC_START', 'thumb_func_start')
            if func:
                f_out.write(f'\t{"arm" if is_arm else "thumb"}_func_end {func}\n\n')
            func_type, func = m.groups()
            is_arm = func_type == 'ARM_FUNC_START'
            f_out.write(line)
    os.replace(path+'.temp', path)


ASM_HEADER = '.include "asm/macros.inc"\n.include "constants/constants.inc"\n.text\n.syntax unified\n\n'


def splitrom(asm_path, cfg_path):  # Splits a rom file into modules
    addr_map, _ = read_config(cfg_path)
    module = mod_f = None
    unk_count = 0
    start_re = re.compile(r'\s+(arm_func_start|thumb_func_start)\s+(\S+)\r?\n')
    addr_re = re.compile(r'(\S+): @ 0x([\da-fA-F]{7,8})\r?\n')
    log = open('load_order.txt', 'w')
    with open(os.path.join(asm_path, 'rom.s'), 'r') as f:
        for line in f:
            m = start_re.match(line)
            if m:  # New function, read the next line for the address
                line2 = next(f)
                m = addr_re.match(line2)
                if m is None:
                    raise Exception(f'Expected function address after: {line}')
                addr = int(m.group(2), 16)
                new_module = addr_map[addr][0] if addr in addr_map else module
                if new_module != module:  # Open a new file, and write the header
                    if mod_f:  # Close the current file, if applicable
                        mod_f.close()
                    module = new_module
                    if module is None:  # Open a new unknown module
                        print(f'unk{unk_count}.s')
                        log.write(f'asm/unk{unk_count}.o(.text);\n')
                        mod_f = open(os.path.join(asm_path, f'unk{unk_count}.s'), 'w')
                        unk_count += 1
                    else:
                        print(module)
                        log.write(f'asm/{module[:-1]}o(.text);\n')
                        mod_f = open(os.path.join(asm_path, module), 'w')
                    mod_f.write(ASM_HEADER)
                mod_f.write(line)
                mod_f.write(line2)
            else:  # Any other line
                if mod_f is None:  # Open a fresh unknown file
                    print(f'unk{unk_count}.s')
                    log.write(f'asm/unk{unk_count}.o(.text);\n')
                    mod_f = open(os.path.join(asm_path, f'unk{unk_count}.s'), 'w')
                    unk_count += 1
                mod_f.write(line)
    if mod_f:
        mod_f.close()
    log.close()


if __name__ == '__main__':
    # us_asm = glob.glob(os.path.join('..', 'pokeemerald', 'build', 'emerald', 'src', '*.s'))
    # us_asm += glob.glob(os.path.join('..', 'pokeemerald', 'asm', '*.s'))
    # first_funcs = us_first_funcs(us_asm)
    # us_symbols = elf_funcs('../pokeemerald/pokeemerald.elf', None)
    # us_labels = label_funcs(us_symbols, first_funcs)
    # jp_symbols = elf_funcs('pokeemerald_jp.elf', None)
    # jp_labels = label_jp(jp_symbols, us_labels)
    # jp_addr = {addr: (label, name, size) for name, (label, addr, size) in jp_labels.items()}
    # with open('pokeemerald_jp.gba', 'rb') as jp_f, open('../pokeemerald/pokeemerald.gba', 'rb') as us_f:
    #     modularize(jp_addr, us_labels, jp_f, us_f)
    # write_config('funcmap_jp.txt', 'pokeemerald_jp.cfg', 'pokeemerald_jp.cfg')
    # disasmfix('asm/rom.s')
    splitrom('asm', 'pokeemerald_jp.cfg')
