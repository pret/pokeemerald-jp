.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ShowPokemonSummaryScreen
ShowPokemonSummaryScreen: @ 0x081BF280
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r4, _081BF2D0
	ldr r0, _081BF2D4
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _081BF2D8
	adds r0, r0, r1
	strb r7, [r0]
	ldr r0, [r4]
	mov r2, r8
	str r2, [r0]
	adds r1, #2
	adds r0, r0, r1
	strb r5, [r0]
	ldr r0, [r4]
	ldr r2, _081BF2DC
	adds r0, r0, r2
	strb r6, [r0]
	ldr r1, [r4]
	ldr r0, [sp, #0x18]
	str r0, [r1, #4]
	cmp r7, #2
	bne _081BF2E0
	subs r2, #2
	adds r1, r1, r2
	movs r0, #1
	b _081BF2E6
	.align 2, 0
_081BF2D0: .4byte 0x0203CBE8
_081BF2D4: .4byte 0x000040F8
_081BF2D8: .4byte 0x000040BC
_081BF2DC: .4byte 0x000040BF
_081BF2E0:
	ldr r0, _081BF2F8
	adds r1, r1, r0
	movs r0, #0
_081BF2E6:
	strb r0, [r1]
	cmp r7, #1
	beq _081BF334
	cmp r7, #1
	bgt _081BF300
	cmp r7, #0
	beq _081BF310
	ldr r2, _081BF2FC
	b _081BF382
	.align 2, 0
_081BF2F8: .4byte 0x000040BD
_081BF2FC: .4byte 0x0203CBE8
_081BF300:
	cmp r7, #2
	beq _081BF310
	cmp r7, #3
	beq _081BF364
	ldr r2, _081BF30C
	b _081BF382
	.align 2, 0
_081BF30C: .4byte 0x0203CBE8
_081BF310:
	ldr r2, _081BF328
	ldr r0, [r2]
	ldr r1, _081BF32C
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _081BF330
	adds r0, r0, r1
	movs r1, #3
	b _081BF380
	.align 2, 0
_081BF328: .4byte 0x0203CBE8
_081BF32C: .4byte 0x000040C1
_081BF330: .4byte 0x000040C2
_081BF334:
	ldr r2, _081BF354
	ldr r0, [r2]
	ldr r1, _081BF358
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _081BF35C
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _081BF360
	adds r0, r0, r1
	strb r7, [r0]
	b _081BF382
	.align 2, 0
_081BF354: .4byte 0x0203CBE8
_081BF358: .4byte 0x000040C1
_081BF35C: .4byte 0x000040C2
_081BF360: .4byte 0x000040C8
_081BF364:
	ldr r2, _081BF3B8
	ldr r0, [r2]
	ldr r1, _081BF3BC
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _081BF3C0
	adds r0, r0, r1
	strb r7, [r0]
	ldr r0, [r2]
	adds r1, #1
	adds r0, r0, r1
	movs r1, #1
_081BF380:
	strb r1, [r0]
_081BF382:
	ldr r0, [r2]
	ldr r2, _081BF3BC
	adds r1, r0, r2
	ldrb r1, [r1]
	subs r2, #1
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0xff
	bl SummaryScreen_SetUnknownTaskId
	ldr r0, _081BF3C4
	ldr r0, [r0]
	cmp r0, #0
	bne _081BF3A6
	movs r0, #0
	movs r1, #0
	bl sub_0806ED30
_081BF3A6:
	ldr r0, _081BF3C8
	bl SetMainCallback2
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BF3B8: .4byte 0x0203CBE8
_081BF3BC: .4byte 0x000040C1
_081BF3C0: .4byte 0x000040C2
_081BF3C4: .4byte 0x02024178
_081BF3C8: .4byte 0x081BF445
	thumb_func_end ShowPokemonSummaryScreen

	thumb_func_start ShowSelectMovePokemonSummaryScreen
ShowSelectMovePokemonSummaryScreen: @ 0x081BF3CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r6, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	str r3, [sp]
	movs r0, #3
	mov r1, r8
	adds r2, r4, #0
	adds r3, r5, #0
	bl ShowPokemonSummaryScreen
	ldr r0, _081BF40C
	ldr r0, [r0]
	ldr r1, _081BF410
	adds r0, r0, r1
	strh r6, [r0]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BF40C: .4byte 0x0203CBE8
_081BF410: .4byte 0x000040C4
	thumb_func_end ShowSelectMovePokemonSummaryScreen

	thumb_func_start SummaryScreen_VBlank
SummaryScreen_VBlank: @ 0x081BF414
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SummaryScreen_VBlank

	thumb_func_start FreeSummaryScreen
FreeSummaryScreen: @ 0x081BF430
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FreeSummaryScreen

	thumb_func_start SummaryScreen_LoadingCB2
SummaryScreen_LoadingCB2: @ 0x081BF444
	push {lr}
_081BF446:
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081BF46A
	bl SummaryScreen_LoadGraphics
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081BF46A
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081BF446
_081BF46A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SummaryScreen_LoadingCB2

	thumb_func_start SummaryScreen_LoadGraphics
SummaryScreen_LoadGraphics: @ 0x081BF470
	push {r4, lr}
	sub sp, #4
	ldr r0, _081BF490
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x18
	bls _081BF484
	b _081BF760
_081BF484:
	lsls r0, r0, #2
	ldr r1, _081BF494
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BF490: .4byte 0x03002360
_081BF494: .4byte 0x081BF498
_081BF498: @ jump table
	.4byte _081BF4FC @ case 0
	.4byte _081BF50A @ case 1
	.4byte _081BF51C @ case 2
	.4byte _081BF530 @ case 3
	.4byte _081BF544 @ case 4
	.4byte _081BF54A @ case 5
	.4byte _081BF564 @ case 6
	.4byte _081BF580 @ case 7
	.4byte _081BF586 @ case 8
	.4byte _081BF598 @ case 9
	.4byte _081BF5B8 @ case 10
	.4byte _081BF5DC @ case 11
	.4byte _081BF5E2 @ case 12
	.4byte _081BF5F4 @ case 13
	.4byte _081BF60C @ case 14
	.4byte _081BF620 @ case 15
	.4byte _081BF638 @ case 16
	.4byte _081BF658 @ case 17
	.4byte _081BF694 @ case 18
	.4byte _081BF6B0 @ case 19
	.4byte _081BF6C0 @ case 20
	.4byte _081BF6D4 @ case 21
	.4byte _081BF6DA @ case 22
	.4byte _081BF710 @ case 23
	.4byte _081BF72C @ case 24
_081BF4FC:
	bl SetVBlankHBlankCallbacksToNull
	bl ResetVramOamAndBgCntRegs
	bl clear_scheduled_bg_copies_to_vram
	b _081BF746
_081BF50A:
	bl ScanlineEffect_Stop
	ldr r1, _081BF518
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF518: .4byte 0x03002360
_081BF51C:
	bl ResetPaletteFade
	ldr r2, _081BF52C
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	b _081BF744
	.align 2, 0
_081BF52C: .4byte 0x02037C74
_081BF530:
	bl ResetSpriteData
	ldr r1, _081BF540
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF540: .4byte 0x03002360
_081BF544:
	bl FreeAllSpritePalettes
	b _081BF746
_081BF54A:
	bl InitBGs
	ldr r0, _081BF55C
	ldr r0, [r0]
	ldr r1, _081BF560
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _081BF746
	.align 2, 0
_081BF55C: .4byte 0x0203CBE8
_081BF560: .4byte 0x000040F0
_081BF564:
	bl SummaryScreen_DecompressGraphics
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081BF570
	b _081BF778
_081BF570:
	ldr r1, _081BF57C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF57C: .4byte 0x03002360
_081BF580:
	bl ResetWindows
	b _081BF746
_081BF586:
	bl DrawPagination
	ldr r1, _081BF594
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF594: .4byte 0x03002360
_081BF598:
	ldr r4, _081BF5B0
	ldr r0, [r4]
	adds r0, #0xc
	bl CopyMonToSummaryStruct
	ldr r0, [r4]
	ldr r1, _081BF5B4
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _081BF746
	.align 2, 0
_081BF5B0: .4byte 0x0203CBE8
_081BF5B4: .4byte 0x000040F0
_081BF5B8:
	ldr r0, _081BF5D4
	ldr r0, [r0]
	adds r0, #0xc
	bl ExtractMonDataToSummaryStruct
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081BF5CA
	b _081BF778
_081BF5CA:
	ldr r1, _081BF5D8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF5D4: .4byte 0x0203CBE8
_081BF5D8: .4byte 0x03002360
_081BF5DC:
	bl Summary_PrintMonInfo
	b _081BF746
_081BF5E2:
	bl sub_081C21CC
	ldr r1, _081BF5F0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF5F0: .4byte 0x03002360
_081BF5F4:
	ldr r0, _081BF604
	ldr r0, [r0]
	ldr r1, _081BF608
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PrintPageSpecificText
	b _081BF746
	.align 2, 0
_081BF604: .4byte 0x0203CBE8
_081BF608: .4byte 0x000040C0
_081BF60C:
	bl sub_081BFC7C
	ldr r1, _081BF61C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF61C: .4byte 0x03002360
_081BF620:
	ldr r0, _081BF630
	ldr r0, [r0]
	ldr r1, _081BF634
	adds r0, r0, r1
	ldrb r0, [r0]
	bl CreatePageWindowTilemaps
	b _081BF746
	.align 2, 0
_081BF630: .4byte 0x0203CBE8
_081BF634: .4byte 0x000040C0
_081BF638:
	bl ResetSpriteIds
	bl CreateMoveTypeIcons
	ldr r0, _081BF650
	ldr r0, [r0]
	ldr r1, _081BF654
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _081BF746
	.align 2, 0
_081BF650: .4byte 0x0203CBE8
_081BF654: .4byte 0x000040F0
_081BF658:
	ldr r4, _081BF688
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0xc
	ldr r2, _081BF68C
	adds r1, r1, r2
	bl CreatePokemonSprite
	ldr r1, [r4]
	ldr r2, _081BF690
	adds r1, r1, r2
	strb r0, [r1]
	ldr r1, [r4]
	adds r2, r1, r2
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _081BF67C
	b _081BF778
_081BF67C:
	ldr r0, _081BF68C
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	b _081BF746
	.align 2, 0
_081BF688: .4byte 0x0203CBE8
_081BF68C: .4byte 0x000040F0
_081BF690: .4byte 0x000040D3
_081BF694:
	ldr r0, _081BF6A8
	ldr r0, [r0]
	adds r0, #0xc
	bl CreateMonMarkingsSprite
	ldr r1, _081BF6AC
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF6A8: .4byte 0x0203CBE8
_081BF6AC: .4byte 0x03002360
_081BF6B0:
	ldr r0, _081BF6BC
	ldr r0, [r0]
	adds r0, #0xc
	bl CreateCaughtBallSprite
	b _081BF746
	.align 2, 0
_081BF6BC: .4byte 0x0203CBE8
_081BF6C0:
	bl CreateSetStatusSprite
	ldr r1, _081BF6D0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF6D0: .4byte 0x03002360
_081BF6D4:
	bl SetTypeIcons
	b _081BF746
_081BF6DA:
	ldr r0, _081BF6F4
	ldr r0, [r0]
	ldr r1, _081BF6F8
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _081BF700
	ldr r0, _081BF6FC
	movs r1, #0
	bl CreateTask
	b _081BF746
	.align 2, 0
_081BF6F4: .4byte 0x0203CBE8
_081BF6F8: .4byte 0x000040BC
_081BF6FC: .4byte 0x081BFE45
_081BF700:
	ldr r0, _081BF70C
	movs r1, #0
	bl CreateTask
	b _081BF746
	.align 2, 0
_081BF70C: .4byte 0x081C1051
_081BF710:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r1, _081BF728
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081BF74E
	.align 2, 0
_081BF728: .4byte 0x03002360
_081BF72C:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r2, _081BF758
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
_081BF744:
	strb r0, [r2, #8]
_081BF746:
	ldr r1, _081BF75C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_081BF74E:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081BF778
	.align 2, 0
_081BF758: .4byte 0x02037C74
_081BF75C: .4byte 0x03002360
_081BF760:
	ldr r0, _081BF770
	bl SetVBlankCallback
	ldr r0, _081BF774
	bl SetMainCallback2
	movs r0, #1
	b _081BF77A
	.align 2, 0
_081BF770: .4byte 0x081BF431
_081BF774: .4byte 0x081BF415
_081BF778:
	movs r0, #0
_081BF77A:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SummaryScreen_LoadGraphics

	thumb_func_start InitBGs
InitBGs: @ 0x081BF784
	push {r4, lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081BF800
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r4, _081BF804
	ldr r1, [r4]
	ldr r0, _081BF808
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081BF80C
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	adds r1, #0xbc
	movs r0, #3
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BF800: .4byte 0x085ECE88
_081BF804: .4byte 0x0203CBE8
_081BF808: .4byte 0x000020BC
_081BF80C: .4byte 0x000010BC
	thumb_func_end InitBGs

	thumb_func_start SummaryScreen_DecompressGraphics
SummaryScreen_DecompressGraphics: @ 0x081BF810
	push {r4, lr}
	sub sp, #4
	ldr r1, _081BF834
	ldr r0, [r1]
	ldr r2, _081BF838
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r4, r1, #0
	cmp r0, #0xc
	bls _081BF828
	b _081BF9EC
_081BF828:
	lsls r0, r0, #2
	ldr r1, _081BF83C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BF834: .4byte 0x0203CBE8
_081BF838: .4byte 0x000040F0
_081BF83C: .4byte 0x081BF840
_081BF840: @ jump table
	.4byte _081BF874 @ case 0
	.4byte _081BF890 @ case 1
	.4byte _081BF8C0 @ case 2
	.4byte _081BF8D8 @ case 3
	.4byte _081BF8F0 @ case 4
	.4byte _081BF908 @ case 5
	.4byte _081BF920 @ case 6
	.4byte _081BF950 @ case 7
	.4byte _081BF95C @ case 8
	.4byte _081BF978 @ case 9
	.4byte _081BF984 @ case 10
	.4byte _081BF9A0 @ case 11
	.4byte _081BF9C4 @ case 12
_081BF874:
	bl reset_temp_tile_data_buffers
	ldr r1, _081BF88C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _081BF9A6
	.align 2, 0
_081BF88C: .4byte 0x08D97DD0
_081BF890:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081BF89E
	b _081BF9EC
_081BF89E:
	ldr r0, _081BF8B4
	ldr r4, _081BF8B8
	ldr r1, [r4]
	adds r1, #0xbc
	bl LZDecompressVram
	ldr r1, [r4]
	ldr r2, _081BF8BC
	adds r1, r1, r2
	b _081BF9AE
	.align 2, 0
_081BF8B4: .4byte 0x08D9888C
_081BF8B8: .4byte 0x0203CBE8
_081BF8BC: .4byte 0x000040F0
_081BF8C0:
	ldr r0, _081BF8D0
	ldr r1, [r4]
	ldr r2, _081BF8D4
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r1, [r4]
	b _081BF9AA
	.align 2, 0
_081BF8D0: .4byte 0x08D98E8C
_081BF8D4: .4byte 0x000008BC
_081BF8D8:
	ldr r0, _081BF8E8
	ldr r1, [r4]
	ldr r2, _081BF8EC
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r1, [r4]
	b _081BF9AA
	.align 2, 0
_081BF8E8: .4byte 0x08D98A44
_081BF8EC: .4byte 0x000018BC
_081BF8F0:
	ldr r0, _081BF900
	ldr r1, [r4]
	ldr r2, _081BF904
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r1, [r4]
	b _081BF9AA
	.align 2, 0
_081BF900: .4byte 0x08D98BA8
_081BF904: .4byte 0x000028BC
_081BF908:
	ldr r0, _081BF918
	ldr r1, [r4]
	ldr r2, _081BF91C
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r1, [r4]
	b _081BF9AA
	.align 2, 0
_081BF918: .4byte 0x08D98D14
_081BF91C: .4byte 0x000038BC
_081BF920:
	ldr r0, _081BF940
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl LoadCompressedPalette
	ldr r0, _081BF944
	movs r1, #0x81
	movs r2, #0x1e
	bl LoadPalette
	ldr r0, _081BF948
	ldr r1, [r0]
	ldr r2, _081BF94C
	adds r1, r1, r2
	b _081BF9AE
	.align 2, 0
_081BF940: .4byte 0x08D9879C
_081BF944: .4byte 0x08D85604
_081BF948: .4byte 0x0203CBE8
_081BF94C: .4byte 0x000040F0
_081BF950:
	ldr r0, _081BF958
	bl LoadCompressedSpriteSheet
	b _081BF9A6
	.align 2, 0
_081BF958: .4byte 0x085ED40C
_081BF95C:
	ldr r0, _081BF96C
	bl LoadCompressedSpriteSheet
	ldr r0, _081BF970
	ldr r1, [r0]
	ldr r2, _081BF974
	adds r1, r1, r2
	b _081BF9AE
	.align 2, 0
_081BF96C: .4byte 0x085ED4C4
_081BF970: .4byte 0x0203CBE8
_081BF974: .4byte 0x000040F0
_081BF978:
	ldr r0, _081BF980
	bl LoadCompressedSpriteSheet
	b _081BF9A6
	.align 2, 0
_081BF980: .4byte 0x085ED548
_081BF984:
	ldr r0, _081BF994
	bl LoadCompressedSpritePalette
	ldr r0, _081BF998
	ldr r1, [r0]
	ldr r2, _081BF99C
	adds r1, r1, r2
	b _081BF9AE
	.align 2, 0
_081BF994: .4byte 0x085ED550
_081BF998: .4byte 0x0203CBE8
_081BF99C: .4byte 0x000040F0
_081BF9A0:
	ldr r0, _081BF9B8
	bl LoadCompressedSpritePalette
_081BF9A6:
	ldr r0, _081BF9BC
	ldr r1, [r0]
_081BF9AA:
	ldr r0, _081BF9C0
	adds r1, r1, r0
_081BF9AE:
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _081BF9EC
	.align 2, 0
_081BF9B8: .4byte 0x085ED4CC
_081BF9BC: .4byte 0x0203CBE8
_081BF9C0: .4byte 0x000040F0
_081BF9C4:
	ldr r0, _081BF9E0
	movs r1, #0xe8
	lsls r1, r1, #1
	movs r2, #0x60
	bl LoadCompressedPalette
	ldr r0, _081BF9E4
	ldr r0, [r0]
	ldr r1, _081BF9E8
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	movs r0, #1
	b _081BF9EE
	.align 2, 0
_081BF9E0: .4byte 0x08D97C54
_081BF9E4: .4byte 0x0203CBE8
_081BF9E8: .4byte 0x000040F0
_081BF9EC:
	movs r0, #0
_081BF9EE:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SummaryScreen_DecompressGraphics

	thumb_func_start CopyMonToSummaryStruct
CopyMonToSummaryStruct: @ 0x081BF9F8
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _081BFA24
	ldr r1, [r0]
	ldr r2, _081BFA28
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _081BFA30
	ldr r2, [r1]
	ldr r4, _081BFA2C
	adds r0, r1, r4
	ldrb r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	adds r1, r1, r2
	adds r0, r3, #0
	movs r2, #0x64
	bl memcpy
	b _081BFA46
	.align 2, 0
_081BFA24: .4byte 0x0203CBE8
_081BFA28: .4byte 0x000040BD
_081BFA2C: .4byte 0x000040BE
_081BFA30:
	ldr r0, [r1]
	ldr r2, _081BFA4C
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r1, r3, #0
	bl BoxMonToMon
_081BFA46:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BFA4C: .4byte 0x000040BE
	thumb_func_end CopyMonToSummaryStruct

	thumb_func_start ExtractMonDataToSummaryStruct
ExtractMonDataToSummaryStruct: @ 0x081BFA50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _081BFA78
	ldr r6, [r0]
	adds r5, r6, #0
	adds r5, #0x70
	ldr r1, _081BFA7C
	adds r0, r6, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _081BFAF8
	cmp r0, #1
	bgt _081BFA80
	cmp r0, #0
	beq _081BFA8C
	b _081BFC4A
	.align 2, 0
_081BFA78: .4byte 0x0203CBE8
_081BFA7C: .4byte 0x000040F0
_081BFA80:
	cmp r0, #2
	beq _081BFB36
	cmp r0, #3
	bne _081BFA8A
	b _081BFBF4
_081BFA8A:
	b _081BFC4A
_081BFA8C:
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	strh r0, [r5, #2]
	adds r0, r4, #0
	movs r1, #0x19
	bl GetMonData
	str r0, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	strb r0, [r5, #5]
	adds r0, r4, #0
	movs r1, #0x2e
	bl GetMonData
	strb r0, [r5, #8]
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #4
	bl GetMonData
	adds r1, r6, #0
	adds r1, #0xa5
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BFAEC
	movs r0, #1
	strb r0, [r5, #4]
	b _081BFC58
_081BFAEC:
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	strb r0, [r5, #4]
	b _081BFC58
_081BFAF8:
	movs r5, #0
	adds r7, r6, #0
	adds r7, #0x8c
	movs r0, #0xa4
	adds r0, r0, r6
	mov r8, r0
	adds r6, #0x84
_081BFB06:
	adds r1, r5, #0
	adds r1, #0xd
	adds r0, r4, #0
	bl GetMonData
	strh r0, [r6]
	adds r1, r5, #0
	adds r1, #0x11
	adds r0, r4, #0
	bl GetMonData
	adds r1, r7, r5
	strb r0, [r1]
	adds r6, #2
	adds r5, #1
	cmp r5, #3
	bls _081BFB06
	adds r0, r4, #0
	movs r1, #0x15
	bl GetMonData
	mov r1, r8
	strb r0, [r1]
	b _081BFC58
_081BFB36:
	ldr r1, [r6]
	ldr r0, _081BFB98
	cmp r1, r0
	beq _081BFB48
	ldr r1, _081BFB9C
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _081BFBA0
_081BFB48:
	adds r0, r4, #0
	bl GetNature
	adds r1, r6, #0
	adds r1, #0xa3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	strh r0, [r5, #0x20]
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	strh r0, [r5, #0x22]
	adds r0, r4, #0
	movs r1, #0x3b
	bl GetMonData
	strh r0, [r5, #0x24]
	adds r0, r4, #0
	movs r1, #0x3c
	bl GetMonData
	strh r0, [r5, #0x26]
	adds r0, r4, #0
	movs r1, #0x3e
	bl GetMonData
	strh r0, [r5, #0x28]
	adds r0, r4, #0
	movs r1, #0x3f
	bl GetMonData
	strh r0, [r5, #0x2a]
	adds r0, r4, #0
	movs r1, #0x3d
	b _081BFBEC
	.align 2, 0
_081BFB98: .4byte 0x02024190
_081BFB9C: .4byte 0x000040BC
_081BFBA0:
	adds r0, r4, #0
	bl GetNature
	adds r1, r6, #0
	adds r1, #0xa3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	strh r0, [r5, #0x20]
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	strh r0, [r5, #0x22]
	adds r0, r4, #0
	movs r1, #0x54
	bl GetMonData
	strh r0, [r5, #0x24]
	adds r0, r4, #0
	movs r1, #0x55
	bl GetMonData
	strh r0, [r5, #0x26]
	adds r0, r4, #0
	movs r1, #0x57
	bl GetMonData
	strh r0, [r5, #0x28]
	adds r0, r4, #0
	movs r1, #0x58
	bl GetMonData
	strh r0, [r5, #0x2a]
	adds r0, r4, #0
	movs r1, #0x56
_081BFBEC:
	bl GetMonData
	strh r0, [r5, #0x2c]
	b _081BFC58
_081BFBF4:
	adds r2, r6, #0
	adds r2, #0xa6
	adds r0, r4, #0
	movs r1, #7
	bl GetMonData
	adds r0, r4, #0
	bl GetMonAilment
	strb r0, [r5, #7]
	adds r0, r4, #0
	movs r1, #0x31
	bl GetMonData
	adds r1, r6, #0
	adds r1, #0xa2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	str r0, [r5, #0x48]
	adds r0, r4, #0
	movs r1, #0x23
	bl GetMonData
	strb r0, [r5, #9]
	adds r0, r4, #0
	movs r1, #0x24
	bl GetMonData
	strb r0, [r5, #0xa]
	adds r0, r4, #0
	movs r1, #0x25
	bl GetMonData
	strb r0, [r5, #0xb]
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	strh r0, [r5, #0x30]
	b _081BFC58
_081BFC4A:
	adds r0, r4, #0
	movs r1, #0x52
	bl GetMonData
	strb r0, [r5, #6]
	movs r0, #1
	b _081BFC68
_081BFC58:
	ldr r0, _081BFC74
	ldr r1, [r0]
	ldr r0, _081BFC78
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
_081BFC68:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081BFC74: .4byte 0x0203CBE8
_081BFC78: .4byte 0x000040F0
	thumb_func_end ExtractMonDataToSummaryStruct

	thumb_func_start sub_081BFC7C
sub_081BFC7C: @ 0x081BFC7C
	push {r4, r5, r6, lr}
	ldr r6, _081BFCA8
	ldr r2, [r6]
	ldr r1, _081BFCAC
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _081BFCB0
	movs r0, #0
	movs r1, #0xff
	bl sub_081C16D8
	movs r0, #0
	movs r1, #0xff
	movs r2, #0
	bl sub_081C1830
	b _081BFD0C
	.align 2, 0
_081BFCA8: .4byte 0x0203CBE8
_081BFCAC: .4byte 0x000040C0
_081BFCB0:
	ldr r1, _081BFD24
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #0x84
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DrawContestMoveHearts
	ldr r0, [r6]
	ldr r5, _081BFD28
	adds r0, r0, r5
	movs r1, #3
	movs r2, #0
	bl sub_081C1AC8
	ldr r0, [r6]
	ldr r4, _081BFD2C
	adds r0, r0, r4
	movs r1, #1
	movs r2, #0
	bl sub_081C1AC8
	ldr r1, [r6]
	adds r1, r1, r4
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r6]
	adds r1, r1, r5
	movs r0, #2
	bl SetBgTilemapBuffer
	movs r1, #0x80
	lsls r1, r1, #9
	movs r0, #2
	movs r2, #1
	bl ChangeBgX
	movs r0, #0x13
	bl ClearWindowTilemap
	movs r0, #0xd
	bl ClearWindowTilemap
_081BFD0C:
	ldr r0, _081BFD30
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x77
	ldrb r0, [r0]
	cmp r0, #0
	bne _081BFD34
	movs r0, #0
	movs r1, #0xff
	bl sub_081C19A8
	b _081BFD4A
	.align 2, 0
_081BFD24: .4byte 0x000040C6
_081BFD28: .4byte 0x000020BC
_081BFD2C: .4byte 0x000030BC
_081BFD30: .4byte 0x0203CBE8
_081BFD34:
	ldr r2, _081BFD60
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _081BFD4A
	movs r0, #0xd
	bl PutWindowTilemap
_081BFD4A:
	bl LimitEggSummaryPageDisplay
	ldr r0, _081BFD64
	ldr r0, [r0]
	adds r0, #0xc
	bl DrawPokerusCuredSymbol
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BFD60: .4byte 0x000040C0
_081BFD64: .4byte 0x0203CBE8
	thumb_func_end sub_081BFC7C

	thumb_func_start sub_081BFD68
sub_081BFD68: @ 0x081BFD68
	push {lr}
	bl FreeAllWindowBuffers
	ldr r0, _081BFD7C
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_081BFD7C: .4byte 0x0203CBE8
	thumb_func_end sub_081BFD68

	thumb_func_start BeginCloseSummaryScreen
BeginCloseSummaryScreen: @ 0x081BFD80
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _081BFDB0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081BFDB4
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BFDB0: .4byte 0x03005B60
_081BFDB4: .4byte 0x081BFDB9
	thumb_func_end BeginCloseSummaryScreen

	thumb_func_start CloseSummaryScreen
CloseSummaryScreen: @ 0x081BFDB8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081BFE20
	ldr r0, _081BFE28
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081BFE20
	ldr r4, _081BFE2C
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl SetMainCallback2
	ldr r1, _081BFE30
	ldr r0, [r4]
	ldr r2, _081BFE34
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	bl SummaryScreen_DestroyUnknownTask
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl StopCryAndClearCrySongs
	ldr r0, _081BFE38
	ldr r1, _081BFE3C
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	ldr r0, _081BFE40
	ldr r0, [r0]
	cmp r0, #0
	bne _081BFE16
	movs r0, #0
	bl sub_0806EF00
_081BFE16:
	bl sub_081BFD68
	adds r0, r5, #0
	bl DestroyTask
_081BFE20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081BFE28: .4byte 0x02037C74
_081BFE2C: .4byte 0x0203CBE8
_081BFE30: .4byte 0x0203CBEC
_081BFE34: .4byte 0x000040BE
_081BFE38: .4byte 0x030074D0
_081BFE3C: .4byte 0x0000FFFF
_081BFE40: .4byte 0x02024178
	thumb_func_end CloseSummaryScreen

	thumb_func_start HandleInput
HandleInput: @ 0x081BFE44
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081BFF32
	ldr r0, _081BFE7C
	ldrb r1, [r0, #7]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _081BFF32
	ldr r5, _081BFE80
	ldrh r1, [r5, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081BFE84
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl ChangeSummaryPokemon
	b _081BFF32
	.align 2, 0
_081BFE7C: .4byte 0x02037C74
_081BFE80: .4byte 0x03002360
_081BFE84:
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _081BFE96
	adds r0, r4, #0
	movs r1, #1
	bl ChangeSummaryPokemon
	b _081BFF32
_081BFE96:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081BFEAA
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081BFEB6
_081BFEAA:
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl ChangePage
	b _081BFF32
_081BFEB6:
	ldrh r1, [r5, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _081BFECC
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _081BFED6
_081BFECC:
	adds r0, r4, #0
	movs r1, #1
	bl ChangePage
	b _081BFF32
_081BFED6:
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081BFF1A
	ldr r0, _081BFF04
	ldr r0, [r0]
	ldr r1, _081BFF08
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _081BFF32
	cmp r0, #0
	bne _081BFF0C
	bl StopPokemonAnimations
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl BeginCloseSummaryScreen
	b _081BFF32
	.align 2, 0
_081BFF04: .4byte 0x0203CBE8
_081BFF08: .4byte 0x000040C0
_081BFF0C:
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081C077C
	b _081BFF32
_081BFF1A:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081BFF32
	bl StopPokemonAnimations
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl BeginCloseSummaryScreen
_081BFF32:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end HandleInput

	thumb_func_start ChangeSummaryPokemon
ChangeSummaryPokemon: @ 0x081BFF38
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r4, r5, #0
	ldr r1, _081BFF7C
	ldr r3, [r1]
	ldr r2, _081BFF80
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #0
	bne _081C0022
	ldr r1, _081BFF84
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, #1
	bne _081BFFAC
	adds r1, #3
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081BFF88
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	movs r4, #2
	eors r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r0, r0, #0x1f
	ands r4, r0
	b _081BFF90
	.align 2, 0
_081BFF7C: .4byte 0x0203CBE8
_081BFF80: .4byte 0x000040C3
_081BFF84: .4byte 0x000040BD
_081BFF88:
	movs r4, #3
	cmp r5, #1
	bne _081BFF90
	movs r4, #1
_081BFF90:
	ldr r2, [r6]
	ldr r0, [r2]
	ldr r3, _081BFFA8
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r3, #1
	adds r2, r2, r3
	ldrb r2, [r2]
	adds r3, r4, #0
	bl sub_080D19EC
	b _081BFFCA
	.align 2, 0
_081BFFA8: .4byte 0x000040BE
_081BFFAC:
	bl IsMultiBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081BFFC2
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	bl sub_081C02E8
	b _081BFFCA
_081BFFC2:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_081C022C
_081BFFCA:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _081C0022
	movs r0, #5
	bl PlaySE
	ldr r5, _081C0028
	ldr r0, [r5]
	adds r0, #0x77
	ldrb r0, [r0]
	cmp r0, #0
	beq _081C0008
	movs r0, #2
	movs r1, #1
	bl SetSpriteInvisibility
	movs r0, #0xd
	bl ClearWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #0
	movs r1, #2
	bl sub_081C19A8
_081C0008:
	ldr r0, [r5]
	ldr r1, _081C002C
	adds r0, r0, r1
	movs r2, #0
	strb r4, [r0]
	ldr r1, _081C0030
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r2, [r0, #8]
	ldr r1, _081C0034
	str r1, [r0]
_081C0022:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C0028: .4byte 0x0203CBE8
_081C002C: .4byte 0x000040BE
_081C0030: .4byte 0x03005B60
_081C0034: .4byte 0x081C0039
	thumb_func_end ChangeSummaryPokemon

	thumb_func_start sub_081C0038
sub_081C0038: @ 0x081C0038
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r4, r1, #3
	ldr r6, _081C005C
	adds r5, r4, r6
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0xc
	bls _081C0052
	b _081C01F0
_081C0052:
	lsls r0, r0, #2
	ldr r1, _081C0060
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C005C: .4byte 0x03005B68
_081C0060: .4byte 0x081C0064
_081C0064: @ jump table
	.4byte _081C0098 @ case 0
	.4byte _081C009E @ case 1
	.4byte _081C00B4 @ case 2
	.4byte _081C00DC @ case 3
	.4byte _081C00FC @ case 4
	.4byte _081C0114 @ case 5
	.4byte _081C0124 @ case 6
	.4byte _081C0134 @ case 7
	.4byte _081C015C @ case 8
	.4byte _081C01A0 @ case 9
	.4byte _081C01A6 @ case 10
	.4byte _081C01AC @ case 11
	.4byte _081C01C8 @ case 12
_081C0098:
	bl StopCryAndClearCrySongs
	b _081C0220
_081C009E:
	bl SummaryScreen_DestroyUnknownTask
	ldr r0, _081C00AC
	ldr r0, [r0]
	ldr r1, _081C00B0
	b _081C00BA
	.align 2, 0
_081C00AC: .4byte 0x0203CBE8
_081C00B0: .4byte 0x000040D3
_081C00B4:
	ldr r0, _081C00D0
	ldr r0, [r0]
	ldr r1, _081C00D4
_081C00BA:
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081C00D8
	adds r0, r0, r1
	bl DestroySpriteAndFreeResources
	b _081C0220
	.align 2, 0
_081C00D0: .4byte 0x0203CBE8
_081C00D4: .4byte 0x000040D4
_081C00D8: .4byte 0x020205AC
_081C00DC:
	ldr r4, _081C00F4
	ldr r0, [r4]
	adds r0, #0xc
	bl CopyMonToSummaryStruct
	ldr r0, [r4]
	ldr r1, _081C00F8
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _081C0220
	.align 2, 0
_081C00F4: .4byte 0x0203CBE8
_081C00F8: .4byte 0x000040F0
_081C00FC:
	ldr r0, _081C0110
	ldr r0, [r0]
	adds r0, #0xc
	bl ExtractMonDataToSummaryStruct
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C010E
	b _081C0226
_081C010E:
	b _081C0220
	.align 2, 0
_081C0110: .4byte 0x0203CBE8
_081C0114:
	ldr r0, _081C0120
	ldr r0, [r0]
	adds r0, #0xc
	bl RemoveAndCreateMonMarkingsSprite
	b _081C0220
	.align 2, 0
_081C0120: .4byte 0x0203CBE8
_081C0124:
	ldr r0, _081C0130
	ldr r0, [r0]
	adds r0, #0xc
	bl CreateCaughtBallSprite
	b _081C0220
	.align 2, 0
_081C0130: .4byte 0x0203CBE8
_081C0134:
	ldr r4, _081C0158
	ldr r0, [r4]
	adds r0, #0x77
	ldrb r0, [r0]
	cmp r0, #0
	beq _081C014A
	movs r1, #2
	rsbs r1, r1, #0
	movs r0, #0xa
	bl sub_081C19A8
_081C014A:
	ldr r0, [r4]
	adds r0, #0xc
	bl DrawPokerusCuredSymbol
	movs r0, #0
	strh r0, [r5, #2]
	b _081C0220
	.align 2, 0
_081C0158: .4byte 0x0203CBE8
_081C015C:
	ldr r4, _081C0194
	ldr r0, [r4]
	adds r0, #0xc
	adds r1, r5, #2
	bl CreatePokemonSprite
	ldr r1, [r4]
	ldr r2, _081C0198
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081C0226
	ldr r2, _081C019C
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0, #0x32]
	bl CheckExperienceProgressBar
	movs r0, #0
	strh r0, [r5, #2]
	b _081C0220
	.align 2, 0
_081C0194: .4byte 0x0203CBE8
_081C0198: .4byte 0x000040D3
_081C019C: .4byte 0x020205AC
_081C01A0:
	bl SetTypeIcons
	b _081C0220
_081C01A6:
	bl Summary_PrintMonInfo
	b _081C0220
_081C01AC:
	ldr r0, _081C01C0
	ldr r0, [r0]
	ldr r1, _081C01C4
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PrintPageSpecificText
	bl LimitEggSummaryPageDisplay
	b _081C0220
	.align 2, 0
_081C01C0: .4byte 0x0203CBE8
_081C01C4: .4byte 0x000040C0
_081C01C8:
	ldr r2, _081C01E4
	ldr r0, _081C01E8
	ldr r0, [r0]
	ldr r1, _081C01EC
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x32]
	b _081C0220
	.align 2, 0
_081C01E4: .4byte 0x020205AC
_081C01E8: .4byte 0x0203CBE8
_081C01EC: .4byte 0x000040D3
_081C01F0:
	bl sub_081221F8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C0226
	ldr r0, _081C0218
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _081C0226
	strh r0, [r5]
	adds r0, r6, #0
	subs r0, #8
	adds r0, r4, r0
	ldr r1, _081C021C
	str r1, [r0]
	b _081C0226
	.align 2, 0
_081C0218: .4byte 0x081C1A25
_081C021C: .4byte 0x081BFE45
_081C0220:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_081C0226:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081C0038

	thumb_func_start sub_081C022C
sub_081C022C: @ 0x081C022C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _081C0284
	ldr r2, [r1]
	ldr r7, [r2]
	ldr r3, _081C0288
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	bne _081C0294
	lsls r0, r4, #0x18
	asrs r3, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	adds r6, r0, #0
	cmp r3, r1
	bne _081C025C
	ldr r1, _081C028C
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081C02BC
_081C025C:
	asrs r0, r6, #0x18
	cmp r0, #1
	bne _081C0274
	ldr r0, [r5]
	ldr r2, _081C028C
	adds r1, r0, r2
	ldr r3, _081C0290
	adds r0, r0, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _081C02BC
_081C0274:
	ldr r0, [r5]
	ldr r1, _081C028C
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _081C02E2
	.align 2, 0
_081C0284: .4byte 0x0203CBE8
_081C0288: .4byte 0x000040C0
_081C028C: .4byte 0x000040BE
_081C0290: .4byte 0x000040BF
_081C0294:
	ldr r3, _081C02C4
	adds r0, r2, r3
	ldrb r5, [r0]
	lsls r6, r4, #0x18
_081C029C:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	asrs r1, r6, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	blt _081C02BC
	ldr r0, _081C02C8
	ldr r0, [r0]
	ldr r1, _081C02CC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r4, r0
	ble _081C02D0
_081C02BC:
	movs r0, #1
	rsbs r0, r0, #0
	b _081C02E2
	.align 2, 0
_081C02C4: .4byte 0x000040BE
_081C02C8: .4byte 0x0203CBE8
_081C02CC: .4byte 0x000040BF
_081C02D0:
	movs r0, #0x64
	muls r0, r4, r0
	adds r0, r7, r0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _081C029C
	adds r0, r4, #0
_081C02E2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081C022C

	thumb_func_start sub_081C02E8
sub_081C02E8: @ 0x081C02E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	ldr r6, _081C0368
	ldr r0, [r6]
	ldr r1, [r0]
	mov r8, r1
	movs r5, #0
	movs r2, #0
	ldr r3, _081C036C
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldr r4, _081C0370
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r1, r0
	beq _081C0330
	adds r7, r3, #0
	adds r3, r4, #0
_081C0314:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bhi _081C0330
	adds r0, r2, r7
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r6]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _081C0314
	adds r5, r2, #0
_081C0330:
	mov r0, ip
	lsls r6, r0, #0x18
	ldr r7, _081C036C
_081C0336:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	asrs r1, r6, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r5, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #5
	bhi _081C0374
	asrs r0, r1, #0x18
	adds r0, r0, r7
	movs r4, #0
	ldrsb r4, [r0, r4]
	movs r0, #0x64
	muls r0, r4, r0
	add r0, r8
	bl sub_081C0384
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C0336
	adds r0, r4, #0
	b _081C0378
	.align 2, 0
_081C0368: .4byte 0x0203CBE8
_081C036C: .4byte 0x085ED064
_081C0370: .4byte 0x000040BE
_081C0374:
	movs r0, #1
	rsbs r0, r0, #0
_081C0378:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C02E8

	thumb_func_start sub_081C0384
sub_081C0384: @ 0x081C0384
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081C03B8
	ldr r0, _081C03B0
	ldr r0, [r0]
	ldr r1, _081C03B4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081C03AC
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _081C03B8
_081C03AC:
	movs r0, #1
	b _081C03BA
	.align 2, 0
_081C03B0: .4byte 0x0203CBE8
_081C03B4: .4byte 0x000040BE
_081C03B8:
	movs r0, #0
_081C03BA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081C0384

	thumb_func_start ChangePage
ChangePage: @ 0x081C03C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	str r6, [sp]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	str r3, [sp, #4]
	ldr r0, _081C0468
	mov r8, r0
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x70
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r7, r0, #3
	ldr r0, _081C046C
	mov sb, r0
	adds r0, r7, r0
	str r0, [sp, #8]
	ldrb r1, [r1, #4]
	mov sl, r1
	cmp r1, #0
	bne _081C04A2
	lsls r0, r3, #0x18
	asrs r5, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _081C0414
	ldr r1, _081C0470
	adds r0, r2, r1
	ldr r3, _081C0474
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _081C04A2
_081C0414:
	cmp r5, #1
	bne _081C0428
	ldr r1, _081C0470
	adds r0, r2, r1
	ldr r3, _081C0478
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _081C04A2
_081C0428:
	movs r0, #5
	bl PlaySE
	mov r1, r8
	ldr r0, [r1]
	ldr r4, _081C0470
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ClearPageWindowTilemaps
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r4
	ldrb r0, [r1]
	ldr r3, [sp, #4]
	adds r0, r0, r3
	strb r0, [r1]
	mov r1, sl
	ldr r0, [sp, #8]
	strh r1, [r0]
	cmp r5, #1
	bne _081C0480
	ldr r1, _081C047C
	mov r0, sb
	subs r0, #8
	adds r0, r7, r0
	ldr r2, [r0]
	adds r0, r6, #0
	bl SetTaskFuncWithFollowupFunc
	b _081C0490
	.align 2, 0
_081C0468: .4byte 0x0203CBE8
_081C046C: .4byte 0x03005B68
_081C0470: .4byte 0x000040C0
_081C0474: .4byte 0x000040C1
_081C0478: .4byte 0x000040C2
_081C047C: .4byte 0x081C04C1
_081C0480:
	ldr r1, _081C04B4
	mov r0, sb
	subs r0, #8
	adds r0, r7, r0
	ldr r2, [r0]
	ldr r0, [sp]
	bl SetTaskFuncWithFollowupFunc
_081C0490:
	ldr r0, _081C04B8
	ldr r0, [r0]
	ldr r2, _081C04BC
	adds r0, r0, r2
	ldrb r0, [r0]
	bl CreateTextPrinterTask
	bl HidePageSpecificSprites
_081C04A2:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C04B4: .4byte 0x081C05F9
_081C04B8: .4byte 0x0203CBE8
_081C04BC: .4byte 0x000040C0
	thumb_func_end ChangePage

	thumb_func_start PssScrollRight
PssScrollRight: @ 0x081C04C0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C0508
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081C055E
	ldr r0, _081C050C
	ldr r0, [r0]
	ldr r3, _081C0510
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _081C0514
	movs r0, #1
	strh r0, [r4, #2]
	movs r0, #1
	movs r1, #7
	movs r2, #1
	bl SetBgAttribute
	movs r0, #2
	movs r1, #7
	movs r2, #2
	bl SetBgAttribute
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	b _081C0532
	.align 2, 0
_081C0508: .4byte 0x03005B68
_081C050C: .4byte 0x0203CBE8
_081C0510: .4byte 0x000040C9
_081C0514:
	movs r0, #2
	strh r0, [r4, #2]
	movs r0, #2
	movs r1, #7
	movs r2, #1
	bl SetBgAttribute
	movs r0, #1
	movs r1, #7
	movs r2, #2
	bl SetBgAttribute
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
_081C0532:
	ldrb r0, [r4, #2]
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	ldrb r0, [r4, #2]
	ldr r1, _081C058C
	ldr r1, [r1]
	ldr r3, _081C0590
	adds r2, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0xc
	adds r2, #0xbc
	adds r1, r1, r2
	bl SetBgTilemapBuffer
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
_081C055E:
	ldrb r0, [r4, #2]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r2, #1
	bl ChangeBgX
	ldrh r0, [r4]
	adds r0, #0x20
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _081C0586
	ldr r0, _081C0594
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081C0598
	str r0, [r1]
_081C0586:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C058C: .4byte 0x0203CBE8
_081C0590: .4byte 0x000040C0
_081C0594: .4byte 0x03005B60
_081C0598: .4byte 0x081C059D
	thumb_func_end PssScrollRight

	thumb_func_start PssScrollRightEnd
PssScrollRightEnd: @ 0x081C059C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #3
	ldr r0, _081C05E8
	adds r2, r2, r0
	ldr r5, _081C05EC
	ldr r3, [r5]
	ldr r0, _081C05F0
	adds r3, r3, r0
	ldrb r0, [r3]
	movs r1, #1
	eors r0, r1
	movs r1, #0
	strb r0, [r3]
	strh r1, [r2, #2]
	strh r1, [r2]
	bl DrawPagination
	ldr r0, [r5]
	ldr r1, _081C05F4
	adds r0, r0, r1
	ldrb r0, [r0]
	bl CreatePageWindowTilemaps
	bl SetTypeIcons
	bl CheckExperienceProgressBar
	adds r0, r4, #0
	bl SwitchTaskToFollowupFunc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C05E8: .4byte 0x03005B68
_081C05EC: .4byte 0x0203CBE8
_081C05F0: .4byte 0x000040C9
_081C05F4: .4byte 0x000040C0
	thumb_func_end PssScrollRightEnd

	thumb_func_start PssScrollLeft
PssScrollLeft: @ 0x081C05F8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C0624
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081C0640
	ldr r0, _081C0628
	ldr r0, [r0]
	ldr r1, _081C062C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081C0630
	movs r0, #2
	b _081C0632
	.align 2, 0
_081C0624: .4byte 0x03005B68
_081C0628: .4byte 0x0203CBE8
_081C062C: .4byte 0x000040C9
_081C0630:
	movs r0, #1
_081C0632:
	strh r0, [r4, #2]
	ldrb r0, [r4, #2]
	movs r1, #0x80
	lsls r1, r1, #9
	movs r2, #0
	bl ChangeBgX
_081C0640:
	ldrb r0, [r4, #2]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r2, #2
	bl ChangeBgX
	ldrh r0, [r4]
	adds r0, #0x20
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _081C0668
	ldr r0, _081C0670
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081C0674
	str r0, [r1]
_081C0668:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C0670: .4byte 0x03005B60
_081C0674: .4byte 0x081C0679
	thumb_func_end PssScrollLeft

	thumb_func_start PssScrollLeftEnd
PssScrollLeftEnd: @ 0x081C0678
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C06B4
	adds r4, r0, r1
	ldr r0, _081C06B8
	ldr r0, [r0]
	ldr r1, _081C06BC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081C06C0
	movs r0, #1
	movs r1, #7
	movs r2, #1
	bl SetBgAttribute
	movs r0, #2
	movs r1, #7
	movs r2, #2
	bl SetBgAttribute
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	b _081C06DA
	.align 2, 0
_081C06B4: .4byte 0x03005B68
_081C06B8: .4byte 0x0203CBE8
_081C06BC: .4byte 0x000040C9
_081C06C0:
	movs r0, #2
	movs r1, #7
	movs r2, #1
	bl SetBgAttribute
	movs r0, #1
	movs r1, #7
	movs r2, #2
	bl SetBgAttribute
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
_081C06DA:
	ldr r6, _081C0748
	ldr r2, [r6]
	ldr r7, _081C074C
	adds r1, r2, r7
	ldrb r0, [r1]
	cmp r0, #1
	bls _081C0704
	ldrb r0, [r4, #2]
	ldrb r1, [r1]
	lsls r1, r1, #0xc
	ldr r3, _081C0750
	adds r1, r1, r3
	adds r1, r2, r1
	bl SetBgTilemapBuffer
	ldrb r0, [r4, #2]
	movs r1, #0x80
	lsls r1, r1, #9
	movs r2, #0
	bl ChangeBgX
_081C0704:
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	ldr r2, [r6]
	ldr r0, _081C0754
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #1
	eors r0, r1
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4, #2]
	strh r1, [r4]
	bl DrawPagination
	ldr r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	bl CreatePageWindowTilemaps
	bl SetTypeIcons
	bl CheckExperienceProgressBar
	adds r0, r5, #0
	bl SwitchTaskToFollowupFunc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C0748: .4byte 0x0203CBE8
_081C074C: .4byte 0x000040C0
_081C0750: .4byte 0xFFFFF0BC
_081C0754: .4byte 0x000040C9
	thumb_func_end PssScrollLeftEnd

	thumb_func_start CheckExperienceProgressBar
CheckExperienceProgressBar: @ 0x081C0758
	push {lr}
	ldr r0, _081C0774
	ldr r1, [r0]
	ldr r2, _081C0778
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _081C0770
	adds r0, r1, #0
	adds r0, #0xc
	bl DrawExperienceProgressBar
_081C0770:
	pop {r0}
	bx r0
	.align 2, 0
_081C0774: .4byte 0x0203CBE8
_081C0778: .4byte 0x000040C0
	thumb_func_end CheckExperienceProgressBar

	thumb_func_start sub_081C077C
sub_081C077C: @ 0x081C077C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r5, _081C0854
	ldr r0, [r5]
	ldr r2, _081C0858
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldr r1, [r5]
	adds r2, r1, r2
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, #0x84
	adds r1, r1, r0
	ldrh r6, [r1]
	mov r8, r6
	movs r0, #0x13
	bl ClearWindowTilemap
	ldr r2, _081C085C
	ldr r0, [r5]
	ldr r1, _081C0860
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _081C07CA
	movs r0, #0xd
	bl ClearWindowTilemap
_081C07CA:
	movs r4, #3
	rsbs r4, r4, #0
	movs r0, #9
	adds r1, r4, #0
	bl sub_081C16D8
	movs r0, #9
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_081C1830
	ldr r0, [r5]
	ldr r1, _081C0864
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081C07F8
	movs r0, #5
	bl ClearWindowTilemap
	movs r0, #6
	bl PutWindowTilemap
_081C07F8:
	ldr r0, [r5]
	ldr r1, _081C0868
	adds r0, r0, r1
	movs r1, #3
	movs r2, #0
	bl sub_081C1AC8
	ldr r0, [r5]
	ldr r1, _081C086C
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0
	bl sub_081C1AC8
	mov r0, r8
	bl PrintMoveDetails
	bl PrintNewMoveDetailsOrCancelText
	bl SetNewMoveTypeIcon
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #8
	bl sub_081C4300
	ldr r1, _081C0870
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081C0874
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C0854: .4byte 0x0203CBE8
_081C0858: .4byte 0x000040C6
_081C085C: .4byte 0x020205AC
_081C0860: .4byte 0x000040D5
_081C0864: .4byte 0x000040C8
_081C0868: .4byte 0x000020BC
_081C086C: .4byte 0x000030BC
_081C0870: .4byte 0x03005B60
_081C0874: .4byte 0x081C0879
	thumb_func_end sub_081C077C

	thumb_func_start HandleInput_MoveSelect
HandleInput_MoveSelect: @ 0x081C0878
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C08BC
	adds r4, r0, r1
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C096E
	ldr r0, _081C08C0
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081C08CC
	movs r0, #4
	strh r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	ldr r0, _081C08C4
	ldr r2, [r0]
	ldr r0, _081C08C8
	adds r2, r2, r0
	adds r0, r4, #0
	bl sub_081C09A4
	b _081C096E
	.align 2, 0
_081C08BC: .4byte 0x03005B68
_081C08C0: .4byte 0x03002360
_081C08C4: .4byte 0x0203CBE8
_081C08C8: .4byte 0x000040C6
_081C08CC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081C08F4
	movs r0, #4
	strh r0, [r4]
	ldr r0, _081C08EC
	ldr r2, [r0]
	ldr r0, _081C08F0
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #1
	bl sub_081C09A4
	b _081C096E
	.align 2, 0
_081C08EC: .4byte 0x0203CBE8
_081C08F0: .4byte 0x000040C6
_081C08F4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C095A
	ldr r0, _081C092C
	ldr r1, [r0]
	ldr r2, _081C0930
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	beq _081C091C
	subs r2, #4
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r1, _081C0934
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	cmp r0, r1
	bne _081C0938
_081C091C:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081C0B28
	b _081C096E
	.align 2, 0
_081C092C: .4byte 0x0203CBE8
_081C0930: .4byte 0x000040C8
_081C0934: .4byte 0x00FFFFFF
_081C0938:
	bl sub_081C0974
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C0952
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081C0BD0
	b _081C096E
_081C0952:
	movs r0, #0x20
	bl PlaySE
	b _081C096E
_081C095A:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C096E
	movs r0, #5
	bl PlaySE
	adds r0, r6, #0
	bl sub_081C0B28
_081C096E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end HandleInput_MoveSelect

	thumb_func_start sub_081C0974
sub_081C0974: @ 0x081C0974
	push {lr}
	movs r1, #1
	ldr r0, _081C0990
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x84
_081C0980:
	lsls r0, r1, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _081C0994
	movs r0, #1
	b _081C09A0
	.align 2, 0
_081C0990: .4byte 0x0203CBE8
_081C0994:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _081C0980
	movs r0, #0
_081C09A0:
	pop {r1}
	bx r1
	thumb_func_end sub_081C0974

	thumb_func_start sub_081C09A4
sub_081C09A4: @ 0x081C09A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	mov r0, r8
	ldrb r6, [r0]
	movs r2, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov ip, r4
	movs r1, #0
	ldrsh r4, [r7, r1]
	ldrb r0, [r7]
	lsls r3, r0, #0x18
_081C09D0:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	add r0, ip
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	ble _081C09E4
	movs r6, #0
	b _081C09EA
_081C09E4:
	cmp r0, #0
	bge _081C09EA
	lsrs r6, r3, #0x18
_081C09EA:
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	mov sb, r0
	cmp r1, #4
	bne _081C09F6
	b _081C0B00
_081C09F6:
	ldr r0, _081C0AEC
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r0, #0x84
	adds r0, r0, r1
	ldrh r5, [r0]
	cmp r5, #0
	bne _081C0A16
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _081C09D0
_081C0A16:
	adds r0, r5, #0
	bl DrawContestMoveHearts
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r5, #0
	bl PrintMoveDetails
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #4
	bne _081C0A44
	ldr r0, _081C0AEC
	ldr r0, [r0]
	ldr r1, _081C0AF0
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _081C0A4C
_081C0A44:
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r0, #1
	bne _081C0A92
_081C0A4C:
	movs r0, #0x13
	bl ClearWindowTilemap
	ldr r2, _081C0AF4
	ldr r0, _081C0AEC
	ldr r0, [r0]
	ldr r1, _081C0AF8
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _081C0A76
	movs r0, #0xd
	bl ClearWindowTilemap
_081C0A76:
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r4, #3
	rsbs r4, r4, #0
	movs r0, #9
	adds r1, r4, #0
	bl sub_081C16D8
	movs r0, #9
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_081C1830
_081C0A92:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #4
	beq _081C0AD4
	mov r1, sb
	asrs r0, r1, #0x18
	cmp r0, #4
	bne _081C0AD4
	ldr r0, _081C0AEC
	ldr r0, [r0]
	ldr r1, _081C0AF0
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _081C0AD4
	movs r0, #0xe
	bl ClearWindowTilemap
	movs r0, #0xf
	bl ClearWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #0
	movs r1, #3
	bl sub_081C16D8
	movs r0, #0
	movs r1, #3
	movs r2, #0
	bl sub_081C1830
_081C0AD4:
	mov r0, r8
	strb r6, [r0]
	ldr r0, _081C0AEC
	ldr r0, [r0]
	ldr r1, _081C0AFC
	adds r0, r0, r1
	cmp r8, r0
	bne _081C0B14
	movs r0, #8
	bl sub_081C4520
	b _081C0B1A
	.align 2, 0
_081C0AEC: .4byte 0x0203CBE8
_081C0AF0: .4byte 0x000040C4
_081C0AF4: .4byte 0x020205AC
_081C0AF8: .4byte 0x000040D5
_081C0AFC: .4byte 0x000040C6
_081C0B00:
	ldr r0, _081C0B0C
	ldr r0, [r0]
	ldr r1, _081C0B10
	adds r0, r0, r1
	ldrh r5, [r0]
	b _081C0A16
	.align 2, 0
_081C0B0C: .4byte 0x0203CBE8
_081C0B10: .4byte 0x000040C4
_081C0B14:
	movs r0, #0x12
	bl sub_081C4520
_081C0B1A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C09A4

	thumb_func_start sub_081C0B28
sub_081C0B28: @ 0x081C0B28
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #8
	bl sub_081C4468
	movs r0, #6
	bl ClearWindowTilemap
	movs r0, #5
	bl PutWindowTilemap
	movs r0, #0
	bl PrintMoveDetails
	ldr r4, _081C0BB8
	ldr r0, [r4]
	ldr r1, _081C0BBC
	adds r0, r0, r1
	movs r1, #3
	movs r2, #1
	bl sub_081C1AC8
	ldr r0, [r4]
	ldr r1, _081C0BC0
	adds r0, r0, r1
	movs r1, #1
	movs r2, #1
	bl sub_081C1AC8
	bl sub_081C3888
	ldr r0, [r4]
	ldr r1, _081C0BC4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #4
	beq _081C0B92
	movs r0, #0xe
	bl ClearWindowTilemap
	movs r0, #0xf
	bl ClearWindowTilemap
	movs r0, #0
	movs r1, #3
	bl sub_081C16D8
	movs r0, #0
	movs r1, #3
	movs r2, #0
	bl sub_081C1830
_081C0B92:
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _081C0BC8
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081C0BCC
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C0BB8: .4byte 0x0203CBE8
_081C0BBC: .4byte 0x000020BC
_081C0BC0: .4byte 0x000030BC
_081C0BC4: .4byte 0x000040C6
_081C0BC8: .4byte 0x03005B60
_081C0BCC: .4byte 0x081BFE45
	thumb_func_end sub_081C0B28

	thumb_func_start sub_081C0BD0
sub_081C0BD0: @ 0x081C0BD0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081C0C08
	ldr r0, [r0]
	ldr r2, _081C0C0C
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r2, #1
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #1
	bl sub_081C448C
	movs r0, #0x12
	bl sub_081C4300
	ldr r1, _081C0C10
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081C0C14
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C0C08: .4byte 0x0203CBE8
_081C0C0C: .4byte 0x000040C6
_081C0C10: .4byte 0x03005B60
_081C0C14: .4byte 0x081C0C19
	thumb_func_end sub_081C0BD0

	thumb_func_start sub_081C0C18
sub_081C0C18: @ 0x081C0C18
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C0C5C
	adds r4, r0, r1
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C0CDE
	ldr r0, _081C0C60
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081C0C6C
	movs r0, #3
	strh r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	ldr r0, _081C0C64
	ldr r2, [r0]
	ldr r0, _081C0C68
	adds r2, r2, r0
	adds r0, r4, #0
	bl sub_081C09A4
	b _081C0CDE
	.align 2, 0
_081C0C5C: .4byte 0x03005B68
_081C0C60: .4byte 0x03002360
_081C0C64: .4byte 0x0203CBE8
_081C0C68: .4byte 0x000040C7
_081C0C6C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081C0C94
	movs r0, #3
	strh r0, [r4]
	ldr r0, _081C0C8C
	ldr r2, [r0]
	ldr r0, _081C0C90
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #1
	bl sub_081C09A4
	b _081C0CDE
	.align 2, 0
_081C0C8C: .4byte 0x0203CBE8
_081C0C90: .4byte 0x000040C7
_081C0C94:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C0CCE
	ldr r0, _081C0CBC
	ldr r0, [r0]
	ldr r2, _081C0CC0
	adds r1, r0, r2
	adds r2, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081C0CC4
	adds r0, r5, #0
	movs r1, #0
	bl sub_081C0CE4
	b _081C0CDE
	.align 2, 0
_081C0CBC: .4byte 0x0203CBE8
_081C0CC0: .4byte 0x000040C6
_081C0CC4:
	adds r0, r5, #0
	movs r1, #1
	bl sub_081C0CE4
	b _081C0CDE
_081C0CCE:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C0CDE
	adds r0, r6, #0
	movs r1, #0
	bl sub_081C0CE4
_081C0CDE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081C0C18

	thumb_func_start sub_081C0CE4
sub_081C0CE4: @ 0x081C0CE4
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_081C448C
	movs r0, #0x12
	bl sub_081C4468
	cmp r4, #1
	bne _081C0D98
	ldr r0, _081C0D34
	ldr r3, [r0]
	ldr r1, _081C0D38
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081C0D44
	ldr r0, [r3]
	ldr r2, _081C0D3C
	adds r1, r3, r2
	ldrb r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r4, _081C0D40
	adds r1, r3, r4
	ldrb r1, [r1]
	adds r4, #1
	adds r2, r3, r4
	ldrb r2, [r2]
	bl SwapBoxMonMoves
	b _081C0D64
	.align 2, 0
_081C0D34: .4byte 0x0203CBE8
_081C0D38: .4byte 0x000040BD
_081C0D3C: .4byte 0x000040BE
_081C0D40: .4byte 0x000040C6
_081C0D44:
	ldr r0, [r3]
	ldr r2, _081C0DD8
	adds r1, r3, r2
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r4, _081C0DDC
	adds r1, r3, r4
	ldrb r1, [r1]
	adds r4, #1
	adds r2, r3, r4
	ldrb r2, [r2]
	bl SwapMonMoves
_081C0D64:
	ldr r5, _081C0DE0
	ldr r0, [r5]
	adds r0, #0xc
	bl CopyMonToSummaryStruct
	ldr r1, [r5]
	ldr r6, _081C0DDC
	adds r0, r1, r6
	ldrb r0, [r0]
	ldr r4, _081C0DE4
	adds r1, r1, r4
	ldrb r1, [r1]
	bl PrintEggOTName
	ldr r1, [r5]
	adds r0, r1, r6
	ldrb r0, [r0]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl sub_081C3D8C
	ldr r0, [r5]
	adds r4, r0, r4
	ldrb r1, [r4]
	adds r0, r0, r6
	strb r1, [r0]
_081C0D98:
	ldr r0, _081C0DE0
	ldr r1, [r0]
	ldr r2, _081C0DDC
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x84
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r4, #0
	bl PrintMoveDetails
	adds r0, r4, #0
	bl DrawContestMoveHearts
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081C0DE8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081C0DEC
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C0DD8: .4byte 0x000040BE
_081C0DDC: .4byte 0x000040C6
_081C0DE0: .4byte 0x0203CBE8
_081C0DE4: .4byte 0x000040C7
_081C0DE8: .4byte 0x03005B60
_081C0DEC: .4byte 0x081C0879
	thumb_func_end sub_081C0CE4

	thumb_func_start SwapBoxMonMoves
SwapBoxMonMoves: @ 0x081C0DF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _081C0F18
	ldr r2, [r0]
	lsls r0, r4, #1
	mov sl, r0
	adds r1, r2, #0
	adds r1, #0x84
	adds r0, r1, r0
	str r0, [sp, #8]
	ldrh r0, [r0]
	mov r3, sp
	adds r3, #2
	str r3, [sp, #0x1c]
	strh r0, [r3]
	lsls r0, r6, #1
	mov sb, r0
	add r1, sb
	str r1, [sp, #0xc]
	ldrh r1, [r1]
	mov r0, sp
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x8c
	adds r3, r1, r4
	str r3, [sp, #0x10]
	ldrb r0, [r3]
	mov r3, sp
	adds r3, #5
	str r3, [sp, #0x24]
	strb r0, [r3]
	adds r1, r1, r6
	str r1, [sp, #0x14]
	ldrb r0, [r1]
	mov r1, sp
	adds r1, #4
	str r1, [sp, #0x20]
	strb r0, [r1]
	adds r2, #0xa4
	str r2, [sp, #0x18]
	ldrb r0, [r2]
	mov r5, sp
	adds r5, #6
	strb r0, [r5]
	ldr r1, _081C0F1C
	adds r0, r4, r1
	ldrb r0, [r0]
	mov r8, r0
	ldrb r0, [r5]
	adds r2, r0, #0
	mov r3, r8
	ands r2, r3
	mov r3, sl
	asrs r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r1, r6, r1
	ldrb r1, [r1]
	mov ip, r1
	adds r1, r0, #0
	mov r3, ip
	ands r1, r3
	mov r3, sb
	asrs r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r3, r8
	bics r0, r3
	strb r0, [r5]
	ldrb r0, [r5]
	mov r3, ip
	bics r0, r3
	strb r0, [r5]
	mov r0, sb
	lsls r2, r0
	mov r3, sl
	lsls r1, r3
	adds r2, r2, r1
	ldrb r0, [r5]
	orrs r0, r2
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r7, #0
	mov r2, sp
	bl SetMonData
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r7, #0
	ldr r2, [sp, #0x1c]
	bl SetMonData
	adds r4, #0x11
	adds r0, r7, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x20]
	bl SetMonData
	adds r6, #0x11
	adds r0, r7, #0
	adds r1, r6, #0
	ldr r2, [sp, #0x24]
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0x15
	adds r2, r5, #0
	bl SetMonData
	mov r0, sp
	ldrh r0, [r0]
	ldr r1, [sp, #8]
	strh r0, [r1]
	ldr r3, [sp, #0x1c]
	ldrh r0, [r3]
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	ldr r3, [sp, #0x24]
	ldrb r0, [r3]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	ldrb r0, [r5]
	ldr r3, [sp, #0x18]
	strb r0, [r3]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C0F18: .4byte 0x0203CBE8
_081C0F1C: .4byte 0x082FA6AA
	thumb_func_end SwapBoxMonMoves

	thumb_func_start SwapMonMoves
SwapMonMoves: @ 0x081C0F20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _081C1048
	ldr r2, [r0]
	lsls r0, r4, #1
	mov sl, r0
	adds r1, r2, #0
	adds r1, #0x84
	adds r0, r1, r0
	str r0, [sp, #8]
	ldrh r0, [r0]
	mov r3, sp
	adds r3, #2
	str r3, [sp, #0x1c]
	strh r0, [r3]
	lsls r0, r6, #1
	mov sb, r0
	add r1, sb
	str r1, [sp, #0xc]
	ldrh r1, [r1]
	mov r0, sp
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x8c
	adds r3, r1, r4
	str r3, [sp, #0x10]
	ldrb r0, [r3]
	mov r3, sp
	adds r3, #5
	str r3, [sp, #0x24]
	strb r0, [r3]
	adds r1, r1, r6
	str r1, [sp, #0x14]
	ldrb r0, [r1]
	mov r1, sp
	adds r1, #4
	str r1, [sp, #0x20]
	strb r0, [r1]
	adds r2, #0xa4
	str r2, [sp, #0x18]
	ldrb r0, [r2]
	mov r5, sp
	adds r5, #6
	strb r0, [r5]
	ldr r1, _081C104C
	adds r0, r4, r1
	ldrb r0, [r0]
	mov r8, r0
	ldrb r0, [r5]
	adds r2, r0, #0
	mov r3, r8
	ands r2, r3
	mov r3, sl
	asrs r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r1, r6, r1
	ldrb r1, [r1]
	mov ip, r1
	adds r1, r0, #0
	mov r3, ip
	ands r1, r3
	mov r3, sb
	asrs r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r3, r8
	bics r0, r3
	strb r0, [r5]
	ldrb r0, [r5]
	mov r3, ip
	bics r0, r3
	strb r0, [r5]
	mov r0, sb
	lsls r2, r0
	mov r3, sl
	lsls r1, r3
	adds r2, r2, r1
	ldrb r0, [r5]
	orrs r0, r2
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r7, #0
	mov r2, sp
	bl SetBoxMonData
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r7, #0
	ldr r2, [sp, #0x1c]
	bl SetBoxMonData
	adds r4, #0x11
	adds r0, r7, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x20]
	bl SetBoxMonData
	adds r6, #0x11
	adds r0, r7, #0
	adds r1, r6, #0
	ldr r2, [sp, #0x24]
	bl SetBoxMonData
	adds r0, r7, #0
	movs r1, #0x15
	adds r2, r5, #0
	bl SetBoxMonData
	mov r0, sp
	ldrh r0, [r0]
	ldr r1, [sp, #8]
	strh r0, [r1]
	ldr r3, [sp, #0x1c]
	ldrh r0, [r3]
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	ldr r3, [sp, #0x24]
	ldrb r0, [r3]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	ldrb r0, [r5]
	ldr r3, [sp, #0x18]
	strb r0, [r3]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C1048: .4byte 0x0203CBE8
_081C104C: .4byte 0x082FA6AA
	thumb_func_end SwapMonMoves

	thumb_func_start sub_081C1050
sub_081C1050: @ 0x081C1050
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SetNewMoveTypeIcon
	movs r0, #8
	bl sub_081C4300
	ldr r1, _081C1078
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081C107C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C1078: .4byte 0x03005B60
_081C107C: .4byte 0x081C1081
	thumb_func_end sub_081C1050

	thumb_func_start HandleReplaceMoveInput
HandleReplaceMoveInput: @ 0x081C1080
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C10D4
	adds r4, r0, r1
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C109E
	b _081C11CE
_081C109E:
	ldr r0, _081C10D8
	ldrb r1, [r0, #7]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _081C10AE
	b _081C11CE
_081C10AE:
	ldr r6, _081C10DC
	ldrh r1, [r6, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081C10E8
	movs r0, #4
	strh r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	ldr r0, _081C10E0
	ldr r2, [r0]
	ldr r0, _081C10E4
	adds r2, r2, r0
	adds r0, r4, #0
	bl sub_081C09A4
	b _081C11CE
	.align 2, 0
_081C10D4: .4byte 0x03005B68
_081C10D8: .4byte 0x02037C74
_081C10DC: .4byte 0x03002360
_081C10E0: .4byte 0x0203CBE8
_081C10E4: .4byte 0x000040C6
_081C10E8:
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _081C1110
	movs r0, #4
	strh r0, [r4]
	ldr r0, _081C1108
	ldr r2, [r0]
	ldr r1, _081C110C
	adds r2, r2, r1
	adds r0, r4, #0
	movs r1, #1
	bl sub_081C09A4
	b _081C11CE
	.align 2, 0
_081C1108: .4byte 0x0203CBE8
_081C110C: .4byte 0x000040C6
_081C1110:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081C1124
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C1130
_081C1124:
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r5, #0
	bl ChangePage
	b _081C11CE
_081C1130:
	ldrh r1, [r6, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _081C1146
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _081C1150
_081C1146:
	adds r0, r5, #0
	movs r1, #1
	bl ChangePage
	b _081C11CE
_081C1150:
	ldrh r1, [r6, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C11AA
	bl CanReplaceMove
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C119C
	bl StopPokemonAnimations
	movs r0, #5
	bl PlaySE
	ldr r2, _081C118C
	ldr r0, _081C1190
	ldr r0, [r0]
	ldr r1, _081C1194
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r1, _081C1198
	ldrb r0, [r2]
	strh r0, [r1]
	adds r0, r5, #0
	bl BeginCloseSummaryScreen
	b _081C11CE
	.align 2, 0
_081C118C: .4byte 0x0203CBED
_081C1190: .4byte 0x0203CBE8
_081C1194: .4byte 0x000040C6
_081C1198: .4byte 0x02037282
_081C119C:
	movs r0, #0x20
	bl PlaySE
	adds r0, r5, #0
	bl ShowHMMovesCantBeForgottenWindow
	b _081C11CE
_081C11AA:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C11CE
	bl StopPokemonAnimations
	movs r0, #5
	bl PlaySE
	ldr r1, _081C11D4
	movs r0, #4
	strb r0, [r1]
	ldr r1, _081C11D8
	movs r0, #4
	strh r0, [r1]
	adds r0, r5, #0
	bl BeginCloseSummaryScreen
_081C11CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C11D4: .4byte 0x0203CBED
_081C11D8: .4byte 0x02037282
	thumb_func_end HandleReplaceMoveInput

	thumb_func_start CanReplaceMove
CanReplaceMove: @ 0x081C11DC
	push {lr}
	ldr r0, _081C1214
	ldr r2, [r0]
	ldr r0, _081C1218
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #4
	beq _081C120E
	ldr r3, _081C121C
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, #0
	beq _081C120E
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #0x84
	adds r0, r0, r1
	ldrh r0, [r0]
	bl IsMoveHm
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C1220
_081C120E:
	movs r0, #1
	b _081C1222
	.align 2, 0
_081C1214: .4byte 0x0203CBE8
_081C1218: .4byte 0x000040C6
_081C121C: .4byte 0x000040C4
_081C1220:
	movs r0, #0
_081C1222:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CanReplaceMove

	thumb_func_start ShowHMMovesCantBeForgottenWindow
ShowHMMovesCantBeForgottenWindow: @ 0x081C1228
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0xe
	bl ClearWindowTilemap
	movs r0, #0xf
	bl ClearWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #0
	movs r1, #3
	bl sub_081C16D8
	movs r0, #0
	movs r1, #3
	movs r2, #0
	bl sub_081C1830
	bl PrintHMMovesCantBeForgotten
	ldr r1, _081C126C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081C1270
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C126C: .4byte 0x03005B60
_081C1270: .4byte 0x081C1275
	thumb_func_end ShowHMMovesCantBeForgottenWindow

	thumb_func_start HandleHMMovesCantBeForgottenInput
HandleHMMovesCantBeForgottenInput: @ 0x081C1274
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	mov r8, r0
	ldr r0, _081C12D0
	mov sb, r0
	mov r4, r8
	add r4, sb
	ldr r0, _081C12D4
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C12A0
	b _081C14A8
_081C12A0:
	ldr r6, _081C12D8
	ldrh r1, [r6, #0x2e]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _081C12E4
	movs r0, #1
	strh r0, [r4, #2]
	movs r0, #4
	strh r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	ldr r0, _081C12DC
	ldr r2, [r0]
	ldr r0, _081C12E0
	adds r2, r2, r0
	adds r0, r4, #0
	bl sub_081C09A4
	movs r0, #0
	strh r0, [r4, #2]
	b _081C149E
	.align 2, 0
_081C12D0: .4byte 0x03005B68
_081C12D4: .4byte 0x081C1755
_081C12D8: .4byte 0x03002360
_081C12DC: .4byte 0x0203CBE8
_081C12E0: .4byte 0x000040C6
_081C12E4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081C1310
	movs r0, #1
	strh r0, [r4, #2]
	movs r0, #4
	strh r0, [r4]
	ldr r0, _081C1308
	ldr r2, [r0]
	ldr r1, _081C130C
	adds r2, r2, r1
	adds r0, r4, #0
	movs r1, #1
	bl sub_081C09A4
	strh r5, [r4, #2]
	b _081C149E
	.align 2, 0
_081C1308: .4byte 0x0203CBE8
_081C130C: .4byte 0x000040C6
_081C1310:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081C1324
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C1398
_081C1324:
	ldr r4, _081C1380
	ldr r0, [r4]
	ldr r2, _081C1384
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _081C1334
	b _081C14A8
_081C1334:
	movs r0, #0x13
	bl ClearWindowTilemap
	ldr r2, _081C1388
	ldr r0, [r4]
	ldr r1, _081C138C
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _081C135C
	movs r0, #0xd
	bl ClearWindowTilemap
_081C135C:
	ldr r1, [r4]
	ldr r2, _081C1390
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x84
	adds r1, r1, r0
	ldrh r5, [r1]
	mov r0, sb
	subs r0, #8
	add r0, r8
	ldr r1, _081C1394
	str r1, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	b _081C1402
	.align 2, 0
_081C1380: .4byte 0x0203CBE8
_081C1384: .4byte 0x000040C0
_081C1388: .4byte 0x020205AC
_081C138C: .4byte 0x000040D5
_081C1390: .4byte 0x000040C6
_081C1394: .4byte 0x081C1081
_081C1398:
	ldrh r1, [r6, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _081C13AE
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _081C1438
_081C13AE:
	ldr r4, _081C1420
	ldr r0, [r4]
	ldr r1, _081C1424
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _081C14A8
	movs r0, #0x13
	bl ClearWindowTilemap
	ldr r2, _081C1428
	ldr r0, [r4]
	ldr r1, _081C142C
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _081C13E4
	movs r0, #0xd
	bl ClearWindowTilemap
_081C13E4:
	ldr r1, [r4]
	ldr r2, _081C1430
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x84
	adds r1, r1, r0
	ldrh r5, [r1]
	mov r0, sb
	subs r0, #8
	add r0, r8
	ldr r1, _081C1434
	str r1, [r0]
	adds r0, r7, #0
	movs r1, #1
_081C1402:
	bl ChangePage
	movs r4, #2
	rsbs r4, r4, #0
	movs r0, #9
	adds r1, r4, #0
	bl sub_081C16D8
	movs r0, #9
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_081C1830
	b _081C14A8
	.align 2, 0
_081C1420: .4byte 0x0203CBE8
_081C1424: .4byte 0x000040C0
_081C1428: .4byte 0x020205AC
_081C142C: .4byte 0x000040D5
_081C1430: .4byte 0x000040C6
_081C1434: .4byte 0x081C1081
_081C1438:
	ldrh r1, [r6, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _081C14A8
	movs r0, #0x13
	bl ClearWindowTilemap
	ldr r2, _081C14B4
	ldr r4, _081C14B8
	ldr r0, [r4]
	ldr r1, _081C14BC
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _081C146C
	movs r0, #0xd
	bl ClearWindowTilemap
_081C146C:
	ldr r1, [r4]
	ldr r2, _081C14C0
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x84
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl PrintMoveDetails
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r4, #3
	rsbs r4, r4, #0
	movs r0, #9
	adds r1, r4, #0
	bl sub_081C16D8
	movs r0, #9
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_081C1830
_081C149E:
	mov r0, sb
	subs r0, #8
	add r0, r8
	ldr r1, _081C14C4
	str r1, [r0]
_081C14A8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C14B4: .4byte 0x020205AC
_081C14B8: .4byte 0x0203CBE8
_081C14BC: .4byte 0x000040D5
_081C14C0: .4byte 0x000040C6
_081C14C4: .4byte 0x081C1081
	thumb_func_end HandleHMMovesCantBeForgottenInput

	thumb_func_start sub_081C14C8
sub_081C14C8: @ 0x081C14C8
	ldr r0, _081C14D0
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081C14D0: .4byte 0x0203CBED
	thumb_func_end sub_081C14C8

	thumb_func_start DrawPagination
DrawPagination: @ 0x081C14D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r0, #0x20
	bl Alloc
	adds r4, r0, #0
	movs r5, #0
_081C14E2:
	lsls r0, r5, #0x19
	lsrs r1, r0, #0x18
	adds r6, r1, #0
	ldr r0, _081C1504
	ldr r3, [r0]
	ldr r2, _081C1508
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r5, r0
	bhs _081C150C
	lsls r0, r1, #1
	adds r0, r0, r4
	movs r1, #0x40
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r1, #0x50
	b _081C1522
	.align 2, 0
_081C1504: .4byte 0x0203CBE8
_081C1508: .4byte 0x000040C1
_081C150C:
	ldr r7, _081C1528
	adds r0, r3, r7
	ldrb r2, [r0]
	cmp r5, r2
	bls _081C152C
	lsls r0, r1, #1
	adds r0, r0, r4
	movs r1, #0x4a
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r1, #0x5a
_081C1522:
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	b _081C15AC
	.align 2, 0
_081C1528: .4byte 0x000040C2
_081C152C:
	ldr r7, _081C154C
	adds r0, r3, r7
	ldrb r0, [r0]
	cmp r5, r0
	bhs _081C1550
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0x46
	strh r0, [r1]
	movs r0, #0x47
	strh r0, [r1, #2]
	movs r0, #0x56
	strh r0, [r1, #0x10]
	movs r0, #0x57
	b _081C15AA
	.align 2, 0
_081C154C: .4byte 0x000040C0
_081C1550:
	cmp r5, r0
	bne _081C1580
	cmp r5, r2
	beq _081C156C
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0x41
	strh r0, [r1]
	movs r0, #0x42
	strh r0, [r1, #2]
	movs r0, #0x51
	strh r0, [r1, #0x10]
	movs r0, #0x52
	b _081C15AA
_081C156C:
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0x4b
	strh r0, [r1]
	movs r0, #0x4c
	strh r0, [r1, #2]
	movs r0, #0x5b
	strh r0, [r1, #0x10]
	movs r0, #0x5c
	b _081C15AA
_081C1580:
	cmp r5, r2
	beq _081C1598
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0x43
	strh r0, [r1]
	movs r0, #0x44
	strh r0, [r1, #2]
	movs r0, #0x53
	strh r0, [r1, #0x10]
	movs r0, #0x54
	b _081C15AA
_081C1598:
	lsls r1, r6, #1
	adds r1, r1, r4
	movs r0, #0x48
	strh r0, [r1]
	movs r0, #0x49
	strh r0, [r1, #2]
	movs r0, #0x58
	strh r0, [r1, #0x10]
	movs r0, #0x59
_081C15AA:
	strh r0, [r1, #0x12]
_081C15AC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _081C14E2
	movs r0, #8
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #3
	adds r1, r4, #0
	movs r2, #0xb
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r4, #0
	bl Free
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DrawPagination

	thumb_func_start sub_081C15E4
sub_081C15E4: @ 0x081C15E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldrb r1, [r4, #6]
	ldrb r0, [r4, #7]
	lsls r0, r0, #1
	muls r0, r1, r0
	bl Alloc
	adds r7, r0, #0
	mov r1, sp
	ldrh r0, [r4, #4]
	strh r0, [r1]
	ldrb r1, [r4, #7]
	ldrb r0, [r4, #6]
	adds r2, r1, #0
	muls r2, r0, r2
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	adds r1, r7, #0
	bl CpuSet
	ldrb r0, [r4, #6]
	cmp r0, r6
	beq _081C1694
	cmp r5, #0
	bne _081C1664
	movs r5, #0
	ldrb r0, [r4, #7]
	cmp r5, r0
	bhs _081C1694
_081C1634:
	ldrb r2, [r4, #6]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r3, r6, r1
	lsls r3, r3, #1
	ldr r0, [r4]
	adds r0, r0, r3
	lsls r1, r1, #1
	adds r1, r7, r1
	subs r2, r2, r6
	ldr r3, _081C1660
	ands r2, r3
	bl CpuSet
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r3, [r4, #7]
	cmp r5, r3
	blo _081C1634
	b _081C1694
	.align 2, 0
_081C1660: .4byte 0x001FFFFF
_081C1664:
	movs r5, #0
	ldrb r0, [r4, #7]
	cmp r5, r0
	bhs _081C1694
_081C166C:
	ldrb r2, [r4, #6]
	adds r1, r2, #0
	muls r1, r5, r1
	lsls r3, r1, #1
	ldr r0, [r4]
	adds r0, r0, r3
	adds r1, r6, r1
	lsls r1, r1, #1
	adds r1, r7, r1
	subs r2, r2, r6
	ldr r3, _081C1698
	ands r2, r3
	bl CpuSet
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r3, [r4, #7]
	cmp r5, r3
	blo _081C166C
_081C1694:
	movs r5, #0
	b _081C16BE
	.align 2, 0
_081C1698: .4byte 0x001FFFFF
_081C169C:
	ldrb r2, [r4, #6]
	adds r0, r2, #0
	muls r0, r5, r0
	lsls r0, r0, #1
	adds r0, r7, r0
	ldrb r1, [r4, #9]
	adds r1, r1, r5
	lsls r1, r1, #5
	ldrb r3, [r4, #8]
	adds r1, r1, r3
	lsls r1, r1, #1
	add r1, r8
	bl CpuSet
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_081C16BE:
	ldrb r0, [r4, #7]
	cmp r5, r0
	blo _081C169C
	adds r0, r7, #0
	bl Free
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C15E4

	thumb_func_start sub_081C16D8
sub_081C16D8: @ 0x081C16D8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _081C1710
	ldrb r2, [r3, #6]
	cmp r1, r2
	ble _081C16EE
	adds r4, r2, #0
_081C16EE:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _081C16FA
	cmp r0, r2
	bne _081C171C
_081C16FA:
	ldr r0, _081C1714
	ldr r1, [r0]
	ldr r0, _081C1718
	adds r1, r1, r0
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	adds r0, r3, #0
	movs r3, #1
	bl sub_081C15E4
	b _081C1746
	.align 2, 0
_081C1710: .4byte 0x085ED04C
_081C1714: .4byte 0x0203CBE8
_081C1718: .4byte 0x000020BC
_081C171C:
	ldr r5, _081C174C
	adds r0, r5, #0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _081C1738
	adds r0, r5, #0
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_081C1738:
	ldr r1, _081C1750
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #8]
	strh r6, [r0, #0xa]
_081C1746:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C174C: .4byte 0x081C1755
_081C1750: .4byte 0x03005B60
	thumb_func_end sub_081C16D8

	thumb_func_start sub_081C1754
sub_081C1754: @ 0x081C1754
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081C177C
	adds r4, r0, r1
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _081C1784
	movs r0, #0
	strh r0, [r4, #2]
	ldr r7, _081C1780
	b _081C1794
	.align 2, 0
_081C177C: .4byte 0x03005B68
_081C1780: .4byte 0x085ED04C
_081C1784:
	movs r0, #2
	ldrsh r1, [r4, r0]
	ldr r0, _081C17D0
	ldrb r2, [r0, #6]
	adds r7, r0, #0
	cmp r1, r2
	ble _081C1794
	strh r2, [r4, #2]
_081C1794:
	ldr r5, _081C17D4
	ldr r1, [r5]
	ldr r0, _081C17D8
	adds r1, r1, r0
	ldrb r2, [r4, #2]
	adds r0, r7, #0
	movs r3, #1
	bl sub_081C15E4
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _081C17B4
	ldrb r7, [r7, #6]
	cmp r0, r7
	blt _081C1814
_081C17B4:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _081C17E0
	ldr r0, [r5]
	ldr r1, _081C17DC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _081C1808
	movs r0, #0xe
	bl PutWindowTilemap
	b _081C1808
	.align 2, 0
_081C17D0: .4byte 0x085ED04C
_081C17D4: .4byte 0x0203CBE8
_081C17D8: .4byte 0x000020BC
_081C17DC: .4byte 0x000040C0
_081C17E0:
	ldr r2, _081C1828
	ldr r0, [r5]
	ldr r1, _081C182C
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _081C1802
	movs r0, #0xd
	bl PutWindowTilemap
_081C1802:
	movs r0, #0x13
	bl PutWindowTilemap
_081C1808:
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, #0
	bl DestroyTask
_081C1814:
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C1828: .4byte 0x020205AC
_081C182C: .4byte 0x000040D5
	thumb_func_end sub_081C1754

	thumb_func_start sub_081C1830
sub_081C1830: @ 0x081C1830
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _081C186C
	ldrb r2, [r3, #6]
	cmp r1, r2
	ble _081C184A
	adds r4, r2, #0
_081C184A:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _081C1856
	cmp r0, r2
	bne _081C1878
_081C1856:
	ldr r0, _081C1870
	ldr r1, [r0]
	ldr r0, _081C1874
	adds r1, r1, r0
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	adds r0, r3, #0
	movs r3, #1
	bl sub_081C15E4
	b _081C18A4
	.align 2, 0
_081C186C: .4byte 0x085ED058
_081C1870: .4byte 0x0203CBE8
_081C1874: .4byte 0x000030BC
_081C1878:
	ldr r5, _081C18AC
	adds r0, r5, #0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _081C1894
	adds r0, r5, #0
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_081C1894:
	ldr r1, _081C18B0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #8]
	strh r7, [r0, #0xa]
	strh r6, [r0, #0xc]
_081C18A4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C18AC: .4byte 0x081C18B5
_081C18B0: .4byte 0x03005B60
	thumb_func_end sub_081C1830

	thumb_func_start sub_081C18B4
sub_081C18B4: @ 0x081C18B4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081C18DC
	adds r4, r0, r1
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _081C18E4
	movs r0, #0
	strh r0, [r4, #2]
	ldr r7, _081C18E0
	b _081C18F4
	.align 2, 0
_081C18DC: .4byte 0x03005B68
_081C18E0: .4byte 0x085ED058
_081C18E4:
	movs r0, #2
	ldrsh r1, [r4, r0]
	ldr r0, _081C1944
	ldrb r2, [r0, #6]
	adds r7, r0, #0
	cmp r1, r2
	ble _081C18F4
	strh r2, [r4, #2]
_081C18F4:
	ldr r5, _081C1948
	ldr r1, [r5]
	ldr r0, _081C194C
	adds r1, r1, r0
	ldrb r2, [r4, #2]
	adds r0, r7, #0
	movs r3, #1
	bl sub_081C15E4
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _081C1914
	ldrb r7, [r7, #6]
	cmp r0, r7
	blt _081C198C
_081C1914:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _081C1958
	ldr r0, [r5]
	ldr r1, _081C1950
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C193A
	ldr r0, _081C1954
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C193A
	movs r0, #0xf
	bl PutWindowTilemap
_081C193A:
	ldrh r0, [r4, #4]
	bl DrawContestMoveHearts
	b _081C1980
	.align 2, 0
_081C1944: .4byte 0x085ED058
_081C1948: .4byte 0x0203CBE8
_081C194C: .4byte 0x000030BC
_081C1950: .4byte 0x000040C0
_081C1954: .4byte 0x081C04C1
_081C1958:
	ldr r2, _081C19A0
	ldr r0, [r5]
	ldr r1, _081C19A4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _081C197A
	movs r0, #0xd
	bl PutWindowTilemap
_081C197A:
	movs r0, #0x13
	bl PutWindowTilemap
_081C1980:
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, #0
	bl DestroyTask
_081C198C:
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C19A0: .4byte 0x020205AC
_081C19A4: .4byte 0x000040D5
	thumb_func_end sub_081C18B4

	thumb_func_start sub_081C19A8
sub_081C19A8: @ 0x081C19A8
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _081C19F0
	ldrb r2, [r3, #6]
	cmp r1, r2
	ble _081C19BE
	adds r4, r2, #0
_081C19BE:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _081C19CA
	cmp r0, r2
	bne _081C19FC
_081C19CA:
	ldr r5, _081C19F4
	ldr r1, [r5]
	adds r1, #0xbc
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r3, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_081C15E4
	ldr r0, _081C19F8
	ldr r1, [r5]
	adds r1, #0xbc
	adds r2, r4, #0
	movs r3, #0
	bl sub_081C15E4
	b _081C1A16
	.align 2, 0
_081C19F0: .4byte 0x085ED034
_081C19F4: .4byte 0x0203CBE8
_081C19F8: .4byte 0x085ED040
_081C19FC:
	ldr r0, _081C1A1C
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081C1A20
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	strh r5, [r1, #0xa]
_081C1A16:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C1A1C: .4byte 0x081C1A25
_081C1A20: .4byte 0x03005B60
	thumb_func_end sub_081C19A8

	thumb_func_start sub_081C1A24
sub_081C1A24: @ 0x081C1A24
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081C1A4C
	adds r5, r0, r1
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _081C1A54
	movs r0, #0
	strh r0, [r5, #2]
	ldr r7, _081C1A50
	b _081C1A64
	.align 2, 0
_081C1A4C: .4byte 0x03005B68
_081C1A50: .4byte 0x085ED034
_081C1A54:
	movs r0, #2
	ldrsh r1, [r5, r0]
	ldr r0, _081C1ABC
	ldrb r2, [r0, #6]
	adds r7, r0, #0
	cmp r1, r2
	ble _081C1A64
	strh r2, [r5, #2]
_081C1A64:
	ldr r4, _081C1AC0
	ldr r1, [r4]
	adds r1, #0xbc
	ldrb r2, [r5, #2]
	adds r0, r7, #0
	movs r3, #0
	bl sub_081C15E4
	ldr r0, _081C1AC4
	ldr r1, [r4]
	adds r1, #0xbc
	ldrb r2, [r5, #2]
	movs r3, #0
	bl sub_081C15E4
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _081C1A96
	ldrb r7, [r7, #6]
	cmp r0, r7
	blt _081C1AB4
_081C1A96:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _081C1AAE
	bl CreateSetStatusSprite
	movs r0, #0xd
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
_081C1AAE:
	adds r0, r6, #0
	bl DestroyTask
_081C1AB4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C1ABC: .4byte 0x085ED034
_081C1AC0: .4byte 0x0203CBE8
_081C1AC4: .4byte 0x085ED040
	thumb_func_end sub_081C1A24

	thumb_func_start sub_081C1AC8
sub_081C1AC8: @ 0x081C1AC8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r2, r2, #0x18
	lsls r1, r1, #0x1c
	lsrs r4, r1, #0x10
	ldr r7, _081C1B10
	cmp r2, #0
	bne _081C1B18
	movs r3, #0
	ldr r5, _081C1B14
_081C1ADC:
	adds r2, r7, r3
	lsls r2, r2, #1
	adds r2, r2, r6
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, r4, r1
	strh r1, [r2]
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r2, #0x80
	adds r0, r3, #0
	adds r0, #0x14
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r4, r0
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x13
	bls _081C1ADC
	b _081C1B50
	.align 2, 0
_081C1B10: .4byte 0x0000056A
_081C1B14: .4byte 0x085ECFBC
_081C1B18:
	movs r3, #0
	ldr r5, _081C1B58
_081C1B1C:
	adds r1, r7, r3
	lsls r1, r1, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0x14
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r4, r0
	strh r0, [r1]
	adds r2, r1, #0
	adds r2, #0x40
	adds r0, r3, #0
	adds r0, #0x28
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r4, r0
	strh r0, [r2]
	adds r1, #0x80
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x13
	bls _081C1B1C
_081C1B50:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C1B58: .4byte 0x085ECFBC
	thumb_func_end sub_081C1AC8

	thumb_func_start DrawPokerusCuredSymbol
DrawPokerusCuredSymbol: @ 0x081C1B5C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl CheckPartyPokerus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C1B90
	adds r0, r4, #0
	movs r1, #0
	bl CheckPartyHasHadPokerus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C1B90
	ldr r0, _081C1B88
	ldr r0, [r0]
	ldr r2, _081C1B8C
	adds r1, r0, r2
	movs r2, #0x2c
	b _081C1B9A
	.align 2, 0
_081C1B88: .4byte 0x0203CBE8
_081C1B8C: .4byte 0x00000482
_081C1B90:
	ldr r0, _081C1BB0
	ldr r0, [r0]
	ldr r2, _081C1BB4
	adds r1, r0, r2
	ldr r2, _081C1BB8
_081C1B9A:
	strh r2, [r1]
	ldr r1, _081C1BBC
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C1BB0: .4byte 0x0203CBE8
_081C1BB4: .4byte 0x00000482
_081C1BB8: .4byte 0x0000081A
_081C1BBC: .4byte 0x00000C82
	thumb_func_end DrawPokerusCuredSymbol

	thumb_func_start Summary_SetDexNumberColor
Summary_SetDexNumberColor: @ 0x081C1BC0
	push {lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _081C1BE0
	movs r0, #8
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #3
	movs r1, #1
	movs r2, #4
	movs r3, #8
	bl sub_081998C8
	b _081C1BF4
_081C1BE0:
	movs r0, #8
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #1
	movs r2, #4
	movs r3, #8
	bl sub_081998C8
_081C1BF4:
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #8
	pop {r0}
	bx r0
	thumb_func_end Summary_SetDexNumberColor

	thumb_func_start DrawExperienceProgressBar
DrawExperienceProgressBar: @ 0x081C1C00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _081C1C68
	ldr r1, [r0]
	adds r6, r1, #0
	adds r6, #0x70
	ldrb r1, [r6, #5]
	mov r8, r0
	cmp r1, #0x63
	bhi _081C1C74
	ldr r5, _081C1C6C
	adds r2, r1, #0
	adds r1, r2, #1
	lsls r1, r1, #2
	ldr r4, _081C1C70
	ldrh r3, [r6]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r3, [r0, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	muls r0, r3, r0
	adds r1, r1, r0
	adds r1, r1, r5
	lsls r2, r2, #2
	adds r2, r2, r0
	adds r2, r2, r5
	ldr r1, [r1]
	ldr r2, [r2]
	subs r1, r1, r2
	ldr r0, [r6, #0x10]
	subs r4, r0, r2
	lsls r0, r4, #6
	bl __udivsi3
	adds r6, r0, #0
	movs r7, #0
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	bne _081C1C78
	cmp r4, #0
	beq _081C1C78
	movs r6, #1
	movs r7, #0
	b _081C1C78
	.align 2, 0
_081C1C68: .4byte 0x0203CBE8
_081C1C6C: .4byte 0x082F00B4
_081C1C70: .4byte 0x082F0D54
_081C1C74:
	movs r6, #0
	movs r7, #0
_081C1C78:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _081C1CA4
	adds r2, r2, r0
	mov sb, r2
	movs r0, #0
	mov ip, r0
	ldr r1, _081C1CA8
	mov sl, r1
_081C1C8A:
	cmp r7, #0
	bgt _081C1C96
	cmp r7, #0
	bne _081C1CB0
	cmp r6, #7
	bls _081C1CB0
_081C1C96:
	mov r2, ip
	lsls r0, r2, #1
	add r0, sb
	ldr r2, _081C1CAC
	adds r1, r2, #0
	strh r1, [r0]
	b _081C1CEA
	.align 2, 0
_081C1CA4: .4byte 0x00001D66
_081C1CA8: .4byte 0x00002062
_081C1CAC: .4byte 0x0000206A
_081C1CB0:
	mov r1, ip
	lsls r0, r1, #1
	add r0, sb
	mov r8, r0
	adds r5, r7, #0
	adds r4, r6, #0
	cmp r7, #0
	bge _081C1CC8
	movs r4, #7
	movs r5, #0
	adds r4, r4, r6
	adcs r5, r7
_081C1CC8:
	lsls r3, r5, #0x1d
	lsrs r2, r4, #3
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r5, #3
	lsrs r5, r0, #0x1d
	lsls r4, r1, #3
	adds r3, r5, #0
	orrs r3, r4
	lsls r2, r0, #3
	adds r1, r7, #0
	adds r0, r6, #0
	subs r0, r0, r2
	sbcs r1, r3
	add r0, sl
	mov r2, r8
	strh r0, [r2]
_081C1CEA:
	movs r0, #8
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
	adds r6, r6, r0
	adcs r7, r1
	cmp r7, #0
	bge _081C1CFC
	movs r6, #0
	movs r7, #0
_081C1CFC:
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #7
	bls _081C1C8A
	movs r0, #1
	bl GetBgTilemapBuffer
	ldr r1, _081C1D24
	ldr r1, [r1]
	ldr r2, _081C1D28
	adds r1, r1, r2
	cmp r0, r1
	bne _081C1D2C
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	b _081C1D32
	.align 2, 0
_081C1D24: .4byte 0x0203CBE8
_081C1D28: .4byte 0x000010BC
_081C1D2C:
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
_081C1D32:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DrawExperienceProgressBar

	thumb_func_start DrawContestMoveHearts
DrawContestMoveHearts: @ 0x081C1D40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _081C1DA4
	ldr r0, [r0]
	ldr r1, _081C1DA8
	adds r5, r0, r1
	cmp r3, #0
	beq _081C1E44
	ldr r1, _081C1DAC
	ldr r2, _081C1DB0
	lsls r3, r3, #3
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0, #1]
	mov sb, r1
	mov r8, r2
	mov sl, r3
	cmp r4, #0xff
	beq _081C1D80
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081C1D80:
	movs r2, #0
	movs r6, #3
	movs r3, #0xf3
	lsls r3, r3, #2
_081C1D88:
	cmp r4, #0xff
	beq _081C1DB8
	cmp r2, r4
	bhs _081C1DB8
	lsrs r0, r2, #2
	adds r1, r2, #0
	ands r1, r6
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	adds r0, r0, r3
	ldr r7, _081C1DB4
	b _081C1DCA
	.align 2, 0
_081C1DA4: .4byte 0x0203CBE8
_081C1DA8: .4byte 0x000038BC
_081C1DAC: .4byte 0x08566AE4
_081C1DB0: .4byte 0x08565FCC
_081C1DB4: .4byte 0x0000103A
_081C1DB8:
	lsrs r0, r2, #2
	adds r1, r2, #0
	ands r1, r6
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	adds r0, r0, r3
	ldr r7, _081C1E18
_081C1DCA:
	adds r1, r7, #0
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _081C1D88
	mov r0, sl
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	ldrb r4, [r0, #2]
	cmp r4, #0xff
	beq _081C1DF4
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081C1DF4:
	movs r2, #0
	movs r6, #3
	ldr r3, _081C1E1C
_081C1DFA:
	cmp r4, #0xff
	beq _081C1E24
	cmp r2, r4
	bhs _081C1E24
	lsrs r0, r2, #2
	adds r1, r2, #0
	ands r1, r6
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	adds r0, r0, r3
	ldr r7, _081C1E20
	b _081C1E36
	.align 2, 0
_081C1E18: .4byte 0x00001039
_081C1E1C: .4byte 0x0000044C
_081C1E20: .4byte 0x0000103C
_081C1E24:
	lsrs r0, r2, #2
	adds r1, r2, #0
	ands r1, r6
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	adds r0, r0, r3
	ldr r7, _081C1E54
_081C1E36:
	adds r1, r7, #0
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _081C1DFA
_081C1E44:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C1E54: .4byte 0x0000103D
	thumb_func_end DrawContestMoveHearts

	thumb_func_start LimitEggSummaryPageDisplay
LimitEggSummaryPageDisplay: @ 0x081C1E58
	push {lr}
	ldr r0, _081C1E74
	ldr r0, [r0]
	adds r0, #0x74
	ldrb r0, [r0]
	cmp r0, #0
	beq _081C1E78
	movs r1, #0x80
	lsls r1, r1, #9
	movs r0, #3
	movs r2, #0
	bl ChangeBgX
	b _081C1E82
	.align 2, 0
_081C1E74: .4byte 0x0203CBE8
_081C1E78:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
_081C1E82:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LimitEggSummaryPageDisplay

	thumb_func_start ResetWindows
ResetWindows: @ 0x081C1E88
	push {r4, r5, lr}
	ldr r0, _081C1ECC
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r4, #0
_081C1E96:
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _081C1E96
	movs r4, #0
	ldr r5, _081C1ED0
	ldr r3, _081C1ED4
	movs r2, #0xff
_081C1EB0:
	ldr r0, [r5]
	adds r0, r0, r3
	adds r0, r0, r4
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _081C1EB0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C1ECC: .4byte 0x085ED06C
_081C1ED0: .4byte 0x0203CBE8
_081C1ED4: .4byte 0x000040CB
	thumb_func_end ResetWindows

	thumb_func_start SummaryScreen_PrintTextOnWindow
SummaryScreen_PrintTextOnWindow: @ 0x081C1ED8
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r6, #0
	str r6, [sp]
	str r4, [sp, #4]
	lsls r4, r5, #1
	adds r4, r4, r5
	ldr r5, _081C1F18
	adds r4, r4, r5
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #1
	bl AddTextPrinterParameterized4
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C1F18: .4byte 0x085ED17C
	thumb_func_end SummaryScreen_PrintTextOnWindow

	thumb_func_start Summary_PrintMonInfo
Summary_PrintMonInfo: @ 0x081C1F1C
	push {lr}
	movs r0, #0x11
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0x12
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0x13
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _081C1F48
	ldr r0, [r0]
	adds r0, #0x74
	ldrb r0, [r0]
	cmp r0, #0
	bne _081C1F4C
	bl Summary_PrintNotEggInfo
	b _081C1F50
	.align 2, 0
_081C1F48: .4byte 0x0203CBE8
_081C1F4C:
	bl Summary_PrintEggInfo
_081C1F50:
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Summary_PrintMonInfo

	thumb_func_start Summary_PrintNotEggInfo
Summary_PrintNotEggInfo: @ 0x081C1F5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _081C1FCC
	ldr r0, [r0]
	movs r1, #0xc
	adds r1, r1, r0
	mov r8, r1
	adds r7, r0, #0
	adds r7, #0x70
	ldrh r0, [r7]
	bl SpeciesToPokedexNum
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _081C1FD0
	cmp r5, r0
	beq _081C2002
	ldr r6, _081C1FD4
	ldr r1, _081C1FD8
	adds r0, r6, #0
	bl StringCopy
	ldr r4, _081C1FDC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r6, #0
	adds r1, r4, #0
	bl StringAppend
	mov r0, r8
	bl IsMonShiny
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _081C1FE0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x11
	adds r1, r6, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	movs r0, #0
	bl Summary_SetDexNumberColor
	b _081C1FFA
	.align 2, 0
_081C1FCC: .4byte 0x0203CBE8
_081C1FD0: .4byte 0x0000FFFF
_081C1FD4: .4byte 0x02021C40
_081C1FD8: .4byte 0x085C9411
_081C1FDC: .4byte 0x02021C54
_081C1FE0:
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x11
	adds r1, r6, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	movs r0, #1
	bl Summary_SetDexNumberColor
_081C1FFA:
	movs r0, #0x11
	bl PutWindowTilemap
	b _081C2022
_081C2002:
	movs r0, #0x11
	bl ClearWindowTilemap
	mov r0, r8
	bl IsMonShiny
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C201C
	movs r0, #0
	bl Summary_SetDexNumberColor
	b _081C2022
_081C201C:
	movs r0, #1
	bl Summary_SetDexNumberColor
_081C2022:
	ldr r6, _081C2078
	ldr r1, _081C207C
	adds r0, r6, #0
	bl StringCopy
	ldr r4, _081C2080
	ldrb r1, [r7, #5]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r6, #0
	adds r1, r4, #0
	bl StringAppend
	movs r4, #0
	str r4, [sp]
	movs r5, #1
	str r5, [sp, #4]
	movs r0, #0x12
	adds r1, r6, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	mov r0, r8
	adds r1, r6, #0
	bl GetMonNickname
	ldrb r0, [r7, #5]
	cmp r0, #9
	bhi _081C2084
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0x12
	adds r1, r6, #0
	movs r2, #0x18
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	b _081C2094
	.align 2, 0
_081C2078: .4byte 0x02021C40
_081C207C: .4byte 0x085C940E
_081C2080: .4byte 0x02021C54
_081C2084:
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0x12
	adds r1, r6, #0
	movs r2, #0x20
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
_081C2094:
	ldrh r0, [r7, #2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _081C20D4
	adds r1, r1, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x13
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldrh r1, [r7, #2]
	mov r0, r8
	bl Summar_PrintGenderSymbol
	movs r0, #0x12
	bl PutWindowTilemap
	movs r0, #0x13
	bl PutWindowTilemap
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C20D4: .4byte 0x082EA31C
	thumb_func_end Summary_PrintNotEggInfo

	thumb_func_start Summary_PrintEggInfo
Summary_PrintEggInfo: @ 0x081C20D8
	push {r4, lr}
	sub sp, #8
	ldr r0, _081C2118
	ldr r0, [r0]
	adds r0, #0xc
	ldr r4, _081C211C
	adds r1, r4, #0
	bl GetMonNickname
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x12
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	movs r0, #0x12
	bl PutWindowTilemap
	movs r0, #0x11
	bl ClearWindowTilemap
	movs r0, #0x13
	bl ClearWindowTilemap
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2118: .4byte 0x0203CBE8
_081C211C: .4byte 0x02021C40
	thumb_func_end Summary_PrintEggInfo

	thumb_func_start Summar_PrintGenderSymbol
Summar_PrintGenderSymbol: @ 0x081C2120
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	beq _081C218E
	cmp r1, #0x1d
	beq _081C218E
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _081C2158
	adds r0, r0, r1
	bl StringLength
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl GetMonGender
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081C215C
	cmp r0, #0xfe
	beq _081C2178
	b _081C218E
	.align 2, 0
_081C2158: .4byte 0x082EA31C
_081C215C:
	ldr r1, _081C2174
	lsls r2, r4, #0x1b
	lsrs r2, r2, #0x18
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x13
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	b _081C218E
	.align 2, 0
_081C2174: .4byte 0x085C940A
_081C2178:
	ldr r1, _081C2198
	lsls r2, r4, #0x1b
	lsrs r2, r2, #0x18
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0x13
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
_081C218E:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C2198: .4byte 0x085C940C
	thumb_func_end Summar_PrintGenderSymbol

	thumb_func_start PrintAOrBButtonIcon
PrintAOrBButtonIcon: @ 0x081C219C
	push {lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _081C21C8
	cmp r1, #0
	bne _081C21AE
	subs r2, #0x80
_081C21AE:
	movs r0, #0x10
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	adds r1, r2, #0
	movs r2, #0
	movs r3, #0
	bl BlitBitmapToWindow
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_081C21C8: .4byte 0x085ED223
	thumb_func_end PrintAOrBButtonIcon

	thumb_func_start sub_081C21CC
sub_081C21CC: @ 0x081C21CC
	push {r4, r5, lr}
	sub sp, #8
	ldr r1, _081C2374
	movs r4, #0
	str r4, [sp]
	movs r5, #1
	str r5, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C2378
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #1
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C237C
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C2380
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #3
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	movs r0, #4
	movs r1, #0
	bl PrintAOrBButtonIcon
	ldr r1, _081C2384
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #4
	movs r2, #0x10
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	movs r0, #5
	movs r1, #0
	bl PrintAOrBButtonIcon
	ldr r1, _081C2388
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #5
	movs r2, #0x10
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	movs r0, #6
	movs r1, #0
	bl PrintAOrBButtonIcon
	ldr r1, _081C238C
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #6
	movs r2, #0x10
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C2390
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #7
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C2394
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #8
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C2398
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0x10
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C239C
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #9
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23A0
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xa
	movs r2, #8
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23A4
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xa
	movs r2, #0
	movs r3, #0x12
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23A8
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xa
	movs r2, #0
	movs r3, #0x22
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23AC
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xb
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23B0
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xb
	movs r2, #0
	movs r3, #0x12
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23B4
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xb
	movs r2, #0
	movs r3, #0x22
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23B8
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xc
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23BC
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xc
	movs r2, #0
	movs r3, #0x12
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23C0
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xd
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23C4
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xe
	movs r2, #8
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23C8
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xe
	movs r2, #0
	movs r3, #0x12
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23CC
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xf
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C23D0
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xf
	movs r2, #0
	movs r3, #0x12
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C2374: .4byte 0x085CA3E4
_081C2378: .4byte 0x085CA3EE
_081C237C: .4byte 0x085CA3F8
_081C2380: .4byte 0x085CA3FF
_081C2384: .4byte 0x085C93C8
_081C2388: .4byte 0x085CA407
_081C238C: .4byte 0x085CA3DF
_081C2390: .4byte 0x085CA38E
_081C2394: .4byte 0x085CA392
_081C2398: .4byte 0x085C941A
_081C239C: .4byte 0x085CA39B
_081C23A0: .4byte 0x085CA388
_081C23A4: .4byte 0x085CA36F
_081C23A8: .4byte 0x085CA374
_081C23AC: .4byte 0x085CA379
_081C23B0: .4byte 0x085CA37E
_081C23B4: .4byte 0x085CA383
_081C23B8: .4byte 0x085CA3BB
_081C23BC: .4byte 0x085CA3C6
_081C23C0: .4byte 0x085CA3B5
_081C23C4: .4byte 0x085CA3A0
_081C23C8: .4byte 0x085CA3A5
_081C23CC: .4byte 0x085CA3AB
_081C23D0: .4byte 0x085CA3B0
	thumb_func_end sub_081C21CC

	thumb_func_start CreatePageWindowTilemaps
CreatePageWindowTilemaps: @ 0x081C23D4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	movs r0, #0
	bl ClearWindowTilemap
	movs r0, #1
	bl ClearWindowTilemap
	movs r0, #2
	bl ClearWindowTilemap
	movs r0, #3
	bl ClearWindowTilemap
	cmp r4, #1
	beq _081C244C
	cmp r4, #1
	bgt _081C2402
	cmp r4, #0
	beq _081C240C
	b _081C24EA
_081C2402:
	cmp r5, #2
	beq _081C2466
	cmp r5, #3
	beq _081C24A8
	b _081C24EA
_081C240C:
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #4
	bl PutWindowTilemap
	bl InBattleFactory
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C2430
	bl InSlateportBattleTent
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C2438
_081C2430:
	movs r0, #8
	bl PutWindowTilemap
	b _081C2444
_081C2438:
	movs r0, #7
	bl PutWindowTilemap
	movs r0, #0x10
	bl PutWindowTilemap
_081C2444:
	movs r0, #9
	bl PutWindowTilemap
	b _081C24EA
_081C244C:
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #0xa
	bl PutWindowTilemap
	movs r0, #0xb
	bl PutWindowTilemap
	movs r0, #0xc
	bl PutWindowTilemap
	b _081C24EA
_081C2466:
	movs r0, #2
	bl PutWindowTilemap
	ldr r0, _081C2494
	ldr r1, [r0]
	ldr r2, _081C2498
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C24A0
	adds r2, #8
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r1, _081C249C
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	cmp r0, r1
	beq _081C24EA
	movs r0, #0xe
	bl PutWindowTilemap
	b _081C24EA
	.align 2, 0
_081C2494: .4byte 0x0203CBE8
_081C2498: .4byte 0x000040BC
_081C249C: .4byte 0x00FFFFFF
_081C24A0:
	movs r0, #5
	bl PutWindowTilemap
	b _081C24EA
_081C24A8:
	movs r0, #3
	bl PutWindowTilemap
	ldr r0, _081C24D8
	ldr r1, [r0]
	ldr r2, _081C24DC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C24E4
	adds r2, #8
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r1, _081C24E0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	cmp r0, r1
	beq _081C24EA
	movs r0, #0xf
	bl PutWindowTilemap
	b _081C24EA
	.align 2, 0
_081C24D8: .4byte 0x0203CBE8
_081C24DC: .4byte 0x000040BC
_081C24E0: .4byte 0x00FFFFFF
_081C24E4:
	movs r0, #5
	bl PutWindowTilemap
_081C24EA:
	movs r4, #0
	ldr r5, _081C2514
_081C24EE:
	ldr r0, [r5]
	ldr r1, _081C2518
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _081C24EE
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C2514: .4byte 0x0203CBE8
_081C2518: .4byte 0x000040CB
	thumb_func_end CreatePageWindowTilemaps

	thumb_func_start ClearPageWindowTilemaps
ClearPageWindowTilemaps: @ 0x081C251C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	beq _081C2576
	cmp r0, #1
	bgt _081C2532
	cmp r0, #0
	beq _081C253C
	b _081C2602
_081C2532:
	cmp r1, #2
	beq _081C258A
	cmp r1, #3
	beq _081C25C8
	b _081C2602
_081C253C:
	movs r0, #4
	bl ClearWindowTilemap
	bl InBattleFactory
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C255A
	bl InSlateportBattleTent
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C2562
_081C255A:
	movs r0, #8
	bl ClearWindowTilemap
	b _081C256E
_081C2562:
	movs r0, #7
	bl ClearWindowTilemap
	movs r0, #0x10
	bl ClearWindowTilemap
_081C256E:
	movs r0, #9
	bl ClearWindowTilemap
	b _081C2602
_081C2576:
	movs r0, #0xa
	bl ClearWindowTilemap
	movs r0, #0xb
	bl ClearWindowTilemap
	movs r0, #0xc
	bl ClearWindowTilemap
	b _081C2602
_081C258A:
	ldr r0, _081C25B4
	ldr r1, [r0]
	ldr r2, _081C25B8
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C25C0
	adds r2, #8
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r1, _081C25BC
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	cmp r0, r1
	beq _081C2602
	movs r0, #0xe
	bl ClearWindowTilemap
	b _081C2602
	.align 2, 0
_081C25B4: .4byte 0x0203CBE8
_081C25B8: .4byte 0x000040BC
_081C25BC: .4byte 0x00FFFFFF
_081C25C0:
	movs r0, #5
	bl ClearWindowTilemap
	b _081C2602
_081C25C8:
	ldr r0, _081C25F0
	ldr r1, [r0]
	ldr r2, _081C25F4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C25FC
	adds r2, #8
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r1, _081C25F8
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	cmp r0, r1
	beq _081C2602
	movs r0, #0xf
	bl ClearWindowTilemap
	b _081C2602
	.align 2, 0
_081C25F0: .4byte 0x0203CBE8
_081C25F4: .4byte 0x000040BC
_081C25F8: .4byte 0x00FFFFFF
_081C25FC:
	movs r0, #5
	bl ClearWindowTilemap
_081C2602:
	movs r4, #0
_081C2604:
	adds r0, r4, #0
	bl SummaryScreen_RemoveWindowByIndex
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _081C2604
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ClearPageWindowTilemaps

	thumb_func_start AddWindowFromTemplateList
AddWindowFromTemplateList: @ 0x081C2620
	push {r4, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r0, _081C2654
	ldr r4, _081C2658
	adds r1, r2, r4
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _081C264A
	lsls r0, r2, #3
	adds r0, r3, r0
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl FillWindowPixelBuffer
_081C264A:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081C2654: .4byte 0x0203CBE8
_081C2658: .4byte 0x000040CB
	thumb_func_end AddWindowFromTemplateList

	thumb_func_start SummaryScreen_RemoveWindowByIndex
SummaryScreen_RemoveWindowByIndex: @ 0x081C265C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C2688
	ldr r2, _081C268C
	adds r0, r0, r2
	ldr r1, [r1]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _081C2680
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #0xff
	strb r0, [r4]
_081C2680:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2688: .4byte 0x0203CBE8
_081C268C: .4byte 0x000040CB
	thumb_func_end SummaryScreen_RemoveWindowByIndex

	thumb_func_start PrintPageSpecificText
PrintPageSpecificText: @ 0x081C2690
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
_081C2698:
	ldr r0, _081C26CC
	ldr r0, [r0]
	ldr r1, _081C26D0
	adds r0, r0, r1
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081C26AE
	movs r1, #0
	bl FillWindowPixelBuffer
_081C26AE:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #7
	bls _081C2698
	ldr r0, _081C26D4
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	thumb_func_end PrintPageSpecificText

	thumb_func_start SummaryScreen_MainCB2
SummaryScreen_MainCB2: @ 0x081C26C4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C26CC: .4byte 0x0203CBE8
_081C26D0: .4byte 0x000040CB
_081C26D4: .4byte 0x085ED2A4
	thumb_func_end SummaryScreen_MainCB2

	thumb_func_start CreateTextPrinterTask
CreateTextPrinterTask: @ 0x081C26D8
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _081C26F0
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x10
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081C26F0: .4byte 0x085ED2B4
	thumb_func_end CreateTextPrinterTask

	thumb_func_start PrintInfoPageText
PrintInfoPageText: @ 0x081C26F4
	push {lr}
	ldr r0, _081C2714
	ldr r0, [r0]
	adds r0, #0x74
	ldrb r0, [r0]
	cmp r0, #0
	beq _081C2718
	bl PrintLeftColumnStats
	bl PrintRightColumnStats
	bl PrintEggState
	bl PrintEggMemo
	b _081C2730
	.align 2, 0
_081C2714: .4byte 0x0203CBE8
_081C2718:
	bl PrintMonOTID
	bl PrintEggOTID
	bl PrintMonAbilityDescription
	bl PrintMonAbilityName
	bl BufferMonTrainerMemo
	bl PrintMonTrainerMemo
_081C2730:
	pop {r0}
	bx r0
	thumb_func_end PrintInfoPageText

	thumb_func_start Task_PrintInfoPage
Task_PrintInfoPage: @ 0x081C2734
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081C275C
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bhi _081C27AC
	lsls r0, r0, #2
	ldr r1, _081C2760
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C275C: .4byte 0x03005B68
_081C2760: .4byte 0x081C2764
_081C2764: @ jump table
	.4byte _081C2780 @ case 0
	.4byte _081C2786 @ case 1
	.4byte _081C278C @ case 2
	.4byte _081C2792 @ case 3
	.4byte _081C2798 @ case 4
	.4byte _081C279E @ case 5
	.4byte _081C27A4 @ case 6
_081C2780:
	bl PrintMonOTID
	b _081C27AC
_081C2786:
	bl PrintEggOTID
	b _081C27AC
_081C278C:
	bl PrintMonAbilityDescription
	b _081C27AC
_081C2792:
	bl PrintMonAbilityName
	b _081C27AC
_081C2798:
	bl BufferMonTrainerMemo
	b _081C27AC
_081C279E:
	bl PrintMonTrainerMemo
	b _081C27AC
_081C27A4:
	adds r0, r2, #0
	bl DestroyTask
	b _081C27B2
_081C27AC:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_081C27B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_PrintInfoPage

	thumb_func_start PrintMonOTID
PrintMonOTID: @ 0x081C27B8
	push {lr}
	sub sp, #8
	bl InBattleFactory
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C2822
	bl InSlateportBattleTent
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C2822
	ldr r0, _081C2804
	movs r1, #0
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _081C2808
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0xa2
	ldrb r2, [r2]
	cmp r2, #0
	bne _081C280C
	adds r1, r0, #0
	adds r1, #0xa6
	str r2, [sp]
	movs r0, #5
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	b _081C2822
	.align 2, 0
_081C2804: .4byte 0x085ED114
_081C2808: .4byte 0x0203CBE8
_081C280C:
	adds r1, r0, #0
	adds r1, #0xa6
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
_081C2822:
	add sp, #8
	pop {r0}
	bx r0
	thumb_func_end PrintMonOTID

	thumb_func_start PrintEggOTID
PrintEggOTID: @ 0x081C2828
	push {r4, lr}
	sub sp, #8
	bl InBattleFactory
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C2876
	bl InSlateportBattleTent
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C2876
	ldr r4, _081C2880
	ldr r0, _081C2884
	ldr r0, [r0]
	adds r0, #0xb8
	ldrh r1, [r0]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #5
	bl ConvertIntToDecimalStringN
	ldr r0, _081C2888
	movs r1, #1
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
_081C2876:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2880: .4byte 0x02021C40
_081C2884: .4byte 0x0203CBE8
_081C2888: .4byte 0x085ED114
	thumb_func_end PrintEggOTID

	thumb_func_start PrintMonAbilityDescription
PrintMonAbilityDescription: @ 0x081C288C
	push {r4, lr}
	sub sp, #8
	ldr r0, _081C28D4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r1, #0x78
	ldrb r1, [r1]
	bl GetAbilityBySpecies
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081C28D8
	movs r1, #2
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #3
	ldr r1, _081C28DC
	adds r4, r4, r1
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C28D4: .4byte 0x0203CBE8
_081C28D8: .4byte 0x085ED114
_081C28DC: .4byte 0x082EBDC4
	thumb_func_end PrintMonAbilityDescription

	thumb_func_start PrintMonAbilityName
PrintMonAbilityName: @ 0x081C28E0
	push {r4, lr}
	sub sp, #8
	ldr r0, _081C2928
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r1, #0x78
	ldrb r1, [r1]
	bl GetAbilityBySpecies
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081C292C
	movs r1, #2
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #2
	subs r1, r1, r4
	ldr r2, _081C2930
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	movs r3, #0x12
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2928: .4byte 0x0203CBE8
_081C292C: .4byte 0x085ED114
_081C2930: .4byte 0x082EC034
	thumb_func_end PrintMonAbilityName

	thumb_func_start BufferMonTrainerMemo
BufferMonTrainerMemo: @ 0x081C2934
	push {r4, r5, r6, lr}
	ldr r0, _081C2984
	ldr r0, [r0]
	adds r4, r0, #0
	adds r4, #0x70
	bl DynamicPlaceholderTextUtil_Reset
	ldr r1, _081C2988
	movs r0, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, _081C298C
	movs r0, #1
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	bl BufferNatureString
	bl InBattleFactory
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C297A
	bl InSlateportBattleTent
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C297A
	bl IsInGamePartnerMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C2998
_081C297A:
	ldr r0, _081C2990
	ldr r1, _081C2994
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _081C2A3A
	.align 2, 0
_081C2984: .4byte 0x0203CBE8
_081C2988: .4byte 0x085ED2C4
_081C298C: .4byte 0x085ED2CB
_081C2990: .4byte 0x02021C7C
_081C2994: .4byte 0x085CA563
_081C2998:
	movs r0, #0x20
	bl Alloc
	adds r6, r0, #0
	movs r0, #0x20
	bl Alloc
	adds r5, r0, #0
	adds r0, r6, #0
	bl GetMetLevelString
	ldrb r0, [r4, #9]
	cmp r0, #0xd4
	bhi _081C29C4
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_0812461C
	movs r0, #4
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
_081C29C4:
	bl DoesMonOTMatchOwner
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C2A00
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _081C29EC
	ldrb r0, [r4, #9]
	ldr r1, _081C29E4
	cmp r0, #0xd4
	bls _081C2A28
	ldr r1, _081C29E8
	b _081C2A28
	.align 2, 0
_081C29E4: .4byte 0x085CA4CC
_081C29E8: .4byte 0x085CA593
_081C29EC:
	ldrb r0, [r4, #9]
	ldr r1, _081C29F8
	cmp r0, #0xd4
	bls _081C2A28
	ldr r1, _081C29FC
	b _081C2A28
	.align 2, 0
_081C29F8: .4byte 0x085CA4A6
_081C29FC: .4byte 0x085CA570
_081C2A00:
	ldrb r0, [r4, #9]
	cmp r0, #0xff
	bne _081C2A10
	ldr r1, _081C2A0C
	b _081C2A28
	.align 2, 0
_081C2A0C: .4byte 0x085CA512
_081C2A10:
	cmp r0, #0xfe
	beq _081C2A26
	bl DidMonComeFromGBAGames
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C2A26
	ldrb r0, [r4, #9]
	ldr r1, _081C2A40
	cmp r0, #0xd4
	bls _081C2A28
_081C2A26:
	ldr r1, _081C2A44
_081C2A28:
	ldr r0, _081C2A48
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	adds r0, r6, #0
	bl Free
	adds r0, r5, #0
	bl Free
_081C2A3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C2A40: .4byte 0x085CA53B
_081C2A44: .4byte 0x085CA4F2
_081C2A48: .4byte 0x02021C7C
	thumb_func_end BufferMonTrainerMemo

	thumb_func_start PrintMonTrainerMemo
PrintMonTrainerMemo: @ 0x081C2A4C
	push {lr}
	sub sp, #8
	ldr r0, _081C2A70
	movs r1, #3
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C2A74
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_081C2A70: .4byte 0x085ED114
_081C2A74: .4byte 0x02021C7C
	thumb_func_end PrintMonTrainerMemo

	thumb_func_start BufferNatureString
BufferNatureString: @ 0x081C2A78
	push {r4, lr}
	ldr r0, _081C2AA4
	ldr r4, [r0]
	ldr r1, _081C2AA8
	adds r4, #0xa3
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #2
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldrb r0, [r4]
	cmp r0, #5
	beq _081C2A9A
	cmp r0, #0x15
	bne _081C2AB0
_081C2A9A:
	ldr r1, _081C2AAC
	movs r0, #5
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	b _081C2AB8
	.align 2, 0
_081C2AA4: .4byte 0x0203CBE8
_081C2AA8: .4byte 0x085ECE24
_081C2AAC: .4byte 0x085CA3D9
_081C2AB0:
	ldr r1, _081C2AC0
	movs r0, #5
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
_081C2AB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2AC0: .4byte 0x085CA3D8
	thumb_func_end BufferNatureString

	thumb_func_start GetMetLevelString
GetMetLevelString: @ 0x081C2AC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081C2AF0
	ldr r0, [r0]
	adds r0, #0x7a
	ldrb r1, [r0]
	cmp r1, #0
	bne _081C2AD6
	movs r1, #5
_081C2AD6:
	adds r0, r4, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	movs r0, #3
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2AF0: .4byte 0x0203CBE8
	thumb_func_end GetMetLevelString

	thumb_func_start DoesMonOTMatchOwner
DoesMonOTMatchOwner: @ 0x081C2AF4
	push {r4, r5, r6, lr}
	ldr r0, _081C2B30
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0x70
	ldr r1, [r0]
	ldr r0, _081C2B34
	cmp r1, r0
	bne _081C2B40
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081C2B38
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r4, [r0]
	adds r0, r1, r2
	ldrb r5, [r0, #0x13]
	ldr r0, _081C2B3C
	adds r2, #8
	adds r1, r1, r2
	bl StringCopy
	b _081C2B56
	.align 2, 0
_081C2B30: .4byte 0x0203CBE8
_081C2B34: .4byte 0x020243E8
_081C2B38: .4byte 0x020226A0
_081C2B3C: .4byte 0x02021C40
_081C2B40:
	bl GetPlayerIDAsU32
	adds r4, r0, #0
	ldr r0, _081C2B6C
	ands r4, r0
	ldr r0, _081C2B70
	ldr r1, [r0]
	ldrb r5, [r1, #8]
	ldr r0, _081C2B74
	bl StringCopy
_081C2B56:
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r5, r0
	bne _081C2BA6
	ldr r0, [r6, #0x48]
	ldr r1, _081C2B6C
	ands r0, r1
	cmp r4, r0
	beq _081C2B7C
	b _081C2BA6
	.align 2, 0
_081C2B6C: .4byte 0x0000FFFF
_081C2B70: .4byte 0x03005AF0
_081C2B74: .4byte 0x02021C40
_081C2B78:
	movs r0, #1
	b _081C2BA8
_081C2B7C:
	movs r2, #0
	ldr r4, _081C2BB0
	adds r3, r6, #0
	adds r3, #0x36
_081C2B84:
	adds r0, r2, r4
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _081C2B94
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _081C2B78
_081C2B94:
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _081C2BA6
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _081C2B84
_081C2BA6:
	movs r0, #0
_081C2BA8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081C2BB0: .4byte 0x02021C40
	thumb_func_end DoesMonOTMatchOwner

	thumb_func_start DidMonComeFromGBAGames
DidMonComeFromGBAGames: @ 0x081C2BB4
	push {lr}
	ldr r0, _081C2BCC
	ldr r0, [r0]
	adds r0, #0x70
	ldrb r0, [r0, #0xb]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _081C2BD0
	movs r0, #0
	b _081C2BD2
	.align 2, 0
_081C2BCC: .4byte 0x0203CBE8
_081C2BD0:
	movs r0, #1
_081C2BD2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DidMonComeFromGBAGames

	thumb_func_start DidMonComeFromRSE
DidMonComeFromRSE: @ 0x081C2BD8
	push {lr}
	ldr r0, _081C2BF0
	ldr r0, [r0]
	adds r0, #0x70
	ldrb r0, [r0, #0xb]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _081C2BF4
	movs r0, #0
	b _081C2BF6
	.align 2, 0
_081C2BF0: .4byte 0x0203CBE8
_081C2BF4:
	movs r0, #1
_081C2BF6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DidMonComeFromRSE

	thumb_func_start IsInGamePartnerMon
IsInGamePartnerMon: @ 0x081C2BFC
	push {lr}
	ldr r0, _081C2C38
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _081C2C4C
	ldr r0, _081C2C3C
	ldr r1, _081C2C40
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C2C4C
	ldr r0, _081C2C44
	ldr r0, [r0]
	ldr r1, _081C2C48
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _081C2C32
	cmp r0, #4
	beq _081C2C32
	cmp r0, #5
	bne _081C2C4C
_081C2C32:
	movs r0, #1
	b _081C2C4E
	.align 2, 0
_081C2C38: .4byte 0x02022C90
_081C2C3C: .4byte 0x03002360
_081C2C40: .4byte 0x00000439
_081C2C44: .4byte 0x0203CBE8
_081C2C48: .4byte 0x000040BE
_081C2C4C:
	movs r0, #0
_081C2C4E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsInGamePartnerMon

	thumb_func_start PrintLeftColumnStats
PrintLeftColumnStats: @ 0x081C2C54
	push {lr}
	sub sp, #8
	ldr r0, _081C2C7C
	movs r1, #0
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C2C80
	movs r2, #0
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_081C2C7C: .4byte 0x085ED114
_081C2C80: .4byte 0x085C93F9
	thumb_func_end PrintLeftColumnStats

	thumb_func_start PrintRightColumnStats
PrintRightColumnStats: @ 0x081C2C84
	push {lr}
	sub sp, #8
	ldr r0, _081C2CAC
	movs r1, #1
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C2CB0
	movs r2, #0
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_081C2CAC: .4byte 0x085ED114
_081C2CB0: .4byte 0x085C93F9
	thumb_func_end PrintRightColumnStats

	thumb_func_start PrintEggState
PrintEggState: @ 0x081C2CB4
	push {r4, lr}
	sub sp, #8
	ldr r0, _081C2CCC
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x70
	adds r0, #0xa5
	ldrb r0, [r0]
	cmp r0, #1
	bne _081C2CD4
	ldr r4, _081C2CD0
	b _081C2CF8
	.align 2, 0
_081C2CCC: .4byte 0x0203CBE8
_081C2CD0: .4byte 0x085CA40C
_081C2CD4:
	ldrh r0, [r1, #0x30]
	cmp r0, #5
	bhi _081C2CE4
	ldr r4, _081C2CE0
	b _081C2CF8
	.align 2, 0
_081C2CE0: .4byte 0x085CA46B
_081C2CE4:
	cmp r0, #0xa
	bhi _081C2CF0
	ldr r4, _081C2CEC
	b _081C2CF8
	.align 2, 0
_081C2CEC: .4byte 0x085CA448
_081C2CF0:
	ldr r4, _081C2D1C
	cmp r0, #0x28
	bhi _081C2CF8
	ldr r4, _081C2D20
_081C2CF8:
	ldr r0, _081C2D24
	movs r1, #2
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2D1C: .4byte 0x085CA40C
_081C2D20: .4byte 0x085CA425
_081C2D24: .4byte 0x085ED114
	thumb_func_end PrintEggState

	thumb_func_start PrintEggMemo
PrintEggMemo: @ 0x081C2D28
	push {r4, lr}
	sub sp, #8
	ldr r0, _081C2D48
	ldr r0, [r0]
	adds r4, r0, #0
	adds r4, #0x70
	adds r0, #0xa5
	ldrb r0, [r0]
	cmp r0, #1
	beq _081C2D8C
	ldrb r0, [r4, #9]
	cmp r0, #0xff
	bne _081C2D50
	ldr r4, _081C2D4C
	b _081C2D8E
	.align 2, 0
_081C2D48: .4byte 0x0203CBE8
_081C2D4C: .4byte 0x085CA5D5
_081C2D50:
	bl DidMonComeFromGBAGames
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C2D64
	bl DoesMonOTMatchOwner
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C2D6C
_081C2D64:
	ldr r4, _081C2D68
	b _081C2D8E
	.align 2, 0
_081C2D68: .4byte 0x085CA5F8
_081C2D6C:
	ldrb r0, [r4, #9]
	cmp r0, #0xfd
	bne _081C2D8C
	bl DidMonComeFromRSE
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _081C2D84
	cmp r0, #1
	bne _081C2D8E
	ldr r4, _081C2D88
	b _081C2D8E
	.align 2, 0
_081C2D84: .4byte 0x085CA635
_081C2D88: .4byte 0x085CA616
_081C2D8C:
	ldr r4, _081C2DB4
_081C2D8E:
	ldr r0, _081C2DB8
	movs r1, #3
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2DB4: .4byte 0x085CA5B6
_081C2DB8: .4byte 0x085ED114
	thumb_func_end PrintEggMemo

	thumb_func_start PrintSkillsPageText
PrintSkillsPageText: @ 0x081C2DBC
	push {lr}
	bl PrintHeldItemName
	bl PrintRibbonCount
	bl BufferLeftColumnStats
	bl sub_081C303C
	bl BufferRightColumnStats
	bl ShowPokemonSummaryScreenSet40EF
	bl PrintExpPointsNextLevel
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PrintSkillsPageText

	thumb_func_start Task_PrintSkillsPage
Task_PrintSkillsPage: @ 0x081C2DE0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081C2E08
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bhi _081C2E62
	lsls r0, r0, #2
	ldr r1, _081C2E0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C2E08: .4byte 0x03005B68
_081C2E0C: .4byte 0x081C2E10
_081C2E10: @ jump table
	.4byte _081C2E30 @ case 0
	.4byte _081C2E36 @ case 1
	.4byte _081C2E3C @ case 2
	.4byte _081C2E42 @ case 3
	.4byte _081C2E48 @ case 4
	.4byte _081C2E4E @ case 5
	.4byte _081C2E54 @ case 6
	.4byte _081C2E5A @ case 7
_081C2E30:
	bl PrintHeldItemName
	b _081C2E62
_081C2E36:
	bl PrintRibbonCount
	b _081C2E62
_081C2E3C:
	bl BufferLeftColumnStats
	b _081C2E62
_081C2E42:
	bl sub_081C303C
	b _081C2E62
_081C2E48:
	bl BufferRightColumnStats
	b _081C2E62
_081C2E4E:
	bl ShowPokemonSummaryScreenSet40EF
	b _081C2E62
_081C2E54:
	bl PrintExpPointsNextLevel
	b _081C2E62
_081C2E5A:
	adds r0, r2, #0
	bl DestroyTask
	b _081C2E68
_081C2E62:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_081C2E68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_PrintSkillsPage

	thumb_func_start PrintHeldItemName
PrintHeldItemName: @ 0x081C2E70
	push {r4, lr}
	sub sp, #8
	ldr r4, _081C2EAC
	ldr r0, [r4]
	adds r0, #0x9e
	ldrh r0, [r0]
	cmp r0, #0xaf
	bne _081C2EB4
	bl IsMultiBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C2EB4
	ldr r0, [r4]
	ldr r1, _081C2EB0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _081C2EA0
	cmp r0, #4
	beq _081C2EA0
	cmp r0, #5
	bne _081C2EB4
_081C2EA0:
	movs r0, #0xaf
	bl ItemId_GetName
	adds r4, r0, #0
	b _081C2EDA
	.align 2, 0
_081C2EAC: .4byte 0x0203CBE8
_081C2EB0: .4byte 0x000040BE
_081C2EB4:
	ldr r0, _081C2EC8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x9e
	ldrh r0, [r1]
	cmp r0, #0
	bne _081C2ED0
	ldr r4, _081C2ECC
	b _081C2EDA
	.align 2, 0
_081C2EC8: .4byte 0x0203CBE8
_081C2ECC: .4byte 0x085C93ED
_081C2ED0:
	ldrh r0, [r1]
	ldr r4, _081C2F00
	adds r1, r4, #0
	bl CopyItemName
_081C2EDA:
	ldr r0, _081C2F04
	movs r1, #0
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2F00: .4byte 0x02021C40
_081C2F04: .4byte 0x085ED134
	thumb_func_end PrintHeldItemName

	thumb_func_start PrintRibbonCount
PrintRibbonCount: @ 0x081C2F08
	push {r4, lr}
	sub sp, #8
	ldr r0, _081C2F20
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x76
	ldrb r0, [r1]
	cmp r0, #0
	bne _081C2F28
	ldr r4, _081C2F24
	b _081C2F3E
	.align 2, 0
_081C2F20: .4byte 0x0203CBE8
_081C2F24: .4byte 0x085C93ED
_081C2F28:
	ldr r0, _081C2F64
	ldrb r1, [r1]
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081C2F68
	ldr r1, _081C2F6C
	adds r0, r4, #0
	bl StringExpandPlaceholders
_081C2F3E:
	ldr r0, _081C2F70
	movs r1, #1
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C2F64: .4byte 0x02021C40
_081C2F68: .4byte 0x02021C7C
_081C2F6C: .4byte 0x085CA3CF
_081C2F70: .4byte 0x085ED134
	thumb_func_end PrintRibbonCount

	thumb_func_start BufferLeftColumnStats
BufferLeftColumnStats: @ 0x081C2F74
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	movs r0, #8
	bl Alloc
	mov sb, r0
	movs r0, #8
	bl Alloc
	mov r8, r0
	movs r0, #8
	bl Alloc
	adds r6, r0, #0
	movs r0, #8
	bl Alloc
	adds r5, r0, #0
	ldr r4, _081C3030
	ldr r0, [r4]
	adds r0, #0x90
	ldrh r1, [r0]
	mov r0, sb
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	adds r0, #0x92
	ldrh r1, [r0]
	mov r0, r8
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	adds r0, #0x94
	ldrh r1, [r0]
	adds r0, r6, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	adds r0, #0x96
	ldrh r1, [r0]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, #0
	mov r1, sb
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #1
	mov r1, r8
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #2
	adds r1, r6, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #3
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, _081C3034
	ldr r1, _081C3038
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	mov r0, sb
	bl Free
	mov r0, r8
	bl Free
	adds r0, r6, #0
	bl Free
	adds r0, r5, #0
	bl Free
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C3030: .4byte 0x0203CBE8
_081C3034: .4byte 0x02021C7C
_081C3038: .4byte 0x085ED2D2
	thumb_func_end BufferLeftColumnStats

	thumb_func_start sub_081C303C
sub_081C303C: @ 0x081C303C
	push {lr}
	sub sp, #8
	ldr r0, _081C3060
	movs r1, #2
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C3064
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_081C3060: .4byte 0x085ED134
_081C3064: .4byte 0x02021C7C
	thumb_func_end sub_081C303C

	thumb_func_start BufferRightColumnStats
BufferRightColumnStats: @ 0x081C3068
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _081C30D8
	mov r8, r0
	ldr r4, _081C30DC
	ldr r0, [r4]
	adds r0, #0x98
	ldrh r1, [r0]
	mov r0, r8
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r6, _081C30E0
	ldr r0, [r4]
	adds r0, #0x9a
	ldrh r1, [r0]
	adds r0, r6, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r5, _081C30E4
	ldr r0, [r4]
	adds r0, #0x9c
	ldrh r1, [r0]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, #0
	mov r1, r8
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #1
	adds r1, r6, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #2
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, _081C30E8
	ldr r1, _081C30EC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C30D8: .4byte 0x02021C40
_081C30DC: .4byte 0x0203CBE8
_081C30E0: .4byte 0x02021C54
_081C30E4: .4byte 0x02021C68
_081C30E8: .4byte 0x02021C7C
_081C30EC: .4byte 0x085ED2DE
	thumb_func_end BufferRightColumnStats

	thumb_func_start ShowPokemonSummaryScreenSet40EF
ShowPokemonSummaryScreenSet40EF: @ 0x081C30F0
	push {lr}
	sub sp, #8
	ldr r0, _081C3114
	movs r1, #3
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C3118
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_081C3114: .4byte 0x085ED134
_081C3118: .4byte 0x02021C7C
	thumb_func_end ShowPokemonSummaryScreenSet40EF

	thumb_func_start PrintExpPointsNextLevel
PrintExpPointsNextLevel: @ 0x081C311C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _081C3194
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0x70
	ldr r0, _081C3198
	movs r1, #4
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r5, _081C319C
	ldr r1, [r6, #0x10]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #7
	bl ConvertIntToDecimalStringN
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #8
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C31A0
	str r4, [sp]
	str r4, [sp, #4]
	adds r0, r7, #0
	movs r2, #0
	movs r3, #0x12
	bl SummaryScreen_PrintTextOnWindow
	ldrb r0, [r6, #5]
	cmp r0, #0x63
	bhi _081C31AC
	ldr r4, _081C31A4
	adds r1, r0, #0
	adds r1, #1
	lsls r1, r1, #2
	ldr r3, _081C31A8
	ldrh r2, [r6]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r2, [r0, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	muls r0, r2, r0
	adds r1, r1, r0
	adds r1, r1, r4
	ldr r1, [r1]
	ldr r0, [r6, #0x10]
	subs r1, r1, r0
	b _081C31AE
	.align 2, 0
_081C3194: .4byte 0x0203CBE8
_081C3198: .4byte 0x085ED134
_081C319C: .4byte 0x02021C40
_081C31A0: .4byte 0x085CA38B
_081C31A4: .4byte 0x082F00B4
_081C31A8: .4byte 0x082F0D54
_081C31AC:
	movs r1, #0
_081C31AE:
	ldr r4, _081C31D4
	adds r0, r4, #0
	movs r2, #1
	movs r3, #6
	bl ConvertIntToDecimalStringN
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x10
	movs r3, #0x12
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C31D4: .4byte 0x02021C40
	thumb_func_end PrintExpPointsNextLevel

	thumb_func_start PrintBattleMoves
PrintBattleMoves: @ 0x081C31D8
	push {r4, lr}
	movs r0, #0
	bl PrintMoveNameAndPP
	movs r0, #1
	bl PrintMoveNameAndPP
	movs r0, #2
	bl PrintMoveNameAndPP
	movs r0, #3
	bl PrintMoveNameAndPP
	ldr r4, _081C3220
	ldr r0, [r4]
	ldr r1, _081C3224
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C323E
	bl PrintNewMoveDetailsOrCancelText
	ldr r1, [r4]
	ldr r0, _081C3228
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #4
	bne _081C3230
	ldr r0, _081C322C
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _081C323E
	bl PrintMoveDetails
	b _081C323E
	.align 2, 0
_081C3220: .4byte 0x0203CBE8
_081C3224: .4byte 0x000040BC
_081C3228: .4byte 0x000040C6
_081C322C: .4byte 0x000040C4
_081C3230:
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, #0x84
	adds r1, r1, r0
	ldrh r0, [r1]
	bl PrintMoveDetails
_081C323E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PrintBattleMoves

	thumb_func_start Task_PrintBattleMoves
Task_PrintBattleMoves: @ 0x081C3244
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081C326C
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bhi _081C3350
	lsls r0, r0, #2
	ldr r1, _081C3270
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C326C: .4byte 0x03005B68
_081C3270: .4byte 0x081C3274
_081C3274: @ jump table
	.4byte _081C3294 @ case 0
	.4byte _081C329C @ case 1
	.4byte _081C32A4 @ case 2
	.4byte _081C32AC @ case 3
	.4byte _081C32B4 @ case 4
	.4byte _081C32D0 @ case 5
	.4byte _081C3312 @ case 6
	.4byte _081C3348 @ case 7
_081C3294:
	movs r0, #0
	bl PrintMoveNameAndPP
	b _081C3350
_081C329C:
	movs r0, #1
	bl PrintMoveNameAndPP
	b _081C3350
_081C32A4:
	movs r0, #2
	bl PrintMoveNameAndPP
	b _081C3350
_081C32AC:
	movs r0, #3
	bl PrintMoveNameAndPP
	b _081C3350
_081C32B4:
	ldr r0, _081C32C8
	ldr r0, [r0]
	ldr r1, _081C32CC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C3350
	bl PrintNewMoveDetailsOrCancelText
	b _081C3350
	.align 2, 0
_081C32C8: .4byte 0x0203CBE8
_081C32CC: .4byte 0x000040BC
_081C32D0:
	ldr r0, _081C32F4
	ldr r1, [r0]
	ldr r2, _081C32F8
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C3350
	ldr r0, _081C32FC
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #4
	bne _081C3304
	ldr r2, _081C3300
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r4, #2]
	b _081C3350
	.align 2, 0
_081C32F4: .4byte 0x0203CBE8
_081C32F8: .4byte 0x000040BC
_081C32FC: .4byte 0x000040C6
_081C3300: .4byte 0x000040C4
_081C3304:
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, #0x84
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r4, #2]
	b _081C3350
_081C3312:
	ldr r0, _081C333C
	ldr r1, [r0]
	ldr r2, _081C3340
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C3350
	adds r2, #8
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r1, _081C3344
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	cmp r0, r1
	beq _081C3350
	ldrh r0, [r4, #2]
	bl PrintMoveDetails
	b _081C3350
	.align 2, 0
_081C333C: .4byte 0x0203CBE8
_081C3340: .4byte 0x000040BC
_081C3344: .4byte 0x00FFFFFF
_081C3348:
	adds r0, r2, #0
	bl DestroyTask
	b _081C3356
_081C3350:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_081C3356:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_PrintBattleMoves

	thumb_func_start PrintMoveNameAndPP
PrintMoveNameAndPP: @ 0x081C335C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _081C3438
	ldr r0, [r0]
	mov r8, r0
	ldr r4, _081C343C
	adds r0, r4, #0
	movs r1, #0
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, r4, #0
	movs r1, #1
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r7, #1
	mov r0, r8
	adds r0, #0x84
	adds r0, r0, r1
	ldrh r5, [r0]
	cmp r5, #0
	beq _081C3454
	mov r0, r8
	adds r0, #0xa4
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r2, r7, #0
	bl CalculatePPWithBonus
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r1, r5, #3
	ldr r0, _081C3440
	adds r1, r1, r0
	lsls r4, r7, #4
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sb
	movs r2, #0
	adds r3, r4, #0
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C3444
	mov sb, r1
	mov r5, r8
	adds r5, #0x8c
	adds r5, r5, r7
	ldrb r1, [r5]
	mov r0, sb
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _081C3448
	mov r8, r0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, #0
	mov r1, sb
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #1
	mov r1, r8
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, _081C344C
	mov r8, r1
	ldr r1, _081C3450
	mov r0, r8
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldrb r0, [r5]
	adds r1, r6, #0
	bl GetCurrentPpToMaxPpState
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, sl
	mov r1, r8
	movs r2, #0
	adds r3, r4, #0
	bl SummaryScreen_PrintTextOnWindow
	b _081C3480
	.align 2, 0
_081C3438: .4byte 0x0203CBE8
_081C343C: .4byte 0x085ED15C
_081C3440: .4byte 0x082EACC4
_081C3444: .4byte 0x02021C40
_081C3448: .4byte 0x02021C54
_081C344C: .4byte 0x02021C7C
_081C3450: .4byte 0x085ED2E7
_081C3454:
	ldr r1, _081C3490
	lsls r4, r7, #4
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r5, [sp]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sb
	movs r2, #0
	adds r3, r4, #0
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C3494
	str r5, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	mov r0, sl
	movs r2, #8
	adds r3, r4, #0
	bl SummaryScreen_PrintTextOnWindow
_081C3480:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C3490: .4byte 0x085C9401
_081C3494: .4byte 0x085C9403
	thumb_func_end PrintMoveNameAndPP

	thumb_func_start PrintMovePowerAndAccuracy
PrintMovePowerAndAccuracy: @ 0x081C3498
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _081C3538
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0x28
	movs r3, #0
	bl FillWindowPixelRect
	ldr r2, _081C34D0
	lsls r1, r5, #1
	adds r0, r1, r5
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2, #1]
	adds r6, r1, #0
	cmp r0, #1
	bhi _081C34D8
	ldr r1, _081C34D4
	b _081C34E8
	.align 2, 0
_081C34D0: .4byte 0x082ED220
_081C34D4: .4byte 0x085C9406
_081C34D8:
	ldr r4, _081C350C
	ldrb r1, [r2, #1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r1, r4, #0
_081C34E8:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xe
	movs r2, #0x28
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	ldr r1, _081C3510
	adds r0, r6, r5
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _081C3518
	ldr r1, _081C3514
	b _081C3528
	.align 2, 0
_081C350C: .4byte 0x02021C40
_081C3510: .4byte 0x082ED220
_081C3514: .4byte 0x085C9406
_081C3518:
	ldr r4, _081C3540
	ldrb r1, [r1, #3]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r1, r4, #0
_081C3528:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xe
	movs r2, #0x28
	movs r3, #0x12
	bl SummaryScreen_PrintTextOnWindow
_081C3538:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C3540: .4byte 0x02021C40
	thumb_func_end PrintMovePowerAndAccuracy

	thumb_func_start PrintContestMoves
PrintContestMoves: @ 0x081C3544
	push {r4, lr}
	movs r0, #0
	bl PrintMoveNameAndPP
	movs r0, #1
	bl PrintMoveNameAndPP
	movs r0, #2
	bl PrintMoveNameAndPP
	movs r0, #3
	bl PrintMoveNameAndPP
	ldr r4, _081C3584
	ldr r0, [r4]
	ldr r1, _081C3588
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C357C
	bl PrintNewMoveDetailsOrCancelText
	ldr r0, [r4]
	ldr r1, _081C358C
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PrintContestMoveDescription
_081C357C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C3584: .4byte 0x0203CBE8
_081C3588: .4byte 0x000040BC
_081C358C: .4byte 0x000040C6
	thumb_func_end PrintContestMoves

	thumb_func_start Task_PrintContestMoves
Task_PrintContestMoves: @ 0x081C3590
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081C35B8
	adds r4, r0, r1
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bhi _081C365C
	lsls r0, r0, #2
	ldr r1, _081C35BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C35B8: .4byte 0x03005B68
_081C35BC: .4byte 0x081C35C0
_081C35C0: @ jump table
	.4byte _081C35DC @ case 0
	.4byte _081C35E4 @ case 1
	.4byte _081C35EC @ case 2
	.4byte _081C35F4 @ case 3
	.4byte _081C35FC @ case 4
	.4byte _081C3618 @ case 5
	.4byte _081C3654 @ case 6
_081C35DC:
	movs r0, #0
	bl PrintMoveNameAndPP
	b _081C365C
_081C35E4:
	movs r0, #1
	bl PrintMoveNameAndPP
	b _081C365C
_081C35EC:
	movs r0, #2
	bl PrintMoveNameAndPP
	b _081C365C
_081C35F4:
	movs r0, #3
	bl PrintMoveNameAndPP
	b _081C365C
_081C35FC:
	ldr r0, _081C3610
	ldr r0, [r0]
	ldr r1, _081C3614
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C365C
	bl PrintNewMoveDetailsOrCancelText
	b _081C365C
	.align 2, 0
_081C3610: .4byte 0x0203CBE8
_081C3614: .4byte 0x000040BC
_081C3618:
	ldr r0, _081C3644
	ldr r2, [r0]
	ldr r1, _081C3648
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _081C365C
	adds r1, #8
	adds r0, r2, r1
	ldr r0, [r0]
	ldr r1, _081C364C
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	cmp r0, r1
	beq _081C365C
	ldr r1, _081C3650
	adds r0, r2, r1
	ldrb r0, [r0]
	bl PrintContestMoveDescription
	b _081C365C
	.align 2, 0
_081C3644: .4byte 0x0203CBE8
_081C3648: .4byte 0x000040BC
_081C364C: .4byte 0x00FFFFFF
_081C3650: .4byte 0x000040C6
_081C3654:
	adds r0, r2, #0
	bl DestroyTask
	b _081C3662
_081C365C:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_081C3662:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_PrintContestMoves

	thumb_func_start PrintContestMoveDescription
PrintContestMoveDescription: @ 0x081C3668
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bne _081C3684
	ldr r0, _081C367C
	ldr r0, [r0]
	ldr r1, _081C3680
	b _081C368C
	.align 2, 0
_081C367C: .4byte 0x0203CBE8
_081C3680: .4byte 0x000040C4
_081C3684:
	ldr r0, _081C36C4
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r0, #0x84
_081C368C:
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	beq _081C36BC
	ldr r0, _081C36C8
	movs r1, #2
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _081C36CC
	ldr r2, _081C36D0
	lsls r1, r4, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
_081C36BC:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C36C4: .4byte 0x0203CBE8
_081C36C8: .4byte 0x085ED15C
_081C36CC: .4byte 0x08560BB4
_081C36D0: .4byte 0x08565FCC
	thumb_func_end PrintContestMoveDescription

	thumb_func_start PrintMoveDetails
PrintMoveDetails: @ 0x081C36D4
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r6, r4, #0
	ldr r0, _081C3728
	movs r1, #2
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #0
	beq _081C3768
	ldr r0, _081C372C
	ldr r0, [r0]
	ldr r1, _081C3730
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _081C3738
	adds r0, r4, #0
	bl PrintMovePowerAndAccuracy
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	ldr r0, _081C3734
	adds r1, r1, r0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	b _081C3758
	.align 2, 0
_081C3728: .4byte 0x085ED15C
_081C372C: .4byte 0x0203CBE8
_081C3730: .4byte 0x000040C0
_081C3734: .4byte 0x085E7FFC
_081C3738:
	ldr r2, _081C3760
	ldr r1, _081C3764
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
_081C3758:
	adds r0, r5, #0
	bl PutWindowTilemap
	b _081C376E
	.align 2, 0
_081C3760: .4byte 0x08560BB4
_081C3764: .4byte 0x08565FCC
_081C3768:
	adds r0, r5, #0
	bl ClearWindowTilemap
_081C376E:
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end PrintMoveDetails

	thumb_func_start PrintNewMoveDetailsOrCancelText
PrintNewMoveDetailsOrCancelText: @ 0x081C377C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, _081C37C4
	adds r0, r4, #0
	movs r1, #0
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r7, r6, #0
	adds r0, r4, #0
	movs r1, #1
	bl AddWindowFromTemplateList
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _081C37C8
	ldr r1, [r0]
	ldr r2, _081C37CC
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r2, #0
	bne _081C37D4
	ldr r1, _081C37D0
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0x42
	bl SummaryScreen_PrintTextOnWindow
	b _081C3866
	.align 2, 0
_081C37C4: .4byte 0x085ED15C
_081C37C8: .4byte 0x0203CBE8
_081C37CC: .4byte 0x000040C4
_081C37D0: .4byte 0x085C93C4
_081C37D4:
	ldrh r5, [r0]
	ldr r2, _081C37FC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _081C3804
	lsls r1, r5, #3
	ldr r0, _081C3800
	adds r1, r1, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0x42
	bl SummaryScreen_PrintTextOnWindow
	b _081C381C
	.align 2, 0
_081C37FC: .4byte 0x000040C0
_081C3800: .4byte 0x082EACC4
_081C3804:
	lsls r1, r5, #3
	ldr r0, _081C3874
	adds r1, r1, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	adds r0, r7, #0
	movs r2, #0
	movs r3, #0x42
	bl SummaryScreen_PrintTextOnWindow
_081C381C:
	ldr r4, _081C3878
	ldr r1, _081C387C
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, #0
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #1
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r4, _081C3880
	ldr r1, _081C3884
	adds r0, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x42
	bl SummaryScreen_PrintTextOnWindow
_081C3866:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C3874: .4byte 0x082EACC4
_081C3878: .4byte 0x02021C40
_081C387C: .4byte 0x082ED220
_081C3880: .4byte 0x02021C7C
_081C3884: .4byte 0x085ED2E7
	thumb_func_end PrintNewMoveDetailsOrCancelText

	thumb_func_start sub_081C3888
sub_081C3888: @ 0x081C3888
	push {r4, lr}
	sub sp, #8
	ldr r0, _081C38C0
	movs r1, #0
	bl AddWindowFromTemplateList
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x38
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0x42
	bl FillWindowPixelRect
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C38C0: .4byte 0x085ED15C
	thumb_func_end sub_081C3888

	thumb_func_start PrintEggOTName
PrintEggOTName: @ 0x081C38C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r5, _081C3974
	adds r0, r5, #0
	movs r1, #0
	bl AddWindowFromTemplateList
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #1
	bl AddWindowFromTemplateList
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, sb
	lsls r6, r0, #4
	movs r0, #0x38
	mov r8, r0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	adds r3, r6, #0
	bl FillWindowPixelRect
	mov r0, sl
	lsls r7, r0, #4
	mov r0, r8
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	adds r3, r7, #0
	bl FillWindowPixelRect
	movs r4, #0x30
	str r4, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	adds r3, r6, #0
	bl FillWindowPixelRect
	str r4, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	adds r3, r7, #0
	bl FillWindowPixelRect
	mov r0, sb
	bl PrintMoveNameAndPP
	mov r0, sl
	bl PrintMoveNameAndPP
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C3974: .4byte 0x085ED15C
	thumb_func_end PrintEggOTName

	thumb_func_start PrintHMMovesCantBeForgotten
PrintHMMovesCantBeForgotten: @ 0x081C3978
	push {r4, lr}
	sub sp, #8
	ldr r0, _081C39AC
	movs r1, #2
	bl AddWindowFromTemplateList
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _081C39B0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl SummaryScreen_PrintTextOnWindow
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C39AC: .4byte 0x085ED15C
_081C39B0: .4byte 0x085CA487
	thumb_func_end PrintHMMovesCantBeForgotten

	thumb_func_start ResetSpriteIds
ResetSpriteIds: @ 0x081C39B4
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _081C39DC
	ldr r4, _081C39E0
	movs r3, #0xff
_081C39BE:
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, r0, r2
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1b
	bls _081C39BE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C39DC: .4byte 0x0203CBE8
_081C39E0: .4byte 0x000040D3
	thumb_func_end ResetSpriteIds

	thumb_func_start DestroySpriteInArray
DestroySpriteInArray: @ 0x081C39E4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _081C3A1C
	ldr r0, [r5]
	ldr r1, _081C3A20
	adds r0, r0, r1
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081C3A16
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081C3A24
	adds r0, r0, r1
	bl DestroySprite
	ldr r0, [r5]
	ldr r1, _081C3A20
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
_081C3A16:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C3A1C: .4byte 0x0203CBE8
_081C3A20: .4byte 0x000040D3
_081C3A24: .4byte 0x020205AC
	thumb_func_end DestroySpriteInArray

	thumb_func_start SetSpriteInvisibility
SetSpriteInvisibility: @ 0x081C3A28
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _081C3A64
	ldr r2, _081C3A68
	ldr r2, [r2]
	ldr r4, _081C3A6C
	adds r2, r2, r4
	adds r2, r2, r0
	ldrb r0, [r2]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	adds r2, #0x3e
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C3A64: .4byte 0x020205AC
_081C3A68: .4byte 0x0203CBE8
_081C3A6C: .4byte 0x000040D3
	thumb_func_end SetSpriteInvisibility

	thumb_func_start HidePageSpecificSprites
HidePageSpecificSprites: @ 0x081C3A70
	push {r4, lr}
	movs r4, #3
_081C3A74:
	ldr r0, _081C3A9C
	ldr r0, [r0]
	ldr r1, _081C3AA0
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _081C3A8C
	adds r0, r4, #0
	movs r1, #1
	bl SetSpriteInvisibility
_081C3A8C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1b
	bls _081C3A74
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C3A9C: .4byte 0x0203CBE8
_081C3AA0: .4byte 0x000040D3
	thumb_func_end HidePageSpecificSprites

	thumb_func_start SetTypeIcons
SetTypeIcons: @ 0x081C3AA4
	push {lr}
	ldr r0, _081C3AC0
	ldr r0, [r0]
	ldr r1, _081C3AC4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	beq _081C3AD4
	cmp r0, #2
	bgt _081C3AC8
	cmp r0, #0
	beq _081C3ACE
	b _081C3AE6
	.align 2, 0
_081C3AC0: .4byte 0x0203CBE8
_081C3AC4: .4byte 0x000040C0
_081C3AC8:
	cmp r0, #3
	beq _081C3ADE
	b _081C3AE6
_081C3ACE:
	bl SetMonTypeIcons
	b _081C3AE6
_081C3AD4:
	bl SetMoveTypeIcons
	bl SetNewMoveTypeIcon
	b _081C3AE6
_081C3ADE:
	bl SetContestMoveTypeIcons
	bl SetNewMoveTypeIcon
_081C3AE6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetTypeIcons

	thumb_func_start CreateMoveTypeIcons
CreateMoveTypeIcons: @ 0x081C3AEC
	push {r4, r5, lr}
	movs r4, #3
	ldr r5, _081C3B30
_081C3AF2:
	ldr r0, [r5]
	ldr r1, _081C3B34
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081C3B16
	ldr r0, _081C3B38
	movs r1, #0
	movs r2, #0
	movs r3, #2
	bl CreateSprite
	ldr r1, [r5]
	ldr r2, _081C3B34
	adds r1, r1, r2
	adds r1, r1, r4
	strb r0, [r1]
_081C3B16:
	adds r0, r4, #0
	movs r1, #1
	bl SetSpriteInvisibility
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _081C3AF2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C3B30: .4byte 0x0203CBE8
_081C3B34: .4byte 0x000040D3
_081C3B38: .4byte 0x085ED414
	thumb_func_end CreateMoveTypeIcons

	thumb_func_start SetMoveTypeSpritePosAndType
SetMoveTypeSpritePosAndType: @ 0x081C3B3C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _081C3BB4
	ldr r0, [r0]
	ldr r1, _081C3BB8
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _081C3BBC
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	str r3, [sp]
	bl StartSpriteAnim
	ldr r0, _081C3BC0
	adds r5, r5, r0
	ldrb r1, [r5]
	lsls r1, r1, #4
	ldrb r2, [r4, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	adds r6, #0x10
	strh r6, [r4, #0x20]
	movs r0, #8
	add r8, r0
	mov r1, r8
	strh r1, [r4, #0x22]
	ldr r3, [sp]
	adds r0, r3, #0
	movs r1, #0
	bl SetSpriteInvisibility
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C3BB4: .4byte 0x0203CBE8
_081C3BB8: .4byte 0x000040D3
_081C3BBC: .4byte 0x020205AC
_081C3BC0: .4byte 0x085ED42C
	thumb_func_end SetMoveTypeSpritePosAndType

	thumb_func_start SetMonTypeIcons
SetMonTypeIcons: @ 0x081C3BC4
	push {r4, r5, lr}
	ldr r0, _081C3BEC
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _081C3BF0
	movs r0, #9
	movs r1, #0x78
	movs r2, #0x30
	movs r3, #3
	bl SetMoveTypeSpritePosAndType
	movs r0, #4
	movs r1, #1
	bl SetSpriteInvisibility
	b _081C3C3C
	.align 2, 0
_081C3BEC: .4byte 0x0203CBE8
_081C3BF0:
	ldr r4, _081C3C30
	ldrh r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #6]
	movs r1, #0x78
	movs r2, #0x30
	movs r3, #3
	bl SetMoveTypeSpritePosAndType
	ldrh r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrb r0, [r1, #6]
	ldrb r2, [r1, #7]
	cmp r0, r2
	beq _081C3C34
	ldrb r0, [r1, #7]
	movs r1, #0xa0
	movs r2, #0x30
	movs r3, #4
	bl SetMoveTypeSpritePosAndType
	movs r0, #4
	movs r1, #0
	bl SetSpriteInvisibility
	b _081C3C3C
	.align 2, 0
_081C3C30: .4byte 0x082F0D54
_081C3C34:
	movs r0, #4
	movs r1, #1
	bl SetSpriteInvisibility
_081C3C3C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetMonTypeIcons

	thumb_func_start SetMoveTypeIcons
SetMoveTypeIcons: @ 0x081C3C44
	push {r4, r5, r6, lr}
	ldr r0, _081C3C84
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	movs r4, #0
	ldr r6, _081C3C88
_081C3C52:
	lsls r0, r4, #1
	adds r1, r5, #0
	adds r1, #0x14
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _081C3C8C
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #2]
	lsls r2, r4, #0x1c
	movs r1, #0x80
	lsls r1, r1, #0x16
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	adds r3, r4, #3
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #0x57
	bl SetMoveTypeSpritePosAndType
	b _081C3C98
	.align 2, 0
_081C3C84: .4byte 0x0203CBE8
_081C3C88: .4byte 0x082ED220
_081C3C8C:
	adds r0, r4, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl SetSpriteInvisibility
_081C3C98:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081C3C52
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end SetMoveTypeIcons

	thumb_func_start SetContestMoveTypeIcons
SetContestMoveTypeIcons: @ 0x081C3CA8
	push {r4, r5, lr}
	ldr r0, _081C3CF0
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	movs r4, #0
_081C3CB4:
	lsls r0, r4, #1
	adds r1, r5, #0
	adds r1, #0x14
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0
	beq _081C3CF8
	ldr r1, _081C3CF4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #5
	movs r1, #0x90
	lsls r1, r1, #0x15
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	lsls r2, r4, #0x1c
	movs r1, #0x80
	lsls r1, r1, #0x16
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	adds r3, r4, #3
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #0x57
	bl SetMoveTypeSpritePosAndType
	b _081C3D04
	.align 2, 0
_081C3CF0: .4byte 0x0203CBE8
_081C3CF4: .4byte 0x08565FCC
_081C3CF8:
	adds r0, r4, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl SetSpriteInvisibility
_081C3D04:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081C3CB4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end SetContestMoveTypeIcons

	thumb_func_start SetNewMoveTypeIcon
SetNewMoveTypeIcon: @ 0x081C3D14
	push {lr}
	ldr r0, _081C3D30
	ldr r1, [r0]
	ldr r0, _081C3D34
	adds r3, r1, r0
	ldrh r0, [r3]
	cmp r0, #0
	bne _081C3D38
	movs r0, #7
	movs r1, #1
	bl SetSpriteInvisibility
	b _081C3D84
	.align 2, 0
_081C3D30: .4byte 0x0203CBE8
_081C3D34: .4byte 0x000040C4
_081C3D38:
	ldr r2, _081C3D5C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _081C3D64
	ldr r2, _081C3D60
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	movs r1, #0x57
	movs r2, #0x60
	movs r3, #7
	bl SetMoveTypeSpritePosAndType
	b _081C3D84
	.align 2, 0
_081C3D5C: .4byte 0x000040C0
_081C3D60: .4byte 0x082ED220
_081C3D64:
	ldr r1, _081C3D88
	ldrh r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #5
	movs r1, #0x90
	lsls r1, r1, #0x15
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	movs r1, #0x57
	movs r2, #0x60
	movs r3, #7
	bl SetMoveTypeSpritePosAndType
_081C3D84:
	pop {r0}
	bx r0
	.align 2, 0
_081C3D88: .4byte 0x08565FCC
	thumb_func_end SetNewMoveTypeIcon

	thumb_func_start sub_081C3D8C
sub_081C3D8C: @ 0x081C3D8C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _081C3E0C
	ldr r2, [r2]
	adds r0, #3
	ldr r3, _081C3E10
	adds r2, r2, r3
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r5, _081C3E14
	adds r4, r4, r5
	adds r1, #3
	adds r2, r2, r1
	ldrb r0, [r2]
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r3, r3, r5
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r1, [r5]
	adds r2, r3, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	strb r0, [r5]
	strb r1, [r2]
	ldrb r6, [r4, #5]
	lsrs r5, r6, #4
	ldrb r2, [r3, #5]
	lsrs r2, r2, #4
	lsls r2, r2, #4
	movs r1, #0xf
	adds r0, r1, #0
	ands r0, r6
	orrs r0, r2
	strb r0, [r4, #5]
	lsls r5, r5, #4
	ldrb r0, [r3, #5]
	ands r1, r0
	orrs r1, r5
	strb r1, [r3, #5]
	adds r4, #0x3f
	ldrb r0, [r4]
	movs r2, #4
	orrs r0, r2
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4]
	adds r3, #0x3f
	ldrb r0, [r3]
	orrs r0, r2
	ands r0, r1
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C3E0C: .4byte 0x0203CBE8
_081C3E10: .4byte 0x000040D3
_081C3E14: .4byte 0x020205AC
	thumb_func_end sub_081C3D8C

	thumb_func_start CreatePokemonSprite
CreatePokemonSprite: @ 0x081C3E18
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	ldr r0, _081C3E40
	ldr r2, [r0]
	adds r5, r2, #0
	adds r5, #0x70
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _081C3E44
	cmp r0, #1
	bne _081C3E34
	b _081C3F58
_081C3E34:
	adds r0, r3, #0
	bl sub_081C3FBC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081C3F78
	.align 2, 0
_081C3E40: .4byte 0x0203CBE8
_081C3E44:
	ldr r0, _081C3E78
	ldr r1, _081C3E7C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C3EA4
	ldr r1, _081C3E80
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #3
	bl sub_08068438
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C3E8C
	ldrh r2, [r5, #2]
	lsls r0, r2, #3
	ldr r1, _081C3E84
	adds r0, r0, r1
	ldr r1, _081C3E88
	ldr r1, [r1]
	ldr r1, [r1, #8]
	b _081C3EEA
	.align 2, 0
_081C3E78: .4byte 0x03002360
_081C3E7C: .4byte 0x00000439
_081C3E80: .4byte 0x000040BE
_081C3E84: .4byte 0x082DDA1C
_081C3E88: .4byte 0x02024178
_081C3E8C:
	ldrh r2, [r5, #2]
	lsls r0, r2, #3
	ldr r1, _081C3E9C
	adds r0, r0, r1
	ldr r1, _081C3EA0
	ldr r1, [r1]
	ldr r1, [r1, #8]
	b _081C3EC8
	.align 2, 0
_081C3E9C: .4byte 0x082DDA1C
_081C3EA0: .4byte 0x02024178
_081C3EA4:
	ldr r0, _081C3ED0
	ldr r3, [r0]
	cmp r3, #0
	beq _081C3EF8
	ldr r1, [r2]
	ldr r0, _081C3ED4
	cmp r1, r0
	beq _081C3EBE
	ldr r1, _081C3ED8
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _081C3EE0
_081C3EBE:
	ldrh r2, [r5, #2]
	lsls r0, r2, #3
	ldr r1, _081C3EDC
	adds r0, r0, r1
	ldr r1, [r3, #8]
_081C3EC8:
	ldr r3, [r5, #0xc]
	bl HandleLoadSpecialPokePic_2
	b _081C3F70
	.align 2, 0
_081C3ED0: .4byte 0x02024178
_081C3ED4: .4byte 0x02024190
_081C3ED8: .4byte 0x000040BC
_081C3EDC: .4byte 0x082DDA1C
_081C3EE0:
	ldrh r2, [r5, #2]
	lsls r0, r2, #3
	ldr r1, _081C3EF4
	adds r0, r0, r1
	ldr r1, [r3, #8]
_081C3EEA:
	ldr r3, [r5, #0xc]
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	b _081C3F70
	.align 2, 0
_081C3EF4: .4byte 0x082DDA1C
_081C3EF8:
	ldr r1, [r2]
	ldr r0, _081C3F28
	cmp r1, r0
	beq _081C3F0A
	ldr r1, _081C3F2C
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _081C3F34
_081C3F0A:
	ldrh r4, [r5, #2]
	lsls r4, r4, #3
	ldr r0, _081C3F30
	adds r4, r4, r0
	movs r0, #0
	movs r1, #1
	bl EvolutionRenameMon
	adds r1, r0, #0
	ldrh r2, [r5, #2]
	ldr r3, [r5, #0xc]
	adds r0, r4, #0
	bl HandleLoadSpecialPokePic_2
	b _081C3F70
	.align 2, 0
_081C3F28: .4byte 0x02024190
_081C3F2C: .4byte 0x000040BC
_081C3F30: .4byte 0x082DDA1C
_081C3F34:
	ldrh r4, [r5, #2]
	lsls r4, r4, #3
	ldr r0, _081C3F54
	adds r4, r4, r0
	movs r0, #0
	movs r1, #1
	bl EvolutionRenameMon
	adds r1, r0, #0
	ldrh r2, [r5, #2]
	ldr r3, [r5, #0xc]
	adds r0, r4, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	b _081C3F70
	.align 2, 0
_081C3F54: .4byte 0x082DDA1C
_081C3F58:
	ldrh r0, [r5, #2]
	ldr r1, [r5, #0x48]
	ldr r2, [r5, #0xc]
	bl GetMonSpritePalStructFromOtIdPersonality
	adds r4, r0, #0
	bl LoadCompressedSpritePalette
	ldrh r0, [r4, #4]
	movs r1, #1
	bl SetMultiuseSpriteTemplateToPokemon
_081C3F70:
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r0, #0xff
_081C3F78:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CreatePokemonSprite

	thumb_func_start PlayMonCry
PlayMonCry: @ 0x081C3F80
	push {r4, lr}
	ldr r0, _081C3FA8
	ldr r1, [r0]
	adds r4, r1, #0
	adds r4, #0x70
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _081C3FB6
	adds r0, r1, #0
	adds r0, #0xc
	bl ShouldPlayNormalMonCry
	cmp r0, #1
	bne _081C3FAC
	ldrh r0, [r4, #2]
	movs r1, #0
	movs r2, #0
	bl PlayCry3
	b _081C3FB6
	.align 2, 0
_081C3FA8: .4byte 0x0203CBE8
_081C3FAC:
	ldrh r0, [r4, #2]
	movs r1, #0
	movs r2, #0xb
	bl PlayCry3
_081C3FB6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayMonCry

	thumb_func_start sub_081C3FBC
sub_081C3FBC: @ 0x081C3FBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _081C4020
	ldr r6, [r0]
	adds r6, #0x70
	ldr r0, _081C4024
	movs r1, #0x28
	movs r2, #0x40
	movs r3, #5
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r4, r0, #4
	add r4, r8
	lsls r4, r4, #2
	ldr r5, _081C4028
	adds r7, r4, r5
	adds r0, r7, #0
	bl FreeSpriteOamMatrix
	ldrh r0, [r6, #2]
	movs r1, #0
	strh r0, [r7, #0x2e]
	strh r1, [r7, #0x32]
	adds r5, #0x1c
	adds r4, r4, r5
	ldr r0, _081C402C
	str r0, [r4]
	ldrb r1, [r7, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #5]
	ldrh r0, [r6, #2]
	bl IsMonSpriteNotFlipped
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C4030
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	b _081C403E
	.align 2, 0
_081C4020: .4byte 0x0203CBE8
_081C4024: .4byte 0x02024640
_081C4028: .4byte 0x020205AC
_081C402C: .4byte 0x081C404D
_081C4030:
	adds r2, r7, #0
	adds r2, #0x3f
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_081C403E:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C3FBC

	thumb_func_start SpriteCB_Pokemon
SpriteCB_Pokemon: @ 0x081C404C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _081C408C
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	ldr r0, _081C4090
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081C4086
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _081C4086
	ldrh r0, [r4, #0x2e]
	bl IsMonSpriteNotFlipped
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x30]
	bl PlayMonCry
	ldrh r1, [r4, #0x2e]
	ldrb r2, [r5, #4]
	adds r0, r4, #0
	bl PokemonSummaryDoMonAnimation
_081C4086:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C408C: .4byte 0x0203CBE8
_081C4090: .4byte 0x02037C74
	thumb_func_end SpriteCB_Pokemon

	thumb_func_start SummaryScreen_SetUnknownTaskId
SummaryScreen_SetUnknownTaskId: @ 0x081C4094
	ldr r1, _081C409C
	strb r0, [r1]
	bx lr
	.align 2, 0
_081C409C: .4byte 0x0203CBF0
	thumb_func_end SummaryScreen_SetUnknownTaskId

	thumb_func_start SummaryScreen_DestroyUnknownTask
SummaryScreen_DestroyUnknownTask: @ 0x081C40A0
	push {r4, lr}
	ldr r4, _081C40B8
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _081C40B2
	bl DestroyTask
	movs r0, #0xff
	strb r0, [r4]
_081C40B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C40B8: .4byte 0x0203CBF0
	thumb_func_end SummaryScreen_DestroyUnknownTask

	thumb_func_start SummaryScreen_DoesSpriteHaveCallback
SummaryScreen_DoesSpriteHaveCallback: @ 0x081C40BC
	push {lr}
	ldr r2, _081C40E0
	ldr r0, _081C40E4
	ldr r0, [r0]
	ldr r1, _081C40E8
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081C40EC
	cmp r1, r0
	beq _081C40F0
	movs r0, #1
	b _081C40F2
	.align 2, 0
_081C40E0: .4byte 0x020205AC
_081C40E4: .4byte 0x0203CBE8
_081C40E8: .4byte 0x000040D3
_081C40EC: .4byte 0x08007141
_081C40F0:
	movs r0, #0
_081C40F2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SummaryScreen_DoesSpriteHaveCallback

	thumb_func_start StopPokemonAnimations
StopPokemonAnimations: @ 0x081C40F8
	push {r4, r5, r6, lr}
	ldr r6, _081C4174
	ldr r5, _081C4178
	ldr r0, [r5]
	ldr r4, _081C417C
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _081C4180
	str r1, [r0]
	bl StopPokemonAnimationDelayTask
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	lsls r3, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r3, r0
	movs r2, #0
	ldr r5, _081C4184
	ldr r4, _081C4188
_081C4154:
	adds r0, r2, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r1, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xf
	bls _081C4154
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C4174: .4byte 0x020205AC
_081C4178: .4byte 0x0203CBE8
_081C417C: .4byte 0x000040D3
_081C4180: .4byte 0x08007141
_081C4184: .4byte 0x020373B4
_081C4188: .4byte 0x020377B4
	thumb_func_end StopPokemonAnimations

	thumb_func_start CreateMonMarkingsSprite
CreateMonMarkingsSprite: @ 0x081C418C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _081C41DC
	ldr r2, _081C41E0
	adds r0, r1, #0
	bl sub_081204B4
	adds r4, r0, #0
	ldr r6, _081C41E4
	ldr r0, [r6]
	str r4, [r0, #8]
	cmp r4, #0
	beq _081C41D6
	adds r0, r5, #0
	movs r1, #8
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r1, [r6]
	ldr r2, [r1, #8]
	movs r0, #0x3c
	strh r0, [r2, #0x20]
	ldr r2, [r1, #8]
	movs r0, #0x1a
	strh r0, [r2, #0x22]
	ldr r2, [r1, #8]
	ldrb r1, [r2, #5]
	subs r0, #0x27
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #5]
_081C41D6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C41DC: .4byte 0x00007533
_081C41E0: .4byte 0x085ED570
_081C41E4: .4byte 0x0203CBE8
	thumb_func_end CreateMonMarkingsSprite

	thumb_func_start RemoveAndCreateMonMarkingsSprite
RemoveAndCreateMonMarkingsSprite: @ 0x081C41E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081C4208
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl DestroySprite
	ldr r0, _081C420C
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl CreateMonMarkingsSprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C4208: .4byte 0x0203CBE8
_081C420C: .4byte 0x00007533
	thumb_func_end RemoveAndCreateMonMarkingsSprite

	thumb_func_start CreateCaughtBallSprite
CreateCaughtBallSprite: @ 0x081C4210
	push {r4, lr}
	movs r1, #0x26
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIdToBallId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl LoadBallGfx
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081C427C
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0x78
	movs r3, #0
	bl CreateSprite
	ldr r2, _081C4280
	ldr r1, [r2]
	ldr r3, _081C4284
	adds r1, r1, r3
	strb r0, [r1]
	ldr r4, _081C4288
	ldr r2, [r2]
	adds r2, r2, r3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _081C428C
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C427C: .4byte 0x082FCF94
_081C4280: .4byte 0x0203CBE8
_081C4284: .4byte 0x000040D4
_081C4288: .4byte 0x020205AC
_081C428C: .4byte 0x08007141
	thumb_func_end CreateCaughtBallSprite

	thumb_func_start CreateSetStatusSprite
CreateSetStatusSprite: @ 0x081C4290
	push {r4, r5, lr}
	ldr r5, _081C42E0
	ldr r0, [r5]
	ldr r1, _081C42E4
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _081C42AE
	ldr r0, _081C42E8
	movs r1, #0x40
	movs r2, #0x90
	movs r3, #0
	bl CreateSprite
	strb r0, [r4]
_081C42AE:
	ldr r0, [r5]
	adds r0, #0xc
	bl GetMonAilment
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _081C42F0
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081C42EC
	adds r0, r0, r1
	subs r1, r2, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	movs r0, #2
	movs r1, #0
	bl SetSpriteInvisibility
	b _081C42F8
	.align 2, 0
_081C42E0: .4byte 0x0203CBE8
_081C42E4: .4byte 0x000040D5
_081C42E8: .4byte 0x085ED558
_081C42EC: .4byte 0x020205AC
_081C42F0:
	movs r0, #2
	movs r1, #1
	bl SetSpriteInvisibility
_081C42F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateSetStatusSprite

	thumb_func_start sub_081C4300
sub_081C4300: @ 0x081C4300
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _081C4368
	ldr r1, _081C436C
	add r1, r8
	ldr r0, [r0]
	adds r7, r0, r1
	ldr r1, _081C4370
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bls _081C43DA
	movs r0, #0
	mov sb, r0
	mov r1, r8
	cmp r1, #8
	bne _081C4332
	movs r0, #1
	mov sb, r0
_081C4332:
	movs r5, #0
	ldr r6, _081C4374
	mov sl, r5
_081C4338:
	lsls r1, r5, #0x14
	movs r0, #0xb0
	lsls r0, r0, #0xf
	adds r1, r1, r0
	asrs r1, r1, #0x10
	ldr r0, _081C4378
	movs r2, #0x28
	mov r3, sb
	bl CreateSprite
	adds r1, r7, r5
	strb r0, [r1]
	adds r4, r1, #0
	cmp r5, #0
	bne _081C437C
	ldrb r1, [r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #4
	bl StartSpriteAnim
	b _081C43A2
	.align 2, 0
_081C4368: .4byte 0x0203CBE8
_081C436C: .4byte 0x000040D3
_081C4370: .4byte 0x000040C0
_081C4374: .4byte 0x020205AC
_081C4378: .4byte 0x085ED4D4
_081C437C:
	cmp r5, #9
	bne _081C4392
	ldrb r1, [r7, #9]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #5
	bl StartSpriteAnim
	b _081C43A2
_081C4392:
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #6
	bl StartSpriteAnim
_081C43A2:
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _081C43E8
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, r8
	strh r1, [r0, #0x2e]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, sl
	strh r1, [r0, #0x30]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _081C4338
_081C43DA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C43E8: .4byte 0x081C43ED
	thumb_func_end sub_081C4300

	thumb_func_start sub_081C43EC
sub_081C43EC: @ 0x081C43EC
	push {lr}
	adds r3, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _081C4424
	ldrh r0, [r3, #0x30]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r3, #0x30]
	cmp r0, #0x18
	ble _081C4418
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	b _081C4432
_081C4418:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	b _081C4430
_081C4424:
	movs r0, #0
	strh r0, [r3, #0x30]
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
_081C4430:
	ands r0, r1
_081C4432:
	strb r0, [r2]
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #8
	bne _081C444C
	ldr r0, _081C4444
	ldr r0, [r0]
	ldr r1, _081C4448
	b _081C4452
	.align 2, 0
_081C4444: .4byte 0x0203CBE8
_081C4448: .4byte 0x000040C6
_081C444C:
	ldr r0, _081C4460
	ldr r0, [r0]
	ldr r1, _081C4464
_081C4452:
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	strh r0, [r3, #0x26]
	pop {r0}
	bx r0
	.align 2, 0
_081C4460: .4byte 0x0203CBE8
_081C4464: .4byte 0x000040C7
	thumb_func_end sub_081C43EC

	thumb_func_start sub_081C4468
sub_081C4468: @ 0x081C4468
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
_081C4470:
	adds r0, r5, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroySpriteInArray
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _081C4470
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C4468

	thumb_func_start sub_081C448C
sub_081C448C: @ 0x081C448C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _081C44D0
	ldr r0, [r0]
	ldr r1, _081C44D4
	adds r5, r0, r1
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #0x18
	movs r4, #0
	ldr r7, _081C44D8
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r2, r2, r0
	mov sb, r2
	lsrs r6, r0, #0x18
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r1, r1, r0
	mov r8, r1
_081C44BC:
	cmp r4, #0
	bne _081C44DC
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r2, sb
	b _081C44EC
	.align 2, 0
_081C44D0: .4byte 0x0203CBE8
_081C44D4: .4byte 0x000040DB
_081C44D8: .4byte 0x020205AC
_081C44DC:
	cmp r4, #9
	bne _081C44F4
	ldrb r1, [r5, #9]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r2, r8
_081C44EC:
	lsrs r1, r2, #0x18
	bl StartSpriteAnim
	b _081C450A
_081C44F4:
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r1, r6, #6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
_081C450A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _081C44BC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081C448C

	thumb_func_start sub_081C4520
sub_081C4520: @ 0x081C4520
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C456C
	ldr r2, _081C4570
	adds r0, r0, r2
	ldr r1, [r1]
	adds r5, r1, r0
	movs r3, #0
	ldr r4, _081C4574
	movs r7, #5
	rsbs r7, r7, #0
	movs r6, #0
_081C453A:
	adds r2, r5, r3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r6, [r0, #0x30]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #9
	bls _081C453A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C456C: .4byte 0x0203CBE8
_081C4570: .4byte 0x000040D3
_081C4574: .4byte 0x020205AC
	thumb_func_end sub_081C4520

