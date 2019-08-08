.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SpriteCB_Null4
SpriteCB_Null4: @ 0x081592A4
	bx lr
	.align 2, 0
	thumb_func_end SpriteCB_Null4

	thumb_func_start SetControllerToSafari
SetControllerToSafari: @ 0x081592A8
	ldr r1, _081592B8
	ldr r0, _081592BC
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081592C0
	str r1, [r0]
	bx lr
	.align 2, 0
_081592B8: .4byte 0x03005AC0
_081592BC: .4byte 0x02023D08
_081592C0: .4byte 0x081592C5
	thumb_func_end SetControllerToSafari

	thumb_func_start SafariBufferRunCommand
SafariBufferRunCommand: @ 0x081592C4
	push {lr}
	ldr r2, _081592F8
	ldr r1, _081592FC
	ldr r0, _08159300
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08159310
	ldr r0, _08159304
	lsls r1, r3, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x38
	bhi _0815930C
	ldr r0, _08159308
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _08159310
	.align 2, 0
_081592F8: .4byte 0x02023D0C
_081592FC: .4byte 0x082FACB4
_08159300: .4byte 0x02023D08
_08159304: .4byte 0x02022D08
_08159308: .4byte 0x085ACD28
_0815930C:
	bl SafariBufferExecCompleted
_08159310:
	pop {r0}
	bx r0
	thumb_func_end SafariBufferRunCommand

	thumb_func_start HandleInputChooseAction
HandleInputChooseAction: @ 0x08159314
	push {r4, r5, lr}
	ldr r0, _08159344
	ldrh r1, [r0, #0x2e]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08159382
	movs r0, #5
	bl PlaySE
	ldr r1, _08159348
	ldr r0, _0815934C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08159360
	cmp r0, #1
	bgt _08159350
	cmp r0, #0
	beq _0815935A
	b _0815937C
	.align 2, 0
_08159344: .4byte 0x03002360
_08159348: .4byte 0x02024150
_0815934C: .4byte 0x02023D08
_08159350:
	cmp r0, #2
	beq _08159366
	cmp r0, #3
	beq _08159372
	b _0815937C
_0815935A:
	movs r0, #1
	movs r1, #5
	b _0815936A
_08159360:
	movs r0, #1
	movs r1, #6
	b _0815936A
_08159366:
	movs r0, #1
	movs r1, #7
_0815936A:
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	b _0815937C
_08159372:
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
_0815937C:
	bl SafariBufferExecCompleted
	b _0815948A
_08159382:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081593C0
	ldr r5, _081593B8
	ldr r4, _081593BC
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0815948A
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r2, #1
	b _0815942E
	.align 2, 0
_081593B8: .4byte 0x02024150
_081593BC: .4byte 0x02023D08
_081593C0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081593FC
	ldr r5, _081593F4
	ldr r4, _081593F8
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0815948A
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r2, #1
	b _0815942E
	.align 2, 0
_081593F4: .4byte 0x02024150
_081593F8: .4byte 0x02023D08
_081593FC:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08159448
	ldr r5, _08159440
	ldr r4, _08159444
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0815948A
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r2, #2
_0815942E:
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0
	bl SetCB2ToReshowScreenAfterMenu
	b _0815948A
	.align 2, 0
_08159440: .4byte 0x02024150
_08159444: .4byte 0x02023D08
_08159448:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0815948A
	ldr r5, _08159490
	ldr r4, _08159494
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0815948A
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r2, #2
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0
	bl SetCB2ToReshowScreenAfterMenu
_0815948A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08159490: .4byte 0x02024150
_08159494: .4byte 0x02023D08
	thumb_func_end HandleInputChooseAction

	thumb_func_start CompleteOnHealthboxSpriteCallbackDummy
CompleteOnHealthboxSpriteCallbackDummy: @ 0x08159498
	push {lr}
	ldr r2, _081594C0
	ldr r1, _081594C4
	ldr r0, _081594C8
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081594CC
	cmp r1, r0
	bne _081594BC
	bl SafariBufferExecCompleted
_081594BC:
	pop {r0}
	bx r0
	.align 2, 0
_081594C0: .4byte 0x020205AC
_081594C4: .4byte 0x02023E88
_081594C8: .4byte 0x02023D08
_081594CC: .4byte 0x08007141
	thumb_func_end CompleteOnHealthboxSpriteCallbackDummy

	thumb_func_start SafariHandlePrintSelectionString
SafariHandlePrintSelectionString: @ 0x081594D0
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081594E2
	bl SafariBufferExecCompleted
_081594E2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandlePrintSelectionString

	thumb_func_start CompleteWhenChosePokeblock
CompleteWhenChosePokeblock: @ 0x081594E8
	push {lr}
	ldr r2, _08159510
	ldr r1, _08159514
	ldr r0, _08159518
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0815951C
	cmp r1, r0
	bne _0815950C
	bl SafariBufferExecCompleted
_0815950C:
	pop {r0}
	bx r0
	.align 2, 0
_08159510: .4byte 0x020205AC
_08159514: .4byte 0x03005AD0
_08159518: .4byte 0x02023D08
_0815951C: .4byte 0x08007141
	thumb_func_end CompleteWhenChosePokeblock

	thumb_func_start sub_08159520
sub_08159520: @ 0x08159520
	push {lr}
	ldr r0, _08159550
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0815954A
	ldr r2, _08159554
	ldr r0, _08159558
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0815955C
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, #8]
	bl SetMainCallback2
_0815954A:
	pop {r0}
	bx r0
	.align 2, 0
_08159550: .4byte 0x02037C74
_08159554: .4byte 0x03002360
_08159558: .4byte 0x00000439
_0815955C: .4byte 0x03005A60
	thumb_func_end sub_08159520

	thumb_func_start CompleteOnSpecialAnimDone
CompleteOnSpecialAnimDone: @ 0x08159560
	push {lr}
	ldr r0, _08159590
	ldrb r0, [r0]
	cmp r0, #0
	beq _08159586
	ldr r0, _08159594
	ldr r2, [r0]
	ldr r0, _08159598
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0815958A
_08159586:
	bl SafariBufferExecCompleted
_0815958A:
	pop {r0}
	bx r0
	.align 2, 0
_08159590: .4byte 0x0202415D
_08159594: .4byte 0x02024174
_08159598: .4byte 0x02023D08
	thumb_func_end CompleteOnSpecialAnimDone

	thumb_func_start SafariOpenPokeblockCase
SafariOpenPokeblockCase: @ 0x0815959C
	push {lr}
	ldr r0, _081595C4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081595C0
	ldr r1, _081595C8
	ldr r0, _081595CC
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081595D0
	str r1, [r0]
	bl FreeAllWindowBuffers
	bl sub_08135944
_081595C0:
	pop {r0}
	bx r0
	.align 2, 0
_081595C4: .4byte 0x02037C74
_081595C8: .4byte 0x03005AC0
_081595CC: .4byte 0x02023D08
_081595D0: .4byte 0x081595D5
	thumb_func_end SafariOpenPokeblockCase

	thumb_func_start sub_081595D4
sub_081595D4: @ 0x081595D4
	push {lr}
	ldr r0, _08159600
	ldr r1, [r0, #4]
	ldr r0, _08159604
	cmp r1, r0
	bne _081595FA
	ldr r0, _08159608
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081595FA
	ldr r0, _0815960C
	ldrh r1, [r0]
	movs r0, #1
	bl BtlController_EmitOneReturnValue
	bl SafariBufferExecCompleted
_081595FA:
	pop {r0}
	bx r0
	.align 2, 0
_08159600: .4byte 0x03002360
_08159604: .4byte 0x080380FD
_08159608: .4byte 0x02037C74
_0815960C: .4byte 0x0203CB48
	thumb_func_end sub_081595D4

	thumb_func_start SafariHandleSuccessBallThrowAnim
SafariHandleSuccessBallThrowAnim: @ 0x08159610
	push {lr}
	ldr r0, _08159638
	ldr r2, [r0]
	ldr r0, _0815963C
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
	bne _08159632
	bl SafariBufferExecCompleted
_08159632:
	pop {r0}
	bx r0
	.align 2, 0
_08159638: .4byte 0x02024174
_0815963C: .4byte 0x02023D08
	thumb_func_end SafariHandleSuccessBallThrowAnim

	thumb_func_start SafariBufferExecCompleted
SafariBufferExecCompleted: @ 0x08159640
	push {r4, lr}
	sub sp, #4
	ldr r1, _08159680
	ldr r4, _08159684
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08159688
	str r1, [r0]
	ldr r0, _0815968C
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08159694
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, #2
	movs r1, #4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _08159690
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r1
	movs r1, #0x38
	strb r1, [r0]
	b _081596A6
	.align 2, 0
_08159680: .4byte 0x03005AC0
_08159684: .4byte 0x02023D08
_08159688: .4byte 0x081592C5
_0815968C: .4byte 0x02022C90
_08159690: .4byte 0x02022D08
_08159694:
	ldr r2, _081596B0
	ldr r1, _081596B4
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_081596A6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081596B0: .4byte 0x02023D0C
_081596B4: .4byte 0x082FACB4
	thumb_func_end SafariBufferExecCompleted

	thumb_func_start SafariHandleBallThrowAnim
SafariHandleBallThrowAnim: @ 0x081596B8
	push {lr}
	ldr r0, _081596E0
	ldr r2, [r0]
	ldr r0, _081596E4
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
	bne _081596DA
	bl SafariBufferExecCompleted
_081596DA:
	pop {r0}
	bx r0
	.align 2, 0
_081596E0: .4byte 0x02024174
_081596E4: .4byte 0x02023D08
	thumb_func_end SafariHandleBallThrowAnim

	thumb_func_start SafariHandleGetMonData
SafariHandleGetMonData: @ 0x081596E8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleGetMonData

	thumb_func_start SafariHandleGetRawMonData
SafariHandleGetRawMonData: @ 0x081596F4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleGetRawMonData

	thumb_func_start SafariHandleSetMonData
SafariHandleSetMonData: @ 0x08159700
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleSetMonData

	thumb_func_start SafariHandleSetRawMonData
SafariHandleSetRawMonData: @ 0x0815970C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleSetRawMonData

	thumb_func_start SafariHandleLoadMonSprite
SafariHandleLoadMonSprite: @ 0x08159718
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleLoadMonSprite

	thumb_func_start SafariHandleSwitchInAnim
SafariHandleSwitchInAnim: @ 0x08159724
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleSwitchInAnim

	thumb_func_start SafariHandleReturnMonToBall
SafariHandleReturnMonToBall: @ 0x08159730
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleReturnMonToBall

	thumb_func_start SafariHandleDrawTrainerPic
SafariHandleDrawTrainerPic: @ 0x0815973C
	push {r4, r5, r6, lr}
	ldr r4, _081597F4
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	ldr r5, _081597F8
	ldrb r1, [r5]
	bl DecompressTrainerBackPic
	ldr r0, [r4]
	ldrb r6, [r0, #8]
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _081597FC
	ldr r2, _08159800
	ldr r1, [r4]
	ldrb r1, [r1, #8]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1]
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
	ldr r6, _08159804
	ldrb r1, [r5]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r4, _08159808
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
	ldr r1, _0815980C
	strh r1, [r0, #0x2e]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _08159810
	str r1, [r0]
	ldr r1, _08159814
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08159818
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081597F4: .4byte 0x03005AF0
_081597F8: .4byte 0x02023D08
_081597FC: .4byte 0x02024640
_08159800: .4byte 0x082D95BC
_08159804: .4byte 0x02023E88
_08159808: .4byte 0x020205AC
_0815980C: .4byte 0x0000FFFE
_08159810: .4byte 0x0805D3C9
_08159814: .4byte 0x03005AC0
_08159818: .4byte 0x08159499
	thumb_func_end SafariHandleDrawTrainerPic

	thumb_func_start SafariHandleTrainerSlide
SafariHandleTrainerSlide: @ 0x0815981C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleTrainerSlide

	thumb_func_start SafariHandleTrainerSlideBack
SafariHandleTrainerSlideBack: @ 0x08159828
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleTrainerSlideBack

	thumb_func_start SafariHandleFaintAnimation
SafariHandleFaintAnimation: @ 0x08159834
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleFaintAnimation

	thumb_func_start SafariHandlePaletteFade
SafariHandlePaletteFade: @ 0x08159840
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandlePaletteFade

	thumb_func_start sub_0815984C
sub_0815984C: @ 0x0815984C
	push {r4, r5, lr}
	ldr r0, _0815988C
	ldr r0, [r0]
	ldr r1, [r0, #8]
	movs r0, #4
	strb r0, [r1, #8]
	ldr r1, _08159890
	movs r0, #1
	strb r0, [r1]
	ldr r5, _08159894
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
	ldr r1, _08159898
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0815989C
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815988C: .4byte 0x02024174
_08159890: .4byte 0x0202415D
_08159894: .4byte 0x02023D08
_08159898: .4byte 0x03005AC0
_0815989C: .4byte 0x08159561
	thumb_func_end sub_0815984C

	thumb_func_start sub_081598A0
sub_081598A0: @ 0x081598A0
	push {r4, r5, lr}
	ldr r1, _081598E8
	ldr r5, _081598EC
	ldrb r0, [r5]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, _081598F0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	strb r1, [r0, #8]
	ldr r1, _081598F4
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
	ldr r1, _081598F8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081598FC
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081598E8: .4byte 0x02022D08
_081598EC: .4byte 0x02023D08
_081598F0: .4byte 0x02024174
_081598F4: .4byte 0x0202415D
_081598F8: .4byte 0x03005AC0
_081598FC: .4byte 0x08159561
	thumb_func_end sub_081598A0

	thumb_func_start SafariHandlePause
SafariHandlePause: @ 0x08159900
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandlePause

	thumb_func_start SafariHandleMoveAnimation
SafariHandleMoveAnimation: @ 0x0815990C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleMoveAnimation

	thumb_func_start SafariHandlePrintString
SafariHandlePrintString: @ 0x08159918
	push {r4, lr}
	ldr r0, _08159950
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08159954
	strh r1, [r0]
	ldr r4, _08159958
	ldrb r0, [r4]
	lsls r0, r0, #9
	ldr r1, _0815995C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl BufferStringBattle
	ldr r0, _08159960
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _08159964
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08159968
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08159950: .4byte 0x02022AC8
_08159954: .4byte 0x02022ACA
_08159958: .4byte 0x02023D08
_0815995C: .4byte 0x02022D0A
_08159960: .4byte 0x02022AE0
_08159964: .4byte 0x03005AC0
_08159968: .4byte 0x081594D1
	thumb_func_end SafariHandlePrintString

	thumb_func_start sub_0815996C
sub_0815996C: @ 0x0815996C
	push {lr}
	ldr r0, _08159984
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08159988
	bl SafariHandlePrintString
	b _0815998C
	.align 2, 0
_08159984: .4byte 0x02023D08
_08159988:
	bl SafariBufferExecCompleted
_0815998C:
	pop {r0}
	bx r0
	thumb_func_end sub_0815996C

	thumb_func_start sub_08159990
sub_08159990: @ 0x08159990
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _081599B6
	ldr r0, _081599BC
	strh r1, [r0]
	ldr r1, _081599C0
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _081599C4
	ldr r0, _081599C8
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081599CC
	str r1, [r0]
_081599B6:
	pop {r0}
	bx r0
	.align 2, 0
_081599BC: .4byte 0x02022AC8
_081599C0: .4byte 0x02022ACA
_081599C4: .4byte 0x03005AC0
_081599C8: .4byte 0x02023D08
_081599CC: .4byte 0x08159315
	thumb_func_end sub_08159990

	thumb_func_start SafariHandleChooseAction
SafariHandleChooseAction: @ 0x081599D0
	push {r4, lr}
	ldr r1, _08159A1C
	ldr r0, _08159A20
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08159A24
	str r1, [r0]
	ldr r0, _08159A28
	movs r1, #2
	bl sub_0814FA04
	movs r4, #0
_081599EA:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl ActionSelectionDestroyCursorAt
	adds r4, #1
	cmp r4, #3
	ble _081599EA
	ldr r1, _08159A2C
	ldr r0, _08159A20
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl SetCB2ToReshowScreenAfterMenu
	ldr r0, _08159A30
	bl TryGetStatusString
	ldr r0, _08159A34
	movs r1, #1
	bl sub_0814FA04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08159A1C: .4byte 0x03005AC0
_08159A20: .4byte 0x02023D08
_08159A24: .4byte 0x08159991
_08159A28: .4byte 0x085ABB86
_08159A2C: .4byte 0x02024150
_08159A30: .4byte 0x085ABB4D
_08159A34: .4byte 0x02022AE0
	thumb_func_end SafariHandleChooseAction

	thumb_func_start SafariHandleUnknownYesNoBox
SafariHandleUnknownYesNoBox: @ 0x08159A38
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleUnknownYesNoBox

	thumb_func_start SafariHandleChooseMove
SafariHandleChooseMove: @ 0x08159A44
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleChooseMove

	thumb_func_start SafariHandleChooseItem
SafariHandleChooseItem: @ 0x08159A50
	push {lr}
	sub sp, #4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _08159A80
	ldr r2, _08159A84
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08159A88
	str r1, [r0]
	ldr r1, _08159A8C
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08159A80: .4byte 0x03005AC0
_08159A84: .4byte 0x02023D08
_08159A88: .4byte 0x0815959D
_08159A8C: .4byte 0x0202415C
	thumb_func_end SafariHandleChooseItem

	thumb_func_start SafariHandleChoosePokemon
SafariHandleChoosePokemon: @ 0x08159A90
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleChoosePokemon

	thumb_func_start SafariHandleCmd23
SafariHandleCmd23: @ 0x08159A9C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleCmd23

	thumb_func_start SafariHandleHealthBarUpdate
SafariHandleHealthBarUpdate: @ 0x08159AA8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleHealthBarUpdate

	thumb_func_start SafariHandleExpUpdate
SafariHandleExpUpdate: @ 0x08159AB4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleExpUpdate

	thumb_func_start SafariHandleStatusIconUpdate
SafariHandleStatusIconUpdate: @ 0x08159AC0
	push {lr}
	ldr r0, _08159AEC
	ldr r1, _08159AF0
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08159AF4
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08159AF8
	adds r1, r1, r2
	movs r2, #0xb
	bl UpdateHealthboxAttribute
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08159AEC: .4byte 0x03005AD0
_08159AF0: .4byte 0x02023D08
_08159AF4: .4byte 0x02023D12
_08159AF8: .4byte 0x02024190
	thumb_func_end SafariHandleStatusIconUpdate

	thumb_func_start SafariHandleStatusAnimation
SafariHandleStatusAnimation: @ 0x08159AFC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleStatusAnimation

	thumb_func_start SafariHandleStatusXor
SafariHandleStatusXor: @ 0x08159B08
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleStatusXor

	thumb_func_start SafariHandleDataTransfer
SafariHandleDataTransfer: @ 0x08159B14
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleDataTransfer

	thumb_func_start SafariHandleDMA3Transfer
SafariHandleDMA3Transfer: @ 0x08159B20
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleDMA3Transfer

	thumb_func_start SafariHandlePlayBGM
SafariHandlePlayBGM: @ 0x08159B2C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandlePlayBGM

	thumb_func_start SafariHandleCmd32
SafariHandleCmd32: @ 0x08159B38
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleCmd32

	thumb_func_start SafariHandleTwoReturnValues
SafariHandleTwoReturnValues: @ 0x08159B44
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleTwoReturnValues

	thumb_func_start SafariHandleChosenMonReturnValue
SafariHandleChosenMonReturnValue: @ 0x08159B50
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleChosenMonReturnValue

	thumb_func_start SafariHandleOneReturnValue
SafariHandleOneReturnValue: @ 0x08159B5C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleOneReturnValue

	thumb_func_start SafariHandleOneReturnValue_Duplicate
SafariHandleOneReturnValue_Duplicate: @ 0x08159B68
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleOneReturnValue_Duplicate

	thumb_func_start SafariHandleCmd37
SafariHandleCmd37: @ 0x08159B74
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleCmd37

	thumb_func_start SafariHandleCmd38
SafariHandleCmd38: @ 0x08159B80
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleCmd38

	thumb_func_start SafariHandleCmd39
SafariHandleCmd39: @ 0x08159B8C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleCmd39

	thumb_func_start SafariHandleCmd40
SafariHandleCmd40: @ 0x08159B98
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleCmd40

	thumb_func_start SafariHandleHitAnimation
SafariHandleHitAnimation: @ 0x08159BA4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleHitAnimation

	thumb_func_start SafariHandleCmd42
SafariHandleCmd42: @ 0x08159BB0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleCmd42

	thumb_func_start SafariHandlePlaySE
SafariHandlePlaySE: @ 0x08159BBC
	push {r4, lr}
	ldr r4, _08159BF8
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r3, #0x3f
	cmp r0, #0
	bne _08159BD0
	movs r3, #0xc0
_08159BD0:
	ldr r2, _08159BFC
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
	bl SafariBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08159BF8: .4byte 0x02023D08
_08159BFC: .4byte 0x02022D08
	thumb_func_end SafariHandlePlaySE

	thumb_func_start SafariHandlePlayFanfareOrBGM
SafariHandlePlayFanfareOrBGM: @ 0x08159C00
	push {r4, r5, lr}
	ldr r4, _08159C34
	ldr r5, _08159C38
	ldrb r0, [r5]
	lsls r3, r0, #9
	adds r0, r4, #3
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08159C3C
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
	b _08159C50
	.align 2, 0
_08159C34: .4byte 0x02022D08
_08159C38: .4byte 0x02023D08
_08159C3C:
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayFanfare
_08159C50:
	bl SafariBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandlePlayFanfareOrBGM

	thumb_func_start SafariHandleFaintingCry
SafariHandleFaintingCry: @ 0x08159C5C
	push {lr}
	ldr r1, _08159C8C
	ldr r0, _08159C90
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08159C94
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	bl PlayCry1
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08159C8C: .4byte 0x02023D12
_08159C90: .4byte 0x02023D08
_08159C94: .4byte 0x02024190
	thumb_func_end SafariHandleFaintingCry

	thumb_func_start SafariHandleIntroSlide
SafariHandleIntroSlide: @ 0x08159C98
	push {lr}
	ldr r1, _08159CC0
	ldr r0, _08159CC4
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _08159CC8
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08159CC0: .4byte 0x02022D08
_08159CC4: .4byte 0x02023D08
_08159CC8: .4byte 0x020240A0
	thumb_func_end SafariHandleIntroSlide

	thumb_func_start SafariHandleIntroTrainerBallThrow
SafariHandleIntroTrainerBallThrow: @ 0x08159CCC
	push {r4, r5, lr}
	ldr r5, _08159D10
	ldr r4, _08159D14
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08159D18
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08159D1C
	adds r1, r1, r2
	movs r2, #0xa
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_08076320
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r1, _08159D20
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08159D24
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08159D10: .4byte 0x03005AD0
_08159D14: .4byte 0x02023D08
_08159D18: .4byte 0x02023D12
_08159D1C: .4byte 0x02024190
_08159D20: .4byte 0x03005AC0
_08159D24: .4byte 0x081594E9
	thumb_func_end SafariHandleIntroTrainerBallThrow

	thumb_func_start SafariHandleDrawPartyStatusSummary
SafariHandleDrawPartyStatusSummary: @ 0x08159D28
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleDrawPartyStatusSummary

	thumb_func_start SafariHandleHidePartyStatusSummary
SafariHandleHidePartyStatusSummary: @ 0x08159D34
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleHidePartyStatusSummary

	thumb_func_start SafariHandleEndBounceEffect
SafariHandleEndBounceEffect: @ 0x08159D40
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleEndBounceEffect

	thumb_func_start SafariHandleSpriteInvisibility
SafariHandleSpriteInvisibility: @ 0x08159D4C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleSpriteInvisibility

	thumb_func_start SafariHandleBattleAnimation
SafariHandleBattleAnimation: @ 0x08159D58
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _08159D90
	ldr r6, _08159D94
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
	beq _08159D98
	bl SafariBufferExecCompleted
	b _08159DA4
	.align 2, 0
_08159D90: .4byte 0x02022D08
_08159D94: .4byte 0x02023D08
_08159D98:
	ldr r0, _08159DAC
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _08159DB0
	str r0, [r1]
_08159DA4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08159DAC: .4byte 0x03005AC0
_08159DB0: .4byte 0x08159611
	thumb_func_end SafariHandleBattleAnimation

	thumb_func_start SafariHandleLinkStandbyMsg
SafariHandleLinkStandbyMsg: @ 0x08159DB4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleLinkStandbyMsg

	thumb_func_start SafariHandleResetActionMoveSelection
SafariHandleResetActionMoveSelection: @ 0x08159DC0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SafariHandleResetActionMoveSelection

	thumb_func_start SafariHandleCmd55
SafariHandleCmd55: @ 0x08159DCC
	push {r4, lr}
	ldr r2, _08159E10
	ldr r1, _08159E14
	ldr r4, _08159E18
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
	bl SafariBufferExecCompleted
	ldr r0, _08159E1C
	ldr r0, [r0]
	movs r1, #6
	ands r0, r1
	cmp r0, #2
	bne _08159E08
	ldr r0, _08159E20
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _08159E24
	str r0, [r1]
_08159E08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08159E10: .4byte 0x02023FDE
_08159E14: .4byte 0x02022D08
_08159E18: .4byte 0x02023D08
_08159E1C: .4byte 0x02022C90
_08159E20: .4byte 0x03005AC0
_08159E24: .4byte 0x08159521
	thumb_func_end SafariHandleCmd55

	thumb_func_start SafariCmdEnd
SafariCmdEnd: @ 0x08159E28
	bx lr
	.align 2, 0
	thumb_func_end SafariCmdEnd

