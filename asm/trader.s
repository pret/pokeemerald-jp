.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ScrSpecial_TraderMenuGiveDecoration
ScrSpecial_TraderMenuGiveDecoration: @ 0x081339EC
	push {lr}
	ldr r3, _08133A04
	ldr r0, [r3]
	ldr r0, [r0, #0x1c]
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #0
	bne _08133A08
	movs r0, #0
	b _08133A22
	.align 2, 0
_08133A04: .4byte 0x0202414C
_08133A08:
	subs r0, #1
	strb r0, [r1]
	ldr r2, _08133A28
	ldr r0, [r3]
	ldr r1, [r0, #0x1c]
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	movs r0, #1
_08133A22:
	pop {r1}
	bx r1
	.align 2, 0
_08133A28: .4byte 0x0203A804
	thumb_func_end ScrSpecial_TraderMenuGiveDecoration

	thumb_func_start TraderSetup
TraderSetup: @ 0x08133A2C
	push {r4, r5, r6, lr}
	ldr r0, _08133A80
	ldr r1, [r0]
	ldr r0, _08133A84
	adds r5, r1, r0
	movs r2, #0
	movs r0, #2
	strb r0, [r5]
	ldr r0, _08133A88
	adds r1, r1, r0
	strb r2, [r1]
	movs r4, #0
	ldr r6, _08133A8C
_08133A46:
	movs r0, #0xb
	muls r0, r4, r0
	adds r0, #5
	adds r0, r5, r0
	lsls r1, r4, #2
	adds r1, r1, r6
	ldr r1, [r1]
	bl StringCopy
	adds r1, r5, #1
	adds r1, r1, r4
	ldr r0, _08133A90
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08133A46
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08133A80: .4byte 0x03005AEC
_08133A84: .4byte 0x00002E28
_08133A88: .4byte 0x00002E59
_08133A8C: .4byte 0x0858F7F4
_08133A90: .4byte 0x0858F804
	thumb_func_end TraderSetup

	thumb_func_start Trader_ResetFlag
Trader_ResetFlag: @ 0x08133A94
	ldr r0, _08133AA4
	ldr r0, [r0]
	ldr r1, _08133AA8
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08133AA4: .4byte 0x03005AEC
_08133AA8: .4byte 0x00002E59
	thumb_func_end Trader_ResetFlag

	thumb_func_start sub_08133AAC
sub_08133AAC: @ 0x08133AAC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08133B0C
	adds r5, r1, r0
	ldr r0, _08133B10
	ldr r0, [r0]
	ldr r1, _08133B14
	adds r6, r0, r1
	ldr r0, _08133B18
	bl AddWindow
	strh r0, [r5, #6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x85
	lsls r2, r2, #2
	movs r1, #0
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	movs r4, #0
_08133AE0:
	adds r0, r6, #1
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0x78
	bls _08133B20
	ldrb r0, [r5, #6]
	lsls r1, r4, #4
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	ldr r2, _08133B1C
	movs r3, #8
	bl AddTextPrinterParameterized
	b _08133B48
	.align 2, 0
_08133B0C: .4byte 0x03005B68
_08133B10: .4byte 0x03005AEC
_08133B14: .4byte 0x00002E28
_08133B18: .4byte 0x0858F808
_08133B1C: .4byte 0x085C93F9
_08133B20:
	ldrb r0, [r5, #6]
	ldrb r1, [r1]
	lsls r2, r1, #3
	subs r2, r2, r1
	lsls r2, r2, #2
	ldr r1, _08133B94
	adds r2, r2, r1
	lsls r1, r4, #4
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
_08133B48:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08133AE0
	ldrb r0, [r5, #6]
	ldr r2, _08133B98
	lsls r1, r4, #4
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5, #6]
	movs r1, #0x10
	str r1, [sp]
	movs r1, #5
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08133B94: .4byte 0x08580CD1
_08133B98: .4byte 0x085C93C8
	thumb_func_end sub_08133AAC

	thumb_func_start ScrSpecial_IsDecorationFull
ScrSpecial_IsDecorationFull: @ 0x08133B9C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08133BC0
	adds r4, r0, r1
	cmp r2, #0x78
	bls _08133BCC
	ldr r1, _08133BC4
	ldr r2, _08133BC8
	adds r0, r2, #0
	strh r0, [r1]
	b _08133BD0
	.align 2, 0
_08133BC0: .4byte 0x03005B68
_08133BC4: .4byte 0x02037280
_08133BC8: .4byte 0x0000FFFF
_08133BCC:
	ldr r0, _08133BFC
	strh r2, [r0]
_08133BD0:
	ldrb r0, [r4, #6]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4, #6]
	bl ClearWindowTilemap
	ldrb r0, [r4, #6]
	bl RemoveWindow
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08133BFC: .4byte 0x02037280
	thumb_func_end ScrSpecial_IsDecorationFull

	thumb_func_start Task_HandleGetDecorationMenuInput
Task_HandleGetDecorationMenuInput: @ 0x08133C00
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08133C2C
	ldr r0, [r0]
	ldr r1, _08133C30
	adds r5, r0, r1
	bl Menu_ProcessInput
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08133C38
	cmp r1, r0
	bgt _08133C34
	subs r0, #1
	cmp r1, r0
	beq _08133C70
	b _08133C48
	.align 2, 0
_08133C2C: .4byte 0x03005AEC
_08133C30: .4byte 0x00002E28
_08133C34:
	cmp r1, #4
	bne _08133C48
_08133C38:
	movs r0, #5
	bl PlaySE
	adds r0, r6, #0
	movs r1, #0
	bl ScrSpecial_IsDecorationFull
	b _08133C70
_08133C48:
	movs r0, #5
	bl PlaySE
	ldr r0, _08133C78
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	strh r4, [r0]
	ldr r0, _08133C7C
	movs r1, #0xb
	muls r1, r4, r1
	adds r1, #5
	adds r1, r5, r1
	bl StringCopy
	adds r0, r5, #1
	adds r0, r0, r4
	ldrb r1, [r0]
	adds r0, r6, #0
	bl ScrSpecial_IsDecorationFull
_08133C70:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08133C78: .4byte 0x02037282
_08133C7C: .4byte 0x02021C40
	thumb_func_end Task_HandleGetDecorationMenuInput

	thumb_func_start ScrSpecial_GetTraderTradedFlag
ScrSpecial_GetTraderTradedFlag: @ 0x08133C80
	ldr r0, _08133C90
	ldr r0, [r0]
	ldr r1, _08133C94
	ldr r2, _08133C98
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08133C90: .4byte 0x03005AEC
_08133C94: .4byte 0x02037290
_08133C98: .4byte 0x00002E59
	thumb_func_end ScrSpecial_GetTraderTradedFlag

	thumb_func_start ScrSpecial_DoesPlayerHaveNoDecorations
ScrSpecial_DoesPlayerHaveNoDecorations: @ 0x08133C9C
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08133CB4
_08133CA2:
	adds r0, r4, #0
	bl GetNumOwnedDecorationsInCategory
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08133CB8
	movs r0, #0
	strh r0, [r5]
	b _08133CC8
	.align 2, 0
_08133CB4: .4byte 0x02037290
_08133CB8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _08133CA2
	ldr r1, _08133CD0
	movs r0, #1
	strh r0, [r1]
_08133CC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08133CD0: .4byte 0x02037290
	thumb_func_end ScrSpecial_DoesPlayerHaveNoDecorations

	thumb_func_start sub_08133CD4
sub_08133CD4: @ 0x08133CD4
	push {r4, r5, r6, lr}
	ldr r6, _08133D2C
	movs r0, #0
	strh r0, [r6]
	ldr r4, _08133D30
	ldr r5, _08133D34
	ldrh r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r4
	ldr r0, _08133D38
	ldrh r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r2, #0xe]
	ldrb r0, [r0, #0xe]
	cmp r1, r0
	beq _08133D26
	adds r0, r1, #0
	bl GetFirstEmptyDecorSlot
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08133D26
	ldr r0, _08133D3C
	ldrh r2, [r5]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r1, [r1, #0xe]
	bl CopyDecorationCategoryName
	movs r0, #1
	strh r0, [r6]
_08133D26:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08133D2C: .4byte 0x02037290
_08133D30: .4byte 0x08580CD0
_08133D34: .4byte 0x02037280
_08133D38: .4byte 0x02037284
_08133D3C: .4byte 0x02021C54
	thumb_func_end sub_08133CD4

	thumb_func_start CreateAvailableDecorationsMenu
CreateAvailableDecorationsMenu: @ 0x08133D40
	push {lr}
	ldr r0, _08133D50
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08133D50: .4byte 0x081271C1
	thumb_func_end CreateAvailableDecorationsMenu

	thumb_func_start sub_08133D54
sub_08133D54: @ 0x08133D54
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl IsSelectedDecorInThePC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08133DB8
	ldr r5, _08133D9C
	ldr r0, _08133DA0
	ldrb r1, [r0]
	ldr r0, _08133DA4
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r5]
	ldr r0, _08133DA8
	ldr r1, _08133DAC
	ldrh r2, [r1]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r4, _08133DB0
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _08133DB4
	ldrh r2, [r5]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	bl StringCopy
	b _08133DC0
	.align 2, 0
_08133D9C: .4byte 0x02037284
_08133DA0: .4byte 0x02039E3E
_08133DA4: .4byte 0x02039E18
_08133DA8: .4byte 0x02021C68
_08133DAC: .4byte 0x02037280
_08133DB0: .4byte 0x08580CD1
_08133DB4: .4byte 0x02021C54
_08133DB8:
	ldr r1, _08133DD0
	ldr r2, _08133DD4
	adds r0, r2, #0
	strh r0, [r1]
_08133DC0:
	adds r0, r6, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08133DD0: .4byte 0x02037284
_08133DD4: .4byte 0x0000FFFF
	thumb_func_end sub_08133D54

	thumb_func_start ExitTraderMenu
ExitTraderMenu: @ 0x08133DD8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08133DF0
	movs r1, #0
	strh r1, [r2]
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
_08133DF0: .4byte 0x02037284
	thumb_func_end ExitTraderMenu

	thumb_func_start ScrSpecial_TraderDoDecorationTrade
ScrSpecial_TraderDoDecorationTrade: @ 0x08133DF4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08133E54
	ldr r6, [r0]
	ldr r0, _08133E58
	adds r5, r6, r0
	ldr r1, _08133E5C
	mov r8, r1
	ldrb r0, [r1]
	bl DecorationRemove
	ldr r0, _08133E60
	ldrb r0, [r0]
	bl DecorationAdd
	ldr r4, _08133E64
	ldrh r1, [r4]
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #5
	adds r5, r5, r0
	ldr r0, _08133E68
	ldr r1, [r0]
	adds r0, r5, #0
	bl StringCopy
	ldr r2, _08133E6C
	adds r0, r6, r2
	ldrh r1, [r4]
	adds r0, r0, r1
	mov r2, r8
	ldrh r1, [r2]
	strb r1, [r0]
	ldr r1, _08133E70
	adds r0, r6, r1
	ldrh r4, [r4]
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	ldr r2, _08133E74
	adds r6, r6, r2
	strb r1, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08133E54: .4byte 0x03005AEC
_08133E58: .4byte 0x00002E28
_08133E5C: .4byte 0x02037284
_08133E60: .4byte 0x02037280
_08133E64: .4byte 0x02037282
_08133E68: .4byte 0x03005AF0
_08133E6C: .4byte 0x00002E29
_08133E70: .4byte 0x00002E5A
_08133E74: .4byte 0x00002E59
	thumb_func_end ScrSpecial_TraderDoDecorationTrade

	thumb_func_start ScrSpecial_TraderMenuGetDecoration
ScrSpecial_TraderMenuGetDecoration: @ 0x08133E78
	push {lr}
	ldr r0, _08133E90
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08133AAC
	pop {r0}
	bx r0
	.align 2, 0
_08133E90: .4byte 0x08133C01
	thumb_func_end ScrSpecial_TraderMenuGetDecoration

