.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AnimMovePowderParticle
AnimMovePowderParticle: @ 0x080FF090
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080FF0C4
	ldrh r0, [r5]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x30]
	ldr r0, _080FF0C8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FF0CC
	ldrh r0, [r5, #8]
	rsbs r0, r0, #0
	b _080FF0CE
	.align 2, 0
_080FF0C4: .4byte 0x020380BE
_080FF0C8: .4byte 0x020380D6
_080FF0CC:
	ldrh r0, [r5, #8]
_080FF0CE:
	strh r0, [r4, #0x34]
	ldr r0, _080FF0E0
	ldrh r0, [r0, #0xa]
	strh r0, [r4, #0x36]
	ldr r0, _080FF0E4
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF0E0: .4byte 0x020380BE
_080FF0E4: .4byte 0x080FF0E9
	thumb_func_end AnimMovePowderParticle

	thumb_func_start AnimMovePowderParticleStep
AnimMovePowderParticleStep: @ 0x080FF0E8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080FF124
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x32]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r1, r1, r0
	strh r1, [r4, #0x32]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x38]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	b _080FF12A
_080FF124:
	adds r0, r4, #0
	bl DestroyAnimSprite
_080FF12A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimMovePowderParticleStep

	thumb_func_start AnimPowerAbsorptionOrb
AnimPowerAbsorptionOrb: @ 0x080FF130
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _080FF170
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x2e]
	ldr r5, _080FF174
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
	ldr r0, _080FF178
	str r0, [r4, #0x1c]
	ldr r1, _080FF17C
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF170: .4byte 0x020380BE
_080FF174: .4byte 0x020380D6
_080FF178: .4byte 0x080A67B5
_080FF17C: .4byte 0x080A6015
	thumb_func_end AnimPowerAbsorptionOrb

	thumb_func_start AnimSolarbeamBigOrb
AnimSolarbeamBigOrb: @ 0x080FF180
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r5, _080FF1C8
	ldrb r1, [r5, #6]
	adds r0, r4, #0
	bl StartSpriteAnim
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x2e]
	ldr r5, _080FF1CC
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
	ldr r0, _080FF1D0
	str r0, [r4, #0x1c]
	ldr r1, _080FF1D4
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF1C8: .4byte 0x020380BE
_080FF1CC: .4byte 0x020380D7
_080FF1D0: .4byte 0x080A67B5
_080FF1D4: .4byte 0x080A34C5
	thumb_func_end AnimSolarbeamBigOrb

	thumb_func_start AnimSolarbeamSmallOrb
AnimSolarbeamSmallOrb: @ 0x080FF1D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r6, _080FF228
	ldrh r0, [r6, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldr r5, _080FF22C
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
	ldrh r0, [r6, #6]
	strh r0, [r4, #0x38]
	ldr r1, _080FF230
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FF228: .4byte 0x020380BE
_080FF22C: .4byte 0x020380D7
_080FF230: .4byte 0x080FF235
	thumb_func_end AnimSolarbeamSmallOrb

	thumb_func_start AnimSolarbeamSmallOrbStep
AnimSolarbeamSmallOrbStep: @ 0x080FF234
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FF24A
	adds r0, r4, #0
	bl DestroySprite
	b _080FF29E
_080FF24A:
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	ble _080FF264
	ldr r0, _080FF260
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	adds r0, #1
	b _080FF26E
	.align 2, 0
_080FF260: .4byte 0x020380D7
_080FF264:
	ldr r0, _080FF2A4
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	adds r0, #6
_080FF26E:
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #5
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0xe
	bl Cos
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x38]
	adds r0, #0xf
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
_080FF29E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF2A4: .4byte 0x020380D7
	thumb_func_end AnimSolarbeamSmallOrbStep

	thumb_func_start AnimTask_CreateSmallSolarbeamOrbs
AnimTask_CreateSmallSolarbeamOrbs: @ 0x080FF2A8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r1, _080FF318
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #8]
	subs r0, #1
	movs r2, #0
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080FF302
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	movs r0, #6
	strh r0, [r5, #8]
	ldr r1, _080FF31C
	movs r0, #0xf
	strh r0, [r1]
	strh r2, [r1, #2]
	movs r0, #0x50
	strh r0, [r1, #4]
	strh r2, [r1, #6]
	ldr r4, _080FF320
	ldr r0, _080FF324
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl CreateSpriteAndAnimate
_080FF302:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0xf
	bne _080FF310
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_080FF310:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FF318: .4byte 0x03005B60
_080FF31C: .4byte 0x020380BE
_080FF320: .4byte 0x0856DDF4
_080FF324: .4byte 0x020380D7
	thumb_func_end AnimTask_CreateSmallSolarbeamOrbs

	thumb_func_start AnimAbsorptionOrb
AnimAbsorptionOrb: @ 0x080FF328
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r6, _080FF36C
	ldrh r0, [r6, #6]
	strh r0, [r4, #0x2e]
	ldr r5, _080FF370
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
	ldrh r0, [r6, #4]
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldr r0, _080FF374
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FF36C: .4byte 0x020380BE
_080FF370: .4byte 0x020380D6
_080FF374: .4byte 0x080FF379
	thumb_func_end AnimAbsorptionOrb

	thumb_func_start AnimAbsorptionOrbStep
AnimAbsorptionOrbStep: @ 0x080FF378
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FF38C
	adds r0, r4, #0
	bl DestroyAnimSprite
_080FF38C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimAbsorptionOrbStep

	thumb_func_start AnimHyperBeamOrb
AnimHyperBeamOrb: @ 0x080FF394
	push {r4, r5, lr}
	adds r5, r0, #0
	bl Random2
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #7
	ands r1, r0
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r4, _080FF3DC
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
	beq _080FF3E0
	ldrh r0, [r5, #0x20]
	subs r0, #0x14
	b _080FF3E4
	.align 2, 0
_080FF3DC: .4byte 0x020380D6
_080FF3E0:
	ldrh r0, [r5, #0x20]
	adds r0, #0x14
_080FF3E4:
	strh r0, [r5, #0x20]
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x1f
	ands r0, r1
	adds r0, #0x40
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	ldr r4, _080FF444
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
	bl InitAnimFastLinearTranslationWithSpeed
	bl Random2
	movs r1, #0xff
	ands r1, r0
	strh r1, [r5, #0x38]
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r0, [r0]
	strh r0, [r5, #0x3a]
	ldr r1, _080FF448
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF444: .4byte 0x020380D7
_080FF448: .4byte 0x080FF44D
	thumb_func_end AnimHyperBeamOrb

	thumb_func_start AnimHyperBeamOrbStep
AnimHyperBeamOrbStep: @ 0x080FF44C
	push {r4, lr}
	adds r4, r0, #0
	bl AnimFastTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FF462
	adds r0, r4, #0
	bl DestroyAnimSprite
	b _080FF492
_080FF462:
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0xc
	bl Cos
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #0x7e
	bgt _080FF47E
	ldrh r0, [r4, #0x3a]
	b _080FF482
_080FF47E:
	ldrh r0, [r4, #0x3a]
	adds r0, #1
_080FF482:
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	adds r0, #0x18
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
_080FF492:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimHyperBeamOrbStep

	thumb_func_start AnimLeechSeed
AnimLeechSeed: @ 0x080FF498
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _080FF4F8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FF4B8
	ldr r1, _080FF4FC
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_080FF4B8:
	ldr r4, _080FF4FC
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x2e]
	ldr r5, _080FF500
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r6, #0x32]
	ldrb r0, [r5]
	movs r1, #1
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
	ldr r0, _080FF504
	str r0, [r6, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FF4F8: .4byte 0x020380D6
_080FF4FC: .4byte 0x020380BE
_080FF500: .4byte 0x020380D7
_080FF504: .4byte 0x080FF509
	thumb_func_end AnimLeechSeed

	thumb_func_start AnimLeechSeedStep
AnimLeechSeedStep: @ 0x080FF508
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FF532
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	ldr r0, _080FF538
	str r0, [r4, #0x1c]
	ldr r1, _080FF53C
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
_080FF532:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF538: .4byte 0x080A5D79
_080FF53C: .4byte 0x080FF541
	thumb_func_end AnimLeechSeedStep

	thumb_func_start AnimLeechSeedSprouts
AnimLeechSeedSprouts: @ 0x080FF540
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	movs r0, #0x3c
	strh r0, [r4, #0x2e]
	ldr r0, _080FF570
	str r0, [r4, #0x1c]
	ldr r1, _080FF574
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF570: .4byte 0x080A5D79
_080FF574: .4byte 0x080A34C5
	thumb_func_end AnimLeechSeedSprouts

	thumb_func_start AnimSporeParticle
AnimSporeParticle: @ 0x080FF578
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r5, _080FF5BC
	ldrb r1, [r5, #8]
	adds r0, r4, #0
	bl StartSpriteAnim
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _080FF5A2
	ldrb r0, [r4, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r4, #1]
_080FF5A2:
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x30]
	ldr r1, _080FF5C0
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF5BC: .4byte 0x020380BE
_080FF5C0: .4byte 0x080FF5C5
	thumb_func_end AnimSporeParticle

	thumb_func_start AnimSporeParticleStep
AnimSporeParticleStep: @ 0x080FF5C4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x20
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #3
	rsbs r1, r1, #0
	bl Cos
	ldrh r1, [r4, #0x32]
	adds r1, #0x18
	strh r1, [r4, #0x32]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bhi _080FF618
	ldr r0, _080FF614
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	b _080FF63C
	.align 2, 0
_080FF614: .4byte 0x020380D7
_080FF618:
	ldr r0, _080FF668
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080FF62C
	movs r2, #3
_080FF62C:
	movs r0, #3
	ands r2, r0
	lsls r2, r2, #2
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
_080FF63C:
	strb r0, [r4, #5]
	ldrh r0, [r4, #0x30]
	adds r0, #2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080FF660
	adds r0, r4, #0
	bl DestroyAnimSprite
_080FF660:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF668: .4byte 0x020380D7
	thumb_func_end AnimSporeParticleStep

	thumb_func_start AnimTask_SporeDoubleBattle
AnimTask_SporeDoubleBattle: @ 0x080FF66C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FF686
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FF68E
_080FF686:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _080FF6C0
_080FF68E:
	ldr r0, _080FF6AC
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FF6B0
	movs r0, #2
	movs r1, #4
	movs r2, #3
	bl SetAnimBgAttribute
	b _080FF6BA
	.align 2, 0
_080FF6AC: .4byte 0x020380D7
_080FF6B0:
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
_080FF6BA:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_080FF6C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_SporeDoubleBattle

	thumb_func_start AnimPetalDanceBigFlower
AnimPetalDanceBigFlower: @ 0x080FF6C8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldr r5, _080FF710
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	ldr r0, _080FF714
	ldrb r0, [r0]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r5, [r5, #4]
	adds r0, r0, r5
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	movs r0, #0x40
	strh r0, [r4, #0x38]
	ldr r1, _080FF718
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF710: .4byte 0x020380BE
_080FF714: .4byte 0x020380D6
_080FF718: .4byte 0x080FF71D
	thumb_func_end AnimPetalDanceBigFlower

	thumb_func_start AnimPetalDanceBigFlowerStep
AnimPetalDanceBigFlowerStep: @ 0x080FF71C
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FF788
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0x20
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #5
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
	bhi _080FF768
	ldr r0, _080FF764
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	subs r0, #1
	b _080FF772
	.align 2, 0
_080FF764: .4byte 0x020380D6
_080FF768:
	ldr r0, _080FF784
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	adds r0, #1
_080FF772:
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	adds r0, #5
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	b _080FF78E
	.align 2, 0
_080FF784: .4byte 0x020380D6
_080FF788:
	adds r0, r4, #0
	bl DestroyAnimSprite
_080FF78E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimPetalDanceBigFlowerStep

	thumb_func_start AnimPetalDanceSmallFlower
AnimPetalDanceSmallFlower: @ 0x080FF794
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r5, _080FF7DC
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	ldr r0, _080FF7E0
	ldrb r0, [r0]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r5, [r5, #4]
	adds r0, r0, r5
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	movs r0, #0x40
	strh r0, [r4, #0x38]
	ldr r1, _080FF7E4
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF7DC: .4byte 0x020380BE
_080FF7E0: .4byte 0x020380D6
_080FF7E4: .4byte 0x080FF7E9
	thumb_func_end AnimPetalDanceSmallFlower

	thumb_func_start AnimPetalDanceSmallFlowerStep
AnimPetalDanceSmallFlowerStep: @ 0x080FF7E8
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FF840
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	ldrh r1, [r4, #0x38]
	adds r0, r1, #0
	subs r0, #0x3b
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bls _080FF820
	adds r0, r1, #0
	subs r0, #0xbb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bhi _080FF834
_080FF820:
	ldrb r2, [r4, #3]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1b
	movs r0, #8
	eors r1, r0
	lsls r1, r1, #1
	subs r0, #0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
_080FF834:
	ldrh r0, [r4, #0x38]
	adds r0, #5
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	b _080FF846
_080FF840:
	adds r0, r4, #0
	bl DestroyAnimSprite
_080FF846:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimPetalDanceSmallFlowerStep

	thumb_func_start AnimRazorLeafParticle
AnimRazorLeafParticle: @ 0x080FF84C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080FF888
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
	ldr r1, _080FF88C
	ldrh r0, [r1]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x32]
	ldr r0, _080FF890
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF888: .4byte 0x020380D6
_080FF88C: .4byte 0x020380BE
_080FF890: .4byte 0x080FF895
	thumb_func_end AnimRazorLeafParticle

	thumb_func_start AnimRazorLeafParticleStep1
AnimRazorLeafParticleStep1: @ 0x080FF894
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x32]
	movs r2, #0x32
	ldrsh r3, [r1, r2]
	cmp r3, #0
	bne _080FF8C8
	ldrh r0, [r1, #0x30]
	movs r2, #1
	ands r2, r0
	cmp r2, #0
	beq _080FF8B6
	movs r0, #0x80
	strh r0, [r1, #0x2e]
	strh r3, [r1, #0x30]
	strh r3, [r1, #0x32]
	b _080FF8BC
_080FF8B6:
	strh r2, [r1, #0x2e]
	strh r2, [r1, #0x30]
	strh r2, [r1, #0x32]
_080FF8BC:
	ldr r0, _080FF8C4
	str r0, [r1, #0x1c]
	b _080FF8DC
	.align 2, 0
_080FF8C4: .4byte 0x080FF8E1
_080FF8C8:
	subs r0, #1
	strh r0, [r1, #0x32]
	ldrh r0, [r1, #0x2e]
	ldrh r2, [r1, #0x20]
	adds r0, r0, r2
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0x30]
	ldrh r2, [r1, #0x22]
	adds r0, r0, r2
	strh r0, [r1, #0x22]
_080FF8DC:
	pop {r0}
	bx r0
	thumb_func_end AnimRazorLeafParticleStep1

	thumb_func_start AnimRazorLeafParticleStep2
AnimRazorLeafParticleStep2: @ 0x080FF8E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080FF900
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FF904
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #0x19
	bl Sin
	rsbs r0, r0, #0
	b _080FF90E
	.align 2, 0
_080FF900: .4byte 0x020380D6
_080FF904:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #0x19
	bl Sin
_080FF90E:
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x2e]
	adds r0, #2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080FF92E
	ldrh r0, [r4, #0x26]
	adds r0, #1
	strh r0, [r4, #0x26]
_080FF92E:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble _080FF93C
	adds r0, r4, #0
	bl DestroyAnimSprite
_080FF93C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimRazorLeafParticleStep2

	thumb_func_start AnimTranslateLinearSingleSineWave
AnimTranslateLinearSingleSineWave: @ 0x080FF944
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _080FF998
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FF964
	ldr r1, _080FF99C
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_080FF964:
	ldr r6, _080FF99C
	ldrh r0, [r6, #8]
	strh r0, [r5, #0x2e]
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080FF9A4
	ldr r4, _080FF9A0
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
	ldrh r6, [r6, #6]
	adds r0, r0, r6
	b _080FF9C4
	.align 2, 0
_080FF998: .4byte 0x020380D6
_080FF99C: .4byte 0x020380BE
_080FF9A0: .4byte 0x020380D7
_080FF9A4:
	ldr r0, _080FF9F0
	ldrb r0, [r0]
	adds r2, r5, #0
	adds r2, #0x32
	adds r3, r5, #0
	adds r3, #0x36
	movs r1, #1
	bl SetAverageBattlerPositions
	ldrh r0, [r6, #4]
	ldrh r1, [r5, #0x32]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #6]
	ldrh r1, [r5, #0x36]
	adds r0, r0, r1
_080FF9C4:
	strh r0, [r5, #0x36]
	ldr r0, _080FF9F4
	ldrh r0, [r0, #0xa]
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	bl InitAnimArcTranslation
	ldr r0, _080FF9F8
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r0, _080FF9F0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080FF9FC
	movs r0, #1
	b _080FF9FE
	.align 2, 0
_080FF9F0: .4byte 0x020380D7
_080FF9F4: .4byte 0x020380BE
_080FF9F8: .4byte 0x020380D6
_080FF9FC:
	movs r0, #0
_080FF9FE:
	strh r0, [r5, #0x2e]
	ldr r0, _080FFA0C
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FFA0C: .4byte 0x080FFA11
	thumb_func_end AnimTranslateLinearSingleSineWave

	thumb_func_start AnimTranslateLinearSingleSineWaveStep
AnimTranslateLinearSingleSineWaveStep: @ 0x080FFA10
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0
	ldrh r5, [r6, #0x2e]
	ldrh r4, [r6, #0x3c]
	movs r0, #1
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	bl TranslateAnimHorizontalArc
	ldrh r0, [r6, #0x3c]
	strh r5, [r6, #0x2e]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0xc8
	ble _080FFA42
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x37
	bgt _080FFA42
	ldrh r0, [r6, #6]
	cmp r0, #0
	bne _080FFA48
	adds r0, #1
	strh r0, [r6, #6]
_080FFA42:
	ldrh r0, [r6, #6]
	cmp r0, #0
	beq _080FFA7A
_080FFA48:
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _080FFA7A
	adds r3, r6, #0
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
	ldrh r0, [r6, #6]
	adds r0, #1
	strh r0, [r6, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _080FFA7A
	movs r7, #1
_080FFA7A:
	movs r2, #0x20
	ldrsh r0, [r6, r2]
	movs r2, #0x24
	ldrsh r1, [r6, r2]
	adds r0, r0, r1
	adds r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #1
	cmp r0, r1
	bhi _080FFAA4
	movs r0, #0x22
	ldrsh r1, [r6, r0]
	movs r2, #0x26
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	cmp r1, #0xa0
	bgt _080FFAA4
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080FFAA6
_080FFAA4:
	movs r7, #1
_080FFAA6:
	cmp r7, #0
	beq _080FFAB0
	adds r0, r6, #0
	bl DestroyAnimSprite
_080FFAB0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTranslateLinearSingleSineWaveStep

	thumb_func_start AnimMoveTwisterParticle
AnimMoveTwisterParticle: @ 0x080FFAB8
	push {r4, lr}
	adds r4, r0, #0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FFADA
	ldr r0, _080FFB00
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #1
	bl SetAverageBattlerPositions
_080FFADA:
	ldrh r0, [r4, #0x22]
	adds r0, #0x20
	strh r0, [r4, #0x22]
	ldr r1, _080FFB04
	ldrh r0, [r1]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x34]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x36]
	ldr r0, _080FFB08
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FFB00: .4byte 0x020380D7
_080FFB04: .4byte 0x020380BE
_080FFB08: .4byte 0x080FFB0D
	thumb_func_end AnimMoveTwisterParticle

	thumb_func_start AnimMoveTwisterParticleStep
AnimMoveTwisterParticleStep: @ 0x080FFB0C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xff
	bne _080FFB22
	ldrh r0, [r4, #0x22]
	subs r0, #2
	strh r0, [r4, #0x22]
	b _080FFB30
_080FFB22:
	cmp r0, #0
	ble _080FFB30
	ldrh r0, [r4, #0x22]
	subs r0, #2
	strh r0, [r4, #0x22]
	subs r0, r1, #2
	strh r0, [r4, #0x30]
_080FFB30:
	ldrh r3, [r4, #0x32]
	ldrh r5, [r4, #0x38]
	adds r2, r3, r5
	strh r2, [r4, #0x38]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	movs r5, #0x36
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _080FFB48
	adds r0, r2, r3
	strh r0, [r4, #0x38]
_080FFB48:
	ldrh r1, [r4, #0x38]
	movs r0, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x24]
	movs r5, #0x38
	ldrsh r0, [r4, r5]
	movs r1, #5
	bl Sin
	strh r0, [r4, #0x26]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	bgt _080FFB88
	ldr r0, _080FFB84
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	b _080FFB96
	.align 2, 0
_080FFB84: .4byte 0x020380D7
_080FFB88:
	ldr r0, _080FFBC0
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #1
_080FFB96:
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	ldrb r2, [r4, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #5]
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080FFBBA
	adds r0, r4, #0
	bl DestroyAnimSprite
_080FFBBA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FFBC0: .4byte 0x020380D7
	thumb_func_end AnimMoveTwisterParticleStep

	thumb_func_start AnimConstrictBinding
AnimConstrictBinding: @ 0x080FFBC4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r4, _080FFBF8
	ldrb r1, [r4, #4]
	adds r0, r5, #0
	bl StartSpriteAffineAnim
	ldrh r0, [r4, #4]
	strh r0, [r5, #0x3a]
	ldrh r0, [r4, #6]
	strh r0, [r5, #0x3c]
	ldr r0, _080FFBFC
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FFBF8: .4byte 0x020380BE
_080FFBFC: .4byte 0x080FFC01
	thumb_func_end AnimConstrictBinding

	thumb_func_start AnimConstrictBindingStep1
AnimConstrictBindingStep1: @ 0x080FFC00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080FFC30
	ldrh r1, [r0, #0xe]
	ldr r0, _080FFC34
	cmp r1, r0
	bne _080FFC2A
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	movs r0, #1
	bl GetAnimBattlerSpriteId
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x2e]
	ldr r0, _080FFC38
	str r0, [r4, #0x1c]
_080FFC2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FFC30: .4byte 0x020380BE
_080FFC34: .4byte 0x0000FFFF
_080FFC38: .4byte 0x080FFC3D
	thumb_func_end AnimConstrictBindingStep1

	thumb_func_start AnimConstrictBindingStep2
AnimConstrictBindingStep2: @ 0x080FFC3C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl GetAnimBattlerSpriteId
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080FFC54
	ldrh r0, [r4, #0x2e]
	adds r0, #0xb
	b _080FFC58
_080FFC54:
	ldrh r0, [r4, #0x2e]
	subs r0, #0xb
_080FFC58:
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _080FFC74
	movs r0, #0
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x32]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0x32]
_080FFC74:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080FFCA2
	ldrh r0, [r4, #0x3c]
	subs r0, #1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _080FFC9C
	ldrh r1, [r4, #0x3a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAffineAnim
	b _080FFCA2
_080FFC9C:
	adds r0, r4, #0
	bl DestroyAnimSprite
_080FFCA2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimConstrictBindingStep2

	thumb_func_start sub_080FFCA8
sub_080FFCA8: @ 0x080FFCA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #1
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080FFCE4
	mov sl, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r2, sl
	adds r7, r0, r2
	adds r0, r7, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _080FFCE8
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _080FFD6C
	.align 2, 0
_080FFCE4: .4byte 0x020205AC
_080FFCE8:
	adds r0, r1, #0
	movs r1, #1
	bl PrepareBattlerSpriteForRotScale
	ldr r0, _080FFD7C
	lsls r6, r4, #2
	adds r6, r6, r4
	lsls r6, r6, #3
	adds r6, r6, r0
	ldrb r0, [r7, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	strh r0, [r6, #0x24]
	ldr r0, _080FFD80
	mov sb, r0
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	movs r1, #3
	mov r8, r1
	mov r1, r8
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r7, #5]
	movs r5, #0xd
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #5]
	movs r0, #3
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	add r4, sl
	ldrb r0, [r4, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	strh r0, [r6, #0x26]
	mov r2, sb
	ldrb r1, [r2]
	movs r0, #2
	eors r0, r1
	bl GetBattlerSpriteBGPriority
	mov r1, r8
	ands r1, r0
	lsls r1, r1, #2
	ldrb r0, [r4, #5]
	ands r5, r0
	orrs r5, r1
	strb r5, [r4, #5]
	ldr r1, _080FFD84
	ldrh r0, [r1]
	strh r0, [r6, #8]
	ldrh r0, [r1, #2]
	strh r0, [r6, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x1e]
	ldr r0, _080FFD88
	str r0, [r6]
_080FFD6C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FFD7C: .4byte 0x03005B60
_080FFD80: .4byte 0x020380D7
_080FFD84: .4byte 0x020380BE
_080FFD88: .4byte 0x080FFD8D
	thumb_func_end sub_080FFCA8

	thumb_func_start sub_080FFD8C
sub_080FFD8C: @ 0x080FFD8C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r1, _080FFE0C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4, #8]
	ldrh r0, [r4, #0x1c]
	adds r1, r1, r0
	strh r1, [r4, #0x1c]
	ldr r2, _080FFE10
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r5, r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strh r1, [r5, #0x24]
	ldr r0, _080FFE14
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FFDD6
	ldrh r0, [r5, #0x24]
	rsbs r0, r0, #0
	strh r0, [r5, #0x24]
_080FFDD6:
	ldrh r0, [r4, #0x1e]
	adds r0, #0x10
	strh r0, [r4, #0x1e]
	movs r0, #0x1e
	ldrsh r2, [r4, r0]
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	adds r0, r6, #0
	bl SetBattlerSpriteYOffsetFromYScale
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _080FFE04
	strh r0, [r4, #8]
	ldr r0, _080FFE18
	str r0, [r4]
_080FFE04:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FFE0C: .4byte 0x03005B60
_080FFE10: .4byte 0x020205AC
_080FFE14: .4byte 0x020380D7
_080FFE18: .4byte 0x080FFE1D
	thumb_func_end sub_080FFD8C

	thumb_func_start sub_080FFE1C
sub_080FFE1C: @ 0x080FFE1C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080FFEA0
	ldrh r1, [r0, #0xe]
	ldr r0, _080FFEA4
	cmp r1, r0
	bne _080FFEB0
	ldr r0, _080FFEA8
	lsls r2, r3, #2
	adds r1, r2, r3
	lsls r1, r1, #3
	adds r7, r1, r0
	movs r1, #8
	ldrsh r5, [r7, r1]
	adds r4, r0, #0
	cmp r5, #0
	bne _080FFEC4
	movs r0, #1
	bl GetAnimBattlerSpriteId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl ResetSpriteRotScale
	ldr r6, _080FFEAC
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r6
	strh r5, [r1, #0x24]
	strh r5, [r1, #0x26]
	movs r5, #3
	ldrh r2, [r7, #0x24]
	ands r2, r5
	lsls r2, r2, #2
	ldrb r3, [r1, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
	movs r0, #3
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r7, #0x26]
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r1, #5]
	ands r4, r2
	orrs r4, r0
	strb r4, [r1, #5]
	ldrh r0, [r7, #8]
	adds r0, #1
	strh r0, [r7, #8]
	b _080FFEDE
	.align 2, 0
_080FFEA0: .4byte 0x020380BE
_080FFEA4: .4byte 0x0000FFFF
_080FFEA8: .4byte 0x03005B60
_080FFEAC: .4byte 0x020205AC
_080FFEB0:
	ldr r1, _080FFEE4
	lsls r2, r3, #2
	adds r0, r2, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r4, #8
	ldrsh r0, [r0, r4]
	adds r4, r1, #0
	cmp r0, #0
	beq _080FFEDE
_080FFEC4:
	adds r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _080FFEDE
	adds r0, r3, #0
	bl DestroyAnimVisualTask
_080FFEDE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FFEE4: .4byte 0x03005B60
	thumb_func_end sub_080FFE1C

	thumb_func_start AnimMimicOrb
AnimMimicOrb: @ 0x080FFEE8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080FFEFA
	cmp r0, #1
	beq _080FFF54
	b _080FFFA6
_080FFEFA:
	ldr r6, _080FFF4C
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FFF12
	ldr r1, _080FFF50
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1]
_080FFF12:
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _080FFF50
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
	strh r0, [r5, #0x22]
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _080FFFA6
	.align 2, 0
_080FFF4C: .4byte 0x020380D7
_080FFF50: .4byte 0x020380BE
_080FFF54:
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080FFFA6
	adds r0, r5, #0
	movs r1, #1
	bl ChangeSpriteAffineAnim
	movs r0, #0x19
	strh r0, [r5, #0x2e]
	ldr r4, _080FFFAC
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
	ldr r0, _080FFFB0
	str r0, [r5, #0x1c]
	ldr r1, _080FFFB4
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
_080FFFA6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FFFAC: .4byte 0x020380D6
_080FFFB0: .4byte 0x080A6989
_080FFFB4: .4byte 0x080A34C5
	thumb_func_end AnimMimicOrb

	thumb_func_start AnimIngrainRoot
AnimIngrainRoot: @ 0x080FFFB8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08100024
	ldr r4, _08100030
	ldrb r0, [r4]
	movs r1, #2
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
	ldr r4, _08100034
	ldrh r0, [r4]
	strh r0, [r5, #0x24]
	ldrh r0, [r4, #2]
	strh r0, [r5, #0x26]
	ldrb r0, [r4, #4]
	adds r0, #0x1e
	adds r1, r5, #0
	adds r1, #0x43
	strb r0, [r1]
	ldrb r1, [r4, #6]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	movs r2, #0x22
	ldrsh r0, [r5, r2]
	movs r2, #0x26
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	cmp r0, #0x78
	ble _08100024
	ldrh r0, [r5, #0x22]
	adds r1, r0, #0
	subs r1, #0x78
	ldrh r2, [r5, #0x26]
	adds r0, r0, r2
	adds r1, r1, r0
	strh r1, [r5, #0x22]
_08100024:
	ldr r0, _08100038
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100030: .4byte 0x020380D6
_08100034: .4byte 0x020380BE
_08100038: .4byte 0x0810012D
	thumb_func_end AnimIngrainRoot

	thumb_func_start AnimFrenzyPlantRoot
AnimFrenzyPlantRoot: @ 0x0810003C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	ldr r4, _08100118
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	mov r8, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r6, _0810011C
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r6]
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r2, r0, #0
	lsls r2, r2, #0x18
	subs r4, r4, r5
	lsls r4, r4, #0x10
	lsrs r2, r2, #0x18
	mov r1, r8
	subs r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsrs r3, r4, #0x10
	mov sl, r3
	asrs r4, r4, #0x10
	ldr r6, _08100120
	movs r1, #0
	ldrsh r0, [r6, r1]
	muls r0, r4, r0
	movs r1, #0x64
	str r2, [sp]
	bl __divsi3
	adds r5, r5, r0
	mov r3, sb
	strh r5, [r3, #0x20]
	ldr r2, [sp]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r3, #0
	ldrsh r1, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	add r8, r0
	mov r1, r8
	mov r0, sb
	strh r1, [r0, #0x22]
	ldrh r0, [r6, #2]
	mov r3, sb
	strh r0, [r3, #0x24]
	ldrh r0, [r6, #4]
	strh r0, [r3, #0x26]
	ldrb r0, [r6, #6]
	adds r0, #0x1e
	mov r1, sb
	adds r1, #0x43
	strb r0, [r1]
	ldrb r1, [r6, #8]
	mov r0, sb
	bl StartSpriteAnim
	ldrh r0, [r6, #0xa]
	mov r1, sb
	strh r0, [r1, #0x32]
	ldr r0, _08100124
	str r0, [r1, #0x1c]
	ldr r1, _08100128
	mov r3, sb
	ldrh r0, [r3, #0x20]
	strh r0, [r1]
	ldrh r0, [r3, #0x22]
	strh r0, [r1, #2]
	mov r0, sl
	strh r0, [r1, #4]
	ldr r2, [sp]
	strh r2, [r1, #6]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08100118: .4byte 0x020380D6
_0810011C: .4byte 0x020380D7
_08100120: .4byte 0x020380BE
_08100124: .4byte 0x0810012D
_08100128: .4byte 0x02039DC4
	thumb_func_end AnimFrenzyPlantRoot

	thumb_func_start AnimRootFlickerOut
AnimRootFlickerOut: @ 0x0810012C
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	adds r1, #1
	strh r1, [r3, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x32
	ldrsh r0, [r3, r2]
	subs r0, #0xa
	cmp r1, r0
	ble _0810016C
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	movs r2, #0x3e
	adds r2, r2, r3
	mov ip, r2
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
_0810016C:
	movs r2, #0x2e
	ldrsh r1, [r3, r2]
	movs r2, #0x32
	ldrsh r0, [r3, r2]
	cmp r1, r0
	ble _0810017E
	adds r0, r3, #0
	bl DestroyAnimSprite
_0810017E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimRootFlickerOut

	thumb_func_start AnimIngrainOrb
AnimIngrainOrb: @ 0x08100184
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _081001C4
	ldr r5, _08100200
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _08100204
	lsrs r0, r0, #0x18
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r6, #0x20]
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r6, #0x22]
	ldrh r0, [r4, #4]
	strh r0, [r6, #0x30]
	ldrh r0, [r4, #6]
	strh r0, [r6, #0x32]
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x34]
_081001C4:
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	ldrh r1, [r6, #0x30]
	muls r0, r1, r0
	strh r0, [r6, #0x24]
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0xff
	ands r0, r1
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	bl Sin
	strh r0, [r6, #0x26]
	movs r0, #0x2e
	ldrsh r1, [r6, r0]
	movs r2, #0x34
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _081001FA
	adds r0, r6, #0
	bl DestroyAnimSprite
_081001FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08100200: .4byte 0x020380D6
_08100204: .4byte 0x020380BE
	thumb_func_end AnimIngrainOrb

	thumb_func_start sub_08100208
sub_08100208: @ 0x08100208
	push {r4, r5, lr}
	movs r2, #0x20
	ldrsh r4, [r0, r2]
	lsls r4, r4, #8
	movs r3, #0x22
	ldrsh r2, [r0, r3]
	orrs r4, r2
	movs r5, #0x3a
	ldrsh r2, [r0, r5]
	lsls r2, r2, #8
	movs r5, #0x3c
	ldrsh r3, [r0, r5]
	orrs r2, r3
	lsls r1, r1, #8
	strh r4, [r0, #0x38]
	strh r2, [r0, #0x3a]
	strh r1, [r0, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08100208

	thumb_func_start sub_08100230
sub_08100230: @ 0x08100230
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldrh r0, [r0, #0x38]
	lsrs r1, r0, #8
	mov sl, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r1, r8
	ldrh r0, [r1, #0x3a]
	lsrs r2, r0, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrh r1, [r1, #0x3c]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r3, #0xff
	ands r3, r1
	cmp r2, #0
	bne _0810026A
	movs r2, #0x20
	rsbs r2, r2, #0
	b _08100272
_0810026A:
	cmp r2, #0xff
	bne _08100272
	movs r2, #0x88
	lsls r2, r2, #1
_08100272:
	mov r0, sb
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r1, sl
	subs r0, r2, r1
	lsls r5, r3, #0x10
	asrs r5, r5, #0x10
	muls r0, r5, r0
	lsls r1, r6, #0x10
	asrs r7, r1, #0x10
	adds r1, r7, #0
	bl __divsi3
	adds r6, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	muls r0, r5, r0
	adds r1, r7, #0
	bl __divsi3
	add r6, sl
	mov r1, r8
	strh r6, [r1, #0x20]
	add r0, sb
	strh r0, [r1, #0x22]
	adds r5, #1
	lsls r5, r5, #0x10
	lsrs r3, r5, #0x10
	asrs r5, r5, #0x10
	cmp r5, r7
	beq _081002C4
	lsls r1, r7, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	mov r1, r8
	strh r0, [r1, #0x3c]
	movs r0, #0
	b _081002C6
_081002C4:
	movs r0, #1
_081002C6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08100230

	thumb_func_start sub_081002D4
sub_081002D4: @ 0x081002D4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bne _081002E8
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
_081002E8:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _081002FC
	adds r0, r4, #0
	bl DestroyAnimSprite
_081002FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081002D4

	thumb_func_start sub_08100304
sub_08100304: @ 0x08100304
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	lsls r0, r0, #7
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, #0x2e]
	adds r1, r1, r0
	movs r5, #0
	strh r1, [r4, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7f
	ble _0810032E
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	strh r5, [r4, #0x2e]
_0810032E:
	ldrh r0, [r4, #0x2e]
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x30
	ldrsh r2, [r4, r1]
	lsls r2, r2, #3
	movs r1, #0x1e
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Sin
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	bl sub_08100230
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810035E
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x2e]
	ldr r0, _08100364
	str r0, [r4, #0x1c]
_0810035E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100364: .4byte 0x081002D5
	thumb_func_end sub_08100304

	thumb_func_start AnimPresent
AnimPresent: @ 0x08100368
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldr r4, _081003B0
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081003B4
	ldrb r1, [r0]
	movs r0, #2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _081003B8
	strh r6, [r5, #0x3a]
	adds r0, r2, #0
	adds r0, #0xa
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_08100208
	movs r0, #1
	b _081003CA
	.align 2, 0
_081003B0: .4byte 0x020380D7
_081003B4: .4byte 0x020380D6
_081003B8:
	strh r6, [r5, #0x3a]
	adds r0, r2, #0
	adds r0, #0xa
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_08100208
	movs r0, #3
_081003CA:
	strh r0, [r5, #0x34]
	movs r0, #0x3c
	strh r0, [r5, #0x36]
	ldr r0, _081003DC
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081003DC: .4byte 0x08100305
	thumb_func_end AnimPresent

	thumb_func_start sub_081003E0
sub_081003E0: @ 0x081003E0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	lsls r0, r0, #7
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, #0x2e]
	adds r1, r1, r0
	movs r5, #0
	strh r1, [r4, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7f
	ble _0810040A
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	strh r5, [r4, #0x2e]
_0810040A:
	ldrh r0, [r4, #0x2e]
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x30
	ldrsh r2, [r4, r1]
	lsls r2, r2, #3
	movs r1, #0x1e
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Sin
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	bl sub_08100230
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810043C
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x2e]
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810043C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081003E0

	thumb_func_start AnimKnockOffItem
AnimKnockOffItem: @ 0x08100444
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08100480
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08100488
	strh r0, [r5, #0x3a]
	adds r0, r6, #0
	adds r0, #0xa
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	movs r1, #0x28
	bl sub_08100208
	movs r0, #3
	strh r0, [r5, #0x34]
	movs r0, #0x3c
	strh r0, [r5, #0x36]
	ldr r0, _08100484
	b _081004B2
	.align 2, 0
_08100480: .4byte 0x020380D7
_08100484: .4byte 0x08100305
_08100488:
	movs r0, #0xff
	strh r0, [r5, #0x3a]
	adds r0, r6, #0
	adds r0, #0xa
	strh r0, [r5, #0x3c]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081004A0
	movs r0, #0
	strh r0, [r5, #0x3a]
_081004A0:
	adds r0, r5, #0
	movs r1, #0x28
	bl sub_08100208
	movs r0, #3
	strh r0, [r5, #0x34]
	movs r0, #0x3c
	strh r0, [r5, #0x36]
	ldr r0, _081004BC
_081004B2:
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081004BC: .4byte 0x081003E1
	thumb_func_end AnimKnockOffItem

	thumb_func_start AnimPresentHealParticle
AnimPresentHealParticle: @ 0x081004C0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081004DA
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	ldr r0, _08100500
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x30]
_081004DA:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x30]
	muls r0, r1, r0
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081004FA
	adds r0, r4, #0
	bl DestroyAnimSprite
_081004FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100500: .4byte 0x020380BE
	thumb_func_end AnimPresentHealParticle

	thumb_func_start AnimItemSteal
AnimItemSteal: @ 0x08100504
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	ldr r4, _0810054C
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08100550
	ldrb r1, [r0]
	movs r0, #2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _08100554
	strh r6, [r5, #0x3a]
	adds r0, r2, #0
	adds r0, #0xa
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_08100208
	movs r0, #1
	b _08100566
	.align 2, 0
_0810054C: .4byte 0x020380D6
_08100550: .4byte 0x020380D7
_08100554:
	strh r6, [r5, #0x3a]
	adds r0, r2, #0
	adds r0, #0xa
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_08100208
	movs r0, #3
_08100566:
	strh r0, [r5, #0x34]
	movs r0, #0x3c
	strh r0, [r5, #0x36]
	ldr r0, _08100578
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08100578: .4byte 0x0810057D
	thumb_func_end AnimItemSteal

	thumb_func_start AnimItemStealStep
AnimItemStealStep: @ 0x0810057C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	lsls r0, r0, #7
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, #0x2e]
	adds r1, r1, r0
	movs r5, #0
	strh r1, [r4, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7f
	ble _081005A6
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	strh r5, [r4, #0x2e]
_081005A6:
	ldrh r0, [r4, #0x2e]
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x30
	ldrsh r2, [r4, r1]
	lsls r2, r2, #3
	movs r1, #0x1e
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Sin
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081005DA
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x7d
	bl PlaySE12WithPanning
_081005DA:
	adds r0, r4, #0
	bl sub_08100230
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08100602
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x2e]
	ldr r0, _08100608
	str r0, [r4, #0x1c]
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x7d
	bl PlaySE12WithPanning
_08100602:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100608: .4byte 0x081002D5
	thumb_func_end AnimItemStealStep

	thumb_func_start AnimTrickBag
AnimTrickBag: @ 0x0810060C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081006A0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08100634
	ldr r0, _08100630
	ldrh r1, [r0, #2]
	strh r1, [r4, #0x30]
	movs r1, #0x78
	strh r1, [r4, #0x20]
	adds r5, r0, #0
	b _08100656
	.align 2, 0
_08100630: .4byte 0x020380BE
_08100634:
	ldr r0, _08100690
	movs r1, #2
	ldrsh r3, [r0, r1]
	adds r1, r3, #0
	subs r1, #0x20
	adds r2, r1, #0
	adds r5, r0, #0
	cmp r1, #0
	bge _0810064A
	adds r2, r3, #0
	adds r2, #0xdf
_0810064A:
	asrs r0, r2, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	strh r0, [r4, #0x30]
	movs r0, #0x46
	strh r0, [r4, #0x20]
_08100656:
	ldrh r0, [r5]
	strh r0, [r4, #0x22]
	strh r0, [r4, #0x32]
	movs r0, #0x14
	strh r0, [r4, #0x36]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x3c
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl Sin
	strh r0, [r4, #0x26]
	ldr r0, _08100694
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #0x30]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xbe
	bhi _08100698
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x1f
	b _0810069E
	.align 2, 0
_08100690: .4byte 0x020380BE
_08100694: .4byte 0x081006A9
_08100698:
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x1d
_0810069E:
	strb r0, [r1]
_081006A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTrickBag

	thumb_func_start AnimTrickBagStep1
AnimTrickBagStep1: @ 0x081006A8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081006BA
	cmp r0, #1
	beq _081006EA
	b _0810070A
_081006BA:
	ldrh r5, [r4, #0x32]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x4e
	ble _081006D2
	movs r0, #1
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	b _0810070A
_081006D2:
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl __divsi3
	adds r0, r5, r0
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x36]
	adds r1, #3
	strh r1, [r4, #0x36]
	strh r0, [r4, #0x22]
	b _0810070A
_081006EA:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0810070A
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0810070A
	movs r0, #0
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x32]
	ldr r0, _08100710
	str r0, [r4, #0x1c]
_0810070A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100710: .4byte 0x08100715
	thumb_func_end AnimTrickBagStep1

	thumb_func_start AnimTrickBagStep2
AnimTrickBagStep2: @ 0x08100714
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08100758
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r3, r0, r1
	adds r0, r5, #1
	adds r0, r3, r0
	ldrh r2, [r4, #0x32]
	movs r6, #0x32
	ldrsh r1, [r4, r6]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08100760
	adds r0, r5, #2
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x7f
	bne _0810074C
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldr r0, _0810075C
	str r0, [r4, #0x1c]
_0810074C:
	movs r0, #0
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _081007C6
	.align 2, 0
_08100758: .4byte 0x0856E2E4
_0810075C: .4byte 0x081007CD
_08100760:
	adds r0, r2, #1
	strh r0, [r4, #0x32]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r0, r5
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r5, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r2, r0
	ldrh r1, [r4, #0x30]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081007AE
	ldrh r0, [r4, #0x30]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xbe
	bhi _081007A6
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x1f
	b _081007AC
_081007A6:
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x1d
_081007AC:
	strb r0, [r1]
_081007AE:
	movs r6, #0x30
	ldrsh r0, [r4, r6]
	movs r1, #0x3c
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl Sin
	strh r0, [r4, #0x26]
_081007C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AnimTrickBagStep2

	thumb_func_start AnimTrickBagStep3
AnimTrickBagStep3: @ 0x081007CC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x14
	ble _081007DE
	adds r0, r4, #0
	bl DestroyAnimSprite
_081007DE:
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
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTrickBagStep3

	thumb_func_start sub_08100810
sub_08100810: @ 0x08100810
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _08100964
	adds r5, r0, r1
	ldr r4, _08100968
	ldrb r0, [r4]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	strh r0, [r5, #0x10]
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
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoordAttr
	strh r0, [r5, #0x1c]
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	strh r0, [r5, #0x1e]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
	cmp r0, #1
	bne _08100878
	movs r1, #1
_08100878:
	strh r1, [r5, #0x12]
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	lsls r0, r0, #6
	movs r1, #0x38
	subs r1, r1, r0
	strh r1, [r5, #0x1a]
	ldrh r0, [r5, #0x16]
	subs r0, r0, r1
	ldrh r1, [r5, #0x14]
	adds r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r0, _0810096C
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r3, #0x1a
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #0x10]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xc]
	cmp r0, #0x40
	bne _081008B0
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_081008B0:
	ldr r4, _08100970
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xa
	strh r1, [r0, #0x2e]
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r5, #0x18]
	strh r1, [r0, #0x30]
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r1, #0x1c
	ldrsh r0, [r5, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #0xa
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	ldrh r0, [r5, #0x14]
	subs r0, r0, r1
	strh r0, [r2, #0x32]
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r5, #0x1a]
	strh r1, [r0, #0x34]
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0x1e
	ldrsh r0, [r5, r2]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
	adds r0, #0xa
	movs r3, #0x12
	ldrsh r2, [r5, r3]
	muls r0, r2, r0
	ldrh r2, [r5, #0x16]
	adds r0, r0, r2
	strh r0, [r1, #0x36]
	movs r3, #0xc
	ldrsh r1, [r5, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl sub_08100D54
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	strh r0, [r1, #0x38]
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl InitAnimArcTranslation
	ldr r0, _08100974
	str r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08100964: .4byte 0x03005B60
_08100968: .4byte 0x020380D7
_0810096C: .4byte 0x0856E35C
_08100970: .4byte 0x020205AC
_08100974: .4byte 0x08100979
	thumb_func_end sub_08100810

	thumb_func_start sub_08100978
sub_08100978: @ 0x08100978
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081009BC
	adds r6, r0, r1
	movs r0, #0xc
	ldrsh r1, [r6, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081009C0
	adds r4, r0, r1
	movs r1, #8
	ldrsh r5, [r6, r1]
	cmp r5, #7
	bne _081009A0
	b _08100BD0
_081009A0:
	cmp r5, #7
	bgt _081009EE
	cmp r5, #3
	bne _081009AA
	b _08100AC2
_081009AA:
	cmp r5, #3
	bgt _081009C4
	cmp r5, #1
	beq _08100A54
	cmp r5, #1
	bgt _08100AA4
	cmp r5, #0
	beq _08100A36
	b _08100D4C
	.align 2, 0
_081009BC: .4byte 0x03005B60
_081009C0: .4byte 0x020205AC
_081009C4:
	cmp r5, #5
	bne _081009CA
	b _08100B38
_081009CA:
	cmp r5, #5
	ble _081009D0
	b _08100BB2
_081009D0:
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_08100D74
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081009E6
	b _08100D4C
_081009E6:
	movs r0, #5
	strh r0, [r6, #0x26]
	movs r0, #0xff
	b _08100D4A
_081009EE:
	cmp r5, #0xb
	bne _081009F4
	b _08100CB4
_081009F4:
	cmp r5, #0xb
	bgt _08100A22
	cmp r5, #9
	bne _081009FE
	b _08100C22
_081009FE:
	cmp r5, #9
	ble _08100A04
	b _08100C98
_08100A04:
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_08100D74
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08100A1A
	b _08100D4C
_08100A1A:
	movs r0, #9
	strh r0, [r6, #0x26]
	movs r0, #0xff
	b _08100D4A
_08100A22:
	cmp r5, #0xd
	bne _08100A28
	b _08100D26
_08100A28:
	cmp r5, #0xd
	bge _08100A2E
	b _08100D06
_08100A2E:
	cmp r5, #0xff
	bne _08100A34
	b _08100D36
_08100A34:
	b _08100D4C
_08100A36:
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_08100D74
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08100A4C
	b _08100D4C
_08100A4C:
	movs r0, #1
	strh r0, [r6, #0x26]
	movs r0, #0xff
	b _08100D4A
_08100A54:
	ldrh r2, [r4, #0x24]
	ldrh r3, [r4, #0x20]
	adds r2, r2, r3
	movs r0, #0
	strh r2, [r4, #0x20]
	ldrh r1, [r4, #0x26]
	ldrh r3, [r4, #0x22]
	adds r1, r1, r3
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x30]
	ldrh r0, [r6, #0x14]
	strh r0, [r4, #0x32]
	strh r1, [r4, #0x34]
	ldrh r0, [r6, #0x16]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl sub_08100D54
	strh r0, [r4, #0x38]
	ldrh r0, [r6, #0x10]
	adds r0, #2
	strh r0, [r6, #0x10]
	strh r5, [r6, #0xe]
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	ldrb r1, [r6, #0xe]
	adds r0, r4, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldrh r0, [r6, #8]
	adds r0, #1
	b _08100D4A
_08100AA4:
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_08100D74
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08100ABA
	b _08100D4C
_08100ABA:
	movs r0, #3
	strh r0, [r6, #0x26]
	movs r0, #0xff
	b _08100D4A
_08100AC2:
	ldrh r1, [r4, #0x24]
	ldrh r0, [r4, #0x20]
	adds r1, r1, r0
	movs r0, #0
	strh r1, [r4, #0x20]
	ldrh r2, [r4, #0x26]
	ldrh r3, [r4, #0x22]
	adds r2, r2, r3
	strh r2, [r4, #0x22]
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x30]
	movs r1, #0x1c
	ldrsh r0, [r6, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #0xa
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r0, r1
	ldrh r0, [r6, #0x14]
	subs r0, r0, r1
	strh r0, [r4, #0x32]
	strh r2, [r4, #0x34]
	movs r1, #0x1e
	ldrsh r0, [r6, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #0xa
	movs r2, #0x12
	ldrsh r1, [r6, r2]
	muls r1, r0, r1
	ldrh r0, [r6, #0x16]
	subs r0, r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl sub_08100D54
	strh r0, [r4, #0x38]
	movs r0, #2
	strh r0, [r6, #0xe]
	ldrh r0, [r6, #0x10]
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	ldrb r1, [r6, #0xe]
	adds r0, r4, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldrh r0, [r6, #8]
	adds r0, #1
	b _08100D4A
_08100B38:
	ldrh r1, [r4, #0x24]
	ldrh r3, [r4, #0x20]
	adds r1, r1, r3
	movs r0, #0
	strh r1, [r4, #0x20]
	ldrh r2, [r4, #0x26]
	ldrh r3, [r4, #0x22]
	adds r2, r2, r3
	strh r2, [r4, #0x22]
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x30]
	movs r1, #0x1c
	ldrsh r0, [r6, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #0xa
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r0, r1, r0
	ldrh r1, [r6, #0x14]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	strh r2, [r4, #0x34]
	movs r2, #0x1e
	ldrsh r0, [r6, r2]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #0xa
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r0, r1, r0
	ldrh r1, [r6, #0x16]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl sub_08100D54
	strh r0, [r4, #0x38]
	ldrh r1, [r6, #0x10]
	subs r1, #2
	strh r1, [r6, #0x10]
	movs r0, #3
	strh r0, [r6, #0xe]
	adds r0, r4, #0
	adds r0, #0x43
	strb r1, [r0]
	ldrb r1, [r6, #0xe]
	adds r0, r4, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldrh r0, [r6, #8]
	adds r0, #1
	b _08100D4A
_08100BB2:
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_08100D74
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08100BC8
	b _08100D4C
_08100BC8:
	movs r0, #7
	strh r0, [r6, #0x26]
	movs r0, #0xff
	b _08100D4A
_08100BD0:
	ldrh r2, [r4, #0x24]
	ldrh r3, [r4, #0x20]
	adds r2, r2, r3
	movs r0, #0
	strh r2, [r4, #0x20]
	ldrh r1, [r4, #0x26]
	ldrh r3, [r4, #0x22]
	adds r1, r1, r3
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x30]
	ldrh r0, [r6, #0x14]
	strh r0, [r4, #0x32]
	strh r1, [r4, #0x34]
	ldrh r0, [r6, #0x16]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl sub_08100D54
	strh r0, [r4, #0x38]
	ldrh r1, [r6, #0x10]
	adds r1, #2
	strh r1, [r6, #0x10]
	movs r0, #4
	strh r0, [r6, #0xe]
	adds r0, r4, #0
	adds r0, #0x43
	strb r1, [r0]
	ldrb r1, [r6, #0xe]
	adds r0, r4, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldrh r0, [r6, #8]
	adds r0, #1
	b _08100D4A
_08100C22:
	ldrh r1, [r4, #0x24]
	ldrh r0, [r4, #0x20]
	adds r1, r1, r0
	movs r0, #0
	strh r1, [r4, #0x20]
	ldrh r2, [r4, #0x26]
	ldrh r3, [r4, #0x22]
	adds r2, r2, r3
	strh r2, [r4, #0x22]
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x30]
	movs r1, #0x1c
	ldrsh r0, [r6, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #0xa
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r0, r1
	ldrh r0, [r6, #0x14]
	subs r0, r0, r1
	strh r0, [r4, #0x32]
	strh r2, [r4, #0x34]
	movs r1, #0x1e
	ldrsh r0, [r6, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #0xa
	movs r2, #0x12
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	ldrh r3, [r6, #0x16]
	adds r0, r0, r3
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl sub_08100D54
	strh r0, [r4, #0x38]
	movs r0, #5
	strh r0, [r6, #0xe]
	ldrh r0, [r6, #0x10]
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	ldrb r1, [r6, #0xe]
	adds r0, r4, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldrh r0, [r6, #8]
	adds r0, #1
	b _08100D4A
_08100C98:
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_08100D74
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08100D4C
	movs r0, #0xb
	strh r0, [r6, #0x26]
	movs r0, #0xff
	b _08100D4A
_08100CB4:
	ldrh r2, [r4, #0x24]
	ldrh r0, [r4, #0x20]
	adds r2, r2, r0
	movs r0, #0
	strh r2, [r4, #0x20]
	ldrh r1, [r4, #0x26]
	ldrh r3, [r4, #0x22]
	adds r1, r1, r3
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x30]
	ldrh r0, [r6, #0x18]
	strh r0, [r4, #0x32]
	strh r1, [r4, #0x34]
	ldrh r0, [r6, #0x1a]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl sub_08100D54
	strh r0, [r4, #0x38]
	ldrh r1, [r6, #0x10]
	subs r1, #2
	strh r1, [r6, #0x10]
	movs r0, #6
	strh r0, [r6, #0xe]
	adds r0, r4, #0
	adds r0, #0x43
	strb r1, [r0]
	ldrb r1, [r6, #0xe]
	adds r0, r4, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldrh r0, [r6, #8]
	adds r0, #1
	b _08100D4A
_08100D06:
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_08100D74
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08100D4C
	adds r0, r4, #0
	bl DestroySprite
	ldrh r0, [r6, #8]
	adds r0, #1
	b _08100D4A
_08100D26:
	movs r1, #0x20
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08100D4C
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	b _08100D4C
_08100D36:
	ldrh r0, [r6, #0xa]
	adds r0, #1
	strh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08100D4C
	movs r0, #0
	strh r0, [r6, #0xa]
	ldrh r0, [r6, #0x26]
_08100D4A:
	strh r0, [r6, #8]
_08100D4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08100978

	thumb_func_start sub_08100D54
sub_08100D54: @ 0x08100D54
	push {lr}
	movs r2, #8
	movs r3, #0x36
	ldrsh r1, [r0, r3]
	movs r3, #0x22
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _08100D6A
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08100D6A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08100D54

	thumb_func_start sub_08100D74
sub_08100D74: @ 0x08100D74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldrh r0, [r6, #0x24]
	adds r0, #1
	strh r0, [r6, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08100E0A
	movs r0, #0
	strh r0, [r6, #0x24]
	ldr r0, _08100E14
	mov r8, r0
	movs r2, #0xc
	ldrsh r1, [r6, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r1, [r0, #0x24]
	ldrh r2, [r0, #0x20]
	adds r1, r1, r2
	ldrh r2, [r0, #0x26]
	ldrh r0, [r0, #0x22]
	adds r2, r2, r0
	ldr r0, _08100E18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrb r3, [r6, #0x10]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08100E0A
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	mov r0, r8
	adds r4, r5, r0
	strh r7, [r4, #0x3a]
	movs r0, #0xc
	strh r0, [r4, #0x3c]
	ldr r0, _08100E1C
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
	ldrh r2, [r6, #0x22]
	movs r0, #1
	ands r0, r2
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	ldrb r1, [r6, #0xe]
	adds r0, r4, #0
	bl StartSpriteAnim
	ldrh r0, [r6, #0x10]
	adds r4, #0x43
	strb r0, [r4]
	mov r0, r8
	adds r0, #0x1c
	adds r5, r5, r0
	ldr r0, _08100E20
	str r0, [r5]
_08100E0A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08100E14: .4byte 0x020205AC
_08100E18: .4byte 0x0856E35C
_08100E1C: .4byte 0x03005B60
_08100E20: .4byte 0x08100E25
	thumb_func_end sub_08100D74

	thumb_func_start sub_08100E24
sub_08100E24: @ 0x08100E24
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08100E86
	movs r0, #0
	strh r0, [r4, #0x2e]
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
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _08100E86
	ldr r3, _08100E8C
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
_08100E86:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100E8C: .4byte 0x03005B60
	thumb_func_end sub_08100E24

	thumb_func_start sub_08100E90
sub_08100E90: @ 0x08100E90
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08100EA4
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08100EAC
	ldr r0, _08100EA8
	b _08100EAE
	.align 2, 0
_08100EA4: .4byte 0x020380BE
_08100EA8: .4byte 0x020380D6
_08100EAC:
	ldr r0, _08100ECC
_08100EAE:
	ldrb r6, [r0]
	adds r0, r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08100ED8
	movs r0, #0
	strh r0, [r4, #0x36]
	ldr r1, _08100ED0
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x32]
	ldr r0, _08100ED4
	b _08100EE8
	.align 2, 0
_08100ECC: .4byte 0x020380D7
_08100ED0: .4byte 0x020380BE
_08100ED4: .4byte 0x0000FFF0
_08100ED8:
	movs r0, #1
	strh r0, [r4, #0x36]
	ldr r1, _08100F0C
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	strh r0, [r4, #0x32]
	movs r0, #0x80
	lsls r0, r0, #1
_08100EE8:
	strh r0, [r4, #0x20]
	adds r7, r1, #0
	adds r5, r7, #0
	ldrh r0, [r5, #2]
	strh r0, [r4, #0x30]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x34]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _08100F1E
	cmp r0, #1
	bgt _08100F10
	cmp r0, #0
	beq _08100F1A
	b _08100F88
	.align 2, 0
_08100F0C: .4byte 0x020380BE
_08100F10:
	cmp r0, #2
	beq _08100F24
	cmp r0, #3
	beq _08100F50
	b _08100F88
_08100F1A:
	ldrh r0, [r5]
	b _08100F34
_08100F1E:
	ldrh r0, [r5]
	strh r0, [r4, #0x22]
	b _08100F6A
_08100F24:
	adds r0, r6, #0
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r5, [r5]
	adds r0, r0, r5
_08100F34:
	strh r0, [r4, #0x22]
	adds r0, r6, #0
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
	b _08100F88
_08100F50:
	ldr r0, _08100F94
	ldrb r0, [r0]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r7, [r7]
	adds r0, r0, r7
	strh r0, [r4, #0x22]
	movs r0, #1
	bl GetAnimBattlerSpriteId
_08100F6A:
	adds r0, r6, #0
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
_08100F88:
	ldr r0, _08100F98
	str r0, [r4, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08100F94: .4byte 0x020380D7
_08100F98: .4byte 0x08100F9D
	thumb_func_end sub_08100E90

	thumb_func_start sub_08100F9C
sub_08100F9C: @ 0x08100F9C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r3, [r4, r0]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	movs r1, #0x30
	ldrsh r2, [r4, r1]
	ldr r1, _08100FF0
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x26]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	muls r0, r3, r0
	strh r0, [r4, #0x24]
	movs r5, #0x34
	ldrsh r0, [r4, r5]
	muls r0, r3, r0
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08100FF4
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	movs r5, #0x20
	ldrsh r1, [r4, r5]
	adds r0, r0, r1
	cmp r0, #0xf7
	ble _0810100C
	b _08101006
	.align 2, 0
_08100FF0: .4byte 0x082FA8CC
_08100FF4:
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	movs r2, #0x20
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _0810100C
_08101006:
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_0810100C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08100F9C

	thumb_func_start sub_08101014
sub_08101014: @ 0x08101014
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _08101034
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08101038
	cmp r0, #1
	beq _0810106C
	b _081010C6
	.align 2, 0
_08101034: .4byte 0x03005B60
_08101038:
	ldr r0, _08101064
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r2, #0
	adds r0, r0, r4
	strh r0, [r5, #0x18]
	ldr r0, _08101068
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	adds r0, r0, r4
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _081010C6
	.align 2, 0
_08101064: .4byte 0x0000274F
_08101068: .4byte 0x000027B0
_0810106C:
	ldrh r0, [r5, #0x1a]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _081010C6
	strh r7, [r5, #0x1a]
	ldrh r0, [r5, #0x18]
	ldrb r2, [r5, #0x1c]
	ldr r4, _081010E0
	movs r3, #0x1e
	ldrsh r1, [r5, r3]
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r3, [r1]
	movs r1, #0x10
	bl BlendPalette
	ldrh r0, [r5, #0x20]
	ldrb r2, [r5, #0x1c]
	movs r3, #0x1e
	ldrsh r1, [r5, r3]
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r3, [r1]
	movs r1, #0x10
	bl BlendPalette
	ldrh r0, [r5, #0x1c]
	adds r0, #1
	strh r0, [r5, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _081010C6
	strh r7, [r5, #0x1c]
	ldrh r0, [r5, #0x1e]
	adds r0, #1
	strh r0, [r5, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bne _081010C6
	strh r7, [r5, #0x1e]
_081010C6:
	ldr r0, _081010E4
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _081010DA
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_081010DA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081010E0: .4byte 0x0856E45C
_081010E4: .4byte 0x020380BE
	thumb_func_end sub_08101014

	thumb_func_start sub_081010E8
sub_081010E8: @ 0x081010E8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08101100
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08101104
	adds r0, r6, #0
	bl DestroyAnimSprite
	b _081011DE
	.align 2, 0
_08101100: .4byte 0x020380BE
_08101104:
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08101114
	ldr r4, _08101110
	b _08101116
	.align 2, 0
_08101110: .4byte 0x020380D6
_08101114:
	ldr r4, _08101150
_08101116:
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08101154
	ldrh r1, [r0, #8]
	strh r1, [r6, #0x2e]
	movs r3, #2
	ldrsh r1, [r0, r3]
	adds r7, r0, #0
	cmp r1, #0
	bne _08101158
	ldrh r0, [r7, #4]
	adds r0, r0, r5
	strh r0, [r6, #0x20]
	ldrh r0, [r7, #6]
	adds r0, r0, r2
	strh r0, [r6, #0x22]
	strh r5, [r6, #0x38]
	strh r2, [r6, #0x3a]
	b _08101168
	.align 2, 0
_08101150: .4byte 0x020380D7
_08101154: .4byte 0x020380BE
_08101158:
	strh r5, [r6, #0x20]
	strh r2, [r6, #0x22]
	ldrh r0, [r7, #4]
	adds r0, r0, r5
	strh r0, [r6, #0x38]
	ldrh r0, [r7, #6]
	adds r0, r0, r2
	strh r0, [r6, #0x3a]
_08101168:
	ldrh r4, [r6, #0x20]
	lsls r0, r4, #4
	strh r0, [r6, #0x30]
	ldrh r5, [r6, #0x22]
	lsls r0, r5, #4
	strh r0, [r6, #0x32]
	movs r1, #0x38
	ldrsh r0, [r6, r1]
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	lsls r0, r0, #4
	movs r3, #8
	ldrsh r1, [r7, r3]
	bl __divsi3
	strh r0, [r6, #0x34]
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	movs r2, #0x22
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	lsls r0, r0, #4
	movs r3, #8
	ldrsh r1, [r7, r3]
	bl __divsi3
	strh r0, [r6, #0x36]
	ldrh r0, [r6, #0x38]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #0x3a]
	subs r1, r1, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2Neg
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081011CA
	ldr r1, _081011E8
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_081011CA:
	movs r3, #0x80
	lsls r3, r3, #1
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #0
	adds r2, r3, #0
	bl TrySetSpriteRotScale
	ldr r0, _081011EC
	str r0, [r6, #0x1c]
_081011DE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081011E8: .4byte 0xFFFF8000
_081011EC: .4byte 0x081011F1
	thumb_func_end sub_081010E8

	thumb_func_start sub_081011F0
sub_081011F0: @ 0x081011F0
	push {r4, lr}
	adds r2, r0, #0
	ldrh r3, [r2, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _08101220
	ldrh r0, [r2, #0x34]
	ldrh r4, [r2, #0x30]
	adds r0, r0, r4
	strh r0, [r2, #0x30]
	ldrh r1, [r2, #0x36]
	ldrh r4, [r2, #0x32]
	adds r1, r1, r4
	strh r1, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r2, #0x22]
	subs r0, r3, #1
	strh r0, [r2, #0x2e]
	b _08101226
_08101220:
	adds r0, r2, #0
	bl DestroySpriteAndMatrix
_08101226:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081011F0

	thumb_func_start sub_0810122C
sub_0810122C: @ 0x0810122C
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08101242
	adds r0, r2, #0
	bl DestroyAnimSprite
_08101242:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810122C

	thumb_func_start sub_08101248
sub_08101248: @ 0x08101248
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08101268
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08101270
	ldr r2, _0810126C
	ldrh r0, [r4, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r2, #2]
	b _0810127C
	.align 2, 0
_08101268: .4byte 0x020380D6
_0810126C: .4byte 0x020380BE
_08101270:
	ldr r0, _08101294
	ldrh r1, [r0]
	ldrh r2, [r4, #0x20]
	adds r1, r1, r2
	strh r1, [r4, #0x20]
	ldrh r0, [r0, #2]
_0810127C:
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, _08101298
	str r0, [r4, #0x1c]
	ldr r1, _0810129C
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101294: .4byte 0x020380BE
_08101298: .4byte 0x080A60A1
_0810129C: .4byte 0x080A34C5
	thumb_func_end sub_08101248

	thumb_func_start sub_081012A0
sub_081012A0: @ 0x081012A0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _081012D8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081012BA
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
_081012BA:
	ldr r0, _081012DC
	str r0, [r5, #0x1c]
	ldr r4, _081012E0
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl SetAnimSpriteInitialXOffset
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081012D8: .4byte 0x020380D6
_081012DC: .4byte 0x0810122D
_081012E0: .4byte 0x020380BE
	thumb_func_end sub_081012A0

	thumb_func_start sub_081012E4
sub_081012E4: @ 0x081012E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08101324
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x34]
	ldrh r0, [r1, #0xa]
	strh r0, [r4, #0x38]
	ldrb r1, [r1, #0xc]
	adds r0, r4, #0
	bl StartSpriteAffineAnim
	ldr r1, _08101328
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810132C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101324: .4byte 0x020380BE
_08101328: .4byte 0x080A6015
_0810132C: .4byte 0x080A5FA5
	thumb_func_end sub_081012E4

	thumb_func_start AnimCuttingSlice
AnimCuttingSlice: @ 0x08101330
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08101380
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
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08101364
	ldrh r0, [r5, #0x22]
	adds r0, #8
	strh r0, [r5, #0x22]
_08101364:
	ldr r0, _08101384
	str r0, [r5, #0x1c]
	ldr r0, _08101388
	movs r2, #4
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #0
	bne _0810138C
	ldrh r0, [r3]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	b _081013A0
	.align 2, 0
_08101380: .4byte 0x020380D7
_08101384: .4byte 0x0810151D
_08101388: .4byte 0x020380BE
_0810138C:
	ldrh r0, [r5, #0x20]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x20]
	adds r2, r5, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_081013A0:
	ldrh r0, [r3, #2]
	ldrh r2, [r5, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	ldr r1, _081013D4
	adds r0, r1, #0
	ldrh r2, [r5, #0x30]
	adds r1, r0, r2
	strh r1, [r5, #0x30]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r5, #0x32]
	adds r0, r0, r2
	strh r0, [r5, #0x32]
	ldrh r0, [r3, #4]
	strh r0, [r5, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _081013CE
	rsbs r0, r1, #0
	strh r0, [r5, #0x30]
_081013CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081013D4: .4byte 0xFFFFFC00
	thumb_func_end AnimCuttingSlice

	thumb_func_start sub_081013D8
sub_081013D8: @ 0x081013D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _081013F4
	movs r1, #6
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _081013F8
	cmp r0, #1
	ble _08101474
	cmp r0, #2
	beq _08101418
	b _08101474
	.align 2, 0
_081013F4: .4byte 0x020380BE
_081013F8:
	ldr r5, _08101414
	ldrb r0, [r5]
	movs r4, #2
	eors r0, r4
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r5]
	eors r4, r0
	adds r0, r4, #0
	b _08101484
	.align 2, 0
_08101414: .4byte 0x020380D7
_08101418:
	ldr r5, _08101470
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5]
	movs r2, #2
	mov r8, r2
	mov r1, r8
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810148E
	ldrb r0, [r5]
	mov r2, r8
	eors r0, r2
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r7
	lsrs r7, r0, #1
	ldrb r0, [r5]
	mov r1, r8
	eors r0, r1
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	lsrs r4, r0, #1
	b _0810148E
	.align 2, 0
_08101470: .4byte 0x020380D7
_08101474:
	ldr r4, _081014C0
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r4]
_08101484:
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0810148E:
	strh r7, [r6, #0x20]
	strh r4, [r6, #0x22]
	ldr r0, _081014C0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081014A6
	ldrh r0, [r6, #0x22]
	adds r0, #8
	strh r0, [r6, #0x22]
_081014A6:
	ldr r0, _081014C4
	str r0, [r6, #0x1c]
	ldr r0, _081014C8
	movs r2, #4
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #0
	bne _081014CC
	ldrh r0, [r3]
	ldrh r1, [r6, #0x20]
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	b _081014E0
	.align 2, 0
_081014C0: .4byte 0x020380D7
_081014C4: .4byte 0x0810151D
_081014C8: .4byte 0x020380BE
_081014CC:
	ldrh r0, [r6, #0x20]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x20]
	adds r2, r6, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_081014E0:
	ldrh r0, [r3, #2]
	ldrh r2, [r6, #0x22]
	adds r0, r0, r2
	strh r0, [r6, #0x22]
	ldr r1, _08101518
	adds r0, r1, #0
	ldrh r2, [r6, #0x30]
	adds r1, r0, r2
	strh r1, [r6, #0x30]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r6, #0x32]
	adds r0, r0, r2
	strh r0, [r6, #0x32]
	ldrh r0, [r3, #4]
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0810150E
	rsbs r0, r1, #0
	strh r0, [r6, #0x30]
_0810150E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101518: .4byte 0xFFFFFC00
	thumb_func_end sub_081013D8

	thumb_func_start AnimSliceStep
AnimSliceStep: @ 0x0810151C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	ldrh r2, [r4, #0x34]
	adds r0, r1, r2
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x36]
	adds r0, r0, r2
	strh r0, [r4, #0x36]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0810153E
	adds r0, r1, #0
	adds r0, #0x18
	b _08101542
_0810153E:
	adds r0, r1, #0
	subs r0, #0x18
_08101542:
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x32]
	subs r0, #0x18
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _08101578
	ldr r1, _08101580
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	movs r0, #3
	strh r0, [r4, #0x2e]
	ldr r0, _08101584
	str r0, [r4, #0x1c]
_08101578:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101580: .4byte 0x080A34C5
_08101584: .4byte 0x080A5D79
	thumb_func_end AnimSliceStep

	thumb_func_start unref_sub_8100D38
unref_sub_8100D38: @ 0x08101588
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0x32]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	cmp r0, #1
	ble _0810162C
	ldrh r1, [r5, #0x34]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081015E4
	adds r3, r5, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r4, _081015E0
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r3, [r0]
	adds r1, r2, #0
	ands r1, r3
	strb r1, [r0]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _0810161A
	.align 2, 0
_081015E0: .4byte 0x020205AC
_081015E4:
	adds r1, r5, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _08101628
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
_0810161A:
	movs r0, #0
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x34]
	adds r0, #1
	strh r0, [r5, #0x34]
	b _08101630
	.align 2, 0
_08101628: .4byte 0x020205AC
_0810162C:
	adds r0, r1, #1
	strh r0, [r5, #0x32]
_08101630:
	movs r1, #0x34
	ldrsh r0, [r5, r1]
	cmp r0, #0xa
	bne _08101660
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08101668
	adds r0, r0, r4
	bl DestroySprite
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	adds r0, r5, #0
	bl DestroyAnimSprite
_08101660:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08101668: .4byte 0x020205AC
	thumb_func_end unref_sub_8100D38

	thumb_func_start sub_0810166C
sub_0810166C: @ 0x0810166C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0810168C
	ldrh r0, [r4, #4]
	strh r0, [r5, #0x2e]
	ldr r0, _08101690
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08101694
	ldrh r0, [r5, #0x20]
	ldrh r1, [r4]
	subs r0, r0, r1
	b _0810169A
	.align 2, 0
_0810168C: .4byte 0x020380BE
_08101690: .4byte 0x020380D6
_08101694:
	ldrh r0, [r4]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
_0810169A:
	strh r0, [r5, #0x20]
	ldr r4, _081016C8
	ldrb r1, [r4, #0xa]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldrh r0, [r4, #6]
	rsbs r0, r0, #0
	strh r0, [r5, #0x30]
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x34]
	ldr r1, _081016CC
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081016C8: .4byte 0x020380BE
_081016CC: .4byte 0x081016D1
	thumb_func_end sub_0810166C

	thumb_func_start sub_081016D0
sub_081016D0: @ 0x081016D0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #0x64
	bl Cos
	strh r0, [r4, #0x24]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	movs r1, #0x14
	bl Sin
	strh r0, [r4, #0x26]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	bgt _081016FC
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0
	b _08101702
_081016FC:
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0xe
_08101702:
	strb r0, [r1]
	ldrh r0, [r4, #0x30]
	ldrh r2, [r4, #0x2e]
	adds r0, r0, r2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x38]
	adds r0, #0x82
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08101738
	adds r0, r4, #0
	bl DestroyAnimSprite
_08101738:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081016D0

	thumb_func_start sub_08101740
sub_08101740: @ 0x08101740
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08101756
	ldr r1, _081017B4
	ldrh r0, [r1, #2]
	adds r0, #8
	strh r0, [r1, #2]
_08101756:
	ldr r6, _081017B8
	ldrb r0, [r6]
	movs r1, #0
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	ldr r4, _081017B4
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	ldrb r0, [r6]
	movs r1, #1
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r4, [r4, #2]
	adds r0, r0, r4
	strh r0, [r5, #0x22]
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08101794
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081017BC
_08101794:
	ldrb r0, [r6]
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
	b _081017D4
	.align 2, 0
_081017B4: .4byte 0x020380BE
_081017B8: .4byte 0x020380D6
_081017BC:
	ldrb r0, [r6]
	bl GetBattlerSpriteBGPriority
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
_081017D4:
	ldr r0, _08101818
	ldrh r0, [r0, #4]
	strh r0, [r5, #0x2e]
	ldr r0, _0810181C
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	movs r4, #0x10
	movs r0, #0x10
	strh r0, [r5, #0x3c]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldrh r0, [r5, #0x3c]
	lsls r1, r0, #8
	subs r4, r4, r0
	orrs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldr r0, _08101820
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101818: .4byte 0x020380BE
_0810181C: .4byte 0x00002828
_08101820: .4byte 0x08101825
	thumb_func_end sub_08101740

	thumb_func_start sub_08101824
sub_08101824: @ 0x08101824
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	adds r0, #0x60
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08101882
	movs r0, #0
	strh r0, [r4, #0x30]
	ldr r1, _081018CC
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r2, #0
	adds r6, r1, #0
	adds r3, r6, #0
_0810185C:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	adds r2, #1
	adds r0, r0, r2
	lsls r1, r0, #1
	adds r1, r1, r3
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	cmp r2, #5
	ble _0810185C
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	adds r0, #7
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r5, [r0]
_08101882:
	ldrh r2, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #6
	ble _081018BC
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _081018D0
	ldrh r0, [r4, #0x3a]
	adds r0, #1
	strh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _081018BC
	movs r0, #0
	strh r0, [r4, #0x3a]
	subs r2, #1
	strh r2, [r4, #0x3c]
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
_081018BC:
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _081018D0
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
	b _08101912
	.align 2, 0
_081018CC: .4byte 0x020377B4
_081018D0:
	ldrh r0, [r4, #0x3a]
	adds r0, #1
	strh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08101912
	movs r0, #0
	strh r0, [r4, #0x3a]
	ldrh r2, [r4, #0x3c]
	adds r2, #1
	strh r2, [r4, #0x3c]
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _08101912
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08101918
	str r0, [r4, #0x1c]
_08101912:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101918: .4byte 0x080A60BD
	thumb_func_end sub_08101824

	thumb_func_start sub_0810191C
sub_0810191C: @ 0x0810191C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0810197C
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r4, #0x20]
	ldrb r0, [r6]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08101980
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	strh r5, [r4, #0x2e]
	strh r5, [r4, #0x30]
	strh r5, [r4, #0x32]
	strh r5, [r4, #0x34]
	strh r5, [r4, #0x36]
	strh r5, [r4, #0x3a]
	movs r0, #0x10
	strh r0, [r4, #0x3c]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x3a]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldr r0, _08101984
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810197C: .4byte 0x020380D7
_08101980: .4byte 0x0000FFE8
_08101984: .4byte 0x08101989
	thumb_func_end sub_0810191C

	thumb_func_start sub_08101988
sub_08101988: @ 0x08101988
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bls _08101996
	b _08101AE0
_08101996:
	lsls r0, r0, #2
	ldr r1, _081019A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081019A0: .4byte 0x081019A4
_081019A4: @ jump table
	.4byte _081019B8 @ case 0
	.4byte _08101A1C @ case 1
	.4byte _08101A38 @ case 2
	.4byte _08101AB6 @ case 3
	.4byte _08101ACA @ case 4
_081019B8:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _081019C6
	b _08101AE0
_081019C6:
	movs r0, #0
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _081019E8
	ldrh r1, [r4, #0x3a]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	bgt _081019F6
	adds r0, r1, #1
	strh r0, [r4, #0x3a]
	b _081019F6
_081019E8:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _081019F6
	subs r0, r1, #1
	strh r0, [r4, #0x3c]
_081019F6:
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x3a]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _08101AE0
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08101AE0
	strh r0, [r4, #0x30]
	b _08101AC2
_08101A1C:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _08101AE0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	b _08101AC2
_08101A38:
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #4
	bl sub_08101AE8
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08101A5A
	movs r0, #0
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	adds r0, #1
	strh r0, [r4, #0x22]
_08101A5A:
	ldrh r0, [r4, #0x32]
	adds r1, r0, #1
	strh r1, [r4, #0x32]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _08101AE0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08101A80
	ldrh r1, [r4, #0x3a]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08101A8E
	subs r0, r1, #1
	strh r0, [r4, #0x3a]
	b _08101A8E
_08101A80:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	bgt _08101A8E
	adds r0, r1, #1
	strh r0, [r4, #0x3c]
_08101A8E:
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x3a]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _08101AE0
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0x10
	bne _08101AE0
	strh r1, [r4, #0x30]
	strh r1, [r4, #0x32]
	b _08101AC2
_08101AB6:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_08101AC2:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _08101AE0
_08101ACA:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimSprite
_08101AE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08101988

	thumb_func_start sub_08101AE8
sub_08101AE8: @ 0x08101AE8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xb
	bgt _08101AFA
	ldrh r0, [r4, #0x36]
	adds r0, #2
	strh r0, [r4, #0x36]
_08101AFA:
	ldrh r5, [r4, #0x34]
	adds r0, r5, #0
	subs r0, #0x12
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	cmp r0, #0x17
	bhi _08101B10
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
_08101B10:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2f
	ble _08101B1E
	ldrh r0, [r4, #0x36]
	adds r0, #2
	strh r0, [r4, #0x36]
_08101B1E:
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r1, #9
	bl __divsi3
	strh r0, [r4, #0x24]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r1, #0xe
	bl __divsi3
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08101B44
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
_08101B44:
	adds r0, r5, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	ble _08101B54
	movs r0, #0
	strh r0, [r4, #0x34]
_08101B54:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08101AE8

	thumb_func_start sub_08101B5C
sub_08101B5C: @ 0x08101B5C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08101BA0
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08101B70
	adds r0, r4, #0
	bl SetSpriteCoordsToAnimAttackerCoords
_08101B70:
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	bl SetAnimSpriteInitialXOffset
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrh r0, [r5, #0xa]
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x30]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x32]
	ldr r1, _08101BA4
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08101BA8
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08101BA0: .4byte 0x020380BE
_08101BA4: .4byte 0x080A34C5
_08101BA8: .4byte 0x080A5E35
	thumb_func_end sub_08101B5C

	thumb_func_start sub_08101BAC
sub_08101BAC: @ 0x08101BAC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08101BC0
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08101BC8
	ldr r0, _08101BC4
	b _08101BCA
	.align 2, 0
_08101BC0: .4byte 0x020380BE
_08101BC4: .4byte 0x020380D6
_08101BC8:
	ldr r0, _08101C0C
_08101BCA:
	ldrb r6, [r0]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08101C14
	movs r1, #2
	adds r0, r6, #0
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08101C14
	ldr r4, _08101C10
	ldrb r1, [r4, #0xc]
	adds r2, r5, #0
	adds r2, #0x20
	adds r3, r5, #0
	adds r3, #0x22
	adds r0, r6, #0
	bl SetAverageBattlerPositions
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r0, r5, #0
	bl SetAnimSpriteInitialXOffset
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	b _08101C64
	.align 2, 0
_08101C0C: .4byte 0x020380D7
_08101C10: .4byte 0x020380BE
_08101C14:
	ldr r4, _08101C34
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08101C38
	adds r0, r6, #0
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	adds r0, r6, #0
	movs r1, #1
	b _08101C4A
	.align 2, 0
_08101C34: .4byte 0x020380BE
_08101C38:
	adds r0, r6, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	adds r0, r6, #0
	movs r1, #3
_08101C4A:
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r4, [r4, #2]
	adds r0, r0, r4
	strh r0, [r5, #0x22]
	ldr r0, _08101C84
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r5, #0
	bl SetAnimSpriteInitialXOffset
_08101C64:
	ldr r1, _08101C84
	ldrh r0, [r1, #0xa]
	strh r0, [r5, #0x2e]
	ldrh r0, [r1, #6]
	strh r0, [r5, #0x30]
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x32]
	ldr r1, _08101C88
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08101C8C
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101C84: .4byte 0x020380BE
_08101C88: .4byte 0x080A34C5
_08101C8C: .4byte 0x080A5E35
	thumb_func_end sub_08101BAC

	thumb_func_start sub_08101C90
sub_08101C90: @ 0x08101C90
	push {r4, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r0, _08101CBC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08101CC4
	ldr r0, _08101CC0
	ldrh r1, [r0]
	ldrh r2, [r4, #0x20]
	adds r1, r1, r2
	strh r1, [r4, #0x20]
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	b _08101CDE
	.align 2, 0
_08101CBC: .4byte 0x020380D6
_08101CC0: .4byte 0x020380BE
_08101CC4:
	ldr r2, _08101CE8
	ldrh r0, [r4, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r2, #2]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
_08101CDE:
	ldr r0, _08101CEC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101CE8: .4byte 0x020380BE
_08101CEC: .4byte 0x08101CF1
	thumb_func_end sub_08101C90

	thumb_func_start sub_08101CF0
sub_08101CF0: @ 0x08101CF0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _08101D28
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	movs r0, #0x1e
	subs r0, r0, r1
	movs r1, #3
	bl __divsi3
	strh r0, [r4, #0x26]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x12
	asrs r0, r0, #0x10
	movs r1, #3
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_08101D28:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08101D3C
	adds r0, r4, #0
	bl DestroyAnimSprite
_08101D3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08101CF0

	thumb_func_start sub_08101D44
sub_08101D44: @ 0x08101D44
	push {r4, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r0, _08101D74
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08101D7C
	ldr r1, _08101D78
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	movs r0, #1
	strh r0, [r4, #0x34]
	b _08101D9A
	.align 2, 0
_08101D74: .4byte 0x020380D6
_08101D78: .4byte 0x020380BE
_08101D7C:
	ldr r2, _08101DA4
	ldrh r0, [r4, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r2, #2]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	ldr r0, _08101DA8
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
_08101D9A:
	ldr r0, _08101DAC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101DA4: .4byte 0x020380BE
_08101DA8: .4byte 0x0000FFFF
_08101DAC: .4byte 0x08101DB1
	thumb_func_end sub_08101D44

	thumb_func_start sub_08101DB0
sub_08101DB0: @ 0x08101DB0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #0x28
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl __divsi3
	strh r0, [r4, #0x24]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	ldrh r2, [r4, #0x36]
	adds r0, r0, r2
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x30]
	ldrh r2, [r4, #0x2e]
	adds r1, r0, r2
	strh r1, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08101DF4
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_08101DF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08101DB0

	thumb_func_start sub_08101DFC
sub_08101DFC: @ 0x08101DFC
	push {lr}
	ldrh r1, [r0, #0x20]
	subs r1, #0x20
	strh r1, [r0, #0x20]
	ldrh r1, [r0, #0x22]
	subs r1, #0x20
	strh r1, [r0, #0x22]
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	ldr r1, _08101E1C
	str r1, [r0, #0x1c]
	ldr r1, _08101E20
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_08101E1C: .4byte 0x080A5D79
_08101E20: .4byte 0x08101E25
	thumb_func_end sub_08101DFC

	thumb_func_start sub_08101E24
sub_08101E24: @ 0x08101E24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r6, [r5, #0x38]
	movs r1, #1
	adds r0, r1, #0
	ands r0, r6
	cmp r0, #0
	beq _08101E3A
	cmp r0, #1
	beq _08101E54
	b _08101EBA
_08101E3A:
	strh r1, [r5, #0x2e]
	ldr r0, _08101E4C
	str r0, [r5, #0x1c]
	ldr r1, _08101E50
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	b _08101EBA
	.align 2, 0
_08101E4C: .4byte 0x080A5D79
_08101E50: .4byte 0x08101E25
_08101E54:
	ldrh r3, [r5, #0x24]
	ldrh r0, [r5, #0x20]
	adds r3, r3, r0
	movs r0, #0
	strh r3, [r5, #0x20]
	ldrh r4, [r5, #0x26]
	ldrh r1, [r5, #0x22]
	adds r4, r4, r1
	strh r4, [r5, #0x22]
	strh r0, [r5, #0x26]
	strh r0, [r5, #0x24]
	movs r0, #8
	strh r0, [r5, #0x2e]
	ldr r2, _08101EC8
	lsls r0, r6, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r3, r1
	strh r3, [r5, #0x32]
	adds r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	strh r4, [r5, #0x36]
	ldr r0, _08101ECC
	str r0, [r5, #0x1c]
	ldr r1, _08101ED0
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r5, #0x38]
	adds r0, r0, r1
	strh r0, [r5, #0x38]
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xd2
	bl PlaySE12WithPanning
_08101EBA:
	ldrh r0, [r5, #0x38]
	movs r1, #1
	eors r0, r1
	strh r0, [r5, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101EC8: .4byte 0x0856E8B4
_08101ECC: .4byte 0x080A67B5
_08101ED0: .4byte 0x08101ED5
	thumb_func_end sub_08101E24

	thumb_func_start sub_08101ED4
sub_08101ED4: @ 0x08101ED4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08101EFC
	movs r0, #0xa
	strh r0, [r2, #0x2e]
	ldr r0, _08101EF4
	str r0, [r2, #0x1c]
	ldr r1, _08101EF8
	adds r0, r2, #0
	bl StoreSpriteCallbackInData6
	b _08101F00
	.align 2, 0
_08101EF4: .4byte 0x080A5D79
_08101EF8: .4byte 0x08101F09
_08101EFC:
	ldr r0, _08101F04
	str r0, [r2, #0x1c]
_08101F00:
	pop {r0}
	bx r0
	.align 2, 0
_08101F04: .4byte 0x08101E25
	thumb_func_end sub_08101ED4

	thumb_func_start sub_08101F08
sub_08101F08: @ 0x08101F08
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #6]
	cmp r1, #0
	bne _08101F30
	movs r0, #3
	strh r0, [r5, #0x2e]
	strh r1, [r5, #0x30]
	strh r1, [r5, #0x32]
	ldr r0, _08101F28
	str r0, [r5, #0x1c]
	ldr r1, _08101F2C
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	b _08101FB0
	.align 2, 0
_08101F28: .4byte 0x080A5D79
_08101F2C: .4byte 0x08101FC5
_08101F30:
	ldrh r0, [r5, #6]
	cmp r0, #2
	beq _08101F50
	cmp r0, #2
	bgt _08101F40
	cmp r0, #1
	beq _08101F46
	b _08101F64
_08101F40:
	cmp r0, #3
	beq _08101F58
	b _08101F64
_08101F46:
	ldr r6, _08101F4C
	adds r7, r6, #0
	b _08101F68
	.align 2, 0
_08101F4C: .4byte 0x0000FFF8
_08101F50:
	ldr r7, _08101F54
	b _08101F66
	.align 2, 0
_08101F54: .4byte 0x0000FFF8
_08101F58:
	movs r7, #8
	ldr r6, _08101F60
	b _08101F68
	.align 2, 0
_08101F60: .4byte 0x0000FFF8
_08101F64:
	movs r7, #8
_08101F66:
	movs r6, #8
_08101F68:
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
	movs r0, #6
	strh r0, [r5, #0x2e]
	ldr r4, _08101FB8
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r7
	strh r0, [r5, #0x32]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r6
	strh r0, [r5, #0x36]
	ldr r0, _08101FBC
	str r0, [r5, #0x1c]
	ldr r1, _08101FC0
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
_08101FB0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101FB8: .4byte 0x020380D7
_08101FBC: .4byte 0x080A67B5
_08101FC0: .4byte 0x08102071
	thumb_func_end sub_08101F08

	thumb_func_start sub_08101FC4
sub_08101FC4: @ 0x08101FC4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08101FE4
	ldrh r0, [r4, #0x30]
	adds r0, #3
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08101FF4
	movs r0, #0x10
	b _08101FF2
_08101FE4:
	ldrh r0, [r4, #0x30]
	subs r0, #3
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08101FF4
	movs r0, #0
_08101FF2:
	strh r0, [r4, #0x30]
_08101FF4:
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_080A6E74
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08102050
	bl BlendPalettes
	movs r3, #0x30
	ldrsh r0, [r4, r3]
	cmp r0, #0x10
	bne _0810205C
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrb r1, [r4, #5]
	lsrs r1, r1, #4
	lsls r0, r1, #5
	ldr r2, _08102054
	adds r0, r0, r2
	lsls r1, r1, #4
	ldr r3, _08102058
	adds r2, r3, #0
	orrs r1, r2
	movs r2, #4
	bl LoadPalette
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xc0
	bl PlaySE12WithPanning
	b _08102064
	.align 2, 0
_08102050: .4byte 0x00007FFF
_08102054: .4byte 0x020375C4
_08102058: .4byte 0x00000101
_0810205C:
	cmp r0, #0
	bne _08102064
	ldr r0, _0810206C
	str r0, [r4, #0x1c]
_08102064:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810206C: .4byte 0x08102071
	thumb_func_end sub_08101FC4

	thumb_func_start sub_08102070
sub_08102070: @ 0x08102070
	push {lr}
	adds r2, r0, #0
	ldr r0, _0810208C
	ldrh r1, [r0, #0xe]
	ldr r0, _08102090
	cmp r1, r0
	bne _08102088
	movs r0, #0
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x2e]
	ldr r0, _08102094
	str r0, [r2, #0x1c]
_08102088:
	pop {r0}
	bx r0
	.align 2, 0
_0810208C: .4byte 0x020380BE
_08102090: .4byte 0x0000FFFF
_08102094: .4byte 0x08102099
	thumb_func_end sub_08102070

	thumb_func_start sub_08102098
sub_08102098: @ 0x08102098
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081020CC
	ldrh r0, [r4, #0x30]
	adds r0, #1
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
_081020CC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #8
	bne _081020E0
	adds r0, r4, #0
	bl DestroyAnimSprite
_081020E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08102098

	thumb_func_start sub_081020E8
sub_081020E8: @ 0x081020E8
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08102108
	ldrh r0, [r0]
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0810210C
	ldrh r0, [r3, #0x20]
	subs r0, #0x18
	strh r0, [r3, #0x20]
	ldrh r0, [r3, #0x22]
	subs r0, #0x18
	strh r0, [r3, #0x22]
	b _0810215E
	.align 2, 0
_08102108: .4byte 0x020380BE
_0810210C:
	cmp r0, #2
	bne _08102128
	ldrh r0, [r3, #0x20]
	subs r0, #0x18
	strh r0, [r3, #0x20]
	ldrh r0, [r3, #0x22]
	adds r0, #0x18
	strh r0, [r3, #0x22]
	ldrb r1, [r3, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	b _0810215A
_08102128:
	cmp r0, #3
	bne _08102144
	ldrh r0, [r3, #0x20]
	adds r0, #0x18
	strh r0, [r3, #0x20]
	ldrh r0, [r3, #0x22]
	subs r0, #0x18
	strh r0, [r3, #0x22]
	ldrb r1, [r3, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	b _0810215A
_08102144:
	ldrh r0, [r3, #0x20]
	adds r0, #0x18
	strh r0, [r3, #0x20]
	ldrh r0, [r3, #0x22]
	adds r0, #0x18
	strh r0, [r3, #0x22]
	ldrb r1, [r3, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x30
_0810215A:
	orrs r0, r1
	strb r0, [r3, #3]
_0810215E:
	ldrh r2, [r3, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x10
	ldr r4, _08102184
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _08102188
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldr r1, _0810218C
	str r1, [r3, #0x1c]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102184: .4byte 0x000003FF
_08102188: .4byte 0xFFFFFC00
_0810218C: .4byte 0x08101DFD
	thumb_func_end sub_081020E8

	thumb_func_start sub_08102190
sub_08102190: @ 0x08102190
	push {lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	strh r0, [r3, #0x2e]
	ldr r0, _081021B8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _081021CC
	cmp r0, #1
	bgt _081021BC
	cmp r0, #0
	beq _081021C2
	b _081021DC
	.align 2, 0
_081021B8: .4byte 0x020380BE
_081021BC:
	cmp r0, #2
	beq _081021D4
	b _081021DC
_081021C2:
	ldr r0, _081021C8
	b _081021DE
	.align 2, 0
_081021C8: .4byte 0x081021E9
_081021CC:
	ldr r0, _081021D0
	b _081021DE
	.align 2, 0
_081021D0: .4byte 0x081022C5
_081021D4:
	ldr r0, _081021D8
	b _081021DE
	.align 2, 0
_081021D8: .4byte 0x08102315
_081021DC:
	ldr r0, _081021E4
_081021DE:
	str r0, [r3, #0x1c]
	pop {r0}
	bx r0
	.align 2, 0
_081021E4: .4byte 0x081023D5
	thumb_func_end sub_08102190

	thumb_func_start sub_081021E8
sub_081021E8: @ 0x081021E8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	strh r0, [r4, #0x2e]
	ldr r5, _08102228
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	cmp r0, #0
	beq _08102206
	movs r1, #2
_08102206:
	strh r1, [r4, #0x30]
	movs r0, #0
	strh r0, [r4, #0x32]
	ldr r1, _0810222C
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0x34]
	ldr r1, _08102230
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08102234
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102228: .4byte 0x020380D6
_0810222C: .4byte 0x02023E88
_08102230: .4byte 0x08102239
_08102234: .4byte 0x080A5EF9
	thumb_func_end sub_081021E8

	thumb_func_start sub_08102238
sub_08102238: @ 0x08102238
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x2e
	ldrsh r6, [r5, r0]
	cmp r6, #0
	bne _08102274
	ldr r1, _081022B4
	ldr r4, _081022B8
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r5, #0x34]
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x3a]
	ldr r2, _081022BC
	adds r1, r2, #0
	cmp r0, #0
	beq _08102270
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r1, r0, #0
_08102270:
	strh r1, [r5, #0x36]
	strh r6, [r5, #0x38]
_08102274:
	ldrh r0, [r5, #0x36]
	ldrh r1, [r5, #0x38]
	adds r0, r0, r1
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r5, #0x38]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrh r0, [r5, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromRotation
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _081022AE
	movs r0, #0
	strh r0, [r5, #0x2e]
	ldr r0, _081022C0
	str r0, [r5, #0x1c]
_081022AE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081022B4: .4byte 0x02023E88
_081022B8: .4byte 0x020380D6
_081022BC: .4byte 0xFFFFFD00
_081022C0: .4byte 0x081023D5
	thumb_func_end sub_08102238

	thumb_func_start sub_081022C4
sub_081022C4: @ 0x081022C4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #4
	strh r0, [r4, #0x2e]
	ldr r5, _08102304
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r1, #3
	cmp r0, #0
	beq _081022E2
	movs r0, #3
	rsbs r0, r0, #0
	adds r1, r0, #0
_081022E2:
	strh r1, [r4, #0x30]
	movs r0, #0
	strh r0, [r4, #0x32]
	ldr r1, _08102308
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0x34]
	ldr r1, _0810230C
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08102310
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102304: .4byte 0x020380D6
_08102308: .4byte 0x02023E88
_0810230C: .4byte 0x081023D5
_08102310: .4byte 0x080A5EF9
	thumb_func_end sub_081022C4

	thumb_func_start sub_08102314
sub_08102314: @ 0x08102314
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0810232E
	movs r0, #0
	strh r0, [r1, #0x2e]
	ldr r0, _08102334
	str r0, [r1, #0x1c]
_0810232E:
	pop {r0}
	bx r0
	.align 2, 0
_08102334: .4byte 0x08102339
	thumb_func_end sub_08102314

	thumb_func_start sub_08102338
sub_08102338: @ 0x08102338
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08102388
	ldr r1, _08102374
	ldr r4, _08102378
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r5, #0x34]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x3a]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810237C
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r5, #0x36]
	movs r0, #0xc0
	lsls r0, r0, #4
	b _08102386
	.align 2, 0
_08102374: .4byte 0x02023E88
_08102378: .4byte 0x020380D6
_0810237C:
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0x36]
	movs r0, #0xf4
	lsls r0, r0, #8
_08102386:
	strh r0, [r5, #0x38]
_08102388:
	ldrh r0, [r5, #0x36]
	ldrh r1, [r5, #0x38]
	adds r0, r0, r1
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r5, #0x38]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrh r0, [r5, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromRotation
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _081023C8
	ldrh r0, [r5, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ResetSpriteRotScale
	ldr r0, _081023D0
	str r0, [r5, #0x1c]
_081023C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081023D0: .4byte 0x081023D5
	thumb_func_end sub_08102338

	thumb_func_start sub_081023D4
sub_081023D4: @ 0x081023D4
	push {lr}
	bl DestroyAnimSprite
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081023D4

	thumb_func_start sub_081023E0
sub_081023E0: @ 0x081023E0
	movs r1, #0
	strh r1, [r0, #0x2e]
	ldr r1, _081023EC
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_081023EC: .4byte 0x081023F1
	thumb_func_end sub_081023E0

	thumb_func_start sub_081023F0
sub_081023F0: @ 0x081023F0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r5, [r4, r0]
	cmp r5, #1
	beq _0810244A
	cmp r5, #1
	bgt _08102406
	cmp r5, #0
	beq _0810240C
	b _081024DE
_08102406:
	cmp r5, #2
	beq _0810249C
	b _081024DE
_0810240C:
	strh r5, [r4, #0x30]
	ldr r1, _08102490
	ldr r2, _08102494
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0x32]
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x34]
	ldr r2, _08102498
	adds r1, r2, #0
	cmp r0, #0
	beq _08102434
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r0, #0
_08102434:
	strh r1, [r4, #0x36]
	strh r5, [r4, #0x38]
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0810244A:
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x38]
	adds r0, r0, r1
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x38]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromRotation
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _081024DE
	movs r0, #0
	strh r0, [r4, #0x30]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _081024DE
	.align 2, 0
_08102490: .4byte 0x02023E88
_08102494: .4byte 0x020380D6
_08102498: .4byte 0xFFFFFE00
_0810249C:
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x38]
	adds r0, r0, r1
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x38]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromRotation
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _081024DE
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ResetSpriteRotScale
	adds r0, r4, #0
	bl DestroyAnimSprite
_081024DE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081023F0

	thumb_func_start sub_081024E4
sub_081024E4: @ 0x081024E4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08102528
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldr r1, _0810252C
	ldr r2, _08102530
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r4, #0
	strh r0, [r5, #8]
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	strh r2, [r5, #0xa]
	strh r4, [r5, #0xc]
	ldr r0, _08102534
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	beq _08102538
	cmp r1, #1
	beq _08102554
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	b _08102572
	.align 2, 0
_08102528: .4byte 0x03005B60
_0810252C: .4byte 0x02023E88
_08102530: .4byte 0x020380D6
_08102534: .4byte 0x020380BE
_08102538:
	strh r1, [r5, #0xc]
	movs r0, #8
	strh r0, [r5, #0xe]
	strh r1, [r5, #0x10]
	movs r0, #3
	strh r0, [r5, #0x12]
	cmp r2, #0
	bne _0810254C
	rsbs r0, r0, #0
	strh r0, [r5, #0x12]
_0810254C:
	ldr r0, _08102550
	b _08102570
	.align 2, 0
_08102550: .4byte 0x0810257D
_08102554:
	movs r0, #8
	strh r0, [r5, #0xe]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r5, #0x10]
	movs r1, #0xc0
	strh r1, [r5, #0x12]
	cmp r2, #0
	bne _0810256E
	rsbs r0, r0, #0
	strh r0, [r5, #0x10]
	rsbs r0, r1, #0
	strh r0, [r5, #0x12]
_0810256E:
	ldr r0, _08102578
_08102570:
	str r0, [r5]
_08102572:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102578: .4byte 0x0810273D
	thumb_func_end sub_081024E4

	thumb_func_start sub_0810257C
sub_0810257C: @ 0x0810257C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081025A0
	adds r4, r0, r1
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bls _08102596
	b _08102736
_08102596:
	lsls r0, r0, #2
	ldr r1, _081025A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081025A0: .4byte 0x03005B60
_081025A4: .4byte 0x081025A8
_081025A8: @ jump table
	.4byte _081025BC @ case 0
	.4byte _081025EE @ case 1
	.4byte _08102648 @ case 2
	.4byte _081026C0 @ case 3
	.4byte _08102704 @ case 4
_081025BC:
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	cmp r1, #0
	beq _081025CC
	ldrh r2, [r4, #0x12]
	ldrh r3, [r4, #0x10]
	adds r2, r2, r3
	b _08102712
_081025CC:
	movs r0, #8
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	movs r1, #0xc0
	cmp r0, #0
	bne _081025E2
	movs r2, #0xc0
	rsbs r2, r2, #0
	adds r1, r2, #0
_081025E2:
	strh r1, [r4, #0x12]
	ldrb r0, [r4, #8]
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	b _081026F8
_081025EE:
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08102614
	ldrh r0, [r4, #0x12]
	ldrh r1, [r4, #0x10]
	adds r0, r0, r1
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x10]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrb r0, [r4, #8]
	bl SetBattlerSpriteYOffsetFromRotation
	b _08102724
_08102614:
	movs r0, #8
	strh r0, [r4, #0xe]
	ldr r2, _08102644
	movs r3, #8
	ldrsh r1, [r4, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x24]
	strh r0, [r4, #0x10]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	cmp r0, #0
	bne _0810263A
	movs r1, #2
_0810263A:
	strh r1, [r4, #0x12]
	movs r0, #1
	strh r0, [r4, #0x14]
	b _081026F8
	.align 2, 0
_08102644: .4byte 0x020205AC
_08102648:
	ldrh r2, [r4, #0xe]
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _081026A4
	ldrh r1, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08102662
	subs r0, r1, #1
	strh r0, [r4, #0x14]
	b _08102736
_08102662:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08102684
	ldr r2, _08102680
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x12]
	ldrh r2, [r4, #0x10]
	adds r1, r1, r2
	b _08102698
	.align 2, 0
_08102680: .4byte 0x020205AC
_08102684:
	ldr r2, _081026A0
	movs r3, #8
	ldrsh r1, [r4, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x10]
	ldrh r2, [r4, #0x12]
	subs r1, r1, r2
_08102698:
	strh r1, [r0, #0x24]
	movs r0, #1
	strh r0, [r4, #0x14]
	b _08102724
	.align 2, 0
_081026A0: .4byte 0x020205AC
_081026A4:
	ldr r2, _081026BC
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x24]
	movs r0, #0xc
	strh r0, [r4, #0xe]
	b _081026F8
	.align 2, 0
_081026BC: .4byte 0x020205AC
_081026C0:
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _081026D0
	subs r0, r1, #1
	strh r0, [r4, #0xe]
	b _08102736
_081026D0:
	movs r0, #3
	strh r0, [r4, #0xe]
	ldr r2, _08102700
	movs r3, #8
	ldrsh r1, [r4, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x24]
	strh r0, [r4, #0x10]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	movs r2, #8
	rsbs r2, r2, #0
	adds r1, r2, #0
	cmp r0, #0
	bne _081026F6
	movs r1, #8
_081026F6:
	strh r1, [r4, #0x12]
_081026F8:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _08102736
	.align 2, 0
_08102700: .4byte 0x020205AC
_08102704:
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08102730
	ldrh r2, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	adds r2, r2, r0
_08102712:
	strh r2, [r4, #0x10]
	ldr r3, _0810272C
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x24]
_08102724:
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	b _08102736
	.align 2, 0
_0810272C: .4byte 0x020205AC
_08102730:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08102736:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810257C

	thumb_func_start sub_0810273C
sub_0810273C: @ 0x0810273C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08102778
	adds r4, r0, r1
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0810277C
	ldrh r0, [r4, #0x10]
	ldrh r1, [r4, #0x12]
	subs r0, r0, r1
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x10]
	adds r1, r2, #0
	bl SetSpriteRotScale
	ldrb r0, [r4, #8]
	bl SetBattlerSpriteYOffsetFromRotation
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	b _08102788
	.align 2, 0
_08102778: .4byte 0x03005B60
_0810277C:
	ldrb r0, [r4, #8]
	bl ResetSpriteRotScale
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08102788:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810273C

	thumb_func_start sub_08102790
sub_08102790: @ 0x08102790
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _081027A4
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _081027AC
	ldr r4, _081027A8
	b _081027AE
	.align 2, 0
_081027A4: .4byte 0x020380BE
_081027A8: .4byte 0x020380D6
_081027AC:
	ldr r4, _081027EC
_081027AE:
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
	movs r0, #0
	strh r0, [r5, #0x2e]
	strh r0, [r5, #0x30]
	ldr r1, _081027F0
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _081027F4
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081027EC: .4byte 0x020380D7
_081027F0: .4byte 0x081028DD
_081027F4: .4byte 0x080A60A1
	thumb_func_end sub_08102790

	thumb_func_start sub_081027F8
sub_081027F8: @ 0x081027F8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08102830
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08102834
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	ldr r1, _08102838
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810283C
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102830: .4byte 0x020380D7
_08102834: .4byte 0x0000FFD0
_08102838: .4byte 0x08102895
_0810283C: .4byte 0x080A60A1
	thumb_func_end sub_081027F8

	thumb_func_start sub_08102840
sub_08102840: @ 0x08102840
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08102884
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08102888
	ldr r2, _0810288C
	adds r0, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r4, #0x20]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	strh r6, [r4, #0x2e]
	strh r6, [r4, #0x30]
	ldr r0, _08102890
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102884: .4byte 0x020380D7
_08102888: .4byte 0x020380BE
_0810288C: .4byte 0x0000FFD0
_08102890: .4byte 0x081028DD
	thumb_func_end sub_08102840

	thumb_func_start sub_08102894
sub_08102894: @ 0x08102894
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _081028BE
	movs r0, #0xc
	strh r0, [r4, #0x2e]
	movs r0, #8
	strh r0, [r4, #0x30]
	movs r0, #0
	strh r0, [r4, #0x32]
	ldr r1, _081028C4
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _081028C8
	str r0, [r4, #0x1c]
_081028BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081028C4: .4byte 0x081028CD
_081028C8: .4byte 0x080A5E05
	thumb_func_end sub_08102894

	thumb_func_start sub_081028CC
sub_081028CC: @ 0x081028CC
	movs r1, #0
	strh r1, [r0, #0x2e]
	strh r1, [r0, #0x30]
	ldr r1, _081028D8
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_081028D8: .4byte 0x081028DD
	thumb_func_end sub_081028CC

	thumb_func_start sub_081028DC
sub_081028DC: @ 0x081028DC
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08102924
	movs r0, #0
	strh r0, [r3, #0x2e]
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	lsrs r1, r2, #2
	movs r0, #1
	eors r1, r0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _08102924
	adds r0, r3, #0
	bl DestroyAnimSprite
_08102924:
	pop {r0}
	bx r0
	thumb_func_end sub_081028DC

	thumb_func_start sub_08102928
sub_08102928: @ 0x08102928
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0810293C
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08102944
	ldr r4, _08102940
	b _08102946
	.align 2, 0
_0810293C: .4byte 0x020380BE
_08102940: .4byte 0x020380D6
_08102944:
	ldr r4, _08102980
_08102946:
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #2]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r6, [r6, #4]
	adds r0, r0, r6
	strh r0, [r5, #0x22]
	movs r0, #0
	strh r0, [r5, #0x2e]
	ldr r0, _08102984
	ldrh r0, [r0, #6]
	strh r0, [r5, #0x30]
	ldr r0, _08102988
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102980: .4byte 0x020380D7
_08102984: .4byte 0x020380BE
_08102988: .4byte 0x0810298D
	thumb_func_end sub_08102928

	thumb_func_start sub_0810298C
sub_0810298C: @ 0x0810298C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x30
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _081029AC
	movs r0, #0
	strh r0, [r2, #0x2e]
	ldrh r0, [r2, #0x22]
	subs r0, #1
	strh r0, [r2, #0x22]
_081029AC:
	ldrh r0, [r2, #0x22]
	ldrh r1, [r2, #0x2e]
	subs r0, r0, r1
	strh r0, [r2, #0x22]
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081029C8
	adds r0, r2, #0
	bl DestroyAnimSprite
_081029C8:
	pop {r0}
	bx r0
	thumb_func_end sub_0810298C

	thumb_func_start sub_081029CC
sub_081029CC: @ 0x081029CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _08102A14
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r4, #0x20]
	ldrb r0, [r6]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #0xc
	strh r0, [r4, #0x22]
	strh r5, [r4, #0x2e]
	movs r0, #2
	strh r0, [r4, #0x30]
	strh r5, [r4, #0x32]
	strh r5, [r4, #0x34]
	strh r5, [r4, #0x36]
	subs r0, #0x42
	bl BattleAnimAdjustPanning
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x38]
	ldr r0, _08102A18
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102A14: .4byte 0x020380D6
_08102A18: .4byte 0x08102A1D
	thumb_func_end sub_081029CC

	thumb_func_start sub_08102A1C
sub_08102A1C: @ 0x08102A1C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _08102A88
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
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08102A6E
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08102A6E
	ldrh r1, [r4, #0x38]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xc2
	bl PlaySE12WithPanning
_08102A6E:
	movs r1, #0
	strh r1, [r4, #0x2e]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08102A88
	strh r1, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_08102A88:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08102AB2
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	ble _08102AB2
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08102AB2
	adds r0, r4, #0
	bl DestroyAnimSprite
_08102AB2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08102A1C

	thumb_func_start sub_08102AB8
sub_08102AB8: @ 0x08102AB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08102B02
	ldr r4, _08102B18
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r5, _08102B1C
	lsrs r0, r0, #0x18
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	strh r0, [r6, #0x22]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08102AFC
	ldrh r0, [r6, #0x22]
	adds r0, #0xa
	strh r0, [r6, #0x22]
_08102AFC:
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
_08102B02:
	ldr r0, _08102B1C
	ldrh r1, [r0, #0xe]
	ldr r0, _08102B20
	cmp r1, r0
	bne _08102B12
	adds r0, r6, #0
	bl DestroyAnimSprite
_08102B12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102B18: .4byte 0x020380D6
_08102B1C: .4byte 0x020380BE
_08102B20: .4byte 0x0000FFFF
	thumb_func_end sub_08102AB8

	thumb_func_start sub_08102B24
sub_08102B24: @ 0x08102B24
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08102B44
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _08102B50
	ldr r1, _08102B48
	ldr r0, _08102B4C
	strh r0, [r1, #0xe]
	b _08102B8E
	.align 2, 0
_08102B44: .4byte 0x03005B60
_08102B48: .4byte 0x020380BE
_08102B4C: .4byte 0x0000FFFF
_08102B50:
	cmp r0, #2
	bne _08102B5C
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	b _08102B94
_08102B5C:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08102B94
	movs r0, #0
	strh r0, [r4, #8]
	ldrh r2, [r4, #0xa]
	adds r2, #1
	strh r2, [r4, #0xa]
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _08102B94
_08102B8E:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
_08102B94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08102B24

	thumb_func_start sub_08102B9C
sub_08102B9C: @ 0x08102B9C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08102BC4
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x2e]
	ldr r0, _08102BC8
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102BC4: .4byte 0x020380BE
_08102BC8: .4byte 0x08102BCD
	thumb_func_end sub_08102B9C

	thumb_func_start sub_08102BCC
sub_08102BCC: @ 0x08102BCC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _08102BE0
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
	b _08102C1C
_08102BE0:
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldr r4, _08102C24
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
	ldr r0, _08102C28
	str r0, [r5, #0x1c]
	ldr r1, _08102C2C
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
_08102C1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102C24: .4byte 0x020380D6
_08102C28: .4byte 0x080A67B5
_08102C2C: .4byte 0x080A34C5
	thumb_func_end sub_08102BCC

	thumb_func_start sub_08102C30
sub_08102C30: @ 0x08102C30
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08102C80
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08102C78
	movs r0, #0
	strh r0, [r4, #8]
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
	cmp r0, #0x10
	bne _08102C78
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08102C78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102C80: .4byte 0x03005B60
	thumb_func_end sub_08102C30

	thumb_func_start unref_sub_8102434
unref_sub_8102434: @ 0x08102C84
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r4, #0
	ldr r0, _08102CEC
	ldrb r0, [r0]
	cmp r4, r0
	bhs _08102CE0
	ldr r6, _08102CF0
	ldr r5, _08102CF4
_08102C98:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #1
	bne _08102CB4
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08102CB4
	adds r0, r4, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
_08102CB4:
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #1
	bne _08102CD2
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08102CD2
	adds r0, r4, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
_08102CD2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08102CEC
	ldrb r0, [r0]
	cmp r4, r0
	blo _08102C98
_08102CE0:
	adds r0, r7, #0
	bl DestroyAnimVisualTask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08102CEC: .4byte 0x02023D10
_08102CF0: .4byte 0x020380BE
_08102CF4: .4byte 0x03005AD0
	thumb_func_end unref_sub_8102434

	thumb_func_start unref_sub_81024A8
unref_sub_81024A8: @ 0x08102CF8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	b _08102D12
_08102D02:
	ldr r0, _08102D28
	adds r0, r4, r0
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08102D12:
	ldr r0, _08102D2C
	ldrb r0, [r0]
	cmp r4, r0
	blo _08102D02
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102D28: .4byte 0x03005AD0
_08102D2C: .4byte 0x02023D10
	thumb_func_end unref_sub_81024A8

	thumb_func_start sub_08102D30
sub_08102D30: @ 0x08102D30
	push {r4, lr}
	adds r4, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08102D46
	movs r0, #0x30
	strh r0, [r4, #0x20]
	movs r0, #0x28
	b _08102D4E
_08102D46:
	ldr r0, _08102D70
	ldrh r1, [r0]
	strh r1, [r4, #0x20]
	ldrh r0, [r0, #2]
_08102D4E:
	strh r0, [r4, #0x22]
	ldrb r1, [r4, #1]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r4, #3]
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldr r0, _08102D74
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102D70: .4byte 0x020380BE
_08102D74: .4byte 0x08102D79
	thumb_func_end sub_08102D30

	thumb_func_start sub_08102D78
sub_08102D78: @ 0x08102D78
	push {lr}
	adds r1, r0, #0
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08102D8A
	adds r0, r1, #0
	bl DestroyAnimSprite
_08102D8A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08102D78

	thumb_func_start sub_08102D90
sub_08102D90: @ 0x08102D90
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08102DC8
	ldrb r0, [r0]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r2, _08102DCC
	lsrs r0, r0, #0x18
	ldrh r1, [r2]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r2, #2]
	strh r0, [r4, #0x22]
	strh r1, [r4, #0x2e]
	strh r1, [r4, #0x30]
	strh r1, [r4, #0x32]
	strh r1, [r4, #0x34]
	movs r0, #1
	strh r0, [r4, #0x36]
	ldr r0, _08102DD0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102DC8: .4byte 0x020380D6
_08102DCC: .4byte 0x020380BE
_08102DD0: .4byte 0x08102DD5
	thumb_func_end sub_08102D90

	thumb_func_start sub_08102DD4
sub_08102DD4: @ 0x08102DD4
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08102DFE
	movs r0, #0
	strh r0, [r1, #0x30]
	ldrh r2, [r1, #0x32]
	movs r3, #0x32
	ldrsh r0, [r1, r3]
	cmp r0, #0x77
	bgt _08102DFE
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	adds r0, r2, #1
	strh r0, [r1, #0x32]
_08102DFE:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08102E0C
	adds r0, r1, #0
	bl DestroyAnimSprite
_08102E0C:
	pop {r0}
	bx r0
	thumb_func_end sub_08102DD4

	thumb_func_start sub_08102E10
sub_08102E10: @ 0x08102E10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A6E74
	mov r8, r0
	ldr r0, _08102EE0
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r0, _08102EE4
	mov sb, r0
	lsls r5, r7, #2
	adds r5, r5, r7
	lsls r5, r5, #3
	adds r6, r5, r0
	strh r4, [r6, #8]
	strh r4, [r6, #0xa]
	strh r4, [r6, #0xc]
	strh r1, [r6, #0xe]
	strh r4, [r6, #0x10]
	strh r4, [r6, #0x12]
	strh r4, [r6, #0x14]
	movs r0, #0xd
	strh r0, [r6, #0x16]
	movs r0, #0xe
	strh r0, [r6, #0x18]
	movs r0, #0xf
	strh r0, [r6, #0x1a]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_080A6F8C
	mov sl, r0
	mov r1, r8
	orrs r1, r0
	mov r8, r1
	movs r0, #8
	add sb, r0
	add r5, sb
	adds r0, r5, #0
	adds r0, #0x1c
	adds r5, #0x1e
	adds r1, r5, #0
	mov r2, r8
	bl StorePointerInVars
	ldr r0, _08102EE8
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x80
	lsls r4, r4, #9
	adds r1, r4, #0
	lsls r1, r0
	mov r0, sl
	orrs r0, r1
	mov sl, r0
	ldr r0, _08102EEC
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0
	mov r1, sl
	orrs r4, r1
	ldr r0, _08102EF0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _08102EF4
	str r1, [r6]
	adds r0, r7, #0
	bl _call_via_r1
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08102EE0: .4byte 0x0000FFFF
_08102EE4: .4byte 0x03005B60
_08102EE8: .4byte 0x000027D2
_08102EEC: .4byte 0x000027D3
_08102EF0: .4byte 0x00007FBB
_08102EF4: .4byte 0x08102EF9
	thumb_func_end sub_08102E10

	thumb_func_start sub_08102EF8
sub_08102EF8: @ 0x08102EF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08102F20
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _08102FE4
	cmp r1, #1
	bgt _08102F24
	cmp r1, #0
	beq _08102F32
	b _08103082
	.align 2, 0
_08102F20: .4byte 0x03005B60
_08102F24:
	cmp r1, #2
	bne _08102F2A
	b _0810303C
_08102F2A:
	cmp r1, #3
	bne _08102F30
	b _08103070
_08102F30:
	b _08103082
_08102F32:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08102F40
	b _08103082
_08102F40:
	strh r1, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bgt _08102F8C
	ldrh r0, [r4, #0x16]
	ldrh r1, [r4, #0x10]
	adds r0, r0, r1
	strh r0, [r4, #0x10]
	ldrh r2, [r4, #0x18]
	ldrh r3, [r4, #0x12]
	adds r2, r2, r3
	strh r2, [r4, #0x12]
	ldrh r1, [r4, #0x1a]
	ldrh r5, [r4, #0x14]
	adds r1, r1, r5
	strh r1, [r4, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	lsls r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	lsls r1, r1, #0x10
	lsrs r2, r2, #0xb
	orrs r0, r2
	lsrs r1, r1, #6
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	b _08102F96
_08102F8C:
	ldr r7, _08102FDC
	mov ip, r7
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08102F96:
	movs r2, #1
	movs r3, #0
	movs r1, #0
_08102F9C:
	movs r5, #0xe
	ldrsh r0, [r4, r5]
	ands r0, r2
	lsls r5, r2, #0x11
	adds r6, r3, #0
	adds r6, #0x10
	adds r1, #1
	mov r8, r1
	cmp r0, #0
	beq _08102FC8
	movs r1, #1
	ldr r2, _08102FE0
_08102FB4:
	adds r0, r3, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	mov r7, ip
	strh r7, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xf
	bls _08102FB4
_08102FC8:
	lsrs r2, r5, #0x10
	lsls r0, r6, #0x10
	lsrs r3, r0, #0x10
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xf
	bls _08102F9C
	b _08103082
	.align 2, 0
_08102FDC: .4byte 0x00007FBB
_08102FE0: .4byte 0x020377B4
_08102FE4:
	ldr r0, _0810302C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08103082
	movs r2, #0
	ldr r3, _08103030
	movs r5, #0x14
	adds r5, r5, r3
	mov ip, r5
	ldr r7, _08103034
	mov r8, r7
	ldr r6, _08103038
	movs r5, #1
_08103002:
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r1, r0, #2
	mov r7, ip
	adds r0, r1, r7
	ldr r0, [r0]
	cmp r0, r8
	beq _08103016
	cmp r0, r6
	bne _0810301A
_08103016:
	adds r0, r1, r3
	strh r5, [r0, #0x2e]
_0810301A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3f
	bls _08103002
	movs r0, #0
	strh r0, [r4, #0xa]
	b _08103064
	.align 2, 0
_0810302C: .4byte 0x02037C74
_08103030: .4byte 0x020205AC
_08103034: .4byte 0x0856EAA0
_08103038: .4byte 0x0856EAD0
_0810303C:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _08103082
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	bl LoadPointerFromVars
	ldr r1, _0810306C
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_08103064:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08103082
	.align 2, 0
_0810306C: .4byte 0x00007FBB
_08103070:
	ldr r0, _08103090
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08103082
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08103082:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08103090: .4byte 0x02037C74
	thumb_func_end sub_08102EF8

	thumb_func_start sub_08103094
sub_08103094: @ 0x08103094
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _08103118
	movs r1, #4
	ldrsh r0, [r6, r1]
	cmp r0, #1
	bgt _081030A6
	movs r0, #2
	strh r0, [r6, #4]
_081030A6:
	movs r1, #4
	ldrsh r0, [r6, r1]
	cmp r0, #0x7f
	ble _081030B2
	movs r0, #0x7f
	strh r0, [r6, #4]
_081030B2:
	movs r0, #0
	strh r0, [r5, #0x2e]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x30]
	ldr r4, _0810311C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r6, [r6, #2]
	adds r0, r0, r6
	strh r0, [r5, #0x22]
	ldrh r1, [r5, #0x20]
	strh r1, [r5, #0x3a]
	strh r0, [r5, #0x3c]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08103124
	ldrb r1, [r5, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #3]
	ldrh r0, [r5, #0x20]
	adds r0, #0x28
	strh r0, [r5, #0x20]
	ldrh r4, [r5, #0x22]
	adds r4, #0x14
	strh r4, [r5, #0x22]
	lsls r0, r0, #7
	strh r0, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	ldr r0, _08103120
	b _0810314A
	.align 2, 0
_08103118: .4byte 0x020380BE
_0810311C: .4byte 0x020380D7
_08103120: .4byte 0xFFFFEC00
_08103124:
	ldr r0, _08103164
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810316C
	ldrh r0, [r5, #0x20]
	subs r0, #0x28
	strh r0, [r5, #0x20]
	ldrh r4, [r5, #0x22]
	adds r4, #0x14
	strh r4, [r5, #0x22]
	lsls r0, r0, #7
	strh r0, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r0, #0xa0
	lsls r0, r0, #5
_0810314A:
	bl __divsi3
	strh r0, [r5, #0x34]
	lsls r4, r4, #7
	strh r4, [r5, #0x36]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	ldr r0, _08103168
	bl __divsi3
	strh r0, [r5, #0x38]
	b _081031A8
	.align 2, 0
_08103164: .4byte 0x020380D6
_08103168: .4byte 0xFFFFF600
_0810316C:
	ldrh r0, [r5, #0x20]
	adds r0, #0x28
	strh r0, [r5, #0x20]
	ldrh r4, [r5, #0x22]
	subs r4, #0x14
	strh r4, [r5, #0x22]
	lsls r0, r0, #7
	strh r0, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	ldr r0, _081031B4
	bl __divsi3
	strh r0, [r5, #0x34]
	lsls r4, r4, #7
	strh r4, [r5, #0x36]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r0, #0xa0
	lsls r0, r0, #4
	bl __divsi3
	strh r0, [r5, #0x38]
	ldrb r1, [r5, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x30
	orrs r0, r1
	strb r0, [r5, #3]
_081031A8:
	ldr r0, _081031B8
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081031B4: .4byte 0xFFFFEC00
_081031B8: .4byte 0x081031BD
	thumb_func_end sub_08103094

	thumb_func_start sub_081031BC
sub_081031BC: @ 0x081031BC
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x34]
	ldrh r1, [r2, #0x32]
	adds r0, r0, r1
	strh r0, [r2, #0x32]
	ldrh r1, [r2, #0x38]
	ldrh r3, [r2, #0x36]
	adds r1, r1, r3
	strh r1, [r2, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	strh r0, [r2, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x17
	strh r1, [r2, #0x22]
	ldrh r0, [r2, #0x30]
	subs r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _081031F2
	ldrh r0, [r2, #0x3a]
	strh r0, [r2, #0x20]
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x22]
_081031F2:
	movs r1, #0x30
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _08103200
	adds r0, r2, #0
	bl DestroyAnimSprite
_08103200:
	pop {r0}
	bx r0
	thumb_func_end sub_081031BC

	thumb_func_start sub_08103204
sub_08103204: @ 0x08103204
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _08103294
	adds r6, r0, r1
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #8]
	ldr r0, _08103298
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0xa]
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0x14
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r3, r0, #0x10
	ldr r2, _0810329C
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	adds r0, #0x10
	lsls r4, r0, #4
	movs r5, #1
	ldr r2, _081032A0
_0810325C:
	adds r1, r3, r5
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r0, r4, r5
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0810325C
	adds r0, r3, #0
	movs r1, #0x10
	movs r2, #0xb
	movs r3, #0
	bl BlendPalette
	movs r0, #0
	strh r0, [r6, #0xe]
	movs r5, #0
	ldr r7, _0810329C
	movs r1, #0x1c
	adds r1, r1, r7
	mov sb, r1
	b _081032D8
	.align 2, 0
_08103294: .4byte 0x03005B60
_08103298: .4byte 0x00002771
_0810329C: .4byte 0x020205AC
_081032A0: .4byte 0x020373B4
_081032A4:
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r4, r2, r7
	ldrb r1, [r6, #0xa]
	lsls r1, r1, #4
	ldrb r3, [r4, #5]
	movs r0, #0xf
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, #5]
	movs r0, #0
	strh r0, [r4, #0x2e]
	lsls r0, r5, #7
	strh r0, [r4, #0x30]
	mov r0, r8
	strh r0, [r4, #0x32]
	add r2, sb
	ldr r0, _0810330C
	str r0, [r2]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_081032D8:
	cmp r5, #1
	bhi _081032EA
	movs r0, #0
	bl CloneBattlerSpriteWithBlend
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _081032A4
_081032EA:
	ldr r0, _08103310
	str r0, [r6]
	ldr r0, _08103314
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08103318
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #0
	bl ClearGpuRegBits
	b _08103322
	.align 2, 0
_0810330C: .4byte 0x0810338D
_08103310: .4byte 0x08103331
_08103314: .4byte 0x020380D6
_08103318:
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl ClearGpuRegBits
_08103322:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08103204

	thumb_func_start sub_08103330
sub_08103330: @ 0x08103330
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08103364
	adds r0, r0, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08103382
	ldr r0, _08103368
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0810336C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #0
	bl SetGpuRegBits
	b _08103376
	.align 2, 0
_08103364: .4byte 0x03005B60
_08103368: .4byte 0x020380D6
_0810336C:
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl SetGpuRegBits
_08103376:
	ldr r0, _08103388
	bl FreeSpritePaletteByTag
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08103382:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103388: .4byte 0x00002771
	thumb_func_end sub_08103330

	thumb_func_start sub_0810338C
sub_0810338C: @ 0x0810338C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x34]
	adds r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _081033A8
	movs r0, #0
	strh r0, [r5, #0x34]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_081033A8:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0x40
	ble _081033D0
	ldr r2, _081033CC
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #0xe]
	subs r1, #1
	strh r1, [r0, #0xe]
	adds r0, r5, #0
	bl obj_delete_but_dont_free_vram
	b _08103412
	.align 2, 0
_081033CC: .4byte 0x03005B60
_081033D0:
	ldr r4, _08103418
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r1, #6
	bl __divsi3
	strh r0, [r5, #0x36]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r1, #0xd
	bl __divsi3
	strh r0, [r5, #0x38]
	ldrh r1, [r5, #0x30]
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	strh r1, [r5, #0x30]
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	movs r2, #0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, #0x24]
_08103412:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103418: .4byte 0x082FA8CC
	thumb_func_end sub_0810338C

	thumb_func_start sub_0810341C
sub_0810341C: @ 0x0810341C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08103430
	bl StoreSpriteCallbackInData6
	ldr r0, _08103434
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103430: .4byte 0x080A34C5
_08103434: .4byte 0x080A60A1
	thumb_func_end sub_0810341C

	thumb_func_start sub_08103438
sub_08103438: @ 0x08103438
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r4, _081034E8
	ldrh r0, [r4]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xff
	beq _0810347C
	lsls r0, r3, #0x14
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r3, r0, #0x10
	movs r2, #1
	ldr r5, _081034EC
_08103464:
	adds r1, r3, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #5
	bls _08103464
_0810347C:
	movs r4, #1
	ldr r0, _081034E8
	mov r8, r0
_08103482:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
	mov r1, r8
	adds r0, r5, r1
	ldrh r0, [r0]
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r4, #1
	mov ip, r4
	cmp r3, #0xff
	beq _081034CA
	lsls r0, r3, #0x14
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r3, r0, #0x10
	movs r2, #1
	ldr r7, _081034EC
	ldr r6, _081034E8
	adds r4, r5, #0
_081034B0:
	adds r1, r3, r2
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r2, #1
	adds r0, r0, r4
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #5
	bls _081034B0
_081034CA:
	mov r1, ip
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _08103482
	mov r0, sb
	bl DestroyAnimVisualTask
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081034E8: .4byte 0x0856EC04
_081034EC: .4byte 0x020377B4
	thumb_func_end sub_08103438

	thumb_func_start sub_081034F0
sub_081034F0: @ 0x081034F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
	ldr r6, _08103520
_081034FA:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _081034FA
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08103520: .4byte 0x0856EC04
	thumb_func_end sub_081034F0

	thumb_func_start sub_08103524
sub_08103524: @ 0x08103524
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r4, _0810357C
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r2, _08103580
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08103560
	lsls r2, r0, #4
	ldrb r1, [r5, #5]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
_08103560:
	ldrh r0, [r4, #2]
	movs r1, #0
	strh r0, [r5, #0x30]
	strh r1, [r5, #0x32]
	ldrh r0, [r4, #4]
	strh r0, [r5, #0x34]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08103584
	movs r6, #0x30
	movs r3, #0x28
	b _0810359E
	.align 2, 0
_0810357C: .4byte 0x020380BE
_08103580: .4byte 0x0856EC04
_08103584:
	ldr r4, _081035D4
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0810359E:
	ldrh r0, [r5, #0x20]
	lsls r1, r0, #4
	strh r1, [r5, #0x36]
	ldrh r1, [r5, #0x22]
	lsls r2, r1, #4
	strh r2, [r5, #0x38]
	subs r0, r6, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r1, r3, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	adds r2, #0x3a
	adds r3, r5, #0
	adds r3, #0x3c
	movs r4, #0x28
	str r4, [sp]
	bl sub_081035DC
	ldr r0, _081035D8
	str r0, [r5, #0x1c]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081035D4: .4byte 0x020380D7
_081035D8: .4byte 0x08103635
	thumb_func_end sub_08103524

	thumb_func_start sub_081035DC
sub_081035DC: @ 0x081035DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r2, #0
	mov r8, r3
	ldr r2, [sp, #0x18]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r1, r2, #0x18
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _081035FE
	lsls r0, r1, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
_081035FE:
	lsls r5, r2, #8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl __divsi3
	adds r4, r0, #0
	cmp r4, #0
	bne _08103612
	movs r4, #1
_08103612:
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	strh r0, [r7]
	lsls r0, r6, #0x10
	asrs r0, r0, #8
	adds r1, r4, #0
	bl __divsi3
	mov r1, r8
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081035DC

	thumb_func_start sub_08103634
sub_08103634: @ 0x08103634
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2e]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r1, r0, r1
	adds r0, r1, #0
	cmp r1, #0
	bge _08103650
	adds r0, #0xff
_08103650:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	ldrh r1, [r4, #0x3a]
	ldrh r2, [r4, #0x36]
	adds r1, r1, r2
	strh r1, [r4, #0x36]
	ldrh r2, [r4, #0x3c]
	ldrh r3, [r4, #0x38]
	adds r2, r2, r3
	strh r2, [r4, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r4, #0x20]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	strh r2, [r4, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	ldrh r0, [r4, #0x20]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0810369E
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0810369E
	cmp r1, #0x80
	ble _081036A6
_0810369E:
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
	b _081036F6
_081036A6:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _081036F6
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	ble _081036F6
	strh r5, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _081036CE
	strh r5, [r4, #0x30]
_081036CE:
	ldr r2, _081036FC
	movs r3, #0x30
	ldrsh r1, [r4, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _081036F6
	lsls r2, r0, #4
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
_081036F6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081036FC: .4byte 0x0856EC04
	thumb_func_end sub_08103634

	thumb_func_start sub_08103700
sub_08103700: @ 0x08103700
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _08103784
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0810371E
	ldr r1, _08103788
	movs r2, #2
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_0810371E:
	ldrb r0, [r7]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _08103788
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	movs r5, #0
	strh r0, [r6, #0x20]
	ldrb r0, [r7]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r6, #0x22]
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartSpriteAnim
	strh r5, [r6, #0x32]
	strh r5, [r6, #0x34]
	ldrh r0, [r6, #0x20]
	lsls r0, r0, #4
	strh r0, [r6, #0x36]
	ldrh r0, [r6, #0x22]
	lsls r0, r0, #4
	strh r0, [r6, #0x38]
	movs r1, #2
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #5
	bl __divsi3
	strh r0, [r6, #0x3a]
	movs r2, #4
	ldrsh r0, [r4, r2]
	lsls r0, r0, #7
	movs r1, #5
	bl __divsi3
	strh r0, [r6, #0x3c]
	ldr r0, _0810378C
	str r0, [r6, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08103784: .4byte 0x020380D6
_08103788: .4byte 0x020380BE
_0810378C: .4byte 0x08103791
	thumb_func_end sub_08103700

	thumb_func_start sub_08103790
sub_08103790: @ 0x08103790
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	ldrh r1, [r4, #0x3c]
	ldrh r2, [r4, #0x38]
	adds r1, r1, r2
	strh r1, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r4, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r4, #0x22]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #5
	ble _081037EE
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _081037EE
	ldrh r0, [r4, #0x32]
	adds r0, #0x10
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x32]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0x12
	bl Cos
	strh r0, [r4, #0x24]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #0x12
	bl Sin
	strh r0, [r4, #0x26]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081037EE
	movs r0, #1
	strh r0, [r4, #0x34]
_081037EE:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x30
	bne _08103802
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_08103802:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08103790

	thumb_func_start sub_08103808
sub_08103808: @ 0x08103808
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08103828
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0810382C
	ldrb r0, [r5, #3]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r5, #3]
	movs r6, #0x10
	b _0810382E
	.align 2, 0
_08103828: .4byte 0x020380BE
_0810382C:
	ldr r6, _08103868
_0810382E:
	ldr r4, _0810386C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r6
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #8
	strh r0, [r5, #0x22]
	movs r0, #8
	strh r0, [r5, #0x2e]
	ldr r0, _08103870
	str r0, [r5, #0x1c]
	ldr r1, _08103874
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08103868: .4byte 0x0000FFF0
_0810386C: .4byte 0x020380D6
_08103870: .4byte 0x080A5D79
_08103874: .4byte 0x080A34C5
	thumb_func_end sub_08103808

	thumb_func_start sub_08103878
sub_08103878: @ 0x08103878
	push {r4, r5, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldrh r0, [r4, #0x22]
	adds r0, #8
	strh r0, [r4, #0x22]
	ldr r5, _081038F0
	ldrb r1, [r5, #2]
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r2, _081038F4
	movs r0, #4
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _081038B8
	lsls r2, r0, #4
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
_081038B8:
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #0x20
	cmp r0, #0
	bne _081038C4
	ldr r2, _081038F8
_081038C4:
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x20]
	strh r1, [r4, #0x30]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	subs r0, #0x28
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x38]
	ldr r0, _081038FC
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081038F0: .4byte 0x020380BE
_081038F4: .4byte 0x0856EC04
_081038F8: .4byte 0x0000FFE0
_081038FC: .4byte 0x08103901
	thumb_func_end sub_08103878

	thumb_func_start sub_08103900
sub_08103900: @ 0x08103900
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08103950
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r2, [r4, #0x24]
	movs r3, #0x24
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _0810392C
	lsls r0, r1, #0x10
	rsbs r0, r0, #0
	lsrs r1, r0, #0x10
_0810392C:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	strh r0, [r4, #0x24]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #4
	bl Sin
	ldrh r3, [r4, #0x26]
	adds r0, r0, r3
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x38]
	adds r0, #8
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	b _08103956
_08103950:
	adds r0, r4, #0
	bl DestroyAnimSprite
_08103956:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08103900

	thumb_func_start sub_0810395C
sub_0810395C: @ 0x0810395C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810397C
	adds r0, r5, #0
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	b _08103986
_0810397C:
	adds r0, r5, #0
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
_08103986:
	strh r0, [r6, #0x20]
	adds r0, r5, #0
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _081039A8
	adds r0, #3
_081039A8:
	asrs r0, r0, #2
	subs r0, r4, r0
	strh r0, [r6, #0x22]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0810395C

	thumb_func_start sub_081039B4
sub_081039B4: @ 0x081039B4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _081039C8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _081039D0
	ldr r0, _081039CC
	b _081039D2
	.align 2, 0
_081039C8: .4byte 0x020380BE
_081039CC: .4byte 0x020380D6
_081039D0:
	ldr r0, _08103A10
_081039D2:
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0810395C
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	ldr r0, _08103A14
	ldrh r0, [r0, #2]
	strh r0, [r5, #0x2e]
	adds r0, r1, #2
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r1, _08103A18
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08103A1C
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103A10: .4byte 0x020380D7
_08103A14: .4byte 0x020380BE
_08103A18: .4byte 0x08103A21
_08103A1C: .4byte 0x080A60A1
	thumb_func_end sub_081039B4

	thumb_func_start sub_08103A20
sub_08103A20: @ 0x08103A20
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08103A48
	ldr r1, _08103A50
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r0, _08103A54
	str r0, [r4, #0x1c]
_08103A48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103A50: .4byte 0x080A34C5
_08103A54: .4byte 0x080A60A1
	thumb_func_end sub_08103A20

	thumb_func_start sub_08103A58
sub_08103A58: @ 0x08103A58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08103A6C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08103A74
	ldr r0, _08103A70
	b _08103A76
	.align 2, 0
_08103A6C: .4byte 0x020380BE
_08103A70: .4byte 0x020380D6
_08103A74:
	ldr r0, _08103A94
_08103A76:
	ldrb r0, [r0]
	adds r1, r4, #0
	bl sub_0810395C
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldr r1, _08103A98
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08103A9C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103A94: .4byte 0x020380D7
_08103A98: .4byte 0x08103AA1
_08103A9C: .4byte 0x080A6085
	thumb_func_end sub_08103A58

	thumb_func_start sub_08103AA0
sub_08103AA0: @ 0x08103AA0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08103AC6
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r1, _08103ACC
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08103AD0
	str r0, [r4, #0x1c]
_08103AC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103ACC: .4byte 0x080A6015
_08103AD0: .4byte 0x080A6085
	thumb_func_end sub_08103AA0

	thumb_func_start sub_08103AD4
sub_08103AD4: @ 0x08103AD4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08103AE8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08103AF0
	ldr r0, _08103AEC
	b _08103AF2
	.align 2, 0
_08103AE8: .4byte 0x020380BE
_08103AEC: .4byte 0x020380D6
_08103AF0:
	ldr r0, _08103B44
_08103AF2:
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	strh r0, [r4, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bgt _08103B1A
	movs r0, #0xa
	strh r0, [r4, #0x22]
_08103B1A:
	movs r0, #1
	strh r0, [r4, #0x2e]
	strh r6, [r4, #0x30]
	adds r1, r4, #0
	adds r1, #0x43
	ldrb r0, [r1]
	strh r0, [r4, #0x32]
	ldrb r0, [r1]
	adds r0, #4
	strh r0, [r4, #0x34]
	strh r6, [r4, #0x36]
	ldr r1, _08103B48
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08103B4C
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08103B44: .4byte 0x020380D7
_08103B48: .4byte 0x08103B51
_08103B4C: .4byte 0x080A6085
	thumb_func_end sub_08103AD4

	thumb_func_start sub_08103B50
sub_08103B50: @ 0x08103B50
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _08103B66
	ldr r0, _08103B6C
	str r0, [r1, #0x1c]
_08103B66:
	pop {r0}
	bx r0
	.align 2, 0
_08103B6C: .4byte 0x08103B71
	thumb_func_end sub_08103B50

	thumb_func_start sub_08103B70
sub_08103B70: @ 0x08103B70
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x30]
	adds r1, r0, #4
	strh r1, [r2, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xfe
	ble _08103BA2
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _08103B9C
	strh r0, [r2, #0x24]
	ldr r0, _08103B98
	str r0, [r2, #0x1c]
	b _08103BD8
	.align 2, 0
_08103B98: .4byte 0x08103AA1
_08103B9C:
	movs r0, #0xff
	ands r1, r0
	strh r1, [r2, #0x30]
_08103BA2:
	movs r1, #0x30
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	ble _08103BB2
	ldrh r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x43
	strb r0, [r1]
_08103BB2:
	movs r3, #0x30
	ldrsh r0, [r2, r3]
	cmp r0, #0x9f
	ble _08103BC2
	ldrh r0, [r2, #0x32]
	adds r1, r2, #0
	adds r1, #0x43
	strb r0, [r1]
_08103BC2:
	ldr r1, _08103BDC
	movs r3, #0x30
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	asrs r1, r0, #1
	adds r0, r0, r1
	strh r0, [r2, #0x24]
_08103BD8:
	pop {r0}
	bx r0
	.align 2, 0
_08103BDC: .4byte 0x082FA8CC
	thumb_func_end sub_08103B70

	thumb_func_start sub_08103BE0
sub_08103BE0: @ 0x08103BE0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08103BF4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08103BFC
	ldr r0, _08103BF8
	b _08103BFE
	.align 2, 0
_08103BF4: .4byte 0x020380BE
_08103BF8: .4byte 0x020380D6
_08103BFC:
	ldr r0, _08103C20
_08103BFE:
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0810395C
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08103C24
	adds r0, r5, #0
	movs r1, #0
	bl StartSpriteAnim
	movs r0, #2
	b _08103C2E
	.align 2, 0
_08103C20: .4byte 0x020380D7
_08103C24:
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
	movs r0, #3
_08103C2E:
	strh r0, [r5, #0x2e]
	ldr r0, _08103C3C
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103C3C: .4byte 0x08103C41
	thumb_func_end sub_08103BE0

	thumb_func_start sub_08103C40
sub_08103C40: @ 0x08103C40
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _08103C6E
	movs r0, #0
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r1, _08103C74
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08103C78
	str r0, [r4, #0x1c]
_08103C6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103C74: .4byte 0x08103C7D
_08103C78: .4byte 0x080A60A1
	thumb_func_end sub_08103C40

	thumb_func_start sub_08103C7C
sub_08103C7C: @ 0x08103C7C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _08103C94
	adds r0, r1, #0
	bl DestroyAnimSprite
_08103C94:
	pop {r0}
	bx r0
	thumb_func_end sub_08103C7C

