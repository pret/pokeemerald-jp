.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08113808
sub_08113808: @ 0x08113808
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x34]
	movs r1, #0x34
	ldrsh r3, [r5, r1]
	cmp r3, #0
	beq _08113870
	subs r0, #1
	strh r0, [r5, #0x34]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl Sin
	ldr r4, _08113868
	movs r1, #0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	strh r0, [r1, #0x24]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl Cos
	movs r1, #0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	strh r0, [r1, #0x26]
	ldrh r0, [r5, #0x32]
	ldrh r2, [r5, #0x2e]
	adds r1, r0, r2
	strh r1, [r5, #0x2e]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _081138A4
	ldr r2, _0811386C
	adds r0, r1, r2
	strh r0, [r5, #0x2e]
	b _081138A4
	.align 2, 0
_08113868: .4byte 0x020205AC
_0811386C: .4byte 0xFFFFFF00
_08113870:
	ldr r2, _081138AC
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x24]
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x26]
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	subs r1, #8
	strh r1, [r0, #0x22]
	ldr r0, _081138B0
	str r0, [r5, #0x1c]
_081138A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081138AC: .4byte 0x020205AC
_081138B0: .4byte 0x080A6015
	thumb_func_end sub_08113808

	thumb_func_start sub_081138B4
sub_081138B4: @ 0x081138B4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _081138FC
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
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08113904
	ldr r2, _08113900
	ldrh r0, [r5, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x20]
	ldrh r0, [r2, #6]
	rsbs r0, r0, #0
	strh r0, [r2, #6]
	ldrh r0, [r2, #8]
	rsbs r0, r0, #0
	strh r0, [r2, #8]
	adds r1, r2, #0
	b _0811390E
	.align 2, 0
_081138FC: .4byte 0x020380D6
_08113900: .4byte 0x020380BE
_08113904:
	ldr r1, _08113944
	ldrh r0, [r1]
	ldrh r2, [r5, #0x20]
	adds r0, r0, r2
	strh r0, [r5, #0x20]
_0811390E:
	ldrh r0, [r1, #2]
	ldrh r2, [r5, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	ldrh r0, [r1, #4]
	strh r0, [r5, #0x2e]
	ldrh r0, [r1, #6]
	strh r0, [r5, #0x30]
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x34]
	ldrh r0, [r1, #0xa]
	strh r0, [r5, #0x38]
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08113948
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0811394C
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113944: .4byte 0x020380BE
_08113948: .4byte 0x080A6015
_0811394C: .4byte 0x080A5FA5
	thumb_func_end sub_081138B4

	thumb_func_start sub_08113950
sub_08113950: @ 0x08113950
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r4, _081139A8
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
	ldr r0, _081139AC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081139B4
	ldr r2, _081139B0
	ldrh r0, [r5, #0x20]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x22]
	adds r1, r1, r0
	strh r1, [r5, #0x22]
	ldrh r0, [r5, #0x32]
	ldrh r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x32]
	ldrh r0, [r2, #6]
	ldrh r1, [r5, #0x36]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
	b _081139DE
	.align 2, 0
_081139A8: .4byte 0x020380D7
_081139AC: .4byte 0x020380D6
_081139B0: .4byte 0x020380BE
_081139B4:
	ldr r1, _081139F8
	ldrh r0, [r1]
	ldrh r2, [r5, #0x20]
	adds r0, r0, r2
	strh r0, [r5, #0x20]
	ldrh r0, [r1, #2]
	ldrh r2, [r5, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	ldrh r0, [r1, #4]
	ldrh r2, [r5, #0x32]
	adds r0, r0, r2
	strh r0, [r5, #0x32]
	ldrh r0, [r1, #6]
	ldrh r1, [r5, #0x36]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
_081139DE:
	ldr r0, _081139F8
	ldrh r0, [r0, #8]
	strh r0, [r5, #0x2e]
	ldr r0, _081139FC
	str r0, [r5, #0x1c]
	ldr r1, _08113A00
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081139F8: .4byte 0x020380BE
_081139FC: .4byte 0x080A67B5
_08113A00: .4byte 0x080A6015
	thumb_func_end sub_08113950

	thumb_func_start sub_08113A04
sub_08113A04: @ 0x08113A04
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08113A18
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08113A20
	ldr r4, _08113A1C
	b _08113A22
	.align 2, 0
_08113A18: .4byte 0x020380BE
_08113A1C: .4byte 0x020380D6
_08113A20:
	ldr r4, _08113A64
_08113A22:
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
	ldr r4, _08113A68
	movs r0, #2
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl SetAnimSpriteInitialXOffset
	ldrh r0, [r4, #4]
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	ldr r0, _08113A6C
	str r0, [r5, #0x1c]
	ldr r1, _08113A70
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113A64: .4byte 0x020380D7
_08113A68: .4byte 0x020380BE
_08113A6C: .4byte 0x080A60A1
_08113A70: .4byte 0x080A6015
	thumb_func_end sub_08113A04

	thumb_func_start sub_08113A74
sub_08113A74: @ 0x08113A74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08113A9C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08113A8E
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
_08113A8E:
	adds r0, r4, #0
	bl sub_08113950
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08113A9C: .4byte 0x020380D6
	thumb_func_end sub_08113A74

	thumb_func_start sub_08113AA0
sub_08113AA0: @ 0x08113AA0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r4, _08113AF4
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r6, #0x20]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x22]
	strh r5, [r6, #0x36]
	movs r0, #1
	strh r0, [r6, #0x38]
	ldr r0, _08113AF8
	ldrh r0, [r0]
	strh r0, [r6, #0x3a]
	ldr r4, _08113AFC
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r7, r0, #0x10
	lsrs r5, r7, #0x10
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoordAttr
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r5, r0
	bls _08113B00
	lsrs r0, r7, #0x11
	b _08113B02
	.align 2, 0
_08113AF4: .4byte 0x020380D6
_08113AF8: .4byte 0x020380BE
_08113AFC: .4byte 0x02023EAF
_08113B00:
	lsrs r0, r1, #0x11
_08113B02:
	strh r0, [r6, #0x3c]
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	movs r2, #0x3c
	ldrsh r1, [r6, r2]
	bl Cos
	strh r0, [r6, #0x24]
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	movs r2, #0x3c
	ldrsh r1, [r6, r2]
	bl Sin
	strh r0, [r6, #0x26]
	ldr r0, _08113B2C
	str r0, [r6, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08113B2C: .4byte 0x08113B31
	thumb_func_end sub_08113AA0

	thumb_func_start sub_08113B30
sub_08113B30: @ 0x08113B30
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r5, [r4, r0]
	cmp r5, #0
	beq _08113B42
	cmp r5, #1
	beq _08113BAE
	b _08113C32
_08113B42:
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x38]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3a]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08113B94
	strh r5, [r4, #0x36]
	ldrh r1, [r4, #0x38]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	bgt _08113B94
	adds r0, r1, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08113B94
	movs r0, #0x10
	strh r0, [r4, #0x38]
_08113B94:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08113C32
	movs r0, #0
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _08113C32
_08113BAE:
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x38]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0x95
	bgt _08113BD6
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x95
	ble _08113BD6
	movs r0, #0x96
	strh r0, [r4, #0x3c]
_08113BD6:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08113C1E
	movs r0, #0
	strh r0, [r4, #0x36]
	ldrh r1, [r4, #0x38]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	bgt _08113C1E
	adds r0, r1, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08113C1E
	movs r0, #0x10
	strh r0, [r4, #0x38]
_08113C1E:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08113C32
	adds r0, r4, #0
	bl DestroyAnimSprite
_08113C32:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08113B30

	thumb_func_start sub_08113C38
sub_08113C38: @ 0x08113C38
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08113C64
	adds r4, r1, r0
	ldr r0, _08113C68
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08113C74
	ldr r0, _08113C6C
	str r0, [sp]
	ldr r0, _08113C70
	b _08113C7A
	.align 2, 0
_08113C64: .4byte 0x03005B60
_08113C68: .4byte 0x020380D6
_08113C6C: .4byte 0x04000014
_08113C70: .4byte 0x02022ACC
_08113C74:
	ldr r0, _08113CF0
	str r0, [sp]
	ldr r0, _08113CF4
_08113C7A:
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	ldr r0, _08113CF8
	str r0, [sp, #4]
	mov r1, sp
	movs r5, #0
	movs r0, #1
	strb r0, [r1, #8]
	mov r0, sp
	strb r5, [r0, #9]
	ldr r0, _08113CFC
	ldrb r0, [r0]
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	subs r1, #0x20
	strh r1, [r4, #0xe]
	adds r0, #0x20
	strh r0, [r4, #0x10]
	cmp r1, #0
	bge _08113CAA
	strh r5, [r4, #0xe]
_08113CAA:
	ldrh r3, [r4, #0xe]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bgt _08113CD8
	ldr r5, _08113D00
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r6, r5, r0
_08113CBC:
	lsls r1, r3, #1
	adds r2, r1, r5
	ldrh r0, [r4, #0xc]
	strh r0, [r2]
	adds r1, r1, r6
	ldrh r0, [r4, #0xc]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _08113CBC
_08113CD8:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ScanlineEffect_SetParams
	ldr r0, _08113D04
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08113CF0: .4byte 0x04000018
_08113CF4: .4byte 0x02022AD0
_08113CF8: .4byte 0xA2600001
_08113CFC: .4byte 0x020380D6
_08113D00: .4byte 0x020388C8
_08113D04: .4byte 0x08113D09
	thumb_func_end sub_08113C38

	thumb_func_start sub_08113D08
sub_08113D08: @ 0x08113D08
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	ldr r1, _08113D2C
	adds r2, r0, r1
	movs r1, #8
	ldrsh r0, [r2, r1]
	cmp r0, #4
	bhi _08113DBE
	lsls r0, r0, #2
	ldr r1, _08113D30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08113D2C: .4byte 0x03005B60
_08113D30: .4byte 0x08113D34
_08113D34: @ jump table
	.4byte _08113D48 @ case 0
	.4byte _08113D6A @ case 1
	.4byte _08113D7A @ case 2
	.4byte _08113DA6 @ case 3
	.4byte _08113DB8 @ case 4
_08113D48:
	ldrh r0, [r2, #0x16]
	adds r0, #1
	strh r0, [r2, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08113D9E
	movs r0, #0
	strh r0, [r2, #0x16]
	ldrh r0, [r2, #0x14]
	adds r0, #1
	strh r0, [r2, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _08113D9E
	b _08113D98
_08113D6A:
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08113D9E
	b _08113D98
_08113D7A:
	ldrh r0, [r2, #0x16]
	adds r0, #1
	strh r0, [r2, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08113D9E
	movs r0, #0
	strh r0, [r2, #0x16]
	ldrh r0, [r2, #0x14]
	subs r0, #1
	strh r0, [r2, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08113D9E
_08113D98:
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
_08113D9E:
	adds r0, r2, #0
	bl sub_08113DC4
	b _08113DBE
_08113DA6:
	ldr r1, _08113DB4
	movs r0, #3
	strb r0, [r1, #0x15]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	b _08113DBE
	.align 2, 0
_08113DB4: .4byte 0x020397C8
_08113DB8:
	adds r0, r3, #0
	bl DestroyAnimVisualTask
_08113DBE:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08113D08

	thumb_func_start sub_08113DC4
sub_08113DC4: @ 0x08113DC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldrh r3, [r5, #0x12]
	ldrh r4, [r5, #0xe]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r4, r0
	bgt _08113E1A
	ldr r7, _08113E30
	mov ip, r7
	ldr r0, _08113E34
	mov r8, r0
	ldr r6, _08113E38
_08113DE2:
	lsls r2, r4, #1
	ldrb r1, [r6, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	add r2, ip
	lsls r0, r3, #1
	add r0, r8
	movs r7, #0
	ldrsh r1, [r0, r7]
	movs r7, #0x14
	ldrsh r0, [r5, r7]
	muls r0, r1, r0
	asrs r0, r0, #7
	ldrh r1, [r5, #0xc]
	adds r0, r0, r1
	strh r0, [r2]
	adds r3, #8
	movs r0, #0xff
	ands r3, r0
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r7, #0x10
	ldrsh r0, [r5, r7]
	cmp r4, r0
	ble _08113DE2
_08113E1A:
	ldrh r0, [r5, #0x12]
	adds r0, #9
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x12]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08113E30: .4byte 0x020388C8
_08113E34: .4byte 0x082FA8CC
_08113E38: .4byte 0x020397C8
	thumb_func_end sub_08113DC4

	thumb_func_start sub_08113E3C
sub_08113E3C: @ 0x08113E3C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldr r5, _08113EDC
	movs r0, #4
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r1, #5
	bl __divsi3
	adds r6, r0, #0
	ldr r1, _08113EE0
	mov r8, r1
	ldrb r0, [r1]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x20]
	mov r2, r8
	ldrb r0, [r2]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r3, [r5, #8]
	adds r0, r0, r3
	strh r0, [r4, #0x22]
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r2, #4
	ldrsh r1, [r5, r2]
	bl Cos
	strh r0, [r4, #0x30]
	movs r3, #2
	ldrsh r0, [r5, r3]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r1, r6, #0
	bl Sin
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x30]
	ldrh r2, [r5]
	adds r3, r2, #0
	muls r3, r1, r3
	adds r1, r3, #0
	ldrh r3, [r4, #0x20]
	adds r1, r1, r3
	strh r1, [r4, #0x20]
	adds r1, r2, #0
	muls r1, r0, r1
	adds r0, r1, #0
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x34]
	ldr r0, _08113EE4
	str r0, [r4, #0x1c]
	adds r4, #0x2e
	ldr r2, _08113EE8
	movs r1, #6
_08113EC4:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08113EC4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08113EDC: .4byte 0x020380BE
_08113EE0: .4byte 0x020380D6
_08113EE4: .4byte 0x08113EED
_08113EE8: .4byte 0x02039DCC
	thumb_func_end sub_08113E3C

