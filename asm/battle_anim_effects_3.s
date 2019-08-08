.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0815A010
sub_0815A010: @ 0x0815A010
	push {lr}
	adds r2, r0, #0
	ldr r1, _0815A034
	ldrh r0, [r1]
	ldrh r3, [r2, #0x20]
	adds r0, r0, r3
	strh r0, [r2, #0x20]
	ldrh r0, [r1, #2]
	ldrh r3, [r2, #0x22]
	adds r0, r0, r3
	strh r0, [r2, #0x22]
	movs r3, #6
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _0815A038
	ldrh r0, [r1, #4]
	b _0815A03C
	.align 2, 0
_0815A034: .4byte 0x020380BE
_0815A038:
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
_0815A03C:
	strh r0, [r2, #0x2e]
	ldrh r0, [r1, #8]
	strh r0, [r2, #0x30]
	ldr r0, _0815A04C
	str r0, [r2, #0x1c]
	pop {r0}
	bx r0
	.align 2, 0
_0815A04C: .4byte 0x0815A051
	thumb_func_end sub_0815A010

	thumb_func_start sub_0815A050
sub_0815A050: @ 0x0815A050
	push {lr}
	adds r3, r0, #0
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	cmp r0, #0
	ble _0815A090
	ldrh r1, [r3, #0x32]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	strh r0, [r3, #0x24]
	ldrh r0, [r3, #0x2e]
	adds r1, r1, r0
	strh r1, [r3, #0x32]
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #0x30]
	subs r0, #1
	strh r0, [r3, #0x30]
	b _0815A096
_0815A090:
	adds r0, r3, #0
	bl DestroyAnimSprite
_0815A096:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0815A050

	thumb_func_start sub_0815A09C
sub_0815A09C: @ 0x0815A09C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _0815A0E8
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #8
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r4, r4, r0
	asrs r4, r4, #0x10
	ldrb r0, [r6]
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #8
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r1, r1, r0
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl sub_08074C24
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815A0E8: .4byte 0x020380D7
	thumb_func_end sub_0815A09C

	thumb_func_start sub_0815A0EC
sub_0815A0EC: @ 0x0815A0EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x5a
	strh r0, [r4, #0x2e]
	ldr r0, _0815A128
	str r0, [r4, #0x1c]
	movs r0, #7
	strh r0, [r4, #0x30]
	ldr r1, _0815A12C
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldrh r0, [r4, #0x30]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A128: .4byte 0x080A5D79
_0815A12C: .4byte 0x0815A131
	thumb_func_end sub_0815A0EC

	thumb_func_start sub_0815A130
sub_0815A130: @ 0x0815A130
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldrh r0, [r4, #0x30]
	subs r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0815A164
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0815A16C
	str r0, [r4, #0x1c]
_0815A164:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A16C: .4byte 0x0815A171
	thumb_func_end sub_0815A130

	thumb_func_start sub_0815A170
sub_0815A170: @ 0x0815A170
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0815A170

	thumb_func_start sub_0815A190
sub_0815A190: @ 0x0815A190
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0815A21C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r0, #0
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldrh r0, [r5, #0x20]
	subs r0, r0, r7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r5, #0x22]
	subs r1, r1, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2Neg
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0x17
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815A1EE
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0815A1EE:
	movs r3, #0x80
	lsls r3, r3, #1
	str r4, [sp]
	adds r0, r5, #0
	movs r1, #0
	adds r2, r3, #0
	bl TrySetSpriteRotScale
	ldr r0, _0815A220
	ldrh r0, [r0, #4]
	strh r0, [r5, #0x2e]
	strh r7, [r5, #0x32]
	strh r6, [r5, #0x36]
	ldr r0, _0815A224
	str r0, [r5, #0x1c]
	ldr r1, _0815A228
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815A21C: .4byte 0x020380D7
_0815A220: .4byte 0x020380BE
_0815A224: .4byte 0x080A67B5
_0815A228: .4byte 0x080A34C5
	thumb_func_end sub_0815A190

	thumb_func_start sub_0815A22C
sub_0815A22C: @ 0x0815A22C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #4
	strh r0, [r4, #0x2e]
	ldr r0, _0815A254
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A254: .4byte 0x0815A259
	thumb_func_end sub_0815A22C

	thumb_func_start sub_0815A258
sub_0815A258: @ 0x0815A258
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0815A27E
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	b _0815A282
_0815A27E:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
_0815A282:
	strh r0, [r4, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	beq _0815A290
	cmp r0, #4
	bne _0815A298
_0815A290:
	ldrh r0, [r4, #0x30]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0x30]
_0815A298:
	ldrh r0, [r4, #0x32]
	adds r1, r0, #1
	strh r1, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x46
	ble _0815A2DC
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	movs r0, #0
	strh r0, [r4, #0x32]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	subs r2, #0x12
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0815A2E4
	str r0, [r4, #0x1c]
_0815A2DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A2E4: .4byte 0x0815A2E9
	thumb_func_end sub_0815A258

	thumb_func_start sub_0815A2E8
sub_0815A2E8: @ 0x0815A2E8
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x32]
	adds r1, r0, #1
	strh r1, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _0815A324
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	subs r2, #0x12
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0815A324
	ldr r0, _0815A328
	str r0, [r3, #0x1c]
_0815A324:
	pop {r0}
	bx r0
	.align 2, 0
_0815A328: .4byte 0x0815A32D
	thumb_func_end sub_0815A2E8

	thumb_func_start sub_0815A32C
sub_0815A32C: @ 0x0815A32C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bhi _0815A384
	lsls r0, r0, #2
	ldr r1, _0815A344
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815A344: .4byte 0x0815A348
_0815A348: @ jump table
	.4byte _0815A364 @ case 0
	.4byte _0815A364 @ case 1
	.4byte _0815A36E @ case 2
	.4byte _0815A36E @ case 3
	.4byte _0815A37C @ case 4
	.4byte _0815A37C @ case 5
	.4byte _0815A384 @ case 6
_0815A364:
	movs r1, #0
	movs r0, #1
	strh r0, [r4, #0x24]
	strh r1, [r4, #0x26]
	b _0815A38C
_0815A36E:
	ldr r0, _0815A378
	strh r0, [r4, #0x24]
	movs r0, #0
	b _0815A38A
	.align 2, 0
_0815A378: .4byte 0x0000FFFF
_0815A37C:
	movs r0, #0
	strh r0, [r4, #0x24]
	movs r0, #1
	b _0815A38A
_0815A384:
	movs r0, #0
	strh r0, [r4, #0x24]
	ldr r0, _0815A3D0
_0815A38A:
	strh r0, [r4, #0x26]
_0815A38C:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0815A39E
	strh r2, [r4, #0x34]
_0815A39E:
	ldrh r0, [r4, #0x36]
	adds r1, r0, #1
	strh r1, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0815A3C8
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x30]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldrh r1, [r4, #0x2e]
	movs r0, #0x52
	bl SetGpuReg
	ldr r0, _0815A3D4
	str r0, [r4, #0x1c]
_0815A3C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A3D0: .4byte 0x0000FFFF
_0815A3D4: .4byte 0x0815A3D9
	thumb_func_end sub_0815A32C

	thumb_func_start sub_0815A3D8
sub_0815A3D8: @ 0x0815A3D8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldrh r0, [r4, #0x30]
	adds r1, r0, #1
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815A408
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	movs r1, #0
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x30]
_0815A408:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815A41C
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_0815A41C:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0815A43A
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815A43A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0815A3D8

	thumb_func_start sub_0815A440
sub_0815A440: @ 0x0815A440
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0815A45C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _0815A460
	str r0, [r1]
	ldr r1, _0815A464
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0815A45C: .4byte 0x03005B60
_0815A460: .4byte 0x0815A469
_0815A464: .4byte 0x0203809E
	thumb_func_end sub_0815A440

	thumb_func_start sub_0815A468
sub_0815A468: @ 0x0815A468
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_080A665C
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _0815A4F4
	lsls r5, r4, #2
	adds r1, r5, r4
	lsls r1, r1, #3
	adds r1, r1, r7
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0815A4D8
	ldr r0, _0815A4F8
	lsls r2, r6, #4
	adds r1, r2, #0
	adds r1, #0xb
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	mov r8, r3
	movs r3, #0xa
	mov sb, r7
	adds r7, r5, #0
	mov ip, r0
	adds r5, r2, #0
	lsls r0, r6, #5
	add r0, ip
	adds r2, r0, #0
	adds r2, #0x14
_0815A4B6:
	ldrh r0, [r2]
	strh r0, [r1]
	subs r2, #2
	subs r1, #2
	subs r3, #1
	cmp r3, #0
	bgt _0815A4B6
	adds r0, r5, #1
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	mov r2, r8
	strh r2, [r0]
	adds r0, r7, r4
	lsls r0, r0, #3
	add r0, sb
	strh r1, [r0, #0x12]
_0815A4D8:
	ldr r0, _0815A4FC
	ldrh r1, [r0, #0xe]
	ldr r0, _0815A500
	cmp r1, r0
	bne _0815A4E8
	adds r0, r4, #0
	bl DestroyTask
_0815A4E8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815A4F4: .4byte 0x03005B60
_0815A4F8: .4byte 0x020377B4
_0815A4FC: .4byte 0x020380BE
_0815A500: .4byte 0x0000FFFF
	thumb_func_end sub_0815A468

	thumb_func_start sub_0815A504
sub_0815A504: @ 0x0815A504
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0815A520
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _0815A524
	str r0, [r1]
	ldr r1, _0815A528
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0815A520: .4byte 0x03005B60
_0815A524: .4byte 0x0815A52D
_0815A528: .4byte 0x0203809E
	thumb_func_end sub_0815A504

	thumb_func_start sub_0815A52C
sub_0815A52C: @ 0x0815A52C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	bl sub_080A665C
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r5, _0815A5EC
	mov r0, r8
	lsls r3, r0, #2
	adds r1, r3, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0815A5CE
	ldr r0, _0815A5F0
	lsls r2, r7, #4
	adds r1, r2, #0
	adds r1, #0xb
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r6, [r1]
	movs r4, #0xa
	mov sl, r3
	mov sb, r0
	adds r5, r2, #0
	ldr r2, _0815A5F4
	mov ip, r2
	lsls r0, r7, #5
	add r0, sb
	adds r3, r0, #0
	adds r3, #0x14
_0815A580:
	ldrh r0, [r3]
	strh r0, [r1]
	subs r3, #2
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bgt _0815A580
	adds r0, r5, #1
	lsls r0, r0, #1
	add r0, sb
	strh r6, [r0]
	adds r1, r5, #0
	adds r1, #0xb
	lsls r1, r1, #1
	add r1, ip
	ldrh r6, [r1]
	movs r4, #0xa
	lsls r0, r7, #5
	add r0, ip
	adds r2, r0, #0
	adds r2, #0x14
_0815A5AA:
	ldrh r0, [r2]
	strh r0, [r1]
	subs r2, #2
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bgt _0815A5AA
	adds r0, r5, #1
	lsls r0, r0, #1
	add r0, ip
	movs r1, #0
	strh r6, [r0]
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	ldr r2, _0815A5EC
	adds r0, r0, r2
	strh r1, [r0, #0x12]
_0815A5CE:
	ldr r0, _0815A5F8
	ldrh r1, [r0, #0xe]
	ldr r0, _0815A5FC
	cmp r1, r0
	bne _0815A5DE
	mov r0, r8
	bl DestroyTask
_0815A5DE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815A5EC: .4byte 0x03005B60
_0815A5F0: .4byte 0x020377B4
_0815A5F4: .4byte 0x020373B4
_0815A5F8: .4byte 0x020380BE
_0815A5FC: .4byte 0x0000FFFF
	thumb_func_end sub_0815A52C

	thumb_func_start sub_0815A600
sub_0815A600: @ 0x0815A600
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _0815A664
	ldrb r0, [r0]
	mov r5, sp
	adds r5, #2
	movs r1, #0
	mov r2, sp
	adds r3, r5, #0
	bl SetAverageBattlerPositions
	ldr r0, _0815A668
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815A634
	ldr r1, _0815A66C
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_0815A634:
	ldr r1, _0815A66C
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	mov r2, sp
	ldrh r0, [r1, #4]
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #6]
	ldrh r5, [r5]
	adds r0, r0, r5
	strh r0, [r4, #0x36]
	ldr r0, _0815A670
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldr r0, _0815A674
	str r0, [r4, #0x1c]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815A664: .4byte 0x020380D7
_0815A668: .4byte 0x020380D6
_0815A66C: .4byte 0x020380BE
_0815A670: .4byte 0x0000FFCE
_0815A674: .4byte 0x0815A679
	thumb_func_end sub_0815A600

	thumb_func_start sub_0815A678
sub_0815A678: @ 0x0815A678
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815A69A
	movs r1, #0
	movs r0, #0x1e
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x30]
	ldr r0, _0815A6A0
	str r0, [r4, #0x1c]
	ldr r1, _0815A6A4
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
_0815A69A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A6A0: .4byte 0x080A5D79
_0815A6A4: .4byte 0x0815A6A9
	thumb_func_end sub_0815A678

	thumb_func_start sub_0815A6A8
sub_0815A6A8: @ 0x0815A6A8
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x30]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0815A6D4
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
_0815A6D4:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0815A6E8
	adds r0, r3, #0
	bl DestroyAnimSprite
_0815A6E8:
	pop {r0}
	bx r0
	thumb_func_end sub_0815A6A8

	thumb_func_start sub_0815A6EC
sub_0815A6EC: @ 0x0815A6EC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r5, _0815A71C
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	bl SetAnimSpriteInitialXOffset
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, _0815A720
	str r0, [r4, #0x1c]
	ldr r1, _0815A724
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815A71C: .4byte 0x020380BE
_0815A720: .4byte 0x080A60A1
_0815A724: .4byte 0x080A34C5
	thumb_func_end sub_0815A6EC

	thumb_func_start sub_0815A728
sub_0815A728: @ 0x0815A728
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815A788
	adds r0, r4, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r5, _0815A764
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r0, r4, #0
	bl SetAnimSpriteInitialXOffset
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815A77C
	ldr r0, _0815A768
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815A76C
	ldrh r0, [r5, #4]
	b _0815A782
	.align 2, 0
_0815A764: .4byte 0x020380BE
_0815A768: .4byte 0x020380D6
_0815A76C:
	movs r1, #4
	ldrsh r0, [r5, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0x30]
	movs r2, #6
	ldrsh r0, [r5, r2]
	rsbs r0, r0, #0
	b _0815A786
_0815A77C:
	movs r1, #4
	ldrsh r0, [r5, r1]
	rsbs r0, r0, #0
_0815A782:
	strh r0, [r4, #0x30]
	ldrh r0, [r5, #6]
_0815A786:
	strh r0, [r4, #0x32]
_0815A788:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r3, #0xff
	ldrh r1, [r4, #0x30]
	ldrh r2, [r4, #0x34]
	adds r1, r1, r2
	strh r1, [r4, #0x34]
	ldrh r1, [r4, #0x32]
	ldrh r2, [r4, #0x36]
	adds r1, r1, r2
	strh r1, [r4, #0x36]
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	strh r1, [r4, #0x24]
	ands r0, r3
	movs r1, #5
	bl Sin
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0815A7E0
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815A7E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0815A728

	thumb_func_start sub_0815A7E8
sub_0815A7E8: @ 0x0815A7E8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0815A7FE
	adds r0, r2, #0
	bl DestroyAnimSprite
_0815A7FE:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0815A7E8

	thumb_func_start AnimTask_IsTargetPlayerSide
AnimTask_IsTargetPlayerSide: @ 0x0815A804
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0815A820
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815A828
	ldr r1, _0815A824
	movs r0, #0
	b _0815A82C
	.align 2, 0
_0815A820: .4byte 0x020380D7
_0815A824: .4byte 0x020380BE
_0815A828:
	ldr r1, _0815A83C
	movs r0, #1
_0815A82C:
	strh r0, [r1, #0xe]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A83C: .4byte 0x020380BE
	thumb_func_end AnimTask_IsTargetPlayerSide

	thumb_func_start AnimTask_IsHealingMove
AnimTask_IsHealingMove: @ 0x0815A840
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0815A854
	ldr r0, [r0]
	cmp r0, #0
	ble _0815A85C
	ldr r1, _0815A858
	movs r0, #0
	b _0815A860
	.align 2, 0
_0815A854: .4byte 0x020380A4
_0815A858: .4byte 0x020380BE
_0815A85C:
	ldr r1, _0815A86C
	movs r0, #1
_0815A860:
	strh r0, [r1, #0xe]
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_0815A86C: .4byte 0x020380BE
	thumb_func_end AnimTask_IsHealingMove

	thumb_func_start sub_0815A870
sub_0815A870: @ 0x0815A870
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0815A8CC
	movs r0, #0x4a
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #0
	bl SetGpuRegBits
	ldr r0, _0815A8D0
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0815A8D4
	strh r1, [r4]
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x44
	bl SetGpuReg
	adds r0, r5, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	ldrb r1, [r5, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r5, #1]
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0815A8D8
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815A8CC: .4byte 0x00001F3F
_0815A8D0: .4byte 0x02022AD8
_0815A8D4: .4byte 0x02022ADA
_0815A8D8: .4byte 0x0815A8DD
	thumb_func_end sub_0815A870

	thumb_func_start sub_0815A8DC
sub_0815A8DC: @ 0x0815A8DC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bhi _0815A99C
	lsls r0, r0, #2
	ldr r1, _0815A8F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815A8F4: .4byte 0x0815A8F8
_0815A8F8: @ jump table
	.4byte _0815A910 @ case 0
	.4byte _0815A92E @ case 1
	.4byte _0815A94E @ case 2
	.4byte _0815A92E @ case 3
	.4byte _0815A96E @ case 4
	.4byte _0815A97E @ case 5
_0815A910:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0815A99C
	b _0815A976
_0815A92E:
	ldrh r0, [r4, #0x30]
	adds r0, #0x75
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bne _0815A99C
	movs r0, #0
	strh r0, [r4, #0x32]
	b _0815A976
_0815A94E:
	ldrh r0, [r4, #0x30]
	subs r0, #0x75
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x29
	bne _0815A99C
	movs r0, #0
	strh r0, [r4, #0x32]
	b _0815A976
_0815A96E:
	adds r0, r4, #0
	movs r1, #1
	bl ChangeSpriteAffineAnim
_0815A976:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0815A99C
_0815A97E:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0815A99C
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0815A9A4
	str r0, [r4, #0x1c]
_0815A99C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A9A4: .4byte 0x0815A9A9
	thumb_func_end sub_0815A8DC

	thumb_func_start sub_0815A9A8
sub_0815A9A8: @ 0x0815A9A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0815A9DC
	movs r0, #0x4a
	bl SetGpuReg
	movs r0, #0
	bl GetGpuReg
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A9DC: .4byte 0x00003F3F
	thumb_func_end sub_0815A9A8

	thumb_func_start sub_0815A9E0
sub_0815A9E0: @ 0x0815A9E0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0815AA54
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0815AA0C
	ldr r4, _0815AA58
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
_0815AA0C:
	ldrh r0, [r6]
	ldrh r2, [r5, #0x20]
	adds r0, r0, r2
	movs r3, #0
	strh r0, [r5, #0x20]
	ldrh r0, [r6, #2]
	ldrh r4, [r5, #0x22]
	adds r0, r0, r4
	strh r0, [r5, #0x22]
	ldrh r2, [r5, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x10
	ldr r4, _0815AA5C
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _0815AA60
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r1, #4
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0815AA68
	ldrb r1, [r5, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #3]
	ldr r0, _0815AA64
	strh r0, [r5, #0x24]
	movs r0, #2
	b _0815AA6E
	.align 2, 0
_0815AA54: .4byte 0x020380BE
_0815AA58: .4byte 0x020380D6
_0815AA5C: .4byte 0x000003FF
_0815AA60: .4byte 0xFFFFFC00
_0815AA64: .4byte 0x0000FFF4
_0815AA68:
	movs r0, #0xc
	strh r0, [r5, #0x24]
	ldr r0, _0815AA8C
_0815AA6E:
	strh r0, [r5, #0x30]
	ldr r1, _0815AA90
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x2e]
	movs r2, #0x34
	ldrsh r0, [r5, r2]
	cmp r0, #0xff
	beq _0815AA82
	ldrh r0, [r1, #4]
	strh r0, [r5, #0x34]
_0815AA82:
	ldr r0, _0815AA94
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815AA8C: .4byte 0x0000FFFE
_0815AA90: .4byte 0x020380BE
_0815AA94: .4byte 0x0815AA99
	thumb_func_end sub_0815A9E0

	thumb_func_start sub_0815AA98
sub_0815AA98: @ 0x0815AA98
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x32]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815AAD6
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0815AAF6
	adds r0, r2, #1
	strh r0, [r4, #0x32]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815AAF6
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xde
	bl PlaySE1WithPanning
	b _0815AAF6
_0815AAD6:
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x30]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0815AAE8
	rsbs r0, r0, #0
_0815AAE8:
	cmp r0, #0xc
	bne _0815AAF6
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	subs r0, r2, #1
	strh r0, [r4, #0x32]
_0815AAF6:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815AB04
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815AB04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0815AA98

	thumb_func_start sub_0815AB0C
sub_0815AB0C: @ 0x0815AB0C
	push {lr}
	ldrb r2, [r0, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #1]
	movs r1, #0xff
	strh r1, [r0, #0x34]
	bl sub_0815A9E0
	pop {r0}
	bx r0
	thumb_func_end sub_0815AB0C

	thumb_func_start sub_0815AB28
sub_0815AB28: @ 0x0815AB28
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815AB7C
	ldr r1, _0815AB64
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _0815AB68
	ldr r2, _0815AB6C
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0815AB70
	movs r0, #0xa0
	strh r0, [r1]
	ldr r0, _0815AB74
	ldrh r1, [r0]
	movs r0, #0x42
	bl SetGpuReg
	ldr r0, _0815AB78
	ldrh r1, [r0]
	movs r0, #0x46
	bl SetGpuReg
	b _0815ABAC
	.align 2, 0
_0815AB64: .4byte 0x00001F3F
_0815AB68: .4byte 0x02022ADC
_0815AB6C: .4byte 0x000098F0
_0815AB70: .4byte 0x02022ADE
_0815AB74: .4byte 0x02022AD8
_0815AB78: .4byte 0x02022ADA
_0815AB7C:
	ldr r1, _0815ABB8
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _0815ABBC
	movs r0, #0xf0
	strh r0, [r1]
	ldr r4, _0815ABC0
	ldr r1, _0815ABC4
	adds r0, r1, #0
	strh r0, [r4]
	movs r0, #0x42
	movs r1, #0xf0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x46
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #0
	bl SetGpuRegBits
_0815ABAC:
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815ABB8: .4byte 0x00001F3F
_0815ABBC: .4byte 0x02022ADC
_0815ABC0: .4byte 0x02022ADE
_0815ABC4: .4byte 0x000078A0
	thumb_func_end sub_0815AB28

	thumb_func_start sub_0815ABC8
sub_0815ABC8: @ 0x0815ABC8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0815AC00
	movs r0, #0x48
	bl SetGpuReg
	ldr r0, _0815AC04
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0815AC08
	strh r1, [r0]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815ABF4
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #0
	bl ClearGpuRegBits
_0815ABF4:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815AC00: .4byte 0x00003F3F
_0815AC04: .4byte 0x02022ADC
_0815AC08: .4byte 0x02022ADE
	thumb_func_end sub_0815ABC8

	thumb_func_start sub_0815AC0C
sub_0815AC0C: @ 0x0815AC0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0815AC20
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0815AC28
	ldr r4, _0815AC24
	b _0815AC2A
	.align 2, 0
_0815AC20: .4byte 0x020380BE
_0815AC24: .4byte 0x020380D6
_0815AC28:
	ldr r4, _0815AC7C
_0815AC2A:
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r6, [r6, #2]
	adds r0, r0, r6
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	ldr r2, _0815AC80
	ldrh r0, [r2, #4]
	strh r0, [r5, #0x26]
	movs r3, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r4, [r2, #6]
	movs r6, #6
	ldrsh r1, [r2, r6]
	cmp r0, r1
	ble _0815AC62
	movs r3, #1
_0815AC62:
	strh r3, [r5, #0x2e]
	movs r0, #0
	strh r0, [r5, #0x30]
	ldrh r0, [r2, #8]
	strh r0, [r5, #0x32]
	ldrh r0, [r2, #0xa]
	strh r0, [r5, #0x34]
	strh r4, [r5, #0x36]
	ldr r0, _0815AC84
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815AC7C: .4byte 0x020380D7
_0815AC80: .4byte 0x020380BE
_0815AC84: .4byte 0x0815AC89
	thumb_func_end sub_0815AC0C

	thumb_func_start sub_0815AC88
sub_0815AC88: @ 0x0815AC88
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x32]
	ldrh r1, [r2, #0x30]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r2, #0x30]
	ldr r1, _0815ACD0
	movs r3, #0x30
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x34]
	ldrh r3, [r2, #0x26]
	adds r1, r0, r3
	strh r1, [r2, #0x26]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0815ACD4
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _0815ACE6
	adds r0, r2, #0
	bl DestroyAnimSprite
	b _0815ACE6
	.align 2, 0
_0815ACD0: .4byte 0x082FA8CC
_0815ACD4:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _0815ACE6
	adds r0, r2, #0
	bl DestroyAnimSprite
_0815ACE6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0815AC88

	thumb_func_start sub_0815ACEC
sub_0815ACEC: @ 0x0815ACEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0815AD0C
	adds r5, r1, r0
	ldr r0, _0815AD10
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0815AD18
	ldr r4, _0815AD14
	b _0815AD1A
	.align 2, 0
_0815AD0C: .4byte 0x03005B60
_0815AD10: .4byte 0x020380BE
_0815AD14: .4byte 0x020380D6
_0815AD18:
	ldr r4, _0815AD60
_0815AD1A:
	ldrb r0, [r4]
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r4]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	adds r1, r0, #0
	adds r1, #0x24
	movs r2, #0
	strh r1, [r5, #8]
	strh r1, [r5, #0xa]
	subs r0, #0x21
	strh r0, [r5, #0xc]
	cmp r0, #0
	bge _0815AD44
	strh r2, [r5, #0xc]
_0815AD44:
	ldrh r0, [r5, #8]
	strh r0, [r5, #0xe]
	movs r0, #8
	strh r0, [r5, #0x10]
	ldr r1, _0815AD64
	ldrh r0, [r1, #2]
	strh r0, [r5, #0x12]
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x16]
	cmp r7, #1
	bne _0815AD6C
	ldr r0, _0815AD68
	b _0815AD6E
	.align 2, 0
_0815AD60: .4byte 0x020380D7
_0815AD64: .4byte 0x020380BE
_0815AD68: .4byte 0x02022ACC
_0815AD6C:
	ldr r0, _0815AD8C
_0815AD6E:
	ldrh r2, [r0]
	strh r2, [r5, #0x18]
	adds r3, r2, #0
	adds r3, #0xf0
	strh r3, [r5, #0x1a]
	ldrh r0, [r1, #4]
	strh r0, [r5, #0x1c]
	movs r4, #4
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _0815AD90
	strh r3, [r5, #0x1e]
	ldrh r3, [r5, #0x18]
	b _0815AD94
	.align 2, 0
_0815AD8C: .4byte 0x02022AD0
_0815AD90:
	strh r2, [r5, #0x1e]
	ldrh r3, [r5, #0x1a]
_0815AD94:
	movs r0, #0
	strh r0, [r5, #0x26]
	ldrh r1, [r5, #0xc]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	movs r6, #0xe
	ldrsh r0, [r5, r6]
	cmp r1, r0
	bgt _0815ADCA
	ldr r4, _0815ADD4
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r0, r0, r4
	mov ip, r0
_0815ADB0:
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r0, r1, r4
	strh r3, [r0]
	add r1, ip
	strh r3, [r1]
	adds r2, #1
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	movs r6, #0xe
	ldrsh r0, [r5, r6]
	cmp r1, r0
	ble _0815ADB0
_0815ADCA:
	cmp r7, #1
	bne _0815ADDC
	ldr r0, _0815ADD8
	b _0815ADDE
	.align 2, 0
_0815ADD4: .4byte 0x020388C8
_0815ADD8: .4byte 0x04000014
_0815ADDC:
	ldr r0, _0815AE08
_0815ADDE:
	str r0, [sp]
	ldr r0, _0815AE0C
	str r0, [sp, #4]
	mov r1, sp
	movs r2, #0
	movs r0, #1
	strb r0, [r1, #8]
	mov r0, sp
	strb r2, [r0, #9]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ScanlineEffect_SetParams
	ldr r0, _0815AE10
	str r0, [r5]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815AE08: .4byte 0x04000018
_0815AE0C: .4byte 0xA2600001
_0815AE10: .4byte 0x0815AE15
	thumb_func_end sub_0815ACEC

	thumb_func_start sub_0815AE14
sub_0815AE14: @ 0x0815AE14
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _0815AE64
	adds r4, r0, r1
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0x12]
	subs r0, r0, r1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r4, #0xc]
	movs r3, #0xc
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _0815AE3C
	strh r2, [r4, #8]
_0815AE3C:
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0815AE68
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #0x12]
	subs r0, r0, r1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r4, #0xc]
	movs r3, #0xc
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _0815AE6C
	strh r2, [r4, #0xa]
	movs r0, #1
	strh r0, [r4, #0x26]
	b _0815AE6C
	.align 2, 0
_0815AE64: .4byte 0x03005B60
_0815AE68:
	subs r0, r1, #1
	strh r0, [r4, #0x10]
_0815AE6C:
	ldrh r0, [r4, #0x14]
	adds r0, #1
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815AE98
	movs r0, #0
	strh r0, [r4, #0x14]
	movs r1, #0
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0815AE8A
	movs r1, #1
_0815AE8A:
	strh r1, [r4, #0x16]
	cmp r1, #0
	beq _0815AE94
	ldrh r0, [r4, #0x18]
	b _0815AE96
_0815AE94:
	ldrh r0, [r4, #0x1a]
_0815AE96:
	strh r0, [r4, #0x20]
_0815AE98:
	ldrh r1, [r4, #8]
	lsls r3, r1, #0x10
	asrs r1, r3, #0x10
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _0815AECC
	ldr r5, _0815AF24
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r6, r5, r0
_0815AEAE:
	asrs r3, r3, #0x10
	lsls r1, r3, #1
	adds r2, r1, r5
	ldrh r0, [r4, #0x20]
	strh r0, [r2]
	adds r1, r1, r6
	ldrh r0, [r4, #0x20]
	strh r0, [r1]
	adds r3, #1
	lsls r3, r3, #0x10
	asrs r1, r3, #0x10
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0815AEAE
_0815AECC:
	ldrh r1, [r4, #0xa]
	lsls r3, r1, #0x10
	asrs r1, r3, #0x10
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _0815AF00
	ldr r5, _0815AF24
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r6, r5, r0
_0815AEE2:
	asrs r3, r3, #0x10
	lsls r1, r3, #1
	adds r2, r1, r5
	ldrh r0, [r4, #0x1e]
	strh r0, [r2]
	adds r1, r1, r6
	ldrh r0, [r4, #0x1e]
	strh r0, [r1]
	adds r3, #1
	lsls r3, r3, #0x10
	asrs r1, r3, #0x10
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0815AEE2
_0815AF00:
	movs r3, #0x26
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0815AF1C
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0815AF16
	ldr r1, _0815AF28
	movs r0, #3
	strb r0, [r1, #0x15]
_0815AF16:
	adds r0, r7, #0
	bl DestroyAnimVisualTask
_0815AF1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815AF24: .4byte 0x020388C8
_0815AF28: .4byte 0x020397C8
	thumb_func_end sub_0815AE14

	thumb_func_start sub_0815AF2C
sub_0815AF2C: @ 0x0815AF2C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0815AF80
	adds r4, r4, r0
	movs r5, #0
	strh r5, [r4, #8]
	strh r5, [r4, #0xa]
	ldr r6, _0815AF84
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xc]
	ldrb r0, [r6]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xe]
	movs r0, #0x20
	strh r0, [r4, #0x10]
	ldr r0, _0815AF88
	strh r0, [r4, #0x12]
	strh r5, [r4, #0x14]
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldr r0, _0815AF8C
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815AF80: .4byte 0x03005B60
_0815AF84: .4byte 0x020380D6
_0815AF88: .4byte 0x0000FFEC
_0815AF8C: .4byte 0x0815AF91
	thumb_func_end sub_0815AF2C

	thumb_func_start sub_0815AF90
sub_0815AF90: @ 0x0815AF90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0815AFBC
	adds r6, r0, r1
	movs r1, #8
	ldrsh r0, [r6, r1]
	cmp r0, #5
	bls _0815AFB0
	b _0815B16A
_0815AFB0:
	lsls r0, r0, #2
	ldr r1, _0815AFC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815AFBC: .4byte 0x03005B60
_0815AFC0: .4byte 0x0815AFC4
_0815AFC4: @ jump table
	.4byte _0815AFDC @ case 0
	.4byte _0815B09C @ case 1
	.4byte _0815B0CA @ case 2
	.4byte _0815B0DE @ case 3
	.4byte _0815B0F4 @ case 4
	.4byte _0815B15C @ case 5
_0815AFDC:
	movs r0, #0xc
	ldrsh r2, [r6, r0]
	ldrh r1, [r6, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0815AFF2
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	subs r0, r2, r0
	b _0815AFF8
_0815AFF2:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	adds r0, r2, r0
_0815AFF8:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r2, [r6, #0x12]
	ldrh r0, [r6, #0xe]
	adds r2, r2, r0
	ldr r0, _0815B08C
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrb r4, [r6, #0xa]
	movs r3, #6
	subs r3, r3, r4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xba
	bl PlaySE12WithPanning
	cmp r4, #0x40
	beq _0815B05C
	ldr r5, _0815B090
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r3, r1, r5
	ldrh r0, [r6, #0xa]
	movs r2, #1
	ands r2, r0
	adds r3, #0x3f
	ldrb r4, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r4
	orrs r0, r2
	strb r0, [r3]
	adds r5, #0x1c
	adds r1, r1, r5
	ldr r0, _0815B094
	str r0, [r1]
_0815B05C:
	ldrh r1, [r6, #0xa]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0815B074
	ldrh r0, [r6, #0x10]
	subs r0, #6
	strh r0, [r6, #0x10]
	ldrh r0, [r6, #0x12]
	subs r0, #6
	strh r0, [r6, #0x12]
_0815B074:
	ldrh r1, [r6, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0815B098
	adds r0, r6, #0
	bl PrepareAffineAnimInTaskData
	ldrh r0, [r6, #0xa]
	adds r0, #1
	strh r0, [r6, #0xa]
	strh r4, [r6, #8]
	b _0815B16A
	.align 2, 0
_0815B08C: .4byte 0x0856ECF8
_0815B090: .4byte 0x020205AC
_0815B094: .4byte 0x08007141
_0815B098: .4byte 0x085AD0A8
_0815B09C:
	adds r0, r6, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0815B16A
	movs r2, #0xa
	ldrsh r1, [r6, r2]
	cmp r1, #6
	bne _0815B0BC
	movs r0, #8
	strh r0, [r6, #0x14]
	movs r0, #3
	strh r0, [r6, #8]
	b _0815B16A
_0815B0BC:
	cmp r1, #2
	bgt _0815B0C2
	movs r0, #0xa
_0815B0C2:
	strh r0, [r6, #0x14]
	movs r0, #2
	strh r0, [r6, #8]
	b _0815B16A
_0815B0CA:
	ldrh r0, [r6, #0x14]
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	cmp r1, #0
	beq _0815B0DA
	subs r0, #1
	strh r0, [r6, #0x14]
	b _0815B16A
_0815B0DA:
	strh r1, [r6, #8]
	b _0815B16A
_0815B0DE:
	ldrh r1, [r6, #0x14]
	movs r2, #0x14
	ldrsh r0, [r6, r2]
	cmp r0, #0
	beq _0815B0EE
	subs r0, r1, #1
	strh r0, [r6, #0x14]
	b _0815B16A
_0815B0EE:
	movs r0, #4
	strh r0, [r6, #8]
	b _0815B16A
_0815B0F4:
	movs r5, #0
	movs r7, #0
	ldr r3, _0815B150
	movs r0, #0x1c
	adds r0, r0, r3
	mov r8, r0
_0815B100:
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r4, r0, #2
	adds r0, r3, #0
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, [r0]
	ldr r0, _0815B154
	cmp r1, r0
	bne _0815B13C
	adds r0, r4, r3
	strh r2, [r0, #0x2e]
	movs r1, #6
	strh r1, [r0, #0x30]
	movs r1, #2
	str r2, [sp]
	str r3, [sp, #4]
	bl StartSpriteAnim
	mov r0, r8
	adds r1, r4, r0
	ldr r0, _0815B158
	str r0, [r1]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r7, #6
	beq _0815B146
_0815B13C:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x3f
	bls _0815B100
_0815B146:
	strh r7, [r6, #0x14]
	movs r0, #5
	strh r0, [r6, #8]
	b _0815B16A
	.align 2, 0
_0815B150: .4byte 0x020205AC
_0815B154: .4byte 0x0856ECF8
_0815B158: .4byte 0x0815B179
_0815B15C:
	movs r1, #0x14
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0815B16A
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_0815B16A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0815AF90

	thumb_func_start sub_0815B178
sub_0815B178: @ 0x0815B178
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0815B1AC
	ldr r3, _0815B1B4
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	movs r0, #0x2e
	ldrsh r2, [r4, r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r3, #8
	adds r1, r1, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	bl DestroySprite
_0815B1AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B1B4: .4byte 0x03005B60
	thumb_func_end sub_0815B178

	thumb_func_start sub_0815B1B8
sub_0815B1B8: @ 0x0815B1B8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0815B1CC
	adds r0, r5, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
_0815B1CC:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	bgt _0815B1FE
	ldrh r0, [r5, #0x2e]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0815B1F0
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	b _0815B1FC
_0815B1F0:
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
_0815B1FC:
	strb r0, [r2]
_0815B1FE:
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0x1e
	ble _0815B214
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0815B214:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0x3d
	bne _0815B260
	ldr r1, _0815B268
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldrh r0, [r5, #0x24]
	ldrh r2, [r5, #0x20]
	adds r0, r0, r2
	movs r1, #0
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x26]
	ldrh r2, [r5, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	strh r1, [r5, #0x24]
	strh r1, [r5, #0x26]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	ldr r4, _0815B26C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x36]
	ldr r0, _0815B270
	str r0, [r5, #0x1c]
_0815B260:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815B268: .4byte 0x080A34C5
_0815B26C: .4byte 0x020380D7
_0815B270: .4byte 0x080A67B5
	thumb_func_end sub_0815B1B8

	thumb_func_start sub_0815B274
sub_0815B274: @ 0x0815B274
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0815B294
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0815B298
	cmp r0, #1
	beq _0815B2B8
	b _0815B2CA
	.align 2, 0
_0815B294: .4byte 0x03005B60
_0815B298:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0815B2B4
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815B2CA
	.align 2, 0
_0815B2B4: .4byte 0x085AD158
_0815B2B8:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815B2CA
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0815B2CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0815B274

	thumb_func_start sub_0815B2D0
sub_0815B2D0: @ 0x0815B2D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _0815B330
	cmp r0, #1
	bgt _0815B2F0
	cmp r0, #0
	beq _0815B2FA
	b _0815B3D2
_0815B2F0:
	cmp r0, #2
	beq _0815B360
	cmp r0, #3
	beq _0815B3B4
	b _0815B3D2
_0815B2FA:
	ldr r4, _0815B32C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	adds r0, r6, #0
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x30]
	strh r0, [r5, #0x32]
	b _0815B3A8
	.align 2, 0
_0815B32C: .4byte 0x020380D6
_0815B330:
	ldrh r0, [r5, #0x30]
	adds r0, #0x60
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	subs r0, #0x1a
	strh r0, [r5, #0x32]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	movs r0, #0x32
	ldrsh r2, [r5, r0]
	adds r0, r6, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrh r0, [r5, #0x34]
	adds r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0815B360
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0815B360:
	ldrh r0, [r5, #0x30]
	adds r0, #0x60
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	adds r0, #0x30
	strh r0, [r5, #0x32]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	movs r0, #0x32
	ldrsh r2, [r5, r0]
	adds r0, r6, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrh r0, [r5, #0x34]
	adds r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0815B3D2
	movs r0, #0
	strh r0, [r5, #0x34]
	ldr r1, _0815B3B0
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, #0
	bl ResetSpriteRotScale
_0815B3A8:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _0815B3D2
	.align 2, 0
_0815B3B0: .4byte 0x020205AC
_0815B3B4:
	ldrh r0, [r5, #0x26]
	subs r0, #6
	strh r0, [r5, #0x26]
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	movs r2, #0x26
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0815B3D2
	adds r0, r5, #0
	bl DestroyAnimSprite
_0815B3D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0815B2D0

	thumb_func_start sub_0815B3D8
sub_0815B3D8: @ 0x0815B3D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0815B3F0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815B3F8
	ldr r0, _0815B3F4
	b _0815B3FC
	.align 2, 0
_0815B3F0: .4byte 0x020380D6
_0815B3F4: .4byte 0x0000FFF0
_0815B3F8:
	movs r0, #0x80
	lsls r0, r0, #1
_0815B3FC:
	strh r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x22]
	ldr r0, _0815B40C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B40C: .4byte 0x0815B411
	thumb_func_end sub_0815B3D8

	thumb_func_start sub_0815B410
sub_0815B410: @ 0x0815B410
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #0x48
	strh r0, [r4, #0x2e]
	ldr r0, _0815B430
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815B434
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	b _0815B43C
	.align 2, 0
_0815B430: .4byte 0x020380D6
_0815B434:
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	rsbs r0, r0, #0
_0815B43C:
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x30]
	adds r0, #0x10
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x26]
	adds r5, r0, r1
	strh r5, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0815B488
	ldr r0, _0815B4A8
	ldrh r1, [r4, #0x24]
	ldrh r2, [r4, #0x20]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0x22]
	adds r2, r2, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r3, r4, #0
	adds r3, #0x43
	ldrb r3, [r3]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl CreateSpriteAndAnimate
_0815B488:
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	adds r0, #0x20
	movs r1, #0x98
	lsls r1, r1, #1
	cmp r0, r1
	bls _0815B4A2
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815B4A2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815B4A8: .4byte 0x085AD1A8
	thumb_func_end sub_0815B410

	thumb_func_start AnimMiniTwinklingStar
AnimMiniTwinklingStar: @ 0x0815B4AC
	push {r4, lr}
	adds r4, r0, #0
	bl Random2
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0815B4C6
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #4
	b _0815B4CE
_0815B4C6:
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #5
_0815B4CE:
	ldr r3, _0815B500
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0815B504
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	bl Random2
	movs r1, #7
	ands r0, r1
	adds r1, r0, #0
	cmp r1, #3
	ble _0815B4F0
	rsbs r0, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0815B4F0:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldr r0, _0815B508
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B500: .4byte 0x000003FF
_0815B504: .4byte 0xFFFFFC00
_0815B508: .4byte 0x0815B50D
	thumb_func_end AnimMiniTwinklingStar

	thumb_func_start sub_0815B50C
sub_0815B50C: @ 0x0815B50C
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _0815B54E
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0815B582
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r0, #0
	b _0815B580
_0815B54E:
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	cmp r0, #2
	bne _0815B564
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0815B564:
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	cmp r0, #3
	bne _0815B57C
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0815B594
	strh r0, [r3, #0x30]
_0815B57C:
	ldrh r0, [r3, #0x30]
	adds r0, #1
_0815B580:
	strh r0, [r3, #0x30]
_0815B582:
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #0x3c
	ble _0815B590
	adds r0, r3, #0
	bl DestroySprite
_0815B590:
	pop {r0}
	bx r0
	.align 2, 0
_0815B594: .4byte 0x0000FFFF
	thumb_func_end sub_0815B50C

	thumb_func_start sub_0815B598
sub_0815B598: @ 0x0815B598
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _0815B5D0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815B5D8
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0815B5D4
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815B5EA
	.align 2, 0
_0815B5D0: .4byte 0x03005B60
_0815B5D4: .4byte 0x085AD1C0
_0815B5D8:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815B5EA
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0815B5EA:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0815B598

	thumb_func_start AnimTask_StrongFrustrationGrowAndShrink
AnimTask_StrongFrustrationGrowAndShrink: @ 0x0815B5F0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _0815B628
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815B630
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0815B62C
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815B642
	.align 2, 0
_0815B628: .4byte 0x03005B60
_0815B62C: .4byte 0x085AD1E8
_0815B630:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815B642
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0815B642:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_StrongFrustrationGrowAndShrink

	thumb_func_start sub_0815B648
sub_0815B648: @ 0x0815B648
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0815B65A
	cmp r0, #1
	beq _0815B684
	b _0815B6AC
_0815B65A:
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	movs r0, #0x90
	lsls r0, r0, #4
	strh r0, [r4, #0x30]
	ldr r0, _0815B680
	ldrb r0, [r0]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0815B6AC
	.align 2, 0
_0815B680: .4byte 0x020380D6
_0815B684:
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x26]
	subs r0, r0, r1
	strh r0, [r4, #0x26]
	subs r2, #0x60
	strh r2, [r4, #0x30]
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0815B6AC
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815B6AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0815B648

	thumb_func_start sub_0815B6B4
sub_0815B6B4: @ 0x0815B6B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _0815B6EC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815B6F4
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0815B6F0
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815B706
	.align 2, 0
_0815B6EC: .4byte 0x03005B60
_0815B6F0: .4byte 0x085AD238
_0815B6F4:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815B706
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0815B706:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0815B6B4

	thumb_func_start sub_0815B70C
sub_0815B70C: @ 0x0815B70C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _0815B73C
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r3, r1, #0
	cmp r0, #4
	bls _0815B732
	b _0815BA38
_0815B732:
	lsls r0, r0, #2
	ldr r1, _0815B740
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815B73C: .4byte 0x03005B60
_0815B740: .4byte 0x0815B744
_0815B744: @ jump table
	.4byte _0815B758 @ case 0
	.4byte _0815B7A8 @ case 1
	.4byte _0815B7E4 @ case 2
	.4byte _0815B980 @ case 3
	.4byte _0815B9BE @ case 4
_0815B758:
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	ldr r0, _0815B77C
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815B780
	movs r0, #1
	movs r1, #2
	movs r2, #1
	bl SetAnimBgAttribute
	b _0815B78A
	.align 2, 0
_0815B77C: .4byte 0x020380D6
_0815B780:
	movs r0, #2
	movs r1, #2
	movs r2, #1
	bl SetAnimBgAttribute
_0815B78A:
	ldr r0, _0815B7A0
	mov r6, r8
	lsls r1, r6, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0815B7A4
	ldrh r0, [r0]
	strh r0, [r1, #0x1c]
	b _0815B962
	.align 2, 0
_0815B7A0: .4byte 0x03005B60
_0815B7A4: .4byte 0x020380BE
_0815B7A8:
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	adds r4, r0, r3
	ldrh r0, [r4, #0xc]
	adds r1, r0, #1
	strh r1, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _0815B7C2
	b _0815BA38
_0815B7C2:
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	ldrh r5, [r4, #0xa]
	lsls r1, r5, #4
	orrs r1, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x4c
	bl SetGpuReg
	cmp r5, #0xf
	beq _0815B7E2
	b _0815BA38
_0815B7E2:
	b _0815B9B6
_0815B7E4:
	ldr r5, _0815B814
	ldrb r0, [r5]
	ldr r1, _0815B818
	ldrb r1, [r1]
	mov r2, r8
	lsls r4, r2, #2
	adds r2, r4, r2
	lsls r2, r2, #3
	adds r2, r2, r3
	ldrb r2, [r2, #0x1c]
	bl HandleSpeciesGfxDataChange
	ldrb r1, [r5]
	mov r0, sp
	bl sub_080A64C4
	bl IsContest
	lsls r0, r0, #0x18
	mov sb, r4
	cmp r0, #0
	beq _0815B81C
	movs r1, #0
	b _0815B826
	.align 2, 0
_0815B814: .4byte 0x020380D6
_0815B818: .4byte 0x020380D7
_0815B81C:
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0815B826:
	ldr r0, _0815B908
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r2, #4
	adds r2, r2, r0
	ldr r1, _0815B90C
	ldr r0, _0815B910
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #0xb
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r1, [sp]
	ldr r2, _0815B914
	bl CpuSet
	ldr r1, [sp]
	movs r2, #0x80
	lsls r2, r2, #4
	mov r0, sp
	ldrh r3, [r0, #0xa]
	movs r0, #1
	bl LoadBgTiles
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815B958
	ldr r5, _0815B918
	ldr r0, [r5]
	ldr r0, [r0, #0x18]
	ldrh r0, [r0]
	bl IsSpeciesNotUnown
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x18]
	ldrh r0, [r0, #2]
	bl IsSpeciesNotUnown
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _0815B8D8
	ldr r6, [sp, #4]
	movs r5, #0
	movs r0, #7
	mov ip, r0
	movs r7, #0
_0815B88C:
	movs r4, #0
	adds r3, r7, r6
	mov r1, ip
	lsls r0, r1, #1
	adds r2, r0, r6
_0815B896:
	ldrh r1, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	strh r1, [r2]
	adds r3, #2
	subs r2, #2
	adds r4, #1
	cmp r4, #3
	ble _0815B896
	movs r2, #0x20
	add ip, r2
	adds r7, #0x40
	adds r5, #1
	cmp r5, #7
	ble _0815B88C
	movs r5, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r3, r0, #0
_0815B8BC:
	adds r2, r5, #1
	lsls r0, r5, #6
	adds r1, r0, r6
	movs r4, #7
_0815B8C4:
	ldrh r0, [r1]
	eors r0, r3
	strh r0, [r1]
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bge _0815B8C4
	adds r5, r2, #0
	cmp r5, #7
	ble _0815B8BC
_0815B8D8:
	ldr r0, _0815B918
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r0, [r0, #2]
	bl IsSpeciesNotUnown
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815B928
	ldr r3, _0815B91C
	ldr r4, _0815B920
	ldr r2, _0815B910
	ldrb r0, [r2]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r1, _0815B924
	b _0815B942
	.align 2, 0
_0815B908: .4byte 0x02024178
_0815B90C: .4byte 0x02024188
_0815B910: .4byte 0x020380D6
_0815B914: .4byte 0x04000200
_0815B918: .4byte 0x02039BD4
_0815B91C: .4byte 0x020205AC
_0815B920: .4byte 0x02023E88
_0815B924: .4byte 0x082D2F50
_0815B928:
	ldr r3, _0815B96C
	ldr r4, _0815B970
	ldr r2, _0815B974
	ldrb r0, [r2]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r1, _0815B978
_0815B942:
	str r1, [r0]
	ldrb r0, [r2]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	bl StartSpriteAffineAnim
_0815B958:
	ldr r0, _0815B97C
	mov r1, sb
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
_0815B962:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0815BA38
	.align 2, 0
_0815B96C: .4byte 0x020205AC
_0815B970: .4byte 0x02023E88
_0815B974: .4byte 0x020380D6
_0815B978: .4byte 0x082D2F24
_0815B97C: .4byte 0x03005B60
_0815B980:
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	adds r4, r0, r3
	ldrh r0, [r4, #0xc]
	adds r1, r0, #1
	strh r1, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815BA38
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	ldrh r5, [r4, #0xa]
	lsls r1, r5, #4
	orrs r1, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x4c
	bl SetGpuReg
	cmp r5, #0
	bne _0815BA38
_0815B9B6:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815BA38
_0815B9BE:
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	ldr r0, _0815B9E4
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815B9E8
	movs r0, #1
	movs r1, #2
	movs r2, #0
	bl SetAnimBgAttribute
	b _0815B9F2
	.align 2, 0
_0815B9E4: .4byte 0x020380D6
_0815B9E8:
	movs r0, #2
	movs r1, #2
	movs r2, #0
	bl SetAnimBgAttribute
_0815B9F2:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815BA32
	ldr r4, _0815BA48
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815BA32
	ldr r0, _0815BA4C
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r6, #0x1c
	ldrsh r0, [r1, r6]
	cmp r0, #0
	bne _0815BA32
	ldrb r0, [r4]
	ldr r1, _0815BA50
	ldr r1, [r1]
	ldr r2, [r1]
	lsls r1, r0, #2
	adds r1, r1, r2
	ldrh r1, [r1, #2]
	bl SetBattlerShadowSpriteCallback
_0815BA32:
	mov r0, r8
	bl DestroyAnimVisualTask
_0815BA38:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815BA48: .4byte 0x020380D6
_0815BA4C: .4byte 0x03005B60
_0815BA50: .4byte 0x02024174
	thumb_func_end sub_0815B70C

	thumb_func_start sub_0815BA54
sub_0815BA54: @ 0x0815BA54
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0815BA84
	ldr r3, _0815BA88
	ldr r2, _0815BA8C
	ldr r1, _0815BA90
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r1, #0x3e
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	strh r1, [r4, #0xe]
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815BA84: .4byte 0x020380BE
_0815BA88: .4byte 0x020205AC
_0815BA8C: .4byte 0x02023E88
_0815BA90: .4byte 0x020380D6
	thumb_func_end sub_0815BA54

	thumb_func_start sub_0815BA94
sub_0815BA94: @ 0x0815BA94
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0815BAB8
	ldrb r0, [r0]
	ldr r1, _0815BABC
	ldrb r1, [r1]
	movs r2, #1
	bl HandleSpeciesGfxDataChange
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815BAB8: .4byte 0x020380D6
_0815BABC: .4byte 0x020380D7
	thumb_func_end sub_0815BA94

	thumb_func_start sub_0815BAC0
sub_0815BAC0: @ 0x0815BAC0
	push {r4, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0815BAE8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #4
	bls _0815BADE
	b _0815BD2E
_0815BADE:
	lsls r0, r0, #2
	ldr r1, _0815BAEC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815BAE8: .4byte 0x03005B60
_0815BAEC: .4byte 0x0815BAF0
_0815BAF0: @ jump table
	.4byte _0815BB04 @ case 0
	.4byte _0815BBF4 @ case 1
	.4byte _0815BC44 @ case 2
	.4byte _0815BCAE @ case 3
	.4byte _0815BCE2 @ case 4
_0815BB04:
	ldr r1, _0815BB60
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815BB3E
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
_0815BB3E:
	mov r0, sp
	bl sub_080A63F8
	ldr r1, _0815BB64
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815BB70
	ldr r1, _0815BB68
	ldr r3, _0815BB6C
	b _0815BB98
	.align 2, 0
_0815BB60: .4byte 0x00003F42
_0815BB64: .4byte 0x08C2A790
_0815BB68: .4byte 0x02022ACC
_0815BB6C: .4byte 0x0000FFC8
_0815BB70:
	ldr r0, _0815BB88
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815BB94
	ldr r1, _0815BB8C
	ldr r2, _0815BB90
	adds r0, r2, #0
	b _0815BB9A
	.align 2, 0
_0815BB88: .4byte 0x020380D6
_0815BB8C: .4byte 0x02022ACC
_0815BB90: .4byte 0x0000FF79
_0815BB94:
	ldr r1, _0815BBDC
	ldr r3, _0815BBE0
_0815BB98:
	adds r0, r3, #0
_0815BB9A:
	strh r0, [r1]
	ldr r1, _0815BBE4
	movs r0, #0
	strh r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _0815BBE8
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r0, _0815BBEC
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r0, _0815BBF0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0815BBDC
	ldrh r0, [r0]
	strh r0, [r1, #0x1c]
	ldr r0, _0815BBE4
	ldrh r0, [r0]
	strh r0, [r1, #0x1e]
	ldrh r0, [r1, #8]
	adds r0, #1
	b _0815BCCA
	.align 2, 0
_0815BBDC: .4byte 0x02022ACC
_0815BBE0: .4byte 0x0000FFF6
_0815BBE4: .4byte 0x02022ACE
_0815BBE8: .4byte 0x08C2A6D8
_0815BBEC: .4byte 0x08C2A778
_0815BBF0: .4byte 0x03005B60
_0815BBF4:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0x10]
	adds r1, r0, #1
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0815BC0A
	b _0815BD2E
_0815BC0A:
	movs r0, #0
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0815BC20
	movs r0, #0xc
	strh r0, [r4, #0xa]
_0815BC20:
	ldrh r0, [r4, #0xa]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xc
	bne _0815BD2E
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815BD2E
_0815BC44:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0815BC5C
	movs r0, #0
	strh r0, [r4, #0xa]
_0815BC5C:
	ldrh r0, [r4, #0xa]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0815BD2E
	ldr r2, _0815BCA0
	ldr r1, _0815BCA4
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0815BCA8
	strh r0, [r4, #8]
	b _0815BD2E
	.align 2, 0
_0815BCA0: .4byte 0x02022ACC
_0815BCA4: .4byte 0x085AD268
_0815BCA8:
	movs r0, #3
	strh r0, [r4, #8]
	b _0815BD2E
_0815BCAE:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r0, [r1, #0xe]
	adds r0, #1
	strh r0, [r1, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0815BD2E
	movs r0, #0
	strh r0, [r1, #0xe]
	movs r0, #1
_0815BCCA:
	strh r0, [r1, #8]
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xe4
	bl PlaySE12WithPanning
	b _0815BD2E
_0815BCE2:
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	bl sub_080A6530
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815BD04
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_0815BD04:
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	ldr r0, _0815BD38
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0815BD3C
	strh r1, [r0]
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_0815BD2E:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815BD38: .4byte 0x02022ACC
_0815BD3C: .4byte 0x02022ACE
	thumb_func_end sub_0815BAC0

	thumb_func_start sub_0815BD40
sub_0815BD40: @ 0x0815BD40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl Random2
	lsls r0, r0, #0x10
	movs r1, #0xfc
	lsls r1, r1, #0xe
	ands r1, r0
	lsrs r5, r1, #0x10
	adds r1, r5, #0
	cmp r1, #0x1f
	ble _0815BD6A
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0815BD6A:
	ldr r4, _0815BE64
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r5
	strh r0, [r7, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x20
	strh r0, [r7, #0x22]
	ldr r1, _0815BE68
	ldrh r0, [r1]
	strh r0, [r7, #0x30]
	ldrh r0, [r1, #2]
	strh r0, [r7, #0x32]
	ldr r4, _0815BE6C
	movs r0, #0x20
	ldrsh r1, [r7, r0]
	movs r0, #0x22
	ldrsh r2, [r7, r0]
	adds r5, r7, #0
	adds r5, #0x43
	ldrb r3, [r5]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	bl CreateSprite
	mov sb, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r0, #0x20
	ldrsh r1, [r7, r0]
	movs r0, #0x22
	ldrsh r2, [r7, r0]
	ldrb r3, [r5]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	bl CreateSprite
	mov r8, r0
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov r0, sb
	lsls r2, r0, #4
	add r2, sb
	lsls r2, r2, #2
	ldr r1, _0815BE70
	mov sl, r1
	adds r5, r2, r1
	adds r0, r5, #0
	movs r1, #1
	str r2, [sp]
	bl StartSpriteAnim
	mov r0, r8
	lsls r6, r0, #4
	add r6, r8
	lsls r6, r6, #2
	mov r1, sl
	adds r4, r6, r1
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
	ldr r1, _0815BE68
	ldrh r0, [r1]
	strh r0, [r5, #0x30]
	ldrh r0, [r1, #2]
	strh r0, [r5, #0x32]
	ldrh r0, [r1]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x32]
	ldr r0, _0815BE74
	strh r0, [r5, #0x3c]
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r4, #0x3c]
	adds r5, #0x3e
	ldrb r0, [r5]
	movs r1, #4
	orrs r0, r1
	strb r0, [r5]
	adds r4, #0x3e
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0x1c
	add sl, r0
	ldr r2, [sp]
	add r2, sl
	ldr r0, _0815BE78
	str r0, [r2]
	add r6, sl
	str r0, [r6]
	mov r1, sb
	strh r1, [r7, #0x3a]
	mov r0, r8
	strh r0, [r7, #0x3c]
	ldr r0, _0815BE7C
	str r0, [r7, #0x1c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815BE64: .4byte 0x020380D6
_0815BE68: .4byte 0x020380BE
_0815BE6C: .4byte 0x085AD294
_0815BE70: .4byte 0x020205AC
_0815BE74: .4byte 0x0000FFFF
_0815BE78: .4byte 0x0815BF8D
_0815BE7C: .4byte 0x0815BE81
	thumb_func_end sub_0815BD40

	thumb_func_start sub_0815BE80
sub_0815BE80: @ 0x0815BE80
	push {lr}
	adds r3, r0, #0
	ldrh r2, [r3, #0x32]
	ldrh r0, [r3, #0x34]
	adds r2, r2, r0
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r3, #0x26]
	subs r1, r1, r0
	strh r1, [r3, #0x26]
	movs r0, #0xff
	ands r2, r0
	strh r2, [r3, #0x34]
	movs r2, #0x36
	ldrsh r0, [r3, r2]
	cmp r0, #0
	bne _0815BECE
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0815BECE
	ldr r2, _0815BF28
	movs r0, #0x3a
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r3, #0x36]
	adds r0, #1
	strh r0, [r3, #0x36]
_0815BECE:
	movs r1, #0x36
	ldrsh r0, [r3, r1]
	cmp r0, #1
	bne _0815BF02
	movs r2, #0x26
	ldrsh r1, [r3, r2]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0815BF02
	ldr r2, _0815BF28
	movs r0, #0x3c
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r3, #0x36]
	adds r0, #1
	strh r0, [r3, #0x36]
_0815BF02:
	ldrh r0, [r3, #0x30]
	subs r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0815BF24
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0815BF2C
	str r0, [r3, #0x1c]
_0815BF24:
	pop {r0}
	bx r0
	.align 2, 0
_0815BF28: .4byte 0x020205AC
_0815BF2C: .4byte 0x0815BF31
	thumb_func_end sub_0815BE80

	thumb_func_start sub_0815BF30
sub_0815BF30: @ 0x0815BF30
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0815BF84
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r3, r0, #2
	adds r6, r5, #0
	adds r6, #0x1c
	adds r0, r3, r6
	ldr r2, [r0]
	ldr r0, _0815BF88
	cmp r2, r0
	bne _0815BF7C
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldr r0, [r1]
	cmp r0, r2
	bne _0815BF7C
	adds r0, r3, r5
	bl DestroySprite
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815BF7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815BF84: .4byte 0x020205AC
_0815BF88: .4byte 0x08007141
	thumb_func_end sub_0815BF30

	thumb_func_start sub_0815BF8C
sub_0815BF8C: @ 0x0815BF8C
	push {lr}
	adds r3, r0, #0
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0815BFD8
	ldrh r2, [r3, #0x32]
	ldrh r1, [r3, #0x34]
	adds r2, r2, r1
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r3, #0x26]
	subs r0, r0, r1
	strh r0, [r3, #0x26]
	movs r0, #0xff
	ands r2, r0
	strh r2, [r3, #0x34]
	ldrh r0, [r3, #0x30]
	subs r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0815BFD8
	mov r1, ip
	ldrb r0, [r1]
	movs r1, #4
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldr r0, _0815BFDC
	str r0, [r3, #0x1c]
_0815BFD8:
	pop {r0}
	bx r0
	.align 2, 0
_0815BFDC: .4byte 0x08007141
	thumb_func_end sub_0815BF8C

	thumb_func_start sub_0815BFE0
sub_0815BFE0: @ 0x0815BFE0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0815C008
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r4, r1, #0
	cmp r0, #5
	bls _0815BFFE
	b _0815C2D2
_0815BFFE:
	lsls r0, r0, #2
	ldr r1, _0815C00C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815C008: .4byte 0x03005B60
_0815C00C: .4byte 0x0815C010
_0815C010: @ jump table
	.4byte _0815C028 @ case 0
	.4byte _0815C160 @ case 1
	.4byte _0815C1E8 @ case 2
	.4byte _0815C21E @ case 3
	.4byte _0815C24C @ case 4
	.4byte _0815C286 @ case 5
_0815C028:
	ldr r1, _0815C084
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _0815C088
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815C060
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
_0815C060:
	mov r0, sp
	bl sub_080A63F8
	ldr r1, _0815C08C
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815C098
	ldr r1, _0815C090
	ldr r3, _0815C094
	adds r0, r3, #0
	b _0815C106
	.align 2, 0
_0815C084: .4byte 0x00003F42
_0815C088: .4byte 0x00000D03
_0815C08C: .4byte 0x08C2A790
_0815C090: .4byte 0x02022ACC
_0815C094: .4byte 0x0000FFC8
_0815C098:
	ldr r0, _0815C0DC
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815C0F0
	cmp r4, #1
	bne _0815C0BC
	ldr r1, _0815C0E0
	ldr r2, _0815C0E4
	adds r0, r2, #0
	strh r0, [r1]
_0815C0BC:
	cmp r4, #3
	bne _0815C0C8
	ldr r1, _0815C0E0
	ldr r3, _0815C0E8
	adds r0, r3, #0
	strh r0, [r1]
_0815C0C8:
	cmp r4, #0
	bne _0815C0D2
	ldr r1, _0815C0E0
	movs r0, #0xe
	strh r0, [r1]
_0815C0D2:
	cmp r4, #2
	bne _0815C108
	ldr r1, _0815C0E0
	ldr r2, _0815C0EC
	b _0815C104
	.align 2, 0
_0815C0DC: .4byte 0x020380D7
_0815C0E0: .4byte 0x02022ACC
_0815C0E4: .4byte 0x0000FF65
_0815C0E8: .4byte 0x0000FF8D
_0815C0EC: .4byte 0x0000FFEC
_0815C0F0:
	cmp r4, #1
	bne _0815C0FC
	ldr r1, _0815C144
	ldr r3, _0815C148
	adds r0, r3, #0
	strh r0, [r1]
_0815C0FC:
	cmp r4, #0
	bne _0815C108
	ldr r1, _0815C144
	ldr r2, _0815C14C
_0815C104:
	adds r0, r2, #0
_0815C106:
	strh r0, [r1]
_0815C108:
	ldr r1, _0815C150
	movs r0, #0
	strh r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _0815C154
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r0, _0815C158
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r0, _0815C15C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0815C144
	ldrh r0, [r0]
	strh r0, [r1, #0x1c]
	ldr r0, _0815C150
	ldrh r0, [r0]
	strh r0, [r1, #0x1e]
	b _0815C1E0
	.align 2, 0
_0815C144: .4byte 0x02022ACC
_0815C148: .4byte 0x0000FF79
_0815C14C: .4byte 0x0000FFF6
_0815C150: .4byte 0x02022ACE
_0815C154: .4byte 0x08C2A6D8
_0815C158: .4byte 0x08C2A778
_0815C15C: .4byte 0x03005B60
_0815C160:
	ldr r1, _0815C194
	lsls r4, r6, #2
	adds r0, r4, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r0, #0
	strh r0, [r5, #0xe]
	ldr r0, _0815C198
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815C1A4
	ldr r2, _0815C19C
	ldr r1, _0815C1A0
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r5, [r5, #0x1c]
	adds r0, r0, r5
	b _0815C1B6
	.align 2, 0
_0815C194: .4byte 0x03005B60
_0815C198: .4byte 0x020380D7
_0815C19C: .4byte 0x02022ACC
_0815C1A0: .4byte 0x085AD2AC
_0815C1A4:
	ldr r2, _0815C1D4
	ldr r1, _0815C1D8
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, #0x1c]
	subs r0, r0, r1
_0815C1B6:
	strh r0, [r2]
	ldr r0, _0815C1DC
	adds r1, r4, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0xc]
	adds r0, #1
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0815C1E0
	strh r0, [r1, #8]
	b _0815C2D2
	.align 2, 0
_0815C1D4: .4byte 0x02022ACC
_0815C1D8: .4byte 0x085AD2AC
_0815C1DC: .4byte 0x03005B60
_0815C1E0:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0815C2D2
_0815C1E8:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r4
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bgt _0815C202
	movs r0, #5
	strh r0, [r4, #0xa]
_0815C202:
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #8
	movs r0, #3
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bne _0815C2D2
	b _0815C23E
_0815C21E:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r4
	ldrh r1, [r4, #0xe]
	adds r1, #1
	strh r1, [r4, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0815C248
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _0815C2D2
_0815C23E:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815C2D2
	.align 2, 0
_0815C248: .4byte 0x085AD2B0
_0815C24C:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r4
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd
	ble _0815C266
	movs r0, #0xd
	strh r0, [r4, #0xa]
_0815C266:
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #8
	movs r0, #3
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xd
	bne _0815C2D2
	movs r0, #1
	strh r0, [r4, #8]
	b _0815C2D2
_0815C286:
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	bl sub_080A6530
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815C2A8
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_0815C2A8:
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	ldr r0, _0815C2DC
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0815C2E0
	strh r1, [r0]
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_0815C2D2:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815C2DC: .4byte 0x02022ACC
_0815C2E0: .4byte 0x02022ACE
	thumb_func_end sub_0815BFE0

	thumb_func_start sub_0815C2E4
sub_0815C2E4: @ 0x0815C2E4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _0815C31C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815C324
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0815C320
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815C336
	.align 2, 0
_0815C31C: .4byte 0x03005B60
_0815C320: .4byte 0x085AD2B8
_0815C324:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815C336
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0815C336:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0815C2E4

	thumb_func_start AnimWeakFrustrationAngerMark
AnimWeakFrustrationAngerMark: @ 0x0815C33C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bne _0815C35A
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0815C3AE
_0815C35A:
	adds r0, #1
	strh r0, [r4, #0x2e]
	cmp r1, #0x14
	ble _0815C3AE
	ldrh r0, [r4, #0x30]
	adds r0, #0xa0
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x32]
	adds r0, #0x80
	strh r0, [r4, #0x32]
	ldr r0, _0815C388
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815C38C
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	b _0815C392
	.align 2, 0
_0815C388: .4byte 0x020380D6
_0815C38C:
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
_0815C392:
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble _0815C3AE
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815C3AE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimWeakFrustrationAngerMark

	thumb_func_start AnimTask_RockMonBackAndForth
AnimTask_RockMonBackAndForth: @ 0x0815C3B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0815C3D8
	adds r4, r0, r1
	ldr r5, _0815C3DC
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0815C3E0
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	b _0815C474
	.align 2, 0
_0815C3D8: .4byte 0x03005B60
_0815C3DC: .4byte 0x020380BE
_0815C3E0:
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0815C3EC
	movs r0, #0
	strh r0, [r5, #4]
_0815C3EC:
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #2
	ble _0815C3F8
	movs r0, #2
	strh r0, [r5, #4]
_0815C3F8:
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	movs r0, #4
	ldrsh r1, [r5, r0]
	lsls r1, r1, #1
	movs r0, #8
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	movs r1, #4
	ldrsh r0, [r5, r1]
	lsls r0, r0, #7
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r4, #0x10]
	ldrh r0, [r5, #4]
	adds r0, #2
	strh r0, [r4, #0x12]
	ldrh r0, [r5, #2]
	subs r0, #1
	strh r0, [r4, #0x14]
	ldrb r0, [r5]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0815C444
	ldr r0, _0815C440
	b _0815C446
	.align 2, 0
_0815C440: .4byte 0x020380D6
_0815C444:
	ldr r0, _0815C47C
_0815C446:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815C464
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_0815C464:
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	ldr r0, _0815C480
	str r0, [r4]
_0815C474:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815C47C: .4byte 0x020380D7
_0815C480: .4byte 0x0815C485
	thumb_func_end AnimTask_RockMonBackAndForth

	thumb_func_start AnimTask_RockMonBackAndForthStep
AnimTask_RockMonBackAndForthStep: @ 0x0815C484
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0815C4A8
	adds r4, r0, r1
	movs r0, #8
	ldrsh r6, [r4, r0]
	cmp r6, #1
	beq _0815C50C
	cmp r6, #1
	bgt _0815C4AC
	cmp r6, #0
	beq _0815C4B8
	b _0815C5E4
	.align 2, 0
_0815C4A8: .4byte 0x03005B60
_0815C4AC:
	cmp r6, #2
	beq _0815C564
	cmp r6, #3
	bne _0815C4B6
	b _0815C5D4
_0815C4B6:
	b _0815C5E4
_0815C4B8:
	ldr r2, _0815C508
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x12]
	ldrh r2, [r0, #0x24]
	adds r1, r1, r2
	strh r1, [r0, #0x24]
	ldrh r0, [r4, #0xc]
	ldrh r1, [r4, #0x10]
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0xc]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromRotation
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0815C5E4
	strh r6, [r4, #0xa]
	b _0815C5CC
	.align 2, 0
_0815C508: .4byte 0x020205AC
_0815C50C:
	ldr r2, _0815C560
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x24]
	ldrh r2, [r4, #0x12]
	subs r1, r1, r2
	strh r1, [r0, #0x24]
	ldrh r0, [r4, #0x10]
	ldrh r1, [r4, #0xc]
	adds r0, r0, r1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0xc]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromRotation
	ldrh r1, [r4, #0xa]
	adds r1, #1
	strh r1, [r4, #0xa]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	cmp r1, r0
	blt _0815C5E4
	movs r0, #0
	strh r0, [r4, #0xa]
	b _0815C5CC
	.align 2, 0
_0815C560: .4byte 0x020205AC
_0815C564:
	ldr r2, _0815C5C8
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x12]
	ldrh r2, [r0, #0x24]
	adds r1, r1, r2
	movs r5, #0
	strh r1, [r0, #0x24]
	ldrh r0, [r4, #0xc]
	ldrh r1, [r4, #0x10]
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0xc]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromRotation
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0815C5E4
	ldrh r1, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0815C5CC
	subs r0, r1, #1
	strh r0, [r4, #0x14]
	strh r5, [r4, #0xa]
	strh r5, [r4, #8]
	b _0815C5E4
	.align 2, 0
_0815C5C8: .4byte 0x020205AC
_0815C5CC:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815C5E4
_0815C5D4:
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ResetSpriteRotScale
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0815C5E4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_RockMonBackAndForthStep

	thumb_func_start AnimSweetScentPetal
AnimSweetScentPetal: @ 0x0815C5EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0815C608
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0815C610
	strh r0, [r4, #0x20]
	ldr r1, _0815C60C
	ldrh r0, [r1]
	b _0815C61A
	.align 2, 0
_0815C608: .4byte 0x020380D6
_0815C60C: .4byte 0x020380BE
_0815C610:
	movs r0, #0xf0
	strh r0, [r4, #0x20]
	ldr r1, _0815C634
	ldrh r0, [r1]
	subs r0, #0x1e
_0815C61A:
	strh r0, [r4, #0x22]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x32]
	ldrb r1, [r1, #2]
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r0, _0815C638
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815C634: .4byte 0x020380BE
_0815C638: .4byte 0x0815C63D
	thumb_func_end AnimSweetScentPetal

	thumb_func_start AnimSweetScentPetalStep
AnimSweetScentPetalStep: @ 0x0815C63C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #3
	strh r0, [r4, #0x2e]
	ldr r0, _0815C67C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815C680
	ldrh r1, [r4, #0x20]
	adds r1, #5
	strh r1, [r4, #0x20]
	ldrh r0, [r4, #0x22]
	subs r0, #1
	strh r0, [r4, #0x22]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xf0
	ble _0815C66E
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815C66E:
	ldrh r1, [r4, #0x2e]
	movs r0, #0xff
	ands r0, r1
	movs r1, #0x10
	bl Sin
	b _0815C6A4
	.align 2, 0
_0815C67C: .4byte 0x020380D6
_0815C680:
	ldrh r1, [r4, #0x20]
	subs r1, #5
	strh r1, [r4, #0x20]
	ldrh r0, [r4, #0x22]
	adds r0, #1
	strh r0, [r4, #0x22]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _0815C698
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815C698:
	ldrh r1, [r4, #0x2e]
	movs r0, #0xff
	ands r0, r1
	movs r1, #0x10
	bl Cos
_0815C6A4:
	strh r0, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimSweetScentPetalStep

	thumb_func_start AnimTask_FlailMovement
AnimTask_FlailMovement: @ 0x0815C6AC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0815C6F4
	adds r4, r4, r0
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	movs r0, #0x20
	strh r0, [r4, #0x20]
	movs r0, #0x40
	strh r0, [r4, #0x22]
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r4, #0x24]
	ldr r0, _0815C6F8
	ldrb r0, [r0]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	ldr r0, _0815C6FC
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815C6F4: .4byte 0x03005B60
_0815C6F8: .4byte 0x020380BE
_0815C6FC: .4byte 0x0815C701
	thumb_func_end AnimTask_FlailMovement

	thumb_func_start AnimTask_FlailMovementStep
AnimTask_FlailMovementStep: @ 0x0815C700
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0815C72C
	adds r7, r0, r1
	movs r1, #8
	ldrsh r0, [r7, r1]
	mov r8, r0
	cmp r0, #1
	beq _0815C79C
	cmp r0, #1
	bgt _0815C730
	cmp r0, #0
	beq _0815C738
	b _0815C816
	.align 2, 0
_0815C72C: .4byte 0x03005B60
_0815C730:
	mov r2, r8
	cmp r2, #2
	beq _0815C804
	b _0815C816
_0815C738:
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r1, [r7, #0xc]
	adds r2, r0, r1
	strh r2, [r7, #0xc]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r7, #0x24]
	mov r8, r3
	movs r3, #0x24
	ldrsh r1, [r7, r3]
	cmp r0, r1
	blt _0815C816
	mov r0, r8
	subs r5, r0, r2
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r6, r1, #0
	lsls r6, r6, #1
	adds r0, r5, #0
	adds r1, r6, #0
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #1
	ands r4, r1
	cmp r4, #0
	bne _0815C790
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	subs r0, r2, r0
	b _0815C7EE
_0815C790:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	subs r0, r0, r3
	strh r0, [r7, #0xc]
	b _0815C816
_0815C79C:
	ldr r1, _0815C7F4
	adds r0, r1, #0
	ldrh r2, [r7, #0xc]
	adds r1, r0, r2
	strh r1, [r7, #0xc]
	movs r3, #0xc
	ldrsh r0, [r7, r3]
	movs r2, #0x24
	ldrsh r6, [r7, r2]
	cmn r0, r6
	bgt _0815C816
	ldrh r3, [r7, #0x24]
	mov sb, r3
	mov r0, sb
	subs r4, r0, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r6, r6, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, r8
	ands r1, r5
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _0815C7F8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	subs r0, r0, r2
_0815C7EE:
	strh r0, [r7, #0xc]
	strh r1, [r7, #8]
	b _0815C816
	.align 2, 0
_0815C7F4: .4byte 0xFFFFFE00
_0815C7F8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r3, sb
	subs r0, r3, r0
	strh r0, [r7, #0xc]
	b _0815C816
_0815C804:
	ldrh r0, [r7, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ResetSpriteRotScale
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _0815C88C
_0815C816:
	ldrh r0, [r7, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r7, #0xc]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrh r0, [r7, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromRotation
	ldr r2, _0815C884
	movs r0, #0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	movs r2, #0xc
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _0815C84A
	adds r0, #0x3f
_0815C84A:
	asrs r0, r0, #6
	rsbs r0, r0, #0
	strh r0, [r1, #0x24]
	ldrh r0, [r7, #0xa]
	adds r0, #1
	strh r0, [r7, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0815C88C
	ldrh r1, [r7, #0x20]
	movs r3, #0x20
	ldrsh r0, [r7, r3]
	cmp r0, #0
	beq _0815C888
	subs r0, r1, #1
	strh r0, [r7, #0x20]
	ldrh r0, [r7, #0x24]
	ldrh r1, [r7, #0x22]
	subs r0, r0, r1
	strh r0, [r7, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bgt _0815C88C
	movs r0, #0x10
	strh r0, [r7, #0x24]
	b _0815C88C
	.align 2, 0
_0815C884: .4byte 0x020205AC
_0815C888:
	movs r0, #2
	strh r0, [r7, #8]
_0815C88C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_FlailMovementStep

	thumb_func_start AnimPainSplitProjectile
AnimPainSplitProjectile: @ 0x0815C898
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0815C8F8
	ldr r6, _0815C8F0
	movs r2, #4
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bne _0815C8CC
	ldr r4, _0815C8F4
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
_0815C8CC:
	ldrh r0, [r6]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	ldrh r1, [r6, #2]
	ldrh r2, [r5, #0x22]
	adds r0, r1, r2
	strh r0, [r5, #0x22]
	movs r0, #0x80
	strh r0, [r5, #0x30]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x34]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _0815C956
	.align 2, 0
_0815C8F0: .4byte 0x020380BE
_0815C8F4: .4byte 0x020380D6
_0815C8F8:
	ldrh r1, [r5, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	strh r0, [r5, #0x24]
	ldrh r0, [r5, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r5, #0x26]
	adds r0, r0, r2
	strh r0, [r5, #0x26]
	movs r2, #0x36
	ldrsh r0, [r5, r2]
	adds r4, r1, #0
	cmp r0, #0
	bne _0815C936
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	movs r2, #0x34
	ldrsh r0, [r5, r2]
	cmn r1, r0
	ble _0815C936
	movs r0, #1
	strh r0, [r5, #0x36]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	rsbs r0, r0, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #1
	strh r0, [r5, #0x32]
_0815C936:
	adds r0, r4, #0
	adds r0, #0xc0
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	adds r0, #0x80
	strh r0, [r5, #0x32]
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0815C956
	adds r0, r5, #0
	bl DestroyAnimSprite
_0815C956:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AnimPainSplitProjectile

	thumb_func_start AnimTask_PainSplitMovement
AnimTask_PainSplitMovement: @ 0x0815C95C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r0, #0
	ldr r1, _0815C98C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r1, #8
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0815CA68
	ldr r0, _0815C990
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r8, r0
	cmp r1, #0
	bne _0815C998
	ldr r0, _0815C994
	b _0815C99A
	.align 2, 0
_0815C98C: .4byte 0x03005B60
_0815C990: .4byte 0x020380BE
_0815C994: .4byte 0x020380D6
_0815C998:
	ldr r0, _0815C9D4
_0815C99A:
	ldrb r0, [r0]
	strh r0, [r2, #0x1e]
	mov r1, r8
	ldrb r0, [r1]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0815C9D8
	lsls r4, r7, #2
	adds r0, r4, r7
	lsls r0, r0, #3
	adds r6, r0, r1
	strh r5, [r6, #0x1c]
	adds r0, r5, #0
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	mov r2, r8
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r0, #1
	beq _0815C9FC
	cmp r0, #1
	bgt _0815C9DC
	cmp r0, #0
	beq _0815C9E4
	lsls r2, r5, #4
	b _0815CA44
	.align 2, 0
_0815C9D4: .4byte 0x020380D7
_0815C9D8: .4byte 0x03005B60
_0815C9DC:
	cmp r0, #2
	beq _0815CA06
	lsls r2, r5, #4
	b _0815CA44
_0815C9E4:
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r5, #0
	movs r1, #0xe0
	movs r3, #0
	bl SetSpriteRotScale
	adds r0, r5, #0
	bl SetBattlerSpriteYOffsetFromYScale
	lsls r2, r5, #4
	b _0815CA44
_0815C9FC:
	movs r2, #0x98
	lsls r2, r2, #1
	movs r3, #0xf0
	lsls r3, r3, #4
	b _0815CA0E
_0815CA06:
	movs r2, #0x98
	lsls r2, r2, #1
	movs r3, #0xf1
	lsls r3, r3, #8
_0815CA0E:
	adds r0, r5, #0
	movs r1, #0xd0
	bl SetSpriteRotScale
	adds r0, r5, #0
	bl SetBattlerSpriteYOffsetFromYScale
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815CA34
	ldrb r0, [r6, #0x1e]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsls r2, r5, #4
	cmp r0, #0
	bne _0815CA44
_0815CA34:
	ldr r0, _0815CA60
	lsls r2, r5, #4
	adds r1, r2, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	adds r0, #0x10
	strh r0, [r1, #0x26]
_0815CA44:
	ldr r1, _0815CA60
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0, #0x24]
	ldr r0, _0815CA64
	adds r1, r4, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0815CAB4
	.align 2, 0
_0815CA60: .4byte 0x020205AC
_0815CA64: .4byte 0x03005B60
_0815CA68:
	ldrb r5, [r2, #0x1c]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	movs r4, #0
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _0815CA8C
	strh r4, [r2, #0xc]
	ldr r0, _0815CAC0
	lsls r1, r5, #4
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x24]
	rsbs r0, r0, #0
	strh r0, [r1, #0x24]
_0815CA8C:
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd
	bne _0815CAB4
	adds r0, r5, #0
	bl ResetSpriteRotScale
	ldr r1, _0815CAC0
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	strh r4, [r0, #0x24]
	strh r4, [r0, #0x26]
	adds r0, r7, #0
	bl DestroyAnimVisualTask
_0815CAB4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815CAC0: .4byte 0x020205AC
	thumb_func_end AnimTask_PainSplitMovement

	thumb_func_start AnimFlatterConfetti
AnimFlatterConfetti: @ 0x0815CAC4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xc
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r3, _0815CB10
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0815CB14
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	bl Random2
	ldr r5, _0815CB18
	ands r5, r0
	bl Random2
	movs r1, #0xff
	ands r1, r0
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0815CB1C
	movs r2, #0xbc
	lsls r2, r2, #3
	adds r0, r5, r2
	b _0815CB24
	.align 2, 0
_0815CB10: .4byte 0x000003FF
_0815CB14: .4byte 0xFFFFFC00
_0815CB18: .4byte 0x000001FF
_0815CB1C:
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r0, r3, #0
	subs r0, r0, r5
_0815CB24:
	strh r0, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0815CB36
	movs r2, #0x90
	lsls r2, r2, #3
	adds r0, r1, r2
	b _0815CB3E
_0815CB36:
	movs r3, #0x90
	lsls r3, r3, #3
	adds r0, r3, #0
	subs r0, r0, r1
_0815CB3E:
	strh r0, [r4, #0x30]
	ldr r0, _0815CB50
	ldrh r0, [r0]
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0815CB58
	ldr r0, _0815CB54
	b _0815CB5A
	.align 2, 0
_0815CB50: .4byte 0x020380BE
_0815CB54: .4byte 0x0000FFF8
_0815CB58:
	movs r0, #0xf8
_0815CB5A:
	strh r0, [r4, #0x20]
	movs r0, #0x68
	strh r0, [r4, #0x22]
	ldr r0, _0815CB6C
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815CB6C: .4byte 0x0815CB71
	thumb_func_end AnimFlatterConfetti

	thumb_func_start AnimFlatterConfettiStep
AnimFlatterConfettiStep: @ 0x0815CB70
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815CB88
	ldrh r3, [r4, #0x2e]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	b _0815CB92
_0815CB88:
	ldrh r3, [r4, #0x2e]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x24]
	subs r0, r0, r1
_0815CB92:
	strh r0, [r4, #0x24]
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x26]
	subs r0, r0, r1
	strh r0, [r4, #0x26]
	adds r0, r3, #0
	subs r0, #0x16
	strh r0, [r4, #0x2e]
	adds r1, r2, #0
	subs r1, #0x30
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0815CBB6
	movs r0, #0
	strh r0, [r4, #0x2e]
_0815CBB6:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _0815CBCA
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815CBCA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimFlatterConfettiStep

	thumb_func_start AnimFlatterSpotlight
AnimFlatterSpotlight: @ 0x0815CBD0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0815CC34
	movs r0, #0x4a
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #0
	bl SetGpuRegBits
	ldr r0, _0815CC38
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0815CC3C
	strh r1, [r4]
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x44
	bl SetGpuReg
	ldr r0, _0815CC40
	ldrh r0, [r0, #4]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	ldrb r1, [r5, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r5, #1]
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0815CC44
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815CC34: .4byte 0x00001F3F
_0815CC38: .4byte 0x02022AD8
_0815CC3C: .4byte 0x02022ADA
_0815CC40: .4byte 0x020380BE
_0815CC44: .4byte 0x0815CC49
	thumb_func_end AnimFlatterSpotlight

	thumb_func_start AnimFlatterSpotlightStep
AnimFlatterSpotlightStep: @ 0x0815CC48
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0815CC86
	cmp r0, #1
	bgt _0815CC5E
	cmp r0, #0
	beq _0815CC68
	b _0815CCE6
_0815CC5E:
	cmp r0, #2
	beq _0815CC9C
	cmp r0, #3
	beq _0815CCBE
	b _0815CCE6
_0815CC68:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0815CCE6
	b _0815CCB6
_0815CC86:
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0815CCE6
	adds r0, r4, #0
	movs r1, #1
	bl ChangeSpriteAffineAnim
	b _0815CCB6
_0815CC9C:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0815CCE6
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_0815CCB6:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	b _0815CCE6
_0815CCBE:
	ldr r1, _0815CCEC
	movs r0, #0x4a
	bl SetGpuReg
	movs r0, #0
	bl GetGpuReg
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815CCE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815CCEC: .4byte 0x00003F3F
	thumb_func_end AnimFlatterSpotlightStep

	thumb_func_start AnimReversalOrb
AnimReversalOrb: @ 0x0815CCF0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0815CD2C
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x20]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	ldr r1, _0815CD30
	ldrh r0, [r1]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x30]
	ldr r1, _0815CD34
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815CD2C: .4byte 0x020380D6
_0815CD30: .4byte 0x020380BE
_0815CD34: .4byte 0x0815CD39
	thumb_func_end AnimReversalOrb

	thumb_func_start AnimReversalOrbStep
AnimReversalOrbStep: @ 0x0815CD38
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	bl Sin
	strh r0, [r4, #0x24]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, #0x34]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #9
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	lsls r1, r0, #0x10
	cmp r0, #0x3f
	bls _0815CD72
	asrs r0, r1, #0x10
	cmp r0, #0xc3
	ble _0815CD84
_0815CD72:
	ldr r0, _0815CD80
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	subs r0, #1
	b _0815CD8E
	.align 2, 0
_0815CD80: .4byte 0x020380D6
_0815CD84:
	ldr r0, _0815CDD0
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	adds r0, #1
_0815CD8E:
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	movs r3, #0x38
	ldrsh r2, [r4, r3]
	cmp r2, #0
	bne _0815CDD4
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r3, [r4, #0x32]
	adds r0, r0, r3
	strh r0, [r4, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r3, [r4, #0x34]
	adds r0, r0, r3
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0815CE04
	strh r2, [r4, #0x36]
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0815CE04
	.align 2, 0
_0815CDD0: .4byte 0x020380D6
_0815CDD4:
	cmp r2, #1
	bne _0815CE04
	ldr r1, _0815CE0C
	adds r0, r1, #0
	ldrh r2, [r4, #0x32]
	adds r0, r0, r2
	strh r0, [r4, #0x32]
	ldr r3, _0815CE10
	adds r0, r3, #0
	ldrh r1, [r4, #0x34]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0815CE04
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815CE04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815CE0C: .4byte 0xFFFFFC00
_0815CE10: .4byte 0xFFFFFF00
	thumb_func_end AnimReversalOrbStep

	thumb_func_start AnimTask_RolePlaySilhouette
AnimTask_RolePlaySilhouette: @ 0x0815CE14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	movs r0, #0
	bl GetAnimBattlerSpriteId
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815CE54
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, _0815CE50
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldr r1, [r0, #0x10]
	mov sb, r1
	ldr r2, [r0, #0xc]
	mov r8, r2
	ldrh r6, [r0, #2]
	movs r3, #0x14
	b _0815CF94
	.align 2, 0
_0815CE50: .4byte 0x02039BD4
_0815CE54:
	ldr r0, _0815CEC4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815CF00
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r6, _0815CEC8
	ldr r4, _0815CECC
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r7, _0815CED0
	adds r0, r0, r7
	movs r1, #0
	bl GetMonData
	mov sb, r0
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r7
	movs r1, #1
	bl GetMonData
	mov r8, r0
	ldr r0, _0815CED4
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _0815CEF8
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815CED8
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r7
	b _0815CEE6
	.align 2, 0
_0815CEC4: .4byte 0x020380D6
_0815CEC8: .4byte 0x02023D12
_0815CECC: .4byte 0x020380D7
_0815CED0: .4byte 0x02024190
_0815CED4: .4byte 0x02024174
_0815CED8:
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	ldr r1, _0815CEF4
	adds r0, r0, r1
_0815CEE6:
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _0815CEFA
	.align 2, 0
_0815CEF4: .4byte 0x020243E8
_0815CEF8:
	ldrh r6, [r1, #2]
_0815CEFA:
	movs r1, #0x14
	mov sl, r1
	b _0815CF96
_0815CF00:
	movs r2, #1
	str r2, [sp, #0x1c]
	ldr r6, _0815CF64
	ldr r4, _0815CF68
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r7, _0815CF6C
	adds r0, r0, r7
	movs r1, #0
	bl GetMonData
	mov sb, r0
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r7
	movs r1, #1
	bl GetMonData
	mov r8, r0
	ldr r0, _0815CF70
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _0815CF90
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815CF78
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	ldr r1, _0815CF74
	adds r0, r0, r1
	b _0815CF84
	.align 2, 0
_0815CF64: .4byte 0x02023D12
_0815CF68: .4byte 0x020380D7
_0815CF6C: .4byte 0x020243E8
_0815CF70: .4byte 0x02024174
_0815CF74: .4byte 0x02024190
_0815CF78:
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r7
_0815CF84:
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _0815CF92
_0815CF90:
	ldrh r6, [r1, #2]
_0815CF92:
	ldr r3, _0815D080
_0815CF94:
	mov sl, r3
_0815CF96:
	ldr r0, _0815D084
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r5, _0815D084
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r4, r4, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	mov r3, sb
	str r3, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	ldr r0, _0815D088
	ldrb r0, [r0]
	str r0, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0x14]
	adds r0, r6, #0
	ldr r1, [sp, #0x1c]
	movs r2, #0
	adds r3, r4, #0
	bl sub_080A7C5C
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0815D08C
	lsls r5, r6, #4
	adds r5, r5, r6
	lsls r5, r5, #2
	adds r5, r5, r0
	movs r0, #3
	ands r7, r0
	lsls r7, r7, #2
	mov r8, r7
	ldrb r0, [r5, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r1, r0
	mov r2, r8
	orrs r1, r2
	strb r1, [r5, #5]
	ldrb r2, [r5, #1]
	adds r0, r4, #0
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	strb r0, [r5, #1]
	ldr r0, _0815D090
	lsrs r1, r1, #4
	lsls r1, r1, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	movs r2, #0x20
	bl FillPalette
	ldrb r0, [r5, #5]
	ands r4, r0
	mov r0, r8
	orrs r4, r0
	strb r4, [r5, #5]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldr r0, _0815D094
	ldr r1, [sp, #0x18]
	lsls r4, r1, #2
	adds r4, r4, r1
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #0xa]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	strh r6, [r4, #8]
	ldr r0, _0815D098
	str r0, [r4]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815D080: .4byte 0x0000FFEC
_0815D084: .4byte 0x020380D6
_0815D088: .4byte 0x020380D7
_0815D08C: .4byte 0x020205AC
_0815D090: .4byte 0x00007FFF
_0815D094: .4byte 0x03005B60
_0815D098: .4byte 0x0815D09D
	thumb_func_end AnimTask_RolePlaySilhouette

	thumb_func_start AnimTask_RolePlaySilhouetteStep1
AnimTask_RolePlaySilhouetteStep1: @ 0x0815D09C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0815D0F0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #0x1c]
	adds r1, r0, #1
	strh r1, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815D0EA
	movs r0, #0
	strh r0, [r4, #0x1c]
	ldrh r1, [r4, #0xa]
	adds r1, #1
	strh r1, [r4, #0xa]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bne _0815D0EA
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x1c]
	strh r0, [r4, #0x1e]
	ldr r0, _0815D0F4
	str r0, [r4]
_0815D0EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815D0F0: .4byte 0x03005B60
_0815D0F4: .4byte 0x0815D0F9
	thumb_func_end AnimTask_RolePlaySilhouetteStep1

	thumb_func_start AnimTask_RolePlaySilhouetteStep2
AnimTask_RolePlaySilhouetteStep2: @ 0x0815D0F8
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0815D170
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r5, r1, r2
	ldrb r2, [r5, #8]
	ldrh r0, [r5, #0x1c]
	subs r0, #0x10
	movs r4, #0
	strh r0, [r5, #0x1c]
	ldrh r0, [r5, #0x1e]
	adds r0, #0x80
	strh r0, [r5, #0x1e]
	ldr r1, _0815D174
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r6, r0, r1
	ldrb r2, [r6, #1]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1e
	movs r0, #2
	orrs r1, r0
	subs r0, #6
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #1]
	movs r0, #0x1c
	ldrsh r2, [r5, r0]
	movs r0, #0x1e
	ldrsh r3, [r5, r0]
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #1
	bl TrySetSpriteRotScale
	ldrh r0, [r5, #0x20]
	adds r0, #1
	strh r0, [r5, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0815D166
	adds r0, r6, #0
	bl sub_080A6D64
	adds r0, r6, #0
	bl DestroySpriteAndFreeResources_
	ldr r0, _0815D178
	str r0, [r5]
_0815D166:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815D170: .4byte 0x03005B60
_0815D174: .4byte 0x020205AC
_0815D178: .4byte 0x080A60DD
	thumb_func_end AnimTask_RolePlaySilhouetteStep2

	thumb_func_start AnimTask_AcidArmor
AnimTask_AcidArmor: @ 0x0815D17C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0815D19C
	adds r4, r1, r0
	ldr r0, _0815D1A0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0815D1A8
	ldr r0, _0815D1A4
	b _0815D1AA
	.align 2, 0
_0815D19C: .4byte 0x03005B60
_0815D1A0: .4byte 0x020380BE
_0815D1A4: .4byte 0x020380D6
_0815D1A8:
	ldr r0, _0815D228
_0815D1AA:
	ldrb r5, [r0]
	movs r6, #0
	strh r6, [r4, #8]
	strh r6, [r4, #0xa]
	strh r6, [r4, #0xc]
	movs r0, #0x10
	strh r0, [r4, #0xe]
	strh r6, [r4, #0x10]
	strh r5, [r4, #0x12]
	movs r0, #0x20
	strh r0, [r4, #0x14]
	strh r6, [r4, #0x16]
	movs r0, #0x18
	strh r0, [r4, #0x18]
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815D1DC
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0x18]
_0815D1DC:
	adds r0, r5, #0
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #0x22
	strh r0, [r4, #0x22]
	cmp r0, #0
	bge _0815D1F0
	strh r6, [r4, #0x22]
_0815D1F0:
	ldrh r0, [r4, #0x22]
	adds r0, #0x42
	strh r0, [r4, #0x24]
	ldr r0, _0815D22C
	ldrb r0, [r0]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	adds r0, r5, #0
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815D240
	ldr r0, _0815D230
	str r0, [sp]
	ldr r1, _0815D234
	movs r0, #0x50
	bl SetGpuReg
	ldr r0, _0815D238
	ldrh r5, [r0]
	ldr r0, _0815D23C
	b _0815D252
	.align 2, 0
_0815D228: .4byte 0x020380D7
_0815D22C: .4byte 0x020380BE
_0815D230: .4byte 0x04000014
_0815D234: .4byte 0x00003F42
_0815D238: .4byte 0x02022ACC
_0815D23C: .4byte 0x02022ACE
_0815D240:
	ldr r0, _0815D2B8
	str r0, [sp]
	ldr r1, _0815D2BC
	movs r0, #0x50
	bl SetGpuReg
	ldr r0, _0815D2C0
	ldrh r5, [r0]
	ldr r0, _0815D2C4
_0815D252:
	ldrh r3, [r0]
	movs r7, #0
	movs r2, #0
	ldr r6, _0815D2C8
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r0, r0, r6
	mov ip, r0
_0815D262:
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r0, r1, r6
	strh r5, [r0]
	add r1, ip
	strh r5, [r1]
	adds r0, r2, #1
	lsls r0, r0, #1
	adds r1, r0, r6
	strh r3, [r1]
	add r0, ip
	strh r3, [r0]
	lsls r0, r7, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r2, #2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0815D262
	ldr r0, _0815D2CC
	str r0, [sp, #4]
	mov r1, sp
	movs r2, #0
	movs r0, #1
	strb r0, [r1, #8]
	mov r0, sp
	strb r2, [r0, #9]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ScanlineEffect_SetParams
	ldr r0, _0815D2D0
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815D2B8: .4byte 0x04000018
_0815D2BC: .4byte 0x00003F44
_0815D2C0: .4byte 0x02022AD0
_0815D2C4: .4byte 0x02022AD2
_0815D2C8: .4byte 0x020388C8
_0815D2CC: .4byte 0xA6600001
_0815D2D0: .4byte 0x0815D2D5
	thumb_func_end AnimTask_AcidArmor

	thumb_func_start AnimTask_AcidArmorStep
AnimTask_AcidArmorStep: @ 0x0815D2D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0815D308
	adds r6, r0, r1
	ldrb r0, [r6, #0x12]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815D314
	ldr r0, _0815D30C
	ldrh r0, [r0]
	str r0, [sp, #4]
	ldr r0, _0815D310
	b _0815D31C
	.align 2, 0
_0815D308: .4byte 0x03005B60
_0815D30C: .4byte 0x02022ACC
_0815D310: .4byte 0x02022ACE
_0815D314:
	ldr r0, _0815D334
	ldrh r0, [r0]
	str r0, [sp, #4]
	ldr r0, _0815D338
_0815D31C:
	ldrh r0, [r0]
	str r0, [sp, #8]
	movs r1, #8
	ldrsh r0, [r6, r1]
	cmp r0, #1
	bne _0815D32A
	b _0815D508
_0815D32A:
	cmp r0, #1
	bgt _0815D33C
	cmp r0, #0
	beq _0815D34A
	b _0815D578
	.align 2, 0
_0815D334: .4byte 0x02022AD0
_0815D338: .4byte 0x02022AD2
_0815D33C:
	cmp r0, #2
	bne _0815D342
	b _0815D528
_0815D342:
	cmp r0, #3
	bne _0815D348
	b _0815D572
_0815D348:
	b _0815D578
_0815D34A:
	movs r2, #0x24
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0x11
	lsrs r5, r0, #0x10
	movs r3, #0
	str r3, [sp]
	mov sb, r3
	movs r4, #0
	ldrh r0, [r6, #0xa]
	adds r0, #2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6, #0xa]
	ldrh r7, [r6, #0xa]
	mov r8, r7
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0xfc
	lsls r0, r0, #3
	bl __divsi3
	strh r0, [r6, #0x1a]
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	lsls r0, r0, #1
	movs r2, #0x1a
	ldrsh r1, [r6, r2]
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r6, #0x1c]
	ldrh r0, [r6, #0x16]
	strh r0, [r6, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	strh r7, [r6, #0x20]
	ldrh r2, [r6, #0x24]
	lsls r3, r2, #0x10
	mov ip, r3
	asrs r1, r3, #0x10
	movs r3, #0x22
	ldrsh r0, [r6, r3]
	cmp r1, r0
	ble _0815D46A
	ldr r0, _0815D4C0
	mov sl, r0
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
_0815D3BA:
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r2, r5, #1
	lsls r2, r2, #1
	mov r3, sl
	ldrb r1, [r3, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	ldr r0, _0815D4C4
	adds r2, r2, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	subs r0, r4, r0
	ldr r3, [sp, #0xc]
	adds r0, r3, r0
	strh r0, [r2]
	lsls r3, r5, #1
	mov r0, sl
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r3, r3, r0
	ldr r1, _0815D4C4
	adds r3, r3, r1
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	mov r7, r8
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	lsls r0, r2, #1
	ldr r7, _0815D4C8
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	adds r1, r1, r0
	strh r1, [r3]
	adds r2, #0xa
	mov r8, r2
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrh r0, [r6, #0x1c]
	ldrh r2, [r6, #0x1e]
	adds r0, r0, r2
	strh r0, [r6, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	strh r7, [r6, #0x20]
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	subs r5, #2
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	str r2, [sp]
	asrs r0, r0, #0x15
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0815D4CC
	add r0, ip
	lsrs r2, r0, #0x10
	lsls r3, r2, #0x10
	mov ip, r3
	asrs r1, r3, #0x10
	movs r3, #0x22
	ldrsh r0, [r6, r3]
	cmp r1, r0
	bgt _0815D3BA
_0815D46A:
	lsls r1, r2, #0x11
	cmp r1, #0
	blt _0815D496
	ldr r4, _0815D4C4
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r3, r0, #0
	adds r3, #0xf0
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r5, r4, r0
_0815D482:
	asrs r2, r1, #0x10
	lsls r1, r2, #1
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r1, r5
	strh r3, [r1]
	subs r2, #2
	lsls r1, r2, #0x10
	cmp r1, #0
	bge _0815D482
_0815D496:
	ldrh r0, [r6, #0x14]
	adds r0, #1
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _0815D4FE
	movs r0, #0x40
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0xc]
	adds r0, #1
	strh r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0815D4D0
	ldrh r0, [r6, #0xe]
	subs r0, #1
	strh r0, [r6, #0xe]
	b _0815D4D6
	.align 2, 0
_0815D4C0: .4byte 0x020397C8
_0815D4C4: .4byte 0x020388C8
_0815D4C8: .4byte 0x082FA8CC
_0815D4CC: .4byte 0xFFFF0000
_0815D4D0:
	ldrh r0, [r6, #0x10]
	adds r0, #1
	strh r0, [r6, #0x10]
_0815D4D6:
	ldrh r1, [r6, #0x10]
	lsls r1, r1, #8
	ldrh r0, [r6, #0xe]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	cmp r1, #0
	bne _0815D578
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0x10
	bne _0815D578
	strh r1, [r6, #0xc]
	strh r1, [r6, #0xe]
	b _0815D56A
_0815D4FE:
	ldrh r0, [r6, #0x18]
	ldrh r7, [r6, #0x16]
	adds r0, r0, r7
	strh r0, [r6, #0x16]
	b _0815D578
_0815D508:
	ldrh r0, [r6, #0xc]
	adds r0, #1
	strh r0, [r6, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0815D578
	ldr r1, _0815D524
	movs r0, #3
	strb r0, [r1, #0x15]
	movs r0, #0
	strh r0, [r6, #0xc]
	b _0815D56A
	.align 2, 0
_0815D524: .4byte 0x020397C8
_0815D528:
	ldrh r0, [r6, #0xc]
	adds r0, #1
	strh r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0815D53E
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	b _0815D544
_0815D53E:
	ldrh r0, [r6, #0x10]
	subs r0, #1
	strh r0, [r6, #0x10]
_0815D544:
	ldrh r1, [r6, #0x10]
	lsls r1, r1, #8
	ldrh r0, [r6, #0xe]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	cmp r0, #0x10
	bne _0815D578
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bne _0815D578
	strh r0, [r6, #0xc]
	strh r0, [r6, #0xe]
_0815D56A:
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	b _0815D578
_0815D572:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_0815D578:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_AcidArmorStep

	thumb_func_start AnimTask_DeepInhale
AnimTask_DeepInhale: @ 0x0815D588
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0815D5C0
	adds r4, r4, r0
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, _0815D5C4
	ldrb r0, [r0]
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strh r1, [r4, #0x26]
	ldr r2, _0815D5C8
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _0815D5CC
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815D5C0: .4byte 0x03005B60
_0815D5C4: .4byte 0x020380BE
_0815D5C8: .4byte 0x085AD3F8
_0815D5CC: .4byte 0x0815D5D1
	thumb_func_end AnimTask_DeepInhale

	thumb_func_start AnimTask_DeepInhaleStep
AnimTask_DeepInhaleStep: @ 0x0815D5D0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r2, _0815D628
	adds r3, r0, r2
	ldrh r0, [r3, #8]
	adds r1, r0, #1
	movs r5, #0
	strh r1, [r3, #8]
	subs r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r2, #0
	cmp r0, #0x16
	bhi _0815D634
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815D644
	strh r5, [r3, #0xa]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	bne _0815D634
	ldr r2, _0815D62C
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _0815D630
	strh r1, [r0, #0x24]
	b _0815D644
	.align 2, 0
_0815D628: .4byte 0x03005B60
_0815D62C: .4byte 0x020205AC
_0815D630: .4byte 0x0000FFFF
_0815D634:
	ldr r2, _0815D664
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r5, [r0, #0x24]
_0815D644:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815D65C
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_0815D65C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815D664: .4byte 0x020205AC
	thumb_func_end AnimTask_DeepInhaleStep

	thumb_func_start InitYawnCloudPosition
InitYawnCloudPosition: @ 0x0815D668
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r2, #0
	adds r0, r3, #0
	ldr r4, [sp, #0x14]
	ldr r6, [sp, #0x18]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r2, r8
	strh r1, [r2, #0x20]
	strh r5, [r2, #0x22]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #4
	mov r3, r8
	strh r2, [r3, #0x36]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r2, r5, #4
	strh r2, [r3, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r1, r6, #0
	bl __divsi3
	mov r1, r8
	strh r0, [r1, #0x3a]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, r4, r5
	lsls r4, r4, #4
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	mov r2, r8
	strh r0, [r2, #0x3c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end InitYawnCloudPosition

	thumb_func_start UpdateYawnCloudPosition
UpdateYawnCloudPosition: @ 0x0815D6D0
	ldrh r1, [r0, #0x3a]
	ldrh r2, [r0, #0x36]
	adds r1, r1, r2
	strh r1, [r0, #0x36]
	ldrh r2, [r0, #0x3c]
	ldrh r3, [r0, #0x38]
	adds r2, r2, r3
	strh r2, [r0, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x20]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	strh r2, [r0, #0x22]
	bx lr
	.align 2, 0
	thumb_func_end UpdateYawnCloudPosition

	thumb_func_start AnimYawnCloud
AnimYawnCloud: @ 0x0815D6F0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrh r6, [r4, #0x20]
	ldrh r5, [r4, #0x22]
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r0, _0815D738
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartSpriteAffineAnim
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r0, #0x22
	ldrsh r2, [r4, r0]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r3, r6, #0
	bl InitYawnCloudPosition
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldr r0, _0815D73C
	str r0, [r4, #0x1c]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815D738: .4byte 0x020380BE
_0815D73C: .4byte 0x0815D741
	thumb_func_end AnimYawnCloud

	thumb_func_start AnimYawnCloudStep
AnimYawnCloudStep: @ 0x0815D740
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	lsls r4, r4, #3
	movs r0, #0xff
	ands r4, r0
	adds r0, r5, #0
	bl UpdateYawnCloudPosition
	adds r0, r4, #0
	movs r1, #8
	bl Sin
	strh r0, [r5, #0x26]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0x3a
	ble _0815D7A6
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815D7A6
	movs r0, #0
	strh r0, [r5, #0x30]
	ldrh r1, [r5, #0x32]
	adds r1, #1
	strh r1, [r5, #0x32]
	movs r0, #1
	ands r1, r0
	adds r3, r5, #0
	adds r3, #0x3e
	lsls r1, r1, #2
	ldrb r2, [r3]
	subs r0, #6
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #3
	ble _0815D7A6
	adds r0, r5, #0
	bl DestroySpriteAndMatrix
_0815D7A6:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AnimYawnCloudStep

	thumb_func_start AnimSmokeBallEscapeCloud
AnimSmokeBallEscapeCloud: @ 0x0815D7AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0815D804
	ldrh r0, [r6, #6]
	strh r0, [r5, #0x2e]
	ldrb r1, [r6]
	adds r0, r5, #0
	bl StartSpriteAffineAnim
	ldr r0, _0815D808
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815D7D2
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r6, #2]
_0815D7D2:
	ldr r4, _0815D80C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #2]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r6, [r6, #4]
	adds r0, r0, r6
	strh r0, [r5, #0x22]
	ldr r0, _0815D810
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815D804: .4byte 0x020380BE
_0815D808: .4byte 0x020380D7
_0815D80C: .4byte 0x020380D6
_0815D810: .4byte 0x0810EB19
	thumb_func_end AnimSmokeBallEscapeCloud

	thumb_func_start sub_0815D814
sub_0815D814: @ 0x0815D814
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r7, #0
	ldr r2, _0815D864
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrh r0, [r3, #8]
	subs r0, #1
	strh r0, [r3, #8]
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0815D896
	ldrh r0, [r3, #0xa]
	subs r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0815D896
	movs r2, #0x1a
	ldrsh r0, [r3, r2]
	cmp r0, #0
	bne _0815D868
	ldrh r0, [r3, #0x10]
	strh r0, [r3, #0x1a]
	rsbs r0, r0, #0
	strh r0, [r3, #0x10]
	b _0815D86A
	.align 2, 0
_0815D864: .4byte 0x03005B60
_0815D868:
	strh r7, [r3, #0x1a]
_0815D86A:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	mov r2, r8
	adds r1, r0, r2
	movs r2, #0x1c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0815D886
	ldrh r0, [r1, #0x12]
	strh r0, [r1, #0x1c]
	rsbs r0, r0, #0
	strh r0, [r1, #0x12]
	b _0815D88A
_0815D886:
	movs r0, #0
	strh r0, [r1, #0x1c]
_0815D88A:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0xa]
_0815D896:
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #3
	mov r1, r8
	adds r4, r0, r1
	ldrh r6, [r4, #0x16]
	ldrh r7, [r4, #0x18]
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0815D8D4
	ldr r3, _0815D8D0
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	lsrs r2, r6, #8
	ldrh r0, [r4, #0x1a]
	subs r0, r0, r2
	strh r0, [r1, #0x24]
	adds r2, r3, #0
	b _0815D8EA
	.align 2, 0
_0815D8D0: .4byte 0x020205AC
_0815D8D4:
	ldr r2, _0815D918
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	lsrs r1, r6, #8
	ldrh r4, [r4, #0x1a]
	adds r1, r1, r4
	strh r1, [r0, #0x24]
_0815D8EA:
	mov r1, ip
	adds r0, r1, r5
	lsls r0, r0, #3
	mov r1, r8
	adds r4, r0, r1
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0815D91C
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	lsrs r2, r7, #8
	ldrh r0, [r4, #0x1c]
	subs r0, r0, r2
	b _0815D92E
	.align 2, 0
_0815D918: .4byte 0x020205AC
_0815D91C:
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	lsrs r0, r7, #8
	ldrh r4, [r4, #0x1c]
	adds r0, r0, r4
_0815D92E:
	strh r0, [r1, #0x26]
	mov r2, ip
	adds r0, r2, r5
	lsls r0, r0, #3
	add r0, r8
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0815D94E
	adds r0, r5, #0
	bl DestroyTask
	ldr r1, _0815D958
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0815D94E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815D958: .4byte 0x0203809E
	thumb_func_end sub_0815D814

	thumb_func_start sub_0815D95C
sub_0815D95C: @ 0x0815D95C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r7, #0
	ldr r2, _0815D9B0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrh r0, [r3, #8]
	subs r0, #1
	strh r0, [r3, #8]
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0815D9E2
	ldrh r0, [r3, #0xa]
	subs r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0815D9E2
	movs r2, #0x1a
	ldrsh r0, [r3, r2]
	cmp r0, #0
	bne _0815D9B4
	ldrh r0, [r3, #0x10]
	strh r0, [r3, #0x1a]
	rsbs r0, r0, #0
	strh r0, [r3, #0x10]
	b _0815D9B6
	.align 2, 0
_0815D9B0: .4byte 0x03005B60
_0815D9B4:
	strh r7, [r3, #0x1a]
_0815D9B6:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	mov r2, r8
	adds r1, r0, r2
	movs r2, #0x1c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0815D9D2
	ldrh r0, [r1, #0x12]
	strh r0, [r1, #0x1c]
	rsbs r0, r0, #0
	strh r0, [r1, #0x12]
	b _0815D9D6
_0815D9D2:
	movs r0, #0
	strh r0, [r1, #0x1c]
_0815D9D6:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0xa]
_0815D9E2:
	lsls r3, r6, #2
	adds r0, r3, r6
	lsls r0, r0, #3
	mov r1, r8
	adds r4, r0, r1
	ldrh r2, [r4, #0xc]
	ldr r1, _0815DA34
	adds r0, r1, #0
	ands r0, r2
	ldrh r2, [r4, #0x16]
	adds r0, r0, r2
	lsls r5, r0, #0x10
	lsrs r0, r5, #0x10
	mov sb, r0
	ldrh r0, [r4, #0xe]
	ands r1, r0
	ldrh r2, [r4, #0x18]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	mov ip, r3
	cmp r0, #0
	beq _0815DA3C
	ldr r3, _0815DA38
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	lsrs r2, r5, #0x18
	ldrh r0, [r4, #0x1a]
	subs r0, r0, r2
	strh r0, [r1, #0x24]
	adds r2, r3, #0
	b _0815DA52
	.align 2, 0
_0815DA34: .4byte 0x00007FFF
_0815DA38: .4byte 0x020205AC
_0815DA3C:
	ldr r2, _0815DA80
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	lsrs r1, r5, #0x18
	ldrh r4, [r4, #0x1a]
	adds r1, r1, r4
	strh r1, [r0, #0x24]
_0815DA52:
	mov r1, ip
	adds r0, r1, r6
	lsls r0, r0, #3
	mov r1, r8
	adds r4, r0, r1
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0815DA84
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	lsrs r2, r7, #8
	ldrh r0, [r4, #0x1c]
	subs r0, r0, r2
	b _0815DA96
	.align 2, 0
_0815DA80: .4byte 0x020205AC
_0815DA84:
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	lsrs r0, r7, #8
	ldrh r4, [r4, #0x1c]
	adds r0, r0, r4
_0815DA96:
	strh r0, [r1, #0x26]
	mov r2, ip
	adds r0, r2, r6
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
	mov r0, sb
	strh r0, [r2, #0x16]
	strh r7, [r2, #0x18]
	movs r1, #8
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0815DABC
	movs r0, #0x1e
	strh r0, [r2, #8]
	movs r0, #0
	strh r0, [r2, #0x22]
	ldr r0, _0815DAC8
	str r0, [r2]
_0815DABC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815DAC8: .4byte 0x0815D815
	thumb_func_end sub_0815D95C

	thumb_func_start sub_0815DACC
sub_0815DACC: @ 0x0815DACC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0815DB2C
	mov r8, r0
	lsls r7, r6, #2
	adds r0, r7, r6
	lsls r0, r0, #3
	mov r1, r8
	adds r4, r0, r1
	ldr r1, _0815DB30
	ldr r2, _0815DB34
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0x26]
	ldr r5, _0815DB38
	ldrh r0, [r5]
	strh r0, [r4, #0x24]
	ldrh r0, [r5]
	strh r0, [r4, #8]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #0x22]
	movs r3, #6
	ldrsh r0, [r5, r3]
	cmp r0, #0
	beq _0815DB10
	ldrh r0, [r4, #0x14]
	ldr r3, _0815DB3C
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4, #0x14]
_0815DB10:
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815DB40
	ldrh r0, [r5, #2]
	strh r0, [r4, #0xc]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0xe]
	mov r3, r8
	adds r4, r7, #0
	b _0815DBB0
	.align 2, 0
_0815DB2C: .4byte 0x03005B60
_0815DB30: .4byte 0x02023E88
_0815DB34: .4byte 0x020380D6
_0815DB38: .4byte 0x020380BE
_0815DB3C: .4byte 0xFFFF8000
_0815DB40:
	movs r7, #2
	ldrsh r0, [r5, r7]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0815DB5C
	ldrh r1, [r5, #2]
	ldr r0, _0815DB58
	ands r0, r1
	b _0815DB64
	.align 2, 0
_0815DB58: .4byte 0x00007FFF
_0815DB5C:
	ldrh r0, [r5, #2]
	ldr r2, _0815DB8C
	adds r1, r2, #0
	orrs r0, r1
_0815DB64:
	strh r0, [r4, #0xc]
	ldr r0, _0815DB90
	movs r3, #4
	ldrsh r1, [r0, r3]
	movs r2, #0x80
	lsls r2, r2, #8
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _0815DB9C
	ldr r3, _0815DB94
	lsls r4, r6, #2
	adds r1, r4, r6
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrh r2, [r5, #4]
	ldr r0, _0815DB98
	ands r0, r2
	b _0815DBAE
	.align 2, 0
_0815DB8C: .4byte 0xFFFF8000
_0815DB90: .4byte 0x020380BE
_0815DB94: .4byte 0x03005B60
_0815DB98: .4byte 0x00007FFF
_0815DB9C:
	ldr r3, _0815DBD4
	lsls r4, r6, #2
	adds r1, r4, r6
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrh r2, [r5, #4]
	ldr r7, _0815DBD8
	adds r0, r7, #0
	orrs r0, r2
_0815DBAE:
	strh r0, [r1, #0xe]
_0815DBB0:
	adds r0, r4, r6
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x16]
	ldrh r1, [r5, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r5, #0xa]
	strh r1, [r0, #0x12]
	ldr r1, _0815DBDC
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815DBD4: .4byte 0x03005B60
_0815DBD8: .4byte 0xFFFF8000
_0815DBDC: .4byte 0x0815D95D
	thumb_func_end sub_0815DACC

	thumb_func_start AnimTask_SquishAndSweatDroplets
AnimTask_SquishAndSweatDroplets: @ 0x0815DBE0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0815DC18
	adds r5, r0, r1
	ldr r4, _0815DC1C
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815DC00
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_0815DC00:
	movs r0, #0
	strh r0, [r5, #8]
	strh r0, [r5, #0xa]
	strh r0, [r5, #0xc]
	ldrh r0, [r4, #2]
	strh r0, [r5, #0xe]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815DC24
	ldr r0, _0815DC20
	b _0815DC26
	.align 2, 0
_0815DC18: .4byte 0x03005B60
_0815DC1C: .4byte 0x020380BE
_0815DC20: .4byte 0x020380D6
_0815DC24:
	ldr r0, _0815DC74
_0815DC26:
	ldrb r4, [r0]
	adds r0, r4, #0
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x12]
	adds r0, r4, #0
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x14]
	ldr r0, _0815DC78
	ldrb r0, [r0]
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strh r1, [r5, #0x26]
	ldr r2, _0815DC7C
	adds r0, r5, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _0815DC80
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815DC74: .4byte 0x020380D7
_0815DC78: .4byte 0x020380BE
_0815DC7C: .4byte 0x085AD554
_0815DC80: .4byte 0x0815DC85
	thumb_func_end AnimTask_SquishAndSweatDroplets

	thumb_func_start AnimTask_SquishAndSweatDropletsStep
AnimTask_SquishAndSweatDropletsStep: @ 0x0815DC84
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0815DCA4
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0815DCA8
	cmp r0, #1
	beq _0815DD08
	b _0815DD16
	.align 2, 0
_0815DCA4: .4byte 0x03005B60
_0815DCA8:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0815DCBE
	adds r0, r5, #0
	movs r1, #1
	bl CreateSweatDroplets
_0815DCBE:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0x12
	bne _0815DCCE
	adds r0, r5, #0
	movs r1, #0
	bl CreateSweatDroplets
_0815DCCE:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0815DD16
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0815DCF0
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815DD16
_0815DCF0:
	strh r1, [r4, #0xa]
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0815DD04
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	b _0815DD16
	.align 2, 0
_0815DD04: .4byte 0x085AD554
_0815DD08:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815DD16
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0815DD16:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_SquishAndSweatDropletsStep

	thumb_func_start CreateSweatDroplets
CreateSweatDroplets: @ 0x0815DD1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r2, _0815DD40
	adds r4, r0, r2
	cmp r1, #0
	bne _0815DD44
	movs r1, #0x12
	movs r3, #0xec
	b _0815DD48
	.align 2, 0
_0815DD40: .4byte 0x03005B60
_0815DD44:
	movs r1, #0x1e
	movs r3, #0x14
_0815DD48:
	mov r2, sp
	ldrh r0, [r4, #0x10]
	subs r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r4, #0x10]
	subs r0, r0, r1
	subs r0, #4
	strh r0, [r2, #2]
	ldrh r0, [r4, #0x10]
	adds r0, r0, r1
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x10]
	adds r0, r0, r1
	adds r0, #4
	strh r0, [r2, #6]
	add r2, sp, #8
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x12]
	adds r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r4, #0x12]
	adds r0, r0, r1
	adds r0, #6
	strh r0, [r2, #2]
	movs r5, #0
	mov r8, r2
	ldr r7, _0815DDEC
_0815DD80:
	lsls r0, r5, #1
	add r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #1
	ands r0, r5
	lsls r0, r0, #1
	add r0, r8
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldrb r3, [r4, #0x14]
	subs r3, #5
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _0815DDF0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _0815DDD4
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r7
	movs r0, #0
	strh r0, [r1, #0x2e]
	movs r0, #2
	cmp r5, #1
	bhi _0815DDC2
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
_0815DDC2:
	strh r0, [r1, #0x30]
	ldr r0, _0815DDF4
	strh r0, [r1, #0x32]
	strh r6, [r1, #0x34]
	movs r0, #2
	strh r0, [r1, #0x36]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
_0815DDD4:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _0815DD80
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815DDEC: .4byte 0x020205AC
_0815DDF0: .4byte 0x085AD574
_0815DDF4: .4byte 0x0000FFFF
	thumb_func_end CreateSweatDroplets

	thumb_func_start sub_0815DDF8
sub_0815DDF8: @ 0x0815DDF8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x32]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _0815DE3E
	ldr r3, _0815DE44
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	movs r0, #0x34
	ldrsh r2, [r4, r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r3, #8
	adds r1, r1, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	bl DestroySprite
_0815DE3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815DE44: .4byte 0x03005B60
	thumb_func_end sub_0815DDF8

	thumb_func_start AnimTask_FacadeColorBlend
AnimTask_FacadeColorBlend: @ 0x0815DE48
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0815DE90
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r0, #0
	strh r0, [r4, #8]
	ldr r1, _0815DE94
	ldrh r0, [r1, #2]
	strh r0, [r4, #0xa]
	ldrb r0, [r1]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0815DE98
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r4, #0xc]
	ldr r0, _0815DE9C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815DE90: .4byte 0x03005B60
_0815DE94: .4byte 0x020380BE
_0815DE98: .4byte 0x020205AC
_0815DE9C: .4byte 0x0815DEA1
	thumb_func_end AnimTask_FacadeColorBlend

	thumb_func_start AnimTask_FacadeColorBlendStep
AnimTask_FacadeColorBlendStep: @ 0x0815DEA0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0815DEE8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0815DEF0
	ldrh r0, [r4, #0xc]
	ldr r2, _0815DEEC
	movs r3, #8
	ldrsh r1, [r4, r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r3, [r1]
	movs r1, #0x10
	movs r2, #8
	bl BlendPalette
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _0815DEE0
	movs r0, #0
	strh r0, [r4, #8]
_0815DEE0:
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	b _0815DF02
	.align 2, 0
_0815DEE8: .4byte 0x03005B60
_0815DEEC: .4byte 0x085AD58C
_0815DEF0:
	ldrh r0, [r4, #0xc]
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl BlendPalette
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0815DF02:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_FacadeColorBlendStep

	thumb_func_start sub_0815DF08
sub_0815DF08: @ 0x0815DF08
	push {lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r1, _0815DF44
	ldrb r3, [r1]
	ldr r1, _0815DF48
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #2
	str r1, [sp, #8]
	movs r1, #0x1e
	str r1, [sp, #0xc]
	ldr r1, _0815DF4C
	str r1, [sp, #0x10]
	ldr r1, _0815DF50
	str r1, [sp, #0x14]
	subs r1, #0x20
	str r1, [sp, #0x18]
	movs r1, #0
	bl sub_081180A4
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0
_0815DF44: .4byte 0x020380D6
_0815DF48: .4byte 0x020380BE
_0815DF4C: .4byte 0x08C2DD0C
_0815DF50: .4byte 0x08C2DE68
	thumb_func_end sub_0815DF08

	thumb_func_start AnimRoarNoiseLine
AnimRoarNoiseLine: @ 0x0815DF54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0815DFAC
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815DF70
	ldr r1, _0815DFB0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r1]
_0815DF70:
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _0815DFB0
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	ldrb r0, [r6]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815DFB8
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r5, #0x2e]
	ldr r0, _0815DFB4
	strh r0, [r5, #0x30]
	b _0815DFE0
	.align 2, 0
_0815DFAC: .4byte 0x020380D6
_0815DFB0: .4byte 0x020380BE
_0815DFB4: .4byte 0x0000FD80
_0815DFB8:
	cmp r0, #1
	bne _0815DFD2
	adds r2, r5, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r5, #0x2e]
	strh r0, [r5, #0x30]
	b _0815DFE0
_0815DFD2:
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r5, #0x2e]
_0815DFE0:
	ldr r0, _0815E00C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815E000
	ldrh r0, [r5, #0x2e]
	rsbs r0, r0, #0
	strh r0, [r5, #0x2e]
	adds r2, r5, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_0815E000:
	ldr r0, _0815E010
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815E00C: .4byte 0x020380D6
_0815E010: .4byte 0x0815E015
	thumb_func_end AnimRoarNoiseLine

	thumb_func_start AnimRoarNoiseLineStep
AnimRoarNoiseLineStep: @ 0x0815E014
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x3a]
	adds r0, r0, r1
	strh r0, [r2, #0x3a]
	ldrh r1, [r2, #0x30]
	ldrh r3, [r2, #0x3c]
	adds r1, r1, r3
	strh r1, [r2, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r2, #0x24]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strh r1, [r2, #0x26]
	ldrh r0, [r2, #0x38]
	adds r0, #1
	strh r0, [r2, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xe
	bne _0815E048
	adds r0, r2, #0
	bl DestroyAnimSprite
_0815E048:
	pop {r0}
	bx r0
	thumb_func_end AnimRoarNoiseLineStep

	thumb_func_start AnimTask_GlareEyeDots
AnimTask_GlareEyeDots: @ 0x0815E04C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0815E078
	adds r6, r1, r0
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0815E07C
	movs r0, #8
	strh r0, [r6, #0x12]
	movs r0, #3
	strh r0, [r6, #0x14]
	movs r0, #1
	strh r0, [r6, #0x16]
	b _0815E086
	.align 2, 0
_0815E078: .4byte 0x03005B60
_0815E07C:
	movs r0, #0xc
	strh r0, [r6, #0x12]
	movs r0, #3
	strh r0, [r6, #0x14]
	strh r1, [r6, #0x16]
_0815E086:
	ldr r5, _0815E0BC
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815E0C0
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0815E0B4
	adds r0, #3
_0815E0B4:
	asrs r0, r0, #2
	adds r0, r4, r0
	b _0815E0E4
	.align 2, 0
_0815E0BC: .4byte 0x020380D6
_0815E0C0:
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0815E0E0
	adds r0, #3
_0815E0E0:
	asrs r0, r0, #2
	subs r0, r4, r0
_0815E0E4:
	strh r0, [r6, #0x1e]
	ldr r5, _0815E138
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0815E108
	adds r0, #3
_0815E108:
	asrs r0, r0, #2
	subs r0, r4, r0
	strh r0, [r6, #0x20]
	ldr r4, _0815E13C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x22]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x24]
	ldr r0, _0815E140
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815E138: .4byte 0x020380D6
_0815E13C: .4byte 0x020380D7
_0815E140: .4byte 0x0815E145
	thumb_func_end AnimTask_GlareEyeDots

	thumb_func_start AnimTask_GlareEyeDotsStep
AnimTask_GlareEyeDotsStep: @ 0x0815E144
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _0815E16C
	adds r5, r0, r1
	movs r0, #8
	ldrsh r1, [r5, r0]
	cmp r1, #0
	beq _0815E170
	cmp r1, #1
	bne _0815E168
	b _0815E268
_0815E168:
	b _0815E276
	.align 2, 0
_0815E16C: .4byte 0x03005B60
_0815E170:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0815E276
	strh r1, [r5, #0xa]
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	movs r2, #0x20
	ldrsh r1, [r5, r2]
	movs r3, #0x22
	ldrsh r2, [r5, r3]
	movs r4, #0x24
	ldrsh r3, [r5, r4]
	ldrb r4, [r5, #0x12]
	str r4, [sp]
	ldrb r4, [r5, #0xc]
	str r4, [sp, #4]
	add r4, sp, #0x10
	str r4, [sp, #8]
	adds r4, #2
	str r4, [sp, #0xc]
	bl GetGlareEyeDotCoords
	movs r6, #0
	mov r8, r4
	ldr r4, _0815E1E4
_0815E1AA:
	add r0, sp, #0x10
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, #0
	ldrsh r2, [r3, r0]
	ldr r0, _0815E1E8
	movs r3, #0x23
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _0815E23E
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0815E1FE
	cmp r6, #0
	bne _0815E1EC
	lsls r2, r3, #4
	adds r1, r2, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r5, #0x14]
	rsbs r0, r0, #0
	strh r0, [r1, #0x26]
	strh r0, [r1, #0x24]
	b _0815E226
	.align 2, 0
_0815E1E4: .4byte 0x020205AC
_0815E1E8: .4byte 0x085AD5F4
_0815E1EC:
	lsls r2, r3, #4
	adds r1, r2, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r5, #0x14]
	strh r0, [r1, #0x26]
	ldrh r0, [r5, #0x14]
	strh r0, [r1, #0x24]
	b _0815E226
_0815E1FE:
	cmp r6, #0
	bne _0815E214
	lsls r2, r3, #4
	adds r1, r2, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r5, #0x14]
	rsbs r0, r0, #0
	strh r0, [r1, #0x24]
	ldrh r0, [r5, #0x14]
	b _0815E224
_0815E214:
	lsls r2, r3, #4
	adds r1, r2, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r5, #0x14]
	strh r0, [r1, #0x24]
	ldrh r0, [r5, #0x14]
	rsbs r0, r0, #0
_0815E224:
	strh r0, [r1, #0x26]
_0815E226:
	ldr r1, _0815E264
	adds r0, r2, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x2e]
	strh r7, [r0, #0x30]
	movs r1, #0xa
	strh r1, [r0, #0x32]
	ldrh r0, [r5, #0x1c]
	adds r0, #1
	strh r0, [r5, #0x1c]
_0815E23E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _0815E1AA
	ldrh r2, [r5, #0xc]
	movs r3, #0xc
	ldrsh r1, [r5, r3]
	movs r4, #0x12
	ldrsh r0, [r5, r4]
	cmp r1, r0
	bne _0815E25C
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_0815E25C:
	adds r0, r2, #1
	strh r0, [r5, #0xc]
	b _0815E276
	.align 2, 0
_0815E264: .4byte 0x020205AC
_0815E268:
	movs r1, #0x1c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0815E276
	adds r0, r7, #0
	bl DestroyAnimVisualTask
_0815E276:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_GlareEyeDotsStep

	thumb_func_start GetGlareEyeDotCoords
GetGlareEyeDotCoords: @ 0x0815E284
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	mov sb, r6
	ldr r6, [sp, #0x34]
	mov sl, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r7, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	lsls r4, r4, #0x18
	lsrs r6, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r8, r5
	cmp r5, #0
	bne _0815E2CC
	mov r2, sb
	strh r0, [r2]
	mov r6, sl
	strh r1, [r6]
	b _0815E32A
_0815E2CC:
	cmp r5, r6
	blo _0815E2DA
	mov r0, sb
	strh r2, [r0]
	mov r1, sl
	strh r3, [r1]
	b _0815E32A
_0815E2DA:
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r2, ip
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r5, r1, #8
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r6, #0
	bl __divsi3
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r5, r5, r0
	ldr r2, [sp]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r4, r1, #8
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r6, #0
	bl __divsi3
	mov r6, r8
	muls r6, r0, r6
	adds r0, r6, #0
	adds r4, r4, r0
	asrs r5, r5, #8
	mov r0, sb
	strh r5, [r0]
	asrs r4, r4, #8
	mov r1, sl
	strh r4, [r1]
_0815E32A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetGlareEyeDotCoords

	thumb_func_start AnimGlareEyeDot
AnimGlareEyeDot: @ 0x0815E33C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x24
	ble _0815E372
	ldr r3, _0815E378
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	movs r0, #0x30
	ldrsh r2, [r4, r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r3, #8
	adds r1, r1, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	bl DestroySprite
_0815E372:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815E378: .4byte 0x03005B60
	thumb_func_end AnimGlareEyeDot

	thumb_func_start AnimAssistPawprint
AnimAssistPawprint: @ 0x0815E37C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0815E3A8
	ldrh r0, [r1]
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x22]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x36]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	ldr r1, _0815E3AC
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0815E3B0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815E3A8: .4byte 0x020380BE
_0815E3AC: .4byte 0x080A34C5
_0815E3B0: .4byte 0x080A6989
	thumb_func_end AnimAssistPawprint

	thumb_func_start AnimTask_BarrageBall
AnimTask_BarrageBall: @ 0x0815E3B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	ldr r1, _0815E4D4
	adds r7, r0, r1
	ldr r0, _0815E4D8
	mov sl, r0
	ldrb r0, [r0]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #0x1e]
	mov r1, sl
	ldrb r0, [r1]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #0x20]
	ldr r0, _0815E4DC
	mov r8, r0
	ldrb r0, [r0]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #0x22]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0815E426
	adds r0, #3
_0815E426:
	asrs r0, r0, #2
	adds r0, r4, r0
	strh r0, [r7, #0x24]
	ldr r4, _0815E4E0
	movs r0, #0x1e
	ldrsh r5, [r7, r0]
	movs r1, #0x20
	ldrsh r6, [r7, r1]
	mov r1, r8
	ldrb r0, [r1]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	subs r3, #5
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #0x26]
	cmp r0, #0x40
	beq _0815E4F0
	ldr r4, _0815E4E4
	movs r0, #0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x10
	strh r1, [r0, #0x2e]
	movs r0, #0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r7, #0x22]
	strh r1, [r0, #0x32]
	movs r0, #0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r7, #0x24]
	strh r1, [r0, #0x36]
	movs r0, #0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0815E4E8
	strh r1, [r0, #0x38]
	movs r0, #0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl InitAnimArcTranslation
	mov r1, sl
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815E4CE
	movs r0, #0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAffineAnim
_0815E4CE:
	ldr r0, _0815E4EC
	str r0, [r7]
	b _0815E4F6
	.align 2, 0
_0815E4D4: .4byte 0x03005B60
_0815E4D8: .4byte 0x020380D6
_0815E4DC: .4byte 0x020380D7
_0815E4E0: .4byte 0x085AD654
_0815E4E4: .4byte 0x020205AC
_0815E4E8: .4byte 0x0000FFE0
_0815E4EC: .4byte 0x0815E505
_0815E4F0:
	mov r0, sb
	bl DestroyAnimVisualTask
_0815E4F6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_BarrageBall

	thumb_func_start AnimTask_BarrageBallStep
AnimTask_BarrageBallStep: @ 0x0815E504
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0815E528
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _0815E56C
	cmp r1, #1
	bgt _0815E52C
	cmp r1, #0
	beq _0815E536
	b _0815E60A
	.align 2, 0
_0815E528: .4byte 0x03005B60
_0815E52C:
	cmp r1, #2
	beq _0815E590
	cmp r1, #3
	beq _0815E604
	b _0815E60A
_0815E536:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815E60A
	strh r1, [r4, #0xa]
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0815E568
	adds r0, r0, r1
	bl TranslateAnimHorizontalArc
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0815E60A
	b _0815E5F6
	.align 2, 0
_0815E568: .4byte 0x020205AC
_0815E56C:
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0815E58C
	adds r0, r0, r1
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815E60A
	movs r0, #0
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	b _0815E5F6
	.align 2, 0
_0815E58C: .4byte 0x020205AC
_0815E590:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815E60A
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r2, [r4, #0xc]
	adds r2, #1
	strh r2, [r4, #0xc]
	ldr r5, _0815E600
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r0, #1
	ands r2, r0
	adds r1, #0x3e
	lsls r2, r2, #2
	ldrb r3, [r1]
	subs r0, #6
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _0815E60A
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
_0815E5F6:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815E60A
	.align 2, 0
_0815E600: .4byte 0x020205AC
_0815E604:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_0815E60A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_BarrageBallStep

	thumb_func_start AnimSmellingSaltsHand
AnimSmellingSaltsHand: @ 0x0815E610
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0815E624
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0
	bne _0815E62C
	ldr r0, _0815E628
	b _0815E62E
	.align 2, 0
_0815E624: .4byte 0x020380BE
_0815E628: .4byte 0x020380D6
_0815E62C:
	ldr r0, _0815E694
_0815E62E:
	ldrb r5, [r0]
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x10
	ldr r3, _0815E698
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0815E69C
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	adds r1, r6, #0
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x3a]
	movs r2, #2
	ldrsh r0, [r1, r2]
	movs r1, #1
	cmp r0, #0
	bne _0815E65C
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
_0815E65C:
	strh r1, [r4, #0x3c]
	adds r0, r5, #0
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0815E6A0
	ldrb r2, [r4, #3]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1b
	movs r0, #8
	orrs r1, r0
	lsls r1, r1, #1
	subs r0, #0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	adds r0, r5, #0
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
	b _0815E6AA
	.align 2, 0
_0815E694: .4byte 0x020380D7
_0815E698: .4byte 0x000003FF
_0815E69C: .4byte 0xFFFFFC00
_0815E6A0:
	adds r0, r5, #0
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
_0815E6AA:
	strh r0, [r4, #0x20]
	ldr r0, _0815E6B8
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815E6B8: .4byte 0x0815E6BD
	thumb_func_end AnimSmellingSaltsHand

	thumb_func_start sub_0815E6BC
sub_0815E6BC: @ 0x0815E6BC
	push {lr}
	adds r2, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r2, r0]
	cmp r1, #1
	beq _0815E704
	cmp r1, #1
	bgt _0815E6D2
	cmp r1, #0
	beq _0815E6DC
	b _0815E774
_0815E6D2:
	cmp r1, #2
	beq _0815E714
	cmp r1, #3
	beq _0815E73A
	b _0815E774
_0815E6DC:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815E774
	strh r1, [r2, #0x30]
	ldrh r0, [r2, #0x3c]
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x32]
	adds r0, #1
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0815E774
	b _0815E732
_0815E704:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0815E774
	b _0815E72E
_0815E714:
	movs r0, #0x3c
	ldrsh r1, [r2, r0]
	lsls r1, r1, #2
	ldrh r0, [r2, #0x24]
	subs r0, r0, r1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0815E774
_0815E72E:
	movs r0, #0
	strh r0, [r2, #0x30]
_0815E732:
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	b _0815E774
_0815E73A:
	movs r0, #0x3c
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0815E774
	ldrh r0, [r2, #0x3a]
	subs r0, #1
	strh r0, [r2, #0x3a]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0815E76E
	movs r0, #0
	strh r0, [r2, #0x30]
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	strh r0, [r2, #0x2e]
	b _0815E774
_0815E76E:
	adds r0, r2, #0
	bl DestroyAnimSprite
_0815E774:
	pop {r0}
	bx r0
	thumb_func_end sub_0815E6BC

	thumb_func_start AnimTask_SmellingSaltsSquish
AnimTask_SmellingSaltsSquish: @ 0x0815E778
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0815E790
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _0815E794
	adds r0, r1, #0
	bl DestroyAnimVisualTask
	b _0815E7BC
	.align 2, 0
_0815E790: .4byte 0x020380BE
_0815E794:
	ldr r0, _0815E7C4
	lsls r4, r1, #2
	adds r4, r4, r1
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r2, #2]
	strh r0, [r4, #8]
	ldrb r0, [r2]
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strh r1, [r4, #0x26]
	ldr r2, _0815E7C8
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _0815E7CC
	str r0, [r4]
_0815E7BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815E7C4: .4byte 0x03005B60
_0815E7C8: .4byte 0x085AD684
_0815E7CC: .4byte 0x0815E7D1
	thumb_func_end AnimTask_SmellingSaltsSquish

	thumb_func_start AnimTask_SmellingSaltsSquishStep
AnimTask_SmellingSaltsSquishStep: @ 0x0815E7D0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0815E810
	adds r4, r0, r1
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815E82A
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0815E818
	ldr r2, _0815E814
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #2
	b _0815E828
	.align 2, 0
_0815E810: .4byte 0x03005B60
_0815E814: .4byte 0x020205AC
_0815E818:
	ldr r2, _0815E870
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _0815E874
_0815E828:
	strh r1, [r0, #0x24]
_0815E82A:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0815E886
	ldr r2, _0815E870
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r5, [r0, #0x24]
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0815E880
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0815E878
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0815E87C
	bl PrepareAffineAnimInTaskData
	strh r5, [r4, #0xa]
	strh r5, [r4, #0xc]
	b _0815E886
	.align 2, 0
_0815E870: .4byte 0x020205AC
_0815E874: .4byte 0x0000FFFE
_0815E878: .4byte 0x03005B60
_0815E87C: .4byte 0x085AD684
_0815E880:
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_0815E886:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_SmellingSaltsSquishStep

	thumb_func_start AnimSmellingSaltExclamation
AnimSmellingSaltExclamation: @ 0x0815E88C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0815E8A0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0815E8A8
	ldr r4, _0815E8A4
	b _0815E8AA
	.align 2, 0
_0815E8A0: .4byte 0x020380BE
_0815E8A4: .4byte 0x020380D6
_0815E8A8:
	ldr r4, _0815E8E8
_0815E8AA:
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	strh r0, [r5, #0x22]
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	cmp r0, #7
	bgt _0815E8CE
	movs r0, #8
	strh r0, [r5, #0x22]
_0815E8CE:
	movs r2, #0
	strh r2, [r5, #0x2e]
	ldr r1, _0815E8EC
	ldrh r0, [r1, #2]
	strh r0, [r5, #0x30]
	strh r2, [r5, #0x32]
	ldrh r0, [r1, #4]
	strh r0, [r5, #0x34]
	ldr r0, _0815E8F0
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815E8E8: .4byte 0x020380D7
_0815E8EC: .4byte 0x020380BE
_0815E8F0: .4byte 0x0815E8F5
	thumb_func_end AnimSmellingSaltExclamation

	thumb_func_start AnimSmellingSaltExclamationStep
AnimSmellingSaltExclamationStep: @ 0x0815E8F4
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r3, r2]
	cmp r0, r1
	blt _0815E948
	movs r0, #0
	strh r0, [r3, #0x2e]
	ldrh r1, [r3, #0x32]
	adds r1, #1
	movs r0, #1
	ands r1, r0
	strh r1, [r3, #0x32]
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	lsls r1, r1, #2
	ldrb r2, [r0]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r2, #0x32
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _0815E948
	ldrh r0, [r3, #0x34]
	subs r0, #1
	strh r0, [r3, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0815E948
	adds r0, r3, #0
	bl DestroyAnimSprite
_0815E948:
	pop {r0}
	bx r0
	thumb_func_end AnimSmellingSaltExclamationStep

	thumb_func_start AnimHelpingHandClap
AnimHelpingHandClap: @ 0x0815E94C
	push {lr}
	adds r3, r0, #0
	ldr r0, _0815E978
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0815E97C
	ldrb r2, [r3, #3]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1b
	movs r0, #8
	orrs r1, r0
	lsls r1, r1, #1
	subs r0, #0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	movs r0, #0x64
	strh r0, [r3, #0x20]
	movs r0, #1
	b _0815E982
	.align 2, 0
_0815E978: .4byte 0x020380BE
_0815E97C:
	movs r0, #0x8c
	strh r0, [r3, #0x20]
	ldr r0, _0815E990
_0815E982:
	strh r0, [r3, #0x3c]
	movs r0, #0x38
	strh r0, [r3, #0x22]
	ldr r0, _0815E994
	str r0, [r3, #0x1c]
	pop {r0}
	bx r0
	.align 2, 0
_0815E990: .4byte 0x0000FFFF
_0815E994: .4byte 0x0815E999
	thumb_func_end AnimHelpingHandClap

	thumb_func_start AnimHelpingHandClapStep
AnimHelpingHandClapStep: @ 0x0815E998
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #8
	bls _0815E9A6
	b _0815EB78
_0815E9A6:
	lsls r0, r0, #2
	ldr r1, _0815E9B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815E9B0: .4byte 0x0815E9B4
_0815E9B4: @ jump table
	.4byte _0815E9D8 @ case 0
	.4byte _0815EA0A @ case 1
	.4byte _0815EA1C @ case 2
	.4byte _0815EA5C @ case 3
	.4byte _0815EA6E @ case 4
	.4byte _0815EAAC @ case 5
	.4byte _0815EB10 @ case 6
	.4byte _0815EB30 @ case 7
	.4byte _0815EB56 @ case 8
_0815E9D8:
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	ldrh r1, [r4, #0x22]
	subs r1, r1, r0
	strh r1, [r4, #0x22]
	ldrh r2, [r4, #0x30]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0815E9FA
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	ldrh r0, [r4, #0x20]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
_0815E9FA:
	adds r0, r2, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	beq _0815EA08
	b _0815EB78
_0815EA08:
	b _0815EB4A
_0815EA0A:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	beq _0815EA1A
	b _0815EB78
_0815EA1A:
	b _0815EB4A
_0815EA1C:
	ldrh r2, [r4, #0x30]
	adds r2, #1
	strh r2, [r4, #0x30]
	movs r3, #0x3c
	ldrsh r1, [r4, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r3, _0815EA58
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	ldrh r1, [r4, #0x3c]
	muls r0, r1, r0
	strh r0, [r4, #0x24]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0xc
	beq _0815EA54
	b _0815EB78
_0815EA54:
	b _0815EB4A
	.align 2, 0
_0815EA58: .4byte 0x082FA8CC
_0815EA5C:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0815EA6C
	b _0815EB78
_0815EA6C:
	b _0815EB4A
_0815EA6E:
	ldrh r2, [r4, #0x30]
	adds r2, #1
	strh r2, [r4, #0x30]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	ldrh r0, [r4, #0x22]
	subs r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r3, _0815EAA8
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	ldrh r1, [r4, #0x3c]
	muls r0, r1, r0
	strh r0, [r4, #0x24]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0xc
	bne _0815EB78
	b _0815EB4E
	.align 2, 0
_0815EAA8: .4byte 0x082FA8CC
_0815EAAC:
	ldrh r2, [r4, #0x30]
	adds r2, #1
	strh r2, [r4, #0x30]
	movs r3, #0x3c
	ldrsh r1, [r4, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r3, _0815EB04
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	ldrh r1, [r4, #0x3c]
	muls r0, r1, r0
	strh r0, [r4, #0x24]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0xf
	bne _0815EAF8
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x10
	ldr r3, _0815EB08
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0815EB0C
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
_0815EAF8:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x12
	bne _0815EB78
	b _0815EB4A
	.align 2, 0
_0815EB04: .4byte 0x082FA8CC
_0815EB08: .4byte 0x000003FF
_0815EB0C: .4byte 0xFFFFFC00
_0815EB10:
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r0, [r4, #0x20]
	adds r1, r1, r0
	strh r1, [r4, #0x20]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0815EB78
	b _0815EB4A
_0815EB30:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	ldrh r3, [r4, #0x20]
	adds r0, r0, r3
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0815EB78
_0815EB4A:
	movs r0, #0
	strh r0, [r4, #0x30]
_0815EB4E:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0815EB78
_0815EB56:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	ldrh r0, [r4, #0x20]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0815EB78
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815EB78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimHelpingHandClapStep

	thumb_func_start AnimTask_HelpingHandAttackerMovement
AnimTask_HelpingHandAttackerMovement: @ 0x0815EB80
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0815EBDC
	adds r6, r1, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x26]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815EC08
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #1
	bne _0815EBEC
	ldr r5, _0815EBE0
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r1, [r5]
	movs r0, #2
	eors r0, r1
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	ble _0815EBE4
	strh r7, [r6, #0x24]
	b _0815EC0C
	.align 2, 0
_0815EBDC: .4byte 0x03005B60
_0815EBE0: .4byte 0x020380D6
_0815EBE4:
	ldr r0, _0815EBE8
	b _0815EC0A
	.align 2, 0
_0815EBE8: .4byte 0x0000FFFF
_0815EBEC:
	ldr r0, _0815EC00
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815EC08
	ldr r0, _0815EC04
	b _0815EC0A
	.align 2, 0
_0815EC00: .4byte 0x020380D6
_0815EC04: .4byte 0x0000FFFF
_0815EC08:
	movs r0, #1
_0815EC0A:
	strh r0, [r6, #0x24]
_0815EC0C:
	ldr r0, _0815EC18
	str r0, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815EC18: .4byte 0x0815EC1D
	thumb_func_end AnimTask_HelpingHandAttackerMovement

	thumb_func_start AnimTask_HelpingHandAttackerMovementStep
AnimTask_HelpingHandAttackerMovementStep: @ 0x0815EC1C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0815EC40
	adds r3, r0, r1
	movs r1, #8
	ldrsh r0, [r3, r1]
	cmp r0, #8
	bls _0815EC36
	b _0815EDB0
_0815EC36:
	lsls r0, r0, #2
	ldr r1, _0815EC44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815EC40: .4byte 0x03005B60
_0815EC44: .4byte 0x0815EC48
_0815EC48: @ jump table
	.4byte _0815EC6C @ case 0
	.4byte _0815EC7E @ case 1
	.4byte _0815ECB0 @ case 2
	.4byte _0815ECE0 @ case 3
	.4byte _0815ED06 @ case 4
	.4byte _0815ED30 @ case 5
	.4byte _0815ED40 @ case 6
	.4byte _0815ED60 @ case 7
	.4byte _0815ED98 @ case 8
_0815EC6C:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd
	beq _0815EC7C
	b _0815EDB0
_0815EC7C:
	b _0815ED88
_0815EC7E:
	ldr r2, _0815ECAC
	movs r1, #0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x24
	ldrsh r0, [r3, r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	ldrh r0, [r1, #0x24]
	subs r0, r0, r2
	strh r0, [r1, #0x24]
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	beq _0815ECAA
	b _0815EDB0
_0815ECAA:
	b _0815ED88
	.align 2, 0
_0815ECAC: .4byte 0x020205AC
_0815ECB0:
	ldr r2, _0815ECDC
	movs r1, #0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x24
	ldrsh r2, [r3, r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	ldrh r2, [r1, #0x24]
	adds r0, r0, r2
	strh r0, [r1, #0x24]
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0815EDB0
	b _0815ED88
	.align 2, 0
_0815ECDC: .4byte 0x020205AC
_0815ECE0:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0815EDB0
	movs r0, #0
	strh r0, [r3, #0xa]
	ldrh r1, [r3, #0xc]
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	cmp r0, #0
	bne _0815ED8C
	adds r0, r1, #1
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #8]
	b _0815EDB0
_0815ED06:
	ldr r2, _0815ED2C
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0x24]
	ldrh r2, [r0, #0x24]
	adds r1, r1, r2
	strh r1, [r0, #0x24]
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _0815EDB0
	b _0815ED88
	.align 2, 0
_0815ED2C: .4byte 0x020205AC
_0815ED30:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0815EDB0
	b _0815ED88
_0815ED40:
	ldr r2, _0815ED5C
	movs r1, #0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x24
	ldrsh r2, [r3, r0]
	lsls r2, r2, #2
	ldrh r0, [r1, #0x24]
	subs r0, r0, r2
	b _0815ED78
	.align 2, 0
_0815ED5C: .4byte 0x020205AC
_0815ED60:
	ldr r2, _0815ED94
	movs r1, #0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x24
	ldrsh r0, [r3, r2]
	lsls r0, r0, #2
	ldrh r2, [r1, #0x24]
	adds r0, r0, r2
_0815ED78:
	strh r0, [r1, #0x24]
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0815EDB0
_0815ED88:
	movs r0, #0
	strh r0, [r3, #0xa]
_0815ED8C:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	b _0815EDB0
	.align 2, 0
_0815ED94: .4byte 0x020205AC
_0815ED98:
	ldr r2, _0815EDB8
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x24]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_0815EDB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815EDB8: .4byte 0x020205AC
	thumb_func_end AnimTask_HelpingHandAttackerMovementStep

	thumb_func_start AnimForesightMagnifyingGlass
AnimForesightMagnifyingGlass: @ 0x0815EDBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0815EDD8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0815EDE0
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _0815EDDC
	b _0815EDE2
	.align 2, 0
_0815EDD8: .4byte 0x020380BE
_0815EDDC: .4byte 0x020380D6
_0815EDE0:
	ldr r0, _0815EE38
_0815EDE2:
	ldrb r0, [r0]
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815EE06
	ldrb r0, [r4, #3]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r4, #3]
_0815EE06:
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSpriteBGPriority
	movs r2, #3
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r4, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, #5]
	ldrb r0, [r4, #1]
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r4, #1]
	ldr r0, _0815EE3C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815EE38: .4byte 0x020380D7
_0815EE3C: .4byte 0x0815EE41
	thumb_func_end AnimForesightMagnifyingGlass

	thumb_func_start AnimForesightMagnifyingGlassStep
AnimForesightMagnifyingGlassStep: @ 0x0815EE40
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bls _0815EE4E
	b _0815F03E
_0815EE4E:
	lsls r0, r0, #2
	ldr r1, _0815EE58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815EE58: .4byte 0x0815EE5C
_0815EE5C: @ jump table
	.4byte _0815EE70 @ case 0
	.4byte _0815EF70 @ case 1
	.4byte _0815EFD8 @ case 2
	.4byte _0815EFEC @ case 3
	.4byte _0815F038 @ case 4
_0815EE70:
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	cmp r0, #5
	bhi _0815EEA0
	lsls r0, r0, #2
	ldr r1, _0815EE84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815EE84: .4byte 0x0815EE88
_0815EE88: @ jump table
	.4byte _0815EEA4 @ case 0
	.4byte _0815EEC0 @ case 1
	.4byte _0815EEE2 @ case 2
	.4byte _0815EEFE @ case 3
	.4byte _0815EEA4 @ case 4
	.4byte _0815EF24 @ case 5
_0815EEA0:
	movs r0, #0
	strh r0, [r4, #0x3a]
_0815EEA4:
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	b _0815EF18
_0815EEC0:
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	adds r0, #4
	b _0815EF1E
_0815EEE2:
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	b _0815EF18
_0815EEFE:
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
_0815EF18:
	bl GetBattlerSpriteCoordAttr
	subs r0, #4
_0815EF1E:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _0815EF44
_0815EF24:
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0815EF44:
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	cmp r0, #4
	bne _0815EF50
	movs r0, #0x18
	b _0815EF5A
_0815EF50:
	cmp r0, #5
	bne _0815EF58
	movs r0, #6
	b _0815EF5A
_0815EF58:
	movs r0, #0xc
_0815EF5A:
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	strh r5, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	strh r1, [r4, #0x36]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	b _0815F030
_0815EF70:
	adds r0, r4, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815F03E
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #4
	beq _0815EFA8
	cmp r0, #5
	beq _0815EFC8
	ldrh r0, [r4, #0x24]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	movs r1, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	strh r1, [r4, #0x26]
	strh r1, [r4, #0x24]
	strh r1, [r4, #0x2e]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	b _0815EFC0
_0815EFA8:
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	strh r1, [r4, #0x26]
	strh r1, [r4, #0x24]
	strh r1, [r4, #0x38]
_0815EFC0:
	ldrh r0, [r4, #0x3a]
	adds r0, #1
	strh r0, [r4, #0x3a]
	b _0815F03E
_0815EFC8:
	movs r0, #0
	strh r0, [r4, #0x2e]
	movs r1, #0x10
	strh r1, [r4, #0x30]
	strh r0, [r4, #0x32]
	movs r0, #3
	strh r0, [r4, #0x38]
	b _0815F03E
_0815EFD8:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0815F03E
	movs r0, #0
	strh r0, [r4, #0x38]
	b _0815F03E
_0815EFEC:
	ldrh r1, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0815EFFE
	ldrh r0, [r4, #0x30]
	subs r0, #1
	strh r0, [r4, #0x30]
	b _0815F004
_0815EFFE:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
_0815F004:
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x30]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0815F03E
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_0815F030:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	b _0815F03E
_0815F038:
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815F03E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AnimForesightMagnifyingGlassStep

	thumb_func_start AnimMeteorMashStarStep
AnimMeteorMashStarStep: @ 0x0815F044
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r5, r0, #0
	strh r5, [r4, #0x24]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r3, r0, #0
	strh r3, [r4, #0x26]
	ldrh r1, [r4, #0x38]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0815F0A2
	ldr r0, _0815F0C0
	ldrh r1, [r4, #0x20]
	adds r1, r1, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0x22]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #5
	bl CreateSprite
_0815F0A2:
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0815F0B4
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815F0B4:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815F0C0: .4byte 0x085AD1A8
	thumb_func_end AnimMeteorMashStarStep

	thumb_func_start AnimMeteorMashStar
AnimMeteorMashStar: @ 0x0815F0C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0815F100
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815F0F0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815F108
_0815F0F0:
	ldr r2, _0815F104
	ldrh r1, [r5, #0x20]
	ldrh r0, [r2]
	subs r0, r1, r0
	strh r0, [r5, #0x2e]
	ldrh r0, [r2, #4]
	subs r1, r1, r0
	b _0815F116
	.align 2, 0
_0815F100: .4byte 0x020380D7
_0815F104: .4byte 0x020380BE
_0815F108:
	ldr r2, _0815F13C
	ldrh r1, [r5, #0x20]
	ldrh r0, [r2]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldrh r0, [r2, #4]
	adds r1, r1, r0
_0815F116:
	strh r1, [r5, #0x32]
	adds r3, r2, #0
	ldrh r1, [r5, #0x22]
	ldrh r2, [r3, #2]
	adds r2, r1, r2
	strh r2, [r5, #0x30]
	ldrh r0, [r3, #6]
	adds r1, r1, r0
	strh r1, [r5, #0x34]
	ldrh r0, [r3, #8]
	strh r0, [r5, #0x36]
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x20]
	strh r2, [r5, #0x22]
	ldr r0, _0815F140
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815F13C: .4byte 0x020380BE
_0815F140: .4byte 0x0815F045
	thumb_func_end AnimMeteorMashStar

	thumb_func_start AnimTask_MonToSubstitute
AnimTask_MonToSubstitute: @ 0x0815F144
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r2, r5, #0
	ldr r0, _0815F188
	mov sb, r0
	lsls r7, r6, #2
	adds r0, r7, r6
	lsls r0, r0, #3
	mov r8, r0
	mov r4, r8
	add r4, sb
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0815F18C
	adds r0, r5, #0
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	b _0815F1D8
	.align 2, 0
_0815F188: .4byte 0x03005B60
_0815F18C:
	cmp r0, #1
	bne _0815F1E4
	ldrh r0, [r4, #0xa]
	adds r0, #0x60
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	subs r0, #0xd
	strh r0, [r4, #0xc]
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	adds r0, r5, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0815F248
	movs r0, #0
	strh r0, [r4, #0xe]
	adds r0, r5, #0
	bl ResetSpriteRotScale
	ldr r1, _0815F1E0
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_0815F1D8:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815F248
	.align 2, 0
_0815F1E0: .4byte 0x020205AC
_0815F1E4:
	ldr r4, _0815F254
	ldrb r0, [r4]
	movs r1, #0
	bl LoadBattleMonGfxAndAnimate
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815F226
	ldr r3, _0815F258
	ldr r2, _0815F25C
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r1, _0815F260
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	bl StartSpriteAffineAnim
_0815F226:
	mov r4, sb
	adds r3, r7, #0
	ldr r5, _0815F264
	movs r1, #0xf
	mov r2, r8
	adds r0, r4, r2
	adds r0, #0x26
	movs r2, #0
_0815F236:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _0815F236
	adds r0, r3, r6
	lsls r0, r0, #3
	adds r0, r0, r4
	str r5, [r0]
_0815F248:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815F254: .4byte 0x020380D6
_0815F258: .4byte 0x020205AC
_0815F25C: .4byte 0x02023E88
_0815F260: .4byte 0x082D2F50
_0815F264: .4byte 0x0815F269
	thumb_func_end AnimTask_MonToSubstitute

	thumb_func_start AnimTask_MonToSubstituteDoll
AnimTask_MonToSubstituteDoll: @ 0x0815F268
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _0815F294
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #8
	ldrsh r5, [r4, r0]
	cmp r5, #1
	beq _0815F2CC
	cmp r5, #1
	bgt _0815F298
	cmp r5, #0
	beq _0815F2A2
	b _0815F3BA
	.align 2, 0
_0815F294: .4byte 0x03005B60
_0815F298:
	cmp r5, #2
	beq _0815F338
	cmp r5, #3
	beq _0815F374
	b _0815F3BA
_0815F2A2:
	ldr r0, _0815F2C4
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0815F2C8
	strh r0, [r1, #0x26]
	movs r0, #0xc8
	strh r0, [r1, #0x24]
	adds r1, #0x3e
	ldrb r2, [r1]
	subs r0, #0xcd
	ands r0, r2
	strb r0, [r1]
	strh r5, [r4, #0x1c]
	b _0815F366
	.align 2, 0
_0815F2C4: .4byte 0x020205AC
_0815F2C8: .4byte 0x0000FF38
_0815F2CC:
	ldrh r1, [r4, #0x1c]
	adds r1, #0x70
	movs r5, #0
	strh r1, [r4, #0x1c]
	ldr r2, _0815F330
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r3, [r2, #0x26]
	adds r1, r1, r3
	strh r1, [r2, #0x26]
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	movs r3, #0x26
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	blt _0815F2FC
	strh r5, [r2, #0x24]
_0815F2FC:
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _0815F306
	strh r5, [r2, #0x26]
_0815F306:
	movs r3, #0x26
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _0815F3BA
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x7d
	bl PlaySE12WithPanning
	ldr r1, _0815F334
	adds r0, r1, #0
	ldrh r2, [r4, #0x1c]
	adds r0, r0, r2
	strh r0, [r4, #0x1c]
	b _0815F366
	.align 2, 0
_0815F330: .4byte 0x020205AC
_0815F334: .4byte 0xFFFFF800
_0815F338:
	ldrh r0, [r4, #0x1c]
	subs r0, #0x70
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0815F348
	movs r0, #0
	strh r0, [r4, #0x1c]
_0815F348:
	ldr r0, _0815F370
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r2, [r4, #0x1c]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x18
	ldrh r0, [r1, #0x26]
	subs r0, r0, r2
	strh r0, [r1, #0x26]
	movs r3, #0x1c
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0815F3BA
_0815F366:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815F3BA
	.align 2, 0
_0815F370: .4byte 0x020205AC
_0815F374:
	ldrh r0, [r4, #0x1c]
	adds r0, #0x70
	strh r0, [r4, #0x1c]
	ldr r2, _0815F3C0
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r1, #0x26]
	adds r0, r0, r2
	strh r0, [r1, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0815F398
	movs r0, #0
	strh r0, [r1, #0x26]
_0815F398:
	movs r3, #0x26
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _0815F3BA
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x7d
	bl PlaySE12WithPanning
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_0815F3BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815F3C0: .4byte 0x020205AC
	thumb_func_end AnimTask_MonToSubstituteDoll

	thumb_func_start AnimBlockX
AnimBlockX: @ 0x0815F3C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0815F3E8
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815F3F0
	ldrb r0, [r4]
	bl GetBattlerSpriteSubpriority
	subs r0, #2
	adds r1, r5, #0
	adds r1, #0x43
	strb r0, [r1]
	ldr r4, _0815F3EC
	b _0815F400
	.align 2, 0
_0815F3E8: .4byte 0x020380D7
_0815F3EC: .4byte 0x0000FF70
_0815F3F0:
	ldrb r0, [r4]
	bl GetBattlerSpriteSubpriority
	adds r0, #2
	adds r1, r5, #0
	adds r1, #0x43
	strb r0, [r1]
	ldr r4, _0815F41C
_0815F400:
	ldr r0, _0815F420
	ldrb r0, [r0]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	strh r4, [r5, #0x26]
	ldr r0, _0815F424
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815F41C: .4byte 0x0000FFA0
_0815F420: .4byte 0x020380D7
_0815F424: .4byte 0x0815F429
	thumb_func_end AnimBlockX

	thumb_func_start AnimBlockXStep
AnimBlockXStep: @ 0x0815F428
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bls _0815F436
	b _0815F552
_0815F436:
	lsls r0, r0, #2
	ldr r1, _0815F440
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815F440: .4byte 0x0815F444
_0815F444: @ jump table
	.4byte _0815F458 @ case 0
	.4byte _0815F47C @ case 1
	.4byte _0815F4BC @ case 2
	.4byte _0815F4EC @ case 3
	.4byte _0815F518 @ case 4
_0815F458:
	ldrh r0, [r4, #0x26]
	adds r0, #0xa
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0815F552
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xcd
	bl PlaySE12WithPanning
	movs r0, #0
	strh r0, [r4, #0x26]
	b _0815F510
_0815F47C:
	ldrh r1, [r4, #0x30]
	adds r1, #4
	movs r5, #0
	strh r1, [r4, #0x30]
	ldr r2, _0815F4B8
	movs r3, #0x30
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7f
	ble _0815F552
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xcd
	bl PlaySE12WithPanning
	strh r5, [r4, #0x30]
	strh r5, [r4, #0x26]
	b _0815F510
	.align 2, 0
_0815F4B8: .4byte 0x082FA8CC
_0815F4BC:
	ldrh r1, [r4, #0x30]
	adds r1, #6
	movs r3, #0
	strh r1, [r4, #0x30]
	ldr r2, _0815F4E8
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7f
	ble _0815F552
	strh r3, [r4, #0x30]
	strh r3, [r4, #0x26]
	b _0815F510
	.align 2, 0
_0815F4E8: .4byte 0x082FA8CC
_0815F4EC:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0815F552
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xc0
	bl PlaySE12WithPanning
	movs r0, #0
	strh r0, [r4, #0x30]
_0815F510:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0815F552
_0815F518:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0815F552
	movs r0, #0
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x32]
	adds r1, #1
	strh r1, [r4, #0x32]
	movs r0, #1
	ands r1, r0
	adds r3, r4, #0
	adds r3, #0x3e
	lsls r1, r1, #2
	ldrb r2, [r3]
	subs r0, #6
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #7
	bne _0815F552
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815F552:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AnimBlockXStep

	thumb_func_start AnimTask_OdorSleuthMovement
AnimTask_OdorSleuthMovement: @ 0x0815F558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	bne _0815F5A6
	movs r0, #1
	bl CloneBattlerSpriteWithBlend
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov sl, r1
	asrs r6, r0, #0x10
	cmp r6, #0
	blt _0815F5A6
	movs r0, #1
	bl CloneBattlerSpriteWithBlend
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov sb, r1
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _0815F5B4
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	ldr r1, _0815F5B0
	adds r0, r0, r1
	bl obj_delete_but_dont_free_vram
_0815F5A6:
	mov r0, r8
	bl DestroyAnimVisualTask
	b _0815F6B8
	.align 2, 0
_0815F5B0: .4byte 0x020205AC
_0815F5B4:
	ldr r4, _0815F644
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r0, r4
	ldrh r0, [r5, #0x24]
	adds r0, #0x18
	strh r0, [r5, #0x24]
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r6, r0, r4
	ldrh r0, [r6, #0x24]
	subs r0, #0x18
	strh r0, [r6, #0x24]
	strh r7, [r5, #0x2e]
	strh r7, [r6, #0x2e]
	strh r7, [r5, #0x30]
	strh r7, [r6, #0x30]
	strh r7, [r5, #0x32]
	strh r7, [r6, #0x32]
	movs r0, #0x10
	strh r0, [r5, #0x34]
	ldr r0, _0815F648
	strh r0, [r6, #0x34]
	strh r7, [r5, #0x36]
	movs r0, #0x80
	strh r0, [r6, #0x36]
	movs r0, #0x18
	strh r0, [r5, #0x38]
	strh r0, [r6, #0x38]
	mov r0, r8
	strh r0, [r5, #0x3a]
	strh r0, [r6, #0x3a]
	strh r7, [r5, #0x3c]
	strh r7, [r6, #0x3c]
	ldr r2, _0815F64C
	mov r1, r8
	lsls r3, r1, #2
	adds r0, r3, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #8]
	ldr r0, _0815F650
	ldr r1, [r0]
	ldr r0, _0815F654
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	adds r7, r4, #0
	mov ip, r3
	cmp r0, #0
	bne _0815F658
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r2, r6, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	b _0815F66E
	.align 2, 0
_0815F644: .4byte 0x020205AC
_0815F648: .4byte 0x0000FFF0
_0815F64C: .4byte 0x03005B60
_0815F650: .4byte 0x02024174
_0815F654: .4byte 0x020380D7
_0815F658:
	adds r1, r5, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_0815F66E:
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r4, r2, r7
	ldrb r1, [r4, #1]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r4, #1]
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r7
	ldrb r0, [r4, #1]
	ands r3, r0
	strb r3, [r4, #1]
	adds r3, r7, #0
	adds r3, #0x1c
	adds r2, r2, r3
	ldr r0, _0815F6C8
	str r0, [r2]
	adds r1, r1, r3
	str r0, [r1]
	mov r0, ip
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _0815F6CC
	adds r0, r0, r1
	ldr r1, _0815F6D0
	str r1, [r0]
_0815F6B8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815F6C8: .4byte 0x0815F6FD
_0815F6CC: .4byte 0x03005B60
_0815F6D0: .4byte 0x0815F6D5
	thumb_func_end AnimTask_OdorSleuthMovement

	thumb_func_start AnimTask_OdorSleuthMovementWaitFinish
AnimTask_OdorSleuthMovementWaitFinish: @ 0x0815F6D4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0815F6F8
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0815F6F2
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_0815F6F2:
	pop {r0}
	bx r0
	.align 2, 0
_0815F6F8: .4byte 0x03005B60
	thumb_func_end AnimTask_OdorSleuthMovementWaitFinish

	thumb_func_start MoveOdorSleuthClone
MoveOdorSleuthClone: @ 0x0815F6FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0815F746
	movs r0, #0
	strh r0, [r4, #0x30]
	ldr r0, _0815F770
	ldr r1, [r0]
	ldr r0, _0815F774
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0815F746
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsls r1, r2, #0x1d
	lsrs r1, r1, #0x1f
	movs r0, #1
	eors r1, r0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0815F746:
	ldrh r0, [r4, #0x34]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	movs r5, #0
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0815F778
	cmp r0, #1
	beq _0815F790
	b _0815F7CE
	.align 2, 0
_0815F770: .4byte 0x02024174
_0815F774: .4byte 0x020380D7
_0815F778:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _0815F7CE
	strh r5, [r4, #0x32]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0815F7CE
_0815F790:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0815F7CE
	strh r5, [r4, #0x32]
	ldrh r0, [r4, #0x38]
	subs r0, #2
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0815F7CE
	ldr r3, _0815F7D4
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	lsls r1, r1, #1
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r3, #8
	adds r1, r1, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	bl obj_delete_but_dont_free_vram
_0815F7CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815F7D4: .4byte 0x03005B60
	thumb_func_end MoveOdorSleuthClone

	thumb_func_start AnimTask_GetReturnPowerLevel
AnimTask_GetReturnPowerLevel: @ 0x0815F7D8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, _0815F824
	movs r2, #0
	strh r2, [r3, #0xe]
	ldr r1, _0815F828
	ldrb r0, [r1]
	ldrb r1, [r1]
	adds r0, r1, #0
	subs r0, #0x3d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #0x1e
	bhi _0815F7FC
	movs r0, #1
	strh r0, [r3, #0xe]
_0815F7FC:
	adds r0, r2, #0
	subs r0, #0x5c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x6c
	bhi _0815F80C
	movs r0, #2
	strh r0, [r3, #0xe]
_0815F80C:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc8
	bls _0815F818
	movs r0, #3
	strh r0, [r3, #0xe]
_0815F818:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815F824: .4byte 0x020380BE
_0815F828: .4byte 0x020380BA
	thumb_func_end AnimTask_GetReturnPowerLevel

	thumb_func_start AnimTask_SnatchOpposingMonMove
AnimTask_SnatchOpposingMonMove: @ 0x0815F82C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _0815F85C
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bls _0815F852
	b _0815FDA0
_0815F852:
	lsls r0, r0, #2
	ldr r1, _0815F860
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815F85C: .4byte 0x03005B60
_0815F860: .4byte 0x0815F864
_0815F864: @ jump table
	.4byte _0815F878 @ case 0
	.4byte _0815F92C @ case 1
	.4byte _0815FB20 @ case 2
	.4byte _0815FC40 @ case 3
	.4byte _0815FCC4 @ case 4
_0815F878:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0815F8C4
	mov r2, r8
	lsls r4, r2, #2
	adds r0, r4, r2
	lsls r0, r0, #3
	adds r6, r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	ldrh r1, [r6, #0xa]
	adds r0, r0, r1
	strh r0, [r6, #0xa]
	ldr r0, _0815F8C8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	mov sb, r4
	cmp r0, #0
	bne _0815F8D0
	ldr r2, _0815F8CC
	lsls r3, r7, #4
	adds r1, r3, r7
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r4, [r1, #0x24]
	adds r0, r0, r4
	strh r0, [r1, #0x24]
	b _0815F8EA
	.align 2, 0
_0815F8C4: .4byte 0x03005B60
_0815F8C8: .4byte 0x020380D6
_0815F8CC: .4byte 0x020205AC
_0815F8D0:
	ldr r3, _0815F924
	lsls r4, r7, #4
	adds r2, r4, r7
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r6, #0xa]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r2, #0x24]
	subs r0, r0, r1
	strh r0, [r2, #0x24]
	adds r2, r3, #0
	adds r3, r4, #0
_0815F8EA:
	ldr r1, _0815F928
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xa]
	adds r1, r3, r7
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x24]
	ldrh r1, [r1, #0x20]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r0, r0, r1
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0815F916
	b _0815FDA0
_0815F916:
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0815FDA0
	.align 2, 0
_0815F924: .4byte 0x020205AC
_0815F928: .4byte 0x03005B60
_0815F92C:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815F960
	ldr r0, _0815F958
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldr r2, [r0, #8]
	mov sl, r2
	ldr r3, [r0, #0xc]
	mov sb, r3
	ldrh r6, [r0]
	ldr r0, _0815F95C
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r7, #0
	b _0815FA86
	.align 2, 0
_0815F958: .4byte 0x02039BD4
_0815F95C: .4byte 0x020380D6
_0815F960:
	ldr r4, _0815F9C4
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815FA00
	ldr r7, _0815F9C8
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0815F9CC
	adds r0, r0, r5
	movs r1, #0
	bl GetMonData
	mov sl, r0
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #1
	bl GetMonData
	mov sb, r0
	ldr r0, _0815F9D0
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _0815F9D4
	lsls r0, r2, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _0815F9D6
	.align 2, 0
_0815F9C4: .4byte 0x020380D6
_0815F9C8: .4byte 0x02023D12
_0815F9CC: .4byte 0x02024190
_0815F9D0: .4byte 0x02024174
_0815F9D4:
	ldrh r6, [r1, #2]
_0815F9D6:
	movs r0, #1
	bl GetAnimBattlerSpriteId
	ldr r2, _0815F9FC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x43
	ldrb r0, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r7, #0
	movs r5, #0x88
	lsls r5, r5, #1
	b _0815FA88
	.align 2, 0
_0815F9FC: .4byte 0x020205AC
_0815FA00:
	ldr r7, _0815FA58
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0815FA5C
	adds r0, r0, r5
	movs r1, #0
	bl GetMonData
	mov sl, r0
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #1
	bl GetMonData
	mov sb, r0
	ldr r0, _0815FA60
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _0815FA64
	lsls r0, r2, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _0815FA66
	.align 2, 0
_0815FA58: .4byte 0x02023D12
_0815FA5C: .4byte 0x020243E8
_0815FA60: .4byte 0x02024174
_0815FA64:
	ldrh r6, [r1, #2]
_0815FA66:
	movs r0, #1
	bl GetAnimBattlerSpriteId
	ldr r2, _0815FB04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x43
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r7, #1
_0815FA86:
	ldr r5, _0815FB08
_0815FA88:
	ldr r0, _0815FB0C
	ldrb r0, [r0]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	str r0, [sp]
	str r4, [sp, #4]
	mov r4, sl
	str r4, [sp, #8]
	mov r0, sb
	str r0, [sp, #0xc]
	ldr r4, _0815FB10
	ldrb r0, [r4]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0
	bl sub_080A7C5C
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0815FB14
	ldr r1, [r0]
	ldrb r0, [r4]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0815FAF2
	ldr r1, _0815FB04
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	ldr r3, _0815FB18
	movs r1, #0x10
	movs r2, #6
	bl BlendPalette
_0815FAF2:
	ldr r0, _0815FB1C
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r5, [r1, #0x26]
	b _0815FCB6
	.align 2, 0
_0815FB04: .4byte 0x020205AC
_0815FB08: .4byte 0x0000FFE0
_0815FB0C: .4byte 0x020380D7
_0815FB10: .4byte 0x020380D6
_0815FB14: .4byte 0x02024174
_0815FB18: .4byte 0x00007FFF
_0815FB1C: .4byte 0x03005B60
_0815FB20:
	ldr r1, _0815FB6C
	mov r0, r8
	lsls r4, r0, #2
	adds r0, r4, r0
	lsls r0, r0, #3
	adds r6, r0, r1
	ldrh r0, [r6, #0x26]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r2, [r6, #0xa]
	adds r0, r0, r2
	strh r0, [r6, #0xa]
	ldr r0, _0815FB70
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	mov sb, r4
	cmp r0, #0
	bne _0815FB78
	ldr r3, _0815FB74
	lsls r4, r5, #4
	adds r2, r4, r5
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r6, #0xa]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r2, #0x24]
	subs r0, r0, r1
	strh r0, [r2, #0x24]
	adds r2, r3, #0
	adds r3, r4, #0
	b _0815FB8E
	.align 2, 0
_0815FB6C: .4byte 0x03005B60
_0815FB70: .4byte 0x020380D6
_0815FB74: .4byte 0x020205AC
_0815FB78:
	ldr r2, _0815FBDC
	lsls r3, r5, #4
	adds r1, r3, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r4, [r1, #0x24]
	adds r0, r0, r4
	strh r0, [r1, #0x24]
_0815FB8E:
	ldr r1, _0815FBE0
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r6, r0, r1
	ldrb r0, [r6, #0xa]
	strh r0, [r6, #0xa]
	adds r1, r3, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x24]
	ldrh r1, [r1, #0x20]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0x24
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0815FC0E
	ldr r0, _0815FBE4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815FBEC
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0815FBE8
	ldrb r0, [r0]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bge _0815FC0E
	b _0815FC02
	.align 2, 0
_0815FBDC: .4byte 0x020205AC
_0815FBE0: .4byte 0x03005B60
_0815FBE4: .4byte 0x020380D6
_0815FBE8: .4byte 0x020380D7
_0815FBEC:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0815FC30
	ldrb r0, [r0]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	ble _0815FC0E
_0815FC02:
	ldrh r0, [r6, #0x24]
	adds r0, #1
	strh r0, [r6, #0x24]
	ldr r1, _0815FC34
	ldr r0, _0815FC38
	strh r0, [r1, #0xe]
_0815FC0E:
	lsls r0, r5, #0x10
	movs r2, #0x80
	lsls r2, r2, #0xe
	adds r0, r0, r2
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0815FC20
	b _0815FDA0
_0815FC20:
	ldr r0, _0815FC3C
	mov r1, sb
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1, #0xa]
	b _0815FCB6
	.align 2, 0
_0815FC30: .4byte 0x020380D7
_0815FC34: .4byte 0x020380BE
_0815FC38: .4byte 0x0000FFFF
_0815FC3C: .4byte 0x03005B60
_0815FC40:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0815FC8C
	mov r3, r8
	lsls r4, r3, #2
	adds r0, r4, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #0x26]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r5, _0815FC90
	adds r0, r0, r5
	bl DestroySpriteAndFreeResources_
	ldr r0, _0815FC94
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	mov sb, r4
	cmp r0, #0
	bne _0815FC98
	lsls r1, r7, #4
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrh r0, [r1, #0x20]
	rsbs r0, r0, #0
	subs r0, #0x20
	strh r0, [r1, #0x24]
	b _0815FCAC
	.align 2, 0
_0815FC8C: .4byte 0x03005B60
_0815FC90: .4byte 0x020205AC
_0815FC94: .4byte 0x020380D6
_0815FC98:
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r2, [r0, #0x20]
	movs r4, #0x88
	lsls r4, r4, #1
	adds r1, r4, #0
	subs r1, r1, r2
	strh r1, [r0, #0x24]
_0815FCAC:
	ldr r0, _0815FCC0
	mov r1, sb
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
_0815FCB6:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0815FDA0
	.align 2, 0
_0815FCC0: .4byte 0x03005B60
_0815FCC4:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0815FD38
	mov r0, r8
	lsls r4, r0, #2
	adds r0, r4, r0
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r3, [r2, #0xa]
	adds r0, r0, r3
	strh r0, [r2, #0xa]
	ldr r0, _0815FD3C
	mov sl, r0
	ldrb r0, [r0]
	str r2, [sp, #0x18]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	mov sb, r4
	ldr r2, [sp, #0x18]
	cmp r0, #0
	bne _0815FD44
	ldr r1, _0815FD40
	lsls r5, r7, #4
	adds r0, r5, r7
	lsls r0, r0, #2
	adds r6, r0, r1
	ldrh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r6, #0x24]
	adds r0, r0, r1
	strh r0, [r6, #0x24]
	movs r2, #0x24
	ldrsh r4, [r6, r2]
	movs r3, #0x20
	ldrsh r0, [r6, r3]
	adds r4, r4, r0
	mov r1, sl
	ldrb r0, [r1]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r5, #0
	cmp r4, r0
	blt _0815FD7C
	movs r2, #0
	strh r2, [r6, #0x24]
	b _0815FD7C
	.align 2, 0
_0815FD38: .4byte 0x03005B60
_0815FD3C: .4byte 0x020380D6
_0815FD40: .4byte 0x020205AC
_0815FD44:
	ldr r1, _0815FDB0
	lsls r5, r7, #4
	adds r0, r5, r7
	lsls r0, r0, #2
	adds r6, r0, r1
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r6, #0x24]
	subs r0, r0, r1
	strh r0, [r6, #0x24]
	movs r3, #0x24
	ldrsh r4, [r6, r3]
	movs r1, #0x20
	ldrsh r0, [r6, r1]
	adds r4, r4, r0
	mov r2, sl
	ldrb r0, [r2]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r5, #0
	cmp r4, r0
	bgt _0815FD7C
	movs r4, #0
	strh r4, [r6, #0x24]
_0815FD7C:
	ldr r1, _0815FDB4
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #0xa]
	strh r1, [r0, #0xa]
	ldr r1, _0815FDB0
	adds r0, r3, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x24
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0815FDA0
	mov r0, r8
	bl DestroyAnimVisualTask
_0815FDA0:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815FDB0: .4byte 0x020205AC
_0815FDB4: .4byte 0x03005B60
	thumb_func_end AnimTask_SnatchOpposingMonMove

	thumb_func_start sub_0815FDB8
sub_0815FDB8: @ 0x0815FDB8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0815FDCA
	cmp r0, #1
	beq _0815FE72
	b _0815FEF4
_0815FDCA:
	ldr r0, _0815FE50
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0815FE64
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x7a
	bl PlaySE12WithPanning
	ldr r0, _0815FE54
	ldrb r0, [r0]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x10
	strh r0, [r4, #0x22]
	ldr r0, _0815FE58
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0815FE5C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0815FEF4
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815FEF4
	movs r0, #1
	bl GetAnimBattlerSpriteId
	ldr r2, _0815FE60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x43
	ldrb r0, [r1]
	subs r0, #1
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	b _0815FEF4
	.align 2, 0
_0815FE50: .4byte 0x020380BE
_0815FE54: .4byte 0x020380D7
_0815FE58: .4byte 0x0000FFE0
_0815FE5C: .4byte 0x020380D6
_0815FE60: .4byte 0x020205AC
_0815FE64:
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _0815FEF4
_0815FE72:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r2, [r4, #0x30]
	adds r0, r2, #5
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _0815FEA6
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	adds r0, r2, #0
	subs r0, #0x7a
	strh r0, [r4, #0x30]
_0815FEA6:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldr r0, _0815FED0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815FED4
	ldrh r2, [r4, #0x32]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x24]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	adds r1, r2, #0
	b _0815FEE0
	.align 2, 0
_0815FED0: .4byte 0x020380D6
_0815FED4:
	ldrh r1, [r4, #0x32]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	strh r0, [r4, #0x24]
_0815FEE0:
	movs r0, #0xff
	ands r0, r1
	strh r0, [r4, #0x32]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne _0815FEF4
	adds r0, r4, #0
	bl DestroyAnimSprite
_0815FEF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0815FDB8

	thumb_func_start AnimTask_SnatchPartnerMove
AnimTask_SnatchPartnerMove: @ 0x0815FEFC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0815FF24
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0x26
	ldrsh r0, [r0, r2]
	adds r3, r1, #0
	cmp r0, #4
	bls _0815FF18
	b _0816006A
_0815FF18:
	lsls r0, r0, #2
	ldr r1, _0815FF28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815FF24: .4byte 0x03005B60
_0815FF28: .4byte 0x0815FF2C
_0815FF2C: @ jump table
	.4byte _0815FF40 @ case 0
	.4byte _0815FF90 @ case 1
	.4byte _0815FFEC @ case 2
	.4byte _08160004 @ case 3
	.4byte _0816006A @ case 4
_0815FF40:
	ldr r0, _0815FF84
	ldrb r0, [r0]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r0, _0815FF88
	ldrb r0, [r0]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	ldr r1, _0815FF8C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #6
	strh r0, [r1, #8]
	cmp r5, r2
	ble _0815FF76
	rsbs r0, r0, #0
	strh r0, [r1, #8]
_0815FF76:
	strh r5, [r1, #0xa]
	strh r2, [r1, #0xc]
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
	b _08160088
	.align 2, 0
_0815FF84: .4byte 0x020380D6
_0815FF88: .4byte 0x020380D7
_0815FF8C: .4byte 0x03005B60
_0815FF90:
	ldr r1, _0815FFCC
	ldr r0, _0815FFD0
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r1, _0815FFD4
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r3
	ldrh r0, [r2, #8]
	ldrh r3, [r1, #0x24]
	adds r0, r0, r3
	strh r0, [r1, #0x24]
	movs r3, #8
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0815FFD8
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r3, #0x24
	ldrsh r1, [r1, r3]
	adds r0, r0, r1
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	b _0816005E
	.align 2, 0
_0815FFCC: .4byte 0x02023E88
_0815FFD0: .4byte 0x020380D6
_0815FFD4: .4byte 0x020205AC
_0815FFD8:
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r3, #0x24
	ldrsh r1, [r1, r3]
	adds r0, r0, r1
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _08160088
	b _08160062
_0815FFEC:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r2, #8
	ldrsh r1, [r0, r2]
	rsbs r1, r1, #0
	strh r1, [r0, #8]
	ldrh r1, [r0, #0x26]
	adds r1, #1
	strh r1, [r0, #0x26]
	b _08160088
_08160004:
	ldr r1, _08160044
	ldr r0, _08160048
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r1, _0816004C
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r3
	ldrh r0, [r2, #8]
	ldrh r3, [r1, #0x24]
	adds r0, r0, r3
	strh r0, [r1, #0x24]
	movs r3, #8
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _08160050
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r3, #0x24
	ldrsh r1, [r1, r3]
	adds r0, r0, r1
	movs r3, #0xa
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _08160088
	b _08160062
	.align 2, 0
_08160044: .4byte 0x02023E88
_08160048: .4byte 0x020380D6
_0816004C: .4byte 0x020205AC
_08160050:
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r3, #0x24
	ldrsh r1, [r1, r3]
	adds r0, r0, r1
	movs r3, #0xa
	ldrsh r1, [r2, r3]
_0816005E:
	cmp r0, r1
	blt _08160088
_08160062:
	ldrh r0, [r2, #0x26]
	adds r0, #1
	strh r0, [r2, #0x26]
	b _08160088
_0816006A:
	ldr r1, _08160090
	ldr r0, _08160094
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r1, _08160098
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x24]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08160088:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08160090: .4byte 0x02023E88
_08160094: .4byte 0x020380D6
_08160098: .4byte 0x020205AC
	thumb_func_end AnimTask_SnatchPartnerMove

	thumb_func_start AnimTask_TeeterDanceMovement
AnimTask_TeeterDanceMovement: @ 0x0816009C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08160104
	adds r4, r1, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r4, #0xe]
	ldr r0, _08160108
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
	cmp r0, #0
	bne _081600D0
	movs r1, #1
_081600D0:
	strh r1, [r4, #0x10]
	ldr r2, _0816010C
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x22]
	strh r0, [r4, #0x14]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x20]
	strh r0, [r4, #0x12]
	strh r5, [r4, #0x1a]
	strh r5, [r4, #0x1e]
	movs r0, #1
	strh r0, [r4, #0x1c]
	strh r5, [r4, #0x20]
	ldr r0, _08160110
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08160104: .4byte 0x03005B60
_08160108: .4byte 0x020380D6
_0816010C: .4byte 0x020205AC
_08160110: .4byte 0x08160115
	thumb_func_end AnimTask_TeeterDanceMovement

	thumb_func_start AnimTask_TeeterDanceMovementStep
AnimTask_TeeterDanceMovementStep: @ 0x08160114
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08160138
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _081601BC
	cmp r0, #1
	bgt _0816013C
	cmp r0, #0
	beq _08160142
	b _08160212
	.align 2, 0
_08160138: .4byte 0x03005B60
_0816013C:
	cmp r0, #2
	beq _0816020C
	b _08160212
_08160142:
	ldrh r0, [r4, #0x1e]
	adds r0, #8
	movs r2, #0xff
	ands r0, r2
	strh r0, [r4, #0x1e]
	ldr r5, _081601B4
	movs r6, #0xe
	ldrsh r0, [r4, r6]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r3, _081601B8
	movs r6, #0x1e
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	strh r0, [r1, #0x24]
	ldrh r0, [r4, #0x1a]
	adds r0, #2
	ands r0, r2
	strh r0, [r4, #0x1a]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r5
	movs r6, #0x1a
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	ldrh r1, [r4, #0x10]
	muls r0, r1, r0
	ldrh r1, [r4, #0x12]
	adds r0, r0, r1
	strh r0, [r2, #0x20]
	movs r6, #0x1a
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _08160212
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x20]
	b _081601FC
	.align 2, 0
_081601B4: .4byte 0x020205AC
_081601B8: .4byte 0x082FA8CC
_081601BC:
	ldrh r0, [r4, #0x1e]
	adds r0, #8
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x1e]
	ldr r3, _08160204
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _08160208
	movs r5, #0x1e
	ldrsh r0, [r4, r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	strh r0, [r1, #0x24]
	movs r6, #0x1e
	ldrsh r2, [r4, r6]
	cmp r2, #0
	bne _08160212
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	strh r2, [r1, #0x24]
_081601FC:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08160212
	.align 2, 0
_08160204: .4byte 0x020205AC
_08160208: .4byte 0x082FA8CC
_0816020C:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08160212:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_TeeterDanceMovementStep

	thumb_func_start AnimKnockOffStrikeStep
AnimKnockOffStrikeStep: @ 0x08160218
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0816026C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldrh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x30]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl Sin
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0816025E
	adds r0, r4, #0
	bl DestroyAnimSprite
_0816025E:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816026C: .4byte 0x020380D7
	thumb_func_end AnimKnockOffStrikeStep

	thumb_func_start AnimKnockOffStrike
AnimKnockOffStrike: @ 0x08160270
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081602A8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081602B4
	ldr r2, _081602AC
	ldrh r0, [r4, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r2, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, _081602B0
	strh r0, [r4, #0x2e]
	movs r0, #0xc0
	strh r0, [r4, #0x30]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	b _081602CE
	.align 2, 0
_081602A8: .4byte 0x020380D7
_081602AC: .4byte 0x020380BE
_081602B0: .4byte 0x0000FFF5
_081602B4:
	movs r0, #0xb
	strh r0, [r4, #0x2e]
	movs r0, #0xc0
	strh r0, [r4, #0x30]
	ldr r1, _081602D8
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
_081602CE:
	ldr r0, _081602DC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081602D8: .4byte 0x020380BE
_081602DC: .4byte 0x08160219
	thumb_func_end AnimKnockOffStrike

	thumb_func_start AnimRecycle
AnimRecycle: @ 0x081602E0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08160324
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	strh r0, [r5, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bgt _0816030A
	movs r0, #0x10
	strh r0, [r5, #0x22]
_0816030A:
	movs r0, #0
	strh r0, [r5, #0x3a]
	movs r1, #0x10
	strh r1, [r5, #0x3c]
	ldr r0, _08160328
	str r0, [r5, #0x1c]
	lsls r1, r1, #8
	movs r0, #0x52
	bl SetGpuReg
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08160324: .4byte 0x020380D6
_08160328: .4byte 0x0816032D
	thumb_func_end AnimRecycle

	thumb_func_start AnimRecycleStep
AnimRecycleStep: @ 0x0816032C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _081603A4
	cmp r1, #1
	bgt _08160342
	cmp r1, #0
	beq _0816034C
	b _08160420
_08160342:
	cmp r1, #2
	beq _081603BA
	cmp r1, #3
	beq _0816041A
	b _08160420
_0816034C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08160420
	strh r1, [r4, #0x2e]
	ldrh r1, [r4, #0x30]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08160376
	ldrh r2, [r4, #0x3a]
	movs r3, #0x3a
	ldrsh r0, [r4, r3]
	cmp r0, #0xf
	bgt _08160384
	adds r0, r2, #1
	strh r0, [r4, #0x3a]
	b _08160384
_08160376:
	ldrh r2, [r4, #0x3c]
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08160384
	subs r0, r2, #1
	strh r0, [r4, #0x3c]
_08160384:
	adds r0, r1, #1
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x3a]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08160420
	b _08160412
_081603A4:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _08160420
	strh r1, [r4, #0x2e]
	strh r1, [r4, #0x30]
	b _08160412
_081603BA:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08160420
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x30]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081603E6
	ldrh r2, [r4, #0x3a]
	movs r3, #0x3a
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _081603F4
	subs r0, r2, #1
	strh r0, [r4, #0x3a]
	b _081603F4
_081603E6:
	ldrh r2, [r4, #0x3c]
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	cmp r0, #0xf
	bgt _081603F4
	adds r0, r2, #1
	strh r0, [r4, #0x3c]
_081603F4:
	adds r0, r1, #1
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x3a]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _08160420
_08160412:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	b _08160420
_0816041A:
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_08160420:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimRecycleStep

	thumb_func_start AnimTask_GetWeather
AnimTask_GetWeather: @ 0x08160428
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _08160444
	movs r0, #0
	strh r0, [r2, #0xe]
	ldr r0, _08160448
	ldrh r1, [r0]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _0816044C
	movs r0, #1
	b _0816046E
	.align 2, 0
_08160444: .4byte 0x020380BE
_08160448: .4byte 0x020380BC
_0816044C:
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _08160458
	movs r0, #2
	b _0816046E
_08160458:
	movs r0, #0x18
	ands r0, r1
	cmp r0, #0
	beq _08160464
	movs r0, #3
	b _0816046E
_08160464:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08160470
	movs r0, #4
_0816046E:
	strh r0, [r2, #0xe]
_08160470:
	adds r0, r3, #0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_GetWeather

	thumb_func_start AnimTask_SlackOffSquish
AnimTask_SlackOffSquish: @ 0x0816047C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081604B4
	adds r4, r4, r0
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, _081604B8
	ldrb r0, [r0]
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strh r1, [r4, #0x26]
	ldr r2, _081604BC
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _081604C0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081604B4: .4byte 0x03005B60
_081604B8: .4byte 0x020380BE
_081604BC: .4byte 0x085AD7D0
_081604C0: .4byte 0x081604C5
	thumb_func_end AnimTask_SlackOffSquish

	thumb_func_start AnimTask_SlackOffSquishStep
AnimTask_SlackOffSquishStep: @ 0x081604C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r2, _0816051C
	adds r3, r0, r2
	ldrh r0, [r3, #8]
	adds r1, r0, #1
	movs r5, #0
	strh r1, [r3, #8]
	subs r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r2, #0
	cmp r0, #0x16
	bhi _08160528
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08160538
	strh r5, [r3, #0xa]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	bne _08160528
	ldr r2, _08160520
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _08160524
	strh r1, [r0, #0x24]
	b _08160538
	.align 2, 0
_0816051C: .4byte 0x03005B60
_08160520: .4byte 0x020205AC
_08160524: .4byte 0x0000FFFF
_08160528:
	ldr r2, _08160558
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r5, [r0, #0x24]
_08160538:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08160550
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08160550:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08160558: .4byte 0x020205AC
	thumb_func_end AnimTask_SlackOffSquishStep

