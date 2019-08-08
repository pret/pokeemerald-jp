.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetMoney
GetMoney: @ 0x080E4908
	ldr r1, _080E4918
	ldr r1, [r1]
	adds r1, #0xac
	ldr r0, [r0]
	ldr r1, [r1]
	eors r0, r1
	bx lr
	.align 2, 0
_080E4918: .4byte 0x03005AF0
	thumb_func_end GetMoney

	thumb_func_start SetMoney
SetMoney: @ 0x080E491C
	ldr r2, _080E492C
	ldr r2, [r2]
	adds r2, #0xac
	ldr r2, [r2]
	eors r2, r1
	str r2, [r0]
	bx lr
	.align 2, 0
_080E492C: .4byte 0x03005AF0
	thumb_func_end SetMoney

	thumb_func_start IsEnoughMoney
IsEnoughMoney: @ 0x080E4930
	push {r4, lr}
	adds r4, r1, #0
	bl GetMoney
	cmp r0, r4
	bhs _080E4940
	movs r0, #0
	b _080E4942
_080E4940:
	movs r0, #1
_080E4942:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsEnoughMoney

	thumb_func_start AddMoney
AddMoney: @ 0x080E4948
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl GetMoney
	adds r5, r0, #0
	adds r0, r5, r4
	ldr r5, _080E497C
	adds r4, r5, #0
	cmp r0, r5
	bhi _080E496C
	adds r5, r0, #0
	adds r0, r6, #0
	bl GetMoney
	cmp r5, r0
	bhs _080E496C
	adds r5, r4, #0
_080E496C:
	adds r0, r6, #0
	adds r1, r5, #0
	bl SetMoney
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E497C: .4byte 0x000F423F
	thumb_func_end AddMoney

	thumb_func_start RemoveMoney
RemoveMoney: @ 0x080E4980
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetMoney
	adds r1, r0, #0
	cmp r1, r4
	bhs _080E4994
	movs r1, #0
	b _080E4996
_080E4994:
	subs r1, r1, r4
_080E4996:
	adds r0, r5, #0
	bl SetMoney
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RemoveMoney

	thumb_func_start IsEnoughForCostInVar0x8005
IsEnoughForCostInVar0x8005: @ 0x080E49A4
	push {lr}
	ldr r0, _080E49C0
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r1, _080E49C4
	ldrh r1, [r1]
	bl IsEnoughMoney
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080E49C0: .4byte 0x03005AEC
_080E49C4: .4byte 0x02037282
	thumb_func_end IsEnoughForCostInVar0x8005

	thumb_func_start SubtractMoneyFromVar0x8005
SubtractMoneyFromVar0x8005: @ 0x080E49C8
	push {lr}
	ldr r0, _080E49E0
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r1, _080E49E4
	ldrh r1, [r1]
	bl RemoveMoney
	pop {r0}
	bx r0
	.align 2, 0
_080E49E0: .4byte 0x03005AEC
_080E49E4: .4byte 0x02037282
	thumb_func_end SubtractMoneyFromVar0x8005

	thumb_func_start PrintMoneyAmountInMoneyBox
PrintMoneyAmountInMoneyBox: @ 0x080E49E8
	push {lr}
	sub sp, #4
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r1, #0x28
	movs r2, #2
	bl PrintMoneyAmountInMoneyBoxWithBorder
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PrintMoneyAmountInMoneyBox

	thumb_func_start PrintMoneyAmountInMoneyBoxWithBorder
PrintMoneyAmountInMoneyBoxWithBorder: @ 0x080E4A08
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r4, [sp, #0x24]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080E4A68
	movs r2, #1
	movs r3, #6
	bl ConvertIntToDecimalStringN
	ldr r0, _080E4A6C
	mov sb, r0
	ldr r1, _080E4A70
	bl StringExpandPlaceholders
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	mov r2, sb
	mov r3, r8
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E4A68: .4byte 0x02021C40
_080E4A6C: .4byte 0x02021C7C
_080E4A70: .4byte 0x085C9A9D
	thumb_func_end PrintMoneyAmountInMoneyBoxWithBorder

	thumb_func_start PrintMoneyAmount
PrintMoneyAmount: @ 0x080E4A74
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl DrawStdFrameWithCustomTileAndPalette
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	bl PrintMoneyAmountInMoneyBox
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PrintMoneyAmount

	thumb_func_start ChangeAmountInMoneyBox
ChangeAmountInMoneyBox: @ 0x080E4AB0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080E4AC4
	ldrb r0, [r0]
	movs r2, #0
	bl PrintMoneyAmountInMoneyBox
	pop {r0}
	bx r0
	.align 2, 0
_080E4AC4: .4byte 0x02039C38
	thumb_func_end ChangeAmountInMoneyBox

	thumb_func_start DrawMoneyBox
DrawMoneyBox: @ 0x080E4AC8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x18
	mov r8, r0
	adds r4, r1, #0
	adds r3, r2, #0
	lsls r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r4, #0x18
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r4, r4, r0
	lsrs r4, r4, #0x18
	lsrs r5, r3, #0x18
	adds r3, r3, r0
	lsrs r3, r3, #0x18
	movs r0, #0xc
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl SetWindowTemplateFields
	ldr r4, _080E4B5C
	add r0, sp, #0x10
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #1
	bl CopyWindowToVram
	ldrb r0, [r4]
	movs r1, #0x85
	lsls r1, r1, #2
	movs r2, #0xe
	mov r3, r8
	bl PrintMoneyAmount
	lsls r6, r6, #0x13
	movs r0, #0x98
	lsls r0, r0, #0xd
	adds r6, r6, r0
	lsrs r6, r6, #0x10
	lsls r5, r5, #0x13
	movs r0, #0xb0
	lsls r0, r0, #0xc
	adds r5, r5, r0
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl AddMoneyLabelObject
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E4B5C: .4byte 0x02039C38
	thumb_func_end DrawMoneyBox

	thumb_func_start HideMoneyBox
HideMoneyBox: @ 0x080E4B60
	push {r4, lr}
	bl RemoveMoneyLabelObject
	ldr r4, _080E4B84
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	movs r1, #2
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4B84: .4byte 0x02039C38
	thumb_func_end HideMoneyBox

	thumb_func_start AddMoneyLabelObject
AddMoneyLabelObject: @ 0x080E4B88
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080E4BC0
	bl LoadCompressedSpriteSheet
	ldr r0, _080E4BC4
	bl LoadCompressedSpritePalette
	ldr r0, _080E4BC8
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl CreateSprite
	ldr r1, _080E4BCC
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E4BC0: .4byte 0x08565FBC
_080E4BC4: .4byte 0x08565FC4
_080E4BC8: .4byte 0x08565FA4
_080E4BCC: .4byte 0x02039C39
	thumb_func_end AddMoneyLabelObject

	thumb_func_start RemoveMoneyLabelObject
RemoveMoneyLabelObject: @ 0x080E4BD0
	push {lr}
	ldr r0, _080E4BE8
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E4BEC
	adds r0, r0, r1
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	.align 2, 0
_080E4BE8: .4byte 0x02039C39
_080E4BEC: .4byte 0x020205AC
	thumb_func_end RemoveMoneyLabelObject

