.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CreateInvisibleSpriteWithCallback
CreateInvisibleSpriteWithCallback: @ 0x0806F0C4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0806F0F8
	movs r1, #0xf8
	movs r2, #0xa8
	movs r3, #0xe
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0806F0FC
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, r2, r5
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r4, #4
	orrs r1, r4
	strb r1, [r3]
	adds r5, #0x1c
	adds r2, r2, r5
	str r6, [r2]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806F0F8: .4byte 0x082FAD34
_0806F0FC: .4byte 0x020205AC
	thumb_func_end CreateInvisibleSpriteWithCallback

	thumb_func_start StoreWordInTwoHalfwords
StoreWordInTwoHalfwords: @ 0x0806F100
	strh r1, [r0]
	lsrs r1, r1, #0x10
	strh r1, [r0, #2]
	bx lr
	thumb_func_end StoreWordInTwoHalfwords

	thumb_func_start LoadWordFromTwoHalfwords
LoadWordFromTwoHalfwords: @ 0x0806F108
	ldrh r2, [r0]
	movs r3, #2
	ldrsh r0, [r0, r3]
	lsls r0, r0, #0x10
	orrs r2, r0
	str r2, [r1]
	bx lr
	.align 2, 0
	thumb_func_end LoadWordFromTwoHalfwords

	thumb_func_start SetBgAffineStruct
SetBgAffineStruct: @ 0x0806F118
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	mov r8, r7
	str r1, [r0]
	str r2, [r0, #4]
	strh r3, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r6, [r0, #0xe]
	mov r1, r8
	strh r1, [r0, #0x10]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetBgAffineStruct

	thumb_func_start DoBgAffineSet
DoBgAffineSet: @ 0x0806F144
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x24
	mov r8, r0
	ldr r0, [sp, #0x38]
	ldr r4, [sp, #0x3c]
	ldr r5, [sp, #0x40]
	ldr r6, [sp, #0x44]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp, #8]
	str r6, [sp, #0xc]
	add r0, sp, #0x10
	bl SetBgAffineStruct
	add r0, sp, #0x10
	mov r1, r8
	movs r2, #1
	bl BgAffineSet
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DoBgAffineSet

	thumb_func_start CopySpriteTiles
CopySpriteTiles: @ 0x0806F190
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	str r2, [sp, #0x20]
	adds r4, r3, #0
	ldr r7, [sp, #0x58]
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _0806F1C0
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x15
	adds r1, r1, r0
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp, #0x24]
	adds r1, r1, r2
	ldrb r1, [r1]
	str r1, [sp, #0x28]
	movs r0, #0
	b _0806F310
	.align 2, 0
_0806F1C0: .4byte 0x082FAD4C
_0806F1C4:
	movs r5, #0
	adds r0, #1
	str r0, [sp, #0x30]
	b _0806F2F8
_0806F1CC:
	ldrh r0, [r4]
	ldr r2, _0806F204
	adds r1, r2, #0
	ands r1, r0
	lsls r1, r1, #5
	mov r8, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	ands r1, r0
	mov r2, sp
	strh r0, [r2, #0x34]
	cmp r1, #0
	bne _0806F20C
	ldr r0, [sp, #0x20]
	add r0, r8
	adds r1, r7, #0
	ldr r2, _0806F208
	bl CpuSet
	adds r4, #2
	str r4, [sp, #0x2c]
	adds r7, #0x20
	mov sl, r7
	adds r5, #1
	mov sb, r5
	b _0806F2EE
	.align 2, 0
_0806F204: .4byte 0x000003FF
_0806F208: .4byte 0x04000008
_0806F20C:
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	bne _0806F250
	movs r1, #0
	adds r4, #2
	str r4, [sp, #0x2c]
	movs r2, #0x20
	adds r2, r2, r7
	mov sl, r2
	adds r5, #1
	mov sb, r5
_0806F224:
	lsls r4, r1, #0x18
	asrs r4, r4, #0x18
	movs r0, #7
	subs r0, r0, r4
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [sp, #0x20]
	adds r0, r1, r0
	lsls r1, r4, #2
	adds r1, r7, r1
	ldr r2, _0806F24C
	bl CpuSet
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r1, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, #7
	ble _0806F224
	b _0806F2EE
	.align 2, 0
_0806F24C: .4byte 0x04000001
_0806F250:
	movs r1, #0
	adds r4, #2
	str r4, [sp, #0x2c]
	movs r2, #0x20
	adds r2, r2, r7
	mov sl, r2
	adds r5, #1
	mov sb, r5
	movs r0, #0xf
	mov ip, r0
_0806F264:
	movs r2, #0
	lsls r4, r1, #0x18
	lsls r0, r4, #2
	lsrs r0, r0, #0x18
	adds r6, r0, #3
	mov r1, r8
	adds r5, r1, r0
_0806F272:
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	subs r0, r6, r1
	mov r2, sp
	adds r3, r2, r0
	adds r0, r5, r1
	ldr r2, [sp, #0x20]
	adds r0, r2, r0
	ldrb r2, [r0]
	mov r0, ip
	ands r0, r2
	lsls r0, r0, #4
	lsrs r2, r2, #4
	orrs r0, r2
	strb r0, [r3]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #3
	ble _0806F272
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r4, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	ble _0806F264
	mov r2, sp
	ldrh r0, [r2, #0x34]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r0, r2
	cmp r0, #0
	beq _0806F2E4
	movs r1, #0
_0806F2BA:
	lsls r4, r1, #0x18
	asrs r4, r4, #0x18
	movs r0, #7
	subs r0, r0, r4
	lsls r0, r0, #2
	add r0, sp
	lsls r1, r4, #2
	adds r1, r7, r1
	ldr r2, _0806F2E0
	bl CpuSet
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r1, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, #7
	ble _0806F2BA
	b _0806F2EE
	.align 2, 0
_0806F2E0: .4byte 0x04000001
_0806F2E4:
	mov r0, sp
	adds r1, r7, #0
	ldr r2, _0806F328
	bl CpuSet
_0806F2EE:
	ldr r4, [sp, #0x2c]
	mov r7, sl
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
_0806F2F8:
	ldr r2, [sp, #0x28]
	cmp r5, r2
	bhs _0806F300
	b _0806F1CC
_0806F300:
	movs r0, #0x20
	ldr r1, [sp, #0x28]
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r2, [sp, #0x30]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
_0806F310:
	ldr r1, [sp, #0x24]
	cmp r0, r1
	bhs _0806F318
	b _0806F1C4
_0806F318:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F328: .4byte 0x04000008
	thumb_func_end CopySpriteTiles

	thumb_func_start CountTrailingZeroBits
CountTrailingZeroBits: @ 0x0806F32C
	push {lr}
	adds r2, r0, #0
	movs r1, #0
	movs r3, #1
_0806F334:
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	beq _0806F340
	adds r0, r1, #0
	b _0806F34E
_0806F340:
	lsrs r2, r2, #1
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1f
	bls _0806F334
	movs r0, #0
_0806F34E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CountTrailingZeroBits

	thumb_func_start CalcCRC16
CalcCRC16: @ 0x0806F354
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r2, _0806F384
	movs r3, #0
	cmp r3, r4
	bge _0806F3A0
	movs r6, #1
	ldr r0, _0806F388
	adds r5, r0, #0
_0806F368:
	adds r0, r7, r3
	ldrb r0, [r0]
	eors r2, r0
	movs r1, #0
	adds r3, #1
_0806F372:
	adds r0, r2, #0
	ands r0, r6
	cmp r0, #0
	beq _0806F38C
	lsrs r0, r2, #1
	eors r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _0806F38E
	.align 2, 0
_0806F384: .4byte 0x00001121
_0806F388: .4byte 0x00008408
_0806F38C:
	lsrs r2, r2, #1
_0806F38E:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #7
	bls _0806F372
	lsls r0, r3, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blt _0806F368
_0806F3A0:
	mvns r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end CalcCRC16

	thumb_func_start CalcCRC16WithTable
CalcCRC16WithTable: @ 0x0806F3AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, _0806F3E8
	movs r3, #0
	cmp r3, r4
	bhs _0806F3DA
	ldr r6, _0806F3EC
_0806F3BC:
	lsrs r1, r2, #8
	adds r0, r5, r3
	ldrb r0, [r0]
	eors r2, r0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r2, r0, #0
	eors r2, r1
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blo _0806F3BC
_0806F3DA:
	mvns r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806F3E8: .4byte 0x00001121
_0806F3EC: .4byte 0x082FAD64
	thumb_func_end CalcCRC16WithTable

	thumb_func_start CalcByteArraySum
CalcByteArraySum: @ 0x0806F3F0
	push {r4, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r2, #0
	cmp r3, r1
	bhs _0806F408
_0806F3FC:
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r3, r3, r0
	adds r2, #1
	cmp r2, r1
	blo _0806F3FC
_0806F408:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CalcByteArraySum

	thumb_func_start BlendPalette
BlendPalette: @ 0x0806F410
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	mov r0, sp
	strh r3, [r0]
	movs r6, #0
	cmp r6, ip
	bhs _0806F496
	ldr r0, _0806F4A8
	mov sl, r0
	ldr r1, _0806F4AC
	mov sb, r1
_0806F43E:
	mov r0, r8
	adds r5, r6, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0xf
	mov r1, sl
	adds r0, r5, r1
	ldr r3, [r0]
	lsls r4, r3, #0x1b
	lsls r2, r3, #0x16
	lsls r3, r3, #0x11
	add r5, sb
	lsrs r4, r4, #0x1b
	ldr r1, [sp]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1b
	subs r0, r0, r4
	muls r0, r7, r0
	asrs r0, r0, #4
	adds r4, r4, r0
	lsrs r2, r2, #0x1b
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1b
	subs r0, r0, r2
	muls r0, r7, r0
	asrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #5
	orrs r4, r2
	lsrs r3, r3, #0x1b
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	subs r1, r1, r3
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #0xa
	orrs r4, r3
	strh r4, [r5]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, ip
	blo _0806F43E
_0806F496:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F4A8: .4byte 0x020373B4
_0806F4AC: .4byte 0x020377B4
	thumb_func_end BlendPalette

