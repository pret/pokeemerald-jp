.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start WallClockVblankCallback
WallClockVblankCallback: @ 0x081347FC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallClockVblankCallback

	thumb_func_start LoadWallClockGraphics
LoadWallClockGraphics: @ 0x08134810
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xe
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
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
	movs r3, #0xc0
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #9
	add r0, sp, #4
	mov r8, r0
	mov r2, sp
	movs r6, #0
	ldr r1, _08134930
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _08134934
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_081348B4:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r5
	subs r4, r4, r5
	cmp r4, r5
	bhi _081348B4
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, #4]
	lsrs r0, r4, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	movs r3, #0x80
	lsls r3, r3, #3
	movs r4, #0
	str r4, [sp, #4]
	ldr r2, _08134930
	mov r1, r8
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r3, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r3, r3, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r3, r0
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _08134938
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0813493C
	ldrh r0, [r0]
	cmp r0, #0
	bne _08134944
	ldr r0, _08134940
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	b _0813494E
	.align 2, 0
_08134930: .4byte 0x040000D4
_08134934: .4byte 0x81000800
_08134938: .4byte 0x0859130C
_0813493C: .4byte 0x02037280
_08134940: .4byte 0x08590D68
_08134944:
	ldr r0, _081349BC
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
_0813494E:
	bl GetOverworldTextboxPalettePtr
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _081349C0
	movs r1, #0xc0
	movs r2, #8
	bl LoadPalette
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081349C4
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r0, _081349C8
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r1, #0x93
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	bl clear_scheduled_bg_copies_to_vram
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	ldr r0, _081349CC
	bl LoadCompressedSpriteSheet
	ldr r0, _081349D0
	bl LoadSpritePalettes
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081349BC: .4byte 0x08590D88
_081349C0: .4byte 0x08591C20
_081349C4: .4byte 0x08591C48
_081349C8: .4byte 0x08591C28
_081349CC: .4byte 0x08591C54
_081349D0: .4byte 0x08591C64
	thumb_func_end LoadWallClockGraphics

	thumb_func_start WallClockInit
WallClockInit: @ 0x081349D4
	push {lr}
	sub sp, #4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _08134A34
	bl SetVBlankCallback
	ldr r0, _08134A38
	bl SetMainCallback2
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08134A34: .4byte 0x081347FD
_08134A38: .4byte 0x08134CE9
	thumb_func_end WallClockInit

	thumb_func_start CB2_StartWallClock
CB2_StartWallClock: @ 0x08134A3C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0xc
	bl LoadWallClockGraphics
	ldr r0, _08134B64
	ldr r1, _08134B68
	bl LZ77UnCompVram
	ldr r0, _08134B6C
	movs r1, #0
	bl CreateTask
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r1, _08134B70
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	mov r8, r1
	movs r1, #0xa
	strh r1, [r0, #0xc]
	mov r2, r8
	strh r2, [r0, #0xe]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	strh r2, [r0, #8]
	movs r1, #0x96
	lsls r1, r1, #1
	strh r1, [r0, #0xa]
	ldr r0, _08134B74
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08134B78
	mov sb, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sb
	strh r6, [r1, #0x2e]
	ldrb r2, [r1, #1]
	movs r5, #4
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r2
	movs r2, #1
	mov sl, r2
	mov r2, sl
	orrs r0, r2
	strb r0, [r1, #1]
	ldrb r2, [r1, #3]
	movs r4, #0x3f
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	strb r0, [r1, #3]
	ldr r0, _08134B7C
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sb
	strh r6, [r1, #0x2e]
	ldrb r0, [r1, #1]
	ands r5, r0
	mov r0, sl
	orrs r5, r0
	strb r5, [r1, #1]
	ldrb r0, [r1, #3]
	ands r4, r0
	movs r0, #2
	orrs r4, r0
	strb r4, [r1, #3]
	ldr r0, _08134B80
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sb
	strh r6, [r1, #0x2e]
	movs r0, #0x2d
	strh r0, [r1, #0x30]
	ldr r0, _08134B84
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sb
	strh r6, [r1, #0x2e]
	movs r0, #0x5a
	strh r0, [r1, #0x30]
	bl WallClockInit
	ldr r2, _08134B88
	movs r0, #2
	str r0, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08134B64: .4byte 0x08590DA8
_08134B68: .4byte 0x06003800
_08134B6C: .4byte 0x08134D05
_08134B70: .4byte 0x03005B60
_08134B74: .4byte 0x08591C9C
_08134B78: .4byte 0x020205AC
_08134B7C: .4byte 0x08591CB4
_08134B80: .4byte 0x08591CEC
_08134B84: .4byte 0x08591D04
_08134B88: .4byte 0x08591C15
	thumb_func_end CB2_StartWallClock

	thumb_func_start CB2_ViewWallClock
CB2_ViewWallClock: @ 0x08134B8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl LoadWallClockGraphics
	ldr r0, _08134BD4
	ldr r1, _08134BD8
	bl LZ77UnCompVram
	ldr r0, _08134BDC
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r7, #0
	bl InitClockWithRtc
	ldr r1, _08134BE0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08134BE4
	movs r2, #0x2d
	mov sl, r2
	movs r0, #0x5a
	str r0, [sp, #0xc]
	b _08134BEC
	.align 2, 0
_08134BD4: .4byte 0x08591074
_08134BD8: .4byte 0x06003800
_08134BDC: .4byte 0x08134F65
_08134BE0: .4byte 0x03005B60
_08134BE4:
	movs r1, #0x5a
	mov sl, r1
	movs r2, #0x87
	str r2, [sp, #0xc]
_08134BEC:
	ldr r0, _08134CD0
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _08134CD4
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r0, #0
	mov sb, r0
	strh r7, [r1, #0x2e]
	ldrb r2, [r1, #1]
	movs r5, #4
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r2
	movs r2, #1
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, #1]
	ldrb r2, [r1, #3]
	movs r4, #0x3f
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	strb r0, [r1, #3]
	ldr r0, _08134CD8
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	strh r7, [r1, #0x2e]
	ldrb r0, [r1, #1]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r1, #1]
	ldrb r0, [r1, #3]
	ands r4, r0
	movs r0, #2
	orrs r4, r0
	strb r4, [r1, #3]
	ldr r0, _08134CDC
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	strh r7, [r1, #0x2e]
	mov r2, sl
	strh r2, [r1, #0x30]
	ldr r0, _08134CE0
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	strh r7, [r1, #0x2e]
	mov r0, sp
	ldrh r0, [r0, #0xc]
	strh r0, [r1, #0x30]
	bl WallClockInit
	ldr r2, _08134CE4
	movs r0, #2
	str r0, [sp]
	mov r1, sb
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08134CD0: .4byte 0x08591C9C
_08134CD4: .4byte 0x020205AC
_08134CD8: .4byte 0x08591CB4
_08134CDC: .4byte 0x08591CEC
_08134CE0: .4byte 0x08591D04
_08134CE4: .4byte 0x08591C1A
	thumb_func_end CB2_ViewWallClock

	thumb_func_start WallClockMainCallback
WallClockMainCallback: @ 0x08134CE8
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WallClockMainCallback

	thumb_func_start Task_ViewClock1
Task_ViewClock1: @ 0x08134D04
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08134D28
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08134D24
	ldr r0, _08134D2C
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08134D30
	str r0, [r1]
_08134D24:
	pop {r0}
	bx r0
	.align 2, 0
_08134D28: .4byte 0x02037C74
_08134D2C: .4byte 0x03005B60
_08134D30: .4byte 0x08134D35
	thumb_func_end Task_ViewClock1

	thumb_func_start Task_SetClock2
Task_SetClock2: @ 0x08134D34
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08134D64
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08134D68
	ldrh r0, [r5, #8]
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x14]
	bl CalcNewMinHandAngle
	strh r0, [r5, #8]
	b _08134E0A
	.align 2, 0
_08134D64: .4byte 0x03005B60
_08134D68:
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	strh r0, [r5, #8]
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	movs r1, #0xc
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #4
	subs r4, r4, r0
	lsls r4, r4, #1
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r4, r4, r1
	strh r4, [r5, #0xa]
	ldr r2, _08134DB4
	ldrh r0, [r2, #0x2e]
	movs r3, #1
	adds r1, r3, #0
	ands r1, r0
	cmp r1, #0
	beq _08134DBC
	ldr r0, _08134DB8
	str r0, [r5]
	b _08134E0A
	.align 2, 0
_08134DB4: .4byte 0x03002360
_08134DB8: .4byte 0x08134E11
_08134DBC:
	strh r1, [r5, #0x10]
	ldrh r1, [r2, #0x2c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08134DCA
	strh r3, [r5, #0x10]
_08134DCA:
	ldrh r1, [r2, #0x2c]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08134DD8
	movs r0, #2
	strh r0, [r5, #0x10]
_08134DD8:
	ldrh r1, [r5, #0x10]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _08134E08
	ldrh r2, [r5, #0x14]
	movs r3, #0x14
	ldrsh r0, [r5, r3]
	cmp r0, #0xfe
	bgt _08134DF0
	adds r0, r2, #1
	strh r0, [r5, #0x14]
_08134DF0:
	ldrh r0, [r5, #8]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r5, #0x14]
	bl CalcNewMinHandAngle
	strh r0, [r5, #8]
	ldrb r1, [r5, #0x10]
	adds r0, r6, #0
	bl AdvanceClock
	b _08134E0A
_08134E08:
	strh r0, [r5, #0x14]
_08134E0A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end Task_SetClock2

	thumb_func_start Task_SetClock3
Task_SetClock3: @ 0x08134E10
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r5, #0x93
	lsls r5, r5, #2
	movs r0, #0
	movs r1, #0
	adds r2, r5, #0
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, _08134E74
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _08134E78
	str r5, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r2, #0
	movs r3, #2
	bl sub_08198C08
	ldr r1, _08134E7C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08134E80
	str r1, [r0]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134E74: .4byte 0x08591C04
_08134E78: .4byte 0x08591C40
_08134E7C: .4byte 0x03005B60
_08134E80: .4byte 0x08134E85
	thumb_func_end Task_SetClock3

	thumb_func_start Task_SetClock4
Task_SetClock4: @ 0x08134E84
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08134EAA
	cmp r1, #0
	bgt _08134EA4
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08134EC8
	b _08134EEA
_08134EA4:
	cmp r1, #1
	beq _08134EC8
	b _08134EEA
_08134EAA:
	movs r0, #5
	bl PlaySE
	ldr r0, _08134EC0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08134EC4
	b _08134EE8
	.align 2, 0
_08134EC0: .4byte 0x03005B60
_08134EC4: .4byte 0x08134EF9
_08134EC8:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #0
	bl ClearWindowTilemap
	ldr r0, _08134EF0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08134EF4
_08134EE8:
	str r0, [r1]
_08134EEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08134EF0: .4byte 0x03005B60
_08134EF4: .4byte 0x08134D35
	thumb_func_end Task_SetClock4

	thumb_func_start Task_SetClock5
Task_SetClock5: @ 0x08134EF8
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08134F34
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	bl RtcInitLocalTimeOffset
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _08134F38
	str r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08134F34: .4byte 0x03005B60
_08134F38: .4byte 0x08134F3D
	thumb_func_end Task_SetClock5

	thumb_func_start Task_SetClock6
Task_SetClock6: @ 0x08134F3C
	push {lr}
	ldr r0, _08134F5C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08134F56
	bl FreeAllWindowBuffers
	ldr r0, _08134F60
	ldr r0, [r0, #8]
	bl SetMainCallback2
_08134F56:
	pop {r0}
	bx r0
	.align 2, 0
_08134F5C: .4byte 0x02037C74
_08134F60: .4byte 0x03002360
	thumb_func_end Task_SetClock6

	thumb_func_start Task_SetClock1
Task_SetClock1: @ 0x08134F64
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08134F88
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08134F84
	ldr r0, _08134F8C
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08134F90
	str r0, [r1]
_08134F84:
	pop {r0}
	bx r0
	.align 2, 0
_08134F88: .4byte 0x02037C74
_08134F8C: .4byte 0x03005B60
_08134F90: .4byte 0x08134F95
	thumb_func_end Task_SetClock1

	thumb_func_start Task_ViewClock2
Task_ViewClock2: @ 0x08134F94
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl InitClockWithRtc
	ldr r0, _08134FC0
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08134FBA
	ldr r0, _08134FC4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08134FC8
	str r0, [r1]
_08134FBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08134FC0: .4byte 0x03002360
_08134FC4: .4byte 0x03005B60
_08134FC8: .4byte 0x08134FCD
	thumb_func_end Task_ViewClock2

	thumb_func_start Task_ViewClock3
Task_ViewClock3: @ 0x08134FCC
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
	ldr r1, _08134FFC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08135000
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08134FFC: .4byte 0x03005B60
_08135000: .4byte 0x08135005
	thumb_func_end Task_ViewClock3

	thumb_func_start Task_ViewClock4
Task_ViewClock4: @ 0x08135004
	push {lr}
	ldr r0, _08135020
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0813501A
	ldr r0, _08135024
	ldr r0, [r0, #8]
	bl SetMainCallback2
_0813501A:
	pop {r0}
	bx r0
	.align 2, 0
_08135020: .4byte 0x02037C74
_08135024: .4byte 0x03002360
	thumb_func_end Task_ViewClock4

	thumb_func_start CalcMinHandDelta
CalcMinHandDelta: @ 0x08135028
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r0, #0x3c
	bls _08135038
	movs r0, #6
	b _0813504A
_08135038:
	cmp r0, #0x1e
	bls _08135040
	movs r0, #3
	b _0813504A
_08135040:
	cmp r1, #0xa
	bhi _08135048
	movs r0, #1
	b _0813504A
_08135048:
	movs r0, #2
_0813504A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CalcMinHandDelta

	thumb_func_start CalcNewMinHandAngle
CalcNewMinHandAngle: @ 0x08135050
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r2, #0
	bl CalcMinHandDelta
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r5, #1
	beq _08135072
	cmp r5, #2
	beq _08135084
	b _08135098
_08135072:
	cmp r4, #0
	beq _0813507A
	subs r0, r4, r1
	b _08135090
_0813507A:
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	b _08135090
_08135084:
	movs r0, #0xb4
	lsls r0, r0, #1
	subs r0, r0, r1
	cmp r4, r0
	bge _08135096
	adds r0, r4, r1
_08135090:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08135098
_08135096:
	movs r4, #0
_08135098:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CalcNewMinHandAngle

	thumb_func_start AdvanceClock
AdvanceClock: @ 0x081350A0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r4, #1
	beq _081350B4
	cmp r4, #2
	beq _081350F4
	b _08135132
_081350B4:
	ldr r0, _081350D0
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1, #0xe]
	movs r5, #0xe
	ldrsh r0, [r1, r5]
	cmp r0, #0
	ble _081350D4
	subs r0, r2, #1
	strh r0, [r1, #0xe]
	b _08135132
	.align 2, 0
_081350D0: .4byte 0x03005B60
_081350D4:
	movs r0, #0x3b
	strh r0, [r1, #0xe]
	ldrh r2, [r1, #0xc]
	movs r6, #0xc
	ldrsh r0, [r1, r6]
	cmp r0, #0
	ble _081350E6
	subs r0, r2, #1
	b _081350E8
_081350E6:
	movs r0, #0x17
_081350E8:
	strh r0, [r1, #0xc]
	adds r0, r3, #0
	adds r1, r4, #0
	bl UpdateClockPeriod
	b _08135132
_081350F4:
	ldr r0, _08135110
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1, #0xe]
	movs r5, #0xe
	ldrsh r0, [r1, r5]
	cmp r0, #0x3a
	bgt _08135114
	adds r0, r2, #1
	strh r0, [r1, #0xe]
	b _08135132
	.align 2, 0
_08135110: .4byte 0x03005B60
_08135114:
	movs r5, #0
	strh r5, [r1, #0xe]
	ldrh r2, [r1, #0xc]
	movs r6, #0xc
	ldrsh r0, [r1, r6]
	cmp r0, #0x16
	bgt _08135128
	adds r0, r2, #1
	strh r0, [r1, #0xc]
	b _0813512A
_08135128:
	strh r5, [r1, #0xc]
_0813512A:
	adds r0, r3, #0
	adds r1, r4, #0
	bl UpdateClockPeriod
_08135132:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AdvanceClock

	thumb_func_start UpdateClockPeriod
UpdateClockPeriod: @ 0x0813513C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r2, _0813515C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #0xc]
	cmp r3, #1
	beq _08135160
	cmp r3, #2
	beq _08135172
	b _0813517E
	.align 2, 0
_0813515C: .4byte 0x03005B60
_08135160:
	cmp r0, #0xb
	beq _0813516A
	cmp r0, #0x17
	beq _0813516E
	b _0813517E
_0813516A:
	movs r0, #0
	b _0813517C
_0813516E:
	strh r3, [r1, #0x12]
	b _0813517E
_08135172:
	cmp r0, #0
	beq _0813517C
	cmp r0, #0xc
	bne _0813517E
	movs r0, #1
_0813517C:
	strh r0, [r1, #0x12]
_0813517E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateClockPeriod

	thumb_func_start InitClockWithRtc
InitClockWithRtc: @ 0x08135184
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl RtcCalcLocalTime
	ldr r1, _081351EC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r6, r0, r1
	ldr r5, _081351F0
	movs r0, #2
	ldrsb r0, [r5, r0]
	strh r0, [r6, #0xc]
	movs r0, #3
	ldrsb r0, [r5, r0]
	strh r0, [r6, #0xe]
	movs r0, #0xe
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	strh r0, [r6, #8]
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	movs r1, #0xc
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #4
	subs r4, r4, r0
	lsls r4, r4, #1
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r4, r4, r1
	strh r4, [r6, #0xa]
	movs r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	bgt _081351F4
	movs r0, #0
	b _081351F6
	.align 2, 0
_081351EC: .4byte 0x03005B60
_081351F0: .4byte 0x03005A50
_081351F4:
	movs r0, #1
_081351F6:
	strh r0, [r6, #0x12]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitClockWithRtc

	thumb_func_start SpriteCB_MinuteHand
SpriteCB_MinuteHand: @ 0x08135200
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, _08135290
	movs r0, #0x2e
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r4, [r0, #8]
	adds r7, r4, #0
	adds r0, r4, #0
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08135228
	adds r0, #0xf
_08135228:
	lsls r0, r0, #0xc
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl Cos2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0813523C
	adds r0, #0xf
_0813523C:
	lsls r1, r0, #0xc
	lsrs r1, r1, #0x10
	lsls r3, r5, #0x10
	lsrs r2, r3, #0x10
	rsbs r3, r3, #0
	lsrs r3, r3, #0x10
	str r1, [sp]
	movs r0, #0
	bl SetOamMatrix
	ldr r1, _08135294
	lsls r2, r7, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r1, #1
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r3, #0x80
	bls _08135278
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	orrs r3, r0
_08135278:
	cmp r2, #0x80
	bls _08135284
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	orrs r2, r0
_08135284:
	strh r3, [r6, #0x24]
	strh r2, [r6, #0x26]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135290: .4byte 0x03005B60
_08135294: .4byte 0x08591D1C
	thumb_func_end SpriteCB_MinuteHand

	thumb_func_start SpriteCB_HourHand
SpriteCB_HourHand: @ 0x08135298
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, _08135328
	movs r0, #0x2e
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r4, [r0, #0xa]
	adds r7, r4, #0
	adds r0, r4, #0
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _081352C0
	adds r0, #0xf
_081352C0:
	lsls r0, r0, #0xc
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl Cos2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _081352D4
	adds r0, #0xf
_081352D4:
	lsls r1, r0, #0xc
	lsrs r1, r1, #0x10
	lsls r3, r5, #0x10
	lsrs r2, r3, #0x10
	rsbs r3, r3, #0
	lsrs r3, r3, #0x10
	str r1, [sp]
	movs r0, #1
	bl SetOamMatrix
	ldr r1, _0813532C
	lsls r2, r7, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r1, #1
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r3, #0x80
	bls _08135310
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	orrs r3, r0
_08135310:
	cmp r2, #0x80
	bls _0813531C
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	orrs r2, r0
_0813531C:
	strh r3, [r6, #0x24]
	strh r2, [r6, #0x26]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135328: .4byte 0x03005B60
_0813532C: .4byte 0x08591D1C
	thumb_func_end SpriteCB_HourHand

	thumb_func_start SpriteCB_AMIndicator
SpriteCB_AMIndicator: @ 0x08135330
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0813536C
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x12
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08135370
	ldrh r1, [r4, #0x30]
	adds r0, r1, #0
	subs r0, #0x3c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _0813535C
	adds r0, r1, #5
	strh r0, [r4, #0x30]
_0813535C:
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0x3b
	bgt _08135390
	adds r0, r1, #1
	b _0813538E
	.align 2, 0
_0813536C: .4byte 0x03005B60
_08135370:
	ldrh r1, [r4, #0x30]
	adds r0, r1, #0
	subs r0, #0x2e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _08135382
	subs r0, r1, #5
	strh r0, [r4, #0x30]
_08135382:
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0x4b
	ble _08135390
	subs r0, r1, #1
_0813538E:
	strh r0, [r4, #0x30]
_08135390:
	ldrh r0, [r4, #0x30]
	bl Cos2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #1
	cmp r0, #0
	bge _081353A8
	ldr r1, _081353D0
	adds r0, r0, r1
_081353A8:
	asrs r0, r0, #0xc
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x30]
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #1
	cmp r0, #0
	bge _081353C4
	ldr r2, _081353D0
	adds r0, r0, r2
_081353C4:
	asrs r0, r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081353D0: .4byte 0x00000FFF
	thumb_func_end SpriteCB_AMIndicator

	thumb_func_start SpriteCB_PMIndicator
SpriteCB_PMIndicator: @ 0x081353D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08135410
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x12
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08135414
	ldrh r1, [r4, #0x30]
	adds r0, r1, #0
	subs r0, #0x69
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _08135400
	adds r0, r1, #5
	strh r0, [r4, #0x30]
_08135400:
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0x68
	bgt _08135434
	adds r0, r1, #1
	b _08135432
	.align 2, 0
_08135410: .4byte 0x03005B60
_08135414:
	ldrh r1, [r4, #0x30]
	adds r0, r1, #0
	subs r0, #0x5b
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _08135426
	subs r0, r1, #5
	strh r0, [r4, #0x30]
_08135426:
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0x78
	ble _08135434
	subs r0, r1, #1
_08135432:
	strh r0, [r4, #0x30]
_08135434:
	ldrh r0, [r4, #0x30]
	bl Cos2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #1
	cmp r0, #0
	bge _0813544C
	ldr r1, _08135474
	adds r0, r0, r1
_0813544C:
	asrs r0, r0, #0xc
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x30]
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #1
	cmp r0, #0
	bge _08135468
	ldr r2, _08135474
	adds r0, r0, r2
_08135468:
	asrs r0, r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135474: .4byte 0x00000FFF
	thumb_func_end SpriteCB_PMIndicator

