import re
import os
import struct
import subprocess
import random
from collections import defaultdict
from typing import List, Dict, Tuple, Set

US_PATH = '../pokeemerald'


def elf_funcs(elf_path: str, unknown=True) -> Dict[str, Tuple[int, int]]:  # Find all functions in an ELF file
    p = subprocess.run(f'readelf -s -W {elf_path}', stdout=subprocess.PIPE, encoding='utf-8',
                       shell=True)
    lines = p.stdout.split('\n')
    elf_reg = re.compile(r'\s*\d+:\s([a-fA-F0-9]{8})\s+(\d+)\s+(\w+)\s+(\w+)\s+(\w+)\s+(\w+)\s+(\w+)')
    symbols = {}  # Map function names to (address, size tuples)
    for line in lines:
        m = elf_reg.match(line)
        if m and m.group(3) == 'FUNC':  # Collect functions
            addr, size, dtype, bind, vis, ndx, name = m.groups()
            is_unknown = name[:4] == 'sub_'
            if unknown is not None and is_unknown != unknown:
                continue
            addr = int(addr, 16)
            size = int(size)
            symbols[name] = (addr-1, size)
    if unknown is True:
        unk_str = 'unknown '
    elif unknown is False:
        unk_str = 'known '
    else:
        unk_str = ''
    print(f'Found {len(symbols)} {unk_str}functions')
    return symbols


# Builds an "instruction graph"
# Maps instructions to a dictionary
# That dictionary maps following instructions, to the places they follow at
# So if you have:
# 0 MOV r0, r1
# 2 BX lr
# {(MOV r0, r1): {(BX lr): {2}}}
def build_graph(rom: str, symbols: Dict[str, Tuple[int, int]]) -> Dict[int, Dict[int, Set[int]]]:
    graph = defaultdict(lambda: defaultdict(set))
    with open(rom, 'rb') as f:
        count = 0
        print('Graphed 0 functions', end='')
        for name, (addr, size) in symbols.items():
            f.seek(addr & 0xfffffe)
            data = f.read(size)
            instrs = [t[0] for t in struct.iter_unpack('<H', data)]  # Unpack instructions as ints
            assert len(instrs) == size // 2
            last = None
            for i, instr in enumerate(instrs):
                cursor = addr + 2*i  # Address of current instruction
                graph[last][instr].add(cursor)
                graph[None][instr].add(cursor)
                last = instr
            count += 1
            if count % 100 == 0:
                pass
                print(f'\rGraphed {count} functions', end='')
            if not size:
                continue
            last = None
            for i, instr in enumerate(instrs):
                curr = addr + 2*i
                positions = graph[last][instr]
                assert curr in positions
                last = instr
        print(f'\rGraphed {count} functions')
    return graph


def calc_sizes(map_path: str) -> Dict[int, int]:  # Calculate the size of *addresses*. Crude asf
    with open(map_path, 'r') as f:
        lines = list(line for line in f)
    sizes = {}  # Maps addresses to their sizes
    reg = re.compile(r'\s*(0x[\da-fA-F]+)')
    for l1, l2 in zip(lines[:-1], lines[1:]):
        m1 = reg.match(l1)
        if not m1:
            continue
        m2 = reg.match(l2)
        if not m2:
            continue
        addr1, addr2 = int(m1.group(1), 16), int(m2.group(1), 16)
        if not addr1 & 0xff000000 == addr2 & 0xff000000 == 0x08000000:  # Only pay attention to ROM addresses
            continue
        size = addr2 - addr1
        sizes[addr1] = size
    return sizes


def asm_funcs(asm_path: str, sizes: Dict[int, int], unknown=True) -> Dict[str, Tuple[int, int]]:
    reg = re.compile(r'(\w+): @ (0x[\da-fA-F]+)')
    symbols = {}  # Maps names to (address, size) tuples
    with open(asm_path, 'r') as f:
        for line in f:
            m = reg.match(line)
            if m:
                is_unknown = m.group(1).startswith('sub_')
                if unknown != is_unknown:  # Only want certain functions
                    continue
                addr = int(m.group(2), 16)
                if addr not in sizes:
                    continue
                symbols[m.group(1)] = (addr, sizes[addr])
    print(f'Found {len(symbols)} {"unknown" if unknown else "known"} JP functions')
    return symbols


def match_instrs(instrs: List[int], graph):  # Match a sequence of instructions
    matches = []
    if not instrs:
        return []
    for base in graph[None][instrs[0]]:
        last = instrs[0]
        # print(f'Try: {base:08x}')
        match_len = 1
        for match_len, instr in enumerate(instrs[1:], 1):
            addr = base + 2*match_len
            potential = graph[last][instr]
            # print(f'{instr:04x} {addr:08x} {not sequence_break}')
            if addr not in potential:  # Sequence is broken
                break
            last = instr
        matches.append((match_len, base))
    matches.sort(reverse=True)  # Get the best match
    if len(instrs) >= 10 and matches and len(instrs)-1 == matches[0][0]:  # Perfect match
        if not any(t[0] == matches[0][0] for t in matches[1:]):  # No other perfect matches
            return matches[:1]
    return matches


def decode(instrs: List[int]):  # Primitive, unfinished THUMB decoder
    for op in instrs:
        print(f'{op:04x}', end=' ')
        if op & 0xf800 == 0x1800:  # Add/subtract
            opcode = (op >> 9) & 3
            codes = ('ADD', 'SUB', 'ADD', 'SUB')
            val = (op >> 6) & 7
            rs = (op >> 3) & 7
            rd = op & 7
            flag = 'r' if opcode < 2 else '#'
            print(f'{codes[opcode]} r{rd},r{rs},{flag}{val}')
        elif op & 0xe000 == 0:  # Move shifted register
            opcode = (op >> 11) & 3
            codes = ('LSL', 'LSR', 'ASR')
            offset = (op >> 6) & 31
            rs = (op >> 3) & 7
            rd = op & 7
            print(f'{codes[opcode]} r{rd},r{rs},#{offset}')
        elif op & 0xe000 == 0x2000:  # Add/sub immediate
            opcode = (op >> 11) & 3
            codes = ('MOV', 'CMP', 'ADD', 'SUB')
            rd = (op >> 8) & 7
            nn = op & 255
            print(f'{codes[opcode]} r{rd},#{nn}')
        elif op & 0xfc00 == 0x4000:  # ALU ops
            opcode = (op >> 6) & 15
            codes = ('AND', 'EOR', 'LSL', 'LSR', 'ASR', 'ADC', 'SBC', 'ROR',
                     'TST', 'NEG', 'CMP', 'CMN', 'ORR', 'MUL', 'BIC', 'MVN')
            rs = (op >> 3) & 7
            rd = op & 7
            print(f'{codes[opcode]} r{rd}, r{rs}')
        elif op & 0xf800 == 0x4800:  # Load PC-relative
            r = (op >> 8) & 7
            print(f'LDR r{r} PC+{4*(op & 255)}')
        elif op & 0xf200 == 0x5200:  # Load register offset
            opcode = (op >> 10) & 3
            codes = ('STR', 'STB', 'LDR', 'LDB')
            ro = (op >> 6) & 7
            rb = (op >> 3) & 7
            rd = op & 7
            print(f'{codes[opcode]} r{rd},[r{rb},r{ro}]')
        elif op & 0xe000 == 0x6000:  # Load immediate offset
            opcode = (op >> 11) & 3
            codes = ('STR', 'LDR', 'STB', 'LDB')
            nn = (op >> 6) & 31
            if opcode < 2:
                nn *= 4
            rb = (op >> 3) & 7
            rd = op & 7
            print(f'{codes[opcode]} r{rd},[r{rb},#{nn}]')
        elif op & 0xfc00 == 0x4400:  # High register ops
            opcode = (op >> 8) & 3
            codes = ('ADD', 'CMP', 'MOV', 'NOP', 'BX')
            MSBd = (op >> 7) & 1
            MSBs = (op >> 6) & 1
            rs = (op >> 3) & 7
            rd = op & 7
            rs |= MSBs << 3
            rd += MSBd << 3
            if opcode == 3:
                flag = 'BLX' if MSBd else 'BX'
                print(f'{flag} r{rs}')
            else:
                print(f'{codes[opcode]} r{rd},r{rs}')
        else:
            print()


def match_iter(instrs, graph, slices=10):  # Iteratively try to find a match
    matches = match_instrs(instrs, graph)  # Try to match the entire sequence first
    if len(matches) == 1:  # One perfect match
        return matches[0][1]
    elif not matches:  # No match anywhere
        return None
    potential = {t[1] for t in matches}  # All potential matches
    for _ in range(slices):  # Slice the list randomly and search for matches
        start = random.randint(1, len(instrs))
        end = random.randint(1, len(instrs))
        if start == end:
            end += 1
        elif end < start:
            start, end = end, start
        matches = match_instrs(instrs[start:end], graph)
        min_len = max((end - start) // 2, 1)
        new_set = {t[1]-2*start for t in matches if t[0] >= min_len}
        potential = potential & new_set  # Take intersection of old and new locations
        if not potential:
            return None
        elif len(potential) == 1:
            addr = potential.pop()
            return addr
    return None


def match_loop(rom: str, unknown, known: dict, graph) -> Dict[str, str]:  # Interactive
    rv_known = {addr: name for name, (addr, size) in known.items()}
    print(f'Pool: {len(rv_known)}')
    keys = list(unknown.keys())
    random.shuffle(keys)
    unk_exp = re.compile(r'sub_[\dA-Fa-f]+')
    replace: Dict[str, str] = {}  # Maps old names to new names
    # print('At any time, type "quit" to quit and replace all correct names')
    match_count = 0
    print('Matched 0 functions', end='', flush=True)
    with open(rom, 'rb') as f:
        for name in keys:
            addr, size = unknown[name]
            if not size:
                continue
            f.seek(addr & 0xfffffe)
            data = f.read(size)
            instrs = [t[0] for t in struct.iter_unpack('<H', data)]
            for i in range(len(instrs)-1, -1, -1):  # Try to remove trailing 'data'
                if instrs[i] in (0x4770, 0x4700, 0x4708):  # BX lr, BX r0, BX r1
                    instrs = instrs[:i+1]
                    break
            # print(f'Trying {name} ({len(instrs)} instructions)')
            match = match_iter(instrs, graph)
            if match and match in rv_known:
                if unk_exp.match(rv_known[match]):  # Don't rename to an unknown function
                    continue
                replace[name] = rv_known[match]
                rv_known.pop(match)  # Remove the match from the pool
                match_count += 1
                if match_count % 10 == 0:
                    print(f'\rMatched {match_count} functions', end='')
                # print(f'Matched {name} ({addr:08x}) with {rv_known[match]} ({match:08x})')
                # try:
                #     command = input('Replace? (y/N): ')
                # except KeyboardInterrupt:
                #     command = 'N'
                # if 'quit' in command:
                #     break
                # elif command in ('y', 'Y'):
                #     replace[name] = rv_known[match]
    print(f'\rMatched {match_count} functions')
    return replace


def replace_names(asm_path: str, replace: Dict[str, str]):  # Replace lines
    with open(asm_path, 'r') as f_in:
        count = 0
        asm = f_in.read()  # Read in the entire file
        print(f'Replaced {count} names', end='', flush=True)
        for old_name, new_name in replace.items():
            asm = asm.replace(old_name, new_name)
            count += 1
            if count % 100 == 0:
                print(f'\rReplaced {count} names', end='')
        print(f'\rReplaced {count} names')
    with open(asm_path, 'w') as f_out:
        f_out.write(asm)


JP_MAP = 'pokeemeraldjp.map'
JP_ASM = os.path.join('asm', 'code.s')
US_ELF = os.path.join('..', 'pokeemerald', 'pokeemerald.elf')
US_ROM = os.path.join('..', 'pokeemerald', 'pokeemerald.gba')
JP_ROM = 'pokeemeraldjp.gba'
JP_ELF = 'pokeemerald_jp.elf'


if __name__ == '__main__':
    jp_unknown = elf_funcs(JP_ELF, True)
    us_funcs = elf_funcs(US_ELF, None)  # ALL functions, including unknown ones
    graph = build_graph(US_ROM, us_funcs)  # Build instruction graph
    replace = match_loop(JP_ROM, jp_unknown, us_funcs, graph)
    if replace:
        replace_names(JP_ASM, replace)
