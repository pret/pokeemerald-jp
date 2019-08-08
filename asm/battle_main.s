.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CB2_InitBattle
CB2_InitBattle: @ 0x080365B4
	push {lr}
	bl MoveSaveBlocks_ResetHeap
	bl AllocateBattleResources
	bl AllocateBattleSpritesData
	bl AllocateMonSpritesGfx
	bl sub_08185CDC
	ldr r0, _080365E8
	ldr r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08036620
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _080365EC
	bl CB2_InitBattleInternal
	b _0803660E
	.align 2, 0
_080365E8: .4byte 0x02022C90
_080365EC:
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _08036608
	bl HandleLinkBattleSetup
	ldr r0, _08036604
	bl SetMainCallback2
	b _0803660E
	.align 2, 0
_08036604: .4byte 0x0803782D
_08036608:
	ldr r0, _08036618
	bl SetMainCallback2
_0803660E:
	ldr r1, _0803661C
	movs r0, #0
	strb r0, [r1]
	b _08036624
	.align 2, 0
_08036618: .4byte 0x08037A7D
_0803661C: .4byte 0x02023FD6
_08036620:
	bl CB2_InitBattleInternal
_08036624:
	pop {r0}
	bx r0
	thumb_func_end CB2_InitBattle

	thumb_func_start CB2_InitBattleInternal
CB2_InitBattleInternal: @ 0x08036628
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080366A0
	mov r0, sp
	bl CpuSet
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	ldr r1, _080366A4
	movs r0, #0x44
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	ldr r0, _080366A8
	movs r2, #0xf0
	strh r2, [r0]
	ldr r0, _080366AC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080366C4
	ldr r0, _080366B0
	ldrh r1, [r0]
	ldr r0, _080366B4
	cmp r1, r0
	beq _080366C4
	ldr r1, _080366B8
	movs r0, #0x9f
	strh r0, [r1]
	ldr r0, _080366BC
	strh r2, [r0]
	ldr r1, _080366C0
	movs r0, #0x20
	strh r0, [r1]
	b _08036712
	.align 2, 0
_080366A0: .4byte 0x05006000
_080366A4: .4byte 0x00005051
_080366A8: .4byte 0x02022AD8
_080366AC: .4byte 0x02022C90
_080366B0: .4byte 0x0203886E
_080366B4: .4byte 0x00000C03
_080366B8: .4byte 0x02022ADA
_080366BC: .4byte 0x02022ADC
_080366C0: .4byte 0x02022ADE
_080366C4:
	ldr r0, _0803679C
	ldr r2, _080367A0
	adds r1, r2, #0
	strh r1, [r0]
	bl ScanlineEffect_Clear
	ldr r0, _080367A4
	movs r3, #0xf0
	movs r5, #0xf0
	lsls r5, r5, #3
	adds r2, r0, r5
	movs r1, #0x4f
_080366DC:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, #2
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080366DC
	movs r1, #0x50
	ldr r4, _080367A8
	ldr r0, _080367A4
	ldr r3, _080367AC
	movs r5, #0x82
	lsls r5, r5, #4
	adds r2, r0, r5
	adds r0, #0xa0
_080366FA:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, #2
	adds r0, #2
	adds r1, #1
	cmp r1, #0x9f
	ble _080366FA
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	bl ScanlineEffect_SetParams
_08036712:
	bl ResetPaletteFade
	ldr r0, _080367B0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080367B4
	strh r1, [r0]
	ldr r0, _080367B8
	strh r1, [r0]
	ldr r0, _080367BC
	strh r1, [r0]
	ldr r0, _080367C0
	strh r1, [r0]
	ldr r0, _080367C4
	strh r1, [r0]
	ldr r0, _080367C8
	strh r1, [r0]
	ldr r0, _080367CC
	strh r1, [r0]
	bl BattleSetup_GetTerrainId
	ldr r2, _080367D0
	strb r0, [r2]
	ldr r4, _080367D4
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08036752
	movs r0, #8
	strb r0, [r2]
_08036752:
	bl sub_08035528
	bl LoadBattleTextboxAndBackground
	bl ResetSpriteData
	bl ResetTasks
	bl DrawBattleEntryBackground
	bl FreeAllSpritePalettes
	ldr r1, _080367D8
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080367DC
	bl SetVBlankCallback
	bl SetUpBattleVarsAndBirchZigzagoon
	ldr r2, [r4]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	beq _08036792
	ldr r1, _080367E0
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	bne _080367E8
_08036792:
	ldr r0, _080367E4
	bl SetMainCallback2
	b _08036802
	.align 2, 0
_0803679C: .4byte 0x02022ADA
_080367A0: .4byte 0x00005051
_080367A4: .4byte 0x020388C8
_080367A8: .4byte 0x082EBAC8
_080367AC: .4byte 0x0000FF10
_080367B0: .4byte 0x02022AC8
_080367B4: .4byte 0x02022ACA
_080367B8: .4byte 0x02022ACC
_080367BC: .4byte 0x02022ACE
_080367C0: .4byte 0x02022AD0
_080367C4: .4byte 0x02022AD2
_080367C8: .4byte 0x02022AD4
_080367CC: .4byte 0x02022AD6
_080367D0: .4byte 0x02022C94
_080367D4: .4byte 0x02022C90
_080367D8: .4byte 0x030030BC
_080367DC: .4byte 0x080386DD
_080367E0: .4byte 0x00400040
_080367E4: .4byte 0x08037275
_080367E8:
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	beq _080367FC
	ldr r0, _080367F8
	bl SetMainCallback2
	b _08036802
	.align 2, 0
_080367F8: .4byte 0x08037B45
_080367FC:
	ldr r0, _08036880
	bl SetMainCallback2
_08036802:
	ldr r5, _08036884
	ldr r0, [r5]
	ldr r1, _08036888
	ands r0, r1
	cmp r0, #0
	bne _0803683C
	ldr r4, _0803688C
	ldr r0, _08036890
	ldrh r1, [r0]
	adds r0, r4, #0
	movs r2, #1
	bl CreateNPCTrainerParty
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08036838
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, _08036894
	ldrh r1, [r1]
	movs r2, #0
	bl CreateNPCTrainerParty
_08036838:
	bl SetWildMonHeldItem
_0803683C:
	ldr r1, _08036898
	ldr r2, _0803689C
	adds r1, r1, r2
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080368A0
	ldr r1, [r0]
	ldr r5, _080368A4
	adds r1, r1, r5
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r4, _080368A8
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r5, r4, r0
_08036864:
	adds r0, r4, #0
	movs r1, #3
	bl AdjustFriendship
	adds r4, #0x64
	cmp r4, r5
	ble _08036864
	movs r1, #0
	ldr r0, _080368AC
	strb r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036880: .4byte 0x08036E01
_08036884: .4byte 0x02022C90
_08036888: .4byte 0x01000002
_0803688C: .4byte 0x020243E8
_08036890: .4byte 0x0203886A
_08036894: .4byte 0x0203886C
_08036898: .4byte 0x03002360
_0803689C: .4byte 0x00000439
_080368A0: .4byte 0x03005AF0
_080368A4: .4byte 0x00000CA9
_080368A8: .4byte 0x02024190
_080368AC: .4byte 0x02023FD6
	thumb_func_end CB2_InitBattleInternal

	thumb_func_start sub_080368B0
sub_080368B0: @ 0x080368B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	mov sb, r6
	movs r0, #0xce
	lsls r0, r0, #1
	mov sl, r0
	mov r8, r6
_080368C6:
	movs r0, #0x64
	mov r4, sb
	muls r4, r0, r4
	ldr r0, _08036988
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	adds r1, r0, #0
	cmp r5, #0
	beq _08036942
	cmp r5, sl
	beq _0803690E
	cmp r7, #0
	beq _0803690E
	cmp r1, #0
	bne _0803690E
	movs r0, #1
	mov r2, r8
	lsls r0, r2
	orrs r6, r0
	lsls r0, r6, #0x10
	lsrs r6, r0, #0x10
_0803690E:
	cmp r5, #0
	beq _08036942
	cmp r7, #0
	beq _0803692A
	cmp r5, sl
	beq _0803691E
	cmp r1, #0
	beq _0803692A
_0803691E:
	movs r0, #2
	mov r1, r8
	lsls r0, r1
	orrs r6, r0
	lsls r0, r6, #0x10
	lsrs r6, r0, #0x10
_0803692A:
	cmp r5, #0
	beq _08036942
	cmp r5, sl
	beq _08036942
	cmp r7, #0
	bne _08036942
	movs r0, #3
	mov r2, r8
	lsls r0, r2
	orrs r6, r0
	lsls r0, r6, #0x10
	lsrs r6, r0, #0x10
_08036942:
	movs r0, #2
	add r8, r0
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #5
	ble _080368C6
	ldr r4, _0803698C
	ldr r0, [r4]
	movs r1, #0xc1
	lsls r1, r1, #1
	adds r0, r0, r1
	strb r6, [r0]
	ldr r0, [r4]
	ldr r5, _08036990
	adds r0, r0, r5
	lsrs r1, r6, #8
	strb r1, [r0]
	ldr r0, _08036994
	bl FlagGet
	ldr r1, [r4]
	adds r1, r1, r5
	lsls r0, r0, #7
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036988: .4byte 0x02024190
_0803698C: .4byte 0x02024140
_08036990: .4byte 0x00000183
_08036994: .4byte 0x000008D2
	thumb_func_end sub_080368B0

	thumb_func_start SetPlayerBerryDataInBattleStruct
SetPlayerBerryDataInBattleStruct: @ 0x08036998
	push {r4, r5, r6, r7, lr}
	ldr r0, _08036A00
	ldr r5, [r0]
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r4, r5, r0
	bl IsEnigmaBerryValid
	cmp r0, #1
	bne _08036A14
	movs r2, #0
	ldr r7, _08036A04
	movs r1, #0xc6
	lsls r1, r1, #1
	adds r5, r5, r1
	adds r6, r7, #0
	ldr r3, _08036A08
_080369BA:
	adds r0, r4, r2
	ldr r1, [r6]
	adds r1, r1, r3
	adds r1, r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #5
	ble _080369BA
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
	movs r2, #0
	adds r3, r5, #0
	ldr r6, _08036A04
	ldr r5, _08036A0C
_080369DA:
	adds r0, r3, r2
	ldr r1, [r6]
	adds r1, r1, r5
	adds r1, r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x11
	ble _080369DA
	ldr r0, [r7]
	ldr r1, _08036A10
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #7]
	ldr r0, [r7]
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08036A54
	.align 2, 0
_08036A00: .4byte 0x02024140
_08036A04: .4byte 0x03005AEC
_08036A08: .4byte 0x000031F8
_08036A0C: .4byte 0x00003214
_08036A10: .4byte 0x00003226
_08036A14:
	movs r0, #0xaf
	bl ItemIdToBerryType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBerryInfo
	adds r3, r0, #0
	movs r2, #0
	movs r0, #0xc6
	lsls r0, r0, #1
	adds r5, r5, r0
_08036A2C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #5
	ble _08036A2C
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	movs r2, #0
	adds r1, r0, #0
	adds r1, #0x11
_08036A48:
	strb r2, [r1]
	subs r1, #1
	cmp r1, r0
	bge _08036A48
	movs r0, #0
	strb r0, [r4, #7]
_08036A54:
	strb r0, [r4, #0x1a]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SetPlayerBerryDataInBattleStruct

	thumb_func_start SetAllPlayersBerryData
SetAllPlayersBerryData: @ 0x08036A5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08036B14
	ldr r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036A74
	b _08036BA0
_08036A74:
	bl IsEnigmaBerryValid
	cmp r0, #1
	bne _08036B30
	movs r5, #0
	ldr r3, _08036B18
	ldr r0, _08036B1C
	mov r8, r0
	adds r6, r3, #0
	mov r4, r8
	ldr r2, _08036B20
	adds r7, r3, #0
	adds r7, #0x38
_08036A8E:
	adds r1, r5, r6
	ldr r0, [r4]
	adds r0, r0, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r5, r7
	ldr r0, [r4]
	adds r0, r0, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r5, #1
	cmp r5, #5
	ble _08036A8E
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x38
	adds r0, r5, r0
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	movs r5, #0
	adds r7, r3, #0
	adds r7, #8
	ldr r4, _08036B1C
	ldr r2, _08036B24
	adds r6, r3, #0
	adds r6, #0x40
_08036ACC:
	adds r1, r5, r7
	ldr r0, [r4]
	adds r0, r0, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r5, r6
	ldr r0, [r4]
	adds r0, r0, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r5, #1
	cmp r5, #0x11
	ble _08036ACC
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _08036B28
	adds r0, r0, r2
	ldrb r1, [r0]
	strb r1, [r3, #7]
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x3f
	strb r0, [r1]
	mov r4, r8
	ldr r0, [r4]
	ldr r1, _08036B2C
	adds r0, r0, r1
	ldrb r1, [r0]
	strb r1, [r3, #0x1a]
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x52
	strb r1, [r0]
	b _08036CF4
	.align 2, 0
_08036B14: .4byte 0x02022C90
_08036B18: .4byte 0x020240A8
_08036B1C: .4byte 0x03005AEC
_08036B20: .4byte 0x000031F8
_08036B24: .4byte 0x00003214
_08036B28: .4byte 0x00003226
_08036B2C: .4byte 0x00003227
_08036B30:
	movs r0, #0xaf
	bl ItemIdToBerryType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBerryInfo
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _08036B9C
	adds r7, r4, #0
	adds r7, #0x38
	adds r3, r4, #0
_08036B4A:
	adds r1, r5, r4
	adds r2, r6, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r1, r5, r7
	ldrb r0, [r2]
	strb r0, [r1]
	adds r5, #1
	cmp r5, #5
	ble _08036B4A
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x38
	adds r0, r5, r0
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	movs r5, #0
	adds r4, r3, #0
	adds r4, #8
	movs r1, #0
	adds r2, r3, #0
	adds r2, #0x40
_08036B7C:
	adds r0, r5, r4
	strb r1, [r0]
	adds r0, r5, r2
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0x11
	ble _08036B7C
	movs r1, #0
	strb r1, [r3, #7]
	adds r0, r3, #0
	adds r0, #0x3f
	strb r1, [r0]
	strb r1, [r3, #0x1a]
	adds r0, #0x13
	strb r1, [r0]
	b _08036CF4
	.align 2, 0
_08036B9C: .4byte 0x020240A8
_08036BA0:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08036C44
	movs r0, #0x80
	lsls r0, r0, #1
	ands r1, r0
	movs r2, #4
	mov r8, r2
	cmp r1, #0
	beq _08036BBA
	movs r4, #2
	mov r8, r4
_08036BBA:
	movs r5, #0
	cmp r5, r8
	blt _08036BC2
	b _08036CF4
_08036BC2:
	ldr r0, _08036C38
	mov ip, r0
	ldr r3, _08036C3C
	adds r6, r3, #0
	movs r1, #8
	adds r1, r1, r6
	mov sb, r1
_08036BD0:
	lsls r1, r5, #8
	ldr r0, _08036C40
	adds r7, r1, r0
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	add r0, ip
	ldrb r3, [r0, #0x18]
	movs r4, #0
	adds r5, #1
	mov sl, r5
	lsls r1, r3, #3
	subs r0, r1, r3
	adds r5, r1, #0
	lsls r0, r0, #2
	adds r1, r0, r6
_08036BF0:
	adds r0, r7, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r4, #1
	cmp r4, #5
	ble _08036BF0
	subs r0, r5, r3
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r1, r1, r6
	movs r2, #0xff
	strb r2, [r1]
	movs r4, #0
	mov r2, sb
	adds r1, r0, r2
	adds r2, r7, #0
	adds r2, #8
_08036C14:
	adds r0, r2, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r4, #1
	cmp r4, #0x11
	ble _08036C14
	subs r0, r5, r3
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r7, #7]
	strb r1, [r0, #7]
	ldrb r1, [r7, #0x1a]
	strb r1, [r0, #0x1a]
	mov r5, sl
	cmp r5, r8
	blt _08036BD0
	b _08036CF4
	.align 2, 0
_08036C38: .4byte 0x020226A0
_08036C3C: .4byte 0x020240A8
_08036C40: .4byte 0x02022080
_08036C44:
	movs r5, #0
	ldr r4, _08036D04
	mov sb, r4
_08036C4A:
	lsls r0, r5, #8
	ldr r1, _08036D08
	adds r7, r0, r1
	movs r4, #0
	adds r2, r5, #1
	mov sl, r2
	lsls r0, r5, #3
	mov r8, r0
	adds r1, r5, #2
	mov ip, r1
	subs r1, r0, r5
	mov r2, ip
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	mov r2, sb
	adds r3, r0, r2
	lsls r1, r1, #2
	adds r2, r1, r2
_08036C70:
	adds r0, r7, r4
	ldrb r1, [r0]
	strb r1, [r2]
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, #1
	adds r2, #1
	adds r4, #1
	cmp r4, #5
	ble _08036C70
	mov r0, r8
	subs r3, r0, r5
	lsls r3, r3, #2
	adds r1, r4, r3
	add r1, sb
	ldrb r0, [r1]
	movs r2, #0xff
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r1, r4, r2
	add r1, sb
	ldrb r0, [r1]
	movs r4, #0xff
	orrs r0, r4
	strb r0, [r1]
	movs r4, #0
	ldr r0, _08036D04
	adds r0, #8
	adds r2, r2, r0
	adds r3, r3, r0
	adds r6, r7, #0
	adds r6, #8
_08036CB8:
	adds r0, r6, r4
	ldrb r1, [r0]
	strb r1, [r3]
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r3, #1
	adds r4, #1
	cmp r4, #0x11
	ble _08036CB8
	mov r0, r8
	subs r2, r0, r5
	lsls r2, r2, #2
	add r2, sb
	ldrb r0, [r7, #7]
	strb r0, [r2, #7]
	mov r1, ip
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldrb r1, [r7, #7]
	strb r1, [r0, #7]
	ldrb r1, [r7, #0x1a]
	strb r1, [r2, #0x1a]
	ldrb r1, [r7, #0x1a]
	strb r1, [r0, #0x1a]
	mov r5, sl
	cmp r5, #1
	ble _08036C4A
_08036CF4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036D04: .4byte 0x020240A8
_08036D08: .4byte 0x02022080
	thumb_func_end SetAllPlayersBerryData

	thumb_func_start sub_08036D0C
sub_08036D0C: @ 0x08036D0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r6, #0
	ldr r0, _08036D38
	ldrh r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	mov ip, r0
	cmp r2, r1
	bne _08036D50
	cmp r3, #0
	bne _08036D40
	ldr r0, _08036D3C
	ldr r1, [r0]
	movs r2, #0xc
	b _08036D46
	.align 2, 0
_08036D38: .4byte 0x0202207C
_08036D3C: .4byte 0x02022C90
_08036D40:
	ldr r0, _08036D84
	ldr r1, [r0]
	movs r2, #8
_08036D46:
	orrs r1, r2
	str r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08036D50:
	cmp r6, #0
	bne _08036DF4
	movs r2, #0
	cmp r2, r4
	bge _08036D74
	ldr r1, _08036D88
	mov r8, r1
	movs r5, #0x80
	lsls r5, r5, #1
_08036D62:
	adds r1, r1, r5
	adds r2, #1
	cmp r2, r4
	bge _08036D74
	mov r7, r8
	ldrh r0, [r7]
	ldrh r7, [r1]
	cmp r0, r7
	beq _08036D62
_08036D74:
	cmp r2, r4
	bne _08036D9C
	cmp r3, #0
	bne _08036D8C
	ldr r0, _08036D84
	ldr r1, [r0]
	movs r2, #0xc
	b _08036D92
	.align 2, 0
_08036D84: .4byte 0x02022C90
_08036D88: .4byte 0x0202207C
_08036D8C:
	ldr r0, _08036DE8
	ldr r1, [r0]
	movs r2, #8
_08036D92:
	orrs r1, r2
	str r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08036D9C:
	cmp r6, #0
	bne _08036DF4
	movs r2, #0
	ldr r5, _08036DE8
	cmp r2, r4
	bge _08036DDE
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r1, r0
	beq _08036DD6
_08036DB4:
	lsls r0, r2, #8
	add r0, ip
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	cmp r0, r1
	bls _08036DC6
	cmp r2, r3
	bne _08036DDE
_08036DC6:
	adds r2, #1
	cmp r2, r4
	bge _08036DDE
	lsls r0, r2, #8
	add r0, ip
	ldrh r0, [r0]
	cmp r0, r1
	bne _08036DB4
_08036DD6:
	cmp r2, r3
	beq _08036DB4
	cmp r2, r3
	bge _08036DB4
_08036DDE:
	cmp r2, r4
	bne _08036DEC
	ldr r0, [r5]
	movs r1, #0xc
	b _08036DF0
	.align 2, 0
_08036DE8: .4byte 0x02022C90
_08036DEC:
	ldr r0, [r5]
	movs r1, #8
_08036DF0:
	orrs r0, r1
	str r0, [r5]
_08036DF4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08036D0C

	thumb_func_start CB2_HandleStartBattle
CB2_HandleStartBattle: @ 0x08036E00
	push {r4, r5, r6, lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08036E38
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	adds r4, r5, #0
	eors r4, r0
	ldr r0, _08036E3C
	ldrb r0, [r0]
	cmp r0, #0x12
	bls _08036E2C
	b _08037268
_08036E2C:
	lsls r0, r0, #2
	ldr r1, _08036E40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036E38: .4byte 0x02024118
_08036E3C: .4byte 0x02023FD6
_08036E40: .4byte 0x08036E44
_08036E44: @ jump table
	.4byte _08036E90 @ case 0
	.4byte _08036ED4 @ case 1
	.4byte _08036F98 @ case 2
	.4byte _0803702C @ case 3
	.4byte _08037054 @ case 4
	.4byte _08037248 @ case 5
	.4byte _08037254 @ case 6
	.4byte _08037084 @ case 7
	.4byte _080370AC @ case 8
	.4byte _08037248 @ case 9
	.4byte _08037254 @ case 10
	.4byte _080370DC @ case 11
	.4byte _08037104 @ case 12
	.4byte _08037248 @ case 13
	.4byte _08037254 @ case 14
	.4byte _08037134 @ case 15
	.4byte _08037194 @ case 16
	.4byte _080371BC @ case 17
	.4byte _080371FC @ case 18
_08036E90:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036EBC
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	bl sub_0805EB30
	ldr r1, _08036ECC
	movs r0, #1
	strb r0, [r1]
_08036EBC:
	ldr r0, _08036ED0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08036EC6
	b _08037268
_08036EC6:
	bl LoadWirelessStatusIndicatorSpriteGfx
	b _08037268
	.align 2, 0
_08036ECC: .4byte 0x02023FD6
_08036ED0: .4byte 0x0300319C
_08036ED4:
	ldr r2, _08036F58
	ldr r1, [r2]
	movs r6, #2
	adds r0, r1, #0
	ands r0, r6
	cmp r0, #0
	beq _08036F78
	ldr r0, _08036F5C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08036EEC
	b _08037268
_08036EEC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08036F42
	ldr r4, _08036F60
	ldr r0, [r4]
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r4]
	ldr r2, _08036F64
	adds r1, r0, r2
	movs r0, #3
	strb r0, [r1]
	bl sub_080368B0
	bl SetPlayerBerryDataInBattleStruct
	ldr r0, _08036F68
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r1, r0
	bne _08036F2C
	ldr r0, _08036F6C
	movs r1, #0
	strh r1, [r0, #0x18]
	movs r1, #1
	strh r1, [r0, #0x34]
_08036F2C:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	adds r1, r1, r5
	movs r2, #0x20
	bl SendBlock
	ldr r0, _08036F70
	strb r6, [r0]
_08036F42:
	ldr r0, _08036F74
	ldrb r0, [r0]
	cmp r0, #0
	bne _08036F4C
	b _08037268
_08036F4C:
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	b _08037268
	.align 2, 0
_08036F58: .4byte 0x02022C90
_08036F5C: .4byte 0x030031C4
_08036F60: .4byte 0x02024140
_08036F64: .4byte 0x00000181
_08036F68: .4byte 0x0203886A
_08036F6C: .4byte 0x020226A0
_08036F70: .4byte 0x02023FD6
_08036F74: .4byte 0x0300319C
_08036F78:
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	bne _08036F88
	movs r0, #4
	orrs r1, r0
	str r1, [r2]
_08036F88:
	ldr r1, _08036F94
	movs r0, #0xf
	strb r0, [r1]
	bl SetAllPlayersBerryData
	b _08037268
	.align 2, 0
_08036F94: .4byte 0x02023FD6
_08036F98:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _08036FA6
	b _08037268
_08036FA6:
	bl ResetBlockReceivedFlags
	movs r0, #2
	adds r1, r5, #0
	bl sub_08036D0C
	bl SetAllPlayersBerryData
	ldr r0, _08037018
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803701C
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r1
	movs r1, #0
	movs r0, #0x87
	lsls r0, r0, #1
	strh r0, [r2, #0xa]
	movs r0, #0x5a
	strh r0, [r2, #0xc]
	strh r1, [r2, #0x12]
	ldr r0, _08037020
	ldr r3, [r0]
	movs r6, #0xc1
	lsls r6, r6, #1
	adds r0, r3, r6
	ldrb r1, [r0]
	adds r6, #1
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r2, #0xe]
	ldr r1, _08037024
	lsls r4, r4, #8
	adds r1, #2
	adds r4, r4, r1
	ldrh r0, [r4]
	strh r0, [r2, #0x10]
	lsls r0, r5, #8
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_08185CE8
	ldrh r0, [r4]
	bl sub_08185CE8
	bl SetDeoxysStats
	ldr r1, _08037028
	b _08037262
	.align 2, 0
_08037018: .4byte 0x08035BC9
_0803701C: .4byte 0x03005B60
_08037020: .4byte 0x02024140
_08037024: .4byte 0x0202207C
_08037028: .4byte 0x02023FD6
_0803702C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037038
	b _08037268
_08037038:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803704C
	movs r2, #0xc8
	bl SendBlock
	ldr r1, _08037050
	b _08037262
	.align 2, 0
_0803704C: .4byte 0x02024190
_08037050: .4byte 0x02023FD6
_08037054:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _08037062
	b _08037268
_08037062:
	bl ResetBlockReceivedFlags
	ldr r0, _08037078
	lsls r1, r4, #8
	ldr r2, _0803707C
	adds r1, r1, r2
	movs r2, #0xc8
	bl memcpy
	ldr r1, _08037080
	b _08037262
	.align 2, 0
_08037078: .4byte 0x020243E8
_0803707C: .4byte 0x0202207C
_08037080: .4byte 0x02023FD6
_08037084:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037090
	b _08037268
_08037090:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080370A4
	movs r2, #0xc8
	bl SendBlock
	ldr r1, _080370A8
	b _08037262
	.align 2, 0
_080370A4: .4byte 0x02024258
_080370A8: .4byte 0x02023FD6
_080370AC:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _080370BA
	b _08037268
_080370BA:
	bl ResetBlockReceivedFlags
	ldr r0, _080370D0
	lsls r1, r4, #8
	ldr r2, _080370D4
	adds r1, r1, r2
	movs r2, #0xc8
	bl memcpy
	ldr r1, _080370D8
	b _08037262
	.align 2, 0
_080370D0: .4byte 0x020244B0
_080370D4: .4byte 0x0202207C
_080370D8: .4byte 0x02023FD6
_080370DC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080370E8
	b _08037268
_080370E8:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080370FC
	movs r2, #0xc8
	bl SendBlock
	ldr r1, _08037100
	b _08037262
	.align 2, 0
_080370FC: .4byte 0x02024320
_08037100: .4byte 0x02023FD6
_08037104:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _08037112
	b _08037268
_08037112:
	bl ResetBlockReceivedFlags
	ldr r0, _08037128
	lsls r1, r4, #8
	ldr r2, _0803712C
	adds r1, r1, r2
	movs r2, #0xc8
	bl memcpy
	ldr r1, _08037130
	b _08037262
	.align 2, 0
_08037128: .4byte 0x02024578
_0803712C: .4byte 0x0202207C
_08037130: .4byte 0x02023FD6
_08037134:
	bl sub_08032600
	bl sub_08184D04
	ldr r2, _0803717C
	movs r0, #0
	strb r0, [r2, #1]
	strb r0, [r2, #2]
	ldr r0, _08037180
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803718E
	movs r3, #0
	ldr r1, _08037184
	ldrb r0, [r1]
	adds r5, r2, #0
	cmp r0, #3
	bne _08037172
	movs r4, #0xff
	adds r2, r1, #0
_08037160:
	adds r2, #0x1c
	adds r3, #1
	cmp r3, #1
	bgt _08037172
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #3
	beq _08037160
_08037172:
	cmp r3, #2
	bne _08037188
	movs r0, #0x10
	strb r0, [r5]
	b _08037268
	.align 2, 0
_0803717C: .4byte 0x02023FD6
_08037180: .4byte 0x02022C90
_08037184: .4byte 0x020226A0
_08037188:
	movs r0, #0x12
	strb r0, [r5]
	b _08037268
_0803718E:
	movs r0, #0x12
	strb r0, [r2]
	b _08037268
_08037194:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037268
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080371B4
	movs r2, #4
	bl SendBlock
	ldr r1, _080371B8
	b _08037262
	.align 2, 0
_080371B4: .4byte 0x0203B9F8
_080371B8: .4byte 0x02023FD6
_080371BC:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	bne _08037268
	bl ResetBlockReceivedFlags
	ldr r0, _080371EC
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080371E6
	ldr r0, _080371F0
	lsls r1, r4, #8
	ldr r2, _080371F4
	adds r1, r1, r2
	movs r2, #4
	bl memcpy
_080371E6:
	ldr r1, _080371F8
	b _08037262
	.align 2, 0
_080371EC: .4byte 0x02022C90
_080371F0: .4byte 0x0203B9F8
_080371F4: .4byte 0x0202207C
_080371F8: .4byte 0x02023FD6
_080371FC:
	ldr r0, _08037230
	adds r1, r0, #1
	bl BattleInitAllSprites
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037268
	ldr r2, _08037234
	ldr r1, _08037238
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0803723C
	str r0, [r1]
	ldr r0, _08037240
	bl SetMainCallback2
	ldr r2, _08037244
	ldr r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08037268
	movs r0, #0x20
	orrs r1, r0
	str r1, [r2]
	b _08037268
	.align 2, 0
_08037230: .4byte 0x02023FD7
_08037234: .4byte 0x03005A60
_08037238: .4byte 0x03002360
_0803723C: .4byte 0x08039B35
_08037240: .4byte 0x080380FD
_08037244: .4byte 0x02022C90
_08037248:
	ldr r0, _08037270
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r1, #1
	strb r1, [r0, #1]
_08037254:
	ldr r1, _08037270
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037268
_08037262:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08037268:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037270: .4byte 0x02023FD6
	thumb_func_end CB2_HandleStartBattle

	thumb_func_start CB2_HandleStartMultiPartnerBattle
CB2_HandleStartMultiPartnerBattle: @ 0x08037274
	push {r4, r5, r6, r7, lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080372AC
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	adds r7, r6, #0
	eors r7, r0
	ldr r0, _080372B0
	ldrb r0, [r0]
	cmp r0, #0x10
	bls _080372A0
	b _08037752
_080372A0:
	lsls r0, r0, #2
	ldr r1, _080372B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080372AC: .4byte 0x02024118
_080372B0: .4byte 0x02023FD6
_080372B4: .4byte 0x080372B8
_080372B8: @ jump table
	.4byte _080372FC @ case 0
	.4byte _08037334 @ case 1
	.4byte _08037414 @ case 2
	.4byte _08037468 @ case 3
	.4byte _0803748C @ case 4
	.4byte _08037508 @ case 5
	.4byte _0803752C @ case 6
	.4byte _080375A8 @ case 7
	.4byte _080375C4 @ case 8
	.4byte _080375F4 @ case 9
	.4byte _08037610 @ case 10
	.4byte _0803763C @ case 11
	.4byte _08037658 @ case 12
	.4byte _08037684 @ case 13
	.4byte _080376B6 @ case 14
	.4byte _080376D8 @ case 15
	.4byte _0803771C @ case 16
_080372FC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037328
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	bl sub_0805EB30
	ldr r1, _080373D0
	movs r0, #1
	strb r0, [r1]
_08037328:
	ldr r0, _080373D4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037334
	bl LoadWirelessStatusIndicatorSpriteGfx
_08037334:
	ldr r2, _080373D8
	ldr r1, [r2]
	movs r3, #2
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	beq _080373F4
	ldr r0, _080373DC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803734C
	b _08037752
_0803734C:
	ldr r4, _080373E0
	movs r0, #0
	strh r0, [r4, #0x18]
	strh r3, [r4, #0x34]
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #1
	strh r0, [r1]
	adds r1, #0x1c
	movs r0, #3
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x40
	ldr r1, _080373E4
	ldrh r1, [r1]
	bl GetFrontierTrainerName
	adds r0, r4, #0
	adds r0, #0x5c
	ldr r1, _080373E8
	ldrh r1, [r1]
	bl GetFrontierTrainerName
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080373BC
	ldr r4, _080373EC
	ldr r0, [r4]
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r4]
	ldr r2, _080373F0
	adds r1, r0, r2
	movs r0, #3
	strb r0, [r1]
	bl sub_080368B0
	bl SetPlayerBerryDataInBattleStruct
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	adds r1, r1, r5
	movs r2, #0x20
	bl SendBlock
	ldr r1, _080373D0
	movs r0, #2
	strb r0, [r1]
_080373BC:
	ldr r0, _080373D4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080373C6
	b _08037752
_080373C6:
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	b _08037752
	.align 2, 0
_080373D0: .4byte 0x02023FD6
_080373D4: .4byte 0x0300319C
_080373D8: .4byte 0x02022C90
_080373DC: .4byte 0x030031C4
_080373E0: .4byte 0x020226A0
_080373E4: .4byte 0x0203886A
_080373E8: .4byte 0x0203886C
_080373EC: .4byte 0x02024140
_080373F0: .4byte 0x00000181
_080373F4:
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	bne _08037404
	movs r0, #4
	orrs r1, r0
	str r1, [r2]
_08037404:
	ldr r1, _08037410
	movs r0, #0xd
	strb r0, [r1]
	bl SetAllPlayersBerryData
	b _08037752
	.align 2, 0
_08037410: .4byte 0x02023FD6
_08037414:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _08037422
	b _08037752
_08037422:
	bl ResetBlockReceivedFlags
	movs r0, #2
	adds r1, r6, #0
	bl sub_08036D0C
	bl SetAllPlayersBerryData
	ldr r0, _08037460
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08037464
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	movs r0, #0x87
	lsls r0, r0, #1
	strh r0, [r1, #0xa]
	movs r0, #0x5a
	strh r0, [r1, #0xc]
	strh r2, [r1, #0x12]
	adds r0, #0xeb
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x10]
	b _08037702
	.align 2, 0
_08037460: .4byte 0x08035BC9
_08037464: .4byte 0x03005B60
_08037468:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037474
	b _08037752
_08037474:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037488
_0803747E:
	movs r2, #0xc8
	bl SendBlock
	b _08037702
	.align 2, 0
_08037488: .4byte 0x02024190
_0803748C:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _0803749A
	b _08037752
_0803749A:
	bl ResetBlockReceivedFlags
	ldr r0, _080374D4
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	cmp r0, #0
	beq _080374E0
	ldr r4, _080374D8
	lsls r1, r7, #8
	ldr r5, _080374DC
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #0xc8
	bl memcpy
	movs r0, #0x96
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r1, r6, #8
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #0xc8
	bl memcpy
	b _08037702
	.align 2, 0
_080374D4: .4byte 0x020226A0
_080374D8: .4byte 0x02024190
_080374DC: .4byte 0x0202207C
_080374E0:
	ldr r4, _08037500
	lsls r1, r6, #8
	ldr r5, _08037504
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #0xc8
	bl memcpy
	movs r2, #0x96
	lsls r2, r2, #1
	adds r4, r4, r2
	lsls r1, r7, #8
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #0xc8
	b _080376FE
	.align 2, 0
_08037500: .4byte 0x02024190
_08037504: .4byte 0x0202207C
_08037508:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037514
	b _08037752
_08037514:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037528
	movs r2, #0x64
	bl SendBlock
	b _08037702
	.align 2, 0
_08037528: .4byte 0x02024258
_0803752C:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _0803753A
	b _08037752
_0803753A:
	bl ResetBlockReceivedFlags
	ldr r0, _08037574
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	cmp r0, #0
	beq _08037580
	ldr r4, _08037578
	lsls r1, r7, #8
	ldr r5, _0803757C
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #0x64
	bl memcpy
	movs r0, #0x96
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r1, r6, #8
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #0x64
	bl memcpy
	b _08037702
	.align 2, 0
_08037574: .4byte 0x020226A0
_08037578: .4byte 0x02024258
_0803757C: .4byte 0x0202207C
_08037580:
	ldr r4, _080375A0
	lsls r1, r6, #8
	ldr r5, _080375A4
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #0x64
	bl memcpy
	movs r2, #0x96
	lsls r2, r2, #1
	adds r4, r4, r2
	lsls r1, r7, #8
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #0x64
	b _080376FE
	.align 2, 0
_080375A0: .4byte 0x02024258
_080375A4: .4byte 0x0202207C
_080375A8:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080375B4
	b _08037752
_080375B4:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080375C0
	b _0803747E
	.align 2, 0
_080375C0: .4byte 0x020243E8
_080375C4:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _080375D2
	b _08037752
_080375D2:
	bl ResetBlockReceivedFlags
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080375E2
	b _08037702
_080375E2:
	ldr r0, _080375EC
	ldr r1, _080375F0
	movs r2, #0xc8
	b _080376FE
	.align 2, 0
_080375EC: .4byte 0x020243E8
_080375F0: .4byte 0x0202207C
_080375F4:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037600
	b _08037752
_08037600:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803760C
	b _0803747E
	.align 2, 0
_0803760C: .4byte 0x020244B0
_08037610:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _0803761E
	b _08037752
_0803761E:
	bl ResetBlockReceivedFlags
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037702
	ldr r0, _08037634
	ldr r1, _08037638
	movs r2, #0xc8
	b _080376FE
	.align 2, 0
_08037634: .4byte 0x020244B0
_08037638: .4byte 0x0202207C
_0803763C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037648
	b _08037752
_08037648:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037654
	b _0803747E
	.align 2, 0
_08037654: .4byte 0x02024578
_08037658:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	bne _08037752
	bl ResetBlockReceivedFlags
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037702
	ldr r0, _0803767C
	ldr r1, _08037680
	movs r2, #0xc8
	b _080376FE
	.align 2, 0
_0803767C: .4byte 0x02024578
_08037680: .4byte 0x0202207C
_08037684:
	bl sub_08032600
	bl sub_08184D04
	ldr r2, _080376A8
	movs r0, #0
	strb r0, [r2, #1]
	strb r0, [r2, #2]
	ldr r0, _080376AC
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080376B0
	movs r0, #0xe
	strb r0, [r2]
	b _08037752
	.align 2, 0
_080376A8: .4byte 0x02023FD6
_080376AC: .4byte 0x02022C90
_080376B0:
	movs r0, #0x10
	strb r0, [r2]
	b _08037752
_080376B6:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037752
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080376D4
	movs r2, #4
	bl SendBlock
	b _08037702
	.align 2, 0
_080376D4: .4byte 0x0203B9F8
_080376D8:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	bne _08037752
	bl ResetBlockReceivedFlags
	ldr r0, _0803770C
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08037702
	ldr r0, _08037710
	lsls r1, r7, #8
	ldr r2, _08037714
	adds r1, r1, r2
	movs r2, #4
_080376FE:
	bl memcpy
_08037702:
	ldr r1, _08037718
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08037752
	.align 2, 0
_0803770C: .4byte 0x02022C90
_08037710: .4byte 0x0203B9F8
_08037714: .4byte 0x0202207C
_08037718: .4byte 0x02023FD6
_0803771C:
	ldr r0, _08037758
	adds r1, r0, #1
	bl BattleInitAllSprites
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037752
	bl sub_08165F94
	ldr r2, _0803775C
	ldr r1, _08037760
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _08037764
	str r0, [r1]
	ldr r0, _08037768
	bl SetMainCallback2
	ldr r2, _0803776C
	ldr r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08037752
	movs r0, #0x20
	orrs r1, r0
	str r1, [r2]
_08037752:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037758: .4byte 0x02023FD7
_0803775C: .4byte 0x03005A60
_08037760: .4byte 0x03002360
_08037764: .4byte 0x08039B35
_08037768: .4byte 0x080380FD
_0803776C: .4byte 0x02022C90
	thumb_func_end CB2_HandleStartMultiPartnerBattle

	thumb_func_start sub_08037770
sub_08037770: @ 0x08037770
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r7, #0
	ldr r6, _08037820
	mov sb, r6
_08037786:
	mov r0, sl
	adds r1, r7, r0
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _08037824
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r5, r7, #5
	strh r0, [r6]
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	strh r0, [r6, #2]
	movs r0, #4
	add r0, sb
	mov r8, r0
	adds r2, r5, r0
	adds r0, r4, #0
	movs r1, #2
	bl GetMonData
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	strb r0, [r6, #0xf]
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	strh r0, [r6, #0x12]
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	mov r1, sb
	adds r1, #0x14
	adds r5, r5, r1
	str r0, [r5]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [r6, #0x18]
	adds r0, r4, #0
	bl GetMonGender
	strb r0, [r6, #0x1c]
	adds r6, #0x20
	adds r7, #1
	cmp r7, #2
	ble _08037786
	ldr r0, _08037828
	ldr r0, [r0]
	mov r1, r8
	subs r1, #4
	movs r2, #0x60
	bl memcpy
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037820: .4byte 0x02022C9C
_08037824: .4byte 0x02024190
_08037828: .4byte 0x02022CFC
	thumb_func_end sub_08037770

	thumb_func_start CB2_PreInitMultiBattle
CB2_PreInitMultiBattle: @ 0x0803782C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #4
	mov sb, r0
	movs r4, #0xf
	ldr r6, _08037890
	ldr r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08037852
	movs r1, #2
	mov sb, r1
	movs r4, #3
_08037852:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08037894
	adds r0, #0x25
	movs r2, #0
	mov r8, r2
	strb r7, [r0]
	ldr r0, _08037898
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0xb4
	str r1, [sp]
	adds r0, #0xac
	mov sl, r0
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r5, _0803789C
	ldrb r0, [r5]
	cmp r0, #1
	beq _080378F4
	cmp r0, #1
	bgt _080378A0
	cmp r0, #0
	beq _080378AE
	b _08037A5A
	.align 2, 0
_08037890: .4byte 0x02022C90
_08037894: .4byte 0x02024118
_08037898: .4byte 0x02024140
_0803789C: .4byte 0x02023FD6
_080378A0:
	cmp r0, #2
	bne _080378A6
	b _080379B4
_080378A6:
	cmp r0, #3
	bne _080378AC
	b _080379EE
_080378AC:
	b _08037A5A
_080378AE:
	ldr r0, _080378EC
	ldrb r0, [r0]
	cmp r0, #0
	bne _080378B8
	b _08037A5A
_080378B8:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080378C4
	b _08037A5A
_080378C4:
	ldr r4, _080378F0
	movs r0, #0x60
	bl Alloc
	str r0, [r4]
	movs r0, #0
	bl sub_08037770
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	movs r2, #0x60
	bl SendBlock
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08037A5A
	.align 2, 0
_080378EC: .4byte 0x030031C4
_080378F0: .4byte 0x02022CFC
_080378F4:
	bl GetBlockReceivedStatus
	adds r1, r4, #0
	ands r1, r0
	cmp r1, r4
	beq _08037902
	b _08037A5A
_08037902:
	bl ResetBlockReceivedFlags
	movs r5, #0
	cmp r8, sb
	bge _0803797E
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r6, r0, #2
	mov r8, r5
	ldr r4, _08037940
_08037916:
	cmp r5, r7
	beq _0803796E
	mov r2, sb
	cmp r2, #4
	bne _08037964
	ldr r2, _08037944
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, #0x18]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08037948
	adds r0, r6, r2
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08037954
	b _0803796E
	.align 2, 0
_08037940: .4byte 0x0202207C
_08037944: .4byte 0x020226A0
_08037948:
	adds r0, r6, r2
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803796E
_08037954:
	ldr r0, _08037960
	adds r1, r4, #0
	movs r2, #0x60
	bl memcpy
	b _0803796E
	.align 2, 0
_08037960: .4byte 0x02022C9C
_08037964:
	ldr r0, _080379A0
	adds r1, r4, #0
	movs r2, #0x60
	bl memcpy
_0803796E:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r4, r2
	movs r0, #0x1c
	add r8, r0
	adds r5, #1
	cmp r5, sb
	blt _08037916
_0803797E:
	ldr r1, _080379A4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _080379A8
	ldr r0, [r1, #8]
	ldr r2, [sp]
	str r0, [r2]
	ldr r0, _080379AC
	ldr r0, [r0]
	mov r2, sl
	str r0, [r2]
	ldr r0, _080379B0
	str r0, [r1, #8]
	bl sub_081B8DF0
	b _08037A5A
	.align 2, 0
_080379A0: .4byte 0x02022C9C
_080379A4: .4byte 0x02023FD6
_080379A8: .4byte 0x03002360
_080379AC: .4byte 0x02022C90
_080379B0: .4byte 0x0803782D
_080379B4:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037A5A
	ldr r0, _080379E0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08037A5A
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _080379E4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080379E8
	bl sub_0800A8D4
	b _08037A5A
	.align 2, 0
_080379E0: .4byte 0x02037C74
_080379E4: .4byte 0x0300319C
_080379E8:
	bl sub_0800A7F8
	b _08037A5A
_080379EE:
	ldr r0, _08037A24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037A34
	bl sub_08010000
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037A5A
	mov r1, sl
	ldr r0, [r1]
	str r0, [r6]
	ldr r1, _08037A28
	ldr r2, [sp]
	ldr r0, [r2]
	str r0, [r1, #8]
	ldr r0, _08037A2C
	bl SetMainCallback2
	ldr r4, _08037A30
	ldr r0, [r4]
	bl Free
	mov r0, r8
	str r0, [r4]
	b _08037A5A
	.align 2, 0
_08037A24: .4byte 0x0300319C
_08037A28: .4byte 0x03002360
_08037A2C: .4byte 0x08036629
_08037A30: .4byte 0x02022CFC
_08037A34:
	ldr r0, _08037A6C
	ldrb r5, [r0]
	cmp r5, #0
	bne _08037A5A
	mov r1, sl
	ldr r0, [r1]
	str r0, [r6]
	ldr r1, _08037A70
	ldr r2, [sp]
	ldr r0, [r2]
	str r0, [r1, #8]
	ldr r0, _08037A74
	bl SetMainCallback2
	ldr r4, _08037A78
	ldr r0, [r4]
	bl Free
	str r5, [r4]
_08037A5A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037A6C: .4byte 0x030031C4
_08037A70: .4byte 0x03002360
_08037A74: .4byte 0x08036629
_08037A78: .4byte 0x02022CFC
	thumb_func_end CB2_PreInitMultiBattle

	thumb_func_start CB2_PreInitIngamePlayerPartnerBattle
CB2_PreInitIngamePlayerPartnerBattle: @ 0x08037A7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08037AAC
	ldr r0, [r0]
	movs r1, #0xb4
	adds r1, r1, r0
	mov r8, r1
	adds r7, r0, #0
	adds r7, #0xac
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r5, _08037AB0
	ldrb r0, [r5]
	cmp r0, #0
	beq _08037AB4
	cmp r0, #1
	beq _08037AF4
	b _08037B26
	.align 2, 0
_08037AAC: .4byte 0x02024140
_08037AB0: .4byte 0x02023FD6
_08037AB4:
	ldr r4, _08037AE4
	movs r0, #0x60
	bl Alloc
	str r0, [r4]
	movs r0, #3
	bl sub_08037770
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08037AE8
	ldr r0, [r1, #8]
	mov r2, r8
	str r0, [r2]
	ldr r0, _08037AEC
	ldr r0, [r0]
	str r0, [r7]
	ldr r0, _08037AF0
	str r0, [r1, #8]
	bl sub_081B8DF0
	b _08037B26
	.align 2, 0
_08037AE4: .4byte 0x02022CFC
_08037AE8: .4byte 0x03002360
_08037AEC: .4byte 0x02022C90
_08037AF0: .4byte 0x08037A7D
_08037AF4:
	ldr r0, _08037B30
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _08037B26
	movs r0, #2
	strb r0, [r5]
	ldr r1, _08037B34
	ldr r0, [r7]
	str r0, [r1]
	ldr r1, _08037B38
	mov r2, r8
	ldr r0, [r2]
	str r0, [r1, #8]
	ldr r0, _08037B3C
	bl SetMainCallback2
	ldr r4, _08037B40
	ldr r0, [r4]
	bl Free
	str r6, [r4]
_08037B26:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037B30: .4byte 0x02037C74
_08037B34: .4byte 0x02022C90
_08037B38: .4byte 0x03002360
_08037B3C: .4byte 0x08036629
_08037B40: .4byte 0x02022CFC
	thumb_func_end CB2_PreInitIngamePlayerPartnerBattle

	thumb_func_start CB2_HandleStartMultiBattle
CB2_HandleStartMultiBattle: @ 0x08037B44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08037B7C
	adds r0, #0x25
	strb r7, [r0]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08037B80
	ldrb r0, [r0]
	cmp r0, #0xa
	bls _08037B70
	b _080380D4
_08037B70:
	lsls r0, r0, #2
	ldr r1, _08037B84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08037B7C: .4byte 0x02024118
_08037B80: .4byte 0x02023FD6
_08037B84: .4byte 0x08037B88
_08037B88: @ jump table
	.4byte _08037BB4 @ case 0
	.4byte _08037BF8 @ case 1
	.4byte _08037CA0 @ case 2
	.4byte _08037D76 @ case 3
	.4byte _08037D9C @ case 4
	.4byte _08037E90 @ case 5
	.4byte _08037EB4 @ case 6
	.4byte _08037FA8 @ case 7
	.4byte _08038008 @ case 8
	.4byte _08038048 @ case 9
	.4byte _08038098 @ case 10
_08037BB4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037BE0
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	bl sub_0805EB30
	ldr r1, _08037BF0
	movs r0, #1
	strb r0, [r1]
_08037BE0:
	ldr r0, _08037BF4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037BEA
	b _080380D4
_08037BEA:
	bl LoadWirelessStatusIndicatorSpriteGfx
	b _080380D4
	.align 2, 0
_08037BF0: .4byte 0x02023FD6
_08037BF4: .4byte 0x0300319C
_08037BF8:
	ldr r2, _08037C68
	ldr r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08037C80
	ldr r0, _08037C6C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037C0E
	b _080380D4
_08037C0E:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037C52
	ldr r4, _08037C70
	ldr r0, [r4]
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r4]
	ldr r2, _08037C74
	adds r1, r0, r2
	movs r0, #3
	strb r0, [r1]
	bl sub_080368B0
	bl SetPlayerBerryDataInBattleStruct
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	adds r1, r1, r5
	movs r2, #0x20
	bl SendBlock
	ldr r1, _08037C78
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08037C52:
	ldr r0, _08037C7C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037C5C
	b _080380D4
_08037C5C:
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	b _080380D4
	.align 2, 0
_08037C68: .4byte 0x02022C90
_08037C6C: .4byte 0x030031C4
_08037C70: .4byte 0x02024140
_08037C74: .4byte 0x00000181
_08037C78: .4byte 0x02023FD6
_08037C7C: .4byte 0x0300319C
_08037C80:
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	bne _08037C90
	movs r0, #4
	orrs r1, r0
	str r1, [r2]
_08037C90:
	ldr r1, _08037C9C
	movs r0, #7
	strb r0, [r1]
	bl SetAllPlayersBerryData
	b _080380D4
	.align 2, 0
_08037C9C: .4byte 0x02023FD6
_08037CA0:
	bl GetBlockReceivedStatus
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xf
	beq _08037CAE
	b _080380D4
_08037CAE:
	bl ResetBlockReceivedFlags
	movs r0, #4
	adds r1, r7, #0
	bl sub_08036D0C
	bl SetAllPlayersBerryData
	bl SetDeoxysStats
	ldr r0, _08037D14
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08037D18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0x87
	lsls r1, r1, #1
	strh r1, [r0, #0xa]
	movs r1, #0x5a
	strh r1, [r0, #0xc]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0xe]
	strh r2, [r0, #0x10]
	ldr r1, _08037D1C
	adds r4, r0, #0
	adds r5, r1, #2
	movs r7, #0x3f
	movs r6, #3
_08037CF4:
	ldrh r0, [r5]
	str r2, [sp]
	bl sub_08185CE8
	ldr r0, _08037D20
	ldr r2, [sp]
	adds r0, r2, r0
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	beq _08037D36
	cmp r0, #1
	bgt _08037D24
	cmp r0, #0
	beq _08037D2E
	b _08037D5C
	.align 2, 0
_08037D14: .4byte 0x08035BC9
_08037D18: .4byte 0x03005B60
_08037D1C: .4byte 0x0202207C
_08037D20: .4byte 0x020226A0
_08037D24:
	cmp r0, #2
	beq _08037D3E
	cmp r0, #3
	beq _08037D4E
	b _08037D5C
_08037D2E:
	ldrh r0, [r5]
	adds r1, r7, #0
	ands r1, r0
	b _08037D46
_08037D36:
	ldrh r0, [r5]
	adds r1, r7, #0
	ands r1, r0
	b _08037D56
_08037D3E:
	ldrh r0, [r5]
	adds r1, r7, #0
	ands r1, r0
	lsls r1, r1, #6
_08037D46:
	ldrh r0, [r4, #0xe]
	orrs r1, r0
	strh r1, [r4, #0xe]
	b _08037D5C
_08037D4E:
	ldrh r0, [r5]
	adds r1, r7, #0
	ands r1, r0
	lsls r1, r1, #6
_08037D56:
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
_08037D5C:
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	adds r2, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08037CF4
	bl ZeroEnemyPartyMons
	ldr r1, _08037D94
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08037D76:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037D82
	b _080380D4
_08037D82:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037D98
	movs r2, #0xc8
	bl SendBlock
	b _08038082
	.align 2, 0
_08037D94: .4byte 0x02023FD6
_08037D98: .4byte 0x02024190
_08037D9C:
	bl GetBlockReceivedStatus
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xf
	beq _08037DAA
	b _080380D4
_08037DAA:
	bl ResetBlockReceivedFlags
	movs r6, #0
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	mov r8, r0
	ldr r4, _08037DD4
	movs r5, #0
_08037DBC:
	cmp r6, r7
	bne _08037DF0
	ldr r0, _08037DD8
	adds r0, r5, r0
	ldrh r0, [r0, #0x18]
	cmp r0, #2
	bgt _08037DDC
	cmp r0, #1
	bge _08037DE8
	cmp r0, #0
	beq _08037DE0
	b _08037E7A
	.align 2, 0
_08037DD4: .4byte 0x0202207C
_08037DD8: .4byte 0x020226A0
_08037DDC:
	cmp r0, #3
	bne _08037E7A
_08037DE0:
	ldr r0, _08037DE4
	b _08037E60
	.align 2, 0
_08037DE4: .4byte 0x02024190
_08037DE8:
	ldr r0, _08037DEC
	b _08037E60
	.align 2, 0
_08037DEC: .4byte 0x020242BC
_08037DF0:
	ldr r2, _08037E10
	adds r0, r5, r2
	ldrh r1, [r0, #0x18]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08037E14
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08037E22
	b _08037E48
	.align 2, 0
_08037E10: .4byte 0x020226A0
_08037E14:
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08037E48
_08037E22:
	adds r0, r5, r2
	ldrh r0, [r0, #0x18]
	cmp r0, #2
	bgt _08037E34
	cmp r0, #1
	bge _08037E40
	cmp r0, #0
	beq _08037E38
	b _08037E7A
_08037E34:
	cmp r0, #3
	bne _08037E7A
_08037E38:
	ldr r0, _08037E3C
	b _08037E60
	.align 2, 0
_08037E3C: .4byte 0x02024190
_08037E40:
	ldr r0, _08037E44
	b _08037E60
	.align 2, 0
_08037E44: .4byte 0x020242BC
_08037E48:
	adds r0, r5, r2
	ldrh r0, [r0, #0x18]
	cmp r0, #2
	bgt _08037E5A
	cmp r0, #1
	bge _08037E70
	cmp r0, #0
	beq _08037E5E
	b _08037E7A
_08037E5A:
	cmp r0, #3
	bne _08037E7A
_08037E5E:
	ldr r0, _08037E6C
_08037E60:
	adds r1, r4, #0
	movs r2, #0xc8
	bl memcpy
	b _08037E7A
	.align 2, 0
_08037E6C: .4byte 0x020243E8
_08037E70:
	ldr r0, _08037E8C
	adds r1, r4, #0
	movs r2, #0xc8
	bl memcpy
_08037E7A:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r4, r2
	adds r5, #0x1c
	adds r6, #1
	cmp r6, #3
	ble _08037DBC
	b _08038082
	.align 2, 0
_08037E8C: .4byte 0x02024514
_08037E90:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037E9C
	b _080380D4
_08037E9C:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037EB0
	movs r2, #0x64
	bl SendBlock
	b _08038082
	.align 2, 0
_08037EB0: .4byte 0x02024258
_08037EB4:
	bl GetBlockReceivedStatus
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xf
	beq _08037EC2
	b _080380D4
_08037EC2:
	bl ResetBlockReceivedFlags
	movs r6, #0
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	mov r8, r0
	ldr r4, _08037EEC
	movs r5, #0
_08037ED4:
	cmp r6, r7
	bne _08037F08
	ldr r0, _08037EF0
	adds r0, r5, r0
	ldrh r0, [r0, #0x18]
	cmp r0, #2
	bgt _08037EF4
	cmp r0, #1
	bge _08037F00
	cmp r0, #0
	beq _08037EF8
	b _08037F92
	.align 2, 0
_08037EEC: .4byte 0x0202207C
_08037EF0: .4byte 0x020226A0
_08037EF4:
	cmp r0, #3
	bne _08037F92
_08037EF8:
	ldr r0, _08037EFC
	b _08037F78
	.align 2, 0
_08037EFC: .4byte 0x02024258
_08037F00:
	ldr r0, _08037F04
	b _08037F78
	.align 2, 0
_08037F04: .4byte 0x02024384
_08037F08:
	ldr r2, _08037F28
	adds r0, r5, r2
	ldrh r1, [r0, #0x18]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08037F2C
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08037F3A
	b _08037F60
	.align 2, 0
_08037F28: .4byte 0x020226A0
_08037F2C:
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08037F60
_08037F3A:
	adds r0, r5, r2
	ldrh r0, [r0, #0x18]
	cmp r0, #2
	bgt _08037F4C
	cmp r0, #1
	bge _08037F58
	cmp r0, #0
	beq _08037F50
	b _08037F92
_08037F4C:
	cmp r0, #3
	bne _08037F92
_08037F50:
	ldr r0, _08037F54
	b _08037F78
	.align 2, 0
_08037F54: .4byte 0x02024258
_08037F58:
	ldr r0, _08037F5C
	b _08037F78
	.align 2, 0
_08037F5C: .4byte 0x02024384
_08037F60:
	adds r0, r5, r2
	ldrh r0, [r0, #0x18]
	cmp r0, #2
	bgt _08037F72
	cmp r0, #1
	bge _08037F88
	cmp r0, #0
	beq _08037F76
	b _08037F92
_08037F72:
	cmp r0, #3
	bne _08037F92
_08037F76:
	ldr r0, _08037F84
_08037F78:
	adds r1, r4, #0
	movs r2, #0x64
	bl memcpy
	b _08037F92
	.align 2, 0
_08037F84: .4byte 0x020244B0
_08037F88:
	ldr r0, _08037FA4
	adds r1, r4, #0
	movs r2, #0x64
	bl memcpy
_08037F92:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r4, r2
	adds r5, #0x1c
	adds r6, #1
	cmp r6, #3
	ble _08037ED4
	b _08038082
	.align 2, 0
_08037FA4: .4byte 0x020245DC
_08037FA8:
	bl sub_08032600
	bl sub_08184D04
	ldr r3, _08037FF0
	movs r0, #0
	strb r0, [r3, #1]
	strb r0, [r3, #2]
	ldr r0, _08037FF4
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08038002
	movs r6, #0
	ldr r0, _08037FF8
	ldrb r1, [r0]
	adds r4, r3, #0
	adds r2, r0, #0
	cmp r1, #3
	bne _08037FE6
	movs r3, #0xff
_08037FD4:
	adds r2, #0x1c
	adds r6, #1
	cmp r6, #3
	bgt _08037FE6
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #3
	beq _08037FD4
_08037FE6:
	cmp r6, #4
	bne _08037FFC
	movs r0, #8
	strb r0, [r4]
	b _080380D4
	.align 2, 0
_08037FF0: .4byte 0x02023FD6
_08037FF4: .4byte 0x02022C90
_08037FF8: .4byte 0x020226A0
_08037FFC:
	movs r0, #0xa
	strb r0, [r4]
	b _080380D4
_08038002:
	movs r0, #0xa
	strb r0, [r3]
	b _080380D4
_08038008:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080380D4
	ldr r0, _0803803C
	ldr r4, [r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, _08038040
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _08038044
	ldr r0, [r0]
	str r0, [r4, #4]
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	movs r2, #8
	bl SendBlock
	b _08038082
	.align 2, 0
_0803803C: .4byte 0x02024140
_08038040: .4byte 0x02022C90
_08038044: .4byte 0x0203B9F8
_08038048:
	bl GetBlockReceivedStatus
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xf
	bne _080380D4
	bl ResetBlockReceivedFlags
	movs r2, #0
	b _08038062
_0803805C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08038062:
	cmp r2, #3
	bhi _08038082
	ldr r4, _0803808C
	lsls r3, r2, #8
	adds r0, r3, r4
	ldrh r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803805C
	adds r1, r4, #4
	adds r1, r3, r1
	ldr r0, _08038090
	movs r2, #4
	bl memcpy
_08038082:
	ldr r1, _08038094
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080380D4
	.align 2, 0
_0803808C: .4byte 0x0202207C
_08038090: .4byte 0x0203B9F8
_08038094: .4byte 0x02023FD6
_08038098:
	ldr r0, _080380E0
	adds r1, r0, #1
	bl BattleInitAllSprites
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080380D4
	ldr r2, _080380E4
	ldr r1, _080380E8
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _080380EC
	str r0, [r1]
	ldr r0, _080380F0
	bl SetMainCallback2
	ldr r3, _080380F4
	ldr r2, [r3]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080380D4
	ldr r0, _080380F8
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	strh r1, [r0]
	movs r0, #0x20
	orrs r2, r0
	str r2, [r3]
_080380D4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080380E0: .4byte 0x02023FD7
_080380E4: .4byte 0x03005A60
_080380E8: .4byte 0x03002360
_080380EC: .4byte 0x08039B35
_080380F0: .4byte 0x080380FD
_080380F4: .4byte 0x02022C90
_080380F8: .4byte 0x0203886A
	thumb_func_end CB2_HandleStartMultiBattle

	thumb_func_start BattleMainCB2
BattleMainCB2: @ 0x080380FC
	push {lr}
	sub sp, #4
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	ldr r0, _08038164
	ldrh r1, [r0, #0x2c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803815E
	ldr r0, _08038168
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0803815E
	bl sub_081861A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803815E
	ldr r2, _0803816C
	ldr r1, _08038170
	movs r0, #5
	strb r0, [r1]
	movs r0, #5
	strh r0, [r2]
	bl ResetPaletteFadeControl
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _08038174
	bl SetMainCallback2
_0803815E:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08038164: .4byte 0x03002360
_08038168: .4byte 0x02022C90
_0803816C: .4byte 0x02037290
_08038170: .4byte 0x02023FDE
_08038174: .4byte 0x080381C1
	thumb_func_end BattleMainCB2

	thumb_func_start FreeRestoreBattleData
FreeRestoreBattleData: @ 0x08038178
	push {lr}
	ldr r1, _080381B0
	ldr r0, _080381B4
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _080381B8
	movs r0, #3
	strb r0, [r2, #0x15]
	ldr r0, _080381BC
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	bl ZeroEnemyPartyMons
	movs r0, #0x5a
	bl m4aSongNumStop
	bl FreeMonSpritesGfx
	bl FreeBattleSpritesData
	bl FreeBattleResources
	pop {r0}
	bx r0
	.align 2, 0
_080381B0: .4byte 0x03002360
_080381B4: .4byte 0x03005A60
_080381B8: .4byte 0x020397C8
_080381BC: .4byte 0x00000439
	thumb_func_end FreeRestoreBattleData

	thumb_func_start CB2_QuitRecordedBattle
CB2_QuitRecordedBattle: @ 0x080381C0
	push {lr}
	bl UpdatePaletteFade
	ldr r0, _080381F4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080381EE
	ldr r0, _080381F8
	bl m4aMPlayStop
	ldr r0, _080381FC
	bl m4aMPlayStop
	bl FreeRestoreBattleData
	bl FreeAllWindowBuffers
	ldr r0, _08038200
	ldr r0, [r0, #8]
	bl SetMainCallback2
_080381EE:
	pop {r0}
	bx r0
	.align 2, 0
_080381F4: .4byte 0x02037C74
_080381F8: .4byte 0x03007510
_080381FC: .4byte 0x03007550
_08038200: .4byte 0x03002360
	thumb_func_end CB2_QuitRecordedBattle

	thumb_func_start sub_08038204
sub_08038204: @ 0x08038204
	movs r1, #0
	strh r1, [r0, #0x2e]
	ldr r1, _08038210
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_08038210: .4byte 0x08038215
	thumb_func_end sub_08038204

	thumb_func_start sub_08038214
sub_08038214: @ 0x08038214
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r5, _0803822C
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	cmp r1, #1
	beq _08038248
	cmp r1, #1
	bgt _08038230
	cmp r1, #0
	beq _08038236
	b _080382B8
	.align 2, 0
_0803822C: .4byte 0x0201C000
_08038230:
	cmp r1, #2
	beq _080382A4
	b _080382B8
_08038236:
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	strh r1, [r3, #0x30]
	ldr r0, _080382A0
	strh r0, [r3, #0x32]
	strh r1, [r3, #0x34]
	movs r0, #1
	strh r0, [r3, #0x36]
_08038248:
	ldrh r0, [r3, #0x36]
	subs r0, #1
	strh r0, [r3, #0x36]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080382B8
	movs r0, #2
	strh r0, [r3, #0x36]
	movs r4, #0x30
	ldrsh r2, [r3, r4]
	movs r0, #0x34
	ldrsh r1, [r3, r0]
	lsls r1, r1, #5
	adds r2, r2, r1
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	subs r0, r0, r1
	movs r4, #0x3d
	lsls r0, r0, #1
	adds r0, r0, r5
	lsls r2, r2, #1
	adds r2, r2, r5
	movs r1, #0x1c
_08038276:
	strh r4, [r2]
	strh r4, [r0]
	adds r0, #4
	adds r2, #4
	subs r1, #2
	cmp r1, #0
	bge _08038276
	ldrh r0, [r3, #0x34]
	adds r0, #1
	strh r0, [r3, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bne _080382B8
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	movs r0, #0x20
	strh r0, [r3, #0x30]
	b _080382B8
	.align 2, 0
_080382A0: .4byte 0x00000281
_080382A4:
	ldrh r0, [r3, #0x30]
	subs r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _080382B8
	ldr r0, _080382C0
	bl SetMainCallback2
_080382B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080382C0: .4byte 0x080365B5
	thumb_func_end sub_08038214

	thumb_func_start CreateNPCTrainerParty
CreateNPCTrainerParty: @ 0x080382C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r3, r0
	bne _080382EA
	movs r0, #0
	b _08038696
_080382EA:
	ldr r4, _08038328
	ldr r0, [r4]
	ldr r1, _0803832C
	ands r0, r1
	lsls r3, r3, #5
	str r3, [sp, #0x20]
	cmp r0, #8
	beq _080382FC
	b _0803868E
_080382FC:
	cmp r2, #1
	bne _08038304
	bl ZeroEnemyPartyMons
_08038304:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08038334
	ldr r0, _08038330
	ldr r1, [sp, #0x20]
	adds r2, r1, r0
	ldrb r1, [r2, #0x18]
	movs r3, #3
	str r3, [sp, #0x18]
	adds r4, r0, #0
	cmp r1, #3
	bhi _08038340
	adds r2, r1, #0
	str r2, [sp, #0x18]
	b _08038340
	.align 2, 0
_08038328: .4byte 0x02022C90
_0803832C: .4byte 0x043F0908
_08038330: .4byte 0x082E383C
_08038334:
	ldr r1, _0803835C
	ldr r2, [sp, #0x20]
	adds r0, r2, r1
	ldrb r0, [r0, #0x18]
	str r0, [sp, #0x18]
	adds r4, r1, #0
_08038340:
	movs r3, #0
	str r3, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r3, r0
	blt _0803834C
	b _0803867E
_0803834C:
	ldr r2, [sp, #0x20]
	adds r1, r2, r4
	ldrb r0, [r1, #0x12]
	cmp r0, #1
	bne _08038360
	movs r3, #0x80
	mov sl, r3
	b _08038372
	.align 2, 0
_0803835C: .4byte 0x082E383C
_08038360:
	ldrb r1, [r1, #2]
	movs r0, #0x80
	ands r0, r1
	movs r1, #0x88
	mov sl, r1
	cmp r0, #0
	beq _08038372
	movs r2, #0x78
	mov sl, r2
_08038372:
	movs r6, #0
	ldr r2, [sp, #0x20]
	adds r1, r4, #4
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r3, [sp, #0x14]
	adds r3, #1
	str r3, [sp, #0x1c]
	cmp r0, #0xff
	beq _0803839E
	adds r3, r1, #0
_08038388:
	adds r1, r2, #0
	adds r0, r6, r2
	adds r0, r0, r3
	ldrb r0, [r0]
	add sb, r0
	adds r6, #1
	adds r1, r6, r1
	adds r1, r1, r3
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08038388
_0803839E:
	ldr r1, [sp, #0x20]
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803844C
	cmp r0, #1
	bgt _080383B2
	cmp r0, #0
	beq _080383C0
	b _08038670
_080383B2:
	cmp r0, #2
	bne _080383B8
	b _08038510
_080383B8:
	cmp r0, #3
	bne _080383BE
	b _080385A8
_080383BE:
	b _08038670
_080383C0:
	adds r0, r4, #0
	adds r0, #0x1c
	ldr r2, [sp, #0x20]
	adds r0, r2, r0
	ldr r4, [r0]
	movs r6, #0
	ldr r3, [sp, #0x14]
	lsls r2, r3, #3
	adds r0, r2, r4
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08038448
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r5, r2, #0
	cmp r0, #0xff
	beq _08038406
	adds r3, r1, #0
_080383E8:
	adds r0, r2, r4
	ldrh r0, [r0, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r6, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	add sb, r0
	adds r6, #1
	adds r1, r6, r1
	adds r1, r1, r3
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080383E8
_08038406:
	mov r2, sb
	lsls r0, r2, #8
	add sl, r0
	adds r4, r5, r4
	ldrh r1, [r4]
	lsls r0, r1, #5
	subs r0, r0, r1
	movs r1, #0xff
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x14]
	movs r1, #0x64
	adds r0, r3, #0
	muls r0, r1, r0
	ldr r2, [sp, #0x10]
	adds r0, r2, r0
	ldrh r1, [r4, #4]
	ldrb r2, [r4, #2]
	movs r3, #1
	str r3, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	adds r3, r6, #0
	bl CreateMon
	b _08038670
	.align 2, 0
_08038448: .4byte 0x082EA31C
_0803844C:
	adds r0, r4, #0
	adds r0, #0x1c
	ldr r1, [sp, #0x20]
	adds r0, r1, r0
	ldr r7, [r0]
	movs r6, #0
	ldr r3, [sp, #0x14]
	lsls r2, r3, #4
	adds r0, r2, r7
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08038508
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, #0xff
	beq _08038492
	adds r3, r1, #0
_08038474:
	adds r0, r2, r7
	ldrh r0, [r0, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r6, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	add sb, r0
	adds r6, #1
	adds r1, r6, r1
	adds r1, r1, r3
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08038474
_08038492:
	mov r2, sb
	lsls r0, r2, #8
	add sl, r0
	mov r3, r8
	adds r4, r3, r7
	ldrh r1, [r4]
	lsls r0, r1, #5
	subs r0, r0, r1
	movs r1, #0xff
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [sp, #0x14]
	movs r1, #0x64
	adds r5, r0, #0
	muls r5, r1, r5
	ldr r2, [sp, #0x10]
	adds r5, r2, r5
	ldrh r1, [r4, #4]
	ldrb r2, [r4, #2]
	movs r0, #1
	str r0, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r3, r6, #0
	bl CreateMon
	movs r6, #0
	mov r0, r8
	adds r0, #6
	adds r4, r7, r0
_080384DC:
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r5, #0
	adds r2, r4, #0
	bl SetMonData
	adds r1, r6, #0
	adds r1, #0x11
	ldrh r0, [r4]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _0803850C
	adds r2, r2, r0
	adds r0, r5, #0
	bl SetMonData
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _080384DC
	b _08038670
	.align 2, 0
_08038508: .4byte 0x082EA31C
_0803850C: .4byte 0x082ED224
_08038510:
	adds r0, r4, #0
	adds r0, #0x1c
	ldr r1, [sp, #0x20]
	adds r0, r1, r0
	ldr r4, [r0]
	movs r6, #0
	ldr r3, [sp, #0x14]
	lsls r2, r3, #3
	adds r0, r2, r4
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080385A4
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r5, r2, #0
	cmp r0, #0xff
	beq _08038556
	adds r3, r1, #0
_08038538:
	adds r0, r2, r4
	ldrh r0, [r0, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r6, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	add sb, r0
	adds r6, #1
	adds r1, r6, r1
	adds r1, r1, r3
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08038538
_08038556:
	mov r2, sb
	lsls r0, r2, #8
	add sl, r0
	adds r5, r5, r4
	ldrh r1, [r5]
	lsls r0, r1, #5
	subs r0, r0, r1
	movs r1, #0xff
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x14]
	movs r0, #0x64
	adds r4, r3, #0
	muls r4, r0, r4
	ldr r1, [sp, #0x10]
	adds r4, r1, r4
	ldrh r1, [r5, #4]
	ldrb r2, [r5, #2]
	movs r0, #1
	str r0, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r3, r6, #0
	bl CreateMon
	adds r5, #6
	adds r0, r4, #0
	movs r1, #0xc
	adds r2, r5, #0
	bl SetMonData
	b _08038670
	.align 2, 0
_080385A4: .4byte 0x082EA31C
_080385A8:
	adds r0, r4, #0
	adds r0, #0x1c
	ldr r1, [sp, #0x20]
	adds r0, r1, r0
	ldr r7, [r0]
	movs r6, #0
	ldr r3, [sp, #0x14]
	lsls r2, r3, #4
	adds r0, r2, r7
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080386A8
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, #0xff
	beq _080385EE
	adds r3, r1, #0
_080385D0:
	adds r0, r2, r7
	ldrh r0, [r0, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r6, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	add sb, r0
	adds r6, #1
	adds r1, r6, r1
	adds r1, r1, r3
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080385D0
_080385EE:
	mov r2, sb
	lsls r0, r2, #8
	add sl, r0
	mov r3, r8
	adds r5, r3, r7
	ldrh r1, [r5]
	lsls r0, r1, #5
	subs r0, r0, r1
	movs r1, #0xff
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [sp, #0x14]
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	ldr r2, [sp, #0x10]
	adds r4, r2, r4
	ldrh r1, [r5, #4]
	ldrb r2, [r5, #2]
	movs r0, #1
	str r0, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r3, r6, #0
	bl CreateMon
	adds r5, #6
	adds r0, r4, #0
	movs r1, #0xc
	adds r2, r5, #0
	bl SetMonData
	movs r6, #0
	adds r5, r4, #0
	mov r0, r8
	adds r0, #8
	adds r4, r7, r0
_08038646:
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r5, #0
	adds r2, r4, #0
	bl SetMonData
	adds r1, r6, #0
	adds r1, #0x11
	ldrh r0, [r4]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080386AC
	adds r2, r2, r0
	adds r0, r5, #0
	bl SetMonData
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _08038646
_08038670:
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x14]
	ldr r4, _080386B0
	ldr r1, [sp, #0x18]
	cmp r0, r1
	bge _0803867E
	b _0803834C
_0803867E:
	ldr r2, _080386B4
	ldr r0, _080386B0
	ldr r3, [sp, #0x20]
	adds r0, r3, r0
	ldrb r1, [r0, #0x12]
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
_0803868E:
	ldr r0, _080386B0
	ldr r1, [sp, #0x20]
	adds r0, r1, r0
	ldrb r0, [r0, #0x18]
_08038696:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080386A8: .4byte 0x082EA31C
_080386AC: .4byte 0x082ED224
_080386B0: .4byte 0x082E383C
_080386B4: .4byte 0x02022C90
	thumb_func_end CreateNPCTrainerParty

	thumb_func_start sub_080386B8
sub_080386B8: @ 0x080386B8
	push {lr}
	ldr r0, _080386D8
	ldrh r0, [r0]
	subs r0, #0x6f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x30
	bhi _080386D2
	movs r1, #0x98
	lsls r1, r1, #8
	movs r0, #8
	bl SetGpuReg
_080386D2:
	pop {r0}
	bx r0
	.align 2, 0
_080386D8: .4byte 0x04000006
	thumb_func_end sub_080386B8

	thumb_func_start VBlankCB_Battle
VBlankCB_Battle: @ 0x080386DC
	push {lr}
	ldr r0, _0803877C
	ldr r0, [r0]
	ldr r1, _08038780
	ands r0, r1
	cmp r0, #0
	bne _080386EE
	bl Random
_080386EE:
	ldr r0, _08038784
	ldrh r1, [r0]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, _08038788
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r0, _0803878C
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, _08038790
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, _08038794
	ldrh r1, [r0]
	movs r0, #0x18
	bl SetGpuReg
	ldr r0, _08038798
	ldrh r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	ldr r0, _0803879C
	ldrh r1, [r0]
	movs r0, #0x1c
	bl SetGpuReg
	ldr r0, _080387A0
	ldrh r1, [r0]
	movs r0, #0x1e
	bl SetGpuReg
	ldr r0, _080387A4
	ldrh r1, [r0]
	movs r0, #0x40
	bl SetGpuReg
	ldr r0, _080387A8
	ldrh r1, [r0]
	movs r0, #0x44
	bl SetGpuReg
	ldr r0, _080387AC
	ldrh r1, [r0]
	movs r0, #0x42
	bl SetGpuReg
	ldr r0, _080387B0
	ldrh r1, [r0]
	movs r0, #0x46
	bl SetGpuReg
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0803877C: .4byte 0x02022C90
_08038780: .4byte 0x013F0102
_08038784: .4byte 0x02022AC8
_08038788: .4byte 0x02022ACA
_0803878C: .4byte 0x02022ACC
_08038790: .4byte 0x02022ACE
_08038794: .4byte 0x02022AD0
_08038798: .4byte 0x02022AD2
_0803879C: .4byte 0x02022AD4
_080387A0: .4byte 0x02022AD6
_080387A4: .4byte 0x02022AD8
_080387A8: .4byte 0x02022ADA
_080387AC: .4byte 0x02022ADC
_080387B0: .4byte 0x02022ADE
	thumb_func_end VBlankCB_Battle

	thumb_func_start sub_080387B4
sub_080387B4: @ 0x080387B4
	bx lr
	.align 2, 0
	thumb_func_end sub_080387B4

	thumb_func_start sub_080387B8
sub_080387B8: @ 0x080387B8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080387D8
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	lsrs r0, r0, #8
	ldrh r1, [r5, #0x30]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	b _080387EA
_080387D8:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	asrs r0, r0, #8
	ldrh r1, [r5, #0x30]
	subs r1, r1, r0
	strh r1, [r5, #0x20]
_080387EA:
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r5, #0x32]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803881E
	ldr r4, _08038824
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	adds r0, r5, #0
	bl FreeSpriteOamMatrix
	adds r0, r5, #0
	bl DestroySprite
_0803881E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08038824: .4byte 0x00002710
	thumb_func_end sub_080387B8

	thumb_func_start sub_08038828
sub_08038828: @ 0x08038828
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r0, _08038844
	str r0, [r4, #0x1c]
	movs r0, #0x68
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038844: .4byte 0x080387B9
	thumb_func_end sub_08038828

	thumb_func_start sub_08038848
sub_08038848: @ 0x08038848
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _08038890
	adds r0, #0x25
	ldrb r2, [r0]
	ldr r0, _08038894
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080388B8
	ldr r1, _08038898
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	beq _080388A4
	cmp r0, #1
	bgt _0803889C
	cmp r0, #0
	beq _080388B8
	b _080388C0
	.align 2, 0
_08038890: .4byte 0x02024118
_08038894: .4byte 0x02022C90
_08038898: .4byte 0x020226A0
_0803889C:
	cmp r0, #2
	beq _080388B8
	cmp r0, #3
	bne _080388C0
_080388A4:
	ldr r0, _080388B0
	str r0, [sp, #4]
	ldr r1, _080388B4
	str r1, [sp, #8]
	b _080388C0
	.align 2, 0
_080388B0: .4byte 0x020243E8
_080388B4: .4byte 0x02024190
_080388B8:
	ldr r2, _08038A0C
	str r2, [sp, #4]
	ldr r3, _08038A10
	str r3, [sp, #8]
_080388C0:
	movs r7, #0
	movs r0, #0
	mov r8, r0
	ldr r1, [sp]
	lsls r1, r1, #2
	str r1, [sp, #0xc]
	movs r2, #0xce
	lsls r2, r2, #1
	mov sl, r2
	mov sb, r0
_080388D4:
	movs r0, #0x64
	mov r4, r8
	muls r4, r0, r4
	ldr r3, [sp, #4]
	adds r4, r3, r4
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	adds r1, r0, #0
	cmp r5, #0
	beq _08038944
	cmp r5, sl
	beq _08038918
	cmp r6, #0
	beq _08038918
	cmp r1, #0
	bne _08038918
	movs r0, #1
	mov r2, sb
	lsls r0, r2
	orrs r7, r0
_08038918:
	cmp r5, #0
	beq _08038944
	cmp r6, #0
	beq _08038930
	cmp r5, sl
	beq _08038928
	cmp r1, #0
	beq _08038930
_08038928:
	movs r0, #2
	mov r3, sb
	lsls r0, r3
	orrs r7, r0
_08038930:
	cmp r5, #0
	beq _08038944
	cmp r5, sl
	beq _08038944
	cmp r6, #0
	bne _08038944
	movs r0, #3
	mov r1, sb
	lsls r0, r1
	orrs r7, r0
_08038944:
	movs r2, #2
	add sb, r2
	movs r3, #1
	add r8, r3
	mov r0, r8
	cmp r0, #5
	ble _080388D4
	ldr r1, _08038A14
	ldr r2, [sp, #0xc]
	ldr r3, [sp]
	adds r0, r2, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r7, [r0, #0xe]
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r1, #0xce
	lsls r1, r1, #1
	mov sl, r1
	mov sb, r0
_0803896E:
	movs r0, #0x64
	mov r4, r8
	muls r4, r0, r4
	ldr r2, [sp, #8]
	adds r4, r2, r4
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	adds r1, r0, #0
	cmp r5, #0
	beq _080389DE
	cmp r5, sl
	beq _080389B2
	cmp r6, #0
	beq _080389B2
	cmp r1, #0
	bne _080389B2
	movs r0, #1
	mov r3, sb
	lsls r0, r3
	orrs r7, r0
_080389B2:
	cmp r5, #0
	beq _080389DE
	cmp r6, #0
	beq _080389CA
	cmp r5, sl
	beq _080389C2
	cmp r1, #0
	beq _080389CA
_080389C2:
	movs r0, #2
	mov r1, sb
	lsls r0, r1
	orrs r7, r0
_080389CA:
	cmp r5, #0
	beq _080389DE
	cmp r5, sl
	beq _080389DE
	cmp r6, #0
	bne _080389DE
	movs r0, #3
	mov r2, sb
	lsls r0, r2
	orrs r7, r0
_080389DE:
	movs r3, #2
	add sb, r3
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #5
	ble _0803896E
	ldr r1, _08038A14
	ldr r2, [sp, #0xc]
	ldr r3, [sp]
	adds r0, r2, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r7, [r0, #0x10]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038A0C: .4byte 0x02024190
_08038A10: .4byte 0x020243E8
_08038A14: .4byte 0x03005B60
	thumb_func_end sub_08038848

	thumb_func_start sub_08038A18
sub_08038A18: @ 0x08038A18
	push {r4, lr}
	sub sp, #4
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	ldr r0, _08038A54
	ldr r1, [r0]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	ldr r0, _08038A58
	ands r0, r1
	cmp r0, #0
	beq _08038A60
	ldr r0, _08038A5C
	ldr r0, [r0, #8]
	bl SetMainCallback2
	bl FreeBattleResources
	bl FreeBattleSpritesData
	bl FreeMonSpritesGfx
	b _08038B6A
	.align 2, 0
_08038A54: .4byte 0x02022C90
_08038A58: .4byte 0x003F0100
_08038A5C: .4byte 0x03002360
_08038A60:
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _08038B74
	mov r0, sp
	bl CpuSet
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	ldr r4, _08038B78
	movs r0, #0x44
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	ldr r1, _08038B7C
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08038B80
	strh r4, [r0]
	bl ScanlineEffect_Clear
	ldr r0, _08038B84
	movs r3, #0xf0
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r2, r0, r1
	movs r1, #0x4f
_08038AB2:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, #2
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08038AB2
	movs r1, #0x50
	ldr r0, _08038B84
	ldr r3, _08038B88
	movs r4, #0x82
	lsls r4, r4, #4
	adds r2, r0, r4
	adds r0, #0xa0
_08038ACE:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, #2
	adds r0, #2
	adds r1, #1
	cmp r1, #0x9f
	ble _08038ACE
	bl ResetPaletteFade
	ldr r0, _08038B8C
	movs r4, #0
	strh r4, [r0]
	ldr r0, _08038B90
	strh r4, [r0]
	ldr r0, _08038B94
	strh r4, [r0]
	ldr r0, _08038B98
	strh r4, [r0]
	ldr r0, _08038B9C
	strh r4, [r0]
	ldr r0, _08038BA0
	strh r4, [r0]
	ldr r0, _08038BA4
	strh r4, [r0]
	ldr r0, _08038BA8
	strh r4, [r0]
	bl sub_08035528
	ldr r0, _08038BAC
	movs r1, #0
	movs r2, #0x40
	bl LoadCompressedPalette
	bl LoadBattleMenuWindowGfx
	bl ResetSpriteData
	bl ResetTasks
	bl DrawBattleEntryBackground
	movs r0, #0x4a
	movs r1, #0x37
	bl SetGpuReg
	bl FreeAllSpritePalettes
	ldr r1, _08038BB0
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08038BB4
	bl SetVBlankCallback
	ldr r0, _08038BB8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08038BBC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0x87
	lsls r2, r2, #1
	strh r2, [r1, #0xa]
	movs r2, #0x5a
	strh r2, [r1, #0xc]
	movs r2, #1
	strh r2, [r1, #0x12]
	bl sub_08038848
	ldr r0, _08038BC0
	bl SetMainCallback2
	ldr r0, _08038BC4
	strb r4, [r0]
_08038B6A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038B74: .4byte 0x05006000
_08038B78: .4byte 0x00005051
_08038B7C: .4byte 0x02022AD8
_08038B80: .4byte 0x02022ADA
_08038B84: .4byte 0x020388C8
_08038B88: .4byte 0x0000FF10
_08038B8C: .4byte 0x02022AC8
_08038B90: .4byte 0x02022ACA
_08038B94: .4byte 0x02022ACC
_08038B98: .4byte 0x02022ACE
_08038B9C: .4byte 0x02022AD0
_08038BA0: .4byte 0x02022AD2
_08038BA4: .4byte 0x02022AD4
_08038BA8: .4byte 0x02022AD6
_08038BAC: .4byte 0x08C004EC
_08038BB0: .4byte 0x030030BC
_08038BB4: .4byte 0x080386DD
_08038BB8: .4byte 0x08035BC9
_08038BBC: .4byte 0x03005B60
_08038BC0: .4byte 0x08038BC9
_08038BC4: .4byte 0x02023FD6
	thumb_func_end sub_08038A18

	thumb_func_start sub_08038BC8
sub_08038BC8: @ 0x08038BC8
	push {lr}
	bl sub_08038BE8
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08038BC8

	thumb_func_start sub_08038BE8
sub_08038BE8: @ 0x08038BE8
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _08038C04
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #9
	bls _08038BF8
	b _08038E7A
_08038BF8:
	lsls r0, r1, #2
	ldr r1, _08038C08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038C04: .4byte 0x02023FD6
_08038C08: .4byte 0x08038C0C
_08038C0C: @ jump table
	.4byte _08038C34 @ case 0
	.4byte _08038C54 @ case 1
	.4byte _08038C76 @ case 2
	.4byte _08038D7C @ case 3
	.4byte _08038DB4 @ case 4
	.4byte _08038DCC @ case 5
	.4byte _08038DE0 @ case 6
	.4byte _08038E00 @ case 7
	.4byte _08038E1A @ case 8
	.4byte _08038E38 @ case 9
_08038C34:
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	ldr r1, _08038C50
	movs r0, #0xff
	strb r0, [r1, #1]
	b _08038E28
	.align 2, 0
_08038C50: .4byte 0x02023FD6
_08038C54:
	ldrb r0, [r4, #1]
	subs r0, #1
	strb r0, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08038C64
	b _08038E7A
_08038C64:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _08038DC0
_08038C76:
	ldr r0, _08038D04
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08038C84
	b _08038E7A
_08038C84:
	bl GetRecordedBattleFrontierFacility
	ldr r2, _08038D08
	ldr r1, _08038D0C
	adds r2, r2, r1
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08038D10
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	movs r3, #2
	cmp r0, #0
	beq _08038CB0
	movs r3, #4
_08038CB0:
	movs r4, #0
	ldr r6, _08038D14
	cmp r4, r3
	bge _08038CD6
	ldr r1, _08038D18
	ldrb r0, [r1]
	cmp r0, #3
	bne _08038CD6
	movs r5, #0xff
	adds r2, r1, #0
_08038CC4:
	adds r2, #0x1c
	adds r4, #1
	cmp r4, r3
	bge _08038CD6
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #3
	beq _08038CC4
_08038CD6:
	ldr r0, [r6]
	ldr r1, _08038D1C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08038D60
	cmp r4, r3
	bne _08038D60
	ldr r0, _08038D20
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038D28
	bl FreeAllWindowBuffers
	ldr r0, _08038D24
	bl SetMainCallback2
	b _08038E7A
	.align 2, 0
_08038D04: .4byte 0x02037C74
_08038D08: .4byte 0x03002360
_08038D0C: .4byte 0x00000439
_08038D10: .4byte 0x02022C90
_08038D14: .4byte 0x03005AF0
_08038D18: .4byte 0x020226A0
_08038D1C: .4byte 0x00000CA9
_08038D20: .4byte 0x000008D2
_08038D24: .4byte 0x08038F5D
_08038D28:
	ldr r2, _08038D3C
	ldr r1, _08038D40
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08038D44
	ldr r0, [r2, #8]
	b _08038D64
	.align 2, 0
_08038D3C: .4byte 0x03002360
_08038D40: .4byte 0x00000439
_08038D44:
	ldr r0, _08038D58
	ldrb r0, [r0]
	cmp r0, #0
	bne _08038E26
	ldr r0, _08038D5C
	movs r1, #5
	bl CreateTask
	b _08038E26
	.align 2, 0
_08038D58: .4byte 0x030031C4
_08038D5C: .4byte 0x080B3251
_08038D60:
	ldr r0, _08038D78
	ldr r0, [r0, #8]
_08038D64:
	bl SetMainCallback2
	bl FreeBattleResources
	bl FreeBattleSpritesData
	bl FreeMonSpritesGfx
	b _08038E7A
	.align 2, 0
_08038D78: .4byte 0x03002360
_08038D7C:
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _08038DB0
	add r0, sp, #4
	bl CpuSet
	movs r4, #0
_08038D8E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl LoadChosenBattleElement
	adds r4, #1
	cmp r4, #1
	ble _08038D8E
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _08038E26
	.align 2, 0
_08038DB0: .4byte 0x05006000
_08038DB4:
	ldr r0, _08038DC8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08038E7A
_08038DC0:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08038E7A
	.align 2, 0
_08038DC8: .4byte 0x02037C74
_08038DCC:
	ldr r0, _08038DDC
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08038E7A
	b _08038E26
	.align 2, 0
_08038DDC: .4byte 0x080B3251
_08038DE0:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08038E7A
	bl sub_0800A8D4
	ldr r0, _08038DFC
	movs r1, #0
	bl sub_0814FA04
	b _08038E26
	.align 2, 0
_08038DFC: .4byte 0x08226D53
_08038E00:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08038E7A
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08038E7A
	b _08038E26
_08038E1A:
	ldr r0, _08038E30
	ldrb r0, [r0]
	cmp r0, #0
	bne _08038E26
	bl sub_0800A7F8
_08038E26:
	ldr r1, _08038E34
_08038E28:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08038E7A
	.align 2, 0
_08038E30: .4byte 0x0300319C
_08038E34: .4byte 0x02023FD6
_08038E38:
	ldr r2, _08038E84
	ldr r1, _08038E88
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _08038E5A
	ldr r0, _08038E8C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08038E5A
	ldr r0, _08038E90
	ldrb r0, [r0]
	cmp r0, #1
	beq _08038E7A
_08038E5A:
	ldr r0, _08038E88
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3, #8]
	bl SetMainCallback2
	bl FreeBattleResources
	bl FreeBattleSpritesData
	bl FreeMonSpritesGfx
_08038E7A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08038E84: .4byte 0x03002360
_08038E88: .4byte 0x00000439
_08038E8C: .4byte 0x0300319C
_08038E90: .4byte 0x030031C4
	thumb_func_end sub_08038BE8

	thumb_func_start sub_08038E94
sub_08038E94: @ 0x08038E94
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	cmp r1, #6
	bhi _08038F54
	lsls r0, r1, #2
	ldr r1, _08038EB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038EB0: .4byte 0x08038EB4
_08038EB4: @ jump table
	.4byte _08038ED0 @ case 0
	.4byte _08038EE4 @ case 1
	.4byte _08038EF8 @ case 2
	.4byte _08038F0C @ case 3
	.4byte _08038F20 @ case 4
	.4byte _08038F34 @ case 5
	.4byte _08038F48 @ case 6
_08038ED0:
	ldr r0, _08038EE0
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	b _08038F54
	.align 2, 0
_08038EE0: .4byte 0x082EB860
_08038EE4:
	ldr r0, _08038EF4
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	b _08038F54
	.align 2, 0
_08038EF4: .4byte 0x082EB860
_08038EF8:
	ldr r0, _08038F08
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	b _08038F54
	.align 2, 0
_08038F08: .4byte 0x082EB860
_08038F0C:
	ldr r0, _08038F1C
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	b _08038F54
	.align 2, 0
_08038F1C: .4byte 0x082EB860
_08038F20:
	ldr r0, _08038F30
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	b _08038F54
	.align 2, 0
_08038F30: .4byte 0x082EB860
_08038F34:
	ldr r0, _08038F44
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	b _08038F54
	.align 2, 0
_08038F44: .4byte 0x082EB860
_08038F48:
	ldr r0, _08038F58
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #8
	lsrs r0, r0, #0x16
_08038F54:
	pop {r1}
	bx r1
	.align 2, 0
_08038F58: .4byte 0x082EB860
	thumb_func_end sub_08038E94

	thumb_func_start sub_08038F5C
sub_08038F5C: @ 0x08038F5C
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	movs r4, #0
	str r4, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _08038FFC
	add r0, sp, #4
	bl CpuSet
	bl ResetPaletteFade
	ldr r0, _08039000
	strh r4, [r0]
	ldr r0, _08039004
	strh r4, [r0]
	ldr r0, _08039008
	strh r4, [r0]
	ldr r0, _0803900C
	strh r4, [r0]
	ldr r0, _08039010
	strh r4, [r0]
	ldr r0, _08039014
	strh r4, [r0]
	ldr r0, _08039018
	strh r4, [r0]
	ldr r0, _0803901C
	strh r4, [r0]
	bl sub_08035528
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	bl LoadBattleMenuWindowGfx
_08038FB2:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl LoadChosenBattleElement
	adds r4, #1
	cmp r4, #1
	ble _08038FB2
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	ldr r1, _08039020
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08039024
	bl SetVBlankCallback
	ldr r0, _08039028
	bl SetMainCallback2
	movs r0, #1
	rsbs r0, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0803902C
	strb r4, [r0]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038FFC: .4byte 0x05006000
_08039000: .4byte 0x02022AC8
_08039004: .4byte 0x02022ACA
_08039008: .4byte 0x02022ACC
_0803900C: .4byte 0x02022ACE
_08039010: .4byte 0x02022AD0
_08039014: .4byte 0x02022AD2
_08039018: .4byte 0x02022AD4
_0803901C: .4byte 0x02022AD6
_08039020: .4byte 0x030030BC
_08039024: .4byte 0x080386DD
_08039028: .4byte 0x08039031
_0803902C: .4byte 0x02023FD6
	thumb_func_end sub_08038F5C

	thumb_func_start sub_08039030
sub_08039030: @ 0x08039030
	push {lr}
	bl sub_08039050
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08039030

	thumb_func_start sub_08039050
sub_08039050: @ 0x08039050
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0803906C
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0xc
	bls _08039060
	b _08039412
_08039060:
	lsls r0, r1, #2
	ldr r1, _08039070
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803906C: .4byte 0x02023FD6
_08039070: .4byte 0x08039074
_08039074: @ jump table
	.4byte _080390A8 @ case 0
	.4byte _080390C8 @ case 1
	.4byte _08039104 @ case 2
	.4byte _08039124 @ case 3
	.4byte _08039150 @ case 4
	.4byte _0803918C @ case 5
	.4byte _08039230 @ case 6
	.4byte _080393B8 @ case 7
	.4byte _08039280 @ case 8
	.4byte _080392C4 @ case 9
	.4byte _0803932C @ case 10
	.4byte _0803935C @ case 11
	.4byte _080393B8 @ case 12
_080390A8:
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	ldr r1, _080390C4
	ldrb r0, [r1]
	adds r0, #1
	b _08039410
	.align 2, 0
_080390C4: .4byte 0x02023FD6
_080390C8:
	ldr r0, _080390F0
	ldr r1, _080390F4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080390E8
	ldr r0, _080390F8
	ldrb r0, [r0]
	cmp r0, #0
	bne _080390E8
	ldr r0, _080390FC
	movs r1, #5
	bl CreateTask
_080390E8:
	ldr r1, _08039100
	ldrb r0, [r1]
	adds r0, #1
	b _08039410
	.align 2, 0
_080390F0: .4byte 0x03002360
_080390F4: .4byte 0x00000439
_080390F8: .4byte 0x030031C4
_080390FC: .4byte 0x080B3251
_08039100: .4byte 0x02023FD6
_08039104:
	ldr r0, _0803911C
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039112
	b _08039412
_08039112:
	ldr r1, _08039120
	ldrb r0, [r1]
	adds r0, #1
	b _08039410
	.align 2, 0
_0803911C: .4byte 0x080B3251
_08039120: .4byte 0x02023FD6
_08039124:
	ldr r0, _08039144
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08039132
	b _08039412
_08039132:
	ldr r0, _08039148
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0803914C
	ldrb r0, [r1]
	adds r0, #1
	b _08039410
	.align 2, 0
_08039144: .4byte 0x02037C74
_08039148: .4byte 0x085AC0DD
_0803914C: .4byte 0x02023FD6
_08039150:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08039160
	b _08039412
_08039160:
	str r0, [sp]
	movs r0, #0x18
	movs r1, #8
	movs r2, #0x1d
	movs r3, #0xd
	bl HandleBattleWindow
	ldr r0, _08039184
	movs r1, #0xc
	bl sub_0814FA04
	ldr r4, _08039188
	movs r0, #1
	strb r0, [r4, #1]
	bl BattleCreateYesNoCursorAt
	b _0803939E
	.align 2, 0
_08039184: .4byte 0x085ABBC9
_08039188: .4byte 0x02023FD6
_0803918C:
	ldr r0, _080391B0
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080391B4
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080391A0
	b _08039412
_080391A0:
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4, #1]
	bl BattleDestroyYesNoCursorAt
	movs r0, #0
	b _080391D2
	.align 2, 0
_080391B0: .4byte 0x03002360
_080391B4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080391DA
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _080391C4
	b _08039412
_080391C4:
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4, #1]
	bl BattleDestroyYesNoCursorAt
	movs r0, #1
_080391D2:
	strb r0, [r4, #1]
	bl BattleCreateYesNoCursorAt
	b _08039412
_080391DA:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08039214
	movs r0, #5
	bl PlaySE
	ldr r4, _08039210
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _080391F4
	b _0803939E
_080391F4:
	str r5, [sp]
	movs r0, #0x18
	movs r1, #8
	movs r2, #0x1d
	movs r3, #0xd
	bl HandleBattleWindow
	bl MoveRecordedBattleToSaveData
	strb r0, [r4, #1]
	movs r0, #0xa
	strb r0, [r4]
	b _08039412
	.align 2, 0
_08039210: .4byte 0x02023FD6
_08039214:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0803921E
	b _08039412
_0803921E:
	movs r0, #5
	bl PlaySE
	ldr r1, _0803922C
	ldrb r0, [r1]
	adds r0, #1
	b _08039410
	.align 2, 0
_0803922C: .4byte 0x02023FD6
_08039230:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0803923E
	b _08039412
_0803923E:
	str r0, [sp]
	movs r0, #0x18
	movs r1, #8
	movs r2, #0x1d
	movs r3, #0xd
	bl HandleBattleWindow
	ldr r0, _08039270
	ldr r1, _08039274
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08039268
	bl sub_0800A8D4
	ldr r0, _08039278
	movs r1, #0
	bl sub_0814FA04
_08039268:
	ldr r1, _0803927C
	ldrb r0, [r1]
	adds r0, #1
	b _08039410
	.align 2, 0
_08039270: .4byte 0x03002360
_08039274: .4byte 0x00000439
_08039278: .4byte 0x08226D53
_0803927C: .4byte 0x02023FD6
_08039280:
	ldrb r0, [r4, #1]
	subs r0, #1
	strb r0, [r4, #1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803928E
	b _08039412
_0803928E:
	ldr r0, _080392B4
	ldr r1, _080392B8
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080392AA
	ldr r0, _080392BC
	ldrb r0, [r0]
	cmp r0, #0
	bne _080392AA
	bl sub_0800A7F8
_080392AA:
	ldr r1, _080392C0
	ldrb r0, [r1]
	adds r0, #1
	b _08039410
	.align 2, 0
_080392B4: .4byte 0x03002360
_080392B8: .4byte 0x00000439
_080392BC: .4byte 0x0300319C
_080392C0: .4byte 0x02023FD6
_080392C4:
	ldr r2, _08039318
	ldr r1, _0803931C
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _080392E8
	ldr r0, _08039320
	ldrb r0, [r0]
	cmp r0, #0
	bne _080392E8
	ldr r0, _08039324
	ldrb r0, [r0]
	cmp r0, #1
	bne _080392E8
	b _08039412
_080392E8:
	ldr r0, _0803931C
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08039328
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08039304
	b _08039412
_08039304:
	ldr r0, [r3, #8]
	bl SetMainCallback2
	bl FreeBattleResources
	bl FreeBattleSpritesData
	bl FreeMonSpritesGfx
	b _08039412
	.align 2, 0
_08039318: .4byte 0x03002360
_0803931C: .4byte 0x00000439
_08039320: .4byte 0x0300319C
_08039324: .4byte 0x030031C4
_08039328: .4byte 0x02037C74
_0803932C:
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _08039354
	movs r0, #0x37
	bl PlaySE
	ldr r0, _0803934C
_0803933A:
	bl TryGetStatusString
	ldr r0, _08039350
	movs r1, #0
	bl sub_0814FA04
	movs r0, #0x80
	strb r0, [r4, #1]
	b _0803939E
	.align 2, 0
_0803934C: .4byte 0x085AC0FB
_08039350: .4byte 0x02022AE0
_08039354:
	ldr r0, _08039358
	b _0803933A
	.align 2, 0
_08039358: .4byte 0x0822247E
_0803935C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08039412
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08039412
	ldr r4, _080393A8
	ldrb r0, [r4, #1]
	subs r0, #1
	strb r0, [r4, #1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039412
	ldr r0, _080393AC
	ldr r1, _080393B0
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803939E
	bl sub_0800A8D4
	ldr r0, _080393B4
	movs r1, #0
	bl sub_0814FA04
_0803939E:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08039412
	.align 2, 0
_080393A8: .4byte 0x02023FD6
_080393AC: .4byte 0x03002360
_080393B0: .4byte 0x00000439
_080393B4: .4byte 0x08226D53
_080393B8:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08039412
	ldr r0, _080393F0
	ldr r1, _080393F4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080393F8
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08039412
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	b _080393FE
	.align 2, 0
_080393F0: .4byte 0x03002360
_080393F4: .4byte 0x00000439
_080393F8:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
_080393FE:
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _0803941C
	movs r0, #0x20
	strb r0, [r1, #1]
	movs r0, #8
_08039410:
	strb r0, [r1]
_08039412:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803941C: .4byte 0x02023FD6
	thumb_func_end sub_08039050

	thumb_func_start SpriteCb_WildMon
SpriteCb_WildMon: @ 0x08039420
	push {lr}
	sub sp, #4
	ldr r1, _08039448
	str r1, [r0, #0x1c]
	movs r1, #0
	bl StartSpriteAnimIfDifferent
	movs r0, #0x80
	lsls r0, r0, #0xa
	ldr r1, _0803944C
	str r1, [sp]
	movs r1, #0
	movs r2, #0xa
	movs r3, #0xa
	bl BeginNormalPaletteFade
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08039448: .4byte 0x08039451
_0803944C: .4byte 0x00002108
	thumb_func_end SpriteCb_WildMon

	thumb_func_start SpriteCb_MoveWildMonToRight
SpriteCb_MoveWildMonToRight: @ 0x08039450
	push {lr}
	adds r2, r0, #0
	ldr r0, _08039474
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08039470
	ldrh r0, [r2, #0x24]
	adds r0, #2
	strh r0, [r2, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08039470
	ldr r0, _08039478
	str r0, [r2, #0x1c]
_08039470:
	pop {r0}
	bx r0
	.align 2, 0
_08039474: .4byte 0x020240A0
_08039478: .4byte 0x0803947D
	thumb_func_end SpriteCb_MoveWildMonToRight

	thumb_func_start SpriteCb_WildMonShowHealthbox
SpriteCb_WildMonShowHealthbox: @ 0x0803947C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080394C4
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08076320
	ldr r1, _080394CC
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r0, _080394D0
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
	movs r0, #0x80
	lsls r0, r0, #0xa
	ldr r1, _080394D4
	str r1, [sp]
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl BeginNormalPaletteFade
_080394C4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080394CC: .4byte 0x03005AD0
_080394D0: .4byte 0x080394D9
_080394D4: .4byte 0x00002108
	thumb_func_end SpriteCb_WildMonShowHealthbox

	thumb_func_start SpriteCb_WildMonAnimate
SpriteCb_WildMonAnimate: @ 0x080394D8
	push {lr}
	adds r2, r0, #0
	ldr r0, _080394F8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080394F4
	ldrh r1, [r2, #0x32]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #1
	bl BattleAnimateFrontSprite
_080394F4:
	pop {r0}
	bx r0
	.align 2, 0
_080394F8: .4byte 0x02037C74
	thumb_func_end SpriteCb_WildMonAnimate

	thumb_func_start SpriteCallbackDummy_2
SpriteCallbackDummy_2: @ 0x080394FC
	bx lr
	.align 2, 0
	thumb_func_end SpriteCallbackDummy_2

	thumb_func_start sub_08039500
sub_08039500: @ 0x08039500
	movs r1, #6
	strh r1, [r0, #0x34]
	movs r1, #1
	strh r1, [r0, #0x36]
	ldr r1, _08039510
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_08039510: .4byte 0x08039515
	thumb_func_end sub_08039500

	thumb_func_start sub_08039514
sub_08039514: @ 0x08039514
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x36]
	subs r0, #1
	strh r0, [r3, #0x36]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08039568
	movs r0, #8
	strh r0, [r3, #0x36]
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r4, #5
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #0x34]
	subs r0, #1
	strh r0, [r3, #0x34]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bne _08039568
	ldrb r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08039570
	str r0, [r3, #0x1c]
	ldr r0, _08039574
	str r2, [r0]
_08039568:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039570: .4byte 0x080394FD
_08039574: .4byte 0x02022C2C
	thumb_func_end sub_08039514

	thumb_func_start SpriteCB_FaintOpponentMon
SpriteCB_FaintOpponentMon: @ 0x08039578
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldrh r0, [r0, #0x2e]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0803959C
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _080395A0
	adds r4, r0, #0
	b _080395A4
	.align 2, 0
_0803959C: .4byte 0x02024174
_080395A0:
	mov r0, sb
	ldrh r4, [r0, #0x32]
_080395A4:
	ldr r1, _0803960C
	lsls r0, r6, #1
	adds r5, r0, r1
	ldrh r0, [r5]
	movs r1, #0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r7, _08039610
	adds r0, r0, r7
	movs r1, #0
	bl GetMonData
	cmp r4, #0xc9
	bne _08039628
	ldrh r0, [r5]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r7
	movs r1, #0
	bl GetMonData
	adds r2, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	ands r0, r2
	lsrs r0, r0, #0x12
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r2
	lsrs r1, r1, #0xc
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r1, r2
	lsrs r1, r1, #6
	orrs r0, r1
	movs r1, #3
	ands r1, r2
	orrs r0, r1
	movs r1, #0x1c
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08039614
	movs r0, #0xc9
	b _0803961E
	.align 2, 0
_0803960C: .4byte 0x02023D12
_08039610: .4byte 0x020243E8
_08039614:
	movs r1, #0xce
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0803961E:
	ldr r1, _08039624
	lsls r0, r0, #2
	b _08039660
	.align 2, 0
_08039624: .4byte 0x082D45C8
_08039628:
	ldr r0, _08039640
	cmp r4, r0
	bne _0803964C
	ldr r0, _08039644
	ldr r1, _08039648
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	b _08039664
	.align 2, 0
_08039640: .4byte 0x00000181
_08039644: .4byte 0x084FE684
_08039648: .4byte 0x02024188
_0803964C:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	bls _0803965C
	ldr r0, _08039658
	b _08039662
	.align 2, 0
_08039658: .4byte 0x082D45C8
_0803965C:
	ldr r1, _08039684
	lsls r0, r4, #2
_08039660:
	adds r0, r0, r1
_08039662:
	ldrb r0, [r0, #1]
_08039664:
	lsrs r1, r0, #3
	movs r0, #8
	subs r0, r0, r1
	mov r1, sb
	strh r0, [r1, #0x34]
	movs r0, #1
	strh r0, [r1, #0x36]
	ldr r0, _08039688
	str r0, [r1, #0x1c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039684: .4byte 0x082D45C8
_08039688: .4byte 0x0803968D
	thumb_func_end SpriteCB_FaintOpponentMon

	thumb_func_start SpriteCB_AnimFaintOpponent
SpriteCB_AnimFaintOpponent: @ 0x0803968C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x36]
	subs r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803970C
	movs r0, #2
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x26]
	adds r0, #8
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x34]
	subs r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080396C0
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	b _0803970C
_080396C0:
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerPosition
	ldr r1, _08039714
	ldr r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r1, #4
	adds r1, r1, r0
	ldr r2, _08039718
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0xb
	ldr r1, [r1]
	adds r1, r1, r0
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r2, #0
	movs r0, #0xff
_080396F2:
	strb r2, [r1]
	adds r1, #1
	subs r0, #1
	cmp r0, #0
	bge _080396F2
	ldr r0, _08039718
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	adds r1, r1, r0
	ldrb r1, [r1]
	adds r0, r4, #0
	bl StartSpriteAnim
_0803970C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039714: .4byte 0x02024178
_08039718: .4byte 0x02024188
	thumb_func_end SpriteCB_AnimFaintOpponent

	thumb_func_start sub_0803971C
sub_0803971C: @ 0x0803971C
	movs r1, #8
	strh r1, [r0, #0x34]
	adds r1, r0, #0
	adds r1, #0x3e
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	strh r1, [r0, #0x36]
	ldr r1, _08039734
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_08039734: .4byte 0x08039739
	thumb_func_end sub_0803971C

	thumb_func_start sub_08039738
sub_08039738: @ 0x08039738
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x34]
	subs r0, #1
	strh r0, [r3, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803976A
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
	movs r0, #8
	strh r0, [r3, #0x34]
_0803976A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08039738

	thumb_func_start sub_08039770
sub_08039770: @ 0x08039770
	movs r1, #0x3e
	adds r1, r1, r0
	mov ip, r1
	movs r1, #1
	ldrh r2, [r0, #0x36]
	ands r2, r1
	lsls r2, r2, #2
	mov r1, ip
	ldrb r3, [r1]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	movs r1, #0
	strh r1, [r0, #0x36]
	ldr r1, _08039798
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_08039798: .4byte 0x080394FD
	thumb_func_end sub_08039770

	thumb_func_start sub_0803979C
sub_0803979C: @ 0x0803979C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080397E4
	ldr r0, _080397EC
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080397C4
	ldr r0, _080397F0
	ldr r0, [r0]
	ldr r1, _080397F4
	ands r0, r1
	cmp r0, #0
	beq _080397D8
_080397C4:
	ldrh r0, [r4, #0x32]
	bl HasTwoFramesAnimation
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080397D8
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
_080397D8:
	ldrh r1, [r4, #0x32]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #1
	bl BattleAnimateFrontSprite
_080397E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080397EC: .4byte 0x02023F24
_080397F0: .4byte 0x02022C90
_080397F4: .4byte 0x02000002
	thumb_func_end sub_0803979C

	thumb_func_start sub_080397F8
sub_080397F8: @ 0x080397F8
	ldr r1, _08039800
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_08039800: .4byte 0x08039805
	thumb_func_end sub_080397F8

	thumb_func_start oac_poke_ally_
oac_poke_ally_: @ 0x08039804
	push {lr}
	adds r2, r0, #0
	ldr r0, _0803982C
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08039828
	ldrh r0, [r2, #0x24]
	subs r0, #2
	strh r0, [r2, #0x24]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _08039828
	ldr r0, _08039830
	str r0, [r2, #0x1c]
	strh r1, [r2, #0x30]
_08039828:
	pop {r0}
	bx r0
	.align 2, 0
_0803982C: .4byte 0x020240A0
_08039830: .4byte 0x08039841
	thumb_func_end oac_poke_ally_

	thumb_func_start sub_08039834
sub_08039834: @ 0x08039834
	ldr r1, _0803983C
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_0803983C: .4byte 0x08039841
	thumb_func_end sub_08039834

	thumb_func_start SpriteCallbackDummy_3
SpriteCallbackDummy_3: @ 0x08039840
	bx lr
	.align 2, 0
	thumb_func_end SpriteCallbackDummy_3

	thumb_func_start sub_08039844
sub_08039844: @ 0x08039844
	push {lr}
	adds r2, r0, #0
	ldr r0, _08039868
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08039864
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x32]
	ldrh r1, [r2, #0x26]
	adds r0, r0, r1
	strh r0, [r2, #0x26]
_08039864:
	pop {r0}
	bx r0
	.align 2, 0
_08039868: .4byte 0x020240A0
	thumb_func_end sub_08039844

	thumb_func_start DoBounceEffect
DoBounceEffect: @ 0x0803986C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	cmp r1, #0
	beq _080398A8
	ldr r0, _080398A4
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r2, r4, #1
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	b _080398BA
	.align 2, 0
_080398A4: .4byte 0x02024174
_080398A8:
	ldr r0, _08039904
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r2, r4, #1
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
_080398BA:
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	bne _08039970
	ldr r0, _08039908
	bl CreateInvisibleSpriteWithCallback
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, r8
	cmp r0, #1
	bne _08039914
	ldr r0, _0803990C
	adds r0, r4, r0
	ldrb r7, [r0]
	ldr r2, _08039904
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r1, r6, r4
	lsls r1, r1, #2
	adds r0, r1, r0
	strb r5, [r0, #2]
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _08039910
	lsls r3, r5, #4
	adds r0, r3, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x80
	b _08039942
	.align 2, 0
_08039904: .4byte 0x02024174
_08039908: .4byte 0x08039A3D
_0803990C: .4byte 0x03005AD0
_08039910: .4byte 0x020205AC
_08039914:
	ldr r0, _08039980
	adds r0, r4, r0
	ldrb r7, [r0]
	ldr r2, _08039984
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r1, r6, r4
	lsls r1, r1, #2
	adds r0, r1, r0
	strb r5, [r0, #3]
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _08039988
	lsls r3, r5, #4
	adds r0, r3, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0xc0
_08039942:
	strh r1, [r0, #0x2e]
	adds r4, r2, #0
	adds r1, r3, r5
	lsls r1, r1, #2
	adds r1, r1, r4
	mov r2, sb
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	movs r2, #0
	strh r0, [r1, #0x30]
	mov r3, sl
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0x32]
	strh r7, [r1, #0x34]
	mov r0, r8
	strh r0, [r1, #0x36]
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x24]
	strh r2, [r0, #0x26]
_08039970:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039980: .4byte 0x02023E88
_08039984: .4byte 0x02024174
_08039988: .4byte 0x020205AC
	thumb_func_end DoBounceEffect

	thumb_func_start EndBounceEffect
EndBounceEffect: @ 0x0803998C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	bne _080399E0
	ldr r6, _080399D8
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r5, r0, #2
	adds r3, r5, r1
	ldrb r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08039A2E
	ldr r2, _080399DC
	ldrb r1, [r3, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x34]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl DestroySprite
	ldr r0, [r6]
	ldr r1, [r0, #4]
	adds r1, r5, r1
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	b _08039A1A
	.align 2, 0
_080399D8: .4byte 0x02024174
_080399DC: .4byte 0x020205AC
_080399E0:
	ldr r6, _08039A34
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r5, r0, #2
	adds r3, r5, r1
	ldrb r1, [r3]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08039A2E
	ldr r2, _08039A38
	ldrb r1, [r3, #3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x34]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl DestroySprite
	ldr r0, [r6]
	ldr r1, [r0, #4]
	adds r1, r5, r1
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
_08039A1A:
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08039A38
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1, #0x24]
	strh r0, [r1, #0x26]
_08039A2E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039A34: .4byte 0x02024174
_08039A38: .4byte 0x020205AC
	thumb_func_end EndBounceEffect

	thumb_func_start SpriteCB_BounceEffect
SpriteCB_BounceEffect: @ 0x08039A3C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _08039A54
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	b _08039A58
_08039A54:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
_08039A58:
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	bl Sin
	ldr r2, _08039A84
	lsls r1, r5, #4
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r2, [r4, #0x32]
	adds r0, r0, r2
	strh r0, [r1, #0x26]
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x2e]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039A84: .4byte 0x020205AC
	thumb_func_end SpriteCB_BounceEffect

	thumb_func_start sub_08039A88
sub_08039A88: @ 0x08039A88
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08039AA0
	ldrh r1, [r2, #0x32]
	adds r0, r2, #0
	bl BattleAnimateBackSprite
_08039AA0:
	pop {r0}
	bx r0
	thumb_func_end sub_08039A88

	thumb_func_start sub_08039AA4
sub_08039AA4: @ 0x08039AA4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08039AE0
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08039ABE
	ldr r0, _08039AC4
	str r0, [r4, #0x1c]
_08039ABE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039AC4: .4byte 0x08039841
	thumb_func_end sub_08039AA4

	thumb_func_start sub_08039AC8
sub_08039AC8: @ 0x08039AC8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, _08039ADC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039ADC: .4byte 0x08039AA5
	thumb_func_end sub_08039AC8

	thumb_func_start sub_08039AE0
sub_08039AE0: @ 0x08039AE0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08039B02
	ldr r1, _08039B08
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x28
	strb r1, [r0]
_08039B02:
	pop {r0}
	bx r0
	.align 2, 0
_08039B08: .4byte 0x082EBB30
	thumb_func_end sub_08039AE0

	thumb_func_start nullsub_20
nullsub_20: @ 0x08039B0C
	bx lr
	.align 2, 0
	thumb_func_end nullsub_20

	thumb_func_start BeginBattleIntro
BeginBattleIntro: @ 0x08039B10
	push {lr}
	bl BattleStartClearSetData
	ldr r1, _08039B28
	movs r0, #0
	strb r0, [r1, #1]
	ldr r1, _08039B2C
	ldr r0, _08039B30
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08039B28: .4byte 0x02023FD6
_08039B2C: .4byte 0x03005A64
_08039B30: .4byte 0x0803A805
	thumb_func_end BeginBattleIntro

	thumb_func_start sub_08039B34
sub_08039B34: @ 0x08039B34
	push {r4, r5, lr}
	ldr r0, _08039B74
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _08039B78
	thumb_func_end sub_08039B34

	thumb_func_start BattleMainCB1
BattleMainCB1: @ 0x08039B40
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08039B7C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039B6E
	ldr r5, _08039B80
	adds r4, r1, #0
_08039B50:
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _08039B7C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _08039B50
_08039B6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039B74: .4byte 0x03005A64
_08039B78: .4byte 0x02023D08
_08039B7C: .4byte 0x02023D10
_08039B80: .4byte 0x03005AC0
	thumb_func_end BattleMainCB1

	thumb_func_start BattleStartClearSetData
BattleStartClearSetData: @ 0x08039B84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	bl TurnValuesCleanUp
	bl SpecialStatusesClear
	movs r2, #0
	movs r3, #0
	ldr r0, _08039C80
	mov sl, r0
	ldr r1, _08039C84
	mov sb, r1
	ldr r0, _08039C88
	mov r8, r0
	ldr r1, _08039C8C
	mov ip, r1
	ldr r5, _08039C90
	movs r4, #0
	ldr r7, _08039C94
	ldr r6, _08039C98
_08039BB4:
	ldr r0, _08039C9C
	adds r0, r4, r0
	str r3, [r0]
	movs r1, #0
_08039BBC:
	adds r0, r5, r1
	strb r3, [r0]
	adds r1, #1
	cmp r1, #0x1b
	bls _08039BBC
	movs r0, #2
	strb r0, [r5, #0x16]
	ldr r1, _08039CA0
	adds r0, r2, r1
	strb r3, [r0]
	mov r0, ip
	strh r3, [r0]
	mov r1, r8
	strh r3, [r1]
	mov r0, sb
	strh r3, [r0]
	mov r1, sl
	strh r3, [r1]
	ldr r0, _08039CA4
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r3, [r6]
	strh r3, [r7]
	ldr r1, _08039CA8
	ldr r0, [r1]
	ldr r0, [r0, #4]
	adds r0, r0, r4
	str r3, [r0]
	ldr r1, _08039CAC
	adds r0, r4, r1
	str r3, [r0]
	movs r0, #2
	add sl, r0
	add sb, r0
	add r8, r0
	add ip, r0
	adds r5, #0x1c
	adds r4, #4
	adds r7, #2
	adds r6, #2
	adds r2, #1
	cmp r2, #3
	ble _08039BB4
	movs r5, #0
	ldr r3, _08039CB0
	ldr r4, _08039CB4
	movs r2, #1
_08039C1C:
	strh r5, [r4]
	movs r1, #0
_08039C20:
	adds r0, r3, r1
	strb r5, [r0]
	adds r1, #1
	cmp r1, #0xb
	bls _08039C20
	adds r3, #0xc
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge _08039C1C
	movs r1, #0
	ldr r2, _08039CB8
	strb r1, [r2]
	ldr r0, _08039CBC
	strb r1, [r0]
	ldr r2, _08039CC0
	strh r1, [r2]
	ldr r1, _08039CC4
	movs r2, #0
	movs r3, #0
_08039C48:
	adds r0, r1, r2
	strb r3, [r0]
	adds r2, #1
	cmp r2, #0x2b
	bls _08039C48
	ldr r2, _08039CC8
	movs r0, #0
	str r0, [r2]
	ldr r0, _08039CCC
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	bne _08039CD4
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08039CF2
	ldr r0, _08039CD0
	ldr r0, [r0]
	ldrb r1, [r0, #0x15]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08039CF2
	movs r0, #0x80
	b _08039CF0
	.align 2, 0
_08039C80: .4byte 0x02023F04
_08039C84: .4byte 0x02023EFC
_08039C88: .4byte 0x02023EF4
_08039C8C: .4byte 0x02023EEC
_08039C90: .4byte 0x02023F60
_08039C94: .4byte 0x02023EE4
_08039C98: .4byte 0x02023F0C
_08039C9C: .4byte 0x02023F50
_08039CA0: .4byte 0x02023F28
_08039CA4: .4byte 0x02023F14
_08039CA8: .4byte 0x0202414C
_08039CAC: .4byte 0x02023ED4
_08039CB0: .4byte 0x02023F38
_08039CB4: .4byte 0x02023F32
_08039CB8: .4byte 0x02023EAF
_08039CBC: .4byte 0x02023EB0
_08039CC0: .4byte 0x02024070
_08039CC4: .4byte 0x02024074
_08039CC8: .4byte 0x02023F24
_08039CCC: .4byte 0x02022C90
_08039CD0: .4byte 0x03005AF0
_08039CD4:
	ldr r0, _08039E70
	ands r1, r0
	cmp r1, #0
	bne _08039CF2
	bl GetRecordedBattleRecordMixFriendClass
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039CF2
	ldr r1, _08039E74
	ldr r0, [r1]
	movs r1, #0x80
	orrs r0, r1
	ldr r2, _08039E74
_08039CF0:
	str r0, [r2]
_08039CF2:
	ldr r3, _08039E78
	ldr r0, _08039E7C
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	movs r1, #0
	strb r0, [r3, #0x1d]
	ldr r0, _08039E80
	strb r1, [r0]
	ldr r0, _08039E84
	strb r1, [r0]
	ldr r0, _08039E88
	str r1, [r0]
	ldr r0, _08039E8C
	movs r2, #0
	strh r1, [r0]
	ldr r1, _08039E90
	ldr r0, [r1]
	ldr r0, [r0, #8]
	adds r0, #0x20
	strb r2, [r0]
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	adds r0, #0x20
	strb r2, [r0]
	ldr r5, _08039E94
	ldr r6, _08039E98
	ldr r7, _08039E9C
	ldr r0, _08039EA0
	mov r8, r0
	ldr r1, _08039EA4
	mov sb, r1
	ldr r2, _08039EA8
	mov sl, r2
	ldr r1, _08039EAC
	movs r2, #0
	adds r0, r1, #7
_08039D3E:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08039D3E
	movs r4, #0
	strh r4, [r5]
	movs r0, #0
	str r0, [r6]
	strh r0, [r7]
	strb r4, [r3, #0x18]
	strb r4, [r3, #0x19]
	mov r0, r8
	strb r4, [r0]
	mov r1, sb
	strb r4, [r1]
	ldr r5, _08039EB0
	ldr r0, [r5]
	adds r0, #0x6c
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, #0x79
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, #0x7a
	strb r4, [r0]
	mov r0, sl
	movs r1, #0xb
	bl GetMonData
	ldr r6, [r5]
	adds r6, #0x7c
	ldr r2, _08039EB4
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #8]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08039EB8
	bl __divsi3
	strb r0, [r6]
	ldr r0, [r5]
	adds r0, #0x7b
	movs r1, #3
	strb r1, [r0]
	ldr r0, [r5]
	strb r4, [r0, #0x12]
	ldr r0, [r5]
	adds r0, #0x4a
	movs r1, #1
	strb r1, [r0]
	movs r2, #0
	movs r1, #0
	adds r6, r5, #0
_08039DAE:
	ldr r0, [r5]
	adds r0, r2, r0
	adds r0, #0x98
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r2, r0
	adds r0, #0xb8
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r2, r0
	adds r0, #0xc8
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r2, r0
	adds r0, #0xd0
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r2, r0
	adds r0, #0xe0
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r2, r0
	adds r0, #0xe8
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r2, r0
	adds r0, #0xf0
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r2, r0
	adds r0, #0xf8
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08039DAE
	movs r2, #0
	ldr r4, _08039EB0
	movs r3, #0xa5
	lsls r3, r3, #2
	movs r1, #6
_08039DFE:
	ldr r0, [r4]
	adds r0, r2, r0
	adds r0, r0, r3
	strb r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _08039DFE
	ldr r0, [r6]
	adds r0, #0xdf
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #0x92
	strb r1, [r0]
	bl Random
	ldr r1, _08039EBC
	strh r0, [r1]
	ldr r1, _08039EC0
	movs r2, #0
	movs r3, #0
_08039E28:
	adds r0, r1, r2
	strb r3, [r0]
	adds r2, #1
	cmp r2, #0x43
	bls _08039E28
	ldr r0, _08039EA8
	bl IsMonShiny
	ldr r3, _08039EC0
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #6
	ldrb r2, [r3, #5]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r2, _08039EB0
	ldr r0, [r2]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, _08039EC4
	adds r0, r0, r2
	strb r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039E70: .4byte 0x02000002
_08039E74: .4byte 0x02023F24
_08039E78: .4byte 0x02024118
_08039E7C: .4byte 0x03005AF0
_08039E80: .4byte 0x02023EB6
_08039E84: .4byte 0x02023FDE
_08039E88: .4byte 0x02023D0C
_08039E8C: .4byte 0x02023FD2
_08039E90: .4byte 0x0202414C
_08039E94: .4byte 0x02023FD0
_08039E98: .4byte 0x02023E94
_08039E9C: .4byte 0x020240A0
_08039EA0: .4byte 0x03005AB4
_08039EA4: .4byte 0x02023EB4
_08039EA8: .4byte 0x020243E8
_08039EAC: .4byte 0x02023FD6
_08039EB0: .4byte 0x02024140
_08039EB4: .4byte 0x082F0D54
_08039EB8: .4byte 0x000004FB
_08039EBC: .4byte 0x02023FD4
_08039EC0: .4byte 0x03005A70
_08039EC4: .4byte 0x000002A1
	thumb_func_end BattleStartClearSetData

	thumb_func_start SwitchInClearSetData
SwitchInClearSetData: @ 0x08039EC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r4, _0803A02C
	ldr r5, _0803A030
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r1, sp
	adds r0, r0, r4
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _0803A034
	ldr r3, _0803A038
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	mov ip, r4
	mov sb, r5
	ldr r6, _0803A03C
	mov sl, r6
	cmp r0, #0x7f
	beq _08039FA0
	movs r5, #0
	mov r6, sb
	movs r4, #0x58
	ldr r2, _0803A040
	adds r2, #0x18
	movs r1, #6
_08039F18:
	ldrb r0, [r6]
	muls r0, r4, r0
	adds r0, r5, r0
	adds r0, r0, r2
	strb r1, [r0]
	adds r5, #1
	cmp r5, #7
	ble _08039F18
	movs r5, #0
	ldr r7, _0803A044
	ldrb r7, [r7]
	cmp r5, r7
	bge _08039F8C
	ldr r0, _0803A048
	mov r8, r0
	ldr r4, _0803A02C
	ldr r3, _0803A03C
_08039F3A:
	movs r0, #0x58
	muls r0, r5, r0
	mov r1, r8
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _08039F5E
	ldrb r0, [r4, #0x14]
	ldr r6, _0803A030
	ldrb r6, [r6]
	cmp r0, r6
	bne _08039F5E
	ldr r0, _0803A04C
	ands r1, r0
	str r1, [r2]
_08039F5E:
	ldr r1, [r3]
	movs r0, #0x18
	ands r0, r1
	cmp r0, #0
	beq _08039F7E
	ldrb r0, [r4, #0x15]
	ldr r7, _0803A030
	ldrb r7, [r7]
	cmp r0, r7
	bne _08039F7E
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3]
	movs r0, #0
	strb r0, [r4, #0x15]
_08039F7E:
	adds r4, #0x1c
	adds r3, #4
	adds r5, #1
	ldr r0, _0803A044
	ldrb r0, [r0]
	cmp r5, r0
	blt _08039F3A
_08039F8C:
	ldr r1, _0803A038
	ldrh r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _0803A034
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0x7f
	bne _0803A058
_08039FA0:
	mov r3, sb
	ldrb r1, [r3]
	movs r0, #0x58
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, _0803A040
	adds r0, #0x50
	adds r2, r2, r0
	ldr r0, [r2]
	ldr r1, _0803A050
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r3]
	lsls r1, r1, #2
	add r1, sl
	ldr r0, [r1]
	ldr r2, _0803A054
	ands r0, r2
	str r0, [r1]
	movs r5, #0
	ldr r6, _0803A044
	ldrb r6, [r6]
	cmp r5, r6
	bge _0803A074
	mov r7, sb
	movs r6, #0
_08039FD4:
	ldrb r0, [r7]
	bl GetBattlerSide
	adds r4, r0, #0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _0803A014
	ldr r1, _0803A03C
	lsls r0, r5, #2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #0x18
	ands r0, r1
	cmp r0, #0
	beq _0803A014
	ldr r0, _0803A02C
	adds r0, r6, r0
	ldrb r0, [r0, #0x15]
	ldrb r3, [r7]
	cmp r0, r3
	bne _0803A014
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	str r1, [r2]
_0803A014:
	adds r6, #0x1c
	adds r5, #1
	ldr r0, _0803A044
	ldrb r0, [r0]
	cmp r5, r0
	blt _08039FD4
	ldr r6, _0803A02C
	mov ip, r6
	ldr r7, _0803A030
	mov sb, r7
	b _0803A074
	.align 2, 0
_0803A02C: .4byte 0x02023F60
_0803A030: .4byte 0x02023D08
_0803A034: .4byte 0x082ED220
_0803A038: .4byte 0x02023E8E
_0803A03C: .4byte 0x02023F50
_0803A040: .4byte 0x02023D28
_0803A044: .4byte 0x02023D10
_0803A048: .4byte 0x02023D78
_0803A04C: .4byte 0xFBFFFFFF
_0803A050: .4byte 0x15100007
_0803A054: .4byte 0x0003043F
_0803A058:
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	ldr r1, _0803A354
	adds r1, #0x50
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #2
	add r0, sl
	str r1, [r0]
_0803A074:
	movs r5, #0
	ldr r3, _0803A358
	mov r8, r3
	ldr r6, _0803A35C
	mov sl, r6
	ldr r7, _0803A360
	ldrb r7, [r7]
	cmp r5, r7
	bge _0803A0D4
	ldr r3, _0803A364
	ldr r7, _0803A368
	ldr r6, _0803A36C
_0803A08C:
	movs r0, #0x58
	muls r0, r5, r0
	adds r4, r0, r3
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	lsls r2, r0, #0x10
	ldr r1, [r4]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0803A0AA
	bics r1, r2
	str r1, [r4]
_0803A0AA:
	ldr r1, [r4]
	movs r0, #0xe0
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0803A0CA
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldrb r0, [r0, #0x14]
	ldrb r2, [r6]
	cmp r0, r2
	bne _0803A0CA
	ldr r0, _0803A370
	ands r1, r0
	str r1, [r4]
_0803A0CA:
	adds r5, #1
	ldr r0, _0803A360
	ldrb r0, [r0]
	cmp r5, r0
	blt _0803A08C
_0803A0D4:
	mov r1, sb
	ldrb r0, [r1]
	add r0, sl
	movs r1, #0
	strb r1, [r0]
	mov r2, sb
	ldrb r0, [r2]
	ldr r3, _0803A374
	adds r0, r0, r3
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r6, ip
	adds r1, r0, r6
	movs r5, #0
	movs r2, #0
_0803A0F8:
	adds r0, r1, r5
	strb r2, [r0]
	adds r5, #1
	cmp r5, #0x1b
	bls _0803A0F8
	ldr r7, _0803A378
	ldrh r0, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0803A37C
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x7f
	bne _0803A184
	mov r2, sb
	ldrb r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	mov r1, sp
	ldrb r1, [r1, #0xa]
	strb r1, [r0, #0xa]
	ldrb r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	mov r1, sp
	ldrb r1, [r1, #0x15]
	strb r1, [r0, #0x15]
	ldrb r0, [r2]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	mov r0, sp
	ldrb r2, [r0, #0xf]
	lsls r2, r2, #0x1c
	movs r4, #0xf
	lsrs r2, r2, #0x1c
	ldrb r3, [r1, #0xf]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #0xf]
	mov r3, sb
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	mov r1, sp
	ldrb r1, [r1, #0xf]
	lsrs r1, r1, #4
	lsls r1, r1, #4
	ldrb r2, [r0, #0xf]
	ands r4, r2
	orrs r4, r1
	strb r4, [r0, #0xf]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	mov r1, sp
	ldrb r1, [r1, #0x14]
	strb r1, [r0, #0x14]
_0803A184:
	movs r0, #0
	ldr r6, _0803A380
	strb r0, [r6]
	mov r7, sb
	ldrb r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	movs r4, #0
	movs r1, #2
	strb r1, [r0, #0x16]
	ldrb r0, [r7]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	mov r0, sp
	ldrb r0, [r0, #0x18]
	movs r2, #2
	ands r2, r0
	ldrb r3, [r1, #0x18]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #0x18]
	ldrb r0, [r7]
	lsls r0, r0, #1
	ldr r1, _0803A384
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #1
	ldr r3, _0803A388
	adds r0, r0, r3
	strh r4, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #1
	ldr r6, _0803A38C
	adds r0, r0, r6
	strh r4, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #1
	ldr r7, _0803A390
	adds r0, r0, r7
	strh r4, [r0]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #1
	ldr r3, _0803A394
	adds r0, r0, r3
	strh r4, [r0]
	ldrb r0, [r1]
	ldr r6, _0803A398
	adds r0, r0, r6
	movs r1, #0xff
	strb r1, [r0]
	mov r7, sb
	ldrb r0, [r7]
	mov r3, r8
	ldr r1, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0x98
	strb r2, [r0]
	ldrb r0, [r7]
	ldr r1, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0x99
	strb r2, [r0]
	ldrb r0, [r7]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe0
	strb r2, [r0]
	ldrb r0, [r7]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe1
	strb r2, [r0]
	ldrb r0, [r7]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe2
	strb r2, [r0]
	ldrb r0, [r7]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe3
	strb r2, [r0]
	ldrb r0, [r7]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe4
	strb r2, [r0]
	ldrb r0, [r7]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe5
	strb r2, [r0]
	ldrb r0, [r7]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe6
	strb r2, [r0]
	ldrb r0, [r7]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe7
	strb r2, [r0]
	ldr r1, [r3]
	adds r1, #0x92
	ldrb r0, [r7]
	lsls r0, r0, #2
	ldr r6, _0803A368
	adds r0, r0, r6
	ldr r2, [r0]
	ldrb r0, [r1]
	bics r0, r2
	strb r0, [r1]
	movs r5, #0
	ldr r7, _0803A360
	ldrb r7, [r7]
	cmp r5, r7
	bge _0803A2F8
	mov r3, sb
	mov r7, r8
	movs r6, #0
_0803A29A:
	ldrb r0, [r3]
	cmp r5, r0
	beq _0803A2D0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp, #0x1c]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r3, [sp, #0x1c]
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x1c]
	cmp r4, r0
	beq _0803A2D0
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, r1, r0
	adds r0, #0x98
	strb r6, [r0]
	ldr r0, [r7]
	adds r1, r1, r0
	adds r1, #0x99
	strb r6, [r1]
_0803A2D0:
	ldrb r0, [r3]
	ldr r1, [r7]
	lsls r0, r0, #1
	lsls r2, r5, #3
	adds r0, r0, r2
	adds r0, r0, r1
	adds r0, #0xe0
	strb r6, [r0]
	ldrb r0, [r3]
	ldr r1, [r7]
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r0, r0, r1
	adds r0, #0xe1
	strb r6, [r0]
	adds r5, #1
	ldr r0, _0803A360
	ldrb r0, [r0]
	cmp r5, r0
	blt _0803A29A
_0803A2F8:
	mov r1, sb
	ldrb r0, [r1]
	mov r2, r8
	ldr r1, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0xc8
	movs r2, #0
	strb r2, [r0]
	mov r3, sb
	ldrb r0, [r3]
	mov r6, r8
	ldr r1, [r6]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0xc9
	strb r2, [r0]
	ldr r0, _0803A39C
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r2, #0
	str r2, [r1]
	ldr r0, _0803A378
	strh r2, [r0]
	ldr r0, [r6]
	adds r0, #0xda
	movs r1, #0xff
	strb r1, [r0]
	ldrb r0, [r3]
	bl ClearBattlerMoveHistory
	mov r7, sb
	ldrb r0, [r7]
	bl ClearBattlerAbilityHistory
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A354: .4byte 0x02023D28
_0803A358: .4byte 0x02024140
_0803A35C: .4byte 0x02024150
_0803A360: .4byte 0x02023D10
_0803A364: .4byte 0x02023D78
_0803A368: .4byte 0x082FACB4
_0803A36C: .4byte 0x02023D08
_0803A370: .4byte 0xFFFF1FFF
_0803A374: .4byte 0x02024154
_0803A378: .4byte 0x02023E8E
_0803A37C: .4byte 0x082ED220
_0803A380: .4byte 0x02023F20
_0803A384: .4byte 0x02023EEC
_0803A388: .4byte 0x02023EF4
_0803A38C: .4byte 0x02023EFC
_0803A390: .4byte 0x02023F04
_0803A394: .4byte 0x02023EE4
_0803A398: .4byte 0x02023F14
_0803A39C: .4byte 0x0202414C
	thumb_func_end SwitchInClearSetData

	thumb_func_start FaintClearSetData
FaintClearSetData: @ 0x0803A3A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r5, #0
	ldr r6, _0803A764
	ldr r0, _0803A768
	mov r8, r0
	ldr r1, _0803A76C
	mov ip, r1
	ldr r2, _0803A770
	mov sb, r2
	ldr r3, _0803A774
	mov sl, r3
	ldr r7, _0803A778
	ldr r4, _0803A77C
	movs r3, #0x58
	adds r2, r6, #0
	adds r2, #0x18
	movs r1, #6
_0803A3CC:
	ldrb r0, [r4]
	muls r0, r3, r0
	adds r0, r5, r0
	adds r0, r0, r2
	strb r1, [r0]
	adds r5, #1
	cmp r5, #7
	ble _0803A3CC
	ldr r0, _0803A77C
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r2, r6, #0
	adds r2, #0x50
	adds r0, r0, r2
	movs r1, #0
	str r1, [r0]
	ldr r3, _0803A77C
	ldrb r0, [r3]
	lsls r0, r0, #2
	add r0, r8
	str r1, [r0]
	movs r5, #0
	ldr r6, _0803A780
	ldrb r6, [r6]
	cmp r5, r6
	bge _0803A474
	adds r3, r2, #0
	movs r4, #0
	ldr r0, _0803A784
	mov r8, r0
_0803A40A:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _0803A42A
	ldr r2, _0803A788
	adds r0, r4, r2
	ldrb r0, [r0, #0x14]
	ldr r6, _0803A77C
	ldrb r6, [r6]
	cmp r0, r6
	bne _0803A42A
	ldr r0, _0803A78C
	ands r1, r0
	str r1, [r3]
_0803A42A:
	ldr r1, _0803A77C
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	lsls r2, r0, #0x10
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0803A444
	bics r1, r2
	str r1, [r3]
_0803A444:
	ldr r1, [r3]
	movs r0, #0xe0
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0803A466
	mov r2, ip
	ldr r0, [r2]
	adds r0, r5, r0
	ldrb r0, [r0, #0x14]
	ldr r6, _0803A77C
	ldrb r6, [r6]
	cmp r0, r6
	bne _0803A466
	ldr r0, _0803A790
	ands r1, r0
	str r1, [r3]
_0803A466:
	adds r3, #0x58
	adds r4, #0x1c
	adds r5, #1
	ldr r0, _0803A780
	ldrb r0, [r0]
	cmp r5, r0
	blt _0803A40A
_0803A474:
	ldr r1, _0803A77C
	ldrb r0, [r1]
	add r0, sb
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0803A77C
	ldrb r0, [r2]
	add r0, sl
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _0803A788
	adds r1, r0, r3
	movs r5, #0
	movs r2, #0
_0803A496:
	adds r0, r1, r5
	strb r2, [r0]
	adds r5, #1
	cmp r5, #0x1b
	bls _0803A496
	ldr r6, _0803A77C
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r3, #3
	rsbs r3, r3, #0
	mov r8, r3
	mov r0, r8
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r6, #5
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _0803A77C
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	subs r3, #6
	mov sl, r3
	mov r0, sl
	ands r0, r2
	strb r0, [r1]
	ldr r0, _0803A77C
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r2, _0803A77C
	ldrb r1, [r2]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r5, #0x21
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r2
	strb r0, [r1]
	ldr r3, _0803A77C
	ldrb r1, [r3]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r4, #0x41
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r3, #0x7f
	adds r0, r3, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _0803A77C
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1, #1]
	mov r0, sb
	ands r0, r2
	strb r0, [r1, #1]
	ldr r2, _0803A77C
	ldrb r1, [r2]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1, #1]
	mov r0, r8
	ands r0, r2
	strb r0, [r1, #1]
	ldr r0, _0803A77C
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1, #1]
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldr r2, _0803A77C
	ldrb r1, [r2]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1, #1]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldr r1, _0803A77C
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r1, [r0, #1]
	ands r5, r1
	strb r5, [r0, #1]
	ldr r2, _0803A77C
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r1, [r0, #1]
	ands r4, r1
	strb r4, [r0, #1]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r1, [r0, #1]
	ands r3, r1
	strb r3, [r0, #1]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r1, [r0, #2]
	mov r3, sb
	ands r3, r1
	strb r3, [r0, #2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r1, [r0, #2]
	mov r2, r8
	ands r2, r1
	strb r2, [r0, #2]
	ldr r3, _0803A77C
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r1, [r0, #2]
	ands r6, r1
	strb r6, [r0, #2]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r1, [r0, #2]
	mov r6, sl
	ands r6, r1
	strb r6, [r0, #2]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0803A788
	adds r0, r0, r1
	movs r2, #0
	movs r1, #2
	strb r1, [r0, #0x16]
	ldrb r0, [r3]
	lsls r0, r0, #1
	ldr r3, _0803A794
	adds r0, r0, r3
	movs r3, #0
	strh r2, [r0]
	ldr r6, _0803A77C
	ldrb r0, [r6]
	lsls r0, r0, #1
	ldr r1, _0803A798
	adds r0, r0, r1
	strh r2, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #1
	ldr r6, _0803A79C
	adds r0, r0, r6
	strh r2, [r0]
	ldr r1, _0803A77C
	ldrb r0, [r1]
	lsls r0, r0, #1
	ldr r6, _0803A7A0
	adds r0, r0, r6
	strh r2, [r0]
	ldrb r0, [r1]
	lsls r0, r0, #1
	ldr r1, _0803A7A4
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, _0803A77C
	ldrb r0, [r2]
	ldr r6, _0803A7A8
	adds r0, r0, r6
	movs r1, #0xff
	strb r1, [r0]
	ldrb r0, [r2]
	mov r2, ip
	ldr r1, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0xc8
	strb r3, [r0]
	ldr r6, _0803A77C
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0xc9
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0x98
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0x99
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe0
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe1
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe2
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe3
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe4
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe5
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe6
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0xe7
	strb r3, [r0]
	ldr r1, [r2]
	adds r1, #0x92
	ldrb r0, [r6]
	lsls r0, r0, #2
	ldr r2, _0803A784
	adds r0, r0, r2
	ldr r2, [r0]
	ldrb r0, [r1]
	bics r0, r2
	strb r0, [r1]
	movs r5, #0
	ldr r3, _0803A780
	ldrb r3, [r3]
	cmp r5, r3
	bge _0803A746
	adds r3, r6, #0
	mov r7, ip
	movs r6, #0
_0803A6E8:
	ldrb r0, [r3]
	cmp r5, r0
	beq _0803A71E
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r3, [sp]
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	ldr r3, [sp]
	cmp r4, r0
	beq _0803A71E
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, r1, r0
	adds r0, #0x98
	strb r6, [r0]
	ldr r0, [r7]
	adds r1, r1, r0
	adds r1, #0x99
	strb r6, [r1]
_0803A71E:
	ldrb r0, [r3]
	ldr r1, [r7]
	lsls r0, r0, #1
	lsls r2, r5, #3
	adds r0, r0, r2
	adds r0, r0, r1
	adds r0, #0xe0
	strb r6, [r0]
	ldrb r0, [r3]
	ldr r1, [r7]
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r0, r0, r1
	adds r0, #0xe1
	strb r6, [r0]
	adds r5, #1
	ldr r0, _0803A780
	ldrb r0, [r0]
	cmp r5, r0
	blt _0803A6E8
_0803A746:
	ldr r0, _0803A7AC
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldr r2, _0803A77C
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
	ldr r4, _0803A764
	ldrb r0, [r2]
	movs r3, #0x58
	adds r2, r0, #0
	muls r2, r3, r2
	b _0803A7B0
	.align 2, 0
_0803A764: .4byte 0x02023D28
_0803A768: .4byte 0x02023F50
_0803A76C: .4byte 0x02024140
_0803A770: .4byte 0x02024150
_0803A774: .4byte 0x02024154
_0803A778: .4byte 0x02023FE0
_0803A77C: .4byte 0x02023D08
_0803A780: .4byte 0x02023D10
_0803A784: .4byte 0x082FACB4
_0803A788: .4byte 0x02023F60
_0803A78C: .4byte 0xFBFFFFFF
_0803A790: .4byte 0xFFFF1FFF
_0803A794: .4byte 0x02023EEC
_0803A798: .4byte 0x02023EF4
_0803A79C: .4byte 0x02023EFC
_0803A7A0: .4byte 0x02023F04
_0803A7A4: .4byte 0x02023EE4
_0803A7A8: .4byte 0x02023F14
_0803A7AC: .4byte 0x0202414C
_0803A7B0:
	adds r2, r2, r4
	ldr r5, _0803A7FC
	ldrh r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0, #6]
	adds r2, #0x21
	strb r0, [r2]
	ldr r6, _0803A800
	ldrb r0, [r6]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r1, r4
	ldrh r2, [r1]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0, #7]
	adds r1, #0x22
	strb r0, [r1]
	ldrb r0, [r6]
	bl ClearBattlerMoveHistory
	ldrb r0, [r6]
	bl ClearBattlerAbilityHistory
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A7FC: .4byte 0x082F0D54
_0803A800: .4byte 0x02023D08
	thumb_func_end FaintClearSetData

	thumb_func_start BattleIntroGetMonsData
BattleIntroGetMonsData: @ 0x0803A804
	push {r4, r5, lr}
	ldr r5, _0803A814
	ldrb r0, [r5]
	cmp r0, #0
	beq _0803A818
	cmp r0, #1
	beq _0803A83C
	b _0803A872
	.align 2, 0
_0803A814: .4byte 0x02023FD6
_0803A818:
	ldr r4, _0803A838
	ldrb r0, [r5, #1]
	strb r0, [r4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BtlController_EmitGetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0803A872
	.align 2, 0
_0803A838: .4byte 0x02023D08
_0803A83C:
	ldr r0, _0803A860
	ldr r2, [r0]
	cmp r2, #0
	bne _0803A872
	ldrb r0, [r5, #1]
	adds r0, #1
	strb r0, [r5, #1]
	ldr r1, _0803A864
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _0803A870
	ldr r1, _0803A868
	ldr r0, _0803A86C
	str r0, [r1]
	b _0803A872
	.align 2, 0
_0803A860: .4byte 0x02023D0C
_0803A864: .4byte 0x02023D10
_0803A868: .4byte 0x03005A64
_0803A86C: .4byte 0x0803A879
_0803A870:
	strb r2, [r5]
_0803A872:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BattleIntroGetMonsData

	thumb_func_start BattleIntroPrepareBackgroundSlide
BattleIntroPrepareBackgroundSlide: @ 0x0803A878
	push {r4, r5, lr}
	ldr r0, _0803A8B0
	ldr r5, [r0]
	cmp r5, #0
	bne _0803A8A8
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r4, _0803A8B4
	strb r0, [r4]
	ldr r0, _0803A8B8
	ldrb r1, [r0]
	movs r0, #0
	bl BtlController_EmitIntroSlide
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _0803A8BC
	ldr r0, _0803A8C0
	str r0, [r1]
	ldr r0, _0803A8C4
	strb r5, [r0]
	strb r5, [r0, #1]
_0803A8A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A8B0: .4byte 0x02023D0C
_0803A8B4: .4byte 0x02023D08
_0803A8B8: .4byte 0x02022C94
_0803A8BC: .4byte 0x03005A64
_0803A8C0: .4byte 0x0803A8C9
_0803A8C4: .4byte 0x02023FD6
	thumb_func_end BattleIntroPrepareBackgroundSlide

	thumb_func_start BattleIntroDrawTrainersOrMonsSprites
BattleIntroDrawTrainersOrMonsSprites: @ 0x0803A8C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0803A92C
	ldr r1, [r0]
	cmp r1, #0
	beq _0803A8DC
	b _0803AB92
_0803A8DC:
	ldr r2, _0803A930
	strb r1, [r2]
	ldr r0, _0803A934
	ldrb r0, [r0]
	cmp r1, r0
	blo _0803A8EA
	b _0803AB8C
_0803A8EA:
	movs r7, #0x58
	ldr r0, _0803A938
	mov r8, r0
	mov sb, r2
	movs r1, #0x48
	add r1, r8
	mov sl, r1
_0803A8F8:
	ldr r0, _0803A93C
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803A940
	ldr r4, _0803A930
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A940
	ldrb r0, [r4]
	muls r0, r7, r0
	mov r2, r8
	adds r3, r0, r2
	movs r2, #0
	movs r1, #0
_0803A91E:
	adds r0, r3, r2
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x57
	bls _0803A91E
	b _0803AA0E
	.align 2, 0
_0803A92C: .4byte 0x02023D0C
_0803A930: .4byte 0x02023D08
_0803A934: .4byte 0x02023D10
_0803A938: .4byte 0x02023D28
_0803A93C: .4byte 0x02022C90
_0803A940:
	mov r1, sb
	ldrb r0, [r1]
	muls r0, r7, r0
	mov r2, r8
	adds r3, r0, r2
	movs r2, #0
	ldr r6, _0803AA88
	ldr r5, _0803AA8C
	ldr r4, _0803AA90
_0803A952:
	adds r0, r3, r2
	ldrb r1, [r4]
	lsls r1, r1, #9
	adds r1, #4
	adds r1, r2, r1
	adds r1, r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x57
	bls _0803A952
	mov r1, sb
	ldrb r0, [r1]
	adds r2, r0, #0
	muls r2, r7, r2
	add r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #6]
	adds r2, #0x21
	strb r0, [r2]
	mov r2, sb
	ldrb r0, [r2]
	adds r2, r0, #0
	muls r2, r7, r2
	add r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #7]
	adds r2, #0x22
	strb r0, [r2]
	mov r1, sb
	ldrb r0, [r1]
	adds r1, r0, #0
	muls r1, r7, r1
	add r1, r8
	ldrh r0, [r1]
	ldrb r1, [r1, #0x17]
	lsrs r1, r1, #7
	bl GetAbilityBySpecies
	mov r2, sb
	ldrb r1, [r2]
	muls r1, r7, r1
	add r1, r8
	adds r1, #0x20
	strb r0, [r1]
	ldrb r0, [r2]
	bl GetBattlerSide
	ldr r1, _0803AA94
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, #0xa8
	ldr r1, [r1]
	adds r1, r1, r0
	mov r2, sb
	ldrb r0, [r2]
	muls r0, r7, r0
	add r0, r8
	ldrh r0, [r0, #0x28]
	strh r0, [r1]
	movs r2, #0
	ldr r4, _0803AA90
	movs r5, #0x58
	ldr r1, _0803AA98
	adds r6, r4, #0
	movs r0, #0x18
	rsbs r0, r0, #0
	adds r0, r0, r1
	mov ip, r0
	movs r3, #6
_0803A9EE:
	ldrb r0, [r4]
	muls r0, r5, r0
	adds r0, r2, r0
	adds r0, r0, r1
	strb r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble _0803A9EE
	ldrb r0, [r6]
	adds r1, r0, #0
	muls r1, r7, r1
	mov r0, ip
	adds r0, #0x50
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_0803AA0E:
	ldr r4, _0803AA90
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803AA28
	movs r0, #0
	bl BtlController_EmitDrawTrainerPic
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803AA28:
	ldr r5, _0803AA9C
	ldr r0, [r5]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0803AAA4
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0803AA4E
	movs r0, #0
	bl BtlController_EmitDrawTrainerPic
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803AA4E:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0803AB04
	ldr r0, [r5]
	ldr r1, _0803AAA0
	ands r0, r1
	cmp r0, #0
	bne _0803AB04
	ldrb r0, [r4]
	muls r0, r7, r0
	add r0, r8
	ldrh r0, [r0]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r4]
	muls r1, r7, r1
	add r1, sl
	ldr r2, [r1]
	movs r1, #2
	bl HandleSetPokedexFlag
	b _0803AB04
	.align 2, 0
_0803AA88: .4byte 0x082F0D54
_0803AA8C: .4byte 0x02023508
_0803AA90: .4byte 0x02023D08
_0803AA94: .4byte 0x02024140
_0803AA98: .4byte 0x02023D40
_0803AA9C: .4byte 0x02022C90
_0803AAA0: .4byte 0x063F0902
_0803AAA4:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0803AB04
	ldr r0, [r5]
	ldr r1, _0803ABA0
	ands r0, r1
	cmp r0, #0
	bne _0803AADA
	ldrb r0, [r4]
	muls r0, r7, r0
	add r0, r8
	ldrh r0, [r0]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r4]
	muls r1, r7, r1
	add r1, sl
	ldr r2, [r1]
	movs r1, #2
	bl HandleSetPokedexFlag
_0803AADA:
	movs r0, #0
	bl BtlController_EmitLoadMonSprite
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _0803ABA4
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0803ABA8
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	ldr r1, _0803ABAC
	strh r0, [r1, #0x20]
_0803AB04:
	ldr r0, _0803ABB0
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803AB3A
	ldr r4, _0803ABB4
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _0803AB2E
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0803AB3A
_0803AB2E:
	movs r0, #0
	bl BtlController_EmitDrawTrainerPic
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803AB3A:
	ldr r0, _0803ABB0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0803AB64
	ldr r4, _0803ABB4
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0803AB64
	movs r0, #0
	bl BtlController_EmitDrawTrainerPic
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803AB64:
	ldr r0, _0803ABB0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0803AB76
	bl BattleArena_InitPoints
_0803AB76:
	mov r1, sb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0803ABB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0803AB8C
	b _0803A8F8
_0803AB8C:
	ldr r1, _0803ABBC
	ldr r0, _0803ABC0
	str r0, [r1]
_0803AB92:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803ABA0: .4byte 0x063F0902
_0803ABA4: .4byte 0x02023D12
_0803ABA8: .4byte 0x020243E8
_0803ABAC: .4byte 0x03005A70
_0803ABB0: .4byte 0x02022C90
_0803ABB4: .4byte 0x02023D08
_0803ABB8: .4byte 0x02023D10
_0803ABBC: .4byte 0x03005A64
_0803ABC0: .4byte 0x0803ABC5
	thumb_func_end BattleIntroDrawTrainersOrMonsSprites

	thumb_func_start BattleIntroDrawPartySummaryScreens
BattleIntroDrawPartySummaryScreens: @ 0x0803ABC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x30
	ldr r0, _0803AC1C
	ldr r0, [r0]
	cmp r0, #0
	beq _0803ABD6
	b _0803AD50
_0803ABD6:
	ldr r0, _0803AC20
	ldr r0, [r0]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0803ABE4
	b _0803ACF0
_0803ABE4:
	movs r7, #0
	add r0, sp, #4
	mov r8, r0
	mov r6, r8
	mov r5, sp
_0803ABEE:
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _0803AC24
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _0803AC14
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	bne _0803AC2C
_0803AC14:
	ldr r0, _0803AC28
	strh r0, [r5]
	movs r0, #0
	b _0803AC3E
	.align 2, 0
_0803AC1C: .4byte 0x02023D0C
_0803AC20: .4byte 0x02022C90
_0803AC24: .4byte 0x020243E8
_0803AC28: .4byte 0x0000FFFF
_0803AC2C:
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
_0803AC3E:
	str r0, [r6]
	adds r6, #8
	adds r5, #8
	adds r7, #1
	cmp r7, #5
	ble _0803ABEE
	movs r0, #1
	bl GetBattlerAtPosition
	ldr r4, _0803AC98
	strb r0, [r4]
	movs r0, #0
	mov r1, sp
	movs r2, #0x80
	bl BtlController_EmitDrawPartyStatusSummary
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	movs r7, #0
	mov r6, r8
	mov r5, sp
_0803AC6A:
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _0803AC9C
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _0803AC90
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	bne _0803ACA4
_0803AC90:
	ldr r0, _0803ACA0
	strh r0, [r5]
	movs r0, #0
	b _0803ACB6
	.align 2, 0
_0803AC98: .4byte 0x02023D08
_0803AC9C: .4byte 0x02024190
_0803ACA0: .4byte 0x0000FFFF
_0803ACA4:
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
_0803ACB6:
	str r0, [r6]
	adds r6, #8
	adds r5, #8
	adds r7, #1
	cmp r7, #5
	ble _0803AC6A
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r4, _0803ACE4
	strb r0, [r4]
	movs r0, #0
	mov r1, sp
	movs r2, #0x80
	bl BtlController_EmitDrawPartyStatusSummary
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _0803ACE8
	ldr r0, _0803ACEC
	b _0803AD4E
	.align 2, 0
_0803ACE4: .4byte 0x02023D08
_0803ACE8: .4byte 0x03005A64
_0803ACEC: .4byte 0x0803AD65
_0803ACF0:
	movs r7, #0
	add r6, sp, #4
	mov r5, sp
_0803ACF6:
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _0803AD24
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _0803AD1C
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	bne _0803AD2C
_0803AD1C:
	ldr r0, _0803AD28
	strh r0, [r5]
	movs r0, #0
	b _0803AD3E
	.align 2, 0
_0803AD24: .4byte 0x02024190
_0803AD28: .4byte 0x0000FFFF
_0803AD2C:
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
_0803AD3E:
	str r0, [r6]
	adds r6, #8
	adds r5, #8
	adds r7, #1
	cmp r7, #5
	ble _0803ACF6
	ldr r1, _0803AD5C
	ldr r0, _0803AD60
_0803AD4E:
	str r0, [r1]
_0803AD50:
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AD5C: .4byte 0x03005A64
_0803AD60: .4byte 0x0803AD9D
	thumb_func_end BattleIntroDrawPartySummaryScreens

	thumb_func_start BattleIntroPrintTrainerWantsToBattle
BattleIntroPrintTrainerWantsToBattle: @ 0x0803AD64
	push {lr}
	ldr r0, _0803AD8C
	ldr r0, [r0]
	cmp r0, #0
	bne _0803AD86
	movs r0, #1
	bl GetBattlerAtPosition
	ldr r1, _0803AD90
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, #0
	bl PrepareStringBattle
	ldr r1, _0803AD94
	ldr r0, _0803AD98
	str r0, [r1]
_0803AD86:
	pop {r0}
	bx r0
	.align 2, 0
_0803AD8C: .4byte 0x02023D0C
_0803AD90: .4byte 0x02023D08
_0803AD94: .4byte 0x03005A64
_0803AD98: .4byte 0x0803ADC5
	thumb_func_end BattleIntroPrintTrainerWantsToBattle

	thumb_func_start BattleIntroPrintWildMonAttacked
BattleIntroPrintWildMonAttacked: @ 0x0803AD9C
	push {lr}
	ldr r0, _0803ADB8
	ldr r0, [r0]
	cmp r0, #0
	bne _0803ADB4
	ldr r1, _0803ADBC
	ldr r0, _0803ADC0
	str r0, [r1]
	movs r0, #0
	movs r1, #0
	bl PrepareStringBattle
_0803ADB4:
	pop {r0}
	bx r0
	.align 2, 0
_0803ADB8: .4byte 0x02023D0C
_0803ADBC: .4byte 0x03005A64
_0803ADC0: .4byte 0x0803B011
	thumb_func_end BattleIntroPrintWildMonAttacked

	thumb_func_start BattleIntroPrintOpponentSendsOut
BattleIntroPrintOpponentSendsOut: @ 0x0803ADC4
	push {lr}
	ldr r0, _0803ADF4
	ldr r0, [r0]
	cmp r0, #0
	bne _0803AE14
	ldr r0, _0803ADF8
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0803ADFC
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r2
	cmp r0, #0
	beq _0803ADFC
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _0803ADFE
	.align 2, 0
_0803ADF4: .4byte 0x02023D0C
_0803ADF8: .4byte 0x02022C90
_0803ADFC:
	movs r0, #1
_0803ADFE:
	bl GetBattlerAtPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	bl PrepareStringBattle
	ldr r1, _0803AE18
	ldr r0, _0803AE1C
	str r0, [r1]
_0803AE14:
	pop {r0}
	bx r0
	.align 2, 0
_0803AE18: .4byte 0x03005A64
_0803AE1C: .4byte 0x0803AEA1
	thumb_func_end BattleIntroPrintOpponentSendsOut

	thumb_func_start BattleIntroOpponent2SendsOutMonAnimation
BattleIntroOpponent2SendsOutMonAnimation: @ 0x0803AE20
	push {r4, r5, lr}
	ldr r0, _0803AE8C
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0803AE40
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0803AE40
	movs r5, #2
	cmp r1, #0
	bge _0803AE42
_0803AE40:
	movs r5, #3
_0803AE42:
	ldr r1, _0803AE90
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0803AE94
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803AE7E
	adds r4, r1, #0
_0803AE52:
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	bne _0803AE6C
	movs r0, #0
	bl BtlController_EmitIntroTrainerBallThrow
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803AE6C:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _0803AE94
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803AE52
_0803AE7E:
	ldr r1, _0803AE98
	ldr r0, _0803AE9C
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803AE8C: .4byte 0x02022C90
_0803AE90: .4byte 0x02023D08
_0803AE94: .4byte 0x02023D10
_0803AE98: .4byte 0x03005A64
_0803AE9C: .4byte 0x0803AF59
	thumb_func_end BattleIntroOpponent2SendsOutMonAnimation

	thumb_func_start BattleIntroOpponent1SendsOutMonAnimation
BattleIntroOpponent1SendsOutMonAnimation: @ 0x0803AEA0
	push {r4, r5, r6, lr}
	ldr r0, _0803AEC8
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0803AEDC
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r2
	cmp r0, #0
	beq _0803AEDC
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r5, r0, #0x1f
	b _0803AEDE
	.align 2, 0
_0803AEC8: .4byte 0x02022C90
_0803AECC:
	ldr r1, _0803AED4
	ldr r0, _0803AED8
	b _0803AF34
	.align 2, 0
_0803AED4: .4byte 0x03005A64
_0803AED8: .4byte 0x0803AE21
_0803AEDC:
	movs r5, #1
_0803AEDE:
	ldr r0, _0803AF3C
	ldr r2, [r0]
	cmp r2, #0
	bne _0803AF36
	ldr r0, _0803AF40
	strb r2, [r0]
	ldr r1, _0803AF44
	adds r4, r0, #0
	ldrb r1, [r1]
	cmp r2, r1
	bhs _0803AF30
	adds r6, r4, #0
_0803AEF6:
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	bne _0803AF1C
	movs r0, #0
	bl BtlController_EmitIntroTrainerBallThrow
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r0, _0803AF48
	ldr r0, [r0]
	ldr r1, _0803AF4C
	ands r0, r1
	cmp r0, #0
	bne _0803AECC
_0803AF1C:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r1, _0803AF44
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0803AF40
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803AEF6
_0803AF30:
	ldr r1, _0803AF50
	ldr r0, _0803AF54
_0803AF34:
	str r0, [r1]
_0803AF36:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803AF3C: .4byte 0x02023D0C
_0803AF40: .4byte 0x02023D08
_0803AF44: .4byte 0x02023D10
_0803AF48: .4byte 0x02022C90
_0803AF4C: .4byte 0x00008040
_0803AF50: .4byte 0x03005A64
_0803AF54: .4byte 0x0803AF59
	thumb_func_end BattleIntroOpponent1SendsOutMonAnimation

	thumb_func_start BattleIntroRecordMonsToDex
BattleIntroRecordMonsToDex: @ 0x0803AF58
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803AFD0
	ldr r1, [r0]
	cmp r1, #0
	bne _0803AFC8
	ldr r2, _0803AFD4
	strb r1, [r2]
	ldr r0, _0803AFD8
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0803AFC2
	adds r4, r2, #0
	ldr r6, _0803AFDC
	movs r5, #0x58
	adds r7, r6, #0
	adds r7, #0x48
_0803AF78:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0803AFB0
	ldr r0, _0803AFE0
	ldr r0, [r0]
	ldr r1, _0803AFE4
	ands r0, r1
	cmp r0, #0
	bne _0803AFB0
	ldrb r0, [r4]
	muls r0, r5, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r4]
	muls r1, r5, r1
	adds r1, r1, r7
	ldr r2, [r1]
	movs r1, #2
	bl HandleSetPokedexFlag
_0803AFB0:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _0803AFD8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803AF78
_0803AFC2:
	ldr r1, _0803AFE8
	ldr r0, _0803AFEC
	str r0, [r1]
_0803AFC8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AFD0: .4byte 0x02023D0C
_0803AFD4: .4byte 0x02023D08
_0803AFD8: .4byte 0x02023D10
_0803AFDC: .4byte 0x02023D28
_0803AFE0: .4byte 0x02022C90
_0803AFE4: .4byte 0x063F0902
_0803AFE8: .4byte 0x03005A64
_0803AFEC: .4byte 0x0803B011
	thumb_func_end BattleIntroRecordMonsToDex

	thumb_func_start sub_0803AFF0
sub_0803AFF0: @ 0x0803AFF0
	push {lr}
	ldr r0, _0803B004
	ldr r0, [r0]
	cmp r0, #0
	bne _0803B000
	ldr r1, _0803B008
	ldr r0, _0803B00C
	str r0, [r1]
_0803B000:
	pop {r0}
	bx r0
	.align 2, 0
_0803B004: .4byte 0x02023D0C
_0803B008: .4byte 0x03005A64
_0803B00C: .4byte 0x0803B011
	thumb_func_end sub_0803AFF0

	thumb_func_start BattleIntroPrintPlayerSendsOut
BattleIntroPrintPlayerSendsOut: @ 0x0803B010
	push {lr}
	ldr r0, _0803B060
	ldr r0, [r0]
	cmp r0, #0
	bne _0803B05C
	ldr r1, _0803B064
	ldr r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0803B038
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r2
	cmp r0, #0
	beq _0803B038
	movs r3, #1
	cmp r2, #0
	bge _0803B03A
_0803B038:
	movs r3, #0
_0803B03A:
	ldr r0, [r1]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803B056
	adds r0, r3, #0
	bl GetBattlerAtPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	bl PrepareStringBattle
_0803B056:
	ldr r1, _0803B068
	ldr r0, _0803B06C
	str r0, [r1]
_0803B05C:
	pop {r0}
	bx r0
	.align 2, 0
_0803B060: .4byte 0x02023D0C
_0803B064: .4byte 0x02022C90
_0803B068: .4byte 0x03005A64
_0803B06C: .4byte 0x0803B10D
	thumb_func_end BattleIntroPrintPlayerSendsOut

	thumb_func_start BattleIntroPlayer2SendsOutMonAnimation
BattleIntroPlayer2SendsOutMonAnimation: @ 0x0803B070
	push {r4, r5, lr}
	ldr r0, _0803B0F4
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0803B090
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0803B090
	movs r5, #3
	cmp r1, #0
	bge _0803B092
_0803B090:
	movs r5, #2
_0803B092:
	ldr r1, _0803B0F8
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0803B0FC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B0CE
	adds r4, r1, #0
_0803B0A2:
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	bne _0803B0BC
	movs r0, #0
	bl BtlController_EmitIntroTrainerBallThrow
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803B0BC:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _0803B0FC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803B0A2
_0803B0CE:
	ldr r2, _0803B100
	ldr r0, [r2]
	adds r0, #0x4c
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xd9
	strb r1, [r0]
	ldr r0, [r2]
	movs r2, #0xd1
	lsls r2, r2, #1
	adds r0, r0, r2
	strb r1, [r0]
	ldr r1, _0803B104
	ldr r0, _0803B108
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803B0F4: .4byte 0x02022C90
_0803B0F8: .4byte 0x02023D08
_0803B0FC: .4byte 0x02023D10
_0803B100: .4byte 0x02024140
_0803B104: .4byte 0x03005A64
_0803B108: .4byte 0x0803B26D
	thumb_func_end BattleIntroPlayer2SendsOutMonAnimation

	thumb_func_start BattleIntroPlayer1SendsOutMonAnimation
BattleIntroPlayer1SendsOutMonAnimation: @ 0x0803B10C
	push {r4, r5, r6, lr}
	ldr r0, _0803B130
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0803B144
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0803B144
	movs r6, #1
	cmp r1, #0
	bge _0803B146
	b _0803B144
	.align 2, 0
_0803B130: .4byte 0x02022C90
_0803B134:
	ldr r1, _0803B13C
	ldr r0, _0803B140
	b _0803B1B6
	.align 2, 0
_0803B13C: .4byte 0x03005A64
_0803B140: .4byte 0x0803B071
_0803B144:
	movs r6, #0
_0803B146:
	ldr r0, _0803B1C0
	ldr r2, [r0]
	cmp r2, #0
	bne _0803B1B8
	ldr r0, _0803B1C4
	strb r2, [r0]
	ldr r1, _0803B1C8
	adds r4, r0, #0
	ldrb r1, [r1]
	cmp r2, r1
	bhs _0803B198
	adds r5, r4, #0
_0803B15E:
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	bne _0803B184
	movs r0, #0
	bl BtlController_EmitIntroTrainerBallThrow
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r0, _0803B1CC
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0803B134
_0803B184:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _0803B1C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0803B1C4
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803B15E
_0803B198:
	ldr r2, _0803B1D0
	ldr r0, [r2]
	adds r0, #0x4c
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xd9
	strb r1, [r0]
	ldr r0, [r2]
	movs r2, #0xd1
	lsls r2, r2, #1
	adds r0, r0, r2
	strb r1, [r0]
	ldr r1, _0803B1D4
	ldr r0, _0803B1D8
_0803B1B6:
	str r0, [r1]
_0803B1B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803B1C0: .4byte 0x02023D0C
_0803B1C4: .4byte 0x02023D08
_0803B1C8: .4byte 0x02023D10
_0803B1CC: .4byte 0x02022C90
_0803B1D0: .4byte 0x02024140
_0803B1D4: .4byte 0x03005A64
_0803B1D8: .4byte 0x0803B26D
	thumb_func_end BattleIntroPlayer1SendsOutMonAnimation

	thumb_func_start sub_0803B1DC
sub_0803B1DC: @ 0x0803B1DC
	push {r4, r5, lr}
	ldr r0, _0803B250
	ldr r1, [r0]
	cmp r1, #0
	bne _0803B24A
	ldr r2, _0803B254
	strb r1, [r2]
	ldr r0, _0803B258
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0803B22A
	adds r4, r2, #0
	ldr r5, _0803B25C
_0803B1F6:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B218
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl BtlController_EmitSwitchInAnim
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803B218:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _0803B258
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803B1F6
_0803B22A:
	ldr r2, _0803B260
	ldr r0, [r2]
	adds r0, #0x4c
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xd9
	strb r1, [r0]
	ldr r0, [r2]
	movs r2, #0xd1
	lsls r2, r2, #1
	adds r0, r0, r2
	strb r1, [r0]
	ldr r1, _0803B264
	ldr r0, _0803B268
	str r0, [r1]
_0803B24A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803B250: .4byte 0x02023D0C
_0803B254: .4byte 0x02023D08
_0803B258: .4byte 0x02023D10
_0803B25C: .4byte 0x02023D12
_0803B260: .4byte 0x02024140
_0803B264: .4byte 0x03005A64
_0803B268: .4byte 0x0803B26D
	thumb_func_end sub_0803B1DC

	thumb_func_start TryDoEventsBeforeFirstTurn
TryDoEventsBeforeFirstTurn: @ 0x0803B26C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	mov sb, r0
	ldr r0, _0803B2B0
	ldr r0, [r0]
	cmp r0, #0
	beq _0803B286
	b _0803B4F6
_0803B286:
	ldr r0, _0803B2B4
	ldr r0, [r0]
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B306
	movs r5, #0
	ldr r1, _0803B2B8
	mov sl, r1
	ldrb r3, [r1]
	cmp r5, r3
	bge _0803B2AC
	ldr r2, _0803B2BC
_0803B2A0:
	adds r0, r5, r2
	strb r5, [r0]
	adds r5, #1
	ldrb r0, [r1]
	cmp r5, r0
	blt _0803B2A0
_0803B2AC:
	movs r5, #0
	b _0803B2FC
	.align 2, 0
_0803B2B0: .4byte 0x02023D0C
_0803B2B4: .4byte 0x02024140
_0803B2B8: .4byte 0x02023D10
_0803B2BC: .4byte 0x02023D22
_0803B2C0:
	adds r4, r5, #1
	mov r8, r4
	ldrb r1, [r1]
	cmp r8, r1
	bge _0803B2FA
	ldr r6, _0803B334
	ldr r1, _0803B338
	mov sl, r1
	lsls r7, r5, #0x18
_0803B2D2:
	adds r0, r5, r6
	ldrb r0, [r0]
	adds r1, r4, r6
	ldrb r1, [r1]
	movs r2, #1
	bl GetWhoStrikesFirst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B2F0
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r7, #0x18
	bl SwapTurnOrder
_0803B2F0:
	adds r4, #1
	ldr r0, _0803B338
	ldrb r0, [r0]
	cmp r4, r0
	blt _0803B2D2
_0803B2FA:
	mov r5, r8
_0803B2FC:
	mov r1, sl
	ldrb r0, [r1]
	subs r0, #1
	cmp r5, r0
	blt _0803B2C0
_0803B306:
	ldr r5, _0803B33C
	ldr r0, [r5]
	movs r4, #0xd1
	lsls r4, r4, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B340
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xff
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B340
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	b _0803B4F6
	.align 2, 0
_0803B334: .4byte 0x02023D22
_0803B338: .4byte 0x02023D10
_0803B33C: .4byte 0x02024140
_0803B340:
	ldr r2, _0803B508
	ldr r0, [r2]
	adds r0, #0x4c
	ldr r1, _0803B50C
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0803B39A
	ldr r5, _0803B510
	adds r4, r2, #0
_0803B354:
	ldr r0, [r4]
	adds r0, #0x4c
	ldrb r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B37A
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0803B37A:
	ldr r1, [r4]
	adds r1, #0x4c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r3, sb
	cmp r3, #0
	beq _0803B38C
	b _0803B4F6
_0803B38C:
	ldr r0, [r4]
	adds r0, #0x4c
	ldr r1, _0803B50C
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803B354
_0803B39A:
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B3B4
	b _0803B4F6
_0803B3B4:
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B3CA
	b _0803B4F6
_0803B3CA:
	ldr r2, _0803B508
	ldr r0, [r2]
	adds r0, #0xd9
	ldr r1, _0803B50C
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0803B41E
	ldr r5, _0803B510
	adds r4, r2, #0
_0803B3DE:
	ldr r0, [r4]
	adds r0, #0xd9
	ldrb r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl ItemBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B400
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0803B400:
	ldr r1, [r4]
	adds r1, #0xd9
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r0, sb
	cmp r0, #0
	bne _0803B4F6
	ldr r0, [r4]
	adds r0, #0xd9
	ldr r1, _0803B50C
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803B3DE
_0803B41E:
	movs r5, #0
	ldr r1, _0803B508
	mov r8, r1
	movs r7, #6
	ldr r6, _0803B514
	ldr r2, _0803B518
	movs r4, #0xff
	movs r3, #0
_0803B42E:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	adds r0, #0x5c
	strb r7, [r0]
	adds r1, r5, r6
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	strh r3, [r2]
	adds r2, #2
	adds r5, #1
	cmp r5, #3
	ble _0803B42E
	movs r0, #0
	bl TurnValuesCleanUp
	bl SpecialStatusesClear
	ldr r0, _0803B508
	ldr r0, [r0]
	adds r0, #0x91
	ldr r1, _0803B51C
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r0, _0803B520
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0803B524
	ldr r0, _0803B528
	str r0, [r1]
	bl ResetSentPokesToOpponentValue
	ldr r1, _0803B52C
	movs r2, #0
	adds r0, r1, #7
_0803B478:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0803B478
	movs r5, #0
	ldr r3, _0803B50C
	ldr r2, _0803B508
	ldr r6, _0803B530
	ldr r7, _0803B534
	ldrb r0, [r3]
	cmp r5, r0
	bge _0803B4AA
	ldr r0, _0803B538
	movs r4, #9
	rsbs r4, r4, #0
	adds r1, r0, #0
	adds r1, #0x50
_0803B49A:
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
	adds r1, #0x58
	adds r5, #1
	ldrb r0, [r3]
	cmp r5, r0
	blt _0803B49A
_0803B4AA:
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #1]
	ldr r0, [r2]
	movs r3, #0xd0
	lsls r3, r3, #1
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, #1
	adds r0, r0, r3
	strb r1, [r0]
	movs r1, #0
	strb r1, [r6, #0x14]
	ldr r0, [r2]
	adds r0, #0x4d
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #3]
	strb r1, [r7]
	bl Random
	ldr r1, _0803B53C
	strh r0, [r1]
	ldr r0, _0803B540
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0803B4F6
	bl StopCryAndClearCrySongs
	ldr r0, _0803B544
	bl BattleScriptExecute
_0803B4F6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B508: .4byte 0x02024140
_0803B50C: .4byte 0x02023D10
_0803B510: .4byte 0x02023D22
_0803B514: .4byte 0x02023EC0
_0803B518: .4byte 0x02023F18
_0803B51C: .4byte 0x02023EB4
_0803B520: .4byte 0x085AB3BD
_0803B524: .4byte 0x03005A64
_0803B528: .4byte 0x0803BAB9
_0803B52C: .4byte 0x02023FD6
_0803B530: .4byte 0x02024118
_0803B534: .4byte 0x02023F20
_0803B538: .4byte 0x02023D28
_0803B53C: .4byte 0x02023FD4
_0803B540: .4byte 0x02022C90
_0803B544: .4byte 0x08289E46
	thumb_func_end TryDoEventsBeforeFirstTurn

	thumb_func_start HandleEndTurn_ContinueBattle
HandleEndTurn_ContinueBattle: @ 0x0803B548
	push {r4, r5, r6, lr}
	ldr r0, _0803B5E0
	ldr r0, [r0]
	cmp r0, #0
	bne _0803B5D8
	ldr r1, _0803B5E4
	ldr r0, _0803B5E8
	str r0, [r1]
	ldr r3, _0803B5EC
	ldr r1, _0803B5F0
	movs r2, #0
	adds r0, r1, #7
_0803B560:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0803B560
	movs r4, #0
	ldrb r3, [r3]
	cmp r4, r3
	bge _0803B5B2
	ldr r5, _0803B5F4
	adds r6, r5, #0
	adds r6, #0x4c
_0803B576:
	movs r0, #0x58
	adds r2, r4, #0
	muls r2, r0, r2
	adds r1, r5, #0
	adds r1, #0x50
	adds r1, r2, r1
	ldr r3, [r1]
	subs r0, #0x61
	ands r3, r0
	str r3, [r1]
	adds r2, r2, r6
	ldr r0, [r2]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0803B5A8
	movs r0, #0x80
	lsls r0, r0, #5
	ands r3, r0
	cmp r3, #0
	beq _0803B5A8
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl CancelMultiTurnMoves
_0803B5A8:
	adds r4, #1
	ldr r0, _0803B5EC
	ldrb r0, [r0]
	cmp r4, r0
	blt _0803B576
_0803B5B2:
	ldr r2, _0803B5F8
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #1]
	ldr r0, [r2]
	movs r3, #0xd0
	lsls r3, r3, #1
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, #1
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #3]
	ldr r0, _0803B5FC
	strb r1, [r0]
_0803B5D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803B5E0: .4byte 0x02023D0C
_0803B5E4: .4byte 0x03005A64
_0803B5E8: .4byte 0x0803B601
_0803B5EC: .4byte 0x02023D10
_0803B5F0: .4byte 0x02023FD6
_0803B5F4: .4byte 0x02023D28
_0803B5F8: .4byte 0x02024140
_0803B5FC: .4byte 0x02023F20
	thumb_func_end HandleEndTurn_ContinueBattle

	thumb_func_start BattleTurnPassed
BattleTurnPassed: @ 0x0803B600
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #1
	bl TurnValuesCleanUp
	ldr r0, _0803B6A4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B62E
	bl DoFieldEndTurnEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B622
	b _0803B7BC
_0803B622:
	bl BattleScriptPop
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B62E
	b _0803B7BC
_0803B62E:
	bl HandleFaintedMonActions
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0803B63C
	b _0803B7BC
_0803B63C:
	ldr r0, _0803B6A8
	ldr r0, [r0]
	adds r0, #0x4d
	strb r1, [r0]
	bl HandleWishPerishSongOnTurnEnd
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0803B652
	b _0803B7BC
_0803B652:
	movs r0, #0
	bl TurnValuesCleanUp
	ldr r2, _0803B6AC
	ldr r0, [r2]
	ldr r1, _0803B6B0
	ands r0, r1
	ldr r1, _0803B6B4
	ands r0, r1
	ldr r1, _0803B6B8
	ands r0, r1
	ldr r1, _0803B6BC
	ands r0, r1
	str r0, [r2]
	ldr r0, _0803B6C0
	strb r4, [r0, #0x18]
	strb r4, [r0, #0x19]
	strb r4, [r0, #0x14]
	ldr r0, _0803B6C4
	str r4, [r0]
	ldr r0, _0803B6C8
	strb r4, [r0]
	ldr r1, _0803B6CC
	movs r2, #0
	adds r0, r1, #4
_0803B684:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0803B684
	ldr r0, _0803B6A4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B6DC
	ldr r1, _0803B6D0
	movs r0, #0xc
	strb r0, [r1]
	ldr r1, _0803B6D4
	ldr r0, _0803B6D8
	str r0, [r1]
	b _0803B7BC
	.align 2, 0
_0803B6A4: .4byte 0x02023FDE
_0803B6A8: .4byte 0x02024140
_0803B6AC: .4byte 0x02023F24
_0803B6B0: .4byte 0xFFFFFDFF
_0803B6B4: .4byte 0xFFF7FFFF
_0803B6B8: .4byte 0xFFBFFFFF
_0803B6BC: .4byte 0xFFEFFFFF
_0803B6C0: .4byte 0x02024118
_0803B6C4: .4byte 0x02023E94
_0803B6C8: .4byte 0x02023F20
_0803B6CC: .4byte 0x02023FD6
_0803B6D0: .4byte 0x02023D27
_0803B6D4: .4byte 0x03005A64
_0803B6D8: .4byte 0x0803D45D
_0803B6DC:
	ldr r1, _0803B770
	ldrb r0, [r1, #0x13]
	ldr r2, _0803B774
	mov r8, r2
	cmp r0, #0xfe
	bhi _0803B6F6
	adds r0, #1
	strb r0, [r1, #0x13]
	ldr r1, [r2]
	adds r1, #0xda
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0803B6F6:
	movs r2, #0
	ldr r4, _0803B778
	ldr r0, _0803B77C
	mov ip, r0
	ldr r1, _0803B780
	mov sb, r1
	ldrb r0, [r4]
	cmp r2, r0
	bge _0803B724
	ldr r7, _0803B784
	movs r6, #0xff
	movs r5, #0
	ldr r3, _0803B788
_0803B710:
	adds r1, r2, r7
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	strh r5, [r3]
	adds r3, #2
	adds r2, #1
	ldrb r1, [r4]
	cmp r2, r1
	blt _0803B710
_0803B724:
	movs r2, #0
	ldr r3, _0803B774
	movs r1, #6
_0803B72A:
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, #0x5c
	strb r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _0803B72A
	mov r2, r8
	ldr r0, [r2]
	adds r0, #0x91
	mov r2, ip
	ldrb r1, [r2]
	strb r1, [r0]
	mov r0, sb
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0803B78C
	ldr r0, _0803B790
	str r0, [r1]
	bl Random
	ldr r1, _0803B794
	strh r0, [r1]
	ldr r0, _0803B798
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0803B7A0
	ldr r0, _0803B79C
	bl BattleScriptExecute
	b _0803B7BC
	.align 2, 0
_0803B770: .4byte 0x03005A70
_0803B774: .4byte 0x02024140
_0803B778: .4byte 0x02023D10
_0803B77C: .4byte 0x02023EB4
_0803B780: .4byte 0x085AB3BD
_0803B784: .4byte 0x02023EC0
_0803B788: .4byte 0x02023F18
_0803B78C: .4byte 0x03005A64
_0803B790: .4byte 0x0803BAB9
_0803B794: .4byte 0x02023FD4
_0803B798: .4byte 0x02022C90
_0803B79C: .4byte 0x08289E09
_0803B7A0:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r1, r0
	cmp r1, #0
	beq _0803B7BC
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xda
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B7BC
	ldr r0, _0803B7C8
	bl BattleScriptExecute
_0803B7BC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B7C8: .4byte 0x08289E46
	thumb_func_end BattleTurnPassed

	thumb_func_start IsRunningFromBattleImpossible
IsRunningFromBattleImpossible: @ 0x0803B7CC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _0803B7F0
	ldr r0, _0803B7F4
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, r0, r1
	ldrh r0, [r1, #0x2e]
	cmp r0, #0xaf
	bne _0803B7FC
	ldr r1, _0803B7F8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #7]
	b _0803B806
	.align 2, 0
_0803B7F0: .4byte 0x02023D28
_0803B7F4: .4byte 0x02023D08
_0803B7F8: .4byte 0x020240A8
_0803B7FC:
	ldrh r0, [r1, #0x2e]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0803B806:
	ldr r1, _0803B91C
	ldr r3, _0803B920
	ldrb r0, [r3]
	strb r0, [r1]
	cmp r2, #0x25
	bne _0803B814
	b _0803B990
_0803B814:
	ldr r0, _0803B924
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B822
	b _0803B990
_0803B822:
	ldr r1, _0803B928
	ldrb r2, [r3]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x32
	bne _0803B836
	b _0803B990
_0803B836:
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	ldr r0, _0803B92C
	ldrb r0, [r0]
	cmp r5, r0
	bge _0803B8CA
	movs r7, #0
_0803B84C:
	lsrs r4, r7, #0x18
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	beq _0803B870
	ldr r1, _0803B928
	movs r0, #0x58
	muls r0, r5, r0
	adds r0, r0, r1
	adds r2, r0, #0
	adds r2, #0x20
	ldrb r0, [r2]
	cmp r0, #0x17
	bne _0803B870
	b _0803B998
_0803B870:
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	beq _0803B8BA
	ldr r3, _0803B928
	ldr r0, _0803B920
	ldrb r0, [r0]
	movs r2, #0x58
	muls r0, r2, r0
	adds r1, r0, r3
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x1a
	beq _0803B8BA
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803B8BA
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803B8BA
	adds r0, r5, #0
	muls r0, r2, r0
	adds r0, r0, r3
	adds r2, r0, #0
	adds r2, #0x20
	ldrb r0, [r2]
	cmp r0, #0x47
	bne _0803B8BA
	b _0803B9B4
_0803B8BA:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r7, r7, r0
	adds r5, #1
	ldr r0, _0803B92C
	ldrb r0, [r0]
	cmp r5, r0
	blt _0803B84C
_0803B8CA:
	ldr r4, _0803B920
	ldrb r1, [r4]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xf
	movs r2, #0x2a
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0803B93C
	ldr r6, _0803B928
	ldrb r0, [r4]
	movs r3, #0x58
	muls r0, r3, r0
	adds r1, r0, r6
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #8
	beq _0803B902
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #8
	bne _0803B93C
_0803B902:
	ldr r0, _0803B930
	subs r1, r5, #1
	strb r1, [r0, #0x17]
	ldr r2, _0803B934
	adds r0, r1, #0
	muls r0, r3, r0
	adds r0, r0, r6
	adds r0, #0x20
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r1, _0803B938
	movs r0, #2
	b _0803B9D4
	.align 2, 0
_0803B91C: .4byte 0x02023EB3
_0803B920: .4byte 0x02023D08
_0803B924: .4byte 0x02022C90
_0803B928: .4byte 0x02023D28
_0803B92C: .4byte 0x02023D10
_0803B930: .4byte 0x02024118
_0803B934: .4byte 0x02023EAE
_0803B938: .4byte 0x02023FD6
_0803B93C:
	ldr r1, _0803B970
	ldr r0, _0803B974
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0803B978
	ands r0, r1
	cmp r0, #0
	bne _0803B966
	ldr r1, _0803B97C
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0803B984
_0803B966:
	ldr r1, _0803B980
	movs r0, #0
	strb r0, [r1, #5]
	movs r0, #1
	b _0803B9D6
	.align 2, 0
_0803B970: .4byte 0x02023D28
_0803B974: .4byte 0x02023D08
_0803B978: .4byte 0x0400E000
_0803B97C: .4byte 0x02023F50
_0803B980: .4byte 0x02023FD6
_0803B984:
	ldr r0, _0803B994
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0803B9D0
_0803B990:
	movs r0, #0
	b _0803B9D6
	.align 2, 0
_0803B994: .4byte 0x02022C90
_0803B998:
	ldr r0, _0803B9A8
	strb r5, [r0, #0x17]
	ldr r1, _0803B9AC
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, _0803B9B0
	movs r0, #2
	b _0803B9D4
	.align 2, 0
_0803B9A8: .4byte 0x02024118
_0803B9AC: .4byte 0x02023EAE
_0803B9B0: .4byte 0x02023FD6
_0803B9B4:
	ldr r0, _0803B9C4
	strb r5, [r0, #0x17]
	ldr r1, _0803B9C8
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, _0803B9CC
	movs r0, #2
	b _0803B9D4
	.align 2, 0
_0803B9C4: .4byte 0x02024118
_0803B9C8: .4byte 0x02023EAE
_0803B9CC: .4byte 0x02023FD6
_0803B9D0:
	ldr r1, _0803B9E0
	movs r0, #1
_0803B9D4:
	strb r0, [r1, #5]
_0803B9D6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B9E0: .4byte 0x02023FD6
	thumb_func_end IsRunningFromBattleImpossible

	thumb_func_start sub_0803B9E4
sub_0803B9E4: @ 0x0803B9E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r3, #0
	ldr r0, _0803BA80
	mov r8, r0
	ldr r1, _0803BA84
	mov ip, r1
	ldr r7, _0803BA88
	lsls r0, r5, #1
	adds r4, r0, r5
	adds r6, r0, #0
_0803BA00:
	mov r0, ip
	adds r2, r3, r0
	ldr r1, [r7]
	adds r0, r4, r3
	adds r0, r0, r1
	adds r0, #0x60
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	cmp r3, #2
	ble _0803BA00
	mov r1, r8
	adds r0, r6, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r7, _0803BA88
	ldr r0, [r7]
	adds r0, r5, r0
	adds r0, #0x5c
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_081B8C50
	ldr r0, _0803BA8C
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803BA90
	movs r3, #0
	adds r4, r7, #0
	adds r6, r6, r5
	movs r0, #2
	adds r1, r5, #0
	eors r1, r0
	ldr r7, _0803BA84
	lsls r0, r1, #1
	adds r5, r0, r1
_0803BA5E:
	ldr r0, [r4]
	adds r1, r6, r3
	adds r1, r1, r0
	adds r1, #0x60
	adds r2, r3, r7
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r5, r3
	adds r0, r0, r1
	adds r0, #0x60
	ldrb r1, [r2]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #2
	ble _0803BA5E
	b _0803BAAA
	.align 2, 0
_0803BA80: .4byte 0x02023D12
_0803BA84: .4byte 0x0203CBCC
_0803BA88: .4byte 0x02024140
_0803BA8C: .4byte 0x02022C90
_0803BA90:
	movs r3, #0
	adds r2, r6, r5
	ldr r4, _0803BAB4
_0803BA96:
	ldr r0, [r7]
	adds r1, r2, r3
	adds r1, r1, r0
	adds r1, #0x60
	adds r0, r3, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, #1
	cmp r3, #2
	ble _0803BA96
_0803BAAA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BAB4: .4byte 0x0203CBCC
	thumb_func_end sub_0803B9E4

	thumb_func_start HandleAction_TryFinish
HandleAction_TryFinish: @ 0x0803BAB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0803BAD4
	movs r1, #0
	strb r1, [r0, #4]
	ldr r0, _0803BAD8
	strb r1, [r0]
	ldr r0, _0803BADC
	bl _0803C956
	.align 2, 0
_0803BAD4: .4byte 0x02023FD6
_0803BAD8: .4byte 0x02023D08
_0803BADC: .4byte 0x02023D10
	thumb_func_end HandleAction_TryFinish

	thumb_func_start HandleTurnActionSelectionState
HandleTurnActionSelectionState: @ 0x0803BAE0
	ldr r4, _0803BB08
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0803BB0C
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	bls _0803BAFC
	bl _0803C948
_0803BAFC:
	lsls r0, r0, #2
	ldr r1, _0803BB10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803BB08: .4byte 0x02023D08
_0803BB0C: .4byte 0x02023FD6
_0803BB10: .4byte 0x0803BB14
_0803BB14: @ jump table
	.4byte _0803BB38 @ case 0
	.4byte _0803BB50 @ case 1
	.4byte _0803BC70 @ case 2
	.4byte _0803C41C @ case 3
	.4byte _0803C714 @ case 4
	.4byte _0803C7C8 @ case 5
	.4byte _0803C80C @ case 6
	.4byte _0803C838 @ case 7
	.4byte _0803C87C @ case 8
_0803BB38:
	bl RecordedBattle_CopyBattlerMoves
	ldr r1, _0803BB48
	ldr r0, _0803BB4C
	ldrb r0, [r0]
	adds r0, r0, r1
	bl _0803C864
	.align 2, 0
_0803BB48: .4byte 0x02023FD6
_0803BB4C: .4byte 0x02023D08
_0803BB50:
	ldr r0, _0803BBE8
	ldrb r1, [r0]
	ldr r4, _0803BBEC
	ldr r0, [r4]
	adds r1, r1, r0
	adds r1, #0x5c
	movs r0, #6
	strb r0, [r1]
	ldr r0, _0803BBF0
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0803BBAC
	movs r1, #2
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0803BBAC
	eors r5, r1
	adds r0, r5, #0
	bl GetBattlerAtPosition
	ldr r1, [r4]
	adds r1, #0x91
	ldrb r1, [r1]
	ldr r2, _0803BBF4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0803BBAC
	ldr r4, _0803BBF8
	adds r0, r5, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #5
	beq _0803BBAC
	bl _0803C948
_0803BBAC:
	ldr r0, _0803BBEC
	ldr r0, [r0]
	adds r0, #0x91
	ldrb r3, [r0]
	ldr r1, _0803BBF4
	ldr r4, _0803BBE8
	ldrb r2, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ands r3, r0
	cmp r3, #0
	beq _0803BC14
	ldr r0, _0803BBFC
	adds r0, r2, r0
	movs r1, #0xd
	strb r1, [r0]
	ldr r0, _0803BBF0
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0803BC00
	ldr r0, _0803BBF8
	ldrb r1, [r4]
	adds r1, r1, r0
	movs r0, #5
	strb r0, [r1]
	bl _0803C948
	.align 2, 0
_0803BBE8: .4byte 0x02023D08
_0803BBEC: .4byte 0x02024140
_0803BBF0: .4byte 0x02022C90
_0803BBF4: .4byte 0x082FACB4
_0803BBF8: .4byte 0x02023FD6
_0803BBFC: .4byte 0x02023EC0
_0803BC00:
	ldr r0, _0803BC10
	ldrb r1, [r4]
	adds r1, r1, r0
	movs r0, #4
	strb r0, [r1]
	bl _0803C948
	.align 2, 0
_0803BC10: .4byte 0x02023FD6
_0803BC14:
	ldr r1, _0803BC44
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	bne _0803BC34
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r1, r0
	cmp r1, #0
	beq _0803BC50
_0803BC34:
	ldr r0, _0803BC48
	adds r0, r2, r0
	strb r3, [r0]
	ldr r1, _0803BC4C
	ldrb r0, [r4]
	bl _0803C8B6
	.align 2, 0
_0803BC44: .4byte 0x02023D28
_0803BC48: .4byte 0x02023EC0
_0803BC4C: .4byte 0x02023FD6
_0803BC50:
	ldr r0, _0803BC68
	ldrb r1, [r0]
	ldr r0, _0803BC6C
	ldrb r2, [r0, #1]
	ldrb r0, [r0, #2]
	lsls r0, r0, #8
	orrs r2, r0
	movs r0, #0
	bl BtlController_EmitChooseAction
	bl _0803C7AC
	.align 2, 0
_0803BC68: .4byte 0x02023EC0
_0803BC6C: .4byte 0x02023508
_0803BC70:
	ldr r3, _0803BCD4
	ldr r1, _0803BCD8
	ldr r6, _0803BCDC
	ldrb r5, [r6]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r2, [r0]
	lsls r1, r2, #4
	movs r0, #0xf0
	lsls r0, r0, #0x18
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, #8
	orrs r1, r0
	lsls r2, r2, #0xc
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0803BC9C
	bl _0803C948
_0803BC9C:
	ldr r4, _0803BCE0
	lsls r0, r5, #9
	adds r4, #1
	adds r0, r0, r4
	ldrb r1, [r0]
	adds r0, r5, #0
	bl RecordedBattle_SetBattlerAction
	ldr r1, _0803BCE4
	ldrb r0, [r6]
	adds r1, r0, r1
	lsls r0, r0, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xc
	bls _0803BCC8
	b _0803C308
_0803BCC8:
	lsls r0, r0, #2
	ldr r1, _0803BCE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803BCD4: .4byte 0x02023D0C
_0803BCD8: .4byte 0x082FACB4
_0803BCDC: .4byte 0x02023D08
_0803BCE0: .4byte 0x02023508
_0803BCE4: .4byte 0x02023EC0
_0803BCE8: .4byte 0x0803BCEC
_0803BCEC: @ jump table
	.4byte _0803BD20 @ case 0
	.4byte _0803BE74 @ case 1
	.4byte _0803BEAC @ case 2
	.4byte _0803C308 @ case 3
	.4byte _0803C308 @ case 4
	.4byte _0803C084 @ case 5
	.4byte _0803C0D0 @ case 6
	.4byte _0803C308 @ case 7
	.4byte _0803C308 @ case 8
	.4byte _0803C308 @ case 9
	.4byte _0803C308 @ case 10
	.4byte _0803C308 @ case 11
	.4byte _0803C0F8 @ case 12
_0803BD20:
	bl AreAllMovesUnusable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BD78
	ldr r0, _0803BD68
	ldr r3, _0803BD6C
	ldrb r1, [r3]
	adds r1, r1, r0
	movs r4, #0
	movs r0, #6
	strb r0, [r1]
	ldrb r1, [r3]
	ldr r2, _0803BD70
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0x54
	strb r4, [r1]
	ldrb r1, [r3]
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0x84
	movs r0, #4
	strb r0, [r1]
	ldrb r1, [r3]
	ldr r2, [r2]
	adds r2, r1, r2
	ldr r0, _0803BD74
	lsls r1, r1, #9
	adds r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2, #0xc]
	bl _0803C9B4
	.align 2, 0
_0803BD68: .4byte 0x02023FD6
_0803BD6C: .4byte 0x02023D08
_0803BD70: .4byte 0x02024140
_0803BD74: .4byte 0x02023508
_0803BD78:
	ldr r3, _0803BDB8
	ldr r5, _0803BDBC
	ldrb r4, [r5]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r2, [r0, #6]
	cmp r2, #0
	beq _0803BDCC
	ldr r1, _0803BDC0
	lsls r0, r4, #1
	adds r0, r0, r1
	strh r2, [r0]
	ldrb r2, [r5]
	ldr r0, _0803BDC4
	ldr r1, [r0]
	adds r1, r2, r1
	adds r1, #0x80
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0xc]
	strb r0, [r1]
	ldr r1, _0803BDC8
	ldrb r0, [r5]
	adds r0, r0, r1
	movs r1, #4
	strb r1, [r0]
	bl _0803C9B4
	.align 2, 0
_0803BDB8: .4byte 0x02023F60
_0803BDBC: .4byte 0x02023D08
_0803BDC0: .4byte 0x02023F18
_0803BDC4: .4byte 0x02024140
_0803BDC8: .4byte 0x02023FD6
_0803BDCC:
	add r2, sp, #4
	ldr r3, _0803BE6C
	movs r1, #0x58
	adds r0, r4, #0
	muls r0, r1, r0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2, #0x10]
	ldrb r0, [r5]
	muls r0, r1, r0
	adds r0, r0, r3
	adds r0, #0x21
	ldrb r0, [r0]
	strb r0, [r2, #0x12]
	ldrb r0, [r5]
	muls r0, r1, r0
	adds r0, r0, r3
	adds r0, #0x22
	ldrb r0, [r0]
	strb r0, [r2, #0x13]
	movs r4, #0
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x18]
	add r2, sp, #0x10
	mov sl, r2
	mov r8, r3
	adds r7, r5, #0
	movs r6, #0x58
	movs r0, #0xc
	add r0, r8
	mov sb, r0
	add r5, sp, #4
_0803BE0E:
	lsls r2, r4, #1
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r2, r0
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r5]
	ldr r1, [sp, #0x18]
	adds r3, r1, r4
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r4, r0
	mov r1, r8
	adds r1, #0x24
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r0, [r7]
	adds r1, r0, #0
	muls r1, r6, r1
	adds r2, r2, r1
	add r2, sb
	ldrh r0, [r2]
	add r1, r8
	adds r1, #0x3b
	ldrb r1, [r1]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	bl CalculatePPWithBonus
	mov r2, sl
	adds r1, r2, r4
	strb r0, [r1]
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _0803BE0E
	ldr r0, _0803BE70
	ldr r1, [r0]
	movs r0, #1
	ands r1, r0
	movs r0, #0
	movs r2, #0
	add r3, sp, #4
	bl BtlController_EmitChooseMove
	b _0803C072
	.align 2, 0
_0803BE6C: .4byte 0x02023D28
_0803BE70: .4byte 0x02022C90
_0803BE74:
	ldr r0, _0803BE98
	ldr r0, [r0]
	ldr r1, _0803BE9C
	ands r0, r1
	cmp r0, #0
	bne _0803BE82
	b _0803C0D0
_0803BE82:
	ldr r4, _0803BEA0
	ldrb r0, [r4]
	movs r1, #1
	bl RecordedBattle_ClearBattlerAction
	ldr r1, _0803BEA4
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803BEA8
	b _0803C3C8
	.align 2, 0
_0803BE98: .4byte 0x02022C90
_0803BE9C: .4byte 0x021F0902
_0803BEA0: .4byte 0x02023D08
_0803BEA4: .4byte 0x02023EC4
_0803BEA8: .4byte 0x08289E01
_0803BEAC:
	ldr r5, _0803BF14
	ldrb r0, [r5]
	ldr r3, _0803BF18
	ldr r1, [r3]
	adds r1, r0, r1
	adds r1, #0x58
	ldr r2, _0803BF1C
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r7, _0803BF20
	ldrb r2, [r5]
	movs r6, #0x58
	adds r0, r2, #0
	muls r0, r6, r0
	adds r1, r7, #0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0803BF24
	ands r1, r0
	cmp r1, #0
	bne _0803BEFC
	ldr r0, _0803BF28
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	bne _0803BEFC
	ldr r0, _0803BF2C
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	beq _0803BF30
_0803BEFC:
	ldr r0, _0803BF14
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #0x60
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #2
	movs r2, #6
	b _0803C044
	.align 2, 0
_0803BF14: .4byte 0x02023D08
_0803BF18: .4byte 0x02024140
_0803BF1C: .4byte 0x02023D12
_0803BF20: .4byte 0x02023D28
_0803BF24: .4byte 0x0400E000
_0803BF28: .4byte 0x02022C90
_0803BF2C: .4byte 0x02023F50
_0803BF30:
	str r1, [sp]
	movs r0, #0xc
	adds r1, r2, #0
	movs r2, #0x17
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0803BFB8
	ldrb r1, [r5]
	str r4, [sp]
	movs r0, #0xc
	movs r2, #0x47
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0803BF80
	ldrb r0, [r5]
	muls r0, r6, r0
	adds r1, r0, r7
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803BF80
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803BF80
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _0803BFB8
_0803BF80:
	ldr r5, _0803BFE4
	ldrb r1, [r5]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xf
	movs r2, #0x2a
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0803BFF4
	ldr r2, _0803BFE8
	ldrb r1, [r5]
	movs r0, #0x58
	muls r0, r1, r0
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #8
	beq _0803BFB8
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #8
	bne _0803BFF4
_0803BFB8:
	subs r1, r4, #1
	lsls r1, r1, #4
	movs r0, #4
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0803BFEC
	ldrb r3, [r0]
	ldr r4, _0803BFF0
	ldr r0, _0803BFE4
	ldrb r0, [r0]
	lsls r2, r0, #1
	adds r2, r2, r0
	adds r2, #0x60
	ldr r0, [r4]
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	movs r2, #6
	bl BtlController_EmitChoosePokemon
	b _0803C072
	.align 2, 0
_0803BFE4: .4byte 0x02023D08
_0803BFE8: .4byte 0x02023D28
_0803BFEC: .4byte 0x02023EAE
_0803BFF0: .4byte 0x02024140
_0803BFF4:
	ldr r0, _0803C010
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #2
	bne _0803C01C
	ldr r0, _0803C014
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803C01C
	ldr r0, _0803C018
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x5c
	b _0803C032
	.align 2, 0
_0803C010: .4byte 0x02023D08
_0803C014: .4byte 0x02023EC0
_0803C018: .4byte 0x02024140
_0803C01C:
	ldrb r0, [r4]
	cmp r0, #3
	bne _0803C054
	ldr r0, _0803C04C
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0803C054
	ldr r0, _0803C050
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x5d
_0803C032:
	ldrb r2, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #0x60
	adds r3, r3, r0
	str r3, [sp]
	movs r0, #0
	movs r1, #0
_0803C044:
	movs r3, #0
	bl BtlController_EmitChoosePokemon
	b _0803C072
	.align 2, 0
_0803C04C: .4byte 0x02023EC0
_0803C050: .4byte 0x02024140
_0803C054:
	ldr r2, _0803C07C
	ldr r0, _0803C080
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #0x60
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #6
	movs r3, #0
	bl BtlController_EmitChoosePokemon
_0803C072:
	ldr r0, _0803C080
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	b _0803C308
	.align 2, 0
_0803C07C: .4byte 0x02024140
_0803C080: .4byte 0x02023D08
_0803C084:
	bl IsPlayerPartyAndPokemonStorageFull
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C090
	b _0803C308
_0803C090:
	ldr r1, _0803C0BC
	ldr r3, _0803C0C0
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803C0C4
	str r1, [r0]
	ldr r0, _0803C0C8
	ldrb r1, [r3]
	adds r1, r1, r0
	movs r4, #0
	movs r0, #6
	strb r0, [r1]
	ldrb r1, [r3]
	ldr r2, _0803C0CC
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0x54
	strb r4, [r1]
	ldrb r1, [r3]
	b _0803C3E4
	.align 2, 0
_0803C0BC: .4byte 0x02023EC4
_0803C0C0: .4byte 0x02023D08
_0803C0C4: .4byte 0x08289099
_0803C0C8: .4byte 0x02023FD6
_0803C0CC: .4byte 0x02024140
_0803C0D0:
	ldr r2, _0803C0F0
	ldr r4, _0803C0F4
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #0x60
	ldr r1, [r2]
	adds r1, r1, r0
	movs r0, #0
	bl BtlController_EmitChooseItem
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _0803C308
	.align 2, 0
_0803C0F0: .4byte 0x02024140
_0803C0F4: .4byte 0x02023D08
_0803C0F8:
	ldr r4, _0803C188
	ldr r5, _0803C18C
	ldrb r0, [r5]
	adds r0, r0, r4
	movs r1, #7
	strb r1, [r0]
	ldrb r0, [r5]
	bl GetBattlerPosition
	movs r6, #2
	eors r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	ldrb r0, [r5]
	bl RecordedBattle_ClearBattlerAction
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	ldr r1, _0803C190
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r7, #0x58
	muls r0, r7, r0
	adds r4, r1, #0
	adds r4, #0x50
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0803C176
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r7, r0
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803C194
_0803C176:
	movs r0, #0
	bl BtlController_EmitEndBounceEffect
	ldrb r0, [r5]
	bl MarkBattlerForControllerExec
	bl _0803C9B4
	.align 2, 0
_0803C188: .4byte 0x02023FD6
_0803C18C: .4byte 0x02023D08
_0803C190: .4byte 0x02023D28
_0803C194:
	ldr r4, _0803C1D0
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803C1D4
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl RecordedBattle_ClearBattlerAction
	b _0803C2F2
	.align 2, 0
_0803C1D0: .4byte 0x02023EC0
_0803C1D4:
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #3
	bne _0803C1FA
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	b _0803C2AC
_0803C1FA:
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803C26C
	ldr r4, _0803C264
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _0803C25A
	ldr r4, _0803C268
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r1, #6]
	cmp r0, #0
	beq _0803C26C
_0803C25A:
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r6
	b _0803C2AC
	.align 2, 0
_0803C264: .4byte 0x02023FE0
_0803C268: .4byte 0x02023F60
_0803C26C:
	ldr r0, _0803C2C0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0803C2D4
	ldr r4, _0803C2C4
	ldr r6, _0803C2C8
	ldrb r0, [r6]
	bl GetBattlerPosition
	movs r5, #2
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803C2D4
	ldr r1, _0803C2CC
	ldr r0, _0803C2D0
	ldr r0, [r0]
	str r0, [r1]
	ldrb r0, [r6]
	bl GetBattlerPosition
	eors r0, r5
_0803C2AC:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl RecordedBattle_ClearBattlerAction
	b _0803C2F2
	.align 2, 0
_0803C2C0: .4byte 0x02022C90
_0803C2C4: .4byte 0x02023EC0
_0803C2C8: .4byte 0x02023D08
_0803C2CC: .4byte 0x03005AE0
_0803C2D0: .4byte 0x0203B9FC
_0803C2D4:
	ldr r0, _0803C304
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r1, #2
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl RecordedBattle_ClearBattlerAction
_0803C2F2:
	movs r0, #0
	bl BtlController_EmitEndBounceEffect
	ldr r0, _0803C304
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	b _0803C9B4
	.align 2, 0
_0803C304: .4byte 0x02023D08
_0803C308:
	ldr r1, _0803C348
	ldr r2, [r1]
	movs r5, #8
	adds r0, r2, #0
	ands r0, r5
	adds r3, r1, #0
	cmp r0, #0
	beq _0803C364
	ldr r0, _0803C34C
	ands r2, r0
	cmp r2, #0
	beq _0803C364
	ldr r0, _0803C350
	ldr r4, _0803C354
	ldrb r2, [r4]
	lsls r1, r2, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #3
	bne _0803C364
	ldr r1, _0803C358
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _0803C35C
	str r1, [r0]
	ldr r1, _0803C360
	ldrb r0, [r4]
	adds r0, r0, r1
	movs r3, #0
	strb r5, [r0]
	b _0803C3D6
	.align 2, 0
_0803C348: .4byte 0x02022C90
_0803C34C: .4byte 0x043F0100
_0803C350: .4byte 0x02023508
_0803C354: .4byte 0x02023D08
_0803C358: .4byte 0x02023EC4
_0803C35C: .4byte 0x08289F42
_0803C360: .4byte 0x02023FD6
_0803C364:
	ldr r0, [r3]
	ldr r1, _0803C390
	ands r0, r1
	cmp r0, #8
	bne _0803C3A4
	ldr r0, _0803C394
	ldr r4, _0803C398
	ldrb r1, [r4]
	lsls r1, r1, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #3
	bne _0803C3A4
	ldr r0, _0803C39C
	bl BattleScriptExecute
	ldr r1, _0803C3A0
	ldrb r0, [r4]
	adds r0, r0, r1
	b _0803C864
	.align 2, 0
_0803C390: .4byte 0x0200000A
_0803C394: .4byte 0x02023508
_0803C398: .4byte 0x02023D08
_0803C39C: .4byte 0x08289086
_0803C3A0: .4byte 0x02023FD6
_0803C3A4:
	bl IsRunningFromBattleImpossible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C408
	ldr r0, _0803C3F0
	ldr r4, _0803C3F4
	ldrb r2, [r4]
	lsls r1, r2, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #3
	bne _0803C408
	ldr r1, _0803C3F8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _0803C3FC
_0803C3C8:
	str r1, [r0]
	ldr r0, _0803C400
	ldrb r1, [r4]
	adds r1, r1, r0
	movs r3, #0
	movs r0, #6
	strb r0, [r1]
_0803C3D6:
	ldrb r1, [r4]
	ldr r2, _0803C404
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0x54
	strb r3, [r1]
	ldrb r1, [r4]
_0803C3E4:
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0x84
	movs r0, #1
	strb r0, [r1]
	b _0803C9B4
	.align 2, 0
_0803C3F0: .4byte 0x02023508
_0803C3F4: .4byte 0x02023D08
_0803C3F8: .4byte 0x02023EC4
_0803C3FC: .4byte 0x08289093
_0803C400: .4byte 0x02023FD6
_0803C404: .4byte 0x02024140
_0803C408:
	ldr r2, _0803C414
	ldr r0, _0803C418
	ldrb r1, [r0]
	adds r1, r1, r2
	b _0803C7B8
	.align 2, 0
_0803C414: .4byte 0x02023FD6
_0803C418: .4byte 0x02023D08
_0803C41C:
	ldr r4, _0803C460
	ldr r1, _0803C464
	ldr r3, _0803C468
	ldrb r5, [r3]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r2, [r0]
	lsls r0, r2, #4
	movs r1, #0xf0
	lsls r1, r1, #0x18
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, #8
	orrs r0, r1
	lsls r2, r2, #0xc
	orrs r0, r2
	ldr r1, [r4]
	ands r1, r0
	adds r4, r3, #0
	cmp r1, #0
	beq _0803C448
	b _0803C948
_0803C448:
	ldr r1, _0803C46C
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #9
	bls _0803C456
	b _0803C948
_0803C456:
	lsls r0, r0, #2
	ldr r1, _0803C470
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803C460: .4byte 0x02023D0C
_0803C464: .4byte 0x082FACB4
_0803C468: .4byte 0x02023D08
_0803C46C: .4byte 0x02023EC0
_0803C470: .4byte 0x0803C474
_0803C474: @ jump table
	.4byte _0803C49C @ case 0
	.4byte _0803C5E0 @ case 1
	.4byte _0803C618 @ case 2
	.4byte _0803C64E @ case 3
	.4byte _0803C670 @ case 4
	.4byte _0803C684 @ case 5
	.4byte _0803C698 @ case 6
	.4byte _0803C6C8 @ case 7
	.4byte _0803C6DC @ case 8
	.4byte _0803C700 @ case 9
_0803C49C:
	ldr r1, _0803C4B8
	ldrb r3, [r4]
	lsls r0, r3, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #3
	blt _0803C4CE
	cmp r1, #9
	ble _0803C4BC
	cmp r1, #0xf
	beq _0803C4C2
	b _0803C4CE
	.align 2, 0
_0803C4B8: .4byte 0x02023508
_0803C4BC:
	adds r0, r3, r2
	strb r1, [r0]
	b _0803C9B4
_0803C4C2:
	adds r1, r3, r2
	movs r0, #2
	strb r0, [r1]
	bl sub_0803CA3C
	b _0803C9B4
_0803C4CE:
	movs r0, #2
	bl sub_08185D94
	ldr r4, _0803C504
	ldr r6, _0803C508
	ldrb r3, [r6]
	lsls r1, r3, #9
	adds r5, r4, #2
	adds r0, r1, r5
	ldrb r2, [r0]
	adds r7, r4, #3
	adds r1, r1, r7
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r2, r0
	ldr r0, _0803C50C
	cmp r2, r0
	bne _0803C514
	ldr r0, _0803C510
	adds r0, r3, r0
	movs r1, #1
	strb r1, [r0]
	ldrb r0, [r6]
	bl RecordedBattle_ClearBattlerAction
	b _0803C948
	.align 2, 0
_0803C504: .4byte 0x02023508
_0803C508: .4byte 0x02023D08
_0803C50C: .4byte 0x0000FFFF
_0803C510: .4byte 0x02023FD6
_0803C514:
	bl TrySetCantSelectMoveBattleScript
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C560
	ldrb r0, [r6]
	movs r1, #1
	bl RecordedBattle_ClearBattlerAction
	ldr r0, _0803C558
	ldrb r1, [r6]
	adds r1, r1, r0
	movs r3, #0
	movs r0, #6
	strb r0, [r1]
	ldrb r1, [r6]
	ldr r2, _0803C55C
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0x54
	strb r3, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #9
	adds r1, r4, #1
	adds r0, r0, r1
	strb r3, [r0]
	ldrb r1, [r6]
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0x84
	movs r0, #2
	strb r0, [r1]
	b _0803C9B4
	.align 2, 0
_0803C558: .4byte 0x02023FD6
_0803C55C: .4byte 0x02024140
_0803C560:
	ldr r0, _0803C5CC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	bne _0803C586
	ldrb r0, [r6]
	lsls r1, r0, #9
	adds r1, r1, r5
	ldrb r1, [r1]
	bl RecordedBattle_SetBattlerAction
	ldrb r0, [r6]
	lsls r1, r0, #9
	adds r1, r1, r7
	ldrb r1, [r1]
	bl RecordedBattle_SetBattlerAction
_0803C586:
	ldrb r0, [r6]
	ldr r4, _0803C5D0
	ldr r1, [r4]
	adds r1, r0, r1
	adds r1, #0x80
	lsls r0, r0, #9
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0803C5D4
	ldrb r2, [r6]
	lsls r5, r2, #1
	adds r5, r5, r0
	ldr r3, _0803C5D8
	ldr r4, [r4]
	adds r0, r2, r4
	adds r0, #0x80
	ldrb r0, [r0]
	lsls r0, r0, #1
	movs r1, #0x58
	muls r1, r2, r1
	adds r0, r0, r1
	adds r3, #0xc
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r5]
	ldrb r0, [r6]
	adds r4, r0, r4
	lsls r0, r0, #9
	adds r0, r0, r7
	ldrb r0, [r0]
	strb r0, [r4, #0xc]
	ldr r0, _0803C5DC
	ldrb r1, [r6]
	b _0803C7B6
	.align 2, 0
_0803C5CC: .4byte 0x02022C90
_0803C5D0: .4byte 0x02024140
_0803C5D4: .4byte 0x02023F18
_0803C5D8: .4byte 0x02023D28
_0803C5DC: .4byte 0x02023FD6
_0803C5E0:
	ldr r2, _0803C608
	ldr r5, _0803C60C
	ldrb r4, [r5]
	lsls r1, r4, #9
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r3, r0
	cmp r3, #0
	bne _0803C5FE
	b _0803C860
_0803C5FE:
	ldr r0, _0803C610
	strh r3, [r0]
	ldr r0, _0803C614
	ldrb r1, [r5]
	b _0803C7B6
	.align 2, 0
_0803C608: .4byte 0x02023508
_0803C60C: .4byte 0x02023D08
_0803C610: .4byte 0x02023EAC
_0803C614: .4byte 0x02023FD6
_0803C618:
	ldr r0, _0803C63C
	ldr r4, _0803C640
	ldrb r2, [r4]
	lsls r1, r2, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #6
	bne _0803C648
	ldr r0, _0803C644
	adds r0, r2, r0
	movs r1, #1
	strb r1, [r0]
	ldrb r0, [r4]
	bl RecordedBattle_ClearBattlerAction
	b _0803C948
	.align 2, 0
_0803C63C: .4byte 0x02023508
_0803C640: .4byte 0x02023D08
_0803C644: .4byte 0x02023FD6
_0803C648:
	bl sub_0803CA3C
	b _0803C7B2
_0803C64E:
	ldr r2, _0803C664
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0803C668
	ldr r0, _0803C66C
	ldrb r1, [r0]
	adds r1, r1, r2
	b _0803C7B8
	.align 2, 0
_0803C664: .4byte 0x02023F24
_0803C668: .4byte 0x02023FD6
_0803C66C: .4byte 0x02023D08
_0803C670:
	ldr r2, _0803C67C
	ldr r0, _0803C680
	ldrb r1, [r0]
	adds r1, r1, r2
	b _0803C7B8
	.align 2, 0
_0803C67C: .4byte 0x02023FD6
_0803C680: .4byte 0x02023D08
_0803C684:
	ldr r2, _0803C690
	ldr r0, _0803C694
	ldrb r1, [r0]
	adds r1, r1, r2
	b _0803C7B8
	.align 2, 0
_0803C690: .4byte 0x02023FD6
_0803C694: .4byte 0x02023D08
_0803C698:
	ldr r3, _0803C6BC
	ldr r0, _0803C6C0
	ldrb r4, [r0]
	lsls r1, r4, #9
	adds r0, r3, #1
	adds r0, r1, r0
	ldrb r2, [r0]
	adds r3, #2
	adds r1, r1, r3
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r2, r0
	cmp r2, #0
	bne _0803C6B6
	b _0803C860
_0803C6B6:
	ldr r1, _0803C6C4
	adds r1, r4, r1
	b _0803C7B8
	.align 2, 0
_0803C6BC: .4byte 0x02023508
_0803C6C0: .4byte 0x02023D08
_0803C6C4: .4byte 0x02023FD6
_0803C6C8:
	ldr r2, _0803C6D4
	ldr r0, _0803C6D8
	ldrb r1, [r0]
	adds r1, r1, r2
	b _0803C7B8
	.align 2, 0
_0803C6D4: .4byte 0x02023FD6
_0803C6D8: .4byte 0x02023D08
_0803C6DC:
	ldr r2, _0803C6F4
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0803C6F8
	ldr r0, _0803C6FC
	ldrb r1, [r0]
	adds r1, r1, r2
	b _0803C7B8
	.align 2, 0
_0803C6F4: .4byte 0x02023F24
_0803C6F8: .4byte 0x02023FD6
_0803C6FC: .4byte 0x02023D08
_0803C700:
	ldr r2, _0803C70C
	ldr r0, _0803C710
	ldrb r1, [r0]
	adds r1, r1, r2
	b _0803C7B8
	.align 2, 0
_0803C70C: .4byte 0x02023FD6
_0803C710: .4byte 0x02023D08
_0803C714:
	ldr r3, _0803C78C
	ldr r6, _0803C790
	ldr r0, _0803C794
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	lsls r1, r2, #4
	movs r0, #0xf0
	lsls r0, r0, #0x18
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, #8
	orrs r1, r0
	lsls r2, r2, #0xc
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0803C73E
	b _0803C948
_0803C73E:
	bl AllAtActionConfirmed
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	ldr r0, _0803C798
	ldr r0, [r0]
	movs r1, #0x41
	ands r0, r1
	cmp r0, #1
	bne _0803C780
	movs r1, #2
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _0803C780
	adds r0, r5, #0
	eors r0, r1
	bl GetBattlerAtPosition
	ldr r1, _0803C79C
	ldr r1, [r1]
	adds r1, #0x91
	ldrb r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r6
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0803C7A0
_0803C780:
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl BtlController_EmitLinkStandbyMsg
	b _0803C7AA
	.align 2, 0
_0803C78C: .4byte 0x02023D0C
_0803C790: .4byte 0x082FACB4
_0803C794: .4byte 0x02023D08
_0803C798: .4byte 0x02022C90
_0803C79C: .4byte 0x02024140
_0803C7A0:
	movs r0, #0
	movs r1, #1
	adds r2, r4, #0
	bl BtlController_EmitLinkStandbyMsg
_0803C7AA:
	ldr r4, _0803C7C0
_0803C7AC:
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803C7B2:
	ldr r0, _0803C7C4
	ldrb r1, [r4]
_0803C7B6:
	adds r1, r1, r0
_0803C7B8:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0803C948
	.align 2, 0
_0803C7C0: .4byte 0x02023D08
_0803C7C4: .4byte 0x02023FD6
_0803C7C8:
	ldr r3, _0803C7FC
	ldr r1, _0803C800
	ldr r0, _0803C804
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	lsls r1, r2, #4
	movs r0, #0xf0
	lsls r0, r0, #0x18
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, #8
	orrs r1, r0
	lsls r2, r2, #0xc
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0803C7F2
	b _0803C948
_0803C7F2:
	ldr r1, _0803C808
	ldrb r0, [r1, #4]
	adds r0, #1
	strb r0, [r1, #4]
	b _0803C948
	.align 2, 0
_0803C7FC: .4byte 0x02023D0C
_0803C800: .4byte 0x082FACB4
_0803C804: .4byte 0x02023D08
_0803C808: .4byte 0x02023FD6
_0803C80C:
	ldr r5, _0803C82C
	ldrb r2, [r5]
	ldr r0, _0803C830
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x54
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C8F8
	ldr r0, _0803C834
	adds r0, r2, r0
	adds r1, #0x84
	ldrb r1, [r1]
	strb r1, [r0]
	b _0803C948
	.align 2, 0
_0803C82C: .4byte 0x02023D08
_0803C830: .4byte 0x02024140
_0803C834: .4byte 0x02023FD6
_0803C838:
	ldr r3, _0803C86C
	ldr r1, _0803C870
	ldr r0, _0803C874
	ldrb r4, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r2, [r0]
	lsls r1, r2, #4
	movs r0, #0xf0
	lsls r0, r0, #0x18
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, #8
	orrs r1, r0
	lsls r2, r2, #0xc
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	bne _0803C948
_0803C860:
	ldr r0, _0803C878
	adds r0, r4, r0
_0803C864:
	movs r1, #1
	strb r1, [r0]
	b _0803C948
	.align 2, 0
_0803C86C: .4byte 0x02023D0C
_0803C870: .4byte 0x082FACB4
_0803C874: .4byte 0x02023D08
_0803C878: .4byte 0x02023FD6
_0803C87C:
	ldr r5, _0803C8C0
	ldrb r2, [r5]
	ldr r4, _0803C8C4
	ldr r0, [r4]
	adds r0, r2, r0
	adds r0, #0x54
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C8F8
	ldr r0, _0803C8C8
	lsls r1, r2, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xd
	bne _0803C8D8
	ldr r2, _0803C8CC
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0803C8D0
	ldrb r0, [r5]
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
	ldr r1, _0803C8D4
	ldrb r0, [r5]
_0803C8B6:
	adds r0, r0, r1
	movs r1, #4
	strb r1, [r0]
	b _0803C948
	.align 2, 0
_0803C8C0: .4byte 0x02023D08
_0803C8C4: .4byte 0x02024140
_0803C8C8: .4byte 0x02023508
_0803C8CC: .4byte 0x02023F24
_0803C8D0: .4byte 0x02023EC0
_0803C8D4: .4byte 0x02023FD6
_0803C8D8:
	adds r0, r2, #0
	movs r1, #1
	bl RecordedBattle_ClearBattlerAction
	ldr r2, _0803C8F4
	ldrb r0, [r5]
	adds r2, r0, r2
	ldr r1, [r4]
	adds r0, r0, r1
	adds r0, #0x84
	ldrb r0, [r0]
	strb r0, [r2]
	b _0803C948
	.align 2, 0
_0803C8F4: .4byte 0x02023FD6
_0803C8F8:
	ldr r0, _0803C9C4
	strb r2, [r0]
	ldr r7, _0803C9C8
	ldr r6, _0803C9CC
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r4, [r0]
	str r4, [r7]
	ldr r3, _0803C9D0
	ldr r1, _0803C9D4
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	lsls r1, r2, #4
	movs r0, #0xf0
	lsls r0, r0, #0x18
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, #8
	orrs r1, r0
	lsls r2, r2, #0xc
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	bne _0803C93E
	ldr r0, _0803C9D8
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0803C93E:
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r7]
	str r1, [r0]
_0803C948:
	ldr r0, _0803C9DC
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, _0803C9E0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
_0803C956:
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r1, r0
	bhs _0803C962
	bl HandleTurnActionSelectionState
_0803C962:
	ldr r0, _0803C9E4
	ldrb r0, [r0, #4]
	ldrb r1, [r5]
	cmp r0, r1
	bne _0803C9B4
	movs r0, #1
	bl sub_08185D94
	ldr r1, _0803C9E8
	ldr r0, _0803C9EC
	str r0, [r1]
	ldr r0, _0803C9F0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803C9B4
	movs r4, #0
	ldrb r5, [r5]
	cmp r4, r5
	bge _0803C9B4
_0803C98E:
	ldr r0, _0803C9F4
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803C9AA
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803C9F8
	ldr r1, [r1]
	adds r1, r4, r1
	adds r1, #0x5c
	ldrb r1, [r1]
	bl sub_08056DEC
_0803C9AA:
	adds r4, #1
	ldr r0, _0803C9E0
	ldrb r0, [r0]
	cmp r4, r0
	blt _0803C98E
_0803C9B4:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C9C4: .4byte 0x02023EAF
_0803C9C8: .4byte 0x02023EB8
_0803C9CC: .4byte 0x02023EC4
_0803C9D0: .4byte 0x02023D0C
_0803C9D4: .4byte 0x082FACB4
_0803C9D8: .4byte 0x082EC694
_0803C9DC: .4byte 0x02023D08
_0803C9E0: .4byte 0x02023D10
_0803C9E4: .4byte 0x02023FD6
_0803C9E8: .4byte 0x03005A64
_0803C9EC: .4byte 0x0803CF2D
_0803C9F0: .4byte 0x02022C90
_0803C9F4: .4byte 0x02023EC0
_0803C9F8: .4byte 0x02024140
	thumb_func_end HandleTurnActionSelectionState

	thumb_func_start AllAtActionConfirmed
AllAtActionConfirmed: @ 0x0803C9FC
	push {r4, r5, lr}
	movs r3, #0
	movs r1, #0
	ldr r0, _0803CA2C
	ldrb r2, [r0]
	adds r5, r0, #0
	cmp r3, r2
	bge _0803CA1E
	ldr r4, _0803CA30
_0803CA0E:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #5
	bne _0803CA18
	adds r3, #1
_0803CA18:
	adds r1, #1
	cmp r1, r2
	blt _0803CA0E
_0803CA1E:
	adds r0, r3, #1
	ldrb r5, [r5]
	cmp r0, r5
	beq _0803CA34
	movs r0, #0
	b _0803CA36
	.align 2, 0
_0803CA2C: .4byte 0x02023D10
_0803CA30: .4byte 0x02023FD6
_0803CA34:
	movs r0, #1
_0803CA36:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end AllAtActionConfirmed

	thumb_func_start sub_0803CA3C
sub_0803CA3C: @ 0x0803CA3C
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803CB10
	ldrb r0, [r7]
	ldr r6, _0803CB14
	ldr r1, [r6]
	adds r1, r0, r1
	adds r1, #0x5c
	ldr r4, _0803CB18
	lsls r0, r0, #9
	adds r2, r4, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r1, r1, r2
	ldrb r1, [r1]
	bl RecordedBattle_SetBattlerAction
	ldr r0, _0803CB1C
	ldr r0, [r0]
	movs r1, #0x42
	ands r0, r1
	cmp r0, #0x42
	bne _0803CB0A
	ldrb r0, [r7]
	ldr r2, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	adds r1, #0x60
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	ldr r2, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	adds r1, #0x60
	lsls r0, r0, #9
	adds r5, r4, #2
	adds r0, r0, r5
	ldrb r2, [r0]
	movs r3, #0xf0
	adds r0, r3, #0
	ands r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	ldr r2, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	adds r0, #0x61
	lsls r1, r1, #9
	adds r4, #3
	mov ip, r4
	add r1, ip
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r0, [r7]
	movs r4, #2
	eors r0, r4
	ldr r2, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	adds r1, #0x60
	ldrb r2, [r1]
	adds r0, r3, #0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	eors r0, r4
	ldr r2, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	adds r1, #0x60
	ldrb r0, [r7]
	lsls r0, r0, #9
	adds r0, r0, r5
	ldrb r0, [r0]
	ands r3, r0
	lsrs r3, r3, #4
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
	ldrb r0, [r7]
	eors r4, r0
	ldr r0, [r6]
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r1, r1, r0
	adds r1, #0x62
	ldrb r0, [r7]
	lsls r0, r0, #9
	add r0, ip
	ldrb r0, [r0]
	strb r0, [r1]
_0803CB0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB10: .4byte 0x02023D08
_0803CB14: .4byte 0x02024140
_0803CB18: .4byte 0x02023508
_0803CB1C: .4byte 0x02022C90
	thumb_func_end sub_0803CA3C

	thumb_func_start SwapTurnOrder
SwapTurnOrder: @ 0x0803CB20
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0803CB4C
	adds r4, r0, r2
	ldrb r5, [r4]
	adds r2, r1, r2
	ldrb r3, [r2]
	strb r3, [r4]
	strb r5, [r2]
	ldr r2, _0803CB50
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, r1, r2
	ldrb r2, [r1]
	strb r2, [r0]
	strb r5, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB4C: .4byte 0x02023D1E
_0803CB50: .4byte 0x02023D22
	thumb_func_end SwapTurnOrder

	thumb_func_start GetWhoStrikesFirst
GetWhoStrikesFirst: @ 0x0803CB54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0
	movs r2, #0xd
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CC1C
	ldr r1, [sp, #8]
	str r1, [sp]
	movs r0, #0x13
	movs r1, #0
	movs r2, #0x4d
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CC1C
	ldr r1, _0803CBD4
	movs r0, #0x58
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r3, [r0]
	cmp r3, #0x21
	bne _0803CBC0
	ldr r0, _0803CBD8
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803CBD0
_0803CBC0:
	cmp r3, #0x22
	bne _0803CBDC
	ldr r0, _0803CBD8
	ldrh r1, [r0]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _0803CBDC
_0803CBD0:
	movs r3, #2
	b _0803CBDE
	.align 2, 0
_0803CBD4: .4byte 0x02023D28
_0803CBD8: .4byte 0x02024070
_0803CBDC:
	movs r3, #1
_0803CBDE:
	movs r0, #0x58
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r2, _0803CC14
	adds r0, r0, r2
	adds r0, #0x20
	ldrb r2, [r0]
	cmp r2, #0x21
	bne _0803CBFE
	ldr r0, _0803CC18
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803CC0E
_0803CBFE:
	cmp r2, #0x22
	bne _0803CC1E
	ldr r0, _0803CC18
	ldrh r1, [r0]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _0803CC1E
_0803CC0E:
	movs r7, #2
	b _0803CC20
	.align 2, 0
_0803CC14: .4byte 0x02023D28
_0803CC18: .4byte 0x02024070
_0803CC1C:
	movs r3, #1
_0803CC1E:
	movs r7, #1
_0803CC20:
	ldr r1, _0803CC64
	movs r0, #0x58
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r4, r0, r1
	ldrh r0, [r4, #6]
	muls r3, r0, r3
	ldr r2, _0803CC68
	movs r1, #0x1b
	ldrsb r1, [r4, r1]
	lsls r1, r1, #1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	bl __divsi3
	mov r8, r0
	ldrh r0, [r4, #0x2e]
	cmp r0, #0xaf
	bne _0803CC70
	ldr r1, _0803CC6C
	mov r3, sb
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r6, [r0, #7]
	ldrb r5, [r0, #0x1a]
	b _0803CC84
	.align 2, 0
_0803CC64: .4byte 0x02023D28
_0803CC68: .4byte 0x082FA6B6
_0803CC6C: .4byte 0x020240A8
_0803CC70:
	ldrh r0, [r4, #0x2e]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #0x2e]
	bl sub_080D6D1C
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803CC84:
	ldr r0, _0803CD40
	ldr r0, [r0]
	ldr r1, _0803CD44
	ands r0, r1
	cmp r0, #0
	bne _0803CCB8
	ldr r0, _0803CD48
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803CCB8
	mov r0, sb
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CCB8
	movs r0, #0x6e
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x64
	bl __udivsi3
	mov r8, r0
_0803CCB8:
	cmp r6, #0x18
	bne _0803CCC2
	mov r2, r8
	lsrs r2, r2, #1
	mov r8, r2
_0803CCC2:
	ldr r1, _0803CD4C
	movs r0, #0x58
	mov r3, sb
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803CCE0
	mov r0, r8
	lsrs r0, r0, #2
	mov r8, r0
_0803CCE0:
	cmp r6, #0x1a
	bne _0803CCFC
	ldr r0, _0803CD50
	ldrh r4, [r0]
	lsls r0, r5, #0x10
	subs r0, r0, r5
	movs r1, #0x64
	bl __divsi3
	cmp r4, r0
	bge _0803CCFC
	movs r1, #1
	rsbs r1, r1, #0
	mov r8, r1
_0803CCFC:
	ldr r1, _0803CD4C
	movs r0, #0x58
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	adds r4, r0, r1
	ldrh r0, [r4, #6]
	adds r3, r0, #0
	muls r3, r7, r3
	ldr r2, _0803CD54
	movs r1, #0x1b
	ldrsb r1, [r4, r1]
	lsls r1, r1, #1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	bl __divsi3
	adds r7, r0, #0
	ldrh r0, [r4, #0x2e]
	cmp r0, #0xaf
	bne _0803CD5C
	ldr r1, _0803CD58
	mov r3, sl
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r6, [r0, #7]
	ldrb r5, [r0, #0x1a]
	b _0803CD70
	.align 2, 0
_0803CD40: .4byte 0x02022C90
_0803CD44: .4byte 0x023F0102
_0803CD48: .4byte 0x00000869
_0803CD4C: .4byte 0x02023D28
_0803CD50: .4byte 0x02023FD4
_0803CD54: .4byte 0x082FA6B6
_0803CD58: .4byte 0x020240A8
_0803CD5C:
	ldrh r0, [r4, #0x2e]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #0x2e]
	bl sub_080D6D1C
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803CD70:
	ldr r0, _0803CDE8
	ldr r0, [r0]
	ldr r1, _0803CDEC
	ands r0, r1
	cmp r0, #0
	bne _0803CDA0
	ldr r0, _0803CDF0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803CDA0
	mov r0, sl
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CDA0
	movs r0, #0x6e
	muls r0, r7, r0
	movs r1, #0x64
	bl __udivsi3
	adds r7, r0, #0
_0803CDA0:
	cmp r6, #0x18
	bne _0803CDA6
	lsrs r7, r7, #1
_0803CDA6:
	ldr r2, _0803CDF4
	movs r0, #0x58
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	adds r1, r2, #0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803CDC2
	lsrs r7, r7, #2
_0803CDC2:
	cmp r6, #0x1a
	bne _0803CDDC
	ldr r0, _0803CDF8
	ldrh r4, [r0]
	lsls r0, r5, #0x10
	subs r0, r0, r5
	movs r1, #0x64
	bl __divsi3
	cmp r4, r0
	bge _0803CDDC
	movs r7, #1
	rsbs r7, r7, #0
_0803CDDC:
	ldr r2, [sp, #4]
	cmp r2, #0
	beq _0803CDFC
	movs r3, #0
	b _0803CE98
	.align 2, 0
_0803CDE8: .4byte 0x02022C90
_0803CDEC: .4byte 0x023F0102
_0803CDF0: .4byte 0x00000869
_0803CDF4: .4byte 0x02023D28
_0803CDF8: .4byte 0x02023FD4
_0803CDFC:
	ldr r0, _0803CE1C
	mov r3, sb
	adds r1, r3, r0
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _0803CE4C
	ldr r0, _0803CE20
	lsls r1, r3, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _0803CE24
	movs r3, #0xa5
	b _0803CE4E
	.align 2, 0
_0803CE1C: .4byte 0x02023EC0
_0803CE20: .4byte 0x02023FE0
_0803CE24:
	ldr r0, _0803CE44
	ldr r0, [r0]
	add r0, sb
	adds r0, #0x80
	ldrb r0, [r0]
	lsls r0, r0, #1
	movs r1, #0x58
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	ldr r1, _0803CE48
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r3, [r0]
	b _0803CE4E
	.align 2, 0
_0803CE44: .4byte 0x02024140
_0803CE48: .4byte 0x02023D28
_0803CE4C:
	movs r3, #0
_0803CE4E:
	mov r1, sl
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803CE98
	ldr r0, _0803CE6C
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _0803CE70
	movs r2, #0xa5
	b _0803CE9A
	.align 2, 0
_0803CE6C: .4byte 0x02023FE0
_0803CE70:
	ldr r0, _0803CE90
	ldr r0, [r0]
	add r0, sl
	adds r0, #0x80
	ldrb r0, [r0]
	lsls r0, r0, #1
	movs r1, #0x58
	mov r2, sl
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	ldr r1, _0803CE94
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r2, [r0]
	b _0803CE9A
	.align 2, 0
_0803CE90: .4byte 0x02024140
_0803CE94: .4byte 0x02023D28
_0803CE98:
	movs r2, #0
_0803CE9A:
	ldr r4, _0803CEE4
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #7
	ldrsb r1, [r0, r1]
	lsls r3, r2, #1
	cmp r1, #0
	bne _0803CEBE
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803CEFC
_0803CEBE:
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _0803CEF2
	cmp r8, r7
	bne _0803CEE8
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803CEE8
	movs r3, #2
	b _0803CF18
	.align 2, 0
_0803CEE4: .4byte 0x082ED220
_0803CEE8:
	cmp r8, r7
	bhs _0803CF1A
	movs r0, #1
	str r0, [sp, #8]
	b _0803CF1A
_0803CEF2:
	cmp r1, r0
	bge _0803CF1A
	movs r1, #1
	str r1, [sp, #8]
	b _0803CF1A
_0803CEFC:
	cmp r8, r7
	bne _0803CF12
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803CF12
	movs r2, #2
	str r2, [sp, #8]
	b _0803CF1A
_0803CF12:
	cmp r8, r7
	bhs _0803CF1A
	movs r3, #1
_0803CF18:
	str r3, [sp, #8]
_0803CF1A:
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetWhoStrikesFirst

	thumb_func_start SetActionsAndBattlersTurnOrder
SetActionsAndBattlersTurnOrder: @ 0x0803CF2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r3, #0
	ldr r0, _0803CF80
	ldr r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803CF98
	ldr r0, _0803CF84
	strb r3, [r0]
	ldr r4, _0803CF88
	mov r8, r0
	ldrb r0, [r4]
	cmp r3, r0
	blo _0803CF54
	b _0803D18E
_0803CF54:
	ldr r7, _0803CF8C
	ldr r6, _0803CF90
	mov r2, r8
	ldr r5, _0803CF94
_0803CF5C:
	adds r1, r3, r7
	ldrb r0, [r2]
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r3, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r3, #1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	cmp r0, r1
	blo _0803CF5C
	b _0803D18E
	.align 2, 0
_0803CF80: .4byte 0x02022C90
_0803CF84: .4byte 0x02023D08
_0803CF88: .4byte 0x02023D10
_0803CF8C: .4byte 0x02023D1E
_0803CF90: .4byte 0x02023EC0
_0803CF94: .4byte 0x02023D22
_0803CF98:
	movs r2, #2
	ands r1, r2
	cmp r1, #0
	beq _0803CFE8
	ldr r0, _0803CFDC
	strb r3, [r0]
	ldr r1, _0803CFE0
	mov r8, r0
	adds r2, r1, #0
	ldrb r2, [r2]
	cmp r3, r2
	bhs _0803D004
	ldr r0, _0803CFE4
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #3
	beq _0803D002
_0803CFBA:
	mov r7, r8
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CFE0
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0803D004
	ldrb r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #3
	bne _0803CFBA
	b _0803D002
	.align 2, 0
_0803CFDC: .4byte 0x02023D08
_0803CFE0: .4byte 0x02023D10
_0803CFE4: .4byte 0x02023EC0
_0803CFE8:
	ldr r1, _0803D06C
	ldrb r0, [r1]
	ldr r4, _0803D070
	mov r8, r4
	cmp r0, #3
	bne _0803CFF8
	strb r3, [r4]
	movs r3, #5
_0803CFF8:
	ldrb r0, [r1, #2]
	cmp r0, #3
	bne _0803D004
	mov r7, r8
	strb r2, [r7]
_0803D002:
	movs r3, #5
_0803D004:
	cmp r3, #5
	bne _0803D08C
	ldr r6, _0803D074
	ldr r1, _0803D06C
	mov r2, r8
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r6]
	ldr r2, _0803D078
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r2]
	movs r3, #1
	movs r5, #0
	adds r4, r1, #0
	ldr r7, _0803D07C
	mov sl, r7
	ldr r0, _0803D080
	mov ip, r0
	ldr r1, _0803D084
	mov sb, r1
	ldr r7, _0803D088
	ldrb r7, [r7]
	cmp r5, r7
	bge _0803D05E
	adds r7, r6, #0
	adds r6, r4, #0
	adds r4, r2, #0
	ldr r2, _0803D088
_0803D040:
	mov r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	beq _0803D056
	adds r1, r3, r7
	adds r0, r5, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, r4
	strb r5, [r0]
	adds r3, #1
_0803D056:
	adds r5, #1
	ldrb r1, [r2]
	cmp r5, r1
	blt _0803D040
_0803D05E:
	mov r2, ip
	mov r3, sl
	str r2, [r3]
	mov r4, sb
	ldr r0, [r4]
	b _0803D198
	.align 2, 0
_0803D06C: .4byte 0x02023EC0
_0803D070: .4byte 0x02023D08
_0803D074: .4byte 0x02023D1E
_0803D078: .4byte 0x02023D22
_0803D07C: .4byte 0x03005A64
_0803D080: .4byte 0x0803D335
_0803D084: .4byte 0x02024140
_0803D088: .4byte 0x02023D10
_0803D08C:
	movs r0, #0
	mov r7, r8
	strb r0, [r7]
	ldr r1, _0803D11C
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803D0D2
	ldr r6, _0803D120
	mov r2, r8
	ldr r5, _0803D124
	ldr r4, _0803D128
_0803D0A2:
	ldrb r0, [r2]
	adds r0, r0, r6
	ldrb r1, [r0]
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0803D0C0
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, #1
_0803D0C0:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803D11C
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803D0A2
_0803D0D2:
	movs r0, #0
	mov r2, r8
	strb r0, [r2]
	ldr r4, _0803D11C
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803D116
	ldr r6, _0803D120
	ldr r5, _0803D124
	ldr r4, _0803D128
_0803D0E6:
	ldrb r0, [r2]
	adds r0, r0, r6
	ldrb r1, [r0]
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0803D104
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, #1
_0803D104:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803D11C
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803D0E6
_0803D116:
	movs r5, #0
	b _0803D184
	.align 2, 0
_0803D11C: .4byte 0x02023D10
_0803D120: .4byte 0x02023EC0
_0803D124: .4byte 0x02023D1E
_0803D128: .4byte 0x02023D22
_0803D12C:
	adds r4, r5, #1
	adds r7, r4, #0
	ldrb r1, [r1]
	cmp r7, r1
	bge _0803D182
	ldr r6, _0803D1AC
	lsls r2, r5, #0x18
	mov r8, r2
_0803D13C:
	ldr r0, _0803D1B0
	adds r1, r5, r0
	ldrb r3, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	adds r0, r5, r6
	ldrb r2, [r0]
	cmp r2, #1
	beq _0803D178
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803D178
	cmp r2, #2
	beq _0803D178
	cmp r0, #2
	beq _0803D178
	adds r0, r3, #0
	movs r2, #0
	bl GetWhoStrikesFirst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D178
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r3, r8
	lsrs r0, r3, #0x18
	bl SwapTurnOrder
_0803D178:
	adds r4, #1
	ldr r0, _0803D1B4
	ldrb r0, [r0]
	cmp r4, r0
	blt _0803D13C
_0803D182:
	adds r5, r7, #0
_0803D184:
	ldr r1, _0803D1B4
	ldrb r0, [r1]
	subs r0, #1
	cmp r5, r0
	blt _0803D12C
_0803D18E:
	ldr r1, _0803D1B8
	ldr r0, _0803D1BC
	str r0, [r1]
	ldr r0, _0803D1C0
	ldr r0, [r0]
_0803D198:
	adds r0, #0x48
	movs r1, #0
	strb r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D1AC: .4byte 0x02023D1E
_0803D1B0: .4byte 0x02023D22
_0803D1B4: .4byte 0x02023D10
_0803D1B8: .4byte 0x03005A64
_0803D1BC: .4byte 0x0803D335
_0803D1C0: .4byte 0x02024140
	thumb_func_end SetActionsAndBattlersTurnOrder

	thumb_func_start TurnValuesCleanUp
TurnValuesCleanUp: @ 0x0803D1C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r1, _0803D21C
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0803D220
	ldrb r2, [r0]
	adds r5, r1, #0
	cmp r2, #0
	beq _0803D2BC
	ldr r7, _0803D224
	adds r6, r5, #0
	ldr r0, _0803D228
	mov ip, r0
	ldr r1, _0803D22C
	mov r8, r1
	mov sl, r8
_0803D1F2:
	mov r2, sb
	cmp r2, #0
	beq _0803D230
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	b _0803D28C
	.align 2, 0
_0803D21C: .4byte 0x02023D08
_0803D220: .4byte 0x02023D10
_0803D224: .4byte 0x02023FE0
_0803D228: .4byte 0x02023D78
_0803D22C: .4byte 0x02023F60
_0803D230:
	ldrb r0, [r6]
	lsls r0, r0, #4
	adds r2, r0, r7
	movs r1, #0
	mov r4, sl
	movs r3, #0
_0803D23C:
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, #1
	cmp r1, #0xf
	bls _0803D23C
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _0803D25A
	subs r0, #1
	strb r0, [r1, #0x16]
_0803D25A:
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrb r0, [r1, #0x19]
	cmp r0, #0
	beq _0803D28C
	subs r0, #1
	strb r0, [r1, #0x19]
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	bne _0803D28C
	movs r0, #0x58
	muls r2, r0, r2
	add r2, ip
	ldr r0, [r2]
	ldr r1, _0803D2D4
	ands r0, r1
	str r0, [r2]
_0803D28C:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _0803D2AA
	movs r0, #0x58
	muls r2, r0, r2
	add r2, ip
	ldr r0, [r2]
	ldr r1, _0803D2D8
	ands r0, r1
	str r0, [r2]
_0803D2AA:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803D2DC
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803D1F2
_0803D2BC:
	movs r0, #0
	ldr r2, _0803D2E0
	strb r0, [r2, #8]
	strb r0, [r2, #0x14]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D2D4: .4byte 0xFFBFFFFF
_0803D2D8: .4byte 0xFEFFFFFF
_0803D2DC: .4byte 0x02023D10
_0803D2E0: .4byte 0x02023F38
	thumb_func_end TurnValuesCleanUp

	thumb_func_start SpecialStatusesClear
SpecialStatusesClear: @ 0x0803D2E4
	push {r4, r5, r6, lr}
	ldr r2, _0803D328
	movs r0, #0
	strb r0, [r2]
	ldr r0, _0803D32C
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _0803D322
	adds r3, r2, #0
	movs r4, #0
	ldr r5, _0803D330
_0803D2FC:
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r5
	movs r1, #0
_0803D308:
	adds r0, r2, r1
	strb r4, [r0]
	adds r1, #1
	cmp r1, #0x13
	bls _0803D308
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r6]
	cmp r0, r1
	blo _0803D2FC
_0803D322:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D328: .4byte 0x02023D08
_0803D32C: .4byte 0x02023D10
_0803D330: .4byte 0x02024020
	thumb_func_end SpecialStatusesClear

	thumb_func_start CheckFocusPunch_ClearVarsBeforeTurnStarts
CheckFocusPunch_ClearVarsBeforeTurnStarts: @ 0x0803D334
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803D3BC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0803D3F2
	ldr r2, _0803D3C0
	ldr r0, [r2]
	adds r0, #0x48
	ldr r1, _0803D3C4
	ldrb r0, [r0]
	mov ip, r2
	adds r6, r1, #0
	ldrb r1, [r6]
	cmp r0, r1
	bhs _0803D3F2
	ldr r5, _0803D3C8
	ldr r4, _0803D3CC
	movs r7, #0x84
	lsls r7, r7, #1
_0803D360:
	ldr r1, [r2]
	adds r1, #0x48
	ldrb r0, [r1]
	strb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0803D3D0
	ldrb r3, [r5]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	bne _0803D3E4
	ldr r1, _0803D3D4
	movs r0, #0x58
	muls r0, r3, r0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0803D3E4
	ldr r2, _0803D3D8
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0803D3E4
	ldr r0, _0803D3DC
	lsls r1, r3, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _0803D3E4
	ldr r0, _0803D3E0
	bl BattleScriptExecute
	b _0803D42C
	.align 2, 0
_0803D3BC: .4byte 0x02023F24
_0803D3C0: .4byte 0x02024140
_0803D3C4: .4byte 0x02023D10
_0803D3C8: .4byte 0x02023D08
_0803D3CC: .4byte 0x02023EAF
_0803D3D0: .4byte 0x02023F18
_0803D3D4: .4byte 0x02023D28
_0803D3D8: .4byte 0x02023F60
_0803D3DC: .4byte 0x02023FE0
_0803D3E0: .4byte 0x08289787
_0803D3E4:
	mov r2, ip
	ldr r0, [r2]
	adds r0, #0x48
	ldrb r0, [r0]
	ldrb r1, [r6]
	cmp r0, r1
	blo _0803D360
_0803D3F2:
	bl TryClearRageStatuses
	ldr r1, _0803D434
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0803D438
	ldr r0, _0803D43C
	movs r3, #0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0803D440
	movs r2, #0
	strh r3, [r0]
	ldr r0, _0803D444
	ldr r0, [r0]
	strb r2, [r0, #0x13]
	ldr r1, _0803D448
	ldr r0, _0803D44C
	str r0, [r1]
	ldr r0, _0803D450
	strb r2, [r0, #3]
	strb r2, [r0, #4]
	ldr r0, _0803D454
	strb r2, [r0, #0x16]
	ldr r0, _0803D458
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, #0x20
	strb r2, [r0]
_0803D42C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D434: .4byte 0x02023D26
_0803D438: .4byte 0x02023D27
_0803D43C: .4byte 0x02023D1E
_0803D440: .4byte 0x020240A4
_0803D444: .4byte 0x02024140
_0803D448: .4byte 0x03005A64
_0803D44C: .4byte 0x0803D45D
_0803D450: .4byte 0x02023FD6
_0803D454: .4byte 0x02024118
_0803D458: .4byte 0x0202414C
	thumb_func_end CheckFocusPunch_ClearVarsBeforeTurnStarts

	thumb_func_start RunBattleScriptCommands
RunBattleScriptCommands: @ 0x0803D45C
	push {r4, r5, r6, lr}
	ldr r6, _0803D4B0
	ldrb r0, [r6]
	ldr r2, _0803D4B4
	cmp r0, #0
	beq _0803D46C
	movs r0, #0xc
	strb r0, [r2]
_0803D46C:
	ldr r5, _0803D4B8
	ldr r0, [r5]
	adds r0, #0x4b
	ldr r4, _0803D4BC
	ldrb r1, [r4]
	strb r1, [r0]
	ldr r1, _0803D4C0
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0803D4C4
	thumb_func_end RunBattleScriptCommands

	thumb_func_start RunTurnActionsFunctions
RunTurnActionsFunctions: @ 0x0803D488
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	blo _0803D4D8
	ldr r2, _0803D4C8
	ldr r0, [r2]
	ldr r1, _0803D4CC
	ands r0, r1
	str r0, [r2]
	ldr r3, _0803D4D0
	ldr r2, _0803D4D4
	ldrb r1, [r6]
	movs r0, #0x7f
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r3]
	b _0803D4F0
	.align 2, 0
_0803D4B0: .4byte 0x02023FDE
_0803D4B4: .4byte 0x02023D27
_0803D4B8: .4byte 0x02024140
_0803D4BC: .4byte 0x02023D26
_0803D4C0: .4byte 0x082EC600
_0803D4C4: .4byte 0x02023D10
_0803D4C8: .4byte 0x02023F24
_0803D4CC: .4byte 0xFFEFFFFF
_0803D4D0: .4byte 0x03005A64
_0803D4D4: .4byte 0x082EC638
_0803D4D8:
	ldr r0, [r5]
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, r1
	beq _0803D4F0
	ldr r2, _0803D4F8
	ldr r0, [r2]
	ldr r1, _0803D4FC
	ands r0, r1
	ldr r1, _0803D500
	ands r0, r1
	str r0, [r2]
_0803D4F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D4F8: .4byte 0x02023F24
_0803D4FC: .4byte 0xFFFFFDFF
_0803D500: .4byte 0xFFF7FFFF
	thumb_func_end RunTurnActionsFunctions

	thumb_func_start HandleEndTurn_BattleWon
HandleEndTurn_BattleWon: @ 0x0803D504
	push {r4, lr}
	ldr r1, _0803D540
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0803D544
	ldr r2, [r1]
	ldr r0, _0803D548
	ands r0, r2
	cmp r0, #0
	beq _0803D564
	ldr r1, _0803D54C
	ldr r4, _0803D550
	ldrb r0, [r4]
	strh r0, [r1]
	ldr r1, _0803D554
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r1, _0803D558
	strb r0, [r1]
	ldr r1, _0803D55C
	ldr r0, _0803D560
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	b _0803D6E4
	.align 2, 0
_0803D540: .4byte 0x02023D27
_0803D544: .4byte 0x02022C90
_0803D548: .4byte 0x02000002
_0803D54C: .4byte 0x02037290
_0803D550: .4byte 0x02023FDE
_0803D554: .4byte 0x02022C0C
_0803D558: .4byte 0x02023EAF
_0803D55C: .4byte 0x02023EB8
_0803D560: .4byte 0x08288FBD
_0803D564:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0803D5A0
	ldr r0, _0803D58C
	ands r2, r0
	cmp r2, #0
	beq _0803D5A0
	bl BattleStopLowHpSound
	ldr r1, _0803D590
	ldr r0, _0803D594
	str r0, [r1]
	ldr r0, _0803D598
	ldrh r1, [r0]
	ldr r0, _0803D59C
	cmp r1, r0
	bne _0803D58A
	b _0803D6CA
_0803D58A:
	b _0803D6D4
	.align 2, 0
_0803D58C: .4byte 0x043F0900
_0803D590: .4byte 0x02023EB8
_0803D594: .4byte 0x0828900F
_0803D598: .4byte 0x0203886A
_0803D59C: .4byte 0x000003FE
_0803D5A0:
	ldr r0, [r1]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	beq _0803D5AC
	b _0803D6DE
_0803D5AC:
	bl BattleStopLowHpSound
	ldr r1, _0803D5D4
	ldr r0, _0803D5D8
	str r0, [r1]
	ldr r1, _0803D5DC
	ldr r0, _0803D5E0
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	subs r0, #3
	cmp r0, #0x32
	bls _0803D5CA
	b _0803D6D4
_0803D5CA:
	lsls r0, r0, #2
	ldr r1, _0803D5E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803D5D4: .4byte 0x02023EB8
_0803D5D8: .4byte 0x08288EB5
_0803D5DC: .4byte 0x082E383C
_0803D5E0: .4byte 0x0203886A
_0803D5E4: .4byte 0x0803D5E8
_0803D5E8: @ jump table
	.4byte _0803D6C0 @ case 0
	.4byte _0803D6D4 @ case 1
	.4byte _0803D6D4 @ case 2
	.4byte _0803D6D4 @ case 3
	.4byte _0803D6D4 @ case 4
	.4byte _0803D6D4 @ case 5
	.4byte _0803D6C0 @ case 6
	.4byte _0803D6D4 @ case 7
	.4byte _0803D6C0 @ case 8
	.4byte _0803D6D4 @ case 9
	.4byte _0803D6C0 @ case 10
	.4byte _0803D6D4 @ case 11
	.4byte _0803D6D4 @ case 12
	.4byte _0803D6D4 @ case 13
	.4byte _0803D6D4 @ case 14
	.4byte _0803D6D4 @ case 15
	.4byte _0803D6D4 @ case 16
	.4byte _0803D6D4 @ case 17
	.4byte _0803D6D4 @ case 18
	.4byte _0803D6D4 @ case 19
	.4byte _0803D6D4 @ case 20
	.4byte _0803D6D4 @ case 21
	.4byte _0803D6D4 @ case 22
	.4byte _0803D6D4 @ case 23
	.4byte _0803D6D4 @ case 24
	.4byte _0803D6D4 @ case 25
	.4byte _0803D6D4 @ case 26
	.4byte _0803D6D4 @ case 27
	.4byte _0803D6B4 @ case 28
	.4byte _0803D6CA @ case 29
	.4byte _0803D6D4 @ case 30
	.4byte _0803D6D4 @ case 31
	.4byte _0803D6D4 @ case 32
	.4byte _0803D6D4 @ case 33
	.4byte _0803D6D4 @ case 34
	.4byte _0803D6B4 @ case 35
	.4byte _0803D6D4 @ case 36
	.4byte _0803D6D4 @ case 37
	.4byte _0803D6D4 @ case 38
	.4byte _0803D6D4 @ case 39
	.4byte _0803D6D4 @ case 40
	.4byte _0803D6D4 @ case 41
	.4byte _0803D6D4 @ case 42
	.4byte _0803D6D4 @ case 43
	.4byte _0803D6D4 @ case 44
	.4byte _0803D6D4 @ case 45
	.4byte _0803D6C0 @ case 46
	.4byte _0803D6D4 @ case 47
	.4byte _0803D6D4 @ case 48
	.4byte _0803D6D4 @ case 49
	.4byte _0803D6C0 @ case 50
_0803D6B4:
	ldr r0, _0803D6BC
	bl PlayBGM
	b _0803D6E4
	.align 2, 0
_0803D6BC: .4byte 0x00000163
_0803D6C0:
	movs r0, #0xd4
	lsls r0, r0, #1
	bl PlayBGM
	b _0803D6E4
_0803D6CA:
	movs r0, #0xb1
	lsls r0, r0, #1
	bl PlayBGM
	b _0803D6E4
_0803D6D4:
	movs r0, #0xce
	lsls r0, r0, #1
	bl PlayBGM
	b _0803D6E4
_0803D6DE:
	ldr r1, _0803D6F0
	ldr r0, _0803D6F4
	str r0, [r1]
_0803D6E4:
	ldr r1, _0803D6F8
	ldr r0, _0803D6FC
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D6F0: .4byte 0x02023EB8
_0803D6F4: .4byte 0x08288EF2
_0803D6F8: .4byte 0x03005A64
_0803D6FC: .4byte 0x0803D919
	thumb_func_end HandleEndTurn_BattleWon

	thumb_func_start HandleEndTurn_BattleLost
HandleEndTurn_BattleLost: @ 0x0803D700
	push {r4, lr}
	ldr r1, _0803D748
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0803D74C
	ldr r1, [r0]
	ldr r0, _0803D750
	ands r0, r1
	cmp r0, #0
	beq _0803D7BC
	ldr r0, _0803D754
	ands r1, r0
	cmp r1, #0
	beq _0803D784
	ldr r3, _0803D758
	ldrb r2, [r3]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0803D76C
	ldr r1, _0803D75C
	ldr r0, _0803D760
	str r0, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r3]
	ldr r0, _0803D764
	ldr r1, [r0]
	ldr r0, _0803D768
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #8
	orrs r0, r2
	strb r0, [r1]
	b _0803D7C2
	.align 2, 0
_0803D748: .4byte 0x02023D27
_0803D74C: .4byte 0x02022C90
_0803D750: .4byte 0x02000002
_0803D754: .4byte 0x003F0100
_0803D758: .4byte 0x02023FDE
_0803D75C: .4byte 0x02023EB8
_0803D760: .4byte 0x08289F50
_0803D764: .4byte 0x03005AF0
_0803D768: .4byte 0x00000CA9
_0803D76C:
	ldr r1, _0803D77C
	ldr r0, _0803D780
	str r0, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r3]
	b _0803D7C2
	.align 2, 0
_0803D77C: .4byte 0x02023EB8
_0803D780: .4byte 0x08288F93
_0803D784:
	ldr r1, _0803D7A8
	ldr r4, _0803D7AC
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r1, _0803D7B0
	strb r0, [r1]
	ldr r1, _0803D7B4
	ldr r0, _0803D7B8
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	b _0803D7C2
	.align 2, 0
_0803D7A8: .4byte 0x02022C0C
_0803D7AC: .4byte 0x02023FDE
_0803D7B0: .4byte 0x02023EAF
_0803D7B4: .4byte 0x02023EB8
_0803D7B8: .4byte 0x08288FBD
_0803D7BC:
	ldr r1, _0803D7D0
	ldr r0, _0803D7D4
	str r0, [r1]
_0803D7C2:
	ldr r1, _0803D7D8
	ldr r0, _0803D7DC
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D7D0: .4byte 0x02023EB8
_0803D7D4: .4byte 0x08288EF5
_0803D7D8: .4byte 0x03005A64
_0803D7DC: .4byte 0x0803D919
	thumb_func_end HandleEndTurn_BattleLost

	thumb_func_start HandleEndTurn_RanFromBattle
HandleEndTurn_RanFromBattle: @ 0x0803D7E0
	push {lr}
	ldr r1, _0803D81C
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0803D820
	ldr r2, [r1]
	ldr r0, _0803D824
	ands r0, r2
	cmp r0, #0
	beq _0803D83C
	movs r0, #8
	ands r2, r0
	cmp r2, #0
	beq _0803D83C
	ldr r1, _0803D828
	ldr r0, _0803D82C
	str r0, [r1]
	ldr r1, _0803D830
	movs r0, #9
	strb r0, [r1]
	ldr r0, _0803D834
	ldr r1, [r0]
	ldr r0, _0803D838
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #8
	orrs r0, r2
	strb r0, [r1]
	b _0803D8AA
	.align 2, 0
_0803D81C: .4byte 0x02023D27
_0803D820: .4byte 0x02022C90
_0803D824: .4byte 0x003F0100
_0803D828: .4byte 0x02023EB8
_0803D82C: .4byte 0x08289F49
_0803D830: .4byte 0x02023FDE
_0803D834: .4byte 0x03005AF0
_0803D838: .4byte 0x00000CA9
_0803D83C:
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ands r0, r1
	cmp r0, #0
	beq _0803D864
	ldr r1, _0803D858
	ldr r0, _0803D85C
	str r0, [r1]
	ldr r1, _0803D860
	movs r0, #9
	strb r0, [r1]
	b _0803D8AA
	.align 2, 0
_0803D858: .4byte 0x02023EB8
_0803D85C: .4byte 0x08289F49
_0803D860: .4byte 0x02023FDE
_0803D864:
	ldr r1, _0803D884
	ldr r0, _0803D888
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0803D894
	cmp r0, #2
	beq _0803D8A4
	ldr r1, _0803D88C
	ldr r0, _0803D890
	b _0803D8A8
	.align 2, 0
_0803D884: .4byte 0x02023FE0
_0803D888: .4byte 0x02023EAF
_0803D88C: .4byte 0x02023EB8
_0803D890: .4byte 0x08289078
_0803D894:
	ldr r1, _0803D89C
	ldr r0, _0803D8A0
	b _0803D8A8
	.align 2, 0
_0803D89C: .4byte 0x02023EB8
_0803D8A0: .4byte 0x08289063
_0803D8A4:
	ldr r1, _0803D8B4
	ldr r0, _0803D8B8
_0803D8A8:
	str r0, [r1]
_0803D8AA:
	ldr r1, _0803D8BC
	ldr r0, _0803D8C0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0803D8B4: .4byte 0x02023EB8
_0803D8B8: .4byte 0x08289071
_0803D8BC: .4byte 0x03005A64
_0803D8C0: .4byte 0x0803D919
	thumb_func_end HandleEndTurn_RanFromBattle

	thumb_func_start HandleEndTurn_MonFled
HandleEndTurn_MonFled: @ 0x0803D8C4
	ldr r1, _0803D8F8
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0803D8FC
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #7
	strb r0, [r1, #1]
	ldr r2, _0803D900
	ldrb r0, [r2]
	strb r0, [r1, #2]
	ldr r3, _0803D904
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strb r0, [r1, #3]
	movs r0, #0xff
	strb r0, [r1, #4]
	ldr r1, _0803D908
	ldr r0, _0803D90C
	str r0, [r1]
	ldr r1, _0803D910
	ldr r0, _0803D914
	str r0, [r1]
	bx lr
	.align 2, 0
_0803D8F8: .4byte 0x02023D27
_0803D8FC: .4byte 0x02022C0C
_0803D900: .4byte 0x02023EAF
_0803D904: .4byte 0x02023D12
_0803D908: .4byte 0x02023EB8
_0803D90C: .4byte 0x0828907F
_0803D910: .4byte 0x03005A64
_0803D914: .4byte 0x0803D919
	thumb_func_end HandleEndTurn_MonFled

	thumb_func_start HandleEndTurn_FinishBattle
HandleEndTurn_FinishBattle: @ 0x0803D918
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0803D994
	ldrb r0, [r0]
	subs r0, #0xb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0803D92E
	b _0803DA50
_0803D92E:
	ldr r0, _0803D998
	ldr r1, [r0]
	ldr r0, _0803D99C
	ands r1, r0
	cmp r1, #0
	bne _0803D9F6
	ldr r2, _0803D9A0
	strb r1, [r2]
	ldr r0, _0803D9A4
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0803D9F2
	adds r5, r2, #0
	ldr r0, _0803D9A8
	mov r8, r0
	movs r7, #0x64
	ldr r6, _0803D9AC
_0803D950:
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803D9E0
	ldr r4, _0803D9B0
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0803D9B4
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r7, r0
	adds r0, r0, r6
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r4, #6]
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r7, r0
	adds r0, r0, r6
	movs r1, #2
	adds r2, r4, #0
	adds r2, #8
	bl GetMonData
	b _0803D9E0
	.align 2, 0
_0803D994: .4byte 0x02023D27
_0803D998: .4byte 0x02022C90
_0803D99C: .4byte 0x023F0B92
_0803D9A0: .4byte 0x02023D08
_0803D9A4: .4byte 0x02023D10
_0803D9A8: .4byte 0x02023D12
_0803D9AC: .4byte 0x02024190
_0803D9B0: .4byte 0x03005A70
_0803D9B4:
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r7, r0
	adds r0, r0, r6
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r4, #0x26]
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r7, r0
	adds r0, r0, r6
	movs r1, #2
	adds r2, r4, #0
	adds r2, #0x14
	bl GetMonData
_0803D9E0:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _0803DA30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803D950
_0803D9F2:
	bl PutPokemonTodayCaughtOnAir
_0803D9F6:
	ldr r0, _0803DA34
	ldr r0, [r0]
	ldr r1, _0803DA38
	ands r0, r1
	cmp r0, #0
	bne _0803DA12
	ldr r0, _0803DA3C
	ldrb r1, [r0, #5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803DA12
	bl sub_080EECA4
_0803DA12:
	bl sub_0818619C
	movs r0, #3
	bl BeginFastPaletteFade
	movs r0, #5
	bl FadeOutMapMusic
	ldr r1, _0803DA40
	ldr r0, _0803DA44
	str r0, [r1]
	ldr r1, _0803DA48
	ldr r0, _0803DA4C
	str r0, [r1]
	b _0803DA6A
	.align 2, 0
_0803DA30: .4byte 0x02023D10
_0803DA34: .4byte 0x02022C90
_0803DA38: .4byte 0x023F0B9A
_0803DA3C: .4byte 0x03005A70
_0803DA40: .4byte 0x03005A64
_0803DA44: .4byte 0x0803DA81
_0803DA48: .4byte 0x03005F28
_0803DA4C: .4byte 0x080380FD
_0803DA50:
	ldr r0, _0803DA74
	ldr r0, [r0]
	cmp r0, #0
	bne _0803DA6A
	ldr r1, _0803DA78
	ldr r0, _0803DA7C
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_0803DA6A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803DA74: .4byte 0x02023D0C
_0803DA78: .4byte 0x082EC694
_0803DA7C: .4byte 0x02023EB8
	thumb_func_end HandleEndTurn_FinishBattle

	thumb_func_start FreeResetData_ReturnToOvOrDoEvolutions
FreeResetData_ReturnToOvOrDoEvolutions: @ 0x0803DA80
	push {lr}
	ldr r0, _0803DAAC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803DAC6
	bl ResetSpriteData
	ldr r0, _0803DAB0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803DAA2
	ldr r0, _0803DAB4
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803DAC0
_0803DAA2:
	ldr r1, _0803DAB8
	ldr r0, _0803DABC
	str r0, [r1]
	b _0803DAE2
	.align 2, 0
_0803DAAC: .4byte 0x02037C74
_0803DAB0: .4byte 0x03005AB4
_0803DAB4: .4byte 0x02023FDE
_0803DAB8: .4byte 0x03005A64
_0803DABC: .4byte 0x0803DBB1
_0803DAC0:
	ldr r1, _0803DAE8
	ldr r0, _0803DAEC
	str r0, [r1]
_0803DAC6:
	bl FreeAllWindowBuffers
	ldr r0, _0803DAF0
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0803DAE2
	bl FreeMonSpritesGfx
	bl FreeBattleResources
	bl FreeBattleSpritesData
_0803DAE2:
	pop {r0}
	bx r0
	.align 2, 0
_0803DAE8: .4byte 0x03005A64
_0803DAEC: .4byte 0x0803DAF5
_0803DAF0: .4byte 0x02022C90
	thumb_func_end FreeResetData_ReturnToOvOrDoEvolutions

	thumb_func_start TryEvolvePokemon
TryEvolvePokemon: @ 0x0803DAF4
	push {r4, r5, r6, lr}
	ldr r0, _0803DB4C
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0
	beq _0803DB6E
_0803DB00:
	movs r6, #0
_0803DB02:
	ldrb r2, [r3]
	ldr r0, _0803DB50
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803DB60
	bics r2, r1
	strb r2, [r3]
	movs r0, #0x64
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, _0803DB54
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0
	bl GetEvolutionTargetSpecies
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803DB60
	bl FreeAllWindowBuffers
	ldr r0, _0803DB58
	ldr r1, _0803DB5C
	str r1, [r0]
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl EvolutionScene
	b _0803DB74
	.align 2, 0
_0803DB4C: .4byte 0x03005AB4
_0803DB50: .4byte 0x082FACB4
_0803DB54: .4byte 0x02024190
_0803DB58: .4byte 0x03005A64
_0803DB5C: .4byte 0x0803DB89
_0803DB60:
	adds r6, #1
	ldr r3, _0803DB7C
	cmp r6, #5
	ble _0803DB02
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803DB00
_0803DB6E:
	ldr r1, _0803DB80
	ldr r0, _0803DB84
	str r0, [r1]
_0803DB74:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803DB7C: .4byte 0x03005AB4
_0803DB80: .4byte 0x03005A64
_0803DB84: .4byte 0x0803DBB1
	thumb_func_end TryEvolvePokemon

	thumb_func_start WaitForEvoSceneToFinish
WaitForEvoSceneToFinish: @ 0x0803DB88
	push {lr}
	ldr r0, _0803DBA0
	ldr r1, [r0, #4]
	ldr r0, _0803DBA4
	cmp r1, r0
	bne _0803DB9A
	ldr r1, _0803DBA8
	ldr r0, _0803DBAC
	str r0, [r1]
_0803DB9A:
	pop {r0}
	bx r0
	.align 2, 0
_0803DBA0: .4byte 0x03002360
_0803DBA4: .4byte 0x080380FD
_0803DBA8: .4byte 0x03005A64
_0803DBAC: .4byte 0x0803DAF5
	thumb_func_end WaitForEvoSceneToFinish

	thumb_func_start ReturnFromBattleToOverworld
ReturnFromBattleToOverworld: @ 0x0803DBB0
	push {r4, r5, r6, lr}
	ldr r6, _0803DC34
	ldr r0, [r6]
	movs r5, #2
	ands r0, r5
	cmp r0, #0
	bne _0803DBCC
	ldr r4, _0803DC38
	adds r0, r4, #0
	bl RandomlyGivePartyPokerus
	adds r0, r4, #0
	bl PartySpreadPokerus
_0803DBCC:
	ldr r4, [r6]
	adds r0, r4, #0
	ands r0, r5
	cmp r0, #0
	beq _0803DBDE
	ldr r0, _0803DC3C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803DC2C
_0803DBDE:
	ldr r1, _0803DC40
	ldr r5, _0803DC44
	ldrb r0, [r5]
	strh r0, [r1]
	ldr r3, _0803DC48
	ldr r0, _0803DC4C
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0803DC50
	ldr r0, [r0]
	str r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r4, r0
	cmp r4, #0
	beq _0803DC1E
	ldr r0, _0803DC54
	bl UpdateRoamerHPStatus
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0803DC1A
	cmp r1, #7
	bne _0803DC1E
_0803DC1A:
	bl SetRoamerInactive
_0803DC1E:
	movs r0, #0x5a
	bl m4aSongNumStop
	ldr r0, _0803DC48
	ldr r0, [r0, #8]
	bl SetMainCallback2
_0803DC2C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803DC34: .4byte 0x02022C90
_0803DC38: .4byte 0x02024190
_0803DC3C: .4byte 0x030031C4
_0803DC40: .4byte 0x02037290
_0803DC44: .4byte 0x02023FDE
_0803DC48: .4byte 0x03002360
_0803DC4C: .4byte 0x00000439
_0803DC50: .4byte 0x03005A60
_0803DC54: .4byte 0x020243E8
	thumb_func_end ReturnFromBattleToOverworld

	thumb_func_start RunBattleScriptCommands_PopCallbacksStack
RunBattleScriptCommands_PopCallbacksStack: @ 0x0803DC58
	push {lr}
	ldr r0, _0803DC94
	ldrb r0, [r0]
	subs r0, #0xb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0803DCA0
	ldr r3, _0803DC98
	ldr r0, [r3]
	ldr r0, [r0, #0xc]
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803DC7C
	subs r0, #1
	strb r0, [r1]
_0803DC7C:
	ldr r2, _0803DC9C
	ldr r0, [r3]
	ldr r1, [r0, #0xc]
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	b _0803DCBA
	.align 2, 0
_0803DC94: .4byte 0x02023D27
_0803DC98: .4byte 0x0202414C
_0803DC9C: .4byte 0x03005A64
_0803DCA0:
	ldr r0, _0803DCC0
	ldr r0, [r0]
	cmp r0, #0
	bne _0803DCBA
	ldr r1, _0803DCC4
	ldr r0, _0803DCC8
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_0803DCBA:
	pop {r0}
	bx r0
	.align 2, 0
_0803DCC0: .4byte 0x02023D0C
_0803DCC4: .4byte 0x082EC694
_0803DCC8: .4byte 0x02023EB8
	thumb_func_end RunBattleScriptCommands_PopCallbacksStack

	thumb_func_start sub_0803DCCC
sub_0803DCCC: @ 0x0803DCCC
	push {lr}
	ldr r0, _0803DCEC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803DCE8
	ldr r1, _0803DCF0
	ldr r0, _0803DCF4
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_0803DCE8:
	pop {r0}
	bx r0
	.align 2, 0
_0803DCEC: .4byte 0x02023D0C
_0803DCF0: .4byte 0x082EC694
_0803DCF4: .4byte 0x02023EB8
	thumb_func_end sub_0803DCCC

	thumb_func_start HandleAction_UseMove
HandleAction_UseMove: @ 0x0803DCF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #4
	str r0, [sp]
	ldr r6, _0803DD38
	ldr r1, _0803DD3C
	ldr r0, _0803DD40
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r6]
	ldr r1, _0803DD44
	ldr r3, [r1]
	adds r0, r3, #0
	adds r0, #0x91
	ldrb r2, [r0]
	ldr r1, _0803DD48
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, #0
	beq _0803DD50
	ldr r1, _0803DD4C
	movs r0, #0xc
	b _0803E47C
	.align 2, 0
_0803DD38: .4byte 0x02023EAF
_0803DD3C: .4byte 0x02023D22
_0803DD40: .4byte 0x02023D26
_0803DD44: .4byte 0x02024140
_0803DD48: .4byte 0x082FACB4
_0803DD4C: .4byte 0x02023D27
_0803DD50:
	ldr r1, _0803DDC8
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0803DDCC
	movs r0, #1
	strb r0, [r1, #0xe]
	ldr r5, _0803DDD0
	adds r0, r3, r5
	strb r2, [r0]
	ldr r0, _0803DDD4
	strb r2, [r0]
	ldr r0, _0803DDD8
	strb r2, [r0]
	ldr r0, _0803DDDC
	strb r2, [r0, #6]
	ldr r2, _0803DDE0
	ldr r0, _0803DDE4
	mov sb, r0
	ldrb r0, [r6]
	ldr r3, _0803DDE8
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0x80
	ldrb r0, [r0]
	mov r5, sb
	strb r0, [r5]
	strb r0, [r2]
	ldr r1, _0803DDEC
	ldrb r4, [r6]
	lsls r0, r4, #4
	adds r3, r0, r1
	ldrb r1, [r3]
	lsls r0, r1, #0x1d
	mov r8, r2
	cmp r0, #0
	bge _0803DDFC
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	ldr r2, _0803DDF0
	ldr r1, _0803DDF4
	movs r0, #0xa5
	strh r0, [r1]
	strh r0, [r2]
	ldr r2, _0803DDF8
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xa5
	movs r1, #0
	bl GetMoveTarget
	ldrb r1, [r6]
	ldr r3, _0803DDE8
	ldr r2, [r3]
	b _0803DF56
	.align 2, 0
_0803DDC8: .4byte 0x02023EB5
_0803DDCC: .4byte 0x02024118
_0803DDD0: .4byte 0x000001A3
_0803DDD4: .4byte 0x02023F20
_0803DDD8: .4byte 0x02023EB6
_0803DDDC: .4byte 0x02023FD6
_0803DDE0: .4byte 0x02023E8C
_0803DDE4: .4byte 0x02023E8D
_0803DDE8: .4byte 0x02024140
_0803DDEC: .4byte 0x02023FE0
_0803DDF0: .4byte 0x02023E8E
_0803DDF4: .4byte 0x02023E90
_0803DDF8: .4byte 0x02023F24
_0803DDFC:
	ldr r5, _0803DE34
	mov sl, r5
	movs r0, #0x58
	adds r5, r4, #0
	muls r5, r0, r5
	mov r0, sl
	adds r0, #0x50
	adds r0, r5, r0
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	bne _0803DE22
	movs r7, #0x80
	lsls r7, r7, #0xf
	ands r7, r1
	cmp r7, #0
	beq _0803DE44
_0803DE22:
	ldr r3, _0803DE38
	ldr r2, _0803DE3C
	ldr r1, _0803DE40
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	strh r0, [r3]
	b _0803DF7C
	.align 2, 0
_0803DE34: .4byte 0x02023D28
_0803DE38: .4byte 0x02023E8E
_0803DE3C: .4byte 0x02023E90
_0803DE40: .4byte 0x02023F0C
_0803DE44:
	ldr r1, _0803DE98
	mov ip, r1
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	add r0, ip
	ldrh r3, [r0, #6]
	adds r1, r3, #0
	cmp r1, #0
	beq _0803DF1C
	ldrb r2, [r0, #0xc]
	lsls r0, r2, #1
	adds r0, r0, r5
	mov r4, sl
	adds r4, #0xc
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r1, r0
	bne _0803DEA8
	ldr r2, _0803DE9C
	ldr r0, _0803DEA0
	strh r3, [r0]
	strh r3, [r2]
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0, #0xc]
	mov r3, sb
	strb r0, [r3]
	mov r5, r8
	strb r0, [r5]
	ldrh r0, [r2]
	movs r1, #0
	bl GetMoveTarget
	ldrb r1, [r6]
	ldr r3, _0803DEA4
	ldr r2, [r3]
	b _0803DF56
	.align 2, 0
_0803DE98: .4byte 0x02023F60
_0803DE9C: .4byte 0x02023E8E
_0803DEA0: .4byte 0x02023E90
_0803DEA4: .4byte 0x02024140
_0803DEA8:
	cmp r1, #0
	beq _0803DF1C
	cmp r1, r0
	beq _0803DF1C
	mov r5, sb
	strb r2, [r5]
	mov r0, r8
	strb r2, [r0]
	ldr r3, _0803DF10
	ldr r2, _0803DF14
	ldrb r0, [r0]
	lsls r0, r0, #1
	ldrb r1, [r6]
	movs r5, #0x58
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r2]
	strh r0, [r3]
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	movs r2, #0
	strh r7, [r0, #6]
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	strb r2, [r0, #0xc]
	ldrb r0, [r6]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	ldrb r2, [r1, #0xe]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0xe]
	ldrh r0, [r3]
	movs r1, #0
	bl GetMoveTarget
	ldrb r1, [r6]
	ldr r3, _0803DF18
	ldr r2, [r3]
	b _0803DF56
	.align 2, 0
_0803DF10: .4byte 0x02023E8E
_0803DF14: .4byte 0x02023E90
_0803DF18: .4byte 0x02024140
_0803DF1C:
	ldr r3, _0803DF5C
	mov r5, r8
	ldrb r0, [r5]
	lsls r0, r0, #1
	ldr r4, _0803DF60
	ldrb r2, [r4]
	movs r1, #0x58
	muls r1, r2, r1
	adds r0, r0, r1
	adds r3, #0xc
	adds r0, r0, r3
	ldr r1, _0803DF64
	lsls r2, r2, #1
	adds r2, r2, r1
	ldrh r3, [r0]
	ldrh r2, [r2]
	cmp r3, r2
	beq _0803DF74
	ldr r1, _0803DF68
	ldr r0, _0803DF6C
	strh r3, [r0]
	strh r3, [r1]
	ldrh r0, [r1]
	movs r1, #0
	bl GetMoveTarget
	ldrb r1, [r4]
	ldr r2, _0803DF70
	ldr r2, [r2]
_0803DF56:
	adds r1, r1, r2
	strb r0, [r1, #0xc]
	b _0803DF7C
	.align 2, 0
_0803DF5C: .4byte 0x02023D28
_0803DF60: .4byte 0x02023EAF
_0803DF64: .4byte 0x02023F18
_0803DF68: .4byte 0x02023E8E
_0803DF6C: .4byte 0x02023E90
_0803DF70: .4byte 0x02024140
_0803DF74:
	ldr r1, _0803DFA8
	ldr r0, _0803DFAC
	strh r3, [r0]
	strh r3, [r1]
_0803DF7C:
	ldr r2, _0803DFB0
	ldr r1, _0803DFB4
	ldrb r3, [r1]
	movs r0, #0x58
	muls r0, r3, r0
	adds r0, r0, r2
	ldrh r0, [r0, #0x28]
	mov r8, r1
	cmp r0, #0
	beq _0803DFC4
	adds r0, r3, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803DFBC
	ldr r0, _0803DFB8
	ldr r1, _0803DFA8
	ldrh r1, [r1]
	strh r1, [r0, #0x22]
	b _0803DFC4
	.align 2, 0
_0803DFA8: .4byte 0x02023E8E
_0803DFAC: .4byte 0x02023E90
_0803DFB0: .4byte 0x02023D28
_0803DFB4: .4byte 0x02023EAF
_0803DFB8: .4byte 0x03005A70
_0803DFBC:
	ldr r0, _0803E028
	ldr r1, _0803E02C
	ldrh r1, [r1]
	strh r1, [r0, #0x24]
_0803DFC4:
	mov r1, r8
	ldrb r0, [r1]
	bl GetBattlerSide
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0803E030
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r5, r0, r1
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _0803E040
	ldr r2, _0803E034
	ldr r0, _0803E02C
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _0803E040
	mov r3, r8
	ldrb r0, [r3]
	bl GetBattlerSide
	adds r4, r0, #0
	ldrb r0, [r5, #9]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _0803E040
	ldr r1, _0803E038
	ldrb r2, [r5, #9]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	beq _0803E040
	ldr r0, _0803E03C
	strb r2, [r0]
	b _0803E3AA
	.align 2, 0
_0803E028: .4byte 0x03005A70
_0803E02C: .4byte 0x02023E8E
_0803E030: .4byte 0x02023F38
_0803E034: .4byte 0x082ED220
_0803E038: .4byte 0x02023D28
_0803E03C: .4byte 0x02023EB0
_0803E040:
	ldr r0, _0803E15C
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	ldr r5, _0803E160
	mov r8, r5
	cmp r0, #0
	bne _0803E052
	b _0803E320
_0803E052:
	ldr r1, _0803E164
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r5, [r0, #8]
	cmp r5, #0
	beq _0803E064
	b _0803E270
_0803E064:
	ldr r2, _0803E168
	ldr r0, _0803E16C
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0803E080
	ldrb r0, [r4, #6]
	cmp r0, #0x10
	bne _0803E080
	b _0803E270
_0803E080:
	ldr r3, _0803E170
	ldr r2, _0803E160
	ldrb r6, [r2]
	ldr r0, _0803E174
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r1, [r0, #0xc]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r3
	adds r0, #0x20
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, #0x1f
	bne _0803E0A0
	b _0803E270
_0803E0A0:
	ldrb r0, [r4, #2]
	cmp r0, #0xd
	beq _0803E0A8
	b _0803E270
_0803E0A8:
	adds r0, r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0803E178
	strb r5, [r1]
	ldr r0, _0803E17C
	ldrb r0, [r0]
	cmp r5, r0
	bhs _0803E120
	adds r4, r1, #0
_0803E0C0:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	beq _0803E10E
	ldr r0, _0803E160
	ldrb r1, [r0]
	ldr r0, _0803E174
	ldr r0, [r0]
	adds r1, r1, r0
	ldrb r0, [r1, #0xc]
	ldrb r1, [r4]
	cmp r0, r1
	beq _0803E10E
	ldr r1, _0803E170
	ldrb r2, [r4]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x1f
	bne _0803E10E
	adds r0, r2, #0
	bl GetBattlerTurnOrderNum
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, r3
	bhs _0803E10E
	ldrb r0, [r4]
	bl GetBattlerTurnOrderNum
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
_0803E10E:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _0803E17C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803E0C0
_0803E120:
	ldr r5, [sp]
	cmp r5, #4
	beq _0803E128
	b _0803E222
_0803E128:
	ldr r2, _0803E168
	ldr r0, _0803E180
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #6]
	ands r5, r0
	cmp r5, #0
	beq _0803E1A8
	ldr r0, _0803E160
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E188
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803E184
	movs r0, #1
	b _0803E19A
	.align 2, 0
_0803E15C: .4byte 0x02022C90
_0803E160: .4byte 0x02023EAF
_0803E164: .4byte 0x02023F38
_0803E168: .4byte 0x082ED220
_0803E16C: .4byte 0x02023E8E
_0803E170: .4byte 0x02023D28
_0803E174: .4byte 0x02024140
_0803E178: .4byte 0x02023D08
_0803E17C: .4byte 0x02023D10
_0803E180: .4byte 0x02023E90
_0803E184:
	movs r0, #3
	b _0803E19A
_0803E188:
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803E198
	movs r0, #0
	b _0803E19A
_0803E198:
	movs r0, #2
_0803E19A:
	bl GetBattlerAtPosition
	ldr r1, _0803E1A4
	strb r0, [r1]
	b _0803E1B8
	.align 2, 0
_0803E1A4: .4byte 0x02023EB0
_0803E1A8:
	ldr r2, _0803E1F0
	ldr r0, _0803E1F4
	ldrb r0, [r0]
	ldr r1, _0803E1F8
	ldr r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	strb r0, [r2]
_0803E1B8:
	ldr r7, _0803E1FC
	ldrb r0, [r7]
	ldr r1, _0803E200
	mov r8, r1
	ldr r5, _0803E1F0
	ldrb r1, [r5]
	lsls r1, r1, #2
	add r1, r8
	ldr r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803E1D2
	b _0803E3AA
_0803E1D2:
	ldr r6, _0803E1F4
	ldrb r0, [r6]
	bl GetBattlerSide
	adds r4, r0, #0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _0803E204
	ldrb r0, [r5]
	b _0803E398
	.align 2, 0
_0803E1F0: .4byte 0x02023EB0
_0803E1F4: .4byte 0x02023EAF
_0803E1F8: .4byte 0x02024140
_0803E1FC: .4byte 0x02023EB4
_0803E200: .4byte 0x082FACB4
_0803E204:
	ldrb r0, [r6]
	bl GetBattlerPosition
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	strb r0, [r5]
	ldrb r1, [r7]
	ldrb r2, [r5]
	lsls r0, r2, #2
	add r0, r8
	b _0803E38E
_0803E222:
	ldr r4, _0803E25C
	ldr r0, _0803E260
	ldr r3, [sp]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r2, _0803E264
	movs r1, #0x58
	muls r1, r0, r1
	adds r1, r1, r2
	adds r1, #0x20
	ldrb r1, [r1]
	bl RecordAbilityBattle
	ldr r2, _0803E268
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _0803E26C
	ldrb r0, [r4]
	strb r0, [r1]
	b _0803E3AA
	.align 2, 0
_0803E25C: .4byte 0x02023D08
_0803E260: .4byte 0x02023D22
_0803E264: .4byte 0x02023D28
_0803E268: .4byte 0x02024020
_0803E26C: .4byte 0x02023EB0
_0803E270:
	ldr r0, _0803E2B4
	ldr r0, [r0]
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	beq _0803E320
	ldr r2, _0803E2B8
	ldr r0, _0803E2BC
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #6]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803E320
	mov r5, r8
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E2C4
	bl Random
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0
	beq _0803E2C0
	movs r0, #1
	b _0803E2D6
	.align 2, 0
_0803E2B4: .4byte 0x02022C90
_0803E2B8: .4byte 0x082ED220
_0803E2BC: .4byte 0x02023E90
_0803E2C0:
	movs r0, #3
	b _0803E2D6
_0803E2C4:
	bl Random
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0
	beq _0803E2D4
	movs r0, #0
	b _0803E2D6
_0803E2D4:
	movs r0, #2
_0803E2D6:
	bl GetBattlerAtPosition
	ldr r1, _0803E310
	strb r0, [r1]
	ldr r0, _0803E314
	ldrb r1, [r0]
	ldr r2, _0803E318
	ldr r5, _0803E310
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0803E3AA
	ldr r0, _0803E31C
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, #0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _0803E3AA
	ldrb r0, [r5]
	b _0803E398
	.align 2, 0
_0803E310: .4byte 0x02023EB0
_0803E314: .4byte 0x02023EB4
_0803E318: .4byte 0x082FACB4
_0803E31C: .4byte 0x02023EAF
_0803E320:
	ldr r5, _0803E360
	mov r2, r8
	ldrb r0, [r2]
	ldr r1, _0803E364
	ldr r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	strb r0, [r5]
	ldr r6, _0803E368
	ldrb r1, [r6]
	ldr r7, _0803E36C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0803E3AA
	ldrb r0, [r2]
	bl GetBattlerSide
	adds r4, r0, #0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _0803E370
	ldrb r0, [r5]
	b _0803E398
	.align 2, 0
_0803E360: .4byte 0x02023EB0
_0803E364: .4byte 0x02024140
_0803E368: .4byte 0x02023EB4
_0803E36C: .4byte 0x082FACB4
_0803E370:
	mov r1, r8
	ldrb r0, [r1]
	bl GetBattlerPosition
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	strb r0, [r5]
	ldrb r1, [r6]
	ldrb r2, [r5]
	lsls r0, r2, #2
	adds r0, r0, r7
_0803E38E:
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0803E3AA
	adds r0, r2, #0
_0803E398:
	bl GetBattlerPosition
	movs r1, #2
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	strb r0, [r5]
_0803E3AA:
	ldr r0, _0803E3E0
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #0xa
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _0803E448
	ldr r0, _0803E3E4
	ldr r4, _0803E3E8
	ldrb r2, [r4]
	lsls r1, r2, #4
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _0803E448
	ldr r1, _0803E3EC
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _0803E3F4
	ldr r1, _0803E3F0
	movs r0, #0xc
	b _0803E47C
	.align 2, 0
_0803E3E0: .4byte 0x02022C90
_0803E3E4: .4byte 0x02023FE0
_0803E3E8: .4byte 0x02023EAF
_0803E3EC: .4byte 0x02023D28
_0803E3F0: .4byte 0x02023D27
_0803E3F4:
	ldr r3, _0803E420
	lsls r0, r2, #2
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _0803E42C
	ldr r1, _0803E424
	movs r2, #0
	movs r0, #4
	strb r0, [r1, #5]
	ldr r1, _0803E428
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r1]
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r3
	str r2, [r0]
	b _0803E464
	.align 2, 0
_0803E420: .4byte 0x02023ED4
_0803E424: .4byte 0x02023FD6
_0803E428: .4byte 0x02023EB8
_0803E42C:
	ldr r1, _0803E43C
	movs r0, #4
	strb r0, [r1, #5]
	ldr r1, _0803E440
	ldr r0, _0803E444
	str r0, [r1]
	b _0803E464
	.align 2, 0
_0803E43C: .4byte 0x02023FD6
_0803E440: .4byte 0x02023EB8
_0803E444: .4byte 0x08289C35
_0803E448:
	ldr r4, _0803E490
	ldr r3, _0803E494
	ldr r2, _0803E498
	ldr r0, _0803E49C
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r4]
_0803E464:
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0803E478
	ldr r0, _0803E4A0
	ldrb r0, [r0]
	bl BattleArena_AddMindPoints
_0803E478:
	ldr r1, _0803E4A4
	movs r0, #0xa
_0803E47C:
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E490: .4byte 0x02023EB8
_0803E494: .4byte 0x08286C30
_0803E498: .4byte 0x082ED220
_0803E49C: .4byte 0x02023E8E
_0803E4A0: .4byte 0x02023EAF
_0803E4A4: .4byte 0x02023D27
	thumb_func_end HandleAction_UseMove

	thumb_func_start HandleAction_Switch
HandleAction_Switch: @ 0x0803E4A8
	push {r4, lr}
	ldr r3, _0803E514
	ldr r1, _0803E518
	ldr r0, _0803E51C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _0803E520
	movs r2, #0
	strh r2, [r0]
	ldr r0, _0803E524
	strh r2, [r0]
	ldr r1, _0803E528
	ldrb r0, [r3]
	adds r0, r0, r1
	strb r2, [r0]
	ldr r1, _0803E52C
	ldrb r0, [r3]
	adds r0, r0, r1
	strb r2, [r0]
	ldr r2, _0803E530
	movs r0, #0xfd
	strb r0, [r2]
	movs r0, #7
	strb r0, [r2, #1]
	ldrb r4, [r3]
	strb r4, [r2, #2]
	ldrb r0, [r3]
	ldr r1, _0803E534
	ldr r1, [r1]
	adds r0, r0, r1
	adds r0, #0x58
	ldrb r0, [r0]
	strb r0, [r2, #3]
	movs r0, #0xff
	strb r0, [r2, #4]
	ldr r0, _0803E538
	strb r4, [r0, #0x17]
	ldr r1, _0803E53C
	ldr r0, _0803E540
	str r0, [r1]
	ldr r1, _0803E544
	movs r0, #0xa
	strb r0, [r1]
	ldr r1, _0803E548
	ldrb r0, [r1, #2]
	cmp r0, #0xfe
	bhi _0803E50E
	adds r0, #1
	strb r0, [r1, #2]
_0803E50E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E514: .4byte 0x02023EAF
_0803E518: .4byte 0x02023D22
_0803E51C: .4byte 0x02023D26
_0803E520: .4byte 0x02022AC8
_0803E524: .4byte 0x02022ACA
_0803E528: .4byte 0x02024150
_0803E52C: .4byte 0x02024154
_0803E530: .4byte 0x02022C0C
_0803E534: .4byte 0x02024140
_0803E538: .4byte 0x02024118
_0803E53C: .4byte 0x02023EB8
_0803E540: .4byte 0x0828909D
_0803E544: .4byte 0x02023D27
_0803E548: .4byte 0x03005A70
	thumb_func_end HandleAction_Switch

	thumb_func_start HandleAction_UseItem
HandleAction_UseItem: @ 0x0803E54C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0803E5AC
	ldr r2, _0803E5B0
	ldr r1, _0803E5B4
	ldr r0, _0803E5B8
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r4]
	ldr r0, _0803E5BC
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0803E5C0
	strh r1, [r0]
	ldrb r0, [r4]
	bl ClearFuryCutterDestinyBondGrudge
	ldr r5, _0803E5C4
	ldr r2, _0803E5C8
	ldrb r1, [r4]
	lsls r1, r1, #9
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r3, r0
	strh r3, [r5]
	cmp r3, #0xc
	bhi _0803E5D8
	ldr r2, _0803E5CC
	ldr r1, _0803E5D0
	ldrh r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _0803E5D4
	mov sl, r0
	b _0803E836
	.align 2, 0
_0803E5AC: .4byte 0x02023EAF
_0803E5B0: .4byte 0x02023EB0
_0803E5B4: .4byte 0x02023D22
_0803E5B8: .4byte 0x02023D26
_0803E5BC: .4byte 0x02022AC8
_0803E5C0: .4byte 0x02022ACA
_0803E5C4: .4byte 0x02023EAC
_0803E5C8: .4byte 0x02023508
_0803E5CC: .4byte 0x02023EB8
_0803E5D0: .4byte 0x0828A290
_0803E5D4: .4byte 0x02023D27
_0803E5D8:
	adds r0, r3, #0
	subs r0, #0x50
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0803E600
	ldr r0, _0803E5F4
	ldr r1, _0803E5F8
	ldr r1, [r1]
	str r1, [r0]
	ldr r1, _0803E5FC
	mov sl, r1
	b _0803E836
	.align 2, 0
_0803E5F4: .4byte 0x02023EB8
_0803E5F8: .4byte 0x0828A2DC
_0803E5FC: .4byte 0x02023D27
_0803E600:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E628
	ldr r0, _0803E61C
	ldr r1, _0803E620
	ldr r1, [r1]
	str r1, [r0]
	ldr r2, _0803E624
	mov sl, r2
	b _0803E836
	.align 2, 0
_0803E61C: .4byte 0x02023EB8
_0803E620: .4byte 0x0828A2C4
_0803E624: .4byte 0x02023D27
_0803E628:
	ldr r3, _0803E660
	ldrb r0, [r4]
	strb r0, [r3, #0x17]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	ldr r2, _0803E664
	ldr r1, [r2]
	adds r0, r0, r1
	adds r0, #0xc4
	ldrb r0, [r0]
	subs r0, #1
	mov r8, r4
	ldr r1, _0803E668
	mov sb, r1
	ldr r6, _0803E66C
	mov ip, r3
	adds r7, r2, #0
	ldr r2, _0803E670
	mov sl, r2
	cmp r0, #4
	bls _0803E654
	b _0803E81E
_0803E654:
	lsls r0, r0, #2
	ldr r1, _0803E674
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803E660: .4byte 0x02024118
_0803E664: .4byte 0x02024140
_0803E668: .4byte 0x02023EB8
_0803E66C: .4byte 0x0828A2C4
_0803E670: .4byte 0x02023D27
_0803E674: .4byte 0x0803E678
_0803E678: @ jump table
	.4byte _0803E81E @ case 0
	.4byte _0803E81E @ case 1
	.4byte _0803E68C @ case 2
	.4byte _0803E720 @ case 3
	.4byte _0803E7F0 @ case 4
_0803E68C:
	ldr r5, _0803E6C4
	movs r0, #0
	strb r0, [r5, #5]
	ldr r2, _0803E6C8
	ldrb r0, [r2]
	lsrs r0, r0, #1
	ldr r1, [r7]
	adds r0, r0, r1
	adds r0, #0xc6
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0803E6D8
	movs r0, #0x3e
	ands r0, r1
	ldr r1, _0803E6CC
	mov sb, r1
	ldr r6, _0803E6D0
	ldr r2, _0803E6D4
	mov sl, r2
	cmp r0, #0
	bne _0803E6BE
	b _0803E81E
_0803E6BE:
	movs r0, #5
	strb r0, [r5, #5]
	b _0803E81E
	.align 2, 0
_0803E6C4: .4byte 0x02023FD6
_0803E6C8: .4byte 0x02023EAF
_0803E6CC: .4byte 0x02023EB8
_0803E6D0: .4byte 0x0828A2C4
_0803E6D4: .4byte 0x02023D27
_0803E6D8:
	ldr r0, _0803E714
	mov sb, r0
	ldr r6, _0803E718
	ldr r1, _0803E71C
	mov sl, r1
	mov r4, r8
	adds r3, r7, #0
	adds r2, r5, #0
_0803E6E8:
	ldrb r1, [r4]
	lsrs r1, r1, #1
	ldr r0, [r3]
	adds r1, r1, r0
	adds r1, #0xc6
	ldrb r0, [r1]
	lsrs r0, r0, #1
	strb r0, [r1]
	ldrb r0, [r2, #5]
	adds r0, #1
	strb r0, [r2, #5]
	ldrb r0, [r4]
	lsrs r0, r0, #1
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0xc6
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803E6E8
	b _0803E81E
	.align 2, 0
_0803E714: .4byte 0x02023EB8
_0803E718: .4byte 0x0828A2C4
_0803E71C: .4byte 0x02023D27
_0803E720:
	ldr r3, _0803E754
	movs r0, #4
	strb r0, [r3, #5]
	ldr r2, _0803E758
	ldrb r0, [r2]
	lsrs r0, r0, #1
	ldr r1, [r7]
	adds r0, r0, r1
	adds r6, r0, #0
	adds r6, #0xc6
	ldrb r1, [r6]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r8, r2
	cmp r5, #0
	beq _0803E768
	movs r0, #5
	strb r0, [r3, #5]
	ldr r2, _0803E75C
	mov sb, r2
	ldr r6, _0803E760
	ldr r0, _0803E764
	mov sl, r0
	b _0803E81E
	.align 2, 0
_0803E754: .4byte 0x02023FD6
_0803E758: .4byte 0x02023EAF
_0803E75C: .4byte 0x02023EB8
_0803E760: .4byte 0x0828A2C4
_0803E764: .4byte 0x02023D27
_0803E768:
	ldr r3, _0803E7DC
	movs r4, #0xfd
	strb r4, [r3]
	movs r0, #5
	strb r0, [r3, #1]
	movs r2, #1
	strb r2, [r3, #2]
	movs r0, #0xff
	strb r0, [r3, #3]
	ldr r1, _0803E7E0
	strb r4, [r1]
	strb r5, [r1, #1]
	movs r0, #0xd2
	strb r0, [r1, #2]
	strb r5, [r1, #3]
	subs r0, #0xd3
	strb r0, [r1, #4]
	ldrb r0, [r6]
	ands r2, r0
	ldr r1, _0803E7E4
	mov sb, r1
	ldr r6, _0803E7E8
	ldr r0, _0803E7EC
	mov sl, r0
	cmp r2, #0
	bne _0803E7CC
	mov r5, r8
	adds r4, r7, #0
	adds r2, r3, #0
_0803E7A2:
	ldrb r1, [r5]
	lsrs r1, r1, #1
	ldr r0, [r4]
	adds r1, r1, r0
	adds r1, #0xc6
	ldrb r0, [r1]
	lsrs r0, r0, #1
	strb r0, [r1]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	ldrb r0, [r5]
	lsrs r0, r0, #1
	ldr r1, [r4]
	adds r0, r0, r1
	adds r0, #0xc6
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803E7A2
_0803E7CC:
	ldrb r0, [r3, #2]
	adds r0, #0xe
	movs r1, #0
	mov r2, ip
	strb r0, [r2, #0x10]
	strb r1, [r2, #0x11]
	b _0803E81E
	.align 2, 0
_0803E7DC: .4byte 0x02022C0C
_0803E7E0: .4byte 0x02022C1C
_0803E7E4: .4byte 0x02023EB8
_0803E7E8: .4byte 0x0828A2C4
_0803E7EC: .4byte 0x02023D27
_0803E7F0:
	ldr r0, _0803E804
	ldr r1, [r0]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0803E80C
	ldr r1, _0803E808
	movs r0, #2
	strb r0, [r1, #5]
	b _0803E810
	.align 2, 0
_0803E804: .4byte 0x02022C90
_0803E808: .4byte 0x02023FD6
_0803E80C:
	ldr r0, _0803E84C
	strb r1, [r0, #5]
_0803E810:
	ldr r0, _0803E850
	mov r8, r0
	ldr r1, _0803E854
	mov sb, r1
	ldr r6, _0803E858
	ldr r2, _0803E85C
	mov sl, r2
_0803E81E:
	mov r1, r8
	ldrb r0, [r1]
	lsrs r0, r0, #1
	ldr r1, [r7]
	adds r0, r0, r1
	adds r0, #0xc4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	mov r2, sb
	str r0, [r2]
_0803E836:
	movs r0, #0xa
	mov r1, sl
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E84C: .4byte 0x02023FD6
_0803E850: .4byte 0x02023EAF
_0803E854: .4byte 0x02023EB8
_0803E858: .4byte 0x0828A2C4
_0803E85C: .4byte 0x02023D27
	thumb_func_end HandleAction_UseItem

	thumb_func_start TryRunFromBattle
TryRunFromBattle: @ 0x0803E860
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r7, #0
	ldr r1, _0803E88C
	movs r0, #0x58
	muls r0, r5, r0
	adds r1, r0, r1
	ldrh r0, [r1, #0x2e]
	cmp r0, #0xaf
	bne _0803E894
	ldr r1, _0803E890
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #7]
	b _0803E89E
	.align 2, 0
_0803E88C: .4byte 0x02023D28
_0803E890: .4byte 0x020240A8
_0803E894:
	ldrh r0, [r1, #0x2e]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0803E89E:
	ldr r0, _0803E8CC
	strb r5, [r0]
	cmp r1, #0x25
	bne _0803E8DC
	ldr r2, _0803E8D0
	ldr r1, _0803E8D4
	movs r0, #0x58
	muls r0, r5, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x2e]
	strh r0, [r2]
	ldr r0, _0803E8D8
	lsls r2, r5, #4
	adds r2, r2, r0
	ldrb r1, [r2, #1]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #1]
	b _0803E9B0
	.align 2, 0
_0803E8CC: .4byte 0x02023EB3
_0803E8D0: .4byte 0x02023EAC
_0803E8D4: .4byte 0x02023D28
_0803E8D8: .4byte 0x02023FE0
_0803E8DC:
	ldr r0, _0803E968
	mov sl, r0
	movs r2, #0x58
	mov sb, r2
	mov r0, sb
	muls r0, r5, r0
	add r0, sl
	mov r8, r0
	adds r0, #0x20
	ldrb r6, [r0]
	cmp r6, #0x32
	bne _0803E99C
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E978
	ldr r4, _0803E96C
	ldr r1, [r4]
	adds r1, #0x6c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl GetPyramidRunMultiplier
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov r2, r8
	ldrh r0, [r2, #6]
	muls r0, r1, r0
	movs r2, #1
	adds r1, r5, #0
	eors r1, r2
	mov r2, sb
	muls r2, r1, r2
	adds r1, r2, #0
	add r1, sl
	ldrh r1, [r1, #6]
	bl __divsi3
	ldr r1, [r4]
	adds r1, #0x6c
	ldrb r2, [r1]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Random
	movs r1, #0xff
	ands r1, r0
	cmp r4, r1
	bhi _0803E94C
	b _0803EA52
_0803E94C:
	ldr r0, _0803E970
	strb r6, [r0]
	ldr r0, _0803E974
	lsls r2, r5, #4
	adds r2, r2, r0
	ldrb r1, [r2, #1]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	b _0803E9B0
	.align 2, 0
_0803E968: .4byte 0x02023D28
_0803E96C: .4byte 0x02024140
_0803E970: .4byte 0x02023EAE
_0803E974: .4byte 0x02023FE0
_0803E978:
	ldr r0, _0803E994
	strb r6, [r0]
	ldr r0, _0803E998
	lsls r2, r5, #4
	adds r2, r2, r0
	ldrb r1, [r2, #1]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	b _0803E9B0
	.align 2, 0
_0803E994: .4byte 0x02023EAE
_0803E998: .4byte 0x02023FE0
_0803E99C:
	ldr r1, _0803E9B8
	ldr r2, [r1]
	ldr r0, _0803E9BC
	ands r0, r2
	cmp r0, #0
	beq _0803E9C0
	movs r0, #8
	ands r2, r0
	cmp r2, #0
	beq _0803E9C0
_0803E9B0:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _0803EA52
	.align 2, 0
_0803E9B8: .4byte 0x02022C90
_0803E9BC: .4byte 0x043F0100
_0803E9C0:
	ldr r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0803EA46
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E9FC
	bl GetPyramidRunMultiplier
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r4, _0803E9F8
	movs r3, #0x58
	adds r0, r5, #0
	muls r0, r3, r0
	adds r0, r0, r4
	ldrh r0, [r0, #6]
	muls r0, r1, r0
	movs r2, #1
	adds r1, r5, #0
	eors r1, r2
	muls r1, r3, r1
	adds r1, r1, r4
	b _0803EA1A
	.align 2, 0
_0803E9F8: .4byte 0x02023D28
_0803E9FC:
	ldr r3, _0803EA74
	movs r2, #0x58
	adds r0, r5, #0
	muls r0, r2, r0
	adds r4, r0, r3
	movs r1, #1
	adds r0, r5, #0
	eors r0, r1
	muls r0, r2, r0
	adds r1, r0, r3
	ldrh r0, [r4, #6]
	ldrh r2, [r1, #6]
	cmp r0, r2
	bhs _0803EA40
	lsls r0, r0, #7
_0803EA1A:
	ldrh r1, [r1, #6]
	bl __divsi3
	ldr r1, _0803EA78
	ldr r1, [r1]
	adds r1, #0x6c
	ldrb r2, [r1]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Random
	movs r1, #0xff
	ands r1, r0
	cmp r4, r1
	bls _0803EA46
_0803EA40:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803EA46:
	ldr r0, _0803EA78
	ldr r1, [r0]
	adds r1, #0x6c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0803EA52:
	cmp r7, #0
	beq _0803EA64
	ldr r1, _0803EA7C
	ldr r0, _0803EA80
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0803EA84
	movs r0, #4
	strb r0, [r1]
_0803EA64:
	adds r0, r7, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803EA74: .4byte 0x02023D28
_0803EA78: .4byte 0x02024140
_0803EA7C: .4byte 0x02023D26
_0803EA80: .4byte 0x02023D10
_0803EA84: .4byte 0x02023FDE
	thumb_func_end TryRunFromBattle

	thumb_func_start HandleAction_Run
HandleAction_Run: @ 0x0803EA88
	push {r4, r5, r6, lr}
	ldr r4, _0803EAD8
	ldr r1, _0803EADC
	ldr r5, _0803EAE0
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _0803EAE4
	ldr r0, [r0]
	ldr r1, _0803EAE8
	ands r0, r1
	cmp r0, #0
	beq _0803EB4C
	ldr r0, _0803EAEC
	ldrb r1, [r0]
	strb r1, [r5]
	ldr r2, _0803EAF0
	movs r0, #0
	strb r0, [r2]
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803EB20
	adds r4, r2, #0
	ldr r6, _0803EAF4
	ldr r5, _0803EAF8
_0803EABC:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803EAFC
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #3
	bne _0803EB0E
	ldrb r0, [r5]
	movs r1, #2
	b _0803EB0A
	.align 2, 0
_0803EAD8: .4byte 0x02023EAF
_0803EADC: .4byte 0x02023D22
_0803EAE0: .4byte 0x02023D26
_0803EAE4: .4byte 0x02022C90
_0803EAE8: .4byte 0x02000002
_0803EAEC: .4byte 0x02023D10
_0803EAF0: .4byte 0x02023D08
_0803EAF4: .4byte 0x02023EC0
_0803EAF8: .4byte 0x02023FDE
_0803EAFC:
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #3
	bne _0803EB0E
	ldrb r0, [r5]
	movs r1, #1
_0803EB0A:
	orrs r0, r1
	strb r0, [r5]
_0803EB0E:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _0803EB3C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0803EABC
_0803EB20:
	ldr r2, _0803EB40
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0803EB44
	ldr r1, [r0]
	ldr r0, _0803EB48
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #8
	orrs r0, r2
	b _0803EBD6
	.align 2, 0
_0803EB3C: .4byte 0x02023D10
_0803EB40: .4byte 0x02023FDE
_0803EB44: .4byte 0x03005AF0
_0803EB48: .4byte 0x00000CA9
_0803EB4C:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803EB8C
	ldrb r0, [r4]
	bl TryRunFromBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803EBD8
	ldrb r0, [r4]
	bl ClearFuryCutterDestinyBondGrudge
	ldr r1, _0803EB7C
	movs r0, #3
	strb r0, [r1, #5]
	ldr r1, _0803EB80
	ldr r0, _0803EB84
	str r0, [r1]
	ldr r1, _0803EB88
	movs r0, #0xa
	b _0803EBD6
	.align 2, 0
_0803EB7C: .4byte 0x02023FD6
_0803EB80: .4byte 0x02023EB8
_0803EB84: .4byte 0x0828908A
_0803EB88: .4byte 0x02023D27
_0803EB8C:
	ldr r1, _0803EBB4
	ldrb r2, [r4]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0803EBB8
	ands r0, r1
	cmp r0, #0
	beq _0803EBCC
	ldr r1, _0803EBBC
	movs r0, #4
	strb r0, [r1, #5]
	ldr r1, _0803EBC0
	ldr r0, _0803EBC4
	str r0, [r1]
	ldr r1, _0803EBC8
	movs r0, #0xa
	b _0803EBD6
	.align 2, 0
_0803EBB4: .4byte 0x02023D28
_0803EBB8: .4byte 0x0400E000
_0803EBBC: .4byte 0x02023FD6
_0803EBC0: .4byte 0x02023EB8
_0803EBC4: .4byte 0x0828908A
_0803EBC8: .4byte 0x02023D27
_0803EBCC:
	ldr r0, _0803EBE0
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r1, _0803EBE4
	movs r0, #6
_0803EBD6:
	strb r0, [r1]
_0803EBD8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803EBE0: .4byte 0x02023D10
_0803EBE4: .4byte 0x02023FDE
	thumb_func_end HandleAction_Run

	thumb_func_start HandleAction_WatchesCarefully
HandleAction_WatchesCarefully: @ 0x0803EBE8
	ldr r2, _0803EC10
	ldr r1, _0803EC14
	ldr r0, _0803EC18
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _0803EC1C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0803EC20
	strh r1, [r0]
	ldr r1, _0803EC24
	ldr r0, _0803EC28
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _0803EC2C
	movs r0, #0xa
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803EC10: .4byte 0x02023EAF
_0803EC14: .4byte 0x02023D22
_0803EC18: .4byte 0x02023D26
_0803EC1C: .4byte 0x02022AC8
_0803EC20: .4byte 0x02022ACA
_0803EC24: .4byte 0x02023EB8
_0803EC28: .4byte 0x0828A2E0
_0803EC2C: .4byte 0x02023D27
	thumb_func_end HandleAction_WatchesCarefully

	thumb_func_start HandleAction_SafariZoneBallThrow
HandleAction_SafariZoneBallThrow: @ 0x0803EC30
	ldr r2, _0803EC68
	ldr r1, _0803EC6C
	ldr r0, _0803EC70
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _0803EC74
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0803EC78
	strh r1, [r0]
	ldr r1, _0803EC7C
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r1, _0803EC80
	movs r0, #5
	strh r0, [r1]
	ldr r1, _0803EC84
	ldr r0, _0803EC88
	ldr r0, [r0, #0x14]
	str r0, [r1]
	ldr r1, _0803EC8C
	movs r0, #0xa
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803EC68: .4byte 0x02023EAF
_0803EC6C: .4byte 0x02023D22
_0803EC70: .4byte 0x02023D26
_0803EC74: .4byte 0x02022AC8
_0803EC78: .4byte 0x02022ACA
_0803EC7C: .4byte 0x02039D18
_0803EC80: .4byte 0x02023EAC
_0803EC84: .4byte 0x02023EB8
_0803EC88: .4byte 0x0828A290
_0803EC8C: .4byte 0x02023D27
	thumb_func_end HandleAction_SafariZoneBallThrow

	thumb_func_start HandleAction_ThrowPokeblock
HandleAction_ThrowPokeblock: @ 0x0803EC90
	push {r4, r5, r6, lr}
	ldr r3, _0803ED10
	ldr r1, _0803ED14
	ldr r0, _0803ED18
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _0803ED1C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0803ED20
	strh r1, [r0]
	ldr r6, _0803ED24
	ldr r2, _0803ED28
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #1
	strb r0, [r6, #5]
	ldr r1, _0803ED2C
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r2, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r1, _0803ED30
	ldrb r0, [r1, #0x1f]
	cmp r0, #0xfe
	bhi _0803ECD6
	adds r0, #1
	strb r0, [r1, #0x1f]
_0803ECD6:
	ldr r2, _0803ED34
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #2
	bhi _0803ECE8
	adds r0, #1
	strb r0, [r1]
_0803ECE8:
	ldr r0, [r2]
	adds r3, r0, #0
	adds r3, #0x7b
	ldrb r5, [r3]
	adds r4, r5, #0
	cmp r4, #1
	bls _0803ED40
	ldr r2, _0803ED38
	adds r0, #0x7a
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	ldrb r6, [r6, #5]
	adds r0, r0, r6
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r4, r0
	bhs _0803ED3C
	movs r0, #1
	b _0803ED3E
	.align 2, 0
_0803ED10: .4byte 0x02023EAF
_0803ED14: .4byte 0x02023D22
_0803ED18: .4byte 0x02023D26
_0803ED1C: .4byte 0x02022AC8
_0803ED20: .4byte 0x02022ACA
_0803ED24: .4byte 0x02023FD6
_0803ED28: .4byte 0x02023508
_0803ED2C: .4byte 0x02023EAC
_0803ED30: .4byte 0x03005A70
_0803ED34: .4byte 0x02024140
_0803ED38: .4byte 0x082EC664
_0803ED3C:
	subs r0, r5, r0
_0803ED3E:
	strb r0, [r3]
_0803ED40:
	ldr r1, _0803ED54
	ldr r0, _0803ED58
	ldr r0, [r0, #8]
	str r0, [r1]
	ldr r1, _0803ED5C
	movs r0, #0xa
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803ED54: .4byte 0x02023EB8
_0803ED58: .4byte 0x0828A2E0
_0803ED5C: .4byte 0x02023D27
	thumb_func_end HandleAction_ThrowPokeblock

	thumb_func_start HandleAction_GoNear
HandleAction_GoNear: @ 0x0803ED60
	push {r4, lr}
	ldr r2, _0803EDE0
	ldr r1, _0803EDE4
	ldr r0, _0803EDE8
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _0803EDEC
	movs r4, #0
	strh r4, [r0]
	ldr r0, _0803EDF0
	strh r4, [r0]
	ldr r3, _0803EDF4
	ldr r0, [r3]
	adds r2, r0, #0
	adds r2, #0x7c
	ldr r1, _0803EDF8
	adds r0, #0x79
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0x14
	bls _0803EDA2
	movs r0, #0x14
	strb r0, [r1]
_0803EDA2:
	ldr r0, [r3]
	adds r2, r0, #0
	adds r2, #0x7b
	ldr r1, _0803EDFC
	adds r0, #0x79
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	cmp r0, #0x14
	bls _0803EDC8
	movs r0, #0x14
	strb r0, [r1]
_0803EDC8:
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x79
	ldrb r0, [r1]
	cmp r0, #2
	bhi _0803EE04
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0803EE00
	strb r4, [r0, #5]
	b _0803EE0A
	.align 2, 0
_0803EDE0: .4byte 0x02023EAF
_0803EDE4: .4byte 0x02023D22
_0803EDE8: .4byte 0x02023D26
_0803EDEC: .4byte 0x02022AC8
_0803EDF0: .4byte 0x02022ACA
_0803EDF4: .4byte 0x02024140
_0803EDF8: .4byte 0x082EC673
_0803EDFC: .4byte 0x082EC677
_0803EE00: .4byte 0x02023FD6
_0803EE04:
	ldr r1, _0803EE20
	movs r0, #1
	strb r0, [r1, #5]
_0803EE0A:
	ldr r1, _0803EE24
	ldr r0, _0803EE28
	ldr r0, [r0, #4]
	str r0, [r1]
	ldr r1, _0803EE2C
	movs r0, #0xa
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803EE20: .4byte 0x02023FD6
_0803EE24: .4byte 0x02023EB8
_0803EE28: .4byte 0x0828A2E0
_0803EE2C: .4byte 0x02023D27
	thumb_func_end HandleAction_GoNear

	thumb_func_start HandleAction_SafariZoneRun
HandleAction_SafariZoneRun: @ 0x0803EE30
	push {r4, lr}
	ldr r2, _0803EE58
	ldr r1, _0803EE5C
	ldr r4, _0803EE60
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, #0x11
	bl PlaySE
	ldr r0, _0803EE64
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _0803EE68
	movs r0, #4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803EE58: .4byte 0x02023EAF
_0803EE5C: .4byte 0x02023D22
_0803EE60: .4byte 0x02023D26
_0803EE64: .4byte 0x02023D10
_0803EE68: .4byte 0x02023FDE
	thumb_func_end HandleAction_SafariZoneRun

	thumb_func_start HandleAction_WallyBallThrow
HandleAction_WallyBallThrow: @ 0x0803EE6C
	ldr r3, _0803EEB8
	ldr r1, _0803EEBC
	ldr r0, _0803EEC0
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	strb r2, [r3]
	ldr r0, _0803EEC4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0803EEC8
	strh r1, [r0]
	ldr r1, _0803EECC
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #7
	strb r0, [r1, #1]
	strb r2, [r1, #2]
	ldr r2, _0803EED0
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strb r0, [r1, #3]
	movs r0, #0xff
	strb r0, [r1, #4]
	ldr r1, _0803EED4
	ldr r0, _0803EED8
	ldr r0, [r0, #0xc]
	str r0, [r1]
	ldr r1, _0803EEDC
	movs r0, #0xa
	strb r0, [r1]
	ldr r1, _0803EEE0
	movs r0, #0xc
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0803EEB8: .4byte 0x02023EAF
_0803EEBC: .4byte 0x02023D22
_0803EEC0: .4byte 0x02023D26
_0803EEC4: .4byte 0x02022AC8
_0803EEC8: .4byte 0x02022ACA
_0803EECC: .4byte 0x02022C0C
_0803EED0: .4byte 0x02023D12
_0803EED4: .4byte 0x02023EB8
_0803EED8: .4byte 0x0828A2E0
_0803EEDC: .4byte 0x02023D27
_0803EEE0: .4byte 0x02023D1E
	thumb_func_end HandleAction_WallyBallThrow

	thumb_func_start sub_0803EEE4
sub_0803EEE4: @ 0x0803EEE4
	push {lr}
	bl HandleFaintedMonActions
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0803EF00
	ldr r0, _0803EF04
	ldr r0, [r0]
	adds r0, #0x4d
	strb r1, [r0]
	ldr r1, _0803EF08
	movs r0, #0xc
	strb r0, [r1]
_0803EF00:
	pop {r0}
	bx r0
	.align 2, 0
_0803EF04: .4byte 0x02024140
_0803EF08: .4byte 0x02023D27
	thumb_func_end sub_0803EEE4

	thumb_func_start HandleAction_NothingIsFainted
HandleAction_NothingIsFainted: @ 0x0803EF0C
	ldr r1, _0803EF2C
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r3, _0803EF30
	ldr r2, _0803EF34
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r2, _0803EF38
	ldr r0, [r2]
	ldr r1, _0803EF3C
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0803EF2C: .4byte 0x02023D26
_0803EF30: .4byte 0x02023D27
_0803EF34: .4byte 0x02023D1E
_0803EF38: .4byte 0x02023F24
_0803EF3C: .4byte 0xF1E892AF
	thumb_func_end HandleAction_NothingIsFainted

	thumb_func_start HandleAction_ActionFinished
HandleAction_ActionFinished: @ 0x0803EF40
	push {r4, r5, r6, lr}
	ldr r1, _0803EFC8
	ldr r2, _0803EFCC
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r6, _0803EFD0
	ldr r1, [r6]
	adds r0, r0, r1
	adds r0, #0x5c
	movs r1, #6
	strb r1, [r0]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, _0803EFD4
	ldr r1, _0803EFD8
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	bl SpecialStatusesClear
	ldr r2, _0803EFDC
	ldr r0, [r2]
	ldr r1, _0803EFE0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0803EFE4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0803EFE8
	movs r4, #0
	str r4, [r0]
	ldr r0, _0803EFEC
	strb r1, [r0]
	ldr r5, _0803EFF0
	strb r1, [r5, #0x18]
	strb r1, [r5, #0x19]
	ldr r2, _0803EFF4
	ldr r3, _0803EFF8
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	strh r4, [r0]
	ldr r2, _0803EFFC
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	strh r4, [r0]
	ldr r0, [r6]
	strb r1, [r0, #0x13]
	ldr r0, _0803F000
	strh r4, [r0]
	strb r1, [r5, #0x14]
	ldr r0, _0803F004
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r5, #0x16]
	ldr r0, _0803F008
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, #0x20
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803EFC8: .4byte 0x02023D22
_0803EFCC: .4byte 0x02023D26
_0803EFD0: .4byte 0x02024140
_0803EFD4: .4byte 0x02023D27
_0803EFD8: .4byte 0x02023D1E
_0803EFDC: .4byte 0x02023F24
_0803EFE0: .4byte 0xF1E892AF
_0803EFE4: .4byte 0x02023E8E
_0803EFE8: .4byte 0x02023E94
_0803EFEC: .4byte 0x02023F20
_0803EFF0: .4byte 0x02024118
_0803EFF4: .4byte 0x02023EF4
_0803EFF8: .4byte 0x02023EAF
_0803EFFC: .4byte 0x02023EFC
_0803F000: .4byte 0x020240A4
_0803F004: .4byte 0x02023FD6
_0803F008: .4byte 0x0202414C
	thumb_func_end HandleAction_ActionFinished

