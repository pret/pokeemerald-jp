# How graph_search.py works
The basic rationale behind this is that a lot of JP Emerald's code is identical to US Emerald's, it just has different offsets. Therefore, trying to match functions automatically so that they can be renamed to their equivalents is doable.

> Note: An "unknown function" is any function whose name looks like sub_XXXXXXXX, where X is simply the memory address of the function.

## Setup
1. Read all unknown functions in JP from the JP ELF file. Create a map from function names to (address, size) tuples.
2. Read all functions in US from the US ELF file. Create a map from function names to (address, size) tuples.
3. Build an "instruction graph" of US functions whose vertices are instructions (as `u16`'s), and whose edges take you to their following instructions anywhere in the ROM, along with the memory address of each transition.'

## The Instruction Graph
Imagine you had a ROM that consisted of only two instructions:
```
0 MOV r0,#0
2 BX LR
```
The instruction graph maps instr1 -> instr2 -> {set of places where i2 follows i1}. Thus, it would look like this:

`(MOV r0,#0) -> {(BX LR) -> {2}}`

There is also an additional "null" vertex, whose edges map to every instruction in the ROM along with the set of each location that instruction occurs:

`NULL -> {(MOV r0,#0) -> {0}, (BX LR) -> {2}}`

This means that, any given sequence in the ROM can be traced through the graph, by starting at the starting instruction and making sure to only follow transitions with consecutive memory addresses

## Matching (First Pass)
With the graph built, we're ready to begin renaming.

Repeatedly, do the following:
1. Pick a random unknown JP function.
2. Using its address and size, grab its instruction sequence (as `u16`'s' from the JP ROM)
> Note: Address 0x08XXXXXX is located at offset XXXXXX in the .gba file.

3. Truncate the sequence to the last `BX lr`, `BX r0`, or `BX r1`. This makes matching easier since it matches only the code and not any data that may follow the function.
4. Take the first instruction, and search the US graph, looking for a valid path that exactly matches the sequence.
5. If the sequence is matched exactly, *and* only occurs once in all of the US ROM, it is safe to rename the unknown JP function to the known US function's name.

Note that this matching is conservative--there are many functions it will not match, either because data following them contains the same bytes as a return, or because the function contains some data (like addresses of global variables) not constant across versions.

This first pass matches around ~2000 functions.

## Matching (Later passes)
While the first pass is deterministic, we can match even more functions using a slightly different method. After the setup is performed, we repeatedly do the following:
1. Pick a random unknown JP function and grab its instruction sequence.
2. Instead of looking only for 1-to-1, full-sequence matches in US, take *all* of the locations that matched at least the first instruction, no matter how short. Let this be the "potential" set.
3. Pick 5-10 random "slices" through the instruction sequence. The point of the randomness is to hopefully get lucky and avoid the parts of the function that differ between versions.
4. For each slice, search the graph for all possible matches, even if they only match the first instruction of the slice.
> Note: Locations must always represent the start of a function, so when getting the matches for the slice, each returned location has twice the start of the slice subtracted from it. I.e, if the slice is [4, 6), all of the matched locations have 2*4 subtracted so that they represent the start of a function.

5. Set potential to the intersection of itself and this new location set.
6. If the size of potential becomes 1, we have eliminated all but one location for the unknown function, and can then rename it.
7. If the size becomes 0, we either were unlucky with our slices, or the function simply does not have a US counterpart. In either case, move on.

The idea of this is to initially take all the possible places the start of the function could match, and narrow it down by looking at all the possible places a slice could match and taking the intersection.

These subsequent passes match around ~6000 functions, and seemingly do so quite accurately, i.e, everything seems to line up with the expected order of US Emerald.

## Renaming
This is fairly simple, a script takes a list of old names and new names, reads the entire `rom.s` file into memory, and does string replacements on each pair. It then writes the entire file back.

There is one caveat: it wouldn't be very useful to rename an unknown JP function to an unknown US function, and their memory addresses might be different! So the program simply skips renaming to these unknown names and leaves them be.

The program also will not rename a function to a name that already exists in JP. It does this by reading *known* JP functions from the ELF file and subtracting this set of names from the set of known US functions or "pool".
