.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start RecordMixingPlayerSpotTriggered
RecordMixingPlayerSpotTriggered: @ 0x080E63C4
	push {lr}
	ldr r0, _080E63D0
	bl sub_080B2F30
	pop {r0}
	bx r0
	.align 2, 0
_080E63D0: .4byte 0x080E6935
	thumb_func_end RecordMixingPlayerSpotTriggered

	thumb_func_start SetSrcLookupPointers
SetSrcLookupPointers: @ 0x080E63D4
	push {r4, lr}
	ldr r2, _080E642C
	ldr r0, _080E6430
	ldr r1, [r0]
	ldr r3, _080E6434
	adds r0, r1, r3
	str r0, [r2]
	ldr r2, _080E6438
	ldr r4, _080E643C
	adds r0, r1, r4
	str r0, [r2]
	ldr r2, _080E6440
	ldr r3, _080E6444
	adds r0, r1, r3
	str r0, [r2]
	ldr r2, _080E6448
	ldr r4, _080E644C
	adds r0, r1, r4
	str r0, [r2]
	ldr r2, _080E6450
	ldr r3, _080E6454
	adds r0, r1, r3
	str r0, [r2]
	ldr r2, _080E6458
	ldr r0, _080E645C
	str r0, [r2]
	ldr r2, _080E6460
	ldr r0, _080E6464
	ldr r0, [r0]
	ldr r4, _080E6468
	adds r3, r0, r4
	str r3, [r2]
	ldr r2, _080E646C
	ldr r4, _080E6470
	adds r1, r1, r4
	str r1, [r2]
	ldr r1, _080E6474
	adds r0, #0xdc
	str r0, [r1]
	ldr r0, _080E6478
	str r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E642C: .4byte 0x03001134
_080E6430: .4byte 0x03005AEC
_080E6434: .4byte 0x00001A9C
_080E6438: .4byte 0x03001138
_080E643C: .4byte 0x000027CC
_080E6440: .4byte 0x0300113C
_080E6444: .4byte 0x00002B50
_080E6448: .4byte 0x03001140
_080E644C: .4byte 0x00002E28
_080E6450: .4byte 0x03001144
_080E6454: .4byte 0x00002E68
_080E6458: .4byte 0x03001148
_080E645C: .4byte 0x02039C3C
_080E6460: .4byte 0x0300114C
_080E6464: .4byte 0x03005AF0
_080E6468: .4byte 0x0000064C
_080E646C: .4byte 0x03001150
_080E6470: .4byte 0x00003B58
_080E6474: .4byte 0x03001154
_080E6478: .4byte 0x03001158
	thumb_func_end SetSrcLookupPointers

	thumb_func_start PrepareUnknownExchangePacket
PrepareUnknownExchangePacket: @ 0x080E647C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080E6500
	ldr r1, [r0]
	movs r4, #0xc8
	lsls r4, r4, #4
	adds r0, r5, #0
	adds r2, r4, #0
	bl memcpy
	adds r4, r5, r4
	ldr r0, _080E6504
	ldr r1, [r0]
	movs r2, #0xe1
	lsls r2, r2, #2
	adds r0, r4, #0
	bl memcpy
	adds r0, r4, #0
	bl sub_080F1CE4
	ldr r1, _080E6508
	adds r0, r5, r1
	ldr r1, _080E650C
	ldr r1, [r1]
	movs r2, #0x40
	bl memcpy
	ldr r2, _080E6510
	adds r0, r5, r2
	ldr r1, _080E6514
	ldr r1, [r1]
	movs r2, #0x40
	bl memcpy
	ldr r1, _080E6518
	adds r0, r5, r1
	ldr r1, _080E651C
	ldr r1, [r1]
	movs r2, #0x28
	bl memcpy
	ldr r2, _080E6520
	adds r0, r5, r2
	bl sub_080E81E0
	ldr r0, _080E6524
	ldr r0, [r0]
	ldr r2, _080E6528
	adds r1, r5, r2
	bl EmeraldBattleTowerRecordToRuby
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E64F8
	bl GetRecordMixingGift
	ldr r2, _080E652C
	adds r1, r5, r2
	strh r0, [r1]
_080E64F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E6500: .4byte 0x03001134
_080E6504: .4byte 0x03001138
_080E6508: .4byte 0x00001004
_080E650C: .4byte 0x0300113C
_080E6510: .4byte 0x00001044
_080E6514: .4byte 0x03001140
_080E6518: .4byte 0x00001084
_080E651C: .4byte 0x03001144
_080E6520: .4byte 0x000010AC
_080E6524: .4byte 0x0300114C
_080E6528: .4byte 0x00001124
_080E652C: .4byte 0x000011C8
	thumb_func_end PrepareUnknownExchangePacket

	thumb_func_start PrepareExchangePacketForRubySapphire
PrepareExchangePacketForRubySapphire: @ 0x080E6530
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080E65D4
	ldr r1, [r0]
	movs r4, #0xc8
	lsls r4, r4, #4
	adds r0, r5, #0
	adds r2, r4, #0
	bl memcpy
	adds r0, r5, #0
	bl ClearJapaneseSecretBases
	adds r4, r5, r4
	ldr r0, _080E65D8
	ldr r1, [r0]
	movs r2, #0xe1
	lsls r2, r2, #2
	adds r0, r4, #0
	bl memcpy
	adds r0, r4, #0
	movs r1, #2
	bl sub_080F1A40
	ldr r1, _080E65DC
	adds r0, r5, r1
	ldr r1, _080E65E0
	ldr r1, [r1]
	movs r2, #0x40
	bl memcpy
	ldr r2, _080E65E4
	adds r4, r5, r2
	ldr r0, _080E65E8
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	adds r0, r4, #0
	bl StorytellerDisplayStory
	ldr r1, _080E65EC
	adds r0, r5, r1
	ldr r1, _080E65F0
	ldr r1, [r1]
	movs r2, #0x28
	bl memcpy
	ldr r2, _080E65F4
	adds r4, r5, r2
	adds r0, r4, #0
	bl sub_080E81E0
	adds r0, r4, #0
	bl SanitizeEmeraldBattleTowerRecord
	ldr r0, _080E65F8
	adds r4, r5, r0
	ldr r0, _080E65FC
	ldr r1, [r0]
	adds r0, r4, #0
	bl EmeraldBattleTowerRecordToRuby
	adds r0, r4, #0
	bl sub_080E8290
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E65CC
	bl GetRecordMixingGift
	ldr r2, _080E6600
	adds r1, r5, r2
	strh r0, [r1]
_080E65CC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E65D4: .4byte 0x03001134
_080E65D8: .4byte 0x03001138
_080E65DC: .4byte 0x00001004
_080E65E0: .4byte 0x0300113C
_080E65E4: .4byte 0x00001044
_080E65E8: .4byte 0x03001140
_080E65EC: .4byte 0x00001084
_080E65F0: .4byte 0x03001144
_080E65F4: .4byte 0x000010AC
_080E65F8: .4byte 0x00001124
_080E65FC: .4byte 0x0300114C
_080E6600: .4byte 0x000011C8
	thumb_func_end PrepareExchangePacketForRubySapphire

	thumb_func_start PrepareExchangePacket
PrepareExchangePacket: @ 0x080E6604
	push {r4, r5, lr}
	bl SetPlayerSecretBaseParty
	bl sub_080F1694
	bl SetSrcLookupPointers
	bl Link_AnyPartnersPlayingRubyOrSapphire
	cmp r0, #0
	beq _080E6640
	bl sub_08009BD4
	cmp r0, #0
	bne _080E6630
	ldr r0, _080E662C
	ldr r0, [r0]
	bl PrepareUnknownExchangePacket
	b _080E66EA
	.align 2, 0
_080E662C: .4byte 0x02039CB8
_080E6630:
	ldr r0, _080E663C
	ldr r0, [r0]
	bl PrepareExchangePacketForRubySapphire
	b _080E66EA
	.align 2, 0
_080E663C: .4byte 0x02039CB8
_080E6640:
	ldr r5, _080E66F0
	ldr r0, [r5]
	ldr r1, _080E66F4
	ldr r1, [r1]
	movs r4, #0xc8
	lsls r4, r4, #4
	adds r2, r4, #0
	bl memcpy
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _080E66F8
	ldr r1, [r1]
	movs r2, #0xe1
	lsls r2, r2, #2
	bl memcpy
	ldr r0, [r5]
	ldr r1, _080E66FC
	adds r0, r0, r1
	ldr r1, _080E6700
	ldr r1, [r1]
	movs r2, #0x40
	bl memcpy
	ldr r0, [r5]
	ldr r2, _080E6704
	adds r0, r0, r2
	ldr r1, _080E6708
	ldr r1, [r1]
	movs r2, #0x40
	bl memcpy
	ldr r0, [r5]
	ldr r1, _080E670C
	adds r0, r0, r1
	ldr r1, _080E6710
	ldr r1, [r1]
	movs r2, #0x40
	bl memcpy
	ldr r0, [r5]
	ldr r2, _080E6714
	adds r0, r0, r2
	ldr r1, _080E6718
	ldr r1, [r1]
	movs r2, #0x28
	bl memcpy
	ldr r0, [r5]
	ldr r1, _080E671C
	adds r0, r0, r1
	bl sub_080E81E0
	ldr r0, [r5]
	ldr r2, _080E6720
	adds r0, r0, r2
	ldr r1, _080E6724
	ldr r1, [r1]
	movs r2, #0xec
	bl memcpy
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E66D2
	bl GetRecordMixingGift
	ldr r1, [r5]
	ldr r2, _080E6728
	adds r1, r1, r2
	strh r0, [r1]
_080E66D2:
	ldr r0, [r5]
	ldr r1, _080E672C
	adds r0, r0, r1
	ldr r1, _080E6730
	ldr r1, [r1]
	bl sub_080E78F8
	ldr r0, [r5]
	ldr r2, _080E6734
	adds r0, r0, r2
	bl GetPlayerHallRecords
_080E66EA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E66F0: .4byte 0x02039CB8
_080E66F4: .4byte 0x03001134
_080E66F8: .4byte 0x03001138
_080E66FC: .4byte 0x00001004
_080E6700: .4byte 0x0300113C
_080E6704: .4byte 0x00001044
_080E6708: .4byte 0x03001140
_080E670C: .4byte 0x00001214
_080E6710: .4byte 0x03001150
_080E6714: .4byte 0x00001084
_080E6718: .4byte 0x03001144
_080E671C: .4byte 0x000010AC
_080E6720: .4byte 0x00001124
_080E6724: .4byte 0x0300114C
_080E6728: .4byte 0x00001210
_080E672C: .4byte 0x00001254
_080E6730: .4byte 0x03001154
_080E6734: .4byte 0x000012DC
	thumb_func_end PrepareExchangePacket

	thumb_func_start ReceiveExchangePacket
ReceiveExchangePacket: @ 0x080E6738
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	bl Link_AnyPartnersPlayingRubyOrSapphire
	cmp r0, #0
	beq _080E67EC
	ldr r5, _080E67CC
	ldr r0, [r5]
	movs r1, #0xc8
	lsls r1, r1, #4
	mov r8, r1
	add r0, r8
	bl sub_080E72FC
	ldr r0, [r5]
	ldr r6, _080E67D0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveSecretBasesData
	ldr r3, [r5]
	ldr r1, _080E67D4
	adds r0, r3, r1
	add r3, r8
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveDaycareMailData
	ldr r0, [r5]
	ldr r1, _080E67D8
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveBattleTowerData
	ldr r0, [r5]
	add r0, r8
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveTvShowsData
	ldr r0, [r5]
	ldr r1, _080E67DC
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceivePokeNewsData
	ldr r0, [r5]
	ldr r1, _080E67E0
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveOldManData
	ldr r0, [r5]
	ldr r1, _080E67E4
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveEasyChatPairsData
	ldr r0, [r5]
	ldr r1, _080E67E8
	adds r0, r0, r1
	adds r1, r4, #0
	bl ReceiveGiftItem
	b _080E6896
	.align 2, 0
_080E67CC: .4byte 0x02039CB4
_080E67D0: .4byte 0x00001230
_080E67D4: .4byte 0x000010AC
_080E67D8: .4byte 0x00001124
_080E67DC: .4byte 0x00001004
_080E67E0: .4byte 0x00001044
_080E67E4: .4byte 0x00001084
_080E67E8: .4byte 0x000011C8
_080E67EC:
	ldr r5, _080E68A0
	ldr r0, [r5]
	movs r1, #0xc8
	lsls r1, r1, #4
	mov r8, r1
	add r0, r8
	bl sub_080E72FC
	ldr r0, [r5]
	ldr r6, _080E68A4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveSecretBasesData
	ldr r0, [r5]
	add r0, r8
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveTvShowsData
	ldr r0, [r5]
	ldr r1, _080E68A8
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceivePokeNewsData
	ldr r0, [r5]
	ldr r1, _080E68AC
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveOldManData
	ldr r0, [r5]
	ldr r1, _080E68B0
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveEasyChatPairsData
	ldr r3, [r5]
	ldr r1, _080E68B4
	adds r0, r3, r1
	add r3, r8
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveDaycareMailData
	ldr r0, [r5]
	ldr r1, _080E68B8
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveBattleTowerData
	ldr r0, [r5]
	ldr r1, _080E68BC
	adds r0, r0, r1
	adds r1, r4, #0
	bl ReceiveGiftItem
	ldr r0, [r5]
	ldr r1, _080E68C0
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveLilycoveLadyData
	ldr r0, [r5]
	ldr r1, _080E68C4
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveApprenticeData
	ldr r0, [r5]
	ldr r1, _080E68C8
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReceiveRankingHallRecords
_080E6896:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E68A0: .4byte 0x02039CB4
_080E68A4: .4byte 0x00001444
_080E68A8: .4byte 0x00001004
_080E68AC: .4byte 0x00001044
_080E68B0: .4byte 0x00001084
_080E68B4: .4byte 0x000010AC
_080E68B8: .4byte 0x00001124
_080E68BC: .4byte 0x00001210
_080E68C0: .4byte 0x00001214
_080E68C4: .4byte 0x00001254
_080E68C8: .4byte 0x000012DC
	thumb_func_end ReceiveExchangePacket

	thumb_func_start PrintTextOnRecordMixing
PrintTextOnRecordMixing: @ 0x080E68CC
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PrintTextOnRecordMixing

	thumb_func_start Task_RecordMixing_SoundEffect
Task_RecordMixing_SoundEffect: @ 0x080E6900
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080E6930
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	bne _080E6928
	movs r0, #0xe2
	bl PlaySE
	movs r0, #0
	strh r0, [r4, #8]
_080E6928:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6930: .4byte 0x03005B60
	thumb_func_end Task_RecordMixing_SoundEffect

	thumb_func_start Task_RecordMixing_Main
Task_RecordMixing_Main: @ 0x080E6934
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080E6958
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #5
	bls _080E694E
	b _080E6AE2
_080E694E:
	lsls r0, r0, #2
	ldr r1, _080E695C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6958: .4byte 0x03005B68
_080E695C: .4byte 0x080E6960
_080E6960: @ jump table
	.4byte _080E6978 @ case 0
	.4byte _080E69F0 @ case 1
	.4byte _080E6A24 @ case 2
	.4byte _080E6A44 @ case 3
	.4byte _080E6A84 @ case 4
	.4byte _080E6A98 @ case 5
_080E6978:
	ldr r4, _080E69D0
	ldr r0, _080E69D4
	bl Alloc
	str r0, [r4]
	ldr r4, _080E69D8
	ldr r0, _080E69DC
	bl Alloc
	str r0, [r4]
	ldr r0, _080E69E0
	ldrb r0, [r0]
	bl SetLocalLinkPlayerId
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #1
	bl VarSet
	ldr r1, _080E69E4
	movs r0, #0
	strb r0, [r1]
	bl PrepareExchangePacket
	bl CreateRecordMixingSprite
	movs r0, #1
	strh r0, [r5]
	ldr r0, _080E69E8
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x14]
	ldr r0, _080E69EC
	movs r1, #0x51
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x1e]
	b _080E6AE2
	.align 2, 0
_080E69D0: .4byte 0x02039CB8
_080E69D4: .4byte 0x00001444
_080E69D8: .4byte 0x02039CB4
_080E69DC: .4byte 0x00005110
_080E69E0: .4byte 0x02037282
_080E69E4: .4byte 0x03001130
_080E69E8: .4byte 0x080E6AFD
_080E69EC: .4byte 0x080E6901
_080E69F0:
	ldr r2, _080E6A1C
	movs r0, #0x14
	ldrsh r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080E6AE2
	movs r0, #2
	strh r0, [r5]
	ldr r0, _080E6A20
	bl FlagSet
	bl DestroyRecordMixingSprite
	ldrb r0, [r5, #0x1e]
	bl DestroyTask
	b _080E6AE2
	.align 2, 0
_080E6A1C: .4byte 0x03005B60
_080E6A20: .4byte 0x00000894
_080E6A24:
	ldr r0, _080E6A40
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x14]
	movs r0, #3
	strh r0, [r5]
	movs r0, #0xe0
	bl PlaySE
	b _080E6AE2
	.align 2, 0
_080E6A40: .4byte 0x080E77E1
_080E6A44:
	ldr r2, _080E6A78
	movs r0, #0x14
	ldrsh r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r4, [r0, #4]
	cmp r4, #0
	bne _080E6AE2
	movs r0, #4
	strh r0, [r5]
	ldr r0, _080E6A7C
	ldrb r0, [r0]
	cmp r0, #0
	bne _080E6A6E
	bl sub_080B27FC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x14]
_080E6A6E:
	ldr r0, _080E6A80
	bl PrintTextOnRecordMixing
	strh r4, [r5, #0x10]
	b _080E6AE2
	.align 2, 0
_080E6A78: .4byte 0x03005B60
_080E6A7C: .4byte 0x0300319C
_080E6A80: .4byte 0x08566CB1
_080E6A84:
	ldrh r0, [r5, #0x10]
	adds r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _080E6AE2
	movs r0, #5
	strh r0, [r5]
	b _080E6AE2
_080E6A98:
	ldr r2, _080E6AE8
	movs r0, #0x14
	ldrsh r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080E6AE2
	ldr r0, _080E6AEC
	ldr r0, [r0]
	bl Free
	ldr r0, _080E6AF0
	ldr r0, [r0]
	bl Free
	bl sub_08086C00
	ldr r0, _080E6AF4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E6AD0
	ldr r0, _080E6AF8
	movs r1, #0xa
	bl CreateTask
_080E6AD0:
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_080E6AE2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E6AE8: .4byte 0x03005B60
_080E6AEC: .4byte 0x02039CB4
_080E6AF0: .4byte 0x02039CB8
_080E6AF4: .4byte 0x0300319C
_080E6AF8: .4byte 0x080AEBB1
	thumb_func_end Task_RecordMixing_Main

	thumb_func_start Task_MixingRecordsRecv
Task_MixingRecordsRecv: @ 0x080E6AFC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r6, _080E6B28
	adds r5, r0, r6
	movs r0, #8
	ldrsh r1, [r5, r0]
	cmp r1, #0x64
	beq _080E6B78
	cmp r1, #0x64
	bgt _080E6B3A
	cmp r1, #1
	bne _080E6B1E
	b _080E6C3C
_080E6B1E:
	cmp r1, #1
	bgt _080E6B2C
	cmp r1, #0
	beq _080E6B5C
	b _080E6D3E
	.align 2, 0
_080E6B28: .4byte 0x03005B60
_080E6B2C:
	cmp r1, #2
	bne _080E6B32
	b _080E6C68
_080E6B32:
	cmp r1, #5
	bne _080E6B38
	b _080E6D28
_080E6B38:
	b _080E6D3E
_080E6B3A:
	cmp r1, #0xc9
	beq _080E6BD0
	cmp r1, #0xc9
	bgt _080E6B48
	cmp r1, #0x65
	beq _080E6B90
	b _080E6D3E
_080E6B48:
	ldr r0, _080E6B58
	cmp r1, r0
	beq _080E6C0A
	adds r0, #0x63
	cmp r1, r0
	beq _080E6C22
	b _080E6D3E
	.align 2, 0
_080E6B58: .4byte 0x0000012D
_080E6B5C:
	ldr r0, _080E6B74
	bl PrintTextOnRecordMixing
	movs r0, #0xe1
	lsls r0, r0, #3
	strh r0, [r5, #0x18]
	movs r0, #0xc8
	lsls r0, r0, #1
	strh r0, [r5, #8]
	bl ClearLinkCallback_2
	b _080E6D3E
	.align 2, 0
_080E6B74: .4byte 0x08566CA4
_080E6B78:
	ldrh r0, [r5, #0x20]
	adds r0, #1
	strh r0, [r5, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bgt _080E6B88
	b _080E6D3E
_080E6B88:
	movs r0, #0
	strh r0, [r5, #0x20]
	movs r0, #0x65
	b _080E6D3C
_080E6B90:
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsLinkMaster
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E6BC2
	bl GetSavedPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	beq _080E6BB2
	b _080E6D3E
_080E6BB2:
	movs r0, #0x15
	bl PlaySE
	movs r1, #0
	movs r0, #0xc9
	strh r0, [r5, #8]
	strh r1, [r5, #0x20]
	b _080E6D3E
_080E6BC2:
	movs r0, #0x16
	bl PlaySE
	ldr r0, _080E6BCC
	b _080E6D3C
	.align 2, 0
_080E6BCC: .4byte 0x0000012D
_080E6BD0:
	bl GetSavedPlayerCount
	adds r4, r0, #0
	bl GetLinkPlayerCount_2
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _080E6BE4
	b _080E6D3E
_080E6BE4:
	ldrh r4, [r5, #0x20]
	adds r4, #1
	strh r4, [r5, #0x20]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	cmp r4, r1
	bgt _080E6C02
	b _080E6D3E
_080E6C02:
	bl CheckShouldAdvanceLinkState
	movs r0, #1
	b _080E6D3C
_080E6C0A:
	bl GetSavedPlayerCount
	adds r4, r0, #0
	bl GetLinkPlayerCount_2
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _080E6C1E
	b _080E6D3E
_080E6C1E:
	movs r0, #1
	b _080E6D3C
_080E6C22:
	ldrh r0, [r5, #0x20]
	adds r0, #1
	strh r0, [r5, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bgt _080E6C32
	b _080E6D3E
_080E6C32:
	movs r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0x20]
	b _080E6D3E
_080E6C3C:
	ldr r0, _080E6C60
	ldrb r0, [r0]
	cmp r0, #0
	bne _080E6C46
	b _080E6D3E
_080E6C46:
	ldr r4, _080E6C64
	bl GetMultiplayerId_
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r0, #5
	b _080E6D3C
	.align 2, 0
_080E6C60: .4byte 0x030031C4
_080E6C64: .4byte 0x02021C40
_080E6C68:
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	strh r0, [r5, #0x14]
	strh r1, [r5, #8]
	bl GetMultiplayerId_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x12]
	ldr r0, _080E6CC4
	str r0, [r5]
	bl Link_AnyPartnersPlayingRubyOrSapphire
	cmp r0, #0
	beq _080E6CDC
	ldr r0, _080E6CC8
	ldr r0, [r0]
	adds r1, r5, #0
	adds r1, #0xc
	bl StorePtrInTaskData
	ldr r0, _080E6CCC
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x1c]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r0, r1, r6
	strh r4, [r0, #8]
	ldr r0, _080E6CD0
	ldr r0, [r0]
	adds r1, r6, r1
	adds r1, #0x12
	bl StorePtrInTaskData
	ldr r1, _080E6CD4
	ldr r0, _080E6CD8
	str r0, [r1]
	b _080E6D3E
	.align 2, 0
_080E6CC4: .4byte 0x080E6D45
_080E6CC8: .4byte 0x02039CB8
_080E6CCC: .4byte 0x080E6E09
_080E6CD0: .4byte 0x02039CB4
_080E6CD4: .4byte 0x0300115C
_080E6CD8: .4byte 0x00001230
_080E6CDC:
	ldr r0, _080E6D14
	ldr r0, [r0]
	adds r1, r5, #0
	adds r1, #0xc
	bl StorePtrInTaskData
	ldr r0, _080E6D18
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x1c]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r0, r1, r6
	strh r4, [r0, #8]
	ldr r0, _080E6D1C
	ldr r0, [r0]
	adds r1, r6, r1
	adds r1, #0x12
	bl StorePtrInTaskData
	ldr r1, _080E6D20
	ldr r0, _080E6D24
	str r0, [r1]
	b _080E6D3E
	.align 2, 0
_080E6D14: .4byte 0x02039CB8
_080E6D18: .4byte 0x080E6E09
_080E6D1C: .4byte 0x02039CB4
_080E6D20: .4byte 0x0300115C
_080E6D24: .4byte 0x00001444
_080E6D28:
	ldrh r0, [r5, #0x1c]
	adds r0, #1
	strh r0, [r5, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _080E6D3E
	movs r0, #0
	strh r0, [r5, #0x1c]
	movs r0, #2
_080E6D3C:
	strh r0, [r5, #8]
_080E6D3E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end Task_MixingRecordsRecv

	thumb_func_start Task_SendPacket
Task_SendPacket: @ 0x080E6D44
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080E6D68
	adds r5, r1, r0
	movs r2, #8
	ldrsh r1, [r5, r2]
	adds r2, r0, #0
	cmp r1, #4
	bhi _080E6DFC
	lsls r0, r1, #2
	ldr r1, _080E6D6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6D68: .4byte 0x03005B60
_080E6D6C: .4byte 0x080E6D70
_080E6D70: @ jump table
	.4byte _080E6D84 @ case 0
	.4byte _080E6DA8 @ case 1
	.4byte _080E6DFC @ case 2
	.4byte _080E6DBA @ case 3
	.4byte _080E6DE6 @ case 4
_080E6D84:
	adds r0, r5, #0
	adds r0, #0xc
	bl LoadPtrFromTaskData
	adds r1, r0, #0
	movs r0, #0x10
	ldrsh r2, [r5, r0]
	movs r0, #0xc8
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _080E6DA4
	movs r2, #0xc8
	bl memcpy
	b _080E6DD4
	.align 2, 0
_080E6DA4: .4byte 0x0202257C
_080E6DA8:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E6DD4
	movs r0, #1
	bl sub_0800A09C
	b _080E6DD4
_080E6DBA:
	ldrh r0, [r5, #0x10]
	adds r0, #1
	strh r0, [r5, #0x10]
	movs r1, #0x10
	ldrsh r4, [r5, r1]
	ldr r0, _080E6DDC
	ldr r0, [r0]
	movs r1, #0xc8
	bl __udivsi3
	adds r0, #1
	cmp r4, r0
	bne _080E6DE0
_080E6DD4:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _080E6DFC
	.align 2, 0
_080E6DDC: .4byte 0x0300115C
_080E6DE0:
	movs r0, #0
	strh r0, [r5, #8]
	b _080E6DFC
_080E6DE6:
	movs r1, #0x1c
	ldrsh r0, [r5, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #4]
	cmp r0, #0
	bne _080E6DFC
	ldr r0, _080E6E04
	str r0, [r5]
_080E6DFC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E6E04: .4byte 0x080E6FAD
	thumb_func_end Task_SendPacket

	thumb_func_start Task_CopyReceiveBuffer
Task_CopyReceiveBuffer: @ 0x080E6E08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r0, r0, #2
	ldr r1, [sp]
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _080E6E4C
	adds r0, r0, r1
	mov sl, r0
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	bl sub_0800A59C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #4]
	cmp r3, r0
	bne _080E6F16
	movs r4, #0
	mov r8, r4
	b _080E6EF4
	.align 2, 0
_080E6E4C: .4byte 0x03005B60
_080E6E50:
	ldr r1, [sp, #4]
	mov r0, r8
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	movs r2, #1
	add r2, r8
	mov sb, r2
	cmp r1, #0
	beq _080E6EEC
	mov r0, sl
	adds r0, #0x12
	bl LoadPtrFromTaskData
	mov r3, sb
	lsls r4, r3, #1
	mov r5, sl
	adds r5, #8
	adds r4, r5, r4
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r7, #0xc8
	muls r1, r7, r1
	adds r0, r0, r1
	ldr r3, _080E6EB0
	ldr r1, [r3]
	mov r2, r8
	muls r2, r1, r2
	adds r1, r2, #0
	adds r6, r0, r1
	mov r0, r8
	bl GetPlayerRecvBuffer
	adds r1, r0, #0
	movs r3, #0
	ldrsh r2, [r4, r3]
	adds r0, r2, #1
	muls r0, r7, r0
	ldr r4, _080E6EB0
	ldr r3, [r4]
	cmp r0, r3
	bls _080E6EB4
	muls r2, r7, r2
	subs r2, r3, r2
	adds r0, r6, #0
	bl memcpy
	b _080E6EBC
	.align 2, 0
_080E6EB0: .4byte 0x0300115C
_080E6EB4:
	adds r0, r6, #0
	movs r2, #0xc8
	bl memcpy
_080E6EBC:
	mov r0, r8
	bl ResetBlockReceivedFlag
	mov r0, sb
	lsls r1, r0, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r4, [r1, r2]
	ldr r3, _080E6F3C
	ldr r0, [r3]
	movs r1, #0xc8
	bl __udivsi3
	adds r0, #1
	cmp r4, r0
	bne _080E6EEC
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
_080E6EEC:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080E6EF4:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r8, r0
	blo _080E6E50
	ldr r2, _080E6F40
	mov r0, sl
	movs r3, #8
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
_080E6F16:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, [sp, #8]
	cmp r4, r0
	bne _080E6F2A
	ldr r0, [sp]
	bl DestroyTask
_080E6F2A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E6F3C: .4byte 0x0300115C
_080E6F40: .4byte 0x03005B60
	thumb_func_end Task_CopyReceiveBuffer

	thumb_func_start sub_080E6F44
sub_080E6F44: @ 0x080E6F44
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	ldr r2, _080E6F74
	adds r0, r0, r2
	movs r4, #0x1c
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080E6F6C
	adds r0, r3, #0
	bl DestroyTask
_080E6F6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6F74: .4byte 0x03005B60
	thumb_func_end sub_080E6F44

	thumb_func_start Task_ReceivePacket
Task_ReceivePacket: @ 0x080E6F78
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080E6FA0
	adds r1, r1, r0
	ldr r0, _080E6FA4
	str r0, [r1]
	ldr r0, _080E6FA8
	ldrb r0, [r0]
	cmp r0, #1
	bne _080E6F9C
	movs r2, #0x12
	ldrsh r0, [r1, r2]
	bl ReceiveExchangePacket
_080E6F9C:
	pop {r0}
	bx r0
	.align 2, 0
_080E6FA0: .4byte 0x03005B60
_080E6FA4: .4byte 0x080E6F45
_080E6FA8: .4byte 0x03001130
	thumb_func_end Task_ReceivePacket

	thumb_func_start Task_SendPacket_SwitchToReceive
Task_SendPacket_SwitchToReceive: @ 0x080E6FAC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080E6FC8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _080E6FCC
	str r0, [r1]
	ldr r1, _080E6FD0
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080E6FC8: .4byte 0x03005B60
_080E6FCC: .4byte 0x080E6F79
_080E6FD0: .4byte 0x03001130
	thumb_func_end Task_SendPacket_SwitchToReceive

	thumb_func_start LoadPtrFromTaskData
LoadPtrFromTaskData: @ 0x080E6FD4
	adds r1, r0, #0
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	lsls r1, r1, #0x10
	orrs r0, r1
	bx lr
	thumb_func_end LoadPtrFromTaskData

	thumb_func_start StorePtrInTaskData
StorePtrInTaskData: @ 0x080E6FE0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	bx lr
	thumb_func_end StorePtrInTaskData

	thumb_func_start GetMultiplayerId_
GetMultiplayerId_: @ 0x080E6FE8
	push {lr}
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetMultiplayerId_

	thumb_func_start GetPlayerRecvBuffer
GetPlayerRecvBuffer: @ 0x080E6FF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _080E7004
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080E7004: .4byte 0x0202207C
	thumb_func_end GetPlayerRecvBuffer

	thumb_func_start ShufflePlayerIndices
ShufflePlayerIndices: @ 0x080E7008
	push {r4, lr}
	adds r4, r0, #0
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _080E7040
	cmp r0, #3
	bhi _080E7022
	cmp r0, #2
	beq _080E7028
	b _080E7090
_080E7022:
	cmp r0, #4
	beq _080E706C
	b _080E7090
_080E7028:
	movs r3, #0
	ldr r2, _080E703C
	adds r1, r4, #0
_080E702E:
	adds r0, r3, r2
	ldrb r0, [r0]
	stm r1!, {r0}
	adds r3, #1
	cmp r3, #1
	bls _080E702E
	b _080E7090
	.align 2, 0
_080E703C: .4byte 0x08566CC7
_080E7040:
	movs r0, #0
	bl GetLinkPlayerTrainerId
	adds r2, r0, #0
	movs r0, #1
	ands r2, r0
	movs r3, #0
	ldr r1, _080E7068
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r1, r0, r1
	adds r2, r4, #0
_080E7058:
	ldrb r0, [r1]
	stm r2!, {r0}
	adds r1, #1
	adds r3, #1
	cmp r3, #2
	bls _080E7058
	b _080E7090
	.align 2, 0
_080E7068: .4byte 0x08566CC9
_080E706C:
	movs r0, #0
	bl GetLinkPlayerTrainerId
	movs r1, #9
	bl __umodsi3
	adds r2, r0, #0
	movs r3, #0
	ldr r1, _080E7098
	lsls r0, r2, #2
	adds r1, r0, r1
	adds r2, r4, #0
_080E7084:
	ldrb r0, [r1]
	stm r2!, {r0}
	adds r1, #1
	adds r3, #1
	cmp r3, #3
	bls _080E7084
_080E7090:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7098: .4byte 0x08566CCF
	thumb_func_end ShufflePlayerIndices

	thumb_func_start ReceiveOldManData
ReceiveOldManData: @ 0x080E709C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	mov r0, sp
	bl ShufflePlayerIndices
	ldr r1, _080E70E4
	lsls r0, r6, #2
	add r0, sp
	ldr r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080E70F8
	ldrh r0, [r1, #0x1a]
	cmp r0, #1
	bne _080E70E8
	adds r0, r4, #0
	muls r0, r2, r0
	adds r0, r5, r0
	ldrh r3, [r1, #0x1a]
	movs r1, #1
	movs r2, #2
	bl sub_08120E90
	b _080E70F8
	.align 2, 0
_080E70E4: .4byte 0x020226A0
_080E70E8:
	adds r0, r4, #0
	muls r0, r2, r0
	adds r0, r5, r0
	ldrh r3, [r1, #0x1a]
	movs r1, #1
	adds r2, r3, #0
	bl sub_08120E90
_080E70F8:
	ldr r0, _080E7118
	ldr r0, [r0]
	lsls r1, r6, #2
	add r1, sp
	ldr r1, [r1]
	muls r1, r4, r1
	adds r1, r5, r1
	movs r2, #0x40
	bl memcpy
	bl ResetMauvilleOldManFlag
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E7118: .4byte 0x03001140
	thumb_func_end ReceiveOldManData

	thumb_func_start ReceiveBattleTowerData
ReceiveBattleTowerData: @ 0x080E711C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov r8, r0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	mov r0, sp
	bl ShufflePlayerIndices
	bl Link_AnyPartnersPlayingRubyOrSapphire
	cmp r0, #0
	beq _080E71B4
	lsls r0, r5, #2
	mov r1, sp
	adds r7, r1, r0
	ldr r0, [r7]
	muls r0, r6, r0
	add r0, r8
	adds r4, r6, #0
	muls r4, r5, r4
	mov r1, r8
	adds r5, r1, r4
	adds r1, r5, #0
	bl RubyBattleTowerRecordToEmerald
	adds r6, r0, #0
	mov sb, r4
	cmp r6, #1
	bne _080E71CE
	ldr r4, _080E7184
	ldr r0, [r7]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r1, #0x1a]
	cmp r0, #1
	bne _080E7188
	adds r0, r5, #4
	bl IsStringJapanese
	cmp r0, #0
	bne _080E7192
	adds r1, r5, #0
	adds r1, #0xe4
	movs r0, #2
	strb r0, [r1]
	b _080E71AC
	.align 2, 0
_080E7184: .4byte 0x020226A0
_080E7188:
	adds r0, r5, #4
	bl IsStringJapanese
	cmp r0, #0
	beq _080E719A
_080E7192:
	adds r0, r5, #0
	adds r0, #0xe4
	strb r6, [r0]
	b _080E71AC
_080E719A:
	ldr r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x1a]
	adds r0, r5, #0
	adds r0, #0xe4
	strb r1, [r0]
_080E71AC:
	adds r0, r5, #0
	bl CalcEmeraldBattleTowerChecksum
	b _080E71CE
_080E71B4:
	adds r4, r6, #0
	muls r4, r5, r4
	mov r1, r8
	adds r0, r1, r4
	lsls r1, r5, #2
	add r1, sp
	ldr r1, [r1]
	muls r1, r6, r1
	add r1, r8
	movs r2, #0xec
	bl memcpy
	mov sb, r4
_080E71CE:
	mov r0, r8
	add r0, sb
	bl PutNewBattleTowerRecord
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ReceiveBattleTowerData

	thumb_func_start ReceiveLilycoveLadyData
ReceiveLilycoveLadyData: @ 0x080E71E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	mov r8, r0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	mov r0, sp
	bl ShufflePlayerIndices
	adds r0, r7, #0
	muls r0, r5, r0
	add r0, r8
	ldr r6, _080E722C
	ldr r1, [r6]
	movs r2, #0x40
	bl memcpy
	bl GetLilycoveLadyId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E7230
	movs r0, #0x40
	bl Alloc
	adds r4, r0, #0
	cmp r4, #0
	beq _080E725A
	ldr r1, [r6]
	movs r2, #0x40
	bl memcpy
	b _080E7232
	.align 2, 0
_080E722C: .4byte 0x03001150
_080E7230:
	movs r4, #0
_080E7232:
	ldr r0, _080E7268
	ldr r0, [r0]
	lsls r1, r5, #2
	add r1, sp
	ldr r1, [r1]
	muls r1, r7, r1
	add r1, r8
	movs r2, #0x40
	bl memcpy
	bl sub_0818D7A4
	cmp r4, #0
	beq _080E725A
	adds r0, r4, #0
	bl sub_0818E1CC
	adds r0, r4, #0
	bl Free
_080E725A:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7268: .4byte 0x03001150
	thumb_func_end ReceiveLilycoveLadyData

	thumb_func_start sub_080E726C
sub_080E726C: @ 0x080E726C
	ldrh r0, [r0, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	thumb_func_end sub_080E726C

	thumb_func_start sub_080E7274
sub_080E7274: @ 0x080E7274
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x38
	mov r8, r0
	mov sl, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x54]
	lsls r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsrs r4, r4, #0x17
	add r4, sb
	ldrb r0, [r4]
	mov r6, sl
	muls r6, r0, r6
	add r6, r8
	ldrb r0, [r4, #1]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r6, r1
	mov r0, sp
	movs r2, #0x38
	bl memcpy
	lsls r5, r5, #1
	add r5, sb
	ldrb r0, [r5]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	add r8, r0
	ldrb r1, [r4, #1]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r6, r6, r0
	ldrb r0, [r5, #1]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	add r1, r8
	adds r0, r6, #0
	movs r2, #0x38
	bl memcpy
	ldrb r1, [r5, #1]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	add r8, r0
	mov r0, r8
	mov r1, sp
	movs r2, #0x38
	bl memcpy
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080E7274

	thumb_func_start sub_080E72FC
sub_080E72FC: @ 0x080E72FC
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	ldr r4, _080E7320
_080E7306:
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r1, #1
	cmp r1, #0xff
	ble _080E7306
	strb r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7320: .4byte 0x03001160
	thumb_func_end sub_080E72FC

	thumb_func_start sub_080E7324
sub_080E7324: @ 0x080E7324
	ldr r0, _080E732C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080E732C: .4byte 0x03001160
	thumb_func_end sub_080E7324

	thumb_func_start ReceiveDaycareMailData
ReceiveDaycareMailData: @ 0x080E7330
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	str r0, [sp, #0x2c]
	str r1, [sp, #0x30]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	ldr r0, _080E73BC
	ldrh r0, [r0, #4]
	bl SeedRng2
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	mov r8, r0
	mov r1, sp
	adds r1, #0x1c
	str r1, [sp, #0x48]
	mov r2, sp
	adds r2, #0x1d
	str r2, [sp, #0x4c]
	mov r3, sp
	adds r3, #0xc
	str r3, [sp, #0x44]
	movs r7, #0xff
	add r3, sp, #8
	movs r2, #0
	adds r6, r1, #0
	ldr r5, [sp, #0x4c]
_080E7380:
	mov r1, sp
	add r1, r8
	adds r1, #4
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	mov r1, r8
	adds r0, r3, r1
	strb r2, [r0]
	lsls r1, r1, #1
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, r5, r1
	strb r2, [r1]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #3
	bls _080E7380
	movs r2, #0
	mov r8, r2
	lsls r4, r4, #0x10
	str r4, [sp, #0x3c]
	ldr r0, [sp, #0x30]
	mov r3, sb
	muls r3, r0, r3
	str r3, [sp, #0x40]
	b _080E74EC
	.align 2, 0
_080E73BC: .4byte 0x020226A0
_080E73C0:
	ldr r1, [sp, #0x30]
	mov r0, r8
	muls r0, r1, r0
	ldr r2, [sp, #0x2c]
	adds r7, r2, r0
	ldr r1, _080E7408
	mov r3, r8
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrh r0, [r1, #0x1a]
	cmp r0, #1
	bne _080E7458
	movs r6, #0
	movs r0, #0x10
	rsbs r0, r0, #0
	mov sb, r0
_080E73E4:
	lsls r4, r6, #3
	subs r0, r4, r6
	lsls r0, r0, #3
	adds r5, r7, r0
	adds r0, r5, #0
	adds r0, #0x24
	bl IsStringJapanese
	cmp r0, #0
	beq _080E740C
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r1, [r0]
	mov r2, sb
	ands r1, r2
	movs r2, #1
	b _080E7418
	.align 2, 0
_080E7408: .4byte 0x020226A0
_080E740C:
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r1, [r0]
	mov r3, sb
	ands r1, r3
	movs r2, #2
_080E7418:
	orrs r1, r2
	strb r1, [r0]
	subs r0, r4, r6
	lsls r0, r0, #3
	adds r4, r7, r0
	adds r0, r4, #0
	adds r0, #0x2c
	bl IsStringJapanese
	cmp r0, #0
	beq _080E743C
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x10
	b _080E7448
_080E743C:
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x20
_080E7448:
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #1
	bls _080E73E4
	b _080E74E2
_080E7458:
	movs r6, #0
	mov sb, r1
	movs r0, #0xf
	mov sl, r0
_080E7460:
	lsls r4, r6, #3
	subs r0, r4, r6
	lsls r0, r0, #3
	adds r5, r7, r0
	adds r0, r5, #0
	adds r0, #0x24
	bl IsStringJapanese
	cmp r0, #0
	beq _080E7488
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	b _080E74A0
_080E7488:
	mov r3, sb
	ldrb r0, [r3, #0x1a]
	adds r2, r5, #0
	adds r2, #0x37
	mov r1, sl
	ands r1, r0
	ldrb r0, [r2]
	movs r3, #0x10
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_080E74A0:
	subs r0, r4, r6
	lsls r0, r0, #3
	adds r4, r7, r0
	adds r0, r4, #0
	adds r0, #0x2c
	bl IsStringJapanese
	cmp r0, #0
	beq _080E74C4
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	mov r0, sl
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	b _080E74D8
_080E74C4:
	mov r0, sb
	ldrb r1, [r0, #0x1a]
	adds r3, r4, #0
	adds r3, #0x37
	lsls r1, r1, #4
	ldrb r2, [r3]
	mov r0, sl
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080E74D8:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #1
	bls _080E7460
_080E74E2:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_080E74EC:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r8, r0
	bhs _080E74FA
	b _080E73C0
_080E74FA:
	movs r1, #0
	str r1, [sp, #0x34]
	mov r8, r1
	ldr r2, [sp, #0x3c]
	lsrs r0, r2, #0x10
	cmp r1, r0
	bhs _080E7556
	adds r5, r0, #0
_080E750A:
	ldr r3, [sp, #0x30]
	mov r0, r8
	muls r0, r3, r0
	ldr r1, [sp, #0x2c]
	adds r7, r1, r0
	ldr r0, [r7, #0x70]
	cmp r0, #0
	beq _080E7548
	movs r6, #0
	cmp r6, r0
	bhs _080E7548
	adds r3, r7, #0
	adds r3, #0x74
	ldr r2, [sp, #0x48]
	mov r0, r8
	lsls r1, r0, #1
	movs r4, #1
_080E752C:
	lsls r0, r6, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, #0
	bne _080E753C
	adds r0, r6, r1
	adds r0, r2, r0
	strb r4, [r0]
_080E753C:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r7, #0x70]
	cmp r6, r0
	blo _080E752C
_080E7548:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r8, r5
	blo _080E750A
_080E7556:
	movs r6, #0
	mov r8, r6
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	beq _080E764A
	add r2, sp, #0x24
	mov sl, r2
	movs r3, #0x25
	add r3, sp
	mov sb, r3
_080E756A:
	ldr r1, [sp, #0x30]
	mov r0, r8
	muls r0, r1, r0
	ldr r2, [sp, #0x2c]
	adds r7, r2, r0
	mov r3, r8
	lsls r1, r3, #1
	ldr r2, [sp, #0x48]
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080E758C
	ldr r3, [sp, #0x4c]
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080E7596
_080E758C:
	ldr r0, [sp, #0x34]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x34]
_080E7596:
	ldr r2, [sp, #0x48]
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080E75BA
	ldr r3, [sp, #0x4c]
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, #0
	bne _080E75BA
_080E75AA:
	lsls r1, r6, #1
	mov r3, sl
	adds r0, r3, r1
	mov r3, r8
	strb r3, [r0]
	add r1, sb
	strb r2, [r1]
	b _080E7634
_080E75BA:
	ldr r2, [sp, #0x48]
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080E75CE
	ldr r3, [sp, #0x4c]
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, #1
	beq _080E75AA
_080E75CE:
	ldr r2, [sp, #0x48]
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080E763A
	ldr r3, [sp, #0x4c]
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080E763A
	lsls r5, r6, #1
	mov r1, sl
	adds r0, r1, r5
	mov r2, r8
	strb r2, [r0]
	adds r0, r7, #0
	bl sub_080E726C
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	adds r0, #0x38
	bl sub_080E726C
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r4, #0
	bne _080E7616
	cmp r1, #0
	beq _080E761A
	mov r3, sb
	adds r1, r3, r5
	movs r0, #1
	strb r0, [r1]
	b _080E7634
_080E7616:
	cmp r1, #0
	beq _080E762E
_080E761A:
	bl Random2
	mov r1, sb
	adds r2, r1, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	b _080E7634
_080E762E:
	mov r2, sb
	adds r0, r2, r5
	strb r1, [r0]
_080E7634:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080E763A:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r8, r3
	ldr r1, [sp, #0x3c]
	cmp r0, r1
	blo _080E756A
_080E764A:
	movs r2, #0
	mov r8, r2
	ldr r3, [sp, #0x40]
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #3
	ldr r1, [sp, #0x2c]
	adds r7, r1, r0
	ldr r1, [sp, #0x44]
_080E765C:
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r1, r0
	str r7, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #3
	bls _080E765C
	bl sub_080E7324
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, [sp, #0x34]
	cmp r3, #3
	beq _080E76AE
	cmp r3, #3
	bgt _080E7694
	cmp r3, #2
	beq _080E769C
	b _080E7704
_080E7694:
	ldr r0, [sp, #0x34]
	cmp r0, #4
	beq _080E76D0
	b _080E7704
_080E769C:
	add r2, sp, #0x24
	movs r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	movs r3, #0
	bl sub_080E7274
	b _080E7704
_080E76AE:
	ldr r0, _080E76CC
	lsls r1, r1, #1
	adds r2, r1, r0
	ldrb r3, [r2]
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	add r2, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	bl sub_080E7274
	b _080E7704
	.align 2, 0
_080E76CC: .4byte 0x08566CF3
_080E76D0:
	add r6, sp, #0x24
	ldr r4, _080E7744
	lsls r5, r1, #2
	adds r0, r5, r4
	ldrb r3, [r0]
	adds r0, r4, #1
	adds r0, r5, r0
	ldrb r0, [r0]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	adds r2, r6, #0
	bl sub_080E7274
	adds r0, r4, #2
	adds r0, r5, r0
	ldrb r3, [r0]
	adds r4, #3
	adds r5, r5, r4
	ldrb r0, [r5]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	adds r2, r6, #0
	bl sub_080E7274
_080E7704:
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x40]
	adds r7, r1, r2
	ldr r4, _080E7748
	ldr r0, [r4]
	movs r3, #0xc2
	lsls r3, r3, #6
	adds r0, r0, r3
	adds r1, r7, #0
	movs r2, #0x38
	bl memcpy
	ldr r0, [r4]
	ldr r1, _080E774C
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x38
	movs r2, #0x38
	bl memcpy
	ldr r0, [sp, #0x38]
	bl SeedRng
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7744: .4byte 0x08566CF9
_080E7748: .4byte 0x03005AEC
_080E774C: .4byte 0x0000310C
	thumb_func_end ReceiveDaycareMailData

	thumb_func_start ReceiveGiftItem
ReceiveGiftItem: @ 0x080E7750
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080E77D4
	ldrh r0, [r4]
	cmp r0, #0
	beq _080E77D4
	bl GetPocketByItemId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bne _080E77D4
	ldrh r0, [r4]
	movs r1, #1
	bl CheckBagHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E77CC
	ldrh r0, [r4]
	movs r1, #1
	bl CheckPCHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E77CC
	ldrh r0, [r4]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E77CC
	ldr r0, _080E77B8
	ldrh r1, [r4]
	bl VarSet
	ldr r0, _080E77BC
	ldr r1, _080E77C0
	bl StringCopy
	ldrh r1, [r4]
	ldr r0, _080E77C4
	cmp r1, r0
	bne _080E77D4
	ldr r0, _080E77C8
	bl FlagSet
	b _080E77D4
	.align 2, 0
_080E77B8: .4byte 0x00004001
_080E77BC: .4byte 0x02021C40
_080E77C0: .4byte 0x020226A8
_080E77C4: .4byte 0x00000113
_080E77C8: .4byte 0x000008B3
_080E77CC:
	ldr r0, _080E77DC
	movs r1, #0
	bl VarSet
_080E77D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E77DC: .4byte 0x00004001
	thumb_func_end ReceiveGiftItem

	thumb_func_start Task_DoRecordMixing
Task_DoRecordMixing: @ 0x080E77E0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080E7804
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bls _080E77FA
	b _080E78F2
_080E77FA:
	lsls r0, r0, #2
	ldr r1, _080E7808
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E7804: .4byte 0x03005B60
_080E7808: .4byte 0x080E780C
_080E780C: @ jump table
	.4byte _080E78DA @ case 0
	.4byte _080E7834 @ case 1
	.4byte _080E7842 @ case 2
	.4byte _080E784C @ case 3
	.4byte _080E7864 @ case 4
	.4byte _080E7878 @ case 5
	.4byte _080E788C @ case 6
	.4byte _080E78A8 @ case 7
	.4byte _080E78D6 @ case 8
	.4byte _080E78E2 @ case 9
_080E7834:
	bl Link_AnyPartnersPlayingRubyOrSapphire
	cmp r0, #0
	bne _080E78DA
	movs r0, #6
	strh r0, [r4, #8]
	b _080E78F2
_080E7842:
	bl SetContinueGameWarpStatusToDynamicWarp
	bl FullSaveGame
	b _080E78DA
_080E784C:
	bl CheckSaveFile
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E78F2
	bl ClearContinueGameWarpStatus
	movs r1, #0
	movs r0, #4
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	b _080E78F2
_080E7864:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _080E78F2
	bl sub_0800A7F8
	b _080E78DA
_080E7878:
	ldr r0, _080E7888
	ldrb r0, [r0]
	cmp r0, #0
	bne _080E78F2
	adds r0, r5, #0
	bl DestroyTask
	b _080E78F2
	.align 2, 0
_080E7888: .4byte 0x030031C4
_080E788C:
	movs r0, #0
	bl sub_0800FF8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E78F2
	ldr r0, _080E78A4
	movs r1, #5
	bl CreateTask
	b _080E78DA
	.align 2, 0
_080E78A4: .4byte 0x081535C5
_080E78A8:
	ldr r0, _080E78C8
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E78F2
	ldr r0, _080E78CC
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E78D0
	movs r0, #1
	bl sub_0800FF8C
	movs r0, #8
	strh r0, [r4, #8]
	b _080E78F2
	.align 2, 0
_080E78C8: .4byte 0x081535C5
_080E78CC: .4byte 0x0300319C
_080E78D0:
	movs r0, #4
	strh r0, [r4, #8]
	b _080E78F2
_080E78D6:
	bl sub_0800A8D4
_080E78DA:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080E78F2
_080E78E2:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E78F2
	adds r0, r5, #0
	bl DestroyTask
_080E78F2:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Task_DoRecordMixing

	thumb_func_start sub_080E78F8
sub_080E78F8: @ 0x080E78F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp]
	mov sl, r1
	adds r1, r0, #0
	adds r1, #0x38
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [sp]
	adds r1, #0x7c
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r0, [sp]
	mov r1, sl
	movs r2, #0x44
	bl memcpy
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #4]
	mov r8, r2
	movs r7, #0
	ldr r0, _080E79C4
	mov sb, r0
_080E7938:
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0xb2
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	adds r0, r7, r0
	movs r1, #3
	bl __modsi3
	adds r6, r0, #1
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	mov r2, sl
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080E79A0
	adds r5, r1, #0
	adds r5, #0x34
	adds r0, r5, #0
	bl GetTrainerId
	adds r4, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0xa
	bl GetTrainerId
	cmp r4, r0
	beq _080E7982
	movs r2, #1
	add r8, r2
	str r6, [sp, #4]
_080E7982:
	adds r0, r5, #0
	bl GetTrainerId
	adds r4, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0xa
	bl GetTrainerId
	cmp r4, r0
	bne _080E79A0
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	str r6, [sp, #8]
_080E79A0:
	adds r7, #1
	cmp r7, #1
	ble _080E7938
	mov r0, r8
	cmp r0, #0
	bne _080E79B8
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _080E79B8
	mov r8, r1
	ldr r2, [sp, #8]
	str r2, [sp, #4]
_080E79B8:
	mov r0, r8
	cmp r0, #1
	beq _080E79C8
	cmp r0, #2
	beq _080E79D4
	b _080E7A34
	.align 2, 0
_080E79C4: .4byte 0x03005AF0
_080E79C8:
	ldr r2, [sp, #4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, sl
	b _080E79F6
_080E79D4:
	bl Random2
	lsls r0, r0, #0x10
	ldr r1, _080E7A04
	cmp r0, r1
	bls _080E7A0C
	ldr r0, _080E7A08
	ldr r0, [r0]
	adds r0, #0xb2
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sl
	adds r1, #0x44
_080E79F6:
	ldr r0, [sp]
	adds r0, #0x44
	movs r2, #0x44
	bl memcpy
	b _080E7A34
	.align 2, 0
_080E7A04: .4byte 0x33330000
_080E7A08: .4byte 0x03005AF0
_080E7A0C:
	ldr r0, _080E7A44
	ldr r0, [r0]
	adds r0, #0xb2
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	adds r0, #1
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sl
	adds r1, #0x44
	ldr r0, [sp]
	adds r0, #0x44
	movs r2, #0x44
	bl memcpy
_080E7A34:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7A44: .4byte 0x03005AF0
	thumb_func_end sub_080E78F8

	thumb_func_start GetPlayerHallRecords
GetPlayerHallRecords: @ 0x080E7A48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	movs r6, #0
	ldr r0, _080E7BDC
	mov sl, r0
_080E7A5C:
	movs r7, #0
	lsls r0, r6, #5
	adds r6, #1
	mov sb, r6
	mov r1, r8
	adds r4, r0, r1
	adds r0, #6
	adds r6, r1, r0
	adds r5, r4, #0
_080E7A6E:
	mov r2, sl
	ldr r1, [r2]
	adds r1, #0xa
	adds r0, r5, #0
	bl CopyTrainerId
	movs r0, #1
	strb r0, [r4, #0xe]
	mov r0, sl
	ldr r1, [r0]
	adds r0, r6, #0
	bl StringCopy
	adds r4, #0x10
	adds r6, #0x10
	adds r5, #0x10
	adds r7, #1
	cmp r7, #1
	ble _080E7A6E
	mov r6, sb
	cmp r6, #8
	ble _080E7A5C
	ldr r1, _080E7BDC
	mov sl, r1
	ldr r2, _080E7BE0
	str r2, [sp, #4]
	movs r4, #0x99
	lsls r4, r4, #1
	add r4, r8
	movs r0, #0x95
	lsls r0, r0, #1
	add r0, r8
	mov sb, r0
	ldr r1, _080E7BE4
	str r1, [sp, #8]
	movs r6, #0x92
	lsls r6, r6, #1
	add r6, r8
	movs r5, #0x90
	lsls r5, r5, #1
	add r5, r8
	movs r7, #1
_080E7AC2:
	movs r0, #1
	strb r0, [r4, #8]
	mov r2, sl
	ldr r1, [r2]
	adds r1, #0xa
	adds r0, r5, #0
	bl CopyTrainerId
	mov r0, sl
	ldr r1, [r0]
	ldr r2, [sp, #8]
	adds r1, r1, r2
	adds r0, r6, #0
	bl CopyTrainerId
	mov r0, sl
	ldr r1, [r0]
	mov r0, sb
	bl StringCopy
	mov r2, sl
	ldr r1, [r2]
	ldr r0, [sp, #4]
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	ldr r1, [sp, #4]
	adds r1, #8
	str r1, [sp, #4]
	adds r4, #0x1c
	movs r2, #0x1c
	add sb, r2
	ldr r0, [sp, #8]
	adds r0, #4
	str r0, [sp, #8]
	adds r6, #0x1c
	adds r5, #0x1c
	subs r7, #1
	cmp r7, #0
	bge _080E7AC2
	movs r6, #0
	ldr r0, _080E7BDC
	ldr r3, [r0]
	mov r4, r8
	movs r1, #0xc4
	adds r1, r1, r4
	mov sb, r1
	movs r2, #0x84
	adds r2, r2, r4
	mov r8, r2
	movs r0, #0x44
	adds r0, r0, r4
	mov ip, r0
	adds r7, r4, #4
	movs r1, #0xcf
	lsls r1, r1, #4
	adds r1, r3, r1
	str r1, [sp]
	mov sl, r4
	ldr r2, _080E7BE8
	adds r5, r3, r2
_080E7B3E:
	lsls r2, r6, #1
	ldr r1, [sp]
	ldrh r0, [r1]
	strh r0, [r7]
	ldrh r0, [r5]
	strh r0, [r7, #0x20]
	ldrh r0, [r5, #4]
	mov r1, ip
	strh r0, [r1]
	ldr r1, _080E7BEC
	adds r0, r3, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x20]
	movs r1, #0xdd
	lsls r1, r1, #4
	adds r0, r3, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, r8
	strh r0, [r1]
	ldr r1, _080E7BF0
	adds r0, r3, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, r8
	strh r0, [r1, #0x20]
	ldr r1, _080E7BF4
	adds r0, r3, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, sb
	strh r0, [r1]
	ldr r1, _080E7BF8
	adds r0, r3, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, sb
	strh r0, [r1, #0x20]
	ldr r1, _080E7BFC
	adds r0, r3, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #1
	add r0, sl
	strh r1, [r0]
	ldr r1, _080E7C00
	adds r0, r3, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r4, r2
	strh r1, [r0]
	adds r4, #0x1c
	movs r0, #0x10
	add sb, r0
	add r8, r0
	add ip, r0
	adds r7, #0x10
	ldr r1, [sp]
	adds r1, #2
	str r1, [sp]
	add sl, r0
	adds r5, #2
	adds r6, #1
	cmp r6, #1
	ble _080E7B3E
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7BDC: .4byte 0x03005AF0
_080E7BE0: .4byte 0x00000EE1
_080E7BE4: .4byte 0x00000EF1
_080E7BE8: .4byte 0x00000CF4
_080E7BEC: .4byte 0x00000D14
_080E7BF0: .4byte 0x00000DDE
_080E7BF4: .4byte 0x00000DEA
_080E7BF8: .4byte 0x00000E08
_080E7BFC: .4byte 0x00000E1E
_080E7C00: .4byte 0x00000CFC
	thumb_func_end GetPlayerHallRecords

	thumb_func_start sub_080E7C04
sub_080E7C04: @ 0x080E7C04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	adds r6, r1, #0
	adds r6, #0x34
	adds r5, r1, #0
_080E7C16:
	adds r0, r7, #0
	adds r0, #0x34
	bl GetTrainerId
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetTrainerId
	cmp r4, r0
	bne _080E7C36
	ldrb r0, [r7, #2]
	ldrb r1, [r5, #2]
	cmp r0, r1
	bne _080E7C36
	movs r0, #1
	b _080E7C46
_080E7C36:
	adds r6, #0x44
	adds r5, #0x44
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #3
	ble _080E7C16
	movs r0, #0
_080E7C46:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080E7C04

	thumb_func_start ReceiveApprenticeData
ReceiveApprenticeData: @ 0x080E7C50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r0, sp
	bl ShufflePlayerIndices
	lsls r4, r4, #2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	muls r0, r5, r0
	adds r3, r6, r0
	movs r7, #0
	movs r2, #0
	mov r8, r2
	movs r5, #0
	adds r6, r3, #0
	adds r6, #0x38
	adds r4, r3, #0
_080E7C7E:
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _080E7C9C
	ldr r0, _080E7CB0
	ldr r1, [r0]
	adds r1, #0xdc
	adds r0, r4, #0
	str r3, [sp, #0x10]
	bl sub_080E7C04
	ldr r3, [sp, #0x10]
	cmp r0, #0
	bne _080E7C9C
	adds r7, #1
	mov r8, r5
_080E7C9C:
	adds r6, #0x44
	adds r4, #0x44
	adds r5, #1
	cmp r5, #1
	ble _080E7C7E
	cmp r7, #1
	beq _080E7CB4
	cmp r7, #2
	beq _080E7CF0
	b _080E7D4E
	.align 2, 0
_080E7CB0: .4byte 0x03005AF0
_080E7CB4:
	ldr r4, _080E7CEC
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xb2
	ldrb r1, [r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1e
	adds r2, r1, #1
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, #0xdc
	mov r2, r8
	lsls r1, r2, #4
	add r1, r8
	lsls r1, r1, #2
	adds r1, r1, r3
	movs r2, #0x44
	bl memcpy
	ldr r4, [r4]
	adds r4, #0xb2
	ldrb r5, [r4]
	lsls r0, r5, #0x1b
	lsrs r0, r0, #0x1e
	adds r0, #1
	b _080E7D38
	.align 2, 0
_080E7CEC: .4byte 0x03005AF0
_080E7CF0:
	movs r5, #0
	adds r6, r3, #0
_080E7CF4:
	movs r0, #1
	eors r0, r5
	ldr r7, _080E7D5C
	ldr r4, [r7]
	adds r1, r4, #0
	adds r1, #0xb2
	ldrb r1, [r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1e
	adds r0, r0, r1
	movs r1, #3
	bl __modsi3
	adds r2, r0, #1
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r4, #0xdc
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x44
	bl memcpy
	adds r6, #0x44
	adds r5, #1
	cmp r5, #1
	ble _080E7CF4
	ldr r4, [r7]
	adds r4, #0xb2
	ldrb r5, [r4]
	lsls r0, r5, #0x1b
	lsrs r0, r0, #0x1e
	adds r0, #2
_080E7D38:
	movs r1, #3
	bl __modsi3
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #3
	movs r1, #0x19
	rsbs r1, r1, #0
	ands r1, r5
	orrs r1, r0
	strb r1, [r4]
_080E7D4E:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7D5C: .4byte 0x03005AF0
	thumb_func_end ReceiveApprenticeData

	thumb_func_start sub_080E7D60
sub_080E7D60: @ 0x080E7D60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x54
	str r0, [sp]
	ldr r0, [sp, #0x74]
	movs r4, #0
	mov r8, r4
	movs r5, #0
	str r5, [sp, #4]
	ldr r4, _080E7D7C
	b _080E7D88
	.align 2, 0
_080E7D7C: .4byte 0x03001168
_080E7D80:
	adds r1, r1, r2
	ldr r6, [sp, #4]
	adds r6, #1
	str r6, [sp, #4]
_080E7D88:
	ldr r5, [sp, #4]
	cmp r5, r0
	bge _080E7D9E
	cmp r5, r3
	beq _080E7D98
	stm r4!, {r1}
	movs r6, #1
	add r8, r6
_080E7D98:
	mov r5, r8
	cmp r5, #3
	bne _080E7D80
_080E7D9E:
	movs r6, #0
	str r6, [sp, #4]
	subs r0, #1
	str r0, [sp, #0x24]
_080E7DA6:
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r1, #1
	str r1, [sp, #0x28]
	ldr r2, [sp, #4]
	lsls r2, r2, #1
	str r2, [sp, #0x34]
	ldr r3, [sp, #4]
	adds r3, r2, r3
	str r3, [sp, #0x10]
	movs r4, #0
	str r4, [sp, #0x44]
	movs r5, #0
	str r5, [sp, #0x48]
_080E7DC4:
	movs r6, #0
	mov r8, r6
	ldr r0, _080E805C
	ldr r1, [r0]
	ldr r2, [sp, #0x10]
	lsls r0, r2, #5
	ldr r3, [sp, #0x48]
	adds r0, r3, r0
	adds r3, r0, r1
	lsls r0, r2, #6
	ldr r4, [sp, #0x44]
	adds r0, r4, r0
	ldr r5, [sp]
	adds r2, r0, r5
_080E7DE0:
	adds r0, r2, #0
	movs r6, #0x87
	lsls r6, r6, #2
	adds r1, r3, r6
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
	adds r3, #0x10
	adds r2, #0x10
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _080E7DE0
	movs r2, #0
	mov r8, r2
	ldr r3, [sp, #0x24]
	cmp r8, r3
	bge _080E7EC4
	ldr r4, [sp, #4]
	lsls r4, r4, #5
	mov sb, r4
	ldr r5, [sp, #8]
	lsls r7, r5, #4
	ldr r6, [sp, #0x34]
	ldr r1, [sp, #4]
	adds r0, r6, r1
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	ldr r2, [sp]
	adds r0, r2, r0
	ldr r3, [sp, #0x44]
	str r3, [sp, #0x18]
	adds r0, r0, r3
	str r0, [sp, #0x1c]
	ldr r4, [sp, #0x14]
	adds r0, r3, r4
	adds r0, r0, r2
	adds r0, #0x30
	mov sl, r0
_080E7E32:
	movs r5, #0
	str r5, [sp, #0xc]
	movs r3, #0
	mov r6, r8
	lsls r6, r6, #2
	str r6, [sp, #0x38]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	adds r0, r1, r2
	ldr r4, [sp]
	adds r5, r0, r4
	ldr r0, _080E8060
	adds r0, r6, r0
	str r0, [sp, #0x50]
_080E7E4E:
	lsls r0, r3, #4
	ldr r6, [sp, #0x1c]
	adds r0, r6, r0
	str r3, [sp, #0x4c]
	bl GetTrainerId
	adds r4, r0, #0
	ldr r1, [sp, #0x50]
	ldr r0, [r1]
	add r0, sb
	adds r0, r0, r7
	bl GetTrainerId
	ldr r3, [sp, #0x4c]
	cmp r4, r0
	bne _080E7E90
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	ldr r4, [sp, #0x50]
	ldr r0, [r4]
	mov r6, sb
	adds r1, r7, r6
	adds r1, r0, r1
	ldrh r0, [r5, #4]
	ldrh r2, [r1, #4]
	cmp r0, r2
	bhs _080E7E90
	adds r0, r5, #0
	ldm r1!, {r2, r4, r6}
	stm r0!, {r2, r4, r6}
	ldr r1, [r1]
	str r1, [r0]
_080E7E90:
	adds r5, #0x10
	adds r3, #1
	cmp r3, #2
	ble _080E7E4E
	ldr r3, [sp, #0xc]
	cmp r3, #0
	bne _080E7EB6
	ldr r0, _080E8060
	ldr r4, [sp, #0x38]
	adds r0, r4, r0
	ldr r0, [r0]
	mov r5, sb
	adds r2, r7, r5
	mov r1, sl
	adds r0, r0, r2
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r0]
	str r0, [r1]
_080E7EB6:
	movs r4, #0x10
	add sl, r4
	movs r5, #1
	add r8, r5
	ldr r6, [sp, #0x24]
	cmp r8, r6
	blt _080E7E32
_080E7EC4:
	ldr r0, [sp, #0x44]
	adds r0, #0x60
	str r0, [sp, #0x44]
	ldr r1, [sp, #0x48]
	adds r1, #0x30
	str r1, [sp, #0x48]
	ldr r2, [sp, #8]
	adds r2, #1
	str r2, [sp, #8]
	cmp r2, #1
	bgt _080E7EDC
	b _080E7DC4
_080E7EDC:
	ldr r3, [sp, #0x28]
	str r3, [sp, #4]
	cmp r3, #8
	bgt _080E7EE6
	b _080E7DA6
_080E7EE6:
	movs r4, #0
	str r4, [sp, #8]
_080E7EEA:
	ldr r5, [sp, #8]
	adds r5, #1
	str r5, [sp, #0x2c]
	ldr r0, _080E805C
	ldr r1, [r0]
	movs r0, #0x54
	ldr r6, [sp, #8]
	muls r0, r6, r0
	adds r3, r0, r1
	movs r0, #0xa8
	muls r0, r6, r0
	ldr r1, [sp]
	adds r2, r0, r1
	movs r4, #2
	mov r8, r4
_080E7F08:
	movs r5, #0xd8
	lsls r5, r5, #3
	adds r0, r2, r5
	ldr r6, _080E8064
	adds r1, r3, r6
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
	adds r3, #0x1c
	adds r2, #0x1c
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _080E7F08
	movs r2, #0
	mov r8, r2
	ldr r3, [sp, #0x24]
	cmp r8, r3
	blt _080E7F3A
	b _080E8042
_080E7F3A:
	ldr r4, [sp, #8]
	lsls r1, r4, #3
	movs r0, #0xa8
	adds r5, r4, #0
	muls r5, r0, r5
	str r5, [sp, #0x20]
	str r5, [sp, #0x3c]
	subs r1, r1, r4
	lsls r1, r1, #2
	mov sl, r1
_080E7F4E:
	movs r6, #0
	str r6, [sp, #0xc]
	mov r0, r8
	lsls r0, r0, #2
	str r0, [sp, #0x38]
	mov r1, r8
	adds r1, #1
	str r1, [sp, #0x30]
	ldr r0, _080E8060
	ldr r2, [sp, #0x38]
	adds r2, r2, r0
	mov sb, r2
	ldr r3, [sp]
	movs r4, #0xd8
	lsls r4, r4, #3
	adds r0, r3, r4
	ldr r5, [sp, #0x3c]
	adds r7, r5, r0
	str r6, [sp, #0x40]
	movs r3, #2
_080E7F76:
	ldr r1, [sp, #0x20]
	movs r2, #0xd8
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r4, [sp]
	adds r0, r4, r0
	ldr r6, [sp, #0x40]
	adds r5, r0, r6
	adds r0, r5, #0
	str r3, [sp, #0x4c]
	bl GetTrainerId
	adds r4, r0, #0
	movs r6, #0x90
	lsls r6, r6, #1
	add r6, sl
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r6
	bl GetTrainerId
	ldr r3, [sp, #0x4c]
	cmp r4, r0
	bne _080E7FF0
	adds r0, r5, #4
	bl GetTrainerId
	adds r4, r0, #0
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r6
	adds r0, #4
	bl GetTrainerId
	ldr r3, [sp, #0x4c]
	cmp r4, r0
	bne _080E7FF0
	ldr r4, [sp, #0xc]
	adds r4, #1
	str r4, [sp, #0xc]
	mov r5, sb
	ldr r0, [r5]
	mov r6, sl
	adds r2, r0, r6
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r2, r0
	ldrh r0, [r7, #8]
	ldrh r1, [r1]
	cmp r0, r1
	bhs _080E7FF0
	adds r0, r7, #0
	movs r4, #0x90
	lsls r4, r4, #1
	adds r1, r2, r4
	ldm r1!, {r2, r5, r6}
	stm r0!, {r2, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
_080E7FF0:
	adds r7, #0x1c
	ldr r0, [sp, #0x40]
	adds r0, #0x1c
	str r0, [sp, #0x40]
	subs r3, #1
	cmp r3, #0
	bge _080E7F76
	ldr r1, [sp, #0xc]
	cmp r1, #0
	bne _080E8038
	mov r0, r8
	adds r0, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r2, [sp, #0x20]
	adds r1, r1, r2
	ldr r3, [sp]
	adds r1, r3, r1
	ldr r0, _080E8060
	ldr r4, [sp, #0x38]
	adds r0, r4, r0
	ldr r0, [r0]
	add r0, sl
	movs r5, #0xd8
	lsls r5, r5, #3
	adds r1, r1, r5
	movs r6, #0x90
	lsls r6, r6, #1
	adds r0, r0, r6
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
_080E8038:
	ldr r3, [sp, #0x30]
	mov r8, r3
	ldr r4, [sp, #0x24]
	cmp r8, r4
	blt _080E7F4E
_080E8042:
	ldr r5, [sp, #0x2c]
	str r5, [sp, #8]
	cmp r5, #1
	bgt _080E804C
	b _080E7EEA
_080E804C:
	add sp, #0x54
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E805C: .4byte 0x03005AF0
_080E8060: .4byte 0x03001168
_080E8064: .4byte 0x0000057C
	thumb_func_end sub_080E7D60

	thumb_func_start sub_080E8068
sub_080E8068: @ 0x080E8068
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	adds r7, r1, #0
	movs r5, #0
_080E8070:
	movs r2, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r1, #0
	adds r6, r5, #1
	adds r3, r7, #0
_080E807C:
	ldrh r0, [r3, #4]
	cmp r0, r2
	ble _080E8086
	adds r4, r1, #0
	adds r2, r0, #0
_080E8086:
	adds r3, #0x10
	adds r1, #1
	cmp r1, #5
	ble _080E807C
	cmp r4, #0
	blt _080E80A8
	lsls r1, r5, #4
	lsls r2, r4, #4
	adds r2, r2, r7
	add r1, ip
	adds r0, r2, #0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #0
	strh r0, [r2, #4]
_080E80A8:
	adds r5, r6, #0
	cmp r5, #2
	ble _080E8070
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080E8068

	thumb_func_start sub_080E80B4
sub_080E80B4: @ 0x080E80B4
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	adds r6, r1, #0
	movs r5, #0
_080E80BC:
	movs r3, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r2, #0
	adds r7, r5, #1
	adds r1, r6, #0
_080E80C8:
	ldrh r0, [r1, #8]
	cmp r0, r3
	ble _080E80D2
	adds r4, r2, #0
	adds r3, r0, #0
_080E80D2:
	adds r1, #0x1c
	adds r2, #1
	cmp r2, #5
	ble _080E80C8
	cmp r4, #0
	blt _080E8100
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	lsls r2, r4, #3
	subs r2, r2, r4
	lsls r2, r2, #2
	adds r2, r2, r6
	add r1, ip
	adds r0, r2, #0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #0
	strh r0, [r2, #8]
_080E8100:
	adds r5, r7, #0
	cmp r5, #2
	ble _080E80BC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080E80B4

	thumb_func_start sub_080E810C
sub_080E810C: @ 0x080E810C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r0, #0
	ldr r1, _080E818C
	mov sl, r1
_080E811E:
	lsls r1, r0, #1
	adds r2, r0, #1
	mov r8, r2
	adds r1, r1, r0
	lsls r0, r1, #5
	movs r2, #0x87
	lsls r2, r2, #2
	adds r7, r0, r2
	lsls r1, r1, #6
	mov r0, sb
	adds r4, r0, r1
	movs r6, #0
	movs r5, #1
_080E8138:
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	adds r0, r0, r6
	adds r1, r4, #0
	bl sub_080E8068
	adds r4, #0x60
	adds r6, #0x30
	subs r5, #1
	cmp r5, #0
	bge _080E8138
	mov r0, r8
	cmp r0, #8
	ble _080E811E
	movs r5, #0
	ldr r4, _080E818C
_080E815A:
	movs r0, #0x54
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r2, _080E8190
	adds r1, r1, r2
	ldr r0, [r4]
	adds r0, r0, r1
	movs r1, #0xa8
	muls r1, r5, r1
	movs r2, #0xd8
	lsls r2, r2, #3
	adds r1, r1, r2
	add r1, sb
	bl sub_080E80B4
	adds r5, #1
	cmp r5, #1
	ble _080E815A
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E818C: .4byte 0x03005AF0
_080E8190: .4byte 0x0000057C
	thumb_func_end sub_080E810C

	thumb_func_start ReceiveRankingHallRecords
ReceiveRankingHallRecords: @ 0x080E8194
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	bl GetLinkPlayerCount
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x81
	lsls r0, r0, #4
	bl AllocZeroed
	adds r5, r0, #0
	str r4, [sp]
	adds r1, r6, #0
	mov r2, r8
	mov r3, sb
	bl sub_080E7D60
	adds r0, r5, #0
	bl sub_080E810C
	adds r0, r5, #0
	bl Free
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ReceiveRankingHallRecords

	thumb_func_start sub_080E81E0
sub_080E81E0: @ 0x080E81E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _080E8228
	ldr r4, _080E822C
	ldr r1, [r4]
	movs r0, #0xc2
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0x38
	bl memcpy
	ldr r1, [r4]
	ldr r0, _080E8230
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x38
	movs r2, #0x38
	bl memcpy
	ldr r0, [r4]
	ldr r1, _080E8234
	adds r0, r0, r1
	adds r1, r5, #0
	bl InitDaycareMailRecordMixing
	ldr r0, _080E8238
	ldr r1, [r0]
	adds r0, r6, #0
	movs r2, #0x78
	bl memcpy
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E8228: .4byte 0x02039C3C
_080E822C: .4byte 0x03005AEC
_080E8230: .4byte 0x0000310C
_080E8234: .4byte 0x00003030
_080E8238: .4byte 0x03001148
	thumb_func_end sub_080E81E0

	thumb_func_start SanitizeEmeraldBattleTowerRecord
SanitizeEmeraldBattleTowerRecord: @ 0x080E823C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0
	ldr r0, [r6, #0x70]
	cmp r7, r0
	bhs _080E8280
	adds r5, r6, #0
	adds r5, #0x2c
	adds r4, r6, #0
	adds r4, #0x24
_080E8250:
	adds r0, r4, #0
	bl IsStringJapanese
	cmp r0, #0
	beq _080E8262
	adds r0, r4, #0
	ldr r1, _080E8288
	bl StringCopy
_080E8262:
	adds r0, r5, #0
	bl IsStringJapanese
	cmp r0, #0
	beq _080E8274
	adds r0, r4, #0
	ldr r1, _080E828C
	bl StringCopy
_080E8274:
	adds r5, #0x38
	adds r4, #0x38
	adds r7, #1
	ldr r0, [r6, #0x70]
	cmp r7, r0
	blo _080E8250
_080E8280:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8288: .4byte 0x085CCEC5
_080E828C: .4byte 0x085CCECD
	thumb_func_end SanitizeEmeraldBattleTowerRecord

	thumb_func_start sub_080E8290
sub_080E8290: @ 0x080E8290
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _080E82D4
	adds r0, r6, #4
	bl IsStringJapanese
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r5, r1, #0x1f
	cmp r5, #0
	bne _080E82CA
	movs r4, #0
	b _080E82B0
_080E82AE:
	adds r4, #1
_080E82B0:
	cmp r4, #2
	bgt _080E82C6
	movs r0, #0x2c
	muls r0, r4, r0
	adds r0, r0, r6
	adds r0, #0x3c
	bl IsStringJapanese
	cmp r0, #0
	beq _080E82AE
	adds r5, #1
_080E82C6:
	cmp r5, #0
	beq _080E82D4
_080E82CA:
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa4
	bl memset
_080E82D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E8290

	thumb_func_start SanitizeRubyBattleTowerRecord
SanitizeRubyBattleTowerRecord: @ 0x080E82DC
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SanitizeRubyBattleTowerRecord

	thumb_func_start sub_080E82F4
sub_080E82F4: @ 0x080E82F4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r0, _080E831C
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E8316
	bl m4aSoundMain
	bl m4aSoundMain
	bl m4aSoundMain
_080E8316:
	pop {r0}
	bx r0
	.align 2, 0
_080E831C: .4byte 0x02039CBC
	thumb_func_end sub_080E82F4

	thumb_func_start sub_080E8320
sub_080E8320: @ 0x080E8320
	push {r4, lr}
	sub sp, #4
	ldr r1, _080E8340
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #7
	bls _080E8336
	b _080E8480
_080E8336:
	lsls r0, r0, #2
	ldr r1, _080E8344
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E8340: .4byte 0x03002360
_080E8344: .4byte 0x080E8348
_080E8348: @ jump table
	.4byte _080E8368 @ case 0
	.4byte _080E8380 @ case 1
	.4byte _080E8386 @ case 2
	.4byte _080E83AC @ case 3
	.4byte _080E83B4 @ case 4
	.4byte _080E83C8 @ case 5
	.4byte _080E83E8 @ case 6
	.4byte _080E840C @ case 7
_080E8368:
	movs r0, #0
	bl SetVBlankCallback
	bl sub_080E9560
	ldr r1, _080E837C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080E8400
	.align 2, 0
_080E837C: .4byte 0x03002360
_080E8380:
	bl sub_080E96A8
	b _080E83F8
_080E8386:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080E83A4
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	bl sub_080E96DC
	ldr r1, _080E83A8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080E8400
	.align 2, 0
_080E83A4: .4byte 0x08566D08
_080E83A8: .4byte 0x03002360
_080E83AC:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	b _080E8400
_080E83B4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E8480
	movs r0, #0
	bl ShowBg
	b _080E83F8
_080E83C8:
	ldr r0, _080E83E0
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl sub_08196F98
	ldr r1, _080E83E4
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080E8400
	.align 2, 0
_080E83E0: .4byte 0x08566D0C
_080E83E4: .4byte 0x03002360
_080E83E8:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_080E83F8:
	ldr r1, _080E8408
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_080E8400:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080E8480
	.align 2, 0
_080E8408: .4byte 0x03002360
_080E840C:
	bl sub_080E96C8
	ldr r1, _080E8488
	movs r0, #0x48
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x31
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0xe1
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #7
	bl SetGpuReg
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _080E848C
	bl SetVBlankCallback
	ldr r0, _080E8490
	bl SetMainCallback2
	ldr r0, _080E8494
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080E8498
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r4, #0
	movs r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x10]
	ldr r0, _080E849C
	strb r4, [r0]
	bl m4aSoundInit
	ldr r0, _080E84A0
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	strb r4, [r0]
_080E8480:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E8488: .4byte 0x00001111
_080E848C: .4byte 0x080E82F5
_080E8490: .4byte 0x080E82DD
_080E8494: .4byte 0x080E84A5
_080E8498: .4byte 0x03005B60
_080E849C: .4byte 0x02039CBC
_080E84A0: .4byte 0x03002360
	thumb_func_end sub_080E8320

	thumb_func_start SanitizeDayCareMailForRuby
SanitizeDayCareMailForRuby: @ 0x080E84A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r1, _080E85D4
	add r0, sp, #0xc
	movs r2, #0x16
	bl memcpy
	add r0, sp, #0x24
	mov r8, r0
	ldr r1, _080E85D8
	movs r2, #4
	bl memcpy
	add r2, sp, #0x28
	mov sb, r2
	ldr r1, _080E85DC
	mov r0, sb
	movs r2, #4
	bl memcpy
	add r6, sp, #0x2c
	ldr r1, _080E85E0
	adds r0, r6, #0
	movs r2, #0xc
	bl memcpy
	add r7, sp, #0x38
	ldr r1, _080E85E4
	adds r0, r7, #0
	movs r2, #0xe
	bl memcpy
	ldr r0, _080E85E8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _080E85C2
	movs r0, #0
	movs r1, #0
	bl SetStandardWindowBorderStyle
	str r5, [sp]
	movs r4, #0xff
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0xe
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r7, #0
	movs r3, #0x64
	bl AddTextPrinterParameterized
	movs r0, #0
	bl sub_080E9734
	movs r0, #1
	movs r1, #0
	bl SetStandardWindowBorderStyle
	str r5, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #1
	mov r2, r8
	movs r3, #0
	bl AddTextPrinterParameterized
	str r5, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #1
	adds r2, r6, #0
	movs r3, #0x64
	bl AddTextPrinterParameterized
	movs r0, #1
	bl sub_080E9734
	movs r0, #2
	movs r1, #0
	bl SetStandardWindowBorderStyle
	str r5, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #2
	movs r1, #1
	mov r2, sb
	movs r3, #0
	bl AddTextPrinterParameterized
	str r5, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #2
	movs r1, #1
	adds r2, r6, #0
	movs r3, #0x64
	bl AddTextPrinterParameterized
	movs r0, #2
	bl sub_080E9734
	movs r0, #0x40
	movs r1, #0xef
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0x30
	bl SetGpuReg
	movs r0, #0
	bl sub_080E88E8
	ldr r1, _080E85EC
	mov r2, sl
	lsls r0, r2, #2
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080E85F0
	str r1, [r0]
_080E85C2:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E85D4: .4byte 0x08566D2C
_080E85D8: .4byte 0x08566D42
_080E85DC: .4byte 0x08566D46
_080E85E0: .4byte 0x08566D4A
_080E85E4: .4byte 0x08566D56
_080E85E8: .4byte 0x02037C74
_080E85EC: .4byte 0x03005B60
_080E85F0: .4byte 0x080E85F5
	thumb_func_end SanitizeDayCareMailForRuby

	thumb_func_start sub_080E85F4
sub_080E85F4: @ 0x080E85F4
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _080E8674
	adds r4, r4, r0
	movs r6, #0xe0
	str r6, [sp]
	movs r5, #0xc
	str r5, [sp, #4]
	movs r0, #1
	movs r1, #0x11
	movs r2, #0
	movs r3, #0xe
	bl FillWindowPixelRect
	ldr r1, _080E8678
	adds r0, r1, #0
	ldrh r2, [r4, #0xa]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl sub_080E8928
	ldr r1, _080E867C
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	bl sub_080E8978
	str r6, [sp]
	str r5, [sp, #4]
	movs r0, #2
	movs r1, #0x11
	movs r2, #0
	movs r3, #0xe
	bl FillWindowPixelRect
	ldrh r0, [r4, #0xc]
	movs r1, #2
	bl sub_080E8928
	ldr r1, _080E8680
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #2
	bl sub_080E8978
	ldr r0, _080E8684
	str r0, [r4]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E8674: .4byte 0x03005B60
_080E8678: .4byte 0x0000015D
_080E867C: .4byte 0x08568730
_080E8680: .4byte 0x085682F8
_080E8684: .4byte 0x080E8879
	thumb_func_end sub_080E85F4

	thumb_func_start sub_080E8688
sub_080E8688: @ 0x080E8688
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080E86BC
	adds r5, r1, r0
	ldr r6, _080E86C0
	ldrh r2, [r6, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080E86C8
	movs r0, #0
	movs r1, #1
	strh r1, [r5, #0x24]
	strh r0, [r5, #0x26]
_080E86B4:
	ldr r0, _080E86C4
	str r0, [r5]
	b _080E8868
	.align 2, 0
_080E86BC: .4byte 0x03005B60
_080E86C0: .4byte 0x03002360
_080E86C4: .4byte 0x080E89ED
_080E86C8:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080E86D8
	strh r1, [r5, #0x24]
	strh r1, [r5, #0x26]
	b _080E86B4
_080E86D8:
	movs r7, #1
	movs r4, #1
	ands r4, r2
	cmp r4, #0
	beq _080E878C
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080E8722
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _080E870C
	movs r3, #0xc
	ldrsh r4, [r5, r3]
	cmp r4, #0
	beq _080E8702
	ldrh r0, [r5, #0x10]
	bl m4aSongNumStop
	b _080E8716
_080E8702:
	ldrh r0, [r5, #0x10]
	bl m4aSongNumStop
	strh r4, [r5, #0x10]
	b _080E8868
_080E870C:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080E8716
	b _080E8868
_080E8716:
	ldrh r0, [r5, #0xc]
	bl m4aSongNumStart
	ldrh r0, [r5, #0xc]
	strh r0, [r5, #0x10]
	b _080E8868
_080E8722:
	ldrh r1, [r5, #0xe]
	movs r2, #0xe
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _080E8768
	movs r3, #0xa
	ldrsh r4, [r5, r3]
	cmp r4, #0
	beq _080E8754
	ldr r0, _080E8750
	adds r4, r0, #0
	adds r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	ldrh r1, [r5, #0xa]
	adds r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	b _080E877C
	.align 2, 0
_080E8750: .4byte 0x0000015D
_080E8754:
	ldr r2, _080E8764
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	strh r4, [r5, #0xe]
	b _080E8868
	.align 2, 0
_080E8764: .4byte 0x0000015D
_080E8768:
	ldrh r1, [r5, #0xa]
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bne _080E8774
	b _080E8868
_080E8774:
	ldr r2, _080E8788
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080E877C:
	bl m4aSongNumStart
	ldrh r0, [r5, #0xa]
	strh r0, [r5, #0xe]
	b _080E8868
	.align 2, 0
_080E8788: .4byte 0x0000015D
_080E878C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080E87B4
	movs r0, #5
	bl m4aSongNumStart
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080E87B0
	str r0, [r5]
	b _080E8868
	.align 2, 0
_080E87B0: .4byte 0x080E88A9
_080E87B4:
	ldrh r1, [r6, #0x30]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080E87CE
	ldrh r0, [r5, #8]
	eors r0, r7
	strh r0, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080E88E8
	b _080E8868
_080E87CE:
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080E880E
	movs r3, #8
	ldrsh r0, [r5, r3]
	cmp r0, #0
	beq _080E87FC
	ldrh r1, [r5, #0xc]
	movs r2, #0xc
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _080E87F2
	subs r0, r1, #1
	strh r0, [r5, #0xc]
	b _080E8848
_080E87F2:
	ldr r0, _080E87F8
	strh r0, [r5, #0xc]
	b _080E8848
	.align 2, 0
_080E87F8: .4byte 0x0000010D
_080E87FC:
	ldrh r1, [r5, #0xa]
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _080E880A
	subs r0, r1, #1
	b _080E8842
_080E880A:
	movs r0, #0xd1
	b _080E8842
_080E880E:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080E884C
	movs r0, #8
	ldrsh r1, [r5, r0]
	cmp r1, #0
	beq _080E8836
	ldrh r2, [r5, #0xc]
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #0x86
	lsls r0, r0, #1
	cmp r1, r0
	bgt _080E8832
	adds r0, r2, #1
	strh r0, [r5, #0xc]
	b _080E8848
_080E8832:
	strh r3, [r5, #0xc]
	b _080E8848
_080E8836:
	ldrh r2, [r5, #0xa]
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0xd0
	bgt _080E8846
	adds r0, r2, #1
_080E8842:
	strh r0, [r5, #0xa]
	b _080E8848
_080E8846:
	strh r1, [r5, #0xa]
_080E8848:
	movs r0, #1
	b _080E886A
_080E884C:
	ldrh r1, [r6, #0x2c]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080E8864
	ldr r0, _080E8860
	strb r7, [r0]
	b _080E8868
	.align 2, 0
_080E8860: .4byte 0x02039CBC
_080E8864:
	ldr r0, _080E8874
	strb r1, [r0]
_080E8868:
	movs r0, #0
_080E886A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E8874: .4byte 0x02039CBC
	thumb_func_end sub_080E8688

	thumb_func_start sub_080E8878
sub_080E8878: @ 0x080E8878
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_080E8688
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E8898
	ldr r0, _080E88A0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080E88A4
	str r0, [r1]
_080E8898:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E88A0: .4byte 0x03005B60
_080E88A4: .4byte 0x080E85F5
	thumb_func_end sub_080E8878

	thumb_func_start sub_080E88A8
sub_080E88A8: @ 0x080E88A8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080E88E0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080E88D8
	movs r4, #0
_080E88BC:
	adds r0, r4, #0
	bl sub_080E9750
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080E88BC
	adds r0, r5, #0
	bl DestroyTask
	ldr r0, _080E88E4
	bl SetMainCallback2
_080E88D8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E88E0: .4byte 0x02037C74
_080E88E4: .4byte 0x080AA06D
	thumb_func_end sub_080E88A8

	thumb_func_start sub_080E88E8
sub_080E88E8: @ 0x080E88E8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080E88F8
	cmp r0, #1
	beq _080E8910
	b _080E8920
_080E88F8:
	movs r0, #0x42
	movs r1, #0xef
	bl SetGpuReg
	ldr r1, _080E890C
	movs r0, #0x46
	bl SetGpuReg
	b _080E8920
	.align 2, 0
_080E890C: .4byte 0x00003868
_080E8910:
	movs r0, #0x42
	movs r1, #0xef
	bl SetGpuReg
	ldr r1, _080E8924
	movs r0, #0x46
	bl SetGpuReg
_080E8920:
	pop {r0}
	bx r0
	.align 2, 0
_080E8924: .4byte 0x000070A0
	thumb_func_end sub_080E88E8

	thumb_func_start sub_080E8928
sub_080E8928: @ 0x080E8928
	push {r4, r5, lr}
	sub sp, #0xc
	adds r2, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r4, _080E8974
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	movs r1, #0
	movs r0, #0xb0
	strb r0, [r4, #3]
	movs r0, #0xff
	strb r0, [r4, #4]
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	adds r0, r5, #0
	bl sub_080E9734
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E8974: .4byte 0x02021C40
	thumb_func_end sub_080E8928

	thumb_func_start sub_080E8978
sub_080E8978: @ 0x080E8978
	push {r4, lr}
	sub sp, #0x1c
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r2, #0
	movs r1, #0
_080E8986:
	mov r0, sp
	adds r0, r0, r2
	adds r0, #0xc
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080E8986
	add r0, sp, #0xc
	movs r1, #0xff
	strb r1, [r0, #0xf]
	movs r2, #0
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080E89C4
_080E89A6:
	mov r1, sp
	adds r1, r1, r2
	adds r1, #0xc
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080E89C4
	cmp r2, #0xe
	bls _080E89A6
_080E89C4:
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #0x28
	bl AddTextPrinterParameterized
	adds r0, r4, #0
	bl sub_080E9734
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E8978

	thumb_func_start sub_080E89EC
sub_080E89EC: @ 0x080E89EC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080E8A10
	adds r5, r1, r0
	movs r1, #0x26
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _080E8A48
	cmp r0, #1
	bgt _080E8A14
	cmp r0, #0
	beq _080E8A1A
	b _080E8A94
	.align 2, 0
_080E8A10: .4byte 0x03005B60
_080E8A14:
	cmp r0, #2
	beq _080E8A70
	b _080E8A94
_080E8A1A:
	movs r4, #0
_080E8A1C:
	adds r0, r4, #0
	bl sub_080E9750
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080E8A1C
	bl FreeAllWindowBuffers
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080E8A44
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	b _080E8A62
	.align 2, 0
_080E8A44: .4byte 0x08566D08
_080E8A48:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E8A94
	ldr r0, _080E8A6C
	bl InitWindows
	movs r0, #0
	movs r1, #1
	bl SetStandardWindowBorderStyle
_080E8A62:
	ldrh r0, [r5, #0x26]
	adds r0, #1
	strh r0, [r5, #0x26]
	b _080E8A94
	.align 2, 0
_080E8A6C: .4byte 0x08566D64
_080E8A70:
	movs r0, #0
	bl ShowBg
	movs r1, #0xc5
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	movs r1, #0x24
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080E8A90
	ldr r0, _080E8A8C
	b _080E8A92
	.align 2, 0
_080E8A8C: .4byte 0x080E91E5
_080E8A90:
	ldr r0, _080E8A9C
_080E8A92:
	str r0, [r5]
_080E8A94:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E8A9C: .4byte 0x080E8AA1
	thumb_func_end sub_080E89EC

	thumb_func_start sub_080E8AA0
sub_080E8AA0: @ 0x080E8AA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xdc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xb4]
	ldr r1, _080E8D10
	add r0, sp, #0xc
	movs r2, #0xa
	bl memcpy
	add r7, sp, #0x18
	ldr r1, _080E8D14
	adds r0, r7, #0
	movs r2, #0xb
	bl memcpy
	mov r0, sp
	adds r0, #0x24
	str r0, [sp, #0xb8]
	ldr r1, _080E8D18
	movs r2, #0xa
	bl memcpy
	mov r2, sp
	adds r2, #0x30
	str r2, [sp, #0xbc]
	ldr r1, _080E8D1C
	adds r0, r2, #0
	movs r2, #0xa
	bl memcpy
	mov r0, sp
	adds r0, #0x3c
	str r0, [sp, #0xc0]
	ldr r1, _080E8D20
	movs r2, #0xa
	bl memcpy
	mov r2, sp
	adds r2, #0x48
	str r2, [sp, #0xc4]
	ldr r1, _080E8D24
	adds r0, r2, #0
	movs r2, #0xa
	bl memcpy
	mov r0, sp
	adds r0, #0x54
	str r0, [sp, #0xc8]
	ldr r1, _080E8D28
	movs r2, #0xa
	bl memcpy
	mov r2, sp
	adds r2, #0x60
	str r2, [sp, #0xcc]
	ldr r1, _080E8D2C
	adds r0, r2, #0
	movs r2, #0xa
	bl memcpy
	mov r0, sp
	adds r0, #0x6c
	str r0, [sp, #0xd0]
	ldr r1, _080E8D30
	movs r2, #0xa
	bl memcpy
	mov r2, sp
	adds r2, #0x78
	str r2, [sp, #0xd4]
	ldr r1, _080E8D34
	adds r0, r2, #0
	movs r2, #0xa
	bl memcpy
	mov r0, sp
	adds r0, #0x84
	str r0, [sp, #0xd8]
	ldr r1, _080E8D38
	movs r2, #0xa
	bl memcpy
	add r6, sp, #0x90
	ldr r1, _080E8D3C
	adds r0, r6, #0
	movs r2, #9
	bl memcpy
	add r2, sp, #0x9c
	mov r8, r2
	ldr r1, _080E8D40
	mov r0, r8
	movs r2, #9
	bl memcpy
	add r0, sp, #0xa8
	mov sl, r0
	ldr r1, _080E8D44
	movs r2, #9
	bl memcpy
	movs r0, #0
	movs r1, #0
	bl SetStandardWindowBorderStyle
	movs r2, #0x10
	str r2, [sp]
	movs r5, #0xff
	str r5, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #0x88
	bl AddTextPrinterParameterized
	movs r0, #0x20
	mov sb, r0
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r7, #0
	movs r3, #0x88
	bl AddTextPrinterParameterized
	movs r2, #0x50
	str r2, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r6, #0
	movs r3, #0x88
	bl AddTextPrinterParameterized
	movs r7, #0x60
	str r7, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	mov r2, r8
	movs r3, #0x88
	bl AddTextPrinterParameterized
	movs r6, #0x70
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	mov r2, sl
	movs r3, #0x88
	bl AddTextPrinterParameterized
	str r4, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	ldr r2, [sp, #0xb8]
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r0, #0x10
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	ldr r2, [sp, #0xbc]
	movs r3, #8
	bl AddTextPrinterParameterized
	mov r2, sb
	str r2, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	ldr r2, [sp, #0xc0]
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r0, #0x30
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	ldr r2, [sp, #0xc4]
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r0, #0x40
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	ldr r2, [sp, #0xc8]
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r0, #0x50
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	ldr r2, [sp, #0xcc]
	movs r3, #8
	bl AddTextPrinterParameterized
	str r7, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	ldr r2, [sp, #0xd0]
	movs r3, #8
	bl AddTextPrinterParameterized
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	ldr r2, [sp, #0xd4]
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r0, #0x80
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	ldr r2, [sp, #0xd8]
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0xa0
	bl SetGpuReg
	ldr r0, _080E8D48
	strb r4, [r0]
	ldr r0, _080E8D4C
	strb r4, [r0]
	ldr r0, _080E8D50
	str r4, [r0]
	ldr r0, _080E8D54
	strb r4, [r0]
	ldr r1, _080E8D58
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080E8D5C
	str r4, [r0]
	movs r1, #0x78
	str r1, [r0, #4]
	str r4, [r0, #8]
	movs r1, #0xf0
	lsls r1, r1, #6
	str r1, [r0, #0xc]
	movs r1, #0xb4
	str r1, [r0, #0x10]
	str r4, [r0, #0x18]
	str r4, [r0, #0x14]
	str r4, [r0, #0x1c]
	movs r1, #2
	str r1, [r0, #0x20]
	bl sub_080E900C
	movs r0, #9
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_081984F0
	ldr r1, _080E8D60
	ldr r2, [sp, #0xb4]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080E8D64
	str r1, [r0]
	add sp, #0xdc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8D10: .4byte 0x08566D74
_080E8D14: .4byte 0x08566D7E
_080E8D18: .4byte 0x08566D89
_080E8D1C: .4byte 0x08566D93
_080E8D20: .4byte 0x08566D9D
_080E8D24: .4byte 0x08566DA7
_080E8D28: .4byte 0x08566DB1
_080E8D2C: .4byte 0x08566DBB
_080E8D30: .4byte 0x08566DC5
_080E8D34: .4byte 0x08566DCF
_080E8D38: .4byte 0x08566DD9
_080E8D3C: .4byte 0x08566DE3
_080E8D40: .4byte 0x08566DEC
_080E8D44: .4byte 0x08566DF5
_080E8D48: .4byte 0x02039CBD
_080E8D4C: .4byte 0x02039CBE
_080E8D50: .4byte 0x03005E1C
_080E8D54: .4byte 0x02039CE4
_080E8D58: .4byte 0x02039CE5
_080E8D5C: .4byte 0x02039CC0
_080E8D60: .4byte 0x03005B60
_080E8D64: .4byte 0x080E8D69
	thumb_func_end sub_080E8AA0

	thumb_func_start sub_080E8D68
sub_080E8D68: @ 0x080E8D68
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080E8D90
	ldrh r3, [r1, #0x2e]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080E8D9C
	ldr r1, _080E8D94
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x26]
	ldr r1, _080E8D98
	str r1, [r0]
	b _080E8F8E
	.align 2, 0
_080E8D90: .4byte 0x03002360
_080E8D94: .4byte 0x03005B60
_080E8D98: .4byte 0x080E9411
_080E8D9C:
	ldrh r1, [r1, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080E8DB0
	movs r0, #1
	rsbs r0, r0, #0
	bl Menu_MoveCursorNoWrapAround
	b _080E8F8E
_080E8DB0:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080E8DC0
	movs r0, #1
	bl Menu_MoveCursorNoWrapAround
	b _080E8F8E
_080E8DC0:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _080E8DDC
	ldr r0, _080E8DD8
	ldrb r1, [r0]
	movs r2, #1
	eors r1, r2
	strb r1, [r0]
	bl sub_080E900C
	b _080E8F8E
	.align 2, 0
_080E8DD8: .4byte 0x02039CE4
_080E8DDC:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _080E8E00
	ldr r4, _080E8DFC
	ldrb r0, [r4]
	movs r1, #1
	eors r0, r1
	strb r0, [r4]
	bl sub_080E900C
	ldrb r0, [r4]
	bl SetPokemonCryStereo
	b _080E8F8E
	.align 2, 0
_080E8DFC: .4byte 0x02039CE5
_080E8E00:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080E8E0E
	movs r0, #0xa
	b _080E8E36
_080E8E0E:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080E8E1E
	movs r0, #0xa
	rsbs r0, r0, #0
	b _080E8E36
_080E8E1E:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080E8E2C
	movs r0, #1
	rsbs r0, r0, #0
	b _080E8E36
_080E8E2C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080E8E40
	movs r0, #1
_080E8E36:
	bl sub_080E8FA4
	bl sub_080E900C
	b _080E8F8E
_080E8E40:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080E8E4A
	b _080E8F6A
_080E8E4A:
	ldr r4, _080E8EAC
	ldrb r0, [r4, #4]
	bl SetPokemonCryVolume
	movs r0, #8
	ldrsb r0, [r4, r0]
	bl SetPokemonCryPanpot
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	bl SetPokemonCryPitch
	ldrh r0, [r4, #0x10]
	bl SetPokemonCryLength
	ldr r0, [r4, #0x18]
	bl SetPokemonCryProgress
	ldrb r0, [r4, #0x14]
	bl SetPokemonCryRelease
	movs r0, #0x1c
	ldrsb r0, [r4, r0]
	bl SetPokemonCryChorus
	ldr r0, [r4, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetPokemonCryPriority
	ldr r4, [r4]
	adds r0, r4, #0
	cmp r4, #0
	bge _080E8E90
	adds r0, #0x7f
_080E8E90:
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E8EE4
	cmp r0, #1
	bgt _080E8EB0
	cmp r0, #0
	beq _080E8EBA
	b _080E8F6A
	.align 2, 0
_080E8EAC: .4byte 0x02039CC0
_080E8EB0:
	cmp r0, #2
	beq _080E8F10
	cmp r0, #3
	beq _080E8F3C
	b _080E8F6A
_080E8EBA:
	ldr r0, _080E8ECC
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E8ED4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E8ED0
	b _080E8F60
	.align 2, 0
_080E8ECC: .4byte 0x02039CE4
_080E8ED0: .4byte 0x08626A44
_080E8ED4:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E8EE0
	b _080E8F60
	.align 2, 0
_080E8EE0: .4byte 0x08625814
_080E8EE4:
	ldr r0, _080E8EF8
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E8F00
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E8EFC
	b _080E8F60
	.align 2, 0
_080E8EF8: .4byte 0x02039CE4
_080E8EFC: .4byte 0x08627044
_080E8F00:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E8F0C
	b _080E8F60
	.align 2, 0
_080E8F0C: .4byte 0x08625E14
_080E8F10:
	ldr r0, _080E8F24
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E8F2C
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E8F28
	b _080E8F60
	.align 2, 0
_080E8F24: .4byte 0x02039CE4
_080E8F28: .4byte 0x08627644
_080E8F2C:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E8F38
	b _080E8F60
	.align 2, 0
_080E8F38: .4byte 0x08626414
_080E8F3C:
	ldr r0, _080E8F50
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E8F58
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E8F54
	b _080E8F60
	.align 2, 0
_080E8F50: .4byte 0x02039CE4
_080E8F54: .4byte 0x08627C44
_080E8F58:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E8F94
_080E8F60:
	adds r0, r0, r1
	bl SetPokemonCryTone
	ldr r1, _080E8F98
	str r0, [r1]
_080E8F6A:
	ldr r0, _080E8F98
	ldr r0, [r0]
	cmp r0, #0
	beq _080E8F8E
	ldr r5, _080E8F9C
	bl IsPokemonCryPlaying
	strb r0, [r5]
	ldr r4, _080E8FA0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	cmp r0, r1
	beq _080E8F8A
	bl sub_080E900C
_080E8F8A:
	ldrb r0, [r5]
	strb r0, [r4]
_080E8F8E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E8F94: .4byte 0x08626A14
_080E8F98: .4byte 0x03005E1C
_080E8F9C: .4byte 0x02039CBD
_080E8FA0: .4byte 0x02039CBE
	thumb_func_end sub_080E8D68

	thumb_func_start sub_080E8FA4
sub_080E8FA4: @ 0x080E8FA4
	push {r4, r5, r6, lr}
	sub sp, #0x40
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _080E9004
	mov r0, sp
	movs r2, #0x40
	bl memcpy
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r5, r2, #0
	ldr r1, _080E9008
	lsls r0, r2, #2
	adds r3, r0, r1
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	ldr r1, [r3]
	adds r1, r1, r4
	str r1, [r3]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #2
	mov r6, sp
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r1, r0
	ble _080E8FEA
	lsls r0, r2, #3
	add r0, sp
	ldr r0, [r0]
	str r0, [r3]
_080E8FEA:
	lsls r0, r5, #3
	add r0, sp
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	bge _080E8FFA
	ldr r0, [r4]
	str r0, [r3]
_080E8FFA:
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9004: .4byte 0x08566E00
_080E9008: .4byte 0x02039CC0
	thumb_func_end sub_080E8FA4

	thumb_func_start sub_080E900C
sub_080E900C: @ 0x080E900C
	push {r4, lr}
	ldr r4, _080E90B0
	ldr r0, [r4]
	adds r0, #1
	movs r1, #0x50
	movs r2, #0
	movs r3, #5
	bl sub_080E90C0
	ldr r0, [r4, #4]
	movs r1, #0x50
	movs r2, #0x10
	movs r3, #5
	bl sub_080E90C0
	ldr r0, [r4, #8]
	movs r1, #0x50
	movs r2, #0x20
	movs r3, #5
	bl sub_080E90C0
	ldr r0, [r4, #0xc]
	movs r1, #0x50
	movs r2, #0x30
	movs r3, #5
	bl sub_080E90C0
	ldr r0, [r4, #0x10]
	movs r1, #0x50
	movs r2, #0x40
	movs r3, #5
	bl sub_080E90C0
	ldr r0, [r4, #0x14]
	movs r1, #0x50
	movs r2, #0x50
	movs r3, #5
	bl sub_080E90C0
	ldr r0, [r4, #0x18]
	movs r1, #0x50
	movs r2, #0x60
	movs r3, #5
	bl sub_080E90C0
	ldr r0, [r4, #0x1c]
	movs r1, #0x50
	movs r2, #0x70
	movs r3, #5
	bl sub_080E90C0
	ldr r0, [r4, #0x20]
	movs r1, #0x50
	movs r2, #0x80
	movs r3, #5
	bl sub_080E90C0
	ldr r0, _080E90B4
	ldrb r0, [r0]
	movs r1, #0xc8
	movs r2, #0x50
	movs r3, #1
	bl sub_080E90C0
	ldr r0, _080E90B8
	ldrb r0, [r0]
	movs r1, #0xc8
	movs r2, #0x60
	movs r3, #1
	bl sub_080E90C0
	ldr r0, _080E90BC
	ldrb r0, [r0]
	movs r1, #0xc8
	movs r2, #0x70
	movs r3, #1
	bl sub_080E90C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E90B0: .4byte 0x02039CC0
_080E90B4: .4byte 0x02039CBD
_080E90B8: .4byte 0x02039CE4
_080E90BC: .4byte 0x02039CE5
	thumb_func_end sub_080E900C

	thumb_func_start sub_080E90C0
sub_080E90C0: @ 0x080E90C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	add r1, sp, #0xc
	ldr r0, _080E91E0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	movs r5, #0
	add r0, sp, #0x24
	mov sb, r0
	cmp r5, r7
	bgt _080E9108
	mov r4, sb
	movs r3, #0
_080E90F4:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, r0
	strb r3, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r7
	ble _080E90F4
_080E9108:
	adds r0, r7, #1
	add r0, sb
	movs r1, #0xff
	strb r1, [r0]
	movs r1, #0
	mov r3, r8
	cmp r3, #0
	bge _080E911E
	rsbs r3, r3, #0
	mov r8, r3
	movs r1, #1
_080E911E:
	movs r4, #0
	mov sl, r4
	cmp r7, #1
	bne _080E912A
	movs r5, #1
	mov sl, r5
_080E912A:
	subs r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #0x18
	lsls r6, r6, #0x18
	str r6, [sp, #0x30]
	lsls r2, r2, #0x18
	str r2, [sp, #0x34]
	cmp r0, #0
	blt _080E91AE
	str r1, [sp, #0x2c]
_080E9140:
	asrs r6, r0, #0x18
	lsls r0, r6, #2
	add r0, sp
	adds r0, #0xc
	ldr r1, [r0]
	mov r0, r8
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r0, #0
	bne _080E9164
	mov r0, sl
	cmp r0, #0
	bne _080E9164
	lsls r4, r5, #0x18
	cmp r6, #0
	bne _080E9190
_080E9164:
	lsls r4, r5, #0x18
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	beq _080E917E
	mov r3, sl
	cmp r3, #0
	bne _080E917E
	asrs r0, r4, #0x18
	subs r0, r7, r0
	subs r0, #1
	add r0, sb
	movs r1, #0xae
	strb r1, [r0]
_080E917E:
	asrs r1, r4, #0x18
	subs r1, r7, r1
	add r1, sb
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	subs r0, #0x5f
	strb r0, [r1]
	movs r5, #1
	mov sl, r5
_080E9190:
	asrs r4, r4, #0x18
	lsls r0, r4, #2
	add r0, sp
	adds r0, #0xc
	ldr r1, [r0]
	mov r0, r8
	bl __modsi3
	mov r8, r0
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	lsls r0, r5, #0x18
	cmp r0, #0
	bge _080E9140
_080E91AE:
	ldr r0, [sp, #0x30]
	lsrs r3, r0, #0x18
	ldr r1, [sp, #0x34]
	lsrs r0, r1, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	mov r2, sb
	bl AddTextPrinterParameterized
	movs r0, #0
	bl sub_080E9734
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E91E0: .4byte 0x08566E40
	thumb_func_end sub_080E90C0

	thumb_func_start sub_080E91E4
sub_080E91E4: @ 0x080E91E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x14
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080E9270
	add r0, sp, #0xc
	movs r2, #3
	bl memcpy
	add r0, sp, #0x10
	mov r8, r0
	ldr r1, _080E9274
	movs r2, #4
	bl memcpy
	movs r0, #0xe
	str r0, [sp]
	movs r6, #0xff
	str r6, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #0xa
	bl AddTextPrinterParameterized
	movs r0, #0x1c
	str r0, [sp]
	str r6, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	mov r2, r8
	movs r3, #0xa
	bl AddTextPrinterParameterized
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0xa0
	bl SetGpuReg
	ldr r0, _080E9278
	movs r1, #1
	str r1, [r0]
	str r4, [r0, #8]
	str r4, [r0, #0x1c]
	str r4, [r0, #0x18]
	str r4, [r0, #0x14]
	bl sub_080E94B8
	ldr r1, _080E927C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080E9280
	str r1, [r0]
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9270: .4byte 0x08566E5D
_080E9274: .4byte 0x08566E60
_080E9278: .4byte 0x02039CC0
_080E927C: .4byte 0x03005B60
_080E9280: .4byte 0x080E9285
	thumb_func_end sub_080E91E4

	thumb_func_start sub_080E9284
sub_080E9284: @ 0x080E9284
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _080E92A0
	ldr r0, [r2, #0x18]
	cmp r0, #0
	beq _080E92EA
	ldr r0, [r2, #0x14]
	cmp r0, #0
	beq _080E92A4
	subs r0, #1
	str r0, [r2, #0x14]
	b _080E92EA
	.align 2, 0
_080E92A0: .4byte 0x02039CC0
_080E92A4:
	ldr r0, _080E92D0
	ldr r1, [r2, #8]
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080E92D4
	cmp r1, #0x7f
	bne _080E92EA
	ldr r0, [r2, #0x1c]
	adds r0, #2
	str r0, [r2, #0x1c]
	cmp r0, #0x3e
	bgt _080E92EA
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl SE12PanpotControl
	b _080E92EA
	.align 2, 0
_080E92D0: .4byte 0x08566E58
_080E92D4:
	ldr r0, [r2, #0x1c]
	subs r1, r0, #2
	str r1, [r2, #0x1c]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _080E92EA
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	bl SE12PanpotControl
_080E92EA:
	ldr r0, _080E9310
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080E931C
	ldr r1, _080E9314
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x26]
	ldr r1, _080E9318
	str r1, [r0]
	b _080E9400
	.align 2, 0
_080E9310: .4byte 0x03002360
_080E9314: .4byte 0x03005B60
_080E9318: .4byte 0x080E9411
_080E931C:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r1
	cmp r2, #0
	beq _080E9376
	ldr r0, _080E9350
	ldr r5, _080E9354
	ldr r1, [r5, #8]
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080E9358
	cmp r1, #0x7f
	bne _080E936C
	ldrh r0, [r5]
	movs r4, #0x40
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl PlaySE12WithPanning
	str r4, [r5, #0x1c]
	b _080E9364
	.align 2, 0
_080E9350: .4byte 0x08566E58
_080E9354: .4byte 0x02039CC0
_080E9358:
	ldrh r0, [r5]
	movs r1, #0x3f
	bl PlaySE12WithPanning
	movs r0, #0x3f
	str r0, [r5, #0x1c]
_080E9364:
	str r6, [r5, #0x18]
	movs r0, #0x1e
	str r0, [r5, #0x14]
	b _080E93D2
_080E936C:
	ldrh r0, [r5]
	bl PlaySE12WithPanning
	str r4, [r5, #0x18]
	b _080E93D2
_080E9376:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080E9392
	ldr r1, _080E93D8
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	cmp r0, #4
	ble _080E938E
	str r2, [r1, #8]
_080E938E:
	bl sub_080E94B8
_080E9392:
	ldr r0, _080E93DC
	ldrh r1, [r0, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080E93B4
	ldr r1, _080E93D8
	ldr r0, [r1, #8]
	subs r0, #1
	str r0, [r1, #8]
	cmp r0, #0
	bge _080E93B0
	movs r0, #4
	str r0, [r1, #8]
_080E93B0:
	bl sub_080E94B8
_080E93B4:
	ldr r0, _080E93DC
	ldrh r1, [r0, #0x30]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080E93E4
	ldr r2, _080E93D8
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	ldr r1, _080E93E0
	cmp r0, r1
	ble _080E93D2
	movs r0, #0
	str r0, [r2]
_080E93D2:
	bl sub_080E94B8
	b _080E9400
	.align 2, 0
_080E93D8: .4byte 0x02039CC0
_080E93DC: .4byte 0x03002360
_080E93E0: .4byte 0x0000010D
_080E93E4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080E9400
	ldr r1, _080E9408
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	cmp r0, #0
	bge _080E93FC
	ldr r0, _080E940C
	str r0, [r1]
_080E93FC:
	bl sub_080E94B8
_080E9400:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9408: .4byte 0x02039CC0
_080E940C: .4byte 0x0000010D
	thumb_func_end sub_080E9284

	thumb_func_start sub_080E9410
sub_080E9410: @ 0x080E9410
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080E9434
	adds r4, r1, r0
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080E9460
	cmp r0, #1
	bgt _080E9438
	cmp r0, #0
	beq _080E943E
	b _080E94A2
	.align 2, 0
_080E9434: .4byte 0x03005B60
_080E9438:
	cmp r0, #2
	beq _080E9480
	b _080E94A2
_080E943E:
	movs r0, #0
	bl sub_080E9750
	bl FreeAllWindowBuffers
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080E945C
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	b _080E9472
	.align 2, 0
_080E945C: .4byte 0x08566D08
_080E9460:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E94A2
	ldr r0, _080E947C
	bl InitWindows
_080E9472:
	ldrh r0, [r4, #0x26]
	adds r0, #1
	strh r0, [r4, #0x26]
	b _080E94A2
	.align 2, 0
_080E947C: .4byte 0x08566D0C
_080E9480:
	movs r0, #0
	bl ShowBg
	ldr r1, _080E94A8
	movs r0, #0
	bl SetGpuReg
	ldr r1, _080E94AC
	movs r0, #0x40
	bl SetGpuReg
	ldr r1, _080E94B0
	movs r0, #0x44
	bl SetGpuReg
	ldr r0, _080E94B4
	str r0, [r4]
_080E94A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E94A8: .4byte 0x00007140
_080E94AC: .4byte 0x000011DF
_080E94B0: .4byte 0x0000011F
_080E94B4: .4byte 0x080E84A5
	thumb_func_end sub_080E9410

	thumb_func_start sub_080E94B8
sub_080E94B8: @ 0x080E94B8
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r1, _080E951C
	add r0, sp, #0xc
	movs r2, #5
	bl memcpy
	add r5, sp, #0x14
	ldr r1, _080E9520
	adds r0, r5, #0
	movs r2, #5
	bl memcpy
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0x11
	movs r2, #0x64
	movs r3, #0x1c
	bl FillWindowPixelRect
	ldr r4, _080E9524
	ldr r0, [r4]
	movs r1, #0x64
	movs r2, #0xe
	movs r3, #3
	bl sub_080E90C0
	ldr r1, _080E9528
	ldr r0, [r4, #8]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080E952C
	cmp r1, #0x7f
	bne _080E954A
	movs r0, #0x1c
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	add r2, sp, #0xc
	b _080E953C
	.align 2, 0
_080E951C: .4byte 0x08566E64
_080E9520: .4byte 0x08566E69
_080E9524: .4byte 0x02039CC0
_080E9528: .4byte 0x08566E58
_080E952C:
	movs r0, #0x1c
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
_080E953C:
	movs r3, #0x64
	bl AddTextPrinterParameterized
	movs r0, #0
	bl sub_080E9734
	b _080E9556
_080E954A:
	adds r0, r1, #0
	movs r1, #0x64
	movs r2, #0x1c
	movs r3, #3
	bl sub_080E90C0
_080E9556:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E94B8

	thumb_func_start sub_080E9560
sub_080E9560: @ 0x080E9560
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r3, #0xc0
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #9
	add r0, sp, #4
	mov r8, r0
	mov r2, sp
	movs r6, #0
	ldr r1, _080E96A0
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _080E96A4
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_080E9586:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r5
	subs r4, r4, r5
	cmp r4, r5
	bhi _080E9586
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, #4]
	lsrs r0, r4, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	movs r3, #0x80
	lsls r3, r3, #3
	movs r4, #0
	str r4, [sp, #4]
	ldr r2, _080E96A0
	mov r1, r8
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r3, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r3, r3, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r3, r0
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xe
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x42
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x46
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E96A0: .4byte 0x040000D4
_080E96A4: .4byte 0x81000800
	thumb_func_end sub_080E9560

	thumb_func_start sub_080E96A8
sub_080E96A8: @ 0x080E96A8
	push {lr}
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl ResetAllPicSprites
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E96A8

	thumb_func_start sub_080E96C8
sub_080E96C8: @ 0x080E96C8
	push {lr}
	ldr r1, _080E96D8
	movs r0, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080E96D8: .4byte 0x00007140
	thumb_func_end sub_080E96C8

	thumb_func_start sub_080E96DC
sub_080E96DC: @ 0x080E96DC
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E96DC

	thumb_func_start sub_080E9734
sub_080E9734: @ 0x080E9734
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080E9734

	thumb_func_start sub_080E9750
sub_080E9750: @ 0x080E9750
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	bl ClearWindowTilemap
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	adds r0, r4, #0
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E9750

