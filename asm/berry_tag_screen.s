.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DoBerryTagScreen
DoBerryTagScreen: @ 0x08177AFC
	push {r4, lr}
	ldr r4, _08177B2C
	ldr r0, _08177B30
	bl AllocZeroed
	str r0, [r4]
	ldr r0, _08177B34
	ldrh r0, [r0]
	bl ItemIdToBerryType
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r1, r2
	strh r0, [r1]
	ldr r0, _08177B38
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08177B2C: .4byte 0x0203B9C0
_08177B30: .4byte 0x0000180C
_08177B34: .4byte 0x0203CB48
_08177B38: .4byte 0x08177B6D
	thumb_func_end DoBerryTagScreen

	thumb_func_start CB2_BerryTagScreen
CB2_BerryTagScreen: @ 0x08177B3C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_BerryTagScreen

	thumb_func_start VblankCB
VblankCB: @ 0x08177B58
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VblankCB

	thumb_func_start CB2_InitBerryTagScreen
CB2_InitBerryTagScreen: @ 0x08177B6C
	push {lr}
_08177B6E:
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08177B92
	bl InitBerryTagScreen
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08177B92
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08177B6E
_08177B92:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_InitBerryTagScreen

	thumb_func_start InitBerryTagScreen
InitBerryTagScreen: @ 0x08177B98
	push {lr}
	sub sp, #4
	ldr r0, _08177BB8
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xf
	bls _08177BAC
	b _08177CDC
_08177BAC:
	lsls r0, r0, #2
	ldr r1, _08177BBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08177BB8: .4byte 0x03002360
_08177BBC: .4byte 0x08177BC0
_08177BC0: @ jump table
	.4byte _08177C00 @ case 0
	.4byte _08177C0E @ case 1
	.4byte _08177C14 @ case 2
	.4byte _08177C28 @ case 3
	.4byte _08177C2E @ case 4
	.4byte _08177C34 @ case 5
	.4byte _08177C44 @ case 6
	.4byte _08177C60 @ case 7
	.4byte _08177C6C @ case 8
	.4byte _08177C72 @ case 9
	.4byte _08177C78 @ case 10
	.4byte _08177C7E @ case 11
	.4byte _08177C84 @ case 12
	.4byte _08177C8E @ case 13
	.4byte _08177C9C @ case 14
	.4byte _08177CAA @ case 15
_08177C00:
	bl SetVBlankHBlankCallbacksToNull
	bl ResetVramOamAndBgCntRegs
	bl clear_scheduled_bg_copies_to_vram
	b _08177CC4
_08177C0E:
	bl ScanlineEffect_Stop
	b _08177CC4
_08177C14:
	bl ResetPaletteFade
	ldr r2, _08177C24
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	b _08177CC2
	.align 2, 0
_08177C24: .4byte 0x02037C74
_08177C28:
	bl ResetSpriteData
	b _08177CC4
_08177C2E:
	bl FreeAllSpritePalettes
	b _08177CC4
_08177C34:
	bl sub_081221B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08177CC4
	bl ResetTasks
	b _08177CC4
_08177C44:
	bl AddBerryTagTextToBg0
	ldr r0, _08177C58
	ldr r0, [r0]
	ldr r1, _08177C5C
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _08177CC4
	.align 2, 0
_08177C58: .4byte 0x0203B9C0
_08177C5C: .4byte 0x00001808
_08177C60:
	bl LoadBerryTagGfx
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08177CF4
	b _08177CC4
_08177C6C:
	bl PrintMysteryMenuText
	b _08177CC4
_08177C72:
	bl PrintBerrySize
	b _08177CC4
_08177C78:
	bl PrintAllBerryData
	b _08177CC4
_08177C7E:
	bl CreateBerrySprite
	b _08177CC4
_08177C84:
	bl CreateFlavorCircleSprites
	bl SetFlavorCirclesVisiblity
	b _08177CC4
_08177C8E:
	ldr r0, _08177C98
	movs r1, #0
	bl CreateTask
	b _08177CC4
	.align 2, 0
_08177C98: .4byte 0x0817850D
_08177C9C:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	b _08177CC4
_08177CAA:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r2, _08177CD4
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
_08177CC2:
	strb r0, [r2, #8]
_08177CC4:
	ldr r1, _08177CD8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08177CF4
	.align 2, 0
_08177CD4: .4byte 0x02037C74
_08177CD8: .4byte 0x03002360
_08177CDC:
	ldr r0, _08177CEC
	bl SetVBlankCallback
	ldr r0, _08177CF0
	bl SetMainCallback2
	movs r0, #1
	b _08177CF6
	.align 2, 0
_08177CEC: .4byte 0x08177B59
_08177CF0: .4byte 0x08177B3D
_08177CF4:
	movs r0, #0
_08177CF6:
	add sp, #4
	pop {r1}
	bx r1
	thumb_func_end InitBerryTagScreen

	thumb_func_start AddBerryTagTextToBg0
AddBerryTagTextToBg0: @ 0x08177CFC
	push {r4, lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08177D68
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r4, _08177D6C
	ldr r1, [r4]
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r1, r0
	movs r0, #3
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
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
_08177D68: .4byte 0x085CD068
_08177D6C: .4byte 0x0203B9C0
	thumb_func_end AddBerryTagTextToBg0

	thumb_func_start LoadBerryTagGfx
LoadBerryTagGfx: @ 0x08177D70
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _08177D90
	ldr r0, [r1]
	ldr r2, _08177D94
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r7, r1, #0
	cmp r0, #5
	bls _08177D86
	b _08177ED4
_08177D86:
	lsls r0, r0, #2
	ldr r1, _08177D98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08177D90: .4byte 0x0203B9C0
_08177D94: .4byte 0x00001808
_08177D98: .4byte 0x08177D9C
_08177D9C: @ jump table
	.4byte _08177DB4 @ case 0
	.4byte _08177DE0 @ case 1
	.4byte _08177E04 @ case 2
	.4byte _08177E24 @ case 3
	.4byte _08177E90 @ case 4
	.4byte _08177EB0 @ case 5
_08177DB4:
	bl reset_temp_tile_data_buffers
	ldr r1, _08177DD4
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _08177DD8
	ldr r1, [r0]
	ldr r0, _08177DDC
	adds r1, r1, r0
	b _08177EBE
	.align 2, 0
_08177DD4: .4byte 0x08D9BD90
_08177DD8: .4byte 0x0203B9C0
_08177DDC: .4byte 0x00001808
_08177DE0:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08177DEE
	b _08177EE4
_08177DEE:
	ldr r0, _08177DFC
	ldr r4, _08177E00
	ldr r1, [r4]
	bl LZDecompressVram
	ldr r1, [r4]
	b _08177EBA
	.align 2, 0
_08177DFC: .4byte 0x08D9C254
_08177E00: .4byte 0x0203B9C0
_08177E04:
	ldr r0, _08177E1C
	ldr r1, [r7]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r1, [r7]
	ldr r0, _08177E20
	adds r1, r1, r0
	b _08177EBE
	.align 2, 0
_08177E1C: .4byte 0x08D9C3E4
_08177E20: .4byte 0x00001808
_08177E24:
	ldr r0, _08177E50
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08177E60
	movs r2, #0
	ldr r6, _08177E54
	movs r5, #0x80
	lsls r5, r5, #4
	ldr r4, _08177E58
	ldr r3, _08177E5C
_08177E3A:
	ldr r0, [r6]
	lsls r1, r2, #1
	adds r0, r0, r5
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	bls _08177E3A
	b _08177E80
	.align 2, 0
_08177E50: .4byte 0x03005AF0
_08177E54: .4byte 0x0203B9C0
_08177E58: .4byte 0x00004042
_08177E5C: .4byte 0x000003FF
_08177E60:
	movs r2, #0
	ldr r6, _08177E84
	movs r5, #0x80
	lsls r5, r5, #4
	ldr r4, _08177E88
	ldr r3, _08177E8C
_08177E6C:
	ldr r0, [r6]
	lsls r1, r2, #1
	adds r0, r0, r5
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	bls _08177E6C
_08177E80:
	ldr r1, [r7]
	b _08177EBA
	.align 2, 0
_08177E84: .4byte 0x0203B9C0
_08177E88: .4byte 0x00005042
_08177E8C: .4byte 0x000003FF
_08177E90:
	ldr r0, _08177EA4
	movs r1, #0
	movs r2, #0xc0
	bl LoadCompressedPalette
	ldr r0, _08177EA8
	ldr r1, [r0]
	ldr r0, _08177EAC
	adds r1, r1, r0
	b _08177EBE
	.align 2, 0
_08177EA4: .4byte 0x08D9C1AC
_08177EA8: .4byte 0x0203B9C0
_08177EAC: .4byte 0x00001808
_08177EB0:
	ldr r0, _08177EC8
	bl LoadCompressedSpriteSheet
	ldr r0, _08177ECC
	ldr r1, [r0]
_08177EBA:
	ldr r2, _08177ED0
	adds r1, r1, r2
_08177EBE:
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _08177EE4
	.align 2, 0
_08177EC8: .4byte 0x0855A91C
_08177ECC: .4byte 0x0203B9C0
_08177ED0: .4byte 0x00001808
_08177ED4:
	ldr r0, _08177EE0
	bl LoadCompressedSpritePalette
	movs r0, #1
	b _08177EE6
	.align 2, 0
_08177EE0: .4byte 0x0855A924
_08177EE4:
	movs r0, #0
_08177EE6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end LoadBerryTagGfx

	thumb_func_start PrintMysteryMenuText
PrintMysteryMenuText: @ 0x08177EF0
	push {r4, lr}
	ldr r0, _08177F2C
	bl InitWindows
	bl DeactivateAllTextPrinters
	ldr r0, _08177F30
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r4, #0
_08177F08:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _08177F08
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08177F2C: .4byte 0x085CD0A0
_08177F30: .4byte 0x085CD078
	thumb_func_end PrintMysteryMenuText

	thumb_func_start PrintTextInBerryTagScreen
PrintTextInBerryTagScreen: @ 0x08177F34
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r6, [sp, #0x24]
	ldr r5, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	lsls r4, r5, #1
	adds r4, r4, r5
	ldr r5, _08177F74
	adds r4, r4, r5
	str r4, [sp, #8]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #1
	bl AddTextPrinterParameterized4
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08177F74: .4byte 0x085CD098
	thumb_func_end PrintTextInBerryTagScreen

	thumb_func_start PrintBerrySize
PrintBerrySize: @ 0x08177F78
	push {lr}
	sub sp, #8
	movs r0, #0
	bl GetBgTilemapBuffer
	ldr r1, _08177FC4
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl memcpy
	movs r0, #3
	movs r1, #0xff
	bl FillWindowPixelBuffer
	ldr r1, _08177FC8
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #3
	movs r2, #0
	movs r3, #2
	bl PrintTextInBerryTagScreen
	movs r0, #3
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08177FC4: .4byte 0x0203B9C0
_08177FC8: .4byte 0x085C97BD
	thumb_func_end PrintBerrySize

	thumb_func_start PrintAllBerryData
PrintAllBerryData: @ 0x08177FCC
	push {lr}
	bl PrintBerryNumberAndName
	bl sub_0817804C
	bl PrintBerryFirmness
	bl PrintBerryDescription1
	bl PrintBerryDescription2
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PrintAllBerryData

	thumb_func_start PrintBerryNumberAndName
PrintBerryNumberAndName: @ 0x08177FE8
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _08178038
	ldr r0, [r5]
	movs r4, #0xc0
	lsls r4, r4, #5
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetBerryInfo
	adds r6, r0, #0
	ldr r0, _0817803C
	ldr r1, [r5]
	adds r1, r1, r4
	ldrh r1, [r1]
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _08178040
	adds r1, r6, #0
	bl StringCopy
	ldr r4, _08178044
	ldr r1, _08178048
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl PrintTextInBerryTagScreen
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08178038: .4byte 0x0203B9C0
_0817803C: .4byte 0x02021C40
_08178040: .4byte 0x02021C54
_08178044: .4byte 0x02021C7C
_08178048: .4byte 0x085C97B5
	thumb_func_end PrintBerryNumberAndName

	thumb_func_start sub_0817804C
sub_0817804C: @ 0x0817804C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _081780D0
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetBerryInfo
	adds r5, r0, #0
	ldr r2, _081780D4
	movs r7, #2
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r6, #0
	str r6, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _081780E8
	ldr r4, _081780D8
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081780DC
	ldrh r0, [r5, #8]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081780E0
	ldr r1, _081780E4
	adds r0, r4, #0
	bl StringExpandPlaceholders
	str r7, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	movs r0, #1
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x28
	bl AddTextPrinterParameterized
	b _081780FA
	.align 2, 0
_081780D0: .4byte 0x0203B9C0
_081780D4: .4byte 0x085C977D
_081780D8: .4byte 0x02021C40
_081780DC: .4byte 0x02021C54
_081780E0: .4byte 0x02021C7C
_081780E4: .4byte 0x085C9786
_081780E8:
	ldr r2, _08178104
	str r7, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0x28
	bl AddTextPrinterParameterized
_081780FA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08178104: .4byte 0x085C93F5
	thumb_func_end sub_0817804C

	thumb_func_start PrintBerryFirmness
PrintBerryFirmness: @ 0x08178108
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0817815C
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetBerryInfo
	adds r6, r0, #0
	ldr r2, _08178160
	movs r5, #0x12
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrb r0, [r6, #7]
	cmp r0, #0
	beq _08178168
	ldr r0, _08178164
	ldrb r1, [r6, #7]
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	str r5, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0x28
	bl AddTextPrinterParameterized
	b _0817817A
	.align 2, 0
_0817815C: .4byte 0x0203B9C0
_08178160: .4byte 0x085C9782
_08178164: .4byte 0x085CD0C8
_08178168:
	ldr r2, _08178184
	str r5, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0x28
	bl AddTextPrinterParameterized
_0817817A:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08178184: .4byte 0x085C93F5
	thumb_func_end PrintBerryFirmness

	thumb_func_start PrintBerryDescription1
PrintBerryDescription1: @ 0x08178188
	push {lr}
	sub sp, #0xc
	ldr r0, _081781B8
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetBerryInfo
	ldr r2, [r0, #0xc]
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081781B8: .4byte 0x0203B9C0
	thumb_func_end PrintBerryDescription1

	thumb_func_start PrintBerryDescription2
PrintBerryDescription2: @ 0x081781BC
	push {lr}
	sub sp, #0xc
	ldr r0, _081781EC
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetBerryInfo
	ldr r2, [r0, #0x10]
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081781EC: .4byte 0x0203B9C0
	thumb_func_end PrintBerryDescription2

	thumb_func_start CreateBerrySprite
CreateBerrySprite: @ 0x081781F0
	push {r4, lr}
	ldr r4, _0817821C
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x38
	movs r2, #0x40
	bl CreateBerryTagSprite
	ldr r1, [r4]
	ldr r2, _08178220
	adds r1, r1, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817821C: .4byte 0x0203B9C0
_08178220: .4byte 0x00001802
	thumb_func_end CreateBerrySprite

	thumb_func_start DestroyBerrySprite
DestroyBerrySprite: @ 0x08178224
	push {lr}
	ldr r0, _08178248
	ldr r0, [r0]
	ldr r1, _0817824C
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08178250
	adds r0, r0, r1
	bl DestroySprite
	bl FreeBerryTagSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_08178248: .4byte 0x0203B9C0
_0817824C: .4byte 0x00001802
_08178250: .4byte 0x020205AC
	thumb_func_end DestroyBerrySprite

	thumb_func_start CreateFlavorCircleSprites
CreateFlavorCircleSprites: @ 0x08178254
	push {r4, lr}
	movs r0, #0x3c
	bl CreateBerryFlavorCircleSprite
	ldr r4, _081782A4
	ldr r1, [r4]
	ldr r2, _081782A8
	adds r1, r1, r2
	strb r0, [r1]
	movs r0, #0x5c
	bl CreateBerryFlavorCircleSprite
	ldr r1, [r4]
	ldr r2, _081782AC
	adds r1, r1, r2
	strb r0, [r1]
	movs r0, #0x7c
	bl CreateBerryFlavorCircleSprite
	ldr r1, [r4]
	ldr r2, _081782B0
	adds r1, r1, r2
	strb r0, [r1]
	movs r0, #0x9c
	bl CreateBerryFlavorCircleSprite
	ldr r1, [r4]
	ldr r2, _081782B4
	adds r1, r1, r2
	strb r0, [r1]
	movs r0, #0xbc
	bl CreateBerryFlavorCircleSprite
	ldr r1, [r4]
	ldr r2, _081782B8
	adds r1, r1, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081782A4: .4byte 0x0203B9C0
_081782A8: .4byte 0x00001803
_081782AC: .4byte 0x00001804
_081782B0: .4byte 0x00001805
_081782B4: .4byte 0x00001806
_081782B8: .4byte 0x00001807
	thumb_func_end CreateFlavorCircleSprites

	thumb_func_start SetFlavorCirclesVisiblity
SetFlavorCirclesVisiblity: @ 0x081782BC
	push {r4, r5, lr}
	ldr r4, _081782F4
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetBerryInfo
	adds r5, r0, #0
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	beq _08178300
	ldr r3, _081782F8
	ldr r0, [r4]
	ldr r1, _081782FC
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	b _0817831A
	.align 2, 0
_081782F4: .4byte 0x0203B9C0
_081782F8: .4byte 0x020205AC
_081782FC: .4byte 0x00001803
_08178300:
	ldr r3, _08178344
	ldr r0, [r4]
	ldr r1, _08178348
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
_0817831A:
	strb r1, [r0]
	adds r4, r3, #0
	ldrb r0, [r5, #0x16]
	cmp r0, #0
	beq _08178354
	ldr r3, _0817834C
	ldr r0, [r3]
	ldr r1, _08178350
	adds r0, r0, r1
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
	b _0817836E
	.align 2, 0
_08178344: .4byte 0x020205AC
_08178348: .4byte 0x00001803
_0817834C: .4byte 0x0203B9C0
_08178350: .4byte 0x00001804
_08178354:
	ldr r3, _08178394
	ldr r0, [r3]
	ldr r1, _08178398
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
_0817836E:
	strb r1, [r0]
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	beq _081783A0
	ldr r0, [r3]
	ldr r1, _0817839C
	adds r0, r0, r1
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
	b _081783B8
	.align 2, 0
_08178394: .4byte 0x0203B9C0
_08178398: .4byte 0x00001804
_0817839C: .4byte 0x00001805
_081783A0:
	ldr r0, [r3]
	ldr r1, _081783DC
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
_081783B8:
	strb r1, [r0]
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _081783E4
	ldr r0, [r3]
	ldr r1, _081783E0
	adds r0, r0, r1
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
	b _081783FC
	.align 2, 0
_081783DC: .4byte 0x00001805
_081783E0: .4byte 0x00001806
_081783E4:
	ldr r0, [r3]
	ldr r1, _08178420
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
_081783FC:
	strb r1, [r0]
	ldrb r0, [r5, #0x19]
	cmp r0, #0
	beq _08178428
	ldr r0, [r3]
	ldr r1, _08178424
	adds r0, r0, r1
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
	b _08178440
	.align 2, 0
_08178420: .4byte 0x00001806
_08178424: .4byte 0x00001807
_08178428:
	ldr r0, [r3]
	ldr r1, _08178448
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
_08178440:
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08178448: .4byte 0x00001807
	thumb_func_end SetFlavorCirclesVisiblity

	thumb_func_start DestroyFlavorCircleSprites
DestroyFlavorCircleSprites: @ 0x0817844C
	push {r4, lr}
	movs r4, #0
_08178450:
	ldr r0, _0817847C
	ldr r0, [r0]
	ldr r1, _08178480
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08178484
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08178450
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817847C: .4byte 0x0203B9C0
_08178480: .4byte 0x00001803
_08178484: .4byte 0x020205AC
	thumb_func_end DestroyFlavorCircleSprites

	thumb_func_start PrepareToCloseBerryTagScreen
PrepareToCloseBerryTagScreen: @ 0x08178488
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _081784C0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081784C4
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081784C0: .4byte 0x03005B60
_081784C4: .4byte 0x081784C9
	thumb_func_end PrepareToCloseBerryTagScreen

	thumb_func_start Task_CloseBerryTagScreen
Task_CloseBerryTagScreen: @ 0x081784C8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08178500
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081784FA
	bl DestroyBerrySprite
	bl DestroyFlavorCircleSprites
	ldr r0, _08178504
	ldr r0, [r0]
	bl Free
	bl FreeAllWindowBuffers
	ldr r0, _08178508
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_081784FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08178500: .4byte 0x02037C74
_08178504: .4byte 0x0203B9C0
_08178508: .4byte 0x081AD205
	thumb_func_end Task_CloseBerryTagScreen

	thumb_func_start Task_HandleInput
Task_HandleInput: @ 0x0817850C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r4, r2, #0
	ldr r0, _08178538
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817855E
	ldr r3, _0817853C
	ldrh r0, [r3, #0x30]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0x40
	bne _08178540
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r2, #0
	bl TryChangeDisplayedBerry
	b _0817855E
	.align 2, 0
_08178538: .4byte 0x02037C74
_0817853C: .4byte 0x03002360
_08178540:
	cmp r1, #0x80
	bne _0817854E
	adds r0, r2, #0
	movs r1, #1
	bl TryChangeDisplayedBerry
	b _0817855E
_0817854E:
	ldrh r1, [r3, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0817855E
	adds r0, r4, #0
	bl PrepareToCloseBerryTagScreen
_0817855E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_HandleInput

	thumb_func_start TryChangeDisplayedBerry
TryChangeDisplayedBerry: @ 0x08178564
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r2, _081785A4
	adds r4, r0, r2
	ldr r2, _081785A8
	ldrh r0, [r2, #0xe]
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsrs r7, r1, #0x18
	asrs r6, r1, #0x18
	adds r0, r0, r6
	cmp r0, #0x2d
	bhi _081785D0
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	movs r0, #4
	bl BagGetItemIdByPocketPosition
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081785D0
	cmp r6, #0
	bge _081785AC
	movs r0, #2
	b _081785AE
	.align 2, 0
_081785A4: .4byte 0x03005B68
_081785A8: .4byte 0x0203CB24
_081785AC:
	movs r0, #1
_081785AE:
	strh r0, [r4, #2]
	movs r0, #0
	strh r0, [r4]
	movs r0, #5
	bl PlaySE
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	bl HandleBagCursorPositionChange
	ldr r1, _081785D8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081785DC
	str r1, [r0]
_081785D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081785D8: .4byte 0x03005B60
_081785DC: .4byte 0x08178665
	thumb_func_end TryChangeDisplayedBerry

	thumb_func_start HandleBagCursorPositionChange
HandleBagCursorPositionChange: @ 0x081785E0
	push {r4, r5, r6, lr}
	ldr r5, _08178614
	adds r6, r5, #0
	subs r6, #0xa
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	ble _0817861C
	ldrh r0, [r6]
	cmp r0, #3
	bls _0817860A
	ldrh r1, [r5]
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #4
	bl BagGetItemIdByPocketPosition
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08178618
_0817860A:
	ldrh r0, [r6]
	adds r0, r0, r4
	strh r0, [r6]
	b _08178632
	.align 2, 0
_08178614: .4byte 0x0203CB3C
_08178618:
	ldrh r0, [r5]
	b _0817862E
_0817861C:
	ldrh r1, [r6]
	cmp r1, #3
	bhi _08178628
	ldrh r0, [r5]
	cmp r0, #0
	bne _0817862E
_08178628:
	adds r0, r1, r4
	strh r0, [r6]
	b _08178632
_0817862E:
	adds r0, r0, r4
	strh r0, [r5]
_08178632:
	ldrh r1, [r6]
	ldrh r5, [r5]
	adds r1, r1, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #4
	bl BagGetItemIdByPocketPosition
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIdToBerryType
	ldr r1, _08178660
	ldr r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r1, r2
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08178660: .4byte 0x0203B9C0
	thumb_func_end HandleBagCursorPositionChange

	thumb_func_start Task_DisplayAnotherBerry
Task_DisplayAnotherBerry: @ 0x08178664
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _081786A8
	adds r6, r0, r1
	ldrh r0, [r6]
	adds r0, #0x10
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6]
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #1
	bne _081786E0
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0x70
	beq _08178740
	cmp r0, #0x70
	bgt _081786B6
	cmp r0, #0x40
	beq _081786D2
	cmp r0, #0x40
	bgt _081786AC
	cmp r0, #0x30
	beq _08178750
	b _0817875E
	.align 2, 0
_081786A8: .4byte 0x03005B68
_081786AC:
	cmp r0, #0x50
	beq _08178746
	cmp r0, #0x60
	beq _081786D8
	b _0817875E
_081786B6:
	cmp r0, #0xa0
	beq _081786DC
	cmp r0, #0xa0
	bgt _081786C8
	cmp r0, #0x80
	beq _0817873A
	cmp r0, #0x90
	beq _08178730
	b _0817875E
_081786C8:
	cmp r0, #0xb0
	beq _0817872A
	cmp r0, #0xc0
	beq _08178724
	b _0817875E
_081786D2:
	bl PrintBerryNumberAndName
	b _0817875E
_081786D8:
	movs r0, #1
	b _08178752
_081786DC:
	movs r0, #2
	b _08178752
_081786E0:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0x70
	beq _08178736
	cmp r0, #0x70
	bgt _08178704
	cmp r0, #0x40
	beq _08178724
	cmp r0, #0x40
	bgt _081786FA
	cmp r0, #0x30
	beq _08178720
	b _0817875E
_081786FA:
	cmp r0, #0x50
	beq _0817872A
	cmp r0, #0x60
	beq _08178730
	b _0817875E
_08178704:
	cmp r0, #0xa0
	beq _08178746
	cmp r0, #0xa0
	bgt _08178716
	cmp r0, #0x80
	beq _0817873A
	cmp r0, #0x90
	beq _08178740
	b _0817875E
_08178716:
	cmp r0, #0xb0
	beq _08178750
	cmp r0, #0xc0
	beq _0817875A
	b _0817875E
_08178720:
	movs r0, #2
	b _08178752
_08178724:
	bl PrintBerryDescription2
	b _0817875E
_0817872A:
	bl PrintBerryDescription1
	b _0817875E
_08178730:
	bl SetFlavorCirclesVisiblity
	b _0817875E
_08178736:
	movs r0, #1
	b _08178752
_0817873A:
	bl PrintBerryFirmness
	b _0817875E
_08178740:
	bl sub_0817804C
	b _0817875E
_08178746:
	bl DestroyBerrySprite
	bl CreateBerrySprite
	b _0817875E
_08178750:
	movs r0, #0
_08178752:
	movs r1, #0
	bl FillWindowPixelBuffer
	b _0817875E
_0817875A:
	bl PrintBerryNumberAndName
_0817875E:
	movs r2, #2
	ldrsh r0, [r6, r2]
	cmp r0, #1
	bne _08178770
	ldrh r0, [r6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _08178772
_08178770:
	ldrh r5, [r6]
_08178772:
	ldr r2, _081787E4
	ldr r3, _081787E8
	ldr r0, [r3]
	ldr r1, _081787EC
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r5, [r0, #0x26]
	movs r4, #0
	adds r7, r2, #0
	ldr r2, _081787F0
_0817878E:
	ldr r0, [r3]
	adds r0, r0, r2
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r5, [r0, #0x26]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _0817878E
	movs r4, #0x80
	lsls r4, r4, #5
	ldrb r2, [r6, #2]
	movs r0, #1
	adds r1, r4, #0
	bl ChangeBgY
	ldrb r2, [r6, #2]
	movs r0, #2
	adds r1, r4, #0
	bl ChangeBgY
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bne _081787DA
	ldr r0, _081787F4
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081787F8
	str r0, [r1]
_081787DA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081787E4: .4byte 0x020205AC
_081787E8: .4byte 0x0203B9C0
_081787EC: .4byte 0x00001802
_081787F0: .4byte 0x00001803
_081787F4: .4byte 0x03005B60
_081787F8: .4byte 0x0817850D
	thumb_func_end Task_DisplayAnotherBerry

	thumb_func_start sub_081787FC
sub_081787FC: @ 0x081787FC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081787FC

	thumb_func_start CheckLanguageMatch
CheckLanguageMatch: @ 0x08178810
	push {lr}
	movs r2, #0
	ldr r1, _08178828
	ldrh r0, [r1, #0x1a]
	ldrh r1, [r1, #0x36]
	cmp r0, r1
	bne _08178820
	movs r2, #1
_08178820:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08178828: .4byte 0x020226A0
	thumb_func_end CheckLanguageMatch

	thumb_func_start CB2_InitMysteryEventMenu
CB2_InitMysteryEventMenu: @ 0x0817882C
	push {r4, lr}
	sub sp, #8
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _081788E4
	bl SetVBlankCallback
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081788E8
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	ldr r0, _081788EC
	bl InitWindows
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081788DA
	bl DeactivateAllTextPrinters
	movs r4, #0
_08178864:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r4, #1
	cmp r4, #1
	ble _08178864
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
	movs r1, #1
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	movs r0, #0xe0
	bl Menu_LoadStdPalAt
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	ldr r0, _081788F0
	movs r1, #0
	bl CreateTask
	bl StopMapMusic
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	movs r0, #0
	movs r1, #0
	movs r2, #2
	bl FillPalette
	ldr r0, _081788F4
	bl SetMainCallback2
_081788DA:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081788E4: .4byte 0x081787FD
_081788E8: .4byte 0x085CD204
_081788EC: .4byte 0x085CD208
_081788F0: .4byte 0x08008FA1
_081788F4: .4byte 0x08178931
	thumb_func_end CB2_InitMysteryEventMenu

	thumb_func_start GetEventLoadMessage
GetEventLoadMessage: @ 0x081788F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r5, #1
	cmp r4, #0
	bne _0817890C
	ldr r1, _08178928
	bl StringCopy
	movs r5, #0
_0817890C:
	cmp r4, #2
	bne _08178912
	movs r5, #0
_08178912:
	cmp r4, #1
	bne _0817891E
	ldr r1, _0817892C
	adds r0, r6, #0
	bl StringCopy
_0817891E:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08178928: .4byte 0x085CD159
_0817892C: .4byte 0x085CD19F
	thumb_func_end GetEventLoadMessage

	thumb_func_start CB2_MysteryEventMenu
CB2_MysteryEventMenu: @ 0x08178930
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _08178950
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0x10
	bls _08178946
	b _08178D10
_08178946:
	lsls r0, r0, #2
	ldr r1, _08178954
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08178950: .4byte 0x03002360
_08178954: .4byte 0x08178958
_08178958: @ jump table
	.4byte _0817899C @ case 0
	.4byte _081789CA @ case 1
	.4byte _08178A00 @ case 2
	.4byte _08178A38 @ case 3
	.4byte _08178A84 @ case 4
	.4byte _08178A94 @ case 5
	.4byte _08178B0C @ case 6
	.4byte _08178BE0 @ case 7
	.4byte _08178BF0 @ case 8
	.4byte _08178C10 @ case 9
	.4byte _08178C18 @ case 10
	.4byte _08178C2C @ case 11
	.4byte _08178C74 @ case 12
	.4byte _08178C98 @ case 13
	.4byte _08178CC4 @ case 14
	.4byte _08178CDC @ case 15
	.4byte _08178D00 @ case 16
_0817899C:
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #0
	bl ShowBg
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	b _08178CE8
_081789CA:
	ldr r0, _081789F4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081789D8
	b _08178D10
_081789D8:
	ldr r1, _081789F8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #1
	movs r3, #2
	bl sub_08178D7C
	ldr r1, _081789FC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08178CF4
	.align 2, 0
_081789F4: .4byte 0x02037C74
_081789F8: .4byte 0x085CD0DC
_081789FC: .4byte 0x03002360
_08178A00:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08178A0E
	b _08178D10
_08178A0E:
	ldr r1, _08178A2C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08178A30
	ldr r2, _08178A34
	adds r0, r2, #0
	strh r0, [r1]
	bl OpenLink
	b _08178D10
	.align 2, 0
_08178A2C: .4byte 0x03002360
_08178A30: .4byte 0x0202267E
_08178A34: .4byte 0x00005501
_08178A38:
	ldr r0, _08178A78
	ldr r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08178A46
	b _08178BB8
_08178A46:
	movs r0, #0x1c
	ands r1, r0
	cmp r1, #4
	bhi _08178A50
	b _08178BB8
_08178A50:
	movs r0, #0x15
	bl PlaySE
	ldr r1, _08178A7C
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #1
	movs r3, #2
	bl sub_08178D7C
	ldr r1, _08178A80
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08178BB8
	.align 2, 0
_08178A78: .4byte 0x03003180
_08178A7C: .4byte 0x085CD0FE
_08178A80: .4byte 0x03002360
_08178A84:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08178A92
	b _08178D10
_08178A92:
	b _08178CEC
_08178A94:
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bne _08178B88
	ldr r4, _08178AE8
	ldrh r1, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08178AF0
	movs r0, #5
	bl PlaySE
	bl CheckShouldAdvanceLinkState
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r1, _08178AEC
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #1
	movs r3, #2
	bl sub_08178D7C
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r4, r2
	b _08178CF4
	.align 2, 0
_08178AE8: .4byte 0x03002360
_08178AEC: .4byte 0x085CD123
_08178AF0:
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08178AFA
	b _08178D10
_08178AFA:
	movs r0, #5
	bl PlaySE
	bl CloseLink
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r4, r0
	b _08178BD6
_08178B0C:
	bl IsLinkConnectionEstablished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08178BB8
	ldr r0, _08178B58
	ldrb r0, [r0]
	cmp r0, #0
	bne _08178B20
	b _08178D10
_08178B20:
	movs r0, #2
	movs r1, #2
	bl GetLinkPlayerDataExchangeStatusTimed
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _08178B64
	bl sub_0800A7F8
	ldr r4, _08178B5C
	adds r0, r4, #0
	movs r1, #1
	bl GetEventLoadMessage
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #2
	bl sub_08178D7C
	ldr r0, _08178B60
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	b _08178BAA
	.align 2, 0
_08178B58: .4byte 0x030031C4
_08178B5C: .4byte 0x02021C7C
_08178B60: .4byte 0x03002360
_08178B64:
	bl CheckLanguageMatch
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08178B84
	ldr r1, _08178B80
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #1
	movs r3, #2
	bl sub_08178D7C
	b _08178CEC
	.align 2, 0
_08178B80: .4byte 0x085CD133
_08178B84:
	bl CloseLink
_08178B88:
	ldr r4, _08178BB0
	adds r0, r4, #0
	movs r1, #1
	bl GetEventLoadMessage
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #2
	bl sub_08178D7C
	ldr r0, _08178BB4
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
_08178BAA:
	movs r1, #0xd
	strb r1, [r0]
	b _08178D10
	.align 2, 0
_08178BB0: .4byte 0x02021C7C
_08178BB4: .4byte 0x03002360
_08178BB8:
	ldr r4, _08178BDC
	ldrh r1, [r4, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08178BC6
	b _08178D10
_08178BC6:
	movs r0, #5
	bl PlaySE
	bl CloseLink
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r4, r2
_08178BD6:
	movs r0, #0xf
	strb r0, [r1]
	b _08178D10
	.align 2, 0
_08178BDC: .4byte 0x03002360
_08178BE0:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08178BEE
	b _08178D10
_08178BEE:
	b _08178CEC
_08178BF0:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08178BFC
	b _08178D10
_08178BFC:
	bl ResetBlockReceivedFlags
	ldr r1, _08178C0C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08178CF4
	.align 2, 0
_08178C0C: .4byte 0x03002360
_08178C10:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r4, r0
	b _08178CF4
_08178C18:
	bl sub_0800A7F8
	ldr r1, _08178C28
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08178CF4
	.align 2, 0
_08178C28: .4byte 0x03002360
_08178C2C:
	ldr r0, _08178C64
	ldrb r6, [r0]
	cmp r6, #0
	bne _08178D10
	ldr r5, _08178C68
	adds r0, r5, #0
	bl RunMysteryEventScript
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r6, [sp, #4]
	ldr r2, _08178C6C
	add r0, sp, #4
	adds r1, r5, #0
	bl CpuSet
	ldr r0, _08178C70
	adds r1, r4, #0
	bl GetEventLoadMessage
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08178CEC
	movs r0, #0
	bl TrySavingData
	b _08178CEC
	.align 2, 0
_08178C64: .4byte 0x030031C4
_08178C68: .4byte 0x0201C000
_08178C6C: .4byte 0x050001F5
_08178C70: .4byte 0x02021C7C
_08178C74:
	ldr r1, _08178C90
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #1
	movs r3, #2
	bl sub_08178D7C
	ldr r1, _08178C94
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08178CF4
	.align 2, 0
_08178C90: .4byte 0x02021C7C
_08178C94: .4byte 0x03002360
_08178C98:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08178D10
	ldr r0, _08178CBC
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, _08178CC0
	strb r2, [r0]
	b _08178D10
	.align 2, 0
_08178CBC: .4byte 0x03002360
_08178CC0: .4byte 0x0203B9C4
_08178CC4:
	ldrh r1, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08178D10
	movs r0, #5
	bl PlaySE
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r4, r2
	b _08178CF4
_08178CDC:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
_08178CE8:
	bl BeginNormalPaletteFade
_08178CEC:
	ldr r1, _08178CFC
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
_08178CF4:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08178D10
	.align 2, 0
_08178CFC: .4byte 0x03002360
_08178D00:
	ldr r0, _08178D6C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08178D10
	bl DoSoftReset
_08178D10:
	ldr r0, _08178D70
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08178D50
	bl IsLinkMaster
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08178D50
	bl CloseLink
	ldr r4, _08178D74
	adds r0, r4, #0
	movs r1, #1
	bl GetEventLoadMessage
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #2
	bl sub_08178D7C
	ldr r0, _08178D78
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0xd
	strb r1, [r0]
_08178D50:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08178D6C: .4byte 0x02037C74
_08178D70: .4byte 0x03003180
_08178D74: .4byte 0x02021C7C
_08178D78: .4byte 0x03002360
	thumb_func_end CB2_MysteryEventMenu

	thumb_func_start sub_08178D7C
sub_08178D7C: @ 0x08178D7C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x1c
	adds r5, r0, #0
	mov sl, r1
	adds r6, r2, #0
	ldr r4, [sp, #0x38]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0
	mov sb, r0
	movs r1, #1
	mov r8, r1
	add r0, sp, #0x14
	mov r1, r8
	strb r1, [r0]
	adds r1, r0, #0
	movs r0, #2
	strb r0, [r1, #1]
	movs r0, #3
	strb r0, [r1, #2]
	adds r0, r1, #0
	ldrb r0, [r0]
	lsls r1, r0, #4
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	str r3, [sp, #0x18]
	bl FillWindowPixelBuffer
	mov r0, sb
	str r0, [sp]
	mov r1, r8
	str r1, [sp, #4]
	add r0, sp, #0x14
	str r0, [sp, #8]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp, #0xc]
	mov r1, sl
	str r1, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	ldr r3, [sp, #0x18]
	bl AddTextPrinterParameterized4
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08178D7C

