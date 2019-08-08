.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetPokenavMainMenuType
GetPokenavMainMenuType: @ 0x081C8A14
	push {r4, lr}
	movs r0, #0x98
	lsls r0, r0, #1
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	ldr r0, _081C8A40
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C8A36
	movs r4, #2
_081C8A36:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081C8A40: .4byte 0x0000089B
	thumb_func_end GetPokenavMainMenuType

	thumb_func_start sub_081C8A44
sub_081C8A44: @ 0x081C8A44
	push {r4, lr}
	movs r0, #1
	movs r1, #0x10
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081C8A70
	bl GetPokenavMainMenuType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	strh r0, [r4]
	strh r1, [r4, #2]
	strh r1, [r4, #4]
	strh r1, [r4, #6]
	adds r0, r4, #0
	bl sub_081C8B48
	movs r0, #1
	b _081C8A72
_081C8A70:
	movs r0, #0
_081C8A72:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081C8A44

	thumb_func_start sub_081C8A78
sub_081C8A78: @ 0x081C8A78
	push {r4, lr}
	movs r0, #1
	movs r1, #0x10
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081C8AA6
	bl GetPokenavMainMenuType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	strh r0, [r4]
	movs r0, #2
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r1, [r4, #6]
	adds r0, r4, #0
	bl sub_081C8B48
	movs r0, #1
	b _081C8AA8
_081C8AA6:
	movs r0, #0
_081C8AA8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C8A78

	thumb_func_start sub_081C8AB0
sub_081C8AB0: @ 0x081C8AB0
	push {r4, lr}
	movs r0, #1
	movs r1, #0x10
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081C8ADA
	bl GetPokenavMainMenuType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #3
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r4, #0
	bl sub_081C8B48
	movs r0, #1
	b _081C8ADC
_081C8ADA:
	movs r0, #0
_081C8ADC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C8AB0

	thumb_func_start sub_081C8AE4
sub_081C8AE4: @ 0x081C8AE4
	push {lr}
	movs r0, #1
	movs r1, #0x10
	bl AllocSubstruct
	adds r2, r0, #0
	cmp r2, #0
	beq _081C8B0C
	movs r0, #0
	movs r1, #3
	strh r1, [r2]
	strh r0, [r2, #2]
	movs r1, #5
	strh r1, [r2, #4]
	strh r0, [r2, #6]
	adds r0, r2, #0
	bl sub_081C8B48
	movs r0, #1
	b _081C8B0E
_081C8B0C:
	movs r0, #0
_081C8B0E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C8AE4

	thumb_func_start sub_081C8B14
sub_081C8B14: @ 0x081C8B14
	push {r4, r5, lr}
	movs r0, #1
	movs r1, #0x10
	bl AllocSubstruct
	adds r5, r0, #0
	cmp r5, #0
	beq _081C8B40
	movs r4, #0
	movs r0, #4
	strh r0, [r5]
	bl sub_081C6E6C
	strh r0, [r5, #2]
	adds r0, #8
	strh r0, [r5, #4]
	strh r4, [r5, #6]
	adds r0, r5, #0
	bl sub_081C8B48
	movs r0, #1
	b _081C8B42
_081C8B40:
	movs r0, #0
_081C8B42:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081C8B14

	thumb_func_start sub_081C8B48
sub_081C8B48: @ 0x081C8B48
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4]
	cmp r0, #4
	bhi _081C8B8C
	lsls r0, r0, #2
	ldr r1, _081C8B5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C8B5C: .4byte 0x081C8B60
_081C8B60: @ jump table
	.4byte _081C8B74 @ case 0
	.4byte _081C8B7A @ case 1
	.4byte _081C8B7A @ case 2
	.4byte _081C8B80 @ case 3
	.4byte _081C8B88 @ case 4
_081C8B74:
	movs r0, #0
	bl SetPokenavMode
_081C8B7A:
	bl sub_081C8B98
	b _081C8B8A
_081C8B80:
	ldr r0, _081C8B84
	b _081C8B8A
	.align 2, 0
_081C8B84: .4byte 0x081C8DE9
_081C8B88:
	ldr r0, _081C8B94
_081C8B8A:
	str r0, [r4, #0xc]
_081C8B8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C8B94: .4byte 0x081C8EA9
	thumb_func_end sub_081C8B48

	thumb_func_start sub_081C8B98
sub_081C8B98: @ 0x081C8B98
	push {lr}
	bl GetPokenavMode
	cmp r0, #1
	beq _081C8BB4
	cmp r0, #1
	blo _081C8BAA
	cmp r0, #2
	beq _081C8BBC
_081C8BAA:
	ldr r0, _081C8BB0
	b _081C8BBE
	.align 2, 0
_081C8BB0: .4byte 0x081C8BE9
_081C8BB4:
	ldr r0, _081C8BB8
	b _081C8BBE
	.align 2, 0
_081C8BB8: .4byte 0x081C8CCD
_081C8BBC:
	ldr r0, _081C8BC4
_081C8BBE:
	pop {r1}
	bx r1
	.align 2, 0
_081C8BC4: .4byte 0x081C8D35
	thumb_func_end sub_081C8B98

	thumb_func_start sub_081C8BC8
sub_081C8BC8: @ 0x081C8BC8
	push {lr}
	movs r0, #1
	bl GetSubstructPtr
	ldr r1, [r0, #0xc]
	bl _call_via_r1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C8BC8

	thumb_func_start sub_081C8BDC
sub_081C8BDC: @ 0x081C8BDC
	push {lr}
	movs r0, #1
	bl FreePokenavSubstruct
	pop {r0}
	bx r0
	thumb_func_end sub_081C8BDC

	thumb_func_start sub_081C8BE8
sub_081C8BE8: @ 0x081C8BE8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_081C8FC0
	cmp r0, #0
	beq _081C8BF8
	movs r0, #1
	b _081C8CC6
_081C8BF8:
	ldr r2, _081C8C28
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _081C8CB4
	ldr r3, _081C8C2C
	movs r0, #2
	ldrsh r1, [r4, r0]
	ldrh r2, [r4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1]
	cmp r0, #4
	bhi _081C8CB4
	lsls r0, r0, #2
	ldr r1, _081C8C30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C8C28: .4byte 0x03002360
_081C8C2C: .4byte 0x085F161D
_081C8C30: .4byte 0x081C8C34
_081C8C34: @ jump table
	.4byte _081C8C48 @ case 0
	.4byte _081C8C68 @ case 1
	.4byte _081C8C80 @ case 2
	.4byte _081C8C8C @ case 3
	.4byte _081C8CC2 @ case 4
_081C8C48:
	ldr r0, _081C8C60
	ldr r0, [r0]
	ldrb r1, [r0, #0x15]
	movs r0, #8
	ands r0, r1
	movs r1, #1
	cmp r0, #0
	beq _081C8C5A
	movs r1, #2
_081C8C5A:
	strh r1, [r4, #6]
	ldr r1, _081C8C64
	b _081C8C9A
	.align 2, 0
_081C8C60: .4byte 0x03005AF0
_081C8C64: .4byte 0x000186A6
_081C8C68:
	movs r1, #0
	movs r0, #3
	strh r0, [r4]
	strh r1, [r4, #2]
	ldrb r0, [r3, #0x12]
	strh r0, [r4, #4]
	ldr r0, _081C8C7C
	str r0, [r4, #0xc]
	movs r0, #2
	b _081C8CC6
	.align 2, 0
_081C8C7C: .4byte 0x081C8DE9
_081C8C80:
	movs r0, #6
	strh r0, [r4, #6]
	ldr r1, _081C8C88
	b _081C8C9A
	.align 2, 0
_081C8C88: .4byte 0x000186AB
_081C8C8C:
	bl sub_081C6E78
	cmp r0, #0
	beq _081C8CA8
	movs r0, #9
	strh r0, [r4, #6]
	ldr r1, _081C8CA4
_081C8C9A:
	adds r0, r4, #0
	bl sub_081C8F5C
	movs r0, #8
	b _081C8CC6
	.align 2, 0
_081C8CA4: .4byte 0x000186AC
_081C8CA8:
	ldr r0, _081C8CB0
	str r0, [r4, #0xc]
	movs r0, #6
	b _081C8CC6
	.align 2, 0
_081C8CB0: .4byte 0x081C8DAD
_081C8CB4:
	ldrh r1, [r5, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081C8CC2
	movs r0, #0
	b _081C8CC6
_081C8CC2:
	movs r0, #1
	rsbs r0, r0, #0
_081C8CC6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081C8BE8

	thumb_func_start sub_081C8CCC
sub_081C8CCC: @ 0x081C8CCC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_081C8FC0
	cmp r0, #0
	beq _081C8CDC
	movs r0, #1
	b _081C8D2C
_081C8CDC:
	ldr r0, _081C8D10
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C8D1C
	ldr r3, _081C8D14
	movs r0, #2
	ldrsh r1, [r4, r0]
	ldrh r2, [r4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1]
	cmp r0, #2
	bne _081C8D24
	movs r0, #6
	strh r0, [r4, #6]
	ldr r1, _081C8D18
	adds r0, r4, #0
	bl sub_081C8F5C
	movs r0, #8
	b _081C8D2C
	.align 2, 0
_081C8D10: .4byte 0x03002360
_081C8D14: .4byte 0x085F161D
_081C8D18: .4byte 0x000186AB
_081C8D1C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C8D2A
_081C8D24:
	movs r0, #0x20
	bl PlaySE
_081C8D2A:
	movs r0, #0
_081C8D2C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C8CCC

	thumb_func_start sub_081C8D34
sub_081C8D34: @ 0x081C8D34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_081C8FC0
	cmp r0, #0
	beq _081C8D44
	movs r0, #1
	b _081C8DA4
_081C8D44:
	ldr r0, _081C8D78
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C8D94
	ldr r3, _081C8D7C
	movs r0, #2
	ldrsh r1, [r4, r0]
	ldrh r2, [r4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1]
	cmp r0, #2
	beq _081C8D80
	cmp r0, #4
	beq _081C8DA0
	movs r0, #0x20
	bl PlaySE
	movs r0, #0
	b _081C8DA4
	.align 2, 0
_081C8D78: .4byte 0x03002360
_081C8D7C: .4byte 0x085F161D
_081C8D80:
	movs r0, #6
	strh r0, [r4, #6]
	ldr r1, _081C8D90
	adds r0, r4, #0
	bl sub_081C8F5C
	movs r0, #8
	b _081C8DA4
	.align 2, 0
_081C8D90: .4byte 0x000186AB
_081C8D94:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081C8DA0
	movs r0, #0
	b _081C8DA4
_081C8DA0:
	movs r0, #1
	rsbs r0, r0, #0
_081C8DA4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C8D34

	thumb_func_start sub_081C8DAC
sub_081C8DAC: @ 0x081C8DAC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_081C8FC0
	cmp r0, #0
	beq _081C8DC2
	bl sub_081C8B98
	str r0, [r4, #0xc]
	movs r0, #1
	b _081C8DE0
_081C8DC2:
	ldr r0, _081C8DD4
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081C8DD8
	movs r0, #0
	b _081C8DE0
	.align 2, 0
_081C8DD4: .4byte 0x03002360
_081C8DD8:
	bl sub_081C8B98
	str r0, [r4, #0xc]
	movs r0, #7
_081C8DE0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C8DAC

	thumb_func_start sub_081C8DE8
sub_081C8DE8: @ 0x081C8DE8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_081C8FC0
	adds r3, r0, #0
	cmp r3, #0
	beq _081C8DFA
	movs r0, #1
	b _081C8EA2
_081C8DFA:
	ldr r2, _081C8E2C
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _081C8E64
	ldr r5, _081C8E30
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldrh r2, [r4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #6
	beq _081C8E3A
	cmp r0, #6
	bgt _081C8E34
	cmp r0, #5
	beq _081C8E50
	b _081C8E64
	.align 2, 0
_081C8E2C: .4byte 0x03002360
_081C8E30: .4byte 0x085F161D
_081C8E34:
	cmp r0, #7
	beq _081C8E90
	b _081C8E64
_081C8E3A:
	movs r0, #4
	strh r0, [r4]
	strh r3, [r4, #2]
	ldrb r0, [r5, #0x18]
	strh r0, [r4, #4]
	ldr r0, _081C8E4C
	str r0, [r4, #0xc]
	movs r0, #4
	b _081C8EA2
	.align 2, 0
_081C8E4C: .4byte 0x081C8EA9
_081C8E50:
	strh r3, [r4, #6]
	ldr r1, _081C8E60
	adds r0, r4, #0
	bl sub_081C8F5C
	movs r0, #8
	b _081C8EA2
	.align 2, 0
_081C8E60: .4byte 0x000186A7
_081C8E64:
	ldrh r1, [r6, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C8EA0
	movs r0, #2
	ldrsh r2, [r4, r0]
	ldr r1, _081C8E88
	ldrh r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	beq _081C8E90
	strh r0, [r4, #2]
	ldr r0, _081C8E8C
	str r0, [r4, #0xc]
	movs r0, #1
	b _081C8EA2
	.align 2, 0
_081C8E88: .4byte 0x085F1618
_081C8E8C: .4byte 0x081C8F45
_081C8E90:
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081C8F6C
	movs r0, #3
	b _081C8EA2
_081C8EA0:
	movs r0, #0
_081C8EA2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081C8DE8

	thumb_func_start sub_081C8EA8
sub_081C8EA8: @ 0x081C8EA8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_081C8FC0
	cmp r0, #0
	beq _081C8EB8
	movs r0, #1
	b _081C8F3E
_081C8EB8:
	ldr r0, _081C8EF4
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081C8F00
	ldr r3, _081C8EF8
	movs r0, #2
	ldrsh r1, [r4, r0]
	ldrh r2, [r4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1]
	cmp r0, #0xd
	beq _081C8F2C
	subs r0, #8
	bl sub_081C6E54
	ldr r1, _081C8EFC
	adds r0, r4, #0
	bl sub_081C8F5C
	movs r0, #3
	strh r0, [r4, #6]
	movs r0, #8
	b _081C8F3E
	.align 2, 0
_081C8EF4: .4byte 0x03002360
_081C8EF8: .4byte 0x085F161D
_081C8EFC: .4byte 0x000186A8
_081C8F00:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081C8F3C
	movs r0, #2
	ldrsh r2, [r4, r0]
	ldr r1, _081C8F24
	ldrh r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	beq _081C8F2C
	strh r0, [r4, #2]
	ldr r0, _081C8F28
	str r0, [r4, #0xc]
	movs r0, #1
	b _081C8F3E
	.align 2, 0
_081C8F24: .4byte 0x085F1618
_081C8F28: .4byte 0x081C8F51
_081C8F2C:
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081C8FA4
	movs r0, #5
	b _081C8F3E
_081C8F3C:
	movs r0, #0
_081C8F3E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081C8EA8

	thumb_func_start sub_081C8F44
sub_081C8F44: @ 0x081C8F44
	push {lr}
	bl sub_081C8F6C
	movs r0, #3
	pop {r1}
	bx r1
	thumb_func_end sub_081C8F44

	thumb_func_start sub_081C8F50
sub_081C8F50: @ 0x081C8F50
	push {lr}
	bl sub_081C8FA4
	movs r0, #5
	pop {r1}
	bx r1
	thumb_func_end sub_081C8F50

	thumb_func_start sub_081C8F5C
sub_081C8F5C: @ 0x081C8F5C
	str r1, [r0, #8]
	ldr r1, _081C8F64
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_081C8F64: .4byte 0x081C8F69
	thumb_func_end sub_081C8F5C

	thumb_func_start sub_081C8F68
sub_081C8F68: @ 0x081C8F68
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_081C8F68

	thumb_func_start sub_081C8F6C
sub_081C8F6C: @ 0x081C8F6C
	push {r4, lr}
	adds r4, r0, #0
	bl GetPokenavMainMenuType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #1
	strh r0, [r4, #2]
	ldr r2, _081C8F9C
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #4]
	ldr r0, _081C8FA0
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C8F9C: .4byte 0x085F161D
_081C8FA0: .4byte 0x081C8BE9
	thumb_func_end sub_081C8F6C

	thumb_func_start sub_081C8FA4
sub_081C8FA4: @ 0x081C8FA4
	movs r1, #3
	strh r1, [r0]
	movs r1, #1
	strh r1, [r0, #2]
	ldr r1, _081C8FB8
	ldrb r1, [r1, #0x13]
	strh r1, [r0, #4]
	ldr r1, _081C8FBC
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_081C8FB8: .4byte 0x085F161D
_081C8FBC: .4byte 0x081C8DE9
	thumb_func_end sub_081C8FA4

	thumb_func_start sub_081C8FC0
sub_081C8FC0: @ 0x081C8FC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _081C8FEC
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _081C8FF4
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	ldrh r3, [r4]
	cmp r0, #0
	bge _081C9016
	ldr r0, _081C8FF0
	adds r0, r3, r0
	ldrb r0, [r0]
	strh r0, [r4, #2]
	b _081C9016
	.align 2, 0
_081C8FEC: .4byte 0x03002360
_081C8FF0: .4byte 0x085F1618
_081C8FF4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081C9038
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	movs r0, #2
	ldrsh r2, [r4, r0]
	ldr r0, _081C9030
	ldrh r1, [r4]
	adds r0, r1, r0
	adds r3, r1, #0
	ldrb r0, [r0]
	cmp r2, r0
	ble _081C9016
	strh r5, [r4, #2]
_081C9016:
	ldr r2, _081C9034
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	strh r0, [r4, #4]
	movs r0, #1
	b _081C903A
	.align 2, 0
_081C9030: .4byte 0x085F1618
_081C9034: .4byte 0x085F161D
_081C9038:
	movs r0, #0
_081C903A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081C8FC0

	thumb_func_start sub_081C9040
sub_081C9040: @ 0x081C9040
	push {lr}
	movs r0, #1
	bl GetSubstructPtr
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C9040

	thumb_func_start sub_081C9050
sub_081C9050: @ 0x081C9050
	push {lr}
	movs r0, #1
	bl GetSubstructPtr
	movs r1, #2
	ldrsh r0, [r0, r1]
	pop {r1}
	bx r1
	thumb_func_end sub_081C9050

	thumb_func_start sub_081C9060
sub_081C9060: @ 0x081C9060
	push {lr}
	movs r0, #1
	bl GetSubstructPtr
	ldrh r0, [r0, #4]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C9060

	thumb_func_start sub_081C9070
sub_081C9070: @ 0x081C9070
	push {lr}
	movs r0, #1
	bl GetSubstructPtr
	ldrh r0, [r0, #6]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C9070

