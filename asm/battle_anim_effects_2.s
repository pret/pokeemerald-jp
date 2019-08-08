.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08103C98
sub_08103C98: @ 0x08103C98
	push {r4, r5, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r5, _08103CDC
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	bl SetAnimSpriteInitialXOffset
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x30]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x32]
	ldrh r0, [r5, #0xa]
	strh r0, [r4, #0x34]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x36]
	ldr r1, _08103CE0
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r1, _08103CE4
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103CDC: .4byte 0x020380BE
_08103CE0: .4byte 0x080A6015
_08103CE4: .4byte 0x080A5D19
	thumb_func_end sub_08103C98

	thumb_func_start sub_08103CE8
sub_08103CE8: @ 0x08103CE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08103CFC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08103D04
	ldr r0, _08103D00
	b _08103D06
	.align 2, 0
_08103CFC: .4byte 0x020380BE
_08103D00: .4byte 0x020380D6
_08103D04:
	ldr r0, _08103D20
_08103D06:
	ldrb r0, [r0]
	adds r1, r4, #0
	bl sub_0810395C
	movs r0, #0
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
	ldr r0, _08103D24
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103D20: .4byte 0x020380D7
_08103D24: .4byte 0x08103D29
	thumb_func_end sub_08103CE8

	thumb_func_start sub_08103D28
sub_08103D28: @ 0x08103D28
	push {lr}
	adds r1, r0, #0
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #1
	beq _08103D5A
	cmp r0, #1
	bgt _08103D3E
	cmp r0, #0
	beq _08103D44
	b _08103D88
_08103D3E:
	cmp r0, #2
	beq _08103D74
	b _08103D88
_08103D44:
	ldrh r0, [r1, #0x26]
	subs r0, #3
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _08103D88
	b _08103D6C
_08103D5A:
	ldrh r0, [r1, #0x26]
	adds r0, #3
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #0x30]
	subs r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08103D88
_08103D6C:
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	b _08103D88
_08103D74:
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bne _08103D88
	adds r0, r1, #0
	bl DestroyAnimSprite
_08103D88:
	pop {r0}
	bx r0
	thumb_func_end sub_08103D28

	thumb_func_start sub_08103D8C
sub_08103D8C: @ 0x08103D8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _08103DD8
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r4, #0x30]
	ldrh r2, [r0, #0x24]
	adds r1, r1, r2
	strh r1, [r0, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0x30]
	movs r0, #0x2e
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _08103DCA
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x24]
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_08103DCA:
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103DD8: .4byte 0x020205AC
	thumb_func_end sub_08103D8C

	thumb_func_start sub_08103DDC
sub_08103DDC: @ 0x08103DDC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08103E24
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
	ldr r1, _08103E28
	ldr r0, _08103E2C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r6, [r0]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08103E34
	ldr r0, _08103E30
	ldrh r1, [r5, #0x20]
	ldrh r2, [r0]
	subs r1, r1, r2
	strh r1, [r5, #0x20]
	adds r1, r0, #0
	b _08103E3E
	.align 2, 0
_08103E24: .4byte 0x020380D6
_08103E28: .4byte 0x02023E88
_08103E2C: .4byte 0x020380D7
_08103E30: .4byte 0x020380BE
_08103E34:
	ldr r1, _08103E68
	ldrh r0, [r1]
	ldrh r2, [r5, #0x20]
	adds r0, r0, r2
	strh r0, [r5, #0x20]
_08103E3E:
	ldrh r0, [r1, #2]
	ldrh r2, [r5, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	ldrh r0, [r1, #4]
	strh r0, [r5, #0x2e]
	ldrh r0, [r1, #6]
	strh r0, [r5, #0x30]
	strh r6, [r5, #0x32]
	ldr r0, _08103E6C
	str r0, [r5, #0x1c]
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08103E68: .4byte 0x020380BE
_08103E6C: .4byte 0x08103D8D
	thumb_func_end sub_08103DDC

	thumb_func_start sub_08103E70
sub_08103E70: @ 0x08103E70
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r1, _08103E9C
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x38]
	ldr r0, _08103EA0
	str r0, [r4, #0x1c]
	ldr r1, _08103EA4
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103E9C: .4byte 0x020380BE
_08103EA0: .4byte 0x080A5D79
_08103EA4: .4byte 0x08103EA9
	thumb_func_end sub_08103E70

	thumb_func_start sub_08103EA8
sub_08103EA8: @ 0x08103EA8
	push {lr}
	ldrh r1, [r0, #0x30]
	strh r1, [r0, #0x2e]
	ldrh r1, [r0, #0x20]
	strh r1, [r0, #0x32]
	ldrh r1, [r0, #0x22]
	adds r1, #0xf
	strh r1, [r0, #0x36]
	ldr r1, _08103EC8
	str r1, [r0, #0x1c]
	ldr r1, _08103ECC
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_08103EC8: .4byte 0x080A67B5
_08103ECC: .4byte 0x08103ED1
	thumb_func_end sub_08103EA8

	thumb_func_start sub_08103ED0
sub_08103ED0: @ 0x08103ED0
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1, #0x38]
	movs r3, #0x38
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08103EE6
	adds r0, r1, #0
	bl DestroyAnimSprite
	b _08103EEA
_08103EE6:
	subs r0, r2, #1
	strh r0, [r1, #0x38]
_08103EEA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08103ED0

	thumb_func_start AnimTask_Withdraw
AnimTask_Withdraw: @ 0x08103EF0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08103F1C
	ldr r0, _08103F20
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	ldr r1, _08103F24
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08103F28
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103F1C: .4byte 0x02023E88
_08103F20: .4byte 0x020380D6
_08103F24: .4byte 0x03005B60
_08103F28: .4byte 0x08103F2D
	thumb_func_end AnimTask_Withdraw

	thumb_func_start AnimTask_WithdrawStep
AnimTask_WithdrawStep: @ 0x08103F2C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08103F5C
	ldr r0, _08103F60
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r4, [r1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08103F68
	ldr r1, _08103F64
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r6, r2, #0
	b _08103F76
	.align 2, 0
_08103F5C: .4byte 0x02023E88
_08103F60: .4byte 0x020380D6
_08103F64: .4byte 0x03005B60
_08103F68:
	ldr r2, _08103FA8
	lsls r1, r5, #2
	adds r0, r1, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r3, [r0, #8]
	adds r6, r1, #0
_08103F76:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldr r1, _08103FA8
	adds r0, r6, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08103FB0
	ldrh r0, [r1, #8]
	adds r0, #0xb0
	strh r0, [r1, #8]
	ldr r1, _08103FAC
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	adds r1, #1
	b _08103FDA
	.align 2, 0
_08103FA8: .4byte 0x03005B60
_08103FAC: .4byte 0x020205AC
_08103FB0:
	cmp r0, #1
	bne _08103FC6
	ldrh r0, [r1, #0xe]
	adds r0, #1
	strh r0, [r1, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _08104020
	movs r0, #2
	b _0810401E
_08103FC6:
	ldrh r0, [r1, #8]
	subs r0, #0xb0
	strh r0, [r1, #8]
	ldr r1, _08104014
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	subs r1, #1
_08103FDA:
	strh r1, [r0, #0x26]
	adds r0, r4, #0
	bl SetBattlerSpriteYOffsetFromRotation
	ldr r0, _08104018
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r3, #8
	ldrsh r2, [r1, r3]
	movs r0, #0xf2
	lsls r0, r0, #4
	cmp r2, r0
	beq _08103FFA
	cmp r2, #0
	bne _08104020
_08103FFA:
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #2
	bne _0810401C
	adds r0, r4, #0
	bl ResetSpriteRotScale
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _08104020
	.align 2, 0
_08104014: .4byte 0x020205AC
_08104018: .4byte 0x03005B60
_0810401C:
	adds r0, r2, #1
_0810401E:
	strh r0, [r1, #0xa]
_08104020:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_WithdrawStep

	thumb_func_start Anim_KinesisZapEnergy
Anim_KinesisZapEnergy: @ 0x08104028
	push {r4, r5, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r0, _0810404C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08104054
	ldr r0, _08104050
	ldrh r1, [r4, #0x20]
	ldrh r2, [r0]
	subs r1, r1, r2
	strh r1, [r4, #0x20]
	adds r5, r0, #0
	b _08104060
	.align 2, 0
_0810404C: .4byte 0x020380D6
_08104050: .4byte 0x020380BE
_08104054:
	ldr r1, _08104094
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	adds r5, r1, #0
_08104060:
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, _08104098
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810409C
	adds r3, r4, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	movs r1, #1
	adds r2, r0, #0
	orrs r2, r1
	strb r2, [r3]
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _081040B0
	movs r0, #2
	orrs r2, r0
	strb r2, [r3]
	b _081040B0
	.align 2, 0
_08104094: .4byte 0x020380BE
_08104098: .4byte 0x020380D6
_0810409C:
	movs r2, #4
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _081040B0
	adds r2, r4, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
_081040B0:
	ldr r0, _081040C4
	str r0, [r4, #0x1c]
	ldr r1, _081040C8
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081040C4: .4byte 0x080A60A1
_081040C8: .4byte 0x080A34C5
	thumb_func_end Anim_KinesisZapEnergy

	thumb_func_start Anim_SwordsDanceBlade
Anim_SwordsDanceBlade: @ 0x081040CC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldr r0, _081040E8
	str r0, [r4, #0x1c]
	ldr r1, _081040EC
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081040E8: .4byte 0x080A6085
_081040EC: .4byte 0x081040F1
	thumb_func_end Anim_SwordsDanceBlade

	thumb_func_start Anim_SwordsDanceBladeStep
Anim_SwordsDanceBladeStep: @ 0x081040F0
	push {lr}
	movs r1, #6
	strh r1, [r0, #0x2e]
	ldrh r1, [r0, #0x20]
	strh r1, [r0, #0x32]
	ldrh r1, [r0, #0x22]
	subs r1, #0x20
	strh r1, [r0, #0x36]
	ldr r1, _08104110
	str r1, [r0, #0x1c]
	ldr r1, _08104114
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_08104110: .4byte 0x080A67B5
_08104114: .4byte 0x080A34C5
	thumb_func_end Anim_SwordsDanceBladeStep

	thumb_func_start AnimSonicBoomProjectile
AnimSonicBoomProjectile: @ 0x08104118
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810413C
	ldr r1, _08104138
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
	b _0810415E
	.align 2, 0
_08104138: .4byte 0x020380BE
_0810413C:
	ldr r0, _08104204
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810415E
	ldr r1, _08104208
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	strh r0, [r1, #6]
_0810415E:
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r4, _0810420C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r6, _08104208
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #4]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r2, [r6, #6]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r0, #0
	ldrh r1, [r5, #0x20]
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x22]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2Neg
	lsls r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081041D0
	ldr r2, _08104210
	adds r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_081041D0:
	movs r3, #0x80
	lsls r3, r3, #1
	str r4, [sp]
	adds r0, r5, #0
	movs r1, #0
	adds r2, r3, #0
	bl TrySetSpriteRotScale
	ldrh r0, [r6, #8]
	strh r0, [r5, #0x2e]
	mov r0, r8
	strh r0, [r5, #0x32]
	strh r7, [r5, #0x36]
	ldr r0, _08104214
	str r0, [r5, #0x1c]
	ldr r1, _08104218
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104204: .4byte 0x020380D6
_08104208: .4byte 0x020380BE
_0810420C: .4byte 0x020380D7
_08104210: .4byte 0xFFFFA000
_08104214: .4byte 0x080A67B5
_08104218: .4byte 0x080A34C5
	thumb_func_end AnimSonicBoomProjectile

	thumb_func_start sub_0810421C
sub_0810421C: @ 0x0810421C
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2e]
	subs r1, r0, #1
	strh r1, [r3, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08104246
	ldr r2, _0810424C
	movs r0, #0x3c
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #0xa]
	subs r1, #1
	strh r1, [r0, #0xa]
	adds r0, r3, #0
	bl DestroySprite
_08104246:
	pop {r0}
	bx r0
	.align 2, 0
_0810424C: .4byte 0x03005B60
	thumb_func_end sub_0810421C

	thumb_func_start sub_08104250
sub_08104250: @ 0x08104250
	push {r4, lr}
	adds r2, r0, #0
	movs r0, #0x3c
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08104280
	adds r4, r0, r1
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _08104284
	ldrh r0, [r2, #0x34]
	ldrh r1, [r2, #0x38]
	adds r0, r0, r1
	strh r0, [r2, #0x38]
	ldrh r0, [r2, #0x36]
	ldrh r3, [r2, #0x3a]
	adds r0, r0, r3
	b _08104292
	.align 2, 0
_08104280: .4byte 0x03005B60
_08104284:
	ldrh r0, [r2, #0x38]
	ldrh r1, [r2, #0x34]
	subs r0, r0, r1
	strh r0, [r2, #0x38]
	ldrh r0, [r2, #0x3a]
	ldrh r1, [r2, #0x36]
	subs r0, r0, r1
_08104292:
	strh r0, [r2, #0x3a]
	ldrh r0, [r2, #0x38]
	ldrh r1, [r2, #0x30]
	adds r3, r0, r1
	strh r3, [r2, #0x30]
	ldrh r0, [r2, #0x3a]
	ldrh r1, [r2, #0x32]
	adds r0, r0, r1
	strh r0, [r2, #0x32]
	ldrh r1, [r4, #0x16]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081042B6
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	b _081042BA
_081042B6:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x18
_081042BA:
	strh r0, [r2, #0x24]
	ldrh r1, [r4, #0x18]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081042CE
	ldrh r0, [r2, #0x32]
	lsrs r0, r0, #8
	rsbs r0, r0, #0
	b _081042D2
_081042CE:
	ldrh r0, [r2, #0x32]
	lsrs r0, r0, #8
_081042D2:
	strh r0, [r2, #0x26]
	ldrh r0, [r2, #0x2e]
	subs r1, r0, #1
	strh r1, [r2, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _081042E8
	movs r0, #0x1e
	strh r0, [r2, #0x2e]
	ldr r0, _081042F0
	str r0, [r2, #0x1c]
_081042E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081042F0: .4byte 0x0810421D
	thumb_func_end sub_08104250

	thumb_func_start sub_081042F4
sub_081042F4: @ 0x081042F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x3c
	ldrsh r1, [r7, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08104338
	adds r6, r0, r1
	ldrh r2, [r6, #0x16]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	ldrh r3, [r7, #0x30]
	adds r2, r0, r3
	strh r2, [r7, #0x30]
	ldrh r0, [r6, #0x18]
	ands r1, r0
	ldrh r0, [r7, #0x32]
	adds r1, r1, r0
	strh r1, [r7, #0x32]
	ldrh r1, [r6, #0x16]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0810433C
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	b _08104340
	.align 2, 0
_08104338: .4byte 0x03005B60
_0810433C:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x18
_08104340:
	strh r0, [r7, #0x24]
	ldrh r1, [r6, #0x18]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08104354
	ldrh r0, [r7, #0x32]
	lsrs r0, r0, #8
	rsbs r0, r0, #0
	b _08104358
_08104354:
	ldrh r0, [r7, #0x32]
	lsrs r0, r0, #8
_08104358:
	strh r0, [r7, #0x26]
	ldrh r0, [r7, #0x2e]
	subs r1, r0, #1
	strh r1, [r7, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08104424
	movs r4, #0
	movs r0, #8
	strh r0, [r7, #0x2e]
	movs r0, #4
	strh r0, [r6, #0x12]
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_08151600
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r7, #0x24]
	ldrh r1, [r7, #0x20]
	adds r2, r0, r1
	strh r2, [r7, #0x20]
	ldrh r0, [r7, #0x26]
	ldrh r3, [r7, #0x22]
	adds r0, r0, r3
	strh r0, [r7, #0x22]
	strh r4, [r7, #0x26]
	strh r4, [r7, #0x24]
	ldrh r3, [r6, #0x1e]
	movs r0, #0x1e
	ldrsh r1, [r6, r0]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	blt _081043A2
	subs r0, r3, r2
	b _081043A4
_081043A2:
	subs r0, r2, r3
_081043A4:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x10
	ldrh r3, [r6, #0x20]
	movs r0, #0x20
	ldrsh r1, [r6, r0]
	ldrh r2, [r7, #0x22]
	movs r6, #0x22
	ldrsh r0, [r7, r6]
	cmp r1, r0
	blt _081043BC
	subs r0, r3, r2
	b _081043BE
_081043BC:
	subs r0, r2, r3
_081043BE:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	strh r0, [r7, #0x32]
	strh r0, [r7, #0x30]
	strh r0, [r7, #0x3a]
	strh r0, [r7, #0x38]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r5, #0
	bl sub_08151510
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r6, #0xe0
	lsls r6, r6, #1
	adds r0, r6, #0
	bl sub_08151600
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08151510
	strh r0, [r7, #0x34]
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	bl sub_08151510
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	bl sub_08151600
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08151510
	strh r0, [r7, #0x36]
	ldr r0, _08104430
	str r0, [r7, #0x1c]
_08104424:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104430: .4byte 0x08104251
	thumb_func_end sub_081042F4

	thumb_func_start sub_08104434
sub_08104434: @ 0x08104434
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08104458
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08104452
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08104452:
	pop {r0}
	bx r0
	.align 2, 0
_08104458: .4byte 0x03005B60
	thumb_func_end sub_08104434

	thumb_func_start sub_0810445C
sub_0810445C: @ 0x0810445C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _081044B0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #8]
	subs r1, r0, #1
	strh r1, [r5, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08104530
	ldr r0, _081044B4
	movs r2, #0x1a
	ldrsh r1, [r5, r2]
	movs r3, #0x1c
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #0xc]
	ldrb r4, [r5, #0xa]
	subs r3, r3, r4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r0, r0, #4
	add r0, ip
	lsls r0, r0, #2
	ldr r1, _081044B8
	adds r6, r0, r1
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _081044BC
	cmp r0, #2
	beq _081044D2
	b _081044E0
	.align 2, 0
_081044B0: .4byte 0x03005B60
_081044B4: .4byte 0x0856EF94
_081044B8: .4byte 0x020205AC
_081044BC:
	ldrb r2, [r6, #3]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1b
	movs r0, #0x18
	orrs r1, r0
	lsls r1, r1, #1
	subs r0, #0x57
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #3]
	b _081044E0
_081044D2:
	ldrb r0, [r6, #3]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r6, #3]
_081044E0:
	ldr r3, _08104538
	lsls r2, r7, #2
	adds r2, r2, r7
	lsls r2, r2, #3
	adds r4, r2, r3
	ldrh r0, [r4, #0x12]
	ldrh r1, [r4, #0x14]
	subs r0, r0, r1
	strh r0, [r6, #0x2e]
	strh r7, [r6, #0x3c]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	adds r0, #0xd
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r3, #8
	adds r0, r0, r3
	mov r2, ip
	strh r2, [r0]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #8]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r0, #0x3f
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x9a
	bl PlaySE12WithPanning
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	cmp r0, #2
	ble _08104530
	ldr r0, _0810453C
	str r0, [r4]
_08104530:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104538: .4byte 0x03005B60
_0810453C: .4byte 0x08104435
	thumb_func_end sub_0810445C

	thumb_func_start sub_08104540
sub_08104540: @ 0x08104540
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0
	mov sb, r0
	movs r5, #0
	mov r0, sp
	mov r1, sb
	strh r1, [r0]
	mov r4, sp
	adds r4, #2
	strh r1, [r4]
	bl IsContest
	lsls r0, r0, #0x18
	mov sl, r4
	cmp r0, #0
	beq _081045AC
	ldr r1, _0810459C
	lsls r2, r7, #2
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0, #0x10]
	ldr r3, _081045A0
	ldrh r0, [r3]
	rsbs r0, r0, #0
	strh r0, [r3]
	ldrh r1, [r3, #4]
	movs r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _081045A4
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strh r0, [r3, #4]
	b _08104606
	.align 2, 0
_0810459C: .4byte 0x03005B60
_081045A0: .4byte 0x020380BE
_081045A4:
	movs r0, #1
	orrs r0, r1
	strh r0, [r3, #4]
	b _08104606
_081045AC:
	ldr r1, _081045F0
	ldr r0, _081045F4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	lsls r2, r7, #2
	mov r8, r2
	cmp r0, #0
	bne _08104606
	ldr r1, _081045F8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r3, [r0, #0x10]
	ldr r2, _081045FC
	ldrh r0, [r2]
	rsbs r0, r0, #0
	strh r0, [r2]
	ldrh r0, [r2, #2]
	rsbs r0, r0, #0
	strh r0, [r2, #2]
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08104600
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	b _08104604
	.align 2, 0
_081045F0: .4byte 0x02023D1A
_081045F4: .4byte 0x020380D7
_081045F8: .4byte 0x03005B60
_081045FC: .4byte 0x020380BE
_08104600:
	movs r0, #1
	orrs r0, r1
_08104604:
	strh r0, [r2, #4]
_08104606:
	ldr r5, _08104660
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoord
	ldr r1, _08104664
	mov r3, r8
	adds r4, r3, r7
	lsls r4, r4, #3
	adds r4, r4, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1a]
	adds r6, r0, #0
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1c]
	mov sb, r0
	ldr r0, _08104668
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08104670
	ldr r4, _0810466C
	ldrb r1, [r4]
	movs r0, #2
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08104670
	ldrb r0, [r4]
	movs r1, #0
	mov r2, sp
	mov r3, sl
	bl SetAverageBattlerPositions
	b _08104692
	.align 2, 0
_08104660: .4byte 0x020380D6
_08104664: .4byte 0x03005B60
_08104668: .4byte 0x02022C90
_0810466C: .4byte 0x020380D7
_08104670:
	mov r5, sp
	ldr r4, _081046CC
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sl
	strh r0, [r1]
_08104692:
	mov r4, sp
	ldr r0, _081046D0
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	mov r2, sp
	ldr r3, _081046D4
	ldrh r0, [r3]
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r1, #0x1e]
	strh r0, [r4]
	ldrh r0, [r3, #2]
	mov r3, sl
	ldrh r3, [r3]
	adds r0, r0, r3
	strh r0, [r1, #0x20]
	mov r1, sl
	strh r0, [r1]
	mov r0, sp
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r6, #0
	cmp r0, r1
	blt _081046D8
	subs r0, r2, r1
	b _081046DA
	.align 2, 0
_081046CC: .4byte 0x020380D7
_081046D0: .4byte 0x03005B60
_081046D4: .4byte 0x020380BE
_081046D8:
	subs r0, r1, r2
_081046DA:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	ldr r5, _08104750
	ldrh r1, [r5, #4]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_08151600
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08151510
	ldr r2, _08104754
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r6, r1, r2
	strh r0, [r6, #0x12]
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	movs r1, #0x80
	bl sub_08151510
	strh r0, [r6, #0x14]
	ldrh r0, [r5, #4]
	strh r0, [r6, #0x16]
	mov r2, sl
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	mov r4, sb
	cmp r0, r4
	blt _08104758
	subs r4, r1, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	bl sub_08151600
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08151510
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r0
	strh r1, [r6, #0x18]
	b _08104778
	.align 2, 0
_08104750: .4byte 0x020380BE
_08104754: .4byte 0x03005B60
_08104758:
	subs r4, r4, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	bl sub_08151600
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08151510
	movs r1, #1
	orrs r0, r1
	strh r0, [r6, #0x18]
_08104778:
	ldr r1, _081047B8
	mov r3, r8
	adds r0, r3, r7
	lsls r0, r0, #3
	adds r5, r0, r1
	ldr r4, _081047BC
	ldrh r0, [r4, #6]
	strh r0, [r5, #0xe]
	ldrh r1, [r4, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081047C8
	movs r0, #0x80
	eors r0, r1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _081047F0
	ldr r0, _081047C0
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081047C4
	adds r1, r2, #0
	ldrh r4, [r4, #8]
	adds r1, r1, r4
	adds r0, r0, r1
	b _08104800
	.align 2, 0
_081047B8: .4byte 0x03005B60
_081047BC: .4byte 0x020380BE
_081047C0: .4byte 0x020380D7
_081047C4: .4byte 0x0000FFC0
_081047C8:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _081047F0
	ldr r0, _081047E8
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _081047EC
	adds r1, r3, #0
	ldrh r4, [r4, #8]
	adds r1, r1, r4
	adds r0, r0, r1
	b _08104800
	.align 2, 0
_081047E8: .4byte 0x020380D7
_081047EC: .4byte 0x0000FFC0
_081047F0:
	ldr r0, _0810482C
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #8]
	subs r0, r0, r1
_08104800:
	strh r0, [r5, #0xc]
	ldr r0, _08104830
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #2
	bgt _08104818
	movs r0, #3
	strh r0, [r1, #0xc]
_08104818:
	ldr r0, _08104834
	str r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810482C: .4byte 0x020380D7
_08104830: .4byte 0x03005B60
_08104834: .4byte 0x0810445D
	thumb_func_end sub_08104540

	thumb_func_start sub_08104838
sub_08104838: @ 0x08104838
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldr r0, _08104860
	ldrh r0, [r0, #2]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r4, #0x2e]
	ldr r0, _08104864
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104860: .4byte 0x0856F084
_08104864: .4byte 0x08104869
	thumb_func_end sub_08104838

	thumb_func_start sub_08104868
sub_08104868: @ 0x08104868
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _081048CC
	movs r0, #0
	strh r0, [r4, #0x30]
	ldrh r5, [r4, #0x2e]
	ldr r1, _081048D4
	adds r0, r5, #0
	adds r0, #8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r7, [r0]
	adds r6, r1, #0
	adds r1, r5, #0
	adds r1, #9
	lsls r0, r5, #1
	adds r0, r0, r6
	adds r2, r0, #0
	adds r2, #0x10
	movs r3, #7
	lsls r1, r1, #1
	adds r1, r1, r6
_081048A0:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _081048A0
	adds r0, r5, #0
	adds r0, #0xf
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r7, [r0]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _081048CC
	adds r0, r4, #0
	bl DestroyAnimSprite
_081048CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081048D4: .4byte 0x020377B4
	thumb_func_end sub_08104868

	thumb_func_start sub_081048D8
sub_081048D8: @ 0x081048D8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r4, _08104978
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _0810497C
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #6]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _08104980
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810491C
	ldrh r0, [r4, #4]
	rsbs r0, r0, #0
	strh r0, [r4, #4]
_0810491C:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldrh r1, [r5, #0x20]
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x22]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2Neg
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	adds r2, r3, #0
	bl TrySetSpriteRotScale
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x2e]
	strh r6, [r5, #0x32]
	strh r7, [r5, #0x36]
	ldr r0, _08104984
	str r0, [r5, #0x1c]
	ldr r1, _08104988
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104978: .4byte 0x020380D7
_0810497C: .4byte 0x020380BE
_08104980: .4byte 0x020380D6
_08104984: .4byte 0x080A68C9
_08104988: .4byte 0x080A34C5
	thumb_func_end sub_081048D8

	thumb_func_start sub_0810498C
sub_0810498C: @ 0x0810498C
	ldr r1, _0810499C
	strh r1, [r0, #0x32]
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	ldr r1, _081049A0
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_0810499C: .4byte 0x0000FFF0
_081049A0: .4byte 0x081049A5
	thumb_func_end sub_0810498C

	thumb_func_start sub_081049A4
sub_081049A4: @ 0x081049A4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #0x80
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	ldr r0, _08104A10
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081049C8
	ldrh r0, [r4, #0x24]
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
_081049C8:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #5
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7e
	ble _08104A08
	movs r0, #0
	strh r0, [r4, #0x30]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08104A08
	adds r0, r4, #0
	bl DestroyAnimSprite
_08104A08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104A10: .4byte 0x020380D6
	thumb_func_end sub_081049A4

	thumb_func_start sub_08104A14
sub_08104A14: @ 0x08104A14
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	ldr r5, _08104A60
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x36]
	ldr r0, _08104A64
	str r0, [r4, #0x1c]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08104A68
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104A60: .4byte 0x020380D7
_08104A64: .4byte 0x080A67B5
_08104A68: .4byte 0x08104A6D
	thumb_func_end sub_08104A14

	thumb_func_start sub_08104A6C
sub_08104A6C: @ 0x08104A6C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xa6
	bl PlaySE12WithPanning
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
	movs r2, #0
	movs r1, #7
	adds r0, r4, #0
	adds r0, #0x3c
_08104AA0:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08104AA0
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #7
	ands r0, r1
	ldr r2, _08104AE8
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r4, #0x3a]
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa0
	bl __umodsi3
	adds r0, #0xa0
	strh r0, [r4, #0x3c]
	ldr r0, _08104AEC
	str r0, [r4, #0x1c]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104AE8: .4byte 0x0000FFF4
_08104AEC: .4byte 0x08104AF1
	thumb_func_end sub_08104A6C

	thumb_func_start sub_08104AF0
sub_08104AF0: @ 0x08104AF0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	ldrh r2, [r4, #0x2e]
	adds r0, r1, r2
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x18
	strh r2, [r4, #0x24]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08104B0E
	rsbs r0, r2, #0
	strh r0, [r4, #0x24]
_08104B0E:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #8
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7e
	ble _08104B4E
	movs r0, #0
	strh r0, [r4, #0x30]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08104B4E
	adds r0, r4, #0
	bl DestroyAnimSprite
_08104B4E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08104AF0

	thumb_func_start Anim_RazorWindTornado
Anim_RazorWindTornado: @ 0x08104B54
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldr r0, _08104BA4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08104B72
	ldrh r0, [r4, #0x22]
	adds r0, #0x10
	strh r0, [r4, #0x22]
_08104B72:
	ldr r1, _08104BA8
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #0xa]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #0xc]
	strh r0, [r4, #0x34]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x36]
	ldr r0, _08104BAC
	str r0, [r4, #0x1c]
	ldr r1, _08104BB0
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104BA4: .4byte 0x020380D6
_08104BA8: .4byte 0x020380BE
_08104BAC: .4byte 0x080A5BB5
_08104BB0: .4byte 0x080A34C5
	thumb_func_end Anim_RazorWindTornado

	thumb_func_start Anim_ViceGripPincer
Anim_ViceGripPincer: @ 0x08104BB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r7, #0x20
	ldr r4, _08104C30
	movs r0, #0x10
	mov r8, r0
	ldr r6, _08104C34
	ldr r0, _08104C38
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08104BE0
	adds r7, r4, #0
	movs r4, #0x20
	mov r8, r6
	movs r6, #0x10
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
_08104BE0:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	movs r0, #6
	strh r0, [r5, #0x2e]
	ldr r4, _08104C3C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r0, r8
	strh r0, [r5, #0x32]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r6
	strh r0, [r5, #0x36]
	ldr r0, _08104C40
	str r0, [r5, #0x1c]
	ldr r1, _08104C44
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104C30: .4byte 0x0000FFE0
_08104C34: .4byte 0x0000FFF0
_08104C38: .4byte 0x020380BE
_08104C3C: .4byte 0x020380D7
_08104C40: .4byte 0x080A67B5
_08104C44: .4byte 0x08104C49
	thumb_func_end Anim_ViceGripPincer

	thumb_func_start Anim_ViceGripPincerStep
Anim_ViceGripPincerStep: @ 0x08104C48
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08104C5E
	adds r0, r2, #0
	bl DestroyAnimSprite
_08104C5E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Anim_ViceGripPincerStep

	thumb_func_start Anim_GuillotinePincer
Anim_GuillotinePincer: @ 0x08104C64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r0, #0x20
	mov r8, r0
	ldr r4, _08104CF8
	movs r2, #0x10
	mov sb, r2
	ldr r6, _08104CFC
	ldr r7, _08104D00
	ldrh r1, [r7]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	beq _08104C98
	mov r8, r4
	movs r4, #0x20
	mov sb, r6
	movs r6, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
_08104C98:
	mov r0, r8
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x20]
	adds r1, r1, r2
	strh r1, [r5, #0x20]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	movs r0, #6
	strh r0, [r5, #0x2e]
	strh r1, [r5, #0x30]
	ldr r4, _08104D04
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r0, sb
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r6
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl InitAnimLinearTranslation
	ldrh r0, [r7]
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x3a]
	ldr r0, _08104D08
	str r0, [r5, #0x1c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104CF8: .4byte 0x0000FFE0
_08104CFC: .4byte 0x0000FFF0
_08104D00: .4byte 0x020380BE
_08104D04: .4byte 0x020380D7
_08104D08: .4byte 0x08104D0D
	thumb_func_end Anim_GuillotinePincer

	thumb_func_start Anim_GuillotinePincerStep1
Anim_GuillotinePincerStep1: @ 0x08104D0C
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08104D70
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08104D70
	adds r0, r4, #0
	movs r1, #0
	bl SeekSpriteAnim
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	movs r2, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	movs r0, #2
	strh r0, [r4, #0x24]
	ldr r0, _08104D78
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3a]
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x32]
	eors r0, r1
	strh r0, [r4, #0x32]
	strh r2, [r4, #0x36]
	strh r2, [r4, #0x34]
	ldr r0, _08104D7C
	str r0, [r4, #0x1c]
_08104D70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104D78: .4byte 0x0000FFFE
_08104D7C: .4byte 0x08104D81
	thumb_func_end Anim_GuillotinePincerStep1

	thumb_func_start Anim_GuillotinePincerStep2
Anim_GuillotinePincerStep2: @ 0x08104D80
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08104D98
	ldrh r0, [r4, #0x24]
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
_08104D98:
	ldrh r0, [r4, #0x34]
	movs r1, #1
	eors r0, r1
	movs r1, #0
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	bne _08104DDA
	strh r1, [r4, #0x26]
	strh r1, [r4, #0x24]
	strh r1, [r4, #0x36]
	strh r1, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x38]
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r0, _08104DE0
	str r0, [r4, #0x1c]
_08104DDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104DE0: .4byte 0x08104DE5
	thumb_func_end Anim_GuillotinePincerStep2

	thumb_func_start Anim_GuillotinePincerStep3
Anim_GuillotinePincerStep3: @ 0x08104DE4
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08104DF8
	adds r0, r4, #0
	bl DestroyAnimSprite
_08104DF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Anim_GuillotinePincerStep3

	thumb_func_start AnimTask_GrowAndGreyscale
AnimTask_GrowAndGreyscale: @ 0x08104E00
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #1
	bl GetAnimBattlerSpriteId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #1
	bl PrepareBattlerSpriteForRotScale
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0xd0
	movs r3, #0
	bl SetSpriteRotScale
	ldr r1, _08104E58
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	adds r0, #0x10
	movs r1, #0
	bl SetGreyscaleOrOriginalPalette
	ldr r1, _08104E5C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x50
	strh r1, [r0, #8]
	ldr r1, _08104E60
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104E58: .4byte 0x020205AC
_08104E5C: .4byte 0x03005B60
_08104E60: .4byte 0x08104E65
	thumb_func_end AnimTask_GrowAndGreyscale

	thumb_func_start AnimTask_GrowAndGreyscaleStep
AnimTask_GrowAndGreyscaleStep: @ 0x08104E64
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08104EBC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	subs r1, #1
	strh r1, [r0, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08104EB4
	movs r0, #1
	bl GetAnimBattlerSpriteId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl ResetSpriteRotScale
	ldr r1, _08104EC0
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	adds r0, #0x10
	movs r1, #1
	bl SetGreyscaleOrOriginalPalette
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08104EB4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104EBC: .4byte 0x03005B60
_08104EC0: .4byte 0x020205AC
	thumb_func_end AnimTask_GrowAndGreyscaleStep

	thumb_func_start AnimTask_Minimize
AnimTask_Minimize: @ 0x08104EC4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08104F10
	adds r4, r4, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r4, #8]
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	strh r5, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0xe]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x10]
	strh r5, [r4, #0x12]
	strh r5, [r4, #0x14]
	ldr r0, _08104F14
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x16]
	ldr r0, _08104F18
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104F10: .4byte 0x03005B60
_08104F14: .4byte 0x020380D6
_08104F18: .4byte 0x08104F1D
	thumb_func_end AnimTask_Minimize

	thumb_func_start AnimTask_MinimizeStep1
AnimTask_MinimizeStep1: @ 0x08104F1C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08104F40
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bls _08104F36
	b _08105046
_08104F36:
	lsls r0, r0, #2
	ldr r1, _08104F44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08104F40: .4byte 0x03005B60
_08104F44: .4byte 0x08104F48
_08104F48: @ jump table
	.4byte _08104F60 @ case 0
	.4byte _08104FA8 @ case 1
	.4byte _08104FDE @ case 2
	.4byte _08104FE4 @ case 3
	.4byte _08104FF4 @ case 4
	.4byte _08105028 @ case 5
_08104F60:
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08104F70
	cmp r0, #3
	beq _08104F70
	cmp r0, #6
	bne _08104F78
_08104F70:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CreateMinimizeSprite
_08104F78:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x10]
	adds r0, #0x28
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #8]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrb r0, [r4, #8]
	bl SetBattlerSpriteYOffsetFromYScale
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0x20
	bne _08105046
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	b _08105020
_08104FA8:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08105046
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	cmp r1, #3
	bne _08104FBE
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xa]
	b _08105046
_08104FBE:
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r4, #0x10]
	ldrb r0, [r4, #8]
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrb r0, [r4, #8]
	bl SetBattlerSpriteYOffsetFromYScale
	movs r0, #2
	strh r0, [r4, #0xa]
	b _08105046
_08104FDE:
	movs r0, #0
	strh r0, [r4, #0xa]
	b _08105046
_08104FE4:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	ble _08105046
	b _0810501C
_08104FF4:
	ldrh r0, [r4, #0xc]
	adds r0, #2
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x10]
	subs r0, #0x50
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #8]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrb r0, [r4, #8]
	bl SetBattlerSpriteYOffsetFromYScale
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0x20
	bne _08105046
_0810501C:
	movs r0, #0
	strh r0, [r4, #0xc]
_08105020:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	b _08105046
_08105028:
	ldrb r0, [r4, #8]
	bl ResetSpriteRotScale
	ldr r2, _0810504C
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x26]
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08105046:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810504C: .4byte 0x020205AC
	thumb_func_end AnimTask_MinimizeStep1

	thumb_func_start CreateMinimizeSprite
CreateMinimizeSprite: @ 0x08105050
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r0, #0
	bl CloneBattlerSpriteWithBlend
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0810512A
	bl AllocOamMatrix
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xff
	bne _08105094
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _08105090
	adds r0, r0, r1
	bl obj_delete_but_dont_free_vram
	b _0810512A
	.align 2, 0
_08105090: .4byte 0x020205AC
_08105094:
	ldr r5, _08105138
	lsls r3, r4, #4
	adds r3, r3, r4
	lsls r3, r3, #2
	adds r4, r3, r5
	ldrb r1, [r4, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #1]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x1f
	ands r6, r0
	lsls r2, r6, #1
	ldrb r1, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #3]
	ldrb r0, [r7, #0x16]
	ldrb r1, [r7, #0xe]
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	ldrh r0, [r7, #0xe]
	adds r0, #1
	strh r0, [r7, #0xe]
	ldrh r0, [r7, #0x14]
	adds r0, #1
	strh r0, [r7, #0x14]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	mov r0, sb
	strh r0, [r4, #0x30]
	movs r0, #6
	strh r0, [r4, #0x32]
	adds r5, #0x1c
	adds r3, r3, r5
	ldr r0, _0810513C
	str r0, [r3]
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x10
	ldrsh r2, [r7, r1]
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrb r0, [r4, #1]
	movs r3, #4
	rsbs r3, r3, #0
	ands r3, r0
	movs r0, #1
	orrs r3, r0
	strb r3, [r4, #1]
	lsrs r1, r3, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r0, r4, #0
	bl CalcCenterToCornerVec
_0810512A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105138: .4byte 0x020205AC
_0810513C: .4byte 0x08105141
	thumb_func_end CreateMinimizeSprite

	thumb_func_start ClonedMinizeSprite_Step
ClonedMinizeSprite_Step: @ 0x08105140
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0810517E
	ldr r3, _08105184
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
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl obj_delete_but_dont_free_vram
_0810517E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105184: .4byte 0x03005B60
	thumb_func_end ClonedMinizeSprite_Step

	thumb_func_start AnimTask_Splash
AnimTask_Splash: @ 0x08105188
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081051AC
	adds r4, r0, r1
	ldr r5, _081051B0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _081051B4
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	b _081051DA
	.align 2, 0
_081051AC: .4byte 0x03005B60
_081051B0: .4byte 0x020380BE
_081051B4:
	ldrb r0, [r5]
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	strh r1, [r4, #8]
	strh r2, [r4, #0xa]
	ldrh r0, [r5, #2]
	strh r0, [r4, #0xc]
	strh r2, [r4, #0xe]
	strh r2, [r4, #0x10]
	ldr r2, _081051E0
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _081051E4
	str r0, [r4]
_081051DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081051E0: .4byte 0x0856F1CC
_081051E4: .4byte 0x081051E9
	thumb_func_end AnimTask_Splash

	thumb_func_start AnimTask_SplashStep
AnimTask_SplashStep: @ 0x081051E8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0810520C
	adds r4, r0, r1
	movs r0, #0xa
	ldrsh r5, [r4, r0]
	cmp r5, #1
	beq _08105250
	cmp r5, #1
	bgt _08105210
	cmp r5, #0
	beq _0810521A
	b _081052F8
	.align 2, 0
_0810520C: .4byte 0x03005B60
_08105210:
	cmp r5, #2
	beq _08105284
	cmp r5, #3
	beq _081052B4
	b _081052F8
_0810521A:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	ldrh r2, [r4, #0x10]
	adds r2, #3
	strh r2, [r4, #0x10]
	ldr r3, _0810524C
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x26]
	adds r1, r1, r2
	strh r1, [r0, #0x26]
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _081052F8
	strh r5, [r4, #0xe]
	b _081052AC
	.align 2, 0
_0810524C: .4byte 0x020205AC
_08105250:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	ldr r2, _08105280
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x10]
	ldrh r2, [r0, #0x26]
	adds r1, r1, r2
	strh r1, [r0, #0x26]
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _081052F8
	movs r0, #0
	strh r0, [r4, #0xe]
	b _081052AC
	.align 2, 0
_08105280: .4byte 0x020205AC
_08105284:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081052AC
	ldr r2, _081052A8
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	subs r1, #2
	strh r1, [r0, #0x26]
	ldrh r0, [r4, #0x10]
	subs r0, #2
	strh r0, [r4, #0x10]
	b _081052F8
	.align 2, 0
_081052A8: .4byte 0x020205AC
_081052AC:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	b _081052F8
_081052B4:
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _081052F8
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081052EC
	ldr r2, _081052E8
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r5, [r0, #0x26]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	b _081052F8
	.align 2, 0
_081052E8: .4byte 0x020205AC
_081052EC:
	ldrb r1, [r4, #8]
	ldr r2, _08105300
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	strh r5, [r4, #0xa]
_081052F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105300: .4byte 0x0856F1CC
	thumb_func_end AnimTask_SplashStep

	thumb_func_start sub_08105304
sub_08105304: @ 0x08105304
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08105334
	adds r4, r4, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08105338
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _0810533C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105334: .4byte 0x03005B60
_08105338: .4byte 0x0856F1EC
_0810533C: .4byte 0x08105341
	thumb_func_end sub_08105304

	thumb_func_start sub_08105340
sub_08105340: @ 0x08105340
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08105368
	adds r0, r0, r1
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08105360
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08105360:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105368: .4byte 0x03005B60
	thumb_func_end sub_08105340

	thumb_func_start Anim_BreathPuff
Anim_BreathPuff: @ 0x0810536C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0810539C
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081053A0
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x20
	strh r0, [r4, #0x20]
	movs r0, #0x40
	b _081053BA
	.align 2, 0
_0810539C: .4byte 0x020380D6
_081053A0:
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #0x20
	strh r0, [r4, #0x20]
	ldr r0, _081053EC
_081053BA:
	strh r0, [r4, #0x30]
	ldr r0, _081053F0
	ldrb r0, [r0]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	strh r0, [r4, #0x22]
	movs r0, #0x34
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x32]
	strh r1, [r4, #0x34]
	strh r1, [r4, #0x36]
	ldr r1, _081053F4
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _081053F8
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081053EC: .4byte 0x0000FFC0
_081053F0: .4byte 0x020380D6
_081053F4: .4byte 0x080A34C5
_081053F8: .4byte 0x080A5E35
	thumb_func_end Anim_BreathPuff

	thumb_func_start Anim_AngerMark
Anim_AngerMark: @ 0x081053FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08105410
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08105418
	ldr r0, _08105414
	b _0810541A
	.align 2, 0
_08105410: .4byte 0x020380BE
_08105414: .4byte 0x020380D6
_08105418:
	ldr r0, _08105478
_0810541A:
	ldrb r5, [r0]
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08105434
	ldr r1, _0810547C
	movs r2, #2
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_08105434:
	adds r0, r5, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _0810547C
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	adds r0, r5, #0
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r4, [r4, #4]
	adds r0, r0, r4
	strh r0, [r6, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bgt _08105466
	movs r0, #8
	strh r0, [r6, #0x22]
_08105466:
	ldr r1, _08105480
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08105484
	str r0, [r6, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105478: .4byte 0x020380D7
_0810547C: .4byte 0x020380BE
_08105480: .4byte 0x080A6015
_08105484: .4byte 0x080A6085
	thumb_func_end Anim_AngerMark

	thumb_func_start sub_08105488
sub_08105488: @ 0x08105488
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081054BC
	adds r4, r4, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	strh r1, [r4, #8]
	strh r0, [r4, #0xa]
	ldr r2, _081054C0
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _081054C4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081054BC: .4byte 0x03005B60
_081054C0: .4byte 0x0856F288
_081054C4: .4byte 0x081054C9
	thumb_func_end sub_08105488

	thumb_func_start AnimTask_GrowAndShrinkStep
AnimTask_GrowAndShrinkStep: @ 0x081054C8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081054F0
	adds r0, r0, r1
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081054E8
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_081054E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081054F0: .4byte 0x03005B60
	thumb_func_end AnimTask_GrowAndShrinkStep

	thumb_func_start sub_081054F4
sub_081054F4: @ 0x081054F4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08105568
	adds r4, r1, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	strh r0, [r4, #8]
	strh r2, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	movs r0, #7
	strh r0, [r4, #0xe]
	movs r0, #3
	strh r0, [r4, #0x10]
	ldr r3, _0810556C
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x20]
	strh r0, [r4, #0x12]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x22]
	strh r0, [r4, #0x14]
	strh r2, [r4, #0x16]
	strh r2, [r4, #0x18]
	movs r0, #2
	strh r0, [r4, #0x1a]
	ldr r0, _08105570
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0810555E
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0xc]
_0810555E:
	ldr r0, _08105574
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105568: .4byte 0x03005B60
_0810556C: .4byte 0x020205AC
_08105570: .4byte 0x020380D6
_08105574: .4byte 0x08105579
	thumb_func_end sub_081054F4

	thumb_func_start sub_08105578
sub_08105578: @ 0x08105578
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081055C0
	adds r3, r0, r1
	ldrh r0, [r3, #0x16]
	adds r0, #1
	strh r0, [r3, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _081055DE
	movs r0, #0
	strh r0, [r3, #0x16]
	ldrh r0, [r3, #0x18]
	adds r0, #1
	strh r0, [r3, #0x18]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _081055C8
	ldr r2, _081055C4
	movs r0, #8
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0x1a]
	ldrh r2, [r0, #0x22]
	adds r1, r1, r2
	b _081055DC
	.align 2, 0
_081055C0: .4byte 0x03005B60
_081055C4: .4byte 0x020205AC
_081055C8:
	ldr r2, _081055F0
	movs r5, #8
	ldrsh r1, [r3, r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	ldrh r2, [r3, #0x1a]
	subs r1, r1, r2
_081055DC:
	strh r1, [r0, #0x22]
_081055DE:
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	cmp r0, #1
	beq _0810562C
	cmp r0, #1
	bgt _081055F4
	cmp r0, #0
	beq _081055FA
	b _081056BC
	.align 2, 0
_081055F0: .4byte 0x020205AC
_081055F4:
	cmp r0, #2
	beq _0810565C
	b _081056BC
_081055FA:
	ldr r2, _08105628
	movs r5, #8
	ldrsh r1, [r3, r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0xc]
	ldrh r2, [r0, #0x20]
	adds r1, r1, r2
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #0xe]
	subs r0, #1
	strh r0, [r3, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081056BC
	movs r0, #0xe
	strh r0, [r3, #0xe]
	movs r0, #1
	strh r0, [r3, #0xa]
	b _081056BC
	.align 2, 0
_08105628: .4byte 0x020205AC
_0810562C:
	ldr r2, _08105658
	movs r5, #8
	ldrsh r1, [r3, r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	ldrh r2, [r3, #0xc]
	subs r1, r1, r2
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #0xe]
	subs r0, #1
	strh r0, [r3, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081056BC
	movs r0, #7
	strh r0, [r3, #0xe]
	movs r0, #2
	strh r0, [r3, #0xa]
	b _081056BC
	.align 2, 0
_08105658: .4byte 0x020205AC
_0810565C:
	ldr r2, _08105694
	movs r0, #8
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0xc]
	ldrh r5, [r0, #0x20]
	adds r1, r1, r5
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #0xe]
	subs r0, #1
	strh r0, [r3, #0xe]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _081056BC
	ldrh r0, [r3, #0x10]
	subs r0, #1
	strh r0, [r3, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08105698
	movs r0, #7
	strh r0, [r3, #0xe]
	strh r1, [r3, #0xa]
	b _081056BC
	.align 2, 0
_08105694: .4byte 0x020205AC
_08105698:
	ldrh r1, [r3, #0x18]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081056B6
	movs r0, #8
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	ldrh r2, [r3, #0x1a]
	subs r1, r1, r2
	strh r1, [r0, #0x22]
_081056B6:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_081056BC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08105578

	thumb_func_start sub_081056C4
sub_081056C4: @ 0x081056C4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08105714
	adds r5, r1, r0
	ldr r4, _08105718
	ldrb r0, [r4]
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x20
	movs r1, #0
	strh r0, [r5, #8]
	movs r0, #4
	strh r0, [r5, #0xa]
	strh r1, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r1, [r5, #0x10]
	strh r1, [r5, #0x12]
	ldrb r0, [r4]
	bl GetBattlerSpriteCoordAttr
	strh r0, [r5, #0x26]
	ldrb r0, [r4]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08105724
	ldr r0, _0810571C
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	ldr r0, _08105720
	b _0810572C
	.align 2, 0
_08105714: .4byte 0x03005B60
_08105718: .4byte 0x020380D7
_0810571C: .4byte 0x02022ACC
_08105720: .4byte 0x04000014
_08105724:
	ldr r0, _08105790
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	ldr r0, _08105794
_0810572C:
	str r0, [sp]
	ldrh r0, [r5, #8]
	adds r1, r0, #0
	subs r1, #0x40
	lsls r2, r1, #0x10
	lsls r0, r0, #0x10
	cmp r2, r0
	bgt _0810576A
	ldr r4, _08105798
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r6, r4, r0
_08105744:
	asrs r3, r2, #0x10
	cmp r3, #0
	blt _0810575C
	lsls r1, r3, #1
	adds r2, r1, r4
	ldrh r0, [r5, #0x14]
	adds r0, #0xf0
	strh r0, [r2]
	adds r1, r1, r6
	ldrh r0, [r5, #0x14]
	adds r0, #0xf0
	strh r0, [r1]
_0810575C:
	adds r0, r3, #1
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	movs r3, #8
	ldrsh r0, [r5, r3]
	cmp r1, r0
	ble _08105744
_0810576A:
	ldr r0, _0810579C
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
	ldr r0, _081057A0
	str r0, [r5]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105790: .4byte 0x02022AD0
_08105794: .4byte 0x04000018
_08105798: .4byte 0x020388C8
_0810579C: .4byte 0xA2600001
_081057A0: .4byte 0x081057A5
	thumb_func_end sub_081056C4

	thumb_func_start sub_081057A4
sub_081057A4: @ 0x081057A4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081057C4
	adds r3, r0, r1
	movs r1, #0x10
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _081057C8
	cmp r0, #1
	beq _081057DE
	b _0810585E
	.align 2, 0
_081057C4: .4byte 0x03005B60
_081057C8:
	ldrh r0, [r3, #0x12]
	adds r0, #1
	strh r0, [r3, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0810585E
	ldrh r0, [r3, #0x10]
	adds r0, #1
	strh r0, [r3, #0x10]
	b _0810585E
_081057DE:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0810585E
	movs r0, #0
	strh r0, [r3, #0xa]
	ldrh r1, [r3, #0xe]
	movs r0, #3
	ands r0, r1
	strh r0, [r3, #0xc]
	ldrh r0, [r3, #8]
	subs r0, r0, r1
	strh r0, [r3, #0x12]
	movs r2, #0xc
	ldrsh r1, [r3, r2]
	cmp r1, #1
	beq _08105814
	cmp r1, #1
	ble _0810581C
	cmp r1, #2
	beq _08105818
	cmp r1, #3
	beq _08105818
	b _0810581C
_08105814:
	subs r0, #2
	b _0810581A
_08105818:
	adds r0, #1
_0810581A:
	strh r0, [r3, #0x12]
_0810581C:
	movs r1, #0x12
	ldrsh r0, [r3, r1]
	cmp r0, #0
	blt _08105840
	ldr r2, _08105864
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r3, #0x14]
	strh r1, [r0]
	movs r1, #0x12
	ldrsh r0, [r3, r1]
	lsls r0, r0, #1
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r2, r2, r1
	adds r0, r0, r2
	ldrh r1, [r3, #0x14]
	strh r1, [r0]
_08105840:
	ldrh r0, [r3, #0xe]
	adds r0, #1
	strh r0, [r3, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x26
	ldrsh r1, [r3, r2]
	cmp r0, r1
	blt _0810585E
	ldr r1, _08105868
	movs r0, #3
	strb r0, [r1, #0x15]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_0810585E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105864: .4byte 0x020388C8
_08105868: .4byte 0x020397C8
	thumb_func_end sub_081057A4

	thumb_func_start sub_0810586C
sub_0810586C: @ 0x0810586C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _081058C0
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #0x10
	movs r5, #0
	strh r0, [r4, #0x20]
	ldrb r0, [r6]
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x10
	strh r0, [r4, #0x22]
	strh r5, [r4, #0x2e]
	strh r5, [r4, #0x30]
	strh r5, [r4, #0x32]
	movs r0, #0x10
	strh r0, [r4, #0x34]
	strh r5, [r4, #0x36]
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	adds r0, #2
	strh r0, [r4, #0x38]
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x3a]
	ldr r0, _081058C4
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081058C0: .4byte 0x020380D7
_081058C4: .4byte 0x081058C9
	thumb_func_end sub_0810586C

	thumb_func_start sub_081058C8
sub_081058C8: @ 0x081058C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _0810592C
	cmp r1, #1
	bgt _081058DE
	cmp r1, #0
	beq _081058E4
	b _08105A0C
_081058DE:
	cmp r1, #2
	beq _081059BE
	b _08105A0C
_081058E4:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0810590E
	strh r1, [r4, #0x32]
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsrs r1, r2, #2
	movs r0, #1
	eors r1, r0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0810590E:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08105A0C
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2]
	b _081059B6
_0810592C:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _08105972
	ldrh r2, [r4, #0x32]
	movs r3, #0x32
	ldrsh r1, [r4, r3]
	movs r3, #0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _08105972
	movs r0, #0
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	subs r0, #1
	strh r0, [r4, #0x22]
	adds r0, r2, #1
	strh r0, [r4, #0x32]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08105972
	ldrh r1, [r4, #0x3a]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xcd
	bl PlaySE12WithPanning
_08105972:
	ldrh r0, [r4, #0x34]
	ldrh r2, [r4, #0x36]
	adds r1, r0, r2
	strh r1, [r4, #0x36]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0x1f
	ble _08105986
	movs r0, #0x40
	b _08105994
_08105986:
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r2, r0
	bgt _081059A0
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r0, r2, #0
_08105994:
	subs r0, r0, r1
	strh r0, [r4, #0x36]
	movs r3, #0x34
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	strh r0, [r4, #0x34]
_081059A0:
	ldrh r0, [r4, #0x36]
	movs r2, #0
	strh r0, [r4, #0x24]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	movs r3, #0x32
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08105A0C
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
_081059B6:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _08105A0C
_081059BE:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _081059EA
	movs r0, #0
	strh r0, [r4, #0x32]
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsrs r1, r2, #2
	movs r0, #1
	eors r1, r0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_081059EA:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08105A0C
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl DestroyAnimSprite
_08105A0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081058C8

	thumb_func_start sub_08105A14
sub_08105A14: @ 0x08105A14
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r5, #0
	mov r0, sp
	strh r5, [r0]
	mov r1, sp
	adds r1, #2
	strh r5, [r1]
	ldr r0, _08105A38
	movs r3, #4
	ldrsh r2, [r0, r3]
	adds r7, r1, #0
	adds r1, r0, #0
	cmp r2, #0
	bne _08105A40
	ldr r0, _08105A3C
	b _08105A42
	.align 2, 0
_08105A38: .4byte 0x020380BE
_08105A3C: .4byte 0x020380D6
_08105A40:
	ldr r0, _08105A7C
_08105A42:
	ldrb r5, [r0]
	ldrb r1, [r1, #6]
	movs r0, #1
	adds r4, r0, #0
	eors r4, r1
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08105ABA
	movs r1, #2
	adds r0, r5, #0
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08105ABA
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sp
	adds r3, r7, #0
	bl SetAverageBattlerPositions
	cmp r4, #0
	bne _08105A80
	adds r0, r5, #0
	movs r1, #0
	b _08105A84
	.align 2, 0
_08105A7C: .4byte 0x020380D7
_08105A80:
	adds r0, r5, #0
	movs r1, #2
_08105A84:
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08105AB0
	ldr r2, _08105AAC
	mov r0, sp
	ldrh r1, [r0]
	subs r1, r1, r4
	ldrh r0, [r2]
	subs r1, r1, r0
	subs r0, r0, r1
	strh r0, [r2]
	b _08105ABA
	.align 2, 0
_08105AAC: .4byte 0x020380BE
_08105AB0:
	ldr r1, _08105ACC
	mov r0, sp
	ldrh r0, [r0]
	subs r0, r0, r4
	strh r0, [r1]
_08105ABA:
	ldr r1, _08105AD0
	str r1, [r6, #0x1c]
	adds r0, r6, #0
	bl _call_via_r1
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105ACC: .4byte 0x020380BE
_08105AD0: .4byte 0x080A7091
	thumb_func_end sub_08105A14

	thumb_func_start sub_08105AD4
sub_08105AD4: @ 0x08105AD4
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08105AEE
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroyAnimSprite
_08105AEE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08105AD4

	thumb_func_start sub_08105AF4
sub_08105AF4: @ 0x08105AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	movs r6, #0
	mov r0, sp
	strh r6, [r0]
	mov r1, sp
	adds r1, #2
	strh r6, [r1]
	ldr r0, _08105B20
	movs r2, #0xa
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08105B2C
	ldr r0, _08105B24
	ldrb r7, [r0]
	ldr r0, _08105B28
	b _08105B32
	.align 2, 0
_08105B20: .4byte 0x020380BE
_08105B24: .4byte 0x020380D6
_08105B28: .4byte 0x020380D7
_08105B2C:
	ldr r0, _08105B4C
	ldrb r7, [r0]
	ldr r0, _08105B50
_08105B32:
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _08105B54
	movs r3, #0xc
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08105B58
	movs r0, #0
	mov sl, r0
	movs r1, #1
	str r1, [sp, #4]
	b _08105B60
	.align 2, 0
_08105B4C: .4byte 0x020380D7
_08105B50: .4byte 0x020380D6
_08105B54: .4byte 0x020380BE
_08105B58:
	movs r2, #2
	mov sl, r2
	movs r3, #3
	str r3, [sp, #4]
_08105B60:
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08105BBC
	adds r0, r7, #0
	mov r1, sl
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r1, _08105BA0
	lsrs r0, r0, #0x18
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r0, #2
	mov r4, r8
	eors r4, r0
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08105BAC
	ldr r2, _08105BA4
	ldr r0, _08105BA8
	adds r0, r4, r0
	b _08105C3A
	.align 2, 0
_08105BA0: .4byte 0x020380BE
_08105BA4: .4byte 0x020205AC
_08105BA8: .4byte 0x02023E88
_08105BAC:
	ldr r2, _08105BB4
	ldr r0, _08105BB8
	add r0, r8
	b _08105C3A
	.align 2, 0
_08105BB4: .4byte 0x020205AC
_08105BB8: .4byte 0x02023E88
_08105BBC:
	adds r0, r7, #0
	mov r1, sl
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08105C24
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08105C34
	movs r0, #2
	adds r4, r7, #0
	eors r4, r0
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08105C34
	ldr r3, _08105C28
	ldr r2, _08105C2C
	adds r0, r7, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r6, r0, r3
	adds r2, r4, r2
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r3
	movs r0, #0x20
	ldrsh r1, [r6, r0]
	movs r3, #0x20
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _08105C30
	adds r0, r2, #0
	adds r0, #0x43
	ldrb r0, [r0]
	adds r0, #1
	b _08105C4A
	.align 2, 0
_08105C24: .4byte 0x020380BE
_08105C28: .4byte 0x020205AC
_08105C2C: .4byte 0x02023E88
_08105C30:
	adds r0, r6, #0
	b _08105C44
_08105C34:
	ldr r2, _08105C90
	ldr r0, _08105C94
	adds r0, r7, r0
_08105C3A:
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
_08105C44:
	adds r0, #0x43
	ldrb r0, [r0]
	subs r0, #1
_08105C4A:
	adds r1, r5, #0
	adds r1, #0x43
	strb r0, [r1]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _08105C98
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08105C9C
	movs r1, #2
	mov r0, r8
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08105C9C
	ldrb r1, [r4, #0xc]
	mov r0, r8
	mov r2, sp
	mov r3, sp
	adds r3, #2
	bl SetAverageBattlerPositions
	b _08105CBC
	.align 2, 0
_08105C90: .4byte 0x020205AC
_08105C94: .4byte 0x02023E88
_08105C98: .4byte 0x020380BE
_08105C9C:
	mov r4, sp
	mov r0, r8
	mov r1, sl
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	mov r0, r8
	ldr r1, [sp, #4]
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	strh r0, [r2, #2]
_08105CBC:
	mov r0, r8
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08105CE0
	mov r3, sp
	mov r2, sp
	ldr r1, _08105CDC
	ldrh r0, [r1, #6]
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r3]
	adds r2, r1, #0
	b _08105CEE
	.align 2, 0
_08105CDC: .4byte 0x020380BE
_08105CE0:
	mov r3, sp
	mov r0, sp
	ldr r2, _08105D30
	ldrh r0, [r0]
	ldrh r1, [r2, #6]
	subs r0, r0, r1
	strh r0, [r3]
_08105CEE:
	ldrh r1, [r2, #8]
	mov r3, sp
	ldrh r3, [r3, #2]
	adds r1, r1, r3
	mov r0, sp
	strh r1, [r0, #2]
	mov r3, sb
	strh r3, [r5, #0x30]
	strh r3, [r5, #0x20]
	strh r6, [r5, #0x34]
	strh r6, [r5, #0x22]
	ldrh r0, [r0]
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x36]
	ldrh r0, [r2]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl InitAnimLinearTranslation
	ldr r1, _08105D34
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105D30: .4byte 0x020380BE
_08105D34: .4byte 0x08105AD5
	thumb_func_end sub_08105AF4

	thumb_func_start sub_08105D38
sub_08105D38: @ 0x08105D38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08105D78
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08105D5E
	lsls r0, r0, #0x14
	ldr r1, _08105D7C
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	ldr r1, _08105D80
	ldrb r2, [r1, #0xa]
	ldrh r3, [r1, #8]
	movs r1, #0xf
	bl BlendPalette
_08105D5E:
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r1, _08105D84
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105D78: .4byte 0x000027DB
_08105D7C: .4byte 0x01010000
_08105D80: .4byte 0x020380BE
_08105D84: .4byte 0x080A7091
	thumb_func_end sub_08105D38

	thumb_func_start sub_08105D88
sub_08105D88: @ 0x08105D88
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldr r0, _08105DBC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r1, #0xa0
	cmp r0, #0
	beq _08105DA4
	ldr r1, _08105DC0
_08105DA4:
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x30]
	ldr r0, _08105DC4
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x3c]
	ldr r0, _08105DC8
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105DBC: .4byte 0x020380D6
_08105DC0: .4byte 0x0000FF60
_08105DC4: .4byte 0x020380BE
_08105DC8: .4byte 0x08105DCD
	thumb_func_end sub_08105D88

	thumb_func_start sub_08105DCC
sub_08105DCC: @ 0x08105DCC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x2e]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x26]
	subs r1, r1, r0
	movs r5, #0
	strh r1, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	subs r2, #0x20
	strh r2, [r4, #0x2e]
	ldr r0, _08105E38
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r1, #0xa0
	cmp r0, #0
	beq _08105DFC
	ldr r1, _08105E3C
_08105DFC:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #0x30]
	adds r0, r0, r1
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x26]
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08105E30
	ldrh r2, [r4, #0x22]
	adds r0, r1, r2
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x24]
	strh r5, [r4, #0x2e]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r0, _08105E40
	str r0, [r4, #0x1c]
_08105E30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105E38: .4byte 0x020380D6
_08105E3C: .4byte 0x0000FF60
_08105E40: .4byte 0x08105E45
	thumb_func_end sub_08105DCC

	thumb_func_start sub_08105E44
sub_08105E44: @ 0x08105E44
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r1, r0, #1
	strh r1, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _08105E62
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAffineAnim
	ldr r0, _08105E68
	str r0, [r4, #0x1c]
_08105E62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105E68: .4byte 0x08105E6D
	thumb_func_end sub_08105E44

	thumb_func_start sub_08105E6C
sub_08105E6C: @ 0x08105E6C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08105ED2
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	movs r0, #0
	strh r0, [r4, #0x2e]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08105EB8
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x10
	ldr r3, _08105EAC
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _08105EB0
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r0, _08105EB4
	b _08105ED0
	.align 2, 0
_08105EAC: .4byte 0x000003FF
_08105EB0: .4byte 0xFFFFFC00
_08105EB4: .4byte 0x08105EE5
_08105EB8:
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x20
	ldr r3, _08105ED8
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _08105EDC
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r0, _08105EE0
_08105ED0:
	str r0, [r4, #0x1c]
_08105ED2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105ED8: .4byte 0x000003FF
_08105EDC: .4byte 0xFFFFFC00
_08105EE0: .4byte 0x08105F6D
	thumb_func_end sub_08105E6C

	thumb_func_start sub_08105EE4
sub_08105EE4: @ 0x08105EE4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x26]
	subs r0, #2
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08105F1A
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	movs r0, #0
	strh r0, [r4, #0x30]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldrh r1, [r4, #0x2e]
	movs r0, #0x52
	bl SetGpuReg
	ldr r0, _08105F20
	str r0, [r4, #0x1c]
_08105F1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105F20: .4byte 0x08105F25
	thumb_func_end sub_08105EE4

	thumb_func_start sub_08105F24
sub_08105F24: @ 0x08105F24
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r1, r0, #1
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08105F62
	ldrh r1, [r4, #0x2e]
	subs r1, #1
	strh r1, [r4, #0x2e]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08105F62
	ldr r0, _08105F68
	str r0, [r4, #0x1c]
_08105F62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105F68: .4byte 0x08105F6D
	thumb_func_end sub_08105F24

	thumb_func_start sub_08105F6C
sub_08105F6C: @ 0x08105F6C
	push {lr}
	adds r3, r0, #0
	ldr r0, _08105F94
	ldrh r1, [r0, #0xe]
	ldr r0, _08105F98
	cmp r1, r0
	bne _08105FA4
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x3c
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _08105FA0
	ldr r0, _08105F9C
	b _08105FA2
	.align 2, 0
_08105F94: .4byte 0x020380BE
_08105F98: .4byte 0x0000FFFF
_08105F9C: .4byte 0x08105FAD
_08105FA0:
	ldr r0, _08105FA8
_08105FA2:
	str r0, [r3, #0x1c]
_08105FA4:
	pop {r0}
	bx r0
	.align 2, 0
_08105FA8: .4byte 0x080A34C5
	thumb_func_end sub_08105F6C

	thumb_func_start sub_08105FAC
sub_08105FAC: @ 0x08105FAC
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
	thumb_func_end sub_08105FAC

	thumb_func_start sub_08105FCC
sub_08105FCC: @ 0x08105FCC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08105FFC
	adds r4, r4, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strh r1, [r4, #8]
	ldr r2, _08106000
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _08106004
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105FFC: .4byte 0x03005B60
_08106000: .4byte 0x0856F494
_08106004: .4byte 0x08106009
	thumb_func_end sub_08105FCC

	thumb_func_start sub_08106008
sub_08106008: @ 0x08106008
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08106058
	adds r4, r0, r1
	adds r0, r4, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08106052
	ldr r2, _0810605C
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x26]
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08106052:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106058: .4byte 0x03005B60
_0810605C: .4byte 0x020205AC
	thumb_func_end sub_08106008

	thumb_func_start sub_08106060
sub_08106060: @ 0x08106060
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08106094
	adds r4, r1, r0
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	movs r0, #3
	strh r0, [r4, #0x20]
	ldr r0, _08106098
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081060A0
	ldr r0, _0810609C
	strh r0, [r4, #0x22]
	movs r0, #8
	b _081060A6
	.align 2, 0
_08106094: .4byte 0x03005B60
_08106098: .4byte 0x020380D7
_0810609C: .4byte 0x0000FFFF
_081060A0:
	movs r0, #1
	strh r0, [r4, #0x22]
	ldr r0, _081060C0
_081060A6:
	strh r0, [r4, #0x24]
	movs r0, #1
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldr r0, _081060C4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081060C0: .4byte 0x0000FFF8
_081060C4: .4byte 0x081060C9
	thumb_func_end sub_08106060

	thumb_func_start sub_081060C8
sub_081060C8: @ 0x081060C8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081060EC
	adds r3, r0, r1
	movs r0, #8
	ldrsh r4, [r3, r0]
	cmp r4, #1
	beq _0810611C
	cmp r4, #1
	bgt _081060F0
	cmp r4, #0
	beq _081060FA
	b _081061E2
	.align 2, 0
_081060EC: .4byte 0x03005B60
_081060F0:
	cmp r4, #2
	beq _08106198
	cmp r4, #3
	beq _081061B2
	b _081061E2
_081060FA:
	ldr r2, _08106118
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
	strh r4, [r3, #0xa]
	strh r4, [r3, #0xc]
	strh r4, [r3, #0xe]
	b _081061AA
	.align 2, 0
_08106118: .4byte 0x020205AC
_0810611C:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _081061E2
	movs r0, #0
	strh r0, [r3, #0xa]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	ands r0, r4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08106154
	ldr r2, _08106150
	movs r4, #0x26
	ldrsh r1, [r3, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x24]
	adds r1, #6
	b _08106166
	.align 2, 0
_08106150: .4byte 0x020205AC
_08106154:
	ldr r2, _08106194
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x24]
	subs r1, #6
_08106166:
	strh r1, [r0, #0x24]
	ldrh r0, [r3, #0xe]
	adds r0, #1
	strh r0, [r3, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _081061E2
	ldrh r1, [r3, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081061AA
	movs r1, #0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x24]
	subs r0, #6
	strh r0, [r1, #0x24]
	b _081061AA
	.align 2, 0
_08106194: .4byte 0x020205AC
_08106198:
	ldrh r0, [r3, #0x20]
	subs r0, #1
	strh r0, [r3, #0x20]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081061AA
	movs r0, #0
	strh r0, [r3, #8]
	b _081061E2
_081061AA:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	b _081061E2
_081061B2:
	ldr r2, _081061E8
	movs r4, #0x26
	ldrsh r1, [r3, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0x22]
	ldrh r4, [r0, #0x24]
	adds r1, r1, r4
	strh r1, [r0, #0x24]
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x24
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _081061E2
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_081061E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081061E8: .4byte 0x020205AC
	thumb_func_end sub_081060C8

	thumb_func_start sub_081061EC
sub_081061EC: @ 0x081061EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08106228
	adds r4, r4, r0
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	movs r0, #1
	strh r0, [r4, #0x10]
	movs r0, #0xe
	strh r0, [r4, #0x22]
	movs r0, #2
	strh r0, [r4, #0x24]
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldr r0, _0810622C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08106228: .4byte 0x03005B60
_0810622C: .4byte 0x08106231
	thumb_func_end sub_081061EC

	thumb_func_start sub_08106230
sub_08106230: @ 0x08106230
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08106284
	adds r4, r0, r1
	movs r0, #8
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _081062F6
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _081062F6
	strh r2, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0810628C
	ldr r3, _08106288
	movs r6, #0x26
	ldrsh r1, [r4, r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	b _081062A2
	.align 2, 0
_08106284: .4byte 0x03005B60
_08106288: .4byte 0x020205AC
_0810628C:
	ldr r3, _081062D4
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
_081062A2:
	strb r1, [r0]
	ldrh r0, [r4, #0xe]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x22
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _081062F6
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x24
	ldrsh r1, [r4, r6]
	cmp r0, r1
	bge _081062D8
	strh r2, [r4, #0xa]
	strh r2, [r4, #0xc]
	strh r2, [r4, #0xe]
	b _081062F6
	.align 2, 0
_081062D4: .4byte 0x020205AC
_081062D8:
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_081062F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08106230

	thumb_func_start sub_081062FC
sub_081062FC: @ 0x081062FC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0810634C
	adds r4, r4, r0
	movs r0, #0
	strh r0, [r4, #8]
	movs r1, #4
	strh r1, [r4, #0xa]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x16]
	strh r0, [r4, #0x18]
	strh r0, [r4, #0x22]
	ldr r5, _08106350
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldr r0, _08106354
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810634C: .4byte 0x03005B60
_08106350: .4byte 0x020380D6
_08106354: .4byte 0x08106359
	thumb_func_end sub_081062FC

	thumb_func_start sub_08106358
sub_08106358: @ 0x08106358
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0810637C
	adds r4, r0, r1
	movs r0, #0x18
	ldrsh r2, [r4, r0]
	cmp r2, #1
	beq _081063C4
	cmp r2, #1
	bgt _08106380
	cmp r2, #0
	beq _08106386
	b _081063E0
	.align 2, 0
_0810637C: .4byte 0x03005B60
_08106380:
	cmp r2, #2
	beq _081063DC
	b _081063E0
_08106386:
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _081063E0
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x14]
	adds r0, #1
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _081063E0
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081063BE
	strh r2, [r4, #0x14]
	movs r0, #1
	strh r0, [r4, #0x18]
	b _081063E0
_081063BE:
	movs r0, #2
	strh r0, [r4, #0x18]
	b _081063E0
_081063C4:
	movs r1, #0
	strh r1, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _081063E0
	strh r2, [r4, #0x16]
	strh r1, [r4, #0x18]
	b _081063E0
_081063DC:
	movs r0, #1
	strh r0, [r4, #0x12]
_081063E0:
	movs r2, #8
	ldrsh r5, [r4, r2]
	cmp r5, #0
	beq _081063EE
	cmp r5, #1
	beq _08106484
	b _08106492
_081063EE:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08106492
	strh r5, [r4, #0xa]
	ldr r0, _08106478
	movs r3, #0x24
	ldrsh r1, [r4, r3]
	movs r3, #0x26
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _08106492
	ldr r0, _0810647C
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	strh r6, [r1, #0x2e]
	movs r0, #0xd
	strh r0, [r1, #0x30]
	ldr r2, _08106480
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0x24]
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	adds r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0x26]
	ldrh r0, [r4, #0x22]
	adds r0, #1
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _08106492
	strh r5, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08106492
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08106492
	.align 2, 0
_08106478: .4byte 0x0856F4C0
_0810647C: .4byte 0x020205AC
_08106480: .4byte 0x0856F4D8
_08106484:
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08106492
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_08106492:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08106358

	thumb_func_start sub_08106498
sub_08106498: @ 0x08106498
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08106500
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x3e
	adds r1, r1, r3
	mov ip, r1
	movs r2, #1
	ldrb r1, [r0, #0x12]
	ands r1, r2
	lsls r1, r1, #2
	mov r0, ip
	ldrb r2, [r0]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081064FA
	movs r0, #0x30
	ldrsh r1, [r3, r0]
	lsls r1, r1, #1
	movs r0, #0x2e
	ldrsh r2, [r3, r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #8
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r3, #0
	bl DestroySprite
_081064FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08106500: .4byte 0x03005B60
	thumb_func_end sub_08106498

	thumb_func_start sub_08106504
sub_08106504: @ 0x08106504
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _081065A0
	bl IndexOfSpritePaletteTag
	mov r1, sp
	strb r0, [r1]
	movs r4, #1
	ldr r0, _081065A4
	adds r5, r0, #0
_0810651C:
	subs r0, r5, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AllocSpritePalette
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r4, #1
	cmp r4, #2
	ble _0810651C
	movs r0, #0x80
	lsls r0, r0, #6
	bl AllocZeroed
	adds r1, r0, #0
	ldr r0, _081065A8
	ldr r0, [r0]
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r0, r0, r2
	str r1, [r0]
	ldr r0, _081065AC
	bl LZDecompressVram
	movs r4, #0
_08106550:
	ldr r5, _081065A8
	ldr r0, [r5]
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r1, r4, #6
	ldr r0, [r0]
	adds r0, r0, r1
	mov r2, sp
	adds r1, r2, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	adds r4, #1
	cmp r4, #2
	ble _08106550
	ldr r0, [r5]
	movs r4, #0xbe
	lsls r4, r4, #1
	adds r0, r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081065A0: .4byte 0x000027DE
_081065A4: .4byte 0x00002710
_081065A8: .4byte 0x02024178
_081065AC: .4byte 0x08C226B4
	thumb_func_end sub_08106504

	thumb_func_start sub_081065B0
sub_081065B0: @ 0x081065B0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _081065D4
	movs r4, #2
_081065BA:
	ldrh r0, [r5]
	bl FreeSpritePaletteByTag
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _081065BA
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081065D4: .4byte 0x0856F534
	thumb_func_end sub_081065B0

	thumb_func_start sub_081065D8
sub_081065D8: @ 0x081065D8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r0, #1
	ands r3, r0
	rsbs r0, r3, #0
	orrs r0, r3
	asrs r0, r0, #0x1f
	movs r3, #0x20
	ands r0, r3
	ldrh r4, [r5, #4]
	lsls r3, r4, #0x16
	lsrs r3, r3, #0x16
	lsrs r1, r1, #0x16
	adds r0, r0, r1
	adds r3, r3, r0
	ldr r1, _0810662C
	adds r0, r1, #0
	ands r3, r0
	ldr r0, _08106630
	ands r0, r4
	orrs r0, r3
	strh r0, [r5, #4]
	ldr r0, _08106634
	lsrs r2, r2, #0x19
	lsls r2, r2, #1
	adds r2, r2, r0
	ldrh r0, [r2]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #4
	ldrb r2, [r5, #5]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810662C: .4byte 0x000003FF
_08106630: .4byte 0xFFFFFC00
_08106634: .4byte 0x0856F534
	thumb_func_end sub_081065D8

	thumb_func_start sub_08106638
sub_08106638: @ 0x08106638
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldr r6, _081066A0
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08106658
	ldr r1, _081066A4
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_08106658:
	ldr r4, _081066A4
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x2e]
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	ldrb r0, [r6]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #6]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
	ldr r0, _081066A8
	str r0, [r5, #0x1c]
	ldr r1, _081066AC
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldrb r1, [r4, #0xa]
	ldrb r2, [r4, #0xc]
	adds r0, r5, #0
	bl sub_081065D8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081066A0: .4byte 0x020380D6
_081066A4: .4byte 0x020380BE
_081066A8: .4byte 0x080A67B5
_081066AC: .4byte 0x080A34C5
	thumb_func_end sub_08106638

	thumb_func_start sub_081066B0
sub_081066B0: @ 0x081066B0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _081066CA
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
_081066CA:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r2, [r4, #0x32]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #7
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	subs r2, #0x80
	strh r2, [r4, #0x32]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x3c
	bne _081066FA
	adds r0, r4, #0
	bl DestroyAnimSprite
_081066FA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081066B0

	thumb_func_start sub_08106700
sub_08106700: @ 0x08106700
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	movs r6, #0xf0
	cmp r0, #0
	beq _08106714
	movs r6, #0x98
_08106714:
	movs r5, #0
	ldr r1, _08106768
	strh r6, [r1]
	ldr r4, _0810676C
	movs r0, #0xa0
	strh r0, [r4]
	ldrh r1, [r1]
	movs r0, #0x40
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x44
	bl SetGpuReg
	ldr r1, _08106770
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _08106774
	movs r0, #0x4a
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0xc8
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0x10
	bl SetGpuReg
	ldr r1, _08106778
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #8]
	strh r6, [r0, #0xa]
	ldr r1, _0810677C
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106768: .4byte 0x02022AD8
_0810676C: .4byte 0x02022ADA
_08106770: .4byte 0x00003F1F
_08106774: .4byte 0x00003F3F
_08106778: .4byte 0x03005B60
_0810677C: .4byte 0x08106781
	thumb_func_end sub_08106700

	thumb_func_start sub_08106780
sub_08106780: @ 0x08106780
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081067B4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r3, r1, r2
	ldrh r0, [r3, #8]
	adds r4, r0, #0
	adds r4, #0xd
	strh r4, [r3, #8]
	ldrh r0, [r3, #0xa]
	adds r2, r0, #0
	subs r2, #0xd
	strh r2, [r3, #0xa]
	lsls r1, r4, #0x10
	lsls r0, r2, #0x10
	cmp r1, r0
	blt _081067C0
	ldr r0, _081067B8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081067BC
	str r0, [r3]
	b _081067C8
	.align 2, 0
_081067B4: .4byte 0x03005B60
_081067B8: .4byte 0x02022AD8
_081067BC: .4byte 0x081067D5
_081067C0:
	ldr r1, _081067D0
	lsls r0, r4, #8
	orrs r2, r0
	strh r2, [r1]
_081067C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081067D0: .4byte 0x02022AD8
	thumb_func_end sub_08106780

	thumb_func_start sub_081067D4
sub_081067D4: @ 0x081067D4
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _08106820
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r0, [r1, #0x1c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _08106828
	movs r0, #0x88
	strh r0, [r1, #0x1e]
	movs r0, #0x50
	movs r1, #0x88
	bl SetGpuReg
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A6E74
	ldr r2, _08106824
	movs r1, #0x10
	bl BlendPalettes
	b _0810685C
	.align 2, 0
_08106820: .4byte 0x03005B60
_08106824: .4byte 0x00007FFF
_08106828:
	cmp r0, #4
	ble _0810685C
	ldr r0, _08106864
	strh r4, [r0]
	ldr r0, _08106868
	strh r4, [r0]
	ldr r4, _0810686C
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0810685C:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106864: .4byte 0x02022AD8
_08106868: .4byte 0x02022ADA
_0810686C: .4byte 0x00003F3F
	thumb_func_end sub_081067D4

	thumb_func_start sub_08106870
sub_08106870: @ 0x08106870
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	movs r0, #1
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _081068C0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _081068CC
	movs r0, #1
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _081068C4
	adds r0, r5, #0
	bl PrepareAffineAnimInTaskData
	ldr r1, _081068C8
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #4
	strh r1, [r0, #0x24]
	b _081068F4
	.align 2, 0
_081068C0: .4byte 0x03005B60
_081068C4: .4byte 0x0856F56C
_081068C8: .4byte 0x020205AC
_081068CC:
	ldr r1, _081068FC
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrh r0, [r4, #0x24]
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	adds r0, r5, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _081068F4
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_081068F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081068FC: .4byte 0x020205AC
	thumb_func_end sub_08106870

	thumb_func_start sub_08106900
sub_08106900: @ 0x08106900
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08106950
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0810695C
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08106954
	adds r0, r5, #0
	bl PrepareAffineAnimInTaskData
	ldr r1, _08106958
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #4
	strh r1, [r0, #0x24]
	b _08106984
	.align 2, 0
_08106950: .4byte 0x03005B60
_08106954: .4byte 0x0856F56C
_08106958: .4byte 0x020205AC
_0810695C:
	ldr r1, _0810698C
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrh r0, [r4, #0x24]
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	adds r0, r5, #0
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08106984
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_08106984:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810698C: .4byte 0x020205AC
	thumb_func_end sub_08106900

	thumb_func_start sub_08106990
sub_08106990: @ 0x08106990
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	movs r0, #0x5f
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldr r5, _081069D4
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	ldr r0, _081069D8
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081069D4: .4byte 0x020380D7
_081069D8: .4byte 0x081069DD
	thumb_func_end sub_08106990

	thumb_func_start sub_081069DC
sub_081069DC: @ 0x081069DC
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08106A06
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0xe
	bl Sin
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x38]
	adds r0, #4
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	b _08106A0C
_08106A06:
	adds r0, r4, #0
	bl DestroyAnimSprite
_08106A0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081069DC

	thumb_func_start sub_08106A14
sub_08106A14: @ 0x08106A14
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08106A38
	ldr r1, _08106A34
	ldrh r0, [r1]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x32]
	adds r0, r2, #1
	strh r0, [r4, #0x2e]
	b _08106A94
	.align 2, 0
_08106A34: .4byte 0x020380BE
_08106A38:
	ldrh r0, [r4, #0x30]
	ldrh r2, [r4, #0x36]
	adds r0, r0, r2
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x34]
	adds r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x34]
	cmp r0, #0x64
	ble _08106A86
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	adds r3, r4, #0
	adds r3, #0x3e
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08106A86:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	ble _08106A94
	adds r0, r4, #0
	bl DestroyAnimSprite
_08106A94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08106A14

	thumb_func_start sub_08106A9C
sub_08106A9C: @ 0x08106A9C
	push {lr}
	ldr r2, _08106AC0
	ldrh r1, [r2]
	strh r1, [r0, #0x20]
	movs r1, #0xa0
	strh r1, [r0, #0x22]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0x2e]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x30]
	ldr r1, _08106AC4
	str r1, [r0, #0x1c]
	ldr r1, _08106AC8
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_08106AC0: .4byte 0x020380BE
_08106AC4: .4byte 0x080A5D79
_08106AC8: .4byte 0x08106ACD
	thumb_func_end sub_08106A9C

	thumb_func_start sub_08106ACC
sub_08106ACC: @ 0x08106ACC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	movs r1, #4
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x34]
	adds r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x26]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0x48
	bgt _08106B32
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	adds r3, r4, #0
	adds r3, #0x3e
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	cmp r5, #0x40
	bgt _08106B32
	adds r0, r4, #0
	bl DestroyAnimSprite
_08106B32:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08106ACC

	thumb_func_start AnimTask_HeartsBackground
AnimTask_HeartsBackground: @ 0x08106B38
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08106BD8
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #1
	movs r1, #4
	movs r2, #3
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08106B7A
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
_08106B7A:
	ldr r0, _08106BDC
	movs r1, #0
	strh r1, [r0]
	ldr r4, _08106BE0
	strh r1, [r4]
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x16
	bl SetGpuReg
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _08106BE4
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r1, _08106BE8
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
	ldr r0, _08106BEC
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r1, _08106BF0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08106BF4
	str r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106BD8: .4byte 0x00003F42
_08106BDC: .4byte 0x02022ACC
_08106BE0: .4byte 0x02022ACE
_08106BE4: .4byte 0x08C23384
_08106BE8: .4byte 0x08C23E1C
_08106BEC: .4byte 0x08C23DF4
_08106BF0: .4byte 0x03005B60
_08106BF4: .4byte 0x08106BF9
	thumb_func_end AnimTask_HeartsBackground

	thumb_func_start sub_08106BF8
sub_08106BF8: @ 0x08106BF8
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08106C20
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0x20
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #4
	bls _08106C16
	b _08106D40
_08106C16:
	lsls r0, r0, #2
	ldr r1, _08106C24
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106C20: .4byte 0x03005B60
_08106C24: .4byte 0x08106C28
_08106C28: @ jump table
	.4byte _08106C3C @ case 0
	.4byte _08106C80 @ case 1
	.4byte _08106CA2 @ case 2
	.4byte _08106CE6 @ case 3
	.4byte _08106D0C @ case 4
_08106C3C:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08106D40
	strh r5, [r4, #0x1c]
	ldrh r1, [r4, #0x1e]
	adds r1, #1
	strh r1, [r4, #0x1e]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _08106D40
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	strh r5, [r4, #0x1e]
	b _08106D40
_08106C80:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	strh r0, [r1, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x8d
	bne _08106D40
	movs r0, #0x10
	strh r0, [r1, #0x1e]
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
	b _08106D40
_08106CA2:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08106D40
	movs r0, #0
	strh r0, [r4, #0x1c]
	ldrh r1, [r4, #0x1e]
	subs r1, #1
	strh r1, [r4, #0x1e]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r2, #0x1e
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bne _08106D40
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	strh r1, [r4, #0x1e]
	b _08106D40
_08106CE6:
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	bl sub_080A6530
	ldr r1, _08106D08
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	b _08106D40
	.align 2, 0
_08106D08: .4byte 0x03005B60
_08106D0C:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08106D20
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_08106D20:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08106D40:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08106BF8

	thumb_func_start sub_08106D48
sub_08106D48: @ 0x08106D48
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08106DB8
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
	movs r2, #0
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08106D8A
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
_08106D8A:
	ldr r0, _08106DBC
	movs r1, #0
	strh r1, [r0]
	ldr r4, _08106DC0
	strh r1, [r4]
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x16
	bl SetGpuReg
	mov r0, sp
	bl sub_080A63F8
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08106DC8
	ldr r1, _08106DC4
	b _08106DDA
	.align 2, 0
_08106DB8: .4byte 0x00003F42
_08106DBC: .4byte 0x02022ACC
_08106DC0: .4byte 0x02022ACE
_08106DC4: .4byte 0x08D93914
_08106DC8:
	ldr r0, _08106DE4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08106DEC
	ldr r1, _08106DE8
_08106DDA:
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
	b _08106DF6
	.align 2, 0
_08106DE4: .4byte 0x020380D7
_08106DE8: .4byte 0x08D9354C
_08106DEC:
	ldr r1, _08106E28
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
_08106DF6:
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _08106E2C
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r0, _08106E30
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r1, _08106E34
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08106E38
	str r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106E28: .4byte 0x08D93730
_08106E2C: .4byte 0x08C24A9C
_08106E30: .4byte 0x08C24A74
_08106E34: .4byte 0x03005B60
_08106E38: .4byte 0x08106E3D
	thumb_func_end sub_08106D48

	thumb_func_start sub_08106E3C
sub_08106E3C: @ 0x08106E3C
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08106E64
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0x20
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #4
	bls _08106E5A
	b _08106F80
_08106E5A:
	lsls r0, r0, #2
	ldr r1, _08106E68
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106E64: .4byte 0x03005B60
_08106E68: .4byte 0x08106E6C
_08106E6C: @ jump table
	.4byte _08106E80 @ case 0
	.4byte _08106EC4 @ case 1
	.4byte _08106EE6 @ case 2
	.4byte _08106F2A @ case 3
	.4byte _08106F4C @ case 4
_08106E80:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08106F80
	strh r5, [r4, #0x1c]
	ldrh r1, [r4, #0x1e]
	adds r1, #1
	strh r1, [r4, #0x1e]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0xe
	bne _08106F80
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	strh r5, [r4, #0x1e]
	b _08106F80
_08106EC4:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	strh r0, [r1, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bne _08106F80
	movs r0, #0xe
	strh r0, [r1, #0x1e]
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
	b _08106F80
_08106EE6:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08106F80
	movs r0, #0
	strh r0, [r4, #0x1c]
	ldrh r1, [r4, #0x1e]
	subs r1, #1
	strh r1, [r4, #0x1e]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r2, #0x1e
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bne _08106F80
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	strh r1, [r4, #0x1e]
	b _08106F80
_08106F2A:
	mov r0, sp
	bl sub_080A63F8
	movs r0, #1
	bl sub_080A6530
	movs r0, #2
	bl sub_080A6530
	ldr r0, _08106F88
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
_08106F4C:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08106F60
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_08106F60:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08106F80:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106F88: .4byte 0x03005B60
	thumb_func_end sub_08106E3C

	thumb_func_start AnimOrbitFast
AnimOrbitFast: @ 0x08106F8C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08106FE0
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
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08106FE4
	ldrh r0, [r1]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x30]
	ldrb r0, [r5]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x3c]
	ldr r1, _08106FE8
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106FE0: .4byte 0x020380D6
_08106FE4: .4byte 0x020380BE
_08106FE8: .4byte 0x08106FED
	thumb_func_end AnimOrbitFast

	thumb_func_start AnimOrbitFastStep
AnimOrbitFastStep: @ 0x08106FEC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bhi _08107002
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	b _08107006
_08107002:
	ldrh r0, [r4, #0x3c]
	subs r0, #1
_08107006:
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
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
	movs r3, #0x38
	ldrsh r2, [r4, r3]
	cmp r2, #0
	beq _08107078
	cmp r2, #1
	bne _081070A8
	ldr r1, _08107070
	adds r0, r1, #0
	ldrh r2, [r4, #0x32]
	adds r0, r0, r2
	strh r0, [r4, #0x32]
	ldr r3, _08107074
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
	bne _081070A8
	movs r0, #2
	strh r0, [r4, #0x38]
	b _081070B8
	.align 2, 0
_08107070: .4byte 0xFFFFFC00
_08107074: .4byte 0xFFFFFF00
_08107078:
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrh r1, [r4, #0x34]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _081070A8
	strh r2, [r4, #0x36]
	movs r0, #1
	strh r0, [r4, #0x38]
_081070A8:
	ldr r0, _081070C0
	ldrh r1, [r0, #0xe]
	ldr r0, _081070C4
	cmp r1, r0
	bne _081070B8
	adds r0, r4, #0
	bl DestroyAnimSprite
_081070B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081070C0: .4byte 0x020380BE
_081070C4: .4byte 0x0000FFFF
	thumb_func_end AnimOrbitFastStep

	thumb_func_start AnimOrbitScatter
AnimOrbitScatter: @ 0x081070C8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08107110
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
	ldr r4, _08107114
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Sin
	strh r0, [r5, #0x2e]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #7
	bl Cos
	strh r0, [r5, #0x30]
	ldr r0, _08107118
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08107110: .4byte 0x020380D6
_08107114: .4byte 0x020380BE
_08107118: .4byte 0x0810711D
	thumb_func_end AnimOrbitScatter

	thumb_func_start AnimOrbitScatterStep
AnimOrbitScatterStep: @ 0x0810711C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x30]
	ldrh r3, [r2, #0x26]
	adds r0, r0, r3
	strh r0, [r2, #0x26]
	movs r1, #0x20
	ldrsh r0, [r2, r1]
	movs r3, #0x24
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	adds r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0810715A
	movs r0, #0x22
	ldrsh r1, [r2, r0]
	movs r3, #0x26
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
	cmp r1, #0xa0
	bgt _0810715A
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08107160
_0810715A:
	adds r0, r2, #0
	bl DestroyAnimSprite
_08107160:
	pop {r0}
	bx r0
	thumb_func_end AnimOrbitScatterStep

	thumb_func_start sub_08107164
sub_08107164: @ 0x08107164
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x30]
	ldrh r3, [r2, #0x26]
	adds r0, r0, r3
	strh r0, [r2, #0x26]
	ldrh r0, [r2, #0x34]
	adds r1, r0, #1
	strh r1, [r2, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08107190
	adds r0, r2, #0
	bl DestroyAnimSprite
_08107190:
	pop {r0}
	bx r0
	thumb_func_end sub_08107164

	thumb_func_start sub_08107194
sub_08107194: @ 0x08107194
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _081071E0
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
	ldr r4, _081071E4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Sin
	strh r0, [r5, #0x2e]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #7
	bl Cos
	strh r0, [r5, #0x30]
	ldrh r0, [r4, #2]
	strh r0, [r5, #0x32]
	ldr r0, _081071E8
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081071E0: .4byte 0x020380D6
_081071E4: .4byte 0x020380BE
_081071E8: .4byte 0x08107165
	thumb_func_end sub_08107194

	thumb_func_start sub_081071EC
sub_081071EC: @ 0x081071EC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08107202
	adds r0, r2, #0
	bl DestroyAnimSprite
_08107202:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081071EC

	thumb_func_start sub_08107208
sub_08107208: @ 0x08107208
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _0810721C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810721C: .4byte 0x081071ED
	thumb_func_end sub_08107208

	thumb_func_start sub_08107220
sub_08107220: @ 0x08107220
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810723E
	ldr r0, _081072B0
	ldrh r1, [r0]
	ldrh r2, [r4, #0x20]
	adds r1, r1, r2
	strh r1, [r4, #0x20]
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
_0810723E:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r5, r0, #1
	movs r0, #0xff
	ands r5, r0
	adds r0, r5, #0
	movs r1, #0x50
	bl Sin
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x4f
	bgt _08107282
	adds r0, r5, #0
	movs r1, #0x50
	bl Cos
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r4, #0x26]
_08107282:
	movs r0, #0x2e
	ldrsh r2, [r4, r0]
	cmp r2, #0x5a
	ble _081072A0
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	ldrh r0, [r4, #0x24]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
_081072A0:
	cmp r2, #0x64
	ble _081072AA
	adds r0, r4, #0
	bl DestroyAnimSprite
_081072AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081072B0: .4byte 0x020380BE
	thumb_func_end sub_08107220

	thumb_func_start sub_081072B4
sub_081072B4: @ 0x081072B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	movs r1, #5
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x34]
	adds r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x34]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #0x14
	ble _0810730A
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	adds r3, r4, #0
	adds r3, #0x3e
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0810730A:
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #0x1e
	ble _08107318
	adds r0, r4, #0
	bl DestroyAnimSprite
_08107318:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081072B4

	thumb_func_start sub_08107320
sub_08107320: @ 0x08107320
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08107344
	ldr r1, _08107340
	ldrh r0, [r1]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x32]
	adds r0, r2, #1
	strh r0, [r4, #0x2e]
	b _08107398
	.align 2, 0
_08107340: .4byte 0x020380BE
_08107344:
	ldrh r0, [r4, #0x30]
	ldrh r2, [r4, #0x36]
	adds r0, r0, r2
	movs r5, #0
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	bl Sin
	adds r2, r0, #0
	strh r2, [r4, #0x26]
	ldrh r0, [r4, #0x34]
	adds r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x34]
	cmp r0, #0x46
	ble _08107398
	ldr r0, _081073A0
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r1, [r4, #0x22]
	adds r0, r2, r1
	strh r0, [r4, #0x22]
	strh r5, [r4, #0x24]
	strh r5, [r4, #0x26]
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xb4
	bl __umodsi3
	strh r0, [r4, #0x34]
_08107398:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081073A0: .4byte 0x081072B5
	thumb_func_end sub_08107320

	thumb_func_start sub_081073A4
sub_081073A4: @ 0x081073A4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081073DE
	ldr r1, _081074A0
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
	ldr r0, _081074A4
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	subs r0, #1
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	movs r0, #1
	strh r0, [r4, #0x32]
_081073DE:
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x2e]
	adds r0, r0, r2
	strh r0, [r4, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsls r1, r0, #2
	adds r0, r1, #0
	cmp r1, #0
	bge _081073F4
	adds r0, #0xff
_081073F4:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08107406
	movs r0, #0
	strh r0, [r4, #0x30]
_08107406:
	movs r0, #0x30
	ldrsh r2, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08107414
	adds r0, #3
_08107414:
	asrs r0, r0, #2
	movs r1, #0x1e
	subs r1, r1, r0
	adds r0, r2, #0
	bl Cos
	strh r0, [r4, #0x24]
	movs r0, #0x30
	ldrsh r2, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08107430
	adds r0, #7
_08107430:
	asrs r0, r0, #3
	movs r1, #0xa
	subs r1, r1, r0
	adds r0, r2, #0
	bl Sin
	strh r0, [r4, #0x26]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0x80
	ble _08107454
	ldrh r1, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08107454
	ldr r0, _081074A8
	strh r0, [r4, #0x32]
_08107454:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08107468
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bge _08107468
	movs r0, #1
	strh r0, [r4, #0x32]
_08107468:
	ldrh r0, [r4, #0x34]
	adds r1, r0, #1
	strh r1, [r4, #0x34]
	subs r0, #9
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x46
	bls _081074AC
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	adds r3, r4, #0
	adds r3, #0x3e
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _081074BA
	.align 2, 0
_081074A0: .4byte 0x020380BE
_081074A4: .4byte 0x020380D7
_081074A8: .4byte 0x0000FFFF
_081074AC:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_081074BA:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0x5a
	ble _081074C8
	adds r0, r4, #0
	bl DestroyAnimSprite
_081074C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081073A4

	thumb_func_start sub_081074D0
sub_081074D0: @ 0x081074D0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08107504
	ldr r1, _08107500
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	ldrb r1, [r1, #4]
	adds r0, r4, #0
	bl StartSpriteAnim
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _08107518
	.align 2, 0
_08107500: .4byte 0x020380BE
_08107504:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08107518
	adds r0, r4, #0
	bl DestroyAnimSprite
_08107518:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081074D0

	thumb_func_start sub_08107520
sub_08107520: @ 0x08107520
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08107538
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0810753C
	adds r0, r5, #0
	bl DestroyAnimSprite
	b _081075A0
	.align 2, 0
_08107538: .4byte 0x020380BE
_0810753C:
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0810754C
	ldr r4, _08107548
	b _0810754E
	.align 2, 0
_08107548: .4byte 0x020380D6
_0810754C:
	ldr r4, _0810757C
_0810754E:
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
	ldr r0, _08107580
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #0
	bne _08107584
	ldrh r0, [r5, #0x20]
	adds r0, #0x20
	b _08107588
	.align 2, 0
_0810757C: .4byte 0x020380D7
_08107580: .4byte 0x020380BE
_08107584:
	ldrh r0, [r5, #0x20]
	subs r0, #0x20
_08107588:
	strh r0, [r5, #0x20]
	ldrh r0, [r2, #4]
	strh r0, [r5, #0x2e]
	ldrh r1, [r2, #2]
	strh r1, [r5, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r0, _081075A8
	str r0, [r5, #0x1c]
_081075A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081075A8: .4byte 0x081075AD
	thumb_func_end sub_08107520

	thumb_func_start sub_081075AC
sub_081075AC: @ 0x081075AC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081075DC
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081075D6
	ldrh r1, [r2, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl StartSpriteAnim
	b _081075DC
_081075D6:
	adds r0, r2, #0
	bl DestroyAnimSprite
_081075DC:
	pop {r0}
	bx r0
	thumb_func_end sub_081075AC

	thumb_func_start sub_081075E0
sub_081075E0: @ 0x081075E0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08107614
	ldrb r0, [r0]
	bl GetAnimBattlerSpriteId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _08107618
	adds r4, r4, r0
	ldr r2, _0810761C
	adds r0, r4, #0
	bl PrepareAffineAnimInTaskData
	ldr r0, _08107620
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08107614: .4byte 0x020380BE
_08107618: .4byte 0x03005B60
_0810761C: .4byte 0x0856F77C
_08107620: .4byte 0x08107625
	thumb_func_end sub_081075E0

	thumb_func_start sub_08107624
sub_08107624: @ 0x08107624
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0810764C
	adds r0, r0, r1
	bl RunAffineAnimFromTaskData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08107644
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08107644:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810764C: .4byte 0x03005B60
	thumb_func_end sub_08107624

	thumb_func_start sub_08107650
sub_08107650: @ 0x08107650
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08107664
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810766C
	ldr r0, _08107668
	b _0810766E
	.align 2, 0
_08107664: .4byte 0x020380BE
_08107668: .4byte 0x020380D6
_0810766C:
	ldr r0, _08107704
_0810766E:
	ldrb r6, [r0]
	adds r0, r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08107688
	ldr r1, _08107708
	movs r2, #2
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_08107688:
	adds r0, r6, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r7, _08107708
	lsrs r0, r0, #0x18
	ldrh r3, [r7, #2]
	adds r0, r0, r3
	movs r4, #0
	strh r0, [r5, #0x20]
	adds r0, r6, #0
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r7, #4]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	strh r4, [r5, #0x2e]
	ldrh r1, [r5, #0x20]
	lsls r1, r1, #3
	strh r1, [r5, #0x30]
	lsls r0, r0, #3
	strh r0, [r5, #0x32]
	movs r2, #2
	ldrsh r0, [r7, r2]
	lsls r0, r0, #3
	cmp r0, #0
	bge _081076C8
	adds r0, #7
_081076C8:
	asrs r0, r0, #3
	strh r0, [r5, #0x34]
	movs r3, #4
	ldrsh r0, [r7, r3]
	lsls r0, r0, #3
	cmp r0, #0
	bge _081076D8
	adds r0, #7
_081076D8:
	asrs r0, r0, #3
	strh r0, [r5, #0x36]
	ldrh r2, [r5, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	movs r3, #6
	ldrsh r0, [r7, r3]
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r3, _0810770C
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _08107710
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	ldr r0, _08107714
	str r0, [r5, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08107704: .4byte 0x020380D7
_08107708: .4byte 0x020380BE
_0810770C: .4byte 0x000003FF
_08107710: .4byte 0xFFFFFC00
_08107714: .4byte 0x08107719
	thumb_func_end sub_08107650

	thumb_func_start sub_08107718
sub_08107718: @ 0x08107718
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x34]
	ldrh r1, [r2, #0x30]
	adds r0, r0, r1
	strh r0, [r2, #0x30]
	ldrh r1, [r2, #0x36]
	ldrh r3, [r2, #0x32]
	adds r1, r1, r3
	strh r1, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	strh r0, [r2, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	strh r1, [r2, #0x22]
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _0810774C
	adds r0, r2, #0
	bl DestroyAnimSprite
_0810774C:
	pop {r0}
	bx r0
	thumb_func_end sub_08107718

	thumb_func_start sub_08107750
sub_08107750: @ 0x08107750
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08107772
	ldr r0, _081077AC
	ldrh r1, [r0]
	movs r0, #0x78
	subs r0, r0, r1
	strh r0, [r4, #0x30]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_08107772:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08107790
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	adds r0, #0x10
	movs r1, #0
	bl SetGreyscaleOrOriginalPalette
_08107790:
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	adds r0, #0x50
	cmp r1, r0
	bne _081077A4
	adds r0, r4, #0
	bl DestroyAnimSprite
_081077A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081077AC: .4byte 0x020380BE
	thumb_func_end sub_08107750

	thumb_func_start sub_081077B0
sub_081077B0: @ 0x081077B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _081077DE
	movs r5, #0x78
	strh r5, [r6, #0x20]
	ldr r4, _08107860
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, #0xf
	strh r0, [r6, #0x22]
	ldrb r1, [r4, #2]
	adds r0, r6, #0
	bl StartSpriteAnim
	strh r5, [r6, #0x38]
	ldrh r0, [r4, #4]
	strh r0, [r6, #0x34]
_081077DE:
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	movs r5, #0
	strh r0, [r6, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r6, #0x30]
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	lsls r4, r0, #1
	adds r4, r4, r0
	ldrh r0, [r6, #0x34]
	adds r4, r4, r0
	movs r2, #0xff
	ldrh r0, [r6, #0x3a]
	adds r0, #0xa
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6, #0x3a]
	ands r4, r2
	adds r0, r4, #0
	movs r1, #0x64
	bl Cos
	strh r0, [r6, #0x24]
	adds r0, r4, #0
	movs r1, #0xa
	bl Sin
	adds r4, r0, #0
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	movs r1, #4
	bl Cos
	ldrh r2, [r6, #0x30]
	adds r4, r4, r2
	adds r0, r0, r4
	strh r0, [r6, #0x26]
	movs r0, #0x2e
	ldrsh r1, [r6, r0]
	movs r2, #0x38
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _0810785A
	ldr r0, _08107864
	str r0, [r6, #0x1c]
	strh r5, [r6, #0x2e]
	adds r0, r6, #0
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	movs r0, #5
	strh r0, [r6, #0x32]
	strh r5, [r6, #0x36]
	strh r5, [r6, #0x34]
	adds r0, r6, #0
	movs r1, #1
	bl StartSpriteAffineAnim
_0810785A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08107860: .4byte 0x020380BE
_08107864: .4byte 0x08107869
	thumb_func_end sub_081077B0

	thumb_func_start sub_08107868
sub_08107868: @ 0x08107868
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _08107882
	movs r0, #0
	strh r0, [r1, #0x2e]
	ldr r0, _08107888
	str r0, [r1, #0x1c]
_08107882:
	pop {r0}
	bx r0
	.align 2, 0
_08107888: .4byte 0x0810788D
	thumb_func_end sub_08107868

	thumb_func_start sub_0810788C
sub_0810788C: @ 0x0810788C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x32]
	ldrh r2, [r4, #0x34]
	adds r0, r1, r2
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x26]
	adds r1, #1
	strh r1, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x30
	ble _081078B6
	lsls r0, r1, #0x10
	cmp r0, #0
	ble _081078B6
	ldrh r0, [r4, #0x36]
	subs r1, r0, #5
	strh r1, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x36]
_081078B6:
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #3
	ble _081078E8
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	adds r3, r4, #0
	adds r3, #0x3e
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, #0
	bl DestroyAnimSprite
_081078E8:
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _081078F6
	adds r0, r4, #0
	bl DestroyAnimSprite
_081078F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810788C

	thumb_func_start sub_081078FC
sub_081078FC: @ 0x081078FC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08107940
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08107948
	ldr r4, _08107944
	ldrb r1, [r4]
	movs r0, #2
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08107948
	ldrb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x20
	adds r3, r5, #0
	adds r3, #0x22
	movs r1, #0
	bl SetAverageBattlerPositions
	ldrh r0, [r5, #0x22]
	adds r0, #0x28
	strh r0, [r5, #0x22]
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	b _08107968
	.align 2, 0
_08107940: .4byte 0x02022C90
_08107944: .4byte 0x020380D6
_08107948:
	ldr r4, _08107988
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
	adds r0, #0x28
	strh r0, [r5, #0x22]
_08107968:
	movs r0, #0xd
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x22]
	subs r0, #0x48
	strh r0, [r5, #0x36]
	ldr r0, _0810798C
	str r0, [r5, #0x1c]
	ldr r1, _08107990
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08107988: .4byte 0x020380D6
_0810798C: .4byte 0x080A67B5
_08107990: .4byte 0x080A34C5
	thumb_func_end sub_081078FC

	thumb_func_start AnimTask_IsFuryCutterHitRight
AnimTask_IsFuryCutterHitRight: @ 0x08107994
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _081079B0
	ldr r1, _081079B4
	ldr r1, [r1]
	ldrb r2, [r1, #0x10]
	movs r1, #1
	ands r1, r2
	strh r1, [r3, #0xe]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_081079B0: .4byte 0x020380BE
_081079B4: .4byte 0x020380A0
	thumb_func_end AnimTask_IsFuryCutterHitRight

	thumb_func_start AnimTask_GetFuryCutterHitCount
AnimTask_GetFuryCutterHitCount: @ 0x081079B8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081079D0
	ldr r1, _081079D4
	ldr r1, [r1]
	ldrb r1, [r1, #0x10]
	strh r1, [r2, #0xe]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_081079D0: .4byte 0x020380BE
_081079D4: .4byte 0x020380A0
	thumb_func_end AnimTask_GetFuryCutterHitCount

