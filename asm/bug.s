.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08110BB8
sub_08110BB8: @ 0x08110BB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08110BE4
	adds r0, r6, #0
	movs r1, #2
	bl StartSpriteAffineAnim
	ldr r0, _08110BE0
	ldrh r1, [r0, #4]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	ldrh r1, [r0]
	rsbs r1, r1, #0
	strh r1, [r0]
	b _08110C14
	.align 2, 0
_08110BE0: .4byte 0x020380BE
_08110BE4:
	ldr r0, _08110C78
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08110C14
	adds r0, r6, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r1, _08110C7C
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	strh r0, [r1, #6]
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r1]
_08110C14:
	ldr r5, _08110C78
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	ldr r4, _08110C7C
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r6, #0x22]
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x2e]
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r6, #0x32]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r4, [r4, #6]
	adds r0, r0, r4
	strh r0, [r6, #0x36]
	ldr r0, _08110C80
	str r0, [r6, #0x1c]
	ldr r1, _08110C84
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08110C78: .4byte 0x020380D7
_08110C7C: .4byte 0x020380BE
_08110C80: .4byte 0x080A67B5
_08110C84: .4byte 0x080A34C5
	thumb_func_end sub_08110BB8

	thumb_func_start sub_08110C88
sub_08110C88: @ 0x08110C88
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08110CAC
	ldr r1, _08110CA8
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r1]
	adds r0, r6, #0
	movs r1, #2
	bl StartSpriteAffineAnim
	b _08110CC8
	.align 2, 0
_08110CA8: .4byte 0x020380BE
_08110CAC:
	ldr r0, _08110D24
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08110CC8
	ldr r0, _08110D28
	ldrh r1, [r0, #2]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldrh r1, [r0]
	rsbs r1, r1, #0
	strh r1, [r0]
_08110CC8:
	ldr r5, _08110D24
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	ldr r4, _08110D28
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r6, #0x22]
	ldrh r0, [r4, #4]
	strh r0, [r6, #0x2e]
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x32]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x36]
	ldr r0, _08110D2C
	str r0, [r6, #0x1c]
	ldr r1, _08110D30
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08110D24: .4byte 0x020380D7
_08110D28: .4byte 0x020380BE
_08110D2C: .4byte 0x080A67B5
_08110D30: .4byte 0x080A34C5
	thumb_func_end sub_08110C88

	thumb_func_start AnimTranslateWebThread
AnimTranslateWebThread: @ 0x08110D34
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08110D50
	ldr r0, _08110D90
	movs r2, #4
	ldrsh r1, [r0, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	strh r1, [r0, #4]
_08110D50:
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r1, _08110D90
	ldrh r0, [r1, #4]
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08110D98
	ldr r4, _08110D94
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
	b _08110DAA
	.align 2, 0
_08110D90: .4byte 0x020380BE
_08110D94: .4byte 0x020380D7
_08110D98:
	ldr r0, _08110DC0
	ldrb r0, [r0]
	adds r2, r5, #0
	adds r2, #0x32
	adds r3, r5, #0
	adds r3, #0x36
	movs r1, #1
	bl SetAverageBattlerPositions
_08110DAA:
	adds r0, r5, #0
	bl sub_080A689C
	ldr r0, _08110DC4
	ldrh r0, [r0, #6]
	strh r0, [r5, #0x38]
	ldr r0, _08110DC8
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08110DC0: .4byte 0x020380D7
_08110DC4: .4byte 0x020380BE
_08110DC8: .4byte 0x08110DCD
	thumb_func_end AnimTranslateWebThread

	thumb_func_start sub_08110DCC
sub_08110DCC: @ 0x08110DCC
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08110DE2
	adds r0, r4, #0
	bl DestroyAnimSprite
	b _08110DFE
_08110DE2:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x3a]
	adds r0, #0xd
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3a]
_08110DFE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08110DCC

	thumb_func_start sub_08110E04
sub_08110E04: @ 0x08110E04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08110E34
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #0
	bl SetAverageBattlerPositions
	ldr r0, _08110E38
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08110E40
	ldr r0, _08110E3C
	ldrh r1, [r4, #0x20]
	ldrh r2, [r0]
	subs r1, r1, r2
	strh r1, [r4, #0x20]
	b _08110E4C
	.align 2, 0
_08110E34: .4byte 0x020380D7
_08110E38: .4byte 0x020380D6
_08110E3C: .4byte 0x020380BE
_08110E40:
	ldr r1, _08110E74
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	adds r0, r1, #0
_08110E4C:
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, _08110E78
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08110E68
	ldrh r0, [r4, #0x22]
	adds r0, #8
	strh r0, [r4, #0x22]
_08110E68:
	ldr r0, _08110E7C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110E74: .4byte 0x020380BE
_08110E78: .4byte 0x020380D7
_08110E7C: .4byte 0x08110E81
	thumb_func_end sub_08110E04

	thumb_func_start sub_08110E80
sub_08110E80: @ 0x08110E80
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _08110EB4
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
_08110EB4:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	bne _08110EC8
	adds r0, r3, #0
	bl DestroyAnimSprite
_08110EC8:
	pop {r0}
	bx r0
	thumb_func_end sub_08110E80

	thumb_func_start sub_08110ECC
sub_08110ECC: @ 0x08110ECC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	ldr r0, _08110EF0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110EF0: .4byte 0x08110EF5
	thumb_func_end sub_08110ECC

	thumb_func_start sub_08110EF4
sub_08110EF4: @ 0x08110EF4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0x13
	bgt _08110F08
	adds r0, r1, #1
	strh r0, [r4, #0x32]
	b _08110F46
_08110F08:
	ldrh r1, [r4, #0x30]
	adds r0, r1, #1
	strh r0, [r4, #0x30]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08110F46
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
	bne _08110F46
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08110F4C
	str r0, [r4, #0x1c]
_08110F46:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110F4C: .4byte 0x08110F51
	thumb_func_end sub_08110EF4

	thumb_func_start sub_08110F50
sub_08110F50: @ 0x08110F50
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
	thumb_func_end sub_08110F50

	thumb_func_start AnimTranslateStinger
AnimTranslateStinger: @ 0x08110F70
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08110F90
	ldr r1, _08110F8C
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
	b _08110FB2
	.align 2, 0
_08110F8C: .4byte 0x020380BE
_08110F90:
	ldr r0, _0811108C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08110FB2
	ldr r1, _08111090
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	strh r0, [r1, #6]
_08110FB2:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08111002
	ldr r0, _0811108C
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r5, _08111094
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _08111002
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08110FF0
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08111002
_08110FF0:
	ldr r0, _08111090
	movs r2, #4
	ldrsh r1, [r0, r2]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r1, r1, #0
	strh r1, [r0]
_08111002:
	adds r0, r7, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r5, _08111094
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	ldr r6, _08111090
	lsrs r4, r4, #0x18
	ldrh r0, [r6, #4]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r6, #6]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	ldrh r2, [r7, #0x20]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r7, #0x22]
	lsrs r5, r1, #0x10
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
	adds r0, r7, #0
	movs r1, #0
	adds r2, r3, #0
	bl TrySetSpriteRotScale
	ldrh r0, [r6, #8]
	strh r0, [r7, #0x2e]
	strh r4, [r7, #0x32]
	strh r5, [r7, #0x36]
	ldr r0, _08111098
	str r0, [r7, #0x1c]
	ldr r1, _0811109C
	adds r0, r7, #0
	bl StoreSpriteCallbackInData6
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811108C: .4byte 0x020380D6
_08111090: .4byte 0x020380BE
_08111094: .4byte 0x020380D7
_08111098: .4byte 0x080A67B5
_0811109C: .4byte 0x080A34C5
	thumb_func_end AnimTranslateStinger

	thumb_func_start AnimMissileArc
AnimMissileArc: @ 0x081110A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _0811110C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081110C0
	ldr r1, _08111110
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_081110C0:
	ldr r4, _08111110
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x2e]
	ldr r5, _08111114
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r6, #0x32]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #6]
	adds r0, r0, r1
	strh r0, [r6, #0x36]
	ldrh r0, [r4, #0xa]
	strh r0, [r6, #0x38]
	adds r0, r6, #0
	bl InitAnimArcTranslation
	ldr r0, _08111118
	str r0, [r6, #0x1c]
	adds r2, r6, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811110C: .4byte 0x020380D6
_08111110: .4byte 0x020380BE
_08111114: .4byte 0x020380D7
_08111118: .4byte 0x0811111D
	thumb_func_end AnimMissileArc

	thumb_func_start AnimMissileArcStep
AnimMissileArcStep: @ 0x0811111C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2]
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08111148
	adds r0, r4, #0
	bl DestroyAnimSprite
	b _081111D8
_08111148:
	movs r0, #0x2e
	adds r0, r0, r4
	mov r8, r0
	ldrh r7, [r4, #0x20]
	ldrh r5, [r4, #0x24]
	ldrh r1, [r4, #0x22]
	mov ip, r1
	ldrh r6, [r4, #0x26]
	mov r2, r8
	add r1, sp, #4
	movs r3, #7
_0811115E:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _0811115E
	adds r0, r7, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r2, ip
	adds r0, r2, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081111D8
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r1, r1, r2
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
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
	adds r0, r4, #0
	movs r1, #0
	adds r2, r3, #0
	bl TrySetSpriteRotScale
	add r2, sp, #4
	mov r1, r8
	movs r3, #7
_081111CA:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _081111CA
_081111D8:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end AnimMissileArcStep

	thumb_func_start sub_081111E4
sub_081111E4: @ 0x081111E4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _081111F8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08111200
	ldr r4, _081111FC
	b _08111202
	.align 2, 0
_081111F8: .4byte 0x020380BE
_081111FC: .4byte 0x020380D6
_08111200:
	ldr r4, _08111234
_08111202:
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
	adds r0, #0x12
	strh r0, [r5, #0x22]
	ldr r1, _08111238
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0811123C
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111234: .4byte 0x020380D7
_08111238: .4byte 0x080A6015
_0811123C: .4byte 0x080A6085
	thumb_func_end sub_081111E4

