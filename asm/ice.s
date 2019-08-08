.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0810BF14
sub_0810BF14: @ 0x0810BF14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldrh r2, [r5, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #7
	ldr r3, _0810C01C
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0810C020
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	ldr r4, _0810C024
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r4, _0810C028
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r4]
	movs r1, #3
	str r3, [sp]
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0810C02C
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x2e]
	ldrh r0, [r1]
	ldr r3, [sp]
	adds r0, r0, r3
	strh r0, [r5, #0x30]
	ldrh r0, [r1, #4]
	mov r4, sb
	adds r0, r4, r0
	strh r0, [r5, #0x32]
	ldrh r0, [r1, #2]
	adds r0, r0, r6
	strh r0, [r5, #0x34]
	ldrh r0, [r1, #6]
	mov r7, r8
	adds r0, r7, r0
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl sub_080A5DB4
	adds r4, #0x20
	movs r0, #0x98
	lsls r0, r0, #1
	mov ip, r0
	ldr r3, [sp]
	cmp r4, ip
	bhi _0810BFEE
	adds r0, r7, #0
	adds r0, #0x20
	ldrh r1, [r5, #0x30]
	ldrh r2, [r5, #0x32]
	cmp r0, #0xe0
	bhi _0810BFEE
	adds r4, r1, #0
	mov sl, ip
_0810BFBA:
	mov r7, sb
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r4
	lsls r1, r1, #0x10
	mov r7, r8
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsrs r0, r1, #0x10
	mov sb, r0
	movs r7, #0x80
	lsls r7, r7, #0xe
	adds r1, r1, r7
	lsrs r1, r1, #0x10
	cmp r1, sl
	bhi _0810BFEE
	mov r1, r8
	lsls r0, r1, #0x10
	adds r0, r0, r7
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bls _0810BFBA
_0810BFEE:
	ldrh r0, [r5, #0x30]
	rsbs r7, r0, #0
	strh r7, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	rsbs r4, r0, #0
	strh r4, [r5, #0x32]
	lsls r0, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	movs r2, #0x98
	lsls r2, r2, #1
	mov ip, r2
	ldr r1, _0810C02C
	mov sl, r1
	cmp r0, ip
	bhi _0810C05A
	lsls r1, r6, #0x10
	movs r2, #0x80
	lsls r2, r2, #0xe
	adds r0, r1, r2
	b _0810C052
	.align 2, 0
_0810C01C: .4byte 0x000003FF
_0810C020: .4byte 0xFFFFFC00
_0810C024: .4byte 0x020380D7
_0810C028: .4byte 0x020380D6
_0810C02C: .4byte 0x020380BE
_0810C030:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r7
	lsls r1, r1, #0x10
	asrs r0, r2, #0x10
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsrs r3, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	cmp r1, ip
	bhi _0810C05A
	lsls r1, r6, #0x10
	adds r0, r1, r0
_0810C052:
	lsrs r0, r0, #0x10
	adds r2, r1, #0
	cmp r0, #0xe0
	bls _0810C030
_0810C05A:
	strh r3, [r5, #0x20]
	strh r6, [r5, #0x22]
	mov r1, sl
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x2e]
	strh r3, [r5, #0x30]
	mov r2, sb
	strh r2, [r5, #0x32]
	strh r6, [r5, #0x34]
	mov r3, r8
	strh r3, [r5, #0x36]
	adds r0, r5, #0
	bl sub_080A5DB4
	mov r7, sl
	ldrh r0, [r7, #0xa]
	strh r0, [r5, #0x34]
	ldrh r0, [r7, #0xc]
	strh r0, [r5, #0x36]
	ldr r0, _0810C094
	str r0, [r5, #0x1c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C094: .4byte 0x0810C099
	thumb_func_end sub_0810BF14

	thumb_func_start sub_0810C098
sub_0810C098: @ 0x0810C098
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0810C0F0
	ldrh r1, [r4, #0x30]
	ldrh r2, [r4, #0x38]
	adds r1, r1, r2
	strh r1, [r4, #0x38]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x3a]
	adds r0, r0, r2
	strh r0, [r4, #0x3a]
	strh r1, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x36]
	ldrh r2, [r4, #0x3c]
	adds r0, r0, r2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	b _0810C0F6
_0810C0F0:
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810C0F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810C098

	thumb_func_start AnimIcePunchSwirlingParticle
AnimIcePunchSwirlingParticle: @ 0x0810C0FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0810C130
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	movs r0, #0x3c
	strh r0, [r4, #0x30]
	movs r0, #9
	strh r0, [r4, #0x32]
	movs r0, #0x1e
	strh r0, [r4, #0x34]
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r4, #0x36]
	ldr r1, _0810C134
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r1, _0810C138
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C130: .4byte 0x020380BE
_0810C134: .4byte 0x080A34C5
_0810C138: .4byte 0x080A5C15
	thumb_func_end AnimIcePunchSwirlingParticle

	thumb_func_start AnimIceBeamParticle
AnimIceBeamParticle: @ 0x0810C13C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _0810C170
	ldrb r0, [r0]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldr r0, _0810C174
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810C17C
	ldr r0, _0810C178
	ldrh r1, [r4, #0x32]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r4, #0x32]
	b _0810C186
	.align 2, 0
_0810C170: .4byte 0x020380D7
_0810C174: .4byte 0x020380D6
_0810C178: .4byte 0x020380BE
_0810C17C:
	ldr r0, _0810C1B4
	ldrh r0, [r0, #4]
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
_0810C186:
	ldr r0, _0810C1B8
	ldrb r0, [r0]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r1, _0810C1B4
	lsrs r0, r0, #0x18
	ldrh r2, [r1, #6]
	adds r0, r0, r2
	strh r0, [r4, #0x36]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	ldr r1, _0810C1BC
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810C1C0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C1B4: .4byte 0x020380BE
_0810C1B8: .4byte 0x020380D7
_0810C1BC: .4byte 0x080A34C5
_0810C1C0: .4byte 0x080A67B5
	thumb_func_end AnimIceBeamParticle

	thumb_func_start AnimIceEffectParticle
AnimIceEffectParticle: @ 0x0810C1C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0810C1DC
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0810C1E0
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	b _0810C216
	.align 2, 0
_0810C1DC: .4byte 0x020380BE
_0810C1E0:
	ldr r0, _0810C228
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #1
	bl SetAverageBattlerPositions
	ldr r0, _0810C22C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810C206
	ldrh r0, [r5]
	rsbs r0, r0, #0
	strh r0, [r5]
_0810C206:
	ldrh r0, [r5]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
_0810C216:
	ldr r1, _0810C230
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810C234
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C228: .4byte 0x020380D7
_0810C22C: .4byte 0x020380D6
_0810C230: .4byte 0x0810C239
_0810C234: .4byte 0x080A6085
	thumb_func_end AnimIceEffectParticle

	thumb_func_start AnimFlickerIceEffectParticle
AnimFlickerIceEffectParticle: @ 0x0810C238
	push {lr}
	adds r3, r0, #0
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
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0810C26E
	adds r0, r3, #0
	bl DestroySpriteAndMatrix
_0810C26E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimFlickerIceEffectParticle

	thumb_func_start AnimSwirlingSnowball_Step1
AnimSwirlingSnowball_Step1: @ 0x0810C274
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r6, _0810C2BC
	ldrh r0, [r6, #8]
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0810C2C4
	ldr r4, _0810C2C0
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
	ldrh r6, [r6, #6]
	adds r0, r0, r6
	strh r0, [r5, #0x36]
	b _0810C2D6
	.align 2, 0
_0810C2BC: .4byte 0x020380BE
_0810C2C0: .4byte 0x020380D7
_0810C2C4:
	ldr r0, _0810C2F0
	ldrb r0, [r0]
	adds r2, r5, #0
	adds r2, #0x32
	adds r3, r5, #0
	adds r3, #0x36
	movs r1, #1
	bl SetAverageBattlerPositions
_0810C2D6:
	ldr r0, _0810C2F4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810C2FC
	ldr r0, _0810C2F8
	ldrh r1, [r5, #0x32]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x32]
	b _0810C306
	.align 2, 0
_0810C2F0: .4byte 0x020380D7
_0810C2F4: .4byte 0x020380D6
_0810C2F8: .4byte 0x020380BE
_0810C2FC:
	ldr r0, _0810C3A4
	ldrh r0, [r0, #4]
	ldrh r2, [r5, #0x32]
	adds r0, r0, r2
	strh r0, [r5, #0x32]
_0810C306:
	adds r7, r5, #0
	adds r7, #0x2e
	adds r2, r7, #0
	mov r1, sp
	movs r4, #7
_0810C310:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bge _0810C310
	adds r0, r5, #0
	bl InitAnimFastLinearTranslationWithSpeed
	ldrh r0, [r5, #0x30]
	movs r1, #1
	eors r0, r1
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	eors r0, r1
	strh r0, [r5, #0x32]
_0810C332:
	movs r0, #1
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl AnimFastTranslateLinear
	movs r0, #0x20
	ldrsh r1, [r5, r0]
	movs r2, #0x24
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	adds r1, #0x10
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0810C366
	movs r0, #0x22
	ldrsh r1, [r5, r0]
	movs r2, #0x26
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	cmp r1, #0xa0
	bgt _0810C366
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0810C332
_0810C366:
	ldrh r0, [r5, #0x24]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x26]
	ldrh r2, [r5, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	strh r1, [r5, #0x26]
	strh r1, [r5, #0x24]
	ldr r6, _0810C3A8
	ldr r1, _0810C3AC
	mov r3, sp
	adds r2, r7, #0
	movs r4, #7
_0810C386:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bge _0810C386
	str r6, [r5, #0x1c]
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C3A4: .4byte 0x020380BE
_0810C3A8: .4byte 0x080A6A55
_0810C3AC: .4byte 0x0810C3B1
	thumb_func_end AnimSwirlingSnowball_Step1

	thumb_func_start AnimSwirlingSnowball_Step2
AnimSwirlingSnowball_Step2: @ 0x0810C3B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	movs r5, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x24]
	movs r0, #0x80
	strh r0, [r4, #0x2e]
	ldr r0, _0810C40C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _0810C410
	cmp r0, #0
	beq _0810C3E0
	movs r1, #0x14
_0810C3E0:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Sin
	strh r0, [r4, #0x34]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #0xf
	bl Cos
	strh r0, [r4, #0x36]
	strh r5, [r4, #0x38]
	ldr r1, _0810C414
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C40C: .4byte 0x020380D6
_0810C410: .4byte 0x0000FFEC
_0810C414: .4byte 0x0810C419
	thumb_func_end AnimSwirlingSnowball_Step2

	thumb_func_start AnimSwirlingSnowball_Step3
AnimSwirlingSnowball_Step3: @ 0x0810C418
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0810C46C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _0810C470
	cmp r0, #0
	beq _0810C42E
	movs r1, #0x14
_0810C42E:
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #0x1f
	bgt _0810C474
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Sin
	ldrh r1, [r4, #0x34]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #0xf
	bl Cos
	ldrh r1, [r4, #0x36]
	subs r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	adds r0, #0x10
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	b _0810C492
	.align 2, 0
_0810C46C: .4byte 0x020380D6
_0810C470: .4byte 0x0000FFEC
_0810C474:
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
	strh r1, [r4, #0x36]
	strh r1, [r4, #0x34]
	ldr r0, _0810C498
	str r0, [r4, #0x1c]
_0810C492:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C498: .4byte 0x0810C49D
	thumb_func_end AnimSwirlingSnowball_Step3

	thumb_func_start AnimSwirlingSnowball_End
AnimSwirlingSnowball_End: @ 0x0810C49C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl AnimFastTranslateLinear
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	adds r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0810C4D8
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	adds r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0810C4D8
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0810C4DE
_0810C4D8:
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810C4DE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimSwirlingSnowball_End

	thumb_func_start AnimMoveParticleBeyondTarget
AnimMoveParticleBeyondTarget: @ 0x0810C4E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r1, _0810C528
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0810C530
	ldr r4, _0810C52C
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
	b _0810C542
	.align 2, 0
_0810C528: .4byte 0x020380BE
_0810C52C: .4byte 0x020380D7
_0810C530:
	ldr r0, _0810C560
	ldrb r0, [r0]
	adds r2, r5, #0
	adds r2, #0x32
	adds r3, r5, #0
	adds r3, #0x36
	movs r1, #1
	bl SetAverageBattlerPositions
_0810C542:
	ldr r0, _0810C564
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810C56C
	ldr r0, _0810C568
	ldrh r1, [r5, #0x32]
	ldrh r2, [r0, #4]
	subs r1, r1, r2
	strh r1, [r5, #0x32]
	adds r1, r0, #0
	b _0810C576
	.align 2, 0
_0810C560: .4byte 0x020380D7
_0810C564: .4byte 0x020380D6
_0810C568: .4byte 0x020380BE
_0810C56C:
	ldr r1, _0810C620
	ldrh r0, [r1, #4]
	ldrh r2, [r5, #0x32]
	adds r0, r0, r2
	strh r0, [r5, #0x32]
_0810C576:
	ldrh r0, [r1, #6]
	ldrh r1, [r5, #0x36]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl InitAnimFastLinearTranslationWithSpeed
	adds r7, r5, #0
	adds r7, #0x2e
	adds r2, r7, #0
	mov r1, sp
	movs r4, #7
_0810C58E:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bge _0810C58E
	ldrh r0, [r5, #0x30]
	movs r1, #1
	eors r0, r1
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	eors r0, r1
	strh r0, [r5, #0x32]
_0810C5AA:
	movs r0, #1
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl AnimFastTranslateLinear
	movs r2, #0x20
	ldrsh r1, [r5, r2]
	movs r2, #0x24
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	adds r1, #0x10
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0810C5DE
	movs r0, #0x22
	ldrsh r1, [r5, r0]
	movs r2, #0x26
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	cmp r1, #0xa0
	bgt _0810C5DE
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0810C5AA
_0810C5DE:
	ldrh r0, [r5, #0x24]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x26]
	ldrh r2, [r5, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	strh r1, [r5, #0x26]
	strh r1, [r5, #0x24]
	ldr r1, _0810C620
	ldr r6, _0810C624
	mov r3, sp
	adds r2, r7, #0
	movs r4, #7
_0810C5FE:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bge _0810C5FE
	ldrh r0, [r1, #0xa]
	strh r0, [r5, #0x38]
	ldrh r0, [r1, #0xc]
	strh r0, [r5, #0x3a]
	str r6, [r5, #0x1c]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C620: .4byte 0x020380BE
_0810C624: .4byte 0x0810C629
	thumb_func_end AnimMoveParticleBeyondTarget

	thumb_func_start AnimWiggleParticleTowardsTarget
AnimWiggleParticleTowardsTarget: @ 0x0810C628
	push {r4, lr}
	adds r4, r0, #0
	bl AnimFastTranslateLinear
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810C63C
	movs r0, #1
	strh r0, [r4, #0x2e]
_0810C63C:
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3a]
	ldrh r2, [r4, #0x3c]
	adds r0, r0, r2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3c]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _0810C692
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	adds r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0810C68C
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	cmp r1, #0xa0
	bgt _0810C68C
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0810C692
_0810C68C:
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810C692:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimWiggleParticleTowardsTarget

	thumb_func_start AnimWaveFromCenterOfTarget
AnimWaveFromCenterOfTarget: @ 0x0810C698
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810C704
	ldr r5, _0810C6B8
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0810C6BC
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	b _0810C6F2
	.align 2, 0
_0810C6B8: .4byte 0x020380BE
_0810C6BC:
	ldr r0, _0810C6FC
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #0
	bl SetAverageBattlerPositions
	ldr r0, _0810C700
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810C6E2
	ldrh r0, [r5]
	rsbs r0, r0, #0
	strh r0, [r5]
_0810C6E2:
	ldrh r0, [r5]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
_0810C6F2:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0810C718
	.align 2, 0
_0810C6FC: .4byte 0x020380D7
_0810C700: .4byte 0x020380D6
_0810C704:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0810C718
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810C718:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimWaveFromCenterOfTarget

	thumb_func_start InitSwirlingFogAnim
InitSwirlingFogAnim: @ 0x0810C720
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0810C740
	movs r1, #8
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0810C790
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0810C744
	adds r0, r5, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	b _0810C782
	.align 2, 0
_0810C740: .4byte 0x020380BE
_0810C744:
	ldr r4, _0810C76C
	ldrb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x20
	adds r3, r5, #0
	adds r3, #0x22
	movs r1, #0
	bl SetAverageBattlerPositions
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810C770
	ldrh r0, [r5, #0x20]
	ldrh r1, [r6]
	subs r0, r0, r1
	b _0810C776
	.align 2, 0
_0810C76C: .4byte 0x020380D6
_0810C770:
	ldrh r0, [r6]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
_0810C776:
	strh r0, [r5, #0x20]
	ldr r0, _0810C788
	ldrh r0, [r0, #2]
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
_0810C782:
	ldr r0, _0810C78C
	b _0810C7E0
	.align 2, 0
_0810C788: .4byte 0x020380BE
_0810C78C: .4byte 0x020380D6
_0810C790:
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0810C7A2
	adds r0, r5, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	b _0810C7DE
_0810C7A2:
	ldr r4, _0810C7C8
	ldrb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x20
	adds r3, r5, #0
	adds r3, #0x22
	movs r1, #0
	bl SetAverageBattlerPositions
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810C7CC
	ldrh r0, [r5, #0x20]
	ldrh r1, [r6]
	subs r0, r0, r1
	b _0810C7D2
	.align 2, 0
_0810C7C8: .4byte 0x020380D7
_0810C7CC:
	ldrh r0, [r6]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
_0810C7D2:
	strh r0, [r5, #0x20]
	ldr r0, _0810C7FC
	ldrh r0, [r0, #2]
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
_0810C7DE:
	ldr r0, _0810C800
_0810C7E0:
	ldrb r0, [r0]
	strh r0, [r5, #0x3c]
	ldr r0, _0810C7FC
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0810C7F8
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810C804
_0810C7F8:
	movs r0, #0x20
	b _0810C806
	.align 2, 0
_0810C7FC: .4byte 0x020380BE
_0810C800: .4byte 0x020380D7
_0810C804:
	movs r0, #0x40
_0810C806:
	strh r0, [r5, #0x3a]
	ldr r0, _0810C84C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810C81C
	ldrh r0, [r5, #0x22]
	adds r0, #8
	strh r0, [r5, #0x22]
_0810C81C:
	ldr r1, _0810C850
	ldrh r0, [r1, #6]
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	ldrh r1, [r1, #4]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl InitAnimLinearTranslation
	movs r0, #0x40
	strh r0, [r5, #0x38]
	ldr r1, _0810C854
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810C84C: .4byte 0x020380D7
_0810C850: .4byte 0x020380BE
_0810C854: .4byte 0x0810C859
	thumb_func_end InitSwirlingFogAnim

	thumb_func_start AnimSwirlingFogAnim
AnimSwirlingFogAnim: @ 0x0810C858
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810C8E2
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	movs r1, #6
	rsbs r1, r1, #0
	bl Cos
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x38]
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bhi _0810C8B4
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSpriteBGPriority
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	b _0810C8D6
_0810C8B4:
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSpriteBGPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #1
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	ldrb r2, [r4, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #5]
_0810C8D6:
	ldrh r0, [r4, #0x38]
	adds r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	b _0810C8E8
_0810C8E2:
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810C8E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimSwirlingFogAnim

	thumb_func_start AnimTask_Haze1
AnimTask_Haze1: @ 0x0810C8F0
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0810C994
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
	bne _0810C932
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
_0810C932:
	ldr r0, _0810C998
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0810C99C
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
	ldr r1, _0810C9A0
	movs r2, #0x80
	lsls r2, r2, #4
	mov r3, sp
	ldrh r3, [r3, #0xa]
	bl LoadBgTiles
	ldr r1, _0810C9A4
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
	ldr r0, _0810C9A8
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _0810C9AC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0810C9B0
	str r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C994: .4byte 0x00003F42
_0810C998: .4byte 0x02022ACC
_0810C99C: .4byte 0x02022ACE
_0810C9A0: .4byte 0x0852776C
_0810C9A4: .4byte 0x08D93294
_0810C9A8: .4byte 0x08526F0C
_0810C9AC: .4byte 0x03005B60
_0810C9B0: .4byte 0x0810C9B5
	thumb_func_end AnimTask_Haze1

	thumb_func_start AnimTask_Haze2
AnimTask_Haze2: @ 0x0810C9B4
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0810C9E8
	ldr r2, _0810C9EC
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	ldr r1, _0810C9F0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0x20
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #4
	bls _0810C9DE
	b _0810CB2A
_0810C9DE:
	lsls r0, r0, #2
	ldr r1, _0810C9F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810C9E8: .4byte 0x02022ACC
_0810C9EC: .4byte 0x0000FFFF
_0810C9F0: .4byte 0x03005B60
_0810C9F4: .4byte 0x0810C9F8
_0810C9F8: @ jump table
	.4byte _0810CA0C @ case 0
	.4byte _0810CA64 @ case 1
	.4byte _0810CA86 @ case 2
	.4byte _0810CACA @ case 3
	.4byte _0810CAEC @ case 4
_0810CA0C:
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
	beq _0810CA26
	b _0810CB2A
_0810CA26:
	strh r5, [r4, #0x1c]
	ldrh r0, [r4, #0x1a]
	adds r0, #1
	strh r0, [r4, #0x1a]
	ldr r1, _0810CA60
	movs r2, #0x1a
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
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
	cmp r0, #9
	bne _0810CB2A
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	strh r5, [r4, #0x1e]
	b _0810CB2A
	.align 2, 0
_0810CA60: .4byte 0x08571840
_0810CA64:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	strh r0, [r1, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x51
	bne _0810CB2A
	movs r0, #9
	strh r0, [r1, #0x1e]
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
	b _0810CB2A
_0810CA86:
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
	bne _0810CB2A
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
	bne _0810CB2A
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	strh r1, [r4, #0x1e]
	b _0810CB2A
_0810CACA:
	mov r0, sp
	bl sub_080A63F8
	movs r0, #1
	bl sub_080A6530
	movs r0, #2
	bl sub_080A6530
	ldr r0, _0810CB34
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
_0810CAEC:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810CB00
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_0810CB00:
	ldr r0, _0810CB38
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0810CB3C
	strh r1, [r0]
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
_0810CB2A:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810CB34: .4byte 0x03005B60
_0810CB38: .4byte 0x02022ACC
_0810CB3C: .4byte 0x02022ACE
	thumb_func_end AnimTask_Haze2

	thumb_func_start AnimThrowMistBall
AnimThrowMistBall: @ 0x0810CB40
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0810CB6C
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
	ldr r0, _0810CB70
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810CB6C: .4byte 0x020380D6
_0810CB70: .4byte 0x080A70E9
	thumb_func_end AnimThrowMistBall

	thumb_func_start AnimTask_LoadMistTiles
AnimTask_LoadMistTiles: @ 0x0810CB74
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0810CC1C
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
	bne _0810CBB6
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
_0810CBB6:
	ldr r0, _0810CC20
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0810CC24
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
	ldr r1, _0810CC28
	movs r2, #0x80
	lsls r2, r2, #4
	mov r3, sp
	ldrh r3, [r3, #0xa]
	bl LoadBgTiles
	ldr r1, _0810CC2C
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
	ldr r0, _0810CC30
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _0810CC34
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0810CC38
	strh r1, [r0, #0x26]
	ldr r1, _0810CC3C
	str r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810CC1C: .4byte 0x00003F42
_0810CC20: .4byte 0x02022ACC
_0810CC24: .4byte 0x02022ACE
_0810CC28: .4byte 0x0852776C
_0810CC2C: .4byte 0x08D93294
_0810CC30: .4byte 0x08526F0C
_0810CC34: .4byte 0x03005B60
_0810CC38: .4byte 0x0000FFFF
_0810CC3C: .4byte 0x0810CC41
	thumb_func_end AnimTask_LoadMistTiles

	thumb_func_start AnimTask_OverlayFogTiles
AnimTask_OverlayFogTiles: @ 0x0810CC40
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _0810CC70
	ldr r3, _0810CC74
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrh r0, [r1, #0x26]
	ldrh r5, [r2]
	adds r0, r0, r5
	strh r0, [r2]
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	cmp r0, #4
	bls _0810CC66
	b _0810CD9A
_0810CC66:
	lsls r0, r0, #2
	ldr r1, _0810CC78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810CC70: .4byte 0x02022ACC
_0810CC74: .4byte 0x03005B60
_0810CC78: .4byte 0x0810CC7C
_0810CC7C: @ jump table
	.4byte _0810CC90 @ case 0
	.4byte _0810CCD4 @ case 1
	.4byte _0810CCF6 @ case 2
	.4byte _0810CD3A @ case 3
	.4byte _0810CD5C @ case 4
_0810CC90:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r3
	ldrh r0, [r4, #0x1a]
	adds r0, #1
	strh r0, [r4, #0x1a]
	ldr r1, _0810CCD0
	movs r5, #0x1a
	ldrsh r0, [r4, r5]
	adds r0, r0, r1
	ldrb r1, [r0]
	strh r1, [r4, #0x1e]
	movs r0, #0x11
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bne _0810CD9A
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x1e]
	b _0810CD9A
	.align 2, 0
_0810CCD0: .4byte 0x0857186C
_0810CCD4:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r3
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	strh r0, [r1, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x51
	bne _0810CD9A
	movs r0, #5
	strh r0, [r1, #0x1e]
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
	b _0810CD9A
_0810CCF6:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r3
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0810CD9A
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
	bne _0810CD9A
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	strh r1, [r4, #0x1e]
	b _0810CD9A
_0810CD3A:
	mov r0, sp
	bl sub_080A63F8
	movs r0, #1
	bl sub_080A6530
	movs r0, #2
	bl sub_080A6530
	ldr r0, _0810CDA4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
_0810CD5C:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810CD70
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_0810CD70:
	ldr r0, _0810CDA8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0810CDAC
	strh r1, [r0]
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
_0810CD9A:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810CDA4: .4byte 0x03005B60
_0810CDA8: .4byte 0x02022ACC
_0810CDAC: .4byte 0x02022ACE
	thumb_func_end AnimTask_OverlayFogTiles

	thumb_func_start InitPoisonGasCloudAnim
InitPoisonGasCloudAnim: @ 0x0810CDB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r6, _0810CE98
	ldrh r0, [r6]
	strh r0, [r5, #0x2e]
	ldr r0, _0810CE9C
	mov r8, r0
	ldrb r0, [r0]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	ldr r7, _0810CEA0
	ldrb r0, [r7]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bhs _0810CDE4
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r5, #0x3c]
_0810CDE4:
	ldr r3, _0810CEA4
	ldrb r0, [r7]
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0810CE44
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r6, #2]
	ldrh r0, [r6, #6]
	rsbs r0, r0, #0
	strh r0, [r6, #6]
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0810CE40
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0810CE40
	movs r0, #1
	bl GetAnimBattlerSpriteId
	ldr r2, _0810CEA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x43
	ldrb r0, [r1]
	adds r0, #1
	adds r1, r5, #0
	adds r1, #0x43
	strb r0, [r1]
_0810CE40:
	movs r0, #1
	strh r0, [r5, #0x3a]
_0810CE44:
	ldr r4, _0810CE9C
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
	ldr r6, _0810CE98
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _0810CEAC
	ldrh r0, [r6, #2]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
	ldr r4, _0810CEA0
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #6]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x34]
	ldrb r0, [r4]
	movs r1, #3
	b _0810CED4
	.align 2, 0
_0810CE98: .4byte 0x020380BE
_0810CE9C: .4byte 0x020380D6
_0810CEA0: .4byte 0x020380D7
_0810CEA4: .4byte 0x02023D1A
_0810CEA8: .4byte 0x020205AC
_0810CEAC:
	ldrh r0, [r6, #2]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
	ldr r4, _0810CF1C
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #6]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x34]
	ldrb r0, [r4]
	movs r1, #1
_0810CED4:
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r6, [r6, #8]
	adds r0, r0, r6
	strh r0, [r5, #0x36]
	ldrb r0, [r4]
	bl GetBattlerSpriteBGPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #0x3c]
	orrs r0, r1
	strh r0, [r5, #0x3c]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810CF08
	movs r0, #1
	strh r0, [r5, #0x3a]
	adds r1, r5, #0
	adds r1, #0x43
	movs r0, #0x80
	strb r0, [r1]
_0810CF08:
	adds r0, r5, #0
	bl InitAnimLinearTranslation
	ldr r0, _0810CF20
	str r0, [r5, #0x1c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810CF1C: .4byte 0x020380D7
_0810CF20: .4byte 0x0810CF25
	thumb_func_end InitPoisonGasCloudAnim

	thumb_func_start MovePoisonGasCloud
MovePoisonGasCloud: @ 0x0810CF24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	movs r5, #0xff
	movs r1, #0xff
	ands r1, r0
	cmp r1, #1
	beq _0810D00C
	cmp r1, #1
	bgt _0810CF3E
	cmp r1, #0
	beq _0810CF46
	b _0810D15C
_0810CF3E:
	cmp r1, #2
	bne _0810CF44
	b _0810D120
_0810CF44:
	b _0810D15C
_0810CF46:
	adds r0, r4, #0
	bl AnimTranslateLinear
	ldr r1, _0810CF70
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #4
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	strh r0, [r4, #0x24]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0810CF74
	ldrh r0, [r4, #0x38]
	subs r0, #8
	b _0810CF78
	.align 2, 0
_0810CF70: .4byte 0x082FA8CC
_0810CF74:
	ldrh r0, [r4, #0x38]
	adds r0, #8
_0810CF78:
	ands r0, r5
	strh r0, [r4, #0x38]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _0810CF86
	b _0810D15C
_0810CF86:
	movs r5, #0x50
	strh r5, [r4, #0x2e]
	ldr r6, _0810CFD4
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x26]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	adds r0, #0x1d
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810CFDC
	ldr r1, _0810CFD8
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0810CFDC
	movs r0, #0xcc
	strh r0, [r4, #0x38]
	b _0810CFDE
	.align 2, 0
_0810CFD4: .4byte 0x020380D7
_0810CFD8: .4byte 0x02023D1A
_0810CFDC:
	strh r5, [r4, #0x38]
_0810CFDE:
	movs r0, #0
	strh r0, [r4, #0x26]
	ldr r1, _0810D008
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #3
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x38]
	adds r0, #2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	b _0810D15C
	.align 2, 0
_0810D008: .4byte 0x082FA8CC
_0810D00C:
	adds r0, r4, #0
	bl AnimTranslateLinear
	ldr r1, _0810D068
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r0, r0, #3
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	strh r0, [r4, #0x24]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810D08A
	ldrh r1, [r4, #0x38]
	adds r0, r1, #0
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #0x7f
	bhi _0810D06C
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	b _0810D074
	.align 2, 0
_0810D068: .4byte 0x082FA8CC
_0810D06C:
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r1, #1
_0810D074:
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	adds r0, r3, #4
	b _0810D0AA
_0810D08A:
	ldrh r0, [r4, #0x38]
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bhi _0810D09E
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x80
	b _0810D0A4
_0810D09E:
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x8c
_0810D0A4:
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	subs r0, #4
_0810D0AA:
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _0810D15C
	movs r5, #0
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	adds r0, #4
	strh r0, [r4, #0x36]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810D104
	ldr r1, _0810D0FC
	ldr r0, _0810D100
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0810D104
	movs r0, #0x80
	lsls r0, r0, #1
	b _0810D106
	.align 2, 0
_0810D0FC: .4byte 0x02023D1A
_0810D100: .4byte 0x020380D7
_0810D104:
	ldr r0, _0810D11C
_0810D106:
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x3c]
	strh r1, [r4, #0x26]
	strh r1, [r4, #0x24]
	adds r0, r4, #0
	bl sub_080A689C
	b _0810D15C
	.align 2, 0
_0810D11C: .4byte 0x0000FFF0
_0810D120:
	adds r0, r4, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810D15C
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0810D14E
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
_0810D14E:
	adds r0, r4, #0
	bl DestroySprite
	ldr r1, _0810D164
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0810D15C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810D164: .4byte 0x0203809E
	thumb_func_end MovePoisonGasCloud

	thumb_func_start AnimTask_Hail1
AnimTask_Hail1: @ 0x0810D168
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0810D17C
	adds r1, r1, r0
	ldr r0, _0810D180
	str r0, [r1]
	bx lr
	.align 2, 0
_0810D17C: .4byte 0x03005B60
_0810D180: .4byte 0x0810D185
	thumb_func_end AnimTask_Hail1

	thumb_func_start AnimTask_Hail2
AnimTask_Hail2: @ 0x0810D184
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0810D1A8
	adds r4, r0, r1
	movs r0, #8
	ldrsh r5, [r4, r0]
	cmp r5, #1
	beq _0810D1C8
	cmp r5, #1
	bgt _0810D1AC
	cmp r5, #0
	beq _0810D1B2
	b _0810D22C
	.align 2, 0
_0810D1A8: .4byte 0x03005B60
_0810D1AC:
	cmp r5, #2
	beq _0810D21E
	b _0810D22C
_0810D1B2:
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0810D22C
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	strh r5, [r4, #0xc]
	b _0810D204
_0810D1C8:
	ldrh r1, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0810D218
	ldrb r0, [r4, #0xe]
	ldrb r1, [r4, #0xc]
	movs r3, #1
	bl GenerateHailParticle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810D1E8
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
_0810D1E8:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _0810D214
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _0810D20C
_0810D204:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0810D22C
_0810D20C:
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	b _0810D22C
_0810D214:
	strh r5, [r4, #0x12]
	b _0810D22C
_0810D218:
	subs r0, r1, #1
	strh r0, [r4, #0x12]
	b _0810D22C
_0810D21E:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810D22C
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_0810D22C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_Hail2

	thumb_func_start GenerateHailParticle
GenerateHailParticle: @ 0x0810D234
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	movs r1, #0
	str r1, [sp, #4]
	ldr r1, _0810D2AC
	lsrs r0, r0, #0x16
	adds r4, r0, r1
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1c
	mov r8, r0
	cmp r0, #2
	beq _0810D320
	ldrh r0, [r4, #2]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810D320
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, r8
	cmp r1, #0
	beq _0810D2B0
	cmp r1, #1
	beq _0810D2E6
	b _0810D332
	.align 2, 0
_0810D2AC: .4byte 0x08571898
_0810D2B0:
	adds r0, r5, #0
	movs r1, #1
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #6
	bl __divsi3
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	adds r0, r5, #0
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #6
	bl __divsi3
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	b _0810D31A
_0810D2E6:
	adds r0, r5, #0
	movs r1, #1
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #6
	bl __divsi3
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	adds r0, r5, #0
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #6
	bl __divsi3
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
_0810D31A:
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	b _0810D332
_0810D320:
	ldrh r0, [r4]
	lsls r0, r0, #0x16
	asrs r0, r0, #6
	lsrs r7, r0, #0x10
	ldr r0, [r4]
	lsls r0, r0, #0xc
	asrs r0, r0, #0x16
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_0810D332:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r0, #8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r0, _0810D38C
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #8
	rsbs r2, r2, #0
	movs r3, #0x12
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x40
	beq _0810D394
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, _0810D390
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sb
	bl StartSpriteAffineAnim
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x2e]
	strh r7, [r4, #0x34]
	strh r6, [r4, #0x36]
	mov r1, sb
	strh r1, [r4, #0x38]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x3a]
	mov r1, sl
	strh r1, [r4, #0x3c]
	movs r0, #1
	b _0810D396
	.align 2, 0
_0810D38C: .4byte 0x08571910
_0810D390: .4byte 0x020205AC
_0810D394:
	movs r0, #0
_0810D396:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GenerateHailParticle

	thumb_func_start AnimHailBegin
AnimHailBegin: @ 0x0810D3A8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x20]
	adds r0, #4
	strh r0, [r4, #0x20]
	ldrh r1, [r4, #0x22]
	adds r2, r1, #0
	adds r2, #8
	strh r2, [r4, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _0810D3D2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0810D482
_0810D3D2:
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r0, #1
	bne _0810D454
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810D454
	ldr r0, _0810D448
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	movs r3, #0x36
	ldrsh r2, [r4, r3]
	adds r3, r4, #0
	adds r3, #0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	cmp r0, #0x40
	beq _0810D436
	ldr r2, _0810D44C
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0810D450
	str r1, [r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x3a]
	strh r1, [r0, #0x3a]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x3c]
	strh r1, [r0, #0x3c]
_0810D436:
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	b _0810D482
	.align 2, 0
_0810D448: .4byte 0x0857174C
_0810D44C: .4byte 0x020205AC
_0810D450: .4byte 0x0810D48D
_0810D454:
	ldr r3, _0810D488
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
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl DestroySprite
_0810D482:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D488: .4byte 0x03005B60
	thumb_func_end AnimHailBegin

	thumb_func_start AnimHailContinue
AnimHailContinue: @ 0x0810D48C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0810D4CC
	ldr r3, _0810D4D4
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
_0810D4CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D4D4: .4byte 0x03005B60
	thumb_func_end AnimHailContinue

	thumb_func_start InitIceBallAnim
InitIceBallAnim: @ 0x0810D4D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0810D558
	ldr r0, [r0]
	ldrb r1, [r0, #0x11]
	lsrs r0, r1, #4
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	subs r0, r0, r1
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0810D4F6
	movs r1, #4
_0810D4F6:
	adds r0, r5, #0
	bl StartSpriteAffineAnim
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r6, _0810D55C
	ldrh r0, [r6, #8]
	strh r0, [r5, #0x2e]
	ldr r0, _0810D560
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810D51E
	ldrh r0, [r6, #4]
	rsbs r0, r0, #0
	strh r0, [r6, #4]
_0810D51E:
	ldr r4, _0810D564
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #4]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #6]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
	ldrh r0, [r6, #0xa]
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	bl InitAnimArcTranslation
	ldr r0, _0810D568
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810D558: .4byte 0x020380A0
_0810D55C: .4byte 0x020380BE
_0810D560: .4byte 0x020380D6
_0810D564: .4byte 0x020380D7
_0810D568: .4byte 0x0810D56D
	thumb_func_end InitIceBallAnim

	thumb_func_start AnimThrowIceBall
AnimThrowIceBall: @ 0x0810D56C
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810D58E
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, _0810D594
	str r0, [r4, #0x1c]
	ldr r1, _0810D598
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
_0810D58E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D594: .4byte 0x080A60A1
_0810D598: .4byte 0x080A34C5
	thumb_func_end AnimThrowIceBall

	thumb_func_start InitIceBallParticle
InitIceBallParticle: @ 0x0810D59C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #8
	ldr r3, _0810D5F0
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0810D5F4
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
	ldr r1, _0810D5F8
	ands r1, r0
	adds r0, r1, #0
	cmp r0, #0xff
	ble _0810D5E2
	subs r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0810D5E2:
	strh r5, [r4, #0x30]
	strh r1, [r4, #0x32]
	ldr r0, _0810D5FC
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810D5F0: .4byte 0x000003FF
_0810D5F4: .4byte 0xFFFFFC00
_0810D5F8: .4byte 0x000001FF
_0810D5FC: .4byte 0x0810D601
	thumb_func_end InitIceBallParticle

	thumb_func_start AnimIceBallParticle
AnimIceBallParticle: @ 0x0810D600
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
	beq _0810D624
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	b _0810D628
_0810D624:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
_0810D628:
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
	bne _0810D646
	adds r0, r2, #0
	bl DestroyAnimSprite
_0810D646:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimIceBallParticle

	thumb_func_start AnimTask_GetRolloutCounter
AnimTask_GetRolloutCounter: @ 0x0810D64C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0810D674
	ldrb r3, [r1]
	lsls r3, r3, #1
	adds r3, r3, r1
	ldr r1, _0810D678
	ldr r1, [r1]
	ldrb r1, [r1, #0x11]
	lsrs r2, r1, #4
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	subs r2, r2, r1
	subs r2, #1
	strh r2, [r3]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_0810D674: .4byte 0x020380BE
_0810D678: .4byte 0x020380A0
	thumb_func_end AnimTask_GetRolloutCounter

