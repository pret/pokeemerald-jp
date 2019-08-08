.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start vblankcb_mystery_gift_e_reader_run
vblankcb_mystery_gift_e_reader_run: @ 0x08017EBC
	push {lr}
	bl ProcessSpriteCopyRequests
	bl LoadOam
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end vblankcb_mystery_gift_e_reader_run

	thumb_func_start c2_mystery_gift_e_reader_run
c2_mystery_gift_e_reader_run: @ 0x08017ED0
	push {lr}
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end c2_mystery_gift_e_reader_run

	thumb_func_start HandleMysteryGiftOrEReaderSetup
HandleMysteryGiftOrEReaderSetup: @ 0x08017EE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _08017F08
	movs r1, #0x87
	lsls r1, r1, #3
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r0, #1
	bne _08017EFE
	b _0801800C
_08017EFE:
	cmp r0, #1
	bgt _08017F0C
	cmp r0, #0
	beq _08017F1A
	b _080180D8
	.align 2, 0
_08017F08: .4byte 0x03002360
_08017F0C:
	cmp r0, #2
	bne _08017F12
	b _0801808C
_08017F12:
	cmp r0, #3
	bne _08017F18
	b _080180AC
_08017F18:
	b _080180D8
_08017F1A:
	movs r0, #0
	bl SetVBlankCallback
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl ScanlineEffect_Stop
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08018004
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl Alloc
	adds r1, r0, #0
	movs r0, #3
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl Alloc
	adds r1, r0, #0
	movs r0, #2
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl Alloc
	adds r1, r0, #0
	movs r0, #1
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl Alloc
	adds r1, r0, #0
	movs r0, #0
	bl SetBgTilemapBuffer
	movs r0, #3
	bl bgid_upload_textbox_1
	ldr r0, _08018008
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl ClearGpuRegBits
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	b _080180A4
	.align 2, 0
_08018004: .4byte 0x082C24A4
_08018008: .4byte 0x082C24B4
_0801800C:
	ldr r0, _08018088
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #2
	bl stdpal_get
	movs r1, #0xd0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0xc0
	bl Menu_LoadStdPalAt
	movs r0, #0
	movs r1, #0xa
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	movs r0, #0
	movs r1, #1
	movs r2, #0xf0
	bl LoadUserWindowBorderGfx_
	movs r4, #0x20
	str r4, [sp]
	str r4, [sp, #4]
	movs r5, #0x11
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #3
	bl MG_DrawCheckerboardPattern
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl PrintMysteryGiftOrEReaderTopMenu
	b _080180A4
	.align 2, 0
_08018088: .4byte 0x082C2454
_0801808C:
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	bl CopyBgTilemapBufferToVram
_080180A4:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _080180D8
_080180AC:
	movs r0, #0
	bl ShowBg
	movs r0, #3
	bl ShowBg
	ldr r0, _080180D0
	bl PlayBGM
	ldr r0, _080180D4
	bl SetVBlankCallback
	movs r0, #0xc5
	bl EnableInterrupts
	movs r0, #1
	b _080180DA
	.align 2, 0
_080180D0: .4byte 0x0000021D
_080180D4: .4byte 0x08017EBD
_080180D8:
	movs r0, #0
_080180DA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end HandleMysteryGiftOrEReaderSetup

	thumb_func_start c2_mystery_gift
c2_mystery_gift: @ 0x080180E4
	push {lr}
	movs r0, #0
	bl HandleMysteryGiftOrEReaderSetup
	cmp r0, #0
	beq _08018100
	ldr r0, _08018108
	bl SetMainCallback2
	ldr r1, _0801810C
	movs r0, #0
	strb r0, [r1]
	bl task_add_00_mystery_gift
_08018100:
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
_08018108: .4byte 0x08017ED1
_0801810C: .4byte 0x02022914
	thumb_func_end c2_mystery_gift

	thumb_func_start c2_ereader
c2_ereader: @ 0x08018110
	push {lr}
	movs r0, #1
	bl HandleMysteryGiftOrEReaderSetup
	cmp r0, #0
	beq _0801812C
	ldr r0, _08018130
	bl SetMainCallback2
	ldr r1, _08018134
	movs r0, #1
	strb r0, [r1]
	bl task_add_00_ereader
_0801812C:
	pop {r0}
	bx r0
	.align 2, 0
_08018130: .4byte 0x08017ED1
_08018134: .4byte 0x02022914
	thumb_func_end c2_ereader

	thumb_func_start MainCB_FreeAllBuffersAndReturnToInitTitleScreen
MainCB_FreeAllBuffersAndReturnToInitTitleScreen: @ 0x08018138
	push {lr}
	ldr r1, _08018178
	movs r0, #0
	strb r0, [r1]
	bl FreeAllWindowBuffers
	movs r0, #0
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #2
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #3
	bl GetBgTilemapBuffer
	bl Free
	ldr r0, _0801817C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08018178: .4byte 0x02022914
_0801817C: .4byte 0x080AA06D
	thumb_func_end MainCB_FreeAllBuffersAndReturnToInitTitleScreen

	thumb_func_start PrintMysteryGiftOrEReaderTopMenu
PrintMysteryGiftOrEReaderTopMenu: @ 0x08018180
	push {r4, r5, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	cmp r5, #0
	bne _080181D4
	str r5, [sp]
	str r5, [sp, #4]
	ldr r4, _080181C8
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	ldr r0, _080181CC
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl AddTextPrinterParameterized4
	str r5, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	ldr r0, _080181D0
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #0
	movs r2, #0x64
	movs r3, #2
	bl AddTextPrinterParameterized4
	b _08018208
	.align 2, 0
_080181C8: .4byte 0x082C2B64
_080181CC: .4byte 0x082C2B44
_080181D0: .4byte 0x082C2B50
_080181D4:
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	ldr r5, _08018220
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, _08018224
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl AddTextPrinterParameterized4
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, _08018228
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #0
	movs r2, #0x78
	movs r3, #2
	bl AddTextPrinterParameterized4
_08018208:
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	bl PutWindowTilemap
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018220: .4byte 0x082C2B64
_08018224: .4byte 0x085CCED5
_08018228: .4byte 0x085CCEDF
	thumb_func_end PrintMysteryGiftOrEReaderTopMenu

	thumb_func_start MG_DrawTextBorder
MG_DrawTextBorder: @ 0x0801822C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #0xf
	bl DrawTextBorderOuter
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MG_DrawTextBorder

	thumb_func_start MG_DrawCheckerboardPattern
MG_DrawCheckerboardPattern: @ 0x08018240
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r0, r4, #0x18
	movs r1, #0x20
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #0x11
	str r1, [sp, #8]
	movs r1, #3
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	mov r8, r4
	movs r4, #1
_08018270:
	movs r7, #0
	mov r0, sb
	adds r0, #2
	movs r1, #1
	add r1, sb
	mov sl, r1
	lsls r5, r0, #0x18
	movs r6, #0
_08018280:
	mov r1, sb
	ands r1, r4
	adds r0, r7, #0
	ands r0, r4
	cmp r1, r0
	beq _080182A4
	lsrs r2, r6, #0x18
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	mov r1, r8
	lsrs r0, r1, #0x18
	movs r1, #1
	lsrs r3, r5, #0x18
	bl FillBgTilemapBufferRect
	b _080182BA
_080182A4:
	lsrs r2, r6, #0x18
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	mov r1, r8
	lsrs r0, r1, #0x18
	movs r1, #2
	lsrs r3, r5, #0x18
	bl FillBgTilemapBufferRect
_080182BA:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r6, r6, r0
	adds r7, #1
	cmp r7, #0x1f
	ble _08018280
	mov sb, sl
	mov r1, sb
	cmp r1, #0x11
	ble _08018270
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MG_DrawCheckerboardPattern

	thumb_func_start ClearScreenInBg0
ClearScreenInBg0: @ 0x080182E0
	push {lr}
	sub sp, #0xc
	cmp r0, #0
	beq _080182EE
	cmp r0, #1
	beq _08018306
	b _0801831E
_080182EE:
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	b _0801831E
_08018306:
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #2
	bl FillBgTilemapBufferRect
_0801831E:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearScreenInBg0

	thumb_func_start AddTextPrinterToWindow1
AddTextPrinterToWindow1: @ 0x0801832C
	push {r4, lr}
	sub sp, #0x14
	adds r1, r0, #0
	ldr r4, _08018380
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _08018384
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl AddTextPrinterParameterized4
	movs r0, #1
	movs r1, #1
	movs r2, #0xf
	bl DrawTextBorderOuter
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018380: .4byte 0x02021C7C
_08018384: .4byte 0x082C2B6C
	thumb_func_end AddTextPrinterToWindow1

	thumb_func_start ClearTextWindow
ClearTextWindow: @ 0x08018388
	push {lr}
	movs r0, #1
	bl rbox_fill_rectangle
	movs r0, #1
	bl ClearWindowTilemap
	movs r0, #1
	movs r1, #1
	bl CopyWindowToVram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearTextWindow

	thumb_func_start MG_PrintTextOnWindow1AndWaitButton
MG_PrintTextOnWindow1AndWaitButton: @ 0x080183A4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, r1, #0
	ldrb r2, [r4]
	cmp r2, #1
	beq _080183CC
	cmp r2, #1
	bgt _080183BC
	cmp r2, #0
	beq _080183C6
	b _0801842C
_080183BC:
	cmp r2, #2
	beq _08018400
	cmp r2, #0xff
	beq _08018428
	b _0801842C
_080183C6:
	bl AddTextPrinterToWindow1
	b _080183F0
_080183CC:
	movs r0, #0
	str r0, [sp]
	ldr r0, _080183F8
	str r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0xd0
	movs r2, #0x14
	movs r3, #1
	bl DrawDownArrow
	ldr r0, _080183FC
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0801842C
_080183F0:
	ldrb r0, [r4]
	adds r0, #1
	b _0801842A
	.align 2, 0
_080183F8: .4byte 0x0202290C
_080183FC: .4byte 0x03002360
_08018400:
	movs r0, #1
	str r0, [sp]
	ldr r0, _08018424
	str r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0xd0
	movs r2, #0x14
	movs r3, #1
	bl DrawDownArrow
	movs r0, #0
	strb r0, [r4]
	bl ClearTextWindow
	movs r0, #1
	b _0801842E
	.align 2, 0
_08018424: .4byte 0x0202290C
_08018428:
	movs r0, #2
_0801842A:
	strb r0, [r4]
_0801842C:
	movs r0, #0
_0801842E:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MG_PrintTextOnWindow1AndWaitButton

	thumb_func_start HideDownArrow
HideDownArrow: @ 0x08018438
	push {lr}
	sub sp, #0xc
	movs r0, #0
	str r0, [sp]
	ldr r0, _0801845C
	str r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0xd0
	movs r2, #0x14
	movs r3, #1
	bl DrawDownArrow
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0801845C: .4byte 0x0202290C
	thumb_func_end HideDownArrow

	thumb_func_start ShowDownArrow
ShowDownArrow: @ 0x08018460
	push {lr}
	sub sp, #0xc
	movs r0, #1
	str r0, [sp]
	ldr r0, _08018484
	str r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0xd0
	movs r2, #0x14
	movs r3, #1
	bl DrawDownArrow
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_08018484: .4byte 0x0202290C
	thumb_func_end ShowDownArrow

	thumb_func_start unref_HideDownArrowAndWaitButton
unref_HideDownArrowAndWaitButton: @ 0x08018488
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08018498
	cmp r0, #1
	beq _080184B4
	b _080184C0
_08018498:
	bl HideDownArrow
	ldr r0, _080184B0
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080184C0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _080184C0
	.align 2, 0
_080184B0: .4byte 0x03002360
_080184B4:
	bl ShowDownArrow
	movs r0, #0
	strb r0, [r4]
	movs r0, #1
	b _080184C2
_080184C0:
	movs r0, #0
_080184C2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end unref_HideDownArrowAndWaitButton

	thumb_func_start PrintStringAndWait2Seconds
PrintStringAndWait2Seconds: @ 0x080184C8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _080184D8
	adds r0, r1, #0
	bl AddTextPrinterToWindow1
_080184D8:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bhi _080184EA
	movs r0, #0
	b _080184F4
_080184EA:
	movs r0, #0
	strb r0, [r4]
	bl ClearTextWindow
	movs r0, #1
_080184F4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PrintStringAndWait2Seconds

	thumb_func_start MysteryGift_HandleThreeOptionMenu
MysteryGift_HandleThreeOptionMenu: @ 0x080184FC
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r2, r2, #0x18
	add r1, sp, #4
	ldr r0, _08018518
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	cmp r2, #0
	bne _08018520
	ldr r0, _0801851C
	b _08018522
	.align 2, 0
_08018518: .4byte 0x082C256C
_0801851C: .4byte 0x082C253C
_08018520:
	ldr r0, _08018558
_08018522:
	str r0, [sp, #4]
	ldr r0, _0801855C
	movs r1, #0xe0
	str r1, [sp]
	add r1, sp, #4
	movs r2, #1
	movs r3, #0xa
	bl DoMysteryGiftListMenu
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0801854C
	movs r0, #2
	bl ClearWindowTilemap
	movs r0, #2
	movs r1, #1
	bl CopyWindowToVram
_0801854C:
	adds r0, r4, #0
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08018558: .4byte 0x082C2554
_0801855C: .4byte 0x082C24EC
	thumb_func_end MysteryGift_HandleThreeOptionMenu

	thumb_func_start mevent_message_print_and_prompt_yes_no
mevent_message_print_and_prompt_yes_no: @ 0x08018560
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r3, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldrb r0, [r5]
	cmp r0, #1
	beq _080185F4
	cmp r0, #1
	bgt _0801857E
	cmp r0, #0
	beq _0801858A
	b _080186A6
_0801857E:
	cmp r0, #2
	beq _0801864C
	cmp r0, #0xff
	bne _08018588
	b _08018682
_08018588:
	b _080186A6
_0801858A:
	ldr r0, _08018598
	bl StringExpandPlaceholders
	cmp r6, #0
	bne _080185A0
	ldr r0, _0801859C
	b _080185A2
	.align 2, 0
_08018598: .4byte 0x02021C7C
_0801859C: .4byte 0x082C24D4
_080185A0:
	ldr r0, _080185E8
_080185A2:
	bl AddWindow
	strh r0, [r4]
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r1, _080185EC
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r1, _080185F0
	str r1, [sp, #0x10]
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl AddTextPrinterParameterized4
	ldrb r0, [r4]
	movs r1, #1
	movs r2, #0xf
	bl DrawTextBorderOuter
	ldrb r0, [r4]
	movs r1, #2
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl PutWindowTilemap
	b _0801863E
	.align 2, 0
_080185E8: .4byte 0x082C24DC
_080185EC: .4byte 0x082C2B6C
_080185F0: .4byte 0x02021C7C
_080185F4:
	ldr r0, _08018610
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	cmp r6, #0
	bne _08018618
	ldr r0, _08018614
	ldr r1, [sp, #0x14]
	ands r1, r0
	movs r0, #0x90
	lsls r0, r0, #0xc
	b _08018622
	.align 2, 0
_08018610: .4byte 0x082C24F4
_08018614: .4byte 0xFF00FFFF
_08018618:
	ldr r0, _08018648
	ldr r1, [sp, #0x14]
	ands r1, r0
	movs r0, #0xf0
	lsls r0, r0, #0xc
_08018622:
	orrs r1, r0
	str r1, [sp, #0x14]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #0x14
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl sub_08198C08
_0801863E:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _080186A6
	.align 2, 0
_08018648: .4byte 0xFF00FFFF
_0801864C:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _080186A6
	movs r0, #0
	strb r0, [r5]
	ldrb r0, [r4]
	bl rbox_fill_rectangle
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, #1
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	adds r0, r6, #0
	b _080186AA
_08018682:
	movs r0, #0
	strb r0, [r5]
	ldrb r0, [r4]
	bl rbox_fill_rectangle
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, #1
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #1
	rsbs r0, r0, #0
	b _080186AA
_080186A6:
	movs r0, #2
	rsbs r0, r0, #0
_080186AA:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end mevent_message_print_and_prompt_yes_no

	thumb_func_start HandleMysteryGiftListMenu
HandleMysteryGiftListMenu: @ 0x080186B4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r5, r1, #0
	ldrb r0, [r6]
	cmp r0, #1
	beq _08018754
	cmp r0, #1
	bgt _080186CC
	cmp r0, #0
	beq _080186D4
	b _080187F8
_080186CC:
	cmp r0, #0xff
	bne _080186D2
	b _080187D4
_080186D2:
	b _080187F8
_080186D4:
	cmp r2, #0
	bne _080186EC
	ldr r0, _080186E4
	ldr r1, _080186E8
	bl StringExpandPlaceholders
	b _080186F4
	.align 2, 0
_080186E4: .4byte 0x02021C7C
_080186E8: .4byte 0x082C2974
_080186EC:
	ldr r0, _08018744
	ldr r1, _08018748
	bl StringExpandPlaceholders
_080186F4:
	ldr r0, _0801874C
	bl AddWindow
	strh r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5]
	movs r2, #0
	str r2, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r1, _08018750
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r1, _08018744
	str r1, [sp, #0x10]
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl AddTextPrinterParameterized4
	ldrb r0, [r5]
	movs r1, #1
	movs r2, #0xf
	bl DrawTextBorderOuter
	ldrb r0, [r5]
	movs r1, #2
	bl CopyWindowToVram
	ldrb r0, [r5]
	bl PutWindowTilemap
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _080187F8
	.align 2, 0
_08018744: .4byte 0x02021C7C
_08018748: .4byte 0x082C2984
_0801874C: .4byte 0x082C24E4
_08018750: .4byte 0x082C2B6C
_08018754:
	cmp r3, #0
	beq _0801877C
	cmp r2, #0
	bne _0801876C
	ldr r0, _08018764
	ldr r1, _08018768
	b _08018794
	.align 2, 0
_08018764: .4byte 0x082C2504
_08018768: .4byte 0x082C260C
_0801876C:
	ldr r0, _08018774
	ldr r1, _08018778
	b _08018794
	.align 2, 0
_08018774: .4byte 0x082C250C
_08018778: .4byte 0x082C263C
_0801877C:
	cmp r2, #0
	bne _08018790
	ldr r0, _08018788
	ldr r1, _0801878C
	b _08018794
	.align 2, 0
_08018788: .4byte 0x082C24FC
_0801878C: .4byte 0x082C25F4
_08018790:
	ldr r0, _080187CC
	ldr r1, _080187D0
_08018794:
	movs r2, #0xe0
	str r2, [sp]
	movs r2, #1
	movs r3, #0xa
	bl DoMysteryGiftListMenu
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _080187F8
	movs r0, #0
	strb r0, [r6]
	ldrb r0, [r5]
	bl rbox_fill_rectangle
	ldrb r0, [r5]
	bl ClearWindowTilemap
	ldrb r0, [r5]
	movs r1, #1
	bl CopyWindowToVram
	ldrb r0, [r5]
	bl RemoveWindow
	adds r0, r4, #0
	b _080187FC
	.align 2, 0
_080187CC: .4byte 0x082C2504
_080187D0: .4byte 0x082C2624
_080187D4:
	movs r0, #0
	strb r0, [r6]
	ldrb r0, [r5]
	bl rbox_fill_rectangle
	ldrb r0, [r5]
	bl ClearWindowTilemap
	ldrb r0, [r5]
	movs r1, #1
	bl CopyWindowToVram
	ldrb r0, [r5]
	bl RemoveWindow
	movs r0, #2
	rsbs r0, r0, #0
	b _080187FC
_080187F8:
	movs r0, #1
	rsbs r0, r0, #0
_080187FC:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end HandleMysteryGiftListMenu

	thumb_func_start ValidateCardOrNews
ValidateCardOrNews: @ 0x08018804
	push {lr}
	cmp r0, #0
	beq _08018810
	bl ValidateReceivedWonderNews
	b _08018814
_08018810:
	bl ValidateReceivedWonderCard
_08018814:
	pop {r1}
	bx r1
	thumb_func_end ValidateCardOrNews

	thumb_func_start HandleLoadWonderCardOrNews
HandleLoadWonderCardOrNews: @ 0x08018818
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _08018828
	cmp r0, #1
	beq _08018850
	b _0801886C
_08018828:
	cmp r1, #0
	bne _08018840
	bl GetSavedWonderCard
	adds r4, r0, #0
	bl sav1_get_mevent_buffer_2
	adds r1, r0, #0
	adds r0, r4, #0
	bl InitWonderCardResources
	b _08018848
_08018840:
	bl GetSavedWonderNews
	bl InitWonderNewsResources
_08018848:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0801886C
_08018850:
	cmp r1, #0
	bne _0801885E
	bl FadeToWonderCardMenu
_08018858:
	cmp r0, #0
	bne _08018864
	b _0801886C
_0801885E:
	bl FadeToWonderNewsMenu
	b _08018858
_08018864:
	movs r0, #0
	strb r0, [r5]
	movs r0, #1
	b _0801886E
_0801886C:
	movs r0, #0
_0801886E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end HandleLoadWonderCardOrNews

	thumb_func_start DestroyNewsOrCard
DestroyNewsOrCard: @ 0x08018874
	push {lr}
	cmp r0, #0
	bne _08018880
	bl DestroyWonderCard
	b _08018884
_08018880:
	bl DestroyWonderNews
_08018884:
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DestroyNewsOrCard

	thumb_func_start TearDownCardOrNews_ReturnToTopMenu
TearDownCardOrNews_ReturnToTopMenu: @ 0x0801888C
	push {lr}
	cmp r0, #0
	bne _080188A0
	bl FadeOutFromWonderCard
	cmp r0, #0
	beq _080188A8
	bl DestroyWonderCardResources
	b _080188B0
_080188A0:
	bl FadeOutFromWonderNews
	cmp r0, #0
	bne _080188AC
_080188A8:
	movs r0, #0
	b _080188B2
_080188AC:
	bl DestroyWonderNewsResources
_080188B0:
	movs r0, #1
_080188B2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TearDownCardOrNews_ReturnToTopMenu

	thumb_func_start mevent_message_prompt_discard
mevent_message_prompt_discard: @ 0x080188B8
	push {lr}
	cmp r2, #0
	beq _080188C8
	ldr r3, _080188C4
	b _080188CA
	.align 2, 0
_080188C4: .4byte 0x082C2AB4
_080188C8:
	ldr r3, _080188D8
_080188CA:
	movs r2, #1
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080188D8: .4byte 0x082C2A94
	thumb_func_end mevent_message_prompt_discard

	thumb_func_start mevent_message_was_thrown_away
mevent_message_was_thrown_away: @ 0x080188DC
	push {lr}
	cmp r1, #0
	beq _080188EC
	ldr r1, _080188E8
	b _080188EE
	.align 2, 0
_080188E8: .4byte 0x082C2B38
_080188EC:
	ldr r1, _080188F8
_080188EE:
	bl MG_PrintTextOnWindow1AndWaitButton
	pop {r1}
	bx r1
	.align 2, 0
_080188F8: .4byte 0x082C2B28
	thumb_func_end mevent_message_was_thrown_away

	thumb_func_start mevent_save_game
mevent_save_game: @ 0x080188FC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #4
	bhi _0801896C
	lsls r0, r0, #2
	ldr r1, _08018910
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018910: .4byte 0x08018914
_08018914: @ jump table
	.4byte _08018928 @ case 0
	.4byte _08018934 @ case 1
	.4byte _0801893C @ case 2
	.4byte _08018948 @ case 3
	.4byte _08018960 @ case 4
_08018928:
	ldr r0, _08018930
	bl AddTextPrinterToWindow1
	b _08018954
	.align 2, 0
_08018930: .4byte 0x082C2AEC
_08018934:
	movs r0, #0
	bl TrySavingData
	b _08018954
_0801893C:
	ldr r0, _08018944
	bl AddTextPrinterToWindow1
	b _08018954
	.align 2, 0
_08018944: .4byte 0x082C2B08
_08018948:
	ldr r0, _0801895C
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0801896C
_08018954:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _0801896C
	.align 2, 0
_0801895C: .4byte 0x03002360
_08018960:
	movs r0, #0
	strb r0, [r4]
	bl ClearTextWindow
	movs r0, #1
	b _0801896E
_0801896C:
	movs r0, #0
_0801896E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end mevent_save_game

	thumb_func_start mevent_message
mevent_message: @ 0x08018974
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r2, #0
	str r2, [r4]
	cmp r3, #0xe
	bls _0801898A
	b _08018A9C
_0801898A:
	lsls r0, r3, #2
	ldr r1, _08018994
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018994: .4byte 0x08018998
_08018998: @ jump table
	.4byte _080189D4 @ case 0
	.4byte _080189E0 @ case 1
	.4byte _080189EC @ case 2
	.4byte _08018A04 @ case 3
	.4byte _08018A1C @ case 4
	.4byte _08018A28 @ case 5
	.4byte _08018A34 @ case 6
	.4byte _08018A40 @ case 7
	.4byte _08018A4C @ case 8
	.4byte _08018A58 @ case 9
	.4byte _08018A64 @ case 10
	.4byte _08018A7C @ case 11
	.4byte _08018A88 @ case 12
	.4byte _08018A94 @ case 13
	.4byte _08018A98 @ case 14
_080189D4:
	movs r0, #0
	str r0, [r4]
	ldr r2, _080189DC
	b _08018A9C
	.align 2, 0
_080189DC: .4byte 0x082C2960
_080189E0:
	movs r0, #0
	str r0, [r4]
	ldr r2, _080189E8
	b _08018A9C
	.align 2, 0
_080189E8: .4byte 0x082C2904
_080189EC:
	movs r0, #1
	str r0, [r4]
	ldr r2, _080189FC
	cmp r5, #0
	bne _08018A9C
	ldr r2, _08018A00
	b _08018A9C
	.align 2, 0
_080189FC: .4byte 0x082C2804
_08018A00: .4byte 0x082C2838
_08018A04:
	movs r0, #1
	str r0, [r4]
	ldr r2, _08018A14
	cmp r5, #0
	bne _08018A9C
	ldr r2, _08018A18
	b _08018A9C
	.align 2, 0
_08018A14: .4byte 0x082C2820
_08018A18: .4byte 0x082C2854
_08018A1C:
	movs r0, #1
	str r0, [r4]
	ldr r2, _08018A24
	b _08018A9C
	.align 2, 0
_08018A24: .4byte 0x082C286C
_08018A28:
	movs r0, #0
	str r0, [r4]
	ldr r2, _08018A30
	b _08018A9C
	.align 2, 0
_08018A30: .4byte 0x082C28A0
_08018A34:
	movs r0, #0
	str r0, [r4]
	ldr r2, _08018A3C
	b _08018A9C
	.align 2, 0
_08018A3C: .4byte 0x082C28D0
_08018A40:
	movs r0, #0
	str r0, [r4]
	ldr r2, _08018A48
	b _08018A9C
	.align 2, 0
_08018A48: .4byte 0x082C28B8
_08018A4C:
	movs r0, #0
	str r0, [r4]
	ldr r2, _08018A54
	b _08018A9C
	.align 2, 0
_08018A54: .4byte 0x082C28E8
_08018A58:
	movs r0, #0
	str r0, [r4]
	ldr r2, _08018A60
	b _08018A9C
	.align 2, 0
_08018A60: .4byte 0x082C27A0
_08018A64:
	movs r0, #0
	str r0, [r4]
	ldr r2, _08018A74
	cmp r6, #0
	bne _08018A9C
	ldr r2, _08018A78
	b _08018A9C
	.align 2, 0
_08018A74: .4byte 0x082C2944
_08018A78: .4byte 0x082C2924
_08018A7C:
	movs r0, #0
	str r0, [r4]
	ldr r2, _08018A84
	b _08018A9C
	.align 2, 0
_08018A84: .4byte 0x082C2790
_08018A88:
	movs r0, #1
	str r0, [r4]
	ldr r2, _08018A90
	b _08018A9C
	.align 2, 0
_08018A90: .4byte 0x082C2884
_08018A94:
	movs r0, #1
	b _08018A9A
_08018A98:
	movs r0, #0
_08018A9A:
	str r0, [r4]
_08018A9C:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end mevent_message

	thumb_func_start PrintMGSuccessMessage
PrintMGSuccessMessage: @ 0x08018AA4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	ldrb r4, [r6]
	cmp r4, #1
	beq _08018AD6
	cmp r4, #1
	bgt _08018ABC
	cmp r4, #0
	beq _08018AC2
	b _08018B02
_08018ABC:
	cmp r4, #2
	beq _08018AEC
	b _08018B02
_08018AC2:
	cmp r0, #0
	beq _08018ACA
	bl AddTextPrinterToWindow1
_08018ACA:
	movs r0, #0xb9
	lsls r0, r0, #1
	bl PlayFanfare
	strh r4, [r5]
	b _08018AE4
_08018AD6:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _08018B02
_08018AE4:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _08018B02
_08018AEC:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018B02
	movs r0, #0
	strb r0, [r6]
	bl ClearTextWindow
	movs r0, #1
	b _08018B04
_08018B02:
	movs r0, #0
_08018B04:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PrintMGSuccessMessage

	thumb_func_start mevent_message_stamp_card_etc_send_status
mevent_message_stamp_card_etc_send_status: @ 0x08018B0C
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, _08018B28
	movs r0, #0
	str r0, [r3]
	adds r4, r1, #0
	cmp r2, #0xe
	bhi _08018BCE
	lsls r0, r2, #2
	ldr r1, _08018B2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018B28: .4byte 0x082C2790
_08018B2C: .4byte 0x08018B30
_08018B30: @ jump table
	.4byte _08018B6C @ case 0
	.4byte _08018B74 @ case 1
	.4byte _08018B7C @ case 2
	.4byte _08018B84 @ case 3
	.4byte _08018B90 @ case 4
	.4byte _08018B98 @ case 5
	.4byte _08018BA0 @ case 6
	.4byte _08018BA8 @ case 7
	.4byte _08018BB0 @ case 8
	.4byte _08018BB8 @ case 9
	.4byte _08018BCC @ case 10
	.4byte _08018BC0 @ case 11
	.4byte _08018BC4 @ case 12
	.4byte _08018BC4 @ case 13
	.4byte _08018BCC @ case 14
_08018B6C:
	ldr r1, _08018B70
	b _08018BCE
	.align 2, 0
_08018B70: .4byte 0x082C2960
_08018B74:
	ldr r1, _08018B78
	b _08018BCE
	.align 2, 0
_08018B78: .4byte 0x082C2904
_08018B7C:
	ldr r1, _08018B80
	b _08018B86
	.align 2, 0
_08018B80: .4byte 0x082C29C0
_08018B84:
	ldr r1, _08018B8C
_08018B86:
	movs r0, #1
	str r0, [r3]
	b _08018BCE
	.align 2, 0
_08018B8C: .4byte 0x082C29D8
_08018B90:
	ldr r1, _08018B94
	b _08018BCE
	.align 2, 0
_08018B94: .4byte 0x082C29EC
_08018B98:
	ldr r1, _08018B9C
	b _08018BCE
	.align 2, 0
_08018B9C: .4byte 0x082C2A14
_08018BA0:
	ldr r1, _08018BA4
	b _08018BCE
	.align 2, 0
_08018BA4: .4byte 0x082C2A48
_08018BA8:
	ldr r1, _08018BAC
	b _08018BCE
	.align 2, 0
_08018BAC: .4byte 0x082C2A30
_08018BB0:
	ldr r1, _08018BB4
	b _08018BCE
	.align 2, 0
_08018BB4: .4byte 0x082C28E8
_08018BB8:
	ldr r1, _08018BBC
	b _08018BCE
	.align 2, 0
_08018BBC: .4byte 0x082C2A60
_08018BC0:
	adds r1, r4, #0
	b _08018BCE
_08018BC4:
	ldr r1, _08018BC8
	b _08018BCE
	.align 2, 0
_08018BC8: .4byte 0x082C2A00
_08018BCC:
	ldr r1, _08018BD8
_08018BCE:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018BD8: .4byte 0x082C2A78
	thumb_func_end mevent_message_stamp_card_etc_send_status

	thumb_func_start PrintMGSendStatus
PrintMGSendStatus: @ 0x08018BDC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, sp
	bl mevent_message_stamp_card_etc_send_status
	adds r1, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	bne _08018C02
	adds r0, r4, #0
	bl MG_PrintTextOnWindow1AndWaitButton
	b _08018C0A
_08018C02:
	adds r0, r4, #0
	adds r2, r5, #0
	bl PrintMGSuccessMessage
_08018C0A:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PrintMGSendStatus

	thumb_func_start task_add_00_mystery_gift
task_add_00_mystery_gift: @ 0x08018C14
	push {r4, lr}
	ldr r0, _08018C54
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08018C58
	adds r4, r4, r0
	movs r0, #0
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	movs r1, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strb r1, [r4, #0xe]
	movs r0, #0x40
	bl AllocZeroed
	str r0, [r4, #0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018C54: .4byte 0x08018C5D
_08018C58: .4byte 0x03005B68
	thumb_func_end task_add_00_mystery_gift

	thumb_func_start task00_mystery_gift
task00_mystery_gift: @ 0x08018C5C
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08018C80
	adds r5, r0, r1
	ldrb r0, [r5, #8]
	cmp r0, #0x25
	bls _08018C76
	b _0801931A
_08018C76:
	lsls r0, r0, #2
	ldr r1, _08018C84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018C80: .4byte 0x03005B68
_08018C84: .4byte 0x08018C88
_08018C88: @ jump table
	.4byte _08018D20 @ case 0
	.4byte _08018D26 @ case 1
	.4byte _08018D64 @ case 2
	.4byte _08018D8C @ case 3
	.4byte _08018DB0 @ case 4
	.4byte _08018DFC @ case 5
	.4byte _08018E5A @ case 6
	.4byte _08018E90 @ case 7
	.4byte _08018EA0 @ case 8
	.4byte _08018F10 @ case 9
	.4byte _08018F34 @ case 10
	.4byte _08018F4C @ case 11
	.4byte _08018F7C @ case 12
	.4byte _08018FB6 @ case 13
	.4byte _08018FCC @ case 14
	.4byte _08018FFC @ case 15
	.4byte _080192EC @ case 16
	.4byte _08019056 @ case 17
	.4byte _08019066 @ case 18
	.4byte _0801931A @ case 19
	.4byte _08019078 @ case 20
	.4byte _080190C2 @ case 21
	.4byte _08019130 @ case 22
	.4byte _0801915E @ case 23
	.4byte _08019190 @ case 24
	.4byte _080191A6 @ case 25
	.4byte _080191B8 @ case 26
	.4byte _080191C4 @ case 27
	.4byte _080191CC @ case 28
	.4byte _080191DC @ case 29
	.4byte _0801920A @ case 30
	.4byte _08019238 @ case 31
	.4byte _0801927C @ case 32
	.4byte _0801928E @ case 33
	.4byte _080192A8 @ case 34
	.4byte _080192BC @ case 35
	.4byte _080192EC @ case 36
	.4byte _08019304 @ case 37
_08018D20:
	movs r0, #1
_08018D22:
	strb r0, [r5, #8]
	b _0801931A
_08018D26:
	adds r0, r5, #0
	adds r0, #9
	adds r1, r5, #0
	movs r2, #0
	bl MysteryGift_HandleThreeOptionMenu
	adds r1, r0, #0
	cmp r1, #1
	beq _08018D50
	cmp r1, #1
	blo _08018D46
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08018D60
	b _0801931A
_08018D46:
	movs r0, #0
	strb r0, [r5, #0xc]
	bl ValidateReceivedWonderCard
	b _08018D56
_08018D50:
	strb r1, [r5, #0xc]
	bl ValidateReceivedWonderNews
_08018D56:
	cmp r0, #1
	bne _08018D5C
	b _08019230
_08018D5C:
	movs r0, #2
	b _08018D22
_08018D60:
	movs r0, #0x25
	b _08018D22
_08018D64:
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	bne _08018D7C
	adds r0, r5, #0
	adds r0, #9
	ldr r1, _08018D78
	bl MG_PrintTextOnWindow1AndWaitButton
	b _080191D2
	.align 2, 0
_08018D78: .4byte 0x082C26C4
_08018D7C:
	adds r0, r5, #0
	adds r0, #9
	ldr r1, _08018D88
	bl MG_PrintTextOnWindow1AndWaitButton
	b _080191D2
	.align 2, 0
_08018D88: .4byte 0x082C26E8
_08018D8C:
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	bne _08018DA0
	ldr r0, _08018D9C
	bl AddTextPrinterToWindow1
	b _08018DA6
	.align 2, 0
_08018D9C: .4byte 0x082C2710
_08018DA0:
	ldr r0, _08018DAC
	bl AddTextPrinterToWindow1
_08018DA6:
	movs r0, #4
	b _08018D22
	.align 2, 0
_08018DAC: .4byte 0x082C272C
_08018DB0:
	adds r0, r5, #0
	adds r0, #9
	adds r1, r5, #0
	movs r2, #1
	bl MysteryGift_HandleThreeOptionMenu
	adds r4, r0, #0
	cmp r4, #1
	beq _08018DDE
	cmp r4, #1
	blo _08018DD0
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08018DEA
	b _0801931A
_08018DD0:
	bl ClearTextWindow
	movs r1, #0
	movs r0, #5
	strb r0, [r5, #8]
	strb r1, [r5, #0xd]
	b _0801931A
_08018DDE:
	bl ClearTextWindow
	movs r0, #5
	strb r0, [r5, #8]
	strb r4, [r5, #0xd]
	b _0801931A
_08018DEA:
	bl ClearTextWindow
	ldrb r0, [r5, #0xc]
	bl ValidateCardOrNews
	cmp r0, #0
	beq _08018DFA
	b _08019230
_08018DFA:
	b _08018D22
_08018DFC:
	ldr r0, _08018E18
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _08018E1C
	strb r1, [r0]
	ldr r0, _08018E20
	strb r1, [r0]
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	beq _08018E24
	cmp r0, #1
	beq _08018E3E
	b _08018E56
	.align 2, 0
_08018E18: .4byte 0x02021C40
_08018E1C: .4byte 0x02021C54
_08018E20: .4byte 0x02021C68
_08018E24:
	ldrb r0, [r5, #0xd]
	cmp r0, #1
	bne _08018E32
	movs r0, #6
	bl MEvent_CreateTask_CardOrNewsWithFriend
	b _08018E56
_08018E32:
	cmp r0, #0
	bne _08018E56
	movs r0, #6
	bl MEvent_CreateTask_CardOrNewsOverWireless
	b _08018E56
_08018E3E:
	ldrb r0, [r5, #0xd]
	cmp r0, #1
	bne _08018E4C
	movs r0, #7
	bl MEvent_CreateTask_CardOrNewsWithFriend
	b _08018E56
_08018E4C:
	cmp r0, #0
	bne _08018E56
	movs r0, #7
	bl MEvent_CreateTask_CardOrNewsOverWireless
_08018E56:
	movs r0, #6
	b _08018D22
_08018E5A:
	ldr r0, _08018E74
	ldrb r0, [r0]
	cmp r0, #0
	beq _08018E78
	movs r0, #1
	bl ClearScreenInBg0
	movs r0, #7
	strb r0, [r5, #8]
	ldrb r0, [r5, #0xc]
	bl mevent_client_do_init
	b _0801931A
	.align 2, 0
_08018E74: .4byte 0x030031C4
_08018E78:
	ldr r0, _08018E8C
	ldrh r0, [r0]
	cmp r0, #5
	beq _08018E82
	b _0801931A
_08018E82:
	movs r0, #1
	bl ClearScreenInBg0
	b _080191D8
	.align 2, 0
_08018E8C: .4byte 0x02037290
_08018E90:
	ldr r0, _08018E9C
	bl AddTextPrinterToWindow1
	movs r0, #8
	b _08018D22
	.align 2, 0
_08018E9C: .4byte 0x082C276C
_08018EA0:
	adds r0, r5, #0
	bl mevent_client_do_exec
	subs r0, #2
	cmp r0, #4
	bls _08018EAE
	b _0801931A
_08018EAE:
	lsls r0, r0, #2
	ldr r1, _08018EB8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018EB8: .4byte 0x08018EBC
_08018EBC: @ jump table
	.4byte _08018EF6 @ case 0
	.4byte _08018EF2 @ case 1
	.4byte _08018EFA @ case 2
	.4byte _08018EDC @ case 3
	.4byte _08018ED0 @ case 4
_08018ED0:
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	ldrh r0, [r5]
	strb r0, [r5, #0xe]
	movs r0, #0xd
	b _08018D22
_08018EDC:
	ldr r4, [r5, #0x10]
	bl mevent_client_get_buffer
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	bl mevent_client_inc_flag
	b _0801931A
_08018EF2:
	movs r0, #0xa
	b _08018D22
_08018EF6:
	movs r0, #9
	b _08018D22
_08018EFA:
	movs r0, #0xb
	strb r0, [r5, #8]
	ldr r0, _08018F08
	ldr r1, _08018F0C
	bl StringCopy
	b _0801931A
	.align 2, 0
_08018F08: .4byte 0x02021C40
_08018F0C: .4byte 0x020226A8
_08018F10:
	adds r4, r5, #0
	adds r4, #9
	bl mevent_client_get_buffer
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #1
	beq _08018FA8
	cmp r1, #1
	bhs _08018F96
	movs r0, #0
	b _08018FAA
_08018F34:
	adds r4, r5, #0
	adds r4, #9
	bl mevent_client_get_buffer
	adds r1, r0, #0
	adds r0, r4, #0
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, #0
	bne _08018F4A
	b _0801931A
_08018F4A:
	b _08018FAE
_08018F4C:
	adds r0, r5, #0
	adds r0, #9
	ldr r3, _08018F74
	adds r1, r5, #0
	movs r2, #0
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #1
	beq _08018FA8
	cmp r1, #1
	bhs _08018F96
	bl CheckReceivedGiftFromWonderCard
	cmp r0, #1
	bne _08018F78
	movs r0, #0xc
	b _08018D22
	.align 2, 0
_08018F74: .4byte 0x082C27B4
_08018F78:
	movs r0, #0
	b _08018FAA
_08018F7C:
	adds r0, r5, #0
	adds r0, #9
	ldr r3, _08018FA0
	adds r1, r5, #0
	movs r2, #0
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #1
	beq _08018FA8
	cmp r1, #1
	blo _08018FA4
_08018F96:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08018FA8
	b _0801931A
	.align 2, 0
_08018FA0: .4byte 0x082C27DC
_08018FA4:
	movs r0, #0
	b _08018FAA
_08018FA8:
	movs r0, #1
_08018FAA:
	bl mevent_client_set_param
_08018FAE:
	bl mevent_client_inc_flag
	movs r0, #7
	b _08018D22
_08018FB6:
	ldr r0, _08018FC8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08018FC0
	b _0801931A
_08018FC0:
	bl DestroyWirelessStatusIndicatorSprite
	movs r0, #0xe
	b _08018D22
	.align 2, 0
_08018FC8: .4byte 0x030031C4
_08018FCC:
	adds r0, r5, #0
	adds r0, #9
	ldr r1, _08018FF0
	bl PrintStringAndWait2Seconds
	cmp r0, #0
	bne _08018FDC
	b _0801931A
_08018FDC:
	ldrb r0, [r5, #0xd]
	cmp r0, #1
	bne _08018FEA
	ldr r0, _08018FF4
	ldr r1, _08018FF8
	bl StringCopy
_08018FEA:
	movs r0, #0xf
	b _08018D22
	.align 2, 0
_08018FF0: .4byte 0x082C277C
_08018FF4: .4byte 0x02021C40
_08018FF8: .4byte 0x020226A8
_08018FFC:
	ldrb r1, [r5, #0xc]
	ldrb r2, [r5, #0xd]
	ldrb r3, [r5, #0xe]
	mov r0, sp
	bl mevent_message
	adds r1, r0, #0
	cmp r1, #0
	bne _08019010
	ldr r1, [r5, #0x10]
_08019010:
	ldr r0, [sp]
	cmp r0, #0
	beq _08019022
	adds r0, r5, #0
	adds r0, #9
	adds r2, r5, #0
	bl PrintMGSuccessMessage
	b _0801902A
_08019022:
	adds r0, r5, #0
	adds r0, #9
	bl MG_PrintTextOnWindow1AndWaitButton
_0801902A:
	adds r1, r0, #0
	cmp r1, #0
	bne _08019032
	b _0801931A
_08019032:
	ldrb r0, [r5, #0xe]
	cmp r0, #3
	bne _0801904C
	ldrb r0, [r5, #0xd]
	cmp r0, #1
	bne _08019046
	movs r0, #1
	bl GenerateRandomNews
	b _0801904C
_08019046:
	movs r0, #2
	bl GenerateRandomNews
_0801904C:
	ldr r0, [sp]
	cmp r0, #0
	beq _08019054
	b _080192E0
_08019054:
	b _08018D22
_08019056:
	adds r0, r5, #0
	adds r0, #9
	bl mevent_save_game
	cmp r0, #0
	bne _08019064
	b _0801931A
_08019064:
	b _08019230
_08019066:
	adds r0, r5, #0
	adds r0, #9
	ldrb r1, [r5, #0xc]
	bl HandleLoadWonderCardOrNews
	cmp r0, #0
	bne _08019076
	b _0801931A
_08019076:
	b _0801912C
_08019078:
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	bne _080190A0
	ldr r2, _0801909C
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801908E
	movs r0, #0x15
	strb r0, [r5, #8]
_0801908E:
	ldrh r1, [r2, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0801909A
	b _0801931A
_0801909A:
	b _080190BE
	.align 2, 0
_0801909C: .4byte 0x03002360
_080190A0:
	ldr r0, _080190B4
	ldrh r0, [r0, #0x2e]
	bl MENews_GetInput
	cmp r0, #0
	beq _080190B8
	cmp r0, #1
	beq _080190BE
	b _0801931A
	.align 2, 0
_080190B4: .4byte 0x03002360
_080190B8:
	bl MENews_RemoveScrollIndicatorArrowPair
	b _0801918C
_080190BE:
	movs r0, #0x1b
	b _08018D22
_080190C2:
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	bne _080190DC
	bl WonderCard_Test_Unk_08_6
	cmp r0, #0
	beq _080190F0
	adds r0, r5, #0
	adds r0, #9
	ldrb r2, [r5, #0xc]
	adds r1, r5, #0
	movs r3, #0
	b _080190FA
_080190DC:
	bl WonderNews_Test_Unk_02
	cmp r0, #0
	beq _080190F0
	adds r0, r5, #0
	adds r0, #9
	ldrb r2, [r5, #0xc]
	adds r1, r5, #0
	movs r3, #0
	b _080190FA
_080190F0:
	adds r0, r5, #0
	adds r0, #9
	ldrb r2, [r5, #0xc]
	adds r1, r5, #0
	movs r3, #1
_080190FA:
	bl HandleMysteryGiftListMenu
	adds r1, r0, #0
	cmp r1, #1
	beq _0801911A
	cmp r1, #1
	blo _08019116
	cmp r1, #2
	beq _0801911E
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08019122
	b _0801931A
_08019116:
	movs r0, #0x1c
	b _08018D22
_0801911A:
	movs r0, #0x1d
	b _08018D22
_0801911E:
	movs r0, #0x16
	b _08018D22
_08019122:
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _0801912C
	bl MENews_AddScrollIndicatorArrowPair
_0801912C:
	movs r0, #0x14
	b _08018D22
_08019130:
	adds r0, r5, #0
	adds r0, #9
	ldrb r2, [r5, #0xc]
	adds r1, r5, #0
	bl mevent_message_prompt_discard
	adds r1, r0, #0
	cmp r1, #0
	beq _0801914C
	cmp r1, #0
	ble _08019178
	cmp r1, #1
	beq _0801918C
	b _0801931A
_0801914C:
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	bne _08019188
	bl CheckReceivedGiftFromWonderCard
	cmp r0, #1
	bne _08019188
	movs r0, #0x17
	b _08018D22
_0801915E:
	adds r0, r5, #0
	adds r0, #9
	ldr r3, _08019184
	adds r1, r5, #0
	movs r2, #1
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #1
	beq _0801918C
	cmp r1, #1
	blo _08019188
_08019178:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0801918C
	b _0801931A
	.align 2, 0
_08019184: .4byte 0x082C2ACC
_08019188:
	movs r0, #0x18
	b _08018D22
_0801918C:
	movs r0, #0x15
	b _08018D22
_08019190:
	ldrb r0, [r5, #0xc]
	bl TearDownCardOrNews_ReturnToTopMenu
	cmp r0, #0
	bne _0801919C
	b _0801931A
_0801919C:
	ldrb r0, [r5, #0xc]
	bl DestroyNewsOrCard
	movs r0, #0x19
	b _08018D22
_080191A6:
	adds r0, r5, #0
	adds r0, #9
	bl mevent_save_game
	cmp r0, #0
	bne _080191B4
	b _0801931A
_080191B4:
	movs r0, #0x1a
	b _08018D22
_080191B8:
	adds r0, r5, #0
	adds r0, #9
	ldrb r1, [r5, #0xc]
	bl mevent_message_was_thrown_away
	b _080192F6
_080191C4:
	ldrb r0, [r5, #0xc]
	bl TearDownCardOrNews_ReturnToTopMenu
	b _080192F6
_080191CC:
	ldrb r0, [r5, #0xc]
	bl TearDownCardOrNews_ReturnToTopMenu
_080191D2:
	cmp r0, #0
	bne _080191D8
	b _0801931A
_080191D8:
	movs r0, #3
	b _08018D22
_080191DC:
	ldrb r0, [r5, #0xc]
	bl TearDownCardOrNews_ReturnToTopMenu
	cmp r0, #0
	bne _080191E8
	b _0801931A
_080191E8:
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	beq _080191F4
	cmp r0, #1
	beq _080191FC
	b _08019202
_080191F4:
	movs r0, #6
	bl MEvent_CreateTask_Leader
	b _08019202
_080191FC:
	movs r0, #7
	bl MEvent_CreateTask_Leader
_08019202:
	movs r0, #1
	strb r0, [r5, #0xd]
	movs r0, #0x1e
	b _08018D22
_0801920A:
	ldr r0, _0801921C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08019220
	movs r0, #1
	bl ClearScreenInBg0
	movs r0, #0x1f
	b _08018D22
	.align 2, 0
_0801921C: .4byte 0x030031C4
_08019220:
	ldr r0, _08019234
	ldrh r0, [r0]
	cmp r0, #5
	beq _0801922A
	b _0801931A
_0801922A:
	movs r0, #1
	bl ClearScreenInBg0
_08019230:
	movs r0, #0x12
	b _08018D22
	.align 2, 0
_08019234: .4byte 0x02037290
_08019238:
	ldr r0, _08019258
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0801925C
	strb r1, [r0]
	ldr r0, _08019260
	strb r1, [r0]
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	bne _08019268
	ldr r0, _08019264
	bl AddTextPrinterToWindow1
	bl mevent_srv_new_wcard
	b _08019272
	.align 2, 0
_08019258: .4byte 0x02021C40
_0801925C: .4byte 0x02021C54
_08019260: .4byte 0x02021C68
_08019264: .4byte 0x082C2994
_08019268:
	ldr r0, _08019278
	bl AddTextPrinterToWindow1
	bl mevent_srv_init_wnews
_08019272:
	movs r0, #0x20
	b _08018D22
	.align 2, 0
_08019278: .4byte 0x082C29AC
_0801927C:
	adds r0, r5, #0
	bl mevent_srv_common_do_exec
	cmp r0, #3
	bne _0801931A
	ldrh r0, [r5]
	strb r0, [r5, #0xe]
	movs r0, #0x21
	b _08018D22
_0801928E:
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	ldr r0, _080192A0
	ldr r1, _080192A4
	bl StringCopy
	movs r0, #0x22
	b _08018D22
	.align 2, 0
_080192A0: .4byte 0x02021C40
_080192A4: .4byte 0x020226C4
_080192A8:
	ldr r0, _080192B8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801931A
	bl DestroyWirelessStatusIndicatorSprite
	movs r0, #0x23
	b _08018D22
	.align 2, 0
_080192B8: .4byte 0x030031C4
_080192BC:
	adds r0, r5, #0
	adds r0, #9
	ldrb r2, [r5, #0xd]
	ldrb r3, [r5, #0xe]
	adds r1, r5, #0
	bl PrintMGSendStatus
	cmp r0, #0
	beq _0801931A
	ldr r0, [r5, #0xc]
	ldr r1, _080192E4
	ands r0, r1
	ldr r1, _080192E8
	cmp r0, r1
	bne _080192FA
	movs r0, #3
	bl GenerateRandomNews
_080192E0:
	movs r0, #0x11
	b _08018D22
	.align 2, 0
_080192E4: .4byte 0x00FFFF00
_080192E8: .4byte 0x00030100
_080192EC:
	adds r0, r5, #0
	adds r0, #9
	ldr r1, _08019300
	bl MG_PrintTextOnWindow1AndWaitButton
_080192F6:
	cmp r0, #0
	beq _0801931A
_080192FA:
	movs r0, #0
	b _08018D22
	.align 2, 0
_08019300: .4byte 0x082C2790
_08019304:
	bl CloseLink
	ldr r0, [r5, #0x10]
	bl Free
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _08019324
	bl SetMainCallback2
_0801931A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019324: .4byte 0x08018139
	thumb_func_end task00_mystery_gift

	thumb_func_start GetMysteryGiftBaseBlock
GetMysteryGiftBaseBlock: @ 0x08019328
	ldr r0, _0801932C
	bx lr
	.align 2, 0
_0801932C: .4byte 0x000001A9
	thumb_func_end GetMysteryGiftBaseBlock

	thumb_func_start bgid_upload_textbox_1
bgid_upload_textbox_1: @ 0x08019330
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0801934C
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0
	str r3, [sp]
	bl DecompressAndLoadBgGfxUsingHeap
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0801934C: .4byte 0x082C2474
	thumb_func_end bgid_upload_textbox_1

