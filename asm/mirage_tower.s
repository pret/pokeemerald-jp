.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start IsMirageTowerVisible
IsMirageTowerVisible: @ 0x081BE308
	push {lr}
	ldr r0, _081BE328
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xd0
	lsls r0, r0, #5
	cmp r1, r0
	bne _081BE32C
	movs r0, #0xa7
	lsls r0, r0, #1
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081BE32E
	.align 2, 0
_081BE328: .4byte 0x03005AEC
_081BE32C:
	movs r0, #0
_081BE32E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsMirageTowerVisible

	thumb_func_start UpdateMirageTowerPulseBlend
UpdateMirageTowerPulseBlend: @ 0x081BE334
	push {lr}
	ldr r0, _081BE344
	ldr r0, [r0]
	adds r0, #4
	bl UpdatePulseBlend
	pop {r0}
	bx r0
	.align 2, 0
_081BE344: .4byte 0x0203CBE4
	thumb_func_end UpdateMirageTowerPulseBlend

	thumb_func_start ClearMirageTowerPulseBlend
ClearMirageTowerPulseBlend: @ 0x081BE348
	ldr r1, _081BE350
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_081BE350: .4byte 0x0203CBE4
	thumb_func_end ClearMirageTowerPulseBlend

	thumb_func_start TryStartMirageTowerPulseBlendEffect
TryStartMirageTowerPulseBlendEffect: @ 0x081BE354
	push {r4, lr}
	ldr r4, _081BE364
	ldr r0, [r4]
	cmp r0, #0
	beq _081BE368
	movs r0, #0
	str r0, [r4]
	b _081BE3B4
	.align 2, 0
_081BE364: .4byte 0x0203CBE4
_081BE368:
	ldr r0, _081BE3BC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xd0
	lsls r0, r0, #5
	cmp r1, r0
	bne _081BE3B4
	movs r0, #0xa7
	lsls r0, r0, #1
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BE3B4
	movs r0, #0xc8
	bl AllocZeroed
	str r0, [r4]
	adds r0, #4
	bl InitPulseBlend
	ldr r0, [r4]
	adds r0, #4
	ldr r1, _081BE3C0
	bl InitPulseBlendPaletteSettings
	ldr r0, [r4]
	adds r0, #4
	movs r1, #1
	movs r2, #1
	bl MarkUsedPulseBlendPalettes
	ldr r0, _081BE3C4
	movs r1, #0xff
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1]
_081BE3B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BE3BC: .4byte 0x03005AEC
_081BE3C0: .4byte 0x085E7FD4
_081BE3C4: .4byte 0x081BE335
	thumb_func_end TryStartMirageTowerPulseBlendEffect

	thumb_func_start ClearMirageTowerPulseBlendEffect
ClearMirageTowerPulseBlendEffect: @ 0x081BE3C8
	push {r4, lr}
	ldr r0, _081BE42C
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xd0
	lsls r0, r0, #5
	cmp r1, r0
	bne _081BE424
	movs r0, #0xa7
	lsls r0, r0, #1
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BE424
	ldr r4, _081BE430
	ldr r0, [r4]
	cmp r0, #0
	beq _081BE424
	ldr r0, _081BE434
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BE402
	ldr r0, [r4]
	ldrb r0, [r0]
	bl DestroyTask
_081BE402:
	ldr r0, [r4]
	adds r0, #4
	movs r1, #1
	movs r2, #1
	bl UnmarkUsedPulseBlendPalettes
	ldr r0, [r4]
	adds r0, #4
	movs r1, #1
	movs r2, #1
	bl UnloadUsedPulseBlendPalettes
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
_081BE424:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BE42C: .4byte 0x03005AEC
_081BE430: .4byte 0x0203CBE4
_081BE434: .4byte 0x081BE335
	thumb_func_end ClearMirageTowerPulseBlendEffect

	thumb_func_start SetMirageTowerVisibility
SetMirageTowerVisibility: @ 0x081BE438
	push {r4, lr}
	ldr r0, _081BE450
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081BE454
	movs r0, #0xa7
	lsls r0, r0, #1
	bl FlagClear
	b _081BE48A
	.align 2, 0
_081BE450: .4byte 0x000040CB
_081BE454:
	bl Random
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #1
	ands r4, r0
	movs r0, #0x9d
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081BE470
	movs r4, #1
_081BE470:
	cmp r4, #0
	beq _081BE482
	movs r0, #0xa7
	lsls r0, r0, #1
	bl FlagSet
	bl TryStartMirageTowerPulseBlendEffect
	b _081BE48A
_081BE482:
	movs r0, #0xa7
	lsls r0, r0, #1
	bl FlagClear
_081BE48A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SetMirageTowerVisibility

	thumb_func_start StartPlayerDescendMirageTower
StartPlayerDescendMirageTower: @ 0x081BE490
	push {lr}
	ldr r0, _081BE4A0
	movs r1, #8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081BE4A0: .4byte 0x081BE4A5
	thumb_func_end StartPlayerDescendMirageTower

	thumb_func_start PlayerDescendMirageTower
PlayerDescendMirageTower: @ 0x081BE4A4
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081BE528
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r0, #0x2d
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r4, _081BE52C
	adds r2, r2, r4
	ldr r3, _081BE530
	ldrb r1, [r2, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x26]
	adds r1, #4
	strh r1, [r0, #0x26]
	ldr r0, _081BE534
	ldrb r0, [r0, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r2, [r2, #4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r4, #0x22
	ldrsh r2, [r0, r4]
	movs r4, #0x26
	ldrsh r0, [r0, r4]
	adds r2, r2, r0
	ldrb r1, [r1, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r3, #0x22
	ldrsh r1, [r0, r3]
	movs r4, #0x26
	ldrsh r0, [r0, r4]
	adds r1, r1, r0
	cmp r2, r1
	blt _081BE51E
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_081BE51E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081BE528: .4byte 0x03005AEC
_081BE52C: .4byte 0x02036FF0
_081BE530: .4byte 0x020205AC
_081BE534: .4byte 0x02037230
	thumb_func_end PlayerDescendMirageTower

	thumb_func_start StartScreenShake
StartScreenShake: @ 0x081BE538
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _081BE594
	movs r1, #9
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081BE598
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r4, [r1, #8]
	strh r0, [r1, #0xa]
	strh r5, [r1, #0xc]
	strh r6, [r1, #0xe]
	mov r0, r8
	strh r0, [r1, #0x10]
	movs r0, #0
	bl SetCameraPanningCallback
	movs r0, #0xd6
	bl PlaySE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BE594: .4byte 0x081BE59D
_081BE598: .4byte 0x03005B60
	thumb_func_end StartScreenShake

	thumb_func_start DoScreenShake
DoScreenShake: @ 0x081BE59C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081BE600
	adds r4, r0, r1
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r2, #6
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, #0
	bne _081BE5F8
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4]
	rsbs r0, r0, #0
	strh r0, [r4]
	ldrh r0, [r4, #8]
	rsbs r0, r0, #0
	strh r0, [r4, #8]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #8
	ldrsh r1, [r4, r2]
	bl SetCameraPanning
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081BE5F8
	bl IncrementCeilingCrumbleFinishedCount
	adds r0, r5, #0
	bl DestroyTask
	bl InstallCameraPanAheadCallback
_081BE5F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081BE600: .4byte 0x03005B68
	thumb_func_end DoScreenShake

	thumb_func_start IncrementCeilingCrumbleFinishedCount
IncrementCeilingCrumbleFinishedCount: @ 0x081BE604
	push {lr}
	ldr r0, _081BE628
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _081BE624
	ldr r0, _081BE62C
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_081BE624:
	pop {r0}
	bx r0
	.align 2, 0
_081BE628: .4byte 0x081BE65D
_081BE62C: .4byte 0x03005B60
	thumb_func_end IncrementCeilingCrumbleFinishedCount

	thumb_func_start DoMirageTowerCeilingCrumble
DoMirageTowerCeilingCrumble: @ 0x081BE630
	push {lr}
	ldr r0, _081BE654
	bl LoadSpriteSheets
	bl CreateCeilingCrumbleSprites
	ldr r0, _081BE658
	movs r1, #8
	bl CreateTask
	movs r0, #2
	movs r1, #1
	movs r2, #0x10
	movs r3, #3
	bl StartScreenShake
	pop {r0}
	bx r0
	.align 2, 0
_081BE654: .4byte 0x085E7F50
_081BE658: .4byte 0x081BE65D
	thumb_func_end DoMirageTowerCeilingCrumble

	thumb_func_start WaitCeilingCrumble
WaitCeilingCrumble: @ 0x081BE65C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r3, r1, #3
	ldr r4, _081BE694
	adds r2, r3, r4
	ldrh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	movs r1, #0xfa
	lsls r1, r1, #0x12
	cmp r0, r1
	beq _081BE682
	ldrh r0, [r2]
	cmp r0, #0x11
	bne _081BE68C
_081BE682:
	adds r0, r4, #0
	subs r0, #8
	adds r0, r3, r0
	ldr r1, _081BE698
	str r1, [r0]
_081BE68C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BE694: .4byte 0x03005B68
_081BE698: .4byte 0x081BE69D
	thumb_func_end WaitCeilingCrumble

	thumb_func_start FinishCeilingCrumbleTask
FinishCeilingCrumbleTask: @ 0x081BE69C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0xfa
	lsls r0, r0, #4
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FinishCeilingCrumbleTask

	thumb_func_start CreateCeilingCrumbleSprites
CreateCeilingCrumbleSprites: @ 0x081BE6BC
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r5, _081BE764
	adds r7, r5, #2
	ldr r6, _081BE768
_081BE6C6:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r1, r0, r5
	ldrh r1, [r1]
	adds r1, #0x78
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r7
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, _081BE76C
	movs r3, #8
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r2, [r0, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r2, r1
	movs r1, #0xf
	ands r2, r1
	strb r2, [r0, #5]
	strh r4, [r0, #0x2e]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _081BE6C6
	movs r4, #0
	ldr r5, _081BE764
	adds r7, r5, #2
	ldr r6, _081BE768
_081BE714:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r1, r0, r5
	ldrh r1, [r1]
	adds r1, #0x73
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r7
	ldrh r2, [r0]
	subs r2, #3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, _081BE770
	movs r3, #8
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r2, [r0, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r2, r1
	movs r1, #0xf
	ands r2, r1
	strb r2, [r0, #5]
	strh r4, [r0, #0x2e]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _081BE714
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BE764: .4byte 0x085E7F20
_081BE768: .4byte 0x020205AC
_081BE76C: .4byte 0x085E801C
_081BE770: .4byte 0x085E7FF0
	thumb_func_end CreateCeilingCrumbleSprites

	thumb_func_start MoveCeilingCrumbleSprite
MoveCeilingCrumbleSprite: @ 0x081BE774
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r0, #2
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x26]
	movs r0, #0x22
	ldrsh r3, [r4, r0]
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	adds r3, r3, r0
	ldr r2, _081BE7BC
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #4
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r3, r0
	ble _081BE7B6
	adds r0, r4, #0
	bl DestroySprite
	bl IncrementCeilingCrumbleFinishedCount
_081BE7B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BE7BC: .4byte 0x085E7F20
	thumb_func_end MoveCeilingCrumbleSprite

	thumb_func_start SetInvisibleMirageTowerMetatiles
SetInvisibleMirageTowerMetatiles: @ 0x081BE7C0
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _081BE7EC
_081BE7C6:
	lsls r2, r4, #2
	adds r2, r2, r5
	ldrb r0, [r2]
	adds r0, #7
	ldrb r1, [r2, #1]
	adds r1, #7
	ldrh r2, [r2, #2]
	bl MapGridSetMetatileIdAt
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x11
	bls _081BE7C6
	bl DrawWholeMapView
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081BE7EC: .4byte 0x085E7F60
	thumb_func_end SetInvisibleMirageTowerMetatiles

	thumb_func_start StartMirageTowerDisintegration
StartMirageTowerDisintegration: @ 0x081BE7F0
	push {lr}
	ldr r0, _081BE800
	movs r1, #9
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081BE800: .4byte 0x081BE9ED
	thumb_func_end StartMirageTowerDisintegration

	thumb_func_start StartMirageTowerFossilFallAndSink
StartMirageTowerFossilFallAndSink: @ 0x081BE804
	push {lr}
	ldr r0, _081BE814
	movs r1, #9
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081BE814: .4byte 0x081BE891
	thumb_func_end StartMirageTowerFossilFallAndSink

	thumb_func_start StartMirageTowerShake
StartMirageTowerShake: @ 0x081BE818
	push {lr}
	ldr r0, _081BE828
	movs r1, #9
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081BE828: .4byte 0x081BECC5
	thumb_func_end StartMirageTowerShake

	thumb_func_start SetBgShakeOffsets
SetBgShakeOffsets: @ 0x081BE82C
	push {r4, lr}
	ldr r4, _081BE84C
	ldr r0, [r4]
	ldrh r1, [r0]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #2]
	movs r0, #0x12
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BE84C: .4byte 0x0203CBE0
	thumb_func_end SetBgShakeOffsets

	thumb_func_start UpdateBgShake
UpdateBgShake: @ 0x081BE850
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081BE880
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, r1, r2
	ldrh r1, [r2, #8]
	movs r3, #8
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _081BE888
	ldr r0, _081BE884
	ldr r1, [r0]
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r1]
	movs r0, #2
	strh r0, [r2, #8]
	bl SetBgShakeOffsets
	b _081BE88C
	.align 2, 0
_081BE880: .4byte 0x03005B60
_081BE884: .4byte 0x0203CBE0
_081BE888:
	subs r0, r1, #1
	strh r0, [r2, #8]
_081BE88C:
	pop {r0}
	bx r0
	thumb_func_end UpdateBgShake

	thumb_func_start InitMirageTowerShake
InitMirageTowerShake: @ 0x081BE890
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _081BE8B8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #6
	bls _081BE8AC
	b _081BE9DC
_081BE8AC:
	lsls r0, r0, #2
	ldr r1, _081BE8BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BE8B8: .4byte 0x03005B60
_081BE8BC: .4byte 0x081BE8C0
_081BE8C0: @ jump table
	.4byte _081BE8DC @ case 0
	.4byte _081BE8EC @ case 1
	.4byte _081BE924 @ case 2
	.4byte _081BE94C @ case 3
	.4byte _081BE994 @ case 4
	.4byte _081BE99C @ case 5
	.4byte _081BE9B8 @ case 6
_081BE8DC:
	bl FreeAllWindowBuffers
	movs r0, #0
	movs r1, #7
	movs r2, #2
	bl SetBgAttribute
	b _081BE9A0
_081BE8EC:
	ldr r4, _081BE91C
	movs r0, #0x92
	lsls r0, r0, #4
	bl AllocZeroed
	str r0, [r4]
	ldr r4, _081BE920
	movs r0, #0x80
	lsls r0, r0, #4
	bl AllocZeroed
	str r0, [r4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	b _081BE974
	.align 2, 0
_081BE91C: .4byte 0x0203CBD0
_081BE920: .4byte 0x0203CBD4
_081BE924:
	ldr r0, _081BE944
	ldr r4, _081BE948
	ldr r1, [r4]
	movs r2, #0x92
	lsls r2, r2, #3
	bl CpuSet
	ldr r1, [r4]
	movs r2, #0x92
	lsls r2, r2, #4
	movs r0, #0
	movs r3, #0
	bl LoadBgTiles
	b _081BE974
	.align 2, 0
_081BE944: .4byte 0x085E7430
_081BE948: .4byte 0x0203CBD0
_081BE94C:
	ldr r0, _081BE988
	ldr r1, [r0]
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, _081BE98C
	movs r0, #6
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r2, #0xc
	movs r3, #0x1d
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #0
	bl CopyBgTilemapBufferToVram
_081BE974:
	ldr r1, _081BE990
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _081BE9DC
	.align 2, 0
_081BE988: .4byte 0x0203CBD4
_081BE98C: .4byte 0x085E7D50
_081BE990: .4byte 0x03005B60
_081BE994:
	movs r0, #0
	bl ShowBg
	b _081BE9A0
_081BE99C:
	bl SetInvisibleMirageTowerMetatiles
_081BE9A0:
	ldr r0, _081BE9B4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _081BE9DC
	.align 2, 0
_081BE9B4: .4byte 0x03005B60
_081BE9B8:
	ldr r4, _081BE9E4
	movs r0, #4
	bl Alloc
	str r0, [r4]
	movs r2, #0
	movs r1, #2
	strh r1, [r0]
	strh r2, [r0, #2]
	ldr r0, _081BE9E8
	movs r1, #0xa
	bl CreateTask
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_081BE9DC:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081BE9E4: .4byte 0x0203CBE0
_081BE9E8: .4byte 0x081BE851
	thumb_func_end InitMirageTowerShake

	thumb_func_start DoMirageTowerDisintegration
DoMirageTowerDisintegration: @ 0x081BE9EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r1, _081BEA24
	lsls r0, r0, #2
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r6, r1, #0
	cmp r0, #7
	bls _081BEA18
	b _081BEC9E
_081BEA18:
	lsls r0, r0, #2
	ldr r1, _081BEA28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BEA24: .4byte 0x03005B60
_081BEA28: .4byte 0x081BEA2C
_081BEA2C: @ jump table
	.4byte _081BEA4C @ case 0
	.4byte _081BEC9E @ case 1
	.4byte _081BEA60 @ case 2
	.4byte _081BEC00 @ case 3
	.4byte _081BEC30 @ case 4
	.4byte _081BEC6C @ case 5
	.4byte _081BEC8C @ case 6
	.4byte _081BEC94 @ case 7
_081BEA4C:
	ldr r4, _081BEA5C
	movs r0, #0xc0
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r4]
	b _081BEC9E
	.align 2, 0
_081BEA5C: .4byte 0x0203CBDC
_081BEA60:
	mov r1, sl
	lsls r0, r1, #2
	adds r1, r0, r1
	lsls r1, r1, #3
	adds r2, r1, r6
	ldrh r3, [r2, #0xe]
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	str r0, [sp, #8]
	cmp r1, #0x5f
	bgt _081BEB26
	movs r1, #0xa
	ldrsh r0, [r2, r1]
	cmp r0, #1
	ble _081BEB18
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x30
	bl Alloc
	ldr r3, _081BEBF0
	ldr r1, [r3]
	lsls r2, r4, #3
	adds r1, r2, r1
	str r0, [r1]
	movs r5, #0
	adds r4, r2, #0
_081BEA96:
	ldr r0, [r3]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r5
	strb r5, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x2f
	bls _081BEA96
	movs r5, #0
	ldr r7, _081BEBF0
	adds r6, r2, #0
_081BEAB0:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x30
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x30
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [r7]
	adds r1, r6, r1
	ldr r1, [r1]
	adds r0, r1, r0
	ldrb r2, [r0]
	adds r1, r1, r4
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x2f
	bls _081BEAB0
	ldr r0, _081BEBF4
	ldr r1, [sp, #8]
	add r1, sl
	lsls r1, r1, #3
	adds r2, r1, r0
	ldrh r3, [r2, #0xe]
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	adds r6, r0, #0
	cmp r1, #0x5f
	bgt _081BEB14
	adds r0, r3, #1
	strh r0, [r2, #0xe]
_081BEB14:
	movs r0, #0
	strh r0, [r2, #0xa]
_081BEB18:
	ldr r1, [sp, #8]
	add r1, sl
	lsls r1, r1, #3
	adds r1, r1, r6
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
_081BEB26:
	ldr r0, [sp, #8]
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrb r4, [r0, #0xe]
	ldrb r5, [r0, #0xc]
	lsls r0, r4, #0x10
	cmp r5, r4
	bhs _081BEBCE
	str r0, [sp, #0xc]
_081BEB3A:
	movs r6, #0
	adds r0, r5, #1
	str r0, [sp, #4]
	lsls r4, r5, #3
	movs r2, #0x5f
	subs r1, r2, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	mov sb, r0
_081BEB4E:
	ldr r0, _081BEBF8
	ldr r0, [r0]
	ldr r7, _081BEBF0
	ldr r3, [r7]
	adds r3, r4, r3
	ldrb r2, [r3, #4]
	adds r1, r2, #1
	strb r1, [r3, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, [r3]
	adds r1, r1, r2
	ldrb r1, [r1]
	add r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #1
	mov r8, r2
	str r2, [sp]
	movs r2, #0
	movs r3, #0x30
	bl CB2_InitBerryFixProgram
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _081BEB4E
	ldr r0, [r7]
	adds r1, r4, r0
	ldrb r0, [r1, #4]
	cmp r0, #0x2f
	bls _081BEBC0
	ldr r0, [r1]
	bl Free
	ldr r0, [r7]
	adds r0, r4, r0
	movs r1, #0
	str r1, [r0]
	ldr r1, [sp, #8]
	add r1, sl
	lsls r1, r1, #3
	ldr r4, _081BEBF4
	adds r1, r1, r4
	ldrh r0, [r1, #0xc]
	adds r0, #1
	strh r0, [r1, #0xc]
	mov r0, r8
	ands r5, r0
	cmp r5, #1
	bne _081BEBC0
	ldr r0, _081BEBFC
	ldr r1, [r0]
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r1, #2]
_081BEBC0:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0xc]
	lsrs r0, r2, #0x10
	cmp r5, r0
	blo _081BEB3A
_081BEBCE:
	ldr r0, _081BEBF8
	ldr r1, [r0]
	movs r2, #0x92
	lsls r2, r2, #4
	movs r0, #0
	movs r3, #0
	bl LoadBgTiles
	ldr r0, _081BEBF0
	ldr r0, [r0]
	movs r4, #0xbe
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r0, [r0, #4]
	cmp r0, #0x2f
	bhi _081BEC9E
	b _081BECB0
	.align 2, 0
_081BEBF0: .4byte 0x0203CBDC
_081BEBF4: .4byte 0x03005B60
_081BEBF8: .4byte 0x0203CBD0
_081BEBFC: .4byte 0x0203CBE0
_081BEC00:
	movs r0, #0
	bl UnsetBgTilemapBuffer
	ldr r0, _081BEC28
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _081BEC18
	bl DestroyTask
_081BEC18:
	ldr r0, _081BEC2C
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	bl SetBgShakeOffsets
	b _081BEC9E
	.align 2, 0
_081BEC28: .4byte 0x081BE851
_081BEC2C: .4byte 0x0203CBE0
_081BEC30:
	ldr r4, _081BEC5C
	ldr r0, [r4]
	bl Free
	movs r5, #0
	str r5, [r4]
	ldr r4, _081BEC60
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _081BEC64
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _081BEC68
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	b _081BEC9E
	.align 2, 0
_081BEC5C: .4byte 0x0203CBE0
_081BEC60: .4byte 0x0203CBDC
_081BEC64: .4byte 0x0203CBD0
_081BEC68: .4byte 0x0203CBD4
_081BEC6C:
	movs r0, #0xc
	movs r1, #2
	bl SetGpuRegBits
	movs r0, #8
	movs r1, #0
	bl SetGpuRegBits
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl SetBgAttribute
	bl InitStandardTextBoxWindows
	b _081BEC9E
_081BEC8C:
	movs r0, #0
	bl ShowBg
	b _081BEC9E
_081BEC94:
	mov r0, sl
	bl DestroyTask
	bl EnableBothScriptContexts
_081BEC9E:
	ldr r0, _081BECC0
	mov r2, sl
	lsls r1, r2, #2
	add r1, sl
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_081BECB0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BECC0: .4byte 0x03005B60
	thumb_func_end DoMirageTowerDisintegration

	thumb_func_start DoFossilFallAndSink
DoFossilFallAndSink: @ 0x081BECC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _081BECF4
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bls _081BECE8
	b _081BEEC4
_081BECE8:
	lsls r0, r0, #2
	ldr r1, _081BECF8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BECF4: .4byte 0x03005B60
_081BECF8: .4byte 0x081BECFC
_081BECFC: @ jump table
	.4byte _081BED1C @ case 0
	.4byte _081BED50 @ case 1
	.4byte _081BED78 @ case 2
	.4byte _081BED8C @ case 3
	.4byte _081BEDE4 @ case 4
	.4byte _081BEE0C @ case 5
	.4byte _081BEE68 @ case 6
	.4byte _081BEEC0 @ case 7
_081BED1C:
	ldr r4, _081BED4C
	movs r0, #0x14
	bl AllocZeroed
	str r0, [r4]
	movs r0, #0x80
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1]
	movs r0, #8
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0xc]
	movs r0, #0
	strh r0, [r1, #0x10]
	b _081BEEC4
	.align 2, 0
_081BED4C: .4byte 0x0203CBD8
_081BED50:
	ldr r0, _081BED70
	ldr r0, [r0]
	ldr r1, [r0]
	movs r5, #0
	ldr r2, _081BED74
_081BED5A:
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r1, #1
	cmp r5, #0x7f
	bls _081BED5A
	b _081BEEC4
	.align 2, 0
_081BED70: .4byte 0x0203CBD8
_081BED74: .4byte 0x085E7E00
_081BED78:
	ldr r0, _081BED88
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #0x80
	strh r0, [r1, #4]
	b _081BEEC4
	.align 2, 0
_081BED88: .4byte 0x0203CBD8
_081BED8C:
	mov r1, sp
	ldr r0, _081BEE00
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r4, _081BEE04
	ldr r0, [r4]
	ldr r0, [r0, #4]
	str r0, [sp, #0xc]
	movs r2, #0x10
	rsbs r2, r2, #0
	mov r0, sp
	movs r1, #0x80
	movs r3, #1
	bl CreateSprite
	ldr r1, [r4]
	movs r3, #0
	strb r0, [r1, #8]
	ldr r2, _081BEE08
	ldr r0, [r4]
	ldrb r1, [r0, #8]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x28
	strb r3, [r0]
	ldr r3, [r4]
	ldrb r1, [r3, #8]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	strh r1, [r0, #0x2e]
	ldrb r1, [r3, #8]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0, #0x30]
_081BEDE4:
	movs r5, #0
	ldr r2, _081BEE04
_081BEDE8:
	ldr r0, [r2]
	ldr r1, [r0, #0xc]
	lsls r0, r5, #1
	adds r0, r0, r1
	strh r5, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xff
	bls _081BEDE8
	b _081BEEC4
	.align 2, 0
_081BEE00: .4byte 0x085E7FBC
_081BEE04: .4byte 0x0203CBD8
_081BEE08: .4byte 0x020205AC
_081BEE0C:
	movs r5, #0
	movs r6, #0xff
	ldr r0, _081BEE58
	mov r8, r0
_081BEE14:
	bl Random
	adds r4, r6, #0
	ands r4, r0
	bl Random
	adds r1, r6, #0
	ands r1, r0
	ldr r0, _081BEE5C
	ldr r3, [r0]
	ldr r0, [r3, #0xc]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r2, [r1]
	lsls r4, r4, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	strh r0, [r1]
	strh r2, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r8
	bls _081BEE14
	ldr r2, _081BEE60
	ldrb r1, [r3, #8]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _081BEE64
	str r1, [r0]
	b _081BEEC4
	.align 2, 0
_081BEE58: .4byte 0x000001FF
_081BEE5C: .4byte 0x0203CBD8
_081BEE60: .4byte 0x020205AC
_081BEE64: .4byte 0x081BEEE5
_081BEE68:
	ldr r3, _081BEEB4
	ldr r5, _081BEEB8
	ldr r0, [r5]
	ldrb r1, [r0, #8]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r2, r0, #2
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _081BEEBC
	cmp r1, r0
	bne _081BEED4
	adds r0, r2, r3
	bl DestroySprite
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Free
	ldr r0, [r5]
	movs r4, #0
	str r4, [r0, #0xc]
	ldr r0, [r0, #4]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #4]
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	str r4, [r0]
	bl Free
	str r4, [r5]
	b _081BEEC4
	.align 2, 0
_081BEEB4: .4byte 0x020205AC
_081BEEB8: .4byte 0x0203CBD8
_081BEEBC: .4byte 0x08007141
_081BEEC0:
	bl EnableBothScriptContexts
_081BEEC4:
	ldr r0, _081BEEE0
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_081BEED4:
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BEEE0: .4byte 0x03005B60
	thumb_func_end DoFossilFallAndSink

