.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitDecorationContextItems
InitDecorationContextItems: @ 0x08126950
	push {lr}
	ldr r3, _08126998
	ldrb r0, [r3]
	cmp r0, #7
	bhi _08126966
	ldr r2, _0812699C
	ldr r1, _081269A0
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
_08126966:
	ldr r2, _081269A4
	ldrb r0, [r2, #9]
	cmp r0, #0
	bne _0812697E
	ldr r0, _081269A8
	ldr r0, [r0]
	ldr r3, _081269AC
	adds r1, r0, r3
	str r1, [r2]
	ldr r1, _081269B0
	adds r0, r0, r1
	str r0, [r2, #4]
_0812697E:
	ldrb r0, [r2, #9]
	cmp r0, #1
	bne _08126994
	ldr r0, _081269A8
	ldr r0, [r0]
	ldr r3, _081269B4
	adds r1, r0, r3
	str r1, [r2]
	ldr r1, _081269B8
	adds r0, r0, r1
	str r0, [r2, #4]
_08126994:
	pop {r0}
	bx r0
	.align 2, 0
_08126998: .4byte 0x02039E3F
_0812699C: .4byte 0x02039E18
_081269A0: .4byte 0x0203B90C
_081269A4: .4byte 0x02039E48
_081269A8: .4byte 0x03005AEC
_081269AC: .4byte 0x00001AAE
_081269B0: .4byte 0x00001ABE
_081269B4: .4byte 0x0000271C
_081269B8: .4byte 0x00002728
	thumb_func_end InitDecorationContextItems

	thumb_func_start sub_081269BC
sub_081269BC: @ 0x081269BC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _081269F0
	adds r4, r0, r4
	lsls r0, r0, #3
	ldr r1, _081269F4
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
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081269F0: .4byte 0x02039E54
_081269F4: .4byte 0x08581A74
	thumb_func_end sub_081269BC

	thumb_func_start RemoveDecorationWindow
RemoveDecorationWindow: @ 0x081269F8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08126A24
	adds r4, r4, r0
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126A24: .4byte 0x02039E54
	thumb_func_end RemoveDecorationWindow

	thumb_func_start AddDecorationActionsWindow
AddDecorationActionsWindow: @ 0x08126A28
	push {r4, r5, r6, lr}
	sub sp, #0xc
	movs r0, #0
	bl sub_081269BC
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r6, #0x10
	str r6, [sp]
	movs r5, #4
	str r5, [sp, #4]
	ldr r0, _08126A7C
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl PrintTextArray
	str r6, [sp]
	str r5, [sp, #4]
	ldr r0, _08126A80
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08126A7C: .4byte 0x08581A2C
_08126A80: .4byte 0x02039E1C
	thumb_func_end AddDecorationActionsWindow

	thumb_func_start InitDecorationActionsWindow
InitDecorationActionsWindow: @ 0x08126A84
	push {lr}
	ldr r1, _08126A9C
	movs r0, #0
	strb r0, [r1]
	bl ScriptContext2_Enable
	bl AddDecorationActionsWindow
	bl PrintCurMainMenuDescription
	pop {r0}
	bx r0
	.align 2, 0
_08126A9C: .4byte 0x02039E1C
	thumb_func_end InitDecorationActionsWindow

	thumb_func_start DoSecretBaseDecorationMenu
DoSecretBaseDecorationMenu: @ 0x08126AA0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl InitDecorationActionsWindow
	ldr r2, _08126ADC
	ldr r0, _08126AE0
	ldr r0, [r0]
	ldr r3, _08126AE4
	adds r1, r0, r3
	str r1, [r2]
	ldr r1, _08126AE8
	adds r0, r0, r1
	str r0, [r2, #4]
	movs r1, #0
	movs r0, #0x10
	strb r0, [r2, #8]
	strb r1, [r2, #9]
	ldr r1, _08126AEC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08126AF0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126ADC: .4byte 0x02039E48
_08126AE0: .4byte 0x03005AEC
_08126AE4: .4byte 0x00001AAE
_08126AE8: .4byte 0x00001ABE
_08126AEC: .4byte 0x03005B60
_08126AF0: .4byte 0x08126B49
	thumb_func_end DoSecretBaseDecorationMenu

	thumb_func_start DoPlayerRoomDecorationMenu
DoPlayerRoomDecorationMenu: @ 0x08126AF4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl InitDecorationActionsWindow
	ldr r2, _08126B30
	ldr r0, _08126B34
	ldr r0, [r0]
	ldr r3, _08126B38
	adds r1, r0, r3
	str r1, [r2]
	ldr r1, _08126B3C
	adds r0, r0, r1
	str r0, [r2, #4]
	movs r0, #0xc
	strb r0, [r2, #8]
	movs r0, #1
	strb r0, [r2, #9]
	ldr r1, _08126B40
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08126B44
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126B30: .4byte 0x02039E48
_08126B34: .4byte 0x03005AEC
_08126B38: .4byte 0x0000271C
_08126B3C: .4byte 0x00002728
_08126B40: .4byte 0x03005B60
_08126B44: .4byte 0x08126B49
	thumb_func_end DoPlayerRoomDecorationMenu

	thumb_func_start HandleDecorationActionsMenuInput
HandleDecorationActionsMenuInput: @ 0x08126B48
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08126B94
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08126BC8
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInput
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08126BA0
	adds r0, #1
	cmp r1, r0
	beq _08126BBC
	movs r0, #5
	bl PlaySE
	ldr r1, _08126B98
	ldr r0, _08126B9C
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	b _08126BC8
	.align 2, 0
_08126B94: .4byte 0x02037C74
_08126B98: .4byte 0x08581A2C
_08126B9C: .4byte 0x02039E1C
_08126BA0:
	bl Menu_GetCursorPos
	ldr r1, _08126BB8
	strb r0, [r1]
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	beq _08126BC8
	bl PrintCurMainMenuDescription
	b _08126BC8
	.align 2, 0
_08126BB8: .4byte 0x02039E1C
_08126BBC:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl DecorationMenuAction_Cancel
_08126BC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end HandleDecorationActionsMenuInput

	thumb_func_start PrintCurMainMenuDescription
PrintCurMainMenuDescription: @ 0x08126BD0
	push {lr}
	sub sp, #0x10
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r1, _08126C08
	ldr r0, _08126C0C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
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
	movs r3, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08126C08: .4byte 0x08581A4C
_08126C0C: .4byte 0x02039E1C
	thumb_func_end PrintCurMainMenuDescription

	thumb_func_start DecorationMenuAction_Decorate
DecorationMenuAction_Decorate: @ 0x08126C10
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl GetNumOwnedDecorations
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08126C44
	ldr r4, _08126C38
	ldr r1, _08126C3C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08126C40
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
	b _08126C5E
	.align 2, 0
_08126C38: .4byte 0x02021C7C
_08126C3C: .4byte 0x085CA70B
_08126C40: .4byte 0x08126D6D
_08126C44:
	ldr r1, _08126C64
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x1e]
	ldr r0, _08126C68
	strb r2, [r0]
	adds r0, r5, #0
	bl SecretBasePC_PrepMenuForSelectingStoredDecors
_08126C5E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126C64: .4byte 0x03005B60
_08126C68: .4byte 0x02039E3F
	thumb_func_end DecorationMenuAction_Decorate

	thumb_func_start DecorationMenuAction_PutAway
DecorationMenuAction_PutAway: @ 0x08126C6C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl sub_0812999C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08126CA0
	ldr r4, _08126C94
	ldr r1, _08126C98
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08126C9C
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
	b _08126CC8
	.align 2, 0
_08126C94: .4byte 0x02021C7C
_08126C98: .4byte 0x085CA87A
_08126C9C: .4byte 0x08126D6D
_08126CA0:
	movs r0, #0
	bl RemoveDecorationWindow
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r1, _08126CD0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _08126CD4
	str r1, [r0]
_08126CC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126CD0: .4byte 0x03005B60
_08126CD4: .4byte 0x08129AAD
	thumb_func_end DecorationMenuAction_PutAway

	thumb_func_start DecorationMenuAction_Toss
DecorationMenuAction_Toss: @ 0x08126CD8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl GetNumOwnedDecorations
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08126D0C
	ldr r4, _08126D00
	ldr r1, _08126D04
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08126D08
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
	b _08126D26
	.align 2, 0
_08126D00: .4byte 0x02021C7C
_08126D04: .4byte 0x085CA70B
_08126D08: .4byte 0x08126D6D
_08126D0C:
	ldr r1, _08126D2C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #1
	strh r1, [r0, #0x1e]
	ldr r0, _08126D30
	strb r2, [r0]
	adds r0, r5, #0
	bl SecretBasePC_PrepMenuForSelectingStoredDecors
_08126D26:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126D2C: .4byte 0x03005B60
_08126D30: .4byte 0x02039E3F
	thumb_func_end DecorationMenuAction_Toss

	thumb_func_start DecorationMenuAction_Cancel
DecorationMenuAction_Cancel: @ 0x08126D34
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	bl RemoveDecorationWindow
	ldr r0, _08126D58
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _08126D60
	ldr r0, _08126D5C
	bl ScriptContext1_SetupScript
	adds r0, r4, #0
	bl DestroyTask
	b _08126D66
	.align 2, 0
_08126D58: .4byte 0x02039E48
_08126D5C: .4byte 0x0821D3D7
_08126D60:
	adds r0, r4, #0
	bl ReshowPlayerPC
_08126D66:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DecorationMenuAction_Cancel

	thumb_func_start ReturnToDecorationActionsAfterInvalidSelection
ReturnToDecorationActionsAfterInvalidSelection: @ 0x08126D6C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl PrintCurMainMenuDescription
	ldr r1, _08126D8C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08126D90
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126D8C: .4byte 0x03005B60
_08126D90: .4byte 0x08126B49
	thumb_func_end ReturnToDecorationActionsAfterInvalidSelection

	thumb_func_start SecretBasePC_PrepMenuForSelectingStoredDecors
SecretBasePC_PrepMenuForSelectingStoredDecors: @ 0x08126D94
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08126DC0
	movs r1, #0xd0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	movs r0, #0
	bl RemoveDecorationWindow
	adds r0, r4, #0
	bl sub_08126DC4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126DC0: .4byte 0x08581A94
	thumb_func_end SecretBasePC_PrepMenuForSelectingStoredDecors

	thumb_func_start sub_08126DC4
sub_08126DC4: @ 0x08126DC4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl sub_081269BC
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r4, #0
	bl PrintDecorationCategoryMenuItems
	movs r0, #0x10
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	ldr r0, _08126E10
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	ldr r1, _08126E14
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08126E18
	str r1, [r0]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126E10: .4byte 0x02039E3F
_08126E14: .4byte 0x03005B60
_08126E18: .4byte 0x08127041
	thumb_func_end sub_08126DC4

	thumb_func_start sub_08126E1C
sub_08126E1C: @ 0x08126E1C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _08126E68
	ldrb r0, [r5, #1]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	bl PrintDecorationCategoryMenuItems
	ldrb r0, [r5, #1]
	movs r1, #0x10
	str r1, [sp]
	movs r1, #9
	str r1, [sp, #4]
	ldr r1, _08126E6C
	ldrb r1, [r1]
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	ldr r1, _08126E70
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08126E74
	str r1, [r0]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126E68: .4byte 0x02039E54
_08126E6C: .4byte 0x02039E3F
_08126E70: .4byte 0x03005B60
_08126E74: .4byte 0x08127041
	thumb_func_end sub_08126E1C

	thumb_func_start PrintDecorationCategoryMenuItems
PrintDecorationCategoryMenuItems: @ 0x08126E78
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08126EC8
	adds r1, r1, r0
	ldr r0, _08126ECC
	ldrb r5, [r0, #1]
	ldr r0, _08126ED0
	ldrb r0, [r0, #9]
	movs r7, #0
	cmp r0, #1
	bne _08126EA2
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08126EA2
	movs r7, #1
_08126EA2:
	movs r4, #0
	movs r6, #0xff
_08126EA6:
	cmp r7, #1
	bne _08126ED4
	cmp r4, #6
	beq _08126ED4
	cmp r4, #7
	beq _08126ED4
	lsls r3, r4, #0x1c
	lsrs r3, r3, #0x18
	str r7, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl PrintDecorationCategoryMenuItem
	b _08126EE8
	.align 2, 0
_08126EC8: .4byte 0x03005B68
_08126ECC: .4byte 0x02039E54
_08126ED0: .4byte 0x02039E48
_08126ED4:
	lsls r3, r4, #0x1c
	lsrs r3, r3, #0x18
	movs r0, #0
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl PrintDecorationCategoryMenuItem
_08126EE8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _08126EA6
	ldr r2, _08126F1C
	lsls r0, r4, #4
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126F1C: .4byte 0x085C93C4
	thumb_func_end PrintDecorationCategoryMenuItems

	thumb_func_start PrintDecorationCategoryMenuItem
PrintDecorationCategoryMenuItem: @ 0x08126F20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	mov sl, r2
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r2, _08126FF4
	mov r8, r2
	mov r0, r8
	bl ColorMenuItemString
	ldr r0, _08126FF8
	mov sb, r0
	mov r1, r8
	bl StringCopy
	ldr r1, _08126FFC
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	mov r0, sb
	bl StringAppend
	adds r5, #2
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp]
	mov r2, sl
	str r2, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	mov r2, sb
	adds r3, r6, #0
	bl AddTextPrinterParameterized
	ldr r2, _08127000
	mov r8, r2
	adds r0, r4, #0
	bl GetNumOwnedDecorationsInCategory
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _08127004
	ldr r1, _08127008
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrb r1, [r4, #4]
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r1, _0812700C
	mov r0, sb
	bl StringExpandPlaceholders
	adds r6, #0x30
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r5, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	mov r2, sb
	adds r3, r6, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126FF4: .4byte 0x02021C68
_08126FF8: .4byte 0x02021C7C
_08126FFC: .4byte 0x08581A0C
_08127000: .4byte 0x02021C40
_08127004: .4byte 0x02021C54
_08127008: .4byte 0x0203B90C
_0812700C: .4byte 0x085CA6A4
	thumb_func_end PrintDecorationCategoryMenuItem

	thumb_func_start ColorMenuItemString
ColorMenuItemString: @ 0x08127010
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0812702C
	bl StringCopy
	cmp r4, #1
	bne _08127030
	movs r0, #4
	strb r0, [r5, #2]
	movs r0, #5
	b _08127036
	.align 2, 0
_0812702C: .4byte 0x085CA6C6
_08127030:
	movs r0, #2
	strb r0, [r5, #2]
	movs r0, #3
_08127036:
	strb r0, [r5, #5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ColorMenuItemString

	thumb_func_start HandleDecorationCategoriesMenuInput
HandleDecorationCategoriesMenuInput: @ 0x08127040
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08127070
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08127096
	bl Menu_ProcessInput
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08127078
	cmp r1, r0
	bgt _08127074
	subs r0, #1
	cmp r1, r0
	beq _08127096
	b _08127086
	.align 2, 0
_08127070: .4byte 0x02037C74
_08127074:
	cmp r1, #8
	bne _08127086
_08127078:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl ExitDecorationCategoriesMenu
	b _08127096
_08127086:
	movs r0, #5
	bl PlaySE
	ldr r0, _0812709C
	strb r4, [r0]
	adds r0, r5, #0
	bl SelectDecorationCategory
_08127096:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812709C: .4byte 0x02039E3F
	thumb_func_end HandleDecorationCategoriesMenuInput

	thumb_func_start SelectDecorationCategory
SelectDecorationCategory: @ 0x081270A0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _081270EC
	ldrb r0, [r4]
	bl GetNumOwnedDecorationsInCategory
	ldr r1, _081270F0
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812710C
	ldrb r0, [r4]
	bl CondenseDecorationsInCategory
	ldr r2, _081270F4
	ldr r1, _081270F8
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	adds r0, r5, #0
	bl IdentifyOwnedDecorationsCurrentlyInUse
	ldr r0, _081270FC
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08127100
	strh r1, [r0]
	ldr r1, _08127104
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08127108
	str r1, [r0]
	b _08127126
	.align 2, 0
_081270EC: .4byte 0x02039E3F
_081270F0: .4byte 0x02039E1D
_081270F4: .4byte 0x02039E18
_081270F8: .4byte 0x0203B90C
_081270FC: .4byte 0x02039E3C
_08127100: .4byte 0x02039E3A
_08127104: .4byte 0x03005B60
_08127108: .4byte 0x081275CD
_0812710C:
	movs r0, #1
	bl RemoveDecorationWindow
	ldr r4, _0812712C
	ldr r1, _08127130
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08127134
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
_08127126:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812712C: .4byte 0x02021C7C
_08127130: .4byte 0x085CA70B
_08127134: .4byte 0x08127139
	thumb_func_end SelectDecorationCategory

	thumb_func_start ReturnToDecorationCategoriesAfterInvalidSelection
ReturnToDecorationCategoriesAfterInvalidSelection: @ 0x08127138
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	adds r0, r4, #0
	bl sub_08126DC4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ReturnToDecorationCategoriesAfterInvalidSelection

	thumb_func_start ExitDecorationCategoriesMenu
ExitDecorationCategoriesMenu: @ 0x08127154
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08127174
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x1e
	ldrsh r0, [r0, r1]
	cmp r0, #2
	beq _08127178
	adds r0, r2, #0
	bl ReturnToActionsMenuFromCategories
	b _0812717E
	.align 2, 0
_08127174: .4byte 0x03005B60
_08127178:
	adds r0, r2, #0
	bl ExitTraderDecorationMenu
_0812717E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ExitDecorationCategoriesMenu

	thumb_func_start ReturnToActionsMenuFromCategories
ReturnToActionsMenuFromCategories: @ 0x08127184
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl RemoveDecorationWindow
	bl AddDecorationActionsWindow
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	bl PrintCurMainMenuDescription
	ldr r1, _081271B8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081271BC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081271B8: .4byte 0x03005B60
_081271BC: .4byte 0x08126B49
	thumb_func_end ReturnToActionsMenuFromCategories

	thumb_func_start ShowDecorationCategoriesWindow
ShowDecorationCategoriesWindow: @ 0x081271C0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081271FC
	movs r1, #0xd0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	ldr r1, _08127200
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #2
	strh r1, [r0, #0x1e]
	ldr r0, _08127204
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_08126DC4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081271FC: .4byte 0x08581A94
_08127200: .4byte 0x03005B60
_08127204: .4byte 0x02039E3F
	thumb_func_end ShowDecorationCategoriesWindow

	thumb_func_start CopyDecorationCategoryName
CopyDecorationCategoryName: @ 0x08127208
	push {lr}
	lsls r1, r1, #0x18
	ldr r2, _0812721C
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_0812721C: .4byte 0x08581A0C
	thumb_func_end CopyDecorationCategoryName

	thumb_func_start ExitTraderDecorationMenu
ExitTraderDecorationMenu: @ 0x08127220
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl RemoveDecorationWindow
	adds r0, r4, #0
	bl ExitTraderMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ExitTraderDecorationMenu

	thumb_func_start InitDecorationItemsMenuLimits
InitDecorationItemsMenuLimits: @ 0x0812723C
	push {lr}
	ldr r3, _08127264
	ldr r2, [r3]
	ldr r0, _08127268
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0xf6
	lsls r1, r1, #2
	adds r2, r2, r1
	strb r0, [r2]
	ldr r0, [r3]
	adds r1, r0, r1
	ldrb r1, [r1]
	cmp r1, #8
	bls _08127270
	ldr r2, _0812726C
	adds r1, r0, r2
	movs r0, #8
	strb r0, [r1]
	b _08127276
	.align 2, 0
_08127264: .4byte 0x02039E58
_08127268: .4byte 0x02039E1D
_0812726C: .4byte 0x000003D9
_08127270:
	ldr r2, _0812727C
	adds r0, r0, r2
	strb r1, [r0]
_08127276:
	pop {r0}
	bx r0
	.align 2, 0
_0812727C: .4byte 0x000003D9
	thumb_func_end InitDecorationItemsMenuLimits

	thumb_func_start sub_08127280
sub_08127280: @ 0x08127280
	push {r4, lr}
	ldr r0, _081272A0
	ldr r1, _081272A4
	ldr r2, _081272A8
	ldr r3, [r2]
	ldr r4, _081272AC
	adds r2, r3, r4
	ldrb r2, [r2]
	subs r4, #1
	adds r3, r3, r4
	ldrb r3, [r3]
	bl sub_08122268
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081272A0: .4byte 0x02039E3C
_081272A4: .4byte 0x02039E3A
_081272A8: .4byte 0x02039E58
_081272AC: .4byte 0x000003D9
	thumb_func_end sub_08127280

	thumb_func_start sub_081272B0
sub_081272B0: @ 0x081272B0
	push {r4, lr}
	sub sp, #4
	ldr r0, _081272D8
	ldr r1, _081272DC
	ldr r2, _081272E0
	ldr r3, [r2]
	ldr r4, _081272E4
	adds r2, r3, r4
	ldrb r2, [r2]
	subs r4, #1
	adds r3, r3, r4
	ldrb r3, [r3]
	movs r4, #8
	str r4, [sp]
	bl sub_081222A4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081272D8: .4byte 0x02039E3C
_081272DC: .4byte 0x02039E3A
_081272E0: .4byte 0x02039E58
_081272E4: .4byte 0x000003D9
	thumb_func_end sub_081272B0

	thumb_func_start PrintDecorationItemMenuItems
PrintDecorationItemMenuItems: @ 0x081272E8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08127320
	adds r1, r1, r0
	ldr r0, _08127324
	ldrb r0, [r0]
	subs r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08127330
	ldr r0, _08127328
	ldrb r0, [r0, #9]
	cmp r0, #1
	bne _08127330
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08127330
	ldr r0, _0812732C
	movs r1, #1
	bl ColorMenuItemString
	b _08127338
	.align 2, 0
_08127320: .4byte 0x03005B68
_08127324: .4byte 0x02039E3F
_08127328: .4byte 0x02039E48
_0812732C: .4byte 0x02021C40
_08127330:
	ldr r0, _081273E4
	movs r1, #0
	bl ColorMenuItemString
_08127338:
	movs r6, #0
	ldr r1, _081273E8
	ldr r0, [r1]
	movs r3, #0xf6
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _0812738A
	adds r5, r1, #0
_0812734E:
	lsls r4, r6, #4
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _081273EC
	ldr r1, [r1]
	adds r1, r1, r6
	ldrb r1, [r1]
	bl CopyDecorationMenuItemName
	ldr r1, [r5]
	lsls r2, r6, #3
	adds r0, r1, r2
	adds r4, r1, r4
	str r4, [r0]
	adds r0, r1, #4
	adds r0, r0, r2
	str r6, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r2, #0xf6
	lsls r2, r2, #2
	adds r1, r1, r2
	ldrb r0, [r1]
	subs r0, #1
	cmp r6, r0
	blt _0812734E
_0812738A:
	ldr r5, _081273E8
	lsls r4, r6, #4
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r4, r4, r3
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _081273F0
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
	ldr r2, _081273F4
	adds r1, r2, #0
	ldr r0, _081273F8
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	ldr r0, _081273FC
	ldrb r0, [r0, #1]
	strb r0, [r2, #0x10]
	ldr r0, [r5]
	movs r4, #0xf6
	lsls r4, r4, #2
	adds r1, r0, r4
	ldrb r1, [r1]
	strh r1, [r2, #0xc]
	str r0, [r2]
	ldr r6, _08127400
	adds r0, r0, r6
	ldrb r0, [r0]
	strh r0, [r2, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081273E4: .4byte 0x02021C40
_081273E8: .4byte 0x02039E58
_081273EC: .4byte 0x02039E18
_081273F0: .4byte 0x085C93C4
_081273F4: .4byte 0x03006050
_081273F8: .4byte 0x08581AB4
_081273FC: .4byte 0x02039E54
_08127400: .4byte 0x000003D9
	thumb_func_end PrintDecorationItemMenuItems

	thumb_func_start CopyDecorationMenuItemName
CopyDecorationMenuItemName: @ 0x08127404
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _08127428
	bl StringCopy
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	ldr r0, _0812742C
	adds r1, r1, r0
	adds r0, r5, #0
	bl StringAppend
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127428: .4byte 0x02021C40
_0812742C: .4byte 0x08580CD1
	thumb_func_end CopyDecorationMenuItemName

	thumb_func_start DecorationItemsMenu_OnCursorMove
DecorationItemsMenu_OnCursorMove: @ 0x08127430
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _08127442
	movs r0, #5
	bl PlaySE
_08127442:
	adds r0, r4, #0
	bl PrintDecorationItemDescription
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DecorationItemsMenu_OnCursorMove

	thumb_func_start sub_08127450
sub_08127450: @ 0x08127450
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r8, r6
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r7, r5, #0
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081274A6
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_0812776C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0812748C
	adds r3, r5, #2
	adds r0, r6, #0
	movs r1, #0x18
	movs r2, #0x5c
	bl blit_move_info_icon
	b _081274A6
_0812748C:
	adds r0, r4, #0
	bl sub_08127798
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081274A6
	adds r3, r7, #2
	mov r0, r8
	movs r1, #0x19
	movs r2, #0x5c
	bl blit_move_info_icon
_081274A6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08127450

	thumb_func_start AddDecorationItemsScrollIndicators
AddDecorationItemsScrollIndicators: @ 0x081274B0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _081274F8
	ldr r1, [r4]
	ldr r2, _081274FC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081274F0
	subs r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [sp]
	movs r0, #0x6e
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _08127500
	str r0, [sp, #0xc]
	movs r0, #2
	movs r1, #0x3c
	movs r2, #0xc
	movs r3, #0x94
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r4]
	ldr r2, _081274FC
	adds r1, r1, r2
	strb r0, [r1]
_081274F0:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081274F8: .4byte 0x02039E58
_081274FC: .4byte 0x000003DA
_08127500: .4byte 0x02039E3C
	thumb_func_end AddDecorationItemsScrollIndicators

	thumb_func_start RemoveDecorationItemsScrollIndicators
RemoveDecorationItemsScrollIndicators: @ 0x08127504
	push {r4, lr}
	ldr r4, _08127528
	ldr r0, [r4]
	ldr r2, _0812752C
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08127522
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r1, _0812752C
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
_08127522:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127528: .4byte 0x02039E58
_0812752C: .4byte 0x000003DA
	thumb_func_end RemoveDecorationItemsScrollIndicators

	thumb_func_start sub_08127530
sub_08127530: @ 0x08127530
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl sub_081269BC
	adds r0, r4, #0
	bl InitDecorationItemsWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08127530

	thumb_func_start InitDecorationItemsWindow
InitDecorationItemsWindow: @ 0x0812754C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r4, #2
	adds r5, r5, r4
	lsls r5, r5, #3
	ldr r0, _081275B0
	adds r5, r5, r0
	movs r0, #3
	bl sub_081269BC
	ldr r0, _081275B4
	ldrb r0, [r0]
	bl ShowDecorationCategorySummaryWindow
	ldr r6, _081275B8
	movs r0, #0xf7
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r6]
	ldr r1, _081275BC
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	bl InitDecorationItemsMenuLimits
	bl sub_08127280
	bl sub_081272B0
	adds r0, r4, #0
	bl PrintDecorationItemMenuItems
	ldr r0, _081275C0
	ldr r1, _081275C4
	ldrh r1, [r1]
	ldr r2, _081275C8
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x1a]
	bl AddDecorationItemsScrollIndicators
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081275B0: .4byte 0x03005B68
_081275B4: .4byte 0x02039E3F
_081275B8: .4byte 0x02039E58
_081275BC: .4byte 0x000003DA
_081275C0: .4byte 0x03006050
_081275C4: .4byte 0x02039E3C
_081275C8: .4byte 0x02039E3A
	thumb_func_end InitDecorationItemsWindow

	thumb_func_start ShowDecorationItemsWindow
ShowDecorationItemsWindow: @ 0x081275CC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl InitDecorationItemsWindow
	ldr r1, _081275F0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081275F4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081275F0: .4byte 0x03005B60
_081275F4: .4byte 0x081275F9
	thumb_func_end ShowDecorationItemsWindow

	thumb_func_start HandleDecorationItemsMenuInput
HandleDecorationItemsMenuInput: @ 0x081275F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _08127640
	adds r5, r0, r1
	ldr r0, _08127644
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081276AC
	ldrb r0, [r5, #0x1a]
	bl ListMenu_ProcessInput
	adds r4, r0, #0
	ldrb r0, [r5, #0x1a]
	ldr r7, _08127648
	ldr r1, _0812764C
	mov r8, r1
	adds r1, r7, #0
	mov r2, r8
	bl ListMenuGetScrollAndRow
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08127650
	adds r0, #1
	cmp r4, r0
	bne _08127670
	b _081276AC
	.align 2, 0
_08127640: .4byte 0x03005B68
_08127644: .4byte 0x02037C74
_08127648: .4byte 0x02039E3C
_0812764C: .4byte 0x02039E3A
_08127650:
	movs r0, #5
	bl PlaySE
	ldr r0, _0812766C
	movs r2, #0x16
	ldrsh r1, [r5, r2]
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r6, #0
	bl _call_via_r1
	b _081276AC
	.align 2, 0
_0812766C: .4byte 0x08581A5C
_08127670:
	movs r0, #5
	bl PlaySE
	ldr r0, _081276B8
	strb r4, [r0]
	bl RemoveDecorationItemsScrollIndicators
	ldrb r0, [r5, #0x1a]
	adds r1, r7, #0
	mov r2, r8
	bl DestroyListMenuTask
	movs r0, #1
	bl RemoveDecorationWindow
	bl RemoveDecorationItemsOtherWindows
	ldr r0, _081276BC
	ldr r0, [r0]
	bl Free
	ldr r1, _081276C0
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
_081276AC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081276B8: .4byte 0x02039E3E
_081276BC: .4byte 0x02039E58
_081276C0: .4byte 0x08581A5C
	thumb_func_end HandleDecorationItemsMenuInput

	thumb_func_start ShowDecorationCategorySummaryWindow
ShowDecorationCategorySummaryWindow: @ 0x081276C4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	bl sub_081269BC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PrintDecorationCategoryMenuItem
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ShowDecorationCategorySummaryWindow

	thumb_func_start PrintDecorationItemDescription
PrintDecorationItemDescription: @ 0x081276F0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, _08127710
	ldrb r5, [r0, #3]
	adds r0, r5, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _08127714
	ldrb r0, [r0]
	cmp r4, r0
	blo _0812771C
	ldr r2, _08127718
	b _08127732
	.align 2, 0
_08127710: .4byte 0x02039E54
_08127714: .4byte 0x02039E1D
_08127718: .4byte 0x085C9423
_0812771C:
	ldr r2, _08127750
	ldr r0, _08127754
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r0]
_08127732:
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127750: .4byte 0x08580CD0
_08127754: .4byte 0x02039E18
	thumb_func_end PrintDecorationItemDescription

	thumb_func_start RemoveDecorationItemsOtherWindows
RemoveDecorationItemsOtherWindows: @ 0x08127758
	push {lr}
	movs r0, #3
	bl RemoveDecorationWindow
	movs r0, #2
	bl RemoveDecorationWindow
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RemoveDecorationItemsOtherWindows

	thumb_func_start sub_0812776C
sub_0812776C: @ 0x0812776C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _08127784
_08127776:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08127788
	movs r0, #1
	b _08127794
	.align 2, 0
_08127784: .4byte 0x02039E1E
_08127788:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _08127776
	movs r0, #0
_08127794:
	pop {r1}
	bx r1
	thumb_func_end sub_0812776C

	thumb_func_start sub_08127798
sub_08127798: @ 0x08127798
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _081277B0
_081277A2:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _081277B4
	movs r0, #1
	b _081277C0
	.align 2, 0
_081277B0: .4byte 0x02039E2E
_081277B4:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xb
	bls _081277A2
	movs r0, #0
_081277C0:
	pop {r1}
	bx r1
	thumb_func_end sub_08127798

	thumb_func_start IdentifyOwnedDecorationsCurrentlyInUseInternal
IdentifyOwnedDecorationsCurrentlyInUseInternal: @ 0x081277C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r5, #0
	ldr r0, _08127864
	movs r1, #0
	movs r2, #0x10
	bl memset
	ldr r0, _08127868
	movs r1, #0
	movs r2, #0xc
	bl memset
	movs r6, #0
	ldr r0, _0812786C
	mov sl, r0
	ldr r1, _08127870
	mov sb, r1
	ldr r3, _08127874
	mov r8, r3
_081277F2:
	mov r1, sl
	ldr r0, [r1]
	add r0, sb
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08127892
	movs r2, #0
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r1, _08127878
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	cmp r2, r0
	bhs _08127892
	ldr r7, _08127864
	adds r3, r1, #0
	mov ip, r3
_08127818:
	ldr r0, _0812787C
	ldr r1, [r0]
	adds r1, r1, r2
	mov r3, sl
	ldr r0, [r3]
	add r0, sb
	adds r0, r0, r6
	ldrb r1, [r1]
	adds r4, r2, #1
	ldrb r0, [r0]
	cmp r1, r0
	bne _08127880
	movs r1, #0
	cmp r1, r5
	bhs _08127852
	ldrb r0, [r7]
	cmp r0, r4
	beq _08127852
	ldr r3, _08127864
	adds r2, r4, #0
_08127840:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r5
	bhs _08127852
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08127840
_08127852:
	cmp r1, r5
	bne _08127880
	adds r0, r5, r7
	strb r4, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _08127892
	.align 2, 0
_08127864: .4byte 0x02039E1E
_08127868: .4byte 0x02039E2E
_0812786C: .4byte 0x03005AEC
_08127870: .4byte 0x00001AAE
_08127874: .4byte 0x02039E3F
_08127878: .4byte 0x0203B90C
_0812787C: .4byte 0x02039E18
_08127880:
	lsls r0, r4, #0x10
	lsrs r2, r0, #0x10
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, ip
	ldrb r0, [r0, #4]
	cmp r2, r0
	blo _08127818
_08127892:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xf
	bls _081277F2
	movs r5, #0
	movs r6, #0
	ldr r3, _081278BC
	mov r8, r3
_081278A4:
	ldr r0, _081278C0
	ldr r0, [r0]
	ldr r1, _081278C4
	adds r0, r0, r1
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r7, r6, #1
	cmp r0, #0
	beq _0812794A
	movs r2, #0
	b _0812793C
	.align 2, 0
_081278BC: .4byte 0x0203B90C
_081278C0: .4byte 0x03005AEC
_081278C4: .4byte 0x0000271C
_081278C8:
	ldr r0, _08127928
	ldr r1, [r0]
	adds r1, r1, r2
	ldr r0, _0812792C
	ldr r0, [r0]
	ldr r3, _08127930
	adds r0, r0, r3
	adds r0, r0, r6
	ldrb r1, [r1]
	adds r4, r2, #1
	ldrb r0, [r0]
	cmp r1, r0
	bne _08127938
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0812776C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08127938
	movs r1, #0
	cmp r1, r5
	bhs _08127916
	ldr r2, _08127934
	ldrb r0, [r2]
	cmp r0, r4
	beq _08127916
	adds r3, r2, #0
	adds r2, r4, #0
_08127904:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r5
	bhs _08127916
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08127904
_08127916:
	cmp r1, r5
	bne _08127938
	ldr r0, _08127934
	adds r0, r5, r0
	strb r4, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _0812794A
	.align 2, 0
_08127928: .4byte 0x02039E18
_0812792C: .4byte 0x03005AEC
_08127930: .4byte 0x0000271C
_08127934: .4byte 0x02039E2E
_08127938:
	lsls r0, r4, #0x10
	lsrs r2, r0, #0x10
_0812793C:
	ldr r0, _08127960
	ldrb r0, [r0]
	lsls r0, r0, #3
	add r0, r8
	ldrb r0, [r0, #4]
	cmp r2, r0
	blo _081278C8
_0812794A:
	lsls r0, r7, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xb
	bls _081278A4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127960: .4byte 0x02039E3F
	thumb_func_end IdentifyOwnedDecorationsCurrentlyInUseInternal

	thumb_func_start IdentifyOwnedDecorationsCurrentlyInUse
IdentifyOwnedDecorationsCurrentlyInUse: @ 0x08127964
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IdentifyOwnedDecorationsCurrentlyInUseInternal
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end IdentifyOwnedDecorationsCurrentlyInUse

	thumb_func_start IsSelectedDecorInThePC
IsSelectedDecorInThePC: @ 0x08127974
	push {r4, lr}
	movs r2, #0
	ldr r0, _081279A0
	ldrh r0, [r0]
	ldr r1, _081279A4
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r1, r0, #1
	ldr r4, _081279A8
	ldr r3, _081279AC
_08127988:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, r1
	beq _0812799C
	cmp r2, #0xb
	bhi _081279B0
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _081279B0
_0812799C:
	movs r0, #0
	b _081279BC
	.align 2, 0
_081279A0: .4byte 0x02039E3C
_081279A4: .4byte 0x02039E3A
_081279A8: .4byte 0x02039E1E
_081279AC: .4byte 0x02039E2E
_081279B0:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xf
	bls _08127988
	movs r0, #1
_081279BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsSelectedDecorInThePC

	thumb_func_start sub_081279C4
sub_081279C4: @ 0x081279C4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl sub_081269BC
	adds r0, r4, #0
	bl ShowDecorationItemsWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081279C4

	thumb_func_start sub_081279E0
sub_081279E0: @ 0x081279E0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	ldr r1, _08127A04
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08127A08
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127A04: .4byte 0x03005B60
_08127A08: .4byte 0x081279C5
	thumb_func_end sub_081279E0

	thumb_func_start sub_08127A0C
sub_08127A0C: @ 0x08127A0C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08127A38
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08127A32
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	movs r0, #1
	bl sub_081269BC
	adds r0, r4, #0
	bl ShowDecorationItemsWindow
_08127A32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127A38: .4byte 0x03002360
	thumb_func_end sub_08127A0C

	thumb_func_start sub_08127A3C
sub_08127A3C: @ 0x08127A3C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _08127A74
	adds r4, r4, r0
	bl RemoveDecorationItemsScrollIndicators
	bl RemoveDecorationItemsOtherWindows
	ldrb r0, [r4, #0x1a]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldr r0, _08127A78
	ldr r0, [r0]
	bl Free
	adds r0, r5, #0
	bl sub_08126E1C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127A74: .4byte 0x03005B68
_08127A78: .4byte 0x02039E58
	thumb_func_end sub_08127A3C

	thumb_func_start sub_08127A7C
sub_08127A7C: @ 0x08127A7C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08127AAC
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r4, r2, r3
	ldr r0, _08127AB0
	ldr r1, [r0]
	ldrh r0, [r1]
	strh r0, [r4, #0xe]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x10]
	adds r3, #8
	adds r2, r2, r3
	adds r1, r2, #2
	adds r0, r2, #0
	bl PlayerGetDestCoords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127AAC: .4byte 0x03005B60
_08127AB0: .4byte 0x03005AEC
	thumb_func_end sub_08127A7C

	thumb_func_start sub_08127AB4
sub_08127AB4: @ 0x08127AB4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	bl DrawWholeMapView
	ldr r0, _08127AFC
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	ldr r3, _08127B00
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r3
	movs r3, #0xe
	ldrsb r3, [r4, r3]
	ldrb r4, [r4, #0x10]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	bl SetWarpDestination
	bl WarpIntoMap
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127AFC: .4byte 0x03005AEC
_08127B00: .4byte 0x03005B60
	thumb_func_end sub_08127AB4

	thumb_func_start GetDecorationElevation
GetDecorationElevation: @ 0x08127B04
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _08127B24
	cmp r2, #0x22
	beq _08127B2C
	cmp r2, #0x26
	bne _08127B36
	ldr r0, _08127B28
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x10
	b _08127B36
	.align 2, 0
_08127B24: .4byte 0x0000FFFF
_08127B28: .4byte 0x085821C8
_08127B2C:
	ldr r0, _08127B3C
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x10
_08127B36:
	pop {r1}
	bx r1
	.align 2, 0
_08127B3C: .4byte 0x085821D0
	thumb_func_end GetDecorationElevation

	thumb_func_start ShowDecorationOnMap_
ShowDecorationOnMap_: @ 0x08127B40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r4, [sp, #0x58]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0xc]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp, #0x10]
	movs r2, #0
	lsls r0, r3, #0x10
	cmp r2, r3
	blo _08127B76
	b _08127CF4
_08127B76:
	ldr r1, [sp, #8]
	str r1, [sp, #0x2c]
	str r0, [sp, #0x34]
_08127B7C:
	ldr r3, [sp, #4]
	ldr r4, [sp, #0xc]
	subs r1, r3, r4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r1, r2, #1
	str r1, [sp, #0x30]
	ldr r3, [sp, #0x2c]
	cmp r0, r3
	blo _08127BA0
	b _08127CE4
_08127BA0:
	ldr r0, _08127C10
	ldr r4, [sp, #0x10]
	lsls r1, r4, #3
	subs r1, r1, r4
	str r1, [sp, #0x1c]
	lsls r1, r1, #2
	adds r3, r1, r0
	str r3, [sp, #0x28]
	ldr r4, _08127C14
	adds r1, r1, r4
	str r1, [sp, #0x20]
	ldr r1, [sp, #8]
	adds r0, r2, #0
	muls r0, r1, r0
	str r0, [sp, #0x24]
_08127BBE:
	ldr r2, [sp]
	ldr r3, [sp, #0x14]
	adds r0, r2, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r4, [sp, #0x24]
	adds r1, r4, r3
	ldr r2, [sp, #0x20]
	ldr r0, [r2]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBehaviorByMetatileId
	lsls r4, r0, #0x10
	lsls r0, r4, #8
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSecretBaseImpassable
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08127C06
	ldr r1, [sp, #0x28]
	ldrb r0, [r1, #0xc]
	cmp r0, #1
	beq _08127C18
	lsrs r0, r4, #0x1c
	cmp r0, #0
	beq _08127C18
_08127C06:
	movs r2, #0xc0
	lsls r2, r2, #4
	mov sl, r2
	b _08127C1C
	.align 2, 0
_08127C10: .4byte 0x08580CD0
_08127C14: .4byte 0x08580CE8
_08127C18:
	movs r3, #0
	mov sl, r3
_08127C1C:
	ldr r4, [sp, #0x28]
	ldrb r0, [r4, #0xc]
	lsls r5, r5, #0x10
	mov r8, r5
	ldr r1, [sp, #0x18]
	lsls r1, r1, #0x10
	mov sb, r1
	cmp r0, #3
	beq _08127C48
	asrs r0, r5, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSecretBaseNorthWall
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r7, #1
	cmp r0, #1
	beq _08127C4A
_08127C48:
	movs r7, #0
_08127C4A:
	ldr r0, _08127C9C
	ldr r2, [sp, #0x1c]
	lsls r4, r2, #2
	adds r0, r4, r0
	ldrb r0, [r0]
	ldr r3, [sp, #0x24]
	ldr r1, [sp, #0x14]
	adds r5, r3, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl GetDecorationElevation
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08127CA0
	cmp r6, r0
	beq _08127CA8
	mov r2, r8
	asrs r0, r2, #0x10
	mov r3, sb
	asrs r1, r3, #0x10
	ldr r3, _08127CA4
	adds r2, r4, r3
	ldr r2, [r2]
	lsls r3, r5, #1
	adds r3, r3, r2
	movs r4, #0x80
	lsls r4, r4, #2
	adds r2, r4, #0
	orrs r7, r2
	ldrh r3, [r3]
	adds r2, r7, r3
	mov r3, sl
	orrs r3, r2
	orrs r3, r6
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	bl MapGridSetMetatileEntryAt
	b _08127CD2
	.align 2, 0
_08127C9C: .4byte 0x08580CD0
_08127CA0: .4byte 0x0000FFFF
_08127CA4: .4byte 0x08580CE8
_08127CA8:
	mov r1, r8
	asrs r0, r1, #0x10
	mov r2, sb
	asrs r1, r2, #0x10
	ldr r3, _08127D04
	adds r2, r4, r3
	ldr r2, [r2]
	lsls r3, r5, #1
	adds r3, r3, r2
	movs r4, #0x80
	lsls r4, r4, #2
	adds r2, r4, #0
	orrs r7, r2
	ldrh r3, [r3]
	adds r2, r7, r3
	mov r3, sl
	orrs r3, r2
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	bl MapGridSetMetatileIdAt
_08127CD2:
	ldr r0, [sp, #0x14]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r4, [sp, #0x2c]
	cmp r0, r4
	bhs _08127CE4
	b _08127BBE
_08127CE4:
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [sp, #0x34]
	lsrs r0, r3, #0x10
	cmp r2, r0
	bhs _08127CF4
	b _08127B7C
_08127CF4:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127D04: .4byte 0x08580CE8
	thumb_func_end ShowDecorationOnMap_

	thumb_func_start ShowDecorationOnMap
ShowDecorationOnMap: @ 0x08127D08
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _08127D34
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xd]
	cmp r0, #9
	bhi _08127DE4
	lsls r0, r0, #2
	ldr r1, _08127D38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08127D34: .4byte 0x08580CD0
_08127D38: .4byte 0x08127D3C
_08127D3C: @ jump table
	.4byte _08127D64 @ case 0
	.4byte _08127D6E @ case 1
	.4byte _08127D78 @ case 2
	.4byte _08127D88 @ case 3
	.4byte _08127D92 @ case 4
	.4byte _08127D9C @ case 5
	.4byte _08127DAC @ case 6
	.4byte _08127DB6 @ case 7
	.4byte _08127DC6 @ case 8
	.4byte _08127DD6 @ case 9
_08127D64:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #1
	b _08127D80
_08127D6E:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #2
	b _08127D80
_08127D78:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #3
_08127D80:
	movs r3, #1
	bl ShowDecorationOnMap_
	b _08127DE4
_08127D88:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #4
	b _08127DA4
_08127D92:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #2
	b _08127DA4
_08127D9C:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #1
_08127DA4:
	movs r3, #2
	bl ShowDecorationOnMap_
	b _08127DE4
_08127DAC:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #1
	b _08127DCE
_08127DB6:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #2
	movs r3, #4
	bl ShowDecorationOnMap_
	b _08127DE4
_08127DC6:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #3
_08127DCE:
	movs r3, #3
	bl ShowDecorationOnMap_
	b _08127DE4
_08127DD6:
	str r2, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #3
	movs r3, #2
	bl ShowDecorationOnMap_
_08127DE4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ShowDecorationOnMap

	thumb_func_start sub_08127DEC
sub_08127DEC: @ 0x08127DEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r7, _08127ECC
	ldr r0, _08127ED0
	mov r8, r0
	ldr r1, _08127ED4
	mov sl, r1
	ldr r2, _08127ED8
	mov sb, r2
_08127E08:
	adds r5, r6, #0
	adds r5, #0xae
	adds r4, r5, #0
	adds r0, r4, #0
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08127EF0
	adds r0, r4, #0
	bl FlagClear
	movs r2, #0
	ldr r0, [r7, #4]
	ldrb r4, [r0]
	cmp r2, r4
	bhs _08127E56
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x14]
	cmp r0, r5
	beq _08127E56
	ldr r0, _08127ECC
	ldr r3, [r0, #4]
	ldrb r6, [r3]
	adds r4, r5, #0
_08127E3C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r6
	bhs _08127E56
	ldr r0, [r3, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	cmp r0, r4
	bne _08127E3C
_08127E56:
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsls r4, r2, #1
	adds r4, r4, r2
	lsls r4, r4, #3
	adds r1, r4, r1
	ldr r5, _08127EDC
	adds r0, r5, #0
	ldrb r1, [r1, #1]
	adds r0, r0, r1
	ldr r1, _08127EE0
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	ldrh r1, [r1]
	bl VarSet
	ldr r0, [r7, #4]
	ldr r0, [r0, #4]
	adds r4, r4, r0
	ldrb r0, [r4]
	mov r6, r8
	strh r0, [r6]
	ldr r1, _08127EE4
	ldrh r1, [r1]
	mov r2, sl
	strh r1, [r2]
	ldr r1, _08127EE8
	ldrh r1, [r1]
	ldr r4, _08127EEC
	strh r1, [r4]
	mov r5, sb
	ldr r2, [r5]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl TrySpawnEventObject
	ldrb r0, [r6]
	ldr r2, [r5]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	mov r6, sl
	movs r4, #0
	ldrsh r3, [r6, r4]
	ldr r5, _08127EEC
	movs r6, #0
	ldrsh r4, [r5, r6]
	str r4, [sp]
	bl TryMoveEventObjectToMapCoords
	mov r1, r8
	ldrb r0, [r1]
	mov r4, sb
	ldr r2, [r4]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl TryOverrideEventObjectTemplateCoords
	b _08127EFA
	.align 2, 0
_08127ECC: .4byte 0x02036FB8
_08127ED0: .4byte 0x02037282
_08127ED4: .4byte 0x02037284
_08127ED8: .4byte 0x03005AEC
_08127EDC: .4byte 0x00003F20
_08127EE0: .4byte 0x02039E5C
_08127EE4: .4byte 0x0203A700
_08127EE8: .4byte 0x0203A702
_08127EEC: .4byte 0x02037286
_08127EF0:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xd
	bls _08127E08
_08127EFA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08127DEC

	thumb_func_start sub_08127F0C
sub_08127F0C: @ 0x08127F0C
	push {lr}
	movs r1, #0
	ldr r0, _08127F28
	ldrb r2, [r0, #8]
	cmp r1, r2
	bhs _08127F36
	ldr r3, [r0]
_08127F1A:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08127F2C
	movs r0, #1
	b _08127F38
	.align 2, 0
_08127F28: .4byte 0x02039E48
_08127F2C:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r2
	blo _08127F1A
_08127F36:
	movs r0, #0
_08127F38:
	pop {r1}
	bx r1
	thumb_func_end sub_08127F0C

	thumb_func_start sub_08127F3C
sub_08127F3C: @ 0x08127F3C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08127F6C
	ldrb r0, [r0, #9]
	cmp r0, #1
	bne _08127F80
	ldr r0, _08127F70
	ldrb r0, [r0]
	cmp r0, #6
	beq _08127F80
	cmp r0, #7
	beq _08127F80
	ldr r4, _08127F74
	ldr r1, _08127F78
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08127F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
	b _08128020
	.align 2, 0
_08127F6C: .4byte 0x02039E48
_08127F70: .4byte 0x02039E3F
_08127F74: .4byte 0x02021C7C
_08127F78: .4byte 0x085CA7D9
_08127F7C: .4byte 0x08127A0D
_08127F80:
	bl IsSelectedDecorInThePC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0812800C
	bl sub_08127F0C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08127FBC
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r1, _08127FB4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _08127FB8
	str r1, [r0]
	b _08128020
	.align 2, 0
_08127FB4: .4byte 0x03005B60
_08127FB8: .4byte 0x08128035
_08127FBC:
	ldr r0, _08127FDC
	ldr r4, _08127FE0
	ldrb r1, [r4, #8]
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _08127FEC
	ldr r0, _08127FE4
	ldr r1, _08127FE8
	bl StringExpandPlaceholders
	b _08127FF4
	.align 2, 0
_08127FDC: .4byte 0x02021C40
_08127FE0: .4byte 0x02039E48
_08127FE4: .4byte 0x02021C7C
_08127FE8: .4byte 0x085CA776
_08127FEC:
	ldr r0, _08128000
	ldr r1, _08128004
	bl StringExpandPlaceholders
_08127FF4:
	ldr r1, _08128000
	ldr r2, _08128008
	adds r0, r5, #0
	bl DisplayItemMessageOnField
	b _08128020
	.align 2, 0
_08128000: .4byte 0x02021C7C
_08128004: .4byte 0x085CA799
_08128008: .4byte 0x08127A0D
_0812800C:
	ldr r4, _08128028
	ldr r1, _0812802C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08128030
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
_08128020:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128028: .4byte 0x02021C7C
_0812802C: .4byte 0x085CA768
_08128030: .4byte 0x08127A0D
	thumb_func_end sub_08127F3C

	thumb_func_start sub_08128034
sub_08128034: @ 0x08128034
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08128058
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r7, r0, r1
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq _08128080
	cmp r0, #1
	bgt _0812805C
	cmp r0, #0
	beq _08128062
	b _081280E6
	.align 2, 0
_08128058: .4byte 0x03005B60
_0812805C:
	cmp r0, #2
	beq _081280D0
	b _081280E6
_08128062:
	ldr r0, _0812807C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081280E6
	adds r0, r6, #0
	bl sub_08127A7C
	movs r0, #1
	strh r0, [r7, #0xc]
	b _081280E6
	.align 2, 0
_0812807C: .4byte 0x02037C74
_08128080:
	ldr r4, _081280C0
	ldrb r0, [r4, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #8]
	ldr r5, _081280C4
	ldr r0, _081280C8
	ldrb r1, [r0]
	ldr r0, _081280CC
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r5, #0
	bl ConfigureCameraObjectForPlacingDecoration
	adds r0, r6, #0
	bl sub_08128240
	adds r0, r6, #0
	adds r1, r5, #0
	bl SetUpPlacingDecorationPlayerAvatar
	bl pal_fill_black
	ldrb r1, [r4, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #8]
	movs r0, #2
	strh r0, [r7, #0xc]
	b _081280E6
	.align 2, 0
_081280C0: .4byte 0x02037C74
_081280C4: .4byte 0x02039E5C
_081280C8: .4byte 0x02039E3E
_081280CC: .4byte 0x02039E18
_081280D0:
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081280E6
	movs r0, #0
	strh r0, [r7, #0x20]
	adds r0, r6, #0
	bl sub_08128FB8
_081280E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08128034

	thumb_func_start ConfigureCameraObjectForPlacingDecoration
ConfigureCameraObjectForPlacingDecoration: @ 0x081280EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _08128168
	ldr r4, _0812816C
	ldr r5, _08128170
	ldr r2, [r5, #4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x2e]
	strb r0, [r3]
	adds r0, r6, #0
	bl gpu_pal_decompress_alloc_tag_and_upload
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r0, [r5, #4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r0, r4, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r1, _08128174
	str r1, [r0]
	adds r2, r2, r4
	ldr r3, _08128178
	ldr r0, [r6]
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	strh r0, [r2, #0x20]
	ldr r0, [r5, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r0, [r6]
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #3]
	strh r0, [r1, #0x22]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08128168: .4byte 0x0203A704
_0812816C: .4byte 0x020205AC
_08128170: .4byte 0x03005B30
_08128174: .4byte 0x081292B1
_08128178: .4byte 0x08582134
	thumb_func_end ConfigureCameraObjectForPlacingDecoration

	thumb_func_start SetUpPlacingDecorationPlayerAvatar
SetUpPlacingDecorationPlayerAvatar: @ 0x0812817C
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _081281D0
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	ldrb r2, [r2, #0x12]
	ldr r3, _081281D4
	ldr r0, [r1]
	ldrb r4, [r0, #0xd]
	lsls r1, r4, #2
	adds r1, r1, r3
	lsls r0, r2, #4
	ldrb r1, [r1, #2]
	adds r0, r0, r1
	subs r2, #1
	lsls r2, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r4, #2
	beq _081281B6
	cmp r4, #8
	beq _081281B6
	cmp r4, #9
	bne _081281BE
_081281B6:
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_081281BE:
	ldr r0, _081281D8
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _081281E0
	ldr r1, _081281DC
	str r0, [sp]
	movs r0, #0xc1
	b _081281E8
	.align 2, 0
_081281D0: .4byte 0x03005B60
_081281D4: .4byte 0x08582134
_081281D8: .4byte 0x03005AF0
_081281DC: .4byte 0x08007141
_081281E0:
	ldr r1, _0812822C
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc2
_081281E8:
	movs r3, #0x48
	bl AddPseudoEventObject
	ldr r1, _08128230
	strb r0, [r1]
	ldr r3, _08128234
	ldr r0, _08128230
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r4, _08128238
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	bl DestroySprite
	ldr r0, _0812823C
	ldr r0, [r0, #4]
	strb r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812822C: .4byte 0x08007141
_08128230: .4byte 0x0203A705
_08128234: .4byte 0x020205AC
_08128238: .4byte 0x0203A704
_0812823C: .4byte 0x03005B30
	thumb_func_end SetUpPlacingDecorationPlayerAvatar

	thumb_func_start sub_08128240
sub_08128240: @ 0x08128240
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _08128270
	ldr r0, _08128274
	ldrb r1, [r0]
	ldr r0, _08128278
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0xd]
	cmp r0, #9
	bls _08128264
	b _0812838A
_08128264:
	lsls r0, r0, #2
	ldr r1, _0812827C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08128270: .4byte 0x08580CD0
_08128274: .4byte 0x02039E3E
_08128278: .4byte 0x02039E18
_0812827C: .4byte 0x08128280
_08128280: @ jump table
	.4byte _081282A8 @ case 0
	.4byte _081282BC @ case 1
	.4byte _081282D4 @ case 2
	.4byte _081282EC @ case 3
	.4byte _08128300 @ case 4
	.4byte _08128314 @ case 5
	.4byte _08128328 @ case 6
	.4byte _08128348 @ case 7
	.4byte _08128360 @ case 8
	.4byte _08128378 @ case 9
_081282A8:
	ldr r0, _081282B8
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	b _0812836C
	.align 2, 0
_081282B8: .4byte 0x03005B60
_081282BC:
	ldr r1, _081282D0
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0, #0x12]
	movs r1, #1
	b _08128388
	.align 2, 0
_081282D0: .4byte 0x03005B60
_081282D4:
	ldr r1, _081282E8
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #3
	strh r1, [r0, #0x12]
	movs r1, #1
	b _08128388
	.align 2, 0
_081282E8: .4byte 0x03005B60
_081282EC:
	ldr r1, _081282FC
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	b _08128384
	.align 2, 0
_081282FC: .4byte 0x03005B60
_08128300:
	ldr r0, _08128310
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	b _0812836C
	.align 2, 0
_08128310: .4byte 0x03005B60
_08128314:
	ldr r1, _08128324
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	b _08128384
	.align 2, 0
_08128324: .4byte 0x03005B60
_08128328:
	ldr r0, _08128344
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x12]
	movs r0, #3
	strh r0, [r1, #0x14]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	b _0812838A
	.align 2, 0
_08128344: .4byte 0x03005B60
_08128348:
	ldr r1, _0812835C
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0, #0x12]
	movs r1, #4
	b _08128388
	.align 2, 0
_0812835C: .4byte 0x03005B60
_08128360:
	ldr r0, _08128374
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
_0812836C:
	strh r0, [r1, #0x12]
	strh r0, [r1, #0x14]
	b _0812838A
	.align 2, 0
_08128374: .4byte 0x03005B60
_08128378:
	ldr r1, _08128390
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #3
_08128384:
	strh r1, [r0, #0x12]
	movs r1, #2
_08128388:
	strh r1, [r0, #0x14]
_0812838A:
	pop {r0}
	bx r0
	.align 2, 0
_08128390: .4byte 0x03005B60
	thumb_func_end sub_08128240

	thumb_func_start sub_08128394
sub_08128394: @ 0x08128394
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _081283DC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x1c]
	ldr r3, _081283E0
	ldr r0, _081283E4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #1
	strh r2, [r0, #0x3c]
	ldr r0, _081283E8
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x3c]
	bl sub_08128DC0
	adds r0, r4, #0
	bl sub_08128928
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081283DC: .4byte 0x03005B60
_081283E0: .4byte 0x020205AC
_081283E4: .4byte 0x0203A704
_081283E8: .4byte 0x0203A705
	thumb_func_end sub_08128394

	thumb_func_start sub_081283EC
sub_081283EC: @ 0x081283EC
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08128440
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x1c]
	ldr r3, _08128444
	ldr r0, _08128448
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #1
	strh r2, [r0, #0x3c]
	ldr r0, _0812844C
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x3c]
	bl sub_08128DC0
	ldr r5, _08128450
	ldr r1, _08128454
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldr r2, _08128458
	adds r0, r4, #0
	adds r1, r5, #0
	bl DisplayItemMessageOnField
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128440: .4byte 0x03005B60
_08128444: .4byte 0x020205AC
_08128448: .4byte 0x0203A704
_0812844C: .4byte 0x0203A705
_08128450: .4byte 0x02021C7C
_08128454: .4byte 0x085CA75C
_08128458: .4byte 0x08128B61
	thumb_func_end sub_081283EC

	thumb_func_start sub_0812845C
sub_0812845C: @ 0x0812845C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	bl MetatileBehavior_IsBlockDecoration
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08128476
	cmp r4, #0
	beq _0812847A
_08128476:
	movs r0, #0
	b _0812847C
_0812847A:
	movs r0, #1
_0812847C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0812845C

	thumb_func_start sub_08128484
sub_08128484: @ 0x08128484
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _081284C0
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	adds r0, #7
	cmp r1, r0
	bne _081284C4
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	movs r3, #0x10
	ldrsh r0, [r2, r3]
	adds r0, #7
	cmp r1, r0
	bne _081284C4
	cmp r5, #0
	beq _081284C4
	movs r0, #0
	b _081284C6
	.align 2, 0
_081284C0: .4byte 0x03005B60
_081284C4:
	movs r0, #1
_081284C6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08128484

	thumb_func_start sub_081284CC
sub_081284CC: @ 0x081284CC
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsBlockDecoration
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0812850C
	ldrb r0, [r5]
	cmp r0, #0x21
	bne _081284FA
	adds r0, r4, #0
	bl MetatileBehavior_IsSecretBaseHole
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08128508
_081284FA:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsNormal
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812850C
_08128508:
	movs r0, #1
	b _0812850E
_0812850C:
	movs r0, #0
_0812850E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081284CC

	thumb_func_start sub_08128514
sub_08128514: @ 0x08128514
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r1, [sp]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r1, _08128550
	lsls r0, r0, #2
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r2, [r0, #0x14]
	str r2, [sp, #4]
	ldrb r0, [r0, #0x12]
	str r0, [sp, #8]
	ldr r3, [sp]
	ldrb r0, [r3, #0xc]
	adds r2, r1, #0
	cmp r0, #4
	bls _08128546
	b _08128914
_08128546:
	lsls r0, r0, #2
	ldr r1, _08128554
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08128550: .4byte 0x03005B60
_08128554: .4byte 0x08128558
_08128558: @ jump table
	.4byte _0812856C @ case 0
	.4byte _0812856C @ case 1
	.4byte _08128658 @ case 2
	.4byte _0812880C @ case 3
	.4byte _08128890 @ case 4
_0812856C:
	movs r6, #0
	ldr r0, [sp, #4]
	cmp r6, r0
	blo _08128576
	b _08128914
_08128576:
	mov r1, sl
	lsls r1, r1, #2
	str r1, [sp, #0x1c]
_0812857C:
	mov r2, sl
	lsls r0, r2, #2
	add r0, sl
	lsls r0, r0, #3
	ldr r3, _08128654
	adds r0, r0, r3
	ldrh r0, [r0, #0xa]
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r7, #0
	adds r6, #1
	str r6, [sp, #0x14]
	ldr r0, [sp, #8]
	cmp r7, r0
	bhs _08128646
	mov r1, sb
	lsls r1, r1, #0x10
	str r1, [sp, #0xc]
	asrs r1, r1, #0x10
	mov sb, r1
_081285A8:
	ldr r0, [sp, #0x1c]
	add r0, sl
	lsls r0, r0, #3
	ldr r2, _08128654
	adds r0, r0, r2
	ldrh r0, [r0, #8]
	adds r0, r0, r7
	lsls r0, r0, #0x10
	mov r8, r0
	asrs r6, r0, #0x10
	adds r0, r6, #0
	mov r1, sb
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #4]
	ldr r1, [sp, #0x14]
	subs r0, r3, r1
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r1, r1, r7
	ldr r3, [sp]
	ldr r0, [r3, #0x18]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBehaviorByMetatileId
	movs r3, #0xf0
	lsls r3, r3, #8
	adds r1, r3, #0
	adds r5, r1, #0
	ands r5, r0
	adds r0, r4, #0
	ldr r1, [sp]
	bl sub_081284CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812860A
	b _081288E4
_0812860A:
	mov r0, sl
	adds r1, r6, #0
	mov r2, sb
	adds r3, r5, #0
	bl sub_08128484
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812861E
	b _081288E4
_0812861E:
	mov r1, r8
	lsrs r0, r1, #0x10
	ldr r2, [sp, #0xc]
	lsrs r1, r2, #0x10
	movs r2, #0
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0812863A
	cmp r4, #0x10
	beq _0812863A
	b _081288E4
_0812863A:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #8]
	cmp r7, r3
	blo _081285A8
_08128646:
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [sp, #4]
	cmp r6, r2
	blo _0812857C
	b _08128914
	.align 2, 0
_08128654: .4byte 0x03005B60
_08128658:
	movs r6, #0
	mov r3, sl
	lsls r3, r3, #2
	str r3, [sp, #0x1c]
	ldr r0, [sp, #4]
	subs r0, #1
	str r0, [sp, #0x18]
	cmp r6, r0
	bge _08128744
	adds r0, r3, #0
	add r0, sl
	lsls r0, r0, #3
	str r0, [sp, #0x10]
_08128672:
	ldr r1, [sp, #0x10]
	adds r0, r1, r2
	ldrh r0, [r0, #0xa]
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r7, #0
	adds r6, #1
	str r6, [sp, #0x14]
	ldr r3, [sp, #8]
	cmp r7, r3
	bhs _08128738
	lsls r0, r0, #0x10
	str r0, [sp, #0x20]
_08128690:
	ldr r1, [sp, #0x10]
	adds r0, r1, r2
	ldrh r0, [r0, #8]
	adds r0, r0, r7
	lsls r0, r0, #0x10
	mov r8, r0
	asrs r6, r0, #0x10
	mov r2, sb
	lsls r1, r2, #0x10
	adds r0, r6, #0
	asrs r1, r1, #0x10
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #4]
	ldr r1, [sp, #0x14]
	subs r0, r3, r1
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r1, r1, r7
	ldr r3, [sp]
	ldr r0, [r3, #0x18]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBehaviorByMetatileId
	movs r3, #0xf0
	lsls r3, r3, #8
	adds r1, r3, #0
	adds r5, r1, #0
	ands r5, r0
	adds r0, r4, #0
	bl MetatileBehavior_IsNormal
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081286FC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0812845C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081286FC
	b _081288E4
_081286FC:
	mov r0, sl
	adds r1, r6, #0
	ldr r3, [sp, #0x20]
	asrs r2, r3, #0x10
	adds r3, r5, #0
	bl sub_08128484
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08128712
	b _081288E4
_08128712:
	mov r1, r8
	lsrs r0, r1, #0x10
	ldr r2, [sp, #0x20]
	lsrs r1, r2, #0x10
	movs r2, #0
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _0812872A
	b _081288E4
_0812872A:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _08128808
	ldr r3, [sp, #8]
	cmp r7, r3
	blo _08128690
_08128738:
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x18]
	cmp r6, r3
	blt _08128672
_08128744:
	ldr r0, [sp, #0x1c]
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0xa]
	ldr r1, [sp, #4]
	subs r0, r0, r1
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r7, #0
	ldr r3, [sp, #8]
	cmp r7, r3
	blo _08128764
	b _08128914
_08128764:
	lsls r0, r0, #0x10
	str r0, [sp, #0x20]
_08128768:
	ldr r0, [sp, #0x1c]
	add r0, sl
	lsls r0, r0, #3
	ldr r1, _08128808
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	adds r0, r0, r7
	lsls r0, r0, #0x10
	mov r8, r0
	asrs r6, r0, #0x10
	mov r2, sb
	lsls r1, r2, #0x10
	adds r0, r6, #0
	asrs r1, r1, #0x10
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp]
	ldr r0, [r3, #0x18]
	lsls r1, r7, #1
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBehaviorByMetatileId
	movs r3, #0xf0
	lsls r3, r3, #8
	adds r1, r3, #0
	adds r5, r1, #0
	ands r5, r0
	adds r0, r4, #0
	bl MetatileBehavior_IsNormal
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081287CA
	adds r0, r4, #0
	bl MetatileBehavior_IsSecretBaseNorthWall
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081287CA
	b _081288E4
_081287CA:
	mov r0, sl
	adds r1, r6, #0
	ldr r3, [sp, #0x20]
	asrs r2, r3, #0x10
	adds r3, r5, #0
	bl sub_08128484
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081287E0
	b _081288E4
_081287E0:
	mov r1, r8
	lsrs r0, r1, #0x10
	ldr r2, [sp, #0x20]
	lsrs r1, r2, #0x10
	movs r2, #0
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _081287FA
	cmp r4, #0x10
	bne _081288E4
_081287FA:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #8]
	cmp r7, r3
	blo _08128768
	b _08128914
	.align 2, 0
_08128808: .4byte 0x03005B60
_0812880C:
	movs r6, #0
	ldr r0, [sp, #4]
	cmp r6, r0
	blo _08128816
	b _08128914
_08128816:
	mov r1, sl
	lsls r0, r1, #2
	add r0, sl
	lsls r1, r0, #3
	ldr r2, _0812888C
	adds r0, r1, r2
	ldrh r0, [r0, #0xa]
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r7, #0
	ldr r3, [sp, #8]
	cmp r7, r3
	bhs _0812887C
	adds r0, r2, #0
	adds r1, r1, r0
	mov r8, r1
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
_08128840:
	mov r2, r8
	ldrh r0, [r2, #8]
	adds r0, r0, r7
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSecretBaseNorthWall
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081288E4
	adds r0, r4, #0
	adds r1, r5, #1
	bl MapGridGetMetatileIdAt
	movs r1, #0xa3
	lsls r1, r1, #2
	cmp r0, r1
	beq _081288E4
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #8]
	cmp r7, r3
	blo _08128840
_0812887C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [sp, #4]
	cmp r6, r0
	blo _08128816
	b _08128914
	.align 2, 0
_0812888C: .4byte 0x03005B60
_08128890:
	mov r3, sl
	lsls r1, r3, #2
	adds r0, r1, r3
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0xa]
	mov sb, r0
	movs r7, #0
	str r1, [sp, #0x1c]
	ldr r0, [sp, #8]
	cmp r7, r0
	bhs _08128914
	adds r6, r2, #0
	mov r1, sb
	lsls r1, r1, #0x10
	str r1, [sp, #0x20]
_081288B0:
	ldr r0, [sp, #0x1c]
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #8]
	adds r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp]
	ldrb r0, [r3, #0xd]
	cmp r0, #5
	bne _081288E8
_081288D8:
	adds r0, r4, #0
	bl MetatileBehavior_HoldsLargeDecoration
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081288F4
_081288E4:
	movs r0, #0
	b _08128916
_081288E8:
	adds r0, r4, #0
	bl MetatileBehavior_HoldsSmallDecoration
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081288D8
_081288F4:
	adds r0, r5, #0
	ldr r2, [sp, #0x20]
	lsrs r1, r2, #0x10
	movs r2, #0
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _081288E4
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #8]
	cmp r7, r3
	blo _081288B0
_08128914:
	movs r0, #1
_08128916:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08128514

	thumb_func_start sub_08128928
sub_08128928: @ 0x08128928
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08128968
	ldrb r1, [r0]
	ldr r0, _0812896C
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08128970
	adds r1, r1, r0
	adds r0, r5, #0
	bl sub_08128514
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08128980
	ldr r4, _08128974
	ldr r1, _08128978
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _0812897C
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
	b _0812899A
	.align 2, 0
_08128968: .4byte 0x02039E3E
_0812896C: .4byte 0x02039E18
_08128970: .4byte 0x08580CD0
_08128974: .4byte 0x02021C7C
_08128978: .4byte 0x085CA745
_0812897C: .4byte 0x081289AD
_08128980:
	movs r0, #0x20
	bl PlaySE
	ldr r4, _081289A0
	ldr r1, _081289A4
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _081289A8
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
_0812899A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081289A0: .4byte 0x02021C7C
_081289A4: .4byte 0x085CA750
_081289A8: .4byte 0x08129001
	thumb_func_end sub_08128928

	thumb_func_start sub_081289AC
sub_081289AC: @ 0x081289AC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _081289C8
	adds r0, r4, #0
	bl DoYesNoFuncWithChoice
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081289C8: .4byte 0x085821A8
	thumb_func_end sub_081289AC

	thumb_func_start sub_081289CC
sub_081289CC: @ 0x081289CC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	adds r0, r4, #0
	bl sub_08128A8C
	ldr r2, _08128A14
	ldr r0, _08128A18
	ldrb r1, [r0]
	ldr r0, _08128A1C
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r3, [r0]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0xc]
	cmp r0, #4
	beq _08128A24
	ldr r0, _08128A20
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	adds r2, r3, #0
	bl ShowDecorationOnMap
	b _08128A44
	.align 2, 0
_08128A14: .4byte 0x08580CD0
_08128A18: .4byte 0x02039E3E
_08128A1C: .4byte 0x02039E18
_08128A20: .4byte 0x03005B60
_08128A24:
	ldr r2, _08128A70
	ldr r0, _08128A74
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	subs r0, #7
	strh r0, [r2]
	ldr r2, _08128A78
	ldrh r0, [r1, #0xa]
	subs r0, #7
	strh r0, [r2]
	ldr r0, _08128A7C
	bl ScriptContext1_SetupScript
_08128A44:
	ldr r2, _08128A80
	ldr r0, _08128A84
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	adds r1, #2
	strh r1, [r0, #0x22]
	ldr r0, _08128A88
	ldrb r0, [r0, #0x14]
	cmp r0, #0x56
	bne _08128A64
	bl TV_PutSecretBaseVisitOnTheAir
_08128A64:
	adds r0, r4, #0
	bl sub_08128B9C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128A70: .4byte 0x0203A700
_08128A74: .4byte 0x03005B60
_08128A78: .4byte 0x0203A702
_08128A7C: .4byte 0x08245DCE
_08128A80: .4byte 0x020205AC
_08128A84: .4byte 0x0203A704
_08128A88: .4byte 0x02036FB8
	thumb_func_end sub_081289CC

	thumb_func_start sub_08128A8C
sub_08128A8C: @ 0x08128A8C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r3, #0
	ldr r0, _08128AC8
	ldrb r1, [r0, #8]
	adds r5, r0, #0
	cmp r3, r1
	bhs _08128AB2
	ldr r4, [r5]
_08128AA0:
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, #0
	beq _08128AD0
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	blo _08128AA0
_08128AB2:
	ldrb r0, [r5, #9]
	cmp r0, #0
	bne _08128B1C
	movs r3, #0
	ldr r0, _08128ACC
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _08128B08
	b _08128B28
	.align 2, 0
_08128AC8: .4byte 0x02039E48
_08128ACC: .4byte 0x02039E1E
_08128AD0:
	ldr r0, _08128AFC
	ldrb r1, [r0]
	ldr r0, _08128B00
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, [r5, #4]
	adds r2, r2, r3
	ldr r0, _08128B04
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #8]
	subs r0, #7
	lsls r0, r0, #4
	ldrb r1, [r1, #0xa]
	subs r1, #7
	adds r0, r0, r1
	strb r0, [r2]
	b _08128AB2
	.align 2, 0
_08128AFC: .4byte 0x02039E3E
_08128B00: .4byte 0x02039E18
_08128B04: .4byte 0x03005B60
_08128B08:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xf
	bhi _08128B56
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _08128B08
	b _08128B4E
_08128B1C:
	movs r3, #0
	ldr r0, _08128B34
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _08128B3C
_08128B28:
	ldr r0, _08128B38
	ldrb r0, [r0]
	adds r0, #1
	strb r0, [r2]
	b _08128B56
	.align 2, 0
_08128B34: .4byte 0x02039E2E
_08128B38: .4byte 0x02039E3E
_08128B3C:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xb
	bhi _08128B56
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _08128B3C
_08128B4E:
	ldr r0, _08128B5C
	ldrb r0, [r0]
	adds r0, #1
	strb r0, [r1]
_08128B56:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08128B5C: .4byte 0x02039E3E
	thumb_func_end sub_08128A8C

	thumb_func_start sub_08128B60
sub_08128B60: @ 0x08128B60
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _08128B7C
	adds r0, r4, #0
	bl DoYesNoFuncWithChoice
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128B7C: .4byte 0x085821B0
	thumb_func_end sub_08128B60

	thumb_func_start sub_08128B80
sub_08128B80: @ 0x08128B80
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	adds r0, r4, #0
	bl sub_08128B9C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08128B80

	thumb_func_start sub_08128B9C
sub_08128B9C: @ 0x08128B9C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r1, _08128BC4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _08128BC8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128BC4: .4byte 0x03005B60
_08128BC8: .4byte 0x08128BCD
	thumb_func_end sub_08128B9C

	thumb_func_start c1_overworld_prev_quest
c1_overworld_prev_quest: @ 0x08128BCC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08128BEC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08128BF0
	cmp r0, #1
	beq _08128C10
	b _08128C2C
	.align 2, 0
_08128BEC: .4byte 0x03005B60
_08128BF0:
	bl ScriptContext2_Enable
	ldr r0, _08128C0C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08128C2C
	adds r0, r4, #0
	bl sub_08127AB4
	movs r0, #1
	strh r0, [r5, #0xc]
	b _08128C2C
	.align 2, 0
_08128C0C: .4byte 0x02037C74
_08128C10:
	bl sub_0812A3D4
	ldr r0, _08128C34
	bl FreeSpritePaletteByTag
	ldr r1, _08128C38
	ldr r0, _08128C3C
	str r0, [r1]
	ldr r0, _08128C40
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_08128C2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128C34: .4byte 0x00000BE5
_08128C38: .4byte 0x03005B0C
_08128C3C: .4byte 0x08128CB5
_08128C40: .4byte 0x08085A31
	thumb_func_end c1_overworld_prev_quest

	thumb_func_start sub_08128C44
sub_08128C44: @ 0x08128C44
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r5, r1, #3
	ldr r6, _08128C68
	adds r4, r5, r6
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08128C7C
	cmp r0, #1
	bgt _08128C6C
	cmp r0, #0
	beq _08128C76
	b _08128CAA
	.align 2, 0
_08128C68: .4byte 0x03005B68
_08128C6C:
	cmp r0, #2
	beq _08128C88
	cmp r0, #3
	beq _08128C94
	b _08128CAA
_08128C76:
	bl HideSecretBaseDecorationSprites
	b _08128C8C
_08128C7C:
	ldr r0, _08128C84
	bl ScriptContext1_SetupScript
	b _08128C8C
	.align 2, 0
_08128C84: .4byte 0x08245DBB
_08128C88:
	bl ScriptContext2_Enable
_08128C8C:
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
	b _08128CAA
_08128C94:
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08128CAA
	adds r0, r6, #0
	subs r0, #8
	adds r0, r5, r0
	ldr r1, _08128CB0
	str r1, [r0]
_08128CAA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08128CB0: .4byte 0x081275F9
	thumb_func_end sub_08128C44

	thumb_func_start sub_08128CB4
sub_08128CB4: @ 0x08128CB4
	push {r4, lr}
	bl ScriptContext2_Enable
	bl pal_fill_black
	ldr r0, _08128CE8
	movs r1, #8
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_08127530
	ldr r1, _08128CEC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128CE8: .4byte 0x08128C45
_08128CEC: .4byte 0x03005B60
	thumb_func_end sub_08128CB4

	thumb_func_start sub_08128CF0
sub_08128CF0: @ 0x08128CF0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08128D20
	adds r2, r1, r0
	ldr r0, _08128D24
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #1
	bne _08128D28
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	subs r0, #6
	cmp r0, #0
	bge _08128D28
	ldrh r0, [r2, #2]
	adds r0, #1
	b _08128D42
	.align 2, 0
_08128D20: .4byte 0x03005B68
_08128D24: .4byte 0x0203A706
_08128D28:
	ldrb r0, [r3]
	cmp r0, #2
	bne _08128D4C
	movs r0, #2
	ldrsh r1, [r2, r0]
	subs r1, #7
	ldr r0, _08128D48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r1, r0
	blt _08128D4C
	ldrh r0, [r2, #2]
	subs r0, #1
_08128D42:
	strh r0, [r2, #2]
	movs r0, #0
	b _08128D8E
	.align 2, 0
_08128D48: .4byte 0x02036FB8
_08128D4C:
	ldrb r0, [r3]
	cmp r0, #3
	bne _08128D62
	movs r1, #0
	ldrsh r0, [r2, r1]
	subs r0, #7
	cmp r0, #0
	bge _08128D62
	ldrh r0, [r2]
	adds r0, #1
	b _08128D82
_08128D62:
	ldrb r0, [r3]
	cmp r0, #4
	bne _08128D8C
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r4, #0xa
	ldrsh r0, [r2, r4]
	adds r1, r1, r0
	subs r1, #8
	ldr r0, _08128D88
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r1, r0
	blt _08128D8C
	ldrh r0, [r2]
	subs r0, #1
_08128D82:
	strh r0, [r2]
	movs r0, #0
	b _08128D8E
	.align 2, 0
_08128D88: .4byte 0x02036FB8
_08128D8C:
	movs r0, #1
_08128D8E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08128CF0

	thumb_func_start sub_08128D94
sub_08128D94: @ 0x08128D94
	push {lr}
	ldr r0, _08128DB4
	ldrh r0, [r0, #0x2c]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0x40
	beq _08128DB8
	cmp r1, #0x80
	beq _08128DB8
	cmp r1, #0x20
	beq _08128DB8
	cmp r1, #0x10
	beq _08128DB8
	movs r0, #0
	b _08128DBA
	.align 2, 0
_08128DB4: .4byte 0x03002360
_08128DB8:
	movs r0, #1
_08128DBA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08128D94

	thumb_func_start sub_08128DC0
sub_08128DC0: @ 0x08128DC0
	push {r4, lr}
	ldr r1, _08128DEC
	movs r0, #0
	strb r0, [r1]
	ldr r4, _08128DF0
	ldr r3, _08128DF4
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0
	strh r2, [r0, #0x32]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128DEC: .4byte 0x0203A706
_08128DF0: .4byte 0x020205AC
_08128DF4: .4byte 0x0203A704
	thumb_func_end sub_08128DC0

	thumb_func_start sub_08128DF8
sub_08128DF8: @ 0x08128DF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r8, r2
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08128E38
	adds r4, r0, r1
	ldr r5, _08128E3C
	ldr r3, _08128E40
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x36
	ldrsh r6, [r0, r1]
	cmp r6, #0
	beq _08128E26
	b _08128F46
_08128E26:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _08128E48
	ldr r0, _08128E44
	movs r3, #0x18
	ldrsh r1, [r4, r3]
	lsls r1, r1, #3
	b _08128E56
	.align 2, 0
_08128E38: .4byte 0x03005B68
_08128E3C: .4byte 0x020205AC
_08128E40: .4byte 0x0203A704
_08128E44: .4byte 0x085821B8
_08128E48:
	cmp r0, #2
	bne _08128E68
	ldr r0, _08128E64
	movs r3, #0x18
	ldrsh r1, [r4, r3]
	lsls r1, r1, #3
	adds r0, #4
_08128E56:
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	b _08128F9A
	.align 2, 0
_08128E64: .4byte 0x085821B8
_08128E68:
	ldr r2, _08128FA4
	ldrh r1, [r2, #0x2c]
	movs r7, #0xf0
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08128E9C
	ldr r1, _08128FA8
	movs r0, #1
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x32]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _08128FAC
	strh r1, [r0, #0x34]
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
_08128E9C:
	ldrh r1, [r2, #0x2c]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0x80
	bne _08128ECC
	ldr r1, _08128FA8
	movs r0, #2
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x32]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #2
	strh r1, [r0, #0x34]
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
_08128ECC:
	ldrh r1, [r2, #0x2c]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0x20
	bne _08128EFC
	ldr r1, _08128FA8
	movs r0, #3
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _08128FAC
	strh r1, [r0, #0x32]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x34]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
_08128EFC:
	ldrh r1, [r2, #0x2c]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0x10
	bne _08128F2C
	ldr r1, _08128FA8
	movs r0, #4
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #2
	strh r1, [r0, #0x32]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x34]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_08128F2C:
	bl sub_08128D94
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08128F42
	mov r0, r8
	bl sub_08128CF0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08128F46
_08128F42:
	bl sub_08128DC0
_08128F46:
	ldr r0, _08128FA8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08128F74
	ldr r3, _08128FB0
	ldr r2, _08128FB4
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x36]
	adds r1, #1
	strh r1, [r0, #0x36]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r2, [r1, #0x36]
	movs r0, #7
	ands r0, r2
	strh r0, [r1, #0x36]
_08128F74:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08128F9A
	ldr r3, _08128FA4
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08128F8C
	strh r2, [r4, #0x14]
_08128F8C:
	ldrh r1, [r3, #0x2e]
	movs r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08128F9A
	strh r2, [r4, #0x14]
_08128F9A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08128FA4: .4byte 0x03002360
_08128FA8: .4byte 0x0203A706
_08128FAC: .4byte 0x0000FFFE
_08128FB0: .4byte 0x020205AC
_08128FB4: .4byte 0x0203A704
	thumb_func_end sub_08128DF8

	thumb_func_start sub_08128FB8
sub_08128FB8: @ 0x08128FB8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	ldr r2, _08128FF0
	ldr r0, _08128FF4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r2, #0
	strh r2, [r0, #0x3c]
	ldr r1, _08128FF8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r2, [r0, #0x1c]
	ldr r1, _08128FFC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128FF0: .4byte 0x020205AC
_08128FF4: .4byte 0x0203A704
_08128FF8: .4byte 0x03005B60
_08128FFC: .4byte 0x08128DF9
	thumb_func_end sub_08128FB8

	thumb_func_start sub_08129000
sub_08129000: @ 0x08129000
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08129024
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0812901A
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08129020
_0812901A:
	adds r0, r2, #0
	bl sub_08128FB8
_08129020:
	pop {r0}
	bx r0
	.align 2, 0
_08129024: .4byte 0x03002360
	thumb_func_end sub_08129000

	thumb_func_start sub_08129028
sub_08129028: @ 0x08129028
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	mov r2, sp
	movs r0, #0
	strh r0, [r2]
	ldr r2, _08129044
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08129044: .4byte 0x01000452
	thumb_func_end sub_08129028

	thumb_func_start sub_08129048
sub_08129048: @ 0x08129048
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	ldr r0, _08129064
	ldr r0, [r0]
	lsrs r1, r1, #0xb
	ldr r0, [r0, #8]
	adds r0, r0, r1
	adds r1, r2, #0
	movs r2, #8
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_08129064: .4byte 0x083B8094
	thumb_func_end sub_08129048

	thumb_func_start sub_08129068
sub_08129068: @ 0x08129068
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	lsrs r4, r1, #0x1a
	adds r5, r4, #0
	cmp r2, #0
	beq _0812907E
	ldr r0, _081290A0
	ands r2, r0
_0812907E:
	ldr r0, _081290A4
	ldr r0, [r0]
	lsls r1, r2, #5
	ldr r0, [r0, #4]
	adds r0, r0, r1
	mov r1, sp
	movs r2, #8
	bl CpuFastSet
	cmp r4, #1
	beq _081290BE
	cmp r4, #1
	bgt _081290A8
	cmp r4, #0
	beq _081290B2
	b _0812917A
	.align 2, 0
_081290A0: .4byte 0x000003FF
_081290A4: .4byte 0x083B8094
_081290A8:
	cmp r5, #2
	beq _0812911E
	cmp r5, #3
	beq _08129156
	b _0812917A
_081290B2:
	mov r0, sp
	adds r1, r7, #0
	movs r2, #8
	bl CpuFastSet
	b _0812917A
_081290BE:
	movs r5, #0
	movs r6, #0xf
_081290C2:
	lsls r4, r5, #2
	adds r4, r4, r7
	adds r5, #1
	lsls r3, r5, #2
	subs r0, r3, #1
	add r0, sp
	ldrb r2, [r0]
	lsrs r1, r2, #4
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	strb r1, [r4]
	subs r0, r3, #2
	add r0, sp
	ldrb r2, [r0]
	lsrs r1, r2, #4
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	strb r1, [r4, #1]
	subs r0, r3, #3
	add r0, sp
	ldrb r2, [r0]
	lsrs r1, r2, #4
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	strb r1, [r4, #2]
	subs r3, #4
	mov r1, sp
	adds r0, r1, r3
	ldrb r2, [r0]
	lsrs r1, r2, #4
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	strb r1, [r4, #3]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	cmp r5, #7
	bls _081290C2
	b _0812917A
_0812911E:
	movs r5, #0
	movs r3, #7
_08129122:
	lsls r2, r5, #2
	adds r2, r2, r7
	subs r1, r3, r5
	lsls r1, r1, #2
	mov r4, sp
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r1, #1
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r2, #1]
	adds r0, r1, #2
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r2, #2]
	adds r1, #3
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r2, #3]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #7
	bls _08129122
	b _0812917A
_08129156:
	movs r5, #0
	movs r4, #0x1f
	movs r6, #0xf
_0812915C:
	adds r3, r7, r5
	subs r0, r4, r5
	add r0, sp
	ldrb r2, [r0]
	lsrs r1, r2, #4
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	strb r1, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x1f
	bls _0812915C
_0812917A:
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08129068

	thumb_func_start sub_08129184
sub_08129184: @ 0x08129184
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0812918A:
	lsls r0, r4, #5
	adds r0, #0x84
	adds r0, r5, r0
	lsls r2, r4, #1
	adds r1, r5, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_08129068
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x3f
	bls _0812918A
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08129184

	thumb_func_start sub_081291AC
sub_081291AC: @ 0x081291AC
	lsls r0, r0, #0x10
	ldr r1, _081291C0
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _081291C4
	ands r0, r1
	bx lr
	.align 2, 0
_081291C0: .4byte 0x083B8098
_081291C4: .4byte 0x00000FFF
	thumb_func_end sub_081291AC

	thumb_func_start sub_081291C8
sub_081291C8: @ 0x081291C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, [r0]
	ldrb r0, [r0, #0xd]
	movs r6, #0
	ldr r1, _08129238
	lsls r5, r0, #4
	adds r0, r5, r1
	ldrb r0, [r0, #0xc]
	cmp r6, r0
	bhs _0812922C
	adds r7, r1, #0
_081291E4:
	mov r4, r8
	ldm r4!, {r1}
	adds r0, r7, #4
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	ldr r1, [r1, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r7, #0
	adds r1, #8
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r6
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_081291AC
	adds r2, r5, r7
	ldr r1, [r2]
	adds r1, r1, r6
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r4, r4, r1
	strh r0, [r4]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r2, [r2, #0xc]
	cmp r6, r2
	blo _081291E4
_0812922C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08129238: .4byte 0x08582094
	thumb_func_end sub_081291C8

	thumb_func_start SetDecorSelectionBoxOamAttributes
SetDecorSelectionBoxOamAttributes: @ 0x0812923C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	ldr r3, _081292A0
	movs r1, #0
	strb r1, [r3]
	ldrb r2, [r3, #1]
	subs r1, #4
	ands r1, r2
	movs r5, #0xd
	rsbs r5, r5, #0
	ands r1, r5
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #0x10
	ands r1, r2
	strb r1, [r3, #1]
	ldr r1, _081292A4
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r4, #0x3f
	lsls r1, r1, #6
	strb r1, [r3, #1]
	ldrh r2, [r3, #2]
	ldr r1, _081292A8
	ands r1, r2
	strh r1, [r3, #2]
	ldrb r2, [r3, #3]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r3, #3]
	ldrb r0, [r0, #1]
	lsls r0, r0, #6
	ands r4, r1
	orrs r4, r0
	strb r4, [r3, #3]
	ldrh r1, [r3, #4]
	ldr r0, _081292AC
	ands r0, r1
	strh r0, [r3, #4]
	ldrb r0, [r3, #5]
	ands r5, r0
	movs r0, #0xf
	ands r5, r0
	strb r5, [r3, #5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081292A0: .4byte 0x0203A708
_081292A4: .4byte 0x08582134
_081292A8: .4byte 0xFFFFFE00
_081292AC: .4byte 0xFFFFFC00
	thumb_func_end SetDecorSelectionBoxOamAttributes

	thumb_func_start sub_081292B0
sub_081292B0: @ 0x081292B0
	movs r1, #0
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	strh r1, [r0, #0x38]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x3c]
	ldr r1, _081292C4
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_081292C4: .4byte 0x081292C9
	thumb_func_end sub_081292B0

	thumb_func_start sub_081292C8
sub_081292C8: @ 0x081292C8
	push {lr}
	adds r2, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _08129302
	movs r1, #0x3a
	ldrsh r0, [r2, r1]
	cmp r0, #0xe
	bgt _081292EA
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	b _081292F4
_081292EA:
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
_081292F4:
	strb r0, [r3]
	ldrh r0, [r2, #0x3a]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2, #0x3a]
	b _0812930E
_08129302:
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0812930E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081292C8

	thumb_func_start gpu_pal_decompress_alloc_tag_and_upload
gpu_pal_decompress_alloc_tag_and_upload: @ 0x08129314
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl sub_08129028
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _08129380
	adds r1, r0, r1
	str r1, [r5]
	ldrb r0, [r1, #0xc]
	cmp r0, #4
	beq _08129398
	ldr r0, _08129384
	bl FreeSpritePaletteByTag
	adds r0, r5, #0
	bl sub_081291C8
	ldr r0, [r5]
	ldrb r0, [r0, #0xd]
	bl SetDecorSelectionBoxOamAttributes
	adds r0, r5, #0
	bl sub_08129184
	ldr r1, _08129388
	adds r0, r5, r1
	ldr r1, _0812938C
	ldr r2, [r1]
	ldr r1, [r5]
	ldr r1, [r1, #0x18]
	ldrh r1, [r1]
	ldr r2, [r2, #0xc]
	lsls r1, r1, #4
	adds r1, r1, r2
	ldrh r1, [r1, #0xe]
	lsrs r1, r1, #0xc
	bl sub_08129048
	ldr r0, _08129390
	bl LoadSpritePalette
	ldr r0, _08129394
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	b _081293AA
	.align 2, 0
_08129380: .4byte 0x08580CD0
_08129384: .4byte 0x00000BE5
_08129388: .4byte 0x00000884
_0812938C: .4byte 0x083B8098
_08129390: .4byte 0x085821A0
_08129394: .4byte 0x08582170
_08129398:
	ldr r0, [r1, #0x18]
	ldrh r0, [r0]
	ldr r1, _081293B8
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl AddPseudoEventObject
_081293AA:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081293B8: .4byte 0x08007141
	thumb_func_end gpu_pal_decompress_alloc_tag_and_upload

	thumb_func_start AddDecorationIconObjectFromIconTable
AddDecorationIconObjectFromIconTable: @ 0x081293BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	bl AllocItemIconTemporaryBuffers
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08129474
	adds r0, r5, #0
	movs r1, #0
	bl GetDecorationIconPicOrPalette
	ldr r4, _08129460
	ldr r1, [r4]
	bl LZDecompressVram
	ldr r0, [r4]
	ldr r4, _08129464
	ldr r1, [r4]
	bl CopyItemIconPicTo4x4Buffer
	ldr r0, [r4]
	str r0, [sp]
	ldr r4, _08129468
	ldr r0, [sp, #4]
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	lsls r2, r7, #0x10
	ldr r1, _0812946C
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r5, #0
	movs r1, #1
	bl GetDecorationIconPicOrPalette
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, [r0, #4]
	ands r1, r4
	orrs r1, r6
	str r1, [r0, #4]
	bl LoadCompressedSpritePalette
	movs r0, #0x18
	bl Alloc
	adds r5, r0, #0
	adds r1, r5, #0
	ldr r0, _08129470
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	strh r7, [r5]
	strh r6, [r5, #2]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl FreeItemIconTemporaryBuffers
	adds r0, r5, #0
	bl Free
	adds r0, r4, #0
	b _08129476
	.align 2, 0
_08129460: .4byte 0x0203CB88
_08129464: .4byte 0x0203CB8C
_08129468: .4byte 0xFFFF0000
_0812946C: .4byte 0x0000FFFF
_08129470: .4byte 0x085E08AC
_08129474:
	movs r0, #0x40
_08129476:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AddDecorationIconObjectFromIconTable

	thumb_func_start GetDecorationIconPicOrPalette
GetDecorationIconPicOrPalette: @ 0x08129480
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r3, #0x78
	bls _08129490
	movs r3, #0
_08129490:
	ldr r2, _081294A0
	lsls r0, r0, #2
	lsls r1, r3, #3
	adds r0, r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_081294A0: .4byte 0x08581ACC
	thumb_func_end GetDecorationIconPicOrPalette

	thumb_func_start AddDecorationIconObjectFromEventObject
AddDecorationIconObjectFromEventObject: @ 0x081294A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _08129570
	adds r0, r6, #0
	bl sub_08129028
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _08129574
	adds r1, r0, r1
	str r1, [r6]
	ldrb r0, [r1, #0xc]
	cmp r0, #4
	beq _0812958C
	adds r0, r6, #0
	bl sub_081291C8
	ldr r0, [r6]
	ldrb r0, [r0, #0xd]
	bl SetDecorSelectionBoxOamAttributes
	adds r0, r6, #0
	bl sub_08129184
	ldr r0, _08129578
	adds r5, r6, r0
	ldr r0, _0812957C
	ldr r1, [r0]
	ldr r0, [r6]
	ldr r0, [r0, #0x18]
	ldrh r0, [r0]
	ldr r1, [r1, #0xc]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r1, [r0, #0xe]
	lsrs r1, r1, #0xc
	adds r0, r5, #0
	bl sub_08129048
	adds r0, r6, #0
	adds r0, #0x84
	str r0, [sp, #4]
	ldr r1, _08129580
	ldr r0, [r6]
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x15
	ldr r4, _08129584
	mov r2, r8
	lsls r1, r2, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp, #8]
	add r0, sp, #4
	bl LoadSpriteSheet
	str r5, [sp, #0xc]
	add r0, sp, #0xc
	ldr r1, [r0, #4]
	ands r1, r4
	orrs r1, r7
	str r1, [r0, #4]
	bl LoadSpritePalette
	movs r0, #0x18
	bl Alloc
	adds r4, r0, #0
	adds r1, r4, #0
	ldr r0, _08129588
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	mov r3, r8
	strh r3, [r4]
	strh r7, [r4, #2]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl Free
	b _081295A2
	.align 2, 0
_08129570: .4byte 0x02039E5C
_08129574: .4byte 0x08580CD0
_08129578: .4byte 0x00000884
_0812957C: .4byte 0x083B8098
_08129580: .4byte 0x085821D8
_08129584: .4byte 0xFFFF0000
_08129588: .4byte 0x08582188
_0812958C:
	ldr r0, [r1, #0x18]
	ldrh r0, [r0]
	ldr r1, _081295B0
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl AddPseudoEventObject
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_081295A2:
	adds r0, r5, #0
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081295B0: .4byte 0x08007141
	thumb_func_end AddDecorationIconObjectFromEventObject

	thumb_func_start AddDecorationIconObject
AddDecorationIconObject: @ 0x081295B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov ip, r6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	mov sb, r8
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	mov sl, r7
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r3, r4, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r2, r5, #0
	cmp r6, #0x78
	bls _0812961C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl AddDecorationIconObjectFromIconTable
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x40
	beq _0812967E
	ldr r2, _08129618
	lsls r3, r4, #4
	adds r1, r3, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, #4
	strh r0, [r1, #0x24]
	lsls r0, r7, #0x10
	b _0812969A
	.align 2, 0
_08129618: .4byte 0x020205AC
_0812961C:
	ldr r0, _08129660
	lsls r1, r6, #3
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _0812966C
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl AddDecorationIconObjectFromEventObject
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x40
	beq _0812967E
	ldr r1, _08129664
	lsls r2, r4, #4
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r5, r0, r1
	mov r0, r8
	strh r0, [r5, #0x24]
	adds r0, r6, #0
	subs r0, #0x2a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08129668
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, #4
	strh r0, [r5, #0x26]
	b _081296A4
	.align 2, 0
_08129660: .4byte 0x08581ACC
_08129664: .4byte 0x020205AC
_08129668:
	strh r7, [r5, #0x26]
	b _081296A4
_0812966C:
	adds r0, r3, #0
	adds r1, r2, #0
	mov r2, ip
	bl AddDecorationIconObjectFromIconTable
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x40
	bne _08129682
_0812967E:
	movs r0, #0x40
	b _081296C0
_08129682:
	ldr r2, _081296D0
	lsls r3, r4, #4
	adds r1, r3, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	mov r5, sb
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, #4
	strh r0, [r1, #0x24]
	mov r5, sl
	lsls r0, r5, #0x10
_0812969A:
	asrs r0, r0, #0x10
	adds r0, #4
	strh r0, [r1, #0x26]
	adds r1, r2, #0
	adds r2, r3, #0
_081296A4:
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r2, r1
	movs r0, #3
	ldr r1, [sp]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	adds r0, r4, #0
_081296C0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081296D0: .4byte 0x020205AC
	thumb_func_end AddDecorationIconObject

	thumb_func_start sub_081296D4
sub_081296D4: @ 0x081296D4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _081296EC
	ldr r1, [r3]
	adds r1, r1, r0
	movs r2, #0
	strb r2, [r1]
	ldr r1, [r3, #4]
	adds r1, r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_081296EC: .4byte 0x02039E48
	thumb_func_end sub_081296D4

	thumb_func_start sub_081296F0
sub_081296F0: @ 0x081296F0
	push {r4, r5, r6, lr}
	ldr r6, _08129710
	movs r0, #0
	strh r0, [r6]
	ldr r2, _08129714
	strh r0, [r2]
	ldr r4, _08129718
	ldr r1, _0812971C
	ldrh r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0812972C
	movs r0, #1
	strh r0, [r2]
	b _08129782
	.align 2, 0
_08129710: .4byte 0x02037282
_08129714: .4byte 0x02037290
_08129718: .4byte 0x02037280
_0812971C: .4byte 0x0203A790
_08129720:
	ldr r1, _08129728
	ldrb r0, [r2]
	strh r0, [r1]
	b _08129782
	.align 2, 0
_08129728: .4byte 0x02037284
_0812972C:
	ldr r3, _08129788
	ldr r2, _0812978C
	ldr r1, _08129790
	ldrh r0, [r4]
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrb r1, [r4]
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0xc]
	cmp r0, #4
	bne _08129782
	ldrh r0, [r4, #4]
	strh r0, [r6]
	ldrb r0, [r4]
	bl sub_081296D4
	movs r1, #0
	ldr r0, _08129794
	ldr r0, [r0, #4]
	ldrb r2, [r0]
	cmp r1, r2
	bhs _08129782
	ldr r5, [r0, #4]
	ldrh r4, [r6]
	adds r3, r2, #0
_0812976A:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r0, [r2, #0x14]
	cmp r0, r4
	beq _08129720
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r3
	blo _0812976A
_08129782:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08129788: .4byte 0x08580CD0
_0812978C: .4byte 0x02039E48
_08129790: .4byte 0x0203A710
_08129794: .4byte 0x02036FB8
	thumb_func_end sub_081296F0

	thumb_func_start sub_08129798
sub_08129798: @ 0x08129798
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r0, _081297C4
	ldr r0, [r0, #4]
	ldrb r1, [r0]
	cmp r2, r1
	bhs _081297DC
	adds r3, r0, #0
	ldr r5, [r3, #4]
	ldr r0, _081297C8
	ldrh r4, [r0]
	ldr r6, _081297CC
_081297B0:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r5
	ldrh r0, [r1, #0x14]
	cmp r0, r4
	bne _081297D0
	ldrb r0, [r1]
	strh r0, [r6]
	b _081297DC
	.align 2, 0
_081297C4: .4byte 0x02036FB8
_081297C8: .4byte 0x02037280
_081297CC: .4byte 0x02037282
_081297D0:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrb r0, [r3]
	cmp r2, r0
	blo _081297B0
_081297DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08129798

	thumb_func_start sub_081297E4
sub_081297E4: @ 0x081297E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r6, #0
	b _081298AE
_081297F4:
	ldr r3, _081298C8
	lsls r5, r6, #3
	adds r4, r5, r3
	ldrb r2, [r4]
	ldr r1, _081298CC
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r7, _081298D0
	adds r0, r0, r7
	ldrb r1, [r0, #0xc]
	ldr r7, _081298CC
	ldr r0, [r7, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r2, r0, #4
	mov r8, r2
	movs r7, #0xf
	adds r2, r7, #0
	ands r2, r0
	str r2, [sp]
	adds r7, r5, #0
	adds r6, #1
	str r6, [sp, #4]
	cmp r1, #4
	beq _081298A8
	movs r6, #0
	ldrb r4, [r4, #2]
	cmp r6, r4
	bhs _0812989E
_08129836:
	movs r4, #0
	adds r0, r5, r3
	adds r3, r6, #1
	mov sl, r3
	ldrb r0, [r0, #1]
	cmp r4, r0
	bhs _0812988C
	ldr r5, _081298C8
	adds r5, r5, r7
	mov sb, r5
	subs r0, r6, #7
	str r0, [sp, #8]
_0812984E:
	adds r0, r4, #7
	add r0, r8
	ldr r1, _081298D4
	ldr r3, [r1]
	ldr r1, [sp]
	subs r2, r1, r6
	ldr r1, [r3]
	muls r2, r1, r2
	mov r5, r8
	adds r1, r5, r4
	adds r1, r1, r2
	ldr r2, [r3, #0xc]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r3, #0xc0
	lsls r3, r3, #6
	adds r2, r3, #0
	orrs r2, r1
	ldr r5, [sp]
	ldr r3, [sp, #8]
	subs r1, r5, r3
	bl MapGridSetMetatileEntryAt
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r5, sb
	ldrb r5, [r5, #1]
	cmp r4, r5
	blo _0812984E
_0812988C:
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r3, _081298C8
	adds r5, r7, #0
	adds r0, r7, r3
	ldrb r0, [r0, #2]
	cmp r6, r0
	blo _08129836
_0812989E:
	ldr r2, _081298C8
	adds r0, r7, r2
	ldrb r0, [r0]
	bl sub_081296D4
_081298A8:
	ldr r3, [sp, #4]
	lsls r0, r3, #0x18
	lsrs r6, r0, #0x18
_081298AE:
	ldr r0, _081298D8
	ldrb r0, [r0]
	cmp r6, r0
	blo _081297F4
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081298C8: .4byte 0x0203A710
_081298CC: .4byte 0x02039E48
_081298D0: .4byte 0x08580CD0
_081298D4: .4byte 0x02036FB8
_081298D8: .4byte 0x0203A790
	thumb_func_end sub_081297E4

	thumb_func_start sub_081298DC
sub_081298DC: @ 0x081298DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08129900
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08129918
	cmp r0, #1
	bgt _08129904
	cmp r0, #0
	beq _0812990E
	b _08129984
	.align 2, 0
_08129900: .4byte 0x03005B60
_08129904:
	cmp r0, #2
	beq _08129944
	cmp r0, #3
	beq _08129958
	b _08129984
_0812990E:
	bl sub_081297E4
	movs r0, #1
	strh r0, [r4, #0xc]
	b _08129984
_08129918:
	ldr r0, _0812993C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08129984
	bl DrawWholeMapView
	ldr r0, _08129940
	bl ScriptContext1_SetupScript
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	movs r0, #2
	strh r0, [r4, #0xc]
	b _08129984
	.align 2, 0
_0812993C: .4byte 0x02037C74
_08129940: .4byte 0x08245DDD
_08129944:
	bl ScriptContext2_Enable
	adds r0, r5, #0
	bl IdentifyOwnedDecorationsCurrentlyInUseInternal
	bl pal_fill_black
	movs r0, #3
	strh r0, [r4, #0xc]
	b _08129984
_08129958:
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08129984
	ldr r4, _0812998C
	ldr r1, _08129990
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08129994
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
	ldr r0, _08129998
	ldrb r0, [r0, #0x14]
	cmp r0, #0x56
	bne _08129984
	bl TV_PutSecretBaseVisitOnTheAir
_08129984:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812998C: .4byte 0x02021C7C
_08129990: .4byte 0x085CA867
_08129994: .4byte 0x08129D55
_08129998: .4byte 0x02036FB8
	thumb_func_end sub_081298DC

	thumb_func_start sub_0812999C
sub_0812999C: @ 0x0812999C
	push {lr}
	movs r1, #0
	ldr r0, _081299B8
	ldrb r2, [r0, #8]
	cmp r1, r2
	bhs _081299C6
	ldr r3, [r0]
_081299AA:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081299BC
	movs r0, #1
	b _081299C8
	.align 2, 0
_081299B8: .4byte 0x02039E48
_081299BC:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r2
	blo _081299AA
_081299C6:
	movs r0, #0
_081299C8:
	pop {r1}
	bx r1
	thumb_func_end sub_0812999C

	thumb_func_start SetUpPuttingAwayDecorationPlayerAvatar
SetUpPuttingAwayDecorationPlayerAvatar: @ 0x081299CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	bl GetPlayerFacingDirection
	ldr r3, _08129A14
	ldr r2, _08129A18
	ldr r4, _08129A1C
	ldr r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x2e]
	strb r0, [r3]
	bl sub_0812A3A8
	ldr r0, _08129A20
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #4]
	ldr r0, _08129A24
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08129A2C
	ldr r1, _08129A28
	str r0, [sp]
	movs r0, #0xc1
	b _08129A34
	.align 2, 0
_08129A14: .4byte 0x0203A704
_08129A18: .4byte 0x020205AC
_08129A1C: .4byte 0x03005B30
_08129A20: .4byte 0x085822E8
_08129A24: .4byte 0x03005AF0
_08129A28: .4byte 0x08007141
_08129A2C:
	ldr r1, _08129A98
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc2
_08129A34:
	movs r2, #0x88
	movs r3, #0x48
	bl AddPseudoEventObject
	ldr r1, _08129A9C
	strb r0, [r1]
	ldr r6, _08129AA0
	ldr r0, _08129A9C
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r2, [r1, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	movs r2, #4
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r5, _08129AA4
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	ldr r0, _08129AA8
	ldr r0, [r0, #4]
	strb r0, [r5]
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0, #5]
	ands r4, r1
	mov r1, r8
	orrs r4, r1
	strb r4, [r0, #5]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08129A98: .4byte 0x08007141
_08129A9C: .4byte 0x0203A705
_08129AA0: .4byte 0x020205AC
_08129AA4: .4byte 0x0203A704
_08129AA8: .4byte 0x03005B30
	thumb_func_end SetUpPuttingAwayDecorationPlayerAvatar

	thumb_func_start sub_08129AAC
sub_08129AAC: @ 0x08129AAC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08129AD0
	adds r4, r0, r1
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08129AFC
	cmp r0, #1
	bgt _08129AD4
	cmp r0, #0
	beq _08129ADA
	b _08129B1E
	.align 2, 0
_08129AD0: .4byte 0x03005B68
_08129AD4:
	cmp r0, #2
	beq _08129B0A
	b _08129B1E
_08129ADA:
	ldr r0, _08129AF8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08129B1E
	adds r0, r5, #0
	bl sub_08127A7C
	movs r0, #1
	strh r0, [r4, #4]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xa]
	b _08129B1E
	.align 2, 0
_08129AF8: .4byte 0x02037C74
_08129AFC:
	bl SetUpPuttingAwayDecorationPlayerAvatar
	bl pal_fill_black
	movs r0, #2
	strh r0, [r4, #4]
	b _08129B1E
_08129B0A:
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08129B1E
	strh r0, [r4, #0x18]
	adds r0, r5, #0
	bl sub_08129B24
_08129B1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08129AAC

	thumb_func_start sub_08129B24
sub_08129B24: @ 0x08129B24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	ldr r4, _08129BA4
	ldr r3, _08129BA8
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r6, #0
	strh r6, [r0, #0x3c]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08129BAC
	str r1, [r0]
	ldr r2, _08129BB0
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x88
	strh r1, [r0, #0x20]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x48
	strh r1, [r0, #0x22]
	ldr r1, _08129BB4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #0x1c]
	ldr r1, _08129BB8
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08129BA4: .4byte 0x020205AC
_08129BA8: .4byte 0x0203A704
_08129BAC: .4byte 0x0812A379
_08129BB0: .4byte 0x0203A705
_08129BB4: .4byte 0x03005B60
_08129BB8: .4byte 0x08128DF9
	thumb_func_end sub_08129B24

	thumb_func_start sub_08129BBC
sub_08129BBC: @ 0x08129BBC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08129BE4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x1c]
	bl sub_08128DC0
	adds r0, r4, #0
	bl sub_08129C64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129BE4: .4byte 0x03005B60
	thumb_func_end sub_08129BBC

	thumb_func_start sub_08129BE8
sub_08129BE8: @ 0x08129BE8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08129C48
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x1c]
	bl sub_08128DC0
	ldr r3, _08129C4C
	ldr r5, _08129C50
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, #0x1c
	adds r0, r0, r3
	ldr r1, _08129C54
	str r1, [r0]
	ldr r5, _08129C58
	ldr r1, _08129C5C
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldr r2, _08129C60
	adds r0, r4, #0
	adds r1, r5, #0
	bl DisplayItemMessageOnField
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08129C48: .4byte 0x03005B60
_08129C4C: .4byte 0x020205AC
_08129C50: .4byte 0x0203A704
_08129C54: .4byte 0x08007141
_08129C58: .4byte 0x02021C7C
_08129C5C: .4byte 0x085CA835
_08129C60: .4byte 0x0812A1FD
	thumb_func_end sub_08129BE8

	thumb_func_start sub_08129C64
sub_08129C64: @ 0x08129C64
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl sub_0812A0F4
	ldr r0, _08129C88
	ldrb r0, [r0]
	cmp r0, #0
	beq _08129C98
	ldr r4, _08129C8C
	ldr r1, _08129C90
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08129C94
	b _08129D04
	.align 2, 0
_08129C88: .4byte 0x0203A790
_08129C8C: .4byte 0x02021C7C
_08129C90: .4byte 0x085CA852
_08129C94: .4byte 0x0812A1AD
_08129C98:
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	ldr r0, _08129D10
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsSecretBasePC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08129CCE
	adds r0, r4, #0
	bl MetatileBehavior_IsPlayerRoomPCOn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08129D2C
_08129CCE:
	ldr r3, _08129D14
	ldr r4, _08129D18
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, #0x1c
	adds r0, r0, r3
	ldr r1, _08129D1C
	str r1, [r0]
	ldr r4, _08129D20
	ldr r1, _08129D24
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08129D28
_08129D04:
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
	b _08129D40
	.align 2, 0
_08129D10: .4byte 0x03005B68
_08129D14: .4byte 0x020205AC
_08129D18: .4byte 0x0203A704
_08129D1C: .4byte 0x08007141
_08129D20: .4byte 0x02021C7C
_08129D24: .4byte 0x085CA835
_08129D28: .4byte 0x0812A1FD
_08129D2C:
	ldr r4, _08129D48
	ldr r1, _08129D4C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _08129D50
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
_08129D40:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08129D48: .4byte 0x02021C7C
_08129D4C: .4byte 0x085CA842
_08129D50: .4byte 0x08129D55
	thumb_func_end sub_08129C64

	thumb_func_start sub_08129D54
sub_08129D54: @ 0x08129D54
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08129D78
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08129D6E
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08129D74
_08129D6E:
	adds r0, r2, #0
	bl sub_08129B24
_08129D74:
	pop {r0}
	bx r0
	.align 2, 0
_08129D78: .4byte 0x03002360
	thumb_func_end sub_08129D54

	thumb_func_start sub_08129D7C
sub_08129D7C: @ 0x08129D7C
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08129D9C
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #0xd]
	cmp r1, #0
	bne _08129DA0
	movs r0, #1
	strb r0, [r3, #1]
	b _08129DFE
	.align 2, 0
_08129D9C: .4byte 0x08580CD0
_08129DA0:
	cmp r1, #1
	bne _08129DAC
	movs r0, #2
	strb r0, [r3, #1]
	strb r1, [r3, #2]
	b _08129E00
_08129DAC:
	cmp r1, #2
	bne _08129DB8
	movs r0, #3
	strb r0, [r3, #1]
	movs r0, #1
	b _08129DFE
_08129DB8:
	cmp r1, #3
	bne _08129DC0
	movs r0, #4
	b _08129DFA
_08129DC0:
	cmp r1, #4
	bne _08129DCA
	movs r0, #2
	strb r0, [r3, #1]
	b _08129DFE
_08129DCA:
	cmp r1, #5
	bne _08129DD2
	movs r0, #1
	b _08129DFA
_08129DD2:
	cmp r1, #6
	bne _08129DDE
	movs r0, #1
	strb r0, [r3, #1]
	movs r0, #3
	b _08129DFE
_08129DDE:
	cmp r1, #7
	bne _08129DEA
	movs r0, #2
	strb r0, [r3, #1]
	movs r0, #4
	b _08129DFE
_08129DEA:
	cmp r1, #8
	bne _08129DF4
	movs r0, #3
	strb r0, [r3, #1]
	b _08129DFE
_08129DF4:
	cmp r1, #9
	bne _08129E00
	movs r0, #3
_08129DFA:
	strb r0, [r3, #1]
	movs r0, #2
_08129DFE:
	strb r0, [r3, #2]
_08129E00:
	pop {r0}
	bx r0
	thumb_func_end sub_08129D7C

	thumb_func_start sub_08129E04
sub_08129E04: @ 0x08129E04
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r5, _08129E5C
	ldr r6, _08129E60
	ldrb r3, [r6]
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r5
	adds r2, #0x3e
	ldrb r3, [r2]
	movs r4, #4
	orrs r3, r4
	strb r3, [r2]
	ldrb r3, [r6]
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r3, r5, #0
	adds r3, #0x1c
	adds r2, r2, r3
	ldr r3, _08129E64
	str r3, [r2]
	ldr r4, _08129E68
	ldrb r3, [r4]
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r5
	lsrs r0, r0, #0x14
	adds r0, #0x88
	strh r0, [r2, #0x20]
	ldrb r2, [r4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r5
	lsrs r1, r1, #0x14
	adds r1, #0x48
	strh r1, [r0, #0x22]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08129E5C: .4byte 0x020205AC
_08129E60: .4byte 0x0203A704
_08129E64: .4byte 0x08007141
_08129E68: .4byte 0x0203A705
	thumb_func_end sub_08129E04

	thumb_func_start sub_08129E6C
sub_08129E6C: @ 0x08129E6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _08129F00
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	ldrb r0, [r2, #8]
	subs r0, #7
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r2, #0xa]
	subs r0, #7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r2, _08129F04
	ldr r0, [r2, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r5, r0, #4
	movs r6, #0xf
	ands r6, r0
	mov r0, sb
	ldrb r4, [r0, #2]
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x29
	bne _08129ECC
	adds r0, r5, #7
	adds r1, r6, #7
	bl MapGridGetMetatileIdAt
	movs r1, #0xa3
	lsls r1, r1, #2
	cmp r0, r1
	bne _08129ECC
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08129ECC:
	cmp r7, r5
	blo _08129F08
	mov r0, sb
	ldrb r2, [r0, #1]
	adds r0, r5, r2
	cmp r7, r0
	bge _08129F08
	subs r0, r6, r4
	cmp r8, r0
	ble _08129F08
	cmp r8, r6
	bhi _08129F08
	subs r0, r7, r5
	adds r0, #1
	subs r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, r8
	subs r1, r6, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_08129E04
	movs r0, #1
	b _08129F0A
	.align 2, 0
_08129F00: .4byte 0x03005B60
_08129F04: .4byte 0x02039E48
_08129F08:
	movs r0, #0
_08129F0A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08129E6C

	thumb_func_start sub_08129F18
sub_08129F18: @ 0x08129F18
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _08129F8C
	ldr r3, _08129F90
	ldr r0, _08129F94
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r1, [r0]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r1, r0, #4
	mov r8, r1
	movs r6, #0xf
	ands r6, r0
	movs r4, #0
	ldr r7, _08129F98
	mov sb, r3
_08129F42:
	ldr r1, [r7]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #3
	adds r1, r1, r5
	ldr r2, _08129F9C
	adds r0, r1, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, r8
	bne _08129FA8
	ldr r2, _08129FA0
	adds r0, r1, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, r6
	bne _08129FA8
	ldr r2, _08129FA4
	adds r0, r1, r2
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08129FA8
	ldr r0, _08129F94
	ldrb r1, [r0]
	lsls r1, r1, #3
	add r1, sb
	ldr r0, [r7]
	adds r0, r0, r5
	ldr r2, _08129FA4
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1, #4]
	b _08129FB2
	.align 2, 0
_08129F8C: .4byte 0x02039E48
_08129F90: .4byte 0x0203A710
_08129F94: .4byte 0x0203A790
_08129F98: .4byte 0x03005AEC
_08129F9C: .4byte 0x00000C74
_08129FA0: .4byte 0x00000C76
_08129FA4: .4byte 0x00000C84
_08129FA8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x3f
	bls _08129F42
_08129FB2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08129F18

	thumb_func_start sub_08129FC0
sub_08129FC0: @ 0x08129FC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	ldr r0, _0812A020
	ldrb r1, [r0, #8]
	cmp r6, r1
	bhs _0812A03E
	ldr r1, _0812A024
	mov r8, r1
_08129FD8:
	ldr r0, [r0]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0
	beq _0812A030
	adds r1, r0, #0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0, #0xc]
	cmp r0, #4
	bne _0812A030
	ldr r5, _0812A028
	adds r0, r1, #0
	adds r1, r5, #0
	bl sub_08129D7C
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r7, #0
	adds r2, r5, #0
	bl sub_08129E6C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _0812A030
	strb r6, [r5]
	bl sub_08129F18
	ldr r0, _0812A02C
	strb r4, [r0]
	movs r0, #1
	b _0812A040
	.align 2, 0
_0812A020: .4byte 0x02039E48
_0812A024: .4byte 0x08580CD0
_0812A028: .4byte 0x0203A710
_0812A02C: .4byte 0x0203A790
_0812A030:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0812A04C
	ldrb r1, [r0, #8]
	cmp r6, r1
	blo _08129FD8
_0812A03E:
	movs r0, #0
_0812A040:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0812A04C: .4byte 0x02039E48
	thumb_func_end sub_08129FC0

	thumb_func_start sub_0812A050
sub_0812A050: @ 0x0812A050
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r5, #0
	ldr r1, _0812A0E4
	ldrb r0, [r1, #8]
	cmp r5, r0
	bhs _0812A0D4
	ldr r6, _0812A0E8
_0812A07C:
	ldr r0, [r1]
	adds r0, r0, r5
	ldrb r2, [r0]
	ldr r0, [r1, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r4, r0, #4
	movs r3, #0xf
	ands r3, r0
	cmp r2, #0
	beq _0812A0C6
	ldr r0, _0812A0EC
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0xc]
	cmp r0, #4
	bne _0812A0C6
	cmp sl, r4
	bhi _0812A0C6
	cmp sb, r3
	bhi _0812A0C6
	cmp r8, r4
	blo _0812A0C6
	cmp r7, r3
	blo _0812A0C6
	ldr r0, _0812A0F0
	ldrb r1, [r6]
	lsls r1, r1, #3
	adds r1, r1, r0
	strb r5, [r1]
	bl sub_08129F18
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_0812A0C6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0812A0E4
	ldrb r0, [r1, #8]
	cmp r5, r0
	blo _0812A07C
_0812A0D4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A0E4: .4byte 0x02039E48
_0812A0E8: .4byte 0x0203A790
_0812A0EC: .4byte 0x08580CD0
_0812A0F0: .4byte 0x0203A710
	thumb_func_end sub_0812A050

	thumb_func_start sub_0812A0F4
sub_0812A0F4: @ 0x0812A0F4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _0812A14C
	movs r0, #0
	strb r0, [r4]
	adds r0, r6, #0
	bl sub_08129FC0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0812A198
	movs r5, #0
	ldr r0, _0812A150
	ldrb r1, [r0, #8]
	cmp r5, r1
	bhs _0812A166
	adds r7, r4, #0
_0812A11A:
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0812A158
	ldr r4, _0812A154
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_08129D7C
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_08129E6C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0812A158
	strb r5, [r4]
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	b _0812A166
	.align 2, 0
_0812A14C: .4byte 0x0203A790
_0812A150: .4byte 0x02039E48
_0812A154: .4byte 0x0203A710
_0812A158:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0812A1A0
	ldrb r1, [r0, #8]
	cmp r5, r1
	blo _0812A11A
_0812A166:
	ldr r0, _0812A1A4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0812A198
	ldr r0, _0812A1A0
	ldr r2, _0812A1A8
	ldrb r1, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, #4
	movs r3, #0xf
	ands r3, r1
	ldrb r1, [r2, #2]
	subs r1, r3, r1
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r2, #1]
	adds r2, r2, r0
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl sub_0812A050
_0812A198:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A1A0: .4byte 0x02039E48
_0812A1A4: .4byte 0x0203A790
_0812A1A8: .4byte 0x0203A710
	thumb_func_end sub_0812A0F4

	thumb_func_start sub_0812A1AC
sub_0812A1AC: @ 0x0812A1AC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _0812A1C8
	adds r0, r4, #0
	bl DoYesNoFuncWithChoice
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A1C8: .4byte 0x0858222C
	thumb_func_end sub_0812A1AC

	thumb_func_start sub_0812A1CC
sub_0812A1CC: @ 0x0812A1CC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r1, _0812A1F4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _0812A1F8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A1F4: .4byte 0x03005B60
_0812A1F8: .4byte 0x081298DD
	thumb_func_end sub_0812A1CC

	thumb_func_start sub_0812A1FC
sub_0812A1FC: @ 0x0812A1FC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _0812A218
	adds r0, r4, #0
	bl DoYesNoFuncWithChoice
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A218: .4byte 0x08582234
	thumb_func_end sub_0812A1FC

	thumb_func_start sub_0812A21C
sub_0812A21C: @ 0x0812A21C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	adds r0, r4, #0
	bl sub_0812A238
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0812A21C

	thumb_func_start sub_0812A238
sub_0812A238: @ 0x0812A238
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r1, _0812A260
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _0812A264
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A260: .4byte 0x03005B60
_0812A264: .4byte 0x0812A269
	thumb_func_end sub_0812A238

	thumb_func_start sub_0812A268
sub_0812A268: @ 0x0812A268
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0812A288
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0812A28C
	cmp r0, #1
	beq _0812A2A8
	b _0812A2BE
	.align 2, 0
_0812A288: .4byte 0x03005B60
_0812A28C:
	ldr r0, _0812A2A4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0812A2BE
	adds r0, r4, #0
	bl sub_08127AB4
	movs r0, #1
	strh r0, [r5, #0xc]
	b _0812A2BE
	.align 2, 0
_0812A2A4: .4byte 0x02037C74
_0812A2A8:
	bl sub_0812A3D4
	ldr r0, _0812A2C4
	ldr r1, _0812A2C8
	str r1, [r0]
	ldr r0, _0812A2CC
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_0812A2BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A2C4: .4byte 0x03005B0C
_0812A2C8: .4byte 0x0812A341
_0812A2CC: .4byte 0x08085A31
	thumb_func_end sub_0812A268

	thumb_func_start sub_0812A2D0
sub_0812A2D0: @ 0x0812A2D0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r5, r1, #3
	ldr r6, _0812A2F4
	adds r4, r5, r6
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0812A308
	cmp r0, #1
	bgt _0812A2F8
	cmp r0, #0
	beq _0812A302
	b _0812A336
	.align 2, 0
_0812A2F4: .4byte 0x03005B68
_0812A2F8:
	cmp r0, #2
	beq _0812A314
	cmp r0, #3
	beq _0812A320
	b _0812A336
_0812A302:
	bl HideSecretBaseDecorationSprites
	b _0812A318
_0812A308:
	ldr r0, _0812A310
	bl ScriptContext1_SetupScript
	b _0812A318
	.align 2, 0
_0812A310: .4byte 0x08245DBB
_0812A314:
	bl ScriptContext2_Enable
_0812A318:
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
	b _0812A336
_0812A320:
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0812A336
	adds r0, r6, #0
	subs r0, #8
	adds r0, r5, r0
	ldr r1, _0812A33C
	str r1, [r0]
_0812A336:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812A33C: .4byte 0x08126B49
	thumb_func_end sub_0812A2D0

	thumb_func_start sub_0812A340
sub_0812A340: @ 0x0812A340
	push {lr}
	bl pal_fill_black
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrame
	bl InitDecorationActionsWindow
	ldr r0, _0812A370
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812A374
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #0xc]
	pop {r0}
	bx r0
	.align 2, 0
_0812A370: .4byte 0x0812A2D1
_0812A374: .4byte 0x03005B60
	thumb_func_end sub_0812A340

	thumb_func_start sub_0812A378
sub_0812A378: @ 0x0812A378
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2, #0x2e]
	cmp r0, #0xf
	ble _0812A398
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _0812A3A4
_0812A398:
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0812A3A4:
	pop {r0}
	bx r0
	thumb_func_end sub_0812A378

	thumb_func_start sub_0812A3A8
sub_0812A3A8: @ 0x0812A3A8
	push {lr}
	ldr r0, _0812A3BC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0812A3C4
	ldr r0, _0812A3C0
	bl LoadSpritePalette
	b _0812A3CA
	.align 2, 0
_0812A3BC: .4byte 0x03005AF0
_0812A3C0: .4byte 0x085822BC
_0812A3C4:
	ldr r0, _0812A3D0
	bl LoadSpritePalette
_0812A3CA:
	pop {r0}
	bx r0
	.align 2, 0
_0812A3D0: .4byte 0x085822C4
	thumb_func_end sub_0812A3A8

	thumb_func_start sub_0812A3D4
sub_0812A3D4: @ 0x0812A3D4
	push {lr}
	movs r0, #8
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end sub_0812A3D4

	thumb_func_start sub_0812A3E0
sub_0812A3E0: @ 0x0812A3E0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl IsSelectedDecorInThePC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0812A440
	ldr r0, _0812A424
	ldr r1, _0812A428
	ldrb r2, [r1]
	ldr r1, _0812A42C
	ldr r1, [r1]
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _0812A430
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _0812A434
	ldr r1, _0812A438
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _0812A43C
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
	b _0812A454
	.align 2, 0
_0812A424: .4byte 0x02021C40
_0812A428: .4byte 0x02039E3E
_0812A42C: .4byte 0x02039E18
_0812A430: .4byte 0x08580CD1
_0812A434: .4byte 0x02021C7C
_0812A438: .4byte 0x085CA812
_0812A43C: .4byte 0x0812A469
_0812A440:
	ldr r4, _0812A45C
	ldr r1, _0812A460
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _0812A464
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
_0812A454:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A45C: .4byte 0x02021C7C
_0812A460: .4byte 0x085CA7F2
_0812A464: .4byte 0x08127A0D
	thumb_func_end sub_0812A3E0

	thumb_func_start sub_0812A468
sub_0812A468: @ 0x0812A468
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _0812A484
	adds r0, r4, #0
	bl DoYesNoFuncWithChoice
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A484: .4byte 0x08582300
	thumb_func_end sub_0812A468

	thumb_func_start sub_0812A488
sub_0812A488: @ 0x0812A488
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0812A4D0
	ldrb r1, [r0]
	ldr r0, _0812A4D4
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r5, _0812A4D8
	ldrb r0, [r5]
	bl GetNumOwnedDecorationsInCategory
	ldr r1, _0812A4DC
	strb r0, [r1]
	ldrb r0, [r5]
	bl CondenseDecorationsInCategory
	adds r0, r4, #0
	bl IdentifyOwnedDecorationsCurrentlyInUseInternal
	ldr r5, _0812A4E0
	ldr r1, _0812A4E4
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldr r2, _0812A4E8
	adds r0, r4, #0
	adds r1, r5, #0
	bl DisplayItemMessageOnField
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A4D0: .4byte 0x02039E3E
_0812A4D4: .4byte 0x02039E18
_0812A4D8: .4byte 0x02039E3F
_0812A4DC: .4byte 0x02039E1D
_0812A4E0: .4byte 0x02021C7C
_0812A4E4: .4byte 0x085CA829
_0812A4E8: .4byte 0x08127A0D
	thumb_func_end sub_0812A488

