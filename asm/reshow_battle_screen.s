.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start nullsub_35
nullsub_35: @ 0x080A8BBC
	bx lr
	.align 2, 0
	thumb_func_end nullsub_35

	thumb_func_start ReshowBattleScreenAfterMenu
ReshowBattleScreenAfterMenu: @ 0x080A8BC0
	push {lr}
	ldr r2, _080A8BF8
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	ldr r0, _080A8BFC
	adds r2, r0, #0
	adds r2, #0x21
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x22
	strb r1, [r0]
	ldr r0, _080A8C00
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A8BF8: .4byte 0x02037C74
_080A8BFC: .4byte 0x02024118
_080A8C00: .4byte 0x080A8C05
	thumb_func_end ReshowBattleScreenAfterMenu

	thumb_func_start CB2_ReshowBattleScreenAfterMenu
CB2_ReshowBattleScreenAfterMenu: @ 0x080A8C04
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _080A8C20
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x13
	bls _080A8C14
	b _080A8E6C
_080A8C14:
	lsls r0, r0, #2
	ldr r1, _080A8C24
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A8C20: .4byte 0x02024118
_080A8C24: .4byte 0x080A8C28
_080A8C28: @ jump table
	.4byte _080A8C78 @ case 0
	.4byte _080A8CF4 @ case 1
	.4byte _080A8D0C @ case 2
	.4byte _080A8D12 @ case 3
	.4byte _080A8D18 @ case 4
	.4byte _080A8D28 @ case 5
	.4byte _080A8D2E @ case 6
	.4byte _080A8D56 @ case 7
	.4byte _080A8D5A @ case 8
	.4byte _080A8D5E @ case 9
	.4byte _080A8D62 @ case 10
	.4byte _080A8D80 @ case 11
	.4byte _080A8D88 @ case 12
	.4byte _080A8D90 @ case 13
	.4byte _080A8D98 @ case 14
	.4byte _080A8DA0 @ case 15
	.4byte _080A8DA8 @ case 16
	.4byte _080A8DB0 @ case 17
	.4byte _080A8DB8 @ case 18
	.4byte _080A8DC0 @ case 19
_080A8C78:
	bl ScanlineEffect_Clear
	bl BattleInitBgsAndWindows
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	bl ResetPaletteFade
	ldr r0, _080A8CD4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080A8CD8
	strh r1, [r0]
	ldr r0, _080A8CDC
	strh r1, [r0]
	ldr r0, _080A8CE0
	strh r1, [r0]
	ldr r0, _080A8CE4
	strh r1, [r0]
	ldr r0, _080A8CE8
	strh r1, [r0]
	ldr r0, _080A8CEC
	strh r1, [r0]
	ldr r0, _080A8CF0
	strh r1, [r0]
	b _080A8E9A
	.align 2, 0
_080A8CD4: .4byte 0x02022AC8
_080A8CD8: .4byte 0x02022ACA
_080A8CDC: .4byte 0x02022ACC
_080A8CE0: .4byte 0x02022ACE
_080A8CE4: .4byte 0x02022AD0
_080A8CE8: .4byte 0x02022AD2
_080A8CEC: .4byte 0x02022AD4
_080A8CF0: .4byte 0x02022AD6
_080A8CF4:
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080A8D08
	add r0, sp, #4
	bl CpuFastSet
	b _080A8E9A
	.align 2, 0
_080A8D08: .4byte 0x01006000
_080A8D0C:
	bl LoadBattleTextboxAndBackground
	b _080A8E9A
_080A8D12:
	bl ResetSpriteData
	b _080A8E9A
_080A8D18:
	bl FreeAllSpritePalettes
	ldr r1, _080A8D24
	movs r0, #4
	strb r0, [r1]
	b _080A8E9A
	.align 2, 0
_080A8D24: .4byte 0x030030BC
_080A8D28:
	bl ClearSpritesHealthboxAnimData
	b _080A8E9A
_080A8D2E:
	ldr r5, _080A8D48
	adds r4, r5, #0
	adds r4, #0x22
	ldrb r0, [r4]
	bl BattleLoadAllHealthBoxesGfx
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A8D4C
	movs r0, #0
	strb r0, [r4]
	b _080A8E9A
	.align 2, 0
_080A8D48: .4byte 0x02024118
_080A8D4C:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r1, r5, #0
	b _080A8D72
_080A8D56:
	movs r0, #0
	b _080A8D64
_080A8D5A:
	movs r0, #1
	b _080A8D64
_080A8D5E:
	movs r0, #2
	b _080A8D64
_080A8D62:
	movs r0, #3
_080A8D64:
	bl LoadBattlerSpriteGfx
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A8D70
	b _080A8E9A
_080A8D70:
	ldr r1, _080A8D7C
_080A8D72:
	adds r1, #0x21
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b _080A8E9A
	.align 2, 0
_080A8D7C: .4byte 0x02024118
_080A8D80:
	movs r0, #0
	bl CreateBattlerSprite
	b _080A8E9A
_080A8D88:
	movs r0, #1
	bl CreateBattlerSprite
	b _080A8E9A
_080A8D90:
	movs r0, #2
	bl CreateBattlerSprite
	b _080A8E9A
_080A8D98:
	movs r0, #3
	bl CreateBattlerSprite
	b _080A8E9A
_080A8DA0:
	movs r0, #0
	bl CreateHealthboxSprite
	b _080A8E9A
_080A8DA8:
	movs r0, #1
	bl CreateHealthboxSprite
	b _080A8E9A
_080A8DB0:
	movs r0, #2
	bl CreateHealthboxSprite
	b _080A8E9A
_080A8DB8:
	movs r0, #3
	bl CreateHealthboxSprite
	b _080A8E9A
_080A8DC0:
	bl LoadAndCreateEnemyShadowSprites
	movs r0, #1
	bl GetBattlerAtPosition
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r7, _080A8E54
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080A8E58
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A8E24
	movs r0, #3
	bl GetBattlerAtPosition
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
_080A8E24:
	ldr r1, _080A8E5C
	ldr r0, _080A8E60
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl SetCB2ToReshowScreenAfterMenu
	ldr r0, _080A8E64
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A8E9A
	ldr r0, _080A8E68
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A8E9A
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	b _080A8E9A
	.align 2, 0
_080A8E54: .4byte 0x02023D12
_080A8E58: .4byte 0x020243E8
_080A8E5C: .4byte 0x02024150
_080A8E60: .4byte 0x0202415C
_080A8E64: .4byte 0x0300319C
_080A8E68: .4byte 0x030031C4
_080A8E6C:
	ldr r0, _080A8EAC
	bl SetVBlankCallback
	bl sub_080A8EBC
	movs r0, #1
	str r0, [sp]
	movs r0, #0xff
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginHardwarePaletteFade
	ldr r2, _080A8EB0
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	ldr r0, _080A8EB4
	bl SetMainCallback2
	bl sub_0805EB30
_080A8E9A:
	ldr r1, _080A8EB8
	adds r1, #0x21
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8EAC: .4byte 0x080386DD
_080A8EB0: .4byte 0x02037C74
_080A8EB4: .4byte 0x080380FD
_080A8EB8: .4byte 0x02024118
	thumb_func_end CB2_ReshowBattleScreenAfterMenu

	thumb_func_start sub_080A8EBC
sub_080A8EBC: @ 0x080A8EBC
	ldr r3, _080A8ED4
	ldrb r2, [r3]
	movs r1, #0xd
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r2, _080A8ED8
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_080A8ED4: .4byte 0x0400000A
_080A8ED8: .4byte 0x0400000C
	thumb_func_end sub_080A8EBC

	thumb_func_start LoadBattlerSpriteGfx
LoadBattlerSpriteGfx: @ 0x080A8EDC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A8F24
	ldrb r0, [r0]
	cmp r4, r0
	bhs _080A8FC4
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A8F3E
	ldr r0, _080A8F28
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080A8F34
	ldr r1, _080A8F2C
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A8F30
	adds r0, r0, r1
	adds r1, r4, #0
	bl BattleLoadOpponentMonSpriteGfx
	b _080A8FBC
	.align 2, 0
_080A8F24: .4byte 0x02023D10
_080A8F28: .4byte 0x02024174
_080A8F2C: .4byte 0x02023D12
_080A8F30: .4byte 0x020243E8
_080A8F34:
	adds r0, r4, #0
	movs r1, #0
	bl BattleLoadSubstituteOrMonSpriteGfx
	b _080A8FBC
_080A8F3E:
	ldr r0, _080A8F58
	ldr r1, [r0]
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq _080A8F60
	cmp r4, #0
	bne _080A8F60
	ldr r0, _080A8F5C
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	b _080A8F72
	.align 2, 0
_080A8F58: .4byte 0x02022C90
_080A8F5C: .4byte 0x03005AF0
_080A8F60:
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A8F7A
	cmp r4, #0
	bne _080A8F7A
	movs r0, #6
_080A8F72:
	movs r1, #0
	bl DecompressTrainerBackPic
	b _080A8FBC
_080A8F7A:
	ldr r0, _080A8FA8
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080A8FB4
	ldr r1, _080A8FAC
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A8FB0
	adds r0, r0, r1
	adds r1, r4, #0
	bl BattleLoadPlayerMonSpriteGfx
	b _080A8FBC
	.align 2, 0
_080A8FA8: .4byte 0x02024174
_080A8FAC: .4byte 0x02023D12
_080A8FB0: .4byte 0x02024190
_080A8FB4:
	adds r0, r4, #0
	movs r1, #0
	bl BattleLoadSubstituteOrMonSpriteGfx
_080A8FBC:
	ldr r0, _080A8FCC
	adds r0, #0x22
	movs r1, #0
	strb r1, [r0]
_080A8FC4:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A8FCC: .4byte 0x02024118
	thumb_func_end LoadBattlerSpriteGfx

	thumb_func_start CreateBattlerSprite
CreateBattlerSprite: @ 0x080A8FD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080A9008
	ldrb r0, [r0]
	cmp r7, r0
	blo _080A8FEA
	b _080A9368
_080A8FEA:
	ldr r0, _080A900C
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r2, r7, #2
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	str r2, [sp]
	cmp r0, #0
	beq _080A9010
	adds r0, r7, #0
	bl GetSubstituteSpriteDefault_Y
	b _080A9016
	.align 2, 0
_080A9008: .4byte 0x02023D10
_080A900C: .4byte 0x02024174
_080A9010:
	adds r0, r7, #0
	bl GetBattlerSpriteDefault_Y
_080A9016:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A902A
	b _080A9134
_080A902A:
	ldr r1, _080A9114
	lsls r0, r7, #1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, #0x64
	mov sl, r1
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	ldr r1, _080A9118
	mov sb, r1
	add r0, sb
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _080A904E
	b _080A9368
_080A904E:
	ldrh r0, [r6]
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	add r0, sb
	movs r1, #0xb
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r5, _080A911C
	adds r0, r7, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl CreateSprite
	ldr r1, _080A9120
	adds r4, r7, r1
	strb r0, [r4]
	ldr r5, _080A9124
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r3, r7, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _080A9128
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r7, [r0, #0x2e]
	ldrh r0, [r6]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sb
	movs r1, #0xb
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	strh r0, [r1, #0x32]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _080A912C
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
	ldr r0, _080A9130
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r2, [sp]
	adds r0, r2, r0
	b _080A9318
	.align 2, 0
_080A9114: .4byte 0x02023D12
_080A9118: .4byte 0x020243E8
_080A911C: .4byte 0x02024640
_080A9120: .4byte 0x02023E88
_080A9124: .4byte 0x020205AC
_080A9128: .4byte 0x08007141
_080A912C: .4byte 0x02024188
_080A9130: .4byte 0x02024174
_080A9134:
	ldr r0, _080A9188
	ldr r1, [r0]
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq _080A9198
	cmp r7, #0
	bne _080A9198
	ldr r5, _080A918C
	ldr r0, [r5]
	ldrb r4, [r0, #8]
	movs r0, #0
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r6, _080A9190
	ldr r1, _080A9194
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r4, #8
	subs r4, r4, r0
	lsls r4, r4, #0x12
	movs r0, #0xa0
	lsls r0, r0, #0xf
	adds r4, r4, r0
	asrs r4, r4, #0x10
	movs r0, #0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r6, #0
	b _080A91DC
	.align 2, 0
_080A9188: .4byte 0x02022C90
_080A918C: .4byte 0x03005AF0
_080A9190: .4byte 0x02024640
_080A9194: .4byte 0x082D95BC
_080A9198:
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A9230
	cmp r7, #0
	bne _080A9230
	movs r0, #0
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #6
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r5, _080A921C
	ldr r0, _080A9220
	ldrb r0, [r0, #0x18]
	movs r4, #8
	subs r4, r4, r0
	lsls r4, r4, #0x12
	movs r1, #0xa0
	lsls r1, r1, #0xf
	adds r4, r4, r1
	asrs r4, r4, #0x10
	movs r0, #0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r5, #0
_080A91DC:
	movs r1, #0x50
	adds r2, r4, #0
	bl CreateSprite
	ldr r3, _080A9224
	strb r0, [r3]
	ldr r4, _080A9228
	ldrb r0, [r3]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1, #5]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _080A922C
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r7, [r0, #0x2e]
	b _080A9338
	.align 2, 0
_080A921C: .4byte 0x02024640
_080A9220: .4byte 0x082D95BC
_080A9224: .4byte 0x02023E88
_080A9228: .4byte 0x020205AC
_080A922C: .4byte 0x08007141
_080A9230:
	ldr r1, _080A9378
	lsls r0, r7, #1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r2, #0x64
	mov sl, r2
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r2, _080A937C
	mov sb, r2
	add r0, sb
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _080A9254
	b _080A9368
_080A9254:
	ldrh r0, [r6]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sb
	movs r1, #0xb
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r5, _080A9380
	adds r0, r7, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl CreateSprite
	ldr r1, _080A9384
	adds r4, r7, r1
	strb r0, [r4]
	ldr r5, _080A9388
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r3, r7, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _080A938C
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r7, [r0, #0x2e]
	ldrh r0, [r6]
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	add r0, sb
	movs r1, #0xb
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	strh r0, [r1, #0x32]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _080A9390
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
	ldr r0, _080A9394
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r1, r0
_080A9318:
	ldrh r1, [r0, #2]
	ldr r0, _080A9398
	cmp r1, r0
	bne _080A9338
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #8
	adds r1, r1, r0
	ldr r0, _080A939C
	ldr r2, _080A93A0
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
_080A9338:
	ldr r1, _080A9388
	ldr r0, _080A9384
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	ldr r0, _080A9394
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r1, r0
	ldr r1, [r0]
	lsls r1, r1, #0x1f
	adds r2, #0x3e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_080A9368:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9378: .4byte 0x02023D12
_080A937C: .4byte 0x02024190
_080A9380: .4byte 0x02024640
_080A9384: .4byte 0x02023E88
_080A9388: .4byte 0x020205AC
_080A938C: .4byte 0x08007141
_080A9390: .4byte 0x02024188
_080A9394: .4byte 0x02024174
_080A9398: .4byte 0x00000181
_080A939C: .4byte 0x082DD33C
_080A93A0: .4byte 0x00000604
	thumb_func_end CreateBattlerSprite

	thumb_func_start CreateHealthboxSprite
CreateHealthboxSprite: @ 0x080A93A4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080A93CC
	ldrb r0, [r0]
	cmp r5, r0
	blo _080A93B4
	b _080A9526
_080A93B4:
	ldr r0, _080A93D0
	ldr r1, [r0]
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq _080A93D4
	cmp r5, #0
	bne _080A93D4
	bl CreateSafariPlayerHealthboxSprites
	b _080A93EC
	.align 2, 0
_080A93CC: .4byte 0x02023D10
_080A93D0: .4byte 0x02022C90
_080A93D4:
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A93E6
	cmp r5, #0
	bne _080A93E6
	b _080A9526
_080A93E6:
	adds r0, r5, #0
	bl CreateBattlerHealthboxSprites
_080A93EC:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080A9428
	adds r4, r5, r0
	strb r6, [r4]
	adds r0, r5, #0
	bl InitBattlerHealthboxCoords
	adds r0, r6, #0
	bl SetHealthboxSpriteVisible
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A9434
	ldrb r0, [r4]
	ldr r1, _080A942C
	lsls r4, r5, #1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _080A9430
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	b _080A9480
	.align 2, 0
_080A9428: .4byte 0x03005AD0
_080A942C: .4byte 0x02023D12
_080A9430: .4byte 0x020243E8
_080A9434:
	ldr r0, _080A945C
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A9468
	ldrb r0, [r4]
	ldr r1, _080A9460
	lsls r4, r5, #1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _080A9464
	adds r1, r1, r2
	movs r2, #0xa
	bl UpdateHealthboxAttribute
	b _080A9480
	.align 2, 0
_080A945C: .4byte 0x02022C90
_080A9460: .4byte 0x02023D12
_080A9464: .4byte 0x02024190
_080A9468:
	ldrb r0, [r4]
	ldr r1, _080A94AC
	lsls r4, r5, #1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _080A94B0
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
_080A9480:
	adds r0, r5, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _080A949C
	adds r0, r5, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _080A94B8
_080A949C:
	ldr r0, _080A94B4
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, #1
	bl DummyBattleInterfaceFunc
	b _080A94C4
	.align 2, 0
_080A94AC: .4byte 0x02023D12
_080A94B0: .4byte 0x02024190
_080A94B4: .4byte 0x03005AD0
_080A94B8:
	ldr r0, _080A94F0
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, #0
	bl DummyBattleInterfaceFunc
_080A94C4:
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A94FC
	ldr r0, _080A94F4
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A94F8
	adds r0, r0, r1
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _080A9526
	adds r0, r6, #0
	bl SetHealthboxSpriteInvisible
	b _080A9526
	.align 2, 0
_080A94F0: .4byte 0x03005AD0
_080A94F4: .4byte 0x02023D12
_080A94F8: .4byte 0x020243E8
_080A94FC:
	ldr r0, _080A952C
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080A9526
	ldr r0, _080A9530
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080A9534
	adds r0, r0, r1
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _080A9526
	adds r0, r6, #0
	bl SetHealthboxSpriteInvisible
_080A9526:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A952C: .4byte 0x02022C90
_080A9530: .4byte 0x02023D12
_080A9534: .4byte 0x02024190
	thumb_func_end CreateHealthboxSprite

