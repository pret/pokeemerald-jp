.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetBagScrollPositions
ResetBagScrollPositions: @ 0x081AA8E8
	push {r4, lr}
	ldr r4, _081AA910
	movs r0, #0
	strb r0, [r4, #5]
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0
	movs r2, #0xa
	bl memset
	adds r4, #0x12
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xa
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AA910: .4byte 0x0203CB24
	thumb_func_end ResetBagScrollPositions

	thumb_func_start CB2_BagMenuFromStartMenu
CB2_BagMenuFromStartMenu: @ 0x081AA914
	push {lr}
	ldr r2, _081AA924
	movs r0, #0
	movs r1, #5
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_081AA924: .4byte 0x08085AFD
	thumb_func_end CB2_BagMenuFromStartMenu

	thumb_func_start sub_081AA928
sub_081AA928: @ 0x081AA928
	push {lr}
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AA944
	ldr r2, _081AA940
	movs r0, #1
	movs r1, #5
	bl GoToBagMenu
	b _081AA94C
	.align 2, 0
_081AA940: .4byte 0x0805996D
_081AA944:
	ldr r1, _081AA950
	movs r0, #1
	bl sub_081C47A0
_081AA94C:
	pop {r0}
	bx r0
	.align 2, 0
_081AA950: .4byte 0x0805996D
	thumb_func_end sub_081AA928

	thumb_func_start CB2_ChooseBerry
CB2_ChooseBerry: @ 0x081AA954
	push {lr}
	ldr r2, _081AA964
	movs r0, #4
	movs r1, #3
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_081AA964: .4byte 0x08085B19
	thumb_func_end CB2_ChooseBerry

	thumb_func_start sub_081AA968
sub_081AA968: @ 0x081AA968
	push {lr}
	adds r2, r0, #0
	movs r0, #5
	movs r1, #3
	bl GoToBagMenu
	pop {r0}
	bx r0
	thumb_func_end sub_081AA968

	thumb_func_start CB2_GoToSellMenu
CB2_GoToSellMenu: @ 0x081AA978
	push {lr}
	ldr r2, _081AA988
	movs r0, #3
	movs r1, #5
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_081AA988: .4byte 0x080DF195
	thumb_func_end CB2_GoToSellMenu

	thumb_func_start sub_081AA98C
sub_081AA98C: @ 0x081AA98C
	push {lr}
	ldr r2, _081AA99C
	movs r0, #6
	movs r1, #5
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_081AA99C: .4byte 0x0816B141
	thumb_func_end sub_081AA98C

	thumb_func_start sub_081AA9A0
sub_081AA9A0: @ 0x081AA9A0
	push {lr}
	ldr r2, _081AA9BC
	movs r0, #9
	movs r1, #5
	bl GoToBagMenu
	ldr r0, _081AA9C0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081AA9C4
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_081AA9BC: .4byte 0x081ADC79
_081AA9C0: .4byte 0x02037282
_081AA9C4: .4byte 0x02037290
	thumb_func_end sub_081AA9A0

	thumb_func_start sub_081AA9C8
sub_081AA9C8: @ 0x081AA9C8
	push {lr}
	ldr r2, _081AA9E0
	movs r0, #7
	movs r1, #5
	bl GoToBagMenu
	ldr r1, _081AA9E4
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081AA9E0: .4byte 0x081ADCC9
_081AA9E4: .4byte 0x02037290
	thumb_func_end sub_081AA9C8

	thumb_func_start sub_081AA9E8
sub_081AA9E8: @ 0x081AA9E8
	push {lr}
	ldr r2, _081AAA00
	movs r0, #8
	movs r1, #5
	bl GoToBagMenu
	ldr r1, _081AAA04
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081AAA00: .4byte 0x081ADD0D
_081AAA04: .4byte 0x02037290
	thumb_func_end sub_081AA9E8

	thumb_func_start GoToBagMenu
GoToBagMenu: @ 0x081AAA08
	push {r4, r5, r6, r7, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r6, _081AAA2C
	ldr r0, _081AAA30
	bl AllocZeroed
	str r0, [r6]
	cmp r0, #0
	bne _081AAA34
	adds r0, r4, #0
	bl SetMainCallback2
	b _081AAAB2
	.align 2, 0
_081AAA2C: .4byte 0x0203CB20
_081AAA30: .4byte 0x00000844
_081AAA34:
	ldr r0, _081AAAB8
	cmp r5, #0xc
	beq _081AAA3C
	strb r5, [r0, #4]
_081AAA3C:
	cmp r4, #0
	beq _081AAA42
	str r4, [r0]
_081AAA42:
	cmp r7, #4
	bhi _081AAA48
	strb r7, [r0, #5]
_081AAA48:
	ldrb r0, [r0, #4]
	subs r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _081AAA68
	ldr r2, [r6]
	ldr r0, _081AAABC
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_081AAA68:
	ldr r0, [r6]
	movs r1, #0
	str r1, [r0]
	ldr r1, _081AAAC0
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r6]
	ldr r1, _081AAAC4
	adds r0, r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	ldr r0, [r6]
	ldr r1, _081AAAC8
	adds r0, r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	ldr r0, [r6]
	ldr r1, _081AAACC
	adds r0, r0, r1
	movs r1, #0xff
	movs r2, #0xc
	bl memset
	ldr r0, [r6]
	movs r1, #0x81
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #0xff
	movs r2, #0xa
	bl memset
	ldr r0, _081AAAD0
	bl SetMainCallback2
_081AAAB2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AAAB8: .4byte 0x0203CB24
_081AAABC: .4byte 0x0000081B
_081AAAC0: .4byte 0x0000081A
_081AAAC4: .4byte 0x0000081E
_081AAAC8: .4byte 0x0000081F
_081AAACC: .4byte 0x00000804
_081AAAD0: .4byte 0x081AAB05
	thumb_func_end GoToBagMenu

	thumb_func_start c2_bag_3
c2_bag_3: @ 0x081AAAD4
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end c2_bag_3

	thumb_func_start vblank_cb_bag_menu
vblank_cb_bag_menu: @ 0x081AAAF0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end vblank_cb_bag_menu

	thumb_func_start CB2_Bag
CB2_Bag: @ 0x081AAB04
	push {lr}
_081AAB06:
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081AAB2A
	bl SetupBagMenu
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081AAB2A
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081AAB06
_081AAB2A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_Bag

	thumb_func_start SetupBagMenu
SetupBagMenu: @ 0x081AAB30
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _081AAB50
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x14
	bls _081AAB46
	b _081AAD9C
_081AAB46:
	lsls r0, r0, #2
	ldr r1, _081AAB54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081AAB50: .4byte 0x03002360
_081AAB54: .4byte 0x081AAB58
_081AAB58: @ jump table
	.4byte _081AABAC @ case 0
	.4byte _081AABB6 @ case 1
	.4byte _081AABC8 @ case 2
	.4byte _081AABCE @ case 3
	.4byte _081AABF0 @ case 4
	.4byte _081AABF6 @ case 5
	.4byte _081AABFE @ case 6
	.4byte _081AAC1C @ case 7
	.4byte _081AAC44 @ case 8
	.4byte _081AAC52 @ case 9
	.4byte _081AAC64 @ case 10
	.4byte _081AAC72 @ case 11
	.4byte _081AAC84 @ case 12
	.4byte _081AAC94 @ case 13
	.4byte _081AACC4 @ case 14
	.4byte _081AAD10 @ case 15
	.4byte _081AAD2C @ case 16
	.4byte _081AAD32 @ case 17
	.4byte _081AAD48 @ case 18
	.4byte _081AAD4E @ case 19
	.4byte _081AAD68 @ case 20
_081AABAC:
	bl SetVBlankHBlankCallbacksToNull
	bl clear_scheduled_bg_copies_to_vram
	b _081AAD82
_081AABB6:
	bl ScanlineEffect_Stop
	ldr r1, _081AABC4
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AABC4: .4byte 0x03002360
_081AABC8:
	bl FreeAllSpritePalettes
	b _081AAD82
_081AABCE:
	bl ResetPaletteFade
	ldr r2, _081AABE8
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r1, _081AABEC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AABE8: .4byte 0x02037C74
_081AABEC: .4byte 0x03002360
_081AABF0:
	bl ResetSpriteData
	b _081AAD82
_081AABF6:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	b _081AAD8A
_081AABFE:
	bl sub_081221B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AAC0C
	bl ResetTasks
_081AAC0C:
	ldr r1, _081AAC18
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AAC18: .4byte 0x03002360
_081AAC1C:
	bl BagMenu_InitBGs
	ldr r0, _081AAC38
	ldr r0, [r0]
	ldr r1, _081AAC3C
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r1, _081AAC40
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AAC38: .4byte 0x0203CB20
_081AAC3C: .4byte 0x00000834
_081AAC40: .4byte 0x03002360
_081AAC44:
	bl LoadBagMenu_Graphics
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AAC50
	b _081AADB4
_081AAC50:
	b _081AAD82
_081AAC52:
	bl SetupBagMenu_Textboxes
	ldr r1, _081AAC60
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AAC60: .4byte 0x03002360
_081AAC64:
	bl sub_081AB818
	bl SetPocketListPositions
	bl sub_081AB88C
	b _081AAD82
_081AAC72:
	bl AllocateBagItemListBuffers
	ldr r1, _081AAC80
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AAC80: .4byte 0x03002360
_081AAC84:
	ldr r0, _081AAC90
	ldrb r0, [r0, #5]
	bl LoadBagItemListBuffers
	b _081AAD82
	.align 2, 0
_081AAC90: .4byte 0x0203CB24
_081AAC94:
	ldr r4, _081AACB8
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	ldr r1, _081AACBC
	adds r0, r0, r1
	movs r1, #0
	bl sub_081AB4A0
	ldrb r0, [r4, #5]
	movs r1, #1
	bl BagMenu_DrawPocketIndicatorSquare
	ldr r1, _081AACC0
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AACB8: .4byte 0x0203CB24
_081AACBC: .4byte 0x085C9742
_081AACC0: .4byte 0x03002360
_081AACC4:
	ldr r4, _081AAD04
	ldrb r0, [r4, #4]
	bl sub_081AAF60
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _081AAD08
	ldrb r2, [r4, #5]
	lsls r2, r2, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r1, r2, r1
	ldrh r1, [r1]
	adds r4, #8
	adds r2, r2, r4
	ldrh r2, [r2]
	bl ListMenuInit
	ldr r2, _081AAD0C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	strh r0, [r1, #8]
	strh r2, [r1, #0xe]
	strh r2, [r1, #0x18]
	b _081AAD82
	.align 2, 0
_081AAD04: .4byte 0x0203CB24
_081AAD08: .4byte 0x03006050
_081AAD0C: .4byte 0x03005B60
_081AAD10:
	ldr r0, _081AAD24
	ldrb r0, [r0, #5]
	bl AddBagVisualSprite
	ldr r1, _081AAD28
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AAD24: .4byte 0x0203CB24
_081AAD28: .4byte 0x03002360
_081AAD2C:
	bl sub_080D4830
	b _081AAD82
_081AAD32:
	bl bag_menu_add_pocket_scroll_arrow_indicators_maybe
	bl bag_menu_add_list_scroll_arrow_indicators_maybe
	ldr r1, _081AAD44
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AAD44: .4byte 0x03002360
_081AAD48:
	bl BagMenu_PrepareTMHMMoveWindow
	b _081AAD82
_081AAD4E:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r1, _081AAD64
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _081AAD8A
	.align 2, 0
_081AAD64: .4byte 0x03002360
_081AAD68:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r2, _081AAD94
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
_081AAD82:
	ldr r1, _081AAD98
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
_081AAD8A:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081AADB4
	.align 2, 0
_081AAD94: .4byte 0x02037C74
_081AAD98: .4byte 0x03002360
_081AAD9C:
	ldr r0, _081AADAC
	bl SetVBlankCallback
	ldr r0, _081AADB0
	bl SetMainCallback2
	movs r0, #1
	b _081AADB6
	.align 2, 0
_081AADAC: .4byte 0x081AAAF1
_081AADB0: .4byte 0x081AAAD5
_081AADB4:
	movs r0, #0
_081AADB6:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetupBagMenu

	thumb_func_start BagMenu_InitBGs
BagMenu_InitBGs: @ 0x081AADC0
	push {r4, lr}
	bl ResetVramOamAndBgCntRegs
	ldr r4, _081AAE24
	ldr r0, [r4]
	adds r0, #4
	movs r2, #0x80
	lsls r2, r2, #4
	movs r1, #0
	bl memset
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081AAE28
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r1, [r4]
	adds r1, #4
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AAE24: .4byte 0x0203CB20
_081AAE28: .4byte 0x085DF7C8
	thumb_func_end BagMenu_InitBGs

	thumb_func_start LoadBagMenu_Graphics
LoadBagMenu_Graphics: @ 0x081AAE2C
	push {r4, lr}
	sub sp, #4
	ldr r4, _081AAE4C
	ldr r0, [r4]
	ldr r1, _081AAE50
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bls _081AAE42
	b _081AAF3C
_081AAE42:
	lsls r0, r0, #2
	ldr r1, _081AAE54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081AAE4C: .4byte 0x0203CB20
_081AAE50: .4byte 0x00000834
_081AAE54: .4byte 0x081AAE58
_081AAE58: @ jump table
	.4byte _081AAE6C @ case 0
	.4byte _081AAE88 @ case 1
	.4byte _081AAEAC @ case 2
	.4byte _081AAEE4 @ case 3
	.4byte _081AAF18 @ case 4
_081AAE6C:
	bl reset_temp_tile_data_buffers
	ldr r1, _081AAE84
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _081AAF1E
	.align 2, 0
_081AAE84: .4byte 0x08D9A7CC
_081AAE88:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081AAF54
	ldr r0, _081AAEA4
	ldr r4, _081AAEA8
	ldr r1, [r4]
	adds r1, #4
	bl LZDecompressVram
	ldr r1, [r4]
	b _081AAF22
	.align 2, 0
_081AAEA4: .4byte 0x08D9AA84
_081AAEA8: .4byte 0x0203CB20
_081AAEAC:
	bl IsWallysBag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AAED4
	ldr r0, _081AAECC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _081AAED4
	ldr r0, _081AAED0
	movs r1, #0
	movs r2, #0x40
	bl LoadCompressedPalette
	b _081AAF1E
	.align 2, 0
_081AAECC: .4byte 0x03005AF0
_081AAED0: .4byte 0x08D9A780
_081AAED4:
	ldr r0, _081AAEE0
	movs r1, #0
	movs r2, #0x40
	bl LoadCompressedPalette
	b _081AAF1E
	.align 2, 0
_081AAEE0: .4byte 0x08D9A734
_081AAEE4:
	bl IsWallysBag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081AAEFA
	ldr r0, _081AAF04
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _081AAF0C
_081AAEFA:
	ldr r0, _081AAF08
	bl LoadCompressedSpriteSheet
	b _081AAF1E
	.align 2, 0
_081AAF04: .4byte 0x03005AF0
_081AAF08: .4byte 0x0855A664
_081AAF0C:
	ldr r0, _081AAF14
	bl LoadCompressedSpriteSheet
	b _081AAF1E
	.align 2, 0
_081AAF14: .4byte 0x0855A66C
_081AAF18:
	ldr r0, _081AAF30
	bl LoadCompressedSpritePalette
_081AAF1E:
	ldr r0, _081AAF34
	ldr r1, [r0]
_081AAF22:
	ldr r0, _081AAF38
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _081AAF54
	.align 2, 0
_081AAF30: .4byte 0x0855A674
_081AAF34: .4byte 0x0203CB20
_081AAF38: .4byte 0x00000834
_081AAF3C:
	bl LoadListMenuArrowsGfx
	ldr r0, [r4]
	ldr r1, _081AAF50
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	movs r0, #1
	b _081AAF56
	.align 2, 0
_081AAF50: .4byte 0x00000834
_081AAF54:
	movs r0, #0
_081AAF56:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end LoadBagMenu_Graphics

	thumb_func_start sub_081AAF60
sub_081AAF60: @ 0x081AAF60
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bne _081AAF74
	ldr r0, _081AAF70
	b _081AAF76
	.align 2, 0
_081AAF70: .4byte 0x081ADBA5
_081AAF74:
	ldr r0, _081AAF84
_081AAF76:
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081AAF84: .4byte 0x081ABAB5
	thumb_func_end sub_081AAF60

	thumb_func_start AllocateBagItemListBuffers
AllocateBagItemListBuffers: @ 0x081AAF88
	push {r4, lr}
	ldr r4, _081AAFA8
	movs r0, #0x82
	lsls r0, r0, #2
	bl Alloc
	str r0, [r4]
	ldr r4, _081AAFAC
	movs r0, #0xc3
	lsls r0, r0, #3
	bl Alloc
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AAFA8: .4byte 0x0203CB40
_081AAFAC: .4byte 0x0203CB44
	thumb_func_end AllocateBagItemListBuffers

	thumb_func_start LoadBagItemListBuffers
LoadBagItemListBuffers: @ 0x081AAFB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r7, #3
	ldr r0, _081AB050
	adds r1, r1, r0
	mov r8, r1
	ldr r0, _081AB054
	ldr r2, [r0]
	ldr r1, _081AB058
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081AB06C
	movs r6, #0
	ldr r3, _081AB05C
	adds r0, r2, r3
	adds r0, r0, r7
	ldrb r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _081AB026
	ldr r5, _081AB060
_081AAFE6:
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	ldr r0, [r5]
	adds r0, r0, r4
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r6, #2
	adds r1, r1, r2
	ldrh r1, [r1]
	bl GetItemName
	ldr r0, _081AB064
	ldr r0, [r0]
	lsls r1, r6, #3
	adds r1, r1, r0
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r1]
	str r6, [r1, #4]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _081AB054
	ldr r0, [r0]
	ldr r3, _081AB05C
	adds r0, r0, r3
	adds r0, r0, r7
	ldrb r0, [r0]
	subs r0, #1
	cmp r6, r0
	blt _081AAFE6
_081AB026:
	ldr r5, _081AB060
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _081AB068
	bl StringCopy
	ldr r0, _081AB064
	ldr r0, [r0]
	lsls r1, r6, #3
	adds r1, r1, r0
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r1, #4]
	b _081AB0BA
	.align 2, 0
_081AB050: .4byte 0x02039A78
_081AB054: .4byte 0x0203CB20
_081AB058: .4byte 0x0000081B
_081AB05C: .4byte 0x00000829
_081AB060: .4byte 0x0203CB44
_081AB064: .4byte 0x0203CB40
_081AB068: .4byte 0x085C9448
_081AB06C:
	movs r6, #0
	ldr r4, _081AB0F0
	adds r0, r2, r4
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r6, r0
	bhs _081AB0BA
	ldr r5, _081AB0F4
_081AB07C:
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	ldr r0, [r5]
	adds r0, r0, r4
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r6, #2
	adds r1, r1, r2
	ldrh r1, [r1]
	bl GetItemName
	ldr r0, _081AB0F8
	ldr r0, [r0]
	lsls r1, r6, #3
	adds r1, r1, r0
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r1]
	str r6, [r1, #4]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _081AB0FC
	ldr r0, [r0]
	ldr r3, _081AB0F0
	adds r0, r0, r3
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r6, r0
	blo _081AB07C
_081AB0BA:
	ldr r2, _081AB100
	adds r1, r2, #0
	ldr r0, _081AB104
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, _081AB0FC
	ldr r1, [r0]
	ldr r4, _081AB0F0
	adds r0, r1, r4
	adds r0, r0, r7
	ldrb r0, [r0]
	strh r0, [r2, #0xc]
	ldr r0, _081AB0F8
	ldr r0, [r0]
	str r0, [r2]
	ldr r5, _081AB108
	adds r1, r1, r5
	adds r1, r1, r7
	ldrb r0, [r1]
	strh r0, [r2, #0xe]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AB0F0: .4byte 0x00000829
_081AB0F4: .4byte 0x0203CB44
_081AB0F8: .4byte 0x0203CB40
_081AB0FC: .4byte 0x0203CB20
_081AB100: .4byte 0x03006050
_081AB104: .4byte 0x085DF7D4
_081AB108: .4byte 0x0000082E
	thumb_func_end LoadBagItemListBuffers

	thumb_func_start GetItemName
GetItemName: @ 0x081AB10C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _081AB12C
	ldrb r0, [r0, #5]
	cmp r0, #2
	beq _081AB130
	cmp r0, #3
	beq _081AB190
	adds r0, r5, #0
	adds r1, r6, #0
	bl CopyItemName
	b _081AB1AE
	.align 2, 0
_081AB12C: .4byte 0x0203CB24
_081AB130:
	ldr r4, _081AB164
	adds r0, r5, #0
	bl ItemIdToBattleMoveId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xd
	ldr r0, _081AB168
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	movs r0, #0xa9
	lsls r0, r0, #1
	cmp r5, r0
	bls _081AB178
	ldr r0, _081AB16C
	ldr r2, _081AB170
	adds r1, r5, r2
	movs r2, #2
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r1, _081AB174
	b _081AB1A8
	.align 2, 0
_081AB164: .4byte 0x02021C54
_081AB168: .4byte 0x082EACC4
_081AB16C: .4byte 0x02021C40
_081AB170: .4byte 0xFFFFFEAE
_081AB174: .4byte 0x085C9776
_081AB178:
	ldr r0, _081AB188
	ldr r2, _081AB18C
	adds r1, r5, r2
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	b _081AB1A6
	.align 2, 0
_081AB188: .4byte 0x02021C40
_081AB18C: .4byte 0xFFFFFEE0
_081AB190:
	ldr r0, _081AB1B4
	adds r1, r5, #0
	subs r1, #0x84
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r1, _081AB1B8
	adds r0, r5, #0
	bl CopyItemName
_081AB1A6:
	ldr r1, _081AB1BC
_081AB1A8:
	adds r0, r6, #0
	bl StringExpandPlaceholders
_081AB1AE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AB1B4: .4byte 0x02021C40
_081AB1B8: .4byte 0x02021C54
_081AB1BC: .4byte 0x085C976F
	thumb_func_end GetItemName

	thumb_func_start BagMenu_MoveCursorCallback
BagMenu_MoveCursorCallback: @ 0x081AB1C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _081AB1D6
	movs r0, #5
	bl PlaySE
	bl ShakeBagVisual
_081AB1D6:
	ldr r4, _081AB228
	ldr r1, [r4]
	ldr r2, _081AB22C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081AB27C
	adds r2, #1
	adds r0, r1, r2
	ldrb r1, [r0]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	movs r0, #1
	eors r0, r1
	bl RemoveBagItemIconSprite
	movs r0, #2
	rsbs r0, r0, #0
	cmp r6, r0
	beq _081AB238
	ldr r0, _081AB230
	ldrb r0, [r0, #5]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	bl BagGetItemIdByPocketPosition
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [r4]
	ldr r2, _081AB234
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	bl AddBagItemIconSprite
	b _081AB24A
	.align 2, 0
_081AB228: .4byte 0x0203CB20
_081AB22C: .4byte 0x0000081A
_081AB230: .4byte 0x0203CB24
_081AB234: .4byte 0x0000081B
_081AB238:
	ldr r0, _081AB284
	ldr r1, [r4]
	ldr r2, _081AB288
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	bl AddBagItemIconSprite
_081AB24A:
	ldr r5, _081AB28C
	ldr r2, [r5]
	ldr r4, _081AB288
	adds r2, r2, r4
	ldrb r3, [r2]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1e
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #4
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _081AB27C
	adds r0, r6, #0
	bl BagMenu_PrintDescription
_081AB27C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AB284: .4byte 0x0000FFFF
_081AB288: .4byte 0x0000081B
_081AB28C: .4byte 0x0203CB20
	thumb_func_end BagMenu_MoveCursorCallback

	thumb_func_start PrintItemQuantityPlusGFX
PrintItemQuantityPlusGFX: @ 0x081AB290
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	bne _081AB2B0
	b _081AB3FA
_081AB2B0:
	ldr r0, _081AB2D0
	ldr r0, [r0]
	ldr r1, _081AB2D4
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	beq _081AB2E0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _081AB2D8
	adds r0, r7, #0
	movs r1, #2
	bl BagMenu_PrintCursor
	b _081AB2E0
	.align 2, 0
_081AB2D0: .4byte 0x0203CB20
_081AB2D4: .4byte 0x0000081A
_081AB2D8:
	adds r0, r7, #0
	movs r1, #0xff
	bl BagMenu_PrintCursor
_081AB2E0:
	ldr r5, _081AB368
	ldrb r0, [r5, #5]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl BagGetItemIdByPocketPosition
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrb r0, [r5, #5]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl BagGetQuantityByPocketPosition
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov sb, r4
	ldr r1, _081AB36C
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #7
	bhi _081AB32E
	ldr r1, _081AB370
	subs r3, r7, #2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0x10
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #8
	bl BlitBitmapToWindow
_081AB32E:
	ldrb r0, [r5, #5]
	cmp r0, #3
	bne _081AB380
	ldr r0, _081AB374
	adds r1, r4, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _081AB378
	ldr r1, _081AB37C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	str r7, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, r8
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x58
	bl BagMenu_Print
	b _081AB3FA
	.align 2, 0
_081AB368: .4byte 0x0203CB24
_081AB36C: .4byte 0xFFFFFEAD
_081AB370: .4byte 0x085DF99C
_081AB374: .4byte 0x02021C40
_081AB378: .4byte 0x02021C7C
_081AB37C: .4byte 0x085C943C
_081AB380:
	cmp r0, #4
	beq _081AB3D0
	adds r0, r6, #0
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _081AB3D0
	ldr r0, _081AB3C4
	mov r1, sb
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081AB3C8
	ldr r1, _081AB3CC
	adds r0, r4, #0
	bl StringExpandPlaceholders
	str r7, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	mov r0, r8
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x60
	bl BagMenu_Print
	b _081AB3FA
	.align 2, 0
_081AB3C4: .4byte 0x02021C40
_081AB3C8: .4byte 0x02021C7C
_081AB3CC: .4byte 0x085C943C
_081AB3D0:
	ldr r0, _081AB408
	ldr r0, [r0]
	ldr r1, _081AB40C
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _081AB3FA
	cmp r0, r6
	bne _081AB3FA
	ldr r1, _081AB410
	subs r3, r7, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0x60
	bl BlitBitmapToWindow
_081AB3FA:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AB408: .4byte 0x03005AEC
_081AB40C: .4byte 0x00000496
_081AB410: .4byte 0x085DF8DC
	thumb_func_end PrintItemQuantityPlusGFX

	thumb_func_start BagMenu_PrintDescription
BagMenu_PrintDescription: @ 0x081AB414
	push {r4, lr}
	sub sp, #0x14
	adds r1, r0, #0
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081AB444
	ldr r0, _081AB440
	ldrb r0, [r0, #5]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl BagGetItemIdByPocketPosition
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemId_GetHoldEffect
	adds r4, r0, #0
	b _081AB460
	.align 2, 0
_081AB440: .4byte 0x0203CB24
_081AB444:
	ldr r0, _081AB48C
	ldr r2, _081AB490
	ldr r1, _081AB494
	ldrb r1, [r1, #4]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r4, _081AB498
	ldr r1, _081AB49C
	adds r0, r4, #0
	bl StringExpandPlaceholders
_081AB460:
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl BagMenu_Print
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AB48C: .4byte 0x02021C40
_081AB490: .4byte 0x085C96F8
_081AB494: .4byte 0x0203CB24
_081AB498: .4byte 0x02021C7C
_081AB49C: .4byte 0x085C9738
	thumb_func_end BagMenu_PrintDescription

	thumb_func_start sub_081AB4A0
sub_081AB4A0: @ 0x081AB4A0
	push {lr}
	sub sp, #0x20
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r2, r1
	add r0, sp, #0x14
	adds r1, r2, #0
	movs r2, #9
	bl StringCopyN
	add r1, sp, #0x14
	movs r0, #0xff
	strb r0, [r1, #8]
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #2
	movs r1, #1
	add r2, sp, #0x14
	movs r3, #0
	bl BagMenu_Print
	add sp, #0x20
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081AB4A0

	thumb_func_start BagMenu_PrintCursor_
BagMenu_PrintCursor_: @ 0x081AB4E8
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ListMenuGetYCoordForPrintingArrowCursor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl BagMenu_PrintCursor
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BagMenu_PrintCursor_

	thumb_func_start BagMenu_PrintCursor
BagMenu_PrintCursor: @ 0x081AB508
	push {r4, r5, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xff
	bne _081AB544
	movs r0, #1
	movs r1, #0
	bl GetMenuCursorDimensionByFont
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	movs r1, #1
	bl GetMenuCursorDimensionByFont
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl FillWindowPixelRect
	b _081AB55A
_081AB544:
	ldr r2, _081AB564
	str r5, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #1
	movs r3, #0
	bl BagMenu_Print
_081AB55A:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081AB564: .4byte 0x085C9421
	thumb_func_end BagMenu_PrintCursor

	thumb_func_start bag_menu_add_pocket_scroll_arrow_indicators_maybe
bag_menu_add_pocket_scroll_arrow_indicators_maybe: @ 0x081AB568
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _081AB5C0
	ldr r4, [r5]
	ldr r1, _081AB5C4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081AB5B6
	ldr r2, _081AB5C8
	ldrb r3, [r2, #5]
	ldr r6, _081AB5CC
	adds r0, r4, r6
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r6, #5
	adds r0, r4, r6
	adds r0, r0, r3
	ldrb r0, [r0]
	subs r1, r1, r0
	str r1, [sp]
	movs r0, #0x6e
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r2, #5]
	lsls r0, r0, #1
	adds r2, #0x12
	adds r0, r0, r2
	str r0, [sp, #0xc]
	movs r0, #2
	movs r1, #0xac
	movs r2, #0xc
	movs r3, #0x94
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r5]
	ldr r2, _081AB5C4
	adds r1, r1, r2
	strb r0, [r1]
_081AB5B6:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AB5C0: .4byte 0x0203CB20
_081AB5C4: .4byte 0x0000081E
_081AB5C8: .4byte 0x0203CB24
_081AB5CC: .4byte 0x00000829
	thumb_func_end bag_menu_add_pocket_scroll_arrow_indicators_maybe

	thumb_func_start sub_081AB5D0
sub_081AB5D0: @ 0x081AB5D0
	push {r4, lr}
	ldr r4, _081AB5F8
	ldr r0, [r4]
	ldr r2, _081AB5FC
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081AB5EE
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r1, _081AB5FC
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
_081AB5EE:
	bl sub_081AB648
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AB5F8: .4byte 0x0203CB20
_081AB5FC: .4byte 0x0000081E
	thumb_func_end sub_081AB5D0

	thumb_func_start bag_menu_add_list_scroll_arrow_indicators_maybe
bag_menu_add_list_scroll_arrow_indicators_maybe: @ 0x081AB600
	push {r4, lr}
	ldr r4, _081AB634
	ldr r2, [r4]
	ldr r1, _081AB638
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	beq _081AB62E
	ldr r1, _081AB63C
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081AB62E
	ldr r0, _081AB640
	ldr r1, _081AB644
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	ldr r2, _081AB63C
	adds r1, r1, r2
	strb r0, [r1]
_081AB62E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AB634: .4byte 0x0203CB20
_081AB638: .4byte 0x0000081B
_081AB63C: .4byte 0x0000081F
_081AB640: .4byte 0x085DF8CC
_081AB644: .4byte 0x0203CB2A
	thumb_func_end bag_menu_add_list_scroll_arrow_indicators_maybe

	thumb_func_start sub_081AB648
sub_081AB648: @ 0x081AB648
	push {r4, lr}
	ldr r4, _081AB66C
	ldr r0, [r4]
	ldr r2, _081AB670
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081AB666
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r1, _081AB670
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
_081AB666:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AB66C: .4byte 0x0203CB20
_081AB670: .4byte 0x0000081F
	thumb_func_end sub_081AB648

	thumb_func_start FreeBagItemListBuffers
FreeBagItemListBuffers: @ 0x081AB674
	push {lr}
	ldr r0, _081AB698
	ldr r0, [r0]
	bl Free
	ldr r0, _081AB69C
	ldr r0, [r0]
	bl Free
	bl FreeAllWindowBuffers
	ldr r0, _081AB6A0
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_081AB698: .4byte 0x0203CB44
_081AB69C: .4byte 0x0203CB40
_081AB6A0: .4byte 0x0203CB20
	thumb_func_end FreeBagItemListBuffers

	thumb_func_start unknown_ItemMenu_Confirm
unknown_ItemMenu_Confirm: @ 0x081AB6A4
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
	ldr r1, _081AB6D4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081AB6D8
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AB6D4: .4byte 0x03005B60
_081AB6D8: .4byte 0x081AB6DD
	thumb_func_end unknown_ItemMenu_Confirm

	thumb_func_start TaskCloseBagMenu_2
TaskCloseBagMenu_2: @ 0x081AB6DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081AB720
	adds r2, r0, r1
	ldr r0, _081AB724
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081AB74C
	ldrb r0, [r2]
	ldr r4, _081AB728
	ldrb r2, [r4, #5]
	lsls r2, r2, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r1, r2, r1
	adds r3, r4, #0
	adds r3, #8
	adds r2, r2, r3
	bl DestroyListMenuTask
	ldr r0, _081AB72C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _081AB730
	bl SetMainCallback2
	b _081AB736
	.align 2, 0
_081AB720: .4byte 0x03005B68
_081AB724: .4byte 0x02037C74
_081AB728: .4byte 0x0203CB24
_081AB72C: .4byte 0x0203CB20
_081AB730:
	ldr r0, [r4]
	bl SetMainCallback2
_081AB736:
	bl sub_081AB5D0
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl FreeBagItemListBuffers
	adds r0, r5, #0
	bl DestroyTask
_081AB74C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TaskCloseBagMenu_2

	thumb_func_start sub_081AB754
sub_081AB754: @ 0x081AB754
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r5, #3
	ldr r0, _081AB770
	adds r4, r1, r0
	cmp r5, #3
	bgt _081AB774
	cmp r5, #2
	blt _081AB774
	adds r0, r4, #0
	bl SortBerriesOrTMHMs
	b _081AB77A
	.align 2, 0
_081AB770: .4byte 0x02039A78
_081AB774:
	adds r0, r4, #0
	bl CompactItemsInBagPocket
_081AB77A:
	ldr r0, _081AB7F4
	ldr r1, [r0]
	ldr r6, _081AB7F8
	adds r1, r1, r6
	adds r1, r1, r5
	movs r2, #0
	strb r2, [r1]
	adds r3, r0, #0
	ldrb r0, [r4, #4]
	cmp r2, r0
	bhs _081AB7BE
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _081AB7BE
	adds r7, r3, #0
_081AB79A:
	ldr r0, [r7]
	adds r0, r0, r6
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrb r1, [r4, #4]
	cmp r2, r1
	bhs _081AB7BE
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _081AB79A
_081AB7BE:
	ldr r2, [r3]
	ldr r1, _081AB7FC
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081AB7DA
	ldr r0, _081AB7F8
	adds r1, r2, r0
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_081AB7DA:
	ldr r1, [r3]
	ldr r2, _081AB7F8
	adds r0, r1, r2
	adds r0, r0, r5
	ldrb r2, [r0]
	cmp r2, #8
	bls _081AB804
	ldr r3, _081AB800
	adds r0, r1, r3
	adds r0, r0, r5
	movs r1, #8
	strb r1, [r0]
	b _081AB80C
	.align 2, 0
_081AB7F4: .4byte 0x0203CB20
_081AB7F8: .4byte 0x00000829
_081AB7FC: .4byte 0x0000081B
_081AB800: .4byte 0x0000082E
_081AB804:
	ldr r3, _081AB814
	adds r0, r1, r3
	adds r0, r0, r5
	strb r2, [r0]
_081AB80C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AB814: .4byte 0x0000082E
	thumb_func_end sub_081AB754

	thumb_func_start sub_081AB818
sub_081AB818: @ 0x081AB818
	push {r4, lr}
	movs r4, #0
_081AB81C:
	adds r0, r4, #0
	bl sub_081AB754
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _081AB81C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081AB818

	thumb_func_start SetInitialScrollAndCursorPositions
SetInitialScrollAndCursorPositions: @ 0x081AB834
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	ldr r2, _081AB864
	adds r4, r1, r2
	subs r2, #0xa
	adds r1, r1, r2
	ldr r2, _081AB868
	ldr r3, [r2]
	ldr r5, _081AB86C
	adds r2, r3, r5
	adds r2, r2, r0
	ldrb r2, [r2]
	subs r5, #5
	adds r3, r3, r5
	adds r3, r3, r0
	ldrb r3, [r3]
	adds r0, r4, #0
	bl sub_08122268
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081AB864: .4byte 0x0203CB36
_081AB868: .4byte 0x0203CB20
_081AB86C: .4byte 0x0000082E
	thumb_func_end SetInitialScrollAndCursorPositions

	thumb_func_start SetPocketListPositions
SetPocketListPositions: @ 0x081AB870
	push {r4, lr}
	movs r4, #0
_081AB874:
	adds r0, r4, #0
	bl SetInitialScrollAndCursorPositions
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _081AB874
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetPocketListPositions

	thumb_func_start sub_081AB88C
sub_081AB88C: @ 0x081AB88C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r5, #0
	ldr r6, _081AB8CC
	adds r7, r6, #0
	subs r7, #0xa
_081AB898:
	lsls r1, r5, #1
	adds r0, r1, r6
	adds r1, r1, r7
	ldr r2, _081AB8D0
	ldr r3, [r2]
	ldr r4, _081AB8D4
	adds r2, r3, r4
	adds r2, r2, r5
	ldrb r2, [r2]
	subs r4, #5
	adds r3, r3, r4
	adds r3, r3, r5
	ldrb r3, [r3]
	movs r4, #8
	str r4, [sp]
	bl sub_081222A4
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _081AB898
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AB8CC: .4byte 0x0203CB36
_081AB8D0: .4byte 0x0203CB20
_081AB8D4: .4byte 0x0000082E
	thumb_func_end sub_081AB88C

	thumb_func_start GetItemListPosition
GetItemListPosition: @ 0x081AB8D8
	lsls r0, r0, #0x18
	ldr r1, _081AB8F4
	lsrs r0, r0, #0x17
	adds r2, r1, #0
	adds r2, #0x12
	adds r2, r0, r2
	adds r1, #8
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_081AB8F4: .4byte 0x0203CB24
	thumb_func_end GetItemListPosition

	thumb_func_start DisplayItemMessage
DisplayItemMessage: @ 0x081AB8F8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081AB964
	adds r4, r4, r0
	movs r0, #4
	bl AddItemMessageWindow
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x14]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	bl GetPlayerTextSpeedDelay
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4, #0x14]
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	mov r0, sb
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0xa
	movs r3, #0xd
	bl DisplayMessageAndContinueTask
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AB964: .4byte 0x03005B68
	thumb_func_end DisplayItemMessage

	thumb_func_start BagMenu_InitListsMenu
BagMenu_InitListsMenu: @ 0x081AB968
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r6, #2
	adds r5, r5, r6
	lsls r5, r5, #3
	ldr r0, _081AB9DC
	adds r5, r5, r0
	ldr r7, _081AB9E0
	ldrb r4, [r7, #5]
	lsls r4, r4, #1
	movs r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	add r8, r4
	adds r0, r7, #0
	adds r0, #8
	adds r4, r4, r0
	movs r0, #4
	bl bag_menu_RemoveBagItem_message_window
	ldrb r0, [r5]
	mov r1, r8
	adds r2, r4, #0
	bl DestroyListMenuTask
	ldrb r0, [r7, #5]
	bl sub_081AB754
	ldrb r0, [r7, #5]
	bl SetInitialScrollAndCursorPositions
	ldrb r0, [r7, #5]
	bl LoadBagItemListBuffers
	ldr r0, _081AB9E4
	mov r2, r8
	ldrh r1, [r2]
	ldrh r2, [r4]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, #0
	bl set_callback3_to_bag
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AB9DC: .4byte 0x03005B68
_081AB9E0: .4byte 0x0203CB24
_081AB9E4: .4byte 0x03006050
	thumb_func_end BagMenu_InitListsMenu

	thumb_func_start PrintItemDepositAmount
PrintItemDepositAmount: @ 0x081AB9E8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081ABA00
	ldrb r0, [r0, #5]
	cmp r0, #3
	bne _081ABA04
	movs r6, #4
	movs r3, #3
	b _081ABA08
	.align 2, 0
_081ABA00: .4byte 0x0203CB24
_081ABA04:
	movs r6, #8
	movs r3, #2
_081ABA08:
	ldr r0, _081ABA44
	movs r1, #1
	movs r2, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081ABA48
	ldr r1, _081ABA4C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r5, #0
	bl BagMenu_AddWindow
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r6, #0
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081ABA44: .4byte 0x02021C40
_081ABA48: .4byte 0x02021C7C
_081ABA4C: .4byte 0x085C943C
	thumb_func_end PrintItemDepositAmount

	thumb_func_start sub_081ABA50
sub_081ABA50: @ 0x081ABA50
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _081ABA6C
	ldrb r0, [r0, #5]
	cmp r0, #3
	bne _081ABA70
	movs r5, #4
	movs r3, #3
	b _081ABA74
	.align 2, 0
_081ABA6C: .4byte 0x0203CB24
_081ABA70:
	movs r5, #8
	movs r3, #2
_081ABA74:
	ldr r0, _081ABAA8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081ABAAC
	ldr r1, _081ABAB0
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r3, r5, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081ABAA8: .4byte 0x02021C40
_081ABAAC: .4byte 0x02021C7C
_081ABAB0: .4byte 0x085C943C
	thumb_func_end sub_081ABA50

	thumb_func_start Task_BagMenu
Task_BagMenu: @ 0x081ABAB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	str r0, [sp]
	ldr r1, _081ABB34
	adds r6, r0, r1
	ldr r5, _081ABB38
	ldrb r0, [r5, #5]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x12
	adds r7, r0, r1
	subs r1, #0xa
	adds r0, r0, r1
	mov r8, r0
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081ABAF2
	b _081ABC3E
_081ABAF2:
	ldr r0, _081ABB3C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081ABB00
	b _081ABC3E
_081ABB00:
	bl GetSwitchBagPocketDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081ABB44
	cmp r0, #2
	beq _081ABB4C
	ldr r0, _081ABB40
	ldrh r1, [r0, #0x2e]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #0
	beq _081ABB9C
	bl sub_081AC084
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081ABB30
	b _081ABC3E
_081ABB30:
	b _081ABB58
	.align 2, 0
_081ABB34: .4byte 0x03005B68
_081ABB38: .4byte 0x0203CB24
_081ABB3C: .4byte 0x02037C74
_081ABB40: .4byte 0x03002360
_081ABB44:
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sb
	b _081ABB50
_081ABB4C:
	mov r0, sb
	movs r1, #1
_081ABB50:
	movs r2, #0
	bl SwitchBagPocket
	b _081ABC3E
_081ABB58:
	ldrb r0, [r6]
	adds r1, r7, #0
	mov r2, r8
	bl ListMenuGetScrollAndRow
	ldrh r2, [r7]
	mov r3, r8
	ldrh r0, [r3]
	adds r2, r2, r0
	ldr r0, _081ABB90
	ldr r0, [r0]
	ldr r1, _081ABB94
	ldr r3, _081ABB98
	adds r0, r0, r3
	ldrb r1, [r1, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _081ABC3E
	movs r0, #5
	bl PlaySE
	mov r0, sb
	bl BagMenu_SwapItems
	b _081ABC3E
	.align 2, 0
_081ABB90: .4byte 0x0203CB20
_081ABB94: .4byte 0x0203CB24
_081ABB98: .4byte 0x00000829
_081ABB9C:
	ldrb r0, [r6]
	bl ListMenu_ProcessInput
	adds r4, r0, #0
	ldrb r0, [r6]
	adds r1, r7, #0
	mov r2, r8
	bl ListMenuGetScrollAndRow
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _081ABBBE
	adds r0, #1
	cmp r4, r0
	bne _081ABBF4
	b _081ABC3E
_081ABBBE:
	ldrb r0, [r5, #4]
	cmp r0, #5
	bne _081ABBCC
	movs r0, #0x20
	bl PlaySE
	b _081ABC3E
_081ABBCC:
	movs r0, #5
	bl PlaySE
	ldr r0, _081ABBE8
	mov r1, sl
	strh r1, [r0]
	ldr r0, _081ABBEC
	subs r0, #8
	ldr r3, [sp]
	adds r0, r3, r0
	ldr r1, _081ABBF0
	str r1, [r0]
	b _081ABC3E
	.align 2, 0
_081ABBE8: .4byte 0x0203CB48
_081ABBEC: .4byte 0x03005B68
_081ABBF0: .4byte 0x081AB6A5
_081ABBF4:
	movs r0, #5
	bl PlaySE
	bl sub_081AB5D0
	ldrb r0, [r6]
	movs r1, #2
	bl BagMenu_PrintCursor_
	strh r4, [r6, #2]
	ldrb r0, [r5, #5]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl BagGetQuantityByPocketPosition
	strh r0, [r6, #4]
	ldrb r0, [r5, #5]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl BagGetItemIdByPocketPosition
	ldr r1, _081ABC50
	strh r0, [r1]
	ldr r1, _081ABC54
	ldrb r0, [r5, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	mov r0, sb
	bl _call_via_r1
_081ABC3E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081ABC50: .4byte 0x0203CB48
_081ABC54: .4byte 0x085DF88C
	thumb_func_end Task_BagMenu

	thumb_func_start set_callback3_to_bag
set_callback3_to_bag: @ 0x081ABC58
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl bag_menu_add_pocket_scroll_arrow_indicators_maybe
	bl bag_menu_add_list_scroll_arrow_indicators_maybe
	movs r0, #3
	bl ClearWindowTilemap
	movs r0, #4
	bl ClearWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081ABC94
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081ABC98
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081ABC94: .4byte 0x03005B60
_081ABC98: .4byte 0x081ABAB5
	thumb_func_end set_callback3_to_bag

	thumb_func_start GetSwitchBagPocketDirection
GetSwitchBagPocketDirection: @ 0x081ABC9C
	push {lr}
	ldr r0, _081ABCD4
	ldr r0, [r0]
	ldr r1, _081ABCD8
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _081ABCF6
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081ABCDC
	ldrh r1, [r0, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081ABCC8
	cmp r2, #1
	bne _081ABCE0
_081ABCC8:
	movs r0, #5
	bl PlaySE
	movs r0, #1
	b _081ABCF8
	.align 2, 0
_081ABCD4: .4byte 0x0203CB20
_081ABCD8: .4byte 0x0000081B
_081ABCDC: .4byte 0x03002360
_081ABCE0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _081ABCEC
	cmp r2, #2
	bne _081ABCF6
_081ABCEC:
	movs r0, #5
	bl PlaySE
	movs r0, #2
	b _081ABCF8
_081ABCF6:
	movs r0, #0
_081ABCF8:
	pop {r1}
	bx r1
	thumb_func_end GetSwitchBagPocketDirection

	thumb_func_start ChangeBagPocketId
ChangeBagPocketId: @ 0x081ABCFC
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne _081ABD14
	ldrb r0, [r2]
	cmp r0, #4
	bne _081ABD14
	movs r0, #0
	b _081ABD2C
_081ABD14:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	ldrb r3, [r2]
	cmp r0, r1
	bne _081ABD2A
	cmp r3, #0
	bne _081ABD2A
	movs r0, #4
	b _081ABD2C
_081ABD2A:
	adds r0, r3, r4
_081ABD2C:
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ChangeBagPocketId

	thumb_func_start SwitchBagPocket
SwitchBagPocket: @ 0x081ABD34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _081ABDFC
	adds r4, r0, r1
	movs r0, #0
	strh r0, [r4, #0x1a]
	strh r0, [r4, #0x18]
	strh r5, [r4, #0x16]
	cmp r2, #0
	bne _081ABDB6
	movs r0, #0
	bl ClearWindowTilemap
	movs r0, #1
	bl ClearWindowTilemap
	ldrb r0, [r4]
	ldr r3, _081ABE00
	ldrb r2, [r3, #5]
	lsls r2, r2, #1
	adds r1, r3, #0
	adds r1, #0x12
	adds r1, r2, r1
	adds r3, #8
	adds r2, r2, r3
	bl DestroyListMenuTask
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r3, _081ABE04
	ldr r0, _081ABE08
	ldr r2, [r0]
	ldr r1, _081ABE0C
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	movs r0, #1
	eors r0, r1
	adds r2, r2, r0
	ldr r0, _081ABE10
	adds r2, r2, r0
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	bl sub_081AB5D0
_081ABDB6:
	ldr r6, _081ABE00
	ldrb r1, [r6, #5]
	add r0, sp, #8
	strb r1, [r0]
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl ChangeBagPocketId
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	mov r8, r0
	cmp r1, #1
	bne _081ABE1C
	ldr r4, _081ABE14
	ldrb r0, [r6, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	ldr r5, _081ABE18
	adds r1, r1, r5
	adds r0, r4, #0
	bl StringCopy
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	adds r1, r1, r5
	adds r0, r4, #0
	bl StringAppend
	adds r0, r4, #0
	movs r1, #0
	bl sub_081AB4A0
	b _081ABE46
	.align 2, 0
_081ABDFC: .4byte 0x03005B68
_081ABE00: .4byte 0x0203CB24
_081ABE04: .4byte 0x020205AC
_081ABE08: .4byte 0x0203CB20
_081ABE0C: .4byte 0x0000081B
_081ABE10: .4byte 0x00000806
_081ABE14: .4byte 0x02021C7C
_081ABE18: .4byte 0x085C9742
_081ABE1C:
	ldr r4, _081ABEAC
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	ldr r5, _081ABEB0
	adds r1, r1, r5
	adds r0, r4, #0
	bl StringCopy
	ldrb r0, [r6, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	adds r1, r1, r5
	adds r0, r4, #0
	bl StringAppend
	adds r0, r4, #0
	movs r1, #8
	bl sub_081AB4A0
_081ABE46:
	ldr r0, _081ABEB4
	ldrb r0, [r0, #5]
	movs r1, #0
	bl BagMenu_DrawPocketIndicatorSquare
	add r0, sp, #8
	ldrb r0, [r0]
	movs r1, #1
	bl BagMenu_DrawPocketIndicatorSquare
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0xb
	movs r2, #0xe
	movs r3, #2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add r0, sp, #8
	ldrb r0, [r0]
	movs r1, #1
	bl SetBagVisualPocketId
	movs r0, #1
	bl RemoveBagSprite
	mov r1, r8
	asrs r0, r1, #0x10
	bl AddSwitchPocketRotatingBallSprite
	ldr r1, _081ABEB8
	ldr r2, _081ABEBC
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r7, #0
	bl SetTaskFuncWithFollowupFunc
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081ABEAC: .4byte 0x02021C7C
_081ABEB0: .4byte 0x085C9742
_081ABEB4: .4byte 0x0203CB24
_081ABEB8: .4byte 0x081ABEC1
_081ABEBC: .4byte 0x03005B60
	thumb_func_end SwitchBagPocket

	thumb_func_start sub_081ABEC0
sub_081ABEC0: @ 0x081ABEC0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _081ABEF8
	adds r6, r0, r1
	bl sub_081221B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081ABF38
	bl IsWallysBag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081ABF38
	bl GetSwitchBagPocketDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081ABEFC
	cmp r0, #2
	beq _081ABF18
	b _081ABF38
	.align 2, 0
_081ABEF8: .4byte 0x03005B68
_081ABEFC:
	ldr r0, _081ABF14
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	bl ChangeBagPocketId
	adds r0, r7, #0
	bl SwitchTaskToFollowupFunc
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	b _081ABF2C
	.align 2, 0
_081ABF14: .4byte 0x0203CB29
_081ABF18:
	ldr r0, _081ABF34
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	bl ChangeBagPocketId
	adds r0, r7, #0
	bl SwitchTaskToFollowupFunc
	adds r0, r7, #0
	movs r1, #1
_081ABF2C:
	movs r2, #1
	bl SwitchBagPocket
	b _081ABFF2
	.align 2, 0
_081ABF34: .4byte 0x0203CB29
_081ABF38:
	movs r1, #0x1a
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _081ABF46
	cmp r0, #1
	beq _081ABFA0
	b _081ABFF2
_081ABF46:
	ldrb r0, [r6, #0x18]
	bl bag_menu_leave_maybe
	ldrh r0, [r6, #0x18]
	adds r1, r0, #1
	strh r1, [r6, #0x18]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081ABF8A
	movs r2, #0x16
	ldrsh r0, [r6, r2]
	cmp r0, #1
	bne _081ABF78
	ldr r0, _081ABF74
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_081AB4A0
	b _081ABF8A
	.align 2, 0
_081ABF74: .4byte 0x02021C7C
_081ABF78:
	ldr r0, _081ABF9C
	lsls r2, r1, #0x10
	asrs r2, r2, #0x11
	movs r1, #8
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_081AB4A0
_081ABF8A:
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	cmp r0, #0x10
	bne _081ABFF2
	ldrh r0, [r6, #0x1a]
	adds r0, #1
	strh r0, [r6, #0x1a]
	b _081ABFF2
	.align 2, 0
_081ABF9C: .4byte 0x02021C7C
_081ABFA0:
	ldr r4, _081ABFF8
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	adds r0, r4, #0
	bl ChangeBagPocketId
	subs r5, r4, #5
	ldrb r0, [r5, #5]
	bl LoadBagItemListBuffers
	ldr r0, _081ABFFC
	ldrb r2, [r5, #5]
	lsls r2, r2, #1
	adds r1, r4, #0
	adds r1, #0xd
	adds r1, r2, r1
	ldrh r1, [r1]
	adds r4, #3
	adds r2, r2, r4
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #2
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	bl bag_menu_add_pocket_scroll_arrow_indicators_maybe
	bl bag_menu_add_list_scroll_arrow_indicators_maybe
	adds r0, r7, #0
	bl SwitchTaskToFollowupFunc
_081ABFF2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081ABFF8: .4byte 0x0203CB29
_081ABFFC: .4byte 0x03006050
	thumb_func_end sub_081ABEC0

	thumb_func_start bag_menu_leave_maybe
bag_menu_leave_maybe: @ 0x081AC000
	push {lr}
	sub sp, #8
	adds r3, r0, #0
	lsls r3, r3, #0x18
	movs r0, #0x80
	lsls r0, r0, #0x12
	adds r3, r3, r0
	lsrs r3, r3, #0x18
	movs r0, #0xf
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0x11
	movs r2, #0xe
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end bag_menu_leave_maybe

	thumb_func_start BagMenu_DrawPocketIndicatorSquare
BagMenu_DrawPocketIndicatorSquare: @ 0x081AC030
	push {lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _081AC05C
	ldr r1, _081AC058
	adds r2, r0, #5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r3, #3
	bl FillBgTilemapBufferRect_Palette0
	b _081AC072
	.align 2, 0
_081AC058: .4byte 0x00001017
_081AC05C:
	ldr r1, _081AC080
	adds r2, r0, #5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r3, #3
	bl FillBgTilemapBufferRect_Palette0
_081AC072:
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_081AC080: .4byte 0x0000102B
	thumb_func_end BagMenu_DrawPocketIndicatorSquare

	thumb_func_start sub_081AC084
sub_081AC084: @ 0x081AC084
	push {lr}
	ldr r1, _081AC0A0
	ldrb r0, [r1, #4]
	cmp r0, #1
	bhi _081AC0A4
	ldrb r0, [r1, #5]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _081AC0A4
	movs r0, #1
	b _081AC0A6
	.align 2, 0
_081AC0A0: .4byte 0x0203CB24
_081AC0A4:
	movs r0, #0
_081AC0A6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081AC084

	thumb_func_start BagMenu_SwapItems
BagMenu_SwapItems: @ 0x081AC0AC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081AC164
	mov sb, r0
	adds r6, r4, r0
	ldrb r0, [r6]
	movs r1, #0x10
	movs r2, #1
	bl ListMenuSetUnkIndicatorsStructField
	ldr r3, _081AC168
	ldrb r0, [r3, #5]
	lsls r0, r0, #1
	adds r2, r3, #0
	adds r2, #0x12
	adds r2, r0, r2
	adds r1, r3, #0
	adds r1, #8
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r1, r2
	strh r1, [r6, #2]
	ldr r0, _081AC16C
	ldr r0, [r0]
	ldr r2, _081AC170
	adds r0, r0, r2
	movs r5, #0
	strb r1, [r0]
	ldrb r0, [r3, #5]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #2]
	bl BagGetItemIdByPocketPosition
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _081AC174
	bl CopyItemName
	ldr r0, _081AC178
	mov r8, r0
	ldr r1, _081AC17C
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	str r0, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	mov r2, r8
	movs r3, #0
	bl BagMenu_Print
	ldrb r0, [r6, #2]
	bl sub_080D4870
	bl sub_081AB648
	ldrb r0, [r6]
	movs r1, #2
	bl BagMenu_PrintCursor_
	movs r2, #8
	rsbs r2, r2, #0
	add sb, r2
	add r4, sb
	ldr r0, _081AC180
	str r0, [r4]
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AC164: .4byte 0x03005B68
_081AC168: .4byte 0x0203CB24
_081AC16C: .4byte 0x0203CB20
_081AC170: .4byte 0x0000081A
_081AC174: .4byte 0x02021C40
_081AC178: .4byte 0x02021C7C
_081AC17C: .4byte 0x085C947F
_081AC180: .4byte 0x081AC185
	thumb_func_end BagMenu_SwapItems

	thumb_func_start sub_081AC184
sub_081AC184: @ 0x081AC184
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081AC1D0
	adds r4, r0, r1
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081AC252
	ldr r0, _081AC1D4
	mov r8, r0
	ldrh r1, [r0, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081AC1DC
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	ldr r3, _081AC1D8
	ldrb r2, [r3, #5]
	lsls r2, r2, #1
	adds r1, r3, #0
	adds r1, #0x12
	adds r1, r2, r1
	adds r3, #8
	adds r2, r2, r3
	bl ListMenuGetScrollAndRow
	b _081AC236
	.align 2, 0
_081AC1D0: .4byte 0x03005B68
_081AC1D4: .4byte 0x03002360
_081AC1D8: .4byte 0x0203CB24
_081AC1DC:
	ldrb r0, [r4]
	bl ListMenu_ProcessInput
	adds r7, r0, #0
	ldrb r0, [r4]
	ldr r5, _081AC220
	ldrb r2, [r5, #5]
	lsls r2, r2, #1
	adds r1, r5, #0
	adds r1, #0x12
	adds r1, r2, r1
	adds r4, r5, #0
	adds r4, #8
	adds r2, r2, r4
	bl ListMenuGetScrollAndRow
	movs r0, #0
	bl sub_080D484C
	ldrb r0, [r5, #5]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_080D4870
	movs r0, #2
	rsbs r0, r0, #0
	cmp r7, r0
	beq _081AC224
	adds r0, #1
	cmp r7, r0
	bne _081AC246
	b _081AC252
	.align 2, 0
_081AC220: .4byte 0x0203CB24
_081AC224:
	movs r0, #5
	bl PlaySE
	mov r0, r8
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081AC23E
_081AC236:
	adds r0, r6, #0
	bl sub_081AC25C
	b _081AC252
_081AC23E:
	adds r0, r6, #0
	bl sub_081AC354
	b _081AC252
_081AC246:
	movs r0, #5
	bl PlaySE
	adds r0, r6, #0
	bl sub_081AC25C
_081AC252:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081AC184

	thumb_func_start sub_081AC25C
sub_081AC25C: @ 0x081AC25C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	mov sl, r0
	ldr r0, _081AC2B0
	add r0, sl
	mov sb, r0
	ldr r5, _081AC2B4
	ldrb r6, [r5, #5]
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r2, _081AC2B8
	adds r7, r1, r2
	ldrh r0, [r7]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, sb
	movs r1, #2
	ldrsh r2, [r0, r1]
	cmp r2, r4
	beq _081AC2A6
	subs r0, r4, #1
	cmp r2, r0
	bne _081AC2BC
_081AC2A6:
	adds r0, r3, #0
	bl sub_081AC354
	b _081AC32A
	.align 2, 0
_081AC2B0: .4byte 0x03005B68
_081AC2B4: .4byte 0x0203CB24
_081AC2B8: .4byte 0x0203CB2C
_081AC2BC:
	ldr r1, _081AC338
	lsls r0, r6, #3
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	adds r2, r4, #0
	bl MoveItemSlotInList
	ldr r0, _081AC33C
	ldr r0, [r0]
	ldr r2, _081AC340
	adds r0, r0, r2
	movs r1, #0xff
	strb r1, [r0]
	mov r1, sb
	ldrb r0, [r1]
	mov r1, r8
	adds r2, r7, #0
	bl DestroyListMenuTask
	mov r2, sb
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, r4
	bge _081AC2FC
	ldrb r1, [r5, #5]
	lsls r1, r1, #1
	ldr r2, _081AC344
	adds r1, r1, r2
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_081AC2FC:
	ldrb r0, [r5, #5]
	bl LoadBagItemListBuffers
	ldr r0, _081AC348
	mov r2, r8
	ldrh r1, [r2]
	ldrh r2, [r7]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	strh r0, [r1]
	movs r0, #1
	bl sub_080D484C
	bl bag_menu_add_list_scroll_arrow_indicators_maybe
	ldr r0, _081AC34C
	subs r0, #8
	add r0, sl
	ldr r1, _081AC350
	str r1, [r0]
_081AC32A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AC338: .4byte 0x02039A78
_081AC33C: .4byte 0x0203CB20
_081AC340: .4byte 0x0000081A
_081AC344: .4byte 0x0203CB2C
_081AC348: .4byte 0x03006050
_081AC34C: .4byte 0x03005B68
_081AC350: .4byte 0x081ABAB5
	thumb_func_end sub_081AC25C

	thumb_func_start sub_081AC354
sub_081AC354: @ 0x081AC354
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	mov sb, r1
	ldr r0, _081AC3F0
	mov sl, r0
	mov r7, sb
	add r7, sl
	ldr r4, _081AC3F4
	ldrb r0, [r4, #5]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r6, r0, r1
	movs r1, #8
	adds r1, r1, r4
	mov r8, r1
	adds r5, r0, r1
	ldr r0, _081AC3F8
	ldr r0, [r0]
	ldr r1, _081AC3FC
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldrb r0, [r7]
	adds r1, r6, #0
	adds r2, r5, #0
	bl DestroyListMenuTask
	movs r0, #2
	ldrsh r2, [r7, r0]
	ldrh r0, [r6]
	ldrh r1, [r5]
	adds r0, r0, r1
	cmp r2, r0
	bge _081AC3B6
	ldrb r1, [r4, #5]
	lsls r1, r1, #1
	add r1, r8
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_081AC3B6:
	ldrb r0, [r4, #5]
	bl LoadBagItemListBuffers
	ldr r0, _081AC400
	ldrh r1, [r6]
	ldrh r2, [r5]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7]
	movs r0, #1
	bl sub_080D484C
	bl bag_menu_add_list_scroll_arrow_indicators_maybe
	mov r0, sl
	subs r0, #8
	add r0, sb
	ldr r1, _081AC404
	str r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AC3F0: .4byte 0x03005B68
_081AC3F4: .4byte 0x0203CB24
_081AC3F8: .4byte 0x0203CB20
_081AC3FC: .4byte 0x0000081A
_081AC400: .4byte 0x03006050
_081AC404: .4byte 0x081ABAB5
	thumb_func_end sub_081AC354

	thumb_func_start sub_081AC408
sub_081AC408: @ 0x081AC408
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r0, _081AC424
	ldrb r0, [r0, #4]
	subs r0, #1
	cmp r0, #9
	bls _081AC418
	b _081AC5F0
_081AC418:
	lsls r0, r0, #2
	ldr r1, _081AC428
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081AC424: .4byte 0x0203CB24
_081AC428: .4byte 0x081AC42C
_081AC42C: @ jump table
	.4byte _081AC454 @ case 0
	.4byte _081AC5F0 @ case 1
	.4byte _081AC5F0 @ case 2
	.4byte _081AC5F0 @ case 3
	.4byte _081AC4AC @ case 4
	.4byte _081AC5F0 @ case 5
	.4byte _081AC530 @ case 6
	.4byte _081AC590 @ case 7
	.4byte _081AC4D0 @ case 8
	.4byte _081AC454 @ case 9
_081AC454:
	ldr r0, _081AC478
	ldrh r0, [r0]
	bl ItemId_GetSecondaryId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AC488
	ldr r0, _081AC47C
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC480
	str r0, [r2]
	ldr r0, _081AC484
	adds r1, r1, r0
	movs r0, #2
	b _081AC7D4
	.align 2, 0
_081AC478: .4byte 0x0203CB48
_081AC47C: .4byte 0x0203CB20
_081AC480: .4byte 0x085DF87A
_081AC484: .4byte 0x00000828
_081AC488:
	ldr r0, _081AC4A0
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC4A4
	str r0, [r2]
	ldr r0, _081AC4A8
	adds r1, r1, r0
	movs r0, #1
	b _081AC7D4
	.align 2, 0
_081AC4A0: .4byte 0x0203CB20
_081AC4A4: .4byte 0x085DF87E
_081AC4A8: .4byte 0x00000828
_081AC4AC:
	ldr r0, _081AC4C4
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC4C8
	str r0, [r2]
	ldr r0, _081AC4CC
	adds r1, r1, r0
	movs r0, #4
	b _081AC7D4
	.align 2, 0
_081AC4C4: .4byte 0x0203CB20
_081AC4C8: .4byte 0x085DF87F
_081AC4CC: .4byte 0x00000828
_081AC4D0:
	ldr r4, _081AC4FC
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AC50C
	ldrh r0, [r4]
	cmp r0, #0xaf
	beq _081AC50C
	ldr r0, _081AC500
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC504
	str r0, [r2]
	ldr r0, _081AC508
	adds r1, r1, r0
	movs r0, #2
	b _081AC7D4
	.align 2, 0
_081AC4FC: .4byte 0x0203CB48
_081AC500: .4byte 0x0203CB20
_081AC504: .4byte 0x085DF883
_081AC508: .4byte 0x00000828
_081AC50C:
	ldr r0, _081AC524
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC528
	str r0, [r2]
	ldr r0, _081AC52C
	adds r1, r1, r0
	movs r0, #1
	b _081AC7D4
	.align 2, 0
_081AC524: .4byte 0x0203CB20
_081AC528: .4byte 0x085DF87E
_081AC52C: .4byte 0x00000828
_081AC530:
	ldr r4, _081AC55C
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AC56C
	ldrh r0, [r4]
	cmp r0, #0xaf
	beq _081AC56C
	ldr r0, _081AC560
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC564
	str r0, [r2]
	ldr r0, _081AC568
	adds r1, r1, r0
	movs r0, #2
	b _081AC7D4
	.align 2, 0
_081AC55C: .4byte 0x0203CB48
_081AC560: .4byte 0x0203CB20
_081AC564: .4byte 0x085DF885
_081AC568: .4byte 0x00000828
_081AC56C:
	ldr r0, _081AC584
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC588
	str r0, [r2]
	ldr r0, _081AC58C
	adds r1, r1, r0
	movs r0, #1
	b _081AC7D4
	.align 2, 0
_081AC584: .4byte 0x0203CB20
_081AC588: .4byte 0x085DF87E
_081AC58C: .4byte 0x00000828
_081AC590:
	ldr r4, _081AC5BC
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AC5CC
	ldrh r0, [r4]
	cmp r0, #0xaf
	beq _081AC5CC
	ldr r0, _081AC5C0
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC5C4
	str r0, [r2]
	ldr r0, _081AC5C8
	adds r1, r1, r0
	movs r0, #2
	b _081AC7D4
	.align 2, 0
_081AC5BC: .4byte 0x0203CB48
_081AC5C0: .4byte 0x0203CB20
_081AC5C4: .4byte 0x085DF887
_081AC5C8: .4byte 0x00000828
_081AC5CC:
	ldr r0, _081AC5E4
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC5E8
	str r0, [r2]
	ldr r0, _081AC5EC
	adds r1, r1, r0
	movs r0, #1
	b _081AC7D4
	.align 2, 0
_081AC5E4: .4byte 0x0203CB20
_081AC5E8: .4byte 0x085DF87E
_081AC5EC: .4byte 0x00000828
_081AC5F0:
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081AC604
	bl InUnionRoom
	cmp r0, #1
	bne _081AC668
_081AC604:
	ldr r0, _081AC630
	ldrb r0, [r0, #5]
	cmp r0, #4
	beq _081AC61A
	ldr r0, _081AC634
	ldrh r0, [r0]
	bl sub_08122154
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AC644
_081AC61A:
	ldr r0, _081AC638
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC63C
	str r0, [r2]
	ldr r0, _081AC640
	adds r1, r1, r0
	movs r0, #1
	b _081AC7D4
	.align 2, 0
_081AC630: .4byte 0x0203CB24
_081AC634: .4byte 0x0203CB48
_081AC638: .4byte 0x0203CB20
_081AC63C: .4byte 0x085DF87E
_081AC640: .4byte 0x00000828
_081AC644:
	ldr r0, _081AC65C
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC660
	str r0, [r2]
	ldr r0, _081AC664
	adds r1, r1, r0
	movs r0, #2
	b _081AC7D4
	.align 2, 0
_081AC65C: .4byte 0x0203CB20
_081AC660: .4byte 0x085DF87C
_081AC664: .4byte 0x00000828
_081AC668:
	ldr r0, _081AC67C
	ldrb r0, [r0, #5]
	cmp r0, #4
	bls _081AC672
	b _081AC7D6
_081AC672:
	lsls r0, r0, #2
	ldr r1, _081AC680
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081AC67C: .4byte 0x0203CB24
_081AC680: .4byte 0x081AC684
_081AC684: @ jump table
	.4byte _081AC698 @ case 0
	.4byte _081AC778 @ case 1
	.4byte _081AC79C @ case 2
	.4byte _081AC7C0 @ case 3
	.4byte _081AC6F0 @ case 4
_081AC698:
	ldr r4, _081AC6DC
	ldr r1, [r4]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r3, _081AC6E0
	adds r0, r1, r3
	str r0, [r2]
	ldr r0, _081AC6E4
	adds r1, r1, r0
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r0, r3
	ldr r1, _081AC6E8
	movs r2, #4
	bl memcpy
	ldr r0, _081AC6EC
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081AC6CE
	b _081AC7D6
_081AC6CE:
	ldr r0, [r4]
	ldr r1, _081AC6E0
	adds r0, r0, r1
	movs r1, #6
	strb r1, [r0]
	b _081AC7D6
	.align 2, 0
_081AC6DC: .4byte 0x0203CB20
_081AC6E0: .4byte 0x00000824
_081AC6E4: .4byte 0x00000828
_081AC6E8: .4byte 0x085DF864
_081AC6EC: .4byte 0x0203CB48
_081AC6F0:
	ldr r4, _081AC754
	ldr r1, [r4]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r5, _081AC758
	adds r0, r1, r5
	str r0, [r2]
	ldr r0, _081AC75C
	adds r1, r1, r0
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r0, r5
	ldr r1, _081AC760
	movs r2, #4
	bl memcpy
	ldr r0, _081AC764
	ldr r0, [r0]
	ldr r1, _081AC768
	adds r0, r0, r1
	ldr r2, _081AC76C
	ldrh r0, [r0]
	ldrh r1, [r2]
	cmp r0, r1
	bne _081AC730
	ldr r0, [r4]
	ldr r1, _081AC770
	adds r0, r0, r1
	movs r1, #8
	strb r1, [r0]
_081AC730:
	ldrh r1, [r2]
	ldr r0, _081AC774
	cmp r1, r0
	beq _081AC73E
	adds r0, #0xd
	cmp r1, r0
	bne _081AC7D6
_081AC73E:
	movs r0, #6
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AC7D6
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #7
	strb r1, [r0]
	b _081AC7D6
	.align 2, 0
_081AC754: .4byte 0x0203CB20
_081AC758: .4byte 0x00000824
_081AC75C: .4byte 0x00000828
_081AC760: .4byte 0x085DF868
_081AC764: .4byte 0x03005AEC
_081AC768: .4byte 0x00000496
_081AC76C: .4byte 0x0203CB48
_081AC770: .4byte 0x00000825
_081AC774: .4byte 0x00000103
_081AC778:
	ldr r0, _081AC790
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC794
	str r0, [r2]
	ldr r0, _081AC798
	adds r1, r1, r0
	movs r0, #4
	b _081AC7D4
	.align 2, 0
_081AC790: .4byte 0x0203CB20
_081AC794: .4byte 0x085DF86C
_081AC798: .4byte 0x00000828
_081AC79C:
	ldr r0, _081AC7B4
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC7B8
	str r0, [r2]
	ldr r0, _081AC7BC
	adds r1, r1, r0
	movs r0, #4
	b _081AC7D4
	.align 2, 0
_081AC7B4: .4byte 0x0203CB20
_081AC7B8: .4byte 0x085DF870
_081AC7BC: .4byte 0x00000828
_081AC7C0:
	ldr r0, _081AC800
	ldr r1, [r0]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r2, r1, r0
	ldr r0, _081AC804
	str r0, [r2]
	ldr r0, _081AC808
	adds r1, r1, r0
	movs r0, #6
_081AC7D4:
	strb r0, [r1]
_081AC7D6:
	ldr r0, _081AC80C
	ldrb r0, [r0, #5]
	cmp r0, #2
	bne _081AC814
	movs r0, #1
	bl ClearWindowTilemap
	ldr r0, _081AC810
	ldrh r0, [r0]
	bl PrintTMHMMoveData
	movs r0, #3
	bl PutWindowTilemap
	movs r0, #4
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	b _081AC84A
	.align 2, 0
_081AC800: .4byte 0x0203CB20
_081AC804: .4byte 0x085DF874
_081AC808: .4byte 0x00000828
_081AC80C: .4byte 0x0203CB24
_081AC810: .4byte 0x0203CB48
_081AC814:
	ldr r0, _081AC85C
	ldrh r0, [r0]
	ldr r1, _081AC860
	bl CopyItemName
	ldr r4, _081AC864
	ldr r1, _081AC868
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl BagMenu_Print
_081AC84A:
	ldr r0, _081AC86C
	ldr r0, [r0]
	ldr r1, _081AC870
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _081AC874
	movs r0, #0
	b _081AC87A
	.align 2, 0
_081AC85C: .4byte 0x0203CB48
_081AC860: .4byte 0x02021C40
_081AC864: .4byte 0x02021C7C
_081AC868: .4byte 0x085C9450
_081AC86C: .4byte 0x0203CB20
_081AC870: .4byte 0x00000828
_081AC874:
	cmp r0, #2
	bne _081AC888
	movs r0, #1
_081AC87A:
	bl BagMenu_AddWindow
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081AC8BC
	b _081AC8B2
_081AC888:
	cmp r0, #4
	bne _081AC8A0
	movs r0, #2
	bl BagMenu_AddWindow
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	movs r2, #2
	bl sub_081AC938
	b _081AC8B2
_081AC8A0:
	movs r0, #3
	bl BagMenu_AddWindow
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	movs r2, #3
	bl sub_081AC938
_081AC8B2:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081AC408

	thumb_func_start sub_081AC8BC
sub_081AC8BC: @ 0x081AC8BC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x14
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r6, _081AC92C
	ldr r1, [r6]
	ldr r5, _081AC930
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp, #8]
	ldr r0, _081AC934
	str r0, [sp, #0xc]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #8
	movs r3, #2
	bl AddItemMenuActionTextPrinters
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AC92C: .4byte 0x0203CB20
_081AC930: .4byte 0x00000828
_081AC934: .4byte 0x085DF7EC
	thumb_func_end sub_081AC8BC

	thumb_func_start sub_081AC938
sub_081AC938: @ 0x081AC938
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x14
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0x30
	mov r8, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	ldr r0, _081AC9A0
	str r0, [sp, #0xc]
	ldr r0, _081AC9A4
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x10]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #8
	movs r3, #2
	bl sub_08198ECC
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081990E4
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AC9A0: .4byte 0x085DF7EC
_081AC9A4: .4byte 0x0203CB20
	thumb_func_end sub_081AC938

	thumb_func_start unknown_item_menu_type
unknown_item_menu_type: @ 0x081AC9A8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_081AC408
	ldr r0, _081AC9D0
	ldr r0, [r0]
	ldr r1, _081AC9D4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bhi _081AC9E0
	ldr r0, _081AC9D8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081AC9DC
	b _081AC9EC
	.align 2, 0
_081AC9D0: .4byte 0x0203CB20
_081AC9D4: .4byte 0x00000828
_081AC9D8: .4byte 0x03005B60
_081AC9DC: .4byte 0x081AC9FD
_081AC9E0:
	ldr r0, _081AC9F4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081AC9F8
_081AC9EC:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AC9F4: .4byte 0x03005B60
_081AC9F8: .4byte 0x081ACA71
	thumb_func_end unknown_item_menu_type

	thumb_func_start Task_HandleInBattleItemMenuInput
Task_HandleInBattleItemMenuInput: @ 0x081AC9FC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081ACA62
	bl Menu_ProcessInputNoWrap
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _081ACA62
	adds r0, #1
	cmp r4, r0
	bne _081ACA3C
	movs r0, #5
	bl PlaySE
	ldr r0, _081ACA38
	ldr r1, [r0, #0x24]
	adds r0, r5, #0
	bl _call_via_r1
	b _081ACA62
	.align 2, 0
_081ACA38: .4byte 0x085DF7EC
_081ACA3C:
	movs r0, #5
	bl PlaySE
	ldr r1, _081ACA68
	ldr r0, _081ACA6C
	ldr r0, [r0]
	movs r2, #0x82
	lsls r2, r2, #4
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
_081ACA62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081ACA68: .4byte 0x085DF7EC
_081ACA6C: .4byte 0x0203CB20
	thumb_func_end Task_HandleInBattleItemMenuInput

	thumb_func_start Task_HandleOutOfBattleItemMenuInput
Task_HandleOutOfBattleItemMenuInput: @ 0x081ACA70
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081ACA84
	b _081ACBE8
_081ACA84:
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _081ACAC8
	ldrh r1, [r5, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081ACACC
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bgt _081ACAA2
	b _081ACBE8
_081ACAA2:
	subs r0, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_081ACBF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081ACAB4
	b _081ACBE8
_081ACAB4:
	movs r0, #5
	bl PlaySE
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_08199250
	b _081ACBE8
	.align 2, 0
_081ACAC8: .4byte 0x03002360
_081ACACC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081ACB14
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	ldr r0, _081ACB0C
	ldr r0, [r0]
	ldr r2, _081ACB10
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #2
	cmp r1, r0
	blt _081ACAEA
	b _081ACBE8
_081ACAEA:
	adds r0, r1, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_081ACBF4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081ACBE8
	movs r0, #5
	bl PlaySE
	movs r0, #0
	movs r1, #1
	bl sub_08199250
	b _081ACBE8
	.align 2, 0
_081ACB0C: .4byte 0x0203CB20
_081ACB10: .4byte 0x00000828
_081ACB14:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081ACB28
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081ACB50
_081ACB28:
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081ACBE8
	subs r0, r1, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_081ACBF4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081ACBE8
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	b _081ACB8A
_081ACB50:
	ldrh r1, [r5, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _081ACB66
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _081ACB92
_081ACB66:
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081ACBE8
	adds r0, r1, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_081ACBF4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081ACBE8
	movs r0, #5
	bl PlaySE
	movs r0, #1
_081ACB8A:
	movs r1, #0
	bl sub_08199250
	b _081ACBE8
_081ACB92:
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081ACBD0
	movs r0, #5
	bl PlaySE
	ldr r2, _081ACBC8
	ldr r0, _081ACBCC
	ldr r0, [r0]
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	movs r3, #0x82
	lsls r3, r3, #4
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	b _081ACBE8
	.align 2, 0
_081ACBC8: .4byte 0x085DF7EC
_081ACBCC: .4byte 0x0203CB20
_081ACBD0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081ACBE8
	movs r0, #5
	bl PlaySE
	ldr r0, _081ACBF0
	ldr r1, [r0, #0x24]
	adds r0, r6, #0
	bl _call_via_r1
_081ACBE8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081ACBF0: .4byte 0x085DF7EC
	thumb_func_end Task_HandleOutOfBattleItemMenuInput

	thumb_func_start sub_081ACBF4
sub_081ACBF4: @ 0x081ACBF4
	push {lr}
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _081ACC28
	ldr r0, _081ACC20
	ldr r2, [r0]
	ldr r3, _081ACC24
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bgt _081ACC28
	movs r3, #0x82
	lsls r3, r3, #4
	adds r0, r2, r3
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _081ACC28
	movs r0, #1
	b _081ACC2A
	.align 2, 0
_081ACC20: .4byte 0x0203CB20
_081ACC24: .4byte 0x00000828
_081ACC28:
	movs r0, #0
_081ACC2A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081ACBF4

	thumb_func_start BagMenu_RemoveSomeWindow
BagMenu_RemoveSomeWindow: @ 0x081ACC30
	push {lr}
	ldr r0, _081ACC48
	ldr r0, [r0]
	ldr r1, _081ACC4C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _081ACC50
	movs r0, #0
	bl BagMenu_RemoveWindow
	b _081ACC6E
	.align 2, 0
_081ACC48: .4byte 0x0203CB20
_081ACC4C: .4byte 0x00000828
_081ACC50:
	cmp r0, #2
	bne _081ACC5C
	movs r0, #1
	bl BagMenu_RemoveWindow
	b _081ACC6E
_081ACC5C:
	cmp r0, #4
	bne _081ACC68
	movs r0, #2
	bl BagMenu_RemoveWindow
	b _081ACC6E
_081ACC68:
	movs r0, #3
	bl BagMenu_RemoveWindow
_081ACC6E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BagMenu_RemoveSomeWindow

	thumb_func_start ItemMenu_UseOutOfBattle
ItemMenu_UseOutOfBattle: @ 0x081ACC74
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _081ACCAC
	ldrh r0, [r5]
	bl sub_080D6DF8
	cmp r0, #0
	beq _081ACCE6
	bl BagMenu_RemoveSomeWindow
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081ACCB0
	ldrh r0, [r5]
	bl ItemId_GetPocket
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081ACCB0
	adds r0, r4, #0
	bl BagMenu_PrintThereIsNoPokemon
	b _081ACCE6
	.align 2, 0
_081ACCAC: .4byte 0x0203CB48
_081ACCB0:
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _081ACCD8
	ldrb r0, [r0, #5]
	cmp r0, #3
	beq _081ACCE0
	ldr r0, _081ACCDC
	ldrh r0, [r0]
	bl sub_080D6DF8
	adds r1, r0, #0
	adds r0, r4, #0
	bl _call_via_r1
	b _081ACCE6
	.align 2, 0
_081ACCD8: .4byte 0x0203CB24
_081ACCDC: .4byte 0x0203CB48
_081ACCE0:
	adds r0, r4, #0
	bl sub_080FE564
_081ACCE6:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end ItemMenu_UseOutOfBattle

	thumb_func_start ItemMenu_Toss
ItemMenu_Toss: @ 0x081ACCEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r6, r0, #3
	ldr r7, _081ACD18
	adds r4, r6, r7
	bl BagMenu_RemoveSomeWindow
	movs r0, #1
	strh r0, [r4, #0x10]
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _081ACD1C
	adds r0, r5, #0
	bl BagMenu_TossItems
	b _081ACD62
	.align 2, 0
_081ACD18: .4byte 0x03005B68
_081ACD1C:
	ldr r0, _081ACD6C
	ldrh r0, [r0]
	ldr r1, _081ACD70
	bl CopyItemName
	ldr r4, _081ACD74
	ldr r1, _081ACD78
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl BagMenu_Print
	movs r0, #7
	bl PrintItemDepositAmount
	adds r0, r7, #0
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _081ACD7C
	str r1, [r0]
_081ACD62:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081ACD6C: .4byte 0x0203CB48
_081ACD70: .4byte 0x02021C40
_081ACD74: .4byte 0x02021C7C
_081ACD78: .4byte 0x085C9523
_081ACD7C: .4byte 0x081ACE3D
	thumb_func_end ItemMenu_Toss

	thumb_func_start BagMenu_TossItems
BagMenu_TossItems: @ 0x081ACD80
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081ACDEC
	adds r4, r4, r0
	ldr r0, _081ACDF0
	ldrh r0, [r0]
	ldr r1, _081ACDF4
	bl CopyItemName
	ldr r0, _081ACDF8
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _081ACDFC
	ldr r1, _081ACE00
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl BagMenu_Print
	ldr r2, _081ACE04
	adds r0, r5, #0
	movs r1, #5
	bl BagMenu_YesNo
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081ACDEC: .4byte 0x03005B68
_081ACDF0: .4byte 0x0203CB48
_081ACDF4: .4byte 0x02021C40
_081ACDF8: .4byte 0x02021C54
_081ACDFC: .4byte 0x02021C7C
_081ACE00: .4byte 0x085C9540
_081ACE04: .4byte 0x085DF8BC
	thumb_func_end BagMenu_TossItems

	thumb_func_start BagMenu_CancelToss
BagMenu_CancelToss: @ 0x081ACE08
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081ACE38
	adds r4, r4, r0
	movs r1, #2
	ldrsh r0, [r4, r1]
	bl BagMenu_PrintDescription
	ldrb r0, [r4]
	movs r1, #0
	bl BagMenu_PrintCursor_
	adds r0, r5, #0
	bl set_callback3_to_bag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081ACE38: .4byte 0x03005B68
	thumb_func_end BagMenu_CancelToss

	thumb_func_start Task_ChooseHowManyToToss
Task_ChooseHowManyToToss: @ 0x081ACE3C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081ACE74
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x10
	ldrh r1, [r4, #4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081ACE80
	ldr r0, _081ACE78
	ldr r0, [r0]
	ldr r1, _081ACE7C
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	bl sub_081ABA50
	b _081ACEBE
	.align 2, 0
_081ACE74: .4byte 0x03005B68
_081ACE78: .4byte 0x0203CB20
_081ACE7C: .4byte 0x00000817
_081ACE80:
	ldr r0, _081ACEA0
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081ACEA4
	movs r0, #5
	bl PlaySE
	movs r0, #7
	bl BagMenu_RemoveWindow
	adds r0, r5, #0
	bl BagMenu_TossItems
	b _081ACEBE
	.align 2, 0
_081ACEA0: .4byte 0x03002360
_081ACEA4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081ACEBE
	movs r0, #5
	bl PlaySE
	movs r0, #7
	bl BagMenu_RemoveWindow
	adds r0, r6, #0
	bl BagMenu_CancelToss
_081ACEBE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end Task_ChooseHowManyToToss

	thumb_func_start BagMenu_ConfirmToss
BagMenu_ConfirmToss: @ 0x081ACEC4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _081ACF2C
	adds r6, r4, r5
	ldr r0, _081ACF30
	ldrh r0, [r0]
	ldr r1, _081ACF34
	bl CopyItemName
	ldr r0, _081ACF38
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r6, _081ACF3C
	ldr r1, _081ACF40
	adds r0, r6, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	adds r2, r6, #0
	movs r3, #0
	bl BagMenu_Print
	subs r5, #8
	adds r4, r4, r5
	ldr r0, _081ACF44
	str r0, [r4]
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081ACF2C: .4byte 0x03005B68
_081ACF30: .4byte 0x0203CB48
_081ACF34: .4byte 0x02021C40
_081ACF38: .4byte 0x02021C54
_081ACF3C: .4byte 0x02021C7C
_081ACF40: .4byte 0x085C9532
_081ACF44: .4byte 0x081ACF49
	thumb_func_end BagMenu_ConfirmToss

	thumb_func_start Task_ActuallyToss
Task_ActuallyToss: @ 0x081ACF48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081ACFD0
	adds r5, r0, r1
	ldr r4, _081ACFD4
	ldrb r0, [r4, #5]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r1, r1, r0
	mov r8, r1
	adds r1, r4, #0
	adds r1, #8
	adds r7, r0, r1
	ldr r0, _081ACFD8
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _081ACFC6
	movs r0, #5
	bl PlaySE
	ldr r0, _081ACFDC
	ldrh r0, [r0]
	ldrh r1, [r5, #0x10]
	bl RemoveBagItem
	ldrb r0, [r5]
	mov r1, r8
	adds r2, r7, #0
	bl DestroyListMenuTask
	ldrb r0, [r4, #5]
	bl sub_081AB754
	ldrb r0, [r4, #5]
	bl SetInitialScrollAndCursorPositions
	ldrb r0, [r4, #5]
	bl LoadBagItemListBuffers
	ldr r0, _081ACFE0
	mov r2, r8
	ldrh r1, [r2]
	ldrh r2, [r7]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, #0
	bl set_callback3_to_bag
_081ACFC6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081ACFD0: .4byte 0x03005B68
_081ACFD4: .4byte 0x0203CB24
_081ACFD8: .4byte 0x03002360
_081ACFDC: .4byte 0x0203CB48
_081ACFE0: .4byte 0x03006050
	thumb_func_end Task_ActuallyToss

	thumb_func_start ItemMenu_Register
ItemMenu_Register: @ 0x081ACFE4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081AD01C
	adds r7, r0, r1
	ldr r0, _081AD020
	ldrb r1, [r0, #5]
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x12
	adds r6, r1, r2
	adds r0, #8
	adds r5, r1, r0
	ldr r0, _081AD024
	ldr r0, [r0]
	ldr r2, _081AD028
	adds r1, r0, r2
	ldr r0, _081AD02C
	ldrh r2, [r0]
	ldrh r0, [r1]
	cmp r0, r2
	bne _081AD030
	movs r0, #0
	strh r0, [r1]
	b _081AD032
	.align 2, 0
_081AD01C: .4byte 0x03005B68
_081AD020: .4byte 0x0203CB24
_081AD024: .4byte 0x03005AEC
_081AD028: .4byte 0x00000496
_081AD02C: .4byte 0x0203CB48
_081AD030:
	strh r2, [r1]
_081AD032:
	ldrb r0, [r7]
	adds r1, r6, #0
	adds r2, r5, #0
	bl DestroyListMenuTask
	ldr r0, _081AD068
	ldrb r0, [r0, #5]
	bl LoadBagItemListBuffers
	ldr r0, _081AD06C
	ldrh r1, [r6]
	ldrh r2, [r5]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7]
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r4, #0
	bl ItemMenu_Cancel
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AD068: .4byte 0x0203CB24
_081AD06C: .4byte 0x03006050
	thumb_func_end ItemMenu_Register

	thumb_func_start ItemMenu_Give
ItemMenu_Give: @ 0x081AD070
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	bl BagMenu_RemoveSomeWindow
	ldr r5, _081AD098
	ldrh r0, [r5]
	bl itemid_80BF6D8_mail_related
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AD0A4
	ldr r2, _081AD09C
	ldr r3, _081AD0A0
	adds r0, r4, #0
	movs r1, #1
	bl DisplayItemMessage
	b _081AD0E2
	.align 2, 0
_081AD098: .4byte 0x0203CB48
_081AD09C: .4byte 0x085C945C
_081AD0A0: .4byte 0x081AD149
_081AD0A4:
	ldrh r0, [r5]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AD0DC
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AD0C2
	adds r0, r4, #0
	bl BagMenu_PrintThereIsNoPokemon
	b _081AD0E2
_081AD0C2:
	ldr r0, _081AD0D4
	ldr r1, [r0]
	ldr r0, _081AD0D8
	str r0, [r1]
	adds r0, r4, #0
	bl unknown_ItemMenu_Confirm
	b _081AD0E2
	.align 2, 0
_081AD0D4: .4byte 0x0203CB20
_081AD0D8: .4byte 0x081B7C01
_081AD0DC:
	adds r0, r6, #0
	bl BagMenu_PrintItemCantBeHeld
_081AD0E2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ItemMenu_Give

	thumb_func_start BagMenu_PrintThereIsNoPokemon
BagMenu_PrintThereIsNoPokemon: @ 0x081AD0E8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081AD0FC
	ldr r3, _081AD100
	movs r1, #1
	bl DisplayItemMessage
	pop {r0}
	bx r0
	.align 2, 0
_081AD0FC: .4byte 0x085C9472
_081AD100: .4byte 0x081AD149
	thumb_func_end BagMenu_PrintThereIsNoPokemon

	thumb_func_start BagMenu_PrintItemCantBeHeld
BagMenu_PrintItemCantBeHeld: @ 0x081AD104
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081AD134
	ldrh r0, [r0]
	ldr r1, _081AD138
	bl CopyItemName
	ldr r5, _081AD13C
	ldr r1, _081AD140
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldr r3, _081AD144
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	bl DisplayItemMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081AD134: .4byte 0x0203CB48
_081AD138: .4byte 0x02021C40
_081AD13C: .4byte 0x02021C7C
_081AD140: .4byte 0x085C948E
_081AD144: .4byte 0x081AD149
	thumb_func_end BagMenu_PrintItemCantBeHeld

	thumb_func_start sub_081AD148
sub_081AD148: @ 0x081AD148
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081AD16C
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081AD166
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl BagMenu_InitListsMenu
_081AD166:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AD16C: .4byte 0x03002360
	thumb_func_end sub_081AD148

	thumb_func_start ItemMenu_CheckTag
ItemMenu_CheckTag: @ 0x081AD170
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081AD188
	ldr r2, [r1]
	ldr r1, _081AD18C
	str r1, [r2]
	bl unknown_ItemMenu_Confirm
	pop {r0}
	bx r0
	.align 2, 0
_081AD188: .4byte 0x0203CB20
_081AD18C: .4byte 0x08177AFD
	thumb_func_end ItemMenu_CheckTag

	thumb_func_start ItemMenu_Cancel
ItemMenu_Cancel: @ 0x081AD190
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081AD1D0
	adds r4, r4, r0
	bl BagMenu_RemoveSomeWindow
	movs r1, #2
	ldrsh r0, [r4, r1]
	bl BagMenu_PrintDescription
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	ldrb r0, [r4]
	movs r1, #0
	bl BagMenu_PrintCursor_
	adds r0, r5, #0
	bl set_callback3_to_bag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081AD1D0: .4byte 0x03005B68
	thumb_func_end ItemMenu_Cancel

	thumb_func_start ItemMenu_UseInBattle
ItemMenu_UseInBattle: @ 0x081AD1D4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _081AD200
	ldrh r0, [r4]
	bl sub_080D6E44
	cmp r0, #0
	beq _081AD1F8
	bl BagMenu_RemoveSomeWindow
	ldrh r0, [r4]
	bl sub_080D6E44
	adds r1, r0, #0
	adds r0, r5, #0
	bl _call_via_r1
_081AD1F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081AD200: .4byte 0x0203CB48
	thumb_func_end ItemMenu_UseInBattle

	thumb_func_start bag_menu_mail_related
bag_menu_mail_related: @ 0x081AD204
	push {lr}
	movs r0, #0xc
	movs r1, #5
	movs r2, #0
	bl GoToBagMenu
	pop {r0}
	bx r0
	thumb_func_end bag_menu_mail_related

	thumb_func_start item_menu_type_2
item_menu_type_2: @ 0x081AD214
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _081AD238
	ldrh r0, [r4]
	bl itemid_80BF6D8_mail_related
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AD244
	ldr r2, _081AD23C
	ldr r3, _081AD240
	adds r0, r5, #0
	movs r1, #1
	bl DisplayItemMessage
	b _081AD2A6
	.align 2, 0
_081AD238: .4byte 0x0203CB48
_081AD23C: .4byte 0x085C945C
_081AD240: .4byte 0x081AD149
_081AD244:
	ldrh r0, [r4]
	bl sub_08122154
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AD280
	ldrh r0, [r4]
	ldr r1, _081AD270
	bl CopyItemName
	ldr r4, _081AD274
	ldr r1, _081AD278
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r3, _081AD27C
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl DisplayItemMessage
	b _081AD2A6
	.align 2, 0
_081AD270: .4byte 0x02021C40
_081AD274: .4byte 0x02021C7C
_081AD278: .4byte 0x085C94A1
_081AD27C: .4byte 0x081AD149
_081AD280:
	ldr r0, _081AD29C
	ldrb r0, [r0, #5]
	cmp r0, #4
	beq _081AD2A0
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AD2A0
	adds r0, r5, #0
	bl unknown_ItemMenu_Confirm
	b _081AD2A6
	.align 2, 0
_081AD29C: .4byte 0x0203CB24
_081AD2A0:
	adds r0, r5, #0
	bl BagMenu_PrintItemCantBeHeld
_081AD2A6:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end item_menu_type_2

	thumb_func_start item_menu_type_b
item_menu_type_b: @ 0x081AD2AC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _081AD2D0
	ldrh r0, [r5]
	bl ItemIsMail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081AD2DC
	ldr r2, _081AD2D4
	ldr r3, _081AD2D8
	adds r0, r4, #0
	movs r1, #1
	bl DisplayItemMessage
	b _081AD312
	.align 2, 0
_081AD2D0: .4byte 0x0203CB48
_081AD2D4: .4byte 0x085C945C
_081AD2D8: .4byte 0x081AD149
_081AD2DC:
	ldr r0, _081AD300
	ldrb r0, [r0, #5]
	cmp r0, #4
	beq _081AD30C
	ldrh r0, [r5]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AD30C
	ldr r0, _081AD304
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081AD308
	str r0, [r1]
	b _081AD312
	.align 2, 0
_081AD300: .4byte 0x0203CB24
_081AD304: .4byte 0x03005B60
_081AD308: .4byte 0x081AB6A5
_081AD30C:
	adds r0, r4, #0
	bl BagMenu_PrintItemCantBeHeld
_081AD312:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end item_menu_type_b

	thumb_func_start UseRegisteredKeyItemOnField
UseRegisteredKeyItemOnField: @ 0x081AD318
	push {r4, r5, r6, r7, lr}
	bl InUnionRoom
	cmp r0, #1
	beq _081AD344
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AD344
	bl InBattlePike
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	bne _081AD344
	bl InMultiBattleRoom
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081AD348
_081AD344:
	movs r0, #0
	b _081AD3CA
_081AD348:
	bl HideMapNamePopUpWindow
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	ldr r4, _081AD3AC
	ldr r0, [r4]
	ldr r5, _081AD3B0
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, #0
	beq _081AD3C2
	movs r1, #1
	bl CheckBagHasItem
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bne _081AD3BC
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	bl sub_0808B1C8
	bl sub_0808B658
	ldr r2, _081AD3B4
	ldr r0, [r4]
	adds r0, r0, r5
	ldrh r1, [r0]
	strh r1, [r2]
	ldrh r0, [r0]
	bl sub_080D6DF8
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081AD3B8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r6, [r1, #0xe]
	b _081AD3C8
	.align 2, 0
_081AD3AC: .4byte 0x03005AEC
_081AD3B0: .4byte 0x00000496
_081AD3B4: .4byte 0x0203CB48
_081AD3B8: .4byte 0x03005B60
_081AD3BC:
	ldr r0, [r4]
	adds r0, r0, r5
	strh r7, [r0]
_081AD3C2:
	ldr r0, _081AD3D0
	bl ScriptContext1_SetupScript
_081AD3C8:
	movs r0, #1
_081AD3CA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081AD3D0: .4byte 0x082440DD
	thumb_func_end UseRegisteredKeyItemOnField

	thumb_func_start DisplaySellItemAskString
DisplaySellItemAskString: @ 0x081AD3D4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r5, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081AD414
	adds r4, r0, r1
	ldr r6, _081AD418
	ldrh r0, [r6]
	bl sub_080D6CD4
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081AD42C
	ldrh r0, [r6]
	ldr r1, _081AD41C
	bl CopyItemName
	ldr r4, _081AD420
	ldr r1, _081AD424
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r3, _081AD428
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl DisplayItemMessage
	b _081AD462
	.align 2, 0
_081AD414: .4byte 0x03005B68
_081AD418: .4byte 0x0203CB48
_081AD41C: .4byte 0x02021C54
_081AD420: .4byte 0x02021C7C
_081AD424: .4byte 0x085C9A47
_081AD428: .4byte 0x081AB969
_081AD42C:
	movs r0, #1
	strh r0, [r4, #0x10]
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _081AD444
	bl bag_menu_AddMoney_window
	adds r0, r5, #0
	bl sub_081AD478
	b _081AD462
_081AD444:
	ldrh r0, [r6]
	ldr r1, _081AD468
	bl CopyItemName
	ldr r4, _081AD46C
	ldr r1, _081AD470
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r3, _081AD474
	adds r0, r7, #0
	movs r1, #1
	adds r2, r4, #0
	bl DisplayItemMessage
_081AD462:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AD468: .4byte 0x02021C54
_081AD46C: .4byte 0x02021C7C
_081AD470: .4byte 0x085C9A5D
_081AD474: .4byte 0x081AD529
	thumb_func_end DisplaySellItemAskString

	thumb_func_start sub_081AD478
sub_081AD478: @ 0x081AD478
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081AD4C4
	adds r4, r4, r0
	ldr r6, _081AD4C8
	ldr r0, _081AD4CC
	ldrh r0, [r0]
	bl sub_080D6CD4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	adds r0, r6, #0
	movs r2, #0
	movs r3, #6
	bl ConvertIntToDecimalStringN
	ldr r4, _081AD4D0
	ldr r1, _081AD4D4
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r3, _081AD4D8
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl DisplayItemMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AD4C4: .4byte 0x03005B68
_081AD4C8: .4byte 0x02021C40
_081AD4CC: .4byte 0x0203CB48
_081AD4D0: .4byte 0x02021C7C
_081AD4D4: .4byte 0x085C9A6C
_081AD4D8: .4byte 0x081AD4DD
	thumb_func_end sub_081AD478

	thumb_func_start sub_081AD4DC
sub_081AD4DC: @ 0x081AD4DC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081AD4F0
	movs r1, #6
	bl BagMenu_YesNo
	pop {r0}
	bx r0
	.align 2, 0
_081AD4F0: .4byte 0x085DF8C4
	thumb_func_end sub_081AD4DC

	thumb_func_start BagMenu_CancelSell
BagMenu_CancelSell: @ 0x081AD4F4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081AD524
	adds r4, r4, r0
	bl bag_menu_remove_money_window
	movs r0, #4
	bl bag_menu_RemoveBagItem_message_window
	ldrb r0, [r4]
	movs r1, #0
	bl BagMenu_PrintCursor_
	adds r0, r5, #0
	bl set_callback3_to_bag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081AD524: .4byte 0x03005B68
	thumb_func_end BagMenu_CancelSell

	thumb_func_start sub_081AD528
sub_081AD528: @ 0x081AD528
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _081AD570
	adds r6, r4, r5
	movs r0, #8
	bl BagMenu_AddWindow
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_081ABA50
	ldr r0, _081AD574
	ldrh r0, [r0]
	bl sub_080D6CD4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	bl bag_menu_leave_maybe_2
	bl bag_menu_AddMoney_window
	subs r5, #8
	adds r4, r4, r5
	ldr r0, _081AD578
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AD570: .4byte 0x03005B68
_081AD574: .4byte 0x0203CB48
_081AD578: .4byte 0x081AD5A9
	thumb_func_end sub_081AD528

	thumb_func_start bag_menu_leave_maybe_2
bag_menu_leave_maybe_2: @ 0x081AD57C
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	ldr r0, _081AD5A0
	ldr r0, [r0]
	ldr r1, _081AD5A4
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x28
	movs r2, #2
	bl PrintMoneyAmountInMoneyBoxWithBorder
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_081AD5A0: .4byte 0x0203CB20
_081AD5A4: .4byte 0x00000818
	thumb_func_end bag_menu_leave_maybe_2

	thumb_func_start sub_081AD5A8
sub_081AD5A8: @ 0x081AD5A8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081AD5F8
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x10
	ldrh r1, [r5, #4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081AD608
	ldr r0, _081AD5FC
	ldr r0, [r0]
	ldr r1, _081AD600
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r2, #0x10
	ldrsh r1, [r5, r2]
	bl sub_081ABA50
	ldr r0, _081AD604
	ldrh r0, [r0]
	bl sub_080D6CD4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	movs r2, #0x10
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	bl bag_menu_leave_maybe_2
	b _081AD658
	.align 2, 0
_081AD5F8: .4byte 0x03005B68
_081AD5FC: .4byte 0x0203CB20
_081AD600: .4byte 0x00000818
_081AD604: .4byte 0x0203CB48
_081AD608:
	ldr r0, _081AD628
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081AD62C
	movs r0, #5
	bl PlaySE
	movs r0, #8
	bl BagMenu_RemoveWindow
	adds r0, r4, #0
	bl sub_081AD478
	b _081AD658
	.align 2, 0
_081AD628: .4byte 0x03002360
_081AD62C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081AD658
	movs r0, #5
	bl PlaySE
	ldrb r0, [r5]
	movs r1, #0
	bl BagMenu_PrintCursor_
	bl bag_menu_remove_money_window
	movs r0, #8
	bl BagMenu_RemoveWindow
	movs r0, #4
	bl bag_menu_RemoveBagItem_message_window
	adds r0, r6, #0
	bl set_callback3_to_bag
_081AD658:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081AD5A8

	thumb_func_start BagMenu_ConfirmSell
BagMenu_ConfirmSell: @ 0x081AD660
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081AD6C0
	adds r4, r4, r0
	ldr r6, _081AD6C4
	ldrh r0, [r6]
	ldr r1, _081AD6C8
	bl CopyItemName
	ldr r0, _081AD6CC
	mov r8, r0
	ldrh r0, [r6]
	bl sub_080D6CD4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	mov r0, r8
	movs r2, #0
	movs r3, #6
	bl ConvertIntToDecimalStringN
	ldr r4, _081AD6D0
	ldr r1, _081AD6D4
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r3, _081AD6D8
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl DisplayItemMessage
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AD6C0: .4byte 0x03005B68
_081AD6C4: .4byte 0x0203CB48
_081AD6C8: .4byte 0x02021C54
_081AD6CC: .4byte 0x02021C40
_081AD6D0: .4byte 0x02021C7C
_081AD6D4: .4byte 0x085C9A88
_081AD6D8: .4byte 0x081AD6DD
	thumb_func_end BagMenu_ConfirmSell

	thumb_func_start sub_081AD6DC
sub_081AD6DC: @ 0x081AD6DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r6, r0, #2
	adds r6, r6, r0
	lsls r6, r6, #3
	ldr r0, _081AD7B4
	adds r0, r0, r6
	mov sl, r0
	ldr r7, _081AD7B8
	ldrb r5, [r7, #5]
	lsls r5, r5, #1
	movs r1, #0x12
	adds r1, r1, r7
	mov sb, r1
	add sb, r5
	adds r0, r7, #0
	adds r0, #8
	adds r5, r5, r0
	movs r0, #0x5f
	bl PlaySE
	ldr r2, _081AD7BC
	mov r8, r2
	ldrh r0, [r2]
	mov r3, sl
	ldrh r1, [r3, #0x10]
	bl RemoveBagItem
	ldr r0, _081AD7C0
	ldr r4, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r4, r4, r1
	mov r2, r8
	ldrh r0, [r2]
	bl sub_080D6CD4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	mov r3, sl
	movs r2, #0x10
	ldrsh r1, [r3, r2]
	muls r1, r0, r1
	adds r0, r4, #0
	bl AddMoney
	mov r3, sl
	ldrb r0, [r3]
	mov r1, sb
	adds r2, r5, #0
	bl DestroyListMenuTask
	ldrb r0, [r7, #5]
	bl sub_081AB754
	ldrb r0, [r7, #5]
	bl SetInitialScrollAndCursorPositions
	ldrb r0, [r7, #5]
	bl LoadBagItemListBuffers
	ldr r0, _081AD7C4
	mov r2, sb
	ldrh r1, [r2]
	ldrh r2, [r5]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r3, sl
	strh r0, [r3]
	movs r1, #2
	bl BagMenu_PrintCursor_
	ldr r0, _081AD7C8
	ldr r0, [r0]
	ldr r1, _081AD7CC
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r2, _081AD7C0
	ldr r0, [r2]
	movs r3, #0x92
	lsls r3, r3, #3
	adds r0, r0, r3
	bl GetMoney
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl PrintMoneyAmountInMoneyBox
	ldr r0, _081AD7B4
	subs r0, #8
	adds r6, r6, r0
	ldr r0, _081AD7D0
	str r0, [r6]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AD7B4: .4byte 0x03005B68
_081AD7B8: .4byte 0x0203CB24
_081AD7BC: .4byte 0x0203CB48
_081AD7C0: .4byte 0x03005AEC
_081AD7C4: .4byte 0x03006050
_081AD7C8: .4byte 0x0203CB20
_081AD7CC: .4byte 0x00000819
_081AD7D0: .4byte 0x081AD7D5
	thumb_func_end sub_081AD6DC

	thumb_func_start unknown_ItemMenu_Show
unknown_ItemMenu_Show: @ 0x081AD7D4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081AD7FC
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _081AD7F6
	movs r0, #5
	bl PlaySE
	bl bag_menu_remove_money_window
	adds r0, r4, #0
	bl BagMenu_InitListsMenu
_081AD7F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AD7FC: .4byte 0x03002360
	thumb_func_end unknown_ItemMenu_Show

	thumb_func_start DisplayDepositItemAskString
DisplayDepositItemAskString: @ 0x081AD800
	push {r4, r5, r6, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r5, r0, #3
	ldr r6, _081AD828
	adds r1, r5, r6
	movs r0, #1
	strh r0, [r1, #0x10]
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, #1
	bne _081AD82C
	adds r0, r2, #0
	bl sub_081AD928
	b _081AD872
	.align 2, 0
_081AD828: .4byte 0x03005B68
_081AD82C:
	ldr r0, _081AD87C
	ldrh r0, [r0]
	ldr r1, _081AD880
	bl CopyItemName
	ldr r4, _081AD884
	ldr r1, _081AD888
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl BagMenu_Print
	movs r0, #7
	bl PrintItemDepositAmount
	adds r0, r6, #0
	subs r0, #8
	adds r0, r5, r0
	ldr r1, _081AD88C
	str r1, [r0]
_081AD872:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AD87C: .4byte 0x0203CB48
_081AD880: .4byte 0x02021C40
_081AD884: .4byte 0x02021C7C
_081AD888: .4byte 0x085C94B9
_081AD88C: .4byte 0x081AD891
	thumb_func_end DisplayDepositItemAskString

	thumb_func_start sub_081AD890
sub_081AD890: @ 0x081AD890
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081AD8C8
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x10
	ldrh r1, [r5, #4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081AD8D4
	ldr r0, _081AD8CC
	ldr r0, [r0]
	ldr r1, _081AD8D0
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r2, #0x10
	ldrsh r1, [r5, r2]
	bl sub_081ABA50
	b _081AD922
	.align 2, 0
_081AD8C8: .4byte 0x03005B68
_081AD8CC: .4byte 0x0203CB20
_081AD8D0: .4byte 0x00000817
_081AD8D4:
	ldr r0, _081AD8F4
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081AD8F8
	movs r0, #5
	bl PlaySE
	movs r0, #7
	bl BagMenu_RemoveWindow
	adds r0, r4, #0
	bl sub_081AD928
	b _081AD922
	.align 2, 0
_081AD8F4: .4byte 0x03002360
_081AD8F8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081AD922
	movs r0, #5
	bl PlaySE
	movs r1, #2
	ldrsh r0, [r5, r1]
	bl BagMenu_PrintDescription
	ldrb r0, [r5]
	movs r1, #0
	bl BagMenu_PrintCursor_
	movs r0, #7
	bl BagMenu_RemoveWindow
	adds r0, r6, #0
	bl set_callback3_to_bag
_081AD922:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081AD890

	thumb_func_start sub_081AD928
sub_081AD928: @ 0x081AD928
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r6, r1, #3
	ldr r0, _081AD96C
	mov r8, r0
	adds r7, r6, r0
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r4, _081AD970
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _081AD978
	ldr r2, _081AD974
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	b _081AD9EE
	.align 2, 0
_081AD96C: .4byte 0x03005B68
_081AD970: .4byte 0x0203CB48
_081AD974: .4byte 0x085C94EB
_081AD978:
	ldrh r0, [r4]
	ldrh r1, [r7, #0x10]
	bl AddPCItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081AD9E0
	ldrh r0, [r4]
	ldr r1, _081AD9CC
	bl CopyItemName
	ldr r0, _081AD9D0
	movs r2, #0x10
	ldrsh r1, [r7, r2]
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _081AD9D4
	ldr r1, _081AD9D8
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl BagMenu_Print
	mov r0, r8
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _081AD9DC
	b _081ADA00
	.align 2, 0
_081AD9CC: .4byte 0x02021C40
_081AD9D0: .4byte 0x02021C54
_081AD9D4: .4byte 0x02021C7C
_081AD9D8: .4byte 0x085C94CA
_081AD9DC: .4byte 0x081ACF49
_081AD9E0:
	ldr r2, _081ADA10
	movs r0, #2
	str r0, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	str r5, [sp, #0x10]
_081AD9EE:
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl BagMenu_Print
	mov r0, r8
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _081ADA14
_081ADA00:
	str r1, [r0]
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081ADA10: .4byte 0x085C94DA
_081ADA14: .4byte 0x081ADA19
	thumb_func_end sub_081AD928

	thumb_func_start sub_081ADA18
sub_081ADA18: @ 0x081ADA18
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081ADA58
	adds r5, r0, r1
	ldr r0, _081ADA5C
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _081ADA50
	movs r0, #5
	bl PlaySE
	movs r1, #2
	ldrsh r0, [r5, r1]
	bl BagMenu_PrintDescription
	ldrb r0, [r5]
	movs r1, #0
	bl BagMenu_PrintCursor_
	adds r0, r4, #0
	bl set_callback3_to_bag
_081ADA50:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081ADA58: .4byte 0x03005B68
_081ADA5C: .4byte 0x03002360
	thumb_func_end sub_081ADA18

	thumb_func_start IsWallysBag
IsWallysBag: @ 0x081ADA60
	push {lr}
	ldr r0, _081ADA70
	ldrb r0, [r0, #4]
	cmp r0, #0xa
	beq _081ADA74
	movs r0, #0
	b _081ADA76
	.align 2, 0
_081ADA70: .4byte 0x0203CB24
_081ADA74:
	movs r0, #1
_081ADA76:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsWallysBag

	thumb_func_start PrepareBagForWallyTutorial
PrepareBagForWallyTutorial: @ 0x081ADA7C
	push {r4, r5, r6, lr}
	ldr r4, _081ADB00
	movs r0, #0xd0
	bl AllocZeroed
	str r0, [r4]
	ldr r5, _081ADB04
	ldr r1, [r5]
	movs r2, #0xac
	lsls r2, r2, #3
	adds r1, r1, r2
	movs r2, #0x78
	bl memcpy
	ldr r0, [r4]
	ldr r1, [r5]
	movs r2, #0xca
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r0, #0x78
	movs r2, #0x40
	bl memcpy
	ldr r0, [r4]
	ldr r2, _081ADB08
	ldrb r1, [r2, #5]
	adds r0, #0xce
	strh r1, [r0]
	movs r6, #0
	adds r5, r2, #0
	adds r5, #8
_081ADABA:
	ldr r2, [r4]
	lsls r3, r6, #1
	adds r0, r2, #0
	adds r0, #0xb8
	adds r0, r0, r3
	ldrh r1, [r5]
	strh r1, [r0]
	adds r2, #0xc2
	adds r2, r2, r3
	ldrh r0, [r5, #0xa]
	strh r0, [r2]
	adds r5, #2
	adds r6, #1
	cmp r6, #4
	bls _081ADABA
	ldr r4, _081ADB04
	ldr r0, [r4]
	movs r1, #0xac
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0x1e
	bl ClearItemSlots
	ldr r0, [r4]
	movs r2, #0xca
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #0x10
	bl ClearItemSlots
	bl ResetBagScrollPositions
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081ADB00: .4byte 0x0203CB4C
_081ADB04: .4byte 0x03005AEC
_081ADB08: .4byte 0x0203CB24
	thumb_func_end PrepareBagForWallyTutorial

	thumb_func_start RestoreBagAfterWallyTutorial
RestoreBagAfterWallyTutorial: @ 0x081ADB0C
	push {r4, r5, r6, lr}
	ldr r5, _081ADB70
	ldr r0, [r5]
	movs r1, #0xac
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r4, _081ADB74
	ldr r1, [r4]
	movs r2, #0x78
	bl memcpy
	ldr r0, [r5]
	movs r1, #0xca
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r1, [r4]
	adds r1, #0x78
	movs r2, #0x40
	bl memcpy
	ldr r1, _081ADB78
	ldr r0, [r4]
	adds r0, #0xce
	ldrh r0, [r0]
	strb r0, [r1, #5]
	movs r5, #0
	adds r6, r4, #0
	adds r3, r1, #0
	adds r3, #8
_081ADB46:
	lsls r2, r5, #1
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0xb8
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	adds r1, #0xc2
	adds r1, r1, r2
	ldrh r0, [r1]
	strh r0, [r3, #0xa]
	adds r3, #2
	adds r5, #1
	cmp r5, #4
	bls _081ADB46
	ldr r0, [r6]
	bl Free
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081ADB70: .4byte 0x03005AEC
_081ADB74: .4byte 0x0203CB4C
_081ADB78: .4byte 0x0203CB24
	thumb_func_end RestoreBagAfterWallyTutorial

	thumb_func_start DoWallyTutorialBagMenu
DoWallyTutorialBagMenu: @ 0x081ADB7C
	push {lr}
	bl PrepareBagForWallyTutorial
	movs r0, #0xd
	movs r1, #1
	bl AddBagItem
	movs r0, #4
	movs r1, #1
	bl AddBagItem
	ldr r2, _081ADBA0
	movs r0, #0xa
	movs r1, #0
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_081ADBA0: .4byte 0x0805996D
	thumb_func_end DoWallyTutorialBagMenu

	thumb_func_start Task_WallyTutorialBagMenu
Task_WallyTutorialBagMenu: @ 0x081ADBA4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081ADBD4
	adds r4, r0, r1
	ldr r0, _081ADBD8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081ADC3E
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0xcc
	beq _081ADBF8
	cmp r1, #0xcc
	bgt _081ADBDC
	cmp r1, #0x66
	beq _081ADBE6
	b _081ADC38
	.align 2, 0
_081ADBD4: .4byte 0x03005B68
_081ADBD8: .4byte 0x02037C74
_081ADBDC:
	movs r0, #0x99
	lsls r0, r0, #1
	cmp r1, r0
	beq _081ADC18
	b _081ADC38
_081ADBE6:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl SwitchBagPocket
	b _081ADC38
_081ADBF8:
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	movs r1, #2
	bl BagMenu_PrintCursor_
	ldr r1, _081ADC14
	movs r0, #4
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_081AC408
	b _081ADC38
	.align 2, 0
_081ADC14: .4byte 0x0203CB48
_081ADC18:
	movs r0, #5
	bl PlaySE
	bl BagMenu_RemoveSomeWindow
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	bl RestoreBagAfterWallyTutorial
	adds r0, r5, #0
	bl unknown_ItemMenu_Confirm
	b _081ADC3E
_081ADC38:
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
_081ADC3E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Task_WallyTutorialBagMenu

	thumb_func_start sub_081ADC44
sub_081ADC44: @ 0x081ADC44
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _081ADC6C
	ldr r0, _081ADC70
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081ADC74
	movs r0, #1
	strh r0, [r1]
	bl BagMenu_RemoveSomeWindow
	adds r0, r4, #0
	bl unknown_ItemMenu_Confirm
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081ADC6C: .4byte 0x02037282
_081ADC70: .4byte 0x0203CB48
_081ADC74: .4byte 0x02037290
	thumb_func_end sub_081ADC44

	thumb_func_start bag_menu_leave_maybe_3
bag_menu_leave_maybe_3: @ 0x081ADC78
	push {lr}
	ldr r0, _081ADC8C
	ldr r1, _081ADC90
	str r1, [r0]
	ldr r0, _081ADC94
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081ADC8C: .4byte 0x03005B0C
_081ADC90: .4byte 0x0819F929
_081ADC94: .4byte 0x08085A31
	thumb_func_end bag_menu_leave_maybe_3

	thumb_func_start unknown_ItemMenu_Give2
unknown_ItemMenu_Give2: @ 0x081ADC98
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081ADCC0
	ldrh r0, [r0]
	movs r1, #1
	bl RemoveBagItem
	ldr r1, _081ADCC4
	movs r0, #1
	strh r0, [r1]
	bl BagMenu_RemoveSomeWindow
	adds r0, r4, #0
	bl unknown_ItemMenu_Confirm
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081ADCC0: .4byte 0x0203CB48
_081ADCC4: .4byte 0x02037290
	thumb_func_end unknown_ItemMenu_Give2

	thumb_func_start sub_081ADCC8
sub_081ADCC8: @ 0x081ADCC8
	push {lr}
	ldr r0, _081ADCDC
	ldr r1, _081ADCE0
	str r1, [r0]
	ldr r0, _081ADCE4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081ADCDC: .4byte 0x03005B0C
_081ADCE0: .4byte 0x0818DC01
_081ADCE4: .4byte 0x08085A31
	thumb_func_end sub_081ADCC8

	thumb_func_start unknown_ItemMenu_Confirm2
unknown_ItemMenu_Confirm2: @ 0x081ADCE8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _081ADD08
	movs r0, #1
	strh r0, [r1]
	bl BagMenu_RemoveSomeWindow
	adds r0, r4, #0
	bl unknown_ItemMenu_Confirm
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081ADD08: .4byte 0x02037290
	thumb_func_end unknown_ItemMenu_Confirm2

	thumb_func_start sub_081ADD0C
sub_081ADD0C: @ 0x081ADD0C
	push {lr}
	ldr r0, _081ADD20
	ldr r1, _081ADD24
	str r1, [r0]
	ldr r0, _081ADD28
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081ADD20: .4byte 0x03005B0C
_081ADD24: .4byte 0x0818E1C1
_081ADD28: .4byte 0x08085A31
	thumb_func_end sub_081ADD0C

	thumb_func_start SetupBagMenu_Textboxes
SetupBagMenu_Textboxes: @ 0x081ADD2C
	push {r4, lr}
	ldr r0, _081ADD8C
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
	movs r0, #0xc0
	movs r1, #1
	bl sub_08199F54
	ldr r0, _081ADD90
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r4, #0
_081ADD60:
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _081ADD60
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081ADD8C: .4byte 0x085DFA2C
_081ADD90: .4byte 0x085D7B04
	thumb_func_end SetupBagMenu_Textboxes

	thumb_func_start BagMenu_Print
BagMenu_Print: @ 0x081ADD94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	mov sb, r3
	ldr r3, [sp, #0x30]
	ldr r4, [sp, #0x34]
	ldr r6, [sp, #0x38]
	ldr r5, [sp, #0x3c]
	mov r8, r5
	ldr r5, [sp, #0x40]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r7, sb
	lsls r7, r7, #0x18
	lsrs r7, r7, #0x18
	mov sb, r7
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r4, [sp]
	str r6, [sp, #4]
	lsls r4, r5, #1
	adds r4, r4, r5
	ldr r5, _081ADDF8
	adds r4, r4, r5
	str r4, [sp, #8]
	mov r4, r8
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r2, sb
	bl AddTextPrinterParameterized4
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081ADDF8: .4byte 0x085DFA1C
	thumb_func_end BagMenu_Print

	thumb_func_start sub_081ADDFC
sub_081ADDFC: @ 0x081ADDFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081ADE10
	ldr r1, [r1]
	movs r2, #0x81
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_081ADE10: .4byte 0x0203CB20
	thumb_func_end sub_081ADDFC

	thumb_func_start BagMenu_AddWindow
BagMenu_AddWindow: @ 0x081ADE14
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081ADE54
	movs r3, #0x81
	lsls r3, r3, #4
	adds r1, r2, r3
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _081ADE4A
	lsls r0, r2, #3
	ldr r1, _081ADE58
	adds r0, r0, r1
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
_081ADE4A:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081ADE54: .4byte 0x0203CB20
_081ADE58: .4byte 0x085DFA64
	thumb_func_end BagMenu_AddWindow

	thumb_func_start BagMenu_RemoveWindow
BagMenu_RemoveWindow: @ 0x081ADE5C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081ADE98
	movs r2, #0x81
	lsls r2, r2, #4
	adds r0, r0, r2
	ldr r1, [r1]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _081ADE90
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #0xff
	strb r0, [r4]
_081ADE90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081ADE98: .4byte 0x0203CB20
	thumb_func_end BagMenu_RemoveWindow

	thumb_func_start AddItemMessageWindow
AddItemMessageWindow: @ 0x081ADE9C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081ADEC8
	movs r3, #0x81
	lsls r3, r3, #4
	adds r1, r2, r3
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _081ADEC0
	lsls r0, r2, #3
	ldr r1, _081ADECC
	adds r0, r0, r1
	bl AddWindow
	strb r0, [r4]
_081ADEC0:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081ADEC8: .4byte 0x0203CB20
_081ADECC: .4byte 0x085DFA64
	thumb_func_end AddItemMessageWindow

	thumb_func_start bag_menu_RemoveBagItem_message_window
bag_menu_RemoveBagItem_message_window: @ 0x081ADED0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081ADF0C
	movs r2, #0x81
	lsls r2, r2, #4
	adds r0, r0, r2
	ldr r1, [r1]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _081ADF04
	movs r1, #0
	bl ClearDialogWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #0xff
	strb r0, [r4]
_081ADF04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081ADF0C: .4byte 0x0203CB20
	thumb_func_end bag_menu_RemoveBagItem_message_window

	thumb_func_start BagMenu_YesNo
BagMenu_YesNo: @ 0x081ADF10
	push {lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	ldr r3, _081ADF3C
	adds r1, r1, r3
	movs r3, #2
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r3, #0xe
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r2, #1
	movs r3, #0
	bl CreateYesNoMenuWithCallbacks
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_081ADF3C: .4byte 0x085DFA64
	thumb_func_end BagMenu_YesNo

	thumb_func_start bag_menu_AddMoney_window
bag_menu_AddMoney_window: @ 0x081ADF40
	push {r4, lr}
	movs r0, #9
	bl BagMenu_AddWindow
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081ADF78
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	bl GetMoney
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xe
	bl PrintMoneyAmount
	movs r0, #0x13
	movs r1, #0xb
	bl AddMoneyLabelObject
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081ADF78: .4byte 0x03005AEC
	thumb_func_end bag_menu_AddMoney_window

	thumb_func_start bag_menu_remove_money_window
bag_menu_remove_money_window: @ 0x081ADF7C
	push {lr}
	movs r0, #9
	bl BagMenu_RemoveWindow
	bl RemoveMoneyLabelObject
	pop {r0}
	bx r0
	thumb_func_end bag_menu_remove_money_window

	thumb_func_start BagMenu_PrepareTMHMMoveWindow
BagMenu_PrepareTMHMMoveWindow: @ 0x081ADF8C
	push {lr}
	movs r0, #3
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #3
	movs r1, #0x13
	movs r2, #0
	movs r3, #0
	bl blit_move_info_icon
	movs r0, #3
	movs r1, #0x14
	movs r2, #0
	movs r3, #0xc
	bl blit_move_info_icon
	movs r0, #3
	movs r1, #0x15
	movs r2, #0
	movs r3, #0x18
	bl blit_move_info_icon
	movs r0, #3
	movs r1, #0x16
	movs r2, #0
	movs r3, #0x24
	bl blit_move_info_icon
	movs r0, #3
	movs r1, #2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BagMenu_PrepareTMHMMoveWindow

	thumb_func_start PrintTMHMMoveData
PrintTMHMMoveData: @ 0x081ADFD4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #4
	movs r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #0
	bne _081AE02C
	movs r4, #0
	movs r5, #0
_081ADFF2:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	movs r0, #4
	str r0, [sp, #0x10]
	movs r1, #1
	ldr r2, _081AE028
	movs r3, #4
	bl BagMenu_Print
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081ADFF2
	movs r0, #4
	movs r1, #2
	bl CopyWindowToVram
	b _081AE118
	.align 2, 0
_081AE028: .4byte 0x085C9406
_081AE02C:
	adds r0, r4, #0
	bl ItemIdToBattleMoveId
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _081AE05C
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r5, r0, r1
	ldrb r1, [r5, #2]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #4
	movs r2, #0
	movs r3, #0
	bl blit_move_info_icon
	ldrb r0, [r5, #1]
	cmp r0, #1
	bhi _081AE064
	ldr r2, _081AE060
	b _081AE074
	.align 2, 0
_081AE05C: .4byte 0x082ED220
_081AE060: .4byte 0x085C9406
_081AE064:
	ldr r4, _081AE0A4
	ldrb r1, [r5, #1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r2, r4, #0
_081AE074:
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	movs r0, #4
	str r0, [sp, #0x10]
	movs r1, #1
	movs r3, #4
	bl BagMenu_Print
	ldr r2, _081AE0A8
	lsls r1, r7, #1
	adds r0, r1, r7
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2, #3]
	adds r6, r1, #0
	cmp r0, #0
	bne _081AE0B0
	ldr r2, _081AE0AC
	b _081AE0C0
	.align 2, 0
_081AE0A4: .4byte 0x02021C40
_081AE0A8: .4byte 0x082ED220
_081AE0AC: .4byte 0x085C9406
_081AE0B0:
	ldr r4, _081AE128
	ldrb r1, [r2, #3]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r2, r4, #0
_081AE0C0:
	movs r0, #0x18
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0xff
	mov r8, r0
	str r0, [sp, #0xc]
	movs r0, #4
	mov sb, r0
	str r0, [sp, #0x10]
	movs r1, #1
	movs r3, #4
	bl BagMenu_Print
	ldr r5, _081AE128
	ldr r1, _081AE12C
	adds r0, r6, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	movs r0, #0x24
	str r0, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	mov r0, sb
	str r0, [sp, #0x10]
	movs r0, #4
	movs r1, #1
	adds r2, r5, #0
	movs r3, #4
	bl BagMenu_Print
	movs r0, #4
	movs r1, #2
	bl CopyWindowToVram
_081AE118:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AE128: .4byte 0x02021C40
_081AE12C: .4byte 0x082ED220
	thumb_func_end PrintTMHMMoveData

