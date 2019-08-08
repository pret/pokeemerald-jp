#!/bin/bash

OBJDUMP="tools/binutils/bin/arm-none-eabi-objdump -D -bbinary -marmv4t -Mforce-thumb"
OPTIONS="--start-address=$(($1)) --stop-address=$(($1 + $2))"
$OBJDUMP $OPTIONS baserom_jp.gba > baserom_jp.dump
$OBJDUMP $OPTIONS pokeemerald_jp.gba > pokeemerald_jp.dump
diff -u baserom_jp.dump pokeemerald_jp.dump | less
