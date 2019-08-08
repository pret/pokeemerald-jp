.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start nullsub_28
nullsub_28: @ 0x08063F74
	bx lr
	.align 2, 0
	thumb_func_end nullsub_28

	thumb_func_start SetControllerToLinkOpponent
SetControllerToLinkOpponent: @ 0x08063F78
	ldr r1, _08063F88
	ldr r0, _08063F8C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08063F90
	str r1, [r0]
	bx lr
	.align 2, 0
_08063F88: .4byte 0x03005AC0
_08063F8C: .4byte 0x02023D08
_08063F90: .4byte 0x08063F95
	thumb_func_end SetControllerToLinkOpponent

	thumb_func_start LinkOpponentBufferRunCommand
LinkOpponentBufferRunCommand: @ 0x08063F94
	push {lr}
	ldr r2, _08063FC8
	ldr r1, _08063FCC
	ldr r0, _08063FD0
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08063FE0
	ldr r0, _08063FD4
	lsls r1, r3, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x38
	bhi _08063FDC
	ldr r0, _08063FD8
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _08063FE0
	.align 2, 0
_08063FC8: .4byte 0x02023D0C
_08063FCC: .4byte 0x082FACB4
_08063FD0: .4byte 0x02023D08
_08063FD4: .4byte 0x02022D08
_08063FD8: .4byte 0x082ED13C
_08063FDC:
	bl LinkOpponentBufferExecCompleted
_08063FE0:
	pop {r0}
	bx r0
	thumb_func_end LinkOpponentBufferRunCommand

	thumb_func_start LinkOpponentHandleCmd37
LinkOpponentHandleCmd37: @ 0x08063FE4
	push {lr}
	ldr r2, _0806400C
	ldr r1, _08064010
	ldr r0, _08064014
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08064018
	cmp r1, r0
	bne _08064008
	bl LinkOpponentBufferExecCompleted
_08064008:
	pop {r0}
	bx r0
	.align 2, 0
_0806400C: .4byte 0x020205AC
_08064010: .4byte 0x02023E88
_08064014: .4byte 0x02023D08
_08064018: .4byte 0x08007141
	thumb_func_end LinkOpponentHandleCmd37

	thumb_func_start sub_0806401C
sub_0806401C: @ 0x0806401C
	push {lr}
	ldr r2, _08064044
	ldr r1, _08064048
	ldr r0, _0806404C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08064050
	cmp r1, r0
	bne _08064040
	bl LinkOpponentBufferExecCompleted
_08064040:
	pop {r0}
	bx r0
	.align 2, 0
_08064044: .4byte 0x020205AC
_08064048: .4byte 0x02023E88
_0806404C: .4byte 0x02023D08
_08064050: .4byte 0x08007141
	thumb_func_end sub_0806401C

	thumb_func_start sub_08064054
sub_08064054: @ 0x08064054
	push {r4, r5, r6, lr}
	ldr r5, _080640AC
	ldr r6, _080640B0
	ldr r4, _080640B4
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
	ldr r0, _080640B8
	cmp r1, r0
	bne _080640A6
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
	bl LinkOpponentBufferExecCompleted
_080640A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080640AC: .4byte 0x020205AC
_080640B0: .4byte 0x02023E88
_080640B4: .4byte 0x02023D08
_080640B8: .4byte 0x08007141
	thumb_func_end sub_08064054

	thumb_func_start sub_080640BC
sub_080640BC: @ 0x080640BC
	push {r4, lr}
	ldr r4, _080640FC
	ldr r1, [r4]
	ldr r3, _08064100
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
	bne _080640F4
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #9]
	bl LinkOpponentBufferExecCompleted
_080640F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080640FC: .4byte 0x02024174
_08064100: .4byte 0x02023D08
	thumb_func_end sub_080640BC

	thumb_func_start sub_08064104
sub_08064104: @ 0x08064104
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	movs r4, #0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08064130
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08064168
	ldr r0, _08064154
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08064168
_08064130:
	ldr r2, _08064158
	ldr r1, _0806415C
	ldr r3, _08064160
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08064164
	adds r7, r3, #0
	cmp r1, r0
	bne _080641A6
	b _080641AE
	.align 2, 0
_08064154: .4byte 0x02022C90
_08064158: .4byte 0x020205AC
_0806415C: .4byte 0x03005AD0
_08064160: .4byte 0x02023D08
_08064164: .4byte 0x08007141
_08064168:
	ldr r3, _08064268
	ldr r6, _0806426C
	ldr r2, _08064270
	ldrb r4, [r2]
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r3, #0
	adds r5, #0x1c
	adds r0, r0, r5
	ldr r3, [r0]
	ldr r0, _08064274
	adds r7, r2, #0
	cmp r3, r0
	bne _080641A4
	movs r0, #2
	eors r4, r0
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	bne _080641A4
	movs r1, #1
	mov r8, r1
_080641A4:
	movs r4, #1
_080641A6:
	mov r0, r8
	cmp r0, #0
	bne _080641AE
	b _080642F8
_080641AE:
	cmp r4, #0
	bne _080641C2
	ldrb r1, [r7]
	movs r0, #2
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08064280
_080641C2:
	ldr r1, _08064278
	mov ip, r1
	ldr r0, [r1]
	ldr r7, _08064270
	ldrb r2, [r7]
	ldr r3, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r3
	ldrb r1, [r4, #1]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _080641E4
	b _080642F8
_080641E4:
	movs r6, #2
	adds r1, r6, #0
	eors r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #1]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080642F8
	ldrb r1, [r4]
	movs r3, #0x7f
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r4]
	mov r1, ip
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
	mov r0, ip
	ldr r2, [r0]
	ldrb r0, [r7]
	adds r1, r6, #0
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	mov r1, ip
	ldr r2, [r1]
	ldrb r0, [r7]
	adds r1, r6, #0
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	ands r4, r1
	strb r4, [r0, #1]
	ldr r4, _0806427C
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	b _080642D6
	.align 2, 0
_08064268: .4byte 0x020205AC
_0806426C: .4byte 0x03005AD0
_08064270: .4byte 0x02023D08
_08064274: .4byte 0x08007141
_08064278: .4byte 0x02024174
_0806427C: .4byte 0x000027F9
_08064280:
	ldr r3, _08064304
	ldr r0, [r3]
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
	beq _080642F8
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
	ldrb r0, [r7]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080642D6
	ldr r4, _08064308
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
_080642D6:
	ldr r0, _08064304
	ldr r0, [r0]
	ldr r3, _0806430C
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #9]
	ldr r1, _08064310
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08064314
	str r1, [r0]
_080642F8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064304: .4byte 0x02024174
_08064308: .4byte 0x000027F9
_0806430C: .4byte 0x02023D08
_08064310: .4byte 0x03005AC0
_08064314: .4byte 0x080640BD
	thumb_func_end sub_08064104

	thumb_func_start sub_08064318
sub_08064318: @ 0x08064318
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	ldr r5, _080644F8
	ldr r0, [r5]
	ldr r4, _080644FC
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
	bne _0806435A
	ldr r0, _08064500
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08064504
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_0806435A:
	ldr r0, _08064508
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08064398
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
	bne _08064398
	ldr r0, _08064500
	adds r0, r2, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08064504
	adds r1, r1, r0
	adds r0, r3, #0
	bl sub_08172CD4
_08064398:
	ldr r3, _080644F8
	ldr r0, [r3]
	ldr r2, _080644FC
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
	mov r8, r3
	mov sb, r2
	cmp r0, #0
	bne _0806447C
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
	bne _0806447C
	ldrb r1, [r6, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0806445E
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806442E
	ldr r0, _08064508
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0806442E
	ldr r4, _0806450C
	mov r1, sb
	ldrb r0, [r1]
	adds r1, r7, #0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08064500
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08064504
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
_0806442E:
	ldr r5, _0806450C
	ldr r4, _080644FC
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08064500
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08064504
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_08076320
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_0806445E:
	ldr r4, _080644F8
	ldr r0, [r4]
	ldr r3, _080644FC
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
	mov r8, r4
	mov sb, r3
_0806447C:
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
	bne _0806453E
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
	bne _0806453E
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806453E
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
	bne _08064520
	ldr r0, _08064508
	ldr r0, [r0]
	movs r1, #0x42
	ands r0, r1
	cmp r0, #0x42
	bne _08064514
	adds r0, r2, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08064520
	ldr r0, _08064510
	bl m4aMPlayContinue
	b _08064520
	.align 2, 0
_080644F8: .4byte 0x02024174
_080644FC: .4byte 0x02023D08
_08064500: .4byte 0x02023D12
_08064504: .4byte 0x020243E8
_08064508: .4byte 0x02022C90
_0806450C: .4byte 0x03005AD0
_08064510: .4byte 0x030074D0
_08064514:
	ldr r0, _080646B4
	ldr r1, _080646B8
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
_08064520:
	ldr r0, _080646BC
	ldr r2, [r0]
	ldr r0, _080646C0
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
_0806453E:
	mov r1, sl
	cmp r1, #0
	bne _08064546
	b _080646A4
_08064546:
	ldr r2, _080646C4
	ldr r0, _080646C8
	ldr r5, _080646C0
	ldrb r3, [r5]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r4, [r0]
	ldr r0, _080646CC
	cmp r4, r0
	beq _08064566
	b _080646A4
_08064566:
	ldr r0, _080646D0
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r4
	beq _0806457C
	b _080646A4
_0806457C:
	ldr r0, _080646D4
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080645C6
	adds r0, r3, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080645C6
	ldr r3, _080646BC
	ldr r0, [r3]
	ldrb r2, [r5]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080646A4
	ldr r0, [r3]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #9]
_080645C6:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806461E
	ldr r0, _080646D4
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0806461E
	ldr r1, _080646C8
	ldr r5, _080646C0
	ldrb r0, [r5]
	movs r4, #2
	eors r0, r4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080646C4
	adds r0, r0, r1
	bl DestroySprite
	ldrb r0, [r5]
	eors r4, r0
	ldr r1, _080646D8
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080646DC
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
_0806461E:
	ldr r1, _080646C8
	ldr r4, _080646C0
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080646C4
	adds r0, r0, r1
	bl DestroySprite
	ldrb r5, [r4]
	ldr r1, _080646D8
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080646DC
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	bl SetBattlerShadowSpriteCallback
	ldr r3, _080646BC
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
	ldr r1, _080646E0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080646E4
	str r1, [r0]
_080646A4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080646B4: .4byte 0x030074D0
_080646B8: .4byte 0x0000FFFF
_080646BC: .4byte 0x02024174
_080646C0: .4byte 0x02023D08
_080646C4: .4byte 0x020205AC
_080646C8: .4byte 0x03005ADC
_080646CC: .4byte 0x08007141
_080646D0: .4byte 0x02023E88
_080646D4: .4byte 0x02022C90
_080646D8: .4byte 0x02023D12
_080646DC: .4byte 0x020243E8
_080646E0: .4byte 0x03005AC0
_080646E4: .4byte 0x08064105
	thumb_func_end sub_08064318

	thumb_func_start sub_080646E8
sub_080646E8: @ 0x080646E8
	push {r4, r5, r6, r7, lr}
	ldr r4, _08064744
	ldr r0, _08064748
	ldr r7, _0806474C
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r2, r0, #2
	adds r0, r4, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _08064750
	cmp r1, r0
	bne _0806479A
	adds r0, r2, r4
	movs r1, #0x24
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806479A
	ldr r6, _08064754
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r4, r3, #1
	adds r0, r4, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r5, [r2]
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _08064760
	ldr r0, _08064758
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0806475C
	adds r1, r1, r0
	adds r0, r3, #0
	bl sub_08172CD4
	b _0806479A
	.align 2, 0
_08064744: .4byte 0x020205AC
_08064748: .4byte 0x02023E88
_0806474C: .4byte 0x02023D08
_08064750: .4byte 0x08007141
_08064754: .4byte 0x02024174
_08064758: .4byte 0x02023D12
_0806475C: .4byte 0x020243E8
_08064760:
	ldrb r1, [r2, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806479A
	movs r0, #0x7f
	ands r0, r5
	strb r0, [r2]
	ldr r0, [r6]
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
	ldr r4, _080647A0
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	bl LinkOpponentBufferExecCompleted
_0806479A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080647A0: .4byte 0x000027F9
	thumb_func_end sub_080646E8

	thumb_func_start LinkOpponentHandleFaintingCry
LinkOpponentHandleFaintingCry: @ 0x080647A4
	push {r4, r5, r6, lr}
	ldr r6, _080647E4
	ldrb r0, [r6]
	ldr r5, _080647E8
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
	beq _080647EC
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r2, #0
	bl sub_080726F4
	b _080647F0
	.align 2, 0
_080647E4: .4byte 0x02023D08
_080647E8: .4byte 0x03005AD0
_080647EC:
	bl LinkOpponentBufferExecCompleted
_080647F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleFaintingCry

	thumb_func_start sub_080647F8
sub_080647F8: @ 0x080647F8
	push {lr}
	ldr r2, _0806482C
	ldr r0, _08064830
	ldr r1, _08064834
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
	bne _08064826
	ldr r0, _08064838
	adds r0, r3, r0
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl LinkOpponentBufferExecCompleted
_08064826:
	pop {r0}
	bx r0
	.align 2, 0
_0806482C: .4byte 0x020205AC
_08064830: .4byte 0x02023E88
_08064834: .4byte 0x02023D08
_08064838: .4byte 0x03005AD0
	thumb_func_end sub_080647F8

	thumb_func_start sub_0806483C
sub_0806483C: @ 0x0806483C
	push {r4, r5, r6, lr}
	ldr r0, _0806489C
	ldr r0, [r0]
	ldr r6, _080648A0
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
	bne _08064896
	ldr r5, _080648A4
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080648A8
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
	ldr r1, _080648AC
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl LinkOpponentBufferExecCompleted
_08064896:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806489C: .4byte 0x02024174
_080648A0: .4byte 0x02023D08
_080648A4: .4byte 0x02023E88
_080648A8: .4byte 0x020205AC
_080648AC: .4byte 0x03005AD0
	thumb_func_end sub_0806483C

	thumb_func_start sub_080648B0
sub_080648B0: @ 0x080648B0
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080648C2
	bl LinkOpponentBufferExecCompleted
_080648C2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080648B0

	thumb_func_start sub_080648C8
sub_080648C8: @ 0x080648C8
	push {r4, lr}
	ldr r1, _08064904
	ldr r0, _08064908
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _0806490C
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _08064914
	movs r3, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08064910
	strb r3, [r0]
	bl LinkOpponentBufferExecCompleted
	b _0806493E
	.align 2, 0
_08064904: .4byte 0x02023E88
_08064908: .4byte 0x02023D08
_0806490C: .4byte 0x020205AC
_08064910: .4byte 0x0202415D
_08064914:
	ldrh r0, [r4, #0x30]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08064938
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
_08064938:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_0806493E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080648C8

	thumb_func_start sub_08064944
sub_08064944: @ 0x08064944
	push {r4, lr}
	ldr r2, _08064998
	ldr r0, _0806499C
	ldr r4, _080649A0
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _080649A4
	cmp r1, r0
	bne _08064990
	ldr r0, _080649A8
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08064984
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
_08064984:
	ldr r0, _080649AC
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _080649B0
	str r0, [r1]
_08064990:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064998: .4byte 0x020205AC
_0806499C: .4byte 0x03005AD0
_080649A0: .4byte 0x02023D08
_080649A4: .4byte 0x08007141
_080649A8: .4byte 0x02024174
_080649AC: .4byte 0x03005AC0
_080649B0: .4byte 0x080649B5
	thumb_func_end sub_08064944

	thumb_func_start LinkOpponentHandleGetMonData
LinkOpponentHandleGetMonData: @ 0x080649B4
	push {r4, lr}
	ldr r0, _08064A14
	ldr r0, [r0]
	ldr r4, _08064A18
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
	bne _08064A0E
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08064A0E
	ldr r2, _08064A1C
	ldr r1, _08064A20
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08064A24
	cmp r1, r0
	beq _080649FE
	ldr r0, _08064A28
	cmp r1, r0
	bne _08064A0E
_080649FE:
	ldr r0, _08064A2C
	ldr r1, _08064A30
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	bl LinkOpponentBufferExecCompleted
_08064A0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064A14: .4byte 0x02024174
_08064A18: .4byte 0x02023D08
_08064A1C: .4byte 0x020205AC
_08064A20: .4byte 0x02023E88
_08064A24: .4byte 0x08007141
_08064A28: .4byte 0x080394FD
_08064A2C: .4byte 0x030074D0
_08064A30: .4byte 0x0000FFFF
	thumb_func_end LinkOpponentHandleGetMonData

	thumb_func_start sub_08064A34
sub_08064A34: @ 0x08064A34
	push {r4, r5, r6, r7, lr}
	ldr r4, _08064AF8
	ldr r0, [r4]
	ldr r5, _08064AFC
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
	beq _08064AF0
	ldr r7, _08064B00
	ldr r6, _08064B04
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08064B08
	cmp r1, r0
	bne _08064AF0
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
	ldr r4, _08064B0C
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
	ldr r4, _08064B10
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08064B14
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08064B18
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
	ldr r1, _08064B1C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08064B20
	str r1, [r0]
_08064AF0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064AF8: .4byte 0x02024174
_08064AFC: .4byte 0x02023D08
_08064B00: .4byte 0x020205AC
_08064B04: .4byte 0x02023E88
_08064B08: .4byte 0x08007141
_08064B0C: .4byte 0x000027F9
_08064B10: .4byte 0x03005AD0
_08064B14: .4byte 0x02023D12
_08064B18: .4byte 0x020243E8
_08064B1C: .4byte 0x03005AC0
_08064B20: .4byte 0x08064945
	thumb_func_end sub_08064A34

	thumb_func_start sub_08064B24
sub_08064B24: @ 0x08064B24
	push {r4, r5, r6, lr}
	ldr r6, _08064BC8
	ldr r0, [r6]
	ldr r5, _08064BCC
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
	bne _08064B56
	ldr r0, _08064BD0
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08064BD4
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_08064B56:
	ldr r4, _08064BD8
	ldr r0, _08064BDC
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
	ldr r0, _08064BE0
	cmp r1, r0
	bne _08064BC0
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
	bne _08064BC0
	adds r0, r3, r4
	bl DestroySprite
	ldrb r4, [r5]
	ldr r1, _08064BD0
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08064BD4
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
	ldr r1, _08064BE4
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08064BE8
	str r1, [r0]
_08064BC0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064BC8: .4byte 0x02024174
_08064BCC: .4byte 0x02023D08
_08064BD0: .4byte 0x02023D12
_08064BD4: .4byte 0x020243E8
_08064BD8: .4byte 0x020205AC
_08064BDC: .4byte 0x03005ADC
_08064BE0: .4byte 0x08007141
_08064BE4: .4byte 0x03005AC0
_08064BE8: .4byte 0x08064A35
	thumb_func_end sub_08064B24

	thumb_func_start sub_08064BEC
sub_08064BEC: @ 0x08064BEC
	push {lr}
	ldr r0, _08064C14
	ldr r2, [r0]
	ldr r0, _08064C18
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
	bne _08064C0E
	bl LinkOpponentBufferExecCompleted
_08064C0E:
	pop {r0}
	bx r0
	.align 2, 0
_08064C14: .4byte 0x02024174
_08064C18: .4byte 0x02023D08
	thumb_func_end sub_08064BEC

	thumb_func_start LinkOpponentHandleDrawPartyStatusSummary
LinkOpponentHandleDrawPartyStatusSummary: @ 0x08064C1C
	push {lr}
	ldr r0, _08064C44
	ldr r2, [r0]
	ldr r0, _08064C48
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
	bne _08064C3E
	bl LinkOpponentBufferExecCompleted
_08064C3E:
	pop {r0}
	bx r0
	.align 2, 0
_08064C44: .4byte 0x02024174
_08064C48: .4byte 0x02023D08
	thumb_func_end LinkOpponentHandleDrawPartyStatusSummary

	thumb_func_start LinkOpponentBufferExecCompleted
LinkOpponentBufferExecCompleted: @ 0x08064C4C
	push {r4, lr}
	sub sp, #4
	ldr r1, _08064C8C
	ldr r4, _08064C90
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08064C94
	str r1, [r0]
	ldr r0, _08064C98
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08064CA0
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, #2
	movs r1, #4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _08064C9C
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r1
	movs r1, #0x38
	strb r1, [r0]
	b _08064CB2
	.align 2, 0
_08064C8C: .4byte 0x03005AC0
_08064C90: .4byte 0x02023D08
_08064C94: .4byte 0x08063F95
_08064C98: .4byte 0x02022C90
_08064C9C: .4byte 0x02022D08
_08064CA0:
	ldr r2, _08064CBC
	ldr r1, _08064CC0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_08064CB2:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064CBC: .4byte 0x02023D0C
_08064CC0: .4byte 0x082FACB4
	thumb_func_end LinkOpponentBufferExecCompleted

	thumb_func_start sub_08064CC4
sub_08064CC4: @ 0x08064CC4
	push {r4, r5, r6, lr}
	sub sp, #0x100
	movs r6, #0
	ldr r1, _08064CF0
	ldr r0, _08064CF4
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08064CFC
	ldr r0, _08064CF8
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl CopyLinkOpponentMonData
	adds r6, r0, #0
	b _08064D1E
	.align 2, 0
_08064CF0: .4byte 0x02022D08
_08064CF4: .4byte 0x02023D08
_08064CF8: .4byte 0x02023D12
_08064CFC:
	ldrb r4, [r1]
	movs r5, #0
_08064D00:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08064D16
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	adds r1, r2, r6
	bl CopyLinkOpponentMonData
	adds r6, r6, r0
_08064D16:
	lsrs r4, r4, #1
	adds r5, #1
	cmp r5, #5
	ble _08064D00
_08064D1E:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl LinkOpponentBufferExecCompleted
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08064CC4

	thumb_func_start CopyLinkOpponentMonData
CopyLinkOpponentMonData: @ 0x08064D38
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
	ldr r2, _08064D6C
	ldr r3, _08064D70
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _08064D62
	bl _080654CE
_08064D62:
	lsls r0, r0, #2
	ldr r1, _08064D74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08064D6C: .4byte 0x02022D08
_08064D70: .4byte 0x02023D08
_08064D74: .4byte 0x08064D78
_08064D78: @ jump table
	.4byte _08064E68 @ case 0
	.4byte _0806508C @ case 1
	.4byte _0806509C @ case 2
	.4byte _080650AC @ case 3
	.4byte _08065114 @ case 4
	.4byte _08065114 @ case 5
	.4byte _08065114 @ case 6
	.4byte _08065114 @ case 7
	.4byte _08065130 @ case 8
	.4byte _0806516C @ case 9
	.4byte _0806516C @ case 10
	.4byte _0806516C @ case 11
	.4byte _0806516C @ case 12
	.4byte _080654CE @ case 13
	.4byte _080654CE @ case 14
	.4byte _080654CE @ case 15
	.4byte _080654CE @ case 16
	.4byte _08065188 @ case 17
	.4byte _08065198 @ case 18
	.4byte _080651C8 @ case 19
	.4byte _080651D8 @ case 20
	.4byte _080651E8 @ case 21
	.4byte _080651F8 @ case 22
	.4byte _08065208 @ case 23
	.4byte _08065218 @ case 24
	.4byte _08065228 @ case 25
	.4byte _08065238 @ case 26
	.4byte _08065248 @ case 27
	.4byte _08065258 @ case 28
	.4byte _08065268 @ case 29
	.4byte _08065278 @ case 30
	.4byte _08065288 @ case 31
	.4byte _080652D8 @ case 32
	.4byte _080652E8 @ case 33
	.4byte _080652F8 @ case 34
	.4byte _08065308 @ case 35
	.4byte _08065318 @ case 36
	.4byte _08065328 @ case 37
	.4byte _08065338 @ case 38
	.4byte _08065348 @ case 39
	.4byte _08065358 @ case 40
	.4byte _0806538C @ case 41
	.4byte _0806539C @ case 42
	.4byte _080653AC @ case 43
	.4byte _080653BC @ case 44
	.4byte _080653CC @ case 45
	.4byte _080653DC @ case 46
	.4byte _080653EC @ case 47
	.4byte _080653FC @ case 48
	.4byte _0806541C @ case 49
	.4byte _0806542C @ case 50
	.4byte _0806543C @ case 51
	.4byte _0806544C @ case 52
	.4byte _0806545C @ case 53
	.4byte _0806546C @ case 54
	.4byte _0806547C @ case 55
	.4byte _0806548C @ case 56
	.4byte _0806549C @ case 57
	.4byte _080654AC @ case 58
	.4byte _080654BC @ case 59
_08064E68:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0806507C
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
_08064EB4:
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
	ble _08064EB4
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0806507C
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
	ldr r1, _08065080
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
	ldr r2, _08065084
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
	ldr r1, _08065088
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
_0806506C:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x57
	bls _0806506C
	b _080654CE
	.align 2, 0
_0806507C: .4byte 0x020243E8
_08065080: .4byte 0xFFFFFC1F
_08065084: .4byte 0xFFF07FFF
_08065088: .4byte 0xFFFFFE0F
_0806508C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065098
	adds r0, r0, r1
	movs r1, #0xb
	b _08065406
	.align 2, 0
_08065098: .4byte 0x020243E8
_0806509C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080650A8
	adds r0, r0, r1
	movs r1, #0xc
	b _08065406
	.align 2, 0
_080650A8: .4byte 0x020243E8
_080650AC:
	movs r6, #0
	add r2, sp, #0x58
	mov sb, r2
	add r0, sp, #0x60
	mov sl, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08065110
	adds r4, r1, r0
	mov r8, sb
_080650C2:
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
	ble _080650C2
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065110
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	mov r1, sb
	strb r0, [r1, #0xc]
	mov r2, sb
	movs r6, #0
_08065100:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0xf
	bls _08065100
	b _080654CE
	.align 2, 0
_08065110: .4byte 0x020243E8
_08065114:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806512C
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #9
	b _08065406
	.align 2, 0
_0806512C: .4byte 0x020243E8
_08065130:
	movs r6, #0
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r2, _08065168
	mov r8, r2
_0806513C:
	adds r1, r6, #0
	adds r1, #0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	cmp r6, #3
	ble _0806513C
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065168
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	b _080654CE
	.align 2, 0
_08065168: .4byte 0x020243E8
_0806516C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065184
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #8
	b _080654C6
	.align 2, 0
_08065184: .4byte 0x020243E8
_08065188:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065194
	adds r0, r0, r1
	movs r1, #1
	b _080651A2
	.align 2, 0
_08065194: .4byte 0x020243E8
_08065198:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080651C4
	adds r0, r0, r1
	movs r1, #0x19
_080651A2:
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
	b _080654CE
	.align 2, 0
_080651C4: .4byte 0x020243E8
_080651C8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080651D4
	adds r0, r0, r1
	movs r1, #0x1a
	b _080654C6
	.align 2, 0
_080651D4: .4byte 0x020243E8
_080651D8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080651E4
	adds r0, r0, r1
	movs r1, #0x1b
	b _080654C6
	.align 2, 0
_080651E4: .4byte 0x020243E8
_080651E8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080651F4
	adds r0, r0, r1
	movs r1, #0x1c
	b _080654C6
	.align 2, 0
_080651F4: .4byte 0x020243E8
_080651F8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065204
	adds r0, r0, r1
	movs r1, #0x1d
	b _080654C6
	.align 2, 0
_08065204: .4byte 0x020243E8
_08065208:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065214
	adds r0, r0, r1
	movs r1, #0x1e
	b _080654C6
	.align 2, 0
_08065214: .4byte 0x020243E8
_08065218:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065224
	adds r0, r0, r1
	movs r1, #0x1f
	b _080654C6
	.align 2, 0
_08065224: .4byte 0x020243E8
_08065228:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065234
	adds r0, r0, r1
	movs r1, #0x20
	b _080654C6
	.align 2, 0
_08065234: .4byte 0x020243E8
_08065238:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065244
	adds r0, r0, r1
	movs r1, #0x22
	b _080654C6
	.align 2, 0
_08065244: .4byte 0x020243E8
_08065248:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065254
	adds r0, r0, r1
	movs r1, #0x23
	b _080654C6
	.align 2, 0
_08065254: .4byte 0x020243E8
_08065258:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065264
	adds r0, r0, r1
	movs r1, #0x24
	b _080654C6
	.align 2, 0
_08065264: .4byte 0x020243E8
_08065268:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065274
	adds r0, r0, r1
	movs r1, #0x25
	b _080654C6
	.align 2, 0
_08065274: .4byte 0x020243E8
_08065278:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065284
	adds r0, r0, r1
	movs r1, #0x26
	b _080654C6
	.align 2, 0
_08065284: .4byte 0x020243E8
_08065288:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _080652D4
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
	b _080654CE
	.align 2, 0
_080652D4: .4byte 0x020243E8
_080652D8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080652E4
	adds r0, r0, r1
	movs r1, #0x27
	b _080654C6
	.align 2, 0
_080652E4: .4byte 0x020243E8
_080652E8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080652F4
	adds r0, r0, r1
	movs r1, #0x28
	b _080654C6
	.align 2, 0
_080652F4: .4byte 0x020243E8
_080652F8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065304
	adds r0, r0, r1
	movs r1, #0x29
	b _080654C6
	.align 2, 0
_08065304: .4byte 0x020243E8
_08065308:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065314
	adds r0, r0, r1
	movs r1, #0x2a
	b _080654C6
	.align 2, 0
_08065314: .4byte 0x020243E8
_08065318:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065324
	adds r0, r0, r1
	movs r1, #0x2b
	b _080654C6
	.align 2, 0
_08065324: .4byte 0x020243E8
_08065328:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065334
	adds r0, r0, r1
	movs r1, #0x2c
	b _080654C6
	.align 2, 0
_08065334: .4byte 0x020243E8
_08065338:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065344
	adds r0, r0, r1
	movs r1, #0
	b _08065362
	.align 2, 0
_08065344: .4byte 0x020243E8
_08065348:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065354
	adds r0, r0, r1
	movs r1, #9
	b _08065406
	.align 2, 0
_08065354: .4byte 0x020243E8
_08065358:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065388
	adds r0, r0, r1
	movs r1, #0x37
_08065362:
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
	b _080654CE
	.align 2, 0
_08065388: .4byte 0x020243E8
_0806538C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065398
	adds r0, r0, r1
	movs r1, #0x38
	b _080654C6
	.align 2, 0
_08065398: .4byte 0x020243E8
_0806539C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080653A8
	adds r0, r0, r1
	movs r1, #0x39
	b _08065406
	.align 2, 0
_080653A8: .4byte 0x020243E8
_080653AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080653B8
	adds r0, r0, r1
	movs r1, #0x3a
	b _08065406
	.align 2, 0
_080653B8: .4byte 0x020243E8
_080653BC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080653C8
	adds r0, r0, r1
	movs r1, #0x3b
	b _08065406
	.align 2, 0
_080653C8: .4byte 0x020243E8
_080653CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080653D8
	adds r0, r0, r1
	movs r1, #0x3c
	b _08065406
	.align 2, 0
_080653D8: .4byte 0x020243E8
_080653DC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080653E8
	adds r0, r0, r1
	movs r1, #0x3d
	b _08065406
	.align 2, 0
_080653E8: .4byte 0x020243E8
_080653EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080653F8
	adds r0, r0, r1
	movs r1, #0x3e
	b _08065406
	.align 2, 0
_080653F8: .4byte 0x020243E8
_080653FC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065418
	adds r0, r0, r1
	movs r1, #0x3f
_08065406:
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strb r0, [r7]
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r6, #2
	b _080654CE
	.align 2, 0
_08065418: .4byte 0x020243E8
_0806541C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065428
	adds r0, r0, r1
	movs r1, #0x16
	b _080654C6
	.align 2, 0
_08065428: .4byte 0x020243E8
_0806542C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065438
	adds r0, r0, r1
	movs r1, #0x17
	b _080654C6
	.align 2, 0
_08065438: .4byte 0x020243E8
_0806543C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065448
	adds r0, r0, r1
	movs r1, #0x18
	b _080654C6
	.align 2, 0
_08065448: .4byte 0x020243E8
_0806544C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065458
	adds r0, r0, r1
	movs r1, #0x21
	b _080654C6
	.align 2, 0
_08065458: .4byte 0x020243E8
_0806545C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065468
	adds r0, r0, r1
	movs r1, #0x2f
	b _080654C6
	.align 2, 0
_08065468: .4byte 0x020243E8
_0806546C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065478
	adds r0, r0, r1
	movs r1, #0x30
	b _080654C6
	.align 2, 0
_08065478: .4byte 0x020243E8
_0806547C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065488
	adds r0, r0, r1
	movs r1, #0x32
	b _080654C6
	.align 2, 0
_08065488: .4byte 0x020243E8
_0806548C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065498
	adds r0, r0, r1
	movs r1, #0x33
	b _080654C6
	.align 2, 0
_08065498: .4byte 0x020243E8
_0806549C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080654A8
	adds r0, r0, r1
	movs r1, #0x34
	b _080654C6
	.align 2, 0
_080654A8: .4byte 0x020243E8
_080654AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080654B8
	adds r0, r0, r1
	movs r1, #0x35
	b _080654C6
	.align 2, 0
_080654B8: .4byte 0x020243E8
_080654BC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080654E0
	adds r0, r0, r1
	movs r1, #0x36
_080654C6:
	bl GetMonData
	strb r0, [r7]
	movs r6, #1
_080654CE:
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
_080654E0: .4byte 0x020243E8
	thumb_func_end CopyLinkOpponentMonData

	thumb_func_start LinkOpponentHandleGetRawMonData
LinkOpponentHandleGetRawMonData: @ 0x080654E4
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleGetRawMonData

	thumb_func_start LinkOpponentHandleSetMonData
LinkOpponentHandleSetMonData: @ 0x080654F0
	push {r4, r5, lr}
	ldr r1, _08065514
	ldr r0, _08065518
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08065520
	ldr r0, _0806551C
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl SetLinkOpponentMonData
	b _0806553E
	.align 2, 0
_08065514: .4byte 0x02022D08
_08065518: .4byte 0x02023D08
_0806551C: .4byte 0x02023D12
_08065520:
	ldrb r4, [r1]
	movs r5, #0
_08065524:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08065532
	adds r0, r5, #0
	bl SetLinkOpponentMonData
_08065532:
	lsrs r4, r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08065524
_0806553E:
	bl LinkOpponentBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end LinkOpponentHandleSetMonData

	thumb_func_start SetLinkOpponentMonData
SetLinkOpponentMonData: @ 0x08065548
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, _08065580
	ldrb r0, [r3]
	lsls r0, r0, #9
	ldr r2, _08065584
	adds r4, r0, r2
	adds r7, r4, #0
	subs r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r6, r3, #0
	adds r3, r2, #0
	cmp r0, #0x3b
	bls _08065576
	bl _08065E54
_08065576:
	lsls r0, r0, #2
	ldr r1, _08065588
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08065580: .4byte 0x02023D08
_08065584: .4byte 0x02022D0B
_08065588: .4byte 0x0806558C
_0806558C: @ jump table
	.4byte _0806567C @ case 0
	.4byte _08065814 @ case 1
	.4byte _08065830 @ case 2
	.4byte _0806584C @ case 3
	.4byte _080658A0 @ case 4
	.4byte _080658A0 @ case 5
	.4byte _080658A0 @ case 6
	.4byte _080658A0 @ case 7
	.4byte _080658C0 @ case 8
	.4byte _08065928 @ case 9
	.4byte _08065928 @ case 10
	.4byte _08065928 @ case 11
	.4byte _08065928 @ case 12
	.4byte _08065E54 @ case 13
	.4byte _08065E54 @ case 14
	.4byte _08065E54 @ case 15
	.4byte _08065E54 @ case 16
	.4byte _08065950 @ case 17
	.4byte _0806596C @ case 18
	.4byte _08065988 @ case 19
	.4byte _080659A4 @ case 20
	.4byte _080659C0 @ case 21
	.4byte _080659DC @ case 22
	.4byte _080659F8 @ case 23
	.4byte _08065A14 @ case 24
	.4byte _08065A30 @ case 25
	.4byte _08065A4C @ case 26
	.4byte _08065A68 @ case 27
	.4byte _08065A84 @ case 28
	.4byte _08065AA0 @ case 29
	.4byte _08065ABC @ case 30
	.4byte _08065AD8 @ case 31
	.4byte _08065B4C @ case 32
	.4byte _08065B68 @ case 33
	.4byte _08065B84 @ case 34
	.4byte _08065BA0 @ case 35
	.4byte _08065BBC @ case 36
	.4byte _08065BD8 @ case 37
	.4byte _08065BF4 @ case 38
	.4byte _08065C10 @ case 39
	.4byte _08065C2C @ case 40
	.4byte _08065C48 @ case 41
	.4byte _08065C64 @ case 42
	.4byte _08065C80 @ case 43
	.4byte _08065C9C @ case 44
	.4byte _08065CB8 @ case 45
	.4byte _08065CD4 @ case 46
	.4byte _08065CF0 @ case 47
	.4byte _08065D0C @ case 48
	.4byte _08065D28 @ case 49
	.4byte _08065D44 @ case 50
	.4byte _08065D60 @ case 51
	.4byte _08065D7C @ case 52
	.4byte _08065D98 @ case 53
	.4byte _08065DB4 @ case 54
	.4byte _08065DD0 @ case 55
	.4byte _08065DEC @ case 56
	.4byte _08065E08 @ case 57
	.4byte _08065E24 @ case 58
	.4byte _08065E40 @ case 59
_0806567C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08065810
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
_080656E2:
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
	ble _080656E2
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08065810
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
	b _08065E54
	.align 2, 0
_08065810: .4byte 0x020243E8
_08065814:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806582C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0xb
	bl SetMonData
	b _08065E54
	.align 2, 0
_0806582C: .4byte 0x020243E8
_08065830:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065848
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0xc
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065848: .4byte 0x020243E8
_0806584C:
	movs r0, #0
	mov r8, r0
	movs r0, #0xc
	adds r0, r0, r4
	mov sb, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0806589C
	adds r7, r1, r0
	adds r6, r4, #0
	adds r6, #8
_08065864:
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
	ble _08065864
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0806589C
	adds r0, r0, r1
	movs r1, #0x15
	mov r2, sb
	bl SetMonData
	b _08065E54
	.align 2, 0
_0806589C: .4byte 0x020243E8
_080658A0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080658B8
	adds r0, r0, r1
	ldr r3, _080658BC
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #9
	b _0806593E
	.align 2, 0
_080658B8: .4byte 0x020243E8
_080658BC: .4byte 0x02022D08
_080658C0:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08065924
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
	b _08065E54
	.align 2, 0
_08065924: .4byte 0x020243E8
_08065928:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065948
	adds r0, r0, r1
	ldr r3, _0806594C
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #8
_0806593E:
	adds r3, #3
	adds r2, r2, r3
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065948: .4byte 0x020243E8
_0806594C: .4byte 0x02022D08
_08065950:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065968
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #1
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065968: .4byte 0x020243E8
_0806596C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065984
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x19
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065984: .4byte 0x020243E8
_08065988:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080659A0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1a
	bl SetMonData
	b _08065E54
	.align 2, 0
_080659A0: .4byte 0x020243E8
_080659A4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080659BC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1b
	bl SetMonData
	b _08065E54
	.align 2, 0
_080659BC: .4byte 0x020243E8
_080659C0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080659D8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1c
	bl SetMonData
	b _08065E54
	.align 2, 0
_080659D8: .4byte 0x020243E8
_080659DC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _080659F4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1d
	bl SetMonData
	b _08065E54
	.align 2, 0
_080659F4: .4byte 0x020243E8
_080659F8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065A10
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1e
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065A10: .4byte 0x020243E8
_08065A14:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065A2C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1f
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065A2C: .4byte 0x020243E8
_08065A30:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065A48
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x20
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065A48: .4byte 0x020243E8
_08065A4C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065A64
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x22
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065A64: .4byte 0x020243E8
_08065A68:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065A80
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x23
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065A80: .4byte 0x020243E8
_08065A84:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065A9C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x24
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065A9C: .4byte 0x020243E8
_08065AA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065AB8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x25
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065AB8: .4byte 0x020243E8
_08065ABC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065AD4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x26
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065AD4: .4byte 0x020243E8
_08065AD8:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08065B48
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
	b _08065BE6
	.align 2, 0
_08065B48: .4byte 0x020243E8
_08065B4C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065B64
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x27
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065B64: .4byte 0x020243E8
_08065B68:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065B80
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x28
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065B80: .4byte 0x020243E8
_08065B84:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065B9C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x29
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065B9C: .4byte 0x020243E8
_08065BA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065BB8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x2a
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065BB8: .4byte 0x020243E8
_08065BBC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065BD4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x2b
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065BD4: .4byte 0x020243E8
_08065BD8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065BF0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
_08065BE6:
	movs r1, #0x2c
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065BF0: .4byte 0x020243E8
_08065BF4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065C0C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065C0C: .4byte 0x020243E8
_08065C10:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065C28
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #9
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065C28: .4byte 0x020243E8
_08065C2C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065C44
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x37
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065C44: .4byte 0x020243E8
_08065C48:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065C60
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x38
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065C60: .4byte 0x020243E8
_08065C64:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065C7C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x39
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065C7C: .4byte 0x020243E8
_08065C80:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065C98
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3a
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065C98: .4byte 0x020243E8
_08065C9C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065CB4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3b
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065CB4: .4byte 0x020243E8
_08065CB8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065CD0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3c
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065CD0: .4byte 0x020243E8
_08065CD4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065CEC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3d
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065CEC: .4byte 0x020243E8
_08065CF0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065D08
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3e
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065D08: .4byte 0x020243E8
_08065D0C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065D24
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3f
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065D24: .4byte 0x020243E8
_08065D28:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065D40
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x16
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065D40: .4byte 0x020243E8
_08065D44:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065D5C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x17
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065D5C: .4byte 0x020243E8
_08065D60:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065D78
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x18
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065D78: .4byte 0x020243E8
_08065D7C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065D94
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x21
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065D94: .4byte 0x020243E8
_08065D98:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065DB0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x2f
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065DB0: .4byte 0x020243E8
_08065DB4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065DCC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x30
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065DCC: .4byte 0x020243E8
_08065DD0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065DE8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x32
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065DE8: .4byte 0x020243E8
_08065DEC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065E04
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x33
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065E04: .4byte 0x020243E8
_08065E08:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065E20
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x34
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065E20: .4byte 0x020243E8
_08065E24:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065E3C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x35
	bl SetMonData
	b _08065E54
	.align 2, 0
_08065E3C: .4byte 0x020243E8
_08065E40:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08065E64
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x36
	bl SetMonData
_08065E54:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065E64: .4byte 0x020243E8
	thumb_func_end SetLinkOpponentMonData

	thumb_func_start LinkOpponentHandleSetRawMonData
LinkOpponentHandleSetRawMonData: @ 0x08065E68
	push {r4, r5, r6, r7, lr}
	ldr r1, _08065ECC
	ldr r7, _08065ED0
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r4, _08065ED4
	lsls r2, r2, #9
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _08065ED8
	adds r0, r0, r1
	adds r5, r3, r0
	movs r3, #0
	adds r0, r4, #2
	adds r2, r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bhs _08065EC0
	adds r6, r4, #0
	adds r2, r7, #0
	adds r4, r0, #0
_08065E9E:
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
	blo _08065E9E
_08065EC0:
	bl LinkOpponentBufferExecCompleted
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065ECC: .4byte 0x02023D12
_08065ED0: .4byte 0x02023D08
_08065ED4: .4byte 0x02022D08
_08065ED8: .4byte 0x020243E8
	thumb_func_end LinkOpponentHandleSetRawMonData

	thumb_func_start LinkOpponentHandleLoadMonSprite
LinkOpponentHandleLoadMonSprite: @ 0x08065EDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _08066004
	ldr r6, _08066008
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	movs r1, #0x64
	mov sl, r1
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	ldr r1, _0806600C
	mov sb, r1
	add r0, sb
	movs r1, #0xb
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	add r0, sb
	bl BattleLoadOpponentMonSpriteGfx
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _08066010
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
	ldr r4, _08066014
	ldrb r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r5, _08066018
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0806601C
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
	ldr r1, _08066020
	adds r2, r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldrb r4, [r6]
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sb
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
	ldr r1, _08066024
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066028
	str r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066004: .4byte 0x02023D12
_08066008: .4byte 0x02023D08
_0806600C: .4byte 0x020243E8
_08066010: .4byte 0x02024640
_08066014: .4byte 0x02023E88
_08066018: .4byte 0x020205AC
_0806601C: .4byte 0x0000FF10
_08066020: .4byte 0x02024188
_08066024: .4byte 0x03005AC0
_08066028: .4byte 0x080646E9
	thumb_func_end LinkOpponentHandleLoadMonSprite

	thumb_func_start LinkOpponentHandleSwitchInAnim
LinkOpponentHandleSwitchInAnim: @ 0x0806602C
	push {r4, lr}
	ldr r1, _08066064
	ldr r4, _08066068
	ldrb r0, [r4]
	lsls r2, r0, #1
	adds r2, r2, r1
	ldr r3, _0806606C
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
	bl sub_08066078
	ldr r1, _08066070
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066074
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066064: .4byte 0x02023D12
_08066068: .4byte 0x02023D08
_0806606C: .4byte 0x02022D08
_08066070: .4byte 0x03005AC0
_08066074: .4byte 0x08064B25
	thumb_func_end LinkOpponentHandleSwitchInAnim

	thumb_func_start sub_08066078
sub_08066078: @ 0x08066078
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
	ldr r0, _080661E0
	lsls r4, r6, #1
	adds r4, r4, r0
	ldr r0, _080661E4
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
	ldr r5, _080661E8
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _080661EC
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _080661F0
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
	ldr r0, _080661F4
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
	ldr r4, _080661F8
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _080661FC
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
	ldr r1, _08066200
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
	ldr r1, _08066204
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
_080661E0: .4byte 0x02023D12
_080661E4: .4byte 0x02022D08
_080661E8: .4byte 0x020243E8
_080661EC: .4byte 0x0805D331
_080661F0: .4byte 0x03005ADC
_080661F4: .4byte 0x02024640
_080661F8: .4byte 0x02023E88
_080661FC: .4byte 0x020205AC
_08066200: .4byte 0x02024188
_08066204: .4byte 0x08007141
	thumb_func_end sub_08066078

	thumb_func_start LinkOpponentHandleReturnMonToBall
LinkOpponentHandleReturnMonToBall: @ 0x08066208
	push {r4, r5, r6, lr}
	ldr r1, _0806623C
	ldr r6, _08066240
	ldrb r2, [r6]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _08066250
	ldr r0, _08066244
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r3, [r0, #4]
	ldr r1, _08066248
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0806624C
	str r1, [r0]
	b _0806628C
	.align 2, 0
_0806623C: .4byte 0x02022D08
_08066240: .4byte 0x02023D08
_08066244: .4byte 0x02024174
_08066248: .4byte 0x03005AC0
_0806624C: .4byte 0x080662A1
_08066250:
	ldr r5, _08066294
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08066298
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
	ldr r1, _0806629C
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl LinkOpponentBufferExecCompleted
_0806628C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066294: .4byte 0x02023E88
_08066298: .4byte 0x020205AC
_0806629C: .4byte 0x03005AD0
	thumb_func_end LinkOpponentHandleReturnMonToBall

	thumb_func_start sub_080662A0
sub_080662A0: @ 0x080662A0
	push {r4, r5, r6, lr}
	ldr r6, _080662C0
	ldr r4, [r6]
	ldr r5, _080662C4
	ldrb r2, [r5]
	ldr r1, [r4, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _080662C8
	cmp r0, #1
	beq _080662F6
	b _0806631E
	.align 2, 0
_080662C0: .4byte 0x02024174
_080662C4: .4byte 0x02023D08
_080662C8:
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080662E2
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_080662E2:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _0806631E
_080662F6:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0806631E
	strb r0, [r3, #4]
	ldrb r2, [r5]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #2
	bl InitAndLaunchSpecialAnimation
	ldr r1, _08066324
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066328
	str r1, [r0]
_0806631E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066324: .4byte 0x03005AC0
_08066328: .4byte 0x0806483D
	thumb_func_end sub_080662A0

	thumb_func_start LinkOpponentHandleDrawTrainerPic
LinkOpponentHandleDrawTrainerPic: @ 0x0806632C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _0806636C
	ldr r0, [r4]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08066424
	ldr r5, _08066370
	ldrb r0, [r5]
	bl GetBattlerPosition
	movs r1, #2
	ands r1, r0
	movs r7, #0xc8
	cmp r1, #0
	beq _08066354
	movs r7, #0x98
_08066354:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806638C
	ldrb r0, [r5]
	cmp r0, #1
	bne _08066378
	ldr r0, _08066374
	b _0806637A
	.align 2, 0
_0806636C: .4byte 0x02022C90
_08066370: .4byte 0x02023D08
_08066374: .4byte 0x0203886A
_08066378:
	ldr r0, _08066388
_0806637A:
	ldrh r0, [r0]
	bl GetFrontierTrainerFrontSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08066530
	.align 2, 0
_08066388: .4byte 0x0203886C
_0806638C:
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	ldr r6, _080663D4
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r4, #0xff
	ldrb r0, [r1]
	cmp r0, #4
	beq _080663BC
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #5
	bne _080663D8
_080663BC:
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	bne _0806648E
	b _080664A0
	.align 2, 0
_080663D4: .4byte 0x020226A0
_080663D8:
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #2
	beq _08066406
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, #1
	bne _0806641C
_08066406:
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	bne _080664FA
	b _08066508
_0806641C:
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	b _0806651E
_08066424:
	movs r7, #0xb0
	ldr r0, _08066438
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r1, r0
	bne _0806643C
	bl sub_08068688
	b _0806652C
	.align 2, 0
_08066438: .4byte 0x0203886A
_0806643C:
	bl GetMultiplayerId
	ldr r6, _08066498
	movs r5, #1
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r4, #0xff
	ldrb r0, [r1]
	cmp r0, #4
	beq _08066476
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #5
	bne _080664AC
_08066476:
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _080664A0
_0806648E:
	ldr r0, _0806649C
	adds r0, #0x4f
	ldrb r0, [r0]
	b _08066530
	.align 2, 0
_08066498: .4byte 0x020226A0
_0806649C: .4byte 0x082EFF00
_080664A0:
	ldr r0, _080664A8
	adds r0, #0x4e
	ldrb r0, [r0]
	b _08066530
	.align 2, 0
_080664A8: .4byte 0x082EFF00
_080664AC:
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #2
	beq _080664E2
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, #1
	bne _08066514
_080664E2:
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _08066508
_080664FA:
	ldr r0, _08066504
	adds r0, #0x51
	ldrb r0, [r0]
	b _08066530
	.align 2, 0
_08066504: .4byte 0x082EFF00
_08066508:
	ldr r0, _08066510
	adds r0, #0x50
	ldrb r0, [r0]
	b _08066530
	.align 2, 0
_08066510: .4byte 0x082EFF00
_08066514:
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0806651E:
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r1, #0x13]
	bl PlayerGenderToFrontTrainerPicId
_0806652C:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066530:
	mov r8, r0
	ldr r5, _08066614
	ldrb r1, [r5]
	bl DecompressTrainerFrontPic
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r6, _08066618
	mov sb, r7
	ldr r1, _0806661C
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
	ldr r6, _08066620
	ldrb r1, [r5]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r4, _08066624
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08066628
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
	ldr r1, _0806662C
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
	ldr r1, _08066630
	str r1, [r0]
	ldr r1, _08066634
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066638
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066614: .4byte 0x02023D08
_08066618: .4byte 0x02024640
_0806661C: .4byte 0x082D8D70
_08066620: .4byte 0x02023E88
_08066624: .4byte 0x020205AC
_08066628: .4byte 0x0000FF10
_0806662C: .4byte 0x082D91CC
_08066630: .4byte 0x0805D3C9
_08066634: .4byte 0x03005AC0
_08066638: .4byte 0x08063FE5
	thumb_func_end LinkOpponentHandleDrawTrainerPic

	thumb_func_start LinkOpponentHandleTrainerSlide
LinkOpponentHandleTrainerSlide: @ 0x0806663C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08066650
	ldrb r0, [r0]
	cmp r0, #1
	bne _08066658
	ldr r0, _08066654
	b _0806665A
	.align 2, 0
_08066650: .4byte 0x02023D08
_08066654: .4byte 0x0203886A
_08066658:
	ldr r0, _0806674C
_0806665A:
	ldrh r0, [r0]
	bl GetFrontierTrainerFrontSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r6, _08066750
	ldrb r1, [r6]
	bl DecompressTrainerFrontPic
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _08066754
	ldr r2, _08066758
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
	ldr r5, _0806675C
	ldrb r1, [r6]
	adds r1, r1, r5
	strb r0, [r1]
	ldr r4, _08066760
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
	ldr r1, _08066764
	strh r1, [r0, #0x2e]
	ldr r1, _08066768
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
	ldr r1, _0806676C
	str r1, [r0]
	ldr r1, _08066770
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066774
	str r1, [r0]
	bl LinkOpponentBufferExecCompleted
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806674C: .4byte 0x0203886C
_08066750: .4byte 0x02023D08
_08066754: .4byte 0x02024640
_08066758: .4byte 0x082D8D70
_0806675C: .4byte 0x02023E88
_08066760: .4byte 0x020205AC
_08066764: .4byte 0x0000FFFE
_08066768: .4byte 0x082D91CC
_0806676C: .4byte 0x0805D3C9
_08066770: .4byte 0x03005AC0
_08066774: .4byte 0x0806401D
	thumb_func_end LinkOpponentHandleTrainerSlide

	thumb_func_start LinkOpponentHandleTrainerSlideBack
LinkOpponentHandleTrainerSlideBack: @ 0x08066778
	push {r4, r5, r6, lr}
	ldr r6, _08066808
	ldr r4, _0806680C
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _08066810
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
	ldr r1, _08066814
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _08066818
	bl StoreSpriteCallbackInData6
	ldr r1, _0806681C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066820
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066808: .4byte 0x02023E88
_0806680C: .4byte 0x02023D08
_08066810: .4byte 0x020205AC
_08066814: .4byte 0x080A67B5
_08066818: .4byte 0x08007141
_0806681C: .4byte 0x03005AC0
_08066820: .4byte 0x08064055
	thumb_func_end LinkOpponentHandleTrainerSlideBack

	thumb_func_start LinkOpponentHandleFaintAnimation
LinkOpponentHandleFaintAnimation: @ 0x08066824
	push {r4, r5, r6, lr}
	ldr r6, _08066870
	ldr r4, [r6]
	ldr r5, _08066874
	ldrb r2, [r5]
	ldr r0, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _08066878
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08066858
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_08066858:
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
	b _080668B4
	.align 2, 0
_08066870: .4byte 0x02024174
_08066874: .4byte 0x02023D08
_08066878:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080668B4
	strb r0, [r3, #4]
	movs r0, #0x10
	movs r1, #0x3f
	bl PlaySE12WithPanning
	ldr r2, _080668BC
	ldr r1, _080668C0
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _080668C4
	str r1, [r0]
	ldr r1, _080668C8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080668CC
	str r1, [r0]
_080668B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080668BC: .4byte 0x020205AC
_080668C0: .4byte 0x02023E88
_080668C4: .4byte 0x08039579
_080668C8: .4byte 0x03005AC0
_080668CC: .4byte 0x080647F9
	thumb_func_end LinkOpponentHandleFaintAnimation

	thumb_func_start LinkOpponentHandlePaletteFade
LinkOpponentHandlePaletteFade: @ 0x080668D0
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandlePaletteFade

	thumb_func_start LinkOpponentHandleSuccessBallThrowAnim
LinkOpponentHandleSuccessBallThrowAnim: @ 0x080668DC
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleSuccessBallThrowAnim

	thumb_func_start LinkOpponentHandleBallThrowAnim
LinkOpponentHandleBallThrowAnim: @ 0x080668E8
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleBallThrowAnim

	thumb_func_start LinkOpponentHandlePause
LinkOpponentHandlePause: @ 0x080668F4
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandlePause

	thumb_func_start LinkOpponentHandleMoveAnimation
LinkOpponentHandleMoveAnimation: @ 0x08066900
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _080669F0
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08066916
	b _08066A3C
_08066916:
	ldr r0, _080669F4
	mov ip, r0
	ldrb r1, [r5]
	lsls r1, r1, #9
	adds r0, #1
	adds r0, r1, r0
	ldrb r6, [r0]
	mov r0, ip
	adds r0, #2
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r6, r0
	ldr r0, _080669F8
	mov r8, r0
	mov r0, ip
	adds r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	ldr r3, _080669FC
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #4
	adds r0, r1, r0
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #5
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r3]
	ldr r3, _08066A00
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #6
	adds r0, r1, r0
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #7
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r2, r0
	mov r0, ip
	adds r0, #8
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x10
	orrs r2, r0
	mov r0, ip
	adds r0, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r3]
	ldr r2, _08066A04
	ldrb r0, [r5]
	lsls r0, r0, #9
	mov r1, ip
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r4, _08066A08
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #0xc
	adds r0, r1, r0
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #0xd
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r4]
	ldr r7, _08066A0C
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #0x10
	adds r1, r1, r0
	str r1, [r7]
	ldr r2, _08066A10
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r1]
	str r1, [r0]
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, #0
	bl IsMoveWithoutAnimation
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _08066A14
	bl LinkOpponentBufferExecCompleted
	b _08066A3C
	.align 2, 0
_080669F0: .4byte 0x02023D08
_080669F4: .4byte 0x02022D08
_080669F8: .4byte 0x020380D2
_080669FC: .4byte 0x020380A8
_08066A00: .4byte 0x020380A4
_08066A04: .4byte 0x020380BA
_08066A08: .4byte 0x020380BC
_08066A0C: .4byte 0x020380A0
_08066A10: .4byte 0x02024160
_08066A14:
	ldr r0, _08066A48
	ldr r0, [r0]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #4]
	ldr r1, _08066A4C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066A50
	str r1, [r0]
	ldrh r1, [r4]
	ldr r2, [r7]
	adds r0, r6, #0
	bl BattleTv_SetDataBasedOnMove
_08066A3C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066A48: .4byte 0x02024174
_08066A4C: .4byte 0x03005AC0
_08066A50: .4byte 0x08066A55
	thumb_func_end LinkOpponentHandleMoveAnimation

	thumb_func_start LinkOpponentDoMoveAnimation
LinkOpponentDoMoveAnimation: @ 0x08066A54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _08066AA0
	ldr r6, _08066AA4
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
	ldr r7, _08066AA8
	ldr r5, [r7]
	ldr r1, [r5, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _08066AEC
	cmp r2, #1
	bgt _08066AAC
	cmp r2, #0
	beq _08066AB6
	b _08066BC8
	.align 2, 0
_08066AA0: .4byte 0x02022D08
_08066AA4: .4byte 0x02023D08
_08066AA8: .4byte 0x02024174
_08066AAC:
	cmp r2, #2
	beq _08066B16
	cmp r2, #3
	beq _08066B8C
	b _08066BC8
_08066AB6:
	ldr r1, [r5]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, #0xc
	ands r0, r2
	cmp r0, #4
	bne _08066AD8
	movs r0, #8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_08066AD8:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _08066BC8
_08066AEC:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08066BC8
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
	b _08066BC8
_08066B16:
	ldr r0, _08066B7C
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08066B80
	ldrb r0, [r0]
	cmp r0, #0
	bne _08066BC8
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
	beq _08066B64
	mov r0, r8
	cmp r0, #1
	bhi _08066B64
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
_08066B64:
	ldr r0, _08066B84
	ldr r2, [r0]
	ldr r0, _08066B88
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #4]
	b _08066BC8
	.align 2, 0
_08066B7C: .4byte 0x02038098
_08066B80: .4byte 0x0203809D
_08066B84: .4byte 0x02024174
_08066B88: .4byte 0x02023D08
_08066B8C:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08066BC8
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
	bl LinkOpponentBufferExecCompleted
_08066BC8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentDoMoveAnimation

	thumb_func_start LinkOpponentHandlePrintString
LinkOpponentHandlePrintString: @ 0x08066BD8
	push {r4, r5, lr}
	ldr r0, _08066C14
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08066C18
	strh r1, [r0]
	ldr r5, _08066C1C
	ldrb r4, [r5]
	lsls r4, r4, #9
	ldr r0, _08066C20
	adds r4, r4, r0
	ldrh r0, [r4]
	bl BufferStringBattle
	ldr r0, _08066C24
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _08066C28
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066C2C
	str r1, [r0]
	ldrh r0, [r4]
	bl BattleTv_SetDataBasedOnString
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08066C14: .4byte 0x02022AC8
_08066C18: .4byte 0x02022ACA
_08066C1C: .4byte 0x02023D08
_08066C20: .4byte 0x02022D0A
_08066C24: .4byte 0x02022AE0
_08066C28: .4byte 0x03005AC0
_08066C2C: .4byte 0x080648B1
	thumb_func_end LinkOpponentHandlePrintString

	thumb_func_start LinkOpponentHandlePrintSelectionString
LinkOpponentHandlePrintSelectionString: @ 0x08066C30
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandlePrintSelectionString

	thumb_func_start LinkOpponentHandleChooseAction
LinkOpponentHandleChooseAction: @ 0x08066C3C
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleChooseAction

	thumb_func_start LinkOpponentHandleUnknownYesNoBox
LinkOpponentHandleUnknownYesNoBox: @ 0x08066C48
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleUnknownYesNoBox

	thumb_func_start LinkOpponentHandleChooseMove
LinkOpponentHandleChooseMove: @ 0x08066C54
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleChooseMove

	thumb_func_start LinkOpponentHandleChooseItem
LinkOpponentHandleChooseItem: @ 0x08066C60
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleChooseItem

	thumb_func_start LinkOpponentHandleChoosePokemon
LinkOpponentHandleChoosePokemon: @ 0x08066C6C
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleChoosePokemon

	thumb_func_start LinkOpponentHandleCmd23
LinkOpponentHandleCmd23: @ 0x08066C78
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleCmd23

	thumb_func_start LinkOpponentHandleHealthBarUpdate
LinkOpponentHandleHealthBarUpdate: @ 0x08066C84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	bl LoadBattleBarGfx
	ldr r3, _08066CFC
	ldr r0, _08066D00
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
	ldr r0, _08066D04
	cmp r7, r0
	beq _08066D14
	ldr r6, _08066D08
	lsls r0, r4, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _08066D0C
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
	ldr r1, _08066D10
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _08066D3E
	.align 2, 0
_08066CFC: .4byte 0x02022D08
_08066D00: .4byte 0x02023D08
_08066D04: .4byte 0x00007FFF
_08066D08: .4byte 0x02023D12
_08066D0C: .4byte 0x020243E8
_08066D10: .4byte 0x03005AD0
_08066D14:
	ldr r1, _08066D5C
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08066D60
	adds r0, r0, r1
	movs r1, #0x3a
	bl GetMonData
	adds r2, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _08066D64
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, #0
	bl SetBattleBarStruct
_08066D3E:
	ldr r1, _08066D68
	ldr r0, _08066D6C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066D70
	str r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066D5C: .4byte 0x02023D12
_08066D60: .4byte 0x020243E8
_08066D64: .4byte 0x03005AD0
_08066D68: .4byte 0x03005AC0
_08066D6C: .4byte 0x02023D08
_08066D70: .4byte 0x080647A5
	thumb_func_end LinkOpponentHandleHealthBarUpdate

	thumb_func_start LinkOpponentHandleExpUpdate
LinkOpponentHandleExpUpdate: @ 0x08066D74
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleExpUpdate

	thumb_func_start LinkOpponentHandleStatusIconUpdate
LinkOpponentHandleStatusIconUpdate: @ 0x08066D80
	push {r4, lr}
	ldr r4, _08066DDC
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08066DD4
	ldr r0, _08066DE0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08066DE4
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08066DE8
	adds r1, r1, r2
	movs r2, #9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _08066DEC
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
	ldr r1, _08066DF0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066DF4
	str r1, [r0]
_08066DD4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066DDC: .4byte 0x02023D08
_08066DE0: .4byte 0x03005AD0
_08066DE4: .4byte 0x02023D12
_08066DE8: .4byte 0x020243E8
_08066DEC: .4byte 0x02024174
_08066DF0: .4byte 0x03005AC0
_08066DF4: .4byte 0x08064BED
	thumb_func_end LinkOpponentHandleStatusIconUpdate

	thumb_func_start LinkOpponentHandleStatusAnimation
LinkOpponentHandleStatusAnimation: @ 0x08066DF8
	push {r4, r5, lr}
	ldr r5, _08066E50
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08066E48
	ldr r4, _08066E54
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
	ldr r1, _08066E58
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066E5C
	str r1, [r0]
_08066E48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08066E50: .4byte 0x02023D08
_08066E54: .4byte 0x02022D08
_08066E58: .4byte 0x03005AC0
_08066E5C: .4byte 0x08064BED
	thumb_func_end LinkOpponentHandleStatusAnimation

	thumb_func_start LinkOpponentHandleStatusXor
LinkOpponentHandleStatusXor: @ 0x08066E60
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleStatusXor

	thumb_func_start LinkOpponentHandleDataTransfer
LinkOpponentHandleDataTransfer: @ 0x08066E6C
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleDataTransfer

	thumb_func_start LinkOpponentHandleDMA3Transfer
LinkOpponentHandleDMA3Transfer: @ 0x08066E78
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleDMA3Transfer

	thumb_func_start LinkOpponentHandlePlayBGM
LinkOpponentHandlePlayBGM: @ 0x08066E84
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandlePlayBGM

	thumb_func_start LinkOpponentHandleCmd32
LinkOpponentHandleCmd32: @ 0x08066E90
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleCmd32

	thumb_func_start LinkOpponentHandleTwoReturnValues
LinkOpponentHandleTwoReturnValues: @ 0x08066E9C
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleTwoReturnValues

	thumb_func_start LinkOpponentHandleChosenMonReturnValue
LinkOpponentHandleChosenMonReturnValue: @ 0x08066EA8
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleChosenMonReturnValue

	thumb_func_start LinkOpponentHandleOneReturnValue
LinkOpponentHandleOneReturnValue: @ 0x08066EB4
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleOneReturnValue

	thumb_func_start LinkOpponentHandleOneReturnValue_Duplicate
LinkOpponentHandleOneReturnValue_Duplicate: @ 0x08066EC0
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleOneReturnValue_Duplicate

	thumb_func_start sub_08066ECC
sub_08066ECC: @ 0x08066ECC
	push {lr}
	ldr r2, _08066EE4
	ldrb r1, [r2]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08066EE4: .4byte 0x020229C0
	thumb_func_end sub_08066ECC

	thumb_func_start LinkOpponentHandleCmd38
LinkOpponentHandleCmd38: @ 0x08066EE8
	push {lr}
	ldr r3, _08066F14
	ldr r1, _08066F18
	ldr r0, _08066F1C
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
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08066F14: .4byte 0x020229C0
_08066F18: .4byte 0x02022D08
_08066F1C: .4byte 0x02023D08
	thumb_func_end LinkOpponentHandleCmd38

	thumb_func_start LinkOpponentHandleCmd39
LinkOpponentHandleCmd39: @ 0x08066F20
	push {lr}
	ldr r2, _08066F34
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08066F34: .4byte 0x020229C0
	thumb_func_end LinkOpponentHandleCmd39

	thumb_func_start LinkOpponentHandleCmd40
LinkOpponentHandleCmd40: @ 0x08066F38
	push {lr}
	ldr r3, _08066F5C
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
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08066F5C: .4byte 0x020229C0
	thumb_func_end LinkOpponentHandleCmd40

	thumb_func_start LinkOpponentHandleHitAnimation
LinkOpponentHandleHitAnimation: @ 0x08066F60
	push {r4, lr}
	ldr r3, _08066F88
	ldr r2, _08066F8C
	ldr r4, _08066F90
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
	bge _08066F94
	bl LinkOpponentBufferExecCompleted
	b _08066FBE
	.align 2, 0
_08066F88: .4byte 0x020205AC
_08066F8C: .4byte 0x02023E88
_08066F90: .4byte 0x02023D08
_08066F94:
	ldr r1, _08066FC4
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
	ldr r1, _08066FC8
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08066FCC
	str r1, [r0]
_08066FBE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066FC4: .4byte 0x0202415D
_08066FC8: .4byte 0x03005AC0
_08066FCC: .4byte 0x080648C9
	thumb_func_end LinkOpponentHandleHitAnimation

	thumb_func_start LinkOpponentHandleCmd42
LinkOpponentHandleCmd42: @ 0x08066FD0
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleCmd42

	thumb_func_start LinkOpponentHandlePlaySE
LinkOpponentHandlePlaySE: @ 0x08066FDC
	push {r4, lr}
	ldr r4, _08067018
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r3, #0x3f
	cmp r0, #0
	bne _08066FF0
	movs r3, #0xc0
_08066FF0:
	ldr r2, _0806701C
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
	bl LinkOpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067018: .4byte 0x02023D08
_0806701C: .4byte 0x02022D08
	thumb_func_end LinkOpponentHandlePlaySE

	thumb_func_start LinkOpponentHandlePlayFanfareOrBGM
LinkOpponentHandlePlayFanfareOrBGM: @ 0x08067020
	push {r4, r5, lr}
	ldr r4, _08067054
	ldr r5, _08067058
	ldrb r0, [r5]
	lsls r3, r0, #9
	adds r0, r4, #3
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806705C
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
	b _08067070
	.align 2, 0
_08067054: .4byte 0x02022D08
_08067058: .4byte 0x02023D08
_0806705C:
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayFanfare
_08067070:
	bl LinkOpponentBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandlePlayFanfareOrBGM

	thumb_func_start sub_0806707C
sub_0806707C: @ 0x0806707C
	push {lr}
	ldr r1, _080670AC
	ldr r0, _080670B0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080670B4
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	movs r2, #5
	bl PlayCry3
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080670AC: .4byte 0x02023D12
_080670B0: .4byte 0x02023D08
_080670B4: .4byte 0x020243E8
	thumb_func_end sub_0806707C

	thumb_func_start LinkOpponentHandleIntroSlide
LinkOpponentHandleIntroSlide: @ 0x080670B8
	push {lr}
	ldr r1, _080670E0
	ldr r0, _080670E4
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _080670E8
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080670E0: .4byte 0x02022D08
_080670E4: .4byte 0x02023D08
_080670E8: .4byte 0x020240A0
	thumb_func_end LinkOpponentHandleIntroSlide

	thumb_func_start LinkOpponentHandleIntroTrainerBallThrow
LinkOpponentHandleIntroTrainerBallThrow: @ 0x080670EC
	push {r4, r5, r6, lr}
	ldr r5, _080671CC
	ldr r6, _080671D0
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080671D4
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
	ldr r1, _080671D8
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _080671DC
	bl StoreSpriteCallbackInData6
	ldr r0, _080671E0
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080671E4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r6]
	strh r0, [r1, #8]
	ldr r3, _080671E8
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
	beq _080671AE
	ldr r0, _080671EC
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, _080671F0
	str r1, [r0]
_080671AE:
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r0, [r2, #9]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #9]
	ldr r1, _080671F4
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080671F8
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080671CC: .4byte 0x02023E88
_080671D0: .4byte 0x02023D08
_080671D4: .4byte 0x020205AC
_080671D8: .4byte 0x080A67B5
_080671DC: .4byte 0x080672E1
_080671E0: .4byte 0x080671FD
_080671E4: .4byte 0x03005B60
_080671E8: .4byte 0x02024174
_080671EC: .4byte 0x02024158
_080671F0: .4byte 0x0807352D
_080671F4: .4byte 0x03005AC0
_080671F8: .4byte 0x08063F75
	thumb_func_end LinkOpponentHandleIntroTrainerBallThrow

	thumb_func_start sub_080671FC
sub_080671FC: @ 0x080671FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r7, _08067254
	ldrb r0, [r7]
	mov sb, r0
	ldr r1, _08067258
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
	beq _08067236
	ldr r0, _0806725C
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08067268
_08067236:
	ldr r0, _08067260
	ldrb r1, [r7]
	lsls r2, r1, #9
	adds r0, #1
	adds r2, r2, r0
	ldr r0, _08067264
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_08066078
	b _080672A8
	.align 2, 0
_08067254: .4byte 0x02023D08
_08067258: .4byte 0x03005B60
_0806725C: .4byte 0x02022C90
_08067260: .4byte 0x02022D08
_08067264: .4byte 0x02023D12
_08067268:
	ldr r4, _080672CC
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r4, #1
	adds r1, r1, r4
	ldr r6, _080672D0
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_08066078
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
	bl sub_08066078
	ldrb r0, [r7]
	eors r0, r5
	strb r0, [r7]
_080672A8:
	ldr r1, _080672D4
	ldr r2, _080672D8
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080672DC
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
_080672CC: .4byte 0x02022D08
_080672D0: .4byte 0x02023D12
_080672D4: .4byte 0x03005AC0
_080672D8: .4byte 0x02023D08
_080672DC: .4byte 0x08064319
	thumb_func_end sub_080671FC

	thumb_func_start sub_080672E0
sub_080672E0: @ 0x080672E0
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
	thumb_func_end sub_080672E0

	thumb_func_start sub_080672FC
sub_080672FC: @ 0x080672FC
	push {r4, r5, r6, r7, lr}
	ldr r1, _08067324
	ldr r0, _08067328
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806732C
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806732C
	bl LinkOpponentBufferExecCompleted
	b _080673F6
	.align 2, 0
_08067324: .4byte 0x02022D08
_08067328: .4byte 0x02023D08
_0806732C:
	ldr r4, _08067384
	ldr r0, [r4]
	ldr r3, _08067388
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
	ldr r1, _0806738C
	ldrb r2, [r3]
	lsls r0, r2, #9
	adds r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r3, #0
	cmp r0, #0
	beq _08067398
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
	bhi _08067390
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #1]
	b _080673F6
	.align 2, 0
_08067384: .4byte 0x02024174
_08067388: .4byte 0x02023D08
_0806738C: .4byte 0x02022D08
_08067390:
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3, #1]
_08067398:
	adds r5, r7, #0
	ldrb r0, [r5]
	lsls r3, r0, #9
	ldr r4, _080673FC
	adds r1, r3, r4
	subs r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, #2
	adds r3, r3, r4
	ldrb r3, [r3]
	bl CreatePartyStatusSummarySprites
	ldr r2, _08067400
	ldrb r1, [r5]
	adds r1, r1, r2
	movs r3, #0
	strb r0, [r1]
	ldr r6, _08067404
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
	beq _080673EA
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x5d
	strb r1, [r0, #5]
_080673EA:
	ldr r0, _08067408
	ldrb r1, [r7]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0806740C
	str r0, [r1]
_080673F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080673FC: .4byte 0x02022D0C
_08067400: .4byte 0x02024158
_08067404: .4byte 0x02024174
_08067408: .4byte 0x03005AC0
_0806740C: .4byte 0x08067411
	thumb_func_end sub_080672FC

	thumb_func_start sub_08067410
sub_08067410: @ 0x08067410
	push {r4, lr}
	ldr r4, _08067450
	ldr r0, [r4]
	ldr r3, _08067454
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
	bls _08067448
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #5]
	bl LinkOpponentBufferExecCompleted
_08067448:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067450: .4byte 0x02024174
_08067454: .4byte 0x02023D08
	thumb_func_end sub_08067410

	thumb_func_start LinkOpponentHandleHidePartyStatusSummary
LinkOpponentHandleHidePartyStatusSummary: @ 0x08067458
	push {lr}
	ldr r0, _08067494
	ldr r1, [r0]
	ldr r0, _08067498
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
	beq _0806748A
	ldr r2, _0806749C
	ldr r0, _080674A0
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _080674A4
	str r1, [r0]
_0806748A:
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08067494: .4byte 0x02024174
_08067498: .4byte 0x02023D08
_0806749C: .4byte 0x03005B60
_080674A0: .4byte 0x02024158
_080674A4: .4byte 0x0807352D
	thumb_func_end LinkOpponentHandleHidePartyStatusSummary

	thumb_func_start LinkOpponentHandleEndBounceEffect
LinkOpponentHandleEndBounceEffect: @ 0x080674A8
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleEndBounceEffect

	thumb_func_start LinkOpponentHandleSpriteInvisibility
LinkOpponentHandleSpriteInvisibility: @ 0x080674B4
	push {r4, lr}
	ldr r4, _08067504
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080674FA
	ldr r3, _08067508
	ldr r0, _0806750C
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _08067510
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
_080674FA:
	bl LinkOpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067504: .4byte 0x02023D08
_08067508: .4byte 0x020205AC
_0806750C: .4byte 0x02023E88
_08067510: .4byte 0x02022D08
	thumb_func_end LinkOpponentHandleSpriteInvisibility

	thumb_func_start LinkOpponentHandleBattleAnimation
LinkOpponentHandleBattleAnimation: @ 0x08067514
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _0806755C
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08067576
	ldr r4, _08067560
	ldrb r2, [r5]
	lsls r1, r2, #9
	adds r0, r4, #1
	adds r0, r1, r0
	ldrb r6, [r0]
	adds r0, r4, #2
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r4, #3
	adds r1, r1, r4
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r3, r0
	str r3, [sp]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r3, r6, #0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08067564
	bl LinkOpponentBufferExecCompleted
	b _08067570
	.align 2, 0
_0806755C: .4byte 0x02023D08
_08067560: .4byte 0x02022D08
_08067564:
	ldr r0, _08067580
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _08067584
	str r0, [r1]
_08067570:
	adds r0, r6, #0
	bl BattleTv_SetDataBasedOnAnimation
_08067576:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067580: .4byte 0x03005AC0
_08067584: .4byte 0x08064C1D
	thumb_func_end LinkOpponentHandleBattleAnimation

	thumb_func_start LinkOpponentHandleLinkStandbyMsg
LinkOpponentHandleLinkStandbyMsg: @ 0x08067588
	push {lr}
	ldr r0, _080675A0
	ldrb r0, [r0]
	lsls r0, r0, #9
	ldr r1, _080675A4
	adds r0, r0, r1
	bl sub_08185008
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080675A0: .4byte 0x02023D08
_080675A4: .4byte 0x02022D0A
	thumb_func_end LinkOpponentHandleLinkStandbyMsg

	thumb_func_start LinkOpponentHandleResetActionMoveSelection
LinkOpponentHandleResetActionMoveSelection: @ 0x080675A8
	push {lr}
	bl LinkOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkOpponentHandleResetActionMoveSelection

	thumb_func_start LinkOpponentHandleCmd55
LinkOpponentHandleCmd55: @ 0x080675B4
	push {r4, r5, lr}
	ldr r5, _080675D8
	ldrb r0, [r5]
	lsls r0, r0, #9
	ldr r4, _080675DC
	adds r0, r0, r4
	bl sub_08185008
	ldrb r0, [r5]
	lsls r0, r0, #9
	subs r4, #3
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r2, #3
	bne _080675E4
	ldr r0, _080675E0
	strb r2, [r0]
	b _080675EC
	.align 2, 0
_080675D8: .4byte 0x02023D08
_080675DC: .4byte 0x02022D0C
_080675E0: .4byte 0x02023FDE
_080675E4:
	ldr r0, _08067638
	movs r1, #3
	eors r1, r2
	strb r1, [r0]
_080675EC:
	ldr r0, _0806763C
	ldr r3, [r0]
	ldr r1, _08067640
	ldr r4, _08067644
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _08067648
	adds r3, r3, r1
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #5
	bl FadeOutMapMusic
	movs r0, #3
	bl BeginFastPaletteFade
	bl LinkOpponentBufferExecCompleted
	ldr r1, _0806764C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08067650
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067638: .4byte 0x02023FDE
_0806763C: .4byte 0x03005AF0
_08067640: .4byte 0x02022D08
_08067644: .4byte 0x02023D08
_08067648: .4byte 0x00000CA9
_0806764C: .4byte 0x03005AC0
_08067650: .4byte 0x080583C1
	thumb_func_end LinkOpponentHandleCmd55

	thumb_func_start LinkOpponentCmdEnd
LinkOpponentCmdEnd: @ 0x08067654
	bx lr
	.align 2, 0
	thumb_func_end LinkOpponentCmdEnd

