""" Renames functions in the config when they are renamed in the .s"""
import re
import os
from collections import defaultdict


config_path = 'pokeemerald_jp.cfg'
asm_path = os.path.join('asm', 'rom.s')


def update_config(asm_path, config_path):  # Find and replace all renamed functions
    addresses = {}  # Maps integer addresses to function names
    asm_exp = re.compile(r'(?!sub_)(\w+): @ (0x[\da-fA-F]+)')  # Ignore unknown functions
    cfg_exp = re.compile(r'(thumb_func|arm_func) (0x[\da-fA-F]+)\r?\n')
    with open(asm_path, 'r') as f:  # Gather functions
        count = 0
        print('Found 0 named functions.', end='', flush=True)
        for i, line in enumerate(f, 1):
            m = asm_exp.match(line)
            if m:
                addresses[int(m.group(2), 16)] = m.group(1)
                count += 1
                if count % 100 == 0:
                    print(f'\rFound {count} named functions', end='')
        print(f'\rFound {count} named functions')
    with open(config_path, 'r') as f_in, open(config_path+'.new', 'w') as f_out:
        replaced = 0
        print('New:')
        for i, line in enumerate(f_in, 1):  # Replace functions in config
            m = cfg_exp.fullmatch(line)
            if m:
                func, addr = m.group(1), int(m.group(2), 16)
                if addr in addresses:
                    line = f'{func} {m.group(2)} {addresses[addr]}\n'
                    print(line[:-1])
                    replaced += 1
            f_out.write(line)
    os.replace(config_path+'.new', config_path)


def check_dups(config_path):  # Find duplicate names
    func_exp = re.compile(r'(thumb_func|arm_func) (0x[\da-fA-F]+)\s+(\w+)\r?\n')
    symbols = {}  # Maps names to addresses
    dups = defaultdict(set)
    with open(config_path, 'r') as f:
        for line in f:
            m = func_exp.match(line)
            if m is None:
                continue
            addr, name = int(m.group(2), 16), m.group(3)
            if name in symbols:
                dups[name].add(addr)
                dups[name].add(symbols[name])
            symbols[name] = addr
    for name, addrs in dups.items():
        print(f'{name} at {{{", ".join("%08x" % x for x in addrs)}}}')


if __name__ == '__main__':
    update_config(asm_path, config_path)
    print('Find duplicates:')
    check_dups(config_path)
