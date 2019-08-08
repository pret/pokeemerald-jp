AS := tools/binutils/bin/arm-none-eabi-as
LD := tools/binutils/bin/arm-none-eabi-ld
OBJCOPY := tools/binutils/bin/arm-none-eabi-objcopy
SHA1SUM := sha1sum -c
GBAFIX := tools/gbafix/gbafix

ASFLAGS := -mcpu=arm7tdmi

ASFILE := $(wildcard asm/*.s data/*.s)
OBJFILE := $(ASFILE:.s=.o)
NAME := pokeemerald_jp
ROM := $(NAME).gba
ELF := $(NAME).elf
TITLE := POKEMON EMER
GAMECODE := BPEJ

.PHONY: all compare clean

all: $(ROM)

compare: $(ROM)
	$(SHA1SUM) rom_jp.sha1

rename: search compare

search:
	python3 graph_search.py
	python3 update_config.py

clean:
	rm -f $(ROM) $(ELF) $(OBJFILE)

$(ROM): $(ELF)
	$(OBJCOPY) -O binary $< $@

$(ELF): %.elf: $(OBJFILE) ld_script_jp.txt
	$(LD) -T ld_script_jp.txt -Map $*.map -o $@ $(OBJFILE) -L tools/agbcc/lib -lgcc -lc
	$(GBAFIX) -t"$(TITLE)" -c$(GAMECODE) -m01 --silent $@

$(OBJFILE): %.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<
