.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CallBattlePyramidFunction
CallBattlePyramidFunction: @ 0x081A8BFC
	push {lr}
	ldr r1, _081A8C14
	ldr r0, _081A8C18
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end CallBattlePyramidFunction

	thumb_func_start sub_081A8C10
sub_081A8C10: @ 0x081A8C10
	bx r0
	.align 2, 0
_081A8C14: .4byte 0x085DF718
_081A8C18: .4byte 0x02037280
	thumb_func_end sub_081A8C10

	thumb_func_start InitPyramidChallenge
InitPyramidChallenge: @ 0x081A8C1C
	push {r4, r5, r6, lr}
	ldr r3, _081A8C5C
	ldr r1, [r3]
	ldr r4, _081A8C60
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _081A8C64
	adds r1, r1, r0
	movs r2, #0
	strb r2, [r1]
	ldr r1, [r3]
	ldr r6, _081A8C68
	adds r0, r1, r6
	strh r2, [r0]
	adds r1, r1, r4
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	cmp r5, #0
	beq _081A8C70
	ldr r0, [r3]
	ldr r1, _081A8C6C
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	b _081A8C7C
	.align 2, 0
_081A8C5C: .4byte 0x03005AF0
_081A8C60: .4byte 0x00000CA9
_081A8C64: .4byte 0x00000CA8
_081A8C68: .4byte 0x00000CB2
_081A8C6C: .4byte 0x00000CDC
_081A8C70:
	ldr r0, [r3]
	ldr r6, _081A8CA8
	adds r0, r0, r6
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
_081A8C7C:
	ands r2, r0
	cmp r2, #0
	bne _081A8C94
	ldr r0, [r3]
	lsls r1, r5, #1
	ldr r3, _081A8CAC
	adds r0, r0, r3
	adds r0, r0, r1
	strh r2, [r0]
	adds r0, r5, #0
	bl InitPyramidBagItems
_081A8C94:
	bl InitBattlePyramidBagCursorPosition
	ldr r0, _081A8CB0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081A8CB4
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A8CA8: .4byte 0x00000CDC
_081A8CAC: .4byte 0x00000E1A
_081A8CB0: .4byte 0x0203886A
_081A8CB4: .4byte 0x02023FDE
	thumb_func_end InitPyramidChallenge

	thumb_func_start GetBattlePyramidData
GetBattlePyramidData: @ 0x081A8CB8
	push {r4, lr}
	ldr r1, _081A8CE0
	ldr r0, [r1]
	ldr r2, _081A8CE4
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r4, r0, #0x1e
	ldr r0, _081A8CE8
	ldrh r0, [r0]
	adds r3, r1, #0
	cmp r0, #6
	bls _081A8CD4
	b _081A8DBA
_081A8CD4:
	lsls r0, r0, #2
	ldr r1, _081A8CEC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A8CE0: .4byte 0x03005AF0
_081A8CE4: .4byte 0x00000CA9
_081A8CE8: .4byte 0x02037282
_081A8CEC: .4byte 0x081A8CF0
_081A8CF0: @ jump table
	.4byte _081A8D0C @ case 0
	.4byte _081A8D1C @ case 1
	.4byte _081A8D34 @ case 2
	.4byte _081A8D64 @ case 3
	.4byte _081A8D78 @ case 4
	.4byte _081A8D90 @ case 5
	.4byte _081A8DA8 @ case 6
_081A8D0C:
	ldr r0, _081A8D14
	ldr r1, [r3]
	ldr r3, _081A8D18
	b _081A8D7E
	.align 2, 0
_081A8D14: .4byte 0x02037290
_081A8D18: .4byte 0x00000E18
_081A8D1C:
	ldr r2, _081A8D2C
	ldr r0, [r3]
	lsls r1, r4, #1
	ldr r3, _081A8D30
	adds r0, r0, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	b _081A8DB8
	.align 2, 0
_081A8D2C: .4byte 0x02037290
_081A8D30: .4byte 0x00000E1A
_081A8D34:
	cmp r4, #0
	beq _081A8D4C
	ldr r2, _081A8D44
	ldr r0, [r3]
	ldr r1, _081A8D48
	adds r0, r0, r1
	b _081A8DB0
	.align 2, 0
_081A8D44: .4byte 0x02037290
_081A8D48: .4byte 0x00000CDC
_081A8D4C:
	ldr r2, _081A8D5C
	ldr r0, [r3]
	ldr r3, _081A8D60
	adds r0, r0, r3
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	b _081A8DB6
	.align 2, 0
_081A8D5C: .4byte 0x02037290
_081A8D60: .4byte 0x00000CDC
_081A8D64:
	ldr r0, _081A8D70
	ldr r1, [r3]
	ldr r2, _081A8D74
	adds r1, r1, r2
	b _081A8D80
	.align 2, 0
_081A8D70: .4byte 0x02037290
_081A8D74: .4byte 0x00000E1A
_081A8D78:
	ldr r0, _081A8D88
	ldr r1, [r3]
	ldr r3, _081A8D8C
_081A8D7E:
	adds r1, r1, r3
_081A8D80:
	ldrh r1, [r1]
	strh r1, [r0]
	b _081A8DBA
	.align 2, 0
_081A8D88: .4byte 0x02037290
_081A8D8C: .4byte 0x00000E1C
_081A8D90:
	ldr r2, _081A8DA0
	ldr r0, [r3]
	ldr r1, _081A8DA4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	b _081A8DB6
	.align 2, 0
_081A8DA0: .4byte 0x02037290
_081A8DA4: .4byte 0x00000CDC
_081A8DA8:
	ldr r2, _081A8DC0
	ldr r0, [r3]
	ldr r3, _081A8DC4
	adds r0, r0, r3
_081A8DB0:
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
_081A8DB6:
	ands r0, r1
_081A8DB8:
	strh r0, [r2]
_081A8DBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A8DC0: .4byte 0x02037290
_081A8DC4: .4byte 0x00000CDC
	thumb_func_end GetBattlePyramidData

	thumb_func_start SetBattlePyramidData
SetBattlePyramidData: @ 0x081A8DC8
	push {lr}
	ldr r0, _081A8DEC
	ldr r2, [r0]
	ldr r1, _081A8DF0
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r1, r0, #0x1e
	ldr r0, _081A8DF4
	ldrh r0, [r0]
	cmp r0, #1
	beq _081A8E18
	cmp r0, #1
	bgt _081A8DF8
	cmp r0, #0
	beq _081A8E02
	b _081A8EA6
	.align 2, 0
_081A8DEC: .4byte 0x03005AF0
_081A8DF0: .4byte 0x00000CA9
_081A8DF4: .4byte 0x02037282
_081A8DF8:
	cmp r0, #2
	beq _081A8E30
	cmp r0, #7
	beq _081A8E9C
	b _081A8EA6
_081A8E02:
	ldr r0, _081A8E10
	ldrh r1, [r0]
	ldr r3, _081A8E14
	adds r0, r2, r3
	strh r1, [r0]
	b _081A8EA6
	.align 2, 0
_081A8E10: .4byte 0x02037284
_081A8E14: .4byte 0x00000E18
_081A8E18:
	lsls r1, r1, #1
	ldr r3, _081A8E28
	adds r0, r2, r3
	adds r0, r0, r1
	ldr r1, _081A8E2C
	ldrh r1, [r1]
	strh r1, [r0]
	b _081A8EA6
	.align 2, 0
_081A8E28: .4byte 0x00000E1A
_081A8E2C: .4byte 0x02037284
_081A8E30:
	cmp r1, #0
	beq _081A8E64
	ldr r0, _081A8E48
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A8E50
	ldr r1, _081A8E4C
	adds r0, r2, r1
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #6
	b _081A8E76
	.align 2, 0
_081A8E48: .4byte 0x02037284
_081A8E4C: .4byte 0x00000CDC
_081A8E50:
	ldr r3, _081A8E5C
	adds r0, r2, r3
	ldr r1, [r0]
	ldr r2, _081A8E60
	b _081A8E8C
	.align 2, 0
_081A8E5C: .4byte 0x00000CDC
_081A8E60: .4byte 0xFFFFDFFF
_081A8E64:
	ldr r0, _081A8E7C
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A8E84
	ldr r1, _081A8E80
	adds r0, r2, r1
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #5
_081A8E76:
	orrs r1, r2
	str r1, [r0]
	b _081A8EA6
	.align 2, 0
_081A8E7C: .4byte 0x02037284
_081A8E80: .4byte 0x00000CDC
_081A8E84:
	ldr r3, _081A8E94
	adds r0, r2, r3
	ldr r1, [r0]
	ldr r2, _081A8E98
_081A8E8C:
	ands r1, r2
	str r1, [r0]
	b _081A8EA6
	.align 2, 0
_081A8E94: .4byte 0x00000CDC
_081A8E98: .4byte 0xFFFFEFFF
_081A8E9C:
	ldr r0, _081A8EAC
	ldrh r1, [r0]
	ldr r3, _081A8EB0
	adds r0, r2, r3
	strb r1, [r0]
_081A8EA6:
	pop {r0}
	bx r0
	.align 2, 0
_081A8EAC: .4byte 0x02037284
_081A8EB0: .4byte 0x00000E2A
	thumb_func_end SetBattlePyramidData

	thumb_func_start sub_081A8EB4
sub_081A8EB4: @ 0x081A8EB4
	push {r4, lr}
	ldr r4, _081A8EEC
	ldr r0, [r4]
	ldr r1, _081A8EF0
	ldrh r1, [r1]
	ldr r2, _081A8EF4
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _081A8EF8
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	bl save_serialize_map
	movs r0, #1
	bl TrySavingData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A8EEC: .4byte 0x03005AF0
_081A8EF0: .4byte 0x02037282
_081A8EF4: .4byte 0x00000CA8
_081A8EF8: .4byte 0x00000CA9
	thumb_func_end sub_081A8EB4

	thumb_func_start SetBattlePyramidRewardItem
SetBattlePyramidRewardItem: @ 0x081A8EFC
	push {r4, r5, lr}
	ldr r4, _081A8F38
	ldr r1, [r4]
	ldr r2, _081A8F3C
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1d
	ldr r2, _081A8F40
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x29
	bls _081A8F4C
	bl Random
	ldr r4, [r4]
	ldr r5, _081A8F44
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #9
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r1, _081A8F48
	adds r4, r4, r1
	b _081A8F6A
	.align 2, 0
_081A8F38: .4byte 0x03005AF0
_081A8F3C: .4byte 0x00000CA9
_081A8F40: .4byte 0x00000E1A
_081A8F44: .4byte 0x085DF76C
_081A8F48: .4byte 0x00000E18
_081A8F4C:
	bl Random
	ldr r4, [r4]
	ldr r5, _081A8F74
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r2, _081A8F78
	adds r4, r4, r2
_081A8F6A:
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A8F74: .4byte 0x085DF760
_081A8F78: .4byte 0x00000E18
	thumb_func_end SetBattlePyramidRewardItem

	thumb_func_start GiveBattlePyramidRewardItem
GiveBattlePyramidRewardItem: @ 0x081A8F7C
	push {r4, r5, lr}
	ldr r4, _081A8FB4
	ldr r0, [r4]
	ldr r1, _081A8FB8
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _081A8FC4
	ldr r0, [r4]
	ldr r1, _081A8FB8
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _081A8FBC
	bl CopyItemName
	ldr r0, [r4]
	ldr r1, _081A8FB8
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081A8FC0
	strh r5, [r0]
	b _081A8FCA
	.align 2, 0
_081A8FB4: .4byte 0x03005AF0
_081A8FB8: .4byte 0x00000E18
_081A8FBC: .4byte 0x02021C40
_081A8FC0: .4byte 0x02037290
_081A8FC4:
	ldr r1, _081A8FD0
	movs r0, #0
	strh r0, [r1]
_081A8FCA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A8FD0: .4byte 0x02037290
	thumb_func_end GiveBattlePyramidRewardItem

	thumb_func_start SeedPyramidFloor
SeedPyramidFloor: @ 0x081A8FD4
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _081A9004
_081A8FDA:
	bl Random
	ldr r1, [r5]
	lsls r2, r4, #1
	ldr r3, _081A9008
	adds r1, r1, r3
	adds r1, r1, r2
	strh r0, [r1]
	adds r4, #1
	cmp r4, #3
	ble _081A8FDA
	ldr r0, _081A9004
	ldr r0, [r0]
	ldr r1, _081A900C
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A9004: .4byte 0x03005AF0
_081A9008: .4byte 0x00000E22
_081A900C: .4byte 0x00000E2A
	thumb_func_end SeedPyramidFloor

	thumb_func_start SetPickupItem
SetPickupItem: @ 0x081A9010
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r5, _081A90E0
	ldr r1, [r5]
	ldr r2, _081A90E4
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	mov sl, r0
	adds r2, #9
	adds r0, r1, r2
	ldrh r0, [r0]
	str r0, [sp]
	mov r2, sl
	lsls r0, r2, #1
	ldr r2, _081A90E8
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0x13
	bls _081A9054
	movs r0, #0x13
	mov r8, r0
_081A9054:
	bl GetPyramidFloorTemplateId
	lsls r0, r0, #0x18
	ldr r1, _081A90EC
	ldrh r4, [r1]
	ldr r1, _081A90F0
	lsrs r0, r0, #0x14
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	subs r4, r4, r0
	subs r7, r4, #1
	ldr r1, [r5]
	lsrs r0, r7, #0x1f
	adds r0, r7, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	ldr r2, _081A90F4
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl SeedRng2
	movs r5, #0
	mov r0, r8
	lsls r0, r0, #2
	mov sb, r0
	cmp r5, r4
	bge _081A90A8
_081A908E:
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r5, #1
	adds r0, r7, #1
	cmp r5, r0
	blt _081A908E
_081A90A8:
	ldr r0, _081A90F8
	ldr r1, [sp]
	adds r0, r1, r0
	ldrb r5, [r0]
	ldr r1, _081A90FC
	ldr r3, _081A9100
	ldr r4, _081A9104
	cmp r5, #0x3e
	bhi _081A90D4
	lsls r2, r5, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r6, r0
	blt _081A90D4
	adds r0, r2, r1
_081A90C6:
	adds r0, #2
	adds r5, #1
	cmp r5, #0x3e
	bhi _081A90D4
	ldrb r2, [r0]
	cmp r6, r2
	bge _081A90C6
_081A90D4:
	mov r0, sl
	cmp r0, #0
	beq _081A910C
	ldr r2, _081A9108
	b _081A910E
	.align 2, 0
_081A90E0: .4byte 0x03005AF0
_081A90E4: .4byte 0x00000CA9
_081A90E8: .4byte 0x00000E1A
_081A90EC: .4byte 0x02037292
_081A90F0: .4byte 0x085DEE88
_081A90F4: .4byte 0x00000E22
_081A90F8: .4byte 0x085DF372
_081A90FC: .4byte 0x085DF2F4
_081A9100: .4byte 0x02037278
_081A9104: .4byte 0x0203727A
_081A9108: .4byte 0x085DF164
_081A910C:
	ldr r2, _081A913C
_081A910E:
	lsls r0, r5, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	mov r1, sb
	add r1, r8
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	movs r0, #1
	strh r0, [r4]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A913C: .4byte 0x085DEFD4
	thumb_func_end SetPickupItem

	thumb_func_start HidePyramidItem
HidePyramidItem: @ 0x081A9140
	push {r4, r5, lr}
	ldr r0, _081A9154
	ldr r0, [r0]
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0
	ldr r4, _081A9158
	b _081A916C
	.align 2, 0
_081A9154: .4byte 0x03005AEC
_081A9158: .4byte 0x02037292
_081A915C:
	adds r2, #1
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _081A9182
_081A916C:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r3
	ldrb r0, [r1]
	ldrh r5, [r4]
	cmp r0, r5
	bne _081A915C
	ldr r0, _081A9188
	strh r0, [r1, #4]
	strh r0, [r1, #6]
_081A9182:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A9188: .4byte 0x00007FFF
	thumb_func_end HidePyramidItem

	thumb_func_start InitPyramidFacilityTrainers
InitPyramidFacilityTrainers: @ 0x081A918C
	ldr r1, _081A9194
	ldr r0, _081A9198
	str r0, [r1]
	bx lr
	.align 2, 0
_081A9194: .4byte 0x0203B954
_081A9198: .4byte 0x085B4A10
	thumb_func_end InitPyramidFacilityTrainers

	thumb_func_start ShowPostBattleHintText
ShowPostBattleHintText: @ 0x081A919C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #0
	mov sb, r0
	movs r7, #0
	ldr r0, _081A91EC
	ldr r0, [r0]
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _081A91F0
	ldr r0, _081A91F4
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	bl LocalIdToPyramidTrainerId
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r6, #0
	ldr r2, _081A91F8
	ldr r0, _081A91FC
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r5, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081A9200
	ldrb r2, [r2, #1]
	mov sb, r2
	b _081A9226
	.align 2, 0
_081A91EC: .4byte 0x03005AEC
_081A91F0: .4byte 0x02036FF0
_081A91F4: .4byte 0x03005B50
_081A91F8: .4byte 0x085DF454
_081A91FC: .4byte 0x0203B954
_081A9200:
	adds r6, #1
	cmp r6, #0x31
	bhi _081A9226
	ldr r4, _081A925C
	lsls r3, r6, #1
	adds r2, r3, r4
	ldr r0, _081A9260
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r5, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081A9200
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	mov sb, r0
_081A9226:
	ldr r3, _081A9264
	ldr r2, _081A9268
	ldr r0, _081A926C
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	subs r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	str r0, [sp]
	movs r6, #0
	mov r3, sb
	lsls r3, r3, #2
	mov sb, r3
_081A9248:
	ldr r0, [sp]
	cmp r0, #8
	bls _081A9250
	b _081A9360
_081A9250:
	lsls r0, r0, #2
	ldr r1, _081A9270
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A925C: .4byte 0x085DF454
_081A9260: .4byte 0x0203B954
_081A9264: .4byte 0x085DF710
_081A9268: .4byte 0x02036FF0
_081A926C: .4byte 0x03005B50
_081A9270: .4byte 0x081A9274
_081A9274: @ jump table
	.4byte _081A9298 @ case 0
	.4byte _081A92A8 @ case 1
	.4byte _081A92EA @ case 2
	.4byte _081A932C @ case 3
	.4byte _081A9332 @ case 4
	.4byte _081A9338 @ case 5
	.4byte _081A933E @ case 6
	.4byte _081A934A @ case 7
	.4byte _081A9356 @ case 8
_081A9298:
	mov r0, sp
	movs r1, #8
	movs r2, #0
	bl GetPostBattleDirectionHintTextIndex
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _081A9366
_081A92A8:
	movs r6, #0
	ldr r2, _081A92B4
	mov r4, r8
	adds r4, #4
	mov r5, r8
	b _081A92D8
	.align 2, 0
_081A92B4: .4byte 0x7FFF0000
_081A92B8:
	ldrb r0, [r5, #1]
	cmp r0, #0x3b
	bne _081A92D2
	movs r1, #0
	ldrsh r0, [r4, r1]
	asrs r1, r2, #0x10
	cmp r0, r1
	beq _081A92D2
	movs r3, #2
	ldrsh r0, [r4, r3]
	cmp r0, r1
	beq _081A92D2
	adds r7, #1
_081A92D2:
	adds r4, #0x18
	adds r5, #0x18
	adds r6, #1
_081A92D8:
	str r2, [sp, #4]
	bl GetNumBattlePyramidEventObjects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #4]
	cmp r6, r0
	blt _081A92B8
	b _081A9366
_081A92EA:
	bl GetPyramidFloorTemplateId
	lsls r0, r0, #0x18
	ldr r1, _081A931C
	lsrs r0, r0, #0x14
	adds r0, r0, r1
	ldrb r7, [r0, #1]
	ldr r0, _081A9320
	ldr r0, [r0]
	ldr r1, _081A9324
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r1, _081A9328
	movs r6, #7
_081A9306:
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _081A9310
	subs r7, #1
_081A9310:
	adds r1, #4
	subs r6, #1
	cmp r6, #0
	bge _081A9306
	b _081A9366
	.align 2, 0
_081A931C: .4byte 0x085DEE88
_081A9320: .4byte 0x03005AF0
_081A9324: .4byte 0x00000E2A
_081A9328: .4byte 0x082FACB4
_081A932C:
	mov r0, sp
	movs r1, #8
	b _081A934E
_081A9332:
	mov r0, sp
	movs r1, #8
	b _081A9342
_081A9338:
	mov r0, sp
	movs r1, #0x10
	b _081A934E
_081A933E:
	mov r0, sp
	movs r1, #0x10
_081A9342:
	movs r2, #1
	bl GetPostBattleDirectionHintTextIndex
	b _081A9360
_081A934A:
	mov r0, sp
	movs r1, #0x18
_081A934E:
	movs r2, #2
	bl GetPostBattleDirectionHintTextIndex
	b _081A9360
_081A9356:
	mov r0, sp
	movs r1, #0x18
	movs r2, #1
	bl GetPostBattleDirectionHintTextIndex
_081A9360:
	cmp r6, #0
	bne _081A9366
	b _081A9248
_081A9366:
	ldr r1, _081A938C
	add r1, sb
	ldr r0, [sp]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A938C: .4byte 0x085DF6F8
	thumb_func_end ShowPostBattleHintText

	thumb_func_start UpdatePyramidWinStreak
UpdatePyramidWinStreak: @ 0x081A9390
	push {r4, r5, lr}
	ldr r5, _081A93D0
	ldr r1, [r5]
	ldr r2, _081A93D4
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r2, r0, #0x1d
	ldr r4, _081A93D8
	adds r1, r1, r4
	adds r1, r1, r2
	ldrh r3, [r1]
	ldr r0, _081A93DC
	cmp r3, r0
	bhi _081A93B2
	adds r0, r3, #1
	strh r0, [r1]
_081A93B2:
	ldr r0, [r5]
	adds r1, r0, r4
	adds r1, r1, r2
	ldr r3, _081A93E0
	adds r0, r0, r3
	adds r0, r0, r2
	ldrh r1, [r1]
	ldrh r2, [r0]
	cmp r1, r2
	bls _081A93C8
	strh r1, [r0]
_081A93C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A93D0: .4byte 0x03005AF0
_081A93D4: .4byte 0x00000CA9
_081A93D8: .4byte 0x00000E1A
_081A93DC: .4byte 0x000003E6
_081A93E0: .4byte 0x00000E1E
	thumb_func_end UpdatePyramidWinStreak

	thumb_func_start GetInBattlePyramid
GetInBattlePyramid: @ 0x081A93E4
	push {r4, lr}
	ldr r4, _081A93F8
	bl InBattlePyramid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A93F8: .4byte 0x02037290
	thumb_func_end GetInBattlePyramid

	thumb_func_start UpdatePyramidLightRadius
UpdatePyramidLightRadius: @ 0x081A93FC
	push {r4, lr}
	ldr r0, _081A940C
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A9410
	cmp r0, #1
	beq _081A942C
	b _081A94CC
	.align 2, 0
_081A940C: .4byte 0x02037284
_081A9410:
	ldr r0, _081A9420
	ldr r0, [r0]
	ldr r1, _081A9424
	ldrh r1, [r1]
	ldr r2, _081A9428
	adds r0, r0, r2
	strb r1, [r0]
	b _081A94CC
	.align 2, 0
_081A9420: .4byte 0x03005AF0
_081A9424: .4byte 0x02037282
_081A9428: .4byte 0x00000E68
_081A942C:
	ldr r4, _081A945C
	ldrh r0, [r4]
	cmp r0, #1
	beq _081A9488
	cmp r0, #1
	bgt _081A94CC
	cmp r0, #0
	bne _081A94CC
	ldr r0, _081A9460
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081A94CC
	ldr r0, _081A9464
	ldr r0, [r0]
	ldr r2, _081A9468
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0x77
	bls _081A946C
	movs r0, #0x78
	strb r0, [r1]
	b _081A9474
	.align 2, 0
_081A945C: .4byte 0x02037290
_081A9460: .4byte 0x02037C74
_081A9464: .4byte 0x03005AF0
_081A9468: .4byte 0x00000E68
_081A946C:
	ldr r0, _081A9480
	ldrh r0, [r0]
	bl PlaySE
_081A9474:
	ldr r1, _081A9484
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _081A94CC
	.align 2, 0
_081A9480: .4byte 0x02037286
_081A9484: .4byte 0x02037290
_081A9488:
	ldr r1, _081A94BC
	ldrh r0, [r1]
	cmp r0, #0
	beq _081A94C8
	subs r0, #1
	strh r0, [r1]
	ldr r3, _081A94C0
	ldr r1, [r3]
	ldr r2, _081A94C4
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r3]
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0x78
	bls _081A94B6
	movs r0, #0x78
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_081A94B6:
	bl WriteBattlePyramidViewScanlineEffectBuffer
	b _081A94CC
	.align 2, 0
_081A94BC: .4byte 0x02037282
_081A94C0: .4byte 0x03005AF0
_081A94C4: .4byte 0x00000E68
_081A94C8:
	movs r0, #2
	strh r0, [r4]
_081A94CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdatePyramidLightRadius

	thumb_func_start ClearPyramidPartyHeldItems
ClearPyramidPartyHeldItems: @ 0x081A94D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	movs r5, #0
	movs r0, #0x64
	mov sb, r0
	ldr r1, _081A9534
	mov r8, r1
_081A94EE:
	movs r4, #0
	adds r7, r5, #1
	mov r6, sb
	muls r6, r5, r6
_081A94F6:
	ldr r0, _081A9538
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A953C
	adds r0, r0, r2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	beq _081A951A
	subs r0, #1
	cmp r0, r5
	bne _081A951A
	mov r1, r8
	adds r0, r6, r1
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
_081A951A:
	adds r4, #1
	cmp r4, #3
	ble _081A94F6
	adds r5, r7, #0
	cmp r5, #5
	ble _081A94EE
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A9534: .4byte 0x02024190
_081A9538: .4byte 0x03005AF0
_081A953C: .4byte 0x00000CAA
	thumb_func_end ClearPyramidPartyHeldItems

	thumb_func_start SetPyramidFloorPalette
SetPyramidFloorPalette: @ 0x081A9540
	push {lr}
	ldr r0, _081A9550
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081A9550: .4byte 0x081A9555
	thumb_func_end SetPyramidFloorPalette

	thumb_func_start Task_SetPyramidFloorPalette
Task_SetPyramidFloorPalette: @ 0x081A9554
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081A958C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081A9584
	ldr r0, _081A9590
	ldr r0, [r0]
	ldr r1, _081A9594
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _081A9598
	adds r0, r0, r1
	ldr r1, _081A959C
	movs r2, #0x10
	bl CpuSet
	adds r0, r4, #0
	bl DestroyTask
_081A9584:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A958C: .4byte 0x02037C74
_081A9590: .4byte 0x03005AF0
_081A9594: .4byte 0x00000CB2
_081A9598: .4byte 0x08D856AC
_081A959C: .4byte 0x02037474
	thumb_func_end Task_SetPyramidFloorPalette

	thumb_func_start sub_081A95A0
sub_081A95A0: @ 0x081A95A0
	push {lr}
	bl sub_0809F6AC
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081A95A0

	thumb_func_start RestorePyramidPlayerParty
RestorePyramidPlayerParty: @ 0x081A95AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r0, #0
	str r0, [sp]
_081A95BC:
	ldr r0, _081A962C
	ldr r0, [r0]
	ldr r2, [sp]
	lsls r1, r2, #1
	ldr r5, _081A9630
	adds r0, r0, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r5, r0, #1
	movs r0, #0
	str r0, [sp, #4]
	movs r2, #0x64
	adds r1, r5, #0
	muls r1, r2, r1
	str r1, [sp, #8]
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r6, r1, r0
	movs r1, #0
	str r1, [sp, #0x10]
_081A95E4:
	ldr r2, _081A9634
	ldr r0, [r2]
	adds r0, r0, r6
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	ldr r3, _081A9638
	ldr r1, [sp, #0x10]
	adds r0, r1, r3
	movs r1, #0xb
	movs r2, #0
	str r3, [sp, #0x14]
	bl GetMonData
	ldr r3, [sp, #0x14]
	cmp r4, r0
	bne _081A96B4
	movs r6, #0
	adds r2, r5, #1
	str r2, [sp, #0xc]
	movs r1, #0x64
	adds r0, r5, #0
	muls r0, r1, r0
	movs r5, #0x8e
	lsls r5, r5, #2
	adds r5, r5, r0
	mov sb, r5
	ldr r7, [sp, #4]
	muls r7, r1, r7
	mov sl, r3
_081A9624:
	movs r5, #0
	adds r0, r6, #1
	mov r8, r0
	b _081A963E
	.align 2, 0
_081A962C: .4byte 0x03005AF0
_081A9630: .4byte 0x00000CAA
_081A9634: .4byte 0x03005AEC
_081A9638: .4byte 0x02024190
_081A963C:
	adds r5, #1
_081A963E:
	cmp r5, #3
	bgt _081A9666
	ldr r1, _081A96A8
	ldr r0, [r1]
	add r0, sb
	adds r1, r5, #0
	adds r1, #0xd
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	adds r1, r6, #0
	adds r1, #0xd
	mov r2, sl
	adds r0, r7, r2
	movs r2, #0
	bl GetMonData
	cmp r4, r0
	bne _081A963C
_081A9666:
	cmp r5, #4
	bne _081A9678
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	mov r5, sl
	adds r0, r7, r5
	movs r1, #0xa6
	bl SetMonMoveSlot
_081A9678:
	mov r6, r8
	cmp r6, #3
	ble _081A9624
	ldr r1, _081A96A8
	ldr r0, [r1]
	ldr r2, [sp, #8]
	adds r0, r0, r2
	movs r5, #0x8e
	lsls r5, r5, #2
	adds r0, r0, r5
	ldr r1, _081A96AC
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	movs r2, #0x64
	bl memcpy
	ldr r0, _081A96B0
	ldr r5, [sp, #4]
	adds r0, r5, r0
	mov r1, sp
	ldrb r1, [r1, #0xc]
	strb r1, [r0]
	b _081A96C4
	.align 2, 0
_081A96A8: .4byte 0x03005AEC
_081A96AC: .4byte 0x02024190
_081A96B0: .4byte 0x0203CBC4
_081A96B4:
	ldr r2, [sp, #0x10]
	adds r2, #0x64
	str r2, [sp, #0x10]
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
	cmp r0, #2
	ble _081A95E4
_081A96C4:
	ldr r1, [sp]
	adds r1, #1
	str r1, [sp]
	cmp r1, #2
	bgt _081A96D0
	b _081A95BC
_081A96D0:
	movs r2, #0
	str r2, [sp]
	ldr r4, _081A9704
	ldr r3, _081A9708
	ldr r2, _081A970C
_081A96DA:
	ldr r1, [r4]
	ldr r5, [sp]
	lsls r0, r5, #1
	adds r1, r1, r3
	adds r1, r1, r0
	adds r0, r5, r2
	ldrb r0, [r0]
	strh r0, [r1]
	adds r5, #1
	str r5, [sp]
	cmp r5, #2
	ble _081A96DA
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A9704: .4byte 0x03005AF0
_081A9708: .4byte 0x00000CAA
_081A970C: .4byte 0x0203CBC4
	thumb_func_end RestorePyramidPlayerParty

	thumb_func_start GetPostBattleDirectionHintTextIndex
GetPostBattleDirectionHintTextIndex: @ 0x081A9710
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r4, #0
	ldr r0, _081A9798
	ldr r5, [r0, #8]
	ldr r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #0xe
	adds r5, r5, r0
	movs r3, #0
	ldr r0, _081A979C
	mov r8, r0
	ldr r1, _081A97A0
	mov ip, r1
	ldr r0, _081A97A4
	mov sb, r0
_081A9744:
	movs r2, #0
_081A9746:
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	mov r0, r8
	ands r0, r1
	cmp r0, ip
	bne _081A9802
	adds r2, #7
	ldr r0, _081A97A8
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	movs r5, #0xc
	ldrsh r1, [r0, r5]
	subs r2, r2, r1
	adds r1, r3, #7
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	subs r3, r1, r0
	cmp r2, r6
	bge _081A9786
	rsbs r0, r6, #0
	cmp r2, r0
	ble _081A9786
	cmp r3, r6
	bge _081A9786
	cmp r3, r0
	ble _081A9786
	cmp r7, #0
	bne _081A97FC
_081A9786:
	cmp r2, #0
	ble _081A97AC
	cmp r3, #0
	ble _081A97AC
	movs r4, #3
	cmp r2, r3
	blt _081A97F4
	movs r4, #2
	b _081A97F4
	.align 2, 0
_081A9798: .4byte 0x03005B20
_081A979C: .4byte 0x000003FF
_081A97A0: .4byte 0x0000028E
_081A97A4: .4byte 0x02036FF0
_081A97A8: .4byte 0x03005B50
_081A97AC:
	cmp r2, #0
	bge _081A97BE
	cmp r3, #0
	bge _081A97BE
	movs r4, #1
	cmp r2, r3
	ble _081A97F4
	movs r4, #0
	b _081A97F4
_081A97BE:
	cmp r2, #0
	bne _081A97CC
	movs r4, #0
	cmp r3, #0
	ble _081A97F4
	movs r4, #3
	b _081A97F4
_081A97CC:
	cmp r3, #0
	bne _081A97DA
	movs r4, #1
	cmp r2, #0
	ble _081A97F4
	movs r4, #2
	b _081A97F4
_081A97DA:
	cmp r2, #0
	bge _081A97EA
	adds r0, r2, r3
	movs r4, #1
	cmp r0, #0
	ble _081A97F4
	movs r4, #3
	b _081A97F4
_081A97EA:
	adds r0, r2, r3
	mvns r0, r0
	asrs r4, r0, #0x1f
	movs r0, #2
	ands r4, r0
_081A97F4:
	movs r0, #0
	mov r5, sl
	str r0, [r5]
	b _081A9810
_081A97FC:
	mov r0, sl
	str r7, [r0]
	b _081A9810
_081A9802:
	adds r2, #1
	cmp r2, #0x1f
	ble _081A9746
	adds r5, #0x5e
	adds r3, #1
	cmp r3, #0x1f
	ble _081A9744
_081A9810:
	adds r0, r4, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetPostBattleDirectionHintTextIndex

	thumb_func_start LocalIdToPyramidTrainerId
LocalIdToPyramidTrainerId: @ 0x081A9820
	lsls r0, r0, #0x18
	ldr r1, _081A9834
	ldr r1, [r1]
	lsrs r0, r0, #0x17
	adds r1, r1, r0
	ldr r0, _081A9838
	adds r1, r1, r0
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_081A9834: .4byte 0x03005AF0
_081A9838: .4byte 0x00000CB2
	thumb_func_end LocalIdToPyramidTrainerId

	thumb_func_start GetBattlePyramidTrainerFlag
GetBattlePyramidTrainerFlag: @ 0x081A983C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081A986C
	ldr r2, [r1]
	ldr r1, _081A9870
	adds r2, r2, r1
	ldr r4, _081A9874
	ldr r3, _081A9878
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r1, #8]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldrb r1, [r2]
	ands r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081A986C: .4byte 0x03005AF0
_081A9870: .4byte 0x00000E2A
_081A9874: .4byte 0x082FACB4
_081A9878: .4byte 0x02036FF0
	thumb_func_end GetBattlePyramidTrainerFlag

	thumb_func_start MarkApproachingPyramidTrainersAsBattled
MarkApproachingPyramidTrainersAsBattled: @ 0x081A987C
	push {lr}
	ldr r0, _081A98AC
	ldrh r0, [r0]
	bl MarkPyramidTrainerAsBattled
	ldr r0, _081A98B0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _081A98A6
	movs r0, #1
	bl GetChosenApproachingTrainerEventObjectId
	ldr r1, _081A98B4
	strb r0, [r1]
	ldr r0, _081A98B8
	ldrh r0, [r0]
	bl MarkPyramidTrainerAsBattled
_081A98A6:
	pop {r0}
	bx r0
	.align 2, 0
_081A98AC: .4byte 0x0203886A
_081A98B0: .4byte 0x02022C90
_081A98B4: .4byte 0x03005B50
_081A98B8: .4byte 0x0203886C
	thumb_func_end MarkApproachingPyramidTrainersAsBattled

	thumb_func_start MarkPyramidTrainerAsBattled
MarkPyramidTrainerAsBattled: @ 0x081A98BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r3, #0
	ldr r0, _081A9958
	mov ip, r0
	ldr r6, _081A995C
	ldr r1, _081A9960
	mov sl, r1
	ldr r7, _081A9964
	mov sb, r7
	ldr r0, _081A9968
	mov r8, r0
	ldr r4, _081A996C
_081A98E0:
	mov r1, sb
	ldr r2, [r1]
	lsls r0, r3, #1
	mov r7, r8
	adds r1, r2, r7
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, r5
	bne _081A98FE
	ldr r1, _081A9970
	adds r0, r2, r1
	ldr r1, [r4]
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_081A98FE:
	adds r4, #4
	adds r3, #1
	cmp r3, #7
	ble _081A98E0
	ldrb r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	movs r3, #2
	strb r3, [r0, #6]
	mov r7, sl
	ldr r2, [r7]
	ldr r0, _081A9974
	ldrh r1, [r0]
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r1, _081A9978
	adds r2, r2, r1
	strb r3, [r2]
	ldrb r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	ldrh r1, [r0, #0x10]
	strh r1, [r0, #0xc]
	ldrb r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	ldrh r1, [r0, #0x12]
	strh r1, [r0, #0xe]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A9958: .4byte 0x02036FF0
_081A995C: .4byte 0x03005B50
_081A9960: .4byte 0x03005AEC
_081A9964: .4byte 0x03005AF0
_081A9968: .4byte 0x00000CB4
_081A996C: .4byte 0x082FACB4
_081A9970: .4byte 0x00000E2A
_081A9974: .4byte 0x02037292
_081A9978: .4byte 0x00000C79
	thumb_func_end MarkPyramidTrainerAsBattled

	thumb_func_start GenerateBattlePyramidWildMon
GenerateBattlePyramidWildMon: @ 0x081A997C
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r0, _081A99BC
	ldr r1, [r0]
	ldr r2, _081A99C0
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	lsls r0, r5, #1
	ldr r2, _081A99C4
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bls _081A99B2
	movs r0, #0x13
_081A99B2:
	cmp r5, #0
	beq _081A99CC
	ldr r1, _081A99C8
	b _081A99CE
	.align 2, 0
_081A99BC: .4byte 0x03005AF0
_081A99C0: .4byte 0x00000CA9
_081A99C4: .4byte 0x00000E1A
_081A99C8: .4byte 0x085DEE38
_081A99CC:
	ldr r1, _081A9A44
_081A99CE:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r4, _081A9A48
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	subs r0, #1
	str r0, [sp, #0x10]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r6, r2
	adds r0, r4, #0
	movs r1, #0xb
	bl SetMonData
	ldr r1, [sp, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r0]
	mov r0, sp
	bl GetSpeciesName
	adds r0, r4, #0
	movs r1, #2
	mov r2, sp
	bl SetMonData
	cmp r5, #0
	beq _081A9A4C
	bl SetFacilityPtrsGetLevel
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, [sp, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #2]
	subs r5, r5, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xb
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r0, #5
	adds r5, r5, r0
	b _081A9A6E
	.align 2, 0
_081A9A44: .4byte 0x085DE668
_081A9A48: .4byte 0x020243E8
_081A9A4C:
	bl Random
	ldr r2, [sp, #0x10]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r4, [r1, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xb
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r0, #5
	adds r5, r4, r0
_081A9A6E:
	ldr r4, _081A9AB8
	ldr r2, _081A9ABC
	ldr r1, [sp, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	adds r2, r1, #0
	muls r2, r0, r2
	lsls r0, r5, #2
	ldr r1, _081A9AC0
	adds r0, r0, r1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x19
	bl SetMonData
	ldr r1, [sp, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0, #3]
	cmp r1, #0
	blt _081A9AC4
	cmp r1, #1
	bgt _081A9AC4
	adds r2, r0, #3
	b _081A9AF4
	.align 2, 0
_081A9AB8: .4byte 0x020243E8
_081A9ABC: .4byte 0x082F0D54
_081A9AC0: .4byte 0x082F00B4
_081A9AC4:
	ldr r2, _081A9B00
	ldr r1, [sp, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x17]
	cmp r0, #0
	beq _081A9B08
	ldr r4, _081A9B04
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	movs r1, #1
	ands r1, r0
	str r1, [sp, #0xc]
	add r2, sp, #0xc
_081A9AF4:
	adds r0, r4, #0
	movs r1, #0x2e
	bl SetMonData
	b _081A9B14
	.align 2, 0
_081A9B00: .4byte 0x082F0D54
_081A9B04: .4byte 0x020243E8
_081A9B08:
	str r0, [sp, #0xc]
	ldr r0, _081A9B94
	add r2, sp, #0xc
	movs r1, #0x2e
	bl SetMonData
_081A9B14:
	movs r0, #0
	str r0, [sp, #0xc]
	movs r2, #0
	lsls r4, r5, #1
_081A9B1C:
	ldr r1, [sp, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	lsls r1, r2, #1
	adds r0, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _081A9B94
	bl SetMonMoveSlot
	ldr r0, [sp, #0xc]
	adds r0, #1
	str r0, [sp, #0xc]
	adds r2, r0, #0
	cmp r2, #3
	ble _081A9B1C
	ldr r0, _081A9B98
	ldr r0, [r0]
	ldr r1, _081A9B9C
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x8b
	bls _081A9B84
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x11
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
_081A9B6E:
	adds r1, r0, #0
	adds r1, #0x27
	ldr r0, _081A9B94
	add r2, sp, #0x10
	bl SetMonData
	ldr r0, [sp, #0xc]
	adds r0, #1
	str r0, [sp, #0xc]
	cmp r0, #5
	ble _081A9B6E
_081A9B84:
	ldr r0, _081A9B94
	bl CalculateMonStats
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A9B94: .4byte 0x020243E8
_081A9B98: .4byte 0x03005AF0
_081A9B9C: .4byte 0x00000E1A
	thumb_func_end GenerateBattlePyramidWildMon

	thumb_func_start GetPyramidRunMultiplier
GetPyramidRunMultiplier: @ 0x081A9BA0
	push {lr}
	bl GetPyramidFloorTemplateId
	lsls r0, r0, #0x18
	ldr r1, _081A9BB4
	lsrs r0, r0, #0x14
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	pop {r1}
	bx r1
	.align 2, 0
_081A9BB4: .4byte 0x085DEE88
	thumb_func_end GetPyramidRunMultiplier

	thumb_func_start InBattlePyramid
InBattlePyramid: @ 0x081A9BB8
	push {lr}
	ldr r0, _081A9BC8
	ldrh r1, [r0, #0x12]
	ldr r0, _081A9BCC
	cmp r1, r0
	bne _081A9BD0
	movs r0, #1
	b _081A9BDE
	.align 2, 0
_081A9BC8: .4byte 0x02036FB8
_081A9BCC: .4byte 0x00000169
_081A9BD0:
	movs r0, #0xbd
	lsls r0, r0, #1
	cmp r1, r0
	beq _081A9BDC
	movs r0, #0
	b _081A9BDE
_081A9BDC:
	movs r0, #2
_081A9BDE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end InBattlePyramid

	thumb_func_start InBattlePyramid_
InBattlePyramid_: @ 0x081A9BE4
	push {lr}
	movs r2, #0
	ldr r0, _081A9C00
	ldrh r1, [r0, #0x12]
	ldr r0, _081A9C04
	cmp r1, r0
	beq _081A9BF8
	adds r0, #0x11
	cmp r1, r0
	bne _081A9BFA
_081A9BF8:
	movs r2, #1
_081A9BFA:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_081A9C00: .4byte 0x02036FB8
_081A9C04: .4byte 0x00000169
	thumb_func_end InBattlePyramid_

	thumb_func_start sub_081A9C08
sub_081A9C08: @ 0x081A9C08
	push {lr}
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A9C30
	bl RestorePyramidPlayerParty
	ldr r0, _081A9C34
	ldr r0, [r0]
	ldr r1, _081A9C38
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	ldr r0, _081A9C3C
	movs r1, #0
	bl VarSet
	bl LoadPlayerParty
_081A9C30:
	pop {r0}
	bx r0
	.align 2, 0
_081A9C34: .4byte 0x03005AF0
_081A9C38: .4byte 0x00000CA8
_081A9C3C: .4byte 0x0000400E
	thumb_func_end sub_081A9C08

	thumb_func_start SoftResetInBattlePyramid
SoftResetInBattlePyramid: @ 0x081A9C40
	push {lr}
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A9C50
	bl DoSoftReset
_081A9C50:
	pop {r0}
	bx r0
	thumb_func_end SoftResetInBattlePyramid

	thumb_func_start CopyPyramidTrainerSpeechBefore
CopyPyramidTrainerSpeechBefore: @ 0x081A9C54
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _081A9C70
	movs r1, #0x34
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0xc
	bl FrontierSpeechToString
	pop {r0}
	bx r0
	.align 2, 0
_081A9C70: .4byte 0x0203B954
	thumb_func_end CopyPyramidTrainerSpeechBefore

	thumb_func_start CopyPyramidTrainerWinSpeech
CopyPyramidTrainerWinSpeech: @ 0x081A9C74
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _081A9C90
	movs r1, #0x34
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0x18
	bl FrontierSpeechToString
	pop {r0}
	bx r0
	.align 2, 0
_081A9C90: .4byte 0x0203B954
	thumb_func_end CopyPyramidTrainerWinSpeech

	thumb_func_start CopyPyramidTrainerLoseSpeech
CopyPyramidTrainerLoseSpeech: @ 0x081A9C94
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _081A9CB0
	movs r1, #0x34
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0x24
	bl FrontierSpeechToString
	pop {r0}
	bx r0
	.align 2, 0
_081A9CB0: .4byte 0x0203B954
	thumb_func_end CopyPyramidTrainerLoseSpeech

	thumb_func_start GetBattlePyramindTrainerEncounterMusicId
GetBattlePyramindTrainerEncounterMusicId: @ 0x081A9CB4
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0
	ldr r3, _081A9CDC
	ldr r1, _081A9CE0
	ldr r2, [r1]
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	ldr r1, _081A9CE4
_081A9CD0:
	ldrb r0, [r1]
	cmp r0, r2
	bne _081A9CE8
	ldrb r0, [r1, #1]
	b _081A9CF2
	.align 2, 0
_081A9CDC: .4byte 0x082EFF52
_081A9CE0: .4byte 0x0203B954
_081A9CE4: .4byte 0x085DF37C
_081A9CE8:
	adds r1, #4
	adds r4, #1
	cmp r4, #0x35
	bls _081A9CD0
	movs r0, #0
_081A9CF2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBattlePyramindTrainerEncounterMusicId

	thumb_func_start sub_081A9CF8
sub_081A9CF8: @ 0x081A9CF8
	push {lr}
	ldr r0, _081A9D04
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_081A9D04: .4byte 0x0822D751
	thumb_func_end sub_081A9CF8

	thumb_func_start GetUniqueTrainerId
GetUniqueTrainerId: @ 0x081A9D08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081A9D84
	ldr r4, [r0]
	ldr r1, _081A9D88
	adds r0, r4, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1d
	ldr r2, _081A9D8C
	adds r0, r4, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _081A9D90
	adds r4, r4, r1
	ldrh r1, [r4]
	cmp r1, #7
	bne _081A9D98
	adds r0, #1
	lsls r7, r0, #0x18
	lsls r1, r1, #0x18
	mov r8, r1
_081A9D44:
	lsrs r0, r7, #0x18
	mov r2, r8
	lsrs r1, r2, #0x18
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	cmp r2, r5
	bge _081A9D7C
	ldr r1, _081A9D84
	ldr r0, [r1]
	ldr r4, _081A9D94
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, r3
	beq _081A9D7C
	adds r6, r1, #0
_081A9D68:
	adds r2, #1
	cmp r2, r5
	bge _081A9D7C
	ldr r0, [r6]
	lsls r1, r2, #1
	adds r0, r0, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _081A9D68
_081A9D7C:
	cmp r2, r5
	bne _081A9D44
	b _081A9DDA
	.align 2, 0
_081A9D84: .4byte 0x03005AF0
_081A9D88: .4byte 0x00000CA9
_081A9D8C: .4byte 0x00000E1A
_081A9D90: .4byte 0x00000CB2
_081A9D94: .4byte 0x00000CB4
_081A9D98:
	lsls r1, r1, #0x18
	mov r8, r1
	lsls r7, r0, #0x18
_081A9D9E:
	lsrs r0, r7, #0x18
	mov r2, r8
	lsrs r1, r2, #0x18
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	cmp r2, r5
	bge _081A9DD6
	ldr r1, _081A9DE8
	ldr r0, [r1]
	ldr r4, _081A9DEC
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, r3
	beq _081A9DD6
	adds r6, r1, #0
_081A9DC2:
	adds r2, #1
	cmp r2, r5
	bge _081A9DD6
	ldr r0, [r6]
	lsls r1, r2, #1
	adds r0, r0, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _081A9DC2
_081A9DD6:
	cmp r2, r5
	bne _081A9D9E
_081A9DDA:
	adds r0, r3, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081A9DE8: .4byte 0x03005AF0
_081A9DEC: .4byte 0x00000CB4
	thumb_func_end GetUniqueTrainerId

	thumb_func_start GenerateBattlePyramidFloorLayout
GenerateBattlePyramidFloorLayout: @ 0x081A9DF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	movs r0, #0x10
	bl AllocZeroed
	str r0, [sp, #0xc]
	bl GetPyramidFloorLayoutOffsets
	mov r4, sp
	adds r4, #1
	mov r0, sp
	adds r1, r4, #0
	bl GetPyramidEntranceAndExitSquareIds
	movs r7, #0
_081A9E1E:
	ldr r1, [sp, #0xc]
	adds r0, r1, r7
	ldrb r0, [r0]
	ldr r2, _081A9EF0
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _081A9EF4
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r2, [r6, #0xc]
	mov sl, r2
	ldr r0, [sp, #4]
	ldr r1, _081A9EF8
	str r0, [r1, #8]
	ldr r0, [r6]
	lsls r0, r0, #2
	adds r2, r0, #0
	adds r2, #0xf
	str r2, [r1]
	ldr r0, [r6, #4]
	lsls r0, r0, #2
	adds r0, #0xe
	str r0, [r1, #4]
	ldr r0, [sp, #4]
	mov sb, r0
	adds r1, r7, #0
	cmp r7, #0
	bge _081A9E58
	adds r1, r7, #3
_081A9E58:
	asrs r1, r1, #2
	ldr r4, [r6, #4]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, #7
	muls r2, r0, r2
	lsls r1, r1, #2
	subs r1, r7, r1
	ldr r3, [r6]
	adds r0, r1, #0
	muls r0, r3, r0
	adds r0, #7
	adds r2, r2, r0
	lsls r2, r2, #1
	add sb, r2
	movs r1, #0
	mov r8, r1
	adds r2, r7, #1
	str r2, [sp, #0x10]
	cmp r8, r4
	bge _081A9F2E
_081A9E82:
	movs r0, #0
	mov ip, r0
	mov r1, r8
	adds r1, #1
	str r1, [sp, #0x14]
	cmp ip, r3
	bge _081A9F1A
	ldr r2, _081A9EFC
	str r2, [sp, #0x18]
	mov r4, sb
	mov r5, sl
_081A9E98:
	ldrh r1, [r5]
	ldr r0, _081A9F00
	ands r0, r1
	ldr r2, _081A9F04
	cmp r0, r2
	bne _081A9F0C
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r7, r0
	beq _081A9F0C
	mov r0, sp
	ldrb r0, [r0]
	cmp r7, r0
	bne _081A9EDC
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _081A9EDC
	ldr r2, [sp, #0x18]
	ldr r3, [r2]
	adds r2, r7, #0
	cmp r7, #0
	bge _081A9EC6
	adds r2, r7, #3
_081A9EC6:
	asrs r2, r2, #2
	lsls r1, r2, #2
	subs r1, r7, r1
	ldr r0, [r6]
	muls r0, r1, r0
	add r0, ip
	strh r0, [r3]
	ldr r0, [r6, #4]
	muls r0, r2, r0
	add r0, r8
	strh r0, [r3, #2]
_081A9EDC:
	ldrh r0, [r5]
	movs r1, #0xfc
	lsls r1, r1, #8
	ands r1, r0
	ldr r2, _081A9F08
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r4]
	ldr r3, [r6]
	b _081A9F0E
	.align 2, 0
_081A9EF0: .4byte 0x00000169
_081A9EF4: .4byte 0x0845A1F4
_081A9EF8: .4byte 0x03005B20
_081A9EFC: .4byte 0x03005AEC
_081A9F00: .4byte 0x000003FF
_081A9F04: .4byte 0x0000028E
_081A9F08: .4byte 0x0000028D
_081A9F0C:
	strh r1, [r4]
_081A9F0E:
	adds r4, #2
	adds r5, #2
	movs r0, #1
	add ip, r0
	cmp ip, r3
	blt _081A9E98
_081A9F1A:
	lsls r0, r3, #3
	adds r0, #0x1e
	add sb, r0
	lsls r0, r3, #1
	add sl, r0
	ldr r1, [sp, #0x14]
	mov r8, r1
	ldr r0, [r6, #4]
	cmp r8, r0
	blt _081A9E82
_081A9F2E:
	ldr r7, [sp, #0x10]
	cmp r7, #0xf
	bgt _081A9F36
	b _081A9E1E
_081A9F36:
	bl RunOnLoadMapScript
	ldr r0, [sp, #0xc]
	bl Free
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end GenerateBattlePyramidFloorLayout

	thumb_func_start LoadBattlePyramidEventObjectTemplates
LoadBattlePyramidEventObjectTemplates: @ 0x081A9F50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r5, #0
	mov r6, sp
	adds r6, #1
	add r0, sp, #4
	mov r8, r0
	ldr r4, _081A9FB4
	ldr r3, _081A9FB8
	ldr r0, _081A9FBC
	adds r2, r0, #0
_081A9F6A:
	ldr r0, [r4]
	lsls r1, r5, #1
	adds r0, r0, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	orrs r1, r2
	strh r1, [r0]
	adds r5, #1
	cmp r5, #7
	ble _081A9F6A
	bl GetPyramidFloorTemplateId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r0, sp
	adds r1, r6, #0
	bl GetPyramidEntranceAndExitSquareIds
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _081A9FC0
	ldr r1, [r0]
	movs r0, #0xc7
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r2, _081A9FC4
	mov r0, r8
	bl CpuSet
	movs r5, #0
_081A9FA6:
	cmp r5, #0
	bne _081A9FCC
	ldr r1, _081A9FC8
	lsls r0, r7, #4
	adds r0, r0, r1
	ldrb r0, [r0, #3]
	b _081A9FD4
	.align 2, 0
_081A9FB4: .4byte 0x03005AF0
_081A9FB8: .4byte 0x00000CB4
_081A9FBC: .4byte 0x0000FFFF
_081A9FC0: .4byte 0x03005AEC
_081A9FC4: .4byte 0x05000180
_081A9FC8: .4byte 0x085DEE88
_081A9FCC:
	ldr r1, _081A9FE4
	lsls r0, r7, #4
	adds r0, r0, r1
	ldrb r0, [r0, #2]
_081A9FD4:
	cmp r0, #4
	bhi _081AA05C
	lsls r0, r0, #2
	ldr r1, _081A9FE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A9FE4: .4byte 0x085DEE88
_081A9FE8: .4byte 0x081A9FEC
_081A9FEC: @ jump table
	.4byte _081AA000 @ case 0
	.4byte _081AA00A @ case 1
	.4byte _081AA01A @ case 2
	.4byte _081AA028 @ case 3
	.4byte _081AA044 @ case 4
_081AA000:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl SetPyramidObjectPositionsUniformly
	b _081AA05C
_081AA00A:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	bl SetPyramidObjectPositionsInAndNearSquare
	b _081AA036
_081AA01A:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	ldrb r1, [r6]
	adds r0, r4, #0
	bl SetPyramidObjectPositionsInAndNearSquare
	b _081AA036
_081AA028:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	bl SetPyramidObjectPositionsNearSquare
_081AA036:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AA05C
	adds r0, r4, #0
	bl SetPyramidObjectPositionsUniformly
	b _081AA05C
_081AA044:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	ldrb r1, [r6]
	adds r0, r4, #0
	bl SetPyramidObjectPositionsNearSquare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AA05C
	adds r0, r4, #0
	bl SetPyramidObjectPositionsUniformly
_081AA05C:
	adds r5, #1
	cmp r5, #1
	ble _081A9FA6
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadBattlePyramidEventObjectTemplates

	thumb_func_start LoadBattlePyramidFloorEventObjectScripts
LoadBattlePyramidFloorEventObjectScripts: @ 0x081AA070
	push {r4, r5, lr}
	ldr r0, _081AA094
	ldr r0, [r0]
	ldr r5, _081AA098
	ldr r4, _081AA09C
	movs r2, #0xc8
	lsls r2, r2, #4
	adds r1, r0, r2
	movs r3, #0xc7
	lsls r3, r3, #4
	adds r2, r0, r3
	movs r3, #0x3f
_081AA088:
	ldrb r0, [r2, #1]
	cmp r0, #0x3b
	beq _081AA0A0
	str r5, [r1]
	b _081AA0A2
	.align 2, 0
_081AA094: .4byte 0x03005AEC
_081AA098: .4byte 0x0822D718
_081AA09C: .4byte 0x0822D733
_081AA0A0:
	str r4, [r1]
_081AA0A2:
	adds r1, #0x18
	adds r2, #0x18
	subs r3, #1
	cmp r3, #0
	bge _081AA088
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadBattlePyramidFloorEventObjectScripts

	thumb_func_start GetPyramidEntranceAndExitSquareIds
GetPyramidEntranceAndExitSquareIds: @ 0x081AA0B4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r5, _081AA104
	ldr r1, [r5]
	ldr r2, _081AA108
	adds r0, r1, r2
	ldrh r2, [r0]
	movs r3, #0xf
	ands r2, r3
	strb r2, [r4]
	ldr r7, _081AA10C
	adds r1, r1, r7
	ldrh r0, [r1]
	ands r0, r3
	strb r0, [r6]
	cmp r2, r0
	bne _081AA0FE
	ldr r1, [r5]
	ldr r2, _081AA108
	adds r0, r1, r2
	ldrh r2, [r0]
	adds r3, r2, #1
	adds r0, r3, #0
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r3, r0
	strb r0, [r4]
	adds r0, r1, r7
	ldrh r1, [r0]
	adds r2, r1, #0
	adds r2, #0xf
	adds r0, r2, #0
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r2, r0
	strb r0, [r6]
_081AA0FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AA104: .4byte 0x03005AF0
_081AA108: .4byte 0x00000E28
_081AA10C: .4byte 0x00000E22
	thumb_func_end GetPyramidEntranceAndExitSquareIds

	thumb_func_start SetPyramidObjectPositionsUniformly
SetPyramidObjectPositionsUniformly: @ 0x081AA110
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r5, #0
	bl GetPyramidFloorTemplateId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0x10
	bl AllocZeroed
	str r0, [sp, #8]
	bl GetPyramidFloorLayoutOffsets
	ldr r0, _081AA15C
	ldr r0, [r0]
	ldr r1, _081AA160
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r0, #0xf
	ands r4, r0
	ldr r0, [sp]
	cmp r0, #0
	bne _081AA168
	ldr r1, _081AA164
	lsls r0, r6, #4
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	mov sl, r0
	movs r1, #0
	str r1, [sp, #4]
	b _081AA176
	.align 2, 0
_081AA15C: .4byte 0x03005AF0
_081AA160: .4byte 0x00000E26
_081AA164: .4byte 0x085DEE88
_081AA168:
	ldr r1, _081AA188
	lsls r0, r6, #4
	adds r0, r0, r1
	ldrb r1, [r0]
	mov sl, r1
	ldrb r0, [r0, #1]
	str r0, [sp, #4]
_081AA176:
	movs r0, #0
	mov r8, r0
	cmp r8, sl
	bge _081AA238
_081AA17E:
	movs r1, #1
	add r1, r8
	mov sb, r1
	b _081AA1A6
	.align 2, 0
_081AA188: .4byte 0x085DEE88
_081AA18C:
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ldr r3, [sp, #4]
	add r3, r8
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl TrySetPyramidEventObjectPositionInSquare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AA22E
_081AA1A6:
	ldr r0, _081AA1D0
	mov ip, r0
	ldr r6, _081AA1D4
	ldr r7, _081AA1D8
	movs r3, #2
	lsls r0, r4, #2
	mov r1, ip
	adds r2, r0, r1
_081AA1B6:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _081AA1DC
	ldr r0, [r6]
	adds r0, r0, r7
	ldrh r1, [r0]
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _081AA1EC
	b _081AA1EA
	.align 2, 0
_081AA1D0: .4byte 0x082FACB4
_081AA1D4: .4byte 0x03005AF0
_081AA1D8: .4byte 0x00000E28
_081AA1DC:
	ldr r0, [r6]
	adds r0, r0, r7
	ldrh r1, [r0]
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _081AA1EC
_081AA1EA:
	orrs r5, r3
_081AA1EC:
	adds r2, #4
	adds r4, #1
	cmp r4, #0xf
	ble _081AA1F8
	mov r2, ip
	movs r4, #0
_081AA1F8:
	ldr r0, [r6]
	ldr r1, _081AA218
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0xf
	ands r1, r0
	cmp r4, r1
	bne _081AA21E
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _081AA21C
	movs r0, #6
	orrs r5, r0
	b _081AA21E
	.align 2, 0
_081AA218: .4byte 0x00000E26
_081AA21C:
	orrs r5, r1
_081AA21E:
	adds r0, r5, #0
	ands r0, r3
	cmp r0, #0
	beq _081AA1B6
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _081AA18C
_081AA22E:
	movs r0, #1
	ands r5, r0
	mov r8, sb
	cmp r8, sl
	blt _081AA17E
_081AA238:
	ldr r0, [sp, #8]
	bl Free
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetPyramidObjectPositionsUniformly

	thumb_func_start SetPyramidObjectPositionsInAndNearSquare
SetPyramidObjectPositionsInAndNearSquare: @ 0x081AA250
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	movs r6, #0
	movs r7, #0
	movs r0, #0
	str r0, [sp, #0xc]
	bl GetPyramidFloorTemplateId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x10
	bl AllocZeroed
	str r0, [sp, #0x14]
	bl GetPyramidFloorLayoutOffsets
	ldr r1, [sp]
	cmp r1, #0
	bne _081AA29C
	ldr r1, _081AA298
	lsls r0, r4, #4
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	str r0, [sp, #0x10]
	movs r0, #0
	b _081AA2A8
	.align 2, 0
_081AA298: .4byte 0x085DEE88
_081AA29C:
	ldr r1, _081AA2DC
	lsls r0, r4, #4
	adds r0, r0, r1
	ldrb r2, [r0]
	str r2, [sp, #0x10]
	ldrb r0, [r0, #1]
_081AA2A8:
	movs r3, #0
	str r3, [sp, #8]
	ldr r1, [sp, #0x10]
	asrs r1, r1, #0x1f
	str r1, [sp, #0x18]
	ldr r2, [sp, #0x10]
	cmp r3, r2
	bge _081AA39A
	str r0, [sp, #0x1c]
	adds r3, r0, #0
	lsls r3, r3, #0x18
	mov sb, r3
_081AA2C0:
	cmp r7, #0
	bne _081AA2E6
	mov r0, sb
	lsrs r3, r0, #0x18
	ldr r0, [sp]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #4]
	bl TrySetPyramidEventObjectPositionInSquare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AA2E0
	movs r7, #1
	b _081AA2E6
	.align 2, 0
_081AA2DC: .4byte 0x085DEE88
_081AA2E0:
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
_081AA2E6:
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _081AA378
	ldr r2, _081AA31C
	mov r8, r2
	ldr r3, [sp, #4]
	lsls r4, r3, #2
	adds r0, r6, r4
	add r0, r8
	ldrb r2, [r0]
	mov r0, sb
	lsrs r3, r0, #0x18
	ldr r0, [sp]
	ldr r1, [sp, #0x14]
	bl TrySetPyramidEventObjectPositionInSquare
	lsls r0, r0, #0x18
	ldr r1, [sp, #0x1c]
	mov sl, r1
	adds r5, r4, #0
	cmp r0, #0
	beq _081AA360
	ldr r4, [sp, #0xc]
	adds r4, #1
	b _081AA33A
	.align 2, 0
_081AA31C: .4byte 0x085DF77E
_081AA320:
	adds r0, r6, r5
	adds r0, r0, r2
	ldrb r2, [r0]
	mov r0, sl
	lsls r3, r0, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [sp]
	ldr r1, [sp, #0x14]
	bl TrySetPyramidEventObjectPositionInSquare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AA358
_081AA33A:
	adds r6, #1
	ldr r0, _081AA35C
	adds r1, r6, r5
	adds r1, r1, r0
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0xff
	beq _081AA34E
	cmp r6, #3
	ble _081AA350
_081AA34E:
	movs r6, #0
_081AA350:
	adds r7, #2
	asrs r0, r7, #1
	cmp r0, #4
	bne _081AA320
_081AA358:
	str r4, [sp, #0xc]
	b _081AA378
	.align 2, 0
_081AA35C: .4byte 0x085DF77E
_081AA360:
	adds r6, #1
	adds r0, r6, r4
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _081AA370
	cmp r6, #3
	ble _081AA372
_081AA370:
	movs r6, #0
_081AA372:
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
_081AA378:
	asrs r0, r7, #1
	cmp r0, #4
	beq _081AA39A
	movs r0, #1
	ands r7, r0
	ldr r2, [sp, #0x1c]
	adds r2, #1
	str r2, [sp, #0x1c]
	movs r3, #0x80
	lsls r3, r3, #0x11
	add sb, r3
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	blt _081AA2C0
_081AA39A:
	movs r1, #0
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x18]
	subs r0, r2, r3
	asrs r0, r0, #1
	ldr r2, [sp, #0xc]
	cmp r0, r2
	ble _081AA3AC
	movs r1, #1
_081AA3AC:
	adds r0, r1, #0
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetPyramidObjectPositionsInAndNearSquare

	thumb_func_start SetPyramidObjectPositionsNearSquare
SetPyramidObjectPositionsNearSquare: @ 0x081AA3C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r4, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	bl GetPyramidFloorTemplateId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0x10
	bl AllocZeroed
	str r0, [sp, #8]
	bl GetPyramidFloorLayoutOffsets
	ldr r1, [sp]
	cmp r1, #0
	bne _081AA40C
	ldr r1, _081AA408
	lsls r0, r5, #4
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	mov sl, r0
	movs r0, #0
	b _081AA418
	.align 2, 0
_081AA408: .4byte 0x085DEE88
_081AA40C:
	ldr r1, _081AA448
	lsls r0, r5, #4
	adds r0, r0, r1
	ldrb r2, [r0]
	mov sl, r2
	ldrb r0, [r0, #1]
_081AA418:
	movs r3, #0
	str r3, [sp, #4]
	mov r1, sl
	asrs r1, r1, #0x1f
	str r1, [sp, #0xc]
	cmp r3, sl
	bge _081AA4B6
	ldr r2, _081AA44C
	mov sb, r2
	lsls r5, r6, #2
	lsls r6, r0, #0x18
_081AA42E:
	adds r0, r4, r5
	add r0, sb
	ldrb r2, [r0]
	lsrs r3, r6, #0x18
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl TrySetPyramidEventObjectPositionInSquare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AA48C
	adds r7, #1
	b _081AA466
	.align 2, 0
_081AA448: .4byte 0x085DEE88
_081AA44C: .4byte 0x085DF77E
_081AA450:
	adds r0, r4, r5
	adds r0, r0, r1
	ldrb r2, [r0]
	lsrs r3, r6, #0x18
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl TrySetPyramidEventObjectPositionInSquare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AA4A0
_081AA466:
	adds r4, #1
	adds r0, r4, r5
	add r0, sb
	ldrb r0, [r0]
	ldr r1, _081AA488
	cmp r0, #0xff
	beq _081AA478
	cmp r4, #3
	ble _081AA47A
_081AA478:
	movs r4, #0
_081AA47A:
	movs r3, #1
	add r8, r3
	mov r0, r8
	cmp r0, #4
	bne _081AA450
	b _081AA4A0
	.align 2, 0
_081AA488: .4byte 0x085DF77E
_081AA48C:
	adds r4, #1
	adds r0, r4, r5
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _081AA49C
	cmp r4, #3
	ble _081AA49E
_081AA49C:
	movs r4, #0
_081AA49E:
	adds r7, #1
_081AA4A0:
	mov r1, r8
	cmp r1, #4
	beq _081AA4B6
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r6, r6, r2
	ldr r3, [sp, #4]
	adds r3, #1
	str r3, [sp, #4]
	cmp r3, sl
	blt _081AA42E
_081AA4B6:
	movs r1, #0
	mov r2, sl
	ldr r3, [sp, #0xc]
	subs r0, r2, r3
	asrs r0, r0, #1
	cmp r0, r7
	ble _081AA4C6
	movs r1, #1
_081AA4C6:
	adds r0, r1, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end SetPyramidObjectPositionsNearSquare

	thumb_func_start TrySetPyramidEventObjectPositionInSquare
TrySetPyramidEventObjectPositionInSquare: @ 0x081AA4D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	ldr r0, _081AA53C
	ldr r0, [r0]
	ldr r1, _081AA540
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081AA548
	movs r6, #7
_081AA50A:
	movs r4, #7
	lsls r5, r6, #0x18
_081AA50E:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, sb
	lsrs r2, r5, #0x18
	mov r3, sl
	bl TrySetPyramidEventObjectPositionAtCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AA544
	subs r4, #1
	cmp r4, #0
	bge _081AA50E
	subs r6, #1
	movs r1, #1
	rsbs r1, r1, #0
	cmp r6, r1
	bgt _081AA50A
	b _081AA574
	.align 2, 0
_081AA53C: .4byte 0x03005AF0
_081AA540: .4byte 0x00000E22
_081AA544:
	movs r0, #0
	b _081AA576
_081AA548:
	movs r6, #0
_081AA54A:
	movs r4, #0
	lsls r5, r6, #0x18
_081AA54E:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, sb
	lsrs r2, r5, #0x18
	mov r3, sl
	bl TrySetPyramidEventObjectPositionAtCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AA544
	adds r4, #1
	cmp r4, #7
	ble _081AA54E
	adds r6, #1
	cmp r6, #7
	ble _081AA54A
_081AA574:
	movs r0, #1
_081AA576:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TrySetPyramidEventObjectPositionInSquare

	thumb_func_start TrySetPyramidEventObjectPositionAtCoords
TrySetPyramidEventObjectPositionAtCoords: @ 0x081AA588
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r4, [sp, #0x34]
	ldr r5, [sp, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	ldr r0, _081AA6BC
	ldr r0, [r0]
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r1, r0, r1
	str r1, [sp, #8]
	add r3, sl
	ldrb r1, [r3]
	adds r1, #0x2c
	movs r0, #0x19
	bl Overworld_GetMapHeaderByGroupAndId
	adds r5, r0, #0
	movs r7, #0
	ldr r1, [r5, #4]
	ldrb r2, [r1]
	cmp r7, r2
	bge _081AA6D2
	movs r0, #3
	ands r0, r4
	lsls r0, r0, #3
	str r0, [sp, #0xc]
_081AA5E0:
	ldr r1, [r1, #4]
	lsls r2, r7, #1
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r3, r0, r1
	movs r4, #4
	ldrsh r0, [r3, r4]
	ldr r1, [r5, #4]
	mov ip, r1
	mov sb, r2
	ldr r2, [sp, #4]
	cmp r0, r2
	bne _081AA6C8
	movs r4, #6
	ldrsh r0, [r3, r4]
	cmp r0, r8
	bne _081AA6C8
	ldr r0, [sp]
	cmp r0, #0
	bne _081AA60E
	ldrb r0, [r3, #1]
	cmp r0, #0x3b
	bne _081AA61A
_081AA60E:
	ldr r1, [sp]
	cmp r1, #1
	bne _081AA6C8
	ldrb r0, [r3, #1]
	cmp r0, #0x3b
	bne _081AA6C8
_081AA61A:
	movs r3, #0
	ldr r2, [r5, #4]
	mov ip, r2
	cmp r3, r6
	bge _081AA654
	ldr r4, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r4, r4, r0
	str r4, [sp, #0x10]
	mov r1, sl
	lsrs r0, r1, #2
	lsls r0, r0, #3
	mov r2, r8
	adds r1, r2, r0
	ldr r2, [sp, #8]
	adds r2, #4
_081AA63A:
	movs r4, #0
	ldrsh r0, [r2, r4]
	ldr r4, [sp, #0x10]
	cmp r0, r4
	bne _081AA64C
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, r1
	beq _081AA654
_081AA64C:
	adds r2, #0x18
	adds r3, #1
	cmp r3, r6
	blt _081AA63A
_081AA654:
	cmp r3, r6
	bne _081AA6C8
	lsls r0, r6, #1
	mov r8, r0
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, [sp, #8]
	adds r5, r0, r1
	mov r3, ip
	ldr r2, [r3, #4]
	mov r4, sb
	adds r1, r4, r7
	lsls r1, r1, #3
	adds r0, r5, #0
	adds r1, r1, r2
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldrh r0, [r5, #4]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	strh r0, [r5, #4]
	mov r2, sl
	lsrs r0, r2, #2
	lsls r0, r0, #3
	ldrh r3, [r5, #6]
	adds r0, r0, r3
	strh r0, [r5, #6]
	adds r0, r6, #1
	strb r0, [r5]
	ldrb r0, [r5, #1]
	cmp r0, #0x3b
	beq _081AA6B8
	adds r0, r6, #0
	bl GetUniqueTrainerId
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r4, r7, #0
	adds r0, r4, #0
	bl GetBattleFacilityTrainerGfxId
	strb r0, [r5, #1]
	ldr r0, _081AA6C0
	ldr r0, [r0]
	ldr r1, _081AA6C4
	adds r0, r0, r1
	add r0, r8
	strh r4, [r0]
_081AA6B8:
	movs r0, #0
	b _081AA6D4
	.align 2, 0
_081AA6BC: .4byte 0x03005AEC
_081AA6C0: .4byte 0x03005AF0
_081AA6C4: .4byte 0x00000CB4
_081AA6C8:
	adds r7, #1
	mov r1, ip
	ldrb r2, [r1]
	cmp r7, r2
	blt _081AA5E0
_081AA6D2:
	movs r0, #1
_081AA6D4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end TrySetPyramidEventObjectPositionAtCoords

	thumb_func_start GetPyramidFloorLayoutOffsets
GetPyramidFloorLayoutOffsets: @ 0x081AA6E4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _081AA744
	ldr r0, [r0]
	ldr r2, _081AA748
	adds r1, r0, r2
	ldrh r4, [r1]
	ldr r1, _081AA74C
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	orrs r4, r0
	bl GetPyramidFloorTemplateId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r3, #0
	ldr r2, _081AA750
	mov ip, r2
	movs r7, #7
_081AA70C:
	adds r2, r6, r3
	adds r0, r4, #0
	ands r0, r7
	lsls r1, r5, #4
	adds r0, r0, r1
	add r0, ip
	ldrb r0, [r0]
	strb r0, [r2]
	asrs r4, r4, #3
	cmp r3, #7
	bne _081AA738
	ldr r0, _081AA744
	ldr r1, [r0]
	ldr r2, _081AA754
	adds r0, r1, r2
	ldrh r4, [r0]
	ldr r0, _081AA758
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	orrs r4, r0
	asrs r4, r4, #8
_081AA738:
	adds r3, #1
	cmp r3, #0xf
	ble _081AA70C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AA744: .4byte 0x03005AF0
_081AA748: .4byte 0x00000E22
_081AA74C: .4byte 0x00000E24
_081AA750: .4byte 0x085DEE8D
_081AA754: .4byte 0x00000E26
_081AA758: .4byte 0x00000E28
	thumb_func_end GetPyramidFloorLayoutOffsets

	thumb_func_start GetPyramidFloorTemplateId
GetPyramidFloorTemplateId: @ 0x081AA75C
	push {r4, lr}
	ldr r0, _081AA794
	ldr r4, [r0]
	ldr r1, _081AA798
	adds r0, r4, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _081AA79C
	adds r4, r4, r0
	ldrh r0, [r4]
	ldr r1, _081AA7A0
	adds r0, r0, r1
	ldrb r2, [r0]
	cmp r2, #0x21
	bhi _081AA7B0
	ldr r1, _081AA7A4
	lsls r0, r2, #1
	adds r0, r0, r1
_081AA788:
	ldrb r1, [r0]
	cmp r3, r1
	bge _081AA7A8
	ldrb r0, [r0, #1]
	b _081AA7B2
	.align 2, 0
_081AA794: .4byte 0x03005AF0
_081AA798: .4byte 0x00000E28
_081AA79C: .4byte 0x00000CB2
_081AA7A0: .4byte 0x085DEFCC
_081AA7A4: .4byte 0x085DEF88
_081AA7A8:
	adds r0, #2
	adds r2, #1
	cmp r2, #0x21
	bls _081AA788
_081AA7B0:
	movs r0, #0
_081AA7B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetPyramidFloorTemplateId

	thumb_func_start GetNumBattlePyramidEventObjects
GetNumBattlePyramidEventObjects: @ 0x081AA7B8
	push {lr}
	ldr r0, _081AA7D0
	ldr r0, [r0]
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r2, r0, r1
	movs r1, #0
	movs r3, #0xc7
	lsls r3, r3, #4
	adds r0, r0, r3
	b _081AA7E6
	.align 2, 0
_081AA7D0: .4byte 0x03005AEC
_081AA7D4:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bhi _081AA7EC
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
_081AA7E6:
	ldrb r0, [r0]
	cmp r0, #0
	bne _081AA7D4
_081AA7EC:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetNumBattlePyramidEventObjects

	thumb_func_start InitPyramidBagItems
InitPyramidBagItems: @ 0x081AA7F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r1, _081AA84C
	mov r8, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	movs r0, #0
	mov ip, r0
	lsls r4, r1, #1
	ldr r7, _081AA850
	movs r6, #0
	ldr r5, _081AA854
	lsls r2, r1, #2
_081AA816:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r7
	adds r1, r1, r2
	strh r6, [r1]
	adds r1, r3, r4
	adds r0, r0, r5
	adds r0, r0, r1
	mov r1, ip
	strb r1, [r0]
	adds r2, #2
	adds r3, #1
	cmp r3, #9
	ble _081AA816
	movs r0, #0x15
	movs r1, #1
	bl AddPyramidBagItem
	movs r0, #0x22
	movs r1, #1
	bl AddPyramidBagItem
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AA84C: .4byte 0x03005AF0
_081AA850: .4byte 0x00000E2C
_081AA854: .4byte 0x00000E54
	thumb_func_end InitPyramidBagItems

	thumb_func_start GetBattlePyramidPickupItemId
GetBattlePyramidPickupItemId: @ 0x081AA858
	push {r4, r5, r6, lr}
	ldr r0, _081AA8BC
	ldr r1, [r0]
	ldr r2, _081AA8C0
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r6, r0, #0x1e
	lsls r0, r6, #1
	ldr r2, _081AA8C4
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	ble _081AA882
	movs r4, #0x13
_081AA882:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	ldr r3, _081AA8C8
	ldrb r0, [r3]
	lsls r5, r4, #2
	cmp r0, r2
	bgt _081AA8AE
_081AA8A0:
	adds r1, #1
	cmp r1, #9
	bhi _081AA8B2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	ble _081AA8A0
_081AA8AE:
	cmp r1, #9
	bls _081AA8B4
_081AA8B2:
	movs r1, #9
_081AA8B4:
	cmp r6, #0
	bne _081AA8D0
	ldr r2, _081AA8CC
	b _081AA8D2
	.align 2, 0
_081AA8BC: .4byte 0x03005AF0
_081AA8C0: .4byte 0x00000CA9
_081AA8C4: .4byte 0x00000E1A
_081AA8C8: .4byte 0x085DF7BE
_081AA8CC: .4byte 0x085DEFD4
_081AA8D0:
	ldr r2, _081AA8E4
_081AA8D2:
	lsls r1, r1, #1
	adds r0, r5, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081AA8E4: .4byte 0x085DF164
	thumb_func_end GetBattlePyramidPickupItemId

