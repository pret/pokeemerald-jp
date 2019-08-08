.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start nullsub_120
nullsub_120: @ 0x08189674
	bx lr
	.align 2, 0
	thumb_func_end nullsub_120

	thumb_func_start SetControllerToRecordedPlayer
SetControllerToRecordedPlayer: @ 0x08189678
	ldr r1, _08189688
	ldr r0, _0818968C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08189690
	str r1, [r0]
	bx lr
	.align 2, 0
_08189688: .4byte 0x03005AC0
_0818968C: .4byte 0x02023D08
_08189690: .4byte 0x08189695
	thumb_func_end SetControllerToRecordedPlayer

	thumb_func_start RecordedPlayerBufferRunCommand
RecordedPlayerBufferRunCommand: @ 0x08189694
	push {lr}
	ldr r2, _081896C8
	ldr r1, _081896CC
	ldr r0, _081896D0
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _081896E0
	ldr r0, _081896D4
	lsls r1, r3, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x38
	bhi _081896DC
	ldr r0, _081896D8
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _081896E0
	.align 2, 0
_081896C8: .4byte 0x02023D0C
_081896CC: .4byte 0x082FACB4
_081896D0: .4byte 0x02023D08
_081896D4: .4byte 0x02022D08
_081896D8: .4byte 0x085D39D4
_081896DC:
	bl RecordedPlayerBufferExecCompleted
_081896E0:
	pop {r0}
	bx r0
	thumb_func_end RecordedPlayerBufferRunCommand

	thumb_func_start sub_081896E4
sub_081896E4: @ 0x081896E4
	push {lr}
	ldr r2, _0818970C
	ldr r1, _08189710
	ldr r0, _08189714
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08189718
	cmp r1, r0
	bne _08189708
	bl RecordedPlayerBufferExecCompleted
_08189708:
	pop {r0}
	bx r0
	.align 2, 0
_0818970C: .4byte 0x020205AC
_08189710: .4byte 0x02023E88
_08189714: .4byte 0x02023D08
_08189718: .4byte 0x08007141
	thumb_func_end sub_081896E4

	thumb_func_start sub_0818971C
sub_0818971C: @ 0x0818971C
	push {r4, r5, r6, lr}
	ldr r6, _08189774
	ldr r5, _08189778
	ldr r4, _0818977C
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08189780
	cmp r1, r0
	bne _0818976C
	movs r0, #0
	bl sub_0805DBFC
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl FreeSpriteOamMatrix
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	bl RecordedPlayerBufferExecCompleted
_0818976C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08189774: .4byte 0x020205AC
_08189778: .4byte 0x02023E88
_0818977C: .4byte 0x02023D08
_08189780: .4byte 0x08007141
	thumb_func_end sub_0818971C

	thumb_func_start sub_08189784
sub_08189784: @ 0x08189784
	push {r4, lr}
	ldr r4, _081897C4
	ldr r1, [r4]
	ldr r3, _081897C8
	ldrb r0, [r3]
	ldr r2, [r1, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _081897BC
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #9]
	bl RecordedPlayerBufferExecCompleted
_081897BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081897C4: .4byte 0x02024174
_081897C8: .4byte 0x02023D08
	thumb_func_end sub_08189784

	thumb_func_start sub_081897CC
sub_081897CC: @ 0x081897CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	ldr r4, _08189824
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081897E6
	b _0818998C
_081897E6:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08189806
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08189838
	ldr r0, _08189828
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08189838
_08189806:
	ldr r2, _0818982C
	ldr r1, _08189830
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08189834
	cmp r1, r0
	bne _0818986E
	b _08189874
	.align 2, 0
_08189824: .4byte 0x02023D08
_08189828: .4byte 0x02022C90
_0818982C: .4byte 0x020205AC
_08189830: .4byte 0x03005AD0
_08189834: .4byte 0x08007141
_08189838:
	ldr r2, _08189968
	ldr r5, _0818996C
	ldr r0, _08189970
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r4, [r0]
	ldr r0, _08189974
	cmp r4, r0
	bne _0818986E
	movs r0, #2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _0818986E
	movs r6, #1
_0818986E:
	cmp r6, #0
	bne _08189874
	b _08189A44
_08189874:
	ldr r0, _08189978
	mov sb, r0
	ldr r0, [r0]
	ldr r5, _08189970
	ldrb r2, [r5]
	ldr r3, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r3
	ldrb r1, [r4, #1]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08189896
	b _08189A44
_08189896:
	movs r1, #2
	mov r8, r1
	mov r1, r8
	eors r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #1]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _081898B2
	b _08189A44
_081898B2:
	ldrb r1, [r4]
	movs r3, #0x7f
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r4]
	mov r1, sb
	ldr r0, [r1]
	ldrb r2, [r5]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	strb r0, [r1, #1]
	mov r0, sb
	ldr r2, [r0]
	ldrb r0, [r5]
	mov r1, r8
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	mov r1, sb
	ldr r2, [r1]
	ldrb r0, [r5]
	mov r1, r8
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	ands r4, r1
	strb r4, [r0, #1]
	ldr r4, _0818997C
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldr r7, _08189980
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r4, _08189984
	adds r0, r0, r4
	bl HandleLowHpMusicChange
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0818994E
	ldrb r0, [r5]
	mov r1, r8
	eors r1, r0
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r4
	bl HandleLowHpMusicChange
_0818994E:
	mov r1, sb
	ldr r0, [r1]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #9]
	ldr r1, _08189988
	ldrb r0, [r5]
	b _08189A3C
	.align 2, 0
_08189968: .4byte 0x020205AC
_0818996C: .4byte 0x03005AD0
_08189970: .4byte 0x02023D08
_08189974: .4byte 0x08007141
_08189978: .4byte 0x02024174
_0818997C: .4byte 0x000027F9
_08189980: .4byte 0x02023D12
_08189984: .4byte 0x02024190
_08189988: .4byte 0x03005AC0
_0818998C:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081899AC
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081899DC
	ldr r0, _081899CC
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081899DC
_081899AC:
	ldr r2, _081899D0
	ldr r1, _081899D4
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081899D8
	cmp r1, r0
	bne _08189A12
	b _08189A10
	.align 2, 0
_081899CC: .4byte 0x02022C90
_081899D0: .4byte 0x020205AC
_081899D4: .4byte 0x03005AD0
_081899D8: .4byte 0x08007141
_081899DC:
	ldr r2, _08189A50
	ldr r5, _08189A54
	ldr r0, _08189A58
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r4, [r0]
	ldr r0, _08189A5C
	cmp r4, r0
	bne _08189A12
	movs r0, #2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _08189A12
_08189A10:
	movs r6, #1
_08189A12:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08189A1E
	movs r6, #0
_08189A1E:
	cmp r6, #0
	beq _08189A44
	ldr r0, _08189A60
	ldr r0, [r0]
	ldr r3, _08189A58
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #9]
	ldr r1, _08189A64
	ldrb r0, [r3]
_08189A3C:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08189A68
	str r1, [r0]
_08189A44:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08189A50: .4byte 0x020205AC
_08189A54: .4byte 0x03005AD0
_08189A58: .4byte 0x02023D08
_08189A5C: .4byte 0x08007141
_08189A60: .4byte 0x02024174
_08189A64: .4byte 0x03005AC0
_08189A68: .4byte 0x08189785
	thumb_func_end sub_081897CC

	thumb_func_start sub_08189A6C
sub_08189A6C: @ 0x08189A6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	ldr r4, _08189C48
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08189AEA
	ldr r5, _08189C4C
	ldr r0, [r5]
	ldrb r2, [r4]
	ldr r1, [r0, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r6, #0x88
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08189AB8
	ldr r0, _08189C50
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08189C54
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_08189AB8:
	ldr r2, [r5]
	ldrb r1, [r4]
	movs r0, #2
	adds r3, r0, #0
	eors r3, r1
	ldr r1, [r2, #4]
	lsls r2, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08189AEA
	ldr r0, _08189C50
	adds r0, r2, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08189C54
	adds r1, r1, r0
	adds r0, r3, #0
	bl sub_08172CD4
_08189AEA:
	ldr r3, _08189C4C
	ldr r0, [r3]
	ldr r2, _08189C48
	ldrb r5, [r2]
	ldr r4, [r0, #4]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r6, r0, r4
	ldrb r1, [r6]
	movs r0, #8
	mov ip, r0
	ands r0, r1
	mov sb, r2
	mov r8, r3
	cmp r0, #0
	bne _08189BCE
	movs r7, #2
	adds r1, r7, #0
	eors r1, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _08189BCE
	ldrb r1, [r6, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08189BB0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08189B80
	ldr r0, _08189C58
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08189B80
	ldr r4, _08189C5C
	mov r1, sb
	ldrb r0, [r1]
	adds r1, r7, #0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08189C50
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08189C54
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	mov r1, sb
	ldrb r0, [r1]
	eors r0, r7
	bl sub_08076320
	mov r1, sb
	ldrb r0, [r1]
	eors r0, r7
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_08189B80:
	ldr r5, _08189C5C
	ldr r4, _08189C48
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08189C50
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08189C54
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_08076320
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_08189BB0:
	ldr r4, _08189C4C
	ldr r0, [r4]
	ldr r3, _08189C48
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0, #1]
	mov sb, r3
	mov r8, r4
_08189BCE:
	mov r1, r8
	ldr r0, [r1]
	mov r1, sb
	ldrb r2, [r1]
	ldr r3, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #1]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _08189C8E
	movs r1, #2
	eors r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08189C8E
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08189C8E
	mov r1, r8
	ldr r0, [r1]
	mov r1, sb
	ldrb r2, [r1]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08189C70
	ldr r0, _08189C58
	ldr r0, [r0]
	movs r1, #0x42
	ands r0, r1
	cmp r0, #0x42
	bne _08189C64
	adds r0, r2, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08189C70
	ldr r0, _08189C60
	bl m4aMPlayContinue
	b _08189C70
	.align 2, 0
_08189C48: .4byte 0x02023D08
_08189C4C: .4byte 0x02024174
_08189C50: .4byte 0x02023D12
_08189C54: .4byte 0x02024190
_08189C58: .4byte 0x02022C90
_08189C5C: .4byte 0x03005AD0
_08189C60: .4byte 0x030074D0
_08189C64:
	ldr r0, _08189D64
	ldr r1, _08189D68
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
_08189C70:
	ldr r0, _08189D6C
	ldr r2, [r0]
	ldr r0, _08189D70
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #1]
	movs r0, #1
	mov sl, r0
_08189C8E:
	mov r1, sl
	cmp r1, #0
	beq _08189D56
	ldr r7, _08189D74
	ldr r6, _08189D78
	ldr r5, _08189D70
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r7, #0
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r2, [r0]
	ldr r0, _08189D7C
	cmp r2, r0
	bne _08189D56
	ldr r0, _08189D80
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, r2
	bne _08189D56
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08189CF4
	ldr r0, _08189D84
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08189CF4
	ldrb r1, [r5]
	movs r0, #2
	eors r0, r1
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	bl DestroySprite
_08189CF4:
	ldr r1, _08189D78
	ldr r4, _08189D70
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08189D74
	adds r0, r0, r1
	bl DestroySprite
	ldr r3, _08189D6C
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r1, [r2, #9]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldr r0, [r3]
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldr r0, [r3]
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1, #1]
	ldr r1, _08189D88
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08189D8C
	str r1, [r0]
_08189D56:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08189D64: .4byte 0x030074D0
_08189D68: .4byte 0x0000FFFF
_08189D6C: .4byte 0x02024174
_08189D70: .4byte 0x02023D08
_08189D74: .4byte 0x020205AC
_08189D78: .4byte 0x03005ADC
_08189D7C: .4byte 0x08007141
_08189D80: .4byte 0x02023E88
_08189D84: .4byte 0x02022C90
_08189D88: .4byte 0x03005AC0
_08189D8C: .4byte 0x081897CD
	thumb_func_end sub_08189A6C

	thumb_func_start RecordedPlayerHandleBallThrowAnim
RecordedPlayerHandleBallThrowAnim: @ 0x08189D90
	push {lr}
	ldr r2, _08189DC4
	ldr r1, _08189DC8
	ldr r0, _08189DCC
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _08189DBE
	movs r2, #0x24
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08189DBE
	bl RecordedPlayerBufferExecCompleted
_08189DBE:
	pop {r0}
	bx r0
	.align 2, 0
_08189DC4: .4byte 0x020205AC
_08189DC8: .4byte 0x02023E88
_08189DCC: .4byte 0x02023D08
	thumb_func_end RecordedPlayerHandleBallThrowAnim

	thumb_func_start sub_08189DD0
sub_08189DD0: @ 0x08189DD0
	push {r4, r5, r6, lr}
	ldr r5, _08189E10
	ldrb r0, [r5]
	ldr r6, _08189E14
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, #0
	movs r3, #0
	bl MoveBattleBar
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08189E18
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r2, #0
	bl sub_080726F4
	b _08189E32
	.align 2, 0
_08189E10: .4byte 0x02023D08
_08189E14: .4byte 0x03005AD0
_08189E18:
	ldr r2, _08189E38
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _08189E3C
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	bl RecordedPlayerBufferExecCompleted
_08189E32:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08189E38: .4byte 0x02023D12
_08189E3C: .4byte 0x02024190
	thumb_func_end sub_08189DD0

	thumb_func_start sub_08189E40
sub_08189E40: @ 0x08189E40
	push {r4, r5, r6, lr}
	ldr r6, _08189EC4
	ldr r5, _08189EC8
	ldr r4, _08189ECC
	ldrb r2, [r4]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r3, #0x22
	ldrsh r1, [r0, r3]
	movs r3, #0x26
	ldrsh r0, [r0, r3]
	adds r1, r1, r0
	cmp r1, #0xa0
	ble _08189EBC
	ldr r1, _08189ED0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08189ED4
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0805DB50
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	ldr r1, _08189ED8
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl RecordedPlayerBufferExecCompleted
_08189EBC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08189EC4: .4byte 0x020205AC
_08189EC8: .4byte 0x02023E88
_08189ECC: .4byte 0x02023D08
_08189ED0: .4byte 0x02023D12
_08189ED4: .4byte 0x02024190
_08189ED8: .4byte 0x03005AD0
	thumb_func_end sub_08189E40

	thumb_func_start sub_08189EDC
sub_08189EDC: @ 0x08189EDC
	push {r4, r5, r6, lr}
	ldr r0, _08189F38
	ldr r0, [r0]
	ldr r6, _08189F3C
	ldrb r2, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08189F30
	ldr r5, _08189F40
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08189F44
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r1, _08189F48
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl RecordedPlayerBufferExecCompleted
_08189F30:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08189F38: .4byte 0x02024174
_08189F3C: .4byte 0x02023D08
_08189F40: .4byte 0x02023E88
_08189F44: .4byte 0x020205AC
_08189F48: .4byte 0x03005AD0
	thumb_func_end sub_08189EDC

	thumb_func_start RecordedPlayerHandleChosenMonReturnValue
RecordedPlayerHandleChosenMonReturnValue: @ 0x08189F4C
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08189F5E
	bl RecordedPlayerBufferExecCompleted
_08189F5E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleChosenMonReturnValue

	thumb_func_start RecordedPlayerHandleHitAnimation
RecordedPlayerHandleHitAnimation: @ 0x08189F64
	push {r4, lr}
	ldr r1, _08189FA0
	ldr r0, _08189FA4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _08189FA8
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _08189FB0
	movs r3, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08189FAC
	strb r3, [r0]
	bl RecordedPlayerBufferExecCompleted
	b _08189FDA
	.align 2, 0
_08189FA0: .4byte 0x02023E88
_08189FA4: .4byte 0x02023D08
_08189FA8: .4byte 0x020205AC
_08189FAC: .4byte 0x0202415D
_08189FB0:
	ldrh r0, [r4, #0x30]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08189FD4
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
_08189FD4:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_08189FDA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RecordedPlayerHandleHitAnimation

	thumb_func_start sub_08189FE0
sub_08189FE0: @ 0x08189FE0
	push {r4, lr}
	ldr r2, _0818A038
	ldr r0, _0818A03C
	ldr r4, _0818A040
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0818A044
	cmp r1, r0
	bne _0818A032
	adds r0, r3, #0
	bl CopyBattleSpriteInvisibility
	ldr r0, _0818A048
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0818A026
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
_0818A026:
	ldr r0, _0818A04C
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0818A050
	str r0, [r1]
_0818A032:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818A038: .4byte 0x020205AC
_0818A03C: .4byte 0x03005AD0
_0818A040: .4byte 0x02023D08
_0818A044: .4byte 0x08007141
_0818A048: .4byte 0x02024174
_0818A04C: .4byte 0x03005AC0
_0818A050: .4byte 0x0818A055
	thumb_func_end sub_08189FE0

	thumb_func_start sub_0818A054
sub_0818A054: @ 0x0818A054
	push {lr}
	ldr r0, _0818A094
	ldr r1, [r0]
	ldr r0, _0818A098
	ldrb r3, [r0]
	ldr r1, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0818A090
	ldr r2, _0818A09C
	ldr r0, _0818A0A0
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0818A0A4
	cmp r1, r0
	bne _0818A090
	bl RecordedPlayerBufferExecCompleted
_0818A090:
	pop {r0}
	bx r0
	.align 2, 0
_0818A094: .4byte 0x02024174
_0818A098: .4byte 0x02023D08
_0818A09C: .4byte 0x020205AC
_0818A0A0: .4byte 0x02023E88
_0818A0A4: .4byte 0x08007141
	thumb_func_end sub_0818A054

	thumb_func_start sub_0818A0A8
sub_0818A0A8: @ 0x0818A0A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _0818A170
	ldr r0, [r3]
	ldr r7, _0818A174
	ldrb r1, [r7]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r1, [r2, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0818A164
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldrb r2, [r7]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldr r4, _0818A178
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldr r0, _0818A17C
	movs r1, #0xa
	bl CreateTask
	ldr r0, _0818A180
	mov r8, r0
	ldrb r1, [r7]
	lsls r0, r1, #1
	add r0, r8
	ldrh r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0818A184
	adds r0, r0, r5
	bl HandleLowHpMusicChange
	ldr r1, _0818A188
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0818A18C
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAnim
	ldr r4, _0818A190
	ldrb r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	muls r1, r6, r1
	adds r1, r1, r5
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r7]
	bl sub_08076320
	ldrb r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r1, _0818A194
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818A198
	str r1, [r0]
_0818A164:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818A170: .4byte 0x02024174
_0818A174: .4byte 0x02023D08
_0818A178: .4byte 0x000027F9
_0818A17C: .4byte 0x08058D11
_0818A180: .4byte 0x02023D12
_0818A184: .4byte 0x02024190
_0818A188: .4byte 0x02023E88
_0818A18C: .4byte 0x020205AC
_0818A190: .4byte 0x03005AD0
_0818A194: .4byte 0x03005AC0
_0818A198: .4byte 0x08189FE1
	thumb_func_end sub_0818A0A8

	thumb_func_start sub_0818A19C
sub_0818A19C: @ 0x0818A19C
	push {r4, r5, r6, lr}
	ldr r6, _0818A21C
	ldr r0, [r6]
	ldr r4, _0818A220
	ldrb r2, [r4]
	ldr r1, [r0, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	bne _0818A1CE
	ldr r0, _0818A224
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0818A228
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_0818A1CE:
	ldr r5, _0818A22C
	ldr r0, _0818A230
	ldrb r2, [r4]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r3, r0, #2
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _0818A234
	cmp r1, r0
	bne _0818A214
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0818A214
	adds r0, r3, r5
	bl DestroySprite
	ldr r1, _0818A238
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818A23C
	str r1, [r0]
_0818A214:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818A21C: .4byte 0x02024174
_0818A220: .4byte 0x02023D08
_0818A224: .4byte 0x02023D12
_0818A228: .4byte 0x02024190
_0818A22C: .4byte 0x020205AC
_0818A230: .4byte 0x03005ADC
_0818A234: .4byte 0x08007141
_0818A238: .4byte 0x03005AC0
_0818A23C: .4byte 0x0818A0A9
	thumb_func_end sub_0818A19C

	thumb_func_start RecordedPlayerBufferExecCompleted
RecordedPlayerBufferExecCompleted: @ 0x0818A240
	push {r4, lr}
	sub sp, #4
	ldr r1, _0818A280
	ldr r4, _0818A284
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818A288
	str r1, [r0]
	ldr r0, _0818A28C
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0818A294
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, #2
	movs r1, #4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _0818A290
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r1
	movs r1, #0x38
	strb r1, [r0]
	b _0818A2A6
	.align 2, 0
_0818A280: .4byte 0x03005AC0
_0818A284: .4byte 0x02023D08
_0818A288: .4byte 0x08189695
_0818A28C: .4byte 0x02022C90
_0818A290: .4byte 0x02022D08
_0818A294:
	ldr r2, _0818A2B0
	ldr r1, _0818A2B4
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0818A2A6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818A2B0: .4byte 0x02023D0C
_0818A2B4: .4byte 0x082FACB4
	thumb_func_end RecordedPlayerBufferExecCompleted

	thumb_func_start RecordedPlayerHandleGetRawMonData
RecordedPlayerHandleGetRawMonData: @ 0x0818A2B8
	push {lr}
	ldr r0, _0818A2E0
	ldr r2, [r0]
	ldr r0, _0818A2E4
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0818A2DA
	bl RecordedPlayerBufferExecCompleted
_0818A2DA:
	pop {r0}
	bx r0
	.align 2, 0
_0818A2E0: .4byte 0x02024174
_0818A2E4: .4byte 0x02023D08
	thumb_func_end RecordedPlayerHandleGetRawMonData

	thumb_func_start RecordedPlayerHandleOneReturnValue
RecordedPlayerHandleOneReturnValue: @ 0x0818A2E8
	push {lr}
	ldr r0, _0818A310
	ldr r2, [r0]
	ldr r0, _0818A314
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0818A30A
	bl RecordedPlayerBufferExecCompleted
_0818A30A:
	pop {r0}
	bx r0
	.align 2, 0
_0818A310: .4byte 0x02024174
_0818A314: .4byte 0x02023D08
	thumb_func_end RecordedPlayerHandleOneReturnValue

	thumb_func_start RecordedPlayerHandleGetMonData
RecordedPlayerHandleGetMonData: @ 0x0818A318
	push {r4, r5, r6, lr}
	sub sp, #0x100
	movs r6, #0
	ldr r1, _0818A344
	ldr r0, _0818A348
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0818A350
	ldr r0, _0818A34C
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl CopyRecordedPlayerMonData
	adds r6, r0, #0
	b _0818A372
	.align 2, 0
_0818A344: .4byte 0x02022D08
_0818A348: .4byte 0x02023D08
_0818A34C: .4byte 0x02023D12
_0818A350:
	ldrb r4, [r1]
	movs r5, #0
_0818A354:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0818A36A
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	adds r1, r2, r6
	bl CopyRecordedPlayerMonData
	adds r6, r6, r0
_0818A36A:
	lsrs r4, r4, #1
	adds r5, #1
	cmp r5, #5
	ble _0818A354
_0818A372:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl RecordedPlayerBufferExecCompleted
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleGetMonData

	thumb_func_start CopyRecordedPlayerMonData
CopyRecordedPlayerMonData: @ 0x0818A38C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	ldr r2, _0818A3C0
	ldr r3, _0818A3C4
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _0818A3B6
	bl _0818AB22
_0818A3B6:
	lsls r0, r0, #2
	ldr r1, _0818A3C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0818A3C0: .4byte 0x02022D08
_0818A3C4: .4byte 0x02023D08
_0818A3C8: .4byte 0x0818A3CC
_0818A3CC: @ jump table
	.4byte _0818A4BC @ case 0
	.4byte _0818A6E0 @ case 1
	.4byte _0818A6F0 @ case 2
	.4byte _0818A700 @ case 3
	.4byte _0818A768 @ case 4
	.4byte _0818A768 @ case 5
	.4byte _0818A768 @ case 6
	.4byte _0818A768 @ case 7
	.4byte _0818A784 @ case 8
	.4byte _0818A7C0 @ case 9
	.4byte _0818A7C0 @ case 10
	.4byte _0818A7C0 @ case 11
	.4byte _0818A7C0 @ case 12
	.4byte _0818AB22 @ case 13
	.4byte _0818AB22 @ case 14
	.4byte _0818AB22 @ case 15
	.4byte _0818AB22 @ case 16
	.4byte _0818A7DC @ case 17
	.4byte _0818A7EC @ case 18
	.4byte _0818A81C @ case 19
	.4byte _0818A82C @ case 20
	.4byte _0818A83C @ case 21
	.4byte _0818A84C @ case 22
	.4byte _0818A85C @ case 23
	.4byte _0818A86C @ case 24
	.4byte _0818A87C @ case 25
	.4byte _0818A88C @ case 26
	.4byte _0818A89C @ case 27
	.4byte _0818A8AC @ case 28
	.4byte _0818A8BC @ case 29
	.4byte _0818A8CC @ case 30
	.4byte _0818A8DC @ case 31
	.4byte _0818A92C @ case 32
	.4byte _0818A93C @ case 33
	.4byte _0818A94C @ case 34
	.4byte _0818A95C @ case 35
	.4byte _0818A96C @ case 36
	.4byte _0818A97C @ case 37
	.4byte _0818A98C @ case 38
	.4byte _0818A99C @ case 39
	.4byte _0818A9AC @ case 40
	.4byte _0818A9E0 @ case 41
	.4byte _0818A9F0 @ case 42
	.4byte _0818AA00 @ case 43
	.4byte _0818AA10 @ case 44
	.4byte _0818AA20 @ case 45
	.4byte _0818AA30 @ case 46
	.4byte _0818AA40 @ case 47
	.4byte _0818AA50 @ case 48
	.4byte _0818AA70 @ case 49
	.4byte _0818AA80 @ case 50
	.4byte _0818AA90 @ case 51
	.4byte _0818AAA0 @ case 52
	.4byte _0818AAB0 @ case 53
	.4byte _0818AAC0 @ case 54
	.4byte _0818AAD0 @ case 55
	.4byte _0818AAE0 @ case 56
	.4byte _0818AAF0 @ case 57
	.4byte _0818AB00 @ case 58
	.4byte _0818AB10 @ case 59
_0818A4BC:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0818A6D0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x2e]
	movs r6, #0
	add r0, sp, #0x24
	mov sb, r0
	movs r1, #0x3b
	add r1, sp
	mov sl, r1
	mov r2, sp
	adds r2, #0x2b
	str r2, [sp, #0x80]
	mov r0, sp
	adds r0, #0x2a
	str r0, [sp, #0x7c]
	mov r1, sp
	adds r1, #0x68
	str r1, [sp, #0x8c]
	adds r2, #5
	str r2, [sp, #0x84]
	adds r0, #0x12
	str r0, [sp, #0x88]
	mov r8, r4
	add r4, sp, #0xc
_0818A508:
	adds r1, r6, #0
	adds r1, #0xd
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x11
	mov r0, r8
	bl GetMonData
	mov r2, sb
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _0818A508
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0818A6D0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x15
	bl GetMonData
	mov r1, sl
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	ldr r2, [sp, #0x80]
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0x19
	bl GetMonData
	str r0, [sp, #0x44]
	adds r0, r4, #0
	movs r1, #0x27
	bl GetMonData
	mov r3, sp
	movs r5, #0x1f
	ands r0, r5
	ldrb r2, [r3, #0x14]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x14]
	adds r0, r4, #0
	movs r1, #0x28
	bl GetMonData
	mov r3, sp
	movs r6, #0x1f
	ands r0, r6
	lsls r0, r0, #5
	ldrh r2, [r3, #0x14]
	ldr r1, _0818A6D4
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #0x14]
	adds r0, r4, #0
	movs r1, #0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r3, #0x15]
	movs r1, #0x7d
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x15]
	adds r0, r4, #0
	movs r1, #0x2a
	bl GetMonData
	movs r1, #0x1f
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [sp, #0x14]
	ldr r2, _0818A6D8
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0x14]
	adds r0, r4, #0
	movs r1, #0x2b
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, r0, #4
	ldrh r2, [r3, #0x16]
	ldr r1, _0818A6DC
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #0x16]
	adds r0, r4, #0
	movs r1, #0x2c
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, r0, #1
	ldrb r2, [r3, #0x17]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [sp, #0x48]
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	str r0, [sp, #0x4c]
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	ldr r1, [sp, #0x7c]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x28]
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x2c]
	adds r0, r4, #0
	movs r1, #0x3b
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #2]
	adds r0, r4, #0
	movs r1, #0x3c
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #4]
	adds r0, r4, #0
	movs r1, #0x3d
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #6]
	adds r0, r4, #0
	movs r1, #0x3e
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #8]
	adds r0, r4, #0
	movs r1, #0x3f
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0xa]
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	mov r3, sp
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #6
	ldrb r2, [r3, #0x17]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #0x2e
	bl GetMonData
	mov r3, sp
	lsls r0, r0, #7
	ldrb r2, [r3, #0x17]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	str r0, [sp, #0x54]
	adds r0, r4, #0
	movs r1, #2
	ldr r2, [sp, #0x8c]
	bl GetMonData
	ldr r0, [sp, #0x84]
	ldr r1, [sp, #0x8c]
	bl StringCopy10
	adds r0, r4, #0
	movs r1, #7
	ldr r2, [sp, #0x88]
	bl GetMonData
	mov r2, sp
	movs r6, #0
_0818A6C0:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x57
	bls _0818A6C0
	b _0818AB22
	.align 2, 0
_0818A6D0: .4byte 0x02024190
_0818A6D4: .4byte 0xFFFFFC1F
_0818A6D8: .4byte 0xFFF07FFF
_0818A6DC: .4byte 0xFFFFFE0F
_0818A6E0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A6EC
	adds r0, r0, r1
	movs r1, #0xb
	b _0818AA5A
	.align 2, 0
_0818A6EC: .4byte 0x02024190
_0818A6F0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A6FC
	adds r0, r0, r1
	movs r1, #0xc
	b _0818AA5A
	.align 2, 0
_0818A6FC: .4byte 0x02024190
_0818A700:
	movs r6, #0
	add r2, sp, #0x58
	mov sb, r2
	add r0, sp, #0x60
	mov sl, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0818A764
	adds r4, r1, r0
	mov r8, sb
_0818A716:
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r4, #0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, #0
	adds r1, #0x11
	adds r0, r4, #0
	bl GetMonData
	mov r2, sl
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, #2
	add r8, r0
	adds r6, #1
	cmp r6, #3
	ble _0818A716
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A764
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	mov r1, sb
	strb r0, [r1, #0xc]
	mov r2, sb
	movs r6, #0
_0818A754:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0xf
	bls _0818A754
	b _0818AB22
	.align 2, 0
_0818A764: .4byte 0x02024190
_0818A768:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A780
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #9
	b _0818AA5A
	.align 2, 0
_0818A780: .4byte 0x02024190
_0818A784:
	movs r6, #0
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r2, _0818A7BC
	mov r8, r2
_0818A790:
	adds r1, r6, #0
	adds r1, #0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	cmp r6, #3
	ble _0818A790
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A7BC
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	b _0818AB22
	.align 2, 0
_0818A7BC: .4byte 0x02024190
_0818A7C0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A7D8
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #8
	b _0818AB1A
	.align 2, 0
_0818A7D8: .4byte 0x02024190
_0818A7DC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A7E8
	adds r0, r0, r1
	movs r1, #1
	b _0818A7F6
	.align 2, 0
_0818A7E8: .4byte 0x02024190
_0818A7EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A818
	adds r0, r0, r1
	movs r1, #0x19
_0818A7F6:
	bl GetMonData
	adds r1, r0, #0
	strb r1, [r7]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	strb r0, [r7, #2]
	movs r6, #3
	b _0818AB22
	.align 2, 0
_0818A818: .4byte 0x02024190
_0818A81C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A828
	adds r0, r0, r1
	movs r1, #0x1a
	b _0818AB1A
	.align 2, 0
_0818A828: .4byte 0x02024190
_0818A82C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A838
	adds r0, r0, r1
	movs r1, #0x1b
	b _0818AB1A
	.align 2, 0
_0818A838: .4byte 0x02024190
_0818A83C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A848
	adds r0, r0, r1
	movs r1, #0x1c
	b _0818AB1A
	.align 2, 0
_0818A848: .4byte 0x02024190
_0818A84C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A858
	adds r0, r0, r1
	movs r1, #0x1d
	b _0818AB1A
	.align 2, 0
_0818A858: .4byte 0x02024190
_0818A85C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A868
	adds r0, r0, r1
	movs r1, #0x1e
	b _0818AB1A
	.align 2, 0
_0818A868: .4byte 0x02024190
_0818A86C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A878
	adds r0, r0, r1
	movs r1, #0x1f
	b _0818AB1A
	.align 2, 0
_0818A878: .4byte 0x02024190
_0818A87C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A888
	adds r0, r0, r1
	movs r1, #0x20
	b _0818AB1A
	.align 2, 0
_0818A888: .4byte 0x02024190
_0818A88C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A898
	adds r0, r0, r1
	movs r1, #0x22
	b _0818AB1A
	.align 2, 0
_0818A898: .4byte 0x02024190
_0818A89C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A8A8
	adds r0, r0, r1
	movs r1, #0x23
	b _0818AB1A
	.align 2, 0
_0818A8A8: .4byte 0x02024190
_0818A8AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A8B8
	adds r0, r0, r1
	movs r1, #0x24
	b _0818AB1A
	.align 2, 0
_0818A8B8: .4byte 0x02024190
_0818A8BC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A8C8
	adds r0, r0, r1
	movs r1, #0x25
	b _0818AB1A
	.align 2, 0
_0818A8C8: .4byte 0x02024190
_0818A8CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A8D8
	adds r0, r0, r1
	movs r1, #0x26
	b _0818AB1A
	.align 2, 0
_0818A8D8: .4byte 0x02024190
_0818A8DC:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0818A928
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, #0
	movs r1, #0x28
	bl GetMonData
	strb r0, [r7, #1]
	adds r0, r4, #0
	movs r1, #0x29
	bl GetMonData
	strb r0, [r7, #2]
	adds r0, r4, #0
	movs r1, #0x2a
	bl GetMonData
	strb r0, [r7, #3]
	adds r0, r4, #0
	movs r1, #0x2b
	bl GetMonData
	strb r0, [r7, #4]
	adds r0, r4, #0
	movs r1, #0x2c
	bl GetMonData
	strb r0, [r7, #5]
	movs r6, #6
	b _0818AB22
	.align 2, 0
_0818A928: .4byte 0x02024190
_0818A92C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A938
	adds r0, r0, r1
	movs r1, #0x27
	b _0818AB1A
	.align 2, 0
_0818A938: .4byte 0x02024190
_0818A93C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A948
	adds r0, r0, r1
	movs r1, #0x28
	b _0818AB1A
	.align 2, 0
_0818A948: .4byte 0x02024190
_0818A94C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A958
	adds r0, r0, r1
	movs r1, #0x29
	b _0818AB1A
	.align 2, 0
_0818A958: .4byte 0x02024190
_0818A95C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A968
	adds r0, r0, r1
	movs r1, #0x2a
	b _0818AB1A
	.align 2, 0
_0818A968: .4byte 0x02024190
_0818A96C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A978
	adds r0, r0, r1
	movs r1, #0x2b
	b _0818AB1A
	.align 2, 0
_0818A978: .4byte 0x02024190
_0818A97C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A988
	adds r0, r0, r1
	movs r1, #0x2c
	b _0818AB1A
	.align 2, 0
_0818A988: .4byte 0x02024190
_0818A98C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A998
	adds r0, r0, r1
	movs r1, #0
	b _0818A9B6
	.align 2, 0
_0818A998: .4byte 0x02024190
_0818A99C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A9A8
	adds r0, r0, r1
	movs r1, #9
	b _0818AA5A
	.align 2, 0
_0818A9A8: .4byte 0x02024190
_0818A9AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A9DC
	adds r0, r0, r1
	movs r1, #0x37
_0818A9B6:
	bl GetMonData
	adds r1, r0, #0
	strb r1, [r7]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	strb r0, [r7, #2]
	lsrs r0, r1, #0x18
	strb r0, [r7, #3]
	movs r6, #4
	b _0818AB22
	.align 2, 0
_0818A9DC: .4byte 0x02024190
_0818A9E0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A9EC
	adds r0, r0, r1
	movs r1, #0x38
	b _0818AB1A
	.align 2, 0
_0818A9EC: .4byte 0x02024190
_0818A9F0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818A9FC
	adds r0, r0, r1
	movs r1, #0x39
	b _0818AA5A
	.align 2, 0
_0818A9FC: .4byte 0x02024190
_0818AA00:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AA0C
	adds r0, r0, r1
	movs r1, #0x3a
	b _0818AA5A
	.align 2, 0
_0818AA0C: .4byte 0x02024190
_0818AA10:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AA1C
	adds r0, r0, r1
	movs r1, #0x3b
	b _0818AA5A
	.align 2, 0
_0818AA1C: .4byte 0x02024190
_0818AA20:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AA2C
	adds r0, r0, r1
	movs r1, #0x3c
	b _0818AA5A
	.align 2, 0
_0818AA2C: .4byte 0x02024190
_0818AA30:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AA3C
	adds r0, r0, r1
	movs r1, #0x3d
	b _0818AA5A
	.align 2, 0
_0818AA3C: .4byte 0x02024190
_0818AA40:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AA4C
	adds r0, r0, r1
	movs r1, #0x3e
	b _0818AA5A
	.align 2, 0
_0818AA4C: .4byte 0x02024190
_0818AA50:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AA6C
	adds r0, r0, r1
	movs r1, #0x3f
_0818AA5A:
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strb r0, [r7]
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r6, #2
	b _0818AB22
	.align 2, 0
_0818AA6C: .4byte 0x02024190
_0818AA70:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AA7C
	adds r0, r0, r1
	movs r1, #0x16
	b _0818AB1A
	.align 2, 0
_0818AA7C: .4byte 0x02024190
_0818AA80:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AA8C
	adds r0, r0, r1
	movs r1, #0x17
	b _0818AB1A
	.align 2, 0
_0818AA8C: .4byte 0x02024190
_0818AA90:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AA9C
	adds r0, r0, r1
	movs r1, #0x18
	b _0818AB1A
	.align 2, 0
_0818AA9C: .4byte 0x02024190
_0818AAA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AAAC
	adds r0, r0, r1
	movs r1, #0x21
	b _0818AB1A
	.align 2, 0
_0818AAAC: .4byte 0x02024190
_0818AAB0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AABC
	adds r0, r0, r1
	movs r1, #0x2f
	b _0818AB1A
	.align 2, 0
_0818AABC: .4byte 0x02024190
_0818AAC0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AACC
	adds r0, r0, r1
	movs r1, #0x30
	b _0818AB1A
	.align 2, 0
_0818AACC: .4byte 0x02024190
_0818AAD0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AADC
	adds r0, r0, r1
	movs r1, #0x32
	b _0818AB1A
	.align 2, 0
_0818AADC: .4byte 0x02024190
_0818AAE0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AAEC
	adds r0, r0, r1
	movs r1, #0x33
	b _0818AB1A
	.align 2, 0
_0818AAEC: .4byte 0x02024190
_0818AAF0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AAFC
	adds r0, r0, r1
	movs r1, #0x34
	b _0818AB1A
	.align 2, 0
_0818AAFC: .4byte 0x02024190
_0818AB00:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AB0C
	adds r0, r0, r1
	movs r1, #0x35
	b _0818AB1A
	.align 2, 0
_0818AB0C: .4byte 0x02024190
_0818AB10:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AB34
	adds r0, r0, r1
	movs r1, #0x36
_0818AB1A:
	bl GetMonData
	strb r0, [r7]
	movs r6, #1
_0818AB22:
	adds r0, r6, #0
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818AB34: .4byte 0x02024190
	thumb_func_end CopyRecordedPlayerMonData

	thumb_func_start RecordedPlayerHandleSuccessBallThrowAnim
RecordedPlayerHandleSuccessBallThrowAnim: @ 0x0818AB38
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleSuccessBallThrowAnim

	thumb_func_start RecordedPlayerHandleSetMonData
RecordedPlayerHandleSetMonData: @ 0x0818AB44
	push {r4, r5, lr}
	ldr r1, _0818AB68
	ldr r0, _0818AB6C
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0818AB74
	ldr r0, _0818AB70
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl SetRecordedPlayerMonData
	b _0818AB92
	.align 2, 0
_0818AB68: .4byte 0x02022D08
_0818AB6C: .4byte 0x02023D08
_0818AB70: .4byte 0x02023D12
_0818AB74:
	ldrb r4, [r1]
	movs r5, #0
_0818AB78:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0818AB86
	adds r0, r5, #0
	bl SetRecordedPlayerMonData
_0818AB86:
	lsrs r4, r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _0818AB78
_0818AB92:
	bl RecordedPlayerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end RecordedPlayerHandleSetMonData

	thumb_func_start SetRecordedPlayerMonData
SetRecordedPlayerMonData: @ 0x0818AB9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0818ABD4
	ldrb r0, [r0]
	lsls r0, r0, #9
	ldr r2, _0818ABD8
	adds r3, r0, r2
	adds r6, r3, #0
	subs r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r2, #0
	cmp r0, #0x3b
	bls _0818ABC8
	bl _0818B562
_0818ABC8:
	lsls r0, r0, #2
	ldr r1, _0818ABDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0818ABD4: .4byte 0x02023D08
_0818ABD8: .4byte 0x02022D0B
_0818ABDC: .4byte 0x0818ABE0
_0818ABE0: @ jump table
	.4byte _0818ACD0 @ case 0
	.4byte _0818AE68 @ case 1
	.4byte _0818AE88 @ case 2
	.4byte _0818AEA8 @ case 3
	.4byte _0818AF00 @ case 4
	.4byte _0818AF00 @ case 5
	.4byte _0818AF00 @ case 6
	.4byte _0818AF00 @ case 7
	.4byte _0818AF28 @ case 8
	.4byte _0818AF8C @ case 9
	.4byte _0818AF8C @ case 10
	.4byte _0818AF8C @ case 11
	.4byte _0818AF8C @ case 12
	.4byte _0818B562 @ case 13
	.4byte _0818B562 @ case 14
	.4byte _0818B562 @ case 15
	.4byte _0818B562 @ case 16
	.4byte _0818AFBC @ case 17
	.4byte _0818AFDC @ case 18
	.4byte _0818AFFC @ case 19
	.4byte _0818B01C @ case 20
	.4byte _0818B03C @ case 21
	.4byte _0818B05C @ case 22
	.4byte _0818B07C @ case 23
	.4byte _0818B09C @ case 24
	.4byte _0818B0BC @ case 25
	.4byte _0818B0DC @ case 26
	.4byte _0818B0FC @ case 27
	.4byte _0818B11C @ case 28
	.4byte _0818B13C @ case 29
	.4byte _0818B15C @ case 30
	.4byte _0818B17C @ case 31
	.4byte _0818B1EC @ case 32
	.4byte _0818B20C @ case 33
	.4byte _0818B22C @ case 34
	.4byte _0818B24C @ case 35
	.4byte _0818B26C @ case 36
	.4byte _0818B28C @ case 37
	.4byte _0818B2AC @ case 38
	.4byte _0818B2CC @ case 39
	.4byte _0818B2EC @ case 40
	.4byte _0818B30C @ case 41
	.4byte _0818B32C @ case 42
	.4byte _0818B34C @ case 43
	.4byte _0818B36C @ case 44
	.4byte _0818B38C @ case 45
	.4byte _0818B3AC @ case 46
	.4byte _0818B3CC @ case 47
	.4byte _0818B3EC @ case 48
	.4byte _0818B40C @ case 49
	.4byte _0818B42C @ case 50
	.4byte _0818B44C @ case 51
	.4byte _0818B46C @ case 52
	.4byte _0818B48C @ case 53
	.4byte _0818B4AC @ case 54
	.4byte _0818B4CC @ case 55
	.4byte _0818B4EC @ case 56
	.4byte _0818B50C @ case 57
	.4byte _0818B52C @ case 58
	.4byte _0818B54C @ case 59
_0818ACD0:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0818AE64
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r6, #0
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0x2e
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	movs r0, #0
	mov r8, r0
	movs r0, #0x3b
	adds r0, r0, r6
	mov sl, r0
	adds r0, r6, #0
	adds r0, #0x2b
	str r0, [sp, #0x20]
	adds r0, #0x19
	str r0, [sp, #0x28]
	adds r0, #4
	str r0, [sp, #0x2c]
	adds r0, #4
	str r0, [sp, #0x30]
	subs r0, #0x22
	str r0, [sp, #0x1c]
	subs r0, #2
	str r0, [sp, #0x18]
	adds r0, #4
	str r0, [sp, #0x24]
	adds r0, r6, #2
	str r0, [sp, #4]
	adds r0, r6, #4
	str r0, [sp, #8]
	adds r0, r6, #6
	str r0, [sp, #0xc]
	adds r0, #2
	str r0, [sp, #0x10]
	adds r0, #2
	str r0, [sp, #0x14]
	mov sb, r4
	adds r7, r6, #0
	adds r7, #0x24
	adds r4, r6, #0
	adds r4, #0xc
_0818AD36:
	mov r1, r8
	adds r1, #0xd
	mov r0, sb
	adds r2, r4, #0
	bl SetMonData
	mov r1, r8
	adds r1, #0x11
	mov r0, sb
	adds r2, r7, #0
	bl SetMonData
	adds r7, #1
	adds r4, #2
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _0818AD36
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0818AE64
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x15
	mov r2, sl
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x20
	ldr r2, [sp, #0x20]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x19
	ldr r2, [sp, #0x28]
	bl SetMonData
	ldrb r0, [r6, #0x14]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, #0x14]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, #0x15]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, #0x14]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2a
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, #0x16]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2b
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2c
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0
	ldr r2, [sp, #0x2c]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x37
	ldr r2, [sp, #0x30]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x38
	ldr r2, [sp, #0x1c]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x39
	ldr r2, [sp, #0x18]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3a
	ldr r2, [sp, #0x24]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3b
	ldr r2, [sp, #4]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3c
	ldr r2, [sp, #8]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3d
	ldr r2, [sp, #0xc]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3e
	ldr r2, [sp, #0x10]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3f
	ldr r2, [sp, #0x14]
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818AE64: .4byte 0x02024190
_0818AE68:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AE80
	adds r0, r0, r1
	ldr r1, _0818AE84
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xb
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818AE80: .4byte 0x02024190
_0818AE84: .4byte 0x02023D08
_0818AE88:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AEA0
	adds r0, r0, r1
	ldr r1, _0818AEA4
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xc
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818AEA0: .4byte 0x02024190
_0818AEA4: .4byte 0x02023D08
_0818AEA8:
	movs r0, #0
	mov r8, r0
	movs r0, #0xc
	adds r0, r0, r3
	mov sb, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0818AEFC
	adds r7, r1, r0
	adds r6, r3, #0
	adds r6, #8
	adds r4, r3, #0
_0818AEC2:
	mov r1, r8
	adds r1, #0xd
	adds r0, r7, #0
	adds r2, r4, #0
	bl SetMonData
	mov r1, r8
	adds r1, #0x11
	adds r0, r7, #0
	adds r2, r6, #0
	bl SetMonData
	adds r6, #1
	adds r4, #2
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _0818AEC2
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AEFC
	adds r0, r0, r1
	movs r1, #0x15
	mov r2, sb
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818AEFC: .4byte 0x02024190
_0818AF00:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AF1C
	adds r0, r0, r1
	ldr r3, _0818AF20
	ldr r1, _0818AF24
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #9
	b _0818AFA4
	.align 2, 0
_0818AF1C: .4byte 0x02024190
_0818AF20: .4byte 0x02022D08
_0818AF24: .4byte 0x02023D08
_0818AF28:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0818AF84
	adds r4, r4, r0
	ldr r5, _0818AF88
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r2, r2, r7
	adds r0, r4, #0
	movs r1, #0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x15
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818AF84: .4byte 0x02024190
_0818AF88: .4byte 0x02023D08
_0818AF8C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AFB0
	adds r0, r0, r1
	ldr r3, _0818AFB4
	ldr r1, _0818AFB8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #8
_0818AFA4:
	adds r3, #3
	adds r2, r2, r3
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818AFB0: .4byte 0x02024190
_0818AFB4: .4byte 0x02022D08
_0818AFB8: .4byte 0x02023D08
_0818AFBC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AFD4
	adds r0, r0, r1
	ldr r1, _0818AFD8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #1
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818AFD4: .4byte 0x02024190
_0818AFD8: .4byte 0x02023D08
_0818AFDC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818AFF4
	adds r0, r0, r1
	ldr r1, _0818AFF8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x19
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818AFF4: .4byte 0x02024190
_0818AFF8: .4byte 0x02023D08
_0818AFFC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B014
	adds r0, r0, r1
	ldr r1, _0818B018
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1a
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B014: .4byte 0x02024190
_0818B018: .4byte 0x02023D08
_0818B01C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B034
	adds r0, r0, r1
	ldr r1, _0818B038
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1b
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B034: .4byte 0x02024190
_0818B038: .4byte 0x02023D08
_0818B03C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B054
	adds r0, r0, r1
	ldr r1, _0818B058
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1c
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B054: .4byte 0x02024190
_0818B058: .4byte 0x02023D08
_0818B05C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B074
	adds r0, r0, r1
	ldr r1, _0818B078
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1d
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B074: .4byte 0x02024190
_0818B078: .4byte 0x02023D08
_0818B07C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B094
	adds r0, r0, r1
	ldr r1, _0818B098
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1e
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B094: .4byte 0x02024190
_0818B098: .4byte 0x02023D08
_0818B09C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B0B4
	adds r0, r0, r1
	ldr r1, _0818B0B8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1f
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B0B4: .4byte 0x02024190
_0818B0B8: .4byte 0x02023D08
_0818B0BC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B0D4
	adds r0, r0, r1
	ldr r1, _0818B0D8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x20
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B0D4: .4byte 0x02024190
_0818B0D8: .4byte 0x02023D08
_0818B0DC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B0F4
	adds r0, r0, r1
	ldr r1, _0818B0F8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x22
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B0F4: .4byte 0x02024190
_0818B0F8: .4byte 0x02023D08
_0818B0FC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B114
	adds r0, r0, r1
	ldr r1, _0818B118
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x23
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B114: .4byte 0x02024190
_0818B118: .4byte 0x02023D08
_0818B11C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B134
	adds r0, r0, r1
	ldr r1, _0818B138
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x24
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B134: .4byte 0x02024190
_0818B138: .4byte 0x02023D08
_0818B13C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B154
	adds r0, r0, r1
	ldr r1, _0818B158
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x25
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B154: .4byte 0x02024190
_0818B158: .4byte 0x02023D08
_0818B15C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B174
	adds r0, r0, r1
	ldr r1, _0818B178
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x26
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B174: .4byte 0x02024190
_0818B178: .4byte 0x02023D08
_0818B17C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0818B1E4
	adds r4, r4, r0
	ldr r5, _0818B1E8
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r2, r2, r7
	adds r0, r4, #0
	movs r1, #0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2a
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2b
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #5
	adds r2, r2, r0
	adds r0, r4, #0
	b _0818B29C
	.align 2, 0
_0818B1E4: .4byte 0x02024190
_0818B1E8: .4byte 0x02023D08
_0818B1EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B204
	adds r0, r0, r1
	ldr r1, _0818B208
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x27
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B204: .4byte 0x02024190
_0818B208: .4byte 0x02023D08
_0818B20C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B224
	adds r0, r0, r1
	ldr r1, _0818B228
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x28
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B224: .4byte 0x02024190
_0818B228: .4byte 0x02023D08
_0818B22C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B244
	adds r0, r0, r1
	ldr r1, _0818B248
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x29
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B244: .4byte 0x02024190
_0818B248: .4byte 0x02023D08
_0818B24C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B264
	adds r0, r0, r1
	ldr r1, _0818B268
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2a
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B264: .4byte 0x02024190
_0818B268: .4byte 0x02023D08
_0818B26C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B284
	adds r0, r0, r1
	ldr r1, _0818B288
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2b
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B284: .4byte 0x02024190
_0818B288: .4byte 0x02023D08
_0818B28C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B2A4
	adds r0, r0, r1
	ldr r1, _0818B2A8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
_0818B29C:
	movs r1, #0x2c
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B2A4: .4byte 0x02024190
_0818B2A8: .4byte 0x02023D08
_0818B2AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B2C4
	adds r0, r0, r1
	ldr r1, _0818B2C8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B2C4: .4byte 0x02024190
_0818B2C8: .4byte 0x02023D08
_0818B2CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B2E4
	adds r0, r0, r1
	ldr r1, _0818B2E8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #9
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B2E4: .4byte 0x02024190
_0818B2E8: .4byte 0x02023D08
_0818B2EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B304
	adds r0, r0, r1
	ldr r1, _0818B308
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x37
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B304: .4byte 0x02024190
_0818B308: .4byte 0x02023D08
_0818B30C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B324
	adds r0, r0, r1
	ldr r1, _0818B328
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x38
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B324: .4byte 0x02024190
_0818B328: .4byte 0x02023D08
_0818B32C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B344
	adds r0, r0, r1
	ldr r1, _0818B348
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x39
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B344: .4byte 0x02024190
_0818B348: .4byte 0x02023D08
_0818B34C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B364
	adds r0, r0, r1
	ldr r1, _0818B368
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3a
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B364: .4byte 0x02024190
_0818B368: .4byte 0x02023D08
_0818B36C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B384
	adds r0, r0, r1
	ldr r1, _0818B388
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3b
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B384: .4byte 0x02024190
_0818B388: .4byte 0x02023D08
_0818B38C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B3A4
	adds r0, r0, r1
	ldr r1, _0818B3A8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3c
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B3A4: .4byte 0x02024190
_0818B3A8: .4byte 0x02023D08
_0818B3AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B3C4
	adds r0, r0, r1
	ldr r1, _0818B3C8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3d
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B3C4: .4byte 0x02024190
_0818B3C8: .4byte 0x02023D08
_0818B3CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B3E4
	adds r0, r0, r1
	ldr r1, _0818B3E8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3e
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B3E4: .4byte 0x02024190
_0818B3E8: .4byte 0x02023D08
_0818B3EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B404
	adds r0, r0, r1
	ldr r1, _0818B408
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3f
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B404: .4byte 0x02024190
_0818B408: .4byte 0x02023D08
_0818B40C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B424
	adds r0, r0, r1
	ldr r1, _0818B428
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x16
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B424: .4byte 0x02024190
_0818B428: .4byte 0x02023D08
_0818B42C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B444
	adds r0, r0, r1
	ldr r1, _0818B448
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x17
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B444: .4byte 0x02024190
_0818B448: .4byte 0x02023D08
_0818B44C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B464
	adds r0, r0, r1
	ldr r1, _0818B468
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x18
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B464: .4byte 0x02024190
_0818B468: .4byte 0x02023D08
_0818B46C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B484
	adds r0, r0, r1
	ldr r1, _0818B488
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x21
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B484: .4byte 0x02024190
_0818B488: .4byte 0x02023D08
_0818B48C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B4A4
	adds r0, r0, r1
	ldr r1, _0818B4A8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2f
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B4A4: .4byte 0x02024190
_0818B4A8: .4byte 0x02023D08
_0818B4AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B4C4
	adds r0, r0, r1
	ldr r1, _0818B4C8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x30
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B4C4: .4byte 0x02024190
_0818B4C8: .4byte 0x02023D08
_0818B4CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B4E4
	adds r0, r0, r1
	ldr r1, _0818B4E8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x32
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B4E4: .4byte 0x02024190
_0818B4E8: .4byte 0x02023D08
_0818B4EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B504
	adds r0, r0, r1
	ldr r1, _0818B508
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x33
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B504: .4byte 0x02024190
_0818B508: .4byte 0x02023D08
_0818B50C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B524
	adds r0, r0, r1
	ldr r1, _0818B528
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x34
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B524: .4byte 0x02024190
_0818B528: .4byte 0x02023D08
_0818B52C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B544
	adds r0, r0, r1
	ldr r1, _0818B548
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x35
	bl SetMonData
	b _0818B562
	.align 2, 0
_0818B544: .4byte 0x02024190
_0818B548: .4byte 0x02023D08
_0818B54C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818B58C
	adds r0, r0, r1
	ldr r1, _0818B590
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x36
	bl SetMonData
_0818B562:
	ldr r2, _0818B594
	ldr r0, _0818B590
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0818B58C
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818B58C: .4byte 0x02024190
_0818B590: .4byte 0x02023D08
_0818B594: .4byte 0x02023D12
	thumb_func_end SetRecordedPlayerMonData

	thumb_func_start RecordedPlayerHandleSetRawMonData
RecordedPlayerHandleSetRawMonData: @ 0x0818B598
	push {r4, r5, r6, r7, lr}
	ldr r1, _0818B5FC
	ldr r7, _0818B600
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r4, _0818B604
	lsls r2, r2, #9
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _0818B608
	adds r0, r0, r1
	adds r5, r3, r0
	movs r3, #0
	adds r0, r4, #2
	adds r2, r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bhs _0818B5F0
	adds r6, r4, #0
	adds r2, r7, #0
	adds r4, r0, #0
_0818B5CE:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, r0, #9
	adds r0, #3
	adds r0, r3, r0
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r2]
	lsls r0, r0, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	blo _0818B5CE
_0818B5F0:
	bl RecordedPlayerBufferExecCompleted
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818B5FC: .4byte 0x02023D12
_0818B600: .4byte 0x02023D08
_0818B604: .4byte 0x02022D08
_0818B608: .4byte 0x02024190
	thumb_func_end RecordedPlayerHandleSetRawMonData

	thumb_func_start RecordedPlayerHandleLoadMonSprite
RecordedPlayerHandleLoadMonSprite: @ 0x0818B60C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _0818B700
	mov r8, r0
	ldr r6, _0818B704
	ldrb r1, [r6]
	lsls r0, r1, #1
	add r0, r8
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _0818B708
	adds r0, r0, r4
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r6]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0xb
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0818B70C
	mov r8, r0
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldrb r0, [r6]
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r6]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, r8
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _0818B710
	ldrb r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r5, _0818B714
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0818B718
	strh r1, [r0, #0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x2e]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0818B71C
	adds r2, r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldr r1, _0818B720
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818B724
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818B700: .4byte 0x02023D12
_0818B704: .4byte 0x02023D08
_0818B708: .4byte 0x02024190
_0818B70C: .4byte 0x02024640
_0818B710: .4byte 0x02023E88
_0818B714: .4byte 0x020205AC
_0818B718: .4byte 0x0000FF10
_0818B71C: .4byte 0x02024188
_0818B720: .4byte 0x03005AC0
_0818B724: .4byte 0x08189D91
	thumb_func_end RecordedPlayerHandleLoadMonSprite

	thumb_func_start RecordedPlayerHandleSwitchInAnim
RecordedPlayerHandleSwitchInAnim: @ 0x0818B728
	push {r4, r5, r6, lr}
	ldr r5, _0818B780
	ldrb r0, [r5]
	ldr r4, _0818B784
	lsls r1, r0, #9
	adds r6, r4, #2
	adds r1, r1, r6
	ldrb r1, [r1]
	bl ClearTemporarySpeciesSpriteData
	ldr r2, _0818B788
	ldrb r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r2
	lsls r0, r0, #9
	adds r4, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0818B78C
	adds r0, r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r5]
	lsls r1, r0, #9
	adds r1, r1, r6
	ldrb r1, [r1]
	bl sub_0818B798
	ldr r1, _0818B790
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818B794
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818B780: .4byte 0x02023D08
_0818B784: .4byte 0x02022D08
_0818B788: .4byte 0x02023D12
_0818B78C: .4byte 0x02024190
_0818B790: .4byte 0x03005AC0
_0818B794: .4byte 0x0818A19D
	thumb_func_end RecordedPlayerHandleSwitchInAnim

	thumb_func_start sub_0818B798
sub_0818B798: @ 0x0818B798
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl ClearTemporarySpeciesSpriteData
	ldr r0, _0818B8EC
	lsls r2, r6, #1
	adds r2, r2, r0
	ldr r0, _0818B8F0
	lsls r1, r6, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0818B8F4
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0818B8F8
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _0818B8FC
	mov sb, r1
	add sb, r6
	mov r1, sb
	strb r0, [r1]
	adds r0, r6, #0
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0818B900
	mov sl, r0
	adds r0, r6, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, sl
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _0818B904
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0818B908
	mov r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r4]
	strh r1, [r0, #0x30]
	mov r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x32]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x2e]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x32]
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r3, r6, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0818B90C
	adds r6, r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0818B910
	str r1, [r0]
	movs r0, #0
	movs r1, #0xff
	bl DoPokeballSendOutAnimation
	mov r1, sb
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x2e]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818B8EC: .4byte 0x02023D12
_0818B8F0: .4byte 0x02022D08
_0818B8F4: .4byte 0x02024190
_0818B8F8: .4byte 0x0805D331
_0818B8FC: .4byte 0x03005ADC
_0818B900: .4byte 0x02024640
_0818B904: .4byte 0x02023E88
_0818B908: .4byte 0x020205AC
_0818B90C: .4byte 0x02024188
_0818B910: .4byte 0x08007141
	thumb_func_end sub_0818B798

	thumb_func_start RecordedPlayerHandleReturnMonToBall
RecordedPlayerHandleReturnMonToBall: @ 0x0818B914
	push {r4, r5, r6, lr}
	ldr r1, _0818B948
	ldr r6, _0818B94C
	ldrb r2, [r6]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _0818B95C
	ldr r0, _0818B950
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r3, [r0, #4]
	ldr r1, _0818B954
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818B958
	str r1, [r0]
	b _0818B992
	.align 2, 0
_0818B948: .4byte 0x02022D08
_0818B94C: .4byte 0x02023D08
_0818B950: .4byte 0x02024174
_0818B954: .4byte 0x03005AC0
_0818B958: .4byte 0x0818B9A5
_0818B95C:
	ldr r5, _0818B998
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0818B99C
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r1, _0818B9A0
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl RecordedPlayerBufferExecCompleted
_0818B992:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818B998: .4byte 0x02023E88
_0818B99C: .4byte 0x020205AC
_0818B9A0: .4byte 0x03005AD0
	thumb_func_end RecordedPlayerHandleReturnMonToBall

	thumb_func_start sub_0818B9A4
sub_0818B9A4: @ 0x0818B9A4
	push {r4, r5, r6, lr}
	ldr r6, _0818B9C4
	ldr r4, [r6]
	ldr r5, _0818B9C8
	ldrb r2, [r5]
	ldr r1, [r4, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _0818B9CC
	cmp r0, #1
	beq _0818B9FA
	b _0818BA22
	.align 2, 0
_0818B9C4: .4byte 0x02024174
_0818B9C8: .4byte 0x02023D08
_0818B9CC:
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0818B9E6
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0818B9E6:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _0818BA22
_0818B9FA:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0818BA22
	strb r0, [r3, #4]
	ldrb r2, [r5]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #1
	bl InitAndLaunchSpecialAnimation
	ldr r1, _0818BA28
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818BA2C
	str r1, [r0]
_0818BA22:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818BA28: .4byte 0x03005AC0
_0818BA2C: .4byte 0x08189EDD
	thumb_func_end sub_0818B9A4

	thumb_func_start RecordedPlayerHandleDrawTrainerPic
RecordedPlayerHandleDrawTrainerPic: @ 0x0818BA30
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0818BA58
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0818BA74
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _0818BA5C
	bl GetActiveBattlerLinkPlayerGender
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _0818BA78
	.align 2, 0
_0818BA58: .4byte 0x02022C90
_0818BA5C:
	ldr r2, _0818BA6C
	ldr r0, _0818BA70
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	b _0818BA76
	.align 2, 0
_0818BA6C: .4byte 0x020226A0
_0818BA70: .4byte 0x0203C480
_0818BA74:
	ldr r0, _0818BAB4
_0818BA76:
	ldrb r4, [r0, #0x13]
_0818BA78:
	ldr r0, _0818BAB8
	ldr r1, [r0]
	movs r2, #0x40
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _0818BAC4
	ldr r0, _0818BABC
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r1, #2
	ands r1, r0
	movs r0, #0x20
	mov sb, r0
	cmp r1, #0
	beq _0818BA9E
	movs r1, #0x5a
	mov sb, r1
_0818BA9E:
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0818BAC8
	movs r0, #0x5a
	mov sb, r0
	ldr r1, _0818BAC0
	b _0818BACA
	.align 2, 0
_0818BAB4: .4byte 0x020226A0
_0818BAB8: .4byte 0x02022C90
_0818BABC: .4byte 0x02023D08
_0818BAC0: .4byte 0x082D8D70
_0818BAC4:
	movs r0, #0x50
	mov sb, r0
_0818BAC8:
	ldr r1, _0818BBE4
_0818BACA:
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x12
	movs r1, #0xa0
	lsls r1, r1, #0xf
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0818BAEC
	b _0818BC08
_0818BAEC:
	ldr r0, _0818BBE8
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	bl PlayerGenderToFrontTrainerPicId
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	ldr r6, _0818BBEC
	ldrb r1, [r6]
	adds r0, r5, #0
	bl DecompressTrainerFrontPic
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl SetMultiuseSpriteTemplateToTrainerFront
	ldr r0, _0818BBF0
	mov r8, r0
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	ldrb r0, [r6]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, r8
	mov r1, sb
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _0818BBF4
	ldrb r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, _0818BBF8
	lsls r5, r5, #3
	adds r5, r5, r0
	ldrh r0, [r5, #4]
	bl IndexOfSpritePaletteTag
	ldr r5, _0818BBFC
	ldrb r1, [r6]
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r5
	lsls r0, r0, #4
	ldrb r3, [r2, #5]
	movs r1, #0xf
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #5]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0xf0
	strh r1, [r0, #0x24]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x30
	strh r1, [r0, #0x26]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0818BC00
	strh r1, [r0, #0x2e]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0818BC04
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r2, [r1, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	b _0818BC9E
	.align 2, 0
_0818BBE4: .4byte 0x082D95BC
_0818BBE8: .4byte 0x03005AF0
_0818BBEC: .4byte 0x02023D08
_0818BBF0: .4byte 0x02024640
_0818BBF4: .4byte 0x02023E88
_0818BBF8: .4byte 0x082D91CC
_0818BBFC: .4byte 0x020205AC
_0818BC00: .4byte 0x0000FFFE
_0818BC04: .4byte 0x0805D3C9
_0818BC08:
	ldr r5, _0818BCB8
	ldrb r1, [r5]
	adds r0, r4, #0
	bl DecompressTrainerBackPic
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r6, _0818BCBC
	mov r8, sb
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	ldrb r0, [r5]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl CreateSprite
	ldr r6, _0818BCC0
	ldrb r1, [r5]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r4, _0818BCC4
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xf0
	strh r1, [r0, #0x24]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0818BCC8
	strh r1, [r0, #0x2e]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _0818BCCC
	str r1, [r0]
_0818BC9E:
	ldr r1, _0818BCD0
	ldr r0, _0818BCB8
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818BCD4
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818BCB8: .4byte 0x02023D08
_0818BCBC: .4byte 0x02024640
_0818BCC0: .4byte 0x02023E88
_0818BCC4: .4byte 0x020205AC
_0818BCC8: .4byte 0x0000FFFE
_0818BCCC: .4byte 0x0805D3C9
_0818BCD0: .4byte 0x03005AC0
_0818BCD4: .4byte 0x081896E5
	thumb_func_end RecordedPlayerHandleDrawTrainerPic

	thumb_func_start RecordedPlayerHandleTrainerSlide
RecordedPlayerHandleTrainerSlide: @ 0x0818BCD8
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleTrainerSlide

	thumb_func_start RecordedPlayerHandleTrainerSlideBack
RecordedPlayerHandleTrainerSlideBack: @ 0x0818BCE4
	push {r4, r5, r6, lr}
	ldr r6, _0818BD70
	ldr r4, _0818BD74
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0818BD78
	adds r0, r0, r5
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x23
	strh r1, [r0, #0x2e]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0818BD7C
	strh r1, [r0, #0x32]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0818BD80
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0818BD84
	bl StoreSpriteCallbackInData6
	ldr r1, _0818BD88
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818BD8C
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818BD70: .4byte 0x02023E88
_0818BD74: .4byte 0x02023D08
_0818BD78: .4byte 0x020205AC
_0818BD7C: .4byte 0x0000FFD8
_0818BD80: .4byte 0x080A67B5
_0818BD84: .4byte 0x08007141
_0818BD88: .4byte 0x03005AC0
_0818BD8C: .4byte 0x0818971D
	thumb_func_end RecordedPlayerHandleTrainerSlideBack

	thumb_func_start RecordedPlayerHandleFaintAnimation
RecordedPlayerHandleFaintAnimation: @ 0x0818BD90
	push {r4, r5, r6, lr}
	ldr r6, _0818BDDC
	ldr r4, [r6]
	ldr r5, _0818BDE0
	ldrb r2, [r5]
	ldr r0, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _0818BDE4
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0818BDC4
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0818BDC4:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	adds r1, #1
	strb r1, [r0, #4]
	b _0818BE5A
	.align 2, 0
_0818BDDC: .4byte 0x02024174
_0818BDE0: .4byte 0x02023D08
_0818BDE4:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0818BE5A
	strb r4, [r3, #4]
	ldr r2, _0818BE60
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0818BE64
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	movs r1, #0x40
	rsbs r1, r1, #0
	movs r0, #0x10
	bl PlaySE12WithPanning
	ldr r2, _0818BE68
	ldr r3, _0818BE6C
	ldrb r0, [r5]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r4, [r0, #0x30]
	ldrb r0, [r5]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #5
	strh r1, [r0, #0x32]
	ldrb r0, [r5]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _0818BE70
	str r1, [r0]
	ldr r1, _0818BE74
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818BE78
	str r1, [r0]
_0818BE5A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818BE60: .4byte 0x02023D12
_0818BE64: .4byte 0x02024190
_0818BE68: .4byte 0x020205AC
_0818BE6C: .4byte 0x02023E88
_0818BE70: .4byte 0x08039845
_0818BE74: .4byte 0x03005AC0
_0818BE78: .4byte 0x08189E41
	thumb_func_end RecordedPlayerHandleFaintAnimation

	thumb_func_start RecordedPlayerHandlePaletteFade
RecordedPlayerHandlePaletteFade: @ 0x0818BE7C
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandlePaletteFade

	thumb_func_start RecordedPlayerHandleTwoReturnValues
RecordedPlayerHandleTwoReturnValues: @ 0x0818BE88
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleTwoReturnValues

	thumb_func_start RecordedPlayerHandleChoosePokemon
RecordedPlayerHandleChoosePokemon: @ 0x0818BE94
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleChoosePokemon

	thumb_func_start RecordedPlayerHandlePause
RecordedPlayerHandlePause: @ 0x0818BEA0
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandlePause

	thumb_func_start RecordedPlayerHandleMoveAnimation
RecordedPlayerHandleMoveAnimation: @ 0x0818BEAC
	push {r4, r5, r6, lr}
	ldr r6, _0818BF90
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0818BEBE
	b _0818BFD2
_0818BEBE:
	ldr r0, _0818BF94
	mov ip, r0
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r0, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, ip
	adds r1, #2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	ldr r5, _0818BF98
	mov r1, ip
	adds r1, #3
	adds r2, r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0818BF9C
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, ip
	adds r1, #5
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _0818BFA0
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, ip
	adds r1, #7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r3, r1
	mov r1, ip
	adds r1, #8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x10
	orrs r3, r1
	mov r1, ip
	adds r1, #9
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #0x18
	orrs r3, r1
	str r3, [r4]
	ldr r3, _0818BFA4
	ldrb r1, [r6]
	lsls r1, r1, #9
	mov r2, ip
	adds r2, #0xa
	adds r1, r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _0818BFA8
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #0xc
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, ip
	adds r1, #0xd
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _0818BFAC
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #0x10
	adds r2, r2, r1
	str r2, [r3]
	ldr r3, _0818BFB0
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl IsMoveWithoutAnimation
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _0818BFB4
	bl RecordedPlayerBufferExecCompleted
	b _0818BFD2
	.align 2, 0
_0818BF90: .4byte 0x02023D08
_0818BF94: .4byte 0x02022D08
_0818BF98: .4byte 0x020380D2
_0818BF9C: .4byte 0x020380A8
_0818BFA0: .4byte 0x020380A4
_0818BFA4: .4byte 0x020380BA
_0818BFA8: .4byte 0x020380BC
_0818BFAC: .4byte 0x020380A0
_0818BFB0: .4byte 0x02024160
_0818BFB4:
	ldr r0, _0818BFD8
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #4]
	ldr r1, _0818BFDC
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818BFE0
	str r1, [r0]
_0818BFD2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818BFD8: .4byte 0x02024174
_0818BFDC: .4byte 0x03005AC0
_0818BFE0: .4byte 0x0818BFE5
	thumb_func_end RecordedPlayerHandleMoveAnimation

	thumb_func_start RecordedPlayerDoMoveAnimation
RecordedPlayerDoMoveAnimation: @ 0x0818BFE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _0818C030
	ldr r6, _0818C034
	ldrb r3, [r6]
	lsls r1, r3, #9
	adds r0, r2, #1
	mov sl, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, r2, #2
	mov sb, r5
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r4, r0
	adds r2, #0xb
	adds r1, r1, r2
	ldrb r1, [r1]
	mov r8, r1
	ldr r7, _0818C038
	ldr r5, [r7]
	ldr r1, [r5, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _0818C07C
	cmp r2, #1
	bgt _0818C03C
	cmp r2, #0
	beq _0818C046
	b _0818C158
	.align 2, 0
_0818C030: .4byte 0x02022D08
_0818C034: .4byte 0x02023D08
_0818C038: .4byte 0x02024174
_0818C03C:
	cmp r2, #2
	beq _0818C0A6
	cmp r2, #3
	beq _0818C11C
	b _0818C158
_0818C046:
	ldr r1, [r5]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, #0xc
	ands r0, r2
	cmp r0, #4
	bne _0818C068
	movs r0, #8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0818C068:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _0818C158
_0818C07C:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0818C158
	movs r0, #0
	bl sub_0805E7B8
	adds r0, r4, #0
	bl DoMoveAnim
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #2
	strb r1, [r0, #4]
	b _0818C158
_0818C0A6:
	ldr r0, _0818C10C
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0818C110
	ldrb r0, [r0]
	cmp r0, #0
	bne _0818C158
	movs r0, #1
	bl sub_0805E7B8
	ldr r0, [r7]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0818C0F4
	mov r0, r8
	cmp r0, #1
	bhi _0818C0F4
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_0818C0F4:
	ldr r0, _0818C114
	ldr r2, [r0]
	ldr r0, _0818C118
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #4]
	b _0818C158
	.align 2, 0
_0818C10C: .4byte 0x02038098
_0818C110: .4byte 0x0203809D
_0818C114: .4byte 0x02024174
_0818C118: .4byte 0x02023D08
_0818C11C:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0818C158
	bl CopyAllBattleSpritesInvisibilities
	ldrb r0, [r6]
	lsls r2, r0, #9
	mov r3, sl
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, sb
	ldrb r2, [r2]
	lsls r2, r2, #8
	orrs r1, r2
	bl TrySetBehindSubstituteSpriteBit
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r4, [r0, #4]
	bl RecordedPlayerBufferExecCompleted
_0818C158:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerDoMoveAnimation

	thumb_func_start RecordedPlayerHandlePrintString
RecordedPlayerHandlePrintString: @ 0x0818C168
	push {r4, lr}
	ldr r0, _0818C1A0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0818C1A4
	strh r1, [r0]
	ldr r4, _0818C1A8
	ldrb r0, [r4]
	lsls r0, r0, #9
	ldr r1, _0818C1AC
	adds r0, r0, r1
	ldrh r0, [r0]
	bl BufferStringBattle
	ldr r0, _0818C1B0
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0818C1B4
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818C1B8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818C1A0: .4byte 0x02022AC8
_0818C1A4: .4byte 0x02022ACA
_0818C1A8: .4byte 0x02023D08
_0818C1AC: .4byte 0x02022D0A
_0818C1B0: .4byte 0x02022AE0
_0818C1B4: .4byte 0x03005AC0
_0818C1B8: .4byte 0x08189F4D
	thumb_func_end RecordedPlayerHandlePrintString

	thumb_func_start RecordedPlayerHandlePrintSelectionString
RecordedPlayerHandlePrintSelectionString: @ 0x0818C1BC
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandlePrintSelectionString

	thumb_func_start ChooseActionInBattlePalace
ChooseActionInBattlePalace: @ 0x0818C1C8
	push {lr}
	ldr r1, _0818C1F8
	ldr r0, _0818C1FC
	ldrb r0, [r0]
	ldrb r1, [r1, #4]
	lsrs r0, r0, #1
	cmp r1, r0
	blo _0818C1F2
	ldr r0, _0818C200
	ldrb r0, [r0]
	bl RecordedBattle_GetBattlerAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	bl RecordedPlayerBufferExecCompleted
_0818C1F2:
	pop {r0}
	bx r0
	.align 2, 0
_0818C1F8: .4byte 0x02023FD6
_0818C1FC: .4byte 0x02023D10
_0818C200: .4byte 0x02023D08
	thumb_func_end ChooseActionInBattlePalace

	thumb_func_start RecordedPlayerHandleChooseAction
RecordedPlayerHandleChooseAction: @ 0x0818C204
	push {lr}
	ldr r0, _0818C224
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0818C234
	ldr r1, _0818C228
	ldr r0, _0818C22C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818C230
	str r1, [r0]
	b _0818C24E
	.align 2, 0
_0818C224: .4byte 0x02022C90
_0818C228: .4byte 0x03005AC0
_0818C22C: .4byte 0x02023D08
_0818C230: .4byte 0x0818C1C9
_0818C234:
	ldr r0, _0818C254
	ldrb r0, [r0]
	bl RecordedBattle_GetBattlerAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	bl RecordedPlayerBufferExecCompleted
_0818C24E:
	pop {r0}
	bx r0
	.align 2, 0
_0818C254: .4byte 0x02023D08
	thumb_func_end RecordedPlayerHandleChooseAction

	thumb_func_start RecordedPlayerHandleUnknownYesNoBox
RecordedPlayerHandleUnknownYesNoBox: @ 0x0818C258
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleUnknownYesNoBox

	thumb_func_start RecordedPlayerHandleChooseMove
RecordedPlayerHandleChooseMove: @ 0x0818C264
	push {r4, r5, lr}
	ldr r0, _0818C288
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0818C28C
	bl ChooseMoveAndTargetInBattlePalace
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
	b _0818C2B0
	.align 2, 0
_0818C288: .4byte 0x02022C90
_0818C28C:
	ldr r5, _0818C2BC
	ldrb r0, [r5]
	bl RecordedBattle_GetBattlerAction
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r5]
	bl RecordedBattle_GetBattlerAction
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x10
	orrs r2, r4
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
_0818C2B0:
	bl RecordedPlayerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818C2BC: .4byte 0x02023D08
	thumb_func_end RecordedPlayerHandleChooseMove

	thumb_func_start RecordedPlayerHandleChooseItem
RecordedPlayerHandleChooseItem: @ 0x0818C2C0
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleChooseItem

	thumb_func_start RecordedPlayerHandlePlaySE
RecordedPlayerHandlePlaySE: @ 0x0818C2CC
	push {r4, lr}
	ldr r4, _0818C300
	ldrb r0, [r4]
	bl RecordedBattle_GetBattlerAction
	ldrb r1, [r4]
	ldr r3, _0818C304
	ldr r2, [r3]
	adds r1, r1, r2
	adds r1, #0x5c
	strb r0, [r1]
	ldrb r0, [r4]
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r0, #1
	movs r2, #0
	bl BtlController_EmitChosenMonReturnValue
	bl RecordedPlayerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818C300: .4byte 0x02023D08
_0818C304: .4byte 0x02024140
	thumb_func_end RecordedPlayerHandlePlaySE

	thumb_func_start RecordedPlayerHandleCmd23
RecordedPlayerHandleCmd23: @ 0x0818C308
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleCmd23

	thumb_func_start RecordedPlayerHandleHealthBarUpdate
RecordedPlayerHandleHealthBarUpdate: @ 0x0818C314
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	bl LoadBattleBarGfx
	ldr r3, _0818C38C
	ldr r0, _0818C390
	mov sb, r0
	ldrb r4, [r0]
	lsls r2, r4, #9
	adds r0, r3, #2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, #3
	adds r2, r2, r3
	ldrb r0, [r2]
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10
	ldr r0, _0818C394
	cmp r7, r0
	beq _0818C3A4
	ldr r6, _0818C398
	lsls r0, r4, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _0818C39C
	adds r0, r0, r4
	movs r1, #0x3a
	bl GetMonData
	mov r8, r0
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x39
	bl GetMonData
	adds r3, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _0818C3A0
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _0818C3DE
	.align 2, 0
_0818C38C: .4byte 0x02022D08
_0818C390: .4byte 0x02023D08
_0818C394: .4byte 0x00007FFF
_0818C398: .4byte 0x02023D12
_0818C39C: .4byte 0x02024190
_0818C3A0: .4byte 0x03005AD0
_0818C3A4:
	ldr r1, _0818C3FC
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0818C400
	adds r0, r0, r1
	movs r1, #0x3a
	bl GetMonData
	adds r2, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r4, _0818C404
	adds r1, r0, r4
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, #0
	bl SetBattleBarStruct
	mov r1, sb
	ldrb r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #0
	bl sub_080726F4
_0818C3DE:
	ldr r1, _0818C408
	ldr r0, _0818C40C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818C410
	str r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818C3FC: .4byte 0x02023D12
_0818C400: .4byte 0x02024190
_0818C404: .4byte 0x03005AD0
_0818C408: .4byte 0x03005AC0
_0818C40C: .4byte 0x02023D08
_0818C410: .4byte 0x08189DD1
	thumb_func_end RecordedPlayerHandleHealthBarUpdate

	thumb_func_start RecordedPlayerHandleExpUpdate
RecordedPlayerHandleExpUpdate: @ 0x0818C414
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleExpUpdate

	thumb_func_start RecordedPlayerHandleStatusIconUpdate
RecordedPlayerHandleStatusIconUpdate: @ 0x0818C420
	push {r4, lr}
	ldr r4, _0818C47C
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0818C474
	ldr r0, _0818C480
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0818C484
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0818C488
	adds r1, r1, r2
	movs r2, #9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _0818C48C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _0818C490
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818C494
	str r1, [r0]
_0818C474:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818C47C: .4byte 0x02023D08
_0818C480: .4byte 0x03005AD0
_0818C484: .4byte 0x02023D12
_0818C488: .4byte 0x02024190
_0818C48C: .4byte 0x02024174
_0818C490: .4byte 0x03005AC0
_0818C494: .4byte 0x0818A2B9
	thumb_func_end RecordedPlayerHandleStatusIconUpdate

	thumb_func_start RecordedPlayerHandleStatusAnimation
RecordedPlayerHandleStatusAnimation: @ 0x0818C498
	push {r4, r5, lr}
	ldr r5, _0818C4F0
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0818C4E8
	ldr r4, _0818C4F4
	ldrb r3, [r5]
	lsls r3, r3, #9
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, r2, #8
	orrs r1, r2
	adds r2, r4, #4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, r2, #0x10
	orrs r1, r2
	adds r4, #5
	adds r3, r3, r4
	ldrb r2, [r3]
	lsls r2, r2, #0x18
	orrs r1, r2
	bl InitAndLaunchChosenStatusAnimation
	ldr r1, _0818C4F8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818C4FC
	str r1, [r0]
_0818C4E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818C4F0: .4byte 0x02023D08
_0818C4F4: .4byte 0x02022D08
_0818C4F8: .4byte 0x03005AC0
_0818C4FC: .4byte 0x0818A2B9
	thumb_func_end RecordedPlayerHandleStatusAnimation

	thumb_func_start RecordedPlayerHandleStatusXor
RecordedPlayerHandleStatusXor: @ 0x0818C500
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleStatusXor

	thumb_func_start RecordedPlayerHandleDataTransfer
RecordedPlayerHandleDataTransfer: @ 0x0818C50C
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleDataTransfer

	thumb_func_start RecordedPlayerHandleDMA3Transfer
RecordedPlayerHandleDMA3Transfer: @ 0x0818C518
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleDMA3Transfer

	thumb_func_start RecordedPlayerHandlePlayBGM
RecordedPlayerHandlePlayBGM: @ 0x0818C524
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandlePlayBGM

	thumb_func_start RecordedPlayerHandleCmd32
RecordedPlayerHandleCmd32: @ 0x0818C530
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleCmd32

	thumb_func_start sub_0818C53C
sub_0818C53C: @ 0x0818C53C
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818C53C

	thumb_func_start sub_0818C548
sub_0818C548: @ 0x0818C548
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818C548

	thumb_func_start sub_0818C554
sub_0818C554: @ 0x0818C554
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818C554

	thumb_func_start RecordedPlayerHandleOneReturnValue_Duplicate
RecordedPlayerHandleOneReturnValue_Duplicate: @ 0x0818C560
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleOneReturnValue_Duplicate

	thumb_func_start RecordedPlayerHandleCmd37
RecordedPlayerHandleCmd37: @ 0x0818C56C
	push {lr}
	ldr r2, _0818C584
	ldrb r1, [r2]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0818C584: .4byte 0x020229C0
	thumb_func_end RecordedPlayerHandleCmd37

	thumb_func_start RecordedPlayerHandleCmd38
RecordedPlayerHandleCmd38: @ 0x0818C588
	push {lr}
	ldr r3, _0818C5B4
	ldr r1, _0818C5B8
	ldr r0, _0818C5BC
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0818C5B4: .4byte 0x020229C0
_0818C5B8: .4byte 0x02022D08
_0818C5BC: .4byte 0x02023D08
	thumb_func_end RecordedPlayerHandleCmd38

	thumb_func_start RecordedPlayerHandleCmd39
RecordedPlayerHandleCmd39: @ 0x0818C5C0
	push {lr}
	ldr r2, _0818C5D4
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0818C5D4: .4byte 0x020229C0
	thumb_func_end RecordedPlayerHandleCmd39

	thumb_func_start RecordedPlayerHandleCmd40
RecordedPlayerHandleCmd40: @ 0x0818C5D8
	push {lr}
	ldr r3, _0818C5FC
	ldr r1, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #7
	ldrb r2, [r3]
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0818C5FC: .4byte 0x020229C0
	thumb_func_end RecordedPlayerHandleCmd40

	thumb_func_start sub_0818C600
sub_0818C600: @ 0x0818C600
	push {r4, lr}
	ldr r3, _0818C628
	ldr r2, _0818C62C
	ldr r4, _0818C630
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _0818C634
	bl RecordedPlayerBufferExecCompleted
	b _0818C65E
	.align 2, 0
_0818C628: .4byte 0x020205AC
_0818C62C: .4byte 0x02023E88
_0818C630: .4byte 0x02023D08
_0818C634:
	ldr r1, _0818C664
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #0x30]
	ldrb r0, [r4]
	bl DoHitAnimHealthboxEffect
	ldr r1, _0818C668
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818C66C
	str r1, [r0]
_0818C65E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818C664: .4byte 0x0202415D
_0818C668: .4byte 0x03005AC0
_0818C66C: .4byte 0x08189F65
	thumb_func_end sub_0818C600

	thumb_func_start RecordedPlayerHandleCmd42
RecordedPlayerHandleCmd42: @ 0x0818C670
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleCmd42

	thumb_func_start sub_0818C67C
sub_0818C67C: @ 0x0818C67C
	push {r4, lr}
	ldr r4, _0818C6B8
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r3, #0x3f
	cmp r0, #0
	bne _0818C690
	movs r3, #0xc0
_0818C690:
	ldr r2, _0818C6BC
	ldrb r1, [r4]
	lsls r1, r1, #9
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	bl PlaySE12WithPanning
	bl RecordedPlayerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818C6B8: .4byte 0x02023D08
_0818C6BC: .4byte 0x02022D08
	thumb_func_end sub_0818C67C

	thumb_func_start RecordedPlayerHandlePlayFanfareOrBGM
RecordedPlayerHandlePlayFanfareOrBGM: @ 0x0818C6C0
	push {r4, r5, lr}
	ldr r4, _0818C6F4
	ldr r5, _0818C6F8
	ldrb r0, [r5]
	lsls r3, r0, #9
	adds r0, r4, #3
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0818C6FC
	bl BattleStopLowHpSound
	ldrb r1, [r5]
	lsls r1, r1, #9
	adds r0, r4, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r4, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayBGM
	b _0818C710
	.align 2, 0
_0818C6F4: .4byte 0x02022D08
_0818C6F8: .4byte 0x02023D08
_0818C6FC:
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayFanfare
_0818C710:
	bl RecordedPlayerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandlePlayFanfareOrBGM

	thumb_func_start RecordedPlayerHandleFaintingCry
RecordedPlayerHandleFaintingCry: @ 0x0818C71C
	push {lr}
	ldr r1, _0818C750
	ldr r0, _0818C754
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0818C758
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	rsbs r1, r1, #0
	movs r2, #5
	bl PlayCry3
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0818C750: .4byte 0x02023D12
_0818C754: .4byte 0x02023D08
_0818C758: .4byte 0x02024190
	thumb_func_end RecordedPlayerHandleFaintingCry

	thumb_func_start RecordedPlayerHandleIntroSlide
RecordedPlayerHandleIntroSlide: @ 0x0818C75C
	push {lr}
	ldr r1, _0818C784
	ldr r0, _0818C788
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _0818C78C
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0818C784: .4byte 0x02022D08
_0818C788: .4byte 0x02023D08
_0818C78C: .4byte 0x020240A0
	thumb_func_end RecordedPlayerHandleIntroSlide

	thumb_func_start RecordedPlayerHandleIntroTrainerBallThrow
RecordedPlayerHandleIntroTrainerBallThrow: @ 0x0818C790
	push {r4, r5, r6, lr}
	ldr r5, _0818C85C
	ldr r6, _0818C860
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0818C864
	adds r0, r0, r4
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x32
	strh r1, [r0, #0x2e]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0818C868
	strh r1, [r0, #0x32]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0818C86C
	str r1, [r0]
	ldrb r2, [r6]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x38]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0818C870
	bl StoreSpriteCallbackInData6
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, _0818C874
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0818C878
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0818C880
	ldr r4, _0818C87C
	ldrb r0, [r6]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r1, #0x13]
	b _0818C886
	.align 2, 0
_0818C85C: .4byte 0x02023E88
_0818C860: .4byte 0x02023D08
_0818C864: .4byte 0x020205AC
_0818C868: .4byte 0x0000FFD8
_0818C86C: .4byte 0x080A67B5
_0818C870: .4byte 0x0805C81D
_0818C874: .4byte 0x0000D6F9
_0818C878: .4byte 0x02022C90
_0818C87C: .4byte 0x020226A0
_0818C880:
	ldr r0, _0818C920
	ldr r0, [r0]
	ldrb r0, [r0, #8]
_0818C886:
	ldr r1, _0818C924
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r5, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r2, _0818C928
	ldr r1, _0818C92C
	ldr r5, _0818C930
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, #5]
	ldr r0, _0818C934
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0818C938
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r5]
	strh r0, [r1, #8]
	ldr r3, _0818C93C
	ldr r0, [r3]
	ldrb r2, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0818C900
	ldr r0, _0818C940
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, _0818C944
	str r1, [r0]
_0818C900:
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r0, [r2, #9]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #9]
	ldr r1, _0818C948
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818C94C
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818C920: .4byte 0x03005AF0
_0818C924: .4byte 0x082D961C
_0818C928: .4byte 0x020205AC
_0818C92C: .4byte 0x02023E88
_0818C930: .4byte 0x02023D08
_0818C934: .4byte 0x0818C951
_0818C938: .4byte 0x03005B60
_0818C93C: .4byte 0x02024174
_0818C940: .4byte 0x02024158
_0818C944: .4byte 0x0807352D
_0818C948: .4byte 0x03005AC0
_0818C94C: .4byte 0x08189675
	thumb_func_end RecordedPlayerHandleIntroTrainerBallThrow

	thumb_func_start sub_0818C950
sub_0818C950: @ 0x0818C950
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _0818C978
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0x17
	bgt _0818C97C
	adds r0, r2, #1
	strh r0, [r1, #0xa]
	b _0818CA38
	.align 2, 0
_0818C978: .4byte 0x03005B60
_0818C97C:
	ldr r7, _0818C9BC
	ldrb r0, [r7]
	mov sb, r0
	ldrh r0, [r1, #8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0818C99C
	ldr r0, _0818C9C0
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0818C9CC
_0818C99C:
	ldr r0, _0818C9C4
	ldrb r1, [r7]
	lsls r2, r1, #9
	adds r0, #1
	adds r2, r2, r0
	ldr r0, _0818C9C8
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_0818B798
	b _0818CA20
	.align 2, 0
_0818C9BC: .4byte 0x02023D08
_0818C9C0: .4byte 0x02022C90
_0818C9C4: .4byte 0x02022D08
_0818C9C8: .4byte 0x02023D12
_0818C9CC:
	ldr r4, _0818CA44
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r4, #1
	adds r1, r1, r4
	ldr r5, _0818CA48
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_0818B798
	ldrb r0, [r7]
	movs r6, #2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r1, r1, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0818CA4C
	adds r0, r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r7]
	movs r1, #0
	bl sub_0818B798
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_0818CA20:
	ldr r1, _0818CA50
	ldr r2, _0818CA54
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818CA58
	str r1, [r0]
	mov r3, sb
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_0818CA38:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818CA44: .4byte 0x02022D08
_0818CA48: .4byte 0x02023D12
_0818CA4C: .4byte 0x02024190
_0818CA50: .4byte 0x03005AC0
_0818CA54: .4byte 0x02023D08
_0818CA58: .4byte 0x08189A6D
	thumb_func_end sub_0818C950

	thumb_func_start RecordedPlayerHandleDrawPartyStatusSummary
RecordedPlayerHandleDrawPartyStatusSummary: @ 0x0818CA5C
	push {r4, r5, r6, lr}
	ldr r1, _0818CA84
	ldr r0, _0818CA88
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0818CA8C
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0818CA8C
	bl RecordedPlayerBufferExecCompleted
	b _0818CB00
	.align 2, 0
_0818CA84: .4byte 0x02022D08
_0818CA88: .4byte 0x02023D08
_0818CA8C:
	ldr r6, _0818CB08
	ldr r0, [r6]
	ldr r5, _0818CB0C
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, #9
	ldr r4, _0818CB10
	adds r1, r3, r4
	subs r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, #2
	adds r3, r3, r4
	ldrb r3, [r3]
	bl CreatePartyStatusSummarySprites
	ldr r2, _0818CB14
	ldrb r1, [r5]
	adds r1, r1, r2
	movs r3, #0
	strb r0, [r1]
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #5]
	ldrb r2, [r5]
	lsls r0, r2, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0818CAF4
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x5d
	strb r1, [r0, #5]
_0818CAF4:
	ldr r0, _0818CB18
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0818CB1C
	str r0, [r1]
_0818CB00:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818CB08: .4byte 0x02024174
_0818CB0C: .4byte 0x02023D08
_0818CB10: .4byte 0x02022D0C
_0818CB14: .4byte 0x02024158
_0818CB18: .4byte 0x03005AC0
_0818CB1C: .4byte 0x0818CB21
	thumb_func_end RecordedPlayerHandleDrawPartyStatusSummary

	thumb_func_start sub_0818CB20
sub_0818CB20: @ 0x0818CB20
	push {r4, lr}
	ldr r4, _0818CB60
	ldr r0, [r4]
	ldr r3, _0818CB64
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	adds r2, r1, #1
	strb r2, [r0, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0x5c
	bls _0818CB58
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #5]
	bl RecordedPlayerBufferExecCompleted
_0818CB58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818CB60: .4byte 0x02024174
_0818CB64: .4byte 0x02023D08
	thumb_func_end sub_0818CB20

	thumb_func_start RecordedPlayerHandleHidePartyStatusSummary
RecordedPlayerHandleHidePartyStatusSummary: @ 0x0818CB68
	push {lr}
	ldr r0, _0818CBA4
	ldr r1, [r0]
	ldr r0, _0818CBA8
	ldrb r3, [r0]
	ldr r1, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0818CB9A
	ldr r2, _0818CBAC
	ldr r0, _0818CBB0
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _0818CBB4
	str r1, [r0]
_0818CB9A:
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0818CBA4: .4byte 0x02024174
_0818CBA8: .4byte 0x02023D08
_0818CBAC: .4byte 0x03005B60
_0818CBB0: .4byte 0x02024158
_0818CBB4: .4byte 0x0807352D
	thumb_func_end RecordedPlayerHandleHidePartyStatusSummary

	thumb_func_start RecordedPlayerHandleEndBounceEffect
RecordedPlayerHandleEndBounceEffect: @ 0x0818CBB8
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleEndBounceEffect

	thumb_func_start RecordedPlayerHandleSpriteInvisibility
RecordedPlayerHandleSpriteInvisibility: @ 0x0818CBC4
	push {r4, lr}
	ldr r4, _0818CC14
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0818CC0A
	ldr r3, _0818CC18
	ldr r0, _0818CC1C
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _0818CC20
	lsls r1, r1, #9
	adds r0, #1
	adds r1, r1, r0
	adds r2, #0x3e
	movs r0, #1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl CopyBattleSpriteInvisibility
_0818CC0A:
	bl RecordedPlayerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818CC14: .4byte 0x02023D08
_0818CC18: .4byte 0x020205AC
_0818CC1C: .4byte 0x02023E88
_0818CC20: .4byte 0x02022D08
	thumb_func_end RecordedPlayerHandleSpriteInvisibility

	thumb_func_start RecordedPlayerHandleBattleAnimation
RecordedPlayerHandleBattleAnimation: @ 0x0818CC24
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0818CC68
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0818CC7C
	ldr r5, _0818CC6C
	ldrb r2, [r6]
	lsls r1, r2, #9
	adds r0, r5, #1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, #2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, #3
	adds r1, r1, r5
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, #0
	adds r1, r2, #0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0818CC70
	bl RecordedPlayerBufferExecCompleted
	b _0818CC7C
	.align 2, 0
_0818CC68: .4byte 0x02023D08
_0818CC6C: .4byte 0x02022D08
_0818CC70:
	ldr r0, _0818CC84
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0818CC88
	str r0, [r1]
_0818CC7C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818CC84: .4byte 0x03005AC0
_0818CC88: .4byte 0x0818A2E9
	thumb_func_end RecordedPlayerHandleBattleAnimation

	thumb_func_start RecordedPlayerHandleLinkStandbyMsg
RecordedPlayerHandleLinkStandbyMsg: @ 0x0818CC8C
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleLinkStandbyMsg

	thumb_func_start RecordedPlayerHandleResetActionMoveSelection
RecordedPlayerHandleResetActionMoveSelection: @ 0x0818CC98
	push {lr}
	bl RecordedPlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedPlayerHandleResetActionMoveSelection

	thumb_func_start RecordedPlayerHandleCmd55
RecordedPlayerHandleCmd55: @ 0x0818CCA4
	push {r4, lr}
	ldr r2, _0818CCDC
	ldr r1, _0818CCE0
	ldr r4, _0818CCE4
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, #5
	bl FadeOutMapMusic
	movs r0, #3
	bl BeginFastPaletteFade
	bl RecordedPlayerBufferExecCompleted
	ldr r1, _0818CCE8
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818CCEC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818CCDC: .4byte 0x02023FDE
_0818CCE0: .4byte 0x02022D08
_0818CCE4: .4byte 0x02023D08
_0818CCE8: .4byte 0x03005AC0
_0818CCEC: .4byte 0x080583C1
	thumb_func_end RecordedPlayerHandleCmd55

	thumb_func_start RecordedPlayerCmdEnd
RecordedPlayerCmdEnd: @ 0x0818CCF0
	bx lr
	.align 2, 0
	thumb_func_end RecordedPlayerCmdEnd

