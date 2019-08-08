.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Blender_ControlHitPitch
Blender_ControlHitPitch: @ 0x0807F170
	push {lr}
	ldr r0, _0807F190
	ldr r1, _0807F194
	ldr r2, _0807F198
	ldr r2, [r2]
	adds r2, #0x4c
	movs r3, #0
	ldrsh r2, [r2, r3]
	subs r2, #0x80
	lsls r2, r2, #0x11
	asrs r2, r2, #0x10
	bl m4aMPlayPitchControl
	pop {r0}
	bx r0
	.align 2, 0
_0807F190: .4byte 0x03007550
_0807F194: .4byte 0x0000FFFF
_0807F198: .4byte 0x02031F44
	thumb_func_end Blender_ControlHitPitch

	thumb_func_start VBlankCB0_BerryBlender
VBlankCB0_BerryBlender: @ 0x0807F19C
	push {r4, lr}
	sub sp, #0x10
	bl BerryBlender_SetBackgroundsPos
	ldr r0, _0807F20C
	ldr r0, [r0]
	mov ip, r0
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, ip
	ldr r1, [r0]
	movs r0, #0xa2
	lsls r0, r0, #1
	add r0, ip
	ldr r2, [r0]
	movs r0, #0xa4
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r3, [r0, r4]
	movs r0, #0xa5
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	movs r0, #0xa6
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp, #4]
	movs r0, #0xa7
	lsls r0, r0, #1
	add r0, ip
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp, #8]
	movs r0, #0xa8
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	str r0, [sp, #0xc]
	movs r0, #2
	bl SetBgAffine
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F20C: .4byte 0x02031F44
	thumb_func_end VBlankCB0_BerryBlender

	thumb_func_start LoadBerryBlenderGfx
LoadBerryBlenderGfx: @ 0x0807F210
	push {r4, r5, lr}
	ldr r1, _0807F22C
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	adds r5, r1, #0
	cmp r0, #9
	bls _0807F220
	b _0807F400
_0807F220:
	lsls r0, r0, #2
	ldr r1, _0807F230
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807F22C: .4byte 0x02031F44
_0807F230: .4byte 0x0807F234
_0807F234: @ jump table
	.4byte _0807F25C @ case 0
	.4byte _0807F28C @ case 1
	.4byte _0807F2B8 @ case 2
	.4byte _0807F2E4 @ case 3
	.4byte _0807F300 @ case 4
	.4byte _0807F32C @ case 5
	.4byte _0807F348 @ case 6
	.4byte _0807F378 @ case 7
	.4byte _0807F388 @ case 8
	.4byte _0807F3B8 @ case 9
_0807F25C:
	ldr r5, _0807F280
	adds r0, r5, #0
	bl GetDecompressedDataSize
	adds r0, #0x64
	bl AllocZeroed
	adds r1, r0, #0
	ldr r4, _0807F284
	ldr r0, [r4]
	ldr r2, _0807F288
	adds r0, r0, r2
	str r1, [r0]
	adds r0, r5, #0
	bl LZDecompressVram
	ldr r1, [r4]
	b _0807F39E
	.align 2, 0
_0807F280: .4byte 0x08D9154C
_0807F284: .4byte 0x02031F44
_0807F288: .4byte 0x000011B8
_0807F28C:
	ldr r1, _0807F2B0
	movs r2, #0x80
	lsls r2, r2, #3
	movs r0, #2
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	ldr r0, _0807F2B4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl LoadPalette
	b _0807F39A
	.align 2, 0
_0807F2B0: .4byte 0x0830D374
_0807F2B4: .4byte 0x0830D354
_0807F2B8:
	ldr r0, [r5]
	ldr r1, _0807F2DC
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _0807F2E0
	bl GetDecompressedDataSize
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r4, #0
	movs r3, #0
	bl LoadBgTiles
	ldr r1, [r5]
	b _0807F39E
	.align 2, 0
_0807F2DC: .4byte 0x000011B8
_0807F2E0: .4byte 0x08D9154C
_0807F2E4:
	ldr r0, _0807F2F8
	ldr r1, [r5]
	ldr r2, _0807F2FC
	adds r1, r1, r2
	ldr r1, [r1]
	bl LZDecompressVram
	ldr r1, [r5]
	b _0807F39E
	.align 2, 0
_0807F2F8: .4byte 0x08D91D6C
_0807F2FC: .4byte 0x000011B8
_0807F300:
	ldr r0, [r5]
	ldr r1, _0807F324
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _0807F328
	bl GetDecompressedDataSize
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	adds r1, r4, #0
	movs r3, #0
	bl LoadBgTiles
	ldr r1, [r5]
	b _0807F39E
	.align 2, 0
_0807F324: .4byte 0x000011B8
_0807F328: .4byte 0x08D91D6C
_0807F32C:
	ldr r0, _0807F340
	ldr r1, [r5]
	ldr r2, _0807F344
	adds r1, r1, r2
	ldr r1, [r1]
	bl LZDecompressVram
	ldr r1, [r5]
	b _0807F39E
	.align 2, 0
_0807F340: .4byte 0x08D927A0
_0807F344: .4byte 0x000011B8
_0807F348:
	ldr r0, [r5]
	ldr r1, _0807F370
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _0807F374
	bl GetDecompressedDataSize
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	adds r1, r4, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	ldr r1, [r5]
	b _0807F39E
	.align 2, 0
_0807F370: .4byte 0x000011B8
_0807F374: .4byte 0x08D927A0
_0807F378:
	ldr r0, _0807F384
	movs r1, #0x80
	movs r2, #0x20
	bl LoadPalette
	b _0807F39A
	.align 2, 0
_0807F384: .4byte 0x0830D774
_0807F388:
	ldr r0, _0807F3A8
	bl LoadSpriteSheet
	ldr r0, _0807F3AC
	bl LoadSpriteSheet
	ldr r0, _0807F3B0
	bl LoadSpriteSheet
_0807F39A:
	ldr r0, _0807F3B4
	ldr r1, [r0]
_0807F39E:
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _0807F400
	.align 2, 0
_0807F3A8: .4byte 0x0830F9B0
_0807F3AC: .4byte 0x0830FAC8
_0807F3B0: .4byte 0x0830FA28
_0807F3B4: .4byte 0x02031F44
_0807F3B8:
	ldr r0, _0807F3E8
	bl LoadSpriteSheet
	ldr r0, _0807F3EC
	bl LoadSpriteSheet
	ldr r0, _0807F3F0
	bl LoadSpritePalette
	ldr r0, _0807F3F4
	bl LoadSpritePalette
	ldr r4, _0807F3F8
	ldr r0, [r4]
	ldr r2, _0807F3FC
	adds r0, r0, r2
	ldr r0, [r0]
	bl Free
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #1]
	movs r0, #1
	b _0807F402
	.align 2, 0
_0807F3E8: .4byte 0x0830FB14
_0807F3EC: .4byte 0x0830FB48
_0807F3F0: .4byte 0x0830F9C0
_0807F3F4: .4byte 0x0830F9B8
_0807F3F8: .4byte 0x02031F44
_0807F3FC: .4byte 0x000011B8
_0807F400:
	movs r0, #0
_0807F402:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end LoadBerryBlenderGfx

	thumb_func_start sub_0807F408
sub_0807F408: @ 0x0807F408
	push {lr}
	sub sp, #8
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuRegBits
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
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807F408

	thumb_func_start InitBerryBlenderWindows
InitBerryBlenderWindows: @ 0x0807F46C
	push {r4, lr}
	sub sp, #8
	ldr r0, _0807F4B4
	bl InitWindows
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807F4AC
	bl DeactivateAllTextPrinters
	movs r4, #0
_0807F482:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r4, #1
	cmp r4, #4
	ble _0807F482
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0xe0
	bl Menu_LoadStdPalAt
_0807F4AC:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F4B4: .4byte 0x0830F870
	thumb_func_end InitBerryBlenderWindows

	thumb_func_start DoBerryBlending
DoBerryBlending: @ 0x0807F4B8
	push {r4, lr}
	ldr r4, _0807F4F0
	ldr r0, [r4]
	cmp r0, #0
	bne _0807F4CA
	ldr r0, _0807F4F4
	bl AllocZeroed
	str r0, [r4]
_0807F4CA:
	ldr r0, [r4]
	adds r0, #0x63
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r4]
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x63
	strb r1, [r0]
	ldr r0, _0807F4F8
	ldrb r0, [r0]
	bl Blender_SetPlayerNamesLocal
	ldr r0, _0807F4FC
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F4F0: .4byte 0x02031F44
_0807F4F4: .4byte 0x000011DC
_0807F4F8: .4byte 0x02037280
_0807F4FC: .4byte 0x0807F501
	thumb_func_end DoBerryBlending

	thumb_func_start sub_0807F500
sub_0807F500: @ 0x0807F500
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r1, _0807F51C
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #6
	bls _0807F512
	b _0807F71A
_0807F512:
	lsls r0, r0, #2
	ldr r1, _0807F520
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807F51C: .4byte 0x02031F44
_0807F520: .4byte 0x0807F524
_0807F524: @ jump table
	.4byte _0807F540 @ case 0
	.4byte _0807F5E4 @ case 1
	.4byte _0807F670 @ case 2
	.4byte _0807F686 @ case 3
	.4byte _0807F69C @ case 4
	.4byte _0807F6C8 @ case 5
	.4byte _0807F6E8 @ case 6
_0807F540:
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0807F5D8
	movs r0, #1
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r4, _0807F5DC
	ldr r1, [r4]
	movs r0, #0xda
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0807F5E0
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	movs r0, #0
	movs r1, #1
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	movs r0, #0
	movs r1, #0x14
	movs r2, #0xf0
	bl LoadMessageBoxGfx
	bl InitBerryBlenderWindows
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	ldr r3, [r4]
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r1, #0
	strh r2, [r0]
	movs r4, #0x8b
	lsls r4, r4, #1
	adds r0, r3, r4
	strh r2, [r0]
	movs r0, #0x8d
	lsls r0, r0, #1
	adds r4, r3, r0
	movs r0, #0x50
	strh r0, [r4]
	movs r4, #0x8e
	lsls r4, r4, #1
	adds r0, r3, r4
	strh r2, [r0]
	adds r4, #2
	adds r0, r3, r4
	strh r2, [r0]
	strb r1, [r3, #1]
	bl sub_08082744
	b _0807F71A
	.align 2, 0
_0807F5D8: .4byte 0x0830F864
_0807F5DC: .4byte 0x02031F44
_0807F5E0: .4byte 0x000009B4
_0807F5E4:
	bl LoadBerryBlenderGfx
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807F5F0
	b _0807F71A
_0807F5F0:
	movs r4, #0
	ldr r5, _0807F654
	ldr r6, _0807F658
_0807F5F6:
	ldrb r1, [r5]
	ldrb r2, [r5, #1]
	ldr r0, _0807F65C
	movs r3, #1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, #0x50
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x50
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0807F660
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _0807F5F6
	ldr r0, _0807F664
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807F64C
	ldr r0, _0807F668
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807F64C
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
_0807F64C:
	ldr r0, _0807F66C
	bl SetVBlankCallback
	b _0807F6D8
	.align 2, 0
_0807F654: .4byte 0x0830F8B8
_0807F658: .4byte 0x02031F44
_0807F65C: .4byte 0x0830F9C8
_0807F660: .4byte 0x020205AC
_0807F664: .4byte 0x030031C4
_0807F668: .4byte 0x0300319C
_0807F66C: .4byte 0x0807F19D
_0807F670:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	bl sub_08082744
	b _0807F6D8
_0807F686:
	bl sub_0807F408
	ldr r0, _0807F698
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F71A
	b _0807F6D8
	.align 2, 0
_0807F698: .4byte 0x02037C74
_0807F69C:
	ldr r4, [r6]
	ldr r0, _0807F6C0
	adds r4, r4, r0
	ldr r5, _0807F6C4
	bl GetPlayerTextSpeedDelay
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl Blender_PrintText
	cmp r0, #0
	beq _0807F71A
	ldr r1, [r6]
	b _0807F6DC
	.align 2, 0
_0807F6C0: .4byte 0x000011B4
_0807F6C4: .4byte 0x0830F6AE
_0807F6C8:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_0807F6D8:
	ldr r0, _0807F6E4
	ldr r1, [r0]
_0807F6DC:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807F71A
	.align 2, 0
_0807F6E4: .4byte 0x02031F44
_0807F6E8:
	ldr r0, _0807F734
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0807F71A
	bl FreeAllWindowBuffers
	movs r0, #2
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #0
	bl SetVBlankCallback
	ldr r0, _0807F738
	bl sub_081AA968
	ldr r0, _0807F73C
	ldr r0, [r0]
	strb r4, [r0]
_0807F71A:
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F734: .4byte 0x02037C74
_0807F738: .4byte 0x0807F9AD
_0807F73C: .4byte 0x02031F44
	thumb_func_end sub_0807F500

	thumb_func_start sub_0807F740
sub_0807F740: @ 0x0807F740
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x30]
	adds r0, r0, r1
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x32]
	ldrh r2, [r4, #0x36]
	subs r1, r1, r2
	ldrh r0, [r4, #0x3c]
	adds r1, r1, r0
	strh r1, [r4, #0x32]
	ldrh r3, [r4, #0x2e]
	adds r0, r0, r3
	strh r0, [r4, #0x2e]
	subs r2, #1
	strh r2, [r4, #0x36]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	cmp r0, r1
	bge _0807F78E
	ldrh r0, [r4, #0x34]
	subs r0, #1
	strh r0, [r4, #0x36]
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0807F788
	adds r0, r4, #0
	bl DestroySprite
	b _0807F78E
_0807F788:
	movs r0, #0x74
	bl PlaySE
_0807F78E:
	ldrh r0, [r4, #0x30]
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x32]
	strh r0, [r4, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0807F740

	thumb_func_start sub_0807F79C
sub_0807F79C: @ 0x0807F79C
	push {r4, r5, r6, lr}
	ldr r5, [sp, #0x10]
	ldr r6, [sp, #0x14]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r4, #0
	strh r2, [r0, #0x2e]
	strh r1, [r0, #0x30]
	strh r2, [r0, #0x32]
	strh r3, [r0, #0x34]
	movs r1, #0xa
	strh r1, [r0, #0x36]
	strh r4, [r0, #0x38]
	strh r5, [r0, #0x3a]
	strh r6, [r0, #0x3c]
	ldr r1, _0807F7C4
	str r1, [r0, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F7C4: .4byte 0x0807F741
	thumb_func_end sub_0807F79C

	thumb_func_start sub_0807F7C8
sub_0807F7C8: @ 0x0807F7C8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r6, r1, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r0, r0, #0x18
	movs r1, #0xf6
	lsls r1, r1, #0x17
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	movs r3, #1
	ands r3, r6
	movs r1, #0
	movs r2, #0x50
	bl LoadSpinningBerryPicGfx
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	mov r8, r2
	add r8, r0
	mov r3, r8
	lsls r3, r3, #2
	mov r8, r3
	ldr r0, _0807F844
	add r8, r0
	ldr r5, _0807F848
	lsls r4, r6, #2
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r0, r4, r5
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, r5, #2
	adds r0, r4, r0
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r5, #4
	adds r0, r4, r0
	movs r6, #0
	ldrsh r3, [r0, r6]
	adds r0, r5, #6
	adds r0, r4, r0
	movs r6, #0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r5, #8
	adds r4, r4, r5
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp, #4]
	mov r0, r8
	bl sub_0807F79C
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F844: .4byte 0x020205AC
_0807F848: .4byte 0x0830FB68
	thumb_func_end sub_0807F7C8

	thumb_func_start Blender_CopyBerryData
Blender_CopyBerryData: @ 0x0807F84C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	adds r0, r5, #0
	adds r0, #0x7c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBerryInfo
	adds r4, r0, #0
	strh r5, [r6]
	adds r0, r6, #2
	adds r1, r4, #0
	bl StringCopy
	ldrb r0, [r4, #0x15]
	strb r0, [r6, #9]
	ldrb r0, [r4, #0x16]
	strb r0, [r6, #0xa]
	ldrb r0, [r4, #0x17]
	strb r0, [r6, #0xb]
	ldrb r0, [r4, #0x18]
	strb r0, [r6, #0xc]
	ldrb r0, [r4, #0x19]
	strb r0, [r6, #0xd]
	ldrb r0, [r4, #0x1a]
	strb r0, [r6, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Blender_CopyBerryData

	thumb_func_start Blender_SetPlayerNamesLocal
Blender_SetPlayerNamesLocal: @ 0x0807F88C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	beq _0807F8B4
	cmp r1, #1
	bgt _0807F8A0
	cmp r1, #0
	beq _0807F8AA
	b _0807F992
_0807F8A0:
	cmp r1, #2
	beq _0807F90C
	cmp r1, #3
	beq _0807F954
	b _0807F992
_0807F8AA:
	ldr r0, _0807F8B0
	strb r1, [r0]
	b _0807F992
	.align 2, 0
_0807F8B0: .4byte 0x03005AF8
_0807F8B4:
	ldr r0, _0807F8E8
	strb r1, [r0]
	ldr r0, _0807F8EC
	ldr r0, [r0]
	adds r0, #0x7c
	movs r1, #2
	strb r1, [r0]
	ldr r4, _0807F8F0
	ldr r0, _0807F8F4
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringCopy
	movs r0, #0xd0
	lsls r0, r0, #2
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807F8FC
	adds r0, r4, #0
	adds r0, #0x1c
	ldr r1, _0807F8F8
	bl StringCopy
	b _0807F992
	.align 2, 0
_0807F8E8: .4byte 0x03005AF8
_0807F8EC: .4byte 0x02031F44
_0807F8F0: .4byte 0x020226A8
_0807F8F4: .4byte 0x03005AF0
_0807F8F8: .4byte 0x0830F760
_0807F8FC:
	adds r0, r4, #0
	adds r0, #0x1c
	ldr r1, _0807F908
	bl StringCopy
	b _0807F992
	.align 2, 0
_0807F908: .4byte 0x0830F74E
_0807F90C:
	ldr r0, _0807F940
	strb r1, [r0]
	ldr r0, _0807F944
	ldr r0, [r0]
	adds r0, #0x7c
	movs r1, #3
	strb r1, [r0]
	ldr r5, _0807F948
	ldr r0, _0807F94C
	ldr r1, [r0]
	adds r0, r5, #0
	bl StringCopy
	adds r0, r5, #0
	adds r0, #0x1c
	ldr r4, _0807F950
	adds r1, r4, #0
	bl StringCopy
	adds r5, #0x38
	subs r4, #0xc
	adds r0, r5, #0
	adds r1, r4, #0
	bl StringCopy
	b _0807F992
	.align 2, 0
_0807F940: .4byte 0x03005AF8
_0807F944: .4byte 0x02031F44
_0807F948: .4byte 0x020226A8
_0807F94C: .4byte 0x03005AF0
_0807F950: .4byte 0x0830F766
_0807F954:
	ldr r0, _0807F998
	strb r1, [r0]
	ldr r0, _0807F99C
	ldr r0, [r0]
	adds r0, #0x7c
	movs r1, #4
	strb r1, [r0]
	ldr r5, _0807F9A0
	ldr r0, _0807F9A4
	ldr r1, [r0]
	adds r0, r5, #0
	bl StringCopy
	adds r0, r5, #0
	adds r0, #0x1c
	ldr r4, _0807F9A8
	adds r1, r4, #0
	bl StringCopy
	adds r0, r5, #0
	adds r0, #0x38
	adds r1, r4, #0
	subs r1, #0x18
	bl StringCopy
	adds r5, #0x54
	subs r4, #0x12
	adds r0, r5, #0
	adds r1, r4, #0
	bl StringCopy
_0807F992:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F998: .4byte 0x03005AF8
_0807F99C: .4byte 0x02031F44
_0807F9A0: .4byte 0x020226A8
_0807F9A4: .4byte 0x03005AF0
_0807F9A8: .4byte 0x0830F76C
	thumb_func_end Blender_SetPlayerNamesLocal

	thumb_func_start sub_0807F9AC
sub_0807F9AC: @ 0x0807F9AC
	push {r4, r5, lr}
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	ldr r4, _0807FA00
	ldr r0, [r4]
	cmp r0, #0
	bne _0807F9C6
	ldr r0, _0807FA04
	bl AllocZeroed
	str r0, [r4]
_0807F9C6:
	ldr r0, [r4]
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r4]
	movs r2, #0x86
	lsls r2, r2, #1
	adds r0, r0, r2
	str r1, [r0]
	movs r2, #0
	ldr r5, _0807FA08
	movs r3, #0
_0807F9DC:
	ldr r0, [r4]
	lsls r1, r2, #1
	adds r0, #0x74
	adds r0, r0, r1
	strh r3, [r0]
	adds r2, #1
	cmp r2, #3
	ble _0807F9DC
	ldrb r0, [r5]
	bl Blender_SetPlayerNamesLocal
	ldrh r0, [r5]
	cmp r0, #0
	bne _0807FA10
	ldr r0, _0807FA0C
	bl SetMainCallback2
	b _0807FA16
	.align 2, 0
_0807FA00: .4byte 0x02031F44
_0807FA04: .4byte 0x000011DC
_0807FA08: .4byte 0x02037280
_0807FA0C: .4byte 0x0807FA21
_0807FA10:
	ldr r0, _0807FA1C
	bl SetMainCallback2
_0807FA16:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FA1C: .4byte 0x080802F1
	thumb_func_end sub_0807F9AC

	thumb_func_start sub_0807FA20
sub_0807FA20: @ 0x0807FA20
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _0807FA3C
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x15
	bls _0807FA32
	b _0807FF4E
_0807FA32:
	lsls r0, r0, #2
	ldr r1, _0807FA40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807FA3C: .4byte 0x02031F44
_0807FA40: .4byte 0x0807FA44
_0807FA44: @ jump table
	.4byte _0807FA9C @ case 0
	.4byte _0807FB08 @ case 1
	.4byte _0807FB28 @ case 2
	.4byte _0807FBA4 @ case 3
	.4byte _0807FBB6 @ case 4
	.4byte _0807FBD0 @ case 5
	.4byte _0807FF4E @ case 6
	.4byte _0807FF4E @ case 7
	.4byte _0807FC00 @ case 8
	.4byte _0807FC50 @ case 9
	.4byte _0807FC74 @ case 10
	.4byte _0807FD0A @ case 11
	.4byte _0807FD64 @ case 12
	.4byte _0807FDDC @ case 13
	.4byte _0807FE10 @ case 14
	.4byte _0807FEA4 @ case 15
	.4byte _0807FED8 @ case 16
	.4byte _0807FF4E @ case 17
	.4byte _0807FF00 @ case 18
	.4byte _0807FEEC @ case 19
	.4byte _0807FEF2 @ case 20
	.4byte _0807FF10 @ case 21
_0807FA9C:
	bl sub_0807FF90
	ldr r1, _0807FAFC
	ldr r2, _0807FB00
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0807FB04
	ldr r0, [r2]
	adds r0, #0x72
	movs r1, #0
	strb r1, [r0]
	movs r5, #0
	movs r6, #0
	movs r7, #0x92
	lsls r7, r7, #1
_0807FABA:
	ldr r0, [r2]
	lsls r1, r5, #1
	adds r0, #0x64
	adds r0, r0, r1
	strh r6, [r0]
	adds r4, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	movs r3, #2
_0807FACC:
	ldr r0, [r2]
	adds r0, r0, r7
	adds r0, r0, r1
	strh r6, [r0]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _0807FACC
	adds r5, r4, #0
	cmp r5, #3
	ble _0807FABA
	ldr r3, _0807FB04
	ldr r4, [r3]
	adds r1, r4, #0
	adds r1, #0x70
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	subs r1, #0x22
	strh r0, [r1]
	strb r2, [r4, #1]
	ldr r1, [r3]
	b _0807FF04
	.align 2, 0
_0807FAFC: .4byte 0x0202267E
_0807FB00: .4byte 0x00004422
_0807FB04: .4byte 0x02031F44
_0807FB08:
	bl LoadBerryBlenderGfx
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807FB14
	b _0807FF4E
_0807FB14:
	ldr r0, _0807FB24
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_08082744
	b _0807FF4E
	.align 2, 0
_0807FB24: .4byte 0x02031F44
_0807FB28:
	movs r5, #0
	ldr r4, _0807FB8C
	ldr r6, _0807FB90
_0807FB2E:
	ldrb r1, [r4]
	ldrb r2, [r4, #1]
	ldr r0, _0807FB94
	movs r3, #1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, #0x54
	adds r1, r1, r5
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x54
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0807FB98
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _0807FB2E
	ldr r0, _0807FB9C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807FB72
	b _0807FF00
_0807FB72:
	ldr r0, _0807FBA0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807FB7C
	b _0807FF00
_0807FB7C:
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	b _0807FF00
	.align 2, 0
_0807FB8C: .4byte 0x0830F8B8
_0807FB90: .4byte 0x02031F44
_0807FB94: .4byte 0x0830F9C8
_0807FB98: .4byte 0x020205AC
_0807FB9C: .4byte 0x030031C4
_0807FBA0: .4byte 0x0300319C
_0807FBA4:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _0807FF00
_0807FBB6:
	bl sub_0807F408
	ldr r0, _0807FBCC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807FBC8
	b _0807FF4E
_0807FBC8:
	b _0807FF00
	.align 2, 0
_0807FBCC: .4byte 0x02037C74
_0807FBD0:
	ldr r4, _0807FBF4
	ldr r0, [r4]
	ldr r3, _0807FBF8
	adds r0, r0, r3
	ldr r1, _0807FBFC
	movs r2, #0
	bl Blender_PrintText
	ldr r1, [r4]
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r0, r1
	str r2, [r0]
	b _0807FF4E
	.align 2, 0
_0807FBF4: .4byte 0x02031F44
_0807FBF8: .4byte 0x000011B4
_0807FBFC: .4byte 0x0830F78E
_0807FC00:
	ldr r4, _0807FC44
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	movs r6, #0
	strb r0, [r1]
	ldr r0, [r4]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r4]
	movs r5, #0xac
	lsls r5, r5, #1
	adds r0, r0, r5
	ldr r1, _0807FC48
	ldrh r1, [r1]
	bl Blender_CopyBerryData
	ldr r0, _0807FC4C
	ldr r1, [r4]
	adds r1, r1, r5
	movs r2, #0x10
	bl memcpy
	bl sub_0800A8D4
	ldr r0, [r4]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r0, r0, r3
	str r6, [r0]
	b _0807FF4E
	.align 2, 0
_0807FC44: .4byte 0x02031F44
_0807FC48: .4byte 0x0203CB48
_0807FC4C: .4byte 0x0202257C
_0807FC50:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807FC5C
	b _0807FF4E
_0807FC5C:
	bl ResetBlockReceivedFlags
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807FC6C
	b _0807FF00
_0807FC6C:
	movs r0, #4
	bl sub_0800A09C
	b _0807FF00
_0807FC74:
	ldr r6, _0807FCB0
	ldr r1, [r6]
	movs r0, #0x84
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x14
	bgt _0807FC8A
	b _0807FF4E
_0807FC8A:
	movs r0, #4
	movs r1, #1
	bl ClearDialogWindowAndFrameToTransparent
	bl GetBlockReceivedStatus
	adds r4, r0, #0
	bl sub_0800A59C
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _0807FCA6
	b _0807FF4E
_0807FCA6:
	movs r5, #0
	adds r7, r6, #0
	movs r6, #0xac
	lsls r6, r6, #1
	b _0807FCDC
	.align 2, 0
_0807FCB0: .4byte 0x02031F44
_0807FCB4:
	ldr r0, [r7]
	lsls r4, r5, #4
	adds r0, r4, r0
	adds r0, r0, r6
	lsls r1, r5, #8
	ldr r2, _0807FCF0
	adds r1, r1, r2
	movs r2, #0x10
	bl memcpy
	ldr r0, [r7]
	lsls r2, r5, #1
	adds r1, r0, #0
	adds r1, #0x74
	adds r1, r1, r2
	adds r0, r0, r4
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r5, #1
_0807FCDC:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	blt _0807FCB4
	bl ResetBlockReceivedFlags
	b _0807FF00
	.align 2, 0
_0807FCF0: .4byte 0x0202207C
_0807FCF4:
	ldrb r1, [r4]
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl sub_0807F7C8
	b _0807FD3E
_0807FD0A:
	bl GetLinkPlayerCount
	ldr r2, _0807FD5C
	ldr r1, [r2]
	adds r1, #0x7c
	strb r0, [r1]
	movs r5, #0
	ldr r2, [r2]
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r4, r2, r1
	ldr r1, _0807FD60
	adds r0, r2, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #2
	ldrb r3, [r4]
	adds r0, r0, r1
_0807FD30:
	ldrb r1, [r0]
	cmp r3, r1
	beq _0807FCF4
	adds r0, #1
	adds r5, #1
	cmp r5, #3
	ble _0807FD30
_0807FD3E:
	ldr r3, _0807FD5C
	ldr r1, [r3]
	movs r0, #0x84
	lsls r0, r0, #1
	adds r2, r1, r0
	movs r0, #0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r3]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r1, r1, r2
	b _0807FF04
	.align 2, 0
_0807FD5C: .4byte 0x02031F44
_0807FD60: .4byte 0x0830F8C0
_0807FD64:
	ldr r3, [r2]
	movs r0, #0x84
	lsls r0, r0, #1
	adds r1, r3, r0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3c
	bgt _0807FD78
	b _0807FF4E
_0807FD78:
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, r3, #0
	adds r1, #0x7c
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0807FDC0
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r2, [r2]
	ldr r3, _0807FDB4
	ldr r1, _0807FDB8
	adds r0, r2, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	subs r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _0807FDBC
	adds r1, r3, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r2, #0x4a
	strh r1, [r2]
	b _0807FDC6
	.align 2, 0
_0807FDB4: .4byte 0x0830F8CC
_0807FDB8: .4byte 0x0830F8D4
_0807FDBC: .4byte 0xFFFFA800
_0807FDC0:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
_0807FDC6:
	ldr r0, _0807FDD8
	ldr r0, [r0]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	b _0807FF4E
	.align 2, 0
_0807FDD8: .4byte 0x02031F44
_0807FDDC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807FDE8
	b _0807FF4E
_0807FDE8:
	ldr r2, _0807FE0C
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	bl sub_080826D0
	movs r0, #0x2b
	bl PlaySE
	movs r0, #2
	bl ShowBg
	b _0807FF4E
	.align 2, 0
_0807FE0C: .4byte 0x02031F44
_0807FE10:
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl SetGpuRegBits
	ldr r4, _0807FE98
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x4a
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	movs r0, #0x8d
	lsls r0, r0, #1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0807FE94
	movs r0, #0xc
	movs r1, #2
	bl SetGpuRegBits
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r3, [r4]
	movs r2, #0x8d
	lsls r2, r2, #1
	adds r1, r3, r2
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r2, _0807FE9C
	ldr r1, _0807FEA0
	adds r0, r3, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	subs r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x4a
	strh r0, [r1]
	movs r0, #0x84
	lsls r0, r0, #1
	adds r1, r3, r0
	movs r0, #0
	str r0, [r1]
	movs r0, #0x34
	bl PlaySE
	bl sub_08080154
	bl Blender_PrintPlayerNames
_0807FE94:
	ldr r0, [r4]
	b _0807FEC6
	.align 2, 0
_0807FE98: .4byte 0x02031F44
_0807FE9C: .4byte 0x0830F8CC
_0807FEA0: .4byte 0x0830F8D4
_0807FEA4:
	bl sub_08082D9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807FEC2
	ldr r0, _0807FED4
	ldr r1, [r0]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r2, r1, r3
	movs r0, #0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0807FEC2:
	ldr r0, _0807FED4
	ldr r0, [r0]
_0807FEC6:
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	bl sub_080826D0
	b _0807FF4E
	.align 2, 0
_0807FED4: .4byte 0x02031F44
_0807FED8:
	ldr r0, _0807FEE8
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r1, #0x78
	movs r3, #3
	bl CreateSprite
	b _0807FF00
	.align 2, 0
_0807FEE8: .4byte 0x0830FB1C
_0807FEEC:
	bl sub_0800A8D4
	b _0807FF00
_0807FEF2:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807FF4E
	bl sub_08009FDC
_0807FF00:
	ldr r0, _0807FF0C
	ldr r1, [r0]
_0807FF04:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807FF4E
	.align 2, 0
_0807FF0C: .4byte 0x02031F44
_0807FF10:
	ldr r5, _0807FF84
	ldr r3, [r5]
	adds r1, r3, #0
	adds r1, #0x4c
	movs r2, #0
	movs r0, #0x80
	strh r0, [r1]
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r3, r1
	str r2, [r0]
	ldr r0, _0807FF88
	bl SetMainCallback2
	bl GetCurrentMapMusic
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0807FF8C
	cmp r0, r4
	beq _0807FF48
	bl GetCurrentMapMusic
	ldr r1, [r5]
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r1, r1, r2
	strh r0, [r1]
_0807FF48:
	adds r0, r4, #0
	bl PlayBGM
_0807FF4E:
	ldr r0, _0807FF84
	ldr r1, [r0]
	movs r3, #0x8e
	lsls r3, r3, #1
	adds r0, r1, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r3, #2
	adds r1, r1, r3
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF84: .4byte 0x02031F44
_0807FF88: .4byte 0x080812B5
_0807FF8C: .4byte 0x00000193
	thumb_func_end sub_0807FA20

	thumb_func_start sub_0807FF90
sub_0807FF90: @ 0x0807FF90
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0808001C
	bl SetVBlankCallback
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08080020
	movs r0, #1
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r4, _08080024
	ldr r1, [r4]
	movs r0, #0xda
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r3, _08080028
	adds r1, r1, r3
	movs r0, #2
	bl SetBgTilemapBuffer
	movs r0, #0
	movs r1, #1
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	movs r0, #0
	movs r1, #0x14
	movs r2, #0xf0
	bl LoadMessageBoxGfx
	bl InitBerryBlenderWindows
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	movs r3, #0x8e
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808001C: .4byte 0x0807F19D
_08080020: .4byte 0x0830F864
_08080024: .4byte 0x02031F44
_08080028: .4byte 0x000009B4
	thumb_func_end sub_0807FF90

	thumb_func_start sub_0808002C
sub_0808002C: @ 0x0808002C
	push {lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	adds r2, #0x18
	ldr r0, _08080068
	ldr r0, [r0]
	lsrs r1, r1, #0x17
	adds r0, #0x96
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _0808006C
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r2, r1
	blo _08080074
	adds r0, r1, #0
	adds r0, #0x30
	cmp r2, r0
	bhs _08080074
	subs r0, #0x1c
	cmp r2, r0
	blo _08080070
	adds r0, #8
	cmp r2, r0
	bhs _08080070
	movs r0, #2
	b _08080076
	.align 2, 0
_08080068: .4byte 0x02031F44
_0808006C: .4byte 0x0830F8D7
_08080070:
	movs r0, #1
	b _08080076
_08080074:
	movs r0, #0
_08080076:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0808002C

	thumb_func_start Blender_SetOpponentsBerryData
Blender_SetOpponentsBerryData: @ 0x0808007C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r6, #0
	cmp r5, #0xaf
	bne _080800B4
	movs r4, #0
	subs r7, r1, #1
	adds r2, #9
_08080098:
	adds r0, r2, r6
	adds r1, r2, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080800A6
	adds r6, r4, #0
_080800A6:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08080098
	adds r0, r6, #5
	b _080800CC
_080800B4:
	adds r0, r5, #0
	subs r0, #0x85
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	subs r7, r1, #1
	cmp r6, #4
	bls _080800D0
	adds r0, r6, #0
	movs r1, #5
	bl __umodsi3
	adds r0, #5
_080800CC:
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080800D0:
	movs r4, #0
	cmp r4, r7
	bge _0808013C
	ldr r0, _08080148
	mov sb, r0
	adds r0, r5, #0
	subs r0, #0xa3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_080800E4:
	lsls r0, r6, #1
	adds r0, r0, r6
	adds r0, r4, r0
	add r0, sb
	ldrb r5, [r0]
	movs r0, #0xd0
	lsls r0, r0, #2
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08080122
	ldr r0, _0808014C
	ldrh r0, [r0]
	cmp r0, #1
	bne _08080122
	adds r0, r6, #0
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08080150
	adds r0, r6, r0
	ldrb r5, [r0]
	mov r0, r8
	cmp r0, #4
	bhi _08080122
	subs r0, r5, #5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08080122:
	adds r4, #1
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	adds r1, #0x85
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Blender_SetParticipantBerryData
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, r7
	blt _080800E4
_0808013C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080148: .4byte 0x0830FB90
_0808014C: .4byte 0x02037280
_08080150: .4byte 0x0830FBAE
	thumb_func_end Blender_SetOpponentsBerryData

	thumb_func_start sub_08080154
sub_08080154: @ 0x08080154
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _080801BC
	movs r6, #0xff
	ldr r5, _080801C0
_0808015E:
	ldr r3, [r7]
	lsls r2, r4, #1
	adds r0, r3, #0
	adds r0, #0x96
	adds r0, r0, r2
	strh r6, [r0]
	adds r1, r3, #0
	adds r1, #0x8e
	adds r1, r1, r2
	adds r0, r3, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, r0, r5
	ldrb r0, [r0]
	strh r0, [r1]
	adds r4, #1
	cmp r4, #3
	ble _0808015E
	movs r3, #0
	ldr r7, _080801BC
_0808018C:
	movs r4, #0
	adds r6, r3, #1
	lsls r5, r3, #1
_08080192:
	ldr r2, [r7]
	lsls r0, r4, #1
	adds r1, r2, #0
	adds r1, #0x8e
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, r3
	bne _080801AA
	adds r0, r2, #0
	adds r0, #0x96
	adds r0, r0, r5
	strh r4, [r0]
_080801AA:
	adds r4, #1
	cmp r4, #3
	ble _08080192
	adds r3, r6, #0
	cmp r3, #3
	ble _0808018C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080801BC: .4byte 0x02031F44
_080801C0: .4byte 0x0830F8C0
	thumb_func_end sub_08080154

	thumb_func_start Blender_PrintPlayerNames
Blender_PrintPlayerNames: @ 0x080801C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, _0808029C
	ldrb r0, [r0]
	cmp r0, #0
	beq _080801E6
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
_080801E6:
	movs r7, #0
	ldr r6, _080802A0
	ldr r1, _080802A4
	mov sl, r1
	movs r2, #0
	mov r8, r2
_080801F2:
	ldr r2, [r6]
	lsls r4, r7, #1
	adds r0, r2, #0
	adds r0, #0x8e
	adds r3, r0, r4
	ldrh r0, [r3]
	cmp r0, #0xff
	beq _080802D2
	adds r1, r2, #0
	adds r1, #0x50
	ldrh r3, [r3]
	adds r1, r1, r3
	adds r0, r2, #0
	adds r0, #0x54
	adds r0, r0, r7
	ldrb r0, [r0]
	movs r2, #0
	mov sb, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x8e
	adds r1, r1, r4
	adds r0, #0x50
	ldrh r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080802A8
	adds r0, r0, r1
	mov r1, r8
	lsrs r5, r1, #0x18
	adds r1, r5, #0
	bl StartSpriteAnim
	add r1, sp, #8
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x8e
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	add r1, sl
	add r0, sp, #8
	bl StringCopy
	ldr r0, [r6]
	adds r0, #0x8e
	adds r0, r0, r4
	ldrh r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #7
	subs r1, r1, r0
	ldr r0, [r6]
	adds r0, #0x8e
	adds r0, r0, r4
	mov r4, r8
	ldr r2, [sp, #0x1c]
	ldrh r0, [r0]
	cmp r2, r0
	bne _080802AC
	lsls r2, r1, #0x1a
	lsrs r2, r2, #0x18
	mov r0, sb
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	add r1, sp, #8
	movs r3, #1
	bl Blender_AddTextPrinter
	b _080802C2
	.align 2, 0
_0808029C: .4byte 0x030031C4
_080802A0: .4byte 0x02031F44
_080802A4: .4byte 0x020226A8
_080802A8: .4byte 0x020205AC
_080802AC:
	lsls r2, r1, #0x1a
	lsrs r2, r2, #0x18
	mov r1, sb
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	add r1, sp, #8
	movs r3, #1
	bl Blender_AddTextPrinter
_080802C2:
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
_080802D2:
	movs r2, #0x80
	lsls r2, r2, #0x11
	add r8, r2
	adds r7, #1
	cmp r7, #3
	ble _080801F2
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Blender_PrintPlayerNames

	thumb_func_start sub_080802F0
sub_080802F0: @ 0x080802F0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _0808030C
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x15
	bls _08080302
	b _080807CA
_08080302:
	lsls r0, r0, #2
	ldr r1, _08080310
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808030C: .4byte 0x02031F44
_08080310: .4byte 0x08080314
_08080314: @ jump table
	.4byte _0808036C @ case 0
	.4byte _08080400 @ case 1
	.4byte _08080420 @ case 2
	.4byte _08080474 @ case 3
	.4byte _080804A0 @ case 4
	.4byte _080807CA @ case 5
	.4byte _080807CA @ case 6
	.4byte _080807CA @ case 7
	.4byte _080804D8 @ case 8
	.4byte _080807CA @ case 9
	.4byte _080807CA @ case 10
	.4byte _08080508 @ case 11
	.4byte _08080558 @ case 12
	.4byte _080805CC @ case 13
	.4byte _080805F8 @ case 14
	.4byte _08080694 @ case 15
	.4byte _080806BC @ case 16
	.4byte _080807CA @ case 17
	.4byte _080806CA @ case 18
	.4byte _080806CA @ case 19
	.4byte _080806CA @ case 20
	.4byte _080806E0 @ case 21
_0808036C:
	bl sub_0800AF94
	bl sub_0807FF90
	ldr r4, _080803F0
	ldrh r1, [r4]
	movs r0, #0
	bl Blender_SetParticipantBerryData
	ldr r5, _080803F4
	ldr r0, [r5]
	movs r6, #0xac
	lsls r6, r6, #1
	adds r0, r0, r6
	ldrh r1, [r4]
	bl Blender_CopyBerryData
	ldrh r0, [r4]
	ldr r2, [r5]
	adds r1, r2, #0
	adds r1, #0x7c
	ldrb r1, [r1]
	adds r2, r2, r6
	bl Blender_SetOpponentsBerryData
	movs r4, #0
	movs r6, #0
	ldr r0, _080803F8
	mov ip, r0
	movs r7, #0x92
	lsls r7, r7, #1
_080803AA:
	ldr r0, [r5]
	lsls r1, r4, #1
	adds r0, #0x64
	adds r0, r0, r1
	strh r6, [r0]
	adds r3, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #1
	movs r2, #2
_080803BC:
	ldr r0, [r5]
	adds r0, r0, r7
	adds r0, r0, r1
	strh r6, [r0]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080803BC
	adds r4, r3, #0
	cmp r4, #3
	ble _080803AA
	ldr r4, _080803F4
	ldr r3, [r4]
	adds r1, r3, #0
	adds r1, #0x70
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	strb r2, [r3, #1]
	ldr r1, _080803FC
	adds r0, r1, #0
	mov r2, ip
	strh r0, [r2]
	ldr r1, [r4]
	b _080806CE
	.align 2, 0
_080803F0: .4byte 0x0203CB48
_080803F4: .4byte 0x02031F44
_080803F8: .4byte 0x0202267E
_080803FC: .4byte 0x00004422
_08080400:
	bl LoadBerryBlenderGfx
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808040C
	b _080807CA
_0808040C:
	ldr r0, _0808041C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_08082744
	b _080807CA
	.align 2, 0
_0808041C: .4byte 0x02031F44
_08080420:
	movs r4, #0
	ldr r5, _08080464
	ldr r6, _08080468
_08080426:
	ldrb r1, [r5]
	ldrb r2, [r5, #1]
	ldr r0, _0808046C
	movs r3, #1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, #0x54
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x54
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08080470
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _08080426
	b _080806CA
	.align 2, 0
_08080464: .4byte 0x0830F8B8
_08080468: .4byte 0x02031F44
_0808046C: .4byte 0x0830F9C8
_08080470: .4byte 0x020205AC
_08080474:
	movs r0, #1
	rsbs r0, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r2, _0808049C
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r0, r0, r3
	str r4, [r0]
	b _080807CA
	.align 2, 0
_0808049C: .4byte 0x02031F44
_080804A0:
	ldr r4, _080804D0
	ldr r1, [r4]
	movs r5, #0x84
	lsls r5, r5, #1
	adds r1, r1, r5
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #2
	bne _080804B8
	bl sub_0807F408
_080804B8:
	ldr r0, _080804D4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080804C6
	b _080807CA
_080804C6:
	ldr r1, [r4]
	movs r0, #8
	strb r0, [r1]
	b _080807CA
	.align 2, 0
_080804D0: .4byte 0x02031F44
_080804D4: .4byte 0x02037C74
_080804D8:
	ldr r2, _080804F0
	ldr r1, [r2]
	movs r3, #0
	movs r0, #0xb
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r0, r0, r1
	strb r3, [r0]
	b _080807CA
	.align 2, 0
_080804F0: .4byte 0x02031F44
_080804F4:
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl sub_0807F7C8
	b _08080532
_08080508:
	movs r4, #0
	ldr r2, _08080550
	ldr r0, _08080554
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #2
	movs r5, #0x8a
	lsls r5, r5, #1
	adds r1, r3, r5
	ldrb r1, [r1]
	adds r0, r0, r2
_08080524:
	ldrb r2, [r0]
	cmp r1, r2
	beq _080804F4
	adds r0, #1
	adds r4, #1
	cmp r4, #3
	ble _08080524
_08080532:
	ldr r3, _08080554
	ldr r1, [r3]
	movs r5, #0x84
	lsls r5, r5, #1
	adds r2, r1, r5
	movs r0, #0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r3]
	movs r0, #0x8a
	lsls r0, r0, #1
	adds r1, r1, r0
	b _080806CE
	.align 2, 0
_08080550: .4byte 0x0830F8C0
_08080554: .4byte 0x02031F44
_08080558:
	ldr r3, [r2]
	movs r2, #0x84
	lsls r2, r2, #1
	adds r1, r3, r2
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3c
	bgt _0808056C
	b _080807CA
_0808056C:
	movs r5, #0x8a
	lsls r5, r5, #1
	adds r0, r3, r5
	adds r4, r3, #0
	adds r4, #0x7c
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r0, r1
	blo _080805B0
	ldr r2, _080805A4
	ldr r1, _080805A8
	ldrb r0, [r4]
	subs r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r2, _080805AC
	adds r1, r2, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x4a
	strh r1, [r0]
	ldrb r0, [r3]
	adds r0, #1
	b _080805B4
	.align 2, 0
_080805A4: .4byte 0x0830F8CC
_080805A8: .4byte 0x0830F8D4
_080805AC: .4byte 0xFFFFA800
_080805B0:
	ldrb r0, [r3]
	subs r0, #1
_080805B4:
	strb r0, [r3]
	ldr r0, _080805C8
	ldr r0, [r0]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r0, r0, r3
	movs r1, #0
	str r1, [r0]
	b _080807CA
	.align 2, 0
_080805C8: .4byte 0x02031F44
_080805CC:
	ldr r4, _080805F4
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_08080154
	movs r0, #0x2b
	bl PlaySE
	ldr r0, [r4]
	movs r5, #0xa0
	lsls r5, r5, #1
	adds r0, r0, r5
	bl sub_080826D0
	movs r0, #2
	bl ShowBg
	b _080807CA
	.align 2, 0
_080805F4: .4byte 0x02031F44
_080805F8:
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl SetGpuRegBits
	ldr r4, _08080688
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x4a
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r5, [r1]
	adds r0, r0, r5
	strh r0, [r1]
	movs r0, #0x8d
	lsls r0, r0, #1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08080678
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, [r4]
	movs r2, #0x8d
	lsls r2, r2, #1
	adds r1, r3, r2
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r2, _0808068C
	ldr r1, _08080690
	adds r0, r3, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	subs r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x4a
	strh r1, [r0]
	movs r0, #0xc
	movs r1, #2
	bl SetGpuRegBits
	ldr r0, [r4]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r0, r0, r3
	movs r1, #0
	str r1, [r0]
	movs r0, #0x34
	bl PlaySE
	bl Blender_PrintPlayerNames
_08080678:
	ldr r0, [r4]
	movs r5, #0xa0
	lsls r5, r5, #1
	adds r0, r0, r5
	bl sub_080826D0
	b _080807CA
	.align 2, 0
_08080688: .4byte 0x02031F44
_0808068C: .4byte 0x0830F8CC
_08080690: .4byte 0x0830F8D4
_08080694:
	bl sub_08082D9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080806A8
	ldr r0, _080806B8
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080806A8:
	ldr r0, _080806B8
	ldr r0, [r0]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	bl sub_080826D0
	b _080807CA
	.align 2, 0
_080806B8: .4byte 0x02031F44
_080806BC:
	ldr r0, _080806D8
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r1, #0x78
	movs r3, #3
	bl CreateSprite
_080806CA:
	ldr r0, _080806DC
	ldr r1, [r0]
_080806CE:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080807CA
	.align 2, 0
_080806D8: .4byte 0x0830FB1C
_080806DC: .4byte 0x02031F44
_080806E0:
	bl sub_08080814
	ldr r5, _08080738
	ldr r4, [r5]
	adds r1, r4, #0
	adds r1, #0x4c
	movs r3, #0
	movs r2, #0
	movs r0, #0x80
	strh r0, [r1]
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r4, r1
	str r2, [r0]
	ldr r2, _0808073C
	adds r0, r4, r2
	strb r3, [r0]
	ldr r0, [r5]
	adds r0, #0x72
	strb r3, [r0]
	ldr r0, _08080740
	bl SetMainCallback2
	ldr r0, _08080744
	ldrh r0, [r0]
	cmp r0, #1
	bne _08080760
	movs r0, #0xd0
	lsls r0, r0, #2
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808074C
	ldr r0, _08080748
	movs r1, #0xa
	bl CreateTask
	ldr r1, [r5]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r1, r1, r3
	b _0808075E
	.align 2, 0
_08080738: .4byte 0x02031F44
_0808073C: .4byte 0x00000123
_08080740: .4byte 0x080812B5
_08080744: .4byte 0x02037280
_08080748: .4byte 0x08080C41
_0808074C:
	ldr r0, _08080804
	ldr r0, [r0]
	movs r1, #0xa
	bl CreateTask
	ldr r1, [r5]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r1, r1, r5
_0808075E:
	strb r0, [r1]
_08080760:
	ldr r1, _08080808
	ldrh r0, [r1]
	cmp r0, #1
	bls _0808079C
	movs r4, #0
	ldrh r1, [r1]
	cmp r4, r1
	bge _0808079C
	movs r5, #0xa0
	lsls r5, r5, #0x14
	ldr r6, _08080804
_08080776:
	ldm r6!, {r0}
	lsrs r1, r5, #0x18
	bl CreateTask
	ldr r1, _0808080C
	ldr r1, [r1]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r1, r2
	adds r1, r1, r4
	strb r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r5, r5, r3
	adds r4, #1
	ldr r0, _08080808
	ldrh r0, [r0]
	cmp r4, r0
	blt _08080776
_0808079C:
	bl GetCurrentMapMusic
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08080810
	cmp r0, r4
	beq _080807BA
	bl GetCurrentMapMusic
	ldr r1, _0808080C
	ldr r1, [r1]
	movs r5, #0xaa
	lsls r5, r5, #1
	adds r1, r1, r5
	strh r0, [r1]
_080807BA:
	adds r0, r4, #0
	bl PlayBGM
	movs r0, #0x35
	bl PlaySE
	bl Blender_ControlHitPitch
_080807CA:
	ldr r0, _0808080C
	ldr r1, [r0]
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r1, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r5, #0x8f
	lsls r5, r5, #1
	adds r1, r1, r5
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080804: .4byte 0x0830F8DC
_08080808: .4byte 0x02037280
_0808080C: .4byte 0x02031F44
_08080810: .4byte 0x00000193
	thumb_func_end sub_080802F0

	thumb_func_start sub_08080814
sub_08080814: @ 0x08080814
	push {lr}
	ldr r3, _08080834
	movs r0, #0
	ldr r1, _08080838
	movs r2, #3
_0808081E:
	strh r0, [r3]
	strh r0, [r3, #4]
	strh r0, [r1]
	strh r0, [r1, #4]
	adds r1, #0x10
	subs r2, #1
	cmp r2, #0
	bge _0808081E
	pop {r0}
	bx r0
	.align 2, 0
_08080834: .4byte 0x030031B0
_08080838: .4byte 0x03003130
	thumb_func_end sub_08080814

	thumb_func_start sub_0808083C
sub_0808083C: @ 0x0808083C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _0808087C
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	cmp r0, r1
	ble _08080874
	ldr r0, _08080880
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	lsls r1, r1, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, _08080884
	strh r0, [r1]
	adds r0, r3, #0
	bl DestroyTask
_08080874:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808087C: .4byte 0x03005B60
_08080880: .4byte 0x03003130
_08080884: .4byte 0x00002345
	thumb_func_end sub_0808083C

	thumb_func_start sub_08080888
sub_08080888: @ 0x08080888
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080808B8
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080808BC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xa]
	strh r5, [r1, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080808B8: .4byte 0x0808083D
_080808BC: .4byte 0x03005B60
	thumb_func_end sub_08080888

	thumb_func_start sub_080808C0
sub_080808C0: @ 0x080808C0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _0808092C
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	movs r1, #1
	bl sub_0808002C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080808DE
	b _080809D4
_080808DE:
	ldr r2, _08080930
	lsls r1, r5, #2
	adds r0, r1, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r6, r1, #0
	cmp r0, #0
	beq _080808F4
	b _080809E2
_080808F4:
	ldr r0, [r4]
	ldr r1, _08080934
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080809B6
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08080938
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r3, r1, #0
	ldr r0, [r4]
	adds r0, #0x4c
	movs r4, #0
	ldrsh r2, [r0, r4]
	ldr r0, _0808093C
	cmp r2, r0
	bgt _0808095C
	cmp r1, #0x4b
	bls _08080948
	ldr r1, _08080940
	ldr r0, _08080944
	b _0808094C
	.align 2, 0
_0808092C: .4byte 0x02031F44
_08080930: .4byte 0x03005B60
_08080934: .4byte 0x00000123
_08080938: .4byte 0x0000028F
_0808093C: .4byte 0x000001F3
_08080940: .4byte 0x03003130
_08080944: .4byte 0x00004523
_08080948:
	ldr r1, _08080954
	ldr r0, _08080958
_0808094C:
	strh r0, [r1, #0x14]
	ldr r0, _08080958
	b _080809BA
	.align 2, 0
_08080954: .4byte 0x03003130
_08080958: .4byte 0x00005432
_0808095C:
	ldr r0, _08080978
	cmp r2, r0
	bgt _0808098A
	cmp r1, #0x50
	bhi _080809B6
	adds r0, r1, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bhi _08080984
	ldr r1, _0808097C
	ldr r0, _08080980
	b _080809BA
	.align 2, 0
_08080978: .4byte 0x000005DB
_0808097C: .4byte 0x03003130
_08080980: .4byte 0x00005432
_08080984:
	cmp r1, #9
	bhi _080809BC
	b _080809AC
_0808098A:
	cmp r1, #0x5a
	bhi _080809B6
	adds r0, r1, #0
	subs r0, #0x47
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _080809A8
	ldr r1, _080809A0
	ldr r0, _080809A4
	b _080809BA
	.align 2, 0
_080809A0: .4byte 0x03003130
_080809A4: .4byte 0x00005432
_080809A8:
	cmp r3, #0x1d
	bhi _080809BC
_080809AC:
	movs r0, #1
	movs r1, #5
	bl sub_08080888
	b _080809BC
_080809B6:
	ldr r1, _080809C8
	ldr r0, _080809CC
_080809BA:
	strh r0, [r1, #0x14]
_080809BC:
	ldr r0, _080809D0
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	b _080809E0
	.align 2, 0
_080809C8: .4byte 0x03003130
_080809CC: .4byte 0x00004523
_080809D0: .4byte 0x03005B60
_080809D4:
	ldr r0, _080809E8
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
_080809E0:
	strh r0, [r1, #8]
_080809E2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080809E8: .4byte 0x03005B60
	thumb_func_end sub_080808C0

	thumb_func_start sub_080809EC
sub_080809EC: @ 0x080809EC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08080A70
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _08080A74
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x9a
	ldrb r1, [r1]
	lsrs r2, r0, #8
	ldr r0, _08080A78
	adds r1, r1, r0
	ldrb r1, [r1]
	adds r0, r1, #0
	adds r0, #0x14
	cmp r2, r0
	bls _08080AFC
	adds r0, #0x14
	cmp r2, r0
	bhs _08080AFC
	ldr r2, _08080A7C
	lsls r1, r4, #2
	adds r0, r1, r4
	lsls r0, r0, #3
	adds r2, r0, r2
	movs r5, #8
	ldrsh r0, [r2, r5]
	adds r5, r1, #0
	cmp r0, #0
	bne _08080B0A
	ldr r1, _08080A80
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08080AE8
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08080A84
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, r2, #0
	ldr r0, [r6]
	adds r0, #0x4c
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08080A88
	cmp r1, r0
	bgt _08080AA4
	cmp r2, #0x42
	bls _08080A94
	ldr r1, _08080A8C
	ldr r0, _08080A90
	strh r0, [r1, #0x24]
	b _08080ACC
	.align 2, 0
_08080A70: .4byte 0x02031F44
_08080A74: .4byte 0x0000FFFF
_08080A78: .4byte 0x0830F8D7
_08080A7C: .4byte 0x03005B60
_08080A80: .4byte 0x00000123
_08080A84: .4byte 0x0000028F
_08080A88: .4byte 0x000001F3
_08080A8C: .4byte 0x03003130
_08080A90: .4byte 0x00004523
_08080A94:
	ldr r1, _08080A9C
	ldr r0, _08080AA0
	strh r0, [r1, #0x24]
	b _08080ACC
	.align 2, 0
_08080A9C: .4byte 0x03003130
_08080AA0: .4byte 0x00005432
_08080AA4:
	cmp r2, #0x41
	bls _08080AAE
	ldr r1, _08080AD8
	ldr r0, _08080ADC
	strh r0, [r1, #0x24]
_08080AAE:
	adds r0, r2, #0
	subs r0, #0x29
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x18
	bhi _08080AC0
	ldr r1, _08080AD8
	ldr r0, _08080AE0
	strh r0, [r1, #0x24]
_08080AC0:
	cmp r3, #9
	bhi _08080ACC
	movs r0, #2
	movs r1, #5
	bl sub_08080888
_08080ACC:
	ldr r0, _08080AE4
	adds r1, r5, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	b _08080B08
	.align 2, 0
_08080AD8: .4byte 0x03003130
_08080ADC: .4byte 0x00004523
_08080AE0: .4byte 0x00005432
_08080AE4: .4byte 0x03005B60
_08080AE8:
	ldr r0, _08080AF4
	ldr r1, _08080AF8
	strh r1, [r0, #0x24]
	movs r0, #1
	strh r0, [r2, #8]
	b _08080B0A
	.align 2, 0
_08080AF4: .4byte 0x03003130
_08080AF8: .4byte 0x00004523
_08080AFC:
	ldr r0, _08080B10
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
_08080B08:
	strh r0, [r1, #8]
_08080B0A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080B10: .4byte 0x03005B60
	thumb_func_end sub_080809EC

	thumb_func_start sub_08080B14
sub_08080B14: @ 0x08080B14
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _08080B94
	ldr r3, [r5]
	adds r0, r3, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _08080B98
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x9c
	ldrb r1, [r1]
	lsrs r2, r0, #8
	ldr r0, _08080B9C
	adds r1, r1, r0
	ldrb r1, [r1]
	adds r0, r1, #0
	adds r0, #0x14
	cmp r2, r0
	bls _08080C28
	adds r0, #0x14
	cmp r2, r0
	bhs _08080C28
	ldr r2, _08080BA0
	lsls r1, r4, #2
	adds r0, r1, r4
	lsls r0, r0, #3
	adds r2, r0, r2
	movs r6, #8
	ldrsh r0, [r2, r6]
	adds r6, r1, #0
	cmp r0, #0
	bne _08080C36
	ldr r1, _08080BA4
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08080C14
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08080BA8
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r5]
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08080BAC
	cmp r1, r0
	bgt _08080BC8
	cmp r2, #0x58
	bls _08080BB8
	ldr r1, _08080BB0
	ldr r0, _08080BB4
	strh r0, [r1, #0x34]
	b _08080BFA
	.align 2, 0
_08080B94: .4byte 0x02031F44
_08080B98: .4byte 0x0000FFFF
_08080B9C: .4byte 0x0830F8D7
_08080BA0: .4byte 0x03005B60
_08080BA4: .4byte 0x00000123
_08080BA8: .4byte 0x0000028F
_08080BAC: .4byte 0x000001F3
_08080BB0: .4byte 0x03003130
_08080BB4: .4byte 0x00004523
_08080BB8:
	ldr r1, _08080BC0
	ldr r0, _08080BC4
	strh r0, [r1, #0x34]
	b _08080BFA
	.align 2, 0
_08080BC0: .4byte 0x03003130
_08080BC4: .4byte 0x00005432
_08080BC8:
	cmp r2, #0x3c
	bls _08080BDC
	ldr r1, _08080BD4
	ldr r0, _08080BD8
	b _08080BEC
	.align 2, 0
_08080BD4: .4byte 0x03003130
_08080BD8: .4byte 0x00004523
_08080BDC:
	adds r0, r2, #0
	subs r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _08080BEE
	ldr r1, _08080C08
	ldr r0, _08080C0C
_08080BEC:
	strh r0, [r1, #0x34]
_08080BEE:
	cmp r2, #4
	bhi _08080BFA
	movs r0, #3
	movs r1, #5
	bl sub_08080888
_08080BFA:
	ldr r0, _08080C10
	adds r1, r6, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	b _08080C34
	.align 2, 0
_08080C08: .4byte 0x03003130
_08080C0C: .4byte 0x00005432
_08080C10: .4byte 0x03005B60
_08080C14:
	ldr r0, _08080C20
	ldr r1, _08080C24
	strh r1, [r0, #0x34]
	movs r0, #1
	strh r0, [r2, #8]
	b _08080C36
	.align 2, 0
_08080C20: .4byte 0x03003130
_08080C24: .4byte 0x00004523
_08080C28:
	ldr r0, _08080C3C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
_08080C34:
	strh r0, [r1, #8]
_08080C36:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080C3C: .4byte 0x03005B60
	thumb_func_end sub_08080B14

	thumb_func_start sub_08080C40
sub_08080C40: @ 0x08080C40
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08080C7C
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	movs r1, #1
	bl sub_0808002C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08080C8C
	ldr r0, _08080C80
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r2, r1, r0
	movs r1, #8
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _08080C9A
	ldr r0, _08080C84
	ldr r1, _08080C88
	strh r1, [r0, #0x14]
	movs r0, #1
	strh r0, [r2, #8]
	b _08080C9A
	.align 2, 0
_08080C7C: .4byte 0x02031F44
_08080C80: .4byte 0x03005B60
_08080C84: .4byte 0x03003130
_08080C88: .4byte 0x00004523
_08080C8C:
	ldr r0, _08080CA0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1, #8]
_08080C9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080CA0: .4byte 0x03005B60
	thumb_func_end sub_08080C40

	thumb_func_start sub_08080CA4
sub_08080CA4: @ 0x08080CA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r8, r7
	lsls r1, r1, #0x18
	ldr r0, _08080D18
	ldr r4, _08080D1C
	lsrs r1, r1, #0x17
	adds r2, r1, r4
	ldrb r6, [r2]
	ldr r5, _08080D20
	adds r2, r1, r5
	movs r3, #0
	ldrsb r3, [r2, r3]
	lsls r2, r3, #2
	adds r2, r2, r3
	lsls r2, r2, #1
	subs r6, r6, r2
	adds r4, #1
	adds r4, r1, r4
	ldrb r2, [r4]
	adds r5, #1
	adds r1, r1, r5
	movs r3, #0
	ldrsb r3, [r1, r3]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #1
	subs r2, r2, r1
	adds r1, r6, #0
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	ldr r0, _08080D24
	cmp r7, r0
	bne _08080D30
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	ldr r5, _08080D28
	adds r0, r4, r5
	movs r1, #2
	bl StartSpriteAnim
	adds r5, #0x1c
	adds r4, r4, r5
	ldr r0, _08080D2C
	str r0, [r4]
	movs r0, #0x28
	bl PlaySE
	b _08080D74
	.align 2, 0
_08080D18: .4byte 0x0830FA30
_08080D1C: .4byte 0x0830F8B8
_08080D20: .4byte 0x0830F8B0
_08080D24: .4byte 0x00004523
_08080D28: .4byte 0x020205AC
_08080D2C: .4byte 0x080829B9
_08080D30:
	ldr r0, _08080D50
	cmp r7, r0
	bne _08080D58
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08080D54
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAnim
	movs r0, #0x1f
	bl PlaySE
	b _08080D74
	.align 2, 0
_08080D50: .4byte 0x00005432
_08080D54: .4byte 0x020205AC
_08080D58:
	ldr r0, _08080D84
	cmp r8, r0
	bne _08080D74
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _08080D88
	adds r0, r0, r1
	movs r1, #1
	bl StartSpriteAnim
	movs r0, #0x20
	bl PlaySE
_08080D74:
	bl sub_080828A0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080D84: .4byte 0x00002345
_08080D88: .4byte 0x020205AC
	thumb_func_end sub_08080CA4

	thumb_func_start sub_08080D8C
sub_08080D8C: @ 0x08080D8C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	bl Blender_ControlHitPitch
	ldr r0, _08080DAC
	cmp r4, r0
	beq _08080DC0
	cmp r4, r0
	bgt _08080DB4
	ldr r0, _08080DB0
	cmp r4, r0
	beq _08080E90
	b _08080EBC
	.align 2, 0
_08080DAC: .4byte 0x00004523
_08080DB0: .4byte 0x00002345
_08080DB4:
	ldr r0, _08080DBC
	cmp r5, r0
	beq _08080E58
	b _08080EBC
	.align 2, 0
_08080DBC: .4byte 0x00005432
_08080DC0:
	ldr r7, _08080DF0
	ldr r4, [r7]
	adds r5, r4, #0
	adds r5, #0x4c
	ldrh r6, [r5]
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, _08080DF4
	cmp r1, r0
	bgt _08080DFC
	ldr r1, _08080DF8
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	bl __divsi3
	adds r0, r6, r0
	strh r0, [r5]
	b _08080EBC
	.align 2, 0
_08080DF0: .4byte 0x02031F44
_08080DF4: .4byte 0x000005DB
_08080DF8: .4byte 0x0830FBB3
_08080DFC:
	ldr r1, _08080E54
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	bl __divsi3
	adds r0, r6, r0
	strh r0, [r5]
	movs r1, #0x8e
	lsls r1, r1, #1
	adds r4, r4, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0x64
	bl __divsi3
	adds r1, r0, #0
	subs r1, #0xa
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08082CD8
	ldr r0, [r7]
	movs r1, #0x8f
	lsls r1, r1, #1
	adds r4, r0, r1
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x64
	bl __divsi3
	adds r1, r0, #0
	subs r1, #0xa
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08082CD8
	b _08080EBC
	.align 2, 0
_08080E54: .4byte 0x0830FBB3
_08080E58:
	ldr r0, _08080E84
	ldr r2, [r0]
	adds r4, r2, #0
	adds r4, #0x4c
	ldrh r5, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, _08080E88
	cmp r1, r0
	bgt _08080EBC
	ldr r1, _08080E8C
	adds r0, r2, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	bl __divsi3
	adds r0, r5, r0
	b _08080EBA
	.align 2, 0
_08080E84: .4byte 0x02031F44
_08080E88: .4byte 0x000005DB
_08080E8C: .4byte 0x0830FBB3
_08080E90:
	ldr r0, _08080EC4
	ldr r0, [r0]
	adds r4, r0, #0
	adds r4, #0x4c
	ldr r1, _08080EC8
	adds r0, #0x7c
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	bl __divsi3
	ldrh r1, [r4]
	subs r1, r1, r0
	strh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7f
	bgt _08080EBC
	movs r0, #0x80
_08080EBA:
	strh r0, [r4]
_08080EBC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080EC4: .4byte 0x02031F44
_08080EC8: .4byte 0x0830FBB3
	thumb_func_end sub_08080D8C

	thumb_func_start sub_08080ECC
sub_08080ECC: @ 0x08080ECC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08080EF8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08080F00
	ldr r0, _08080EFC
	ldrb r0, [r0]
	cmp r0, #0
	beq _08080F00
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, r2
	bne _08080F08
	movs r0, #1
	b _08080F0A
	.align 2, 0
_08080EF8: .4byte 0x030031C4
_08080EFC: .4byte 0x0300319C
_08080F00:
	cmp r3, r1
	bne _08080F08
	movs r0, #1
	b _08080F0A
_08080F08:
	movs r0, #0
_08080F0A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08080ECC

	thumb_func_start sub_08080F10
sub_08080F10: @ 0x08080F10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08080FF0
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080F58
	ldr r3, _08080FF4
	ldrh r0, [r3, #4]
	ldr r2, _08080FF8
	cmp r0, #0
	beq _08080F38
	movs r1, #0
	strh r0, [r2, #4]
	ldr r0, _08080FFC
	strh r0, [r2]
	strh r1, [r3, #4]
_08080F38:
	ldr r0, _08080FF8
	ldr r3, _08080FFC
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, r0, #0
	adds r2, #0x14
	movs r7, #2
_08080F46:
	ldrh r0, [r2]
	cmp r0, #0
	beq _08080F4E
	strh r3, [r1]
_08080F4E:
	adds r1, #0x10
	adds r2, #0x10
	subs r7, #1
	cmp r7, #0
	bge _08080F46
_08080F58:
	movs r7, #0
	ldr r1, _08081000
	ldr r0, [r1]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r7, r0
	blt _08080F68
	b _08081112
_08080F68:
	ldr r0, _08080FF8
	adds r2, r0, #0
	adds r2, #0x20
	str r2, [sp]
	movs r1, #0
	mov sb, r1
	movs r2, #0
	str r2, [sp, #4]
	mov r8, r0
	ldr r0, _08081004
	mov sl, r0
_08080F7E:
	mov r1, r8
	ldrh r0, [r1]
	ldr r1, _08080FFC
	movs r2, #0x88
	lsls r2, r2, #7
	bl sub_08080ECC
	cmp r0, #0
	bne _08080F92
	b _080810EE
_08080F92:
	ldr r6, _08081000
	ldr r0, [r6]
	adds r0, #0x96
	ldr r2, [sp, #4]
	adds r0, r0, r2
	ldrh r5, [r0]
	mov r0, r8
	ldrh r4, [r0, #4]
	ldr r1, _08081008
	cmp r4, r1
	bne _08081010
	adds r0, r1, #0
	bl sub_08080D8C
	ldr r0, [r6]
	movs r2, #0x8b
	lsls r2, r2, #1
	adds r4, r0, r2
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x37
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r1, r0
	strh r1, [r4]
	lsls r1, r1, #0x10
	ldr r0, _0808100C
	cmp r1, r0
	bls _08080FD6
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r4]
_08080FD6:
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _08081008
	bl sub_08080CA4
	ldr r1, [r6]
	movs r2, #0x92
	lsls r2, r2, #1
	adds r1, r1, r2
	add r1, sb
	ldrh r0, [r1]
	adds r0, #1
	b _0808107A
	.align 2, 0
_08080FF0: .4byte 0x02037280
_08080FF4: .4byte 0x030031B0
_08080FF8: .4byte 0x03003130
_08080FFC: .4byte 0x00004444
_08081000: .4byte 0x02031F44
_08081004: .4byte 0x00005432
_08081008: .4byte 0x00004523
_0808100C: .4byte 0x03E70000
_08081010:
	cmp r4, sl
	bne _0808104E
	mov r0, sl
	bl sub_08080D8C
	ldr r0, [r6]
	movs r1, #0x8b
	lsls r1, r1, #1
	adds r4, r0, r1
	adds r0, #0x4c
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r1, #0x46
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r1, r0
	strh r1, [r4]
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	mov r0, sl
	bl sub_08080CA4
	ldr r1, [r6]
	movs r0, #0x93
	lsls r0, r0, #1
	adds r1, r1, r0
	add r1, sb
	ldrh r0, [r1]
	adds r0, #1
	b _0808107A
_0808104E:
	ldr r0, _080810C8
	cmp r4, r0
	bne _08081086
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_08080CA4
	adds r0, r4, #0
	bl sub_08080D8C
	ldr r0, [r6]
	movs r1, #0x94
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r2, sb
	adds r1, r0, r2
	ldrh r2, [r1]
	ldr r0, _080810CC
	cmp r2, r0
	bhi _0808107C
	adds r0, r2, #1
_0808107A:
	strh r0, [r1]
_0808107C:
	mov r0, r8
	ldrh r1, [r0, #4]
	ldr r0, _080810C8
	cmp r1, r0
	beq _08081094
_08081086:
	ldr r1, [sp]
	ldrh r0, [r1]
	ldr r2, _080810D0
	cmp r0, r2
	beq _08081094
	cmp r0, sl
	bne _080810EE
_08081094:
	ldr r0, _080810D4
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x4c
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, _080810D8
	cmp r1, r0
	ble _080810E4
	adds r0, r1, #0
	ldr r2, _080810DC
	adds r0, r0, r2
	movs r1, #0x14
	bl __divsi3
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _080810E0
	bl m4aMPlayTempoControl
	b _080810EE
	.align 2, 0
_080810C8: .4byte 0x00002345
_080810CC: .4byte 0x000003E6
_080810D0: .4byte 0x00004523
_080810D4: .4byte 0x02031F44
_080810D8: .4byte 0x000005DC
_080810DC: .4byte 0xFFFFFD12
_080810E0: .4byte 0x030074D0
_080810E4:
	ldr r0, _08081150
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
_080810EE:
	ldr r1, [sp]
	adds r1, #2
	str r1, [sp]
	movs r2, #6
	add sb, r2
	ldr r0, [sp, #4]
	adds r0, #2
	str r0, [sp, #4]
	movs r1, #0x10
	add r8, r1
	adds r7, #1
	ldr r0, _08081154
	ldr r0, [r0]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r7, r0
	bge _08081112
	b _08080F7E
_08081112:
	ldr r0, _08081158
	ldrh r0, [r0]
	cmp r0, #0
	beq _0808113E
	movs r7, #0
	ldr r3, _08081154
	ldr r0, [r3]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r7, r0
	bge _0808113E
	movs r2, #0
	ldr r1, _0808115C
_0808112C:
	strh r2, [r1]
	strh r2, [r1, #4]
	adds r1, #0x10
	adds r7, #1
	ldr r0, [r3]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r7, r0
	blt _0808112C
_0808113E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081150: .4byte 0x030074D0
_08081154: .4byte 0x02031F44
_08081158: .4byte 0x02037280
_0808115C: .4byte 0x03003130
	thumb_func_end sub_08080F10

	thumb_func_start sub_08081160
sub_08081160: @ 0x08081160
	push {r4, r5, r6, lr}
	movs r4, #0
	movs r6, #0
	ldr r0, _080811B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08081176
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08081176:
	ldr r3, _080811B4
	ldr r1, [r3]
	lsls r2, r6, #1
	adds r0, r1, #0
	adds r0, #0x96
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #0x63
	ldrb r0, [r1]
	cmp r0, #0
	bne _08081248
	ldr r0, _080811B8
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #2
	bne _080811C4
	ldr r2, _080811BC
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080811D2
	ldrh r2, [r2, #0x28]
	ldr r1, _080811C0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, r1
	beq _080811D2
	b _080811D6
	.align 2, 0
_080811B0: .4byte 0x030031C4
_080811B4: .4byte 0x02031F44
_080811B8: .4byte 0x03005AF0
_080811BC: .4byte 0x03002360
_080811C0: .4byte 0x00000201
_080811C4:
	ldr r0, _08081218
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080811D2
	movs r4, #1
_080811D2:
	cmp r4, #0
	beq _08081248
_080811D6:
	ldr r4, _0808121C
	ldr r1, [r4]
	lsls r2, r5, #1
	adds r0, r1, #0
	adds r0, #0x8e
	adds r0, r0, r2
	adds r1, #0x50
	ldrh r0, [r0]
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08081220
	adds r0, r0, r1
	adds r1, r5, #4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r1, r6, #0
	bl sub_0808002C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808122C
	ldr r1, _08081224
	ldr r0, _08081228
	b _08081244
	.align 2, 0
_08081218: .4byte 0x03002360
_0808121C: .4byte 0x02031F44
_08081220: .4byte 0x020205AC
_08081224: .4byte 0x030031B0
_08081228: .4byte 0x00004523
_0808122C:
	cmp r0, #1
	bne _08081240
	ldr r1, _08081238
	ldr r0, _0808123C
	b _08081244
	.align 2, 0
_08081238: .4byte 0x030031B0
_0808123C: .4byte 0x00005432
_08081240:
	ldr r1, _080812A0
	ldr r0, _080812A4
_08081244:
	strh r0, [r1, #4]
	adds r3, r4, #0
_08081248:
	ldr r1, [r3]
	adds r1, #0x72
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _08081276
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0x80
	ble _0808126E
	subs r0, r2, #1
	strh r0, [r1]
_0808126E:
	ldr r0, [r3]
	adds r0, #0x72
	movs r1, #0
	strb r1, [r0]
_08081276:
	ldr r0, _080812A8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808129A
	ldr r0, _080812AC
	ldrh r1, [r0, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0808129A
	ldr r0, [r3]
	ldr r1, _080812B0
	adds r2, r0, r1
	ldrb r0, [r2]
	movs r1, #1
	eors r0, r1
	strb r0, [r2]
_0808129A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080812A0: .4byte 0x030031B0
_080812A4: .4byte 0x00002345
_080812A8: .4byte 0x02031F75
_080812AC: .4byte 0x03002360
_080812B0: .4byte 0x00000123
	thumb_func_end sub_08081160

	thumb_func_start sub_080812B4
sub_080812B4: @ 0x080812B4
	push {r4, r5, r6, lr}
	bl sub_08082744
	ldr r4, _0808136C
	ldr r0, [r4]
	movs r1, #0x82
	lsls r1, r1, #1
	adds r2, r0, r1
	ldr r1, [r2]
	ldr r0, _08081370
	cmp r1, r0
	bhi _080812D0
	adds r0, r1, #1
	str r0, [r2]
_080812D0:
	bl sub_08081160
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	movs r5, #0x8b
	lsls r5, r5, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	bl SetLinkDebugValues
	bl sub_08080F10
	ldr r0, [r4]
	adds r0, r0, r5
	ldrh r0, [r0]
	movs r6, #0xfa
	lsls r6, r6, #2
	adds r1, r6, #0
	bl sub_08082B5C
	ldr r0, [r4]
	adds r0, #0x4c
	ldrh r0, [r0]
	bl sub_08082C4C
	bl sub_08082D28
	bl sub_080824F0
	ldr r2, [r4]
	adds r3, r2, #0
	adds r3, #0x63
	ldrb r0, [r3]
	cmp r0, #0
	bne _08081336
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r2, r1
	ldrh r1, [r0]
	ldr r0, _08081374
	cmp r1, r0
	bls _08081336
	adds r0, r2, r5
	strh r6, [r0]
	movs r0, #1
	strb r0, [r3]
	ldr r0, _08081378
	bl SetMainCallback2
_08081336:
	ldr r0, _0808136C
	ldr r1, [r0]
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r1, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0x8f
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808136C: .4byte 0x02031F44
_08081370: .4byte 0x00057E03
_08081374: .4byte 0x000003E7
_08081378: .4byte 0x080819E5
	thumb_func_end sub_080812B4

	thumb_func_start Blender_DummiedOutFunc
Blender_DummiedOutFunc: @ 0x0808137C
	bx lr
	.align 2, 0
	thumb_func_end Blender_DummiedOutFunc

	thumb_func_start sub_08081380
sub_08081380: @ 0x08081380
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r1, r1, #0x14
	adds r4, r1, r0
	lsrs r2, r2, #0x14
	adds r5, r2, r0
	ldrh r0, [r4]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080813BE
	adds r0, r4, #2
	adds r1, r5, #2
	bl StringCompare
	cmp r0, #0
	bne _080813CC
	ldr r0, [r4, #8]
	ldr r2, _080813C4
	ands r0, r2
	ldr r1, [r5, #8]
	ands r1, r2
	cmp r0, r1
	bne _080813CC
	ldr r0, [r4, #0xc]
	ldr r2, _080813C8
	ands r0, r2
	ldr r1, [r5, #0xc]
	ands r1, r2
	cmp r0, r1
	bne _080813CC
_080813BE:
	movs r0, #1
	b _080813CE
	.align 2, 0
_080813C4: .4byte 0xFFFFFF00
_080813C8: .4byte 0x00FFFFFF
_080813CC:
	movs r0, #0
_080813CE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08081380

	thumb_func_start Blender_GetPokeblockColor
Blender_GetPokeblockColor: @ 0x080813D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r2, sp
	movs r4, #5
_080813F0:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bge _080813F0
	movs r6, #0
	mov r1, sp
	movs r4, #4
_08081404:
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0808140E
	adds r6, #1
_0808140E:
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bge _08081404
	cmp r6, #5
	beq _08081462
	cmp r3, #3
	bhi _08081462
	movs r4, #0
	ldr r3, [sp, #0x10]
	cmp r4, r3
	bge _0808147A
	mov r3, sl
_08081428:
	movs r6, #0
	ldr r7, [sp, #0x10]
	cmp r6, r7
	bge _08081470
	mov sb, r3
	mov r5, sl
	lsls r0, r4, #0x18
	mov r8, r0
_08081438:
	mov r1, sb
	ldrh r0, [r1]
	ldrh r2, [r5]
	cmp r0, r2
	bne _08081466
	cmp r4, r6
	beq _08081466
	cmp r0, #0xaf
	bne _08081462
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	mov r0, sl
	mov r7, r8
	lsrs r1, r7, #0x18
	str r3, [sp, #0xc]
	bl sub_08081380
	lsls r0, r0, #0x18
	ldr r3, [sp, #0xc]
	cmp r0, #0
	beq _08081466
_08081462:
	movs r0, #0xc
	b _080815BA
_08081466:
	adds r5, #0x10
	adds r6, #1
	ldr r0, [sp, #0x10]
	cmp r6, r0
	blt _08081438
_08081470:
	adds r3, #0x10
	adds r4, #1
	ldr r1, [sp, #0x10]
	cmp r4, r1
	blt _08081428
_0808147A:
	movs r2, #0
	mov r1, sp
	movs r4, #4
_08081480:
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _0808148E
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0808148E:
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bge _08081480
	cmp r2, #3
	bls _0808149E
	movs r0, #0xd
	b _080815BA
_0808149E:
	cmp r2, #3
	bne _080814A6
	movs r0, #0xb
	b _080815BA
_080814A6:
	movs r4, #0
	mov r1, sp
_080814AA:
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r0, #0x32
	ble _080814B4
	b _080815B4
_080814B4:
	adds r1, #2
	adds r4, #1
	cmp r4, #4
	ble _080814AA
	cmp r2, #1
	bne _08081506
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _080814CE
	movs r0, #1
	b _080815BA
_080814CE:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _080814DC
	movs r0, #2
	b _080815BA
_080814DC:
	mov r0, sp
	movs r3, #4
	ldrsh r0, [r0, r3]
	cmp r0, #0
	ble _080814EA
	movs r0, #3
	b _080815BA
_080814EA:
	mov r0, sp
	movs r4, #6
	ldrsh r0, [r0, r4]
	cmp r0, #0
	ble _080814F8
	movs r0, #4
	b _080815BA
_080814F8:
	mov r0, sp
	movs r7, #8
	ldrsh r0, [r0, r7]
	cmp r0, #0
	ble _08081506
	movs r0, #5
	b _080815BA
_08081506:
	cmp r2, #2
	bne _080815B8
	movs r4, #0
	ldr r5, _08081550
	mov r1, sp
	adds r2, r5, #0
_08081512:
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _0808151E
	strh r4, [r2]
	adds r2, #2
_0808151E:
	adds r1, #2
	adds r4, #1
	cmp r4, #4
	ble _08081512
	movs r4, #0
	ldrsh r3, [r5, r4]
	lsls r0, r3, #1
	mov r7, sp
	adds r1, r7, r0
	movs r0, #2
	ldrsh r2, [r5, r0]
	lsls r0, r2, #1
	add r0, sp
	movs r4, #0
	ldrsh r1, [r1, r4]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	blt _08081574
	adds r0, r3, #0
	cmp r0, #0
	bne _08081554
	lsls r0, r2, #0x10
	b _0808157E
	.align 2, 0
_08081550: .4byte 0x03000DF8
_08081554:
	cmp r0, #1
	bne _0808155C
	lsls r0, r2, #0x10
	b _0808158A
_0808155C:
	cmp r0, #2
	bne _08081564
	lsls r0, r2, #0x10
	b _08081596
_08081564:
	cmp r0, #3
	bne _0808156C
	lsls r0, r2, #0x10
	b _080815A2
_0808156C:
	cmp r0, #4
	bne _080815B8
	lsls r0, r2, #0x10
	b _080815AE
_08081574:
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _08081584
	lsls r0, r3, #0x10
_0808157E:
	movs r1, #6
	orrs r0, r1
	b _080815BA
_08081584:
	cmp r0, #1
	bne _08081590
	lsls r0, r3, #0x10
_0808158A:
	movs r1, #7
	orrs r0, r1
	b _080815BA
_08081590:
	cmp r0, #2
	bne _0808159C
	lsls r0, r3, #0x10
_08081596:
	movs r1, #8
	orrs r0, r1
	b _080815BA
_0808159C:
	cmp r0, #3
	bne _080815A8
	lsls r0, r3, #0x10
_080815A2:
	movs r1, #9
	orrs r0, r1
	b _080815BA
_080815A8:
	cmp r0, #4
	bne _080815B8
	lsls r0, r3, #0x10
_080815AE:
	movs r1, #0xa
	orrs r0, r1
	b _080815BA
_080815B4:
	movs r0, #0xe
	b _080815BA
_080815B8:
	movs r0, #0
_080815BA:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Blender_GetPokeblockColor

	thumb_func_start sub_080815CC
sub_080815CC: @ 0x080815CC
	ldr r1, _080815D4
	strh r0, [r1]
	bx lr
	.align 2, 0
_080815D4: .4byte 0x03000E04
	thumb_func_end sub_080815CC

	thumb_func_start sub_080815D8
sub_080815D8: @ 0x080815D8
	ldr r0, _080815E0
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080815E0: .4byte 0x03000E04
	thumb_func_end sub_080815D8

	thumb_func_start sub_080815E4
sub_080815E4: @ 0x080815E4
	ldr r1, _080815EC
	strh r0, [r1]
	bx lr
	.align 2, 0
_080815EC: .4byte 0x03000E06
	thumb_func_end sub_080815E4

	thumb_func_start sub_080815F0
sub_080815F0: @ 0x080815F0
	ldr r0, _080815F8
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080815F8: .4byte 0x03000E06
	thumb_func_end sub_080815F0

	thumb_func_start Blender_CalculatePokeblock
Blender_CalculatePokeblock: @ 0x080815FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp]
	mov r8, r1
	str r3, [sp, #4]
	ldr r0, [sp, #0x30]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r7, _080816B8
	adds r2, r7, #0
	movs r1, #0
	adds r0, r7, #0
	adds r0, #0xa
_08081626:
	strh r1, [r0]
	subs r0, #2
	cmp r0, r2
	bge _08081626
	movs r6, #0
	cmp r6, sb
	bge _0808165C
	ldr r0, _080816B8
	mov ip, r0
	ldr r5, [sp]
	adds r5, #9
_0808163C:
	movs r3, #0
	adds r4, r5, #0
	mov r2, ip
_08081642:
	adds r1, r4, r3
	ldrh r0, [r2]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #5
	ble _08081642
	adds r5, #0x10
	adds r6, #1
	cmp r6, sb
	blt _0808163C
_0808165C:
	movs r1, #0
	ldrsh r3, [r7, r1]
	ldrh r0, [r7]
	ldrh r1, [r7, #2]
	subs r0, r0, r1
	strh r0, [r7]
	ldrh r0, [r7, #4]
	subs r1, r1, r0
	strh r1, [r7, #2]
	ldrh r1, [r7, #6]
	subs r0, r0, r1
	strh r0, [r7, #4]
	ldrh r0, [r7, #8]
	subs r1, r1, r0
	strh r1, [r7, #6]
	subs r0, r0, r3
	strh r0, [r7, #8]
	movs r3, #0
	movs r2, #0
	adds r1, r7, #0
	movs r6, #4
_08081686:
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bge _08081692
	strh r2, [r1]
	adds r3, #1
_08081692:
	adds r1, #2
	subs r6, #1
	cmp r6, #0
	bge _08081686
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r4, #0
	ldr r1, _080816B8
	movs r6, #4
_080816A6:
	ldrh r2, [r1]
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0
	ble _080816C0
	cmp r0, r3
	bge _080816BC
	strh r4, [r1]
	b _080816C0
	.align 2, 0
_080816B8: .4byte 0x03000DE8
_080816BC:
	subs r0, r2, r3
	strh r0, [r1]
_080816C0:
	adds r1, #2
	subs r6, #1
	cmp r6, #0
	bge _080816A6
	ldr r1, _080817A0
	ldr r2, _080817A4
	movs r6, #4
_080816CE:
	movs r3, #0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, #2
	subs r6, #1
	cmp r6, #0
	bge _080816CE
	ldr r1, _080817A8
	ldr r0, [sp, #8]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	adds r3, #0x64
	ldr r4, _080817AC
	str r3, [r4]
	movs r6, #4
_080816F2:
	movs r0, #0
	ldrsh r5, [r7, r0]
	adds r0, r5, #0
	muls r0, r3, r0
	movs r1, #0xa
	str r3, [sp, #0xc]
	bl __divsi3
	adds r5, r0, #0
	movs r1, #0xa
	bl __modsi3
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	ldr r3, [sp, #0xc]
	cmp r4, #4
	ble _0808171E
	adds r5, #1
_0808171E:
	strh r5, [r7]
	adds r7, #2
	subs r6, #1
	cmp r6, #0
	bge _080816F2
	ldr r1, _080817A0
	ldr r2, _080817B0
	movs r6, #4
_0808172E:
	movs r3, #0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, #2
	subs r6, #1
	cmp r6, #0
	bge _0808172E
	ldr r4, _080817A0
	ldr r0, [sp]
	adds r1, r4, #0
	mov r2, sb
	mov r3, sl
	bl Blender_GetPokeblockColor
	mov r5, r8
	strb r0, [r5]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	mov r1, sb
	bl __divsi3
	mov r3, sb
	subs r0, r0, r3
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08081768
	movs r0, #0
	strh r0, [r4, #0xa]
_08081768:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, #0xc
	bne _080817C2
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r6, #0
	ldr r0, _080817B4
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	movs r4, #1
	movs r3, #2
_08081790:
	adds r2, r0, #0
	asrs r2, r6
	ands r2, r4
	cmp r2, #0
	beq _080817B8
	strh r3, [r1]
	b _080817BA
	.align 2, 0
_080817A0: .4byte 0x03000DE8
_080817A4: .4byte 0x02031F48
_080817A8: .4byte 0x0000014D
_080817AC: .4byte 0x02031F70
_080817B0: .4byte 0x02031F5C
_080817B4: .4byte 0x0830FBB8
_080817B8:
	strh r2, [r1]
_080817BA:
	adds r1, #2
	adds r6, #1
	cmp r6, #4
	ble _08081790
_080817C2:
	ldr r7, _0808181C
	movs r2, #0xff
	adds r1, r7, #0
	movs r6, #5
_080817CA:
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0xff
	ble _080817D4
	strh r2, [r1]
_080817D4:
	adds r1, #2
	subs r6, #1
	cmp r6, #0
	bge _080817CA
	ldrh r0, [r7]
	mov r4, r8
	strb r0, [r4, #1]
	ldrh r0, [r7, #2]
	strb r0, [r4, #2]
	ldrh r0, [r7, #4]
	strb r0, [r4, #3]
	ldrh r0, [r7, #6]
	strb r0, [r4, #4]
	ldrh r0, [r7, #8]
	strb r0, [r4, #5]
	ldrh r0, [r7, #0xa]
	strb r0, [r4, #6]
	movs r6, #0
	adds r2, r7, #0
_080817FA:
	ldr r5, [sp, #4]
	adds r1, r5, r6
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, #2
	adds r6, #1
	cmp r6, #5
	ble _080817FA
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808181C: .4byte 0x03000DE8
	thumb_func_end Blender_CalculatePokeblock

	thumb_func_start BlenderDebug_CalculatePokeblock
BlenderDebug_CalculatePokeblock: @ 0x08081820
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	bl Blender_CalculatePokeblock
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BlenderDebug_CalculatePokeblock

	thumb_func_start sub_0808183C
sub_0808183C: @ 0x0808183C
	push {r4, r5, r6, lr}
	ldr r0, _0808185C
	ldr r0, [r0]
	movs r2, #0x82
	lsls r2, r2, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, #0x4e
	ldrh r4, [r0]
	movs r2, #0
	ldr r5, _08081860
	cmp r1, r5
	bhi _08081864
	movs r2, #5
	b _080818B6
	.align 2, 0
_0808185C: .4byte 0x02031F44
_08081860: .4byte 0x00000383
_08081864:
	ldr r3, _08081878
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _0808187C
	cmp r0, r3
	bhi _08081880
	movs r2, #4
	b _080818B6
	.align 2, 0
_08081878: .4byte 0xFFFFFC7C
_0808187C: .4byte 0x00000257
_08081880:
	ldr r6, _08081890
	adds r0, r1, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r3
	bhi _08081894
	movs r2, #3
	b _080818B6
	.align 2, 0
_08081890: .4byte 0xFFFFFA24
_08081894:
	ldr r3, _080818A4
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r5
	bhi _080818A8
	movs r2, #2
	b _080818B6
	.align 2, 0
_080818A4: .4byte 0xFFFFF7CC
_080818A8:
	ldr r6, _080818D4
	adds r0, r1, r6
	lsls r0, r0, #0x10
	ldr r1, _080818D8
	cmp r0, r1
	bhi _080818B6
	movs r2, #1
_080818B6:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl sub_080815E4
	movs r2, #0
	cmp r4, #0x40
	bhi _08081998
	adds r0, r4, #0
	subs r0, #0x32
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _080818E0
	ldr r2, _080818DC
	b _08081998
	.align 2, 0
_080818D4: .4byte 0xFFFFF31C
_080818D8: .4byte 0x012B0000
_080818DC: .4byte 0x0000FFFF
_080818E0:
	adds r0, r4, #0
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _080818F4
	ldr r2, _080818F0
	b _08081998
	.align 2, 0
_080818F0: .4byte 0x0000FFFE
_080818F4:
	adds r0, r4, #0
	subs r0, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _08081908
	ldr r2, _08081904
	b _08081998
	.align 2, 0
_08081904: .4byte 0x0000FFFD
_08081908:
	adds r0, r4, #0
	subs r0, #0xc8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _0808191C
	ldr r2, _08081918
	b _08081998
	.align 2, 0
_08081918: .4byte 0x0000FFFC
_0808191C:
	adds r0, r4, #0
	subs r0, #0xfa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _08081930
	ldr r2, _0808192C
	b _08081998
	.align 2, 0
_0808192C: .4byte 0x0000FFFB
_08081930:
	ldr r1, _08081940
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _08081948
	ldr r2, _08081944
	b _08081998
	.align 2, 0
_08081940: .4byte 0xFFFFFEA2
_08081944: .4byte 0x0000FFFA
_08081948:
	ldr r3, _08081958
	adds r0, r4, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _08081960
	ldr r2, _0808195C
	b _08081998
	.align 2, 0
_08081958: .4byte 0xFFFFFE70
_0808195C: .4byte 0x0000FFF9
_08081960:
	ldr r6, _08081970
	adds r0, r4, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _08081978
	ldr r2, _08081974
	b _08081998
	.align 2, 0
_08081970: .4byte 0xFFFFFE0C
_08081974: .4byte 0x0000FFF8
_08081978:
	ldr r1, _08081988
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _08081990
	ldr r2, _0808198C
	b _08081998
	.align 2, 0
_08081988: .4byte 0xFFFFFDDA
_0808198C: .4byte 0x0000FFF7
_08081990:
	ldr r0, _080819A8
	cmp r4, r0
	bls _08081998
	ldr r2, _080819AC
_08081998:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl sub_080815CC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080819A8: .4byte 0x00000257
_080819AC: .4byte 0x0000FFF6
	thumb_func_end sub_0808183C

	thumb_func_start sub_080819B0
sub_080819B0: @ 0x080819B0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080819CC
	ldrb r0, [r0]
	cmp r0, #0
	beq _080819D4
	ldr r0, _080819D0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080819D4
	movs r2, #0xbc
	lsls r2, r2, #6
	b _080819D6
	.align 2, 0
_080819CC: .4byte 0x030031C4
_080819D0: .4byte 0x0300319C
_080819D4:
	ldr r2, _080819E0
_080819D6:
	adds r0, r2, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080819E0: .4byte 0x00002FFF
	thumb_func_end sub_080819B0

	thumb_func_start CB2_HandleBlenderEndGame
CB2_HandleBlenderEndGame: @ 0x080819E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08081A18
	ldr r0, [r4]
	adds r0, #0x63
	ldrb r0, [r0]
	cmp r0, #2
	bhi _080819FA
	bl sub_08082744
_080819FA:
	bl GetMultiplayerId
	ldr r0, [r4]
	adds r0, #0x63
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0xc
	bls _08081A0C
	b _08081EBA
_08081A0C:
	lsls r0, r0, #2
	ldr r1, _08081A1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08081A18: .4byte 0x02031F44
_08081A1C: .4byte 0x08081A20
_08081A20: @ jump table
	.4byte _08081A54 @ case 0
	.4byte _08081A94 @ case 1
	.4byte _08081AF0 @ case 2
	.4byte _08081BE4 @ case 3
	.4byte _08081C94 @ case 4
	.4byte _08081CA2 @ case 5
	.4byte _08081CCC @ case 6
	.4byte _08081E74 @ case 7
	.4byte _08081D00 @ case 8
	.4byte _08081D24 @ case 9
	.4byte _08081DCC @ case 10
	.4byte _08081E4C @ case 11
	.4byte _08081E88 @ case 12
_08081A54:
	ldr r0, _08081A64
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	movs r4, #0
	b _08081A80
	.align 2, 0
_08081A64: .4byte 0x030074D0
_08081A68:
	ldr r0, _08081A8C
	ldr r0, [r0]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08081A80:
	ldr r0, _08081A90
	ldrh r0, [r0]
	cmp r4, r0
	blo _08081A68
	b _08081E74
	.align 2, 0
_08081A8C: .4byte 0x02031F44
_08081A90: .4byte 0x02037280
_08081A94:
	ldr r4, _08081AC4
	ldr r1, [r4]
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #0x20
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08081AE2
	bl ClearLinkCallback
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08081AC8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08081ACC
	adds r1, #0x17
	ldrb r0, [r1]
	adds r0, #1
	b _08081AD2
	.align 2, 0
_08081AC4: .4byte 0x02031F44
_08081AC8: .4byte 0x030031C4
_08081ACC:
	adds r1, r2, #0
	adds r1, #0x63
	movs r0, #5
_08081AD2:
	strb r0, [r1]
	ldr r0, _08081AE8
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08081AEC
	bl m4aMPlayStop
_08081AE2:
	bl Blender_ControlHitPitch
	b _08081EBA
	.align 2, 0
_08081AE8: .4byte 0x02031F44
_08081AEC: .4byte 0x03007550
_08081AF0:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08081AFC
	b _08081E74
_08081AFC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081B08
	b _08081EBA
_08081B08:
	ldr r0, _08081B94
	ldrb r0, [r0]
	cmp r0, #0
	beq _08081BA8
	ldr r0, _08081B98
	ldrb r0, [r0]
	cmp r0, #0
	beq _08081BA8
	ldr r3, _08081B9C
	ldr r1, [r3]
	ldr r4, _08081BA0
	adds r2, r1, r4
	movs r5, #0x82
	lsls r5, r5, #1
	adds r0, r1, r5
	ldr r0, [r0]
	str r0, [r2]
	adds r0, r1, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	movs r2, #0x8e
	lsls r2, r2, #5
	adds r1, r1, r2
	strh r0, [r1]
	movs r4, #0
	mov r8, r3
	mov ip, r8
	ldr r7, _08081BA4
	movs r6, #0x92
	lsls r6, r6, #1
_08081B44:
	movs r3, #0
	adds r5, r4, #1
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #1
_08081B4E:
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r3, #1
	adds r1, r1, r4
	adds r2, r0, r7
	adds r2, r2, r1
	adds r0, r0, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08081B4E
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08081B44
	mov r2, r8
	ldr r1, [r2]
	ldr r4, _08081BA0
	adds r1, r1, r4
	movs r0, #0
	movs r2, #0x20
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081B8C
	b _08081EBA
_08081B8C:
	mov r5, r8
	ldr r1, [r5]
	b _08081E78
	.align 2, 0
_08081B94: .4byte 0x030031C4
_08081B98: .4byte 0x0300319C
_08081B9C: .4byte 0x02031F44
_08081BA0: .4byte 0x000011BC
_08081BA4: .4byte 0x000011C4
_08081BA8:
	ldr r4, _08081BE0
	ldr r3, [r4]
	movs r0, #0xcc
	lsls r0, r0, #1
	adds r1, r3, r0
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r3, r2
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r3, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r5, #0xce
	lsls r5, r5, #1
	adds r0, r3, r5
	strh r2, [r0]
	movs r0, #0
	movs r2, #0x28
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081BDA
	b _08081EBA
_08081BDA:
	ldr r1, [r4]
	b _08081E78
	.align 2, 0
_08081BE0: .4byte 0x02031F44
_08081BE4:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081BF0
	b _08081EBA
_08081BF0:
	bl ResetBlockReceivedFlags
	ldr r5, _08081C60
	ldr r1, [r5]
	adds r1, #0x63
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08081C64
	ldrb r0, [r0]
	cmp r0, #0
	beq _08081C70
	ldr r0, _08081C68
	ldrb r0, [r0]
	cmp r0, #0
	beq _08081C70
	ldr r2, _08081C6C
	ldr r3, [r5]
	ldrh r0, [r2, #4]
	adds r1, r3, #0
	adds r1, #0x4e
	strh r0, [r1]
	movs r0, #0x82
	lsls r0, r0, #1
	adds r1, r3, r0
	ldr r0, [r2]
	str r0, [r1]
	movs r4, #0
	adds r7, r2, #0
	adds r7, #8
	adds r6, r5, #0
	movs r2, #0x92
	lsls r2, r2, #1
_08081C32:
	movs r3, #0
	adds r5, r4, #1
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #1
_08081C3C:
	ldr r1, [r6]
	lsls r0, r3, #1
	adds r0, r0, r4
	adds r1, r1, r2
	adds r1, r1, r0
	adds r0, r7, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08081C3C
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08081C32
	b _08081EBA
	.align 2, 0
_08081C60: .4byte 0x02031F44
_08081C64: .4byte 0x030031C4
_08081C68: .4byte 0x0300319C
_08081C6C: .4byte 0x0202207C
_08081C70:
	ldr r2, _08081C8C
	ldr r0, _08081C90
	ldr r3, [r0]
	ldrh r0, [r2, #4]
	adds r1, r3, #0
	adds r1, #0x4e
	strh r0, [r1]
	movs r4, #0x82
	lsls r4, r4, #1
	adds r1, r3, r4
	ldr r0, [r2]
	str r0, [r1]
	b _08081EBA
	.align 2, 0
_08081C8C: .4byte 0x0202207C
_08081C90: .4byte 0x02031F44
_08081C94:
	bl Blender_PrintBlendingRanking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081CA0
	b _08081EBA
_08081CA0:
	b _08081E74
_08081CA2:
	bl Blender_PrintBlendingResults
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081CAE
	b _08081EBA
_08081CAE:
	ldr r0, _08081CC0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08081CC4
	movs r0, #0x22
	bl IncrementGameStat
	b _08081E74
	.align 2, 0
_08081CC0: .4byte 0x03005AF8
_08081CC4:
	movs r0, #0x21
	bl IncrementGameStat
	b _08081E74
_08081CCC:
	ldr r6, _08081CF4
	ldr r4, [r6]
	ldr r5, _08081CF8
	adds r4, r4, r5
	ldr r5, _08081CFC
	bl GetPlayerTextSpeedDelay
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl Blender_PrintText
	cmp r0, #0
	bne _08081CEE
	b _08081EBA
_08081CEE:
	ldr r1, [r6]
	b _08081E78
	.align 2, 0
_08081CF4: .4byte 0x02031F44
_08081CF8: .4byte 0x000011B4
_08081CFC: .4byte 0x0830F79B
_08081D00:
	ldr r4, _08081D1C
	ldr r0, [r4]
	adds r0, #0x9e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08081D20
	movs r1, #1
	movs r2, #1
	movs r3, #0xd
	bl sub_08198D44
	ldr r1, [r4]
	b _08081E78
	.align 2, 0
_08081D1C: .4byte 0x02031F44
_08081D20: .4byte 0x0830F8A8
_08081D24:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _08081D88
	cmp r2, #0
	bgt _08081D3E
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _08081D44
	b _08081EBA
_08081D3E:
	cmp r2, #1
	beq _08081D44
	b _08081EBA
_08081D44:
	ldr r2, _08081D84
	ldr r0, [r2]
	adds r0, #0x9e
	movs r1, #1
	strb r1, [r0]
	ldr r1, [r2]
	adds r1, #0x63
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r4, #0
_08081D5A:
	ldr r0, _08081D84
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r0, #0x8e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _08081D78
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
_08081D78:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08081D5A
	b _08081EBA
	.align 2, 0
_08081D84: .4byte 0x02031F44
_08081D88:
	ldr r1, _08081DC8
	ldr r0, [r1]
	adds r0, #0x9e
	strb r2, [r0]
	ldr r1, [r1]
	adds r1, #0x63
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r4, #0
_08081D9C:
	ldr r0, _08081DC8
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r0, #0x8e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _08081DBA
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
_08081DBA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08081D9C
	b _08081EBA
	.align 2, 0
_08081DC8: .4byte 0x02031F44
_08081DCC:
	ldr r6, _08081DFC
	adds r0, r6, #0
	bl sub_080819B0
	ldr r4, _08081E00
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x9e
	ldrb r5, [r0]
	cmp r5, #0
	bne _08081E38
	movs r0, #4
	bl IsBagPocketNonEmpty
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081E08
	ldr r0, [r4]
	adds r0, #0x70
	movs r1, #2
	strh r1, [r0]
	ldr r0, _08081E04
	b _08081E30
	.align 2, 0
_08081DFC: .4byte 0x030031B0
_08081E00: .4byte 0x02031F44
_08081E04: .4byte 0x00009999
_08081E08:
	bl sub_08136F64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08081E28
	ldr r0, [r4]
	adds r0, #0x70
	movs r1, #3
	strh r1, [r0]
	ldr r0, _08081E24
	b _08081E30
	.align 2, 0
_08081E24: .4byte 0x0000AAAA
_08081E28:
	ldr r0, [r4]
	adds r0, #0x70
	strh r5, [r0]
	ldr r0, _08081E34
_08081E30:
	strh r0, [r6, #2]
	b _08081E74
	.align 2, 0
_08081E34: .4byte 0x00007779
_08081E38:
	adds r1, r2, #0
	adds r1, #0x70
	movs r0, #1
	strh r0, [r1]
	ldr r0, _08081E48
	strh r0, [r6, #2]
	subs r1, #0xd
	b _08081E7A
	.align 2, 0
_08081E48: .4byte 0x00008888
_08081E4C:
	ldr r0, _08081E68
	ldrb r0, [r0]
	cmp r0, #0
	beq _08081E74
	ldr r0, _08081E6C
	bl SetMainCallback2
	ldr r2, _08081E70
	ldr r0, [r2]
	adds r0, #0x63
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	b _08081EB8
	.align 2, 0
_08081E68: .4byte 0x03005AF8
_08081E6C: .4byte 0x08082341
_08081E70: .4byte 0x02031F44
_08081E74:
	ldr r0, _08081E84
	ldr r1, [r0]
_08081E78:
	adds r1, #0x63
_08081E7A:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08081EBA
	.align 2, 0
_08081E84: .4byte 0x02031F44
_08081E88:
	ldr r6, _08081F08
	ldr r4, [r6]
	ldr r0, _08081F0C
	adds r4, r4, r0
	ldr r5, _08081F10
	bl GetPlayerTextSpeedDelay
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl Blender_PrintText
	cmp r0, #0
	beq _08081EBA
	ldr r0, _08081F14
	bl SetMainCallback2
	ldr r0, [r6]
	adds r0, #0x63
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r6]
_08081EB8:
	strb r1, [r0]
_08081EBA:
	bl sub_08082D28
	ldr r4, _08081F08
	ldr r0, [r4]
	adds r0, #0x4c
	ldrh r0, [r0]
	bl sub_08082C4C
	bl sub_080824F0
	ldr r1, [r4]
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r1, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r5, #0x8f
	lsls r5, r5, #1
	adds r1, r1, r5
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081F08: .4byte 0x02031F44
_08081F0C: .4byte 0x000011B4
_08081F10: .4byte 0x0830F78E
_08081F14: .4byte 0x08082061
	thumb_func_end CB2_HandleBlenderEndGame

	thumb_func_start LinkPlayAgainHandleSaving
LinkPlayAgainHandleSaving: @ 0x08081F18
	push {r4, lr}
	ldr r1, _08081F38
	ldr r0, [r1]
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r0, [r0]
	adds r4, r1, #0
	cmp r0, #6
	bls _08081F2E
	b _08082058
_08081F2E:
	lsls r0, r0, #2
	ldr r1, _08081F3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08081F38: .4byte 0x02031F44
_08081F3C: .4byte 0x08081F40
_08081F40: @ jump table
	.4byte _08081F5C @ case 0
	.4byte _08081F74 @ case 1
	.4byte _08081FA0 @ case 2
	.4byte _08081FB0 @ case 3
	.4byte _08081FD6 @ case 4
	.4byte _0808201C @ case 5
	.4byte _08082036 @ case 6
_08081F5C:
	bl sub_0800A8D4
	ldr r0, _08081F70
	ldr r2, [r0]
	movs r3, #0xd0
	lsls r3, r3, #1
	adds r1, r2, r3
	movs r0, #1
	b _08082028
	.align 2, 0
_08081F70: .4byte 0x02031F44
_08081F74:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08082058
	ldr r0, _08081F98
	ldr r1, [r0]
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _08081F9C
	movs r0, #1
	strb r0, [r1]
	b _08082058
	.align 2, 0
_08081F98: .4byte 0x02031F44
_08081F9C: .4byte 0x030027A0
_08081FA0:
	bl FullSaveGame
	ldr r0, _08081FAC
	ldr r2, [r0]
	b _0808201E
	.align 2, 0
_08081FAC: .4byte 0x02031F44
_08081FB0:
	ldr r1, [r4]
	movs r2, #0x84
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0xa
	bne _08082058
	bl sub_0800A8D4
	ldr r1, [r4]
	movs r3, #0xd0
	lsls r3, r3, #1
	adds r1, r1, r3
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08082058
_08081FD6:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08082058
	bl CheckSaveFile
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08082000
	ldr r0, _08081FFC
	ldr r0, [r0]
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #5
	str r1, [r0]
	b _08082058
	.align 2, 0
_08081FFC: .4byte 0x02031F44
_08082000:
	ldr r0, _08082018
	ldr r1, [r0]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r0, r1, r3
	str r2, [r0]
	movs r0, #0xd0
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #3
	str r0, [r1]
	b _08082058
	.align 2, 0
_08082018: .4byte 0x02031F44
_0808201C:
	ldr r2, [r4]
_0808201E:
	movs r3, #0xd0
	lsls r3, r3, #1
	adds r1, r2, r3
	ldr r0, [r1]
	adds r0, #1
_08082028:
	str r0, [r1]
	movs r0, #0x84
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0
	str r0, [r1]
	b _08082058
_08082036:
	ldr r1, [r4]
	movs r2, #0x84
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #5
	ble _08082058
	ldr r1, _08082054
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	b _0808205A
	.align 2, 0
_08082054: .4byte 0x030027A0
_08082058:
	movs r0, #0
_0808205A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LinkPlayAgainHandleSaving

	thumb_func_start CB2_HandlePlayerLinkPlayAgainChoice
CB2_HandlePlayerLinkPlayAgainChoice: @ 0x08082060
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r1, _08082080
	ldr r0, [r1]
	adds r0, #0x63
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #0xc
	bls _08082074
	b _080822F8
_08082074:
	lsls r0, r0, #2
	ldr r1, _08082084
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082080: .4byte 0x02031F44
_08082084: .4byte 0x08082088
_08082088: @ jump table
	.4byte _080820BC @ case 0
	.4byte _08082108 @ case 1
	.4byte _08082138 @ case 2
	.4byte _08082170 @ case 3
	.4byte _080821A8 @ case 4
	.4byte _080821C6 @ case 5
	.4byte _080821E4 @ case 6
	.4byte _08082218 @ case 7
	.4byte _08082234 @ case 8
	.4byte _08082244 @ case 9
	.4byte _08082268 @ case 10
	.4byte _080822C0 @ case 11
	.4byte _080822E2 @ case 12
_080820BC:
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x64
	ldrh r2, [r0]
	ldr r0, _080820E8
	cmp r2, r0
	bne _080820CC
	b _080821BE
_080820CC:
	ldr r0, _080820EC
	cmp r2, r0
	beq _080820D4
	b _080822F8
_080820D4:
	adds r0, r1, #0
	adds r0, #0x6c
	ldrh r2, [r0]
	ldr r0, _080820F0
	cmp r2, r0
	bne _080820F4
	adds r1, #0x63
	movs r0, #2
	strb r0, [r1]
	b _080822F8
	.align 2, 0
_080820E8: .4byte 0x00002222
_080820EC: .4byte 0x00001111
_080820F0: .4byte 0x00009999
_080820F4:
	ldr r0, _08082104
	cmp r2, r0
	bne _080821BE
	adds r1, #0x63
	movs r0, #1
	strb r0, [r1]
	b _080822F8
	.align 2, 0
_08082104: .4byte 0x0000AAAA
_08082108:
	ldr r0, [r6]
	adds r0, #0x63
	movs r1, #3
	strb r1, [r0]
	ldr r4, _0808212C
	ldr r0, [r6]
	adds r0, #0x6e
	ldrh r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08082130
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _08082134
	b _0808215C
	.align 2, 0
_0808212C: .4byte 0x02021C7C
_08082130: .4byte 0x020226A8
_08082134: .4byte 0x0830F808
_08082138:
	ldr r1, [r6]
	adds r1, #0x63
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r4, _08082164
	ldr r0, [r6]
	adds r0, #0x6e
	ldrh r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08082168
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _0808216C
_0808215C:
	adds r0, r4, #0
	bl StringAppend
	b _080822F8
	.align 2, 0
_08082164: .4byte 0x02021C7C
_08082168: .4byte 0x020226A8
_0808216C: .4byte 0x0830F7ED
_08082170:
	ldr r4, [r6]
	ldr r0, _080821A0
	adds r4, r4, r0
	ldr r5, _080821A4
	bl GetPlayerTextSpeedDelay
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl Blender_PrintText
	cmp r0, #0
	bne _08082190
	b _080822F8
_08082190:
	ldr r1, [r6]
	movs r0, #0x84
	lsls r0, r0, #1
	adds r2, r1, r0
	movs r0, #0
	str r0, [r2]
	b _080822D8
	.align 2, 0
_080821A0: .4byte 0x000011B4
_080821A4: .4byte 0x02021C7C
_080821A8:
	ldr r4, [r6]
	movs r2, #0x84
	lsls r2, r2, #1
	adds r1, r4, r2
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3c
	bgt _080821BC
	b _080822F8
_080821BC:
	adds r1, r4, #0
_080821BE:
	adds r1, #0x63
	movs r0, #5
	strb r0, [r1]
	b _080822F8
_080821C6:
	ldr r0, [r6]
	ldr r1, _080821DC
	adds r0, r0, r1
	ldr r1, _080821E0
	movs r2, #0
	bl Blender_PrintText
	bl sub_0800A8D4
	b _080822D6
	.align 2, 0
_080821DC: .4byte 0x000011B4
_080821E0: .4byte 0x0830FBC8
_080821E4:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080821F0
	b _080822F8
_080821F0:
	ldr r3, _08082214
	ldr r1, [r3]
	movs r2, #0x84
	lsls r2, r2, #1
	adds r0, r1, r2
	movs r2, #0
	str r2, [r0]
	adds r1, #0x63
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r0, r0, r1
	str r2, [r0]
	b _080822F8
	.align 2, 0
_08082214: .4byte 0x02031F44
_08082218:
	bl LinkPlayAgainHandleSaving
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080822F8
	movs r0, #0x37
	bl PlaySE
	ldr r0, _08082230
	ldr r1, [r0]
	b _080822D8
	.align 2, 0
_08082230: .4byte 0x02031F44
_08082234:
	ldr r1, [r6]
	adds r1, #0x63
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_0800A8D4
	b _080822F8
_08082244:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080822F8
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _08082264
	ldr r1, [r0]
	b _080822D8
	.align 2, 0
_08082264: .4byte 0x02031F44
_08082268:
	ldr r0, _080822A8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080822F8
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r1, [r0]
	ldr r0, _080822AC
	cmp r1, r0
	bne _080822B4
	bl FreeAllWindowBuffers
	movs r0, #2
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl UnsetBgTilemapBuffer
	ldr r0, [r6]
	bl Free
	str r4, [r6]
	ldr r0, _080822B0
	bl SetMainCallback2
	b _080822F8
	.align 2, 0
_080822A8: .4byte 0x02037C74
_080822AC: .4byte 0x00002222
_080822B0: .4byte 0x0807F4B9
_080822B4:
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r2, r1
	str r4, [r0]
	adds r1, r2, #0
	b _080822D8
_080822C0:
	ldr r1, [r6]
	movs r2, #0x84
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x1e
	ble _080822F8
	bl sub_0800A7F8
_080822D6:
	ldr r1, [r6]
_080822D8:
	adds r1, #0x63
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080822F8
_080822E2:
	ldr r0, _08082334
	ldrb r4, [r0]
	cmp r4, #0
	bne _080822F8
	ldr r0, [r6]
	bl Free
	str r4, [r6]
	ldr r0, _08082338
	bl SetMainCallback2
_080822F8:
	bl sub_080824F0
	ldr r0, _0808233C
	ldr r1, [r0]
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r1, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0x8f
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082334: .4byte 0x030031C4
_08082338: .4byte 0x08085B35
_0808233C: .4byte 0x02031F44
	thumb_func_end CB2_HandlePlayerLinkPlayAgainChoice

	thumb_func_start CB2_HandlePlayerPlayAgainChoice
CB2_HandlePlayerPlayAgainChoice: @ 0x08082340
	push {r4, r5, r6, lr}
	ldr r1, _0808235C
	ldr r0, [r1]
	adds r0, #0x63
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #0xa
	bls _08082352
	b _080824AE
_08082352:
	lsls r0, r0, #2
	ldr r1, _08082360
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808235C: .4byte 0x02031F44
_08082360: .4byte 0x08082364
_08082364: @ jump table
	.4byte _08082390 @ case 0
	.4byte _080823C6 @ case 1
	.4byte _080823F0 @ case 2
	.4byte _0808241C @ case 3
	.4byte _080824AE @ case 4
	.4byte _080824AE @ case 5
	.4byte _080824AE @ case 6
	.4byte _080824AE @ case 7
	.4byte _080824AE @ case 8
	.4byte _0808244C @ case 9
	.4byte _08082464 @ case 10
_08082390:
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x70
	ldrh r0, [r0]
	cmp r0, #1
	bhi _080823A2
	adds r1, #0x63
	movs r0, #9
	strb r0, [r1]
_080823A2:
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x70
	ldrh r1, [r0]
	cmp r1, #2
	bne _080823B2
	subs r0, #0xd
	strb r1, [r0]
_080823B2:
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x70
	ldrh r0, [r0]
	cmp r0, #3
	bne _080824AE
	adds r1, #0x63
	movs r0, #1
	strb r0, [r1]
	b _080824AE
_080823C6:
	ldr r0, [r6]
	adds r0, #0x63
	movs r2, #0
	movs r1, #3
	strb r1, [r0]
	ldr r0, [r6]
	ldr r1, _080823E4
	adds r0, r0, r1
	strh r2, [r0]
	ldr r0, _080823E8
	ldr r1, _080823EC
	bl StringCopy
	b _080824AE
	.align 2, 0
_080823E4: .4byte 0x000011B4
_080823E8: .4byte 0x02021C7C
_080823EC: .4byte 0x0830F7D8
_080823F0:
	ldr r1, [r6]
	adds r1, #0x63
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	ldr r0, [r6]
	ldr r1, _08082410
	adds r0, r0, r1
	strh r2, [r0]
	ldr r0, _08082414
	ldr r1, _08082418
	bl StringCopy
	b _080824AE
	.align 2, 0
_08082410: .4byte 0x000011B4
_08082414: .4byte 0x02021C7C
_08082418: .4byte 0x0830F7B2
_0808241C:
	ldr r4, [r6]
	ldr r2, _08082444
	adds r4, r4, r2
	ldr r5, _08082448
	bl GetPlayerTextSpeedDelay
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl Blender_PrintText
	cmp r0, #0
	beq _080824AE
	ldr r0, [r6]
	adds r0, #0x63
	movs r1, #9
	strb r1, [r0]
	b _080824AE
	.align 2, 0
_08082444: .4byte 0x000011B4
_08082448: .4byte 0x02021C7C
_0808244C:
	movs r0, #3
	bl BeginFastPaletteFade
	ldr r0, _08082460
	ldr r1, [r0]
	adds r1, #0x63
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080824AE
	.align 2, 0
_08082460: .4byte 0x02031F44
_08082464:
	ldr r0, _08082484
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080824AE
	ldr r0, [r6]
	adds r0, #0x70
	ldrh r0, [r0]
	cmp r0, #0
	bne _0808248C
	ldr r0, _08082488
	bl SetMainCallback2
	b _08082492
	.align 2, 0
_08082484: .4byte 0x02037C74
_08082488: .4byte 0x0807F4B9
_0808248C:
	ldr r0, _080824E8
	bl SetMainCallback2
_08082492:
	bl FreeAllWindowBuffers
	movs r0, #2
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl UnsetBgTilemapBuffer
	ldr r4, _080824EC
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
_080824AE:
	bl sub_080824F0
	ldr r0, _080824EC
	ldr r1, [r0]
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r1, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0x8f
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080824E8: .4byte 0x08085B35
_080824EC: .4byte 0x02031F44
	thumb_func_end CB2_HandlePlayerPlayAgainChoice

	thumb_func_start sub_080824F0
sub_080824F0: @ 0x080824F0
	push {r4, r5, r6, r7, lr}
	ldr r0, _08082528
	ldrb r0, [r0]
	cmp r0, #0
	bne _080824FC
	b _080826C0
_080824FC:
	ldr r4, _0808252C
	ldrh r0, [r4]
	ldr r1, _08082530
	movs r2, #0xbc
	lsls r2, r2, #6
	bl sub_08080ECC
	cmp r0, #0
	beq _08082582
	ldrh r1, [r4, #2]
	ldr r0, _08082534
	cmp r1, r0
	bne _08082574
	ldrh r3, [r4, #4]
	ldr r0, _08082538
	cmp r3, r0
	beq _08082554
	cmp r3, r0
	bgt _08082540
	ldr r0, _0808253C
	b _08082542
	.align 2, 0
_08082528: .4byte 0x030031C4
_0808252C: .4byte 0x03003130
_08082530: .4byte 0x00002FFF
_08082534: .4byte 0x00001111
_08082538: .4byte 0x00009999
_0808253C: .4byte 0x00008888
_08082540:
	ldr r0, _0808254C
_08082542:
	cmp r3, r0
	beq _08082554
	ldr r2, _08082550
	b _08082564
	.align 2, 0
_0808254C: .4byte 0x0000AAAA
_08082550: .4byte 0x02031F44
_08082554:
	ldr r2, _0808256C
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x6c
	strh r3, [r1]
	ldrh r1, [r4, #6]
	adds r0, #0x6e
	strh r1, [r0]
_08082564:
	ldr r0, [r2]
	adds r0, #0x64
	ldr r1, _08082570
	b _08082580
	.align 2, 0
_0808256C: .4byte 0x02031F44
_08082570: .4byte 0x00001111
_08082574:
	ldr r0, _080825AC
	cmp r1, r0
	bne _08082582
	ldr r0, _080825B0
	ldr r0, [r0]
	adds r0, #0x64
_08082580:
	strh r1, [r0]
_08082582:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808258E
	b _080826C0
_0808258E:
	ldr r2, _080825B0
	ldr r0, [r2]
	adds r0, #0x64
	ldrh r1, [r0]
	ldr r0, _080825B4
	cmp r1, r0
	bne _0808259E
	b _080826C0
_0808259E:
	ldr r0, _080825AC
	cmp r1, r0
	bne _080825A6
	b _080826C0
_080825A6:
	movs r5, #0
	adds r7, r2, #0
	b _08082610
	.align 2, 0
_080825AC: .4byte 0x00002222
_080825B0: .4byte 0x02031F44
_080825B4: .4byte 0x00001111
_080825B8:
	ldr r6, _080825E4
	lsls r4, r5, #4
	adds r0, r4, r6
	ldrh r0, [r0]
	ldr r1, _080825E8
	movs r2, #0xbc
	lsls r2, r2, #6
	bl sub_08080ECC
	cmp r0, #0
	beq _0808260A
	adds r0, r6, #2
	adds r0, r4, r0
	ldrh r2, [r0]
	ldr r0, _080825EC
	cmp r2, r0
	beq _08082600
	cmp r2, r0
	bgt _080825F4
	ldr r0, _080825F0
	b _080825FC
	.align 2, 0
_080825E4: .4byte 0x03003130
_080825E8: .4byte 0x00002FFF
_080825EC: .4byte 0x00008888
_080825F0: .4byte 0x00007779
_080825F4:
	ldr r0, _08082620
	cmp r2, r0
	beq _08082600
	ldr r0, _08082624
_080825FC:
	cmp r2, r0
	bne _0808260A
_08082600:
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x64
	adds r0, r0, r1
	strh r2, [r0]
_0808260A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08082610:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	blo _080825B8
	movs r5, #0
	b _0808262E
	.align 2, 0
_08082620: .4byte 0x00009999
_08082624: .4byte 0x0000AAAA
_08082628:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0808262E:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bhs _0808264A
	ldr r0, _0808265C
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x64
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _08082628
_0808264A:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _080826C0
	movs r5, #0
	ldr r4, _08082660
	b _0808266A
	.align 2, 0
_0808265C: .4byte 0x02031F44
_08082660: .4byte 0x00007779
_08082664:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0808266A:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bhs _08082686
	ldr r0, _080826A0
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x64
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r4
	beq _08082664
_08082686:
	ldr r4, _080826A4
	adds r0, r4, #0
	bl sub_080819B0
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _080826AC
	ldr r0, _080826A8
	strh r0, [r4, #2]
	b _080826C0
	.align 2, 0
_080826A0: .4byte 0x02031F44
_080826A4: .4byte 0x030031B0
_080826A8: .4byte 0x00002222
_080826AC:
	ldr r0, _080826C8
	strh r0, [r4, #2]
	ldr r0, _080826CC
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x64
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #4]
	strh r5, [r4, #6]
_080826C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080826C8: .4byte 0x00001111
_080826CC: .4byte 0x02031F44
	thumb_func_end sub_080824F0

	thumb_func_start sub_080826D0
sub_080826D0: @ 0x080826D0
	push {r4, lr}
	sub sp, #0x14
	movs r1, #0xf0
	lsls r1, r1, #7
	str r1, [sp]
	movs r1, #0xa0
	lsls r1, r1, #7
	str r1, [sp, #4]
	mov r3, sp
	ldr r1, _08082730
	ldr r1, [r1]
	mov ip, r1
	movs r1, #0x8e
	lsls r1, r1, #1
	add r1, ip
	ldrh r2, [r1]
	movs r1, #0x78
	subs r1, r1, r2
	strh r1, [r3, #8]
	movs r1, #0x8f
	lsls r1, r1, #1
	add r1, ip
	ldrh r2, [r1]
	movs r1, #0x50
	subs r1, r1, r2
	strh r1, [r3, #0xa]
	mov r2, sp
	movs r3, #0x8d
	lsls r3, r3, #1
	add r3, ip
	ldrh r1, [r3]
	strh r1, [r2, #0xc]
	ldrh r1, [r3]
	strh r1, [r2, #0xe]
	mov r1, ip
	adds r1, #0x4a
	ldrh r1, [r1]
	strh r1, [r2, #0x10]
	mov r1, sp
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082730: .4byte 0x02031F44
	thumb_func_end sub_080826D0

	thumb_func_start GetBlenderArrowPosition
GetBlenderArrowPosition: @ 0x08082734
	ldr r0, _08082740
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08082740: .4byte 0x02031F44
	thumb_func_end GetBlenderArrowPosition

	thumb_func_start sub_08082744
sub_08082744: @ 0x08082744
	push {r4, lr}
	movs r1, #0
	ldr r4, _0808279C
	ldrb r0, [r4]
	cmp r0, #0
	beq _08082758
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08082758:
	ldr r0, _080827A0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080827E8
	ldrb r0, [r4]
	cmp r0, #0
	beq _080827E8
	cmp r1, #0
	bne _080827AC
	ldr r0, _080827A4
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x4a
	adds r0, r3, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r1, _080827A8
	movs r4, #0x8b
	lsls r4, r4, #1
	adds r0, r3, r4
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	ldrh r0, [r2]
	strh r0, [r1, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r3, r1
	bl sub_080826D0
	b _08082806
	.align 2, 0
_0808279C: .4byte 0x030031C4
_080827A0: .4byte 0x0300319C
_080827A4: .4byte 0x02031F44
_080827A8: .4byte 0x030031B0
_080827AC:
	ldr r3, _080827E0
	ldrh r0, [r3]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	movs r0, #0x88
	lsls r0, r0, #7
	cmp r1, r0
	bne _08082806
	ldr r0, _080827E4
	ldr r2, [r0]
	ldrh r0, [r3, #0xa]
	movs r4, #0x8b
	lsls r4, r4, #1
	adds r1, r2, r4
	strh r0, [r1]
	ldrh r0, [r3, #0xc]
	adds r1, r2, #0
	adds r1, #0x4a
	strh r0, [r1]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r2, r1
	bl sub_080826D0
	b _08082806
	.align 2, 0
_080827E0: .4byte 0x03003130
_080827E4: .4byte 0x02031F44
_080827E8:
	ldr r0, _0808280C
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x4a
	adds r0, r1, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	ldrh r3, [r2]
	adds r0, r0, r3
	strh r0, [r2]
	movs r4, #0xa0
	lsls r4, r4, #1
	adds r0, r1, r4
	bl sub_080826D0
_08082806:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808280C: .4byte 0x02031F44
	thumb_func_end sub_08082744

	thumb_func_start BerryBlender_SetBackgroundsPos
BerryBlender_SetBackgroundsPos: @ 0x08082810
	push {r4, r5, r6, lr}
	ldr r4, _08082854
	ldr r0, [r4]
	movs r6, #0x8e
	lsls r6, r6, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, [r4]
	movs r5, #0x8f
	lsls r5, r5, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, r0, r6
	ldrh r1, [r0]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, r0, r5
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082854: .4byte 0x02031F44
	thumb_func_end BerryBlender_SetBackgroundsPos

	thumb_func_start sub_08082858
sub_08082858: @ 0x08082858
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x32]
	adds r0, r0, r1
	strh r0, [r2, #0x32]
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x34]
	adds r0, r0, r1
	strh r0, [r2, #0x34]
	movs r1, #0x32
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08082876
	adds r0, #7
_08082876:
	asrs r0, r0, #3
	strh r0, [r2, #0x24]
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08082884
	adds r0, #7
_08082884:
	asrs r0, r0, #3
	strh r0, [r2, #0x26]
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808289C
	adds r0, r2, #0
	bl DestroySprite
_0808289C:
	pop {r0}
	bx r0
	thumb_func_end sub_08082858

	thumb_func_start sub_080828A0
sub_080828A0: @ 0x080828A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl Random
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #1
	ands r1, r0
	adds r0, r1, #1
	cmp r0, #0
	beq _0808295C
	ldr r0, _0808296C
	mov sb, r0
	ldr r2, _08082970
	mov sl, r2
	adds r6, r1, #1
	movs r3, #0x1f
	mov r8, r3
	movs r7, #0x10
_080828CC:
	bl Random
	ldr r1, _08082974
	ldr r4, [r1]
	adds r4, #0x4a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x14
	bl __umodsi3
	ldrh r1, [r4]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r2, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	bge _08082900
	adds r1, #3
_08082900:
	asrs r1, r1, #2
	lsls r0, r2, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _08082910
	adds r0, #3
_08082910:
	asrs r2, r0, #2
	adds r1, #0x78
	adds r2, #0x50
	ldr r0, _08082978
	movs r3, #1
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random
	lsls r5, r4, #4
	adds r5, r5, r4
	lsls r5, r5, #2
	mov r3, sl
	adds r4, r5, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, r8
	ands r0, r1
	subs r0, r7, r0
	strh r0, [r4, #0x2e]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, r8
	ands r0, r2
	subs r0, r7, r0
	strh r0, [r4, #0x30]
	ldr r3, _0808297C
	adds r5, r5, r3
	ldr r0, _08082980
	str r0, [r5]
	subs r6, #1
	cmp r6, #0
	bne _080828CC
_0808295C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808296C: .4byte 0x082FA8CC
_08082970: .4byte 0x020205AC
_08082974: .4byte 0x02031F44
_08082978: .4byte 0x0830FAD0
_0808297C: .4byte 0x020205C8
_08082980: .4byte 0x08082859
	thumb_func_end sub_080828A0

	thumb_func_start sub_08082984
sub_08082984: @ 0x08082984
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #3
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080829B0
	adds r0, r4, #0
	bl DestroySprite
_080829B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08082984

	thumb_func_start sub_080829B8
sub_080829B8: @ 0x080829B8
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strh r0, [r2, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080829DC
	ldr r0, _080829F4
	strh r0, [r2, #0x26]
_080829DC:
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080829F0
	adds r0, r2, #0
	bl DestroySprite
_080829F0:
	pop {r0}
	bx r0
	.align 2, 0
_080829F4: .4byte 0x0000FFF4
	thumb_func_end sub_080829B8

	thumb_func_start Blender_SetParticipantBerryData
Blender_SetParticipantBerryData: @ 0x080829F8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08082A28
	ldr r3, [r2]
	lsls r4, r0, #1
	adds r2, r3, #0
	adds r2, #0x74
	adds r2, r2, r4
	strh r1, [r2]
	lsls r0, r0, #4
	movs r2, #0xac
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r3, r3, r0
	adds r0, r3, #0
	bl Blender_CopyBerryData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082A28: .4byte 0x02031F44
	thumb_func_end Blender_SetParticipantBerryData

	thumb_func_start sub_08082A2C
sub_08082A2C: @ 0x08082A2C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08082A68
	cmp r0, #1
	bgt _08082A42
	cmp r0, #0
	beq _08082A48
	b _08082ACE
_08082A42:
	cmp r0, #2
	beq _08082A82
	b _08082ACE
_08082A48:
	ldrh r0, [r4, #0x30]
	adds r0, #8
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x58
	ble _08082ACE
	movs r0, #0x58
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0x38
	bl PlaySE
	b _08082ACE
_08082A68:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08082ACE
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0
	strh r0, [r4, #0x32]
	b _08082ACE
_08082A82:
	ldrh r0, [r4, #0x30]
	adds r0, #4
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb0
	ble _08082ACE
	ldrh r0, [r4, #0x34]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _08082ABC
	adds r0, r4, #0
	bl DestroySprite
	ldr r0, _08082AB8
	movs r2, #0x14
	rsbs r2, r2, #0
	movs r1, #0x78
	movs r3, #2
	bl CreateSprite
	b _08082ACE
	.align 2, 0
_08082AB8: .4byte 0x0830FB50
_08082ABC:
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldr r0, _08082AD8
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
_08082ACE:
	ldrh r0, [r4, #0x30]
	strh r0, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082AD8: .4byte 0x0000FFF0
	thumb_func_end sub_08082A2C

	thumb_func_start sub_08082ADC
sub_08082ADC: @ 0x08082ADC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08082B18
	cmp r0, #1
	bgt _08082AF2
	cmp r0, #0
	beq _08082AF8
	b _08082B4C
_08082AF2:
	cmp r0, #2
	beq _08082B2E
	b _08082B4C
_08082AF8:
	ldrh r0, [r4, #0x30]
	adds r0, #8
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5c
	ble _08082B4C
	movs r0, #0x5c
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0x15
	bl PlaySE
	b _08082B4C
_08082B18:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08082B4C
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _08082B4C
_08082B2E:
	ldrh r0, [r4, #0x30]
	adds r0, #4
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb0
	ble _08082B4C
	ldr r0, _08082B58
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl DestroySprite
_08082B4C:
	ldrh r0, [r4, #0x30]
	strh r0, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082B58: .4byte 0x02031F44
	thumb_func_end sub_08082ADC

	thumb_func_start sub_08082B5C
sub_08082B5C: @ 0x08082B5C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	ldr r1, _08082B88
	ldr r1, [r1]
	movs r2, #0x8c
	lsls r2, r2, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	cmp r2, r0
	bhs _08082B82
	adds r0, r2, #2
	strh r0, [r1]
	ldrh r0, [r1]
	adds r1, r3, #0
	bl sub_08082B8C
_08082B82:
	pop {r0}
	bx r0
	.align 2, 0
_08082B88: .4byte 0x02031F44
	thumb_func_end sub_08082B5C

	thumb_func_start sub_08082B8C
sub_08082B8C: @ 0x08082B8C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r7, _08082C1C
	lsrs r0, r0, #0xa
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _08082BA4
	adds r0, r1, #7
_08082BA4:
	asrs r4, r0, #3
	movs r3, #0
	cmp r3, r4
	bge _08082BCC
	ldr r0, _08082C20
	adds r6, r0, #0
	adds r0, #0x10
	adds r5, r0, #0
	adds r2, r7, #0
	adds r2, #0x56
	adds r0, r7, #0
	adds r3, r4, #0
_08082BBC:
	strh r6, [r0, #0x16]
	strh r5, [r2]
	adds r2, #2
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bne _08082BBC
	adds r3, r4, #0
_08082BCC:
	adds r0, r1, #0
	cmp r1, #0
	bge _08082BD4
	adds r0, r1, #7
_08082BD4:
	asrs r2, r0, #3
	lsls r0, r2, #3
	subs r2, r1, r0
	cmp r2, #0
	beq _08082BF2
	lsls r0, r3, #1
	adds r0, r0, r7
	ldr r4, _08082C24
	adds r1, r2, r4
	strh r1, [r0, #0x16]
	adds r0, #0x56
	adds r4, #0x10
	adds r1, r2, r4
	strh r1, [r0]
	adds r3, #1
_08082BF2:
	cmp r3, #7
	bgt _08082C16
	ldr r0, _08082C28
	adds r4, r0, #0
	adds r0, #0x10
	adds r2, r0, #0
	lsls r1, r3, #1
	adds r0, r1, #0
	adds r0, #0x56
	adds r0, r0, r7
	adds r1, r1, r7
_08082C08:
	strh r4, [r1, #0x16]
	strh r2, [r0]
	adds r0, #2
	adds r1, #2
	adds r3, #1
	cmp r3, #7
	ble _08082C08
_08082C16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082C1C: .4byte 0x06006000
_08082C20: .4byte 0x000080E9
_08082C24: .4byte 0xFFFF80E1
_08082C28: .4byte 0x000080E1
	thumb_func_end sub_08082B8C

	thumb_func_start sub_08082C2C
sub_08082C2C: @ 0x08082C2C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08082C44
	muls r0, r1, r0
	cmp r0, #0
	bge _08082C3E
	ldr r1, _08082C48
	adds r0, r0, r1
_08082C3E:
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08082C44: .4byte 0x00057E40
_08082C48: .4byte 0x0000FFFF
	thumb_func_end sub_08082C2C

	thumb_func_start sub_08082C4C
sub_08082C4C: @ 0x08082C4C
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_08082C2C
	adds r5, r0, #0
	ldr r0, _08082CCC
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x4e
	ldrh r0, [r1]
	cmp r0, r5
	bhs _08082C6A
	strh r5, [r1]
_08082C6A:
	movs r6, #0
_08082C6C:
	mov r0, sp
	adds r4, r0, r6
	adds r0, r5, #0
	movs r1, #0xa
	bl __umodsi3
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	adds r5, r0, #0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #4
	bls _08082C6C
	ldr r2, _08082CD0
	mov r0, sp
	ldr r3, _08082CD4
	adds r1, r3, #0
	ldrb r0, [r0, #4]
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, #2
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	mov r0, sp
	ldrb r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #4
	mov r0, sp
	ldrb r0, [r0, #1]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	mov r0, sp
	ldrb r0, [r0]
	adds r1, r1, r0
	strh r1, [r2]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082CCC: .4byte 0x02031F44
_08082CD0: .4byte 0x06006458
_08082CD4: .4byte 0x00008072
	thumb_func_end sub_08082C4C

	thumb_func_start sub_08082CD8
sub_08082CD8: @ 0x08082CD8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x10
	lsrs r5, r4, #0x10
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08082CFC
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __umodsi3
	lsrs r1, r4, #0x11
	subs r0, r0, r1
	strh r0, [r6]
_08082CFC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08082CD8

	thumb_func_start sub_08082D04
sub_08082D04: @ 0x08082D04
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _08082D16
	adds r0, r2, #1
	strh r0, [r1]
_08082D16:
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _08082D24
	subs r0, r2, #1
	strh r0, [r1]
_08082D24:
	pop {r0}
	bx r0
	thumb_func_end sub_08082D04

	thumb_func_start sub_08082D28
sub_08082D28: @ 0x08082D28
	push {r4, lr}
	ldr r4, _08082D4C
	ldr r0, [r4]
	movs r1, #0x8e
	lsls r1, r1, #1
	adds r0, r0, r1
	bl sub_08082D04
	ldr r0, [r4]
	movs r1, #0x8f
	lsls r1, r1, #1
	adds r0, r0, r1
	bl sub_08082D04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082D4C: .4byte 0x02031F44
	thumb_func_end sub_08082D28

	thumb_func_start sub_08082D50
sub_08082D50: @ 0x08082D50
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r5, #8
	cmp r1, #9
	bhi _08082D60
	movs r5, #0x10
_08082D60:
	ldrh r0, [r4]
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bne _08082D7E
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __modsi3
	lsrs r1, r5, #1
	subs r0, r0, r1
	b _08082D92
_08082D7E:
	cmp r1, #0
	bge _08082D86
	adds r0, #1
	strh r0, [r4]
_08082D86:
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08082D94
	subs r0, r1, #1
_08082D92:
	strh r0, [r4]
_08082D94:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08082D50

	thumb_func_start sub_08082D9C
sub_08082D9C: @ 0x08082D9C
	push {r4, r5, lr}
	ldr r5, _08082DF4
	ldr r2, [r5]
	movs r4, #0x84
	lsls r4, r4, #1
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, #0
	bne _08082DBC
	movs r3, #0x8e
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strh r1, [r0]
_08082DBC:
	ldr r0, [r5]
	adds r2, r0, r4
	ldr r1, [r2]
	adds r1, #1
	str r1, [r2]
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_08082D50
	ldr r1, [r5]
	movs r3, #0x8f
	lsls r3, r3, #1
	adds r0, r1, r3
	adds r1, r1, r4
	ldrh r1, [r1]
	bl sub_08082D50
	ldr r2, [r5]
	adds r0, r2, r4
	ldr r0, [r0]
	cmp r0, #0x14
	beq _08082DF8
	movs r0, #0
	b _08082E0C
	.align 2, 0
_08082DF4: .4byte 0x02031F44
_08082DF8:
	movs r1, #0x8e
	lsls r1, r1, #1
	adds r0, r2, r1
	movs r1, #0
	strh r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, #1
_08082E0C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08082D9C

	thumb_func_start sub_08082E14
sub_08082E14: @ 0x08082E14
	ldr r1, _08082E30
	ldr r2, [r1]
	movs r3, #0x8e
	lsls r3, r3, #1
	adds r1, r2, r3
	ldrh r1, [r1]
	rsbs r1, r1, #0
	strh r1, [r0, #0x24]
	adds r3, #2
	adds r1, r2, r3
	ldrh r1, [r1]
	rsbs r1, r1, #0
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0
_08082E30: .4byte 0x02031F44
	thumb_func_end sub_08082E14

	thumb_func_start TryUpdateBerryBlenderRecord
TryUpdateBerryBlenderRecord: @ 0x08082E34
	push {lr}
	ldr r0, _08082E60
	ldr r2, [r0]
	ldr r0, _08082E64
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #1
	ldr r3, _08082E68
	adds r2, r2, r3
	adds r2, r2, r0
	adds r1, #0x4e
	ldrh r1, [r1]
	ldrh r0, [r2]
	cmp r0, r1
	bhs _08082E5A
	strh r1, [r2]
_08082E5A:
	pop {r0}
	bx r0
	.align 2, 0
_08082E60: .4byte 0x03005AEC
_08082E64: .4byte 0x02031F44
_08082E68: .4byte 0x000009BC
	thumb_func_end TryUpdateBerryBlenderRecord

	thumb_func_start Blender_PrintBlendingResults
Blender_PrintBlendingResults: @ 0x08082E6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	ldr r1, _08082E90
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #6
	bls _08082E86
	b _0808328C
_08082E86:
	lsls r0, r0, #2
	ldr r1, _08082E94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082E90: .4byte 0x02031F44
_08082E94: .4byte 0x08082E98
_08082E98: @ jump table
	.4byte _08082EB4 @ case 0
	.4byte _08082ECA @ case 1
	.4byte _08082EE4 @ case 2
	.4byte _08082F34 @ case 3
	.4byte _08083184 @ case 4
	.4byte _0808319C @ case 5
	.4byte _08083260 @ case 6
_08082EB4:
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x11
	str r1, [r0]
	b _0808328C
_08082ECA:
	ldr r1, [r4]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r2, r1, r3
	ldr r0, [r2]
	subs r0, #0xa
	str r0, [r2]
	cmp r0, #0
	blt _08082EDE
	b _0808328C
_08082EDE:
	movs r0, #0
	str r0, [r2]
	b _08083248
_08082EE4:
	ldr r1, [r4]
	movs r0, #0x84
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x14
	bgt _08082EF8
	b _0808328C
_08082EF8:
	movs r6, #0
_08082EFA:
	ldr r4, _08082F2C
	ldr r0, [r4]
	adds r0, #0x46
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08082F30
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #2
	bls _08082EFA
	ldr r1, [r4]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r2, r1, r3
	movs r0, #0
	str r0, [r2]
	b _08083248
	.align 2, 0
_08082F2C: .4byte 0x02031F44
_08082F30: .4byte 0x020205AC
_08082F34:
	ldr r1, _08083154
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #5
	movs r2, #0x38
	movs r3, #1
	bl Blender_AddTextPrinter
	movs r6, #0
	ldr r1, _08083158
	ldr r0, [r1]
	adds r0, #0x7c
	mov r2, sp
	adds r2, #0x10
	str r2, [sp, #0x48]
	ldrb r0, [r0]
	cmp r6, r0
	bhs _0808302A
	adds r7, r1, #0
	ldr r3, _0808315C
	mov sl, r3
	mov sb, r6
	movs r0, #3
	mov r8, r0
_08082F66:
	ldr r0, [r7]
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r1, r0, r2
	adds r1, r1, r6
	ldrb r4, [r1]
	adds r0, #0x9f
	adds r5, r6, #1
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r0, [r7]
	adds r0, #0x9f
	ldr r1, _08083160
	bl StringAppend
	ldr r0, [r7]
	adds r0, #0x9f
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	ldr r2, _08083164
	adds r1, r1, r2
	bl StringAppend
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x9f
	adds r0, #0x7c
	ldrb r0, [r0]
	ldr r3, _08083168
	adds r2, r0, r3
	add r0, sl
	ldrb r0, [r0]
	adds r3, r6, #0
	muls r3, r0, r3
	ldrb r2, [r2]
	adds r3, r3, r2
	subs r3, #3
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	mov r0, sb
	str r0, [sp]
	mov r2, r8
	str r2, [sp, #4]
	movs r0, #5
	movs r2, #0x10
	bl Blender_AddTextPrinter
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x9f
	lsls r4, r4, #4
	adds r4, r4, r1
	movs r3, #0xad
	lsls r3, r3, #1
	adds r4, r4, r3
	adds r1, r4, #0
	bl StringCopy
	ldr r0, [r7]
	adds r0, #0x9f
	ldr r1, _0808316C
	bl StringAppend
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x9f
	adds r0, #0x7c
	ldrb r0, [r0]
	ldr r3, _08083168
	adds r2, r0, r3
	add r0, sl
	ldrb r0, [r0]
	adds r3, r6, #0
	muls r3, r0, r3
	ldrb r2, [r2]
	adds r3, r3, r2
	subs r3, #3
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	mov r0, sb
	str r0, [sp]
	mov r2, r8
	str r2, [sp, #4]
	movs r0, #5
	movs r2, #0x60
	bl Blender_AddTextPrinter
	lsls r5, r5, #0x10
	lsrs r6, r5, #0x10
	ldr r0, [r7]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r6, r0
	blo _08082F66
_0808302A:
	ldr r1, _08083170
	movs r3, #0
	mov sb, r3
	str r3, [sp]
	movs r0, #3
	mov sl, r0
	str r0, [sp, #4]
	movs r0, #5
	movs r2, #8
	movs r3, #0x50
	bl Blender_AddTextPrinter
	ldr r6, _08083158
	ldr r0, [r6]
	adds r4, r0, #0
	adds r4, #0x9f
	adds r0, #0x4e
	ldrh r0, [r0]
	movs r1, #0x64
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, #0x9f
	ldr r1, _08083160
	bl StringAppend
	ldr r0, [r6]
	adds r0, #0x4e
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x48]
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, #0x9f
	ldr r1, [sp, #0x48]
	bl StringAppend
	ldr r0, [r6]
	adds r0, #0x9f
	ldr r1, _08083174
	bl StringAppend
	ldr r1, [r6]
	adds r1, #0x9f
	mov r2, sb
	str r2, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #5
	movs r2, #0x48
	movs r3, #0x50
	bl Blender_AddTextPrinter
	ldr r1, _08083178
	mov r0, sb
	str r0, [sp]
	mov r2, sl
	str r2, [sp, #4]
	movs r0, #5
	movs r2, #8
	movs r3, #0x60
	bl Blender_AddTextPrinter
	ldr r5, [r6]
	movs r3, #0x82
	lsls r3, r3, #1
	adds r0, r5, r3
	ldr r0, [r0]
	mov r8, r0
	movs r1, #0x3c
	bl __udivsi3
	movs r1, #0x3c
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r1, #0xe1
	lsls r1, r1, #4
	mov r0, r8
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r5, #0x9f
	adds r0, r5, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, #0x9f
	ldr r1, _0808317C
	bl StringAppend
	adds r1, r4, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, #0x9f
	ldr r1, _08083180
	bl StringAppend
	ldr r1, [r6]
	adds r1, #0x9f
	mov r0, sb
	str r0, [sp]
	mov r2, sl
	str r2, [sp, #4]
	movs r0, #5
	movs r2, #0x48
	movs r3, #0x60
	bl Blender_AddTextPrinter
	ldr r1, [r6]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r0, r1, r3
	mov r2, sb
	str r2, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #5
	movs r1, #2
	bl CopyWindowToVram
	b _0808328C
	.align 2, 0
_08083154: .4byte 0x0830F81F
_08083158: .4byte 0x02031F44
_0808315C: .4byte 0x0830FC2E
_08083160: .4byte 0x0830F847
_08083164: .4byte 0x020226A8
_08083168: .4byte 0x0830FC29
_0808316C: .4byte 0x0830F82D
_08083170: .4byte 0x0830F83B
_08083174: .4byte 0x0830F843
_08083178: .4byte 0x0830F830
_0808317C: .4byte 0x0830F834
_08083180: .4byte 0x0830F837
_08083184:
	ldr r0, _08083198
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08083192
	b _0808328C
_08083192:
	ldr r1, [r4]
	b _08083248
	.align 2, 0
_08083198: .4byte 0x03002360
_0808319C:
	movs r0, #5
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	movs r6, #0
	add r7, sp, #0x40
	ldr r5, _08083250
_080831AA:
	ldr r0, [r5]
	lsls r2, r6, #1
	adds r0, #0x74
	adds r0, r0, r2
	ldrh r1, [r0]
	cmp r1, #0
	beq _080831C0
	add r0, sp, #0x38
	adds r0, r0, r2
	subs r1, #0x85
	strh r1, [r0]
_080831C0:
	ldr r0, [r5]
	adds r0, #0x8e
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _080831DE
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
_080831DE:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	bls _080831AA
	bl sub_0808183C
	ldr r4, _08083250
	ldr r3, [r4]
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, r3, #0
	adds r1, #0x7c
	ldrb r2, [r1]
	subs r1, #0x2e
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r7, #0
	add r3, sp, #8
	bl Blender_CalculatePokeblock
	ldr r1, [r4]
	adds r1, #0x9f
	adds r0, r7, #0
	bl Blender_PrintMadePokeblockString
	ldr r1, [r4]
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r1, r1, r2
	adds r0, r7, #0
	bl TryAddContestLinkTvShow
	ldr r0, _08083254
	movs r1, #6
	bl CreateTask
	bl sub_080EF7F0
	ldr r0, _08083258
	ldrh r0, [r0]
	movs r1, #1
	bl RemoveBagItem
	adds r0, r7, #0
	bl sub_08136F9C
	ldr r1, [r4]
	ldr r3, _0808325C
	adds r2, r1, r3
	movs r0, #0
	strh r0, [r2]
_08083248:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0808328C
	.align 2, 0
_08083250: .4byte 0x02031F44
_08083254: .4byte 0x080838C5
_08083258: .4byte 0x0203CB48
_0808325C: .4byte 0x000011B4
_08083260:
	ldr r4, [r4]
	ldr r0, _08083288
	adds r5, r4, r0
	adds r4, #0x9f
	bl GetPlayerTextSpeedDelay
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl Blender_PrintText
	cmp r0, #0
	beq _0808328C
	bl TryUpdateBerryBlenderRecord
	movs r0, #1
	b _0808328E
	.align 2, 0
_08083288: .4byte 0x000011B4
_0808328C:
	movs r0, #0
_0808328E:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Blender_PrintBlendingResults

	thumb_func_start Blender_PrintMadePokeblockString
Blender_PrintMadePokeblockString: @ 0x080832A0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0xff
	strb r0, [r6]
	ldr r1, _08083334
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl StringCopy
	ldr r1, _08083338
	adds r0, r6, #0
	bl StringAppend
	ldr r1, _0808333C
	adds r0, r6, #0
	bl StringAppend
	adds r0, r5, #0
	bl sub_08136F14
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	bl sub_08136F4C
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _08083340
	adds r0, r6, #0
	bl StringAppend
	mov r0, sp
	adds r1, r4, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r6, #0
	mov r1, sp
	bl StringAppend
	ldr r1, _08083344
	adds r0, r6, #0
	bl StringAppend
	mov r0, sp
	adds r1, r5, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r6, #0
	mov r1, sp
	bl StringAppend
	ldr r1, _08083348
	adds r0, r6, #0
	bl StringAppend
	ldr r1, _0808334C
	adds r0, r6, #0
	bl StringAppend
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08083334: .4byte 0x08592078
_08083338: .4byte 0x0830F6FD
_0808333C: .4byte 0x0830F849
_08083340: .4byte 0x0830F853
_08083344: .4byte 0x0830F857
_08083348: .4byte 0x0830F860
_0808334C: .4byte 0x0830F6FB
	thumb_func_end Blender_PrintMadePokeblockString

	thumb_func_start Blender_SortBasedOnPoints
Blender_SortBasedOnPoints: @ 0x08083350
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov ip, r2
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r0, #0
	cmp r0, r7
	bge _0808339C
_08083366:
	movs r5, #0
	adds r1, r0, #1
	mov r8, r1
	cmp r5, r7
	bge _08083396
	mov r1, sb
	adds r6, r1, r0
_08083374:
	ldrb r4, [r6]
	lsls r1, r4, #2
	add r1, ip
	mov r0, sb
	adds r2, r0, r5
	ldrb r3, [r2]
	lsls r0, r3, #2
	add r0, ip
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bls _08083390
	strb r3, [r6]
	strb r4, [r2]
_08083390:
	adds r5, #1
	cmp r5, r7
	blt _08083374
_08083396:
	mov r0, r8
	cmp r0, r7
	blt _08083366
_0808339C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Blender_SortBasedOnPoints

	thumb_func_start Blender_SortScores
Blender_SortScores: @ 0x080833A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r5, #0
	ldr r2, _080833C4
	ldr r0, [r2]
	adds r0, #0x7c
	adds r1, r2, #0
	add r3, sp, #4
	mov sl, r3
	b _080833D8
	.align 2, 0
_080833C4: .4byte 0x02031F44
_080833C8:
	mov r4, sp
	adds r0, r4, r5
	strb r5, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r2]
	adds r0, #0x7c
_080833D8:
	ldrb r0, [r0]
	cmp r5, r0
	blo _080833C8
	movs r5, #0
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r2, [r1]
	cmp r5, r2
	bhs _08083452
	mov sb, sl
	movs r3, #0x92
	lsls r3, r3, #1
	adds r3, r3, r0
	mov r8, r3
	mov ip, r1
	movs r4, #0x93
	lsls r4, r4, #1
	adds r7, r0, r4
	movs r1, #0x94
	lsls r1, r1, #1
	adds r6, r0, r1
_08083404:
	lsls r4, r5, #2
	add r4, sb
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #1
	mov r2, r8
	adds r0, r2, r3
	ldrh r2, [r0]
	lsls r0, r2, #5
	subs r0, r0, r2
	lsls r1, r0, #6
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r1, r1, #6
	str r1, [r4]
	adds r0, r7, r3
	ldrh r2, [r0]
	lsls r0, r2, #5
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r4]
	movs r0, #0xfa
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r1, r1, r0
	str r1, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r1, ip
	ldrb r1, [r1]
	cmp r5, r1
	blo _08083404
_08083452:
	ldr r4, _080834A0
	ldr r0, [r4]
	adds r0, #0x7c
	ldrb r1, [r0]
	mov r0, sp
	mov r2, sl
	bl Blender_SortBasedOnPoints
	movs r5, #0
	ldr r0, [r4]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r5, r0
	bhs _08083492
	adds r2, r4, #0
	movs r3, #0x9e
	lsls r3, r3, #1
_08083474:
	ldr r1, [r2]
	adds r1, r1, r3
	adds r1, r1, r5
	mov r4, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r2]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r5, r0
	blo _08083474
_08083492:
	ldr r0, _080834A4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080834A8
	movs r3, #0
	b _080834B0
	.align 2, 0
_080834A0: .4byte 0x02031F44
_080834A4: .4byte 0x030031C4
_080834A8:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_080834B0:
	movs r5, #0
	ldr r1, _080834F8
	ldr r0, [r1]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r5, r0
	bhs _080834E6
	movs r6, #0x9e
	lsls r6, r6, #1
	movs r4, #0xd2
	lsls r4, r4, #1
_080834C6:
	ldr r2, [r1]
	adds r0, r2, r6
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, r3
	bne _080834D6
	adds r0, r2, r4
	strb r5, [r0]
_080834D6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r1]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r5, r0
	blo _080834C6
_080834E6:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080834F8: .4byte 0x02031F44
	thumb_func_end Blender_SortScores

	thumb_func_start Blender_PrintBlendingRanking
Blender_PrintBlendingRanking: @ 0x080834FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r1, _08083520
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #6
	bls _08083514
	b _080837B6
_08083514:
	lsls r0, r0, #2
	ldr r1, _08083524
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083520: .4byte 0x02031F44
_08083524: .4byte 0x08083528
_08083528: @ jump table
	.4byte _08083544 @ case 0
	.4byte _0808355A @ case 1
	.4byte _08083574 @ case 2
	.4byte _0808358E @ case 3
	.4byte _0808376C @ case 4
	.4byte _08083786 @ case 5
	.4byte _080837AC @ case 6
_08083544:
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0xff
	str r1, [r0]
	b _080837B6
_0808355A:
	ldr r1, [r2]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r2, r1, r3
	ldr r0, [r2]
	subs r0, #0xa
	str r0, [r2]
	cmp r0, #0
	blt _0808356E
	b _080837B6
_0808356E:
	movs r0, #0
	str r0, [r2]
	b _0808379C
_08083574:
	ldr r1, [r2]
	movs r0, #0x84
	lsls r0, r0, #1
	adds r2, r1, r0
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	cmp r0, #0x14
	bgt _08083588
	b _080837B6
_08083588:
	movs r0, #0
	str r0, [r2]
	b _0808379C
_0808358E:
	movs r0, #5
	movs r1, #0
	movs r2, #1
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r1, _0808374C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #5
	movs r2, #0x40
	movs r3, #0
	bl Blender_AddTextPrinter
	ldr r1, _08083750
	mov r8, r1
	mov r0, r8
	movs r1, #0x80
	movs r2, #0x34
	movs r3, #0
	bl CreateSprite
	ldr r7, _08083754
	ldr r1, [r7]
	adds r1, #0x46
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0x46
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r6, _08083758
	adds r0, r0, r6
	movs r1, #3
	bl StartSpriteAnim
	ldr r0, [r7]
	adds r0, #0x46
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r6, #0
	adds r5, #0x1c
	adds r0, r0, r5
	ldr r4, _0808375C
	str r4, [r0]
	mov r0, r8
	movs r1, #0xa0
	movs r2, #0x34
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x47
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0x47
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	str r4, [r0]
	mov r0, r8
	movs r1, #0xc0
	movs r2, #0x34
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x48
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0x48
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, [r7]
	adds r0, #0x48
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	str r4, [r0]
	bl Blender_SortScores
	movs r2, #0
	mov r8, r2
	ldr r0, [r7]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r8, r0
	bhs _0808372C
	ldr r3, _08083760
	mov sb, r3
_0808365E:
	ldr r0, [r7]
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r1, r0, r2
	add r1, r8
	ldrb r4, [r1]
	adds r0, #0x9f
	mov r5, r8
	adds r5, #1
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r0, [r7]
	adds r0, #0x9f
	ldr r1, _08083764
	bl StringAppend
	ldr r0, [r7]
	adds r0, #0x9f
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	ldr r2, _08083768
	adds r1, r1, r2
	bl StringAppend
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x9f
	adds r0, #0x7c
	ldrb r0, [r0]
	add r0, sb
	ldrb r0, [r0]
	mov r3, r8
	muls r3, r0, r3
	adds r3, #5
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #5
	movs r2, #0
	bl Blender_AddTextPrinter
	movs r6, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #1
_080836C6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x9f
	lsls r2, r6, #1
	adds r2, r2, r4
	movs r3, #0x92
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x9f
	lsls r2, r6, #0x1d
	movs r3, #0x90
	lsls r3, r3, #0x17
	adds r2, r2, r3
	lsrs r2, r2, #0x18
	adds r0, #0x7c
	ldrb r0, [r0]
	add r0, sb
	ldrb r0, [r0]
	mov r3, r8
	muls r3, r0, r3
	adds r3, #5
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #5
	bl Blender_AddTextPrinter
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #2
	bls _080836C6
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, [r7]
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r8, r0
	blo _0808365E
_0808372C:
	movs r0, #5
	bl PutWindowTilemap
	movs r0, #5
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _08083754
	ldr r1, [r0]
	movs r0, #0x84
	lsls r0, r0, #1
	adds r2, r1, r0
	movs r0, #0
	str r0, [r2]
	b _0808379C
	.align 2, 0
_0808374C: .4byte 0x0830F84D
_08083750: .4byte 0x0830FA30
_08083754: .4byte 0x02031F44
_08083758: .4byte 0x020205AC
_0808375C: .4byte 0x08007141
_08083760: .4byte 0x0830FC33
_08083764: .4byte 0x0830F847
_08083768: .4byte 0x020226A8
_0808376C:
	ldr r2, [r2]
	movs r3, #0x84
	lsls r3, r3, #1
	adds r1, r2, r3
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x14
	ble _080837B6
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _080837B6
_08083786:
	ldr r0, _080837A4
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080837B6
	movs r0, #5
	bl PlaySE
	ldr r0, _080837A8
	ldr r1, [r0]
_0808379C:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080837B6
	.align 2, 0
_080837A4: .4byte 0x03002360
_080837A8: .4byte 0x02031F44
_080837AC:
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	b _080837B8
_080837B6:
	movs r0, #0
_080837B8:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Blender_PrintBlendingRanking

	thumb_func_start ShowBerryBlenderRecordWindow
ShowBerryBlenderRecordWindow: @ 0x080837C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r0, _080838A4
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0x2c]
	str r1, [sp, #0x30]
	ldr r5, _080838A8
	add r0, sp, #0x2c
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r5]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5]
	ldr r2, _080838AC
	movs r1, #2
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _080838B0
	movs r1, #0x2a
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r6, #0
	movs r7, #0xa8
	lsls r7, r7, #0x16
_08083820:
	ldr r0, _080838B4
	ldr r0, [r0]
	lsls r1, r6, #1
	ldr r2, _080838B8
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	adds r1, r0, #0
	add r0, sp, #0xc
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r5, r0, #0
	ldr r1, _080838BC
	bl StringAppend
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0x64
	bl __umodsi3
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	adds r5, r0, #0
	ldr r1, _080838C0
	bl StringAppend
	ldr r4, _080838A8
	ldrb r0, [r4]
	lsrs r1, r7, #0x18
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #0x30
	bl AddTextPrinterParameterized
	movs r0, #0x80
	lsls r0, r0, #0x15
	adds r7, r7, r0
	adds r6, #1
	cmp r6, #2
	ble _08083820
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x34
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080838A4: .4byte 0x0830FC60
_080838A8: .4byte 0x0203A840
_080838AC: .4byte 0x0830FC38
_080838B0: .4byte 0x0830FC50
_080838B4: .4byte 0x03005AEC
_080838B8: .4byte 0x000009BC
_080838BC: .4byte 0x0830F847
_080838C0: .4byte 0x0830F843
	thumb_func_end ShowBerryBlenderRecordWindow

	thumb_func_start sub_080838C4
sub_080838C4: @ 0x080838C4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _08083910
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080838EA
	ldr r0, _08083914
	bl PlayFanfare
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080838EA:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808390A
	ldr r0, _08083918
	ldr r0, [r0]
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl PlayBGM
	adds r0, r5, #0
	bl DestroyTask
_0808390A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083910: .4byte 0x03005B60
_08083914: .4byte 0x0000016F
_08083918: .4byte 0x02031F44
	thumb_func_end sub_080838C4

	thumb_func_start TryAddContestLinkTvShow
TryAddContestLinkTvShow: @ 0x0808391C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08136F14
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	bl sub_08136F4C
	adds r1, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	strb r3, [r7, #0xa]
	ldrb r0, [r6]
	strb r0, [r7, #9]
	movs r0, #0xff
	strb r0, [r7]
	ldr r0, _080839D4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083A4C
	ldr r0, _080839D8
	ldr r2, [r0]
	movs r4, #0xd2
	lsls r4, r4, #1
	adds r1, r2, r4
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, #0
	bne _080839E0
	cmp r3, #0x14
	bls _080839E0
	adds r0, r2, #0
	adds r0, #0x7c
	ldrb r1, [r0]
	subs r1, #1
	movs r0, #0x9e
	lsls r0, r0, #1
	mov sb, r0
	adds r0, r2, r0
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r5, _080839DC
	adds r1, r1, r5
	adds r0, r7, #0
	bl StringCopy
	adds r0, r6, #0
	bl sub_08137124
	strb r0, [r7, #8]
	ldrb r1, [r7, #8]
	ldrb r2, [r7, #9]
	ldrb r3, [r7, #0xa]
	mov r6, r8
	ldr r4, [r6]
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	subs r0, #1
	add r4, sb
	adds r4, r4, r0
	ldrb r4, [r4]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r5, r5, r0
	ldrb r0, [r5, #0x12]
	str r0, [sp]
	adds r0, r7, #0
	bl Put3CheersForPokeblocksOnTheAir
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083A42
	b _08083A4C
	.align 2, 0
_080839D4: .4byte 0x030031C4
_080839D8: .4byte 0x02031F44
_080839DC: .4byte 0x020226A8
_080839E0:
	mov r0, r8
	ldr r2, [r0]
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bne _08083A4C
	cmp r3, #0x14
	bhi _08083A4C
	movs r4, #0x9e
	lsls r4, r4, #1
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r5, _08083A48
	adds r1, r1, r5
	adds r0, r7, #0
	bl StringCopy
	adds r0, r6, #0
	bl sub_08137124
	strb r0, [r7, #8]
	ldrb r1, [r7, #8]
	ldrb r2, [r7, #9]
	ldrb r3, [r7, #0xa]
	mov r6, r8
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r4, [r0]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r5, r5, r0
	ldrb r0, [r5, #0x12]
	str r0, [sp]
	adds r0, r7, #0
	bl Put3CheersForPokeblocksOnTheAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08083A4C
_08083A42:
	movs r0, #1
	b _08083A4E
	.align 2, 0
_08083A48: .4byte 0x020226A8
_08083A4C:
	movs r0, #0
_08083A4E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end TryAddContestLinkTvShow

	thumb_func_start Blender_AddTextPrinter
Blender_AddTextPrinter: @ 0x08083A5C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	mov sb, r1
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r5, #0
	cmp r4, #1
	beq _08083A9E
	cmp r4, #1
	bgt _08083A88
	cmp r4, #0
	beq _08083A90
	b _08083ABA
_08083A88:
	cmp r4, #2
	beq _08083AAC
	cmp r4, #3
	bne _08083ABE
_08083A90:
	add r1, sp, #0x14
	movs r0, #1
	strb r0, [r1]
	movs r0, #2
	strb r0, [r1, #1]
	movs r0, #3
	b _08083AB8
_08083A9E:
	add r0, sp, #0x14
	strb r5, [r0]
	adds r1, r0, #0
	movs r0, #2
	strb r0, [r1, #1]
	movs r0, #3
	b _08083AB8
_08083AAC:
	add r0, sp, #0x14
	strb r5, [r0]
	adds r1, r0, #0
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #5
_08083AB8:
	strb r0, [r1, #2]
_08083ABA:
	cmp r4, #3
	beq _08083AD0
_08083ABE:
	add r0, sp, #0x14
	ldrb r0, [r0]
	lsls r1, r0, #4
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl FillWindowPixelBuffer
_08083AD0:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	add r0, sp, #0x14
	str r0, [sp, #8]
	ldr r0, [sp, #0x34]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0xc]
	mov r0, sb
	str r0, [sp, #0x10]
	adds r0, r6, #0
	movs r1, #1
	mov r2, r8
	adds r3, r7, #0
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Blender_AddTextPrinter

	thumb_func_start Blender_PrintText
Blender_PrintText: @ 0x08083B04
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r0, #0
	ldrsh r4, [r5, r0]
	cmp r4, #0
	beq _08083B1C
	cmp r4, #1
	beq _08083B4E
	b _08083B62
_08083B1C:
	movs r0, #4
	movs r1, #0
	movs r2, #0x14
	movs r3, #0xf
	bl DrawDialogFrameWithCustomTileAndPalette
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #4
	adds r1, r7, #0
	movs r2, #1
	movs r3, #1
	bl Blender_AddTextPrinter
	movs r0, #4
	bl PutWindowTilemap
	movs r0, #4
	movs r1, #3
	bl CopyWindowToVram
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _08083B62
_08083B4E:
	movs r0, #4
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08083B62
	strh r0, [r5]
	movs r0, #1
	b _08083B64
_08083B62:
	movs r0, #0
_08083B64:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end Blender_PrintText

