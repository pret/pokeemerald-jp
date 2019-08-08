.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start NewGameInitPCItems
NewGameInitPCItems: @ 0x0816ABFC
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r0, _0816AC58
	ldr r0, [r0]
	movs r1, #0x93
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0x32
	bl ClearItemSlots
	ldr r1, _0816AC5C
	ldrh r0, [r1]
	cmp r0, #0
	beq _0816AC50
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0816AC50
	adds r5, r1, #0
	adds r6, r5, #2
_0816AC22:
	lsls r1, r4, #2
	adds r0, r1, r5
	ldrh r0, [r0]
	adds r1, r1, r6
	ldrh r1, [r1]
	bl AddPCItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0816AC50
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r4, #2
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r0, #0
	beq _0816AC50
	adds r0, r1, r6
	ldrh r0, [r0]
	cmp r0, #0
	bne _0816AC22
_0816AC50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816AC58: .4byte 0x03005AEC
_0816AC5C: .4byte 0x085C0BE0
	thumb_func_end NewGameInitPCItems

	thumb_func_start BedroomPC
BedroomPC: @ 0x0816AC60
	push {lr}
	ldr r1, _0816AC88
	ldr r0, _0816AC8C
	str r0, [r1]
	ldr r1, _0816AC90
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0816AC94
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0816AC98
	ldr r2, _0816AC9C
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0816AC88: .4byte 0x0203B97C
_0816AC8C: .4byte 0x085C0BB8
_0816AC90: .4byte 0x0203B980
_0816AC94: .4byte 0x080A8A41
_0816AC98: .4byte 0x085C942E
_0816AC9C: .4byte 0x0816ACE1
	thumb_func_end BedroomPC

	thumb_func_start PlayerPC
PlayerPC: @ 0x0816ACA0
	push {lr}
	ldr r1, _0816ACC8
	ldr r0, _0816ACCC
	str r0, [r1]
	ldr r1, _0816ACD0
	movs r0, #3
	strb r0, [r1]
	ldr r0, _0816ACD4
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0816ACD8
	ldr r2, _0816ACDC
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0816ACC8: .4byte 0x0203B97C
_0816ACCC: .4byte 0x085C0BBC
_0816ACD0: .4byte 0x0203B980
_0816ACD4: .4byte 0x080A8A41
_0816ACD8: .4byte 0x085C942E
_0816ACDC: .4byte 0x0816ACE1
	thumb_func_end PlayerPC

	thumb_func_start InitPlayerPCMenu
InitPlayerPCMenu: @ 0x0816ACE0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _0816AD04
	adds r7, r0, r1
	ldr r0, _0816AD08
	ldrb r0, [r0]
	cmp r0, #3
	bne _0816AD10
	ldr r0, _0816AD0C
	b _0816AD12
	.align 2, 0
_0816AD04: .4byte 0x03005B68
_0816AD08: .4byte 0x0203B980
_0816AD0C: .4byte 0x085C0C08
_0816AD10:
	ldr r0, _0816AD98
_0816AD12:
	bl AddWindow
	strh r0, [r7, #8]
	ldrb r0, [r7, #8]
	movs r1, #0
	bl SetStandardWindowBorderStyle
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	movs r1, #2
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r7, #8]
	str r0, [sp]
	movs r6, #0x10
	str r6, [sp, #4]
	ldr r5, _0816AD9C
	ldrb r0, [r5]
	str r0, [sp, #8]
	ldr r0, _0816ADA0
	str r0, [sp, #0xc]
	ldr r0, _0816ADA4
	ldr r0, [r0]
	str r0, [sp, #0x10]
	adds r0, r1, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #2
	bl AddItemMenuActionTextPrinters
	ldrb r0, [r7, #8]
	str r6, [sp]
	ldrb r1, [r5]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0816ADA8
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816ADAC
	str r1, [r0]
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816AD98: .4byte 0x085C0C10
_0816AD9C: .4byte 0x0203B980
_0816ADA0: .4byte 0x085C0B98
_0816ADA4: .4byte 0x0203B97C
_0816ADA8: .4byte 0x03005B60
_0816ADAC: .4byte 0x0816ADB1
	thumb_func_end InitPlayerPCMenu

	thumb_func_start PlayerPCProcessMenuInput
PlayerPCProcessMenuInput: @ 0x0816ADB0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0816ADD0
	adds r4, r0, r1
	ldr r0, _0816ADD4
	ldrb r0, [r0]
	cmp r0, #3
	bls _0816ADD8
	bl Menu_ProcessInput
	b _0816ADDC
	.align 2, 0
_0816ADD0: .4byte 0x03005B68
_0816ADD4: .4byte 0x0203B980
_0816ADD8:
	bl Menu_ProcessInputNoWrap
_0816ADDC:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0816AE64
	adds r0, #1
	cmp r5, r0
	bne _0816AE2C
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4, #8]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4, #8]
	bl ClearWindowTilemap
	ldrb r0, [r4, #8]
	bl RemoveWindow
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0816AE24
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816AE28
	str r1, [r0]
	b _0816AE64
	.align 2, 0
_0816AE24: .4byte 0x03005B60
_0816AE28: .4byte 0x0816AF61
_0816AE2C:
	ldrb r0, [r4, #8]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4, #8]
	bl ClearWindowTilemap
	ldrb r0, [r4, #8]
	bl RemoveWindow
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _0816AE6C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r2, _0816AE70
	ldr r0, _0816AE74
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
_0816AE64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816AE6C: .4byte 0x03005B60
_0816AE70: .4byte 0x085C0B98
_0816AE74: .4byte 0x0203B97C
	thumb_func_end PlayerPCProcessMenuInput

	thumb_func_start ReshowPlayerPC
ReshowPlayerPC: @ 0x0816AE78
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0816AE8C
	ldr r2, _0816AE90
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0816AE8C: .4byte 0x085C942E
_0816AE90: .4byte 0x0816ACE1
	thumb_func_end ReshowPlayerPC

	thumb_func_start PlayerPC_ItemStorage
PlayerPC_ItemStorage: @ 0x0816AE94
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl InitItemStorageMenu
	ldr r1, _0816AEB8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816AEBC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816AEB8: .4byte 0x03005B60
_0816AEBC: .4byte 0x0816B06D
	thumb_func_end PlayerPC_ItemStorage

	thumb_func_start PlayerPC_Mailbox
PlayerPC_Mailbox: @ 0x0816AEC0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	bl GetMailboxMailCount
	ldr r5, _0816AEE4
	movs r1, #0
	strb r0, [r5, #5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816AEF0
	ldr r1, _0816AEE8
	ldr r2, _0816AEEC
	adds r0, r4, #0
	bl DisplayItemMessageOnField
	b _0816AF42
	.align 2, 0
_0816AEE4: .4byte 0x0203B984
_0816AEE8: .4byte 0x085CA976
_0816AEEC: .4byte 0x0816AE79
_0816AEF0:
	strh r1, [r5]
	strh r1, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #9]
	bl Mailbox_UpdateMailList
	adds r0, r4, #0
	bl ItemStorage_SetItemAndMailCount
	ldrb r0, [r5, #5]
	bl sub_081D1340
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0816AF38
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	adds r0, r4, #0
	bl Mailbox_DrawMailboxMenu
	ldr r0, _0816AF30
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0816AF34
	str r0, [r1]
	b _0816AF42
	.align 2, 0
_0816AF30: .4byte 0x03005B60
_0816AF34: .4byte 0x0816B489
_0816AF38:
	ldr r1, _0816AF48
	ldr r2, _0816AF4C
	adds r0, r6, #0
	bl DisplayItemMessageOnField
_0816AF42:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816AF48: .4byte 0x085CA976
_0816AF4C: .4byte 0x0816AE79
	thumb_func_end PlayerPC_Mailbox

	thumb_func_start PlayerPC_Decoration
PlayerPC_Decoration: @ 0x0816AF50
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DoPlayerRoomDecorationMenu
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPC_Decoration

	thumb_func_start PlayerPC_TurnOff
PlayerPC_TurnOff: @ 0x0816AF60
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0816AF80
	ldrb r0, [r0]
	cmp r0, #4
	bne _0816AF98
	ldr r0, _0816AF84
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0816AF8C
	ldr r0, _0816AF88
	bl ScriptContext1_SetupScript
	b _0816AF9C
	.align 2, 0
_0816AF80: .4byte 0x0203B980
_0816AF84: .4byte 0x03005AF0
_0816AF88: .4byte 0x081F01EE
_0816AF8C:
	ldr r0, _0816AF94
	bl ScriptContext1_SetupScript
	b _0816AF9C
	.align 2, 0
_0816AF94: .4byte 0x081F0DDB
_0816AF98:
	bl EnableBothScriptContexts
_0816AF9C:
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerPC_TurnOff

	thumb_func_start InitItemStorageMenu
InitItemStorageMenu: @ 0x0816AFA8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0816B030
	adds r4, r4, r0
	ldr r0, _0816B034
	bl AddWindow
	strh r0, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl SetStandardWindowBorderStyle
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #8]
	movs r1, #0x10
	mov r8, r1
	str r1, [sp]
	movs r6, #4
	str r6, [sp, #4]
	ldr r1, _0816B038
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl PrintTextArray
	ldrb r0, [r4, #8]
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _0816B03C
	lsls r5, r5, #2
	adds r5, r5, r0
	ldr r0, [r5]
	bl ItemStorageMenuPrint
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816B030: .4byte 0x03005B68
_0816B034: .4byte 0x085C0C18
_0816B038: .4byte 0x085C0BC0
_0816B03C: .4byte 0x085C0B88
	thumb_func_end InitItemStorageMenu

	thumb_func_start ItemStorageMenuPrint
ItemStorageMenuPrint: @ 0x0816B040
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ItemStorageMenuPrint

	thumb_func_start ItemStorageMenuProcessInput
ItemStorageMenuProcessInput: @ 0x0816B06C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl Menu_ProcessInput
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0816B0BC
	adds r0, #1
	cmp r4, r0
	beq _0816B0D8
	movs r0, #5
	bl PlaySE
	ldr r0, _0816B0B8
	lsls r1, r4, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r6, #0
	bl _call_via_r1
	b _0816B0E4
	.align 2, 0
_0816B0B8: .4byte 0x085C0BC0
_0816B0BC:
	lsls r1, r5, #0x18
	lsls r0, r2, #0x18
	asrs r2, r0, #0x18
	cmp r1, r0
	beq _0816B0E4
	ldr r0, _0816B0D4
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ItemStorageMenuPrint
	b _0816B0E4
	.align 2, 0
_0816B0D4: .4byte 0x085C0B88
_0816B0D8:
	movs r0, #5
	bl PlaySE
	adds r0, r6, #0
	bl ItemStorage_Exit
_0816B0E4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ItemStorageMenuProcessInput

	thumb_func_start ItemStorage_Deposit
ItemStorage_Deposit: @ 0x0816B0EC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0816B10C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _0816B110
	str r0, [r1]
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	pop {r0}
	bx r0
	.align 2, 0
_0816B10C: .4byte 0x03005B60
_0816B110: .4byte 0x0816B115
	thumb_func_end ItemStorage_Deposit

	thumb_func_start Task_ItemStorage_Deposit
Task_ItemStorage_Deposit: @ 0x0816B114
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0816B13C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816B134
	bl CleanupOverworldWindowsAndTilemaps
	bl sub_081AA98C
	adds r0, r4, #0
	bl DestroyTask
_0816B134:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816B13C: .4byte 0x02037C74
	thumb_func_end Task_ItemStorage_Deposit

	thumb_func_start sub_0816B140
sub_0816B140: @ 0x0816B140
	push {lr}
	ldr r0, _0816B154
	ldr r1, _0816B158
	str r1, [r0]
	ldr r0, _0816B15C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0816B154: .4byte 0x03005B0C
_0816B158: .4byte 0x0816B161
_0816B15C: .4byte 0x08085A31
	thumb_func_end sub_0816B140

	thumb_func_start Mailbox_DoRedrawMailboxMenuAfterReturn
Mailbox_DoRedrawMailboxMenuAfterReturn: @ 0x0816B160
	push {lr}
	bl sub_08196F98
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrame
	ldr r0, _0816B188
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl InitItemStorageMenu
	bl pal_fill_black
	pop {r0}
	bx r0
	.align 2, 0
_0816B188: .4byte 0x0816B18D
	thumb_func_end Mailbox_DoRedrawMailboxMenuAfterReturn

	thumb_func_start ItemStorage_HandleReturnToProcessInput
ItemStorage_HandleReturnToProcessInput: @ 0x0816B18C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0816B1AC
	ldr r0, _0816B1B4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0816B1B8
	str r0, [r1]
_0816B1AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816B1B4: .4byte 0x03005B60
_0816B1B8: .4byte 0x0816B06D
	thumb_func_end ItemStorage_HandleReturnToProcessInput

	thumb_func_start ItemStorage_Withdraw
ItemStorage_Withdraw: @ 0x0816B1BC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _0816B1E4
	adds r4, r4, r0
	bl CountUsedPCItemSlots
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #2]
	cmp r0, #0
	beq _0816B1E8
	adds r0, r5, #0
	movs r1, #0
	bl ItemStorage_WithdrawToss_Helper
	b _0816B1F8
	.align 2, 0
_0816B1E4: .4byte 0x03005B68
_0816B1E8:
	adds r0, r5, #0
	bl sub_0816B300
	ldr r1, _0816B200
	ldr r2, _0816B204
	adds r0, r5, #0
	bl DisplayItemMessageOnField
_0816B1F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816B200: .4byte 0x085CA918
_0816B204: .4byte 0x0816AE95
	thumb_func_end ItemStorage_Withdraw

	thumb_func_start ItemStorage_Toss
ItemStorage_Toss: @ 0x0816B208
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _0816B230
	adds r4, r4, r0
	bl CountUsedPCItemSlots
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #2]
	cmp r0, #0
	beq _0816B234
	adds r0, r5, #0
	movs r1, #1
	bl ItemStorage_WithdrawToss_Helper
	b _0816B244
	.align 2, 0
_0816B230: .4byte 0x03005B68
_0816B234:
	adds r0, r5, #0
	bl sub_0816B300
	ldr r1, _0816B24C
	ldr r2, _0816B250
	adds r0, r5, #0
	bl DisplayItemMessageOnField
_0816B244:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816B24C: .4byte 0x085CA918
_0816B250: .4byte 0x0816AE95
	thumb_func_end ItemStorage_Toss

	thumb_func_start ItemStorage_WithdrawToss_Helper
ItemStorage_WithdrawToss_Helper: @ 0x0816B254
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r5, r4, #2
	adds r5, r5, r4
	lsls r5, r5, #3
	ldr r6, _0816B2B8
	adds r0, r5, r6
	strh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_0816B300
	ldr r1, _0816B2BC
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #9]
	adds r0, r4, #0
	bl ItemStorage_SetItemAndMailCount
	bl sub_0816BA54
	bl FreeAndReserveObjectSpritePalettes
	bl LoadListMenuArrowsGfx
	ldr r0, _0816B2C0
	ldr r0, [r0]
	movs r1, #0xcd
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #7
	bl sub_08122350
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	subs r6, #8
	adds r5, r5, r6
	ldr r0, _0816B2C4
	str r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816B2B8: .4byte 0x03005B68
_0816B2BC: .4byte 0x0203B984
_0816B2C0: .4byte 0x0203B990
_0816B2C4: .4byte 0x0816BF8D
	thumb_func_end ItemStorage_WithdrawToss_Helper

	thumb_func_start ItemStorage_Exit
ItemStorage_Exit: @ 0x0816B2C8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_0816B300
	adds r0, r4, #0
	bl ReshowPlayerPC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ItemStorage_Exit

	thumb_func_start ItemStorage_SetItemAndMailCount
ItemStorage_SetItemAndMailCount: @ 0x0816B2E4
	push {lr}
	ldr r1, _0816B2F4
	ldrb r0, [r1, #5]
	cmp r0, #7
	bls _0816B2F8
	movs r0, #8
	b _0816B2FA
	.align 2, 0
_0816B2F4: .4byte 0x0203B984
_0816B2F8:
	adds r0, #1
_0816B2FA:
	strb r0, [r1, #4]
	pop {r0}
	bx r0
	thumb_func_end ItemStorage_SetItemAndMailCount

	thumb_func_start sub_0816B300
sub_0816B300: @ 0x0816B300
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0816B330
	adds r4, r4, r0
	ldrb r0, [r4, #8]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4, #8]
	bl ClearWindowTilemap
	ldrb r0, [r4, #8]
	bl RemoveWindow
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816B330: .4byte 0x03005B68
	thumb_func_end sub_0816B300

	thumb_func_start GetMailboxMailCount
GetMailboxMailCount: @ 0x0816B334
	push {r4, lr}
	movs r2, #0
	movs r1, #6
	ldr r0, _0816B36C
	ldr r3, [r0]
	movs r4, #0xb0
	lsls r4, r4, #6
_0816B342:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	beq _0816B358
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0816B358:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _0816B342
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0816B36C: .4byte 0x03005AEC
	thumb_func_end GetMailboxMailCount

	thumb_func_start Mailbox_UpdateMailList
Mailbox_UpdateMailList: @ 0x0816B370
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r2, #6
_0816B37E:
	adds r1, r2, #1
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	mov r8, r1
	cmp r4, #0xf
	bhi _0816B3F8
	ldr r0, _0816B414
	mov sl, r0
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	mov ip, r0
	ldr r6, _0816B418
_0816B398:
	mov r1, sl
	ldr r1, [r1]
	mov sb, r1
	mov r2, sb
	add r2, ip
	movs r3, #0xb0
	lsls r3, r3, #6
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _0816B3EE
	adds r2, r2, r6
	mov r1, sp
	adds r0, r2, #0
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	lsls r3, r4, #3
	adds r3, r3, r4
	lsls r3, r3, #2
	mov r5, sb
	adds r0, r5, r3
	adds r0, r0, r6
	ldm r0!, {r1, r5, r7}
	stm r2!, {r1, r5, r7}
	ldm r0!, {r1, r5, r7}
	stm r2!, {r1, r5, r7}
	ldm r0!, {r1, r5, r7}
	stm r2!, {r1, r5, r7}
	mov r7, sl
	ldr r1, [r7]
	adds r1, r1, r3
	adds r1, r1, r6
	mov r0, sp
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
_0816B3EE:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0816B398
_0816B3F8:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xe
	bls _0816B37E
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816B414: .4byte 0x03005AEC
_0816B418: .4byte 0x00002BE0
	thumb_func_end Mailbox_UpdateMailList

	thumb_func_start Mailbox_DrawMailboxMenu
Mailbox_DrawMailboxMenu: @ 0x0816B41C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0
	bl sub_081D1380
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl sub_081D1380
	ldr r2, _0816B47C
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r4, _0816B480
	adds r0, r4, #0
	bl sub_081D13F4
	ldr r2, _0816B484
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x12]
	adds r0, r4, #0
	bl sub_081D14D8
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816B47C: .4byte 0x085CA8B5
_0816B480: .4byte 0x0203B984
_0816B484: .4byte 0x03005B60
	thumb_func_end Mailbox_DrawMailboxMenu

	thumb_func_start Mailbox_ProcessInput
Mailbox_ProcessInput: @ 0x0816B488
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	mov sb, r0
	ldr r0, _0816B4DC
	mov sl, r0
	mov r4, sb
	add r4, sl
	ldr r0, _0816B4E0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816B532
	ldrb r0, [r4, #0xa]
	bl ListMenu_ProcessInput
	adds r6, r0, #0
	ldrb r0, [r4, #0xa]
	ldr r7, _0816B4E4
	subs r1, r7, #2
	mov r8, r1
	adds r1, r7, #0
	mov r2, r8
	bl ListMenuGetScrollAndRow
	movs r0, #2
	rsbs r0, r0, #0
	cmp r6, r0
	beq _0816B4E8
	adds r0, #1
	cmp r6, r0
	bne _0816B4FE
	b _0816B532
	.align 2, 0
_0816B4DC: .4byte 0x03005B68
_0816B4E0: .4byte 0x02037C74
_0816B4E4: .4byte 0x0203B986
_0816B4E8:
	movs r0, #5
	bl PlaySE
	mov r1, r8
	ldrb r0, [r1, #9]
	bl RemoveScrollIndicatorArrowPair
	adds r0, r5, #0
	bl Mailbox_ReturnToPlayerPC
	b _0816B532
_0816B4FE:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl MoveRelearnerCursorCallback
	movs r0, #1
	bl MoveRelearnerCursorCallback
	ldrb r0, [r4, #0xa]
	adds r1, r7, #0
	mov r2, r8
	bl DestroyListMenuTask
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	mov r1, r8
	ldrb r0, [r1, #9]
	bl RemoveScrollIndicatorArrowPair
	mov r0, sl
	subs r0, #8
	add r0, sb
	ldr r1, _0816B540
	str r1, [r0]
_0816B532:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816B540: .4byte 0x0816B545
	thumb_func_end Mailbox_ProcessInput

	thumb_func_start Mailbox_PrintWhatToDoWithPlayerMailText
Mailbox_PrintWhatToDoWithPlayerMailText: @ 0x0816B544
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0816B588
	ldr r3, _0816B58C
	ldr r1, _0816B590
	ldrh r2, [r1]
	adds r2, #6
	ldrh r1, [r1, #2]
	adds r2, r2, r1
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, [r3]
	adds r1, r1, r2
	ldr r2, _0816B594
	adds r1, r1, r2
	bl StringCopy
	ldr r5, _0816B598
	ldr r1, _0816B59C
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldr r2, _0816B5A0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DisplayItemMessageOnField
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816B588: .4byte 0x02021C40
_0816B58C: .4byte 0x03005AEC
_0816B590: .4byte 0x0203B984
_0816B594: .4byte 0x00002BF2
_0816B598: .4byte 0x02021C7C
_0816B59C: .4byte 0x085CA988
_0816B5A0: .4byte 0x0816B5E9
	thumb_func_end Mailbox_PrintWhatToDoWithPlayerMailText

	thumb_func_start Mailbox_ReturnToPlayerPC
Mailbox_ReturnToPlayerPC: @ 0x0816B5A4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _0816B5E4
	adds r4, r4, r0
	movs r0, #0
	bl MoveRelearnerCursorCallback
	movs r0, #1
	bl MoveRelearnerCursorCallback
	ldrb r0, [r4, #0xa]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_081D1508
	adds r0, r5, #0
	bl ReshowPlayerPC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816B5E4: .4byte 0x03005B68
	thumb_func_end Mailbox_ReturnToPlayerPC

	thumb_func_start Mailbox_PrintMailOptions
Mailbox_PrintMailOptions: @ 0x0816B5E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #2
	bl sub_081D1380
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x10
	mov r8, r0
	str r0, [sp]
	movs r6, #4
	str r6, [sp, #4]
	ldr r0, _0816B660
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl PrintTextArray
	mov r0, r8
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0816B664
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816B668
	str r1, [r0]
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816B660: .4byte 0x085C0BE8
_0816B664: .4byte 0x03005B60
_0816B668: .4byte 0x0816B66D
	thumb_func_end Mailbox_PrintMailOptions

	thumb_func_start Mailbox_MailOptionsProcessInput
Mailbox_MailOptionsProcessInput: @ 0x0816B66C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	bl ProcessMenuInput_other
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0816B6AE
	adds r0, #1
	cmp r4, r0
	bne _0816B698
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl Mailbox_Cancel
	b _0816B6AE
_0816B698:
	movs r0, #5
	bl PlaySE
	ldr r0, _0816B6B4
	lsls r1, r4, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r6, #0
	bl _call_via_r1
_0816B6AE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816B6B4: .4byte 0x085C0BE8
	thumb_func_end Mailbox_MailOptionsProcessInput

	thumb_func_start Mailbox_DoMailRead
Mailbox_DoMailRead: @ 0x0816B6B8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r1, _0816B6DC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816B6E0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816B6DC: .4byte 0x03005B60
_0816B6E0: .4byte 0x0816B6E5
	thumb_func_end Mailbox_DoMailRead

	thumb_func_start Mailbox_FadeAndReadMail
Mailbox_FadeAndReadMail: @ 0x0816B6E4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0816B72C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816B726
	bl sub_081D1508
	bl CleanupOverworldWindowsAndTilemaps
	ldr r2, _0816B730
	ldr r1, _0816B734
	ldrh r0, [r1]
	adds r0, #6
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0816B738
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r1, _0816B73C
	movs r2, #1
	bl ReadMail
	adds r0, r4, #0
	bl DestroyTask
_0816B726:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816B72C: .4byte 0x02037C74
_0816B730: .4byte 0x03005AEC
_0816B734: .4byte 0x0203B984
_0816B738: .4byte 0x00002BE0
_0816B73C: .4byte 0x0816B741
	thumb_func_end Mailbox_FadeAndReadMail

	thumb_func_start Mailbox_ReturnToFieldFromReadMail
Mailbox_ReturnToFieldFromReadMail: @ 0x0816B740
	push {lr}
	ldr r0, _0816B754
	ldr r1, _0816B758
	str r1, [r0]
	ldr r0, _0816B75C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0816B754: .4byte 0x03005B0C
_0816B758: .4byte 0x0816B761
_0816B75C: .4byte 0x08085A31
	thumb_func_end Mailbox_ReturnToFieldFromReadMail

	thumb_func_start pal_fill_for_maplights_or_black
pal_fill_for_maplights_or_black: @ 0x0816B760
	push {r4, lr}
	bl sub_08196F98
	ldr r0, _0816B78C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0816B790
	ldrb r0, [r0, #5]
	bl sub_081D1340
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0816B794
	adds r0, r4, #0
	bl Mailbox_DrawMailboxMenu
	b _0816B79A
	.align 2, 0
_0816B78C: .4byte 0x0816B7A5
_0816B790: .4byte 0x0203B984
_0816B794:
	adds r0, r4, #0
	bl DestroyTask
_0816B79A:
	bl pal_fill_black
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pal_fill_for_maplights_or_black

	thumb_func_start Mailbox_HandleReturnToProcessInput
Mailbox_HandleReturnToProcessInput: @ 0x0816B7A4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0816B7C4
	ldr r0, _0816B7CC
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0816B7D0
	str r0, [r1]
_0816B7C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816B7CC: .4byte 0x03005B60
_0816B7D0: .4byte 0x0816B489
	thumb_func_end Mailbox_HandleReturnToProcessInput

	thumb_func_start Mailbox_MoveToBag
Mailbox_MoveToBag: @ 0x0816B7D4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0816B7E8
	ldr r2, _0816B7EC
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0816B7E8: .4byte 0x085CA99A
_0816B7EC: .4byte 0x0816B7F1
	thumb_func_end Mailbox_MoveToBag

	thumb_func_start Mailbox_DrawYesNoBeforeMove
Mailbox_DrawYesNoBeforeMove: @ 0x0816B7F0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _0816B810
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816B814
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816B810: .4byte 0x03005B60
_0816B814: .4byte 0x0816B819
	thumb_func_end Mailbox_DrawYesNoBeforeMove

	thumb_func_start Mailbox_MoveToBagYesNoPrompt
Mailbox_MoveToBagYesNoPrompt: @ 0x0816B818
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0816B844
	cmp r0, r1
	ble _0816B850
	cmp r0, #0
	beq _0816B83C
	cmp r0, #1
	beq _0816B84A
	b _0816B850
_0816B83C:
	adds r0, r4, #0
	bl Mailbox_DoMailMoveToBag
	b _0816B850
_0816B844:
	movs r0, #5
	bl PlaySE
_0816B84A:
	adds r0, r4, #0
	bl Mailbox_CancelMoveToBag
_0816B850:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Mailbox_MoveToBagYesNoPrompt

	thumb_func_start Mailbox_DoMailMoveToBag
Mailbox_DoMailMoveToBag: @ 0x0816B858
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _0816B894
	ldr r4, _0816B898
	ldrh r1, [r4]
	adds r1, #6
	ldrh r0, [r4, #2]
	adds r1, r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0816B89C
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldrh r0, [r5, #0x20]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816B8A8
	ldr r1, _0816B8A0
	ldr r2, _0816B8A4
	adds r0, r6, #0
	bl DisplayItemMessageOnField
	b _0816B8DC
	.align 2, 0
_0816B894: .4byte 0x03005AEC
_0816B898: .4byte 0x0203B984
_0816B89C: .4byte 0x00002BE0
_0816B8A0: .4byte 0x085CA9B3
_0816B8A4: .4byte 0x0816BA15
_0816B8A8:
	ldr r1, _0816B8E4
	ldr r2, _0816B8E8
	adds r0, r6, #0
	bl DisplayItemMessageOnField
	adds r0, r5, #0
	bl ClearMailStruct
	bl Mailbox_UpdateMailList
	ldrb r0, [r4, #5]
	subs r0, #1
	strb r0, [r4, #5]
	ldrb r1, [r4, #5]
	ldrb r0, [r4, #4]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	cmp r1, r0
	bge _0816B8D6
	cmp r2, #0
	beq _0816B8D6
	subs r0, r2, #1
	strh r0, [r4, #2]
_0816B8D6:
	adds r0, r6, #0
	bl ItemStorage_SetItemAndMailCount
_0816B8DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816B8E4: .4byte 0x085CA9C2
_0816B8E8: .4byte 0x0816BA15
	thumb_func_end Mailbox_DoMailMoveToBag

	thumb_func_start Mailbox_CancelMoveToBag
Mailbox_CancelMoveToBag: @ 0x0816B8EC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl Mailbox_Cancel
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Mailbox_CancelMoveToBag

	thumb_func_start Mailbox_Give
Mailbox_Give: @ 0x0816B8FC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816B914
	adds r0, r4, #0
	bl Mailbox_NoPokemonForMail
	b _0816B92A
_0816B914:
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r0, _0816B930
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0816B934
	str r0, [r1]
_0816B92A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816B930: .4byte 0x03005B60
_0816B934: .4byte 0x0816B939
	thumb_func_end Mailbox_Give

	thumb_func_start Mailbox_DoGiveMailPokeMenu
Mailbox_DoGiveMailPokeMenu: @ 0x0816B938
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0816B964
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816B95C
	bl sub_081D1508
	bl CleanupOverworldWindowsAndTilemaps
	bl sub_081B80E8
	adds r0, r4, #0
	bl DestroyTask
_0816B95C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816B964: .4byte 0x02037C74
	thumb_func_end Mailbox_DoGiveMailPokeMenu

	thumb_func_start Mailbox_ReturnToMailListAfterDeposit
Mailbox_ReturnToMailListAfterDeposit: @ 0x0816B968
	push {lr}
	ldr r0, _0816B97C
	ldr r1, _0816B980
	str r1, [r0]
	ldr r0, _0816B984
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0816B97C: .4byte 0x03005B0C
_0816B980: .4byte 0x0816B989
_0816B984: .4byte 0x08085A31
	thumb_func_end Mailbox_ReturnToMailListAfterDeposit

	thumb_func_start Mailbox_UpdateMailListAfterDeposit
Mailbox_UpdateMailListAfterDeposit: @ 0x0816B988
	push {r4, r5, r6, lr}
	ldr r0, _0816B9E0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _0816B9E4
	ldrb r4, [r5, #5]
	bl GetMailboxMailCount
	strb r0, [r5, #5]
	bl Mailbox_UpdateMailList
	ldrb r0, [r5, #5]
	cmp r4, r0
	beq _0816B9BE
	ldrb r1, [r5, #5]
	ldrb r0, [r5, #4]
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	cmp r1, r0
	bge _0816B9BE
	cmp r2, #0
	beq _0816B9BE
	subs r0, r2, #1
	strh r0, [r5, #2]
_0816B9BE:
	adds r0, r6, #0
	bl ItemStorage_SetItemAndMailCount
	bl sub_08196F98
	ldr r0, _0816B9E4
	ldrb r0, [r0, #5]
	bl sub_081D1340
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0816B9E8
	adds r0, r6, #0
	bl Mailbox_DrawMailboxMenu
	b _0816B9EE
	.align 2, 0
_0816B9E0: .4byte 0x0816B7A5
_0816B9E4: .4byte 0x0203B984
_0816B9E8:
	adds r0, r6, #0
	bl DestroyTask
_0816B9EE:
	bl pal_fill_black
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end Mailbox_UpdateMailListAfterDeposit

	thumb_func_start Mailbox_NoPokemonForMail
Mailbox_NoPokemonForMail: @ 0x0816B9F8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0816BA0C
	ldr r2, _0816BA10
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0816BA0C: .4byte 0x085C9472
_0816BA10: .4byte 0x0816BA15
	thumb_func_end Mailbox_NoPokemonForMail

	thumb_func_start Mailbox_Cancel
Mailbox_Cancel: @ 0x0816BA14
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	bl MoveRelearnerCursorCallback
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	adds r0, r4, #0
	bl Mailbox_DrawMailboxMenu
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0816BA4C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816BA50
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816BA4C: .4byte 0x03005B60
_0816BA50: .4byte 0x0816B489
	thumb_func_end Mailbox_Cancel

	thumb_func_start sub_0816BA54
sub_0816BA54: @ 0x0816BA54
	push {r4, lr}
	ldr r4, _0816BA8C
	movs r0, #0xce
	lsls r0, r0, #3
	bl AllocZeroed
	str r0, [r4]
	movs r1, #0xcc
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0xff
	movs r2, #6
	bl memset
	ldr r0, [r4]
	ldr r1, _0816BA90
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _0816BA94
	adds r0, r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816BA8C: .4byte 0x0203B990
_0816BA90: .4byte 0x00000666
_0816BA94: .4byte 0x00000667
	thumb_func_end sub_0816BA54

	thumb_func_start sub_0816BA98
sub_0816BA98: @ 0x0816BA98
	push {r4, lr}
	movs r4, #0
_0816BA9C:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0816BB04
	adds r4, #1
	cmp r4, #5
	bls _0816BA9C
	ldr r0, _0816BAB8
	ldr r0, [r0]
	bl Free
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816BAB8: .4byte 0x0203B990
	thumb_func_end sub_0816BA98

	thumb_func_start sub_0816BABC
sub_0816BABC: @ 0x0816BABC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0816BAFC
	movs r3, #0xcc
	lsls r3, r3, #3
	adds r1, r2, r3
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _0816BAF4
	lsls r0, r2, #3
	ldr r1, _0816BB00
	adds r0, r0, r1
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r2, #0x85
	lsls r2, r2, #2
	movs r1, #0
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
_0816BAF4:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0816BAFC: .4byte 0x0203B990
_0816BB00: .4byte 0x085C0C40
	thumb_func_end sub_0816BABC

	thumb_func_start sub_0816BB04
sub_0816BB04: @ 0x0816BB04
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0816BB40
	movs r2, #0xcc
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r1, [r1]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _0816BB38
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl ClearWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #0xff
	strb r0, [r4]
_0816BB38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816BB40: .4byte 0x0203B990
	thumb_func_end sub_0816BB04

	thumb_func_start ItemStorage_RefreshListMenu
ItemStorage_RefreshListMenu: @ 0x0816BB44
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r0, _0816BBF0
	ldrb r0, [r0, #5]
	subs r0, #1
	cmp r6, r0
	bge _0816BB98
	ldr r5, _0816BBF4
_0816BB54:
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	movs r0, #0xcc
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _0816BBF8
	ldr r1, [r1]
	lsls r2, r6, #2
	adds r1, r1, r2
	movs r2, #0x93
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CopyItemName_PlayerPC
	ldr r0, [r5]
	lsls r2, r6, #3
	adds r1, r0, r2
	adds r4, r0, r4
	str r4, [r1]
	adds r0, #4
	adds r0, r0, r2
	str r6, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0816BBF0
	ldrb r0, [r0, #5]
	subs r0, #1
	cmp r6, r0
	blt _0816BB54
_0816BB98:
	ldr r5, _0816BBF4
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	movs r3, #0xcc
	lsls r3, r3, #1
	adds r4, r4, r3
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _0816BBFC
	bl StringCopy
	ldr r0, [r5]
	lsls r2, r6, #3
	adds r1, r0, r2
	adds r4, r0, r4
	str r4, [r1]
	adds r0, #4
	adds r0, r0, r2
	movs r1, #2
	rsbs r1, r1, #0
	str r1, [r0]
	ldr r4, _0816BC00
	adds r1, r4, #0
	ldr r0, _0816BC04
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	movs r0, #0
	bl sub_0816BABC
	strb r0, [r4, #0x10]
	ldr r1, _0816BBF0
	ldrb r0, [r1, #5]
	strh r0, [r4, #0xc]
	ldr r0, [r5]
	str r0, [r4]
	ldrb r0, [r1, #4]
	strh r0, [r4, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816BBF0: .4byte 0x0203B984
_0816BBF4: .4byte 0x0203B990
_0816BBF8: .4byte 0x03005AEC
_0816BBFC: .4byte 0x085C93C8
_0816BC00: .4byte 0x03006050
_0816BC04: .4byte 0x085C0C28
	thumb_func_end ItemStorage_RefreshListMenu

	thumb_func_start CopyItemName_PlayerPC
CopyItemName_PlayerPC: @ 0x0816BC08
	push {lr}
	adds r2, r0, #0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r1, r2, #0
	bl CopyItemName
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CopyItemName_PlayerPC

	thumb_func_start ItemStorage_MoveCursor
ItemStorage_MoveCursor: @ 0x0816BC1C
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _0816BC2E
	movs r0, #5
	bl PlaySE
_0816BC2E:
	ldr r0, _0816BC60
	ldr r0, [r0]
	ldr r1, _0816BC64
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0816BC78
	bl sub_0816BEFC
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0816BC6C
	ldr r0, _0816BC68
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r0, r1
	movs r1, #0x93
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_0816BE94
	b _0816BC72
	.align 2, 0
_0816BC60: .4byte 0x0203B990
_0816BC64: .4byte 0x00000666
_0816BC68: .4byte 0x03005AEC
_0816BC6C:
	ldr r0, _0816BC80
	bl sub_0816BE94
_0816BC72:
	adds r0, r4, #0
	bl sub_0816BD24
_0816BC78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816BC80: .4byte 0x0000FFFF
	thumb_func_end ItemStorage_MoveCursor

	thumb_func_start fish4_goto_x5_or_x6
fish4_goto_x5_or_x6: @ 0x0816BC84
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0816BD06
	ldr r0, _0816BCBC
	ldr r0, [r0]
	ldr r1, _0816BCC0
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	beq _0816BCCE
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _0816BCC4
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xff
	bl sub_0816BE14
	b _0816BCCE
	.align 2, 0
_0816BCBC: .4byte 0x0203B990
_0816BCC0: .4byte 0x00000666
_0816BCC4:
	adds r0, r5, #0
	movs r1, #0xff
	movs r2, #0xff
	bl sub_0816BE14
_0816BCCE:
	ldr r0, _0816BD10
	ldr r1, _0816BD14
	ldr r1, [r1]
	lsls r2, r4, #2
	adds r1, r1, r2
	ldr r2, _0816BD18
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _0816BD1C
	ldr r1, _0816BD20
	adds r0, r4, #0
	bl StringExpandPlaceholders
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x50
	bl AddTextPrinterParameterized
_0816BD06:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816BD10: .4byte 0x02021C40
_0816BD14: .4byte 0x03005AEC
_0816BD18: .4byte 0x0000049A
_0816BD1C: .4byte 0x02021C7C
_0816BD20: .4byte 0x085C943C
	thumb_func_end fish4_goto_x5_or_x6

	thumb_func_start sub_0816BD24
sub_0816BD24: @ 0x0816BD24
	push {r4, r5, lr}
	sub sp, #0xc
	adds r1, r0, #0
	ldr r0, _0816BD54
	ldr r0, [r0]
	ldr r2, _0816BD58
	adds r0, r0, r2
	ldrb r5, [r0]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0816BD60
	ldr r0, _0816BD5C
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0x93
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	bl ItemId_GetHoldEffect
	b _0816BD66
	.align 2, 0
_0816BD54: .4byte 0x0203B990
_0816BD58: .4byte 0x00000661
_0816BD5C: .4byte 0x03005AEC
_0816BD60:
	ldr r0, _0816BD90
	bl ItemStorage_GetItemPcResponse
_0816BD66:
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816BD90: .4byte 0x0000FFFF
	thumb_func_end sub_0816BD24

	thumb_func_start ItemStorage_StartScrollIndicator
ItemStorage_StartScrollIndicator: @ 0x0816BD94
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0816BDC8
	ldrb r0, [r4, #9]
	cmp r0, #0xff
	bne _0816BDC0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	subs r0, r0, r1
	str r0, [sp]
	ldr r0, _0816BDCC
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #2
	str r0, [sp, #0xc]
	movs r0, #2
	movs r1, #0xb0
	movs r2, #0xc
	movs r3, #0x94
	bl AddScrollIndicatorArrowPairParameterized
	strb r0, [r4, #9]
_0816BDC0:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816BDC8: .4byte 0x0203B984
_0816BDCC: .4byte 0x000013F8
	thumb_func_end ItemStorage_StartScrollIndicator

	thumb_func_start ItemStorage_RemoveScrollIndicator
ItemStorage_RemoveScrollIndicator: @ 0x0816BDD0
	push {r4, lr}
	ldr r4, _0816BDE8
	ldrb r0, [r4, #9]
	cmp r0, #0xff
	beq _0816BDE2
	bl RemoveScrollIndicatorArrowPair
	movs r0, #0xff
	strb r0, [r4, #9]
_0816BDE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816BDE8: .4byte 0x0203B984
	thumb_func_end ItemStorage_RemoveScrollIndicator

	thumb_func_start sub_0816BDEC
sub_0816BDEC: @ 0x0816BDEC
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	bl ListMenuGetYCoordForPrintingArrowCursor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_0816BE14
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0816BDEC

	thumb_func_start sub_0816BE14
sub_0816BE14: @ 0x0816BE14
	push {r4, r5, r6, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0816BE60
	ldr r0, [r0]
	movs r3, #0xcc
	lsls r3, r3, #3
	adds r0, r0, r3
	ldrb r5, [r0]
	cmp r1, #0xff
	bne _0816BE64
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
	adds r0, r5, #0
	movs r1, #0x11
	movs r2, #0
	adds r3, r6, #0
	bl FillWindowPixelRect
	b _0816BE84
	.align 2, 0
_0816BE60: .4byte 0x0203B990
_0816BE64:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0816BE8C
	str r0, [sp, #8]
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0816BE90
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	adds r3, r6, #0
	bl AddTextPrinterParameterized4
_0816BE84:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816BE8C: .4byte 0x085C0C70
_0816BE90: .4byte 0x085C9421
	thumb_func_end sub_0816BE14

	thumb_func_start sub_0816BE94
sub_0816BE94: @ 0x0816BE94
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0816BEEC
	ldr r0, [r0]
	ldr r1, _0816BEF0
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _0816BEE6
	ldr r4, _0816BEF4
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
	beq _0816BEE6
	strb r2, [r5]
	ldr r0, _0816BEF8
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	movs r0, #0x18
	strh r0, [r1, #0x24]
	movs r0, #0x50
	strh r0, [r1, #0x26]
_0816BEE6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816BEEC: .4byte 0x0203B990
_0816BEF0: .4byte 0x00000667
_0816BEF4: .4byte 0x000013F6
_0816BEF8: .4byte 0x020205AC
	thumb_func_end sub_0816BE94

	thumb_func_start sub_0816BEFC
sub_0816BEFC: @ 0x0816BEFC
	push {r4, r5, lr}
	ldr r0, _0816BF34
	ldr r0, [r0]
	ldr r1, _0816BF38
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _0816BF2E
	ldr r4, _0816BF3C
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0816BF40
	adds r0, r0, r1
	bl DestroySprite
	movs r0, #0xff
	strb r0, [r5]
_0816BF2E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816BF34: .4byte 0x0203B990
_0816BF38: .4byte 0x00000667
_0816BF3C: .4byte 0x000013F6
_0816BF40: .4byte 0x020205AC
	thumb_func_end sub_0816BEFC

	thumb_func_start sub_0816BF44
sub_0816BF44: @ 0x0816BF44
	push {lr}
	sub sp, #4
	bl CompactPCItems
	ldr r0, _0816BF6C
	ldr r0, [r0]
	movs r1, #0x93
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r2, _0816BF70
	adds r3, r2, #1
	movs r1, #8
	str r1, [sp]
	movs r1, #0x32
	bl sub_08122218
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0816BF6C: .4byte 0x03005AEC
_0816BF70: .4byte 0x0203B988
	thumb_func_end sub_0816BF44

	thumb_func_start sub_0816BF74
sub_0816BF74: @ 0x0816BF74
	push {lr}
	ldr r0, _0816BF88
	subs r1, r0, #2
	ldrb r2, [r1, #4]
	ldrb r3, [r1, #5]
	bl sub_08122268
	pop {r0}
	bx r0
	.align 2, 0
_0816BF88: .4byte 0x0203B986
	thumb_func_end sub_0816BF74

	thumb_func_start ItemStorage_ProcessWithdrawTossInput
ItemStorage_ProcessWithdrawTossInput: @ 0x0816BF8C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0816BFD4
	adds r6, r0, r1
	movs r4, #0
_0816BFA0:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0816BABC
	adds r4, #1
	cmp r4, #3
	bls _0816BFA0
	movs r0, #6
	ldrsh r3, [r6, r0]
	cmp r3, #0
	bne _0816BFE4
	ldr r0, _0816BFD8
	ldr r0, [r0]
	ldr r1, _0816BFDC
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r2, _0816BFE0
	movs r1, #2
	str r1, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	b _0816C002
	.align 2, 0
_0816BFD4: .4byte 0x03005B68
_0816BFD8: .4byte 0x0203B990
_0816BFDC: .4byte 0x00000663
_0816BFE0: .4byte 0x085CA8C7
_0816BFE4:
	ldr r0, _0816C050
	ldr r0, [r0]
	ldr r1, _0816C054
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r2, _0816C058
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
_0816C002:
	ldr r0, _0816C050
	ldr r0, [r0]
	ldr r1, _0816C05C
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	bl sub_0816BF44
	bl sub_0816BF74
	bl ItemStorage_RefreshListMenu
	ldr r0, _0816C060
	ldr r2, _0816C064
	ldrh r1, [r2, #2]
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0xa]
	bl ItemStorage_StartScrollIndicator
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0816C068
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816C06C
	str r1, [r0]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816C050: .4byte 0x0203B990
_0816C054: .4byte 0x00000663
_0816C058: .4byte 0x085CA8D1
_0816C05C: .4byte 0x00000662
_0816C060: .4byte 0x03006050
_0816C064: .4byte 0x0203B984
_0816C068: .4byte 0x03005B60
_0816C06C: .4byte 0x0816C155
	thumb_func_end ItemStorage_ProcessWithdrawTossInput

	thumb_func_start ItemStorage_GetItemPcResponse
ItemStorage_GetItemPcResponse: @ 0x0816C070
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _0816C088
	adds r0, r1, r2
	cmp r0, #8
	bhi _0816C0FC
	lsls r0, r0, #2
	ldr r1, _0816C08C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816C088: .4byte 0xFFFF0009
_0816C08C: .4byte 0x0816C090
_0816C090: @ jump table
	.4byte _0816C0F4 @ case 0
	.4byte _0816C0EC @ case 1
	.4byte _0816C0E4 @ case 2
	.4byte _0816C0DC @ case 3
	.4byte _0816C0D4 @ case 4
	.4byte _0816C0CC @ case 5
	.4byte _0816C0C4 @ case 6
	.4byte _0816C0BC @ case 7
	.4byte _0816C0B4 @ case 8
_0816C0B4:
	ldr r0, _0816C0B8
	b _0816C102
	.align 2, 0
_0816C0B8: .4byte 0x085C9423
_0816C0BC:
	ldr r0, _0816C0C0
	b _0816C102
	.align 2, 0
_0816C0C0: .4byte 0x085CA938
_0816C0C4:
	ldr r0, _0816C0C8
	b _0816C102
	.align 2, 0
_0816C0C8: .4byte 0x085CA949
_0816C0CC:
	ldr r0, _0816C0D0
	b _0816C102
	.align 2, 0
_0816C0D0: .4byte 0x085C9523
_0816C0D4:
	ldr r0, _0816C0D8
	b _0816C102
	.align 2, 0
_0816C0D8: .4byte 0x085C9532
_0816C0DC:
	ldr r0, _0816C0E0
	b _0816C102
	.align 2, 0
_0816C0E0: .4byte 0x085CA925
_0816C0E4:
	ldr r0, _0816C0E8
	b _0816C102
	.align 2, 0
_0816C0E8: .4byte 0x085C9506
_0816C0EC:
	ldr r0, _0816C0F0
	b _0816C102
	.align 2, 0
_0816C0F0: .4byte 0x085C9540
_0816C0F4:
	ldr r0, _0816C0F8
	b _0816C102
	.align 2, 0
_0816C0F8: .4byte 0x085C947F
_0816C0FC:
	adds r0, r1, #0
	bl ItemId_GetHoldEffect
_0816C102:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ItemStorage_GetItemPcResponse

	thumb_func_start ItemStorage_PrintItemPcResponse
ItemStorage_PrintItemPcResponse: @ 0x0816C108
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, _0816C148
	ldr r0, [r0]
	ldr r1, _0816C14C
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r4, _0816C150
	adds r0, r4, #0
	adds r1, r6, #0
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816C148: .4byte 0x0203B990
_0816C14C: .4byte 0x00000661
_0816C150: .4byte 0x02021C7C
	thumb_func_end ItemStorage_PrintItemPcResponse

	thumb_func_start ItemStorage_ProcessInput
ItemStorage_ProcessInput: @ 0x0816C154
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0816C198
	adds r4, r0, r1
	ldr r0, _0816C19C
	ldrh r1, [r0, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0816C1A4
	ldrb r0, [r4, #0xa]
	ldr r1, _0816C1A0
	subs r4, r1, #2
	adds r2, r4, #0
	bl ListMenuGetScrollAndRow
	ldrh r1, [r4, #2]
	ldrh r0, [r4]
	adds r1, r1, r0
	ldrb r0, [r4, #5]
	subs r0, #1
	cmp r1, r0
	beq _0816C1E6
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl ItemStorage_ItemSwapChoosePrompt
	b _0816C1E6
	.align 2, 0
_0816C198: .4byte 0x03005B68
_0816C19C: .4byte 0x03002360
_0816C1A0: .4byte 0x0203B986
_0816C1A4:
	ldrb r0, [r4, #0xa]
	bl ListMenu_ProcessInput
	adds r6, r0, #0
	ldrb r0, [r4, #0xa]
	ldr r1, _0816C1C8
	subs r2, r1, #2
	bl ListMenuGetScrollAndRow
	movs r0, #2
	rsbs r0, r0, #0
	cmp r6, r0
	beq _0816C1CC
	adds r0, #1
	cmp r6, r0
	bne _0816C1DA
	b _0816C1E6
	.align 2, 0
_0816C1C8: .4byte 0x0203B986
_0816C1CC:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl ItemStorage_GoBackToPlayerPCMenu_InitStorage
	b _0816C1E6
_0816C1DA:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl ItemStorage_DoItemAction
_0816C1E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ItemStorage_ProcessInput

	thumb_func_start ItemStorage_GoBackToPlayerPCMenu_InitStorage
ItemStorage_GoBackToPlayerPCMenu_InitStorage: @ 0x0816C1EC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _0816C23C
	adds r4, r4, r0
	bl sub_0816BEFC
	bl ItemStorage_RemoveScrollIndicator
	ldrb r0, [r4, #0xa]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldr r0, _0816C240
	ldr r0, [r0]
	movs r1, #0xcd
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #7
	bl sub_081223BC
	bl sub_0816BA98
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0816C244
	adds r0, r5, #0
	movs r1, #0
	bl InitItemStorageMenu
	b _0816C24C
	.align 2, 0
_0816C23C: .4byte 0x03005B68
_0816C240: .4byte 0x0203B990
_0816C244:
	adds r0, r5, #0
	movs r1, #2
	bl InitItemStorageMenu
_0816C24C:
	ldr r0, _0816C260
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0816C264
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816C260: .4byte 0x03005B60
_0816C264: .4byte 0x0816B06D
	thumb_func_end ItemStorage_GoBackToPlayerPCMenu_InitStorage

	thumb_func_start ItemStorage_ItemSwapChoosePrompt
ItemStorage_ItemSwapChoosePrompt: @ 0x0816C268
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0816C2F4
	mov r8, r0
	adds r1, r4, #0
	add r1, r8
	mov sb, r1
	ldrb r0, [r1, #0xa]
	movs r1, #0x10
	movs r2, #1
	bl ListMenuSetUnkIndicatorsStructField
	ldr r6, _0816C2F8
	ldr r2, [r6]
	ldr r1, _0816C2FC
	ldrb r0, [r1]
	ldrb r1, [r1, #2]
	adds r0, r0, r1
	ldr r5, _0816C300
	adds r2, r2, r5
	strb r0, [r2]
	mov r1, sb
	ldrb r0, [r1, #0xa]
	movs r1, #0
	movs r2, #0
	bl sub_0816BDEC
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl sub_0816C4A8
	ldr r0, _0816C304
	ldr r1, [r0]
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0x93
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _0816C308
	bl CopyItemName
	ldr r0, _0816C30C
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	movs r1, #8
	rsbs r1, r1, #0
	add r8, r1
	add r4, r8
	ldr r0, _0816C310
	str r0, [r4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816C2F4: .4byte 0x03005B68
_0816C2F8: .4byte 0x0203B990
_0816C2FC: .4byte 0x0203B984
_0816C300: .4byte 0x00000666
_0816C304: .4byte 0x03005AEC
_0816C308: .4byte 0x02021C40
_0816C30C: .4byte 0x0000FFF7
_0816C310: .4byte 0x0816C315
	thumb_func_end ItemStorage_ItemSwapChoosePrompt

	thumb_func_start sub_0816C314
sub_0816C314: @ 0x0816C314
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0816C33C
	adds r4, r0, r1
	ldr r7, _0816C340
	ldrh r1, [r7, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0816C348
	ldrb r0, [r4, #0xa]
	ldr r1, _0816C344
	subs r2, r1, #2
	bl ListMenuGetScrollAndRow
	b _0816C396
	.align 2, 0
_0816C33C: .4byte 0x03005B68
_0816C340: .4byte 0x03002360
_0816C344: .4byte 0x0203B986
_0816C348:
	ldrb r0, [r4, #0xa]
	bl ListMenu_ProcessInput
	adds r6, r0, #0
	ldrb r0, [r4, #0xa]
	ldr r1, _0816C384
	subs r4, r1, #2
	adds r2, r4, #0
	bl ListMenuGetScrollAndRow
	ldr r0, _0816C388
	ldr r0, [r0]
	movs r1, #0xcd
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #7
	movs r2, #0
	bl sub_08122408
	ldrb r0, [r4]
	bl sub_0816C4A8
	movs r0, #2
	rsbs r0, r0, #0
	cmp r6, r0
	beq _0816C38C
	adds r0, #1
	cmp r6, r0
	bne _0816C3AA
	b _0816C3B2
	.align 2, 0
_0816C384: .4byte 0x0203B986
_0816C388: .4byte 0x0203B990
_0816C38C:
	ldrh r1, [r7, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0816C3A0
_0816C396:
	adds r0, r5, #0
	movs r1, #0
	bl ItemStorage_DoItemSwap
	b _0816C3B2
_0816C3A0:
	adds r0, r5, #0
	movs r1, #1
	bl ItemStorage_DoItemSwap
	b _0816C3B2
_0816C3AA:
	adds r0, r5, #0
	movs r1, #0
	bl ItemStorage_DoItemSwap
_0816C3B2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0816C314

	thumb_func_start ItemStorage_DoItemSwap
ItemStorage_DoItemSwap: @ 0x0816C3B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _0816C488
	adds r0, r0, r1
	mov r8, r0
	ldr r4, _0816C48C
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #5
	bl PlaySE
	mov r2, r8
	ldrb r0, [r2, #0xa]
	adds r1, r4, #2
	adds r2, r4, #0
	bl DestroyListMenuTask
	cmp r5, #0
	bne _0816C422
	ldr r1, _0816C490
	ldr r0, [r1]
	ldr r2, _0816C494
	adds r0, r0, r2
	ldrb r2, [r0]
	adds r4, r1, #0
	cmp r2, r6
	beq _0816C43A
	subs r0, r6, #1
	cmp r2, r0
	beq _0816C422
	ldr r0, _0816C498
	ldr r0, [r0]
	movs r1, #0x93
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r1, r2, #0
	adds r2, r6, #0
	bl MoveItemSlotInList
	bl ItemStorage_RefreshListMenu
_0816C422:
	ldr r0, _0816C490
	ldr r1, [r0]
	ldr r2, _0816C494
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, r6
	bhs _0816C43A
	ldr r1, _0816C48C
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0816C43A:
	ldr r0, [r4]
	movs r1, #0xcd
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #7
	movs r2, #1
	bl sub_08122408
	ldr r0, [r4]
	ldr r2, _0816C494
	adds r0, r0, r2
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0816C49C
	ldr r2, _0816C48C
	ldrh r1, [r2, #2]
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0816C4A0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816C4A4
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816C488: .4byte 0x03005B68
_0816C48C: .4byte 0x0203B984
_0816C490: .4byte 0x0203B990
_0816C494: .4byte 0x00000666
_0816C498: .4byte 0x03005AEC
_0816C49C: .4byte 0x03006050
_0816C4A0: .4byte 0x03005B60
_0816C4A4: .4byte 0x0816C155
	thumb_func_end ItemStorage_DoItemSwap

	thumb_func_start sub_0816C4A8
sub_0816C4A8: @ 0x0816C4A8
	push {lr}
	adds r3, r0, #0
	lsls r3, r3, #0x18
	ldr r0, _0816C4D0
	ldr r0, [r0]
	movs r1, #0xcd
	lsls r1, r1, #3
	adds r0, r0, r1
	lsrs r3, r3, #4
	movs r1, #0x80
	lsls r1, r1, #0xd
	adds r3, r3, r1
	lsrs r3, r3, #0x10
	movs r1, #7
	movs r2, #0x80
	bl sub_08122454
	pop {r0}
	bx r0
	.align 2, 0
_0816C4D0: .4byte 0x0203B990
	thumb_func_end sub_0816C4A8

	thumb_func_start sub_0816C4D4
sub_0816C4D4: @ 0x0816C4D4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x20]
	ldr r3, [sp, #0x24]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _0816C528
	bl ConvertIntToDecimalStringN
	ldr r0, _0816C52C
	mov r8, r0
	ldr r1, _0816C530
	bl StringExpandPlaceholders
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	mov r2, r8
	adds r3, r6, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816C528: .4byte 0x02021C40
_0816C52C: .4byte 0x02021C7C
_0816C530: .4byte 0x085C943C
	thumb_func_end sub_0816C4D4

	thumb_func_start ItemStorage_DoItemAction
ItemStorage_DoItemAction: @ 0x0816C534
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0816C57C
	adds r6, r0, r1
	ldr r1, _0816C580
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl ItemStorage_RemoveScrollIndicator
	movs r0, #1
	strh r0, [r6, #4]
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0816C5B0
	ldr r0, _0816C584
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r1, r1, r0
	ldr r2, _0816C588
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #1
	bne _0816C58C
	adds r0, r5, #0
	bl ItemStorage_DoItemWithdraw
	b _0816C616
	.align 2, 0
_0816C57C: .4byte 0x03005B68
_0816C580: .4byte 0x0203B984
_0816C584: .4byte 0x03005AEC
_0816C588: .4byte 0x0000049A
_0816C58C:
	movs r2, #0x93
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrh r0, [r0]
	ldr r1, _0816C5A8
	bl CopyItemName
	ldr r0, _0816C5AC
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	b _0816C5EC
	.align 2, 0
_0816C5A8: .4byte 0x02021C40
_0816C5AC: .4byte 0x0000FFFE
_0816C5B0:
	ldr r0, _0816C5CC
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r1, r1, r0
	ldr r2, _0816C5D0
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #1
	bne _0816C5D4
	adds r0, r5, #0
	bl ItemStorage_DoItemToss
	b _0816C616
	.align 2, 0
_0816C5CC: .4byte 0x03005AEC
_0816C5D0: .4byte 0x0000049A
_0816C5D4:
	movs r2, #0x93
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrh r0, [r0]
	ldr r1, _0816C620
	bl CopyItemName
	ldr r0, _0816C624
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
_0816C5EC:
	movs r0, #4
	bl sub_0816BABC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #4]
	movs r2, #2
	str r2, [sp]
	movs r2, #3
	str r2, [sp, #4]
	movs r2, #2
	movs r3, #8
	bl sub_0816C4D4
	ldr r1, _0816C628
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816C62C
	str r1, [r0]
_0816C616:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816C620: .4byte 0x02021C40
_0816C624: .4byte 0x0000FFFC
_0816C628: .4byte 0x03005B60
_0816C62C: .4byte 0x0816C631
	thumb_func_end ItemStorage_DoItemAction

	thumb_func_start ItemStorage_HandleQuantityRolling
ItemStorage_HandleQuantityRolling: @ 0x0816C630
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0816C68C
	adds r5, r0, r1
	ldr r0, _0816C690
	ldrh r2, [r0, #2]
	ldrh r0, [r0]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	adds r0, r5, #4
	ldr r7, _0816C694
	ldr r1, [r7]
	lsrs r6, r2, #0xe
	adds r1, r1, r6
	ldr r2, _0816C698
	adds r1, r1, r2
	ldrh r1, [r1]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0816C69C
	movs r0, #4
	bl sub_0816BABC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #4]
	movs r2, #2
	str r2, [sp]
	movs r2, #3
	str r2, [sp, #4]
	movs r2, #2
	movs r3, #8
	bl sub_0816C4D4
	b _0816C6FE
	.align 2, 0
_0816C68C: .4byte 0x03005B68
_0816C690: .4byte 0x0203B984
_0816C694: .4byte 0x03005AEC
_0816C698: .4byte 0x0000049A
_0816C69C:
	ldr r0, _0816C6C4
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0816C6D0
	movs r0, #5
	bl PlaySE
	movs r0, #4
	bl sub_0816BB04
	movs r1, #6
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0816C6C8
	adds r0, r4, #0
	bl ItemStorage_DoItemWithdraw
	b _0816C6FE
	.align 2, 0
_0816C6C4: .4byte 0x03002360
_0816C6C8:
	adds r0, r4, #0
	bl ItemStorage_DoItemToss
	b _0816C6FE
_0816C6D0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0816C6FE
	movs r0, #5
	bl PlaySE
	movs r0, #4
	bl sub_0816BB04
	ldr r0, [r7]
	adds r0, r0, r6
	movs r2, #0x93
	lsls r2, r2, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	mov r0, r8
	bl ItemStorage_StartScrollIndicatorAndProcessInput
_0816C6FE:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ItemStorage_HandleQuantityRolling

	thumb_func_start ItemStorage_DoItemWithdraw
ItemStorage_DoItemWithdraw: @ 0x0816C70C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r6, r1, #3
	ldr r0, _0816C780
	mov r8, r0
	adds r4, r6, r0
	ldr r0, _0816C784
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r7, _0816C788
	ldr r0, [r7]
	lsrs r5, r1, #0xe
	adds r0, r0, r5
	movs r1, #0x93
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4, #4]
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0816C79C
	ldr r0, [r7]
	adds r0, r0, r5
	movs r2, #0x93
	lsls r2, r2, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _0816C78C
	bl CopyItemName
	ldr r0, _0816C790
	movs r2, #4
	ldrsh r1, [r4, r2]
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, _0816C794
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	mov r0, r8
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _0816C798
	b _0816C7B2
	.align 2, 0
_0816C780: .4byte 0x03005B68
_0816C784: .4byte 0x0203B984
_0816C788: .4byte 0x03005AEC
_0816C78C: .4byte 0x02021C40
_0816C790: .4byte 0x02021C54
_0816C794: .4byte 0x0000FFFD
_0816C798: .4byte 0x0816C915
_0816C79C:
	movs r0, #0
	strh r0, [r4, #4]
	ldr r0, _0816C7C0
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	mov r0, r8
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _0816C7C4
_0816C7B2:
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816C7C0: .4byte 0x0000FFFA
_0816C7C4: .4byte 0x0816C985
	thumb_func_end ItemStorage_DoItemWithdraw

	thumb_func_start ItemStorage_DoItemToss
ItemStorage_DoItemToss: @ 0x0816C7C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	mov r8, r0
	ldr r0, _0816C854
	mov sb, r0
	mov r7, r8
	add r7, sb
	ldr r0, _0816C858
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r6, _0816C85C
	ldr r0, [r6]
	lsrs r4, r1, #0xe
	adds r0, r0, r4
	movs r1, #0x93
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	bl ItemId_GetHoldEffectParam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816C874
	ldr r0, [r6]
	adds r0, r0, r4
	movs r2, #0x93
	lsls r2, r2, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _0816C860
	bl CopyItemName
	ldr r0, _0816C864
	movs r2, #4
	ldrsh r1, [r7, r2]
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, _0816C868
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	ldr r1, _0816C86C
	movs r0, #2
	str r0, [sp]
	movs r0, #0x85
	lsls r0, r0, #2
	str r0, [sp, #4]
	movs r0, #0xe
	str r0, [sp, #8]
	ldr r0, _0816C870
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0
	bl CreateYesNoMenuWithCallbacks
	b _0816C88C
	.align 2, 0
_0816C854: .4byte 0x03005B68
_0816C858: .4byte 0x0203B984
_0816C85C: .4byte 0x03005AEC
_0816C860: .4byte 0x02021C40
_0816C864: .4byte 0x02021C54
_0816C868: .4byte 0x0000FFF8
_0816C86C: .4byte 0x085C0C68
_0816C870: .4byte 0x085C0C20
_0816C874:
	movs r0, #0
	strh r0, [r7, #4]
	ldr r0, _0816C89C
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	mov r0, sb
	subs r0, #8
	add r0, r8
	ldr r1, _0816C8A0
	str r1, [r0]
_0816C88C:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816C89C: .4byte 0x0000FFF9
_0816C8A0: .4byte 0x0816C985
	thumb_func_end ItemStorage_DoItemToss

	thumb_func_start ItemStorage_ResumeInputFromYesToss
ItemStorage_ResumeInputFromYesToss: @ 0x0816C8A4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0816C8CC
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	ldr r1, _0816C8D0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816C8D4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816C8CC: .4byte 0x0000FFFB
_0816C8D0: .4byte 0x03005B60
_0816C8D4: .4byte 0x0816C915
	thumb_func_end ItemStorage_ResumeInputFromYesToss

	thumb_func_start ItemStorage_ResumeInputFromNoToss
ItemStorage_ResumeInputFromNoToss: @ 0x0816C8D8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0816C90C
	ldr r2, [r0]
	ldr r1, _0816C910
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	movs r0, #0x93
	lsls r0, r0, #3
	adds r2, r2, r0
	ldrh r0, [r2]
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	adds r0, r4, #0
	bl ItemStorage_StartScrollIndicatorAndProcessInput
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816C90C: .4byte 0x03005AEC
_0816C910: .4byte 0x0203B984
	thumb_func_end ItemStorage_ResumeInputFromNoToss

	thumb_func_start ItemStorage_HandleRemoveItem
ItemStorage_HandleRemoveItem: @ 0x0816C914
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0816C974
	adds r5, r0, r1
	ldr r0, _0816C978
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0816C96E
	ldr r4, _0816C97C
	ldrb r0, [r4, #2]
	ldrb r1, [r4]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #4]
	bl RemovePCItem
	ldrb r0, [r5, #0xa]
	adds r1, r4, #2
	adds r2, r4, #0
	bl DestroyListMenuTask
	bl sub_0816BF44
	bl sub_0816BF74
	bl ItemStorage_RefreshListMenu
	ldr r0, _0816C980
	ldrh r1, [r4, #2]
	ldrh r2, [r4]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xa]
	adds r0, r6, #0
	bl ItemStorage_StartScrollIndicatorAndProcessInput
_0816C96E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816C974: .4byte 0x03005B68
_0816C978: .4byte 0x03002360
_0816C97C: .4byte 0x0203B984
_0816C980: .4byte 0x03006050
	thumb_func_end ItemStorage_HandleRemoveItem

	thumb_func_start ItemStorage_WaitPressHandleResumeProcessInput
ItemStorage_WaitPressHandleResumeProcessInput: @ 0x0816C984
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0816C9C4
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0816C9BC
	ldr r0, _0816C9C8
	ldr r2, [r0]
	ldr r1, _0816C9CC
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	movs r0, #0x93
	lsls r0, r0, #3
	adds r2, r2, r0
	ldrh r0, [r2]
	bl ItemStorage_GetItemPcResponse
	bl ItemStorage_PrintItemPcResponse
	adds r0, r4, #0
	bl ItemStorage_StartScrollIndicatorAndProcessInput
_0816C9BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816C9C4: .4byte 0x03002360
_0816C9C8: .4byte 0x03005AEC
_0816C9CC: .4byte 0x0203B984
	thumb_func_end ItemStorage_WaitPressHandleResumeProcessInput

	thumb_func_start ItemStorage_StartScrollIndicatorAndProcessInput
ItemStorage_StartScrollIndicatorAndProcessInput: @ 0x0816C9D0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ItemStorage_StartScrollIndicator
	ldr r1, _0816C9F0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816C9F4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816C9F0: .4byte 0x03005B60
_0816C9F4: .4byte 0x0816C155
	thumb_func_end ItemStorage_StartScrollIndicatorAndProcessInput

