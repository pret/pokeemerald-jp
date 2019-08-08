.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitBattlePyramidBagCursorPosition
InitBattlePyramidBagCursorPosition: @ 0x081C46F4
	ldr r1, _081C4700
	movs r0, #0
	strh r0, [r1, #6]
	strh r0, [r1, #8]
	bx lr
	.align 2, 0
_081C4700: .4byte 0x0203CBFC
	thumb_func_end InitBattlePyramidBagCursorPosition

	thumb_func_start CB2_PyramidBagMenuFromStartMenu
CB2_PyramidBagMenuFromStartMenu: @ 0x081C4704
	push {lr}
	ldr r1, _081C4714
	movs r0, #0
	bl sub_081C47A0
	pop {r0}
	bx r0
	.align 2, 0
_081C4714: .4byte 0x08085AFD
	thumb_func_end CB2_PyramidBagMenuFromStartMenu

	thumb_func_start sub_081C4718
sub_081C4718: @ 0x081C4718
	push {lr}
	ldr r1, _081C4728
	movs r0, #1
	bl sub_081C47A0
	pop {r0}
	bx r0
	.align 2, 0
_081C4728: .4byte 0x0805996D
	thumb_func_end sub_081C4718

	thumb_func_start sub_081C472C
sub_081C472C: @ 0x081C472C
	push {lr}
	bl ScriptContext2_Enable
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r0, _081C4748
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081C4748: .4byte 0x081C474D
	thumb_func_end sub_081C472C

	thumb_func_start sub_081C474C
sub_081C474C: @ 0x081C474C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081C477C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081C4776
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _081C4780
	ldr r1, _081C4784
	str r1, [r0]
	ldr r1, _081C4788
	movs r0, #3
	bl sub_081C47A0
	adds r0, r4, #0
	bl DestroyTask
_081C4776:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C477C: .4byte 0x02037C74
_081C4780: .4byte 0x03005B10
_081C4784: .4byte 0x081B9069
_081C4788: .4byte 0x08085A31
	thumb_func_end sub_081C474C

	thumb_func_start sub_081C478C
sub_081C478C: @ 0x081C478C
	push {lr}
	ldr r0, _081C479C
	ldr r1, [r0]
	movs r0, #4
	bl sub_081C47A0
	pop {r0}
	bx r0
	.align 2, 0
_081C479C: .4byte 0x0203CBFC
	thumb_func_end sub_081C478C

	thumb_func_start sub_081C47A0
sub_081C47A0: @ 0x081C47A0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _081C4804
	ldr r0, _081C4808
	bl AllocZeroed
	str r0, [r6]
	cmp r4, #4
	beq _081C47BA
	ldr r0, _081C480C
	strb r4, [r0, #4]
_081C47BA:
	cmp r5, #0
	beq _081C47C2
	ldr r0, _081C480C
	str r5, [r0]
_081C47C2:
	ldr r0, [r6]
	movs r1, #0
	str r1, [r0]
	ldr r1, _081C4810
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r6]
	ldr r1, _081C4814
	adds r0, r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	ldr r0, [r6]
	ldr r1, _081C4818
	adds r0, r0, r1
	movs r1, #0xff
	movs r2, #0xb
	bl memset
	ldr r0, [r6]
	ldr r1, _081C481C
	adds r0, r0, r1
	movs r1, #0xff
	movs r2, #5
	bl memset
	ldr r0, _081C4820
	bl SetMainCallback2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C4804: .4byte 0x0203CBF8
_081C4808: .4byte 0x0000098C
_081C480C: .4byte 0x0203CBFC
_081C4810: .4byte 0x00000814
_081C4814: .4byte 0x00000816
_081C4818: .4byte 0x00000804
_081C481C: .4byte 0x0000080F
_081C4820: .4byte 0x081C4855
	thumb_func_end sub_081C47A0

	thumb_func_start sub_081C4824
sub_081C4824: @ 0x081C4824
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C4824

	thumb_func_start sub_081C4840
sub_081C4840: @ 0x081C4840
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C4840

	thumb_func_start sub_081C4854
sub_081C4854: @ 0x081C4854
	push {lr}
_081C4856:
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C487A
	bl sub_081C4880
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C487A
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C4856
_081C487A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C4854

	thumb_func_start sub_081C4880
sub_081C4880: @ 0x081C4880
	push {lr}
	sub sp, #4
	ldr r0, _081C48A0
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x10
	bls _081C4894
	b _081C49C4
_081C4894:
	lsls r0, r0, #2
	ldr r1, _081C48A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C48A0: .4byte 0x03002360
_081C48A4: .4byte 0x081C48A8
_081C48A8: @ jump table
	.4byte _081C48EC @ case 0
	.4byte _081C48F6 @ case 1
	.4byte _081C48FC @ case 2
	.4byte _081C4902 @ case 3
	.4byte _081C4914 @ case 4
	.4byte _081C491A @ case 5
	.4byte _081C492A @ case 6
	.4byte _081C4944 @ case 7
	.4byte _081C4950 @ case 8
	.4byte _081C4956 @ case 9
	.4byte _081C4964 @ case 10
	.4byte _081C496A @ case 11
	.4byte _081C4970 @ case 12
	.4byte _081C4976 @ case 13
	.4byte _081C497C @ case 14
	.4byte _081C4982 @ case 15
	.4byte _081C4990 @ case 16
_081C48EC:
	bl SetVBlankHBlankCallbacksToNull
	bl clear_scheduled_bg_copies_to_vram
	b _081C49AA
_081C48F6:
	bl ScanlineEffect_Stop
	b _081C49AA
_081C48FC:
	bl FreeAllSpritePalettes
	b _081C49AA
_081C4902:
	bl ResetPaletteFade
	ldr r2, _081C4910
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	b _081C49A8
	.align 2, 0
_081C4910: .4byte 0x02037C74
_081C4914:
	bl ResetSpriteData
	b _081C49AA
_081C491A:
	bl sub_081221B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C49AA
	bl ResetTasks
	b _081C49AA
_081C492A:
	bl sub_081C49E4
	ldr r0, _081C493C
	ldr r0, [r0]
	ldr r1, _081C4940
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _081C49AA
	.align 2, 0
_081C493C: .4byte 0x0203CBF8
_081C4940: .4byte 0x00000984
_081C4944:
	bl sub_081C4A40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C49DC
	b _081C49AA
_081C4950:
	bl sub_081C63F0
	b _081C49AA
_081C4956:
	bl sub_081C5120
	bl sub_081C51B8
	bl sub_081C521C
	b _081C49AA
_081C4964:
	bl SetBagItemsListTemplate
	b _081C49AA
_081C496A:
	bl sub_081C4EF4
	b _081C49AA
_081C4970:
	bl sub_081C66B4
	b _081C49AA
_081C4976:
	bl AddScrollArrow
	b _081C49AA
_081C497C:
	bl sub_081C67CC
	b _081C49AA
_081C4982:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	b _081C49AA
_081C4990:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r2, _081C49BC
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
_081C49A8:
	strb r0, [r2, #8]
_081C49AA:
	ldr r1, _081C49C0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081C49DC
	.align 2, 0
_081C49BC: .4byte 0x02037C74
_081C49C0: .4byte 0x03002360
_081C49C4:
	ldr r0, _081C49D4
	bl SetVBlankCallback
	ldr r0, _081C49D8
	bl SetMainCallback2
	movs r0, #1
	b _081C49DE
	.align 2, 0
_081C49D4: .4byte 0x081C4841
_081C49D8: .4byte 0x081C4825
_081C49DC:
	movs r0, #0
_081C49DE:
	add sp, #4
	pop {r1}
	bx r1
	thumb_func_end sub_081C4880

	thumb_func_start sub_081C49E4
sub_081C49E4: @ 0x081C49E4
	push {lr}
	bl ResetVramOamAndBgCntRegs
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081C4A38
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r0, _081C4A3C
	ldr r1, [r0]
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
	pop {r0}
	bx r0
	.align 2, 0
_081C4A38: .4byte 0x085EF704
_081C4A3C: .4byte 0x0203CBF8
	thumb_func_end sub_081C49E4

	thumb_func_start sub_081C4A40
sub_081C4A40: @ 0x081C4A40
	push {r4, lr}
	sub sp, #4
	ldr r4, _081C4A60
	ldr r0, [r4]
	ldr r1, _081C4A64
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _081C4AF8
	lsls r0, r0, #2
	ldr r1, _081C4A68
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C4A60: .4byte 0x0203CBF8
_081C4A64: .4byte 0x00000984
_081C4A68: .4byte 0x081C4A6C
_081C4A6C: @ jump table
	.4byte _081C4A80 @ case 0
	.4byte _081C4A9C @ case 1
	.4byte _081C4AC0 @ case 2
	.4byte _081C4AD0 @ case 3
	.4byte _081C4ADC @ case 4
_081C4A80:
	bl reset_temp_tile_data_buffers
	ldr r1, _081C4A98
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _081C4AE0
	.align 2, 0
_081C4A98: .4byte 0x08D9A7CC
_081C4A9C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C4B10
	ldr r0, _081C4AB8
	ldr r4, _081C4ABC
	ldr r1, [r4]
	adds r1, #4
	bl LZDecompressVram
	ldr r1, [r4]
	b _081C4AE4
	.align 2, 0
_081C4AB8: .4byte 0x08D9AFFC
_081C4ABC: .4byte 0x0203CBF8
_081C4AC0:
	ldr r0, _081C4ACC
	movs r1, #0
	movs r2, #0x20
	bl LoadCompressedPalette
	b _081C4AE0
	.align 2, 0
_081C4ACC: .4byte 0x08D9B13C
_081C4AD0:
	ldr r0, _081C4AD8
	bl LoadCompressedSpriteSheet
	b _081C4AE0
	.align 2, 0
_081C4AD8: .4byte 0x085EF81C
_081C4ADC:
	bl sub_081C6658
_081C4AE0:
	ldr r0, _081C4AF0
	ldr r1, [r0]
_081C4AE4:
	ldr r0, _081C4AF4
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _081C4B10
	.align 2, 0
_081C4AF0: .4byte 0x0203CBF8
_081C4AF4: .4byte 0x00000984
_081C4AF8:
	bl LoadListMenuArrowsGfx
	ldr r0, [r4]
	ldr r1, _081C4B0C
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	movs r0, #1
	b _081C4B12
	.align 2, 0
_081C4B0C: .4byte 0x00000984
_081C4B10:
	movs r0, #0
_081C4B12:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C4A40

	thumb_func_start SetBagItemsListTemplate
SetBagItemsListTemplate: @ 0x081C4B1C
	push {r4, r5, r6, r7, lr}
	ldr r0, _081C4BE4
	ldr r2, [r0]
	ldr r1, _081C4BE8
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _081C4BEC
	adds r0, r0, r3
	adds r7, r2, r0
	movs r6, #0
	ldr r1, _081C4BF0
	ldr r0, [r1]
	ldr r4, _081C4BF4
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _081C4B8A
	adds r5, r1, #0
_081C4B4C:
	lsls r1, r6, #1
	adds r4, r1, r6
	lsls r4, r4, #3
	ldr r0, _081C4BF8
	adds r4, r4, r0
	ldr r0, [r5]
	adds r0, r0, r4
	adds r1, r1, r7
	ldrh r1, [r1]
	bl PyramidBag_CopyItemName
	ldr r1, [r5]
	lsls r2, r6, #3
	ldr r3, _081C4BFC
	adds r0, r1, r3
	adds r0, r0, r2
	adds r4, r1, r4
	str r4, [r0]
	ldr r4, _081C4C00
	adds r0, r1, r4
	adds r0, r0, r2
	str r6, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _081C4BF4
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	cmp r6, r0
	blt _081C4B4C
_081C4B8A:
	ldr r5, _081C4BF0
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	ldr r1, _081C4BF8
	adds r4, r4, r1
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _081C4C04
	bl StringCopy
	ldr r1, [r5]
	lsls r2, r6, #3
	ldr r3, _081C4BFC
	adds r0, r1, r3
	adds r0, r0, r2
	adds r4, r1, r4
	str r4, [r0]
	ldr r4, _081C4C00
	adds r1, r1, r4
	adds r1, r1, r2
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r1]
	ldr r2, _081C4C08
	adds r1, r2, #0
	ldr r0, _081C4C0C
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldr r1, [r5]
	ldr r6, _081C4BF4
	adds r0, r1, r6
	ldrb r0, [r0]
	strh r0, [r2, #0xc]
	adds r3, r1, r3
	str r3, [r2]
	ldr r7, _081C4C10
	adds r1, r1, r7
	ldrb r0, [r1]
	strh r0, [r2, #0xe]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C4BE4: .4byte 0x03005AF0
_081C4BE8: .4byte 0x00000CA9
_081C4BEC: .4byte 0x00000E2C
_081C4BF0: .4byte 0x0203CBF8
_081C4BF4: .4byte 0x00000821
_081C4BF8: .4byte 0x0000087C
_081C4BFC: .4byte 0x00000824
_081C4C00: .4byte 0x00000828
_081C4C04: .4byte 0x085C9448
_081C4C08: .4byte 0x03006050
_081C4C0C: .4byte 0x085EF710
_081C4C10: .4byte 0x00000822
	thumb_func_end SetBagItemsListTemplate

	thumb_func_start PyramidBag_CopyItemName
PyramidBag_CopyItemName: @ 0x081C4C14
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r0, r4, #0
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _081C4C58
	ldr r0, _081C4C4C
	adds r1, r4, #0
	subs r1, #0x84
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r1, _081C4C50
	adds r0, r4, #0
	bl CopyItemName
	ldr r1, _081C4C54
	adds r0, r5, #0
	bl StringExpandPlaceholders
	b _081C4C60
	.align 2, 0
_081C4C4C: .4byte 0x02021C40
_081C4C50: .4byte 0x02021C54
_081C4C54: .4byte 0x085C976F
_081C4C58:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CopyItemName
_081C4C60:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PyramidBag_CopyItemName

	thumb_func_start PyramidBagMoveCursorFunc
PyramidBagMoveCursorFunc: @ 0x081C4C68
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _081C4C7E
	movs r0, #5
	bl PlaySE
	bl sub_081C66E0
_081C4C7E:
	ldr r5, _081C4CD0
	ldr r1, [r5]
	ldr r2, _081C4CD4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081C4D0C
	adds r2, #1
	adds r0, r1, r2
	ldrb r1, [r0]
	movs r0, #1
	eors r0, r1
	bl sub_081C67B8
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _081C4CE8
	ldr r0, _081C4CD8
	ldr r2, [r0]
	lsls r3, r4, #1
	ldr r1, _081C4CDC
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r0, _081C4CE0
	adds r2, r2, r0
	adds r2, r2, r3
	ldrh r0, [r2]
	ldr r1, [r5]
	ldr r2, _081C4CE4
	adds r1, r1, r2
	ldrb r1, [r1]
	bl ShowItemImage
	b _081C4CF6
	.align 2, 0
_081C4CD0: .4byte 0x0203CBF8
_081C4CD4: .4byte 0x00000814
_081C4CD8: .4byte 0x03005AF0
_081C4CDC: .4byte 0x00000CA9
_081C4CE0: .4byte 0x00000E2C
_081C4CE4: .4byte 0x00000815
_081C4CE8:
	ldr r0, _081C4D14
	ldr r1, [r5]
	ldr r2, _081C4D18
	adds r1, r1, r2
	ldrb r1, [r1]
	bl ShowItemImage
_081C4CF6:
	ldr r0, _081C4D1C
	ldr r1, [r0]
	ldr r0, _081C4D18
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #1
	eors r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl PrintItemDescription
_081C4D0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C4D14: .4byte 0x0000FFFF
_081C4D18: .4byte 0x00000815
_081C4D1C: .4byte 0x0203CBF8
	thumb_func_end PyramidBagMoveCursorFunc

	thumb_func_start PrintItemQuantity
PrintItemQuantity: @ 0x081C4D20
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _081C4DB2
	ldr r0, _081C4D58
	ldr r0, [r0]
	ldr r1, _081C4D5C
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	beq _081C4D68
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _081C4D60
	adds r0, r5, #0
	movs r1, #1
	bl sub_081C52B4
	b _081C4D68
	.align 2, 0
_081C4D58: .4byte 0x0203CBF8
_081C4D5C: .4byte 0x00000814
_081C4D60:
	adds r0, r5, #0
	movs r1, #0xff
	bl sub_081C52B4
_081C4D68:
	ldr r0, _081C4DBC
	ldr r1, _081C4DC0
	ldr r3, [r1]
	ldr r2, _081C4DC4
	adds r1, r3, r2
	ldrb r2, [r1]
	lsls r2, r2, #0x1e
	lsrs r2, r2, #0x1e
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r4, r1
	ldr r2, _081C4DC8
	adds r3, r3, r2
	adds r3, r3, r1
	ldrb r1, [r3]
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081C4DCC
	ldr r1, _081C4DD0
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x60
	adds r3, r5, #0
	bl PrintOnWindow_Font1
_081C4DB2:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C4DBC: .4byte 0x02021C40
_081C4DC0: .4byte 0x03005AF0
_081C4DC4: .4byte 0x00000CA9
_081C4DC8: .4byte 0x00000E54
_081C4DCC: .4byte 0x02021C7C
_081C4DD0: .4byte 0x085C943C
	thumb_func_end PrintItemQuantity

	thumb_func_start PrintItemDescription
PrintItemDescription: @ 0x081C4DD4
	push {r4, lr}
	sub sp, #0x10
	adds r3, r0, #0
	movs r0, #2
	rsbs r0, r0, #0
	cmp r3, r0
	beq _081C4E18
	ldr r0, _081C4E0C
	ldr r2, [r0]
	lsls r3, r3, #1
	ldr r1, _081C4E10
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r0, _081C4E14
	adds r2, r2, r0
	adds r2, r2, r3
	ldrh r0, [r2]
	bl ItemId_GetHoldEffect
	adds r4, r0, #0
	b _081C4E34
	.align 2, 0
_081C4E0C: .4byte 0x03005AF0
_081C4E10: .4byte 0x00000CA9
_081C4E14: .4byte 0x00000E2C
_081C4E18:
	ldr r0, _081C4E5C
	ldr r2, _081C4E60
	ldr r1, _081C4E64
	ldrb r1, [r1, #4]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r4, _081C4E68
	ldr r1, _081C4E6C
	adds r0, r4, #0
	bl StringExpandPlaceholders
_081C4E34:
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl PrintOnWindow_Font1
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C4E5C: .4byte 0x02021C40
_081C4E60: .4byte 0x085C9728
_081C4E64: .4byte 0x0203CBFC
_081C4E68: .4byte 0x02021C7C
_081C4E6C: .4byte 0x085C9738
	thumb_func_end PrintItemDescription

	thumb_func_start AddScrollArrow
AddScrollArrow: @ 0x081C4E70
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _081C4EB8
	ldr r1, [r4]
	ldr r2, _081C4EBC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081C4EB0
	adds r2, #0xb
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [sp]
	ldr r0, _081C4EC0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _081C4EC4
	str r0, [sp, #0xc]
	movs r0, #2
	movs r1, #0xac
	movs r2, #0xc
	movs r3, #0x94
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r4]
	ldr r2, _081C4EBC
	adds r1, r1, r2
	strb r0, [r1]
_081C4EB0:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C4EB8: .4byte 0x0203CBF8
_081C4EBC: .4byte 0x00000816
_081C4EC0: .4byte 0x00000B5E
_081C4EC4: .4byte 0x0203CC04
	thumb_func_end AddScrollArrow

	thumb_func_start RemoveScrollArrow
RemoveScrollArrow: @ 0x081C4EC8
	push {r4, lr}
	ldr r4, _081C4EEC
	ldr r0, [r4]
	ldr r2, _081C4EF0
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081C4EE6
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r1, _081C4EF0
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
_081C4EE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C4EEC: .4byte 0x0203CBF8
_081C4EF0: .4byte 0x00000816
	thumb_func_end RemoveScrollArrow

	thumb_func_start sub_081C4EF4
sub_081C4EF4: @ 0x081C4EF4
	push {r4, lr}
	ldr r0, _081C4F24
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081C4F28
	adds r4, r4, r0
	ldr r0, _081C4F2C
	ldr r2, _081C4F30
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C4F24: .4byte 0x081C53C5
_081C4F28: .4byte 0x03005B68
_081C4F2C: .4byte 0x03006050
_081C4F30: .4byte 0x0203CBFC
	thumb_func_end sub_081C4EF4

	thumb_func_start SwapItems
SwapItems: @ 0x081C4F34
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _081C4F94
	ldr r6, [r2]
	ldr r3, _081C4F98
	adds r2, r6, r3
	ldrb r3, [r2]
	lsls r3, r3, #0x1e
	lsrs r2, r3, #0x1e
	lsls r4, r2, #2
	adds r4, r4, r2
	lsls r4, r4, #2
	ldr r2, _081C4F9C
	adds r4, r4, r2
	adds r4, r6, r4
	lsrs r3, r3, #0x1e
	lsls r2, r3, #2
	adds r2, r2, r3
	lsls r2, r2, #1
	ldr r3, _081C4FA0
	adds r2, r2, r3
	adds r6, r6, r2
	lsls r5, r0, #1
	adds r5, r5, r4
	ldrh r2, [r5]
	mov r8, r2
	lsls r2, r1, #1
	adds r2, r2, r4
	ldrh r3, [r2]
	strh r3, [r5]
	mov r3, r8
	strh r3, [r2]
	adds r0, r6, r0
	ldrb r2, [r0]
	adds r6, r6, r1
	ldrb r1, [r6]
	strb r1, [r0]
	strb r2, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C4F94: .4byte 0x03005AF0
_081C4F98: .4byte 0x00000CA9
_081C4F9C: .4byte 0x00000E2C
_081C4FA0: .4byte 0x00000E54
	thumb_func_end SwapItems

	thumb_func_start MovePyramidBagItemSlotInList
MovePyramidBagItemSlotInList: @ 0x081C4FA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _081C501C
	ldr r3, [r0]
	ldr r1, _081C5020
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r2, r1, #0x1e
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _081C5024
	adds r0, r0, r2
	adds r6, r3, r0
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _081C5028
	adds r0, r0, r1
	adds r3, r3, r0
	cmp r4, r5
	beq _081C505E
	lsls r0, r4, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	mov ip, r0
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r8, r0
	cmp r5, r4
	bls _081C502C
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r2, r4, #0x10
	cmp r4, r5
	bge _081C5050
_081C4FFE:
	asrs r2, r2, #0x10
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r1, [r0, #2]
	strh r1, [r0]
	adds r1, r3, r2
	ldrb r0, [r1, #1]
	strb r0, [r1]
	adds r2, #1
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, r5
	blt _081C4FFE
	b _081C5050
	.align 2, 0
_081C501C: .4byte 0x03005AF0
_081C5020: .4byte 0x00000CA9
_081C5024: .4byte 0x00000E2C
_081C5028: .4byte 0x00000E54
_081C502C:
	lsls r2, r7, #0x10
	cmp r7, r5
	ble _081C5050
_081C5032:
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r6
	subs r0, r1, #2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, r3, r2
	subs r0, r1, #1
	ldrb r0, [r0]
	strb r0, [r1]
	subs r2, #1
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, r5
	bgt _081C5032
_081C5050:
	lsls r0, r5, #1
	adds r0, r0, r6
	mov r2, ip
	strh r2, [r0]
	adds r0, r3, r5
	mov r1, r8
	strb r1, [r0]
_081C505E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end MovePyramidBagItemSlotInList

	thumb_func_start CompactItems
CompactItems: @ 0x081C5068
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _081C5110
	ldr r3, [r0]
	ldr r1, _081C5114
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r2, r1, #0x1e
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _081C5118
	adds r0, r0, r2
	adds r0, r0, r3
	mov sb, r0
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r4, _081C511C
	adds r0, r0, r4
	adds r3, r3, r0
	mov r8, r3
	movs r5, #0
	movs r3, #0
_081C50A0:
	lsls r0, r5, #1
	mov r1, sb
	adds r2, r0, r1
	ldrh r0, [r2]
	mov r4, r8
	adds r1, r4, r5
	cmp r0, #0
	beq _081C50B6
	ldrb r0, [r1]
	cmp r0, #0
	bne _081C50BA
_081C50B6:
	strh r3, [r2]
	strb r3, [r1]
_081C50BA:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _081C50A0
	movs r5, #0
_081C50C6:
	adds r1, r5, #1
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	adds r7, r1, #0
	cmp r4, #9
	bhi _081C50FA
	lsls r0, r5, #1
	mov r1, sb
	adds r6, r0, r1
_081C50D8:
	ldrh r0, [r6]
	cmp r0, #0
	beq _081C50E8
	mov r2, r8
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _081C50F0
_081C50E8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SwapItems
_081C50F0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _081C50D8
_081C50FA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _081C50C6
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C5110: .4byte 0x03005AF0
_081C5114: .4byte 0x00000CA9
_081C5118: .4byte 0x00000E2C
_081C511C: .4byte 0x00000E54
	thumb_func_end CompactItems

	thumb_func_start sub_081C5120
sub_081C5120: @ 0x081C5120
	push {r4, r5, r6, lr}
	ldr r0, _081C5190
	ldr r2, [r0]
	ldr r1, _081C5194
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081C5198
	adds r0, r0, r1
	adds r5, r2, r0
	bl CompactItems
	ldr r3, _081C519C
	ldr r0, [r3]
	ldr r2, _081C51A0
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	movs r4, #0
	adds r6, r3, #0
_081C5150:
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r3, _081C519C
	cmp r0, #0
	beq _081C5166
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_081C5166:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #9
	bls _081C5150
	ldr r0, [r3]
	ldr r2, _081C51A0
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r3]
	adds r2, r0, r2
	ldrb r2, [r2]
	cmp r2, #8
	bls _081C51A8
	ldr r2, _081C51A4
	adds r1, r0, r2
	movs r0, #8
	strb r0, [r1]
	b _081C51AE
	.align 2, 0
_081C5190: .4byte 0x03005AF0
_081C5194: .4byte 0x00000CA9
_081C5198: .4byte 0x00000E2C
_081C519C: .4byte 0x0203CBF8
_081C51A0: .4byte 0x00000821
_081C51A4: .4byte 0x00000822
_081C51A8:
	ldr r1, _081C51B4
	adds r0, r0, r1
	strb r2, [r0]
_081C51AE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C51B4: .4byte 0x00000822
	thumb_func_end sub_081C5120

	thumb_func_start sub_081C51B8
sub_081C51B8: @ 0x081C51B8
	push {r4, r5, lr}
	ldr r0, _081C5200
	ldrh r1, [r0, #8]
	adds r3, r0, #0
	ldr r4, _081C5204
	cmp r1, #0
	beq _081C51E0
	ldrh r0, [r3, #8]
	ldr r1, [r4]
	ldr r5, _081C5208
	adds r2, r1, r5
	ldrb r2, [r2]
	adds r0, r0, r2
	subs r5, #1
	adds r1, r1, r5
	ldrb r1, [r1]
	cmp r0, r1
	ble _081C51E0
	subs r0, r1, r2
	strh r0, [r3, #8]
_081C51E0:
	adds r2, r3, #0
	ldrh r1, [r2, #8]
	ldrh r0, [r2, #6]
	adds r1, r1, r0
	ldr r0, [r4]
	ldr r4, _081C520C
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r1, r0
	blt _081C5214
	adds r1, r0, #0
	cmp r1, #0
	bne _081C5210
	strh r1, [r2, #6]
	b _081C5214
	.align 2, 0
_081C5200: .4byte 0x0203CBFC
_081C5204: .4byte 0x0203CBF8
_081C5208: .4byte 0x00000822
_081C520C: .4byte 0x00000821
_081C5210:
	subs r0, #1
	strh r0, [r3, #6]
_081C5214:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C51B8

	thumb_func_start sub_081C521C
sub_081C521C: @ 0x081C521C
	push {r4, r5, r6, r7, lr}
	ldr r0, _081C5284
	ldrh r1, [r0, #6]
	adds r5, r0, #0
	cmp r1, #4
	bls _081C527C
	movs r4, #0
	ldrh r0, [r5, #6]
	subs r0, #4
	cmp r4, r0
	bgt _081C527C
	ldrh r2, [r5, #8]
	ldr r6, _081C5288
	ldr r0, [r6]
	ldr r3, _081C528C
	adds r1, r0, r3
	ldrb r1, [r1]
	adds r2, r2, r1
	ldr r7, _081C5290
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r2, r0
	beq _081C527C
	adds r3, r5, #0
_081C524C:
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrh r0, [r3, #6]
	subs r0, #4
	cmp r4, r0
	bgt _081C527C
	ldrh r2, [r5, #8]
	ldr r1, [r6]
	ldr r7, _081C528C
	adds r0, r1, r7
	ldrb r0, [r0]
	adds r2, r2, r0
	ldr r0, _081C5290
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r2, r1
	bne _081C524C
_081C527C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C5284: .4byte 0x0203CBFC
_081C5288: .4byte 0x0203CBF8
_081C528C: .4byte 0x00000822
_081C5290: .4byte 0x00000821
	thumb_func_end sub_081C521C

	thumb_func_start sub_081C5294
sub_081C5294: @ 0x081C5294
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
	bl sub_081C52B4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081C5294

	thumb_func_start sub_081C52B4
sub_081C52B4: @ 0x081C52B4
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r2, #0xff
	bne _081C52F0
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
	b _081C5304
_081C52F0:
	ldr r1, _081C530C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r2, #0
	adds r3, r5, #0
	bl PrintOnWindow_Font1
_081C5304:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C530C: .4byte 0x085C9421
	thumb_func_end sub_081C52B4

	thumb_func_start sub_081C5310
sub_081C5310: @ 0x081C5310
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
	ldr r1, _081C5340
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081C5344
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C5340: .4byte 0x03005B60
_081C5344: .4byte 0x081C5349
	thumb_func_end sub_081C5310

	thumb_func_start sub_081C5348
sub_081C5348: @ 0x081C5348
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C5380
	adds r2, r0, r1
	ldr r0, _081C5384
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081C53B8
	ldrb r0, [r2]
	ldr r4, _081C5388
	subs r2, r4, #2
	adds r1, r4, #0
	bl DestroyListMenuTask
	ldr r0, _081C538C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _081C5390
	bl SetMainCallback2
	b _081C539A
	.align 2, 0
_081C5380: .4byte 0x03005B68
_081C5384: .4byte 0x02037C74
_081C5388: .4byte 0x0203CC04
_081C538C: .4byte 0x0203CBF8
_081C5390:
	adds r0, r4, #0
	subs r0, #8
	ldr r0, [r0]
	bl SetMainCallback2
_081C539A:
	bl RemoveScrollArrow
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl FreeAllWindowBuffers
	ldr r0, _081C53C0
	ldr r0, [r0]
	bl Free
	adds r0, r5, #0
	bl DestroyTask
_081C53B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C53C0: .4byte 0x0203CBF8
	thumb_func_end sub_081C5348

	thumb_func_start Task_HandlePyramidBagInput
Task_HandlePyramidBagInput: @ 0x081C53C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C5440
	adds r7, r0, r1
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C53E6
	b _081C5512
_081C53E6:
	ldr r0, _081C5444
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081C53F4
	b _081C5512
_081C53F4:
	ldr r0, _081C5448
	ldrh r1, [r0, #0x2e]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _081C5458
	ldr r4, _081C544C
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _081C540E
	b _081C5512
_081C540E:
	ldrb r0, [r7]
	adds r1, r4, #0
	adds r1, #8
	adds r2, r4, #6
	bl ListMenuGetScrollAndRow
	ldrh r1, [r4, #8]
	ldrh r0, [r4, #6]
	adds r1, r1, r0
	ldr r0, _081C5450
	ldr r0, [r0]
	ldr r2, _081C5454
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	beq _081C5512
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl Task_BeginItemSwap
	b _081C5512
	.align 2, 0
_081C5440: .4byte 0x03005B68
_081C5444: .4byte 0x02037C74
_081C5448: .4byte 0x03002360
_081C544C: .4byte 0x0203CBFC
_081C5450: .4byte 0x0203CBF8
_081C5454: .4byte 0x00000821
_081C5458:
	ldrb r0, [r7]
	bl ListMenu_ProcessInput
	adds r6, r0, #0
	ldrb r0, [r7]
	ldr r1, _081C5480
	mov r8, r1
	mov r2, r8
	subs r2, #2
	bl ListMenuGetScrollAndRow
	movs r0, #2
	rsbs r0, r0, #0
	cmp r6, r0
	beq _081C5484
	adds r0, #1
	cmp r6, r0
	bne _081C549C
	b _081C5512
	.align 2, 0
_081C5480: .4byte 0x0203CC04
_081C5484:
	movs r0, #5
	bl PlaySE
	ldr r0, _081C5498
	strh r4, [r0]
	adds r0, r5, #0
	bl sub_081C5310
	b _081C5512
	.align 2, 0
_081C5498: .4byte 0x0203CB48
_081C549C:
	movs r0, #5
	bl PlaySE
	ldr r2, _081C54F8
	mov ip, r2
	ldr r0, _081C54FC
	ldr r2, [r0]
	lsls r3, r6, #1
	ldr r0, _081C5500
	adds r4, r2, r0
	ldrb r1, [r4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r1, _081C5504
	adds r0, r2, r1
	adds r0, r0, r3
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1]
	strh r6, [r7, #2]
	ldrb r1, [r4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r6, r0
	ldr r1, _081C5508
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	strh r0, [r7, #4]
	mov r0, r8
	subs r0, #8
	ldrb r0, [r0, #4]
	cmp r0, #2
	bne _081C550C
	adds r0, r5, #0
	bl sub_081C5F5C
	b _081C5512
	.align 2, 0
_081C54F8: .4byte 0x0203CB48
_081C54FC: .4byte 0x03005AF0
_081C5500: .4byte 0x00000CA9
_081C5504: .4byte 0x00000E2C
_081C5508: .4byte 0x00000E54
_081C550C:
	adds r0, r5, #0
	bl sub_081C551C
_081C5512:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Task_HandlePyramidBagInput

	thumb_func_start sub_081C551C
sub_081C551C: @ 0x081C551C
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081C555C
	adds r4, r4, r0
	bl RemoveScrollArrow
	ldrb r0, [r4]
	movs r1, #1
	bl sub_081C5294
	ldr r0, _081C5560
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _081C5570
	cmp r4, #3
	beq _081C55C0
	ldr r0, _081C5564
	ldr r1, [r0]
	ldr r0, _081C5568
	adds r2, r1, r0
	ldr r0, _081C556C
	str r0, [r2]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r1, r1, r0
	movs r0, #4
	b _081C55D4
	.align 2, 0
_081C555C: .4byte 0x03005B68
_081C5560: .4byte 0x0203CBFC
_081C5564: .4byte 0x0203CBF8
_081C5568: .4byte 0x00000818
_081C556C: .4byte 0x085EF758
_081C5570:
	ldr r0, _081C558C
	ldrh r0, [r0]
	bl ItemId_GetSecondaryId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C559C
	ldr r0, _081C5590
	ldr r1, [r0]
	ldr r0, _081C5594
	adds r2, r1, r0
	ldr r0, _081C5598
	b _081C55CA
	.align 2, 0
_081C558C: .4byte 0x0203CB48
_081C5590: .4byte 0x0203CBF8
_081C5594: .4byte 0x00000818
_081C5598: .4byte 0x085EF75E
_081C559C:
	ldr r0, _081C55B4
	ldr r0, [r0]
	ldr r1, _081C55B8
	adds r2, r0, r1
	ldr r1, _081C55BC
	str r1, [r2]
	movs r1, #0x82
	lsls r1, r1, #4
	adds r0, r0, r1
	strb r4, [r0]
	b _081C55D6
	.align 2, 0
_081C55B4: .4byte 0x0203CBF8
_081C55B8: .4byte 0x00000818
_081C55BC: .4byte 0x085EF760
_081C55C0:
	ldr r0, _081C561C
	ldr r1, [r0]
	ldr r0, _081C5620
	adds r2, r1, r0
	ldr r0, _081C5624
_081C55CA:
	str r0, [r2]
	movs r0, #0x82
	lsls r0, r0, #4
	adds r1, r1, r0
	movs r0, #2
_081C55D4:
	strb r0, [r1]
_081C55D6:
	ldr r0, _081C5628
	ldrh r0, [r0]
	ldr r1, _081C562C
	bl CopyItemName
	ldr r4, _081C5630
	ldr r1, _081C5634
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl PrintOnWindow_Font1
	ldr r0, _081C561C
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _081C5638
	movs r0, #0
	b _081C563E
	.align 2, 0
_081C561C: .4byte 0x0203CBF8
_081C5620: .4byte 0x00000818
_081C5624: .4byte 0x085EF75C
_081C5628: .4byte 0x0203CB48
_081C562C: .4byte 0x02021C40
_081C5630: .4byte 0x02021C7C
_081C5634: .4byte 0x085C9450
_081C5638:
	cmp r0, #2
	bne _081C564C
	movs r0, #1
_081C563E:
	bl sub_081C64E4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081C56A8
	b _081C565E
_081C564C:
	movs r0, #2
	bl sub_081C64E4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	movs r2, #2
	bl sub_081C5724
_081C565E:
	ldr r0, _081C567C
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #4
	bne _081C5688
	ldr r0, _081C5680
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081C5684
	b _081C5694
	.align 2, 0
_081C567C: .4byte 0x0203CBF8
_081C5680: .4byte 0x03005B60
_081C5684: .4byte 0x081C5811
_081C5688:
	ldr r0, _081C56A0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081C56A4
_081C5694:
	str r0, [r1]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C56A0: .4byte 0x03005B60
_081C56A4: .4byte 0x081C5795
	thumb_func_end sub_081C551C

	thumb_func_start sub_081C56A8
sub_081C56A8: @ 0x081C56A8
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
	ldr r6, _081C5718
	ldr r1, [r6]
	movs r5, #0x82
	lsls r5, r5, #4
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp, #8]
	ldr r0, _081C571C
	str r0, [sp, #0xc]
	ldr r0, _081C5720
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
_081C5718: .4byte 0x0203CBF8
_081C571C: .4byte 0x085EF728
_081C5720: .4byte 0x00000818
	thumb_func_end sub_081C56A8

	thumb_func_start sub_081C5724
sub_081C5724: @ 0x081C5724
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
	ldr r0, _081C5788
	str r0, [sp, #0xc]
	ldr r0, _081C578C
	ldr r0, [r0]
	ldr r1, _081C5790
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
_081C5788: .4byte 0x085EF728
_081C578C: .4byte 0x0203CBF8
_081C5790: .4byte 0x00000818
	thumb_func_end sub_081C5724

	thumb_func_start HandleFewMenuActionsInput
HandleFewMenuActionsInput: @ 0x081C5794
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C57FC
	bl Menu_ProcessInputNoWrap
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _081C57FC
	adds r0, #1
	cmp r4, r0
	bne _081C57D4
	movs r0, #5
	bl PlaySE
	ldr r0, _081C57D0
	ldr r1, [r0, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	b _081C57FC
	.align 2, 0
_081C57D0: .4byte 0x085EF728
_081C57D4:
	movs r0, #5
	bl PlaySE
	ldr r1, _081C5804
	ldr r0, _081C5808
	ldr r0, [r0]
	ldr r2, _081C580C
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _081C57FC
	adds r0, r6, #0
	bl _call_via_r1
_081C57FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C5804: .4byte 0x085EF728
_081C5808: .4byte 0x0203CBF8
_081C580C: .4byte 0x00000818
	thumb_func_end HandleFewMenuActionsInput

	thumb_func_start HandleMenuActionInput
HandleMenuActionInput: @ 0x081C5810
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C5824
	b _081C598C
_081C5824:
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _081C5868
	ldrh r1, [r5, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081C586C
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bgt _081C5842
	b _081C598C
_081C5842:
	subs r0, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl IsValidMenuAction
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C5854
	b _081C598C
_081C5854:
	movs r0, #5
	bl PlaySE
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_08199250
	b _081C598C
	.align 2, 0
_081C5868: .4byte 0x03002360
_081C586C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081C58B0
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	ldr r0, _081C58AC
	ldr r0, [r0]
	movs r2, #0x82
	lsls r2, r2, #4
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #2
	cmp r1, r0
	blt _081C588C
	b _081C598C
_081C588C:
	adds r0, r1, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl IsValidMenuAction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C598C
	movs r0, #5
	bl PlaySE
	movs r0, #0
	movs r1, #1
	bl sub_08199250
	b _081C598C
	.align 2, 0
_081C58AC: .4byte 0x0203CBF8
_081C58B0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081C58C4
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C58EC
_081C58C4:
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C598C
	subs r0, r1, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl IsValidMenuAction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C598C
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	b _081C5926
_081C58EC:
	ldrh r1, [r5, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _081C5902
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _081C592E
_081C5902:
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081C598C
	adds r0, r1, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl IsValidMenuAction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C598C
	movs r0, #5
	bl PlaySE
	movs r0, #1
_081C5926:
	movs r1, #0
	bl sub_08199250
	b _081C598C
_081C592E:
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C5974
	movs r0, #5
	bl PlaySE
	ldr r2, _081C5968
	ldr r0, _081C596C
	ldr r0, [r0]
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	ldr r3, _081C5970
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r1, [r0]
	cmp r1, #0
	beq _081C598C
	adds r0, r6, #0
	bl _call_via_r1
	b _081C598C
	.align 2, 0
_081C5968: .4byte 0x085EF728
_081C596C: .4byte 0x0203CBF8
_081C5970: .4byte 0x00000818
_081C5974:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C598C
	movs r0, #5
	bl PlaySE
	ldr r0, _081C5994
	ldr r1, [r0, #0x1c]
	adds r0, r6, #0
	bl _call_via_r1
_081C598C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C5994: .4byte 0x085EF728
	thumb_func_end HandleMenuActionInput

	thumb_func_start IsValidMenuAction
IsValidMenuAction: @ 0x081C5998
	push {lr}
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _081C59CC
	ldr r0, _081C59C4
	ldr r2, [r0]
	movs r3, #0x82
	lsls r3, r3, #4
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bgt _081C59CC
	ldr r3, _081C59C8
	adds r0, r2, r3
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq _081C59CC
	movs r0, #1
	b _081C59CE
	.align 2, 0
_081C59C4: .4byte 0x0203CBF8
_081C59C8: .4byte 0x00000818
_081C59CC:
	movs r0, #0
_081C59CE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsValidMenuAction

	thumb_func_start sub_081C59D4
sub_081C59D4: @ 0x081C59D4
	push {lr}
	ldr r0, _081C59F0
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _081C59F4
	movs r0, #0
	bl sub_081C652C
	b _081C5A06
	.align 2, 0
_081C59F0: .4byte 0x0203CBF8
_081C59F4:
	cmp r0, #2
	bne _081C5A00
	movs r0, #1
	bl sub_081C652C
	b _081C5A06
_081C5A00:
	movs r0, #2
	bl sub_081C652C
_081C5A06:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C59D4

	thumb_func_start BagAction_UseOnField
BagAction_UseOnField: @ 0x081C5A0C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _081C5A48
	ldrh r0, [r4]
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	beq _081C5A38
	cmp r0, #2
	beq _081C5A38
	cmp r0, #3
	beq _081C5A38
	ldrh r0, [r4]
	bl ItemIsMail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C5A54
_081C5A38:
	bl sub_081C59D4
	ldr r1, _081C5A4C
	ldr r2, _081C5A50
	adds r0, r5, #0
	bl DisplayItemMessageInBattlePyramid
	b _081C5A7E
	.align 2, 0
_081C5A48: .4byte 0x0203CB48
_081C5A4C: .4byte 0x085C9556
_081C5A50: .4byte 0x081C5F25
_081C5A54:
	ldrh r0, [r4]
	bl sub_080D6DF8
	cmp r0, #0
	beq _081C5A7E
	bl sub_081C59D4
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldrh r0, [r4]
	bl sub_080D6DF8
	adds r1, r0, #0
	adds r0, r5, #0
	bl _call_via_r1
_081C5A7E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BagAction_UseOnField

	thumb_func_start BagAction_Cancel
BagAction_Cancel: @ 0x081C5A84
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081C5AC4
	adds r4, r4, r0
	bl sub_081C59D4
	movs r1, #2
	ldrsh r0, [r4, r1]
	bl PrintItemDescription
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	ldrb r0, [r4]
	movs r1, #0
	bl sub_081C5294
	adds r0, r5, #0
	bl SetTaskToMainPyramidBagInputHandler
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C5AC4: .4byte 0x03005B68
	thumb_func_end BagAction_Cancel

	thumb_func_start SetTaskToMainPyramidBagInputHandler
SetTaskToMainPyramidBagInputHandler: @ 0x081C5AC8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl AddScrollArrow
	ldr r1, _081C5AE8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081C5AEC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C5AE8: .4byte 0x03005B60
_081C5AEC: .4byte 0x081C53C5
	thumb_func_end SetTaskToMainPyramidBagInputHandler

	thumb_func_start BagAction_Toss
BagAction_Toss: @ 0x081C5AF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r6, r0, #3
	ldr r7, _081C5B1C
	adds r4, r6, r7
	bl sub_081C59D4
	movs r0, #1
	strh r0, [r4, #0x10]
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _081C5B20
	adds r0, r5, #0
	bl sub_081C5B7C
	b _081C5B60
	.align 2, 0
_081C5B1C: .4byte 0x03005B68
_081C5B20:
	ldr r0, _081C5B68
	ldrh r0, [r0]
	ldr r1, _081C5B6C
	bl CopyItemName
	ldr r4, _081C5B70
	ldr r1, _081C5B74
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl PrintOnWindow_Font1
	bl sub_081C5C30
	adds r0, r7, #0
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _081C5B78
	str r1, [r0]
_081C5B60:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C5B68: .4byte 0x0203CB48
_081C5B6C: .4byte 0x02021C40
_081C5B70: .4byte 0x02021C7C
_081C5B74: .4byte 0x085C9523
_081C5B78: .4byte 0x081C5CC5
	thumb_func_end BagAction_Toss

	thumb_func_start sub_081C5B7C
sub_081C5B7C: @ 0x081C5B7C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081C5BE0
	adds r4, r4, r0
	ldr r0, _081C5BE4
	ldrh r0, [r0]
	ldr r1, _081C5BE8
	bl CopyItemName
	ldr r0, _081C5BEC
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081C5BF0
	ldr r1, _081C5BF4
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl PrintOnWindow_Font1
	ldr r1, _081C5BF8
	adds r0, r5, #0
	bl sub_081C656C
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C5BE0: .4byte 0x03005B68
_081C5BE4: .4byte 0x0203CB48
_081C5BE8: .4byte 0x02021C40
_081C5BEC: .4byte 0x02021C54
_081C5BF0: .4byte 0x02021C7C
_081C5BF4: .4byte 0x085C9540
_081C5BF8: .4byte 0x085EF764
	thumb_func_end sub_081C5B7C

	thumb_func_start DontTossItem
DontTossItem: @ 0x081C5BFC
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081C5C2C
	adds r4, r4, r0
	movs r1, #2
	ldrsh r0, [r4, r1]
	bl PrintItemDescription
	ldrb r0, [r4]
	movs r1, #0
	bl sub_081C5294
	adds r0, r5, #0
	bl SetTaskToMainPyramidBagInputHandler
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C5C2C: .4byte 0x03005B68
	thumb_func_end DontTossItem

	thumb_func_start sub_081C5C30
sub_081C5C30: @ 0x081C5C30
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _081C5C70
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081C5C74
	ldr r1, _081C5C78
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #3
	bl sub_081C64AC
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	adds r2, r4, #0
	movs r3, #8
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C5C70: .4byte 0x02021C40
_081C5C74: .4byte 0x02021C7C
_081C5C78: .4byte 0x085C943C
	thumb_func_end sub_081C5C30

	thumb_func_start sub_081C5C7C
sub_081C5C7C: @ 0x081C5C7C
	push {r4, lr}
	sub sp, #0xc
	adds r1, r0, #0
	ldr r0, _081C5CB8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081C5CBC
	ldr r1, _081C5CC0
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	adds r2, r4, #0
	movs r3, #8
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C5CB8: .4byte 0x02021C40
_081C5CBC: .4byte 0x02021C7C
_081C5CC0: .4byte 0x085C943C
	thumb_func_end sub_081C5C7C

	thumb_func_start sub_081C5CC4
sub_081C5CC4: @ 0x081C5CC4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C5CF4
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x10
	ldrh r1, [r4, #4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C5CF8
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	bl sub_081C5C7C
	b _081C5D54
	.align 2, 0
_081C5CF4: .4byte 0x03005B68
_081C5CF8:
	ldr r0, _081C5D28
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C5D2C
	movs r0, #5
	bl PlaySE
	movs r0, #3
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #3
	bl ClearWindowTilemap
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r5, #0
	bl sub_081C5B7C
	b _081C5D54
	.align 2, 0
_081C5D28: .4byte 0x03002360
_081C5D2C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C5D54
	movs r0, #5
	bl PlaySE
	movs r0, #3
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #3
	bl ClearWindowTilemap
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, #0
	bl DontTossItem
_081C5D54:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C5CC4

	thumb_func_start TossItem
TossItem: @ 0x081C5D5C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _081C5DC0
	adds r6, r4, r5
	ldr r0, _081C5DC4
	ldrh r0, [r0]
	ldr r1, _081C5DC8
	bl CopyItemName
	ldr r0, _081C5DCC
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r6, _081C5DD0
	ldr r1, _081C5DD4
	adds r0, r6, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0
	movs r3, #2
	bl PrintOnWindow_Font1
	subs r5, #8
	adds r4, r4, r5
	ldr r0, _081C5DD8
	str r0, [r4]
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C5DC0: .4byte 0x03005B68
_081C5DC4: .4byte 0x0203CB48
_081C5DC8: .4byte 0x02021C40
_081C5DCC: .4byte 0x02021C54
_081C5DD0: .4byte 0x02021C7C
_081C5DD4: .4byte 0x085C9532
_081C5DD8: .4byte 0x081C5DDD
	thumb_func_end TossItem

	thumb_func_start sub_081C5DDC
sub_081C5DDC: @ 0x081C5DDC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C5E44
	adds r4, r0, r1
	ldr r6, _081C5E48
	subs r7, r6, #2
	ldr r0, _081C5E4C
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _081C5E3E
	movs r0, #5
	bl PlaySE
	ldr r0, _081C5E50
	ldrh r0, [r0]
	ldrh r1, [r4, #0x10]
	bl RemovePyramidBagItem
	ldrb r0, [r4]
	adds r1, r6, #0
	adds r2, r7, #0
	bl DestroyListMenuTask
	bl sub_081C5120
	bl sub_081C51B8
	bl SetBagItemsListTemplate
	ldr r0, _081C5E54
	ldrh r1, [r6]
	ldrh r2, [r7]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r5, #0
	bl SetTaskToMainPyramidBagInputHandler
_081C5E3E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C5E44: .4byte 0x03005B68
_081C5E48: .4byte 0x0203CC04
_081C5E4C: .4byte 0x03002360
_081C5E50: .4byte 0x0203CB48
_081C5E54: .4byte 0x03006050
	thumb_func_end sub_081C5DDC

	thumb_func_start BagAction_Give
BagAction_Give: @ 0x081C5E58
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	bl sub_081C59D4
	ldr r5, _081C5E80
	ldrh r0, [r5]
	bl ItemIsMail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081C5E8C
	ldr r1, _081C5E84
	ldr r2, _081C5E88
	adds r0, r4, #0
	bl DisplayItemMessageInBattlePyramid
	b _081C5EB6
	.align 2, 0
_081C5E80: .4byte 0x0203CB48
_081C5E84: .4byte 0x085C945C
_081C5E88: .4byte 0x081C5EFD
_081C5E8C:
	ldrh r0, [r5]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C5EB0
	ldr r0, _081C5EA8
	ldr r1, [r0]
	ldr r0, _081C5EAC
	str r0, [r1]
	adds r0, r4, #0
	bl sub_081C5310
	b _081C5EB6
	.align 2, 0
_081C5EA8: .4byte 0x0203CBF8
_081C5EAC: .4byte 0x081B7C01
_081C5EB0:
	adds r0, r6, #0
	bl sub_081C5EBC
_081C5EB6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end BagAction_Give

	thumb_func_start sub_081C5EBC
sub_081C5EBC: @ 0x081C5EBC
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081C5EE8
	ldrh r0, [r0]
	ldr r1, _081C5EEC
	bl CopyItemName
	ldr r5, _081C5EF0
	ldr r1, _081C5EF4
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldr r2, _081C5EF8
	adds r0, r4, #0
	adds r1, r5, #0
	bl DisplayItemMessageInBattlePyramid
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C5EE8: .4byte 0x0203CB48
_081C5EEC: .4byte 0x02021C40
_081C5EF0: .4byte 0x02021C7C
_081C5EF4: .4byte 0x085C948E
_081C5EF8: .4byte 0x081C5EFD
	thumb_func_end sub_081C5EBC

	thumb_func_start sub_081C5EFC
sub_081C5EFC: @ 0x081C5EFC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081C5F20
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C5F1A
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081C5F24
_081C5F1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C5F20: .4byte 0x03002360
	thumb_func_end sub_081C5EFC

	thumb_func_start sub_081C5F24
sub_081C5F24: @ 0x081C5F24
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _081C5F58
	adds r4, r4, r0
	bl sub_081C65DC
	movs r1, #2
	ldrsh r0, [r4, r1]
	bl PrintItemDescription
	ldrb r0, [r4]
	movs r1, #0
	bl sub_081C5294
	adds r0, r5, #0
	bl SetTaskToMainPyramidBagInputHandler
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C5F58: .4byte 0x03005B68
	thumb_func_end sub_081C5F24

	thumb_func_start sub_081C5F5C
sub_081C5F5C: @ 0x081C5F5C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r5, _081C5F80
	ldrh r0, [r5]
	bl itemid_80BF6D8_mail_related
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C5F8C
	ldr r1, _081C5F84
	ldr r2, _081C5F88
	adds r0, r4, #0
	bl DisplayItemMessageInBattlePyramid
	b _081C5FA6
	.align 2, 0
_081C5F80: .4byte 0x0203CB48
_081C5F84: .4byte 0x085C945C
_081C5F88: .4byte 0x081C5EFD
_081C5F8C:
	ldrh r0, [r5]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C5FA0
	adds r0, r4, #0
	bl sub_081C5310
	b _081C5FA6
_081C5FA0:
	adds r0, r6, #0
	bl sub_081C5EBC
_081C5FA6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081C5F5C

	thumb_func_start BagAction_UseInBattle
BagAction_UseInBattle: @ 0x081C5FAC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _081C5FD8
	ldrh r0, [r4]
	bl sub_080D6E44
	cmp r0, #0
	beq _081C5FD0
	bl sub_081C59D4
	ldrh r0, [r4]
	bl sub_080D6E44
	adds r1, r0, #0
	adds r0, r5, #0
	bl _call_via_r1
_081C5FD0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C5FD8: .4byte 0x0203CB48
	thumb_func_end BagAction_UseInBattle

	thumb_func_start Task_BeginItemSwap
Task_BeginItemSwap: @ 0x081C5FDC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081C609C
	mov sb, r0
	adds r1, r4, #0
	add r1, sb
	mov r8, r1
	ldr r0, _081C60A0
	ldrh r1, [r0, #6]
	ldrh r0, [r0, #8]
	adds r1, r1, r0
	mov r2, r8
	strh r1, [r2, #2]
	ldr r0, _081C60A4
	ldr r0, [r0]
	ldr r2, _081C60A8
	adds r0, r0, r2
	movs r5, #0
	strb r1, [r0]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #0x10
	movs r2, #1
	bl ListMenuSetUnkIndicatorsStructField
	ldr r0, _081C60AC
	ldr r3, [r0]
	mov r0, r8
	movs r1, #2
	ldrsh r2, [r0, r1]
	lsls r2, r2, #1
	ldr r1, _081C60B0
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, _081C60B4
	adds r3, r3, r0
	adds r3, r3, r2
	ldrh r0, [r3]
	ldr r1, _081C60B8
	bl CopyItemName
	ldr r6, _081C60BC
	ldr r1, _081C60C0
	adds r0, r6, #0
	bl StringExpandPlaceholders
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0
	movs r3, #2
	bl PrintOnWindow_Font1
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #1
	bl sub_081C5294
	mov r2, r8
	ldrb r0, [r2, #2]
	bl sub_081C680C
	movs r0, #8
	rsbs r0, r0, #0
	add sb, r0
	add r4, sb
	ldr r0, _081C60C4
	str r0, [r4]
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C609C: .4byte 0x03005B68
_081C60A0: .4byte 0x0203CBFC
_081C60A4: .4byte 0x0203CBF8
_081C60A8: .4byte 0x00000814
_081C60AC: .4byte 0x03005AF0
_081C60B0: .4byte 0x00000CA9
_081C60B4: .4byte 0x00000E2C
_081C60B8: .4byte 0x02021C40
_081C60BC: .4byte 0x02021C7C
_081C60C0: .4byte 0x085C947F
_081C60C4: .4byte 0x081C60C9
	thumb_func_end Task_BeginItemSwap

	thumb_func_start Task_ItemSwapHandleInput
Task_ItemSwapHandleInput: @ 0x081C60C8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C6104
	adds r4, r0, r1
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081C6174
	ldr r7, _081C6108
	ldrh r1, [r7, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081C6110
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	ldr r1, _081C610C
	subs r2, r1, #2
	bl ListMenuGetScrollAndRow
	b _081C6158
	.align 2, 0
_081C6104: .4byte 0x03005B68
_081C6108: .4byte 0x03002360
_081C610C: .4byte 0x0203CC04
_081C6110:
	ldrb r0, [r4]
	bl ListMenu_ProcessInput
	adds r6, r0, #0
	ldrb r0, [r4]
	ldr r4, _081C6144
	subs r2, r4, #2
	adds r1, r4, #0
	bl ListMenuGetScrollAndRow
	movs r0, #0
	bl sub_081C67E8
	subs r4, #8
	ldrb r0, [r4, #6]
	bl sub_081C680C
	movs r0, #2
	rsbs r0, r0, #0
	cmp r6, r0
	beq _081C6148
	adds r0, #1
	cmp r6, r0
	bne _081C6168
	b _081C6174
	.align 2, 0
_081C6144: .4byte 0x0203CC04
_081C6148:
	movs r0, #5
	bl PlaySE
	ldrh r1, [r7, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C6160
_081C6158:
	adds r0, r5, #0
	bl PerformItemSwap
	b _081C6174
_081C6160:
	adds r0, r5, #0
	bl sub_081C622C
	b _081C6174
_081C6168:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl PerformItemSwap
_081C6174:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_ItemSwapHandleInput

	thumb_func_start PerformItemSwap
PerformItemSwap: @ 0x081C617C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081C61B8
	adds r5, r0, r1
	ldr r7, _081C61BC
	subs r0, r7, #2
	mov r8, r0
	ldrh r0, [r0]
	ldrh r1, [r7]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #2
	ldrsh r1, [r5, r3]
	cmp r1, r4
	beq _081C61AE
	subs r0, r4, #1
	cmp r1, r0
	bne _081C61C0
_081C61AE:
	adds r0, r6, #0
	bl sub_081C622C
	b _081C6214
	.align 2, 0
_081C61B8: .4byte 0x03005B68
_081C61BC: .4byte 0x0203CC04
_081C61C0:
	ldrb r0, [r5, #2]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl MovePyramidBagItemSlotInList
	ldr r0, _081C6220
	ldr r0, [r0]
	ldr r1, _081C6224
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	movs r0, #1
	bl sub_081C67E8
	ldrb r0, [r5]
	adds r1, r7, #0
	mov r2, r8
	bl DestroyListMenuTask
	movs r3, #2
	ldrsh r0, [r5, r3]
	cmp r0, r4
	bge _081C61F8
	adds r1, r7, #0
	subs r1, #8
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
_081C61F8:
	bl SetBagItemsListTemplate
	ldr r0, _081C6228
	ldrh r1, [r7]
	mov r3, r8
	ldrh r2, [r3]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	adds r0, r6, #0
	bl SetTaskToMainPyramidBagInputHandler
_081C6214:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C6220: .4byte 0x0203CBF8
_081C6224: .4byte 0x00000814
_081C6228: .4byte 0x03006050
	thumb_func_end PerformItemSwap

	thumb_func_start sub_081C622C
sub_081C622C: @ 0x081C622C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081C6298
	adds r4, r0, r1
	ldr r5, _081C629C
	subs r7, r5, #2
	ldr r0, _081C62A0
	ldr r0, [r0]
	ldr r1, _081C62A4
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	movs r0, #1
	bl sub_081C67E8
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r2, r7, #0
	bl DestroyListMenuTask
	movs r0, #2
	ldrsh r2, [r4, r0]
	ldrh r0, [r5]
	ldrh r1, [r7]
	adds r0, r0, r1
	cmp r2, r0
	bge _081C6276
	adds r1, r5, #0
	subs r1, #8
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
_081C6276:
	bl SetBagItemsListTemplate
	ldr r0, _081C62A8
	ldrh r1, [r5]
	ldrh r2, [r7]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	adds r0, r6, #0
	bl SetTaskToMainPyramidBagInputHandler
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C6298: .4byte 0x03005B68
_081C629C: .4byte 0x0203CC04
_081C62A0: .4byte 0x0203CBF8
_081C62A4: .4byte 0x00000814
_081C62A8: .4byte 0x03006050
	thumb_func_end sub_081C622C

	thumb_func_start sub_081C62AC
sub_081C62AC: @ 0x081C62AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _081C6388
	mov sb, r0
	movs r0, #0x14
	bl Alloc
	adds r7, r0, #0
	movs r0, #0xa
	bl Alloc
	adds r5, r0, #0
	ldr r1, _081C638C
	mov r8, r1
	ldr r2, [r1]
	ldr r4, _081C6390
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, _081C6394
	adds r1, r1, r0
	adds r0, r7, #0
	movs r2, #0x14
	bl memcpy
	mov r1, r8
	ldr r2, [r1]
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	ldr r0, _081C6398
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0xa
	bl memcpy
	movs r6, #0
_081C6310:
	movs r0, #0x64
	muls r0, r6, r0
	add r0, sb
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sp
	strh r0, [r1]
	cmp r0, #0
	beq _081C63A0
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C63A0
	mov r1, r8
	ldr r2, [r1]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _081C6394
	adds r0, r0, r1
	adds r1, r7, #0
	movs r2, #0x14
	bl memcpy
	mov r0, r8
	ldr r2, [r0]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _081C6398
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xa
	bl memcpy
	adds r0, r7, #0
	bl Free
	adds r0, r5, #0
	bl Free
	ldr r1, _081C639C
	movs r0, #1
	strh r0, [r1]
	b _081C63DE
	.align 2, 0
_081C6388: .4byte 0x02024190
_081C638C: .4byte 0x03005AF0
_081C6390: .4byte 0x00000CA9
_081C6394: .4byte 0x00000E2C
_081C6398: .4byte 0x00000E54
_081C639C: .4byte 0x02037290
_081C63A0:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _081C6310
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	movs r6, #0
	movs r4, #0x64
_081C63B4:
	adds r0, r6, #0
	muls r0, r4, r0
	add r0, sb
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _081C63B4
	ldr r1, _081C63EC
	movs r0, #0
	strh r0, [r1]
	adds r0, r7, #0
	bl Free
	adds r0, r5, #0
	bl Free
_081C63DE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C63EC: .4byte 0x02037290
	thumb_func_end sub_081C62AC

	thumb_func_start sub_081C63F0
sub_081C63F0: @ 0x081C63F0
	push {r4, lr}
	ldr r0, _081C644C
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
	ldr r0, _081C6450
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r4, #0
_081C641C:
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _081C641C
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C644C: .4byte 0x085EF778
_081C6450: .4byte 0x085D7B04
	thumb_func_end sub_081C63F0

	thumb_func_start PrintOnWindow_Font1
PrintOnWindow_Font1: @ 0x081C6454
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x14
	ldr r4, [sp, #0x28]
	ldr r6, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	mov r8, r5
	ldr r5, [sp, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
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
	ldr r5, _081C64A8
	adds r4, r4, r5
	str r4, [sp, #8]
	mov r4, r8
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #1
	bl AddTextPrinterParameterized4
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C64A8: .4byte 0x085EF76C
	thumb_func_end PrintOnWindow_Font1

	thumb_func_start sub_081C64AC
sub_081C64AC: @ 0x081C64AC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C64AC

	thumb_func_start sub_081C64C8
sub_081C64C8: @ 0x081C64C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C64DC
	ldr r1, [r1]
	ldr r2, _081C64E0
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_081C64DC: .4byte 0x0203CBF8
_081C64E0: .4byte 0x0000080F
	thumb_func_end sub_081C64C8

	thumb_func_start sub_081C64E4
sub_081C64E4: @ 0x081C64E4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081C6520
	ldr r3, _081C6524
	adds r1, r2, r3
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _081C6518
	lsls r0, r2, #3
	ldr r1, _081C6528
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
_081C6518:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081C6520: .4byte 0x0203CBF8
_081C6524: .4byte 0x0000080F
_081C6528: .4byte 0x085EF7A0
	thumb_func_end sub_081C64E4

	thumb_func_start sub_081C652C
sub_081C652C: @ 0x081C652C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C6564
	ldr r2, _081C6568
	adds r0, r0, r2
	ldr r1, [r1]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _081C655E
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
_081C655E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C6564: .4byte 0x0203CBF8
_081C6568: .4byte 0x0000080F
	thumb_func_end sub_081C652C

	thumb_func_start sub_081C656C
sub_081C656C: @ 0x081C656C
	push {lr}
	sub sp, #0x10
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081C6594
	movs r2, #2
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0xe
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	movs r2, #1
	movs r3, #0
	bl CreateYesNoMenuWithCallbacks
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_081C6594: .4byte 0x085EF7C0
	thumb_func_end sub_081C656C

	thumb_func_start DisplayItemMessageInBattlePyramid
DisplayItemMessageInBattlePyramid: @ 0x081C6598
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	movs r1, #0x11
	bl FillWindowPixelBuffer
	bl GetPlayerTextSpeedDelay
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	str r6, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0xa
	movs r3, #0xd
	bl DisplayMessageAndContinueTask
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DisplayItemMessageInBattlePyramid

	thumb_func_start sub_081C65DC
sub_081C65DC: @ 0x081C65DC
	push {lr}
	movs r0, #2
	movs r1, #0
	bl ClearDialogWindowAndFrameToTransparent
	movs r0, #2
	bl ClearWindowTilemap
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C65DC

	thumb_func_start sub_081C65F8
sub_081C65F8: @ 0x081C65F8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081C6648
	ldr r2, _081C664C
	adds r1, r4, r2
	ldr r0, [r0]
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _081C6640
	ldr r0, _081C6650
	adds r4, r4, r0
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _081C6654
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	movs r0, #0xff
	strb r0, [r5]
_081C6640:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C6648: .4byte 0x0203CBF8
_081C664C: .4byte 0x00000804
_081C6650: .4byte 0x00001024
_081C6654: .4byte 0x020205AC
	thumb_func_end sub_081C65F8

	thumb_func_start sub_081C6658
sub_081C6658: @ 0x081C6658
	push {r4, lr}
	sub sp, #8
	movs r0, #0x40
	bl Alloc
	adds r4, r0, #0
	ldr r0, _081C66A0
	adds r1, r4, #0
	bl LZDecompressVram
	ldr r0, _081C66A4
	ldr r0, [r0]
	ldr r1, _081C66A8
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x19
	adds r0, r4, r0
	str r0, [sp]
	ldr r1, _081C66AC
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r1, _081C66B0
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpritePalette
	adds r0, r4, #0
	bl Free
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C66A0: .4byte 0x08D9AFC8
_081C66A4: .4byte 0x03005AF0
_081C66A8: .4byte 0x00000CA9
_081C66AC: .4byte 0xFFFF0000
_081C66B0: .4byte 0x00001024
	thumb_func_end sub_081C6658

	thumb_func_start sub_081C66B4
sub_081C66B4: @ 0x081C66B4
	push {r4, lr}
	ldr r0, _081C66D4
	ldr r4, [r0]
	ldr r0, _081C66D8
	adds r4, r4, r0
	ldr r0, _081C66DC
	movs r1, #0x44
	movs r2, #0x38
	movs r3, #0
	bl CreateSprite
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C66D4: .4byte 0x0203CBF8
_081C66D8: .4byte 0x00000804
_081C66DC: .4byte 0x085EF824
	thumb_func_end sub_081C66B4

	thumb_func_start sub_081C66E0
sub_081C66E0: @ 0x081C66E0
	push {r4, lr}
	ldr r0, _081C6718
	ldr r0, [r0]
	ldr r1, _081C671C
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081C6720
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081C6710
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r0, _081C6724
	str r0, [r4, #0x1c]
_081C6710:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C6718: .4byte 0x0203CBF8
_081C671C: .4byte 0x00000804
_081C6720: .4byte 0x020205AC
_081C6724: .4byte 0x081C6729
	thumb_func_end sub_081C66E0

	thumb_func_start sub_081C6728
sub_081C6728: @ 0x081C6728
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081C6744
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	ldr r0, _081C674C
	str r0, [r4, #0x1c]
_081C6744:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C674C: .4byte 0x08007141
	thumb_func_end sub_081C6728

	thumb_func_start ShowItemImage
ShowItemImage: @ 0x081C6750
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _081C67A8
	ldr r2, _081C67AC
	adds r1, r4, r2
	ldr r0, [r0]
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _081C67A0
	ldr r0, _081C67B0
	adds r4, r4, r0
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl AddItemIconSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _081C67A0
	strb r2, [r5]
	ldr r1, _081C67B4
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0, #0x24]
	movs r1, #0x58
	strh r1, [r0, #0x26]
_081C67A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C67A8: .4byte 0x0203CBF8
_081C67AC: .4byte 0x00000805
_081C67B0: .4byte 0x00001025
_081C67B4: .4byte 0x020205AC
	thumb_func_end ShowItemImage

	thumb_func_start sub_081C67B8
sub_081C67B8: @ 0x081C67B8
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	bl sub_081C65F8
	pop {r0}
	bx r0
	thumb_func_end sub_081C67B8

	thumb_func_start sub_081C67CC
sub_081C67CC: @ 0x081C67CC
	push {lr}
	ldr r0, _081C67E0
	ldr r0, [r0]
	ldr r1, _081C67E4
	adds r0, r0, r1
	movs r1, #8
	bl sub_08122350
	pop {r0}
	bx r0
	.align 2, 0
_081C67E0: .4byte 0x0203CBF8
_081C67E4: .4byte 0x00000807
	thumb_func_end sub_081C67CC

	thumb_func_start sub_081C67E8
sub_081C67E8: @ 0x081C67E8
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _081C6804
	ldr r0, [r0]
	ldr r1, _081C6808
	adds r0, r0, r1
	movs r1, #8
	bl sub_08122408
	pop {r0}
	bx r0
	.align 2, 0
_081C6804: .4byte 0x0203CBF8
_081C6808: .4byte 0x00000807
	thumb_func_end sub_081C67E8

	thumb_func_start sub_081C680C
sub_081C680C: @ 0x081C680C
	push {lr}
	adds r3, r0, #0
	lsls r3, r3, #0x18
	ldr r0, _081C6830
	ldr r0, [r0]
	ldr r1, _081C6834
	adds r0, r0, r1
	lsrs r3, r3, #4
	movs r1, #0x80
	lsls r1, r1, #0xd
	adds r3, r3, r1
	lsrs r3, r3, #0x10
	movs r1, #0x88
	movs r2, #0x78
	bl sub_08122454
	pop {r0}
	bx r0
	.align 2, 0
_081C6830: .4byte 0x0203CBF8
_081C6834: .4byte 0x00000807
	thumb_func_end sub_081C680C

