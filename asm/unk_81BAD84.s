.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081BAA20
sub_081BAA20: @ 0x081BAA20
	push {r4, r5, r6, lr}
	movs r6, #0x80
	lsls r6, r6, #0x13
	movs r2, #0
	strh r2, [r6]
	ldr r1, _081BAA7C
	strh r2, [r1]
	adds r1, #2
	strh r2, [r1]
	adds r1, #0x3e
	strh r2, [r1]
	ldr r5, _081BAA80
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _081BAA84
	bl LZ77UnCompVram
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r4, #0
	bl CpuSet
	ldr r1, _081BAA88
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	strh r4, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BAA7C: .4byte 0x04000010
_081BAA80: .4byte 0x085E72E4
_081BAA84: .4byte 0x0600F800
_081BAA88: .4byte 0x04000008
	thumb_func_end sub_081BAA20

