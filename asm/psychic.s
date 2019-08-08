.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0810FA3C
sub_0810FA3C: @ 0x0810FA3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0810FAFC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FA62
	mov r0, r8
	cmp r0, #0
	beq _0810FA7E
_0810FA62:
	ldrb r1, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r5, #5]
	adds r1, r5, #0
	adds r1, #0x43
	movs r0, #0xc8
	strb r0, [r1]
	mov r1, r8
	cmp r1, #0
	bne _0810FB08
_0810FA7E:
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	adds r0, r4, #0
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r6, r1, #0x1f
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FAB4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl MoveBattlerSpriteToBG
_0810FAB4:
	movs r0, #2
	adds r4, r0, #0
	eors r4, r7
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FAD4
	movs r0, #1
	eors r6, r0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl MoveBattlerSpriteToBG
_0810FAD4:
	mov r0, r8
	cmp r0, #0
	bne _0810FB08
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FB08
	ldr r0, _0810FAFC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810FB00
	movs r0, #0x48
	strh r0, [r5, #0x20]
	movs r0, #0x50
	b _0810FB42
	.align 2, 0
_0810FAFC: .4byte 0x020380D6
_0810FB00:
	movs r0, #0xb0
	strh r0, [r5, #0x20]
	movs r0, #0x28
	b _0810FB42
_0810FB08:
	ldr r6, _0810FB70
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FB1E
	ldr r1, _0810FB74
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r1]
_0810FB1E:
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _0810FB74
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	ldrb r0, [r6]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r4, [r4, #2]
	adds r0, r0, r4
_0810FB42:
	strh r0, [r5, #0x22]
	ldr r0, _0810FB74
	ldrh r0, [r0, #4]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	mov r0, r8
	cmp r0, #0
	beq _0810FB7C
	ldrh r0, [r5, #0x22]
	adds r0, #9
	strh r0, [r5, #0x22]
	ldr r1, _0810FB78
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	b _0810FB80
	.align 2, 0
_0810FB70: .4byte 0x020380D6
_0810FB74: .4byte 0x020380BE
_0810FB78: .4byte 0x0810FC19
_0810FB7C:
	ldr r0, _0810FB8C
	str r0, [r5, #0x1c]
_0810FB80:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810FB8C: .4byte 0x0810FB91
	thumb_func_end sub_0810FA3C

	thumb_func_start sub_0810FB90
sub_0810FB90: @ 0x0810FB90
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0810FBAC
	movs r0, #1
	strh r0, [r5, #0x3c]
	b _0810FC06
_0810FBAC:
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FBD2
	ldr r2, _0810FC0C
	ldr r0, _0810FC10
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_0810FBD2:
	movs r0, #2
	eors r4, r0
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FBFC
	ldr r2, _0810FC0C
	ldr r0, _0810FC10
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_0810FBFC:
	ldr r1, _0810FC14
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
_0810FC06:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810FC0C: .4byte 0x020205AC
_0810FC10: .4byte 0x02023E88
_0810FC14: .4byte 0x0810FC19
	thumb_func_end sub_0810FB90

	thumb_func_start sub_0810FC18
sub_0810FC18: @ 0x0810FC18
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0xd
	bne _0810FC44
	ldr r0, _0810FC40
	str r0, [r4, #0x1c]
	b _0810FC48
	.align 2, 0
_0810FC40: .4byte 0x0810FC51
_0810FC44:
	adds r0, r1, #1
	strh r0, [r4, #0x34]
_0810FC48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810FC18

	thumb_func_start sub_0810FC50
sub_0810FC50: @ 0x0810FC50
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0810FCAE
	movs r0, #0
	strh r0, [r3, #0x30]
	ldrh r4, [r3, #0x2e]
	ldr r1, _0810FCB4
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r7, [r0]
	movs r5, #8
	adds r6, r1, #0
	adds r1, r4, #7
	lsls r0, r4, #1
	adds r0, r0, r6
	adds r2, r0, #0
	adds r2, #0x10
	lsls r1, r1, #1
	adds r1, r1, r6
_0810FC86:
	ldrh r0, [r1]
	strh r0, [r2]
	subs r1, #2
	subs r2, #2
	subs r5, #1
	cmp r5, #0
	bgt _0810FC86
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r7, [r0]
	ldrh r0, [r3, #0x32]
	adds r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0810FCAE
	ldr r0, _0810FCB8
	str r0, [r3, #0x1c]
_0810FCAE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810FCB4: .4byte 0x020377B4
_0810FCB8: .4byte 0x0810FCBD
	thumb_func_end sub_0810FC50

	thumb_func_start sub_0810FCBC
sub_0810FCBC: @ 0x0810FCBC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x34]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldrh r0, [r5, #0x34]
	subs r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0810FD62
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810FD52
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FD24
	ldr r2, _0810FD68
	ldr r0, _0810FD6C
	adds r0, r4, r0
	ldrb r1, [r0]
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
_0810FD24:
	movs r0, #2
	adds r4, r0, #0
	eors r4, r6
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FD52
	ldr r2, _0810FD68
	ldr r0, _0810FD6C
	adds r0, r4, r0
	ldrb r1, [r0]
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
_0810FD52:
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0810FD70
	str r0, [r5, #0x1c]
_0810FD62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810FD68: .4byte 0x020205AC
_0810FD6C: .4byte 0x02023E88
_0810FD70: .4byte 0x0810FD75
	thumb_func_end sub_0810FCBC

	thumb_func_start sub_0810FD74
sub_0810FD74: @ 0x0810FD74
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810FDCC
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r5, r1, #0x1f
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FDB2
	adds r0, r5, #0
	bl sub_080A4044
_0810FDB2:
	movs r0, #2
	eors r4, r0
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FDCC
	movs r0, #1
	eors r5, r0
	adds r0, r5, #0
	bl sub_080A4044
_0810FDCC:
	ldr r0, _0810FDD8
	str r0, [r6, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810FDD8: .4byte 0x080A34C5
	thumb_func_end sub_0810FD74

	thumb_func_start sub_0810FDDC
sub_0810FDDC: @ 0x0810FDDC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810FE68
	ldr r5, _0810FE28
	movs r1, #6
	ldrsh r0, [r5, r1]
	movs r6, #0
	cmp r0, #0
	bne _0810FDF6
	movs r6, #1
_0810FDF6:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810FE3E
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810FE3E
	ldr r0, _0810FE2C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810FE30
	ldrh r0, [r5]
	movs r1, #0x48
	subs r1, r1, r0
	strh r1, [r4, #0x20]
	ldrh r0, [r5, #2]
	adds r0, #0x50
	strh r0, [r4, #0x22]
	b _0810FE60
	.align 2, 0
_0810FE28: .4byte 0x020380BE
_0810FE2C: .4byte 0x020380D6
_0810FE30:
	ldrh r0, [r5]
	adds r0, #0xb0
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #2]
	adds r0, #0x28
	strh r0, [r4, #0x22]
	b _0810FE60
_0810FE3E:
	ldr r0, _0810FE54
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810FE58
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitSpritePosToAnimAttacker
	b _0810FE60
	.align 2, 0
_0810FE54: .4byte 0x020380BE
_0810FE58:
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitSpritePosToAnimTarget
_0810FE60:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0810FE7C
_0810FE68:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0810FE7C
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_0810FE7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810FDDC

	thumb_func_start sub_0810FE84
sub_0810FE84: @ 0x0810FE84
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0810FECC
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
	beq _0810FED4
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
	ldrh r0, [r5, #0x20]
	subs r0, #0x28
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x22]
	adds r0, #0xa
	strh r0, [r5, #0x22]
	ldr r0, _0810FED0
	b _0810FEE2
	.align 2, 0
_0810FECC: .4byte 0x020380D6
_0810FED0: .4byte 0x0000FFFF
_0810FED4:
	ldrh r0, [r5, #0x20]
	adds r0, #0x28
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x22]
	subs r0, #0xa
	strh r0, [r5, #0x22]
	movs r0, #1
_0810FEE2:
	strh r0, [r5, #0x30]
	ldr r1, _0810FEF8
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810FEFC
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810FEF8: .4byte 0x080A34C5
_0810FEFC: .4byte 0x080A60A1
	thumb_func_end sub_0810FE84

	thumb_func_start sub_0810FF00
sub_0810FF00: @ 0x0810FF00
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0810FF84
	ldrb r0, [r6]
	movs r1, #1
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsls r1, r1, #0xf
	lsrs r4, r1, #0x10
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0810FF46
	lsls r0, r4, #0x10
	rsbs r0, r0, #0
	lsrs r4, r0, #0x10
_0810FF46:
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	strh r0, [r5, #0x20]
	ldrb r0, [r6]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r7
	strh r0, [r5, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bgt _0810FF72
	movs r0, #0x10
	strh r0, [r5, #0x22]
_0810FF72:
	ldr r1, _0810FF88
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810FF8C
	str r0, [r5, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810FF84: .4byte 0x020380D6
_0810FF88: .4byte 0x0810FF91
_0810FF8C: .4byte 0x080A60A1
	thumb_func_end sub_0810FF00

	thumb_func_start sub_0810FF90
sub_0810FF90: @ 0x0810FF90
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r0, _0810FFBC
	str r0, [r4, #0x10]
	movs r0, #0
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl InitSpriteAffineAnim
	ldr r0, _0810FFC0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FFBC: .4byte 0x08572324
_0810FFC0: .4byte 0x0810FFC5
	thumb_func_end sub_0810FF90

	thumb_func_start sub_0810FFC4
sub_0810FFC4: @ 0x0810FFC4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0810FFD6
	cmp r0, #1
	beq _08110004
	b _0811001C
_0810FFD6:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0811001C
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #0x12
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0811001C
_08110004:
	ldrh r0, [r4, #0x30]
	subs r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0811001C
	adds r0, r4, #0
	bl DestroyAnimSprite
_0811001C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810FFC4

	thumb_func_start sub_08110024
sub_08110024: @ 0x08110024
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08110054
	adds r4, r4, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strh r1, [r4, #8]
	ldr r2, _08110058
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _0811005C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110054: .4byte 0x03005B60
_08110058: .4byte 0x08572340
_0811005C: .4byte 0x08110061
	thumb_func_end sub_08110024

	thumb_func_start sub_08110060
sub_08110060: @ 0x08110060
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08110088
	adds r0, r0, r1
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08110080
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08110080:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110088: .4byte 0x03005B60
	thumb_func_end sub_08110060

	thumb_func_start sub_0811008C
sub_0811008C: @ 0x0811008C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081100D8
	adds r4, r1, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	strh r1, [r4, #0xc]
	ldr r0, _081100DC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r1, #8
	cmp r0, #0
	beq _081100C0
	movs r1, #4
_081100C0:
	strh r1, [r4, #0xe]
	ldrb r1, [r4, #8]
	ldr r2, _081100E0
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _081100E4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081100D8: .4byte 0x03005B60
_081100DC: .4byte 0x020380D6
_081100E0: .4byte 0x08572360
_081100E4: .4byte 0x081100E9
	thumb_func_end sub_0811008C

	thumb_func_start sub_081100E8
sub_081100E8: @ 0x081100E8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08110108
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0811010C
	cmp r0, #1
	beq _08110128
	b _08110186
	.align 2, 0
_08110108: .4byte 0x03005B60
_0811010C:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _08110186
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	b _08110186
_08110128:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08110150
	ldr r2, _0811014C
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	subs r1, #8
	strh r1, [r0, #0x26]
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	b _08110186
	.align 2, 0
_0811014C: .4byte 0x020205AC
_08110150:
	ldr r3, _0811018C
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0x88
	lsls r1, r1, #1
	strh r1, [r0, #0x20]
	ldrb r0, [r4, #8]
	bl ResetSpriteRotScale
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08110186:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811018C: .4byte 0x020205AC
	thumb_func_end sub_081100E8

	thumb_func_start sub_08110190
sub_08110190: @ 0x08110190
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08110218
	adds r5, r1, r0
	movs r1, #0
	movs r0, #0x10
	strh r0, [r5, #0xe]
	strh r1, [r5, #0x10]
	ldr r4, _0811021C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x24]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r0, r6
	bhs _081101FA
	adds r1, r6, #0
_081101FA:
	strh r1, [r5, #0x20]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	ldr r0, _08110220
	str r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08110218: .4byte 0x03005B60
_0811021C: .4byte 0x020380D6
_08110220: .4byte 0x08110225
	thumb_func_end sub_08110190

	thumb_func_start sub_08110224
sub_08110224: @ 0x08110224
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08110248
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _08110324
	cmp r1, #1
	bgt _0811024C
	cmp r1, #0
	beq _0811025A
	b _081103AA
	.align 2, 0
_08110248: .4byte 0x03005B60
_0811024C:
	cmp r1, #2
	bne _08110252
	b _08110386
_08110252:
	cmp r1, #3
	bne _08110258
	b _08110394
_08110258:
	b _081103AA
_0811025A:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bgt _0811026A
	b _081103AA
_0811026A:
	strh r1, [r4, #0xa]
	ldr r0, _081102A8
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	movs r3, #0x24
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	adds r1, #8
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #8
	adds r0, r0, r1
	strh r2, [r0]
	cmp r2, #0x40
	beq _0811030E
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _081102C8
	cmp r0, #1
	bgt _081102AC
	cmp r0, #0
	beq _081102B6
	b _0811030E
	.align 2, 0
_081102A8: .4byte 0x08572378
_081102AC:
	cmp r0, #2
	beq _081102E0
	cmp r0, #3
	beq _081102F8
	b _0811030E
_081102B6:
	ldr r0, _081102C4
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r4, #0x20]
	b _08110306
	.align 2, 0
_081102C4: .4byte 0x020205AC
_081102C8:
	ldr r0, _081102DC
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r4, #0x20]
	rsbs r0, r0, #0
	strh r0, [r1, #0x24]
	ldrh r0, [r4, #0x20]
	b _0811030C
	.align 2, 0
_081102DC: .4byte 0x020205AC
_081102E0:
	ldr r1, _081102F4
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r4, #0x20]
	strh r1, [r0, #0x24]
	ldrh r1, [r4, #0x20]
	strh r1, [r0, #0x26]
	b _0811030E
	.align 2, 0
_081102F4: .4byte 0x020205AC
_081102F8:
	ldr r0, _08110320
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r4, #0x20]
	rsbs r0, r0, #0
_08110306:
	strh r0, [r1, #0x24]
	ldrh r0, [r4, #0x20]
	rsbs r0, r0, #0
_0811030C:
	strh r0, [r1, #0x26]
_0811030E:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _081103AA
	b _08110386
	.align 2, 0
_08110320: .4byte 0x020205AC
_08110324:
	ldrh r0, [r4, #0xa]
	ands r1, r0
	cmp r1, #0
	beq _08110334
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	b _0811033A
_08110334:
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
_0811033A:
	ldrh r1, [r4, #0x10]
	lsls r1, r1, #8
	ldrh r0, [r4, #0xe]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _081103AA
	movs r5, #8
	adds r6, r4, #0
	adds r6, #8
_08110360:
	lsls r0, r5, #1
	adds r1, r6, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x40
	beq _0811037C
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08110390
	adds r0, r0, r1
	bl DestroySprite
_0811037C:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xc
	bls _08110360
_08110386:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _081103AA
	.align 2, 0
_08110390: .4byte 0x020205AC
_08110394:
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_081103AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08110224

	thumb_func_start sub_081103B0
sub_081103B0: @ 0x081103B0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	subs r0, #0xa
	cmp r1, r0
	ble _081103DA
	ldrh r0, [r4, #0x30]
	movs r1, #1
	ands r1, r0
	adds r3, r4, #0
	adds r3, #0x3e
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_081103DA:
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _081103EC
	adds r0, r4, #0
	bl DestroyAnimSprite
_081103EC:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081103B0

	thumb_func_start sub_081103F8
sub_081103F8: @ 0x081103F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _08110434
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08110424
	ldr r4, _08110438
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
_08110424:
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x2e]
	ldr r0, _0811043C
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08110434: .4byte 0x020380BE
_08110438: .4byte 0x020380D6
_0811043C: .4byte 0x081103B1
	thumb_func_end sub_081103F8

	thumb_func_start sub_08110440
sub_08110440: @ 0x08110440
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0811049C
	adds r5, r1, r0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081104E4
	ldr r0, _081104A0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _081104B0
	ldr r0, _081104A4
	strh r0, [r5, #0x1c]
	ldr r4, _081104A8
	ldrb r0, [r4]
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
	strh r0, [r5, #0x1e]
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	strh r0, [r5, #0x20]
	ldr r4, _081104AC
	ldrb r0, [r4]
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
	strh r0, [r5, #0x22]
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	b _0811056E
	.align 2, 0
_0811049C: .4byte 0x03005B60
_081104A0: .4byte 0x020380BE
_081104A4: .4byte 0x0000FFF6
_081104A8: .4byte 0x020380D7
_081104AC: .4byte 0x020380D6
_081104B0:
	movs r0, #0xa
	strh r0, [r5, #0x1c]
	ldr r4, _081104DC
	ldrb r0, [r4]
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	strh r0, [r5, #0x1e]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
	strh r0, [r5, #0x20]
	ldr r4, _081104E0
	ldrb r0, [r4]
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	b _08110562
	.align 2, 0
_081104DC: .4byte 0x020380D6
_081104E0: .4byte 0x020380D7
_081104E4:
	ldr r0, _08110528
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _08110538
	ldr r0, _0811052C
	strh r0, [r5, #0x1c]
	ldr r4, _08110530
	ldrb r0, [r4]
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	strh r0, [r5, #0x1e]
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	strh r0, [r5, #0x20]
	ldr r4, _08110534
	ldrb r0, [r4]
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	strh r0, [r5, #0x22]
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	b _0811056E
	.align 2, 0
_08110528: .4byte 0x020380BE
_0811052C: .4byte 0x0000FFF6
_08110530: .4byte 0x020380D7
_08110534: .4byte 0x020380D6
_08110538:
	movs r0, #0xa
	strh r0, [r5, #0x1c]
	ldr r4, _08110580
	ldrb r0, [r4]
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
	strh r0, [r5, #0x1e]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
	strh r0, [r5, #0x20]
	ldr r4, _08110584
	ldrb r0, [r4]
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
_08110562:
	strh r0, [r5, #0x22]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
_0811056E:
	strh r0, [r5, #0x24]
	movs r0, #6
	strh r0, [r5, #0xa]
	ldr r0, _08110588
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08110580: .4byte 0x020380D6
_08110584: .4byte 0x020380D7
_08110588: .4byte 0x0811058D
	thumb_func_end sub_08110440

	thumb_func_start sub_0811058C
sub_0811058C: @ 0x0811058C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081105AC
	adds r5, r0, r1
	movs r0, #8
	ldrsh r1, [r5, r0]
	cmp r1, #0
	beq _081105B0
	cmp r1, #1
	beq _08110624
	b _08110638
	.align 2, 0
_081105AC: .4byte 0x03005B60
_081105B0:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08110638
	strh r1, [r5, #0xa]
	ldr r0, _0811061C
	movs r2, #0x1e
	ldrsh r1, [r5, r2]
	movs r3, #0x20
	ldrsh r2, [r5, r3]
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _08110604
	ldr r0, _08110620
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	adds r4, r4, r0
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #0x22]
	strh r0, [r4, #0x32]
	ldrh r0, [r5, #0x24]
	strh r0, [r4, #0x36]
	ldrh r0, [r5, #0x1c]
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldrb r0, [r5, #0xc]
	movs r1, #3
	ands r1, r0
	adds r0, r4, #0
	bl StartSpriteAffineAnim
_08110604:
	ldrh r0, [r5, #0xc]
	adds r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _08110638
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _08110638
	.align 2, 0
_0811061C: .4byte 0x08572448
_08110620: .4byte 0x020205AC
_08110624:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	ble _08110638
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08110638:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811058C

	thumb_func_start sub_08110640
sub_08110640: @ 0x08110640
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811065E
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl DestroySprite
_0811065E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08110640

	thumb_func_start sub_08110664
sub_08110664: @ 0x08110664
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0811069C
	adds r4, r1, r0
	ldr r0, _081106A0
	ldrb r0, [r0]
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x20
	strh r0, [r4, #0x24]
	ldr r0, _081106A4
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #1
	beq _081106BA
	cmp r0, #1
	bgt _081106A8
	cmp r0, #0
	beq _081106AE
	b _081106D6
	.align 2, 0
_0811069C: .4byte 0x03005B60
_081106A0: .4byte 0x020380D7
_081106A4: .4byte 0x020380BE
_081106A8:
	cmp r0, #2
	beq _081106C6
	b _081106D6
_081106AE:
	movs r0, #2
	strh r0, [r4, #0x1e]
	movs r0, #5
	strh r0, [r4, #0x20]
	movs r0, #0x40
	b _081106CE
_081106BA:
	movs r0, #2
	strh r0, [r4, #0x1e]
	movs r0, #5
	strh r0, [r4, #0x20]
	movs r0, #0xc0
	b _081106CE
_081106C6:
	movs r0, #4
	strh r0, [r4, #0x1e]
	strh r0, [r4, #0x20]
	movs r0, #0
_081106CE:
	strh r0, [r4, #0x22]
	adds r0, r1, #0
	adds r0, #0x20
	strh r0, [r4, #0x26]
_081106D6:
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _081106E2
	movs r0, #0
	strh r0, [r4, #0x24]
_081106E2:
	ldr r0, _081106FC
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08110708
	ldr r0, _08110700
	ldrh r0, [r0]
	strh r0, [r4, #0x1c]
	ldr r0, _08110704
	b _08110710
	.align 2, 0
_081106FC: .4byte 0x020380D7
_08110700: .4byte 0x02022ACC
_08110704: .4byte 0x04000014
_08110708:
	ldr r0, _08110770
	ldrh r0, [r0]
	strh r0, [r4, #0x1c]
	ldr r0, _08110774
_08110710:
	str r0, [sp]
	ldrh r1, [r4, #0x24]
	lsls r3, r1, #0x10
	asrs r1, r3, #0x10
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	adds r0, #0x40
	cmp r1, r0
	bgt _0811074A
	ldr r5, _08110778
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r6, r5, r0
_0811072A:
	asrs r3, r3, #0x10
	lsls r1, r3, #1
	adds r2, r1, r5
	ldrh r0, [r4, #0x1c]
	strh r0, [r2]
	adds r1, r1, r6
	ldrh r0, [r4, #0x1c]
	strh r0, [r1]
	adds r3, #1
	lsls r3, r3, #0x10
	asrs r1, r3, #0x10
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	adds r0, #0x40
	cmp r1, r0
	ble _0811072A
_0811074A:
	ldr r0, _0811077C
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
	ldr r0, _08110780
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08110770: .4byte 0x02022AD0
_08110774: .4byte 0x04000018
_08110778: .4byte 0x020388C8
_0811077C: .4byte 0xA2600001
_08110780: .4byte 0x08110785
	thumb_func_end sub_08110664

	thumb_func_start sub_08110784
sub_08110784: @ 0x08110784
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081107AC
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _0811085E
	cmp r0, #1
	bgt _081107B0
	cmp r0, #0
	beq _081107B6
	b _08110876
	.align 2, 0
_081107AC: .4byte 0x03005B60
_081107B0:
	cmp r0, #2
	beq _08110870
	b _08110876
_081107B6:
	ldrh r3, [r5, #0x22]
	ldrh r4, [r5, #0x24]
	movs r2, #0x24
	ldrsh r1, [r5, r2]
	movs r2, #0x26
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bgt _0811084E
	ldr r0, _08110800
	mov sb, r0
	movs r7, #3
	ldr r1, _08110804
	mov ip, r1
	movs r2, #0xf0
	lsls r2, r2, #3
	add r2, ip
	mov r8, r2
_081107D8:
	lsls r2, r3, #0x10
	asrs r0, r2, #0xf
	add r0, sb
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r3, #0x20
	ldrsh r1, [r5, r3]
	asrs r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r3, r0, #0x10
	adds r6, r2, #0
	cmp r3, #0
	ble _08110808
	ldrh r1, [r5, #0xa]
	adds r0, r7, #0
	ands r0, r1
	adds r0, r3, r0
	b _08110814
	.align 2, 0
_08110800: .4byte 0x082FA8CC
_08110804: .4byte 0x020388C8
_08110808:
	cmp r3, #0
	bge _08110818
	ldrh r1, [r5, #0xa]
	adds r0, r7, #0
	ands r0, r1
	subs r0, r3, r0
_08110814:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08110818:
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	lsls r3, r2, #1
	mov r0, ip
	adds r4, r3, r0
	ldrh r0, [r5, #0x1c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, r0
	strh r0, [r4]
	add r3, r8
	ldrh r0, [r5, #0x1c]
	adds r1, r1, r0
	strh r1, [r3]
	asrs r0, r6, #0x10
	ldrh r1, [r5, #0x1e]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x26
	ldrsh r0, [r5, r1]
	cmp r2, r0
	ble _081107D8
_0811084E:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _08110876
	b _08110864
_0811085E:
	ldr r1, _0811086C
	movs r0, #3
	strb r0, [r1, #0x15]
_08110864:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _08110876
	.align 2, 0
_0811086C: .4byte 0x020397C8
_08110870:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08110876:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08110784

	thumb_func_start sub_08110884
sub_08110884: @ 0x08110884
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081108B8
	adds r7, r0, r1
	bl AllocOamMatrix
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov sl, r5
	adds r6, r5, #0
	cmp r6, #0xff
	bne _081108BC
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _08110966
	.align 2, 0
_081108B8: .4byte 0x03005B60
_081108BC:
	ldr r1, _081108E0
	ldrb r0, [r1]
	bl CloneBattlerSpriteWithBlend
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov sb, r1
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _081108E4
	adds r0, r5, #0
	bl FreeOamMatrix
	mov r0, r8
	bl DestroyAnimVisualTask
	b _08110966
	.align 2, 0
_081108E0: .4byte 0x020380BE
_081108E4:
	ldr r2, _08110974
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r2, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08110978
	str r1, [r0]
	adds r4, r4, r2
	ldrb r0, [r4, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x1f
	ands r6, r0
	lsls r2, r6, #1
	ldrb r1, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #3]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x43
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrb r3, [r4, #1]
	lsrs r1, r3, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r0, r4, #0
	bl CalcCenterToCornerVec
	ldr r1, _0811097C
	ldrb r0, [r1]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #0x22]
	mov r0, sl
	strh r0, [r7, #0x24]
	mov r1, sb
	strh r1, [r7, #0x26]
	ldr r0, _08110980
	str r0, [r7]
_08110966:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08110974: .4byte 0x020205AC
_08110978: .4byte 0x08007141
_0811097C: .4byte 0x020380BE
_08110980: .4byte 0x08110985
	thumb_func_end sub_08110884

	thumb_func_start sub_08110984
sub_08110984: @ 0x08110984
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081109A8
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08110A08
	cmp r0, #1
	bgt _081109AC
	cmp r0, #0
	beq _081109B6
	b _08110A88
	.align 2, 0
_081109A8: .4byte 0x03005B60
_081109AC:
	cmp r0, #2
	beq _08110A58
	cmp r0, #3
	beq _08110A78
	b _08110A88
_081109B6:
	ldrh r0, [r4, #0xa]
	adds r0, #4
	strh r0, [r4, #0xa]
	ldr r1, _08110A04
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x22]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl SetBattlerSpriteYOffsetFromOtherYScale
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0x30
	bne _08110A88
	b _08110A6A
	.align 2, 0
_08110A04: .4byte 0x082FA8CC
_08110A08:
	ldrh r0, [r4, #0xa]
	subs r0, #4
	strh r0, [r4, #0xa]
	ldr r1, _08110A54
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x22]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl SetBattlerSpriteYOffsetFromOtherYScale
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08110A88
	b _08110A6A
	.align 2, 0
_08110A54: .4byte 0x082FA8CC
_08110A58:
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08110A74
	adds r0, r0, r1
	bl obj_delete_but_dont_free_vram
_08110A6A:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08110A88
	.align 2, 0
_08110A74: .4byte 0x020205AC
_08110A78:
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FreeOamMatrix
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08110A88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08110984

	thumb_func_start sub_08110A90
sub_08110A90: @ 0x08110A90
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _08110B08
	cmp r0, #1
	bgt _08110AA6
	cmp r0, #0
	beq _08110AB0
	b _08110BB0
_08110AA6:
	cmp r0, #2
	beq _08110B3A
	cmp r0, #3
	beq _08110B9A
	b _08110BB0
_08110AB0:
	ldr r4, _08110B04
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
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08110ADE
	ldrh r0, [r5, #0x22]
	adds r0, #0xc
	strh r0, [r5, #0x22]
_08110ADE:
	movs r0, #8
	strh r0, [r5, #0x30]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldrh r0, [r5, #0x30]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	b _08110B32
	.align 2, 0
_08110B04: .4byte 0x020380D6
_08110B08:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08110BB0
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xcb
	bl PlaySE12WithPanning
	adds r0, r5, #0
	movs r1, #1
	bl ChangeSpriteAffineAnim
_08110B32:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _08110BB0
_08110B3A:
	ldrh r0, [r5, #0x32]
	adds r1, r0, #1
	strh r1, [r5, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08110B7E
	movs r0, #0
	strh r0, [r5, #0x32]
	ldrh r1, [r5, #0x30]
	subs r1, #1
	strh r1, [r5, #0x30]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08110B7E
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_08110B7E:
	movs r0, #0xe0
	lsls r0, r0, #2
	adds r2, r0, #0
	ldrh r1, [r5, #0x34]
	adds r2, r2, r1
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r5, #0x26]
	subs r0, r0, r1
	strh r0, [r5, #0x26]
	movs r0, #0xff
	ands r2, r0
	strh r2, [r5, #0x34]
	b _08110BB0
_08110B9A:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyAnimSprite
_08110BB0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08110A90

