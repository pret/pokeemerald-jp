.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start WallyCmdEnd
WallyCmdEnd: @ 0x081681BC
	bx lr
	.align 2, 0
	thumb_func_end WallyCmdEnd

	thumb_func_start SetControllerToWally
SetControllerToWally: @ 0x081681C0
	ldr r1, _081681EC
	ldr r0, _081681F0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081681F4
	str r1, [r0]
	ldr r2, _081681F8
	ldr r0, [r2]
	adds r0, #0x94
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x95
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x96
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x97
	strb r1, [r0]
	bx lr
	.align 2, 0
_081681EC: .4byte 0x03005AC0
_081681F0: .4byte 0x02023D08
_081681F4: .4byte 0x081681FD
_081681F8: .4byte 0x02024140
	thumb_func_end SetControllerToWally

	thumb_func_start WallyBufferRunCommand
WallyBufferRunCommand: @ 0x081681FC
	push {lr}
	ldr r2, _08168230
	ldr r1, _08168234
	ldr r0, _08168238
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08168248
	ldr r0, _0816823C
	lsls r1, r3, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x38
	bhi _08168244
	ldr r0, _08168240
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _08168248
	.align 2, 0
_08168230: .4byte 0x02023D0C
_08168234: .4byte 0x082FACB4
_08168238: .4byte 0x02023D08
_0816823C: .4byte 0x02022D08
_08168240: .4byte 0x085C0AA4
_08168244:
	bl WallyBufferExecCompleted
_08168248:
	pop {r0}
	bx r0
	thumb_func_end WallyBufferRunCommand

	thumb_func_start WallyHandleActions
WallyHandleActions: @ 0x0816824C
	push {r4, r5, lr}
	ldr r1, _08168268
	ldr r0, [r1]
	adds r0, #0x94
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #5
	bls _0816825E
	b _0816836C
_0816825E:
	lsls r0, r0, #2
	ldr r1, _0816826C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08168268: .4byte 0x02024140
_0816826C: .4byte 0x08168270
_08168270: @ jump table
	.4byte _08168288 @ case 0
	.4byte _0816829A @ case 1
	.4byte _081682B8 @ case 2
	.4byte _081682D6 @ case 3
	.4byte _08168310 @ case 4
	.4byte _08168348 @ case 5
_08168288:
	ldr r0, [r4]
	adds r0, #0x96
	movs r1, #0x40
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, #0x94
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0816829A:
	ldr r1, [r4]
	adds r1, #0x96
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0816836C
	movs r0, #5
	bl PlaySE
	movs r0, #1
	movs r1, #0
	b _081682EC
_081682B8:
	ldr r1, [r4]
	adds r1, #0x96
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0816836C
	movs r0, #5
	bl PlaySE
	movs r0, #1
	movs r1, #0
	b _081682EC
_081682D6:
	ldr r1, [r4]
	adds r1, #0x96
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0816836C
	movs r0, #1
	movs r1, #9
_081682EC:
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	bl WallyBufferExecCompleted
	ldr r1, [r4]
	adds r1, #0x94
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x95
	strb r5, [r0]
	ldr r0, [r4]
	adds r0, #0x96
	movs r1, #0x40
	strb r1, [r0]
	b _0816836C
_08168310:
	ldr r1, [r4]
	adds r1, #0x96
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816836C
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl ActionSelectionDestroyCursorAt
	movs r0, #1
	movs r1, #0
	bl SetCB2ToReshowScreenAfterMenu
	ldr r0, [r4]
	adds r0, #0x96
	movs r1, #0x40
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, #0x94
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0816836C
_08168348:
	ldr r1, [r4]
	adds r1, #0x96
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816836C
	movs r0, #5
	bl PlaySE
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	bl WallyBufferExecCompleted
_0816836C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleActions

	thumb_func_start CompleteOnChosenItem
CompleteOnChosenItem: @ 0x08168374
	push {lr}
	ldr r2, _0816839C
	ldr r1, _081683A0
	ldr r0, _081683A4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081683A8
	cmp r1, r0
	bne _08168398
	bl WallyBufferExecCompleted
_08168398:
	pop {r0}
	bx r0
	.align 2, 0
_0816839C: .4byte 0x020205AC
_081683A0: .4byte 0x02023E88
_081683A4: .4byte 0x02023D08
_081683A8: .4byte 0x08007141
	thumb_func_end CompleteOnChosenItem

	thumb_func_start WallyHandleChosenMonReturnValue
WallyHandleChosenMonReturnValue: @ 0x081683AC
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081683BE
	bl WallyBufferExecCompleted
_081683BE:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleChosenMonReturnValue

	thumb_func_start CompleteOnFinishedAnimation
CompleteOnFinishedAnimation: @ 0x081683C4
	push {lr}
	ldr r0, _081683D8
	ldrb r0, [r0]
	cmp r0, #0
	bne _081683D2
	bl WallyBufferExecCompleted
_081683D2:
	pop {r0}
	bx r0
	.align 2, 0
_081683D8: .4byte 0x0202415D
	thumb_func_end CompleteOnFinishedAnimation

	thumb_func_start OpenBagAfterPaletteFade
OpenBagAfterPaletteFade: @ 0x081683DC
	push {lr}
	ldr r0, _08168408
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08168404
	ldr r1, _0816840C
	ldr r0, _08168410
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08168414
	str r1, [r0]
	bl nullsub_35
	bl FreeAllWindowBuffers
	bl DoWallyTutorialBagMenu
_08168404:
	pop {r0}
	bx r0
	.align 2, 0
_08168408: .4byte 0x02037C74
_0816840C: .4byte 0x03005AC0
_08168410: .4byte 0x02023D08
_08168414: .4byte 0x08168419
	thumb_func_end OpenBagAfterPaletteFade

	thumb_func_start WallyHandleCmd39
WallyHandleCmd39: @ 0x08168418
	push {lr}
	ldr r0, _08168444
	ldr r1, [r0, #4]
	ldr r0, _08168448
	cmp r1, r0
	bne _0816843E
	ldr r0, _0816844C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816843E
	ldr r0, _08168450
	ldrh r1, [r0]
	movs r0, #1
	bl BtlController_EmitOneReturnValue
	bl WallyBufferExecCompleted
_0816843E:
	pop {r0}
	bx r0
	.align 2, 0
_08168444: .4byte 0x03002360
_08168448: .4byte 0x080380FD
_0816844C: .4byte 0x02037C74
_08168450: .4byte 0x0203CB48
	thumb_func_end WallyHandleCmd39

	thumb_func_start sub_08168454
sub_08168454: @ 0x08168454
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _081685F0
	ldr r0, [r4]
	ldr r5, _081685F4
	ldrb r2, [r5]
	ldr r1, [r0, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r7, #0x88
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0816848C
	ldr r0, _081685F8
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081685FC
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_0816848C:
	ldr r1, [r4]
	ldrb r0, [r5]
	movs r6, #2
	adds r2, r6, #0
	eors r2, r0
	ldr r1, [r1, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _081684BE
	ldr r0, _081685F8
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081685FC
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_081684BE:
	ldr r0, [r4]
	ldrb r2, [r5]
	ldr r3, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r4, #8
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _081684DA
	b _081685E4
_081684DA:
	adds r1, r2, #0
	eors r1, r6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _081685E4
	ldr r0, _08168600
	mov r8, r0
	ldr r7, _08168604
	adds r0, r2, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r4, r8
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r3, [r0]
	ldr r0, _08168608
	cmp r3, r0
	bne _081685E4
	ldr r0, _0816860C
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, r3
	bne _081685E4
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08168582
	ldr r0, _08168610
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08168582
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r0, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	bl DestroySprite
	ldr r4, _08168614
	ldrb r0, [r5]
	adds r1, r6, #0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _081685F8
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _081685FC
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	eors r0, r6
	bl sub_08076320
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_08168582:
	ldr r1, _08168604
	ldr r4, _081685F4
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08168600
	adds r0, r0, r1
	bl DestroySprite
	ldr r5, _08168614
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _081685F8
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _081685FC
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_08076320
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r0, _081685F0
	ldr r0, [r0]
	ldr r2, [r0, #8]
	ldrb r1, [r2, #9]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldr r1, _08168618
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816861C
	str r1, [r0]
_081685E4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081685F0: .4byte 0x02024174
_081685F4: .4byte 0x02023D08
_081685F8: .4byte 0x02023D12
_081685FC: .4byte 0x02024190
_08168600: .4byte 0x020205AC
_08168604: .4byte 0x03005ADC
_08168608: .4byte 0x08007141
_0816860C: .4byte 0x02023E88
_08168610: .4byte 0x02022C90
_08168614: .4byte 0x03005AD0
_08168618: .4byte 0x03005AC0
_0816861C: .4byte 0x08168621
	thumb_func_end sub_08168454

	thumb_func_start sub_08168620
sub_08168620: @ 0x08168620
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	ldr r2, _08168718
	ldr r0, _0816871C
	ldr r1, _08168720
	mov r8, r1
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08168724
	cmp r1, r0
	bne _0816864A
	movs r4, #1
_0816864A:
	cmp r4, #0
	beq _0816870C
	ldr r7, _08168728
	ldr r0, [r7]
	ldr r4, [r0, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r4
	ldrb r1, [r2, #1]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0816870C
	movs r6, #2
	adds r1, r6, #0
	eors r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0816870C
	ldrb r1, [r2]
	movs r3, #0x7f
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r7]
	mov r1, r8
	ldrb r2, [r1]
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
	ldr r2, [r7]
	mov r1, r8
	ldrb r0, [r1]
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
	ldr r2, [r7]
	mov r1, r8
	ldrb r0, [r1]
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
	ldr r4, _0816872C
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldr r0, _08168730
	movs r1, #0xa
	bl CreateTask
	ldr r2, _08168734
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _08168738
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	bl WallyBufferExecCompleted
_0816870C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08168718: .4byte 0x020205AC
_0816871C: .4byte 0x03005AD0
_08168720: .4byte 0x02023D08
_08168724: .4byte 0x08007141
_08168728: .4byte 0x02024174
_0816872C: .4byte 0x000027F9
_08168730: .4byte 0x08058D11
_08168734: .4byte 0x02023D12
_08168738: .4byte 0x02024190
	thumb_func_end sub_08168620

	thumb_func_start sub_0816873C
sub_0816873C: @ 0x0816873C
	push {r4, r5, r6, lr}
	ldr r5, _0816877C
	ldrb r0, [r5]
	ldr r6, _08168780
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
	beq _08168784
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r2, #0
	bl sub_080726F4
	b _0816879E
	.align 2, 0
_0816877C: .4byte 0x02023D08
_08168780: .4byte 0x03005AD0
_08168784:
	ldr r2, _081687A4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _081687A8
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	bl WallyBufferExecCompleted
_0816879E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081687A4: .4byte 0x02023D12
_081687A8: .4byte 0x02024190
	thumb_func_end sub_0816873C

	thumb_func_start WallyHandleGetRawMonData
WallyHandleGetRawMonData: @ 0x081687AC
	push {r4, lr}
	ldr r1, _081687E8
	ldr r0, _081687EC
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _081687F0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _081687F8
	movs r3, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _081687F4
	strb r3, [r0]
	bl WallyBufferExecCompleted
	b _08168822
	.align 2, 0
_081687E8: .4byte 0x02023E88
_081687EC: .4byte 0x02023D08
_081687F0: .4byte 0x020205AC
_081687F4: .4byte 0x0202415D
_081687F8:
	ldrh r0, [r4, #0x30]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0816881C
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
_0816881C:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_08168822:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end WallyHandleGetRawMonData

	thumb_func_start sub_08168828
sub_08168828: @ 0x08168828
	push {r4, r5, r6, lr}
	ldr r0, _08168884
	ldr r0, [r0]
	ldr r6, _08168888
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
	bne _0816887C
	ldr r5, _0816888C
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08168890
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
	ldr r1, _08168894
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl WallyBufferExecCompleted
_0816887C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08168884: .4byte 0x02024174
_08168888: .4byte 0x02023D08
_0816888C: .4byte 0x02023E88
_08168890: .4byte 0x020205AC
_08168894: .4byte 0x03005AD0
	thumb_func_end sub_08168828

	thumb_func_start WallyHandleOneReturnValue
WallyHandleOneReturnValue: @ 0x08168898
	push {lr}
	ldr r2, _081688C0
	ldr r1, _081688C4
	ldr r0, _081688C8
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081688CC
	cmp r1, r0
	bne _081688BC
	bl WallyBufferExecCompleted
_081688BC:
	pop {r0}
	bx r0
	.align 2, 0
_081688C0: .4byte 0x020205AC
_081688C4: .4byte 0x02023E88
_081688C8: .4byte 0x02023D08
_081688CC: .4byte 0x08007141
	thumb_func_end WallyHandleOneReturnValue

	thumb_func_start sub_081688D0
sub_081688D0: @ 0x081688D0
	push {lr}
	ldr r0, _081688F8
	ldr r2, [r0]
	ldr r0, _081688FC
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
	bne _081688F2
	bl WallyBufferExecCompleted
_081688F2:
	pop {r0}
	bx r0
	.align 2, 0
_081688F8: .4byte 0x02024174
_081688FC: .4byte 0x02023D08
	thumb_func_end sub_081688D0

	thumb_func_start WallyBufferExecCompleted
WallyBufferExecCompleted: @ 0x08168900
	push {r4, lr}
	sub sp, #4
	ldr r1, _08168940
	ldr r4, _08168944
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08168948
	str r1, [r0]
	ldr r0, _0816894C
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08168954
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, #2
	movs r1, #4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _08168950
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r1
	movs r1, #0x38
	strb r1, [r0]
	b _08168966
	.align 2, 0
_08168940: .4byte 0x03005AC0
_08168944: .4byte 0x02023D08
_08168948: .4byte 0x081681FD
_0816894C: .4byte 0x02022C90
_08168950: .4byte 0x02022D08
_08168954:
	ldr r2, _08168970
	ldr r1, _08168974
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_08168966:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08168970: .4byte 0x02023D0C
_08168974: .4byte 0x082FACB4
	thumb_func_end WallyBufferExecCompleted

	thumb_func_start sub_08168978
sub_08168978: @ 0x08168978
	push {lr}
	ldr r0, _081689A0
	ldr r2, [r0]
	ldr r0, _081689A4
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
	bne _0816899A
	bl WallyBufferExecCompleted
_0816899A:
	pop {r0}
	bx r0
	.align 2, 0
_081689A0: .4byte 0x02024174
_081689A4: .4byte 0x02023D08
	thumb_func_end sub_08168978

	thumb_func_start WallyHandleGetMonData
WallyHandleGetMonData: @ 0x081689A8
	push {r4, r5, r6, lr}
	sub sp, #0x100
	movs r6, #0
	ldr r1, _081689D4
	ldr r0, _081689D8
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _081689E0
	ldr r0, _081689DC
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl CopyWallyMonData
	adds r6, r0, #0
	b _08168A02
	.align 2, 0
_081689D4: .4byte 0x02022D08
_081689D8: .4byte 0x02023D08
_081689DC: .4byte 0x02023D12
_081689E0:
	ldrb r4, [r1]
	movs r5, #0
_081689E4:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _081689FA
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	adds r1, r2, r6
	bl CopyWallyMonData
	adds r6, r6, r0
_081689FA:
	lsrs r4, r4, #1
	adds r5, #1
	cmp r5, #5
	ble _081689E4
_08168A02:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl WallyBufferExecCompleted
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleGetMonData

	thumb_func_start CopyWallyMonData
CopyWallyMonData: @ 0x08168A1C
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
	ldr r2, _08168A50
	ldr r3, _08168A54
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _08168A46
	bl _081691B2
_08168A46:
	lsls r0, r0, #2
	ldr r1, _08168A58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08168A50: .4byte 0x02022D08
_08168A54: .4byte 0x02023D08
_08168A58: .4byte 0x08168A5C
_08168A5C: @ jump table
	.4byte _08168B4C @ case 0
	.4byte _08168D70 @ case 1
	.4byte _08168D80 @ case 2
	.4byte _08168D90 @ case 3
	.4byte _08168DF8 @ case 4
	.4byte _08168DF8 @ case 5
	.4byte _08168DF8 @ case 6
	.4byte _08168DF8 @ case 7
	.4byte _08168E14 @ case 8
	.4byte _08168E50 @ case 9
	.4byte _08168E50 @ case 10
	.4byte _08168E50 @ case 11
	.4byte _08168E50 @ case 12
	.4byte _081691B2 @ case 13
	.4byte _081691B2 @ case 14
	.4byte _081691B2 @ case 15
	.4byte _081691B2 @ case 16
	.4byte _08168E6C @ case 17
	.4byte _08168E7C @ case 18
	.4byte _08168EAC @ case 19
	.4byte _08168EBC @ case 20
	.4byte _08168ECC @ case 21
	.4byte _08168EDC @ case 22
	.4byte _08168EEC @ case 23
	.4byte _08168EFC @ case 24
	.4byte _08168F0C @ case 25
	.4byte _08168F1C @ case 26
	.4byte _08168F2C @ case 27
	.4byte _08168F3C @ case 28
	.4byte _08168F4C @ case 29
	.4byte _08168F5C @ case 30
	.4byte _08168F6C @ case 31
	.4byte _08168FBC @ case 32
	.4byte _08168FCC @ case 33
	.4byte _08168FDC @ case 34
	.4byte _08168FEC @ case 35
	.4byte _08168FFC @ case 36
	.4byte _0816900C @ case 37
	.4byte _0816901C @ case 38
	.4byte _0816902C @ case 39
	.4byte _0816903C @ case 40
	.4byte _08169070 @ case 41
	.4byte _08169080 @ case 42
	.4byte _08169090 @ case 43
	.4byte _081690A0 @ case 44
	.4byte _081690B0 @ case 45
	.4byte _081690C0 @ case 46
	.4byte _081690D0 @ case 47
	.4byte _081690E0 @ case 48
	.4byte _08169100 @ case 49
	.4byte _08169110 @ case 50
	.4byte _08169120 @ case 51
	.4byte _08169130 @ case 52
	.4byte _08169140 @ case 53
	.4byte _08169150 @ case 54
	.4byte _08169160 @ case 55
	.4byte _08169170 @ case 56
	.4byte _08169180 @ case 57
	.4byte _08169190 @ case 58
	.4byte _081691A0 @ case 59
_08168B4C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08168D60
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
_08168B98:
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
	ble _08168B98
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08168D60
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
	ldr r1, _08168D64
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
	ldr r2, _08168D68
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
	ldr r1, _08168D6C
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
_08168D50:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x57
	bls _08168D50
	b _081691B2
	.align 2, 0
_08168D60: .4byte 0x02024190
_08168D64: .4byte 0xFFFFFC1F
_08168D68: .4byte 0xFFF07FFF
_08168D6C: .4byte 0xFFFFFE0F
_08168D70:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168D7C
	adds r0, r0, r1
	movs r1, #0xb
	b _081690EA
	.align 2, 0
_08168D7C: .4byte 0x02024190
_08168D80:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168D8C
	adds r0, r0, r1
	movs r1, #0xc
	b _081690EA
	.align 2, 0
_08168D8C: .4byte 0x02024190
_08168D90:
	movs r6, #0
	add r2, sp, #0x58
	mov sb, r2
	add r0, sp, #0x60
	mov sl, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08168DF4
	adds r4, r1, r0
	mov r8, sb
_08168DA6:
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
	ble _08168DA6
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168DF4
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	mov r1, sb
	strb r0, [r1, #0xc]
	mov r2, sb
	movs r6, #0
_08168DE4:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0xf
	bls _08168DE4
	b _081691B2
	.align 2, 0
_08168DF4: .4byte 0x02024190
_08168DF8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168E10
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #9
	b _081690EA
	.align 2, 0
_08168E10: .4byte 0x02024190
_08168E14:
	movs r6, #0
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r2, _08168E4C
	mov r8, r2
_08168E20:
	adds r1, r6, #0
	adds r1, #0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	cmp r6, #3
	ble _08168E20
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168E4C
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	b _081691B2
	.align 2, 0
_08168E4C: .4byte 0x02024190
_08168E50:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168E68
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #8
	b _081691AA
	.align 2, 0
_08168E68: .4byte 0x02024190
_08168E6C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168E78
	adds r0, r0, r1
	movs r1, #1
	b _08168E86
	.align 2, 0
_08168E78: .4byte 0x02024190
_08168E7C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168EA8
	adds r0, r0, r1
	movs r1, #0x19
_08168E86:
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
	b _081691B2
	.align 2, 0
_08168EA8: .4byte 0x02024190
_08168EAC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168EB8
	adds r0, r0, r1
	movs r1, #0x1a
	b _081691AA
	.align 2, 0
_08168EB8: .4byte 0x02024190
_08168EBC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168EC8
	adds r0, r0, r1
	movs r1, #0x1b
	b _081691AA
	.align 2, 0
_08168EC8: .4byte 0x02024190
_08168ECC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168ED8
	adds r0, r0, r1
	movs r1, #0x1c
	b _081691AA
	.align 2, 0
_08168ED8: .4byte 0x02024190
_08168EDC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168EE8
	adds r0, r0, r1
	movs r1, #0x1d
	b _081691AA
	.align 2, 0
_08168EE8: .4byte 0x02024190
_08168EEC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168EF8
	adds r0, r0, r1
	movs r1, #0x1e
	b _081691AA
	.align 2, 0
_08168EF8: .4byte 0x02024190
_08168EFC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168F08
	adds r0, r0, r1
	movs r1, #0x1f
	b _081691AA
	.align 2, 0
_08168F08: .4byte 0x02024190
_08168F0C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168F18
	adds r0, r0, r1
	movs r1, #0x20
	b _081691AA
	.align 2, 0
_08168F18: .4byte 0x02024190
_08168F1C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168F28
	adds r0, r0, r1
	movs r1, #0x22
	b _081691AA
	.align 2, 0
_08168F28: .4byte 0x02024190
_08168F2C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168F38
	adds r0, r0, r1
	movs r1, #0x23
	b _081691AA
	.align 2, 0
_08168F38: .4byte 0x02024190
_08168F3C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168F48
	adds r0, r0, r1
	movs r1, #0x24
	b _081691AA
	.align 2, 0
_08168F48: .4byte 0x02024190
_08168F4C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168F58
	adds r0, r0, r1
	movs r1, #0x25
	b _081691AA
	.align 2, 0
_08168F58: .4byte 0x02024190
_08168F5C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168F68
	adds r0, r0, r1
	movs r1, #0x26
	b _081691AA
	.align 2, 0
_08168F68: .4byte 0x02024190
_08168F6C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08168FB8
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
	b _081691B2
	.align 2, 0
_08168FB8: .4byte 0x02024190
_08168FBC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168FC8
	adds r0, r0, r1
	movs r1, #0x27
	b _081691AA
	.align 2, 0
_08168FC8: .4byte 0x02024190
_08168FCC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168FD8
	adds r0, r0, r1
	movs r1, #0x28
	b _081691AA
	.align 2, 0
_08168FD8: .4byte 0x02024190
_08168FDC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168FE8
	adds r0, r0, r1
	movs r1, #0x29
	b _081691AA
	.align 2, 0
_08168FE8: .4byte 0x02024190
_08168FEC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08168FF8
	adds r0, r0, r1
	movs r1, #0x2a
	b _081691AA
	.align 2, 0
_08168FF8: .4byte 0x02024190
_08168FFC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169008
	adds r0, r0, r1
	movs r1, #0x2b
	b _081691AA
	.align 2, 0
_08169008: .4byte 0x02024190
_0816900C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169018
	adds r0, r0, r1
	movs r1, #0x2c
	b _081691AA
	.align 2, 0
_08169018: .4byte 0x02024190
_0816901C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169028
	adds r0, r0, r1
	movs r1, #0
	b _08169046
	.align 2, 0
_08169028: .4byte 0x02024190
_0816902C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169038
	adds r0, r0, r1
	movs r1, #9
	b _081690EA
	.align 2, 0
_08169038: .4byte 0x02024190
_0816903C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816906C
	adds r0, r0, r1
	movs r1, #0x37
_08169046:
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
	b _081691B2
	.align 2, 0
_0816906C: .4byte 0x02024190
_08169070:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816907C
	adds r0, r0, r1
	movs r1, #0x38
	b _081691AA
	.align 2, 0
_0816907C: .4byte 0x02024190
_08169080:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816908C
	adds r0, r0, r1
	movs r1, #0x39
	b _081690EA
	.align 2, 0
_0816908C: .4byte 0x02024190
_08169090:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816909C
	adds r0, r0, r1
	movs r1, #0x3a
	b _081690EA
	.align 2, 0
_0816909C: .4byte 0x02024190
_081690A0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081690AC
	adds r0, r0, r1
	movs r1, #0x3b
	b _081690EA
	.align 2, 0
_081690AC: .4byte 0x02024190
_081690B0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081690BC
	adds r0, r0, r1
	movs r1, #0x3c
	b _081690EA
	.align 2, 0
_081690BC: .4byte 0x02024190
_081690C0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081690CC
	adds r0, r0, r1
	movs r1, #0x3d
	b _081690EA
	.align 2, 0
_081690CC: .4byte 0x02024190
_081690D0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081690DC
	adds r0, r0, r1
	movs r1, #0x3e
	b _081690EA
	.align 2, 0
_081690DC: .4byte 0x02024190
_081690E0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081690FC
	adds r0, r0, r1
	movs r1, #0x3f
_081690EA:
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strb r0, [r7]
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r6, #2
	b _081691B2
	.align 2, 0
_081690FC: .4byte 0x02024190
_08169100:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816910C
	adds r0, r0, r1
	movs r1, #0x16
	b _081691AA
	.align 2, 0
_0816910C: .4byte 0x02024190
_08169110:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816911C
	adds r0, r0, r1
	movs r1, #0x17
	b _081691AA
	.align 2, 0
_0816911C: .4byte 0x02024190
_08169120:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816912C
	adds r0, r0, r1
	movs r1, #0x18
	b _081691AA
	.align 2, 0
_0816912C: .4byte 0x02024190
_08169130:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816913C
	adds r0, r0, r1
	movs r1, #0x21
	b _081691AA
	.align 2, 0
_0816913C: .4byte 0x02024190
_08169140:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816914C
	adds r0, r0, r1
	movs r1, #0x2f
	b _081691AA
	.align 2, 0
_0816914C: .4byte 0x02024190
_08169150:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816915C
	adds r0, r0, r1
	movs r1, #0x30
	b _081691AA
	.align 2, 0
_0816915C: .4byte 0x02024190
_08169160:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816916C
	adds r0, r0, r1
	movs r1, #0x32
	b _081691AA
	.align 2, 0
_0816916C: .4byte 0x02024190
_08169170:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816917C
	adds r0, r0, r1
	movs r1, #0x33
	b _081691AA
	.align 2, 0
_0816917C: .4byte 0x02024190
_08169180:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816918C
	adds r0, r0, r1
	movs r1, #0x34
	b _081691AA
	.align 2, 0
_0816918C: .4byte 0x02024190
_08169190:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816919C
	adds r0, r0, r1
	movs r1, #0x35
	b _081691AA
	.align 2, 0
_0816919C: .4byte 0x02024190
_081691A0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081691C4
	adds r0, r0, r1
	movs r1, #0x36
_081691AA:
	bl GetMonData
	strb r0, [r7]
	movs r6, #1
_081691B2:
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
_081691C4: .4byte 0x02024190
	thumb_func_end CopyWallyMonData

	thumb_func_start sub_081691C8
sub_081691C8: @ 0x081691C8
	push {lr}
	bl PlayerHandleGetRawMonData
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081691C8

	thumb_func_start WallyHandleSetMonData
WallyHandleSetMonData: @ 0x081691D4
	push {r4, r5, lr}
	ldr r1, _081691F8
	ldr r0, _081691FC
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08169204
	ldr r0, _08169200
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl SetWallyMonData
	b _08169222
	.align 2, 0
_081691F8: .4byte 0x02022D08
_081691FC: .4byte 0x02023D08
_08169200: .4byte 0x02023D12
_08169204:
	ldrb r4, [r1]
	movs r5, #0
_08169208:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08169216
	adds r0, r5, #0
	bl SetWallyMonData
_08169216:
	lsrs r4, r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08169208
_08169222:
	bl WallyBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end WallyHandleSetMonData

	thumb_func_start SetWallyMonData
SetWallyMonData: @ 0x0816922C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08169264
	ldrb r0, [r0]
	lsls r0, r0, #9
	ldr r2, _08169268
	adds r3, r0, r2
	adds r6, r3, #0
	subs r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r2, #0
	cmp r0, #0x3b
	bls _08169258
	bl _08169BF2
_08169258:
	lsls r0, r0, #2
	ldr r1, _0816926C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08169264: .4byte 0x02023D08
_08169268: .4byte 0x02022D0B
_0816926C: .4byte 0x08169270
_08169270: @ jump table
	.4byte _08169360 @ case 0
	.4byte _081694F8 @ case 1
	.4byte _08169518 @ case 2
	.4byte _08169538 @ case 3
	.4byte _08169590 @ case 4
	.4byte _08169590 @ case 5
	.4byte _08169590 @ case 6
	.4byte _08169590 @ case 7
	.4byte _081695B8 @ case 8
	.4byte _0816961C @ case 9
	.4byte _0816961C @ case 10
	.4byte _0816961C @ case 11
	.4byte _0816961C @ case 12
	.4byte _08169BF2 @ case 13
	.4byte _08169BF2 @ case 14
	.4byte _08169BF2 @ case 15
	.4byte _08169BF2 @ case 16
	.4byte _0816964C @ case 17
	.4byte _0816966C @ case 18
	.4byte _0816968C @ case 19
	.4byte _081696AC @ case 20
	.4byte _081696CC @ case 21
	.4byte _081696EC @ case 22
	.4byte _0816970C @ case 23
	.4byte _0816972C @ case 24
	.4byte _0816974C @ case 25
	.4byte _0816976C @ case 26
	.4byte _0816978C @ case 27
	.4byte _081697AC @ case 28
	.4byte _081697CC @ case 29
	.4byte _081697EC @ case 30
	.4byte _0816980C @ case 31
	.4byte _0816987C @ case 32
	.4byte _0816989C @ case 33
	.4byte _081698BC @ case 34
	.4byte _081698DC @ case 35
	.4byte _081698FC @ case 36
	.4byte _0816991C @ case 37
	.4byte _0816993C @ case 38
	.4byte _0816995C @ case 39
	.4byte _0816997C @ case 40
	.4byte _0816999C @ case 41
	.4byte _081699BC @ case 42
	.4byte _081699DC @ case 43
	.4byte _081699FC @ case 44
	.4byte _08169A1C @ case 45
	.4byte _08169A3C @ case 46
	.4byte _08169A5C @ case 47
	.4byte _08169A7C @ case 48
	.4byte _08169A9C @ case 49
	.4byte _08169ABC @ case 50
	.4byte _08169ADC @ case 51
	.4byte _08169AFC @ case 52
	.4byte _08169B1C @ case 53
	.4byte _08169B3C @ case 54
	.4byte _08169B5C @ case 55
	.4byte _08169B7C @ case 56
	.4byte _08169B9C @ case 57
	.4byte _08169BBC @ case 58
	.4byte _08169BDC @ case 59
_08169360:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081694F4
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
_081693C6:
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
	ble _081693C6
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081694F4
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
	b _08169BF2
	.align 2, 0
_081694F4: .4byte 0x02024190
_081694F8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169510
	adds r0, r0, r1
	ldr r1, _08169514
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xb
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169510: .4byte 0x02024190
_08169514: .4byte 0x02023D08
_08169518:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169530
	adds r0, r0, r1
	ldr r1, _08169534
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xc
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169530: .4byte 0x02024190
_08169534: .4byte 0x02023D08
_08169538:
	movs r0, #0
	mov r8, r0
	movs r0, #0xc
	adds r0, r0, r3
	mov sb, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0816958C
	adds r7, r1, r0
	adds r6, r3, #0
	adds r6, #8
	adds r4, r3, #0
_08169552:
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
	ble _08169552
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0816958C
	adds r0, r0, r1
	movs r1, #0x15
	mov r2, sb
	bl SetMonData
	b _08169BF2
	.align 2, 0
_0816958C: .4byte 0x02024190
_08169590:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081695AC
	adds r0, r0, r1
	ldr r3, _081695B0
	ldr r1, _081695B4
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #9
	b _08169634
	.align 2, 0
_081695AC: .4byte 0x02024190
_081695B0: .4byte 0x02022D08
_081695B4: .4byte 0x02023D08
_081695B8:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08169614
	adds r4, r4, r0
	ldr r5, _08169618
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
	b _08169BF2
	.align 2, 0
_08169614: .4byte 0x02024190
_08169618: .4byte 0x02023D08
_0816961C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169640
	adds r0, r0, r1
	ldr r3, _08169644
	ldr r1, _08169648
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #8
_08169634:
	adds r3, #3
	adds r2, r2, r3
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169640: .4byte 0x02024190
_08169644: .4byte 0x02022D08
_08169648: .4byte 0x02023D08
_0816964C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169664
	adds r0, r0, r1
	ldr r1, _08169668
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #1
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169664: .4byte 0x02024190
_08169668: .4byte 0x02023D08
_0816966C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169684
	adds r0, r0, r1
	ldr r1, _08169688
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x19
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169684: .4byte 0x02024190
_08169688: .4byte 0x02023D08
_0816968C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081696A4
	adds r0, r0, r1
	ldr r1, _081696A8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1a
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081696A4: .4byte 0x02024190
_081696A8: .4byte 0x02023D08
_081696AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081696C4
	adds r0, r0, r1
	ldr r1, _081696C8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1b
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081696C4: .4byte 0x02024190
_081696C8: .4byte 0x02023D08
_081696CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081696E4
	adds r0, r0, r1
	ldr r1, _081696E8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1c
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081696E4: .4byte 0x02024190
_081696E8: .4byte 0x02023D08
_081696EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169704
	adds r0, r0, r1
	ldr r1, _08169708
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1d
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169704: .4byte 0x02024190
_08169708: .4byte 0x02023D08
_0816970C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169724
	adds r0, r0, r1
	ldr r1, _08169728
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1e
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169724: .4byte 0x02024190
_08169728: .4byte 0x02023D08
_0816972C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169744
	adds r0, r0, r1
	ldr r1, _08169748
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1f
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169744: .4byte 0x02024190
_08169748: .4byte 0x02023D08
_0816974C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169764
	adds r0, r0, r1
	ldr r1, _08169768
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x20
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169764: .4byte 0x02024190
_08169768: .4byte 0x02023D08
_0816976C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169784
	adds r0, r0, r1
	ldr r1, _08169788
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x22
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169784: .4byte 0x02024190
_08169788: .4byte 0x02023D08
_0816978C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081697A4
	adds r0, r0, r1
	ldr r1, _081697A8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x23
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081697A4: .4byte 0x02024190
_081697A8: .4byte 0x02023D08
_081697AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081697C4
	adds r0, r0, r1
	ldr r1, _081697C8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x24
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081697C4: .4byte 0x02024190
_081697C8: .4byte 0x02023D08
_081697CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081697E4
	adds r0, r0, r1
	ldr r1, _081697E8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x25
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081697E4: .4byte 0x02024190
_081697E8: .4byte 0x02023D08
_081697EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169804
	adds r0, r0, r1
	ldr r1, _08169808
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x26
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169804: .4byte 0x02024190
_08169808: .4byte 0x02023D08
_0816980C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08169874
	adds r4, r4, r0
	ldr r5, _08169878
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
	b _0816992C
	.align 2, 0
_08169874: .4byte 0x02024190
_08169878: .4byte 0x02023D08
_0816987C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169894
	adds r0, r0, r1
	ldr r1, _08169898
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x27
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169894: .4byte 0x02024190
_08169898: .4byte 0x02023D08
_0816989C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081698B4
	adds r0, r0, r1
	ldr r1, _081698B8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x28
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081698B4: .4byte 0x02024190
_081698B8: .4byte 0x02023D08
_081698BC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081698D4
	adds r0, r0, r1
	ldr r1, _081698D8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x29
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081698D4: .4byte 0x02024190
_081698D8: .4byte 0x02023D08
_081698DC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081698F4
	adds r0, r0, r1
	ldr r1, _081698F8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2a
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081698F4: .4byte 0x02024190
_081698F8: .4byte 0x02023D08
_081698FC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169914
	adds r0, r0, r1
	ldr r1, _08169918
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2b
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169914: .4byte 0x02024190
_08169918: .4byte 0x02023D08
_0816991C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169934
	adds r0, r0, r1
	ldr r1, _08169938
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
_0816992C:
	movs r1, #0x2c
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169934: .4byte 0x02024190
_08169938: .4byte 0x02023D08
_0816993C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169954
	adds r0, r0, r1
	ldr r1, _08169958
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169954: .4byte 0x02024190
_08169958: .4byte 0x02023D08
_0816995C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169974
	adds r0, r0, r1
	ldr r1, _08169978
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #9
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169974: .4byte 0x02024190
_08169978: .4byte 0x02023D08
_0816997C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169994
	adds r0, r0, r1
	ldr r1, _08169998
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x37
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169994: .4byte 0x02024190
_08169998: .4byte 0x02023D08
_0816999C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081699B4
	adds r0, r0, r1
	ldr r1, _081699B8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x38
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081699B4: .4byte 0x02024190
_081699B8: .4byte 0x02023D08
_081699BC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081699D4
	adds r0, r0, r1
	ldr r1, _081699D8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x39
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081699D4: .4byte 0x02024190
_081699D8: .4byte 0x02023D08
_081699DC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081699F4
	adds r0, r0, r1
	ldr r1, _081699F8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3a
	bl SetMonData
	b _08169BF2
	.align 2, 0
_081699F4: .4byte 0x02024190
_081699F8: .4byte 0x02023D08
_081699FC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169A14
	adds r0, r0, r1
	ldr r1, _08169A18
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3b
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169A14: .4byte 0x02024190
_08169A18: .4byte 0x02023D08
_08169A1C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169A34
	adds r0, r0, r1
	ldr r1, _08169A38
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3c
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169A34: .4byte 0x02024190
_08169A38: .4byte 0x02023D08
_08169A3C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169A54
	adds r0, r0, r1
	ldr r1, _08169A58
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3d
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169A54: .4byte 0x02024190
_08169A58: .4byte 0x02023D08
_08169A5C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169A74
	adds r0, r0, r1
	ldr r1, _08169A78
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3e
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169A74: .4byte 0x02024190
_08169A78: .4byte 0x02023D08
_08169A7C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169A94
	adds r0, r0, r1
	ldr r1, _08169A98
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3f
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169A94: .4byte 0x02024190
_08169A98: .4byte 0x02023D08
_08169A9C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169AB4
	adds r0, r0, r1
	ldr r1, _08169AB8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x16
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169AB4: .4byte 0x02024190
_08169AB8: .4byte 0x02023D08
_08169ABC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169AD4
	adds r0, r0, r1
	ldr r1, _08169AD8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x17
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169AD4: .4byte 0x02024190
_08169AD8: .4byte 0x02023D08
_08169ADC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169AF4
	adds r0, r0, r1
	ldr r1, _08169AF8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x18
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169AF4: .4byte 0x02024190
_08169AF8: .4byte 0x02023D08
_08169AFC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169B14
	adds r0, r0, r1
	ldr r1, _08169B18
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x21
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169B14: .4byte 0x02024190
_08169B18: .4byte 0x02023D08
_08169B1C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169B34
	adds r0, r0, r1
	ldr r1, _08169B38
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2f
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169B34: .4byte 0x02024190
_08169B38: .4byte 0x02023D08
_08169B3C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169B54
	adds r0, r0, r1
	ldr r1, _08169B58
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x30
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169B54: .4byte 0x02024190
_08169B58: .4byte 0x02023D08
_08169B5C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169B74
	adds r0, r0, r1
	ldr r1, _08169B78
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x32
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169B74: .4byte 0x02024190
_08169B78: .4byte 0x02023D08
_08169B7C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169B94
	adds r0, r0, r1
	ldr r1, _08169B98
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x33
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169B94: .4byte 0x02024190
_08169B98: .4byte 0x02023D08
_08169B9C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169BB4
	adds r0, r0, r1
	ldr r1, _08169BB8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x34
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169BB4: .4byte 0x02024190
_08169BB8: .4byte 0x02023D08
_08169BBC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169BD4
	adds r0, r0, r1
	ldr r1, _08169BD8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x35
	bl SetMonData
	b _08169BF2
	.align 2, 0
_08169BD4: .4byte 0x02024190
_08169BD8: .4byte 0x02023D08
_08169BDC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08169C1C
	adds r0, r0, r1
	ldr r1, _08169C20
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x36
	bl SetMonData
_08169BF2:
	ldr r2, _08169C24
	ldr r0, _08169C20
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _08169C1C
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
_08169C1C: .4byte 0x02024190
_08169C20: .4byte 0x02023D08
_08169C24: .4byte 0x02023D12
	thumb_func_end SetWallyMonData

	thumb_func_start WallyHandleSetRawMonData
WallyHandleSetRawMonData: @ 0x08169C28
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleSetRawMonData

	thumb_func_start WallyHandleLoadMonSprite
WallyHandleLoadMonSprite: @ 0x08169C34
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleLoadMonSprite

	thumb_func_start WallyHandleSwitchInAnim
WallyHandleSwitchInAnim: @ 0x08169C40
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleSwitchInAnim

	thumb_func_start WallyHandleReturnMonToBall
WallyHandleReturnMonToBall: @ 0x08169C4C
	push {r4, r5, r6, lr}
	ldr r0, _08169C78
	ldr r6, _08169C7C
	ldrb r2, [r6]
	lsls r1, r2, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08169C88
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #1
	bl InitAndLaunchSpecialAnimation
	ldr r0, _08169C80
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _08169C84
	str r0, [r1]
	b _08169CBE
	.align 2, 0
_08169C78: .4byte 0x02022D08
_08169C7C: .4byte 0x02023D08
_08169C80: .4byte 0x03005AC0
_08169C84: .4byte 0x08168829
_08169C88:
	ldr r5, _08169CC4
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08169CC8
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
	ldr r1, _08169CCC
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl WallyBufferExecCompleted
_08169CBE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08169CC4: .4byte 0x02023E88
_08169CC8: .4byte 0x020205AC
_08169CCC: .4byte 0x03005AD0
	thumb_func_end WallyHandleReturnMonToBall

	thumb_func_start WallyHandleDrawTrainerPic
WallyHandleDrawTrainerPic: @ 0x08169CD0
	push {r4, r5, r6, lr}
	ldr r4, _08169D78
	ldrb r1, [r4]
	movs r0, #6
	bl DecompressTrainerBackPic
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #6
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _08169D7C
	ldr r1, _08169D80
	ldrb r1, [r1, #0x18]
	movs r2, #8
	subs r2, r2, r1
	lsls r2, r2, #0x12
	movs r1, #0xa0
	lsls r1, r1, #0xf
	adds r2, r2, r1
	asrs r2, r2, #0x10
	movs r1, #0x50
	movs r3, #0x1e
	bl CreateSprite
	ldr r6, _08169D84
	ldrb r1, [r4]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r5, _08169D88
	ldrb r3, [r4]
	adds r0, r3, r6
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
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0xf0
	strh r1, [r0, #0x24]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _08169D8C
	strh r1, [r0, #0x2e]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, #0x1c
	adds r0, r0, r5
	ldr r1, _08169D90
	str r1, [r0]
	ldr r1, _08169D94
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08169D98
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08169D78: .4byte 0x02023D08
_08169D7C: .4byte 0x02024640
_08169D80: .4byte 0x082D95BC
_08169D84: .4byte 0x02023E88
_08169D88: .4byte 0x020205AC
_08169D8C: .4byte 0x0000FFFE
_08169D90: .4byte 0x0805D3C9
_08169D94: .4byte 0x03005AC0
_08169D98: .4byte 0x08168375
	thumb_func_end WallyHandleDrawTrainerPic

	thumb_func_start WallyHandleTrainerSlide
WallyHandleTrainerSlide: @ 0x08169D9C
	push {r4, r5, r6, lr}
	ldr r4, _08169E44
	ldrb r1, [r4]
	movs r0, #6
	bl DecompressTrainerBackPic
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #6
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _08169E48
	ldr r1, _08169E4C
	ldrb r1, [r1, #0x18]
	movs r2, #8
	subs r2, r2, r1
	lsls r2, r2, #0x12
	movs r1, #0xa0
	lsls r1, r1, #0xf
	adds r2, r2, r1
	asrs r2, r2, #0x10
	movs r1, #0x50
	movs r3, #0x1e
	bl CreateSprite
	ldr r6, _08169E50
	ldrb r1, [r4]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r5, _08169E54
	ldrb r3, [r4]
	adds r0, r3, r6
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
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _08169E58
	strh r1, [r0, #0x24]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #2
	strh r1, [r0, #0x2e]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, #0x1c
	adds r0, r0, r5
	ldr r1, _08169E5C
	str r1, [r0]
	ldr r1, _08169E60
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08169E64
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08169E44: .4byte 0x02023D08
_08169E48: .4byte 0x02024640
_08169E4C: .4byte 0x082D95BC
_08169E50: .4byte 0x02023E88
_08169E54: .4byte 0x020205AC
_08169E58: .4byte 0x0000FFA0
_08169E5C: .4byte 0x0805D3C9
_08169E60: .4byte 0x03005AC0
_08169E64: .4byte 0x08168899
	thumb_func_end WallyHandleTrainerSlide

	thumb_func_start WallyHandleTrainerSlideBack
WallyHandleTrainerSlideBack: @ 0x08169E68
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleTrainerSlideBack

	thumb_func_start WallyHandleFaintAnimation
WallyHandleFaintAnimation: @ 0x08169E74
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleFaintAnimation

	thumb_func_start WallyHandlePaletteFade
WallyHandlePaletteFade: @ 0x08169E80
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandlePaletteFade

	thumb_func_start WallyHandleSuccessBallThrowAnim
WallyHandleSuccessBallThrowAnim: @ 0x08169E8C
	push {r4, r5, lr}
	ldr r0, _08169ECC
	ldr r0, [r0]
	ldr r1, [r0, #8]
	movs r0, #4
	strb r0, [r1, #8]
	ldr r1, _08169ED0
	movs r0, #1
	strb r0, [r1]
	ldr r5, _08169ED4
	ldrb r4, [r5]
	movs r0, #1
	bl GetBattlerAtPosition
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r4, #0
	movs r3, #4
	bl InitAndLaunchSpecialAnimation
	ldr r1, _08169ED8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08169EDC
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08169ECC: .4byte 0x02024174
_08169ED0: .4byte 0x0202415D
_08169ED4: .4byte 0x02023D08
_08169ED8: .4byte 0x03005AC0
_08169EDC: .4byte 0x081683C5
	thumb_func_end WallyHandleSuccessBallThrowAnim

	thumb_func_start WallyHandleBallThrowAnim
WallyHandleBallThrowAnim: @ 0x08169EE0
	push {r4, r5, lr}
	ldr r1, _08169F28
	ldr r5, _08169F2C
	ldrb r0, [r5]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, _08169F30
	ldr r0, [r0]
	ldr r0, [r0, #8]
	strb r1, [r0, #8]
	ldr r1, _08169F34
	movs r0, #1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, #1
	bl GetBattlerAtPosition
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r4, #0
	movs r3, #4
	bl InitAndLaunchSpecialAnimation
	ldr r1, _08169F38
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08169F3C
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08169F28: .4byte 0x02022D08
_08169F2C: .4byte 0x02023D08
_08169F30: .4byte 0x02024174
_08169F34: .4byte 0x0202415D
_08169F38: .4byte 0x03005AC0
_08169F3C: .4byte 0x081683C5
	thumb_func_end WallyHandleBallThrowAnim

	thumb_func_start WallyHandlePause
WallyHandlePause: @ 0x08169F40
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandlePause

	thumb_func_start WallyHandleMoveAnimation
WallyHandleMoveAnimation: @ 0x08169F4C
	push {r4, r5, r6, lr}
	ldr r0, _0816A020
	mov ip, r0
	ldr r6, _0816A024
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
	ldr r5, _0816A028
	mov r1, ip
	adds r1, #3
	adds r2, r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0816A02C
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
	ldr r4, _0816A030
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
	ldr r3, _0816A034
	ldrb r1, [r6]
	lsls r1, r1, #9
	mov r2, ip
	adds r2, #0xa
	adds r1, r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _0816A038
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
	ldr r3, _0816A03C
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #0x10
	adds r2, r2, r1
	str r2, [r3]
	ldr r3, _0816A040
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
	beq _0816A044
	bl WallyBufferExecCompleted
	b _0816A062
	.align 2, 0
_0816A020: .4byte 0x02022D08
_0816A024: .4byte 0x02023D08
_0816A028: .4byte 0x020380D2
_0816A02C: .4byte 0x020380A8
_0816A030: .4byte 0x020380A4
_0816A034: .4byte 0x020380BA
_0816A038: .4byte 0x020380BC
_0816A03C: .4byte 0x020380A0
_0816A040: .4byte 0x02024160
_0816A044:
	ldr r0, _0816A068
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #4]
	ldr r1, _0816A06C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816A070
	str r1, [r0]
_0816A062:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816A068: .4byte 0x02024174
_0816A06C: .4byte 0x03005AC0
_0816A070: .4byte 0x0816A075
	thumb_func_end WallyHandleMoveAnimation

	thumb_func_start WallyDoMoveAnimation
WallyDoMoveAnimation: @ 0x0816A074
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0816A0B8
	ldr r6, _0816A0BC
	ldrb r3, [r6]
	lsls r1, r3, #9
	adds r0, r2, #1
	mov sb, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r2, #2
	mov r8, r2
	add r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r4, r0
	ldr r7, _0816A0C0
	ldr r5, [r7]
	ldr r1, [r5, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _0816A0FE
	cmp r2, #1
	bgt _0816A0C4
	cmp r2, #0
	beq _0816A0CE
	b _0816A1B4
	.align 2, 0
_0816A0B8: .4byte 0x02022D08
_0816A0BC: .4byte 0x02023D08
_0816A0C0: .4byte 0x02024174
_0816A0C4:
	cmp r2, #2
	beq _0816A128
	cmp r2, #3
	beq _0816A178
	b _0816A1B4
_0816A0CE:
	ldr r1, [r5]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0816A0EA
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0816A0EA:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _0816A1B4
_0816A0FE:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0816A1B4
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
	b _0816A1B4
_0816A128:
	ldr r0, _0816A170
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0816A174
	ldrb r0, [r0]
	cmp r0, #0
	bne _0816A1B4
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
	beq _0816A15C
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
_0816A15C:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #4]
	b _0816A1B4
	.align 2, 0
_0816A170: .4byte 0x02038098
_0816A174: .4byte 0x0203809D
_0816A178:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0816A1B4
	bl CopyAllBattleSpritesInvisibilities
	ldrb r0, [r6]
	lsls r2, r0, #9
	mov r3, sb
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r8
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
	bl WallyBufferExecCompleted
_0816A1B4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end WallyDoMoveAnimation

	thumb_func_start WallyHandlePrintString
WallyHandlePrintString: @ 0x0816A1C0
	push {r4, lr}
	ldr r0, _0816A1F8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0816A1FC
	strh r1, [r0]
	ldr r4, _0816A200
	ldrb r0, [r4]
	lsls r0, r0, #9
	ldr r1, _0816A204
	adds r0, r0, r1
	ldrh r0, [r0]
	bl BufferStringBattle
	ldr r0, _0816A208
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0816A20C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816A210
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816A1F8: .4byte 0x02022AC8
_0816A1FC: .4byte 0x02022ACA
_0816A200: .4byte 0x02023D08
_0816A204: .4byte 0x02022D0A
_0816A208: .4byte 0x02022AE0
_0816A20C: .4byte 0x03005AC0
_0816A210: .4byte 0x081683AD
	thumb_func_end WallyHandlePrintString

	thumb_func_start WallyHandlePrintSelectionString
WallyHandlePrintSelectionString: @ 0x0816A214
	push {lr}
	ldr r0, _0816A22C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816A230
	bl WallyHandlePrintString
	b _0816A234
	.align 2, 0
_0816A22C: .4byte 0x02023D08
_0816A230:
	bl WallyBufferExecCompleted
_0816A234:
	pop {r0}
	bx r0
	thumb_func_end WallyHandlePrintSelectionString

	thumb_func_start HandleChooseActionAfterDma3
HandleChooseActionAfterDma3: @ 0x0816A238
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0816A25E
	ldr r0, _0816A264
	strh r1, [r0]
	ldr r1, _0816A268
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _0816A26C
	ldr r0, _0816A270
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816A274
	str r1, [r0]
_0816A25E:
	pop {r0}
	bx r0
	.align 2, 0
_0816A264: .4byte 0x02022AC8
_0816A268: .4byte 0x02022ACA
_0816A26C: .4byte 0x03005AC0
_0816A270: .4byte 0x02023D08
_0816A274: .4byte 0x0816824D
	thumb_func_end HandleChooseActionAfterDma3

	thumb_func_start WallyHandleChooseAction
WallyHandleChooseAction: @ 0x0816A278
	push {r4, lr}
	ldr r1, _0816A2C4
	ldr r0, _0816A2C8
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816A2CC
	str r1, [r0]
	ldr r0, _0816A2D0
	movs r1, #2
	bl sub_0814FA04
	movs r4, #0
_0816A292:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl ActionSelectionDestroyCursorAt
	adds r4, #1
	cmp r4, #3
	ble _0816A292
	ldr r1, _0816A2D4
	ldr r0, _0816A2C8
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl SetCB2ToReshowScreenAfterMenu
	ldr r0, _0816A2D8
	bl TryGetStatusString
	ldr r0, _0816A2DC
	movs r1, #1
	bl sub_0814FA04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816A2C4: .4byte 0x03005AC0
_0816A2C8: .4byte 0x02023D08
_0816A2CC: .4byte 0x0816A239
_0816A2D0: .4byte 0x085ABB72
_0816A2D4: .4byte 0x02024150
_0816A2D8: .4byte 0x085ABB57
_0816A2DC: .4byte 0x02022AE0
	thumb_func_end WallyHandleChooseAction

	thumb_func_start WallyHandleUnknownYesNoBox
WallyHandleUnknownYesNoBox: @ 0x0816A2E0
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleUnknownYesNoBox

	thumb_func_start WallyHandleChooseMove
WallyHandleChooseMove: @ 0x0816A2EC
	push {r4, lr}
	ldr r4, _0816A308
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x95
	ldrb r0, [r0]
	cmp r0, #1
	beq _0816A32A
	cmp r0, #1
	bgt _0816A30C
	cmp r0, #0
	beq _0816A312
	b _0816A37C
	.align 2, 0
_0816A308: .4byte 0x02024140
_0816A30C:
	cmp r0, #2
	beq _0816A358
	b _0816A37C
_0816A312:
	bl InitMoveSelectionsVarsAndStrings
	ldr r1, [r4]
	adds r1, #0x95
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x97
	movs r1, #0x50
	strb r1, [r0]
	b _0816A37C
_0816A32A:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0816A37C
	ldr r0, _0816A350
	strh r1, [r0]
	ldr r1, _0816A354
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r4]
	adds r1, #0x95
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0816A37C
	.align 2, 0
_0816A350: .4byte 0x02022AC8
_0816A354: .4byte 0x02022ACA
_0816A358:
	adds r1, #0x97
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816A37C
	movs r0, #5
	bl PlaySE
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
	bl WallyBufferExecCompleted
_0816A37C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleChooseMove

	thumb_func_start WallyHandleChooseItem
WallyHandleChooseItem: @ 0x0816A384
	push {lr}
	sub sp, #4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _0816A3B4
	ldr r2, _0816A3B8
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816A3BC
	str r1, [r0]
	ldr r1, _0816A3C0
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0816A3B4: .4byte 0x03005AC0
_0816A3B8: .4byte 0x02023D08
_0816A3BC: .4byte 0x081683DD
_0816A3C0: .4byte 0x0202415C
	thumb_func_end WallyHandleChooseItem

	thumb_func_start WallyHandleChoosePokemon
WallyHandleChoosePokemon: @ 0x0816A3C4
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleChoosePokemon

	thumb_func_start WallyHandleCmd23
WallyHandleCmd23: @ 0x0816A3D0
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleCmd23

	thumb_func_start WallyHandleHealthBarUpdate
WallyHandleHealthBarUpdate: @ 0x0816A3DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	bl LoadBattleBarGfx
	ldr r3, _0816A454
	ldr r0, _0816A458
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
	ldr r0, _0816A45C
	cmp r7, r0
	beq _0816A46C
	ldr r6, _0816A460
	lsls r0, r4, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _0816A464
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
	ldr r1, _0816A468
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _0816A4A6
	.align 2, 0
_0816A454: .4byte 0x02022D08
_0816A458: .4byte 0x02023D08
_0816A45C: .4byte 0x00007FFF
_0816A460: .4byte 0x02023D12
_0816A464: .4byte 0x02024190
_0816A468: .4byte 0x03005AD0
_0816A46C:
	ldr r1, _0816A4C4
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0816A4C8
	adds r0, r0, r1
	movs r1, #0x3a
	bl GetMonData
	adds r2, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r4, _0816A4CC
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
_0816A4A6:
	ldr r1, _0816A4D0
	ldr r0, _0816A4D4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816A4D8
	str r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816A4C4: .4byte 0x02023D12
_0816A4C8: .4byte 0x02024190
_0816A4CC: .4byte 0x03005AD0
_0816A4D0: .4byte 0x03005AC0
_0816A4D4: .4byte 0x02023D08
_0816A4D8: .4byte 0x0816873D
	thumb_func_end WallyHandleHealthBarUpdate

	thumb_func_start WallyHandleExpUpdate
WallyHandleExpUpdate: @ 0x0816A4DC
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleExpUpdate

	thumb_func_start WallyHandleStatusIconUpdate
WallyHandleStatusIconUpdate: @ 0x0816A4E8
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleStatusIconUpdate

	thumb_func_start WallyHandleStatusAnimation
WallyHandleStatusAnimation: @ 0x0816A4F4
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleStatusAnimation

	thumb_func_start WallyHandleStatusXor
WallyHandleStatusXor: @ 0x0816A500
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleStatusXor

	thumb_func_start WallyHandleDataTransfer
WallyHandleDataTransfer: @ 0x0816A50C
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleDataTransfer

	thumb_func_start WallyHandleDMA3Transfer
WallyHandleDMA3Transfer: @ 0x0816A518
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleDMA3Transfer

	thumb_func_start WallyHandlePlayBGM
WallyHandlePlayBGM: @ 0x0816A524
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandlePlayBGM

	thumb_func_start WallyHandleCmd32
WallyHandleCmd32: @ 0x0816A530
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleCmd32

	thumb_func_start WallyHandleTwoReturnValues
WallyHandleTwoReturnValues: @ 0x0816A53C
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleTwoReturnValues

	thumb_func_start sub_0816A548
sub_0816A548: @ 0x0816A548
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0816A548

	thumb_func_start sub_0816A554
sub_0816A554: @ 0x0816A554
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0816A554

	thumb_func_start WallyHandleOneReturnValue_Duplicate
WallyHandleOneReturnValue_Duplicate: @ 0x0816A560
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleOneReturnValue_Duplicate

	thumb_func_start WallyHandleCmd37
WallyHandleCmd37: @ 0x0816A56C
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleCmd37

	thumb_func_start WallyHandleCmd38
WallyHandleCmd38: @ 0x0816A578
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleCmd38

	thumb_func_start sub_0816A584
sub_0816A584: @ 0x0816A584
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0816A584

	thumb_func_start WallyHandleCmd40
WallyHandleCmd40: @ 0x0816A590
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleCmd40

	thumb_func_start WallyHandleHitAnimation
WallyHandleHitAnimation: @ 0x0816A59C
	push {r4, lr}
	ldr r3, _0816A5C4
	ldr r2, _0816A5C8
	ldr r4, _0816A5CC
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
	bge _0816A5D0
	bl WallyBufferExecCompleted
	b _0816A5FA
	.align 2, 0
_0816A5C4: .4byte 0x020205AC
_0816A5C8: .4byte 0x02023E88
_0816A5CC: .4byte 0x02023D08
_0816A5D0:
	ldr r1, _0816A600
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
	ldr r1, _0816A604
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816A608
	str r1, [r0]
_0816A5FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816A600: .4byte 0x0202415D
_0816A604: .4byte 0x03005AC0
_0816A608: .4byte 0x081687AD
	thumb_func_end WallyHandleHitAnimation

	thumb_func_start WallyHandleCmd42
WallyHandleCmd42: @ 0x0816A60C
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleCmd42

	thumb_func_start WallyHandlePlaySE
WallyHandlePlaySE: @ 0x0816A618
	push {lr}
	ldr r2, _0816A640
	ldr r0, _0816A644
	ldrb r1, [r0]
	lsls r1, r1, #9
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlaySE
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0816A640: .4byte 0x02022D08
_0816A644: .4byte 0x02023D08
	thumb_func_end WallyHandlePlaySE

	thumb_func_start WallyHandlePlayFanfareOrBGM
WallyHandlePlayFanfareOrBGM: @ 0x0816A648
	push {r4, r5, lr}
	ldr r4, _0816A67C
	ldr r5, _0816A680
	ldrb r0, [r5]
	lsls r3, r0, #9
	adds r0, r4, #3
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0816A684
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
	b _0816A698
	.align 2, 0
_0816A67C: .4byte 0x02022D08
_0816A680: .4byte 0x02023D08
_0816A684:
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayFanfare
_0816A698:
	bl WallyBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandlePlayFanfareOrBGM

	thumb_func_start WallyHandleFaintingCry
WallyHandleFaintingCry: @ 0x0816A6A4
	push {lr}
	ldr r1, _0816A6D4
	ldr r0, _0816A6D8
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0816A6DC
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	bl PlayCry1
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0816A6D4: .4byte 0x02023D12
_0816A6D8: .4byte 0x02023D08
_0816A6DC: .4byte 0x02024190
	thumb_func_end WallyHandleFaintingCry

	thumb_func_start WallyHandleIntroSlide
WallyHandleIntroSlide: @ 0x0816A6E0
	push {lr}
	ldr r1, _0816A708
	ldr r0, _0816A70C
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _0816A710
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0816A708: .4byte 0x02022D08
_0816A70C: .4byte 0x02023D08
_0816A710: .4byte 0x020240A0
	thumb_func_end WallyHandleIntroSlide

	thumb_func_start WallyHandleIntroTrainerBallThrow
WallyHandleIntroTrainerBallThrow: @ 0x0816A714
	push {r4, r5, r6, r7, lr}
	ldr r6, _0816A84C
	ldr r7, _0816A850
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0816A854
	adds r0, r0, r5
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x32
	strh r1, [r0, #0x2e]
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0816A858
	strh r1, [r0, #0x32]
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0816A85C
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x38]
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0816A860
	bl StoreSpriteCallbackInData6
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, _0816A864
	bl AllocSpritePalette
	adds r4, r0, #0
	lsls r4, r4, #0x18
	ldr r0, _0816A868
	ldr r0, [r0, #0x30]
	lsrs r4, r4, #0x14
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r2, #0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, #5]
	ldr r0, _0816A86C
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0816A870
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r7]
	strh r0, [r1, #8]
	ldr r3, _0816A874
	ldr r0, [r3]
	ldrb r2, [r7]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0816A82C
	ldr r0, _0816A878
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, _0816A87C
	str r1, [r0]
_0816A82C:
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r0, [r2, #9]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #9]
	ldr r1, _0816A880
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816A884
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816A84C: .4byte 0x02023E88
_0816A850: .4byte 0x02023D08
_0816A854: .4byte 0x020205AC
_0816A858: .4byte 0x0000FFD8
_0816A85C: .4byte 0x080A67B5
_0816A860: .4byte 0x0805C81D
_0816A864: .4byte 0x0000D6F8
_0816A868: .4byte 0x082D961C
_0816A86C: .4byte 0x0816AA0D
_0816A870: .4byte 0x03005B60
_0816A874: .4byte 0x02024174
_0816A878: .4byte 0x02024158
_0816A87C: .4byte 0x0807352D
_0816A880: .4byte 0x03005AC0
_0816A884: .4byte 0x08057069
	thumb_func_end WallyHandleIntroTrainerBallThrow

	thumb_func_start sub_0816A888
sub_0816A888: @ 0x0816A888
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0816A9E0
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, _0816A9E4
	lsls r2, r6, #1
	adds r2, r2, r0
	ldr r0, _0816A9E8
	lsls r1, r6, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0816A9EC
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0816A9F0
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _0816A9F4
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
	ldr r0, _0816A9F8
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
	ldr r4, _0816A9FC
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0816AA00
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
	ldr r1, _0816AA04
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
	ldr r1, _0816AA08
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
_0816A9E0: .4byte 0x02024174
_0816A9E4: .4byte 0x02023D12
_0816A9E8: .4byte 0x02022D08
_0816A9EC: .4byte 0x02024190
_0816A9F0: .4byte 0x0805D331
_0816A9F4: .4byte 0x03005ADC
_0816A9F8: .4byte 0x02024640
_0816A9FC: .4byte 0x02023E88
_0816AA00: .4byte 0x020205AC
_0816AA04: .4byte 0x02024188
_0816AA08: .4byte 0x08007141
	thumb_func_end sub_0816A888

	thumb_func_start sub_0816AA0C
sub_0816AA0C: @ 0x0816AA0C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0816AA2C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	bgt _0816AA30
	adds r0, r2, #1
	strh r0, [r1, #0xa]
	b _0816AA66
	.align 2, 0
_0816AA2C: .4byte 0x03005B60
_0816AA30:
	ldr r4, _0816AA6C
	ldrb r5, [r4]
	ldrh r0, [r1, #8]
	strb r0, [r4]
	ldr r0, _0816AA70
	ldrb r1, [r4]
	lsls r2, r1, #9
	adds r0, #1
	adds r2, r2, r0
	ldr r0, _0816AA74
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_0816A888
	ldr r1, _0816AA78
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0816AA7C
	str r1, [r0]
	strb r5, [r4]
	adds r0, r6, #0
	bl DestroyTask
_0816AA66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816AA6C: .4byte 0x02023D08
_0816AA70: .4byte 0x02022D08
_0816AA74: .4byte 0x02023D12
_0816AA78: .4byte 0x03005AC0
_0816AA7C: .4byte 0x08168455
	thumb_func_end sub_0816AA0C

	thumb_func_start WallyHandleDrawPartyStatusSummary
WallyHandleDrawPartyStatusSummary: @ 0x0816AA80
	push {r4, r5, lr}
	ldr r1, _0816AAA8
	ldr r0, _0816AAAC
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0816AAB0
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816AAB0
	bl WallyBufferExecCompleted
	b _0816AAEE
	.align 2, 0
_0816AAA8: .4byte 0x02022D08
_0816AAAC: .4byte 0x02023D08
_0816AAB0:
	ldr r0, _0816AAF4
	ldr r0, [r0]
	ldr r5, _0816AAF8
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
	lsls r4, r0, #9
	ldr r3, _0816AAFC
	adds r1, r4, r3
	subs r2, r3, #3
	adds r2, r4, r2
	ldrb r2, [r2]
	subs r3, #2
	adds r4, r4, r3
	ldrb r3, [r4]
	bl CreatePartyStatusSummarySprites
	ldr r2, _0816AB00
	ldrb r1, [r5]
	adds r1, r1, r2
	strb r0, [r1]
	bl WallyBufferExecCompleted
_0816AAEE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816AAF4: .4byte 0x02024174
_0816AAF8: .4byte 0x02023D08
_0816AAFC: .4byte 0x02022D0C
_0816AB00: .4byte 0x02024158
	thumb_func_end WallyHandleDrawPartyStatusSummary

	thumb_func_start WallyHandleHidePartyStatusSummary
WallyHandleHidePartyStatusSummary: @ 0x0816AB04
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleHidePartyStatusSummary

	thumb_func_start WallyHandleEndBounceEffect
WallyHandleEndBounceEffect: @ 0x0816AB10
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleEndBounceEffect

	thumb_func_start WallyHandleSpriteInvisibility
WallyHandleSpriteInvisibility: @ 0x0816AB1C
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleSpriteInvisibility

	thumb_func_start WallyHandleBattleAnimation
WallyHandleBattleAnimation: @ 0x0816AB28
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _0816AB60
	ldr r6, _0816AB64
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
	beq _0816AB68
	bl WallyBufferExecCompleted
	b _0816AB74
	.align 2, 0
_0816AB60: .4byte 0x02022D08
_0816AB64: .4byte 0x02023D08
_0816AB68:
	ldr r0, _0816AB7C
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0816AB80
	str r0, [r1]
_0816AB74:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816AB7C: .4byte 0x03005AC0
_0816AB80: .4byte 0x081688D1
	thumb_func_end WallyHandleBattleAnimation

	thumb_func_start WallyHandleLinkStandbyMsg
WallyHandleLinkStandbyMsg: @ 0x0816AB84
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleLinkStandbyMsg

	thumb_func_start WallyHandleResetActionMoveSelection
WallyHandleResetActionMoveSelection: @ 0x0816AB90
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallyHandleResetActionMoveSelection

	thumb_func_start WallyHandleCmd55
WallyHandleCmd55: @ 0x0816AB9C
	push {r4, lr}
	ldr r2, _0816ABE0
	ldr r1, _0816ABE4
	ldr r4, _0816ABE8
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
	bl WallyBufferExecCompleted
	ldr r0, _0816ABEC
	ldr r0, [r0]
	movs r1, #6
	ands r0, r1
	cmp r0, #2
	bne _0816ABD8
	ldr r0, _0816ABF0
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0816ABF4
	str r0, [r1]
_0816ABD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816ABE0: .4byte 0x02023FDE
_0816ABE4: .4byte 0x02022D08
_0816ABE8: .4byte 0x02023D08
_0816ABEC: .4byte 0x02022C90
_0816ABF0: .4byte 0x03005AC0
_0816ABF4: .4byte 0x080583C1
	thumb_func_end WallyHandleCmd55

	thumb_func_start SpriteCB_Null7
SpriteCB_Null7: @ 0x0816ABF8
	bx lr
	.align 2, 0
	thumb_func_end SpriteCB_Null7

