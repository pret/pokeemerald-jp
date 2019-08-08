.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Random
Random: @ 0x0806F050
	ldr r2, _0806F06C
	ldr r1, [r2]
	ldr r0, _0806F070
	muls r0, r1, r0
	ldr r1, _0806F074
	adds r0, r0, r1
	str r0, [r2]
	ldr r2, _0806F078
	ldr r1, [r2]
	adds r1, #1
	str r1, [r2]
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0806F06C: .4byte 0x03005AE0
_0806F070: .4byte 0x41C64E6D
_0806F074: .4byte 0x00006073
_0806F078: .4byte 0x02024664
	thumb_func_end Random

	thumb_func_start SeedRng
SeedRng: @ 0x0806F07C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0806F08C
	str r0, [r1]
	ldr r1, _0806F090
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0806F08C: .4byte 0x03005AE0
_0806F090: .4byte 0x02024660
	thumb_func_end SeedRng

	thumb_func_start SeedRng2
SeedRng2: @ 0x0806F094
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0806F0A0
	str r0, [r1]
	bx lr
	.align 2, 0
_0806F0A0: .4byte 0x03005AE4
	thumb_func_end SeedRng2

	thumb_func_start Random2
Random2: @ 0x0806F0A4
	ldr r2, _0806F0B8
	ldr r1, [r2]
	ldr r0, _0806F0BC
	muls r0, r1, r0
	ldr r1, _0806F0C0
	adds r0, r0, r1
	str r0, [r2]
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0806F0B8: .4byte 0x03005AE4
_0806F0BC: .4byte 0x41C64E6D
_0806F0C0: .4byte 0x00006073
	thumb_func_end Random2

