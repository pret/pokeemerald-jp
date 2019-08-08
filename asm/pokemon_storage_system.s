.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CountMonsInBox
CountMonsInBox: @ 0x080C682C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	movs r5, #0
_080C6836:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	movs r2, #0xb
	bl GetBoxMonDataAt
	cmp r0, #0
	beq _080C684C
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080C684C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1d
	bls _080C6836
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end CountMonsInBox

	thumb_func_start GetFirstFreeBoxSpot
GetFirstFreeBoxSpot: @ 0x080C6860
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
_080C6868:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	movs r2, #0xb
	bl GetBoxMonDataAt
	cmp r0, #0
	bne _080C687E
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	b _080C688C
_080C687E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1d
	bls _080C6868
	movs r0, #1
	rsbs r0, r0, #0
_080C688C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetFirstFreeBoxSpot

	thumb_func_start CountPartyNonEggMons
CountPartyNonEggMons: @ 0x080C6894
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r6, #0
_080C689A:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _080C68D8
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _080C68C2
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _080C68C2
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080C68C2:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #5
	bls _080C689A
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C68D8: .4byte 0x02024190
	thumb_func_end CountPartyNonEggMons

	thumb_func_start CountPartyAliveNonEggMonsExcept
CountPartyAliveNonEggMonsExcept: @ 0x080C68DC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	movs r5, #0
	movs r6, #0
	lsrs r7, r0, #0x18
_080C68E6:
	cmp r5, r7
	beq _080C691E
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _080C6934
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _080C691E
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _080C691E
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080C691E
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080C691E:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #5
	bls _080C68E6
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C6934: .4byte 0x02024190
	thumb_func_end CountPartyAliveNonEggMonsExcept

	thumb_func_start CountPartyAliveNonEggMons_IgnoreVar0x8004Slot
CountPartyAliveNonEggMons_IgnoreVar0x8004Slot: @ 0x080C6938
	push {lr}
	ldr r0, _080C694C
	ldrb r0, [r0]
	bl CountPartyAliveNonEggMonsExcept
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080C694C: .4byte 0x02037280
	thumb_func_end CountPartyAliveNonEggMons_IgnoreVar0x8004Slot

	thumb_func_start CountPartyMons
CountPartyMons: @ 0x080C6950
	push {r4, r5, lr}
	movs r4, #0
	movs r5, #0
_080C6956:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _080C6984
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _080C696E
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080C696E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _080C6956
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C6984: .4byte 0x02024190
	thumb_func_end CountPartyMons

	thumb_func_start StringCopyAndFillWithSpaces
StringCopyAndFillWithSpaces: @ 0x080C6988
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r2, #0x10
	lsrs r4, r4, #0x10
	bl StringCopy
	adds r1, r0, #0
	adds r5, r5, r4
	cmp r1, r5
	bhs _080C69A6
	movs r0, #0
_080C699E:
	strb r0, [r1]
	adds r1, #1
	cmp r1, r5
	blo _080C699E
_080C69A6:
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StringCopyAndFillWithSpaces

	thumb_func_start sub_080C69B4
sub_080C69B4: @ 0x080C69B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r3, #0
	ldr r5, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	ldr r0, [sp, #0x24]
	mov sb, r0
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r0, sb
	lsls r0, r0, #0x11
	mov sb, r0
	lsrs r2, r2, #0xb
	adds r2, r2, r1
	lsls r2, r2, #1
	adds r6, r6, r2
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r7, r7, r0
	movs r4, #0
	cmp r4, r8
	bhs _080C6A24
	mov r0, sb
	lsrs r0, r0, #1
	mov sb, r0
	lsls r5, r3, #1
_080C6A0A:
	adds r0, r7, #0
	adds r1, r6, #0
	mov r3, sb
	lsrs r2, r3, #0x10
	bl CpuSet
	adds r6, #0x40
	adds r7, r7, r5
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r8
	blo _080C6A0A
_080C6A24:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080C69B4

	thumb_func_start sub_080C6A30
sub_080C6A30: @ 0x080C6A30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [sp, #0x28]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsrs r2, r2, #0xb
	adds r2, r2, r1
	lsls r2, r2, #1
	adds r4, r4, r2
	lsls r3, r3, #0x11
	lsrs r0, r3, #0x10
	str r0, [sp, #4]
	movs r0, #0
	cmp r0, sl
	bhs _080C6ADA
	movs r6, #0x80
	lsls r6, r6, #5
	mov r5, sp
	ldr r7, _080C6A9C
	lsrs r3, r3, #0x11
	mov sb, r3
	mov r1, sb
	movs r2, #0x81
	lsls r2, r2, #0x18
	orrs r1, r2
	mov sb, r1
_080C6A76:
	adds r3, r4, #0
	ldr r2, [sp, #4]
	movs r1, #0x40
	adds r1, r1, r4
	mov r8, r1
	adds r0, #1
	mov ip, r0
	cmp r2, r6
	bhi _080C6AA0
	movs r0, #0
	strh r0, [r5]
	mov r2, sp
	str r2, [r7]
	str r4, [r7, #4]
	mov r0, sb
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	b _080C6ACE
	.align 2, 0
_080C6A9C: .4byte 0x040000D4
_080C6AA0:
	movs r4, #0
	strh r4, [r5]
	ldr r1, _080C6AEC
	mov r0, sp
	str r0, [r1]
	str r3, [r1, #4]
	ldr r0, _080C6AF0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r6
	subs r2, r2, r6
	cmp r2, r6
	bhi _080C6AA0
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, #4]
	lsrs r0, r2, #1
	movs r2, #0x81
	lsls r2, r2, #0x18
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080C6ACE:
	mov r4, r8
	mov r1, ip
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, sl
	blo _080C6A76
_080C6ADA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6AEC: .4byte 0x040000D4
_080C6AF0: .4byte 0x81000800
	thumb_func_end sub_080C6A30

	thumb_func_start Task_PokemonStorageSystemPC
Task_PokemonStorageSystemPC: @ 0x080C6AF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080C6B1C
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #4
	bls _080C6B10
	b _080C6DF6
_080C6B10:
	lsls r0, r0, #2
	ldr r1, _080C6B20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6B1C: .4byte 0x03005B60
_080C6B20: .4byte 0x080C6B24
_080C6B24: @ jump table
	.4byte _080C6B38 @ case 0
	.4byte _080C6B98 @ case 1
	.4byte _080C6BAC @ case 2
	.4byte _080C6CF6 @ case 3
	.4byte _080C6DD0 @ case 4
_080C6B38:
	ldrb r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x26
	bl sub_080C6E88
	bl sub_08196F98
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r1, _080C6B94
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	lsls r0, r0, #3
	adds r1, #4
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
	movs r3, #0xff
	bl AddTextPrinterParameterized2
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldrh r0, [r5, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl CopyWindowToVram
	b _080C6BA4
	.align 2, 0
_080C6B94: .4byte 0x0854B1E4
_080C6B98:
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C6BA4
	b _080C6DF6
_080C6BA4:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _080C6DF6
_080C6BAC:
	bl Menu_ProcessInput
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0xc]
	movs r3, #0xc
	ldrsh r1, [r5, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080C6C5C
	cmp r1, r0
	bgt _080C6BCE
	subs r0, #1
	cmp r1, r0
	beq _080C6BD4
	b _080C6C82
_080C6BCE:
	cmp r1, #4
	beq _080C6C5C
	b _080C6C82
_080C6BD4:
	ldrh r3, [r5, #0xa]
	strh r3, [r5, #0xe]
	ldr r2, _080C6C54
	ldrh r1, [r2, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080C6BF2
	subs r0, r3, #1
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080C6BF2
	movs r0, #4
	strh r0, [r5, #0xe]
_080C6BF2:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080C6C0E
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _080C6C0E
	movs r0, #0
	strh r0, [r5, #0xe]
_080C6C0E:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0xe]
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bne _080C6C1E
	b _080C6DF6
_080C6C1E:
	movs r4, #0
	strh r2, [r5, #0xa]
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r1, _080C6C58
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r2, [r0]
	str r4, [sp]
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
	b _080C6DF6
	.align 2, 0
_080C6C54: .4byte 0x03002360
_080C6C58: .4byte 0x0854B1E4
_080C6C5C:
	ldrh r0, [r5, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl DrawStdWindowFrame
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
	ldrh r0, [r5, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl RemoveWindow
	adds r0, r4, #0
	bl DestroyTask
	b _080C6DF6
_080C6C82:
	movs r3, #0xc
	ldrsh r4, [r5, r3]
	cmp r4, #0
	bne _080C6CB4
	bl CountPartyMons
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _080C6CB4
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _080C6CB0
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r4, #3
	str r4, [sp, #0xc]
	b _080C6DBE
	.align 2, 0
_080C6CB0: .4byte 0x085CB55C
_080C6CB4:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _080C6CE8
	bl CountPartyMons
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _080C6CE8
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _080C6CE4
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r4, #3
	str r4, [sp, #0xc]
	b _080C6DBE
	.align 2, 0
_080C6CE4: .4byte 0x085CB534
_080C6CE8:
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	movs r0, #4
	strh r0, [r5, #8]
	b _080C6DF6
_080C6CF6:
	ldr r0, _080C6D20
	ldrh r1, [r0, #0x2e]
	movs r7, #3
	adds r4, r7, #0
	ands r4, r1
	cmp r4, #0
	beq _080C6D28
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r1, _080C6D24
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0
	str r0, [sp]
	b _080C6DB4
	.align 2, 0
_080C6D20: .4byte 0x03002360
_080C6D24: .4byte 0x0854B1E4
_080C6D28:
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080C6D74
	ldrh r0, [r5, #0xa]
	subs r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080C6D44
	movs r0, #4
	strh r0, [r5, #0xa]
_080C6D44:
	movs r0, #1
	rsbs r0, r0, #0
	bl Menu_MoveCursor
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xa]
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r1, _080C6D70
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r2, [r0]
	str r4, [sp]
	b _080C6DB4
	.align 2, 0
_080C6D70: .4byte 0x0854B1E4
_080C6D74:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080C6DF6
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _080C6D8C
	strh r6, [r5, #0xa]
_080C6D8C:
	movs r0, #1
	bl Menu_MoveCursor
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xa]
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r1, _080C6DCC
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r2, [r0]
	str r6, [sp]
_080C6DB4:
	movs r4, #2
	str r4, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
_080C6DBE:
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized2
	strh r4, [r5, #8]
	b _080C6DF6
	.align 2, 0
_080C6DCC: .4byte 0x0854B1E4
_080C6DD0:
	ldr r0, _080C6E00
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080C6DF6
	bl CleanupOverworldWindowsAndTilemaps
	ldrb r0, [r5, #0xc]
	bl Cb2_EnterPSS
	ldrh r0, [r5, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl RemoveWindow
	adds r0, r4, #0
	bl DestroyTask
_080C6DF6:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6E00: .4byte 0x02037C74
	thumb_func_end Task_PokemonStorageSystemPC

	thumb_func_start ShowPokemonStorageSystemPC
ShowPokemonStorageSystemPC: @ 0x080C6E04
	push {lr}
	ldr r0, _080C6E2C
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080C6E30
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_080C6E2C: .4byte 0x080C6AF5
_080C6E30: .4byte 0x03005B60
	thumb_func_end ShowPokemonStorageSystemPC

	thumb_func_start FieldCb_ReturnToPcMenu
FieldCb_ReturnToPcMenu: @ 0x080C6E34
	push {r4, r5, lr}
	ldr r0, _080C6E78
	ldr r5, [r0, #0xc]
	movs r0, #0
	bl SetVBlankCallback
	ldr r4, _080C6E7C
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080C6E80
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1, #8]
	ldr r2, _080C6E84
	ldrb r2, [r2]
	strh r2, [r1, #0xa]
	bl _call_via_r4
	adds r0, r5, #0
	bl SetVBlankCallback
	bl pal_fill_black
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6E78: .4byte 0x03002360
_080C6E7C: .4byte 0x080C6AF5
_080C6E80: .4byte 0x03005B60
_080C6E84: .4byte 0x020399A0
	thumb_func_end FieldCb_ReturnToPcMenu

	thumb_func_start sub_080C6E88
sub_080C6E88: @ 0x080C6E88
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	mov sl, r1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080C6F08
	bl AddWindow
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r5, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl ClearStdWindowAndFrame
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x10
	mov sb, r0
	str r0, [sp]
	movs r0, #5
	mov r8, r0
	str r0, [sp, #4]
	ldr r0, _080C6F0C
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl PrintTextArray
	mov r0, sb
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	mov r0, sl
	strh r5, [r0]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6F08: .4byte 0x0854B20C
_080C6F0C: .4byte 0x0854B1E4
	thumb_func_end sub_080C6E88

	thumb_func_start Cb2_ExitPSS
Cb2_ExitPSS: @ 0x080C6F10
	push {lr}
	bl GetCurrentBoxOption
	ldr r1, _080C6F2C
	strb r0, [r1]
	ldr r1, _080C6F30
	ldr r0, _080C6F34
	str r0, [r1]
	ldr r0, _080C6F38
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C6F2C: .4byte 0x020399A0
_080C6F30: .4byte 0x03005B0C
_080C6F34: .4byte 0x080C6E35
_080C6F38: .4byte 0x08085A31
	thumb_func_end Cb2_ExitPSS

	thumb_func_start StorageSystemGetNextMonIndex
StorageSystemGetNextMonIndex: @ 0x080C6F3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r4, r3, #0
	ldr r2, _080C6FA0
	cmp r3, #1
	bhi _080C6F5E
	movs r2, #1
	cmp r3, #1
	beq _080C6F62
_080C6F5E:
	cmp r4, #3
	bne _080C6FAC
_080C6F62:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	adds r1, r1, r0
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r6, r2, #0
	cmp r1, #0
	blt _080C6FF8
	cmp r1, r7
	bgt _080C6FF8
_080C6F7A:
	asrs r4, r0, #0x10
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #4
	add r0, r8
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	bne _080C6FA4
	asrs r0, r6, #0x10
	adds r0, r4, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080C6FF8
	cmp r2, r7
	ble _080C6F7A
	b _080C6FF8
	.align 2, 0
_080C6FA0: .4byte 0x0000FFFF
_080C6FA4:
	adds r0, r4, #0
	b _080C6FFC
_080C6FA8:
	adds r0, r5, #0
	b _080C6FFC
_080C6FAC:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	adds r1, r1, r0
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r6, r2, #0
	cmp r1, #0
	blt _080C6FF8
	cmp r1, r7
	bgt _080C6FF8
_080C6FC4:
	asrs r5, r0, #0x10
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #4
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	beq _080C6FE8
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetBoxMonData
	cmp r0, #0
	beq _080C6FA8
_080C6FE8:
	asrs r0, r6, #0x10
	adds r0, r5, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080C6FF8
	cmp r2, r7
	ble _080C6FC4
_080C6FF8:
	movs r0, #1
	rsbs r0, r0, #0
_080C6FFC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StorageSystemGetNextMonIndex

	thumb_func_start ResetPokemonStorageSystem
ResetPokemonStorageSystem: @ 0x080C7008
	push {r4, r5, r6, lr}
	movs r0, #0
	bl SetCurrentBox
	movs r5, #0
_080C7012:
	movs r4, #0
	lsls r6, r5, #0x18
_080C7016:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r6, #0x18
	bl ZeroBoxMonAt
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1d
	bls _080C7016
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xd
	bls _080C7012
	movs r5, #0
_080C7036:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetBoxNamePtr
	ldr r1, _080C707C
	bl StringCopy
	adds r4, r5, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	cmp r5, #0xd
	bls _080C7036
	movs r5, #0
_080C705A:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	ands r1, r5
	bl SetBoxWallpaper
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xd
	bls _080C705A
	bl ResetWaldaWallpaper
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C707C: .4byte 0x085CB584
	thumb_func_end ResetPokemonStorageSystem

	thumb_func_start sub_080C7080
sub_080C7080: @ 0x080C7080
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x20
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r7, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r0, _080C7114
	str r0, [sp, #0x18]
	ldr r1, _080C7118
	add r4, sp, #0x18
	ldr r0, [r4, #4]
	ands r0, r1
	orrs r0, r7
	str r0, [r4, #4]
	mov r1, sp
	ldr r0, _080C711C
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r1, #4]
	strh r6, [r1, #6]
	ldr r0, _080C7120
	str r0, [sp, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r1, #0xc]
	adds r0, r6, #1
	strh r0, [r1, #0xe]
	add r0, sp, #0x10
	movs r1, #0
	movs r2, #8
	bl memset
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _080C70DE
	adds r0, r4, #0
	bl LoadSpritePalette
_080C70DE:
	mov r0, sp
	bl LoadSpriteSheets
	ldr r0, _080C7124
	str r5, [r0]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r5, r1
	strh r6, [r0]
	adds r1, #2
	adds r0, r5, r1
	strh r7, [r0]
	adds r1, #4
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r1, [sp, #0x38]
	str r1, [r0]
	add sp, #0x20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7114: .4byte 0x0854B25C
_080C7118: .4byte 0xFFFF0000
_080C711C: .4byte 0x0854B27C
_080C7120: .4byte 0x0854BA7C
_080C7124: .4byte 0x020399A4
	thumb_func_end sub_080C7080

	thumb_func_start sub_080C7128
sub_080C7128: @ 0x080C7128
	push {r4, r5, lr}
	ldr r5, _080C7168
	ldr r1, [r5]
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080C7144
	adds r2, #6
	adds r0, r1, r2
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080C7144:
	ldr r0, [r5]
	movs r4, #0x90
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r5]
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeSpriteTilesByTag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7168: .4byte 0x020399A4
	thumb_func_end sub_080C7128

	thumb_func_start sub_080C716C
sub_080C716C: @ 0x080C716C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080C71F0
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080C716C

	thumb_func_start sub_080C717C
sub_080C717C: @ 0x080C717C
	push {lr}
	bl sub_080C73D0
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080C717C

	thumb_func_start HandleBoxChooseSelectionInput
HandleBoxChooseSelectionInput: @ 0x080C7188
	push {lr}
	ldr r0, _080C71A0
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C71A4
	movs r0, #5
	bl PlaySE
	movs r0, #0xc9
	b _080C71EC
	.align 2, 0
_080C71A0: .4byte 0x03002360
_080C71A4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C71C4
	movs r0, #5
	bl PlaySE
	ldr r0, _080C71C0
	ldr r0, [r0]
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	b _080C71EC
	.align 2, 0
_080C71C0: .4byte 0x020399A4
_080C71C4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080C71D8
	movs r0, #5
	bl PlaySE
	bl sub_080C7470
	b _080C71EA
_080C71D8:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080C71EA
	movs r0, #5
	bl PlaySE
	bl sub_080C743C
_080C71EA:
	movs r0, #0xc8
_080C71EC:
	pop {r1}
	bx r1
	thumb_func_end HandleBoxChooseSelectionInput

	thumb_func_start sub_080C71F0
sub_080C71F0: @ 0x080C71F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x3c
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x34]
	str r1, [sp, #0x38]
	movs r1, #0xc0
	lsls r1, r1, #0x18
	ldr r0, [sp, #0x34]
	orrs r0, r1
	str r0, [sp, #0x34]
	ldr r1, _080C73A4
	add r4, sp, #0x34
	ldr r0, [r4, #4]
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #4]
	add r0, sp, #0x1c
	mov r8, r0
	movs r1, #0
	strh r1, [r0]
	mov r0, sp
	adds r0, #0x1e
	strh r1, [r0]
	str r4, [sp, #0x20]
	ldr r0, _080C73A8
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, _080C73AC
	str r0, [sp, #0x2c]
	ldr r0, _080C73B0
	str r0, [sp, #0x30]
	add r0, sp, #4
	mov r1, r8
	movs r2, #0x18
	bl memcpy
	ldr r1, _080C73B4
	mov r0, r8
	movs r2, #4
	bl memcpy
	ldr r6, _080C73B8
	ldr r0, [r6]
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r0, r1
	strb r5, [r0]
	add r2, sp, #4
	ldr r1, [r6]
	movs r5, #0x90
	lsls r5, r5, #2
	adds r0, r1, r5
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r3, _080C73BC
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r2, #2]
	adds r0, r2, #0
	movs r1, #0xa0
	movs r2, #0x60
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080C73C0
	adds r0, r0, r1
	str r0, [r3]
	ldrb r2, [r4, #1]
	movs r1, #0x3f
	adds r0, r1, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	ands r1, r0
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4, #3]
	add r1, sp, #4
	adds r3, r3, r5
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _080C73C4
	str r0, [sp, #0xc]
	movs r4, #0
	mov r7, r8
_080C72BC:
	ldr r0, [r6]
	ldr r1, _080C73C8
	adds r0, r0, r1
	ldrb r3, [r0]
	add r0, sp, #4
	movs r1, #0x7c
	movs r2, #0x50
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r2, [r6]
	lsls r3, r4, #2
	adds r2, #4
	adds r2, r2, r3
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080C73C0
	adds r1, r0, r1
	str r1, [r2]
	movs r5, #0
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080C72F6
	movs r0, #0xc4
	strh r0, [r1, #0x20]
	movs r5, #2
_080C72F6:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080C731A
	ldr r1, [r6]
	adds r1, #4
	adds r1, r1, r3
	ldr r2, [r1]
	movs r0, #0x70
	strh r0, [r2, #0x22]
	ldr r2, [r1]
	ldrb r1, [r2, #3]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2, #3]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080C731A:
	ldr r0, [r6]
	adds r0, #4
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _080C72BC
	movs r4, #0
	ldr r5, _080C73B8
_080C7338:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #0x13
	movs r3, #0xf8
	lsls r3, r3, #0xf
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ldr r1, [r5]
	ldr r3, _080C73C8
	adds r1, r1, r3
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl sub_080CCB64
	adds r2, r0, #0
	ldr r0, [r5]
	lsls r1, r4, #2
	adds r0, #0x20
	adds r0, r0, r1
	str r2, [r0]
	cmp r2, #0
	beq _080C7380
	movs r1, #1
	cmp r4, #0
	bne _080C7378
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
_080C7378:
	strh r1, [r2, #0x2e]
	ldr r1, [r0]
	ldr r0, _080C73CC
	str r0, [r1, #0x1c]
_080C7380:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	bls _080C7338
	bl sub_080C74A0
	adds r0, r7, #0
	movs r1, #5
	movs r2, #3
	bl sub_080C7528
	add sp, #0x3c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C73A4: .4byte 0xFFFF0FFF
_080C73A8: .4byte 0x082BF304
_080C73AC: .4byte 0x082BF310
_080C73B0: .4byte 0x08007141
_080C73B4: .4byte 0x0854B258
_080C73B8: .4byte 0x020399A4
_080C73BC: .4byte 0x00000242
_080C73C0: .4byte 0x020205AC
_080C73C4: .4byte 0x0854B234
_080C73C8: .4byte 0x00000246
_080C73CC: .4byte 0x080C7591
	thumb_func_end sub_080C71F0

	thumb_func_start sub_080C73D0
sub_080C73D0: @ 0x080C73D0
	push {r4, r5, r6, lr}
	ldr r4, _080C7438
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	beq _080C73E6
	bl DestroySprite
	ldr r1, [r4]
	movs r0, #0
	str r0, [r1]
_080C73E6:
	movs r5, #0
	adds r6, r4, #0
_080C73EA:
	ldr r0, [r6]
	lsls r4, r5, #2
	adds r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080C7406
	bl DestroySprite
	ldr r0, [r6]
	adds r0, #4
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_080C7406:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _080C73EA
	movs r5, #0
_080C7412:
	ldr r0, _080C7438
	ldr r0, [r0]
	lsls r1, r5, #2
	adds r0, #0x20
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080C7426
	bl DestroySprite
_080C7426:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #1
	bls _080C7412
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7438: .4byte 0x020399A4
	thumb_func_end sub_080C73D0

	thumb_func_start sub_080C743C
sub_080C743C: @ 0x080C743C
	push {lr}
	ldr r2, _080C746C
	ldr r1, [r2]
	movs r0, #0x91
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd
	bls _080C7462
	ldr r0, [r2]
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_080C7462:
	bl sub_080C74A0
	pop {r0}
	bx r0
	.align 2, 0
_080C746C: .4byte 0x020399A4
	thumb_func_end sub_080C743C

	thumb_func_start sub_080C7470
sub_080C7470: @ 0x080C7470
	push {lr}
	ldr r0, _080C7488
	ldr r2, [r0]
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C748C
	subs r1, r0, #1
	b _080C748E
	.align 2, 0
_080C7488: .4byte 0x020399A4
_080C748C:
	movs r1, #0xd
_080C748E:
	movs r3, #0x91
	lsls r3, r3, #2
	adds r0, r2, r3
	strb r1, [r0]
	bl sub_080C74A0
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080C7470

	thumb_func_start sub_080C74A0
sub_080C74A0: @ 0x080C74A0
	push {r4, r5, r6, r7, lr}
	ldr r6, _080C7524
	ldr r0, [r6]
	movs r5, #0x91
	lsls r5, r5, #2
	adds r0, r0, r5
	ldrb r0, [r0]
	bl CountMonsInBox
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [r6]
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r4, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetBoxNamePtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	adds r1, r0, #0
	ldr r0, [r6]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r0, r2
	cmp r1, r0
	bhs _080C74EC
	movs r4, #0
	adds r3, r6, #0
_080C74E0:
	strb r4, [r1]
	adds r1, #1
	ldr r0, [r3]
	adds r0, r0, r2
	cmp r1, r0
	blo _080C74E0
_080C74EC:
	movs r0, #0xff
	strb r0, [r1]
	ldr r5, _080C7524
	ldr r0, [r5]
	movs r4, #0x8a
	lsls r4, r4, #2
	adds r0, r0, r4
	movs r1, #0
	movs r2, #1
	bl sub_080C7528
	ldr r0, [r5]
	adds r0, r0, r4
	adds r1, r7, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #3
	movs r2, #3
	bl sub_080C7528
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7524: .4byte 0x020399A4
	thumb_func_end sub_080C74A0

	thumb_func_start sub_080C7528
sub_080C7528: @ 0x080C7528
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r6, _080C7588
	ldr r0, [r6]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetSpriteTileStartByTag
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	lsls r4, r4, #8
	ldr r0, _080C758C
	adds r4, r4, r0
	adds r1, r1, r4
	lsls r5, r5, #5
	adds r1, r1, r5
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	ldr r0, [r6]
	adds r0, #0x28
	str r0, [sp, #8]
	mov r0, r8
	movs r3, #4
	bl sub_080C6738
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7588: .4byte 0x020399A4
_080C758C: .4byte 0x06010000
	thumb_func_end sub_080C7528

	thumb_func_start sub_080C7590
sub_080C7590: @ 0x080C7590
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	adds r0, #1
	movs r2, #0
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _080C75C0
	strh r2, [r1, #0x30]
	ldrh r0, [r1, #0x2e]
	ldrh r3, [r1, #0x24]
	adds r0, r0, r3
	strh r0, [r1, #0x24]
	ldrh r0, [r1, #0x32]
	adds r0, #1
	strh r0, [r1, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _080C75C0
	strh r2, [r1, #0x32]
	strh r2, [r1, #0x24]
_080C75C0:
	pop {r0}
	bx r0
	thumb_func_end sub_080C7590

	thumb_func_start VblankCb_PSS
VblankCb_PSS: @ 0x080C75C4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl sub_080D2344
	bl TransferPlttBuffer
	ldr r0, _080C75EC
	ldr r0, [r0]
	movs r1, #0xb3
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x18
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080C75EC: .4byte 0x020399A8
	thumb_func_end VblankCb_PSS

	thumb_func_start Cb2_PSS
Cb2_PSS: @ 0x080C75F0
	push {lr}
	bl RunTasks
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl ScrollBackground
	bl sub_080CA278
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Cb2_PSS

	thumb_func_start Cb2_EnterPSS
Cb2_EnterPSS: @ 0x080C7610
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl ResetTasks
	ldr r0, _080C7634
	strb r5, [r0]
	ldr r4, _080C7638
	ldr r0, _080C763C
	bl Alloc
	str r0, [r4]
	cmp r0, #0
	bne _080C7644
	ldr r0, _080C7640
	bl SetMainCallback2
	b _080C7670
	.align 2, 0
_080C7634: .4byte 0x020399AD
_080C7638: .4byte 0x020399A8
_080C763C: .4byte 0x000062C4
_080C7640: .4byte 0x080C6F11
_080C7644:
	movs r2, #0
	strb r5, [r0, #1]
	ldr r0, [r4]
	strb r2, [r0, #3]
	ldr r0, _080C7678
	movs r1, #0
	strh r2, [r0]
	ldr r0, [r4]
	strb r1, [r0]
	ldr r0, _080C767C
	movs r1, #3
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, #4]
	bl StorageGetCurrentBox
	ldr r1, _080C7680
	strb r0, [r1]
	ldr r0, _080C7684
	bl SetMainCallback2
_080C7670:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7678: .4byte 0x020399B2
_080C767C: .4byte 0x080C7845
_080C7680: .4byte 0x020399B0
_080C7684: .4byte 0x080C75F1
	thumb_func_end Cb2_EnterPSS

	thumb_func_start Cb2_ReturnToPSS
Cb2_ReturnToPSS: @ 0x080C7688
	push {r4, lr}
	bl ResetTasks
	ldr r4, _080C76A8
	ldr r0, _080C76AC
	bl Alloc
	adds r1, r0, #0
	str r1, [r4]
	cmp r1, #0
	bne _080C76B4
	ldr r0, _080C76B0
	bl SetMainCallback2
	b _080C76D8
	.align 2, 0
_080C76A8: .4byte 0x020399A8
_080C76AC: .4byte 0x000062C4
_080C76B0: .4byte 0x080C6F11
_080C76B4:
	ldr r0, _080C76E0
	ldrb r0, [r0]
	movs r2, #0
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #3]
	ldr r0, [r4]
	strb r2, [r0]
	ldr r0, _080C76E4
	movs r1, #3
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, #4]
	ldr r0, _080C76E8
	bl SetMainCallback2
_080C76D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C76E0: .4byte 0x020399AD
_080C76E4: .4byte 0x080C7845
_080C76E8: .4byte 0x080C75F1
	thumb_func_end Cb2_ReturnToPSS

	thumb_func_start ResetAllBgCoords
ResetAllBgCoords: @ 0x080C76EC
	push {lr}
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
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetAllBgCoords

	thumb_func_start sub_080C7734
sub_080C7734: @ 0x080C7734
	push {r4, lr}
	sub sp, #4
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	bl ClearDma3Requests
	ldr r1, _080C77A4
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	ldr r4, _080C77A8
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #8
	adds r1, #0x10
	movs r2, #8
	bl sub_080D2330
	ldr r1, _080C77AC
	movs r0, #0x14
	strh r0, [r1]
	bl clear_scheduled_bg_copies_to_vram
	movs r0, #3
	bl sub_080D1E3C
	ldr r2, _080C77B0
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r3, #8
	bl sub_080D1EE4
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl sub_080D2010
	ldr r0, [r4]
	ldr r1, _080C77B4
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C77A4: .4byte 0x02021AB6
_080C77A8: .4byte 0x020399A8
_080C77AC: .4byte 0x03002350
_080C77B0: .4byte 0x0854BEBC
_080C77B4: .4byte 0x000002C7
	thumb_func_end sub_080C7734

	thumb_func_start sub_080C77B8
sub_080C77B8: @ 0x080C77B8
	push {lr}
	bl sub_080CD488
	ldr r2, _080C77DC
	movs r1, #0
	ldr r0, _080C77E0
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _080C77CE
	movs r1, #1
_080C77CE:
	strb r1, [r2]
	ldr r1, _080C77E4
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C77DC: .4byte 0x020399AC
_080C77E0: .4byte 0x020399A8
_080C77E4: .4byte 0x020399AE
	thumb_func_end sub_080C77B8

	thumb_func_start sub_080C77E8
sub_080C77E8: @ 0x080C77E8
	push {lr}
	ldr r0, _080C7814
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080C7806
	movs r1, #0xfc
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _080C7818
	movs r0, #0x52
	bl SetGpuReg
_080C7806:
	movs r1, #0xfa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080C7814: .4byte 0x020399A8
_080C7818: .4byte 0x00000B07
	thumb_func_end sub_080C77E8

	thumb_func_start SetPSSCallback
SetPSSCallback: @ 0x080C781C
	push {r4, lr}
	ldr r4, _080C783C
	ldr r1, _080C7840
	ldr r3, [r1]
	ldrb r2, [r3, #4]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r4
	str r0, [r1]
	movs r0, #0
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C783C: .4byte 0x03005B60
_080C7840: .4byte 0x020399A8
	thumb_func_end SetPSSCallback

	thumb_func_start Cb_InitPSS
Cb_InitPSS: @ 0x080C7844
	push {lr}
	sub sp, #4
	ldr r0, _080C7860
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0xa
	bls _080C7854
	b _080C7A3E
_080C7854:
	lsls r0, r0, #2
	ldr r1, _080C7864
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7860: .4byte 0x020399A8
_080C7864: .4byte 0x080C7868
_080C7868: @ jump table
	.4byte _080C7894 @ case 0
	.4byte _080C78EC @ case 1
	.4byte _080C78FA @ case 2
	.4byte _080C7928 @ case 3
	.4byte _080C7944 @ case 4
	.4byte _080C7962 @ case 5
	.4byte _080C7982 @ case 6
	.4byte _080C7988 @ case 7
	.4byte _080C798E @ case 8
	.4byte _080C799C @ case 9
	.4byte _080C79E6 @ case 10
_080C7894:
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	bl sub_080C7734
	ldr r0, _080C78C4
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _080C78E2
	ldr r0, _080C78C8
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C78D2
	cmp r0, #1
	bgt _080C78CC
	cmp r0, #0
	beq _080C78D8
	b _080C78E2
	.align 2, 0
_080C78C4: .4byte 0x020399A8
_080C78C8: .4byte 0x020399AF
_080C78CC:
	cmp r0, #2
	beq _080C78DE
	b _080C78E2
_080C78D2:
	bl sub_080CE00C
	b _080C78E2
_080C78D8:
	bl sub_080CE160
	b _080C78E2
_080C78DE:
	bl GiveChosenBagItem
_080C78E2:
	bl LoadPSSMenuGfx
	bl LoadWaveformSpritePalette
	b _080C7A34
_080C78EC:
	bl InitPSSWindows
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C78F8
	b _080C7A34
_080C78F8:
	b _080C796C
_080C78FA:
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #1
	bl ClearWindowTilemap
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080C7924
	mov r0, sp
	bl CpuSet
	movs r0, #1
	movs r1, #0xb
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	b _080C7A34
	.align 2, 0
_080C7924: .4byte 0x05000080
_080C7928:
	bl ResetAllBgCoords
	ldr r0, _080C7940
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _080C7938
	b _080C7A34
_080C7938:
	bl sub_080C77B8
	b _080C7A34
	.align 2, 0
_080C7940: .4byte 0x020399A8
_080C7944:
	bl sub_080CA778
	ldr r0, _080C7958
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	cmp r0, #0
	bne _080C795C
	bl sub_080CCBE8
	b _080C7A34
	.align 2, 0
_080C7958: .4byte 0x020399A8
_080C795C:
	bl sub_080CCC68
	b _080C7A34
_080C7962:
	bl sub_080CFA04
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7978
_080C796C:
	ldr r0, _080C7974
	bl SetPSSCallback
	b _080C7A3E
	.align 2, 0
_080C7974: .4byte 0x080C96ED
_080C7978:
	bl SetScrollingBackground
	bl sub_080CA480
	b _080C7A34
_080C7982:
	bl sub_080C994C
	b _080C7A34
_080C7988:
	bl sub_080C9F68
	b _080C7A34
_080C798E:
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080CBBA0
	b _080C7A34
_080C799C:
	bl sub_080CBBD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7A3E
	ldr r0, _080C79CC
	ldr r2, [r0]
	ldrb r0, [r2, #1]
	cmp r0, #3
	beq _080C79DC
	ldr r1, _080C79D0
	adds r0, r2, r1
	movs r1, #0xd
	strh r1, [r0]
	ldr r1, _080C79D4
	adds r2, r2, r1
	ldr r1, _080C79D8
	strh r1, [r2]
	bl unref_sub_811BBF4
	bl sub_0811FFB0
	b _080C7A34
	.align 2, 0
_080C79CC: .4byte 0x020399A8
_080C79D0: .4byte 0x00000DA4
_080C79D4: .4byte 0x00000DA6
_080C79D8: .4byte 0x0000DACE
_080C79DC:
	bl sub_080D0500
	bl sub_080CA720
	b _080C7A34
_080C79E6:
	bl sub_080C77E8
	ldr r0, _080C7A08
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	cmp r0, #0
	bne _080C7A10
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, _080C7A0C
	bl SetPSSCallback
	b _080C7A22
	.align 2, 0
_080C7A08: .4byte 0x020399A8
_080C7A0C: .4byte 0x080C7A49
_080C7A10:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, _080C7A2C
	bl SetPSSCallback
_080C7A22:
	ldr r0, _080C7A30
	bl SetVBlankCallback
	b _080C7A3E
	.align 2, 0
_080C7A2C: .4byte 0x080C7A95
_080C7A30: .4byte 0x080C75C5
_080C7A34:
	ldr r0, _080C7A44
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080C7A3E:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C7A44: .4byte 0x020399A8
	thumb_func_end Cb_InitPSS

	thumb_func_start Cb_ShowPSS
Cb_ShowPSS: @ 0x080C7A48
	push {r4, lr}
	ldr r4, _080C7A5C
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C7A60
	cmp r0, #1
	beq _080C7A7A
	b _080C7A8A
	.align 2, 0
_080C7A5C: .4byte 0x020399A8
_080C7A60:
	movs r0, #2
	bl PlaySE
	movs r0, #0x14
	movs r1, #0
	movs r2, #1
	bl sub_080FA43C
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C7A8A
_080C7A7A:
	bl sub_080FA48C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7A8A
	ldr r0, _080C7A90
	bl SetPSSCallback
_080C7A8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7A90: .4byte 0x080C7B49
	thumb_func_end Cb_ShowPSS

	thumb_func_start Cb_ReshowPSS
Cb_ReshowPSS: @ 0x080C7A94
	push {r4, lr}
	sub sp, #4
	ldr r4, _080C7AAC
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C7ACC
	cmp r0, #1
	bgt _080C7AB0
	cmp r0, #0
	beq _080C7ABA
	b _080C7B3C
	.align 2, 0
_080C7AAC: .4byte 0x020399A8
_080C7AB0:
	cmp r0, #2
	beq _080C7B04
	cmp r0, #3
	beq _080C7B2C
	b _080C7B3C
_080C7ABA:
	movs r1, #1
	rsbs r1, r1, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _080C7B1E
_080C7ACC:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7B3C
	ldr r0, _080C7AF0
	ldrb r0, [r0]
	cmp r0, #2
	bne _080C7AF8
	ldr r0, _080C7AF4
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C7AF8
	movs r0, #0x1c
	bl PrintStorageActionText
	b _080C7B1E
	.align 2, 0
_080C7AF0: .4byte 0x020399AF
_080C7AF4: .4byte 0x0203CB48
_080C7AF8:
	ldr r0, _080C7B00
	bl SetPSSCallback
	b _080C7B3C
	.align 2, 0
_080C7B00: .4byte 0x080C7B49
_080C7B04:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7B3C
	ldr r0, _080C7B28
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080C7B3C
	bl ClearBottomWindow
_080C7B1E:
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C7B3C
	.align 2, 0
_080C7B28: .4byte 0x03002360
_080C7B2C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7B3C
	ldr r0, _080C7B44
	bl SetPSSCallback
_080C7B3C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7B44: .4byte 0x080C7B49
	thumb_func_end Cb_ReshowPSS

	thumb_func_start Cb_MainPSS
Cb_MainPSS: @ 0x080C7B48
	push {r4, r5, lr}
	ldr r0, _080C7B60
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0xb
	bls _080C7B56
	b _080C803A
_080C7B56:
	lsls r0, r0, #2
	ldr r1, _080C7B64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7B60: .4byte 0x020399A8
_080C7B64: .4byte 0x080C7B68
_080C7B68: @ jump table
	.4byte _080C7B98 @ case 0
	.4byte _080C7EB8 @ case 1
	.4byte _080C7EF8 @ case 2
	.4byte _080C7F50 @ case 3
	.4byte _080C7F74 @ case 4
	.4byte _080C7F7E @ case 5
	.4byte _080C7F98 @ case 6
	.4byte _080C7FB8 @ case 7
	.4byte _080C7FBE @ case 8
	.4byte _080C7FD4 @ case 9
	.4byte _080C8000 @ case 10
	.4byte _080C8028 @ case 11
_080C7B98:
	bl sub_080CF268
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r0, #0x19
	bls _080C7BA8
	b _080C803A
_080C7BA8:
	lsls r0, r0, #2
	ldr r1, _080C7BB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7BB4: .4byte 0x080C7BB8
_080C7BB8: @ jump table
	.4byte _080C7C20 @ case 0
	.4byte _080C803A @ case 1
	.4byte _080C803A @ case 2
	.4byte _080C7CB0 @ case 3
	.4byte _080C7C34 @ case 4
	.4byte _080C7C68 @ case 5
	.4byte _080C7CC8 @ case 6
	.4byte _080C7CDC @ case 7
	.4byte _080C7CE8 @ case 8
	.4byte _080C7D20 @ case 9
	.4byte _080C7D64 @ case 10
	.4byte _080C7DE8 @ case 11
	.4byte _080C7DA8 @ case 12
	.4byte _080C7DBA @ case 13
	.4byte _080C7DFC @ case 14
	.4byte _080C7E10 @ case 15
	.4byte _080C7E24 @ case 16
	.4byte _080C7E38 @ case 17
	.4byte _080C7CBC @ case 18
	.4byte _080C7E4C @ case 19
	.4byte _080C7E6C @ case 20
	.4byte _080C7E56 @ case 21
	.4byte _080C7E76 @ case 22
	.4byte _080C7EB0 @ case 23
	.4byte _080C7E7A @ case 24
	.4byte _080C7E94 @ case 25
_080C7C20:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C7C30
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7C30: .4byte 0x020399A8
_080C7C34:
	ldr r4, _080C7C54
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080C7C58
	movs r0, #0x10
	bl PrintStorageActionText
	ldr r1, [r4]
	movs r0, #3
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7C54: .4byte 0x020399A8
_080C7C58:
	bl sub_080CD488
	ldr r0, _080C7C64
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7C64: .4byte 0x080C8045
_080C7C68:
	ldr r4, _080C7C94
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _080C7C9C
	bl GetBoxCursorPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C7CA2
	ldr r0, [r4]
	ldr r1, _080C7C98
	adds r0, r0, r1
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C7C90
	b _080C7D82
_080C7C90:
	b _080C7CA2
	.align 2, 0
_080C7C94: .4byte 0x020399A8
_080C7C98: .4byte 0x00000CE6
_080C7C9C:
	cmp r0, #3
	beq _080C7CA2
	b _080C803A
_080C7CA2:
	ldr r0, _080C7CAC
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7CAC: .4byte 0x080C8085
_080C7CB0:
	ldr r0, _080C7CB8
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7CB8: .4byte 0x080C9485
_080C7CBC:
	ldr r0, _080C7CC4
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7CC4: .4byte 0x080C95B9
_080C7CC8:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C7CD8
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7CD8: .4byte 0x080C8FC9
_080C7CDC:
	ldr r0, _080C7CE4
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7CE4: .4byte 0x080C8101
_080C7CE8:
	movs r0, #5
	bl PlaySE
	bl StorageGetCurrentBox
	ldr r4, _080C7D18
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #1
	ldr r2, _080C7D1C
	adds r1, r1, r2
	strh r0, [r1]
	cmp r0, #0xd
	ble _080C7D0A
	movs r0, #0
	strh r0, [r1]
_080C7D0A:
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	cmp r0, #3
	beq _080C7D58
	adds r0, r1, r2
	b _080C8012
	.align 2, 0
_080C7D18: .4byte 0x020399A8
_080C7D1C: .4byte 0x000002CA
_080C7D20:
	movs r0, #5
	bl PlaySE
	bl StorageGetCurrentBox
	ldr r4, _080C7D50
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	ldr r2, _080C7D54
	adds r1, r1, r2
	strh r0, [r1]
	cmp r0, #0
	bge _080C7D42
	movs r0, #0xd
	strh r0, [r1]
_080C7D42:
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	cmp r0, #3
	beq _080C7D58
	adds r0, r1, r2
	b _080C8012
	.align 2, 0
_080C7D50: .4byte 0x020399A8
_080C7D54: .4byte 0x000002CA
_080C7D58:
	bl sub_080CF724
	ldr r1, [r4]
	movs r0, #0xa
	strb r0, [r1]
	b _080C803A
_080C7D64:
	bl CanMovePartyMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7DC4
	ldr r4, _080C7D8C
	ldr r0, [r4]
	ldr r1, _080C7D90
	adds r0, r0, r1
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C7D94
_080C7D82:
	ldr r1, [r4]
	movs r0, #5
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7D8C: .4byte 0x020399A8
_080C7D90: .4byte 0x00000CE6
_080C7D94:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C7DA4
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7DA4: .4byte 0x080C8615
_080C7DA8:
	bl CanMovePartyMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7DC4
	movs r0, #5
	bl PlaySE
	b _080C7FC8
_080C7DBA:
	bl CanShiftMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7DD4
_080C7DC4:
	ldr r0, _080C7DD0
	ldr r1, [r0]
	movs r0, #4
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7DD0: .4byte 0x020399A8
_080C7DD4:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C7DE4
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7DE4: .4byte 0x080C84E5
_080C7DE8:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C7DF8
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7DF8: .4byte 0x080C852D
_080C7DFC:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C7E0C
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7E0C: .4byte 0x080C8489
_080C7E10:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C7E20
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7E20: .4byte 0x080C89C5
_080C7E24:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C7E34
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7E34: .4byte 0x080C8A79
_080C7E38:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C7E48
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7E48: .4byte 0x080C8C4D
_080C7E4C:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	b _080C7E9C
_080C7E56:
	movs r0, #1
	bl sub_080CFA70
	ldr r0, _080C7E68
	ldr r1, [r0]
	movs r0, #8
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7E68: .4byte 0x020399A8
_080C7E6C:
	movs r0, #5
	bl PlaySE
	movs r0, #2
	b _080C7E82
_080C7E76:
	movs r0, #3
	b _080C7E9C
_080C7E7A:
	movs r0, #5
	bl PlaySE
	movs r0, #4
_080C7E82:
	bl sub_080CFA70
	ldr r0, _080C7E90
	ldr r1, [r0]
	movs r0, #9
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7E90: .4byte 0x020399A8
_080C7E94:
	movs r0, #5
	bl PlaySE
	movs r0, #5
_080C7E9C:
	bl sub_080CFA70
	ldr r0, _080C7EAC
	ldr r1, [r0]
	movs r0, #7
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7EAC: .4byte 0x020399A8
_080C7EB0:
	movs r0, #0x20
	bl PlaySE
	b _080C803A
_080C7EB8:
	bl sub_080CCDD0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C7EC4
	b _080C803A
_080C7EC4:
	bl IsCursorOnCloseBox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C7ED4
	bl sub_080CA224
	b _080C7ED8
_080C7ED4:
	bl sub_080CA250
_080C7ED8:
	ldr r4, _080C7EF0
	ldr r0, [r4]
	ldr r1, _080C7EF4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C7EEA
	bl BoxSetMosaic
_080C7EEA:
	ldr r1, [r4]
	b _080C7F64
	.align 2, 0
_080C7EF0: .4byte 0x020399A8
_080C7EF4: .4byte 0x00000CEA
_080C7EF8:
	bl ScrollToBox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C7F04
	b _080C803A
_080C7F04:
	ldr r0, _080C7F44
	ldr r0, [r0]
	ldr r1, _080C7F48
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetCurrentBox
	ldr r0, _080C7F4C
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C7F2C
	bl GetBoxCursorPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C7F2C
	bl sub_080CD888
	bl BoxSetMosaic
_080C7F2C:
	ldr r4, _080C7F44
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _080C7F64
	bl sub_080CF748
	ldr r1, [r4]
	movs r0, #0xb
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7F44: .4byte 0x020399A8
_080C7F48: .4byte 0x000002CA
_080C7F4C: .4byte 0x020399AC
_080C7F50:
	ldr r0, _080C7F6C
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C803A
	bl ClearBottomWindow
	ldr r0, _080C7F70
	ldr r1, [r0]
_080C7F64:
	movs r0, #0
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7F6C: .4byte 0x03002360
_080C7F70: .4byte 0x020399A8
_080C7F74:
	movs r0, #0x20
	bl PlaySE
	movs r0, #0xd
	b _080C7F86
_080C7F7E:
	movs r0, #0x20
	bl PlaySE
	movs r0, #0x16
_080C7F86:
	bl PrintStorageActionText
	ldr r0, _080C7F94
	ldr r1, [r0]
	movs r0, #6
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C7F94: .4byte 0x020399A8
_080C7F98:
	ldr r0, _080C7FB0
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C803A
	bl ClearBottomWindow
	ldr r0, _080C7FB4
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7FB0: .4byte 0x03002360
_080C7FB4: .4byte 0x080C7B49
_080C7FB8:
	bl sub_080CFA84
	b _080C802C
_080C7FBE:
	bl sub_080CFA84
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C803A
_080C7FC8:
	ldr r0, _080C7FD0
	bl SetPSSCallback
	b _080C803A
	.align 2, 0
_080C7FD0: .4byte 0x080C842D
_080C7FD4:
	bl sub_080CFA84
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080C803A
	ldr r5, _080C7FF8
	ldr r0, [r5]
	ldr r1, _080C7FFC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C7FF2
	bl BoxSetMosaic
_080C7FF2:
	ldr r0, [r5]
	strb r4, [r0]
	b _080C803A
	.align 2, 0
_080C7FF8: .4byte 0x020399A8
_080C7FFC: .4byte 0x00000CEA
_080C8000:
	bl sub_080D0AB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C803A
	ldr r4, _080C8020
	ldr r0, [r4]
	ldr r1, _080C8024
	adds r0, r0, r1
_080C8012:
	ldrb r0, [r0]
	bl SetUpScrollToBox
	ldr r1, [r4]
	movs r0, #2
	strb r0, [r1]
	b _080C803A
	.align 2, 0
_080C8020: .4byte 0x020399A8
_080C8024: .4byte 0x000002CA
_080C8028:
	bl sub_080D0AB8
_080C802C:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080C803A
	ldr r0, _080C8040
	ldr r0, [r0]
	strb r1, [r0]
_080C803A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C8040: .4byte 0x020399A8
	thumb_func_end Cb_MainPSS

	thumb_func_start Cb_ShowPartyPokemon
Cb_ShowPartyPokemon: @ 0x080C8044
	push {r4, lr}
	ldr r4, _080C8058
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C805C
	cmp r0, #1
	beq _080C806A
	b _080C807A
	.align 2, 0
_080C8058: .4byte 0x020399A8
_080C805C:
	bl SetUpDoShowPartyMenu
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C807A
_080C806A:
	bl DoShowPartyMenu
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C807A
	ldr r0, _080C8080
	bl SetPSSCallback
_080C807A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8080: .4byte 0x080C7B49
	thumb_func_end Cb_ShowPartyPokemon

	thumb_func_start Cb_HidePartyPokemon
Cb_HidePartyPokemon: @ 0x080C8084
	push {r4, lr}
	ldr r4, _080C809C
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C80B2
	cmp r0, #1
	bgt _080C80A0
	cmp r0, #0
	beq _080C80A6
	b _080C80F2
	.align 2, 0
_080C809C: .4byte 0x020399A8
_080C80A0:
	cmp r0, #2
	beq _080C80D2
	b _080C80F2
_080C80A6:
	movs r0, #5
	bl PlaySE
	bl SetUpHidePartyMenu
	b _080C80C8
_080C80B2:
	bl HidePartyMenu
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C80F2
	bl sub_080CD4A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080CD474
_080C80C8:
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C80F2
_080C80D2:
	bl sub_080CCDD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C80F2
	ldr r0, [r4]
	ldr r1, _080C80F8
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C80EC
	bl BoxSetMosaic
_080C80EC:
	ldr r0, _080C80FC
	bl SetPSSCallback
_080C80F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C80F8: .4byte 0x00000CEA
_080C80FC: .4byte 0x080C7B49
	thumb_func_end Cb_HidePartyPokemon

	thumb_func_start Cb_OnSelectedMon
Cb_OnSelectedMon: @ 0x080C8100
	push {r4, lr}
	ldr r0, _080C8118
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #6
	bls _080C810E
	b _080C841E
_080C810E:
	lsls r0, r0, #2
	ldr r1, _080C811C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8118: .4byte 0x020399A8
_080C811C: .4byte 0x080C8120
_080C8120: @ jump table
	.4byte _080C813C @ case 0
	.4byte _080C81A0 @ case 1
	.4byte _080C81BC @ case 2
	.4byte _080C83D8 @ case 3
	.4byte _080C83EC @ case 4
	.4byte _080C83E2 @ case 5
	.4byte _080C8408 @ case 6
_080C813C:
	bl sub_080C9B2C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C8148
	b _080C841E
_080C8148:
	movs r0, #5
	bl PlaySE
	ldr r4, _080C8160
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #3
	beq _080C8164
	movs r0, #4
	bl PrintStorageActionText
	b _080C818E
	.align 2, 0
_080C8160: .4byte 0x020399A8
_080C8164:
	bl IsActiveItemMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C817A
	ldr r0, [r4]
	ldr r1, _080C8184
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C8188
_080C817A:
	movs r0, #0x17
	bl PrintStorageActionText
	b _080C818E
	.align 2, 0
_080C8184: .4byte 0x00000CE6
_080C8188:
	movs r0, #0x18
	bl PrintStorageActionText
_080C818E:
	bl AddMenu
	ldr r0, _080C819C
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1]
	b _080C841E
	.align 2, 0
_080C819C: .4byte 0x020399A8
_080C81A0:
	bl sub_080CF948
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C81AC
	b _080C841E
_080C81AC:
	ldr r0, _080C81B8
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1]
	b _080C841E
	.align 2, 0
_080C81B8: .4byte 0x020399A8
_080C81BC:
	bl sub_080CF94C
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x12
	bls _080C81CC
	b _080C841E
_080C81CC:
	lsls r0, r0, #2
	ldr r1, _080C81D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C81D8: .4byte 0x080C81DC
_080C81DC: @ jump table
	.4byte _080C8228 @ case 0
	.4byte _080C8228 @ case 1
	.4byte _080C82A8 @ case 2
	.4byte _080C8290 @ case 3
	.4byte _080C8238 @ case 4
	.4byte _080C8270 @ case 5
	.4byte _080C8258 @ case 6
	.4byte _080C8348 @ case 7
	.4byte _080C82E4 @ case 8
	.4byte _080C835C @ case 9
	.4byte _080C841E @ case 10
	.4byte _080C841E @ case 11
	.4byte _080C841E @ case 12
	.4byte _080C8370 @ case 13
	.4byte _080C8384 @ case 14
	.4byte _080C83B8 @ case 15
	.4byte _080C83A4 @ case 16
	.4byte _080C8398 @ case 17
	.4byte _080C83CC @ case 18
_080C8228:
	bl ClearBottomWindow
	ldr r0, _080C8234
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C8234: .4byte 0x080C7B49
_080C8238:
	bl CanMovePartyMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C82EE
	movs r0, #5
	bl PlaySE
	bl ClearBottomWindow
	ldr r0, _080C8254
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C8254: .4byte 0x080C842D
_080C8258:
	movs r0, #5
	bl PlaySE
	bl ClearBottomWindow
	ldr r0, _080C826C
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C826C: .4byte 0x080C8489
_080C8270:
	bl CanShiftMon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C82EE
	movs r0, #5
	bl PlaySE
	bl ClearBottomWindow
	ldr r0, _080C828C
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C828C: .4byte 0x080C84E5
_080C8290:
	movs r0, #5
	bl PlaySE
	bl ClearBottomWindow
	ldr r0, _080C82A4
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C82A4: .4byte 0x080C852D
_080C82A8:
	bl CanMovePartyMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C82EE
	ldr r4, _080C82D8
	ldr r0, [r4]
	ldr r2, _080C82DC
	adds r0, r0, r2
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8328
	movs r0, #5
	bl PlaySE
	bl ClearBottomWindow
	ldr r0, _080C82E0
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C82D8: .4byte 0x020399A8
_080C82DC: .4byte 0x00000CE6
_080C82E0: .4byte 0x080C8615
_080C82E4:
	bl CanMovePartyMon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C82FC
_080C82EE:
	ldr r0, _080C82F8
	ldr r1, [r0]
	movs r0, #3
	strb r0, [r1]
	b _080C841E
	.align 2, 0
_080C82F8: .4byte 0x020399A8
_080C82FC:
	ldr r4, _080C8310
	ldr r1, [r4]
	ldr r2, _080C8314
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C8318
	movs r0, #5
	strb r0, [r1]
	b _080C841E
	.align 2, 0
_080C8310: .4byte 0x020399A8
_080C8314: .4byte 0x00000CED
_080C8318:
	ldr r2, _080C8330
	adds r0, r1, r2
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C8334
_080C8328:
	ldr r1, [r4]
	movs r0, #4
	strb r0, [r1]
	b _080C841E
	.align 2, 0
_080C8330: .4byte 0x00000CE6
_080C8334:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C8344
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C8344: .4byte 0x080C8751
_080C8348:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C8358
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C8358: .4byte 0x080C93C5
_080C835C:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C836C
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C836C: .4byte 0x080C8941
_080C8370:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C8380
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C8380: .4byte 0x080C89C5
_080C8384:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C8394
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C8394: .4byte 0x080C8A79
_080C8398:
	ldr r0, _080C83A0
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C83A0: .4byte 0x080C8B35
_080C83A4:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C83B4
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C83B4: .4byte 0x080C8C4D
_080C83B8:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C83C8
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C83C8: .4byte 0x080C9425
_080C83CC:
	ldr r0, _080C83D4
	bl SetPSSCallback
	b _080C841E
	.align 2, 0
_080C83D4: .4byte 0x080C8D35
_080C83D8:
	movs r0, #0x20
	bl PlaySE
	movs r0, #0xd
	b _080C83F4
_080C83E2:
	movs r0, #0x20
	bl PlaySE
	movs r0, #0x11
	b _080C83F4
_080C83EC:
	movs r0, #0x20
	bl PlaySE
	movs r0, #0x16
_080C83F4:
	bl PrintStorageActionText
	ldr r0, _080C8404
	ldr r1, [r0]
	movs r0, #6
	strb r0, [r1]
	b _080C841E
	.align 2, 0
_080C8404: .4byte 0x020399A8
_080C8408:
	ldr r0, _080C8424
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C841E
	bl ClearBottomWindow
	ldr r0, _080C8428
	bl SetPSSCallback
_080C841E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8424: .4byte 0x03002360
_080C8428: .4byte 0x080C7B49
	thumb_func_end Cb_OnSelectedMon

	thumb_func_start Cb_MoveMon
Cb_MoveMon: @ 0x080C842C
	push {r4, lr}
	ldr r4, _080C8440
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C8444
	cmp r0, #1
	beq _080C8454
	b _080C847E
	.align 2, 0
_080C8440: .4byte 0x020399A8
_080C8444:
	movs r0, #0
	bl InitMonPlaceChange
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C847E
_080C8454:
	bl DoMonPlaceChange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C847E
	ldr r0, _080C8470
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C8478
	ldr r0, _080C8474
	bl SetPSSCallback
	b _080C847E
	.align 2, 0
_080C8470: .4byte 0x020399AC
_080C8474: .4byte 0x080C8F0D
_080C8478:
	ldr r0, _080C8484
	bl SetPSSCallback
_080C847E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8484: .4byte 0x080C7B49
	thumb_func_end Cb_MoveMon

	thumb_func_start Cb_PlaceMon
Cb_PlaceMon: @ 0x080C8488
	push {r4, lr}
	ldr r4, _080C849C
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C84A0
	cmp r0, #1
	beq _080C84B0
	b _080C84DA
	.align 2, 0
_080C849C: .4byte 0x020399A8
_080C84A0:
	movs r0, #1
	bl InitMonPlaceChange
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C84DA
_080C84B0:
	bl DoMonPlaceChange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C84DA
	ldr r0, _080C84CC
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C84D4
	ldr r0, _080C84D0
	bl SetPSSCallback
	b _080C84DA
	.align 2, 0
_080C84CC: .4byte 0x020399AC
_080C84D0: .4byte 0x080C8F0D
_080C84D4:
	ldr r0, _080C84E0
	bl SetPSSCallback
_080C84DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C84E0: .4byte 0x080C7B49
	thumb_func_end Cb_PlaceMon

	thumb_func_start Cb_ShiftMon
Cb_ShiftMon: @ 0x080C84E4
	push {r4, lr}
	ldr r4, _080C84F8
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C84FC
	cmp r0, #1
	beq _080C850C
	b _080C8520
	.align 2, 0
_080C84F8: .4byte 0x020399A8
_080C84FC:
	movs r0, #2
	bl InitMonPlaceChange
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C8520
_080C850C:
	bl DoMonPlaceChange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8520
	bl BoxSetMosaic
	ldr r0, _080C8528
	bl SetPSSCallback
_080C8520:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8528: .4byte 0x080C7B49
	thumb_func_end Cb_ShiftMon

	thumb_func_start Cb_WithdrawMon
Cb_WithdrawMon: @ 0x080C852C
	push {lr}
	ldr r0, _080C8544
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #5
	bhi _080C860A
	lsls r0, r0, #2
	ldr r1, _080C8548
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8544: .4byte 0x020399A8
_080C8548: .4byte 0x080C854C
_080C854C: @ jump table
	.4byte _080C8564 @ case 0
	.4byte _080C859C @ case 1
	.4byte _080C85BC @ case 2
	.4byte _080C85D2 @ case 3
	.4byte _080C85E4 @ case 4
	.4byte _080C8604 @ case 5
_080C8564:
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _080C8584
	movs r0, #0xe
	bl PrintStorageActionText
	ldr r0, _080C8580
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1]
	b _080C860A
	.align 2, 0
_080C8580: .4byte 0x020399A8
_080C8584:
	bl sub_080CD494
	movs r0, #0
	bl InitMonPlaceChange
	ldr r0, _080C8598
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1]
	b _080C860A
	.align 2, 0
_080C8598: .4byte 0x020399A8
_080C859C:
	ldr r0, _080C85B4
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C860A
	bl ClearBottomWindow
	ldr r0, _080C85B8
	bl SetPSSCallback
	b _080C860A
	.align 2, 0
_080C85B4: .4byte 0x03002360
_080C85B8: .4byte 0x080C7B49
_080C85BC:
	bl DoMonPlaceChange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C860A
	movs r0, #1
	bl SetMovingMonPriority
	bl SetUpDoShowPartyMenu
	b _080C85F2
_080C85D2:
	bl DoShowPartyMenu
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C860A
	movs r0, #1
	bl InitMonPlaceChange
	b _080C85F2
_080C85E4:
	bl DoMonPlaceChange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C860A
	bl sub_080CA384
_080C85F2:
	ldr r0, _080C8600
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C860A
	.align 2, 0
_080C8600: .4byte 0x020399A8
_080C8604:
	ldr r0, _080C8610
	bl SetPSSCallback
_080C860A:
	pop {r0}
	bx r0
	.align 2, 0
_080C8610: .4byte 0x080C8085
	thumb_func_end Cb_WithdrawMon

	thumb_func_start Cb_DepositMenu
Cb_DepositMenu: @ 0x080C8614
	push {r4, lr}
	sub sp, #4
	ldr r0, _080C8630
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #4
	bls _080C8624
	b _080C873E
_080C8624:
	lsls r0, r0, #2
	ldr r1, _080C8634
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8630: .4byte 0x020399A8
_080C8634: .4byte 0x080C8638
_080C8638: @ jump table
	.4byte _080C864C @ case 0
	.4byte _080C8688 @ case 1
	.4byte _080C86E8 @ case 2
	.4byte _080C8700 @ case 3
	.4byte _080C8724 @ case 4
_080C864C:
	movs r0, #6
	bl PrintStorageActionText
	ldr r4, _080C8678
	ldr r0, [r4]
	ldr r1, _080C867C
	adds r0, r0, r1
	ldr r2, _080C8680
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	movs r3, #3
	bl sub_080C7080
	ldr r0, _080C8684
	ldrb r0, [r0]
	bl sub_080C716C
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	b _080C873C
	.align 2, 0
_080C8678: .4byte 0x020399A8
_080C867C: .4byte 0x00001E5C
_080C8680: .4byte 0x0000DAC7
_080C8684: .4byte 0x020399AE
_080C8688:
	bl HandleBoxChooseSelectionInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0xc8
	beq _080C873E
	cmp r0, #0xc9
	bne _080C86A8
	bl ClearBottomWindow
	bl sub_080C717C
	bl sub_080C7128
	b _080C8716
_080C86A8:
	adds r0, r4, #0
	bl TryStorePartyMonInBox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C86D4
	ldr r0, _080C86CC
	strb r4, [r0]
	bl ClearBottomWindow
	bl sub_080C717C
	bl sub_080C7128
	ldr r0, _080C86D0
	ldr r1, [r0]
	movs r0, #2
	b _080C873C
	.align 2, 0
_080C86CC: .4byte 0x020399AE
_080C86D0: .4byte 0x020399A8
_080C86D4:
	movs r0, #8
	bl PrintStorageActionText
	ldr r0, _080C86E4
	ldr r1, [r0]
	movs r0, #4
	b _080C873C
	.align 2, 0
_080C86E4: .4byte 0x020399A8
_080C86E8:
	bl CompactPartySlots
	bl sub_080CB1C4
	ldr r0, _080C86FC
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	b _080C873C
	.align 2, 0
_080C86FC: .4byte 0x020399A8
_080C8700:
	bl GetWaldaWallpaperPatternId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C873E
	bl sub_080CDAA8
	bl BoxSetMosaic
	bl sub_080CA384
_080C8716:
	ldr r0, _080C8720
	bl SetPSSCallback
	b _080C873E
	.align 2, 0
_080C8720: .4byte 0x080C7B49
_080C8724:
	ldr r0, _080C8748
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C873E
	movs r0, #6
	bl PrintStorageActionText
	ldr r0, _080C874C
	ldr r1, [r0]
	movs r0, #1
_080C873C:
	strb r0, [r1]
_080C873E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8748: .4byte 0x03002360
_080C874C: .4byte 0x020399A8
	thumb_func_end Cb_DepositMenu

	thumb_func_start Cb_ReleaseMon
Cb_ReleaseMon: @ 0x080C8750
	push {lr}
	ldr r0, _080C8768
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _080C875E
	b _080C8932
_080C875E:
	lsls r0, r0, #2
	ldr r1, _080C876C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8768: .4byte 0x020399A8
_080C876C: .4byte 0x080C8770
_080C8770: @ jump table
	.4byte _080C87A8 @ case 0
	.4byte _080C87BE @ case 1
	.4byte _080C87F6 @ case 2
	.4byte _080C881C @ case 3
	.4byte _080C8828 @ case 4
	.4byte _080C8840 @ case 5
	.4byte _080C887C @ case 6
	.4byte _080C8894 @ case 7
	.4byte _080C88A0 @ case 8
	.4byte _080C88A4 @ case 9
	.4byte _080C88B8 @ case 10
	.4byte _080C88D4 @ case 11
	.4byte _080C88E6 @ case 12
	.4byte _080C891C @ case 13
_080C87A8:
	movs r0, #9
	bl PrintStorageActionText
	movs r0, #1
	bl ShowYesNoWindow
	ldr r0, _080C87D8
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080C87BE:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080C87E8
	cmp r1, #0
	bgt _080C87DC
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080C87E2
	b _080C8932
	.align 2, 0
_080C87D8: .4byte 0x020399A8
_080C87DC:
	cmp r1, #1
	beq _080C87E2
	b _080C8932
_080C87E2:
	bl ClearBottomWindow
	b _080C8894
_080C87E8:
	bl ClearBottomWindow
	bl InitCanRelaseMonVars
	bl sub_080CDACC
	b _080C88F8
_080C87F6:
	bl RunCanReleaseMon
	bl sub_080CDB24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C8806
	b _080C8932
_080C8806:
	b _080C880E
_080C8808:
	cmp r0, #0
	bne _080C880E
	b _080C890C
_080C880E:
	bl RunCanReleaseMon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080C8808
	b _080C88F8
_080C881C:
	bl ReleaseMon
	bl RefreshCursorMonData
	movs r0, #0xa
	b _080C88F4
_080C8828:
	ldr r0, _080C883C
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	bne _080C8836
	b _080C8932
_080C8836:
	movs r0, #0xb
	b _080C88F4
	.align 2, 0
_080C883C: .4byte 0x03002360
_080C8840:
	ldr r0, _080C8864
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8932
	bl ClearBottomWindow
	ldr r0, _080C8868
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C886C
	bl CompactPartySlots
	bl sub_080CB1C4
	b _080C88F8
	.align 2, 0
_080C8864: .4byte 0x03002360
_080C8868: .4byte 0x020399AC
_080C886C:
	ldr r0, _080C8878
	ldr r1, [r0]
	movs r0, #7
	strb r0, [r1]
	b _080C8932
	.align 2, 0
_080C8878: .4byte 0x020399A8
_080C887C:
	bl GetWaldaWallpaperPatternId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8932
	bl sub_080CD888
	bl BoxSetMosaic
	bl sub_080CA384
	b _080C88F8
_080C8894:
	ldr r0, _080C889C
	bl SetPSSCallback
	b _080C8932
	.align 2, 0
_080C889C: .4byte 0x080C7B49
_080C88A0:
	movs r0, #0xa
	b _080C88F4
_080C88A4:
	ldr r0, _080C88B4
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8932
	movs r0, #0x15
	b _080C88F4
	.align 2, 0
_080C88B4: .4byte 0x03002360
_080C88B8:
	ldr r0, _080C88D0
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8932
	bl ClearBottomWindow
	bl sub_080CB8D8
	b _080C88F8
	.align 2, 0
_080C88D0: .4byte 0x03002360
_080C88D4:
	bl sub_080CB914
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8932
	bl sub_080CDBA0
	movs r0, #0x13
	b _080C88F4
_080C88E6:
	ldr r0, _080C8904
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8932
	movs r0, #0x14
_080C88F4:
	bl PrintStorageActionText
_080C88F8:
	ldr r0, _080C8908
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C8932
	.align 2, 0
_080C8904: .4byte 0x03002360
_080C8908: .4byte 0x020399A8
_080C890C:
	ldr r0, _080C8918
	ldr r1, [r0]
	movs r0, #8
	strb r0, [r1]
	b _080C8932
	.align 2, 0
_080C8918: .4byte 0x020399A8
_080C891C:
	ldr r0, _080C8938
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8932
	bl ClearBottomWindow
	ldr r0, _080C893C
	bl SetPSSCallback
_080C8932:
	pop {r0}
	bx r0
	.align 2, 0
_080C8938: .4byte 0x03002360
_080C893C: .4byte 0x080C7B49
	thumb_func_end Cb_ReleaseMon

	thumb_func_start Cb_ShowMarkMenu
Cb_ShowMarkMenu: @ 0x080C8940
	push {r4, lr}
	ldr r4, _080C8954
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C8958
	cmp r0, #1
	beq _080C898C
	b _080C89B4
	.align 2, 0
_080C8954: .4byte 0x020399A8
_080C8958:
	movs r0, #0xc
	bl PrintStorageActionText
	ldr r0, [r4]
	ldr r2, _080C8984
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r3, _080C8988
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r1, #0xb0
	movs r2, #0x10
	bl sub_0811FFC4
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C89B4
	.align 2, 0
_080C8984: .4byte 0x00000CEB
_080C8988: .4byte 0x00000DA8
_080C898C:
	bl sub_081200C4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C89B4
	bl sub_08120018
	bl ClearBottomWindow
	ldr r0, [r4]
	ldr r1, _080C89BC
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetMonMarkings
	bl RefreshCursorMonData
	ldr r0, _080C89C0
	bl SetPSSCallback
_080C89B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C89BC: .4byte 0x00000DA8
_080C89C0: .4byte 0x080C7B49
	thumb_func_end Cb_ShowMarkMenu

	thumb_func_start Cb_TakeItemForMoving
Cb_TakeItemForMoving: @ 0x080C89C4
	push {r4, r5, lr}
	ldr r5, _080C89DC
	ldr r0, [r5]
	ldrb r1, [r0]
	cmp r1, #1
	beq _080C8A10
	cmp r1, #1
	bgt _080C89E0
	cmp r1, #0
	beq _080C89EA
	b _080C8A6E
	.align 2, 0
_080C89DC: .4byte 0x020399A8
_080C89E0:
	cmp r1, #2
	beq _080C8A38
	cmp r1, #3
	beq _080C8A5E
	b _080C8A6E
_080C89EA:
	ldr r1, _080C8A00
	adds r0, r0, r1
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8A04
	bl ClearBottomWindow
	b _080C8A54
	.align 2, 0
_080C8A00: .4byte 0x00000CE6
_080C8A04:
	ldr r0, _080C8A0C
	bl SetPSSCallback
	b _080C8A6E
	.align 2, 0
_080C8A0C: .4byte 0x080C8F55
_080C8A10:
	movs r0, #2
	bl sub_080CF6D0
	ldr r0, _080C8A34
	ldrb r0, [r0]
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	bl sub_080CF684
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl Item_FromMonToMoving
	b _080C8A54
	.align 2, 0
_080C8A34: .4byte 0x020399AC
_080C8A38:
	bl sub_080D0AB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8A6E
	movs r0, #3
	bl sub_080CF6D0
	bl ClearBottomWindow
	bl sub_080CD888
	bl PrintCursorMonInfo
_080C8A54:
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C8A6E
_080C8A5E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8A6E
	ldr r0, _080C8A74
	bl SetPSSCallback
_080C8A6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C8A74: .4byte 0x080C7B49
	thumb_func_end Cb_TakeItemForMoving

	thumb_func_start Cb_GiveMovingItemToMon
Cb_GiveMovingItemToMon: @ 0x080C8A78
	push {r4, lr}
	ldr r0, _080C8A90
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080C8B28
	lsls r0, r0, #2
	ldr r1, _080C8A94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8A90: .4byte 0x020399A8
_080C8A94: .4byte 0x080C8A98
_080C8A98: @ jump table
	.4byte _080C8B00 @ case 0
	.4byte _080C8AAC @ case 1
	.4byte _080C8AD4 @ case 2
	.4byte _080C8AF4 @ case 3
	.4byte _080C8B18 @ case 4
_080C8AAC:
	movs r0, #2
	bl sub_080CF6D0
	ldr r0, _080C8AD0
	ldrb r0, [r0]
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	bl sub_080CF684
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl Item_GiveMovingToMon
	b _080C8B04
	.align 2, 0
_080C8AD0: .4byte 0x020399AC
_080C8AD4:
	bl sub_080D0AB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8B28
	movs r0, #0
	bl sub_080CF6D0
	bl sub_080CD888
	bl PrintCursorMonInfo
	movs r0, #0x1c
	bl PrintStorageActionText
	b _080C8B04
_080C8AF4:
	ldr r0, _080C8B10
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8B28
_080C8B00:
	bl ClearBottomWindow
_080C8B04:
	ldr r0, _080C8B14
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C8B28
	.align 2, 0
_080C8B10: .4byte 0x03002360
_080C8B14: .4byte 0x020399A8
_080C8B18:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8B28
	ldr r0, _080C8B30
	bl SetPSSCallback
_080C8B28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8B30: .4byte 0x080C7B49
	thumb_func_end Cb_GiveMovingItemToMon

	thumb_func_start Cb_ItemToBag
Cb_ItemToBag: @ 0x080C8B34
	push {r4, r5, lr}
	ldr r1, _080C8B50
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #4
	bls _080C8B44
	b _080C8C3E
_080C8B44:
	lsls r0, r0, #2
	ldr r1, _080C8B54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8B50: .4byte 0x020399A8
_080C8B54: .4byte 0x080C8B58
_080C8B58: @ jump table
	.4byte _080C8B6C @ case 0
	.4byte _080C8BC4 @ case 1
	.4byte _080C8BE4 @ case 2
	.4byte _080C8C28 @ case 3
	.4byte _080C8C10 @ case 4
_080C8B6C:
	ldr r0, [r5]
	ldr r1, _080C8B94
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8B98
	movs r0, #0x20
	bl PlaySE
	movs r0, #0x1a
	bl PrintStorageActionText
	ldr r1, [r5]
	movs r0, #3
	strb r0, [r1]
	b _080C8C3E
	.align 2, 0
_080C8B94: .4byte 0x00000CE6
_080C8B98:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C8BC0
	ldrb r0, [r0]
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	bl sub_080CF684
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl Item_TakeMons
	ldr r1, [r5]
	movs r0, #1
	strb r0, [r1]
	b _080C8C3E
	.align 2, 0
_080C8BC0: .4byte 0x020399AC
_080C8BC4:
	bl sub_080D0AB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8C3E
	movs r0, #0x19
	bl PrintStorageActionText
	ldr r0, _080C8BE0
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1]
	b _080C8C3E
	.align 2, 0
_080C8BE0: .4byte 0x020399A8
_080C8BE4:
	ldr r0, _080C8C08
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8C3E
	bl ClearBottomWindow
	bl sub_080CD888
	bl PrintCursorMonInfo
	ldr r0, _080C8C0C
	ldr r1, [r0]
	movs r0, #4
	strb r0, [r1]
	b _080C8C3E
	.align 2, 0
_080C8C08: .4byte 0x03002360
_080C8C0C: .4byte 0x020399A8
_080C8C10:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8C3E
	ldr r0, _080C8C24
	bl SetPSSCallback
	b _080C8C3E
	.align 2, 0
_080C8C24: .4byte 0x080C7B49
_080C8C28:
	ldr r0, _080C8C44
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8C3E
	bl ClearBottomWindow
	ldr r0, _080C8C48
	bl SetPSSCallback
_080C8C3E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C8C44: .4byte 0x03002360
_080C8C48: .4byte 0x080C7B49
	thumb_func_end Cb_ItemToBag

	thumb_func_start Cb_SwitchSelectedItem
Cb_SwitchSelectedItem: @ 0x080C8C4C
	push {r4, lr}
	ldr r1, _080C8C64
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #4
	bhi _080C8D28
	lsls r0, r0, #2
	ldr r1, _080C8C68
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8C64: .4byte 0x020399A8
_080C8C68: .4byte 0x080C8C6C
_080C8C6C: @ jump table
	.4byte _080C8C80 @ case 0
	.4byte _080C8CAC @ case 1
	.4byte _080C8CD4 @ case 2
	.4byte _080C8CF4 @ case 3
	.4byte _080C8D18 @ case 4
_080C8C80:
	ldr r0, [r4]
	ldr r1, _080C8C9C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8CA0
	bl ClearBottomWindow
	ldr r1, [r4]
	b _080C8D08
	.align 2, 0
_080C8C9C: .4byte 0x00000CE6
_080C8CA0:
	ldr r0, _080C8CA8
	bl SetPSSCallback
	b _080C8D28
	.align 2, 0
_080C8CA8: .4byte 0x080C8F55
_080C8CAC:
	movs r0, #2
	bl sub_080CF6D0
	ldr r0, _080C8CD0
	ldrb r0, [r0]
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	bl sub_080CF684
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl Item_SwitchMonsWithMoving
	b _080C8D04
	.align 2, 0
_080C8CD0: .4byte 0x020399AC
_080C8CD4:
	bl sub_080D0AB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8D28
	movs r0, #3
	bl sub_080CF6D0
	bl sub_080CD888
	bl PrintCursorMonInfo
	movs r0, #0x1d
	bl PrintStorageActionText
	b _080C8D04
_080C8CF4:
	ldr r0, _080C8D10
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8D28
	bl ClearBottomWindow
_080C8D04:
	ldr r0, _080C8D14
	ldr r1, [r0]
_080C8D08:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C8D28
	.align 2, 0
_080C8D10: .4byte 0x03002360
_080C8D14: .4byte 0x020399A8
_080C8D18:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8D28
	ldr r0, _080C8D30
	bl SetPSSCallback
_080C8D28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8D30: .4byte 0x080C7B49
	thumb_func_end Cb_SwitchSelectedItem

	thumb_func_start Cb_ShowItemInfo
Cb_ShowItemInfo: @ 0x080C8D34
	push {lr}
	ldr r0, _080C8D4C
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #6
	bhi _080C8DE0
	lsls r0, r0, #2
	ldr r1, _080C8D50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8D4C: .4byte 0x020399A8
_080C8D50: .4byte 0x080C8D54
_080C8D54: @ jump table
	.4byte _080C8D70 @ case 0
	.4byte _080C8D76 @ case 1
	.4byte _080C8D90 @ case 2
	.4byte _080C8D96 @ case 3
	.4byte _080C8D9C @ case 4
	.4byte _080C8DB4 @ case 5
	.4byte _080C8DD0 @ case 6
_080C8D70:
	bl ClearBottomWindow
	b _080C8DBE
_080C8D76:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8DE0
	movs r0, #6
	bl PlaySE
	bl Cb_HandleMovingMonFromParty
	bl sub_080D10B8
	b _080C8DBE
_080C8D90:
	bl sub_080D10EC
	b _080C8DB8
_080C8D96:
	bl IsDma3ManagerBusyWithBgCopy
	b _080C8DB8
_080C8D9C:
	ldr r0, _080C8DB0
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8DE0
	movs r0, #6
	bl PlaySE
	b _080C8DBE
	.align 2, 0
_080C8DB0: .4byte 0x03002360
_080C8DB4:
	bl sub_080D1184
_080C8DB8:
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8DE0
_080C8DBE:
	ldr r0, _080C8DCC
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C8DE0
	.align 2, 0
_080C8DCC: .4byte 0x020399A8
_080C8DD0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8DE0
	ldr r0, _080C8DE4
	bl SetPSSCallback
_080C8DE0:
	pop {r0}
	bx r0
	.align 2, 0
_080C8DE4: .4byte 0x080C7B49
	thumb_func_end Cb_ShowItemInfo

	thumb_func_start Cb_CloseBoxWhileHoldingItem
Cb_CloseBoxWhileHoldingItem: @ 0x080C8DE8
	push {r4, lr}
	ldr r0, _080C8E00
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #5
	bls _080C8DF6
	b _080C8F00
_080C8DF6:
	lsls r0, r0, #2
	ldr r1, _080C8E04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8E00: .4byte 0x020399A8
_080C8E04: .4byte 0x080C8E08
_080C8E08: @ jump table
	.4byte _080C8E20 @ case 0
	.4byte _080C8E40 @ case 1
	.4byte _080C8E9E @ case 2
	.4byte _080C8EC0 @ case 3
	.4byte _080C8ED4 @ case 4
	.4byte _080C8EF0 @ case 5
_080C8E20:
	movs r0, #5
	bl PlaySE
	movs r0, #0x1b
	bl PrintStorageActionText
	movs r0, #0
	bl ShowYesNoWindow
	ldr r0, _080C8E3C
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1]
	b _080C8F00
	.align 2, 0
_080C8E3C: .4byte 0x020399A8
_080C8E40:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080C8E64
	cmp r1, #0
	bgt _080C8E5A
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080C8E5E
	b _080C8F00
_080C8E5A:
	cmp r1, #1
	bne _080C8F00
_080C8E5E:
	bl ClearBottomWindow
	b _080C8EE4
_080C8E64:
	ldr r4, _080C8E88
	ldr r0, [r4]
	ldr r1, _080C8E8C
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080C8E90
	bl ClearBottomWindow
	ldr r1, [r4]
	movs r0, #3
	strb r0, [r1]
	b _080C8F00
	.align 2, 0
_080C8E88: .4byte 0x020399A8
_080C8E8C: .4byte 0x00002234
_080C8E90:
	movs r0, #0x1a
	bl PrintStorageActionText
	ldr r1, [r4]
	movs r0, #2
	strb r0, [r1]
	b _080C8F00
_080C8E9E:
	ldr r0, _080C8EB8
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8F00
	bl ClearBottomWindow
	ldr r0, _080C8EBC
	ldr r1, [r0]
	movs r0, #5
	strb r0, [r1]
	b _080C8F00
	.align 2, 0
_080C8EB8: .4byte 0x03002360
_080C8EBC: .4byte 0x020399A8
_080C8EC0:
	bl sub_080D0A34
	ldr r0, _080C8ED0
	ldr r1, [r0]
	movs r0, #4
	strb r0, [r1]
	b _080C8F00
	.align 2, 0
_080C8ED0: .4byte 0x020399A8
_080C8ED4:
	bl sub_080D0AB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8F00
	movs r0, #0
	bl sub_080CF6D0
_080C8EE4:
	ldr r0, _080C8EEC
	bl SetPSSCallback
	b _080C8F00
	.align 2, 0
_080C8EEC: .4byte 0x080C7B49
_080C8EF0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8F00
	ldr r0, _080C8F08
	bl SetPSSCallback
_080C8F00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8F08: .4byte 0x080C7B49
	thumb_func_end Cb_CloseBoxWhileHoldingItem

	thumb_func_start sub_080C8F0C
sub_080C8F0C: @ 0x080C8F0C
	push {r4, lr}
	ldr r4, _080C8F20
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C8F24
	cmp r0, #1
	beq _080C8F36
	b _080C8F4A
	.align 2, 0
_080C8F20: .4byte 0x020399A8
_080C8F24:
	bl CompactPartySlots
	bl sub_080CB1C4
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C8F4A
_080C8F36:
	bl GetWaldaWallpaperPatternId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8F4A
	bl sub_080CA384
	ldr r0, _080C8F50
	bl SetPSSCallback
_080C8F4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8F50: .4byte 0x080C7B49
	thumb_func_end sub_080C8F0C

	thumb_func_start Cb_PrintCantStoreMail
Cb_PrintCantStoreMail: @ 0x080C8F54
	push {r4, lr}
	ldr r4, _080C8F6C
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C8F82
	cmp r0, #1
	bgt _080C8F70
	cmp r0, #0
	beq _080C8F7A
	b _080C8FBC
	.align 2, 0
_080C8F6C: .4byte 0x020399A8
_080C8F70:
	cmp r0, #2
	beq _080C8F8E
	cmp r0, #3
	beq _080C8FAC
	b _080C8FBC
_080C8F7A:
	movs r0, #0x1e
	bl PrintStorageActionText
	b _080C8F9E
_080C8F82:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8FBC
	b _080C8F9E
_080C8F8E:
	ldr r0, _080C8FA8
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C8FBC
	bl ClearBottomWindow
_080C8F9E:
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C8FBC
	.align 2, 0
_080C8FA8: .4byte 0x03002360
_080C8FAC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8FBC
	ldr r0, _080C8FC4
	bl SetPSSCallback
_080C8FBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8FC4: .4byte 0x080C7B49
	thumb_func_end Cb_PrintCantStoreMail

	thumb_func_start Cb_HandleBoxOptions
Cb_HandleBoxOptions: @ 0x080C8FC8
	push {r4, lr}
	ldr r4, _080C8FE0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C8FFE
	cmp r0, #1
	bgt _080C8FE4
	cmp r0, #0
	beq _080C8FEA
	b _080C90B4
	.align 2, 0
_080C8FE0: .4byte 0x020399A8
_080C8FE4:
	cmp r0, #2
	beq _080C9010
	b _080C90B4
_080C8FEA:
	movs r0, #1
	bl PrintStorageActionText
	bl AddMenu
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C90B4
_080C8FFE:
	bl sub_080CF948
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C90B4
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080C9010:
	bl sub_080CF94C
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bhi _080C90B4
	lsls r0, r0, #2
	ldr r1, _080C9028
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C9028: .4byte 0x080C902C
_080C902C: @ jump table
	.4byte _080C9060 @ case 0
	.4byte _080C9060 @ case 1
	.4byte _080C90B4 @ case 2
	.4byte _080C90B4 @ case 3
	.4byte _080C90B4 @ case 4
	.4byte _080C90B4 @ case 5
	.4byte _080C90B4 @ case 6
	.4byte _080C90B4 @ case 7
	.4byte _080C90B4 @ case 8
	.4byte _080C90B4 @ case 9
	.4byte _080C90A4 @ case 10
	.4byte _080C908C @ case 11
	.4byte _080C9078 @ case 12
_080C9060:
	movs r0, #1
	bl sub_080CCA24
	bl ClearBottomWindow
	ldr r0, _080C9074
	bl SetPSSCallback
	b _080C90B4
	.align 2, 0
_080C9074: .4byte 0x080C7B49
_080C9078:
	movs r0, #5
	bl PlaySE
	ldr r0, _080C9088
	bl SetPSSCallback
	b _080C90B4
	.align 2, 0
_080C9088: .4byte 0x080C9365
_080C908C:
	movs r0, #5
	bl PlaySE
	bl ClearBottomWindow
	ldr r0, _080C90A0
	bl SetPSSCallback
	b _080C90B4
	.align 2, 0
_080C90A0: .4byte 0x080C90C1
_080C90A4:
	movs r0, #5
	bl PlaySE
	bl ClearBottomWindow
	ldr r0, _080C90BC
	bl SetPSSCallback
_080C90B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C90BC: .4byte 0x080C9275
	thumb_func_end Cb_HandleBoxOptions

	thumb_func_start Cb_HandleWallpapers
Cb_HandleWallpapers: @ 0x080C90C0
	push {r4, r5, lr}
	ldr r0, _080C90D8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #6
	bls _080C90CE
	b _080C9268
_080C90CE:
	lsls r0, r0, #2
	ldr r1, _080C90DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C90D8: .4byte 0x020399A8
_080C90DC: .4byte 0x080C90E0
_080C90E0: @ jump table
	.4byte _080C90FC @ case 0
	.4byte _080C9114 @ case 1
	.4byte _080C9130 @ case 2
	.4byte _080C91A8 @ case 3
	.4byte _080C91D8 @ case 4
	.4byte _080C922C @ case 5
	.4byte _080C9248 @ case 6
_080C90FC:
	bl AddWallpaperSetsMenu
	movs r0, #2
	bl PrintStorageActionText
	ldr r0, _080C9110
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	b _080C9266
	.align 2, 0
_080C9110: .4byte 0x020399A8
_080C9114:
	bl sub_080CF948
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C9120
	b _080C9268
_080C9120:
	ldr r0, _080C912C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	b _080C9266
	.align 2, 0
_080C912C: .4byte 0x020399A8
_080C9130:
	bl sub_080CF94C
	ldr r4, _080C9154
	ldr r1, [r4]
	ldr r5, _080C9158
	adds r1, r1, r5
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r1, r0]
	cmp r1, #0x15
	bgt _080C915C
	cmp r1, #0x12
	bge _080C916E
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080C9162
	b _080C9268
	.align 2, 0
_080C9154: .4byte 0x020399A8
_080C9158: .4byte 0x0000078E
_080C915C:
	cmp r1, #0x16
	beq _080C9188
	b _080C9268
_080C9162:
	movs r0, #1
	bl sub_080CCA24
	bl ClearBottomWindow
	b _080C923C
_080C916E:
	movs r0, #5
	bl PlaySE
	bl sub_080CF9DC
	ldr r1, [r4]
	adds r2, r1, r5
	ldrh r0, [r2]
	subs r0, #0x12
	strh r0, [r2]
	ldrb r0, [r1]
	adds r0, #1
	b _080C9266
_080C9188:
	movs r0, #5
	bl PlaySE
	ldr r0, [r4]
	movs r1, #0xf2
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0x10
	strh r1, [r0]
	bl sub_080CF9DC
	bl ClearBottomWindow
	ldr r1, [r4]
	movs r0, #6
	b _080C9266
_080C91A8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C9268
	ldr r4, _080C91D0
	ldr r0, [r4]
	ldr r1, _080C91D4
	adds r0, r0, r1
	ldrb r0, [r0]
	bl AddWallpapersMenu
	movs r0, #3
	bl PrintStorageActionText
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	b _080C9266
	.align 2, 0
_080C91D0: .4byte 0x020399A8
_080C91D4: .4byte 0x0000078E
_080C91D8:
	bl sub_080CF94C
	ldr r4, _080C9204
	ldr r1, [r4]
	movs r5, #0xf2
	lsls r5, r5, #3
	adds r1, r1, r5
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080C9268
	adds r0, #1
	cmp r1, r0
	bne _080C9208
	bl ClearBottomWindow
	ldr r1, [r4]
	movs r0, #0
	b _080C9266
	.align 2, 0
_080C9204: .4byte 0x020399A8
_080C9208:
	movs r0, #5
	bl PlaySE
	bl ClearBottomWindow
	ldr r1, [r4]
	adds r1, r1, r5
	ldrh r0, [r1]
	subs r0, #0x17
	strh r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetWallpaperForCurrentBox
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	b _080C9266
_080C922C:
	bl DoWallpaperGfxChange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C9268
	movs r0, #1
	bl sub_080CCA24
_080C923C:
	ldr r0, _080C9244
	bl SetPSSCallback
	b _080C9268
	.align 2, 0
_080C9244: .4byte 0x080C7B49
_080C9248:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C9268
	ldr r4, _080C9270
	ldr r0, [r4]
	movs r1, #0xf2
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetWallpaperForCurrentBox
	ldr r1, [r4]
	movs r0, #5
_080C9266:
	strb r0, [r1]
_080C9268:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9270: .4byte 0x020399A8
	thumb_func_end Cb_HandleWallpapers

	thumb_func_start Cb_JumpBox
Cb_JumpBox: @ 0x080C9274
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _080C928C
	ldr r0, [r5]
	ldrb r4, [r0]
	cmp r4, #1
	beq _080C92C8
	cmp r4, #1
	bgt _080C9290
	cmp r4, #0
	beq _080C929A
	b _080C9354
	.align 2, 0
_080C928C: .4byte 0x020399A8
_080C9290:
	cmp r4, #2
	beq _080C9320
	cmp r4, #3
	beq _080C9338
	b _080C9354
_080C929A:
	movs r0, #5
	bl PrintStorageActionText
	ldr r0, [r5]
	ldr r1, _080C92C0
	adds r0, r0, r1
	ldr r2, _080C92C4
	str r4, [sp]
	movs r1, #0xa
	movs r3, #3
	bl sub_080C7080
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080C716C
	b _080C932A
	.align 2, 0
_080C92C0: .4byte 0x00001E5C
_080C92C4: .4byte 0x0000DAC7
_080C92C8:
	bl HandleBoxChooseSelectionInput
	ldr r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080C9318
	adds r1, r1, r2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xc8
	beq _080C9354
	bl ClearBottomWindow
	bl sub_080C717C
	bl sub_080C7128
	ldr r0, [r5]
	ldr r2, _080C9318
	adds r1, r0, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xc9
	beq _080C9308
	adds r4, r0, #0
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _080C932A
_080C9308:
	movs r0, #1
	bl sub_080CCA24
	ldr r0, _080C931C
	bl SetPSSCallback
	b _080C9354
	.align 2, 0
_080C9318: .4byte 0x000002CA
_080C931C: .4byte 0x080C7B49
_080C9320:
	ldr r1, _080C9334
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetUpScrollToBox
_080C932A:
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C9354
	.align 2, 0
_080C9334: .4byte 0x000002CA
_080C9338:
	bl ScrollToBox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C9354
	ldr r0, [r5]
	ldr r2, _080C935C
	adds r0, r0, r2
	ldrb r0, [r0]
	bl SetCurrentBox
	ldr r0, _080C9360
	bl SetPSSCallback
_080C9354:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C935C: .4byte 0x000002CA
_080C9360: .4byte 0x080C7B49
	thumb_func_end Cb_JumpBox

	thumb_func_start Cb_NameBox
Cb_NameBox: @ 0x080C9364
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _080C9378
	ldr r0, [r5]
	ldrb r4, [r0]
	cmp r4, #0
	beq _080C937C
	cmp r4, #1
	beq _080C939A
	b _080C93B4
	.align 2, 0
_080C9378: .4byte 0x020399A8
_080C937C:
	bl sub_080CDFDC
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C93B4
_080C939A:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C93B4
	ldr r0, _080C93BC
	strb r4, [r0]
	ldr r1, [r5]
	movs r0, #2
	strb r0, [r1, #2]
	ldr r0, _080C93C0
	bl SetPSSCallback
_080C93B4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C93BC: .4byte 0x020399AF
_080C93C0: .4byte 0x080C96ED
	thumb_func_end Cb_NameBox

	thumb_func_start Cb_ShowMonSummary
Cb_ShowMonSummary: @ 0x080C93C4
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _080C93D8
	ldr r0, [r5]
	ldrb r4, [r0]
	cmp r4, #0
	beq _080C93DC
	cmp r4, #1
	beq _080C93FA
	b _080C9414
	.align 2, 0
_080C93D8: .4byte 0x020399A8
_080C93DC:
	bl sub_080CE064
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C9414
_080C93FA:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080C9414
	ldr r0, _080C941C
	strb r1, [r0]
	ldr r0, [r5]
	strb r4, [r0, #2]
	ldr r0, _080C9420
	bl SetPSSCallback
_080C9414:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C941C: .4byte 0x020399AF
_080C9420: .4byte 0x080C96ED
	thumb_func_end Cb_ShowMonSummary

	thumb_func_start Cb_GiveItemFromBag
Cb_GiveItemFromBag: @ 0x080C9424
	push {r4, lr}
	sub sp, #4
	ldr r4, _080C9438
	ldr r0, [r4]
	ldrb r1, [r0]
	cmp r1, #0
	beq _080C943C
	cmp r1, #1
	beq _080C9456
	b _080C9472
	.align 2, 0
_080C9438: .4byte 0x020399A8
_080C943C:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C9472
_080C9456:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C9472
	ldr r1, _080C947C
	movs r0, #2
	strb r0, [r1]
	ldr r1, [r4]
	movs r0, #3
	strb r0, [r1, #2]
	ldr r0, _080C9480
	bl SetPSSCallback
_080C9472:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C947C: .4byte 0x020399AF
_080C9480: .4byte 0x080C96ED
	thumb_func_end Cb_GiveItemFromBag

	thumb_func_start Cb_OnCloseBoxPressed
Cb_OnCloseBoxPressed: @ 0x080C9484
	push {r4, lr}
	ldr r0, _080C949C
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #4
	bls _080C9492
	b _080C95A4
_080C9492:
	lsls r0, r0, #2
	ldr r1, _080C94A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C949C: .4byte 0x020399A8
_080C94A0: .4byte 0x080C94A4
_080C94A4: @ jump table
	.4byte _080C94B8 @ case 0
	.4byte _080C9514 @ case 1
	.4byte _080C9528 @ case 2
	.4byte _080C9564 @ case 3
	.4byte _080C9580 @ case 4
_080C94B8:
	bl GetBoxCursorPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C94DC
	movs r0, #0x20
	bl PlaySE
	movs r0, #0xf
	bl PrintStorageActionText
	ldr r0, _080C94D8
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1]
	b _080C95A4
	.align 2, 0
_080C94D8: .4byte 0x020399A8
_080C94DC:
	bl IsActiveItemMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C94F4
	ldr r0, _080C94F0
	bl SetPSSCallback
	b _080C95A4
	.align 2, 0
_080C94F0: .4byte 0x080C8DE9
_080C94F4:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl PrintStorageActionText
	movs r0, #0
	bl ShowYesNoWindow
	ldr r0, _080C9510
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1]
	b _080C95A4
	.align 2, 0
_080C9510: .4byte 0x020399A8
_080C9514:
	ldr r0, _080C9524
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C95A4
	b _080C9546
	.align 2, 0
_080C9524: .4byte 0x03002360
_080C9528:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080C9558
	cmp r1, #0
	bgt _080C9542
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080C9546
	b _080C95A4
_080C9542:
	cmp r1, #1
	bne _080C95A4
_080C9546:
	bl ClearBottomWindow
	ldr r0, _080C9554
	bl SetPSSCallback
	b _080C95A4
	.align 2, 0
_080C9554: .4byte 0x080C7B49
_080C9558:
	movs r0, #3
	bl PlaySE
	bl ClearBottomWindow
	b _080C956E
_080C9564:
	movs r0, #0x14
	movs r1, #0
	movs r2, #1
	bl sub_080FA464
_080C956E:
	ldr r0, _080C957C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C95A4
	.align 2, 0
_080C957C: .4byte 0x020399A8
_080C9580:
	bl FldEffPoison_IsActive
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080C95A4
	bl sub_080CA444
	bl CalculatePlayerPartyCount
	ldr r1, _080C95AC
	strb r0, [r1]
	ldr r0, _080C95B0
	ldr r0, [r0]
	strb r4, [r0, #2]
	ldr r0, _080C95B4
	bl SetPSSCallback
_080C95A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C95AC: .4byte 0x0202418D
_080C95B0: .4byte 0x020399A8
_080C95B4: .4byte 0x080C96ED
	thumb_func_end Cb_OnCloseBoxPressed

	thumb_func_start Cb_OnBPressed
Cb_OnBPressed: @ 0x080C95B8
	push {r4, lr}
	ldr r0, _080C95D0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #4
	bls _080C95C6
	b _080C96D8
_080C95C6:
	lsls r0, r0, #2
	ldr r1, _080C95D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C95D0: .4byte 0x020399A8
_080C95D4: .4byte 0x080C95D8
_080C95D8: @ jump table
	.4byte _080C95EC @ case 0
	.4byte _080C9648 @ case 1
	.4byte _080C965C @ case 2
	.4byte _080C9698 @ case 3
	.4byte _080C96B4 @ case 4
_080C95EC:
	bl GetBoxCursorPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C9610
	movs r0, #0x20
	bl PlaySE
	movs r0, #0xf
	bl PrintStorageActionText
	ldr r0, _080C960C
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1]
	b _080C96D8
	.align 2, 0
_080C960C: .4byte 0x020399A8
_080C9610:
	bl IsActiveItemMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C9628
	ldr r0, _080C9624
	bl SetPSSCallback
	b _080C96D8
	.align 2, 0
_080C9624: .4byte 0x080C8DE9
_080C9628:
	movs r0, #5
	bl PlaySE
	movs r0, #0x12
	bl PrintStorageActionText
	movs r0, #0
	bl ShowYesNoWindow
	ldr r0, _080C9644
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1]
	b _080C96D8
	.align 2, 0
_080C9644: .4byte 0x020399A8
_080C9648:
	ldr r0, _080C9658
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _080C96D8
	b _080C967C
	.align 2, 0
_080C9658: .4byte 0x03002360
_080C965C:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080C967C
	cmp r1, #0
	bgt _080C9676
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080C968C
	b _080C96D8
_080C9676:
	cmp r1, #1
	beq _080C968C
	b _080C96D8
_080C967C:
	bl ClearBottomWindow
	ldr r0, _080C9688
	bl SetPSSCallback
	b _080C96D8
	.align 2, 0
_080C9688: .4byte 0x080C7B49
_080C968C:
	movs r0, #3
	bl PlaySE
	bl ClearBottomWindow
	b _080C96A2
_080C9698:
	movs r0, #0x14
	movs r1, #0
	movs r2, #0
	bl sub_080FA464
_080C96A2:
	ldr r0, _080C96B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C96D8
	.align 2, 0
_080C96B0: .4byte 0x020399A8
_080C96B4:
	bl FldEffPoison_IsActive
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080C96D8
	bl sub_080CA444
	bl CalculatePlayerPartyCount
	ldr r1, _080C96E0
	strb r0, [r1]
	ldr r0, _080C96E4
	ldr r0, [r0]
	strb r4, [r0, #2]
	ldr r0, _080C96E8
	bl SetPSSCallback
_080C96D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C96E0: .4byte 0x0202418D
_080C96E4: .4byte 0x020399A8
_080C96E8: .4byte 0x080C96ED
	thumb_func_end Cb_OnBPressed

	thumb_func_start Cb_ChangeScreen
Cb_ChangeScreen: @ 0x080C96EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080C9718
	ldr r0, [r0]
	ldrb r4, [r0, #2]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080C9720
	bl IsActiveItemMoving
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080C9720
	bl GetMovingItem
	ldr r1, _080C971C
	b _080C9724
	.align 2, 0
_080C9718: .4byte 0x020399A8
_080C971C: .4byte 0x020399B2
_080C9720:
	ldr r1, _080C9744
	movs r0, #0
_080C9724:
	strh r0, [r1]
	cmp r4, #1
	beq _080C974C
	cmp r4, #1
	ble _080C9736
	cmp r4, #2
	beq _080C9790
	cmp r4, #3
	beq _080C97BC
_080C9736:
	bl FreePSSData
	ldr r0, _080C9748
	bl SetMainCallback2
	b _080C97CA
	.align 2, 0
_080C9744: .4byte 0x020399B2
_080C9748: .4byte 0x080C6F11
_080C974C:
	ldr r0, _080C9780
	ldr r1, [r0]
	ldr r2, _080C9784
	adds r0, r1, r2
	ldr r0, [r0]
	mov r8, r0
	subs r2, #5
	adds r0, r1, r2
	ldrb r6, [r0]
	subs r2, #1
	adds r0, r1, r2
	ldrb r5, [r0]
	ldr r0, _080C9788
	adds r1, r1, r0
	ldrb r4, [r1]
	bl FreePSSData
	ldr r0, _080C978C
	str r0, [sp]
	adds r0, r4, #0
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl ShowPokemonSummaryScreen
	b _080C97CA
	.align 2, 0
_080C9780: .4byte 0x020399A8
_080C9784: .4byte 0x0000218C
_080C9788: .4byte 0x00002188
_080C978C: .4byte 0x080C7689
_080C9790:
	bl FreePSSData
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBoxNamePtr
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _080C97B8
	str r0, [sp, #4]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl DoNamingScreen
	b _080C97CA
	.align 2, 0
_080C97B8: .4byte 0x080C7689
_080C97BC:
	bl FreePSSData
	ldr r2, _080C97DC
	movs r0, #0xb
	movs r1, #0
	bl GoToBagMenu
_080C97CA:
	adds r0, r7, #0
	bl DestroyTask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C97DC: .4byte 0x080C7689
	thumb_func_end Cb_ChangeScreen

	thumb_func_start GiveChosenBagItem
GiveChosenBagItem: @ 0x080C97E0
	push {lr}
	sub sp, #4
	ldr r0, _080C9814
	ldrh r1, [r0]
	mov r0, sp
	strh r1, [r0]
	cmp r1, #0
	beq _080C9834
	bl sub_080CF684
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080C9818
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C9820
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080C981C
	adds r0, r0, r1
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	b _080C982A
	.align 2, 0
_080C9814: .4byte 0x0203CB48
_080C9818: .4byte 0x020399AC
_080C981C: .4byte 0x02024190
_080C9820:
	adds r0, r1, #0
	movs r1, #0xc
	mov r2, sp
	bl SetCurrentBoxMonData
_080C982A:
	mov r0, sp
	ldrh r0, [r0]
	movs r1, #1
	bl RemoveBagItem
_080C9834:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GiveChosenBagItem

	thumb_func_start FreePSSData
FreePSSData: @ 0x080C983C
	push {r4, lr}
	bl sub_080D1E90
	bl sub_080CFA58
	ldr r4, _080C985C
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	bl FreeAllWindowBuffers
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C985C: .4byte 0x020399A8
	thumb_func_end FreePSSData

	thumb_func_start SetScrollingBackground
SetScrollingBackground: @ 0x080C9860
	push {lr}
	sub sp, #4
	ldr r1, _080C988C
	movs r0, #0xe
	bl SetGpuReg
	ldr r1, _080C9890
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, _080C9894
	ldr r1, _080C9898
	bl LZ77UnCompVram
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C988C: .4byte 0x00001F0F
_080C9890: .4byte 0x0854BBFC
_080C9894: .4byte 0x0854BC94
_080C9898: .4byte 0x0600F800
	thumb_func_end SetScrollingBackground

	thumb_func_start ScrollBackground
ScrollBackground: @ 0x080C989C
	push {lr}
	movs r0, #3
	movs r1, #0x80
	movs r2, #1
	bl ChangeBgX
	movs r0, #3
	movs r1, #0x80
	movs r2, #2
	bl ChangeBgY
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ScrollBackground

	thumb_func_start LoadPSSMenuGfx
LoadPSSMenuGfx: @ 0x080C98B8
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _080C9904
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r1, _080C9908
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, _080C990C
	ldr r5, _080C9910
	ldr r1, [r5]
	ldr r4, _080C9914
	adds r1, r1, r4
	bl LZ77UnCompWram
	ldr r1, [r5]
	adds r1, r1, r4
	movs r0, #1
	bl SetBgTilemapBuffer
	movs r0, #1
	bl ShowBg
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9904: .4byte 0x0854C9E4
_080C9908: .4byte 0x0854BF9C
_080C990C: .4byte 0x0854BDC0
_080C9910: .4byte 0x020399A8
_080C9914: .4byte 0x00005AC4
	thumb_func_end LoadPSSMenuGfx

	thumb_func_start InitPSSWindows
InitPSSWindows: @ 0x080C9918
	push {lr}
	ldr r0, _080C9930
	bl InitWindows
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080C9934
	bl DeactivateAllTextPrinters
	movs r0, #1
	b _080C9936
	.align 2, 0
_080C9930: .4byte 0x0854C9C4
_080C9934:
	movs r0, #0
_080C9936:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end InitPSSWindows

	thumb_func_start LoadWaveformSpritePalette
LoadWaveformSpritePalette: @ 0x080C993C
	push {lr}
	ldr r0, _080C9948
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_080C9948: .4byte 0x0854C9F4
	thumb_func_end LoadWaveformSpritePalette

	thumb_func_start sub_080C994C
sub_080C994C: @ 0x080C994C
	push {lr}
	ldr r0, _080C9984
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _080C9988
	movs r1, #0x20
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _080C998C
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _080C9990
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	beq _080C9998
	ldr r0, _080C9994
	movs r1, #0x30
	movs r2, #0x20
	bl LoadPalette
	b _080C99A2
	.align 2, 0
_080C9984: .4byte 0x0854BEFC
_080C9988: .4byte 0x0854BF1C
_080C998C: .4byte 0x0854C9A4
_080C9990: .4byte 0x020399A8
_080C9994: .4byte 0x0854BF5C
_080C9998:
	ldr r0, _080C99C0
	movs r1, #0x30
	movs r2, #0x20
	bl LoadPalette
_080C99A2:
	ldr r1, _080C99C4
	movs r0, #0xa
	bl SetGpuReg
	bl LoadCursorMonSprite
	bl sub_080C99C8
	bl sub_080C9A38
	bl RefreshCursorMonData
	pop {r0}
	bx r0
	.align 2, 0
_080C99C0: .4byte 0x0854BF7C
_080C99C4: .4byte 0x00001E05
	thumb_func_end sub_080C994C

	thumb_func_start sub_080C99C8
sub_080C99C8: @ 0x080C99C8
	push {r4, lr}
	ldr r1, _080C9A28
	movs r0, #0x10
	movs r2, #0
	bl sub_081204D4
	ldr r4, _080C9A2C
	ldr r1, [r4]
	ldr r3, _080C9A30
	adds r1, r1, r3
	str r0, [r1]
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r0, [r4]
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, #0x43
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r0, r3
	ldr r2, [r0]
	movs r1, #0x28
	strh r1, [r2, #0x20]
	ldr r1, [r0]
	movs r0, #0x96
	strh r0, [r1, #0x22]
	movs r0, #0x10
	bl GetSpriteTileStartByTag
	ldr r1, [r4]
	movs r2, #0xda
	lsls r2, r2, #4
	adds r1, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	ldr r2, _080C9A34
	adds r0, r0, r2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9A28: .4byte 0x0000DAC8
_080C9A2C: .4byte 0x020399A8
_080C9A30: .4byte 0x00000D94
_080C9A34: .4byte 0x06010000
	thumb_func_end sub_080C99C8

	thumb_func_start sub_080C9A38
sub_080C9A38: @ 0x080C9A38
	push {r4, lr}
	sub sp, #8
	ldr r0, _080C9A90
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r4, #0
_080C9A4E:
	lsls r1, r4, #6
	subs r1, r1, r4
	adds r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080C9A94
	movs r2, #9
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080C9A98
	ldr r2, [r1]
	lsls r1, r4, #2
	ldr r3, _080C9A9C
	adds r2, r2, r3
	adds r2, r2, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080C9AA0
	adds r1, r1, r0
	str r1, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	bls _080C9A4E
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9A90: .4byte 0x0854C9FC
_080C9A94: .4byte 0x0854CB6C
_080C9A98: .4byte 0x020399A8
_080C9A9C: .4byte 0x00000D98
_080C9AA0: .4byte 0x020205AC
	thumb_func_end sub_080C9A38

	thumb_func_start RefreshCursorMonData
RefreshCursorMonData: @ 0x080C9AA4
	push {lr}
	ldr r0, _080C9ACC
	ldr r1, [r0]
	ldr r2, _080C9AD0
	adds r0, r1, r2
	ldrh r0, [r0]
	subs r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	bl LoadCursorMonGfx
	bl PrintCursorMonInfo
	bl sub_080C9EC0
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r0}
	bx r0
	.align 2, 0
_080C9ACC: .4byte 0x020399A8
_080C9AD0: .4byte 0x00000CE4
	thumb_func_end RefreshCursorMonData

	thumb_func_start BoxSetMosaic
BoxSetMosaic: @ 0x080C9AD4
	push {lr}
	bl RefreshCursorMonData
	ldr r3, _080C9B24
	ldr r0, [r3]
	movs r1, #0x89
	lsls r1, r1, #6
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _080C9B20
	ldrb r0, [r2, #1]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, [r3]
	movs r0, #0x89
	lsls r0, r0, #6
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0xa
	strh r0, [r2, #0x2e]
	ldr r2, [r1]
	movs r0, #1
	strh r0, [r2, #0x30]
	ldr r2, [r1]
	ldr r0, _080C9B28
	str r0, [r2, #0x1c]
	ldr r0, [r1]
	ldrh r0, [r0, #0x2e]
	lsls r1, r0, #0xc
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x4c
	bl SetGpuReg
_080C9B20:
	pop {r0}
	bx r0
	.align 2, 0
_080C9B24: .4byte 0x020399A8
_080C9B28: .4byte 0x080C9B45
	thumb_func_end BoxSetMosaic

	thumb_func_start sub_080C9B2C
sub_080C9B2C: @ 0x080C9B2C
	ldr r0, _080C9B40
	ldr r0, [r0]
	movs r1, #0x89
	lsls r1, r1, #6
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_080C9B40: .4byte 0x020399A8
	thumb_func_end sub_080C9B2C

	thumb_func_start sub_080C9B44
sub_080C9B44: @ 0x080C9B44
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x30]
	subs r0, r0, r1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080C9B5A
	movs r0, #0
	strh r0, [r4, #0x2e]
_080C9B5A:
	ldrh r0, [r4, #0x2e]
	lsls r1, r0, #0xc
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x4c
	bl SetGpuReg
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080C9B82
	ldrb r0, [r4, #1]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #1]
	ldr r0, _080C9B88
	str r0, [r4, #0x1c]
_080C9B82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9B88: .4byte 0x08007141
	thumb_func_end sub_080C9B44

	thumb_func_start LoadCursorMonSprite
LoadCursorMonSprite: @ 0x080C9B8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r0, _080C9C20
	mov ip, r0
	ldr r1, [r0]
	ldr r4, _080C9C24
	adds r0, r1, r4
	str r0, [sp, #0x18]
	add r3, sp, #0x18
	movs r0, #0x82
	lsls r0, r0, #0xa
	str r0, [r3, #4]
	ldr r5, _080C9C28
	adds r1, r1, r5
	str r1, [sp, #0x20]
	ldr r0, _080C9C2C
	add r2, sp, #0x20
	str r0, [r2, #4]
	mov r1, sp
	ldr r0, _080C9C30
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	movs r6, #0
	adds r7, r2, #0
	mov r5, ip
	movs r2, #0
	ldr r1, _080C9C34
_080C9BC6:
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, r0, r6
	strb r2, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, r1
	bls _080C9BC6
	movs r6, #0
	ldr r5, _080C9C20
	ldr r4, _080C9C28
	movs r2, #0
_080C9BE0:
	ldr r0, [r5]
	lsls r1, r6, #1
	adds r0, r0, r4
	adds r0, r0, r1
	strh r2, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xf
	bls _080C9BE0
	ldr r0, _080C9C20
	ldr r0, [r0]
	movs r6, #0x89
	lsls r6, r6, #6
	adds r0, r0, r6
	movs r1, #0
	str r1, [r0]
	adds r0, r3, #0
	bl LoadSpriteSheet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080C9C94
	adds r0, r7, #0
	bl LoadSpritePalette
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xff
	beq _080C9C94
	b _080C9C80
	.align 2, 0
_080C9C20: .4byte 0x020399A8
_080C9C24: .4byte 0x000022C4
_080C9C28: .4byte 0x00002244
_080C9C2C: .4byte 0x0000DAC6
_080C9C30: .4byte 0x0854CA04
_080C9C34: .4byte 0x000007FF
_080C9C38:
	ldr r0, _080C9C6C
	ldr r2, [r0]
	movs r7, #0x89
	lsls r7, r7, #6
	adds r3, r2, r7
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080C9C70
	adds r0, r0, r1
	str r0, [r3]
	lsls r0, r4, #4
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r3, _080C9C74
	adds r1, r2, r3
	strh r0, [r1]
	ldr r6, _080C9C78
	adds r2, r2, r6
	lsls r0, r5, #5
	ldr r7, _080C9C7C
	adds r0, r0, r7
	str r0, [r2]
	b _080C9C94
	.align 2, 0
_080C9C6C: .4byte 0x020399A8
_080C9C70: .4byte 0x020205AC
_080C9C74: .4byte 0x0000223A
_080C9C78: .4byte 0x0000223C
_080C9C7C: .4byte 0x06010000
_080C9C80:
	mov r0, sp
	movs r1, #0x28
	movs r2, #0x30
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	bne _080C9C38
_080C9C94:
	ldr r0, _080C9CB8
	ldr r0, [r0]
	movs r1, #0x89
	lsls r1, r1, #6
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _080C9CB0
	movs r0, #2
	bl FreeSpriteTilesByTag
	ldr r0, _080C9CBC
	bl FreeSpritePaletteByTag
_080C9CB0:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C9CB8: .4byte 0x020399A8
_080C9CBC: .4byte 0x0000DAC6
	thumb_func_end LoadCursorMonSprite

	thumb_func_start LoadCursorMonGfx
LoadCursorMonGfx: @ 0x080C9CC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r6, _080C9D3C
	ldr r2, [r6]
	movs r7, #0x89
	lsls r7, r7, #6
	adds r0, r2, r7
	ldr r0, [r0]
	cmp r0, #0
	beq _080C9D66
	cmp r4, #0
	beq _080C9D5C
	lsls r0, r4, #3
	ldr r1, _080C9D40
	adds r0, r0, r1
	ldr r5, _080C9D44
	adds r1, r2, r5
	movs r2, #1
	str r2, [sp]
	adds r2, r4, #0
	bl LoadSpecialPokePic
	ldr r1, [r6]
	ldr r2, _080C9D48
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r4, _080C9D4C
	adds r1, r1, r4
	bl LZ77UnCompWram
	ldr r0, [r6]
	adds r5, r0, r5
	ldr r1, _080C9D50
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, _080C9D54
	adds r0, r5, #0
	bl CpuSet
	ldr r0, [r6]
	adds r4, r0, r4
	ldr r2, _080C9D58
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, [r6]
	adds r0, r0, r7
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	b _080C9D66
	.align 2, 0
_080C9D3C: .4byte 0x020399A8
_080C9D40: .4byte 0x082DDA1C
_080C9D44: .4byte 0x000022C4
_080C9D48: .4byte 0x00000CDC
_080C9D4C: .4byte 0x00002244
_080C9D50: .4byte 0x0000223C
_080C9D54: .4byte 0x04000200
_080C9D58: .4byte 0x0000223A
_080C9D5C:
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080C9D66:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadCursorMonGfx

	thumb_func_start PrintCursorMonInfo
PrintCursorMonInfo: @ 0x080C9D70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r6, _080C9DF0
	ldr r2, [r6]
	ldrb r0, [r2, #1]
	cmp r0, #3
	beq _080C9DFC
	movs r4, #0
	movs r5, #0
	mov r8, r6
_080C9D90:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080C9DF4
	adds r0, r0, r1
	mov r2, r8
	ldr r1, [r2]
	adds r2, r1, r0
	movs r3, #0
	cmp r4, #2
	bne _080C9DA8
	movs r3, #4
_080C9DA8:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r7, #0xff
	str r7, [sp, #4]
	movs r6, #0
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0xd
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r4, #2
	bls _080C9D90
	ldr r0, _080C9DF0
	ldr r2, [r0]
	ldr r0, _080C9DF8
	adds r2, r2, r0
	adds r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	b _080C9E52
	.align 2, 0
_080C9DF0: .4byte 0x020399A8
_080C9DF4: .4byte 0x00000CF9
_080C9DF8: .4byte 0x00000D65
_080C9DFC:
	ldr r1, _080C9E8C
	adds r2, r2, r1
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r4, #0
	movs r5, #0xf
_080C9E16:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r2, _080C9E90
	adds r0, r0, r2
	ldr r1, [r6]
	adds r2, r1, r0
	movs r3, #0
	cmp r4, #2
	bne _080C9E2C
	movs r3, #4
_080C9E2C:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0xd
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r4, #2
	bls _080C9E16
_080C9E52:
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	ldr r4, _080C9E94
	ldr r1, [r4]
	ldr r2, _080C9E98
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C9EA0
	adds r2, #7
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, #0xb5
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_081205A4
	ldr r0, [r4]
	ldr r1, _080C9E9C
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	b _080C9EAE
	.align 2, 0
_080C9E8C: .4byte 0x00000D65
_080C9E90: .4byte 0x00000CF9
_080C9E94: .4byte 0x020399A8
_080C9E98: .4byte 0x00000CE4
_080C9E9C: .4byte 0x00000D94
_080C9EA0:
	ldr r2, _080C9EBC
	adds r0, r1, r2
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
_080C9EAE:
	strb r0, [r1]
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C9EBC: .4byte 0x00000D94
	thumb_func_end PrintCursorMonInfo

	thumb_func_start sub_080C9EC0
sub_080C9EC0: @ 0x080C9EC0
	push {r4, lr}
	sub sp, #4
	ldr r0, _080C9F0C
	ldr r0, [r0]
	ldr r1, _080C9F10
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C9F18
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl sub_080D204C
	movs r4, #0
_080C9EE4:
	ldr r0, _080C9F0C
	ldr r0, [r0]
	lsls r1, r4, #2
	ldr r2, _080C9F14
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnimIfDifferent
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	bls _080C9EE4
	b _080C9F4A
	.align 2, 0
_080C9F0C: .4byte 0x020399A8
_080C9F10: .4byte 0x00000CE4
_080C9F14: .4byte 0x00000D98
_080C9F18:
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #2
	movs r3, #8
	bl sub_080D204C
	movs r4, #0
_080C9F2A:
	ldr r0, _080C9F60
	ldr r0, [r0]
	lsls r1, r4, #2
	ldr r2, _080C9F64
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r4, #0x19
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	bls _080C9F2A
_080C9F4A:
	movs r0, #0
	bl sub_080D21B8
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F60: .4byte 0x020399A8
_080C9F64: .4byte 0x00000D98
	thumb_func_end sub_080C9EC0

	thumb_func_start sub_080C9F68
sub_080C9F68: @ 0x080C9F68
	push {r4, lr}
	sub sp, #4
	ldr r0, _080C9FE0
	ldr r4, _080C9FE4
	ldr r1, [r4]
	adds r1, #0xb0
	bl LZ77UnCompWram
	ldr r0, _080C9FE8
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	ldr r2, [r4]
	adds r2, #0xb0
	movs r0, #0x16
	str r0, [sp]
	movs r0, #1
	movs r1, #1
	movs r3, #0xc
	bl sub_080D1EE4
	ldr r2, _080C9FEC
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	movs r1, #1
	movs r3, #9
	bl sub_080D1EE4
	movs r0, #1
	movs r1, #0xa
	movs r2, #0
	bl sub_080D2010
	movs r0, #2
	movs r1, #0x15
	movs r2, #0
	bl sub_080D2010
	bl sub_080CA2D8
	ldr r0, _080C9FF0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C9FF4
	movs r0, #1
	bl sub_080CA1E8
	movs r0, #1
	bl CreatePartyMonsSprites
	movs r0, #2
	bl sub_080D21B8
	movs r0, #1
	bl sub_080D21B8
	b _080CA016
	.align 2, 0
_080C9FE0: .4byte 0x0854C65C
_080C9FE4: .4byte 0x020399A8
_080C9FE8: .4byte 0x0854BF3C
_080C9FEC: .4byte 0x0854C70C
_080C9FF0: .4byte 0x020399AC
_080C9FF4:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x14
	movs r3, #0xc
	bl sub_080D204C
	movs r0, #1
	bl sub_080CA1E8
	movs r0, #1
	bl sub_080D21B8
	movs r0, #2
	bl sub_080D21B8
_080CA016:
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _080CA030
	ldr r0, [r0]
	ldr r1, _080CA034
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA030: .4byte 0x020399A8
_080CA034: .4byte 0x000002C7
	thumb_func_end sub_080C9F68

	thumb_func_start SetUpShowPartyMenu
SetUpShowPartyMenu: @ 0x080CA038
	push {lr}
	ldr r0, _080CA064
	ldr r1, [r0]
	movs r0, #0xb0
	lsls r0, r0, #2
	adds r2, r1, r0
	movs r3, #0
	movs r0, #0x14
	strh r0, [r2]
	ldr r0, _080CA068
	adds r2, r1, r0
	movs r0, #2
	strh r0, [r2]
	ldr r0, _080CA06C
	adds r1, r1, r0
	strb r3, [r1]
	movs r0, #0
	bl CreatePartyMonsSprites
	pop {r0}
	bx r0
	.align 2, 0
_080CA064: .4byte 0x020399A8
_080CA068: .4byte 0x000002C2
_080CA06C: .4byte 0x000002C5
	thumb_func_end SetUpShowPartyMenu

	thumb_func_start ShowPartyMenu
ShowPartyMenu: @ 0x080CA070
	push {r4, lr}
	ldr r4, _080CA0CC
	ldr r2, [r4]
	ldr r1, _080CA0D0
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _080CA0DE
	movs r0, #0xb0
	lsls r0, r0, #2
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r0, _080CA0D4
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl sub_080D2094
	movs r0, #1
	bl sub_080D21B8
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #8
	bl sub_080CB364
	ldr r1, [r4]
	ldr r0, _080CA0D0
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	beq _080CA0D8
	movs r0, #1
	b _080CA0E0
	.align 2, 0
_080CA0CC: .4byte 0x020399A8
_080CA0D0: .4byte 0x000002C5
_080CA0D4: .4byte 0x000002C2
_080CA0D8:
	ldr r1, _080CA0E8
	movs r0, #1
	strb r0, [r1]
_080CA0DE:
	movs r0, #0
_080CA0E0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080CA0E8: .4byte 0x020399AC
	thumb_func_end ShowPartyMenu

	thumb_func_start SetUpHidePartyMenu
SetUpHidePartyMenu: @ 0x080CA0EC
	push {r4, lr}
	ldr r4, _080CA120
	ldr r1, [r4]
	movs r0, #0xb0
	lsls r0, r0, #2
	adds r2, r1, r0
	movs r3, #0
	movs r0, #0
	strh r0, [r2]
	ldr r0, _080CA124
	adds r2, r1, r0
	movs r0, #0x16
	strh r0, [r2]
	ldr r0, _080CA128
	adds r1, r1, r0
	strb r3, [r1]
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080CA118
	bl sub_080D0A6C
_080CA118:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA120: .4byte 0x020399A8
_080CA124: .4byte 0x000002C2
_080CA128: .4byte 0x000002C5
	thumb_func_end SetUpHidePartyMenu

	thumb_func_start HidePartyMenu
HidePartyMenu: @ 0x080CA12C
	push {r4, r5, lr}
	sub sp, #8
	ldr r5, _080CA1A4
	ldr r2, [r5]
	ldr r1, _080CA1A8
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _080CA1D8
	movs r0, #0xb0
	lsls r0, r0, #2
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r4, _080CA1AC
	adds r1, r2, r4
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #1
	movs r1, #3
	bl sub_080D2094
	movs r0, #1
	bl sub_080D21B8
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r3, [r0]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r2, #0xa
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #8
	rsbs r0, r0, #0
	bl sub_080CB364
	ldr r1, [r5]
	ldr r0, _080CA1A8
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	beq _080CA1B0
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	b _080CA1DA
	.align 2, 0
_080CA1A4: .4byte 0x020399A8
_080CA1A8: .4byte 0x000002C5
_080CA1AC: .4byte 0x000002C2
_080CA1B0:
	ldr r0, _080CA1E4
	movs r1, #0
	strb r1, [r0]
	bl DestroyAllPartyMonIcons
	bl CompactPartySlots
	movs r0, #2
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #9
	bl sub_080D204C
	movs r0, #2
	bl sub_080D21B8
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
_080CA1D8:
	movs r0, #0
_080CA1DA:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080CA1E4: .4byte 0x020399AC
	thumb_func_end HidePartyMenu

	thumb_func_start sub_080CA1E8
sub_080CA1E8: @ 0x080CA1E8
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CA202
	movs r0, #2
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #9
	bl sub_080D204C
	b _080CA210
_080CA202:
	movs r0, #2
	str r0, [sp]
	movs r1, #0
	movs r2, #2
	movs r3, #9
	bl sub_080D204C
_080CA210:
	movs r0, #2
	bl sub_080D21B8
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CA1E8

	thumb_func_start sub_080CA224
sub_080CA224: @ 0x080CA224
	ldr r2, _080CA244
	ldr r0, [r2]
	ldr r1, _080CA248
	adds r0, r0, r1
	movs r3, #1
	strb r3, [r0]
	ldr r0, [r2]
	adds r1, #1
	adds r0, r0, r1
	movs r1, #0x1e
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _080CA24C
	adds r0, r0, r1
	strb r3, [r0]
	bx lr
	.align 2, 0
_080CA244: .4byte 0x020399A8
_080CA248: .4byte 0x000002C7
_080CA24C: .4byte 0x000002C9
	thumb_func_end sub_080CA224

	thumb_func_start sub_080CA250
sub_080CA250: @ 0x080CA250
	push {lr}
	ldr r0, _080CA270
	ldr r0, [r0]
	ldr r2, _080CA274
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CA26A
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	bl sub_080CA1E8
_080CA26A:
	pop {r0}
	bx r0
	.align 2, 0
_080CA270: .4byte 0x020399A8
_080CA274: .4byte 0x000002C7
	thumb_func_end sub_080CA250

	thumb_func_start sub_080CA278
sub_080CA278: @ 0x080CA278
	push {r4, lr}
	ldr r3, _080CA2CC
	ldr r1, [r3]
	ldr r2, _080CA2D0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA2C4
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bls _080CA2C4
	ldr r0, [r3]
	movs r1, #0xb2
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r3]
	movs r2, #0
	ldr r4, _080CA2D4
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _080CA2B8
	movs r2, #1
_080CA2B8:
	strb r2, [r1]
	ldr r0, [r3]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_080CA1E8
_080CA2C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA2CC: .4byte 0x020399A8
_080CA2D0: .4byte 0x000002C7
_080CA2D4: .4byte 0x000002C9
	thumb_func_end sub_080CA278

	thumb_func_start sub_080CA2D8
sub_080CA2D8: @ 0x080CA2D8
	push {r4, lr}
	movs r4, #1
_080CA2DC:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _080CA308
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	adds r0, r4, #0
	bl sub_080CA30C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _080CA2DC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA308: .4byte 0x02024190
	thumb_func_end sub_080CA2D8

	thumb_func_start sub_080CA30C
sub_080CA30C: @ 0x080CA30C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r7, _080CA378
	cmp r1, #0
	beq _080CA31C
	ldr r7, _080CA37C
_080CA31C:
	subs r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x12
	movs r1, #0xe0
	lsls r1, r1, #0xb
	adds r0, r0, r1
	lsrs r3, r0, #0x10
	movs r0, #0
	ldr r1, _080CA380
	mov ip, r1
_080CA338:
	movs r2, #0
	adds r4, r7, #0
	adds r4, #8
	adds r5, r3, #0
	adds r5, #0xc
	adds r6, r0, #1
_080CA344:
	mov r0, ip
	ldr r1, [r0]
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r1, #0xb0
	adds r1, r1, r0
	lsls r0, r2, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #3
	bls _080CA344
	adds r7, r4, #0
	lsls r0, r5, #0x10
	lsrs r3, r0, #0x10
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080CA338
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CA378: .4byte 0x0854C76C
_080CA37C: .4byte 0x0854C754
_080CA380: .4byte 0x020399A8
	thumb_func_end sub_080CA30C

	thumb_func_start sub_080CA384
sub_080CA384: @ 0x080CA384
	push {lr}
	sub sp, #4
	bl sub_080CA2D8
	movs r0, #0x16
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0xc
	bl sub_080D204C
	movs r0, #1
	bl sub_080D21B8
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CA384

	thumb_func_start SetUpDoShowPartyMenu
SetUpDoShowPartyMenu: @ 0x080CA3B0
	push {lr}
	ldr r0, _080CA3CC
	ldr r0, [r0]
	ldr r1, _080CA3D0
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #6
	bl PlaySE
	bl SetUpShowPartyMenu
	pop {r0}
	bx r0
	.align 2, 0
_080CA3CC: .4byte 0x020399A8
_080CA3D0: .4byte 0x000002C6
	thumb_func_end SetUpDoShowPartyMenu

	thumb_func_start DoShowPartyMenu
DoShowPartyMenu: @ 0x080CA3D4
	push {r4, r5, lr}
	ldr r4, _080CA3F0
	ldr r0, [r4]
	ldr r5, _080CA3F4
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CA40E
	cmp r0, #1
	bgt _080CA3F8
	cmp r0, #0
	beq _080CA3FE
	b _080CA43C
	.align 2, 0
_080CA3F0: .4byte 0x020399A8
_080CA3F4: .4byte 0x000002C6
_080CA3F8:
	cmp r0, #2
	beq _080CA438
	b _080CA43C
_080CA3FE:
	bl ShowPartyMenu
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CA43C
	bl sub_080CD41C
	b _080CA428
_080CA40E:
	bl sub_080CCDD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CA43C
	ldr r0, [r4]
	ldr r1, _080CA434
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA428
	bl BoxSetMosaic
_080CA428:
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080CA43C
	.align 2, 0
_080CA434: .4byte 0x00000CEA
_080CA438:
	movs r0, #0
	b _080CA43E
_080CA43C:
	movs r0, #1
_080CA43E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end DoShowPartyMenu

	thumb_func_start sub_080CA444
sub_080CA444: @ 0x080CA444
	push {r4, lr}
	ldr r4, _080CA474
	bl StorageGetCurrentBox
	ldrb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _080CA46E
	ldr r0, _080CA478
	bl FlagClear
	ldr r4, _080CA47C
	bl StorageGetCurrentBox
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl VarSet
_080CA46E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA474: .4byte 0x020399B0
_080CA478: .4byte 0x000008D7
_080CA47C: .4byte 0x00004036
	thumb_func_end sub_080CA444

	thumb_func_start sub_080CA480
sub_080CA480: @ 0x080CA480
	push {lr}
	sub sp, #0xc
	movs r1, #0xe8
	lsls r1, r1, #5
	movs r0, #8
	bl SetGpuReg
	movs r0, #1
	movs r1, #2
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r0}
	bx r0
	thumb_func_end sub_080CA480

	thumb_func_start PrintStorageActionText
PrintStorageActionText: @ 0x080CA4BC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl DynamicPlaceholderTextUtil_Reset
	ldr r1, _080CA4E0
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	cmp r0, #7
	bhi _080CA594
	lsls r0, r0, #2
	ldr r1, _080CA4E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA4E0: .4byte 0x0854CA1C
_080CA4E4: .4byte 0x080CA4E8
_080CA4E8: @ jump table
	.4byte _080CA594 @ case 0
	.4byte _080CA508 @ case 1
	.4byte _080CA508 @ case 2
	.4byte _080CA508 @ case 3
	.4byte _080CA51C @ case 4
	.4byte _080CA51C @ case 5
	.4byte _080CA51C @ case 6
	.4byte _080CA534 @ case 7
_080CA508:
	ldr r0, _080CA514
	ldr r1, [r0]
	ldr r0, _080CA518
	adds r1, r1, r0
	b _080CA524
	.align 2, 0
_080CA514: .4byte 0x020399A8
_080CA518: .4byte 0x00000CEE
_080CA51C:
	ldr r0, _080CA52C
	ldr r1, [r0]
	ldr r2, _080CA530
	adds r1, r1, r2
_080CA524:
	movs r0, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	b _080CA594
	.align 2, 0
_080CA52C: .4byte 0x020399A8
_080CA530: .4byte 0x000021E0
_080CA534:
	bl IsActiveItemMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CA558
	ldr r0, _080CA550
	ldr r4, [r0]
	ldr r0, _080CA554
	adds r4, r4, r0
	bl GetMovingItemName
	adds r1, r0, #0
	adds r0, r4, #0
	b _080CA564
	.align 2, 0
_080CA550: .4byte 0x020399A8
_080CA554: .4byte 0x000021EB
_080CA558:
	ldr r0, _080CA56C
	ldr r1, [r0]
	ldr r2, _080CA570
	adds r0, r1, r2
	ldr r2, _080CA574
	adds r1, r1, r2
_080CA564:
	bl StringCopy
	adds r2, r0, #0
	b _080CA57A
	.align 2, 0
_080CA56C: .4byte 0x020399A8
_080CA570: .4byte 0x000021EB
_080CA574: .4byte 0x00000D65
_080CA578:
	adds r2, r1, #0
_080CA57A:
	subs r1, r2, #1
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CA578
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _080CA5F0
	ldr r1, [r0]
	ldr r0, _080CA5F4
	adds r1, r1, r0
	movs r0, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
_080CA594:
	ldr r5, _080CA5F0
	ldr r0, [r5]
	ldr r4, _080CA5F8
	adds r0, r0, r4
	ldr r2, _080CA5FC
	lsls r1, r6, #3
	adds r1, r1, r2
	ldr r1, [r1]
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	movs r0, #1
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, [r5]
	adds r2, r2, r4
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #1
	movs r1, #2
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA5F0: .4byte 0x020399A8
_080CA5F4: .4byte 0x000021EB
_080CA5F8: .4byte 0x00002190
_080CA5FC: .4byte 0x0854CA1C
	thumb_func_end PrintStorageActionText

	thumb_func_start ShowYesNoWindow
ShowYesNoWindow: @ 0x080CA600
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080CA634
	movs r1, #0xb
	str r1, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl sub_08198C08
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, r4, #0
	bl Menu_MoveCursorNoWrapAround
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA634: .4byte 0x0854CB14
	thumb_func_end ShowYesNoWindow

	thumb_func_start ClearBottomWindow
ClearBottomWindow: @ 0x080CA638
	push {lr}
	movs r0, #1
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r0}
	bx r0
	thumb_func_end ClearBottomWindow

	thumb_func_start AddWallpaperSetsMenu
AddWallpaperSetsMenu: @ 0x080CA64C
	push {lr}
	bl InitMenu
	movs r0, #0x12
	bl SetMenuText
	movs r0, #0x13
	bl SetMenuText
	movs r0, #0x14
	bl SetMenuText
	movs r0, #0x15
	bl SetMenuText
	bl IsWaldaWallpaperUnlocked
	cmp r0, #0
	beq _080CA678
	movs r0, #0x16
	bl SetMenuText
_080CA678:
	bl AddMenu
	pop {r0}
	bx r0
	thumb_func_end AddWallpaperSetsMenu

	thumb_func_start AddWallpapersMenu
AddWallpapersMenu: @ 0x080CA680
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl InitMenu
	cmp r4, #1
	beq _080CA6BE
	cmp r4, #1
	bgt _080CA69A
	cmp r4, #0
	beq _080CA6A4
	b _080CA70A
_080CA69A:
	cmp r5, #2
	beq _080CA6D8
	cmp r5, #3
	beq _080CA6F2
	b _080CA70A
_080CA6A4:
	movs r0, #0x17
	bl SetMenuText
	movs r0, #0x18
	bl SetMenuText
	movs r0, #0x19
	bl SetMenuText
	movs r0, #0x1a
	bl SetMenuText
	b _080CA70A
_080CA6BE:
	movs r0, #0x1b
	bl SetMenuText
	movs r0, #0x1c
	bl SetMenuText
	movs r0, #0x1d
	bl SetMenuText
	movs r0, #0x1e
	bl SetMenuText
	b _080CA70A
_080CA6D8:
	movs r0, #0x1f
	bl SetMenuText
	movs r0, #0x20
	bl SetMenuText
	movs r0, #0x21
	bl SetMenuText
	movs r0, #0x22
	bl SetMenuText
	b _080CA70A
_080CA6F2:
	movs r0, #0x23
	bl SetMenuText
	movs r0, #0x24
	bl SetMenuText
	movs r0, #0x25
	bl SetMenuText
	movs r0, #0x26
	bl SetMenuText
_080CA70A:
	bl AddMenu
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AddWallpapersMenu

	thumb_func_start GetCurrentBoxOption
GetCurrentBoxOption: @ 0x080CA714
	ldr r0, _080CA71C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080CA71C: .4byte 0x020399AD
	thumb_func_end GetCurrentBoxOption

	thumb_func_start sub_080CA720
sub_080CA720: @ 0x080CA720
	push {lr}
	bl IsCursorOnBox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CA75C
	ldr r0, _080CA748
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA74C
	bl sub_080CF684
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	bl sub_080D062C
	b _080CA75C
	.align 2, 0
_080CA748: .4byte 0x020399AC
_080CA74C:
	bl sub_080CF684
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_080D062C
_080CA75C:
	ldr r1, _080CA774
	ldrh r0, [r1]
	cmp r0, #0
	beq _080CA76E
	bl sub_080D07D8
	movs r0, #3
	bl sub_080CF6D0
_080CA76E:
	pop {r0}
	bx r0
	.align 2, 0
_080CA774: .4byte 0x020399B2
	thumb_func_end sub_080CA720

	thumb_func_start sub_080CA778
sub_080CA778: @ 0x080CA778
	push {r4, r5, r6, lr}
	bl LoadMonIconPalettes
	movs r2, #0
	ldr r3, _080CA808
	ldr r5, _080CA80C
	movs r4, #0
	adds r6, r3, #0
_080CA788:
	ldr r0, [r3]
	lsls r1, r2, #1
	adds r0, r0, r5
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x27
	bls _080CA788
	movs r2, #0
	ldr r5, _080CA808
	ldr r4, _080CA810
	movs r3, #0
_080CA7A4:
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r0, r0, r4
	adds r0, r0, r1
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x27
	bls _080CA7A4
	movs r2, #0
	ldr r5, _080CA808
	movs r4, #0xa7
	lsls r4, r4, #4
	movs r3, #0
_080CA7C2:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r4
	adds r0, r0, r1
	str r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #5
	bls _080CA7C2
	movs r2, #0
	ldr r5, _080CA808
	ldr r4, _080CA814
	movs r3, #0
_080CA7DE:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r4
	adds r0, r0, r1
	str r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1d
	bls _080CA7DE
	ldr r0, [r6]
	ldr r2, _080CA818
	adds r1, r0, r2
	movs r2, #0
	str r2, [r1]
	ldr r1, _080CA81C
	adds r0, r0, r1
	strh r2, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA808: .4byte 0x020399A8
_080CA80C: .4byte 0x00000B08
_080CA810: .4byte 0x00000B58
_080CA814: .4byte 0x00000A88
_080CA818: .4byte 0x00000A6C
_080CA81C: .4byte 0x0000078C
	thumb_func_end sub_080CA778

	thumb_func_start sub_080CA820
sub_080CA820: @ 0x080CA820
	push {lr}
	bl IsCursorInBox
	lsls r0, r0, #0x18
	movs r1, #1
	cmp r0, #0
	beq _080CA830
	movs r1, #2
_080CA830:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CA820

	thumb_func_start CreateMovingMonIcon
CreateMovingMonIcon: @ 0x080CA838
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _080CA88C
	ldr r0, [r5]
	ldr r4, _080CA890
	adds r0, r0, r4
	movs r1, #0
	bl GetMonData
	adds r6, r0, #0
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #0x41
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_080CA820
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl sub_080CBAA4
	ldr r1, [r5]
	ldr r2, _080CA894
	adds r1, r1, r2
	str r0, [r1]
	ldr r1, _080CA898
	str r1, [r0, #0x1c]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA88C: .4byte 0x020399A8
_080CA890: .4byte 0x000020A4
_080CA894: .4byte 0x00000A6C
_080CA898: .4byte 0x080CB975
	thumb_func_end CreateMovingMonIcon

	thumb_func_start sub_080CA89C
sub_080CA89C: @ 0x080CA89C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	movs r7, #0
_080CA8B6:
	movs r5, #0
	adds r1, r7, #1
	mov sl, r1
_080CA8BC:
	mov r0, sb
	adds r1, r6, #0
	movs r2, #0x41
	bl GetBoxMonDataAt
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080CA924
	mov r0, sb
	adds r1, r6, #0
	movs r2, #0
	bl GetBoxMonDataAt
	adds r1, r0, #0
	lsls r2, r5, #1
	adds r2, r2, r5
	lsls r2, r2, #0x13
	movs r3, #0xc8
	lsls r3, r3, #0xf
	adds r2, r2, r3
	asrs r2, r2, #0x10
	lsls r3, r7, #1
	adds r3, r3, r7
	lsls r3, r3, #0x13
	movs r0, #0xb0
	lsls r0, r0, #0xe
	adds r3, r3, r0
	movs r0, #2
	str r0, [sp]
	movs r0, #0x13
	subs r0, r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	asrs r3, r3, #0x10
	bl sub_080CBAA4
	ldr r1, _080CA91C
	ldr r1, [r1]
	mov r3, r8
	lsls r2, r3, #2
	ldr r3, _080CA920
	adds r1, r1, r3
	adds r1, r1, r2
	str r0, [r1]
	b _080CA934
	.align 2, 0
_080CA91C: .4byte 0x020399A8
_080CA920: .4byte 0x00000A88
_080CA924:
	ldr r0, _080CA9AC
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, #2
	ldr r3, _080CA9B0
	adds r0, r0, r3
	adds r0, r0, r1
	str r4, [r0]
_080CA934:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #5
	bls _080CA8BC
	mov r1, sl
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #4
	bls _080CA8B6
	ldr r0, _080CA9AC
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080CA99A
	movs r6, #0
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r4, r2, #0
_080CA96A:
	mov r0, sb
	adds r1, r6, #0
	movs r2, #0xc
	bl GetBoxMonDataAt
	cmp r0, #0
	bne _080CA990
	ldr r0, _080CA9AC
	ldr r0, [r0]
	lsls r1, r6, #2
	ldr r3, _080CA9B0
	adds r0, r0, r3
	adds r0, r0, r1
	ldr r2, [r0]
	ldrb r0, [r2, #1]
	ands r0, r4
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #1]
_080CA990:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x1d
	bls _080CA96A
_080CA99A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CA9AC: .4byte 0x020399A8
_080CA9B0: .4byte 0x00000A88
	thumb_func_end sub_080CA89C

	thumb_func_start sub_080CA9B4
sub_080CA9B4: @ 0x080CA9B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r7, #0
	movs r1, #0x41
	bl GetCurrentBoxMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0
	beq _080CAA4E
	adds r0, r7, #0
	movs r1, #6
	bl __umodsi3
	adds r6, r0, #0
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	lsls r5, r0, #1
	adds r5, r5, r0
	lsls r5, r5, #0x13
	movs r0, #0xc8
	lsls r0, r0, #0xf
	adds r5, r5, r0
	lsrs r5, r5, #0x10
	adds r0, r7, #0
	movs r1, #6
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #0x13
	movs r0, #0xb0
	lsls r0, r0, #0xe
	adds r4, r4, r0
	lsrs r4, r4, #0x10
	adds r0, r7, #0
	movs r1, #0
	bl GetCurrentBoxMonData
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0x13
	subs r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_080CBAA4
	adds r3, r0, #0
	ldr r0, _080CAA5C
	ldr r2, [r0]
	lsls r1, r7, #2
	ldr r4, _080CAA60
	adds r0, r2, r4
	adds r0, r0, r1
	str r3, [r0]
	ldrb r0, [r2, #1]
	cmp r0, #3
	bne _080CAA4E
	ldrb r0, [r3, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r3, #1]
_080CAA4E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CAA5C: .4byte 0x020399A8
_080CAA60: .4byte 0x00000A88
	thumb_func_end sub_080CA9B4

	thumb_func_start sub_080CAA64
sub_080CAA64: @ 0x080CAA64
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r7, _080CAA9C
	ldr r6, _080CAAA0
	movs r5, #1
	ldr r4, _080CAAA4
_080CAA74:
	ldr r0, [r7]
	lsls r1, r2, #2
	adds r0, r0, r6
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _080CAA8C
	strh r3, [r0, #0x32]
	ldr r0, [r1]
	strh r5, [r0, #0x36]
	ldr r0, [r1]
	str r4, [r0, #0x1c]
_080CAA8C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1d
	bls _080CAA74
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CAA9C: .4byte 0x020399A8
_080CAAA0: .4byte 0x00000A88
_080CAAA4: .4byte 0x080CAAED
	thumb_func_end sub_080CAA64

	thumb_func_start sub_080CAAA8
sub_080CAAA8: @ 0x080CAAA8
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x30]
	movs r3, #0x30
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _080CAAC4
	subs r0, r1, #1
	strh r0, [r2, #0x30]
	ldrh r0, [r2, #0x32]
	ldrh r1, [r2, #0x20]
	adds r0, r0, r1
	strh r0, [r2, #0x20]
	b _080CAADA
_080CAAC4:
	ldr r0, _080CAAE0
	ldr r1, [r0]
	ldr r3, _080CAAE4
	adds r1, r1, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldrh r0, [r2, #0x34]
	strh r0, [r2, #0x20]
	ldr r0, _080CAAE8
	str r0, [r2, #0x1c]
_080CAADA:
	pop {r0}
	bx r0
	.align 2, 0
_080CAAE0: .4byte 0x020399A8
_080CAAE4: .4byte 0x00000C66
_080CAAE8: .4byte 0x08007141
	thumb_func_end sub_080CAAA8

	thumb_func_start sub_080CAAEC
sub_080CAAEC: @ 0x080CAAEC
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x36]
	movs r3, #0x36
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _080CAB00
	subs r0, r1, #1
	strh r0, [r2, #0x36]
	b _080CAB1C
_080CAB00:
	ldrh r0, [r2, #0x32]
	ldrh r1, [r2, #0x20]
	adds r0, r0, r1
	strh r0, [r2, #0x20]
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x38]
	subs r0, #0x45
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb6
	bls _080CAB1C
	ldr r0, _080CAB20
	str r0, [r2, #0x1c]
_080CAB1C:
	pop {r0}
	bx r0
	.align 2, 0
_080CAB20: .4byte 0x08007141
	thumb_func_end sub_080CAAEC

	thumb_func_start DestroyAllIconsInRow
DestroyAllIconsInRow: @ 0x080CAB24
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	ldr r7, _080CAB64
_080CAB2E:
	ldr r0, [r7]
	lsls r4, r5, #2
	ldr r1, _080CAB68
	adds r0, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080CAB4E
	bl DestroyBoxMonIcon
	ldr r0, [r7]
	ldr r1, _080CAB68
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_080CAB4E:
	adds r0, r5, #6
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #4
	bls _080CAB2E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CAB64: .4byte 0x020399A8
_080CAB68: .4byte 0x00000A88
	thumb_func_end DestroyAllIconsInRow

	thumb_func_start sub_080CAB6C
sub_080CAB6C: @ 0x080CAB6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	lsls r2, r2, #0x10
	movs r1, #0x2c
	mov r8, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x13
	movs r3, #0xc8
	lsls r3, r3, #0xf
	adds r1, r1, r3
	lsrs r1, r1, #0x10
	str r1, [sp, #0x10]
	ldr r1, [sp, #8]
	adds r1, #1
	lsrs r6, r2, #0x10
	str r6, [sp, #0xc]
	asrs r2, r2, #0x10
	muls r1, r2, r1
	ldr r2, [sp, #0x10]
	subs r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r1, #0x13
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	movs r3, #0
	mov sb, r3
	adds r5, r0, #0
	ldr r1, _080CAC50
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	cmp r0, #3
	beq _080CAC64
	movs r7, #4
	lsls r2, r2, #0x10
	mov sl, r2
_080CABCC:
	ldr r6, _080CAC50
	ldr r2, [r6]
	lsls r0, r5, #1
	ldr r3, _080CAC54
	adds r1, r2, r3
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080CAC36
	lsls r4, r5, #2
	ldr r6, _080CAC58
	adds r1, r2, r6
	adds r1, r1, r4
	ldr r1, [r1]
	mov r2, r8
	lsls r3, r2, #0x10
	asrs r3, r3, #0x10
	movs r2, #2
	str r2, [sp]
	ldr r6, [sp, #0x14]
	str r6, [sp, #4]
	mov r6, sl
	asrs r2, r6, #0x10
	bl sub_080CBAA4
	adds r2, r0, #0
	ldr r1, _080CAC50
	ldr r0, [r1]
	ldr r3, _080CAC5C
	adds r0, r0, r3
	adds r1, r0, r4
	str r2, [r1]
	cmp r2, #0
	beq _080CAC36
	mov r6, sp
	ldrh r6, [r6, #8]
	strh r6, [r2, #0x30]
	ldr r0, [r1]
	mov r2, sp
	ldrh r2, [r2, #0xc]
	strh r2, [r0, #0x32]
	ldr r0, [r1]
	mov r3, sp
	ldrh r3, [r3, #0x10]
	strh r3, [r0, #0x34]
	ldr r1, [r1]
	ldr r0, _080CAC60
	str r0, [r1, #0x1c]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_080CAC36:
	adds r0, r5, #6
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, r8
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	subs r7, #1
	cmp r7, #0
	bge _080CABCC
	b _080CAD1A
	.align 2, 0
_080CAC50: .4byte 0x020399A8
_080CAC54: .4byte 0x00000BA8
_080CAC58: .4byte 0x00000BE4
_080CAC5C: .4byte 0x00000A88
_080CAC60: .4byte 0x080CAAA9
_080CAC64:
	mov sl, r1
	movs r7, #4
	lsls r2, r2, #0x10
	str r2, [sp, #0x18]
_080CAC6C:
	mov r6, sl
	ldr r2, [r6]
	lsls r0, r5, #1
	ldr r3, _080CAD2C
	adds r1, r2, r3
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080CAD04
	lsls r4, r5, #2
	ldr r6, _080CAD30
	adds r1, r2, r6
	adds r1, r1, r4
	ldr r1, [r1]
	mov r2, r8
	lsls r3, r2, #0x10
	asrs r3, r3, #0x10
	movs r2, #2
	str r2, [sp]
	ldr r6, [sp, #0x14]
	str r6, [sp, #4]
	ldr r6, [sp, #0x18]
	asrs r2, r6, #0x10
	bl sub_080CBAA4
	adds r2, r0, #0
	mov r0, sl
	ldr r3, [r0]
	ldr r1, _080CAD34
	adds r0, r3, r1
	adds r1, r0, r4
	str r2, [r1]
	cmp r2, #0
	beq _080CAD04
	mov r6, sp
	ldrh r6, [r6, #8]
	strh r6, [r2, #0x30]
	ldr r0, [r1]
	mov r2, sp
	ldrh r2, [r2, #0xc]
	strh r2, [r0, #0x32]
	ldr r0, [r1]
	mov r6, sp
	ldrh r6, [r6, #0x10]
	strh r6, [r0, #0x34]
	ldr r1, [r1]
	ldr r0, _080CAD38
	str r0, [r1, #0x1c]
	ldr r1, _080CAD3C
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	movs r2, #0xc
	bl GetBoxMonDataAt
	cmp r0, #0
	bne _080CACFA
	mov r2, sl
	ldr r0, [r2]
	ldr r3, _080CAD34
	adds r0, r0, r3
	adds r0, r0, r4
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	movs r6, #0xd
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r2, #1]
_080CACFA:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_080CAD04:
	adds r0, r5, #6
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, r8
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	subs r7, #1
	cmp r7, #0
	bge _080CAC6C
_080CAD1A:
	mov r0, sb
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CAD2C: .4byte 0x00000BA8
_080CAD30: .4byte 0x00000BE4
_080CAD34: .4byte 0x00000A88
_080CAD38: .4byte 0x080CAAA9
_080CAD3C: .4byte 0x00000C5C
	thumb_func_end sub_080CAB6C

	thumb_func_start sub_080CAD40
sub_080CAD40: @ 0x080CAD40
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _080CADA0
	ldr r1, [r6]
	ldr r2, _080CADA4
	adds r1, r1, r2
	movs r5, #0
	strb r5, [r1]
	ldr r1, [r6]
	ldr r3, _080CADA8
	adds r1, r1, r3
	strb r0, [r1]
	ldr r1, [r6]
	ldr r7, _080CADAC
	adds r1, r1, r7
	strb r4, [r1]
	ldr r3, [r6]
	movs r1, #0xc6
	lsls r1, r1, #4
	adds r2, r3, r1
	movs r1, #0x20
	strh r1, [r2]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #1
	rsbs r1, r1, #0
	subs r7, #5
	adds r2, r3, r7
	strh r1, [r2]
	ldr r1, _080CADB0
	adds r3, r3, r1
	strh r5, [r3]
	bl SetBoxSpeciesAndPersonalities
	cmp r4, #0
	ble _080CADB8
	ldr r0, [r6]
	ldr r2, _080CADB4
	adds r0, r0, r2
	movs r1, #0
	b _080CADC0
	.align 2, 0
_080CADA0: .4byte 0x020399A8
_080CADA4: .4byte 0x00000C6A
_080CADA8: .4byte 0x00000C6B
_080CADAC: .4byte 0x00000C69
_080CADB0: .4byte 0x00000C66
_080CADB4: .4byte 0x00000C68
_080CADB8:
	ldr r0, [r6]
	ldr r3, _080CADEC
	adds r0, r0, r3
	movs r1, #5
_080CADC0:
	strb r1, [r0]
	ldr r0, _080CADF0
	ldr r2, [r0]
	ldr r7, _080CADEC
	adds r0, r2, r7
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x64
	ldr r3, _080CADF4
	adds r1, r2, r3
	strh r0, [r1]
	subs r7, #4
	adds r2, r2, r7
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl sub_080CAA64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CADEC: .4byte 0x00000C68
_080CADF0: .4byte 0x020399A8
_080CADF4: .4byte 0x00000C62
	thumb_func_end sub_080CAD40

	thumb_func_start sub_080CADF8
sub_080CADF8: @ 0x080CADF8
	push {r4, r5, r6, lr}
	ldr r5, _080CAE24
	ldr r0, [r5]
	movs r4, #0xc6
	lsls r4, r4, #4
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, #0
	beq _080CAE0E
	subs r0, #1
	strh r0, [r1]
_080CAE0E:
	ldr r3, [r5]
	ldr r6, _080CAE28
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CAE90
	cmp r0, #1
	bgt _080CAE2C
	cmp r0, #0
	beq _080CAE34
	b _080CAF52
	.align 2, 0
_080CAE24: .4byte 0x020399A8
_080CAE28: .4byte 0x00000C6A
_080CAE2C:
	cmp r0, #2
	bne _080CAE32
	b _080CAF40
_080CAE32:
	b _080CAF52
_080CAE34:
	ldr r0, _080CAE80
	adds r1, r3, r0
	ldr r2, _080CAE84
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	subs r0, #0x41
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xba
	bhi _080CAE50
	b _080CAF5C
_080CAE50:
	ldr r1, _080CAE88
	adds r0, r3, r1
	ldrb r0, [r0]
	bl DestroyAllIconsInRow
	ldr r2, [r5]
	ldr r0, _080CAE80
	adds r3, r2, r0
	ldr r1, _080CAE8C
	adds r0, r2, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	adds r2, r2, r6
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _080CAF5C
	.align 2, 0
_080CAE80: .4byte 0x00000C62
_080CAE84: .4byte 0x00000C64
_080CAE88: .4byte 0x00000C68
_080CAE8C: .4byte 0x00000C69
_080CAE90:
	ldr r2, _080CAEF4
	adds r1, r3, r2
	ldr r6, _080CAEF8
	adds r2, r3, r6
	ldrh r0, [r2]
	ldrh r6, [r1]
	adds r0, r0, r6
	strh r0, [r1]
	ldr r6, _080CAEFC
	adds r0, r3, r6
	ldrb r0, [r0]
	adds r1, r3, r4
	ldrh r1, [r1]
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_080CAB6C
	ldr r2, [r5]
	ldr r3, _080CAF00
	adds r1, r2, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	ldr r1, _080CAF04
	adds r0, r2, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	ble _080CAED6
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, #5
	beq _080CAEE2
_080CAED6:
	cmp r1, #0
	bge _080CAF10
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CAF10
_080CAEE2:
	ldr r0, _080CAF08
	ldr r1, [r0]
	ldr r2, _080CAF0C
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080CAF5C
	.align 2, 0
_080CAEF4: .4byte 0x00000C62
_080CAEF8: .4byte 0x00000C64
_080CAEFC: .4byte 0x00000C68
_080CAF00: .4byte 0x00000C66
_080CAF04: .4byte 0x00000C69
_080CAF08: .4byte 0x020399A8
_080CAF0C: .4byte 0x00000C6A
_080CAF10:
	ldr r3, _080CAF30
	ldr r0, [r3]
	ldr r6, _080CAF34
	adds r1, r0, r6
	ldr r2, _080CAF38
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r6, [r1]
	adds r0, r0, r6
	movs r2, #0
	strb r0, [r1]
	ldr r0, [r3]
	ldr r1, _080CAF3C
	adds r0, r0, r1
	strb r2, [r0]
	b _080CAF5C
	.align 2, 0
_080CAF30: .4byte 0x020399A8
_080CAF34: .4byte 0x00000C68
_080CAF38: .4byte 0x00000C69
_080CAF3C: .4byte 0x00000C6A
_080CAF40:
	ldr r2, _080CAF58
	adds r0, r3, r2
	ldrh r0, [r0]
	cmp r0, #0
	bne _080CAF5C
	adds r1, r3, r4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080CAF52:
	movs r0, #0
	b _080CAF5E
	.align 2, 0
_080CAF58: .4byte 0x00000C66
_080CAF5C:
	movs r0, #1
_080CAF5E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080CADF8

	thumb_func_start SetBoxSpeciesAndPersonalities
SetBoxSpeciesAndPersonalities: @ 0x080CAF64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	movs r0, #0
	ldr r1, _080CAFDC
	mov sb, r1
_080CAF78:
	adds r0, #1
	mov r8, r0
	movs r7, #5
_080CAF7E:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x41
	bl GetBoxMonDataAt
	mov r2, sb
	ldr r1, [r2]
	lsls r2, r5, #1
	ldr r3, _080CAFE0
	adds r1, r1, r3
	adds r1, r1, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080CAFB8
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl GetBoxMonDataAt
	mov r2, sb
	ldr r1, [r2]
	lsls r2, r5, #2
	ldr r3, _080CAFE4
	adds r1, r1, r3
	adds r1, r1, r2
	str r0, [r1]
_080CAFB8:
	adds r5, #1
	subs r7, #1
	cmp r7, #0
	bge _080CAF7E
	mov r0, r8
	cmp r0, #4
	ble _080CAF78
	ldr r0, _080CAFDC
	ldr r0, [r0]
	ldr r1, _080CAFE8
	adds r0, r0, r1
	strb r6, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CAFDC: .4byte 0x020399A8
_080CAFE0: .4byte 0x00000BA8
_080CAFE4: .4byte 0x00000BE4
_080CAFE8: .4byte 0x00000C5C
	thumb_func_end SetBoxSpeciesAndPersonalities

	thumb_func_start DestroyBoxMonIconAtPosition
DestroyBoxMonIconAtPosition: @ 0x080CAFEC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	ldr r5, _080CB018
	ldr r1, [r5]
	lsrs r4, r0, #0x16
	ldr r0, _080CB01C
	adds r1, r1, r0
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080CB012
	bl DestroyBoxMonIcon
	ldr r0, [r5]
	ldr r1, _080CB01C
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_080CB012:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB018: .4byte 0x020399A8
_080CB01C: .4byte 0x00000A88
	thumb_func_end DestroyBoxMonIconAtPosition

	thumb_func_start SetBoxMonIconObjMode
SetBoxMonIconObjMode: @ 0x080CB020
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r1, _080CB054
	ldr r1, [r1]
	lsrs r0, r0, #0x16
	ldr r3, _080CB058
	adds r1, r1, r3
	adds r1, r1, r0
	ldr r3, [r1]
	cmp r3, #0
	beq _080CB04E
	movs r0, #3
	adds r1, r2, #0
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
_080CB04E:
	pop {r0}
	bx r0
	.align 2, 0
_080CB054: .4byte 0x020399A8
_080CB058: .4byte 0x00000A88
	thumb_func_end SetBoxMonIconObjMode

	thumb_func_start CreatePartyMonsSprites
CreatePartyMonsSprites: @ 0x080CB05C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r4, _080CB100
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	adds r1, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x68
	movs r3, #0x40
	bl sub_080CBAA4
	ldr r1, _080CB104
	ldr r1, [r1]
	movs r2, #0xa7
	lsls r2, r2, #4
	adds r1, r1, r2
	str r0, [r1]
	movs r7, #1
	movs r6, #1
_080CB0A4:
	movs r0, #0x64
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, _080CB100
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080CB108
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	adds r1, r0, #0
	subs r0, r6, #1
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #0x13
	movs r0, #0x80
	lsls r0, r0, #0xd
	adds r3, r3, r0
	asrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x98
	bl sub_080CBAA4
	ldr r1, _080CB104
	ldr r1, [r1]
	lsls r2, r6, #2
	movs r3, #0xa7
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r1, r1, r2
	str r0, [r1]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _080CB118
	.align 2, 0
_080CB100: .4byte 0x02024190
_080CB104: .4byte 0x020399A8
_080CB108:
	ldr r0, _080CB1BC
	ldr r0, [r0]
	lsls r1, r6, #2
	movs r2, #0xa7
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r1
	str r5, [r0]
_080CB118:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	bls _080CB0A4
	ldr r3, _080CB1BC
	mov r0, r8
	cmp r0, #0
	bne _080CB15E
	movs r6, #0
	cmp r6, r7
	bhs _080CB15E
	mov ip, r3
	movs r5, #0xa7
	lsls r5, r5, #4
	movs r4, #4
_080CB138:
	mov r2, ip
	ldr r1, [r2]
	lsls r0, r6, #2
	adds r1, r1, r5
	adds r1, r1, r0
	ldr r2, [r1]
	ldrh r0, [r2, #0x22]
	subs r0, #0xa0
	strh r0, [r2, #0x22]
	ldr r1, [r1]
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, r7
	blo _080CB138
_080CB15E:
	ldr r0, [r3]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080CB1B0
	movs r6, #0
	adds r7, r3, #0
	movs r5, #0xa7
	lsls r5, r5, #4
_080CB16E:
	ldr r0, [r7]
	lsls r4, r6, #2
	adds r0, r0, r5
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080CB1A6
	movs r0, #0x64
	muls r0, r6, r0
	ldr r1, _080CB1C0
	adds r0, r0, r1
	movs r1, #0xc
	bl GetMonData
	cmp r0, #0
	bne _080CB1A6
	ldr r0, [r7]
	adds r0, r0, r5
	adds r0, r0, r4
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r2, #1]
_080CB1A6:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	bls _080CB16E
_080CB1B0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CB1BC: .4byte 0x020399A8
_080CB1C0: .4byte 0x02024190
	thumb_func_end CreatePartyMonsSprites

	thumb_func_start sub_080CB1C4
sub_080CB1C4: @ 0x080CB1C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _080CB228
	ldr r1, [r0]
	ldr r2, _080CB22C
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	movs r5, #0
	movs r6, #0
	adds r3, r0, #0
	movs r7, #0xa7
	lsls r7, r7, #4
_080CB1DE:
	ldr r0, [r3]
	lsls r4, r5, #2
	adds r0, r0, r7
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080CB214
	cmp r5, r6
	beq _080CB20E
	adds r1, r6, #0
	str r3, [sp]
	bl sub_080CB244
	ldr r3, [sp]
	ldr r2, [r3]
	adds r0, r2, r7
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	ldr r0, _080CB22C
	adds r2, r2, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_080CB20E:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080CB214:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #5
	bls _080CB1DE
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CB228: .4byte 0x020399A8
_080CB22C: .4byte 0x00000C5E
	thumb_func_end sub_080CB1C4

	thumb_func_start GetWaldaWallpaperPatternId
GetWaldaWallpaperPatternId: @ 0x080CB230
	ldr r0, _080CB23C
	ldr r0, [r0]
	ldr r1, _080CB240
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080CB23C: .4byte 0x020399A8
_080CB240: .4byte 0x00000C5E
	thumb_func_end GetWaldaWallpaperPatternId

	thumb_func_start sub_080CB244
sub_080CB244: @ 0x080CB244
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r2, #0x30]
	cmp r1, #0
	bne _080CB258
	movs r3, #0x68
	movs r4, #0x40
	b _080CB26A
_080CB258:
	movs r3, #0x98
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x13
	movs r1, #0x80
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r4, r0, #0x10
_080CB26A:
	ldrh r0, [r2, #0x20]
	lsls r0, r0, #3
	strh r0, [r2, #0x32]
	ldrh r0, [r2, #0x22]
	lsls r0, r0, #3
	strh r0, [r2, #0x34]
	lsls r1, r3, #3
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, #0
	bge _080CB284
	adds r0, #7
_080CB284:
	asrs r0, r0, #3
	strh r0, [r2, #0x36]
	lsls r0, r4, #0x10
	asrs r0, r0, #0xd
	movs r3, #0x34
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _080CB298
	adds r0, #7
_080CB298:
	asrs r0, r0, #3
	strh r0, [r2, #0x38]
	movs r0, #8
	strh r0, [r2, #0x3a]
	ldr r0, _080CB2AC
	str r0, [r2, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB2AC: .4byte 0x080CB2B1
	thumb_func_end sub_080CB244

	thumb_func_start sub_080CB2B0
sub_080CB2B0: @ 0x080CB2B0
	push {r4, lr}
	adds r3, r0, #0
	ldrh r2, [r3, #0x3a]
	movs r1, #0x3a
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _080CB2E0
	ldrh r0, [r3, #0x36]
	ldrh r4, [r3, #0x32]
	adds r0, r0, r4
	strh r0, [r3, #0x32]
	ldrh r1, [r3, #0x38]
	ldrh r4, [r3, #0x34]
	adds r1, r1, r4
	strh r1, [r3, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	strh r0, [r3, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	strh r1, [r3, #0x22]
	subs r0, r2, #1
	strh r0, [r3, #0x3a]
	b _080CB326
_080CB2E0:
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _080CB2F0
	movs r0, #0x68
	strh r0, [r3, #0x20]
	movs r0, #0x40
	b _080CB302
_080CB2F0:
	movs r0, #0x98
	strh r0, [r3, #0x20]
	movs r4, #0x30
	ldrsh r1, [r3, r4]
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x10
_080CB302:
	strh r0, [r3, #0x22]
	ldr r0, _080CB32C
	str r0, [r3, #0x1c]
	ldr r0, _080CB330
	ldr r2, [r0]
	movs r0, #0x30
	ldrsh r1, [r3, r0]
	lsls r1, r1, #2
	movs r4, #0xa7
	lsls r4, r4, #4
	adds r0, r2, r4
	adds r0, r0, r1
	str r3, [r0]
	ldr r0, _080CB334
	adds r2, r2, r0
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_080CB326:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB32C: .4byte 0x08007141
_080CB330: .4byte 0x020399A8
_080CB334: .4byte 0x00000C5E
	thumb_func_end sub_080CB2B0

	thumb_func_start DestroyMovingMonIcon
DestroyMovingMonIcon: @ 0x080CB338
	push {r4, lr}
	ldr r4, _080CB35C
	ldr r0, [r4]
	ldr r1, _080CB360
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080CB356
	bl DestroyBoxMonIcon
	ldr r0, [r4]
	ldr r1, _080CB360
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
_080CB356:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB35C: .4byte 0x020399A8
_080CB360: .4byte 0x00000A6C
	thumb_func_end DestroyMovingMonIcon

	thumb_func_start sub_080CB364
sub_080CB364: @ 0x080CB364
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r6, _080CB3BC
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r5, #5
	rsbs r5, r5, #0
_080CB372:
	ldr r0, [r6]
	lsls r1, r3, #2
	movs r2, #0xa7
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r2, r0, r1
	ldr r1, [r2]
	cmp r1, #0
	beq _080CB3CA
	ldrh r0, [r1, #0x22]
	adds r0, r4, r0
	strh r0, [r1, #0x22]
	ldr r2, [r2]
	ldrh r1, [r2, #0x26]
	ldrh r0, [r2, #0x22]
	adds r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xc0
	bls _080CB3C0
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _080CB3CA
	.align 2, 0
_080CB3BC: .4byte 0x020399A8
_080CB3C0:
	adds r2, #0x3e
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2]
_080CB3CA:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #5
	bls _080CB372
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CB364

	thumb_func_start DestroyPartyMonIcon
DestroyPartyMonIcon: @ 0x080CB3DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	ldr r5, _080CB40C
	ldr r1, [r5]
	lsrs r4, r0, #0x16
	movs r0, #0xa7
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080CB406
	bl DestroyBoxMonIcon
	ldr r0, [r5]
	movs r1, #0xa7
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_080CB406:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB40C: .4byte 0x020399A8
	thumb_func_end DestroyPartyMonIcon

	thumb_func_start DestroyAllPartyMonIcons
DestroyAllPartyMonIcons: @ 0x080CB410
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _080CB44C
_080CB416:
	ldr r0, [r6]
	lsls r4, r5, #2
	movs r1, #0xa7
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080CB43A
	bl DestroyBoxMonIcon
	ldr r0, [r6]
	movs r1, #0xa7
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_080CB43A:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #5
	bls _080CB416
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB44C: .4byte 0x020399A8
	thumb_func_end DestroyAllPartyMonIcons

	thumb_func_start SetPartyMonIconObjMode
SetPartyMonIconObjMode: @ 0x080CB450
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r1, _080CB484
	ldr r1, [r1]
	lsrs r0, r0, #0x16
	movs r3, #0xa7
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r1, r1, r0
	ldr r3, [r1]
	cmp r3, #0
	beq _080CB480
	movs r0, #3
	adds r1, r2, #0
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
_080CB480:
	pop {r0}
	bx r0
	.align 2, 0
_080CB484: .4byte 0x020399A8
	thumb_func_end SetPartyMonIconObjMode

	thumb_func_start sub_080CB488
sub_080CB488: @ 0x080CB488
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	cmp r4, #0
	bne _080CB4B8
	ldr r3, _080CB4B0
	ldr r0, [r3]
	ldr r5, _080CB4B4
	adds r2, r0, r5
	lsls r1, r1, #2
	adds r5, #4
	adds r0, r0, r5
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r4, [r0]
	b _080CB4D4
	.align 2, 0
_080CB4B0: .4byte 0x020399A8
_080CB4B4: .4byte 0x00000A6C
_080CB4B8:
	cmp r4, #1
	bne _080CB50A
	ldr r3, _080CB510
	ldr r0, [r3]
	ldr r1, _080CB514
	adds r2, r0, r1
	lsls r1, r5, #2
	ldr r4, _080CB518
	adds r0, r0, r4
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r2]
	movs r1, #0
	str r1, [r0]
_080CB4D4:
	adds r5, r3, #0
	ldr r0, [r5]
	ldr r4, _080CB514
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, _080CB51C
	str r0, [r1, #0x1c]
	bl sub_080CA820
	ldr r1, [r5]
	adds r1, r1, r4
	ldr r3, [r1]
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x43
	movs r1, #7
	strb r1, [r0]
_080CB50A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB510: .4byte 0x020399A8
_080CB514: .4byte 0x00000A6C
_080CB518: .4byte 0x00000A88
_080CB51C: .4byte 0x080CB975
	thumb_func_end sub_080CB488

	thumb_func_start sub_080CB520
sub_080CB520: @ 0x080CB520
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r0, #0xe
	bne _080CB56C
	ldr r3, _080CB564
	ldr r1, [r3]
	lsls r5, r6, #2
	movs r4, #0xa7
	lsls r4, r4, #4
	adds r0, r1, r4
	adds r0, r0, r5
	ldr r2, _080CB568
	adds r1, r1, r2
	ldr r2, [r1]
	str r2, [r0]
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r3]
	adds r0, r0, r4
	adds r0, r0, r5
	ldr r0, [r0]
	adds r0, #0x43
	movs r1, #0xc
	strb r1, [r0]
	b _080CB5A8
	.align 2, 0
_080CB564: .4byte 0x020399A8
_080CB568: .4byte 0x00000A6C
_080CB56C:
	ldr r5, _080CB5C0
	ldr r1, [r5]
	lsls r4, r6, #2
	ldr r3, _080CB5C4
	adds r0, r1, r3
	adds r0, r0, r4
	ldr r2, _080CB5C8
	adds r1, r1, r2
	ldr r2, [r1]
	str r2, [r0]
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r5]
	adds r0, r0, r3
	adds r0, r0, r4
	ldr r4, [r0]
	adds r0, r6, #0
	movs r1, #6
	bl __umodsi3
	movs r1, #0x13
	subs r1, r1, r0
	adds r4, #0x43
	strb r1, [r4]
	adds r3, r5, #0
_080CB5A8:
	ldr r1, [r3]
	ldr r0, _080CB5C8
	adds r1, r1, r0
	ldr r2, [r1]
	ldr r0, _080CB5CC
	str r0, [r2, #0x1c]
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB5C0: .4byte 0x020399A8
_080CB5C4: .4byte 0x00000A88
_080CB5C8: .4byte 0x00000A6C
_080CB5CC: .4byte 0x08007141
	thumb_func_end sub_080CB520

	thumb_func_start sub_080CB5D0
sub_080CB5D0: @ 0x080CB5D0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r0, #0xe
	bne _080CB5F4
	ldr r3, _080CB5F0
	ldr r1, [r3]
	movs r0, #0xb0
	lsls r0, r0, #4
	adds r2, r1, r0
	lsls r0, r4, #2
	movs r4, #0xa7
	lsls r4, r4, #4
	b _080CB602
	.align 2, 0
_080CB5F0: .4byte 0x020399A8
_080CB5F4:
	ldr r3, _080CB624
	ldr r1, [r3]
	movs r0, #0xb0
	lsls r0, r0, #4
	adds r2, r1, r0
	lsls r0, r4, #2
	ldr r4, _080CB628
_080CB602:
	adds r0, r0, r4
	adds r1, r1, r0
	str r1, [r2]
	ldr r1, [r3]
	ldr r2, _080CB62C
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, _080CB630
	str r0, [r2, #0x1c]
	ldr r4, _080CB634
	adds r1, r1, r4
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB624: .4byte 0x020399A8
_080CB628: .4byte 0x00000A88
_080CB62C: .4byte 0x00000A6C
_080CB630: .4byte 0x08007141
_080CB634: .4byte 0x00000C5D
	thumb_func_end sub_080CB5D0

	thumb_func_start sub_080CB638
sub_080CB638: @ 0x080CB638
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r6, _080CB654
	ldr r0, [r6]
	ldr r1, _080CB658
	mov sb, r1
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0x10
	bne _080CB65C
	movs r0, #0
	b _080CB768
	.align 2, 0
_080CB654: .4byte 0x020399A8
_080CB658: .4byte 0x00000C5D
_080CB65C:
	adds r0, #1
	strb r0, [r1]
	ldr r2, [r6]
	ldr r5, _080CB774
	adds r0, r2, r5
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080CB68C
	movs r1, #0xb0
	lsls r1, r1, #4
	adds r0, r2, r1
	ldr r0, [r0]
	ldr r1, [r0]
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldr r5, _080CB778
	adds r0, r2, r5
	ldr r1, [r0]
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
_080CB68C:
	ldr r3, [r6]
	movs r7, #0xb0
	lsls r7, r7, #4
	adds r4, r3, r7
	ldr r0, [r4]
	ldr r0, [r0]
	mov r8, r0
	ldr r5, _080CB77C
	mov r0, sb
	adds r1, r3, r0
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _080CB6B0
	adds r0, #0xf
_080CB6B0:
	asrs r0, r0, #4
	mov r2, r8
	strh r0, [r2, #0x24]
	ldr r0, _080CB778
	mov r8, r0
	add r3, r8
	ldr r2, [r3]
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r0, r0, r5
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r0, #0
	bge _080CB6CE
	adds r0, #0xf
_080CB6CE:
	asrs r0, r0, #4
	rsbs r0, r0, #0
	strh r0, [r2, #0x24]
	ldrb r0, [r1]
	cmp r0, #8
	bne _080CB732
	ldr r3, [r3]
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	movs r5, #3
	movs r1, #0xc
	ands r1, r0
	ldrb r2, [r3, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r0, [r6]
	mov r2, r8
	adds r1, r0, r2
	ldr r1, [r1]
	adds r0, r0, r7
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x43
	ldrb r0, [r0]
	adds r1, #0x43
	strb r0, [r1]
	bl sub_080CA820
	ldr r1, [r6]
	adds r1, r1, r7
	ldr r1, [r1]
	ldr r1, [r1]
	ands r5, r0
	lsls r5, r5, #2
	ldrb r0, [r1, #5]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, #5]
	ldr r0, [r6]
	adds r0, r0, r7
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x43
	movs r1, #7
	strb r1, [r0]
_080CB732:
	ldr r1, [r6]
	mov r5, sb
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _080CB766
	mov r0, r8
	adds r2, r1, r0
	ldr r3, [r2]
	adds r1, r1, r7
	ldr r0, [r1]
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r1]
	str r3, [r0]
	ldr r1, [r6]
	mov r2, r8
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, _080CB780
	str r0, [r2, #0x1c]
	adds r1, r1, r7
	ldr r0, [r1]
	ldr r1, [r0]
	ldr r0, _080CB784
	str r0, [r1, #0x1c]
_080CB766:
	movs r0, #1
_080CB768:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CB774: .4byte 0x00000C5D
_080CB778: .4byte 0x00000A6C
_080CB77C: .4byte 0x082FA8CC
_080CB780: .4byte 0x080CB975
_080CB784: .4byte 0x08007141
	thumb_func_end sub_080CB638

	thumb_func_start sub_080CB788
sub_080CB788: @ 0x080CB788
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r0, #1
	beq _080CB7C0
	cmp r0, #1
	bgt _080CB7A2
	cmp r0, #0
	beq _080CB7A8
	b _080CB834
_080CB7A2:
	cmp r2, #2
	beq _080CB7E4
	b _080CB834
_080CB7A8:
	ldr r3, _080CB7B8
	ldr r1, [r3]
	ldr r0, _080CB7BC
	adds r2, r1, r0
	lsls r0, r4, #2
	movs r4, #0xa7
	lsls r4, r4, #4
	b _080CB7CC
	.align 2, 0
_080CB7B8: .4byte 0x020399A8
_080CB7BC: .4byte 0x00000B04
_080CB7C0:
	ldr r3, _080CB7D8
	ldr r1, [r3]
	ldr r0, _080CB7DC
	adds r2, r1, r0
	lsls r0, r4, #2
	ldr r4, _080CB7E0
_080CB7CC:
	adds r0, r0, r4
	adds r1, r1, r0
	str r1, [r2]
	adds r4, r3, #0
	b _080CB7F4
	.align 2, 0
_080CB7D8: .4byte 0x020399A8
_080CB7DC: .4byte 0x00000B04
_080CB7E0: .4byte 0x00000A88
_080CB7E4:
	ldr r0, _080CB83C
	ldr r1, [r0]
	ldr r3, _080CB840
	adds r2, r1, r3
	ldr r4, _080CB844
	adds r1, r1, r4
	str r1, [r2]
	adds r4, r0, #0
_080CB7F4:
	ldr r0, [r4]
	ldr r1, _080CB840
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _080CB834
	bl InitSpriteAffineAnim
	ldr r0, [r4]
	ldr r3, _080CB840
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, [r4]
	adds r1, r1, r3
	ldr r0, [r1]
	ldr r2, [r0]
	ldr r0, _080CB848
	str r0, [r2, #0x10]
	ldr r0, [r1]
	ldr r0, [r0]
	movs r1, #0
	bl StartSpriteAffineAnim
_080CB834:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB83C: .4byte 0x020399A8
_080CB840: .4byte 0x00000B04
_080CB844: .4byte 0x00000A6C
_080CB848: .4byte 0x0854CBCC
	thumb_func_end sub_080CB788

	thumb_func_start sub_080CB84C
sub_080CB84C: @ 0x080CB84C
	push {lr}
	ldr r0, _080CB870
	ldr r0, [r0]
	ldr r1, _080CB874
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [r0]
	cmp r1, #0
	beq _080CB86C
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080CB878
_080CB86C:
	movs r0, #0
	b _080CB88E
	.align 2, 0
_080CB870: .4byte 0x020399A8
_080CB874: .4byte 0x00000B04
_080CB878:
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080CB88C
	movs r0, #4
	orrs r0, r2
	strb r0, [r3]
_080CB88C:
	movs r0, #1
_080CB88E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CB84C

	thumb_func_start sub_080CB894
sub_080CB894: @ 0x080CB894
	push {r4, lr}
	ldr r4, _080CB8D0
	ldr r0, [r4]
	ldr r1, _080CB8D4
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _080CB8CA
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldr r0, [r4]
	ldr r1, _080CB8D4
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	bl DestroyBoxMonIcon
	ldr r0, [r4]
	ldr r1, _080CB8D4
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1]
_080CB8CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB8D0: .4byte 0x020399A8
_080CB8D4: .4byte 0x00000B04
	thumb_func_end sub_080CB894

	thumb_func_start sub_080CB8D8
sub_080CB8D8: @ 0x080CB8D8
	push {lr}
	ldr r3, _080CB90C
	ldr r0, [r3]
	ldr r1, _080CB910
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _080CB908
	adds r2, r0, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r1, _080CB910
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	bl StartSpriteAffineAnim
_080CB908:
	pop {r0}
	bx r0
	.align 2, 0
_080CB90C: .4byte 0x020399A8
_080CB910: .4byte 0x00000B04
	thumb_func_end sub_080CB8D8

	thumb_func_start sub_080CB914
sub_080CB914: @ 0x080CB914
	push {lr}
	ldr r0, _080CB928
	ldr r0, [r0]
	ldr r1, _080CB92C
	adds r2, r0, r1
	ldr r0, [r2]
	cmp r0, #0
	bne _080CB930
	movs r0, #0
	b _080CB944
	.align 2, 0
_080CB928: .4byte 0x020399A8
_080CB92C: .4byte 0x00000B04
_080CB930:
	ldr r0, [r0]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080CB942
	movs r0, #0
	str r0, [r2]
_080CB942:
	movs r0, #1
_080CB944:
	pop {r1}
	bx r1
	thumb_func_end sub_080CB914

	thumb_func_start SetMovingMonPriority
SetMovingMonPriority: @ 0x080CB948
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080CB96C
	ldr r1, [r1]
	ldr r2, _080CB970
	adds r1, r1, r2
	ldr r3, [r1]
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	ldrb r2, [r3, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #5]
	bx lr
	.align 2, 0
_080CB96C: .4byte 0x020399A8
_080CB970: .4byte 0x00000A6C
	thumb_func_end SetMovingMonPriority

	thumb_func_start sub_080CB974
sub_080CB974: @ 0x080CB974
	ldr r1, _080CB990
	ldr r1, [r1]
	ldr r2, _080CB994
	adds r1, r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, #0x20]
	strh r2, [r0, #0x20]
	ldr r2, [r1]
	ldrh r1, [r2, #0x26]
	ldrh r2, [r2, #0x22]
	adds r1, r1, r2
	adds r1, #4
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_080CB990: .4byte 0x020399A8
_080CB994: .4byte 0x00000CB4
	thumb_func_end sub_080CB974

	thumb_func_start sub_080CB998
sub_080CB998: @ 0x080CB998
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r4, #0
	ldr r1, _080CBA00
	ldr r0, [r1]
	ldr r2, _080CBA04
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r2, r1, #0
	cmp r0, r3
	beq _080CB9CC
	adds r6, r2, #0
	ldr r5, _080CBA04
_080CB9B4:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x27
	bhi _080CB9CC
	ldr r0, [r6]
	lsls r1, r4, #1
	adds r0, r0, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _080CB9B4
_080CB9CC:
	cmp r4, #0x28
	bne _080CBA0C
	movs r4, #0
	ldr r0, [r2]
	ldr r5, _080CBA04
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, #0
	beq _080CB9F8
	adds r6, r2, #0
_080CB9E0:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x27
	bhi _080CB9F8
	ldr r0, [r6]
	lsls r1, r4, #1
	adds r0, r0, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080CB9E0
_080CB9F8:
	cmp r4, #0x28
	bne _080CBA0C
	ldr r0, _080CBA08
	b _080CBA3E
	.align 2, 0
_080CBA00: .4byte 0x020399A8
_080CBA04: .4byte 0x00000B58
_080CBA08: .4byte 0x0000FFFF
_080CBA0C:
	ldr r1, [r2]
	lsls r2, r4, #1
	ldr r5, _080CBA44
	adds r0, r1, r5
	adds r0, r0, r2
	strh r3, [r0]
	ldr r0, _080CBA48
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r4, r4, #0x14
	lsrs r4, r4, #0x10
	adds r0, r3, #0
	movs r1, #1
	bl GetMonIconTiles
	lsls r1, r4, #5
	ldr r2, _080CBA4C
	adds r1, r1, r2
	ldr r2, _080CBA50
	bl CpuSet
	adds r0, r4, #0
_080CBA3E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080CBA44: .4byte 0x00000B58
_080CBA48: .4byte 0x00000B08
_080CBA4C: .4byte 0x06010000
_080CBA50: .4byte 0x04000080
	thumb_func_end sub_080CB998

	thumb_func_start sub_080CBA54
sub_080CBA54: @ 0x080CBA54
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r3, #0
	ldr r6, _080CBA88
_080CBA5E:
	ldr r1, [r6]
	lsls r2, r3, #1
	ldr r4, _080CBA8C
	adds r0, r1, r4
	adds r4, r0, r2
	ldrh r0, [r4]
	cmp r0, r5
	bne _080CBA94
	ldr r0, _080CBA90
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _080CBA9E
	strh r0, [r4]
	b _080CBA9E
	.align 2, 0
_080CBA88: .4byte 0x020399A8
_080CBA8C: .4byte 0x00000B58
_080CBA90: .4byte 0x00000B08
_080CBA94:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x27
	bls _080CBA5E
_080CBA9E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080CBA54

	thumb_func_start sub_080CBAA4
sub_080CBAA4: @ 0x080CBAA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r4, [sp, #0x3c]
	ldr r5, [sp, #0x40]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x18]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov sb, r5
	mov r2, sp
	ldr r0, _080CBB54
	ldm r0!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	adds r0, r6, #0
	bl GetIconSpecies
	mov sl, r0
	mov r6, sl
	mov r2, sp
	ldr r1, _080CBB58
	adds r1, r6, r1
	ldr r3, _080CBB5C
	adds r0, r3, #0
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r2, #2]
	adds r0, r6, #0
	bl sub_080CB998
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	ldr r0, _080CBB60
	cmp r5, r0
	beq _080CBB76
	ldr r7, [sp, #0x18]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	mov r0, sp
	mov r3, sb
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _080CBB70
	ldr r1, _080CBB64
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, _080CBB68
	ands r2, r5
	ldrh r3, [r0, #4]
	ldr r1, _080CBB6C
	ands r1, r3
	orrs r1, r2
	strh r1, [r0, #4]
	movs r1, #3
	ands r4, r1
	lsls r3, r4, #2
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r3
	strb r1, [r0, #5]
	mov r1, sl
	strh r1, [r0, #0x2e]
	b _080CBB78
	.align 2, 0
_080CBB54: .4byte 0x0854CB84
_080CBB58: .4byte 0x08556EE4
_080CBB5C: .4byte 0x0000DAC0
_080CBB60: .4byte 0x0000FFFF
_080CBB64: .4byte 0x020205AC
_080CBB68: .4byte 0x000003FF
_080CBB6C: .4byte 0xFFFFFC00
_080CBB70:
	adds r0, r6, #0
	bl sub_080CBA54
_080CBB76:
	movs r0, #0
_080CBB78:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080CBAA4

	thumb_func_start DestroyBoxMonIcon
DestroyBoxMonIcon: @ 0x080CBB88
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl sub_080CBA54
	adds r0, r4, #0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DestroyBoxMonIcon

	thumb_func_start sub_080CBBA0
sub_080CBBA0: @ 0x080CBBA0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080CBBC8
	movs r1, #2
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080CBBCC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBBC8: .4byte 0x080CBBE5
_080CBBCC: .4byte 0x03005B60
	thumb_func_end sub_080CBBA0

	thumb_func_start sub_080CBBD0
sub_080CBBD0: @ 0x080CBBD0
	push {lr}
	ldr r0, _080CBBE0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080CBBE0: .4byte 0x080CBBE5
	thumb_func_end sub_080CBBD0

	thumb_func_start sub_080CBBE4
sub_080CBBE4: @ 0x080CBBE4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080CBC08
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bhi _080CBCC8
	lsls r0, r0, #2
	ldr r1, _080CBC0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CBC08: .4byte 0x03005B60
_080CBC0C: .4byte 0x080CBC10
_080CBC10: @ jump table
	.4byte _080CBC24 @ case 0
	.4byte _080CBC5C @ case 1
	.4byte _080CBC90 @ case 2
	.4byte _080CBC9A @ case 3
	.4byte _080CBCC0 @ case 4
_080CBC24:
	ldr r1, _080CBC50
	ldr r0, [r1]
	ldr r2, _080CBC54
	adds r0, r0, r2
	movs r2, #0
	strb r2, [r0]
	ldr r1, [r1]
	movs r3, #0xb3
	lsls r3, r3, #2
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _080CBC58
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #0
	movs r3, #1
	bl RequestDma3Fill
	strh r0, [r4, #0xa]
	b _080CBCCC
	.align 2, 0
_080CBC50: .4byte 0x020399A8
_080CBC54: .4byte 0x000002D2
_080CBC58: .4byte 0x00004AC4
_080CBC5C:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	bl CheckForSpaceForDma3Request
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080CBCD2
	ldr r0, _080CBC88
	ldr r1, [r0]
	ldr r2, _080CBC8C
	adds r1, r1, r2
	movs r0, #2
	bl SetBgTilemapBuffer
	movs r0, #2
	bl ShowBg
	b _080CBCCC
	.align 2, 0
_080CBC88: .4byte 0x020399A8
_080CBC8C: .4byte 0x00004AC4
_080CBC90:
	ldrb r0, [r4, #0xc]
	movs r1, #0
	bl LoadWallpaperGfx
	b _080CBCCC
_080CBC9A:
	bl WaitForWallpaperGfxLoad
	cmp r0, #0
	beq _080CBCD2
	ldrb r0, [r4, #0xc]
	bl sub_080CC3C4
	bl sub_080CC8A8
	ldrb r0, [r4, #0xc]
	bl sub_080CA89C
	ldr r1, _080CBCBC
	movs r0, #0xc
	bl SetGpuReg
	b _080CBCCC
	.align 2, 0
_080CBCBC: .4byte 0x00005B0A
_080CBCC0:
	adds r0, r2, #0
	bl DestroyTask
	b _080CBCCC
_080CBCC8:
	movs r0, #0
	b _080CBCD0
_080CBCCC:
	ldrh r0, [r4, #8]
	adds r0, #1
_080CBCD0:
	strh r0, [r4, #8]
_080CBCD2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080CBBE4

	thumb_func_start SetUpScrollToBox
SetUpScrollToBox: @ 0x080CBCD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	adds r0, r4, #0
	bl sub_080CBEB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r5, _080CBD9C
	ldr r2, [r5]
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	movs r0, #6
	rsbs r0, r0, #0
	adds r1, r0, #0
	cmp r3, #0
	ble _080CBD04
	movs r1, #6
_080CBD04:
	ldr r7, _080CBDA0
	adds r0, r2, r7
	strh r1, [r0]
	movs r1, #2
	cmp r3, #0
	ble _080CBD12
	movs r1, #1
_080CBD12:
	ldr r7, _080CBDA4
	adds r0, r2, r7
	strb r1, [r0]
	ldr r2, [r5]
	movs r0, #0xb4
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0x20
	strh r0, [r1]
	movs r1, #0xb5
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r4, [r0]
	ldr r2, [r5]
	movs r1, #0
	cmp r3, #0
	bgt _080CBD36
	movs r1, #5
_080CBD36:
	ldr r4, _080CBDA8
	adds r0, r2, r4
	strh r1, [r0]
	movs r7, #0xb6
	lsls r7, r7, #2
	adds r0, r2, r7
	strh r3, [r0]
	movs r1, #0x38
	cmp r3, #0
	ble _080CBD50
	movs r0, #0x84
	lsls r0, r0, #1
	adds r1, r0, #0
_080CBD50:
	ldr r4, _080CBDAC
	adds r0, r2, r4
	strh r1, [r0]
	movs r1, #0
	cmp r3, #0
	bgt _080CBD5E
	movs r1, #5
_080CBD5E:
	movs r7, #0xb7
	lsls r7, r7, #2
	adds r0, r2, r7
	strh r1, [r0]
	ldr r0, _080CBDB0
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r3, #0xb8
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r0, #2
	strh r0, [r1]
	ldr r4, _080CBDB4
	adds r0, r2, r4
	mov r7, r8
	strb r7, [r0]
	ldr r0, [r5]
	ldr r1, _080CBDB8
	adds r0, r0, r1
	strb r6, [r0]
	ldr r0, [r5]
	ldr r3, _080CBDBC
	adds r0, r0, r3
	movs r1, #0
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CBD9C: .4byte 0x020399A8
_080CBDA0: .4byte 0x000002CE
_080CBDA4: .4byte 0x000002D3
_080CBDA8: .4byte 0x000002D6
_080CBDAC: .4byte 0x000002DA
_080CBDB0: .4byte 0x000002DE
_080CBDB4: .4byte 0x00000A64
_080CBDB8: .4byte 0x00000A65
_080CBDBC: .4byte 0x00000A63
	thumb_func_end SetUpScrollToBox

	thumb_func_start ScrollToBox
ScrollToBox: @ 0x080CBDC0
	push {r4, r5, r6, lr}
	ldr r4, _080CBDDC
	ldr r1, [r4]
	ldr r5, _080CBDE0
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CBE08
	cmp r0, #1
	bgt _080CBDE4
	cmp r0, #0
	beq _080CBDEA
	b _080CBE98
	.align 2, 0
_080CBDDC: .4byte 0x020399A8
_080CBDE0: .4byte 0x00000A63
_080CBDE4:
	cmp r0, #2
	beq _080CBE58
	b _080CBE98
_080CBDEA:
	ldr r2, _080CBE4C
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl LoadWallpaperGfx
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080CBE08:
	bl WaitForWallpaperGfxLoad
	cmp r0, #0
	beq _080CBEA6
	ldr r6, _080CBE50
	ldr r1, [r6]
	ldr r4, _080CBE4C
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r5, _080CBE54
	adds r1, r1, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_080CAD40
	ldr r1, [r6]
	adds r4, r1, r4
	ldrb r0, [r4]
	adds r1, r1, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_080CC57C
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080CC934
	b _080CBE98
	.align 2, 0
_080CBE4C: .4byte 0x00000A64
_080CBE50: .4byte 0x020399A8
_080CBE54: .4byte 0x00000A65
_080CBE58:
	bl sub_080CADF8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, [r4]
	movs r4, #0xb4
	lsls r4, r4, #2
	adds r3, r2, r4
	ldrh r0, [r3]
	cmp r0, #0
	beq _080CBE94
	movs r0, #0xb3
	lsls r0, r0, #2
	adds r1, r2, r0
	subs r4, #2
	adds r0, r2, r4
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080CBEA6
	bl sub_080CC76C
	bl sub_080CC9D4
_080CBE94:
	adds r0, r5, #0
	b _080CBEA8
_080CBE98:
	ldr r0, _080CBEB0
	ldr r1, [r0]
	ldr r4, _080CBEB4
	adds r1, r1, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080CBEA6:
	movs r0, #1
_080CBEA8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080CBEB0: .4byte 0x020399A8
_080CBEB4: .4byte 0x00000A63
	thumb_func_end ScrollToBox

	thumb_func_start sub_080CBEB8
sub_080CBEB8: @ 0x080CBEB8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0
	cmp r1, r4
	beq _080CBEE2
_080CBECC:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xd
	bls _080CBED8
	movs r1, #0
_080CBED8:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r1, r4
	bne _080CBECC
_080CBEE2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, #6
	bhi _080CBEEC
	movs r0, #1
_080CBEEC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CBEB8

	thumb_func_start SetWallpaperForCurrentBox
SetWallpaperForCurrentBox: @ 0x080CBEF4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl SetBoxWallpaper
	ldr r0, _080CBF1C
	ldr r0, [r0]
	ldr r1, _080CBF20
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBF1C: .4byte 0x020399A8
_080CBF20: .4byte 0x00000A62
	thumb_func_end SetWallpaperForCurrentBox

	thumb_func_start DoWallpaperGfxChange
DoWallpaperGfxChange: @ 0x080CBF24
	push {r4, lr}
	sub sp, #4
	ldr r1, _080CBF44
	ldr r0, [r1]
	ldr r2, _080CBF48
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #4
	bhi _080CC008
	lsls r0, r0, #2
	ldr r1, _080CBF4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CBF44: .4byte 0x020399A8
_080CBF48: .4byte 0x00000A62
_080CBF4C: .4byte 0x080CBF50
_080CBF50: @ jump table
	.4byte _080CBF64 @ case 0
	.4byte _080CBF8C @ case 1
	.4byte _080CBFA6 @ case 2
	.4byte _080CBFE0 @ case 3
	.4byte _080CC004 @ case 4
_080CBF64:
	ldr r0, [r4]
	movs r1, #0xe7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080CBF84
	str r1, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldr r2, _080CBF88
	adds r1, r1, r2
	b _080CBFF2
	.align 2, 0
_080CBF84: .4byte 0x0000FFFF
_080CBF88: .4byte 0x00000A62
_080CBF8C:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CC008
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl LoadWallpaperGfx
	b _080CBFEA
_080CBFA6:
	bl WaitForWallpaperGfxLoad
	cmp r0, #1
	bne _080CC008
	bl sub_080CC828
	ldr r4, _080CBFD4
	ldr r0, [r4]
	movs r1, #0xe7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080CBFD8
	str r1, [sp]
	movs r1, #1
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldr r2, _080CBFDC
	adds r1, r1, r2
	b _080CBFF2
	.align 2, 0
_080CBFD4: .4byte 0x020399A8
_080CBFD8: .4byte 0x0000FFFF
_080CBFDC: .4byte 0x00000A62
_080CBFE0:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CC008
_080CBFEA:
	ldr r0, _080CBFFC
	ldr r1, [r0]
	ldr r0, _080CC000
	adds r1, r1, r0
_080CBFF2:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080CC008
	.align 2, 0
_080CBFFC: .4byte 0x020399A8
_080CC000: .4byte 0x00000A62
_080CC004:
	movs r0, #0
	b _080CC00A
_080CC008:
	movs r0, #1
_080CC00A:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DoWallpaperGfxChange

	thumb_func_start LoadWallpaperGfx
LoadWallpaperGfx: @ 0x080CC014
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _080CC0C8
	ldr r2, [r4]
	ldr r3, _080CC0CC
	adds r2, r2, r3
	movs r3, #0
	strb r3, [r2]
	ldr r2, [r4]
	ldr r3, _080CC0D0
	adds r2, r2, r3
	strb r0, [r2]
	ldr r0, [r4]
	ldr r2, _080CC0D4
	adds r0, r0, r2
	strb r1, [r0]
	ldr r1, [r4]
	adds r2, r1, r2
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080CC05A
	movs r3, #0
	ldr r0, _080CC0D8
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #0
	bne _080CC04E
	movs r3, #1
_080CC04E:
	strb r3, [r2]
	ldr r0, [r4]
	ldr r1, _080CC0DC
	adds r0, r0, r1
	bl sub_080CC354
_080CC05A:
	ldr r7, _080CC0C8
	ldr r0, [r7]
	ldr r2, _080CC0D0
	adds r0, r0, r2
	ldrb r0, [r0]
	bl GetBoxWallpaper
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x10
	beq _080CC138
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080CC0E0
	adds r6, r0, r1
	ldr r0, [r6, #4]
	ldr r1, [r7]
	ldr r5, _080CC0E4
	adds r1, r1, r5
	bl LZ77UnCompWram
	ldr r0, [r7]
	adds r5, r0, r5
	ldr r4, _080CC0D4
	adds r1, r0, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r3, _080CC0D8
	adds r0, r0, r3
	ldrb r2, [r0]
	adds r0, r5, #0
	bl sub_080CC2B0
	ldr r1, [r7]
	adds r4, r1, r4
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080CC0E8
	ldr r0, [r6, #8]
	ldr r2, _080CC0D8
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x15
	movs r3, #0x80
	lsls r3, r3, #0xf
	adds r1, r1, r3
	lsrs r1, r1, #0x10
	movs r2, #0x40
	bl LoadPalette
	b _080CC0FC
	.align 2, 0
_080CC0C8: .4byte 0x020399A8
_080CC0CC: .4byte 0x000006F9
_080CC0D0: .4byte 0x000006FA
_080CC0D4: .4byte 0x000006FB
_080CC0D8: .4byte 0x000002D2
_080CC0DC: .4byte 0x00004AC4
_080CC0E0: .4byte 0x08551868
_080CC0E4: .4byte 0x00000792
_080CC0E8:
	ldr r0, [r6, #8]
	ldr r2, _080CC128
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #6
	ldr r2, _080CC12C
	adds r1, r1, r2
	movs r2, #0x20
	bl CpuSet
_080CC0FC:
	ldr r0, [r6]
	mov r1, sp
	bl malloc_and_decompress
	adds r1, r0, #0
	ldr r0, _080CC130
	ldr r3, [r0]
	ldr r2, _080CC134
	adds r0, r3, r2
	str r1, [r0]
	ldr r2, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080CC128
	adds r3, r3, r0
	ldrb r3, [r3]
	lsls r3, r3, #8
	movs r0, #2
	bl LoadBgTiles
	b _080CC24E
	.align 2, 0
_080CC128: .4byte 0x000002D2
_080CC12C: .4byte 0x02037434
_080CC130: .4byte 0x020399A8
_080CC134: .4byte 0x00000A68
_080CC138:
	bl sub_080D1D48
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080CC1BC
	adds r6, r1, r0
	ldr r0, [r6, #4]
	ldr r1, [r7]
	ldr r4, _080CC1C0
	adds r1, r1, r4
	bl LZ77UnCompWram
	ldr r2, [r7]
	adds r0, r2, r4
	ldr r5, _080CC1C4
	adds r1, r2, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r3, _080CC1C8
	adds r2, r2, r3
	ldrb r2, [r2]
	bl sub_080CC2B0
	ldr r0, [r6, #8]
	ldr r1, [r7]
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuSet
	bl sub_080D1DB0
	ldr r1, [r7]
	ldr r2, _080CC1CC
	adds r1, r1, r2
	movs r2, #2
	bl CpuSet
	bl sub_080D1DB0
	ldr r1, [r7]
	ldr r3, _080CC1D0
	adds r1, r1, r3
	movs r2, #2
	bl CpuSet
	ldr r1, [r7]
	adds r5, r1, r5
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080CC1D4
	adds r0, r1, r4
	ldr r2, _080CC1C8
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x15
	movs r3, #0x80
	lsls r3, r3, #0xf
	adds r1, r1, r3
	lsrs r1, r1, #0x10
	movs r2, #0x40
	bl LoadPalette
	b _080CC1EA
	.align 2, 0
_080CC1BC: .4byte 0x08555A40
_080CC1C0: .4byte 0x00000792
_080CC1C4: .4byte 0x000006FB
_080CC1C8: .4byte 0x000002D2
_080CC1CC: .4byte 0x00000794
_080CC1D0: .4byte 0x000007B4
_080CC1D4:
	ldr r2, _080CC25C
	adds r0, r1, r2
	ldr r3, _080CC260
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #6
	ldr r2, _080CC264
	adds r1, r1, r2
	movs r2, #0x20
	bl CpuSet
_080CC1EA:
	ldr r0, [r6]
	mov r1, sp
	bl malloc_and_decompress
	ldr r6, _080CC268
	ldr r1, [r6]
	ldr r5, _080CC26C
	adds r1, r1, r5
	str r0, [r1]
	ldr r4, _080CC270
	bl GetWaldaWallpaperIconId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	add r1, sp, #4
	bl malloc_and_decompress
	adds r4, r0, #0
	ldr r0, [r6]
	adds r0, r0, r5
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r2, [sp, #4]
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r2, r0
	adds r0, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl Free
	ldr r0, [r6]
	adds r5, r0, r5
	ldr r1, [r5]
	ldr r2, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _080CC260
	adds r0, r0, r3
	ldrb r3, [r0]
	lsls r3, r3, #8
	movs r0, #2
	bl LoadBgTiles
_080CC24E:
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC25C: .4byte 0x00000792
_080CC260: .4byte 0x000002D2
_080CC264: .4byte 0x02037434
_080CC268: .4byte 0x020399A8
_080CC26C: .4byte 0x00000A68
_080CC270: .4byte 0x08555B00
	thumb_func_end LoadWallpaperGfx

	thumb_func_start WaitForWallpaperGfxLoad
WaitForWallpaperGfxLoad: @ 0x080CC274
	push {r4, r5, lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _080CC286
	movs r0, #0
	b _080CC2A2
_080CC286:
	ldr r5, _080CC2A8
	ldr r0, [r5]
	ldr r1, _080CC2AC
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080CC2A0
	bl Free
	ldr r0, [r5]
	ldr r1, _080CC2AC
	adds r0, r0, r1
	str r4, [r0]
_080CC2A0:
	movs r0, #1
_080CC2A2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080CC2A8: .4byte 0x020399A8
_080CC2AC: .4byte 0x00000A68
	thumb_func_end WaitForWallpaperGfxLoad

	thumb_func_start sub_080CC2B0
sub_080CC2B0: @ 0x080CC2B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r4, r2, #0x11
	ldr r0, _080CC320
	ldr r0, [r0]
	movs r3, #0xb3
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrh r3, [r0]
	lsrs r3, r3, #3
	adds r3, #0xa
	lsls r1, r1, #0x18
	asrs r7, r1, #0x18
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r6, r3, r0
	movs r0, #0x3f
	ands r6, r0
	movs r3, #0x14
	str r3, [sp]
	movs r1, #0x12
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r0, #0x11
	str r0, [sp, #0x18]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x10
	str r2, [sp, #0x1c]
	movs r0, #0xc0
	lsls r0, r0, #0xa
	adds r4, r4, r0
	asrs r4, r4, #0x10
	str r4, [sp, #0x20]
	movs r0, #2
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl CopyRectToBgTilemapBufferRect
	cmp r7, #0
	beq _080CC346
	cmp r7, #0
	ble _080CC324
	lsls r0, r6, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	b _080CC32A
	.align 2, 0
_080CC320: .4byte 0x020399A8
_080CC324:
	lsls r0, r6, #0x10
	ldr r3, _080CC350
	adds r0, r0, r3
_080CC32A:
	lsrs r6, r0, #0x10
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	movs r0, #4
	str r0, [sp]
	movs r0, #0x12
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #0
	movs r3, #2
	bl FillBgTilemapBufferRect
_080CC346:
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC350: .4byte 0xFFFC0000
	thumb_func_end sub_080CC2B0

	thumb_func_start sub_080CC354
sub_080CC354: @ 0x080CC354
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _080CC380
	ldr r0, [r0]
	movs r1, #0xb3
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r0, r0, #3
	adds r3, r0, #0
	adds r3, #0x1e
	movs r0, #0x3f
	ands r3, r0
	adds r0, r3, #0
	cmp r0, #0x1f
	bgt _080CC384
	lsls r0, r0, #1
	movs r6, #0x98
	lsls r6, r6, #3
	adds r0, r0, r6
	b _080CC38C
	.align 2, 0
_080CC380: .4byte 0x020399A8
_080CC384:
	lsls r0, r0, #1
	movs r1, #0xc8
	lsls r1, r1, #4
	adds r0, r0, r1
_080CC38C:
	adds r2, r2, r0
	movs r0, #0
	movs r5, #0
	movs r4, #0x3f
_080CC394:
	strh r5, [r2]
	adds r2, #2
	adds r3, #1
	ands r3, r4
	adds r1, r3, #0
	cmp r1, #0
	bne _080CC3A6
	ldr r6, _080CC3C0
	adds r2, r2, r6
_080CC3A6:
	cmp r1, #0x20
	bne _080CC3B0
	movs r1, #0xf8
	lsls r1, r1, #3
	adds r2, r2, r1
_080CC3B0:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x2b
	bls _080CC394
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CC3C0: .4byte 0xFFFFF7C0
	thumb_func_end sub_080CC354

	thumb_func_start sub_080CC3C4
sub_080CC3C4: @ 0x080CC3C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov r8, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _080CC550
	mov sl, r1
	ldr r1, [r1]
	movs r2, #0xbe
	lsls r2, r2, #2
	adds r0, r1, r2
	str r0, [sp, #0x24]
	mov r3, sp
	adds r3, #0x24
	str r3, [sp, #0x2c]
	ldr r0, _080CC554
	str r0, [r3, #4]
	ldr r4, _080CC558
	adds r1, r1, r4
	str r1, [sp, #0x14]
	add r0, sp, #0x18
	ldr r7, _080CC55C
	strh r7, [r0]
	add r0, sp, #0x1c
	movs r1, #0
	movs r2, #8
	bl memset
	add r1, sp, #0x14
	add r0, sp, #4
	movs r2, #0x10
	bl memcpy
	mov r0, r8
	bl GetBoxWallpaper
	lsls r0, r0, #0x18
	mov r5, sl
	ldr r4, [r5]
	ldr r2, _080CC560
	lsrs r0, r0, #0x16
	adds r1, r0, r2
	ldrh r3, [r1]
	movs r5, #0xe3
	lsls r5, r5, #3
	adds r1, r4, r5
	strh r3, [r1]
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _080CC564
	adds r4, r4, r1
	strh r0, [r4]
	add r0, sp, #4
	bl LoadSpritePalettes
	mov r2, sl
	ldr r0, [r2]
	movs r6, #0xe7
	lsls r6, r6, #3
	adds r0, r0, r6
	movs r1, #0xfc
	lsls r1, r1, #2
	str r1, [r0]
	adds r0, r7, #0
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, sl
	ldr r3, [r4]
	lsls r1, r0, #4
	movs r5, #0x87
	lsls r5, r5, #1
	mov sb, r5
	add r1, sb
	ldr r4, _080CC568
	adds r2, r3, r4
	strh r1, [r2]
	adds r3, r3, r6
	movs r5, #0x80
	lsls r5, r5, #9
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r0, r7, #0
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sl
	ldr r4, [r1]
	lsls r1, r0, #4
	add r1, sb
	ldr r3, _080CC56C
	adds r2, r4, r3
	strh r1, [r2]
	adds r6, r4, r6
	lsls r5, r0
	ldr r0, [r6]
	orrs r0, r5
	str r0, [r6]
	ldr r5, _080CC570
	adds r4, r4, r5
	mov r0, r8
	bl GetBoxNamePtr
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #8
	bl StringCopyPadded
	mov r4, sl
	ldr r0, [r4]
	adds r5, r0, r5
	movs r2, #0xbe
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r3, #0x9f
	lsls r3, r3, #3
	adds r0, r0, r3
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_080C66A4
	ldr r0, [sp, #0x2c]
	bl LoadSpriteSheet
	mov r0, r8
	bl GetBoxNamePtr
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetWaldaWallpaperColorsPtr
	movs r4, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
_080CC4F0:
	lsls r1, r4, #5
	adds r1, r6, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080CC574
	movs r2, #0x1c
	movs r3, #0x18
	bl CreateSprite
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r5, _080CC550
	ldr r2, [r5]
	lsls r0, r4, #2
	movs r3, #0xe4
	lsls r3, r3, #3
	adds r2, r2, r3
	adds r2, r2, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080CC578
	adds r0, r0, r1
	str r0, [r2]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	bls _080CC4F0
	ldr r0, [r5]
	movs r4, #0xdf
	lsls r4, r4, #3
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC550: .4byte 0x020399A8
_080CC554: .4byte 0x00030200
_080CC558: .4byte 0x000006FC
_080CC55C: .4byte 0x0000DAC9
_080CC560: .4byte 0x08551824
_080CC564: .4byte 0x0000071A
_080CC568: .4byte 0x0000071C
_080CC56C: .4byte 0x0000071E
_080CC570: .4byte 0x000021B8
_080CC574: .4byte 0x08555BA4
_080CC578: .4byte 0x020205AC
	thumb_func_end sub_080CC3C4

	thumb_func_start sub_080CC57C
sub_080CC57C: @ 0x080CC57C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	ldr r4, _080CC5F8
	ldr r2, [r4]
	movs r1, #0xbe
	lsls r1, r1, #2
	adds r0, r2, r1
	str r0, [sp, #0x1c]
	add r3, sp, #0x1c
	ldr r5, _080CC5FC
	mov ip, r5
	movs r6, #0xc0
	lsls r6, r6, #0xa
	mov sb, r6
	ldr r0, _080CC600
	str r0, [r3, #4]
	add r1, sp, #4
	ldr r0, _080CC604
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	movs r1, #0
	movs r5, #0xdf
	lsls r5, r5, #3
	adds r2, r2, r5
	ldrb r0, [r2]
	mov r8, r4
	adds r6, r3, #0
	cmp r0, #0
	bne _080CC5D0
	movs r1, #1
_080CC5D0:
	strb r1, [r2]
	mov r7, r8
	ldr r0, [r7]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC60C
	ldr r0, [r6, #4]
	mov r1, ip
	ands r0, r1
	mov r2, sb
	orrs r0, r2
	str r0, [r6, #4]
	ldr r0, [r7]
	ldr r3, _080CC608
	adds r0, r0, r3
	ldrh r0, [r0]
	mov sb, r0
	b _080CC630
	.align 2, 0
_080CC5F8: .4byte 0x020399A8
_080CC5FC: .4byte 0x0000FFFF
_080CC600: .4byte 0x00030200
_080CC604: .4byte 0x08555BA4
_080CC608: .4byte 0x0000071C
_080CC60C:
	ldr r0, [r6, #4]
	mov r5, ip
	ands r0, r5
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r6, #4]
	mov r7, r8
	ldr r0, [r7]
	ldr r1, _080CC750
	adds r0, r0, r1
	ldrh r0, [r0]
	mov sb, r0
	add r1, sp, #4
	movs r0, #4
	strh r0, [r1]
	ldr r0, _080CC754
	strh r0, [r1, #2]
_080CC630:
	mov r2, r8
	ldr r4, [r2]
	ldr r5, _080CC758
	adds r4, r4, r5
	ldr r0, [sp, #0x28]
	bl GetBoxNamePtr
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #8
	bl StringCopyPadded
	mov r3, r8
	ldr r0, [r3]
	adds r5, r0, r5
	movs r7, #0xbe
	lsls r7, r7, #2
	adds r1, r0, r7
	movs r2, #0x9f
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_080C66A4
	adds r0, r6, #0
	bl LoadSpriteSheet
	ldr r0, [sp, #0x28]
	bl GetBoxWallpaper
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, _080CC75C
	adds r0, r0, r1
	mov r1, sb
	movs r2, #4
	bl LoadPalette
	ldr r0, [sp, #0x28]
	bl GetBoxNamePtr
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetWaldaWallpaperColorsPtr
	lsls r0, r0, #0x10
	mov r3, sl
	lsls r2, r3, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #6
	lsrs r5, r0, #0x10
	str r5, [sp, #0x24]
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	movs r7, #0
	mov sb, r8
	rsbs r2, r2, #0
	mov r8, r2
_080CC6BA:
	lsls r6, r7, #5
	mov r0, sl
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add r0, sp, #4
	movs r2, #0x1c
	movs r3, #0x18
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	ldr r2, [r1]
	lsls r5, r7, #2
	movs r3, #0xe5
	lsls r3, r3, #3
	adds r2, r2, r3
	adds r2, r2, r5
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080CC760
	adds r1, r1, r0
	str r1, [r2]
	mov r0, r8
	lsls r4, r0, #1
	add r4, r8
	lsls r4, r4, #1
	strh r4, [r1, #0x2e]
	ldr r1, [r2]
	ldr r3, [sp, #0x24]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r6
	strh r0, [r1, #0x30]
	ldr r0, [r2]
	movs r6, #0
	strh r6, [r0, #0x32]
	ldr r0, [r2]
	ldr r1, _080CC764
	str r1, [r0, #0x1c]
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	mov r1, sb
	ldr r0, [r1]
	movs r2, #0xe4
	lsls r2, r2, #3
	adds r0, r0, r2
	adds r0, r0, r5
	ldr r1, [r0]
	strh r4, [r1, #0x2e]
	ldr r2, [r0]
	movs r1, #1
	strh r1, [r2, #0x30]
	ldr r1, [r0]
	ldr r0, _080CC768
	str r0, [r1, #0x1c]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #1
	bls _080CC6BA
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC750: .4byte 0x0000071C
_080CC754: .4byte 0x0000DAC9
_080CC758: .4byte 0x000021B8
_080CC75C: .4byte 0x08551824
_080CC760: .4byte 0x020205AC
_080CC764: .4byte 0x080CC7BD
_080CC768: .4byte 0x080CC7F1
	thumb_func_end sub_080CC57C

	thumb_func_start sub_080CC76C
sub_080CC76C: @ 0x080CC76C
	push {lr}
	ldr r0, _080CC788
	ldr r0, [r0]
	movs r1, #0xdf
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC78C
	movs r0, #4
	bl FreeSpriteTilesByTag
	b _080CC792
	.align 2, 0
_080CC788: .4byte 0x020399A8
_080CC78C:
	movs r0, #3
	bl FreeSpriteTilesByTag
_080CC792:
	ldr r0, _080CC7B4
	ldr r0, [r0]
	movs r3, #0xe4
	lsls r3, r3, #3
	adds r2, r0, r3
	adds r3, #8
	adds r1, r0, r3
	ldr r1, [r1]
	str r1, [r2]
	ldr r2, _080CC7B8
	adds r1, r0, r2
	adds r3, #4
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080CC7B4: .4byte 0x020399A8
_080CC7B8: .4byte 0x00000724
	thumb_func_end sub_080CC76C

	thumb_func_start sub_080CC7BC
sub_080CC7BC: @ 0x080CC7BC
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x32]
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _080CC7D0
	subs r0, r1, #1
	strh r0, [r2, #0x32]
	b _080CC7E8
_080CC7D0:
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x20]
	adds r0, r0, r1
	strh r0, [r2, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x30
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne _080CC7E8
	ldr r0, _080CC7EC
	str r0, [r2, #0x1c]
_080CC7E8:
	pop {r0}
	bx r0
	.align 2, 0
_080CC7EC: .4byte 0x08007141
	thumb_func_end sub_080CC7BC

	thumb_func_start sub_080CC7F0
sub_080CC7F0: @ 0x080CC7F0
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x30]
	movs r3, #0x30
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _080CC804
	subs r0, r1, #1
	strh r0, [r2, #0x30]
	b _080CC822
_080CC804:
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x20]
	adds r0, r0, r1
	strh r0, [r2, #0x20]
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x32]
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc0
	bls _080CC822
	adds r0, r2, #0
	bl DestroySprite
_080CC822:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CC7F0

	thumb_func_start sub_080CC828
sub_080CC828: @ 0x080CC828
	push {lr}
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBoxWallpaper
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080CC864
	ldr r2, [r0]
	movs r3, #0xdf
	lsls r3, r3, #3
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC870
	lsls r0, r1, #2
	ldr r1, _080CC868
	adds r0, r0, r1
	adds r3, #0x24
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, r1, #1
	ldr r2, _080CC86C
	adds r1, r1, r2
	movs r2, #2
	bl CpuSet
	b _080CC888
	.align 2, 0
_080CC864: .4byte 0x020399A8
_080CC868: .4byte 0x08551824
_080CC86C: .4byte 0x020373B4
_080CC870:
	lsls r0, r1, #2
	ldr r1, _080CC88C
	adds r0, r0, r1
	ldr r3, _080CC890
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, r1, #1
	ldr r2, _080CC894
	adds r1, r1, r2
	movs r2, #2
	bl CpuSet
_080CC888:
	pop {r0}
	bx r0
	.align 2, 0
_080CC88C: .4byte 0x08551824
_080CC890: .4byte 0x0000071E
_080CC894: .4byte 0x020373B4
	thumb_func_end sub_080CC828

	thumb_func_start GetWaldaWallpaperColorsPtr
GetWaldaWallpaperColorsPtr: @ 0x080CC898
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xe
	movs r0, #0xb0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bx lr
	thumb_func_end GetWaldaWallpaperColorsPtr

	thumb_func_start sub_080CC8A8
sub_080CC8A8: @ 0x080CC8A8
	push {r4, r5, lr}
	ldr r0, _080CC924
	bl LoadSpriteSheet
	movs r5, #0
_080CC8B2:
	lsls r1, r5, #4
	adds r1, r1, r5
	lsls r1, r1, #0x13
	movs r0, #0xb8
	lsls r0, r0, #0xf
	adds r1, r1, r0
	asrs r1, r1, #0x10
	ldr r0, _080CC928
	movs r2, #0x1c
	movs r3, #0x16
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _080CC904
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080CC92C
	adds r4, r0, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	movs r0, #1
	cmp r5, #0
	bne _080CC8F2
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
_080CC8F2:
	strh r0, [r4, #0x34]
	ldr r0, _080CC930
	ldr r0, [r0]
	lsls r1, r5, #2
	movs r2, #0xe6
	lsls r2, r2, #3
	adds r0, r0, r2
	adds r0, r0, r1
	str r4, [r0]
_080CC904:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #1
	bls _080CC8B2
	bl IsCursorOnBox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CC91E
	movs r0, #1
	bl sub_080CCA24
_080CC91E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CC924: .4byte 0x08555B7C
_080CC928: .4byte 0x08555BDC
_080CC92C: .4byte 0x020205AC
_080CC930: .4byte 0x020399A8
	thumb_func_end sub_080CC8A8

	thumb_func_start sub_080CC934
sub_080CC934: @ 0x080CC934
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r2, #0
	ldr r7, _080CC988
	mov ip, r7
	movs r6, #0xe6
	lsls r6, r6, #3
	movs r4, #0
	movs r3, #2
_080CC948:
	mov r0, ip
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r1, r1, r6
	adds r1, r1, r0
	ldr r0, [r1]
	strh r4, [r0, #0x24]
	ldr r0, [r1]
	strh r3, [r0, #0x2e]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #1
	bls _080CC948
	lsls r0, r5, #0x18
	cmp r0, #0
	bge _080CC990
	ldr r1, [r7]
	movs r2, #0xe6
	lsls r2, r2, #3
	adds r3, r1, r2
	ldr r2, [r3]
	movs r0, #0x1d
	strh r0, [r2, #0x30]
	ldr r0, _080CC98C
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #5
	strh r0, [r2, #0x30]
	ldr r0, [r3]
	movs r2, #0x48
	b _080CC9AC
	.align 2, 0
_080CC988: .4byte 0x020399A8
_080CC98C: .4byte 0x00000734
_080CC990:
	ldr r1, [r7]
	movs r2, #0xe6
	lsls r2, r2, #3
	adds r3, r1, r2
	ldr r2, [r3]
	movs r0, #5
	strh r0, [r2, #0x30]
	ldr r0, _080CC9D0
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0x1d
	strh r0, [r2, #0x30]
	ldr r0, [r3]
	movs r2, #0xf8
_080CC9AC:
	strh r2, [r0, #0x32]
	ldr r0, [r1]
	strh r2, [r0, #0x32]
	ldr r1, [r7]
	movs r2, #0xe6
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r2, [r0]
	movs r0, #0
	strh r0, [r2, #0x3c]
	ldr r0, _080CC9D0
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #1
	strh r0, [r1, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC9D0: .4byte 0x00000734
	thumb_func_end sub_080CC934

	thumb_func_start sub_080CC9D4
sub_080CC9D4: @ 0x080CC9D4
	push {r4, r5, r6, lr}
	movs r3, #0
	movs r5, #0
	movs r6, #5
	rsbs r6, r6, #0
	ldr r4, _080CCA20
_080CC9E0:
	ldr r1, [r4]
	lsls r0, r3, #2
	movs r2, #0xe6
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r2, [r1]
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, #0x5c
	strh r0, [r2, #0x20]
	ldr r0, [r1]
	strh r5, [r0, #0x24]
	ldr r1, [r1]
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _080CC9E0
	movs r0, #1
	bl sub_080CCA24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCA20: .4byte 0x020399A8
	thumb_func_end sub_080CC9D4

	thumb_func_start sub_080CCA24
sub_080CCA24: @ 0x080CCA24
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CCA60
	movs r2, #0
	ldr r6, _080CCA5C
	movs r5, #0xe6
	lsls r5, r5, #3
	movs r3, #0
	movs r4, #1
_080CCA38:
	ldr r1, [r6]
	lsls r0, r2, #2
	adds r1, r1, r5
	adds r1, r1, r0
	ldr r0, [r1]
	strh r4, [r0, #0x2e]
	ldr r0, [r1]
	strh r3, [r0, #0x30]
	ldr r0, [r1]
	strh r3, [r0, #0x32]
	ldr r0, [r1]
	strh r3, [r0, #0x36]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #1
	bls _080CCA38
	b _080CCA80
	.align 2, 0
_080CCA5C: .4byte 0x020399A8
_080CCA60:
	movs r2, #0
	ldr r5, _080CCA88
	movs r4, #0xe6
	lsls r4, r4, #3
	movs r3, #0
_080CCA6A:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r4
	adds r0, r0, r1
	ldr r0, [r0]
	strh r3, [r0, #0x2e]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #1
	bls _080CCA6A
_080CCA80:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCA88: .4byte 0x020399A8
	thumb_func_end sub_080CCA24

	thumb_func_start sub_080CCA8C
sub_080CCA8C: @ 0x080CCA8C
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #4
	bhi _080CCB58
	lsls r0, r0, #2
	ldr r1, _080CCAA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CCAA4: .4byte 0x080CCAA8
_080CCAA8: @ jump table
	.4byte _080CCABC @ case 0
	.4byte _080CCAC2 @ case 1
	.4byte _080CCAF0 @ case 2
	.4byte _080CCAF6 @ case 3
	.4byte _080CCB48 @ case 4
_080CCABC:
	movs r0, #0
	strh r0, [r2, #0x24]
	b _080CCB58
_080CCAC2:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	movs r1, #0
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _080CCB58
	strh r1, [r2, #0x30]
	ldrh r0, [r2, #0x34]
	ldrh r3, [r2, #0x24]
	adds r0, r0, r3
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x32]
	adds r0, #1
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _080CCB58
	strh r1, [r2, #0x32]
	strh r1, [r2, #0x24]
	b _080CCB58
_080CCAF0:
	movs r0, #3
	strh r0, [r2, #0x2e]
	b _080CCB58
_080CCAF6:
	ldr r0, _080CCB40
	ldr r1, [r0]
	ldr r0, _080CCB44
	adds r1, r1, r0
	ldrh r0, [r2, #0x20]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r2, #0x20]
	subs r0, #0x49
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xae
	bls _080CCB1C
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
_080CCB1C:
	ldrh r0, [r2, #0x30]
	subs r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080CCB58
	ldrh r0, [r2, #0x32]
	strh r0, [r2, #0x20]
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	movs r0, #4
	strh r0, [r2, #0x2e]
	b _080CCB58
	.align 2, 0
_080CCB40: .4byte 0x020399A8
_080CCB44: .4byte 0x000002CE
_080CCB48:
	ldr r0, _080CCB5C
	ldr r0, [r0]
	ldr r1, _080CCB60
	adds r0, r0, r1
	ldrh r1, [r2, #0x20]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r2, #0x20]
_080CCB58:
	pop {r0}
	bx r0
	.align 2, 0
_080CCB5C: .4byte 0x020399A8
_080CCB60: .4byte 0x000002CE
	thumb_func_end sub_080CCA8C

	thumb_func_start sub_080CCB64
sub_080CCB64: @ 0x080CCB64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, [sp, #0x18]
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080CCBD0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _080CCBDC
	movs r1, #1
	ands r1, r7
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r5, _080CCBD4
	adds r6, r4, r5
	adds r0, r6, #0
	bl StartSpriteAnim
	movs r0, #3
	mov r1, r8
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r6, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #5]
	adds r5, #0x1c
	adds r4, r4, r5
	ldr r0, _080CCBD8
	str r0, [r4]
	adds r0, r6, #0
	b _080CCBDE
	.align 2, 0
_080CCBD0: .4byte 0x08555BDC
_080CCBD4: .4byte 0x020205AC
_080CCBD8: .4byte 0x08007141
_080CCBDC:
	movs r0, #0
_080CCBDE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080CCB64

	thumb_func_start sub_080CCBE8
sub_080CCBE8: @ 0x080CCBE8
	push {lr}
	ldr r0, _080CCBFC
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	cmp r1, #1
	beq _080CCC04
	ldr r1, _080CCC00
	movs r0, #0
	strb r0, [r1]
	b _080CCC08
	.align 2, 0
_080CCBFC: .4byte 0x020399A8
_080CCC00: .4byte 0x02039A18
_080CCC04:
	ldr r0, _080CCC44
	strb r1, [r0]
_080CCC08:
	ldr r0, _080CCC48
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080CCC4C
	strb r1, [r0]
	ldr r0, _080CCC50
	strb r1, [r0]
	ldr r0, _080CCC54
	strb r1, [r0]
	ldr r0, _080CCC58
	strb r1, [r0]
	bl sub_080CD488
	bl sub_080CF490
	ldr r2, _080CCC5C
	ldr r0, [r2]
	ldr r1, _080CCC60
	adds r0, r0, r1
	movs r3, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _080CCC64
	adds r0, r0, r1
	strb r3, [r0]
	bl sub_080CE3BC
	pop {r0}
	bx r0
	.align 2, 0
_080CCC44: .4byte 0x02039A18
_080CCC48: .4byte 0x02039A19
_080CCC4C: .4byte 0x02039A1A
_080CCC50: .4byte 0x02039A1B
_080CCC54: .4byte 0x02039A1C
_080CCC58: .4byte 0x02039A1D
_080CCC5C: .4byte 0x020399A8
_080CCC60: .4byte 0x00000CD6
_080CCC64: .4byte 0x000021FF
	thumb_func_end sub_080CCBE8

	thumb_func_start sub_080CCC68
sub_080CCC68: @ 0x080CCC68
	push {lr}
	bl sub_080CF490
	bl sub_080CE458
	ldr r3, _080CCCA8
	ldr r0, [r3]
	ldr r1, _080CCCAC
	adds r0, r0, r1
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r3]
	ldr r1, _080CCCB0
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, _080CCCB4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CCCA2
	ldr r0, [r3]
	ldr r1, _080CCCB8
	adds r0, r0, r1
	ldr r1, _080CCCBC
	movs r2, #0x64
	bl memcpy
	bl CreateMovingMonIcon
_080CCCA2:
	pop {r0}
	bx r0
	.align 2, 0
_080CCCA8: .4byte 0x020399A8
_080CCCAC: .4byte 0x00000CD6
_080CCCB0: .4byte 0x000021FF
_080CCCB4: .4byte 0x02039A1A
_080CCCB8: .4byte 0x000020A4
_080CCCBC: .4byte 0x020399B4
	thumb_func_end sub_080CCC68

	thumb_func_start sub_080CCCC0
sub_080CCCC0: @ 0x080CCCC0
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r0, #4
	bhi _080CCD78
	lsls r0, r0, #2
	ldr r1, _080CCCDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CCCDC: .4byte 0x080CCCE0
_080CCCE0: @ jump table
	.4byte _080CCCF4 @ case 0
	.4byte _080CCD22 @ case 1
	.4byte _080CCD4A @ case 2
	.4byte _080CCD52 @ case 3
	.4byte _080CCD70 @ case 4
_080CCCF4:
	adds r0, r5, #0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, #0x64
	strh r1, [r4]
	adds r0, r5, #0
	movs r1, #6
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, #0x20
	strh r1, [r6]
	b _080CCD78
_080CCD22:
	cmp r5, #0
	bne _080CCD2E
	movs r0, #0x68
	strh r0, [r4]
	movs r0, #0x34
	b _080CCD76
_080CCD2E:
	cmp r5, #6
	bne _080CCD3A
	movs r0, #0x98
	strh r0, [r4]
	movs r0, #0x84
	b _080CCD76
_080CCD3A:
	movs r0, #0x98
	strh r0, [r4]
	subs r1, r5, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #4
	b _080CCD76
_080CCD4A:
	movs r0, #0xa2
	strh r0, [r4]
	movs r0, #0xc
	b _080CCD76
_080CCD52:
	ldr r0, _080CCD6C
	ldrb r0, [r0]
	movs r1, #0xe
	cmp r0, #0
	beq _080CCD5E
	movs r1, #8
_080CCD5E:
	strh r1, [r6]
	movs r0, #0x58
	muls r0, r5, r0
	adds r0, #0x78
	strh r0, [r4]
	b _080CCD78
	.align 2, 0
_080CCD6C: .4byte 0x02039A1A
_080CCD70:
	movs r0, #0xa0
	strh r0, [r4]
	movs r0, #0x60
_080CCD76:
	strh r0, [r6]
_080CCD78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CCCC0

	thumb_func_start sub_080CCD80
sub_080CCD80: @ 0x080CCD80
	push {lr}
	ldr r0, _080CCDA8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CCDB4
	cmp r0, #1
	bne _080CCDC8
	ldr r0, _080CCDAC
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080CCDB0
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	b _080CCDBE
	.align 2, 0
_080CCDA8: .4byte 0x02039A18
_080CCDAC: .4byte 0x02039A19
_080CCDB0: .4byte 0x02024190
_080CCDB4:
	ldr r0, _080CCDC4
	ldrb r0, [r0]
	movs r1, #0xb
	bl GetCurrentBoxMonData
_080CCDBE:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _080CCDCA
	.align 2, 0
_080CCDC4: .4byte 0x02039A19
_080CCDC8:
	movs r0, #0
_080CCDCA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CCD80

	thumb_func_start sub_080CCDD0
sub_080CCDD0: @ 0x080CCDD0
	push {r4, r5, r6, r7, lr}
	ldr r7, _080CCDEC
	ldr r5, [r7]
	movs r0, #0xcd
	lsls r0, r0, #4
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _080CCDFA
	ldrb r0, [r5, #1]
	cmp r0, #3
	beq _080CCDF0
	movs r0, #0
	b _080CCF16
	.align 2, 0
_080CCDEC: .4byte 0x020399A8
_080CCDF0:
	bl sub_080D0AB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080CCF16
_080CCDFA:
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080CCEF8
	ldr r1, _080CCEE4
	adds r4, r5, r1
	ldr r2, _080CCEE8
	adds r1, r5, r2
	ldr r0, [r4]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #0xcc
	lsls r0, r0, #4
	adds r3, r5, r0
	adds r2, #4
	adds r1, r5, r2
	ldr r0, [r3]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r3]
	ldr r6, _080CCEEC
	adds r1, r5, r6
	ldr r2, [r1]
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r2, #0x20]
	ldr r2, [r1]
	ldr r0, [r3]
	asrs r0, r0, #8
	strh r0, [r2, #0x22]
	ldr r1, [r1]
	ldrh r2, [r1, #0x20]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r3, #0x80
	lsls r3, r3, #1
	cmp r0, r3
	ble _080CCE56
	ldr r4, _080CCEF0
	adds r0, r2, r4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, #0x40
	strh r0, [r1, #0x20]
_080CCE56:
	ldr r0, [r7]
	adds r0, r0, r6
	ldr r1, [r0]
	ldrh r2, [r1, #0x20]
	movs r4, #0x20
	ldrsh r0, [r1, r4]
	cmp r0, #0x3f
	bgt _080CCE72
	movs r0, #0x40
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, r3, r0
	strh r0, [r1, #0x20]
_080CCE72:
	ldr r0, [r7]
	adds r0, r0, r6
	ldr r1, [r0]
	ldrh r2, [r1, #0x22]
	movs r3, #0x22
	ldrsh r0, [r1, r3]
	cmp r0, #0xb0
	ble _080CCE8E
	adds r0, r2, #0
	subs r0, #0xb0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, #0x10
	strh r0, [r1, #0x22]
_080CCE8E:
	ldr r0, [r7]
	adds r0, r0, r6
	ldr r2, [r0]
	ldrh r3, [r2, #0x22]
	movs r4, #0x22
	ldrsh r0, [r2, r4]
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080CCEAE
	subs r0, r1, r3
	movs r1, #0xb0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r2, #0x22]
_080CCEAE:
	ldr r0, [r7]
	ldr r2, _080CCEF4
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CCF14
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CCF14
	ldr r0, [r7]
	adds r0, r0, r6
	ldr r2, [r0]
	adds r2, #0x3f
	ldrb r3, [r2]
	lsrs r1, r3, #1
	movs r0, #1
	eors r1, r0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _080CCF14
	.align 2, 0
_080CCEE4: .4byte 0x00000CBC
_080CCEE8: .4byte 0x00000CC4
_080CCEEC: .4byte 0x00000CB4
_080CCEF0: .4byte 0xFFFFFF00
_080CCEF4: .4byte 0x00000CD7
_080CCEF8:
	ldr r3, _080CCF1C
	adds r2, r5, r3
	ldr r1, [r2]
	ldr r4, _080CCF20
	adds r0, r5, r4
	ldrh r0, [r0]
	strh r0, [r1, #0x20]
	ldr r1, [r2]
	ldr r2, _080CCF24
	adds r0, r5, r2
	ldrh r0, [r0]
	strh r0, [r1, #0x22]
	bl sub_080CD2E4
_080CCF14:
	movs r0, #1
_080CCF16:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CCF1C: .4byte 0x00000CB4
_080CCF20: .4byte 0x00000CCC
_080CCF24: .4byte 0x00000CCE
	thumb_func_end sub_080CCDD0

	thumb_func_start sub_080CCF28
sub_080CCF28: @ 0x080CCF28
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r6, sp
	adds r6, #2
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	adds r3, r6, #0
	bl sub_080CCCC0
	ldr r1, _080CCF78
	ldr r0, [r1]
	ldr r2, _080CCF7C
	adds r0, r0, r2
	strb r4, [r0]
	ldr r0, [r1]
	ldr r3, _080CCF80
	adds r0, r0, r3
	strb r5, [r0]
	ldr r1, [r1]
	mov r0, sp
	ldrh r2, [r0]
	subs r3, #9
	adds r0, r1, r3
	strh r2, [r0]
	ldrh r0, [r6]
	ldr r2, _080CCF84
	adds r1, r1, r2
	strh r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCF78: .4byte 0x020399A8
_080CCF7C: .4byte 0x00000CD4
_080CCF80: .4byte 0x00000CD5
_080CCF84: .4byte 0x00000CCE
	thumb_func_end sub_080CCF28

	thumb_func_start sub_080CCF88
sub_080CCF88: @ 0x080CCF88
	push {r4, r5, r6, r7, lr}
	ldr r0, _080CCFA4
	ldr r2, [r0]
	ldr r3, _080CCFA8
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _080CCFAC
	movs r0, #0xcd
	lsls r0, r0, #4
	adds r1, r2, r0
	movs r0, #0xc
	b _080CCFB4
	.align 2, 0
_080CCFA4: .4byte 0x020399A8
_080CCFA8: .4byte 0x00000CD2
_080CCFAC:
	movs r3, #0xcd
	lsls r3, r3, #4
	adds r1, r2, r3
	movs r0, #6
_080CCFB4:
	strh r0, [r1]
	ldr r1, [r4]
	ldr r0, _080CCFF8
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080CCFCE
	movs r3, #0xcd
	lsls r3, r3, #4
	adds r0, r1, r3
	ldrh r0, [r0]
	lsrs r0, r0, #1
	strb r0, [r2]
_080CCFCE:
	ldr r2, [r4]
	ldr r1, _080CCFFC
	adds r0, r2, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080CD008
	cmp r1, #1
	beq _080CD028
	ldr r3, _080CD000
	adds r0, r2, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _080CD004
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, #0x22
	ldrsh r0, [r0, r2]
	b _080CD03C
	.align 2, 0
_080CCFF8: .4byte 0x00000CD7
_080CCFFC: .4byte 0x00000CD2
_080CD000: .4byte 0x00000CCE
_080CD004: .4byte 0x00000CB4
_080CD008:
	ldr r3, _080CD020
	adds r0, r2, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _080CD024
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, #0x22
	ldrsh r0, [r0, r2]
	adds r0, #0xc0
	b _080CD03C
	.align 2, 0
_080CD020: .4byte 0x00000CCE
_080CD024: .4byte 0x00000CB4
_080CD028:
	ldr r3, _080CD068
	adds r0, r2, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _080CD06C
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, #0x22
	ldrsh r0, [r0, r2]
	subs r0, #0xc0
_080CD03C:
	subs r7, r1, r0
	ldr r2, [r4]
	ldr r3, _080CD070
	adds r0, r2, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080CD078
	cmp r1, #1
	beq _080CD098
	ldr r1, _080CD074
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _080CD06C
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, #0x20
	ldrsh r0, [r0, r2]
	b _080CD0AC
	.align 2, 0
_080CD068: .4byte 0x00000CCE
_080CD06C: .4byte 0x00000CB4
_080CD070: .4byte 0x00000CD3
_080CD074: .4byte 0x00000CCC
_080CD078:
	ldr r3, _080CD090
	adds r0, r2, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _080CD094
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, #0x20
	ldrsh r0, [r0, r2]
	adds r0, #0xc0
	b _080CD0AC
	.align 2, 0
_080CD090: .4byte 0x00000CCC
_080CD094: .4byte 0x00000CB4
_080CD098:
	ldr r3, _080CD0FC
	adds r0, r2, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _080CD100
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, #0x20
	ldrsh r0, [r0, r2]
	subs r0, #0xc0
_080CD0AC:
	subs r0, r1, r0
	lsls r7, r7, #8
	lsls r0, r0, #8
	ldr r4, [r4]
	ldr r3, _080CD104
	adds r6, r4, r3
	movs r1, #0xcd
	lsls r1, r1, #4
	adds r5, r4, r1
	ldrh r1, [r5]
	bl __divsi3
	str r0, [r6]
	ldr r2, _080CD108
	adds r6, r4, r2
	ldrh r1, [r5]
	adds r0, r7, #0
	bl __divsi3
	str r0, [r6]
	ldr r3, _080CD10C
	adds r2, r4, r3
	ldr r0, _080CD100
	adds r1, r4, r0
	ldr r0, [r1]
	movs r3, #0x20
	ldrsh r0, [r0, r3]
	lsls r0, r0, #8
	str r0, [r2]
	movs r0, #0xcc
	lsls r0, r0, #4
	adds r4, r4, r0
	ldr r0, [r1]
	movs r1, #0x22
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CD0FC: .4byte 0x00000CCC
_080CD100: .4byte 0x00000CB4
_080CD104: .4byte 0x00000CC4
_080CD108: .4byte 0x00000CC8
_080CD10C: .4byte 0x00000CBC
	thumb_func_end sub_080CCF88

	thumb_func_start sub_080CD110
sub_080CD110: @ 0x080CD110
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080CCF28
	bl sub_080CCF88
	ldr r5, _080CD150
	ldr r1, [r5]
	ldrb r0, [r1, #1]
	cmp r0, #3
	beq _080CD160
	ldr r2, _080CD154
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CD178
	ldr r0, _080CD158
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CD178
	ldr r2, _080CD15C
	adds r0, r1, r2
	ldr r0, [r0]
	movs r1, #1
	bl StartSpriteAnim
	b _080CD178
	.align 2, 0
_080CD150: .4byte 0x020399A8
_080CD154: .4byte 0x000021FF
_080CD158: .4byte 0x02039A1A
_080CD15C: .4byte 0x00000CB4
_080CD160:
	bl IsActiveItemMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CD178
	ldr r0, [r5]
	ldr r1, _080CD19C
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	bl StartSpriteAnim
_080CD178:
	ldr r0, _080CD1A0
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080CD1D8
	ldr r0, _080CD1A4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080CD1AC
	ldr r0, _080CD1A8
	ldrb r1, [r0]
	movs r0, #0
	bl sub_080D06F0
	b _080CD1BA
	.align 2, 0
_080CD19C: .4byte 0x00000CB4
_080CD1A0: .4byte 0x020399A8
_080CD1A4: .4byte 0x02039A18
_080CD1A8: .4byte 0x02039A19
_080CD1AC:
	cmp r0, #1
	bne _080CD1BA
	ldr r0, _080CD1C8
	ldrb r1, [r0]
	movs r0, #1
	bl sub_080D06F0
_080CD1BA:
	cmp r4, #0
	bne _080CD1CC
	movs r0, #0
	adds r1, r6, #0
	bl sub_080D062C
	b _080CD1D8
	.align 2, 0
_080CD1C8: .4byte 0x02039A19
_080CD1CC:
	cmp r4, #1
	bne _080CD204
	movs r0, #1
	adds r1, r6, #0
	bl sub_080D062C
_080CD1D8:
	cmp r4, #1
	bne _080CD204
	ldr r0, _080CD24C
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080CD204
	ldr r1, _080CD250
	ldr r0, [r1]
	ldr r2, _080CD254
	adds r0, r0, r2
	strb r4, [r0]
	ldr r0, [r1]
	ldr r1, _080CD258
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
_080CD204:
	cmp r4, #0
	beq _080CD260
	cmp r4, #0
	blt _080CD2D2
	cmp r4, #3
	bgt _080CD2D2
	ldr r5, _080CD250
	ldr r0, [r5]
	ldr r2, _080CD25C
	adds r0, r0, r2
	ldr r4, [r0]
	ldrb r1, [r4, #5]
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r3, #4
	orrs r0, r3
	strb r0, [r4, #5]
	ldr r0, [r5]
	ldr r4, _080CD258
	adds r0, r0, r4
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	ands r2, r0
	orrs r2, r3
	strb r2, [r1, #5]
	b _080CD2D2
	.align 2, 0
_080CD24C: .4byte 0x02039A18
_080CD250: .4byte 0x020399A8
_080CD254: .4byte 0x00000CD6
_080CD258: .4byte 0x00000CB8
_080CD25C: .4byte 0x00000CB4
_080CD260:
	ldr r3, _080CD294
	ldr r1, [r3]
	ldr r2, _080CD298
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CD2A4
	ldr r2, _080CD29C
	adds r0, r1, r2
	ldr r2, [r0]
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #5]
	ldr r0, [r3]
	ldr r1, _080CD2A0
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	b _080CD2D2
	.align 2, 0
_080CD294: .4byte 0x020399A8
_080CD298: .4byte 0x000021FF
_080CD29C: .4byte 0x00000CB4
_080CD2A0: .4byte 0x00000CB8
_080CD2A4:
	ldr r2, _080CD2D8
	adds r0, r1, r2
	ldr r2, [r0]
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, _080CD2DC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080CD2D2
	ldr r0, _080CD2E0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CD2D2
	movs r0, #2
	bl SetMovingMonPriority
_080CD2D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD2D8: .4byte 0x00000CB4
_080CD2DC: .4byte 0x02039A18
_080CD2E0: .4byte 0x02039A1A
	thumb_func_end sub_080CD110

	thumb_func_start sub_080CD2E4
sub_080CD2E4: @ 0x080CD2E4
	push {r4, lr}
	ldr r1, _080CD324
	ldr r4, _080CD328
	ldr r2, [r4]
	ldr r3, _080CD32C
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080CD330
	adds r3, #1
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2, #1]
	cmp r0, #3
	beq _080CD33C
	ldr r1, _080CD334
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CD354
	ldr r0, _080CD338
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CD354
	subs r3, #0x21
	adds r0, r2, r3
	ldr r0, [r0]
	movs r1, #0
	bl StartSpriteAnim
	b _080CD354
	.align 2, 0
_080CD324: .4byte 0x02039A18
_080CD328: .4byte 0x020399A8
_080CD32C: .4byte 0x00000CD4
_080CD330: .4byte 0x02039A19
_080CD334: .4byte 0x000021FF
_080CD338: .4byte 0x02039A1A
_080CD33C:
	bl IsActiveItemMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CD354
	ldr r0, [r4]
	ldr r1, _080CD370
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl StartSpriteAnim
_080CD354:
	bl sub_080CE3BC
	ldr r0, _080CD374
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080CD38A
	cmp r0, #1
	bgt _080CD378
	cmp r0, #0
	beq _080CD3AC
	b _080CD406
	.align 2, 0
_080CD370: .4byte 0x00000CB4
_080CD374: .4byte 0x02039A18
_080CD378:
	cmp r0, #2
	beq _080CD382
	cmp r0, #3
	bne _080CD406
	b _080CD39A
_080CD382:
	movs r0, #1
	bl sub_080CCA24
	b _080CD406
_080CD38A:
	ldr r0, _080CD3A4
	ldr r0, [r0]
	ldr r2, _080CD3A8
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, #0x43
	movs r1, #0xd
	strb r1, [r0]
_080CD39A:
	movs r0, #1
	bl SetMovingMonPriority
	b _080CD406
	.align 2, 0
_080CD3A4: .4byte 0x020399A8
_080CD3A8: .4byte 0x00000CB8
_080CD3AC:
	ldr r4, _080CD40C
	ldr r1, [r4]
	ldr r3, _080CD410
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CD406
	ldr r2, _080CD414
	adds r0, r1, r2
	ldr r3, [r0]
	ldrb r1, [r3, #5]
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r0, [r4]
	ldr r3, _080CD418
	adds r0, r0, r3
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	ands r2, r0
	movs r0, #8
	orrs r2, r0
	strb r2, [r1, #5]
	ldr r0, [r4]
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, #0x43
	movs r1, #0x15
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r0, r3
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	movs r0, #2
	bl SetMovingMonPriority
_080CD406:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD40C: .4byte 0x020399A8
_080CD410: .4byte 0x000021FF
_080CD414: .4byte 0x00000CB4
_080CD418: .4byte 0x00000CB8
	thumb_func_end sub_080CD2E4

	thumb_func_start sub_080CD41C
sub_080CD41C: @ 0x080CD41C
	push {lr}
	ldr r0, _080CD42C
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CD430
	movs r3, #0
	b _080CD43E
	.align 2, 0
_080CD42C: .4byte 0x02039A1A
_080CD430:
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _080CD43E
	movs r3, #5
_080CD43E:
	ldr r0, _080CD468
	ldr r2, [r0]
	ldr r1, _080CD46C
	adds r0, r2, r1
	ldr r0, [r0]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080CD45C
	ldr r0, _080CD470
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
_080CD45C:
	movs r0, #1
	adds r1, r3, #0
	bl sub_080CD110
	pop {r0}
	bx r0
	.align 2, 0
_080CD468: .4byte 0x020399A8
_080CD46C: .4byte 0x00000CB4
_080CD470: .4byte 0x00000CD7
	thumb_func_end sub_080CD41C

	thumb_func_start sub_080CD474
sub_080CD474: @ 0x080CD474
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_080CD110
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CD474

	thumb_func_start sub_080CD488
sub_080CD488: @ 0x080CD488
	ldr r1, _080CD490
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080CD490: .4byte 0x02039A1E
	thumb_func_end sub_080CD488

	thumb_func_start sub_080CD494
sub_080CD494: @ 0x080CD494
	ldr r0, _080CD4A0
	ldr r1, _080CD4A4
	ldrb r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_080CD4A0: .4byte 0x02039A1E
_080CD4A4: .4byte 0x02039A19
	thumb_func_end sub_080CD494

	thumb_func_start sub_080CD4A8
sub_080CD4A8: @ 0x080CD4A8
	ldr r0, _080CD4B0
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080CD4B0: .4byte 0x02039A1E
	thumb_func_end sub_080CD4A8

	thumb_func_start InitMonPlaceChange
InitMonPlaceChange: @ 0x080CD4B4
	lsls r0, r0, #0x18
	ldr r1, _080CD4D4
	ldr r1, [r1]
	ldr r2, _080CD4D8
	adds r3, r1, r2
	ldr r2, _080CD4DC
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r3]
	movs r0, #0xd9
	lsls r0, r0, #4
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080CD4D4: .4byte 0x020399A8
_080CD4D8: .4byte 0x00000D8C
_080CD4DC: .4byte 0x08556494
	thumb_func_end InitMonPlaceChange

	thumb_func_start sub_080CD4E0
sub_080CD4E0: @ 0x080CD4E0
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CD500
	ldr r0, _080CD4F4
	ldr r1, [r0]
	ldr r2, _080CD4F8
	adds r1, r1, r2
	ldr r2, _080CD4FC
	b _080CD50A
	.align 2, 0
_080CD4F4: .4byte 0x020399A8
_080CD4F8: .4byte 0x00000D8C
_080CD4FC: .4byte 0x080CD731
_080CD500:
	ldr r0, _080CD51C
	ldr r1, [r0]
	ldr r2, _080CD520
	adds r1, r1, r2
	ldr r2, _080CD524
_080CD50A:
	str r2, [r1]
	ldr r0, [r0]
	movs r1, #0xd9
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080CD51C: .4byte 0x020399A8
_080CD520: .4byte 0x00000D8C
_080CD524: .4byte 0x080CD741
	thumb_func_end sub_080CD4E0

	thumb_func_start DoMonPlaceChange
DoMonPlaceChange: @ 0x080CD528
	push {lr}
	ldr r0, _080CD540
	ldr r0, [r0]
	ldr r1, _080CD544
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end DoMonPlaceChange

	thumb_func_start sub_080CD538
sub_080CD538: @ 0x080CD538
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080CD540: .4byte 0x020399A8
_080CD544: .4byte 0x00000D8C
	thumb_func_end sub_080CD538

	thumb_func_start MonPlaceChange_Move
MonPlaceChange_Move: @ 0x080CD548
	push {r4, r5, lr}
	ldr r4, _080CD564
	ldr r1, [r4]
	movs r5, #0xd9
	lsls r5, r5, #4
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CD598
	cmp r0, #1
	bgt _080CD568
	cmp r0, #0
	beq _080CD572
	b _080CD5D0
	.align 2, 0
_080CD564: .4byte 0x020399A8
_080CD568:
	cmp r0, #2
	beq _080CD5BC
	cmp r0, #3
	beq _080CD57A
	b _080CD5D0
_080CD572:
	ldr r0, _080CD580
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CD584
_080CD57A:
	movs r0, #0
	b _080CD5D2
	.align 2, 0
_080CD580: .4byte 0x02039A1A
_080CD584:
	ldr r2, _080CD594
	adds r0, r1, r2
	ldr r0, [r0]
	movs r1, #2
	bl StartSpriteAnim
	b _080CD5C6
	.align 2, 0
_080CD594: .4byte 0x00000CB4
_080CD598:
	bl sub_080CD750
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CD5D0
	ldr r0, [r4]
	ldr r1, _080CD5B8
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #3
	bl StartSpriteAnim
	bl MoveMon
	b _080CD5C6
	.align 2, 0
_080CD5B8: .4byte 0x00000CB4
_080CD5BC:
	bl sub_080CD784
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CD5D0
_080CD5C6:
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080CD5D0:
	movs r0, #1
_080CD5D2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MonPlaceChange_Move

	thumb_func_start MonPlaceChange_Place
MonPlaceChange_Place: @ 0x080CD5D8
	push {r4, r5, lr}
	ldr r4, _080CD5F4
	ldr r0, [r4]
	movs r5, #0xd9
	lsls r5, r5, #4
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CD620
	cmp r0, #1
	bgt _080CD5F8
	cmp r0, #0
	beq _080CD5FE
	b _080CD64C
	.align 2, 0
_080CD5F4: .4byte 0x020399A8
_080CD5F8:
	cmp r0, #2
	beq _080CD648
	b _080CD64C
_080CD5FE:
	bl sub_080CD750
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CD64C
	ldr r0, [r4]
	ldr r1, _080CD61C
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #2
	bl StartSpriteAnim
	bl PlaceMon
	b _080CD638
	.align 2, 0
_080CD61C: .4byte 0x00000CB4
_080CD620:
	bl sub_080CD784
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CD64C
	ldr r0, [r4]
	ldr r1, _080CD644
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl StartSpriteAnim
_080CD638:
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080CD64C
	.align 2, 0
_080CD644: .4byte 0x00000CB4
_080CD648:
	movs r0, #0
	b _080CD64E
_080CD64C:
	movs r0, #1
_080CD64E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MonPlaceChange_Place

	thumb_func_start MonPlaceChange_Shift
MonPlaceChange_Shift: @ 0x080CD654
	push {r4, r5, lr}
	ldr r4, _080CD670
	ldr r1, [r4]
	movs r5, #0xd9
	lsls r5, r5, #4
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CD6E4
	cmp r0, #1
	bgt _080CD674
	cmp r0, #0
	beq _080CD67A
	b _080CD728
	.align 2, 0
_080CD670: .4byte 0x020399A8
_080CD674:
	cmp r0, #2
	beq _080CD724
	b _080CD728
_080CD67A:
	ldr r0, _080CD694
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CD69C
	cmp r0, #1
	bne _080CD724
	ldr r0, _080CD698
	adds r1, r1, r0
	movs r0, #0xe
	b _080CD6A6
	.align 2, 0
_080CD694: .4byte 0x02039A18
_080CD698: .4byte 0x00000D91
_080CD69C:
	bl StorageGetCurrentBox
	ldr r1, [r4]
	ldr r2, _080CD6D4
	adds r1, r1, r2
_080CD6A6:
	strb r0, [r1]
	ldr r4, _080CD6D8
	ldr r0, [r4]
	ldr r1, _080CD6DC
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #2
	bl StartSpriteAnim
	ldr r0, [r4]
	ldr r2, _080CD6D4
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r1, _080CD6E0
	ldrb r1, [r1]
	bl sub_080CB5D0
	ldr r1, [r4]
	movs r0, #0xd9
	lsls r0, r0, #4
	adds r1, r1, r0
	b _080CD710
	.align 2, 0
_080CD6D4: .4byte 0x00000D91
_080CD6D8: .4byte 0x020399A8
_080CD6DC: .4byte 0x00000CB4
_080CD6E0: .4byte 0x02039A19
_080CD6E4:
	bl sub_080CB638
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CD728
	ldr r0, [r4]
	ldr r1, _080CD718
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #3
	bl StartSpriteAnim
	ldr r0, [r4]
	ldr r2, _080CD71C
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r1, _080CD720
	ldrb r1, [r1]
	bl SetShiftedMonData
	ldr r1, [r4]
	adds r1, r1, r5
_080CD710:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080CD728
	.align 2, 0
_080CD718: .4byte 0x00000CB4
_080CD71C: .4byte 0x00000D91
_080CD720: .4byte 0x02039A19
_080CD724:
	movs r0, #0
	b _080CD72A
_080CD728:
	movs r0, #1
_080CD72A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MonPlaceChange_Shift

	thumb_func_start sub_080CD730
sub_080CD730: @ 0x080CD730
	push {lr}
	bl sub_080CD750
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CD730

	thumb_func_start sub_080CD740
sub_080CD740: @ 0x080CD740
	push {lr}
	bl sub_080CD784
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CD740

	thumb_func_start sub_080CD750
sub_080CD750: @ 0x080CD750
	push {lr}
	ldr r0, _080CD770
	ldr r0, [r0]
	ldr r1, _080CD774
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0x26
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080CD768
	cmp r0, #8
	beq _080CD778
_080CD768:
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
	b _080CD77C
	.align 2, 0
_080CD770: .4byte 0x020399A8
_080CD774: .4byte 0x00000CB4
_080CD778:
	movs r0, #0
	b _080CD77E
_080CD77C:
	movs r0, #1
_080CD77E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CD750

	thumb_func_start sub_080CD784
sub_080CD784: @ 0x080CD784
	push {lr}
	ldr r0, _080CD7A4
	ldr r0, [r0]
	ldr r1, _080CD7A8
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0x26
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080CD7AC
	ldrh r0, [r1, #0x26]
	subs r0, #1
	strh r0, [r1, #0x26]
	movs r0, #1
	b _080CD7AE
	.align 2, 0
_080CD7A4: .4byte 0x020399A8
_080CD7A8: .4byte 0x00000CB4
_080CD7AC:
	movs r0, #0
_080CD7AE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CD784

	thumb_func_start MoveMon
MoveMon: @ 0x080CD7B4
	push {r4, lr}
	ldr r0, _080CD7DC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CD7E4
	cmp r0, #1
	bne _080CD810
	ldr r4, _080CD7E0
	ldrb r1, [r4]
	movs r0, #0xe
	bl SetMovedMonData
	ldrb r1, [r4]
	movs r0, #0
	bl sub_080CB488
	b _080CD80A
	.align 2, 0
_080CD7DC: .4byte 0x02039A18
_080CD7E0: .4byte 0x02039A19
_080CD7E4:
	ldr r0, _080CD818
	ldr r0, [r0]
	ldr r1, _080CD81C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CD80A
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080CD820
	ldrb r1, [r4]
	bl SetMovedMonData
	ldrb r1, [r4]
	movs r0, #1
	bl sub_080CB488
_080CD80A:
	ldr r1, _080CD824
	movs r0, #1
	strb r0, [r1]
_080CD810:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD818: .4byte 0x020399A8
_080CD81C: .4byte 0x000021FF
_080CD820: .4byte 0x02039A19
_080CD824: .4byte 0x02039A1A
	thumb_func_end MoveMon

	thumb_func_start PlaceMon
PlaceMon: @ 0x080CD828
	push {r4, r5, lr}
	ldr r0, _080CD850
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CD858
	cmp r0, #1
	bne _080CD87A
	ldr r4, _080CD854
	ldrb r1, [r4]
	movs r0, #0xe
	bl SetPlacedMonData
	ldrb r1, [r4]
	movs r0, #0xe
	bl sub_080CB520
	b _080CD874
	.align 2, 0
_080CD850: .4byte 0x02039A18
_080CD854: .4byte 0x02039A19
_080CD858:
	bl StorageGetCurrentBox
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080CD880
	ldrb r1, [r5]
	adds r0, r4, #0
	bl SetPlacedMonData
	ldrb r1, [r5]
	adds r0, r4, #0
	bl sub_080CB520
_080CD874:
	ldr r1, _080CD884
	movs r0, #0
	strb r0, [r1]
_080CD87A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD880: .4byte 0x02039A19
_080CD884: .4byte 0x02039A1A
	thumb_func_end PlaceMon

	thumb_func_start sub_080CD888
sub_080CD888: @ 0x080CD888
	push {lr}
	bl sub_080CE3BC
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CD888

	thumb_func_start SetMovedMonData
SetMovedMonData: @ 0x080CD894
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r4, #0xe
	bne _080CD8D0
	ldr r0, _080CD8C0
	ldr r0, [r0]
	ldr r1, _080CD8C4
	adds r0, r0, r1
	ldr r3, _080CD8C8
	ldr r1, _080CD8CC
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #0x64
	muls r1, r2, r1
	adds r1, r1, r3
	movs r2, #0x64
	bl memcpy
	b _080CD8E0
	.align 2, 0
_080CD8C0: .4byte 0x020399A8
_080CD8C4: .4byte 0x000020A4
_080CD8C8: .4byte 0x02024190
_080CD8CC: .4byte 0x02039A19
_080CD8D0:
	ldr r0, _080CD8F8
	ldr r2, [r0]
	ldr r0, _080CD8FC
	adds r2, r2, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl BoxMonAtToMon
_080CD8E0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PurgeMonOrBoxMon
	ldr r0, _080CD900
	strb r4, [r0]
	ldr r0, _080CD904
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD8F8: .4byte 0x020399A8
_080CD8FC: .4byte 0x000020A4
_080CD900: .4byte 0x02039A1B
_080CD904: .4byte 0x02039A1C
	thumb_func_end SetMovedMonData

	thumb_func_start SetPlacedMonData
SetPlacedMonData: @ 0x080CD908
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	cmp r6, #0xe
	bne _080CD93C
	ldr r1, _080CD930
	movs r0, #0x64
	muls r0, r7, r0
	adds r0, r0, r1
	ldr r1, _080CD934
	ldr r1, [r1]
	ldr r2, _080CD938
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
	b _080CD954
	.align 2, 0
_080CD930: .4byte 0x02024190
_080CD934: .4byte 0x020399A8
_080CD938: .4byte 0x000020A4
_080CD93C:
	ldr r5, _080CD95C
	ldr r0, [r5]
	ldr r4, _080CD960
	adds r0, r0, r4
	bl BoxMonRestorePP
	ldr r2, [r5]
	adds r2, r2, r4
	adds r0, r6, #0
	adds r1, r7, #0
	bl SetBoxMonAt
_080CD954:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CD95C: .4byte 0x020399A8
_080CD960: .4byte 0x000020A4
	thumb_func_end SetPlacedMonData

	thumb_func_start PurgeMonOrBoxMon
PurgeMonOrBoxMon: @ 0x080CD964
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, #0xe
	bne _080CD984
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080CD980
	adds r0, r0, r1
	bl ZeroMonData
	b _080CD988
	.align 2, 0
_080CD980: .4byte 0x02024190
_080CD984:
	bl ZeroBoxMonAt
_080CD988:
	pop {r0}
	bx r0
	thumb_func_end PurgeMonOrBoxMon

	thumb_func_start SetShiftedMonData
SetShiftedMonData: @ 0x080CD98C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	cmp r6, #0xe
	bne _080CD9C0
	ldr r0, _080CD9B4
	ldr r0, [r0]
	ldr r1, _080CD9B8
	adds r0, r0, r1
	ldr r2, _080CD9BC
	movs r1, #0x64
	muls r1, r7, r1
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
	b _080CD9D0
	.align 2, 0
_080CD9B4: .4byte 0x020399A8
_080CD9B8: .4byte 0x00002108
_080CD9BC: .4byte 0x02024190
_080CD9C0:
	ldr r0, _080CDA04
	ldr r2, [r0]
	ldr r0, _080CDA08
	adds r2, r2, r0
	adds r0, r6, #0
	adds r1, r7, #0
	bl BoxMonAtToMon
_080CD9D0:
	adds r0, r6, #0
	adds r1, r7, #0
	bl SetPlacedMonData
	ldr r5, _080CDA04
	ldr r1, [r5]
	ldr r4, _080CDA0C
	adds r0, r1, r4
	ldr r2, _080CDA08
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #0
	bl SetCursorMonData
	ldr r0, _080CDA10
	strb r6, [r0]
	ldr r0, _080CDA14
	strb r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDA04: .4byte 0x020399A8
_080CDA08: .4byte 0x00002108
_080CDA0C: .4byte 0x000020A4
_080CDA10: .4byte 0x02039A1B
_080CDA14: .4byte 0x02039A1C
	thumb_func_end SetShiftedMonData

	thumb_func_start TryStorePartyMonInBox
TryStorePartyMonInBox: @ 0x080CDA18
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r6, #0
	bl GetFirstFreeBoxSpot
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080CDA36
	movs r0, #0
	b _080CDA96
_080CDA36:
	ldr r5, _080CDA54
	ldrb r0, [r5]
	cmp r0, #0
	beq _080CDA58
	lsls r4, r4, #0x18
	lsrs r1, r4, #0x18
	adds r0, r6, #0
	bl SetPlacedMonData
	bl DestroyMovingMonIcon
	movs r0, #0
	strb r0, [r5]
	b _080CDA72
	.align 2, 0
_080CDA54: .4byte 0x02039A1A
_080CDA58:
	ldr r5, _080CDA9C
	ldrb r1, [r5]
	movs r0, #0xe
	bl SetMovedMonData
	lsls r4, r4, #0x18
	lsrs r1, r4, #0x18
	adds r0, r6, #0
	bl SetPlacedMonData
	ldrb r0, [r5]
	bl DestroyPartyMonIcon
_080CDA72:
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bne _080CDA84
	lsrs r0, r4, #0x18
	bl sub_080CA9B4
_080CDA84:
	ldr r0, _080CDAA0
	ldr r0, [r0]
	ldr r1, _080CDAA4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	bl StartSpriteAnim
	movs r0, #1
_080CDA96:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080CDA9C: .4byte 0x02039A19
_080CDAA0: .4byte 0x020399A8
_080CDAA4: .4byte 0x00000CB4
	thumb_func_end TryStorePartyMonInBox

	thumb_func_start sub_080CDAA8
sub_080CDAA8: @ 0x080CDAA8
	push {lr}
	ldr r0, _080CDAC4
	ldr r0, [r0]
	ldr r1, _080CDAC8
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl StartSpriteAnim
	bl sub_080CE3BC
	pop {r0}
	bx r0
	.align 2, 0
_080CDAC4: .4byte 0x020399A8
_080CDAC8: .4byte 0x00000CB4
	thumb_func_end sub_080CDAA8

	thumb_func_start sub_080CDACC
sub_080CDACC: @ 0x080CDACC
	push {lr}
	ldr r0, _080CDADC
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CDAE0
	movs r2, #2
	b _080CDAF0
	.align 2, 0
_080CDADC: .4byte 0x02039A1A
_080CDAE0:
	ldr r0, _080CDB10
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	eors r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r2, r0, #0x1f
_080CDAF0:
	ldr r0, _080CDB14
	ldrb r1, [r0]
	adds r0, r2, #0
	bl sub_080CB788
	ldr r0, _080CDB18
	ldr r1, [r0]
	ldr r2, _080CDB1C
	adds r0, r1, r2
	ldr r2, _080CDB20
	adds r1, r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080CDB10: .4byte 0x02039A18
_080CDB14: .4byte 0x02039A19
_080CDB18: .4byte 0x020399A8
_080CDB1C: .4byte 0x000021E0
_080CDB20: .4byte 0x00000CEE
	thumb_func_end sub_080CDACC

	thumb_func_start sub_080CDB24
sub_080CDB24: @ 0x080CDB24
	push {lr}
	bl sub_080CB84C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CDB34
	movs r0, #1
	b _080CDB46
_080CDB34:
	ldr r0, _080CDB4C
	ldr r0, [r0]
	ldr r1, _080CDB50
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl StartSpriteAnim
	movs r0, #0
_080CDB46:
	pop {r1}
	bx r1
	.align 2, 0
_080CDB4C: .4byte 0x020399A8
_080CDB50: .4byte 0x00000CB4
	thumb_func_end sub_080CDB24

	thumb_func_start ReleaseMon
ReleaseMon: @ 0x080CDB54
	push {lr}
	bl sub_080CB894
	ldr r1, _080CDB68
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CDB6C
	movs r0, #0
	strb r0, [r1]
	b _080CDB92
	.align 2, 0
_080CDB68: .4byte 0x02039A1A
_080CDB6C:
	ldr r0, _080CDB7C
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080CDB80
	movs r2, #0xe
	b _080CDB88
	.align 2, 0
_080CDB7C: .4byte 0x02039A18
_080CDB80:
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080CDB88:
	ldr r0, _080CDB9C
	ldrb r1, [r0]
	adds r0, r2, #0
	bl PurgeMonOrBoxMon
_080CDB92:
	bl sub_080CE3BC
	pop {r0}
	bx r0
	.align 2, 0
_080CDB9C: .4byte 0x02039A19
	thumb_func_end ReleaseMon

	thumb_func_start sub_080CDBA0
sub_080CDBA0: @ 0x080CDBA0
	push {lr}
	ldr r0, _080CDBC0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CDBBA
	ldr r0, _080CDBC4
	ldr r0, [r0]
	ldr r1, _080CDBC8
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #3
	bl StartSpriteAnim
_080CDBBA:
	pop {r0}
	bx r0
	.align 2, 0
_080CDBC0: .4byte 0x02039A1A
_080CDBC4: .4byte 0x020399A8
_080CDBC8: .4byte 0x00000CB4
	thumb_func_end sub_080CDBA0

	thumb_func_start sub_080CDBCC
sub_080CDBCC: @ 0x080CDBCC
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r5, #0
	ldr r4, _080CDC10
_080CDBD4:
	movs r1, #0
	ldrsb r1, [r4, r1]
	cmp r1, #0x22
	beq _080CDBF4
	ldr r0, _080CDC14
	ldr r2, [r0]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080CDBFA
	movs r1, #1
	ldrsb r1, [r4, r1]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080CDBFA
_080CDBF4:
	ldrh r0, [r4, #2]
	strh r0, [r3]
	adds r3, #2
_080CDBFA:
	adds r4, #4
	adds r5, #1
	cmp r5, #5
	bls _080CDBD4
	ldr r1, _080CDC18
	adds r0, r1, #0
	strh r0, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDC10: .4byte 0x085564A0
_080CDC14: .4byte 0x03005AEC
_080CDC18: .4byte 0x00000163
	thumb_func_end sub_080CDBCC

	thumb_func_start InitCanRelaseMonVars
InitCanRelaseMonVars: @ 0x080CDC1C
	push {r4, r5, lr}
	bl AtLeastThreeUsableMons
	adds r3, r0, #0
	cmp r3, #0
	bne _080CDC4C
	ldr r2, _080CDC40
	ldr r0, [r2]
	ldr r1, _080CDC44
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, _080CDC48
	adds r0, r0, r2
	strb r3, [r0]
	b _080CDD80
	.align 2, 0
_080CDC40: .4byte 0x020399A8
_080CDC44: .4byte 0x0000216D
_080CDC48: .4byte 0x0000216C
_080CDC4C:
	ldr r0, _080CDC7C
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CDC94
	ldr r4, _080CDC80
	ldr r1, [r4]
	ldr r3, _080CDC84
	adds r0, r1, r3
	ldr r2, _080CDC88
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
	ldr r0, [r4]
	ldr r3, _080CDC8C
	adds r0, r0, r3
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _080CDC90
	adds r0, r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	b _080CDD10
	.align 2, 0
_080CDC7C: .4byte 0x02039A1A
_080CDC80: .4byte 0x020399A8
_080CDC84: .4byte 0x00002108
_080CDC88: .4byte 0x000020A4
_080CDC8C: .4byte 0x00002170
_080CDC90: .4byte 0x00002171
_080CDC94:
	ldr r0, _080CDCC8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080CDCE0
	ldr r4, _080CDCCC
	ldr r0, [r4]
	ldr r2, _080CDCD0
	adds r0, r0, r2
	ldr r3, _080CDCD4
	ldr r1, _080CDCD8
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #0x64
	muls r1, r2, r1
	adds r1, r1, r3
	movs r2, #0x64
	bl memcpy
	ldr r0, [r4]
	ldr r3, _080CDCDC
	adds r0, r0, r3
	movs r1, #0xe
	strb r1, [r0]
	b _080CDD04
	.align 2, 0
_080CDCC8: .4byte 0x02039A18
_080CDCCC: .4byte 0x020399A8
_080CDCD0: .4byte 0x00002108
_080CDCD4: .4byte 0x02024190
_080CDCD8: .4byte 0x02039A19
_080CDCDC: .4byte 0x00002170
_080CDCE0:
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080CDD44
	ldrb r1, [r1]
	ldr r4, _080CDD48
	ldr r2, [r4]
	ldr r3, _080CDD4C
	adds r2, r2, r3
	bl BoxMonAtToMon
	bl StorageGetCurrentBox
	ldr r1, [r4]
	ldr r2, _080CDD50
	adds r1, r1, r2
	strb r0, [r1]
_080CDD04:
	ldr r0, _080CDD48
	ldr r0, [r0]
	ldr r1, _080CDD44
	ldrb r1, [r1]
	ldr r3, _080CDD54
	adds r0, r0, r3
_080CDD10:
	strb r1, [r0]
	ldr r5, _080CDD48
	ldr r0, [r5]
	ldr r4, _080CDD58
	adds r0, r0, r4
	bl sub_080CDBCC
	ldr r2, [r5]
	ldr r1, _080CDD4C
	adds r0, r2, r1
	adds r2, r2, r4
	movs r1, #0x51
	bl GetMonData
	ldr r2, [r5]
	ldr r3, _080CDD5C
	adds r1, r2, r3
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080CDD64
	ldr r0, _080CDD60
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	b _080CDD74
	.align 2, 0
_080CDD44: .4byte 0x02039A19
_080CDD48: .4byte 0x020399A8
_080CDD4C: .4byte 0x00002108
_080CDD50: .4byte 0x00002170
_080CDD54: .4byte 0x00002171
_080CDD58: .4byte 0x00002176
_080CDD5C: .4byte 0x00002174
_080CDD60: .4byte 0x0000216D
_080CDD64:
	ldr r1, _080CDD88
	adds r0, r2, r1
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	ldr r2, _080CDD8C
	adds r0, r0, r2
	strb r1, [r0]
_080CDD74:
	ldr r0, _080CDD90
	ldr r0, [r0]
	ldr r3, _080CDD94
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0]
_080CDD80:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDD88: .4byte 0x0000216D
_080CDD8C: .4byte 0x0000216C
_080CDD90: .4byte 0x020399A8
_080CDD94: .4byte 0x00002172
	thumb_func_end InitCanRelaseMonVars

	thumb_func_start AtLeastThreeUsableMons
AtLeastThreeUsableMons: @ 0x080CDD98
	push {r4, r5, r6, lr}
	ldr r0, _080CDDC8
	ldrb r1, [r0]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r5, r0, #0x1f
	movs r4, #0
_080CDDA6:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _080CDDCC
	adds r0, r0, r1
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _080CDDBA
	adds r5, #1
_080CDDBA:
	adds r4, #1
	cmp r4, #5
	ble _080CDDA6
	cmp r5, #2
	ble _080CDDD0
_080CDDC4:
	movs r0, #1
	b _080CDDF4
	.align 2, 0
_080CDDC8: .4byte 0x02039A1A
_080CDDCC: .4byte 0x02024190
_080CDDD0:
	movs r6, #0
_080CDDD2:
	movs r4, #0
_080CDDD4:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CheckBoxMonSanityAt
	cmp r0, #0
	beq _080CDDE6
	adds r5, #1
	cmp r5, #2
	bgt _080CDDC4
_080CDDE6:
	adds r4, #1
	cmp r4, #0x1d
	ble _080CDDD4
	adds r6, #1
	cmp r6, #0xd
	ble _080CDDD2
	movs r0, #0
_080CDDF4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AtLeastThreeUsableMons

	thumb_func_start RunCanReleaseMon
RunCanReleaseMon: @ 0x080CDDFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080CDE20
	ldr r2, [r0]
	ldr r3, _080CDE24
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	beq _080CDE2C
	ldr r1, _080CDE28
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080CDFB2
	.align 2, 0
_080CDE20: .4byte 0x020399A8
_080CDE24: .4byte 0x0000216D
_080CDE28: .4byte 0x0000216C
_080CDE2C:
	ldr r3, _080CDE3C
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, #0
	beq _080CDE40
	cmp r0, #1
	beq _080CDF0C
	b _080CDFAE
	.align 2, 0
_080CDE3C: .4byte 0x00002172
_080CDE40:
	movs r6, #0
_080CDE42:
	ldr r2, [r5]
	ldr r1, _080CDEAC
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bne _080CDE60
	ldr r3, _080CDEB0
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r6
	beq _080CDE82
_080CDE60:
	movs r0, #0x64
	muls r0, r6, r0
	ldr r1, _080CDEB4
	adds r0, r0, r1
	ldr r1, _080CDEB8
	adds r2, r2, r1
	movs r1, #0x51
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, [r5]
	ldr r2, _080CDEBC
	adds r1, r1, r2
	ldrh r0, [r1]
	bics r0, r4
	strh r0, [r1]
_080CDE82:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	bls _080CDE42
	ldr r2, _080CDEC0
	ldr r1, [r2]
	ldr r3, _080CDEBC
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _080CDEC8
	subs r3, #7
	adds r0, r1, r3
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, _080CDEC4
	adds r0, r0, r2
	strb r1, [r0]
	b _080CDFAE
	.align 2, 0
_080CDEAC: .4byte 0x00002170
_080CDEB0: .4byte 0x00002171
_080CDEB4: .4byte 0x02024190
_080CDEB8: .4byte 0x00002176
_080CDEBC: .4byte 0x00002174
_080CDEC0: .4byte 0x020399A8
_080CDEC4: .4byte 0x0000216C
_080CDEC8:
	ldr r3, _080CDEE8
	adds r0, r1, r3
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, #1
	adds r0, r0, r3
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, _080CDEEC
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _080CDFAE
	.align 2, 0
_080CDEE8: .4byte 0x0000216E
_080CDEEC: .4byte 0x00002172
_080CDEF0:
	ldr r1, _080CDF04
	adds r0, r5, r1
	movs r1, #1
	strb r1, [r0]
	mov r2, r8
	ldr r0, [r2]
	ldr r3, _080CDF08
	adds r0, r0, r3
	strb r1, [r0]
	b _080CDFAE
	.align 2, 0
_080CDF04: .4byte 0x0000216D
_080CDF08: .4byte 0x0000216C
_080CDF0C:
	movs r6, #0
	mov r8, r5
	ldr r7, _080CDFBC
_080CDF12:
	mov r0, r8
	ldr r3, [r0]
	ldr r1, _080CDFC0
	adds r0, r3, r1
	ldrb r0, [r0]
	ldr r2, _080CDFC4
	adds r1, r3, r2
	ldrb r1, [r1]
	adds r2, #7
	adds r3, r3, r2
	movs r2, #0x51
	bl GetAndCopyBoxMonDataAt
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080CDF5C
	ldr r5, [r5]
	ldr r3, _080CDFC8
	adds r0, r5, r3
	ldrh r2, [r0]
	ldr r1, _080CDFC0
	adds r0, r5, r1
	ldrh r3, [r0]
	adds r1, r7, #0
	ands r1, r2
	adds r0, r7, #0
	ands r0, r3
	cmp r1, r0
	beq _080CDF5C
	ldr r2, _080CDFCC
	adds r1, r5, r2
	ldrh r0, [r1]
	bics r0, r4
	strh r0, [r1]
	cmp r0, #0
	beq _080CDEF0
_080CDF5C:
	ldr r2, _080CDFD0
	ldr r1, [r2]
	ldr r3, _080CDFC4
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	movs r3, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r2, #0
	cmp r0, #0x1d
	ble _080CDFA4
	ldr r0, [r2]
	ldr r1, _080CDFC4
	adds r0, r0, r1
	strb r3, [r0]
	ldr r1, [r2]
	ldr r0, _080CDFC0
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	ble _080CDFA4
	ldr r0, [r2]
	ldr r1, _080CDFD4
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, _080CDFD8
	adds r0, r0, r2
	strb r3, [r0]
_080CDFA4:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x1d
	bls _080CDF12
_080CDFAE:
	movs r0, #1
	rsbs r0, r0, #0
_080CDFB2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CDFBC: .4byte 0x0000FFFF
_080CDFC0: .4byte 0x0000216E
_080CDFC4: .4byte 0x0000216F
_080CDFC8: .4byte 0x00002170
_080CDFCC: .4byte 0x00002174
_080CDFD0: .4byte 0x020399A8
_080CDFD4: .4byte 0x0000216D
_080CDFD8: .4byte 0x0000216C
	thumb_func_end RunCanReleaseMon

	thumb_func_start sub_080CDFDC
sub_080CDFDC: @ 0x080CDFDC
	push {lr}
	ldr r0, _080CDFFC
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CDFF6
	ldr r0, _080CE000
	ldr r1, _080CE004
	ldr r1, [r1]
	ldr r2, _080CE008
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
_080CDFF6:
	pop {r0}
	bx r0
	.align 2, 0
_080CDFFC: .4byte 0x02039A1A
_080CE000: .4byte 0x020399B4
_080CE004: .4byte 0x020399A8
_080CE008: .4byte 0x000020A4
	thumb_func_end sub_080CDFDC

	thumb_func_start sub_080CE00C
sub_080CE00C: @ 0x080CE00C
	push {lr}
	ldr r0, _080CE030
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE054
	ldr r0, _080CE034
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _080CE044
	ldr r0, _080CE038
	ldr r0, [r0]
	ldr r1, _080CE03C
	adds r0, r0, r1
	ldr r1, _080CE040
	movs r2, #0x64
	bl memcpy
	b _080CE054
	.align 2, 0
_080CE030: .4byte 0x02039A1A
_080CE034: .4byte 0x02039A1B
_080CE038: .4byte 0x020399A8
_080CE03C: .4byte 0x000020A4
_080CE040: .4byte 0x020399B4
_080CE044:
	ldr r0, _080CE058
	ldr r0, [r0]
	ldr r1, _080CE05C
	adds r0, r0, r1
	ldr r1, _080CE060
	movs r2, #0x50
	bl memcpy
_080CE054:
	pop {r0}
	bx r0
	.align 2, 0
_080CE058: .4byte 0x020399A8
_080CE05C: .4byte 0x000020A4
_080CE060: .4byte 0x020399B4
	thumb_func_end sub_080CE00C

	thumb_func_start sub_080CE064
sub_080CE064: @ 0x080CE064
	push {r4, r5, lr}
	ldr r0, _080CE098
	ldrb r5, [r0]
	cmp r5, #0
	beq _080CE0B4
	bl sub_080CDFDC
	ldr r3, _080CE09C
	ldr r1, [r3]
	ldr r0, _080CE0A0
	adds r2, r1, r0
	ldr r0, _080CE0A4
	str r0, [r2]
	ldr r2, _080CE0A8
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	ldr r0, [r3]
	ldr r4, _080CE0AC
	adds r0, r0, r4
	strb r2, [r0]
	ldr r0, [r3]
	ldr r1, _080CE0B0
	adds r0, r0, r1
	strb r2, [r0]
	b _080CE146
	.align 2, 0
_080CE098: .4byte 0x02039A1A
_080CE09C: .4byte 0x020399A8
_080CE0A0: .4byte 0x0000218C
_080CE0A4: .4byte 0x020399B4
_080CE0A8: .4byte 0x00002187
_080CE0AC: .4byte 0x00002186
_080CE0B0: .4byte 0x00002188
_080CE0B4:
	ldr r0, _080CE0F0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080CE110
	ldr r4, _080CE0F4
	ldr r1, [r4]
	ldr r0, _080CE0F8
	adds r2, r1, r0
	ldr r0, _080CE0FC
	str r0, [r2]
	ldr r0, _080CE100
	ldrb r0, [r0]
	ldr r2, _080CE104
	adds r1, r1, r2
	strb r0, [r1]
	bl CountPartyMons
	ldr r1, [r4]
	subs r0, #1
	ldr r2, _080CE108
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, [r4]
	ldr r4, _080CE10C
	adds r0, r0, r4
	strb r5, [r0]
	b _080CE146
	.align 2, 0
_080CE0F0: .4byte 0x02039A18
_080CE0F4: .4byte 0x020399A8
_080CE0F8: .4byte 0x0000218C
_080CE0FC: .4byte 0x02024190
_080CE100: .4byte 0x02039A19
_080CE104: .4byte 0x00002187
_080CE108: .4byte 0x00002186
_080CE10C: .4byte 0x00002188
_080CE110:
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl GetBoxedMonPtr
	ldr r3, _080CE14C
	ldr r2, [r3]
	ldr r4, _080CE150
	adds r1, r2, r4
	str r0, [r1]
	ldr r0, _080CE154
	ldrb r0, [r0]
	ldr r1, _080CE158
	adds r2, r2, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r2, _080CE15C
	adds r0, r0, r2
	movs r1, #0x1d
	strb r1, [r0]
	ldr r0, [r3]
	subs r4, #4
	adds r0, r0, r4
	movs r1, #2
	strb r1, [r0]
_080CE146:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE14C: .4byte 0x020399A8
_080CE150: .4byte 0x0000218C
_080CE154: .4byte 0x02039A19
_080CE158: .4byte 0x00002187
_080CE15C: .4byte 0x00002186
	thumb_func_end sub_080CE064

	thumb_func_start sub_080CE160
sub_080CE160: @ 0x080CE160
	push {lr}
	ldr r0, _080CE170
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE174
	bl sub_080CE00C
	b _080CE17C
	.align 2, 0
_080CE170: .4byte 0x02039A1A
_080CE174:
	ldr r0, _080CE180
	ldr r1, _080CE184
	ldrb r1, [r1]
	strb r1, [r0]
_080CE17C:
	pop {r0}
	bx r0
	.align 2, 0
_080CE180: .4byte 0x02039A19
_080CE184: .4byte 0x0203CBEC
	thumb_func_end sub_080CE160

	thumb_func_start CompactPartySlots
CompactPartySlots: @ 0x080CE188
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _080CE1D4
	movs r6, #0
	movs r5, #0
	movs r0, #0x64
	mov sb, r0
	ldr r1, _080CE1D8
	mov r8, r1
	subs r0, #0x65
	mov sl, r0
_080CE1A4:
	mov r0, sb
	muls r0, r6, r0
	mov r1, r8
	adds r4, r0, r1
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080CE1DC
	cmp r6, r5
	beq _080CE1CC
	mov r0, sb
	muls r0, r5, r0
	add r0, r8
	adds r1, r4, #0
	movs r2, #0x64
	bl memcpy
_080CE1CC:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _080CE1E6
	.align 2, 0
_080CE1D4: .4byte 0x0000FFFF
_080CE1D8: .4byte 0x02024190
_080CE1DC:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, sl
	bne _080CE1E6
	adds r7, r6, #0
_080CE1E6:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	bls _080CE1A4
	lsls r7, r7, #0x10
	cmp r5, #5
	bhi _080CE20E
	movs r6, #0x64
	ldr r4, _080CE220
_080CE1FA:
	adds r0, r5, #0
	muls r0, r6, r0
	adds r0, r0, r4
	bl ZeroMonData
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #5
	bls _080CE1FA
_080CE20E:
	asrs r0, r7, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CE220: .4byte 0x02024190
	thumb_func_end CompactPartySlots

	thumb_func_start SetMonMarkings
SetMonMarkings: @ 0x080CE224
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	strb r0, [r1]
	ldr r2, _080CE254
	ldr r1, [r2]
	ldr r3, _080CE258
	adds r1, r1, r3
	strb r0, [r1]
	ldr r0, _080CE25C
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE264
	ldr r0, [r2]
	ldr r1, _080CE260
	adds r0, r0, r1
	movs r1, #8
	mov r2, sp
	bl SetMonData
	b _080CE298
	.align 2, 0
_080CE254: .4byte 0x020399A8
_080CE258: .4byte 0x00000CEB
_080CE25C: .4byte 0x02039A1A
_080CE260: .4byte 0x000020A4
_080CE264:
	ldr r4, _080CE2A0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _080CE284
	ldr r0, _080CE2A4
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080CE2A8
	adds r0, r0, r1
	movs r1, #8
	mov r2, sp
	bl SetMonData
_080CE284:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080CE298
	ldr r0, _080CE2A4
	ldrb r0, [r0]
	movs r1, #8
	mov r2, sp
	bl SetCurrentBoxMonData
_080CE298:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE2A0: .4byte 0x02039A18
_080CE2A4: .4byte 0x02039A19
_080CE2A8: .4byte 0x02024190
	thumb_func_end SetMonMarkings

	thumb_func_start CanMovePartyMon
CanMovePartyMon: @ 0x080CE2AC
	push {lr}
	ldr r0, _080CE2D4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080CE2E0
	ldr r0, _080CE2D8
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CE2E0
	ldr r0, _080CE2DC
	ldrb r0, [r0]
	bl CountPartyAliveNonEggMonsExcept
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CE2E0
	movs r0, #1
	b _080CE2E2
	.align 2, 0
_080CE2D4: .4byte 0x02039A18
_080CE2D8: .4byte 0x02039A1A
_080CE2DC: .4byte 0x02039A19
_080CE2E0:
	movs r0, #0
_080CE2E2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CanMovePartyMon

	thumb_func_start CanShiftMon
CanShiftMon: @ 0x080CE2E8
	push {lr}
	ldr r0, _080CE32C
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE344
	ldr r0, _080CE330
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080CE328
	ldr r0, _080CE334
	ldrb r0, [r0]
	bl CountPartyAliveNonEggMonsExcept
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CE328
	ldr r0, _080CE338
	ldr r1, [r0]
	ldr r2, _080CE33C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CE344
	ldr r2, _080CE340
	adds r0, r1, r2
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080CE344
_080CE328:
	movs r0, #1
	b _080CE346
	.align 2, 0
_080CE32C: .4byte 0x02039A1A
_080CE330: .4byte 0x02039A18
_080CE334: .4byte 0x02039A19
_080CE338: .4byte 0x020399A8
_080CE33C: .4byte 0x00000CED
_080CE340: .4byte 0x000020A4
_080CE344:
	movs r0, #0
_080CE346:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CanShiftMon

	thumb_func_start GetBoxCursorPosition
GetBoxCursorPosition: @ 0x080CE34C
	ldr r0, _080CE354
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080CE354: .4byte 0x02039A1A
	thumb_func_end GetBoxCursorPosition

	thumb_func_start IsCursorOnBox
IsCursorOnBox: @ 0x080CE358
	push {lr}
	movs r1, #0
	ldr r0, _080CE370
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _080CE36A
	movs r1, #1
_080CE36A:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080CE370: .4byte 0x02039A18
	thumb_func_end IsCursorOnBox

	thumb_func_start IsCursorOnCloseBox
IsCursorOnCloseBox: @ 0x080CE374
	push {lr}
	movs r1, #0
	ldr r0, _080CE398
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _080CE392
	ldr r0, _080CE39C
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080CE392
	movs r1, #1
_080CE392:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080CE398: .4byte 0x02039A18
_080CE39C: .4byte 0x02039A19
	thumb_func_end IsCursorOnCloseBox

	thumb_func_start IsCursorInBox
IsCursorInBox: @ 0x080CE3A0
	push {lr}
	movs r1, #0
	ldr r0, _080CE3B8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080CE3B2
	movs r1, #1
_080CE3B2:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080CE3B8: .4byte 0x02039A18
	thumb_func_end IsCursorInBox

	thumb_func_start sub_080CE3BC
sub_080CE3BC: @ 0x080CE3BC
	push {r4, lr}
	ldr r0, _080CE3F0
	ldr r1, [r0]
	movs r2, #0
	ldr r3, _080CE3F4
	ldrb r0, [r3]
	cmp r0, #0
	bne _080CE3CE
	movs r2, #1
_080CE3CE:
	ldr r4, _080CE3F8
	adds r0, r1, r4
	strb r2, [r0]
	ldrb r0, [r3]
	cmp r0, #0
	bne _080CE44C
	ldr r0, _080CE3FC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080CE406
	cmp r0, #1
	bgt _080CE400
	cmp r0, #0
	beq _080CE436
	b _080CE44C
	.align 2, 0
_080CE3F0: .4byte 0x020399A8
_080CE3F4: .4byte 0x02039A1A
_080CE3F8: .4byte 0x00000CEA
_080CE3FC: .4byte 0x02039A18
_080CE400:
	cmp r0, #3
	bgt _080CE44C
	b _080CE42C
_080CE406:
	ldr r1, _080CE424
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #5
	bgt _080CE42C
	adds r1, r0, #0
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080CE428
	adds r0, r0, r1
	movs r1, #0
	bl SetCursorMonData
	b _080CE44C
	.align 2, 0
_080CE424: .4byte 0x02039A19
_080CE428: .4byte 0x02024190
_080CE42C:
	movs r0, #0
	movs r1, #2
	bl SetCursorMonData
	b _080CE44C
_080CE436:
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080CE454
	ldrb r1, [r1]
	bl GetBoxedMonPtr
	movs r1, #1
	bl SetCursorMonData
_080CE44C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE454: .4byte 0x02039A19
	thumb_func_end sub_080CE3BC

	thumb_func_start sub_080CE458
sub_080CE458: @ 0x080CE458
	push {lr}
	ldr r0, _080CE46C
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE474
	ldr r0, _080CE470
	movs r1, #0
	bl SetCursorMonData
	b _080CE478
	.align 2, 0
_080CE46C: .4byte 0x02039A1A
_080CE470: .4byte 0x020399B4
_080CE474:
	bl sub_080CE3BC
_080CE478:
	pop {r0}
	bx r0
	thumb_func_end sub_080CE458

	thumb_func_start SetCursorMonData
SetCursorMonData: @ 0x080CE47C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	ldr r0, _080CE4E0
	mov r8, r0
	ldr r1, [r0]
	ldr r3, _080CE4E4
	adds r2, r1, r3
	movs r0, #0
	strh r0, [r2]
	mov sb, r0
	mov sl, r0
	cmp r5, #0
	bne _080CE594
	adds r6, r4, #0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	mov r2, r8
	ldr r1, [r2]
	ldr r3, _080CE4E8
	adds r1, r1, r3
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080CE4C0
	b _080CE6B0
_080CE4C0:
	adds r0, r4, #0
	movs r1, #4
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #0
	beq _080CE4F0
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _080CE4EC
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	b _080CE502
	.align 2, 0
_080CE4E0: .4byte 0x020399A8
_080CE4E4: .4byte 0x00000CE6
_080CE4E8: .4byte 0x00000CE4
_080CE4EC: .4byte 0x00000CED
_080CE4F0:
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	mov r3, r8
	ldr r1, [r3]
	ldr r2, _080CE578
	adds r1, r1, r2
	strb r0, [r1]
_080CE502:
	ldr r4, _080CE57C
	ldr r2, [r4]
	ldr r5, _080CE580
	adds r2, r2, r5
	adds r0, r6, #0
	movs r1, #2
	bl GetMonData
	ldr r0, [r4]
	adds r0, r0, r5
	bl StringGetEnd10
	adds r0, r6, #0
	movs r1, #0x38
	bl GetMonData
	ldr r1, [r4]
	ldr r3, _080CE584
	adds r1, r1, r3
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #8
	bl GetMonData
	ldr r1, [r4]
	ldr r2, _080CE588
	adds r1, r1, r2
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0
	bl GetMonData
	ldr r1, [r4]
	movs r3, #0xce
	lsls r3, r3, #4
	adds r1, r1, r3
	str r0, [r1]
	adds r0, r6, #0
	bl GetMonFrontSpritePal
	ldr r1, [r4]
	ldr r2, _080CE58C
	adds r1, r1, r2
	str r0, [r1]
	adds r0, r6, #0
	bl GetMonGender
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, r6, #0
	movs r1, #0xc
	bl GetMonData
	ldr r1, [r4]
	ldr r3, _080CE590
	adds r1, r1, r3
	strh r0, [r1]
	b _080CE6A2
	.align 2, 0
_080CE578: .4byte 0x00000CED
_080CE57C: .4byte 0x020399A8
_080CE580: .4byte 0x00000CEE
_080CE584: .4byte 0x00000CEC
_080CE588: .4byte 0x00000CEB
_080CE58C: .4byte 0x00000CDC
_080CE590: .4byte 0x00000CE6
_080CE594:
	cmp r5, #1
	beq _080CE59A
	b _080CE698
_080CE59A:
	adds r7, r4, #0
	adds r0, r7, #0
	movs r1, #0x41
	bl GetBoxMonData
	mov r2, r8
	ldr r1, [r2]
	ldr r3, _080CE5E0
	adds r1, r1, r3
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080CE5B6
	b _080CE6B0
_080CE5B6:
	adds r0, r7, #0
	movs r1, #1
	bl GetBoxMonData
	mov sb, r0
	adds r0, r7, #0
	movs r1, #4
	bl GetBoxMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #0
	beq _080CE5E8
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _080CE5E4
	adds r0, r0, r2
	strb r5, [r0]
	b _080CE5FA
	.align 2, 0
_080CE5E0: .4byte 0x00000CE4
_080CE5E4: .4byte 0x00000CED
_080CE5E8:
	adds r0, r7, #0
	movs r1, #0x2d
	bl GetBoxMonData
	mov r3, r8
	ldr r1, [r3]
	ldr r2, _080CE67C
	adds r1, r1, r2
	strb r0, [r1]
_080CE5FA:
	ldr r5, _080CE680
	ldr r2, [r5]
	ldr r4, _080CE684
	adds r2, r2, r4
	adds r0, r7, #0
	movs r1, #2
	bl GetBoxMonData
	ldr r0, [r5]
	adds r0, r0, r4
	bl StringGetEnd10
	adds r0, r7, #0
	bl GetLevelFromBoxMonExp
	ldr r1, [r5]
	ldr r3, _080CE688
	adds r1, r1, r3
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #8
	bl GetBoxMonData
	ldr r1, [r5]
	ldr r2, _080CE68C
	adds r1, r1, r2
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0
	bl GetBoxMonData
	adds r2, r0, #0
	ldr r1, [r5]
	movs r6, #0xce
	lsls r6, r6, #4
	adds r0, r1, r6
	str r2, [r0]
	subs r4, #0xa
	adds r1, r1, r4
	ldrh r0, [r1]
	mov r1, sb
	bl GetMonSpritePalFromSpeciesAndPersonality
	ldr r1, [r5]
	ldr r3, _080CE690
	adds r2, r1, r3
	str r0, [r2]
	adds r4, r1, r4
	ldrh r0, [r4]
	adds r1, r1, r6
	ldr r1, [r1]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, r7, #0
	movs r1, #0xc
	bl GetBoxMonData
	ldr r1, [r5]
	ldr r2, _080CE694
	adds r1, r1, r2
	strh r0, [r1]
	b _080CE6A2
	.align 2, 0
_080CE67C: .4byte 0x00000CED
_080CE680: .4byte 0x020399A8
_080CE684: .4byte 0x00000CEE
_080CE688: .4byte 0x00000CEC
_080CE68C: .4byte 0x00000CEB
_080CE690: .4byte 0x00000CDC
_080CE694: .4byte 0x00000CE6
_080CE698:
	ldr r3, _080CE6F4
	adds r0, r1, r3
	mov r1, sb
	strh r1, [r0]
	strh r1, [r2]
_080CE6A2:
	ldr r0, _080CE6F8
	ldr r1, [r0]
	ldr r2, _080CE6F4
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r2, #0
	bne _080CE710
_080CE6B0:
	ldr r4, _080CE6F8
	ldr r0, [r4]
	ldr r3, _080CE6FC
	adds r0, r0, r3
	movs r1, #0
	movs r2, #5
	bl StringFill
	ldr r0, [r4]
	ldr r1, _080CE700
	adds r0, r0, r1
	movs r1, #0
	movs r2, #8
	bl StringFill
	ldr r0, [r4]
	ldr r2, _080CE704
	adds r0, r0, r2
	movs r1, #0
	movs r2, #8
	bl StringFill
	ldr r0, [r4]
	ldr r3, _080CE708
	adds r0, r0, r3
	movs r1, #0
	movs r2, #8
	bl StringFill
	ldr r0, [r4]
	ldr r1, _080CE70C
	adds r0, r0, r1
	b _080CE76E
	.align 2, 0
_080CE6F4: .4byte 0x00000CE4
_080CE6F8: .4byte 0x020399A8
_080CE6FC: .4byte 0x00000CEE
_080CE700: .4byte 0x00000CF9
_080CE704: .4byte 0x00000D1D
_080CE708: .4byte 0x00000D41
_080CE70C: .4byte 0x00000D65
_080CE710:
	ldr r3, _080CE734
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE790
	mov r0, sl
	cmp r0, #0
	beq _080CE73C
	ldr r2, _080CE738
	adds r0, r1, r2
	adds r3, #1
	adds r1, r1, r3
	movs r2, #0
	movs r3, #5
	bl StringCopyPadded
	b _080CE74A
	.align 2, 0
_080CE734: .4byte 0x00000CED
_080CE738: .4byte 0x00000CF9
_080CE73C:
	ldr r2, _080CE778
	adds r0, r1, r2
	ldr r1, _080CE77C
	movs r2, #0
	movs r3, #8
	bl StringCopyPadded
_080CE74A:
	ldr r4, _080CE780
	ldr r0, [r4]
	ldr r3, _080CE784
	adds r0, r0, r3
	movs r1, #0
	movs r2, #8
	bl StringFill
	ldr r0, [r4]
	ldr r1, _080CE788
	adds r0, r0, r1
	movs r1, #0
	movs r2, #8
	bl StringFill
	ldr r0, [r4]
	ldr r2, _080CE78C
	adds r0, r0, r2
_080CE76E:
	movs r1, #0
	movs r2, #8
	bl StringFill
	b _080CE934
	.align 2, 0
_080CE778: .4byte 0x00000CF9
_080CE77C: .4byte 0x085C8C62
_080CE780: .4byte 0x020399A8
_080CE784: .4byte 0x00000D1D
_080CE788: .4byte 0x00000D41
_080CE78C: .4byte 0x00000D65
_080CE790:
	cmp r2, #0x1d
	beq _080CE798
	cmp r2, #0x20
	bne _080CE79C
_080CE798:
	movs r3, #0xff
	mov sb, r3
_080CE79C:
	ldr r4, _080CE81C
	ldr r1, [r4]
	ldr r2, _080CE820
	adds r0, r1, r2
	ldr r3, _080CE824
	adds r1, r1, r3
	movs r2, #0
	movs r3, #5
	bl StringCopyPadded
	ldr r1, [r4]
	ldr r0, _080CE828
	adds r2, r1, r0
	movs r0, #0xba
	strb r0, [r2]
	ldr r3, _080CE82C
	adds r2, r1, r3
	ldr r0, [r4]
	ldr r1, _080CE830
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080CE834
	adds r1, r1, r0
	adds r0, r2, #0
	movs r2, #0
	movs r3, #5
	bl StringCopyPadded
	ldr r4, [r4]
	ldr r3, _080CE838
	adds r2, r4, r3
	movs r0, #0xfc
	strb r0, [r2]
	ldr r0, _080CE83C
	adds r2, r4, r0
	movs r0, #4
	strb r0, [r2]
	ldr r1, _080CE840
	adds r2, r4, r1
	mov r3, sb
	cmp r3, #0
	beq _080CE850
	cmp r3, #0xfe
	beq _080CE87C
	movs r0, #2
	strb r0, [r2]
	ldr r0, _080CE844
	adds r2, r4, r0
	movs r0, #1
	strb r0, [r2]
	adds r1, #2
	adds r2, r4, r1
	movs r0, #3
	strb r0, [r2]
	ldr r3, _080CE848
	adds r2, r4, r3
	movs r0, #0
	strb r0, [r2]
	ldr r0, _080CE84C
	adds r2, r4, r0
	b _080CE89C
	.align 2, 0
_080CE81C: .4byte 0x020399A8
_080CE820: .4byte 0x00000CF9
_080CE824: .4byte 0x00000CEE
_080CE828: .4byte 0x00000D1D
_080CE82C: .4byte 0x00000D1E
_080CE830: .4byte 0x00000CE4
_080CE834: .4byte 0x082EA31C
_080CE838: .4byte 0x00000D41
_080CE83C: .4byte 0x00000D42
_080CE840: .4byte 0x00000D43
_080CE844: .4byte 0x00000D44
_080CE848: .4byte 0x00000D46
_080CE84C: .4byte 0x00000D47
_080CE850:
	strb r0, [r2]
	ldr r1, _080CE870
	adds r2, r4, r1
	movs r0, #1
	strb r0, [r2]
	ldr r3, _080CE874
	adds r2, r4, r3
	movs r0, #5
	strb r0, [r2]
	ldr r0, _080CE878
	adds r2, r4, r0
	movs r0, #0xb5
	strb r0, [r2]
	adds r1, #3
	adds r2, r4, r1
	b _080CE89C
	.align 2, 0
_080CE870: .4byte 0x00000D44
_080CE874: .4byte 0x00000D45
_080CE878: .4byte 0x00000D46
_080CE87C:
	movs r0, #6
	strb r0, [r2]
	ldr r3, _080CE90C
	adds r2, r4, r3
	movs r0, #1
	strb r0, [r2]
	ldr r0, _080CE910
	adds r2, r4, r0
	movs r0, #7
	strb r0, [r2]
	ldr r1, _080CE914
	adds r2, r4, r1
	movs r0, #0xb6
	strb r0, [r2]
	adds r3, #3
	adds r2, r4, r3
_080CE89C:
	movs r0, #0xfc
	strb r0, [r2]
	adds r2, #1
	movs r0, #4
	strb r0, [r2]
	adds r2, #1
	movs r0, #2
	strb r0, [r2]
	adds r2, #1
	movs r0, #1
	strb r0, [r2]
	adds r2, #1
	movs r0, #3
	strb r0, [r2]
	adds r2, #1
	movs r5, #0
	strb r5, [r2]
	adds r2, #1
	movs r0, #0xf9
	strb r0, [r2]
	adds r2, #1
	movs r0, #5
	strb r0, [r2]
	adds r2, #1
	ldr r4, _080CE918
	ldr r0, [r4]
	ldr r1, _080CE91C
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r2, r0, #0
	strb r5, [r2]
	movs r0, #0xff
	strb r0, [r2, #1]
	ldr r4, [r4]
	ldr r2, _080CE920
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _080CE928
	ldr r3, _080CE924
	adds r4, r4, r3
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #8
	bl StringCopyPadded
	b _080CE934
	.align 2, 0
_080CE90C: .4byte 0x00000D44
_080CE910: .4byte 0x00000D45
_080CE914: .4byte 0x00000D46
_080CE918: .4byte 0x020399A8
_080CE91C: .4byte 0x00000CEC
_080CE920: .4byte 0x00000CE6
_080CE924: .4byte 0x00000D65
_080CE928:
	ldr r1, _080CE944
	adds r0, r4, r1
	movs r1, #0
	movs r2, #8
	bl StringFill
_080CE934:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE944: .4byte 0x00000D65
	thumb_func_end SetCursorMonData

	thumb_func_start HandleInput_InBox
HandleInput_InBox: @ 0x080CE948
	push {lr}
	ldr r0, _080CE968
	ldr r0, [r0]
	ldr r1, _080CE96C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CE970
	cmp r0, #1
	ble _080CE960
	cmp r0, #2
	beq _080CE976
_080CE960:
	bl InBoxInput_Normal
	b _080CE97A
	.align 2, 0
_080CE968: .4byte 0x020399A8
_080CE96C: .4byte 0x000021FF
_080CE970:
	bl InBoxInput_GrabbingMultiple
	b _080CE97A
_080CE976:
	bl InBoxInput_MovingMultiple
_080CE97A:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end HandleInput_InBox

	thumb_func_start InBoxInput_Normal
InBoxInput_Normal: @ 0x080CE984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080CEA08
	ldrb r0, [r0]
	mov r8, r0
	ldr r2, _080CEA0C
	ldrb r4, [r2]
	ldr r5, _080CEA10
	ldr r0, [r5]
	ldr r1, _080CEA14
	mov sl, r1
	add r0, sl
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r5]
	ldr r7, _080CEA18
	adds r0, r0, r7
	strb r1, [r0]
	ldr r0, [r5]
	ldr r3, _080CEA1C
	mov sb, r3
	add r0, sb
	strb r1, [r0]
	ldr r6, _080CEA20
	ldrh r1, [r6, #0x30]
	movs r0, #0x40
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _080CE9C8
	b _080CEBB8
_080CE9C8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080CEA24
	movs r6, #1
	lsls r0, r4, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r4, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bgt _080CE9E4
	b _080CEBD4
_080CE9E4:
	movs r2, #3
	mov r8, r2
	subs r0, #0x1e
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [r5]
	add r0, sl
	strb r6, [r0]
	ldr r0, [r5]
	add r0, sb
	strb r6, [r0]
	b _080CEBD4
	.align 2, 0
_080CEA08: .4byte 0x02039A18
_080CEA0C: .4byte 0x02039A19
_080CEA10: .4byte 0x020399A8
_080CEA14: .4byte 0x00000CD2
_080CEA18: .4byte 0x00000CD3
_080CEA1C: .4byte 0x00000CD7
_080CEA20: .4byte 0x03002360
_080CEA24:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080CEA5A
	movs r6, #1
	movs r0, #0
	ldrsb r0, [r3, r0]
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEA46
	lsls r0, r4, #0x18
	movs r3, #0xff
	lsls r3, r3, #0x18
	b _080CEBC8
_080CEA46:
	ldr r0, [r5]
	adds r0, r0, r7
	movs r1, #0xff
	strb r1, [r0]
	lsls r0, r4, #0x18
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r4, r0, #0x18
	b _080CEBD4
_080CEA5A:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080CEA8E
	movs r6, #1
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #1
	movs r1, #6
	bl __modsi3
	cmp r0, #0
	beq _080CEA80
	lsls r0, r4, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r4, r0, #0x18
	b _080CEBD4
_080CEA80:
	ldr r0, [r5]
	adds r0, r0, r7
	strb r6, [r0]
	lsls r0, r4, #0x18
	movs r3, #0xfb
	lsls r3, r3, #0x18
	b _080CEBC8
_080CEA8E:
	ldrh r1, [r6, #0x2e]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080CEA9C
	movs r6, #1
	b _080CEBCE
_080CEA9C:
	movs r4, #1
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080CEB60
	bl sub_080CF2D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEB60
	ldr r0, _080CEABC
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CEAC0
	movs r0, #8
	b _080CEBE2
	.align 2, 0
_080CEABC: .4byte 0x02039A1D
_080CEAC0:
	ldr r1, [r5]
	ldrb r0, [r1, #1]
	cmp r0, #2
	bne _080CEAD0
	ldr r0, _080CEAEC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080CEB50
_080CEAD0:
	movs r0, #0
	bl sub_080CF814
	subs r0, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bhi _080CEB60
	lsls r0, r0, #2
	ldr r1, _080CEAF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CEAEC: .4byte 0x02039A1A
_080CEAF0: .4byte 0x080CEAF4
_080CEAF4: @ jump table
	.4byte _080CEB30 @ case 0
	.4byte _080CEB34 @ case 1
	.4byte _080CEB38 @ case 2
	.4byte _080CEB3C @ case 3
	.4byte _080CEB40 @ case 4
	.4byte _080CEB60 @ case 5
	.4byte _080CEB60 @ case 6
	.4byte _080CEB60 @ case 7
	.4byte _080CEB60 @ case 8
	.4byte _080CEB60 @ case 9
	.4byte _080CEB60 @ case 10
	.4byte _080CEB44 @ case 11
	.4byte _080CEB48 @ case 12
	.4byte _080CEB60 @ case 13
	.4byte _080CEB4C @ case 14
_080CEB30:
	movs r0, #0xb
	b _080CEBE2
_080CEB34:
	movs r0, #0xc
	b _080CEBE2
_080CEB38:
	movs r0, #0xd
	b _080CEBE2
_080CEB3C:
	movs r0, #0xe
	b _080CEBE2
_080CEB40:
	movs r0, #0xf
	b _080CEBE2
_080CEB44:
	movs r0, #0x10
	b _080CEBE2
_080CEB48:
	movs r0, #0x11
	b _080CEBE2
_080CEB4C:
	movs r0, #0x12
	b _080CEBE2
_080CEB50:
	ldr r2, _080CEB5C
	adds r0, r1, r2
	strb r4, [r0]
	movs r0, #0x14
	b _080CEBE2
	.align 2, 0
_080CEB5C: .4byte 0x000021FF
_080CEB60:
	ldr r2, _080CEB70
	ldrh r1, [r2, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080CEB74
	movs r0, #0x13
	b _080CEBE2
	.align 2, 0
_080CEB70: .4byte 0x03002360
_080CEB74:
	ldr r0, _080CEB90
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _080CEBA2
	ldrh r1, [r2, #0x2c]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080CEB94
	movs r0, #0xa
	b _080CEBE2
	.align 2, 0
_080CEB90: .4byte 0x03005AF0
_080CEB94:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080CEBA2
	movs r0, #9
	b _080CEBE2
_080CEBA2:
	ldrh r1, [r2, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080CEBB4
	bl sub_080CF640
	movs r0, #0
	b _080CEBE2
_080CEBB4:
	movs r6, #0
	b _080CEBE0
_080CEBB8:
	movs r6, #1
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #5
	ble _080CEBCE
	lsls r0, r4, #0x18
	movs r3, #0xfa
	lsls r3, r3, #0x18
_080CEBC8:
	adds r0, r0, r3
	lsrs r4, r0, #0x18
	b _080CEBD4
_080CEBCE:
	movs r0, #2
	mov r8, r0
	movs r4, #0
_080CEBD4:
	cmp r6, #0
	beq _080CEBE0
	mov r0, r8
	adds r1, r4, #0
	bl sub_080CD110
_080CEBE0:
	adds r0, r6, #0
_080CEBE2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end InBoxInput_Normal

	thumb_func_start InBoxInput_GrabbingMultiple
InBoxInput_GrabbingMultiple: @ 0x080CEBF0
	push {r4, lr}
	ldr r1, _080CEC20
	ldrh r0, [r1, #0x2c]
	movs r4, #1
	ands r4, r0
	cmp r4, #0
	beq _080CECA4
	ldrh r1, [r1, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080CEC28
	ldr r4, _080CEC24
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #6
	bl __divsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEC9C
	ldrb r1, [r4]
	subs r1, #6
	b _080CEC8A
	.align 2, 0
_080CEC20: .4byte 0x03002360
_080CEC24: .4byte 0x02039A19
_080CEC28:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080CEC48
	ldr r1, _080CEC44
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r0, #6
	cmp r0, #0x1d
	bgt _080CEC9C
	ldrb r1, [r1]
	adds r1, #6
	b _080CEC8A
	.align 2, 0
_080CEC44: .4byte 0x02039A19
_080CEC48:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080CEC6C
	ldr r4, _080CEC68
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEC9C
	ldrb r1, [r4]
	subs r1, #1
	b _080CEC8A
	.align 2, 0
_080CEC68: .4byte 0x02039A19
_080CEC6C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080CECA0
	ldr r4, _080CEC98
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, #1
	movs r1, #6
	bl __modsi3
	cmp r0, #0
	beq _080CEC9C
	ldrb r1, [r4]
	adds r1, #1
_080CEC8A:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_080CD110
	movs r0, #0x15
	b _080CED18
	.align 2, 0
_080CEC98: .4byte 0x02039A19
_080CEC9C:
	movs r0, #0x18
	b _080CED18
_080CECA0:
	movs r0, #0
	b _080CED18
_080CECA4:
	bl sub_080D0444
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080CECE0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	beq _080CECF8
	ldr r2, _080CECE4
	ldr r0, _080CECE8
	ldr r1, [r0]
	ldr r3, _080CECEC
	adds r0, r1, r3
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	ldr r0, _080CECF0
	adds r1, r1, r0
	movs r0, #2
	strb r0, [r1]
	bl StorageGetCurrentBox
	ldr r1, _080CECF4
	strb r0, [r1]
	movs r0, #0x17
	b _080CED18
	.align 2, 0
_080CECE0: .4byte 0x02039A19
_080CECE4: .4byte 0x02039A1A
_080CECE8: .4byte 0x020399A8
_080CECEC: .4byte 0x00000CE4
_080CECF0: .4byte 0x000021FF
_080CECF4: .4byte 0x02039A1B
_080CECF8:
	ldr r1, _080CED20
	ldr r0, [r1]
	ldr r2, _080CED24
	adds r0, r0, r2
	strb r4, [r0]
	ldr r0, [r1]
	ldr r3, _080CED28
	adds r0, r0, r3
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	movs r0, #0x16
_080CED18:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080CED20: .4byte 0x020399A8
_080CED24: .4byte 0x000021FF
_080CED28: .4byte 0x00000CB8
	thumb_func_end InBoxInput_GrabbingMultiple

	thumb_func_start InBoxInput_MovingMultiple
InBoxInput_MovingMultiple: @ 0x080CED2C
	push {r4, lr}
	ldr r2, _080CED50
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080CED58
	movs r0, #0
	bl sub_080CFE20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEE04
	ldr r0, _080CED54
	ldrb r1, [r0]
	subs r1, #6
	b _080CEDB6
	.align 2, 0
_080CED50: .4byte 0x03002360
_080CED54: .4byte 0x02039A19
_080CED58:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080CED78
	movs r0, #1
	bl sub_080CFE20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEE04
	ldr r0, _080CED74
	ldrb r1, [r0]
	adds r1, #6
	b _080CEDB6
	.align 2, 0
_080CED74: .4byte 0x02039A19
_080CED78:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080CED98
	movs r0, #2
	bl sub_080CFE20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEE1E
	ldr r0, _080CED94
	ldrb r1, [r0]
	subs r1, #1
	b _080CEDB6
	.align 2, 0
_080CED94: .4byte 0x02039A19
_080CED98:
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080CEDC8
	movs r0, #3
	bl sub_080CFE20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEE32
	ldr r0, _080CEDC4
	ldrb r1, [r0]
	adds r1, #1
_080CEDB6:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_080CD110
	movs r0, #0x19
	b _080CEE38
	.align 2, 0
_080CEDC4: .4byte 0x02039A19
_080CEDC8:
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080CEDFC
	bl sub_080D0460
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEE04
	ldr r0, _080CEDF0
	strb r4, [r0]
	ldr r0, _080CEDF4
	ldr r0, [r0]
	ldr r1, _080CEDF8
	adds r0, r0, r1
	strb r4, [r0]
	movs r0, #0x1a
	b _080CEE38
	.align 2, 0
_080CEDF0: .4byte 0x02039A1A
_080CEDF4: .4byte 0x020399A8
_080CEDF8: .4byte 0x000021FF
_080CEDFC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080CEE08
_080CEE04:
	movs r0, #0x18
	b _080CEE38
_080CEE08:
	ldr r0, _080CEE24
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _080CEE36
	ldrh r1, [r2, #0x2c]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080CEE28
_080CEE1E:
	movs r0, #0xa
	b _080CEE38
	.align 2, 0
_080CEE24: .4byte 0x03005AF0
_080CEE28:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080CEE36
_080CEE32:
	movs r0, #9
	b _080CEE38
_080CEE36:
	movs r0, #0
_080CEE38:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end InBoxInput_MovingMultiple

	thumb_func_start HandleInput_InParty
HandleInput_InParty: @ 0x080CEE40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080CEEB0
	ldrb r0, [r0]
	mov sb, r0
	ldr r6, _080CEEB4
	ldrb r4, [r6]
	ldr r2, _080CEEB8
	ldr r0, [r2]
	ldr r1, _080CEEBC
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r3, _080CEEC0
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, #5
	adds r0, r0, r3
	strb r1, [r0]
	mov r8, r1
	movs r7, #0
	ldr r1, _080CEEC4
	ldrh r3, [r1, #0x30]
	movs r0, #0x40
	ands r0, r3
	adds r5, r6, #0
	mov ip, r1
	cmp r0, #0
	beq _080CEE84
	b _080CF024
_080CEE84:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080CEEC8
	lsls r0, r4, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r4, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _080CEE9E
	movs r4, #0
_080CEE9E:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r5, r1]
	cmp r0, r1
	bne _080CEEAC
	b _080CF042
_080CEEAC:
	movs r7, #1
	b _080CF046
	.align 2, 0
_080CEEB0: .4byte 0x02039A18
_080CEEB4: .4byte 0x02039A19
_080CEEB8: .4byte 0x020399A8
_080CEEBC: .4byte 0x00000CD3
_080CEEC0: .4byte 0x00000CD2
_080CEEC4: .4byte 0x03002360
_080CEEC8:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080CEEEC
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080CEEEC
	movs r7, #1
	ldr r0, [r2]
	ldr r2, _080CEEE8
	adds r0, r0, r2
	strb r1, [r0]
	movs r4, #0
	b _080CF042
	.align 2, 0
_080CEEE8: .4byte 0x00000CD6
_080CEEEC:
	mov r3, ip
	ldrh r1, [r3, #0x30]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080CEF1A
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _080CEF10
	movs r7, #1
	ldr r0, [r2]
	ldr r1, _080CEF0C
	adds r0, r0, r1
	ldrb r4, [r0]
	b _080CF042
	.align 2, 0
_080CEF0C: .4byte 0x00000CD6
_080CEF10:
	movs r7, #6
	movs r2, #0
	mov sb, r2
	movs r4, #0
	b _080CF042
_080CEF1A:
	mov r3, ip
	ldrh r1, [r3, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080CEFD8
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #6
	bne _080CEF40
	ldr r0, [r2]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _080CEF3A
	movs r0, #4
	b _080CF054
_080CEF3A:
	movs r0, #1
	mov r8, r0
	b _080CEFD8
_080CEF40:
	bl sub_080CF2D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEFD8
	ldr r0, _080CEF58
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CEF5C
	movs r0, #8
	b _080CF054
	.align 2, 0
_080CEF58: .4byte 0x02039A1D
_080CEF5C:
	movs r0, #0
	bl sub_080CF814
	subs r0, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bhi _080CEFD8
	lsls r0, r0, #2
	ldr r1, _080CEF78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CEF78: .4byte 0x080CEF7C
_080CEF7C: @ jump table
	.4byte _080CEFB8 @ case 0
	.4byte _080CEFBC @ case 1
	.4byte _080CEFC0 @ case 2
	.4byte _080CEFC4 @ case 3
	.4byte _080CEFC8 @ case 4
	.4byte _080CEFD8 @ case 5
	.4byte _080CEFD8 @ case 6
	.4byte _080CEFD8 @ case 7
	.4byte _080CEFD8 @ case 8
	.4byte _080CEFD8 @ case 9
	.4byte _080CEFD8 @ case 10
	.4byte _080CEFCC @ case 11
	.4byte _080CEFD0 @ case 12
	.4byte _080CEFD8 @ case 13
	.4byte _080CEFD4 @ case 14
_080CEFB8:
	movs r0, #0xb
	b _080CF054
_080CEFBC:
	movs r0, #0xc
	b _080CF054
_080CEFC0:
	movs r0, #0xd
	b _080CF054
_080CEFC4:
	movs r0, #0xe
	b _080CF054
_080CEFC8:
	movs r0, #0xf
	b _080CF054
_080CEFCC:
	movs r0, #0x10
	b _080CF054
_080CEFD0:
	movs r0, #0x11
	b _080CF054
_080CEFD4:
	movs r0, #0x12
	b _080CF054
_080CEFD8:
	ldr r2, _080CEFF4
	ldrh r1, [r2, #0x2e]
	movs r0, #2
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _080CF000
	ldr r0, _080CEFF8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _080CEFFC
	movs r0, #0x13
	b _080CF054
	.align 2, 0
_080CEFF4: .4byte 0x03002360
_080CEFF8: .4byte 0x020399A8
_080CEFFC:
	movs r1, #1
	mov r8, r1
_080CF000:
	mov r2, r8
	cmp r2, #0
	beq _080CF010
	movs r7, #6
	movs r3, #0
	mov sb, r3
	movs r4, #0
	b _080CF042
_080CF010:
	mov r0, ip
	ldrh r1, [r0, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080CF042
	bl sub_080CF640
	movs r0, #0
	b _080CF054
_080CF024:
	lsls r0, r4, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r4, r0, #0x18
	cmp r0, #0
	bge _080CF034
	movs r4, #6
_080CF034:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r6, r1]
	cmp r0, r1
	beq _080CF042
	movs r7, #1
_080CF042:
	cmp r7, #0
	beq _080CF052
_080CF046:
	cmp r7, #6
	beq _080CF052
	mov r0, sb
	adds r1, r4, #0
	bl sub_080CD110
_080CF052:
	adds r0, r7, #0
_080CF054:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end HandleInput_InParty

	thumb_func_start HandleInput_OnBox
HandleInput_OnBox: @ 0x080CF060
	push {r4, r5, r6, lr}
	ldr r3, _080CF09C
	ldr r0, [r3]
	ldr r1, _080CF0A0
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r3]
	ldr r2, _080CF0A4
	adds r0, r0, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldr r5, _080CF0A8
	adds r0, r0, r5
	strb r1, [r0]
	ldr r1, _080CF0AC
	ldrh r2, [r1, #0x30]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080CF126
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080CF0B0
	movs r4, #1
	movs r1, #0
	movs r6, #2
	b _080CF132
	.align 2, 0
_080CF09C: .4byte 0x020399A8
_080CF0A0: .4byte 0x00000CD3
_080CF0A4: .4byte 0x00000CD2
_080CF0A8: .4byte 0x00000CD7
_080CF0AC: .4byte 0x03002360
_080CF0B0:
	ldrh r2, [r1, #0x2c]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _080CF0D6
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _080CF0EA
	ldr r0, _080CF0DC
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _080CF0EE
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080CF0E0
_080CF0D6:
	movs r0, #0xa
	b _080CF14E
	.align 2, 0
_080CF0DC: .4byte 0x03005AF0
_080CF0E0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080CF0EE
_080CF0EA:
	movs r0, #9
	b _080CF14E
_080CF0EE:
	ldrh r1, [r1, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080CF106
	movs r0, #0
	bl sub_080CCA24
	bl AddBoxMenu
	movs r0, #7
	b _080CF14E
_080CF106:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080CF112
	movs r0, #0x13
	b _080CF14E
_080CF112:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080CF122
	bl sub_080CF640
	movs r0, #0
	b _080CF14E
_080CF122:
	movs r4, #0
	b _080CF14C
_080CF126:
	movs r4, #1
	movs r1, #3
	movs r6, #0
	ldr r0, [r3]
	adds r0, r0, r5
	strb r4, [r0]
_080CF132:
	cmp r4, #0
	beq _080CF14C
	lsls r5, r1, #0x18
	cmp r1, #2
	beq _080CF142
	movs r0, #0
	bl sub_080CCA24
_080CF142:
	lsrs r0, r5, #0x18
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	bl sub_080CD110
_080CF14C:
	adds r0, r4, #0
_080CF14E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end HandleInput_OnBox

	thumb_func_start HandleInput_OnButtons
HandleInput_OnButtons: @ 0x080CF154
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080CF1A4
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _080CF1A8
	mov ip, r0
	ldrb r2, [r0]
	ldr r3, _080CF1AC
	ldr r0, [r3]
	ldr r1, _080CF1B0
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r3]
	ldr r6, _080CF1B4
	adds r0, r0, r6
	strb r1, [r0]
	ldr r0, [r3]
	ldr r5, _080CF1B8
	adds r0, r0, r5
	strb r1, [r0]
	ldr r7, _080CF1BC
	ldrh r1, [r7, #0x30]
	movs r0, #0x40
	ands r0, r1
	adds r4, r3, #0
	cmp r0, #0
	bne _080CF22E
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	beq _080CF1C0
	movs r7, #1
	movs r0, #2
	mov r8, r0
	movs r2, #0
	ldr r0, [r4]
	b _080CF24C
	.align 2, 0
_080CF1A4: .4byte 0x02039A18
_080CF1A8: .4byte 0x02039A19
_080CF1AC: .4byte 0x020399A8
_080CF1B0: .4byte 0x00000CD3
_080CF1B4: .4byte 0x00000CD2
_080CF1B8: .4byte 0x00000CD7
_080CF1BC: .4byte 0x03002360
_080CF1C0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080CF1DC
	movs r7, #1
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	cmp r0, #0
	bge _080CF250
	movs r2, #1
	b _080CF250
_080CF1DC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080CF1FA
	movs r7, #1
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _080CF250
	movs r2, #0
	b _080CF250
_080CF1FA:
	ldrh r1, [r7, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080CF20E
	movs r0, #4
	cmp r2, #0
	bne _080CF25E
	movs r0, #5
	b _080CF25E
_080CF20E:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080CF21A
	movs r0, #0x13
	b _080CF25E
_080CF21A:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080CF22A
	bl sub_080CF640
	movs r0, #0
	b _080CF25E
_080CF22A:
	movs r7, #0
	b _080CF25C
_080CF22E:
	movs r7, #1
	movs r0, #0
	mov r8, r0
	ldr r0, [r3]
	adds r0, r0, r6
	movs r1, #0xff
	strb r1, [r0]
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r2, #0x1d
	cmp r0, #0
	bne _080CF24A
	movs r2, #0x18
_080CF24A:
	ldr r0, [r3]
_080CF24C:
	adds r0, r0, r5
	strb r7, [r0]
_080CF250:
	cmp r7, #0
	beq _080CF25C
	mov r0, r8
	adds r1, r2, #0
	bl sub_080CD110
_080CF25C:
	adds r0, r7, #0
_080CF25E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end HandleInput_OnButtons

	thumb_func_start sub_080CF268
sub_080CF268: @ 0x080CF268
	push {r4, r5, lr}
	movs r3, #0
	ldr r0, _080CF294
	ldr r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	beq _080CF2AC
	ldr r5, _080CF298
_080CF278:
	lsls r0, r3, #3
	adds r2, r0, r4
	movs r1, #4
	ldrsb r1, [r2, r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _080CF29C
	ldr r0, [r2]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080CF2AE
	.align 2, 0
_080CF294: .4byte 0x085564B8
_080CF298: .4byte 0x02039A18
_080CF29C:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r0, r3, #3
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _080CF278
_080CF2AC:
	movs r0, #0
_080CF2AE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080CF268

	thumb_func_start AddBoxMenu
AddBoxMenu: @ 0x080CF2B4
	push {lr}
	bl InitMenu
	movs r0, #9
	bl SetMenuText
	movs r0, #0xa
	bl SetMenuText
	movs r0, #0xb
	bl SetMenuText
	movs r0, #0
	bl SetMenuText
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AddBoxMenu

	thumb_func_start sub_080CF2D8
sub_080CF2D8: @ 0x080CF2D8
	push {lr}
	bl InitMenu
	ldr r0, _080CF2F0
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080CF2F4
	bl sub_080CF3C0
	b _080CF2F8
	.align 2, 0
_080CF2F0: .4byte 0x020399A8
_080CF2F4:
	bl sub_080CF300
_080CF2F8:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end sub_080CF2D8

	thumb_func_start sub_080CF300
sub_080CF300: @ 0x080CF300
	push {lr}
	bl sub_080CCD80
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080CF320
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _080CF32A
	cmp r0, #1
	bgt _080CF324
	cmp r0, #0
	beq _080CF336
	b _080CF370
	.align 2, 0
_080CF320: .4byte 0x020399A8
_080CF324:
	cmp r0, #2
	beq _080CF342
	b _080CF370
_080CF32A:
	cmp r1, #0
	beq _080CF370
	movs r0, #1
	bl SetMenuText
	b _080CF374
_080CF336:
	cmp r1, #0
	beq _080CF370
	movs r0, #2
	bl SetMenuText
	b _080CF374
_080CF342:
	ldr r0, _080CF358
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF364
	cmp r1, #0
	beq _080CF35C
	movs r0, #4
	bl SetMenuText
	b _080CF374
	.align 2, 0
_080CF358: .4byte 0x02039A1A
_080CF35C:
	movs r0, #5
	bl SetMenuText
	b _080CF374
_080CF364:
	cmp r1, #0
	beq _080CF370
	movs r0, #3
	bl SetMenuText
	b _080CF374
_080CF370:
	movs r0, #0
	b _080CF3BA
_080CF374:
	movs r0, #6
	bl SetMenuText
	ldr r0, _080CF398
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _080CF3A6
	ldr r0, _080CF39C
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080CF3A0
	movs r0, #2
	bl SetMenuText
	b _080CF3A6
	.align 2, 0
_080CF398: .4byte 0x020399A8
_080CF39C: .4byte 0x02039A18
_080CF3A0:
	movs r0, #1
	bl SetMenuText
_080CF3A6:
	movs r0, #8
	bl SetMenuText
	movs r0, #7
	bl SetMenuText
	movs r0, #0
	bl SetMenuText
	movs r0, #1
_080CF3BA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CF300

	thumb_func_start sub_080CF3C0
sub_080CF3C0: @ 0x080CF3C0
	push {r4, r5, lr}
	ldr r4, _080CF3FC
	ldr r0, [r4]
	ldr r5, _080CF400
	adds r0, r0, r5
	ldrh r1, [r0]
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	beq _080CF456
	bl IsActiveItemMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CF428
	ldr r2, [r4]
	ldr r0, _080CF404
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _080CF408
	adds r0, r2, r5
	ldrh r0, [r0]
	cmp r0, #0
	beq _080CF456
	movs r0, #0xe
	bl SetMenuText
	b _080CF460
	.align 2, 0
_080CF3FC: .4byte 0x020399A8
_080CF400: .4byte 0x00000CE4
_080CF404: .4byte 0x00000CE6
_080CF408:
	ldrh r0, [r1]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CF420
	movs r0, #0xc
	bl SetMenuText
	movs r0, #0x10
	bl SetMenuText
_080CF420:
	movs r0, #0x11
	bl SetMenuText
	b _080CF460
_080CF428:
	ldr r2, [r4]
	ldr r0, _080CF444
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _080CF448
	adds r0, r2, r5
	ldrh r0, [r0]
	cmp r0, #0
	beq _080CF456
	movs r0, #0xd
	bl SetMenuText
	b _080CF460
	.align 2, 0
_080CF444: .4byte 0x00000CE6
_080CF448:
	ldrh r0, [r1]
	bl ItemIsMail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080CF45A
_080CF456:
	movs r0, #0
	b _080CF468
_080CF45A:
	movs r0, #0xf
	bl SetMenuText
_080CF460:
	movs r0, #0
	bl SetMenuText
	movs r0, #1
_080CF468:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CF3C0

	thumb_func_start sub_080CF470
sub_080CF470: @ 0x080CF470
	ldr r1, _080CF488
	ldr r1, [r1]
	ldr r2, _080CF48C
	adds r1, r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, #0x20]
	strh r2, [r0, #0x20]
	ldr r1, [r1]
	ldrh r1, [r1, #0x22]
	adds r1, #0x14
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_080CF488: .4byte 0x020399A8
_080CF48C: .4byte 0x00000CB4
	thumb_func_end sub_080CF470

	thumb_func_start sub_080CF490
sub_080CF490: @ 0x080CF490
	push {r4, r5, r6, lr}
	sub sp, #0x2c
	mov r1, sp
	ldr r0, _080CF55C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	add r4, sp, #0x18
	adds r1, r4, #0
	ldr r0, _080CF560
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, #0
	bl LoadSpritePalettes
	ldr r0, _080CF564
	bl IndexOfSpritePaletteTag
	ldr r6, _080CF568
	ldr r1, [r6]
	ldr r4, _080CF56C
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, _080CF570
	bl IndexOfSpritePaletteTag
	ldr r1, [r6]
	ldr r5, _080CF574
	adds r1, r1, r5
	strb r0, [r1]
	ldr r0, _080CF578
	ldrb r0, [r0]
	ldr r1, _080CF57C
	ldrb r1, [r1]
	add r4, sp, #0x28
	mov r5, sp
	adds r5, #0x2a
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_080CCCC0
	ldr r0, _080CF580
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r3, #6
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _080CF594
	ldr r2, [r6]
	ldr r4, _080CF584
	adds r3, r2, r4
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080CF588
	adds r1, r1, r0
	str r1, [r3]
	ldr r0, _080CF58C
	ldr r5, _080CF56C
	adds r2, r2, r5
	ldrb r0, [r0]
	adds r2, r2, r0
	ldrb r2, [r2]
	lsls r2, r2, #4
	ldrb r3, [r1, #5]
	movs r0, #0xf
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r0, [r6]
	adds r0, r0, r4
	ldr r2, [r0]
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, _080CF590
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF59E
	ldr r0, [r6]
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #3
	bl StartSpriteAnim
	b _080CF59E
	.align 2, 0
_080CF55C: .4byte 0x085564E0
_080CF560: .4byte 0x085564F8
_080CF564: .4byte 0x0000DACA
_080CF568: .4byte 0x020399A8
_080CF56C: .4byte 0x00000CD8
_080CF570: .4byte 0x0000DAC7
_080CF574: .4byte 0x00000CD9
_080CF578: .4byte 0x02039A18
_080CF57C: .4byte 0x02039A19
_080CF580: .4byte 0x0855654C
_080CF584: .4byte 0x00000CB4
_080CF588: .4byte 0x020205AC
_080CF58C: .4byte 0x02039A1D
_080CF590: .4byte 0x02039A1A
_080CF594:
	ldr r0, [r6]
	ldr r1, _080CF5B0
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
_080CF59E:
	ldr r0, _080CF5B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080CF5B8
	movs r3, #0xd
	movs r4, #1
	b _080CF5BC
	.align 2, 0
_080CF5B0: .4byte 0x00000CB4
_080CF5B4: .4byte 0x02039A18
_080CF5B8:
	movs r3, #0x15
	movs r4, #2
_080CF5BC:
	ldr r0, _080CF610
	movs r1, #0
	movs r2, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _080CF624
	ldr r5, _080CF614
	ldr r2, [r5]
	ldr r3, _080CF618
	adds r2, r2, r3
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080CF61C
	adds r1, r1, r0
	str r1, [r2]
	lsls r3, r4, #2
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldr r0, _080CF620
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CF630
	ldr r0, [r5]
	ldr r4, _080CF618
	adds r0, r0, r4
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	b _080CF630
	.align 2, 0
_080CF610: .4byte 0x08556564
_080CF614: .4byte 0x020399A8
_080CF618: .4byte 0x00000CB8
_080CF61C: .4byte 0x020205AC
_080CF620: .4byte 0x02039A18
_080CF624:
	ldr r0, _080CF638
	ldr r0, [r0]
	ldr r5, _080CF63C
	adds r0, r0, r5
	movs r1, #0
	str r1, [r0]
_080CF630:
	add sp, #0x2c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CF638: .4byte 0x020399A8
_080CF63C: .4byte 0x00000CB8
	thumb_func_end sub_080CF490

	thumb_func_start sub_080CF640
sub_080CF640: @ 0x080CF640
	push {lr}
	ldr r2, _080CF674
	movs r1, #0
	ldrb r0, [r2]
	cmp r0, #0
	bne _080CF64E
	movs r1, #1
_080CF64E:
	strb r1, [r2]
	ldr r0, _080CF678
	ldr r0, [r0]
	ldr r3, _080CF67C
	adds r1, r0, r3
	ldr r3, [r1]
	ldr r1, _080CF680
	adds r0, r0, r1
	ldrb r2, [r2]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r1, r1, #4
	ldrb r2, [r3, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	pop {r0}
	bx r0
	.align 2, 0
_080CF674: .4byte 0x02039A1D
_080CF678: .4byte 0x020399A8
_080CF67C: .4byte 0x00000CB4
_080CF680: .4byte 0x00000CD8
	thumb_func_end sub_080CF640

	thumb_func_start sub_080CF684
sub_080CF684: @ 0x080CF684
	ldr r0, _080CF68C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080CF68C: .4byte 0x02039A19
	thumb_func_end sub_080CF684

	thumb_func_start sub_080CF690
sub_080CF690: @ 0x080CF690
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _080CF6BC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080CF6C4
	ldr r4, _080CF6C0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #6
	bl __modsi3
	strb r0, [r5]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #6
	bl __divsi3
	b _080CF6C8
	.align 2, 0
_080CF6BC: .4byte 0x02039A18
_080CF6C0: .4byte 0x02039A19
_080CF6C4:
	movs r0, #0
	strb r0, [r5]
_080CF6C8:
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080CF690

	thumb_func_start sub_080CF6D0
sub_080CF6D0: @ 0x080CF6D0
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080CF6EC
	ldr r0, [r0]
	ldr r2, _080CF6F0
	adds r0, r0, r2
	ldr r0, [r0]
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080CF6EC: .4byte 0x020399A8
_080CF6F0: .4byte 0x00000CB4
	thumb_func_end sub_080CF6D0

	thumb_func_start sub_080CF6F4
sub_080CF6F4: @ 0x080CF6F4
	ldr r0, _080CF6FC
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080CF6FC: .4byte 0x02039A1B
	thumb_func_end sub_080CF6F4

	thumb_func_start sub_080CF700
sub_080CF700: @ 0x080CF700
	ldr r0, _080CF71C
	ldr r0, [r0]
	ldr r1, _080CF720
	adds r0, r0, r1
	ldr r2, [r0]
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #5]
	bx lr
	.align 2, 0
_080CF71C: .4byte 0x020399A8
_080CF720: .4byte 0x00000CB4
	thumb_func_end sub_080CF700

	thumb_func_start sub_080CF724
sub_080CF724: @ 0x080CF724
	push {lr}
	ldr r0, _080CF740
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080CF73C
	ldr r0, _080CF744
	ldrb r1, [r0]
	movs r0, #0
	bl sub_080D06F0
_080CF73C:
	pop {r0}
	bx r0
	.align 2, 0
_080CF740: .4byte 0x02039A18
_080CF744: .4byte 0x02039A19
	thumb_func_end sub_080CF724

	thumb_func_start sub_080CF748
sub_080CF748: @ 0x080CF748
	push {lr}
	ldr r0, _080CF764
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080CF760
	ldr r0, _080CF768
	ldrb r1, [r0]
	movs r0, #0
	bl sub_080D062C
_080CF760:
	pop {r0}
	bx r0
	.align 2, 0
_080CF764: .4byte 0x02039A18
_080CF768: .4byte 0x02039A19
	thumb_func_end sub_080CF748

	thumb_func_start InitMenu
InitMenu: @ 0x080CF76C
	ldr r2, _080CF7A0
	ldr r0, [r2]
	ldr r1, _080CF7A4
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r3, _080CF7A8
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	subs r3, #0x41
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _080CF7AC
	adds r0, r0, r1
	movs r1, #0xf
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, #6
	adds r0, r0, r3
	movs r1, #0x5c
	strh r1, [r0]
	bx lr
	.align 2, 0
_080CF7A0: .4byte 0x020399A8
_080CF7A4: .4byte 0x00000CAC
_080CF7A8: .4byte 0x00000CAD
_080CF7AC: .4byte 0x00000C71
	thumb_func_end InitMenu

	thumb_func_start SetMenuText
SetMenuText: @ 0x080CF7B0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r4, _080CF800
	ldr r2, [r4]
	ldr r5, _080CF804
	adds r1, r2, r5
	ldrb r0, [r1]
	cmp r0, #6
	bhi _080CF7FA
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _080CF808
	adds r1, r1, r0
	adds r1, r2, r1
	ldr r2, _080CF80C
	lsls r0, r3, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
	str r3, [r1, #4]
	bl StringLength
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r4]
	ldr r2, _080CF810
	adds r0, r0, r2
	ldrb r2, [r0]
	cmp r1, r2
	bls _080CF7F0
	strb r1, [r0]
_080CF7F0:
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080CF7FA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF800: .4byte 0x020399A8
_080CF804: .4byte 0x00000CAC
_080CF808: .4byte 0x00000C74
_080CF80C: .4byte 0x0855657C
_080CF810: .4byte 0x00000CAD
	thumb_func_end SetMenuText

	thumb_func_start sub_080CF814
sub_080CF814: @ 0x080CF814
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080CF838
	ldr r1, [r0]
	ldr r3, _080CF83C
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bhs _080CF844
	lsls r0, r2, #3
	ldr r2, _080CF840
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	b _080CF848
	.align 2, 0
_080CF838: .4byte 0x020399A8
_080CF83C: .4byte 0x00000CAC
_080CF840: .4byte 0x00000C78
_080CF844:
	movs r0, #1
	rsbs r0, r0, #0
_080CF848:
	pop {r1}
	bx r1
	thumb_func_end sub_080CF814

	thumb_func_start AddMenu
AddMenu: @ 0x080CF84C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	ldr r5, _080CF928
	ldr r1, [r5]
	ldr r2, _080CF92C
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r0, #2
	subs r2, #0x3e
	adds r1, r1, r2
	movs r3, #0
	mov sb, r3
	strb r0, [r1]
	ldr r1, [r5]
	ldr r6, _080CF930
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, r0, #1
	movs r3, #0xc7
	lsls r3, r3, #4
	adds r1, r1, r3
	strb r0, [r1]
	ldr r1, [r5]
	adds r2, r1, r2
	ldrb r2, [r2]
	movs r0, #0x1d
	subs r0, r0, r2
	ldr r2, _080CF934
	adds r1, r1, r2
	strb r0, [r1]
	ldr r1, [r5]
	adds r3, r1, r3
	ldrb r2, [r3]
	movs r0, #0xf
	subs r0, r0, r2
	ldr r3, _080CF938
	adds r1, r1, r3
	strb r0, [r1]
	ldr r0, [r5]
	ldr r1, _080CF93C
	adds r0, r0, r1
	bl AddWindow
	ldr r1, [r5]
	movs r4, #0xcb
	lsls r4, r4, #4
	adds r1, r1, r4
	movs r2, #0
	mov r8, r2
	strh r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #0xb
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, [r5]
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r1, #0x10
	str r1, [sp]
	adds r1, r2, r6
	ldrb r1, [r1]
	str r1, [sp, #4]
	ldr r3, _080CF940
	adds r2, r2, r3
	str r2, [sp, #8]
	movs r1, #1
	movs r2, #8
	movs r3, #2
	bl PrintTextArray
	ldr r1, [r5]
	adds r4, r1, r4
	ldrb r0, [r4]
	adds r1, r1, r6
	ldrb r1, [r1]
	str r1, [sp]
	mov r1, sb
	str r1, [sp, #4]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984F0
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, [r5]
	ldr r2, _080CF944
	adds r0, r0, r2
	mov r3, r8
	strb r3, [r0]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CF928: .4byte 0x020399A8
_080CF92C: .4byte 0x00000CAD
_080CF930: .4byte 0x00000CAC
_080CF934: .4byte 0x00000C6D
_080CF938: .4byte 0x00000C6E
_080CF93C: .4byte 0x00000C6C
_080CF940: .4byte 0x00000C74
_080CF944: .4byte 0x00000CAE
	thumb_func_end AddMenu

	thumb_func_start sub_080CF948
sub_080CF948: @ 0x080CF948
	movs r0, #0
	bx lr
	thumb_func_end sub_080CF948

	thumb_func_start sub_080CF94C
sub_080CF94C: @ 0x080CF94C
	push {r4, r5, lr}
	movs r5, #2
	rsbs r5, r5, #0
	ldr r4, _080CF988
	ldrh r1, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080CF9A2
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080CF96E
	movs r0, #5
	bl PlaySE
	adds r5, #1
_080CF96E:
	ldrh r1, [r4, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080CF98C
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	bl Menu_MoveCursor
	b _080CF9AA
	.align 2, 0
_080CF988: .4byte 0x03002360
_080CF98C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080CF9AA
	movs r0, #5
	bl PlaySE
	movs r0, #1
	bl Menu_MoveCursor
	b _080CF9AA
_080CF9A2:
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080CF9AA:
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	beq _080CF9B6
	bl sub_080CF9DC
_080CF9B6:
	cmp r5, #0
	blt _080CF9C8
	ldr r0, _080CF9D4
	ldr r0, [r0]
	lsls r1, r5, #3
	ldr r2, _080CF9D8
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r5, [r0]
_080CF9C8:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080CF9D4: .4byte 0x020399A8
_080CF9D8: .4byte 0x00000C78
	thumb_func_end sub_080CF94C

	thumb_func_start sub_080CF9DC
sub_080CF9DC: @ 0x080CF9DC
	push {r4, r5, lr}
	ldr r5, _080CFA00
	ldr r0, [r5]
	movs r4, #0xcb
	lsls r4, r4, #4
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CFA00: .4byte 0x020399A8
	thumb_func_end sub_080CF9DC

	thumb_func_start sub_080CFA04
sub_080CFA04: @ 0x080CFA04
	push {r4, lr}
	ldr r4, _080CFA40
	ldr r0, _080CFA44
	bl Alloc
	str r0, [r4]
	cmp r0, #0
	beq _080CFA50
	ldr r0, _080CFA48
	bl AddWindow8Bit
	adds r1, r0, #0
	ldr r0, _080CFA4C
	ldr r0, [r0]
	movs r2, #0x88
	lsls r2, r2, #6
	adds r0, r0, r2
	strh r1, [r0]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	beq _080CFA50
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #1
	b _080CFA52
	.align 2, 0
_080CFA40: .4byte 0x02039A20
_080CFA44: .4byte 0x00000974
_080CFA48: .4byte 0x08556618
_080CFA4C: .4byte 0x020399A8
_080CFA50:
	movs r0, #0
_080CFA52:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080CFA04

	thumb_func_start sub_080CFA58
sub_080CFA58: @ 0x080CFA58
	push {lr}
	ldr r0, _080CFA6C
	ldr r0, [r0]
	cmp r0, #0
	beq _080CFA66
	bl Free
_080CFA66:
	pop {r0}
	bx r0
	.align 2, 0
_080CFA6C: .4byte 0x02039A20
	thumb_func_end sub_080CFA58

	thumb_func_start sub_080CFA70
sub_080CFA70: @ 0x080CFA70
	ldr r2, _080CFA80
	ldr r1, [r2]
	movs r3, #0
	strb r0, [r1]
	ldr r0, [r2]
	strb r3, [r0, #1]
	bx lr
	.align 2, 0
_080CFA80: .4byte 0x02039A20
	thumb_func_end sub_080CFA70

	thumb_func_start sub_080CFA84
sub_080CFA84: @ 0x080CFA84
	push {lr}
	ldr r0, _080CFA9C
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #5
	bhi _080CFAE4
	lsls r0, r0, #2
	ldr r1, _080CFAA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CFA9C: .4byte 0x02039A20
_080CFAA0: .4byte 0x080CFAA4
_080CFAA4: @ jump table
	.4byte _080CFABC @ case 0
	.4byte _080CFAC2 @ case 1
	.4byte _080CFAC8 @ case 2
	.4byte _080CFACE @ case 3
	.4byte _080CFAD4 @ case 4
	.4byte _080CFADA @ case 5
_080CFABC:
	bl sub_080CFAEC
	b _080CFADE
_080CFAC2:
	bl sub_080CFBE4
	b _080CFADE
_080CFAC8:
	bl sub_080CFC50
	b _080CFADE
_080CFACE:
	bl sub_080CFCC0
	b _080CFADE
_080CFAD4:
	bl sub_080CFD40
	b _080CFADE
_080CFADA:
	bl sub_080CFD68
_080CFADE:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080CFAE6
_080CFAE4:
	movs r0, #0
_080CFAE6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CFA84

	thumb_func_start sub_080CFAEC
sub_080CFAEC: @ 0x080CFAEC
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r6, _080CFB04
	ldr r1, [r6]
	ldrb r0, [r1, #1]
	cmp r0, #1
	beq _080CFB1C
	cmp r0, #1
	bgt _080CFB08
	cmp r0, #0
	beq _080CFB0E
	b _080CFBD8
	.align 2, 0
_080CFB04: .4byte 0x02039A20
_080CFB08:
	cmp r0, #2
	beq _080CFBC4
	b _080CFBD8
_080CFB0E:
	movs r0, #0
	bl HideBg
	movs r0, #0x80
	bl sub_080D28EC
	b _080CFBAE
_080CFB1C:
	adds r0, r1, #2
	adds r1, #3
	bl sub_080CF690
	ldr r1, [r6]
	ldrb r0, [r1, #2]
	strb r0, [r1, #4]
	ldr r1, [r6]
	ldrb r0, [r1, #3]
	strb r0, [r1, #5]
	ldr r4, _080CFBB8
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	ldr r5, _080CFBBC
	ldr r0, [r5]
	movs r4, #0x88
	lsls r4, r4, #6
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0
	bl FillWindowPixelBuffer8Bit
	ldr r1, [r6]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_080D0050
	movs r0, #0
	movs r1, #4
	movs r2, #1
	bl SetBgAttribute
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram8Bit
	movs r0, #0xfc
	lsls r0, r0, #6
	ldr r2, _080CFBC0
	movs r1, #8
	bl BlendPalettes
	movs r0, #2
	bl sub_080CF6D0
	movs r0, #8
	movs r1, #0x80
	bl SetGpuRegBits
_080CFBAE:
	ldr r1, [r6]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _080CFBD8
	.align 2, 0
_080CFBB8: .4byte 0xFFFFFC00
_080CFBBC: .4byte 0x020399A8
_080CFBC0: .4byte 0x00007FFF
_080CFBC4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CFBD8
	movs r0, #0
	bl ShowBg
	movs r0, #0
	b _080CFBDA
_080CFBD8:
	movs r0, #1
_080CFBDA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CFAEC

	thumb_func_start sub_080CFBE4
sub_080CFBE4: @ 0x080CFBE4
	push {r4, lr}
	ldr r4, _080CFBFC
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _080CFC0E
	cmp r0, #1
	bgt _080CFC00
	cmp r0, #0
	beq _080CFC06
	b _080CFC48
	.align 2, 0
_080CFBFC: .4byte 0x02039A20
_080CFC00:
	cmp r0, #2
	beq _080CFC22
	b _080CFC48
_080CFC06:
	movs r0, #0
	bl HideBg
	b _080CFC18
_080CFC0E:
	bl sub_080D03FC
	movs r0, #0
	bl sub_080CF6D0
_080CFC18:
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _080CFC48
_080CFC22:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CFC48
	bl sub_080CF700
	movs r0, #3
	bl stdpal_get
	movs r1, #0xd0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0
	bl ShowBg
	movs r0, #0
	b _080CFC4A
_080CFC48:
	movs r0, #1
_080CFC4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080CFBE4

	thumb_func_start sub_080CFC50
sub_080CFC50: @ 0x080CFC50
	push {r4, lr}
	ldr r4, _080CFC64
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _080CFC68
	cmp r0, #1
	beq _080CFCAC
	b _080CFCB6
	.align 2, 0
_080CFC64: .4byte 0x02039A20
_080CFC68:
	bl sub_080CCDD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CFCB6
	ldr r1, [r4]
	adds r0, r1, #6
	adds r1, #7
	bl sub_080CF690
	bl sub_080CFECC
	ldr r1, [r4]
	ldrb r0, [r1, #6]
	strb r0, [r1, #4]
	ldr r1, [r4]
	ldrb r0, [r1, #7]
	strb r0, [r1, #5]
	ldr r0, _080CFCA8
	ldr r0, [r0]
	movs r1, #0x88
	lsls r1, r1, #6
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram8Bit
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _080CFCB6
	.align 2, 0
_080CFCA8: .4byte 0x020399A8
_080CFCAC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080CFCB8
_080CFCB6:
	movs r0, #1
_080CFCB8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CFC50

	thumb_func_start sub_080CFCC0
sub_080CFCC0: @ 0x080CFCC0
	push {r4, lr}
	ldr r4, _080CFCD8
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _080CFCEE
	cmp r0, #1
	bgt _080CFCDC
	cmp r0, #0
	beq _080CFCE2
	b _080CFD38
	.align 2, 0
_080CFCD8: .4byte 0x02039A20
_080CFCDC:
	cmp r0, #2
	beq _080CFD1A
	b _080CFD38
_080CFCE2:
	bl sub_080D016C
	bl sub_080D0244
	movs r0, #0
	b _080CFD0C
_080CFCEE:
	bl DoMonPlaceChange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CFD38
	movs r0, #3
	bl sub_080CF6D0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	movs r2, #8
	bl sub_080D0124
	movs r0, #1
_080CFD0C:
	bl sub_080CD4E0
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _080CFD38
_080CFD1A:
	bl sub_080D0134
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DoMonPlaceChange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, #0
	bne _080CFD38
	cmp r0, #0
	bne _080CFD38
	movs r0, #0
	b _080CFD3A
_080CFD38:
	movs r0, #1
_080CFD3A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080CFCC0

	thumb_func_start sub_080CFD40
sub_080CFD40: @ 0x080CFD40
	push {r4, lr}
	bl sub_080CCDD0
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_080D0134
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, #0
	bne _080CFD60
	cmp r0, #0
	bne _080CFD60
	movs r0, #0
	b _080CFD62
_080CFD60:
	movs r0, #1
_080CFD62:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080CFD40

	thumb_func_start sub_080CFD68
sub_080CFD68: @ 0x080CFD68
	push {r4, lr}
	ldr r4, _080CFD80
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _080CFDA6
	cmp r0, #1
	bgt _080CFD84
	cmp r0, #0
	beq _080CFD8E
	b _080CFE16
	.align 2, 0
_080CFD80: .4byte 0x02039A20
_080CFD84:
	cmp r0, #2
	beq _080CFDD2
	cmp r0, #3
	beq _080CFDF0
	b _080CFE16
_080CFD8E:
	bl sub_080D034C
	movs r1, #0xff
	lsls r1, r1, #8
	movs r0, #0
	movs r2, #8
	bl sub_080D0124
	movs r0, #0
	bl sub_080CD4E0
	b _080CFDE6
_080CFDA6:
	bl DoMonPlaceChange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CFE16
	bl sub_080D0134
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CFE16
	bl sub_080D02BC
	movs r0, #2
	bl sub_080CF6D0
	movs r0, #1
	bl sub_080CD4E0
	movs r0, #0
	bl HideBg
	b _080CFDE6
_080CFDD2:
	bl DoMonPlaceChange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CFE16
	movs r0, #0
	bl sub_080CF6D0
	bl sub_080D03FC
_080CFDE6:
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _080CFE16
_080CFDF0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CFE16
	movs r0, #3
	bl stdpal_get
	movs r1, #0xd0
	movs r2, #0x20
	bl LoadPalette
	bl sub_080CF700
	movs r0, #0
	bl ShowBg
	movs r0, #0
	b _080CFE18
_080CFE16:
	movs r0, #1
_080CFE18:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CFD68

	thumb_func_start sub_080CFE20
sub_080CFE20: @ 0x080CFE20
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	beq _080CFE5C
	cmp r0, #1
	bgt _080CFE36
	cmp r0, #0
	beq _080CFE40
	b _080CFEC4
_080CFE36:
	cmp r1, #2
	beq _080CFE7C
	cmp r1, #3
	beq _080CFE9C
	b _080CFEC4
_080CFE40:
	ldr r0, _080CFE58
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	cmp r0, #0
	beq _080CFEAA
	subs r0, #1
	strb r0, [r1, #9]
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	b _080CFE90
	.align 2, 0
_080CFE58: .4byte 0x02039A20
_080CFE5C:
	ldr r0, _080CFE78
	ldr r1, [r0]
	ldrb r2, [r1, #9]
	ldrb r0, [r1, #0xb]
	adds r0, r2, r0
	cmp r0, #4
	bgt _080CFEAA
	adds r0, r2, #1
	strb r0, [r1, #9]
	movs r1, #0xfc
	lsls r1, r1, #8
	movs r0, #0
	b _080CFE90
	.align 2, 0
_080CFE78: .4byte 0x02039A20
_080CFE7C:
	ldr r0, _080CFE98
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _080CFEAA
	subs r0, #1
	strb r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	movs r1, #0
_080CFE90:
	movs r2, #6
	bl sub_080D0124
	b _080CFEC4
	.align 2, 0
_080CFE98: .4byte 0x02039A20
_080CFE9C:
	ldr r0, _080CFEB0
	ldr r1, [r0]
	ldrb r2, [r1, #8]
	ldrb r0, [r1, #0xa]
	adds r0, r2, r0
	cmp r0, #5
	ble _080CFEB4
_080CFEAA:
	movs r0, #0
	b _080CFEC6
	.align 2, 0
_080CFEB0: .4byte 0x02039A20
_080CFEB4:
	adds r0, r2, #1
	strb r0, [r1, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	movs r1, #0
	movs r2, #6
	bl sub_080D0124
_080CFEC4:
	movs r0, #1
_080CFEC6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080CFE20

	thumb_func_start sub_080CFECC
sub_080CFECC: @ 0x080CFECC
	push {r4, r5, r6, r7, lr}
	ldr r6, _080CFF6C
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	ldrb r5, [r2, #6]
	subs r1, r3, r5
	cmp r1, #0
	bge _080CFEDE
	rsbs r1, r1, #0
_080CFEDE:
	ldrb r0, [r2, #4]
	subs r0, r3, r0
	cmp r0, #0
	bge _080CFEE8
	rsbs r0, r0, #0
_080CFEE8:
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #7]
	subs r3, r1, r0
	cmp r3, #0
	bge _080CFEFA
	rsbs r3, r3, #0
_080CFEFA:
	ldrb r2, [r2, #5]
	subs r0, r1, r2
	cmp r0, #0
	bge _080CFF04
	rsbs r0, r0, #0
_080CFF04:
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	ble _080CFF18
	adds r0, r5, #0
	bl sub_080CFF70
_080CFF18:
	cmp r4, #0
	bge _080CFF34
	ldr r2, [r6]
	ldrb r0, [r2, #4]
	ldrb r1, [r2, #3]
	ldrb r2, [r2, #5]
	bl sub_080CFFE0
	ldr r2, [r6]
	ldrb r0, [r2, #6]
	ldrb r1, [r2, #3]
	ldrb r2, [r2, #5]
	bl sub_080CFF70
_080CFF34:
	lsls r0, r7, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	ble _080CFF48
	ldr r2, [r6]
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #4]
	bl sub_080CFFA8
_080CFF48:
	cmp r4, #0
	bge _080CFF64
	ldr r2, [r6]
	ldrb r0, [r2, #5]
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #4]
	bl sub_080D0018
	ldr r2, [r6]
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #4]
	bl sub_080CFFA8
_080CFF64:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CFF6C: .4byte 0x02039A20
	thumb_func_end sub_080CFECC

	thumb_func_start sub_080CFF70
sub_080CFF70: @ 0x080CFF70
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r1, r4, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r0, r5, #0
	cmp r4, r5
	bls _080CFF8E
	adds r4, r5, #0
	adds r5, r1, #0
	cmp r0, r5
	bhi _080CFFA0
_080CFF8E:
	adds r1, r4, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	bl sub_080D0050
	cmp r4, r5
	bls _080CFF8E
_080CFFA0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CFF70

	thumb_func_start sub_080CFFA8
sub_080CFFA8: @ 0x080CFFA8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r1, r4, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r0, r5, #0
	cmp r4, r5
	bls _080CFFC6
	adds r4, r5, #0
	adds r5, r1, #0
	cmp r0, r5
	bhi _080CFFD8
_080CFFC6:
	adds r0, r4, #0
	adds r1, r0, #1
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r1, r6, #0
	bl sub_080D0050
	cmp r4, r5
	bls _080CFFC6
_080CFFD8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CFFA8

	thumb_func_start sub_080CFFE0
sub_080CFFE0: @ 0x080CFFE0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r1, r4, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r0, r5, #0
	cmp r4, r5
	bls _080CFFFE
	adds r4, r5, #0
	adds r5, r1, #0
	cmp r0, r5
	bhi _080D0010
_080CFFFE:
	adds r1, r4, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	bl sub_080D00D4
	cmp r4, r5
	bls _080CFFFE
_080D0010:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080CFFE0

	thumb_func_start sub_080D0018
sub_080D0018: @ 0x080D0018
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r1, r4, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r0, r5, #0
	cmp r4, r5
	bls _080D0036
	adds r4, r5, #0
	adds r5, r1, #0
	cmp r0, r5
	bhi _080D0048
_080D0036:
	adds r0, r4, #0
	adds r1, r0, #1
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r1, r6, #0
	bl sub_080D00D4
	cmp r4, r5
	bls _080D0036
_080D0048:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080D0018

	thumb_func_start sub_080D0050
sub_080D0050: @ 0x080D0050
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #1
	adds r7, r0, r1
	lsls r4, r7, #1
	adds r4, r6, r4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0x41
	bl GetCurrentBoxMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0
	bl GetCurrentBoxMonData
	adds r1, r0, #0
	cmp r5, #0
	beq _080D00C8
	adds r0, r5, #0
	movs r2, #1
	bl GetMonIconPtr
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetValidMonIconPalIndex
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080D00D0
	ldr r1, [r1]
	movs r2, #0x88
	lsls r2, r2, #6
	adds r1, r1, r2
	ldrb r3, [r1]
	movs r2, #0x20
	str r2, [sp]
	str r2, [sp, #4]
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #3
	str r1, [sp, #8]
	lsls r1, r7, #3
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	str r0, [sp, #0x18]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl BlitBitmapRectToWindow4BitTo8Bit
_080D00C8:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D00D0: .4byte 0x020399A8
	thumb_func_end sub_080D0050

	thumb_func_start sub_080D00D4
sub_080D00D4: @ 0x080D00D4
	push {r4, r5, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #1
	adds r5, r0, r1
	lsls r0, r5, #1
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x41
	bl GetCurrentBoxMonData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080D0118
	ldr r0, _080D0120
	ldr r0, [r0]
	movs r1, #0x88
	lsls r1, r1, #6
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #3
	lsls r3, r5, #3
	movs r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #0
	bl FillWindowPixelRect8Bit
_080D0118:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0120: .4byte 0x020399A8
	thumb_func_end sub_080D00D4

	thumb_func_start sub_080D0124
sub_080D0124: @ 0x080D0124
	ldr r3, _080D0130
	ldr r3, [r3]
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r2, [r3, #0x10]
	bx lr
	.align 2, 0
_080D0130: .4byte 0x02039A20
	thumb_func_end sub_080D0124

	thumb_func_start sub_080D0134
sub_080D0134: @ 0x080D0134
	push {r4, lr}
	ldr r4, _080D0168
	ldr r1, [r4]
	ldrh r0, [r1, #0x10]
	cmp r0, #0
	beq _080D015E
	ldrh r1, [r1, #0xc]
	movs r0, #0
	movs r2, #1
	bl ChangeBgX
	ldr r0, [r4]
	ldrh r1, [r0, #0xe]
	movs r0, #0
	movs r2, #1
	bl ChangeBgY
	ldr r1, [r4]
	ldrh r0, [r1, #0x10]
	subs r0, #1
	strh r0, [r1, #0x10]
_080D015E:
	ldr r0, [r4]
	ldrb r0, [r0, #0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D0168: .4byte 0x02039A20
	thumb_func_end sub_080D0134

	thumb_func_start sub_080D016C
sub_080D016C: @ 0x080D016C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _080D0240
	ldr r1, [r4]
	ldrb r0, [r1, #4]
	ldrb r2, [r1, #2]
	cmp r0, r2
	bls _080D0184
	adds r0, r2, #0
_080D0184:
	strb r0, [r1, #8]
	ldr r1, [r4]
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #3]
	cmp r0, r2
	bls _080D0192
	adds r0, r2, #0
_080D0192:
	strb r0, [r1, #9]
	ldr r2, [r4]
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #4]
	subs r0, r1, r0
	cmp r0, #0
	bge _080D01A2
	rsbs r0, r0, #0
_080D01A2:
	adds r0, #1
	strb r0, [r2, #0xa]
	ldr r2, [r4]
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #5]
	subs r0, r1, r0
	cmp r0, #0
	bge _080D01B4
	rsbs r0, r0, #0
_080D01B4:
	adds r0, #1
	strb r0, [r2, #0xb]
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r6, #0
	ldr r0, [r4]
	ldrb r2, [r0, #8]
	ldrb r1, [r0, #0xa]
	adds r2, r2, r1
	mov r8, r2
	ldrb r1, [r0, #9]
	ldrb r0, [r0, #0xb]
	adds r0, r0, r1
	mov sb, r0
	adds r2, r1, #0
	cmp r2, sb
	bge _080D0230
_080D01DC:
	lsls r0, r2, #1
	adds r0, r0, r2
	ldr r3, _080D0240
	ldr r1, [r3]
	lsls r0, r0, #1
	ldrb r3, [r1, #8]
	adds r0, r0, r3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r4, [r1, #8]
	adds r7, r2, #1
	cmp r4, r8
	bge _080D022A
	mov r0, r8
	subs r4, r0, r4
_080D01FA:
	mov r0, sl
	adds r1, r5, #0
	bl GetBoxedMonPtr
	adds r1, r0, #0
	ldr r2, _080D0240
	ldr r0, [r2]
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, #0x14
	movs r2, #0x50
	bl memcpy
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	subs r4, #1
	cmp r4, #0
	bne _080D01FA
_080D022A:
	adds r2, r7, #0
	cmp r2, sb
	blt _080D01DC
_080D0230:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0240: .4byte 0x02039A20
	thumb_func_end sub_080D016C

	thumb_func_start sub_080D0244
sub_080D0244: @ 0x080D0244
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _080D02B8
	ldr r0, [r4]
	ldrb r2, [r0, #8]
	ldrb r1, [r0, #0xa]
	adds r7, r2, r1
	ldrb r1, [r0, #9]
	ldrb r0, [r0, #0xb]
	adds r1, r1, r0
	mov sb, r1
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4]
	ldrb r2, [r0, #9]
	cmp r2, sb
	bge _080D02AC
_080D0270:
	lsls r0, r2, #1
	adds r0, r0, r2
	ldr r1, _080D02B8
	ldr r1, [r1]
	lsls r0, r0, #1
	ldrb r3, [r1, #8]
	adds r0, r0, r3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r4, [r1, #8]
	adds r6, r2, #1
	cmp r4, r7
	bge _080D02A6
	subs r4, r7, r4
_080D028C:
	adds r0, r5, #0
	bl DestroyBoxMonIconAtPosition
	mov r0, r8
	adds r1, r5, #0
	bl ZeroBoxMonAt
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	subs r4, #1
	cmp r4, #0
	bne _080D028C
_080D02A6:
	adds r2, r6, #0
	cmp r2, sb
	blt _080D0270
_080D02AC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D02B8: .4byte 0x02039A20
	thumb_func_end sub_080D0244

	thumb_func_start sub_080D02BC
sub_080D02BC: @ 0x080D02BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080D0348
	ldr r0, [r0]
	ldrb r2, [r0, #8]
	ldrb r1, [r0, #0xa]
	adds r2, r2, r1
	mov r8, r2
	ldrb r1, [r0, #9]
	ldrb r0, [r0, #0xb]
	adds r0, r0, r1
	mov sl, r0
	movs r6, #0
	adds r2, r1, #0
	cmp r2, sl
	bge _080D0338
_080D02E2:
	lsls r0, r2, #1
	adds r0, r0, r2
	ldr r3, _080D0348
	ldr r1, [r3]
	lsls r0, r0, #1
	ldrb r4, [r1, #8]
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r4, [r1, #8]
	adds r7, r2, #1
	cmp r4, r8
	bge _080D0332
	mov sb, r3
	mov r0, r8
	subs r4, r0, r4
_080D0302:
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #4
	adds r1, #0x14
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #5
	bl GetBoxMonData
	cmp r0, #0
	beq _080D0320
	adds r0, r5, #0
	bl sub_080CA9B4
_080D0320:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	subs r4, #1
	cmp r4, #0
	bne _080D0302
_080D0332:
	adds r2, r7, #0
	cmp r2, sl
	blt _080D02E2
_080D0338:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0348: .4byte 0x02039A20
	thumb_func_end sub_080D02BC

	thumb_func_start sub_080D034C
sub_080D034C: @ 0x080D034C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, _080D03F8
	ldr r0, [r4]
	ldrb r2, [r0, #8]
	ldrb r1, [r0, #0xa]
	adds r2, r2, r1
	mov sl, r2
	ldrb r1, [r0, #9]
	ldrb r0, [r0, #0xb]
	adds r1, r1, r0
	str r1, [sp]
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r7, #0
	ldr r0, [r4]
	ldrb r3, [r0, #9]
	ldr r0, [sp]
	cmp r3, r0
	bge _080D03E6
_080D0382:
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r2, _080D03F8
	ldr r1, [r2]
	lsls r0, r0, #1
	ldrb r4, [r1, #8]
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r5, [r1, #8]
	adds r3, #1
	mov sb, r3
	cmp r5, sl
	bge _080D03DE
	mov r8, r2
	mov r0, sl
	subs r5, r0, r5
_080D03A4:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #4
	adds r4, r0, #0
	adds r4, #0x14
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	movs r1, #5
	bl GetBoxMonData
	cmp r0, #0
	beq _080D03CC
	mov r0, r8
	ldr r2, [r0]
	adds r2, r2, r4
	ldr r0, [sp, #4]
	adds r1, r6, #0
	bl SetBoxMonAt
_080D03CC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	subs r5, #1
	cmp r5, #0
	bne _080D03A4
_080D03DE:
	mov r3, sb
	ldr r1, [sp]
	cmp r3, r1
	blt _080D0382
_080D03E6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D03F8: .4byte 0x02039A20
	thumb_func_end sub_080D034C

	thumb_func_start sub_080D03FC
sub_080D03FC: @ 0x080D03FC
	push {lr}
	sub sp, #8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #0
	movs r1, #4
	movs r2, #0
	bl SetBgAttribute
	movs r0, #8
	movs r1, #0x80
	bl ClearGpuRegBits
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #8
	pop {r0}
	bx r0
	thumb_func_end sub_080D03FC

	thumb_func_start sub_080D0444
sub_080D0444: @ 0x080D0444
	ldr r0, _080D045C
	ldr r2, [r0]
	ldrb r1, [r2, #3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r2, [r2, #2]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080D045C: .4byte 0x02039A20
	thumb_func_end sub_080D0444

	thumb_func_start sub_080D0460
sub_080D0460: @ 0x080D0460
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080D04CC
	ldr r0, [r0]
	ldrb r2, [r0, #8]
	ldrb r1, [r0, #0xa]
	adds r2, r2, r1
	mov sb, r2
	ldrb r1, [r0, #9]
	ldrb r0, [r0, #0xb]
	adds r0, r1, r0
	str r0, [sp]
	movs r7, #0
	adds r6, r1, #0
	cmp r6, r0
	bge _080D04EE
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	mov r8, r0
_080D0490:
	ldr r2, _080D04CC
	ldr r1, [r2]
	ldrb r0, [r1, #8]
	add r0, r8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r4, [r1, #8]
	cmp r4, sb
	bge _080D04E2
	mov sl, r2
_080D04A4:
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #4
	adds r1, #0x14
	mov r2, sl
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #5
	bl GetBoxMonData
	cmp r0, #0
	beq _080D04D0
	adds r0, r5, #0
	movs r1, #5
	bl GetCurrentBoxMonData
	cmp r0, #0
	beq _080D04D0
	movs r0, #0
	b _080D04F0
	.align 2, 0
_080D04CC: .4byte 0x02039A20
_080D04D0:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #1
	cmp r4, sb
	blt _080D04A4
_080D04E2:
	movs r0, #6
	add r8, r0
	adds r6, #1
	ldr r2, [sp]
	cmp r6, r2
	blt _080D0490
_080D04EE:
	movs r0, #1
_080D04F0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080D0460

	thumb_func_start sub_080D0500
sub_080D0500: @ 0x080D0500
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r3, _080D05FC
	ldr r0, [r3]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080D05DE
	ldr r0, _080D0600
	str r0, [sp, #0x18]
	ldr r1, _080D0604
	add r2, sp, #0x18
	ldr r0, [r2, #4]
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r2, #4]
	mov r1, sp
	ldr r0, _080D0608
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	movs r7, #0
	mov sb, r2
	mov r8, r3
	movs r0, #0
	mov sl, r0
_080D0540:
	adds r6, r7, #7
	lsls r1, r6, #0x10
	mov r2, sb
	ldrh r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
	mov r0, sb
	bl LoadCompressedSpriteSheet
	mov r4, sb
	ldrh r0, [r4, #6]
	bl GetSpriteTileStartByTag
	mov r5, r8
	ldr r1, [r5]
	lsls r5, r7, #4
	ldr r2, _080D060C
	adds r1, r1, r2
	adds r1, r1, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	ldr r4, _080D0610
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, _080D0614
	adds r4, r7, r0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl AllocSpritePalette
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D0618
	adds r1, r1, r2
	strh r0, [r1]
	ldrh r0, [r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r0, [r1]
	mov r0, sp
	strh r6, [r0]
	strh r4, [r0, #2]
	movs r1, #0
	movs r2, #0
	movs r3, #0xb
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, r8
	ldr r2, [r4]
	ldr r6, _080D061C
	adds r2, r2, r6
	adds r2, r2, r5
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080D0620
	adds r1, r1, r0
	str r1, [r2]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r0, r5
	ldr r1, _080D0624
	adds r0, r0, r1
	mov r2, sl
	strb r2, [r0]
	adds r7, #1
	cmp r7, #2
	ble _080D0540
_080D05DE:
	ldr r0, _080D05FC
	ldr r0, [r0]
	ldr r4, _080D0628
	adds r0, r0, r4
	movs r1, #0
	strh r1, [r0]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D05FC: .4byte 0x020399A8
_080D0600: .4byte 0x03000F78
_080D0604: .4byte 0xFFFF0000
_080D0608: .4byte 0x0855676C
_080D060C: .4byte 0x00002208
_080D0610: .4byte 0x06010000
_080D0614: .4byte 0xFFFFDACB
_080D0618: .4byte 0x0000220C
_080D061C: .4byte 0x00002204
_080D0620: .4byte 0x020205AC
_080D0624: .4byte 0x00002210
_080D0628: .4byte 0x00002234
	thumb_func_end sub_080D0500

	thumb_func_start sub_080D062C
sub_080D062C: @ 0x080D062C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r0, _080D0660
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080D06E2
	mov r0, r8
	adds r1, r7, #0
	bl sub_080D0BC4
	cmp r0, #0
	bne _080D06E2
	mov r0, r8
	cmp r0, #0
	beq _080D0664
	cmp r0, #1
	beq _080D067A
	b _080D06E2
	.align 2, 0
_080D0660: .4byte 0x020399A8
_080D0664:
	adds r0, r7, #0
	movs r1, #5
	bl GetCurrentBoxMonData
	cmp r0, #0
	beq _080D06E2
	adds r0, r7, #0
	movs r1, #0xc
	bl GetCurrentBoxMonData
	b _080D069C
_080D067A:
	cmp r7, #5
	bhi _080D06E2
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _080D06EC
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _080D06E2
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
_080D069C:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080D06E2
	adds r0, r4, #0
	bl GetItemIconPic
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetItemIconPalette
	adds r5, r0, #0
	bl sub_080D0B88
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	mov r1, r8
	adds r2, r7, #0
	bl sub_080D0CAC
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_080D0DC4
	adds r0, r4, #0
	movs r1, #1
	bl sub_080D0E74
	adds r0, r4, #0
	movs r1, #1
	bl sub_080D0FE0
_080D06E2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D06EC: .4byte 0x02024190
	thumb_func_end sub_080D062C

	thumb_func_start sub_080D06F0
sub_080D06F0: @ 0x080D06F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080D072C
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080D0726
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080D0C10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #2
	bl sub_080D0E74
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_080D0EA4
_080D0726:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D072C: .4byte 0x020399A8
	thumb_func_end sub_080D06F0

	thumb_func_start Item_FromMonToMoving
Item_FromMonToMoving: @ 0x080D0730
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r7, r5, #0
	ldr r0, _080D0794
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080D07C0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080D0C10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #3
	bl sub_080D0E74
	adds r0, r4, #0
	movs r1, #1
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_080D0EA4
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl sub_080D0CAC
	cmp r6, #0
	bne _080D0798
	adds r0, r5, #0
	movs r1, #0xc
	mov r2, sp
	bl SetCurrentBoxMonData
	adds r0, r5, #0
	movs r1, #1
	bl SetBoxMonIconObjMode
	b _080D07B0
	.align 2, 0
_080D0794: .4byte 0x020399A8
_080D0798:
	movs r0, #0x64
	muls r0, r7, r0
	ldr r1, _080D07C8
	adds r0, r0, r1
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	adds r0, r7, #0
	movs r1, #1
	bl SetPartyMonIconObjMode
_080D07B0:
	ldr r0, _080D07CC
	ldr r0, [r0]
	ldr r2, _080D07D0
	adds r1, r0, r2
	ldrh r1, [r1]
	ldr r2, _080D07D4
	adds r0, r0, r2
	strh r1, [r0]
_080D07C0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D07C8: .4byte 0x02024190
_080D07CC: .4byte 0x020399A8
_080D07D0: .4byte 0x00000CE6
_080D07D4: .4byte 0x00002234
	thumb_func_end Item_FromMonToMoving

	thumb_func_start sub_080D07D8
sub_080D07D8: @ 0x080D07D8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r5, #0
	bl GetItemIconPic
	mov r8, r0
	adds r0, r5, #0
	bl GetItemIconPalette
	adds r6, r0, #0
	bl sub_080D0B88
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	mov r1, r8
	adds r2, r6, #0
	bl sub_080D0DC4
	adds r0, r4, #0
	movs r1, #6
	bl sub_080D0E74
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_080D0EA4
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl sub_080D0CAC
	adds r0, r4, #0
	movs r1, #1
	bl sub_080D0FE0
	ldr r0, _080D0844
	ldr r0, [r0]
	ldr r1, _080D0848
	adds r0, r0, r1
	strh r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D0844: .4byte 0x020399A8
_080D0848: .4byte 0x00002234
	thumb_func_end sub_080D07D8

	thumb_func_start Item_SwitchMonsWithMoving
Item_SwitchMonsWithMoving: @ 0x080D084C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r0, _080D08B4
	mov r8, r0
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080D090A
	mov r0, sb
	adds r1, r7, #0
	bl sub_080D0C10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	movs r1, #3
	bl sub_080D0E74
	adds r0, r4, #0
	movs r1, #3
	movs r2, #2
	movs r3, #0
	bl sub_080D0EA4
	mov r1, sb
	cmp r1, #0
	bne _080D08BC
	adds r0, r7, #0
	movs r1, #0xc
	bl GetCurrentBoxMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, r8
	ldr r2, [r0]
	ldr r4, _080D08B8
	adds r2, r2, r4
	adds r0, r7, #0
	movs r1, #0xc
	bl SetCurrentBoxMonData
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	b _080D08E8
	.align 2, 0
_080D08B4: .4byte 0x020399A8
_080D08B8: .4byte 0x00002234
_080D08BC:
	movs r0, #0x64
	adds r4, r7, #0
	muls r4, r0, r4
	ldr r0, _080D0918
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, r8
	ldr r2, [r0]
	ldr r5, _080D091C
	adds r2, r2, r5
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r5
_080D08E8:
	strh r6, [r0]
	movs r0, #2
	movs r1, #0
	bl sub_080D0C10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	movs r1, #4
	bl sub_080D0E74
	adds r0, r4, #0
	movs r1, #4
	mov r2, sb
	adds r3, r7, #0
	bl sub_080D0EA4
_080D090A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0918: .4byte 0x02024190
_080D091C: .4byte 0x00002234
	thumb_func_end Item_SwitchMonsWithMoving

	thumb_func_start Item_GiveMovingToMon
Item_GiveMovingToMon: @ 0x080D0920
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	mov r8, r5
	ldr r6, _080D0978
	ldr r0, [r6]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080D09A0
	movs r0, #2
	movs r1, #0
	bl sub_080D0C10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #4
	bl sub_080D0E74
	adds r0, r4, #0
	movs r1, #2
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_080D0EA4
	cmp r7, #0
	bne _080D0980
	ldr r2, [r6]
	ldr r0, _080D097C
	adds r2, r2, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl SetCurrentBoxMonData
	adds r0, r5, #0
	movs r1, #0
	bl SetBoxMonIconObjMode
	b _080D09A0
	.align 2, 0
_080D0978: .4byte 0x020399A8
_080D097C: .4byte 0x00002234
_080D0980:
	movs r0, #0x64
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r1, _080D09AC
	adds r0, r0, r1
	ldr r2, [r6]
	ldr r1, _080D09B0
	adds r2, r2, r1
	movs r1, #0xc
	bl SetMonData
	mov r0, r8
	movs r1, #0
	bl SetPartyMonIconObjMode
_080D09A0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D09AC: .4byte 0x02024190
_080D09B0: .4byte 0x00002234
	thumb_func_end Item_GiveMovingToMon

	thumb_func_start Item_TakeMons
Item_TakeMons: @ 0x080D09B4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r7, r5, #0
	ldr r0, _080D0A0C
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080D0A28
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080D0C10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #2
	bl sub_080D0E74
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_080D0EA4
	cmp r6, #0
	bne _080D0A10
	adds r0, r5, #0
	movs r1, #0xc
	mov r2, sp
	bl SetCurrentBoxMonData
	adds r0, r5, #0
	movs r1, #1
	bl SetBoxMonIconObjMode
	b _080D0A28
	.align 2, 0
_080D0A0C: .4byte 0x020399A8
_080D0A10:
	movs r0, #0x64
	muls r0, r7, r0
	ldr r1, _080D0A30
	adds r0, r0, r1
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	adds r0, r7, #0
	movs r1, #1
	bl SetPartyMonIconObjMode
_080D0A28:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0A30: .4byte 0x02024190
	thumb_func_end Item_TakeMons

	thumb_func_start sub_080D0A34
sub_080D0A34: @ 0x080D0A34
	push {r4, lr}
	ldr r0, _080D0A68
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080D0A62
	movs r0, #2
	movs r1, #0
	bl sub_080D0C10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #5
	bl sub_080D0E74
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	movs r3, #0
	bl sub_080D0EA4
_080D0A62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0A68: .4byte 0x020399A8
	thumb_func_end sub_080D0A34

	thumb_func_start sub_080D0A6C
sub_080D0A6C: @ 0x080D0A6C
	push {r4, lr}
	ldr r0, _080D0AB0
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080D0AAA
	movs r4, #0
_080D0A7A:
	ldr r0, _080D0AB0
	ldr r1, [r0]
	lsls r0, r4, #4
	adds r1, r1, r0
	ldr r2, _080D0AB4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D0AA4
	subs r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _080D0AA4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #7
	movs r2, #2
	movs r3, #0
	bl sub_080D0EA4
_080D0AA4:
	adds r4, #1
	cmp r4, #2
	ble _080D0A7A
_080D0AAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0AB0: .4byte 0x020399A8
_080D0AB4: .4byte 0x00002210
	thumb_func_end sub_080D0A6C

	thumb_func_start sub_080D0AB8
sub_080D0AB8: @ 0x080D0AB8
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _080D0AF4
	ldr r0, [r0]
	ldr r1, _080D0AF8
	adds r4, r0, r1
	adds r3, r0, #0
_080D0AC6:
	ldr r1, _080D0AFC
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D0B08
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x28
	ands r0, r1
	cmp r0, #8
	beq _080D0AEE
	ldr r1, [r2, #0x1c]
	ldr r0, _080D0B00
	cmp r1, r0
	beq _080D0B08
	ldr r0, _080D0B04
	cmp r1, r0
	beq _080D0B08
_080D0AEE:
	movs r0, #1
	b _080D0B14
	.align 2, 0
_080D0AF4: .4byte 0x020399A8
_080D0AF8: .4byte 0x00002204
_080D0AFC: .4byte 0x00002210
_080D0B00: .4byte 0x08007141
_080D0B04: .4byte 0x080D1379
_080D0B08:
	adds r4, #0x10
	adds r3, #0x10
	adds r5, #1
	cmp r5, #2
	ble _080D0AC6
	movs r0, #0
_080D0B14:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D0AB8

	thumb_func_start IsActiveItemMoving
IsActiveItemMoving: @ 0x080D0B1C
	push {lr}
	ldr r0, _080D0B40
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _080D0B50
	movs r2, #0
	ldr r0, _080D0B44
	adds r1, r1, r0
_080D0B2E:
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _080D0B48
	ldrb r0, [r1]
	cmp r0, #2
	bne _080D0B48
	movs r0, #1
	b _080D0B52
	.align 2, 0
_080D0B40: .4byte 0x020399A8
_080D0B44: .4byte 0x0000220E
_080D0B48:
	adds r1, #0x10
	adds r2, #1
	cmp r2, #2
	ble _080D0B2E
_080D0B50:
	movs r0, #0
_080D0B52:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsActiveItemMoving

	thumb_func_start GetMovingItemName
GetMovingItemName: @ 0x080D0B58
	push {lr}
	ldr r0, _080D0B6C
	ldr r0, [r0]
	ldr r1, _080D0B70
	adds r0, r0, r1
	ldrh r0, [r0]
	bl ItemId_GetName
	pop {r1}
	bx r1
	.align 2, 0
_080D0B6C: .4byte 0x020399A8
_080D0B70: .4byte 0x00002234
	thumb_func_end GetMovingItemName

	thumb_func_start GetMovingItem
GetMovingItem: @ 0x080D0B74
	ldr r0, _080D0B80
	ldr r0, [r0]
	ldr r1, _080D0B84
	adds r0, r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080D0B80: .4byte 0x020399A8
_080D0B84: .4byte 0x00002234
	thumb_func_end GetMovingItem

	thumb_func_start sub_080D0B88
sub_080D0B88: @ 0x080D0B88
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _080D0BA8
	ldr r3, _080D0BAC
	movs r4, #1
_080D0B92:
	ldr r0, [r5]
	lsls r1, r2, #4
	adds r0, r0, r1
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	bne _080D0BB0
	strb r4, [r1]
	adds r0, r2, #0
	b _080D0BBC
	.align 2, 0
_080D0BA8: .4byte 0x020399A8
_080D0BAC: .4byte 0x00002210
_080D0BB0:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _080D0B92
	movs r0, #3
_080D0BBC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D0B88

	thumb_func_start sub_080D0BC4
sub_080D0BC4: @ 0x080D0BC4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0
	ldr r0, _080D0BF8
	ldr r2, [r0]
_080D0BD4:
	ldr r5, _080D0BFC
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D0C00
	subs r5, #2
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r4
	bne _080D0C00
	adds r5, #1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r1
	bne _080D0C00
	movs r0, #1
	b _080D0C0A
	.align 2, 0
_080D0BF8: .4byte 0x020399A8
_080D0BFC: .4byte 0x00002210
_080D0C00:
	adds r2, #0x10
	adds r3, #1
	cmp r3, #2
	ble _080D0BD4
	movs r0, #0
_080D0C0A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080D0BC4

	thumb_func_start sub_080D0C10
sub_080D0C10: @ 0x080D0C10
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	ldr r0, _080D0C48
	ldr r1, [r0]
_080D0C20:
	lsls r0, r3, #4
	adds r2, r1, r0
	ldr r6, _080D0C4C
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D0C50
	subs r6, #2
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _080D0C50
	adds r6, #1
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r4
	bne _080D0C50
	adds r0, r3, #0
	b _080D0C5C
	.align 2, 0
_080D0C48: .4byte 0x020399A8
_080D0C4C: .4byte 0x00002210
_080D0C50:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _080D0C20
	movs r0, #3
_080D0C5C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D0C10

	thumb_func_start sub_080D0C64
sub_080D0C64: @ 0x080D0C64
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r2, #0
	ldr r0, _080D0C8C
	ldr r3, [r0]
	ldr r0, _080D0C90
	adds r4, r3, r0
	ldr r6, _080D0C94
_080D0C74:
	lsls r1, r2, #4
	adds r0, r3, r1
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D0C98
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, r5
	bne _080D0C98
	adds r0, r2, #0
	b _080D0CA4
	.align 2, 0
_080D0C8C: .4byte 0x020399A8
_080D0C90: .4byte 0x00002204
_080D0C94: .4byte 0x00002210
_080D0C98:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _080D0C74
	movs r0, #3
_080D0CA4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D0C64

	thumb_func_start sub_080D0CAC
sub_080D0CAC: @ 0x080D0CAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	cmp r5, #2
	bhi _080D0DAA
	cmp r1, #0
	beq _080D0CD8
	cmp r1, #1
	beq _080D0D34
	ldr r4, _080D0CD4
	lsls r3, r5, #4
	b _080D0D94
	.align 2, 0
_080D0CD4: .4byte 0x020399A8
_080D0CD8:
	adds r0, r7, #0
	movs r1, #6
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	movs r1, #6
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _080D0D2C
	ldr r2, [r6]
	lsls r5, r5, #4
	ldr r1, _080D0D30
	adds r2, r2, r1
	adds r2, r2, r5
	ldr r3, [r2]
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, #0x70
	strh r1, [r3, #0x20]
	ldr r3, [r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, #0x38
	strh r1, [r3, #0x22]
	ldr r2, [r2]
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #5]
	adds r4, r6, #0
	adds r3, r5, #0
	b _080D0D94
	.align 2, 0
_080D0D2C: .4byte 0x020399A8
_080D0D30: .4byte 0x00002204
_080D0D34:
	cmp r7, #0
	bne _080D0D5C
	ldr r4, _080D0D54
	ldr r0, [r4]
	lsls r3, r5, #4
	ldr r1, _080D0D58
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r2, [r0]
	movs r1, #0x74
	strh r1, [r2, #0x20]
	ldr r1, [r0]
	movs r0, #0x4c
	strh r0, [r1, #0x22]
	b _080D0D7C
	.align 2, 0
_080D0D54: .4byte 0x020399A8
_080D0D58: .4byte 0x00002204
_080D0D5C:
	ldr r4, _080D0DB4
	ldr r0, [r4]
	lsls r3, r5, #4
	ldr r1, _080D0DB8
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r2, [r0]
	movs r1, #0xa4
	strh r1, [r2, #0x20]
	ldr r2, [r0]
	subs r1, r7, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x1c
	strh r0, [r2, #0x22]
_080D0D7C:
	ldr r0, [r4]
	ldr r1, _080D0DB8
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r2, [r0]
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #5]
_080D0D94:
	ldr r0, [r4]
	adds r0, r0, r3
	ldr r1, _080D0DBC
	adds r0, r0, r1
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r0, r3
	ldr r1, _080D0DC0
	adds r0, r0, r1
	strb r7, [r0]
_080D0DAA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0DB4: .4byte 0x020399A8
_080D0DB8: .4byte 0x00002204
_080D0DBC: .4byte 0x0000220E
_080D0DC0: .4byte 0x0000220F
	thumb_func_end sub_080D0CAC

	thumb_func_start sub_080D0DC4
sub_080D0DC4: @ 0x080D0DC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r1
	mov sb, r2
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bhi _080D0E4C
	movs r0, #0
	str r0, [sp]
	ldr r4, _080D0E5C
	ldr r1, [r4]
	ldr r6, _080D0E60
	adds r1, r1, r6
	ldr r2, _080D0E64
	mov r0, sp
	bl CpuFastSet
	ldr r1, [r4]
	ldr r5, _080D0E68
	adds r1, r1, r5
	mov r0, r8
	bl LZ77UnCompWram
	lsls r7, r7, #4
	mov r8, r7
	adds r7, r4, #0
	movs r4, #2
_080D0E02:
	ldr r1, [r7]
	adds r0, r1, r5
	adds r1, r1, r6
	movs r2, #0x18
	bl CpuFastSet
	adds r6, #0x80
	adds r5, #0x60
	subs r4, #1
	cmp r4, #0
	bge _080D0E02
	ldr r5, _080D0E5C
	ldr r1, [r5]
	ldr r4, _080D0E60
	adds r0, r1, r4
	ldr r2, _080D0E6C
	adds r1, r1, r2
	add r1, r8
	ldr r1, [r1]
	movs r2, #0x80
	bl CpuFastSet
	ldr r1, [r5]
	adds r1, r1, r4
	mov r0, sb
	bl LZ77UnCompWram
	ldr r0, [r5]
	adds r4, r0, r4
	add r0, r8
	ldr r1, _080D0E70
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
_080D0E4C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0E5C: .4byte 0x020399A8
_080D0E60: .4byte 0x000042C4
_080D0E64: .4byte 0x01000080
_080D0E68: .4byte 0x000022C4
_080D0E6C: .4byte 0x00002208
_080D0E70: .4byte 0x0000220C
	thumb_func_end sub_080D0DC4

	thumb_func_start sub_080D0E74
sub_080D0E74: @ 0x080D0E74
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r2, #2
	bhi _080D0E96
	ldr r0, _080D0E9C
	ldr r0, [r0]
	lsls r1, r2, #4
	ldr r2, _080D0EA0
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	bl StartSpriteAffineAnim
_080D0E96:
	pop {r0}
	bx r0
	.align 2, 0
_080D0E9C: .4byte 0x020399A8
_080D0EA0: .4byte 0x00002204
	thumb_func_end sub_080D0E74

	thumb_func_start sub_080D0EA4
sub_080D0EA4: @ 0x080D0EA4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r4, #2
	bls _080D0EBC
	b _080D0FCE
_080D0EBC:
	cmp r0, #7
	bls _080D0EC2
	b _080D0FCE
_080D0EC2:
	lsls r0, r0, #2
	ldr r1, _080D0ECC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D0ECC: .4byte 0x080D0ED0
_080D0ED0: @ jump table
	.4byte _080D0EF0 @ case 0
	.4byte _080D0F14 @ case 1
	.4byte _080D0F38 @ case 2
	.4byte _080D0F64 @ case 3
	.4byte _080D0F90 @ case 4
	.4byte _080D0FCE @ case 5
	.4byte _080D0FCE @ case 6
	.4byte _080D0FBC @ case 7
_080D0EF0:
	ldr r0, _080D0F08
	ldr r0, [r0]
	lsls r1, r4, #4
	ldr r2, _080D0F0C
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r1, [r0]
	strh r4, [r1, #0x2e]
	ldr r1, [r0]
	ldr r0, _080D0F10
	b _080D0FCC
	.align 2, 0
_080D0F08: .4byte 0x020399A8
_080D0F0C: .4byte 0x00002204
_080D0F10: .4byte 0x080D12E9
_080D0F14:
	ldr r0, _080D0F2C
	ldr r0, [r0]
	lsls r1, r4, #4
	ldr r2, _080D0F30
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0
	strh r1, [r2, #0x2e]
	ldr r1, [r0]
	ldr r0, _080D0F34
	b _080D0FCC
	.align 2, 0
_080D0F2C: .4byte 0x020399A8
_080D0F30: .4byte 0x00002204
_080D0F34: .4byte 0x080D1315
_080D0F38:
	ldr r0, _080D0F58
	ldr r0, [r0]
	lsls r1, r4, #4
	ldr r2, _080D0F5C
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0
	strh r1, [r2, #0x2e]
	ldr r1, [r0]
	strh r5, [r1, #0x3a]
	ldr r1, [r0]
	strh r3, [r1, #0x3c]
	ldr r1, [r0]
	ldr r0, _080D0F60
	b _080D0FCC
	.align 2, 0
_080D0F58: .4byte 0x020399A8
_080D0F5C: .4byte 0x00002204
_080D0F60: .4byte 0x080D13B5
_080D0F64:
	ldr r0, _080D0F84
	ldr r0, [r0]
	lsls r1, r4, #4
	ldr r2, _080D0F88
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0
	strh r1, [r2, #0x2e]
	ldr r2, [r0]
	ldr r1, _080D0F8C
	str r1, [r2, #0x1c]
	strh r5, [r2, #0x3a]
	ldr r0, [r0]
	strh r3, [r0, #0x3c]
	b _080D0FCE
	.align 2, 0
_080D0F84: .4byte 0x020399A8
_080D0F88: .4byte 0x00002204
_080D0F8C: .4byte 0x080D1435
_080D0F90:
	ldr r0, _080D0FB0
	ldr r0, [r0]
	lsls r1, r4, #4
	ldr r2, _080D0FB4
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0
	strh r1, [r2, #0x2e]
	ldr r1, [r0]
	strh r5, [r1, #0x3a]
	ldr r1, [r0]
	strh r3, [r1, #0x3c]
	ldr r1, [r0]
	ldr r0, _080D0FB8
	b _080D0FCC
	.align 2, 0
_080D0FB0: .4byte 0x020399A8
_080D0FB4: .4byte 0x00002204
_080D0FB8: .4byte 0x080D14D1
_080D0FBC:
	ldr r0, _080D0FD4
	ldr r0, [r0]
	lsls r1, r4, #4
	ldr r2, _080D0FD8
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080D0FDC
_080D0FCC:
	str r0, [r1, #0x1c]
_080D0FCE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0FD4: .4byte 0x020399A8
_080D0FD8: .4byte 0x00002204
_080D0FDC: .4byte 0x080D156D
	thumb_func_end sub_080D0EA4

	thumb_func_start sub_080D0FE0
sub_080D0FE0: @ 0x080D0FE0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r2, #2
	bhi _080D1020
	ldr r1, _080D1028
	ldr r0, [r1]
	lsls r2, r2, #4
	adds r0, r0, r2
	ldr r3, _080D102C
	adds r0, r0, r3
	strb r4, [r0]
	ldr r0, [r1]
	ldr r1, _080D1030
	adds r0, r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	movs r3, #0
	cmp r4, #0
	bne _080D100E
	movs r3, #1
_080D100E:
	adds r2, r0, #0
	adds r2, #0x3e
	lsls r3, r3, #2
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_080D1020:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1028: .4byte 0x020399A8
_080D102C: .4byte 0x00002210
_080D1030: .4byte 0x00002204
	thumb_func_end sub_080D0FE0

	thumb_func_start GetItemIconPic
GetItemIconPic: @ 0x080D1034
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl GetItemIconPicOrPalette
	pop {r1}
	bx r1
	thumb_func_end GetItemIconPic

	thumb_func_start GetItemIconPalette
GetItemIconPalette: @ 0x080D1044
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl GetItemIconPicOrPalette
	pop {r1}
	bx r1
	thumb_func_end GetItemIconPalette

	thumb_func_start Cb_HandleMovingMonFromParty
Cb_HandleMovingMonFromParty: @ 0x080D1054
	push {r4, lr}
	sub sp, #0x14
	bl IsActiveItemMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D1074
	ldr r0, _080D106C
	ldr r0, [r0]
	ldr r1, _080D1070
	b _080D107A
	.align 2, 0
_080D106C: .4byte 0x020399A8
_080D1070: .4byte 0x00002234
_080D1074:
	ldr r0, _080D10B0
	ldr r0, [r0]
	ldr r1, _080D10B4
_080D107A:
	adds r0, r0, r1
	ldrh r0, [r0]
	bl ItemId_GetHoldEffect
	adds r4, r0, #0
	movs r0, #2
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #2
	movs r1, #1
	adds r2, r4, #0
	movs r3, #4
	bl AddTextPrinterParameterized5
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D10B0: .4byte 0x020399A8
_080D10B4: .4byte 0x00000CE6
	thumb_func_end Cb_HandleMovingMonFromParty

	thumb_func_start sub_080D10B8
sub_080D10B8: @ 0x080D10B8
	push {lr}
	ldr r0, _080D10E0
	ldr r0, [r0]
	ldr r1, _080D10E4
	adds r0, r0, r1
	movs r1, #0x15
	strh r1, [r0]
	ldr r1, _080D10E8
	movs r3, #0x9d
	lsls r3, r3, #1
	movs r0, #0
	movs r2, #0x80
	bl LoadBgTiles
	movs r0, #0
	bl sub_080D1254
	pop {r0}
	bx r0
	.align 2, 0
_080D10E0: .4byte 0x020399A8
_080D10E4: .4byte 0x00002236
_080D10E8: .4byte 0x08556620
	thumb_func_end sub_080D10B8

	thumb_func_start sub_080D10EC
sub_080D10EC: @ 0x080D10EC
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r0, _080D1104
	ldr r0, [r0]
	ldr r2, _080D1108
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	bne _080D110C
	movs r0, #0
	b _080D1172
	.align 2, 0
_080D1104: .4byte 0x020399A8
_080D1108: .4byte 0x00002236
_080D110C:
	subs r0, #1
	strh r0, [r1]
	ldrh r1, [r1]
	movs r0, #0x15
	subs r5, r0, r1
	movs r4, #0
	cmp r4, r5
	bge _080D115C
_080D111C:
	movs r0, #0
	movs r1, #0xa
	bl GetBgAttribute
	adds r1, r0, #0
	ldr r0, _080D117C
	ldr r0, [r0]
	ldr r2, _080D1180
	adds r0, r0, r2
	adds r1, #0x14
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0x15
	str r0, [sp, #0xc]
	movs r0, #0
	movs r3, #0xd
	bl WriteSequenceToBgTilemapBuffer
	adds r4, #1
	cmp r4, r5
	blt _080D111C
_080D115C:
	adds r0, r5, #0
	bl sub_080D1254
	ldr r0, _080D117C
	ldr r0, [r0]
	ldr r1, _080D1180
	adds r0, r0, r1
	ldrh r1, [r0]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
_080D1172:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D117C: .4byte 0x020399A8
_080D1180: .4byte 0x00002236
	thumb_func_end sub_080D10EC

	thumb_func_start sub_080D1184
sub_080D1184: @ 0x080D1184
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r5, _080D119C
	ldr r0, [r5]
	ldr r4, _080D11A0
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x16
	bne _080D11A4
	movs r0, #0
	b _080D1244
	.align 2, 0
_080D119C: .4byte 0x020399A8
_080D11A0: .4byte 0x00002236
_080D11A4:
	cmp r0, #0
	bne _080D11C0
	movs r0, #1
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x15
	movs r3, #0xc
	bl FillBgTilemapBufferRect
_080D11C0:
	ldr r1, [r5]
	adds r1, r1, r4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r1, [r1]
	movs r0, #0x15
	subs r5, r0, r1
	movs r4, #0
	cmp r4, r5
	bge _080D1216
_080D11D6:
	movs r0, #0
	movs r1, #0xa
	bl GetBgAttribute
	adds r1, r0, #0
	ldr r0, _080D124C
	ldr r0, [r0]
	ldr r2, _080D1250
	adds r0, r0, r2
	adds r1, #0x14
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0x15
	str r0, [sp, #0xc]
	movs r0, #0
	movs r3, #0xd
	bl WriteSequenceToBgTilemapBuffer
	adds r4, #1
	cmp r4, r5
	blt _080D11D6
_080D1216:
	cmp r5, #0
	blt _080D1220
	adds r0, r5, #0
	bl sub_080D1254
_080D1220:
	adds r2, r5, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r3, #0xc
	bl FillBgTilemapBufferRect
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
_080D1244:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D124C: .4byte 0x020399A8
_080D1250: .4byte 0x00002236
	thumb_func_end sub_080D1184

	thumb_func_start sub_080D1254
sub_080D1254: @ 0x080D1254
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	cmp r7, #0
	beq _080D128C
	movs r1, #0x9d
	lsls r1, r1, #1
	lsls r4, r7, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r6, #1
	str r6, [sp, #4]
	movs r5, #0xf
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #0
	movs r3, #0xc
	bl FillBgTilemapBufferRect
	ldr r1, _080D12DC
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #0
	movs r3, #0x14
	bl FillBgTilemapBufferRect
_080D128C:
	ldr r1, _080D12E0
	lsls r5, r7, #0x18
	lsrs r5, r5, #0x18
	movs r4, #1
	str r4, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r6, #0xf
	str r6, [sp, #8]
	movs r0, #0
	adds r2, r5, #0
	movs r3, #0xd
	bl FillBgTilemapBufferRect
	movs r1, #0x9e
	lsls r1, r1, #1
	str r4, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	adds r2, r5, #0
	movs r3, #0xc
	bl FillBgTilemapBufferRect
	ldr r1, _080D12E4
	str r4, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	adds r2, r5, #0
	movs r3, #0x14
	bl FillBgTilemapBufferRect
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D12DC: .4byte 0x0000093A
_080D12E0: .4byte 0x0000013B
_080D12E4: .4byte 0x0000013D
	thumb_func_end sub_080D1254

	thumb_func_start sub_080D12E8
sub_080D12E8: @ 0x080D12E8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080D1308
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_080D0FE0
	ldr r0, _080D1310
	str r0, [r4, #0x1c]
_080D1308:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1310: .4byte 0x08007141
	thumb_func_end sub_080D12E8

	thumb_func_start sub_080D1314
sub_080D1314: @ 0x080D1314
	push {lr}
	adds r3, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	cmp r1, #0
	beq _080D1326
	cmp r1, #1
	beq _080D1342
	b _080D1370
_080D1326:
	ldrh r0, [r3, #0x20]
	lsls r0, r0, #4
	strh r0, [r3, #0x30]
	ldrh r0, [r3, #0x22]
	lsls r0, r0, #4
	strh r0, [r3, #0x32]
	movs r0, #0xa
	strh r0, [r3, #0x34]
	movs r0, #0x15
	strh r0, [r3, #0x36]
	strh r1, [r3, #0x38]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
_080D1342:
	ldrh r1, [r3, #0x30]
	ldrh r0, [r3, #0x34]
	subs r1, r1, r0
	strh r1, [r3, #0x30]
	ldrh r0, [r3, #0x32]
	ldrh r2, [r3, #0x36]
	subs r0, r0, r2
	strh r0, [r3, #0x32]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r3, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r3, #0x22]
	ldrh r0, [r3, #0x38]
	adds r0, #1
	strh r0, [r3, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _080D1370
	ldr r0, _080D1374
	str r0, [r3, #0x1c]
_080D1370:
	pop {r0}
	bx r0
	.align 2, 0
_080D1374: .4byte 0x080D1379
	thumb_func_end sub_080D1314

	thumb_func_start sub_080D1378
sub_080D1378: @ 0x080D1378
	ldr r1, _080D13AC
	ldr r3, [r1]
	ldr r1, _080D13B0
	adds r3, r3, r1
	ldr r1, [r3]
	ldrh r1, [r1, #0x20]
	adds r1, #4
	strh r1, [r0, #0x20]
	ldr r2, [r3]
	ldrh r1, [r2, #0x26]
	ldrh r2, [r2, #0x22]
	adds r1, r1, r2
	adds r1, #8
	strh r1, [r0, #0x22]
	ldr r1, [r3]
	ldrb r1, [r1, #5]
	movs r2, #0xc
	ands r2, r1
	ldrb r3, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #5]
	bx lr
	.align 2, 0
_080D13AC: .4byte 0x020399A8
_080D13B0: .4byte 0x00000CB4
	thumb_func_end sub_080D1378

	thumb_func_start sub_080D13B4
sub_080D13B4: @ 0x080D13B4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _080D13C6
	cmp r1, #1
	beq _080D13E2
	b _080D142A
_080D13C6:
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #4
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	movs r0, #0xa
	strh r0, [r4, #0x34]
	movs r0, #0x15
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_080D13E2:
	ldrh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	adds r0, r0, r1
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x36]
	ldrh r2, [r4, #0x32]
	adds r1, r1, r2
	strh r1, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r4, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r4, #0x22]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _080D142A
	adds r0, r4, #0
	bl sub_080D0C64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x3a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl sub_080D0CAC
	ldr r0, _080D1430
	str r0, [r4, #0x1c]
_080D142A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1430: .4byte 0x08007141
	thumb_func_end sub_080D13B4

	thumb_func_start sub_080D1434
sub_080D1434: @ 0x080D1434
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _080D1446
	cmp r1, #1
	beq _080D1462
	b _080D14C0
_080D1446:
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #4
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	movs r0, #0xa
	strh r0, [r4, #0x34]
	movs r0, #0x15
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_080D1462:
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x34]
	subs r1, r1, r0
	strh r1, [r4, #0x30]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x36]
	subs r0, r0, r2
	strh r0, [r4, #0x32]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r4, #0x22]
	ldr r1, _080D14C8
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _080D14C0
	adds r0, r4, #0
	bl sub_080D0C64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x3a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl sub_080D0CAC
	movs r0, #0
	strh r0, [r4, #0x24]
	ldr r0, _080D14CC
	str r0, [r4, #0x1c]
_080D14C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D14C8: .4byte 0x082FA8CC
_080D14CC: .4byte 0x080D1379
	thumb_func_end sub_080D1434

	thumb_func_start sub_080D14D0
sub_080D14D0: @ 0x080D14D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _080D14E2
	cmp r1, #1
	beq _080D14FE
	b _080D155E
_080D14E2:
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #4
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	movs r0, #0xa
	strh r0, [r4, #0x34]
	movs r0, #0x15
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_080D14FE:
	ldrh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	adds r0, r0, r1
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x36]
	ldrh r2, [r4, #0x32]
	adds r1, r1, r2
	strh r1, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r4, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r4, #0x22]
	ldr r1, _080D1564
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _080D155E
	adds r0, r4, #0
	bl sub_080D0C64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x3a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl sub_080D0CAC
	ldr r0, _080D1568
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x24]
_080D155E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1564: .4byte 0x082FA8CC
_080D1568: .4byte 0x08007141
	thumb_func_end sub_080D14D0

	thumb_func_start sub_080D156C
sub_080D156C: @ 0x080D156C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x22]
	subs r0, #8
	strh r0, [r2, #0x22]
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	movs r3, #0x26
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080D159C
	ldr r0, _080D15A0
	str r0, [r2, #0x1c]
	adds r0, r2, #0
	bl sub_080D0C64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_080D0FE0
_080D159C:
	pop {r0}
	bx r0
	.align 2, 0
_080D15A0: .4byte 0x08007141
	thumb_func_end sub_080D156C

	thumb_func_start nullsub_98
nullsub_98: @ 0x080D15A4
	bx lr
	.align 2, 0
	thumb_func_end nullsub_98

	thumb_func_start nullsub_pss
nullsub_pss: @ 0x080D15A8
	bx lr
	.align 2, 0
	thumb_func_end nullsub_pss

	thumb_func_start StorageGetCurrentBox
StorageGetCurrentBox: @ 0x080D15AC
	ldr r0, _080D15B4
	ldr r0, [r0]
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080D15B4: .4byte 0x03005AF4
	thumb_func_end StorageGetCurrentBox

	thumb_func_start SetCurrentBox
SetCurrentBox: @ 0x080D15B8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xd
	bhi _080D15C8
	ldr r0, _080D15CC
	ldr r0, [r0]
	strb r1, [r0]
_080D15C8:
	pop {r0}
	bx r0
	.align 2, 0
_080D15CC: .4byte 0x03005AF4
	thumb_func_end SetCurrentBox

	thumb_func_start GetBoxMonDataAt
GetBoxMonDataAt: @ 0x080D15D0
	push {r4, r5, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r3, #0xd
	bhi _080D160C
	cmp r4, #0x1d
	bhi _080D160C
	ldr r2, _080D1608
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r1, r5, #0
	bl GetBoxMonData
	b _080D160E
	.align 2, 0
_080D1608: .4byte 0x03005AF4
_080D160C:
	movs r0, #0
_080D160E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetBoxMonDataAt

	thumb_func_start SetBoxMonDataAt
SetBoxMonDataAt: @ 0x080D1614
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r3, #0xd
	bhi _080D164C
	cmp r4, #0x1d
	bhi _080D164C
	ldr r2, _080D1654
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r1, r5, #0
	adds r2, r6, #0
	bl SetBoxMonData
_080D164C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1654: .4byte 0x03005AF4
	thumb_func_end SetBoxMonDataAt

	thumb_func_start GetCurrentBoxMonData
GetCurrentBoxMonData: @ 0x080D1658
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _080D1674
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r1, r3, #0
	bl GetBoxMonDataAt
	pop {r1}
	bx r1
	.align 2, 0
_080D1674: .4byte 0x03005AF4
	thumb_func_end GetCurrentBoxMonData

	thumb_func_start SetCurrentBoxMonData
SetCurrentBoxMonData: @ 0x080D1678
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080D1698
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetBoxMonDataAt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1698: .4byte 0x03005AF4
	thumb_func_end SetCurrentBoxMonData

	thumb_func_start GetBoxMonNickAt
GetBoxMonNickAt: @ 0x080D169C
	push {r4, r5, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r3, #0xd
	bhi _080D16D8
	cmp r4, #0x1d
	bhi _080D16D8
	ldr r2, _080D16D4
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #2
	adds r2, r5, #0
	bl GetBoxMonData
	b _080D16DC
	.align 2, 0
_080D16D4: .4byte 0x03005AF4
_080D16D8:
	movs r0, #0xff
	strb r0, [r5]
_080D16DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetBoxMonNickAt

	thumb_func_start GetBoxMonLevelAt
GetBoxMonLevelAt: @ 0x080D16E4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r0, #0xd
	bhi _080D1724
	cmp r2, #0x1d
	bhi _080D1724
	ldr r6, _080D172C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r5, r0, #4
	ldr r0, [r6]
	adds r0, r0, r5
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r4, r1, #4
	adds r0, r0, r4
	movs r1, #5
	bl GetBoxMonData
	cmp r0, #0
	beq _080D1724
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, r0, r4
	bl GetLevelFromBoxMonExp
_080D1724:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D172C: .4byte 0x03005AF4
	thumb_func_end GetBoxMonLevelAt

	thumb_func_start SetBoxMonNickAt
SetBoxMonNickAt: @ 0x080D1730
	push {r4, r5, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r3, #0xd
	bhi _080D1766
	cmp r4, #0x1d
	bhi _080D1766
	ldr r2, _080D176C
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #2
	adds r2, r5, #0
	bl SetBoxMonData
_080D1766:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D176C: .4byte 0x03005AF4
	thumb_func_end SetBoxMonNickAt

	thumb_func_start GetAndCopyBoxMonDataAt
GetAndCopyBoxMonDataAt: @ 0x080D1770
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r3, #0xd
	bhi _080D17B0
	cmp r4, #0x1d
	bhi _080D17B0
	ldr r2, _080D17AC
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r1, r5, #0
	adds r2, r6, #0
	bl GetBoxMonData
	b _080D17B2
	.align 2, 0
_080D17AC: .4byte 0x03005AF4
_080D17B0:
	movs r0, #0
_080D17B2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetAndCopyBoxMonDataAt

	thumb_func_start SetBoxMonAt
SetBoxMonAt: @ 0x080D17B8
	push {r4, r5, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r4, #0xd
	bhi _080D17EE
	cmp r1, #0x1d
	bhi _080D17EE
	ldr r0, _080D17F4
	ldr r0, [r0]
	lsls r3, r1, #2
	adds r3, r3, r1
	lsls r3, r3, #4
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #5
	adds r3, r3, r1
	adds r0, r0, r3
	adds r0, #4
	adds r1, r5, #0
	movs r2, #0x50
	bl memcpy
_080D17EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D17F4: .4byte 0x03005AF4
	thumb_func_end SetBoxMonAt

	thumb_func_start CopyBoxMonAt
CopyBoxMonAt: @ 0x080D17F8
	push {r4, r5, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r4, #0xd
	bhi _080D182E
	cmp r2, #0x1d
	bhi _080D182E
	ldr r0, _080D1834
	ldr r1, [r0]
	lsls r3, r2, #2
	adds r3, r3, r2
	lsls r3, r3, #4
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #5
	adds r3, r3, r0
	adds r1, r1, r3
	adds r1, #4
	adds r0, r5, #0
	movs r2, #0x50
	bl memcpy
_080D182E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1834: .4byte 0x03005AF4
	thumb_func_end CopyBoxMonAt

	thumb_func_start CreateBoxMonAt
CreateBoxMonAt: @ 0x080D1838
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	ldr r4, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, [sp, #0x3c]
	mov ip, r6
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, ip
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r7, #0xd
	bhi _080D18A4
	cmp r6, #0x1d
	bhi _080D18A4
	ldr r2, _080D18B4
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #4
	adds r0, r0, r1
	str r5, [sp]
	ldr r1, [sp, #0x38]
	str r1, [sp, #4]
	str r3, [sp, #8]
	ldr r1, [sp, #0x40]
	str r1, [sp, #0xc]
	mov r1, sb
	mov r2, r8
	adds r3, r4, #0
	bl CreateBoxMon
_080D18A4:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D18B4: .4byte 0x03005AF4
	thumb_func_end CreateBoxMonAt

	thumb_func_start ZeroBoxMonAt
ZeroBoxMonAt: @ 0x080D18B8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r3, #0xd
	bhi _080D18E8
	cmp r4, #0x1d
	bhi _080D18E8
	ldr r2, _080D18F0
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r0, r1
	bl ZeroBoxMonData
_080D18E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D18F0: .4byte 0x03005AF4
	thumb_func_end ZeroBoxMonAt

	thumb_func_start BoxMonAtToMon
BoxMonAtToMon: @ 0x080D18F4
	push {r4, r5, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r3, #0xd
	bhi _080D1928
	cmp r4, #0x1d
	bhi _080D1928
	ldr r2, _080D1930
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r1, r5, #0
	bl BoxMonToMon
_080D1928:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1930: .4byte 0x03005AF4
	thumb_func_end BoxMonAtToMon

	thumb_func_start GetBoxedMonPtr
GetBoxedMonPtr: @ 0x080D1934
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r3, #0xd
	bhi _080D1968
	cmp r4, #0x1d
	bhi _080D1968
	ldr r2, _080D1964
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r0, r1
	b _080D196A
	.align 2, 0
_080D1964: .4byte 0x03005AF4
_080D1968:
	movs r0, #0
_080D196A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBoxedMonPtr

	thumb_func_start GetBoxNamePtr
GetBoxNamePtr: @ 0x080D1970
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xd
	bls _080D197E
	movs r0, #0
	b _080D198C
_080D197E:
	ldr r0, _080D1990
	lsls r1, r2, #3
	adds r1, r1, r2
	ldr r2, _080D1994
	adds r1, r1, r2
	ldr r0, [r0]
	adds r0, r0, r1
_080D198C:
	pop {r1}
	bx r1
	.align 2, 0
_080D1990: .4byte 0x03005AF4
_080D1994: .4byte 0x00008344
	thumb_func_end GetBoxNamePtr

	thumb_func_start GetBoxWallpaper
GetBoxWallpaper: @ 0x080D1998
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xd
	bls _080D19A6
	movs r0, #0
	b _080D19B2
_080D19A6:
	ldr r0, _080D19B8
	ldr r0, [r0]
	ldr r2, _080D19BC
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
_080D19B2:
	pop {r1}
	bx r1
	.align 2, 0
_080D19B8: .4byte 0x03005AF4
_080D19BC: .4byte 0x000083C2
	thumb_func_end GetBoxWallpaper

	thumb_func_start SetBoxWallpaper
SetBoxWallpaper: @ 0x080D19C0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r2, #0xd
	bhi _080D19DE
	cmp r1, #0x10
	bhi _080D19DE
	ldr r0, _080D19E4
	ldr r0, [r0]
	ldr r3, _080D19E8
	adds r0, r0, r3
	adds r0, r0, r2
	strb r1, [r0]
_080D19DE:
	pop {r0}
	bx r0
	.align 2, 0
_080D19E4: .4byte 0x03005AF4
_080D19E8: .4byte 0x000083C2
	thumb_func_end SetBoxWallpaper

	thumb_func_start sub_080D19EC
sub_080D19EC: @ 0x080D19EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r4, r3, #0
	ldr r2, _080D1A50
	cmp r3, #1
	bhi _080D1A0E
	movs r2, #1
	cmp r3, #1
	beq _080D1A12
_080D1A0E:
	cmp r4, #3
	bne _080D1A5C
_080D1A12:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	adds r1, r1, r0
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r6, r2, #0
	cmp r1, #0
	blt _080D1AA8
	cmp r1, r7
	bgt _080D1AA8
_080D1A2A:
	asrs r4, r0, #0x10
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #4
	add r0, r8
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	bne _080D1A54
	asrs r0, r6, #0x10
	adds r0, r4, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080D1AA8
	cmp r2, r7
	ble _080D1A2A
	b _080D1AA8
	.align 2, 0
_080D1A50: .4byte 0x0000FFFF
_080D1A54:
	adds r0, r4, #0
	b _080D1AAC
_080D1A58:
	adds r0, r5, #0
	b _080D1AAC
_080D1A5C:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	adds r1, r1, r0
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r6, r2, #0
	cmp r1, #0
	blt _080D1AA8
	cmp r1, r7
	bgt _080D1AA8
_080D1A74:
	asrs r5, r0, #0x10
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #4
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	beq _080D1A98
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetBoxMonData
	cmp r0, #0
	beq _080D1A58
_080D1A98:
	asrs r0, r6, #0x10
	adds r0, r5, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080D1AA8
	cmp r2, r7
	ble _080D1A74
_080D1AA8:
	movs r0, #1
	rsbs r0, r0, #0
_080D1AAC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D19EC

	thumb_func_start CheckFreePokemonStorageSpace
CheckFreePokemonStorageSpace: @ 0x080D1AB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r2, #0
	ldr r0, _080D1AE8
	mov r8, r0
	movs r7, #4
_080D1AC8:
	movs r5, #0
	adds r6, r7, #0
	movs r4, #0
_080D1ACE:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	adds r0, r0, r4
	movs r1, #5
	str r2, [sp]
	bl GetBoxMonData
	ldr r2, [sp]
	cmp r0, #0
	bne _080D1AEC
	movs r0, #1
	b _080D1B02
	.align 2, 0
_080D1AE8: .4byte 0x03005AF4
_080D1AEC:
	adds r4, #0x50
	adds r5, #1
	cmp r5, #0x1d
	ble _080D1ACE
	movs r0, #0x96
	lsls r0, r0, #4
	adds r7, r7, r0
	adds r2, #1
	cmp r2, #0xd
	ble _080D1AC8
	movs r0, #0
_080D1B02:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckFreePokemonStorageSpace

	thumb_func_start CheckBoxMonSanityAt
CheckBoxMonSanityAt: @ 0x080D1B10
	push {r4, r5, r6, lr}
	adds r2, r1, #0
	cmp r0, #0xd
	bhi _080D1B68
	cmp r2, #0x1d
	bhi _080D1B68
	ldr r6, _080D1B64
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r5, r0, #4
	ldr r0, [r6]
	adds r0, r0, r5
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r4, r1, #4
	adds r0, r0, r4
	movs r1, #5
	bl GetBoxMonData
	cmp r0, #0
	beq _080D1B68
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, r0, r4
	movs r1, #6
	bl GetBoxMonData
	cmp r0, #0
	bne _080D1B68
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, r0, r4
	movs r1, #4
	bl GetBoxMonData
	cmp r0, #0
	bne _080D1B68
	movs r0, #1
	b _080D1B6A
	.align 2, 0
_080D1B64: .4byte 0x03005AF4
_080D1B68:
	movs r0, #0
_080D1B6A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end CheckBoxMonSanityAt

	thumb_func_start CountStorageNonEggMons
CountStorageNonEggMons: @ 0x080D1B70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	movs r0, #0
	ldr r1, _080D1BD8
	mov sb, r1
_080D1B80:
	lsls r1, r0, #2
	adds r2, r0, #1
	mov r8, r2
	adds r1, r1, r0
	movs r5, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r4, r0, #4
	movs r6, #0x1d
_080D1B94:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	adds r0, r0, r5
	movs r1, #5
	bl GetBoxMonData
	cmp r0, #0
	beq _080D1BBA
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r4
	adds r0, r0, r5
	movs r1, #6
	bl GetBoxMonData
	cmp r0, #0
	bne _080D1BBA
	adds r7, #1
_080D1BBA:
	adds r5, #0x50
	subs r6, #1
	cmp r6, #0
	bge _080D1B94
	mov r0, r8
	cmp r0, #0xd
	ble _080D1B80
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D1BD8: .4byte 0x03005AF4
	thumb_func_end CountStorageNonEggMons

	thumb_func_start CountAllStorageMons
CountAllStorageMons: @ 0x080D1BDC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	movs r0, #0
	ldr r1, _080D1C44
	mov sb, r1
_080D1BEC:
	lsls r1, r0, #2
	adds r2, r0, #1
	mov r8, r2
	adds r1, r1, r0
	movs r5, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r4, r0, #4
	movs r6, #0x1d
_080D1C00:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	adds r0, r0, r5
	movs r1, #5
	bl GetBoxMonData
	cmp r0, #0
	bne _080D1C24
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r4
	adds r0, r0, r5
	movs r1, #6
	bl GetBoxMonData
	cmp r0, #0
	beq _080D1C26
_080D1C24:
	adds r7, #1
_080D1C26:
	adds r5, #0x50
	subs r6, #1
	cmp r6, #0
	bge _080D1C00
	mov r0, r8
	cmp r0, #0xd
	ble _080D1BEC
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D1C44: .4byte 0x03005AF4
	thumb_func_end CountAllStorageMons

	thumb_func_start AnyStorageMonWithMove
AnyStorageMonWithMove: @ 0x080D1C48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r1, sp
	strh r0, [r1]
	ldr r0, _080D1C9C
	strh r0, [r1, #2]
	movs r0, #0
	mov r8, r0
	ldr r7, _080D1CA0
	movs r5, #4
_080D1C60:
	movs r6, #0
	movs r4, #0
_080D1C64:
	ldr r0, [r7]
	adds r0, r0, r5
	adds r0, r0, r4
	movs r1, #5
	bl GetBoxMonData
	cmp r0, #0
	beq _080D1CA4
	ldr r0, [r7]
	adds r0, r0, r5
	adds r0, r0, r4
	movs r1, #6
	bl GetBoxMonData
	cmp r0, #0
	bne _080D1CA4
	ldr r0, [r7]
	adds r0, r0, r5
	adds r0, r0, r4
	movs r1, #0x51
	mov r2, sp
	bl GetBoxMonData
	cmp r0, #0
	beq _080D1CA4
	movs r0, #1
	b _080D1CBE
	.align 2, 0
_080D1C9C: .4byte 0x00000163
_080D1CA0: .4byte 0x03005AF4
_080D1CA4:
	adds r4, #0x50
	adds r6, #1
	cmp r6, #0x1d
	ble _080D1C64
	movs r0, #0x96
	lsls r0, r0, #4
	adds r5, r5, r0
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #0xd
	ble _080D1C60
	movs r0, #0
_080D1CBE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AnyStorageMonWithMove

	thumb_func_start ResetWaldaWallpaper
ResetWaldaWallpaper: @ 0x080D1CCC
	ldr r2, _080D1D04
	ldr r0, [r2]
	ldr r1, _080D1D08
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r3, _080D1D0C
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, #1
	adds r0, r0, r3
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, _080D1D10
	adds r2, r1, r0
	ldr r0, _080D1D14
	strh r0, [r2]
	subs r3, #0x14
	adds r2, r1, r3
	ldr r0, _080D1D18
	strh r0, [r2]
	ldr r0, _080D1D1C
	adds r1, r1, r0
	movs r0, #0xff
	strb r0, [r1]
	bx lr
	.align 2, 0
_080D1D04: .4byte 0x03005AEC
_080D1D08: .4byte 0x00003D84
_080D1D0C: .4byte 0x00003D85
_080D1D10: .4byte 0x00003D70
_080D1D14: .4byte 0x00007B35
_080D1D18: .4byte 0x00006186
_080D1D1C: .4byte 0x00003D74
	thumb_func_end ResetWaldaWallpaper

	thumb_func_start SetWaldaWallpaperLockedOrUnlocked
SetWaldaWallpaperLockedOrUnlocked: @ 0x080D1D20
	ldr r1, _080D1D2C
	ldr r1, [r1]
	ldr r2, _080D1D30
	adds r1, r1, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080D1D2C: .4byte 0x03005AEC
_080D1D30: .4byte 0x00003D86
	thumb_func_end SetWaldaWallpaperLockedOrUnlocked

	thumb_func_start IsWaldaWallpaperUnlocked
IsWaldaWallpaperUnlocked: @ 0x080D1D34
	ldr r0, _080D1D40
	ldr r0, [r0]
	ldr r1, _080D1D44
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080D1D40: .4byte 0x03005AEC
_080D1D44: .4byte 0x00003D86
	thumb_func_end IsWaldaWallpaperUnlocked

	thumb_func_start sub_080D1D48
sub_080D1D48: @ 0x080D1D48
	ldr r0, _080D1D54
	ldr r0, [r0]
	ldr r1, _080D1D58
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080D1D54: .4byte 0x03005AEC
_080D1D58: .4byte 0x00003D85
	thumb_func_end sub_080D1D48

	thumb_func_start SetWaldaWallpaperPatternId
SetWaldaWallpaperPatternId: @ 0x080D1D5C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bhi _080D1D70
	ldr r0, _080D1D74
	ldr r0, [r0]
	ldr r2, _080D1D78
	adds r0, r0, r2
	strb r1, [r0]
_080D1D70:
	pop {r0}
	bx r0
	.align 2, 0
_080D1D74: .4byte 0x03005AEC
_080D1D78: .4byte 0x00003D85
	thumb_func_end SetWaldaWallpaperPatternId

	thumb_func_start GetWaldaWallpaperIconId
GetWaldaWallpaperIconId: @ 0x080D1D7C
	ldr r0, _080D1D88
	ldr r0, [r0]
	ldr r1, _080D1D8C
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080D1D88: .4byte 0x03005AEC
_080D1D8C: .4byte 0x00003D84
	thumb_func_end GetWaldaWallpaperIconId

	thumb_func_start SetWaldaWallpaperIconId
SetWaldaWallpaperIconId: @ 0x080D1D90
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1d
	bhi _080D1DA4
	ldr r0, _080D1DA8
	ldr r0, [r0]
	ldr r2, _080D1DAC
	adds r0, r0, r2
	strb r1, [r0]
_080D1DA4:
	pop {r0}
	bx r0
	.align 2, 0
_080D1DA8: .4byte 0x03005AEC
_080D1DAC: .4byte 0x00003D84
	thumb_func_end SetWaldaWallpaperIconId

	thumb_func_start sub_080D1DB0
sub_080D1DB0: @ 0x080D1DB0
	ldr r0, _080D1DBC
	ldr r0, [r0]
	ldr r1, _080D1DC0
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080D1DBC: .4byte 0x03005AEC
_080D1DC0: .4byte 0x00003D70
	thumb_func_end sub_080D1DB0

	thumb_func_start SetWaldaWallpaperColors
SetWaldaWallpaperColors: @ 0x080D1DC4
	push {r4, lr}
	ldr r2, _080D1DDC
	ldr r2, [r2]
	ldr r4, _080D1DE0
	adds r3, r2, r4
	strh r0, [r3]
	ldr r0, _080D1DE4
	adds r2, r2, r0
	strh r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1DDC: .4byte 0x03005AEC
_080D1DE0: .4byte 0x00003D70
_080D1DE4: .4byte 0x00003D72
	thumb_func_end SetWaldaWallpaperColors

	thumb_func_start GetWaldaPhrasePtr
GetWaldaPhrasePtr: @ 0x080D1DE8
	ldr r0, _080D1DF4
	ldr r0, [r0]
	ldr r1, _080D1DF8
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080D1DF4: .4byte 0x03005AEC
_080D1DF8: .4byte 0x00003D74
	thumb_func_end GetWaldaPhrasePtr

	thumb_func_start SetWaldaPhrase
SetWaldaPhrase: @ 0x080D1DFC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080D1E10
	ldr r0, [r0]
	ldr r2, _080D1E14
	adds r0, r0, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080D1E10: .4byte 0x03005AEC
_080D1E14: .4byte 0x00003D74
	thumb_func_end SetWaldaPhrase

	thumb_func_start IsWaldaPhraseEmpty
IsWaldaPhraseEmpty: @ 0x080D1E18
	push {lr}
	movs r1, #0
	ldr r0, _080D1E34
	ldr r0, [r0]
	ldr r2, _080D1E38
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080D1E2C
	movs r1, #1
_080D1E2C:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080D1E34: .4byte 0x03005AEC
_080D1E38: .4byte 0x00003D74
	thumb_func_end IsWaldaPhraseEmpty

	thumb_func_start sub_080D1E3C
sub_080D1E3C: @ 0x080D1E3C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _080D1E88
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	bl Alloc
	str r0, [r6]
	ldr r5, _080D1E8C
	movs r1, #0
	cmp r0, #0
	beq _080D1E5A
	adds r1, r4, #0
_080D1E5A:
	strh r1, [r5]
	movs r2, #0
	cmp r2, r1
	bhs _080D1E82
	movs r3, #0
	adds r4, r5, #0
_080D1E66:
	ldr r0, [r6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #4
	adds r1, r1, r0
	str r3, [r1, #0x18]
	adds r1, #0x2c
	strb r3, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r4]
	cmp r2, r0
	blo _080D1E66
_080D1E82:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1E88: .4byte 0x02039A24
_080D1E8C: .4byte 0x02039A28
	thumb_func_end sub_080D1E3C

	thumb_func_start sub_080D1E90
sub_080D1E90: @ 0x080D1E90
	push {lr}
	ldr r0, _080D1EA0
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_080D1EA0: .4byte 0x02039A24
	thumb_func_end sub_080D1E90

	thumb_func_start sub_080D1EA4
sub_080D1EA4: @ 0x080D1EA4
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _080D1EDC
	ldrh r0, [r0]
	cmp r4, r0
	bge _080D1ED4
	movs r5, #0
_080D1EB2:
	ldr r0, _080D1EE0
	ldr r0, [r0]
	adds r0, r5, r0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #1
	bne _080D1EC8
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080D21B8
_080D1EC8:
	adds r5, #0x30
	adds r4, #1
	ldr r0, _080D1EDC
	ldrh r0, [r0]
	cmp r4, r0
	blt _080D1EB2
_080D1ED4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1EDC: .4byte 0x02039A28
_080D1EE0: .4byte 0x02039A24
	thumb_func_end sub_080D1EA4

	thumb_func_start sub_080D1EE4
sub_080D1EE4: @ 0x080D1EE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r2, #0
	ldr r2, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	ldr r0, _080D1F7C
	ldrh r0, [r0]
	cmp r6, r0
	bhs _080D1FCC
	ldr r0, _080D1F80
	mov sb, r0
	ldr r0, [r0]
	lsls r1, r6, #1
	mov r8, r1
	adds r5, r1, r6
	lsls r5, r5, #4
	adds r0, r5, r0
	movs r1, #0
	str r1, [r0, #0x18]
	str r4, [r0, #0x1c]
	adds r0, #0x2b
	strb r7, [r0]
	mov r2, sb
	ldr r0, [r2]
	adds r0, r5, r0
	mov r3, sl
	strh r3, [r0, #0x24]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, #0x26]
	adds r0, r7, #0
	movs r1, #3
	bl GetBgAttribute
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r7, #0
	movs r1, #9
	bl GetBgAttribute
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sb
	ldr r1, [r2]
	adds r5, r5, r1
	ldr r2, _080D1F84
	lsls r4, r4, #2
	lsls r1, r0, #4
	adds r4, r4, r1
	adds r4, r4, r2
	ldrh r1, [r4]
	strh r1, [r5, #0x20]
	ldrh r1, [r4, #2]
	strh r1, [r5, #0x22]
	mov r2, r8
	cmp r0, #0
	beq _080D1F88
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	b _080D1F8E
	.align 2, 0
_080D1F7C: .4byte 0x02039A28
_080D1F80: .4byte 0x02039A24
_080D1F84: .4byte 0x08556784
_080D1F88:
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #2
_080D1F8E:
	strb r0, [r1]
	ldr r4, _080D1FDC
	ldr r1, [r4]
	adds r2, r2, r6
	lsls r2, r2, #4
	adds r1, r2, r1
	adds r0, r1, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	mov r3, sl
	muls r3, r0, r3
	movs r0, #0
	strh r3, [r1, #0x28]
	mov r3, sl
	strh r3, [r1, #0x10]
	mov r5, sp
	ldrh r5, [r5]
	strh r5, [r1, #0x12]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x14]
	strh r0, [r1, #0x16]
	adds r0, r1, #0
	adds r0, #0xc
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r4]
	adds r2, r2, r0
	adds r2, #0x2c
	movs r0, #1
	strb r0, [r2]
_080D1FCC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D1FDC: .4byte 0x02039A24
	thumb_func_end sub_080D1EE4

	thumb_func_start sub_080D1FE0
sub_080D1FE0: @ 0x080D1FE0
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080D2008
	ldrh r0, [r0]
	cmp r2, r0
	bhs _080D2004
	ldr r0, _080D200C
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, r0, r1
	str r3, [r0, #0x18]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
_080D2004:
	pop {r0}
	bx r0
	.align 2, 0
_080D2008: .4byte 0x02039A28
_080D200C: .4byte 0x02039A24
	thumb_func_end sub_080D1FE0

	thumb_func_start sub_080D2010
sub_080D2010: @ 0x080D2010
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080D2044
	ldrh r0, [r0]
	cmp r3, r0
	bhs _080D203C
	ldr r0, _080D2048
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r0, r0, r1
	strh r4, [r0, #0x14]
	strh r2, [r0, #0x16]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
_080D203C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2044: .4byte 0x02039A28
_080D2048: .4byte 0x02039A24
	thumb_func_end sub_080D2010

	thumb_func_start sub_080D204C
sub_080D204C: @ 0x080D204C
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080D208C
	ldrh r0, [r0]
	cmp r5, r0
	bhs _080D2086
	ldr r0, _080D2090
	ldr r1, [r0]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r0, r1
	strh r6, [r0, #0xc]
	strh r2, [r0, #0xe]
	strh r3, [r0, #0x10]
	strh r4, [r0, #0x12]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
_080D2086:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D208C: .4byte 0x02039A28
_080D2090: .4byte 0x02039A24
	thumb_func_end sub_080D204C

	thumb_func_start sub_080D2094
sub_080D2094: @ 0x080D2094
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _080D20C0
	ldrh r0, [r0]
	cmp r5, r0
	blo _080D20AC
	b _080D21AE
_080D20AC:
	ldr r4, _080D20C4
	lsls r2, r5, #1
	cmp r1, #5
	bls _080D20B6
	b _080D21A0
_080D20B6:
	lsls r0, r1, #2
	ldr r1, _080D20C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D20C0: .4byte 0x02039A28
_080D20C4: .4byte 0x02039A24
_080D20C8: .4byte 0x080D20CC
_080D20CC: @ jump table
	.4byte _080D20E4 @ case 0
	.4byte _080D2104 @ case 1
	.4byte _080D2128 @ case 2
	.4byte _080D2148 @ case 3
	.4byte _080D216C @ case 4
	.4byte _080D2188 @ case 5
_080D20E4:
	ldr r4, _080D2100
	ldr r0, [r4]
	lsls r3, r5, #1
	adds r1, r3, r5
	lsls r1, r1, #4
	adds r1, r1, r0
	lsls r2, r6, #0x18
	asrs r2, r2, #0x18
	ldrh r0, [r1, #0x14]
	adds r0, r0, r2
	strh r0, [r1, #0x14]
	ldrh r0, [r1, #0x10]
	subs r0, r0, r2
	b _080D211E
	.align 2, 0
_080D2100: .4byte 0x02039A24
_080D2104:
	ldr r4, _080D2124
	ldr r0, [r4]
	lsls r3, r5, #1
	adds r1, r3, r5
	lsls r1, r1, #4
	adds r1, r1, r0
	lsls r2, r6, #0x18
	asrs r2, r2, #0x18
	ldrh r0, [r1, #0xc]
	adds r0, r0, r2
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0x10]
	adds r0, r0, r2
_080D211E:
	strh r0, [r1, #0x10]
	adds r2, r3, #0
	b _080D21A0
	.align 2, 0
_080D2124: .4byte 0x02039A24
_080D2128:
	ldr r4, _080D2144
	ldr r0, [r4]
	lsls r3, r5, #1
	adds r1, r3, r5
	lsls r1, r1, #4
	adds r1, r1, r0
	lsls r2, r6, #0x18
	asrs r2, r2, #0x18
	ldrh r0, [r1, #0x16]
	adds r0, r0, r2
	strh r0, [r1, #0x16]
	ldrh r0, [r1, #0x12]
	subs r0, r0, r2
	b _080D2162
	.align 2, 0
_080D2144: .4byte 0x02039A24
_080D2148:
	ldr r4, _080D2168
	ldr r0, [r4]
	lsls r3, r5, #1
	adds r1, r3, r5
	lsls r1, r1, #4
	adds r1, r1, r0
	lsls r2, r6, #0x18
	asrs r2, r2, #0x18
	ldrh r0, [r1, #0xe]
	subs r0, r0, r2
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0x12]
	adds r0, r0, r2
_080D2162:
	strh r0, [r1, #0x12]
	adds r2, r3, #0
	b _080D21A0
	.align 2, 0
_080D2168: .4byte 0x02039A24
_080D216C:
	ldr r3, _080D2184
	ldr r0, [r3]
	lsls r2, r5, #1
	adds r1, r2, r5
	lsls r1, r1, #4
	adds r1, r1, r0
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	ldrh r4, [r1, #0x14]
	adds r0, r0, r4
	strh r0, [r1, #0x14]
	b _080D219E
	.align 2, 0
_080D2184: .4byte 0x02039A24
_080D2188:
	ldr r3, _080D21B4
	ldr r0, [r3]
	lsls r2, r5, #1
	adds r1, r2, r5
	lsls r1, r1, #4
	adds r1, r1, r0
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	ldrh r4, [r1, #0x16]
	adds r0, r0, r4
	strh r0, [r1, #0x16]
_080D219E:
	adds r4, r3, #0
_080D21A0:
	ldr r0, [r4]
	adds r1, r2, r5
	lsls r1, r1, #4
	adds r1, r1, r0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
_080D21AE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D21B4: .4byte 0x02039A24
	thumb_func_end sub_080D2094

	thumb_func_start sub_080D21B8
sub_080D21B8: @ 0x080D21B8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r6, r2, #0
	ldr r0, _080D21F8
	ldrh r0, [r0]
	cmp r2, r0
	bhs _080D21F2
	ldr r5, _080D21FC
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r4, r1, #4
	adds r0, r4, r0
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _080D21E0
	adds r0, r2, #0
	bl sub_080D2200
_080D21E0:
	adds r0, r6, #0
	bl sub_080D2298
	ldr r1, [r5]
	adds r1, r4, r1
	adds r0, r1, #0
	adds r0, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
_080D21F2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D21F8: .4byte 0x02039A28
_080D21FC: .4byte 0x02039A24
	thumb_func_end sub_080D21B8

	thumb_func_start sub_080D2200
sub_080D2200: @ 0x080D2200
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r4, _080D2294
	ldr r1, [r4]
	lsls r5, r0, #1
	adds r0, r5, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r3, [r1]
	ldrh r1, [r0, #0x20]
	adds r2, r3, #0
	muls r2, r1, r2
	mov sb, r2
	movs r6, #0xa
	ldrsh r1, [r0, r6]
	mov r2, sb
	muls r2, r1, r2
	ldr r1, [r0, #0x18]
	adds r1, r1, r2
	movs r6, #8
	ldrsh r2, [r0, r6]
	muls r2, r3, r2
	adds r7, r1, r2
	movs r6, #0
	ldrh r0, [r0, #6]
	cmp r6, r0
	bge _080D2284
	mov sl, r4
_080D224A:
	mov r0, sl
	ldr r1, [r0]
	mov r2, r8
	adds r4, r5, r2
	lsls r4, r4, #4
	adds r1, r4, r1
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	ldrb r2, [r1, #8]
	ldrb r3, [r1, #0xa]
	adds r3, r3, r6
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrb r1, [r1, #4]
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r1, r7, #0
	bl CopyToBgTilemapBufferRect
	add r7, sb
	adds r6, #1
	mov r1, sl
	ldr r0, [r1]
	adds r4, r4, r0
	ldrh r4, [r4, #6]
	cmp r6, r4
	blt _080D224A
_080D2284:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D2294: .4byte 0x02039A24
	thumb_func_end sub_080D2200

	thumb_func_start sub_080D2298
sub_080D2298: @ 0x080D2298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r4, _080D232C
	ldr r1, [r4]
	lsls r5, r0, #1
	adds r0, r5, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r3, [r1]
	ldrh r1, [r0, #0x24]
	adds r2, r3, #0
	muls r2, r1, r2
	mov sb, r2
	movs r6, #0xe
	ldrsh r1, [r0, r6]
	mov r2, sb
	muls r2, r1, r2
	ldr r1, [r0, #0x1c]
	adds r1, r1, r2
	movs r6, #0xc
	ldrsh r2, [r0, r6]
	muls r2, r3, r2
	adds r7, r1, r2
	movs r6, #0
	ldrh r0, [r0, #0x12]
	cmp r6, r0
	bge _080D231C
	mov sl, r4
_080D22E2:
	mov r0, sl
	ldr r1, [r0]
	mov r2, r8
	adds r4, r5, r2
	lsls r4, r4, #4
	adds r1, r4, r1
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	ldrb r2, [r1, #0x14]
	ldrb r3, [r1, #0x16]
	adds r3, r3, r6
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrb r1, [r1, #0x10]
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r1, r7, #0
	bl CopyToBgTilemapBufferRect
	add r7, sb
	adds r6, #1
	mov r1, sl
	ldr r0, [r1]
	adds r4, r4, r0
	ldrh r4, [r4, #0x12]
	cmp r6, r4
	blt _080D22E2
_080D231C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D232C: .4byte 0x02039A24
	thumb_func_end sub_080D2298

	thumb_func_start sub_080D2330
sub_080D2330: @ 0x080D2330
	ldr r3, _080D2340
	str r0, [r3]
	str r1, [r0]
	movs r1, #0
	strb r2, [r0, #5]
	strb r1, [r0, #4]
	bx lr
	.align 2, 0
_080D2340: .4byte 0x02039A2C
	thumb_func_end sub_080D2330

	thumb_func_start sub_080D2344
sub_080D2344: @ 0x080D2344
	push {r4, r5, lr}
	ldr r2, _080D2388
	ldr r1, [r2]
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _080D2382
	movs r4, #0
	ldrb r1, [r1, #4]
	cmp r4, r1
	bhs _080D237A
	adds r5, r2, #0
_080D235A:
	ldr r0, [r5]
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r1, [r0, #0x10]
	bl _call_via_r1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r4, r0
	blo _080D235A
_080D237A:
	ldr r0, _080D2388
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #4]
_080D2382:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2388: .4byte 0x02039A2C
	thumb_func_end sub_080D2344

	thumb_func_start sub_080D238C
sub_080D238C: @ 0x080D238C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	mov sl, r3
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _080D240C
	ldr r2, [r0]
	ldrb r0, [r2, #4]
	adds r1, r0, #0
	ldrb r7, [r2, #5]
	cmp r1, r7
	bhs _080D2414
	adds r0, #1
	strb r0, [r2, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	lsls r0, r4, #1
	strh r0, [r1, #8]
	ldr r2, [sp]
	lsls r0, r2, #5
	add r0, ip
	lsls r0, r0, #1
	add r0, sb
	str r0, [r1, #4]
	adds r0, r3, #0
	muls r0, r6, r0
	add r0, r8
	lsls r0, r0, #1
	add r0, sl
	str r0, [r1]
	strh r5, [r1, #0xc]
	strh r6, [r1, #0xa]
	ldr r0, _080D2410
	str r0, [r1, #0x10]
	movs r0, #1
	b _080D2416
	.align 2, 0
_080D240C: .4byte 0x02039A2C
_080D2410: .4byte 0x080D2429
_080D2414:
	movs r0, #0
_080D2416:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D238C

	thumb_func_start sub_080D2428
sub_080D2428: @ 0x080D2428
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b _080D2452
_080D2430:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #8]
	lsrs r2, r2, #1
	bl CpuSet
	ldr r0, [r4, #4]
	adds r0, #0x40
	str r0, [r4, #4]
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #1
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080D2452:
	ldrh r0, [r4, #0xc]
	cmp r5, r0
	blo _080D2430
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080D2428

	thumb_func_start sub_080D2460
sub_080D2460: @ 0x080D2460
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080D24AC
	ldr r2, [r0]
	ldrb r0, [r2, #4]
	adds r1, r0, #0
	ldrb r7, [r2, #5]
	cmp r1, r7
	bhs _080D24B4
	adds r0, #1
	strb r0, [r2, #4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	lsls r0, r3, #1
	strh r0, [r1, #8]
	lsls r0, r4, #5
	adds r0, r0, r6
	lsls r0, r0, #1
	add r0, ip
	str r0, [r1, #4]
	strh r5, [r1, #0xc]
	ldr r0, _080D24B0
	str r0, [r1, #0x10]
	movs r0, #1
	b _080D24B6
	.align 2, 0
_080D24AC: .4byte 0x02039A2C
_080D24B0: .4byte 0x080D24BD
_080D24B4:
	movs r0, #0
_080D24B6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080D2460

	thumb_func_start sub_080D24BC
sub_080D24BC: @ 0x080D24BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	ldrh r1, [r6, #0xc]
	cmp r0, r1
	bhs _080D254A
	movs r7, #0x80
	lsls r7, r7, #5
	mov r5, sp
	ldr r2, _080D2508
	mov r8, r2
	movs r1, #0x81
	lsls r1, r1, #0x18
	mov sl, r1
_080D24E2:
	ldr r2, [r6, #4]
	ldrh r3, [r6, #8]
	mov ip, r2
	adds r0, #1
	mov sb, r0
	cmp r3, r7
	bhi _080D250C
	movs r0, #0
	strh r0, [r5]
	mov r2, sp
	mov r0, r8
	str r2, [r0]
	mov r1, ip
	str r1, [r0, #4]
	lsrs r0, r3, #1
	mov r2, sl
	orrs r0, r2
	mov r1, r8
	b _080D2534
	.align 2, 0
_080D2508: .4byte 0x040000D4
_080D250C:
	movs r4, #0
	strh r4, [r5]
	ldr r1, _080D255C
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _080D2560
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, r2, r7
	subs r3, r3, r7
	cmp r3, r7
	bhi _080D250C
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	lsrs r0, r3, #1
	mov r2, sl
	orrs r0, r2
_080D2534:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r0, ip
	adds r0, #0x40
	str r0, [r6, #4]
	mov r1, sb
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r6, #0xc]
	cmp r0, r2
	blo _080D24E2
_080D254A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D255C: .4byte 0x040000D4
_080D2560: .4byte 0x81000800
	thumb_func_end sub_080D24BC

