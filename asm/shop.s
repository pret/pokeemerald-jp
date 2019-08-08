.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CB2_BuyMenu
CB2_BuyMenu: @ 0x080DEFF0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ScriptContext2_Enable
	ldr r5, _080DF018
	strb r4, [r5, #0xf]
	cmp r4, #0
	bne _080DF024
	ldr r0, _080DF01C
	bl AddWindow
	strb r0, [r5, #0xe]
	ldr r0, _080DF020
	str r0, [r5, #4]
	movs r6, #3
	b _080DF032
	.align 2, 0
_080DF018: .4byte 0x02039C00
_080DF01C: .4byte 0x085629BC
_080DF020: .4byte 0x08562994
_080DF024:
	ldr r0, _080DF088
	bl AddWindow
	strb r0, [r5, #0xe]
	ldr r0, _080DF08C
	str r0, [r5, #4]
	movs r6, #2
_080DF032:
	ldr r4, _080DF090
	ldrb r0, [r4, #0xe]
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldrb r0, [r4, #0xe]
	movs r5, #0x10
	str r5, [sp]
	str r6, [sp, #4]
	ldr r1, [r4, #4]
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #8
	movs r3, #2
	bl PrintTextArray
	ldrb r0, [r4, #0xe]
	str r5, [sp]
	str r6, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	ldrb r0, [r4, #0xe]
	bl PutWindowTilemap
	ldrb r0, [r4, #0xe]
	movs r1, #1
	bl CopyWindowToVram
	ldr r0, _080DF094
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080DF088: .4byte 0x085629C4
_080DF08C: .4byte 0x085629AC
_080DF090: .4byte 0x02039C00
_080DF094: .4byte 0x080DF0D5
	thumb_func_end CB2_BuyMenu

	thumb_func_start SetShopMenuCallback
SetShopMenuCallback: @ 0x080DF098
	ldr r1, _080DF0A0
	str r0, [r1]
	bx lr
	.align 2, 0
_080DF0A0: .4byte 0x02039C00
	thumb_func_end SetShopMenuCallback

	thumb_func_start SetShopItemsForSale
SetShopItemsForSale: @ 0x080DF0A4
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	ldr r3, _080DF0D0
	str r1, [r3, #8]
	strh r2, [r3, #0xc]
	ldrh r0, [r1]
	cmp r0, #0
	beq _080DF0CC
_080DF0B6:
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080DF0B6
_080DF0CC:
	pop {r0}
	bx r0
	.align 2, 0
_080DF0D0: .4byte 0x02039C00
	thumb_func_end SetShopItemsForSale

	thumb_func_start Task_ShopMenu
Task_ShopMenu: @ 0x080DF0D4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl Menu_ProcessInputNoWrap
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080DF110
	adds r0, #1
	cmp r2, r0
	bne _080DF100
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl Task_HandleShopMenuQuit
	b _080DF110
_080DF100:
	ldr r0, _080DF118
	ldr r1, [r0, #4]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl _call_via_r1
_080DF110:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF118: .4byte 0x02039C00
	thumb_func_end Task_ShopMenu

	thumb_func_start Task_HandleShopMenuBuy
Task_HandleShopMenuBuy: @ 0x080DF11C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r2, _080DF14C
	adds r4, r1, r2
	ldr r3, _080DF150
	lsrs r0, r3, #0x10
	strh r0, [r4, #0x10]
	strh r3, [r4, #0x12]
	subs r2, #8
	adds r1, r1, r2
	ldr r0, _080DF154
	str r0, [r1]
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF14C: .4byte 0x03005B68
_080DF150: .4byte 0x080DF2E1
_080DF154: .4byte 0x080DF1F1
	thumb_func_end Task_HandleShopMenuBuy

	thumb_func_start Task_HandleShopMenuSell
Task_HandleShopMenuSell: @ 0x080DF158
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r2, _080DF188
	adds r4, r1, r2
	ldr r3, _080DF18C
	lsrs r0, r3, #0x10
	strh r0, [r4, #0x10]
	strh r3, [r4, #0x12]
	subs r2, #8
	adds r1, r1, r2
	ldr r0, _080DF190
	str r0, [r1]
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF188: .4byte 0x03005B68
_080DF18C: .4byte 0x081AA979
_080DF190: .4byte 0x080DF1F1
	thumb_func_end Task_HandleShopMenuSell

	thumb_func_start CB2_ExitSellMenu
CB2_ExitSellMenu: @ 0x080DF194
	push {lr}
	ldr r0, _080DF1A8
	ldr r1, _080DF1AC
	str r1, [r0]
	ldr r0, _080DF1B0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080DF1A8: .4byte 0x03005B0C
_080DF1AC: .4byte 0x080DF22D
_080DF1B0: .4byte 0x08085A31
	thumb_func_end CB2_ExitSellMenu

	thumb_func_start Task_HandleShopMenuQuit
Task_HandleShopMenuQuit: @ 0x080DF1B4
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080DF1EC
	ldrb r0, [r5, #0xe]
	movs r1, #2
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r5, #0xe]
	bl RemoveWindow
	bl SaveRecordedItemPurchasesForTVShow
	bl ScriptContext2_Disable
	adds r0, r4, #0
	bl DestroyTask
	ldr r5, [r5]
	cmp r5, #0
	beq _080DF1E4
	bl _call_via_r5
_080DF1E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF1EC: .4byte 0x02039C00
	thumb_func_end Task_HandleShopMenuQuit

	thumb_func_start Task_GoToBuyOrSellMenu
Task_GoToBuyOrSellMenu: @ 0x080DF1F0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080DF224
	adds r4, r0, r1
	ldr r0, _080DF228
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080DF21E
	adds r0, r2, #0
	bl DestroyTask
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0x12]
	orrs r0, r1
	bl SetMainCallback2
_080DF21E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF224: .4byte 0x03005B68
_080DF228: .4byte 0x02037C74
	thumb_func_end Task_GoToBuyOrSellMenu

	thumb_func_start MapPostLoadHook_ReturnToShopMenu
MapPostLoadHook_ReturnToShopMenu: @ 0x080DF22C
	push {lr}
	bl pal_fill_black
	ldr r0, _080DF240
	movs r1, #8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080DF240: .4byte 0x080DF245
	thumb_func_end MapPostLoadHook_ReturnToShopMenu

	thumb_func_start Task_ReturnToShopMenu
Task_ReturnToShopMenu: @ 0x080DF244
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080DF282
	ldr r0, _080DF26C
	ldrb r0, [r0, #0xf]
	cmp r0, #2
	bne _080DF278
	ldr r1, _080DF270
	ldr r2, _080DF274
	adds r0, r4, #0
	bl DisplayItemMessageOnField
	b _080DF282
	.align 2, 0
_080DF26C: .4byte 0x02039C00
_080DF270: .4byte 0x085C9A15
_080DF274: .4byte 0x080DF291
_080DF278:
	ldr r1, _080DF288
	ldr r2, _080DF28C
	adds r0, r5, #0
	bl DisplayItemMessageOnField
_080DF282:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF288: .4byte 0x085C99F5
_080DF28C: .4byte 0x080DF291
	thumb_func_end Task_ReturnToShopMenu

	thumb_func_start ShowShopMenuAfterExitingBuyOrSellMenu
ShowShopMenuAfterExitingBuyOrSellMenu: @ 0x080DF290
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080DF2AC
	ldrb r0, [r0, #0xf]
	bl CB2_BuyMenu
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF2AC: .4byte 0x02039C00
	thumb_func_end ShowShopMenuAfterExitingBuyOrSellMenu

	thumb_func_start BuyMenuPrintPriceInList
BuyMenuPrintPriceInList: @ 0x080DF2B0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BuyMenuPrintPriceInList

	thumb_func_start VBlankCB_BuyMenu
VBlankCB_BuyMenu: @ 0x080DF2CC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_BuyMenu

	thumb_func_start CB2_InitBuyMenu
CB2_InitBuyMenu: @ 0x080DF2E0
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _080DF354
	movs r1, #0x87
	lsls r1, r1, #3
	adds r5, r0, r1
	ldrb r4, [r5]
	cmp r4, #0
	beq _080DF36C
	cmp r4, #1
	bne _080DF2F8
	b _080DF430
_080DF2F8:
	bl BuyMenuDrawGraphics
	bl BuyMenuAddScrollIndicatorArrows
	ldr r0, _080DF358
	movs r1, #8
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080DF35C
	movs r1, #0
	movs r2, #0
	bl ListMenuInit
	ldr r2, _080DF360
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r1, #0x16]
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080DF364
	bl SetVBlankCallback
	ldr r0, _080DF368
	bl SetMainCallback2
	b _080DF440
	.align 2, 0
_080DF354: .4byte 0x03002360
_080DF358: .4byte 0x080E000D
_080DF35C: .4byte 0x03006050
_080DF360: .4byte 0x03005B60
_080DF364: .4byte 0x080DF2CD
_080DF368: .4byte 0x080DF2B1
_080DF36C:
	bl SetVBlankHBlankCallbacksToNull
	str r4, [sp, #8]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ldr r2, _080DF418
	add r0, sp, #8
	bl CpuFastSet
	bl ScanlineEffect_Stop
	bl reset_temp_tile_data_buffers
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl clear_scheduled_bg_copies_to_vram
	ldr r4, _080DF41C
	ldr r0, _080DF420
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _080DF424
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _080DF428
	adds r0, r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _080DF42C
	adds r0, r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	bl BuyMenuBuildListMenuTemplate
	bl BuyMenuInitBgs
	movs r4, #0x20
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	bl BuyMenuInitWindows
	bl BuyMenuDecompressBgGraphics
	b _080DF43A
	.align 2, 0
_080DF418: .4byte 0x01000100
_080DF41C: .4byte 0x02039C10
_080DF420: .4byte 0x000020B0
_080DF424: .4byte 0x0000200B
_080DF428: .4byte 0x0000200D
_080DF42C: .4byte 0x0000200E
_080DF430:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080DF440
_080DF43A:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080DF440:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end CB2_InitBuyMenu

	thumb_func_start BuyMenuFreeMemory
BuyMenuFreeMemory: @ 0x080DF448
	push {lr}
	ldr r0, _080DF46C
	ldr r0, [r0]
	bl Free
	ldr r0, _080DF470
	ldr r0, [r0]
	bl Free
	ldr r0, _080DF474
	ldr r0, [r0]
	bl Free
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
_080DF46C: .4byte 0x02039C10
_080DF470: .4byte 0x02039C14
_080DF474: .4byte 0x02039C18
	thumb_func_end BuyMenuFreeMemory

	thumb_func_start BuyMenuBuildListMenuTemplate
BuyMenuBuildListMenuTemplate: @ 0x080DF478
	push {r4, r5, r6, r7, lr}
	ldr r7, _080DF518
	ldr r4, _080DF51C
	ldrh r0, [r4, #0xc]
	adds r0, #1
	lsls r0, r0, #3
	bl Alloc
	str r0, [r7]
	ldr r5, _080DF520
	ldrh r0, [r4, #0xc]
	adds r0, #1
	movs r1, #0xb
	muls r0, r1, r0
	bl Alloc
	str r0, [r5]
	movs r6, #0
	ldrh r0, [r4, #0xc]
	cmp r6, r0
	bhs _080DF4CA
_080DF4A2:
	lsls r1, r6, #3
	ldr r0, [r7]
	adds r0, r0, r1
	ldr r2, [r4, #8]
	lsls r1, r6, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #0xb
	adds r3, r6, #0
	muls r3, r2, r3
	ldr r2, [r5]
	adds r2, r2, r3
	bl BuyMenuSetListEntry
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r2, [r4, #0xc]
	cmp r6, r2
	blo _080DF4A2
_080DF4CA:
	ldr r5, _080DF520
	movs r0, #0xb
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _080DF524
	bl StringCopy
	ldr r2, _080DF518
	ldr r0, [r2]
	lsls r1, r6, #3
	adds r1, r1, r0
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r1, #4]
	ldr r3, _080DF528
	adds r1, r3, #0
	ldr r0, _080DF52C
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldr r0, [r2]
	str r0, [r3]
	ldr r0, _080DF51C
	ldrh r0, [r0, #0xc]
	adds r1, r0, #1
	strh r1, [r3, #0xc]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _080DF530
	movs r0, #8
	strh r0, [r3, #0xe]
	b _080DF532
	.align 2, 0
_080DF518: .4byte 0x02039C14
_080DF51C: .4byte 0x02039C00
_080DF520: .4byte 0x02039C18
_080DF524: .4byte 0x085C93C8
_080DF528: .4byte 0x03006050
_080DF52C: .4byte 0x085629CC
_080DF530:
	strh r1, [r3, #0xe]
_080DF532:
	ldr r0, _080DF548
	ldr r0, [r0]
	ldr r1, _080DF54C
	ldrh r1, [r1, #0xe]
	ldr r2, _080DF550
	adds r0, r0, r2
	strh r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF548: .4byte 0x02039C10
_080DF54C: .4byte 0x03006050
_080DF550: .4byte 0x00002004
	thumb_func_end BuyMenuBuildListMenuTemplate

	thumb_func_start BuyMenuSetListEntry
BuyMenuSetListEntry: @ 0x080DF554
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r2, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _080DF570
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _080DF574
	adds r0, r4, #0
	adds r1, r5, #0
	bl CopyItemName
	b _080DF584
	.align 2, 0
_080DF570: .4byte 0x02039C00
_080DF574:
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	ldr r0, _080DF590
	adds r1, r1, r0
	adds r0, r5, #0
	bl StringCopy
_080DF584:
	str r5, [r6]
	str r4, [r6, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DF590: .4byte 0x08580CD1
	thumb_func_end BuyMenuSetListEntry

	thumb_func_start BuyMenuPrintItemDescriptionAndShowItemIcon
BuyMenuPrintItemDescriptionAndShowItemIcon: @ 0x080DF594
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _080DF5AC
	movs r0, #5
	bl PlaySE
_080DF5AC:
	movs r0, #2
	rsbs r0, r0, #0
	cmp r7, r0
	beq _080DF5D0
	lsls r4, r7, #0x10
	lsrs r0, r4, #0x10
	ldr r1, _080DF5C8
	ldr r1, [r1]
	ldr r2, _080DF5CC
	adds r1, r1, r2
	ldrb r1, [r1]
	bl BuyMenuAddItemIcon
	b _080DF5E2
	.align 2, 0
_080DF5C8: .4byte 0x02039C10
_080DF5CC: .4byte 0x0000200C
_080DF5D0:
	ldr r0, _080DF620
	ldr r1, _080DF624
	ldr r1, [r1]
	ldr r2, _080DF628
	adds r1, r1, r2
	ldrb r1, [r1]
	bl BuyMenuAddItemIcon
	lsls r4, r7, #0x10
_080DF5E2:
	lsrs r4, r4, #0x10
	mov r8, r4
	ldr r6, _080DF624
	ldr r0, [r6]
	ldr r5, _080DF628
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r4, #1
	adds r1, r4, #0
	eors r1, r0
	mov r0, r8
	bl BuyMenuRemoveItemIcon
	ldr r1, [r6]
	adds r1, r1, r5
	ldrb r0, [r1]
	eors r0, r4
	strb r0, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r7, r0
	beq _080DF644
	ldr r0, _080DF62C
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _080DF630
	mov r0, r8
	bl ItemId_GetHoldEffect
	adds r4, r0, #0
	b _080DF646
	.align 2, 0
_080DF620: .4byte 0x0000FFFF
_080DF624: .4byte 0x02039C10
_080DF628: .4byte 0x0000200C
_080DF62C: .4byte 0x02039C00
_080DF630:
	ldr r1, _080DF640
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r4, [r0]
	b _080DF646
	.align 2, 0
_080DF640: .4byte 0x08580CD0
_080DF644:
	ldr r4, _080DF66C
_080DF646:
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl BuyMenuPrint
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF66C: .4byte 0x085C98E0
	thumb_func_end BuyMenuPrintItemDescriptionAndShowItemIcon

	thumb_func_start CreateShopMenu
CreateShopMenu: @ 0x080DF670
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080DF6F4
	ldr r0, _080DF6B8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _080DF6C0
	ldr r5, _080DF6BC
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	bl sub_080D6CD4
	adds r4, r0, #0
	movs r0, #1
	bl GetPriceReduction
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	asrs r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #5
	bl ConvertIntToDecimalStringN
	b _080DF6D6
	.align 2, 0
_080DF6B8: .4byte 0x02039C00
_080DF6BC: .4byte 0x02021C40
_080DF6C0:
	ldr r0, _080DF6FC
	ldr r2, _080DF700
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r1, [r1, #0x10]
	movs r2, #1
	movs r3, #5
	bl ConvertIntToDecimalStringN
_080DF6D6:
	ldr r4, _080DF704
	ldr r1, _080DF708
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0xff
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x48
	adds r3, r7, #0
	bl BuyMenuPrint
_080DF6F4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF6FC: .4byte 0x02021C40
_080DF700: .4byte 0x08580CD0
_080DF704: .4byte 0x02021C7C
_080DF708: .4byte 0x085C9A9D
	thumb_func_end CreateShopMenu

	thumb_func_start BuyMenuAddScrollIndicatorArrows
BuyMenuAddScrollIndicatorArrows: @ 0x080DF70C
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r5, _080DF754
	ldr r2, [r5]
	ldr r4, _080DF758
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080DF74A
	ldr r0, _080DF75C
	ldrh r1, [r0, #0xc]
	adds r0, r1, #1
	cmp r0, #8
	ble _080DF74A
	subs r0, r1, #7
	str r0, [sp]
	ldr r0, _080DF760
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r1, _080DF764
	adds r0, r2, r1
	str r0, [sp, #0xc]
	movs r0, #2
	movs r1, #0xac
	movs r2, #0xc
	movs r3, #0x94
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r5]
	adds r1, r1, r4
	strb r0, [r1]
_080DF74A:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF754: .4byte 0x02039C10
_080DF758: .4byte 0x0000200B
_080DF75C: .4byte 0x02039C00
_080DF760: .4byte 0x00000834
_080DF764: .4byte 0x00002008
	thumb_func_end BuyMenuAddScrollIndicatorArrows

	thumb_func_start BuyMenuRemoveScrollIndicatorArrows
BuyMenuRemoveScrollIndicatorArrows: @ 0x080DF768
	push {r4, lr}
	ldr r4, _080DF78C
	ldr r0, [r4]
	ldr r2, _080DF790
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080DF786
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r1, _080DF790
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
_080DF786:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF78C: .4byte 0x02039C10
_080DF790: .4byte 0x0000200B
	thumb_func_end BuyMenuRemoveScrollIndicatorArrows

	thumb_func_start BuyMenuPrintCursor
BuyMenuPrintCursor: @ 0x080DF794
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ListMenuGetYCoordForPrintingArrowCursor
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, _080DF7C4
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r2, #0
	bl BuyMenuPrint
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF7C4: .4byte 0x085C9421
	thumb_func_end BuyMenuPrintCursor

	thumb_func_start BuyMenuAddItemIcon
BuyMenuAddItemIcon: @ 0x080DF7C8
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r0, _080DF81C
	ldr r4, _080DF820
	adds r1, r3, r4
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _080DF854
	ldr r0, _080DF824
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	beq _080DF7F2
	ldr r0, _080DF828
	cmp r2, r0
	bne _080DF834
_080DF7F2:
	ldr r0, _080DF82C
	adds r1, r3, r0
	adds r0, r1, #0
	bl AddItemIconSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _080DF854
	strb r2, [r4]
	ldr r1, _080DF830
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0, #0x24]
	movs r1, #0x58
	strh r1, [r0, #0x26]
	b _080DF854
	.align 2, 0
_080DF81C: .4byte 0x02039C10
_080DF820: .4byte 0x0000200D
_080DF824: .4byte 0x02039C00
_080DF828: .4byte 0x0000FFFF
_080DF82C: .4byte 0x0000083E
_080DF830: .4byte 0x020205AC
_080DF834:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DF85C
	adds r1, r3, r2
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #0x14
	movs r2, #0x54
	movs r3, #1
	bl AddDecorationIconObject
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _080DF854
	strb r2, [r4]
_080DF854:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF85C: .4byte 0x0000083E
	thumb_func_end BuyMenuAddItemIcon

	thumb_func_start BuyMenuRemoveItemIcon
BuyMenuRemoveItemIcon: @ 0x080DF860
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _080DF8A0
	ldr r2, _080DF8A4
	adds r1, r4, r2
	ldr r0, [r0]
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _080DF89A
	ldr r0, _080DF8A8
	adds r4, r4, r0
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080DF8AC
	adds r0, r0, r1
	bl DestroySprite
	movs r0, #0xff
	strb r0, [r5]
_080DF89A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF8A0: .4byte 0x02039C10
_080DF8A4: .4byte 0x0000200D
_080DF8A8: .4byte 0x0000083E
_080DF8AC: .4byte 0x020205AC
	thumb_func_end BuyMenuRemoveItemIcon

	thumb_func_start BuyMenuInitBgs
BuyMenuInitBgs: @ 0x080DF8B0
	push {r4, lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080DF960
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r4, _080DF964
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r0, #3
	bl SetBgTilemapBuffer
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
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
	movs r0, #3
	bl ShowBg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF960: .4byte 0x085629E4
_080DF964: .4byte 0x02039C10
	thumb_func_end BuyMenuInitBgs

	thumb_func_start BuyMenuDecompressBgGraphics
BuyMenuDecompressBgGraphics: @ 0x080DF968
	push {lr}
	sub sp, #4
	ldr r1, _080DF998
	movs r2, #0xe8
	lsls r2, r2, #2
	ldr r3, _080DF99C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _080DF9A0
	ldr r1, _080DF9A4
	ldr r1, [r1]
	bl LZDecompressVram
	ldr r0, _080DF9A8
	movs r1, #0xc0
	movs r2, #0x20
	bl LoadCompressedPalette
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080DF998: .4byte 0x08D9B1B4
_080DF99C: .4byte 0x000003E3
_080DF9A0: .4byte 0x08D9B2E8
_080DF9A4: .4byte 0x02039C10
_080DF9A8: .4byte 0x08D9B2C0
	thumb_func_end BuyMenuDecompressBgGraphics

	thumb_func_start BuyMenuInitWindows
BuyMenuInitWindows: @ 0x080DF9AC
	push {lr}
	ldr r0, _080DF9E4
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	movs r1, #1
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	movs r0, #0
	movs r1, #0xa
	movs r2, #0xe0
	bl LoadMessageBoxGfx
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #2
	bl PutWindowTilemap
	pop {r0}
	bx r0
	.align 2, 0
_080DF9E4: .4byte 0x085629F4
	thumb_func_end BuyMenuInitWindows

	thumb_func_start BuyMenuPrint
BuyMenuPrint: @ 0x080DF9E8
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
	ldr r5, _080DFA28
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
_080DFA28: .4byte 0x08562A34
	thumb_func_end BuyMenuPrint

	thumb_func_start BuyMenuDisplayMessage
BuyMenuDisplayMessage: @ 0x080DFA2C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetPlayerTextSpeedDelay
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	str r6, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0xa
	movs r3, #0xe
	bl DisplayMessageAndContinueTask
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BuyMenuDisplayMessage

	thumb_func_start BuyMenuDrawGraphics
BuyMenuDrawGraphics: @ 0x080DFA68
	push {lr}
	bl BuyMenuDrawMapGraphics
	bl BuyMenuCopyMenuBgToBg1TilemapBuffer
	movs r0, #0x13
	movs r1, #0xb
	bl AddMoneyLabelObject
	ldr r0, _080DFAB0
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	bl GetMoney
	adds r3, r0, #0
	movs r0, #0
	movs r1, #1
	movs r2, #0xd
	bl PrintMoneyAmount
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
	pop {r0}
	bx r0
	.align 2, 0
_080DFAB0: .4byte 0x03005AEC
	thumb_func_end BuyMenuDrawGraphics

	thumb_func_start BuyMenuDrawMapGraphics
BuyMenuDrawMapGraphics: @ 0x080DFAB4
	push {lr}
	bl BuyMenuCollectEventObjectData
	bl BuyMenuDrawEventObjects
	bl BuyMenuDrawMapBg
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BuyMenuDrawMapGraphics

	thumb_func_start BuyMenuDrawMapBg
BuyMenuDrawMapBg: @ 0x080DFAC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080DFB48
	ldr r0, [r0]
	mov sb, r0
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	subs r0, #4
	strh r0, [r1]
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	movs r1, #0
	mov sl, r4
_080DFAFA:
	movs r4, #0
	lsls r7, r1, #0x10
	asrs r0, r7, #0x10
	mov r8, r0
_080DFB02:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r4, r4, #0x10
	asrs r5, r4, #0x10
	adds r0, r0, r5
	mov r2, sl
	movs r3, #0
	ldrsh r1, [r2, r3]
	add r1, r8
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	mov r1, r8
	bl BuyMenuCheckForOverlapWithMenuBg
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080DFB4C
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r0, r5
	mov r2, sl
	movs r3, #0
	ldrsh r1, [r2, r3]
	add r1, r8
	bl MapGridGetMetatileLayerTypeAt
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080DFB4E
	.align 2, 0
_080DFB48: .4byte 0x02036FB8
_080DFB4C:
	movs r5, #1
_080DFB4E:
	ldr r0, _080DFB6C
	cmp r6, r0
	bhi _080DFB70
	asrs r0, r4, #0x10
	mov r2, sb
	ldr r1, [r2, #0x10]
	lsls r3, r6, #4
	ldr r2, [r1, #0xc]
	adds r2, r2, r3
	asrs r1, r7, #0x10
	adds r3, r5, #0
	bl BuyMenuDrawMapMetatile
	b _080DFB88
	.align 2, 0
_080DFB6C: .4byte 0x000001FF
_080DFB70:
	asrs r0, r4, #0x10
	mov r3, sb
	ldr r2, [r3, #0x14]
	ldr r3, _080DFBB0
	adds r1, r6, r3
	lsls r1, r1, #4
	ldr r2, [r2, #0xc]
	adds r2, r2, r1
	asrs r1, r7, #0x10
	adds r3, r5, #0
	bl BuyMenuDrawMapMetatile
_080DFB88:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xe
	ble _080DFB02
	adds r0, r7, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _080DFAFA
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DFBB0: .4byte 0xFFFFFE00
	thumb_func_end BuyMenuDrawMapBg

	thumb_func_start BuyMenuDrawMapMetatile
BuyMenuDrawMapMetatile: @ 0x080DFBB4
	push {r4, r5, r6, r7, lr}
	adds r7, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r2, r3, #0
	lsls r0, r0, #0x11
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x10
	cmp r3, #1
	beq _080DFC04
	cmp r3, #1
	bgt _080DFBD4
	cmp r3, #0
	beq _080DFBDA
	b _080DFC6C
_080DFBD4:
	cmp r2, #2
	beq _080DFC3C
	b _080DFC6C
_080DFBDA:
	ldr r6, _080DFC00
	ldr r0, [r6]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r0, r2
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl BuyMenuDrawMapMetatileLayer
	ldr r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #4
	b _080DFC26
	.align 2, 0
_080DFC00: .4byte 0x02039C10
_080DFC04:
	ldr r6, _080DFC38
	ldr r0, [r6]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r0, r2
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl BuyMenuDrawMapMetatileLayer
	ldr r0, [r6]
	movs r1, #0xc0
	lsls r1, r1, #5
_080DFC26:
	adds r0, r0, r1
	adds r3, r7, #0
	adds r3, #8
	adds r1, r5, #0
	adds r2, r4, #0
	bl BuyMenuDrawMapMetatileLayer
	b _080DFC6C
	.align 2, 0
_080DFC38: .4byte 0x02039C10
_080DFC3C:
	ldr r6, _080DFC74
	ldr r0, [r6]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r0, r2
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl BuyMenuDrawMapMetatileLayer
	ldr r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r3, r7, #0
	adds r3, #8
	adds r1, r5, #0
	adds r2, r4, #0
	bl BuyMenuDrawMapMetatileLayer
_080DFC6C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DFC74: .4byte 0x02039C10
	thumb_func_end BuyMenuDrawMapMetatile

	thumb_func_start BuyMenuDrawMapMetatileLayer
BuyMenuDrawMapMetatileLayer: @ 0x080DFC78
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, #2]
	strh r0, [r1, #2]
	adds r2, r1, #0
	adds r2, #0x40
	ldrh r0, [r3, #4]
	strh r0, [r2]
	adds r1, #0x42
	ldrh r0, [r3, #6]
	strh r0, [r1]
	bx lr
	.align 2, 0
	thumb_func_end BuyMenuDrawMapMetatileLayer

	thumb_func_start BuyMenuCollectEventObjectData
BuyMenuCollectEventObjectData: @ 0x080DFCA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r0, #0
	mov r8, r0
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r7, #0
	ldr r5, _080DFD94
	ldr r3, _080DFD98
	movs r2, #0x10
_080DFCC4:
	ldr r1, [r5]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r1, r1, r3
	adds r1, r1, r0
	strh r2, [r1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bls _080DFCC4
	movs r7, #0
	str r4, [sp, #8]
	ldr r1, _080DFD94
	mov sb, r1
	mov r2, sp
	str r2, [sp, #4]
_080DFCE8:
	movs r3, #0
	adds r4, r7, #1
	str r4, [sp, #0xc]
_080DFCEE:
	ldr r1, _080DFD9C
	adds r0, r3, r1
	ldr r2, [sp, #4]
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r4, _080DFDA0
	adds r1, r7, r4
	ldr r2, [sp, #8]
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r3, [sp, #0x10]
	bl GetEventObjectIdByXY
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x10]
	cmp r6, #0x10
	beq _080DFE06
	mov r4, sb
	ldr r1, [r4]
	mov r0, r8
	lsls r4, r0, #2
	adds r0, r4, r0
	lsls r5, r0, #1
	ldr r2, _080DFD98
	adds r0, r1, r2
	adds r0, r0, r5
	movs r2, #0
	mov sl, r2
	strh r6, [r0]
	ldr r2, _080DFDA4
	adds r0, r1, r2
	adds r0, r0, r5
	strh r3, [r0]
	ldr r0, _080DFDA8
	adds r1, r1, r0
	adds r1, r1, r5
	strh r7, [r1]
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r1, r3, #4
	adds r0, r0, r1
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r1, [r1, r2]
	mov ip, r1
	subs r1, r7, #2
	add r1, ip
	str r3, [sp, #0x10]
	bl MapGridGetMetatileLayerTypeAt
	mov r1, sb
	ldr r2, [r1]
	ldr r1, _080DFDAC
	adds r1, r1, r2
	mov ip, r1
	add ip, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, ip
	strh r0, [r1]
	ldr r1, _080DFDB0
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldr r3, [sp, #0x10]
	cmp r0, #2
	beq _080DFDC8
	cmp r0, #2
	bgt _080DFDB4
	cmp r0, #1
	beq _080DFDBA
	b _080DFDE8
	.align 2, 0
_080DFD94: .4byte 0x02039C10
_080DFD98: .4byte 0x00002010
_080DFD9C: .4byte 0x0000FFFC
_080DFDA0: .4byte 0x0000FFFE
_080DFDA4: .4byte 0x00002012
_080DFDA8: .4byte 0x00002014
_080DFDAC: .4byte 0x00002018
_080DFDB0: .4byte 0x02036FF0
_080DFDB4:
	cmp r0, #3
	beq _080DFDD8
	b _080DFDE8
_080DFDBA:
	ldr r4, _080DFDC4
	adds r0, r2, r4
	adds r0, r0, r5
	mov r1, sl
	b _080DFDFA
	.align 2, 0
_080DFDC4: .4byte 0x00002016
_080DFDC8:
	ldr r4, _080DFDD4
	adds r0, r2, r4
	adds r0, r0, r5
	movs r1, #1
	b _080DFDFA
	.align 2, 0
_080DFDD4: .4byte 0x00002016
_080DFDD8:
	ldr r1, _080DFDE4
	adds r0, r2, r1
	adds r0, r0, r5
	movs r1, #2
	b _080DFDFA
	.align 2, 0
_080DFDE4: .4byte 0x00002016
_080DFDE8:
	mov r2, sb
	ldr r0, [r2]
	mov r2, r8
	adds r1, r4, r2
	lsls r1, r1, #1
	ldr r4, _080DFE30
	adds r0, r0, r4
	adds r0, r0, r1
	movs r1, #3
_080DFDFA:
	strh r1, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080DFE06:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #6
	bhi _080DFE12
	b _080DFCEE
_080DFE12:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #4
	bhi _080DFE1E
	b _080DFCE8
_080DFE1E:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DFE30: .4byte 0x00002016
	thumb_func_end BuyMenuCollectEventObjectData

	thumb_func_start BuyMenuDrawEventObjects
BuyMenuDrawEventObjects: @ 0x080DFE34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	ldr r0, _080DFF38
	mov r8, r0
	ldr r1, _080DFF3C
	mov sl, r1
	ldr r2, _080DFF40
	mov sb, r2
_080DFE4E:
	mov r3, r8
	ldr r0, [r3]
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r5, r1, #1
	ldr r4, _080DFF44
	adds r0, r0, r4
	adds r1, r0, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x10
	beq _080DFF1C
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0, #5]
	bl GetEventObjectGraphicsInfo
	mov r4, r8
	ldr r3, [r4]
	ldr r2, _080DFF44
	adds r1, r3, r2
	adds r1, r1, r5
	movs r4, #0
	ldrsh r2, [r1, r4]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, sl
	ldrb r4, [r1, #5]
	ldr r2, _080DFF48
	adds r1, r3, r2
	adds r1, r1, r5
	ldrh r2, [r1]
	lsls r2, r2, #4
	adds r2, #8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r1, _080DFF4C
	adds r3, r3, r1
	adds r3, r3, r5
	ldrh r3, [r3]
	lsls r3, r3, #4
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, #0x30
	subs r3, r3, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	ldr r1, _080DFF50
	bl AddPseudoEventObject
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r2, _080DFF44
	adds r1, r5, r2
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r1
	bl BuyMenuCheckIfEventObjectOverlapsMenuBg
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080DFF04
	lsls r2, r4, #4
	adds r2, r2, r4
	lsls r2, r2, #2
	add r2, sb
	adds r2, #0x42
	ldrb r0, [r2]
	movs r4, #0x40
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
_080DFF04:
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	add r0, sb
	mov r2, r8
	ldr r1, [r2]
	ldr r3, _080DFF54
	adds r1, r1, r3
	adds r1, r1, r5
	ldrb r1, [r1]
	bl StartSpriteAnim
_080DFF1C:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bls _080DFE4E
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DFF38: .4byte 0x02039C10
_080DFF3C: .4byte 0x02036FF0
_080DFF40: .4byte 0x020205AC
_080DFF44: .4byte 0x00002010
_080DFF48: .4byte 0x00002012
_080DFF4C: .4byte 0x00002014
_080DFF50: .4byte 0x08007141
_080DFF54: .4byte 0x00002016
	thumb_func_end BuyMenuDrawEventObjects

	thumb_func_start BuyMenuCheckIfEventObjectOverlapsMenuBg
BuyMenuCheckIfEventObjectOverlapsMenuBg: @ 0x080DFF58
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r2, #4
	ldrsh r1, [r4, r2]
	adds r1, #2
	bl BuyMenuCheckForOverlapWithMenuBg
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080DFF7C
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080DFF7C
	movs r0, #1
	b _080DFF7E
_080DFF7C:
	movs r0, #0
_080DFF7E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end BuyMenuCheckIfEventObjectOverlapsMenuBg

	thumb_func_start BuyMenuCopyMenuBgToBg1TilemapBuffer
BuyMenuCopyMenuBgToBg1TilemapBuffer: @ 0x080DFF84
	push {r4, r5, r6, lr}
	ldr r0, _080DFFC0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r4, r0, r1
	adds r3, r0, #0
	movs r1, #0
	ldr r0, _080DFFC4
	adds r6, r0, #0
	ldr r5, _080DFFC8
_080DFF9A:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r1, r2, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	beq _080DFFAE
	adds r1, r1, r4
	adds r0, r0, r6
	strh r0, [r1]
_080DFFAE:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	ble _080DFF9A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DFFC0: .4byte 0x02039C10
_080DFFC4: .4byte 0x0000C3E3
_080DFFC8: .4byte 0x000003FF
	thumb_func_end BuyMenuCopyMenuBgToBg1TilemapBuffer

	thumb_func_start BuyMenuCheckForOverlapWithMenuBg
BuyMenuCheckForOverlapWithMenuBg: @ 0x080DFFCC
	push {lr}
	ldr r2, _080E0000
	ldr r2, [r2]
	lsls r0, r0, #1
	lsls r1, r1, #6
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r0, [r1]
	cmp r0, #0
	bne _080E0004
	adds r0, r1, #0
	adds r0, #0x40
	ldrh r0, [r0]
	cmp r0, #0
	bne _080E0004
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080E0004
	adds r0, r1, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _080E0004
	movs r0, #1
	b _080E0006
	.align 2, 0
_080E0000: .4byte 0x02039C10
_080E0004:
	movs r0, #0
_080E0006:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end BuyMenuCheckForOverlapWithMenuBg

	thumb_func_start Task_BuyMenu
Task_BuyMenu: @ 0x080E000C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _080E0058
	adds r4, r0, r1
	ldr r0, _080E005C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080E002E
	b _080E01DA
_080E002E:
	ldrb r0, [r4, #0xe]
	bl ListMenu_ProcessInput
	adds r5, r0, #0
	ldrb r0, [r4, #0xe]
	ldr r7, _080E0060
	ldr r2, [r7]
	ldr r3, _080E0064
	adds r1, r2, r3
	subs r3, #2
	adds r2, r2, r3
	bl ListMenuGetScrollAndRow
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	beq _080E0068
	adds r0, #1
	cmp r5, r0
	bne _080E0076
	b _080E01DA
	.align 2, 0
_080E0058: .4byte 0x03005B68
_080E005C: .4byte 0x02037C74
_080E0060: .4byte 0x02039C10
_080E0064: .4byte 0x00002008
_080E0068:
	movs r0, #5
	bl PlaySE
	adds r0, r6, #0
	bl ExitBuyMenu
	b _080E01DA
_080E0076:
	movs r0, #5
	bl PlaySE
	strh r5, [r4, #0xa]
	movs r0, #2
	bl ClearWindowTilemap
	bl BuyMenuRemoveScrollIndicatorArrows
	ldrb r0, [r4, #0xe]
	movs r1, #2
	bl BuyMenuPrintCursor
	ldr r0, _080E00C0
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _080E00C4
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl sub_080D6CD4
	adds r4, r0, #0
	movs r0, #1
	bl GetPriceReduction
	ldr r1, [r7]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	asrs r4, r0
	str r4, [r1]
	b _080E00DA
	.align 2, 0
_080E00C0: .4byte 0x02039C00
_080E00C4:
	ldr r1, [r7]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r1, r3
	ldr r2, _080E0104
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x10]
	str r0, [r1]
_080E00DA:
	ldr r0, _080E0108
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r2, _080E010C
	mov r8, r2
	ldr r1, [r2]
	movs r7, #0x80
	lsls r7, r7, #6
	adds r1, r1, r7
	ldr r1, [r1]
	bl IsEnoughMoney
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E0118
	ldr r1, _080E0110
	ldr r2, _080E0114
	b _080E0170
	.align 2, 0
_080E0104: .4byte 0x08580CD0
_080E0108: .4byte 0x03005AEC
_080E010C: .4byte 0x02039C10
_080E0110: .4byte 0x085C99B8
_080E0114: .4byte 0x080E05ED
_080E0118:
	ldr r4, _080E0158
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _080E0180
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _080E015C
	adds r0, r5, #0
	bl CopyItemName
	adds r0, r5, #0
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080E016C
	ldr r4, _080E0160
	adds r0, r5, #0
	bl ItemIdToBattleMoveId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xd
	ldr r0, _080E0164
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _080E0168
	b _080E016E
	.align 2, 0
_080E0158: .4byte 0x02039C00
_080E015C: .4byte 0x02021C40
_080E0160: .4byte 0x02021C54
_080E0164: .4byte 0x082EACC4
_080E0168: .4byte 0x085C9903
_080E016C:
	ldr r1, _080E0178
_080E016E:
	ldr r2, _080E017C
_080E0170:
	adds r0, r6, #0
	bl BuyMenuDisplayMessage
	b _080E01DA
	.align 2, 0
_080E0178: .4byte 0x085C98EC
_080E017C: .4byte 0x080E01F1
_080E0180:
	ldr r0, _080E01B4
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	ldr r2, _080E01B8
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080E01BC
	mov r3, r8
	ldr r1, [r3]
	adds r1, r1, r7
	ldr r1, [r1]
	movs r2, #0
	movs r3, #6
	bl ConvertIntToDecimalStringN
	ldrb r0, [r4, #0xf]
	cmp r0, #1
	bne _080E01C8
	ldr r0, _080E01C0
	ldr r1, _080E01C4
	bl StringExpandPlaceholders
	b _080E01D0
	.align 2, 0
_080E01B4: .4byte 0x02021C40
_080E01B8: .4byte 0x08580CD1
_080E01BC: .4byte 0x02021C54
_080E01C0: .4byte 0x02021C7C
_080E01C4: .4byte 0x085C9936
_080E01C8:
	ldr r0, _080E01E4
	ldr r1, _080E01E8
	bl StringExpandPlaceholders
_080E01D0:
	ldr r1, _080E01E4
	ldr r2, _080E01EC
	adds r0, r6, #0
	bl BuyMenuDisplayMessage
_080E01DA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E01E4: .4byte 0x02021C7C
_080E01E8: .4byte 0x085C994B
_080E01EC: .4byte 0x080E03F9
	thumb_func_end Task_BuyMenu

	thumb_func_start Task_BuyHowManyDialogueInit
Task_BuyHowManyDialogueInit: @ 0x080E01F0
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r5, r6, #2
	adds r5, r5, r6
	lsls r5, r5, #3
	ldr r0, _080E0290
	adds r5, r5, r0
	ldrh r0, [r5, #0xa]
	bl CountTotalItemQuantityInBag
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	movs r1, #0
	movs r2, #1
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r0, _080E0294
	adds r1, r4, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _080E0298
	ldr r1, _080E029C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #3
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl BuyMenuPrint
	movs r0, #1
	strh r0, [r5, #2]
	movs r0, #4
	movs r1, #0
	movs r2, #1
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	adds r0, r6, #0
	bl BuyMenuPrintItemQuantityAndPrice
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _080E02A0
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	bl GetMoney
	ldr r1, _080E02A4
	ldr r4, [r1]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r4, r2
	ldr r1, [r1]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x63
	bls _080E02AC
	ldr r0, _080E02A8
	adds r1, r4, r0
	movs r0, #0x63
	strb r0, [r1]
	b _080E02B2
	.align 2, 0
_080E0290: .4byte 0x03005B68
_080E0294: .4byte 0x02021C40
_080E0298: .4byte 0x02021C7C
_080E029C: .4byte 0x085C98D5
_080E02A0: .4byte 0x03005AEC
_080E02A4: .4byte 0x02039C10
_080E02A8: .4byte 0x0000200A
_080E02AC:
	ldr r2, _080E02C8
	adds r0, r4, r2
	strb r1, [r0]
_080E02B2:
	ldr r0, _080E02CC
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080E02D0
	str r0, [r1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E02C8: .4byte 0x0000200A
_080E02CC: .4byte 0x03005B60
_080E02D0: .4byte 0x080E02D5
	thumb_func_end Task_BuyHowManyDialogueInit

	thumb_func_start Task_BuyHowManyDialogueHandleInput
Task_BuyHowManyDialogueHandleInput: @ 0x080E02D4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r4, r6, #0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _080E0330
	adds r5, r0, r1
	adds r0, r5, #2
	ldr r7, _080E0334
	ldr r1, [r7]
	ldr r2, _080E0338
	adds r1, r1, r2
	ldrb r1, [r1]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E033C
	ldrh r0, [r5, #0xa]
	bl sub_080D6CD4
	adds r4, r0, #0
	movs r0, #1
	bl GetPriceReduction
	ldr r1, [r7]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	asrs r4, r0
	movs r2, #2
	ldrsh r0, [r5, r2]
	muls r0, r4, r0
	str r0, [r1]
	adds r0, r6, #0
	bl BuyMenuPrintItemQuantityAndPrice
	b _080E03F0
	.align 2, 0
_080E0330: .4byte 0x03005B68
_080E0334: .4byte 0x02039C10
_080E0338: .4byte 0x0000200A
_080E033C:
	ldr r0, _080E03A8
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080E03C0
	movs r0, #5
	bl PlaySE
	movs r0, #4
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #3
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #4
	bl ClearWindowTilemap
	movs r0, #3
	bl ClearWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
	ldrh r0, [r5, #0xa]
	ldr r1, _080E03AC
	bl CopyItemName
	ldr r0, _080E03B0
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _080E03B4
	ldr r1, [r7]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0
	movs r3, #6
	bl ConvertIntToDecimalStringN
	ldr r1, _080E03B8
	ldr r2, _080E03BC
	adds r0, r6, #0
	bl BuyMenuDisplayMessage
	b _080E03F0
	.align 2, 0
_080E03A8: .4byte 0x03002360
_080E03AC: .4byte 0x02021C40
_080E03B0: .4byte 0x02021C54
_080E03B4: .4byte 0x02021C68
_080E03B8: .4byte 0x085C991F
_080E03BC: .4byte 0x080E03F9
_080E03C0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080E03F0
	movs r0, #5
	bl PlaySE
	movs r0, #4
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #3
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #4
	bl ClearWindowTilemap
	movs r0, #3
	bl ClearWindowTilemap
	adds r0, r4, #0
	bl BuyMenuReturnToItemList
_080E03F0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_BuyHowManyDialogueHandleInput

	thumb_func_start BuyMenuConfirmPurchase
BuyMenuConfirmPurchase: @ 0x080E03F8
	push {lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080E0420
	movs r2, #0
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0xd
	str r2, [sp, #8]
	ldr r2, _080E0424
	str r2, [sp, #0xc]
	movs r2, #1
	movs r3, #0
	bl CreateYesNoMenuWithCallbacks
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080E0420: .4byte 0x08562A2C
_080E0424: .4byte 0x0856298C
	thumb_func_end BuyMenuConfirmPurchase

	thumb_func_start BuyMenuTryMakePurchase
BuyMenuTryMakePurchase: @ 0x080E0428
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r5, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080E046C
	adds r4, r0, r1
	movs r0, #1
	bl PutWindowTilemap
	ldr r6, _080E0470
	ldrb r0, [r6, #0xf]
	cmp r0, #0
	bne _080E048C
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #2]
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E047C
	ldr r1, _080E0474
	ldr r2, _080E0478
	adds r0, r5, #0
	bl BuyMenuDisplayMessage
	adds r0, r5, #0
	bl RecordItemPurchase
	b _080E04C6
	.align 2, 0
_080E046C: .4byte 0x03005B68
_080E0470: .4byte 0x02039C00
_080E0474: .4byte 0x085C9962
_080E0478: .4byte 0x080E04D5
_080E047C:
	ldr r1, _080E0484
	ldr r2, _080E0488
	b _080E04AC
	.align 2, 0
_080E0484: .4byte 0x085C99C8
_080E0488: .4byte 0x080E05ED
_080E048C:
	ldrb r0, [r4, #0xa]
	bl DecorationAdd
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E04BC
	ldrb r0, [r6, #0xf]
	cmp r0, #1
	bne _080E04A8
	ldr r1, _080E04A4
	b _080E04AA
	.align 2, 0
_080E04A4: .4byte 0x085C9976
_080E04A8:
	ldr r1, _080E04B4
_080E04AA:
	ldr r2, _080E04B8
_080E04AC:
	adds r0, r5, #0
	bl BuyMenuDisplayMessage
	b _080E04C6
	.align 2, 0
_080E04B4: .4byte 0x085C9998
_080E04B8: .4byte 0x080E04D5
_080E04BC:
	ldr r1, _080E04CC
	ldr r2, _080E04D0
	adds r0, r7, #0
	bl BuyMenuDisplayMessage
_080E04C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E04CC: .4byte 0x085C99DE
_080E04D0: .4byte 0x080E05ED
	thumb_func_end BuyMenuTryMakePurchase

	thumb_func_start BuyMenuSubtractMoney
BuyMenuSubtractMoney: @ 0x080E04D4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0x26
	bl IncrementGameStat
	ldr r5, _080E0528
	ldr r0, [r5]
	movs r4, #0x92
	lsls r4, r4, #3
	adds r0, r0, r4
	ldr r1, _080E052C
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	ldr r1, [r1]
	bl RemoveMoney
	movs r0, #0x5f
	bl PlaySE
	ldr r0, [r5]
	adds r0, r0, r4
	bl GetMoney
	adds r1, r0, #0
	movs r0, #0
	movs r2, #0
	bl PrintMoneyAmountInMoneyBox
	ldr r0, _080E0530
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _080E053C
	ldr r0, _080E0534
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080E0538
	b _080E0548
	.align 2, 0
_080E0528: .4byte 0x03005AEC
_080E052C: .4byte 0x02039C10
_080E0530: .4byte 0x02039C00
_080E0534: .4byte 0x03005B60
_080E0538: .4byte 0x080E0559
_080E053C:
	ldr r0, _080E0550
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080E0554
_080E0548:
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E0550: .4byte 0x03005B60
_080E0554: .4byte 0x080E05C5
	thumb_func_end BuyMenuSubtractMoney

	thumb_func_start Task_ReturnToItemListAfterItemPurchase
Task_ReturnToItemListAfterItemPurchase: @ 0x080E0558
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080E05A8
	adds r5, r0, r1
	ldr r0, _080E05AC
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080E05BE
	movs r0, #5
	bl PlaySE
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #4
	bne _080E05B8
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #9
	ble _080E05B8
	movs r0, #0xc
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E05B8
	ldr r1, _080E05B0
	ldr r2, _080E05B4
	adds r0, r4, #0
	bl BuyMenuDisplayMessage
	b _080E05BE
	.align 2, 0
_080E05A8: .4byte 0x03005B68
_080E05AC: .4byte 0x03002360
_080E05B0: .4byte 0x085C9A2D
_080E05B4: .4byte 0x080E05ED
_080E05B8:
	adds r0, r4, #0
	bl BuyMenuReturnToItemList
_080E05BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Task_ReturnToItemListAfterItemPurchase

	thumb_func_start Task_ReturnToItemListAfterDecorationPurchase
Task_ReturnToItemListAfterDecorationPurchase: @ 0x080E05C4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080E05E8
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080E05E2
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl BuyMenuReturnToItemList
_080E05E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E05E8: .4byte 0x03002360
	thumb_func_end Task_ReturnToItemListAfterDecorationPurchase

	thumb_func_start BuyMenuReturnToItemList
BuyMenuReturnToItemList: @ 0x080E05EC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _080E0630
	adds r6, r4, r5
	movs r0, #5
	movs r1, #0
	bl ClearDialogWindowAndFrameToTransparent
	ldrb r0, [r6, #0xe]
	movs r1, #1
	bl BuyMenuPrintCursor
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #2
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	bl BuyMenuAddScrollIndicatorArrows
	subs r5, #8
	adds r4, r4, r5
	ldr r0, _080E0634
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E0630: .4byte 0x03005B68
_080E0634: .4byte 0x080E000D
	thumb_func_end BuyMenuReturnToItemList

	thumb_func_start BuyMenuPrintItemQuantityAndPrice
BuyMenuPrintItemQuantityAndPrice: @ 0x080E0638
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _080E06A0
	adds r4, r4, r0
	movs r0, #4
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _080E06A4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xff
	str r0, [sp]
	movs r0, #4
	movs r1, #0x20
	movs r2, #2
	bl PrintMoneyAmountInMoneyBoxWithBorder
	ldr r0, _080E06A8
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _080E06AC
	ldr r1, _080E06B0
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl BuyMenuPrint
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E06A0: .4byte 0x03005B68
_080E06A4: .4byte 0x02039C10
_080E06A8: .4byte 0x02021C40
_080E06AC: .4byte 0x02021C7C
_080E06B0: .4byte 0x085C943C
	thumb_func_end BuyMenuPrintItemQuantityAndPrice

	thumb_func_start ExitBuyMenu
ExitBuyMenu: @ 0x080E06B4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _080E06EC
	ldr r0, _080E06F0
	str r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _080E06F4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080E06F8
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E06EC: .4byte 0x03005B0C
_080E06F0: .4byte 0x080DF22D
_080E06F4: .4byte 0x03005B60
_080E06F8: .4byte 0x080E06FD
	thumb_func_end ExitBuyMenu

	thumb_func_start Task_ExitBuyMenu
Task_ExitBuyMenu: @ 0x080E06FC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080E0728
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080E0722
	bl RemoveMoneyLabelObject
	bl BuyMenuFreeMemory
	ldr r0, _080E072C
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_080E0722:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0728: .4byte 0x02037C74
_080E072C: .4byte 0x08085A31
	thumb_func_end Task_ExitBuyMenu

	thumb_func_start ClearItemPurchases
ClearItemPurchases: @ 0x080E0730
	push {lr}
	ldr r0, _080E0748
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080E074C
	movs r1, #0
	movs r2, #0xc
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080E0748: .4byte 0x02039C1C
_080E074C: .4byte 0x02039C20
	thumb_func_end ClearItemPurchases

	thumb_func_start RecordItemPurchase
RecordItemPurchase: @ 0x080E0750
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080E078C
	adds r4, r1, r0
	movs r3, #0
	ldr r5, _080E0790
	adds r6, r5, #0
_080E0766:
	lsls r0, r3, #2
	adds r2, r0, r6
	ldrh r1, [r2]
	movs r7, #0xa
	ldrsh r0, [r4, r7]
	cmp r1, r0
	bne _080E079C
	ldrh r0, [r2, #2]
	cmp r0, #0
	beq _080E079C
	adds r1, r0, #0
	movs r3, #2
	ldrsh r0, [r4, r3]
	adds r0, r1, r0
	cmp r0, #0xff
	ble _080E0794
	movs r0, #0xff
	strh r0, [r2, #2]
	b _080E07C6
	.align 2, 0
_080E078C: .4byte 0x03005B68
_080E0790: .4byte 0x02039C20
_080E0794:
	ldrh r0, [r4, #2]
	adds r0, r1, r0
	strh r0, [r2, #2]
	b _080E07C6
_080E079C:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #2
	bls _080E0766
	ldr r2, _080E07CC
	ldrb r0, [r2]
	cmp r0, #2
	bhi _080E07C6
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r4, #0xa]
	strh r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_080E07C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E07CC: .4byte 0x02039C1C
	thumb_func_end RecordItemPurchase

	thumb_func_start CreatePokemartMenu
CreatePokemartMenu: @ 0x080E07D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl CB2_BuyMenu
	adds r0, r4, #0
	bl SetShopItemsForSale
	bl ClearItemPurchases
	ldr r0, _080E07F0
	bl SetShopMenuCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E07F0: .4byte 0x080988C5
	thumb_func_end CreatePokemartMenu

	thumb_func_start CreateDecorationShop1Menu
CreateDecorationShop1Menu: @ 0x080E07F4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl CB2_BuyMenu
	adds r0, r4, #0
	bl SetShopItemsForSale
	ldr r0, _080E0810
	bl SetShopMenuCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0810: .4byte 0x080988C5
	thumb_func_end CreateDecorationShop1Menu

	thumb_func_start CreateDecorationShop2Menu
CreateDecorationShop2Menu: @ 0x080E0814
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	bl CB2_BuyMenu
	adds r0, r4, #0
	bl SetShopItemsForSale
	ldr r0, _080E0830
	bl SetShopMenuCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0830: .4byte 0x080988C5
	thumb_func_end CreateDecorationShop2Menu

