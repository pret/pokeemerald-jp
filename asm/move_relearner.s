.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start VBlankCB_MoveRelearner
VBlankCB_MoveRelearner: @ 0x0816055C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_MoveRelearner

	thumb_func_start TeachMoveRelearnerMove
TeachMoveRelearnerMove: @ 0x08160570
	push {lr}
	sub sp, #4
	bl ScriptContext2_Enable
	ldr r0, _08160598
	movs r1, #0xa
	bl CreateTask
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08160598: .4byte 0x0816059D
	thumb_func_end TeachMoveRelearnerMove

	thumb_func_start Task_WaitForFadeOut
Task_WaitForFadeOut: @ 0x0816059C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081605C8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081605C0
	ldr r0, _081605CC
	bl SetMainCallback2
	ldr r1, _081605D0
	ldr r0, _081605D4
	str r0, [r1]
	adds r0, r4, #0
	bl DestroyTask
_081605C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081605C8: .4byte 0x02037C74
_081605CC: .4byte 0x081605D9
_081605D0: .4byte 0x03005B0C
_081605D4: .4byte 0x080AEA65
	thumb_func_end Task_WaitForFadeOut

	thumb_func_start CB2_InitLearnMove
CB2_InitLearnMove: @ 0x081605D8
	push {r4, r5, r6, lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl clear_scheduled_bg_copies_to_vram
	ldr r6, _08160658
	movs r0, #0x8c
	lsls r0, r0, #1
	bl AllocZeroed
	str r0, [r6]
	ldr r1, _0816065C
	ldrh r1, [r1]
	adds r0, #0x44
	movs r5, #0
	strb r1, [r0]
	ldr r0, _08160660
	bl SetVBlankCallback
	bl InitMoveRelearnerBackgroundLayers
	movs r0, #0
	bl InitMoveRelearnerWindows
	ldr r4, _08160664
	movs r0, #0
	strh r5, [r4]
	strh r5, [r4, #2]
	strb r0, [r4, #4]
	bl CreateLearnableMovesList
	ldr r0, _08160668
	bl LoadSpriteSheet
	ldr r0, _0816066C
	bl LoadSpritePalette
	bl CreateUISprites
	ldr r0, _08160670
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	bl ListMenuInit
	ldr r1, [r6]
	movs r2, #0x89
	lsls r2, r2, #1
	adds r1, r1, r2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #2
	bl FillPalette
	ldr r0, _08160674
	bl SetMainCallback2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08160658: .4byte 0x0203B900
_0816065C: .4byte 0x02037280
_08160660: .4byte 0x0816055D
_08160664: .4byte 0x0203B904
_08160668: .4byte 0x085ADAF4
_0816066C: .4byte 0x085ADAFC
_08160670: .4byte 0x03006050
_08160674: .4byte 0x08160765
	thumb_func_end CB2_InitLearnMove

	thumb_func_start CB2_InitLearnMoveReturnFromSelectMove
CB2_InitLearnMoveReturnFromSelectMove: @ 0x08160678
	push {r4, r5, lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl clear_scheduled_bg_copies_to_vram
	ldr r5, _08160700
	movs r0, #0x8c
	lsls r0, r0, #1
	bl AllocZeroed
	str r0, [r5]
	movs r1, #0x1c
	strb r1, [r0]
	ldr r0, [r5]
	ldr r1, _08160704
	ldrh r1, [r1]
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, [r5]
	ldr r1, _08160708
	ldrh r1, [r1]
	adds r0, #0x45
	strb r1, [r0]
	ldr r0, _0816070C
	bl SetVBlankCallback
	bl InitMoveRelearnerBackgroundLayers
	ldr r4, _08160710
	ldrb r0, [r4, #4]
	bl InitMoveRelearnerWindows
	bl CreateLearnableMovesList
	ldr r0, _08160714
	bl LoadSpriteSheet
	ldr r0, _08160718
	bl LoadSpritePalette
	bl CreateUISprites
	ldr r0, _0816071C
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	bl ListMenuInit
	ldr r1, [r5]
	movs r2, #0x89
	lsls r2, r2, #1
	adds r1, r1, r2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #2
	bl FillPalette
	ldr r0, _08160720
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08160700: .4byte 0x0203B900
_08160704: .4byte 0x02037280
_08160708: .4byte 0x02037282
_0816070C: .4byte 0x0816055D
_08160710: .4byte 0x0203B904
_08160714: .4byte 0x085ADAF4
_08160718: .4byte 0x085ADAFC
_0816071C: .4byte 0x03006050
_08160720: .4byte 0x08160765
	thumb_func_end CB2_InitLearnMoveReturnFromSelectMove

	thumb_func_start InitMoveRelearnerBackgroundLayers
InitMoveRelearnerBackgroundLayers: @ 0x08160724
	push {lr}
	bl ResetVramOamAndBgCntRegs
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08160760
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	bl ResetAllBgsCoordinates
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_08160760: .4byte 0x085ADB6C
	thumb_func_end InitMoveRelearnerBackgroundLayers

	thumb_func_start CB2_MoveRelearnerMain
CB2_MoveRelearnerMain: @ 0x08160764
	push {lr}
	bl DoMoveRelearnerMain
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_MoveRelearnerMain

	thumb_func_start FormatAndPrintText
FormatAndPrintText: @ 0x08160784
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _0816079C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	bl MoveRelearnerPrintText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816079C: .4byte 0x02021C7C
	thumb_func_end FormatAndPrintText

	thumb_func_start DoMoveRelearnerMain
DoMoveRelearnerMain: @ 0x081607A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _081607BC
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r7, r1, #0
	cmp r0, #0x21
	bls _081607B2
	b _08160DB6
_081607B2:
	lsls r0, r0, #2
	ldr r1, _081607C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081607BC: .4byte 0x0203B900
_081607C0: .4byte 0x081607C4
_081607C4: @ jump table
	.4byte _0816084C @ case 0
	.4byte _08160866 @ case 1
	.4byte _08160880 @ case 2
	.4byte _08160888 @ case 3
	.4byte _08160890 @ case 4
	.4byte _08160898 @ case 5
	.4byte _081608B4 @ case 6
	.4byte _08160DB6 @ case 7
	.4byte _081608BC @ case 8
	.4byte _081608DC @ case 9
	.4byte _08160DB6 @ case 10
	.4byte _08160DB6 @ case 11
	.4byte _08160978 @ case 12
	.4byte _08160998 @ case 13
	.4byte _08160BEC @ case 14
	.4byte _08160C0C @ case 15
	.4byte _081609EC @ case 16
	.4byte _08160A04 @ case 17
	.4byte _08160A20 @ case 18
	.4byte _08160B50 @ case 19
	.4byte _08160B7C @ case 20
	.4byte _08160BCC @ case 21
	.4byte _08160BDA @ case 22
	.4byte _08160DB6 @ case 23
	.4byte _08160A60 @ case 24
	.4byte _08160A94 @ case 25
	.4byte _08160AB4 @ case 26
	.4byte _08160B10 @ case 27
	.4byte _08160C30 @ case 28
	.4byte _08160C7C @ case 29
	.4byte _08160D38 @ case 30
	.4byte _08160D64 @ case 31
	.4byte _08160D84 @ case 32
	.4byte _08160D9C @ case 33
_0816084C:
	ldr r1, [r7]
	ldrb r0, [r1]
	adds r0, #1
	movs r4, #0
	strb r0, [r1]
	movs r0, #0
	bl HideHeartSpritesAndShowTeachMoveText
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	b _08160BE2
_08160866:
	ldr r0, _0816087C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08160874
	b _08160DB6
_08160874:
	ldr r1, [r7]
	movs r0, #4
	b _08160DB4
	.align 2, 0
_0816087C: .4byte 0x02037C74
_08160880:
	ldr r1, [r7]
	ldrb r0, [r1]
	adds r0, #1
	b _08160DB4
_08160888:
	movs r0, #0
	bl HideHeartSpritesAndShowTeachMoveText
	b _0816089E
_08160890:
	movs r0, #0
	bl sub_08160E70
	b _08160DB6
_08160898:
	movs r0, #0
	bl ShowTeachMoveText
_0816089E:
	ldr r0, _081608B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl AddScrollArrows
	b _08160DB6
	.align 2, 0
_081608B0: .4byte 0x0203B900
_081608B4:
	movs r0, #1
	bl sub_08160E70
	b _08160DB6
_081608BC:
	bl MoveRelearnerRunTextPrinters
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081608C8
	b _08160DB6
_081608C8:
	bl MoveRelearnerCreateYesNoMenu
	ldr r0, _081608D8
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	b _08160DB4
	.align 2, 0
_081608D8: .4byte 0x0203B900
_081608DC:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _0816093E
	ldr r5, _08160924
	ldr r0, [r5]
	adds r0, #0x44
	ldrb r1, [r0]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _08160928
	adds r4, r4, r0
	bl GetCurrentSelectedMove
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl GiveMoveToMon
	lsls r0, r0, #0x10
	ldr r1, _0816092C
	cmp r0, r1
	beq _08160938
	ldr r0, _08160930
	bl FormatAndPrintText
	ldr r1, _08160934
	movs r0, #1
	strh r0, [r1]
	ldr r1, [r5]
	movs r0, #0x1f
	b _08160DB4
	.align 2, 0
_08160924: .4byte 0x0203B900
_08160928: .4byte 0x02024190
_0816092C: .4byte 0xFFFF0000
_08160930: .4byte 0x085AD9C0
_08160934: .4byte 0x02037280
_08160938:
	ldr r1, [r5]
	movs r0, #0x10
	b _08160DB4
_0816093E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0816094C
	cmp r1, #1
	beq _0816094C
	b _08160DB6
_0816094C:
	ldr r0, _0816095C
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08160964
	ldr r0, _08160960
	ldr r1, [r0]
	movs r0, #3
	b _08160DB4
	.align 2, 0
_0816095C: .4byte 0x0203B904
_08160960: .4byte 0x0203B900
_08160964:
	cmp r0, #1
	beq _0816096A
	b _08160DB6
_0816096A:
	ldr r0, _08160974
	ldr r1, [r0]
	movs r0, #5
	b _08160DB4
	.align 2, 0
_08160974: .4byte 0x0203B900
_08160978:
	bl MoveRelearnerRunTextPrinters
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08160984
	b _08160DB6
_08160984:
	bl MoveRelearnerCreateYesNoMenu
	ldr r0, _08160994
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	b _08160DB4
	.align 2, 0
_08160994: .4byte 0x0203B900
_08160998:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _081609B0
	ldr r0, _081609AC
	strh r1, [r0]
	b _08160DAE
	.align 2, 0
_081609AC: .4byte 0x02037280
_081609B0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081609BE
	cmp r1, #1
	beq _081609BE
	b _08160DB6
_081609BE:
	ldr r0, _081609D0
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _081609D8
	ldr r0, _081609D4
	ldr r1, [r0]
	movs r0, #3
	b _08160DB4
	.align 2, 0
_081609D0: .4byte 0x0203B904
_081609D4: .4byte 0x0203B900
_081609D8:
	cmp r0, #1
	beq _081609DE
	b _08160DB6
_081609DE:
	ldr r0, _081609E8
	ldr r1, [r0]
	movs r0, #5
	b _08160DB4
	.align 2, 0
_081609E8: .4byte 0x0203B900
_081609EC:
	ldr r0, _081609FC
	bl FormatAndPrintText
	ldr r0, _08160A00
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	b _08160DB4
	.align 2, 0
_081609FC: .4byte 0x085AD9D4
_08160A00: .4byte 0x0203B900
_08160A04:
	bl MoveRelearnerRunTextPrinters
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08160A10
	b _08160DB6
_08160A10:
	bl MoveRelearnerCreateYesNoMenu
	ldr r0, _08160A1C
	ldr r1, [r0]
	movs r0, #0x12
	b _08160DB4
	.align 2, 0
_08160A1C: .4byte 0x0203B900
_08160A20:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _08160A44
	ldr r0, _08160A3C
	bl FormatAndPrintText
	ldr r0, _08160A40
	ldr r1, [r0]
	movs r0, #0x13
	b _08160DB4
	.align 2, 0
_08160A3C: .4byte 0x085ADAC9
_08160A40: .4byte 0x0203B900
_08160A44:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08160A52
	cmp r1, #1
	beq _08160A52
	b _08160DB6
_08160A52:
	ldr r0, _08160A5C
	ldr r1, [r0]
	movs r0, #0x18
	b _08160DB4
	.align 2, 0
_08160A5C: .4byte 0x0203B900
_08160A60:
	ldr r4, _08160A84
	bl GetCurrentSelectedMove
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08160A88
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	ldr r0, _08160A8C
	bl FormatAndPrintText
	ldr r0, _08160A90
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	b _08160DB4
	.align 2, 0
_08160A84: .4byte 0x02021C54
_08160A88: .4byte 0x082EACC4
_08160A8C: .4byte 0x085ADA27
_08160A90: .4byte 0x0203B900
_08160A94:
	bl MoveRelearnerRunTextPrinters
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08160AA0
	b _08160DB6
_08160AA0:
	bl MoveRelearnerCreateYesNoMenu
	ldr r0, _08160AB0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	b _08160DB4
	.align 2, 0
_08160AB0: .4byte 0x0203B900
_08160AB4:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _08160ACC
	ldr r0, _08160AC8
	ldr r1, [r0]
	movs r0, #0x1b
	b _08160DB4
	.align 2, 0
_08160AC8: .4byte 0x0203B900
_08160ACC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08160ADA
	cmp r1, #1
	beq _08160ADA
	b _08160DB6
_08160ADA:
	ldr r0, _08160AF0
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08160AF8
	ldr r2, _08160AF4
	ldr r1, [r2]
	movs r0, #3
	strb r0, [r1]
	adds r7, r2, #0
	b _08160B04
	.align 2, 0
_08160AF0: .4byte 0x0203B904
_08160AF4: .4byte 0x0203B900
_08160AF8:
	ldr r7, _08160B0C
	cmp r0, #1
	bne _08160B04
	ldr r1, [r7]
	movs r0, #5
	strb r0, [r1]
_08160B04:
	ldr r1, [r7]
	movs r0, #0x10
	b _08160DB4
	.align 2, 0
_08160B0C: .4byte 0x0203B900
_08160B10:
	bl MoveRelearnerRunTextPrinters
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08160B1C
	b _08160DB6
_08160B1C:
	movs r0, #3
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _08160B34
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08160B3C
	ldr r0, _08160B38
	ldr r1, [r0]
	movs r0, #3
	b _08160DB4
	.align 2, 0
_08160B34: .4byte 0x0203B904
_08160B38: .4byte 0x0203B900
_08160B3C:
	cmp r0, #1
	beq _08160B42
	b _08160DB6
_08160B42:
	ldr r0, _08160B4C
	ldr r1, [r0]
	movs r0, #5
	b _08160DB4
	.align 2, 0
_08160B4C: .4byte 0x0203B900
_08160B50:
	bl MoveRelearnerRunTextPrinters
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08160B5E
	b _08160DB6
_08160B5E:
	ldr r0, _08160B78
	ldr r1, [r0]
	movs r0, #0x14
	strb r0, [r1]
	subs r0, #0x15
	str r2, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _08160DB6
	.align 2, 0
_08160B78: .4byte 0x0203B900
_08160B7C:
	ldr r0, _08160BB8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08160B8A
	b _08160DB6
_08160B8A:
	bl GetCurrentSelectedMove
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08160BBC
	ldr r1, _08160BC0
	ldr r1, [r1]
	adds r1, #0x44
	ldrb r1, [r1]
	ldr r2, _08160BC4
	ldrb r2, [r2]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _08160BC8
	str r0, [sp]
	adds r0, r4, #0
	bl ShowSelectMovePokemonSummaryScreen
	bl FreeMoveRelearnerResources
	b _08160DB6
	.align 2, 0
_08160BB8: .4byte 0x02037C74
_08160BBC: .4byte 0x02024190
_08160BC0: .4byte 0x0203B900
_08160BC4: .4byte 0x0202418D
_08160BC8: .4byte 0x08160679
_08160BCC:
	bl MoveRelearnerRunTextPrinters
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08160BD8
	b _08160DB6
_08160BD8:
	b _08160DAE
_08160BDA:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
_08160BE2:
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _08160DB6
_08160BEC:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _08160C08
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	b _08160DB4
	.align 2, 0
_08160C08: .4byte 0x0203B900
_08160C0C:
	ldr r0, _08160C28
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08160C1A
	b _08160DB6
_08160C1A:
	bl FreeMoveRelearnerResources
	ldr r0, _08160C2C
	bl SetMainCallback2
	b _08160DB6
	.align 2, 0
_08160C28: .4byte 0x02037C74
_08160C2C: .4byte 0x08085A31
_08160C30:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _08160C5C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08160C60
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08160C64
	movs r0, #1
	bl HideHeartSpritesAndShowTeachMoveText
	b _08160C6E
	.align 2, 0
_08160C5C: .4byte 0x0203B900
_08160C60: .4byte 0x0203B904
_08160C64:
	cmp r0, #1
	bne _08160C6E
	movs r0, #1
	bl ShowTeachMoveText
_08160C6E:
	bl RemoveScrollArrows
	movs r0, #3
	movs r1, #2
	bl CopyWindowToVram
	b _08160DB6
_08160C7C:
	ldr r0, _08160C9C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08160C8A
	b _08160DB6
_08160C8A:
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #0x45
	ldrb r0, [r2]
	cmp r0, #4
	bne _08160CA0
	movs r0, #0x18
	b _08160DB4
	.align 2, 0
_08160C9C: .4byte 0x02037C74
_08160CA0:
	adds r0, r1, #0
	adds r0, #0x44
	ldrb r0, [r0]
	movs r4, #0x64
	muls r0, r4, r0
	ldr r5, _08160D20
	adds r0, r0, r5
	ldrb r1, [r2]
	adds r1, #0xd
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	ldr r0, _08160D24
	lsrs r1, r1, #0xd
	ldr r6, _08160D28
	adds r1, r1, r6
	bl StringCopy
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x44
	ldrb r0, [r0]
	muls r0, r4, r0
	adds r0, r0, r5
	adds r1, #0x45
	ldrb r1, [r1]
	bl RemoveMonPPBonus
	ldr r0, [r7]
	adds r0, #0x44
	ldrb r0, [r0]
	muls r4, r0, r4
	adds r4, r4, r5
	bl GetCurrentSelectedMove
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [r7]
	adds r0, #0x45
	ldrb r2, [r0]
	adds r0, r4, #0
	bl SetMonMoveSlot
	ldr r4, _08160D2C
	bl GetCurrentSelectedMove
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, r1, r6
	adds r0, r4, #0
	bl StringCopy
	ldr r0, _08160D30
	bl FormatAndPrintText
	ldr r1, [r7]
	movs r0, #0x1e
	strb r0, [r1]
	ldr r1, _08160D34
	movs r0, #1
	strh r0, [r1]
	b _08160DB6
	.align 2, 0
_08160D20: .4byte 0x02024190
_08160D24: .4byte 0x02021C68
_08160D28: .4byte 0x082EACC4
_08160D2C: .4byte 0x02021C54
_08160D30: .4byte 0x085ADA42
_08160D34: .4byte 0x02037280
_08160D38:
	bl MoveRelearnerRunTextPrinters
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08160DB6
	ldr r0, _08160D58
	bl FormatAndPrintText
	ldr r0, _08160D5C
	ldr r1, [r0]
	movs r0, #0x1f
	strb r0, [r1]
	ldr r0, _08160D60
	bl PlayFanfare
	b _08160DB6
	.align 2, 0
_08160D58: .4byte 0x085ADA67
_08160D5C: .4byte 0x0203B900
_08160D60: .4byte 0x0000016F
_08160D64:
	bl MoveRelearnerRunTextPrinters
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08160DB6
	ldr r0, _08160D7C
	bl PlayFanfare
	ldr r0, _08160D80
	ldr r1, [r0]
	movs r0, #0x20
	b _08160DB4
	.align 2, 0
_08160D7C: .4byte 0x0000016F
_08160D80: .4byte 0x0203B900
_08160D84:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08160DB6
	ldr r0, _08160D98
	ldr r1, [r0]
	movs r0, #0x21
	b _08160DB4
	.align 2, 0
_08160D98: .4byte 0x0203B900
_08160D9C:
	ldr r0, _08160DC0
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08160DB6
	movs r0, #5
	bl PlaySE
_08160DAE:
	ldr r0, _08160DC4
	ldr r1, [r0]
	movs r0, #0xe
_08160DB4:
	strb r0, [r1]
_08160DB6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08160DC0: .4byte 0x03002360
_08160DC4: .4byte 0x0203B900
	thumb_func_end DoMoveRelearnerMain

	thumb_func_start FreeMoveRelearnerResources
FreeMoveRelearnerResources: @ 0x08160DC8
	push {r4, lr}
	bl RemoveScrollArrows
	ldr r4, _08160E00
	ldr r0, [r4]
	movs r1, #0x89
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _08160E04
	adds r2, r1, #2
	bl DestroyListMenuTask
	bl FreeAllWindowBuffers
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08160E00: .4byte 0x0203B900
_08160E04: .4byte 0x0203B904
	thumb_func_end FreeMoveRelearnerResources

	thumb_func_start HideHeartSpritesAndShowTeachMoveText
HideHeartSpritesAndShowTeachMoveText: @ 0x08160E08
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r2, #0
	ldr r6, _08160E60
	ldr r4, _08160E64
	movs r3, #4
_08160E18:
	ldr r0, [r4]
	adds r0, #1
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0xf
	ble _08160E18
	cmp r5, #0
	bne _08160E58
	ldr r4, _08160E68
	ldr r1, _08160E6C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
_08160E58:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08160E60: .4byte 0x020205AC
_08160E64: .4byte 0x0203B900
_08160E68: .4byte 0x02021C7C
_08160E6C: .4byte 0x085AD9A0
	thumb_func_end HideHeartSpritesAndShowTeachMoveText

	thumb_func_start sub_08160E70
sub_08160E70: @ 0x08160E70
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r6, _08160ED8
	ldr r0, [r6]
	movs r4, #0x89
	lsls r4, r4, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ListMenu_ProcessInput
	adds r5, r0, #0
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r4, _08160EDC
	adds r2, r4, #2
	adds r1, r4, #0
	bl ListMenuGetScrollAndRow
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	beq _08160F04
	adds r0, #1
	cmp r5, r0
	bne _08160F30
	ldr r0, _08160EE0
	ldrh r1, [r0, #0x2e]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08160EBC
	bl GetLRKeysState
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08160F5C
_08160EBC:
	movs r0, #5
	bl PlaySE
	cmp r7, #0
	bne _08160EE4
	movs r0, #1
	bl PutWindowTilemap
	ldr r0, [r6]
	movs r1, #5
	strb r1, [r0]
	movs r0, #1
	strb r0, [r4, #4]
	b _08160EF4
	.align 2, 0
_08160ED8: .4byte 0x0203B900
_08160EDC: .4byte 0x0203B904
_08160EE0: .4byte 0x03002360
_08160EE4:
	movs r0, #0
	bl PutWindowTilemap
	ldr r0, [r6]
	movs r2, #0
	movs r1, #3
	strb r1, [r0]
	strb r2, [r4, #4]
_08160EF4:
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	bl GetCurrentSelectedMove
	bl MoveRelearnerShowHideHearts
	b _08160F5C
_08160F04:
	movs r0, #5
	bl PlaySE
	bl RemoveScrollArrows
	ldr r1, [r6]
	movs r0, #0xc
	strb r0, [r1]
	ldr r4, _08160F28
	ldr r1, _08160F2C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	bl MoveRelearnerPrintText
	b _08160F5C
	.align 2, 0
_08160F28: .4byte 0x02021C7C
_08160F2C: .4byte 0x085ADAAF
_08160F30:
	movs r0, #5
	bl PlaySE
	bl RemoveScrollArrows
	ldr r1, [r6]
	movs r0, #8
	strb r0, [r1]
	ldr r0, _08160F64
	lsls r1, r5, #3
	ldr r2, _08160F68
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _08160F6C
	ldr r1, _08160F70
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	bl MoveRelearnerPrintText
_08160F5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08160F64: .4byte 0x02021C54
_08160F68: .4byte 0x082EACC4
_08160F6C: .4byte 0x02021C7C
_08160F70: .4byte 0x085AD9B2
	thumb_func_end sub_08160E70

	thumb_func_start GetCurrentSelectedMove
GetCurrentSelectedMove: @ 0x08160F74
	ldr r0, _08160F8C
	ldr r2, [r0]
	ldr r1, _08160F90
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x4c
	adds r2, r2, r0
	ldr r0, [r2]
	bx lr
	.align 2, 0
_08160F8C: .4byte 0x0203B900
_08160F90: .4byte 0x0203B904
	thumb_func_end GetCurrentSelectedMove

	thumb_func_start ShowTeachMoveText
ShowTeachMoveText: @ 0x08160F94
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08160FBE
	ldr r4, _08160FC8
	ldr r1, _08160FCC
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
_08160FBE:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08160FC8: .4byte 0x02021C7C
_08160FCC: .4byte 0x085AD9A0
	thumb_func_end ShowTeachMoveText

	thumb_func_start CreateUISprites
CreateUISprites: @ 0x08160FD0
	push {r4, r5, r6, r7, lr}
	ldr r2, _081610B4
	ldr r0, [r2]
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, _081610B8
	adds r1, r0, r2
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	bl AddScrollArrows
	movs r4, #0
	ldr r5, _081610BC
_08160FF4:
	adds r2, r4, #0
	cmp r4, #0
	bge _08160FFC
	adds r2, r4, #3
_08160FFC:
	asrs r2, r2, #2
	lsls r1, r2, #2
	subs r1, r4, r1
	lsls r1, r1, #0x13
	movs r0, #0xb0
	lsls r0, r0, #0xe
	adds r1, r1, r0
	asrs r1, r1, #0x10
	lsls r2, r2, #0x13
	movs r0, #0xd0
	lsls r0, r0, #0xe
	adds r2, r2, r0
	asrs r2, r2, #0x10
	adds r0, r5, #0
	movs r3, #0
	bl CreateSprite
	ldr r2, _081610B4
	ldr r1, [r2]
	adds r1, #1
	adds r1, r1, r4
	strb r0, [r1]
	adds r4, #1
	cmp r4, #7
	ble _08160FF4
	movs r4, #0
	ldr r7, _081610BC
	adds r6, r2, #0
_08161034:
	adds r2, r4, #0
	cmp r4, #0
	bge _0816103C
	adds r2, r4, #3
_0816103C:
	asrs r2, r2, #2
	lsls r1, r2, #2
	subs r1, r4, r1
	lsls r1, r1, #0x13
	movs r0, #0xf8
	lsls r0, r0, #0xf
	adds r1, r1, r0
	asrs r1, r1, #0x10
	lsls r2, r2, #0x13
	movs r0, #0xd0
	lsls r0, r0, #0xe
	adds r2, r2, r0
	asrs r2, r2, #0x10
	adds r0, r7, #0
	movs r3, #0
	bl CreateSprite
	ldr r1, [r6]
	adds r2, r4, #0
	adds r2, #8
	adds r1, #1
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #1
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _081610C0
	adds r0, r0, r5
	movs r1, #2
	bl StartSpriteAnim
	adds r4, #1
	cmp r4, #7
	ble _08161034
	movs r4, #0
	ldr r3, _081610B4
	movs r2, #4
_0816108E:
	ldr r0, [r3]
	adds r0, #1
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r4, #1
	cmp r4, #0xf
	ble _0816108E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081610B4: .4byte 0x0203B900
_081610B8: .4byte 0x00000113
_081610BC: .4byte 0x085ADB54
_081610C0: .4byte 0x020205AC
	thumb_func_end CreateUISprites

	thumb_func_start AddScrollArrows
AddScrollArrows: @ 0x081610C4
	push {r4, r5, r6, lr}
	ldr r4, _08161130
	ldr r1, [r4]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081610EC
	ldr r0, _08161134
	movs r3, #0x8b
	lsls r3, r3, #1
	adds r1, r1, r3
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	movs r5, #0x8a
	lsls r5, r5, #1
	adds r1, r1, r5
	strb r0, [r1]
_081610EC:
	ldr r0, [r4]
	ldr r6, _08161138
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08161128
	ldr r0, _0816113C
	adds r2, r0, #0
	ldr r1, _08161140
	ldm r1!, {r3, r5, r6}
	stm r2!, {r3, r5, r6}
	ldr r1, [r1]
	str r1, [r2]
	ldr r2, [r4]
	movs r3, #0x88
	lsls r3, r3, #1
	adds r1, r2, r3
	ldrb r1, [r1]
	ldr r5, _08161144
	adds r2, r2, r5
	ldrb r2, [r2]
	subs r1, r1, r2
	strh r1, [r0, #8]
	ldr r1, _08161148
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	ldr r6, _08161138
	adds r1, r1, r6
	strb r0, [r1]
_08161128:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08161130: .4byte 0x0203B900
_08161134: .4byte 0x085ADB04
_08161138: .4byte 0x00000113
_0816113C: .4byte 0x0203CB58
_08161140: .4byte 0x085ADB14
_08161144: .4byte 0x00000111
_08161148: .4byte 0x0203B904
	thumb_func_end AddScrollArrows

	thumb_func_start RemoveScrollArrows
RemoveScrollArrows: @ 0x0816114C
	push {r4, lr}
	ldr r4, _08161190
	ldr r0, [r4]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0816116E
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
_0816116E:
	ldr r0, [r4]
	ldr r2, _08161194
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08161188
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r2, _08161194
	adds r1, r0, r2
	movs r0, #0xff
	strb r0, [r1]
_08161188:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08161190: .4byte 0x0203B900
_08161194: .4byte 0x00000113
	thumb_func_end RemoveScrollArrows

	thumb_func_start CreateLearnableMovesList
CreateLearnableMovesList: @ 0x08161198
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r4, _08161268
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0816126C
	adds r0, r0, r2
	adds r1, #0x12
	bl GetMoveRelearnerMoves
	ldr r1, [r4]
	movs r6, #0x88
	lsls r6, r6, #1
	adds r1, r1, r6
	strb r0, [r1]
	movs r5, #0
	ldr r0, [r4]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r5, r0
	bge _081611FE
	mov ip, r4
	ldr r7, _08161270
_081611CE:
	mov r0, ip
	ldr r4, [r0]
	lsls r3, r5, #3
	adds r2, r4, #0
	adds r2, #0x48
	adds r2, r2, r3
	lsls r0, r5, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r7
	str r0, [r2]
	adds r0, r4, #0
	adds r0, #0x4c
	adds r0, r0, r3
	ldrh r1, [r1]
	str r1, [r0]
	adds r5, #1
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r5, r0
	blt _081611CE
_081611FE:
	ldr r4, _08161268
	ldr r0, [r4]
	adds r0, #0x44
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0816126C
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	ldr r0, _08161274
	mov r1, sp
	bl StringCopy10
	ldr r2, [r4]
	movs r5, #0x88
	lsls r5, r5, #1
	adds r3, r2, r5
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r1, r2, #0
	adds r1, #0x48
	adds r1, r1, r0
	ldr r0, _08161278
	str r0, [r1]
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r2, #0x4c
	adds r2, r2, r0
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x48
	adds r1, r1, r5
	ldrb r1, [r1]
	bl LoadMoveRelearnerMovesList
	ldr r1, [r4]
	ldr r2, _0816127C
	adds r1, r1, r2
	strb r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08161268: .4byte 0x0203B900
_0816126C: .4byte 0x02024190
_08161270: .4byte 0x082EACC4
_08161274: .4byte 0x02021C40
_08161278: .4byte 0x085C93C4
_0816127C: .4byte 0x00000111
	thumb_func_end CreateLearnableMovesList

	thumb_func_start MoveRelearnerShowHideHearts
MoveRelearnerShowHideHearts: @ 0x08161280
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _081612C4
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08161298
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	bne _081612D0
_08161298:
	movs r5, #0
	ldr r4, _081612C8
	ldr r3, _081612CC
	movs r2, #4
_081612A0:
	ldr r0, [r3]
	adds r0, #1
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _081612A0
	b _08161402
	.align 2, 0
_081612C4: .4byte 0x0203B904
_081612C8: .4byte 0x020205AC
_081612CC: .4byte 0x0203B900
_081612D0:
	ldr r1, _08161314
	ldr r0, _08161318
	lsls r4, r4, #3
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r8, r4
	cmp r6, #0xff
	bne _081612F2
	movs r6, #0
_081612F2:
	movs r5, #0
	ldr r7, _0816131C
	ldr r4, _08161320
_081612F8:
	cmp r5, r6
	bhs _08161324
	ldr r0, [r7]
	adds r0, #1
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAnim
	b _0816133A
	.align 2, 0
_08161314: .4byte 0x08566AE4
_08161318: .4byte 0x08565FCC
_0816131C: .4byte 0x0203B900
_08161320: .4byte 0x020205AC
_08161324:
	ldr r0, [r7]
	adds r0, #1
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	bl StartSpriteAnim
_0816133A:
	ldr r0, [r7]
	adds r0, #1
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r3, #5
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #7
	bls _081612F8
	ldr r1, _081613AC
	ldr r0, _081613B0
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xff
	bne _08161380
	movs r6, #0
_08161380:
	movs r5, #0
	ldr r0, _081613B4
	mov r8, r0
	ldr r7, _081613B8
_08161388:
	cmp r5, r6
	bhs _081613BC
	mov r1, r8
	ldr r0, [r1]
	adds r4, r5, #0
	adds r4, #8
	adds r0, #1
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	movs r1, #3
	bl StartSpriteAnim
	b _081613D8
	.align 2, 0
_081613AC: .4byte 0x08566AE4
_081613B0: .4byte 0x08565FCC
_081613B4: .4byte 0x0203B900
_081613B8: .4byte 0x020205AC
_081613BC:
	mov r3, r8
	ldr r0, [r3]
	adds r4, r5, #0
	adds r4, #8
	adds r0, #1
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	movs r1, #2
	bl StartSpriteAnim
_081613D8:
	mov r1, r8
	ldr r0, [r1]
	adds r0, #1
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r3, #5
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #7
	bls _08161388
_08161402:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end MoveRelearnerShowHideHearts

