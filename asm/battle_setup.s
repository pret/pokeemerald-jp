.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Task_BattleStart
Task_BattleStart: @ 0x080AFEEC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AFF0C
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080AFF10
	cmp r0, #1
	beq _080AFF2A
	b _080AFF4E
	.align 2, 0
_080AFF0C: .4byte 0x03005B68
_080AFF10:
	bl sub_080FB730
	cmp r0, #0
	bne _080AFF4E
	ldrb r0, [r4, #2]
	bl BattleTransition_StartOnField
	bl ClearMirageTowerPulseBlendEffect
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080AFF4E
_080AFF2A:
	bl IsBattleTransitionDone
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080AFF4E
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _080AFF54
	bl SetMainCallback2
	bl RestartWildEncounterImmunitySteps
	bl ClearPoisonStepCounter
	adds r0, r5, #0
	bl DestroyTask
_080AFF4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AFF54: .4byte 0x080365B5
	thumb_func_end Task_BattleStart

	thumb_func_start CreateBattleStartTask
CreateBattleStartTask: @ 0x080AFF58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080AFF8C
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080AFF90
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xa]
	adds r0, r5, #0
	bl PlayMapChosenOrBattleBGM
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AFF8C: .4byte 0x080AFEED
_080AFF90: .4byte 0x03005B60
	thumb_func_end CreateBattleStartTask

	thumb_func_start BattleSetup_StartWildBattle
BattleSetup_StartWildBattle: @ 0x080AFF94
	push {lr}
	bl GetSafariZoneFlag
	cmp r0, #0
	beq _080AFFA4
	bl DoSafariBattle
	b _080AFFA8
_080AFFA4:
	bl DoStandardWildBattle
_080AFFA8:
	pop {r0}
	bx r0
	thumb_func_end BattleSetup_StartWildBattle

	thumb_func_start BattleSetup_StartBattlePikeWildBattle
BattleSetup_StartBattlePikeWildBattle: @ 0x080AFFAC
	push {lr}
	bl DoBattlePikeWildBattle
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleSetup_StartBattlePikeWildBattle

	thumb_func_start DoStandardWildBattle
DoStandardWildBattle: @ 0x080AFFB8
	push {r4, lr}
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	bl sub_0808B658
	ldr r1, _080B0018
	ldr r0, _080B001C
	str r0, [r1, #8]
	ldr r4, _080B0020
	movs r0, #0
	str r0, [r4]
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AFFEE
	ldr r0, _080B0024
	movs r1, #0
	bl VarSet
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4]
_080AFFEE:
	bl GetWildBattleTransition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl CreateBattleStartTask
	movs r0, #7
	bl IncrementGameStat
	movs r0, #8
	bl IncrementGameStat
	bl sub_080EF7CC
	bl sub_080B0B04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0018: .4byte 0x03002360
_080B001C: .4byte 0x080B03F5
_080B0020: .4byte 0x02022C90
_080B0024: .4byte 0x0000400E
	thumb_func_end DoStandardWildBattle

	thumb_func_start BattleSetup_StartRoamerBattle
BattleSetup_StartRoamerBattle: @ 0x080B0028
	push {lr}
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	bl sub_0808B658
	ldr r1, _080B006C
	ldr r0, _080B0070
	str r0, [r1, #8]
	ldr r1, _080B0074
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl CreateBattleStartTask
	movs r0, #7
	bl IncrementGameStat
	movs r0, #8
	bl IncrementGameStat
	bl sub_080EF7CC
	bl sub_080B0B04
	pop {r0}
	bx r0
	.align 2, 0
_080B006C: .4byte 0x03002360
_080B0070: .4byte 0x080B03F5
_080B0074: .4byte 0x02022C90
	thumb_func_end BattleSetup_StartRoamerBattle

	thumb_func_start DoSafariBattle
DoSafariBattle: @ 0x080B0078
	push {lr}
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	bl sub_0808B658
	ldr r1, _080B00A4
	ldr r0, _080B00A8
	str r0, [r1, #8]
	ldr r1, _080B00AC
	movs r0, #0x80
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl CreateBattleStartTask
	pop {r0}
	bx r0
	.align 2, 0
_080B00A4: .4byte 0x03002360
_080B00A8: .4byte 0x080FCA01
_080B00AC: .4byte 0x02022C90
	thumb_func_end DoSafariBattle

	thumb_func_start DoBattlePikeWildBattle
DoBattlePikeWildBattle: @ 0x080B00B0
	push {lr}
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	bl sub_0808B658
	ldr r1, _080B00F4
	ldr r0, _080B00F8
	str r0, [r1, #8]
	ldr r1, _080B00FC
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl CreateBattleStartTask
	movs r0, #7
	bl IncrementGameStat
	movs r0, #8
	bl IncrementGameStat
	bl sub_080EF7CC
	bl sub_080B0B04
	pop {r0}
	bx r0
	.align 2, 0
_080B00F4: .4byte 0x03002360
_080B00F8: .4byte 0x080B03F5
_080B00FC: .4byte 0x02022C90
	thumb_func_end DoBattlePikeWildBattle

	thumb_func_start DoTrainerBattle
DoTrainerBattle: @ 0x080B0100
	push {lr}
	bl GetTrainerBattleTransition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl CreateBattleStartTask
	movs r0, #7
	bl IncrementGameStat
	movs r0, #9
	bl IncrementGameStat
	bl sub_080B0B20
	pop {r0}
	bx r0
	thumb_func_end DoTrainerBattle

	thumb_func_start sub_080B0124
sub_080B0124: @ 0x080B0124
	push {lr}
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0142
	movs r0, #0xa
	bl sub_080B08F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl CreateBattleStartTask
	b _080B0152
_080B0142:
	movs r0, #0xb
	bl sub_080B08F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl CreateBattleStartTask
_080B0152:
	movs r0, #7
	bl IncrementGameStat
	movs r0, #9
	bl IncrementGameStat
	bl sub_080B0B20
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B0124

	thumb_func_start StartWallyTutorialBattle
StartWallyTutorialBattle: @ 0x080B0168
	push {lr}
	ldr r0, _080B0194
	movs r1, #0xc4
	lsls r1, r1, #1
	movs r2, #5
	bl CreateMaleMon
	bl ScriptContext2_Enable
	ldr r1, _080B0198
	ldr r0, _080B019C
	str r0, [r1, #8]
	ldr r1, _080B01A0
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r1]
	movs r0, #8
	movs r1, #0
	bl CreateBattleStartTask
	pop {r0}
	bx r0
	.align 2, 0
_080B0194: .4byte 0x020243E8
_080B0198: .4byte 0x03002360
_080B019C: .4byte 0x08085B35
_080B01A0: .4byte 0x02022C90
	thumb_func_end StartWallyTutorialBattle

	thumb_func_start BattleSetup_StartScriptedWildBattle
BattleSetup_StartScriptedWildBattle: @ 0x080B01A4
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _080B01DC
	ldr r0, _080B01E0
	str r0, [r1, #8]
	ldr r1, _080B01E4
	movs r0, #0
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl CreateBattleStartTask
	movs r0, #7
	bl IncrementGameStat
	movs r0, #8
	bl IncrementGameStat
	bl sub_080EF7CC
	bl sub_080B0B04
	pop {r0}
	bx r0
	.align 2, 0
_080B01DC: .4byte 0x03002360
_080B01E0: .4byte 0x080B0469
_080B01E4: .4byte 0x02022C90
	thumb_func_end BattleSetup_StartScriptedWildBattle

	thumb_func_start BattleSetup_StartLatiBattle
BattleSetup_StartLatiBattle: @ 0x080B01E8
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _080B0224
	ldr r0, _080B0228
	str r0, [r1, #8]
	ldr r1, _080B022C
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl CreateBattleStartTask
	movs r0, #7
	bl IncrementGameStat
	movs r0, #8
	bl IncrementGameStat
	bl sub_080EF7CC
	bl sub_080B0B04
	pop {r0}
	bx r0
	.align 2, 0
_080B0224: .4byte 0x03002360
_080B0228: .4byte 0x080B0469
_080B022C: .4byte 0x02022C90
	thumb_func_end BattleSetup_StartLatiBattle

	thumb_func_start BattleSetup_StartLegendaryBattle
BattleSetup_StartLegendaryBattle: @ 0x080B0230
	push {r4, lr}
	bl ScriptContext2_Enable
	ldr r1, _080B0270
	ldr r0, _080B0274
	str r0, [r1, #8]
	ldr r4, _080B0278
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4]
	ldr r0, _080B027C
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	movs r0, #0xca
	lsls r0, r0, #1
	cmp r1, r0
	beq _080B02B4
	cmp r1, r0
	bhi _080B0284
	cmp r1, #0x97
	beq _080B02F0
	cmp r1, #0x97
	blo _080B0296
	cmp r1, #0xfa
	bhi _080B0296
	cmp r1, #0xf9
	blo _080B0296
	ldr r1, _080B0280
	b _080B02E2
	.align 2, 0
_080B0270: .4byte 0x03002360
_080B0274: .4byte 0x080B0469
_080B0278: .4byte 0x02022C90
_080B027C: .4byte 0x020243E8
_080B0280: .4byte 0x00000229
_080B0284:
	movs r0, #0xcb
	lsls r0, r0, #1
	cmp r1, r0
	beq _080B02CA
	cmp r1, r0
	blo _080B0296
	adds r0, #4
	cmp r1, r0
	beq _080B02E0
_080B0296:
	ldr r2, _080B02B0
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x15
	orrs r0, r1
	str r0, [r2]
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r0, #0x17
	bl CreateBattleStartTask
	b _080B02FA
	.align 2, 0
_080B02B0: .4byte 0x02022C90
_080B02B4:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r0, #0x16
	bl CreateBattleStartTask
	b _080B02FA
_080B02CA:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r4]
	movs r1, #0xeb
	lsls r1, r1, #1
	movs r0, #0x18
	bl CreateBattleStartTask
	b _080B02FA
_080B02E0:
	ldr r1, _080B02EC
_080B02E2:
	movs r0, #0
	bl CreateBattleStartTask
	b _080B02FA
	.align 2, 0
_080B02EC: .4byte 0x00000227
_080B02F0:
	movs r1, #0xec
	lsls r1, r1, #1
	movs r0, #0xa
	bl CreateBattleStartTask
_080B02FA:
	movs r0, #7
	bl IncrementGameStat
	movs r0, #8
	bl IncrementGameStat
	bl sub_080EF7CC
	bl sub_080B0B04
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleSetup_StartLegendaryBattle

	thumb_func_start StartGroudonKyogreBattle
StartGroudonKyogreBattle: @ 0x080B0314
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _080B033C
	ldr r0, _080B0340
	str r0, [r1, #8]
	ldr r1, _080B0344
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [r1]
	ldr r0, _080B0348
	ldrb r0, [r0]
	cmp r0, #2
	bne _080B034C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r0, #0xb
	bl CreateBattleStartTask
	b _080B0356
	.align 2, 0
_080B033C: .4byte 0x03002360
_080B0340: .4byte 0x080B0469
_080B0344: .4byte 0x02022C90
_080B0348: .4byte 0x0829BDA4
_080B034C:
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r0, #6
	bl CreateBattleStartTask
_080B0356:
	movs r0, #7
	bl IncrementGameStat
	movs r0, #8
	bl IncrementGameStat
	bl sub_080EF7CC
	bl sub_080B0B04
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StartGroudonKyogreBattle

	thumb_func_start StartRegiBattle
StartRegiBattle: @ 0x080B0370
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _080B03A8
	ldr r0, _080B03AC
	str r0, [r1, #8]
	ldr r1, _080B03B0
	movs r0, #0xc0
	lsls r0, r0, #7
	str r0, [r1]
	ldr r0, _080B03B4
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	movs r0, #0xc9
	lsls r0, r0, #1
	cmp r1, r0
	beq _080B03C8
	cmp r1, r0
	bgt _080B03B8
	subs r0, #1
	cmp r1, r0
	beq _080B03C4
	b _080B03D0
	.align 2, 0
_080B03A8: .4byte 0x03002360
_080B03AC: .4byte 0x080B0469
_080B03B0: .4byte 0x02022C90
_080B03B4: .4byte 0x020243E8
_080B03B8:
	ldr r0, _080B03C0
	cmp r2, r0
	beq _080B03CC
	b _080B03D0
	.align 2, 0
_080B03C0: .4byte 0x00000193
_080B03C4:
	movs r0, #0x15
	b _080B03D2
_080B03C8:
	movs r0, #0x13
	b _080B03D2
_080B03CC:
	movs r0, #0x14
	b _080B03D2
_080B03D0:
	movs r0, #0xa
_080B03D2:
	ldr r1, _080B03F0
	bl CreateBattleStartTask
	movs r0, #7
	bl IncrementGameStat
	movs r0, #8
	bl IncrementGameStat
	bl sub_080EF7CC
	bl sub_080B0B04
	pop {r0}
	bx r0
	.align 2, 0
_080B03F0: .4byte 0x000001DF
	thumb_func_end StartRegiBattle

	thumb_func_start CB2_EndWildBattle
CB2_EndWildBattle: @ 0x080B03F4
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _080B043C
	mov r0, sp
	bl CpuSet
	movs r0, #0
	movs r1, #0x80
	bl ResetOamRange
	ldr r0, _080B0440
	ldrb r0, [r0]
	bl IsPlayerDefeated
	cmp r0, #1
	bne _080B0448
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B0448
	bl InBattlePike
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B0448
	ldr r0, _080B0444
	bl SetMainCallback2
	b _080B0454
	.align 2, 0
_080B043C: .4byte 0x01000100
_080B0440: .4byte 0x02023FDE
_080B0444: .4byte 0x080858C1
_080B0448:
	ldr r0, _080B045C
	bl SetMainCallback2
	ldr r1, _080B0460
	ldr r0, _080B0464
	str r0, [r1]
_080B0454:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B045C: .4byte 0x08085A31
_080B0460: .4byte 0x03005B0C
_080B0464: .4byte 0x080AEFED
	thumb_func_end CB2_EndWildBattle

	thumb_func_start CB2_EndScriptedWildBattle
CB2_EndScriptedWildBattle: @ 0x080B0468
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _080B04A4
	mov r0, sp
	bl CpuSet
	movs r0, #0
	movs r1, #0x80
	bl ResetOamRange
	ldr r0, _080B04A8
	ldrb r0, [r0]
	bl IsPlayerDefeated
	cmp r0, #1
	bne _080B04BC
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B04B0
	ldr r0, _080B04AC
	bl SetMainCallback2
	b _080B04C2
	.align 2, 0
_080B04A4: .4byte 0x01000100
_080B04A8: .4byte 0x02023FDE
_080B04AC: .4byte 0x08085B35
_080B04B0:
	ldr r0, _080B04B8
	bl SetMainCallback2
	b _080B04C2
	.align 2, 0
_080B04B8: .4byte 0x080858C1
_080B04BC:
	ldr r0, _080B04C8
	bl SetMainCallback2
_080B04C2:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B04C8: .4byte 0x08085B35
	thumb_func_end CB2_EndScriptedWildBattle

	thumb_func_start BattleSetup_GetTerrainId
BattleSetup_GetTerrainId: @ 0x080B04CC
	push {r4, r5, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsTallGrass
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0502
	movs r0, #0
	b _080B0616
_080B0502:
	adds r0, r4, #0
	bl MetatileBehavior_IsLongGrass_Duplicate
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0512
	movs r0, #1
	b _080B0616
_080B0512:
	adds r0, r4, #0
	bl MetatileBehavior_IsSandOrDeepSand
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B0614
	ldr r0, _080B0534
	ldrb r0, [r0, #0x17]
	subs r0, #1
	cmp r0, #8
	bhi _080B0598
	lsls r0, r0, #2
	ldr r1, _080B0538
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B0534: .4byte 0x02036FB8
_080B0538: .4byte 0x080B053C
_080B053C: @ jump table
	.4byte _080B0598 @ case 0
	.4byte _080B0598 @ case 1
	.4byte _080B0598 @ case 2
	.4byte _080B0560 @ case 3
	.4byte _080B0584 @ case 4
	.4byte _080B0588 @ case 5
	.4byte _080B0598 @ case 6
	.4byte _080B0570 @ case 7
	.4byte _080B0570 @ case 8
_080B0560:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsIndoorEncounter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0574
_080B0570:
	movs r0, #8
	b _080B0616
_080B0574:
	adds r0, r4, #0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B05DC
	movs r0, #7
	b _080B0616
_080B0584:
	movs r0, #3
	b _080B0616
_080B0588:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B05EE
	b _080B060C
_080B0598:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsDeepOrOceanWater
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B05EE
	adds r0, r4, #0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B05DC
	adds r0, r4, #0
	bl MetatileBehavior_IsMountain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B05C4
	movs r0, #6
	b _080B0616
_080B05C4:
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B05F2
	adds r0, r4, #0
	bl MetatileBehavior_GetBridgeType
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B05E0
_080B05DC:
	movs r0, #5
	b _080B0616
_080B05E0:
	adds r0, r4, #0
	bl MetatileBehavior_IsBridge
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B05F2
_080B05EE:
	movs r0, #4
	b _080B0616
_080B05F2:
	ldr r0, _080B0610
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xe0
	lsls r0, r0, #5
	cmp r1, r0
	beq _080B0614
	bl GetSav1Weather
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	beq _080B0614
_080B060C:
	movs r0, #9
	b _080B0616
	.align 2, 0
_080B0610: .4byte 0x03005AEC
_080B0614:
	movs r0, #2
_080B0616:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end BattleSetup_GetTerrainId

	thumb_func_start GetBattleTransitionTypeByMap
GetBattleTransitionTypeByMap: @ 0x080B0620
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl Overworld_GetFlashLevel
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0650
	movs r0, #2
	b _080B067A
_080B0650:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B0678
	ldr r0, _080B0670
	ldrb r0, [r0, #0x17]
	cmp r0, #4
	beq _080B0674
	cmp r0, #5
	beq _080B0678
	movs r0, #0
	b _080B067A
	.align 2, 0
_080B0670: .4byte 0x02036FB8
_080B0674:
	movs r0, #1
	b _080B067A
_080B0678:
	movs r0, #3
_080B067A:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattleTransitionTypeByMap

	thumb_func_start GetSumOfPlayerPartyLevel
GetSumOfPlayerPartyLevel: @ 0x080B0684
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r7, #0
	movs r6, #0
_080B068E:
	movs r0, #0x64
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, _080B06E0
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	adds r1, r0, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	beq _080B06D2
	cmp r1, #0
	beq _080B06D2
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080B06D2
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _080B06D8
_080B06D2:
	adds r6, #1
	cmp r6, #5
	ble _080B068E
_080B06D8:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B06E0: .4byte 0x02024190
	thumb_func_end GetSumOfPlayerPartyLevel

	thumb_func_start GetSumOfEnemyPartyLevel
GetSumOfEnemyPartyLevel: @ 0x080B06E4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r5, _080B070C
	lsrs r2, r0, #0xb
	adds r4, r2, r5
	ldrb r0, [r4, #0x18]
	cmp r0, r1
	bhs _080B06FA
	adds r1, r0, #0
_080B06FA:
	movs r3, #0
	ldrb r0, [r4]
	cmp r0, #1
	beq _080B0740
	cmp r0, #1
	bgt _080B0710
	cmp r0, #0
	beq _080B071A
	b _080B07B0
	.align 2, 0
_080B070C: .4byte 0x082E383C
_080B0710:
	cmp r0, #2
	beq _080B0766
	cmp r0, #3
	beq _080B078C
	b _080B07B0
_080B071A:
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r4, [r0]
	movs r2, #0
	cmp r3, r1
	bhs _080B07B0
_080B0728:
	lsls r0, r2, #3
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	adds r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	blo _080B0728
	b _080B07B0
_080B0740:
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r4, [r0]
	movs r2, #0
	cmp r3, r1
	bhs _080B07B0
_080B074E:
	lsls r0, r2, #4
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	adds r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	blo _080B074E
	b _080B07B0
_080B0766:
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r4, [r0]
	movs r2, #0
	cmp r3, r1
	bhs _080B07B0
_080B0774:
	lsls r0, r2, #3
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	adds r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	blo _080B0774
	b _080B07B0
_080B078C:
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r4, [r0]
	movs r2, #0
	cmp r3, r1
	bhs _080B07B0
_080B079A:
	lsls r0, r2, #4
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	adds r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	blo _080B079A
_080B07B0:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetSumOfEnemyPartyLevel

	thumb_func_start GetWildBattleTransition
GetWildBattleTransition: @ 0x080B07B8
	push {r4, r5, r6, lr}
	bl GetBattleTransitionTypeByMap
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	ldr r0, _080B07F0
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl GetSumOfPlayerPartyLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bhs _080B0800
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B07F4
	movs r0, #0
	b _080B081E
	.align 2, 0
_080B07F0: .4byte 0x020243E8
_080B07F4:
	ldr r0, _080B07FC
	lsls r1, r5, #1
	b _080B0810
	.align 2, 0
_080B07FC: .4byte 0x0852AB24
_080B0800:
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B081C
	ldr r0, _080B0818
	lsls r1, r6, #1
	adds r0, #1
_080B0810:
	adds r1, r1, r0
	ldrb r0, [r1]
	b _080B081E
	.align 2, 0
_080B0818: .4byte 0x0852AB24
_080B081C:
	movs r0, #0xa
_080B081E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetWildBattleTransition

	thumb_func_start GetTrainerBattleTransition
GetTrainerBattleTransition: @ 0x080B0824
	push {r4, r5, r6, lr}
	ldr r4, _080B084C
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _080B0884
	ldr r1, _080B0850
	ldrh r2, [r4]
	lsls r0, r2, #5
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	cmp r1, #0x1f
	bne _080B0880
	adds r1, r2, #0
	ldr r0, _080B0854
	cmp r1, r0
	bne _080B0858
	movs r0, #0xc
	b _080B08EC
	.align 2, 0
_080B084C: .4byte 0x0203886A
_080B0850: .4byte 0x082E383C
_080B0854: .4byte 0x00000105
_080B0858:
	movs r0, #0x83
	lsls r0, r0, #1
	cmp r1, r0
	bne _080B0864
	movs r0, #0xd
	b _080B08EC
_080B0864:
	ldr r0, _080B0870
	cmp r1, r0
	bne _080B0874
	movs r0, #0xe
	b _080B08EC
	.align 2, 0
_080B0870: .4byte 0x00000107
_080B0874:
	movs r0, #0x84
	lsls r0, r0, #1
	cmp r1, r0
	bne _080B0884
	movs r0, #0xf
	b _080B08EC
_080B0880:
	cmp r1, #0x26
	bne _080B0888
_080B0884:
	movs r0, #0x10
	b _080B08EC
_080B0888:
	cmp r1, #9
	beq _080B0894
	cmp r1, #0x35
	beq _080B0894
	cmp r1, #0x31
	bne _080B0898
_080B0894:
	movs r0, #0x12
	b _080B08EC
_080B0898:
	cmp r1, #3
	beq _080B08A4
	cmp r1, #0xd
	beq _080B08A4
	cmp r1, #0xb
	bne _080B08A8
_080B08A4:
	movs r0, #0x11
	b _080B08EC
_080B08A8:
	ldrb r0, [r0, #0x12]
	movs r5, #1
	cmp r0, #1
	bne _080B08B2
	movs r5, #2
_080B08B2:
	bl GetBattleTransitionTypeByMap
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4]
	adds r1, r5, #0
	bl GetSumOfEnemyPartyLevel
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	bl GetSumOfPlayerPartyLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _080B08E4
	ldr r0, _080B08E0
	lsls r1, r6, #1
	adds r0, #1
	b _080B08E8
	.align 2, 0
_080B08E0: .4byte 0x0852AB2C
_080B08E4:
	ldr r0, _080B08F4
	lsls r1, r6, #1
_080B08E8:
	adds r1, r1, r0
	ldrb r0, [r1]
_080B08EC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B08F4: .4byte 0x0852AB2C
	thumb_func_end GetTrainerBattleTransition

	thumb_func_start sub_080B08F8
sub_080B08F8: @ 0x080B08F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080B0928
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl GetSumOfPlayerPartyLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bhs _080B097C
	cmp r5, #0xa
	beq _080B0934
	cmp r5, #0xa
	bgt _080B092C
	cmp r5, #3
	beq _080B0948
	b _080B0958
	.align 2, 0
_080B0928: .4byte 0x020243E8
_080B092C:
	cmp r5, #0xd
	bgt _080B0958
	movs r0, #4
	b _080B0A0C
_080B0934:
	ldr r4, _080B0944
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	b _080B0A00
	.align 2, 0
_080B0944: .4byte 0x0852AB40
_080B0948:
	ldr r4, _080B0954
	bl Random
	ands r5, r0
	lsls r0, r5, #0x10
	b _080B0A06
	.align 2, 0
_080B0954: .4byte 0x0852AB43
_080B0958:
	ldr r0, _080B0974
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	beq _080B09D8
	ldr r4, _080B0978
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _080B09FE
	.align 2, 0
_080B0974: .4byte 0x000040CE
_080B0978: .4byte 0x0852AB34
_080B097C:
	cmp r5, #0xa
	beq _080B0992
	cmp r5, #0xa
	bgt _080B098A
	cmp r5, #3
	beq _080B09A4
	b _080B09B4
_080B098A:
	cmp r5, #0xd
	bgt _080B09B4
	movs r0, #3
	b _080B0A0C
_080B0992:
	ldr r4, _080B09A0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	b _080B0A00
	.align 2, 0
_080B09A0: .4byte 0x0852AB40
_080B09A4:
	ldr r4, _080B09B0
	bl Random
	ands r5, r0
	lsls r0, r5, #0x10
	b _080B0A06
	.align 2, 0
_080B09B0: .4byte 0x0852AB43
_080B09B4:
	ldr r0, _080B09D0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	beq _080B09D8
	ldr r4, _080B09D4
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _080B09FE
	.align 2, 0
_080B09D0: .4byte 0x000040CE
_080B09D4: .4byte 0x0852AB34
_080B09D8:
	ldr r0, _080B0A14
	ldr r1, [r0]
	ldr r2, _080B0A18
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r2, r0, #2
	ldr r3, _080B0A1C
	adds r1, r1, r3
	adds r2, r1, r2
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080B0A20
_080B09FE:
	movs r1, #0xc
_080B0A00:
	bl __umodsi3
	lsls r0, r0, #0x10
_080B0A06:
	lsrs r0, r0, #0x10
	adds r0, r0, r4
	ldrb r0, [r0]
_080B0A0C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B0A14: .4byte 0x03005AF0
_080B0A18: .4byte 0x00000CB2
_080B0A1C: .4byte 0x00000CB4
_080B0A20: .4byte 0x0852AB34
	thumb_func_end sub_080B08F8

	thumb_func_start ChooseStarter
ChooseStarter: @ 0x080B0A24
	push {lr}
	ldr r0, _080B0A38
	bl SetMainCallback2
	ldr r1, _080B0A3C
	ldr r0, _080B0A40
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080B0A38: .4byte 0x08133EC5
_080B0A3C: .4byte 0x03002360
_080B0A40: .4byte 0x080B0A45
	thumb_func_end ChooseStarter

	thumb_func_start CB2_GiveStarter
CB2_GiveStarter: @ 0x080B0A44
	push {lr}
	sub sp, #8
	ldr r0, _080B0A88
	bl GetVarPointer
	ldr r2, _080B0A8C
	ldrh r1, [r2]
	strh r1, [r0]
	ldrh r0, [r2]
	bl GetStarterPokemon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #5
	movs r2, #0
	movs r3, #0
	bl ScriptGiveMon
	bl ResetTasks
	bl GetFlavorRelationByPersonality
	ldr r0, _080B0A90
	bl SetMainCallback2
	movs r0, #0
	bl BattleTransition_Start
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080B0A88: .4byte 0x00004023
_080B0A8C: .4byte 0x02037290
_080B0A90: .4byte 0x080B0A95
	thumb_func_end CB2_GiveStarter

	thumb_func_start CB2_StartFirstBattle
CB2_StartFirstBattle: @ 0x080B0A94
	push {lr}
	bl UpdatePaletteFade
	bl RunTasks
	bl IsBattleTransitionDone
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B0ADC
	ldr r1, _080B0AE0
	movs r0, #0x10
	str r0, [r1]
	ldr r1, _080B0AE4
	ldr r0, _080B0AE8
	str r0, [r1, #8]
	bl FreeAllWindowBuffers
	ldr r0, _080B0AEC
	bl SetMainCallback2
	bl RestartWildEncounterImmunitySteps
	bl ClearPoisonStepCounter
	movs r0, #7
	bl IncrementGameStat
	movs r0, #8
	bl IncrementGameStat
	bl sub_080EF7CC
	bl sub_080B0B04
_080B0ADC:
	pop {r0}
	bx r0
	.align 2, 0
_080B0AE0: .4byte 0x02022C90
_080B0AE4: .4byte 0x03002360
_080B0AE8: .4byte 0x080B0AF1
_080B0AEC: .4byte 0x080365B5
	thumb_func_end CB2_StartFirstBattle

	thumb_func_start CB2_EndFirstBattle
CB2_EndFirstBattle: @ 0x080B0AF0
	push {lr}
	bl Overworld_ClearSavedMusic
	ldr r0, _080B0B00
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080B0B00: .4byte 0x08085B35
	thumb_func_end CB2_EndFirstBattle

	thumb_func_start sub_080B0B04
sub_080B0B04: @ 0x080B0B04
	push {lr}
	movs r0, #8
	bl GetGameStat
	movs r1, #0x3c
	bl __umodsi3
	cmp r0, #0
	bne _080B0B1A
	bl UpdateGymLeaderRematch
_080B0B1A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B0B04

	thumb_func_start sub_080B0B20
sub_080B0B20: @ 0x080B0B20
	push {lr}
	movs r0, #9
	bl GetGameStat
	movs r1, #0x14
	bl __umodsi3
	cmp r0, #0
	bne _080B0B36
	bl UpdateGymLeaderRematch
_080B0B36:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B0B20

	thumb_func_start TrainerBattleLoadArg32
TrainerBattleLoadArg32: @ 0x080B0B3C
	adds r2, r0, #0
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	orrs r0, r1
	ldrb r1, [r2, #2]
	lsls r1, r1, #0x10
	orrs r0, r1
	ldrb r1, [r2, #3]
	lsls r1, r1, #0x18
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg32

	thumb_func_start TrainerBattleLoadArg16
TrainerBattleLoadArg16: @ 0x080B0B54
	adds r1, r0, #0
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	lsls r1, r1, #8
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg16

	thumb_func_start TrainerBattleLoadArg8
TrainerBattleLoadArg8: @ 0x080B0B60
	ldrb r0, [r0]
	bx lr
	thumb_func_end TrainerBattleLoadArg8

	thumb_func_start GetTrainerBFlag
GetTrainerBFlag: @ 0x080B0B64
	ldr r1, _080B0B78
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_080B0B78: .4byte 0x0203886A
	thumb_func_end GetTrainerBFlag

	thumb_func_start GetTrainerAFlag
GetTrainerAFlag: @ 0x080B0B7C
	ldr r1, _080B0B90
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_080B0B90: .4byte 0x0203886C
	thumb_func_end GetTrainerAFlag

	thumb_func_start IsPlayerDefeated
IsPlayerDefeated: @ 0x080B0B94
	push {lr}
	subs r0, #1
	cmp r0, #6
	bhi _080B0BCC
	lsls r0, r0, #2
	ldr r1, _080B0BA8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B0BA8: .4byte 0x080B0BAC
_080B0BAC: @ jump table
	.4byte _080B0BCC @ case 0
	.4byte _080B0BC8 @ case 1
	.4byte _080B0BC8 @ case 2
	.4byte _080B0BCC @ case 3
	.4byte _080B0BCC @ case 4
	.4byte _080B0BCC @ case 5
	.4byte _080B0BCC @ case 6
_080B0BC8:
	movs r0, #1
	b _080B0BCE
_080B0BCC:
	movs r0, #0
_080B0BCE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsPlayerDefeated

	thumb_func_start ResetTrainerOpponentIds
ResetTrainerOpponentIds: @ 0x080B0BD4
	ldr r0, _080B0BE0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080B0BE4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080B0BE0: .4byte 0x0203886A
_080B0BE4: .4byte 0x0203886C
	thumb_func_end ResetTrainerOpponentIds

	thumb_func_start InitTrainerBattleVariables
InitTrainerBattleVariables: @ 0x080B0BE8
	push {lr}
	ldr r0, _080B0C04
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080B0C08
	ldrb r1, [r0]
	cmp r1, #0
	bne _080B0C18
	ldr r0, _080B0C0C
	str r1, [r0]
	ldr r0, _080B0C10
	str r1, [r0]
	ldr r0, _080B0C14
	b _080B0C24
	.align 2, 0
_080B0C04: .4byte 0x02038868
_080B0C08: .4byte 0x0203889C
_080B0C0C: .4byte 0x02038874
_080B0C10: .4byte 0x0203887C
_080B0C14: .4byte 0x02038890
_080B0C18:
	ldr r0, _080B0C40
	movs r1, #0
	str r1, [r0]
	ldr r0, _080B0C44
	str r1, [r0]
	ldr r0, _080B0C48
_080B0C24:
	str r1, [r0]
	ldr r1, _080B0C4C
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080B0C50
	movs r1, #0
	str r1, [r0]
	ldr r0, _080B0C54
	str r1, [r0]
	ldr r0, _080B0C58
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B0C40: .4byte 0x02038878
_080B0C44: .4byte 0x02038880
_080B0C48: .4byte 0x02038894
_080B0C4C: .4byte 0x02038870
_080B0C50: .4byte 0x02038884
_080B0C54: .4byte 0x02038888
_080B0C58: .4byte 0x0203888C
	thumb_func_end InitTrainerBattleVariables

	thumb_func_start TrainerBattleLoadArgs
TrainerBattleLoadArgs: @ 0x080B0C5C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
_080B0C62:
	ldrb r0, [r4, #4]
	cmp r0, #6
	bhi _080B0CD4
	lsls r0, r0, #2
	ldr r1, _080B0C74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B0C74: .4byte 0x080B0C78
_080B0C78: @ jump table
	.4byte _080B0C94 @ case 0
	.4byte _080B0CA2 @ case 1
	.4byte _080B0CB0 @ case 2
	.4byte _080B0CBE @ case 3
	.4byte _080B0CC6 @ case 4
	.4byte _080B0CCE @ case 5
	.4byte _080B0CD8 @ case 6
_080B0C94:
	adds r0, r5, #0
	bl TrainerBattleLoadArg8
	ldr r1, [r4]
	strb r0, [r1]
	adds r5, #1
	b _080B0CD4
_080B0CA2:
	adds r0, r5, #0
	bl TrainerBattleLoadArg16
	ldr r1, [r4]
	strh r0, [r1]
	adds r5, #2
	b _080B0CD4
_080B0CB0:
	adds r0, r5, #0
	bl TrainerBattleLoadArg32
	ldr r1, [r4]
	str r0, [r1]
	adds r5, #4
	b _080B0CD4
_080B0CBE:
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1]
	b _080B0CD4
_080B0CC6:
	ldr r1, [r4]
	movs r0, #0
	strh r0, [r1]
	b _080B0CD4
_080B0CCE:
	ldr r1, [r4]
	movs r0, #0
	str r0, [r1]
_080B0CD4:
	adds r4, #8
	b _080B0C62
_080B0CD8:
	ldr r0, [r4]
	str r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TrainerBattleLoadArgs

	thumb_func_start SetMapVarsToTrainer
SetMapVarsToTrainer: @ 0x080B0CE4
	push {lr}
	ldr r0, _080B0D0C
	ldrh r1, [r0]
	cmp r1, #0
	beq _080B0D06
	ldr r0, _080B0D10
	strh r1, [r0]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B0D14
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl GetEventObjectIdByLocalIdAndMap
	ldr r1, _080B0D18
	strb r0, [r1]
_080B0D06:
	pop {r0}
	bx r0
	.align 2, 0
_080B0D0C: .4byte 0x02038870
_080B0D10: .4byte 0x02037292
_080B0D14: .4byte 0x03005AEC
_080B0D18: .4byte 0x03005B50
	thumb_func_end SetMapVarsToTrainer

	thumb_func_start BattleSetup_ConfigureTrainerBattle
BattleSetup_ConfigureTrainerBattle: @ 0x080B0D1C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl InitTrainerBattleVariables
	ldr r4, _080B0D48
	adds r0, r5, #0
	bl TrainerBattleLoadArg8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0xb
	bls _080B0D3C
	b _080B0EE0
_080B0D3C:
	lsls r0, r0, #2
	ldr r1, _080B0D4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B0D48: .4byte 0x02038868
_080B0D4C: .4byte 0x080B0D50
_080B0D50: @ jump table
	.4byte _080B0DB8 @ case 0
	.4byte _080B0D9C @ case 1
	.4byte _080B0D80 @ case 2
	.4byte _080B0D94 @ case 3
	.4byte _080B0E00 @ case 4
	.4byte _080B0DC0 @ case 5
	.4byte _080B0DD8 @ case 6
	.4byte _080B0DC0 @ case 7
	.4byte _080B0E28 @ case 8
	.4byte _080B0E7C @ case 9
	.4byte _080B0E84 @ case 10
	.4byte _080B0E94 @ case 11
_080B0D80:
	ldr r0, _080B0D8C
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	ldr r0, _080B0D90
	b _080B0F0A
	.align 2, 0
_080B0D8C: .4byte 0x0852AC20
_080B0D90: .4byte 0x0824245C
_080B0D94:
	ldr r0, _080B0D98
	b _080B0DC2
	.align 2, 0
_080B0D98: .4byte 0x0852ABD8
_080B0D9C:
	ldr r0, _080B0DA8
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B0DB0
	ldr r0, _080B0DAC
	b _080B0EEA
	.align 2, 0
_080B0DA8: .4byte 0x0203889C
_080B0DAC: .4byte 0x0852AB90
_080B0DB0:
	ldr r0, _080B0DB4
	b _080B0F02
	.align 2, 0
_080B0DB4: .4byte 0x0852ACF8
_080B0DB8:
	ldr r0, _080B0DBC
	b _080B0EEA
	.align 2, 0
_080B0DBC: .4byte 0x0852AB90
_080B0DC0:
	ldr r0, _080B0DD0
_080B0DC2:
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	bl SetMapVarsToTrainer
	ldr r0, _080B0DD4
	b _080B0F0A
	.align 2, 0
_080B0DD0: .4byte 0x0852AC68
_080B0DD4: .4byte 0x08242424
_080B0DD8:
	ldr r0, _080B0DF4
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	bl SetMapVarsToTrainer
	ldr r4, _080B0DF8
	ldrh r0, [r4]
	bl GetRematchTrainerId
	strh r0, [r4]
	ldr r0, _080B0DFC
	b _080B0F0A
	.align 2, 0
_080B0DF4: .4byte 0x0852ABD8
_080B0DF8: .4byte 0x0203886A
_080B0DFC: .4byte 0x08242492
_080B0E00:
	ldr r0, _080B0E1C
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	bl SetMapVarsToTrainer
	ldr r4, _080B0E20
	ldrh r0, [r4]
	bl GetRematchTrainerId
	strh r0, [r4]
	ldr r0, _080B0E24
	b _080B0F0A
	.align 2, 0
_080B0E1C: .4byte 0x0852AB48
_080B0E20: .4byte 0x0203886A
_080B0E24: .4byte 0x0824246B
_080B0E28:
	ldr r0, _080B0E48
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B0E58
	ldr r0, _080B0E4C
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	bl SetMapVarsToTrainer
	ldr r0, _080B0E50
	ldrb r0, [r0]
	bl LocalIdToPyramidTrainerId
	ldr r1, _080B0E54
	b _080B0E6A
	.align 2, 0
_080B0E48: .4byte 0x0203889C
_080B0E4C: .4byte 0x0852AB48
_080B0E50: .4byte 0x02037292
_080B0E54: .4byte 0x0203886A
_080B0E58:
	ldr r0, _080B0E70
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	ldr r0, _080B0E74
	ldrb r0, [r0]
	bl LocalIdToPyramidTrainerId
_080B0E68:
	ldr r1, _080B0E78
_080B0E6A:
	strh r0, [r1]
	b _080B0F08
	.align 2, 0
_080B0E70: .4byte 0x0852ACB0
_080B0E74: .4byte 0x02037292
_080B0E78: .4byte 0x0203886C
_080B0E7C:
	ldr r0, _080B0E80
	b _080B0E86
	.align 2, 0
_080B0E80: .4byte 0x0852AB48
_080B0E84:
	ldr r0, _080B0E90
_080B0E86:
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	movs r0, #0
	b _080B0F0A
	.align 2, 0
_080B0E90: .4byte 0x0852ACB0
_080B0E94:
	ldr r0, _080B0EB4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B0EC4
	ldr r0, _080B0EB8
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	bl SetMapVarsToTrainer
	ldr r0, _080B0EBC
	ldrb r0, [r0]
	bl LocalIdToHillTrainerId
	ldr r1, _080B0EC0
	b _080B0E6A
	.align 2, 0
_080B0EB4: .4byte 0x0203889C
_080B0EB8: .4byte 0x0852AB48
_080B0EBC: .4byte 0x02037292
_080B0EC0: .4byte 0x0203886A
_080B0EC4:
	ldr r0, _080B0ED8
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	ldr r0, _080B0EDC
	ldrb r0, [r0]
	bl LocalIdToHillTrainerId
	b _080B0E68
	.align 2, 0
_080B0ED8: .4byte 0x0852ACB0
_080B0EDC: .4byte 0x02037292
_080B0EE0:
	ldr r0, _080B0EF8
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B0F00
	ldr r0, _080B0EFC
_080B0EEA:
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
	bl SetMapVarsToTrainer
	b _080B0F08
	.align 2, 0
_080B0EF8: .4byte 0x0203889C
_080B0EFC: .4byte 0x0852AB48
_080B0F00:
	ldr r0, _080B0F10
_080B0F02:
	adds r1, r5, #0
	bl TrainerBattleLoadArgs
_080B0F08:
	ldr r0, _080B0F14
_080B0F0A:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B0F10: .4byte 0x0852ACB0
_080B0F14: .4byte 0x082423FC
	thumb_func_end BattleSetup_ConfigureTrainerBattle

	thumb_func_start ConfigureAndSetUpOneTrainerBattle
ConfigureAndSetUpOneTrainerBattle: @ 0x080B0F18
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B0F4C
	strb r0, [r2]
	ldr r4, _080B0F50
	ldr r3, _080B0F54
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrb r0, [r2, #8]
	strh r0, [r4]
	adds r1, #1
	adds r0, r1, #0
	bl BattleSetup_ConfigureTrainerBattle
	ldr r0, _080B0F58
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0F4C: .4byte 0x03005B50
_080B0F50: .4byte 0x02037292
_080B0F54: .4byte 0x02036FF0
_080B0F58: .4byte 0x082423EE
	thumb_func_end ConfigureAndSetUpOneTrainerBattle

	thumb_func_start ConfigureTwoTrainersBattle
ConfigureTwoTrainersBattle: @ 0x080B0F5C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B0F84
	strb r0, [r2]
	ldr r4, _080B0F88
	ldr r3, _080B0F8C
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrb r0, [r2, #8]
	strh r0, [r4]
	adds r1, #1
	adds r0, r1, #0
	bl BattleSetup_ConfigureTrainerBattle
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0F84: .4byte 0x03005B50
_080B0F88: .4byte 0x02037292
_080B0F8C: .4byte 0x02036FF0
	thumb_func_end ConfigureTwoTrainersBattle

	thumb_func_start SetUpTwoTrainersBattle
SetUpTwoTrainersBattle: @ 0x080B0F90
	push {lr}
	ldr r0, _080B0FA0
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_080B0FA0: .4byte 0x082423EE
	thumb_func_end SetUpTwoTrainersBattle

	thumb_func_start GetTrainerFlagFromScriptPointer
GetTrainerFlagFromScriptPointer: @ 0x080B0FA4
	push {lr}
	adds r0, #2
	bl TrainerBattleLoadArg16
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetTrainerFlagFromScriptPointer

	thumb_func_start SetUpTrainerMovement
SetUpTrainerMovement: @ 0x080B0FC4
	push {r4, lr}
	ldr r0, _080B0FF0
	ldrb r0, [r0]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B0FF4
	adds r4, r4, r0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GroundEffect_DeepSandTracks
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetTrainerMovementType
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0FF0: .4byte 0x03005B50
_080B0FF4: .4byte 0x02036FF0
	thumb_func_end SetUpTrainerMovement

	thumb_func_start GetTrainerBattleMode
GetTrainerBattleMode: @ 0x080B0FF8
	ldr r0, _080B1000
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B1000: .4byte 0x02038868
	thumb_func_end GetTrainerBattleMode

	thumb_func_start GetTrainerFlag
GetTrainerFlag: @ 0x080B1004
	push {lr}
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1020
	ldr r0, _080B101C
	ldrb r0, [r0]
	bl GetBattlePyramidTrainerFlag
	b _080B103E
	.align 2, 0
_080B101C: .4byte 0x03005B50
_080B1020:
	bl InTrainerHill
	cmp r0, #0
	bne _080B1036
	bl GetTrainerBFlag
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	b _080B103E
_080B1036:
	ldr r0, _080B1048
	ldrb r0, [r0]
	bl GetHillTrainerFlag
_080B103E:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080B1048: .4byte 0x03005B50
	thumb_func_end GetTrainerFlag

	thumb_func_start SetBattledTrainersFlags
SetBattledTrainersFlags: @ 0x080B104C
	push {lr}
	ldr r0, _080B1074
	ldrh r0, [r0]
	cmp r0, #0
	beq _080B1062
	bl GetTrainerAFlag
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagSet
_080B1062:
	bl GetTrainerBFlag
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080B1074: .4byte 0x0203886C
	thumb_func_end SetBattledTrainersFlags

	thumb_func_start SetBattledTrainerFlag
SetBattledTrainerFlag: @ 0x080B1078
	push {lr}
	bl GetTrainerBFlag
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetBattledTrainerFlag

	thumb_func_start HasTrainerBeenFought
HasTrainerBeenFought: @ 0x080B108C
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end HasTrainerBeenFought

	thumb_func_start ClearTrainerFlag
ClearTrainerFlag: @ 0x080B10A4
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end ClearTrainerFlag

	thumb_func_start SetTrainerFlag
SetTrainerFlag: @ 0x080B10B8
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	bl FlagClear
	pop {r0}
	bx r0
	thumb_func_end SetTrainerFlag

	thumb_func_start BattleSetup_StartTrainerBattle
BattleSetup_StartTrainerBattle: @ 0x080B10CC
	push {r4, lr}
	ldr r0, _080B10DC
	ldrb r0, [r0]
	cmp r0, #2
	bne _080B10E8
	ldr r1, _080B10E0
	ldr r0, _080B10E4
	b _080B10EC
	.align 2, 0
_080B10DC: .4byte 0x03005E08
_080B10E0: .4byte 0x02022C90
_080B10E4: .4byte 0x00008009
_080B10E8:
	ldr r1, _080B1140
	movs r0, #8
_080B10EC:
	str r0, [r1]
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1170
	ldr r0, _080B1144
	movs r1, #0
	bl VarSet
	ldr r2, _080B1140
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2]
	ldr r0, _080B1148
	ldrb r0, [r0]
	cmp r0, #2
	bne _080B1150
	movs r0, #1
	bl FillFrontierTrainersParties
	ldr r4, _080B114C
	adds r0, r4, #0
	bl ZeroMonData
	adds r0, r4, #0
	adds r0, #0x64
	bl ZeroMonData
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r4, r1
	bl ZeroMonData
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r4, r1
	bl ZeroMonData
	b _080B1166
	.align 2, 0
_080B1140: .4byte 0x02022C90
_080B1144: .4byte 0x0000400E
_080B1148: .4byte 0x03005E08
_080B114C: .4byte 0x0202444C
_080B1150:
	movs r0, #1
	bl FillFrontierTrainerParty
	ldr r4, _080B116C
	adds r0, r4, #0
	bl ZeroMonData
	adds r4, #0x64
	adds r0, r4, #0
	bl ZeroMonData
_080B1166:
	bl MarkApproachingPyramidTrainersAsBattled
	b _080B11A4
	.align 2, 0
_080B116C: .4byte 0x0202444C
_080B1170:
	bl sub_081D52F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B11A4
	ldr r2, _080B1194
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x13
	orrs r0, r1
	str r0, [r2]
	ldr r0, _080B1198
	ldrb r0, [r0]
	cmp r0, #2
	bne _080B119C
	bl FillHillTrainersParties
	b _080B11A0
	.align 2, 0
_080B1194: .4byte 0x02022C90
_080B1198: .4byte 0x03005E08
_080B119C:
	bl FillHillTrainerParty
_080B11A0:
	bl SetHillTrainerFlag
_080B11A4:
	ldr r1, _080B11DC
	ldr r2, _080B11E0
	ldrb r0, [r2]
	strb r0, [r1]
	movs r1, #0
	strb r1, [r2]
	ldr r0, _080B11E4
	strb r1, [r0]
	ldr r1, _080B11E8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080B11EC
	ldr r0, _080B11F0
	str r0, [r1, #8]
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B11D4
	bl sub_081D52F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B11F4
_080B11D4:
	bl sub_080B0124
	b _080B11F8
	.align 2, 0
_080B11DC: .4byte 0x02038899
_080B11E0: .4byte 0x03005E08
_080B11E4: .4byte 0x02038898
_080B11E8: .4byte 0x03005DE0
_080B11EC: .4byte 0x03002360
_080B11F0: .4byte 0x080B1205
_080B11F4:
	bl DoTrainerBattle
_080B11F8:
	bl ScriptContext1_Stop
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleSetup_StartTrainerBattle

	thumb_func_start CB2_EndTrainerBattle
CB2_EndTrainerBattle: @ 0x080B1204
	push {lr}
	ldr r0, _080B123C
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _080B1232
	ldr r0, _080B1240
	ldrb r0, [r0]
	bl IsPlayerDefeated
	cmp r0, #1
	bne _080B1254
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B1232
	bl sub_081D52F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1248
_080B1232:
	ldr r0, _080B1244
	bl SetMainCallback2
	b _080B1276
	.align 2, 0
_080B123C: .4byte 0x0203886A
_080B1240: .4byte 0x02023FDE
_080B1244: .4byte 0x08085B35
_080B1248:
	ldr r0, _080B1250
	bl SetMainCallback2
	b _080B1276
	.align 2, 0
_080B1250: .4byte 0x080858C1
_080B1254:
	ldr r0, _080B127C
	bl SetMainCallback2
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B1276
	bl sub_081D52F0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B1276
	bl RegisterTrainerInMatchCall
	bl SetBattledTrainersFlags
_080B1276:
	pop {r0}
	bx r0
	.align 2, 0
_080B127C: .4byte 0x08085B35
	thumb_func_end CB2_EndTrainerBattle

	thumb_func_start CB2_EndRematchBattle
CB2_EndRematchBattle: @ 0x080B1280
	push {lr}
	ldr r0, _080B1298
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bne _080B12A0
	ldr r0, _080B129C
	bl SetMainCallback2
	b _080B12CE
	.align 2, 0
_080B1298: .4byte 0x0203886A
_080B129C: .4byte 0x08085B35
_080B12A0:
	ldr r0, _080B12B4
	ldrb r0, [r0]
	bl IsPlayerDefeated
	cmp r0, #1
	bne _080B12BC
	ldr r0, _080B12B8
	bl SetMainCallback2
	b _080B12CE
	.align 2, 0
_080B12B4: .4byte 0x02023FDE
_080B12B8: .4byte 0x080858C1
_080B12BC:
	ldr r0, _080B12D4
	bl SetMainCallback2
	bl RegisterTrainerInMatchCall
	bl SetBattledTrainersFlags
	bl HandleRematchVarsOnBattleEnd
_080B12CE:
	pop {r0}
	bx r0
	.align 2, 0
_080B12D4: .4byte 0x08085B35
	thumb_func_end CB2_EndRematchBattle

	thumb_func_start BattleSetup_StartRematchBattle
BattleSetup_StartRematchBattle: @ 0x080B12D8
	push {lr}
	ldr r1, _080B12F4
	movs r0, #8
	str r0, [r1]
	ldr r1, _080B12F8
	ldr r0, _080B12FC
	str r0, [r1, #8]
	bl DoTrainerBattle
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080B12F4: .4byte 0x02022C90
_080B12F8: .4byte 0x03002360
_080B12FC: .4byte 0x080B1281
	thumb_func_end BattleSetup_StartRematchBattle

	thumb_func_start ShowTrainerIntroSpeech
ShowTrainerIntroSpeech: @ 0x080B1300
	push {lr}
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1368
	ldr r0, _080B1328
	ldrb r0, [r0]
	cmp r0, #1
	bhi _080B1330
	ldr r0, _080B132C
	ldrb r0, [r0]
	bl LocalIdToPyramidTrainerId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CopyPyramidTrainerSpeechBefore
	b _080B13C4
	.align 2, 0
_080B1328: .4byte 0x03005E08
_080B132C: .4byte 0x02037292
_080B1330:
	ldr r3, _080B135C
	ldr r2, _080B1360
	ldr r0, _080B1364
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	bl LocalIdToPyramidTrainerId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CopyPyramidTrainerSpeechBefore
	b _080B13C4
	.align 2, 0
_080B135C: .4byte 0x02036FF0
_080B1360: .4byte 0x03005DF0
_080B1364: .4byte 0x0203889C
_080B1368:
	bl sub_081D52F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B13D8
	ldr r0, _080B1390
	ldrb r0, [r0]
	cmp r0, #1
	bhi _080B1398
	ldr r0, _080B1394
	ldrb r0, [r0]
	bl LocalIdToHillTrainerId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #2
	bl CopyTrainerHillTrainerText
	b _080B13C4
	.align 2, 0
_080B1390: .4byte 0x03005E08
_080B1394: .4byte 0x02037292
_080B1398:
	ldr r3, _080B13CC
	ldr r2, _080B13D0
	ldr r0, _080B13D4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	bl LocalIdToHillTrainerId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #2
	bl CopyTrainerHillTrainerText
_080B13C4:
	bl sub_08097C40
	b _080B13E0
	.align 2, 0
_080B13CC: .4byte 0x02036FF0
_080B13D0: .4byte 0x03005DF0
_080B13D4: .4byte 0x0203889C
_080B13D8:
	bl GetIntroSpeechOfApproachingTrainer
	bl ShowFieldMessage
_080B13E0:
	pop {r0}
	bx r0
	thumb_func_end ShowTrainerIntroSpeech

	thumb_func_start BattleSetup_GetScriptAddrAfterBattle
BattleSetup_GetScriptAddrAfterBattle: @ 0x080B13E4
	push {lr}
	ldr r0, _080B13F4
	ldr r0, [r0]
	cmp r0, #0
	bne _080B13F0
	ldr r0, _080B13F8
_080B13F0:
	pop {r1}
	bx r1
	.align 2, 0
_080B13F4: .4byte 0x0203888C
_080B13F8: .4byte 0x08276D3D
	thumb_func_end BattleSetup_GetScriptAddrAfterBattle

	thumb_func_start BattleSetup_GetTrainerPostBattleScript
BattleSetup_GetTrainerPostBattleScript: @ 0x080B13FC
	push {lr}
	ldr r1, _080B141C
	ldrb r2, [r1]
	cmp r2, #0
	beq _080B1428
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080B1420
	ldr r2, [r0]
	cmp r2, #0
	beq _080B1440
	ldr r1, _080B1424
	movs r0, #1
	strh r0, [r1]
	adds r0, r2, #0
	b _080B1442
	.align 2, 0
_080B141C: .4byte 0x02038898
_080B1420: .4byte 0x02038894
_080B1424: .4byte 0x03005DE0
_080B1428:
	ldr r0, _080B1438
	ldr r1, [r0]
	cmp r1, #0
	beq _080B1440
	ldr r0, _080B143C
	strh r2, [r0]
	adds r0, r1, #0
	b _080B1442
	.align 2, 0
_080B1438: .4byte 0x02038890
_080B143C: .4byte 0x03005DE0
_080B1440:
	ldr r0, _080B1448
_080B1442:
	pop {r1}
	bx r1
	.align 2, 0
_080B1448: .4byte 0x08244D10
	thumb_func_end BattleSetup_GetTrainerPostBattleScript

	thumb_func_start ShowTrainerCantBattleSpeech
ShowTrainerCantBattleSpeech: @ 0x080B144C
	push {lr}
	bl GetTrainerCantBattleSpeech
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ShowTrainerCantBattleSpeech

	thumb_func_start SetUpTrainerEncounterMusic
SetUpTrainerEncounterMusic: @ 0x080B145C
	push {lr}
	ldr r0, _080B146C
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B1474
	ldr r0, _080B1470
	b _080B1476
	.align 2, 0
_080B146C: .4byte 0x0203889C
_080B1470: .4byte 0x0203886A
_080B1474:
	ldr r0, _080B149C
_080B1476:
	ldrh r1, [r0]
	ldr r0, _080B14A0
	ldrh r0, [r0]
	cmp r0, #1
	beq _080B154E
	cmp r0, #8
	beq _080B154E
	adds r0, r1, #0
	bl GetTrainerEncounterMusicId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd
	bhi _080B1548
	lsls r0, r0, #2
	ldr r1, _080B14A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B149C: .4byte 0x0203886C
_080B14A0: .4byte 0x02038868
_080B14A4: .4byte 0x080B14A8
_080B14A8: @ jump table
	.4byte _080B14E0 @ case 0
	.4byte _080B14E6 @ case 1
	.4byte _080B14F0 @ case 2
	.4byte _080B1548 @ case 3
	.4byte _080B14F8 @ case 4
	.4byte _080B14FE @ case 5
	.4byte _080B1508 @ case 6
	.4byte _080B1510 @ case 7
	.4byte _080B1518 @ case 8
	.4byte _080B1520 @ case 9
	.4byte _080B1528 @ case 10
	.4byte _080B152E @ case 11
	.4byte _080B1538 @ case 12
	.4byte _080B1540 @ case 13
_080B14E0:
	movs r0, #0xbe
	lsls r0, r0, #1
	b _080B154A
_080B14E6:
	ldr r0, _080B14EC
	b _080B154A
	.align 2, 0
_080B14EC: .4byte 0x00000197
_080B14F0:
	ldr r0, _080B14F4
	b _080B154A
	.align 2, 0
_080B14F4: .4byte 0x0000017B
_080B14F8:
	movs r0, #0xd0
	lsls r0, r0, #1
	b _080B154A
_080B14FE:
	ldr r0, _080B1504
	b _080B154A
	.align 2, 0
_080B1504: .4byte 0x000001A1
_080B1508:
	ldr r0, _080B150C
	b _080B154A
	.align 2, 0
_080B150C: .4byte 0x000001A3
_080B1510:
	ldr r0, _080B1514
	b _080B154A
	.align 2, 0
_080B1514: .4byte 0x000001B9
_080B1518:
	ldr r0, _080B151C
	b _080B154A
	.align 2, 0
_080B151C: .4byte 0x00000181
_080B1520:
	ldr r0, _080B1524
	b _080B154A
	.align 2, 0
_080B1524: .4byte 0x000001C1
_080B1528:
	movs r0, #0xe1
	lsls r0, r0, #1
	b _080B154A
_080B152E:
	ldr r0, _080B1534
	b _080B154A
	.align 2, 0
_080B1534: .4byte 0x000001C3
_080B1538:
	ldr r0, _080B153C
	b _080B154A
	.align 2, 0
_080B153C: .4byte 0x000001C5
_080B1540:
	ldr r0, _080B1544
	b _080B154A
	.align 2, 0
_080B1544: .4byte 0x0000018D
_080B1548:
	ldr r0, _080B1554
_080B154A:
	bl PlayNewMapMusic
_080B154E:
	pop {r0}
	bx r0
	.align 2, 0
_080B1554: .4byte 0x000001A7
	thumb_func_end SetUpTrainerEncounterMusic

	thumb_func_start ReturnEmptyStringIfNull
ReturnEmptyStringIfNull: @ 0x080B1558
	push {lr}
	cmp r0, #0
	bne _080B1560
	ldr r0, _080B1564
_080B1560:
	pop {r1}
	bx r1
	.align 2, 0
_080B1564: .4byte 0x085C93D0
	thumb_func_end ReturnEmptyStringIfNull

	thumb_func_start GetIntroSpeechOfApproachingTrainer
GetIntroSpeechOfApproachingTrainer: @ 0x080B1568
	push {lr}
	ldr r0, _080B1578
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B1580
	ldr r0, _080B157C
	b _080B1582
	.align 2, 0
_080B1578: .4byte 0x0203889C
_080B157C: .4byte 0x02038878
_080B1580:
	ldr r0, _080B158C
_080B1582:
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	pop {r1}
	bx r1
	.align 2, 0
_080B158C: .4byte 0x02038874
	thumb_func_end GetIntroSpeechOfApproachingTrainer

	thumb_func_start GetTrainerALoseText
GetTrainerALoseText: @ 0x080B1590
	push {r4, lr}
	ldr r0, _080B15A4
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bne _080B15A8
	bl GetSecretBaseTrainerLoseText
	b _080B15AC
	.align 2, 0
_080B15A4: .4byte 0x0203886A
_080B15A8:
	ldr r0, _080B15C4
	ldr r0, [r0]
_080B15AC:
	ldr r4, _080B15C8
	bl ReturnEmptyStringIfNull
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B15C4: .4byte 0x0203887C
_080B15C8: .4byte 0x02021C7C
	thumb_func_end GetTrainerALoseText

	thumb_func_start GetTrainerBLoseText
GetTrainerBLoseText: @ 0x080B15CC
	push {r4, lr}
	ldr r4, _080B15E8
	ldr r0, _080B15EC
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B15E8: .4byte 0x02021C7C
_080B15EC: .4byte 0x02038880
	thumb_func_end GetTrainerBLoseText

	thumb_func_start GetTrainerWonSpeech
GetTrainerWonSpeech: @ 0x080B15F0
	push {lr}
	ldr r0, _080B1600
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	pop {r1}
	bx r1
	.align 2, 0
_080B1600: .4byte 0x02038884
	thumb_func_end GetTrainerWonSpeech

	thumb_func_start GetTrainerCantBattleSpeech
GetTrainerCantBattleSpeech: @ 0x080B1604
	push {lr}
	ldr r0, _080B1614
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	pop {r1}
	bx r1
	.align 2, 0
_080B1614: .4byte 0x02038888
	thumb_func_end GetTrainerCantBattleSpeech

	thumb_func_start FirstBattleTrainerIdToRematchTableId
FirstBattleTrainerIdToRematchTableId: @ 0x080B1618
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0
	adds r2, r0, #0
_080B1622:
	ldrh r0, [r2]
	cmp r0, r1
	bne _080B162C
	adds r0, r3, #0
	b _080B1638
_080B162C:
	adds r2, #0x10
	adds r3, #1
	cmp r3, #0x4d
	ble _080B1622
	movs r0, #1
	rsbs r0, r0, #0
_080B1638:
	pop {r1}
	bx r1
	thumb_func_end FirstBattleTrainerIdToRematchTableId

	thumb_func_start TrainerIdToRematchTableId
TrainerIdToRematchTableId: @ 0x080B163C
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r4, #0
	adds r2, r0, #0
_080B1646:
	movs r1, #0
	ldrh r0, [r2]
	cmp r0, #0
	beq _080B166C
	movs r3, #0
_080B1650:
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, r5
	bne _080B165C
	adds r0, r4, #0
	b _080B1678
_080B165C:
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	bgt _080B166C
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _080B1650
_080B166C:
	adds r2, #0x10
	adds r4, #1
	cmp r4, #0x4d
	ble _080B1646
	movs r0, #1
	rsbs r0, r0, #0
_080B1678:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TrainerIdToRematchTableId

	thumb_func_start sub_080B1680
sub_080B1680: @ 0x080B1680
	push {lr}
	cmp r0, #0x48
	ble _080B168A
	movs r0, #1
	b _080B16A4
_080B168A:
	cmp r0, #0x40
	bne _080B16A2
	movs r0, #0x7e
	bl FlagGet
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B169E
	movs r1, #1
_080B169E:
	adds r0, r1, #0
	b _080B16A4
_080B16A2:
	movs r0, #0
_080B16A4:
	pop {r1}
	bx r1
	thumb_func_end sub_080B1680

	thumb_func_start SetRematchIdForTrainer
SetRematchIdForTrainer: @ 0x080B16A8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	movs r5, #1
	lsls r1, r6, #4
	adds r1, r1, r0
	adds r4, r1, #2
	b _080B16BA
_080B16B6:
	adds r4, #2
	adds r5, #1
_080B16BA:
	cmp r5, #4
	bgt _080B16CE
	ldrh r0, [r4]
	cmp r0, #0
	beq _080B16CE
	bl HasTrainerBeenFought
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B16B6
_080B16CE:
	ldr r0, _080B16E0
	ldr r0, [r0]
	ldr r1, _080B16E4
	adds r0, r0, r1
	adds r0, r0, r6
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B16E0: .4byte 0x03005AEC
_080B16E4: .4byte 0x000009CA
	thumb_func_end SetRematchIdForTrainer

	thumb_func_start UpdateRandomTrainerRematches
UpdateRandomTrainerRematches: @ 0x080B16E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r7, #0
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0xa
_080B1706:
	ldrh r0, [r4]
	cmp r0, sb
	bne _080B1760
	ldrh r0, [r4, #2]
	cmp r0, r8
	bne _080B1760
	adds r0, r5, #0
	bl sub_080B1680
	cmp r0, #0
	bne _080B1760
	ldr r0, _080B1778
	ldr r0, [r0]
	ldr r1, _080B177C
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B175E
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r5, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1760
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bhi _080B1760
	adds r0, r6, #0
	adds r1, r5, #0
	bl SetRematchIdForTrainer
_080B175E:
	movs r7, #1
_080B1760:
	adds r4, #0x10
	adds r5, #1
	cmp r5, #0x40
	ble _080B1706
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B1778: .4byte 0x03005AEC
_080B177C: .4byte 0x000009CA
	thumb_func_end UpdateRandomTrainerRematches

	thumb_func_start UpdateRematchIfDefeated
UpdateRematchIfDefeated: @ 0x080B1780
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080B17A8
	lsls r0, r4, #4
	adds r0, r0, r5
	ldrh r0, [r0]
	bl HasTrainerBeenFought
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B17A0
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetRematchIdForTrainer
_080B17A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B17A8: .4byte 0x0852AD40
	thumb_func_end UpdateRematchIfDefeated

	thumb_func_start DoesSomeoneWantRematchIn_
DoesSomeoneWantRematchIn_: @ 0x080B17AC
	push {r4, r5, r6, lr}
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0xa
	ldr r5, _080B17DC
_080B17BE:
	ldrh r0, [r3]
	cmp r0, r4
	bne _080B17E4
	ldrh r0, [r3, #2]
	cmp r0, r2
	bne _080B17E4
	ldr r0, [r5]
	ldr r6, _080B17E0
	adds r0, r0, r6
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B17E4
	movs r0, #1
	b _080B17EE
	.align 2, 0
_080B17DC: .4byte 0x03005AEC
_080B17E0: .4byte 0x000009CA
_080B17E4:
	adds r3, #0x10
	adds r1, #1
	cmp r1, #0x4d
	ble _080B17BE
	movs r0, #0
_080B17EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end DoesSomeoneWantRematchIn_

	thumb_func_start IsRematchTrainerIn_
IsRematchTrainerIn_: @ 0x080B17F4
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0xa
_080B1804:
	ldrh r0, [r3]
	cmp r0, r4
	bne _080B1814
	ldrh r0, [r3, #2]
	cmp r0, r2
	bne _080B1814
	movs r0, #1
	b _080B181E
_080B1814:
	adds r3, #0x10
	adds r1, #1
	cmp r1, #0x4d
	ble _080B1804
	movs r0, #0
_080B181E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsRematchTrainerIn_

	thumb_func_start IsFirstTrainerIdReadyForRematch
IsFirstTrainerIdReadyForRematch: @ 0x080B1824
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FirstBattleTrainerIdToRematchTableId
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080B1858
	cmp r1, #0x63
	bgt _080B1858
	ldr r0, _080B1850
	ldr r0, [r0]
	ldr r2, _080B1854
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B1858
	movs r0, #1
	b _080B185A
	.align 2, 0
_080B1850: .4byte 0x03005AEC
_080B1854: .4byte 0x000009CA
_080B1858:
	movs r0, #0
_080B185A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsFirstTrainerIdReadyForRematch

	thumb_func_start IsTrainerReadyForRematch_
IsTrainerReadyForRematch_: @ 0x080B1860
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl TrainerIdToRematchTableId
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080B1894
	cmp r1, #0x63
	bgt _080B1894
	ldr r0, _080B188C
	ldr r0, [r0]
	ldr r2, _080B1890
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B1894
	movs r0, #1
	b _080B1896
	.align 2, 0
_080B188C: .4byte 0x03005AEC
_080B1890: .4byte 0x000009CA
_080B1894:
	movs r0, #0
_080B1896:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsTrainerReadyForRematch_

	thumb_func_start GetRematchTrainerIdFromTable
GetRematchTrainerIdFromTable: @ 0x080B189C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FirstBattleTrainerIdToRematchTableId
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080B18C4
	movs r0, #0
	b _080B18EA
_080B18B6:
	subs r0, r6, #1
	lsls r0, r0, #1
	adds r0, r7, r0
	ldrh r0, [r0]
	b _080B18EA
_080B18C0:
	ldrh r0, [r5]
	b _080B18EA
_080B18C4:
	lsls r0, r1, #4
	adds r7, r4, r0
	movs r6, #1
	adds r5, r7, #2
	adds r4, r5, #0
_080B18CE:
	ldrh r0, [r4]
	cmp r0, #0
	beq _080B18B6
	bl HasTrainerBeenFought
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B18C0
	adds r4, #2
	adds r5, #2
	adds r6, #1
	cmp r6, #4
	ble _080B18CE
	ldrh r0, [r7, #8]
_080B18EA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetRematchTrainerIdFromTable

	thumb_func_start GetLastBeatenRematchTrainerIdFromTable
GetLastBeatenRematchTrainerIdFromTable: @ 0x080B18F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FirstBattleTrainerIdToRematchTableId
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080B191E
	movs r0, #0
	b _080B1940
_080B190A:
	subs r0, r5, #1
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	b _080B1940
_080B1914:
	subs r0, r5, #1
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	b _080B1940
_080B191E:
	lsls r0, r1, #4
	adds r6, r4, r0
	movs r5, #1
	adds r4, r6, #2
_080B1926:
	ldrh r0, [r4]
	cmp r0, #0
	beq _080B190A
	bl HasTrainerBeenFought
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1914
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _080B1926
	ldrh r0, [r6, #8]
_080B1940:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetLastBeatenRematchTrainerIdFromTable

	thumb_func_start ClearTrainerWantRematchState
ClearTrainerWantRematchState: @ 0x080B1948
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl TrainerIdToRematchTableId
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080B196A
	ldr r0, _080B1970
	ldr r0, [r0]
	ldr r2, _080B1974
	adds r0, r0, r2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_080B196A:
	pop {r0}
	bx r0
	.align 2, 0
_080B1970: .4byte 0x03005AEC
_080B1974: .4byte 0x000009CA
	thumb_func_end ClearTrainerWantRematchState

	thumb_func_start GetTrainerMatchCallFlag
GetTrainerMatchCallFlag: @ 0x080B1978
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	movs r4, #0xae
	lsls r4, r4, #1
	ldr r2, _080B1990
_080B1984:
	ldrh r0, [r2]
	cmp r0, r3
	bne _080B1994
	adds r0, r1, r4
	b _080B199E
	.align 2, 0
_080B1990: .4byte 0x0852AD40
_080B1994:
	adds r2, #0x10
	adds r1, #1
	cmp r1, #0x4d
	ble _080B1984
	ldr r0, _080B19A4
_080B199E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B19A4: .4byte 0x0000FFFF
	thumb_func_end GetTrainerMatchCallFlag

	thumb_func_start RegisterTrainerInMatchCall
RegisterTrainerInMatchCall: @ 0x080B19A8
	push {lr}
	ldr r0, _080B19D4
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B19CE
	ldr r0, _080B19D8
	ldrh r0, [r0]
	bl GetTrainerMatchCallFlag
	adds r1, r0, #0
	ldr r0, _080B19DC
	cmp r1, r0
	beq _080B19CE
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl FlagSet
_080B19CE:
	pop {r0}
	bx r0
	.align 2, 0
_080B19D4: .4byte 0x0000012F
_080B19D8: .4byte 0x0203886A
_080B19DC: .4byte 0x0000FFFF
	thumb_func_end RegisterTrainerInMatchCall

	thumb_func_start WasSecondRematchWon
WasSecondRematchWon: @ 0x080B19E0
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FirstBattleTrainerIdToRematchTableId
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080B1A0A
	lsls r0, r1, #4
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	bl HasTrainerBeenFought
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1A0A
	movs r0, #1
	b _080B1A0C
_080B1A0A:
	movs r0, #0
_080B1A0C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WasSecondRematchWon

	thumb_func_start HasAtLeastFiveBadges
HasAtLeastFiveBadges: @ 0x080B1A14
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0
	ldr r4, _080B1A34
_080B1A1C:
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B1A38
	adds r6, #1
	cmp r6, #4
	ble _080B1A38
	movs r0, #1
	b _080B1A42
	.align 2, 0
_080B1A34: .4byte 0x0852B220
_080B1A38:
	adds r4, #2
	adds r5, #1
	cmp r5, #7
	bls _080B1A1C
	movs r0, #0
_080B1A42:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end HasAtLeastFiveBadges

	thumb_func_start IncrementRematchStepCounter
IncrementRematchStepCounter: @ 0x080B1A48
	push {lr}
	bl HasAtLeastFiveBadges
	cmp r0, #0
	beq _080B1A70
	ldr r0, _080B1A64
	ldr r0, [r0]
	ldr r2, _080B1A68
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0xfe
	bls _080B1A6C
	movs r0, #0xff
	b _080B1A6E
	.align 2, 0
_080B1A64: .4byte 0x03005AEC
_080B1A68: .4byte 0x000009C8
_080B1A6C:
	adds r0, #1
_080B1A6E:
	strh r0, [r1]
_080B1A70:
	pop {r0}
	bx r0
	thumb_func_end IncrementRematchStepCounter

	thumb_func_start IsRematchStepCounterMaxed
IsRematchStepCounterMaxed: @ 0x080B1A74
	push {lr}
	bl HasAtLeastFiveBadges
	cmp r0, #0
	beq _080B1A98
	ldr r0, _080B1A90
	ldr r0, [r0]
	ldr r1, _080B1A94
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xfe
	bls _080B1A98
	movs r0, #1
	b _080B1A9A
	.align 2, 0
_080B1A90: .4byte 0x03005AEC
_080B1A94: .4byte 0x000009C8
_080B1A98:
	movs r0, #0
_080B1A9A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsRematchStepCounterMaxed

	thumb_func_start TryUpdateRandomTrainerRematches
TryUpdateRandomTrainerRematches: @ 0x080B1AA0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	bl IsRematchStepCounterMaxed
	cmp r0, #0
	beq _080B1ACC
	ldr r0, _080B1AD4
	adds r1, r5, #0
	adds r2, r4, #0
	bl UpdateRandomTrainerRematches
	cmp r0, #1
	bne _080B1ACC
	ldr r0, _080B1AD8
	ldr r0, [r0]
	ldr r1, _080B1ADC
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_080B1ACC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1AD4: .4byte 0x0852AD40
_080B1AD8: .4byte 0x03005AEC
_080B1ADC: .4byte 0x000009C8
	thumb_func_end TryUpdateRandomTrainerRematches

	thumb_func_start DoesSomeoneWantRematchIn
DoesSomeoneWantRematchIn: @ 0x080B1AE0
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080B1AFC
	adds r1, r3, #0
	bl DoesSomeoneWantRematchIn_
	pop {r1}
	bx r1
	.align 2, 0
_080B1AFC: .4byte 0x0852AD40
	thumb_func_end DoesSomeoneWantRematchIn

	thumb_func_start IsRematchTrainerIn
IsRematchTrainerIn: @ 0x080B1B00
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080B1B1C
	adds r1, r3, #0
	bl IsRematchTrainerIn_
	pop {r1}
	bx r1
	.align 2, 0
_080B1B1C: .4byte 0x0852AD40
	thumb_func_end IsRematchTrainerIn

	thumb_func_start GetRematchTrainerId
GetRematchTrainerId: @ 0x080B1B20
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _080B1B38
	bl GetRematchTrainerIdFromTable
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080B1B38: .4byte 0x0852AD40
	thumb_func_end GetRematchTrainerId

	thumb_func_start GetLastBeatenRematchTrainerId
GetLastBeatenRematchTrainerId: @ 0x080B1B3C
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _080B1B54
	bl GetLastBeatenRematchTrainerIdFromTable
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080B1B54: .4byte 0x0852AD40
	thumb_func_end GetLastBeatenRematchTrainerId

	thumb_func_start ShouldTryRematchBattle
ShouldTryRematchBattle: @ 0x080B1B58
	push {r4, r5, lr}
	ldr r5, _080B1B7C
	ldr r4, _080B1B80
	ldrh r1, [r4]
	adds r0, r5, #0
	bl IsFirstTrainerIdReadyForRematch
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B1B84
	ldrh r1, [r4]
	adds r0, r5, #0
	bl WasSecondRematchWon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B1B86
	.align 2, 0
_080B1B7C: .4byte 0x0852AD40
_080B1B80: .4byte 0x0203886A
_080B1B84:
	movs r0, #1
_080B1B86:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ShouldTryRematchBattle

	thumb_func_start IsTrainerReadyForRematch
IsTrainerReadyForRematch: @ 0x080B1B8C
	push {lr}
	ldr r0, _080B1BA0
	ldr r1, _080B1BA4
	ldrh r1, [r1]
	bl IsTrainerReadyForRematch_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080B1BA0: .4byte 0x0852AD40
_080B1BA4: .4byte 0x0203886A
	thumb_func_end IsTrainerReadyForRematch

	thumb_func_start HandleRematchVarsOnBattleEnd
HandleRematchVarsOnBattleEnd: @ 0x080B1BA8
	push {lr}
	ldr r0, _080B1BBC
	ldr r1, _080B1BC0
	ldrh r1, [r1]
	bl ClearTrainerWantRematchState
	bl SetBattledTrainersFlags
	pop {r0}
	bx r0
	.align 2, 0
_080B1BBC: .4byte 0x0852AD40
_080B1BC0: .4byte 0x0203886A
	thumb_func_end HandleRematchVarsOnBattleEnd

	thumb_func_start ShouldTryGetTrainerScript
ShouldTryGetTrainerScript: @ 0x080B1BC4
	push {lr}
	ldr r1, _080B1BE0
	ldrb r0, [r1]
	cmp r0, #1
	bls _080B1BEC
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080B1BE4
	movs r0, #1
	strb r0, [r1]
	ldr r1, _080B1BE8
	movs r0, #1
	b _080B1BF6
	.align 2, 0
_080B1BE0: .4byte 0x02038899
_080B1BE4: .4byte 0x02038898
_080B1BE8: .4byte 0x02037290
_080B1BEC:
	ldr r1, _080B1BFC
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080B1C00
	movs r0, #0
_080B1BF6:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B1BFC: .4byte 0x02038898
_080B1C00: .4byte 0x02037290
	thumb_func_end ShouldTryGetTrainerScript

	thumb_func_start CountBattledRematchTeams
CountBattledRematchTeams: @ 0x080B1C04
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	ldr r7, _080B1C20
	lsrs r4, r0, #0xc
	adds r6, r4, r7
	ldrh r0, [r6]
	bl HasTrainerBeenFought
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B1C24
	movs r0, #0
	b _080B1C50
	.align 2, 0
_080B1C20: .4byte 0x0852AD40
_080B1C24:
	movs r5, #1
	adds r0, r4, #2
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, #0
	beq _080B1C4C
	adds r4, r6, #2
_080B1C32:
	ldrh r0, [r4]
	bl HasTrainerBeenFought
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1C4C
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	bgt _080B1C4C
	ldrh r0, [r4]
	cmp r0, #0
	bne _080B1C32
_080B1C4C:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
_080B1C50:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CountBattledRematchTeams

