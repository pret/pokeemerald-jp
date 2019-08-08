.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0810A9F8
sub_0810A9F8: @ 0x0810A9F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0810AA18
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810AA20
	ldr r0, _0810AA1C
	ldrh r1, [r4, #0x20]
	ldrh r2, [r0]
	subs r1, r1, r2
	strh r1, [r4, #0x20]
	b _0810AA2C
	.align 2, 0
_0810AA18: .4byte 0x020380D6
_0810AA1C: .4byte 0x020380BE
_0810AA20:
	ldr r1, _0810AA40
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	adds r0, r1, #0
_0810AA2C:
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, _0810AA44
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810AA40: .4byte 0x020380BE
_0810AA44: .4byte 0x0810AA49
	thumb_func_end sub_0810A9F8

	thumb_func_start sub_0810AA48
sub_0810AA48: @ 0x0810AA48
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0810AA5E
	adds r0, r2, #0
	bl DestroyAnimSprite
_0810AA5E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810AA48

	thumb_func_start sub_0810AA64
sub_0810AA64: @ 0x0810AA64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0810AA84
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810AA8C
	ldr r0, _0810AA88
	ldrh r1, [r4, #0x20]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r4, #0x20]
	b _0810AA96
	.align 2, 0
_0810AA84: .4byte 0x020380D6
_0810AA88: .4byte 0x020380BE
_0810AA8C:
	ldr r0, _0810AAA0
	ldrh r0, [r0]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
_0810AA96:
	ldr r0, _0810AAA4
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810AAA0: .4byte 0x020380BE
_0810AAA4: .4byte 0x0810AAA9
	thumb_func_end sub_0810AA64

	thumb_func_start sub_0810AAA8
sub_0810AAA8: @ 0x0810AAA8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0810AABE
	adds r0, r2, #0
	bl DestroySpriteAndMatrix
_0810AABE:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810AAA8

	thumb_func_start sub_0810AAC4
sub_0810AAC4: @ 0x0810AAC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0810AB08
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
	ldr r0, _0810AB0C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810AB14
	ldr r2, _0810AB10
	ldrh r0, [r5, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x22]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	strh r0, [r5, #0x22]
	b _0810AB28
	.align 2, 0
_0810AB08: .4byte 0x020380D7
_0810AB0C: .4byte 0x020380D6
_0810AB10: .4byte 0x020380BE
_0810AB14:
	ldr r0, _0810AB4C
	ldrh r1, [r0]
	ldrh r2, [r5, #0x20]
	adds r1, r1, r2
	strh r1, [r5, #0x20]
	ldrh r1, [r0, #2]
	ldrh r2, [r5, #0x22]
	adds r1, r1, r2
	strh r1, [r5, #0x22]
	adds r2, r0, #0
_0810AB28:
	movs r0, #0
	strh r0, [r5, #0x2e]
	ldrh r0, [r2, #4]
	strh r0, [r5, #0x30]
	ldrh r0, [r2, #6]
	strh r0, [r5, #0x32]
	ldrh r0, [r2, #8]
	strh r0, [r5, #0x34]
	ldr r1, _0810AB50
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810AB54
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810AB4C: .4byte 0x020380BE
_0810AB50: .4byte 0x080A6015
_0810AB54: .4byte 0x080A5BB5
	thumb_func_end sub_0810AAC4

	thumb_func_start sub_0810AB58
sub_0810AB58: @ 0x0810AB58
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0810AB70
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _0810ABD0
	cmp r0, #1
	bgt _0810AB74
	cmp r0, #0
	beq _0810AB7E
	b _0810ABD0
	.align 2, 0
_0810AB70: .4byte 0x020380BE
_0810AB74:
	cmp r0, #2
	beq _0810AB88
	cmp r0, #3
	beq _0810ABAC
	b _0810ABD0
_0810AB7E:
	ldr r0, _0810AB84
	b _0810ABD2
	.align 2, 0
_0810AB84: .4byte 0x020380D6
_0810AB88:
	ldr r4, _0810ABA0
	ldrb r0, [r4]
	movs r6, #2
	eors r0, r6
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810ABA4
	ldrb r4, [r4]
	b _0810ABD4
	.align 2, 0
_0810ABA0: .4byte 0x020380D6
_0810ABA4:
	ldrb r0, [r4]
	adds r4, r6, #0
	eors r4, r0
	b _0810ABD4
_0810ABAC:
	ldr r0, _0810ABC8
	ldrb r0, [r0]
	movs r4, #2
	eors r0, r4
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810ABD0
	ldr r0, _0810ABCC
	ldrb r0, [r0]
	eors r4, r0
	b _0810ABD4
	.align 2, 0
_0810ABC8: .4byte 0x020380D6
_0810ABCC: .4byte 0x020380D7
_0810ABD0:
	ldr r0, _0810ABF4
_0810ABD2:
	ldrb r4, [r0]
_0810ABD4:
	ldr r0, _0810ABF8
	movs r2, #0xa
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0810ABFC
	adds r0, r4, #0
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	adds r0, r4, #0
	movs r1, #1
	b _0810AC0E
	.align 2, 0
_0810ABF4: .4byte 0x020380D7
_0810ABF8: .4byte 0x020380BE
_0810ABFC:
	adds r0, r4, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	adds r0, r4, #0
	movs r1, #3
_0810AC0E:
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	ldr r7, _0810ACAC
	ldr r6, _0810ACB0
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5, #0x24]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5, #0x26]
	ldrh r1, [r6, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0810AC72
	adds r0, r4, #0
	bl GetBattlerSpriteBGPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #1
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	ldrb r2, [r5, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #5]
_0810AC72:
	ldrb r2, [r5, #3]
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x1b
	movs r0, #4
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	ldr r3, _0810ACB4
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	strh r1, [r2, #6]
	strh r1, [r2]
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	strh r0, [r2, #4]
	ldrh r0, [r6, #6]
	strh r0, [r5, #0x2e]
	ldr r0, _0810ACB8
	str r0, [r5, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810ACAC: .4byte 0x082FA8CC
_0810ACB0: .4byte 0x020380BE
_0810ACB4: .4byte 0x02021B3C
_0810ACB8: .4byte 0x0810EB19
	thumb_func_end sub_0810AB58

	thumb_func_start sub_0810ACBC
sub_0810ACBC: @ 0x0810ACBC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r5, _0810AD30
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldr r6, _0810AD34
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	ldrb r0, [r6]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x38]
	ldrh r0, [r5, #0xa]
	strh r0, [r4, #0x3a]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x3c]
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, _0810AD38
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0810AD3C
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r1, _0810AD40
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810AD30: .4byte 0x020380BE
_0810AD34: .4byte 0x020380D7
_0810AD38: .4byte 0x000003FF
_0810AD3C: .4byte 0xFFFFFC00
_0810AD40: .4byte 0x0810AD45
	thumb_func_end sub_0810ACBC

	thumb_func_start sub_0810AD44
sub_0810AD44: @ 0x0810AD44
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810ADAE
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Cos
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3a]
	ldrh r2, [r4, #0x3c]
	adds r0, r0, r2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0810ADB4
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _0810ADB4
_0810ADAE:
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810ADB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810AD44

	thumb_func_start sub_0810ADBC
sub_0810ADBC: @ 0x0810ADBC
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x38]
	subs r0, #1
	strh r0, [r3, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0810ADF4
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
	ldrh r0, [r3, #0x36]
	strh r0, [r3, #0x38]
_0810ADF4:
	ldrh r0, [r3, #0x34]
	subs r1, r0, #1
	strh r1, [r3, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0810AE06
	adds r0, r3, #0
	bl DestroyAnimSprite
_0810AE06:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810ADBC

	thumb_func_start sub_0810AE0C
sub_0810AE0C: @ 0x0810AE0C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810AE28
	ldr r0, _0810AE6C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810AE30
_0810AE28:
	ldr r1, _0810AE70
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_0810AE30:
	ldr r5, _0810AE6C
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _0810AE70
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r6, #0x22]
	ldrh r0, [r4]
	strh r0, [r6, #0x34]
	ldrh r0, [r4, #6]
	strh r0, [r6, #0x36]
	strh r0, [r6, #0x38]
	ldr r0, _0810AE74
	str r0, [r6, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810AE6C: .4byte 0x020380D7
_0810AE70: .4byte 0x020380BE
_0810AE74: .4byte 0x0810ADBD
	thumb_func_end sub_0810AE0C

	thumb_func_start sub_0810AE78
sub_0810AE78: @ 0x0810AE78
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _0810AE94
	ldrh r0, [r1, #6]
	strh r0, [r5, #0x2e]
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0810AE9C
	ldr r0, _0810AE98
	b _0810AE9E
	.align 2, 0
_0810AE94: .4byte 0x020380BE
_0810AE98: .4byte 0x020380D7
_0810AE9C:
	ldr r0, _0810AF24
_0810AE9E:
	ldrb r6, [r0]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810AEB6
	adds r0, r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810AEBE
_0810AEB6:
	ldr r1, _0810AF28
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r1]
_0810AEBE:
	adds r0, r6, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _0810AF28
	lsrs r0, r0, #0x18
	ldrh r3, [r4]
	adds r0, r0, r3
	strh r0, [r5, #0x20]
	adds r0, r6, #0
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	ldrh r1, [r4, #0xe]
	ldr r0, _0810AF2C
	ands r0, r1
	strh r0, [r5, #0x36]
	ldrh r0, [r4, #4]
	strh r0, [r5, #0x38]
	ldrh r0, [r4, #0xa]
	strh r0, [r5, #0x3a]
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x3c]
	ldrh r2, [r5, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, _0810AF30
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0810AF34
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	ldr r1, _0810AF38
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810AF24: .4byte 0x020380D6
_0810AF28: .4byte 0x020380BE
_0810AF2C: .4byte 0x00007FFF
_0810AF30: .4byte 0x000003FF
_0810AF34: .4byte 0xFFFFFC00
_0810AF38: .4byte 0x0810AF3D
	thumb_func_end sub_0810AE78

	thumb_func_start sub_0810AF3C
sub_0810AF3C: @ 0x0810AF3C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x3c]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, #0
	bne _0810AF92
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0810AF92:
	ldrh r0, [r4, #0x2e]
	subs r1, r0, #1
	strh r1, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0810AFA4
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810AFA4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810AF3C

	thumb_func_start sub_0810AFAC
sub_0810AFAC: @ 0x0810AFAC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldr r3, _0810AFE8
	movs r5, #6
	ldrsh r0, [r3, r5]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r5, _0810AFEC
	adds r0, r5, #0
	ands r1, r0
	ldr r0, _0810AFF0
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	movs r1, #6
	ldrsh r0, [r3, r1]
	cmp r0, #1
	bne _0810AFF4
	ldrb r0, [r4, #3]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x10
	b _0810B002
	.align 2, 0
_0810AFE8: .4byte 0x020380BE
_0810AFEC: .4byte 0x000003FF
_0810AFF0: .4byte 0xFFFFFC00
_0810AFF4:
	cmp r0, #2
	bne _0810B006
	ldrb r0, [r4, #3]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x20
_0810B002:
	orrs r1, r0
	strb r1, [r4, #3]
_0810B006:
	ldr r0, _0810B020
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x2e]
	ldr r0, _0810B024
	str r0, [r4, #0x1c]
	ldr r1, _0810B028
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810B020: .4byte 0x020380BE
_0810B024: .4byte 0x080A5D79
_0810B028: .4byte 0x080A34C5
	thumb_func_end sub_0810AFAC

	thumb_func_start sub_0810B02C
sub_0810B02C: @ 0x0810B02C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _0810B074
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoord
	ldr r1, _0810B078
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r1
	lsls r0, r0, #0x18
	ldr r5, _0810B07C
	lsrs r0, r0, #0x18
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r4, #8]
	ldrb r0, [r6]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0xc]
	ldr r0, _0810B080
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810B074: .4byte 0x020380D7
_0810B078: .4byte 0x03005B60
_0810B07C: .4byte 0x020380BE
_0810B080: .4byte 0x0810B085
	thumb_func_end sub_0810B02C

	thumb_func_start sub_0810B084
sub_0810B084: @ 0x0810B084
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r5, #0
	movs r7, #0
	ldr r1, _0810B0C4
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r2, [r0, #0xc]
	str r2, [sp]
	ldrh r4, [r0, #8]
	ldrh r6, [r0, #0xa]
	movs r3, #0xc
	ldrsh r0, [r0, r3]
	mov sl, r1
	cmp r0, #0
	bne _0810B0C8
	movs r0, #0
	mov r8, r0
	movs r2, #1
	movs r1, #0x10
	mov ip, r1
	b _0810B0D2
	.align 2, 0
_0810B0C4: .4byte 0x03005B60
_0810B0C8:
	movs r2, #0x10
	mov ip, r2
	movs r3, #8
	mov r8, r3
	movs r2, #4
_0810B0D2:
	mov r0, sb
	lsls r1, r0, #2
	adds r0, r1, r0
	lsls r0, r0, #3
	add r0, sl
	movs r3, #0x1c
	ldrsh r0, [r0, r3]
	mov sl, r1
	cmp r0, #0xa
	bhi _0810B1C8
	lsls r0, r0, #2
	ldr r1, _0810B0F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810B0F0: .4byte 0x0810B0F4
_0810B0F4: @ jump table
	.4byte _0810B120 @ case 0
	.4byte _0810B1C8 @ case 1
	.4byte _0810B134 @ case 2
	.4byte _0810B1C8 @ case 3
	.4byte _0810B154 @ case 4
	.4byte _0810B1C8 @ case 5
	.4byte _0810B16A @ case 6
	.4byte _0810B1C8 @ case 7
	.4byte _0810B18C @ case 8
	.4byte _0810B1C8 @ case 9
	.4byte _0810B1C0 @ case 10
_0810B120:
	ldr r0, _0810B130
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	mov r4, ip
	lsls r3, r4, #0x10
	b _0810B1A2
	.align 2, 0
_0810B130: .4byte 0x0857140C
_0810B134:
	mov r0, ip
	lsls r3, r0, #0x11
	mov r1, r8
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0810B150
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	b _0810B1A2
	.align 2, 0
_0810B150: .4byte 0x0857140C
_0810B154:
	mov r3, ip
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	b _0810B196
_0810B16A:
	mov r0, ip
	lsls r3, r0, #0x12
	lsls r0, r2, #1
	adds r0, r0, r2
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0810B188
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	b _0810B1A2
	.align 2, 0
_0810B188: .4byte 0x0857140C
_0810B18C:
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r3, r0, #2
	adds r3, r3, r0
_0810B196:
	ldr r0, _0810B1BC
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
_0810B1A2:
	asrs r3, r3, #0x10
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _0810B1C8
	.align 2, 0
_0810B1BC: .4byte 0x0857140C
_0810B1C0:
	mov r0, sb
	bl DestroyAnimVisualTask
	b _0810B20C
_0810B1C8:
	cmp r7, #0
	beq _0810B1FC
	ldr r4, _0810B21C
	lsls r3, r5, #4
	adds r3, r3, r5
	lsls r3, r3, #2
	adds r0, r3, r4
	ldrh r5, [r0, #4]
	lsls r2, r5, #0x16
	lsrs r2, r2, #0x16
	add r2, r8
	ldr r6, _0810B220
	adds r1, r6, #0
	ands r2, r1
	ldr r1, _0810B224
	ands r1, r5
	orrs r1, r2
	strh r1, [r0, #4]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, #0x2e]
	adds r4, #0x1c
	adds r3, r3, r4
	ldr r1, [r3]
	bl _call_via_r1
_0810B1FC:
	ldr r0, _0810B228
	mov r1, sl
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x1c]
	adds r0, #1
	strh r0, [r1, #0x1c]
_0810B20C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810B21C: .4byte 0x020205AC
_0810B220: .4byte 0x000003FF
_0810B224: .4byte 0xFFFFFC00
_0810B228: .4byte 0x03005B60
	thumb_func_end sub_0810B084

	thumb_func_start sub_0810B22C
sub_0810B22C: @ 0x0810B22C
	push {lr}
	adds r3, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _0810B24E
	ldrb r1, [r3, #1]
	movs r2, #0x3f
	adds r0, r2, #0
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
	ldrb r0, [r3, #3]
	ands r2, r0
	strb r2, [r3, #3]
	b _0810B262
_0810B24E:
	ldrb r2, [r3, #1]
	movs r1, #0x3f
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #1]
	ldrb r0, [r3, #3]
	ands r1, r0
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r3, #3]
_0810B262:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0810B276
	adds r0, r3, #0
	bl DestroySprite
_0810B276:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810B22C

	thumb_func_start sub_0810B27C
sub_0810B27C: @ 0x0810B27C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0810B2E4
	ldrh r1, [r0]
	ldrh r2, [r4, #0x20]
	adds r1, r1, r2
	strh r1, [r4, #0x20]
	ldrh r0, [r0, #2]
	ldrh r3, [r4, #0x22]
	adds r0, r0, r3
	strh r0, [r4, #0x22]
	ldr r0, _0810B2E8
	adds r1, #0x20
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r7, #0x22
	ldrsh r2, [r4, r7]
	adds r3, r4, #0
	adds r3, #0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0810B2EC
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r6, r2, r3
	ldrh r5, [r6, #4]
	lsls r1, r5, #0x16
	lsrs r1, r1, #0x16
	adds r1, #8
	ldr r7, _0810B2F0
	adds r0, r7, #0
	ands r1, r0
	ldr r0, _0810B2F4
	ands r0, r5
	orrs r0, r1
	strh r0, [r6, #4]
	ldr r1, _0810B2F8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r3, #0x1c
	adds r2, r2, r3
	ldr r0, _0810B2FC
	str r0, [r2]
	str r0, [r4, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810B2E4: .4byte 0x020380BE
_0810B2E8: .4byte 0x08571424
_0810B2EC: .4byte 0x020205AC
_0810B2F0: .4byte 0x000003FF
_0810B2F4: .4byte 0xFFFFFC00
_0810B2F8: .4byte 0x0203809E
_0810B2FC: .4byte 0x0810B301
	thumb_func_end sub_0810B27C

	thumb_func_start sub_0810B300
sub_0810B300: @ 0x0810B300
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _0810B334
	movs r0, #0
	strh r0, [r3, #0x2e]
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
_0810B334:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	bne _0810B348
	adds r0, r3, #0
	bl DestroyAnimSprite
_0810B348:
	pop {r0}
	bx r0
	thumb_func_end sub_0810B300

	thumb_func_start sub_0810B34C
sub_0810B34C: @ 0x0810B34C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0810B36C
	adds r5, r1, r0
	ldr r0, _0810B370
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810B378
	ldr r4, _0810B374
	b _0810B37A
	.align 2, 0
_0810B36C: .4byte 0x03005B60
_0810B370: .4byte 0x020380BE
_0810B374: .4byte 0x020380D6
_0810B378:
	ldr r4, _0810B3BC
_0810B37A:
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x24]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x26]
	ldr r2, _0810B3C0
	ldrh r0, [r2, #2]
	movs r1, #0
	strh r0, [r5, #0x14]
	strh r1, [r5, #0x16]
	strh r1, [r5, #0x18]
	strh r1, [r5, #0x1a]
	strh r1, [r5, #0x1c]
	ldrh r0, [r2, #6]
	strh r0, [r5, #0x1e]
	strh r1, [r5, #0x20]
	ldrh r0, [r2, #4]
	strh r0, [r5, #0x22]
	ldr r0, _0810B3C4
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810B3BC: .4byte 0x020380D7
_0810B3C0: .4byte 0x020380BE
_0810B3C4: .4byte 0x0810B3C9
	thumb_func_end sub_0810B34C

	thumb_func_start sub_0810B3C8
sub_0810B3C8: @ 0x0810B3C8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r2, r6, #0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0810B4B0
	adds r5, r0, r1
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0810B4C8
	ldrh r0, [r5, #0x20]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x22
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _0810B4D6
	strh r7, [r5, #0x20]
	ldr r0, _0810B4B4
	movs r3, #0x24
	ldrsh r1, [r5, r3]
	movs r3, #0x26
	ldrsh r2, [r5, r3]
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0810B4D6
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0810B4B8
	adds r4, r4, r0
	ldr r1, _0810B4BC
	movs r2, #0x1a
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, #0x20]
	adds r3, r3, r0
	strh r3, [r4, #0x20]
	movs r2, #0x1a
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r1, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldrh r0, [r4, #0x22]
	adds r2, r2, r0
	strh r2, [r4, #0x22]
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	movs r0, #0x28
	subs r0, r0, r1
	strh r0, [r4, #0x2e]
	strh r3, [r4, #0x30]
	ldrh r0, [r5, #0x24]
	strh r0, [r4, #0x32]
	strh r2, [r4, #0x34]
	ldrh r0, [r5, #0x26]
	strh r0, [r4, #0x36]
	strh r6, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	ldr r1, _0810B4C0
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810B4C4
	str r0, [r4, #0x1c]
	ldrh r0, [r5, #0x1a]
	adds r0, #1
	strh r0, [r5, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0810B480
	strh r7, [r5, #0x1a]
_0810B480:
	ldrh r0, [r5, #0x1c]
	adds r0, #1
	strh r0, [r5, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x1e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _0810B4A2
	strh r7, [r5, #0x1c]
	ldrh r1, [r5, #0x18]
	movs r3, #0x18
	ldrsh r0, [r5, r3]
	cmp r0, #5
	bgt _0810B4A2
	adds r0, r1, #1
	strh r0, [r5, #0x18]
_0810B4A2:
	ldrh r0, [r5, #0x16]
	adds r0, #1
	strh r0, [r5, #0x16]
	ldrh r0, [r5, #0x14]
	subs r0, #1
	strh r0, [r5, #0x14]
	b _0810B4D6
	.align 2, 0
_0810B4B0: .4byte 0x03005B60
_0810B4B4: .4byte 0x0857148C
_0810B4B8: .4byte 0x020205AC
_0810B4BC: .4byte 0x0857143C
_0810B4C0: .4byte 0x0810B511
_0810B4C4: .4byte 0x080A60A1
_0810B4C8:
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0810B4D6
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_0810B4D6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0810B3C8

	thumb_func_start sub_0810B4DC
sub_0810B4DC: @ 0x0810B4DC
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810B504
	ldr r2, _0810B50C
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #0x16]
	subs r1, #1
	strh r1, [r0, #0x16]
	adds r0, r4, #0
	bl DestroySprite
_0810B504:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B50C: .4byte 0x03005B60
	thumb_func_end sub_0810B4DC

	thumb_func_start sub_0810B510
sub_0810B510: @ 0x0810B510
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, _0810B524
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B524: .4byte 0x0810B4DD
	thumb_func_end sub_0810B510

	thumb_func_start sub_0810B528
sub_0810B528: @ 0x0810B528
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0810B53C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810B544
	ldr r4, _0810B540
	b _0810B546
	.align 2, 0
_0810B53C: .4byte 0x020380BE
_0810B540: .4byte 0x020380D6
_0810B544:
	ldr r4, _0810B574
_0810B546:
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
	ldr r1, _0810B578
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810B57C
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810B574: .4byte 0x020380D7
_0810B578: .4byte 0x080A6015
_0810B57C: .4byte 0x080A6085
	thumb_func_end sub_0810B528

	thumb_func_start sub_0810B580
sub_0810B580: @ 0x0810B580
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0810B594
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810B59C
	ldr r4, _0810B598
	b _0810B59E
	.align 2, 0
_0810B594: .4byte 0x020380BE
_0810B598: .4byte 0x020380D6
_0810B59C:
	ldr r4, _0810B5D8
_0810B59E:
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
	ldr r1, _0810B5DC
	ldrh r0, [r1, #2]
	strh r0, [r5, #0x24]
	ldrh r0, [r1, #4]
	strh r0, [r5, #0x26]
	ldr r1, _0810B5E0
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810B5E4
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810B5D8: .4byte 0x020380D7
_0810B5DC: .4byte 0x020380BE
_0810B5E0: .4byte 0x080A34C5
_0810B5E4: .4byte 0x080A60A1
	thumb_func_end sub_0810B580

	thumb_func_start sub_0810B5E8
sub_0810B5E8: @ 0x0810B5E8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r4, _0810B640
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
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x3a]
	movs r0, #0x10
	strh r0, [r5, #0x3c]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0810B636
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	rsbs r0, r0, #0
	strh r0, [r5, #0x3c]
_0810B636:
	ldr r0, _0810B644
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810B640: .4byte 0x020380D6
_0810B644: .4byte 0x0810B649
	thumb_func_end sub_0810B5E8

	thumb_func_start sub_0810B648
sub_0810B648: @ 0x0810B648
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0810B65A
	cmp r0, #1
	beq _0810B670
	b _0810B6A0
_0810B65A:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0810B6A0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0810B6A0
_0810B670:
	ldrh r2, [r4, #0x3c]
	ldrh r1, [r4, #0x20]
	adds r0, r2, r1
	strh r0, [r4, #0x20]
	ldr r3, _0810B6A8
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x24]
	adds r2, r2, r1
	strh r2, [r0, #0x24]
	ldrh r0, [r4, #0x20]
	adds r0, #0x50
	lsls r0, r0, #0x10
	movs r1, #0xc8
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0810B6A0
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_0810B6A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B6A8: .4byte 0x020205AC
	thumb_func_end sub_0810B648

	thumb_func_start sub_0810B6AC
sub_0810B6AC: @ 0x0810B6AC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	ldr r1, _0810B6D0
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _0810B740
	cmp r0, #1
	bgt _0810B6D4
	cmp r0, #0
	beq _0810B6E0
	b _0810B810
	.align 2, 0
_0810B6D0: .4byte 0x03005B60
_0810B6D4:
	cmp r0, #2
	beq _0810B79C
	cmp r0, #3
	bne _0810B6DE
	b _0810B7F0
_0810B6DE:
	b _0810B810
_0810B6E0:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	strh r0, [r5, #0x26]
	ldr r4, _0810B714
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x24]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810B71C
	ldr r0, _0810B718
	strh r0, [r5, #0x24]
	movs r0, #2
	b _0810B722
	.align 2, 0
_0810B714: .4byte 0x020380D6
_0810B718: .4byte 0x0000FFE0
_0810B71C:
	movs r0, #0x20
	strh r0, [r5, #0x24]
	ldr r0, _0810B738
_0810B722:
	strh r0, [r5, #0x22]
	ldr r2, _0810B73C
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r5, #0x24]
	strh r1, [r0, #0x24]
	b _0810B7E2
	.align 2, 0
_0810B738: .4byte 0x0000FFFE
_0810B73C: .4byte 0x020205AC
_0810B740:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0810B810
	movs r0, #0
	strh r0, [r5, #0xa]
	ldr r4, _0810B798
	movs r1, #0x26
	ldrsh r0, [r5, r1]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	adds r2, #0x3e
	ldrb r3, [r2]
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r5, #0x24]
	movs r2, #0x24
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0810B7E2
	ldrh r2, [r5, #0x22]
	adds r2, r1, r2
	strh r2, [r5, #0x24]
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x24]
	b _0810B810
	.align 2, 0
_0810B798: .4byte 0x020205AC
_0810B79C:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0810B810
	movs r0, #0
	strh r0, [r5, #0xa]
	ldr r1, _0810B7EC
	movs r2, #0x26
	ldrsh r0, [r5, r2]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	adds r2, #0x3e
	ldrb r3, [r2]
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, #0xc]
	adds r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0810B810
_0810B7E2:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _0810B810
	.align 2, 0
_0810B7EC: .4byte 0x020205AC
_0810B7F0:
	ldr r2, _0810B818
	movs r0, #0x26
	ldrsh r1, [r5, r0]
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
	adds r0, r3, #0
	bl DestroyAnimVisualTask
_0810B810:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810B818: .4byte 0x020205AC
	thumb_func_end sub_0810B6AC

	thumb_func_start sub_0810B81C
sub_0810B81C: @ 0x0810B81C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0810B840
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _0810B836
	b _0810B95C
_0810B836:
	cmp r0, #1
	bgt _0810B844
	cmp r0, #0
	beq _0810B84C
	b _0810B99E
	.align 2, 0
_0810B840: .4byte 0x03005B60
_0810B844:
	cmp r0, #2
	bne _0810B84A
	b _0810B990
_0810B84A:
	b _0810B99E
_0810B84C:
	ldr r4, _0810B88C
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
	cmp r0, #0
	bne _0810B862
	movs r1, #1
_0810B862:
	movs r6, #0
	strh r1, [r5, #0xa]
	ldr r0, _0810B890
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r3, r0, #0
	cmp r2, #0
	beq _0810B898
	cmp r2, #4
	beq _0810B8C0
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0810B8F8
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0xe]
	ldr r0, _0810B894
	b _0810B900
	.align 2, 0
_0810B88C: .4byte 0x020380D6
_0810B890: .4byte 0x020380BE
_0810B894: .4byte 0x0000FFF0
_0810B898:
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xe]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x12]
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	lsls r0, r0, #7
	adds r0, #0x78
	strh r0, [r5, #0x10]
	b _0810B936
_0810B8C0:
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	lsls r1, r1, #7
	movs r0, #0x78
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r4, _0810B8F4
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x12]
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0xa
	ldrsh r1, [r5, r2]
	lsls r1, r1, #5
	subs r0, r0, r1
	strh r0, [r5, #0x10]
	b _0810B936
	.align 2, 0
_0810B8F4: .4byte 0x020380D7
_0810B8F8:
	ldr r0, _0810B91C
	strh r0, [r5, #0xe]
	movs r0, #0x80
	lsls r0, r0, #1
_0810B900:
	strh r0, [r5, #0x10]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _0810B920
	movs r2, #0
	ldrsh r0, [r3, r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	movs r0, #0x50
	subs r0, r0, r1
	strh r0, [r5, #0x12]
	b _0810B936
	.align 2, 0
_0810B91C: .4byte 0x0000FFF0
_0810B920:
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, #0x28
	strh r0, [r5, #0x12]
	ldrh r1, [r5, #0xe]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0xe]
	strh r1, [r5, #0x10]
_0810B936:
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _0810B94C
	movs r1, #0
	movs r0, #1
	strh r0, [r5, #0xa]
	strh r1, [r5, #0x14]
	b _0810B988
_0810B94C:
	ldr r0, _0810B958
	strh r0, [r5, #0xa]
	movs r0, #3
	strh r0, [r5, #0x14]
	b _0810B988
	.align 2, 0
_0810B958: .4byte 0x0000FFFF
_0810B95C:
	ldrh r0, [r5, #0xc]
	adds r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0810B99E
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0810B9A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810B988
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0810B9A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810B99E
_0810B988:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _0810B99E
_0810B990:
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0810B99E
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_0810B99E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0810B81C

	thumb_func_start sub_0810B9A4
sub_0810B9A4: @ 0x0810B9A4
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _0810BA30
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	movs r3, #0x12
	ldrsh r2, [r4, r3]
	movs r3, #0x23
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _0810B9DA
	ldr r1, _0810BA34
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strh r5, [r0, #0x3a]
	movs r1, #7
	strh r1, [r0, #0x3c]
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
_0810B9DA:
	ldrh r1, [r4, #0xa]
	ldrh r5, [r4, #0x14]
	adds r0, r1, r5
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0810B9EC
	movs r0, #3
	strh r0, [r4, #0x14]
_0810B9EC:
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #3
	ble _0810B9F8
	movs r0, #0
	strh r0, [r4, #0x14]
_0810B9F8:
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	ldrh r5, [r4, #0xe]
	adds r2, r0, r5
	strh r2, [r4, #0xe]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0810BA18
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x10
	ldrsh r1, [r4, r5]
	cmp r0, r1
	bge _0810BA2C
_0810BA18:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0810BA38
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _0810BA38
_0810BA2C:
	movs r0, #1
	b _0810BA3A
	.align 2, 0
_0810BA30: .4byte 0x085715E4
_0810BA34: .4byte 0x020205AC
_0810BA38:
	movs r0, #0
_0810BA3A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0810B9A4

	thumb_func_start sub_0810BA40
sub_0810BA40: @ 0x0810BA40
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0810BA80
	ldr r3, _0810BA88
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
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
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl DestroySprite
_0810BA80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810BA88: .4byte 0x03005B60
	thumb_func_end sub_0810BA40

	thumb_func_start sub_0810BA8C
sub_0810BA8C: @ 0x0810BA8C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0810BA9E
	cmp r0, #1
	beq _0810BAD0
	b _0810BAE4
_0810BA9E:
	ldr r4, _0810BACC
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
	adds r0, r5, #0
	movs r1, #2
	bl StartSpriteAffineAnim
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _0810BAE4
	.align 2, 0
_0810BACC: .4byte 0x020380D6
_0810BAD0:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0810BAE4
	adds r0, r5, #0
	bl DestroySpriteAndMatrix
_0810BAE4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810BA8C

	thumb_func_start sub_0810BAEC
sub_0810BAEC: @ 0x0810BAEC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0810BB10
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #4
	bls _0810BB06
	b _0810BC78
_0810BB06:
	lsls r0, r0, #2
	ldr r1, _0810BB14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810BB10: .4byte 0x03005B60
_0810BB14: .4byte 0x0810BB18
_0810BB18: @ jump table
	.4byte _0810BB2C @ case 0
	.4byte _0810BBBC @ case 1
	.4byte _0810BBF8 @ case 2
	.4byte _0810BC54 @ case 3
	.4byte _0810BC64 @ case 4
_0810BB2C:
	ldr r4, _0810BBB0
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x14]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x16]
	movs r0, #4
	strh r0, [r5, #0x18]
	ldr r0, _0810BBB4
	ldrb r0, [r0]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x1c]
	movs r2, #0x1c
	ldrsh r0, [r5, r2]
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r1, #5
	bl __divsi3
	strh r0, [r5, #0x1a]
	movs r0, #7
	strh r0, [r5, #0x10]
	ldr r0, _0810BBB8
	strh r0, [r5, #0x12]
	movs r0, #0xc
	strh r0, [r5, #0x1e]
	subs r0, #0x4c
	bl BattleAnimAdjustPanning
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x24]
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	movs r2, #0x20
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r1, #3
	bl __divsi3
	strh r0, [r5, #0x26]
	ldrh r0, [r5, #8]
	adds r0, #1
	b _0810BC76
	.align 2, 0
_0810BBB0: .4byte 0x020380D6
_0810BBB4: .4byte 0x020380D7
_0810BBB8: .4byte 0x0000FFFF
_0810BBBC:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0810BBEC
	movs r0, #0
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_0810BC80
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810BBEC
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #5
	bne _0810BBE6
	movs r0, #3
	b _0810BBEA
_0810BBE6:
	ldrh r0, [r5, #8]
	adds r0, #1
_0810BBEA:
	strh r0, [r5, #8]
_0810BBEC:
	ldrh r1, [r5, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0810BC78
	b _0810BC6E
_0810BBF8:
	ldrh r1, [r5, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0810BC06
	subs r0, r1, #1
	strh r0, [r5, #0x1e]
_0810BC06:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	movs r3, #0
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0810BC78
	strh r3, [r5, #0xa]
	ldrh r1, [r5, #0xc]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0810BC32
	movs r0, #4
	strh r0, [r5, #0x16]
	movs r0, #0x44
	strh r0, [r5, #0x18]
	strh r3, [r5, #0x10]
	strh r2, [r5, #0x12]
	b _0810BC42
_0810BC32:
	movs r0, #0x44
	strh r0, [r5, #0x16]
	movs r0, #4
	strh r0, [r5, #0x18]
	movs r0, #7
	strh r0, [r5, #0x10]
	ldr r0, _0810BC50
	strh r0, [r5, #0x12]
_0810BC42:
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0810BC74
	movs r0, #4
	b _0810BC76
	.align 2, 0
_0810BC50: .4byte 0x0000FFFF
_0810BC54:
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0810BC78
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	b _0810BC78
_0810BC64:
	ldrh r1, [r5, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0810BC74
_0810BC6E:
	subs r0, r1, #1
	strh r0, [r5, #0x1e]
	b _0810BC78
_0810BC74:
	movs r0, #1
_0810BC76:
	strh r0, [r5, #8]
_0810BC78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810BAEC

	thumb_func_start sub_0810BC80
sub_0810BC80: @ 0x0810BC80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _0810BD48
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	movs r3, #0x16
	ldrsh r2, [r4, r3]
	movs r3, #0x23
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _0810BCEC
	ldr r1, _0810BD4C
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrh r2, [r3, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldrh r6, [r4, #0x10]
	adds r1, r1, r6
	ldr r6, _0810BD50
	adds r0, r6, #0
	ands r1, r0
	ldr r0, _0810BD54
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldrh r0, [r4, #0x12]
	ldrh r1, [r4, #0x10]
	adds r0, r0, r1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0810BCD4
	movs r0, #7
	strh r0, [r4, #0x10]
_0810BCD4:
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #7
	ble _0810BCE0
	movs r0, #0
	strh r0, [r4, #0x10]
_0810BCE0:
	strh r5, [r3, #0x3a]
	movs r0, #3
	strh r0, [r3, #0x3c]
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
_0810BCEC:
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0810BD0E
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, #0
	ble _0810BD0E
	ldrh r1, [r4, #0x26]
	ldrh r6, [r4, #0x24]
	adds r1, r1, r6
	strh r1, [r4, #0x24]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x76
	bl PlaySE12WithPanning
_0810BD0E:
	movs r0, #0x12
	ldrsh r3, [r4, r0]
	ldrh r2, [r4, #0x16]
	cmp r3, #0
	bge _0810BD24
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x18
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _0810BD34
_0810BD24:
	cmp r3, #0
	ble _0810BD58
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x18
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _0810BD58
_0810BD34:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x1a]
	ldrh r1, [r4, #0x14]
	adds r0, r0, r1
	strh r0, [r4, #0x14]
	movs r0, #1
	b _0810BD64
	.align 2, 0
_0810BD48: .4byte 0x08571614
_0810BD4C: .4byte 0x020205AC
_0810BD50: .4byte 0x000003FF
_0810BD54: .4byte 0xFFFFFC00
_0810BD58:
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	lsls r0, r0, #3
	adds r0, r2, r0
	strh r0, [r4, #0x16]
	movs r0, #0
_0810BD64:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0810BC80

	thumb_func_start sub_0810BD6C
sub_0810BD6C: @ 0x0810BD6C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0810BDA2
	ldr r3, _0810BDA8
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
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
	bl DestroySprite
_0810BDA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810BDA8: .4byte 0x03005B60
	thumb_func_end sub_0810BD6C

	thumb_func_start sub_0810BDAC
sub_0810BDAC: @ 0x0810BDAC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0810BDD0
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _0810BE28
	cmp r0, #1
	bgt _0810BDD4
	cmp r0, #0
	beq _0810BDDA
	b _0810BE5E
	.align 2, 0
_0810BDD0: .4byte 0x03005B60
_0810BDD4:
	cmp r0, #2
	beq _0810BE50
	b _0810BE5E
_0810BDDA:
	ldr r0, _0810BE24
	ldrb r0, [r0]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x20
	strh r0, [r5, #0x26]
	strh r0, [r5, #0x24]
	cmp r0, #0x10
	ble _0810BE04
	adds r2, r0, #0
_0810BDF4:
	adds r1, r2, #0
	subs r1, #0x20
	adds r2, r1, #0
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bgt _0810BDF4
	strh r1, [r5, #0x24]
_0810BE04:
	ldr r4, _0810BE24
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	ldrb r0, [r4]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #2
	strh r0, [r5, #0x20]
	b _0810BE48
	.align 2, 0
_0810BE24: .4byte 0x020380D7
_0810BE28:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0810BE5E
	movs r0, #0
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_0810BE64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810BE5E
_0810BE48:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _0810BE5E
_0810BE50:
	movs r1, #0x1c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0810BE5E
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_0810BE5E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0810BDAC

	thumb_func_start sub_0810BE64
sub_0810BE64: @ 0x0810BE64
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _0810BEC0
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	movs r3, #0x24
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, #0x20]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _0810BEA8
	ldr r3, _0810BEC4
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x1c
	adds r1, r0, r1
	ldr r2, _0810BEC8
	str r2, [r1]
	adds r0, r0, r3
	strh r5, [r0, #0x3a]
	movs r1, #0xa
	strh r1, [r0, #0x3c]
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
_0810BEA8:
	ldrh r2, [r4, #0x24]
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	movs r3, #0x26
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _0810BECC
	adds r0, r2, #0
	adds r0, #0x20
	strh r0, [r4, #0x24]
	movs r0, #0
	b _0810BECE
	.align 2, 0
_0810BEC0: .4byte 0x085712A4
_0810BEC4: .4byte 0x020205AC
_0810BEC8: .4byte 0x0810BED5
_0810BECC:
	movs r0, #1
_0810BECE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0810BE64

	thumb_func_start sub_0810BED4
sub_0810BED4: @ 0x0810BED4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0810BF08
	ldr r3, _0810BF10
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
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
	bl DestroySprite
_0810BF08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810BF10: .4byte 0x03005B60
	thumb_func_end sub_0810BED4

