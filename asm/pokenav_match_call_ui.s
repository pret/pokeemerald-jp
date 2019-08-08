.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081C797C
sub_081C797C: @ 0x081C797C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	ldr r1, _081C79B8
	movs r0, #0x11
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081C79C4
	ldr r1, _081C79BC
	adds r0, r4, r1
	adds r1, r5, #0
	bl sub_081C8914
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r7, #0
	bl sub_081C8960
	cmp r0, #0
	beq _081C79C4
	ldr r0, _081C79C0
	movs r1, #6
	bl CreateLoopedTask
	movs r0, #1
	b _081C79C6
	.align 2, 0
_081C79B8: .4byte 0x000008A4
_081C79BC: .4byte 0x00000888
_081C79C0: .4byte 0x081C79FD
_081C79C4:
	movs r0, #0
_081C79C6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081C797C

	thumb_func_start sub_081C79CC
sub_081C79CC: @ 0x081C79CC
	push {lr}
	ldr r0, _081C79D8
	bl FuncIsActiveLoopedTask
	pop {r1}
	bx r1
	.align 2, 0
_081C79D8: .4byte 0x081C79FD
	thumb_func_end sub_081C79CC

	thumb_func_start sub_081C79DC
sub_081C79DC: @ 0x081C79DC
	push {r4, lr}
	movs r0, #0x11
	bl GetSubstructPtr
	adds r4, r0, #0
	bl sub_081C8794
	ldrb r0, [r4, #8]
	bl RemoveWindow
	movs r0, #0x11
	bl FreePokenavSubstruct
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081C79DC

	thumb_func_start LoopedTask_sub_81C8254
LoopedTask_sub_81C8254: @ 0x081C79FC
	push {r4, lr}
	adds r4, r0, #0
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C7A68
	movs r0, #0x11
	bl GetSubstructPtr
	adds r2, r0, #0
	cmp r4, #4
	bhi _081C7A7E
	lsls r0, r4, #2
	ldr r1, _081C7A20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C7A20: .4byte 0x081C7A24
_081C7A24: @ jump table
	.4byte _081C7A38 @ case 0
	.4byte _081C7A42 @ case 1
	.4byte _081C7A4C @ case 2
	.4byte _081C7A60 @ case 3
	.4byte _081C7A74 @ case 4
_081C7A38:
	adds r0, r2, #0
	bl sub_081C7A8C
	movs r0, #0
	b _081C7A80
_081C7A42:
	adds r0, r2, #0
	bl sub_081C7B04
	movs r0, #0
	b _081C7A80
_081C7A4C:
	ldr r1, _081C7A5C
	adds r0, r2, r1
	adds r1, r2, #0
	bl sub_081C7B24
	movs r0, #0
	b _081C7A80
	.align 2, 0
_081C7A5C: .4byte 0x00000888
_081C7A60:
	bl sub_081C7B88
	cmp r0, #0
	beq _081C7A6C
_081C7A68:
	movs r0, #2
	b _081C7A80
_081C7A6C:
	bl sub_081C867C
	movs r0, #1
	b _081C7A80
_081C7A74:
	ldr r1, _081C7A88
	adds r0, r2, r1
	adds r1, r2, #0
	bl sub_081C86A4
_081C7A7E:
	movs r0, #4
_081C7A80:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081C7A88: .4byte 0x00000888
	thumb_func_end LoopedTask_sub_81C8254

	thumb_func_start sub_081C7A8C
sub_081C7A8C: @ 0x081C7A8C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r4, [r5, #1]
	lsls r4, r4, #0xc
	ldrh r0, [r5, #6]
	orrs r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r5]
	ldrh r2, [r5, #6]
	movs r1, #0x11
	movs r3, #1
	bl sub_08199A88
	ldrb r0, [r5]
	ldrh r2, [r5, #6]
	adds r2, #1
	movs r1, #0x44
	movs r3, #1
	bl sub_08199A88
	ldrb r0, [r5]
	adds r1, r5, #0
	adds r1, #0x88
	bl SetBgTilemapBuffer
	ldrb r0, [r5]
	movs r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	ldrb r0, [r5]
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	ldrb r0, [r5]
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	ldrb r0, [r5]
	ldrb r1, [r5, #3]
	lsls r1, r1, #0xb
	movs r2, #2
	bl ChangeBgY
	ldrb r0, [r5]
	bl CopyBgTilemapBufferToVram
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C7A8C

	thumb_func_start sub_081C7B04
sub_081C7B04: @ 0x081C7B04
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #8]
	bl PutWindowTilemap
	ldrb r0, [r4, #8]
	movs r1, #1
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081C7B04

	thumb_func_start sub_081C7B24
sub_081C7B24: @ 0x081C7B24
	push {r4, r5, lr}
	sub sp, #8
	adds r3, r0, #0
	adds r5, r1, #0
	ldrh r0, [r3, #2]
	ldrh r4, [r3]
	subs r2, r0, r4
	ldrh r0, [r3, #8]
	cmp r2, r0
	ble _081C7B3A
	adds r2, r0, #0
_081C7B3A:
	ldr r0, [r3, #0x10]
	ldr r3, [r3, #0xc]
	movs r1, #0
	str r1, [sp]
	str r5, [sp, #4]
	adds r1, r4, #0
	bl sub_081C7B54
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C7B24

	thumb_func_start sub_081C7B54
sub_081C7B54: @ 0x081C7B54
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [sp, #0x10]
	cmp r2, #0
	beq _081C7B7E
	adds r0, r5, #0
	muls r0, r3, r0
	adds r0, r4, r0
	str r0, [r1, #0x1c]
	str r3, [r1, #0x18]
	movs r0, #0
	strh r0, [r1, #0xc]
	strh r2, [r1, #0xe]
	str r5, [r1, #0x14]
	ldr r0, [sp, #0xc]
	str r0, [r1, #0x10]
	ldr r0, _081C7B84
	movs r1, #5
	bl CreateLoopedTask
_081C7B7E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C7B84: .4byte 0x081C7B99
	thumb_func_end sub_081C7B54

	thumb_func_start sub_081C7B88
sub_081C7B88: @ 0x081C7B88
	push {lr}
	ldr r0, _081C7B94
	bl FuncIsActiveLoopedTask
	pop {r1}
	bx r1
	.align 2, 0
_081C7B94: .4byte 0x081C7B99
	thumb_func_end sub_081C7B88

	thumb_func_start LoopedTask_sub_81C83F0
LoopedTask_sub_81C83F0: @ 0x081C7B98
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0x11
	bl GetSubstructPtr
	adds r4, r0, #0
	cmp r6, #0
	beq _081C7BB0
	cmp r6, #1
	beq _081C7C34
	b _081C7C42
_081C7BB0:
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #0xc]
	adds r0, r0, r1
	ldr r1, [r4, #0x10]
	adds r5, r0, r1
	movs r0, #0xf
	ands r5, r0
	ldr r0, [r4, #0x1c]
	adds r7, r4, #0
	adds r7, #0x48
	ldr r2, [r4, #0x34]
	adds r1, r7, #0
	bl _call_via_r2
	ldr r3, [r4, #0x38]
	cmp r3, #0
	beq _081C7BDC
	ldrh r0, [r4, #8]
	ldr r1, [r4, #0x14]
	adds r2, r5, #0
	bl _call_via_r3
_081C7BDC:
	ldrb r0, [r4, #8]
	lsls r1, r5, #4
	movs r2, #2
	orrs r1, r2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r1, #1
	adds r2, r7, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0xe]
	cmp r0, r1
	blo _081C7C22
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _081C7C16
	ldrb r0, [r4, #8]
	movs r1, #3
	bl CopyWindowToVram
	b _081C7C1E
_081C7C16:
	ldrb r0, [r4, #8]
	movs r1, #2
	bl CopyWindowToVram
_081C7C1E:
	movs r0, #0
	b _081C7C44
_081C7C22:
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x18]
	adds r0, r0, r1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x14]
	adds r0, #1
	str r0, [r4, #0x14]
	movs r0, #3
	b _081C7C44
_081C7C34:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C7C42
	movs r0, #2
	b _081C7C44
_081C7C42:
	movs r0, #4
_081C7C44:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end LoopedTask_sub_81C83F0

	thumb_func_start ShouldShowUpArrow
ShouldShowUpArrow: @ 0x081C7C4C
	push {lr}
	movs r0, #0x11
	bl GetSubstructPtr
	ldr r1, _081C7C64
	adds r0, r0, r1
	ldrh r1, [r0]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	.align 2, 0
_081C7C64: .4byte 0x00000888
	thumb_func_end ShouldShowUpArrow

	thumb_func_start ShouldShowDownArrow
ShouldShowDownArrow: @ 0x081C7C68
	push {lr}
	movs r0, #0x11
	bl GetSubstructPtr
	ldr r1, _081C7C8C
	adds r0, r0, r1
	movs r3, #0
	ldrh r1, [r0]
	ldrh r2, [r0, #8]
	adds r1, r1, r2
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _081C7C84
	movs r3, #1
_081C7C84:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_081C7C8C: .4byte 0x00000888
	thumb_func_end ShouldShowDownArrow

	thumb_func_start MatchCall_MoveWindow
MatchCall_MoveWindow: @ 0x081C7C90
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r4, r1, #0
	movs r0, #0x11
	bl GetSubstructPtr
	adds r7, r0, #0
	ldr r0, _081C7CC8
	adds r5, r7, r0
	cmp r6, #0
	bge _081C7CCC
	ldrh r1, [r5]
	adds r0, r1, r6
	cmp r0, #0
	bge _081C7CB2
	rsbs r6, r1, #0
_081C7CB2:
	cmp r4, #0
	beq _081C7CF6
	ldr r0, [r5, #0x10]
	adds r1, r1, r6
	rsbs r2, r6, #0
	ldr r3, [r5, #0xc]
	str r6, [sp]
	str r7, [sp, #4]
	bl sub_081C7B54
	b _081C7CF6
	.align 2, 0
_081C7CC8: .4byte 0x00000888
_081C7CCC:
	cmp r4, #0
	beq _081C7CF6
	ldr r2, _081C7D0C
	ldrh r1, [r5]
	ldrh r0, [r5, #8]
	adds r4, r1, r0
	str r4, [r2]
	adds r0, r4, r6
	ldrh r1, [r5, #2]
	cmp r0, r1
	blt _081C7CE4
	subs r6, r1, r4
_081C7CE4:
	ldr r0, [r5, #0x10]
	ldr r3, [r5, #0xc]
	ldrh r1, [r5, #8]
	str r1, [sp]
	str r7, [sp, #4]
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_081C7B54
_081C7CF6:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_081C7D10
	ldrh r0, [r5]
	adds r0, r0, r6
	strh r0, [r5]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C7D0C: .4byte 0x0203CC10
	thumb_func_end MatchCall_MoveWindow

	thumb_func_start sub_081C7D10
sub_081C7D10: @ 0x081C7D10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4]
	bl GetBgY
	str r0, [r4, #0x20]
	lsls r1, r5, #0xc
	adds r0, r0, r1
	str r0, [r4, #0x24]
	cmp r5, #0
	ble _081C7D2C
	movs r0, #1
	b _081C7D2E
_081C7D2C:
	movs r0, #2
_081C7D2E:
	str r0, [r4, #0x30]
	str r5, [r4, #0x2c]
	ldr r0, _081C7D44
	movs r1, #6
	bl CreateLoopedTask
	str r0, [r4, #0x28]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C7D44: .4byte 0x081C7D49
	thumb_func_end sub_081C7D10

	thumb_func_start LoopedTask_sub_81C85A0
LoopedTask_sub_81C85A0: @ 0x081C7D48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x11
	bl GetSubstructPtr
	adds r4, r0, #0
	cmp r5, #0
	beq _081C7D60
	cmp r5, #1
	beq _081C7D6C
	movs r0, #4
	b _081C7DD2
_081C7D60:
	bl sub_081C7B88
	cmp r0, #0
	bne _081C7DD0
	movs r0, #1
	b _081C7DD2
_081C7D6C:
	movs r6, #0
	ldrb r0, [r4]
	bl GetBgY
	adds r5, r0, #0
	ldrb r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #4
	ldr r2, [r4, #0x30]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl ChangeBgY
	adds r1, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #2
	bne _081C7DA0
	ldr r2, [r4, #0x24]
	cmp r5, r2
	bgt _081C7D9A
	ldr r0, [r4, #0x20]
	cmp r5, r0
	bgt _081C7DB2
_081C7D9A:
	cmp r1, r2
	bgt _081C7DB2
	b _081C7DB6
_081C7DA0:
	ldr r2, [r4, #0x24]
	cmp r5, r2
	blt _081C7DAC
	ldr r0, [r4, #0x20]
	cmp r5, r0
	blt _081C7DB2
_081C7DAC:
	cmp r1, r2
	blt _081C7DB2
	movs r6, #1
_081C7DB2:
	cmp r6, #0
	beq _081C7DD0
_081C7DB6:
	ldr r1, [r4, #0x2c]
	ldrh r0, [r4, #0xa]
	adds r0, r0, r1
	movs r1, #0xf
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrb r0, [r4]
	adds r1, r2, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #4
	b _081C7DD2
_081C7DD0:
	movs r0, #2
_081C7DD2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end LoopedTask_sub_81C85A0

	thumb_func_start sub_081C7DD8
sub_081C7DD8: @ 0x081C7DD8
	push {lr}
	movs r0, #0x11
	bl GetSubstructPtr
	ldr r0, [r0, #0x28]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C7DD8

	thumb_func_start GetMatchCallWindowStruct
GetMatchCallWindowStruct: @ 0x081C7DEC
	push {lr}
	movs r0, #0x11
	bl GetSubstructPtr
	ldr r1, _081C7DFC
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_081C7DFC: .4byte 0x00000888
	thumb_func_end GetMatchCallWindowStruct

	thumb_func_start MatchCall_MoveCursorUp
MatchCall_MoveCursorUp: @ 0x081C7E00
	push {lr}
	bl GetMatchCallWindowStruct
	adds r1, r0, #0
	ldrh r0, [r1, #6]
	cmp r0, #0
	beq _081C7E16
	subs r0, #1
	strh r0, [r1, #6]
	movs r0, #1
	b _081C7E2E
_081C7E16:
	bl ShouldShowUpArrow
	cmp r0, #0
	bne _081C7E22
	movs r0, #0
	b _081C7E2E
_081C7E22:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #1
	bl MatchCall_MoveWindow
	movs r0, #2
_081C7E2E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MatchCall_MoveCursorUp

	thumb_func_start MatchCall_MoveCursorDown
MatchCall_MoveCursorDown: @ 0x081C7E34
	push {lr}
	bl GetMatchCallWindowStruct
	adds r2, r0, #0
	ldrh r1, [r2]
	ldrh r3, [r2, #6]
	adds r1, r1, r3
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r1, r0
	bge _081C7E62
	ldrh r0, [r2, #8]
	subs r0, #1
	cmp r3, r0
	bge _081C7E5A
	adds r0, r3, #1
	strh r0, [r2, #6]
	movs r0, #1
	b _081C7E70
_081C7E5A:
	bl ShouldShowDownArrow
	cmp r0, #0
	bne _081C7E66
_081C7E62:
	movs r0, #0
	b _081C7E70
_081C7E66:
	movs r0, #1
	movs r1, #1
	bl MatchCall_MoveWindow
	movs r0, #2
_081C7E70:
	pop {r1}
	bx r1
	thumb_func_end MatchCall_MoveCursorDown

	thumb_func_start MatchCall_PageUp
MatchCall_PageUp: @ 0x081C7E74
	push {r4, lr}
	bl GetMatchCallWindowStruct
	adds r4, r0, #0
	bl ShouldShowUpArrow
	adds r1, r0, #0
	cmp r1, #0
	beq _081C7EA0
	ldrh r0, [r4]
	ldrh r1, [r4, #8]
	cmp r0, r1
	blo _081C7E92
	ldrh r0, [r4, #8]
	b _081C7E94
_081C7E92:
	ldrh r0, [r4]
_081C7E94:
	rsbs r0, r0, #0
	movs r1, #1
	bl MatchCall_MoveWindow
	movs r0, #2
	b _081C7EAE
_081C7EA0:
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _081C7EAA
	movs r0, #0
	b _081C7EAE
_081C7EAA:
	strh r1, [r4, #6]
	movs r0, #1
_081C7EAE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MatchCall_PageUp

	thumb_func_start MatchCall_PageDown
MatchCall_PageDown: @ 0x081C7EB4
	push {r4, lr}
	bl GetMatchCallWindowStruct
	adds r4, r0, #0
	bl ShouldShowDownArrow
	cmp r0, #0
	beq _081C7EDE
	ldrh r0, [r4]
	ldrh r3, [r4, #8]
	adds r2, r0, r3
	ldrh r1, [r4, #4]
	subs r0, r1, r0
	cmp r2, r1
	bgt _081C7ED4
	adds r0, r3, #0
_081C7ED4:
	movs r1, #1
	bl MatchCall_MoveWindow
	movs r0, #2
	b _081C7EFE
_081C7EDE:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #8]
	cmp r0, r1
	blo _081C7EEC
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #8]
	b _081C7EF0
_081C7EEC:
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #2]
_081C7EF0:
	subs r0, #1
	cmp r1, r0
	bge _081C7EFC
	strh r0, [r4, #6]
	movs r0, #1
	b _081C7EFE
_081C7EFC:
	movs r0, #0
_081C7EFE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MatchCall_PageDown

	thumb_func_start GetSelectedMatchCall
GetSelectedMatchCall: @ 0x081C7F04
	push {lr}
	bl GetMatchCallWindowStruct
	adds r1, r0, #0
	ldrh r0, [r1]
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetSelectedMatchCall

	thumb_func_start GetMatchCallListTopIndex
GetMatchCallListTopIndex: @ 0x081C7F18
	push {lr}
	bl GetMatchCallWindowStruct
	ldrh r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end GetMatchCallListTopIndex

	thumb_func_start sub_081C7F24
sub_081C7F24: @ 0x081C7F24
	push {r4, lr}
	movs r0, #0x11
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C7F4C
	adds r1, r4, r0
	movs r0, #0
	str r0, [r1]
	ldr r0, _081C7F50
	movs r1, #6
	bl CreateLoopedTask
	movs r1, #0x8a
	lsls r1, r1, #4
	adds r4, r4, r1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C7F4C: .4byte 0x0000089C
_081C7F50: .4byte 0x081C8019
	thumb_func_end sub_081C7F24

	thumb_func_start sub_081C7F54
sub_081C7F54: @ 0x081C7F54
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0x11
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, _081C7F8C
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, r0, r4
	movs r2, #0
	strh r0, [r1]
	ldr r1, _081C7F90
	adds r0, r5, r1
	str r2, [r0]
	ldr r0, _081C7F94
	movs r1, #6
	bl CreateLoopedTask
	movs r1, #0x8a
	lsls r1, r1, #4
	adds r5, r5, r1
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C7F8C: .4byte 0x00000888
_081C7F90: .4byte 0x0000089C
_081C7F94: .4byte 0x081C8101
	thumb_func_end sub_081C7F54

	thumb_func_start sub_081C7F98
sub_081C7F98: @ 0x081C7F98
	push {r4, lr}
	movs r0, #0x11
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C7FC0
	adds r1, r4, r0
	movs r0, #0
	str r0, [r1]
	ldr r0, _081C7FC4
	movs r1, #6
	bl CreateLoopedTask
	movs r1, #0x8a
	lsls r1, r1, #4
	adds r4, r4, r1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C7FC0: .4byte 0x0000089C
_081C7FC4: .4byte 0x081C81D1
	thumb_func_end sub_081C7F98

	thumb_func_start sub_081C7FC8
sub_081C7FC8: @ 0x081C7FC8
	push {lr}
	movs r0, #0x11
	bl GetSubstructPtr
	movs r1, #0x8a
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	thumb_func_end sub_081C7FC8

	thumb_func_start sub_081C7FE0
sub_081C7FE0: @ 0x081C7FE0
	push {r4, lr}
	movs r0, #0x11
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C8014
	adds r2, r4, r0
	ldrh r0, [r4, #8]
	ldrh r1, [r2]
	ldrh r3, [r2, #6]
	adds r1, r1, r3
	ldrh r2, [r4, #0xa]
	adds r2, r2, r3
	movs r3, #0xf
	ands r2, r3
	ldr r3, [r4, #0x38]
	bl _call_via_r3
	ldrb r0, [r4, #8]
	movs r1, #1
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C8014: .4byte 0x00000888
	thumb_func_end sub_081C7FE0

	thumb_func_start LoopedTask_sub_81C8870
LoopedTask_sub_81C8870: @ 0x081C8018
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x11
	bl GetSubstructPtr
	adds r4, r0, #0
	cmp r5, #4
	bhi _081C80F4
	lsls r0, r5, #2
	ldr r1, _081C8034
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C8034: .4byte 0x081C8038
_081C8038: @ jump table
	.4byte _081C804C @ case 0
	.4byte _081C8054 @ case 1
	.4byte _081C8080 @ case 2
	.4byte _081C80C0 @ case 3
	.4byte _081C80E0 @ case 4
_081C804C:
	adds r0, r4, #0
	movs r1, #1
	bl ToggleMatchCallArrows
_081C8054:
	ldr r0, _081C8078
	adds r5, r4, r0
	ldr r1, _081C807C
	adds r0, r4, r1
	ldr r1, [r5]
	ldrh r0, [r0]
	cmp r1, r0
	beq _081C806C
	adds r0, r4, #0
	movs r2, #1
	bl sub_081C8318
_081C806C:
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_081C8072:
	movs r0, #0
	b _081C80F6
	.align 2, 0
_081C8078: .4byte 0x0000089C
_081C807C: .4byte 0x0000088E
_081C8080:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C80EA
	ldr r2, _081C80A0
	adds r0, r4, r2
	subs r2, #0xc
	adds r1, r4, r2
	ldr r3, [r0]
	ldrh r1, [r1]
	cmp r3, r1
	beq _081C80A4
	movs r0, #6
	b _081C80F6
	.align 2, 0
_081C80A0: .4byte 0x0000089C
_081C80A4:
	ldr r0, _081C80BC
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _081C8072
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_081C8318
	b _081C8072
	.align 2, 0
_081C80BC: .4byte 0x0000088E
_081C80C0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C80EA
	ldr r2, _081C80DC
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _081C80F4
	movs r1, #0
	bl MatchCall_MoveWindow
	b _081C8072
	.align 2, 0
_081C80DC: .4byte 0x0000088E
_081C80E0:
	bl sub_081C7DD8
	adds r1, r0, #0
	cmp r1, #0
	beq _081C80EE
_081C80EA:
	movs r0, #2
	b _081C80F6
_081C80EE:
	ldr r2, _081C80FC
	adds r0, r4, r2
	strh r1, [r0]
_081C80F4:
	movs r0, #4
_081C80F6:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081C80FC: .4byte 0x0000088E
	thumb_func_end LoopedTask_sub_81C8870

	thumb_func_start LoopedTask_sub_81C8958
LoopedTask_sub_81C8958: @ 0x081C8100
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x11
	bl GetSubstructPtr
	adds r4, r0, #0
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C811A
	movs r0, #2
	b _081C81CA
_081C811A:
	cmp r5, #7
	bhi _081C81C4
	lsls r0, r5, #2
	ldr r1, _081C8128
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C8128: .4byte 0x081C812C
_081C812C: @ jump table
	.4byte _081C814C @ case 0
	.4byte _081C815C @ case 1
	.4byte _081C8166 @ case 2
	.4byte _081C8178 @ case 3
	.4byte _081C8182 @ case 4
	.4byte _081C8194 @ case 5
	.4byte _081C819E @ case 6
	.4byte _081C81B0 @ case 7
_081C814C:
	ldr r1, _081C8158
	adds r0, r4, r1
	adds r1, r4, #0
	bl sub_081C845C
	b _081C81C8
	.align 2, 0
_081C8158: .4byte 0x00000888
_081C815C:
	adds r0, r4, #0
	movs r1, #0
	bl PrintMatchCallFieldNames
	b _081C81C8
_081C8166:
	ldr r1, _081C8174
	adds r0, r4, r1
	adds r1, r4, #0
	movs r2, #0
	bl sub_081C85FC
	b _081C81C8
	.align 2, 0
_081C8174: .4byte 0x00000888
_081C8178:
	adds r0, r4, #0
	movs r1, #1
	bl PrintMatchCallFieldNames
	b _081C81C8
_081C8182:
	ldr r1, _081C8190
	adds r0, r4, r1
	adds r1, r4, #0
	movs r2, #1
	bl sub_081C85FC
	b _081C81C8
	.align 2, 0
_081C8190: .4byte 0x00000888
_081C8194:
	adds r0, r4, #0
	movs r1, #2
	bl PrintMatchCallFieldNames
	b _081C81C8
_081C819E:
	ldr r1, _081C81AC
	adds r0, r4, r1
	adds r1, r4, #0
	movs r2, #2
	bl sub_081C85FC
	b _081C81C8
	.align 2, 0
_081C81AC: .4byte 0x00000888
_081C81B0:
	ldr r1, _081C81C0
	adds r0, r4, r1
	adds r1, r4, #0
	movs r2, #3
	bl sub_081C85FC
	b _081C81C8
	.align 2, 0
_081C81C0: .4byte 0x00000888
_081C81C4:
	movs r0, #4
	b _081C81CA
_081C81C8:
	movs r0, #0
_081C81CA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end LoopedTask_sub_81C8958

	thumb_func_start LoopedTask_sub_81C8A28
LoopedTask_sub_81C8A28: @ 0x081C81D0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C824E
	movs r0, #0x11
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C8200
	adds r6, r4, r0
	adds r2, r4, #0
	cmp r5, #6
	bls _081C81F4
	b _081C830C
_081C81F4:
	lsls r0, r5, #2
	ldr r1, _081C8204
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C8200: .4byte 0x00000888
_081C8204: .4byte 0x081C8208
_081C8208: @ jump table
	.4byte _081C8224 @ case 0
	.4byte _081C8230 @ case 1
	.4byte _081C8290 @ case 2
	.4byte _081C82A4 @ case 3
	.4byte _081C82BC @ case 4
	.4byte _081C82DC @ case 5
	.4byte _081C8304 @ case 6
_081C8224:
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_081C84F4
	movs r0, #0
	b _081C830E
_081C8230:
	ldr r1, _081C8254
	adds r7, r4, r1
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	movs r3, #0x89
	lsls r3, r3, #4
	adds r0, r4, r3
	ldrh r0, [r0]
	cmp r1, r0
	bge _081C8258
	adds r0, r2, #0
	movs r2, #1
	bl sub_081C8318
_081C824E:
	movs r0, #2
	b _081C830E
	.align 2, 0
_081C8254: .4byte 0x0000089C
_081C8258:
	movs r0, #0
	str r0, [r7]
	ldrh r0, [r6, #2]
	ldrh r1, [r6, #8]
	cmp r0, r1
	bhi _081C826E
	ldrh r0, [r6]
	cmp r0, #0
	beq _081C82FA
	adds r4, r0, #0
	b _081C827C
_081C826E:
	ldrh r1, [r6]
	ldrh r0, [r6, #8]
	adds r4, r1, r0
	ldrh r1, [r6, #2]
	cmp r4, r1
	ble _081C82FA
	subs r4, r4, r1
_081C827C:
	rsbs r5, r4, #0
	adds r0, r2, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_081C8318
	strh r4, [r6, #6]
	str r5, [r7]
	movs r0, #0
	b _081C830E
_081C8290:
	ldr r2, _081C82A0
	adds r0, r4, r2
	ldr r0, [r0]
	movs r1, #0
	bl MatchCall_MoveWindow
	movs r0, #0
	b _081C830E
	.align 2, 0
_081C82A0: .4byte 0x0000089C
_081C82A4:
	bl sub_081C7DD8
	adds r1, r0, #0
	cmp r1, #0
	bne _081C824E
	ldr r3, _081C82B8
	adds r0, r4, r3
	str r1, [r0]
_081C82B4:
	movs r0, #1
	b _081C830E
	.align 2, 0
_081C82B8: .4byte 0x0000089C
_081C82BC:
	ldr r0, [r6, #0x10]
	ldrh r1, [r6]
	ldr r3, _081C82D8
	adds r2, r4, r3
	ldr r2, [r2]
	adds r1, r1, r2
	ldr r3, [r6, #0xc]
	str r2, [sp]
	str r4, [sp, #4]
	movs r2, #1
	bl sub_081C7B54
	movs r0, #0
	b _081C830E
	.align 2, 0
_081C82D8: .4byte 0x0000089C
_081C82DC:
	bl sub_081C7B88
	cmp r0, #0
	bne _081C824E
	ldr r0, _081C8300
	adds r1, r4, r0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrh r1, [r6, #2]
	cmp r0, r1
	bge _081C82B4
	ldrh r6, [r6, #8]
	cmp r0, r6
	bge _081C82B4
_081C82FA:
	movs r0, #9
	b _081C830E
	.align 2, 0
_081C8300: .4byte 0x0000089C
_081C8304:
	adds r0, r2, #0
	movs r1, #0
	bl ToggleMatchCallArrows
_081C830C:
	movs r0, #4
_081C830E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end LoopedTask_sub_81C8A28

	thumb_func_start sub_081C8318
sub_081C8318: @ 0x081C8318
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r0
	adds r7, r1, #0
	adds r6, r2, #0
	ldrb r0, [r0, #8]
	movs r1, #7
	bl GetWindowAttribute
	mov sl, r0
	mov r1, sb
	ldrb r0, [r1, #4]
	lsls r3, r0, #6
	ldrh r0, [r1, #0xa]
	adds r7, r0, r7
	movs r0, #0xf
	ands r7, r0
	adds r0, r7, r6
	cmp r0, #0x10
	bgt _081C837C
	ldr r0, _081C8374
	str r0, [sp]
	adds r1, r7, #0
	muls r1, r3, r1
	add r1, sl
	adds r2, r6, #0
	muls r2, r3, r2
	lsrs r2, r2, #2
	ldr r0, _081C8378
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	mov r1, sb
	ldrb r0, [r1, #8]
	movs r1, #2
	bl CopyWindowToVram
	b _081C83C6
	.align 2, 0
_081C8374: .4byte 0x11111111
_081C8378: .4byte 0x001FFFFF
_081C837C:
	movs r2, #0x10
	subs r2, r2, r7
	subs r0, r6, r2
	mov r8, r0
	ldr r1, _081C8404
	str r1, [sp, #4]
	add r0, sp, #4
	adds r1, r7, #0
	muls r1, r3, r1
	add r1, sl
	muls r2, r3, r2
	lsrs r2, r2, #2
	ldr r5, _081C8408
	ands r2, r5
	movs r4, #0x80
	lsls r4, r4, #0x11
	orrs r2, r4
	str r3, [sp, #0xc]
	bl CpuFastSet
	ldr r0, _081C8404
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r3, [sp, #0xc]
	mov r2, r8
	muls r2, r3, r2
	lsrs r2, r2, #2
	ands r2, r5
	orrs r2, r4
	mov r1, sl
	bl CpuFastSet
	mov r1, sb
	ldrb r0, [r1, #8]
	movs r1, #2
	bl CopyWindowToVram
_081C83C6:
	subs r6, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	beq _081C83E8
	movs r5, #0xf
	adds r4, r0, #0
_081C83D4:
	mov r1, sb
	ldrh r0, [r1, #8]
	adds r1, r7, #0
	bl sub_081CB4B8
	adds r7, #1
	ands r7, r5
	subs r6, #1
	cmp r6, r4
	bne _081C83D4
_081C83E8:
	mov r1, sb
	ldrb r0, [r1, #8]
	movs r1, #1
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C8404: .4byte 0x11111111
_081C8408: .4byte 0x001FFFFF
	thumb_func_end sub_081C8318

	thumb_func_start sub_081C840C
sub_081C840C: @ 0x081C840C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r5, #8]
	movs r1, #0
	bl GetWindowAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBgTilemapBuffer
	adds r2, r0, #0
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #6
	ldrb r1, [r5, #2]
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, #2
	adds r2, r2, r0
	cmp r4, #0
	beq _081C8440
	ldrb r0, [r5, #1]
	lsls r0, r0, #0xc
	ldrh r1, [r5, #6]
	adds r1, #1
	b _081C8446
_081C8440:
	ldrb r0, [r5, #1]
	lsls r0, r0, #0xc
	ldrh r1, [r5, #6]
_081C8446:
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	strh r1, [r2]
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C840C

	thumb_func_start sub_081C845C
sub_081C845C: @ 0x081C845C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _081C84F0
	add r0, sp, #0xc
	movs r2, #3
	bl memcpy
	ldrh r1, [r5]
	ldr r0, [r5, #0xc]
	muls r1, r0, r1
	ldr r0, [r5, #0x10]
	adds r0, r0, r1
	adds r6, r4, #0
	adds r6, #0x48
	ldr r2, [r4, #0x34]
	adds r1, r6, #0
	bl _call_via_r2
	thumb_func_end sub_081C845C

	thumb_func_start sub_081C8484
sub_081C8484: @ 0x081C8484
	ldrh r0, [r4, #8]
	ldrh r1, [r5]
	ldrh r2, [r4, #0xa]
	ldr r3, [r4, #0x38]
	bl _call_via_r3
	ldrb r0, [r4, #8]
	ldrh r3, [r4, #0xa]
	lsls r3, r3, #0x14
	lsrs r3, r3, #0x10
	ldrb r1, [r4, #4]
	lsls r1, r1, #3
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x44
	movs r2, #0
	bl FillWindowPixelRect
	ldrb r0, [r4, #8]
	ldrh r3, [r4, #0xa]
	lsls r3, r3, #4
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	add r1, sp, #0xc
	str r1, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r1, #1
	movs r2, #0
	bl AddTextPrinterParameterized3
	adds r0, r4, #0
	movs r1, #1
	bl sub_081C840C
	ldrh r0, [r4, #8]
	ldrh r3, [r4, #0xa]
	lsls r3, r3, #1
	ldrb r1, [r4, #4]
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #3
	movs r2, #0
	bl CopyWindowRectToVram
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C84F0: .4byte 0x085F15A8
	thumb_func_end sub_081C8484

	thumb_func_start sub_081C84F4
sub_081C84F4: @ 0x081C84F4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldrh r2, [r0]
	ldr r1, [r0, #0xc]
	muls r1, r2, r1
	ldr r0, [r0, #0x10]
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x48
	ldr r2, [r4, #0x34]
	adds r1, r5, #0
	bl _call_via_r2
	thumb_func_end sub_081C84F4

	thumb_func_start sub_081C8510
sub_081C8510: @ 0x081C8510
	ldrb r0, [r4, #8]
	ldrh r3, [r4, #0xa]
	lsls r3, r3, #0x14
	lsrs r3, r3, #0x10
	ldrb r1, [r4, #4]
	lsls r1, r1, #3
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x11
	movs r2, #0
	bl FillWindowPixelRect
	ldrb r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #4
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	adds r0, r4, #0
	movs r1, #0
	bl sub_081C840C
	ldrb r0, [r4, #8]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C8510

	thumb_func_start PrintMatchCallFieldNames
PrintMatchCallFieldNames: @ 0x081C8564
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x1c
	adds r6, r0, #0
	mov r8, r1
	add r1, sp, #0xc
	ldr r0, _081C85F4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	add r0, sp, #0x18
	mov sb, r0
	ldr r1, _081C85F8
	movs r2, #3
	bl memcpy
	ldrh r4, [r6, #0xa]
	mov r1, r8
	lsls r0, r1, #1
	adds r0, #1
	adds r4, r4, r0
	movs r0, #0xf
	ands r4, r0
	ldrb r0, [r6, #8]
	lsls r5, r4, #4
	adds r3, r5, #0
	ldrb r1, [r6, #4]
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x11
	movs r2, #0
	bl FillWindowPixelRect
	ldrb r0, [r6, #8]
	movs r1, #2
	orrs r5, r1
	mov r2, sb
	str r2, [sp]
	subs r1, #3
	str r1, [sp, #4]
	mov r3, r8
	lsls r3, r3, #2
	mov r8, r3
	mov r1, sp
	add r1, r8
	adds r1, #0xc
	ldr r1, [r1]
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	adds r3, r5, #0
	bl AddTextPrinterParameterized3
	ldrh r0, [r6, #8]
	lsls r4, r4, #1
	ldrb r1, [r6, #4]
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r2, #0
	adds r3, r4, #0
	bl CopyWindowRectToVram
	add sp, #0x1c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C85F4: .4byte 0x085F15AC
_081C85F8: .4byte 0x085F15B8
	thumb_func_end PrintMatchCallFieldNames

	thumb_func_start sub_081C85FC
sub_081C85FC: @ 0x081C85FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r1, r2, #0
	ldrh r3, [r5, #0xa]
	ldr r2, _081C8630
	adds r2, r1, r2
	ldrb r2, [r2]
	adds r7, r3, r2
	movs r2, #0xf
	ands r7, r2
	ldrh r0, [r0]
	bl sub_081CA77C
	adds r6, r0, #0
	cmp r6, #0
	beq _081C8634
	adds r4, r5, #0
	adds r4, #0x48
	ldrb r3, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl StringCopyPadded
	b _081C8642
	.align 2, 0
_081C8630: .4byte 0x085F15BB
_081C8634:
	adds r4, r5, #0
	adds r4, #0x48
	ldrb r2, [r5, #4]
	adds r0, r4, #0
	movs r1, #0
	bl StringFill
_081C8642:
	cmp r6, #0
	beq _081C8674
	ldrb r0, [r5, #8]
	lsls r1, r7, #4
	movs r2, #2
	orrs r1, r2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrh r0, [r5, #8]
	lsls r3, r7, #1
	ldrb r1, [r5, #4]
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r2, #0
	bl CopyWindowRectToVram
_081C8674:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081C85FC

	thumb_func_start sub_081C867C
sub_081C867C: @ 0x081C867C
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _081C869C
_081C8682:
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	adds r4, #8
	adds r5, #1
	cmp r5, #0
	beq _081C8682
	ldr r0, _081C86A0
	bl Pokenav_AllocAndLoadPalettes
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C869C: .4byte 0x085F15C0
_081C86A0: .4byte 0x085F15C8
	thumb_func_end sub_081C867C

	thumb_func_start sub_081C86A4
sub_081C86A4: @ 0x081C86A4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _081C8774
	ldrb r1, [r5, #2]
	lsls r1, r1, #0x13
	ldr r2, _081C8778
	adds r1, r1, r2
	asrs r1, r1, #0x10
	ldrb r2, [r5, #3]
	adds r2, #1
	lsls r2, r2, #3
	movs r3, #7
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r3, _081C877C
	mov r8, r3
	add r0, r8
	str r0, [r5, #0x3c]
	ldrb r6, [r5, #2]
	lsls r6, r6, #3
	ldrb r0, [r5, #4]
	subs r0, #1
	lsls r0, r0, #2
	ldr r1, _081C8780
	mov sl, r1
	adds r6, r6, r0
	ldrb r2, [r5, #3]
	lsls r2, r2, #3
	ldrh r0, [r4, #8]
	lsls r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sl
	adds r1, r6, #0
	movs r3, #7
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	add r2, r8
	str r2, [r5, #0x44]
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #2
	ldr r0, _081C8784
	mov sb, r0
	mov r0, sb
	ands r1, r0
	ldr r4, _081C8788
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
	ldr r1, [r5, #0x44]
	ldr r0, _081C878C
	str r0, [r1, #0x1c]
	ldrb r2, [r5, #3]
	lsls r2, r2, #3
	mov r0, sl
	adds r1, r6, #0
	movs r3, #7
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	add r1, r8
	str r1, [r5, #0x40]
	ldrh r2, [r1, #4]
	lsls r0, r2, #0x16
	lsrs r0, r0, #0x16
	adds r0, #4
	mov r3, sb
	ands r0, r3
	ands r4, r2
	orrs r4, r0
	strh r4, [r1, #4]
	ldr r1, [r5, #0x40]
	ldr r0, _081C8790
	str r0, [r1, #0x1c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C8774: .4byte 0x085F15E0
_081C8778: .4byte 0xFFFC0000
_081C877C: .4byte 0x020205AC
_081C8780: .4byte 0x085F1600
_081C8784: .4byte 0x000003FF
_081C8788: .4byte 0xFFFFFC00
_081C878C: .4byte 0x081C8855
_081C8790: .4byte 0x081C88A9
	thumb_func_end sub_081C86A4

	thumb_func_start sub_081C8794
sub_081C8794: @ 0x081C8794
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl DestroySprite
	ldr r0, [r4, #0x40]
	bl DestroySprite
	ldr r0, [r4, #0x44]
	bl DestroySprite
	movs r0, #0xa
	bl FreeSpriteTilesByTag
	movs r0, #0x14
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081C8794

	thumb_func_start ToggleMatchCallArrows
ToggleMatchCallArrows: @ 0x081C87BC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _081C87DC
	ldr r2, [r5, #0x3c]
	ldr r1, _081C87D8
	str r1, [r2, #0x1c]
	ldr r0, [r5, #0x40]
	str r1, [r0, #0x1c]
	ldr r0, [r5, #0x44]
	str r1, [r0, #0x1c]
	b _081C87EE
	.align 2, 0
_081C87D8: .4byte 0x08007141
_081C87DC:
	ldr r2, [r5, #0x3c]
	ldr r0, _081C8828
	str r0, [r2, #0x1c]
	ldr r1, [r5, #0x40]
	ldr r0, _081C882C
	str r0, [r1, #0x1c]
	ldr r1, [r5, #0x44]
	ldr r0, _081C8830
	str r0, [r1, #0x1c]
_081C87EE:
	adds r3, r2, #0
	adds r3, #0x3e
	movs r0, #1
	ands r4, r0
	lsls r4, r4, #2
	ldrb r2, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, [r5, #0x40]
	adds r2, #0x3e
	ldrb r3, [r2]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2]
	ldr r0, [r5, #0x44]
	adds r0, #0x3e
	ldrb r2, [r0]
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C8828: .4byte 0x081C8835
_081C882C: .4byte 0x081C88A9
_081C8830: .4byte 0x081C8855
	thumb_func_end ToggleMatchCallArrows

	thumb_func_start SpriteCB_MatchCallRightArrow
SpriteCB_MatchCallRightArrow: @ 0x081C8834
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl GetSubstructPtr
	ldr r1, _081C8850
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C8850: .4byte 0x0000088E
	thumb_func_end SpriteCB_MatchCallRightArrow

	thumb_func_start SpriteCB_MatchCallDownArrow
SpriteCB_MatchCallDownArrow: @ 0x081C8854
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081C8876
	bl ShouldShowDownArrow
	cmp r0, #0
	beq _081C8876
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	b _081C8880
_081C8876:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
_081C8880:
	strb r0, [r2]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _081C88A0
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	strh r0, [r4, #0x30]
	strh r0, [r4, #0x26]
_081C88A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_MatchCallDownArrow

	thumb_func_start SpriteCB_MatchCallUpArrow
SpriteCB_MatchCallUpArrow: @ 0x081C88A8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081C88CA
	bl ShouldShowUpArrow
	cmp r0, #0
	beq _081C88CA
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	b _081C88D4
_081C88CA:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
_081C88D4:
	strb r0, [r2]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _081C88F6
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	strh r0, [r4, #0x30]
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
_081C88F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_MatchCallUpArrow

	thumb_func_start ToggleMatchCallVerticalArrows
ToggleMatchCallVerticalArrows: @ 0x081C88FC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl GetSubstructPtr
	ldr r1, [r0, #0x40]
	strh r4, [r1, #0x3c]
	ldr r0, [r0, #0x44]
	strh r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ToggleMatchCallVerticalArrows

	thumb_func_start sub_081C8914
sub_081C8914: @ 0x081C8914
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r1]
	str r0, [r2, #0x10]
	ldrh r4, [r1, #6]
	movs r5, #0
	strh r4, [r2]
	ldrh r3, [r1, #4]
	strh r3, [r2, #2]
	ldrb r0, [r1, #8]
	str r0, [r2, #0xc]
	ldrb r1, [r1, #0xc]
	strh r1, [r2, #8]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	blo _081C893E
	strh r5, [r2]
	strh r5, [r2, #4]
	strh r4, [r2, #6]
	b _081C895A
_081C893E:
	subs r0, r3, r1
	strh r0, [r2, #4]
	ldrh r1, [r2]
	ldrh r0, [r2, #8]
	adds r1, r1, r0
	ldrh r0, [r2, #2]
	cmp r1, r0
	ble _081C8958
	subs r0, r1, r0
	strh r0, [r2, #6]
	subs r0, r4, r0
	strh r0, [r2]
	b _081C895A
_081C8958:
	strh r5, [r2, #6]
_081C895A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081C8914

	thumb_func_start sub_081C8960
sub_081C8960: @ 0x081C8960
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r4, [r1]
	lsls r4, r4, #0x1e
	lsrs r0, r4, #0x1e
	movs r1, #0
	mov r8, r1
	strb r0, [r7]
	strh r3, [r7, #6]
	ldr r0, [r2, #0x10]
	str r0, [r7, #0x34]
	ldr r0, [r2, #0x14]
	str r0, [r7, #0x38]
	ldrb r5, [r2, #0xd]
	strb r5, [r7, #1]
	ldrb r1, [r2, #9]
	strb r1, [r7, #2]
	ldrb r0, [r2, #0xb]
	strb r0, [r7, #3]
	ldrb r2, [r2, #0xa]
	strb r2, [r7, #4]
	lsrs r4, r4, #0x1e
	ldr r6, _081C89F0
	ldr r0, [sp]
	ands r0, r6
	orrs r0, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	ldr r4, _081C89F4
	ands r0, r4
	orrs r0, r1
	ldr r1, _081C89F8
	ands r0, r1
	lsls r2, r2, #0x18
	ldr r1, _081C89FC
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	ldr r0, [sp, #4]
	ands r0, r6
	movs r1, #0x20
	orrs r0, r1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x10
	ands r0, r4
	orrs r0, r5
	adds r3, #2
	lsls r3, r3, #0x10
	ldr r1, _081C8A00
	ands r0, r1
	orrs r0, r3
	str r0, [sp, #4]
	mov r0, sp
	bl AddWindow
	strh r0, [r7, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	beq _081C8A04
	mov r0, r8
	strh r0, [r7, #0xa]
	mov r1, r8
	str r1, [r7, #0x3c]
	str r1, [r7, #0x40]
	str r1, [r7, #0x44]
	movs r0, #1
	b _081C8A06
	.align 2, 0
_081C89F0: .4byte 0xFFFFFF00
_081C89F4: .4byte 0xFFFF00FF
_081C89F8: .4byte 0xFF00FFFF
_081C89FC: .4byte 0x00FFFFFF
_081C8A00: .4byte 0x0000FFFF
_081C8A04:
	movs r0, #0
_081C8A06:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C8960

