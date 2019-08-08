.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AnimBonemerangProjectile
AnimBonemerangProjectile: @ 0x081151E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0811523C
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
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	ldr r5, _08115240
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
	ldr r0, _08115244
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldr r0, _08115248
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811523C: .4byte 0x020380D6
_08115240: .4byte 0x020380D7
_08115244: .4byte 0x0000FFD8
_08115248: .4byte 0x0811524D
	thumb_func_end AnimBonemerangProjectile

	thumb_func_start AnimBonemerangProjectileStep
AnimBonemerangProjectileStep: @ 0x0811524C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081152A0
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
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	ldr r4, _081152A8
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
	movs r0, #0x28
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	bl InitAnimArcTranslation
	ldr r0, _081152AC
	str r0, [r5, #0x1c]
_081152A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081152A8: .4byte 0x020380D6
_081152AC: .4byte 0x081152B1
	thumb_func_end AnimBonemerangProjectileStep

	thumb_func_start AnimFissureDirtPlumeParticleStep
AnimFissureDirtPlumeParticleStep: @ 0x081152B0
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081152C4
	adds r0, r4, #0
	bl DestroyAnimSprite
_081152C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimFissureDirtPlumeParticleStep

	thumb_func_start AnimBoneHitProjectile
AnimBoneHitProjectile: @ 0x081152CC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r0, _0811532C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081152EC
	ldr r1, _08115330
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_081152EC:
	ldr r4, _08115330
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x2e]
	ldr r5, _08115334
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
	ldr r0, _08115338
	str r0, [r6, #0x1c]
	ldr r1, _0811533C
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811532C: .4byte 0x020380D6
_08115330: .4byte 0x020380BE
_08115334: .4byte 0x020380D7
_08115338: .4byte 0x080A67B5
_0811533C: .4byte 0x080A34C5
	thumb_func_end AnimBoneHitProjectile

	thumb_func_start AnimDirtScatter
AnimDirtScatter: @ 0x08115340
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r4, _081153C0
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	bl Random2
	movs r4, #0x1f
	adds r5, r4, #0
	ands r5, r0
	bl Random2
	ands r4, r0
	adds r1, r5, #0
	cmp r1, #0x10
	ble _08115388
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08115388:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x10
	ble _08115398
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08115398:
	ldr r0, _081153C4
	ldrh r0, [r0, #4]
	strh r0, [r6, #0x2e]
	mov r1, r8
	adds r0, r1, r5
	strh r0, [r6, #0x32]
	adds r0, r7, r4
	strh r0, [r6, #0x36]
	ldr r0, _081153C8
	str r0, [r6, #0x1c]
	ldr r1, _081153CC
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081153C0: .4byte 0x020380D7
_081153C4: .4byte 0x020380BE
_081153C8: .4byte 0x080A67B5
_081153CC: .4byte 0x080A6015
	thumb_func_end AnimDirtScatter

	thumb_func_start AnimMudSportDirt
AnimMudSportDirt: @ 0x081153D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r2, [r5, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #1
	ldr r3, _08115430
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _08115434
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	ldr r6, _08115438
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08115444
	ldr r4, _0811543C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r2, [r6, #2]
	adds r0, r0, r2
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r3, [r6, #4]
	adds r0, r0, r3
	strh r0, [r5, #0x22]
	movs r1, #2
	ldrsh r0, [r6, r1]
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
	cmp r0, #0
	ble _0811542A
	movs r1, #1
_0811542A:
	strh r1, [r5, #0x2e]
	ldr r0, _08115440
	b _08115452
	.align 2, 0
_08115430: .4byte 0x000003FF
_08115434: .4byte 0xFFFFFC00
_08115438: .4byte 0x020380BE
_0811543C: .4byte 0x020380D6
_08115440: .4byte 0x08115461
_08115444:
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x20]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x22]
	rsbs r0, r0, #0
	strh r0, [r5, #0x26]
	ldr r0, _0811545C
_08115452:
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811545C: .4byte 0x0811549D
	thumb_func_end AnimMudSportDirt

	thumb_func_start AnimMudSportDirtRising
AnimMudSportDirtRising: @ 0x08115460
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0811547E
	movs r0, #0
	strh r0, [r2, #0x30]
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x20]
	adds r0, r0, r1
	strh r0, [r2, #0x20]
_0811547E:
	ldrh r0, [r2, #0x22]
	subs r0, #4
	strh r0, [r2, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08115496
	adds r0, r2, #0
	bl DestroyAnimSprite
_08115496:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimMudSportDirtRising

	thumb_func_start AnimMudSportDirtFalling
AnimMudSportDirtFalling: @ 0x0811549C
	push {lr}
	adds r3, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	cmp r1, #0
	beq _081154AE
	cmp r1, #1
	beq _081154C4
	b _08115506
_081154AE:
	ldrh r0, [r3, #0x26]
	adds r0, #4
	strh r0, [r3, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08115506
	strh r1, [r3, #0x26]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	b _08115506
_081154C4:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08115506
	movs r0, #0
	strh r0, [r3, #0x30]
	movs r1, #0x3e
	adds r1, r1, r3
	mov ip, r1
	ldrb r2, [r1]
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
	ldrh r0, [r3, #0x32]
	adds r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _08115506
	adds r0, r3, #0
	bl DestroyAnimSprite
_08115506:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimMudSportDirtFalling

	thumb_func_start sub_0811550C
sub_0811550C: @ 0x0811550C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0811552C
	adds r1, r0, r1
	ldr r0, _08115530
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08115538
	ldr r0, _08115534
	b _0811553A
	.align 2, 0
_0811552C: .4byte 0x03005B60
_08115530: .4byte 0x020380BE
_08115534: .4byte 0x0811554D
_08115538:
	ldr r0, _08115548
_0811553A:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08115548: .4byte 0x08115705
	thumb_func_end sub_0811550C

	thumb_func_start sub_0811554C
sub_0811554C: @ 0x0811554C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08115570
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bls _08115566
	b _081156FA
_08115566:
	lsls r0, r0, #2
	ldr r1, _08115574
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08115570: .4byte 0x03005B60
_08115574: .4byte 0x08115578
_08115578: @ jump table
	.4byte _0811558C @ case 0
	.4byte _08115614 @ case 1
	.4byte _08115624 @ case 2
	.4byte _081156C8 @ case 3
	.4byte _081156DC @ case 4
_0811558C:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1c]
	ldr r0, _081155B4
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1e]
	cmp r0, #1
	bne _081155C0
	ldr r0, _081155B8
	ldrh r0, [r0]
	strh r0, [r4, #0x20]
	ldr r0, _081155BC
	b _081155C8
	.align 2, 0
_081155B4: .4byte 0x020380D6
_081155B8: .4byte 0x02022ACC
_081155BC: .4byte 0x02022ACE
_081155C0:
	ldr r0, _08115604
	ldrh r0, [r0]
	strh r0, [r4, #0x20]
	ldr r0, _08115608
_081155C8:
	ldrh r0, [r0]
	strh r0, [r4, #0x22]
	ldr r0, _0811560C
	ldrb r0, [r0]
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	subs r1, #0x20
	strh r1, [r4, #0x24]
	adds r0, #0x20
	strh r0, [r4, #0x26]
	cmp r1, #0
	bge _081155EA
	movs r0, #0
	strh r0, [r4, #0x24]
_081155EA:
	ldr r2, _08115610
	movs r3, #0x1c
	ldrsh r1, [r4, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _081156CE
	.align 2, 0
_08115604: .4byte 0x02022AD0
_08115608: .4byte 0x02022AD2
_0811560C: .4byte 0x020380D6
_08115610: .4byte 0x020205AC
_08115614:
	ldrb r0, [r4, #0x1e]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	movs r3, #0x26
	ldrsh r2, [r4, r3]
	bl sub_08115930
	b _081156CE
_08115624:
	ldrh r0, [r4, #0xc]
	adds r0, #6
	movs r1, #0x7f
	ands r0, r1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08115646
	movs r0, #0
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
_08115646:
	ldr r1, _08115668
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	ldrh r3, [r4, #0xe]
	adds r2, r0, r3
	strh r2, [r4, #0x12]
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _08115670
	ldr r1, _0811566C
	b _08115672
	.align 2, 0
_08115668: .4byte 0x082FA8CC
_0811566C: .4byte 0x02022ACE
_08115670:
	ldr r1, _08115694
_08115672:
	ldrh r0, [r4, #0x22]
	subs r0, r0, r2
	strh r0, [r1]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0x3f
	ble _081156FA
	ldrh r0, [r4, #0x24]
	movs r1, #0x78
	subs r2, r1, r0
	strh r2, [r4, #0x12]
	movs r3, #0x1e
	ldrsh r0, [r4, r3]
	cmp r0, #1
	bne _0811569C
	ldr r1, _08115698
	b _0811569E
	.align 2, 0
_08115694: .4byte 0x02022AD2
_08115698: .4byte 0x02022ACE
_0811569C:
	ldr r1, _081156C0
_0811569E:
	ldrh r0, [r4, #0x22]
	subs r0, r0, r2
	strh r0, [r1]
	ldr r2, _081156C4
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0x20]
	movs r3, #0x88
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r2
	strh r0, [r1, #0x24]
	b _081156CE
	.align 2, 0
_081156C0: .4byte 0x02022AD2
_081156C4: .4byte 0x020205AC
_081156C8:
	ldr r1, _081156D8
	movs r0, #3
	strb r0, [r1, #0x15]
_081156CE:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _081156FA
	.align 2, 0
_081156D8: .4byte 0x020397C8
_081156DC:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	ldr r2, _08115700
	movs r0, #0x1c
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
_081156FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115700: .4byte 0x020205AC
	thumb_func_end sub_0811554C

	thumb_func_start sub_08115704
sub_08115704: @ 0x08115704
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08115744
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r2, #4
	orrs r0, r2
	strb r0, [r3]
	movs r4, #0
	strh r4, [r1, #0x24]
	strh r4, [r1, #0x26]
	ldr r0, _08115748
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08115750
	ldr r0, _0811574C
	b _08115752
	.align 2, 0
_08115744: .4byte 0x020205AC
_08115748: .4byte 0x020380D6
_0811574C: .4byte 0x02022ACE
_08115750:
	ldr r0, _08115760
_08115752:
	strh r4, [r0]
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08115760: .4byte 0x02022AD2
	thumb_func_end sub_08115704

	thumb_func_start sub_08115764
sub_08115764: @ 0x08115764
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08115784
	adds r1, r0, r1
	ldr r0, _08115788
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08115790
	ldr r0, _0811578C
	b _08115792
	.align 2, 0
_08115784: .4byte 0x03005B60
_08115788: .4byte 0x020380BE
_0811578C: .4byte 0x081157A5
_08115790:
	ldr r0, _081157A0
_08115792:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_081157A0: .4byte 0x08115829
	thumb_func_end sub_08115764

	thumb_func_start sub_081157A4
sub_081157A4: @ 0x081157A4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081157C4
	adds r4, r0, r1
	movs r0, #8
	ldrsh r5, [r4, r0]
	cmp r5, #0
	beq _081157C8
	cmp r5, #1
	beq _0811581C
	b _08115822
	.align 2, 0
_081157C4: .4byte 0x03005B60
_081157C8:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1c]
	ldr r3, _08115818
	movs r0, #0x1c
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
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r5, [r0, #0x24]
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r2, [r1, #0x22]
	movs r0, #0xa0
	subs r0, r0, r2
	strh r0, [r1, #0x26]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08115822
	.align 2, 0
_08115818: .4byte 0x020205AC
_0811581C:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08115822:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081157A4

	thumb_func_start sub_08115828
sub_08115828: @ 0x08115828
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0811584C
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bhi _0811592A
	lsls r0, r0, #2
	ldr r1, _08115850
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811584C: .4byte 0x03005B60
_08115850: .4byte 0x08115854
_08115854: @ jump table
	.4byte _08115868 @ case 0
	.4byte _081158BC @ case 1
	.4byte _081158CA @ case 2
	.4byte _081158E4 @ case 3
	.4byte _08115924 @ case 4
_08115868:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1c]
	ldr r0, _0811588C
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1e]
	cmp r0, #1
	bne _08115894
	ldr r0, _08115890
	b _08115896
	.align 2, 0
_0811588C: .4byte 0x020380D6
_08115890: .4byte 0x02022ACC
_08115894:
	ldr r0, _081158B4
_08115896:
	ldrh r0, [r0]
	strh r0, [r4, #0x20]
	ldr r0, _081158B8
	ldrb r0, [r0]
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	subs r1, #0x20
	strh r1, [r4, #0x24]
	adds r0, #0x20
	strh r0, [r4, #0x26]
	b _08115912
	.align 2, 0
_081158B4: .4byte 0x02022AD0
_081158B8: .4byte 0x020380D6
_081158BC:
	ldrb r0, [r4, #0x1e]
	movs r1, #0x26
	ldrsh r2, [r4, r1]
	movs r1, #0
	bl sub_08115930
	b _08115912
_081158CA:
	ldr r2, _081158E0
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x60
	strh r1, [r0, #0x26]
	b _08115912
	.align 2, 0
_081158E0: .4byte 0x020205AC
_081158E4:
	ldr r2, _0811591C
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	subs r1, #8
	strh r1, [r0, #0x26]
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x26
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0811592A
	ldr r1, _08115920
	movs r0, #3
	strb r0, [r1, #0x15]
_08115912:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0811592A
	.align 2, 0
_0811591C: .4byte 0x020205AC
_08115920: .4byte 0x020397C8
_08115924:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_0811592A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08115828

	thumb_func_start sub_08115930
sub_08115930: @ 0x08115930
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	cmp r0, #1
	bne _08115954
	ldr r0, _0811594C
	ldrh r3, [r0]
	ldr r0, _08115950
	b _0811595A
	.align 2, 0
_0811594C: .4byte 0x02022ACC
_08115950: .4byte 0x04000014
_08115954:
	ldr r0, _081159E0
	ldrh r3, [r0]
	ldr r0, _081159E4
_0811595A:
	str r0, [sp]
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _08115964
	movs r1, #0
_08115964:
	lsls r2, r1, #0x10
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	cmp r2, r0
	bge _08115990
	ldr r5, _081159E8
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r6, r5, r0
_08115976:
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r0, r1, r5
	strh r3, [r0]
	adds r1, r1, r6
	strh r3, [r1]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	cmp r0, r4
	blt _08115976
_08115990:
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	bgt _081159BE
	ldr r4, _081159E8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r3, r0, #0
	adds r3, #0xf0
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r5, r4, r0
_081159A8:
	asrs r2, r1, #0x10
	lsls r1, r2, #1
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r1, r5
	strh r3, [r1]
	adds r2, #1
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	ble _081159A8
_081159BE:
	ldr r0, _081159EC
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
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081159E0: .4byte 0x02022AD0
_081159E4: .4byte 0x04000018
_081159E8: .4byte 0x020388C8
_081159EC: .4byte 0xA2600001
	thumb_func_end sub_08115930

	thumb_func_start AnimFissureDirtPlumeParticle
AnimFissureDirtPlumeParticle: @ 0x081159F0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08115A04
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r1, #0
	bne _08115A0C
	ldr r0, _08115A08
	b _08115A0E
	.align 2, 0
_08115A04: .4byte 0x020380BE
_08115A08: .4byte 0x020380D6
_08115A0C:
	ldr r0, _08115A70
_08115A0E:
	ldrb r4, [r0]
	movs r6, #0x18
	adds r1, r7, #0
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _08115A2A
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r2, #4
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_08115A2A:
	adds r0, r4, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r6
	strh r0, [r5, #0x20]
	adds r0, r4, #0
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x1e
	strh r0, [r5, #0x22]
	ldrh r1, [r7, #0xa]
	strh r1, [r5, #0x2e]
	ldrh r1, [r7, #4]
	ldrh r2, [r5, #0x20]
	adds r1, r1, r2
	strh r1, [r5, #0x32]
	ldrh r1, [r7, #6]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
	ldrh r0, [r7, #8]
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	bl InitAnimArcTranslation
	ldr r0, _08115A74
	str r0, [r5, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115A70: .4byte 0x020380D7
_08115A74: .4byte 0x08115A79
	thumb_func_end AnimFissureDirtPlumeParticle

	thumb_func_start AnimBonemerangProjectileEnd
AnimBonemerangProjectileEnd: @ 0x08115A78
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08115A8C
	adds r0, r4, #0
	bl DestroyAnimSprite
_08115A8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimBonemerangProjectileEnd

	thumb_func_start AnimDigDirtMound
AnimDigDirtMound: @ 0x08115A94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08115AA8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08115AB0
	ldr r0, _08115AAC
	b _08115AB2
	.align 2, 0
_08115AA8: .4byte 0x020380BE
_08115AAC: .4byte 0x020380D6
_08115AB0:
	ldr r0, _08115B10
_08115AB2:
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08115B14
	adds r0, r0, r2
	ldr r4, _08115B18
	movs r3, #2
	ldrsh r1, [r4, r3]
	lsls r1, r1, #5
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	adds r0, r5, #0
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x20
	strh r0, [r6, #0x22]
	ldrh r2, [r6, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	movs r3, #2
	ldrsh r0, [r4, r3]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r3, _08115B1C
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _08115B20
	ands r0, r2
	orrs r0, r1
	strh r0, [r6, #4]
	ldr r1, _08115B24
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
	ldrh r0, [r4, #4]
	strh r0, [r6, #0x2e]
	ldr r0, _08115B28
	str r0, [r6, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08115B10: .4byte 0x020380D7
_08115B14: .4byte 0x0000FFF0
_08115B18: .4byte 0x020380BE
_08115B1C: .4byte 0x000003FF
_08115B20: .4byte 0xFFFFFC00
_08115B24: .4byte 0x080A34C5
_08115B28: .4byte 0x080A5D79
	thumb_func_end AnimDigDirtMound

	thumb_func_start sub_08115B2C
sub_08115B2C: @ 0x08115B2C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08115B50
	adds r4, r0, r1
	ldr r0, _08115B54
	ldrh r2, [r0, #2]
	movs r3, #2
	ldrsh r1, [r0, r3]
	adds r6, r0, #0
	cmp r1, #0
	beq _08115B58
	adds r0, r2, #3
	b _08115B64
	.align 2, 0
_08115B50: .4byte 0x03005B60
_08115B54: .4byte 0x020380BE
_08115B58:
	ldr r0, _08115B84
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	adds r0, #3
_08115B64:
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x24]
	adds r1, r6, #0
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xe]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #4
	beq _08115B90
	cmp r0, #5
	bne _08115BD0
	ldr r0, _08115B88
	ldrh r0, [r0]
	strh r0, [r4, #0x22]
	ldr r0, _08115B8C
	b _08115BEE
	.align 2, 0
_08115B84: .4byte 0x020380A8
_08115B88: .4byte 0x02022AD4
_08115B8C: .4byte 0x08115BFD
_08115B90:
	movs r0, #0
	strh r0, [r4, #0x22]
	movs r5, #0
_08115B96:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08115BC0
	movs r3, #0x22
	ldrsh r0, [r4, r3]
	adds r0, #9
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #8
	adds r1, r1, r0
	ldr r0, _08115BCC
	adds r0, r5, r0
	ldrb r0, [r0]
	strh r0, [r1]
	ldrh r0, [r4, #0x22]
	adds r0, #1
	strh r0, [r4, #0x22]
_08115BC0:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _08115B96
	b _08115BEC
	.align 2, 0
_08115BCC: .4byte 0x02023E88
_08115BD0:
	ldrb r0, [r6]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1a]
	cmp r0, #0xff
	bne _08115BE8
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _08115BF0
_08115BE8:
	movs r0, #1
	strh r0, [r4, #0x22]
_08115BEC:
	ldr r0, _08115BF8
_08115BEE:
	str r0, [r4]
_08115BF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08115BF8: .4byte 0x08115CF5
	thumb_func_end sub_08115B2C

	thumb_func_start sub_08115BFC
sub_08115BFC: @ 0x08115BFC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08115C20
	adds r3, r0, r1
	movs r0, #8
	ldrsh r1, [r3, r0]
	cmp r1, #1
	beq _08115C80
	cmp r1, #1
	bgt _08115C24
	cmp r1, #0
	beq _08115C2A
	b _08115CEC
	.align 2, 0
_08115C20: .4byte 0x03005B60
_08115C24:
	cmp r1, #2
	beq _08115CE0
	b _08115CEC
_08115C2A:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08115CEC
	strh r1, [r3, #0xa]
	ldrh r1, [r3, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08115C54
	ldr r1, _08115C50
	ldrh r0, [r3, #0x26]
	ldrh r2, [r3, #0x22]
	adds r0, r0, r2
	strh r0, [r1]
	b _08115C5E
	.align 2, 0
_08115C50: .4byte 0x02022AD4
_08115C54:
	ldr r0, _08115C7C
	ldrh r1, [r3, #0x22]
	ldrh r2, [r3, #0x26]
	subs r1, r1, r2
	strh r1, [r0]
_08115C5E:
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bne _08115CEC
	movs r0, #0
	strh r0, [r3, #0xc]
	ldrh r0, [r3, #0x24]
	subs r0, #1
	strh r0, [r3, #0x24]
	b _08115CD4
	.align 2, 0
_08115C7C: .4byte 0x02022AD4
_08115C80:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08115CEC
	movs r0, #0
	strh r0, [r3, #0xa]
	ldrh r0, [r3, #0xc]
	ands r1, r0
	cmp r1, #0
	bne _08115CAC
	ldr r1, _08115CA8
	ldrh r0, [r3, #0x24]
	ldrh r2, [r3, #0x22]
	adds r0, r0, r2
	strh r0, [r1]
	b _08115CB6
	.align 2, 0
_08115CA8: .4byte 0x02022AD4
_08115CAC:
	ldr r0, _08115CDC
	ldrh r1, [r3, #0x22]
	ldrh r2, [r3, #0x24]
	subs r1, r1, r2
	strh r1, [r0]
_08115CB6:
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08115CEC
	movs r0, #0
	strh r0, [r3, #0xc]
	ldrh r0, [r3, #0x24]
	subs r0, #1
	strh r0, [r3, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08115CEC
_08115CD4:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	b _08115CEC
	.align 2, 0
_08115CDC: .4byte 0x02022AD4
_08115CE0:
	ldr r1, _08115CF0
	ldrh r0, [r3, #0x22]
	strh r0, [r1]
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08115CEC:
	pop {r0}
	bx r0
	.align 2, 0
_08115CF0: .4byte 0x02022AD4
	thumb_func_end sub_08115BFC

	thumb_func_start sub_08115CF4
sub_08115CF4: @ 0x08115CF4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	ldr r1, _08115D18
	adds r4, r0, r1
	movs r0, #8
	ldrsh r5, [r4, r0]
	cmp r5, #1
	beq _08115D54
	cmp r5, #1
	bgt _08115D1C
	cmp r5, #0
	beq _08115D22
	b _08115DCE
	.align 2, 0
_08115D18: .4byte 0x03005B60
_08115D1C:
	cmp r5, #2
	beq _08115D90
	b _08115DCE
_08115D22:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08115DCE
	strh r5, [r4, #0xa]
	adds r0, r4, #0
	bl sub_08115DD8
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08115DCE
	strh r5, [r4, #0xc]
	ldrh r0, [r4, #0x24]
	subs r0, #1
	strh r0, [r4, #0x24]
	b _08115D88
_08115D54:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08115DCE
	strh r5, [r4, #0xa]
	adds r0, r4, #0
	bl sub_08115DD8
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08115DCE
	strh r5, [r4, #0xc]
	ldrh r0, [r4, #0x24]
	subs r0, #1
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08115DCE
_08115D88:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08115DCE
_08115D90:
	movs r2, #0
	movs r7, #0x22
	ldrsh r0, [r4, r7]
	cmp r2, r0
	bge _08115DC8
	ldr r0, _08115DD4
	mov ip, r0
	adds r5, r4, #0
	adds r5, #8
	movs r6, #0
_08115DA4:
	adds r0, r2, #0
	adds r0, #9
	lsls r0, r0, #1
	adds r0, r5, r0
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	strh r6, [r0, #0x24]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _08115DA4
_08115DC8:
	adds r0, r3, #0
	bl DestroyAnimVisualTask
_08115DCE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115DD4: .4byte 0x020205AC
	thumb_func_end sub_08115CF4

	thumb_func_start sub_08115DD8
sub_08115DD8: @ 0x08115DD8
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0xc]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08115E00
	movs r0, #0x24
	ldrsh r1, [r3, r0]
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	ldrh r2, [r3, #0x24]
	adds r0, r4, #0
	ands r0, r2
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	b _08115E10
_08115E00:
	movs r1, #0x24
	ldrsh r0, [r3, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08115E10:
	movs r2, #0
	movs r7, #0x22
	ldrsh r0, [r3, r7]
	cmp r2, r0
	bge _08115E44
	ldr r6, _08115E4C
	adds r5, r3, #0
	adds r5, #8
_08115E20:
	adds r0, r2, #0
	adds r0, #9
	lsls r0, r0, #1
	adds r0, r5, r0
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r4, [r0, #0x24]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0x22
	ldrsh r0, [r3, r1]
	cmp r2, r0
	blt _08115E20
_08115E44:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115E4C: .4byte 0x020205AC
	thumb_func_end sub_08115DD8

	thumb_func_start AnimTask_IsPowerOver99
AnimTask_IsPowerOver99: @ 0x08115E50
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08115E70
	movs r2, #0
	ldr r0, _08115E74
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _08115E64
	movs r2, #1
_08115E64:
	strh r2, [r3, #0x1e]
	adds r0, r1, #0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08115E70: .4byte 0x020380BE
_08115E74: .4byte 0x020380A8
	thumb_func_end AnimTask_IsPowerOver99

	thumb_func_start sub_08115E78
sub_08115E78: @ 0x08115E78
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _08115E90
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _08115E98
	ldr r0, _08115E94
	b _08115E9A
	.align 2, 0
_08115E90: .4byte 0x020380BE
_08115E94: .4byte 0x020380D7
_08115E98:
	ldr r0, _08115F08
_08115E9A:
	ldrb r0, [r0]
	adds r5, r0, #0
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #1
	ble _08115EAA
	movs r0, #2
	eors r5, r0
_08115EAA:
	ldr r0, _08115F0C
	ldrb r1, [r6, #2]
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08115F10
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x20
	subs r1, r1, r0
	ldr r2, _08115F14
	adds r0, r2, #0
	ands r1, r0
	strh r1, [r4, #0xa]
	adds r0, r5, #0
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x40
	subs r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	strh r1, [r4, #0xc]
	ldr r2, _08115F18
	ldrh r0, [r4, #0xa]
	strh r0, [r2]
	ldr r0, _08115F1C
	strh r1, [r0]
	ldrh r0, [r6, #4]
	strh r0, [r4, #0xe]
	adds r0, r7, #0
	bl DestroyAnimVisualTask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115F08: .4byte 0x020380D6
_08115F0C: .4byte 0x08115F21
_08115F10: .4byte 0x03005B60
_08115F14: .4byte 0x000001FF
_08115F18: .4byte 0x02022AD4
_08115F1C: .4byte 0x02022AD6
	thumb_func_end sub_08115E78

	thumb_func_start sub_08115F20
sub_08115F20: @ 0x08115F20
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	ldr r1, _08115F50
	adds r2, r0, r1
	ldr r0, _08115F54
	movs r4, #0xe
	ldrsh r1, [r0, r4]
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _08115F60
	ldr r0, _08115F58
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08115F5C
	strh r1, [r0]
	adds r0, r3, #0
	bl DestroyTask
	b _08115F6C
	.align 2, 0
_08115F50: .4byte 0x03005B60
_08115F54: .4byte 0x020380BE
_08115F58: .4byte 0x02022AD4
_08115F5C: .4byte 0x02022AD6
_08115F60:
	ldr r1, _08115F74
	ldrh r0, [r2, #0xa]
	strh r0, [r1]
	ldr r1, _08115F78
	ldrh r0, [r2, #0xc]
	strh r0, [r1]
_08115F6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115F74: .4byte 0x02022AD4
_08115F78: .4byte 0x02022AD6
	thumb_func_end sub_08115F20

