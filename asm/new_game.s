.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetTrainerId
SetTrainerId: @ 0x08083C54
	strb r0, [r1]
	lsrs r2, r0, #8
	strb r2, [r1, #1]
	lsrs r2, r0, #0x10
	strb r2, [r1, #2]
	lsrs r0, r0, #0x18
	strb r0, [r1, #3]
	bx lr
	thumb_func_end SetTrainerId

	thumb_func_start GetTrainerId
GetTrainerId: @ 0x08083C64
	adds r2, r0, #0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	ldrb r1, [r2, #2]
	lsls r1, r1, #0x10
	orrs r0, r1
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	orrs r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	bx lr
	thumb_func_end GetTrainerId

	thumb_func_start CopyTrainerId
CopyTrainerId: @ 0x08083C7C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r2, #0
_08083C84:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _08083C84
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CopyTrainerId

	thumb_func_start InitPlayerTrainerId
InitPlayerTrainerId: @ 0x08083C98
	push {r4, lr}
	bl Random
	adds r4, r0, #0
	bl GetGeneratedTrainerIdLower
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r4, r0
	ldr r0, _08083CC0
	ldr r1, [r0]
	adds r1, #0xa
	adds r0, r4, #0
	bl SetTrainerId
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083CC0: .4byte 0x03005AF0
	thumb_func_end InitPlayerTrainerId

	thumb_func_start SetDefaultOptions
SetDefaultOptions: @ 0x08083CC4
	ldr r3, _08083D14
	ldr r2, [r3]
	ldrb r1, [r2, #0x14]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldr r2, [r3]
	ldrb r1, [r2, #0x14]
	movs r0, #7
	ands r0, r1
	strb r0, [r2, #0x14]
	ldr r2, [r3]
	ldrb r1, [r2, #0x15]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	ldr r2, [r3]
	ldrb r1, [r2, #0x15]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	ldr r2, [r3]
	ldrb r1, [r2, #0x15]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	ldr r2, [r3]
	ldrb r1, [r2, #0x15]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	bx lr
	.align 2, 0
_08083D14: .4byte 0x03005AF0
	thumb_func_end SetDefaultOptions

	thumb_func_start ClearPokedexFlags
ClearPokedexFlags: @ 0x08083D18
	push {r4, lr}
	ldr r1, _08083D40
	movs r0, #0
	strb r0, [r1]
	ldr r4, _08083D44
	ldr r0, [r4]
	adds r0, #0x28
	movs r1, #0
	movs r2, #0x34
	bl memset
	ldr r0, [r4]
	adds r0, #0x5c
	movs r1, #0
	movs r2, #0x34
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083D40: .4byte 0x03005E10
_08083D44: .4byte 0x03005AF0
	thumb_func_end ClearPokedexFlags

	thumb_func_start ClearAllContestWinnerPics
ClearAllContestWinnerPics: @ 0x08083D48
	push {r4, r5, r6, r7, lr}
	bl ClearContestWinnerPicsInContestHall
	movs r2, #8
	ldr r0, _08083D7C
	mov ip, r0
	ldr r4, _08083D80
	ldr r3, _08083D84
_08083D58:
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r2, #5
	adds r0, r0, r1
	adds r0, r0, r4
	adds r1, r3, #0
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6}
	stm r0!, {r5, r6}
	adds r2, #1
	cmp r2, #0xc
	ble _08083D58
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083D7C: .4byte 0x03005AEC
_08083D80: .4byte 0x00002E90
_08083D84: .4byte 0x0830FC68
	thumb_func_end ClearAllContestWinnerPics

	thumb_func_start ClearFrontierRecord
ClearFrontierRecord: @ 0x08083D88
	push {r4, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r4, _08083DC0
	ldr r1, [r4]
	ldr r0, _08083DC4
	adds r1, r1, r0
	ldr r2, _08083DC8
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	ldr r1, _08083DCC
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _08083DD0
	adds r0, r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083DC0: .4byte 0x03005AF0
_08083DC4: .4byte 0x0000064C
_08083DC8: .4byte 0x05000238
_08083DCC: .4byte 0x00000EE1
_08083DD0: .4byte 0x00000EE9
	thumb_func_end ClearFrontierRecord

	thumb_func_start WarpToTruck
WarpToTruck: @ 0x08083DD4
	push {lr}
	sub sp, #4
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [sp]
	movs r0, #0x19
	movs r1, #0x28
	adds r2, r3, #0
	bl SetWarpDestination
	bl WarpIntoMap
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WarpToTruck

	thumb_func_start Sav2_ClearSetDefault
Sav2_ClearSetDefault: @ 0x08083DF4
	push {lr}
	bl ClearSav1
	bl SetDefaultOptions
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Sav2_ClearSetDefault

	thumb_func_start ResetMenuAndMonGlobals
ResetMenuAndMonGlobals: @ 0x08083E04
	push {lr}
	ldr r1, _08083E24
	movs r0, #0
	strb r0, [r1]
	bl ResetPokedexScrollPositions
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	bl ResetBagScrollPositions
	bl sub_0813628C
	pop {r0}
	bx r0
	.align 2, 0
_08083E24: .4byte 0x02031F74
	thumb_func_end ResetMenuAndMonGlobals

	thumb_func_start NewGameInitData
NewGameInitData: @ 0x08083E28
	push {r4, r5, lr}
	ldr r0, _08083F34
	ldrh r0, [r0]
	cmp r0, #0
	beq _08083E36
	cmp r0, #2
	bne _08083E3A
_08083E36:
	bl RtcReset
_08083E3A:
	ldr r1, _08083F38
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08083F3C
	ldr r0, [r4]
	adds r0, #0xac
	movs r5, #0
	str r5, [r0]
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	bl ResetPokedex
	bl ClearFrontierRecord
	bl ClearSav2
	bl ClearMailData
	ldr r0, [r4]
	strb r5, [r0, #9]
	ldr r0, [r4]
	adds r0, #0xa8
	str r5, [r0]
	bl InitPlayerTrainerId
	bl PlayTimeCounter_Reset
	bl ClearPokedexFlags
	bl InitEventData
	bl ClearTVShowData
	bl ResetGabbyAndTy
	bl ClearSecretBases
	bl ClearBerryTrees
	ldr r4, _08083F40
	ldr r0, [r4]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r1, _08083F44
	bl SetMoney
	movs r0, #0
	bl SetCoins
	bl ResetLinkContestBoolean
	bl ResetGameStats
	bl ClearAllContestWinnerPics
	bl ClearPlayerLinkBattleRecords
	bl sub_080FA2EC
	bl sub_080FA344
	ldr r0, _08083F48
	strb r5, [r0]
	bl ZeroPlayerPartyMons
	bl ResetPokemonStorageSystem
	bl ClearRoamerData
	bl ClearRoamerLocationData
	ldr r0, [r4]
	ldr r1, _08083F4C
	adds r0, r0, r1
	strh r5, [r0]
	bl ClearBag
	bl NewGameInitPCItems
	bl sub_08136EF8
	bl ClearDecorationInventories
	bl InitEasyChatPhrases
	bl SetMauvilleOldMan
	bl InitDewfordTrend
	bl ResetFanClub
	bl ResetLotteryCorner
	bl WarpToTruck
	ldr r0, _08083F50
	bl ScriptContext2_RunNewScript
	bl ResetMiniGamesResults
	bl copy_strings_to_sav1
	bl SetLilycoveLady
	bl ResetAllApprenticeData
	bl ClearRankingHallRecords
	bl InitMatchCallCounters
	bl sub_0801AAAC
	bl WipeTrainerNameRecords
	bl ResetTrainerHillResults
	bl ResetContestLinkResults
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083F34: .4byte 0x03005F50
_08083F38: .4byte 0x02031F74
_08083F3C: .4byte 0x03005AF0
_08083F40: .4byte 0x03005AEC
_08083F44: .4byte 0x00000BB8
_08083F48: .4byte 0x0202418D
_08083F4C: .4byte 0x00000496
_08083F50: .4byte 0x08242678
	thumb_func_end NewGameInitData

	thumb_func_start ResetMiniGamesResults
ResetMiniGamesResults: @ 0x08083F54
	push {r4, r5, r6, lr}
	sub sp, #4
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r4, _08083FA0
	ldr r1, [r4]
	movs r0, #0xf6
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r6, _08083FA4
	mov r0, sp
	adds r2, r6, #0
	bl CpuSet
	ldr r0, [r4]
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0
	bl SetBerryPowder
	bl ResetPokeJumpResults
	mov r0, sp
	adds r0, #2
	strh r5, [r0]
	ldr r1, [r4]
	movs r2, #0x83
	lsls r2, r2, #2
	adds r1, r1, r2
	adds r2, r6, #0
	bl CpuSet
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08083FA0: .4byte 0x03005AF0
_08083FA4: .4byte 0x01000008
	thumb_func_end ResetMiniGamesResults

