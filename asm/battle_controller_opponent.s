.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0805ED7C
sub_0805ED7C: @ 0x0805ED7C
	bx lr
	.align 2, 0
	thumb_func_end sub_0805ED7C

	thumb_func_start SetControllerToOpponent
SetControllerToOpponent: @ 0x0805ED80
	ldr r1, _0805ED90
	ldr r0, _0805ED94
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805ED98
	str r1, [r0]
	bx lr
	.align 2, 0
_0805ED90: .4byte 0x03005AC0
_0805ED94: .4byte 0x02023D08
_0805ED98: .4byte 0x0805ED9D
	thumb_func_end SetControllerToOpponent

	thumb_func_start OpponentBufferRunCommand
OpponentBufferRunCommand: @ 0x0805ED9C
	push {lr}
	ldr r2, _0805EDD0
	ldr r1, _0805EDD4
	ldr r0, _0805EDD8
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0805EDE8
	ldr r0, _0805EDDC
	lsls r1, r3, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x38
	bhi _0805EDE4
	ldr r0, _0805EDE0
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0805EDE8
	.align 2, 0
_0805EDD0: .4byte 0x02023D0C
_0805EDD4: .4byte 0x082FACB4
_0805EDD8: .4byte 0x02023D08
_0805EDDC: .4byte 0x02022D08
_0805EDE0: .4byte 0x082ED050
_0805EDE4:
	bl OpponentBufferExecCompleted
_0805EDE8:
	pop {r0}
	bx r0
	thumb_func_end OpponentBufferRunCommand

	thumb_func_start OpponentHandleIntroSlide
OpponentHandleIntroSlide: @ 0x0805EDEC
	push {lr}
	ldr r2, _0805EE14
	ldr r1, _0805EE18
	ldr r0, _0805EE1C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0805EE20
	cmp r1, r0
	bne _0805EE10
	bl OpponentBufferExecCompleted
_0805EE10:
	pop {r0}
	bx r0
	.align 2, 0
_0805EE14: .4byte 0x020205AC
_0805EE18: .4byte 0x02023E88
_0805EE1C: .4byte 0x02023D08
_0805EE20: .4byte 0x08007141
	thumb_func_end OpponentHandleIntroSlide

	thumb_func_start OpponentHandleChooseItem
OpponentHandleChooseItem: @ 0x0805EE24
	push {lr}
	ldr r2, _0805EE4C
	ldr r1, _0805EE50
	ldr r0, _0805EE54
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0805EE58
	cmp r1, r0
	bne _0805EE48
	bl OpponentBufferExecCompleted
_0805EE48:
	pop {r0}
	bx r0
	.align 2, 0
_0805EE4C: .4byte 0x020205AC
_0805EE50: .4byte 0x02023E88
_0805EE54: .4byte 0x02023D08
_0805EE58: .4byte 0x08007141
	thumb_func_end OpponentHandleChooseItem

	thumb_func_start sub_0805EE5C
sub_0805EE5C: @ 0x0805EE5C
	push {r4, r5, r6, lr}
	ldr r5, _0805EEB4
	ldr r6, _0805EEB8
	ldr r4, _0805EEBC
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r2, r0, #2
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0805EEC0
	cmp r1, r0
	bne _0805EEAE
	adds r0, r2, r5
	ldrh r0, [r0, #6]
	bl FreeTrainerFrontPicPalette
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl FreeSpriteOamMatrix
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	bl OpponentBufferExecCompleted
_0805EEAE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805EEB4: .4byte 0x020205AC
_0805EEB8: .4byte 0x02023E88
_0805EEBC: .4byte 0x02023D08
_0805EEC0: .4byte 0x08007141
	thumb_func_end sub_0805EE5C

	thumb_func_start sub_0805EEC4
sub_0805EEC4: @ 0x0805EEC4
	push {r4, lr}
	ldr r4, _0805EF04
	ldr r1, [r4]
	ldr r3, _0805EF08
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
	bne _0805EEFC
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #9]
	bl OpponentBufferExecCompleted
_0805EEFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EF04: .4byte 0x02024174
_0805EF08: .4byte 0x02023D08
	thumb_func_end sub_0805EEC4

	thumb_func_start sub_0805EF0C
sub_0805EF0C: @ 0x0805EF0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sb, r0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805EF48
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805EF3A
	ldr r0, _0805EF70
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0805EF48
_0805EF3A:
	ldr r0, _0805EF70
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0805EF84
_0805EF48:
	ldr r2, _0805EF74
	ldr r1, _0805EF78
	ldr r3, _0805EF7C
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0805EF80
	mov sl, r3
	cmp r1, r0
	bne _0805EF6C
	movs r1, #1
	mov sb, r1
_0805EF6C:
	movs r6, #0
	b _0805EFC0
	.align 2, 0
_0805EF70: .4byte 0x02022C90
_0805EF74: .4byte 0x020205AC
_0805EF78: .4byte 0x03005AD0
_0805EF7C: .4byte 0x02023D08
_0805EF80: .4byte 0x08007141
_0805EF84:
	ldr r3, _0805F090
	ldr r6, _0805F094
	ldr r2, _0805F098
	ldrb r4, [r2]
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, #0x1c
	adds r0, r0, r3
	ldr r5, [r0]
	ldr r0, _0805F09C
	mov sl, r2
	cmp r5, r0
	bne _0805EFBE
	movs r0, #2
	eors r4, r0
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, r5
	bne _0805EFBE
	movs r0, #1
	mov sb, r0
_0805EFBE:
	movs r6, #1
_0805EFC0:
	ldr r3, _0805F0A0
	ldr r1, _0805F0A4
	mov r8, r1
	ldr r2, [r1]
	mov r7, sl
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, [r2, #4]
	adds r0, r5, r0
	str r0, [r3]
	ldr r2, _0805F0A8
	ldrb r0, [r7]
	movs r1, #2
	mov ip, r1
	mov r1, ip
	eors r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [r2]
	mov r0, sb
	cmp r0, #0
	bne _0805EFF6
	b _0805F12A
_0805EFF6:
	cmp r6, #1
	bne _0805F0B0
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r5
	ldrb r1, [r4, #1]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0805F010
	b _0805F12A
_0805F010:
	mov r0, ip
	eors r0, r2
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #1]
	ands r6, r0
	cmp r6, #0
	bne _0805F026
	b _0805F12A
_0805F026:
	ldrb r1, [r4]
	movs r3, #0x7f
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	ldr r0, [r1]
	ldrb r2, [r7]
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
	mov r0, r8
	ldr r2, [r0]
	ldrb r0, [r7]
	mov r1, ip
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	mov r1, r8
	ldr r2, [r1]
	ldrb r0, [r7]
	mov r1, ip
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	ands r4, r1
	strb r4, [r0, #1]
	ldr r4, _0805F0AC
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	b _0805F108
	.align 2, 0
_0805F090: .4byte 0x020205AC
_0805F094: .4byte 0x03005AD0
_0805F098: .4byte 0x02023D08
_0805F09C: .4byte 0x08007141
_0805F0A0: .4byte 0x0202417C
_0805F0A4: .4byte 0x02024174
_0805F0A8: .4byte 0x02024180
_0805F0AC: .4byte 0x000027F9
_0805F0B0:
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r5
	ldrb r1, [r2, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805F12A
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	mov r1, r8
	ldr r0, [r1]
	mov r1, sl
	ldrb r2, [r1]
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
	mov r1, sl
	ldrb r0, [r1]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0805F108
	ldr r4, _0805F138
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
_0805F108:
	ldr r0, _0805F13C
	ldr r0, [r0]
	ldr r3, _0805F140
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #9]
	ldr r1, _0805F144
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805F148
	str r1, [r0]
_0805F12A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F138: .4byte 0x000027F9
_0805F13C: .4byte 0x02024174
_0805F140: .4byte 0x02023D08
_0805F144: .4byte 0x03005AC0
_0805F148: .4byte 0x0805EEC5
	thumb_func_end sub_0805EF0C

	thumb_func_start sub_0805F14C
sub_0805F14C: @ 0x0805F14C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	mov sl, r0
	ldr r5, _0805F334
	ldr r0, [r5]
	ldr r4, _0805F338
	ldrb r2, [r4]
	ldr r1, [r0, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r6, #0xc4
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0805F192
	ldr r0, _0805F33C
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0805F340
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_0805F192:
	ldr r0, _0805F344
	ldr r0, [r0]
	ldr r1, _0805F348
	ands r0, r1
	cmp r0, #0
	bne _0805F1DA
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F1DA
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
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0805F1DA
	ldr r0, _0805F33C
	adds r0, r2, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0805F340
	adds r1, r1, r0
	adds r0, r3, #0
	bl sub_08172CD4
_0805F1DA:
	ldr r2, _0805F334
	ldr r0, [r2]
	ldr r1, _0805F338
	mov r8, r1
	ldrb r4, [r1]
	ldr r5, [r0, #4]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r3, r0, r5
	ldrb r1, [r3]
	movs r6, #8
	adds r0, r6, #0
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	bne _0805F2BC
	movs r7, #2
	adds r1, r7, #0
	eors r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0805F2BC
	ldrb r1, [r3, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0805F2A0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F270
	ldr r0, _0805F344
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0805F270
	ldr r4, _0805F34C
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r7, #0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0805F33C
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0805F340
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	mov r1, r8
	ldrb r0, [r1]
	eors r0, r7
	bl sub_08076320
	mov r1, r8
	ldrb r0, [r1]
	eors r0, r7
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_0805F270:
	ldr r5, _0805F34C
	ldr r4, _0805F338
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0805F33C
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0805F340
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_08076320
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_0805F2A0:
	ldr r3, _0805F334
	ldr r2, [r3]
	ldr r0, _0805F338
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0, #1]
	mov sb, r3
_0805F2BC:
	mov r1, sb
	ldr r0, [r1]
	ldr r4, _0805F338
	ldrb r2, [r4]
	ldr r3, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #1]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0805F37E
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
	bne _0805F37E
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805F37E
	mov r1, sb
	ldr r0, [r1]
	ldrb r4, [r4]
	ldr r1, [r0, #4]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0805F360
	ldr r0, _0805F344
	ldr r0, [r0]
	movs r1, #0x42
	ands r0, r1
	cmp r0, #0x42
	bne _0805F354
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805F360
	ldr r0, _0805F350
	bl m4aMPlayContinue
	b _0805F360
	.align 2, 0
_0805F334: .4byte 0x02024174
_0805F338: .4byte 0x02023D08
_0805F33C: .4byte 0x02023D12
_0805F340: .4byte 0x020243E8
_0805F344: .4byte 0x02022C90
_0805F348: .4byte 0x00008040
_0805F34C: .4byte 0x03005AD0
_0805F350: .4byte 0x030074D0
_0805F354:
	ldr r0, _0805F3D8
	ldr r1, _0805F3DC
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
_0805F360:
	ldr r0, _0805F3E0
	ldr r2, [r0]
	ldr r0, _0805F3E4
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
	str r0, [sp]
_0805F37E:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F39E
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F3FC
	ldr r0, _0805F3E8
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805F3FC
_0805F39E:
	ldr r2, _0805F3EC
	ldr r0, _0805F3F0
	ldr r1, _0805F3E4
	ldrb r4, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r3, [r0]
	ldr r0, _0805F3F4
	cmp r3, r0
	bne _0805F45A
	ldr r0, _0805F3F8
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r3
	bne _0805F45A
	movs r1, #1
	mov sl, r1
	b _0805F45A
	.align 2, 0
_0805F3D8: .4byte 0x030074D0
_0805F3DC: .4byte 0x0000FFFF
_0805F3E0: .4byte 0x02024174
_0805F3E4: .4byte 0x02023D08
_0805F3E8: .4byte 0x02022C90
_0805F3EC: .4byte 0x020205AC
_0805F3F0: .4byte 0x03005ADC
_0805F3F4: .4byte 0x08007141
_0805F3F8: .4byte 0x02023E88
_0805F3FC:
	ldr r2, _0805F554
	ldr r7, _0805F558
	ldr r0, _0805F55C
	ldrb r3, [r0]
	adds r0, r3, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r4, [r0]
	ldr r0, _0805F560
	cmp r4, r0
	bne _0805F45A
	ldr r6, _0805F564
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	cmp r5, r4
	bne _0805F45A
	movs r0, #2
	eors r3, r0
	adds r0, r3, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	cmp r4, r5
	bne _0805F45A
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _0805F45A
	movs r0, #1
	mov sl, r0
_0805F45A:
	ldr r1, [sp]
	cmp r1, #0
	beq _0805F544
	mov r0, sl
	cmp r0, #0
	beq _0805F544
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F4BE
	ldr r0, _0805F568
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0805F4BE
	ldr r1, _0805F558
	ldr r5, _0805F55C
	ldrb r0, [r5]
	movs r4, #2
	eors r0, r4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0805F554
	adds r0, r0, r1
	bl DestroySprite
	ldrb r0, [r5]
	eors r4, r0
	ldr r1, _0805F56C
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805F570
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
_0805F4BE:
	ldr r1, _0805F558
	ldr r4, _0805F55C
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0805F554
	adds r0, r0, r1
	bl DestroySprite
	ldrb r5, [r4]
	ldr r1, _0805F56C
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805F570
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	bl SetBattlerShadowSpriteCallback
	ldr r3, _0805F574
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
	ldr r1, _0805F578
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805F57C
	str r1, [r0]
_0805F544:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F554: .4byte 0x020205AC
_0805F558: .4byte 0x03005ADC
_0805F55C: .4byte 0x02023D08
_0805F560: .4byte 0x08007141
_0805F564: .4byte 0x02023E88
_0805F568: .4byte 0x02022C90
_0805F56C: .4byte 0x02023D12
_0805F570: .4byte 0x020243E8
_0805F574: .4byte 0x02024174
_0805F578: .4byte 0x03005AC0
_0805F57C: .4byte 0x0805EF0D
	thumb_func_end sub_0805F14C

	thumb_func_start sub_0805F580
sub_0805F580: @ 0x0805F580
	push {r4, r5, lr}
	ldr r2, _0805F63C
	ldr r0, _0805F640
	ldr r1, _0805F644
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x24
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805F5CC
	ldr r0, _0805F648
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r2, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805F5CC
	ldr r0, _0805F64C
	adds r0, r2, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0805F650
	adds r1, r1, r0
	adds r0, r3, #0
	bl sub_08172CD4
_0805F5CC:
	ldr r2, _0805F63C
	ldr r0, _0805F640
	ldr r5, _0805F644
	ldrb r3, [r5]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0805F654
	cmp r1, r0
	bne _0805F634
	ldr r4, _0805F648
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r1, [r2, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805F634
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4]
	ldrb r2, [r5]
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
	ldr r4, _0805F658
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	bl OpponentBufferExecCompleted
_0805F634:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F63C: .4byte 0x020205AC
_0805F640: .4byte 0x02023E88
_0805F644: .4byte 0x02023D08
_0805F648: .4byte 0x02024174
_0805F64C: .4byte 0x02023D12
_0805F650: .4byte 0x020243E8
_0805F654: .4byte 0x08007141
_0805F658: .4byte 0x000027F9
	thumb_func_end sub_0805F580

	thumb_func_start sub_0805F65C
sub_0805F65C: @ 0x0805F65C
	push {r4, r5, r6, lr}
	ldr r6, _0805F69C
	ldrb r0, [r6]
	ldr r5, _0805F6A0
	adds r1, r0, r5
	ldrb r1, [r1]
	movs r2, #0
	movs r3, #0
	bl MoveBattleBar
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0805F6A4
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r2, #0
	bl sub_080726F4
	b _0805F6A8
	.align 2, 0
_0805F69C: .4byte 0x02023D08
_0805F6A0: .4byte 0x03005AD0
_0805F6A4:
	bl OpponentBufferExecCompleted
_0805F6A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0805F65C

	thumb_func_start OpponentHandleCmd38
OpponentHandleCmd38: @ 0x0805F6B0
	push {lr}
	ldr r2, _0805F6E4
	ldr r0, _0805F6E8
	ldr r1, _0805F6EC
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0805F6DE
	ldr r0, _0805F6F0
	adds r0, r3, r0
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl OpponentBufferExecCompleted
_0805F6DE:
	pop {r0}
	bx r0
	.align 2, 0
_0805F6E4: .4byte 0x020205AC
_0805F6E8: .4byte 0x02023E88
_0805F6EC: .4byte 0x02023D08
_0805F6F0: .4byte 0x03005AD0
	thumb_func_end OpponentHandleCmd38

	thumb_func_start sub_0805F6F4
sub_0805F6F4: @ 0x0805F6F4
	push {r4, r5, r6, lr}
	ldr r0, _0805F754
	ldr r0, [r0]
	ldr r6, _0805F758
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
	bne _0805F74E
	ldr r5, _0805F75C
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0805F760
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
	ldrb r0, [r6]
	bl HideBattlerShadowSprite
	ldr r1, _0805F764
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl OpponentBufferExecCompleted
_0805F74E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F754: .4byte 0x02024174
_0805F758: .4byte 0x02023D08
_0805F75C: .4byte 0x02023E88
_0805F760: .4byte 0x020205AC
_0805F764: .4byte 0x03005AD0
	thumb_func_end sub_0805F6F4

	thumb_func_start OpponentHandleBallThrow
OpponentHandleBallThrow: @ 0x0805F768
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805F77A
	bl OpponentBufferExecCompleted
_0805F77A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleBallThrow

	thumb_func_start OpponentHandleHitAnimation
OpponentHandleHitAnimation: @ 0x0805F780
	push {r4, lr}
	ldr r1, _0805F7BC
	ldr r0, _0805F7C0
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _0805F7C4
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _0805F7CC
	movs r3, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0805F7C8
	strb r3, [r0]
	bl OpponentBufferExecCompleted
	b _0805F7F6
	.align 2, 0
_0805F7BC: .4byte 0x02023E88
_0805F7C0: .4byte 0x02023D08
_0805F7C4: .4byte 0x020205AC
_0805F7C8: .4byte 0x0202415D
_0805F7CC:
	ldrh r0, [r4, #0x30]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0805F7F0
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
_0805F7F0:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_0805F7F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleHitAnimation

	thumb_func_start sub_0805F7FC
sub_0805F7FC: @ 0x0805F7FC
	push {r4, lr}
	ldr r2, _0805F850
	ldr r0, _0805F854
	ldr r4, _0805F858
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0805F85C
	cmp r1, r0
	bne _0805F848
	ldr r0, _0805F860
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0805F83C
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
_0805F83C:
	ldr r0, _0805F864
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0805F868
	str r0, [r1]
_0805F848:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F850: .4byte 0x020205AC
_0805F854: .4byte 0x03005AD0
_0805F858: .4byte 0x02023D08
_0805F85C: .4byte 0x08007141
_0805F860: .4byte 0x02024174
_0805F864: .4byte 0x03005AC0
_0805F868: .4byte 0x0805F86D
	thumb_func_end sub_0805F7FC

	thumb_func_start sub_0805F86C
sub_0805F86C: @ 0x0805F86C
	push {r4, lr}
	ldr r0, _0805F8CC
	ldr r0, [r0]
	ldr r4, _0805F8D0
	ldrb r1, [r4]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0805F8C6
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805F8C6
	ldr r2, _0805F8D4
	ldr r1, _0805F8D8
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0805F8DC
	cmp r1, r0
	beq _0805F8B6
	ldr r0, _0805F8E0
	cmp r1, r0
	bne _0805F8C6
_0805F8B6:
	ldr r0, _0805F8E4
	ldr r1, _0805F8E8
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	bl OpponentBufferExecCompleted
_0805F8C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F8CC: .4byte 0x02024174
_0805F8D0: .4byte 0x02023D08
_0805F8D4: .4byte 0x020205AC
_0805F8D8: .4byte 0x02023E88
_0805F8DC: .4byte 0x08007141
_0805F8E0: .4byte 0x080394FD
_0805F8E4: .4byte 0x030074D0
_0805F8E8: .4byte 0x0000FFFF
	thumb_func_end sub_0805F86C

	thumb_func_start sub_0805F8EC
sub_0805F8EC: @ 0x0805F8EC
	push {r4, r5, r6, r7, lr}
	ldr r4, _0805F9B0
	ldr r0, [r4]
	ldr r5, _0805F9B4
	ldrb r2, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r1, [r3, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805F9A8
	ldr r7, _0805F9B8
	ldr r6, _0805F9BC
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805F9C0
	cmp r1, r0
	bne _0805F9A8
	ldrb r1, [r3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
	ldr r0, [r4]
	ldrb r2, [r5]
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
	ldr r4, _0805F9C4
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	movs r1, #0
	bl StartSpriteAnim
	ldr r4, _0805F9C8
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0805F9CC
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0805F9D0
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	bl sub_08076320
	ldrb r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldrb r0, [r5]
	bl CopyBattleSpriteInvisibility
	ldr r1, _0805F9D4
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805F9D8
	str r1, [r0]
_0805F9A8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F9B0: .4byte 0x02024174
_0805F9B4: .4byte 0x02023D08
_0805F9B8: .4byte 0x020205AC
_0805F9BC: .4byte 0x02023E88
_0805F9C0: .4byte 0x08007141
_0805F9C4: .4byte 0x000027F9
_0805F9C8: .4byte 0x03005AD0
_0805F9CC: .4byte 0x02023D12
_0805F9D0: .4byte 0x020243E8
_0805F9D4: .4byte 0x03005AC0
_0805F9D8: .4byte 0x0805F7FD
	thumb_func_end sub_0805F8EC

	thumb_func_start sub_0805F9DC
sub_0805F9DC: @ 0x0805F9DC
	push {r4, r5, r6, lr}
	ldr r6, _0805FA80
	ldr r0, [r6]
	ldr r5, _0805FA84
	ldrb r2, [r5]
	ldr r1, [r0, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	bne _0805FA0E
	ldr r0, _0805FA88
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0805FA8C
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_0805FA0E:
	ldr r4, _0805FA90
	ldr r0, _0805FA94
	ldrb r2, [r5]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r3, r0, #2
	adds r0, r4, #0
	adds r0, #0x1c
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _0805FA98
	cmp r1, r0
	bne _0805FA78
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
	bne _0805FA78
	adds r0, r3, r4
	bl DestroySprite
	ldrb r4, [r5]
	ldr r1, _0805FA88
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805FA8C
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
	ldr r1, _0805FA9C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805FAA0
	str r1, [r0]
_0805FA78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA80: .4byte 0x02024174
_0805FA84: .4byte 0x02023D08
_0805FA88: .4byte 0x02023D12
_0805FA8C: .4byte 0x020243E8
_0805FA90: .4byte 0x020205AC
_0805FA94: .4byte 0x03005ADC
_0805FA98: .4byte 0x08007141
_0805FA9C: .4byte 0x03005AC0
_0805FAA0: .4byte 0x0805F8ED
	thumb_func_end sub_0805F9DC

	thumb_func_start OpponentHandleCmd37
OpponentHandleCmd37: @ 0x0805FAA4
	push {lr}
	ldr r0, _0805FACC
	ldr r2, [r0]
	ldr r0, _0805FAD0
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
	bne _0805FAC6
	bl OpponentBufferExecCompleted
_0805FAC6:
	pop {r0}
	bx r0
	.align 2, 0
_0805FACC: .4byte 0x02024174
_0805FAD0: .4byte 0x02023D08
	thumb_func_end OpponentHandleCmd37

	thumb_func_start OpponentHandleCmd39
OpponentHandleCmd39: @ 0x0805FAD4
	push {lr}
	ldr r0, _0805FAFC
	ldr r2, [r0]
	ldr r0, _0805FB00
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
	bne _0805FAF6
	bl OpponentBufferExecCompleted
_0805FAF6:
	pop {r0}
	bx r0
	.align 2, 0
_0805FAFC: .4byte 0x02024174
_0805FB00: .4byte 0x02023D08
	thumb_func_end OpponentHandleCmd39

	thumb_func_start OpponentBufferExecCompleted
OpponentBufferExecCompleted: @ 0x0805FB04
	push {r4, lr}
	sub sp, #4
	ldr r1, _0805FB44
	ldr r4, _0805FB48
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805FB4C
	str r1, [r0]
	ldr r0, _0805FB50
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0805FB58
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, #2
	movs r1, #4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _0805FB54
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r1
	movs r1, #0x38
	strb r1, [r0]
	b _0805FB6A
	.align 2, 0
_0805FB44: .4byte 0x03005AC0
_0805FB48: .4byte 0x02023D08
_0805FB4C: .4byte 0x0805ED9D
_0805FB50: .4byte 0x02022C90
_0805FB54: .4byte 0x02022D08
_0805FB58:
	ldr r2, _0805FB74
	ldr r1, _0805FB78
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0805FB6A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FB74: .4byte 0x02023D0C
_0805FB78: .4byte 0x082FACB4
	thumb_func_end OpponentBufferExecCompleted

	thumb_func_start OpponentHandleGetMonData
OpponentHandleGetMonData: @ 0x0805FB7C
	push {r4, r5, r6, lr}
	sub sp, #0x100
	movs r6, #0
	ldr r1, _0805FBA8
	ldr r0, _0805FBAC
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805FBB4
	ldr r0, _0805FBB0
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl GetOpponentMonData
	adds r6, r0, #0
	b _0805FBD6
	.align 2, 0
_0805FBA8: .4byte 0x02022D08
_0805FBAC: .4byte 0x02023D08
_0805FBB0: .4byte 0x02023D12
_0805FBB4:
	ldrb r4, [r1]
	movs r5, #0
_0805FBB8:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0805FBCE
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	adds r1, r2, r6
	bl GetOpponentMonData
	adds r6, r6, r0
_0805FBCE:
	lsrs r4, r4, #1
	adds r5, #1
	cmp r5, #5
	ble _0805FBB8
_0805FBD6:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl OpponentBufferExecCompleted
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleGetMonData

	thumb_func_start GetOpponentMonData
GetOpponentMonData: @ 0x0805FBF0
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
	ldr r2, _0805FC24
	ldr r3, _0805FC28
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _0805FC1A
	bl _08060386
_0805FC1A:
	lsls r0, r0, #2
	ldr r1, _0805FC2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805FC24: .4byte 0x02022D08
_0805FC28: .4byte 0x02023D08
_0805FC2C: .4byte 0x0805FC30
_0805FC30: @ jump table
	.4byte _0805FD20 @ case 0
	.4byte _0805FF44 @ case 1
	.4byte _0805FF54 @ case 2
	.4byte _0805FF64 @ case 3
	.4byte _0805FFCC @ case 4
	.4byte _0805FFCC @ case 5
	.4byte _0805FFCC @ case 6
	.4byte _0805FFCC @ case 7
	.4byte _0805FFE8 @ case 8
	.4byte _08060024 @ case 9
	.4byte _08060024 @ case 10
	.4byte _08060024 @ case 11
	.4byte _08060024 @ case 12
	.4byte _08060386 @ case 13
	.4byte _08060386 @ case 14
	.4byte _08060386 @ case 15
	.4byte _08060386 @ case 16
	.4byte _08060040 @ case 17
	.4byte _08060050 @ case 18
	.4byte _08060080 @ case 19
	.4byte _08060090 @ case 20
	.4byte _080600A0 @ case 21
	.4byte _080600B0 @ case 22
	.4byte _080600C0 @ case 23
	.4byte _080600D0 @ case 24
	.4byte _080600E0 @ case 25
	.4byte _080600F0 @ case 26
	.4byte _08060100 @ case 27
	.4byte _08060110 @ case 28
	.4byte _08060120 @ case 29
	.4byte _08060130 @ case 30
	.4byte _08060140 @ case 31
	.4byte _08060190 @ case 32
	.4byte _080601A0 @ case 33
	.4byte _080601B0 @ case 34
	.4byte _080601C0 @ case 35
	.4byte _080601D0 @ case 36
	.4byte _080601E0 @ case 37
	.4byte _080601F0 @ case 38
	.4byte _08060200 @ case 39
	.4byte _08060210 @ case 40
	.4byte _08060244 @ case 41
	.4byte _08060254 @ case 42
	.4byte _08060264 @ case 43
	.4byte _08060274 @ case 44
	.4byte _08060284 @ case 45
	.4byte _08060294 @ case 46
	.4byte _080602A4 @ case 47
	.4byte _080602B4 @ case 48
	.4byte _080602D4 @ case 49
	.4byte _080602E4 @ case 50
	.4byte _080602F4 @ case 51
	.4byte _08060304 @ case 52
	.4byte _08060314 @ case 53
	.4byte _08060324 @ case 54
	.4byte _08060334 @ case 55
	.4byte _08060344 @ case 56
	.4byte _08060354 @ case 57
	.4byte _08060364 @ case 58
	.4byte _08060374 @ case 59
_0805FD20:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0805FF34
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
_0805FD6C:
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
	ble _0805FD6C
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0805FF34
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
	ldr r1, _0805FF38
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
	ldr r2, _0805FF3C
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
	ldr r1, _0805FF40
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
_0805FF24:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x57
	bls _0805FF24
	b _08060386
	.align 2, 0
_0805FF34: .4byte 0x020243E8
_0805FF38: .4byte 0xFFFFFC1F
_0805FF3C: .4byte 0xFFF07FFF
_0805FF40: .4byte 0xFFFFFE0F
_0805FF44:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805FF50
	adds r0, r0, r1
	movs r1, #0xb
	b _080602BE
	.align 2, 0
_0805FF50: .4byte 0x020243E8
_0805FF54:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805FF60
	adds r0, r0, r1
	movs r1, #0xc
	b _080602BE
	.align 2, 0
_0805FF60: .4byte 0x020243E8
_0805FF64:
	movs r6, #0
	add r2, sp, #0x58
	mov sb, r2
	add r0, sp, #0x60
	mov sl, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0805FFC8
	adds r4, r1, r0
	mov r8, sb
_0805FF7A:
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
	ble _0805FF7A
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805FFC8
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	mov r1, sb
	strb r0, [r1, #0xc]
	mov r2, sb
	movs r6, #0
_0805FFB8:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0xf
	bls _0805FFB8
	b _08060386
	.align 2, 0
_0805FFC8: .4byte 0x020243E8
_0805FFCC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805FFE4
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #9
	b _080602BE
	.align 2, 0
_0805FFE4: .4byte 0x020243E8
_0805FFE8:
	movs r6, #0
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r2, _08060020
	mov r8, r2
_0805FFF4:
	adds r1, r6, #0
	adds r1, #0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	cmp r6, #3
	ble _0805FFF4
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060020
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	b _08060386
	.align 2, 0
_08060020: .4byte 0x020243E8
_08060024:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806003C
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #8
	b _0806037E
	.align 2, 0
_0806003C: .4byte 0x020243E8
_08060040:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806004C
	adds r0, r0, r1
	movs r1, #1
	b _0806005A
	.align 2, 0
_0806004C: .4byte 0x020243E8
_08060050:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806007C
	adds r0, r0, r1
	movs r1, #0x19
_0806005A:
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
	b _08060386
	.align 2, 0
_0806007C: .4byte 0x020243E8
_08060080:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806008C
	adds r0, r0, r1
	movs r1, #0x1a
	b _0806037E
	.align 2, 0
_0806008C: .4byte 0x020243E8
_08060090:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806009C
	adds r0, r0, r1
	movs r1, #0x1b
	b _0806037E
	.align 2, 0
_0806009C: .4byte 0x020243E8
_080600A0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080600AC
	adds r0, r0, r1
	movs r1, #0x1c
	b _0806037E
	.align 2, 0
_080600AC: .4byte 0x020243E8
_080600B0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080600BC
	adds r0, r0, r1
	movs r1, #0x1d
	b _0806037E
	.align 2, 0
_080600BC: .4byte 0x020243E8
_080600C0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080600CC
	adds r0, r0, r1
	movs r1, #0x1e
	b _0806037E
	.align 2, 0
_080600CC: .4byte 0x020243E8
_080600D0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080600DC
	adds r0, r0, r1
	movs r1, #0x1f
	b _0806037E
	.align 2, 0
_080600DC: .4byte 0x020243E8
_080600E0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080600EC
	adds r0, r0, r1
	movs r1, #0x20
	b _0806037E
	.align 2, 0
_080600EC: .4byte 0x020243E8
_080600F0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080600FC
	adds r0, r0, r1
	movs r1, #0x22
	b _0806037E
	.align 2, 0
_080600FC: .4byte 0x020243E8
_08060100:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806010C
	adds r0, r0, r1
	movs r1, #0x23
	b _0806037E
	.align 2, 0
_0806010C: .4byte 0x020243E8
_08060110:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806011C
	adds r0, r0, r1
	movs r1, #0x24
	b _0806037E
	.align 2, 0
_0806011C: .4byte 0x020243E8
_08060120:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806012C
	adds r0, r0, r1
	movs r1, #0x25
	b _0806037E
	.align 2, 0
_0806012C: .4byte 0x020243E8
_08060130:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806013C
	adds r0, r0, r1
	movs r1, #0x26
	b _0806037E
	.align 2, 0
_0806013C: .4byte 0x020243E8
_08060140:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0806018C
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
	b _08060386
	.align 2, 0
_0806018C: .4byte 0x020243E8
_08060190:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806019C
	adds r0, r0, r1
	movs r1, #0x27
	b _0806037E
	.align 2, 0
_0806019C: .4byte 0x020243E8
_080601A0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080601AC
	adds r0, r0, r1
	movs r1, #0x28
	b _0806037E
	.align 2, 0
_080601AC: .4byte 0x020243E8
_080601B0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080601BC
	adds r0, r0, r1
	movs r1, #0x29
	b _0806037E
	.align 2, 0
_080601BC: .4byte 0x020243E8
_080601C0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080601CC
	adds r0, r0, r1
	movs r1, #0x2a
	b _0806037E
	.align 2, 0
_080601CC: .4byte 0x020243E8
_080601D0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080601DC
	adds r0, r0, r1
	movs r1, #0x2b
	b _0806037E
	.align 2, 0
_080601DC: .4byte 0x020243E8
_080601E0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080601EC
	adds r0, r0, r1
	movs r1, #0x2c
	b _0806037E
	.align 2, 0
_080601EC: .4byte 0x020243E8
_080601F0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080601FC
	adds r0, r0, r1
	movs r1, #0
	b _0806021A
	.align 2, 0
_080601FC: .4byte 0x020243E8
_08060200:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806020C
	adds r0, r0, r1
	movs r1, #9
	b _080602BE
	.align 2, 0
_0806020C: .4byte 0x020243E8
_08060210:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060240
	adds r0, r0, r1
	movs r1, #0x37
_0806021A:
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
	b _08060386
	.align 2, 0
_08060240: .4byte 0x020243E8
_08060244:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060250
	adds r0, r0, r1
	movs r1, #0x38
	b _0806037E
	.align 2, 0
_08060250: .4byte 0x020243E8
_08060254:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060260
	adds r0, r0, r1
	movs r1, #0x39
	b _080602BE
	.align 2, 0
_08060260: .4byte 0x020243E8
_08060264:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060270
	adds r0, r0, r1
	movs r1, #0x3a
	b _080602BE
	.align 2, 0
_08060270: .4byte 0x020243E8
_08060274:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060280
	adds r0, r0, r1
	movs r1, #0x3b
	b _080602BE
	.align 2, 0
_08060280: .4byte 0x020243E8
_08060284:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060290
	adds r0, r0, r1
	movs r1, #0x3c
	b _080602BE
	.align 2, 0
_08060290: .4byte 0x020243E8
_08060294:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080602A0
	adds r0, r0, r1
	movs r1, #0x3d
	b _080602BE
	.align 2, 0
_080602A0: .4byte 0x020243E8
_080602A4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080602B0
	adds r0, r0, r1
	movs r1, #0x3e
	b _080602BE
	.align 2, 0
_080602B0: .4byte 0x020243E8
_080602B4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080602D0
	adds r0, r0, r1
	movs r1, #0x3f
_080602BE:
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strb r0, [r7]
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r6, #2
	b _08060386
	.align 2, 0
_080602D0: .4byte 0x020243E8
_080602D4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080602E0
	adds r0, r0, r1
	movs r1, #0x16
	b _0806037E
	.align 2, 0
_080602E0: .4byte 0x020243E8
_080602E4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080602F0
	adds r0, r0, r1
	movs r1, #0x17
	b _0806037E
	.align 2, 0
_080602F0: .4byte 0x020243E8
_080602F4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060300
	adds r0, r0, r1
	movs r1, #0x18
	b _0806037E
	.align 2, 0
_08060300: .4byte 0x020243E8
_08060304:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060310
	adds r0, r0, r1
	movs r1, #0x21
	b _0806037E
	.align 2, 0
_08060310: .4byte 0x020243E8
_08060314:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060320
	adds r0, r0, r1
	movs r1, #0x2f
	b _0806037E
	.align 2, 0
_08060320: .4byte 0x020243E8
_08060324:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060330
	adds r0, r0, r1
	movs r1, #0x30
	b _0806037E
	.align 2, 0
_08060330: .4byte 0x020243E8
_08060334:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060340
	adds r0, r0, r1
	movs r1, #0x32
	b _0806037E
	.align 2, 0
_08060340: .4byte 0x020243E8
_08060344:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060350
	adds r0, r0, r1
	movs r1, #0x33
	b _0806037E
	.align 2, 0
_08060350: .4byte 0x020243E8
_08060354:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060360
	adds r0, r0, r1
	movs r1, #0x34
	b _0806037E
	.align 2, 0
_08060360: .4byte 0x020243E8
_08060364:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060370
	adds r0, r0, r1
	movs r1, #0x35
	b _0806037E
	.align 2, 0
_08060370: .4byte 0x020243E8
_08060374:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060398
	adds r0, r0, r1
	movs r1, #0x36
_0806037E:
	bl GetMonData
	strb r0, [r7]
	movs r6, #1
_08060386:
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
_08060398: .4byte 0x020243E8
	thumb_func_end GetOpponentMonData

	thumb_func_start OpponentHandleGetRawMonData
OpponentHandleGetRawMonData: @ 0x0806039C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x58
	ldr r2, _08060414
	ldr r5, _08060418
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	adds r4, r2, #0
	muls r4, r0, r4
	ldr r3, _0806041C
	lsls r1, r1, #9
	adds r0, r3, #1
	adds r0, r1, r0
	ldrb r2, [r0]
	ldr r0, _08060420
	adds r0, r2, r0
	adds r6, r4, r0
	mov r0, sp
	adds r4, r0, r2
	movs r2, #0
	adds r0, r3, #2
	adds r1, r1, r0
	adds r7, r5, #0
	mov ip, r3
	ldrb r1, [r1]
	cmp r2, r1
	bhs _080603F2
	adds r3, r0, #0
_080603D8:
	adds r1, r4, r2
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrb r0, [r5]
	lsls r0, r0, #9
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r2, r0
	blo _080603D8
_080603F2:
	ldrb r0, [r7]
	lsls r0, r0, #9
	mov r1, ip
	adds r1, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	adds r2, r4, #0
	bl BtlController_EmitDataTransfer
	bl OpponentBufferExecCompleted
	add sp, #0x58
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060414: .4byte 0x02023D12
_08060418: .4byte 0x02023D08
_0806041C: .4byte 0x02022D08
_08060420: .4byte 0x020243E8
	thumb_func_end OpponentHandleGetRawMonData

	thumb_func_start OpponentHandleSetMonData
OpponentHandleSetMonData: @ 0x08060424
	push {r4, r5, lr}
	ldr r1, _08060448
	ldr r0, _0806044C
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08060454
	ldr r0, _08060450
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl SetOpponentMonData
	b _08060472
	.align 2, 0
_08060448: .4byte 0x02022D08
_0806044C: .4byte 0x02023D08
_08060450: .4byte 0x02023D12
_08060454:
	ldrb r4, [r1]
	movs r5, #0
_08060458:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08060466
	adds r0, r5, #0
	bl SetOpponentMonData
_08060466:
	lsrs r4, r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08060458
_08060472:
	bl OpponentBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleSetMonData

	thumb_func_start SetOpponentMonData
SetOpponentMonData: @ 0x0806047C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, _080604B4
	ldrb r0, [r3]
	lsls r0, r0, #9
	ldr r2, _080604B8
	adds r4, r0, r2
	adds r7, r4, #0
	subs r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r6, r3, #0
	adds r3, r2, #0
	cmp r0, #0x3b
	bls _080604AA
	bl _08060D88
_080604AA:
	lsls r0, r0, #2
	ldr r1, _080604BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080604B4: .4byte 0x02023D08
_080604B8: .4byte 0x02022D0B
_080604BC: .4byte 0x080604C0
_080604C0: @ jump table
	.4byte _080605B0 @ case 0
	.4byte _08060748 @ case 1
	.4byte _08060764 @ case 2
	.4byte _08060780 @ case 3
	.4byte _080607D4 @ case 4
	.4byte _080607D4 @ case 5
	.4byte _080607D4 @ case 6
	.4byte _080607D4 @ case 7
	.4byte _080607F4 @ case 8
	.4byte _0806085C @ case 9
	.4byte _0806085C @ case 10
	.4byte _0806085C @ case 11
	.4byte _0806085C @ case 12
	.4byte _08060D88 @ case 13
	.4byte _08060D88 @ case 14
	.4byte _08060D88 @ case 15
	.4byte _08060D88 @ case 16
	.4byte _08060884 @ case 17
	.4byte _080608A0 @ case 18
	.4byte _080608BC @ case 19
	.4byte _080608D8 @ case 20
	.4byte _080608F4 @ case 21
	.4byte _08060910 @ case 22
	.4byte _0806092C @ case 23
	.4byte _08060948 @ case 24
	.4byte _08060964 @ case 25
	.4byte _08060980 @ case 26
	.4byte _0806099C @ case 27
	.4byte _080609B8 @ case 28
	.4byte _080609D4 @ case 29
	.4byte _080609F0 @ case 30
	.4byte _08060A0C @ case 31
	.4byte _08060A80 @ case 32
	.4byte _08060A9C @ case 33
	.4byte _08060AB8 @ case 34
	.4byte _08060AD4 @ case 35
	.4byte _08060AF0 @ case 36
	.4byte _08060B0C @ case 37
	.4byte _08060B28 @ case 38
	.4byte _08060B44 @ case 39
	.4byte _08060B60 @ case 40
	.4byte _08060B7C @ case 41
	.4byte _08060B98 @ case 42
	.4byte _08060BB4 @ case 43
	.4byte _08060BD0 @ case 44
	.4byte _08060BEC @ case 45
	.4byte _08060C08 @ case 46
	.4byte _08060C24 @ case 47
	.4byte _08060C40 @ case 48
	.4byte _08060C5C @ case 49
	.4byte _08060C78 @ case 50
	.4byte _08060C94 @ case 51
	.4byte _08060CB0 @ case 52
	.4byte _08060CCC @ case 53
	.4byte _08060CE8 @ case 54
	.4byte _08060D04 @ case 55
	.4byte _08060D20 @ case 56
	.4byte _08060D3C @ case 57
	.4byte _08060D58 @ case 58
	.4byte _08060D74 @ case 59
_080605B0:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08060744
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	bl SetMonData
	adds r2, r7, #0
	adds r2, #0x2e
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	movs r0, #0
	mov r8, r0
	movs r0, #0x3b
	adds r0, r0, r7
	mov sl, r0
	adds r0, r7, #0
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
	adds r0, r7, #2
	str r0, [sp, #4]
	adds r0, r7, #4
	str r0, [sp, #8]
	adds r0, r7, #6
	str r0, [sp, #0xc]
	adds r0, #2
	str r0, [sp, #0x10]
	adds r0, #2
	str r0, [sp, #0x14]
	mov sb, r4
	adds r6, r7, #0
	adds r6, #0x24
	adds r4, r7, #0
	adds r4, #0xc
_08060616:
	mov r1, r8
	adds r1, #0xd
	mov r0, sb
	adds r2, r4, #0
	bl SetMonData
	mov r1, r8
	adds r1, #0x11
	mov r0, sb
	adds r2, r6, #0
	bl SetMonData
	adds r6, #1
	adds r4, #2
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _08060616
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08060744
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
	ldrb r0, [r7, #0x14]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r7, #0x14]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r7, #0x15]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r7, #0x14]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2a
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r7, #0x16]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2b
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r7, #0x17]
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
	b _08060D88
	.align 2, 0
_08060744: .4byte 0x020243E8
_08060748:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060760
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0xb
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060760: .4byte 0x020243E8
_08060764:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806077C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0xc
	bl SetMonData
	b _08060D88
	.align 2, 0
_0806077C: .4byte 0x020243E8
_08060780:
	movs r0, #0
	mov r8, r0
	movs r0, #0xc
	adds r0, r0, r4
	mov sb, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _080607D0
	adds r7, r1, r0
	adds r6, r4, #0
	adds r6, #8
_08060798:
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
	ble _08060798
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080607D0
	adds r0, r0, r1
	movs r1, #0x15
	mov r2, sb
	bl SetMonData
	b _08060D88
	.align 2, 0
_080607D0: .4byte 0x020243E8
_080607D4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080607EC
	adds r0, r0, r1
	ldr r3, _080607F0
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #9
	b _08060872
	.align 2, 0
_080607EC: .4byte 0x020243E8
_080607F0: .4byte 0x02022D08
_080607F4:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08060858
	adds r4, r4, r0
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	adds r0, r4, #0
	movs r1, #0x11
	str r3, [sp, #0x34]
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x12
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x13
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x14
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x15
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060858: .4byte 0x020243E8
_0806085C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806087C
	adds r0, r0, r1
	ldr r3, _08060880
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #8
_08060872:
	adds r3, #3
	adds r2, r2, r3
	bl SetMonData
	b _08060D88
	.align 2, 0
_0806087C: .4byte 0x020243E8
_08060880: .4byte 0x02022D08
_08060884:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806089C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #1
	bl SetMonData
	b _08060D88
	.align 2, 0
_0806089C: .4byte 0x020243E8
_080608A0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080608B8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x19
	bl SetMonData
	b _08060D88
	.align 2, 0
_080608B8: .4byte 0x020243E8
_080608BC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080608D4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1a
	bl SetMonData
	b _08060D88
	.align 2, 0
_080608D4: .4byte 0x020243E8
_080608D8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080608F0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1b
	bl SetMonData
	b _08060D88
	.align 2, 0
_080608F0: .4byte 0x020243E8
_080608F4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806090C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1c
	bl SetMonData
	b _08060D88
	.align 2, 0
_0806090C: .4byte 0x020243E8
_08060910:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060928
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1d
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060928: .4byte 0x020243E8
_0806092C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060944
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1e
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060944: .4byte 0x020243E8
_08060948:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060960
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1f
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060960: .4byte 0x020243E8
_08060964:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806097C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x20
	bl SetMonData
	b _08060D88
	.align 2, 0
_0806097C: .4byte 0x020243E8
_08060980:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060998
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x22
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060998: .4byte 0x020243E8
_0806099C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080609B4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x23
	bl SetMonData
	b _08060D88
	.align 2, 0
_080609B4: .4byte 0x020243E8
_080609B8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080609D0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x24
	bl SetMonData
	b _08060D88
	.align 2, 0
_080609D0: .4byte 0x020243E8
_080609D4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080609EC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x25
	bl SetMonData
	b _08060D88
	.align 2, 0
_080609EC: .4byte 0x020243E8
_080609F0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060A08
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x26
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060A08: .4byte 0x020243E8
_08060A0C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08060A7C
	adds r4, r4, r0
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	adds r0, r4, #0
	movs r1, #0x27
	str r3, [sp, #0x34]
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x28
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x29
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2a
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2b
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #5
	adds r2, r2, r0
	adds r0, r4, #0
	b _08060B1A
	.align 2, 0
_08060A7C: .4byte 0x020243E8
_08060A80:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060A98
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x27
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060A98: .4byte 0x020243E8
_08060A9C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060AB4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x28
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060AB4: .4byte 0x020243E8
_08060AB8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060AD0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x29
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060AD0: .4byte 0x020243E8
_08060AD4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060AEC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x2a
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060AEC: .4byte 0x020243E8
_08060AF0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060B08
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x2b
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060B08: .4byte 0x020243E8
_08060B0C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060B24
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
_08060B1A:
	movs r1, #0x2c
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060B24: .4byte 0x020243E8
_08060B28:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060B40
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060B40: .4byte 0x020243E8
_08060B44:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060B5C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #9
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060B5C: .4byte 0x020243E8
_08060B60:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060B78
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x37
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060B78: .4byte 0x020243E8
_08060B7C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060B94
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x38
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060B94: .4byte 0x020243E8
_08060B98:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060BB0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x39
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060BB0: .4byte 0x020243E8
_08060BB4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060BCC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3a
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060BCC: .4byte 0x020243E8
_08060BD0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060BE8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3b
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060BE8: .4byte 0x020243E8
_08060BEC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060C04
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3c
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060C04: .4byte 0x020243E8
_08060C08:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060C20
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3d
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060C20: .4byte 0x020243E8
_08060C24:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060C3C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3e
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060C3C: .4byte 0x020243E8
_08060C40:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060C58
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3f
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060C58: .4byte 0x020243E8
_08060C5C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060C74
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x16
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060C74: .4byte 0x020243E8
_08060C78:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060C90
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x17
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060C90: .4byte 0x020243E8
_08060C94:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060CAC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x18
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060CAC: .4byte 0x020243E8
_08060CB0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060CC8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x21
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060CC8: .4byte 0x020243E8
_08060CCC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060CE4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x2f
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060CE4: .4byte 0x020243E8
_08060CE8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060D00
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x30
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060D00: .4byte 0x020243E8
_08060D04:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060D1C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x32
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060D1C: .4byte 0x020243E8
_08060D20:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060D38
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x33
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060D38: .4byte 0x020243E8
_08060D3C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060D54
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x34
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060D54: .4byte 0x020243E8
_08060D58:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060D70
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x35
	bl SetMonData
	b _08060D88
	.align 2, 0
_08060D70: .4byte 0x020243E8
_08060D74:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08060D98
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x36
	bl SetMonData
_08060D88:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060D98: .4byte 0x020243E8
	thumb_func_end SetOpponentMonData

	thumb_func_start OpponentHandleSetRawMonData
OpponentHandleSetRawMonData: @ 0x08060D9C
	push {r4, r5, r6, r7, lr}
	ldr r1, _08060E00
	ldr r7, _08060E04
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r4, _08060E08
	lsls r2, r2, #9
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _08060E0C
	adds r0, r0, r1
	adds r5, r3, r0
	movs r3, #0
	adds r0, r4, #2
	adds r2, r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bhs _08060DF4
	adds r6, r4, #0
	adds r2, r7, #0
	adds r4, r0, #0
_08060DD2:
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
	blo _08060DD2
_08060DF4:
	bl OpponentBufferExecCompleted
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060E00: .4byte 0x02023D12
_08060E04: .4byte 0x02023D08
_08060E08: .4byte 0x02022D08
_08060E0C: .4byte 0x020243E8
	thumb_func_end OpponentHandleSetRawMonData

	thumb_func_start OpponentHandleLoadMonSprite
OpponentHandleLoadMonSprite: @ 0x08060E10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r6, _08060F40
	ldrb r0, [r6]
	lsls r0, r0, #1
	ldr r1, _08060F44
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r7, #0x64
	muls r0, r7, r0
	ldr r2, _08060F48
	mov sl, r2
	add r0, sl
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r1, [r6]
	lsls r0, r1, #1
	ldr r2, _08060F44
	adds r0, r0, r2
	ldrh r0, [r0]
	muls r0, r7, r0
	add r0, sl
	bl BattleLoadOpponentMonSpriteGfx
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _08060F4C
	mov sb, r0
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
	mov r0, sb
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _08060F50
	ldrb r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r5, _08060F54
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _08060F58
	strh r1, [r0, #0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x2e]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x32]
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
	ldr r1, _08060F5C
	adds r2, r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldrb r4, [r6]
	lsls r0, r4, #1
	ldr r2, _08060F44
	adds r0, r0, r2
	ldrh r0, [r0]
	muls r0, r7, r0
	add r0, sl
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
	ldr r1, _08060F60
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08060F64
	str r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060F40: .4byte 0x02023D08
_08060F44: .4byte 0x02023D12
_08060F48: .4byte 0x020243E8
_08060F4C: .4byte 0x02024640
_08060F50: .4byte 0x02023E88
_08060F54: .4byte 0x020205AC
_08060F58: .4byte 0x0000FF10
_08060F5C: .4byte 0x02024188
_08060F60: .4byte 0x03005AC0
_08060F64: .4byte 0x0805F581
	thumb_func_end OpponentHandleLoadMonSprite

	thumb_func_start OpponentHandleSwitchInAnim
OpponentHandleSwitchInAnim: @ 0x08060F68
	push {r4, lr}
	ldr r4, _08060FB0
	ldrb r0, [r4]
	ldr r1, _08060FB4
	ldr r1, [r1]
	adds r0, r0, r1
	adds r0, #0x5c
	movs r1, #6
	strb r1, [r0]
	ldr r1, _08060FB8
	ldrb r0, [r4]
	lsls r2, r0, #1
	adds r2, r2, r1
	ldr r3, _08060FBC
	lsls r0, r0, #9
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r2]
	ldrb r0, [r4]
	lsls r1, r0, #9
	adds r3, #2
	adds r1, r1, r3
	ldrb r1, [r1]
	bl sub_08060FC8
	ldr r1, _08060FC0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08060FC4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060FB0: .4byte 0x02023D08
_08060FB4: .4byte 0x02024140
_08060FB8: .4byte 0x02023D12
_08060FBC: .4byte 0x02022D08
_08060FC0: .4byte 0x03005AC0
_08060FC4: .4byte 0x0805F9DD
	thumb_func_end OpponentHandleSwitchInAnim

	thumb_func_start sub_08060FC8
sub_08060FC8: @ 0x08060FC8
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
	ldr r0, _08061130
	lsls r4, r6, #1
	adds r4, r4, r0
	ldr r0, _08061134
	lsls r1, r6, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, #0x64
	mov sb, r1
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r5, _08061138
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0806113C
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _08061140
	mov sl, r1
	add sl, r6
	mov r1, sl
	strb r0, [r1]
	ldrh r0, [r4]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r5
	adds r1, r6, #0
	bl BattleLoadOpponentMonSpriteGfx
	adds r0, r6, #0
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _08061144
	mov sb, r0
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
	mov r0, sb
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _08061148
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0806114C
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
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r4]
	strh r1, [r0, #0x30]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x32]
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
	ldr r1, _08061150
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
	ldr r1, _08061154
	str r1, [r0]
	movs r0, #0
	movs r1, #0xfe
	bl DoPokeballSendOutAnimation
	mov r1, sl
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
_08061130: .4byte 0x02023D12
_08061134: .4byte 0x02022D08
_08061138: .4byte 0x020243E8
_0806113C: .4byte 0x0805D331
_08061140: .4byte 0x03005ADC
_08061144: .4byte 0x02024640
_08061148: .4byte 0x02023E88
_0806114C: .4byte 0x020205AC
_08061150: .4byte 0x02024188
_08061154: .4byte 0x08007141
	thumb_func_end sub_08060FC8

	thumb_func_start OpponentHandleReturnMonToBall
OpponentHandleReturnMonToBall: @ 0x08061158
	push {r4, r5, r6, lr}
	ldr r1, _0806118C
	ldr r6, _08061190
	ldrb r2, [r6]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _080611A0
	ldr r0, _08061194
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r3, [r0, #4]
	ldr r1, _08061198
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0806119C
	str r1, [r0]
	b _080611DC
	.align 2, 0
_0806118C: .4byte 0x02022D08
_08061190: .4byte 0x02023D08
_08061194: .4byte 0x02024174
_08061198: .4byte 0x03005AC0
_0806119C: .4byte 0x080611F1
_080611A0:
	ldr r5, _080611E4
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080611E8
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
	ldrb r0, [r6]
	bl HideBattlerShadowSprite
	ldr r1, _080611EC
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl OpponentBufferExecCompleted
_080611DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080611E4: .4byte 0x02023E88
_080611E8: .4byte 0x020205AC
_080611EC: .4byte 0x03005AD0
	thumb_func_end OpponentHandleReturnMonToBall

	thumb_func_start OpponentHandleHidePartyStatusSummary
OpponentHandleHidePartyStatusSummary: @ 0x080611F0
	push {r4, r5, r6, lr}
	ldr r6, _08061210
	ldr r4, [r6]
	ldr r5, _08061214
	ldrb r2, [r5]
	ldr r1, [r4, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _08061218
	cmp r0, #1
	beq _08061246
	b _0806126E
	.align 2, 0
_08061210: .4byte 0x02024174
_08061214: .4byte 0x02023D08
_08061218:
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08061232
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_08061232:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _0806126E
_08061246:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0806126E
	strb r0, [r3, #4]
	ldrb r2, [r5]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #2
	bl InitAndLaunchSpecialAnimation
	ldr r1, _08061274
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08061278
	str r1, [r0]
_0806126E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061274: .4byte 0x03005AC0
_08061278: .4byte 0x0805F6F5
	thumb_func_end OpponentHandleHidePartyStatusSummary

	thumb_func_start OpponentHandleDrawTrainerPic
OpponentHandleDrawTrainerPic: @ 0x0806127C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08061298
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r2
	cmp r0, #0
	beq _0806129C
	bl GetSecretBaseTrainerClass
	b _08061346
	.align 2, 0
_08061298: .4byte 0x02022C90
_0806129C:
	ldr r3, _080612AC
	ldrh r1, [r3]
	ldr r0, _080612B0
	cmp r1, r0
	bne _080612B4
	bl PrintHyphens
	b _08061346
	.align 2, 0
_080612AC: .4byte 0x0203886A
_080612B0: .4byte 0x000003FE
_080612B4:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r2
	cmp r0, #0
	beq _080612F4
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	cmp r2, #0
	beq _080612EC
	ldr r0, _080612D8
	ldrb r0, [r0]
	cmp r0, #1
	bne _080612DC
	ldrh r0, [r3]
	bl GetTrainerHillTrainerFrontSpriteId
	b _08061346
	.align 2, 0
_080612D8: .4byte 0x02023D08
_080612DC:
	ldr r0, _080612E8
	ldrh r0, [r0]
	bl GetTrainerHillTrainerFrontSpriteId
	b _08061346
	.align 2, 0
_080612E8: .4byte 0x0203886C
_080612EC:
	ldrh r0, [r3]
	bl GetTrainerHillTrainerFrontSpriteId
	b _08061346
_080612F4:
	ldr r0, _08061314
	ands r0, r2
	cmp r0, #0
	beq _08061338
	ldr r0, _08061318
	ands r2, r0
	cmp r2, #0
	beq _08061330
	ldr r0, _0806131C
	ldrb r0, [r0]
	cmp r0, #1
	bne _08061320
	ldrh r0, [r3]
	bl GetFrontierTrainerFrontSpriteId
	b _08061346
	.align 2, 0
_08061314: .4byte 0x003F0100
_08061318: .4byte 0x00808000
_0806131C: .4byte 0x02023D08
_08061320:
	ldr r0, _0806132C
	ldrh r0, [r0]
	bl GetFrontierTrainerFrontSpriteId
	b _08061346
	.align 2, 0
_0806132C: .4byte 0x0203886C
_08061330:
	ldrh r0, [r3]
	bl GetFrontierTrainerFrontSpriteId
	b _08061346
_08061338:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0806134C
	bl GetMonCountForBattleMode
_08061346:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _0806137E
_0806134C:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	cmp r2, #0
	beq _08061374
	ldr r0, _08061368
	ldrb r0, [r0]
	cmp r0, #1
	beq _08061374
	ldr r1, _0806136C
	ldr r0, _08061370
	ldrh r0, [r0]
	b _08061378
	.align 2, 0
_08061368: .4byte 0x02023D08
_0806136C: .4byte 0x082E383C
_08061370: .4byte 0x0203886C
_08061374:
	ldr r1, _080613A0
	ldrh r0, [r3]
_08061378:
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r4, [r0, #3]
_0806137E:
	ldr r0, _080613A4
	ldr r0, [r0]
	ldr r1, _080613A8
	ands r0, r1
	cmp r0, #0
	beq _080613B0
	ldr r0, _080613AC
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r1, #2
	ands r1, r0
	movs r7, #0xc8
	cmp r1, #0
	beq _080613B2
	movs r7, #0x98
	b _080613B2
	.align 2, 0
_080613A0: .4byte 0x082E383C
_080613A4: .4byte 0x02022C90
_080613A8: .4byte 0x00008040
_080613AC: .4byte 0x02023D08
_080613B0:
	movs r7, #0xb0
_080613B2:
	mov r8, r4
	ldr r5, _08061498
	ldrb r1, [r5]
	mov r0, r8
	bl DecompressTrainerFrontPic
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r6, _0806149C
	mov sb, r7
	ldr r1, _080614A0
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r4, #8
	subs r4, r4, r0
	lsls r4, r4, #0x12
	movs r0, #0xa0
	lsls r0, r0, #0xe
	adds r4, r4, r0
	asrs r4, r4, #0x10
	ldrb r0, [r5]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r6, #0
	mov r1, sb
	adds r2, r4, #0
	bl CreateSprite
	ldr r6, _080614A4
	ldrb r1, [r5]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r4, _080614A8
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _080614AC
	strh r1, [r0, #0x24]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #2
	strh r1, [r0, #0x2e]
	ldr r1, _080614B0
	mov r2, r8
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	bl IndexOfSpritePaletteTag
	ldrb r1, [r5]
	adds r1, r1, r6
	ldrb r1, [r1]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r4
	lsls r0, r0, #4
	ldrb r3, [r2, #5]
	movs r1, #0xf
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r1, r8
	strh r1, [r0, #6]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _080614B4
	str r1, [r0]
	ldr r1, _080614B8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080614BC
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061498: .4byte 0x02023D08
_0806149C: .4byte 0x02024640
_080614A0: .4byte 0x082D8D70
_080614A4: .4byte 0x02023E88
_080614A8: .4byte 0x020205AC
_080614AC: .4byte 0x0000FF10
_080614B0: .4byte 0x082D91CC
_080614B4: .4byte 0x0805D3C9
_080614B8: .4byte 0x03005AC0
_080614BC: .4byte 0x0805EDED
	thumb_func_end OpponentHandleDrawTrainerPic

	thumb_func_start OpponentHandleTrainerSlide
OpponentHandleTrainerSlide: @ 0x080614C0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _080614DC
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r2
	cmp r0, #0
	beq _080614E0
	bl GetSecretBaseTrainerClass
	b _0806158A
	.align 2, 0
_080614DC: .4byte 0x02022C90
_080614E0:
	ldr r3, _080614F0
	ldrh r1, [r3]
	ldr r0, _080614F4
	cmp r1, r0
	bne _080614F8
	bl PrintHyphens
	b _0806158A
	.align 2, 0
_080614F0: .4byte 0x0203886A
_080614F4: .4byte 0x000003FE
_080614F8:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r2
	cmp r0, #0
	beq _08061538
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	cmp r2, #0
	beq _08061530
	ldr r0, _0806151C
	ldrb r0, [r0]
	cmp r0, #1
	bne _08061520
	ldrh r0, [r3]
	bl GetTrainerHillTrainerFrontSpriteId
	b _0806158A
	.align 2, 0
_0806151C: .4byte 0x02023D08
_08061520:
	ldr r0, _0806152C
	ldrh r0, [r0]
	bl GetTrainerHillTrainerFrontSpriteId
	b _0806158A
	.align 2, 0
_0806152C: .4byte 0x0203886C
_08061530:
	ldrh r0, [r3]
	bl GetTrainerHillTrainerFrontSpriteId
	b _0806158A
_08061538:
	ldr r0, _08061558
	ands r0, r2
	cmp r0, #0
	beq _0806157C
	ldr r0, _0806155C
	ands r2, r0
	cmp r2, #0
	beq _08061574
	ldr r0, _08061560
	ldrb r0, [r0]
	cmp r0, #1
	bne _08061564
	ldrh r0, [r3]
	bl GetFrontierTrainerFrontSpriteId
	b _0806158A
	.align 2, 0
_08061558: .4byte 0x003F0100
_0806155C: .4byte 0x00808000
_08061560: .4byte 0x02023D08
_08061564:
	ldr r0, _08061570
	ldrh r0, [r0]
	bl GetFrontierTrainerFrontSpriteId
	b _0806158A
	.align 2, 0
_08061570: .4byte 0x0203886C
_08061574:
	ldrh r0, [r3]
	bl GetFrontierTrainerFrontSpriteId
	b _0806158A
_0806157C:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08061590
	bl GetMonCountForBattleMode
_0806158A:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080615C2
_08061590:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	cmp r2, #0
	beq _080615B8
	ldr r0, _080615AC
	ldrb r0, [r0]
	cmp r0, #1
	beq _080615B8
	ldr r1, _080615B0
	ldr r0, _080615B4
	ldrh r0, [r0]
	b _080615BC
	.align 2, 0
_080615AC: .4byte 0x02023D08
_080615B0: .4byte 0x082E383C
_080615B4: .4byte 0x0203886C
_080615B8:
	ldr r1, _080616A8
	ldrh r0, [r3]
_080615BC:
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0, #3]
_080615C2:
	mov r8, r0
	ldr r6, _080616AC
	ldrb r1, [r6]
	bl DecompressTrainerFrontPic
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _080616B0
	ldr r2, _080616B4
	mov r3, r8
	lsls r1, r3, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #8
	subs r2, r2, r1
	lsls r2, r2, #0x12
	movs r1, #0xa0
	lsls r1, r1, #0xe
	adds r2, r2, r1
	asrs r2, r2, #0x10
	movs r1, #0xb0
	movs r3, #0x1e
	bl CreateSprite
	ldr r5, _080616B8
	ldrb r1, [r6]
	adds r1, r1, r5
	strb r0, [r1]
	ldr r4, _080616BC
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x60
	strh r1, [r0, #0x24]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x20]
	adds r1, #0x20
	strh r1, [r0, #0x20]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _080616C0
	strh r1, [r0, #0x2e]
	ldr r1, _080616C4
	mov r2, r8
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	bl IndexOfSpritePaletteTag
	ldrb r1, [r6]
	adds r1, r1, r5
	ldrb r1, [r1]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r4
	lsls r0, r0, #4
	ldrb r3, [r2, #5]
	movs r1, #0xf
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #5]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r3, r8
	strh r3, [r0, #6]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _080616C8
	str r1, [r0]
	ldr r1, _080616CC
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080616D0
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080616A8: .4byte 0x082E383C
_080616AC: .4byte 0x02023D08
_080616B0: .4byte 0x02024640
_080616B4: .4byte 0x082D8D70
_080616B8: .4byte 0x02023E88
_080616BC: .4byte 0x020205AC
_080616C0: .4byte 0x0000FFFE
_080616C4: .4byte 0x082D91CC
_080616C8: .4byte 0x0805D3C9
_080616CC: .4byte 0x03005AC0
_080616D0: .4byte 0x0805EE25
	thumb_func_end OpponentHandleTrainerSlide

	thumb_func_start OpponentHandleTrainerSlideBack
OpponentHandleTrainerSlideBack: @ 0x080616D4
	push {r4, r5, r6, lr}
	ldr r6, _08061764
	ldr r4, _08061768
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0806176C
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
	movs r1, #0x8c
	lsls r1, r1, #1
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
	ldr r1, _08061770
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _08061774
	bl StoreSpriteCallbackInData6
	ldr r1, _08061778
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0806177C
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061764: .4byte 0x02023E88
_08061768: .4byte 0x02023D08
_0806176C: .4byte 0x020205AC
_08061770: .4byte 0x080A67B5
_08061774: .4byte 0x08007141
_08061778: .4byte 0x03005AC0
_0806177C: .4byte 0x0805EE5D
	thumb_func_end OpponentHandleTrainerSlideBack

	thumb_func_start OpponentHandleFaintAnimation
OpponentHandleFaintAnimation: @ 0x08061780
	push {r4, r5, r6, lr}
	ldr r6, _080617CC
	ldr r4, [r6]
	ldr r5, _080617D0
	ldrb r2, [r5]
	ldr r0, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _080617D4
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080617B4
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_080617B4:
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
	b _08061810
	.align 2, 0
_080617CC: .4byte 0x02024174
_080617D0: .4byte 0x02023D08
_080617D4:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08061810
	strb r0, [r3, #4]
	movs r0, #0x10
	movs r1, #0x3f
	bl PlaySE12WithPanning
	ldr r2, _08061818
	ldr r1, _0806181C
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08061820
	str r1, [r0]
	ldr r1, _08061824
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08061828
	str r1, [r0]
_08061810:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061818: .4byte 0x020205AC
_0806181C: .4byte 0x02023E88
_08061820: .4byte 0x08039579
_08061824: .4byte 0x03005AC0
_08061828: .4byte 0x0805F6B1
	thumb_func_end OpponentHandleFaintAnimation

	thumb_func_start OpponentHandlePaletteFade
OpponentHandlePaletteFade: @ 0x0806182C
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandlePaletteFade

	thumb_func_start OpponentHandlePause
OpponentHandlePause: @ 0x08061838
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandlePause

	thumb_func_start OpponentHandleSuccessBallThrowAnim
OpponentHandleSuccessBallThrowAnim: @ 0x08061844
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleSuccessBallThrowAnim

	thumb_func_start OpponentHandleChosenMonReturnValue
OpponentHandleChosenMonReturnValue: @ 0x08061850
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleChosenMonReturnValue

	thumb_func_start OpponentHandleMoveAnimation
OpponentHandleMoveAnimation: @ 0x0806185C
	push {r4, r5, r6, lr}
	ldr r6, _08061940
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806186E
	b _08061982
_0806186E:
	ldr r0, _08061944
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
	ldr r5, _08061948
	mov r1, ip
	adds r1, #3
	adds r2, r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0806194C
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
	ldr r4, _08061950
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
	ldr r3, _08061954
	ldrb r1, [r6]
	lsls r1, r1, #9
	mov r2, ip
	adds r2, #0xa
	adds r1, r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08061958
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
	ldr r3, _0806195C
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #0x10
	adds r2, r2, r1
	str r2, [r3]
	ldr r3, _08061960
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
	beq _08061964
	bl OpponentBufferExecCompleted
	b _08061982
	.align 2, 0
_08061940: .4byte 0x02023D08
_08061944: .4byte 0x02022D08
_08061948: .4byte 0x020380D2
_0806194C: .4byte 0x020380A8
_08061950: .4byte 0x020380A4
_08061954: .4byte 0x020380BA
_08061958: .4byte 0x020380BC
_0806195C: .4byte 0x020380A0
_08061960: .4byte 0x02024160
_08061964:
	ldr r0, _08061988
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #4]
	ldr r1, _0806198C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08061990
	str r1, [r0]
_08061982:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061988: .4byte 0x02024174
_0806198C: .4byte 0x03005AC0
_08061990: .4byte 0x08061995
	thumb_func_end OpponentHandleMoveAnimation

	thumb_func_start OpponentDoMoveAnimation
OpponentDoMoveAnimation: @ 0x08061994
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _080619E0
	ldr r6, _080619E4
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
	ldr r7, _080619E8
	ldr r5, [r7]
	ldr r1, [r5, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _08061A2C
	cmp r2, #1
	bgt _080619EC
	cmp r2, #0
	beq _080619F6
	b _08061B08
	.align 2, 0
_080619E0: .4byte 0x02022D08
_080619E4: .4byte 0x02023D08
_080619E8: .4byte 0x02024174
_080619EC:
	cmp r2, #2
	beq _08061A56
	cmp r2, #3
	beq _08061ACC
	b _08061B08
_080619F6:
	ldr r1, [r5]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, #0xc
	ands r0, r2
	cmp r0, #4
	bne _08061A18
	movs r0, #8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_08061A18:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _08061B08
_08061A2C:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08061B08
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
	b _08061B08
_08061A56:
	ldr r0, _08061ABC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08061AC0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08061B08
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
	beq _08061AA4
	mov r0, r8
	cmp r0, #1
	bhi _08061AA4
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
_08061AA4:
	ldr r0, _08061AC4
	ldr r2, [r0]
	ldr r0, _08061AC8
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #4]
	b _08061B08
	.align 2, 0
_08061ABC: .4byte 0x02038098
_08061AC0: .4byte 0x0203809D
_08061AC4: .4byte 0x02024174
_08061AC8: .4byte 0x02023D08
_08061ACC:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08061B08
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
	bl OpponentBufferExecCompleted
_08061B08:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentDoMoveAnimation

	thumb_func_start OpponentHandlePrintString
OpponentHandlePrintString: @ 0x08061B18
	push {r4, r5, lr}
	ldr r0, _08061B58
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08061B5C
	strh r1, [r0]
	ldr r5, _08061B60
	ldrb r4, [r5]
	lsls r4, r4, #9
	ldr r0, _08061B64
	adds r4, r4, r0
	ldrh r0, [r4]
	bl BufferStringBattle
	ldr r0, _08061B68
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _08061B6C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08061B70
	str r1, [r0]
	ldrb r0, [r5]
	ldrh r1, [r4]
	bl BattleArena_DeductMindPoints
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061B58: .4byte 0x02022AC8
_08061B5C: .4byte 0x02022ACA
_08061B60: .4byte 0x02023D08
_08061B64: .4byte 0x02022D0A
_08061B68: .4byte 0x02022AE0
_08061B6C: .4byte 0x03005AC0
_08061B70: .4byte 0x0805F769
	thumb_func_end OpponentHandlePrintString

	thumb_func_start OpponentHandleCmd23
OpponentHandleCmd23: @ 0x08061B74
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleCmd23

	thumb_func_start OpponentHandleChooseAction
OpponentHandleChooseAction: @ 0x08061B80
	push {lr}
	bl AI_TrySwitchOrUseItem
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleChooseAction

	thumb_func_start OpponentHandleCmd32
OpponentHandleCmd32: @ 0x08061B90
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleCmd32

	thumb_func_start OpponentHandleChooseMove
OpponentHandleChooseMove: @ 0x08061B9C
	push {r4, r5, r6, lr}
	ldr r0, _08061BC4
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08061BC8
	bl ChooseMoveAndTargetInBattlePalace
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xa
_08061BBA:
	bl BtlController_EmitTwoReturnValues
_08061BBE:
	bl OpponentBufferExecCompleted
	b _08061D3A
	.align 2, 0
_08061BC4: .4byte 0x02022C90
_08061BC8:
	ldr r0, _08061BF8
	ldrb r0, [r0]
	lsls r0, r0, #9
	ldr r1, _08061BFC
	adds r5, r0, r1
	movs r0, #0x93
	lsls r0, r0, #3
	ands r2, r0
	cmp r2, #0
	beq _08061CA8
	movs r0, #0xf
	bl BattleAI_SetupAIData
	bl BattleAI_ChooseMoveOrAction
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	beq _08061C06
	cmp r4, #5
	bgt _08061C00
	cmp r4, #4
	beq _08061C0C
	b _08061C24
	.align 2, 0
_08061BF8: .4byte 0x02023D08
_08061BFC: .4byte 0x02022D0C
_08061C00:
	cmp r4, #6
	beq _08061C14
	b _08061C24
_08061C06:
	movs r0, #1
	movs r1, #4
	b _08061C10
_08061C0C:
	movs r0, #1
	movs r1, #3
_08061C10:
	movs r2, #0
	b _08061BBA
_08061C14:
	ldr r0, _08061C20
	ldrb r2, [r0]
	movs r0, #1
	movs r1, #0xf
	b _08061BBA
	.align 2, 0
_08061C20: .4byte 0x02023EB0
_08061C24:
	ldr r3, _08061C94
	lsls r0, r4, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #6]
	movs r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08061C46
	ldr r0, _08061C98
	ldr r1, _08061C9C
	ldrb r1, [r1]
	strb r1, [r0]
_08061C46:
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #6]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061C80
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r5, _08061C98
	strb r0, [r5]
	ldr r0, _08061CA0
	ldrb r1, [r0]
	ldr r2, _08061CA4
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08061C80
	movs r0, #2
	bl GetBattlerAtPosition
	strb r0, [r5]
_08061C80:
	ldr r0, _08061C98
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r4, r0
	movs r0, #1
	movs r1, #0xa
	adds r2, r4, #0
	bl BtlController_EmitTwoReturnValues
	b _08061BBE
	.align 2, 0
_08061C94: .4byte 0x082ED220
_08061C98: .4byte 0x02023EB0
_08061C9C: .4byte 0x02023D08
_08061CA0: .4byte 0x02023EB4
_08061CA4: .4byte 0x082FACB4
_08061CA8:
	movs r6, #3
_08061CAA:
	bl Random
	adds r4, r0, #0
	ands r4, r6
	lsls r0, r4, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	cmp r2, #0
	beq _08061CAA
	ldr r1, _08061CE4
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #6]
	movs r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08061CEC
	ldr r0, _08061CE8
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r4, r0
	movs r0, #1
	movs r1, #0xa
	adds r2, r4, #0
	bl BtlController_EmitTwoReturnValues
	b _08061D36
	.align 2, 0
_08061CE4: .4byte 0x082ED220
_08061CE8: .4byte 0x02023D08
_08061CEC:
	ldr r0, _08061D1C
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08061D20
	bl Random
	movs r1, #2
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	bl GetBattlerAtPosition
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x10
	orrs r2, r4
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
	b _08061D36
	.align 2, 0
_08061D1C: .4byte 0x02022C90
_08061D20:
	movs r0, #0
	bl GetBattlerAtPosition
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x10
	orrs r2, r4
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
_08061D36:
	bl OpponentBufferExecCompleted
_08061D3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleChooseMove

	thumb_func_start OpponentHandleCmd40
OpponentHandleCmd40: @ 0x08061D40
	push {lr}
	ldr r0, _08061D64
	ldrb r0, [r0]
	lsrs r0, r0, #1
	ldr r1, _08061D68
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0xc0
	ldrb r1, [r0]
	movs r0, #1
	bl BtlController_EmitOneReturnValue
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08061D64: .4byte 0x02023D08
_08061D68: .4byte 0x02024140
	thumb_func_end OpponentHandleCmd40

	thumb_func_start OpponentHandleChoosePokemon
OpponentHandleChoosePokemon: @ 0x08061D6C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08061DAC
	ldrb r0, [r0]
	ldr r1, _08061DB0
	ldr r1, [r1]
	adds r0, r0, r1
	movs r2, #0xa5
	lsls r2, r2, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #6
	bne _08061E38
	bl GetMostSuitableMonToSwitchInto
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bne _08061E3E
	ldr r0, _08061DB4
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08061DB8
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r5, #0
	b _08061DCC
	.align 2, 0
_08061DAC: .4byte 0x02023D08
_08061DB0: .4byte 0x02024140
_08061DB4: .4byte 0x02022C90
_08061DB8:
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #3
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08061DCC:
	ldr r0, _08061DE8
	ldr r0, [r0]
	ldr r1, _08061DEC
	ands r0, r1
	cmp r0, #0
	beq _08061DF8
	ldr r0, _08061DF0
	ldrb r0, [r0]
	cmp r0, #1
	bne _08061DF4
	movs r0, #0
	movs r6, #3
	b _08061DFC
	.align 2, 0
_08061DE8: .4byte 0x02022C90
_08061DEC: .4byte 0x00808000
_08061DF0: .4byte 0x02023D08
_08061DF4:
	movs r0, #3
	b _08061DFA
_08061DF8:
	movs r0, #0
_08061DFA:
	movs r6, #6
_08061DFC:
	adds r4, r0, #0
	b _08061E02
_08061E00:
	adds r4, #1
_08061E02:
	cmp r4, r6
	bge _08061E3E
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _08061E30
	adds r0, r0, r1
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _08061E00
	ldr r1, _08061E34
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _08061E00
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _08061E00
	b _08061E3E
	.align 2, 0
_08061E30: .4byte 0x020243E8
_08061E34: .4byte 0x02023D12
_08061E38:
	ldrb r4, [r1]
	movs r0, #6
	strb r0, [r1]
_08061E3E:
	ldr r0, _08061E64
	ldrb r0, [r0]
	ldr r1, _08061E68
	ldr r1, [r1]
	adds r0, r0, r1
	adds r0, #0x5c
	strb r4, [r0]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0
	bl BtlController_EmitChosenMonReturnValue
	bl OpponentBufferExecCompleted
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061E64: .4byte 0x02023D08
_08061E68: .4byte 0x02024140
	thumb_func_end OpponentHandleChoosePokemon

	thumb_func_start OpponentHandleCmd42
OpponentHandleCmd42: @ 0x08061E6C
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleCmd42

	thumb_func_start OpponentHandleHealthBarUpdate
OpponentHandleHealthBarUpdate: @ 0x08061E78
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	bl LoadBattleBarGfx
	ldr r3, _08061EF0
	ldr r0, _08061EF4
	mov sb, r0
	ldrb r4, [r0]
	lsls r2, r4, #9
	adds r0, r3, #3
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r1, r1, #8
	adds r3, #2
	adds r2, r2, r3
	ldrb r0, [r2]
	orrs r0, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, _08061EF8
	cmp r7, r0
	beq _08061F08
	ldr r6, _08061EFC
	lsls r0, r4, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _08061F00
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
	ldr r1, _08061F04
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _08061F32
	.align 2, 0
_08061EF0: .4byte 0x02022D08
_08061EF4: .4byte 0x02023D08
_08061EF8: .4byte 0x00007FFF
_08061EFC: .4byte 0x02023D12
_08061F00: .4byte 0x020243E8
_08061F04: .4byte 0x03005AD0
_08061F08:
	ldr r1, _08061F50
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08061F54
	adds r0, r0, r1
	movs r1, #0x3a
	bl GetMonData
	adds r2, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _08061F58
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, #0
	bl SetBattleBarStruct
_08061F32:
	ldr r1, _08061F5C
	ldr r0, _08061F60
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08061F64
	str r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061F50: .4byte 0x02023D12
_08061F54: .4byte 0x020243E8
_08061F58: .4byte 0x03005AD0
_08061F5C: .4byte 0x03005AC0
_08061F60: .4byte 0x02023D08
_08061F64: .4byte 0x0805F65D
	thumb_func_end OpponentHandleHealthBarUpdate

	thumb_func_start OpponentHandleDMA3Transfer
OpponentHandleDMA3Transfer: @ 0x08061F68
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleDMA3Transfer

	thumb_func_start OpponentHandleStatusIconUpdate
OpponentHandleStatusIconUpdate: @ 0x08061F74
	push {r4, lr}
	ldr r4, _08061FD0
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08061FC8
	ldr r0, _08061FD4
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08061FD8
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08061FDC
	adds r1, r1, r2
	movs r2, #9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _08061FE0
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
	ldr r1, _08061FE4
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08061FE8
	str r1, [r0]
_08061FC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061FD0: .4byte 0x02023D08
_08061FD4: .4byte 0x03005AD0
_08061FD8: .4byte 0x02023D12
_08061FDC: .4byte 0x020243E8
_08061FE0: .4byte 0x02024174
_08061FE4: .4byte 0x03005AC0
_08061FE8: .4byte 0x0805FAA5
	thumb_func_end OpponentHandleStatusIconUpdate

	thumb_func_start OpponentHandleStatusAnimation
OpponentHandleStatusAnimation: @ 0x08061FEC
	push {r4, r5, lr}
	ldr r5, _08062044
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806203C
	ldr r4, _08062048
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
	ldr r1, _0806204C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08062050
	str r1, [r0]
_0806203C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062044: .4byte 0x02023D08
_08062048: .4byte 0x02022D08
_0806204C: .4byte 0x03005AC0
_08062050: .4byte 0x0805FAA5
	thumb_func_end OpponentHandleStatusAnimation

	thumb_func_start OpponentHandleDataTransfer
OpponentHandleDataTransfer: @ 0x08062054
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleDataTransfer

	thumb_func_start OpponentHandleEndBounceEffect
OpponentHandleEndBounceEffect: @ 0x08062060
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleEndBounceEffect

	thumb_func_start OpponentHandleExpUpdate
OpponentHandleExpUpdate: @ 0x0806206C
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleExpUpdate

	thumb_func_start OpponentHandleLinkStandbyMsg
OpponentHandleLinkStandbyMsg: @ 0x08062078
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleLinkStandbyMsg

	thumb_func_start OpponentHandleOneReturnValue
OpponentHandleOneReturnValue: @ 0x08062084
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleOneReturnValue

	thumb_func_start OpponentHandleOneReturnValue_Duplicate
OpponentHandleOneReturnValue_Duplicate: @ 0x08062090
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleOneReturnValue_Duplicate

	thumb_func_start OpponentHandlePlayBGM
OpponentHandlePlayBGM: @ 0x0806209C
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandlePlayBGM

	thumb_func_start OpponentHandlePrintSelectionString
OpponentHandlePrintSelectionString: @ 0x080620A8
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandlePrintSelectionString

	thumb_func_start OpponentHandleResetActionMoveSelection
OpponentHandleResetActionMoveSelection: @ 0x080620B4
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandleResetActionMoveSelection

	thumb_func_start OpponentHandleStatusXor
OpponentHandleStatusXor: @ 0x080620C0
	push {lr}
	ldr r2, _080620D8
	ldrb r1, [r2]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080620D8: .4byte 0x020229C0
	thumb_func_end OpponentHandleStatusXor

	thumb_func_start OpponentHandleTwoReturnValues
OpponentHandleTwoReturnValues: @ 0x080620DC
	push {lr}
	ldr r3, _08062108
	ldr r1, _0806210C
	ldr r0, _08062110
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
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08062108: .4byte 0x020229C0
_0806210C: .4byte 0x02022D08
_08062110: .4byte 0x02023D08
	thumb_func_end OpponentHandleTwoReturnValues

	thumb_func_start OpponentHandleUnknownYesNoBox
OpponentHandleUnknownYesNoBox: @ 0x08062114
	push {lr}
	ldr r2, _08062128
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08062128: .4byte 0x020229C0
	thumb_func_end OpponentHandleUnknownYesNoBox

	thumb_func_start sub_0806212C
sub_0806212C: @ 0x0806212C
	push {lr}
	ldr r3, _08062150
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
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08062150: .4byte 0x020229C0
	thumb_func_end sub_0806212C

	thumb_func_start sub_08062154
sub_08062154: @ 0x08062154
	push {r4, lr}
	ldr r3, _0806217C
	ldr r2, _08062180
	ldr r4, _08062184
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
	bge _08062188
	bl OpponentBufferExecCompleted
	b _080621B2
	.align 2, 0
_0806217C: .4byte 0x020205AC
_08062180: .4byte 0x02023E88
_08062184: .4byte 0x02023D08
_08062188:
	ldr r1, _080621B8
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
	ldr r1, _080621BC
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080621C0
	str r1, [r0]
_080621B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080621B8: .4byte 0x0202415D
_080621BC: .4byte 0x03005AC0
_080621C0: .4byte 0x0805F781
	thumb_func_end sub_08062154

	thumb_func_start OpponentCmdEnd
OpponentCmdEnd: @ 0x080621C4
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentCmdEnd

	thumb_func_start OpponentHandlePlaySE
OpponentHandlePlaySE: @ 0x080621D0
	push {r4, lr}
	ldr r4, _0806220C
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r3, #0x3f
	cmp r0, #0
	bne _080621E4
	movs r3, #0xc0
_080621E4:
	ldr r2, _08062210
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
	bl OpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806220C: .4byte 0x02023D08
_08062210: .4byte 0x02022D08
	thumb_func_end OpponentHandlePlaySE

	thumb_func_start OpponentHandlePlayFanfareOrBGM
OpponentHandlePlayFanfareOrBGM: @ 0x08062214
	push {r4, r5, lr}
	ldr r4, _08062248
	ldr r5, _0806224C
	ldrb r0, [r5]
	lsls r3, r0, #9
	adds r0, r4, #3
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08062250
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
	b _08062264
	.align 2, 0
_08062248: .4byte 0x02022D08
_0806224C: .4byte 0x02023D08
_08062250:
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayFanfare
_08062264:
	bl OpponentBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OpponentHandlePlayFanfareOrBGM

	thumb_func_start OpponentHandleFaintingCry
OpponentHandleFaintingCry: @ 0x08062270
	push {lr}
	ldr r1, _080622A0
	ldr r0, _080622A4
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080622A8
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	movs r2, #5
	bl PlayCry3
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080622A0: .4byte 0x02023D12
_080622A4: .4byte 0x02023D08
_080622A8: .4byte 0x020243E8
	thumb_func_end OpponentHandleFaintingCry

	thumb_func_start nullsub_26
nullsub_26: @ 0x080622AC
	push {lr}
	ldr r1, _080622D4
	ldr r0, _080622D8
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _080622DC
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080622D4: .4byte 0x02022D08
_080622D8: .4byte 0x02023D08
_080622DC: .4byte 0x020240A0
	thumb_func_end nullsub_26

	thumb_func_start OpponentHandleIntroTrainerBallThrow
OpponentHandleIntroTrainerBallThrow: @ 0x080622E0
	push {r4, r5, r6, lr}
	ldr r5, _080623C0
	ldr r6, _080623C4
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080623C8
	adds r0, r0, r4
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x23
	strh r1, [r0, #0x2e]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x8c
	lsls r1, r1, #1
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
	ldr r1, _080623CC
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _080623D0
	bl StoreSpriteCallbackInData6
	ldr r0, _080623D4
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080623D8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r6]
	strh r0, [r1, #8]
	ldr r3, _080623DC
	ldr r0, [r3]
	ldrb r2, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080623A2
	ldr r0, _080623E0
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, _080623E4
	str r1, [r0]
_080623A2:
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r0, [r2, #9]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #9]
	ldr r1, _080623E8
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080623EC
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080623C0: .4byte 0x02023E88
_080623C4: .4byte 0x02023D08
_080623C8: .4byte 0x020205AC
_080623CC: .4byte 0x080A67B5
_080623D0: .4byte 0x080623F1
_080623D4: .4byte 0x0806240D
_080623D8: .4byte 0x03005B60
_080623DC: .4byte 0x02024174
_080623E0: .4byte 0x02024158
_080623E4: .4byte 0x0807352D
_080623E8: .4byte 0x03005AC0
_080623EC: .4byte 0x0805ED7D
	thumb_func_end OpponentHandleIntroTrainerBallThrow

	thumb_func_start sub_080623F0
sub_080623F0: @ 0x080623F0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #6]
	bl FreeTrainerFrontPicPalette
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080623F0

	thumb_func_start OpponentHandleDrawPartyStatusSummary
OpponentHandleDrawPartyStatusSummary: @ 0x0806240C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r7, _08062470
	ldrb r0, [r7]
	mov sb, r0
	ldr r1, _08062474
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08062450
	ldr r0, _08062478
	ldr r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08062450
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08062484
_08062450:
	ldr r0, _0806247C
	ldrb r1, [r7]
	lsls r2, r1, #9
	adds r0, #1
	adds r2, r2, r0
	ldr r0, _08062480
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_08060FC8
	b _080624C4
	.align 2, 0
_08062470: .4byte 0x02023D08
_08062474: .4byte 0x03005B60
_08062478: .4byte 0x02022C90
_0806247C: .4byte 0x02022D08
_08062480: .4byte 0x02023D12
_08062484:
	ldr r4, _080624E8
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r4, #1
	adds r1, r1, r4
	ldr r6, _080624EC
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_08060FC8
	ldrb r0, [r7]
	movs r5, #2
	eors r0, r5
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r1, r1, r4
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_08060FC8
	ldrb r0, [r7]
	eors r0, r5
	strb r0, [r7]
_080624C4:
	ldr r1, _080624F0
	ldr r2, _080624F4
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080624F8
	str r1, [r0]
	mov r0, sb
	strb r0, [r2]
	mov r0, r8
	bl DestroyTask
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080624E8: .4byte 0x02022D08
_080624EC: .4byte 0x02023D12
_080624F0: .4byte 0x03005AC0
_080624F4: .4byte 0x02023D08
_080624F8: .4byte 0x0805F14D
	thumb_func_end OpponentHandleDrawPartyStatusSummary

	thumb_func_start sub_080624FC
sub_080624FC: @ 0x080624FC
	push {r4, r5, r6, r7, lr}
	ldr r1, _08062524
	ldr r0, _08062528
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806252C
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806252C
	bl OpponentBufferExecCompleted
	b _080625F6
	.align 2, 0
_08062524: .4byte 0x02022D08
_08062528: .4byte 0x02023D08
_0806252C:
	ldr r4, _08062584
	ldr r0, [r4]
	ldr r3, _08062588
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _0806258C
	ldrb r2, [r3]
	lsls r0, r2, #9
	adds r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r3, #0
	cmp r0, #0
	beq _08062598
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r2, [r3, #1]
	lsls r1, r2, #0x1b
	lsrs r0, r1, #0x1c
	cmp r0, #1
	bhi _08062590
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #1]
	b _080625F6
	.align 2, 0
_08062584: .4byte 0x02024174
_08062588: .4byte 0x02023D08
_0806258C: .4byte 0x02022D08
_08062590:
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3, #1]
_08062598:
	adds r5, r7, #0
	ldrb r0, [r5]
	lsls r3, r0, #9
	ldr r4, _080625FC
	adds r1, r3, r4
	subs r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, #2
	adds r3, r3, r4
	ldrb r3, [r3]
	bl CreatePartyStatusSummarySprites
	ldr r2, _08062600
	ldrb r1, [r5]
	adds r1, r1, r2
	movs r3, #0
	strb r0, [r1]
	ldr r6, _08062604
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
	beq _080625EA
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x5d
	strb r1, [r0, #5]
_080625EA:
	ldr r0, _08062608
	ldrb r1, [r7]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0806260C
	str r0, [r1]
_080625F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080625FC: .4byte 0x02022D0C
_08062600: .4byte 0x02024158
_08062604: .4byte 0x02024174
_08062608: .4byte 0x03005AC0
_0806260C: .4byte 0x08062611
	thumb_func_end sub_080624FC

	thumb_func_start sub_08062610
sub_08062610: @ 0x08062610
	push {r4, lr}
	ldr r4, _08062650
	ldr r0, [r4]
	ldr r3, _08062654
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
	bls _08062648
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #5]
	bl OpponentBufferExecCompleted
_08062648:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062650: .4byte 0x02024174
_08062654: .4byte 0x02023D08
	thumb_func_end sub_08062610

	thumb_func_start sub_08062658
sub_08062658: @ 0x08062658
	push {lr}
	ldr r0, _08062694
	ldr r1, [r0]
	ldr r0, _08062698
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
	beq _0806268A
	ldr r2, _0806269C
	ldr r0, _080626A0
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _080626A4
	str r1, [r0]
_0806268A:
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08062694: .4byte 0x02024174
_08062698: .4byte 0x02023D08
_0806269C: .4byte 0x03005B60
_080626A0: .4byte 0x02024158
_080626A4: .4byte 0x0807352D
	thumb_func_end sub_08062658

	thumb_func_start sub_080626A8
sub_080626A8: @ 0x080626A8
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080626A8

	thumb_func_start OpponentHandleSpriteInvisibility
OpponentHandleSpriteInvisibility: @ 0x080626B4
	push {r4, lr}
	ldr r4, _08062704
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080626FA
	ldr r3, _08062708
	ldr r0, _0806270C
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _08062710
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
_080626FA:
	bl OpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062704: .4byte 0x02023D08
_08062708: .4byte 0x020205AC
_0806270C: .4byte 0x02023E88
_08062710: .4byte 0x02022D08
	thumb_func_end OpponentHandleSpriteInvisibility

	thumb_func_start OpponentHandleBattleAnimation
OpponentHandleBattleAnimation: @ 0x08062714
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _08062758
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806276C
	ldr r5, _0806275C
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
	beq _08062760
	bl OpponentBufferExecCompleted
	b _0806276C
	.align 2, 0
_08062758: .4byte 0x02023D08
_0806275C: .4byte 0x02022D08
_08062760:
	ldr r0, _08062774
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _08062778
	str r0, [r1]
_0806276C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062774: .4byte 0x03005AC0
_08062778: .4byte 0x0805FAD5
	thumb_func_end OpponentHandleBattleAnimation

	thumb_func_start sub_0806277C
sub_0806277C: @ 0x0806277C
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0806277C

	thumb_func_start sub_08062788
sub_08062788: @ 0x08062788
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08062788

	thumb_func_start OpponentHandleCmd55
OpponentHandleCmd55: @ 0x08062794
	push {lr}
	ldr r0, _080627C8
	ldr r0, [r0]
	movs r1, #6
	ands r0, r1
	cmp r0, #2
	bne _080627BE
	ldr r2, _080627CC
	ldr r0, _080627D0
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _080627D4
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, #8]
	bl SetMainCallback2
_080627BE:
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080627C8: .4byte 0x02022C90
_080627CC: .4byte 0x03002360
_080627D0: .4byte 0x00000439
_080627D4: .4byte 0x03005A60
	thumb_func_end OpponentHandleCmd55

	thumb_func_start sub_080627D8
sub_080627D8: @ 0x080627D8
	bx lr
	.align 2, 0
	thumb_func_end sub_080627D8

