.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08135850
sub_08135850: @ 0x08135850
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _081358A0
	movs r0, #0xd4
	lsls r0, r0, #4
	bl Alloc
	str r0, [r5]
	ldr r2, _081358A4
	adds r0, r0, r2
	movs r3, #0
	strb r4, [r0]
	ldr r0, [r5]
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r0, r4
	str r3, [r1]
	ldr r1, _081358A8
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r5]
	ldr r4, _081358AC
	adds r0, r0, r4
	strb r3, [r0]
	ldr r0, _081358B0
	str r6, [r0]
	ldr r5, [r5]
	adds r2, r5, r2
	ldrb r2, [r2]
	cmp r2, #2
	beq _081358D8
	cmp r2, #2
	bgt _081358B4
	cmp r2, #1
	beq _081358BA
	b _08135910
	.align 2, 0
_081358A0: .4byte 0x0203A81C
_081358A4: .4byte 0x00000809
_081358A8: .4byte 0x00000D34
_081358AC: .4byte 0x00000D35
_081358B0: .4byte 0x0203A814
_081358B4:
	cmp r2, #3
	beq _081358F4
	b _08135910
_081358BA:
	ldr r0, _081358CC
	adds r1, r5, r0
	ldr r0, _081358D0
	str r0, [r1]
	ldr r4, _081358D4
	adds r1, r5, r4
	movs r0, #2
	b _08135922
	.align 2, 0
_081358CC: .4byte 0x00000804
_081358D0: .4byte 0x085920E7
_081358D4: .4byte 0x00000808
_081358D8:
	ldr r1, _081358E8
	adds r0, r5, r1
	ldr r1, _081358EC
	str r1, [r0]
	ldr r4, _081358F0
	adds r0, r5, r4
	strb r2, [r0]
	b _08135924
	.align 2, 0
_081358E8: .4byte 0x00000804
_081358EC: .4byte 0x085920E9
_081358F0: .4byte 0x00000808
_081358F4:
	ldr r0, _08135904
	adds r1, r5, r0
	ldr r0, _08135908
	str r0, [r1]
	ldr r4, _0813590C
	adds r1, r5, r4
	movs r0, #2
	b _08135922
	.align 2, 0
_08135904: .4byte 0x00000804
_08135908: .4byte 0x085920EB
_0813590C: .4byte 0x00000808
_08135910:
	ldr r0, _08135930
	ldr r1, [r0]
	ldr r0, _08135934
	adds r2, r1, r0
	ldr r0, _08135938
	str r0, [r2]
	ldr r4, _0813593C
	adds r1, r1, r4
	movs r0, #3
_08135922:
	strb r0, [r1]
_08135924:
	ldr r0, _08135940
	bl SetMainCallback2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135930: .4byte 0x0203A81C
_08135934: .4byte 0x00000804
_08135938: .4byte 0x085920E4
_0813593C: .4byte 0x00000808
_08135940: .4byte 0x0813599D
	thumb_func_end sub_08135850

	thumb_func_start sub_08135944
sub_08135944: @ 0x08135944
	push {lr}
	ldr r1, _08135954
	movs r0, #1
	bl sub_08135850
	pop {r0}
	bx r0
	.align 2, 0
_08135954: .4byte 0x0805996D
	thumb_func_end sub_08135944

	thumb_func_start sub_08135958
sub_08135958: @ 0x08135958
	push {lr}
	ldr r1, _08135968
	movs r0, #2
	bl sub_08135850
	pop {r0}
	bx r0
	.align 2, 0
_08135968: .4byte 0x08085A31
	thumb_func_end sub_08135958

	thumb_func_start sub_0813596C
sub_0813596C: @ 0x0813596C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0813596C

	thumb_func_start sub_08135988
sub_08135988: @ 0x08135988
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08135988

	thumb_func_start sub_0813599C
sub_0813599C: @ 0x0813599C
	push {lr}
_0813599E:
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081359C2
	bl sub_081359C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081359C2
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0813599E
_081359C2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0813599C

	thumb_func_start sub_081359C8
sub_081359C8: @ 0x081359C8
	push {r4, lr}
	sub sp, #4
	ldr r0, _081359E8
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x12
	bls _081359DC
	b _08135C08
_081359DC:
	lsls r0, r0, #2
	ldr r1, _081359EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081359E8: .4byte 0x03002360
_081359EC: .4byte 0x081359F0
_081359F0: @ jump table
	.4byte _08135A3C @ case 0
	.4byte _08135A46 @ case 1
	.4byte _08135A58 @ case 2
	.4byte _08135A5E @ case 3
	.4byte _08135A80 @ case 4
	.4byte _08135A86 @ case 5
	.4byte _08135AA4 @ case 6
	.4byte _08135AC0 @ case 7
	.4byte _08135ADC @ case 8
	.4byte _08135AEA @ case 9
	.4byte _08135B14 @ case 10
	.4byte _08135B2C @ case 11
	.4byte _08135B4C @ case 12
	.4byte _08135B52 @ case 13
	.4byte _08135B64 @ case 14
	.4byte _08135B6A @ case 15
	.4byte _08135BB4 @ case 16
	.4byte _08135BBA @ case 17
	.4byte _08135BD4 @ case 18
_08135A3C:
	bl SetVBlankHBlankCallbacksToNull
	bl clear_scheduled_bg_copies_to_vram
	b _08135BEE
_08135A46:
	bl ScanlineEffect_Stop
	ldr r1, _08135A54
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08135BF6
	.align 2, 0
_08135A54: .4byte 0x03002360
_08135A58:
	bl FreeAllSpritePalettes
	b _08135BEE
_08135A5E:
	bl ResetPaletteFade
	ldr r2, _08135A78
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r1, _08135A7C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08135BF6
	.align 2, 0
_08135A78: .4byte 0x02037C74
_08135A7C: .4byte 0x03002360
_08135A80:
	bl ResetSpriteData
	b _08135BEE
_08135A86:
	ldr r0, _08135A9C
	ldr r0, [r0]
	ldr r1, _08135AA0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08135A96
	b _08135BEE
_08135A96:
	bl ResetTasks
	b _08135BEE
	.align 2, 0
_08135A9C: .4byte 0x0203A81C
_08135AA0: .4byte 0x00000809
_08135AA4:
	bl sub_08135C2C
	ldr r0, _08135AB8
	ldr r0, [r0]
	ldr r1, _08135ABC
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _08135BEE
	.align 2, 0
_08135AB8: .4byte 0x0203A81C
_08135ABC: .4byte 0x00000D36
_08135AC0:
	bl sub_08135C88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08135ACC
	b _08135C20
_08135ACC:
	ldr r1, _08135AD8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08135BF6
	.align 2, 0
_08135AD8: .4byte 0x03002360
_08135ADC:
	bl sub_0813629C
	bl sub_08136320
	bl sub_08136384
	b _08135BEE
_08135AEA:
	movs r0, #0x38
	movs r1, #0x40
	movs r2, #0
	bl sub_08136484
	ldr r1, _08135B08
	ldr r1, [r1]
	ldr r2, _08135B0C
	adds r1, r1, r2
	strb r0, [r1]
	ldr r1, _08135B10
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08135BF6
	.align 2, 0
_08135B08: .4byte 0x0203A81C
_08135B0C: .4byte 0x00000D2C
_08135B10: .4byte 0x03002360
_08135B14:
	ldr r0, _08135B24
	ldr r0, [r0]
	ldr r1, _08135B28
	adds r0, r0, r1
	movs r1, #7
	bl sub_08122350
	b _08135BEE
	.align 2, 0
_08135B24: .4byte 0x0203A81C
_08135B28: .4byte 0x00000D2D
_08135B2C:
	ldr r0, _08135B40
	ldrh r0, [r0, #4]
	ldr r1, _08135B44
	bl sub_08136150
	ldr r1, _08135B48
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08135BF6
	.align 2, 0
_08135B40: .4byte 0x0203A814
_08135B44: .4byte 0x00001005
_08135B48: .4byte 0x03002360
_08135B4C:
	bl sub_08135D74
	b _08135BEE
_08135B52:
	bl sub_08135E60
	ldr r1, _08135B60
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08135BF6
	.align 2, 0
_08135B60: .4byte 0x03002360
_08135B64:
	bl sub_081363FC
	b _08135BEE
_08135B6A:
	ldr r0, _08135BA0
	movs r1, #0
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08135BA4
	ldr r2, _08135BA8
	ldrh r1, [r2, #6]
	ldrh r2, [r2, #4]
	bl ListMenuInit
	ldr r2, _08135BAC
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #8]
	ldr r1, _08135BB0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08135BF6
	.align 2, 0
_08135BA0: .4byte 0x08136609
_08135BA4: .4byte 0x03006050
_08135BA8: .4byte 0x0203A814
_08135BAC: .4byte 0x03005B60
_08135BB0: .4byte 0x03002360
_08135BB4:
	bl sub_08135DF8
	b _08135BEE
_08135BBA:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r1, _08135BD0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08135BF6
	.align 2, 0
_08135BD0: .4byte 0x03002360
_08135BD4:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r2, _08135C00
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
_08135BEE:
	ldr r1, _08135C04
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_08135BF6:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08135C20
	.align 2, 0
_08135C00: .4byte 0x02037C74
_08135C04: .4byte 0x03002360
_08135C08:
	ldr r0, _08135C18
	bl SetVBlankCallback
	ldr r0, _08135C1C
	bl SetMainCallback2
	movs r0, #1
	b _08135C22
	.align 2, 0
_08135C18: .4byte 0x08135989
_08135C1C: .4byte 0x0813596D
_08135C20:
	movs r0, #0
_08135C22:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081359C8

	thumb_func_start sub_08135C2C
sub_08135C2C: @ 0x08135C2C
	push {lr}
	bl ResetVramOamAndBgCntRegs
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08135C80
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r0, _08135C84
	ldr r1, [r0]
	movs r0, #2
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_08135C80: .4byte 0x0859206C
_08135C84: .4byte 0x0203A81C
	thumb_func_end sub_08135C2C

	thumb_func_start sub_08135C88
sub_08135C88: @ 0x08135C88
	push {r4, lr}
	sub sp, #4
	ldr r0, _08135CA8
	ldr r0, [r0]
	ldr r1, _08135CAC
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #5
	bhi _08135D68
	lsls r0, r0, #2
	ldr r1, _08135CB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08135CA8: .4byte 0x0203A81C
_08135CAC: .4byte 0x00000D36
_08135CB0: .4byte 0x08135CB4
_08135CB4: @ jump table
	.4byte _08135CCC @ case 0
	.4byte _08135CE8 @ case 1
	.4byte _08135D0C @ case 2
	.4byte _08135D1C @ case 3
	.4byte _08135D28 @ case 4
	.4byte _08135D4C @ case 5
_08135CCC:
	bl reset_temp_tile_data_buffers
	ldr r1, _08135CE4
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _08135D2E
	.align 2, 0
_08135CE4: .4byte 0x08D9B4B4
_08135CE8:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08135D68
	ldr r0, _08135D04
	ldr r4, _08135D08
	ldr r1, [r4]
	bl LZDecompressVram
	ldr r1, [r4]
	b _08135D32
	.align 2, 0
_08135D04: .4byte 0x08D9BA14
_08135D08: .4byte 0x0203A81C
_08135D0C:
	ldr r0, _08135D18
	movs r1, #0
	movs r2, #0xc0
	bl LoadCompressedPalette
	b _08135D2E
	.align 2, 0
_08135D18: .4byte 0x08D9B6BC
_08135D1C:
	ldr r0, _08135D24
	bl LoadCompressedSpriteSheet
	b _08135D2E
	.align 2, 0
_08135D24: .4byte 0x08592140
_08135D28:
	ldr r0, _08135D40
	bl LoadCompressedSpritePalette
_08135D2E:
	ldr r0, _08135D44
	ldr r1, [r0]
_08135D32:
	ldr r0, _08135D48
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _08135D68
	.align 2, 0
_08135D40: .4byte 0x08592148
_08135D44: .4byte 0x0203A81C
_08135D48: .4byte 0x00000D36
_08135D4C:
	bl LoadListMenuArrowsGfx
	ldr r0, _08135D60
	ldr r0, [r0]
	ldr r1, _08135D64
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	movs r0, #1
	b _08135D6A
	.align 2, 0
_08135D60: .4byte 0x0203A81C
_08135D64: .4byte 0x00000D36
_08135D68:
	movs r0, #0
_08135D6A:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08135C88

	thumb_func_start sub_08135D74
sub_08135D74: @ 0x08135D74
	push {r4, lr}
	ldr r0, _08135DC4
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	movs r1, #1
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	movs r0, #0
	movs r1, #0xa
	movs r2, #0xd0
	bl LoadMessageBoxGfx
	ldr r0, _08135DC8
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r4, #0
_08135DA0:
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xa
	bls _08135DA0
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135DC4: .4byte 0x08592194
_08135DC8: .4byte 0x085D7B04
	thumb_func_end sub_08135D74

	thumb_func_start sub_08135DCC
sub_08135DCC: @ 0x08135DCC
	push {lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r2, _08135DF4
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized4
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_08135DF4: .4byte 0x08592168
	thumb_func_end sub_08135DCC

	thumb_func_start sub_08135DF8
sub_08135DF8: @ 0x08135DF8
	push {r4, lr}
	ldr r0, _08135E48
	bl ItemId_GetName
	adds r1, r0, #0
	movs r0, #0
	bl sub_08135DCC
	ldr r1, _08135E4C
	movs r0, #2
	bl sub_08135DCC
	ldr r1, _08135E50
	movs r0, #3
	bl sub_08135DCC
	ldr r1, _08135E54
	movs r0, #4
	bl sub_08135DCC
	ldr r1, _08135E58
	movs r0, #5
	bl sub_08135DCC
	ldr r1, _08135E5C
	movs r0, #6
	bl sub_08135DCC
	movs r4, #0
_08135E32:
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _08135E32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135E48: .4byte 0x00000111
_08135E4C: .4byte 0x085C983E
_08135E50: .4byte 0x085C9842
_08135E54: .4byte 0x085C9846
_08135E58: .4byte 0x085C984A
_08135E5C: .4byte 0x085C984E
	thumb_func_end sub_08135DF8

	thumb_func_start sub_08135E60
sub_08135E60: @ 0x08135E60
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r1, _08135F10
	ldr r0, [r1]
	ldr r2, _08135F14
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _08135EB4
	adds r5, r1, #0
_08135E76:
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	ldr r3, _08135F18
	adds r4, r4, r3
	ldr r0, [r5]
	adds r0, r0, r4
	adds r1, r6, #0
	bl sub_08135F30
	ldr r1, [r5]
	lsls r2, r6, #3
	ldr r7, _08135F1C
	adds r0, r1, r7
	adds r0, r0, r2
	adds r4, r1, r4
	str r4, [r0]
	movs r3, #0x81
	lsls r3, r3, #4
	adds r0, r1, r3
	adds r0, r0, r2
	str r6, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _08135F14
	adds r1, r1, r4
	ldrb r0, [r1]
	subs r0, #1
	cmp r6, r0
	blt _08135E76
_08135EB4:
	ldr r5, _08135F10
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	ldr r7, _08135F18
	adds r4, r4, r7
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _08135F20
	bl StringCopy
	ldr r1, [r5]
	lsls r2, r6, #3
	ldr r3, _08135F1C
	adds r0, r1, r3
	adds r0, r0, r2
	adds r4, r1, r4
	str r4, [r0]
	movs r0, #0x81
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r2
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r1]
	ldr r2, _08135F24
	adds r1, r2, #0
	ldr r0, _08135F28
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldr r1, [r5]
	ldr r4, _08135F14
	adds r0, r1, r4
	ldrb r0, [r0]
	strh r0, [r2, #0xc]
	adds r3, r1, r3
	str r3, [r2]
	ldr r6, _08135F2C
	adds r1, r1, r6
	ldrb r0, [r1]
	strh r0, [r2, #0xe]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135F10: .4byte 0x0203A81C
_08135F14: .4byte 0x0000080A
_08135F18: .4byte 0x00000954
_08135F1C: .4byte 0x0000080C
_08135F20: .4byte 0x085C985C
_08135F24: .4byte 0x03006050
_08135F28: .4byte 0x085921FC
_08135F2C: .4byte 0x0000080B
	thumb_func_end sub_08135E60

	thumb_func_start sub_08135F30
sub_08135F30: @ 0x08135F30
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	movs r1, #0
	movs r2, #0x18
	bl memset
	ldr r1, _08135FA0
	ldr r0, _08135FA4
	mov sb, r0
	ldr r0, [r0]
	lsls r4, r4, #3
	adds r0, r0, r4
	ldr r6, _08135FA8
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl StringCopy
	movs r1, #0
	strb r1, [r0]
	ldr r1, _08135FAC
	mov r8, r1
	adds r4, r4, r6
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r4
	bl sub_08136F14
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r5, #9
	ldr r1, _08135FB0
	adds r0, r5, #0
	bl StringExpandPlaceholders
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135FA0: .4byte 0x08592078
_08135FA4: .4byte 0x03005AEC
_08135FA8: .4byte 0x00000848
_08135FAC: .4byte 0x02021C40
_08135FB0: .4byte 0x085C9864
	thumb_func_end sub_08135F30

	thumb_func_start sub_08135FB4
sub_08135FB4: @ 0x08135FB4
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _08135FE0
	movs r0, #5
	bl PlaySE
	ldr r2, _08135FFC
	ldr r0, _08136000
	ldr r0, [r0]
	ldr r1, _08136004
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08136008
	str r1, [r0]
_08135FE0:
	ldr r0, _08136000
	ldr r0, [r0]
	ldr r1, _0813600C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08135FF4
	adds r0, r4, #0
	bl sub_08136010
_08135FF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135FFC: .4byte 0x020205AC
_08136000: .4byte 0x0203A81C
_08136004: .4byte 0x00000D2C
_08136008: .4byte 0x081364B1
_0813600C: .4byte 0x00000D35
	thumb_func_end sub_08135FB4

	thumb_func_start sub_08136010
sub_08136010: @ 0x08136010
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #7
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _081360E0
	ldr r1, _08136068
	lsls r0, r4, #3
	ldr r2, _0813606C
	adds r0, r0, r2
	ldr r1, [r1]
	adds r1, r1, r0
	mov r8, r1
	add r1, sp, #8
	movs r0, #0x17
	strh r0, [r1]
	movs r0, #0x18
	strh r0, [r1, #2]
	movs r5, #0
	adds r6, r1, #0
_08136046:
	adds r4, r5, #1
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl sub_0813700C
	lsls r0, r0, #0x10
	adds r7, r4, #0
	cmp r0, #0
	ble _08136070
	lsls r1, r5, #0xc
	adds r0, r1, #0
	adds r0, #0x17
	strh r0, [r6]
	adds r1, #0x18
	strh r1, [r6, #2]
	b _08136076
	.align 2, 0
_08136068: .4byte 0x03005AEC
_0813606C: .4byte 0x00000848
_08136070:
	movs r0, #0xf
	strh r0, [r6]
	strh r0, [r6, #2]
_08136076:
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r3, r0, #0
	lsls r3, r3, #0x19
	movs r0, #0xd0
	lsls r0, r0, #0x14
	adds r3, r3, r0
	lsrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	add r1, sp, #8
	adds r2, r4, #0
	bl CopyToBgTilemapBufferRect
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08136046
	ldr r4, _081360DC
	mov r0, r8
	bl sub_08136F4C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r0, #7
	adds r1, r4, #0
	bl sub_08135DCC
	b _08136138
	.align 2, 0
_081360DC: .4byte 0x02021C40
_081360E0:
	add r0, sp, #8
	movs r1, #0xf
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r5, #0
_081360EA:
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r3, r0, #0
	lsls r3, r3, #0x19
	movs r2, #0xd0
	lsls r2, r2, #0x14
	adds r3, r3, r2
	lsrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	add r1, sp, #8
	adds r2, r4, #0
	bl CopyToBgTilemapBufferRect
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _081360EA
	movs r0, #7
	movs r1, #2
	bl CopyWindowToVram
_08136138:
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08136010

	thumb_func_start sub_08136150
sub_08136150: @ 0x08136150
	push {lr}
	sub sp, #8
	adds r3, r0, #0
	lsls r3, r3, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsrs r3, r3, #0xf
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0xe
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r2, #0xf
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08136150

	thumb_func_start sub_08136180
sub_08136180: @ 0x08136180
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r2, #0
_0813618A:
	adds r1, r2, #1
	lsls r0, r1, #0x10
	lsrs r6, r0, #0x10
	mov ip, r1
	cmp r6, #0x27
	bhi _081361D2
	ldr r0, _081361E8
	mov sb, r0
	lsls r7, r2, #3
	ldr r1, _081361EC
	mov r8, r1
_081361A0:
	mov r0, sb
	ldr r2, [r0]
	adds r0, r2, r7
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _081361C8
	ldr r1, _081361EC
	adds r2, r2, r1
	adds r3, r2, r7
	ldr r4, [r3]
	ldr r5, [r3, #4]
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	str r0, [r3]
	str r1, [r3, #4]
	str r4, [r2]
	str r5, [r2, #4]
_081361C8:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x27
	bls _081361A0
_081361D2:
	mov r1, ip
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x26
	bls _0813618A
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081361E8: .4byte 0x03005AEC
_081361EC: .4byte 0x00000848
	thumb_func_end sub_08136180

	thumb_func_start sub_081361F0
sub_081361F0: @ 0x081361F0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08136244
	ldr r0, [r0]
	ldr r1, _08136248
	adds r6, r0, r1
	cmp r4, r5
	beq _08136286
	movs r0, #8
	bl Alloc
	adds r7, r0, #0
	lsls r0, r4, #3
	adds r0, r0, r6
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r7]
	str r1, [r7, #4]
	cmp r5, r4
	bls _0813624C
	subs r5, #1
	lsls r3, r4, #0x10
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	cmp r3, r0
	bge _08136274
	adds r4, r1, #0
_08136228:
	asrs r3, r3, #0x10
	lsls r2, r3, #3
	adds r2, r2, r6
	ldr r0, [r2, #8]
	ldr r1, [r2, #0xc]
	str r0, [r2]
	str r1, [r2, #4]
	adds r3, #1
	lsls r3, r3, #0x10
	asrs r0, r3, #0x10
	cmp r0, r4
	blt _08136228
	b _08136274
	.align 2, 0
_08136244: .4byte 0x03005AEC
_08136248: .4byte 0x00000848
_0813624C:
	lsls r3, r4, #0x10
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	cmp r3, r0
	ble _08136274
	adds r4, r1, #0
_08136258:
	asrs r3, r3, #0x10
	lsls r2, r3, #3
	adds r2, r2, r6
	adds r0, r2, #0
	subs r0, #8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	subs r3, #1
	lsls r3, r3, #0x10
	asrs r0, r3, #0x10
	cmp r0, r4
	bgt _08136258
_08136274:
	lsls r2, r5, #3
	adds r2, r2, r6
	ldr r0, [r7]
	ldr r1, [r7, #4]
	str r0, [r2]
	str r1, [r2, #4]
	adds r0, r7, #0
	bl Free
_08136286:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081361F0

	thumb_func_start sub_0813628C
sub_0813628C: @ 0x0813628C
	ldr r1, _08136298
	movs r0, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	bx lr
	.align 2, 0
_08136298: .4byte 0x0203A814
	thumb_func_end sub_0813628C

	thumb_func_start sub_0813629C
sub_0813629C: @ 0x0813629C
	push {r4, r5, lr}
	bl sub_08136180
	ldr r0, _081362FC
	ldr r0, [r0]
	ldr r1, _08136300
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	movs r2, #0
	ldr r5, _08136304
	ldr r4, _08136308
_081362B4:
	ldr r0, [r5]
	lsls r1, r2, #3
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r3, _081362FC
	cmp r0, #0
	beq _081362D0
	ldr r1, [r3]
	ldr r0, _08136300
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_081362D0:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x27
	bls _081362B4
	ldr r0, [r3]
	ldr r2, _08136300
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r3]
	adds r2, r0, r2
	ldrb r2, [r2]
	cmp r2, #9
	bls _08136310
	ldr r2, _0813630C
	adds r1, r0, r2
	movs r0, #9
	strb r0, [r1]
	b _08136316
	.align 2, 0
_081362FC: .4byte 0x0203A81C
_08136300: .4byte 0x0000080A
_08136304: .4byte 0x03005AEC
_08136308: .4byte 0x00000848
_0813630C: .4byte 0x0000080B
_08136310:
	ldr r1, _0813631C
	adds r0, r0, r1
	strb r2, [r0]
_08136316:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813631C: .4byte 0x0000080B
	thumb_func_end sub_0813629C

	thumb_func_start sub_08136320
sub_08136320: @ 0x08136320
	push {r4, r5, lr}
	ldr r0, _08136368
	ldrh r1, [r0, #6]
	adds r3, r0, #0
	ldr r4, _0813636C
	cmp r1, #0
	beq _08136348
	ldrh r0, [r3, #6]
	ldr r1, [r4]
	ldr r5, _08136370
	adds r2, r1, r5
	ldrb r2, [r2]
	adds r0, r0, r2
	subs r5, #1
	adds r1, r1, r5
	ldrb r1, [r1]
	cmp r0, r1
	ble _08136348
	subs r0, r1, r2
	strh r0, [r3, #6]
_08136348:
	adds r2, r3, #0
	ldrh r1, [r2, #6]
	ldrh r0, [r2, #4]
	adds r1, r1, r0
	ldr r0, [r4]
	ldr r4, _08136374
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r1, r0
	blt _0813637C
	adds r1, r0, #0
	cmp r1, #0
	bne _08136378
	strh r1, [r2, #4]
	b _0813637C
	.align 2, 0
_08136368: .4byte 0x0203A814
_0813636C: .4byte 0x0203A81C
_08136370: .4byte 0x0000080B
_08136374: .4byte 0x0000080A
_08136378:
	subs r0, #1
	strh r0, [r3, #4]
_0813637C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08136320

	thumb_func_start sub_08136384
sub_08136384: @ 0x08136384
	push {r4, r5, r6, r7, lr}
	ldr r0, _081363EC
	ldrh r1, [r0, #4]
	adds r5, r0, #0
	cmp r1, #4
	bls _081363E4
	movs r4, #0
	ldrh r0, [r5, #4]
	subs r0, #4
	cmp r4, r0
	bge _081363E4
	ldrh r2, [r5, #6]
	ldr r6, _081363F0
	ldr r0, [r6]
	ldr r3, _081363F4
	adds r1, r0, r3
	ldrb r1, [r1]
	adds r2, r2, r1
	ldr r7, _081363F8
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r2, r0
	beq _081363E4
	adds r3, r5, #0
_081363B4:
	ldrh r0, [r3, #4]
	subs r0, #1
	strh r0, [r3, #4]
	ldrh r0, [r3, #6]
	adds r0, #1
	strh r0, [r3, #6]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrh r0, [r3, #4]
	subs r0, #4
	cmp r4, r0
	bge _081363E4
	ldrh r2, [r5, #6]
	ldr r1, [r6]
	ldr r7, _081363F4
	adds r0, r1, r7
	ldrb r0, [r0]
	adds r2, r2, r0
	ldr r0, _081363F8
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r2, r1
	bne _081363B4
_081363E4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081363EC: .4byte 0x0203A814
_081363F0: .4byte 0x0203A81C
_081363F4: .4byte 0x0000080B
_081363F8: .4byte 0x0000080A
	thumb_func_end sub_08136384

	thumb_func_start sub_081363FC
sub_081363FC: @ 0x081363FC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _08136444
	ldr r1, [r4]
	ldr r2, _08136448
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0813643C
	ldr r2, _0813644C
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [sp]
	ldr r0, _08136450
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _08136454
	str r0, [sp, #0xc]
	movs r0, #2
	movs r1, #0xb0
	movs r2, #8
	movs r3, #0x98
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r4]
	ldr r2, _08136448
	adds r1, r1, r2
	strb r0, [r1]
_0813643C:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136444: .4byte 0x0203A81C
_08136448: .4byte 0x00000D34
_0813644C: .4byte 0x0000080A
_08136450: .4byte 0x00000456
_08136454: .4byte 0x0203A81A
	thumb_func_end sub_081363FC

	thumb_func_start sub_08136458
sub_08136458: @ 0x08136458
	push {r4, lr}
	ldr r4, _0813647C
	ldr r0, [r4]
	ldr r2, _08136480
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08136476
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r1, _08136480
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
_08136476:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813647C: .4byte 0x0203A81C
_08136480: .4byte 0x00000D34
	thumb_func_end sub_08136458

	thumb_func_start sub_08136484
sub_08136484: @ 0x08136484
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _081364AC
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081364AC: .4byte 0x08592150
	thumb_func_end sub_08136484

	thumb_func_start sub_081364B0
sub_081364B0: @ 0x081364B0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	ble _081364C0
	movs r0, #0
	strh r0, [r4, #0x2e]
_081364C0:
	movs r0, #0x2e
	ldrsh r5, [r4, r0]
	cmp r5, #0
	beq _081364CE
	cmp r5, #1
	beq _081364F4
	b _08136520
_081364CE:
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r0, _081364F0
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl InitSpriteAffineAnim
	movs r0, #1
	strh r0, [r4, #0x2e]
	strh r5, [r4, #0x30]
	b _08136520
	.align 2, 0
_081364F0: .4byte 0x0859213C
_081364F4:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _08136520
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	strh r2, [r4, #0x2e]
	strh r2, [r4, #0x30]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldr r0, _08136528
	str r0, [r4, #0x1c]
_08136520:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136528: .4byte 0x08007141
	thumb_func_end sub_081364B0

	thumb_func_start sub_0813652C
sub_0813652C: @ 0x0813652C
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
	ldr r1, _0813655C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08136560
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813655C: .4byte 0x03005B60
_08136560: .4byte 0x08136565
	thumb_func_end sub_0813652C

	thumb_func_start sub_08136564
sub_08136564: @ 0x08136564
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081365C8
	adds r2, r0, r1
	ldr r0, _081365CC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081365FE
	ldr r6, _081365D0
	ldr r0, [r6]
	ldr r1, _081365D4
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0813659A
	ldr r1, _081365D8
	ldr r0, _081365DC
	str r0, [r1]
_0813659A:
	ldrb r0, [r2]
	ldr r4, _081365E0
	subs r2, r4, #2
	adds r1, r4, #0
	bl DestroyListMenuTask
	bl sub_08136458
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _081365E4
	bl SetMainCallback2
	b _081365EC
	.align 2, 0
_081365C8: .4byte 0x03005B68
_081365CC: .4byte 0x02037C74
_081365D0: .4byte 0x0203A81C
_081365D4: .4byte 0x00000809
_081365D8: .4byte 0x03005B0C
_081365DC: .4byte 0x080AEA65
_081365E0: .4byte 0x0203A81A
_081365E4:
	subs r0, r4, #6
	ldr r0, [r0]
	bl SetMainCallback2
_081365EC:
	bl FreeAllWindowBuffers
	ldr r0, _08136604
	ldr r0, [r0]
	bl Free
	adds r0, r5, #0
	bl DestroyTask
_081365FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08136604: .4byte 0x0203A81C
	thumb_func_end sub_08136564

	thumb_func_start sub_08136608
sub_08136608: @ 0x08136608
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	mov r8, r0
	ldr r0, _081366A4
	mov sl, r0
	mov r6, r8
	add r6, sl
	ldr r0, _081366A8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08136634
	b _08136748
_08136634:
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08136642
	b _08136748
_08136642:
	ldr r0, _081366AC
	ldrh r1, [r0, #0x2e]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0
	beq _081366C8
	ldrb r0, [r6]
	ldr r4, _081366B0
	subs r2, r4, #2
	adds r1, r4, #0
	bl ListMenuGetScrollAndRow
	subs r4, #6
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #4]
	adds r1, r1, r0
	ldr r5, _081366B4
	ldr r0, [r5]
	ldr r2, _081366B8
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	beq _08136748
	movs r0, #5
	bl PlaySE
	ldrh r0, [r4, #4]
	ldr r1, _081366BC
	bl sub_08136150
	ldrh r0, [r4, #4]
	ldrh r4, [r4, #6]
	adds r0, r0, r4
	strh r0, [r6, #4]
	ldr r0, [r5]
	ldr r1, _081366C0
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	mov r0, sl
	subs r0, #8
	add r0, r8
	ldr r1, _081366C4
	str r1, [r0]
	b _08136748
	.align 2, 0
_081366A4: .4byte 0x03005B68
_081366A8: .4byte 0x02037C74
_081366AC: .4byte 0x03002360
_081366B0: .4byte 0x0203A81A
_081366B4: .4byte 0x0203A81C
_081366B8: .4byte 0x0000080A
_081366BC: .4byte 0x00002005
_081366C0: .4byte 0x00000D35
_081366C4: .4byte 0x0813675D
_081366C8:
	ldr r5, _08136708
	ldrh r2, [r5, #4]
	mov r8, r2
	ldrb r0, [r6]
	bl ListMenu_ProcessInput
	adds r4, r0, #0
	ldrb r0, [r6]
	adds r1, r5, #6
	adds r2, r5, #4
	bl ListMenuGetScrollAndRow
	ldrh r0, [r5, #4]
	cmp r8, r0
	beq _081366F6
	mov r0, r8
	movs r1, #5
	bl sub_08136150
	ldrh r0, [r5, #4]
	ldr r1, _0813670C
	bl sub_08136150
_081366F6:
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08136710
	adds r0, #1
	cmp r4, r0
	bne _08136738
	b _08136748
	.align 2, 0
_08136708: .4byte 0x0203A814
_0813670C: .4byte 0x00001005
_08136710:
	movs r0, #5
	bl PlaySE
	ldr r0, _0813672C
	ldr r2, _08136730
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08136734
	mov r1, sb
	strh r1, [r0]
	adds r0, r7, #0
	bl sub_0813652C
	b _08136748
	.align 2, 0
_0813672C: .4byte 0x02037290
_08136730: .4byte 0x0000FFFF
_08136734: .4byte 0x0203CB48
_08136738:
	movs r0, #5
	bl PlaySE
	ldr r0, _08136758
	strh r4, [r0]
	adds r0, r7, #0
	bl sub_08136978
_08136748:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136758: .4byte 0x0203CB48
	thumb_func_end sub_08136608

	thumb_func_start sub_0813675C
sub_0813675C: @ 0x0813675C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _081367A0
	adds r7, r0, r1
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08136782
	b _08136888
_08136782:
	ldr r0, _081367A4
	ldrh r1, [r0, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081367AC
	movs r0, #5
	bl PlaySE
	ldrb r0, [r7]
	ldr r1, _081367A8
	subs r2, r1, #2
	bl ListMenuGetScrollAndRow
	b _08136862
	.align 2, 0
_081367A0: .4byte 0x03005B68
_081367A4: .4byte 0x03002360
_081367A8: .4byte 0x0203A81A
_081367AC:
	ldr r6, _081367F0
	ldrh r4, [r6, #6]
	ldrh r5, [r6, #4]
	ldrb r0, [r7]
	bl ListMenu_ProcessInput
	mov sb, r0
	ldrb r0, [r7]
	adds r1, r6, #6
	adds r2, r6, #4
	bl ListMenuGetScrollAndRow
	ldrh r0, [r6, #6]
	cmp r4, r0
	bne _081367D0
	ldrh r6, [r6, #4]
	cmp r5, r6
	beq _0813680A
_081367D0:
	movs r4, #0
_081367D2:
	ldr r0, _081367F0
	ldrh r0, [r0, #6]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #4
	ldrsh r0, [r7, r1]
	cmp r5, r0
	bne _081367F8
	adds r0, r4, #0
	ldr r1, _081367F4
	bl sub_08136150
	b _08136800
	.align 2, 0
_081367F0: .4byte 0x0203A814
_081367F4: .4byte 0x00002005
_081367F8:
	adds r0, r4, #0
	movs r1, #5
	bl sub_08136150
_08136800:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #8
	bls _081367D2
_0813680A:
	ldr r5, _08136844
	ldr r0, [r5]
	ldr r4, _08136848
	adds r0, r0, r4
	movs r1, #7
	movs r2, #0
	bl sub_08122408
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _0813684C
	ldrh r3, [r1, #4]
	lsls r3, r3, #4
	adds r3, #8
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #7
	movs r2, #0x80
	bl sub_08122454
	movs r0, #2
	rsbs r0, r0, #0
	cmp sb, r0
	beq _08136850
	adds r0, #1
	cmp sb, r0
	bne _0813687A
	b _08136888
	.align 2, 0
_08136844: .4byte 0x0203A81C
_08136848: .4byte 0x00000D2D
_0813684C: .4byte 0x0203A814
_08136850:
	movs r0, #5
	bl PlaySE
	ldr r0, _0813686C
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08136870
_08136862:
	mov r0, r8
	movs r1, #0
	bl sub_08136894
	b _08136888
	.align 2, 0
_0813686C: .4byte 0x03002360
_08136870:
	mov r0, r8
	movs r1, #1
	bl sub_08136894
	b _08136888
_0813687A:
	movs r0, #5
	bl PlaySE
	mov r0, r8
	movs r1, #0
	bl sub_08136894
_08136888:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0813675C

	thumb_func_start sub_08136894
sub_08136894: @ 0x08136894
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _08136954
	adds r6, r0, r1
	ldr r2, _08136958
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #6]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0813695C
	ldr r0, [r0]
	ldr r1, _08136960
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r6]
	adds r1, r2, #6
	adds r2, #4
	bl DestroyListMenuTask
	cmp r4, #0
	bne _081368EA
	movs r0, #4
	ldrsh r1, [r6, r0]
	cmp r1, r5
	beq _081368FA
	subs r0, r5, #1
	cmp r1, r0
	beq _081368EA
	adds r0, r1, #0
	adds r1, r5, #0
	bl sub_081361F0
	bl sub_08135E60
_081368EA:
	movs r1, #4
	ldrsh r0, [r6, r1]
	cmp r0, r5
	bge _081368FA
	ldr r1, _08136958
	ldrh r0, [r1, #4]
	subs r0, #1
	strh r0, [r1, #4]
_081368FA:
	ldr r0, _08136964
	ldr r2, _08136958
	ldrh r1, [r2, #6]
	ldrh r2, [r2, #4]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _0813695C
	ldr r0, [r0]
	ldr r1, _08136968
	adds r0, r0, r1
	movs r1, #7
	movs r2, #1
	bl sub_08122408
	movs r4, #0
	lsls r5, r7, #2
_08136926:
	adds r0, r4, #0
	movs r1, #5
	bl sub_08136150
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #8
	bls _08136926
	ldr r0, _08136958
	ldrh r0, [r0, #4]
	ldr r1, _0813696C
	bl sub_08136150
	ldr r1, _08136970
	adds r0, r5, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08136974
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136954: .4byte 0x03005B68
_08136958: .4byte 0x0203A814
_0813695C: .4byte 0x0203A81C
_08136960: .4byte 0x00000D35
_08136964: .4byte 0x03006050
_08136968: .4byte 0x00000D2D
_0813696C: .4byte 0x00001005
_08136970: .4byte 0x03005B60
_08136974: .4byte 0x08136609
	thumb_func_end sub_08136894

	thumb_func_start sub_08136978
sub_08136978: @ 0x08136978
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	ldr r1, _081369A4
	adds r7, r0, r1
	ldr r0, _081369A8
	ldr r0, [r0]
	ldr r1, _081369AC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _081369B0
	movs r0, #8
	b _081369B2
	.align 2, 0
_081369A4: .4byte 0x03005B68
_081369A8: .4byte 0x0203A81C
_081369AC: .4byte 0x00000808
_081369B0:
	movs r0, #9
_081369B2:
	strh r0, [r7, #2]
	bl sub_08136458
	ldrb r0, [r7, #2]
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	ldrb r0, [r7, #2]
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r6, #0x10
	str r6, [sp, #4]
	ldr r5, _08136A38
	ldr r2, [r5]
	ldr r4, _08136A3C
	adds r1, r2, r4
	ldrb r1, [r1]
	str r1, [sp, #8]
	ldr r1, _08136A40
	str r1, [sp, #0xc]
	ldr r1, _08136A44
	adds r2, r2, r1
	ldr r1, [r2]
	str r1, [sp, #0x10]
	movs r1, #1
	movs r2, #8
	movs r3, #2
	bl AddItemMenuActionTextPrinters
	ldrb r0, [r7, #2]
	str r6, [sp]
	ldr r1, [r5]
	adds r1, r1, r4
	ldrb r1, [r1]
	str r1, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	ldrb r0, [r7, #2]
	bl PutWindowTilemap
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08136A48
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08136A4C
	str r1, [r0]
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136A38: .4byte 0x0203A81C
_08136A3C: .4byte 0x00000808
_08136A40: .4byte 0x085920B4
_08136A44: .4byte 0x00000804
_08136A48: .4byte 0x03005B60
_08136A4C: .4byte 0x08136A51
	thumb_func_end sub_08136978

	thumb_func_start sub_08136A50
sub_08136A50: @ 0x08136A50
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08136AAC
	bl Menu_ProcessInputNoWrap
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08136AAC
	adds r0, #1
	cmp r4, r0
	bne _08136A88
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_08136E58
	b _08136AAC
_08136A88:
	movs r0, #5
	bl PlaySE
	ldr r1, _08136AB4
	ldr r0, _08136AB8
	ldr r0, [r0]
	ldr r2, _08136ABC
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
_08136AAC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08136AB4: .4byte 0x085920B4
_08136AB8: .4byte 0x0203A81C
_08136ABC: .4byte 0x00000804
	thumb_func_end sub_08136A50

	thumb_func_start sub_08136AC0
sub_08136AC0: @ 0x08136AC0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08136ADC
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r1, r2
	ldr r2, _08136AE0
	str r2, [r1]
	bl sub_0813652C
	pop {r0}
	bx r0
	.align 2, 0
_08136ADC: .4byte 0x0203A81C
_08136AE0: .4byte 0x08136AE5
	thumb_func_end sub_08136AC0

	thumb_func_start sub_08136AE4
sub_08136AE4: @ 0x08136AE4
	push {lr}
	ldr r2, _08136B00
	ldr r0, _08136B04
	ldrh r1, [r0]
	lsls r1, r1, #3
	ldr r0, _08136B08
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r1, _08136B0C
	bl ChooseMonToGivePokeblock
	pop {r0}
	bx r0
	.align 2, 0
_08136B00: .4byte 0x03005AEC
_08136B04: .4byte 0x0203CB48
_08136B08: .4byte 0x00000848
_08136B0C: .4byte 0x08136B11
	thumb_func_end sub_08136AE4

	thumb_func_start sub_08136B10
sub_08136B10: @ 0x08136B10
	push {lr}
	ldr r0, _08136B20
	ldr r1, [r0]
	movs r0, #0
	bl sub_08135850
	pop {r0}
	bx r0
	.align 2, 0
_08136B20: .4byte 0x0203A814
	thumb_func_end sub_08136B10

	thumb_func_start sub_08136B24
sub_08136B24: @ 0x08136B24
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08136B94
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldr r0, _08136B98
	ldr r3, _08136B9C
	ldr r1, _08136BA0
	ldr r2, [r1]
	ldr r1, _08136BA4
	ldrh r1, [r1]
	lsls r1, r1, #3
	adds r2, r2, r1
	ldr r1, _08136BA8
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl StringCopy
	ldr r5, _08136BAC
	ldr r1, _08136BB0
	adds r0, r5, #0
	bl StringExpandPlaceholders
	bl GetPlayerTextSpeedDelay
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	ldr r0, _08136BB4
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xa
	movs r3, #0xd
	bl DisplayMessageAndContinueTask
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136B94: .4byte 0x03005B68
_08136B98: .4byte 0x02021C40
_08136B9C: .4byte 0x08592078
_08136BA0: .4byte 0x03005AEC
_08136BA4: .4byte 0x0203CB48
_08136BA8: .4byte 0x00000848
_08136BAC: .4byte 0x02021C7C
_08136BB0: .4byte 0x085C9869
_08136BB4: .4byte 0x08136BB9
	thumb_func_end sub_08136B24

	thumb_func_start sub_08136BB8
sub_08136BB8: @ 0x08136BB8
	push {lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08136BE0
	movs r2, #2
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0xe
	str r2, [sp, #8]
	ldr r2, _08136BE4
	str r2, [sp, #0xc]
	movs r2, #1
	movs r3, #0
	bl CreateYesNoMenuWithCallbacks
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08136BE0: .4byte 0x085921F4
_08136BE4: .4byte 0x085920F0
	thumb_func_end sub_08136BB8

	thumb_func_start sub_08136BE8
sub_08136BE8: @ 0x08136BE8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _08136C24
	ldr r1, _08136C28
	adds r0, r5, #0
	bl StringExpandPlaceholders
	bl GetPlayerTextSpeedDelay
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	ldr r0, _08136C2C
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xa
	movs r3, #0xd
	bl DisplayMessageAndContinueTask
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136C24: .4byte 0x02021C7C
_08136C28: .4byte 0x085C987B
_08136C2C: .4byte 0x08136C31
	thumb_func_end sub_08136BE8

	thumb_func_start sub_08136C30
sub_08136C30: @ 0x08136C30
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08136CAC
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08136CA6
	ldr r0, _08136CB0
	ldrb r0, [r0]
	bl sub_08136FD8
	movs r0, #5
	bl PlaySE
	ldr r5, _08136CB4
	subs r6, r5, #2
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, _08136CB8
	adds r4, r4, r0
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl DestroyListMenuTask
	ldrh r0, [r6]
	movs r1, #5
	bl sub_08136150
	bl sub_0813629C
	bl sub_08136320
	bl sub_08135E60
	ldr r0, _08136CBC
	ldrh r1, [r5]
	ldrh r2, [r6]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldrh r0, [r6]
	ldr r1, _08136CC0
	bl sub_08136150
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r7, #0
	bl sub_08136CC4
_08136CA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136CAC: .4byte 0x03002360
_08136CB0: .4byte 0x0203CB48
_08136CB4: .4byte 0x0203A81A
_08136CB8: .4byte 0x03005B68
_08136CBC: .4byte 0x03006050
_08136CC0: .4byte 0x00001005
	thumb_func_end sub_08136C30

	thumb_func_start sub_08136CC4
sub_08136CC4: @ 0x08136CC4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0xa
	movs r1, #0
	bl ClearDialogWindowAndFrameToTransparent
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_081363FC
	ldr r1, _08136CF4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08136CF8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136CF4: .4byte 0x03005B60
_08136CF8: .4byte 0x08136609
	thumb_func_end sub_08136CC4

	thumb_func_start sub_08136CFC
sub_08136CFC: @ 0x08136CFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08136D68
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08136D6C
	ldr r7, _08136D70
	ldrh r2, [r7]
	lsls r2, r2, #3
	ldr r6, _08136D74
	adds r2, r2, r6
	ldr r1, [r5]
	adds r1, r1, r2
	bl sub_08137054
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08136D78
	ldr r3, _08136D7C
	ldr r2, [r5]
	ldrh r1, [r7]
	lsls r1, r1, #3
	adds r2, r2, r1
	adds r2, r2, r6
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl StringCopy
	ldrb r0, [r7]
	bl sub_08136FD8
	ldr r1, [r5]
	ldrh r0, [r7]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r6
	ldrb r0, [r1]
	lsls r0, r0, #8
	strh r0, [r7]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0
	bne _08136D80
	adds r0, #1
	b _08136D8A
	.align 2, 0
_08136D68: .4byte 0x020243E8
_08136D6C: .4byte 0x03005AEC
_08136D70: .4byte 0x0203CB48
_08136D74: .4byte 0x00000848
_08136D78: .4byte 0x02022C0C
_08136D7C: .4byte 0x08592078
_08136D80:
	cmp r4, #0
	ble _08136D88
	adds r0, #2
	b _08136D8A
_08136D88:
	adds r0, #3
_08136D8A:
	strh r0, [r7]
	mov r0, r8
	bl sub_0813652C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08136CFC

	thumb_func_start sub_08136D9C
sub_08136D9C: @ 0x08136D9C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _08136DE8
	ldrb r0, [r5]
	bl SafariZoneActivatePokeblockFeeder
	ldr r0, _08136DEC
	ldr r3, _08136DF0
	ldr r1, _08136DF4
	ldr r2, [r1]
	ldrh r1, [r5]
	lsls r1, r1, #3
	adds r2, r2, r1
	ldr r1, _08136DF8
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl StringCopy
	ldr r1, _08136DFC
	ldrh r0, [r5]
	strh r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08136FD8
	movs r0, #0
	strh r0, [r5]
	adds r0, r4, #0
	bl sub_0813652C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136DE8: .4byte 0x0203CB48
_08136DEC: .4byte 0x02021C40
_08136DF0: .4byte 0x08592078
_08136DF4: .4byte 0x03005AEC
_08136DF8: .4byte 0x00000848
_08136DFC: .4byte 0x02037290
	thumb_func_end sub_08136D9C

	thumb_func_start sub_08136E00
sub_08136E00: @ 0x08136E00
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _08136E44
	ldr r0, _08136E48
	ldr r5, _08136E4C
	ldrh r1, [r5]
	lsls r1, r1, #3
	ldr r2, _08136E50
	adds r1, r1, r2
	ldr r0, [r0]
	adds r0, r0, r1
	bl GivePokeblockToContestLady
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
	ldr r1, _08136E54
	ldrh r0, [r5]
	strh r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08136FD8
	movs r0, #0
	strh r0, [r5]
	adds r0, r4, #0
	bl sub_0813652C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08136E44: .4byte 0x02037280
_08136E48: .4byte 0x03005AEC
_08136E4C: .4byte 0x0203CB48
_08136E50: .4byte 0x00000848
_08136E54: .4byte 0x02037290
	thumb_func_end sub_08136E00

	thumb_func_start sub_08136E58
sub_08136E58: @ 0x08136E58
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _08136E88
	adds r0, r4, r5
	ldrb r0, [r0, #2]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_081363FC
	subs r5, #8
	adds r4, r4, r5
	ldr r0, _08136E8C
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136E88: .4byte 0x03005B68
_08136E8C: .4byte 0x08136609
	thumb_func_end sub_08136E58

	thumb_func_start sub_08136E90
sub_08136E90: @ 0x08136E90
	push {r4, lr}
	lsls r0, r0, #0x18
	ldr r3, _08136EE8
	ldr r1, [r3]
	lsrs r0, r0, #0x15
	adds r1, r1, r0
	ldr r2, _08136EEC
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r4, _08136EF0
	adds r1, r1, r4
	strb r2, [r1]
	ldr r1, [r3]
	adds r1, r1, r0
	adds r4, #1
	adds r1, r1, r4
	strb r2, [r1]
	ldr r1, [r3]
	adds r1, r1, r0
	adds r4, #1
	adds r1, r1, r4
	strb r2, [r1]
	ldr r1, [r3]
	adds r1, r1, r0
	adds r4, #1
	adds r1, r1, r4
	strb r2, [r1]
	ldr r1, [r3]
	adds r1, r1, r0
	adds r4, #1
	adds r1, r1, r4
	strb r2, [r1]
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r0, _08136EF4
	adds r1, r1, r0
	strb r2, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136EE8: .4byte 0x03005AEC
_08136EEC: .4byte 0x00000848
_08136EF0: .4byte 0x00000849
_08136EF4: .4byte 0x0000084E
	thumb_func_end sub_08136E90

	thumb_func_start sub_08136EF8
sub_08136EF8: @ 0x08136EF8
	push {r4, lr}
	movs r4, #0
_08136EFC:
	adds r0, r4, #0
	bl sub_08136E90
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x27
	bls _08136EFC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08136EF8

	thumb_func_start sub_08136F14
sub_08136F14: @ 0x08136F14
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #1
	bl sub_0813700C
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #1
_08136F24:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0813700C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bhs _08136F3C
	adds r5, r0, #0
_08136F3C:
	adds r1, r4, #0
	cmp r1, #4
	bls _08136F24
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08136F14

	thumb_func_start sub_08136F4C
sub_08136F4C: @ 0x08136F4C
	push {lr}
	movs r1, #6
	bl sub_0813700C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bls _08136F5E
	movs r0, #0x63
_08136F5E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08136F4C

	thumb_func_start sub_08136F64
sub_08136F64: @ 0x08136F64
	push {lr}
	movs r1, #0
	ldr r0, _08136F80
	ldr r2, [r0]
	ldr r3, _08136F84
_08136F6E:
	lsls r0, r1, #3
	adds r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08136F88
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	b _08136F96
	.align 2, 0
_08136F80: .4byte 0x03005AEC
_08136F84: .4byte 0x00000848
_08136F88:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x27
	bls _08136F6E
	movs r0, #1
	rsbs r0, r0, #0
_08136F96:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08136F64

	thumb_func_start sub_08136F9C
sub_08136F9C: @ 0x08136F9C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08136F64
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08136FD0
	ldr r0, _08136FC8
	ldr r2, [r0]
	lsls r0, r1, #3
	ldr r1, _08136FCC
	adds r2, r2, r1
	adds r2, r2, r0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	str r0, [r2]
	str r1, [r2, #4]
	movs r0, #1
	b _08136FD2
	.align 2, 0
_08136FC8: .4byte 0x03005AEC
_08136FCC: .4byte 0x00000848
_08136FD0:
	movs r0, #0
_08136FD2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08136F9C

	thumb_func_start sub_08136FD8
sub_08136FD8: @ 0x08136FD8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08136FFC
	ldr r0, [r0]
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, _08137000
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08137004
	adds r0, r2, #0
	bl sub_08136E90
	movs r0, #1
	b _08137006
	.align 2, 0
_08136FFC: .4byte 0x03005AEC
_08137000: .4byte 0x00000848
_08137004:
	movs r0, #0
_08137006:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08136FD8

	thumb_func_start sub_0813700C
sub_0813700C: @ 0x0813700C
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r1, #0
	cmp r1, #0
	bne _0813701C
	ldrb r0, [r0]
	b _0813704E
_0813701C:
	cmp r1, #1
	bne _08137024
	ldrb r0, [r0, #1]
	b _0813704E
_08137024:
	cmp r1, #2
	bne _0813702C
	ldrb r0, [r0, #2]
	b _0813704E
_0813702C:
	cmp r1, #3
	bne _08137034
	ldrb r0, [r0, #3]
	b _0813704E
_08137034:
	cmp r1, #4
	bne _0813703C
	ldrb r0, [r0, #4]
	b _0813704E
_0813703C:
	cmp r1, #5
	bne _08137044
	ldrb r0, [r0, #5]
	b _0813704E
_08137044:
	cmp r2, #6
	beq _0813704C
	movs r0, #0
	b _0813704E
_0813704C:
	ldrb r0, [r0, #6]
_0813704E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0813700C

	thumb_func_start sub_08137054
sub_08137054: @ 0x08137054
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	movs r4, #0
	ldr r1, _081370B0
	mov sb, r1
	lsls r1, r0, #2
	adds r7, r1, r0
_0813706E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, r8
	adds r1, r5, #0
	bl sub_0813700C
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	ble _0813709A
	adds r0, r7, r4
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r1, r0, r1
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_0813709A:
	adds r4, r5, #0
	cmp r4, #4
	bls _0813706E
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081370B0: .4byte 0x08591FEC
	thumb_func_end sub_08137054

	thumb_func_start sub_081370B4
sub_081370B4: @ 0x081370B4
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #0
	bl sub_0813700C
	lsls r0, r0, #0x18
	ldr r1, _081370D4
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081370D4: .4byte 0x08592078
	thumb_func_end sub_081370B4

	thumb_func_start sub_081370D8
sub_081370D8: @ 0x081370D8
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r7, _08137108
_081370E4:
	lsls r1, r4, #3
	ldr r0, _0813710C
	adds r1, r1, r0
	adds r0, r5, #0
	bl sub_08137054
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08137110
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r6, #0
	bl StringCopy
	movs r0, #1
	b _0813711C
	.align 2, 0
_08137108: .4byte 0x08592078
_0813710C: .4byte 0x0859216C
_08137110:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _081370E4
	movs r0, #0
_0813711C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081370D8

	thumb_func_start sub_08137124
sub_08137124: @ 0x08137124
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	movs r6, #0
_0813712C:
	adds r1, r7, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_0813700C
	adds r4, r0, #0
	adds r1, r6, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_0813700C
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsls r1, r6, #0x10
	cmp r4, r0
	bge _08137152
	lsrs r7, r1, #0x10
_08137152:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r1, r2
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0813712C
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08137124

