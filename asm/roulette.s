.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08140300
sub_08140300: @ 0x08140300
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08140328
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0xb8
	ldrb r0, [r1]
	cmp r0, #0
	beq _08140322
	adds r0, r1, #0
	bl task_tutorial_controls_fadein
_08140322:
	pop {r0}
	bx r0
	.align 2, 0
_08140328: .4byte 0x0203A854
	thumb_func_end sub_08140300

	thumb_func_start sub_0814032C
sub_0814032C: @ 0x0814032C
	push {r4, lr}
	sub sp, #4
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_081428DC
	ldr r4, _081403A0
	ldr r0, [r4]
	ldrh r0, [r0, #0x26]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x14
	bl SetGpuReg
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _08140368
	ldrh r1, [r1, #0x34]
	movs r0, #0x52
	bl SetGpuReg
_08140368:
	ldr r2, [r4]
	movs r3, #0x2a
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _08140388
	ldr r1, _081403A4
	ldr r3, _081403A8
	adds r0, r2, r3
	str r0, [r1]
	ldr r0, _081403AC
	str r0, [r1, #4]
	ldr r0, _081403B0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	strh r0, [r2, #0x2a]
_08140388:
	ldr r0, [r4]
	movs r2, #0x28
	ldrsh r1, [r0, r2]
	cmp r1, #1
	beq _081403B4
	cmp r1, #1
	ble _0814043C
	cmp r1, #2
	beq _081403EC
	cmp r1, #0xff
	beq _08140410
	b _0814043C
	.align 2, 0
_081403A0: .4byte 0x0203A854
_081403A4: .4byte 0x040000D4
_081403A8: .4byte 0x0000133C
_081403AC: .4byte 0x060021C0
_081403B0: .4byte 0x800001A0
_081403B4:
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r0, #0
	bl ShowBg
	ldr r1, _081403E0
	ldr r2, [r4]
	movs r3, #0xcf
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1]
	ldr r0, _081403E4
	str r0, [r1, #4]
	ldr r0, _081403E8
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #2
	strh r0, [r2, #0x28]
	b _0814043C
	.align 2, 0
_081403E0: .4byte 0x040000D4
_081403E4: .4byte 0x0600F9C0
_081403E8: .4byte 0x800001A0
_081403EC:
	ldr r1, _08140404
	movs r2, #0xcf
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08140408
	str r0, [r1, #4]
	ldr r0, _0814040C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0814043C
	.align 2, 0
_08140404: .4byte 0x040000D4
_08140408: .4byte 0x0600F9C0
_0814040C: .4byte 0x800001A0
_08140410:
	movs r0, #0
	movs r1, #1
	movs r2, #2
	bl SetBgAttribute
	movs r0, #0
	bl ShowBg
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08140444
	mov r3, sp
	str r3, [r1]
	ldr r0, _08140448
	str r0, [r1, #4]
	ldr r0, _0814044C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, [r4]
	movs r0, #0
	strh r0, [r1, #0x28]
_0814043C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140444: .4byte 0x040000D4
_08140448: .4byte 0x0600F9C0
_0814044C: .4byte 0x810001A0
	thumb_func_end sub_0814032C

	thumb_func_start sub_08140450
sub_08140450: @ 0x08140450
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	str r5, [sp]
	ldr r4, _081404C0
	movs r0, #0xe6
	lsls r0, r0, #6
	bl AllocZeroed
	str r0, [r4]
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081404C4
	movs r0, #1
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r1, [r4]
	movs r0, #0xbe
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r2, _081404C8
	adds r1, r1, r2
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081404CC
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r0, _081404D0
	bl InitWindows
	bl sub_08196DF4
	ldr r0, _081404D4
	strb r5, [r0]
	ldr r0, _081404D8
	mov r1, sp
	bl malloc_and_decompress
	ldr r1, [r4]
	ldr r2, _081404DC
	adds r1, r1, r2
	str r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081404C0: .4byte 0x0203A854
_081404C4: .4byte 0x08595CEC
_081404C8: .4byte 0x0000117C
_081404CC: .4byte 0x0000317C
_081404D0: .4byte 0x08595CF8
_081404D4: .4byte 0x0203A858
_081404D8: .4byte 0x085959A8
_081404DC: .4byte 0x0000397C
	thumb_func_end sub_08140450

	thumb_func_start sub_081404E0
sub_081404E0: @ 0x081404E0
	push {r4, r5, lr}
	ldr r5, _08140530
	ldr r0, [r5]
	ldr r4, _08140534
	adds r0, r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	adds r0, r0, r4
	movs r4, #0
	str r4, [r0]
	bl FreeAllWindowBuffers
	movs r0, #0
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #2
	bl UnsetBgTilemapBuffer
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r0, [r5]
	movs r2, #0xe6
	lsls r2, r2, #6
	movs r1, #0
	bl memset
	ldr r0, [r5]
	bl Free
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08140530: .4byte 0x0203A854
_08140534: .4byte 0x0000397C
	thumb_func_end sub_081404E0

	thumb_func_start sub_08140538
sub_08140538: @ 0x08140538
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _081405CC
	mov r0, sp
	movs r2, #6
	bl memcpy
	ldr r5, _081405D0
	ldr r3, [r5]
	ldr r4, _081405D4
	ldrb r0, [r4]
	movs r1, #1
	ands r1, r0
	ldrb r2, [r3, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #4]
	ldrh r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08140572
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0, #4]
_08140572:
	ldr r1, [r5]
	ldr r2, _081405D8
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r2
	ldrb r0, [r0, #3]
	adds r1, #0x22
	strb r0, [r1]
	ldr r1, [r5]
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	adds r1, #0x23
	strb r0, [r1]
	ldr r2, [r5]
	ldr r3, _081405DC
	ldrb r1, [r2, #4]
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	lsrs r1, r1, #7
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2, #0x19]
	ldr r2, [r5]
	ldrb r1, [r2, #0x1a]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #0x1a]
	ldr r0, [r5]
	ldrb r0, [r0, #0x19]
	cmp r0, #1
	bne _081405E8
	ldr r4, _081405E0
	ldr r3, _081405E4
	mov r0, sp
	ldrh r2, [r0]
	b _081405F0
	.align 2, 0
_081405CC: .4byte 0x08595FCC
_081405D0: .4byte 0x0203A854
_081405D4: .4byte 0x02037280
_081405D8: .4byte 0x08595EF4
_081405DC: .4byte 0x08595EF0
_081405E0: .4byte 0x020373B4
_081405E4: .4byte 0x020377B4
_081405E8:
	ldr r4, _0814065C
	ldr r3, _08140660
	mov r0, sp
	ldrh r2, [r0, #2]
_081405F0:
	adds r0, r3, #0
	adds r0, #0xa2
	strh r2, [r0]
	ldr r1, _08140664
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ands r0, r1
	adds r2, r4, #0
	adds r2, #0xa2
	strh r0, [r2]
	ands r0, r1
	strh r0, [r4]
	ldr r0, _08140668
	ldr r0, [r0]
	adds r0, #0xb8
	bl sub_08151654
	movs r4, #0
_08140616:
	ldr r5, _08140668
	ldr r0, [r5]
	adds r0, #0xb8
	lsls r2, r4, #3
	ldr r1, _0814066C
	adds r2, r2, r1
	adds r1, r4, #0
	bl sub_08151668
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xc
	bls _08140616
	movs r4, #0
_08140634:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _08140670
	adds r0, r0, r1
	movs r1, #0x41
	bl GetMonData
	adds r1, r0, #0
	movs r0, #0x98
	lsls r0, r0, #1
	cmp r1, r0
	beq _08140674
	adds r0, #2
	cmp r1, r0
	bne _0814067E
	ldr r0, [r5]
	ldrb r1, [r0, #2]
	movs r2, #1
	b _0814067A
	.align 2, 0
_0814065C: .4byte 0x020373B4
_08140660: .4byte 0x020377B4
_08140664: .4byte 0x0000FFFF
_08140668: .4byte 0x0203A854
_0814066C: .4byte 0x08595F34
_08140670: .4byte 0x02024190
_08140674:
	ldr r0, [r5]
	ldrb r1, [r0, #2]
	movs r2, #2
_0814067A:
	orrs r1, r2
	strb r1, [r0, #2]
_0814067E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _08140634
	bl RtcCalcLocalTime
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08140538

	thumb_func_start sub_08140694
sub_08140694: @ 0x08140694
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _081406B4
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	bls _081406A8
	b _081408C0
_081406A8:
	lsls r0, r0, #2
	ldr r1, _081406B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081406B4: .4byte 0x03002360
_081406B8: .4byte 0x081406BC
_081406BC: @ jump table
	.4byte _081406E0 @ case 0
	.4byte _081406F8 @ case 1
	.4byte _08140718 @ case 2
	.4byte _0814072A @ case 3
	.4byte _08140764 @ case 4
	.4byte _08140788 @ case 5
	.4byte _081407A8 @ case 6
	.4byte _08140818 @ case 7
	.4byte _08140842 @ case 8
_081406E0:
	movs r0, #0
	bl SetVBlankCallback
	bl ScanlineEffect_Stop
	bl SetVBlankHBlankCallbacksToNull
	bl ResetVramOamAndBgCntRegs
	bl ResetAllBgsCoordinates
	b _081408C0
_081406F8:
	bl sub_08140450
	bl DeactivateAllTextPrinters
	movs r1, #0x90
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _08140714
	movs r0, #0x52
	bl SetGpuReg
	b _081408C0
	.align 2, 0
_08140714: .4byte 0x0000060A
_08140718:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl reset_temp_tile_data_buffers
	b _081408C0
_0814072A:
	ldr r0, _08140758
	movs r2, #0xe0
	lsls r2, r2, #1
	movs r1, #0
	bl LoadPalette
	ldr r1, _0814075C
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _08140760
	str r4, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _081408C0
	.align 2, 0
_08140758: .4byte 0x085957A8
_0814075C: .4byte 0x08DBC590
_08140760: .4byte 0x08DBCCBC
_08140764:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08140770
	b _081408CE
_08140770:
	bl sub_08140538
	ldr r1, _08140784
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	b _081408C0
	.align 2, 0
_08140784: .4byte 0x08595B4C
_08140788:
	movs r0, #0
	bl sub_08142CD8
	bl sub_08143A94
	bl sub_081439E8
	bl sub_081433E0
	bl sub_08142D9C
	bl sub_08143048
	bl sub_081432B0
	b _081408C0
_081407A8:
	bl AnimateSprites
	bl BuildOamBuffer
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_081435E0
	movs r0, #6
	bl sub_081437F8
	movs r0, #0
	bl sub_0814379C
	movs r0, #0
	bl sub_081425C4
	ldr r4, _08140808
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	ldr r2, _0814080C
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _08140810
	movs r2, #0x3c
	rsbs r2, r2, #0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08140814
	strh r5, [r0]
	b _081408C0
	.align 2, 0
_08140808: .4byte 0x0203A858
_0814080C: .4byte 0x08262D3F
_08140810: .4byte 0x02021B38
_08140814: .4byte 0x02021B3A
_08140818:
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	b _081408C0
_08140842:
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _081408A8
	bl SetVBlankCallback
	movs r0, #1
	str r0, [sp]
	movs r0, #0xff
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginHardwarePaletteFade
	ldr r0, _081408AC
	movs r1, #0
	bl CreateTask
	ldr r5, _081408B0
	ldr r1, [r5]
	adds r1, #0xa4
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081408B4
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r0, #6
	strh r0, [r4, #0x14]
	bl GetCoins
	strh r0, [r4, #0x22]
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AlertTVThatPlayerPlayedRoulette
	ldr r0, _081408B8
	movs r1, #1
	bl CreateTask
	ldr r1, [r5]
	adds r1, #0xa5
	strb r0, [r1]
	ldr r0, _081408BC
	bl SetMainCallback2
	b _081408CE
	.align 2, 0
_081408A8: .4byte 0x0814032D
_081408AC: .4byte 0x08140971
_081408B0: .4byte 0x0203A854
_081408B4: .4byte 0x03005B60
_081408B8: .4byte 0x081408DD
_081408BC: .4byte 0x08140301
_081408C0:
	ldr r1, _081408D8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_081408CE:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081408D8: .4byte 0x03002360
	thumb_func_end sub_08140694

	thumb_func_start sub_081408DC
sub_081408DC: @ 0x081408DC
	push {r4, r5, r6, lr}
	ldr r3, _0814096C
	ldr r0, [r3]
	adds r0, #0x21
	ldrb r2, [r0]
	adds r1, r2, #1
	strb r1, [r0]
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0x23
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r6, r3, #0
	ldrb r0, [r0]
	cmp r2, r0
	bne _08140922
	adds r1, #0x21
	movs r0, #0
	strb r0, [r1]
	ldr r2, [r6]
	adds r3, r2, #0
	adds r3, #0x22
	ldrb r1, [r3]
	ldrh r0, [r2, #0x24]
	subs r0, r0, r1
	strh r0, [r2, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08140922
	ldrb r1, [r3]
	movs r3, #0xb4
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r1
	strh r0, [r2, #0x24]
_08140922:
	adds r4, r6, #0
	ldr r0, [r4]
	ldrh r0, [r0, #0x24]
	bl Sin2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4]
	ldrh r0, [r0, #0x24]
	bl Cos2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08140946
	adds r0, #0xf
_08140946:
	lsls r0, r0, #0xc
	lsrs r5, r0, #0x10
	ldr r3, [r6]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08140956
	adds r0, #0xf
_08140956:
	asrs r0, r0, #4
	strh r0, [r3, #0x32]
	strh r0, [r3, #0x2c]
	strh r5, [r3, #0x2e]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	strh r0, [r3, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814096C: .4byte 0x0203A854
	thumb_func_end sub_081408DC

	thumb_func_start sub_08140970
sub_08140970: @ 0x08140970
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _081409C6
	movs r1, #0x90
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _081409CC
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, _081409D0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #0x14]
	adds r0, r4, #0
	bl sub_081420BC
	bl sub_08142138
	bl sub_08143B0C
	movs r0, #0
	bl sub_081425C4
	movs r0, #6
	bl sub_081437F8
	ldr r1, _081409D4
	ldr r2, _081409D8
	adds r0, r4, #0
	movs r3, #3
	bl sub_08142044
_081409C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081409CC: .4byte 0x00000808
_081409D0: .4byte 0x03005B60
_081409D4: .4byte 0x08140A31
_081409D8: .4byte 0x0000FFFF
	thumb_func_end sub_08140970

	thumb_func_start sub_081409DC
sub_081409DC: @ 0x081409DC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DisplayYesNoMenuDefaultYes
	ldr r5, _08140A24
	ldrb r0, [r5]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r5]
	ldr r2, _08140A28
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _08140A2C
	adds r0, r4, #0
	bl DoYesNoFuncWithChoice
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08140A24: .4byte 0x0203A858
_08140A28: .4byte 0x08262DA3
_08140A2C: .4byte 0x08595FC4
	thumb_func_end sub_081409DC

	thumb_func_start sub_08140A30
sub_08140A30: @ 0x08140A30
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #1
	bl DrawStdWindowFrame
	ldr r1, _08140A54
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08140A58
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140A54: .4byte 0x03005B60
_08140A58: .4byte 0x08140C99
	thumb_func_end sub_08140A30

	thumb_func_start sub_08140A5C
sub_08140A5C: @ 0x08140A5C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08140A7C
	ldr r0, [r0]
	adds r0, #0xa5
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r4, #0
	bl sub_08141EAC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140A7C: .4byte 0x0203A854
	thumb_func_end sub_08140A5C

	thumb_func_start sub_08140A80
sub_08140A80: @ 0x08140A80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _08140A92
	b _08140BB0
_08140A92:
	lsls r0, r4, #2
	ldr r1, _08140A9C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08140A9C: .4byte 0x08140AA0
_08140AA0: @ jump table
	.4byte _08140AE0 @ case 0
	.4byte _08140B04 @ case 1
	.4byte _08140B04 @ case 2
	.4byte _08140B04 @ case 3
	.4byte _08140B04 @ case 4
	.4byte _08140B58 @ case 5
	.4byte _08140BB0 @ case 6
	.4byte _08140BB0 @ case 7
	.4byte _08140BB0 @ case 8
	.4byte _08140BB0 @ case 9
	.4byte _08140B58 @ case 10
	.4byte _08140BB0 @ case 11
	.4byte _08140BB0 @ case 12
	.4byte _08140BB0 @ case 13
	.4byte _08140BB0 @ case 14
	.4byte _08140B58 @ case 15
_08140AE0:
	ldr r0, _08140B00
	ldr r0, [r0]
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x10
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0xe
	movs r3, #7
	bl sub_08151FE4
	b _08140C16
	.align 2, 0
_08140B00: .4byte 0x0203A854
_08140B04:
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r0, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r5, _08140B4C
	ldr r0, [r5]
	movs r4, #0xbe
	lsls r4, r4, #1
	adds r0, r0, r4
	movs r1, #0x10
	str r1, [sp]
	movs r6, #0xd
	str r6, [sp, #4]
	movs r1, #0
	movs r2, #0xe
	movs r3, #7
	bl sub_08151FE4
	ldr r0, [r5]
	adds r4, r0, r4
	ldr r1, _08140B50
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08140B54
	adds r1, r1, r0
	movs r0, #3
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	mov r2, r8
	movs r3, #7
	bl sub_08152034
	b _08140C16
	.align 2, 0
_08140B4C: .4byte 0x0203A854
_08140B50: .4byte 0x0000397C
_08140B54: .4byte 0x00000232
_08140B58:
	subs r0, r4, #1
	movs r1, #5
	bl __divsi3
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #0xa
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r5, _08140BA8
	ldr r0, [r5]
	movs r4, #0xbe
	lsls r4, r4, #1
	adds r0, r0, r4
	movs r6, #0x10
	str r6, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0xe
	movs r3, #7
	bl sub_08151FE4
	ldr r0, [r5]
	adds r4, r0, r4
	ldr r1, _08140BAC
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r1, r1, r0
	str r6, [sp]
	movs r0, #3
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0xe
	adds r3, r7, #0
	bl sub_08152034
	b _08140C16
	.align 2, 0
_08140BA8: .4byte 0x0203A854
_08140BAC: .4byte 0x0000397C
_08140BB0:
	adds r0, r4, #0
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #0xe
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	subs r0, r4, #1
	movs r1, #5
	bl __divsi3
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #7
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r5, _08140C24
	ldr r0, [r5]
	movs r4, #0xbe
	lsls r4, r4, #1
	adds r0, r0, r4
	movs r1, #0x10
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0xe
	movs r3, #7
	bl sub_08151FE4
	ldr r0, [r5]
	adds r4, r0, r4
	ldr r1, _08140C28
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	mov r2, r8
	adds r3, r7, #0
	bl sub_08152034
_08140C16:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140C24: .4byte 0x0203A854
_08140C28: .4byte 0x0000397C
	thumb_func_end sub_08140A80

	thumb_func_start sub_08140C2C
sub_08140C2C: @ 0x08140C2C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08140C50
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrb r0, [r4, #0x10]
	bl sub_0814379C
	ldrb r0, [r4, #0x10]
	bl sub_08140A80
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140C50: .4byte 0x03005B60
	thumb_func_end sub_08140C2C

	thumb_func_start sub_08140C54
sub_08140C54: @ 0x08140C54
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08140C8C
	ldr r2, [r5]
	movs r6, #0
	movs r1, #1
	strh r1, [r2, #0x28]
	ldr r1, _08140C90
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrb r0, [r4, #0x10]
	bl sub_08140A80
	ldr r0, [r5]
	adds r0, #0x23
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x21
	strb r6, [r0]
	ldr r0, _08140C94
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08140C8C: .4byte 0x0203A854
_08140C90: .4byte 0x03005B60
_08140C94: .4byte 0x08141109
	thumb_func_end sub_08140C54

	thumb_func_start sub_08140C98
sub_08140C98: @ 0x08140C98
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08140CEC
	ldr r0, [r1]
	ldr r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08140CF8
	movs r3, #0xb
	ldr r5, _08140CF0
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	ands r2, r0
	ldr r0, _08140CF4
	mov ip, r0
	lsls r7, r6, #2
	cmp r2, #0
	beq _08140D36
	adds r4, r1, #0
	adds r5, #8
_08140CC6:
	lsls r0, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r3, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0xd
	bgt _08140D36
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r1, #8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08140CC6
	b _08140D36
	.align 2, 0
_08140CEC: .4byte 0x0203A854
_08140CF0: .4byte 0x08595D00
_08140CF4: .4byte 0x03005B60
_08140CF8:
	movs r3, #6
	ldr r5, _08140D64
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	ands r2, r0
	ldr r0, _08140D68
	mov ip, r0
	lsls r7, r6, #2
	cmp r2, #0
	beq _08140D36
	adds r4, r1, #0
	adds r5, #8
_08140D12:
	lsls r0, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r3, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #9
	bgt _08140D36
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r1, #8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08140D12
_08140D36:
	adds r4, r7, r6
	lsls r4, r4, #3
	add r4, ip
	movs r5, #0
	strh r3, [r4, #0x10]
	adds r0, r6, #0
	bl sub_081420BC
	ldrb r0, [r4, #0x10]
	bl sub_081425C4
	ldrb r0, [r4, #0x10]
	bl sub_0814379C
	ldrb r0, [r4, #0x10]
	bl sub_0814234C
	strh r5, [r4, #0xa]
	ldr r0, _08140D6C
	str r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140D64: .4byte 0x08595D00
_08140D68: .4byte 0x03005B60
_08140D6C: .4byte 0x08140C55
	thumb_func_end sub_08140C98

	thumb_func_start sub_08140D70
sub_08140D70: @ 0x08140D70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r6, #0
	movs r7, #0
	ldr r1, _08140DB8
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldrb r0, [r4]
	mov r8, r0
	cmp r5, #0
	blt _08140DE4
	cmp r5, #1
	bgt _08140DBC
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #5
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r2, #0xf0
	lsls r2, r2, #0x14
	adds r1, r0, r2
	lsrs r7, r1, #0x18
	cmp r0, #0
	bne _08140DE4
	movs r6, #5
	b _08140DE4
	.align 2, 0
_08140DB8: .4byte 0x08595FD2
_08140DBC:
	cmp r5, #3
	bgt _08140DE4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #5
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	lsrs r7, r0, #0x18
	cmp r1, #0
	bne _08140DE4
	movs r6, #1
_08140DE4:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
	lsls r1, r6, #0x18
	asrs r3, r1, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r7, #0x18
	cmp r0, r3
	bge _08140E06
	asrs r0, r2, #0x18
	strh r0, [r4]
_08140E06:
	movs r0, #0
	ldrsh r1, [r4, r0]
	asrs r0, r2, #0x18
	cmp r1, r0
	ble _08140E12
	strh r3, [r4]
_08140E12:
	mov r1, r8
	lsls r0, r1, #0x18
	movs r2, #0
	ldrsh r1, [r4, r2]
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08140E24
	movs r0, #0
	b _08140E26
_08140E24:
	movs r0, #1
_08140E26:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08140D70

	thumb_func_start sub_08140E34
sub_08140E34: @ 0x08140E34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0
	mov sb, r0
	movs r5, #0
	ldr r4, _08141010
	ldrh r1, [r4, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08140E70
	movs r5, #1
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _08141014
	adds r0, r0, r1
	adds r0, #8
	movs r1, #0
	bl sub_08140D70
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08140E70
	b _08141002
_08140E70:
	ldrh r1, [r4, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08140E96
	movs r5, #1
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _08141014
	adds r0, r0, r1
	adds r0, #8
	movs r1, #1
	bl sub_08140D70
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08140E96
	b _08141002
_08140E96:
	ldrh r1, [r4, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08140EBC
	movs r5, #1
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _08141014
	adds r0, r0, r1
	adds r0, #8
	movs r1, #2
	bl sub_08140D70
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08140EBC
	b _08141002
_08140EBC:
	ldrh r1, [r4, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08140EE2
	movs r5, #1
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _08141014
	adds r0, r0, r1
	adds r0, #8
	movs r1, #3
	bl sub_08140D70
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08140EE2
	b _08141002
_08140EE2:
	cmp r5, #0
	bne _08140EE8
	b _08141002
_08140EE8:
	ldr r0, _08141018
	lsls r6, r7, #2
	adds r4, r6, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r0, [r4, #0x10]
	bl sub_081425C4
	adds r0, r7, #0
	bl sub_08140C2C
	mov r1, sb
	strh r1, [r4, #0xa]
	movs r0, #5
	bl PlaySE
	ldr r5, _0814101C
	ldr r0, [r5]
	adds r0, #0xb8
	ldr r1, _08141020
	bl sub_08151A78
	ldr r5, [r5]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r3, r5, r2
	ldrb r2, [r3]
	movs r1, #0x7f
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	movs r0, #0xb2
	lsls r0, r0, #1
	adds r3, r5, r0
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	movs r0, #0xac
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldrb r0, [r4, #0x10]
	bl sub_0814234C
	movs r4, #0
	mov sb, r6
	ldr r1, _08141024
	mov ip, r1
	movs r2, #8
	add r2, ip
	mov sl, r2
_08140F54:
	ldr r0, _0814101C
	ldr r5, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	adds r6, r5, #0
	adds r6, #0x3c
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, ip
	adds r3, r0, r1
	adds r2, r3, #0
	adds r2, #0x40
	add r0, sl
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r1, r2
	ldr r2, _08141028
	mov r8, r2
	mov r0, r8
	ands r1, r0
	ldrh r2, [r3, #4]
	ldr r0, _0814102C
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08140F54
	ldr r0, _08141018
	mov r2, sb
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r3, [r1, #0x10]
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bhi _08141002
	ldr r2, _08141030
	movs r0, #0x10
	ldrsh r1, [r1, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r1, [r5, #8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08141002
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, #0x29
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08141024
	adds r3, r0, r1
	adds r2, r3, #0
	adds r2, #0x40
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldrh r2, [r2]
	adds r1, r1, r2
	mov r2, r8
	ands r1, r2
	ldrh r2, [r3, #4]
	ldr r0, _0814102C
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_08141002:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141010: .4byte 0x03002360
_08141014: .4byte 0x03005B68
_08141018: .4byte 0x03005B60
_0814101C: .4byte 0x0203A854
_08141020: .4byte 0x0000FFFF
_08141024: .4byte 0x020205AC
_08141028: .4byte 0x000003FF
_0814102C: .4byte 0xFFFFFC00
_08141030: .4byte 0x08595D00
	thumb_func_end sub_08140E34

	thumb_func_start sub_08141034
sub_08141034: @ 0x08141034
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_080EF7A8
	ldr r0, _08141054
	ldr r1, [r0]
	movs r0, #0xff
	strh r0, [r1, #0x28]
	ldrb r2, [r1, #0x19]
	cmp r2, #1
	bne _08141058
	adds r0, r1, #0
	adds r0, #0x23
	strb r2, [r0]
	b _0814105E
	.align 2, 0
_08141054: .4byte 0x0203A854
_08141058:
	adds r1, #0x23
	movs r0, #0
	strb r0, [r1]
_0814105E:
	ldr r0, _08141080
	ldr r0, [r0]
	adds r0, #0x21
	movs r1, #0
	strb r1, [r0]
	ldr r1, _08141084
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x20
	strh r1, [r0, #0xa]
	ldr r1, _08141088
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141080: .4byte 0x0203A854
_08141084: .4byte 0x03005B60
_08141088: .4byte 0x081411C5
	thumb_func_end sub_08141034

	thumb_func_start sub_0814108C
sub_0814108C: @ 0x0814108C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _081410FC
	ldr r2, [r4]
	ldrb r1, [r2, #0x1a]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r2, #0x1b
	adds r2, r2, r1
	ldr r3, _08141100
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r5, r1, r3
	ldrh r0, [r5, #0x10]
	strb r0, [r2]
	ldr r1, [r4]
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r1, #0x1b
	adds r1, r1, r0
	ldrb r0, [r1]
	bl sub_08142820
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xc]
	ldr r1, [r4]
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r1, #0x1b
	adds r1, r1, r0
	ldrb r0, [r1]
	bl sub_0814379C
	ldr r0, [r4]
	ldrb r1, [r0, #0x19]
	ldrh r0, [r5, #0x22]
	subs r0, r0, r1
	strh r0, [r5, #0x22]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _081410EC
	movs r0, #0
	strh r0, [r5, #0x22]
_081410EC:
	ldrh r0, [r5, #0x22]
	bl sub_081435E0
	ldr r0, _08141104
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081410FC: .4byte 0x0203A854
_08141100: .4byte 0x03005B60
_08141104: .4byte 0x08141035
	thumb_func_end sub_0814108C

	thumb_func_start sub_08141108
sub_08141108: @ 0x08141108
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl sub_08140E34
	ldr r1, _08141130
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0x1e
	beq _0814113E
	cmp r0, #0x1e
	bgt _08141134
	cmp r0, #0
	beq _0814113A
	b _08141152
	.align 2, 0
_08141130: .4byte 0x03005B60
_08141134:
	cmp r0, #0x3b
	beq _0814114C
	b _08141152
_0814113A:
	ldrb r0, [r4, #0x10]
	b _08141140
_0814113E:
	movs r0, #0
_08141140:
	bl sub_08140A80
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	b _08141162
_0814114C:
	movs r0, #0
	strh r0, [r4, #0xa]
	b _08141162
_08141152:
	ldr r0, _081411A0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
_08141162:
	ldr r0, _081411A4
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081411BA
	ldr r0, _081411A8
	ldr r3, [r0]
	ldr r2, _081411AC
	ldr r1, _081411A0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r1, [r3, #8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _081411B0
	movs r0, #0x16
	bl PlaySE
	b _081411BA
	.align 2, 0
_081411A0: .4byte 0x03005B60
_081411A4: .4byte 0x03002360
_081411A8: .4byte 0x0203A854
_081411AC: .4byte 0x08595D00
_081411B0:
	movs r0, #0x5f
	bl m4aSongNumStart
	ldr r0, _081411C0
	str r0, [r4]
_081411BA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081411C0: .4byte 0x0814108D
	thumb_func_end sub_08141108

	thumb_func_start sub_081411C4
sub_081411C4: @ 0x081411C4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0814121C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #0xa]
	subs r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08141230
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _081411F0
	ldr r1, _08141220
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
_081411F0:
	ldr r0, _08141224
	ldr r1, [r0]
	ldrh r0, [r1, #0x26]
	adds r0, #4
	strh r0, [r1, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x68
	bne _08141248
	ldr r2, _08141228
	adds r0, r1, #0
	adds r0, #0x55
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _0814122C
	str r1, [r0]
	b _08141248
	.align 2, 0
_0814121C: .4byte 0x03005B60
_08141220: .4byte 0x02021B38
_08141224: .4byte 0x0203A854
_08141228: .4byte 0x020205AC
_0814122C: .4byte 0x08007141
_08141230:
	movs r0, #1
	movs r1, #0xff
	bl sub_08142F3C
	movs r0, #1
	movs r1, #0xff
	bl sub_08143104
	ldr r0, _08141250
	str r0, [r4]
	movs r0, #0
	strh r0, [r4, #0xa]
_08141248:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141250: .4byte 0x0814140D
	thumb_func_end sub_081411C4

	thumb_func_start sub_08141254
sub_08141254: @ 0x08141254
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08141270
	ldr r3, [r0]
	ldrb r2, [r3, #2]
	adds r5, r0, #0
	cmp r2, #2
	bgt _08141274
	cmp r2, #1
	bge _0814127A
	b _08141348
	.align 2, 0
_08141270: .4byte 0x0203A854
_08141274:
	cmp r2, #3
	beq _081412DC
	b _08141348
_0814127A:
	ldr r0, _081412A4
	ldrb r0, [r0, #2]
	subs r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _081412AC
	cmp r4, #0xb
	bls _08141294
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0814135E
_08141294:
	ldr r0, _081412A8
	ldrb r1, [r3, #4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x19
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	lsrs r0, r0, #1
	b _08141402
	.align 2, 0
_081412A4: .4byte 0x03005A50
_081412A8: .4byte 0x08595EF4
_081412AC:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081412C8
	ldr r0, _081412C4
	ldrb r1, [r3, #4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x19
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	lsrs r0, r0, #1
	b _08141402
	.align 2, 0
_081412C4: .4byte 0x08595EF4
_081412C8:
	ldr r0, _081412D8
	ldrb r1, [r3, #4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x19
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	b _08141402
	.align 2, 0
_081412D8: .4byte 0x08595EF4
_081412DC:
	ldr r0, _08141308
	ldrb r0, [r0, #2]
	subs r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bhi _08141310
	cmp r4, #5
	bls _081412F6
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0814135E
_081412F6:
	ldr r0, _0814130C
	ldrb r1, [r3, #4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x19
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	lsrs r0, r0, #1
	b _08141402
	.align 2, 0
_08141308: .4byte 0x03005A50
_0814130C: .4byte 0x08595EF4
_08141310:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08141330
	cmp r4, #6
	bls _08141330
	ldr r0, _0814132C
	ldrb r1, [r3, #4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x19
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	lsrs r0, r0, #2
	b _08141402
	.align 2, 0
_0814132C: .4byte 0x08595EF4
_08141330:
	ldr r1, _08141344
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #1
	b _08141402
	.align 2, 0
_08141344: .4byte 0x08595EF4
_08141348:
	ldr r0, _08141364
	ldrb r0, [r0, #2]
	subs r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _08141380
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08141368
_0814135E:
	movs r0, #1
	b _08141402
	.align 2, 0
_08141364: .4byte 0x03005A50
_08141368:
	ldr r1, _0814137C
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #1
	b _08141402
	.align 2, 0
_0814137C: .4byte 0x08595EF4
_08141380:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081413B8
	cmp r4, #0xc
	bls _081413A4
	ldr r1, _081413A0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #1
	b _08141402
	.align 2, 0
_081413A0: .4byte 0x08595EF4
_081413A4:
	ldr r1, _081413B4
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	b _08141402
	.align 2, 0
_081413B4: .4byte 0x08595EF4
_081413B8:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081413F0
	cmp r4, #0xc
	bls _081413DC
	ldr r1, _081413D8
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	b _08141402
	.align 2, 0
_081413D8: .4byte 0x08595EF4
_081413DC:
	ldr r1, _081413EC
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	b _08141402
	.align 2, 0
_081413EC: .4byte 0x08595EF4
_081413F0:
	ldr r1, _08141408
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
_08141402:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08141408: .4byte 0x08595EF4
	thumb_func_end sub_08141254

	thumb_func_start sub_0814140C
sub_0814140C: @ 0x0814140C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r4, #0
	ldr r1, _08141498
	mov r0, sp
	movs r2, #8
	bl memcpy
	bl Random
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r7, #0
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r3, _0814149C
	ldr r0, [r3]
	ldr r2, _081414A0
	mov r5, sl
	lsls r1, r5, #2
	add r1, sl
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r2, [r1, #0x14]
	adds r0, #0x7c
	strb r2, [r0]
	ldr r0, [r3]
	adds r2, r0, #0
	adds r2, #0x7f
	strb r4, [r2]
	subs r2, #1
	strb r4, [r2]
	adds r0, #0x7d
	strb r4, [r0]
	ldrh r0, [r1, #0x18]
	adds r1, r7, #0
	bl sub_08141254
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r1, r4, #0x18
	adds r0, r7, #0
	bl __modsi3
	lsrs r4, r4, #0x19
	subs r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081414A4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r5, #1
	cmp r0, #0xc
	bgt _08141490
	movs r5, #0
_08141490:
	cmp r6, #0x4f
	bhi _081414A8
	lsls r0, r5, #0x19
	b _081414B2
	.align 2, 0
_08141498: .4byte 0x08595FD6
_0814149C: .4byte 0x0203A854
_081414A0: .4byte 0x03005B60
_081414A4: .4byte 0x03005A50
_081414A8:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	movs r0, #1
	subs r0, r0, r1
	lsls r0, r0, #0x19
_081414B2:
	lsrs r5, r0, #0x18
	ldr r0, _081415F8
	ldr r6, [r0]
	ldrb r0, [r6, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	ldr r1, _081415FC
	adds r0, r0, r1
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	ldrh r0, [r0, #0x1a]
	adds r4, r4, r0
	adds r0, r6, #0
	adds r0, #0x80
	strh r4, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _081414E4
	ldr r1, _08141600
	bl __addsf3
_081414E4:
	ldr r1, _08141604
	bl __divsf3
	bl __fixunssfsi
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	movs r2, #0x82
	adds r2, r2, r6
	mov r8, r2
	strh r0, [r2]
	adds r0, r6, #0
	adds r0, #0x84
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	movs r0, #0x88
	adds r0, r0, r6
	mov sb, r0
	movs r0, #1
	ands r0, r7
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sp
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _08141530
	ldr r1, _08141600
	bl __addsf3
_08141530:
	mov r2, sb
	str r0, [r2]
	adds r7, r6, #0
	adds r7, #0x8c
	ldrb r0, [r6, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	ldr r5, _081415FC
	adds r0, r0, r5
	movs r1, #0x18
	ldrsh r4, [r0, r1]
	adds r0, r4, #0
	bl __floatsisf
	adds r5, r0, #0
	cmp r4, #0
	bge _0814155A
	ldr r1, _08141600
	bl __addsf3
	adds r5, r0, #0
_0814155A:
	str r5, [r7]
	adds r7, r6, #0
	adds r7, #0x90
	ldr r1, _08141608
	adds r0, r5, #0
	bl __mulsf3
	adds r1, r5, #0
	bl __subsf3
	adds r5, r0, #0
	mov r2, r8
	movs r0, #0
	ldrsh r4, [r2, r0]
	adds r0, r4, #0
	bl __floatsisf
	adds r2, r0, #0
	cmp r4, #0
	bge _0814158A
	ldr r1, _08141600
	bl __addsf3
	adds r2, r0, #0
_0814158A:
	adds r0, r5, #0
	adds r1, r2, #0
	bl __divsf3
	str r0, [r7]
	adds r1, r6, #0
	adds r1, #0x94
	ldr r0, _0814160C
	str r0, [r1]
	adds r1, #8
	ldr r0, _08141610
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x98
	mov r1, r8
	movs r2, #0
	ldrsh r4, [r1, r2]
	adds r0, r4, #0
	bl __floatsisf
	adds r2, r0, #0
	cmp r4, #0
	bge _081415C0
	ldr r1, _08141600
	bl __addsf3
	adds r2, r0, #0
_081415C0:
	ldr r0, _08141614
	adds r1, r2, #0
	bl __divsf3
	bl __negsf2
	str r0, [r5]
	adds r1, r6, #0
	adds r1, #0xa0
	ldr r0, _08141618
	str r0, [r1]
	ldr r1, _0814161C
	mov r5, sl
	lsls r0, r5, #2
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08141620
	str r1, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081415F8: .4byte 0x0203A854
_081415FC: .4byte 0x08595EF4
_08141600: .4byte 0x47800000
_08141604: .4byte 0x40A00000
_08141608: .4byte 0x3F000000
_0814160C: .4byte 0x42880000
_08141610: .4byte 0x00000000
_08141614: .4byte 0x41000000
_08141618: .4byte 0x42100000
_0814161C: .4byte 0x03005B60
_08141620: .4byte 0x08141625
	thumb_func_end sub_0814140C

	thumb_func_start sub_08141624
sub_08141624: @ 0x08141624
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _08141688
	ldr r3, [r4]
	ldrb r1, [r3, #3]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r3, #3]
	ldr r3, [r4]
	adds r2, r3, #0
	adds r2, #0x7c
	adds r1, r3, #0
	adds r1, #0x3c
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _0814168C
	adds r1, r1, r2
	str r1, [r3, #0x38]
	ldr r2, _08141690
	str r2, [r1, #0x1c]
	ldr r1, _08141694
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrh r1, [r4, #0x14]
	adds r1, #1
	strh r1, [r4, #0x14]
	ldrh r0, [r4, #0x18]
	adds r0, #1
	strh r0, [r4, #0x18]
	movs r0, #6
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081437F8
	movs r0, #0x5c
	bl m4aSongNumStart
	ldr r0, _08141698
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141688: .4byte 0x0203A854
_0814168C: .4byte 0x020205AC
_08141690: .4byte 0x08144779
_08141694: .4byte 0x03005B60
_08141698: .4byte 0x0814169D
	thumb_func_end sub_08141624

	thumb_func_start sub_0814169C
sub_0814169C: @ 0x0814169C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _081416D8
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0814178E
	ldrb r1, [r3, #3]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081416DC
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0814178E
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #3]
	ldr r2, [r6]
	ldrb r1, [r2, #3]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #3]
	b _0814178E
	.align 2, 0
_081416D8: .4byte 0x0203A854
_081416DC:
	ldr r2, _08141750
	lsls r1, r4, #2
	adds r0, r1, r4
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	adds r7, r1, #0
	cmp r0, #0
	bne _08141728
	adds r0, r3, #0
	adds r0, #0x7e
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_08142198
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [r6]
	ldrb r1, [r2, #0x1a]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r2, #0x1b
	adds r2, r2, r1
	ldrb r1, [r2]
	bl sub_081422B0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x12]
	cmp r0, #1
	bne _08141728
	ldr r0, [r6]
	adds r0, #0xb8
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_08151A24
_08141728:
	ldr r0, _08141750
	adds r1, r7, r4
	lsls r1, r1, #3
	adds r4, r1, r0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0x3c
	bgt _08141758
	ldr r0, _08141754
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08141748
	movs r0, #0x3c
	strh r0, [r4, #0xa]
_08141748:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	b _0814178E
	.align 2, 0
_08141750: .4byte 0x03005B60
_08141754: .4byte 0x03002360
_08141758:
	ldr r0, _08141794
	ldr r1, [r0]
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r1, #0x1b
	adds r1, r1, r0
	ldrb r0, [r1]
	bl sub_081425C4
	ldrh r1, [r4, #0x20]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_08142F3C
	ldrb r1, [r4, #0x14]
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_08143104
	movs r0, #0x20
	strh r0, [r4, #0xa]
	ldr r0, _08141798
	str r0, [r4]
_0814178E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141794: .4byte 0x0203A854
_08141798: .4byte 0x0814179D
	thumb_func_end sub_0814169C

	thumb_func_start sub_0814179C
sub_0814179C: @ 0x0814179C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _081417F4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0xa]
	subs r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08141808
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _081417C8
	ldr r1, _081417F8
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
_081417C8:
	ldr r0, _081417FC
	ldr r1, [r0]
	ldrh r0, [r1, #0x26]
	subs r0, #4
	strh r0, [r1, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x68
	bne _08141830
	ldr r2, _08141800
	adds r0, r1, #0
	adds r0, #0x55
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08141804
	str r1, [r0]
	b _08141830
	.align 2, 0
_081417F4: .4byte 0x03005B60
_081417F8: .4byte 0x02021B38
_081417FC: .4byte 0x0203A854
_08141800: .4byte 0x020205AC
_08141804: .4byte 0x081439D9
_08141808:
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0814321C
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _0814181E
	movs r0, #0x79
	b _08141820
_0814181E:
	movs r0, #0x3d
_08141820:
	strh r0, [r4, #0xa]
	ldr r0, _08141838
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0814183C
	str r0, [r1]
_08141830:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141838: .4byte 0x03005B60
_0814183C: .4byte 0x08141841
	thumb_func_end sub_0814179C

	thumb_func_start sub_08141840
sub_08141840: @ 0x08141840
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08141890
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0xa]
	subs r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _081418B0
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _0814186A
	adds r0, #0xf
_0814186A:
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _08141894
	cmp r0, #8
	bne _081418BC
	movs r0, #0
	movs r1, #0xff
	bl sub_08142F3C
	movs r0, #0
	movs r1, #0xff
	bl sub_08143104
	b _081418BC
	.align 2, 0
_08141890: .4byte 0x03005B60
_08141894:
	ldrh r1, [r4, #0x20]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_08142F3C
	ldrb r1, [r4, #0x14]
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_08143104
	b _081418BC
_081418B0:
	ldr r1, _081418C4
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0
	bl sub_08142044
_081418BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081418C4: .4byte 0x08141965
	thumb_func_end sub_08141840

	thumb_func_start sub_081418C8
sub_081418C8: @ 0x081418C8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08141920
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0814192C
	cmp r0, #0
	blt _0814192C
	cmp r0, #2
	bgt _0814192C
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08141950
	movs r0, #0x1d
	bl GetGameStat
	ldrh r1, [r4, #0x1e]
	adds r1, #1
	strh r1, [r4, #0x1e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bhs _08141910
	movs r0, #0x1e
	ldrsh r1, [r4, r0]
	movs r0, #0x1d
	bl SetGameStat
_08141910:
	ldr r1, _08141924
	ldr r2, _08141928
	adds r0, r5, #0
	movs r3, #3
	bl sub_08142044
	b _08141950
	.align 2, 0
_08141920: .4byte 0x03005B60
_08141924: .4byte 0x08141AE1
_08141928: .4byte 0x0000FFFF
_0814192C:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08141950
	ldr r1, _08141958
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r2, [r0, #0x1e]
	ldr r1, _0814195C
	ldr r2, _08141960
	adds r0, r5, #0
	movs r3, #3
	bl sub_08142044
_08141950:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141958: .4byte 0x03005B60
_0814195C: .4byte 0x08141B89
_08141960: .4byte 0x0000FFFF
	thumb_func_end sub_081418C8

	thumb_func_start sub_08141964
sub_08141964: @ 0x08141964
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _081419A4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0x12
	ldrsh r1, [r0, r2]
	cmp r1, #0
	beq _081419F0
	cmp r1, #0
	blt _081419F0
	cmp r1, #2
	bgt _081419F0
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	cmp r0, #0xc
	bne _081419B4
	ldr r0, _081419A8
	bl PlayFanfare
	ldr r4, _081419AC
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	ldr r2, _081419B0
	b _081419CA
	.align 2, 0
_081419A4: .4byte 0x03005B60
_081419A8: .4byte 0x00000185
_081419AC: .4byte 0x0203A858
_081419B0: .4byte 0x08262D6C
_081419B4:
	movs r0, #0xc3
	lsls r0, r0, #1
	bl PlayFanfare
	ldr r4, _081419E8
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	ldr r2, _081419EC
_081419CA:
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	b _08141A20
	.align 2, 0
_081419E8: .4byte 0x0203A858
_081419EC: .4byte 0x08262D66
_081419F0:
	movs r0, #0x20
	bl m4aSongNumStart
	ldr r4, _08141A3C
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	ldr r2, _08141A40
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
_08141A20:
	ldr r1, _08141A44
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xa]
	ldr r1, _08141A48
	str r1, [r0]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141A3C: .4byte 0x0203A858
_08141A40: .4byte 0x08262D74
_08141A44: .4byte 0x03005B60
_08141A48: .4byte 0x081418C9
	thumb_func_end sub_08141964

	thumb_func_start sub_08141A4C
sub_08141A4C: @ 0x08141A4C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08141A70
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #0x16
	ldrsh r5, [r4, r0]
	cmp r5, #0
	beq _08141A74
	cmp r5, #3
	beq _08141AA4
	ldrh r0, [r4, #0x16]
	adds r0, #1
	b _08141AAC
	.align 2, 0
_08141A70: .4byte 0x03005B60
_08141A74:
	ldrh r0, [r4, #0x22]
	adds r0, #1
	strh r0, [r4, #0x22]
	movs r0, #0x15
	bl m4aSongNumStart
	ldrh r0, [r4, #0x22]
	bl sub_081435E0
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	ldr r0, _08141A94
	cmp r1, r0
	ble _08141A98
	strh r5, [r4, #0xa]
	b _08141AAE
	.align 2, 0
_08141A94: .4byte 0x0000270E
_08141A98:
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0x16]
	adds r0, #1
	b _08141AAC
_08141AA4:
	movs r0, #0x15
	bl m4aSongNumStop
	movs r0, #0
_08141AAC:
	strh r0, [r4, #0x16]
_08141AAE:
	ldr r0, _08141AD4
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08141ACC
	ldr r1, _08141AD8
	ldr r2, _08141ADC
	adds r0, r6, #0
	movs r3, #3
	bl sub_08142044
_08141ACC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08141AD4: .4byte 0x03005B60
_08141AD8: .4byte 0x08141B89
_08141ADC: .4byte 0x0000FFFF
	thumb_func_end sub_08141A4C

	thumb_func_start sub_08141AE0
sub_08141AE0: @ 0x08141AE0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08141B6C
	ldr r1, _08141B70
	mov sb, r1
	ldr r1, [r1]
	ldrb r2, [r1, #0x19]
	ldr r1, _08141B74
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	adds r1, r2, #0
	muls r1, r0, r1
	adds r0, r3, #0
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r2, _08141B78
	mov r8, r2
	ldr r1, _08141B7C
	mov r0, r8
	bl StringExpandPlaceholders
	ldr r5, _08141B80
	ldrb r0, [r5]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r5]
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r6, #0
	str r6, [sp, #8]
	movs r1, #1
	mov r2, r8
	movs r3, #2
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	movs r1, #3
	bl CopyWindowToVram
	mov r1, sb
	ldr r0, [r1]
	ldrb r1, [r0, #0x19]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	strh r0, [r4, #0xa]
	strh r6, [r4, #0x16]
	ldr r0, _08141B84
	str r0, [r4]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08141B6C: .4byte 0x02021C40
_08141B70: .4byte 0x0203A854
_08141B74: .4byte 0x03005B60
_08141B78: .4byte 0x02021C7C
_08141B7C: .4byte 0x08262D79
_08141B80: .4byte 0x0203A858
_08141B84: .4byte 0x08141A4D
	thumb_func_end sub_08141AE0

	thumb_func_start sub_08141B88
sub_08141B88: @ 0x08141B88
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _08141C08
	ldr r0, [r5]
	adds r0, #0xb8
	ldr r1, _08141C0C
	bl sub_08151A78
	ldr r6, [r5]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r3, r6, r0
	ldrb r2, [r3]
	movs r1, #0x7f
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	movs r0, #0xb2
	lsls r0, r0, #1
	adds r3, r6, r0
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	movs r0, #0xac
	lsls r0, r0, #1
	adds r2, r6, r0
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldr r6, _08141C10
	ldr r2, [r5]
	ldr r5, _08141C14
	ldr r0, _08141C18
	lsls r3, r4, #2
	adds r3, r3, r4
	lsls r3, r3, #3
	adds r3, r3, r0
	movs r0, #0x20
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0]
	adds r2, r2, r0
	adds r2, #0x43
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _08141C1C
	str r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08141C08: .4byte 0x0203A854
_08141C0C: .4byte 0x0000FFFF
_08141C10: .4byte 0x020205AC
_08141C14: .4byte 0x08595D00
_08141C18: .4byte 0x03005B60
_08141C1C: .4byte 0x08141C21
	thumb_func_end sub_08141B88

	thumb_func_start sub_08141C20
sub_08141C20: @ 0x08141C20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	ldr r1, _08141D00
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	strh r5, [r0, #0x10]
	ldr r4, _08141D04
	ldr r1, [r4]
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r1, #0x1b
	adds r1, r1, r0
	strb r2, [r1]
	movs r0, #0
	bl sub_081425C4
	ldr r3, _08141D08
	ldr r0, [r4]
	adds r0, #0x6c
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	adds r7, r3, #0
	movs r0, #8
	adds r0, r0, r7
	mov ip, r0
	ldr r1, _08141D0C
	mov r8, r1
_08141C78:
	ldr r0, _08141D04
	ldr r4, [r0]
	adds r0, r4, r5
	adds r0, #0x65
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r7
	adds r2, r3, #0
	adds r2, #0x40
	add r0, ip
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r1, r2
	ldr r2, _08141D10
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #4]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08141C78
	ldr r0, _08141D00
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r2, r1, r0
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	ldrb r4, [r4, #0x19]
	cmp r0, r4
	blt _08141D84
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #6
	bne _08141D20
	ldr r4, _08141D14
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	ldr r2, _08141D18
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _08141D1C
	b _08141D56
	.align 2, 0
_08141D00: .4byte 0x03005B60
_08141D04: .4byte 0x0203A854
_08141D08: .4byte 0x020205AC
_08141D0C: .4byte 0xFFFFFC00
_08141D10: .4byte 0x000003FF
_08141D14: .4byte 0x0203A858
_08141D18: .4byte 0x08262DB0
_08141D1C: .4byte 0x08141DD5
_08141D20:
	movs r0, #0x22
	ldrsh r1, [r2, r0]
	ldr r0, _08141D64
	cmp r1, r0
	bne _08141D78
	ldr r4, _08141D68
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	ldr r2, _08141D6C
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _08141D70
_08141D56:
	ldr r2, _08141D74
	adds r0, r6, #0
	movs r3, #3
	bl sub_08142044
	b _08141DBA
	.align 2, 0
_08141D64: .4byte 0x0000270F
_08141D68: .4byte 0x0203A858
_08141D6C: .4byte 0x08262DD5
_08141D70: .4byte 0x081409DD
_08141D74: .4byte 0x0000FFFF
_08141D78:
	ldr r0, _08141D80
	str r0, [r2]
	b _08141DBA
	.align 2, 0
_08141D80: .4byte 0x081409DD
_08141D84:
	ldr r4, _08141DC8
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	ldr r2, _08141DCC
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _08141DD0
	adds r0, r6, #0
	movs r2, #0x3c
	movs r3, #3
	bl sub_08142044
_08141DBA:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141DC8: .4byte 0x0203A858
_08141DCC: .4byte 0x08262D96
_08141DD0: .4byte 0x08140A5D
	thumb_func_end sub_08141C20

	thumb_func_start dp01t_12_3_battle_menu
dp01t_12_3_battle_menu: @ 0x08141DD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r1, _08141E7C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #0x14]
	adds r0, r5, #0
	bl sub_081420BC
	bl sub_08142138
	bl sub_08143B0C
	movs r0, #0
	bl sub_081425C4
	movs r0, #6
	bl sub_081437F8
	ldr r7, _08141E80
	ldr r3, _08141E84
	movs r6, #5
	rsbs r6, r6, #0
_08141E0C:
	ldr r0, [r3]
	adds r0, r0, r4
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	bls _08141E0C
	ldr r1, _08141E7C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r0, #0x22
	ldrsh r1, [r2, r0]
	ldr r0, _08141E88
	cmp r1, r0
	bne _08141E9C
	ldr r4, _08141E8C
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	ldr r2, _08141E90
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _08141E94
	ldr r2, _08141E98
	adds r0, r5, #0
	movs r3, #3
	bl sub_08142044
	b _08141EA0
	.align 2, 0
_08141E7C: .4byte 0x03005B60
_08141E80: .4byte 0x020205AC
_08141E84: .4byte 0x0203A854
_08141E88: .4byte 0x0000270F
_08141E8C: .4byte 0x0203A858
_08141E90: .4byte 0x08262DD5
_08141E94: .4byte 0x081409DD
_08141E98: .4byte 0x0000FFFF
_08141E9C:
	ldr r0, _08141EA8
	str r0, [r2]
_08141EA0:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141EA8: .4byte 0x081409DD
	thumb_func_end dp01t_12_3_battle_menu

	thumb_func_start sub_08141EAC
sub_08141EAC: @ 0x08141EAC
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _08141EF0
	ldr r0, [r4]
	adds r0, #0xb8
	ldr r1, _08141EF4
	bl sub_08151A78
	ldr r0, [r4]
	adds r0, #0xb8
	bl sub_08151654
	ldr r1, _08141EF8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #0x22]
	bl SetCoins
	bl GetCoins
	ldr r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #0x19]
	cmp r0, r1
	bhs _08141F00
	ldr r1, _08141EFC
	movs r0, #1
	b _08141F04
	.align 2, 0
_08141EF0: .4byte 0x0203A854
_08141EF4: .4byte 0x0000FFFF
_08141EF8: .4byte 0x03005B60
_08141EFC: .4byte 0x02037280
_08141F00:
	ldr r1, _08141F38
	movs r0, #0
_08141F04:
	strh r0, [r1]
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AlertTVOfNewCoinTotal
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginHardwarePaletteFade
	ldr r1, _08141F3C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08141F40
	str r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141F38: .4byte 0x02037280
_08141F3C: .4byte 0x03005B60
_08141F40: .4byte 0x08141F45
	thumb_func_end sub_08141EAC

	thumb_func_start sub_08141F44
sub_08141F44: @ 0x08141F44
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08141FA6
	movs r0, #0
	bl SetVBlankCallback
	ldr r1, _08141FAC
	ldr r0, _08141FB0
	strh r4, [r0]
	strh r4, [r1]
	bl ResetVramOamAndBgCntRegs
	bl ResetAllBgsCoordinates
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl sub_081404E0
	ldr r1, _08141FB4
	ldr r0, _08141FB8
	str r0, [r1]
	ldr r0, _08141FBC
	bl SetMainCallback2
	adds r0, r5, #0
	bl DestroyTask
_08141FA6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141FAC: .4byte 0x02021B38
_08141FB0: .4byte 0x02021B3A
_08141FB4: .4byte 0x03005B0C
_08141FB8: .4byte 0x080AEA65
_08141FBC: .4byte 0x08085A31
	thumb_func_end sub_08141F44

	thumb_func_start sub_08141FC0
sub_08141FC0: @ 0x08141FC0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08142034
	ldr r3, [r1]
	adds r0, r3, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _08141FE6
	ldr r0, _08142038
	adds r2, r3, #0
	adds r2, #0xaa
	ldrh r1, [r0, #0x2e]
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0814201A
_08141FE6:
	ldr r1, _0814203C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0xac
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0xaa
	ldrh r0, [r0]
	cmp r0, #0
	beq _08142008
	movs r0, #5
	bl PlaySE
_08142008:
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0xac
	movs r1, #0
	str r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
_0814201A:
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0xa8
	ldrh r2, [r1]
	ldr r0, _08142040
	cmp r2, r0
	beq _0814202C
	subs r0, r2, #1
	strh r0, [r1]
_0814202C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142034: .4byte 0x0203A854
_08142038: .4byte 0x03002360
_0814203C: .4byte 0x03005B60
_08142040: .4byte 0x0000FFFF
	thumb_func_end sub_08141FC0

	thumb_func_start sub_08142044
sub_08142044: @ 0x08142044
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r2, _08142094
	ldr r0, [r2]
	mov ip, r0
	mov r3, ip
	adds r3, #0xb4
	ldr r1, _08142098
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3]
	adds r3, r1, #0
	cmp r5, #0
	bne _08142074
	adds r5, r0, #0
_08142074:
	mov r0, ip
	adds r0, #0xac
	str r5, [r0]
	subs r0, #4
	strh r4, [r0]
	ldr r0, _0814209C
	cmp r4, r0
	bne _081420A0
	cmp r7, #0
	bne _081420A0
	mov r1, ip
	adds r1, #0xaa
	ldrh r0, [r1]
	orrs r4, r0
	strh r4, [r1]
	b _081420A6
	.align 2, 0
_08142094: .4byte 0x0203A854
_08142098: .4byte 0x03005B60
_0814209C: .4byte 0x0000FFFF
_081420A0:
	ldr r0, [r2]
	adds r0, #0xaa
	strh r7, [r0]
_081420A6:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r1, _081420B8
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081420B8: .4byte 0x08141FC1
	thumb_func_end sub_08142044

	thumb_func_start sub_081420BC
sub_081420BC: @ 0x081420BC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r3, _08142130
	ldr r0, [r3]
	strb r4, [r0]
	ldr r2, [r3]
	ldrb r1, [r2, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #3]
	ldr r2, [r3]
	ldrb r1, [r2, #3]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #3]
	ldr r2, [r3]
	ldrb r1, [r2, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #3]
	ldr r2, [r3]
	ldrb r1, [r2, #3]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #3]
	ldr r6, _08142134
	adds r2, r3, #0
	movs r1, #0
_081420FE:
	ldr r0, [r2]
	adds r0, #0x1b
	adds r0, r0, r4
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _081420FE
	ldr r2, [r3]
	ldrb r1, [r2, #0x1a]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x1a]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r1, #0
	strh r1, [r0, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08142130: .4byte 0x0203A854
_08142134: .4byte 0x03005B60
	thumb_func_end sub_081420BC

	thumb_func_start sub_08142138
sub_08142138: @ 0x08142138
	push {lr}
	ldr r2, _08142194
	ldr r1, [r2]
	movs r0, #0
	str r0, [r1, #8]
	movs r1, #0
	movs r3, #0
_08142146:
	ldr r0, [r2]
	adds r0, #0xc
	adds r0, r0, r1
	strb r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #5
	bls _08142146
	movs r1, #0
	ldr r3, _08142194
	movs r2, #0
_0814215E:
	ldr r0, [r3]
	adds r0, #0x12
	adds r0, r0, r1
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _0814215E
	movs r1, #0
	ldr r3, _08142194
	movs r2, #0
_08142176:
	ldr r0, [r3]
	adds r0, #0x16
	adds r0, r0, r1
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	bls _08142176
	movs r0, #1
	movs r1, #0xff
	bl sub_08143104
	pop {r0}
	bx r0
	.align 2, 0
_08142194: .4byte 0x0203A854
	thumb_func_end sub_08142138

	thumb_func_start sub_08142198
sub_08142198: @ 0x08142198
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	mov r1, sp
	ldr r0, _081421CC
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, #0x10
	adds r1, r2, #0
	ldr r0, _081421D0
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	mov r8, r2
	cmp r5, #0xb
	bls _081421D4
	movs r0, #0
	b _08142290
	.align 2, 0
_081421CC: .4byte 0x08595FE0
_081421D0: .4byte 0x08595FF0
_081421D4:
	ldr r6, _081422A0
	ldr r3, [r6]
	ldr r1, _081422A4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r7, #0x14
	ldrsh r1, [r0, r7]
	adds r3, r3, r1
	ldr r4, _081422A8
	lsls r5, r5, #3
	adds r2, r5, r4
	ldrb r1, [r2, #2]
	strb r1, [r3, #0xb]
	ldrb r1, [r2, #2]
	strh r1, [r0, #0x20]
	ldr r2, [r6]
	adds r0, r4, #4
	adds r0, r5, r0
	ldr r1, [r2, #8]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2, #8]
	movs r3, #0
	mov sb, r4
	mov ip, r5
	adds r5, r0, #0
_0814220C:
	lsls r0, r3, #2
	mov r1, sp
	adds r4, r1, r0
	ldr r0, [r4]
	ands r0, r5
	cmp r0, #0
	beq _08142226
	ldr r1, [r6]
	adds r1, #0x12
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08142226:
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #2
	bls _0814223C
	ldr r0, [r2, #8]
	ldr r1, [r4]
	orrs r0, r1
	str r0, [r2, #8]
_0814223C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0814220C
	movs r6, #0
	ldr r0, _081422AC
	add r0, ip
	ldr r7, [r0]
	ldr r4, _081422A0
	mov r5, r8
_08142252:
	lsls r0, r6, #2
	adds r2, r5, r0
	ldr r0, [r2]
	ands r0, r7
	cmp r0, #0
	beq _0814226A
	ldr r1, [r4]
	adds r1, #0x16
	adds r1, r1, r6
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0814226A:
	ldr r3, [r4]
	adds r0, r3, #0
	adds r0, #0x16
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #3
	bls _08142280
	ldr r0, [r3, #8]
	ldr r1, [r2]
	orrs r0, r1
	str r0, [r3, #8]
_08142280:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _08142252
	mov r0, ip
	add r0, sb
	ldrb r0, [r0, #2]
_08142290:
	add sp, #0x1c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081422A0: .4byte 0x0203A854
_081422A4: .4byte 0x03005B60
_081422A8: .4byte 0x08595E90
_081422AC: .4byte 0x08595E94
	thumb_func_end sub_08142198

	thumb_func_start sub_081422B0
sub_081422B0: @ 0x081422B0
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #0x12
	bhi _08142344
	cmp r2, #0xf
	bhi _08142340
	lsls r0, r2, #2
	ldr r1, _081422D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081422D4: .4byte 0x081422D8
_081422D8: @ jump table
	.4byte _08142318 @ case 0
	.4byte _0814231C @ case 1
	.4byte _0814231C @ case 2
	.4byte _0814231C @ case 3
	.4byte _0814231C @ case 4
	.4byte _08142330 @ case 5
	.4byte _08142340 @ case 6
	.4byte _08142340 @ case 7
	.4byte _08142340 @ case 8
	.4byte _08142340 @ case 9
	.4byte _08142330 @ case 10
	.4byte _08142340 @ case 11
	.4byte _08142340 @ case 12
	.4byte _08142340 @ case 13
	.4byte _08142340 @ case 14
	.4byte _08142330 @ case 15
_08142318:
	movs r0, #3
	b _08142346
_0814231C:
	adds r0, r2, #5
	cmp r3, r0
	beq _0814233C
	adds r0, #5
	cmp r3, r0
	beq _0814233C
	adds r0, #5
	cmp r3, r0
	bne _08142344
	b _0814233C
_08142330:
	adds r0, r2, #1
	cmp r3, r0
	blt _08142344
	adds r0, r2, #4
	cmp r3, r0
	bgt _08142344
_0814233C:
	movs r0, #1
	b _08142346
_08142340:
	cmp r3, r2
	beq _0814233C
_08142344:
	movs r0, #0
_08142346:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081422B0

	thumb_func_start sub_0814234C
sub_0814234C: @ 0x0814234C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0
	str r0, [sp, #0x18]
	cmp r7, #0xa
	beq _08142372
	cmp r7, #0xa
	bgt _0814236E
	cmp r7, #5
	beq _08142372
	b _081423D4
_0814236E:
	cmp r7, #0xf
	bne _081423D4
_08142372:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r2, r7, #5
	ldr r1, _081423C8
	mov ip, r1
	cmp r4, r2
	bge _081423B0
	ldr r0, [r1]
	ldr r3, _081423CC
	ldr r5, [r0, #8]
	adds r6, r3, #0
	adds r6, #8
_0814238C:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r1, r0, #2
	adds r0, r1, r6
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	bne _081423A6
	adds r0, r1, r3
	ldrh r0, [r0, #0x10]
	ldr r1, [sp, #0x18]
	orrs r1, r0
	str r1, [sp, #0x18]
_081423A6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r2
	blt _0814238C
_081423B0:
	mov r2, ip
	ldr r0, [r2]
	adds r0, #0xb8
	ldr r1, _081423D0
	ldr r3, [sp, #0x18]
	ands r3, r1
	str r3, [sp, #0x18]
	adds r1, r3, #0
	bl sub_08151A24
	b _081425AA
	.align 2, 0
_081423C8: .4byte 0x0203A854
_081423CC: .4byte 0x08595D00
_081423D0: .4byte 0x0000DFFF
_081423D4:
	mov r0, sp
	ldr r1, _08142424
	ldm r1!, {r2, r4, r5}
	stm r0!, {r2, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r0!, {r3, r4, r5}
	subs r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	mov sb, r1
	cmp r0, #3
	bhi _081423F2
	movs r2, #3
	mov sb, r2
_081423F2:
	adds r0, r7, #0
	movs r1, #5
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	ldr r3, _08142428
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r7, #0
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _08142458
	cmp r0, #2
	bgt _08142430
	cmp r0, #1
	beq _08142444
	ldr r4, _0814242C
	mov ip, r4
	b _0814249C
	.align 2, 0
_08142424: .4byte 0x08595F9C
_08142428: .4byte 0xFFFF0000
_0814242C: .4byte 0x0203A854
_08142430:
	cmp r0, #3
	beq _0814246C
	cmp r0, #4
	beq _08142480
	ldr r5, _08142440
	mov ip, r5
	b _0814249C
	.align 2, 0
_08142440: .4byte 0x0203A854
_08142444:
	ldr r3, _08142450
	ldr r2, _08142454
	ldr r0, [r2]
	adds r0, #0x43
	b _08142488
	.align 2, 0
_08142450: .4byte 0x020205AC
_08142454: .4byte 0x0203A854
_08142458:
	ldr r3, _08142464
	ldr r2, _08142468
	ldr r0, [r2]
	adds r0, #0x44
	b _08142488
	.align 2, 0
_08142464: .4byte 0x020205AC
_08142468: .4byte 0x0203A854
_0814246C:
	ldr r3, _08142478
	ldr r2, _0814247C
	ldr r0, [r2]
	adds r0, #0x45
	b _08142488
	.align 2, 0
_08142478: .4byte 0x020205AC
_0814247C: .4byte 0x0203A854
_08142480:
	ldr r3, _081424EC
	ldr r2, _081424F0
	ldr r0, [r2]
	adds r0, #0x46
_08142488:
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	mov r8, r0
	mov ip, r2
_0814249C:
	mov r0, sb
	cmp r0, #1
	bne _081424F8
	mov r1, ip
	ldr r4, [r1]
	ldr r1, _081424F4
	lsls r2, r7, #2
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r1, [r4, #8]
	ldr r0, [r0]
	ands r1, r0
	str r2, [sp, #0x1c]
	cmp r1, #0
	bne _081425AA
	adds r0, r7, #0
	movs r1, #5
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r1, r0, #1
	lsls r1, r1, #3
	mov r3, sp
	adds r2, r3, r1
	ldrh r1, [r2, #2]
	add r1, r8
	strh r1, [r2, #2]
	adds r1, r4, #0
	adds r1, #0xb8
	lsls r0, r0, #3
	subs r0, #8
	adds r2, r3, r0
	adds r0, r1, #0
	movs r1, #0xd
	bl sub_08151668
	b _0814258C
	.align 2, 0
_081424EC: .4byte 0x020205AC
_081424F0: .4byte 0x0203A854
_081424F4: .4byte 0x08595D00
_081424F8:
	movs r4, #0
	lsls r5, r7, #2
	str r5, [sp, #0x1c]
	ldr r0, _081425BC
	mov sl, r0
_08142502:
	lsls r0, r4, #2
	adds r0, r0, r4
	adds r0, r7, r0
	adds r0, #5
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r1, ip
	ldr r5, [r1]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r6, r0, #2
	mov r0, sl
	adds r0, #8
	adds r0, r6, r0
	ldr r1, [r5, #8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08142578
	adds r0, r3, #0
	movs r1, #5
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r1, r0, #1
	lsls r1, r1, #3
	mov r3, sp
	adds r2, r3, r1
	ldrh r1, [r2, #2]
	add r1, r8
	strh r1, [r2, #2]
	adds r3, r5, #0
	adds r3, #0xb8
	adds r1, r4, #0
	adds r1, #0xd
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r0, #3
	subs r0, #8
	mov r5, sp
	adds r2, r5, r0
	adds r0, r3, #0
	bl sub_08151668
	mov r0, sb
	cmp r0, #3
	bne _0814256A
	mov r1, sl
	adds r0, r6, r1
	ldrh r0, [r0, #0x10]
	str r0, [sp, #0x18]
_0814256A:
	mov r0, sb
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r2, _081425C0
	mov ip, r2
_08142578:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08142502
	mov r3, sb
	cmp r3, #2
	beq _0814258C
	movs r4, #0
	str r4, [sp, #0x18]
_0814258C:
	ldr r0, _081425C0
	ldr r0, [r0]
	adds r0, #0xb8
	ldr r2, _081425BC
	ldr r5, [sp, #0x1c]
	adds r1, r5, r7
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r1, [r1, #0x10]
	ldr r2, [sp, #0x18]
	orrs r2, r1
	str r2, [sp, #0x18]
	adds r1, r2, #0
	bl sub_08151A24
_081425AA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081425BC: .4byte 0x08595D00
_081425C0: .4byte 0x0203A854
	thumb_func_end sub_0814234C

	thumb_func_start sub_081425C4
sub_081425C4: @ 0x081425C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _08142610
	ldr r1, [r4]
	movs r0, #1
	strh r0, [r1, #0x2a]
	movs r0, #0
	movs r1, #0
	bl sub_08142F3C
	ldr r1, [r4]
	ldr r2, _08142614
	adds r0, r1, r2
	ldr r2, _08142618
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x10
	str r2, [sp]
	movs r2, #0xd
	str r2, [sp, #4]
	movs r2, #0xe
	movs r3, #7
	bl sub_08152034
	cmp r5, #0xf
	bhi _081426C4
	lsls r0, r5, #2
	ldr r1, _0814261C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08142610: .4byte 0x0203A854
_08142614: .4byte 0x0000117C
_08142618: .4byte 0x0000397C
_0814261C: .4byte 0x08142620
_08142620: @ jump table
	.4byte _08142800 @ case 0
	.4byte _08142660 @ case 1
	.4byte _08142660 @ case 2
	.4byte _08142660 @ case 3
	.4byte _08142660 @ case 4
	.4byte _08142694 @ case 5
	.4byte _081426C4 @ case 6
	.4byte _081426C4 @ case 7
	.4byte _081426C4 @ case 8
	.4byte _081426C4 @ case 9
	.4byte _08142694 @ case 10
	.4byte _081426C4 @ case 11
	.4byte _081426C4 @ case 12
	.4byte _081426C4 @ case 13
	.4byte _081426C4 @ case 14
	.4byte _08142694 @ case 15
_08142660:
	movs r0, #4
	str r0, [sp, #0x18]
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1]
	adds r0, r1, #0
	ldrb r0, [r0]
	cmp r0, #3
	bhi _081426CC
	add r4, sp, #0x10
	adds r3, r1, #0
_08142676:
	ldrb r2, [r3]
	adds r2, r2, r4
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	strb r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrb r0, [r3]
	ldr r1, [sp, #0x18]
	cmp r0, r1
	blo _08142676
	b _081426CC
_08142694:
	movs r2, #5
	str r2, [sp, #0x18]
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1]
	adds r0, r1, #0
	ldrb r0, [r0]
	cmp r0, #4
	bhi _081426CC
	add r3, sp, #0x10
	adds r2, r1, #0
_081426AA:
	ldrb r1, [r2]
	adds r1, r1, r3
	ldrb r0, [r2]
	adds r0, r5, r0
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	ldr r1, [sp, #0x18]
	cmp r0, r1
	blo _081426AA
	b _081426CC
_081426C4:
	movs r2, #1
	str r2, [sp, #0x18]
	add r0, sp, #0x10
	strb r5, [r0]
_081426CC:
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1]
	adds r0, r1, #0
	ldrb r0, [r0]
	ldr r1, [sp, #0x18]
	cmp r0, r1
	blo _081426DE
	b _08142800
_081426DE:
	mov r2, sp
	adds r2, #0xe
	str r2, [sp, #0x1c]
	add r0, sp, #0x10
	mov sl, r0
	add r1, sp, #8
	mov sb, r1
	subs r2, #4
	str r2, [sp, #0x20]
_081426F0:
	mov r1, sb
	ldrb r0, [r1]
	add r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _08142810
	adds r0, r0, r2
	ldrb r0, [r0, #6]
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	mov r2, sb
	ldrb r0, [r2]
	add r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08142810
	adds r0, r0, r1
	ldrb r0, [r0, #3]
	ldr r2, [sp, #0x20]
	strh r0, [r2]
	mov r7, sp
	adds r7, #9
	movs r0, #0
	strb r0, [r7]
	ldrb r0, [r7]
	cmp r0, #2
	bhi _081427EE
	add r6, sp, #0xc
	mov r8, r2
	ldr r0, [sp, #0x1c]
	mov ip, r0
	ldr r1, _08142814
	str r1, [sp, #0x28]
_0814273A:
	mov r2, sb
	ldrb r0, [r2]
	add r0, sl
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08142810
	adds r1, r1, r0
	str r7, [sp, #0x24]
	ldrb r0, [r7]
	ldrb r1, [r1, #4]
	adds r0, r0, r1
	lsls r0, r0, #5
	strh r0, [r6]
	ldr r1, [sp, #0x28]
	ldr r4, [r1]
	mov r2, r8
	ldrh r0, [r2]
	ldrh r2, [r6]
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _08142818
	adds r5, r4, r0
	adds r2, r5, r2
	mov r1, ip
	ldrb r0, [r1]
	ldrb r1, [r7]
	adds r1, r1, r0
	ldr r0, _0814281C
	adds r4, r4, r0
	ldr r3, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	mov r2, r8
	ldrh r0, [r2]
	ldrh r2, [r6]
	adds r2, r2, r0
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r5, r2
	mov r1, ip
	ldrb r0, [r1]
	ldrb r1, [r7]
	adds r1, r1, r0
	ldr r3, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r1, #0xd1
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	mov r2, r8
	ldrh r1, [r2]
	ldrh r0, [r6]
	adds r0, r0, r1
	adds r0, #2
	lsls r0, r0, #1
	adds r5, r5, r0
	mov r1, ip
	ldrb r0, [r1]
	ldrb r1, [r7]
	adds r1, r1, r0
	ldr r2, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5]
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldr r1, [sp, #0x24]
	ldrb r0, [r1]
	cmp r0, #2
	bls _0814273A
_081427EE:
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	ldr r1, [sp, #0x18]
	cmp r0, r1
	bhs _08142800
	b _081426F0
_08142800:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142810: .4byte 0x08595D00
_08142814: .4byte 0x0203A854
_08142818: .4byte 0x0000117C
_0814281C: .4byte 0x0000397C
	thumb_func_end sub_081425C4

	thumb_func_start sub_08142820
sub_08142820: @ 0x08142820
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08142858
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #0x13
	bls _08142838
	movs r4, #0
_08142838:
	ldr r3, _0814285C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r2, r0, #2
	adds r0, r2, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #4
	beq _0814288C
	cmp r0, #4
	bgt _08142860
	cmp r0, #3
	beq _08142866
	b _081428D0
	.align 2, 0
_08142858: .4byte 0x08595FFC
_0814285C: .4byte 0x08595D00
_08142860:
	cmp r0, #0xc
	beq _081428B0
	b _081428D0
_08142866:
	adds r0, r4, #0
	movs r1, #5
	bl __udivsi3
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08142888
	ldr r0, [r0]
	adds r0, #0x16
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #3
	bhi _081428D0
	ldrb r0, [r1]
	adds r0, #1
	b _081428A4
	.align 2, 0
_08142888: .4byte 0x0203A854
_0814288C:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081428AC
	ldr r0, [r0]
	adds r0, #0x12
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #2
	bhi _081428D0
	ldrb r0, [r1]
	adds r0, #2
_081428A4:
	add r0, sp
	ldrb r0, [r0]
	b _081428D2
	.align 2, 0
_081428AC: .4byte 0x0203A854
_081428B0:
	ldr r0, _081428CC
	ldr r1, [r0]
	adds r0, r3, #0
	adds r0, #8
	adds r0, r2, r0
	ldr r1, [r1, #8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _081428D0
	mov r0, sp
	ldrb r0, [r0, #4]
	b _081428D2
	.align 2, 0
_081428CC: .4byte 0x0203A854
_081428D0:
	movs r0, #0
_081428D2:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08142820

	thumb_func_start sub_081428DC
sub_081428DC: @ 0x081428DC
	push {r4, r5, r6, lr}
	ldr r4, _0814297C
	ldr r0, [r4]
	ldrh r1, [r0, #0x2c]
	movs r0, #0x20
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x2e]
	movs r0, #0x22
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x30]
	movs r0, #0x24
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x32]
	movs r0, #0x26
	bl SetGpuReg
	ldr r3, [r4]
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	ldr r0, _08142980
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r2, #0x50
	adds r0, r1, #0
	muls r0, r2, r0
	movs r4, #0xe8
	lsls r4, r4, #7
	subs r4, r4, r0
	movs r6, #0x2c
	ldrsh r5, [r3, r6]
	ldr r0, _08142984
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r1, #0x74
	adds r0, r5, #0
	muls r0, r1, r0
	subs r4, r4, r0
	movs r5, #0x32
	ldrsh r0, [r3, r5]
	muls r0, r2, r0
	movs r5, #0xa8
	lsls r5, r5, #7
	subs r5, r5, r0
	movs r6, #0x30
	ldrsh r0, [r3, r6]
	muls r0, r1, r0
	subs r5, r5, r0
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x28
	bl SetGpuReg
	ldr r6, _08142988
	ands r4, r6
	lsrs r4, r4, #0x10
	movs r0, #0x2a
	adds r1, r4, #0
	bl SetGpuReg
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x2c
	bl SetGpuReg
	ands r5, r6
	lsrs r5, r5, #0x10
	movs r0, #0x2e
	adds r1, r5, #0
	bl SetGpuReg
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814297C: .4byte 0x0203A854
_08142980: .4byte 0x02021B3A
_08142984: .4byte 0x02021B38
_08142988: .4byte 0x0FFF0000
	thumb_func_end sub_081428DC

	thumb_func_start sub_0814298C
sub_0814298C: @ 0x0814298C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _081429A8
	adds r0, r4, #0
	bl DoYesNoFuncWithChoice
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081429A8: .4byte 0x08595FBC
	thumb_func_end sub_0814298C

	thumb_func_start sub_081429AC
sub_081429AC: @ 0x081429AC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081429D8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081429D0
	movs r0, #0
	bl SetVBlankCallback
	ldr r0, _081429DC
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_081429D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081429D8: .4byte 0x02037C74
_081429DC: .4byte 0x08140695
	thumb_func_end sub_081429AC

	thumb_func_start sub_081429E0
sub_081429E0: @ 0x081429E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #1
	bl DrawStdWindowFrame
	bl HideCoinsWindow
	bl FreeAllWindowBuffers
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r2, _08142A38
	ldrb r1, [r2, #8]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldrb r3, [r2, #4]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #4]
	bl UpdatePaletteFade
	ldr r1, _08142A3C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08142A40
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142A38: .4byte 0x02037C74
_08142A3C: .4byte 0x03005B60
_08142A40: .4byte 0x081429AD
	thumb_func_end sub_081429E0

	thumb_func_start sub_08142A44
sub_08142A44: @ 0x08142A44
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #0
	bl DrawStdWindowFrame
	bl HideCoinsWindow
	bl ScriptContext2_Disable
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08142A44

	thumb_func_start sub_08142A68
sub_08142A68: @ 0x08142A68
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08142AAC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	ldr r0, _08142AB0
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08142AA6
	ldr r1, _08142AB4
	movs r0, #1
	strh r0, [r1]
	bl HideCoinsWindow
	movs r0, #0
	movs r1, #1
	bl DrawStdWindowFrame
	bl ScriptContext2_Disable
	adds r0, r4, #0
	bl DestroyTask
_08142AA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142AAC: .4byte 0x03005B60
_08142AB0: .4byte 0x03002360
_08142AB4: .4byte 0x02037280
	thumb_func_end sub_08142A68

	thumb_func_start sub_08142AB8
sub_08142AB8: @ 0x08142AB8
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08142B30
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08142B28
	ldr r2, _08142B34
	ldr r0, _08142B38
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	lsrs r1, r1, #7
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	ldr r0, _08142B3C
	movs r2, #2
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r4, _08142B40
	ldr r1, _08142B44
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	movs r1, #0
	bl ClearStdWindowAndFrame
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #2
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _08142B48
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08142B4C
	str r1, [r0]
_08142B28:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142B30: .4byte 0x03002360
_08142B34: .4byte 0x08595EF0
_08142B38: .4byte 0x02037280
_08142B3C: .4byte 0x02021C40
_08142B40: .4byte 0x02021C7C
_08142B44: .4byte 0x08262CF3
_08142B48: .4byte 0x03005B60
_08142B4C: .4byte 0x0814298D
	thumb_func_end sub_08142AB8

	thumb_func_start Task_Roulette_0
Task_Roulette_0: @ 0x08142B50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08142BD8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r6, r0, r1
	movs r1, #0x22
	ldrsh r0, [r6, r1]
	bl PrintCoinsString
	ldr r2, _08142BDC
	ldr r7, _08142BE0
	ldrh r1, [r7]
	movs r0, #1
	mov r8, r0
	ands r0, r1
	lsrs r1, r1, #7
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r4, [r0]
	ldr r0, _08142BE4
	adds r1, r4, #0
	movs r2, #2
	movs r3, #1
	bl ConvertIntToDecimalStringN
	movs r1, #0x22
	ldrsh r0, [r6, r1]
	cmp r0, r4
	blt _08142C40
	ldrh r1, [r7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08142BF0
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _08142BF0
	movs r0, #0
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldr r2, _08142BE8
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _08142BEC
	str r0, [r6]
	b _08142C7A
	.align 2, 0
_08142BD8: .4byte 0x03005B60
_08142BDC: .4byte 0x08595EF0
_08142BE0: .4byte 0x02037280
_08142BE4: .4byte 0x02021C40
_08142BE8: .4byte 0x08262D23
_08142BEC: .4byte 0x08142AB9
_08142BF0:
	ldr r4, _08142C30
	ldr r1, _08142C34
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	movs r1, #0
	bl ClearStdWindowAndFrame
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #2
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _08142C38
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08142C3C
	str r1, [r0]
	b _08142C7A
	.align 2, 0
_08142C30: .4byte 0x02021C7C
_08142C34: .4byte 0x08262CF3
_08142C38: .4byte 0x03005B60
_08142C3C: .4byte 0x0814298D
_08142C40:
	ldr r5, _08142C88
	ldr r1, _08142C8C
	adds r0, r5, #0
	bl StringExpandPlaceholders
	movs r0, #0
	movs r1, #0
	bl ClearStdWindowAndFrame
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r5, #0
	movs r3, #2
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _08142C90
	str r0, [r6]
	strh r4, [r6, #0x22]
	strh r4, [r6, #8]
_08142C7A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142C88: .4byte 0x02021C7C
_08142C8C: .4byte 0x08262D18
_08142C90: .4byte 0x08142A69
	thumb_func_end Task_Roulette_0

	thumb_func_start PlayRoulette
PlayRoulette: @ 0x08142C94
	push {r4, lr}
	bl ScriptContext2_Enable
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	movs r2, #1
	bl ShowCoinsWindow
	ldr r0, _08142CD0
	movs r1, #0
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetCoins
	ldr r2, _08142CD4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r0, [r1, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142CD0: .4byte 0x08142B51
_08142CD4: .4byte 0x03005B60
	thumb_func_end PlayRoulette

	thumb_func_start sub_08142CD8
sub_08142CD8: @ 0x08142CD8
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08142D10
	bl FreeAllSpritePalettes
	ldr r0, _08142D00
	bl LoadSpritePalettes
	ldr r0, _08142D04
	bl LoadCompressedSpriteSheet
	ldr r0, _08142D08
	bl LoadCompressedSpriteSheet
	ldr r0, _08142D0C
	bl LoadCompressedSpriteSheet
	b _08142D26
	.align 2, 0
_08142D00: .4byte 0x08596F38
_08142D04: .4byte 0x08597418
_08142D08: .4byte 0x0859752C
_08142D0C: .4byte 0x085975F4
_08142D10:
	movs r0, #0xe
	bl FreeSpriteTilesByTag
	movs r0, #0xd
	bl FreeSpriteTilesByTag
	movs r0, #0xc
	bl FreeSpriteTilesByTag
	bl FreeAllSpritePalettes
_08142D26:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08142CD8

	thumb_func_start sub_08142D2C
sub_08142D2C: @ 0x08142D2C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, [r0, #4]
	ldrb r3, [r1]
	movs r1, #0x74
	movs r2, #0x50
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r0, _08142D90
	lsls r1, r5, #4
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r6]
	strh r0, [r1, #0x2e]
	strh r4, [r1, #0x30]
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r2, #2
	orrs r0, r2
	strb r0, [r3]
	adds r1, #0x2c
	ldrb r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r1]
	ldrh r2, [r6]
	adds r0, r2, #0
	adds r0, #0x1e
	strh r0, [r6]
	lsls r0, r0, #0x10
	ldr r1, _08142D94
	cmp r0, r1
	bls _08142D88
	ldr r1, _08142D98
	adds r0, r2, r1
	strh r0, [r6]
_08142D88:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08142D90: .4byte 0x020205AC
_08142D94: .4byte 0x01670000
_08142D98: .4byte 0xFFFFFEB6
	thumb_func_end sub_08142D2C

	thumb_func_start sub_08142D9C
sub_08142D9C: @ 0x08142D9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, _08142EE8
	ldr r0, [r4]
	ldr r5, _08142EEC
	adds r1, r5, #0
	bl LZ77UnCompWram
	str r5, [sp]
	mov r6, sp
	ldrh r1, [r4, #6]
	lsls r1, r1, #0x10
	ldrh r0, [r4, #4]
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r4, _08142EF0
	ldr r0, [r4]
	adds r1, r5, #0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r0, [r4, #4]
	strh r0, [r6, #4]
	ldrh r0, [r4, #6]
	strh r0, [r6, #6]
	mov r0, sp
	bl LoadSpriteSheet
	movs r6, #0
	ldr r0, _08142EF4
	mov r8, r0
_08142DE4:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #0x1b
	lsrs r4, r0, #0x18
	movs r5, #0
	lsls r7, r6, #2
_08142DF0:
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #3
	ldr r0, _08142EF8
	adds r0, r1, r0
	adds r1, #0x94
	adds r2, r4, #0
	adds r2, #0x5c
	movs r3, #0x1e
	bl CreateSprite
	ldr r1, _08142EFC
	ldr r1, [r1]
	adds r2, r5, #0
	adds r2, #0x1d
	adds r2, r7, r2
	adds r1, #0x3c
	adds r1, r1, r2
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x18
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x47
	bls _08142E3A
	movs r4, #0
_08142E3A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08142DF0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _08142DE4
	movs r6, #0
	ldr r4, _08142EF4
_08142E52:
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #3
	ldr r0, _08142F00
	adds r0, r1, r0
	adds r1, #0x94
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x46
	movs r3, #0x1e
	bl CreateSprite
	ldr r1, _08142EFC
	ldr r1, [r1]
	adds r1, r1, r6
	adds r1, #0x65
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _08142E52
	movs r6, #0
	ldr r4, _08142EF4
_08142E98:
	lsls r2, r6, #1
	adds r2, r2, r6
	lsls r2, r2, #3
	ldr r0, _08142F04
	adds r0, r2, r0
	adds r2, #0x5c
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x7e
	movs r3, #0x1e
	bl CreateSprite
	ldr r1, _08142EFC
	ldr r1, [r1]
	adds r1, r1, r6
	adds r1, #0x69
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _08142E98
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142EE8: .4byte 0x0859703C
_08142EEC: .4byte 0x0201C000
_08142EF0: .4byte 0x08597044
_08142EF4: .4byte 0x020205AC
_08142EF8: .4byte 0x08597164
_08142EFC: .4byte 0x0203A854
_08142F00: .4byte 0x085970BC
_08142F04: .4byte 0x0859711C
	thumb_func_end sub_08142D9C

	thumb_func_start unref_sub_8142E3C
unref_sub_8142E3C: @ 0x08142F08
	push {r4, lr}
	movs r4, #0
_08142F0C:
	ldr r0, _08142F34
	ldr r0, [r0]
	adds r0, r0, r4
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08142F38
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	bls _08142F0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142F34: .4byte 0x0203A854
_08142F38: .4byte 0x020205AC
	thumb_func_end unref_sub_8142E3C

	thumb_func_start sub_08142F3C
sub_08142F3C: @ 0x08142F3C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	cmp r0, #0
	beq _08142F8C
	cmp r0, #1
	bne _08143032
	movs r4, #0
	ldr r5, _08142F84
	ldr r3, _08142F88
	movs r2, #4
_08142F5E:
	ldr r0, [r3]
	adds r0, r0, r4
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x12
	bls _08142F5E
	b _08143032
	.align 2, 0
_08142F84: .4byte 0x020205AC
_08142F88: .4byte 0x0203A854
_08142F8C:
	movs r4, #0
	ldr r0, _08142FD4
	mov sb, r0
	ldr r7, _08142FD8
	adds r1, r7, #4
	mov r8, r1
	ldr r5, _08142FDC
	movs r6, #5
	rsbs r6, r6, #0
_08142F9E:
	mov r0, sb
	ldr r2, [r0]
	lsls r3, r4, #3
	mov r1, r8
	adds r0, r3, r1
	ldr r1, [r2, #8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08142FE0
	adds r0, r3, r7
	ldrb r0, [r0, #2]
	cmp r0, ip
	beq _08142FE0
	adds r0, r2, r4
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _08142FF8
	.align 2, 0
_08142FD4: .4byte 0x0203A854
_08142FD8: .4byte 0x08595E90
_08142FDC: .4byte 0x020205AC
_08142FE0:
	adds r0, r2, r4
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1]
_08142FF8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	bls _08142F9E
	cmp r4, #0x12
	bhi _08143032
	ldr r6, _08143040
	ldr r3, _08143044
	movs r5, #5
	rsbs r5, r5, #0
_0814300E:
	ldr r0, [r3]
	adds r0, r0, r4
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r5, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x12
	bls _0814300E
_08143032:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143040: .4byte 0x020205AC
_08143044: .4byte 0x0203A854
	thumb_func_end sub_08142F3C

	thumb_func_start sub_08143048
sub_08143048: @ 0x08143048
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r6, _081430F4
	ldr r4, _081430F8
	movs r0, #4
	mov r8, r0
_08143058:
	ldr r0, _081430FC
	movs r1, #0x74
	movs r2, #0x14
	movs r3, #0xa
	bl CreateSprite
	ldr r1, [r6]
	adds r3, r5, #0
	adds r3, #0x31
	adds r1, #0x3c
	adds r1, r1, r3
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	mov r2, r8
	orrs r1, r2
	strb r1, [r0]
	ldr r2, [r6]
	adds r2, #0x3c
	adds r2, r2, r3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08143100
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #5]
	movs r7, #0xd
	rsbs r7, r7, #0
	adds r2, r7, #0
	ands r1, r2
	mov r2, r8
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r0, [r6]
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #8
	bl StartSpriteAnim
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08143058
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081430F4: .4byte 0x0203A854
_081430F8: .4byte 0x020205AC
_081430FC: .4byte 0x085974DC
_08143100: .4byte 0x081439D9
	thumb_func_end sub_08143048

	thumb_func_start sub_08143104
sub_08143104: @ 0x08143104
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r6, #0
	cmp r0, #0
	beq _08143150
	ldr r4, _08143148
	ldr r3, _0814314C
	movs r2, #4
_08143122:
	ldr r0, [r3]
	adds r0, r0, r6
	adds r0, #0x6d
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _08143122
	b _0814320E
	.align 2, 0
_08143148: .4byte 0x020205AC
_0814314C: .4byte 0x0203A854
_08143150:
	ldr r0, _08143190
	mov r8, r0
	ldr r7, _08143194
	ldr r0, _08143198
	mov ip, r0
	movs r0, #5
	rsbs r0, r0, #0
	mov sl, r0
_08143160:
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xc
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08143174
	cmp r6, sb
	bne _0814319C
_08143174:
	adds r0, r1, r6
	adds r0, #0x6d
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _08143204
	.align 2, 0
_08143190: .4byte 0x0203A854
_08143194: .4byte 0x020205AC
_08143198: .4byte 0x08595D00
_0814319C:
	adds r5, r6, #0
	adds r5, #0x31
	adds r0, r1, #0
	adds r0, #0x3c
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x3e
	ldrb r2, [r1]
	mov r0, sl
	ands r0, r2
	strb r0, [r1]
	mov r0, r8
	ldr r3, [r0]
	adds r4, r3, #0
	adds r4, #0x3c
	adds r4, r4, r5
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r3, #0xc
	adds r3, r3, r6
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0, #3]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	strh r0, [r2, #0x20]
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r7
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0, #4]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #3
	strh r0, [r2, #0x22]
_08143204:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _08143160
_0814320E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08143104

	thumb_func_start sub_0814321C
sub_0814321C: @ 0x0814321C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0814324C
	ldr r2, _08143244
	ldr r0, _08143248
	ldr r0, [r0]
	adds r0, #0x6c
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _0814329C
	.align 2, 0
_08143244: .4byte 0x020205AC
_08143248: .4byte 0x0203A854
_0814324C:
	ldr r4, _081432A4
	ldr r3, _081432A8
	ldr r0, [r3]
	adds r0, #0x6c
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldr r3, [r3]
	adds r3, #0x6c
	ldrb r0, [r3]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r0, _081432AC
	lsls r2, r5, #2
	adds r2, r2, r5
	lsls r2, r2, #2
	adds r2, r2, r0
	ldrb r0, [r2, #3]
	adds r0, #2
	lsls r0, r0, #3
	strh r0, [r1, #0x20]
	ldrb r0, [r3]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r2, #4]
	adds r0, #2
	lsls r0, r0, #3
	strh r0, [r1, #0x22]
_0814329C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081432A4: .4byte 0x020205AC
_081432A8: .4byte 0x0203A854
_081432AC: .4byte 0x08595D00
	thumb_func_end sub_0814321C

	thumb_func_start sub_081432B0
sub_081432B0: @ 0x081432B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r4, _08143338
	ldr r0, [r4]
	ldr r5, _0814333C
	adds r1, r5, #0
	bl LZ77UnCompWram
	str r5, [sp, #4]
	add r0, sp, #4
	ldrh r2, [r4, #6]
	lsls r2, r2, #0x10
	ldrh r1, [r4, #4]
	orrs r1, r2
	str r1, [r0, #4]
	bl LoadSpriteSheet
	movs r1, #0xf
	mov r0, sp
	strh r1, [r0]
	movs r0, #0
	ldr r7, _08143340
_081432DC:
	movs r4, #0
	adds r6, r0, #1
	lsls r5, r0, #2
_081432E2:
	adds r1, r5, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08143344
	adds r0, r0, r1
	movs r1, #0x28
	mov r2, sp
	bl sub_08142D2C
	ldr r1, _08143348
	ldr r1, [r1]
	adds r2, r4, #7
	adds r2, r5, r2
	adds r1, #0x3c
	adds r1, r1, r2
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x2c
	ldrb r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081432E2
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _081432DC
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143338: .4byte 0x08596FD0
_0814333C: .4byte 0x0201C000
_08143340: .4byte 0x020205AC
_08143344: .4byte 0x085971C4
_08143348: .4byte 0x0203A854
	thumb_func_end sub_081432B0

	thumb_func_start sub_0814334C
sub_0814334C: @ 0x0814334C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _081433D0
	ldr r1, [r0]
	ldrh r0, [r6, #0x2e]
	ldrh r1, [r1, #0x24]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, _081433D4
	cmp r1, r0
	ble _0814336E
	ldr r2, _081433D8
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0814336E:
	adds r0, r4, #0
	bl Sin2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl Cos2
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r3, #0x30
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	asrs r1, r1, #0xc
	strh r1, [r6, #0x24]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	rsbs r1, r4, #0
	movs r3, #0x30
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	strh r0, [r6, #0x26]
	ldrb r0, [r6, #3]
	lsls r0, r0, #0x1a
	lsrs r3, r0, #0x1b
	cmp r2, #0
	bge _081433A8
	adds r2, #0xf
_081433A8:
	lsls r0, r2, #0xc
	lsrs r5, r0, #0x10
	ldr r1, _081433DC
	lsls r0, r3, #3
	adds r1, r0, r1
	adds r0, r4, #0
	cmp r0, #0
	bge _081433BA
	adds r0, #0xf
_081433BA:
	asrs r0, r0, #4
	strh r0, [r1, #6]
	strh r0, [r1]
	strh r5, [r1, #2]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	strh r0, [r1, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081433D0: .4byte 0x0203A854
_081433D4: .4byte 0x00000167
_081433D8: .4byte 0xFFFFFE98
_081433DC: .4byte 0x02021B3C
	thumb_func_end sub_0814334C

	thumb_func_start sub_081433E0
sub_081433E0: @ 0x081433E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r5, #0
	ldr r7, _081435B4
	mov r6, sp
_081433EE:
	ldr r0, _081435B8
	lsls r4, r5, #3
	adds r4, r4, r0
	ldr r0, [r4]
	adds r1, r7, #0
	bl LZ77UnCompWram
	str r7, [sp]
	ldrh r2, [r4, #4]
	ldr r0, _081435BC
	ldr r1, [r6, #4]
	ands r1, r0
	orrs r1, r2
	str r1, [r6, #4]
	ldrh r2, [r4, #6]
	lsls r2, r2, #0x10
	ldr r0, _081435C0
	ands r0, r1
	orrs r0, r2
	str r0, [r6, #4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _081433EE
	ldr r0, _081435C4
	movs r1, #0xd0
	movs r2, #0x10
	movs r3, #4
	bl CreateSprite
	ldr r3, _081435C8
	ldr r1, [r3]
	adds r1, #0x50
	strb r0, [r1]
	ldr r4, _081435CC
	ldr r0, [r3]
	adds r0, #0x50
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	movs r5, #0
	adds r7, r3, #0
_08143458:
	lsls r1, r5, #0x13
	movs r0, #0xc4
	lsls r0, r0, #0x10
	adds r1, r1, r0
	asrs r1, r1, #0x10
	ldr r0, _081435D0
	movs r2, #0x18
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r3, r5, #0
	adds r3, #0x15
	adds r1, #0x3c
	adds r1, r1, r3
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r6, #0x40
	orrs r1, r6
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08143458
	ldr r0, _081435D4
	movs r1, #0x78
	movs r2, #0x44
	movs r3, #4
	bl CreateSprite
	ldr r2, _081435C8
	ldr r1, [r2]
	adds r1, #0x55
	strb r0, [r1]
	ldr r3, _081435CC
	ldr r0, [r2]
	adds r0, #0x55
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2c
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	movs r5, #0
	adds r4, r2, #0
	adds r7, r3, #0
_081434E8:
	lsls r1, r5, #0x14
	movs r2, #0xc0
	lsls r2, r2, #0x10
	adds r1, r1, r2
	asrs r1, r1, #0x10
	ldr r0, _081435D8
	movs r2, #0x24
	movs r3, #4
	bl CreateSprite
	ldr r1, [r4]
	adds r2, r5, #0
	adds r2, #0x1a
	adds r1, #0x3c
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x3c
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r3, #4
	mov r8, r3
	mov r3, r8
	orrs r1, r3
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x3c
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r6, #0x40
	orrs r1, r6
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _081434E8
	ldr r0, _081435DC
	movs r1, #0x98
	movs r2, #0x60
	movs r3, #9
	bl CreateSprite
	ldr r3, _081435C8
	ldr r1, [r3]
	adds r1, #0x6c
	strb r0, [r1]
	ldr r4, _081435CC
	ldr r0, [r3]
	adds r0, #0x6c
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r0, [r3]
	adds r0, #0x6c
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x2c
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, #0x6c
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081435B4: .4byte 0x0201C000
_081435B8: .4byte 0x08597304
_081435BC: .4byte 0xFFFF0000
_081435C0: .4byte 0x0000FFFF
_081435C4: .4byte 0x08597398
_081435C8: .4byte 0x0203A854
_081435CC: .4byte 0x020205AC
_081435D0: .4byte 0x085973B0
_081435D4: .4byte 0x085973C8
_081435D8: .4byte 0x085973E0
_081435DC: .4byte 0x085973F8
	thumb_func_end sub_081433E0

	thumb_func_start sub_081435E0
sub_081435E0: @ 0x081435E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0xfa
	lsls r0, r0, #2
	mov r8, r0
	movs r4, #0
	movs r6, #0
	ldr r1, _081436CC
	mov sb, r1
	ldr r0, _081436D0
	mov sl, r0
_08143600:
	adds r0, r7, #0
	mov r1, r8
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _081436D0
	ldr r0, [r1]
	adds r3, r6, #0
	adds r3, #0x15
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081436CC
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	cmp r5, #0
	bne _0814363A
	cmp r4, #0
	bne _0814363A
	cmp r6, #3
	bne _08143698
_0814363A:
	mov r4, sl
	ldr r0, [r4]
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r4, #5
	rsbs r4, r4, #0
	adds r2, r4, #0
	ands r1, r2
	strb r1, [r0]
	mov r1, sl
	ldr r0, [r1]
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r4, sb
	adds r3, r0, r4
	adds r4, r3, #0
	adds r4, #0x40
	ldr r1, _081436D4
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrh r2, [r0]
	ldrh r4, [r4]
	adds r2, r2, r4
	ldr r4, _081436D8
	adds r0, r4, #0
	ands r2, r0
	ldrh r0, [r3, #4]
	ldr r4, _081436DC
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
	movs r4, #1
_08143698:
	adds r0, r7, #0
	mov r1, r8
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r0, r8
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _08143600
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081436CC: .4byte 0x020205AC
_081436D0: .4byte 0x0203A854
_081436D4: .4byte 0x020205B4
_081436D8: .4byte 0x000003FF
_081436DC: .4byte 0xFFFFFC00
	thumb_func_end sub_081435E0

	thumb_func_start sub_081436E0
sub_081436E0: @ 0x081436E0
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08143718
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #0x13
	bls _081436F8
	movs r4, #0
_081436F8:
	ldr r3, _0814371C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r2, r0, #2
	adds r0, r2, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #4
	beq _0814374C
	cmp r0, #4
	bgt _08143720
	cmp r0, #3
	beq _08143726
	b _08143790
	.align 2, 0
_08143718: .4byte 0x085976B8
_0814371C: .4byte 0x08595D00
_08143720:
	cmp r0, #0xc
	beq _08143770
	b _08143790
_08143726:
	adds r0, r4, #0
	movs r1, #5
	bl __udivsi3
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08143748
	ldr r0, [r0]
	adds r0, #0x16
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #3
	bhi _08143790
	ldrb r0, [r1]
	adds r0, #1
	b _08143764
	.align 2, 0
_08143748: .4byte 0x0203A854
_0814374C:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0814376C
	ldr r0, [r0]
	adds r0, #0x12
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #2
	bhi _08143790
	ldrb r0, [r1]
	adds r0, #2
_08143764:
	add r0, sp
	ldrb r0, [r0]
	b _08143792
	.align 2, 0
_0814376C: .4byte 0x0203A854
_08143770:
	ldr r0, _0814378C
	ldr r1, [r0]
	adds r0, r3, #0
	adds r0, #8
	adds r0, r2, r0
	ldr r1, [r1, #8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08143790
	mov r0, sp
	ldrb r0, [r0, #4]
	b _08143792
	.align 2, 0
_0814378C: .4byte 0x0203A854
_08143790:
	movs r0, #0
_08143792:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081436E0

	thumb_func_start sub_0814379C
sub_0814379C: @ 0x0814379C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081437E8
	ldr r1, [r1]
	adds r1, #0x55
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _081437EC
	adds r4, r1, r2
	bl sub_081436E0
	adds r3, r4, #0
	adds r3, #0x2b
	strb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x40
	ldr r1, [r4, #8]
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r1, r2
	ldr r2, _081437F0
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _081437F4
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081437E8: .4byte 0x0203A854
_081437EC: .4byte 0x020205AC
_081437F0: .4byte 0x000003FF
_081437F4: .4byte 0xFFFFFC00
	thumb_func_end sub_0814379C

	thumb_func_start sub_081437F8
sub_081437F8: @ 0x081437F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r6, #0
	ldr r1, _08143824
	ldr r0, [r1]
	ldrb r0, [r0, #0x19]
	adds r5, r1, #0
	cmp r0, #1
	bne _08143812
	movs r6, #2
_08143812:
	cmp r2, #6
	bls _08143818
	b _08143974
_08143818:
	lsls r0, r2, #2
	ldr r1, _08143828
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08143824: .4byte 0x0203A854
_08143828: .4byte 0x0814382C
_0814382C: @ jump table
	.4byte _08143974 @ case 0
	.4byte _08143930 @ case 1
	.4byte _08143908 @ case 2
	.4byte _081438FC @ case 3
	.4byte _081438D4 @ case 4
	.4byte _081438C8 @ case 5
	.4byte _08143848 @ case 6
_08143848:
	movs r4, #0
	ldr r5, _081438B8
	ldr r6, _081438BC
	movs r0, #5
	rsbs r0, r0, #0
	mov ip, r0
	adds r7, r5, #0
	adds r7, #8
	ldr r2, _081438C0
	mov r8, r2
_0814385C:
	ldr r0, [r6]
	adds r3, r4, #0
	adds r3, #0x1a
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x3e
	ldrb r2, [r1]
	mov r0, ip
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r5
	adds r2, r3, #0
	adds r2, #0x40
	adds r0, r0, r7
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r1, r2
	ldr r2, _081438C4
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #4]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0814385C
	b _081439C0
	.align 2, 0
_081438B8: .4byte 0x020205AC
_081438BC: .4byte 0x0203A854
_081438C0: .4byte 0xFFFFFC00
_081438C4: .4byte 0x000003FF
_081438C8:
	ldr r2, _081438D0
	ldr r0, [r5]
	adds r0, #0x58
	b _08143936
	.align 2, 0
_081438D0: .4byte 0x020205AC
_081438D4:
	ldr r2, _081438F8
	ldr r0, [r5]
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r2
	adds r4, r3, #0
	adds r4, #0x40
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	b _08143952
	.align 2, 0
_081438F8: .4byte 0x020205AC
_081438FC:
	ldr r2, _08143904
	ldr r0, [r5]
	adds r0, #0x57
	b _08143936
	.align 2, 0
_08143904: .4byte 0x020205AC
_08143908:
	ldr r2, _0814392C
	ldr r0, [r5]
	adds r0, #0x57
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r2
	adds r4, r3, #0
	adds r4, #0x40
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	b _08143952
	.align 2, 0
_0814392C: .4byte 0x020205AC
_08143930:
	ldr r2, _08143968
	ldr r0, [r5]
	adds r0, #0x56
_08143936:
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r2
	adds r4, r3, #0
	adds r4, #0x40
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r1, [r0, #4]
_08143952:
	ldrh r4, [r4]
	adds r1, r1, r4
	ldr r2, _0814396C
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #4]
	ldr r0, _08143970
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	b _081439C0
	.align 2, 0
_08143968: .4byte 0x020205AC
_0814396C: .4byte 0x000003FF
_08143970: .4byte 0xFFFFFC00
_08143974:
	movs r4, #0
	lsls r7, r6, #2
	ldr r6, _081439CC
	movs r0, #8
	adds r0, r0, r6
	mov ip, r0
	ldr r2, _081439D0
	mov r8, r2
_08143984:
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x56
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r6
	adds r2, r3, #0
	adds r2, #0x40
	add r0, ip
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r7, r0
	ldrh r1, [r0, #8]
	ldrh r2, [r2]
	adds r1, r1, r2
	ldr r2, _081439D4
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #4]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08143984
_081439C0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081439CC: .4byte 0x020205AC
_081439D0: .4byte 0xFFFFFC00
_081439D4: .4byte 0x000003FF
	thumb_func_end sub_081437F8

	thumb_func_start sub_081439D8
sub_081439D8: @ 0x081439D8
	ldr r1, _081439E4
	ldr r1, [r1]
	ldrh r1, [r1, #0x26]
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
_081439E4: .4byte 0x0203A854
	thumb_func_end sub_081439D8

	thumb_func_start sub_081439E8
sub_081439E8: @ 0x081439E8
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _08143A54
	ldr r0, [r4]
	ldr r5, _08143A58
	adds r1, r5, #0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, #6]
	lsls r1, r1, #0x10
	ldrh r0, [r4, #4]
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _08143A5C
	movs r1, #0x74
	movs r2, #0x50
	movs r3, #0x51
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08143A60
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, _08143A64
	ldr r0, [r0]
	ldrh r0, [r0, #0x24]
	movs r2, #0
	strh r0, [r1, #0x2e]
	strh r2, [r1, #0x30]
	adds r3, r1, #0
	adds r3, #0x2c
	ldrb r0, [r3]
	movs r2, #0x40
	orrs r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r3]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08143A54: .4byte 0x085974FC
_08143A58: .4byte 0x0201C000
_08143A5C: .4byte 0x08597504
_08143A60: .4byte 0x020205AC
_08143A64: .4byte 0x0203A854
	thumb_func_end sub_081439E8

	thumb_func_start sub_08143A68
sub_08143A68: @ 0x08143A68
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	ldr r1, _08143A8C
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08143A90
	ldr r2, [r1]
	ldrh r1, [r2, #0x2c]
	strh r1, [r0, #6]
	ldrh r1, [r2, #0x2c]
	strh r1, [r0]
	ldrh r1, [r2, #0x2e]
	strh r1, [r0, #2]
	ldrh r1, [r2, #0x30]
	strh r1, [r0, #4]
	bx lr
	.align 2, 0
_08143A8C: .4byte 0x02021B3C
_08143A90: .4byte 0x0203A854
	thumb_func_end sub_08143A68

	thumb_func_start sub_08143A94
sub_08143A94: @ 0x08143A94
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _08143B00
	ldr r6, _08143B04
_08143A9C:
	movs r3, #0x39
	subs r3, r3, r4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _08143B08
	movs r1, #0x74
	movs r2, #0x50
	bl CreateSprite
	ldr r1, [r5]
	adds r1, #0x3c
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x3c
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0x40
	beq _08143AF0
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x3c
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
_08143AF0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _08143A9C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08143B00: .4byte 0x0203A854
_08143B04: .4byte 0x020205AC
_08143B08: .4byte 0x085974DC
	thumb_func_end sub_08143A94

	thumb_func_start sub_08143B0C
sub_08143B0C: @ 0x08143B0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08143B88
	ldr r0, [r0]
	adds r0, #0x3c
	ldrb r5, [r0]
	movs r6, #0
	ldr r7, _08143B8C
	movs r0, #0x1c
	adds r0, r0, r7
	mov sl, r0
	movs r1, #0x2e
	adds r1, r1, r7
	mov sb, r1
	mov r8, r6
_08143B30:
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r0, r4, r7
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #4
	orrs r1, r2
	strb r1, [r3]
	mov r1, sl
	adds r2, r4, r1
	ldr r1, _08143B90
	str r1, [r2]
	movs r1, #0
	bl StartSpriteAnim
	movs r1, #0
	adds r2, r5, #1
	adds r3, r6, #1
_08143B58:
	lsls r0, r1, #1
	adds r0, r0, r4
	add r0, sb
	mov r5, r8
	strh r5, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #7
	bls _08143B58
	lsls r0, r2, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r3, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _08143B30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143B88: .4byte 0x0203A854
_08143B8C: .4byte 0x020205AC
_08143B90: .4byte 0x08007141
	thumb_func_end sub_08143B0C

	thumb_func_start sub_08143B94
sub_08143B94: @ 0x08143B94
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08143BC4
	ldr r0, [r0]
	ldrh r4, [r0, #0x24]
	movs r2, #0x24
	ldrsh r1, [r0, r2]
	ldrh r2, [r3, #0x34]
	movs r5, #0x34
	ldrsh r0, [r3, r5]
	cmp r1, r0
	ble _08143BD0
	movs r1, #0xb4
	lsls r1, r1, #1
	adds r0, r2, r1
	subs r2, r0, r4
	strh r2, [r3, #0x3a]
	lsls r1, r2, #0x10
	ldr r0, _08143BC8
	cmp r1, r0
	ble _08143BD4
	ldr r5, _08143BCC
	adds r0, r2, r5
	b _08143BD2
	.align 2, 0
_08143BC4: .4byte 0x0203A854
_08143BC8: .4byte 0x01670000
_08143BCC: .4byte 0xFFFFFE98
_08143BD0:
	subs r0, r2, r4
_08143BD2:
	strh r0, [r3, #0x3a]
_08143BD4:
	movs r1, #0x3a
	ldrsh r0, [r3, r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08143B94

	thumb_func_start sub_08143BE0
sub_08143BE0: @ 0x08143BE0
	push {r4, r5, lr}
	bl sub_08143B94
	ldr r5, _08143C0C
	ldr r4, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl __floatsisf
	ldr r1, _08143C10
	bl __divsf3
	bl __fixunssfsi
	adds r4, #0x7e
	strb r0, [r4]
	ldr r0, [r5]
	adds r0, #0x7e
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08143C0C: .4byte 0x0203A854
_08143C10: .4byte 0x41F00000
	thumb_func_end sub_08143BE0

	thumb_func_start sub_08143C14
sub_08143C14: @ 0x08143C14
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08143B94
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x1e
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0xe
	bne _08143C34
	movs r0, #0
	strh r0, [r4, #0x32]
	b _08143C4A
_08143C34:
	cmp r1, #0xd
	bgt _08143C3C
	movs r0, #0xe
	b _08143C3E
_08143C3C:
	movs r0, #0x2b
_08143C3E:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_08143C4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08143C14

	thumb_func_start sub_08143C50
sub_08143C50: @ 0x08143C50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r5, _08143C98
	ldr r6, [r5]
	adds r4, r6, #0
	adds r4, #0x8c
	adds r1, r6, #0
	adds r1, #0x90
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	adds r1, r0, #0
	str r1, [r4]
	subs r4, #4
	ldr r0, [r4]
	bl __addsf3
	adds r6, r0, #0
	str r6, [r4]
	ldr r0, _08143C9C
	mov r8, r0
	adds r0, r6, #0
	mov r1, r8
	bl __gesf2
	cmp r0, #0
	blt _08143CA0
	adds r0, r6, #0
	mov r1, r8
	bl __subsf3
	b _08143CB4
	.align 2, 0
_08143C98: .4byte 0x0203A854
_08143C9C: .4byte 0x43B40000
_08143CA0:
	ldr r1, _08143D4C
	adds r0, r6, #0
	bl __ltsf2
	cmp r0, #0
	bge _08143CB6
	adds r0, r6, #0
	mov r1, r8
	bl __addsf3
_08143CB4:
	str r0, [r4]
_08143CB6:
	ldr r5, [r5]
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl __fixsfsi
	strh r0, [r7, #0x34]
	adds r4, r5, #0
	adds r4, #0x98
	adds r1, r5, #0
	adds r1, #0x9c
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	adds r1, r0, #0
	str r1, [r4]
	subs r4, #4
	ldr r0, [r4]
	bl __addsf3
	str r0, [r4]
	bl __fixsfsi
	strh r0, [r7, #0x36]
	ldrh r0, [r7, #0x34]
	bl Sin2
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r0, [r7, #0x34]
	bl Cos2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0x36
	ldrsh r1, [r7, r2]
	muls r1, r4, r1
	asrs r1, r1, #0xc
	strh r1, [r7, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	movs r2, #0x36
	ldrsh r1, [r7, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	strh r0, [r7, #0x26]
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08143D40
	ldr r0, _08143D50
	ldr r4, _08143D54
	ldrh r2, [r7, #0x24]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r4, #0
	bl m4aMPlayPanpotControl
	ldr r0, _08143D58
	ldrh r2, [r7, #0x24]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r4, #0
	bl m4aMPlayPanpotControl
_08143D40:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143D4C: .4byte 0x00000000
_08143D50: .4byte 0x03007510
_08143D54: .4byte 0x0000FFFF
_08143D58: .4byte 0x03007550
	thumb_func_end sub_08143C50

	thumb_func_start sub_08143D5C
sub_08143D5C: @ 0x08143D5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08143DB8
	ldr r1, [r0]
	ldrh r0, [r5, #0x3a]
	ldrh r1, [r1, #0x24]
	adds r2, r0, r1
	strh r2, [r5, #0x34]
	lsls r1, r2, #0x10
	ldr r0, _08143DBC
	cmp r1, r0
	ble _08143D7A
	ldr r1, _08143DC0
	adds r0, r2, r1
	strh r0, [r5, #0x34]
_08143D7A:
	ldrh r0, [r5, #0x34]
	bl Sin2
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r0, [r5, #0x34]
	bl Cos2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0x36
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	asrs r1, r1, #0xc
	strh r1, [r5, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	movs r2, #0x36
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	ldr r1, _08143DC4
	asrs r0, r0, #0xc
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0x26]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08143DB8: .4byte 0x0203A854
_08143DBC: .4byte 0x01670000
_08143DC0: .4byte 0xFFFFFE98
_08143DC4: .4byte 0x02021B3A
	thumb_func_end sub_08143D5C

	thumb_func_start sub_08143DC8
sub_08143DC8: @ 0x08143DC8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_08143C50
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x36]
	adds r0, #0x84
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xd4
	bls _08143DEE
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	b _08143DFA
_08143DEE:
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
_08143DFA:
	strb r0, [r2]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #0x1d
	ble _08143EC4
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08143E38
	ldr r7, _08143E30
	ldr r6, [r7]
	adds r4, r6, #0
	adds r4, #0x94
	adds r0, r6, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _08143E34
	bl __subsf3
	adds r1, r0, #0
	ldr r0, [r4]
	bl __lesf2
	cmp r0, #0
	bgt _08143EC4
	b _08143E58
	.align 2, 0
_08143E30: .4byte 0x0203A854
_08143E34: .4byte 0x40000000
_08143E38:
	ldr r7, _08143ECC
	ldr r6, [r7]
	adds r4, r6, #0
	adds r4, #0x94
	adds r0, r6, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _08143ED0
	bl __subsf3
	adds r1, r0, #0
	ldr r0, [r4]
	bl __gesf2
	cmp r0, #0
	blt _08143EC4
_08143E58:
	adds r1, r6, #0
	adds r1, #0x7d
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, [r7]
	ldrb r1, [r2, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #3]
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r1, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
	adds r0, r5, #0
	bl sub_08143BE0
	movs r0, #0x1e
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl sub_08143B94
	movs r1, #0x3a
	ldrsh r0, [r5, r1]
	movs r1, #0x1e
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, #0xf
	strh r1, [r5, #0x3a]
	ldr r0, _08143ED4
	str r0, [r5, #0x1c]
	movs r0, #0x47
	bl m4aSongNumStartOrChange
	ldr r3, [r7]
	adds r2, r3, #0
	adds r2, #0x9c
	adds r1, r3, #0
	adds r1, #0x98
	ldr r0, _08143ED8
	str r0, [r1]
	str r0, [r2]
	subs r1, #0xc
	ldr r0, _08143EDC
	str r0, [r1]
_08143EC4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143ECC: .4byte 0x0203A854
_08143ED0: .4byte 0x40000000
_08143ED4: .4byte 0x08143D5D
_08143ED8: .4byte 0x00000000
_08143EDC: .4byte 0xBF800000
	thumb_func_end sub_08143DC8

	thumb_func_start sub_08143EE0
sub_08143EE0: @ 0x08143EE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	bl sub_08143C50
	movs r1, #0x34
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08143EFE
	cmp r0, #0xb4
	beq _08143F68
	b _0814404C
_08143EFE:
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	cmp r0, #1
	bne _08143F08
	b _0814404C
_08143F08:
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	bl __floatsisf
	mov sb, r0
	ldr r0, _08143F60
	mov sl, r0
	ldr r1, _08143F64
	mov r8, r1
	ldr r0, [r1]
	ldrb r4, [r0, #4]
	lsls r4, r4, #0x1e
	lsrs r0, r4, #0x19
	add r0, sl
	ldrb r0, [r0, #1]
	bl __floatsisf
	adds r1, r0, #0
	mov r0, sb
	bl __mulsf3
	adds r6, r0, #0
	lsrs r0, r4, #0x19
	add r0, sl
	ldrb r0, [r0, #2]
	subs r0, #1
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r6, #0
	bl __addsf3
	adds r5, r0, #0
	lsrs r4, r4, #0x19
	add r4, sl
	ldrh r0, [r4, #0xc]
	bl __floatsisf
	adds r1, r0, #0
	mov r0, sb
	bl __divsf3
	b _08143FC8
	.align 2, 0
_08143F60: .4byte 0x08595EF4
_08143F64: .4byte 0x0203A854
_08143F68:
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _0814404C
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	bl __floatsisf
	mov sb, r0
	ldr r0, _0814405C
	mov sl, r0
	ldr r1, _08144060
	mov r8, r1
	ldr r0, [r1]
	ldrb r4, [r0, #4]
	lsls r4, r4, #0x1e
	lsrs r0, r4, #0x19
	add r0, sl
	ldrb r0, [r0, #1]
	bl __floatsisf
	adds r1, r0, #0
	mov r0, sb
	bl __mulsf3
	adds r6, r0, #0
	lsrs r0, r4, #0x19
	add r0, sl
	ldrb r0, [r0, #2]
	subs r0, #1
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r6, #0
	bl __addsf3
	adds r5, r0, #0
	lsrs r4, r4, #0x19
	add r4, sl
	ldrh r0, [r4, #0xc]
	bl __floatsisf
	adds r1, r0, #0
	mov r0, sb
	bl __divsf3
	bl __negsf2
_08143FC8:
	adds r2, r0, #0
	mov r0, r8
	ldr r6, [r0]
	adds r1, r6, #0
	adds r1, #0xa0
	adds r0, r6, #0
	adds r0, #0x94
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0x98
	str r2, [r0]
	movs r0, #0x9c
	adds r0, r0, r6
	mov r8, r0
	adds r0, r2, #0
	adds r1, r2, #0
	bl __addsf3
	adds r1, r5, #0
	bl __divsf3
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r5, #0
	bl __mulsf3
	adds r1, r0, #0
	ldr r0, _08144064
	bl __divsf3
	adds r1, r0, #0
	adds r0, r4, #0
	bl __addsf3
	bl __negsf2
	mov r1, r8
	str r0, [r1]
	adds r1, r6, #0
	adds r1, #0x8c
	ldr r0, _08144068
	str r0, [r1]
	adds r2, r7, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x2a
	movs r2, #0
	strb r2, [r0]
	adds r3, r7, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0814406C
	str r0, [r7, #0x1c]
	strh r2, [r7, #0x32]
_0814404C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814405C: .4byte 0x08595EF4
_08144060: .4byte 0x0203A854
_08144064: .4byte 0x40000000
_08144068: .4byte 0x00000000
_0814406C: .4byte 0x08143DC9
	thumb_func_end sub_08143EE0

	thumb_func_start sub_08144070
sub_08144070: @ 0x08144070
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	bl __floatsisf
	adds r4, r0, #0
	ldr r1, _08144110
	bl __mulsf3
	adds r1, r4, #0
	bl __mulsf3
	bl __fixsfsi
	adds r1, r0, #0
	subs r1, #0x2d
	strh r1, [r5, #0x26]
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _0814410A
	lsls r0, r1, #0x10
	cmp r0, #0
	blt _0814410A
	ldr r4, _08144114
	ldr r0, [r4]
	adds r0, #0x7d
	movs r1, #0xff
	strb r1, [r0]
	ldr r2, [r4]
	ldrb r1, [r2, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #3]
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r1, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
	adds r0, r5, #0
	bl sub_08143BE0
	movs r0, #0x1e
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl sub_08143B94
	movs r1, #0x3a
	ldrsh r0, [r5, r1]
	movs r1, #0x1e
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, #0xf
	strh r1, [r5, #0x3a]
	ldr r0, _08144118
	str r0, [r5, #0x1c]
	movs r0, #0x47
	bl m4aSongNumStartOrChange
	ldr r2, [r4]
	ldrb r0, [r2, #3]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #3]
_0814410A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08144110: .4byte 0x3D4CCCCD
_08144114: .4byte 0x0203A854
_08144118: .4byte 0x08143D5D
	thumb_func_end sub_08144070

	thumb_func_start sub_0814411C
sub_0814411C: @ 0x0814411C
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x32]
	adds r1, r0, #1
	strh r1, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bgt _08144164
	ldrh r4, [r3, #0x26]
	subs r0, r4, #1
	strh r0, [r3, #0x26]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2d
	bne _081441EA
	ldr r2, _0814415C
	ldr r0, _08144160
	ldr r0, [r0]
	adds r0, #0x73
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #1
	bne _081441EA
	strh r4, [r3, #0x26]
	b _081441EA
	.align 2, 0
_0814415C: .4byte 0x020205AC
_08144160: .4byte 0x0203A854
_08144164:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x3c
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bge _081441B0
	ldr r2, _081441A0
	ldr r0, _081441A4
	ldr r0, [r0]
	adds r0, #0x73
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bne _081441EA
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #1
	bne _081441A8
	ldrh r0, [r3, #0x26]
	adds r0, #1
	strh r0, [r3, #0x26]
	b _081441EA
	.align 2, 0
_081441A0: .4byte 0x020205AC
_081441A4: .4byte 0x0203A854
_081441A8:
	ldrh r0, [r3, #0x26]
	subs r0, #1
	strh r0, [r3, #0x26]
	b _081441EA
_081441B0:
	adds r2, r3, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x3f
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, ip
	strb r0, [r1]
	strh r2, [r3, #0x32]
	ldr r0, _081441F0
	str r0, [r3, #0x1c]
	movs r0, #0x3d
	bl m4aSongNumStart
_081441EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081441F0: .4byte 0x08144071
	thumb_func_end sub_0814411C

	thumb_func_start sub_081441F4
sub_081441F4: @ 0x081441F4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08143C50
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	cmp r1, #0x5a
	beq _0814420E
	movs r0, #0x87
	lsls r0, r0, #1
	cmp r1, r0
	beq _08144218
	b _08144228
_0814420E:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08144228
	b _08144220
_08144218:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08144228
_08144220:
	ldr r0, _08144230
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x32]
_08144228:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08144230: .4byte 0x0814411D
	thumb_func_end sub_081441F4

	thumb_func_start sub_08144234
sub_08144234: @ 0x08144234
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08143C50
	ldr r0, _08144258
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	cmp r0, #0
	beq _0814424E
	cmp r0, #1
	beq _08144260
_0814424E:
	adds r0, r4, #0
	bl sub_081447A8
	ldr r0, _0814425C
	b _08144268
	.align 2, 0
_08144258: .4byte 0x0203A854
_0814425C: .4byte 0x08143EE1
_08144260:
	adds r0, r4, #0
	bl sub_08144984
	ldr r0, _08144270
_08144268:
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08144270: .4byte 0x081441F5
	thumb_func_end sub_08144234

	thumb_func_start prev_quest_read_x24_hm_usage
prev_quest_read_x24_hm_usage: @ 0x08144274
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08143C50
	ldrh r0, [r5, #0x32]
	subs r0, #1
	strh r0, [r5, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0814429A
	ldr r0, _08144304
	ldr r4, [r0]
	adds r4, #0x98
	ldr r0, [r4]
	ldr r1, _08144308
	bl __mulsf3
	str r0, [r4]
_0814429A:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08144328
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08144310
	ldr r2, _08144304
	ldr r0, [r2]
	adds r0, #0x7d
	movs r1, #0xff
	strb r1, [r0]
	ldr r2, [r2]
	ldrb r1, [r2, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #3]
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r1, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
	adds r0, r5, #0
	bl sub_08143BE0
	movs r0, #0x1e
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl sub_08143B94
	movs r1, #0x3a
	ldrsh r0, [r5, r1]
	movs r1, #0x1e
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, #0xf
	strh r1, [r5, #0x3a]
	ldr r0, _0814430C
	str r0, [r5, #0x1c]
	movs r0, #0x47
	bl m4aSongNumStartOrChange
	b _08144328
	.align 2, 0
_08144304: .4byte 0x0203A854
_08144308: .4byte 0xBF800000
_0814430C: .4byte 0x08143D5D
_08144310:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0x38
	bl m4aSongNumStart
	adds r0, r5, #0
	bl sub_08144AF0
_08144328:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end prev_quest_read_x24_hm_usage

	thumb_func_start sub_08144330
sub_08144330: @ 0x08144330
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_08143C50
	movs r0, #0
	strh r0, [r6, #0x32]
	adds r0, r6, #0
	bl sub_08143BE0
	ldr r1, _081443BC
	ldr r4, _081443C0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [r2, #8]
	ands r0, r1
	cmp r0, #0
	bne _081443C8
	adds r1, r2, #0
	adds r1, #0x7d
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, [r4]
	ldrb r1, [r2, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #3]
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r1, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl StartSpriteAnim
	adds r0, r6, #0
	bl sub_08143BE0
	movs r0, #0x1e
	strh r0, [r6, #0x36]
	adds r0, r6, #0
	bl sub_08143B94
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	movs r1, #0x1e
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, #0xf
	strh r1, [r6, #0x3a]
	ldr r0, _081443C4
	str r0, [r6, #0x1c]
	movs r0, #0x47
	bl m4aSongNumStartOrChange
	b _081444C4
	.align 2, 0
_081443BC: .4byte 0x08595E90
_081443C0: .4byte 0x0203A854
_081443C4: .4byte 0x08143D5D
_081443C8:
	movs r0, #0x38
	bl m4aSongNumStart
	bl Random
	movs r1, #1
	mov r8, r1
	ands r1, r0
	mov r8, r1
	cmp r1, #0
	beq _0814440C
	ldr r4, [r4]
	adds r1, r4, #0
	adds r1, #0x8c
	ldr r0, _08144404
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0xc
	bl __modsi3
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	adds r1, r4, #0
	adds r1, #0x7f
	strb r0, [r1]
	ldr r5, _08144408
	b _08144444
	.align 2, 0
_08144404: .4byte 0x00000000
_08144408: .4byte 0x08595EF4
_0814440C:
	ldr r7, [r4]
	adds r4, r7, #0
	adds r4, #0x8c
	ldr r5, _0814446C
	ldrb r0, [r7, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl __addsf3
	str r0, [r4]
	adds r0, r7, #0
	adds r0, #0x7e
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r0, #0xb
	movs r1, #0xc
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r7, #0
	adds r0, #0x7f
	strb r4, [r0]
_08144444:
	ldr r0, _08144470
	lsls r1, r2, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r2, _08144474
	ldr r3, [r2]
	ldr r1, [r1]
	ldr r0, [r3, #8]
	ands r1, r0
	cmp r1, #0
	beq _08144478
	movs r0, #1
	strh r0, [r6, #0x2e]
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r5
	ldrb r0, [r0, #2]
	strh r0, [r6, #0x32]
	b _081444B4
	.align 2, 0
_0814446C: .4byte 0x08595EF4
_08144470: .4byte 0x08595E90
_08144474: .4byte 0x0203A854
_08144478:
	strh r1, [r6, #0x2e]
	ldrb r1, [r3, #4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08144490
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r5
	ldrb r0, [r0, #1]
	strh r0, [r6, #0x32]
	b _081444B4
_08144490:
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r5
	ldrb r0, [r0, #2]
	strh r0, [r6, #0x32]
	mov r0, r8
	cmp r0, #0
	beq _081444AC
	adds r1, r3, #0
	adds r1, #0x8c
	ldr r0, _081444A8
	b _081444B2
	.align 2, 0
_081444A8: .4byte 0x3F000000
_081444AC:
	adds r1, r3, #0
	adds r1, #0x8c
	ldr r0, _081444D0
_081444B2:
	str r0, [r1]
_081444B4:
	ldr r0, [r2]
	adds r0, #0x98
	ldr r1, _081444D4
	str r1, [r0]
	ldr r0, _081444D8
	str r0, [r6, #0x1c]
	movs r0, #5
	strh r0, [r6, #0x30]
_081444C4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081444D0: .4byte 0xBFC00000
_081444D4: .4byte 0x3DAE147B
_081444D8: .4byte 0x08144275
	thumb_func_end sub_08144330

	thumb_func_start sub_081444DC
sub_081444DC: @ 0x081444DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	bl sub_08143C50
	ldr r4, _08144570
	ldr r0, [r4]
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r1, _08144574
	bl __gtsf2
	cmp r0, #0
	bgt _081445C6
	adds r0, r6, #0
	bl sub_08143BE0
	adds r0, r6, #0
	bl sub_08143C14
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08144588
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x90
	ldr r0, _08144578
	str r0, [r1]
	movs r0, #0x8c
	adds r0, r0, r2
	mov r8, r0
	ldr r1, _0814457C
	mov sb, r1
	ldrb r0, [r2, #4]
	lsls r7, r0, #0x1e
	lsrs r0, r7, #0x19
	add r0, sb
	movs r4, #3
	ldrsb r4, [r0, r4]
	adds r0, r4, #0
	bl __floatsisf
	adds r5, r0, #0
	cmp r4, #0
	bge _08144542
	ldr r1, _08144580
	bl __addsf3
	adds r5, r0, #0
_08144542:
	lsrs r0, r7, #0x19
	add r0, sb
	ldrb r0, [r0, #4]
	adds r0, #1
	bl __floatsisf
	adds r1, r0, #0
	adds r0, r5, #0
	bl __divsf3
	adds r1, r0, #0
	mov r2, r8
	ldr r0, [r2]
	bl __subsf3
	mov r1, r8
	str r0, [r1]
	movs r0, #4
	strh r0, [r6, #0x30]
	ldr r0, _08144584
	str r0, [r6, #0x1c]
	b _081445C6
	.align 2, 0
_08144570: .4byte 0x0203A854
_08144574: .4byte 0x3F000000
_08144578: .4byte 0x00000000
_0814457C: .4byte 0x08595EF4
_08144580: .4byte 0x43800000
_08144584: .4byte 0x08144331
_08144588:
	ldr r4, [r4]
	adds r7, r4, #0
	adds r7, #0x90
	ldr r0, [r7]
	ldr r6, _081445D4
	adds r1, r6, #0
	bl __nesf2
	cmp r0, #0
	beq _081445C6
	adds r5, r4, #0
	adds r5, #0x8c
	ldr r0, [r5]
	adds r1, r6, #0
	bl __ltsf2
	cmp r0, #0
	bge _081445C6
	str r6, [r7]
	str r6, [r5]
	adds r4, #0x98
	ldr r0, [r4]
	bl __extendsfdf2
	ldr r2, _081445D8
	ldr r3, _081445DC
	bl __divdf3
	bl __truncdfsf2
	str r0, [r4]
_081445C6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081445D4: .4byte 0x00000000
_081445D8: .4byte 0x3FF33333
_081445DC: .4byte 0x33333333
	thumb_func_end sub_081444DC

	thumb_func_start sub_081445E0
sub_081445E0: @ 0x081445E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_08143C50
	ldr r0, _08144690
	ldr r5, [r0]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r1, _08144694
	bl __gtsf2
	cmp r0, #0
	bgt _08144684
	movs r0, #0x98
	adds r0, r0, r5
	mov r8, r0
	adds r7, r5, #0
	adds r7, #0x86
	movs r1, #0
	ldrsh r4, [r7, r1]
	adds r0, r4, #0
	bl __floatsisf
	adds r2, r0, #0
	cmp r4, #0
	bge _08144622
	ldr r1, _08144698
	bl __addsf3
	adds r2, r0, #0
_08144622:
	ldr r0, _0814469C
	adds r1, r2, #0
	bl __divsf3
	bl __negsf2
	mov r1, r8
	str r0, [r1]
	movs r0, #0x90
	adds r0, r0, r5
	mov r8, r0
	adds r5, #0x8c
	movs r1, #0
	ldrsh r4, [r7, r1]
	adds r0, r4, #0
	bl __floatsisf
	adds r2, r0, #0
	cmp r4, #0
	bge _08144652
	ldr r1, _08144698
	bl __addsf3
	adds r2, r0, #0
_08144652:
	ldr r0, [r5]
	adds r1, r2, #0
	bl __divsf3
	bl __negsf2
	mov r1, r8
	str r0, [r1]
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #2
	strb r0, [r1]
	adds r2, r6, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #3
	strh r0, [r6, #0x30]
	ldr r0, _081446A0
	str r0, [r6, #0x1c]
_08144684:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08144690: .4byte 0x0203A854
_08144694: .4byte 0x42200000
_08144698: .4byte 0x47800000
_0814469C: .4byte 0x40800000
_081446A0: .4byte 0x081444DD
	thumb_func_end sub_081445E0

	thumb_func_start sub_081446A4
sub_081446A4: @ 0x081446A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_08143C50
	ldr r4, _08144760
	ldr r0, [r4]
	adds r0, #0x94
	ldr r0, [r0]
	ldr r1, _08144764
	bl __gtsf2
	cmp r0, #0
	bgt _08144756
	movs r0, #0x5d
	bl m4aSongNumStartOrChange
	ldr r5, [r4]
	movs r0, #0x98
	adds r0, r0, r5
	mov r8, r0
	adds r7, r5, #0
	adds r7, #0x84
	movs r1, #0
	ldrsh r4, [r7, r1]
	adds r0, r4, #0
	bl __floatsisf
	adds r2, r0, #0
	cmp r4, #0
	bge _081446EC
	ldr r1, _08144768
	bl __addsf3
	adds r2, r0, #0
_081446EC:
	ldr r0, _0814476C
	adds r1, r2, #0
	bl __divsf3
	bl __negsf2
	mov r1, r8
	str r0, [r1]
	movs r0, #0x90
	adds r0, r0, r5
	mov r8, r0
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r1, [r0]
	ldr r0, _08144770
	bl __subsf3
	adds r5, r0, #0
	movs r1, #0
	ldrsh r4, [r7, r1]
	adds r0, r4, #0
	bl __floatsisf
	adds r2, r0, #0
	cmp r4, #0
	bge _08144728
	ldr r1, _08144768
	bl __addsf3
	adds r2, r0, #0
_08144728:
	adds r0, r5, #0
	adds r1, r2, #0
	bl __divsf3
	mov r1, r8
	str r0, [r1]
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
	adds r2, r6, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #2
	strh r0, [r6, #0x30]
	ldr r0, _08144774
	str r0, [r6, #0x1c]
_08144756:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08144760: .4byte 0x0203A854
_08144764: .4byte 0x42700000
_08144768: .4byte 0x47800000
_0814476C: .4byte 0x41A00000
_08144770: .4byte 0x3F800000
_08144774: .4byte 0x081445E1
	thumb_func_end sub_081446A4

	thumb_func_start sub_08144778
sub_08144778: @ 0x08144778
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	movs r0, #1
	strh r0, [r4, #0x30]
	strh r1, [r4, #0x32]
	adds r0, r4, #0
	bl sub_08143C50
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _081447A4
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081447A4: .4byte 0x081446A5
	thumb_func_end sub_08144778

	thumb_func_start sub_081447A8
sub_081447A8: @ 0x081447A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r1, _08144968
	mov r0, sp
	movs r2, #8
	bl memcpy
	mov r1, r8
	ldrh r0, [r1, #0x3c]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r5, _0814496C
	ldr r0, _08144970
	movs r2, #0xc
	rsbs r2, r2, #0
	movs r1, #0x24
	movs r3, #0x32
	bl CreateSprite
	ldr r1, [r5]
	adds r1, #0x73
	strb r0, [r1]
	ldr r4, _08144974
	mov r3, r8
	movs r0, #0x2e
	ldrsh r2, [r3, r0]
	lsls r2, r2, #2
	mov r1, sp
	adds r0, r1, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r0, sp
	adds r0, #2
	adds r0, r0, r2
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r4, #0
	movs r3, #0x3b
	bl CreateSprite
	ldr r1, [r5]
	adds r1, #0x74
	strb r0, [r1]
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0x24
	movs r2, #0x8c
	movs r3, #0x33
	bl CreateSprite
	ldr r1, [r5]
	adds r1, #0x75
	strb r0, [r1]
	ldr r3, _08144978
	ldr r0, [r5]
	adds r0, #0x75
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r2, [r0, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #1]
	movs r7, #0
	adds r6, r3, #0
	ldr r0, _0814497C
	mov ip, r0
	mov sl, r5
_08144848:
	ldr r0, [r5]
	adds r3, r7, #0
	adds r3, #0x37
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x3c
	adds r0, r0, r3
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
	adds r0, #0x3c
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	ldr r4, [r5]
	adds r2, r4, #0
	adds r2, #0x3c
	adds r2, r2, r3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r1, r4, #0
	adds r1, #0x73
	ldrb r1, [r1]
	strh r1, [r0, #0x36]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r1, r4, #0
	adds r1, #0x74
	ldrb r1, [r1]
	strh r1, [r0, #0x38]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r1, r4, #0
	adds r1, #0x75
	ldrb r1, [r1]
	strh r1, [r0, #0x3a]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, sb
	strh r1, [r0, #0x32]
	ldrb r0, [r2]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	mov r0, r8
	movs r1, #0x3c
	ldrsh r3, [r0, r1]
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1e
	lsrs r0, r1, #0x19
	add r0, ip
	ldrb r0, [r0, #1]
	muls r3, r0, r3
	lsrs r1, r1, #0x19
	add r1, ip
	ldrb r0, [r1, #2]
	ldr r1, _08144980
	adds r0, r0, r1
	adds r3, r3, r0
	strh r3, [r2, #0x34]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _08144978
	cmp r7, #2
	bls _08144848
	mov r3, sl
	ldr r0, [r3]
	adds r0, #0x74
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	mov r1, r8
	str r1, [r0, #0x38]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08144968: .4byte 0x085976BE
_0814496C: .4byte 0x0203A854
_08144970: .4byte 0x085975AC
_08144974: .4byte 0x08597670
_08144978: .4byte 0x020205AC
_0814497C: .4byte 0x08595EF4
_08144980: .4byte 0x0000FFFF
	thumb_func_end sub_081447A8

	thumb_func_start sub_08144984
sub_08144984: @ 0x08144984
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r1, _08144AD8
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldrh r0, [r7, #0x3c]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _08144ADC
	movs r1, #0x2e
	ldrsh r2, [r7, r1]
	lsls r2, r2, #2
	mov r3, sp
	adds r1, r3, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	mov r4, sp
	adds r4, #2
	adds r2, r4, r2
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r3, #0x32
	bl CreateSprite
	ldr r5, _08144AE0
	ldr r1, [r5]
	adds r1, #0x73
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x73
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r6, _08144AE4
	adds r0, r0, r6
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	ldr r0, _08144AE8
	movs r1, #0x2e
	ldrsh r2, [r7, r1]
	lsls r2, r2, #2
	mov r3, sp
	adds r1, r3, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r4, r4, r2
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r3, #0x33
	bl CreateSprite
	ldr r1, [r5]
	adds r1, #0x74
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x74
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, #0x74
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
	mov r0, sb
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	ldr r3, _08144AEC
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	lsls r1, r1, #0x1e
	lsrs r0, r1, #0x19
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	muls r2, r0, r2
	lsrs r1, r1, #0x19
	adds r1, r1, r3
	ldrh r0, [r1, #0x10]
	adds r0, #0x2d
	adds r2, r2, r0
	strh r2, [r7, #0x3c]
_08144A5E:
	ldr r0, _08144AE0
	ldr r4, [r0]
	mov r1, r8
	adds r2, r4, r1
	adds r2, #0x73
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r1, r4, #0
	adds r1, #0x73
	ldrb r1, [r1]
	strh r1, [r0, #0x36]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r3, r4, #0
	adds r3, #0x74
	ldrb r1, [r3]
	strh r1, [r0, #0x38]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r3]
	strh r1, [r0, #0x3a]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r3, sb
	strh r3, [r0, #0x32]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r7, #0x3c]
	subs r0, #0x2d
	strh r0, [r1, #0x34]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #1
	bls _08144A5E
	str r7, [r4, #0x38]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08144AD8: .4byte 0x085976C6
_08144ADC: .4byte 0x085975C4
_08144AE0: .4byte 0x0203A854
_08144AE4: .4byte 0x020205AC
_08144AE8: .4byte 0x085976A0
_08144AEC: .4byte 0x08595EF4
	thumb_func_end sub_08144984

	thumb_func_start sub_08144AF0
sub_08144AF0: @ 0x08144AF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	movs r1, #5
	mov r8, r1
	str r0, [sp, #0xc]
	mov r0, sp
	movs r1, #0
	movs r2, #0xa
	bl memset
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, _08144BDC
	ldr r0, [r3]
	adds r0, #0x7d
	movs r5, #1
	strb r5, [r0]
	ldr r2, [r3]
	ldrb r0, [r2, #3]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #3]
	ldr r2, [r3]
	ldrb r1, [r2, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #3]
	ldr r0, [r3]
	adds r0, #0x7e
	movs r1, #0xff
	strb r1, [r0]
	ldr r6, [r3]
	adds r4, r6, #0
	adds r4, #0x88
	movs r1, #0x34
	ldrsh r0, [r7, r1]
	bl __floatsisf
	str r0, [r4]
	adds r1, r6, #0
	adds r1, #0x98
	ldr r0, _08144BE0
	str r0, [r1]
	adds r2, r6, #0
	adds r2, #0x8c
	ldr r1, _08144BE4
	ldrb r0, [r6, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldrb r0, [r6, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, #0x21
	ldrb r0, [r6, #3]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	subs r5, r5, r0
	lsls r0, r5, #4
	subs r0, r0, r5
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r5, sb
	movs r0, #0x34
	ldrsh r2, [r7, r0]
_08144B96:
	cmp r1, r2
	bge _08144BA2
	adds r0, r1, #0
	adds r0, #0x5a
	cmp r2, r0
	ble _08144C04
_08144BA2:
	cmp r5, #3
	beq _08144BE8
	adds r0, r1, #0
	adds r0, #0x5a
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08144B96
_08144BB8:
	ldr r0, _08144BDC
	ldr r0, [r0]
	ldrb r1, [r0, #3]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	beq _08144C30
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08144C24
	movs r0, #0x98
	lsls r0, r0, #1
	movs r1, #0x3f
	rsbs r1, r1, #0
	bl PlayCry1
	b _08144C3C
	.align 2, 0
_08144BDC: .4byte 0x0203A854
_08144BE0: .4byte 0x00000000
_08144BE4: .4byte 0x08595EF4
_08144BE8:
	movs r0, #1
	strh r0, [r7, #0x2e]
	ldr r0, _08144C00
	ldr r2, [r0]
	ldrb r1, [r2, #3]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #3]
	b _08144BB8
	.align 2, 0
_08144C00: .4byte 0x0203A854
_08144C04:
	lsrs r0, r5, #1
	strh r0, [r7, #0x2e]
	ldr r0, _08144C20
	ldr r3, [r0]
	movs r1, #1
	ands r1, r5
	ldrb r2, [r3, #3]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	b _08144BB8
	.align 2, 0
_08144C20: .4byte 0x0203A854
_08144C24:
	movs r0, #0x98
	lsls r0, r0, #1
	movs r1, #0x3f
	bl PlayCry1
	b _08144C3C
_08144C30:
	movs r0, #0x99
	lsls r0, r0, #1
	movs r1, #0x3f
	rsbs r1, r1, #0
	bl PlayCry1
_08144C3C:
	movs r0, #2
	mov sl, r0
	ldr r4, _08144C70
	ldr r5, [r4]
	adds r0, r5, #0
	adds r0, #0x7f
	ldrb r0, [r0]
	adds r0, #2
	movs r1, #0xc
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r1, [r5, #3]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #1
	bne _08144C74
	ldrb r1, [r5, #4]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _08144C74
	mov r0, r8
	adds r0, #6
	b _08144C78
	.align 2, 0
_08144C70: .4byte 0x0203A854
_08144C74:
	mov r0, r8
	add r0, sl
_08144C78:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r5, sl
	cmp r5, r8
	bhs _08144CE4
	ldr r1, _08144D0C
	mov sl, r1
_08144C88:
	ldr r3, [r4]
	lsls r0, r6, #3
	ldr r1, _08144D10
	adds r0, r0, r1
	ldr r1, [r3, #8]
	ldr r2, [r0]
	ands r1, r2
	cmp r1, #0
	bne _08144CCE
	mov r0, sb
	adds r1, r0, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	add r0, sp
	strb r5, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _08144CCE
	ldrb r1, [r3, #0x1a]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r0, r3, #0
	adds r0, #0x1b
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	ands r2, r0
	cmp r2, #0
	beq _08144CCE
	str r5, [sp, #0xc]
_08144CCE:
	adds r0, r6, #1
	movs r1, #0xc
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r8
	blo _08144C88
_08144CE4:
	ldr r0, [r4]
	ldrb r1, [r0, #3]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	adds r1, #1
	ldrb r0, [r0, #2]
	ands r1, r0
	cmp r1, #0
	beq _08144D14
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _08144D14
	movs r0, #0xff
	ldr r1, [sp, #0x10]
	ands r0, r1
	cmp r0, #0xbf
	bhi _08144D14
	mov r0, sp
	ldrh r0, [r0, #0xc]
	b _08144D20
	.align 2, 0
_08144D0C: .4byte 0x08595D0C
_08144D10: .4byte 0x08595E94
_08144D14:
	ldr r0, [sp, #0x10]
	mov r1, sb
	bl __modsi3
	add r0, sp
	ldrb r0, [r0]
_08144D20:
	strh r0, [r7, #0x3c]
	ldr r1, _08144D38
	str r1, [r7, #0x1c]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08144D38: .4byte 0x08144235
	thumb_func_end sub_08144AF0

	thumb_func_start sub_08144D3C
sub_08144D3C: @ 0x08144D3C
	push {r4, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x30]
	adds r1, r0, #1
	strh r1, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x34
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08144D8C
	ldrh r0, [r2, #0x20]
	subs r0, #2
	strh r0, [r2, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08144D8C
	ldr r4, _08144D94
	ldr r3, [r4]
	ldrb r1, [r3, #3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08144D78
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r3, #3]
_08144D78:
	adds r0, r2, #0
	bl DestroySprite
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #1]
	ldr r1, [r4]
	ldr r0, _08144D98
	ldrh r0, [r0]
	strh r0, [r1, #0x34]
_08144D8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08144D94: .4byte 0x0203A854
_08144D98: .4byte 0x085976CE
	thumb_func_end sub_08144D3C

	thumb_func_start sub_08144D9C
sub_08144D9C: @ 0x08144D9C
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r1, _08144E18
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	ldrh r0, [r4, #0x30]
	adds r2, r0, #1
	strh r2, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _08144E20
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _08144DFA
	ldr r3, _08144E1C
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	lsls r2, r2, #1
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	mov r1, sp
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _08144DF2
	adds r0, r2, #4
_08144DF2:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	strh r0, [r4, #0x3c]
_08144DFA:
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
	b _08144E4A
	.align 2, 0
_08144E18: .4byte 0x085976E2
_08144E1C: .4byte 0x02021B3A
_08144E20:
	ldr r1, _08144E54
	movs r0, #0
	strh r0, [r1]
	ldr r2, _08144E58
	ldr r0, _08144E5C
	ldr r0, [r0]
	adds r0, #0x73
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r2, [r0]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	adds r0, r4, #0
	bl DestroySprite
_08144E4A:
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08144E54: .4byte 0x02021B3A
_08144E58: .4byte 0x020205AC
_08144E5C: .4byte 0x0203A854
	thumb_func_end sub_08144D9C

	thumb_func_start sub_08144E60
sub_08144E60: @ 0x08144E60
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	bl __floatsisf
	adds r4, r0, #0
	ldr r1, _08144F10
	bl __mulsf3
	adds r1, r4, #0
	bl __mulsf3
	bl __fixsfsi
	strh r0, [r5, #0x26]
	ldr r0, _08144F14
	ldr r3, [r0]
	ldr r2, _08144F18
	ldrb r0, [r3, #1]
	subs r0, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x34]
	ldrb r0, [r3, #1]
	cmp r0, #0x12
	bhi _08144EA8
	adds r0, #1
	strb r0, [r3, #1]
_08144EA8:
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #0x3c
	ble _08144F0A
	movs r0, #0
	strh r0, [r5, #0x30]
	ldr r3, _08144F1C
	str r3, [r5, #0x1c]
	ldr r2, _08144F20
	movs r0, #0x3a
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r2, #0
	adds r4, #0x1c
	adds r0, r0, r4
	str r3, [r0]
	movs r0, #0x3a
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _08144F24
	strh r1, [r0, #0x30]
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08144F28
	str r1, [r0]
	movs r0, #0xd6
	bl m4aSongNumStart
_08144F0A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08144F10: .4byte 0x3D1FBE77
_08144F14: .4byte 0x0203A854
_08144F18: .4byte 0x085976CE
_08144F1C: .4byte 0x08144D3D
_08144F20: .4byte 0x020205AC
_08144F24: .4byte 0x0000FFFE
_08144F28: .4byte 0x08144D9D
	thumb_func_end sub_08144E60

	thumb_func_start sub_08144F2C
sub_08144F2C: @ 0x08144F2C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08144FB0
	ldr r0, _08144F58
	ldr r3, [r0]
	ldr r1, [r3, #0x38]
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08144F60
	movs r0, #0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08144F5C
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	b _08144F72
	.align 2, 0
_08144F58: .4byte 0x0203A854
_08144F5C: .4byte 0x08595EF4
_08144F60:
	movs r0, #0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08144FA4
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	adds r0, #0xb4
_08144F72:
	cmp r2, r0
	bne _08145048
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	movs r0, #0x2b
	bl m4aSongNumStart
	ldr r2, _08144FA8
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r2]
	ldr r0, _08144FAC
	ldrh r0, [r0]
	strh r0, [r1, #0x34]
	b _08145048
	.align 2, 0
_08144FA4: .4byte 0x08595EF4
_08144FA8: .4byte 0x0203A854
_08144FAC: .4byte 0x085976CE
_08144FB0:
	ldr r5, _08144FF0
	ldr r3, [r5]
	ldr r2, _08144FF4
	ldrb r0, [r3, #1]
	subs r0, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x34]
	ldrb r0, [r3, #1]
	cmp r0, #0x12
	bhi _08144FD2
	adds r0, #1
	strb r0, [r3, #1]
_08144FD2:
	ldr r3, [r5]
	ldr r1, [r3, #0x38]
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08144FFC
	movs r0, #0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08144FF8
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrh r0, [r0, #0xa]
	b _0814500E
	.align 2, 0
_08144FF0: .4byte 0x0203A854
_08144FF4: .4byte 0x085976CE
_08144FF8: .4byte 0x08595EF4
_08144FFC:
	movs r0, #0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08145050
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrh r0, [r0, #0xa]
	adds r0, #0xb4
_0814500E:
	cmp r2, r0
	bne _08145048
	ldr r2, _08145054
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08145058
	str r1, [r0]
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldr r0, _0814505C
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x3c]
_08145048:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08145050: .4byte 0x08595EF4
_08145054: .4byte 0x020205AC
_08145058: .4byte 0x08144E61
_0814505C: .4byte 0x08007141
	thumb_func_end sub_08144F2C

	thumb_func_start sub_08145060
sub_08145060: @ 0x08145060
	adds r0, #0x3e
	ldrb r3, [r0]
	lsls r1, r3, #0x1d
	lsrs r1, r1, #0x1f
	movs r2, #1
	eors r2, r1
	lsls r2, r2, #2
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end sub_08145060

	thumb_func_start sub_0814507C
sub_0814507C: @ 0x0814507C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x22]
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08145094
	subs r0, r2, #1
	strh r0, [r4, #0x22]
	b _081450E8
_08145094:
	ldr r0, _081450F0
	str r0, [r4, #0x1c]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	subs r2, #0x12
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x5e
	bl m4aSongNumStop
	adds r0, r4, #0
	bl DestroySprite
	ldr r5, _081450F4
	ldr r4, _081450F8
	ldr r0, [r4]
	adds r0, #0x74
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldr r0, [r4]
	adds r0, #0x74
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
_081450E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081450F0: .4byte 0x08007141
_081450F4: .4byte 0x020205AC
_081450F8: .4byte 0x0203A854
	thumb_func_end sub_0814507C

	thumb_func_start sub_081450FC
sub_081450FC: @ 0x081450FC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0
	blt _08145126
	subs r1, #1
	strh r1, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	subs r0, #1
	strh r0, [r4, #0x22]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _08145192
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08145192
	b _0814514C
_08145126:
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0
	blt _0814515C
	subs r0, r1, #1
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08145192
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08145154
_0814514C:
	ldrh r0, [r4, #0x26]
	adds r0, #1
	strh r0, [r4, #0x26]
	b _08145192
_08145154:
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	b _08145192
_0814515C:
	movs r0, #0x2b
	bl m4aSongNumStart
	ldr r0, _08145198
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	ldrh r1, [r0, #0x2e]
	adds r1, #4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r0, _0814519C
	str r0, [r4, #0x1c]
	ldr r2, _081451A0
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r2, [r0]
	movs r1, #0x7f
	ands r1, r2
	strb r1, [r0]
_08145192:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145198: .4byte 0x0203A854
_0814519C: .4byte 0x0814507D
_081451A0: .4byte 0x020205AC
	thumb_func_end sub_081450FC

	thumb_func_start sub_081451A4
sub_081451A4: @ 0x081451A4
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r1, _08145220
	mov r0, sp
	movs r2, #2
	bl memcpy
	add r5, sp, #4
	ldr r1, _08145224
	adds r0, r5, #0
	movs r2, #0x10
	bl memcpy
	ldrh r0, [r4, #0x30]
	subs r1, r0, #1
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _08145238
	ldr r0, _08145228
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081452D4
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r4, #0x74
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	rsbs r4, r4, #0
	ldr r0, _0814522C
	ldr r5, _08145230
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayPanpotControl
	ldr r0, _08145234
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayPanpotControl
	b _081452D4
	.align 2, 0
_08145220: .4byte 0x085976FA
_08145224: .4byte 0x085976FC
_08145228: .4byte 0x0203A854
_0814522C: .4byte 0x03007510
_08145230: .4byte 0x0000FFFF
_08145234: .4byte 0x03007550
_08145238:
	lsls r0, r1, #0x10
	cmp r0, #0
	blt _08145288
	ldr r0, _08145284
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	movs r2, #0x2e
	ldrsh r0, [r0, r2]
	add r0, sp
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #7
	subs r0, r1, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r2, r0
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	subs r1, r1, r0
	lsls r1, r1, #1
	mov r0, sp
	adds r0, #5
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	b _081452D4
	.align 2, 0
_08145284: .4byte 0x0203A854
_08145288:
	movs r0, #0x5e
	bl m4aSongNumStartOrChange
	ldr r0, _081452A8
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	movs r2, #0x2e
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _081452AC
	movs r0, #0x98
	lsls r0, r0, #1
	movs r1, #0x3f
	bl PlayCry1
	b _081452B8
	.align 2, 0
_081452A8: .4byte 0x0203A854
_081452AC:
	movs r0, #0x98
	lsls r0, r0, #1
	movs r1, #0x3f
	rsbs r1, r1, #0
	bl PlayCry1
_081452B8:
	ldr r0, _081452DC
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	ldrh r1, [r0, #0x2e]
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	movs r0, #0x2d
	strh r0, [r4, #0x30]
	ldr r0, _081452E0
	str r0, [r4, #0x1c]
_081452D4:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081452DC: .4byte 0x0203A854
_081452E0: .4byte 0x081450FD
	thumb_func_end sub_081451A4

	thumb_func_start sub_081452E4
sub_081452E4: @ 0x081452E4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08145344
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldrh r0, [r4, #0x30]
	subs r1, r0, #1
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08145350
	ldr r0, _08145348
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldr r1, _0814534C
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	adds r2, #0x3e
	ldrb r3, [r2]
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _08145354
	.align 2, 0
_08145344: .4byte 0x085976FA
_08145348: .4byte 0x0203A854
_0814534C: .4byte 0x020205AC
_08145350:
	ldr r0, _0814535C
	str r0, [r4, #0x1c]
_08145354:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814535C: .4byte 0x08145061
	thumb_func_end sub_081452E4

	thumb_func_start sub_08145360
sub_08145360: @ 0x08145360
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0814539C
	ldr r3, [r0]
	ldr r1, [r3, #0x38]
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _081453A8
	movs r0, #0x34
	ldrsh r2, [r1, r0]
	ldr r1, _081453A0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrh r0, [r0, #0x12]
	adds r0, #0x5a
	cmp r2, r0
	bne _0814540A
	ldr r2, _081453A4
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x34
	b _081453D2
	.align 2, 0
_0814539C: .4byte 0x0203A854
_081453A0: .4byte 0x08595EF4
_081453A4: .4byte 0x020205AC
_081453A8:
	movs r0, #0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08145410
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldrh r0, [r0, #0x14]
	movs r1, #0x87
	lsls r1, r1, #1
	adds r0, r0, r1
	cmp r2, r0
	bne _0814540A
	ldr r2, _08145414
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x2e
_081453D2:
	strh r3, [r0, #0x30]
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x30]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08145418
	str r1, [r0]
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _0814541C
	str r1, [r0]
	movs r0, #0x2b
	bl m4aSongNumStart
_0814540A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145410: .4byte 0x08595EF4
_08145414: .4byte 0x020205AC
_08145418: .4byte 0x081452E5
_0814541C: .4byte 0x081451A5
	thumb_func_end sub_08145360

