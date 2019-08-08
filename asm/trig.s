.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Sin
Sin: @ 0x0806EFB8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0806EFD0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0806EFD0: .4byte 0x082FA8CC
	thumb_func_end Sin

	thumb_func_start Cos
Cos: @ 0x0806EFD4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0806EFF0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	adds r0, #0x80
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0806EFF0: .4byte 0x082FA8CC
	thumb_func_end Cos

	thumb_func_start Sin2
Sin2: @ 0x0806EFF4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r5, #0
	movs r1, #0xb4
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0xb4
	bl __udivsi3
	movs r1, #1
	ands r0, r1
	ldr r1, _0806F028
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	cmp r0, #0
	bne _0806F02C
	lsls r0, r1, #0x10
	b _0806F030
	.align 2, 0
_0806F028: .4byte 0x082FAB4C
_0806F02C:
	lsls r0, r1, #0x10
	rsbs r0, r0, #0
_0806F030:
	asrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end Sin2

	thumb_func_start Cos2
Cos2: @ 0x0806F038
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xb4
	lsls r1, r1, #0xf
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end Cos2

