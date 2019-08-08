.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DoPokeballSendOutAnimation
DoPokeballSendOutAnimation: @ 0x08074DF0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _08074E44
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08074E48
	ldr r0, [r0]
	ldr r6, _08074E4C
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _08074E50
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08074E54
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xa]
	strh r5, [r1, #0xc]
	ldrb r0, [r6]
	strh r0, [r1, #0xe]
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08074E44: .4byte 0x0202415D
_08074E48: .4byte 0x02024174
_08074E4C: .4byte 0x02023D08
_08074E50: .4byte 0x08074E59
_08074E54: .4byte 0x03005B60
	thumb_func_end DoPokeballSendOutAnimation

	thumb_func_start Task_DoPokeballSendOutAnim
Task_DoPokeballSendOutAnim: @ 0x08074E58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r0, #0
	str r0, [sp]
	ldr r1, _08074E8C
	mov r2, sl
	lsls r0, r2, #2
	add r0, sl
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #8]
	movs r3, #8
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08074E90
	adds r0, r2, #1
	strh r0, [r1, #8]
	b _0807500A
	.align 2, 0
_08074E8C: .4byte 0x03005B60
_08074E90:
	ldrh r0, [r1, #0xc]
	mov r8, r0
	ldrb r5, [r1, #0xe]
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08074EBC
	ldr r1, _08074EB4
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08074EB8
	b _08074ECA
	.align 2, 0
_08074EB4: .4byte 0x02023D12
_08074EB8: .4byte 0x020243E8
_08074EBC:
	ldr r1, _08074F38
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08074F3C
_08074ECA:
	adds r0, r0, r1
	movs r1, #0x26
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIdToBallId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl LoadBallGfx
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08074F40
	adds r0, r0, r1
	movs r1, #0x20
	movs r2, #0x50
	movs r3, #0x1d
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _08074F44
	mov sb, r2
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r6, r0, #2
	adds r4, r6, r2
	movs r0, #0x80
	strh r0, [r4, #0x2e]
	movs r3, #0
	strh r3, [r4, #0x30]
	mov r0, r8
	strh r0, [r4, #0x3c]
	mov r2, r8
	cmp r2, #0xfe
	beq _08074F50
	cmp r2, #0xff
	bne _08074F8C
	ldr r0, _08074F48
	strb r5, [r0]
	movs r0, #0x18
	strh r0, [r4, #0x20]
	movs r0, #0x44
	strh r0, [r4, #0x22]
	mov r0, sb
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _08074F4C
	str r1, [r0]
	b _08074F9A
	.align 2, 0
_08074F38: .4byte 0x02023D12
_08074F3C: .4byte 0x02024190
_08074F40: .4byte 0x082FCF94
_08074F44: .4byte 0x020205AC
_08074F48: .4byte 0x02023EB0
_08074F4C: .4byte 0x08075BBD
_08074F50:
	adds r0, r5, #0
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x18
	strh r0, [r4, #0x22]
	ldr r0, _08074F84
	strb r5, [r0]
	movs r3, #0
	strh r3, [r4, #0x2e]
	mov r0, sb
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _08074F88
	str r1, [r0]
	b _08074F9A
	.align 2, 0
_08074F84: .4byte 0x02023EB0
_08074F88: .4byte 0x08075DA1
_08074F8C:
	movs r0, #1
	bl GetBattlerAtPosition
	ldr r1, _08074FB8
	strb r0, [r1]
	movs r0, #1
	str r0, [sp]
_08074F9A:
	ldr r0, _08074FBC
	lsls r1, r7, #4
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r4, r1, r0
	ldr r5, _08074FB8
	ldrb r0, [r5]
	strh r0, [r4, #0x3a]
	ldr r2, [sp]
	cmp r2, #0
	bne _08074FC0
	mov r0, sl
	bl DestroyTask
	b _0807500A
	.align 2, 0
_08074FB8: .4byte 0x02023EB0
_08074FBC: .4byte 0x020205AC
_08074FC0:
	movs r0, #0x22
	strh r0, [r4, #0x2e]
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #0x10
	strh r0, [r4, #0x36]
	ldr r0, _0807501C
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	mov r3, sl
	strh r3, [r4, #6]
	ldr r1, _08075020
	mov r2, sl
	lsls r0, r2, #2
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r5]
	strh r1, [r0, #0x10]
	ldr r1, _08075024
	str r1, [r0]
	movs r0, #0x3d
	bl PlaySE
_0807500A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807501C: .4byte 0x0000FFD8
_08075020: .4byte 0x03005B60
_08075024: .4byte 0x080A8A41
	thumb_func_end Task_DoPokeballSendOutAnim

	thumb_func_start SpriteCB_TestBallThrow
SpriteCB_TestBallThrow: @ 0x08075028
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080750C8
	ldrb r6, [r7, #6]
	ldr r1, _080750D4
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r5, [r0, #0x10]
	ldrb r0, [r0, #0xc]
	mov r8, r0
	adds r0, r7, #0
	movs r1, #1
	bl StartSpriteAnim
	adds r2, r7, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r7, #0x24]
	ldrh r1, [r7, #0x20]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r7, #0x20]
	ldrh r0, [r7, #0x26]
	ldrh r2, [r7, #0x22]
	adds r0, r0, r2
	strh r0, [r7, #0x22]
	strh r1, [r7, #0x24]
	strh r1, [r7, #0x26]
	strh r1, [r7, #0x38]
	adds r0, r5, #0
	bl GetBattlerPokeballItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIdToBallId
	adds r4, r0, #0
	ldrh r0, [r7, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r7, #0x22]
	subs r1, #5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r2, #1
	movs r3, #0x1c
	bl AnimateBallOpenParticles
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0xe
	adds r3, r4, #0
	bl LaunchBallFadeMonTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #0x2e]
	strh r5, [r7, #0x3a]
	mov r0, r8
	strh r0, [r7, #0x3c]
	adds r0, r6, #0
	bl DestroyTask
	ldr r0, _080750D8
	str r0, [r7, #0x1c]
_080750C8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080750D4: .4byte 0x03005B60
_080750D8: .4byte 0x080750DD
	thumb_func_end SpriteCB_TestBallThrow

	thumb_func_start sub_080750DC
sub_080750DC: @ 0x080750DC
	ldr r1, _080750E4
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_080750E4: .4byte 0x080750E9
	thumb_func_end sub_080750DC

	thumb_func_start sub_080750E8
sub_080750E8: @ 0x080750E8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x38]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _08075142
	strh r7, [r6, #0x38]
	ldr r0, _08075148
	str r0, [r6, #0x1c]
	ldr r5, _0807514C
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08075150
	adds r0, r0, r4
	movs r1, #2
	bl StartSpriteAffineAnim
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl AnimateSprite
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r7, [r0, #0x30]
_08075142:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075148: .4byte 0x08075155
_0807514C: .4byte 0x02023E88
_08075150: .4byte 0x020205AC
	thumb_func_end sub_080750E8

	thumb_func_start sub_08075154
sub_08075154: @ 0x08075154
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	bne _0807516C
	movs r0, #0x3c
	bl PlaySE
_0807516C:
	ldr r6, _080751B8
	ldr r5, _080751BC
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r6
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _080751C4
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0
	strh r0, [r4, #0x38]
	ldr r0, _080751C0
	str r0, [r4, #0x1c]
	b _080751E4
	.align 2, 0
_080751B8: .4byte 0x020205AC
_080751BC: .4byte 0x02023E88
_080751C0: .4byte 0x080751ED
_080751C4:
	ldrh r0, [r1, #0x30]
	adds r0, #0x60
	strh r0, [r1, #0x30]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0x30
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	asrs r0, r0, #8
	strh r0, [r1, #0x26]
_080751E4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08075154

	thumb_func_start sub_080751EC
sub_080751EC: @ 0x080751EC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08075234
	ldrh r0, [r4, #0x38]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08075234
	strh r1, [r4, #0x34]
	movs r0, #0x20
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
	movs r0, #0
	movs r1, #0x20
	bl Cos
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r0, #0
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldr r0, _0807523C
	str r0, [r4, #0x1c]
_08075234:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807523C: .4byte 0x08075241
	thumb_func_end sub_080751EC

	thumb_func_start sub_08075240
sub_08075240: @ 0x08075240
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	ldrh r0, [r4, #0x34]
	movs r1, #0xff
	ands r1, r0
	cmp r1, #0
	beq _08075256
	cmp r1, #1
	beq _080752CA
	b _080752F6
_08075256:
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x38]
	adds r1, #4
	ldrh r2, [r4, #0x34]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r4, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x3f
	ble _080752F6
	ldrh r0, [r4, #0x36]
	subs r0, #0xa
	strh r0, [r4, #0x36]
	ldr r1, _080752A0
	adds r0, r2, r1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08075292
	movs r5, #1
_08075292:
	cmp r0, #2
	beq _080752B2
	cmp r0, #2
	bgt _080752A4
	cmp r0, #1
	beq _080752AA
	b _080752C2
	.align 2, 0
_080752A0: .4byte 0x00000101
_080752A4:
	cmp r0, #3
	beq _080752BA
	b _080752C2
_080752AA:
	movs r0, #0x38
	bl PlaySE
	b _080752F6
_080752B2:
	movs r0, #0x39
	bl PlaySE
	b _080752F6
_080752BA:
	movs r0, #0x3a
	bl PlaySE
	b _080752F6
_080752C2:
	movs r0, #0x3b
	bl PlaySE
	b _080752F6
_080752CA:
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x38]
	subs r1, #4
	ldrh r2, [r4, #0x34]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	subs r1, r1, r0
	strh r1, [r4, #0x38]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _080752F6
	strh r5, [r4, #0x38]
	ldr r0, _0807531C
	ands r0, r2
	strh r0, [r4, #0x34]
_080752F6:
	cmp r5, #0
	beq _0807532E
	movs r5, #0
	strh r5, [r4, #0x34]
	movs r0, #0x40
	movs r1, #0x20
	bl Cos
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	strh r5, [r4, #0x26]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08075324
	ldr r0, _08075320
	str r0, [r4, #0x1c]
	b _0807532E
	.align 2, 0
_0807531C: .4byte 0xFFFFFF00
_08075320: .4byte 0x0807571D
_08075324:
	ldr r0, _08075334
	str r0, [r4, #0x1c]
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r5, [r4, #0x38]
_0807532E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075334: .4byte 0x08075339
	thumb_func_end sub_08075240

	thumb_func_start sub_08075338
sub_08075338: @ 0x08075338
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _0807536C
	movs r0, #0
	strh r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r0, _08075374
	str r0, [r4, #0x1c]
	movs r0, #0x17
	bl PlaySE
_0807536C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075374: .4byte 0x08075379
	thumb_func_end sub_08075338

	thumb_func_start sub_08075378
sub_08075378: @ 0x08075378
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	movs r1, #0xff
	ands r1, r0
	cmp r1, #4
	bhi _08075478
	lsls r0, r1, #2
	ldr r1, _08075390
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08075390: .4byte 0x08075394
_08075394: @ jump table
	.4byte _080753A8 @ case 0
	.4byte _080753DA @ case 1
	.4byte _080753A8 @ case 2
	.4byte _0807542E @ case 3
	.4byte _08075478 @ case 4
_080753A8:
	ldrh r0, [r4, #0x36]
	ldrh r2, [r4, #0x24]
	adds r1, r0, r2
	strh r1, [r4, #0x24]
	ldrh r1, [r4, #0x38]
	adds r0, r0, r1
	strh r0, [r4, #0x38]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x38]
	adds r0, #3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bls _080754BE
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	movs r0, #0
	strh r0, [r4, #0x38]
	b _080754BE
_080753DA:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08075420
	movs r0, #0
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bge _08075416
	adds r0, r4, #0
	movs r1, #2
	bl ChangeSpriteAffineAnim
	b _080754BE
_08075416:
	adds r0, r4, #0
	movs r1, #1
	bl ChangeSpriteAffineAnim
	b _080754BE
_08075420:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	b _080754BE
_0807542E:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r2, [r4, #0x34]
	adds r0, r0, r2
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08075450
	ldr r0, _0807544C
	str r0, [r4, #0x1c]
	b _080754BE
	.align 2, 0
_0807544C: .4byte 0x0807571D
_08075450:
	cmp r1, #4
	bne _08075464
	cmp r0, #3
	bne _08075464
	ldr r0, _08075460
	str r0, [r4, #0x1c]
	b _0807546A
	.align 2, 0
_08075460: .4byte 0x080759BD
_08075464:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
_0807546A:
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	b _080754BE
_08075478:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _080754BE
	movs r0, #0
	strh r0, [r4, #0x38]
	ldrh r1, [r4, #0x34]
	ldr r0, _080754AC
	ands r0, r1
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #3
	bl StartSpriteAffineAnim
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080754B0
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAffineAnim
	b _080754B8
	.align 2, 0
_080754AC: .4byte 0xFFFFFF00
_080754B0:
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
_080754B8:
	movs r0, #0x17
	bl PlaySE
_080754BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08075378

	thumb_func_start Task_PlayCryWhenReleasedFromBall
Task_PlayCryWhenReleasedFromBall: @ 0x080754C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _08075504
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r1, [r0, #0xc]
	mov ip, r1
	ldrb r5, [r0, #0xa]
	ldrh r6, [r0, #8]
	ldrb r3, [r0, #0xe]
	mov r8, r3
	ldrb r7, [r0, #0x10]
	movs r3, #0x12
	ldrsh r1, [r0, r3]
	lsls r3, r1, #0x10
	ldrh r1, [r0, #0x14]
	orrs r3, r1
	movs r1, #0x26
	ldrsh r0, [r0, r1]
	cmp r0, #0x20
	bhi _08075590
	lsls r0, r0, #2
	ldr r1, _08075508
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08075504: .4byte 0x03005B60
_08075508: .4byte 0x0807550C
_0807550C: @ jump table
	.4byte _08075590 @ case 0
	.4byte _080755BC @ case 1
	.4byte _080755E2 @ case 2
	.4byte _0807565C @ case 3
	.4byte _08075590 @ case 4
	.4byte _08075590 @ case 5
	.4byte _08075590 @ case 6
	.4byte _08075590 @ case 7
	.4byte _08075590 @ case 8
	.4byte _08075590 @ case 9
	.4byte _08075590 @ case 10
	.4byte _08075590 @ case 11
	.4byte _08075590 @ case 12
	.4byte _08075590 @ case 13
	.4byte _08075590 @ case 14
	.4byte _08075590 @ case 15
	.4byte _08075590 @ case 16
	.4byte _08075590 @ case 17
	.4byte _08075590 @ case 18
	.4byte _08075590 @ case 19
	.4byte _08075600 @ case 20
	.4byte _08075590 @ case 21
	.4byte _08075590 @ case 22
	.4byte _08075590 @ case 23
	.4byte _08075590 @ case 24
	.4byte _08075590 @ case 25
	.4byte _08075590 @ case 26
	.4byte _08075590 @ case 27
	.4byte _08075590 @ case 28
	.4byte _08075590 @ case 29
	.4byte _0807566E @ case 30
	.4byte _08075686 @ case 31
	.4byte _080756B0 @ case 32
_08075590:
	ldr r0, _080755B8
	lsls r1, r7, #4
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r1, #0x3f
	ldrb r0, [r1]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080755A6
	b _0807570C
_080755A6:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	mov r1, ip
	adds r1, #1
	strh r1, [r0, #0x26]
	b _0807570C
	.align 2, 0
_080755B8: .4byte 0x020205AC
_080755BC:
	adds r0, r3, #0
	bl ShouldPlayNormalMonCry
	cmp r0, #1
	bne _080755D4
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r0, r6, #0
	movs r2, #0
	bl PlayCry3
	b _08075636
_080755D4:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r0, r6, #0
	movs r2, #0xb
	bl PlayCry3
	b _08075636
_080755E2:
	bl StopCryAndClearCrySongs
	ldr r1, _080755FC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #3
	strh r1, [r0, #0x1c]
	movs r1, #0x14
	strh r1, [r0, #0x26]
	b _0807570C
	.align 2, 0
_080755FC: .4byte 0x03005B60
_08075600:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r2, [r1, #0x1c]
	movs r7, #0x1c
	ldrsh r0, [r1, r7]
	cmp r0, #0
	bne _080756C2
	adds r0, r3, #0
	bl ShouldPlayNormalMonCry
	cmp r0, #1
	bne _0807562A
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r0, r6, #0
	movs r2, #1
	bl PlayCry4
	b _08075636
_0807562A:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r0, r6, #0
	movs r2, #0xc
	bl PlayCry4
_08075636:
	ldr r0, _08075658
	ldr r0, [r0]
	ldr r0, [r0, #4]
	mov r2, r8
	lsls r1, r2, #1
	add r1, r8
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl DestroyTask
	b _0807570C
	.align 2, 0
_08075658: .4byte 0x02024174
_0807565C:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #6
	strh r1, [r0, #0x1c]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	b _0807570C
_0807566E:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r2, [r1, #0x1c]
	movs r3, #0x1c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _080756C2
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
_08075686:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807570C
	bl StopCryAndClearCrySongs
	ldr r0, _080756AC
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	strh r0, [r1, #0x1c]
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
	b _0807570C
	.align 2, 0
_080756AC: .4byte 0x03005B60
_080756B0:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r2, [r1, #0x1c]
	movs r7, #0x1c
	ldrsh r0, [r1, r7]
	cmp r0, #0
	beq _080756C8
_080756C2:
	subs r0, r2, #1
	strh r0, [r1, #0x1c]
	b _0807570C
_080756C8:
	adds r0, r3, #0
	bl ShouldPlayNormalMonCry
	cmp r0, #1
	bne _080756E0
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r0, r6, #0
	movs r2, #0
	bl PlayCry4
	b _080756EC
_080756E0:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r0, r6, #0
	movs r2, #0xb
	bl PlayCry4
_080756EC:
	ldr r0, _08075718
	ldr r0, [r0]
	ldr r0, [r0, #4]
	mov r2, r8
	lsls r1, r2, #1
	add r1, r8
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl DestroyTask
_0807570C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075718: .4byte 0x02024174
	thumb_func_end Task_PlayCryWhenReleasedFromBall

	thumb_func_start SpriteCB_ReleaseMonFromBall
SpriteCB_ReleaseMonFromBall: @ 0x0807571C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x3a]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r5, #0
	bl GetBattlerPokeballItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIdToBallId
	adds r4, r0, #0
	ldrh r0, [r6, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #0x22]
	subs r1, #5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r2, #1
	movs r3, #0x1c
	bl AnimateBallOpenParticles
	ldrh r1, [r6, #0x3a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0xe
	adds r3, r4, #0
	bl LaunchBallFadeMonTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x2e]
	ldr r0, _080757B4
	str r0, [r6, #0x1c]
	ldr r0, _080757B8
	ldr r1, _080757BC
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08075790
	b _080758FC
_08075790:
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080757C8
	ldr r0, _080757C0
	lsls r2, r5, #1
	adds r0, r2, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _080757C4
	adds r7, r1, r0
	movs r4, #0x19
	mov sl, r4
	b _080757DC
	.align 2, 0
_080757B4: .4byte 0x080759DD
_080757B8: .4byte 0x03002360
_080757BC: .4byte 0x00000439
_080757C0: .4byte 0x02023D12
_080757C4: .4byte 0x020243E8
_080757C8:
	ldr r0, _08075840
	lsls r2, r5, #1
	adds r0, r2, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08075844
	adds r7, r1, r0
	movs r0, #0xe7
	mov sl, r0
_080757DC:
	mov r8, r2
	adds r0, r7, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _08075808
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _0807585E
_08075808:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807585E
	ldr r0, _08075848
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r1, [r0, #9]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807585E
	ldr r0, _0807584C
	ldr r0, [r0]
	movs r1, #0x42
	ands r0, r1
	cmp r0, #0x42
	bne _08075854
	bl IsBGMPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807585E
	ldr r0, _08075850
	bl m4aMPlayStop
	b _0807585E
	.align 2, 0
_08075840: .4byte 0x02023D12
_08075844: .4byte 0x02024190
_08075848: .4byte 0x02024174
_0807584C: .4byte 0x02022C90
_08075850: .4byte 0x030074D0
_08075854:
	ldr r0, _0807587C
	ldr r1, _08075880
	movs r2, #0x80
	bl m4aMPlayVolumeControl
_0807585E:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08075878
	ldr r0, _08075884
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r1, [r0, #9]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08075888
_08075878:
	movs r4, #0
	b _080758AA
	.align 2, 0
_0807587C: .4byte 0x030074D0
_08075880: .4byte 0x0000FFFF
_08075884: .4byte 0x02024174
_08075888:
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _080758A4
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _080758A8
_080758A4:
	movs r4, #1
	b _080758AA
_080758A8:
	movs r4, #2
_080758AA:
	ldr r0, _08075940
	ldr r0, [r0]
	ldr r0, [r0, #4]
	mov r2, r8
	adds r1, r2, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r0, _08075944
	movs r1, #3
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08075948
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r3, #0
	mov r0, sb
	strh r0, [r1, #8]
	mov r2, sl
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0xa]
	strh r4, [r1, #0xc]
	strh r5, [r1, #0xe]
	ldr r2, _0807594C
	movs r4, #0x3a
	ldrsh r0, [r6, r4]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x10]
	lsrs r0, r7, #0x10
	strh r0, [r1, #0x12]
	strh r7, [r1, #0x14]
	strh r3, [r1, #0x26]
_080758FC:
	ldr r4, _0807594C
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _08075950
	adds r0, r0, r5
	movs r1, #1
	bl StartSpriteAffineAnim
	ldrh r0, [r6, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08075958
	movs r2, #0x3a
	ldrsh r0, [r6, r2]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08075954
	b _0807596E
	.align 2, 0
_08075940: .4byte 0x02024174
_08075944: .4byte 0x080754C5
_08075948: .4byte 0x03005B60
_0807594C: .4byte 0x02023E88
_08075950: .4byte 0x020205AC
_08075954: .4byte 0x0803979D
_08075958:
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _080759B0
_0807596E:
	str r1, [r0]
	ldr r5, _080759B4
	movs r2, #0x3a
	ldrsh r0, [r6, r2]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080759B8
	adds r0, r0, r4
	bl AnimateSprite
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x80
	lsls r1, r1, #5
	strh r1, [r0, #0x30]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080759B0: .4byte 0x08039A89
_080759B4: .4byte 0x02023E88
_080759B8: .4byte 0x020205AC
	thumb_func_end SpriteCB_ReleaseMonFromBall

	thumb_func_start sub_080759BC
sub_080759BC: @ 0x080759BC
	adds r3, r0, #0
	adds r3, #0x2c
	ldrb r1, [r3]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _080759D8
	str r1, [r0, #0x1c]
	movs r1, #0
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	strh r1, [r0, #0x38]
	bx lr
	.align 2, 0
_080759D8: .4byte 0x08075B01
	thumb_func_end sub_080759BC

	thumb_func_start HandleBallAnimEnd
HandleBallAnimEnd: @ 0x080759DC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	ldrh r0, [r5, #0x3a]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _08075A40
	ldr r0, _08075A44
	adds r3, r6, r0
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08075A1E
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_08075A1E:
	ldrb r0, [r3]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _08075A48
	adds r0, r1, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	movs r7, #1
	b _08075A64
	.align 2, 0
_08075A40: .4byte 0x020205AC
_08075A44: .4byte 0x02023E88
_08075A48:
	ldr r2, _08075AEC
	adds r0, r2, #0
	ldrh r2, [r1, #0x30]
	adds r0, r0, r2
	strh r0, [r1, #0x30]
	ldrb r0, [r3]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #0x26]
_08075A64:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08075AE6
	cmp r7, #0
	beq _08075AE6
	ldr r2, _08075AF0
	ldr r0, _08075AF4
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x26]
	ldr r0, _08075AF8
	strb r2, [r0]
	ldr r4, _08075AFC
	ldr r0, [r4]
	ldr r0, [r0, #4]
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	bl FreeSpriteOamMatrix
	adds r0, r5, #0
	bl DestroySprite
	movs r3, #0
	ldr r0, [r4]
	ldr r2, [r0, #4]
	movs r5, #8
	movs r4, #3
_08075ABE:
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08075ACA
	adds r3, #1
_08075ACA:
	adds r2, #0xc
	subs r4, #1
	cmp r4, #0
	bge _08075ABE
	cmp r3, #4
	bne _08075AE6
	movs r4, #0
_08075AD8:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl FreeBallGfx
	adds r4, #1
	cmp r4, #0xb
	ble _08075AD8
_08075AE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075AEC: .4byte 0xFFFFFEE0
_08075AF0: .4byte 0x020205AC
_08075AF4: .4byte 0x02023E88
_08075AF8: .4byte 0x0202415D
_08075AFC: .4byte 0x02024174
	thumb_func_end HandleBallAnimEnd

	thumb_func_start sub_08075B00
sub_08075B00: @ 0x08075B00
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x3a]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r6, #0x36]
	adds r0, #1
	strh r0, [r6, #0x36]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x28
	beq _08075B9E
	cmp r1, #0x5f
	bne _08075B38
	ldr r0, _08075B30
	movs r1, #0
	strb r1, [r0]
	bl m4aMPlayAllStop
	ldr r0, _08075B34
	bl PlaySE
	b _08075B9E
	.align 2, 0
_08075B30: .4byte 0x0202415D
_08075B34: .4byte 0x00000173
_08075B38:
	ldr r0, _08075BA4
	cmp r1, r0
	bne _08075B9E
	ldr r5, _08075BA8
	ldr r4, _08075BAC
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	adds r0, r6, #0
	bl DestroySpriteAndFreeResources
	ldr r0, _08075BB0
	ldr r1, _08075BB4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08075B9E
	ldr r0, _08075BB8
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_08075B9E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075BA4: .4byte 0x0000013B
_08075BA8: .4byte 0x020205AC
_08075BAC: .4byte 0x02023E88
_08075BB0: .4byte 0x03002360
_08075BB4: .4byte 0x00000439
_08075BB8: .4byte 0x02024174
	thumb_func_end sub_08075B00

	thumb_func_start SpriteCB_PlayerMonSendOut_1
SpriteCB_PlayerMonSendOut_1: @ 0x08075BBC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x19
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x18
	strh r0, [r4, #0x36]
	ldr r0, _08075C04
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3a]
	strh r0, [r4, #6]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldr r0, _08075C08
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075C04: .4byte 0x0000FFE2
_08075C08: .4byte 0x08075C0D
	thumb_func_end SpriteCB_PlayerMonSendOut_1

	thumb_func_start SpriteCB_PlayerMonSendOut_2
SpriteCB_PlayerMonSendOut_2: @ 0x08075C0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldrh r0, [r5, #0x3c]
	movs r1, #0xff
	mov r8, r1
	lsrs r0, r0, #8
	subs r0, #0x23
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x2c
	bhi _08075D00
	ldrh r1, [r5, #6]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08075C6E
	ldrh r0, [r5, #0x30]
	movs r1, #1
	adds r6, r1, #0
	ands r6, r0
	ldrh r0, [r5, #0x32]
	adds r7, r1, #0
	ands r7, r0
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	movs r1, #3
	bl __divsi3
	movs r1, #2
	rsbs r1, r1, #0
	adds r4, r1, #0
	ands r0, r4
	orrs r6, r0
	strh r6, [r5, #0x30]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	movs r1, #3
	bl __divsi3
	ands r0, r4
	orrs r7, r0
	strh r7, [r5, #0x32]
	adds r0, r5, #0
	movs r1, #4
	bl StartSpriteAffineAnim
_08075C6E:
	ldrh r4, [r5, #0x2e]
	adds r0, r5, #0
	bl AnimTranslateLinear
	movs r1, #0x3a
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldrh r0, [r5, #0x3c]
	adds r0, r0, r1
	strh r0, [r5, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	mov r2, r8
	ands r0, r2
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl Sin
	ldrh r1, [r5, #0x26]
	adds r0, r0, r1
	strh r0, [r5, #0x26]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r1, [r5, #6]
	adds r0, r0, r1
	strh r0, [r5, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08075CBE
	strh r4, [r5, #0x2e]
	b _08075CC6
_08075CBE:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, #1
	strh r0, [r5, #0x2e]
_08075CC6:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #8
	cmp r0, #0x4f
	ble _08075D6C
	ldrh r0, [r5, #0x30]
	movs r1, #1
	adds r6, r1, #0
	ands r6, r0
	ldrh r0, [r5, #0x32]
	adds r7, r1, #0
	ands r7, r0
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r1, #2
	rsbs r1, r1, #0
	adds r2, r1, #0
	ands r0, r2
	orrs r0, r6
	strh r0, [r5, #0x30]
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	ands r0, r2
	orrs r0, r7
	strh r0, [r5, #0x32]
	b _08075D6C
_08075D00:
	adds r0, r5, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08075D6C
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
	ldrb r0, [r5, #6]
	strh r0, [r5, #0x3a]
	strh r1, [r5, #0x2e]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08075D60
	ldr r0, _08075D58
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r1, [r0, #9]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08075D60
	movs r0, #0x3a
	ldrsh r4, [r5, r0]
	movs r0, #2
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08075D60
	ldr r0, _08075D5C
	b _08075D62
	.align 2, 0
_08075D58: .4byte 0x02024174
_08075D5C: .4byte 0x08075D7D
_08075D60:
	ldr r0, _08075D78
_08075D62:
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	movs r1, #0
	bl StartSpriteAffineAnim
_08075D6C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075D78: .4byte 0x0807571D
	thumb_func_end SpriteCB_PlayerMonSendOut_2

	thumb_func_start SpriteCB_ReleaseMon2FromBall
SpriteCB_ReleaseMon2FromBall: @ 0x08075D7C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	adds r1, r0, #1
	strh r1, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	ble _08075D96
	movs r0, #0
	strh r0, [r2, #0x2e]
	ldr r0, _08075D9C
	str r0, [r2, #0x1c]
_08075D96:
	pop {r0}
	bx r0
	.align 2, 0
_08075D9C: .4byte 0x0807571D
	thumb_func_end SpriteCB_ReleaseMon2FromBall

	thumb_func_start SpriteCB_OpponentMonSendOut
SpriteCB_OpponentMonSendOut: @ 0x08075DA0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08075DF4
	movs r0, #0
	strh r0, [r5, #0x2e]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08075DF0
	ldr r0, _08075DE8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r1, [r0, #9]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08075DF0
	movs r0, #0x3a
	ldrsh r4, [r5, r0]
	movs r0, #3
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08075DF0
	ldr r0, _08075DEC
	b _08075DF2
	.align 2, 0
_08075DE8: .4byte 0x02024174
_08075DEC: .4byte 0x08075D7D
_08075DF0:
	ldr r0, _08075DFC
_08075DF2:
	str r0, [r5, #0x1c]
_08075DF4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075DFC: .4byte 0x0807571D
	thumb_func_end SpriteCB_OpponentMonSendOut

	thumb_func_start AnimateBallOpenParticlesForPokeball
AnimateBallOpenParticlesForPokeball: @ 0x08075E00
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl AnimateBallOpenParticles
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AnimateBallOpenParticlesForPokeball

	thumb_func_start LaunchBallFadeMonTaskForPokeball
LaunchBallFadeMonTaskForPokeball: @ 0x08075E28
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0
	bl LaunchBallFadeMonTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end LaunchBallFadeMonTaskForPokeball

	thumb_func_start CreatePokeballSpriteToReleaseMon
CreatePokeballSpriteToReleaseMon: @ 0x08075E40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	mov sb, r2
	mov sl, r3
	ldr r6, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x38]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	lsls r0, r2, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _08075F18
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _08075F1C
	bl LoadCompressedSpritePaletteUsingHeap
	ldr r0, _08075F20
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08075F24
	mov r8, r1
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r2, r4, r1
	strh r5, [r2, #0x2e]
	lsls r1, r5, #4
	adds r1, r1, r5
	lsls r1, r1, #2
	add r1, r8
	ldrh r0, [r1, #0x20]
	strh r0, [r2, #0x38]
	ldrh r0, [r1, #0x22]
	strh r0, [r2, #0x3a]
	mov r3, sb
	strh r3, [r1, #0x20]
	mov r0, sl
	strh r0, [r1, #0x22]
	strh r7, [r1, #0x3c]
	mov r3, sp
	ldrh r3, [r3, #4]
	strh r3, [r2, #0x30]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r2, #0x32]
	mov r3, sp
	ldrh r3, [r3, #0x34]
	strh r3, [r2, #0x34]
	ldr r3, [sp, #0x34]
	lsrs r0, r3, #0x10
	strh r0, [r2, #0x36]
	movs r0, #3
	ands r6, r0
	lsls r6, r6, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r6
	strb r0, [r2, #5]
	movs r0, #0x1c
	add r8, r0
	add r4, r8
	ldr r0, _08075F28
	str r0, [r4]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075F18: .4byte 0x082FCE0C
_08075F1C: .4byte 0x082FCE6C
_08075F20: .4byte 0x082FCF94
_08075F24: .4byte 0x020205AC
_08075F28: .4byte 0x08075F2D
	thumb_func_end CreatePokeballSpriteToReleaseMon

	thumb_func_start sub_08075F2C
sub_08075F2C: @ 0x08075F2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldrh r1, [r6, #0x30]
	movs r2, #0x30
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bne _08075FD8
	ldrh r0, [r6, #0x2e]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrh r4, [r6, #0x34]
	ldrh r0, [r6, #0x36]
	lsls r0, r0, #0x10
	orrs r4, r0
	adds r0, r6, #0
	adds r0, #0x43
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075F66
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08075F68
_08075F66:
	movs r5, #0
_08075F68:
	adds r0, r6, #0
	movs r1, #1
	bl StartSpriteAnim
	ldrh r0, [r6, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #0x22]
	subs r1, #5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r6, #5]
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x1e
	adds r3, r5, #0
	bl AnimateBallOpenParticlesForPokeball
	movs r0, #1
	mov r1, r8
	adds r2, r4, #0
	bl LaunchBallFadeMonTaskForPokeball
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r6, #0x30]
	ldr r0, _08075FD0
	str r0, [r6, #0x1c]
	ldr r0, _08075FD4
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r0
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	adds r0, r4, #0
	bl AnimateSprite
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r4, #0x30]
	strh r5, [r6, #0x3c]
	b _08075FDC
	.align 2, 0
_08075FD0: .4byte 0x08075FE9
_08075FD4: .4byte 0x020205AC
_08075FD8:
	subs r0, r1, #1
	strh r0, [r6, #0x30]
_08075FDC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08075F2C

	thumb_func_start sub_08075FE8
sub_08075FE8: @ 0x08075FE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	movs r0, #0
	mov ip, r0
	movs r7, #0
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08076018
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_08076018:
	ldr r1, _080760AC
	lsls r2, r6, #4
	adds r0, r2, r6
	lsls r0, r0, #2
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	mov r8, r2
	cmp r0, #0
	bge _0807603C
	adds r0, r5, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	movs r1, #1
	mov ip, r1
_0807603C:
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	movs r3, #0x20
	ldrsh r1, [r4, r3]
	subs r0, r0, r1
	movs r1, #0x3c
	ldrsh r2, [r4, r1]
	muls r0, r2, r0
	cmp r0, #0
	bge _08076052
	adds r0, #0x7f
_08076052:
	asrs r0, r0, #7
	ldrh r3, [r4, #0x20]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	movs r3, #0x22
	ldrsh r1, [r4, r3]
	subs r0, r0, r1
	muls r0, r2, r0
	cmp r0, #0
	bge _08076070
	adds r0, #0x7f
_08076070:
	asrs r0, r0, #7
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	mov r2, sb
	strh r2, [r5, #0x20]
	strh r0, [r5, #0x22]
	ldrh r2, [r4, #0x3c]
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	cmp r0, #0x7f
	bgt _080760B4
	ldr r1, _080760B0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08076098
	adds r0, #7
_08076098:
	asrs r0, r0, #3
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r2, #4
	strh r1, [r4, #0x3c]
	strh r0, [r5, #0x24]
	strh r0, [r5, #0x26]
	b _080760C2
	.align 2, 0
_080760AC: .4byte 0x020205AC
_080760B0: .4byte 0x082FA8CC
_080760B4:
	ldrh r0, [r4, #0x38]
	strh r0, [r5, #0x20]
	ldrh r0, [r4, #0x3a]
	strh r0, [r5, #0x22]
	strh r7, [r5, #0x24]
	strh r7, [r5, #0x26]
	movs r7, #1
_080760C2:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08076116
	mov r2, ip
	cmp r2, #0
	beq _08076116
	cmp r7, #0
	beq _08076116
	ldr r1, _08076100
	mov r3, r8
	adds r0, r3, r6
	lsls r0, r0, #2
	adds r2, r0, r1
	movs r0, #0x3c
	ldrsh r1, [r2, r0]
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	bne _08076104
	ldrh r1, [r2, #0x3c]
	adds r0, r2, #0
	movs r2, #1
	movs r3, #0
	bl DoMonFrontSpriteAnimation
	b _08076110
	.align 2, 0
_08076100: .4byte 0x020205AC
_08076104:
	ldrh r1, [r2, #0x3c]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl DoMonFrontSpriteAnimation
_08076110:
	adds r0, r4, #0
	bl DestroySpriteAndFreeResources
_08076116:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08075FE8

	thumb_func_start sub_08076124
sub_08076124: @ 0x08076124
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	adds r6, r2, #0
	mov r8, r3
	ldr r5, [sp, #0x20]
	ldr r4, [sp, #0x24]
	ldr r0, [sp, #0x28]
	mov sb, r0
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _080761C8
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _080761CC
	bl LoadCompressedSpritePaletteUsingHeap
	ldr r0, _080761D0
	adds r1, r6, #0
	mov r2, r8
	adds r3, r4, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _080761D4
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r2, r3, r6
	mov r1, sl
	strh r1, [r2, #0x2e]
	mov r4, sb
	strh r4, [r2, #0x30]
	strh r7, [r2, #0x32]
	mov r1, sp
	ldrh r1, [r1, #0x2c]
	strh r1, [r2, #0x34]
	ldr r4, [sp, #0x2c]
	lsrs r1, r4, #0x10
	strh r1, [r2, #0x36]
	movs r1, #3
	ands r5, r1
	lsls r5, r5, #2
	ldrb r4, [r2, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r4
	orrs r1, r5
	strb r1, [r2, #5]
	adds r6, #0x1c
	adds r3, r3, r6
	ldr r1, _080761D8
	str r1, [r3]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080761C8: .4byte 0x082FCE0C
_080761CC: .4byte 0x082FCE6C
_080761D0: .4byte 0x082FCF94
_080761D4: .4byte 0x020205AC
_080761D8: .4byte 0x080761DD
	thumb_func_end sub_08076124

	thumb_func_start sub_080761DC
sub_080761DC: @ 0x080761DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08076274
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrh r5, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	orrs r5, r0
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	cmp r0, #0
	beq _08076216
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _08076218
_08076216:
	movs r6, #0
_08076218:
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x22]
	subs r1, #5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r4, #5]
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x1e
	adds r3, r6, #0
	bl AnimateBallOpenParticlesForPokeball
	movs r0, #1
	mov r1, r8
	adds r2, r5, #0
	bl LaunchBallFadeMonTaskForPokeball
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r4, #0x30]
	ldr r0, _0807626C
	str r0, [r4, #0x1c]
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	ldr r0, _08076270
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAffineAnim
	adds r0, r4, #0
	bl AnimateSprite
	strh r5, [r4, #0x30]
	b _08076278
	.align 2, 0
_0807626C: .4byte 0x08076285
_08076270: .4byte 0x020205AC
_08076274:
	subs r0, r1, #1
	strh r0, [r4, #0x30]
_08076278:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080761DC

	thumb_func_start sub_08076284
sub_08076284: @ 0x08076284
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	adds r0, #1
	strh r0, [r5, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	bne _0807629C
	movs r0, #0x3c
	bl PlaySE
_0807629C:
	ldrh r1, [r5, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080762D8
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _080762E0
	adds r0, r5, #0
	movs r1, #2
	bl StartSpriteAnim
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	strh r0, [r5, #0x38]
	ldr r0, _080762DC
	str r0, [r5, #0x1c]
	b _080762F0
	.align 2, 0
_080762D8: .4byte 0x020205AC
_080762DC: .4byte 0x080762F9
_080762E0:
	ldrh r0, [r4, #0x30]
	adds r0, #0x60
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	asrs r0, r0, #8
	strh r0, [r4, #0x26]
_080762F0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08076284

	thumb_func_start sub_080762F8
sub_080762F8: @ 0x080762F8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807630C
	ldr r0, _08076310
	str r0, [r2, #0x1c]
_0807630C:
	pop {r0}
	bx r0
	.align 2, 0
_08076310: .4byte 0x08007141
	thumb_func_end sub_080762F8

	thumb_func_start Unref_DestroySpriteAndFreeResources
Unref_DestroySpriteAndFreeResources: @ 0x08076314
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Unref_DestroySpriteAndFreeResources

	thumb_func_start sub_08076320
sub_08076320: @ 0x08076320
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r0, _080763A0
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r6, _080763A4
	adds r4, r0, r6
	movs r1, #0
	movs r0, #5
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x30]
	movs r0, #0x73
	strh r0, [r4, #0x24]
	strh r1, [r4, #0x26]
	ldr r0, _080763A8
	str r0, [r4, #0x1c]
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807636E
	ldrh r0, [r4, #0x2e]
	rsbs r0, r0, #0
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	rsbs r0, r0, #0
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x24]
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
_0807636E:
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x1c
	adds r1, r0, r1
	adds r0, r0, r6
	ldr r1, [r1]
	bl _call_via_r1
	adds r0, r5, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08076398
	ldr r0, _080763AC
	str r0, [r4, #0x1c]
_08076398:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080763A0: .4byte 0x03005AD0
_080763A4: .4byte 0x020205AC
_080763A8: .4byte 0x080763D5
_080763AC: .4byte 0x080763B1
	thumb_func_end sub_08076320

	thumb_func_start sub_080763B0
sub_080763B0: @ 0x080763B0
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _080763CA
	movs r0, #0
	strh r0, [r1, #0x30]
	ldr r0, _080763D0
	str r0, [r1, #0x1c]
_080763CA:
	pop {r0}
	bx r0
	.align 2, 0
_080763D0: .4byte 0x080763D5
	thumb_func_end sub_080763B0

	thumb_func_start sub_080763D4
sub_080763D4: @ 0x080763D4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x24]
	ldrh r1, [r2, #0x2e]
	subs r0, r0, r1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x26]
	ldrh r1, [r2, #0x30]
	subs r0, r0, r1
	strh r0, [r2, #0x26]
	ldr r0, [r2, #0x24]
	cmp r0, #0
	bne _080763F2
	ldr r0, _080763F8
	str r0, [r2, #0x1c]
_080763F2:
	pop {r0}
	bx r0
	.align 2, 0
_080763F8: .4byte 0x08007141
	thumb_func_end sub_080763D4

	thumb_func_start DoHitAnimHealthboxEffect
DoHitAnimHealthboxEffect: @ 0x080763FC
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _08076434
	adds r0, r5, #0
	bl CreateInvisibleSpriteWithCallback
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08076438
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r3, r1, r2
	movs r0, #1
	strh r0, [r3, #0x2e]
	ldr r0, _0807643C
	adds r4, r4, r0
	ldrb r0, [r4]
	strh r0, [r3, #0x30]
	adds r2, #0x1c
	adds r1, r1, r2
	str r5, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076434: .4byte 0x08076441
_08076438: .4byte 0x020205AC
_0807643C: .4byte 0x03005AD0
	thumb_func_end DoHitAnimHealthboxEffect

	thumb_func_start SpriteCB_HitAnimHealthoxEffect
SpriteCB_HitAnimHealthoxEffect: @ 0x08076440
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0807647C
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrh r0, [r3, #0x2e]
	movs r2, #0
	strh r0, [r1, #0x26]
	ldrh r0, [r3, #0x2e]
	rsbs r0, r0, #0
	strh r0, [r3, #0x2e]
	ldrh r0, [r3, #0x32]
	adds r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bne _08076478
	strh r2, [r1, #0x24]
	strh r2, [r1, #0x26]
	adds r0, r3, #0
	bl DestroySprite
_08076478:
	pop {r0}
	bx r0
	.align 2, 0
_0807647C: .4byte 0x020205AC
	thumb_func_end SpriteCB_HitAnimHealthoxEffect

	thumb_func_start LoadBallGfx
LoadBallGfx: @ 0x08076480
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080764DC
	lsls r6, r4, #3
	adds r5, r6, r0
	ldrh r0, [r5, #6]
	bl GetSpriteTileStartByTag
	lsls r0, r0, #0x10
	ldr r1, _080764E0
	cmp r0, r1
	bne _080764A8
	adds r0, r5, #0
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _080764E4
	adds r0, r6, r0
	bl LoadCompressedSpritePaletteUsingHeap
_080764A8:
	cmp r4, #6
	beq _080764D4
	cmp r4, #6
	blt _080764B8
	cmp r4, #0xb
	bgt _080764B8
	cmp r4, #0xa
	bge _080764D4
_080764B8:
	ldr r1, _080764DC
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	bl GetSpriteTileStartByTag
	adds r1, r0, #0
	lsls r1, r1, #0x10
	ldr r0, _080764E8
	lsrs r1, r1, #0xb
	ldr r2, _080764EC
	adds r1, r1, r2
	bl LZDecompressWram
_080764D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080764DC: .4byte 0x082FCE0C
_080764E0: .4byte 0xFFFF0000
_080764E4: .4byte 0x082FCE6C
_080764E8: .4byte 0x08C02308
_080764EC: .4byte 0x06010100
	thumb_func_end LoadBallGfx

	thumb_func_start FreeBallGfx
FreeBallGfx: @ 0x080764F0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	ldr r0, _08076514
	lsrs r4, r4, #0x15
	adds r0, r4, r0
	ldrh r0, [r0, #6]
	bl FreeSpriteTilesByTag
	ldr r0, _08076518
	adds r4, r4, r0
	ldrh r0, [r4, #4]
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076514: .4byte 0x082FCE0C
_08076518: .4byte 0x082FCE6C
	thumb_func_end FreeBallGfx

	thumb_func_start GetBattlerPokeballItemId
GetBattlerPokeballItemId: @ 0x0807651C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08076548
	ldr r1, _08076540
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08076544
	b _08076556
	.align 2, 0
_08076540: .4byte 0x02023D12
_08076544: .4byte 0x020243E8
_08076548:
	ldr r1, _08076568
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0807656C
_08076556:
	adds r0, r0, r1
	movs r1, #0x26
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08076568: .4byte 0x02023D12
_0807656C: .4byte 0x02024190
	thumb_func_end GetBattlerPokeballItemId

