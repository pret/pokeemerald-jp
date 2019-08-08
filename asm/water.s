.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AnimTask_CreateRaindrops
AnimTask_CreateRaindrops: @ 0x081079D8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r1, _08107A60
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08107A00
	ldr r1, _08107A64
	ldrh r0, [r1]
	strh r0, [r5, #0xa]
	ldrh r0, [r1, #2]
	strh r0, [r5, #0xc]
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xe]
_08107A00:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r2, #8
	ldrsh r0, [r5, r2]
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	bl __modsi3
	cmp r0, #1
	bne _08107A48
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf0
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x50
	bl __umodsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _08107A68
	adds r1, r4, #0
	movs r3, #4
	bl CreateSprite
_08107A48:
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r2, #0xe
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _08107A5A
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_08107A5A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08107A60: .4byte 0x03005B60
_08107A64: .4byte 0x020380BE
_08107A68: .4byte 0x08570C04
	thumb_func_end AnimTask_CreateRaindrops

	thumb_func_start sub_08107A6C
sub_08107A6C: @ 0x08107A6C
	ldr r1, _08107A74
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_08107A74: .4byte 0x08107A79
	thumb_func_end sub_08107A6C

	thumb_func_start sub_08107A78
sub_08107A78: @ 0x08107A78
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd
	bgt _08107A96
	ldrh r0, [r2, #0x24]
	adds r0, #1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x26]
	adds r0, #4
	strh r0, [r2, #0x26]
_08107A96:
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08107AAA
	adds r0, r2, #0
	bl DestroySprite
_08107AAA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08107A78

	thumb_func_start sub_08107AB0
sub_08107AB0: @ 0x08107AB0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08107AD8
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08107AE0
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _08107ADC
	ldrh r1, [r4]
	subs r0, r0, r1
	b _08107AF2
	.align 2, 0
_08107AD8: .4byte 0x020380D6
_08107ADC: .4byte 0x020380BE
_08107AE0:
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _08107BB8
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r0, r0, r1
_08107AF2:
	strh r0, [r6, #0x20]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r4, [r4, #2]
	adds r0, r0, r4
	strh r0, [r6, #0x22]
	adds r2, r6, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08107BBC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08107B28
	ldr r1, _08107BB8
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_08107B28:
	ldr r5, _08107BB8
	ldrh r0, [r5, #0xc]
	strh r0, [r6, #0x2e]
	ldrh r0, [r6, #0x20]
	strh r0, [r6, #0x30]
	ldr r4, _08107BC0
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x32]
	ldrh r0, [r6, #0x22]
	strh r0, [r6, #0x34]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x36]
	adds r0, r6, #0
	bl InitAnimLinearTranslation
	ldr r0, _08107BC4
	bl CreateInvisibleSpriteWithCallback
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	strh r4, [r6, #0x38]
	ldrb r0, [r5, #8]
	movs r2, #4
	ldrsh r1, [r5, r2]
	bl Sin
	ldrh r1, [r6, #0x20]
	subs r1, r1, r0
	strh r1, [r6, #0x20]
	ldrb r0, [r5, #8]
	movs r2, #6
	ldrsh r1, [r5, r2]
	bl Cos
	ldrh r1, [r6, #0x22]
	subs r1, r1, r0
	strh r1, [r6, #0x22]
	ldr r0, _08107BC8
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r5, #4]
	strh r0, [r1, #0x2e]
	ldrh r0, [r5, #6]
	strh r0, [r1, #0x30]
	ldrh r0, [r5, #0xa]
	strh r0, [r1, #0x32]
	ldrb r0, [r5, #8]
	lsls r0, r0, #8
	strh r0, [r1, #0x34]
	ldrh r0, [r5, #0xc]
	strh r0, [r1, #0x36]
	ldr r1, _08107BCC
	str r1, [r6, #0x1c]
	adds r0, r6, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08107BB8: .4byte 0x020380BE
_08107BBC: .4byte 0x020380D6
_08107BC0: .4byte 0x020380D7
_08107BC4: .4byte 0x08007141
_08107BC8: .4byte 0x020205AC
_08107BCC: .4byte 0x08107BD1
	thumb_func_end sub_08107AB0

	thumb_func_start sub_08107BD0
sub_08107BD0: @ 0x08107BD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldrh r1, [r5, #0x38]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08107C38
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r7, r0, r2
	ldrh r4, [r7, #0x36]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrh r0, [r7, #0x34]
	mov r8, r0
	movs r0, #1
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl AnimTranslateLinear
	mov r1, r8
	lsrs r6, r1, #8
	movs r0, #0x2e
	ldrsh r1, [r7, r0]
	adds r0, r6, #0
	bl Sin
	ldrh r1, [r5, #0x24]
	adds r0, r0, r1
	strh r0, [r5, #0x24]
	movs r0, #0x30
	ldrsh r1, [r7, r0]
	adds r0, r6, #0
	bl Cos
	ldrh r1, [r5, #0x26]
	adds r0, r0, r1
	strh r0, [r5, #0x26]
	ldrh r0, [r7, #0x32]
	mov r1, r8
	adds r1, r1, r0
	strh r1, [r7, #0x34]
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #0
	beq _08107C3C
	strh r4, [r7, #0x36]
	b _08107C46
	.align 2, 0
_08107C38: .4byte 0x020205AC
_08107C3C:
	ldr r0, _08107C54
	str r0, [r5, #0x1c]
	adds r0, r7, #0
	bl DestroySprite
_08107C46:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08107C54: .4byte 0x08107C59
	thumb_func_end sub_08107BD0

	thumb_func_start sub_08107C58
sub_08107C58: @ 0x08107C58
	push {lr}
	adds r3, r0, #0
	adds r3, #0x2c
	ldrb r2, [r3]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r3]
	ldr r1, _08107C78
	str r1, [r0, #0x1c]
	ldr r1, _08107C7C
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_08107C78: .4byte 0x080A60A1
_08107C7C: .4byte 0x08107C81
	thumb_func_end sub_08107C58

	thumb_func_start sub_08107C80
sub_08107C80: @ 0x08107C80
	push {lr}
	movs r1, #0xa
	strh r1, [r0, #0x2e]
	ldr r1, _08107C94
	str r1, [r0, #0x1c]
	ldr r1, _08107C98
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_08107C94: .4byte 0x080A5D79
_08107C98: .4byte 0x080A6015
	thumb_func_end sub_08107C80

	thumb_func_start sub_08107C9C
sub_08107C9C: @ 0x08107C9C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _08107CC4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08107CCC
	ldr r1, _08107CC8
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r1, #0
	b _08107CD2
	.align 2, 0
_08107CC4: .4byte 0x020380D6
_08107CC8: .4byte 0x020380BE
_08107CCC:
	ldr r0, _08107D28
	ldrh r6, [r0, #4]
	adds r7, r0, #0
_08107CD2:
	ldrh r0, [r7, #8]
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	ldr r4, _08107D2C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r6
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r7, [r7, #6]
	adds r0, r0, r7
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl InitAnimLinearTranslation
	ldr r0, _08107D30
	str r0, [r5, #0x1c]
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08107D28: .4byte 0x020380BE
_08107D2C: .4byte 0x020380D7
_08107D30: .4byte 0x08107D35
	thumb_func_end sub_08107C9C

	thumb_func_start sub_08107D34
sub_08107D34: @ 0x08107D34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08107D70
	ldrh r1, [r0, #0xe]
	ldr r0, _08107D74
	cmp r1, r0
	bne _08107D56
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_08107D56:
	adds r0, r4, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08107D68
	adds r0, r4, #0
	bl DestroyAnimSprite
_08107D68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08107D70: .4byte 0x020380BE
_08107D74: .4byte 0x0000FFFF
	thumb_func_end sub_08107D34

	thumb_func_start sub_08107D78
sub_08107D78: @ 0x08107D78
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08107DAC
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldr r0, _08107DB0
	ldrh r0, [r0]
	strh r0, [r4, #8]
	ldr r0, _08107DB4
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r4, #0xc]
	ldr r0, _08107DB8
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08107DAC: .4byte 0x03005B60
_08107DB0: .4byte 0x020380BE
_08107DB4: .4byte 0x0000279C
_08107DB8: .4byte 0x08107DBD
	thumb_func_end sub_08107D78

	thumb_func_start sub_08107DBC
sub_08107DBC: @ 0x08107DBC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08107E34
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #0x1c]
	adds r0, #1
	strh r0, [r2, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov ip, r1
	cmp r0, #3
	bne _08107E0E
	movs r0, #0
	strh r0, [r2, #0x1c]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _08107E38
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r7, r1, #0
	adds r3, r0, #2
	movs r1, #6
	adds r2, r0, #0
_08107DF8:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08107DF8
	adds r0, r5, #7
	lsls r0, r0, #1
	adds r0, r0, r7
	strh r6, [r0]
_08107E0E:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r0, #0x1e]
	adds r1, #1
	strh r1, [r0, #0x1e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #8
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _08107E2E
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08107E2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08107E34: .4byte 0x03005B60
_08107E38: .4byte 0x020377B4
	thumb_func_end sub_08107DBC

	thumb_func_start sub_08107E3C
sub_08107E3C: @ 0x08107E3C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	ldr r4, _08107EA4
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl InitAnimLinearTranslation
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	movs r0, #0xd2
	lsls r0, r0, #8
	bl __divsi3
	strh r0, [r5, #0x38]
	ldr r0, _08107EA8
	ldrh r2, [r0, #6]
	strh r2, [r5, #0x3c]
	ldrh r1, [r0, #0xe]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r0, #0x7f
	ble _08107EAC
	adds r0, r1, #0
	subs r0, #0x7f
	lsls r0, r0, #8
	strh r0, [r5, #0x3a]
	rsbs r0, r2, #0
	strh r0, [r5, #0x3c]
	b _08107EB0
	.align 2, 0
_08107EA4: .4byte 0x020380D7
_08107EA8: .4byte 0x020380BE
_08107EAC:
	lsls r0, r1, #8
	strh r0, [r5, #0x3a]
_08107EB0:
	ldr r1, _08107EC0
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08107EC0: .4byte 0x08107EC5
	thumb_func_end sub_08107E3C

	thumb_func_start sub_08107EC4
sub_08107EC4: @ 0x08107EC4
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08107ED8
	adds r0, r4, #0
	bl DestroyAnimSprite
_08107ED8:
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	asrs r0, r0, #8
	cmp r0, #0x7f
	ble _08107F08
	movs r0, #0
	strh r0, [r4, #0x3a]
	ldrh r0, [r4, #0x3c]
	rsbs r0, r0, #0
	strh r0, [r4, #0x3c]
	b _08107F10
_08107F08:
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	adds r0, r0, r1
	strh r0, [r4, #0x3a]
_08107F10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08107EC4

	thumb_func_start sub_08107F18
sub_08107F18: @ 0x08107F18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08107F38
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r3, _08107F3C
	ldrh r0, [r3]
	movs r2, #0
	strh r0, [r1, #8]
	strh r2, [r3, #0xe]
	ldr r0, _08107F40
	str r0, [r1]
	bx lr
	.align 2, 0
_08107F38: .4byte 0x03005B60
_08107F3C: .4byte 0x020380BE
_08107F40: .4byte 0x08107F45
	thumb_func_end sub_08107F18

	thumb_func_start sub_08107F44
sub_08107F44: @ 0x08107F44
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _08107F78
	ldrh r0, [r2, #0xe]
	adds r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r2, #0xe]
	ldr r1, _08107F7C
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	subs r1, #1
	strh r1, [r0, #8]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _08107F72
	adds r0, r3, #0
	bl DestroyAnimVisualTask
_08107F72:
	pop {r0}
	bx r0
	.align 2, 0
_08107F78: .4byte 0x020380BE
_08107F7C: .4byte 0x03005B60
	thumb_func_end sub_08107F44

	thumb_func_start sub_08107F80
sub_08107F80: @ 0x08107F80
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _08107FCC
	ldrb r0, [r7]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x20]
	ldrb r0, [r7]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	ldr r6, _08107FD0
	strh r6, [r4, #0x26]
	ldrb r0, [r7]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08107FDA
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08107FD4
	movs r0, #0xa
	strh r0, [r4, #0x24]
	b _08107FDC
	.align 2, 0
_08107FCC: .4byte 0x020380D6
_08107FD0: .4byte 0x0000FFF6
_08107FD4:
	strh r6, [r4, #0x24]
	subs r0, r5, #2
	b _08107FDE
_08107FDA:
	strh r6, [r4, #0x24]
_08107FDC:
	adds r0, r5, #2
_08107FDE:
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	ldr r0, _08107FF0
	str r0, [r4, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08107FF0: .4byte 0x08107FF5
	thumb_func_end sub_08107F80

	thumb_func_start sub_08107FF4
sub_08107FF4: @ 0x08107FF4
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0810800A
	adds r0, r2, #0
	bl DestroyAnimSprite
_0810800A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08107FF4

	thumb_func_start sub_08108010
sub_08108010: @ 0x08108010
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r5, _081080D0
	ldrb r0, [r5]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r0, _081080D4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _0810805A
	ldr r4, _081080D8
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4]
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08108052
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0810805A
_08108052:
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4]
_0810805A:
	ldr r5, _081080D8
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	movs r1, #0
	cmp r0, #0
	bne _0810806E
	movs r1, #1
_0810806E:
	ldrb r0, [r5, #0xa]
	movs r7, #1
	cmp r0, #0
	bne _08108078
	movs r7, #3
_08108078:
	adds r0, r6, #0
	bl InitSpritePosToAnimAttacker
	ldr r0, _081080D0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08108092
	ldrh r0, [r5, #4]
	rsbs r0, r0, #0
	strh r0, [r5, #4]
_08108092:
	ldrh r0, [r5, #8]
	strh r0, [r6, #0x2e]
	ldr r4, _081080D4
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #4]
	adds r0, r0, r1
	strh r0, [r6, #0x32]
	ldrb r0, [r4]
	adds r1, r7, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r5, [r5, #6]
	adds r0, r0, r5
	strh r0, [r6, #0x36]
	ldr r0, _081080DC
	str r0, [r6, #0x1c]
	ldr r1, _081080E0
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081080D0: .4byte 0x020380D6
_081080D4: .4byte 0x020380D7
_081080D8: .4byte 0x020380BE
_081080DC: .4byte 0x080A67B5
_081080E0: .4byte 0x080A34C5
	thumb_func_end sub_08108010

	thumb_func_start sub_081080E4
sub_081080E4: @ 0x081080E4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r0, _08108114
	ldrh r1, [r0, #8]
	strh r1, [r4, #0x2e]
	ldrh r0, [r0, #4]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	adds r1, r1, r0
	strh r1, [r4, #0x36]
	ldr r0, _08108118
	str r0, [r4, #0x1c]
	ldr r1, _0810811C
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08108114: .4byte 0x020380BE
_08108118: .4byte 0x080A67B5
_0810811C: .4byte 0x080A34C5
	thumb_func_end sub_081080E4

	thumb_func_start sub_08108120
sub_08108120: @ 0x08108120
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08108138
	movs r1, #6
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0810813C
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	b _08108144
	.align 2, 0
_08108138: .4byte 0x020380BE
_0810813C:
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
_08108144:
	ldr r0, _08108154
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x3c]
	ldr r0, _08108158
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08108154: .4byte 0x020380BE
_08108158: .4byte 0x0810815D
	thumb_func_end sub_08108120

	thumb_func_start sub_0810815C
sub_0810815C: @ 0x0810815C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #0xb
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #4
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x30]
	adds r0, #0x30
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3c]
	subs r0, #1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0810819C
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810819C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810815C

	thumb_func_start AnimTask_CreateSurfWave
AnimTask_CreateSurfWave: @ 0x081081A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r1, _08108214
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #0
	movs r2, #1
	bl SetAnimBgAttribute
	mov r0, sp
	bl sub_080A63F8
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08108230
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
	ldr r0, _08108218
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08108220
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _0810821C
	bl AnimLoadCompressedBgTilemap
	b _0810823A
	.align 2, 0
_08108214: .4byte 0x00003F42
_08108218: .4byte 0x020380D6
_0810821C: .4byte 0x08D95DB4
_08108220:
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _0810822C
	bl AnimLoadCompressedBgTilemap
	b _0810823A
	.align 2, 0
_0810822C: .4byte 0x08D96084
_08108230:
	ldr r1, _08108264
	mov r0, sp
	movs r2, #1
	bl sub_080A6628
_0810823A:
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _08108268
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r0, _0810826C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08108274
	ldr r0, _08108270
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	b _08108282
	.align 2, 0
_08108264: .4byte 0x08D96358
_08108268: .4byte 0x08D94A6C
_0810826C: .4byte 0x020380BE
_08108270: .4byte 0x08D95D8C
_08108274:
	ldr r0, _081082EC
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
_08108282:
	ldr r0, _081082F0
	ldr r4, _081082F4
	mov r2, sl
	lsls r5, r2, #2
	adds r1, r5, r2
	lsls r1, r1, #3
	adds r6, r1, r4
	ldrb r1, [r6, #7]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0
	mov sb, r0
	mov r1, r8
	strh r1, [r6, #0x26]
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r7, r0, r4
	mov r0, sb
	strh r0, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r7, #0xa]
	strh r0, [r7, #0xc]
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08108304
	ldr r1, _081082F8
	adds r0, r1, #0
	ldr r2, _081082FC
	strh r0, [r2]
	adds r1, #0x20
	adds r0, r1, #0
	ldr r2, _08108300
	strh r0, [r2]
	movs r0, #2
	strh r0, [r6, #8]
	movs r0, #1
	strh r0, [r6, #0xa]
	mov r0, sb
	strh r0, [r7, #0xe]
	b _0810835E
	.align 2, 0
_081082EC: .4byte 0x08D8FB50
_081082F0: .4byte 0x081085A9
_081082F4: .4byte 0x03005B60
_081082F8: .4byte 0x0000FFB0
_081082FC: .4byte 0x02022ACC
_08108300: .4byte 0x02022ACE
_08108304:
	ldr r0, _08108334
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _08108348
	ldr r2, _08108338
	adds r0, r2, #0
	ldr r2, _0810833C
	strh r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldr r2, _08108340
	strh r0, [r2]
	movs r0, #2
	strh r0, [r6, #8]
	ldr r0, _08108344
	strh r0, [r6, #0xa]
	strh r1, [r7, #0xe]
	b _0810835E
	.align 2, 0
_08108334: .4byte 0x020380D6
_08108338: .4byte 0x0000FF20
_0810833C: .4byte 0x02022ACC
_08108340: .4byte 0x02022ACE
_08108344: .4byte 0x0000FFFF
_08108348:
	ldr r0, _08108390
	strh r4, [r0]
	ldr r1, _08108394
	adds r0, r1, #0
	ldr r2, _08108398
	strh r0, [r2]
	ldr r0, _0810839C
	strh r0, [r6, #8]
	movs r0, #1
	strh r0, [r6, #0xa]
	strh r4, [r7, #0xe]
_0810835E:
	ldr r0, _08108390
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldr r2, _08108398
	ldrh r1, [r2]
	movs r0, #0x16
	bl SetGpuReg
	ldr r1, _081083A0
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _081083A4
	movs r0, #0x30
	strh r0, [r1, #0x10]
	movs r0, #0x70
	b _081083A8
	.align 2, 0
_08108390: .4byte 0x02022ACC
_08108394: .4byte 0x0000FFD0
_08108398: .4byte 0x02022ACE
_0810839C: .4byte 0x0000FFFE
_081083A0: .4byte 0x03005B60
_081083A4:
	movs r0, #0
	strh r0, [r1, #0x10]
_081083A8:
	strh r0, [r1, #0x12]
	ldr r1, _081083CC
	mov r2, sl
	adds r0, r5, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #0x14]
	ldr r1, _081083D0
	str r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081083CC: .4byte 0x03005B60
_081083D0: .4byte 0x081083D5
	thumb_func_end AnimTask_CreateSurfWave

	thumb_func_start sub_081083D4
sub_081083D4: @ 0x081083D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08108500
	ldr r2, _08108504
	ldr r0, _08108508
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #8]
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	ldrh r0, [r4, #0xa]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	mov r0, sp
	bl sub_080A63F8
	ldrh r0, [r4, #0xa]
	ldrh r3, [r4, #0xc]
	adds r0, r0, r3
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08108468
	ldr r1, _0810850C
	mov r0, sp
	ldrb r0, [r0, #8]
	lsls r0, r0, #4
	adds r0, #7
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r2, #6
	adds r7, r1, #0
	adds r3, r7, #0
	mov r4, sp
_0810842E:
	ldrb r0, [r4, #8]
	lsls r0, r0, #4
	adds r1, r2, #1
	adds r0, r0, r1
	lsls r1, r0, #1
	adds r1, r1, r3
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0810842E
	mov r0, sp
	ldrb r0, [r0, #8]
	lsls r0, r0, #4
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	strh r6, [r0]
	ldr r1, _08108508
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r2, [r0, #0x12]
_08108468:
	ldr r1, _08108508
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrh r0, [r3, #0x14]
	adds r0, #1
	strh r0, [r3, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #1
	ble _081084D6
	movs r0, #0
	strh r0, [r3, #0x14]
	ldrh r0, [r3, #0xe]
	adds r2, r0, #1
	strh r2, [r3, #0xe]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd
	bgt _081084B2
	movs r1, #0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r1, #0xa]
	ldrh r0, [r3, #0x10]
	adds r0, #1
	strh r0, [r3, #0x10]
_081084B2:
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r0, #0x36
	ble _081084D6
	ldrh r2, [r3, #0x10]
	subs r2, #1
	strh r2, [r3, #0x10]
	movs r1, #0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r1, #0xa]
_081084D6:
	adds r0, r6, r5
	lsls r0, r0, #3
	adds r2, r0, r4
	movs r3, #0x26
	ldrsh r1, [r2, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #0xa]
	movs r3, #0x1f
	ands r3, r0
	cmp r3, #0
	bne _081084F8
	strh r3, [r2, #8]
	ldr r0, _08108510
	str r0, [r2]
_081084F8:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108500: .4byte 0x02022ACC
_08108504: .4byte 0x02022ACE
_08108508: .4byte 0x03005B60
_0810850C: .4byte 0x020377B4
_08108510: .4byte 0x08108515
	thumb_func_end sub_081083D4

	thumb_func_start sub_08108514
sub_08108514: @ 0x08108514
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r7, _0810854C
	ldr r0, _08108550
	mov r8, r0
	ldr r6, _08108554
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r6
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08108558
	movs r0, #1
	bl sub_080A6530
	movs r0, #2
	bl sub_080A6530
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0810859A
	.align 2, 0
_0810854C: .4byte 0x02022ACC
_08108550: .4byte 0x02022ACE
_08108554: .4byte 0x03005B60
_08108558:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810856C
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_0810856C:
	movs r0, #0
	strh r0, [r7]
	mov r1, r8
	strh r0, [r1]
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r1, _081085A4
	strh r1, [r0, #0x26]
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0810859A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081085A4: .4byte 0x0000FFFF
	thumb_func_end sub_08108514

	thumb_func_start sub_081085A8
sub_081085A8: @ 0x081085A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _081085D0
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _081085C4
	b _081086FC
_081085C4:
	cmp r0, #1
	bgt _081085D4
	cmp r0, #0
	beq _081085DC
	b _08108872
	.align 2, 0
_081085D0: .4byte 0x03005B60
_081085D4:
	cmp r0, #2
	bne _081085DA
	b _081087C8
_081085DA:
	b _08108872
_081085DC:
	movs r3, #0
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	ldr r1, _081086AC
	mov ip, r1
	cmp r3, r0
	bge _0810861A
	mov r7, ip
	movs r5, #0xf0
	lsls r5, r5, #3
	add r5, ip
	ldr r6, _081086B0
_081085F4:
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r3, r1, r7
	adds r1, r1, r5
	ldrh r0, [r4, #0xc]
	strh r0, [r1]
	ldrh r1, [r4, #0xc]
	adds r0, r6, #0
	ands r0, r1
	strh r0, [r3]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _081085F4
_0810861A:
	ldrh r3, [r4, #0x10]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _08108654
	ldr r5, _081086AC
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r6, r5, r0
	ldr r7, _081086B0
_08108632:
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r3, r1, r5
	adds r1, r1, r6
	ldrh r0, [r4, #0xa]
	strh r0, [r1]
	ldrh r1, [r4, #0xa]
	adds r0, r7, #0
	ands r0, r1
	strh r0, [r3]
	adds r2, #1
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08108632
_08108654:
	ldrh r3, [r4, #0x12]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0x9f
	bgt _0810868A
	ldr r5, _081086AC
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r6, r5, r0
	ldr r7, _081086B0
_08108668:
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r3, r1, r5
	adds r1, r1, r6
	ldrh r0, [r4, #0xc]
	strh r0, [r1]
	ldrh r1, [r4, #0xc]
	adds r0, r7, #0
	ands r0, r1
	strh r0, [r3]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0x9f
	ble _08108668
_0810868A:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081086B4
	lsls r0, r3, #0x10
	asrs r0, r0, #0xf
	mov r3, ip
	adds r2, r0, r3
	movs r1, #0xf0
	lsls r1, r1, #3
	add r1, ip
	adds r0, r0, r1
	ldrh r1, [r4, #0xa]
	strh r1, [r0]
	ldrh r0, [r4, #0xa]
	b _081086CA
	.align 2, 0
_081086AC: .4byte 0x020388C8
_081086B0: .4byte 0x0000FFFF
_081086B4:
	lsls r0, r3, #0x10
	asrs r0, r0, #0xf
	mov r1, ip
	adds r2, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #3
	add r1, ip
	adds r0, r0, r1
	ldrh r1, [r4, #0xc]
	strh r1, [r0]
	ldrh r0, [r4, #0xc]
_081086CA:
	strh r0, [r2]
	ldr r0, _081086F4
	str r0, [sp]
	ldr r0, _081086F8
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
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08108872
	.align 2, 0
_081086F4: .4byte 0x04000052
_081086F8: .4byte 0xA2600001
_081086FC:
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bne _08108714
	ldrh r0, [r4, #0x10]
	subs r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08108728
	strh r1, [r4, #0x10]
	b _08108722
_08108714:
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6f
	ble _08108728
_08108722:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08108728:
	movs r3, #0
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _0810875C
	ldr r6, _081087C0
	ldr r5, _081087C4
_08108736:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r3, r1, #1
	ldrb r2, [r5, #0x14]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #7
	adds r3, r3, r0
	adds r3, r3, r6
	ldrh r0, [r4, #0xc]
	strh r0, [r3]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _08108736
_0810875C:
	ldrh r3, [r4, #0x10]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _08108790
	ldr r6, _081087C0
	ldr r5, _081087C4
_0810876E:
	asrs r3, r2, #0x10
	lsls r2, r3, #1
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r6
	ldrh r0, [r4, #0xa]
	strh r0, [r2]
	adds r3, #1
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _0810876E
_08108790:
	ldrh r3, [r4, #0x12]
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	bgt _08108872
	ldr r6, _081087C0
	ldr r5, _081087C4
_0810879E:
	asrs r3, r1, #0x10
	lsls r2, r3, #1
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r6
	ldrh r0, [r4, #0xc]
	strh r0, [r2]
	adds r3, #1
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	ble _0810879E
	b _08108872
	.align 2, 0
_081087C0: .4byte 0x020388C8
_081087C4: .4byte 0x020397C8
_081087C8:
	movs r3, #0
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _081087FC
	ldr r6, _0810887C
	ldr r5, _08108880
_081087D6:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r3, r1, #1
	ldrb r2, [r5, #0x14]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #7
	adds r3, r3, r0
	adds r3, r3, r6
	ldrh r0, [r4, #0xc]
	strh r0, [r3]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _081087D6
_081087FC:
	ldrh r3, [r4, #0x10]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _08108830
	ldr r6, _0810887C
	ldr r5, _08108880
_0810880E:
	asrs r3, r2, #0x10
	lsls r2, r3, #1
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r6
	ldrh r0, [r4, #0xa]
	strh r0, [r2]
	adds r3, #1
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _0810880E
_08108830:
	ldrh r3, [r4, #0x12]
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	bgt _0810885C
	ldr r6, _0810887C
	ldr r5, _08108880
_0810883E:
	asrs r3, r1, #0x10
	lsls r2, r3, #1
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r6
	ldrh r0, [r4, #0xc]
	strh r0, [r2]
	adds r3, #1
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	ble _0810883E
_0810885C:
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08108872
	bl ScanlineEffect_Stop
	adds r0, r7, #0
	bl DestroyTask
_08108872:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810887C: .4byte 0x020388C8
_08108880: .4byte 0x020397C8
	thumb_func_end sub_081085A8

	thumb_func_start sub_08108884
sub_08108884: @ 0x08108884
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #8
	ldr r3, _081088D8
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _081088DC
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	bl Random2
	movs r5, #0xff
	ands r5, r0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r6, r0, #0
	orrs r5, r6
	bl Random2
	ldr r1, _081088E0
	ands r1, r0
	adds r0, r1, #0
	cmp r0, #0xff
	ble _081088CA
	subs r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_081088CA:
	strh r5, [r4, #0x30]
	strh r1, [r4, #0x32]
	ldr r0, _081088E4
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081088D8: .4byte 0x000003FF
_081088DC: .4byte 0xFFFFFC00
_081088E0: .4byte 0x000001FF
_081088E4: .4byte 0x081088E9
	thumb_func_end sub_08108884

	thumb_func_start sub_081088E8
sub_081088E8: @ 0x081088E8
	push {r4, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x34]
	adds r3, r0, r1
	strh r3, [r2, #0x34]
	ldrh r1, [r2, #0x32]
	ldrh r4, [r2, #0x36]
	adds r1, r1, r4
	strh r1, [r2, #0x36]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0810890C
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	b _08108910
_0810890C:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
_08108910:
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r2, #0x26]
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bne _0810892E
	adds r0, r2, #0
	bl DestroyAnimSprite
_0810892E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081088E8

	thumb_func_start sub_08108934
sub_08108934: @ 0x08108934
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08108984
	adds r4, r4, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldr r2, _08108988
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x22]
	strh r0, [r4, #0x12]
	bl sub_08108BD4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	ldr r0, _0810898C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08108984: .4byte 0x03005B60
_08108988: .4byte 0x020205AC
_0810898C: .4byte 0x08108991
	thumb_func_end sub_08108934

	thumb_func_start sub_08108990
sub_08108990: @ 0x08108990
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081089B8
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #7
	bls _081089AC
	b _08108BCA
_081089AC:
	lsls r0, r0, #2
	ldr r1, _081089BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081089B8: .4byte 0x03005B60
_081089BC: .4byte 0x081089C0
_081089C0: @ jump table
	.4byte _081089E0 @ case 0
	.4byte _08108A06 @ case 1
	.4byte _08108A98 @ case 2
	.4byte _08108ACE @ case 3
	.4byte _08108AE2 @ case 4
	.4byte _08108AF0 @ case 5
	.4byte _08108B70 @ case 6
	.4byte _08108BBC @ case 7
_081089E0:
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #1
	movs r0, #0xe0
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r2, r3, #0
	bl sub_080A7924
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08108A06:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08108A62
	movs r0, #0
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08108A50
	ldr r2, _08108A4C
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strh r1, [r0, #0x24]
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	adds r1, #1
	strh r1, [r0, #0x22]
	b _08108A62
	.align 2, 0
_08108A4C: .4byte 0x020205AC
_08108A50:
	ldr r2, _08108A90
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _08108A94
	strh r1, [r0, #0x24]
_08108A62:
	adds r0, r4, #0
	bl sub_080A7990
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _08108A72
	b _08108BCA
_08108A72:
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromYScale
	ldr r2, _08108A90
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r5, [r0, #0x24]
	strh r5, [r4, #0xe]
	b _08108BAC
	.align 2, 0
_08108A90: .4byte 0x020205AC
_08108A94: .4byte 0x0000FFFD
_08108A98:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bgt _08108AA8
	b _08108BCA
_08108AA8:
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0xe0
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0xe0
	bl sub_080A7924
	movs r0, #0
	strh r0, [r4, #0xe]
	b _08108BAE
_08108ACE:
	adds r0, r4, #0
	bl sub_080A7990
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08108BCA
	strh r0, [r4, #0xe]
	strh r0, [r4, #0x10]
	b _08108BAE
_08108AE2:
	adds r0, r4, #0
	adds r1, r2, #0
	bl sub_08108C58
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08108AF0:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08108BCA
	movs r0, #0
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08108B28
	ldr r2, _08108B24
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	adds r1, #2
	b _08108B3A
	.align 2, 0
_08108B24: .4byte 0x020205AC
_08108B28:
	ldr r2, _08108B6C
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	subs r1, #2
_08108B3A:
	strh r1, [r0, #0x26]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bne _08108BCA
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r3, #0xe0
	bl sub_080A7924
	movs r0, #0
	strh r0, [r4, #0xe]
	strh r0, [r4, #0x10]
	b _08108BAE
	.align 2, 0
_08108B6C: .4byte 0x020205AC
_08108B70:
	ldr r6, _08108BB8
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r0, #0x22]
	subs r1, #1
	strh r1, [r0, #0x22]
	adds r0, r4, #0
	bl sub_080A7990
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08108BCA
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ResetSpriteRotScale
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x22]
_08108BAC:
	strh r5, [r4, #0x10]
_08108BAE:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08108BCA
	.align 2, 0
_08108BB8: .4byte 0x020205AC
_08108BBC:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08108BCA
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08108BCA:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08108990

	thumb_func_start sub_08108BD4
sub_08108BD4: @ 0x08108BD4
	push {r4, r5, lr}
	ldr r4, _08108BF8
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08108C08
	ldr r1, _08108BFC
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08108C00
	b _08108C18
	.align 2, 0
_08108BF8: .4byte 0x020380D6
_08108BFC: .4byte 0x02023D12
_08108C00: .4byte 0x02024190
_08108C04:
	adds r0, r2, #0
	b _08108C4A
_08108C08:
	ldr r1, _08108C50
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08108C54
_08108C18:
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x3a
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsrs r4, r4, #0x12
	movs r2, #0
_08108C36:
	adds r1, r2, #1
	adds r0, r4, #0
	muls r0, r1, r0
	cmp r3, r0
	blt _08108C04
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _08108C36
	movs r0, #3
_08108C4A:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08108C50: .4byte 0x02023D12
_08108C54: .4byte 0x020243E8
	thumb_func_end sub_08108BD4

	thumb_func_start sub_08108C58
sub_08108C58: @ 0x08108C58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	ldr r4, _08108D60
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0xac
	ldrb r0, [r4]
	bl GetBattlerSpriteSubpriority
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldrh r1, [r7, #0xa]
	movs r0, #4
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bgt _08108CA8
	movs r1, #1
_08108CA8:
	movs r0, #0
	str r0, [sp, #4]
	lsls r0, r1, #0x10
	mov sl, r8
	mov sb, r6
	mov r1, sl
	lsls r1, r1, #4
	str r1, [sp, #0xc]
	mov r1, sb
	lsls r1, r1, #4
	str r1, [sp, #0x10]
	asrs r0, r0, #0x10
	mov r8, r0
_08108CC2:
	ldr r0, _08108D64
	mov r1, sl
	mov r2, sb
	ldr r3, [sp, #8]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r6, r5, #0x10
	cmp r2, #0x40
	beq _08108D2A
	ldr r1, _08108D68
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r5, #0x30]
	mov r1, sp
	ldrh r1, [r1, #0xc]
	strh r1, [r5, #0x32]
	mov r0, sp
	ldrh r0, [r0, #0x10]
	strh r0, [r5, #0x34]
	asrs r4, r6, #0x10
	adds r0, r4, #0
	movs r1, #0x40
	bl Cos
	strh r0, [r5, #0x36]
	adds r0, r4, #0
	movs r1, #0x40
	bl Sin
	strh r0, [r5, #0x38]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r5, #0x3a]
	movs r0, #2
	strh r0, [r5, #0x3c]
	ldrh r1, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08108D24
	adds r0, r5, #0
	bl sub_08108D6C
_08108D24:
	ldrh r0, [r7, #0xc]
	adds r0, #1
	strh r0, [r7, #0xc]
_08108D2A:
	mov r1, r8
	lsls r0, r1, #1
	asrs r1, r6, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r5, r0, #0x10
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	str r1, [sp, #4]
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _08108CC2
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108D60: .4byte 0x020380D6
_08108D64: .4byte 0x08570E4C
_08108D68: .4byte 0x020205AC
	thumb_func_end sub_08108C58

	thumb_func_start sub_08108D6C
sub_08108D6C: @ 0x08108D6C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08108D7E
	cmp r0, #1
	beq _08108DB4
	b _08108E0E
_08108D7E:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	ldrh r0, [r4, #0x36]
	adds r1, r1, r0
	strh r1, [r4, #0x36]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	ldrh r2, [r4, #0x38]
	adds r1, r1, r2
	strh r1, [r4, #0x38]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_08108DB4:
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x38]
	ldrh r2, [r4, #0x34]
	adds r1, r1, r2
	strh r1, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r4, #0x20]
	lsls r1, r1, #0x10
	asrs r2, r1, #0x14
	strh r2, [r4, #0x22]
	adds r0, #8
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08108DEA
	adds r1, r2, #0
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08108DEA
	cmp r1, #0x78
	ble _08108E0E
_08108DEA:
	ldr r3, _08108E14
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
_08108E0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08108E14: .4byte 0x03005B60
	thumb_func_end sub_08108D6C

	thumb_func_start sub_08108E18
sub_08108E18: @ 0x08108E18
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08108E48
	adds r4, r1, r0
	bl sub_08108BD4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xa]
	ldr r0, _08108E4C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08108E50
	movs r0, #0x88
	strh r0, [r4, #0x10]
	movs r0, #0x28
	b _08108E56
	.align 2, 0
_08108E48: .4byte 0x03005B60
_08108E4C: .4byte 0x020380D6
_08108E50:
	movs r0, #0x10
	strh r0, [r4, #0x10]
	movs r0, #0x50
_08108E56:
	strh r0, [r4, #0x14]
	movs r0, #0x62
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	adds r0, #0x31
	strh r0, [r4, #0x16]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #5
	strh r0, [r4, #0x20]
	ldr r0, _08108E78
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08108E78: .4byte 0x08108E7D
	thumb_func_end sub_08108E18

	thumb_func_start sub_08108E7C
sub_08108E7C: @ 0x08108E7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r7, _08108EA0
	adds r4, r0, r7
	movs r0, #8
	ldrsh r2, [r4, r0]
	cmp r2, #0
	beq _08108EA4
	cmp r2, #1
	beq _08108F54
	b _08108F62
	.align 2, 0
_08108EA0: .4byte 0x03005B60
_08108EA4:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08108EBA
	strh r2, [r4, #0xc]
	adds r0, r4, #0
	bl sub_08108F6C
_08108EBA:
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08108F34
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08108F34
	ldr r5, _08108F48
	movs r1, #1
	mov r8, r1
	mov r2, r8
	strh r2, [r5]
	strh r0, [r5, #2]
	movs r0, #0xc
	strh r0, [r5, #4]
	ldr r6, _08108F4C
	adds r0, r6, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08108F04
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	ldr r1, _08108F50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08108F04:
	movs r0, #3
	strh r0, [r5]
	adds r0, r6, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08108F30
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	ldr r1, _08108F50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08108F30:
	mov r0, r8
	strh r0, [r4, #0x22]
_08108F34:
	movs r2, #0x1e
	ldrsh r1, [r4, r2]
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _08108F62
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08108F62
	.align 2, 0
_08108F48: .4byte 0x020380BE
_08108F4C: .4byte 0x08115B2D
_08108F50: .4byte 0x0203809E
_08108F54:
	movs r2, #0x1a
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08108F62
	adds r0, r1, #0
	bl DestroyAnimVisualTask
_08108F62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08108E7C

	thumb_func_start sub_08108F6C
sub_08108F6C: @ 0x08108F6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r1, _08108FF8
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #3
	asrs r0, r0, #4
	ldrh r2, [r4, #0x14]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08108FFC
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _08108FC6
	ldr r3, _08109000
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x1c
	adds r1, r0, r1
	ldr r2, _08109004
	str r2, [r1]
	adds r0, r0, r3
	strh r5, [r0, #0x38]
	strh r6, [r0, #0x3a]
	movs r1, #9
	strh r1, [r0, #0x3c]
	ldrh r0, [r4, #0x1a]
	adds r0, #1
	strh r0, [r4, #0x1a]
_08108FC6:
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
	ldrh r0, [r4, #0x18]
	adds r0, #0x27
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x18]
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	ldr r0, _08109008
	muls r0, r1, r0
	ldr r1, _0810900C
	adds r0, r0, r1
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r4, #0x10]
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08108FF8: .4byte 0x082FA8CC
_08108FFC: .4byte 0x08570E4C
_08109000: .4byte 0x020205AC
_08109004: .4byte 0x08109011
_08109008: .4byte 0x41C64E6D
_0810900C: .4byte 0x00003039
	thumb_func_end sub_08108F6C

	thumb_func_start sub_08109010
sub_08109010: @ 0x08109010
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _081090A6
	ldrh r0, [r5, #0x22]
	adds r0, #8
	strh r0, [r5, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _081090A6
	ldr r2, _081090AC
	movs r3, #0x3a
	ldrsh r1, [r5, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0, #0x1c]
	ldr r0, _081090B0
	movs r2, #0x20
	ldrsh r1, [r5, r2]
	movs r3, #0x22
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x30]
	cmp r0, #0x40
	beq _081090A0
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _081090B4
	adds r0, r0, r4
	movs r1, #3
	bl StartSpriteAffineAnim
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #0x3a]
	movs r3, #0x30
	ldrsh r1, [r5, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r5, #0x3c]
	strh r1, [r0, #0x3c]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _081090B8
	str r1, [r0]
_081090A0:
	adds r0, r5, #0
	bl DestroySprite
_081090A6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081090AC: .4byte 0x03005B60
_081090B0: .4byte 0x08572F6C
_081090B4: .4byte 0x020205AC
_081090B8: .4byte 0x081090BD
	thumb_func_end sub_08109010

	thumb_func_start sub_081090BC
sub_081090BC: @ 0x081090BC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08109128
	movs r0, #0
	strh r0, [r4, #0x30]
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
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _08109128
	ldr r3, _08109130
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
_08109128:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109130: .4byte 0x03005B60
	thumb_func_end sub_081090BC

	thumb_func_start sub_08109134
sub_08109134: @ 0x08109134
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081091B8
	adds r5, r1, r0
	ldr r4, _081091BC
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	strh r0, [r5, #0xe]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x10]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
	cmp r0, #0
	bne _08109178
	movs r1, #1
_08109178:
	strh r1, [r5, #0x16]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810918C
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	rsbs r0, r0, #0
	strh r0, [r5, #0x16]
_0810918C:
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	lsls r0, r0, #3
	ldrh r1, [r5, #0xe]
	adds r0, r0, r1
	strh r0, [r5, #0x12]
	movs r2, #0x16
	ldrsh r1, [r5, r2]
	lsls r1, r1, #3
	ldrh r0, [r5, #0x10]
	subs r0, r0, r1
	strh r0, [r5, #0x14]
	ldr r0, _081091C0
	strh r0, [r5, #0x1a]
	strh r6, [r5, #0xa]
	strh r6, [r5, #8]
	ldr r0, _081091C4
	str r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081091B8: .4byte 0x03005B60
_081091BC: .4byte 0x020380D6
_081091C0: .4byte 0x0000FFE0
_081091C4: .4byte 0x081091C9
	thumb_func_end sub_08109134

	thumb_func_start sub_081091C8
sub_081091C8: @ 0x081091C8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081091EC
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bls _081091E2
	b _08109302
_081091E2:
	lsls r0, r0, #2
	ldr r1, _081091F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081091EC: .4byte 0x03005B60
_081091F0: .4byte 0x081091F4
_081091F4: @ jump table
	.4byte _08109210 @ case 0
	.4byte _08109220 @ case 1
	.4byte _0810923A @ case 2
	.4byte _0810927C @ case 3
	.4byte _0810929E @ case 4
	.4byte _081092CC @ case 5
	.4byte _081092F2 @ case 6
_08109210:
	adds r0, r4, #0
	bl sub_08109310
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08109308
	b _081092FA
_08109220:
	adds r0, r4, #0
	bl sub_08109310
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08109308
	movs r0, #0
	strh r0, [r4, #0xa]
	b _081092FA
_0810923A:
	adds r0, r4, #0
	bl sub_08109310
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r0, [r4, #0x12]
	adds r1, r1, r0
	movs r2, #0
	strh r1, [r4, #0x12]
	adds r1, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x88
	lsls r0, r0, #0x11
	cmp r1, r0
	bls _08109308
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08109278
	movs r0, #1
	strh r0, [r4, #0x22]
	movs r0, #6
	strh r0, [r4, #8]
	strh r2, [r4, #0xa]
	b _08109308
_08109278:
	strh r2, [r4, #0xa]
	b _081092FA
_0810927C:
	adds r0, r4, #0
	bl sub_08109310
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	ldrh r0, [r4, #0x14]
	subs r0, r0, r1
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _08109308
	b _081092FA
_0810929E:
	adds r0, r4, #0
	bl sub_08109310
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r0, [r4, #0x12]
	subs r0, r0, r1
	strh r0, [r4, #0x12]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _08109308
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0xa]
	b _081092FA
_081092CC:
	adds r0, r4, #0
	bl sub_08109310
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	ldrh r0, [r4, #0x14]
	subs r0, r0, r1
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _08109308
	movs r0, #2
	strh r0, [r4, #8]
	b _08109308
_081092F2:
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08109308
_081092FA:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08109308
_08109302:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08109308:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081091C8

	thumb_func_start sub_08109310
sub_08109310: @ 0x08109310
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0xc]
	adds r0, #1
	strh r0, [r6, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0810936A
	movs r0, #0
	strh r0, [r6, #0xc]
	ldr r0, _08109370
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	movs r3, #0x10
	ldrsh r2, [r6, r3]
	movs r3, #0xa
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0810936A
	ldr r5, _08109374
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	movs r1, #0x10
	strh r1, [r0, #0x2e]
	ldrh r1, [r6, #0x12]
	strh r1, [r0, #0x32]
	ldrh r1, [r6, #0x14]
	strh r1, [r0, #0x36]
	ldrh r1, [r6, #0x1a]
	strh r1, [r0, #0x38]
	bl InitAnimArcTranslation
	adds r5, #0x1c
	adds r4, r4, r5
	ldr r0, _08109378
	str r0, [r4]
	ldrh r0, [r6, #0x18]
	adds r0, #1
	strh r0, [r6, #0x18]
_0810936A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109370: .4byte 0x08570E4C
_08109374: .4byte 0x020205AC
_08109378: .4byte 0x0810937D
	thumb_func_end sub_08109310

	thumb_func_start sub_0810937C
sub_0810937C: @ 0x0810937C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081093D6
	ldrh r0, [r6, #0x24]
	ldrh r1, [r6, #0x20]
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	ldrh r0, [r6, #0x26]
	ldrh r1, [r6, #0x22]
	adds r0, r0, r1
	strh r0, [r6, #0x22]
	movs r0, #6
	strh r0, [r6, #0x2e]
	bl Random2
	movs r4, #0x1f
	adds r1, r4, #0
	ands r1, r0
	ldr r5, _081093DC
	adds r1, r1, r5
	ldrh r0, [r6, #0x20]
	adds r1, r1, r0
	strh r1, [r6, #0x32]
	bl Random2
	ands r4, r0
	adds r4, r4, r5
	ldrh r1, [r6, #0x22]
	adds r4, r4, r1
	strh r4, [r6, #0x36]
	bl Random2
	movs r1, #7
	ands r1, r0
	mvns r1, r1
	strh r1, [r6, #0x38]
	adds r0, r6, #0
	bl InitAnimArcTranslation
	ldr r0, _081093E0
	str r0, [r6, #0x1c]
_081093D6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081093DC: .4byte 0x0000FFF0
_081093E0: .4byte 0x081093E5
	thumb_func_end sub_0810937C

	thumb_func_start sub_081093E4
sub_081093E4: @ 0x081093E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08109420
	movs r4, #0
	ldr r6, _08109428
_081093F6:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r6
	ldr r1, [r2]
	ldr r0, _0810942C
	cmp r1, r0
	bne _08109416
	movs r0, #1
	strh r0, [r2, #0x1c]
	ldrh r0, [r2, #0x18]
	subs r0, #1
	strh r0, [r2, #0x18]
	adds r0, r5, #0
	bl DestroySprite
_08109416:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _081093F6
_08109420:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109428: .4byte 0x03005B60
_0810942C: .4byte 0x081091C9
	thumb_func_end sub_081093E4

	thumb_func_start sub_08109430
sub_08109430: @ 0x08109430
	ldr r2, _08109450
	ldrh r1, [r2]
	strh r1, [r0, #0x20]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x22]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0x2e]
	ldrh r1, [r2, #6]
	strh r1, [r0, #0x30]
	ldrh r1, [r2, #8]
	strh r1, [r0, #0x32]
	ldrh r1, [r2, #0xa]
	strh r1, [r0, #0x34]
	ldr r1, _08109454
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_08109450: .4byte 0x020380BE
_08109454: .4byte 0x08109459
	thumb_func_end sub_08109430

	thumb_func_start sub_08109458
sub_08109458: @ 0x08109458
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x2e]
	subs r0, r0, r1
	strh r0, [r4, #0x36]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl __divsi3
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	ldrh r2, [r4, #0x38]
	adds r0, r0, r2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x34]
	subs r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0810949C
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810949C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08109458

	thumb_func_start sub_081094A4
sub_081094A4: @ 0x081094A4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x34]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x32]
	ldrh r2, [r4, #0x36]
	adds r1, r1, r2
	strh r1, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	strh r0, [r4, #0x24]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x17
	strh r1, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081094DC
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
_081094DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081094A4

	thumb_func_start sub_081094E4
sub_081094E4: @ 0x081094E4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r5, _08109520
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x30]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldr r1, _08109524
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x34]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x36]
	ldr r0, _08109528
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08109520: .4byte 0x020380D7
_08109524: .4byte 0x020380BE
_08109528: .4byte 0x0810952D
	thumb_func_end sub_081094E4

	thumb_func_start sub_0810952C
sub_0810952C: @ 0x0810952C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	subs r6, r1, r0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	subs r5, r1, r0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	muls r0, r6, r0
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	muls r0, r5, r0
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08109584
	movs r0, #0
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_081095A4
_08109584:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08109596
	adds r0, r4, #0
	bl DestroyAnimSprite
_08109596:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810952C

	thumb_func_start sub_081095A4
sub_081095A4: @ 0x081095A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r1, #0
	adds r5, r2, #0
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x10
	str r1, [sp]
	ldrh r1, [r0, #0x24]
	ldrh r3, [r0, #0x20]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r1, [r0, #0x26]
	ldrh r0, [r0, #0x22]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r0, r5, r0
	subs r0, #5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	bl Random2
	rsbs r4, r4, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r4, r4, r0
	subs r4, #5
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	movs r6, #0
	mov r0, r8
	lsls r0, r0, #0x10
	mov r8, r0
	mov r1, sl
	lsls r1, r1, #0x10
	str r1, [sp, #0xc]
	ldr r2, [sp]
	lsls r2, r2, #0x10
	str r2, [sp, #0x10]
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	str r0, [sp, #0x14]
	rsbs r3, r5, #0
	str r3, [sp, #4]
	asrs r0, r2, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	mov sl, r1
_08109632:
	ldr r0, _08109674
	mov r2, r8
	asrs r1, r2, #0x10
	mov r3, sl
	asrs r2, r3, #0x10
	movs r3, #0x82
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08109678
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r1
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	mov r0, sb
	strh r0, [r4, #0x30]
	ldr r0, _0810967C
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	subs r0, #1
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	cmp r5, #0
	bge _08109680
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r4, #0x32]
	b _08109682
	.align 2, 0
_08109674: .4byte 0x08570EF4
_08109678: .4byte 0x020205AC
_0810967C: .4byte 0x020380D6
_08109680:
	strh r7, [r4, #0x32]
_08109682:
	lsls r0, r6, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r6, r0, #0x10
	cmp r0, #0
	ble _08109632
	movs r6, #0
	ldr r3, [sp, #0xc]
	asrs r1, r3, #0x10
	ldr r0, [sp, #0x14]
	asrs r5, r0, #0x10
	rsbs r2, r5, #0
	str r2, [sp, #8]
	ldr r3, [sp, #0x10]
	asrs r0, r3, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	mov sl, r1
_081096A8:
	ldr r0, _081096EC
	mov r2, r8
	asrs r1, r2, #0x10
	mov r3, sl
	asrs r2, r3, #0x10
	movs r3, #0x82
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _081096F0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r1
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	mov r0, sb
	strh r0, [r4, #0x30]
	ldr r0, _081096F4
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	subs r0, #1
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	cmp r5, #0
	ble _081096F8
	mov r1, sp
	ldrh r1, [r1, #8]
	strh r1, [r4, #0x32]
	b _081096FA
	.align 2, 0
_081096EC: .4byte 0x08570EF4
_081096F0: .4byte 0x020205AC
_081096F4: .4byte 0x020380D6
_081096F8:
	strh r7, [r4, #0x32]
_081096FA:
	lsls r0, r6, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r6, r0, #0x10
	cmp r0, #0
	ble _081096A8
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081095A4

