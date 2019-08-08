.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start HandleLinkBattleSetup
HandleLinkBattleSetup: @ 0x080324EC
	push {lr}
	ldr r0, _08032524
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803251E
	ldr r0, _08032528
	ldrb r0, [r0]
	cmp r0, #0
	beq _08032506
	bl sub_0800AF5C
_08032506:
	ldr r0, _0803252C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08032512
	bl OpenLink
_08032512:
	ldr r0, _08032530
	movs r1, #0
	bl CreateTask
	bl CreateTasksForSendRecvLinkBuffers
_0803251E:
	pop {r0}
	bx r0
	.align 2, 0
_08032524: .4byte 0x02022C90
_08032528: .4byte 0x0300319C
_0803252C: .4byte 0x030031C4
_08032530: .4byte 0x080B3189
	thumb_func_end HandleLinkBattleSetup

	thumb_func_start SetUpBattleVarsAndBirchZigzagoon
SetUpBattleVarsAndBirchZigzagoon: @ 0x08032534
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r0, _080325D0
	ldr r1, _080325D4
	str r1, [r0]
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0
	ldr r7, _080325D8
	ldr r6, _080325DC
	movs r2, #0
	ldr r5, _080325E0
	ldr r4, _080325E4
	ldr r3, _080325E8
_08032550:
	lsls r0, r1, #2
	adds r0, r0, r7
	str r4, [r0]
	adds r1, r1, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	adds r0, r0, r6
	strb r2, [r0]
	ldr r0, [sp, #0x10]
	adds r0, r0, r5
	strb r2, [r0]
	ldr r0, [sp, #0x10]
	adds r0, #1
	str r0, [sp, #0x10]
	adds r1, r0, #0
	cmp r1, #3
	ble _08032550
	bl HandleLinkBattleSetup
	ldr r0, _080325EC
	movs r5, #0
	str r5, [r0]
	bl ClearBattleAnimationVars
	bl ClearBattleMonForms
	movs r0, #0xf
	bl BattleAI_HandleItemUseBeforeAISetup
	ldr r0, _080325F0
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080325C0
	bl ZeroEnemyPartyMons
	ldr r4, _080325F4
	movs r1, #0x90
	lsls r1, r1, #1
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #0x20
	bl CreateMon
	str r5, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #0xc
	add r2, sp, #0x10
	bl SetMonData
_080325C0:
	ldr r0, _080325F8
	str r5, [r0]
	ldr r0, _080325FC
	strb r5, [r0]
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080325D0: .4byte 0x03005A64
_080325D4: .4byte 0x08039B0D
_080325D8: .4byte 0x03005AC0
_080325DC: .4byte 0x02024150
_080325E0: .4byte 0x02024154
_080325E4: .4byte 0x08057069
_080325E8: .4byte 0x02023D1A
_080325EC: .4byte 0x02023D0C
_080325F0: .4byte 0x02022C90
_080325F4: .4byte 0x020243E8
_080325F8: .4byte 0x02022C98
_080325FC: .4byte 0x02023F30
	thumb_func_end SetUpBattleVarsAndBirchZigzagoon

	thumb_func_start sub_08032600
sub_08032600: @ 0x08032600
	push {r4, r5, lr}
	ldr r0, _08032618
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _0803261C
	movs r0, #1
	bl sub_08184C50
	b _08032622
	.align 2, 0
_08032618: .4byte 0x02022C90
_0803261C:
	movs r0, #2
	bl sub_08184C50
_08032622:
	ldr r4, _08032644
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _08032634
	bl RecordedBattle_RestoreSavedParties
_08032634:
	ldr r0, [r4]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08032648
	bl InitLinkBtlControllers
	b _0803264C
	.align 2, 0
_08032644: .4byte 0x02022C90
_08032648:
	bl InitSinglePlayerBtlControllers
_0803264C:
	bl SetBattlePartyIds
	ldr r0, _080326B0
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0803267A
	movs r4, #0
	ldr r0, _080326B4
	ldrb r1, [r0]
	cmp r4, r1
	bge _0803267A
	adds r5, r0, #0
_08032668:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_081B8A04
	adds r4, #1
	ldrb r0, [r5]
	cmp r4, r0
	blt _08032668
_0803267A:
	movs r4, #0
	ldr r3, _080326B8
	movs r2, #0xd2
	lsls r2, r2, #1
	movs r1, #0
_08032684:
	ldr r0, [r3]
	adds r0, r4, r0
	adds r0, r0, r2
	strb r1, [r0]
	adds r4, #1
	cmp r4, #0x5f
	bls _08032684
	movs r4, #0
	ldr r3, _080326B8
	movs r2, #0x81
	lsls r2, r2, #2
	movs r1, #0
_0803269C:
	ldr r0, [r3]
	adds r0, r4, r0
	adds r0, r0, r2
	strb r1, [r0]
	adds r4, #1
	cmp r4, #0x67
	bls _0803269C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080326B0: .4byte 0x02022C90
_080326B4: .4byte 0x02023D10
_080326B8: .4byte 0x02024140
	thumb_func_end sub_08032600

	thumb_func_start InitSinglePlayerBtlControllers
InitSinglePlayerBtlControllers: @ 0x080326BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080326F4
	ldr r3, [r0]
	movs r5, #0x80
	lsls r5, r5, #0xf
	ands r5, r3
	cmp r5, #0
	beq _0803277C
	ldr r1, _080326F8
	ldr r0, _080326FC
	str r0, [r1]
	movs r4, #0x80
	lsls r4, r4, #0x11
	ands r4, r3
	cmp r4, #0
	beq _0803270C
	ldr r2, _08032700
	ldr r0, _08032704
	str r0, [r2]
	ldr r1, _08032708
	movs r0, #0
	strb r0, [r1]
	b _08032716
	.align 2, 0
_080326F4: .4byte 0x02022C90
_080326F8: .4byte 0x03005A64
_080326FC: .4byte 0x08039B11
_08032700: .4byte 0x03005AC0
_08032704: .4byte 0x08189679
_08032708: .4byte 0x02023D1A
_0803270C:
	ldr r2, _08032760
	ldr r0, _08032764
	str r0, [r2]
	ldr r1, _08032768
	strb r4, [r1]
_08032716:
	ldr r3, _0803276C
	str r3, [r2, #4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, _08032770
	str r0, [r2, #8]
	movs r0, #2
	strb r0, [r1, #2]
	str r3, [r2, #0xc]
	movs r0, #3
	strb r0, [r1, #3]
	ldr r1, _08032774
	movs r0, #4
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	bl sub_081B8A04
	movs r0, #1
	movs r1, #0
	bl sub_081B8A04
	movs r0, #2
	movs r1, #1
	bl sub_081B8A04
	movs r0, #3
	movs r1, #1
	bl sub_081B8A04
	ldr r0, _08032778
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r1, #3
	b _0803290E
	.align 2, 0
_08032760: .4byte 0x03005AC0
_08032764: .4byte 0x0805706D
_08032768: .4byte 0x02023D1A
_0803276C: .4byte 0x0805ED81
_08032770: .4byte 0x081BAA91
_08032774: .4byte 0x02023D10
_08032778: .4byte 0x02023D12
_0803277C:
	movs r7, #1
	adds r0, r3, #0
	ands r0, r7
	cmp r0, #0
	beq _08032788
	b _08032878
_08032788:
	ldr r0, _080327A0
	ldr r2, _080327A4
	str r2, [r0]
	movs r1, #0x80
	ands r1, r3
	mov ip, r2
	cmp r1, #0
	beq _080327B0
	ldr r1, _080327A8
	ldr r0, _080327AC
	b _080327CC
	.align 2, 0
_080327A0: .4byte 0x03005A64
_080327A4: .4byte 0x08039B11
_080327A8: .4byte 0x03005AC0
_080327AC: .4byte 0x081592A9
_080327B0:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r3, r0
	cmp r3, #0
	beq _080327C8
	ldr r1, _080327C0
	ldr r0, _080327C4
	b _080327CC
	.align 2, 0
_080327C0: .4byte 0x03005AC0
_080327C4: .4byte 0x081681C1
_080327C8:
	ldr r1, _08032828
	ldr r0, _0803282C
_080327CC:
	str r0, [r1]
	mov sl, r1
	ldr r4, _08032830
	movs r0, #0
	mov sb, r0
	mov r1, sb
	strb r1, [r4]
	mov r5, sl
	ldr r2, _08032834
	mov r8, r2
	str r2, [r5, #4]
	movs r6, #1
	strb r6, [r4, #1]
	ldr r2, _08032838
	movs r7, #2
	strb r7, [r2]
	ldr r0, _0803283C
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	bne _080327FC
	b _08032B4A
_080327FC:
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r1, r3
	cmp r1, #0
	beq _08032864
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r1, r3
	cmp r1, #0
	beq _0803284C
	mov r1, ip
	ldr r0, _08032840
	str r1, [r0]
	ldr r0, _08032844
	str r0, [r5]
	mov r1, sb
	strb r1, [r4]
	ldr r0, _08032848
	str r0, [r5, #4]
	strb r6, [r4, #1]
	strb r7, [r2]
	b _08032B4A
	.align 2, 0
_08032828: .4byte 0x03005AC0
_0803282C: .4byte 0x0805706D
_08032830: .4byte 0x02023D1A
_08032834: .4byte 0x0805ED81
_08032838: .4byte 0x02023D10
_0803283C: .4byte 0x02022C90
_08032840: .4byte 0x03005A64
_08032844: .4byte 0x08189679
_08032848: .4byte 0x08186219
_0803284C:
	ldr r0, _0803285C
	str r0, [r5, #4]
	strb r1, [r4, #1]
	ldr r0, _08032860
	str r0, [r5]
	strb r6, [r4]
	strb r7, [r2]
	b _08032B4A
	.align 2, 0
_0803285C: .4byte 0x08189679
_08032860: .4byte 0x08186219
_08032864:
	ldr r0, _08032874
	mov r2, sl
	str r0, [r2]
	strb r1, [r4]
	mov r0, r8
	str r0, [r2, #4]
	strb r6, [r4, #1]
	b _08032B4A
	.align 2, 0
_08032874: .4byte 0x08189679
_08032878:
	ldr r1, _08032914
	ldr r2, _08032918
	str r1, [r2]
	ldr r2, _0803291C
	ldr r0, _08032920
	str r0, [r2]
	ldr r4, _08032924
	strb r5, [r4]
	ldr r6, _08032928
	str r6, [r2, #4]
	strb r7, [r4, #1]
	str r0, [r2, #8]
	movs r0, #2
	mov ip, r0
	mov r1, ip
	strb r1, [r4, #2]
	str r6, [r2, #0xc]
	movs r0, #3
	mov r8, r0
	mov r1, r8
	strb r1, [r4, #3]
	ldr r0, _0803292C
	mov sl, r0
	movs r1, #4
	mov sb, r1
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	bne _080328B8
	b _08032B4A
_080328B8:
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08032938
	ldr r0, _08032914
	ldr r1, _08032918
	str r0, [r1]
	ldr r0, _08032930
	str r0, [r2]
	strb r5, [r4]
	str r6, [r2, #4]
	strb r7, [r4, #1]
	str r0, [r2, #8]
	mov r0, ip
	strb r0, [r4, #2]
	str r6, [r2, #0xc]
	mov r1, r8
	strb r1, [r4, #3]
	mov r0, sb
	mov r2, sl
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	bl sub_081B8A04
	movs r0, #1
	movs r1, #0
	bl sub_081B8A04
	movs r0, #2
	movs r1, #1
	bl sub_081B8A04
	movs r0, #3
	movs r1, #1
	bl sub_081B8A04
	ldr r0, _08032934
	strh r5, [r0]
	strh r5, [r0, #2]
	mov r1, r8
_0803290E:
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	b _08032B4A
	.align 2, 0
_08032914: .4byte 0x08039B11
_08032918: .4byte 0x03005A64
_0803291C: .4byte 0x03005AC0
_08032920: .4byte 0x0805706D
_08032924: .4byte 0x02023D1A
_08032928: .4byte 0x0805ED81
_0803292C: .4byte 0x02023D10
_08032930: .4byte 0x08189679
_08032934: .4byte 0x02023D12
_08032938:
	movs r5, #0x40
	ands r5, r3
	cmp r5, #0
	bne _08032942
	b _08032AD4
_08032942:
	ldr r0, _08032970
	ldrb r5, [r0]
	movs r0, #0
	mov sl, r0
	ldr r1, _08032974
	mov ip, r1
	adds r7, r4, #0
	mov r8, r0
	ldr r6, _08032978
	movs r4, #0
	movs r2, #3
	mov sb, r2
_0803295A:
	mov r1, ip
	adds r0, r4, r1
	ldrh r0, [r0, #0x18]
	cmp r0, #2
	bgt _0803297C
	cmp r0, #1
	bge _08032994
	cmp r0, #0
	beq _08032980
	b _0803299E
	.align 2, 0
_08032970: .4byte 0x0203C480
_08032974: .4byte 0x020226A0
_08032978: .4byte 0x02023D12
_0803297C:
	cmp r0, #3
	bne _0803299E
_08032980:
	ldr r0, _08032990
	adds r0, r4, r0
	ldrb r0, [r0, #0x18]
	movs r1, #0
	bl sub_081B8A04
	b _0803299E
	.align 2, 0
_08032990: .4byte 0x020226A0
_08032994:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_081B8A04
_0803299E:
	cmp sl, r5
	bne _080329EE
	ldr r0, _080329C4
	adds r3, r4, r0
	ldrh r1, [r3, #0x18]
	lsls r1, r1, #2
	ldr r2, _080329C8
	adds r1, r1, r2
	ldr r2, _080329CC
	str r2, [r1]
	ldrh r1, [r3, #0x18]
	mov ip, r0
	cmp r1, #2
	bgt _080329D0
	cmp r1, #1
	bge _080329E4
	cmp r1, #0
	beq _080329D4
	b _08032AC4
	.align 2, 0
_080329C4: .4byte 0x020226A0
_080329C8: .4byte 0x03005AC0
_080329CC: .4byte 0x08189679
_080329D0:
	cmp r1, #3
	bne _08032AC4
_080329D4:
	mov r1, ip
	adds r0, r4, r1
	ldrh r1, [r0, #0x18]
	adds r1, r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, #0x18]
	b _08032AAA
_080329E4:
	adds r1, r1, r7
	movs r0, #2
	strb r0, [r1]
	ldrh r0, [r3, #0x18]
	b _08032ABC
_080329EE:
	ldr r2, _08032A14
	adds r0, r4, r2
	ldrh r1, [r0, #0x18]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	bne _08032A18
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	add r0, ip
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08032A2A
	b _08032A70
	.align 2, 0
_08032A14: .4byte 0x020226A0
_08032A18:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	add r0, ip
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08032A70
_08032A2A:
	mov r0, ip
	adds r2, r4, r0
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #2
	ldr r1, _08032A4C
	adds r0, r0, r1
	ldr r1, _08032A50
	str r1, [r0]
	ldrh r1, [r2, #0x18]
	cmp r1, #2
	bgt _08032A54
	cmp r1, #1
	bge _08032A68
	cmp r1, #0
	beq _08032A58
	b _08032AC4
	.align 2, 0
_08032A4C: .4byte 0x03005AC0
_08032A50: .4byte 0x08189679
_08032A54:
	cmp r1, #3
	bne _08032AC4
_08032A58:
	mov r2, ip
	adds r0, r4, r2
	ldrh r1, [r0, #0x18]
	adds r1, r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, #0x18]
	b _08032AAA
_08032A68:
	adds r1, r1, r7
	movs r0, #2
	strb r0, [r1]
	b _08032ABA
_08032A70:
	mov r0, ip
	adds r2, r4, r0
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #2
	ldr r1, _08032A90
	adds r0, r0, r1
	ldr r1, _08032A94
	str r1, [r0]
	ldrh r0, [r2, #0x18]
	cmp r0, #2
	bgt _08032A98
	cmp r0, #1
	bge _08032AB4
	cmp r0, #0
	beq _08032A9C
	b _08032AC4
	.align 2, 0
_08032A90: .4byte 0x03005AC0
_08032A94: .4byte 0x08186219
_08032A98:
	cmp r0, #3
	bne _08032AC4
_08032A9C:
	mov r0, ip
	adds r2, r4, r0
	ldrh r0, [r2, #0x18]
	adds r0, r0, r7
	movs r1, #1
	strb r1, [r0]
	ldrh r0, [r2, #0x18]
_08032AAA:
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r1, r8
	strh r1, [r0]
	b _08032AC4
_08032AB4:
	adds r0, r0, r7
	mov r1, sb
	strb r1, [r0]
_08032ABA:
	ldrh r0, [r2, #0x18]
_08032ABC:
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r2, sb
	strh r2, [r0]
_08032AC4:
	adds r4, #0x1c
	movs r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #3
	bgt _08032AD2
	b _0803295A
_08032AD2:
	b _08032B4A
_08032AD4:
	movs r1, #4
	ands r1, r3
	cmp r1, #0
	beq _08032B14
	ldr r0, _08032B00
	str r0, [r2]
	strb r5, [r4]
	str r0, [r2, #8]
	mov r0, ip
	strb r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r3, r0
	cmp r3, #0
	beq _08032B08
	ldr r0, _08032B04
	str r0, [r2, #4]
	strb r7, [r4, #1]
	str r0, [r2, #0xc]
	mov r1, r8
	strb r1, [r4, #3]
	b _08032B4A
	.align 2, 0
_08032B00: .4byte 0x08189679
_08032B04: .4byte 0x08186219
_08032B08:
	str r6, [r2, #4]
	strb r7, [r4, #1]
	str r6, [r2, #0xc]
	mov r2, r8
	strb r2, [r4, #3]
	b _08032B4A
_08032B14:
	ldr r0, _08032B38
	str r0, [r2, #4]
	strb r1, [r4, #1]
	str r0, [r2, #0xc]
	mov r0, ip
	strb r0, [r4, #3]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r3, r0
	cmp r3, #0
	beq _08032B40
	ldr r0, _08032B3C
	str r0, [r2]
	strb r7, [r4]
	str r0, [r2, #8]
	mov r1, r8
	strb r1, [r4, #2]
	b _08032B4A
	.align 2, 0
_08032B38: .4byte 0x08189679
_08032B3C: .4byte 0x08186219
_08032B40:
	str r6, [r2]
	strb r7, [r4]
	str r6, [r2, #8]
	mov r2, r8
	strb r2, [r4, #2]
_08032B4A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end InitSinglePlayerBtlControllers

	thumb_func_start InitLinkBtlControllers
InitLinkBtlControllers: @ 0x08032B58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _08032B94
	ldr r1, [r4]
	movs r5, #1
	adds r3, r1, #0
	ands r3, r5
	cmp r3, #0
	bne _08032BE0
	movs r4, #4
	ands r4, r1
	cmp r4, #0
	beq _08032BB4
	ldr r1, _08032B98
	ldr r0, _08032B9C
	str r0, [r1]
	ldr r2, _08032BA0
	ldr r0, _08032BA4
	str r0, [r2]
	ldr r1, _08032BA8
	strb r3, [r1]
	ldr r0, _08032BAC
	str r0, [r2, #4]
	strb r5, [r1, #1]
	ldr r1, _08032BB0
	movs r0, #2
	b _08032ED2
	.align 2, 0
_08032B94: .4byte 0x02022C90
_08032B98: .4byte 0x03005A64
_08032B9C: .4byte 0x08039B11
_08032BA0: .4byte 0x03005AC0
_08032BA4: .4byte 0x0805706D
_08032BA8: .4byte 0x02023D1A
_08032BAC: .4byte 0x08063F79
_08032BB0: .4byte 0x02023D10
_08032BB4:
	ldr r2, _08032BCC
	ldr r0, _08032BD0
	str r0, [r2, #4]
	ldr r1, _08032BD4
	strb r4, [r1, #1]
	ldr r0, _08032BD8
	str r0, [r2]
	strb r5, [r1]
	ldr r1, _08032BDC
	movs r0, #2
	b _08032ED2
	.align 2, 0
_08032BCC: .4byte 0x03005AC0
_08032BD0: .4byte 0x0805706D
_08032BD4: .4byte 0x02023D1A
_08032BD8: .4byte 0x08063F79
_08032BDC: .4byte 0x02023D10
_08032BE0:
	movs r0, #0x41
	ands r0, r1
	cmp r0, #1
	bne _08032C68
	movs r6, #4
	adds r3, r6, #0
	ands r3, r1
	cmp r3, #0
	beq _08032C30
	ldr r1, _08032C18
	ldr r0, _08032C1C
	str r0, [r1]
	ldr r2, _08032C20
	ldr r4, _08032C24
	str r4, [r2]
	ldr r1, _08032C28
	movs r0, #0
	strb r0, [r1]
	ldr r3, _08032C2C
	str r3, [r2, #4]
	strb r5, [r1, #1]
	str r4, [r2, #8]
	movs r0, #2
	strb r0, [r1, #2]
	str r3, [r2, #0xc]
	movs r0, #3
	strb r0, [r1, #3]
	b _08032C4C
	.align 2, 0
_08032C18: .4byte 0x03005A64
_08032C1C: .4byte 0x08039B11
_08032C20: .4byte 0x03005AC0
_08032C24: .4byte 0x0805706D
_08032C28: .4byte 0x02023D1A
_08032C2C: .4byte 0x08063F79
_08032C30:
	ldr r2, _08032C54
	ldr r0, _08032C58
	str r0, [r2, #4]
	ldr r1, _08032C5C
	strb r3, [r1, #1]
	ldr r3, _08032C60
	str r3, [r2]
	strb r5, [r1]
	str r0, [r2, #0xc]
	movs r0, #2
	strb r0, [r1, #3]
	str r3, [r2, #8]
	movs r0, #3
	strb r0, [r1, #2]
_08032C4C:
	ldr r0, _08032C64
	strb r6, [r0]
	b _08032ED4
	.align 2, 0
_08032C54: .4byte 0x03005AC0
_08032C58: .4byte 0x0805706D
_08032C5C: .4byte 0x02023D1A
_08032C60: .4byte 0x08063F79
_08032C64: .4byte 0x02023D10
_08032C68:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08032D24
	movs r4, #4
	adds r3, r4, #0
	ands r3, r1
	cmp r3, #0
	beq _08032CB4
	ldr r1, _08032C98
	ldr r0, _08032C9C
	str r0, [r1]
	ldr r2, _08032CA0
	ldr r0, _08032CA4
	str r0, [r2]
	ldr r1, _08032CA8
	movs r0, #0
	strb r0, [r1]
	ldr r3, _08032CAC
	str r3, [r2, #4]
	strb r5, [r1, #1]
	ldr r0, _08032CB0
	b _08032CC6
	.align 2, 0
_08032C98: .4byte 0x03005A64
_08032C9C: .4byte 0x08039B11
_08032CA0: .4byte 0x03005AC0
_08032CA4: .4byte 0x0805706D
_08032CA8: .4byte 0x02023D1A
_08032CAC: .4byte 0x0805ED81
_08032CB0: .4byte 0x0814AF71
_08032CB4:
	ldr r2, _08032D08
	ldr r0, _08032D0C
	str r0, [r2]
	ldr r1, _08032D10
	strb r3, [r1]
	ldr r3, _08032D14
	str r3, [r2, #4]
	strb r5, [r1, #1]
	ldr r0, _08032D18
_08032CC6:
	str r0, [r2, #8]
	movs r0, #2
	strb r0, [r1, #2]
	str r3, [r2, #0xc]
	movs r0, #3
	strb r0, [r1, #3]
	ldr r0, _08032D1C
	strb r4, [r0]
	movs r0, #0
	movs r1, #0
	bl sub_081B8A04
	movs r0, #1
	movs r1, #0
	bl sub_081B8A04
	movs r0, #2
	movs r1, #1
	bl sub_081B8A04
	movs r0, #3
	movs r1, #1
	bl sub_081B8A04
	ldr r0, _08032D20
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r1, #3
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	b _08032ED4
	.align 2, 0
_08032D08: .4byte 0x03005AC0
_08032D0C: .4byte 0x0814AF71
_08032D10: .4byte 0x02023D1A
_08032D14: .4byte 0x08063F79
_08032D18: .4byte 0x0805706D
_08032D1C: .4byte 0x02023D10
_08032D20: .4byte 0x02023D12
_08032D24:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08032D3C
	ldr r1, _08032D64
	ldr r0, _08032D68
	str r0, [r1]
_08032D3C:
	movs r0, #0
	mov sl, r0
	ldr r1, _08032D6C
	mov ip, r1
	ldr r7, _08032D70
	mov r8, r0
	ldr r6, _08032D74
	movs r4, #0
	movs r2, #3
	mov sb, r2
_08032D50:
	mov r1, ip
	adds r0, r4, r1
	ldrh r0, [r0, #0x18]
	cmp r0, #2
	bgt _08032D78
	cmp r0, #1
	bge _08032D90
	cmp r0, #0
	beq _08032D7C
	b _08032D9A
	.align 2, 0
_08032D64: .4byte 0x03005A64
_08032D68: .4byte 0x08039B11
_08032D6C: .4byte 0x020226A0
_08032D70: .4byte 0x02023D1A
_08032D74: .4byte 0x02023D12
_08032D78:
	cmp r0, #3
	bne _08032D9A
_08032D7C:
	ldr r0, _08032D8C
	adds r0, r4, r0
	ldrb r0, [r0, #0x18]
	movs r1, #0
	bl sub_081B8A04
	b _08032D9A
	.align 2, 0
_08032D8C: .4byte 0x020226A0
_08032D90:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_081B8A04
_08032D9A:
	cmp sl, r5
	bne _08032DEA
	ldr r0, _08032DC0
	adds r3, r4, r0
	ldrh r1, [r3, #0x18]
	lsls r1, r1, #2
	ldr r2, _08032DC4
	adds r1, r1, r2
	ldr r2, _08032DC8
	str r2, [r1]
	ldrh r1, [r3, #0x18]
	mov ip, r0
	cmp r1, #2
	bgt _08032DCC
	cmp r1, #1
	bge _08032DE0
	cmp r1, #0
	beq _08032DD0
	b _08032EC0
	.align 2, 0
_08032DC0: .4byte 0x020226A0
_08032DC4: .4byte 0x03005AC0
_08032DC8: .4byte 0x0805706D
_08032DCC:
	cmp r1, #3
	bne _08032EC0
_08032DD0:
	mov r1, ip
	adds r0, r4, r1
	ldrh r1, [r0, #0x18]
	adds r1, r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, #0x18]
	b _08032EA6
_08032DE0:
	adds r1, r1, r7
	movs r0, #2
	strb r0, [r1]
	ldrh r0, [r3, #0x18]
	b _08032EB8
_08032DEA:
	ldr r2, _08032E10
	adds r0, r4, r2
	ldrh r1, [r0, #0x18]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	bne _08032E14
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	add r0, ip
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08032E26
	b _08032E6C
	.align 2, 0
_08032E10: .4byte 0x020226A0
_08032E14:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	add r0, ip
	ldrh r1, [r0, #0x18]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08032E6C
_08032E26:
	mov r0, ip
	adds r2, r4, r0
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #2
	ldr r1, _08032E48
	adds r0, r0, r1
	ldr r1, _08032E4C
	str r1, [r0]
	ldrh r1, [r2, #0x18]
	cmp r1, #2
	bgt _08032E50
	cmp r1, #1
	bge _08032E64
	cmp r1, #0
	beq _08032E54
	b _08032EC0
	.align 2, 0
_08032E48: .4byte 0x03005AC0
_08032E4C: .4byte 0x0814AF71
_08032E50:
	cmp r1, #3
	bne _08032EC0
_08032E54:
	mov r2, ip
	adds r0, r4, r2
	ldrh r1, [r0, #0x18]
	adds r1, r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, #0x18]
	b _08032EA6
_08032E64:
	adds r1, r1, r7
	movs r0, #2
	strb r0, [r1]
	b _08032EB6
_08032E6C:
	mov r0, ip
	adds r2, r4, r0
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #2
	ldr r1, _08032E8C
	adds r0, r0, r1
	ldr r1, _08032E90
	str r1, [r0]
	ldrh r0, [r2, #0x18]
	cmp r0, #2
	bgt _08032E94
	cmp r0, #1
	bge _08032EB0
	cmp r0, #0
	beq _08032E98
	b _08032EC0
	.align 2, 0
_08032E8C: .4byte 0x03005AC0
_08032E90: .4byte 0x08063F79
_08032E94:
	cmp r0, #3
	bne _08032EC0
_08032E98:
	mov r0, ip
	adds r2, r4, r0
	ldrh r0, [r2, #0x18]
	adds r0, r0, r7
	movs r1, #1
	strb r1, [r0]
	ldrh r0, [r2, #0x18]
_08032EA6:
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r1, r8
	strh r1, [r0]
	b _08032EC0
_08032EB0:
	adds r0, r0, r7
	mov r1, sb
	strb r1, [r0]
_08032EB6:
	ldrh r0, [r2, #0x18]
_08032EB8:
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r2, sb
	strh r2, [r0]
_08032EC0:
	adds r4, #0x1c
	movs r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #3
	bgt _08032ECE
	b _08032D50
_08032ECE:
	ldr r1, _08032EE4
	movs r0, #4
_08032ED2:
	strb r0, [r1]
_08032ED4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032EE4: .4byte 0x02023D10
	thumb_func_end InitLinkBtlControllers

	thumb_func_start SetBattlePartyIds
SetBattlePartyIds: @ 0x08032EE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08032F08
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08032F00
	b _08033034
_08032F00:
	movs r0, #0
	mov r8, r0
	b _08033012
	.align 2, 0
_08032F08: .4byte 0x02022C90
_08032F0C:
	movs r5, #0
	movs r0, #1
	add r0, r8
	mov sl, r0
	ldr r0, _08032F38
	add r0, r8
	mov sb, r0
	mov r0, r8
	lsls r6, r0, #1
	movs r7, #0
_08032F20:
	mov r0, r8
	cmp r0, #1
	bgt _08032F88
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08032F40
	ldr r0, _08032F3C
	b _08032F42
	.align 2, 0
_08032F38: .4byte 0x02023D1A
_08032F3C: .4byte 0x02024190
_08032F40:
	ldr r0, _08032F80
_08032F42:
	adds r4, r7, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _08033008
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _08033008
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _08033008
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _08033008
	ldr r0, _08032F84
	adds r0, r6, r0
	strh r5, [r0]
	b _08033010
	.align 2, 0
_08032F80: .4byte 0x020243E8
_08032F84: .4byte 0x02023D12
_08032F88:
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08032FB0
	ldr r0, _08032FAC
	adds r4, r7, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _08033008
	adds r0, r4, #0
	movs r1, #0xb
	b _08032FC4
	.align 2, 0
_08032FAC: .4byte 0x02024190
_08032FB0:
	ldr r0, _08033000
	adds r4, r7, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _08033008
	adds r0, r4, #0
	movs r1, #0x41
_08032FC4:
	bl GetMonData
	cmp r0, #0
	beq _08033008
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _08033008
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _08033008
	ldr r1, _08033004
	mov r0, r8
	subs r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _08033008
	adds r0, r6, r1
	strh r5, [r0]
	b _08033010
	.align 2, 0
_08033000: .4byte 0x020243E8
_08033004: .4byte 0x02023D12
_08033008:
	adds r7, #0x64
	adds r5, #1
	cmp r5, #5
	ble _08032F20
_08033010:
	mov r8, sl
_08033012:
	ldr r0, _08033044
	ldrb r0, [r0]
	cmp r8, r0
	bge _0803301C
	b _08032F0C
_0803301C:
	ldr r0, _08033048
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08033034
	ldr r0, _0803304C
	movs r1, #0
	strh r1, [r0, #2]
	movs r1, #3
	strh r1, [r0, #6]
_08033034:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033044: .4byte 0x02023D10
_08033048: .4byte 0x02022C90
_0803304C: .4byte 0x02023D12
	thumb_func_end SetBattlePartyIds

	thumb_func_start PrepareBufferDataTransfer
PrepareBufferDataTransfer: @ 0x08033050
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r5, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08033078
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803307C
	adds r0, r3, #0
	adds r1, r2, #0
	adds r2, r4, #0
	bl PrepareBufferDataTransferLink
	b _080330CE
	.align 2, 0
_08033078: .4byte 0x02022C90
_0803307C:
	cmp r5, #0
	beq _08033086
	cmp r5, #1
	beq _080330B0
	b _080330CE
_08033086:
	movs r3, #0
	cmp r3, r2
	bge _080330CE
	ldr r6, _080330A8
	ldr r5, _080330AC
_08033090:
	ldrb r0, [r5]
	lsls r0, r0, #9
	adds r0, r3, r0
	adds r0, r0, r6
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, #1
	adds r3, #1
	cmp r3, r2
	blt _08033090
	b _080330CE
	.align 2, 0
_080330A8: .4byte 0x02022D08
_080330AC: .4byte 0x02023D08
_080330B0:
	movs r3, #0
	cmp r3, r2
	bge _080330CE
	ldr r6, _080330D4
	ldr r5, _080330D8
_080330BA:
	ldrb r0, [r5]
	lsls r0, r0, #9
	adds r0, r3, r0
	adds r0, r0, r6
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, #1
	adds r3, #1
	cmp r3, r2
	blt _080330BA
_080330CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080330D4: .4byte 0x02023508
_080330D8: .4byte 0x02023D08
	thumb_func_end PrepareBufferDataTransfer

	thumb_func_start CreateTasksForSendRecvLinkBuffers
CreateTasksForSendRecvLinkBuffers: @ 0x080330DC
	push {r4, r5, r6, lr}
	ldr r0, _08033174
	movs r1, #0
	bl CreateTask
	ldr r2, _08033178
	strb r0, [r2]
	ldr r5, _0803317C
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r6, #0
	movs r4, #0
	strh r4, [r0, #0x1e]
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r4, [r0, #0x20]
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r4, [r0, #0x22]
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r4, [r0, #0x24]
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r4, [r0, #0x26]
	ldr r0, _08033180
	movs r1, #0
	bl CreateTask
	ldr r2, _08033184
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r4, [r0, #0x20]
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r4, [r0, #0x22]
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r4, [r0, #0x24]
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r4, [r0, #0x26]
	ldr r0, _08033188
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033174: .4byte 0x0803330D
_08033178: .4byte 0x020229BC
_0803317C: .4byte 0x03005B60
_08033180: .4byte 0x080335F5
_08033184: .4byte 0x020229BD
_08033188: .4byte 0x020229BE
	thumb_func_end CreateTasksForSendRecvLinkBuffers

	thumb_func_start PrepareBufferDataTransferLink
PrepareBufferDataTransferLink: @ 0x0803318C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	movs r1, #3
	mov r0, ip
	bics r0, r1
	adds r0, #4
	mov r8, r0
	ldr r2, _080332EC
	ldr r3, _080332F0
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r0, r2
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	add r0, r8
	adds r0, #9
	movs r1, #0x80
	lsls r1, r1, #5
	adds r5, r2, #0
	cmp r0, r1
	ble _080331DE
	ldrh r0, [r4, #0x24]
	movs r2, #0
	strh r0, [r4, #0x20]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r2, [r0, #0x24]
_080331DE:
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r2, #0x24
	ldrsh r1, [r0, r2]
	ldr r4, _080332F4
	ldr r0, [r4]
	adds r0, r0, r1
	strb r6, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r7, #0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r1, r0
	ldr r0, _080332F8
	ldrb r0, [r0]
	strb r0, [r1, #1]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r2, #0x24
	ldrsh r1, [r0, r2]
	ldr r0, [r4]
	adds r1, r1, r0
	ldr r0, _080332FC
	ldrb r0, [r0]
	strb r0, [r1, #2]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r7, #0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r1, r0
	ldr r0, _08033300
	ldrb r0, [r0]
	strb r0, [r1, #3]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #0x24
	ldrsh r0, [r0, r1]
	ldr r1, [r4]
	adds r0, r0, r1
	mov r2, r8
	strb r2, [r0, #4]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r7, #0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r1, r0
	movs r0, #0xff
	lsls r0, r0, #8
	mov r2, r8
	ands r0, r2
	asrs r0, r0, #8
	strb r0, [r1, #5]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r7, #0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r1, r0
	ldr r0, _08033304
	ldrb r0, [r0]
	strb r0, [r1, #6]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r2, #0x24
	ldrsh r1, [r0, r2]
	ldr r0, [r4]
	adds r1, r1, r0
	ldr r0, _08033308
	ldrb r0, [r0]
	strb r0, [r1, #7]
	movs r2, #0
	cmp r2, ip
	bge _080332CC
	mov sl, r5
	adds r6, r3, #0
_080332AA:
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	movs r7, #0x24
	ldrsh r1, [r0, r7]
	ldr r0, [r4]
	adds r1, r2, r1
	adds r1, r1, r0
	mov r7, sb
	adds r0, r7, r2
	ldrb r0, [r0]
	strb r0, [r1, #8]
	adds r2, #1
	cmp r2, ip
	blt _080332AA
_080332CC:
	ldrb r0, [r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r0, [r1, #0x24]
	add r0, r8
	adds r0, #8
	strh r0, [r1, #0x24]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080332EC: .4byte 0x03005B60
_080332F0: .4byte 0x020229BC
_080332F4: .4byte 0x02024144
_080332F8: .4byte 0x02023D08
_080332FC: .4byte 0x02023EAF
_08033300: .4byte 0x02023EB0
_08033304: .4byte 0x02023EB4
_08033308: .4byte 0x02023EB2
	thumb_func_end PrepareBufferDataTransferLink

	thumb_func_start Task_HandleSendLinkBuffersData
Task_HandleSendLinkBuffersData: @ 0x0803330C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08033334
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0x1e
	ldrsh r0, [r0, r2]
	adds r7, r1, #0
	cmp r0, #5
	bls _08033328
	b _080334D8
_08033328:
	lsls r0, r0, #2
	ldr r1, _08033338
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08033334: .4byte 0x03005B60
_08033338: .4byte 0x0803333C
_0803333C: @ jump table
	.4byte _08033354 @ case 0
	.4byte _08033362 @ case 1
	.4byte _0803337E @ case 2
	.4byte _08033408 @ case 3
	.4byte _0803347E @ case 4
	.4byte _080334BC @ case 5
_08033354:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #0x64
	strh r1, [r0, #0x1c]
	b _0803338E
_08033362:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r7
	ldrh r0, [r1, #0x1c]
	subs r0, #1
	strh r0, [r1, #0x1c]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08033378
	b _080334D8
_08033378:
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	b _080334D6
_0803337E:
	ldr r0, _08033398
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803339C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r7
_0803338E:
	ldrh r1, [r0, #0x1e]
	adds r1, #1
	strh r1, [r0, #0x1e]
	b _080334D8
	.align 2, 0
_08033398: .4byte 0x0300319C
_0803339C:
	ldr r0, _080333B0
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080333B4
	movs r5, #2
	b _080333C2
	.align 2, 0
_080333B0: .4byte 0x02022C90
_080333B4:
	movs r0, #0x40
	ands r1, r0
	movs r0, #2
	cmp r1, #0
	beq _080333C0
	movs r0, #4
_080333C0:
	adds r5, r0, #0
_080333C2:
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	bhs _080333D0
	b _080334D8
_080333D0:
	bl IsLinkMaster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080333F4
	bl CheckShouldAdvanceLinkState
	ldr r0, _080333F0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	b _080334D6
	.align 2, 0
_080333F0: .4byte 0x03005B60
_080333F4:
	ldr r0, _08033404
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	b _080334D6
	.align 2, 0
_08033404: .4byte 0x03005B60
_08033408:
	lsls r1, r4, #2
	adds r0, r1, r4
	lsls r0, r0, #3
	adds r2, r0, r7
	movs r3, #0x26
	ldrsh r5, [r2, r3]
	movs r0, #0x24
	ldrsh r6, [r2, r0]
	mov ip, r6
	cmp r5, ip
	beq _080334D8
	ldrh r0, [r2, #0x22]
	movs r6, #0x22
	ldrsh r3, [r2, r6]
	cmp r3, #0
	bne _08033478
	cmp r5, ip
	ble _08033438
	movs r6, #0x20
	ldrsh r0, [r2, r6]
	cmp r5, r0
	bne _08033438
	strh r3, [r2, #0x20]
	strh r3, [r2, #0x26]
_08033438:
	adds r4, r1, r4
	lsls r4, r4, #3
	adds r4, r4, r7
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	ldr r5, _08033474
	ldr r0, [r5]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r1, [r1, #5]
	lsls r1, r1, #8
	orrs r0, r1
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x26
	ldrsh r2, [r4, r1]
	ldr r1, [r5]
	adds r1, r1, r2
	adds r2, r6, #0
	bl SendBlock
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
	b _080334D8
	.align 2, 0
_08033474: .4byte 0x02024144
_08033478:
	subs r0, #1
	strh r0, [r2, #0x22]
	b _080334D8
_0803347E:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080334D8
	ldr r0, _080334B4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r3, #0x26
	ldrsh r2, [r1, r3]
	ldr r0, _080334B8
	ldr r0, [r0]
	adds r2, r2, r0
	ldrb r0, [r2, #4]
	ldrb r2, [r2, #5]
	lsls r2, r2, #8
	movs r3, #1
	strh r3, [r1, #0x22]
	orrs r0, r2
	ldrh r6, [r1, #0x26]
	adds r0, r0, r6
	adds r0, #8
	strh r0, [r1, #0x26]
	b _080334D4
	.align 2, 0
_080334B4: .4byte 0x03005B60
_080334B8: .4byte 0x02024144
_080334BC:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r7
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080334D8
	movs r0, #1
	strh r0, [r1, #0x22]
_080334D4:
	movs r0, #3
_080334D6:
	strh r0, [r1, #0x1e]
_080334D8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_HandleSendLinkBuffersData

	thumb_func_start sub_080334E0
sub_080334E0: @ 0x080334E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0803350C
	ldrb r0, [r0]
	cmp r0, #0
	beq _080335D0
	ldr r0, _08033510
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080335D0
	bl sub_080116BC
	movs r4, #0
	ldr r0, _08033514
	mov sl, r0
	b _080335C4
	.align 2, 0
_0803350C: .4byte 0x030031C4
_08033510: .4byte 0x02022C90
_08033514: .4byte 0x0202207C
_08033518:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080335E0
	lsls r1, r4, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ands r0, r1
	adds r1, r4, #1
	mov sb, r1
	cmp r0, #0
	beq _080335BE
	adds r0, r4, #0
	bl ResetBlockReceivedFlag
	lsls r0, r4, #8
	mov r4, sl
	adds r3, r0, r4
	ldr r1, _080335E4
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r7, _080335E8
	ldr r4, _080335EC
	mov ip, r4
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r7
	movs r0, #0x24
	ldrsh r1, [r2, r0]
	adds r0, r6, #0
	adds r0, #9
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	cmp r1, r0
	ble _08033578
	ldrh r0, [r2, #0x24]
	strh r0, [r2, #0x20]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #0
	strh r1, [r0, #0x24]
_08033578:
	ldr r2, _080335F0
	mov r4, ip
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r4, #0x24
	ldrsh r1, [r0, r4]
	ldr r0, [r2]
	adds r5, r0, r1
	adds r4, r3, #0
	movs r2, #0
	adds r3, r6, #0
	adds r3, #8
	mov r8, r7
	mov r7, ip
	cmp r2, r3
	bge _080335AC
_0803359E:
	adds r0, r5, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, r3
	blt _0803359E
_080335AC:
	ldrb r0, [r7]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	add r1, r8
	ldrh r0, [r1, #0x24]
	adds r0, r6, r0
	adds r0, #8
	strh r0, [r1, #0x24]
_080335BE:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_080335C4:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _08033518
_080335D0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080335E0: .4byte 0x082FACB4
_080335E4: .4byte 0x02022080
_080335E8: .4byte 0x03005B60
_080335EC: .4byte 0x020229BD
_080335F0: .4byte 0x02024148
	thumb_func_end sub_080334E0

	thumb_func_start Task_HandleCopyReceivedLinkBuffersData
Task_HandleCopyReceivedLinkBuffersData: @ 0x080335F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0803365C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r3, r0, r1
	movs r0, #0x26
	ldrsh r2, [r3, r0]
	movs r4, #0x24
	ldrsh r0, [r3, r4]
	cmp r2, r0
	bne _08033618
	b _08033734
_08033618:
	cmp r2, r0
	ble _0803362A
	movs r4, #0x20
	ldrsh r0, [r3, r4]
	cmp r2, r0
	bne _0803362A
	movs r0, #0
	strh r0, [r3, #0x20]
	strh r0, [r3, #0x26]
_0803362A:
	lsls r2, r7, #2
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	ldr r3, _08033660
	mov r8, r3
	ldr r0, [r3]
	adds r3, r1, r0
	ldrb r4, [r3, #1]
	ldrb r6, [r3, #4]
	ldrb r0, [r3, #5]
	lsls r0, r0, #8
	orrs r6, r0
	ldrb r0, [r3]
	mov sb, r2
	cmp r0, #1
	beq _080336F4
	cmp r0, #1
	bgt _08033664
	cmp r0, #0
	beq _0803366A
	b _08033722
	.align 2, 0
_0803365C: .4byte 0x03005B60
_08033660: .4byte 0x02024148
_08033664:
	cmp r0, #2
	beq _0803370C
	b _08033722
_0803366A:
	ldr r2, _080336D4
	ldr r1, _080336D8
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08033734
	lsls r0, r4, #9
	ldr r1, _080336DC
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #8
	adds r2, r6, #0
	bl memcpy
	adds r0, r4, #0
	bl sub_0803F490
	ldr r0, _080336E0
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08033722
	ldr r2, _080336E4
	movs r4, #0x26
	ldrsh r0, [r5, r4]
	mov r3, r8
	ldr r1, [r3]
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	strb r0, [r2]
	ldr r2, _080336E8
	movs r4, #0x26
	ldrsh r0, [r5, r4]
	adds r0, r0, r1
	ldrb r0, [r0, #3]
	strb r0, [r2]
	ldr r2, _080336EC
	movs r3, #0x26
	ldrsh r0, [r5, r3]
	adds r0, r0, r1
	ldrb r0, [r0, #6]
	strb r0, [r2]
	ldr r2, _080336F0
	movs r4, #0x26
	ldrsh r0, [r5, r4]
	adds r0, r0, r1
	ldrb r0, [r0, #7]
	strb r0, [r2]
	b _08033722
	.align 2, 0
_080336D4: .4byte 0x02023D0C
_080336D8: .4byte 0x082FACB4
_080336DC: .4byte 0x02022D08
_080336E0: .4byte 0x02022C90
_080336E4: .4byte 0x02023EAF
_080336E8: .4byte 0x02023EB0
_080336EC: .4byte 0x02023EB4
_080336F0: .4byte 0x02023EB2
_080336F4:
	lsls r0, r4, #9
	ldr r1, _08033708
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #8
	adds r2, r6, #0
	bl memcpy
	b _08033722
	.align 2, 0
_08033708: .4byte 0x02023508
_0803370C:
	ldrb r2, [r3, #8]
	ldr r3, _08033740
	ldr r1, _08033744
	lsls r0, r4, #2
	adds r0, r0, r1
	lsls r2, r2, #2
	ldr r1, [r0]
	lsls r1, r2
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
_08033722:
	ldr r0, _08033748
	mov r2, sb
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	adds r0, r6, r0
	adds r0, #8
	strh r0, [r1, #0x26]
_08033734:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033740: .4byte 0x02023D0C
_08033744: .4byte 0x082FACB4
_08033748: .4byte 0x03005B60
	thumb_func_end Task_HandleCopyReceivedLinkBuffersData

	thumb_func_start BtlController_EmitGetMonData
BtlController_EmitGetMonData: @ 0x0803374C
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803376C
	movs r3, #0
	strb r3, [r1]
	strb r4, [r1, #1]
	strb r2, [r1, #2]
	strb r3, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803376C: .4byte 0x020229C4
	thumb_func_end BtlController_EmitGetMonData

	thumb_func_start BtlController_EmitGetRawMonData
BtlController_EmitGetRawMonData: @ 0x08033770
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033794
	movs r4, #0
	movs r3, #1
	strb r3, [r1]
	strb r5, [r1, #1]
	strb r2, [r1, #2]
	strb r4, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033794: .4byte 0x020229C4
	thumb_func_end BtlController_EmitGetRawMonData

	thumb_func_start BtlController_EmitSetMonData
BtlController_EmitSetMonData: @ 0x08033798
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _080337D4
	movs r3, #2
	strb r3, [r0]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
	adds r1, r0, #0
	cmp r5, #0
	beq _080337C6
	adds r3, r1, #3
	adds r2, r5, #0
_080337B8:
	ldrb r0, [r4]
	strb r0, [r3]
	adds r4, #1
	adds r3, #1
	subs r2, #1
	cmp r2, #0
	bne _080337B8
_080337C6:
	adds r2, r5, #3
	adds r0, r6, #0
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080337D4: .4byte 0x020229C4
	thumb_func_end BtlController_EmitSetMonData

	thumb_func_start BtlController_EmitSetRawMonData
BtlController_EmitSetRawMonData: @ 0x080337D8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	ldr r0, _08033814
	movs r2, #3
	strb r2, [r0]
	strb r1, [r0, #1]
	strb r4, [r0, #2]
	adds r5, r0, #0
	cmp r4, #0
	beq _08033804
	adds r1, r5, #3
	adds r2, r4, #0
_080337F6:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, #1
	adds r1, #1
	subs r2, #1
	cmp r2, #0
	bne _080337F6
_08033804:
	adds r2, r4, #3
	adds r0, r6, #0
	adds r1, r5, #0
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033814: .4byte 0x020229C4
	thumb_func_end BtlController_EmitSetRawMonData

	thumb_func_start BtlController_EmitLoadMonSprite
BtlController_EmitLoadMonSprite: @ 0x08033818
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033834
	movs r2, #4
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08033834: .4byte 0x020229C4
	thumb_func_end BtlController_EmitLoadMonSprite

	thumb_func_start BtlController_EmitSwitchInAnim
BtlController_EmitSwitchInAnim: @ 0x08033838
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033858
	movs r3, #5
	strb r3, [r1]
	strb r4, [r1, #1]
	strb r2, [r1, #2]
	strb r3, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033858: .4byte 0x020229C4
	thumb_func_end BtlController_EmitSwitchInAnim

	thumb_func_start BtlController_EmitReturnMonToBall
BtlController_EmitReturnMonToBall: @ 0x0803385C
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033878
	movs r2, #6
	strb r2, [r1]
	strb r3, [r1, #1]
	movs r2, #2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08033878: .4byte 0x020229C4
	thumb_func_end BtlController_EmitReturnMonToBall

	thumb_func_start BtlController_EmitDrawTrainerPic
BtlController_EmitDrawTrainerPic: @ 0x0803387C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033898
	movs r2, #7
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08033898: .4byte 0x020229C4
	thumb_func_end BtlController_EmitDrawTrainerPic

	thumb_func_start BtlController_EmitTrainerSlide
BtlController_EmitTrainerSlide: @ 0x0803389C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080338B8
	movs r2, #8
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080338B8: .4byte 0x020229C4
	thumb_func_end BtlController_EmitTrainerSlide

	thumb_func_start BtlController_EmitTrainerSlideBack
BtlController_EmitTrainerSlideBack: @ 0x080338BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080338D8
	movs r2, #9
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080338D8: .4byte 0x020229C4
	thumb_func_end BtlController_EmitTrainerSlideBack

	thumb_func_start BtlController_EmitFaintAnimation
BtlController_EmitFaintAnimation: @ 0x080338DC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080338F8
	movs r2, #0xa
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080338F8: .4byte 0x020229C4
	thumb_func_end BtlController_EmitFaintAnimation

	thumb_func_start BtlController_EmitPaletteFade
BtlController_EmitPaletteFade: @ 0x080338FC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033918
	movs r2, #0xb
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08033918: .4byte 0x020229C4
	thumb_func_end BtlController_EmitPaletteFade

	thumb_func_start BtlController_EmitSuccessBallThrowAnim
BtlController_EmitSuccessBallThrowAnim: @ 0x0803391C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033938
	movs r2, #0xc
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08033938: .4byte 0x020229C4
	thumb_func_end BtlController_EmitSuccessBallThrowAnim

	thumb_func_start BtlController_EmitBallThrowAnim
BtlController_EmitBallThrowAnim: @ 0x0803393C
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033958
	movs r2, #0xd
	strb r2, [r1]
	strb r3, [r1, #1]
	movs r2, #2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08033958: .4byte 0x020229C4
	thumb_func_end BtlController_EmitBallThrowAnim

	thumb_func_start BtlController_EmitPause
BtlController_EmitPause: @ 0x0803395C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r1, _080339A0
	movs r0, #0xe
	strb r0, [r1]
	strb r4, [r1, #1]
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r5, r1, #0
	cmp r0, #0
	beq _0803398A
	adds r1, r5, #2
	adds r3, r0, #0
_0803397C:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bne _0803397C
_0803398A:
	lsls r2, r4, #1
	adds r2, r2, r4
	adds r2, #2
	adds r0, r6, #0
	adds r1, r5, #0
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080339A0: .4byte 0x020229C4
	thumb_func_end BtlController_EmitPause

	thumb_func_start BtlController_EmitMoveAnimation
BtlController_EmitMoveAnimation: @ 0x080339A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #0x2c]
	mov r8, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r7, _08033A3C
	movs r0, #0
	mov ip, r0
	movs r0, #0xf
	strb r0, [r7]
	strb r1, [r7, #1]
	lsrs r1, r1, #8
	strb r1, [r7, #2]
	strb r2, [r7, #3]
	strb r3, [r7, #4]
	movs r6, #0xff
	lsls r6, r6, #8
	lsrs r3, r3, #8
	strb r3, [r7, #5]
	strb r4, [r7, #6]
	adds r0, r4, #0
	ands r0, r6
	asrs r0, r0, #8
	strb r0, [r7, #7]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r4
	asrs r0, r0, #0x10
	strb r0, [r7, #8]
	lsrs r4, r4, #0x18
	strb r4, [r7, #9]
	strb r5, [r7, #0xa]
	mov r0, r8
	strb r0, [r7, #0xb]
	mov r0, ip
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0xd
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08033A44
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0x4d
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08033A44
	ldr r0, _08033A40
	ldrh r0, [r0]
	strb r0, [r7, #0xc]
	ands r6, r0
	lsrs r0, r6, #8
	strb r0, [r7, #0xd]
	adds r4, r7, #0
	b _08033A4E
	.align 2, 0
_08033A3C: .4byte 0x020229C4
_08033A40: .4byte 0x02024070
_08033A44:
	ldr r0, _08033A78
	movs r1, #0
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	adds r4, r0, #0
_08033A4E:
	movs r0, #0
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	adds r0, r4, #0
	adds r0, #0x10
	ldr r1, [sp, #0x28]
	movs r2, #0x1c
	bl memcpy
	mov r0, sb
	adds r1, r4, #0
	movs r2, #0x2c
	bl PrepareBufferDataTransfer
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033A78: .4byte 0x020229C4
	thumb_func_end BtlController_EmitMoveAnimation

	thumb_func_start BtlController_EmitPrintString
BtlController_EmitPrintString: @ 0x08033A7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08033B40
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _08033B44
	ldrb r0, [r0]
	strb r0, [r2, #1]
	strb r1, [r2, #2]
	lsrs r1, r1, #8
	strb r1, [r2, #3]
	adds r0, r2, #4
	mov ip, r0
	ldr r4, _08033B48
	ldrh r0, [r4]
	strh r0, [r2, #4]
	ldr r0, _08033B4C
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #2]
	ldr r0, _08033B50
	ldrh r0, [r0]
	strh r0, [r1, #4]
	ldr r0, _08033B54
	ldrb r0, [r0]
	strb r0, [r1, #6]
	ldr r0, _08033B58
	ldrb r0, [r0, #0x17]
	strb r0, [r1, #7]
	ldr r0, _08033B5C
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x52
	ldrb r1, [r1]
	mov r3, ip
	strb r1, [r3, #8]
	adds r0, #0xb1
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldr r0, _08033B60
	ldrb r0, [r0]
	strb r0, [r3, #0xa]
	ldr r3, _08033B64
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	mov r1, ip
	strb r0, [r1, #0xb]
	movs r3, #0
	adds r7, r2, #0
	adds r2, #0x10
	ldr r0, _08033B68
	adds r4, r0, #0
	adds r4, #0x20
_08033AFA:
	adds r1, r2, r3
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, #0x58
	adds r3, #1
	cmp r3, #3
	ble _08033AFA
	movs r3, #0
	mov r4, ip
	adds r4, #0x10
	ldr r6, _08033B6C
	mov r2, ip
	adds r2, #0x20
	ldr r5, _08033B70
_08033B16:
	adds r1, r4, r3
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r3
	adds r0, r3, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, #1
	cmp r3, #0xf
	ble _08033B16
	mov r0, r8
	adds r1, r7, #0
	movs r2, #0x34
	bl PrepareBufferDataTransfer
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033B40: .4byte 0x020229C4
_08033B44: .4byte 0x02023FDE
_08033B48: .4byte 0x02023E8E
_08033B4C: .4byte 0x02023E90
_08033B50: .4byte 0x02023EAC
_08033B54: .4byte 0x02023EAE
_08033B58: .4byte 0x02024118
_08033B5C: .4byte 0x02024140
_08033B60: .4byte 0x02023EB3
_08033B64: .4byte 0x082ED220
_08033B68: .4byte 0x02023D28
_08033B6C: .4byte 0x02022C0C
_08033B70: .4byte 0x02022C1C
	thumb_func_end BtlController_EmitPrintString

	thumb_func_start BtlController_EmitPrintSelectionString
BtlController_EmitPrintSelectionString: @ 0x08033B74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08033C14
	movs r0, #0x11
	strb r0, [r2]
	strb r0, [r2, #1]
	strb r1, [r2, #2]
	lsrs r1, r1, #8
	strb r1, [r2, #3]
	adds r0, r2, #4
	mov ip, r0
	ldr r0, _08033C18
	ldrh r0, [r0]
	strh r0, [r2, #4]
	ldr r0, _08033C1C
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #2]
	ldr r0, _08033C20
	ldrh r0, [r0]
	strh r0, [r1, #4]
	ldr r0, _08033C24
	ldrb r0, [r0]
	strb r0, [r1, #6]
	ldr r0, _08033C28
	ldrb r0, [r0, #0x17]
	strb r0, [r1, #7]
	ldr r0, _08033C2C
	ldr r0, [r0]
	adds r0, #0x52
	ldrb r0, [r0]
	strb r0, [r1, #8]
	movs r3, #0
	adds r7, r2, #0
	adds r4, r7, #0
	adds r4, #0x10
	ldr r0, _08033C30
	adds r2, r0, #0
	adds r2, #0x20
_08033BCE:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #0x58
	adds r3, #1
	cmp r3, #3
	ble _08033BCE
	movs r3, #0
	mov r4, ip
	adds r4, #0x10
	ldr r6, _08033C34
	mov r2, ip
	adds r2, #0x20
	ldr r5, _08033C38
_08033BEA:
	adds r1, r4, r3
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r3
	adds r0, r3, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, #1
	cmp r3, #0xf
	ble _08033BEA
	mov r0, r8
	adds r1, r7, #0
	movs r2, #0x34
	bl PrepareBufferDataTransfer
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033C14: .4byte 0x020229C4
_08033C18: .4byte 0x02023E8E
_08033C1C: .4byte 0x02023E90
_08033C20: .4byte 0x02023EAC
_08033C24: .4byte 0x02023EAE
_08033C28: .4byte 0x02024118
_08033C2C: .4byte 0x02024140
_08033C30: .4byte 0x02023D28
_08033C34: .4byte 0x02022C0C
_08033C38: .4byte 0x02022C1C
	thumb_func_end BtlController_EmitPrintSelectionString

	thumb_func_start BtlController_EmitChooseAction
BtlController_EmitChooseAction: @ 0x08033C3C
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _08033C64
	movs r3, #0x12
	strb r3, [r1]
	strb r4, [r1, #1]
	strb r2, [r1, #2]
	lsrs r2, r2, #8
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033C64: .4byte 0x020229C4
	thumb_func_end BtlController_EmitChooseAction

	thumb_func_start BtlController_EmitUnknownYesNoBox
BtlController_EmitUnknownYesNoBox: @ 0x08033C68
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033C84
	movs r2, #0x13
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08033C84: .4byte 0x020229C4
	thumb_func_end BtlController_EmitUnknownYesNoBox

	thumb_func_start BtlController_EmitChooseMove
BtlController_EmitChooseMove: @ 0x08033C88
	push {r4, r5, r6, lr}
	adds r5, r3, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, _08033CC0
	movs r4, #0
	movs r0, #0x14
	strb r0, [r3]
	strb r1, [r3, #1]
	strb r2, [r3, #2]
	strb r4, [r3, #3]
	movs r2, #0
	adds r1, r3, #0
	adds r4, r1, #4
_08033CA4:
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r4]
	adds r4, #1
	adds r2, #1
	cmp r2, #0x13
	bls _08033CA4
	adds r0, r6, #0
	movs r2, #0x18
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033CC0: .4byte 0x020229C4
	thumb_func_end BtlController_EmitChooseMove

	thumb_func_start BtlController_EmitChooseItem
BtlController_EmitChooseItem: @ 0x08033CC4
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08033CF4
	movs r0, #0x15
	strb r0, [r1]
	movs r2, #0
	adds r3, r1, #1
_08033CD6:
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, #1
	adds r2, #1
	cmp r2, #2
	ble _08033CD6
	adds r0, r5, #0
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033CF4: .4byte 0x020229C4
	thumb_func_end BtlController_EmitChooseItem

	thumb_func_start BtlController_EmitChoosePokemon
BtlController_EmitChoosePokemon: @ 0x08033CF8
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _08033D30
	movs r0, #0x16
	strb r0, [r4]
	strb r1, [r4, #1]
	strb r2, [r4, #2]
	strb r3, [r4, #3]
	movs r2, #0
	adds r1, r4, #0
	adds r3, r1, #4
_08033D12:
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, #1
	adds r2, #1
	cmp r2, #2
	ble _08033D12
	adds r0, r5, #0
	movs r2, #8
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033D30: .4byte 0x020229C4
	thumb_func_end BtlController_EmitChoosePokemon

	thumb_func_start BtlController_EmitCmd23
BtlController_EmitCmd23: @ 0x08033D34
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033D50
	movs r2, #0x17
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08033D50: .4byte 0x020229C4
	thumb_func_end BtlController_EmitCmd23

	thumb_func_start BtlController_EmitHealthBarUpdate
BtlController_EmitHealthBarUpdate: @ 0x08033D54
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08033D88
	movs r4, #0
	movs r2, #0x18
	strb r2, [r3]
	strb r4, [r3, #1]
	strb r1, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #8
	ands r1, r2
	asrs r1, r1, #8
	strb r1, [r3, #3]
	adds r1, r3, #0
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033D88: .4byte 0x020229C4
	thumb_func_end BtlController_EmitHealthBarUpdate

	thumb_func_start BtlController_EmitExpUpdate
BtlController_EmitExpUpdate: @ 0x08033D8C
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _08033DBC
	movs r3, #0x19
	strb r3, [r1]
	strb r4, [r1, #1]
	strb r2, [r1, #2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0xff
	lsls r3, r3, #8
	ands r2, r3
	asrs r2, r2, #8
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033DBC: .4byte 0x020229C4
	thumb_func_end BtlController_EmitExpUpdate

	thumb_func_start BtlController_EmitStatusIconUpdate
BtlController_EmitStatusIconUpdate: @ 0x08033DC0
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033E10
	movs r3, #0x1a
	strb r3, [r1]
	strb r4, [r1, #1]
	movs r6, #0xff
	lsls r6, r6, #8
	adds r3, r4, #0
	ands r3, r6
	lsrs r3, r3, #8
	strb r3, [r1, #2]
	movs r5, #0xff
	lsls r5, r5, #0x10
	adds r3, r4, #0
	ands r3, r5
	lsrs r3, r3, #0x10
	strb r3, [r1, #3]
	lsrs r4, r4, #0x18
	strb r4, [r1, #4]
	strb r2, [r1, #5]
	adds r3, r2, #0
	ands r3, r6
	lsrs r3, r3, #8
	strb r3, [r1, #6]
	adds r3, r2, #0
	ands r3, r5
	lsrs r3, r3, #0x10
	strb r3, [r1, #7]
	lsrs r2, r2, #0x18
	strb r2, [r1, #8]
	movs r2, #9
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033E10: .4byte 0x020229C4
	thumb_func_end BtlController_EmitStatusIconUpdate

	thumb_func_start BtlController_EmitStatusAnimation
BtlController_EmitStatusAnimation: @ 0x08033E14
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033E4C
	movs r3, #0x1b
	strb r3, [r1]
	strb r4, [r1, #1]
	strb r2, [r1, #2]
	movs r3, #0xff
	lsls r3, r3, #8
	ands r3, r2
	lsrs r3, r3, #8
	strb r3, [r1, #3]
	movs r3, #0xff
	lsls r3, r3, #0x10
	ands r3, r2
	lsrs r3, r3, #0x10
	strb r3, [r1, #4]
	lsrs r2, r2, #0x18
	strb r2, [r1, #5]
	movs r2, #6
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033E4C: .4byte 0x020229C4
	thumb_func_end BtlController_EmitStatusAnimation

	thumb_func_start BtlController_EmitStatusXor
BtlController_EmitStatusXor: @ 0x08033E50
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08033E6C
	movs r2, #0x1c
	strb r2, [r1]
	strb r3, [r1, #1]
	movs r2, #2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08033E6C: .4byte 0x020229C4
	thumb_func_end BtlController_EmitStatusXor

	thumb_func_start BtlController_EmitDataTransfer
BtlController_EmitDataTransfer: @ 0x08033E70
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, _08033EB4
	movs r0, #0x1d
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r4, [r1, #2]
	lsrs r0, r4, #8
	strb r0, [r1, #3]
	adds r5, r1, #0
	cmp r4, #0
	beq _08033EA0
	adds r1, r5, #4
	adds r3, r4, #0
_08033E92:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bne _08033E92
_08033EA0:
	adds r2, r4, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033EB4: .4byte 0x020229C4
	thumb_func_end BtlController_EmitDataTransfer

	thumb_func_start BtlController_EmitDMA3Transfer
BtlController_EmitDMA3Transfer: @ 0x08033EB8
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r2, _08033F1C
	movs r0, #0x1e
	strb r0, [r2]
	strb r1, [r2, #1]
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r1, #0
	ands r0, r3
	lsrs r0, r0, #8
	strb r0, [r2, #2]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	strb r0, [r2, #3]
	lsrs r1, r1, #0x18
	strb r1, [r2, #4]
	strb r5, [r2, #5]
	adds r0, r5, #0
	ands r0, r3
	lsrs r0, r0, #8
	strb r0, [r2, #6]
	adds r1, r2, #0
	cmp r5, #0
	beq _08033F08
	adds r3, r1, #7
	adds r2, r5, #0
_08033EFA:
	ldrb r0, [r4]
	strb r0, [r3]
	adds r4, #1
	adds r3, #1
	subs r2, #1
	cmp r2, #0
	bne _08033EFA
_08033F08:
	adds r2, r5, #7
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r6, #0
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033F1C: .4byte 0x020229C4
	thumb_func_end BtlController_EmitDMA3Transfer

	thumb_func_start BtlController_EmitPlayBGM
BtlController_EmitPlayBGM: @ 0x08033F20
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, _08033F64
	movs r0, #0x1f
	strb r0, [r1]
	strb r4, [r1, #1]
	lsrs r0, r4, #8
	strb r0, [r1, #2]
	adds r5, r1, #0
	cmp r4, #0
	beq _08033F4E
	adds r1, r5, #3
	adds r3, r4, #0
_08033F40:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bne _08033F40
_08033F4E:
	adds r2, r4, #3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033F64: .4byte 0x020229C4
	thumb_func_end BtlController_EmitPlayBGM

	thumb_func_start BtlController_EmitCmd32
BtlController_EmitCmd32: @ 0x08033F68
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, _08033FAC
	movs r0, #0x20
	strb r0, [r1]
	strb r4, [r1, #1]
	lsrs r0, r4, #8
	strb r0, [r1, #2]
	adds r5, r1, #0
	cmp r4, #0
	beq _08033F96
	adds r1, r5, #3
	adds r3, r4, #0
_08033F88:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bne _08033F88
_08033F96:
	adds r2, r4, #3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl PrepareBufferDataTransfer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033FAC: .4byte 0x020229C4
	thumb_func_end BtlController_EmitCmd32

	thumb_func_start BtlController_EmitTwoReturnValues
BtlController_EmitTwoReturnValues: @ 0x08033FB0
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _08033FD8
	movs r3, #0x21
	strb r3, [r1]
	strb r4, [r1, #1]
	strb r2, [r1, #2]
	lsrs r2, r2, #8
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033FD8: .4byte 0x020229C4
	thumb_func_end BtlController_EmitTwoReturnValues

	thumb_func_start BtlController_EmitChosenMonReturnValue
BtlController_EmitChosenMonReturnValue: @ 0x08033FDC
	push {r4, r5, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _08034010
	movs r0, #0x22
	strb r0, [r2]
	strb r1, [r2, #1]
	movs r3, #0
	adds r1, r2, #2
_08033FF0:
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	cmp r3, #2
	ble _08033FF0
	adds r0, r5, #0
	adds r1, r2, #0
	movs r2, #5
	bl PrepareBufferDataTransfer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034010: .4byte 0x020229C4
	thumb_func_end BtlController_EmitChosenMonReturnValue

	thumb_func_start BtlController_EmitOneReturnValue
BtlController_EmitOneReturnValue: @ 0x08034014
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0803403C
	movs r4, #0
	movs r2, #0x23
	strb r2, [r3]
	strb r1, [r3, #1]
	lsrs r1, r1, #8
	strb r1, [r3, #2]
	strb r4, [r3, #3]
	adds r1, r3, #0
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803403C: .4byte 0x020229C4
	thumb_func_end BtlController_EmitOneReturnValue

	thumb_func_start BtlController_EmitOneReturnValue_Duplicate
BtlController_EmitOneReturnValue_Duplicate: @ 0x08034040
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08034068
	movs r4, #0
	movs r2, #0x24
	strb r2, [r3]
	strb r1, [r3, #1]
	lsrs r1, r1, #8
	strb r1, [r3, #2]
	strb r4, [r3, #3]
	adds r1, r3, #0
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034068: .4byte 0x020229C4
	thumb_func_end BtlController_EmitOneReturnValue_Duplicate

	thumb_func_start BtlController_EmitCmd37
BtlController_EmitCmd37: @ 0x0803406C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08034088
	movs r2, #0x25
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08034088: .4byte 0x020229C4
	thumb_func_end BtlController_EmitCmd37

	thumb_func_start BtlController_EmitCmd38
BtlController_EmitCmd38: @ 0x0803408C
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080340A8
	movs r2, #0x26
	strb r2, [r1]
	strb r3, [r1, #1]
	movs r2, #2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080340A8: .4byte 0x020229C4
	thumb_func_end BtlController_EmitCmd38

	thumb_func_start BtlController_EmitCmd39
BtlController_EmitCmd39: @ 0x080340AC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080340C8
	movs r2, #0x27
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080340C8: .4byte 0x020229C4
	thumb_func_end BtlController_EmitCmd39

	thumb_func_start BtlController_EmitCmd40
BtlController_EmitCmd40: @ 0x080340CC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080340E8
	movs r2, #0x28
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080340E8: .4byte 0x020229C4
	thumb_func_end BtlController_EmitCmd40

	thumb_func_start BtlController_EmitHitAnimation
BtlController_EmitHitAnimation: @ 0x080340EC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08034108
	movs r2, #0x29
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08034108: .4byte 0x020229C4
	thumb_func_end BtlController_EmitHitAnimation

	thumb_func_start BtlController_EmitCmd42
BtlController_EmitCmd42: @ 0x0803410C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08034128
	movs r2, #0x2a
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08034128: .4byte 0x020229C4
	thumb_func_end BtlController_EmitCmd42

	thumb_func_start BtlController_EmitPlaySE
BtlController_EmitPlaySE: @ 0x0803412C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08034154
	movs r4, #0
	movs r2, #0x2b
	strb r2, [r3]
	strb r1, [r3, #1]
	lsrs r1, r1, #8
	strb r1, [r3, #2]
	strb r4, [r3, #3]
	adds r1, r3, #0
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034154: .4byte 0x020229C4
	thumb_func_end BtlController_EmitPlaySE

	thumb_func_start BtlController_EmitPlayFanfareOrBGM
BtlController_EmitPlayFanfareOrBGM: @ 0x08034158
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _08034180
	movs r3, #0x2c
	strb r3, [r4]
	strb r1, [r4, #1]
	lsrs r1, r1, #8
	strb r1, [r4, #2]
	strb r2, [r4, #3]
	adds r1, r4, #0
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034180: .4byte 0x020229C4
	thumb_func_end BtlController_EmitPlayFanfareOrBGM

	thumb_func_start BtlController_EmitFaintingCry
BtlController_EmitFaintingCry: @ 0x08034184
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080341A0
	movs r2, #0x2d
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080341A0: .4byte 0x020229C4
	thumb_func_end BtlController_EmitFaintingCry

	thumb_func_start BtlController_EmitIntroSlide
BtlController_EmitIntroSlide: @ 0x080341A4
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080341C0
	movs r2, #0x2e
	strb r2, [r1]
	strb r3, [r1, #1]
	movs r2, #2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080341C0: .4byte 0x020229C4
	thumb_func_end BtlController_EmitIntroSlide

	thumb_func_start BtlController_EmitIntroTrainerBallThrow
BtlController_EmitIntroTrainerBallThrow: @ 0x080341C4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080341E0
	movs r2, #0x2f
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080341E0: .4byte 0x020229C4
	thumb_func_end BtlController_EmitIntroTrainerBallThrow

	thumb_func_start BtlController_EmitDrawPartyStatusSummary
BtlController_EmitDrawPartyStatusSummary: @ 0x080341E4
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _08034228
	movs r3, #0x30
	strb r3, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1, #1]
	movs r0, #0x80
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	strb r0, [r1, #2]
	strb r3, [r1, #3]
	movs r2, #0
	adds r3, r1, #4
_0803420C:
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, #1
	adds r2, #1
	cmp r2, #0x2f
	ble _0803420C
	adds r0, r5, #0
	movs r2, #0x34
	bl PrepareBufferDataTransfer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034228: .4byte 0x020229C4
	thumb_func_end BtlController_EmitDrawPartyStatusSummary

	thumb_func_start BtlController_EmitHidePartyStatusSummary
BtlController_EmitHidePartyStatusSummary: @ 0x0803422C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08034248
	movs r2, #0x31
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08034248: .4byte 0x020229C4
	thumb_func_end BtlController_EmitHidePartyStatusSummary

	thumb_func_start BtlController_EmitEndBounceEffect
BtlController_EmitEndBounceEffect: @ 0x0803424C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08034268
	movs r2, #0x32
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08034268: .4byte 0x020229C4
	thumb_func_end BtlController_EmitEndBounceEffect

	thumb_func_start BtlController_EmitSpriteInvisibility
BtlController_EmitSpriteInvisibility: @ 0x0803426C
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803428C
	movs r2, #0x33
	strb r2, [r1]
	strb r3, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0803428C: .4byte 0x020229C4
	thumb_func_end BtlController_EmitSpriteInvisibility

	thumb_func_start BtlController_EmitBattleAnimation
BtlController_EmitBattleAnimation: @ 0x08034290
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _080342B8
	movs r3, #0x34
	strb r3, [r1]
	strb r4, [r1, #1]
	strb r2, [r1, #2]
	lsrs r2, r2, #8
	strb r2, [r1, #3]
	movs r2, #4
	bl PrepareBufferDataTransfer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080342B8: .4byte 0x020229C4
	thumb_func_end BtlController_EmitBattleAnimation

	thumb_func_start BtlController_EmitLinkStandbyMsg
BtlController_EmitLinkStandbyMsg: @ 0x080342BC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, _080342E0
	movs r0, #0x35
	strb r0, [r4]
	strb r1, [r4, #1]
	cmp r2, #0
	beq _080342E4
	adds r0, r4, #4
	bl sub_08184F3C
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	b _080342E8
	.align 2, 0
_080342E0: .4byte 0x020229C4
_080342E4:
	strb r2, [r4, #2]
	strb r2, [r4, #3]
_080342E8:
	ldr r1, _080342FC
	ldrb r2, [r1, #2]
	adds r2, #4
	adds r0, r5, #0
	bl PrepareBufferDataTransfer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080342FC: .4byte 0x020229C4
	thumb_func_end BtlController_EmitLinkStandbyMsg

	thumb_func_start BtlController_EmitResetActionMoveSelection
BtlController_EmitResetActionMoveSelection: @ 0x08034300
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803431C
	movs r2, #0x36
	strb r2, [r1]
	strb r3, [r1, #1]
	movs r2, #2
	bl PrepareBufferDataTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0803431C: .4byte 0x020229C4
	thumb_func_end BtlController_EmitResetActionMoveSelection

	thumb_func_start BtlController_EmitCmd55
BtlController_EmitCmd55: @ 0x08034320
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r4, _08034364
	movs r0, #0x37
	strb r0, [r4]
	strb r1, [r4, #1]
	ldr r0, _08034368
	ldr r1, [r0]
	ldr r0, _0803436C
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	strb r0, [r4, #2]
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	strb r0, [r4, #3]
	adds r0, r4, #6
	bl sub_08184F3C
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	ldrb r2, [r4, #4]
	adds r2, #6
	adds r0, r5, #0
	adds r1, r4, #0
	bl PrepareBufferDataTransfer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034364: .4byte 0x020229C4
_08034368: .4byte 0x03005AF0
_0803436C: .4byte 0x00000CA9
	thumb_func_end BtlController_EmitCmd55

