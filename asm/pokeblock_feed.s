.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CB2_PokeblockFeed
CB2_PokeblockFeed: @ 0x08179A20
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_PokeblockFeed

	thumb_func_start VBlankCB_PokeblockFeed
VBlankCB_PokeblockFeed: @ 0x08179A3C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_PokeblockFeed

	thumb_func_start TransitionToPokeblockFeedScene
TransitionToPokeblockFeedScene: @ 0x08179A50
	push {r4, lr}
	sub sp, #4
	ldr r0, _08179A70
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _08179A64
	b _08179C04
_08179A64:
	lsls r0, r0, #2
	ldr r1, _08179A74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08179A70: .4byte 0x03002360
_08179A74: .4byte 0x08179A78
_08179A78: @ jump table
	.4byte _08179AB0 @ case 0
	.4byte _08179AD8 @ case 1
	.4byte _08179AEC @ case 2
	.4byte _08179B00 @ case 3
	.4byte _08179B06 @ case 4
	.4byte _08179B18 @ case 5
	.4byte _08179B1E @ case 6
	.4byte _08179B30 @ case 7
	.4byte _08179B50 @ case 8
	.4byte _08179B68 @ case 9
	.4byte _08179B94 @ case 10
	.4byte _08179BB0 @ case 11
	.4byte _08179BB6 @ case 12
	.4byte _08179BD0 @ case 13
_08179AB0:
	ldr r4, _08179ACC
	ldr r0, _08179AD0
	bl AllocZeroed
	str r0, [r4]
	bl SetVBlankHBlankCallbacksToNull
	bl clear_scheduled_bg_copies_to_vram
	ldr r1, _08179AD4
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08179BF2
	.align 2, 0
_08179ACC: .4byte 0x0203B9E4
_08179AD0: .4byte 0x00001084
_08179AD4: .4byte 0x03002360
_08179AD8:
	bl ResetPaletteFade
	ldr r2, _08179AE8
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	b _08179BE8
	.align 2, 0
_08179AE8: .4byte 0x02037C74
_08179AEC:
	bl ResetSpriteData
	ldr r1, _08179AFC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08179BF2
	.align 2, 0
_08179AFC: .4byte 0x03002360
_08179B00:
	bl FreeAllSpritePalettes
	b _08179BEA
_08179B06:
	bl AllocateMonSpritesGfx
	ldr r1, _08179B14
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08179BF2
	.align 2, 0
_08179B14: .4byte 0x03002360
_08179B18:
	bl HandleInitBackgrounds
	b _08179BEA
_08179B1E:
	bl HandleInitWindows
	ldr r1, _08179B2C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08179BF2
	.align 2, 0
_08179B2C: .4byte 0x03002360
_08179B30:
	ldr r0, _08179B48
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08179B4C
	adds r0, r0, r1
	bl LoadMonAndSceneGfx
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08179C1C
	b _08179BEA
	.align 2, 0
_08179B48: .4byte 0x0203B968
_08179B4C: .4byte 0x02024190
_08179B50:
	bl CreatePokeblockCaseSpriteForFeeding
	ldr r1, _08179B60
	ldr r1, [r1]
	ldr r2, _08179B64
	adds r1, r1, r2
	strb r0, [r1]
	b _08179BEA
	.align 2, 0
_08179B60: .4byte 0x0203B9E4
_08179B64: .4byte 0x0000105E
_08179B68:
	ldr r0, _08179B84
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08179B88
	adds r0, r0, r1
	bl CreateMonSprite
	ldr r1, _08179B8C
	ldr r1, [r1]
	ldr r2, _08179B90
	adds r1, r1, r2
	strb r0, [r1]
	b _08179BEA
	.align 2, 0
_08179B84: .4byte 0x0203B968
_08179B88: .4byte 0x02024190
_08179B8C: .4byte 0x0203B9E4
_08179B90: .4byte 0x0000105D
_08179B94:
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r1, _08179BAC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08179BF2
	.align 2, 0
_08179BAC: .4byte 0x03002360
_08179BB0:
	bl LaunchPokeblockFeedTask
	b _08179BEA
_08179BB6:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r1, _08179BCC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08179BF2
	.align 2, 0
_08179BCC: .4byte 0x03002360
_08179BD0:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r2, _08179BFC
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
_08179BE8:
	strb r0, [r2, #8]
_08179BEA:
	ldr r1, _08179C00
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
_08179BF2:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08179C1C
	.align 2, 0
_08179BFC: .4byte 0x02037C74
_08179C00: .4byte 0x03002360
_08179C04:
	ldr r0, _08179C14
	bl SetVBlankCallback
	ldr r0, _08179C18
	bl SetMainCallback2
	movs r0, #1
	b _08179C1E
	.align 2, 0
_08179C14: .4byte 0x08179A3D
_08179C18: .4byte 0x08179A21
_08179C1C:
	movs r0, #0
_08179C1E:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TransitionToPokeblockFeedScene

	thumb_func_start CB2_PreparePokeblockFeedScene
CB2_PreparePokeblockFeedScene: @ 0x08179C28
	push {lr}
_08179C2A:
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08179C4E
	bl TransitionToPokeblockFeedScene
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08179C4E
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08179C2A
_08179C4E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_PreparePokeblockFeedScene

	thumb_func_start HandleInitBackgrounds
HandleInitBackgrounds: @ 0x08179C54
	push {lr}
	bl ResetVramOamAndBgCntRegs
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08179CA4
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	ldr r0, _08179CA8
	ldr r1, [r0]
	adds r1, #0x48
	movs r0, #1
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
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
_08179CA4: .4byte 0x085CD9F0
_08179CA8: .4byte 0x0203B9E4
	thumb_func_end HandleInitBackgrounds

	thumb_func_start LoadMonAndSceneGfx
LoadMonAndSceneGfx: @ 0x08179CAC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08179CD0
	ldr r0, [r0]
	ldr r1, _08179CD4
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #8
	bls _08179CC4
	b _08179E58
_08179CC4:
	lsls r0, r0, #2
	ldr r1, _08179CD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08179CD0: .4byte 0x0203B9E4
_08179CD4: .4byte 0x0000107E
_08179CD8: .4byte 0x08179CDC
_08179CDC: @ jump table
	.4byte _08179D00 @ case 0
	.4byte _08179D3C @ case 1
	.4byte _08179D7C @ case 2
	.4byte _08179D90 @ case 3
	.4byte _08179DA4 @ case 4
	.4byte _08179DB8 @ case 5
	.4byte _08179DD8 @ case 6
	.4byte _08179DFC @ case 7
	.4byte _08179E30 @ case 8
_08179D00:
	adds r0, r6, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r6, #0
	movs r1, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r0, r5, #3
	ldr r1, _08179D30
	adds r0, r0, r1
	ldr r1, _08179D34
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r2, r5, #0
	adds r3, r4, #0
	bl HandleLoadSpecialPokePic_2
	ldr r0, _08179D38
	ldr r1, [r0]
	b _08179E16
	.align 2, 0
_08179D30: .4byte 0x082DDA1C
_08179D34: .4byte 0x02024178
_08179D38: .4byte 0x0203B9E4
_08179D3C:
	adds r0, r6, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r6, #0
	movs r1, #0
	bl GetMonData
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl GetMonData
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl GetMonSpritePalStructFromOtIdPersonality
	adds r4, r0, #0
	bl LoadCompressedSpritePalette
	ldrh r0, [r4, #4]
	movs r1, #1
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _08179D78
	ldr r1, [r0]
	b _08179E16
	.align 2, 0
_08179D78: .4byte 0x0203B9E4
_08179D7C:
	ldr r0, _08179D88
	bl LoadCompressedSpriteSheet
	ldr r0, _08179D8C
	ldr r1, [r0]
	b _08179E16
	.align 2, 0
_08179D88: .4byte 0x08592140
_08179D8C: .4byte 0x0203B9E4
_08179D90:
	ldr r0, _08179D9C
	bl LoadCompressedSpritePalette
	ldr r0, _08179DA0
	ldr r1, [r0]
	b _08179E16
	.align 2, 0
_08179D9C: .4byte 0x08592148
_08179DA0: .4byte 0x0203B9E4
_08179DA4:
	ldr r0, _08179DB0
	bl LoadCompressedSpriteSheet
	ldr r0, _08179DB4
	ldr r1, [r0]
	b _08179E16
	.align 2, 0
_08179DB0: .4byte 0x085CDB40
_08179DB4: .4byte 0x0203B9E4
_08179DB8:
	ldr r0, _08179DCC
	ldrb r0, [r0]
	bl SetPokeblockSpritePal
	ldr r0, _08179DD0
	bl LoadCompressedSpritePalette
	ldr r0, _08179DD4
	ldr r1, [r0]
	b _08179E16
	.align 2, 0
_08179DCC: .4byte 0x0203CB48
_08179DD0: .4byte 0x0203B9E8
_08179DD4: .4byte 0x0203B9E4
_08179DD8:
	bl reset_temp_tile_data_buffers
	ldr r1, _08179DF4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _08179DF8
	ldr r1, [r0]
	b _08179E16
	.align 2, 0
_08179DF4: .4byte 0x08D7C4E4
_08179DF8: .4byte 0x0203B9E4
_08179DFC:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08179E58
	ldr r0, _08179E24
	ldr r4, _08179E28
	ldr r1, [r4]
	adds r1, #0x48
	bl LZDecompressVram
	ldr r1, [r4]
_08179E16:
	ldr r0, _08179E2C
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _08179E58
	.align 2, 0
_08179E24: .4byte 0x08D9BC90
_08179E28: .4byte 0x0203B9E4
_08179E2C: .4byte 0x0000107E
_08179E30:
	ldr r0, _08179E4C
	movs r1, #0x20
	movs r2, #0x60
	bl LoadCompressedPalette
	ldr r0, _08179E50
	ldr r0, [r0]
	ldr r1, _08179E54
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	movs r0, #1
	b _08179E5A
	.align 2, 0
_08179E4C: .4byte 0x08D7CA90
_08179E50: .4byte 0x0203B9E4
_08179E54: .4byte 0x0000107E
_08179E58:
	movs r0, #0
_08179E5A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end LoadMonAndSceneGfx

	thumb_func_start HandleInitWindows
HandleInitWindows: @ 0x08179E64
	push {lr}
	ldr r0, _08179E9C
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	movs r1, #1
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	ldr r0, _08179EA0
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r0}
	bx r0
	.align 2, 0
_08179E9C: .4byte 0x085CD9F8
_08179EA0: .4byte 0x085D7B04
	thumb_func_end HandleInitWindows

	thumb_func_start SetPokeblockSpritePal
SetPokeblockSpritePal: @ 0x08179EA4
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _08179ED4
	lsrs r0, r0, #0x15
	ldr r2, _08179ED8
	adds r0, r0, r2
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	movs r1, #0
	bl sub_0813700C
	lsls r0, r0, #0x18
	ldr r2, _08179EDC
	ldr r1, _08179EE0
	lsrs r0, r0, #0x16
	subs r0, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _08179EE4
	strh r0, [r2, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08179ED4: .4byte 0x03005AEC
_08179ED8: .4byte 0x00000848
_08179EDC: .4byte 0x0203B9E8
_08179EE0: .4byte 0x085CDA08
_08179EE4: .4byte 0x000039E2
	thumb_func_end SetPokeblockSpritePal

	thumb_func_start Task_HandlePokeblockFeed
Task_HandlePokeblockFeed: @ 0x08179EE8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08179F20
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08179EFC
	b _0817A00C
_08179EFC:
	ldr r0, _08179F24
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #8
	ldrsh r3, [r1, r0]
	ldr r0, _08179F28
	adds r5, r2, #0
	cmp r3, r0
	beq _08179F80
	cmp r3, r0
	bgt _08179F2C
	cmp r3, #0
	beq _08179F40
	cmp r3, #0xff
	beq _08179F64
	b _08179FBC
	.align 2, 0
_08179F20: .4byte 0x02037C74
_08179F24: .4byte 0x03005B60
_08179F28: .4byte 0x0000010D
_08179F2C:
	ldr r0, _08179F3C
	cmp r3, r0
	beq _08179F98
	adds r0, #0x10
	cmp r3, r0
	beq _08179FB0
	b _08179FBC
	.align 2, 0
_08179F3C: .4byte 0x00000119
_08179F40:
	ldr r0, _08179F58
	ldr r1, [r0]
	ldr r2, _08179F5C
	adds r1, r1, r2
	strb r3, [r1]
	ldr r0, [r0]
	ldr r1, _08179F60
	adds r0, r0, r1
	strh r3, [r0]
	bl sub_0817A484
	b _08179FBC
	.align 2, 0
_08179F58: .4byte 0x0203B9E4
_08179F5C: .4byte 0x00001050
_08179F60: .4byte 0x00001058
_08179F64:
	ldr r0, _08179F78
	ldr r0, [r0]
	ldr r2, _08179F7C
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r1, [r1, #0xa]
	bl DoPokeblockCaseThrowEffect
	b _08179FBC
	.align 2, 0
_08179F78: .4byte 0x0203B9E4
_08179F7C: .4byte 0x0000105E
_08179F80:
	bl CreatePokeblockSprite
	ldr r1, _08179F90
	ldr r1, [r1]
	ldr r2, _08179F94
	adds r1, r1, r2
	strb r0, [r1]
	b _08179FBC
	.align 2, 0
_08179F90: .4byte 0x0203B9E4
_08179F94: .4byte 0x0000105F
_08179F98:
	ldr r0, _08179FA8
	ldr r0, [r0]
	ldr r1, _08179FAC
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PrepareMonToMoveToPokeblock
	b _08179FBC
	.align 2, 0
_08179FA8: .4byte 0x0203B9E4
_08179FAC: .4byte 0x0000105D
_08179FB0:
	ldr r0, _08179FB8
	str r0, [r1]
	b _0817A00C
	.align 2, 0
_08179FB8: .4byte 0x0817A07D
_08179FBC:
	ldr r0, _08179FD8
	ldr r0, [r0]
	ldr r2, _08179FDC
	adds r1, r0, r2
	subs r2, #2
	adds r0, r0, r2
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bhs _08179FE0
	bl sub_0817A4EC
	b _08179FF0
	.align 2, 0
_08179FD8: .4byte 0x0203B9E4
_08179FDC: .4byte 0x00001058
_08179FE0:
	cmp r1, r0
	bne _08179FF0
	ldr r0, _0817A014
	adds r1, r5, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xfe
	strh r0, [r1, #8]
_08179FF0:
	ldr r0, _0817A018
	ldr r1, [r0]
	ldr r0, _0817A01C
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _0817A014
	adds r1, r5, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0817A00C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817A014: .4byte 0x03005B60
_0817A018: .4byte 0x0203B9E4
_0817A01C: .4byte 0x00001058
	thumb_func_end Task_HandlePokeblockFeed

	thumb_func_start LaunchPokeblockFeedTask
LaunchPokeblockFeedTask: @ 0x0817A020
	push {lr}
	ldr r0, _0817A044
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817A048
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #8]
	movs r0, #1
	strh r0, [r1, #0xa]
	pop {r0}
	bx r0
	.align 2, 0
_0817A044: .4byte 0x08179EE9
_0817A048: .4byte 0x03005B60
	thumb_func_end LaunchPokeblockFeedTask

	thumb_func_start Task_WaitForAtePokeblockText
Task_WaitForAtePokeblockText: @ 0x0817A04C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	bl RunTextPrintersRetIsActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _0817A06E
	ldr r0, _0817A074
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0817A078
	str r0, [r1]
_0817A06E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817A074: .4byte 0x03005B60
_0817A078: .4byte 0x0817A1D9
	thumb_func_end Task_WaitForAtePokeblockText

	thumb_func_start Task_HandleMonAtePokeblock
Task_HandleMonAtePokeblock: @ 0x0817A07C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0817A0D8
	ldrb r1, [r0]
	movs r0, #0x64
	adds r5, r1, #0
	muls r5, r0, r5
	ldr r0, _0817A0DC
	adds r5, r5, r0
	ldr r1, _0817A0E0
	ldr r0, _0817A0E4
	ldrh r0, [r0]
	lsls r0, r0, #3
	ldr r2, _0817A0E8
	adds r0, r0, r2
	ldr r4, [r1]
	adds r4, r4, r0
	adds r0, r5, #0
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_08137054
	ldr r6, _0817A0EC
	strh r0, [r6]
	ldr r1, _0817A0F0
	adds r0, r5, #0
	bl GetMonNickname
	ldr r1, _0817A0F4
	adds r0, r4, #0
	bl sub_081370B4
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0817A100
	ldr r0, _0817A0F8
	ldr r1, _0817A0FC
	bl StringExpandPlaceholders
	b _0817A120
	.align 2, 0
_0817A0D8: .4byte 0x0203B968
_0817A0DC: .4byte 0x02024190
_0817A0E0: .4byte 0x03005AEC
_0817A0E4: .4byte 0x0203CB48
_0817A0E8: .4byte 0x00000848
_0817A0EC: .4byte 0x0203B96A
_0817A0F0: .4byte 0x02021C40
_0817A0F4: .4byte 0x02021C54
_0817A0F8: .4byte 0x02021C7C
_0817A0FC: .4byte 0x085C9885
_0817A100:
	cmp r0, #0
	ble _0817A118
	ldr r0, _0817A110
	ldr r1, _0817A114
	bl StringExpandPlaceholders
	b _0817A120
	.align 2, 0
_0817A110: .4byte 0x02021C7C
_0817A114: .4byte 0x085C9894
_0817A118:
	ldr r0, _0817A164
	ldr r1, _0817A168
	bl StringExpandPlaceholders
_0817A120:
	ldr r2, _0817A16C
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	bl GetPlayerTextSpeedDelay
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _0817A164
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized2
	ldr r1, _0817A170
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0817A174
	str r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817A164: .4byte 0x02021C7C
_0817A168: .4byte 0x085C98A9
_0817A16C: .4byte 0x030030B4
_0817A170: .4byte 0x03005B60
_0817A174: .4byte 0x0817A04D
	thumb_func_end Task_HandleMonAtePokeblock

	thumb_func_start Task_ReturnAfterPaletteFade
Task_ReturnAfterPaletteFade: @ 0x0817A178
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0817A1C4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817A1BC
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0817A1C8
	ldr r1, _0817A1CC
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	ldr r0, _0817A1D0
	ldr r0, [r0, #8]
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
	bl FreeAllWindowBuffers
	ldr r0, _0817A1D4
	ldr r0, [r0]
	bl Free
	bl FreeMonSpritesGfx
_0817A1BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817A1C4: .4byte 0x02037C74
_0817A1C8: .4byte 0x030074D0
_0817A1CC: .4byte 0x0000FFFF
_0817A1D0: .4byte 0x03002360
_0817A1D4: .4byte 0x0203B9E4
	thumb_func_end Task_ReturnAfterPaletteFade

	thumb_func_start Task_PaletteFadeToReturn
Task_PaletteFadeToReturn: @ 0x0817A1D8
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
	ldr r1, _0817A208
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0817A20C
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817A208: .4byte 0x03005B60
_0817A20C: .4byte 0x0817A179
	thumb_func_end Task_PaletteFadeToReturn

	thumb_func_start CreateMonSprite
CreateMonSprite: @ 0x0817A210
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r1, #0x41
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0817A2C8
	movs r1, #0x30
	movs r2, #0x50
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0817A2CC
	mov sb, r0
	ldr r0, [r0]
	ldr r2, _0817A2D0
	adds r1, r0, r2
	strh r4, [r1]
	ldr r1, _0817A2D4
	adds r0, r0, r1
	mov r2, r8
	strb r2, [r0]
	adds r0, r5, #0
	bl GetNature
	mov r2, sb
	ldr r1, [r2]
	ldr r2, _0817A2D8
	adds r1, r1, r2
	strb r0, [r1]
	ldr r7, _0817A2DC
	mov r1, r8
	lsls r0, r1, #4
	add r0, r8
	lsls r5, r0, #2
	adds r6, r5, r7
	strh r4, [r6, #0x32]
	adds r0, r7, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0817A2E0
	str r1, [r0]
	mov r2, sb
	ldr r0, [r2]
	ldr r1, _0817A2E4
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	adds r0, r4, #0
	bl IsMonSpriteNotFlipped
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0817A2BA
	adds r0, r7, #0
	adds r0, #0x10
	adds r0, r5, r0
	ldr r1, _0817A2E8
	str r1, [r0]
	ldrb r3, [r6, #1]
	movs r0, #3
	orrs r3, r0
	strb r3, [r6, #1]
	lsrs r1, r3, #6
	ldrb r2, [r6, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r0, r6, #0
	bl CalcCenterToCornerVec
	mov r2, sb
	ldr r0, [r2]
	ldr r1, _0817A2E4
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_0817A2BA:
	mov r0, r8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0817A2C8: .4byte 0x02024640
_0817A2CC: .4byte 0x0203B9E4
_0817A2D0: .4byte 0x00001054
_0817A2D4: .4byte 0x0000105B
_0817A2D8: .4byte 0x0000105A
_0817A2DC: .4byte 0x020205AC
_0817A2E0: .4byte 0x08007141
_0817A2E4: .4byte 0x00001053
_0817A2E8: .4byte 0x085CDA50
	thumb_func_end CreateMonSprite

	thumb_func_start PrepareMonToMoveToPokeblock
PrepareMonToMoveToPokeblock: @ 0x0817A2EC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0817A314
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r3
	movs r0, #0x30
	strh r0, [r2, #0x20]
	movs r0, #0x50
	strh r0, [r2, #0x22]
	ldr r0, _0817A318
	strh r0, [r2, #0x2e]
	movs r0, #1
	strh r0, [r2, #0x30]
	adds r3, #0x1c
	adds r1, r1, r3
	ldr r0, _0817A31C
	str r0, [r1]
	bx lr
	.align 2, 0
_0817A314: .4byte 0x020205AC
_0817A318: .4byte 0x0000FFF8
_0817A31C: .4byte 0x0817A321
	thumb_func_end PrepareMonToMoveToPokeblock

	thumb_func_start sub_0817A320
sub_0817A320: @ 0x0817A320
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x20]
	adds r0, #4
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x2e]
	ldrh r2, [r4, #0x22]
	adds r1, r0, r2
	strh r1, [r4, #0x22]
	ldrh r1, [r4, #0x30]
	adds r0, r0, r1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0817A346
	ldrh r0, [r4, #0x32]
	movs r1, #0
	bl PlayCry1
_0817A346:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bne _0817A352
	ldr r0, _0817A358
	str r0, [r4, #0x1c]
_0817A352:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817A358: .4byte 0x08007141
	thumb_func_end sub_0817A320

	thumb_func_start CreatePokeblockCaseSpriteForFeeding
CreatePokeblockCaseSpriteForFeeding: @ 0x0817A35C
	push {r4, r5, lr}
	movs r0, #0xbc
	movs r1, #0x64
	movs r2, #2
	bl sub_08136484
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0817A3A4
	lsls r3, r4, #4
	adds r3, r3, r4
	lsls r3, r3, #2
	adds r0, r3, r5
	ldrb r2, [r0, #1]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #1]
	adds r1, r5, #0
	adds r1, #0x10
	adds r1, r3, r1
	ldr r2, _0817A3A8
	str r2, [r1]
	adds r5, #0x1c
	adds r3, r3, r5
	ldr r1, _0817A3AC
	str r1, [r3]
	bl InitSpriteAffineAnim
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0817A3A4: .4byte 0x020205AC
_0817A3A8: .4byte 0x085CDB04
_0817A3AC: .4byte 0x08007141
	thumb_func_end CreatePokeblockCaseSpriteForFeeding

	thumb_func_start DoPokeblockCaseThrowEffect
DoPokeblockCaseThrowEffect: @ 0x0817A3B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0817A3F0
	mov r8, r0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r6, r0, #2
	mov r0, r8
	adds r4, r6, r0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r0, [r4, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #1]
	cmp r5, #0
	bne _0817A3F8
	mov r0, r8
	adds r0, #0x10
	adds r0, r6, r0
	ldr r1, _0817A3F4
	b _0817A400
	.align 2, 0
_0817A3F0: .4byte 0x020205AC
_0817A3F4: .4byte 0x085CDB08
_0817A3F8:
	mov r0, r8
	adds r0, #0x10
	adds r0, r6, r0
	ldr r1, _0817A41C
_0817A400:
	str r1, [r0]
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _0817A420
	adds r0, r0, r1
	bl InitSpriteAffineAnim
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817A41C: .4byte 0x085CDB0C
_0817A420: .4byte 0x020205AC
	thumb_func_end DoPokeblockCaseThrowEffect

	thumb_func_start CreatePokeblockSprite
CreatePokeblockSprite: @ 0x0817A424
	push {lr}
	ldr r0, _0817A44C
	movs r1, #0xae
	movs r2, #0x54
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817A450
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, _0817A454
	strh r2, [r1, #0x2e]
	movs r2, #1
	strh r2, [r1, #0x30]
	pop {r1}
	bx r1
	.align 2, 0
_0817A44C: .4byte 0x085CDB48
_0817A450: .4byte 0x020205AC
_0817A454: .4byte 0x0000FFF4
	thumb_func_end CreatePokeblockSprite

	thumb_func_start SpriteCB_ThrownPokeblock
SpriteCB_ThrownPokeblock: @ 0x0817A458
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x20]
	subs r0, #4
	strh r0, [r2, #0x20]
	ldrh r0, [r2, #0x2e]
	ldrh r3, [r2, #0x22]
	adds r1, r0, r3
	strh r1, [r2, #0x22]
	ldrh r1, [r2, #0x30]
	adds r0, r0, r1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _0817A47E
	adds r0, r2, #0
	bl DestroySprite
_0817A47E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_ThrownPokeblock

	thumb_func_start sub_0817A484
sub_0817A484: @ 0x0817A484
	push {r4, r5, r6, r7, lr}
	ldr r0, _0817A4D8
	ldr r1, [r0]
	ldr r0, _0817A4DC
	adds r3, r1, r0
	movs r0, #1
	strh r0, [r3]
	ldr r2, _0817A4E0
	ldr r7, _0817A4E4
	adds r1, r1, r7
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	movs r4, #0
	ldr r5, _0817A4E8
	adds r6, r5, #0
	subs r6, #0xa
_0817A4A8:
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r0, r1, r6
	ldrh r0, [r0]
	ldrh r7, [r3]
	adds r0, r0, r7
	strh r0, [r3]
	adds r1, r1, r5
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r0, #1
	beq _0817A4D2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r4, #7
	bls _0817A4A8
_0817A4D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817A4D8: .4byte 0x0203B9E4
_0817A4DC: .4byte 0x00001056
_0817A4E0: .4byte 0x085CD35C
_0817A4E4: .4byte 0x0000105A
_0817A4E8: .4byte 0x085CD3A0
	thumb_func_end sub_0817A484

	thumb_func_start sub_0817A4EC
sub_0817A4EC: @ 0x0817A4EC
	push {r4, lr}
	ldr r0, _0817A508
	ldr r4, [r0]
	ldr r1, _0817A50C
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0x5a
	bls _0817A4FE
	b _0817A7C6
_0817A4FE:
	lsls r0, r0, #2
	ldr r1, _0817A510
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0817A508: .4byte 0x0203B9E4
_0817A50C: .4byte 0x00001050
_0817A510: .4byte 0x0817A514
_0817A514: @ jump table
	.4byte _0817A680 @ case 0
	.4byte _0817A7C6 @ case 1
	.4byte _0817A7C6 @ case 2
	.4byte _0817A7C6 @ case 3
	.4byte _0817A7C6 @ case 4
	.4byte _0817A7C6 @ case 5
	.4byte _0817A7C6 @ case 6
	.4byte _0817A7C6 @ case 7
	.4byte _0817A7C6 @ case 8
	.4byte _0817A7C6 @ case 9
	.4byte _0817A6D0 @ case 10
	.4byte _0817A7C6 @ case 11
	.4byte _0817A7C6 @ case 12
	.4byte _0817A7C6 @ case 13
	.4byte _0817A7C6 @ case 14
	.4byte _0817A7C6 @ case 15
	.4byte _0817A7C6 @ case 16
	.4byte _0817A7C6 @ case 17
	.4byte _0817A7C6 @ case 18
	.4byte _0817A7C6 @ case 19
	.4byte _0817A7C6 @ case 20
	.4byte _0817A7C6 @ case 21
	.4byte _0817A7C6 @ case 22
	.4byte _0817A7C6 @ case 23
	.4byte _0817A7C6 @ case 24
	.4byte _0817A7C6 @ case 25
	.4byte _0817A7C6 @ case 26
	.4byte _0817A7C6 @ case 27
	.4byte _0817A7C6 @ case 28
	.4byte _0817A7C6 @ case 29
	.4byte _0817A7C6 @ case 30
	.4byte _0817A7C6 @ case 31
	.4byte _0817A7C6 @ case 32
	.4byte _0817A7C6 @ case 33
	.4byte _0817A7C6 @ case 34
	.4byte _0817A7C6 @ case 35
	.4byte _0817A7C6 @ case 36
	.4byte _0817A7C6 @ case 37
	.4byte _0817A7C6 @ case 38
	.4byte _0817A7C6 @ case 39
	.4byte _0817A7C6 @ case 40
	.4byte _0817A7C6 @ case 41
	.4byte _0817A7C6 @ case 42
	.4byte _0817A7C6 @ case 43
	.4byte _0817A7C6 @ case 44
	.4byte _0817A7C6 @ case 45
	.4byte _0817A7C6 @ case 46
	.4byte _0817A7C6 @ case 47
	.4byte _0817A7C6 @ case 48
	.4byte _0817A7C6 @ case 49
	.4byte _0817A710 @ case 50
	.4byte _0817A7C6 @ case 51
	.4byte _0817A7C6 @ case 52
	.4byte _0817A7C6 @ case 53
	.4byte _0817A7C6 @ case 54
	.4byte _0817A7C6 @ case 55
	.4byte _0817A7C6 @ case 56
	.4byte _0817A7C6 @ case 57
	.4byte _0817A7C6 @ case 58
	.4byte _0817A7C6 @ case 59
	.4byte _0817A75A @ case 60
	.4byte _0817A7C6 @ case 61
	.4byte _0817A7C6 @ case 62
	.4byte _0817A7C6 @ case 63
	.4byte _0817A7C6 @ case 64
	.4byte _0817A7C6 @ case 65
	.4byte _0817A7C6 @ case 66
	.4byte _0817A7C6 @ case 67
	.4byte _0817A7C6 @ case 68
	.4byte _0817A7C6 @ case 69
	.4byte _0817A7B4 @ case 70
	.4byte _0817A7C6 @ case 71
	.4byte _0817A7C6 @ case 72
	.4byte _0817A7C6 @ case 73
	.4byte _0817A7C6 @ case 74
	.4byte _0817A7C6 @ case 75
	.4byte _0817A7C6 @ case 76
	.4byte _0817A7C6 @ case 77
	.4byte _0817A7C6 @ case 78
	.4byte _0817A7C6 @ case 79
	.4byte _0817A7C6 @ case 80
	.4byte _0817A7C6 @ case 81
	.4byte _0817A7C6 @ case 82
	.4byte _0817A7C6 @ case 83
	.4byte _0817A7C6 @ case 84
	.4byte _0817A7C6 @ case 85
	.4byte _0817A7C6 @ case 86
	.4byte _0817A7C6 @ case 87
	.4byte _0817A7C6 @ case 88
	.4byte _0817A7C6 @ case 89
	.4byte _0817A7C6 @ case 90
_0817A680:
	ldr r1, _0817A6B8
	ldr r2, _0817A6BC
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r3, _0817A6C0
	adds r0, r4, r3
	strb r1, [r0]
	ldr r1, _0817A6C4
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0817A6C8
	adds r1, r1, r0
	adds r0, r4, #0
	stm r0!, {r1}
	movs r2, #0x44
	bl memcpy
	ldr r2, _0817A6CC
	adds r1, r4, r2
	movs r0, #0xa
	strb r0, [r1]
	b _0817A7C6
	.align 2, 0
_0817A6B8: .4byte 0x085CD35C
_0817A6BC: .4byte 0x0000105A
_0817A6C0: .4byte 0x00001051
_0817A6C4: .4byte 0x0000105B
_0817A6C8: .4byte 0x020205AC
_0817A6CC: .4byte 0x00001050
_0817A6D0:
	bl sub_0817A7D4
	ldr r1, _0817A73C
	ldr r3, _0817A740
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0817A708
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r2, [r4]
	ldrb r1, [r2, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #3]
	ldr r0, [r4]
	ldr r1, _0817A744
	str r1, [r0, #0x10]
	bl InitSpriteAffineAnim
_0817A708:
	ldr r0, _0817A748
	adds r1, r4, r0
	movs r0, #0x32
	strb r0, [r1]
_0817A710:
	ldr r1, _0817A73C
	ldr r2, _0817A740
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #1
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, #0
	beq _0817A780
	ldr r3, _0817A74C
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0817A750
	ldr r0, [r4]
	adds r1, #0xa
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAffineAnim
	b _0817A780
	.align 2, 0
_0817A73C: .4byte 0x085CD35C
_0817A740: .4byte 0x0000105A
_0817A744: .4byte 0x085CD99C
_0817A748: .4byte 0x00001050
_0817A74C: .4byte 0x00001053
_0817A750:
	ldr r0, [r4]
	ldrb r1, [r2]
	bl StartSpriteAffineAnim
	b _0817A780
_0817A75A:
	bl sub_0817A89C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0817A7C6
	ldr r1, _0817A78C
	adds r0, r4, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0817A798
	ldr r3, _0817A790
	adds r1, r4, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_0817A7D4
_0817A780:
	ldr r0, _0817A794
	adds r1, r4, r0
	movs r0, #0x3c
	strb r0, [r1]
	b _0817A7C6
	.align 2, 0
_0817A78C: .4byte 0x00001072
_0817A790: .4byte 0x00001051
_0817A794: .4byte 0x00001050
_0817A798:
	ldr r0, [r4]
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldr r2, _0817A7B0
	adds r1, r4, r2
	movs r0, #0x46
	strb r0, [r1]
	b _0817A7C6
	.align 2, 0
_0817A7B0: .4byte 0x00001050
_0817A7B4:
	bl FreeMonSpriteOamMatrix
	ldr r3, _0817A7CC
	adds r0, r4, r3
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0817A7D0
	adds r0, r4, r2
	strb r1, [r0]
_0817A7C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817A7CC: .4byte 0x00001051
_0817A7D0: .4byte 0x00001050
	thumb_func_end sub_0817A4EC

	thumb_func_start sub_0817A7D4
sub_0817A7D4: @ 0x0817A7D4
	push {r4, r5, r6, r7, lr}
	ldr r0, _0817A878
	ldr r5, [r0]
	movs r4, #0
	movs r0, #0x83
	lsls r0, r0, #5
	adds r7, r5, r0
	ldr r1, _0817A87C
	mov ip, r1
	ldr r2, _0817A880
	adds r6, r5, r2
_0817A7EA:
	lsls r2, r4, #1
	adds r3, r7, r2
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	add r2, ip
	ldrh r0, [r2]
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _0817A7EA
	ldr r0, _0817A884
	adds r6, r5, r0
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _0817A894
	movs r2, #0x83
	lsls r2, r2, #5
	adds r4, r5, r2
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r2, #4
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl Sin
	ldr r2, _0817A888
	adds r1, r5, r2
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r4, r1]
	subs r2, #0xe
	adds r1, r5, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl Cos
	ldr r2, _0817A88C
	adds r1, r5, r2
	strh r0, [r1]
	ldrh r0, [r6]
	ldr r1, _0817A890
	adds r4, r5, r1
	strh r0, [r4]
	ldr r0, [r5]
	ldrh r1, [r0, #0x24]
	adds r2, #4
	adds r0, r5, r2
	strh r1, [r0]
	ldr r0, [r5]
	ldrh r1, [r0, #0x26]
	adds r2, #2
	adds r0, r5, r2
	strh r1, [r0]
	bl sub_0817AA20
	ldrh r0, [r4]
	strh r0, [r6]
	bl sub_0817A90C
	ldrh r0, [r4]
	strh r0, [r6]
	movs r0, #0
	b _0817A896
	.align 2, 0
_0817A878: .4byte 0x0203B9E4
_0817A87C: .4byte 0x085CD38E
_0817A880: .4byte 0x00001051
_0817A884: .4byte 0x00001068
_0817A888: .4byte 0x00001074
_0817A88C: .4byte 0x00001076
_0817A890: .4byte 0x00001078
_0817A894:
	movs r0, #1
_0817A896:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0817A7D4

	thumb_func_start sub_0817A89C
sub_0817A89C: @ 0x0817A89C
	push {r4, r5, lr}
	ldr r0, _0817A8E0
	ldr r2, [r0]
	ldr r1, _0817A8E4
	adds r0, r2, r1
	ldr r5, _0817A8E8
	adds r4, r2, r5
	ldrh r1, [r0]
	ldrh r0, [r4]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, [r2]
	lsrs r1, r1, #0xf
	movs r5, #0x85
	lsls r5, r5, #4
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x24]
	ldr r3, [r2]
	movs r0, #0xc5
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	strh r0, [r3, #0x26]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0817A8EC
	movs r0, #0
	b _0817A8EE
	.align 2, 0
_0817A8E0: .4byte 0x0203B9E4
_0817A8E4: .4byte 0x00001078
_0817A8E8: .4byte 0x00001068
_0817A8EC:
	movs r0, #1
_0817A8EE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0817A89C

	thumb_func_start FreeMonSpriteOamMatrix
FreeMonSpriteOamMatrix: @ 0x0817A8F4
	push {lr}
	ldr r0, _0817A908
	ldr r0, [r0]
	ldr r0, [r0]
	bl FreeSpriteOamMatrix
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0817A908: .4byte 0x0203B9E4
	thumb_func_end FreeMonSpriteOamMatrix

	thumb_func_start sub_0817A90C
sub_0817A90C: @ 0x0817A90C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0817AA0C
	ldr r7, [r0]
	ldr r1, _0817AA10
	adds r0, r7, r1
	ldrh r0, [r0]
	mov sb, r0
	ldr r2, _0817AA14
	adds r0, r7, r2
	ldrh r0, [r0]
	mov r3, sb
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r4, _0817AA18
	adds r1, r7, r4
	subs r2, #0xc
	adds r0, r7, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r3, _0817AA1C
	adds r1, r7, r3
	subs r4, #0xc
	adds r0, r7, r4
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r5, #0
	mov r0, r8
	subs r0, #1
	cmp r5, r0
	bge _0817A9D8
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0817A976:
	mov r3, sb
	adds r0, r3, r5
	lsls r0, r0, #1
	movs r4, #0x85
	lsls r4, r4, #4
	adds r2, r7, r4
	adds r2, r2, r0
	ldrh r6, [r2]
	ldr r3, [sp, #8]
	subs r1, r6, r3
	movs r4, #0xc5
	lsls r4, r4, #4
	adds r3, r7, r4
	adds r3, r3, r0
	ldrh r4, [r3]
	mov r0, sl
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r5, #1
	adds r0, r1, #0
	muls r0, r5, r0
	mov r1, r8
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl __divsi3
	subs r6, r6, r0
	ldr r2, [sp, #0xc]
	strh r6, [r2]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	muls r0, r5, r0
	mov r1, r8
	bl __divsi3
	ldr r3, [sp, #0x10]
	ldrh r1, [r3]
	subs r1, r1, r0
	strh r1, [r3]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	subs r0, #1
	cmp r5, r0
	blt _0817A976
_0817A9D8:
	mov r0, sb
	add r0, r8
	subs r0, #1
	lsls r0, r0, #1
	movs r2, #0x85
	lsls r2, r2, #4
	adds r1, r7, r2
	adds r1, r1, r0
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r1]
	movs r4, #0xc5
	lsls r4, r4, #4
	adds r1, r7, r4
	adds r1, r1, r0
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817AA0C: .4byte 0x0203B9E4
_0817AA10: .4byte 0x00001070
_0817AA14: .4byte 0x00001078
_0817AA18: .4byte 0x0000107A
_0817AA1C: .4byte 0x0000107C
	thumb_func_end sub_0817A90C

	thumb_func_start sub_0817AA20
sub_0817AA20: @ 0x0817AA20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0817AAE4
	ldr r6, [r0]
	movs r0, #0
	str r0, [sp]
	ldr r1, _0817AAE8
	adds r0, r6, r1
	ldr r2, _0817AAEC
	adds r1, r6, r2
	ldrh r2, [r0]
	ldrh r0, [r1]
	subs r2, r2, r0
	ldr r3, _0817AAF0
	adds r0, r6, r3
	ldr r1, _0817AAF4
	adds r3, r6, r1
	ldrh r1, [r0]
	ldrh r0, [r3]
	subs r1, r1, r0
	ldr r3, _0817AAF8
	adds r3, r3, r6
	mov sb, r3
	movs r0, #0x83
	lsls r0, r0, #5
	adds r0, r0, r6
	mov r8, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov sl, r1
_0817AA6A:
	ldr r1, _0817AAFC
	adds r0, r6, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0817AA78
	rsbs r0, r0, #0
_0817AA78:
	lsls r0, r0, #0x10
	ldr r3, _0817AB00
	adds r7, r6, r3
	lsrs r0, r0, #0x10
	ldrh r1, [r7]
	adds r0, r0, r1
	lsls r4, r0, #0x10
	strh r0, [r7]
	ldr r2, _0817AB04
	adds r0, r6, r2
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0817AA9A
	movs r0, #1
	str r0, [sp]
_0817AA9A:
	ldr r1, _0817AB08
	adds r0, r6, r1
	ldrh r0, [r0]
	mov r3, sb
	ldrh r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r1, #0
	beq _0817AB70
	ldr r0, [sp]
	cmp r0, #0
	bne _0817AB0C
	mov r1, r8
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsrs r4, r4, #0x18
	adds r1, r2, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Sin
	lsls r5, r5, #1
	movs r2, #0x85
	lsls r2, r2, #4
	adds r1, r6, r2
	adds r1, r1, r5
	ldr r3, [sp, #4]
	adds r0, r3, r0
	strh r0, [r1]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldrh r1, [r7]
	adds r1, r1, r4
	b _0817AB38
	.align 2, 0
_0817AAE4: .4byte 0x0203B9E4
_0817AAE8: .4byte 0x0000107A
_0817AAEC: .4byte 0x00001074
_0817AAF0: .4byte 0x0000107C
_0817AAF4: .4byte 0x00001076
_0817AAF8: .4byte 0x00001068
_0817AAFC: .4byte 0x0000106A
_0817AB00: .4byte 0x00001066
_0817AB04: .4byte 0x00001064
_0817AB08: .4byte 0x00001078
_0817AB0C:
	mov r1, r8
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsrs r4, r4, #0x18
	subs r1, r2, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Sin
	lsls r5, r5, #1
	movs r2, #0x85
	lsls r2, r2, #4
	adds r1, r6, r2
	adds r1, r1, r5
	ldr r3, [sp, #4]
	adds r0, r3, r0
	strh r0, [r1]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldrh r1, [r7]
	subs r1, r1, r4
_0817AB38:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Cos
	movs r3, #0xc5
	lsls r3, r3, #4
	adds r1, r6, r3
	adds r1, r1, r5
	add r0, sl
	strh r0, [r1]
	ldr r1, _0817AB6C
	adds r0, r6, r1
	ldrh r0, [r0]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r0, r2
	movs r1, #0xff
	ands r0, r1
	mov r3, r8
	strh r0, [r3]
	mov r1, sb
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	b _0817AA6A
	.align 2, 0
_0817AB6C: .4byte 0x00001062
_0817AB70:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0817AA20

