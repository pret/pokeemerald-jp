.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetBattlerSpriteCoord
GetBattlerSpriteCoord: @ 0x080A5534
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5552
	cmp r4, #3
	bne _080A5552
	cmp r5, #3
	bne _080A5552
	movs r4, #1
_080A5552:
	cmp r4, #4
	bhi _080A55C8
	lsls r0, r4, #2
	ldr r1, _080A5560
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A5560: .4byte 0x080A5564
_080A5564: @ jump table
	.4byte _080A5578 @ case 0
	.4byte _080A55A0 @ case 1
	.4byte _080A5578 @ case 2
	.4byte _080A55C8 @ case 3
	.4byte _080A55C8 @ case 4
_080A5578:
	ldr r4, _080A5598
	adds r0, r5, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, _080A559C
	ldr r1, [r1]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	b _080A5678
	.align 2, 0
_080A5598: .4byte 0x084FE664
_080A559C: .4byte 0x02022C90
_080A55A0:
	ldr r4, _080A55C0
	adds r0, r5, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, _080A55C4
	ldr r1, [r1]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0, #1]
	b _080A5678
	.align 2, 0
_080A55C0: .4byte 0x084FE664
_080A55C4: .4byte 0x02022C90
_080A55C8:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A55F0
	ldr r0, _080A55E8
	ldr r0, [r0]
	ldr r2, [r0, #0x18]
	ldrb r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A55EC
	ldrh r1, [r2, #2]
	b _080A5662
	.align 2, 0
_080A55E8: .4byte 0x02039BD4
_080A55EC:
	ldrh r1, [r2]
	b _080A5662
_080A55F0:
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5628
	ldr r0, _080A561C
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080A5660
	ldr r1, _080A5620
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A5624
	b _080A5646
	.align 2, 0
_080A561C: .4byte 0x02024174
_080A5620: .4byte 0x02023D12
_080A5624: .4byte 0x020243E8
_080A5628:
	ldr r0, _080A5654
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080A5660
	ldr r1, _080A5658
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A565C
_080A5646:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _080A5662
	.align 2, 0
_080A5654: .4byte 0x02024174
_080A5658: .4byte 0x02023D12
_080A565C: .4byte 0x02024190
_080A5660:
	ldrh r1, [r1, #2]
_080A5662:
	cmp r4, #3
	bne _080A566C
	adds r0, r5, #0
	movs r2, #1
	b _080A5670
_080A566C:
	adds r0, r5, #0
	movs r2, #0
_080A5670:
	bl GetBattlerSpriteFinal_Y
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080A5678:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattlerSpriteCoord

	thumb_func_start GetBattlerYDelta
GetBattlerYDelta: @ 0x080A5680
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A56A2
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A56A2
	b _080A5790
_080A56A2:
	cmp r5, #0xc9
	bne _080A5758
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A56CC
	ldr r0, _080A56C4
	ldr r0, [r0]
	ldr r2, [r0, #0x18]
	ldrb r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A56C8
	ldr r2, [r2, #0x10]
	b _080A570A
	.align 2, 0
_080A56C4: .4byte 0x02039BD4
_080A56C8:
	ldr r2, [r2, #8]
	b _080A570A
_080A56CC:
	ldr r0, _080A56F8
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _080A5704
	ldr r1, _080A56FC
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A5700
	adds r0, r0, r1
	movs r1, #0
	bl GetMonData
	adds r2, r0, #0
	b _080A570A
	.align 2, 0
_080A56F8: .4byte 0x02024174
_080A56FC: .4byte 0x02023D12
_080A5700: .4byte 0x02024190
_080A5704:
	ldr r0, _080A5740
	adds r0, r1, r0
	ldr r2, [r0]
_080A570A:
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
	bne _080A5744
	adds r0, r5, #0
	b _080A574E
	.align 2, 0
_080A5740: .4byte 0x02024160
_080A5744:
	movs r1, #0xce
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080A574E:
	ldr r1, _080A5754
	lsls r0, r0, #2
	b _080A5858
	.align 2, 0
_080A5754: .4byte 0x082D5A68
_080A5758:
	ldr r0, _080A576C
	cmp r5, r0
	bne _080A5778
	ldr r0, _080A5770
	ldr r1, _080A5774
	adds r1, r4, r1
	ldrb r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	b _080A585C
	.align 2, 0
_080A576C: .4byte 0x00000181
_080A5770: .4byte 0x084FE698
_080A5774: .4byte 0x02024188
_080A5778:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r5, r0
	bls _080A5788
	ldr r0, _080A5784
	b _080A585A
	.align 2, 0
_080A5784: .4byte 0x082D5A68
_080A5788:
	ldr r1, _080A578C
	b _080A5856
	.align 2, 0
_080A578C: .4byte 0x082D5A68
_080A5790:
	cmp r5, #0xc9
	bne _080A5820
	ldr r0, _080A57C0
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _080A57CC
	ldr r1, _080A57C4
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A57C8
	adds r0, r0, r1
	movs r1, #0
	bl GetMonData
	adds r2, r0, #0
	b _080A57D2
	.align 2, 0
_080A57C0: .4byte 0x02024174
_080A57C4: .4byte 0x02023D12
_080A57C8: .4byte 0x020243E8
_080A57CC:
	ldr r0, _080A5808
	adds r0, r1, r0
	ldr r2, [r0]
_080A57D2:
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
	bne _080A580C
	adds r0, r5, #0
	b _080A5816
	.align 2, 0
_080A5808: .4byte 0x02024160
_080A580C:
	movs r1, #0xce
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080A5816:
	ldr r1, _080A581C
	lsls r0, r0, #2
	b _080A5858
	.align 2, 0
_080A581C: .4byte 0x082D45C8
_080A5820:
	ldr r0, _080A5838
	cmp r5, r0
	bne _080A5844
	ldr r0, _080A583C
	ldr r1, _080A5840
	adds r1, r4, r1
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	b _080A585C
	.align 2, 0
_080A5838: .4byte 0x00000181
_080A583C: .4byte 0x084FE684
_080A5840: .4byte 0x02024188
_080A5844:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r5, r0
	bls _080A5854
	ldr r0, _080A5850
	b _080A585A
	.align 2, 0
_080A5850: .4byte 0x082D45C8
_080A5854:
	ldr r1, _080A5864
_080A5856:
	lsls r0, r5, #2
_080A5858:
	adds r0, r0, r1
_080A585A:
	ldrb r0, [r0, #1]
_080A585C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A5864: .4byte 0x082D45C8
	thumb_func_end GetBattlerYDelta

	thumb_func_start GetBattlerElevation
GetBattlerElevation: @ 0x080A5868
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r7, r4, #0
	movs r5, #0
	adds r0, r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080A58C6
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A58C6
	ldr r0, _080A58A4
	cmp r4, r0
	bne _080A58B0
	ldr r0, _080A58A8
	ldr r1, _080A58AC
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r1, r1, r0
	ldrb r5, [r1]
	b _080A58C6
	.align 2, 0
_080A58A4: .4byte 0x00000181
_080A58A8: .4byte 0x084FE694
_080A58AC: .4byte 0x02024188
_080A58B0:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	bls _080A58C0
	ldr r0, _080A58BC
	b _080A58C4
	.align 2, 0
_080A58BC: .4byte 0x082D965C
_080A58C0:
	ldr r0, _080A58D0
	adds r0, r7, r0
_080A58C4:
	ldrb r5, [r0]
_080A58C6:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A58D0: .4byte 0x082D965C
	thumb_func_end GetBattlerElevation

	thumb_func_start GetBattlerSpriteFinal_Y
GetBattlerSpriteFinal_Y: @ 0x080A58D4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	adds r0, r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A58F8
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5906
_080A58F8:
	adds r0, r6, #0
	adds r1, r5, #0
	bl GetBattlerYDelta
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _080A5924
_080A5906:
	adds r0, r6, #0
	adds r1, r5, #0
	bl GetBattlerYDelta
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	adds r1, r5, #0
	bl GetBattlerElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080A5924:
	adds r0, r6, #0
	bl GetBattlerPosition
	ldr r3, _080A596C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, _080A5970
	ldr r1, [r1]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r7, #0
	beq _080A5964
	adds r0, r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A595E
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A595E:
	cmp r4, #0x68
	bls _080A5964
	movs r4, #0x68
_080A5964:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A596C: .4byte 0x084FE664
_080A5970: .4byte 0x02022C90
	thumb_func_end GetBattlerSpriteFinal_Y

	thumb_func_start GetBattlerSpriteCoord2
GetBattlerSpriteCoord2: @ 0x080A5974
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #0xfd
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _080A59EE
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A59B0
	ldr r0, _080A59A8
	ldr r0, [r0]
	ldr r2, [r0, #0x18]
	ldrb r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A59AC
	ldrh r1, [r2, #2]
	b _080A59D6
	.align 2, 0
_080A59A8: .4byte 0x02039BD4
_080A59AC:
	ldrh r1, [r2]
	b _080A59D6
_080A59B0:
	ldr r0, _080A59CC
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080A59D4
	ldr r1, _080A59D0
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	b _080A59D6
	.align 2, 0
_080A59CC: .4byte 0x02024174
_080A59D0: .4byte 0x020380D8
_080A59D4:
	ldrh r1, [r1, #2]
_080A59D6:
	cmp r5, #3
	bne _080A59E4
	adds r0, r4, #0
	movs r2, #1
	bl GetBattlerSpriteFinal_Y
	b _080A59F6
_080A59E4:
	adds r0, r4, #0
	movs r2, #0
	bl GetBattlerSpriteFinal_Y
	b _080A59F6
_080A59EE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetBattlerSpriteCoord
_080A59F6:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetBattlerSpriteCoord2

	thumb_func_start GetBattlerSpriteDefault_Y
GetBattlerSpriteDefault_Y: @ 0x080A5A00
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #4
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end GetBattlerSpriteDefault_Y

	thumb_func_start GetSubstituteSpriteDefault_Y
GetSubstituteSpriteDefault_Y: @ 0x080A5A14
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5A38
	adds r0, r4, #0
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	movs r1, #0x80
	lsls r1, r1, #0xd
	b _080A5A48
_080A5A38:
	adds r0, r4, #0
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	movs r1, #0x88
	lsls r1, r1, #0xd
_080A5A48:
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetSubstituteSpriteDefault_Y

	thumb_func_start GetBattlerYCoordWithElevation
GetBattlerYCoordWithElevation: @ 0x080A5A58
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A5B00
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5AAC
	ldr r0, _080A5AA0
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080A5AE4
	ldr r1, _080A5AA4
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A5AA8
	b _080A5ACA
	.align 2, 0
_080A5AA0: .4byte 0x02024174
_080A5AA4: .4byte 0x02023D12
_080A5AA8: .4byte 0x020243E8
_080A5AAC:
	ldr r0, _080A5AD8
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080A5AE4
	ldr r1, _080A5ADC
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A5AE0
_080A5ACA:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _080A5AE6
	.align 2, 0
_080A5AD8: .4byte 0x02024174
_080A5ADC: .4byte 0x02023D12
_080A5AE0: .4byte 0x02024190
_080A5AE4:
	ldrh r4, [r1, #2]
_080A5AE6:
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5B00
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetBattlerElevation
	subs r0, r6, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080A5B00:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetBattlerYCoordWithElevation

	thumb_func_start GetAnimBattlerSpriteId
GetAnimBattlerSpriteId: @ 0x080A5B08
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0
	bne _080A5B30
	ldr r4, _080A5B28
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5B7E
	ldr r1, _080A5B2C
	ldrb r0, [r4]
	b _080A5B8E
	.align 2, 0
_080A5B28: .4byte 0x020380D6
_080A5B2C: .4byte 0x02023E88
_080A5B30:
	cmp r0, #1
	bne _080A5B50
	ldr r4, _080A5B48
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5B7E
	ldr r1, _080A5B4C
	ldrb r0, [r4]
	b _080A5B8E
	.align 2, 0
_080A5B48: .4byte 0x020380D7
_080A5B4C: .4byte 0x02023E88
_080A5B50:
	cmp r1, #2
	bne _080A5B6C
	ldr r5, _080A5B68
	ldrb r0, [r5]
	movs r4, #2
	eors r0, r4
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5B7E
	b _080A5B88
	.align 2, 0
_080A5B68: .4byte 0x020380D6
_080A5B6C:
	ldr r5, _080A5B84
	ldrb r0, [r5]
	movs r4, #2
	eors r0, r4
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A5B88
_080A5B7E:
	movs r0, #0xff
	b _080A5B92
	.align 2, 0
_080A5B84: .4byte 0x020380D7
_080A5B88:
	ldr r1, _080A5B98
	ldrb r0, [r5]
	eors r0, r4
_080A5B8E:
	adds r0, r0, r1
	ldrb r0, [r0]
_080A5B92:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A5B98: .4byte 0x02023E88
	thumb_func_end GetAnimBattlerSpriteId

	thumb_func_start StoreSpriteCallbackInData6
StoreSpriteCallbackInData6: @ 0x080A5B9C
	strh r1, [r0, #0x3a]
	lsrs r1, r1, #0x10
	strh r1, [r0, #0x3c]
	bx lr
	thumb_func_end StoreSpriteCallbackInData6

	thumb_func_start SetCallbackToStoredInData6
SetCallbackToStoredInData6: @ 0x080A5BA4
	ldrh r2, [r0, #0x3a]
	movs r3, #0x3c
	ldrsh r1, [r0, r3]
	lsls r1, r1, #0x10
	orrs r2, r1
	str r2, [r0, #0x1c]
	bx lr
	.align 2, 0
	thumb_func_end SetCallbackToStoredInData6

	thumb_func_start TranslateSpriteInCircleOverDuration
TranslateSpriteInCircleOverDuration: @ 0x080A5BB4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080A5C08
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x2e]
	adds r1, r0, r2
	strh r1, [r4, #0x2e]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080A5BF4
	ldr r2, _080A5BF0
	b _080A5BFC
	.align 2, 0
_080A5BF0: .4byte 0xFFFFFF00
_080A5BF4:
	cmp r0, #0
	bge _080A5C00
	movs r2, #0x80
	lsls r2, r2, #1
_080A5BFC:
	adds r0, r1, r2
	strh r0, [r4, #0x2e]
_080A5C00:
	ldrh r0, [r4, #0x34]
	subs r0, #1
	strh r0, [r4, #0x34]
	b _080A5C0E
_080A5C08:
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A5C0E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end TranslateSpriteInCircleOverDuration

	thumb_func_start TranslateSpriteInGrowingCircleOverDuration
TranslateSpriteInGrowingCircleOverDuration: @ 0x080A5C14
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080A5C84
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r2, [r4, #0x30]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r2, [r4, #0x30]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x2e]
	adds r1, r0, r2
	strh r1, [r4, #0x2e]
	ldrh r0, [r4, #0x36]
	ldrh r2, [r4, #0x38]
	adds r0, r0, r2
	strh r0, [r4, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080A5C70
	ldr r2, _080A5C6C
	b _080A5C78
	.align 2, 0
_080A5C6C: .4byte 0xFFFFFF00
_080A5C70:
	cmp r0, #0
	bge _080A5C7C
	movs r2, #0x80
	lsls r2, r2, #1
_080A5C78:
	adds r0, r1, r2
	strh r0, [r4, #0x2e]
_080A5C7C:
	ldrh r0, [r4, #0x34]
	subs r0, #1
	strh r0, [r4, #0x34]
	b _080A5C8A
_080A5C84:
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A5C8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end TranslateSpriteInGrowingCircleOverDuration

	thumb_func_start sub_080A5C90
sub_080A5C90: @ 0x080A5C90
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080A5D0C
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x2e]
	adds r1, r0, r2
	strh r1, [r4, #0x2e]
	ldrh r0, [r4, #0x38]
	ldrh r2, [r4, #0x36]
	adds r0, r0, r2
	strh r0, [r4, #0x36]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080A5CD8
	ldr r2, _080A5CD4
	b _080A5CE0
	.align 2, 0
_080A5CD4: .4byte 0xFFFFFF00
_080A5CD8:
	cmp r0, #0
	bge _080A5CE4
	movs r2, #0x80
	lsls r2, r2, #1
_080A5CE0:
	adds r0, r1, r2
	strh r0, [r4, #0x2e]
_080A5CE4:
	ldrh r1, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #0xff
	ble _080A5CF8
	ldr r2, _080A5CF4
	b _080A5D00
	.align 2, 0
_080A5CF4: .4byte 0xFFFFFF00
_080A5CF8:
	cmp r0, #0
	bge _080A5D04
	movs r2, #0x80
	lsls r2, r2, #1
_080A5D00:
	adds r0, r1, r2
	strh r0, [r4, #0x36]
_080A5D04:
	ldrh r0, [r4, #0x34]
	subs r0, #1
	strh r0, [r4, #0x34]
	b _080A5D12
_080A5D0C:
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A5D12:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080A5C90

	thumb_func_start TranslateSpriteInEllipseOverDuration
TranslateSpriteInEllipseOverDuration: @ 0x080A5D18
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080A5D6C
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x2e]
	adds r1, r0, r2
	strh r1, [r4, #0x2e]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080A5D58
	ldr r2, _080A5D54
	b _080A5D60
	.align 2, 0
_080A5D54: .4byte 0xFFFFFF00
_080A5D58:
	cmp r0, #0
	bge _080A5D64
	movs r2, #0x80
	lsls r2, r2, #1
_080A5D60:
	adds r0, r1, r2
	strh r0, [r4, #0x2e]
_080A5D64:
	ldrh r0, [r4, #0x34]
	subs r0, #1
	strh r0, [r4, #0x34]
	b _080A5D72
_080A5D6C:
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A5D72:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end TranslateSpriteInEllipseOverDuration

	thumb_func_start WaitAnimForDuration
WaitAnimForDuration: @ 0x080A5D78
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _080A5D8C
	subs r0, r2, #1
	strh r0, [r1, #0x2e]
	b _080A5D92
_080A5D8C:
	adds r0, r1, #0
	bl SetCallbackToStoredInData6
_080A5D92:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WaitAnimForDuration

	thumb_func_start sub_080A5D98
sub_080A5D98: @ 0x080A5D98
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080A5DB4
	ldr r1, _080A5DB0
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5DB0: .4byte 0x080A5E05
	thumb_func_end sub_080A5D98

	thumb_func_start sub_080A5DB4
sub_080A5DB4: @ 0x080A5DB4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _080A5DCA
	ldrh r0, [r4, #0x2e]
	rsbs r0, r0, #0
	strh r0, [r4, #0x2e]
_080A5DCA:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	ldrh r5, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl __divsi3
	cmp r0, #0
	bge _080A5DE4
	rsbs r0, r0, #0
_080A5DE4:
	strh r0, [r4, #0x2e]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A5DB4

	thumb_func_start TranslateSpriteLinear
TranslateSpriteLinear: @ 0x080A5E04
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _080A5E28
	subs r0, r2, #1
	strh r0, [r1, #0x2e]
	ldrh r0, [r1, #0x30]
	ldrh r2, [r1, #0x24]
	adds r0, r0, r2
	strh r0, [r1, #0x24]
	ldrh r0, [r1, #0x32]
	ldrh r3, [r1, #0x26]
	adds r0, r0, r3
	strh r0, [r1, #0x26]
	b _080A5E2E
_080A5E28:
	adds r0, r1, #0
	bl SetCallbackToStoredInData6
_080A5E2E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TranslateSpriteLinear

	thumb_func_start TranslateSpriteLinearFixedPoint
TranslateSpriteLinearFixedPoint: @ 0x080A5E34
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _080A5E64
	subs r0, r1, #1
	strh r0, [r2, #0x2e]
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x34]
	adds r0, r0, r1
	strh r0, [r2, #0x34]
	ldrh r1, [r2, #0x32]
	ldrh r3, [r2, #0x36]
	adds r1, r1, r3
	strh r1, [r2, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r2, #0x24]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strh r1, [r2, #0x26]
	b _080A5E6A
_080A5E64:
	adds r0, r2, #0
	bl SetCallbackToStoredInData6
_080A5E6A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TranslateSpriteLinearFixedPoint

	thumb_func_start TranslateSpriteLinearFixedPointIconFrame
TranslateSpriteLinearFixedPointIconFrame: @ 0x080A5E70
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080A5EA0
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x34]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x32]
	ldrh r2, [r4, #0x36]
	adds r1, r1, r2
	strh r1, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strh r1, [r4, #0x26]
	b _080A5EA6
_080A5EA0:
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A5EA6:
	adds r0, r4, #0
	bl UpdateMonIconFrame
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TranslateSpriteLinearFixedPointIconFrame

	thumb_func_start sub_080A5EB4
sub_080A5EB4: @ 0x080A5EB4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x26]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	ldr r5, _080A5EF0
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
	ldr r0, _080A5EF4
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5EF0: .4byte 0x020380D7
_080A5EF4: .4byte 0x080A5D99
	thumb_func_end sub_080A5EB4

	thumb_func_start TranslateMonSpriteLinear
TranslateMonSpriteLinear: @ 0x080A5EF8
	push {r4, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r3, r2]
	cmp r0, #0
	ble _080A5F3C
	subs r0, r1, #1
	strh r0, [r3, #0x2e]
	ldr r2, _080A5F38
	movs r4, #0x34
	ldrsh r1, [r3, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0x30]
	ldrh r4, [r0, #0x24]
	adds r1, r1, r4
	strh r1, [r0, #0x24]
	movs r0, #0x34
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0x32]
	ldrh r2, [r0, #0x26]
	adds r1, r1, r2
	strh r1, [r0, #0x26]
	b _080A5F42
	.align 2, 0
_080A5F38: .4byte 0x020205AC
_080A5F3C:
	adds r0, r3, #0
	bl SetCallbackToStoredInData6
_080A5F42:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end TranslateMonSpriteLinear

	thumb_func_start TranslateMonSpriteLinearFixedPoint
TranslateMonSpriteLinearFixedPoint: @ 0x080A5F48
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080A5F98
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x34]
	adds r1, r1, r0
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x36]
	adds r0, r0, r2
	strh r0, [r4, #0x36]
	ldr r3, _080A5F94
	movs r0, #0x38
	ldrsh r2, [r4, r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strh r1, [r0, #0x24]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #0x26]
	b _080A5F9E
	.align 2, 0
_080A5F94: .4byte 0x020205AC
_080A5F98:
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A5F9E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end TranslateMonSpriteLinearFixedPoint

	thumb_func_start TranslateSpriteLinearAndFlicker
TranslateSpriteLinearAndFlicker: @ 0x080A5FA4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080A6006
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x32]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x30]
	adds r1, r1, r0
	strh r1, [r4, #0x32]
	ldrh r1, [r4, #0x36]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x34]
	adds r1, r1, r0
	strh r1, [r4, #0x36]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, #0
	bne _080A600C
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080A600C
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
	b _080A600C
_080A6006:
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A600C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TranslateSpriteLinearAndFlicker

	thumb_func_start DestroySpriteAndMatrix
DestroySpriteAndMatrix: @ 0x080A6014
	push {r4, lr}
	adds r4, r0, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DestroySpriteAndMatrix

	thumb_func_start sub_080A6028
sub_080A6028: @ 0x080A6028
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x26]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	ldr r5, _080A6064
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
	ldr r0, _080A6068
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6064: .4byte 0x020380D6
_080A6068: .4byte 0x080A5D99
	thumb_func_end sub_080A6028

	thumb_func_start sub_080A606C
sub_080A606C: @ 0x080A606C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	bl ResetPaletteStructByUid
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A606C

	thumb_func_start RunStoredCallbackWhenAffineAnimEnds
RunStoredCallbackWhenAffineAnimEnds: @ 0x080A6084
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A609A
	adds r0, r2, #0
	bl SetCallbackToStoredInData6
_080A609A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RunStoredCallbackWhenAffineAnimEnds

	thumb_func_start RunStoredCallbackWhenAnimEnds
RunStoredCallbackWhenAnimEnds: @ 0x080A60A0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A60B6
	adds r0, r2, #0
	bl SetCallbackToStoredInData6
_080A60B6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RunStoredCallbackWhenAnimEnds

	thumb_func_start DestroyAnimSpriteAndDisableBlend
DestroyAnimSpriteAndDisableBlend: @ 0x080A60BC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DestroyAnimSpriteAndDisableBlend

	thumb_func_start DestroyAnimVisualTaskAndDisableBlend
DestroyAnimVisualTaskAndDisableBlend: @ 0x080A60DC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DestroyAnimVisualTaskAndDisableBlend

	thumb_func_start SetSpriteCoordsToAnimAttackerCoords
SetSpriteCoordsToAnimAttackerCoords: @ 0x080A6100
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A6128
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6128: .4byte 0x020380D6
	thumb_func_end SetSpriteCoordsToAnimAttackerCoords

	thumb_func_start SetAnimSpriteInitialXOffset
SetAnimSpriteInitialXOffset: @ 0x080A612C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	mov r8, r5
	ldr r7, _080A6164
	ldrb r0, [r7]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080A6168
	ldrb r0, [r0]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bhi _080A6178
	cmp r6, r0
	bhs _080A616C
	lsls r0, r5, #0x10
	b _080A6188
	.align 2, 0
_080A6164: .4byte 0x020380D6
_080A6168: .4byte 0x020380D7
_080A616C:
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6184
_080A6178:
	ldrh r1, [r4, #0x20]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #0x20]
	b _080A6190
_080A6184:
	mov r1, r8
	lsls r0, r1, #0x10
_080A6188:
	asrs r0, r0, #0x10
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
_080A6190:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetAnimSpriteInitialXOffset

	thumb_func_start InitAnimArcTranslation
InitAnimArcTranslation: @ 0x080A619C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x20]
	movs r5, #0
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #8
	bl __divsi3
	strh r0, [r4, #0x3a]
	strh r5, [r4, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitAnimArcTranslation

	thumb_func_start TranslateAnimHorizontalArc
TranslateAnimHorizontalArc: @ 0x080A61C8
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A61F4
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x3c]
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	movs r0, #0
	b _080A61F6
_080A61F4:
	movs r0, #1
_080A61F6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TranslateAnimHorizontalArc

	thumb_func_start TranslateAnimVerticalArc
TranslateAnimVerticalArc: @ 0x080A61FC
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6228
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x3c]
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r0, #0
	b _080A622A
_080A6228:
	movs r0, #1
_080A622A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TranslateAnimVerticalArc

	thumb_func_start SetSpritePrimaryCoordsFromSecondaryCoords
SetSpritePrimaryCoordsFromSecondaryCoords: @ 0x080A6230
	ldrh r1, [r0, #0x24]
	ldrh r2, [r0, #0x20]
	adds r1, r1, r2
	movs r2, #0
	strh r1, [r0, #0x20]
	ldrh r1, [r0, #0x26]
	ldrh r3, [r0, #0x22]
	adds r1, r1, r3
	strh r1, [r0, #0x22]
	strh r2, [r0, #0x24]
	strh r2, [r0, #0x26]
	bx lr
	thumb_func_end SetSpritePrimaryCoordsFromSecondaryCoords

	thumb_func_start InitSpritePosToAnimTarget
InitSpritePosToAnimTarget: @ 0x080A6248
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _080A6270
	ldr r4, _080A628C
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
_080A6270:
	ldr r4, _080A6290
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
_080A628C: .4byte 0x020380D7
_080A6290: .4byte 0x020380BE
	thumb_func_end InitSpritePosToAnimTarget

	thumb_func_start InitSpritePosToAnimAttacker
InitSpritePosToAnimAttacker: @ 0x080A6294
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _080A62B8
	ldr r4, _080A62B4
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	b _080A62CC
	.align 2, 0
_080A62B4: .4byte 0x020380D6
_080A62B8:
	ldr r4, _080A62F0
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #3
_080A62CC:
	bl GetBattlerSpriteCoord2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	ldr r4, _080A62F4
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
_080A62F0: .4byte 0x020380D6
_080A62F4: .4byte 0x020380BE
	thumb_func_end InitSpritePosToAnimAttacker

	thumb_func_start GetBattlerSide
GetBattlerSide: @ 0x080A62F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080A6308
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	bx lr
	.align 2, 0
_080A6308: .4byte 0x02023D1A
	thumb_func_end GetBattlerSide

	thumb_func_start GetBattlerPosition
GetBattlerPosition: @ 0x080A630C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080A6318
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080A6318: .4byte 0x02023D1A
	thumb_func_end GetBattlerPosition

	thumb_func_start GetBattlerAtPosition
GetBattlerAtPosition: @ 0x080A631C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	ldr r0, _080A6350
	ldrb r2, [r0]
	cmp r1, r2
	bhs _080A6346
	ldr r4, _080A6354
	ldrb r0, [r4]
	cmp r0, r3
	beq _080A6346
_080A6334:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	bhs _080A6346
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A6334
_080A6346:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A6350: .4byte 0x02023D10
_080A6354: .4byte 0x02023D1A
	thumb_func_end GetBattlerAtPosition

	thumb_func_start IsBattlerSpritePresent
IsBattlerSpritePresent: @ 0x080A6358
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6384
	ldr r0, _080A637C
	ldrb r0, [r0]
	cmp r0, r4
	beq _080A63D2
	ldr r0, _080A6380
	ldrb r0, [r0]
	cmp r0, r4
	beq _080A63D2
	b _080A63E0
	.align 2, 0
_080A637C: .4byte 0x020380D6
_080A6380: .4byte 0x020380D7
_080A6384:
	ldr r0, _080A63AC
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A63E0
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A63B8
	ldr r1, _080A63B0
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A63B4
	b _080A63C6
	.align 2, 0
_080A63AC: .4byte 0x02023D1A
_080A63B0: .4byte 0x02023D12
_080A63B4: .4byte 0x020243E8
_080A63B8:
	ldr r1, _080A63D8
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A63DC
_080A63C6:
	adds r0, r0, r1
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080A63E0
_080A63D2:
	movs r0, #1
	b _080A63E2
	.align 2, 0
_080A63D8: .4byte 0x02023D12
_080A63DC: .4byte 0x02024190
_080A63E0:
	movs r0, #0
_080A63E2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsBattlerSpritePresent

	thumb_func_start IsDoubleBattle
IsDoubleBattle: @ 0x080A63E8
	ldr r0, _080A63F4
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_080A63F4: .4byte 0x02022C90
	thumb_func_end IsDoubleBattle

	thumb_func_start sub_080A63F8
sub_080A63F8: @ 0x080A63F8
	push {r4, lr}
	adds r4, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080A642C
	ldr r0, _080A6424
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _080A6428
	ldr r0, [r0]
	str r0, [r4, #4]
	movs r1, #0
	movs r0, #0xe
	strb r0, [r4, #8]
	movs r0, #1
	strb r0, [r4, #9]
	strh r1, [r4, #0xa]
	b _080A6446
	.align 2, 0
_080A6424: .4byte 0x02022D00
_080A6428: .4byte 0x02022D04
_080A642C:
	ldr r0, _080A6450
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _080A6454
	ldr r0, [r0]
	str r0, [r4, #4]
	movs r0, #8
	strb r0, [r4, #8]
	movs r0, #1
	strb r0, [r4, #9]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
_080A6446:
	strh r1, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6450: .4byte 0x02022D00
_080A6454: .4byte 0x02022D04
	thumb_func_end sub_080A63F8

	thumb_func_start sub_080A6458
sub_080A6458: @ 0x080A6458
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080A648C
	ldr r0, _080A6484
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _080A6488
	ldr r0, [r0]
	str r0, [r4, #4]
	movs r1, #0
	movs r0, #0xe
	strb r0, [r4, #8]
	movs r0, #1
	strb r0, [r4, #9]
	strh r1, [r4, #0xa]
	b _080A64B2
	.align 2, 0
_080A6484: .4byte 0x02022D00
_080A6488: .4byte 0x02022D04
_080A648C:
	cmp r5, #1
	bne _080A6498
	adds r0, r4, #0
	bl sub_080A63F8
	b _080A64B4
_080A6498:
	ldr r0, _080A64BC
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _080A64C0
	ldr r0, [r0]
	str r0, [r4, #4]
	movs r0, #9
	strb r0, [r4, #8]
	movs r0, #2
	strb r0, [r4, #9]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
_080A64B2:
	strh r1, [r4, #0xc]
_080A64B4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A64BC: .4byte 0x02022D00
_080A64C0: .4byte 0x02022D04
	thumb_func_end sub_080A6458

	thumb_func_start sub_080A64C4
sub_080A64C4: @ 0x080A64C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A64F0
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _080A64F4
	ldr r0, [r0]
	str r0, [r4, #4]
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _080A64F8
	movs r0, #0
	movs r1, #0xe
	strb r1, [r4, #8]
	movs r1, #1
	strb r1, [r4, #9]
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	b _080A6528
	.align 2, 0
_080A64F0: .4byte 0x02022D00
_080A64F4: .4byte 0x02022D04
_080A64F8:
	ldr r0, _080A6514
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080A6518
	movs r0, #8
	strb r0, [r4, #8]
	strb r1, [r4, #9]
	movs r0, #0x80
	lsls r0, r0, #2
	b _080A6524
	.align 2, 0
_080A6514: .4byte 0x020380D6
_080A6518:
	movs r0, #9
	strb r0, [r4, #8]
	movs r0, #2
	strb r0, [r4, #9]
	movs r0, #0xc0
	lsls r0, r0, #2
_080A6524:
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
_080A6528:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A64C4

	thumb_func_start sub_080A6530
sub_080A6530: @ 0x080A6530
	push {lr}
	sub sp, #0x20
	adds r1, r0, #0
	add r0, sp, #0xc
	bl sub_080A6458
	movs r0, #0
	str r0, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r1, [sp, #0xc]
	ldr r2, _080A6584
	bl CpuSet
	add r0, sp, #0xc
	ldrb r0, [r0, #9]
	ldr r1, [sp, #0xc]
	movs r2, #0x80
	lsls r2, r2, #6
	add r3, sp, #0xc
	ldrh r3, [r3, #0xa]
	bl LoadBgTiles
	add r0, sp, #0xc
	ldrb r0, [r0, #9]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0x40
	str r1, [sp, #4]
	movs r1, #0x11
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	add r0, sp, #0xc
	ldrb r0, [r0, #9]
	bl CopyBgTilemapBufferToVram
	add sp, #0x20
	pop {r0}
	bx r0
	.align 2, 0
_080A6584: .4byte 0x05000800
	thumb_func_end sub_080A6530

	thumb_func_start AnimLoadCompressedBgGfx
AnimLoadCompressedBgGfx: @ 0x080A6588
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	adds r6, r2, #0
	movs r0, #0
	str r0, [sp]
	ldr r4, _080A65D0
	ldr r1, [r4]
	ldr r2, _080A65D4
	mov r0, sp
	bl CpuSet
	ldr r1, [r4]
	mov r0, r8
	bl LZDecompressVram
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	adds r0, r5, #0
	adds r3, r6, #0
	bl LoadBgTiles
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A65D0: .4byte 0x02022D00
_080A65D4: .4byte 0x05000800
	thumb_func_end AnimLoadCompressedBgGfx

	thumb_func_start InitAnimBgTilemapBuffer
InitAnimBgTilemapBuffer: @ 0x080A65D8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end InitAnimBgTilemapBuffer

	thumb_func_start AnimLoadCompressedBgTilemap
AnimLoadCompressedBgTilemap: @ 0x080A6610
	push {r4, lr}
	adds r4, r0, #0
	bl InitAnimBgTilemapBuffer
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl CopyBgTilemapBufferToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimLoadCompressedBgTilemap

	thumb_func_start sub_080A6628
sub_080A6628: @ 0x080A6628
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	ldrb r0, [r4, #9]
	bl InitAnimBgTilemapBuffer
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080A664E
	ldrb r0, [r4, #8]
	ldr r1, [r4, #4]
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	bl sub_080A3FE8
_080A664E:
	ldrb r0, [r4, #9]
	bl CopyBgTilemapBufferToVram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A6628

	thumb_func_start sub_080A665C
sub_080A665C: @ 0x080A665C
	push {lr}
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A666C
	movs r0, #2
	b _080A666E
_080A666C:
	movs r0, #1
_080A666E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080A665C

	thumb_func_start sub_080A6674
sub_080A6674: @ 0x080A6674
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6686
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A669C
_080A6686:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetAnimBgAttribute
	movs r0, #3
	movs r1, #1
	movs r2, #1
	bl SetAnimBgAttribute
	b _080A66B0
_080A669C:
	movs r0, #3
	movs r1, #0
	movs r2, #1
	bl SetAnimBgAttribute
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl SetAnimBgAttribute
_080A66B0:
	pop {r0}
	bx r0
	thumb_func_end sub_080A6674

	thumb_func_start sub_080A66B4
sub_080A66B4: @ 0x080A66B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl InitSpriteDataForLinearTranslation
	ldr r1, _080A66D8
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A66D8: .4byte 0x080A5E71
	thumb_func_end sub_080A66B4

	thumb_func_start InitSpriteDataForLinearTranslation
InitSpriteDataForLinearTranslation: @ 0x080A66DC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x32]
	ldrh r1, [r5, #0x30]
	subs r0, r0, r1
	ldrh r4, [r5, #0x36]
	ldrh r1, [r5, #0x34]
	subs r4, r4, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	bl __divsi3
	movs r6, #0
	strh r0, [r5, #0x30]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r5, #0x32]
	strh r6, [r5, #0x36]
	strh r6, [r5, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitSpriteDataForLinearTranslation

	thumb_func_start InitAnimLinearTranslation
InitAnimLinearTranslation: @ 0x080A671C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x32
	ldrsh r1, [r7, r0]
	movs r2, #0x30
	ldrsh r0, [r7, r2]
	subs r1, r1, r0
	movs r3, #0x36
	ldrsh r2, [r7, r3]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	subs r2, r2, r0
	lsrs r0, r1, #0x1f
	mov r8, r0
	lsrs r3, r2, #0x1f
	mov sb, r3
	cmp r1, #0
	bge _080A6748
	rsbs r1, r1, #0
_080A6748:
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x10
	adds r0, r2, #0
	cmp r0, #0
	bge _080A6754
	rsbs r0, r0, #0
_080A6754:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x10
	movs r0, #0x2e
	ldrsh r4, [r7, r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r2, r8
	cmp r2, #0
	beq _080A6780
	movs r0, #1
	orrs r6, r0
	b _080A6784
_080A6780:
	ldr r0, _080A6790
	ands r6, r0
_080A6784:
	mov r3, sb
	cmp r3, #0
	beq _080A6794
	movs r0, #1
	orrs r5, r0
	b _080A6798
	.align 2, 0
_080A6790: .4byte 0x0000FFFE
_080A6794:
	ldr r0, _080A67B0
	ands r5, r0
_080A6798:
	movs r0, #0
	strh r6, [r7, #0x30]
	strh r5, [r7, #0x32]
	strh r0, [r7, #0x36]
	strh r0, [r7, #0x34]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A67B0: .4byte 0x0000FFFE
	thumb_func_end InitAnimLinearTranslation

	thumb_func_start InitAndRunAnimFastLinearTranslation
InitAndRunAnimFastLinearTranslation: @ 0x080A67B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	ldr r1, _080A67D8
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A67D8: .4byte 0x080A6861
	thumb_func_end InitAndRunAnimFastLinearTranslation

	thumb_func_start sub_080A67DC
sub_080A67DC: @ 0x080A67DC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	ldr r1, _080A6800
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6800: .4byte 0x080A687D
	thumb_func_end sub_080A67DC

	thumb_func_start AnimTranslateLinear
AnimTranslateLinear: @ 0x080A6804
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _080A6814
	movs r0, #1
	b _080A6858
_080A6814:
	ldrh r1, [r2, #0x30]
	ldrh r4, [r2, #0x32]
	ldrh r6, [r2, #0x34]
	ldrh r5, [r2, #0x36]
	adds r0, r6, r1
	lsls r3, r0, #0x10
	lsrs r6, r3, #0x10
	adds r0, r5, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080A6836
	lsrs r0, r3, #0x18
	rsbs r0, r0, #0
	b _080A6838
_080A6836:
	lsrs r0, r3, #0x18
_080A6838:
	strh r0, [r2, #0x24]
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _080A6848
	lsrs r0, r5, #8
	rsbs r0, r0, #0
	b _080A684A
_080A6848:
	lsrs r0, r5, #8
_080A684A:
	strh r0, [r2, #0x26]
	strh r6, [r2, #0x34]
	strh r5, [r2, #0x36]
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	strh r0, [r2, #0x2e]
	movs r0, #0
_080A6858:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AnimTranslateLinear

	thumb_func_start sub_080A6860
sub_080A6860: @ 0x080A6860
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6874
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A6874:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A6860

	thumb_func_start sub_080A687C
sub_080A687C: @ 0x080A687C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08039AE0
	adds r0, r4, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6896
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A6896:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080A687C

	thumb_func_start sub_080A689C
sub_080A689C: @ 0x080A689C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, #0
	bge _080A68B0
	rsbs r0, r0, #0
_080A68B0:
	lsls r0, r0, #8
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080A689C

	thumb_func_start sub_080A68C8
sub_080A68C8: @ 0x080A68C8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl sub_080A689C
	ldr r1, _080A68EC
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A68EC: .4byte 0x080A6861
	thumb_func_end sub_080A68C8

	thumb_func_start InitAnimFastLinearTranslation
InitAnimFastLinearTranslation: @ 0x080A68F0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x32
	ldrsh r1, [r7, r0]
	movs r2, #0x30
	ldrsh r0, [r7, r2]
	subs r1, r1, r0
	movs r3, #0x36
	ldrsh r2, [r7, r3]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	subs r2, r2, r0
	lsrs r0, r1, #0x1f
	mov r8, r0
	lsrs r3, r2, #0x1f
	mov sb, r3
	cmp r1, #0
	bge _080A691C
	rsbs r1, r1, #0
_080A691C:
	lsls r0, r1, #0x14
	lsrs r6, r0, #0x10
	adds r0, r2, #0
	cmp r0, #0
	bge _080A6928
	rsbs r0, r0, #0
_080A6928:
	lsls r0, r0, #0x14
	lsrs r5, r0, #0x10
	movs r0, #0x2e
	ldrsh r4, [r7, r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r2, r8
	cmp r2, #0
	beq _080A6954
	movs r0, #1
	orrs r6, r0
	b _080A6958
_080A6954:
	ldr r0, _080A6964
	ands r6, r0
_080A6958:
	mov r3, sb
	cmp r3, #0
	beq _080A6968
	movs r0, #1
	orrs r5, r0
	b _080A696C
	.align 2, 0
_080A6964: .4byte 0x0000FFFE
_080A6968:
	ldr r0, _080A6984
	ands r5, r0
_080A696C:
	movs r0, #0
	strh r6, [r7, #0x30]
	strh r5, [r7, #0x32]
	strh r0, [r7, #0x36]
	strh r0, [r7, #0x34]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6984: .4byte 0x0000FFFE
	thumb_func_end InitAnimFastLinearTranslation

	thumb_func_start StartAnimLinearTranslation
StartAnimLinearTranslation: @ 0x080A6988
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl InitAnimFastLinearTranslation
	ldr r1, _080A69AC
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A69AC: .4byte 0x080A6A0D
	thumb_func_end StartAnimLinearTranslation

	thumb_func_start AnimFastTranslateLinear
AnimFastTranslateLinear: @ 0x080A69B0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _080A69C0
	movs r0, #1
	b _080A6A04
_080A69C0:
	ldrh r1, [r2, #0x30]
	ldrh r4, [r2, #0x32]
	ldrh r6, [r2, #0x34]
	ldrh r5, [r2, #0x36]
	adds r0, r6, r1
	lsls r3, r0, #0x10
	lsrs r6, r3, #0x10
	adds r0, r5, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080A69E2
	lsrs r0, r3, #0x14
	rsbs r0, r0, #0
	b _080A69E4
_080A69E2:
	lsrs r0, r3, #0x14
_080A69E4:
	strh r0, [r2, #0x24]
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _080A69F4
	lsrs r0, r5, #4
	rsbs r0, r0, #0
	b _080A69F6
_080A69F4:
	lsrs r0, r5, #4
_080A69F6:
	strh r0, [r2, #0x26]
	strh r6, [r2, #0x34]
	strh r5, [r2, #0x36]
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	strh r0, [r2, #0x2e]
	movs r0, #0
_080A6A04:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AnimFastTranslateLinear

	thumb_func_start sub_080A6A0C
sub_080A6A0C: @ 0x080A6A0C
	push {r4, lr}
	adds r4, r0, #0
	bl AnimFastTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6A20
	adds r0, r4, #0
	bl SetCallbackToStoredInData6
_080A6A20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A6A0C

	thumb_func_start InitAnimFastLinearTranslationWithSpeed
InitAnimFastLinearTranslationWithSpeed: @ 0x080A6A28
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, #0
	bge _080A6A3C
	rsbs r0, r0, #0
_080A6A3C:
	lsls r0, r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl InitAnimFastLinearTranslation
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end InitAnimFastLinearTranslationWithSpeed

	thumb_func_start sub_080A6A54
sub_080A6A54: @ 0x080A6A54
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl InitAnimFastLinearTranslationWithSpeed
	ldr r1, _080A6A78
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A78: .4byte 0x080A6A0D
	thumb_func_end sub_080A6A54

	thumb_func_start SetSpriteRotScale
SetSpriteRotScale: @ 0x080A6A7C
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r5, _080A6AF4
	lsls r2, r2, #0x10
	lsrs r1, r1, #0x10
	orrs r1, r2
	str r1, [sp]
	ldr r0, [sp, #4]
	ands r0, r5
	orrs r0, r3
	str r0, [sp, #4]
	bl sub_080A6B00
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6AB8
	mov r0, sp
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp]
	ands r1, r5
	orrs r1, r0
	str r1, [sp]
_080A6AB8:
	ldr r1, _080A6AF8
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0, #3]
	lsls r4, r4, #0x1a
	lsrs r4, r4, #0x1b
	add r5, sp, #8
	mov r0, sp
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldr r0, _080A6AFC
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	ldrh r0, [r5, #4]
	strh r0, [r4, #4]
	ldrh r0, [r5, #6]
	strh r0, [r4, #6]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6AF4: .4byte 0xFFFF0000
_080A6AF8: .4byte 0x020205AC
_080A6AFC: .4byte 0x02021B3C
	thumb_func_end SetSpriteRotScale

	thumb_func_start sub_080A6B00
sub_080A6B00: @ 0x080A6B00
	push {r4, lr}
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6B30
	ldr r4, _080A6B2C
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0x32
	ldrsh r0, [r1, r2]
	cmp r0, #0xc9
	beq _080A6B30
	movs r0, #1
	b _080A6B32
	.align 2, 0
_080A6B2C: .4byte 0x020205AC
_080A6B30:
	movs r0, #0
_080A6B32:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080A6B00

	thumb_func_start PrepareBattlerSpriteForRotScale
PrepareBattlerSpriteForRotScale: @ 0x080A6B38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r1, _080A6C04
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6B6E
	adds r0, r7, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6B7C
_080A6B6E:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_080A6B7C:
	ldr r1, _080A6C04
	lsls r4, r6, #4
	adds r0, r4, r6
	lsls r0, r0, #2
	adds r5, r0, r1
	movs r0, #3
	mov r1, r8
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #1]
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6BDA
	ldrb r0, [r5, #1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bne _080A6BDA
	ldr r0, _080A6C08
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #6]
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r5, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #3]
_080A6BDA:
	ldr r1, _080A6C04
	adds r0, r4, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r3, [r0, #1]
	movs r1, #3
	orrs r3, r1
	strb r3, [r0, #1]
	lsrs r1, r3, #6
	ldrb r2, [r0, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	bl CalcCenterToCornerVec
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C04: .4byte 0x020205AC
_080A6C08: .4byte 0x02024174
	thumb_func_end PrepareBattlerSpriteForRotScale

	thumb_func_start ResetSpriteRotScale
ResetSpriteRotScale: @ 0x080A6C0C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldr r1, _080A6C64
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #1
	orrs r1, r2
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r1, r2
	strb r1, [r0, #1]
	adds r3, r0, #0
	adds r3, #0x2c
	ldrb r2, [r3]
	movs r1, #0x7f
	ands r1, r2
	strb r1, [r3]
	ldrb r3, [r0, #1]
	lsrs r1, r3, #6
	ldrb r2, [r0, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	bl CalcCenterToCornerVec
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C64: .4byte 0x020205AC
	thumb_func_end ResetSpriteRotScale

	thumb_func_start SetBattlerSpriteYOffsetFromRotation
SetBattlerSpriteYOffsetFromRotation: @ 0x080A6C68
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A6CA0
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r2
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	ldr r1, _080A6CA4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	movs r3, #4
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _080A6C94
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080A6C94:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	strh r0, [r2, #0x26]
	pop {r0}
	bx r0
	.align 2, 0
_080A6CA0: .4byte 0x020205AC
_080A6CA4: .4byte 0x02021B3C
	thumb_func_end SetBattlerSpriteYOffsetFromRotation

	thumb_func_start TrySetSpriteRotScale
TrySetSpriteRotScale: @ 0x080A6CA8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [sp, #0x28]
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A6D4E
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	cmp r6, #0
	beq _080A6CF6
	ldrb r3, [r4, #1]
	lsrs r1, r3, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r0, r4, #0
	bl CalcCenterToCornerVec
_080A6CF6:
	ldr r6, _080A6D5C
	lsls r0, r7, #0x10
	orrs r5, r0
	str r5, [sp]
	ldr r0, [sp, #4]
	ands r0, r6
	mov r1, r8
	orrs r0, r1
	str r0, [sp, #4]
	bl sub_080A6B00
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6D24
	mov r0, sp
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp]
	ands r1, r6
	orrs r1, r0
	str r1, [sp]
_080A6D24:
	ldrb r4, [r4, #3]
	lsls r4, r4, #0x1a
	lsrs r4, r4, #0x1b
	add r5, sp, #8
	mov r0, sp
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldr r0, _080A6D60
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	ldrh r0, [r5, #4]
	strh r0, [r4, #4]
	ldrh r0, [r5, #6]
	strh r0, [r4, #6]
_080A6D4E:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6D5C: .4byte 0xFFFF0000
_080A6D60: .4byte 0x02021B3C
	thumb_func_end TrySetSpriteRotScale

	thumb_func_start sub_080A6D64
sub_080A6D64: @ 0x080A6D64
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r3, #0x80
	lsls r3, r3, #1
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r3, #0
	bl TrySetSpriteRotScale
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldrb r3, [r4, #1]
	lsrs r1, r3, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r0, r4, #0
	bl CalcCenterToCornerVec
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A6D64

	thumb_func_start ArcTan2_
ArcTan2_: @ 0x080A6DA4
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ArcTan2_

	thumb_func_start ArcTan2Neg
ArcTan2Neg: @ 0x080A6DBC
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2_
	lsls r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end ArcTan2Neg

	thumb_func_start SetGreyscaleOrOriginalPalette
SetGreyscaleOrOriginalPalette: @ 0x080A6DD4
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x18
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x10
	cmp r1, #0
	bne _080A6E50
	ldr r2, _080A6E44
	ldr r1, _080A6E48
	lsls r0, r0, #1
	adds r4, r0, r1
	adds r5, r0, r2
	movs r6, #0xf
_080A6DEC:
	ldr r0, [r5]
	lsls r2, r0, #0x1b
	lsrs r2, r2, #0x1b
	lsls r1, r0, #0x16
	lsrs r1, r1, #0x1b
	adds r2, r2, r1
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x1b
	adds r0, r0, r2
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x1f
	ands r0, r1
	ldrb r1, [r4]
	movs r3, #0x20
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	lsls r3, r0, #5
	ldrh r1, [r4]
	ldr r7, _080A6E4C
	adds r2, r7, #0
	ands r1, r2
	orrs r1, r3
	strh r1, [r4]
	lsls r0, r0, #2
	ldrb r1, [r4, #1]
	movs r3, #0x7d
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #1]
	adds r4, #2
	adds r5, #2
	subs r6, #1
	cmp r6, #0
	bge _080A6DEC
	b _080A6E60
	.align 2, 0
_080A6E44: .4byte 0x020373B4
_080A6E48: .4byte 0x020377B4
_080A6E4C: .4byte 0xFFFFFC1F
_080A6E50:
	lsls r1, r0, #1
	ldr r0, _080A6E68
	adds r0, r1, r0
	ldr r2, _080A6E6C
	adds r1, r1, r2
	ldr r2, _080A6E70
	bl CpuSet
_080A6E60:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6E68: .4byte 0x020373B4
_080A6E6C: .4byte 0x020377B4
_080A6E70: .4byte 0x04000008
	thumb_func_end SetGreyscaleOrOriginalPalette

	thumb_func_start sub_080A6E74
sub_080A6E74: @ 0x080A6E74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #4]
	movs r4, #0
	cmp r0, #0
	beq _080A6ECA
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6EBE
	movs r4, #0xe
	b _080A6ECA
_080A6EBE:
	bl sub_080A665C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #1
	lsls r4, r0
_080A6ECA:
	cmp r7, #0
	beq _080A6EDC
	ldr r0, _080A6F54
	ldrb r0, [r0]
	adds r1, r0, #0
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	orrs r4, r0
_080A6EDC:
	mov r0, r8
	cmp r0, #0
	beq _080A6EF0
	ldr r0, _080A6F58
	ldrb r0, [r0]
	adds r1, r0, #0
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	orrs r4, r0
_080A6EF0:
	mov r0, sb
	cmp r0, #0
	beq _080A6F16
	ldr r6, _080A6F54
	ldrb r0, [r6]
	movs r5, #2
	eors r0, r5
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6F16
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, #0
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	orrs r4, r0
_080A6F16:
	mov r0, sl
	cmp r0, #0
	beq _080A6F3C
	ldr r6, _080A6F58
	ldrb r0, [r6]
	movs r5, #2
	eors r0, r5
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6F3C
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, #0
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	orrs r4, r0
_080A6F3C:
	ldr r0, [sp]
	cmp r0, #0
	beq _080A6F62
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6F5C
	movs r0, #0x80
	lsls r0, r0, #1
	b _080A6F60
	.align 2, 0
_080A6F54: .4byte 0x020380D6
_080A6F58: .4byte 0x020380D7
_080A6F5C:
	movs r0, #0x80
	lsls r0, r0, #7
_080A6F60:
	orrs r4, r0
_080A6F62:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _080A6F78
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6F78
	movs r0, #0x80
	lsls r0, r0, #2
	orrs r4, r0
_080A6F78:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080A6E74

	thumb_func_start sub_080A6F8C
sub_080A6F8C: @ 0x080A6F8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	movs r4, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6FBA
	cmp r5, #0
	beq _080A7068
	movs r4, #0x80
	lsls r4, r4, #0xb
	b _080A7068
_080A6FBA:
	cmp r5, #0
	beq _080A6FE2
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6FE2
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x10
	movs r4, #1
	lsls r4, r0
_080A6FE2:
	cmp r6, #0
	beq _080A700E
	movs r0, #2
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A700E
	movs r0, #2
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	orrs r4, r0
_080A700E:
	cmp r7, #0
	beq _080A703A
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A703A
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	orrs r4, r0
_080A703A:
	mov r0, r8
	cmp r0, #0
	beq _080A7068
	movs r0, #3
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7068
	movs r0, #3
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	orrs r4, r0
_080A7068:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080A6F8C

	thumb_func_start sub_080A7074
sub_080A7074: @ 0x080A7074
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
	thumb_func_end sub_080A7074

	thumb_func_start GetBattlerAtPosition_
GetBattlerAtPosition_: @ 0x080A707C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattlerAtPosition_

	thumb_func_start sub_080A7090
sub_080A7090: @ 0x080A7090
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080A70CE
	ldr r2, _080A70BC
	movs r3, #6
	ldrsh r0, [r2, r3]
	movs r1, #0
	cmp r0, #0
	bne _080A70AA
	movs r1, #1
_080A70AA:
	movs r3, #4
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _080A70C0
	adds r0, r4, #0
	bl InitSpritePosToAnimAttacker
	b _080A70C6
	.align 2, 0
_080A70BC: .4byte 0x020380BE
_080A70C0:
	adds r0, r4, #0
	bl InitSpritePosToAnimTarget
_080A70C6:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _080A70E2
_080A70CE:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080A70E2
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_080A70E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080A7090

	thumb_func_start TranslateAnimSpriteToTargetMonLocation
TranslateAnimSpriteToTargetMonLocation: @ 0x080A70E8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _080A7160
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	movs r1, #0
	cmp r0, #0
	bne _080A7100
	movs r1, #1
_080A7100:
	ldrb r0, [r6, #0xa]
	movs r7, #1
	cmp r0, #0
	bne _080A710A
	movs r7, #3
_080A710A:
	adds r0, r5, #0
	bl InitSpritePosToAnimAttacker
	ldr r0, _080A7164
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7124
	ldrh r0, [r6, #4]
	rsbs r0, r0, #0
	strh r0, [r6, #4]
_080A7124:
	ldrh r0, [r6, #8]
	strh r0, [r5, #0x2e]
	ldr r4, _080A7168
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #4]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	ldrb r0, [r4]
	adds r1, r7, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r6, [r6, #6]
	adds r0, r0, r6
	strh r0, [r5, #0x36]
	ldr r0, _080A716C
	str r0, [r5, #0x1c]
	ldr r1, _080A7170
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7160: .4byte 0x020380BE
_080A7164: .4byte 0x020380D6
_080A7168: .4byte 0x020380D7
_080A716C: .4byte 0x080A67B5
_080A7170: .4byte 0x080A34C5
	thumb_func_end TranslateAnimSpriteToTargetMonLocation

	thumb_func_start sub_080A7174
sub_080A7174: @ 0x080A7174
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _080A71D4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7194
	ldr r1, _080A71D8
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_080A7194:
	ldr r4, _080A71D8
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x2e]
	ldr r5, _080A71DC
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
	ldrh r1, [r4, #6]
	adds r0, r0, r1
	strh r0, [r6, #0x36]
	ldrh r0, [r4, #0xa]
	strh r0, [r6, #0x38]
	adds r0, r6, #0
	bl InitAnimArcTranslation
	ldr r0, _080A71E0
	str r0, [r6, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A71D4: .4byte 0x020380D6
_080A71D8: .4byte 0x020380BE
_080A71DC: .4byte 0x020380D7
_080A71E0: .4byte 0x080A71E5
	thumb_func_end sub_080A7174

	thumb_func_start sub_080A71E4
sub_080A71E4: @ 0x080A71E4
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A71F8
	adds r0, r4, #0
	bl DestroyAnimSprite
_080A71F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A71E4

	thumb_func_start sub_080A7200
sub_080A7200: @ 0x080A7200
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _080A7214
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bne _080A7218
	movs r4, #1
	movs r7, #3
	b _080A721C
	.align 2, 0
_080A7214: .4byte 0x020380BE
_080A7218:
	movs r4, #0
	movs r7, #1
_080A721C:
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080A7234
	adds r0, r5, #0
	adds r1, r4, #0
	bl InitSpritePosToAnimAttacker
	ldr r0, _080A7230
	b _080A723E
	.align 2, 0
_080A7230: .4byte 0x020380D6
_080A7234:
	adds r0, r5, #0
	adds r1, r4, #0
	bl InitSpritePosToAnimTarget
	ldr r0, _080A729C
_080A723E:
	ldrb r6, [r0]
	ldr r0, _080A72A0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7256
	ldr r1, _080A72A4
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_080A7256:
	adds r0, r5, #0
	adds r1, r4, #0
	bl InitSpritePosToAnimTarget
	ldr r4, _080A72A4
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r5, #0x32]
	adds r0, r6, #0
	adds r1, r7, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r4, [r4, #6]
	adds r0, r0, r4
	strh r0, [r5, #0x36]
	ldr r0, _080A72A8
	str r0, [r5, #0x1c]
	ldr r1, _080A72AC
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A729C: .4byte 0x020380D7
_080A72A0: .4byte 0x020380D6
_080A72A4: .4byte 0x020380BE
_080A72A8: .4byte 0x080A67B5
_080A72AC: .4byte 0x080A34C5
	thumb_func_end sub_080A7200

	thumb_func_start CloneBattlerSpriteWithBlend
CloneBattlerSpriteWithBlend: @ 0x080A72B0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq _080A731A
	movs r6, #0
	ldr r2, _080A730C
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r1, r0, #2
_080A72CC:
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r4, r0, r2
	adds r5, r4, #0
	adds r5, #0x3e
	ldrb r0, [r5]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080A7310
	adds r0, r4, #0
	adds r1, r1, r2
	movs r2, #0x44
	bl memcpy
	ldrb r1, [r4, #1]
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r4, #1]
	ldrb r0, [r5]
	adds r2, #8
	adds r1, r2, #0
	ands r0, r1
	strb r0, [r5]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	b _080A731E
	.align 2, 0
_080A730C: .4byte 0x020205AC
_080A7310:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x3f
	bls _080A72CC
_080A731A:
	movs r0, #1
	rsbs r0, r0, #0
_080A731E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end CloneBattlerSpriteWithBlend

	thumb_func_start obj_delete_but_dont_free_vram
obj_delete_but_dont_free_vram: @ 0x080A7324
	push {lr}
	adds r3, r0, #0
	adds r3, #0x3f
	ldrb r1, [r3]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	bl DestroySprite
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end obj_delete_but_dont_free_vram

	thumb_func_start sub_080A733C
sub_080A733C: @ 0x080A733C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	movs r3, #0
	ldr r2, _080A73B4
	movs r0, #4
	ldrsh r1, [r2, r0]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r1, r0
	ble _080A7356
	movs r3, #1
_080A7356:
	cmp r1, r0
	bge _080A735C
	ldr r3, _080A73B8
_080A735C:
	movs r0, #6
	ldrsh r1, [r2, r0]
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r1, r0
	ble _080A736A
	movs r6, #1
_080A736A:
	cmp r1, r0
	bge _080A7370
	ldr r6, _080A73B8
_080A7370:
	ldr r0, _080A73BC
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r1, #0
	strh r1, [r4, #8]
	ldrh r0, [r2, #8]
	strh r0, [r4, #0xa]
	strh r1, [r4, #0xc]
	ldrh r0, [r2]
	strh r0, [r4, #0xe]
	ldrh r0, [r2, #2]
	strh r0, [r4, #0x10]
	strh r3, [r4, #0x12]
	strh r6, [r4, #0x14]
	ldrh r0, [r2, #4]
	strh r0, [r4, #0x16]
	ldrh r0, [r2, #6]
	strh r0, [r4, #0x18]
	ldrh r1, [r2, #2]
	lsls r1, r1, #8
	ldrh r0, [r2]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldr r0, _080A73C0
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A73B4: .4byte 0x020380BE
_080A73B8: .4byte 0x0000FFFF
_080A73BC: .4byte 0x03005B60
_080A73C0: .4byte 0x080A73C5
	thumb_func_end sub_080A733C

	thumb_func_start sub_080A73C4
sub_080A73C4: @ 0x080A73C4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080A7410
	adds r4, r0, r1
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080A7458
	movs r0, #0
	strh r0, [r4, #8]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A7414
	ldrh r2, [r4, #0xe]
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _080A7428
	ldrh r0, [r4, #0x12]
	adds r0, r2, r0
	strh r0, [r4, #0xe]
	b _080A7428
	.align 2, 0
_080A7410: .4byte 0x03005B60
_080A7414:
	ldrh r2, [r4, #0x10]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r3, #0x18
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _080A7428
	ldrh r0, [r4, #0x14]
	adds r0, r2, r0
	strh r0, [r4, #0x10]
_080A7428:
	ldrh r1, [r4, #0x10]
	lsls r1, r1, #8
	ldrh r0, [r4, #0xe]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080A7458
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080A7458
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_080A7458:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A73C4

	thumb_func_start AnimTask_BlendMonInAndOut
AnimTask_BlendMonInAndOut: @ 0x080A7460
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A7480
	ldrb r0, [r0]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xff
	bne _080A7484
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _080A74AA
	.align 2, 0
_080A7480: .4byte 0x020380BE
_080A7484:
	ldr r1, _080A74B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, _080A74B4
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #5]
	lsrs r1, r1, #4
	lsls r1, r1, #4
	ldr r3, _080A74B8
	adds r2, r3, #0
	adds r1, r1, r2
	strh r1, [r0, #8]
	bl AnimTask_BlendMonInAndOutSetup
_080A74AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A74B0: .4byte 0x03005B60
_080A74B4: .4byte 0x020205AC
_080A74B8: .4byte 0x00000101
	thumb_func_end AnimTask_BlendMonInAndOut

	thumb_func_start AnimTask_BlendMonInAndOutSetup
AnimTask_BlendMonInAndOutSetup: @ 0x080A74BC
	ldr r3, _080A74DC
	ldrh r1, [r3, #2]
	movs r2, #0
	strh r1, [r0, #0xa]
	strh r2, [r0, #0xc]
	ldrh r1, [r3, #4]
	strh r1, [r0, #0xe]
	strh r2, [r0, #0x10]
	ldrh r1, [r3, #6]
	strh r1, [r0, #0x12]
	strh r2, [r0, #0x14]
	ldrh r1, [r3, #8]
	strh r1, [r0, #0x16]
	ldr r1, _080A74E0
	str r1, [r0]
	bx lr
	.align 2, 0
_080A74DC: .4byte 0x020380BE
_080A74E0: .4byte 0x080A74E5
	thumb_func_end AnimTask_BlendMonInAndOutSetup

	thumb_func_start AnimTask_BlendMonInAndOutStep
AnimTask_BlendMonInAndOutStep: @ 0x080A74E4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080A753C
	adds r4, r0, r1
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080A7574
	movs r0, #0
	strh r0, [r4, #0x10]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080A7540
	ldrh r2, [r4, #0xc]
	adds r2, #1
	strh r2, [r4, #0xc]
	ldrh r0, [r4, #8]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrh r3, [r4, #0xa]
	movs r1, #0xf
	bl BlendPalette
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080A7574
	movs r0, #1
	strh r0, [r4, #0x14]
	b _080A7574
	.align 2, 0
_080A753C: .4byte 0x03005B60
_080A7540:
	ldrh r2, [r4, #0xc]
	subs r2, #1
	strh r2, [r4, #0xc]
	ldrh r0, [r4, #8]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrh r3, [r4, #0xa]
	movs r1, #0xf
	bl BlendPalette
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _080A7574
	ldrh r0, [r4, #0x16]
	subs r0, #1
	strh r0, [r4, #0x16]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080A756E
	strh r1, [r4, #0x10]
	strh r1, [r4, #0x14]
	b _080A7574
_080A756E:
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_080A7574:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_BlendMonInAndOutStep

	thumb_func_start sub_080A757C
sub_080A757C: @ 0x080A757C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A759C
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _080A75A0
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _080A75B6
	.align 2, 0
_080A759C: .4byte 0x020380BE
_080A75A0:
	ldr r1, _080A75BC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	lsls r1, r2, #4
	ldr r2, _080A75C0
	adds r1, r1, r2
	strh r1, [r0, #8]
	bl AnimTask_BlendMonInAndOutSetup
_080A75B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A75BC: .4byte 0x03005B60
_080A75C0: .4byte 0x00000101
	thumb_func_end sub_080A757C

	thumb_func_start PrepareAffineAnimInTaskData
PrepareAffineAnimInTaskData: @ 0x080A75C4
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	strh r1, [r3, #0x16]
	strh r1, [r3, #0x18]
	strh r1, [r3, #0x1a]
	strh r4, [r3, #0x26]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x1c]
	strh r0, [r3, #0x1e]
	strh r1, [r3, #0x20]
	adds r0, r3, #0
	adds r0, #0x22
	adds r3, #0x24
	adds r1, r3, #0
	bl StorePointerInVars
	adds r0, r4, #0
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PrepareAffineAnimInTaskData

	thumb_func_start RunAffineAnimFromTaskData
RunAffineAnimFromTaskData: @ 0x080A75FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _080A769C
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	bl LoadPointerFromVars
	movs r3, #0x16
	ldrsh r1, [r4, r3]
	lsls r1, r1, #3
	adds r1, r0, r1
	str r1, [r5]
	movs r6, #0
	ldrsh r2, [r1, r6]
	ldr r0, _080A76A0
	cmp r2, r0
	beq _080A76A4
	cmp r2, r0
	bgt _080A7704
	subs r0, #1
	cmp r2, r0
	beq _080A76AA
	ldrb r0, [r1, #5]
	cmp r0, #0
	bne _080A764A
	ldrh r0, [r1]
	strh r0, [r4, #0x1c]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x1e]
	ldrb r0, [r1, #4]
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
	adds r0, r1, #0
	adds r0, #8
	str r0, [r5]
_080A764A:
	ldr r1, [r5]
	ldrh r0, [r1]
	ldrh r2, [r4, #0x1c]
	adds r0, r0, r2
	strh r0, [r4, #0x1c]
	ldrh r0, [r1, #2]
	ldrh r3, [r4, #0x1e]
	adds r0, r0, r3
	strh r0, [r4, #0x1e]
	ldrh r0, [r4, #0x20]
	ldrb r1, [r1, #4]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0x1c
	ldrsh r1, [r4, r6]
	movs r3, #0x1e
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, #0x20]
	bl SetSpriteRotScale
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromYScale
	ldrh r0, [r4, #0x18]
	adds r0, #1
	strh r0, [r4, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5]
	ldrb r1, [r1, #5]
	cmp r0, r1
	blt _080A772A
	movs r0, #0
	strh r0, [r4, #0x18]
	b _080A76FC
	.align 2, 0
_080A769C: .4byte 0x020380E4
_080A76A0: .4byte 0x00007FFE
_080A76A4:
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x16]
	b _080A772A
_080A76AA:
	ldrh r2, [r1, #2]
	movs r6, #2
	ldrsh r0, [r1, r6]
	cmp r0, #0
	beq _080A76FC
	ldrh r1, [r4, #0x1a]
	movs r3, #0x1a
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080A76CA
	subs r0, r1, #1
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080A76CC
	b _080A76FC
_080A76CA:
	strh r2, [r4, #0x1a]
_080A76CC:
	movs r6, #0x16
	ldrsh r0, [r4, r6]
	cmp r0, #0
	beq _080A772A
	ldr r3, _080A76F4
	ldr r5, _080A76F8
_080A76D8:
	ldrh r2, [r4, #0x16]
	subs r1, r2, #1
	strh r1, [r4, #0x16]
	ldr r0, [r3]
	subs r0, #8
	str r0, [r3]
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, r5
	beq _080A7728
	lsls r0, r1, #0x10
	cmp r0, #0
	bne _080A76D8
	b _080A772A
	.align 2, 0
_080A76F4: .4byte 0x020380E4
_080A76F8: .4byte 0x00007FFD
_080A76FC:
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
	b _080A772A
_080A7704:
	ldr r2, _080A7724
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x26]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ResetSpriteRotScale
	movs r0, #0
	b _080A772C
	.align 2, 0
_080A7724: .4byte 0x020205AC
_080A7728:
	strh r2, [r4, #0x16]
_080A772A:
	movs r0, #1
_080A772C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RunAffineAnimFromTaskData

	thumb_func_start SetBattlerSpriteYOffsetFromYScale
SetBattlerSpriteYOffsetFromYScale: @ 0x080A7734
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl GetBattlerYDeltaFromSpriteId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	movs r1, #0x40
	subs r5, r1, r0
	ldr r1, _080A7780
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrb r1, [r4, #3]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1b
	lsls r0, r5, #8
	ldr r2, _080A7784
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, #0x80
	ble _080A7770
	movs r0, #0x80
_080A7770:
	subs r0, r5, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x26]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7780: .4byte 0x020205AC
_080A7784: .4byte 0x02021B3C
	thumb_func_end SetBattlerSpriteYOffsetFromYScale

	thumb_func_start SetBattlerSpriteYOffsetFromOtherYScale
SetBattlerSpriteYOffsetFromOtherYScale: @ 0x080A7788
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerYDeltaFromSpriteId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	movs r1, #0x40
	subs r5, r1, r0
	ldr r1, _080A77D8
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrb r1, [r4, #3]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1b
	lsls r0, r5, #8
	ldr r2, _080A77DC
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, #0x80
	ble _080A77C8
	movs r0, #0x80
_080A77C8:
	subs r0, r5, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x26]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A77D8: .4byte 0x020205AC
_080A77DC: .4byte 0x02021B3C
	thumb_func_end SetBattlerSpriteYOffsetFromOtherYScale

	thumb_func_start GetBattlerYDeltaFromSpriteId
GetBattlerYDeltaFromSpriteId: @ 0x080A77E0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080A7828
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x2e]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r1, _080A782C
	ldr r7, _080A7830
	ldr r0, _080A7834
	adds r6, r5, r0
_080A7800:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, r2
	beq _080A780A
	b _080A78FC
_080A780A:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7840
	ldr r0, _080A7838
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r2, [r0]
	ldr r1, _080A783C
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	b _080A790A
	.align 2, 0
_080A7828: .4byte 0x020205AC
_080A782C: .4byte 0x02023E88
_080A7830: .4byte 0x00000181
_080A7834: .4byte 0x02024188
_080A7838: .4byte 0x02039BD4
_080A783C: .4byte 0x082D5A68
_080A7840:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A78A0
	ldr r0, _080A787C
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080A7888
	ldr r1, _080A7880
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A7884
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080A788A
	.align 2, 0
_080A787C: .4byte 0x02024174
_080A7880: .4byte 0x02023D12
_080A7884: .4byte 0x02024190
_080A7888:
	ldrh r2, [r1, #2]
_080A788A:
	cmp r2, r7
	bne _080A7898
	ldr r0, _080A7894
	b _080A78E0
	.align 2, 0
_080A7894: .4byte 0x084FE698
_080A7898:
	ldr r0, _080A789C
	b _080A78EE
	.align 2, 0
_080A789C: .4byte 0x082D5A68
_080A78A0:
	ldr r0, _080A78CC
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080A78D8
	ldr r1, _080A78D0
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A78D4
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080A78DA
	.align 2, 0
_080A78CC: .4byte 0x02024174
_080A78D0: .4byte 0x02023D12
_080A78D4: .4byte 0x020243E8
_080A78D8:
	ldrh r2, [r1, #2]
_080A78DA:
	cmp r2, r7
	bne _080A78EC
	ldr r0, _080A78E8
_080A78E0:
	ldrb r1, [r6]
	adds r1, r1, r0
	ldrb r0, [r1]
	b _080A790A
	.align 2, 0
_080A78E8: .4byte 0x084FE694
_080A78EC:
	ldr r0, _080A78F8
_080A78EE:
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	b _080A790A
	.align 2, 0
_080A78F8: .4byte 0x082D45C8
_080A78FC:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bhi _080A7908
	b _080A7800
_080A7908:
	movs r0, #0x40
_080A790A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetBattlerYDeltaFromSpriteId

	thumb_func_start StorePointerInVars
StorePointerInVars: @ 0x080A7910
	strh r2, [r0]
	asrs r2, r2, #0x10
	strh r2, [r1]
	bx lr
	thumb_func_end StorePointerInVars

	thumb_func_start LoadPointerFromVars
LoadPointerFromVars: @ 0x080A7918
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	orrs r0, r1
	bx lr
	.align 2, 0
	thumb_func_end LoadPointerFromVars

	thumb_func_start sub_080A7924
sub_080A7924: @ 0x080A7924
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r3, #0
	ldr r0, [sp, #0x14]
	ldr r4, [sp, #0x18]
	ldr r6, [sp, #0x1c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r3, r8
	strh r6, [r3, #0x18]
	strh r1, [r3, #0x26]
	strh r2, [r3, #0x1a]
	strh r5, [r3, #0x1c]
	strh r0, [r3, #0x22]
	strh r4, [r3, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r0, r0, r2
	adds r1, r6, #0
	bl __divsi3
	mov r1, r8
	strh r0, [r1, #0x1e]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	subs r4, r4, r5
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	mov r3, r8
	strh r0, [r3, #0x20]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A7924

	thumb_func_start sub_080A7990
sub_080A7990: @ 0x080A7990
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x18]
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _080A79A2
	movs r0, #0
	b _080A79FE
_080A79A2:
	subs r0, r1, #1
	strh r0, [r4, #0x18]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080A79BC
	ldrh r0, [r4, #0x1e]
	ldrh r3, [r4, #0x1a]
	adds r0, r0, r3
	strh r0, [r4, #0x1a]
	ldrh r0, [r4, #0x20]
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	b _080A79C2
_080A79BC:
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x1a]
	ldrh r0, [r4, #0x24]
_080A79C2:
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x1a
	ldrsh r1, [r4, r2]
	movs r3, #0x1c
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl SetSpriteRotScale
	movs r0, #0x18
	ldrsh r3, [r4, r0]
	cmp r3, #0
	beq _080A79EC
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromYScale
	b _080A79FC
_080A79EC:
	ldr r2, _080A7A04
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x26]
_080A79FC:
	ldrb r0, [r4, #0x18]
_080A79FE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A7A04: .4byte 0x020205AC
	thumb_func_end sub_080A7990

	thumb_func_start AnimTask_GetFrustrationPowerLevel
AnimTask_GetFrustrationPowerLevel: @ 0x080A7A08
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080A7A34
	ldrb r0, [r0]
	movs r1, #0
	cmp r0, #0x1e
	bls _080A7A26
	movs r1, #1
	cmp r0, #0x64
	bls _080A7A26
	movs r1, #3
	cmp r0, #0xc8
	bhi _080A7A26
	movs r1, #2
_080A7A26:
	ldr r0, _080A7A38
	strh r1, [r0, #0xe]
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080A7A34: .4byte 0x020380BA
_080A7A38: .4byte 0x020380BE
	thumb_func_end AnimTask_GetFrustrationPowerLevel

	thumb_func_start sub_080A7A3C
sub_080A7A3C: @ 0x080A7A3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	ldr r6, _080A7B30
	ldrb r0, [r6]
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7A7C
	ldr r2, _080A7B34
	ldr r1, _080A7B38
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #3
	adds r2, r4, #0
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
_080A7A7C:
	ldr r0, _080A7B3C
	mov r8, r0
	ldrb r0, [r0]
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7AB4
	ldr r2, _080A7B34
	ldr r1, _080A7B38
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #3
	adds r2, r4, #0
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
_080A7AB4:
	ldrb r0, [r6]
	movs r5, #2
	eors r0, r5
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7AEC
	ldr r2, _080A7B34
	ldr r1, _080A7B38
	ldrb r0, [r6]
	eors r0, r5
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #3
	adds r2, r4, #0
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
_080A7AEC:
	mov r1, r8
	ldrb r0, [r1]
	eors r0, r5
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7B24
	ldr r2, _080A7B34
	ldr r1, _080A7B38
	mov r3, r8
	ldrb r0, [r3]
	eors r0, r5
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #3
	ands r7, r0
	lsls r3, r7, #2
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
_080A7B24:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B30: .4byte 0x020380D7
_080A7B34: .4byte 0x020205AC
_080A7B38: .4byte 0x02023E88
_080A7B3C: .4byte 0x020380D6
	thumb_func_end sub_080A7A3C

	thumb_func_start sub_080A7B40
sub_080A7B40: @ 0x080A7B40
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r0, _080A7BA0
	ldrb r0, [r0]
	cmp r5, r0
	bge _080A7B9A
	ldr r6, _080A7BA4
_080A7B4E:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7B90
	adds r0, r4, #0
	bl GetBattlerSpriteSubpriority
	ldr r3, _080A7BA8
	adds r3, r5, r3
	ldrb r2, [r3]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r1, #0x43
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r2, [r0, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r2, r1
	movs r1, #8
	orrs r2, r1
	strb r2, [r0, #5]
_080A7B90:
	adds r5, #1
	ldr r0, _080A7BA0
	ldrb r0, [r0]
	cmp r5, r0
	blt _080A7B4E
_080A7B9A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7BA0: .4byte 0x02023D10
_080A7BA4: .4byte 0x020205AC
_080A7BA8: .4byte 0x02023E88
	thumb_func_end sub_080A7B40

	thumb_func_start GetBattlerSpriteSubpriority
GetBattlerSpriteSubpriority: @ 0x080A7BAC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7BC8
	cmp r4, #2
	bne _080A7BC4
	movs r0, #0x1e
	b _080A7BE8
_080A7BC4:
	movs r0, #0x28
	b _080A7BE8
_080A7BC8:
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x1e
	cmp r0, #0
	beq _080A7BE6
	movs r1, #0x14
	cmp r0, #2
	beq _080A7BE6
	movs r1, #0x32
	cmp r0, #1
	bne _080A7BE6
	movs r1, #0x28
_080A7BE6:
	adds r0, r1, #0
_080A7BE8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattlerSpriteSubpriority

	thumb_func_start GetBattlerSpriteBGPriority
GetBattlerSpriteBGPriority: @ 0x080A7BF0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7C0C
	movs r0, #2
	b _080A7C24
_080A7C0C:
	cmp r4, #0
	beq _080A7C14
	cmp r4, #3
	bne _080A7C18
_080A7C14:
	movs r0, #2
	b _080A7C1A
_080A7C18:
	movs r0, #1
_080A7C1A:
	movs r1, #4
	bl GetAnimBgAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080A7C24:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattlerSpriteBGPriority

	thumb_func_start GetBattlerSpriteBGPriorityRank
GetBattlerSpriteBGPriorityRank: @ 0x080A7C2C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A7C52
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080A7C4E
	cmp r0, #3
	bne _080A7C52
_080A7C4E:
	movs r0, #2
	b _080A7C54
_080A7C52:
	movs r0, #1
_080A7C54:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattlerSpriteBGPriorityRank

	thumb_func_start sub_080A7C5C
sub_080A7C5C: @ 0x080A7C5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r4, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, [sp, #0x38]
	mov r8, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp, #4]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #8]
	lsls r0, r7, #3
	ldr r1, _080A7D3C
	adds r0, r0, r1
	bl LoadSpriteSheet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r1, _080A7D40
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _080A7D44
	ldr r0, [r4]
	cmp r0, #0
	beq _080A7CDA
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _080A7CDA
	movs r0, #0x80
	lsls r0, r0, #6
	bl AllocZeroed
	ldr r1, [r4]
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
_080A7CDA:
	mov r3, sb
	cmp r3, #0
	bne _080A7D78
	adds r0, r6, #0
	ldr r1, [sp, #0x3c]
	mov r2, r8
	bl GetMonSpritePalFromSpeciesAndPersonality
	lsls r1, r5, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r3, [sp, #0x44]
	cmp r3, #1
	beq _080A7D26
	ldr r0, [sp, #0x40]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r0, #5
	bl sub_08068438
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080A7D26
	ldr r0, _080A7D48
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [sp, #0x40]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _080A7D50
_080A7D26:
	lsls r0, r6, #3
	ldr r1, _080A7D4C
	adds r0, r0, r1
	ldr r1, _080A7D44
	ldr r1, [r1]
	movs r3, #0xbe
	lsls r3, r3, #1
	adds r1, r1, r3
	ldr r1, [r1]
	movs r2, #1
	b _080A7DD2
	.align 2, 0
_080A7D3C: .4byte 0x084FE6CC
_080A7D40: .4byte 0x084FE69C
_080A7D44: .4byte 0x02024178
_080A7D48: .4byte 0x02024174
_080A7D4C: .4byte 0x082DDA1C
_080A7D50:
	lsls r0, r6, #3
	ldr r1, _080A7D70
	adds r0, r0, r1
	ldr r1, _080A7D74
	ldr r1, [r1]
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #1
	str r2, [sp]
	adds r2, r6, #0
	mov r3, r8
	bl LoadSpecialPokePic_2
	b _080A7E08
	.align 2, 0
_080A7D70: .4byte 0x082DDA1C
_080A7D74: .4byte 0x02024178
_080A7D78:
	adds r0, r6, #0
	ldr r1, [sp, #0x3c]
	mov r2, r8
	bl GetMonSpritePalFromSpeciesAndPersonality
	lsls r1, r5, #0x14
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r1, r1, r3
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r0, [sp, #0x44]
	cmp r0, #1
	beq _080A7DBE
	ldr r2, [sp, #0x40]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	movs r0, #5
	bl sub_08068438
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080A7DBE
	ldr r0, _080A7DE0
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r3, [sp, #0x40]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	cmp r2, #0
	beq _080A7DEC
_080A7DBE:
	lsls r0, r6, #3
	ldr r1, _080A7DE4
	adds r0, r0, r1
	ldr r1, _080A7DE8
	ldr r1, [r1]
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0
_080A7DD2:
	str r2, [sp]
	adds r2, r6, #0
	mov r3, r8
	bl LoadSpecialPokePic_DontHandleDeoxys
	b _080A7E08
	.align 2, 0
_080A7DE0: .4byte 0x02024174
_080A7DE4: .4byte 0x082D6148
_080A7DE8: .4byte 0x02024178
_080A7DEC:
	lsls r0, r6, #3
	ldr r1, _080A7E54
	adds r0, r0, r1
	ldr r1, _080A7E58
	ldr r1, [r1]
	movs r3, #0xbe
	lsls r3, r3, #1
	adds r1, r1, r3
	ldr r1, [r1]
	str r2, [sp]
	adds r2, r6, #0
	mov r3, r8
	bl LoadSpecialPokePic_2
_080A7E08:
	ldr r5, _080A7E58
	ldr r0, [r5]
	movs r4, #0xbe
	lsls r4, r4, #1
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [sp, #0xc]
	lsls r1, r2, #5
	ldr r3, _080A7E5C
	adds r1, r1, r3
	movs r2, #0x80
	lsls r2, r2, #4
	movs r3, #1
	bl RequestDma3Copy
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	mov r0, sb
	cmp r0, #0
	bne _080A7E68
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _080A7E60
	adds r0, r0, r1
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080A7E64
	b _080A7E7A
	.align 2, 0
_080A7E54: .4byte 0x082D6148
_080A7E58: .4byte 0x02024178
_080A7E5C: .4byte 0x06010000
_080A7E60: .4byte 0x084FE69C
_080A7E64: .4byte 0x082D45C8
_080A7E68:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _080A7EC8
	adds r0, r0, r1
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080A7ECC
_080A7E7A:
	lsls r2, r6, #2
	adds r2, r2, r3
	ldrb r2, [r2, #1]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, [sp, #8]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7EB6
	ldr r3, _080A7ED0
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x10
	adds r1, r0, r1
	ldr r2, _080A7ED4
	str r2, [r1]
	adds r0, r0, r3
	movs r1, #0
	bl StartSpriteAffineAnim
_080A7EB6:
	adds r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A7EC8: .4byte 0x084FE69C
_080A7ECC: .4byte 0x082D5A68
_080A7ED0: .4byte 0x020205AC
_080A7ED4: .4byte 0x082D2F50
	thumb_func_end sub_080A7C5C

	thumb_func_start DestroySpriteAndFreeResources_
DestroySpriteAndFreeResources_: @ 0x080A7ED8
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DestroySpriteAndFreeResources_

	thumb_func_start GetBattlerSpriteCoordAttr
GetBattlerSpriteCoordAttr: @ 0x080A7EE4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7F8C
	ldr r0, _080A7F18
	ldr r0, [r0]
	ldr r2, [r0, #0x18]
	ldrb r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A7F1C
	ldrh r7, [r2, #2]
	ldr r2, [r2, #0x10]
	b _080A7F20
	.align 2, 0
_080A7F18: .4byte 0x02039BD4
_080A7F1C:
	ldrh r7, [r2]
	ldr r2, [r2, #8]
_080A7F20:
	cmp r7, #0xc9
	bne _080A7F6C
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
	bne _080A7F58
	movs r0, #0xc9
	b _080A7F62
_080A7F58:
	movs r1, #0xce
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080A7F62:
	lsls r1, r0, #2
	ldr r0, _080A7F68
	b _080A812C
	.align 2, 0
_080A7F68: .4byte 0x082D5A68
_080A7F6C:
	ldr r0, _080A7F84
	cmp r7, r0
	bne _080A7F74
	b _080A80FC
_080A7F74:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r7, r0
	bhi _080A8044
	lsls r1, r7, #2
	ldr r0, _080A7F88
	b _080A812C
	.align 2, 0
_080A7F84: .4byte 0x00000181
_080A7F88: .4byte 0x082D5A68
_080A7F8C:
	mov r0, r8
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A8058
	ldr r0, _080A7FD8
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #2
	adds r1, r2, r0
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080A7FE4
	ldr r0, _080A7FDC
	mov r1, r8
	lsls r4, r1, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080A7FE0
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0
	bl GetMonData
	adds r2, r0, #0
	b _080A7FEC
	.align 2, 0
_080A7FD8: .4byte 0x02024174
_080A7FDC: .4byte 0x02023D12
_080A7FE0: .4byte 0x02024190
_080A7FE4:
	ldrh r7, [r1, #2]
	ldr r0, _080A8024
	adds r0, r2, r0
	ldr r2, [r0]
_080A7FEC:
	cmp r7, #0xc9
	bne _080A803C
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
	bne _080A8028
	movs r0, #0xc9
	b _080A8032
	.align 2, 0
_080A8024: .4byte 0x02024160
_080A8028:
	movs r1, #0xce
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080A8032:
	lsls r1, r0, #2
	ldr r0, _080A8038
	b _080A812C
	.align 2, 0
_080A8038: .4byte 0x082D5A68
_080A803C:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r7, r0
	bls _080A804C
_080A8044:
	ldr r4, _080A8048
	b _080A812E
	.align 2, 0
_080A8048: .4byte 0x082D5A68
_080A804C:
	lsls r1, r7, #2
	ldr r0, _080A8054
	b _080A812C
	.align 2, 0
_080A8054: .4byte 0x082D5A68
_080A8058:
	ldr r0, _080A8098
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #2
	adds r1, r2, r0
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080A80A4
	ldr r0, _080A809C
	mov r1, r8
	lsls r4, r1, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080A80A0
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0
	bl GetMonData
	adds r2, r0, #0
	b _080A80AC
	.align 2, 0
_080A8098: .4byte 0x02024174
_080A809C: .4byte 0x02023D12
_080A80A0: .4byte 0x020243E8
_080A80A4:
	ldrh r7, [r1, #2]
	ldr r0, _080A80E4
	adds r0, r2, r0
	ldr r2, [r0]
_080A80AC:
	cmp r7, #0xc9
	bne _080A80F6
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
	bne _080A80E8
	movs r0, #0xc9
	b _080A80F2
	.align 2, 0
_080A80E4: .4byte 0x02024160
_080A80E8:
	movs r1, #0xce
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080A80F2:
	lsls r1, r0, #2
	b _080A812A
_080A80F6:
	ldr r0, _080A810C
	cmp r7, r0
	bne _080A8118
_080A80FC:
	ldr r0, _080A8110
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r1, _080A8114
	adds r4, r0, r1
	b _080A812E
	.align 2, 0
_080A810C: .4byte 0x00000181
_080A8110: .4byte 0x02024188
_080A8114: .4byte 0x084FE684
_080A8118:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r7, r0
	bls _080A8128
	ldr r4, _080A8124
	b _080A812E
	.align 2, 0
_080A8124: .4byte 0x082D45C8
_080A8128:
	lsls r1, r7, #2
_080A812A:
	ldr r0, _080A8140
_080A812C:
	adds r4, r1, r0
_080A812E:
	mov r0, sb
	cmp r0, #6
	bhi _080A81DE
	lsls r0, r0, #2
	ldr r1, _080A8144
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A8140: .4byte 0x082D45C8
_080A8144: .4byte 0x080A8148
_080A8148: @ jump table
	.4byte _080A8164 @ case 0
	.4byte _080A816E @ case 1
	.4byte _080A819A @ case 2
	.4byte _080A81B2 @ case 3
	.4byte _080A8176 @ case 4
	.4byte _080A8188 @ case 5
	.4byte _080A81CA @ case 6
_080A8164:
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #3
	b _080A81E0
_080A816E:
	ldrb r0, [r4]
	lsrs r0, r0, #4
	lsls r0, r0, #3
	b _080A81E0
_080A8176:
	mov r0, r8
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	lsrs r1, r1, #4
	b _080A81AC
_080A8188:
	mov r0, r8
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	lsrs r1, r1, #4
	b _080A81C4
_080A819A:
	mov r0, r8
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r4]
	movs r1, #0xf
	ands r1, r2
_080A81AC:
	lsls r1, r1, #2
	subs r0, r0, r1
	b _080A81E0
_080A81B2:
	mov r0, r8
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r4]
	movs r1, #0xf
	ands r1, r2
_080A81C4:
	lsls r1, r1, #2
	adds r0, r0, r1
	b _080A81E0
_080A81CA:
	mov r0, r8
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x1f
	ldrb r1, [r4, #1]
	subs r0, r0, r1
	b _080A81E0
_080A81DE:
	movs r0, #0
_080A81E0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetBattlerSpriteCoordAttr

	thumb_func_start SetAverageBattlerPositions
SetAverageBattlerPositions: @ 0x080A81EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r2
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _080A820A
	movs r5, #0
	movs r6, #1
	b _080A820E
_080A820A:
	movs r5, #2
	movs r6, #3
_080A820E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r4, #0
	adds r1, r6, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A8260
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A8260
	movs r0, #2
	eors r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	adds r1, r6, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r0, r8
	lsls r1, r0, #0x10
	lsls r2, r7, #0x10
	b _080A826C
_080A8260:
	mov r0, r8
	lsls r1, r0, #0x10
	lsrs r5, r1, #0x10
	lsls r0, r7, #0x10
	lsrs r3, r0, #0x10
	adds r2, r0, #0
_080A826C:
	asrs r0, r1, #0x10
	adds r0, r0, r5
	asrs r0, r0, #1
	mov r1, sb
	strh r0, [r1]
	asrs r0, r2, #0x10
	adds r0, r0, r3
	asrs r0, r0, #1
	mov r1, sl
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetAverageBattlerPositions

	thumb_func_start sub_080A8290
sub_080A8290: @ 0x080A8290
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	lsls r6, r1, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080A8328
	mov sl, r0
	bl CreateInvisibleSpriteWithCallback
	mov r8, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080A832C
	mov sb, r0
	mov r0, r8
	lsls r3, r0, #4
	add r3, r8
	lsls r3, r3, #2
	mov r0, sb
	adds r5, r3, r0
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	add r4, sb
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x44
	str r3, [sp]
	bl memcpy
	adds r2, r5, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r2, [r5, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r5, #5]
	ldrb r0, [r5, #1]
	ands r1, r0
	movs r0, #8
	orrs r1, r0
	strb r1, [r5, #1]
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldrh r2, [r5, #4]
	ldr r0, _080A8330
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #0x1c
	add sb, r0
	ldr r3, [sp]
	add r3, sb
	mov r0, sl
	str r0, [r3]
	mov r0, r8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A8328: .4byte 0x08007141
_080A832C: .4byte 0x020205AC
_080A8330: .4byte 0xFFFFFC00
	thumb_func_end sub_080A8290

	thumb_func_start sub_080A8334
sub_080A8334: @ 0x080A8334
	push {r4, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r0, _080A836C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A8374
	ldr r2, _080A8370
	ldrh r0, [r4, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r2, #6]
	rsbs r0, r0, #0
	strh r0, [r2, #6]
	adds r3, r4, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	movs r1, #1
	orrs r0, r1
	strb r0, [r3]
	adds r1, r2, #0
	b _080A837E
	.align 2, 0
_080A836C: .4byte 0x020380D6
_080A8370: .4byte 0x020380BE
_080A8374:
	ldr r1, _080A83A8
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
_080A837E:
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
	ldr r1, _080A83AC
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A83B0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A83A8: .4byte 0x020380BE
_080A83AC: .4byte 0x080A6015
_080A83B0: .4byte 0x080A5FA5
	thumb_func_end sub_080A8334

	thumb_func_start sub_080A83B4
sub_080A83B4: @ 0x080A83B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A83DC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A83E4
	ldr r2, _080A83E0
	ldrh r0, [r4, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	movs r1, #6
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	strh r0, [r2, #6]
	adds r1, r2, #0
	b _080A83EE
	.align 2, 0
_080A83DC: .4byte 0x020380D6
_080A83E0: .4byte 0x020380BE
_080A83E4:
	ldr r1, _080A8420
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
_080A83EE:
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
	bl StartSpriteAnim
	ldr r1, _080A8424
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _080A8428
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8420: .4byte 0x020380BE
_080A8424: .4byte 0x080A6015
_080A8428: .4byte 0x080A5FA5
	thumb_func_end sub_080A83B4

	thumb_func_start sub_080A842C
sub_080A842C: @ 0x080A842C
	push {r4, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r0, _080A8450
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A8458
	ldr r0, _080A8454
	ldrh r1, [r4, #0x20]
	ldrh r2, [r0]
	subs r1, r1, r2
	strh r1, [r4, #0x20]
	b _080A8464
	.align 2, 0
_080A8450: .4byte 0x020380D6
_080A8454: .4byte 0x020380BE
_080A8458:
	ldr r1, _080A8480
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	adds r0, r1, #0
_080A8464:
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, _080A8484
	str r0, [r4, #0x1c]
	ldr r1, _080A8488
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8480: .4byte 0x020380BE
_080A8484: .4byte 0x080A60A1
_080A8488: .4byte 0x080A34C5
	thumb_func_end sub_080A842C

	thumb_func_start sub_080A848C
sub_080A848C: @ 0x080A848C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080A8520
	adds r5, r1, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	strh r0, [r5, #8]
	ldr r7, _080A8524
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r1, #8
	cmp r0, #0
	beq _080A84C0
	movs r0, #8
	rsbs r0, r0, #0
	adds r1, r0, #0
_080A84C0:
	strh r1, [r5, #0xa]
	strh r6, [r5, #0xc]
	strh r6, [r5, #0xe]
	ldr r4, _080A8528
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x24]
	ldrh r2, [r5, #8]
	subs r1, r1, r2
	strh r1, [r0, #0x24]
	ldr r0, _080A852C
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x10]
	strh r6, [r5, #0x12]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	adds r0, #0x10
	lsls r0, r0, #0x14
	lsrs r6, r0, #0x10
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	adds r0, #0x10
	lsls r4, r0, #4
	ldrb r0, [r7]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x14]
	cmp r0, #0x14
	beq _080A851C
	cmp r0, #0x28
	bne _080A8530
_080A851C:
	movs r0, #2
	b _080A8532
	.align 2, 0
_080A8520: .4byte 0x03005B60
_080A8524: .4byte 0x020380D6
_080A8528: .4byte 0x020205AC
_080A852C: .4byte 0x00002771
_080A8530:
	movs r0, #3
_080A8532:
	strh r0, [r5, #0x14]
	lsls r0, r4, #1
	ldr r1, _080A8560
	adds r0, r0, r1
	lsls r1, r6, #1
	ldr r2, _080A8564
	adds r1, r1, r2
	ldr r2, _080A8568
	bl CpuSet
	ldr r0, _080A856C
	ldrb r2, [r0, #2]
	ldrh r3, [r0]
	adds r0, r6, #0
	movs r1, #0x10
	bl BlendPalette
	ldr r0, _080A8570
	str r0, [r5]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8560: .4byte 0x020373B4
_080A8564: .4byte 0x020377B4
_080A8568: .4byte 0x04000008
_080A856C: .4byte 0x020380BE
_080A8570: .4byte 0x080A8575
	thumb_func_end sub_080A848C

	thumb_func_start sub_080A8574
sub_080A8574: @ 0x080A8574
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080A8598
	adds r4, r0, r1
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080A85D8
	cmp r0, #1
	bgt _080A859C
	cmp r0, #0
	beq _080A85A2
	b _080A8634
	.align 2, 0
_080A8598: .4byte 0x03005B60
_080A859C:
	cmp r0, #2
	beq _080A8620
	b _080A8634
_080A85A2:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080A8640
	ldr r2, _080A85D4
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0xa]
	ldrh r2, [r0, #0x24]
	adds r1, r1, r2
	strh r1, [r0, #0x24]
	ldrh r1, [r4, #0xe]
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _080A8634
	strh r1, [r4, #0xe]
	b _080A8612
	.align 2, 0
_080A85D4: .4byte 0x020205AC
_080A85D8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080A8640
	ldr r3, _080A861C
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x24]
	ldrh r2, [r4, #0xa]
	subs r1, r1, r2
	strh r1, [r0, #0x24]
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bne _080A8634
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	strh r2, [r1, #0x24]
_080A8612:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _080A8634
	.align 2, 0
_080A861C: .4byte 0x020205AC
_080A8620:
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _080A8634
	ldr r0, _080A863C
	bl FreeSpritePaletteByTag
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_080A8634:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A863C: .4byte 0x00002771
	thumb_func_end sub_080A8574

	thumb_func_start sub_080A8640
sub_080A8640: @ 0x080A8640
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r0, #0
	bl CloneBattlerSpriteWithBlend
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _080A86B0
	ldr r5, _080A86BC
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r3, r4, r5
	movs r0, #3
	ldrb r1, [r6, #0x14]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	ldrb r1, [r6, #0x10]
	lsls r1, r1, #4
	movs r2, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	movs r0, #8
	strh r0, [r3, #0x2e]
	mov r0, r8
	strh r0, [r3, #0x30]
	strh r7, [r3, #0x32]
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x24]
	strh r0, [r3, #0x24]
	adds r5, #0x1c
	adds r4, r4, r5
	ldr r0, _080A86C0
	str r0, [r4]
	ldrh r0, [r6, #0x12]
	adds r0, #1
	strh r0, [r6, #0x12]
_080A86B0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A86BC: .4byte 0x020205AC
_080A86C0: .4byte 0x080A86C5
	thumb_func_end sub_080A8640

	thumb_func_start sub_080A86C4
sub_080A86C4: @ 0x080A86C4
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2e]
	subs r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080A86EE
	ldr r2, _080A86F4
	movs r0, #0x30
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #0x12]
	subs r1, #1
	strh r1, [r0, #0x12]
	adds r0, r3, #0
	bl obj_delete_but_dont_free_vram
_080A86EE:
	pop {r0}
	bx r0
	.align 2, 0
_080A86F4: .4byte 0x03005B60
	thumb_func_end sub_080A86C4

	thumb_func_start sub_080A86F8
sub_080A86F8: @ 0x080A86F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A872C
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
	bne _080A8730
	movs r0, #5
	b _080A8732
	.align 2, 0
_080A872C: .4byte 0x020380D6
_080A8730:
	ldr r0, _080A8744
_080A8732:
	strh r0, [r5, #0x2e]
	ldr r0, _080A8748
	strh r0, [r5, #0x30]
	ldr r0, _080A874C
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8744: .4byte 0x0000FFF6
_080A8748: .4byte 0x0000FFD8
_080A874C: .4byte 0x080A8751
	thumb_func_end sub_080A86F8

	thumb_func_start sub_080A8750
sub_080A8750: @ 0x080A8750
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldrh r5, [r4, #0x30]
	ldrh r2, [r4, #0x34]
	adds r0, r5, r2
	strh r0, [r4, #0x34]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl __divsi3
	strh r0, [r4, #0x24]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl __divsi3
	strh r0, [r4, #0x26]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x14
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080A878C
	adds r0, r5, #1
	strh r0, [r4, #0x30]
_080A878C:
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080A87A4
	adds r0, r4, #0
	bl DestroyAnimSprite
_080A87A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A8750

	thumb_func_start sub_080A87AC
sub_080A87AC: @ 0x080A87AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080A87E4
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #8]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldrh r0, [r5, #0xa]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	ldr r0, _080A87E8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A87EC
	ldrh r0, [r5, #8]
	adds r0, #0x1e
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #0xa]
	subs r0, #0x14
	b _080A87FA
	.align 2, 0
_080A87E4: .4byte 0x020380BE
_080A87E8: .4byte 0x020380D7
_080A87EC:
	ldrh r0, [r5, #8]
	subs r0, #0x1e
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #0xa]
	subs r0, #0x50
_080A87FA:
	strh r0, [r4, #0x22]
	ldr r0, _080A8810
	str r0, [r4, #0x1c]
	ldr r1, _080A8814
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8810: .4byte 0x080A67B5
_080A8814: .4byte 0x080A34C5
	thumb_func_end sub_080A87AC

