.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0800B97C
sub_0800B97C: @ 0x0800B97C
	push {r4, lr}
	bl rfu_REQBN_softReset_and_checkID
	adds r4, r0, #0
	ldr r0, _0800B9C0
	cmp r4, r0
	bne _0800B990
	ldr r1, _0800B9C4
	movs r0, #1
	strb r0, [r1, #8]
_0800B990:
	ldr r0, _0800B9C4
	ldrb r2, [r0, #4]
	adds r1, r0, #0
	cmp r2, #0x17
	beq _0800B9A4
	cmp r2, #1
	beq _0800B9A4
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #4]
_0800B9A4:
	movs r0, #0
	strb r0, [r1, #7]
	strb r0, [r1, #0xd]
	strb r0, [r1, #1]
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r1, #6]
	bl sub_0800D0CC
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800B9C0: .4byte 0x00008001
_0800B9C4: .4byte 0x030041E0
	thumb_func_end sub_0800B97C

	thumb_func_start rfu_REQ_sendData_wrapper
rfu_REQ_sendData_wrapper: @ 0x0800B9C8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0800B9E8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800B9F0
	ldr r0, _0800B9EC
	ldrb r0, [r0, #2]
	movs r2, #0
	cmp r0, #1
	bne _0800B9F8
	movs r2, #1
	b _0800B9F8
	.align 2, 0
_0800B9E8: .4byte 0x03007630
_0800B9EC: .4byte 0x030041E0
_0800B9F0:
	ldr r0, _0800BA04
	ldrb r1, [r0, #3]
	movs r1, #0
	strb r1, [r0, #3]
_0800B9F8:
	adds r0, r2, #0
	bl rfu_REQ_sendData
	pop {r0}
	bx r0
	.align 2, 0
_0800BA04: .4byte 0x030041E0
	thumb_func_end rfu_REQ_sendData_wrapper

	thumb_func_start sub_0800BA08
sub_0800BA08: @ 0x0800BA08
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	beq _0800BA50
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _0800BA40
	ldr r2, _0800BA44
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	movs r0, #0xff
	strb r0, [r4, #6]
	str r5, [r4, #0x40]
	str r6, [r4, #0x44]
	ldr r0, _0800BA48
	bl rfu_setMSCCallback
	ldr r0, _0800BA4C
	bl rfu_setREQCallback
	movs r0, #0
	b _0800BA52
	.align 2, 0
_0800BA40: .4byte 0x030041E0
_0800BA44: .4byte 0x01000024
_0800BA48: .4byte 0x0800C96D
_0800BA4C: .4byte 0x0800C271
_0800BA50:
	movs r0, #4
_0800BA52:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800BA08

	thumb_func_start sub_0800BA5C
sub_0800BA5C: @ 0x0800BA5C
	push {r4, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _0800BA80
	ldr r2, _0800BA84
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	movs r0, #0xff
	strb r0, [r4, #6]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA80: .4byte 0x030041E0
_0800BA84: .4byte 0x01000020
	thumb_func_end sub_0800BA5C

	thumb_func_start sub_0800BA88
sub_0800BA88: @ 0x0800BA88
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0800BABC
	ldr r1, _0800BAB8
	movs r2, #1
	strb r2, [r1, #4]
	movs r0, #2
	strb r0, [r1, #5]
	str r4, [r1, #0x3c]
	ldrb r0, [r4, #0x11]
	strb r0, [r1, #9]
	ldrh r0, [r4, #0x12]
	strh r0, [r1, #0x32]
	ldrh r0, [r4, #0x14]
	strh r0, [r1, #0x18]
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _0800BAB0
	strb r2, [r1, #0xb]
_0800BAB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAB8: .4byte 0x030041E0
	thumb_func_end sub_0800BA88

	thumb_func_start sub_0800BABC
sub_0800BABC: @ 0x0800BABC
	push {r4, r5, lr}
	ldr r2, _0800BB00
	movs r0, #0
	strb r0, [r2, #5]
	strb r0, [r2, #4]
	movs r1, #0xff
	strb r1, [r2, #6]
	strb r0, [r2, #7]
	strb r0, [r2, #0x10]
	strb r0, [r2, #0xc]
	adds r1, r2, #0
	adds r1, #0x24
	strb r0, [r1]
	adds r1, #0xc
	strb r0, [r1]
	movs r3, #0
	adds r5, r2, #0
	adds r5, #0x28
	movs r4, #0
	adds r2, #0x34
_0800BAE4:
	lsls r1, r3, #1
	adds r0, r1, r5
	strh r4, [r0]
	adds r1, r1, r2
	strh r4, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800BAE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BB00: .4byte 0x030041E0
	thumb_func_end sub_0800BABC

	thumb_func_start sub_0800BB04
sub_0800BB04: @ 0x0800BB04
	ldr r1, _0800BB0C
	movs r0, #0x15
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_0800BB0C: .4byte 0x030041E0
	thumb_func_end sub_0800BB04

	thumb_func_start sub_0800BB10
sub_0800BB10: @ 0x0800BB10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r1, _0800BB48
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0800BB4C
	cmp r0, #8
	bne _0800BB36
	cmp r5, #1
	beq _0800BB4C
_0800BB36:
	movs r0, #1
	strh r0, [r1, #0x14]
	movs r0, #0xf3
	movs r1, #1
	bl sub_0800CDC8
	movs r0, #1
	b _0800BBDE
	.align 2, 0
_0800BB48: .4byte 0x030041E0
_0800BB4C:
	bl rfu_getMasterSlave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BB6C
	ldr r1, _0800BB68
	movs r0, #2
	strh r0, [r1, #0x14]
	movs r0, #0xf3
	movs r1, #1
	bl sub_0800CDC8
	movs r0, #2
	b _0800BBDE
	.align 2, 0
_0800BB68: .4byte 0x030041E0
_0800BB6C:
	movs r2, #0
	ldrh r0, [r6]
	ldr r4, _0800BBA0
	adds r1, r6, #2
	ldr r3, _0800BBA4
	cmp r0, r4
	beq _0800BB8C
_0800BB7A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0800BB8C
	ldrh r0, [r1]
	adds r1, #2
	cmp r0, r4
	bne _0800BB7A
_0800BB8C:
	cmp r2, #0x10
	bne _0800BBA8
	movs r0, #4
	strh r0, [r3, #0x14]
	movs r0, #0xf3
	movs r1, #1
	bl sub_0800CDC8
	movs r0, #4
	b _0800BBDE
	.align 2, 0
_0800BBA0: .4byte 0x0000FFFF
_0800BBA4: .4byte 0x030041E0
_0800BBA8:
	cmp r5, #1
	bls _0800BBB6
	movs r0, #1
	strb r0, [r3, #7]
	movs r5, #1
	movs r7, #0
	b _0800BBBA
_0800BBB6:
	movs r0, #0
	strb r0, [r3, #7]
_0800BBBA:
	cmp r5, #0
	beq _0800BBC4
	movs r0, #5
	strb r0, [r3, #4]
	b _0800BBD2
_0800BBC4:
	movs r0, #9
	strb r0, [r3, #4]
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0800BBD2
	movs r0, #2
	strb r0, [r3, #0xb]
_0800BBD2:
	strb r5, [r3, #6]
	strh r7, [r3, #0x1a]
	mov r0, r8
	strh r0, [r3, #0x26]
	str r6, [r3, #0x20]
	movs r0, #0
_0800BBDE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0800BB10

	thumb_func_start sub_0800BBE8
sub_0800BBE8: @ 0x0800BBE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r1, _0800BC1C
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0800BC20
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0800BC20
	movs r0, #1
	strh r0, [r1, #0x14]
	movs r0, #0xf3
	movs r1, #1
	bl sub_0800CDC8
	movs r0, #1
	b _0800BCC0
	.align 2, 0
_0800BC1C: .4byte 0x030041E0
_0800BC20:
	bl rfu_getMasterSlave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BC40
	ldr r1, _0800BC3C
	movs r0, #2
	strh r0, [r1, #0x14]
	movs r0, #0xf3
	movs r1, #1
	bl sub_0800CDC8
	movs r0, #2
	b _0800BCC0
	.align 2, 0
_0800BC3C: .4byte 0x030041E0
_0800BC40:
	movs r2, #0
	ldr r0, _0800BC8C
	ldr r1, [r0]
	ldrb r3, [r1, #8]
	ldr r5, _0800BC90
	adds r7, r0, #0
	cmp r2, r3
	bhs _0800BC6E
	ldrh r0, [r1, #0x14]
	cmp r0, r6
	beq _0800BC6E
	adds r4, r1, #0
	adds r1, r3, #0
_0800BC5A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	bhs _0800BC6E
	lsls r0, r2, #5
	adds r0, r4, r0
	ldrh r0, [r0, #0x14]
	cmp r0, r6
	bne _0800BC5A
_0800BC6E:
	ldr r0, [r7]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0800BC7A
	cmp r2, r0
	bne _0800BC94
_0800BC7A:
	movs r0, #3
	strh r0, [r5, #0x14]
	movs r0, #0xf3
	movs r1, #1
	bl sub_0800CDC8
	movs r0, #3
	b _0800BCC0
	.align 2, 0
_0800BC8C: .4byte 0x03007630
_0800BC90: .4byte 0x030041E0
_0800BC94:
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0800BC9E
	cmp r0, #9
	bne _0800BCA6
_0800BC9E:
	movs r0, #0xc
	strb r0, [r5, #4]
	movs r0, #0xd
	b _0800BCAC
_0800BCA6:
	movs r0, #0xb
	strb r0, [r5, #4]
	movs r0, #0xc
_0800BCAC:
	strb r0, [r5, #5]
	strh r6, [r5, #0x1e]
	mov r0, r8
	strh r0, [r5, #0x1a]
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _0800BCBE
	movs r0, #7
	strb r0, [r5, #7]
_0800BCBE:
	movs r0, #0
_0800BCC0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800BBE8

	thumb_func_start sub_0800BCCC
sub_0800BCCC: @ 0x0800BCCC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0800BD30
	adds r3, r6, #0
	adds r3, #0x30
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0800BD28
	adds r0, r2, #0
	bics r0, r1
	strb r0, [r3]
	movs r4, #0
	ldr r7, _0800BD34
	movs r5, #1
	adds r3, #4
	movs r2, #0
_0800BCF2:
	adds r0, r1, #0
	asrs r0, r4
	ands r0, r5
	cmp r0, #0
	beq _0800BD02
	lsls r0, r4, #1
	adds r0, r0, r3
	strh r2, [r0]
_0800BD02:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0800BCF2
	ldr r0, [r7]
	ldrb r4, [r0, #3]
	ands r4, r1
	cmp r4, #0
	beq _0800BD1C
	adds r0, r4, #0
	bl sub_0800CDF0
_0800BD1C:
	ldr r0, _0800BD30
	strh r4, [r0, #0x14]
	movs r0, #0x33
	adds r1, r4, #0
	bl sub_0800CDC8
_0800BD28:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BD30: .4byte 0x030041E0
_0800BD34: .4byte 0x03007630
	thumb_func_end sub_0800BCCC

	thumb_func_start sub_0800BD38
sub_0800BD38: @ 0x0800BD38
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	movs r2, #0
	ldr r1, _0800BD54
	strb r2, [r1, #7]
	adds r5, r1, #0
	cmp r0, #0
	beq _0800BD58
	bl sub_0800BABC
	movs r0, #0x17
	strb r0, [r5, #4]
	b _0800BE22
	.align 2, 0
_0800BD54: .4byte 0x030041E0
_0800BD58:
	ldrb r0, [r5, #4]
	subs r0, #5
	cmp r0, #0xd
	bhi _0800BE0E
	lsls r0, r0, #2
	ldr r1, _0800BD6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800BD6C: .4byte 0x0800BD70
_0800BD70: @ jump table
	.4byte _0800BDA8 @ case 0
	.4byte _0800BDB4 @ case 1
	.4byte _0800BDB4 @ case 2
	.4byte _0800BE14 @ case 3
	.4byte _0800BDBE @ case 4
	.4byte _0800BDC8 @ case 5
	.4byte _0800BDC8 @ case 6
	.4byte _0800BDD2 @ case 7
	.4byte _0800BDDC @ case 8
	.4byte _0800BDDC @ case 9
	.4byte _0800BE14 @ case 10
	.4byte _0800BDE2 @ case 11
	.4byte _0800BE08 @ case 12
	.4byte _0800BE08 @ case 13
_0800BDA8:
	movs r1, #0
	movs r0, #8
	strb r0, [r5, #4]
	strb r1, [r5, #5]
	movs r2, #0x13
	b _0800BE14
_0800BDB4:
	movs r0, #7
	strb r0, [r5, #4]
	movs r0, #8
	strb r0, [r5, #5]
	b _0800BE14
_0800BDBE:
	movs r0, #0
	strb r0, [r5, #5]
	strb r0, [r5, #4]
	movs r2, #0x21
	b _0800BE14
_0800BDC8:
	movs r1, #0
	movs r0, #0xb
	strb r0, [r5, #4]
	strb r1, [r5, #5]
	b _0800BE14
_0800BDD2:
	movs r0, #0
	strb r0, [r5, #5]
	strb r0, [r5, #4]
	movs r2, #0x23
	b _0800BE14
_0800BDDC:
	movs r0, #0xe
	strb r0, [r5, #4]
	b _0800BE14
_0800BDE2:
	ldrb r0, [r5, #0x11]
	strb r0, [r5, #4]
	ldrb r0, [r5, #0x12]
	strb r0, [r5, #5]
	ldr r4, _0800BE04
	ldr r0, [r4]
	ldrb r0, [r0, #3]
	bl sub_0800CDF0
	ldr r0, [r4]
	ldrb r0, [r0, #3]
	strh r0, [r5, #0x14]
	movs r0, #0x33
	movs r1, #1
	bl sub_0800CDC8
	b _0800BE22
	.align 2, 0
_0800BE04: .4byte 0x03007630
_0800BE08:
	movs r0, #0x12
	strb r0, [r5, #4]
	b _0800BE14
_0800BE0E:
	strb r2, [r5, #5]
	strb r2, [r5, #4]
	movs r2, #0x43
_0800BE14:
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _0800BE22
	adds r0, r2, #0
	movs r1, #0
	bl sub_0800CDC8
_0800BE22:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0800BD38

	thumb_func_start sub_0800BE28
sub_0800BE28: @ 0x0800BE28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	mov r8, r1
	mov r5, sp
	adds r5, #1
	mov r4, sp
	adds r4, #2
	mov r1, sp
	adds r2, r5, #0
	adds r3, r4, #0
	bl rfu_REQBN_watchLink
	mov r0, sp
	ldrb r0, [r0]
	adds r7, r4, #0
	cmp r0, #0
	beq _0800BEFA
	ldr r1, _0800BEC4
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, #0x14]
	ldrb r0, [r5]
	strh r0, [r1, #0x16]
	ldrb r0, [r1, #9]
	adds r6, r1, #0
	cmp r0, #0
	beq _0800BEE2
	movs r0, #1
	strb r0, [r6, #0xa]
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0800BE7E
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800BE7E
	movs r0, #4
	strb r0, [r6, #0xa]
_0800BE7E:
	ldrb r0, [r6, #0xa]
	cmp r0, #1
	bne _0800BEC8
	movs r2, #0
	mov r4, sp
	movs r5, #1
	mov ip, r6
	mov r3, ip
	adds r3, #0x30
	movs r6, #0x34
	add r6, ip
	mov sb, r6
_0800BE96:
	ldrb r0, [r4]
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _0800BEB4
	adds r0, r5, #0
	lsls r0, r2
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r2, #1
	add r0, sb
	mov r6, ip
	ldrh r1, [r6, #0x32]
	strh r1, [r0]
_0800BEB4:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0800BE96
	movs r0, #0x31
	b _0800BEDA
	.align 2, 0
_0800BEC4: .4byte 0x030041E0
_0800BEC8:
	movs r0, #0
	strb r0, [r6, #0xa]
	mov r0, sp
	ldrb r0, [r0]
	bl sub_0800CDF0
	movs r0, #1
	mov r8, r0
	movs r0, #0x33
_0800BEDA:
	movs r1, #1
	bl sub_0800CDC8
	b _0800BEF6
_0800BEE2:
	mov r0, sp
	ldrb r0, [r0]
	bl sub_0800CDF0
	movs r1, #1
	mov r8, r1
	movs r0, #0x30
	movs r1, #2
	bl sub_0800CDC8
_0800BEF6:
	bl sub_0800D0CC
_0800BEFA:
	ldr r0, _0800BFE4
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800BFD4
	ldrb r0, [r7]
	cmp r0, #0
	beq _0800BF58
	movs r2, #0
	ldr r6, _0800BFE8
	movs r3, #1
	adds r4, r6, #0
	adds r4, #0x34
	adds r6, #0x30
	adds r5, r7, #0
_0800BF18:
	ldrb r0, [r6]
	asrs r0, r2
	ands r0, r3
	cmp r0, #0
	beq _0800BF34
	ldrb r0, [r5]
	asrs r0, r2
	ands r0, r3
	cmp r0, #0
	beq _0800BF34
	lsls r0, r2, #1
	adds r0, r0, r4
	movs r1, #0
	strh r1, [r0]
_0800BF34:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0800BF18
	ldr r3, _0800BFE8
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r1, [r7]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	strh r0, [r3, #0x14]
	movs r0, #0x32
	movs r1, #1
	bl sub_0800CDC8
_0800BF58:
	ldr r0, _0800BFE8
	adds r3, r0, #0
	adds r3, #0x30
	ldrb r1, [r3]
	adds r6, r0, #0
	cmp r1, #0
	beq _0800BFD0
	movs r4, #0
	movs r2, #0
	movs r5, #1
_0800BF6C:
	ldrb r0, [r3]
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _0800BF9E
	lsls r1, r2, #1
	adds r0, r6, #0
	adds r0, #0x34
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800BF9E
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800BF9E
	adds r0, r5, #0
	lsls r0, r2
	ldrb r1, [r3]
	bics r1, r0
	strb r1, [r3]
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0800BF9E:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0800BF6C
	cmp r4, #0
	beq _0800BFC2
	adds r0, r4, #0
	bl sub_0800CDF0
	movs r6, #1
	mov r8, r6
	ldr r0, _0800BFE8
	strh r4, [r0, #0x14]
	movs r0, #0x33
	movs r1, #1
	bl sub_0800CDC8
_0800BFC2:
	ldr r0, _0800BFE8
	adds r1, r0, #0
	adds r1, #0x30
	ldrb r1, [r1]
	adds r6, r0, #0
	cmp r1, #0
	bne _0800BFD4
_0800BFD0:
	movs r0, #0
	strb r0, [r6, #0xa]
_0800BFD4:
	mov r0, r8
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800BFE4: .4byte 0x03007630
_0800BFE8: .4byte 0x030041E0
	thumb_func_end sub_0800BE28

	thumb_func_start rfu_syncVBlank_
rfu_syncVBlank_: @ 0x0800BFEC
	push {lr}
	bl rfu_syncVBlank
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800C004
	movs r0, #0xf1
	movs r1, #0
	bl sub_0800CDC8
	bl sub_0800D0CC
_0800C004:
	pop {r0}
	bx r0
	thumb_func_end rfu_syncVBlank_

	thumb_func_start sub_0800C008
sub_0800C008: @ 0x0800C008
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, _0800C020
	ldr r2, [r1, #0x40]
	cmp r2, #0
	bne _0800C024
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0800C024
	strb r2, [r1, #4]
	b _0800C1F2
	.align 2, 0
_0800C020: .4byte 0x030041E0
_0800C024:
	ldr r0, _0800C058
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _0800C032
	adds r0, r3, #0
	bl sub_0800C200
_0800C032:
	ldr r4, _0800C058
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _0800C03C
	b _0800C1BC
_0800C03C:
	bl rfu_waitREQComplete
	movs r0, #1
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	subs r0, #1
	cmp r0, #0x16
	bls _0800C04E
	b _0800C1B2
_0800C04E:
	lsls r0, r0, #2
	ldr r1, _0800C05C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800C058: .4byte 0x030041E0
_0800C05C: .4byte 0x0800C060
_0800C060: @ jump table
	.4byte _0800C0E0 @ case 0
	.4byte _0800C118 @ case 1
	.4byte _0800C11E @ case 2
	.4byte _0800C134 @ case 3
	.4byte _0800C14C @ case 4
	.4byte _0800C152 @ case 5
	.4byte _0800C158 @ case 6
	.4byte _0800C1B2 @ case 7
	.4byte _0800C15E @ case 8
	.4byte _0800C164 @ case 9
	.4byte _0800C16A @ case 10
	.4byte _0800C170 @ case 11
	.4byte _0800C180 @ case 12
	.4byte _0800C186 @ case 13
	.4byte _0800C1B2 @ case 14
	.4byte _0800C18C @ case 15
	.4byte _0800C19C @ case 16
	.4byte _0800C1A2 @ case 17
	.4byte _0800C1A8 @ case 18
	.4byte _0800C1B2 @ case 19
	.4byte _0800C1AE @ case 20
	.4byte _0800C1B2 @ case 21
	.4byte _0800C0BC @ case 22
_0800C0BC:
	bl sub_0800B97C
	ldr r1, _0800C0D8
	movs r2, #0xff
	cmp r0, r1
	bne _0800C0CA
	movs r2, #0x44
_0800C0CA:
	ldr r1, _0800C0DC
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #4]
	adds r0, r2, #0
	b _0800C10A
	.align 2, 0
_0800C0D8: .4byte 0x00008001
_0800C0DC: .4byte 0x030041E0
_0800C0E0:
	bl sub_0800B97C
	ldr r1, _0800C0F8
	cmp r0, r1
	bne _0800C100
	ldr r0, _0800C0FC
	ldrb r1, [r0, #5]
	strb r1, [r0, #4]
	movs r1, #3
	strb r1, [r0, #5]
	b _0800C1B2
	.align 2, 0
_0800C0F8: .4byte 0x00008001
_0800C0FC: .4byte 0x030041E0
_0800C100:
	ldr r1, _0800C114
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #4]
	movs r0, #0xff
_0800C10A:
	movs r1, #0
	bl sub_0800CDC8
	b _0800C1B2
	.align 2, 0
_0800C114: .4byte 0x030041E0
_0800C118:
	bl rfu_REQ_reset
	b _0800C1B2
_0800C11E:
	ldr r0, _0800C130
	ldr r2, [r0, #0x3c]
	ldrh r0, [r2, #2]
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	bl rfu_REQ_configSystem
	b _0800C1B2
	.align 2, 0
_0800C130: .4byte 0x030041E0
_0800C134:
	ldr r0, _0800C148
	ldr r3, [r0, #0x3c]
	ldrb r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	bl rfu_REQ_configGameData
	b _0800C1B2
	.align 2, 0
_0800C148: .4byte 0x030041E0
_0800C14C:
	bl rfu_REQ_startSearchChild
	b _0800C1B2
_0800C152:
	bl rfu_REQ_pollSearchChild
	b _0800C1B2
_0800C158:
	bl rfu_REQ_endSearchChild
	b _0800C1B2
_0800C15E:
	bl rfu_REQ_startSearchParent
	b _0800C1B2
_0800C164:
	bl rfu_REQ_pollSearchParent
	b _0800C1B2
_0800C16A:
	bl rfu_REQ_endSearchParent
	b _0800C1B2
_0800C170:
	ldr r0, _0800C17C
	ldrh r0, [r0, #0x1e]
	bl rfu_REQ_startConnectParent
	b _0800C1B2
	.align 2, 0
_0800C17C: .4byte 0x030041E0
_0800C180:
	bl rfu_REQ_pollConnectParent
	b _0800C1B2
_0800C186:
	bl rfu_REQ_endConnectParent
	b _0800C1B2
_0800C18C:
	ldr r0, _0800C198
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	bl rfu_REQ_CHILD_startConnectRecovery
	b _0800C1B2
	.align 2, 0
_0800C198: .4byte 0x03007630
_0800C19C:
	bl rfu_REQ_CHILD_pollConnectRecovery
	b _0800C1B2
_0800C1A2:
	bl rfu_REQ_CHILD_endConnectRecovery
	b _0800C1B2
_0800C1A8:
	bl rfu_REQ_changeMasterSlave
	b _0800C1B2
_0800C1AE:
	bl rfu_REQ_stopMode
_0800C1B2:
	bl rfu_waitREQComplete
	ldr r1, _0800C1F8
	movs r0, #0
	strb r0, [r1, #0xe]
_0800C1BC:
	ldr r0, _0800C1F8
	ldrb r0, [r0, #4]
	subs r0, #0x12
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0800C1CC
	b _0800C032
_0800C1CC:
	ldr r0, _0800C1FC
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800C1E2
	movs r0, #0
	bl sub_0800BE28
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C1F2
_0800C1E2:
	bl sub_0800C9F0
	bl sub_0800CC14
	bl sub_0800CD24
	bl sub_0800CEF0
_0800C1F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C1F8: .4byte 0x030041E0
_0800C1FC: .4byte 0x03007630
	thumb_func_end sub_0800C008

	thumb_func_start sub_0800C200
sub_0800C200: @ 0x0800C200
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _0800C224
	ldrb r1, [r0, #7]
	adds r4, r0, #0
	cmp r1, #5
	bne _0800C22A
	movs r2, #1
	strb r2, [r4, #6]
	strb r1, [r4, #4]
	ldrh r0, [r4, #0x1c]
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800C228
	movs r0, #6
	strb r0, [r4, #7]
	b _0800C22A
	.align 2, 0
_0800C224: .4byte 0x030041E0
_0800C228:
	strb r2, [r4, #7]
_0800C22A:
	ldrb r0, [r4, #7]
	cmp r0, #1
	bne _0800C254
	strb r0, [r4, #6]
	movs r0, #5
	strb r0, [r4, #4]
	adds r0, r3, #0
	movs r1, #0x8c
	bl __umodsi3
	strh r0, [r4, #0x1a]
	movs r1, #0x8c
	subs r1, r1, r0
	strh r1, [r4, #0x1c]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800C250
	movs r0, #2
	b _0800C252
_0800C250:
	movs r0, #3
_0800C252:
	strb r0, [r4, #7]
_0800C254:
	ldrb r0, [r4, #7]
	cmp r0, #3
	bne _0800C26A
	movs r0, #0
	strb r0, [r4, #6]
	movs r0, #0x28
	strh r0, [r4, #0x1a]
	movs r0, #4
	strb r0, [r4, #7]
	movs r0, #9
	strb r0, [r4, #4]
_0800C26A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0800C200

	thumb_func_start sub_0800C270
sub_0800C270: @ 0x0800C270
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _0800C2A8
	ldrb r1, [r0, #0xe]
	adds r7, r0, #0
	cmp r1, #0
	bne _0800C28E
	b _0800C754
_0800C28E:
	movs r0, #0
	strb r0, [r7, #0xe]
	mov r0, r8
	subs r0, #0x10
	cmp r0, #0x2d
	bls _0800C29C
	b _0800C746
_0800C29C:
	lsls r0, r0, #2
	ldr r1, _0800C2AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800C2A8: .4byte 0x030041E0
_0800C2AC: .4byte 0x0800C2B0
_0800C2B0: @ jump table
	.4byte _0800C368 @ case 0
	.4byte _0800C746 @ case 1
	.4byte _0800C746 @ case 2
	.4byte _0800C746 @ case 3
	.4byte _0800C746 @ case 4
	.4byte _0800C746 @ case 5
	.4byte _0800C394 @ case 6
	.4byte _0800C380 @ case 7
	.4byte _0800C746 @ case 8
	.4byte _0800C3A8 @ case 9
	.4byte _0800C3B8 @ case 10
	.4byte _0800C3DC @ case 11
	.4byte _0800C3FC @ case 12
	.4byte _0800C41C @ case 13
	.4byte _0800C48C @ case 14
	.4byte _0800C4BE @ case 15
	.4byte _0800C4D4 @ case 16
	.4byte _0800C51C @ case 17
	.4byte _0800C746 @ case 18
	.4byte _0800C746 @ case 19
	.4byte _0800C746 @ case 20
	.4byte _0800C746 @ case 21
	.4byte _0800C746 @ case 22
	.4byte _0800C694 @ case 23
	.4byte _0800C746 @ case 24
	.4byte _0800C746 @ case 25
	.4byte _0800C746 @ case 26
	.4byte _0800C746 @ case 27
	.4byte _0800C746 @ case 28
	.4byte _0800C746 @ case 29
	.4byte _0800C746 @ case 30
	.4byte _0800C746 @ case 31
	.4byte _0800C746 @ case 32
	.4byte _0800C746 @ case 33
	.4byte _0800C58C @ case 34
	.4byte _0800C5D8 @ case 35
	.4byte _0800C620 @ case 36
	.4byte _0800C746 @ case 37
	.4byte _0800C746 @ case 38
	.4byte _0800C746 @ case 39
	.4byte _0800C746 @ case 40
	.4byte _0800C746 @ case 41
	.4byte _0800C746 @ case 42
	.4byte _0800C746 @ case 43
	.4byte _0800C746 @ case 44
	.4byte _0800C734 @ case 45
_0800C368:
	cmp r6, #0
	beq _0800C36E
	b _0800C746
_0800C36E:
	ldr r0, _0800C37C
	ldrb r1, [r0, #5]
	strb r1, [r0, #4]
	movs r1, #4
	strb r1, [r0, #5]
	b _0800C746
	.align 2, 0
_0800C37C: .4byte 0x030041E0
_0800C380:
	cmp r6, #0
	beq _0800C386
	b _0800C746
_0800C386:
	ldr r0, _0800C390
	ldrb r1, [r0, #5]
	strb r1, [r0, #4]
	strb r6, [r0, #5]
	b _0800C746
	.align 2, 0
_0800C390: .4byte 0x030041E0
_0800C394:
	cmp r6, #0
	beq _0800C39A
	b _0800C746
_0800C39A:
	ldr r0, _0800C3A4
	strb r6, [r0, #5]
	strb r6, [r0, #4]
	movs r0, #0
	b _0800C6B2
	.align 2, 0
_0800C3A4: .4byte 0x030041E0
_0800C3A8:
	cmp r6, #0
	beq _0800C3AE
	b _0800C746
_0800C3AE:
	ldr r1, _0800C3B4
	movs r0, #6
	b _0800C4C8
	.align 2, 0
_0800C3B4: .4byte 0x030041E0
_0800C3B8:
	ldr r1, _0800C3D8
	ldrh r0, [r1, #0x1a]
	cmp r0, #0
	bne _0800C3C2
	b _0800C746
_0800C3C2:
	subs r0, #1
	strh r0, [r1, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800C3CE
	b _0800C746
_0800C3CE:
	movs r0, #7
	strb r0, [r1, #4]
	movs r0, #8
	strb r0, [r1, #5]
	b _0800C746
	.align 2, 0
_0800C3D8: .4byte 0x030041E0
_0800C3DC:
	cmp r6, #0
	beq _0800C3E2
	b _0800C746
_0800C3E2:
	ldr r0, _0800C3F8
	ldrb r1, [r0, #5]
	strb r1, [r0, #4]
	strb r6, [r0, #5]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _0800C3F2
	b _0800C746
_0800C3F2:
	movs r0, #0x13
	b _0800C6B2
	.align 2, 0
_0800C3F8: .4byte 0x030041E0
_0800C3FC:
	cmp r6, #0
	beq _0800C402
	b _0800C746
_0800C402:
	ldrb r0, [r7, #0xb]
	cmp r0, #1
	bne _0800C412
	ldrh r0, [r7, #0x1a]
	cmp r0, #1
	bls _0800C412
	subs r0, #1
	strh r0, [r7, #0x1a]
_0800C412:
	ldr r1, _0800C418
	movs r0, #0xa
	b _0800C4C8
	.align 2, 0
_0800C418: .4byte 0x030041E0
_0800C41C:
	cmp r6, #0
	bne _0800C462
	bl sub_0800CD50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	strb r0, [r1]
	ldr r4, _0800C484
	strh r0, [r4, #0x14]
	cmp r0, #0
	beq _0800C43C
	movs r0, #0x20
	movs r1, #1
	bl sub_0800CDC8
_0800C43C:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _0800C462
	ldrh r0, [r4, #0x1a]
	cmp r0, #1
	beq _0800C462
	ldr r0, _0800C488
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #4
	bne _0800C462
	bl rfu_REQ_endSearchParent
	bl rfu_waitREQComplete
	movs r0, #9
	strb r0, [r4, #4]
	movs r0, #1
	strb r0, [r4, #0xb]
_0800C462:
	ldr r1, _0800C484
	ldrh r0, [r1, #0x1a]
	cmp r0, #0
	bne _0800C46C
	b _0800C746
_0800C46C:
	subs r0, #1
	strh r0, [r1, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800C478
	b _0800C746
_0800C478:
	movs r0, #0xb
	strb r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #5]
	b _0800C746
	.align 2, 0
_0800C484: .4byte 0x030041E0
_0800C488: .4byte 0x03007630
_0800C48C:
	cmp r6, #0
	beq _0800C492
	b _0800C746
_0800C492:
	ldr r2, _0800C4AC
	ldrb r0, [r2, #5]
	strb r0, [r2, #4]
	ldrb r1, [r2, #7]
	cmp r1, #0
	bne _0800C4B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C4A6
	b _0800C746
_0800C4A6:
	movs r0, #0x21
	b _0800C6B2
	.align 2, 0
_0800C4AC: .4byte 0x030041E0
_0800C4B0:
	cmp r1, #7
	bne _0800C4B6
	b _0800C746
_0800C4B6:
	movs r0, #5
	strb r0, [r2, #4]
	strb r0, [r2, #7]
	b _0800C746
_0800C4BE:
	cmp r6, #0
	beq _0800C4C4
	b _0800C746
_0800C4C4:
	ldr r1, _0800C4D0
	movs r0, #0xd
_0800C4C8:
	strb r0, [r1, #5]
	strb r0, [r1, #4]
	b _0800C746
	.align 2, 0
_0800C4D0: .4byte 0x030041E0
_0800C4D4:
	cmp r6, #0
	bne _0800C4F8
	ldr r4, _0800C514
	mov r0, sp
	adds r1, r4, #0
	bl rfu_getConnectParentStatus
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800C4F8
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800C4F8
	adds r1, r4, #0
	subs r1, #0x10
	movs r0, #0xe
	strb r0, [r1, #4]
_0800C4F8:
	ldr r1, _0800C518
	ldrh r0, [r1, #0x1a]
	cmp r0, #0
	bne _0800C502
	b _0800C746
_0800C502:
	subs r0, #1
	strh r0, [r1, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800C50E
	b _0800C746
_0800C50E:
	movs r0, #0xe
	strb r0, [r1, #4]
	b _0800C746
	.align 2, 0
_0800C514: .4byte 0x030041F0
_0800C518: .4byte 0x030041E0
_0800C51C:
	cmp r6, #0
	beq _0800C522
	b _0800C746
_0800C522:
	ldr r4, _0800C554
	mov r0, sp
	adds r1, r4, #0
	bl rfu_getConnectParentStatus
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800C534
	b _0800C746
_0800C534:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800C558
	adds r1, r4, #0
	subs r1, #0x10
	movs r0, #0x13
	strb r0, [r1, #4]
	movs r0, #0xf
	strb r0, [r1, #5]
	movs r0, #0x22
	strh r0, [r1, #0x1e]
	ldrb r0, [r1, #0x10]
	strh r0, [r1, #0x14]
	b _0800C578
	.align 2, 0
_0800C554: .4byte 0x030041F0
_0800C558:
	adds r1, r4, #0
	subs r1, #0x10
	strb r6, [r1, #5]
	strb r6, [r1, #4]
	movs r0, #0x23
	strh r0, [r1, #0x1e]
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, #0x14]
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _0800C578
	movs r0, #3
	strb r0, [r1, #7]
	movs r0, #9
	strb r0, [r1, #4]
_0800C578:
	ldr r4, _0800C588
	ldrb r0, [r4, #0x1e]
	movs r1, #1
	bl sub_0800CDC8
	movs r0, #0
	strh r0, [r4, #0x1e]
	b _0800C746
	.align 2, 0
_0800C588: .4byte 0x030041E0
_0800C58C:
	cmp r6, #0
	beq _0800C592
	b _0800C746
_0800C592:
	ldr r2, _0800C5D4
	ldr r3, [r2]
	ldrb r0, [r3, #3]
	movs r1, #0
	strh r0, [r7, #0x14]
	movs r0, #0x11
	strb r0, [r7, #5]
	strb r0, [r7, #4]
	strb r1, [r7, #0x10]
	ldrb r0, [r3, #3]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C5B0
	b _0800C746
_0800C5B0:
	adds r1, r7, #0
	movs r3, #1
_0800C5B4:
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0800C5C4
	b _0800C746
_0800C5C4:
	ldr r0, [r2]
	ldrb r0, [r0, #3]
	ldrb r4, [r7, #0x10]
	asrs r0, r4
	ands r0, r3
	cmp r0, #0
	beq _0800C5B4
	b _0800C746
	.align 2, 0
_0800C5D4: .4byte 0x03007630
_0800C5D8:
	cmp r6, #0
	bne _0800C5F6
	mov r0, sp
	bl rfu_CHILD_getConnectRecoveryStatus
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800C5F6
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0800C5F6
	ldr r1, _0800C61C
	movs r0, #0x12
	strb r0, [r1, #4]
_0800C5F6:
	ldr r2, _0800C61C
	ldrb r0, [r2, #0x10]
	lsls r0, r0, #1
	adds r1, r2, #0
	adds r1, #0x34
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800C60A
	b _0800C746
_0800C60A:
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800C616
	b _0800C746
_0800C616:
	movs r0, #0x12
	strb r0, [r2, #4]
	b _0800C746
	.align 2, 0
_0800C61C: .4byte 0x030041E0
_0800C620:
	cmp r6, #0
	beq _0800C626
	b _0800C746
_0800C626:
	mov r0, sp
	bl rfu_CHILD_getConnectRecoveryStatus
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800C634
	b _0800C746
_0800C634:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800C650
	ldr r1, _0800C64C
	movs r0, #0x13
	strb r0, [r1, #4]
	movs r0, #0x16
	strb r0, [r1, #5]
	movs r0, #0x32
	strh r0, [r1, #0x1e]
	b _0800C664
	.align 2, 0
_0800C64C: .4byte 0x030041E0
_0800C650:
	ldr r4, _0800C68C
	strb r6, [r4, #5]
	strb r6, [r4, #4]
	ldr r0, _0800C690
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	bl sub_0800CDF0
	movs r0, #0x33
	strh r0, [r4, #0x1e]
_0800C664:
	ldr r5, _0800C68C
	ldrb r0, [r5, #0x10]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x34
	adds r0, r0, r1
	movs r1, #0
	movs r4, #0
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x30
	strb r1, [r0]
	strb r1, [r5, #0xa]
	ldrb r0, [r5, #0x1e]
	movs r1, #1
	bl sub_0800CDC8
	strh r4, [r5, #0x1e]
	b _0800C746
	.align 2, 0
_0800C68C: .4byte 0x030041E0
_0800C690: .4byte 0x03007630
_0800C694:
	cmp r6, #0
	bne _0800C746
	ldr r5, _0800C6BC
	ldrb r1, [r5, #5]
	adds r0, r1, #0
	cmp r0, #0x16
	bne _0800C6C0
	ldrb r0, [r5, #0x11]
	strb r0, [r5, #4]
	ldrb r0, [r5, #0x12]
	strb r0, [r5, #5]
	ldrb r0, [r5, #2]
	movs r0, #1
	strb r0, [r5, #2]
	movs r0, #0x41
_0800C6B2:
	movs r1, #0
	bl sub_0800CDC8
	b _0800C746
	.align 2, 0
_0800C6BC: .4byte 0x030041E0
_0800C6C0:
	cmp r0, #0xf
	bne _0800C746
	strb r1, [r5, #4]
	ldrb r0, [r5, #2]
	movs r4, #1
	strb r4, [r5, #2]
	movs r0, #0x41
	movs r1, #0
	bl sub_0800CDC8
	adds r1, r5, #0
	adds r1, #0x24
	ldrb r0, [r5, #0x10]
	lsls r4, r0
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
	ldrb r0, [r5, #0x10]
	lsls r0, r0, #1
	adds r1, #4
	adds r0, r0, r1
	ldrh r1, [r5, #0x26]
	movs r7, #0
	strh r1, [r0]
	ldrb r1, [r5, #0x10]
	movs r0, #4
	bl rfu_clearSlot
	mov r4, sp
	ldrb r0, [r5, #0x10]
	movs r1, #0xe
	bl rfu_NI_CHILD_setSendGameName
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C746
	strb r7, [r5, #5]
	strb r7, [r5, #4]
	bl sub_0800D0CC
	ldr r0, _0800C730
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	ldrb r0, [r0, #3]
	orrs r0, r1
	bl sub_0800CDF0
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r5, #0x14]
	movs r0, #0x25
	movs r1, #1
	bl sub_0800CDC8
	b _0800C746
	.align 2, 0
_0800C730: .4byte 0x03007630
_0800C734:
	cmp r6, #0
	bne _0800C746
	ldr r0, _0800C750
	strb r6, [r0, #5]
	strb r6, [r0, #4]
	movs r0, #0x42
	movs r1, #0
	bl sub_0800CDC8
_0800C746:
	ldr r1, _0800C750
	movs r0, #1
	strb r0, [r1, #0xe]
	b _0800C7A2
	.align 2, 0
_0800C750: .4byte 0x030041E0
_0800C754:
	cmp r6, #3
	bne _0800C7A2
	ldrb r0, [r7, #0xf]
	cmp r0, #0
	beq _0800C7A2
	mov r3, r8
	cmp r3, #0x24
	beq _0800C76C
	cmp r3, #0x26
	beq _0800C76C
	cmp r3, #0x27
	bne _0800C7A2
_0800C76C:
	bl rfu_REQ_RFUStatus
	bl rfu_waitREQComplete
	mov r0, sp
	bl rfu_getRFUStatus
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800C7A2
	ldr r4, _0800C7B8
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800C7A2
	bl rfu_getSTWIRecvBuffer
	ldr r1, [r4]
	ldrb r1, [r1, #2]
	strb r1, [r0, #4]
	movs r1, #1
	strb r1, [r0, #5]
	movs r0, #0x29
	bl sub_0800BE28
	movs r6, #0
_0800C7A2:
	mov r4, r8
	cmp r4, #0x26
	bne _0800C7AA
	b _0800C8BE
_0800C7AA:
	cmp r4, #0x26
	bgt _0800C7BC
	cmp r4, #0x10
	bne _0800C7B4
	b _0800C8DC
_0800C7B4:
	b _0800C8FA
	.align 2, 0
_0800C7B8: .4byte 0x03007630
_0800C7BC:
	mov r0, r8
	cmp r0, #0x30
	beq _0800C7CA
	cmp r0, #0x3d
	bne _0800C7C8
	b _0800C8DC
_0800C7C8:
	b _0800C8FA
_0800C7CA:
	cmp r6, #0
	beq _0800C7D0
	b _0800C8FE
_0800C7D0:
	bl rfu_getSTWIRecvBuffer
	ldr r4, _0800C880
	ldrb r0, [r0, #8]
	strh r0, [r4, #0x14]
	bl sub_0800CE14
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	cmp r1, #0
	beq _0800C826
	ldrb r0, [r4, #0x14]
	adds r3, r1, #0
	bics r3, r0
	adds r0, r3, #0
	strb r0, [r2]
	movs r3, #0
	adds r7, r4, #0
	adds r1, r7, #0
	movs r5, #1
	adds r4, r1, #0
	adds r4, #0x34
	movs r2, #0
_0800C800:
	ldrh r0, [r1, #0x14]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	beq _0800C810
	lsls r0, r3, #1
	adds r0, r0, r4
	strh r2, [r0]
_0800C810:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800C800
	ldr r1, _0800C880
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0800C826
	strb r0, [r1, #5]
	strb r0, [r1, #4]
_0800C826:
	mov r3, sp
	ldr r1, _0800C880
	ldrb r2, [r1]
	ldrb r0, [r1, #0x14]
	ands r0, r2
	strb r0, [r3]
	movs r3, #0
	adds r7, r1, #0
	ldr r2, _0800C884
	mov r1, sp
	movs r5, #1
	adds r4, r7, #0
_0800C83E:
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	beq _0800C852
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0800C852
	subs r0, #1
	strb r0, [r7, #1]
_0800C852:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800C83E
	ldrb r1, [r7, #0x14]
	ldrb r0, [r7]
	bics r0, r1
	strb r0, [r7]
	ldrb r1, [r7, #7]
	cmp r1, #0
	beq _0800C89C
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0800C8AE
	cmp r1, #8
	bne _0800C888
	ldrh r0, [r7, #0x1c]
	strh r0, [r7, #0x1a]
	movs r0, #6
	strb r0, [r7, #7]
	b _0800C89A
	.align 2, 0
_0800C880: .4byte 0x030041E0
_0800C884: .4byte 0x03007630
_0800C888:
	ldrb r0, [r7, #4]
	subs r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0800C89C
	movs r0, #1
	strb r0, [r7, #7]
	movs r0, #5
_0800C89A:
	strb r0, [r7, #4]
_0800C89C:
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0800C8AE
	ldrb r0, [r7, #4]
	cmp r0, #0
	bne _0800C8AE
	movs r0, #0xff
	strb r0, [r7, #6]
_0800C8AE:
	ldrb r0, [r7, #0xe]
	cmp r0, #0
	bne _0800C8FA
	movs r0, #0x40
	movs r1, #1
	bl sub_0800CDC8
	b _0800C8FA
_0800C8BE:
	bl sub_0800CCC8
	ldr r0, _0800C8D8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0800C8FA
	movs r0, #0x50
	movs r1, #0
	bl sub_0800CDC8
	b _0800C8FA
	.align 2, 0
_0800C8D8: .4byte 0x03007630
_0800C8DC:
	cmp r6, #0
	bne _0800C8FE
	ldr r0, _0800C928
	strb r6, [r0, #0xd]
	strb r6, [r0, #1]
	strb r6, [r0]
	movs r1, #0xff
	strb r1, [r0, #6]
	bl sub_0800D0CC
	mov r4, r8
	cmp r4, #0x3d
	bne _0800C8FA
	bl sub_0800BA5C
_0800C8FA:
	cmp r6, #0
	beq _0800C94E
_0800C8FE:
	ldr r7, _0800C928
	mov r0, r8
	cmp r0, #0x1c
	bne _0800C930
	cmp r6, #0
	beq _0800C930
	ldrb r0, [r7, #7]
	cmp r0, #4
	bne _0800C930
	ldr r2, _0800C92C
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r2]
	movs r0, #0xf
	strb r0, [r1, #2]
	bl sub_0800CDF0
	bl rfu_waitREQComplete
	b _0800C960
	.align 2, 0
_0800C928: .4byte 0x030041E0
_0800C92C: .4byte 0x03007630
_0800C930:
	movs r1, #0
	mov r3, r8
	strh r3, [r7, #0x14]
	strh r6, [r7, #0x16]
	ldrb r0, [r7, #0xe]
	cmp r0, #0
	beq _0800C942
	strb r1, [r7, #5]
	strb r1, [r7, #4]
_0800C942:
	movs r0, #0xf0
	movs r1, #2
	bl sub_0800CDC8
	bl sub_0800D0CC
_0800C94E:
	mov r4, r8
	cmp r4, #0xff
	bne _0800C960
	movs r0, #0xf2
	movs r1, #0
	bl sub_0800CDC8
	bl sub_0800D0CC
_0800C960:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0800C270

	thumb_func_start sub_0800C96C
sub_0800C96C: @ 0x0800C96C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _0800C9A0
	ldrb r7, [r4, #0xe]
	movs r0, #0
	strb r0, [r4, #0xe]
	movs r0, #1
	strb r0, [r4, #0xf]
	ldr r0, _0800C9A4
	ldr r0, [r0]
	ldrb r5, [r0]
	cmp r5, #0
	bne _0800C9A8
	adds r0, r6, #0
	bl sub_0800BE28
	ldrb r0, [r4, #2]
	cmp r0, #1
	beq _0800C9C0
	bl sub_0800D0CC
	strb r5, [r4, #0xf]
	strb r7, [r4, #0xe]
	b _0800C9E4
	.align 2, 0
_0800C9A0: .4byte 0x030041E0
_0800C9A4: .4byte 0x03007630
_0800C9A8:
	mov r0, sp
	bl rfu_UNI_PARENT_getDRAC_ACK
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800C9C0
	mov r1, sp
	ldrb r0, [r4, #3]
	ldrb r1, [r1]
	orrs r0, r1
	ldrb r1, [r4, #3]
	strb r0, [r4, #3]
_0800C9C0:
	ldr r4, _0800C9EC
	ldr r1, [r4, #0x44]
	cmp r1, #0
	beq _0800C9DC
	adds r0, r6, #0
	bl _call_via_r1
	bl rfu_waitREQComplete
	ldrb r0, [r4, #2]
	cmp r0, #2
	bne _0800C9DC
	bl sub_0800D0CC
_0800C9DC:
	ldr r1, _0800C9EC
	movs r0, #0
	strb r0, [r1, #0xf]
	strb r7, [r1, #0xe]
_0800C9E4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C9EC: .4byte 0x030041E0
	thumb_func_end sub_0800C96C

	thumb_func_start sub_0800C9F0
sub_0800C9F0: @ 0x0800C9F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _0800CA74
	ldrb r0, [r1, #4]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #3
	bls _0800CA0E
	b _0800CC02
_0800CA0E:
	ldr r0, _0800CA78
	ldr r2, [r0]
	ldrb r1, [r2, #2]
	ldrb r0, [r3, #0xc]
	adds r4, r1, #0
	eors r4, r0
	ands r4, r1
	ldrb r0, [r2, #7]
	bics r4, r0
	mov r8, r4
	strb r1, [r3, #0xc]
	cmp r4, #0
	beq _0800CA36
	strh r4, [r3, #0x14]
	movs r0, #0x10
	movs r1, #1
	str r3, [sp, #4]
	bl sub_0800CDC8
	ldr r3, [sp, #4]
_0800CA36:
	movs r0, #0
	str r0, [sp]
	movs r6, #0
	adds r7, r3, #0
	movs r1, #0x24
	adds r1, r1, r3
	mov sb, r1
_0800CA44:
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r6
	lsrs r4, r0, #0x18
	movs r5, #0
	mov r0, r8
	ands r0, r4
	cmp r0, #0
	beq _0800CA96
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x28
	adds r1, r1, r0
	ldrh r0, [r7, #0x26]
	strh r0, [r1]
	mov r2, sb
	ldrb r1, [r2]
	adds r0, r4, #0
	orrs r0, r1
	strb r0, [r2]
	adds r6, #1
	mov sl, r6
	b _0800CB4C
	.align 2, 0
_0800CA74: .4byte 0x030041E0
_0800CA78: .4byte 0x03007630
_0800CA7C:
	ldrb r1, [r7]
	adds r0, r4, #0
	orrs r0, r1
	strb r0, [r7]
	ldrb r0, [r7, #1]
	adds r0, #1
	strb r0, [r7, #1]
	ldr r0, [sp]
	orrs r0, r4
	str r0, [sp]
	movs r0, #1
	orrs r5, r0
	b _0800CAE0
_0800CA96:
	mov r1, sb
	ldrb r0, [r1]
	ands r0, r4
	adds r2, r6, #1
	mov sl, r2
	cmp r0, #0
	beq _0800CB4C
	ldr r0, _0800CAF0
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r1, [r1]
	ldrh r0, [r1, #0x34]
	cmp r0, #0x46
	bne _0800CAFC
	adds r0, r1, #0
	adds r0, #0x61
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800CB14
	movs r5, #2
	ldr r3, [r3, #0x20]
	ldrh r2, [r3]
	ldr r0, _0800CAF4
	cmp r2, r0
	beq _0800CAE0
	ldr r0, _0800CAF8
	ldr r0, [r0]
	lsls r1, r6, #5
	adds r0, r0, r1
	ldrh r0, [r0, #0x18]
	ldr r1, _0800CAF4
_0800CAD4:
	cmp r0, r2
	beq _0800CA7C
	adds r3, #2
	ldrh r2, [r3]
	cmp r2, r1
	bne _0800CAD4
_0800CAE0:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _0800CB14
	movs r0, #4
	orrs r5, r0
	b _0800CB14
	.align 2, 0
_0800CAF0: .4byte 0x03007620
_0800CAF4: .4byte 0x0000FFFF
_0800CAF8: .4byte 0x03007630
_0800CAFC:
	lsls r1, r6, #1
	adds r0, r3, #0
	adds r0, #0x28
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r1, _0800CBD0
	ands r0, r1
	cmp r0, #0
	bne _0800CB14
	movs r5, #6
_0800CB14:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800CB3A
	mov r2, sb
	ldrb r0, [r2]
	bics r0, r4
	movs r2, #0
	mov r1, sb
	strb r0, [r1]
	lsls r0, r6, #1
	adds r1, r7, #0
	adds r1, #0x28
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #8
	adds r1, r6, #0
	bl rfu_clearSlot
_0800CB3A:
	movs r0, #4
	ands r5, r0
	ldr r3, _0800CBD4
	cmp r5, #0
	beq _0800CB4C
	ldrb r1, [r7, #0xd]
	adds r0, r4, #0
	orrs r0, r1
	strb r0, [r7, #0xd]
_0800CB4C:
	mov r2, sl
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bhi _0800CB58
	b _0800CA44
_0800CB58:
	ldr r4, [sp]
	cmp r4, #0
	beq _0800CB6A
	ldr r0, _0800CBD4
	strh r4, [r0, #0x14]
	movs r0, #0x11
	movs r1, #1
	bl sub_0800CDC8
_0800CB6A:
	ldr r1, _0800CBD4
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _0800CBA6
	movs r5, #1
	ldr r0, _0800CBD8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _0800CB8A
	ldrb r0, [r1, #3]
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, r1
	beq _0800CB8A
	movs r5, #0
_0800CB8A:
	cmp r5, #0
	beq _0800CBA6
	ldr r4, _0800CBD4
	ldrb r0, [r4, #0xd]
	bl sub_0800CDF0
	ldrb r0, [r4, #0xd]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r4, #0xd]
	movs r0, #0x12
	movs r1, #1
	bl sub_0800CDC8
_0800CBA6:
	ldr r0, _0800CBD4
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0
	bne _0800CC02
	ldrb r0, [r3, #4]
	cmp r0, #8
	bne _0800CC02
	ldrb r0, [r3, #7]
	cmp r0, #0
	bne _0800CBDC
	strb r0, [r3, #5]
	strb r0, [r3, #4]
	movs r0, #0x14
	movs r1, #0
	bl sub_0800CDC8
	b _0800CC02
	.align 2, 0
_0800CBD0: .4byte 0x0000FFFF
_0800CBD4: .4byte 0x030041E0
_0800CBD8: .4byte 0x03007630
_0800CBDC:
	cmp r0, #2
	bne _0800CBE8
	movs r0, #3
	strb r0, [r3, #7]
	movs r0, #9
	b _0800CBEE
_0800CBE8:
	movs r0, #1
	strb r0, [r3, #7]
	movs r0, #5
_0800CBEE:
	strb r0, [r3, #4]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800CC02
	movs r0, #0
	strh r0, [r3, #0x1a]
	movs r0, #8
	strb r0, [r3, #7]
	movs r0, #5
	strb r0, [r3, #4]
_0800CC02:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0800C9F0

	thumb_func_start sub_0800CC14
sub_0800CC14: @ 0x0800CC14
	push {r4, r5, r6, lr}
	ldr r1, _0800CCB8
	ldrh r0, [r1]
	adds r6, r0, #0
	movs r0, #0
	strh r0, [r1]
	ldr r4, _0800CCBC
	ldrb r0, [r4, #4]
	cmp r0, #0xf
	bne _0800CC78
	ldrb r1, [r4, #0x10]
	lsls r1, r1, #1
	adds r5, r4, #0
	adds r5, #0x28
	adds r1, r1, r5
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800CC4E
	ldr r1, _0800CCC0
	ldrb r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _0800CC78
_0800CC4E:
	bl sub_0800D0EC
	movs r0, #0x18
	strb r0, [r4, #4]
	ldrb r1, [r4, #0x10]
	movs r0, #4
	bl rfu_clearSlot
	adds r2, r4, #0
	adds r2, #0x24
	movs r1, #1
	ldrb r0, [r4, #0x10]
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldrb r0, [r4, #0x10]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0]
_0800CC78:
	ldr r0, _0800CCB8
	strh r6, [r0]
	ldr r5, _0800CCBC
	ldrb r0, [r5, #4]
	cmp r0, #0x18
	bne _0800CCB2
	ldrb r0, [r5, #2]
	cmp r0, #1
	bne _0800CC8E
	bl sub_0800D0EC
_0800CC8E:
	ldrb r0, [r5, #2]
	adds r4, r0, #0
	cmp r4, #0
	bne _0800CCB2
	strb r4, [r5, #5]
	strb r4, [r5, #4]
	ldr r0, _0800CCC4
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	ldrb r0, [r0, #3]
	orrs r0, r1
	bl sub_0800CDF0
	strh r4, [r5, #0x14]
	movs r0, #0x25
	movs r1, #1
	bl sub_0800CDC8
_0800CCB2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CCB8: .4byte 0x04000208
_0800CCBC: .4byte 0x030041E0
_0800CCC0: .4byte 0x03007620
_0800CCC4: .4byte 0x03007630
	thumb_func_end sub_0800CC14

	thumb_func_start sub_0800CCC8
sub_0800CCC8: @ 0x0800CCC8
	push {r4, r5, lr}
	ldr r5, _0800CD1C
	ldrb r0, [r5, #4]
	cmp r0, #0xf
	bne _0800CD14
	ldr r1, _0800CD20
	ldrb r2, [r5, #0x10]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #0x26
	bne _0800CD14
	movs r4, #0
	strb r4, [r5, #5]
	strb r4, [r5, #4]
	movs r0, #4
	adds r1, r2, #0
	bl rfu_clearSlot
	adds r2, r5, #0
	adds r2, #0x24
	movs r1, #1
	ldrb r0, [r5, #0x10]
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldrb r0, [r5, #0x10]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x28
	adds r0, r0, r1
	strh r4, [r0]
	movs r0, #0x24
	movs r1, #0
	bl sub_0800CDC8
_0800CD14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CD1C: .4byte 0x030041E0
_0800CD20: .4byte 0x03007620
	thumb_func_end sub_0800CCC8

	thumb_func_start sub_0800CD24
sub_0800CD24: @ 0x0800CD24
	push {lr}
	ldr r1, _0800CD4C
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0800CD48
	ldrb r0, [r1, #0xa]
	cmp r0, #1
	bne _0800CD48
	ldrb r0, [r1, #4]
	strb r0, [r1, #0x11]
	ldrb r0, [r1, #5]
	strb r0, [r1, #0x12]
	movs r0, #0x10
	strb r0, [r1, #4]
	movs r0, #0x11
	strb r0, [r1, #5]
	movs r0, #2
	strb r0, [r1, #0xa]
_0800CD48:
	pop {r0}
	bx r0
	.align 2, 0
_0800CD4C: .4byte 0x030041E0
	thumb_func_end sub_0800CD24

	thumb_func_start sub_0800CD50
sub_0800CD50: @ 0x0800CD50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	movs r5, #0
	ldr r1, _0800CDBC
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r6, r0
	bhs _0800CDAC
	mov r8, r0
	ldr r0, _0800CDC0
	mov sl, r0
	mov sb, r1
_0800CD70:
	mov r1, sl
	ldr r3, [r1, #0x20]
	ldrh r2, [r3]
	adds r0, r5, #1
	mov ip, r0
	ldr r1, _0800CDC4
	cmp r2, r1
	beq _0800CDA2
	mov r1, sb
	ldr r0, [r1]
	lsls r1, r5, #5
	adds r0, r0, r1
	ldrh r4, [r0, #0x18]
	ldr r7, _0800CDC4
	movs r1, #1
	lsls r1, r5
_0800CD90:
	cmp r4, r2
	bne _0800CD9A
	orrs r6, r1
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
_0800CD9A:
	adds r3, #2
	ldrh r2, [r3]
	cmp r2, r7
	bne _0800CD90
_0800CDA2:
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r8
	blo _0800CD70
_0800CDAC:
	adds r0, r6, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CDBC: .4byte 0x03007630
_0800CDC0: .4byte 0x030041E0
_0800CDC4: .4byte 0x0000FFFF
	thumb_func_end sub_0800CD50

	thumb_func_start sub_0800CDC8
sub_0800CDC8: @ 0x0800CDC8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r4, _0800CDEC
	ldr r2, [r4, #0x40]
	cmp r2, #0
	beq _0800CDDE
	bl _call_via_r2
_0800CDDE:
	movs r0, #0
	strh r0, [r4, #0x16]
	strh r0, [r4, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CDEC: .4byte 0x030041E0
	thumb_func_end sub_0800CDC8

	thumb_func_start sub_0800CDF0
sub_0800CDF0: @ 0x0800CDF0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0800CE10
	ldrb r5, [r4, #0xe]
	movs r1, #1
	strb r1, [r4, #0xe]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	strb r5, [r4, #0xe]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CE10: .4byte 0x030041E0
	thumb_func_end sub_0800CDF0

	thumb_func_start sub_0800CE14
sub_0800CE14: @ 0x0800CE14
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0800CEE0
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0800CE5C
	movs r4, #0
_0800CE26:
	ldr r1, _0800CEE4
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0800CE52
	ldrb r1, [r2, #0x1a]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0800CE52
	adds r2, r1, #0
	bics r2, r5
	movs r0, #0x20
	adds r1, r4, #0
	bl rfu_changeSendTarget
_0800CE52:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0800CE26
_0800CE5C:
	ldr r0, _0800CEE0
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _0800CE9A
	movs r4, #0
_0800CE68:
	ldr r1, _0800CEE4
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldrh r0, [r2, #0x34]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0800CE90
	adds r0, r2, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0800CE90
	adds r0, r4, #0
	bl rfu_NI_stopReceivingData
_0800CE90:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0800CE68
_0800CE9A:
	ldr r0, _0800CEE0
	ldr r3, [r0]
	ldrb r2, [r3, #6]
	cmp r2, #0
	beq _0800CED8
	mvns r1, r5
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #6]
	movs r4, #0
	ldr r7, _0800CEE8
	ldr r6, _0800CEEC
_0800CEB2:
	lsls r0, r4, #2
	adds r0, r0, r7
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r0, r6
	bne _0800CECE
	ldrb r3, [r2, #3]
	adds r0, r5, #0
	ands r0, r3
	cmp r0, #0
	beq _0800CECE
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #3]
_0800CECE:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0800CEB2
_0800CED8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CEE0: .4byte 0x03007630
_0800CEE4: .4byte 0x03007620
_0800CEE8: .4byte 0x03007610
_0800CEEC: .4byte 0x00008024
	thumb_func_end sub_0800CE14

	thumb_func_start sub_0800CEF0
sub_0800CEF0: @ 0x0800CEF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0800CFDC
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _0800CFCC
	ldr r0, _0800CFE0
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0800CF90
	movs r6, #0
_0800CF10:
	ldr r3, _0800CFE4
	lsls r2, r6, #2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r1, r0
	adds r7, r2, #0
	adds r0, r6, #1
	mov sb, r0
	cmp r1, #0
	beq _0800CF86
	movs r5, #0
	movs r4, #0
	movs r1, #1
	mov r8, r1
	mov sl, r3
_0800CF36:
	adds r0, r7, r3
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	asrs r0, r4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0800CF60
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r1, _0800CFDC
	ldrh r0, [r0, #2]
	ldrh r1, [r1, #0x18]
	cmp r0, r1
	bls _0800CF60
	mov r0, r8
	lsls r0, r4
	orrs r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_0800CF60:
	cmp r5, #0
	beq _0800CF7C
	mov r1, sl
	adds r0, r7, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	adds r2, r5, #0
	eors r2, r0
	movs r0, #0x20
	adds r1, r6, #0
	str r3, [sp]
	bl rfu_changeSendTarget
	ldr r3, [sp]
_0800CF7C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0800CF36
_0800CF86:
	mov r3, sb
	lsls r0, r3, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _0800CF10
_0800CF90:
	ldr r0, _0800CFE0
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _0800CFCC
	movs r6, #0
_0800CF9C:
	ldr r1, _0800CFE4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldrh r0, [r2, #0x34]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0800CFC2
	ldr r1, _0800CFDC
	ldrh r0, [r2, #0x36]
	ldrh r1, [r1, #0x18]
	cmp r0, r1
	bls _0800CFC2
	adds r0, r6, #0
	bl rfu_NI_stopReceivingData
_0800CFC2:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _0800CF9C
_0800CFCC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CFDC: .4byte 0x030041E0
_0800CFE0: .4byte 0x03007630
_0800CFE4: .4byte 0x03007620
	thumb_func_end sub_0800CEF0

	thumb_func_start sub_0800CFE8
sub_0800CFE8: @ 0x0800CFE8
	push {lr}
	ldr r1, _0800CFF8
	str r0, [r1, #0x44]
	ldr r0, _0800CFFC
	bl rfu_setMSCCallback
	pop {r0}
	bx r0
	.align 2, 0
_0800CFF8: .4byte 0x030041E0
_0800CFFC: .4byte 0x0800C96D
	thumb_func_end sub_0800CFE8

	thumb_func_start sub_0800D000
sub_0800D000: @ 0x0800D000
	ldr r1, _0800D008
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
_0800D008: .4byte 0x030041E0
	thumb_func_end sub_0800D000

	thumb_func_start sub_0800D00C
sub_0800D00C: @ 0x0800D00C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _0800D030
	ldrb r1, [r0, #9]
	adds r3, r0, #0
	cmp r1, #0
	beq _0800D034
	cmp r4, #0
	bne _0800D034
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800D034
	movs r0, #5
	b _0800D044
	.align 2, 0
_0800D030: .4byte 0x030041E0
_0800D034:
	ldr r2, _0800D04C
	ldrh r1, [r2]
	movs r0, #0
	strh r0, [r2]
	strb r4, [r3, #9]
	strh r5, [r3, #0x32]
	strh r1, [r2]
	movs r0, #0
_0800D044:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800D04C: .4byte 0x04000208
	thumb_func_end sub_0800D00C

	thumb_func_start sub_0800D050
sub_0800D050: @ 0x0800D050
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0800D06C
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	ldrb r0, [r0, #5]
	orrs r0, r1
	cmp r0, #0
	bne _0800D074
	ldr r0, _0800D070
	strh r2, [r0, #0x18]
	movs r0, #0
	b _0800D084
	.align 2, 0
_0800D06C: .4byte 0x03007630
_0800D070: .4byte 0x030041E0
_0800D074:
	ldr r1, _0800D088
	movs r0, #6
	strh r0, [r1, #0x14]
	movs r0, #0xf3
	movs r1, #1
	bl sub_0800CDC8
	movs r0, #6
_0800D084:
	pop {r1}
	bx r1
	.align 2, 0
_0800D088: .4byte 0x030041E0
	thumb_func_end sub_0800D050

	thumb_func_start sub_0800D08C
sub_0800D08C: @ 0x0800D08C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, r2, #0
	ldr r1, _0800D0B4
	ldrb r0, [r1, #4]
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0800D0B8
	movs r0, #7
	strh r0, [r1, #0x14]
	movs r0, #0xf3
	movs r1, #1
	bl sub_0800CDC8
	movs r0, #7
	b _0800D0C6
	.align 2, 0
_0800D0B4: .4byte 0x030041E0
_0800D0B8:
	cmp r2, #0
	beq _0800D0C2
	movs r0, #1
	strb r0, [r1, #0xb]
	b _0800D0C4
_0800D0C2:
	strb r3, [r1, #0xb]
_0800D0C4:
	movs r0, #0
_0800D0C6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800D08C

	thumb_func_start sub_0800D0CC
sub_0800D0CC: @ 0x0800D0CC
	push {lr}
	ldr r1, _0800D0E8
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _0800D0E4
	ldrb r0, [r1, #2]
	movs r0, #0
	strb r0, [r1, #2]
	movs r0, #0x45
	movs r1, #0
	bl sub_0800CDC8
_0800D0E4:
	pop {r0}
	bx r0
	.align 2, 0
_0800D0E8: .4byte 0x030041E0
	thumb_func_end sub_0800D0CC

	thumb_func_start sub_0800D0EC
sub_0800D0EC: @ 0x0800D0EC
	push {lr}
	ldr r1, _0800D100
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0800D104
	movs r0, #0x45
	movs r1, #0
	bl sub_0800CDC8
	b _0800D110
	.align 2, 0
_0800D100: .4byte 0x030041E0
_0800D104:
	ldrb r0, [r1, #2]
	cmp r0, #1
	bne _0800D110
	ldrb r0, [r1, #2]
	movs r0, #2
	strb r0, [r1, #2]
_0800D110:
	pop {r0}
	bx r0
	thumb_func_end sub_0800D0EC

	thumb_func_start sub_0800D114
sub_0800D114: @ 0x0800D114
	push {lr}
	ldr r0, _0800D134
	ldrb r1, [r0, #7]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800D17E
	ldrb r0, [r2, #4]
	subs r0, #5
	cmp r0, #6
	bhi _0800D17E
	lsls r0, r0, #2
	ldr r1, _0800D138
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D134: .4byte 0x030041E0
_0800D138: .4byte 0x0800D13C
_0800D13C: @ jump table
	.4byte _0800D158 @ case 0
	.4byte _0800D160 @ case 1
	.4byte _0800D16A @ case 2
	.4byte _0800D16A @ case 3
	.4byte _0800D170 @ case 4
	.4byte _0800D170 @ case 5
	.4byte _0800D176 @ case 6
_0800D158:
	movs r0, #3
	strb r0, [r2, #7]
	movs r0, #9
	b _0800D17C
_0800D160:
	movs r0, #2
	strb r0, [r2, #7]
	movs r0, #1
	strh r0, [r2, #0x1a]
	b _0800D17E
_0800D16A:
	movs r0, #2
	strb r0, [r2, #7]
	b _0800D17E
_0800D170:
	movs r0, #0x28
	strh r0, [r2, #0x1a]
	b _0800D17E
_0800D176:
	movs r0, #0x28
	strh r0, [r2, #0x1a]
	movs r0, #0xa
_0800D17C:
	strb r0, [r2, #4]
_0800D17E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0800D114

	thumb_func_start sub_0800D184
sub_0800D184: @ 0x0800D184
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r0, #0
	movs r4, #0
	movs r5, #0x46
_0800D18E:
	adds r2, r0, #1
	movs r1, #0x45
	muls r0, r5, r0
	adds r0, r0, r3
	adds r0, #0x45
_0800D198:
	strb r4, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _0800D198
	adds r0, r2, #0
	cmp r0, #0x13
	ble _0800D18E
	movs r1, #0
	ldr r2, _0800D1D4
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	movs r2, #0xaf
	lsls r2, r2, #3
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _0800D1D8
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _0800D1DC
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D1D4: .4byte 0x00000579
_0800D1D8: .4byte 0x0000057A
_0800D1DC: .4byte 0x0000057B
	thumb_func_end sub_0800D184

	thumb_func_start sub_0800D1E0
sub_0800D1E0: @ 0x0800D1E0
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	movs r4, #0
_0800D1E8:
	lsls r0, r1, #3
	adds r2, r1, #1
	subs r0, r0, r1
	movs r1, #0xd
	lsls r0, r0, #1
	adds r0, r0, r3
	adds r0, #0xd
_0800D1F6:
	strb r4, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _0800D1F6
	adds r1, r2, #0
	cmp r1, #0x27
	ble _0800D1E8
	movs r1, #0
	ldr r2, _0800D230
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _0800D234
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _0800D238
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D230: .4byte 0x00000231
_0800D234: .4byte 0x00000232
_0800D238: .4byte 0x00000233
	thumb_func_end sub_0800D1E0

	thumb_func_start sub_0800D23C
sub_0800D23C: @ 0x0800D23C
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	movs r4, #0
_0800D244:
	lsls r0, r1, #8
	adds r2, r1, #1
	movs r1, #0xff
	adds r0, r0, r3
	adds r0, #0xff
_0800D24E:
	strb r4, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _0800D24E
	adds r1, r2, #0
	cmp r1, #1
	ble _0800D244
	movs r1, #0
	ldr r2, _0800D288
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _0800D28C
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _0800D290
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D288: .4byte 0x00000201
_0800D28C: .4byte 0x00000202
_0800D290: .4byte 0x00000203
	thumb_func_end sub_0800D23C

	thumb_func_start sub_0800D294
sub_0800D294: @ 0x0800D294
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0800D32C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0x13
	bhi _0800D334
	ldr r0, _0800D330
	ldrh r1, [r0]
	adds r7, r1, #0
	movs r1, #0
	strh r1, [r0]
	movs r3, #0
	movs r2, #0
_0800D2B2:
	adds r1, r6, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800D2C6
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0800D2C6
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0800D2C6:
	adds r2, #0xe
	cmp r2, #0x45
	ble _0800D2B2
	cmp r3, #5
	beq _0800D324
	movs r2, #0
	movs r0, #0xaf
	lsls r0, r0, #3
	adds r3, r5, r0
	movs r4, #0x46
_0800D2DA:
	ldrb r0, [r3]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r1, r2, r1
	adds r1, r5, r1
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, #1
	cmp r2, #0x45
	ble _0800D2DA
	movs r1, #0xaf
	lsls r1, r1, #3
	adds r4, r5, r1
	ldrb r0, [r4]
	adds r0, #1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0x14
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r0, _0800D32C
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r1, #0
	adds r0, r6, #0
	adds r0, #0x45
_0800D31C:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r6
	bge _0800D31C
_0800D324:
	ldr r0, _0800D330
	strh r7, [r0]
	b _0800D33E
	.align 2, 0
_0800D32C: .4byte 0x0000057A
_0800D330: .4byte 0x04000208
_0800D334:
	ldr r1, _0800D344
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r1, #1
	strb r1, [r0]
_0800D33E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D344: .4byte 0x0000057B
	thumb_func_end sub_0800D294

	thumb_func_start sub_0800D348
sub_0800D348: @ 0x0800D348
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0800D3D8
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0x27
	bhi _0800D3E0
	ldr r1, _0800D3DC
	ldrh r0, [r1]
	adds r7, r0, #0
	movs r0, #0
	strh r0, [r1]
	movs r2, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800D378
_0800D36A:
	adds r2, #1
	cmp r2, #0xd
	bgt _0800D378
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800D36A
_0800D378:
	cmp r2, #0xe
	beq _0800D3D0
	movs r2, #0
	movs r0, #0x8c
	lsls r0, r0, #2
	adds r3, r6, r0
_0800D384:
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r2, r0
	adds r0, r6, r0
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0xd
	ble _0800D384
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r4, r6, r1
	ldrb r0, [r4]
	adds r0, #1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0x28
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r0, _0800D3D8
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r1, #0
	adds r0, r5, #0
	adds r0, #0xd
_0800D3C8:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r5
	bge _0800D3C8
_0800D3D0:
	ldr r0, _0800D3DC
	strh r7, [r0]
	b _0800D3EA
	.align 2, 0
_0800D3D8: .4byte 0x00000232
_0800D3DC: .4byte 0x04000208
_0800D3E0:
	ldr r1, _0800D3F0
	adds r0, r6, r1
	ldrb r1, [r0]
	movs r1, #1
	strb r1, [r0]
_0800D3EA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D3F0: .4byte 0x00000233
	thumb_func_end sub_0800D348

	thumb_func_start sub_0800D3F4
sub_0800D3F4: @ 0x0800D3F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r3, r1, #0
	ldr r1, _0800D43C
	ldrh r0, [r1]
	mov r8, r0
	movs r0, #0
	strh r0, [r1]
	movs r1, #0xaf
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r7, _0800D440
	adds r4, r5, r7
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	beq _0800D424
	ldr r1, _0800D444
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800D448
_0800D424:
	movs r1, #0
	adds r0, r3, #0
	adds r0, #0x45
_0800D42A:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r3
	bge _0800D42A
	ldr r0, _0800D43C
	mov r7, r8
	strh r7, [r0]
	movs r0, #0
	b _0800D490
	.align 2, 0
_0800D43C: .4byte 0x04000208
_0800D440: .4byte 0x00000579
_0800D444: .4byte 0x0000057B
_0800D448:
	movs r2, #0
	movs r6, #0x46
_0800D44C:
	adds r1, r3, r2
	ldrb r0, [r4]
	adds r7, r0, #0
	muls r7, r6, r7
	adds r0, r7, #0
	adds r0, r2, r0
	adds r0, r5, r0
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, #1
	cmp r2, #0x45
	ble _0800D44C
	ldr r0, _0800D49C
	adds r4, r5, r0
	ldrb r0, [r4]
	adds r0, #1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0x14
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r7, _0800D4A0
	adds r1, r5, r7
	ldrb r0, [r1]
	subs r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, _0800D4A4
	mov r1, r8
	strh r1, [r0]
	movs r0, #1
_0800D490:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800D49C: .4byte 0x00000579
_0800D4A0: .4byte 0x0000057A
_0800D4A4: .4byte 0x04000208
	thumb_func_end sub_0800D3F4

	thumb_func_start sub_0800D4A8
sub_0800D4A8: @ 0x0800D4A8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, #1
	adds r4, r5, r1
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	beq _0800D4CC
	ldr r1, _0800D4D0
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D4D4
_0800D4CC:
	movs r0, #0
	b _0800D520
	.align 2, 0
_0800D4D0: .4byte 0x00000233
_0800D4D4:
	ldr r1, _0800D528
	ldrh r0, [r1]
	adds r7, r0, #0
	strh r2, [r1]
	movs r3, #0
_0800D4DE:
	adds r2, r6, r3
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r3, r0
	adds r0, r5, r0
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	cmp r3, #0xd
	ble _0800D4DE
	ldr r0, _0800D52C
	adds r4, r5, r0
	ldrb r0, [r4]
	adds r0, #1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0x28
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r0, _0800D530
	adds r1, r5, r0
	ldrb r0, [r1]
	subs r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, _0800D528
	strh r7, [r0]
	movs r0, #1
_0800D520:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800D528: .4byte 0x04000208
_0800D52C: .4byte 0x00000231
_0800D530: .4byte 0x00000232
	thumb_func_end sub_0800D4A8

	thumb_func_start sub_0800D534
sub_0800D534: @ 0x0800D534
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0800D54A
	adds r0, r2, #0
	movs r1, #0
	bl sub_0800D594
	b _0800D58C
_0800D54A:
	movs r3, #0
_0800D54C:
	ldrb r1, [r2, #0x1c]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r3, r0
	adds r0, r2, r0
	adds r1, r4, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #0xd
	ble _0800D54C
	ldrb r0, [r2, #0x1c]
	adds r0, #1
	ldrb r1, [r2, #0x1c]
	strb r0, [r2, #0x1c]
	ldrb r1, [r2, #0x1c]
	movs r0, #1
	ands r0, r1
	ldrb r1, [r2, #0x1c]
	strb r0, [r2, #0x1c]
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	bhi _0800D586
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	ldrb r1, [r2, #0x1e]
	strb r0, [r2, #0x1e]
	b _0800D58C
_0800D586:
	ldrb r0, [r2, #0x1c]
	ldrb r1, [r2, #0x1d]
	strb r0, [r2, #0x1d]
_0800D58C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0800D534

	thumb_func_start sub_0800D594
sub_0800D594: @ 0x0800D594
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	ldrb r0, [r3, #0x1e]
	cmp r0, #0
	bne _0800D5A4
	movs r0, #0
	b _0800D5DE
_0800D5A4:
	cmp r5, #0
	beq _0800D5C2
	movs r4, #0
_0800D5AA:
	adds r2, r5, r4
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r2]
	adds r4, #1
	cmp r4, #0xd
	ble _0800D5AA
_0800D5C2:
	ldrb r0, [r3, #0x1d]
	adds r0, #1
	ldrb r1, [r3, #0x1d]
	strb r0, [r3, #0x1d]
	ldrb r1, [r3, #0x1d]
	movs r0, #1
	ands r0, r1
	ldrb r1, [r3, #0x1d]
	strb r0, [r3, #0x1d]
	ldrb r0, [r3, #0x1e]
	subs r0, #1
	ldrb r1, [r3, #0x1e]
	strb r0, [r3, #0x1e]
	movs r0, #1
_0800D5DE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0800D594

	thumb_func_start sub_0800D5E4
sub_0800D5E4: @ 0x0800D5E4
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	ldr r1, _0800D638
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0800D63C
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #2
	adds r4, r3, r0
_0800D5FC:
	ldrb r0, [r4]
	lsls r0, r0, #8
	adds r0, r2, r0
	adds r0, r3, r0
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0xff
	ble _0800D5FC
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	ldrb r2, [r1]
	movs r0, #1
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, _0800D638
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	b _0800D646
	.align 2, 0
_0800D638: .4byte 0x00000202
_0800D63C:
	ldr r1, _0800D64C
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r1, #1
	strb r1, [r0]
_0800D646:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D64C: .4byte 0x00000203
	thumb_func_end sub_0800D5E4

	thumb_func_start sub_0800D650
sub_0800D650: @ 0x0800D650
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r3, r1
	adds r1, #1
	adds r4, r3, r1
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	beq _0800D672
	ldr r1, _0800D678
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800D67C
_0800D672:
	movs r0, #0
	b _0800D6B6
	.align 2, 0
_0800D678: .4byte 0x00000203
_0800D67C:
	movs r2, #0
_0800D67E:
	adds r0, r5, r2
	ldrb r1, [r4]
	lsls r1, r1, #8
	adds r1, r2, r1
	adds r1, r3, r1
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0xff
	ble _0800D67E
	ldr r0, _0800D6BC
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	ldrb r2, [r1]
	movs r0, #1
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, _0800D6C0
	adds r1, r3, r0
	ldrb r0, [r1]
	subs r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #1
_0800D6B6:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800D6BC: .4byte 0x00000201
_0800D6C0: .4byte 0x00000202
	thumb_func_end sub_0800D650

	thumb_func_start sub_0800D6C4
sub_0800D6C4: @ 0x0800D6C4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	movs r5, #0
	cmp r1, #1
	beq _0800D702
	cmp r1, #1
	bgt _0800D6DE
	cmp r1, #0
	beq _0800D6E8
	b _0800D776
_0800D6DE:
	cmp r0, #2
	beq _0800D722
	cmp r0, #3
	beq _0800D742
	b _0800D776
_0800D6E8:
	movs r4, #0
_0800D6EA:
	adds r0, r6, r4
	adds r1, r4, #1
	strb r1, [r0]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, r1, #0
	cmp r4, #0xc7
	ble _0800D6EA
	b _0800D73C
_0800D702:
	movs r4, #0
	adds r2, r6, #0
	adds r2, #0xc8
_0800D708:
	adds r0, r6, r4
	adds r1, r4, #1
	strb r1, [r0]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, r1, #0
	cmp r4, #0x63
	ble _0800D708
	strh r5, [r2]
	b _0800D776
_0800D722:
	movs r4, #0
_0800D724:
	bl Random
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, r4
	strb r0, [r1]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #1
	cmp r4, #0xc7
	ble _0800D724
_0800D73C:
	adds r0, r6, r4
	strh r5, [r0]
	b _0800D776
_0800D742:
	movs r4, #0
	ldr r3, _0800D77C
	ldrb r1, [r3]
	ldrb r0, [r3]
	adds r7, r0, #1
	adds r2, r1, #1
	movs r0, #0xff
	mov ip, r0
_0800D752:
	adds r0, r6, r4
	adds r1, r4, #1
	strb r2, [r0]
	adds r0, r4, r7
	mov r4, ip
	ands r0, r4
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r2, #1
	adds r4, r1, #0
	cmp r1, #0xc7
	ble _0800D752
	adds r0, r6, r1
	strh r5, [r0]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_0800D776:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D77C: .4byte 0x03000D74
	thumb_func_end sub_0800D6C4

	thumb_func_start PkmnStrToASCII
PkmnStrToASCII: @ 0x0800D780
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800D7A4
	ldr r5, _0800D7B0
	adds r2, r1, #0
_0800D790:
	adds r1, r4, r3
	ldrb r0, [r2]
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, #1
	adds r3, #1
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0800D790
_0800D7A4:
	adds r1, r4, r3
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D7B0: .4byte 0x082C01C0
	thumb_func_end PkmnStrToASCII

	thumb_func_start ASCIIToPkmnStr
ASCIIToPkmnStr: @ 0x0800D7B4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800D7D8
	ldr r5, _0800D7E4
	adds r2, r1, #0
_0800D7C4:
	adds r1, r4, r3
	ldrb r0, [r2]
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, #1
	adds r3, #1
	ldrb r0, [r2]
	cmp r0, #0
	bne _0800D7C4
_0800D7D8:
	adds r1, r4, r3
	movs r0, #0xff
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D7E4: .4byte 0x082C00C0
	thumb_func_end ASCIIToPkmnStr

	thumb_func_start sub_0800D7E8
sub_0800D7E8: @ 0x0800D7E8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	ldr r0, _0800D810
	ldr r4, [r0]
	ldrb r2, [r4, #2]
	ldrb r1, [r4]
	adds r7, r0, #0
	cmp r1, #1
	bne _0800D83E
	movs r3, #0
	ands r1, r2
	cmp r1, #0
	beq _0800D81A
	cmp r5, #1
	bne _0800D814
	ldrb r0, [r4, #0xa]
	b _0800D858
	.align 2, 0
_0800D810: .4byte 0x03007630
_0800D814:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0800D81A:
	lsrs r2, r2, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bhi _0800D856
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800D81A
	adds r0, r6, #1
	cmp r5, r0
	bne _0800D814
_0800D834:
	ldr r0, [r7]
	adds r0, #0xa
	adds r0, r0, r3
	ldrb r0, [r0]
	b _0800D858
_0800D83E:
	movs r3, #0
	movs r1, #1
_0800D842:
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0800D834
	lsrs r2, r2, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800D842
_0800D856:
	movs r0, #0
_0800D858:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800D7E8

	thumb_func_start sub_0800D860
sub_0800D860: @ 0x0800D860
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r4, #0
	ldr r0, _0800D93C
	mov r8, r0
	adds r6, r7, #2
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0xa
_0800D87E:
	adds r0, r6, r4
	adds r1, r5, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #1
	ble _0800D87E
	movs r4, #0
	lsls r2, r2, #7
	mov ip, r2
	adds r1, r7, #4
_0800D894:
	adds r0, r1, r4
	strb r3, [r0]
	asrs r3, r3, #8
	adds r4, #1
	cmp r4, #3
	ble _0800D894
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	movs r6, #1
	movs r1, #1
	ands r1, r0
	ldrb r2, [r7, #0xb]
	movs r5, #2
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #0xb]
	movs r4, #0x7f
	mov r1, sb
	ands r1, r4
	ldrb r2, [r7, #0xa]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	ands r0, r4
	mov r1, ip
	orrs r0, r1
	strb r0, [r7, #0xa]
	ldrb r0, [r7]
	movs r1, #0x10
	rsbs r1, r1, #0
	ands r1, r0
	orrs r1, r6
	ldrb r2, [r7, #1]
	movs r0, #0x3d
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #0xc
	orrs r0, r2
	strb r0, [r7, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #0x10
	ands r1, r0
	subs r0, #0x20
	ands r1, r0
	strb r1, [r7]
	ldr r0, _0800D940
	bl FlagGet
	lsls r0, r0, #7
	ldrb r1, [r7]
	ands r4, r1
	orrs r4, r0
	strb r4, [r7]
	bl IsNationalPokedexEnabled
	ands r0, r6
	ldrb r1, [r7, #1]
	ands r5, r1
	orrs r5, r0
	strb r5, [r7, #1]
	ldr r0, _0800D944
	bl FlagGet
	ands r6, r0
	lsls r6, r6, #1
	ldrb r1, [r7, #1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r6
	strb r0, [r7, #1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D93C: .4byte 0x03005AF0
_0800D940: .4byte 0x0000087F
_0800D944: .4byte 0x00000864
	thumb_func_end sub_0800D860

	thumb_func_start sub_0800D948
sub_0800D948: @ 0x0800D948
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r0, _0800D99C
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _0800D9A4
	movs r0, #1
	mov sb, r0
	ldr r6, _0800D9A0
	ldr r0, [r6]
	lsls r4, r5, #5
	adds r0, r0, r4
	ldrh r0, [r0, #0x18]
	bl sub_0800FF54
	cmp r0, #0
	beq _0800D984
	ldr r1, [r6]
	ldrb r0, [r1, #7]
	asrs r0, r5
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	bne _0800D9BC
_0800D984:
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xd
	bl memset
	mov r0, r8
	movs r1, #0
	movs r2, #8
	bl memset
	b _0800D9F0
	.align 2, 0
_0800D99C: .4byte 0x030041E0
_0800D9A0: .4byte 0x03007630
_0800D9A4:
	movs r0, #0
	mov sb, r0
	ldr r6, _0800D9D8
	ldr r0, [r6]
	lsls r4, r5, #5
	adds r0, r0, r4
	ldrh r0, [r0, #0x18]
	bl sub_0800FF54
	cmp r0, #0
	beq _0800D9DC
	ldr r1, [r6]
_0800D9BC:
	adds r1, r4, r1
	adds r1, #0x1a
	adds r0, r7, #0
	movs r2, #0xd
	bl memcpy
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, #0x29
	mov r0, r8
	movs r2, #8
	bl memcpy
	b _0800D9F0
	.align 2, 0
_0800D9D8: .4byte 0x03007630
_0800D9DC:
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xd
	bl memset
	mov r0, r8
	movs r1, #0
	movs r2, #8
	bl memset
_0800D9F0:
	mov r0, sb
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800D948

	thumb_func_start sub_0800DA00
sub_0800DA00: @ 0x0800DA00
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	movs r7, #0
	ldr r6, _0800DA38
	ldr r0, [r6]
	lsrs r4, r2, #0x13
	adds r2, r0, r4
	ldrh r1, [r2, #0x18]
	ldr r0, _0800DA3C
	cmp r1, r0
	bne _0800DA40
	adds r1, r2, #0
	adds r1, #0x1a
	adds r0, r3, #0
	movs r2, #0xd
	bl memcpy
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, #0x29
	adds r0, r5, #0
	movs r2, #8
	bl memcpy
	movs r7, #1
	b _0800DA54
	.align 2, 0
_0800DA38: .4byte 0x03007630
_0800DA3C: .4byte 0x00007F7F
_0800DA40:
	adds r0, r3, #0
	movs r1, #0
	movs r2, #0xd
	bl memset
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	bl memset
_0800DA54:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0800DA00

	thumb_func_start sub_0800DA5C
sub_0800DA5C: @ 0x0800DA5C
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _0800DA78
	movs r2, #0xd
	bl memcpy
	ldr r1, _0800DA7C
	adds r0, r4, #0
	movs r2, #8
	bl memcpy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800DA78: .4byte 0x020227CC
_0800DA7C: .4byte 0x020227DA
	thumb_func_end sub_0800DA5C

	thumb_func_start CreateWirelessStatusIndicatorSprite
CreateWirelessStatusIndicatorSprite: @ 0x0800DA80
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r3, #0
	bne _0800DA96
	cmp r2, #0
	bne _0800DA96
	movs r3, #0xe7
	movs r2, #8
_0800DA96:
	ldr r0, _0800DAD8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800DAF0
	ldr r0, _0800DADC
	adds r1, r3, #0
	movs r3, #0
	bl CreateSprite
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0800DAE0
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, _0800DAE4
	strh r0, [r4, #0x3c]
	ldr r0, _0800DAE8
	ldrh r0, [r0, #6]
	bl GetSpriteTileStartByTag
	strh r0, [r4, #0x3a]
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldr r0, _0800DAEC
	strb r5, [r0]
	b _0800DB36
	.align 2, 0
_0800DAD8: .4byte 0x03007630
_0800DADC: .4byte 0x082C0340
_0800DAE0: .4byte 0x020205AC
_0800DAE4: .4byte 0x00001234
_0800DAE8: .4byte 0x082C0330
_0800DAEC: .4byte 0x020227C8
_0800DAF0:
	ldr r0, _0800DB3C
	adds r1, r3, #0
	movs r3, #0
	bl CreateSprite
	ldr r4, _0800DB40
	strb r0, [r4]
	ldr r5, _0800DB44
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0800DB48
	strh r1, [r0, #0x3c]
	ldr r0, _0800DB4C
	ldrh r0, [r0, #6]
	bl GetSpriteTileStartByTag
	ldrb r2, [r4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	strh r0, [r1, #0x3a]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_0800DB36:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800DB3C: .4byte 0x082C0340
_0800DB40: .4byte 0x020227C8
_0800DB44: .4byte 0x020205AC
_0800DB48: .4byte 0x00001234
_0800DB4C: .4byte 0x082C0330
	thumb_func_end CreateWirelessStatusIndicatorSprite

	thumb_func_start DestroyWirelessStatusIndicatorSprite
DestroyWirelessStatusIndicatorSprite: @ 0x0800DB50
	push {r4, lr}
	ldr r4, _0800DB9C
	ldr r3, _0800DBA0
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r4
	movs r0, #0x3c
	ldrsh r1, [r2, r0]
	ldr r0, _0800DBA4
	cmp r1, r0
	bne _0800DB96
	movs r0, #0
	strh r0, [r2, #0x3c]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r3, _0800DBA8
	movs r0, #0x84
	lsls r0, r0, #3
	adds r3, r3, r0
	ldr r0, _0800DBAC
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [r3]
	str r2, [r3, #4]
	ldr r1, _0800DBB0
	movs r2, #4
	bl CpuSet
_0800DB96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800DB9C: .4byte 0x020205AC
_0800DBA0: .4byte 0x020227C8
_0800DBA4: .4byte 0x00001234
_0800DBA8: .4byte 0x03002360
_0800DBAC: .4byte 0x082BF2F8
_0800DBB0: .4byte 0x070003E8
	thumb_func_end DestroyWirelessStatusIndicatorSprite

	thumb_func_start LoadWirelessStatusIndicatorSpriteGfx
LoadWirelessStatusIndicatorSpriteGfx: @ 0x0800DBB4
	push {r4, lr}
	ldr r4, _0800DBE0
	ldrh r0, [r4, #6]
	bl GetSpriteTileStartByTag
	lsls r0, r0, #0x10
	ldr r1, _0800DBE4
	cmp r0, r1
	bne _0800DBCC
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
_0800DBCC:
	ldr r0, _0800DBE8
	bl LoadSpritePalette
	ldr r1, _0800DBEC
	movs r0, #0xff
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800DBE0: .4byte 0x082C0330
_0800DBE4: .4byte 0xFFFF0000
_0800DBE8: .4byte 0x082C0338
_0800DBEC: .4byte 0x020227C8
	thumb_func_end LoadWirelessStatusIndicatorSpriteGfx

	thumb_func_start sub_0800DBF0
sub_0800DBF0: @ 0x0800DBF0
	push {r4, lr}
	ldr r1, _0800DC10
	ldr r0, [r1]
	ldrb r2, [r0, #2]
	movs r3, #0
	movs r4, #1
_0800DBFC:
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	beq _0800DC14
	ldr r0, [r1]
	adds r0, #0xa
	adds r0, r0, r3
	ldrb r0, [r0]
	b _0800DC22
	.align 2, 0
_0800DC10: .4byte 0x03007630
_0800DC14:
	lsrs r2, r2, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800DBFC
	movs r0, #0
_0800DC22:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0800DBF0

	thumb_func_start sub_0800DC28
sub_0800DC28: @ 0x0800DC28
	push {lr}
	adds r2, r0, #0
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	cmp r0, r1
	beq _0800DC3C
	movs r0, #0
	strh r1, [r2, #0x32]
	strh r0, [r2, #0x34]
	strh r0, [r2, #0x36]
_0800DC3C:
	pop {r0}
	bx r0
	thumb_func_end sub_0800DC28

	thumb_func_start sub_0800DC40
sub_0800DC40: @ 0x0800DC40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _0800DC84
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0800DC50
	b _0800DE12
_0800DC50:
	ldr r2, _0800DC88
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	movs r0, #0x3c
	ldrsh r1, [r2, r0]
	ldr r0, _0800DC8C
	cmp r1, r0
	beq _0800DC68
	b _0800DE12
_0800DC68:
	adds r6, r2, #0
	movs r5, #0xff
	movs r4, #0
	ldr r0, _0800DC90
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800DCC2
	adds r7, r6, #0
	adds r7, #0x28
	movs r1, #0x29
	adds r1, r1, r6
	mov r8, r1
	b _0800DCB2
	.align 2, 0
_0800DC84: .4byte 0x020227C8
_0800DC88: .4byte 0x020205AC
_0800DC8C: .4byte 0x00001234
_0800DC90: .4byte 0x03007630
_0800DC94:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_0800D7E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	blo _0800DCB2
	adds r0, r4, #0
	bl sub_0800D7E8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0800DCB2:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r4, r0
	blt _0800DC94
	b _0800DCD4
_0800DCC2:
	bl sub_0800DBF0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r6, #0
	adds r7, #0x28
	movs r2, #0x29
	adds r2, r2, r6
	mov r8, r2
_0800DCD4:
	bl sub_08011D10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0800DCE4
	movs r0, #4
	b _0800DD12
_0800DCE4:
	cmp r5, #0x18
	bhi _0800DCEC
	movs r0, #3
	b _0800DD12
_0800DCEC:
	adds r0, r5, #0
	subs r0, #0x19
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x65
	bhi _0800DCFC
	movs r0, #2
	b _0800DD12
_0800DCFC:
	adds r0, r5, #0
	subs r0, #0x7f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x65
	bhi _0800DD0C
	movs r0, #1
	b _0800DD12
_0800DD0C:
	cmp r5, #0xe4
	bls _0800DD14
	movs r0, #0
_0800DD12:
	strh r0, [r6, #0x2e]
_0800DD14:
	movs r3, #0x2e
	ldrsh r1, [r6, r3]
	movs r2, #0x30
	ldrsh r0, [r6, r2]
	cmp r1, r0
	beq _0800DD2A
	adds r0, r6, #0
	bl sub_0800DC28
	ldrh r0, [r6, #0x2e]
	strh r0, [r6, #0x30]
_0800DD2A:
	movs r0, #0x32
	ldrsh r1, [r6, r0]
	ldr r2, [r6, #8]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r3, #0x36
	ldrsh r0, [r6, r3]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x1a
	movs r3, #0x34
	ldrsh r1, [r6, r3]
	cmp r0, r1
	bge _0800DD78
	ldrh r0, [r6, #0x36]
	adds r0, #1
	movs r3, #0
	strh r0, [r6, #0x36]
	strh r3, [r6, #0x34]
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r2, #0x36
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800DD7E
	strh r3, [r6, #0x36]
	b _0800DD7E
_0800DD78:
	ldrh r0, [r6, #0x34]
	adds r0, #1
	strh r0, [r6, #0x34]
_0800DD7E:
	ldr r4, _0800DE1C
	movs r1, #0x84
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, _0800DE20
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [r0]
	str r2, [r0, #4]
	movs r3, #0x20
	ldrsh r2, [r6, r3]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r2, r2, r1
	ldr r1, _0800DE24
	adds r5, r4, r1
	ldr r3, _0800DE28
	adds r1, r3, #0
	ands r2, r1
	ldrh r3, [r5]
	ldr r1, _0800DE2C
	ands r1, r3
	orrs r1, r2
	strh r1, [r5]
	ldrh r1, [r6, #0x22]
	mov r2, r8
	ldrb r2, [r2]
	adds r1, r1, r2
	strb r1, [r0]
	ldrb r2, [r6, #5]
	ldr r3, _0800DE30
	adds r5, r4, r3
	lsrs r2, r2, #4
	lsls r2, r2, #4
	ldrb r3, [r5]
	movs r1, #0xf
	ands r1, r3
	orrs r1, r2
	strb r1, [r5]
	movs r1, #0x32
	ldrsh r2, [r6, r1]
	ldr r1, [r6, #8]
	lsls r2, r2, #2
	adds r2, r2, r1
	movs r3, #0x36
	ldrsh r1, [r6, r3]
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r2, [r1]
	ldrh r6, [r6, #0x3a]
	adds r2, r2, r6
	ldr r1, _0800DE34
	adds r4, r4, r1
	ldr r3, _0800DE38
	adds r1, r3, #0
	ands r2, r1
	ldrh r3, [r4]
	ldr r1, _0800DE3C
	ands r1, r3
	orrs r1, r2
	strh r1, [r4]
	ldr r1, _0800DE40
	movs r2, #4
	bl CpuSet
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0800DE12
	bl DestroyWirelessStatusIndicatorSprite
_0800DE12:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800DE1C: .4byte 0x03002360
_0800DE20: .4byte 0x082C02C0
_0800DE24: .4byte 0x00000422
_0800DE28: .4byte 0x000001FF
_0800DE2C: .4byte 0xFFFFFE00
_0800DE30: .4byte 0x00000425
_0800DE34: .4byte 0x00000424
_0800DE38: .4byte 0x000003FF
_0800DE3C: .4byte 0xFFFFFC00
_0800DE40: .4byte 0x070003E8
	thumb_func_end sub_0800DC40

	thumb_func_start CopyTrainerRecord
CopyTrainerRecord: @ 0x0800DE44
	push {lr}
	stm r0!, {r1}
	adds r1, r2, #0
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CopyTrainerRecord

	thumb_func_start NameIsNotEmpty
NameIsNotEmpty: @ 0x0800DE54
	push {lr}
	adds r2, r0, #0
	movs r1, #0
_0800DE5A:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800DE66
	movs r0, #1
	b _0800DE6E
_0800DE66:
	adds r1, #1
	cmp r1, #7
	ble _0800DE5A
	movs r0, #0
_0800DE6E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end NameIsNotEmpty

	thumb_func_start RecordMixTrainerNames
RecordMixTrainerNames: @ 0x0800DE74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _0800DE98
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DE8A
	b _0800DFE8
_0800DE8A:
	movs r0, #0xf0
	bl AllocZeroed
	str r0, [sp, #0x14]
	movs r4, #0
	b _0800DF00
	.align 2, 0
_0800DE98: .4byte 0x0300319C
_0800DE9C:
	lsls r2, r4, #2
	mov r0, sp
	adds r1, r0, r2
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
	movs r5, #0
	mov r8, r2
	lsls r0, r4, #3
	adds r1, r4, #1
	mov sb, r1
	subs r0, r0, r4
	lsls r0, r0, #2
	str r0, [sp, #0x1c]
	ldr r7, _0800DF24
	mov sl, r7
	ldr r6, _0800DF28
	movs r4, #0
	mov r0, sl
	subs r0, #4
	ldr r1, [sp, #0x1c]
	adds r3, r1, r0
_0800DEC8:
	ldrh r1, [r3]
	ldr r0, _0800DF2C
	ldr r2, [r0]
	ldr r7, _0800DF28
	adds r0, r2, r7
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r1, r0
	bne _0800DEF4
	adds r1, r2, r6
	adds r1, #4
	ldr r0, [sp, #0x1c]
	add r0, sl
	str r3, [sp, #0x18]
	bl StringCompare
	ldr r3, [sp, #0x18]
	cmp r0, #0
	bne _0800DEF4
	mov r0, sp
	add r0, r8
	str r5, [r0]
_0800DEF4:
	adds r6, #0xc
	adds r4, #0xc
	adds r5, #1
	cmp r5, #0x13
	ble _0800DEC8
	mov r4, sb
_0800DF00:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0800DE9C
	movs r7, #0
	movs r4, #0
	ldr r0, _0800DF30
	mov sl, r0
	mov r6, sp
	movs r1, #8
	add r1, sl
	mov sb, r1
	mov r8, r4
	ldr r5, [sp, #0x14]
	b _0800DF78
	.align 2, 0
_0800DF24: .4byte 0x020226A8
_0800DF28: .4byte 0x00003B98
_0800DF2C: .4byte 0x03005AEC
_0800DF30: .4byte 0x020226A0
_0800DF34:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	beq _0800DF6E
	mov r0, sl
	adds r0, #4
	add r0, r8
	ldrh r1, [r0]
	adds r0, r5, #0
	mov r2, sb
	bl CopyTrainerRecord
	ldr r2, [r6]
	cmp r2, #0
	blt _0800DF6A
	ldr r0, _0800DFF8
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _0800DFFC
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_0800DF6A:
	adds r5, #0xc
	adds r7, #1
_0800DF6E:
	adds r6, #4
	movs r1, #0x1c
	add sb, r1
	add r8, r1
	adds r4, #1
_0800DF78:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0800DF34
	movs r4, #0
	ldr r0, _0800DFF8
	mov sb, r0
	ldr r6, _0800E000
	mov r8, r4
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, [sp, #0x14]
	adds r5, r0, r1
_0800DF98:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r6
	adds r0, #4
	bl NameIsNotEmpty
	cmp r0, #0
	beq _0800DFC6
	mov r0, sb
	ldr r2, [r0]
	ldr r1, _0800E000
	adds r0, r2, r1
	add r0, r8
	ldr r1, [r0]
	adds r2, r2, r6
	adds r2, #4
	adds r0, r5, #0
	bl CopyTrainerRecord
	adds r5, #0xc
	adds r7, #1
	cmp r7, #0x13
	bgt _0800DFD2
_0800DFC6:
	adds r6, #0xc
	movs r0, #0xc
	add r8, r0
	adds r4, #1
	cmp r4, #0x13
	ble _0800DF98
_0800DFD2:
	ldr r0, _0800DFF8
	ldr r0, [r0]
	ldr r1, _0800E000
	adds r0, r0, r1
	ldr r1, [sp, #0x14]
	movs r2, #0xf0
	bl memcpy
	ldr r0, [sp, #0x14]
	bl Free
_0800DFE8:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800DFF8: .4byte 0x03005AEC
_0800DFFC: .4byte 0x00003B9C
_0800E000: .4byte 0x00003B98
	thumb_func_end RecordMixTrainerNames

	thumb_func_start sub_0800E004
sub_0800E004: @ 0x0800E004
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r7, #0
	ldr r6, _0800E040
	ldr r4, _0800E044
	movs r5, #0
_0800E01C:
	ldr r0, [r6]
	adds r0, r0, r4
	adds r0, #4
	mov r1, sb
	bl StringCompare
	cmp r0, #0
	bne _0800E048
	ldr r0, [r6]
	ldr r1, _0800E044
	adds r0, r0, r1
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r8
	bne _0800E048
	movs r0, #1
	b _0800E062
	.align 2, 0
_0800E040: .4byte 0x03005AEC
_0800E044: .4byte 0x00003B98
_0800E048:
	ldr r0, [r6]
	adds r0, r0, r4
	adds r0, #4
	bl NameIsNotEmpty
	cmp r0, #0
	beq _0800E060
	adds r4, #0xc
	adds r5, #0xc
	adds r7, #1
	cmp r7, #0x13
	ble _0800E01C
_0800E060:
	movs r0, #0
_0800E062:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800E004

	thumb_func_start WipeTrainerNameRecords
WipeTrainerNameRecords: @ 0x0800E070
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0800E0B4
	mov r8, r0
	movs r7, #0
	mov r6, r8
	movs r5, #0
	movs r4, #0x13
_0800E084:
	ldr r0, _0800E0B8
	ldr r1, [r0]
	mov r2, r8
	adds r0, r1, r2
	adds r0, r0, r5
	str r7, [r0]
	mov r0, sp
	strh r7, [r0]
	adds r1, r1, r6
	adds r1, #4
	ldr r2, _0800E0BC
	bl CpuSet
	adds r6, #0xc
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _0800E084
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E0B4: .4byte 0x00003B98
_0800E0B8: .4byte 0x03005AEC
_0800E0BC: .4byte 0x01000004
	thumb_func_end WipeTrainerNameRecords

	thumb_func_start nullsub_13
nullsub_13: @ 0x0800E0C0
	bx lr
	.align 2, 0
	thumb_func_end nullsub_13

	thumb_func_start nullsub_5
nullsub_5: @ 0x0800E0C4
	bx lr
	.align 2, 0
	thumb_func_end nullsub_5

	thumb_func_start sub_0800E0C8
sub_0800E0C8: @ 0x0800E0C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r6, _0800E16C
	adds r5, r6, #0
	adds r5, #0xee
	ldrb r4, [r5]
	mov r0, sp
	movs r7, #0
	strh r7, [r0]
	ldr r2, _0800E170
	adds r1, r6, #0
	bl CpuSet
	ldrb r0, [r5]
	strb r4, [r5]
	movs r0, #0xff
	strb r0, [r6, #0xc]
	ldrb r0, [r5]
	cmp r0, #4
	beq _0800E0FA
	ldrb r0, [r5]
	strb r7, [r5]
_0800E0FA:
	mov r7, sp
	adds r7, #2
	add r0, sp, #4
	mov r8, r0
	movs r0, #6
	add r0, sp
	mov sb, r0
	adds r5, r6, #0
	adds r5, #0x80
	movs r4, #4
_0800E10E:
	adds r0, r5, #0
	bl sub_0800F7A8
	adds r5, #0x14
	subs r4, #1
	cmp r4, #0
	bge _0800E10E
	movs r5, #0
	ldr r4, _0800E174
	adds r0, r4, #0
	bl sub_0800F7A8
	adds r0, r4, #0
	adds r0, #0xb8
	bl sub_0800D184
	ldr r0, _0800E178
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_0800D1E0
	strh r5, [r7]
	ldr r1, _0800E17C
	ldr r2, _0800E180
	adds r0, r7, #0
	bl CpuSet
	mov r0, r8
	strh r5, [r0]
	ldr r1, _0800E184
	ldr r2, _0800E188
	bl CpuSet
	mov r0, sb
	strh r5, [r0]
	ldr r1, _0800E18C
	ldr r2, _0800E190
	bl CpuSet
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E16C: .4byte 0x030050A0
_0800E170: .4byte 0x010004D6
_0800E174: .4byte 0x0300510C
_0800E178: .4byte 0x00000634
_0800E17C: .4byte 0x030031B0
_0800E180: .4byte 0x01000008
_0800E184: .4byte 0x03003130
_0800E188: .4byte 0x01000028
_0800E18C: .4byte 0x020226A0
_0800E190: .4byte 0x01000046
	thumb_func_end sub_0800E0C8

	thumb_func_start sub_0800E194
sub_0800E194: @ 0x0800E194
	push {r4, r5, r6, lr}
	ldr r4, _0800E1BC
	ldr r5, [r4, #4]
	ldr r6, [r4, #8]
	bl sub_0800E1C4
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	ldr r1, _0800E1C0
	movs r0, #0
	strh r0, [r1]
	str r5, [r4, #4]
	str r6, [r4, #8]
	movs r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E1BC: .4byte 0x030027B0
_0800E1C0: .4byte 0x04000208
	thumb_func_end sub_0800E194

	thumb_func_start sub_0800E1C4
sub_0800E1C4: @ 0x0800E1C4
	push {r4, lr}
	ldr r0, _0800E1FC
	ldr r1, _0800E200
	ldr r4, _0800E204
	adds r2, r4, #0
	movs r3, #1
	bl rfu_initializeAPI
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0800E1F6
	ldr r0, _0800E208
	strh r1, [r0]
	bl sub_0800A6B8
	movs r0, #0
	bl sub_08010CA0
	bl sub_0800E0C8
	adds r1, r4, #4
	movs r0, #3
	bl rfu_setTimerInterrupt
_0800E1F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E1FC: .4byte 0x03004230
_0800E200: .4byte 0x00000E64
_0800E204: .4byte 0x030027B4
_0800E208: .4byte 0x0202267E
	thumb_func_end sub_0800E1C4

	thumb_func_start sub_0800E20C
sub_0800E20C: @ 0x0800E20C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_08010250
	ldr r0, _0800E22C
	ldrh r0, [r0, #4]
	cmp r0, #0x12
	bls _0800E220
	b _0800E326
_0800E220:
	lsls r0, r0, #2
	ldr r1, _0800E230
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E22C: .4byte 0x030050A0
_0800E230: .4byte 0x0800E234
_0800E234: @ jump table
	.4byte _0800E280 @ case 0
	.4byte _0800E326 @ case 1
	.4byte _0800E2A8 @ case 2
	.4byte _0800E326 @ case 3
	.4byte _0800E2D8 @ case 4
	.4byte _0800E326 @ case 5
	.4byte _0800E326 @ case 6
	.4byte _0800E326 @ case 7
	.4byte _0800E326 @ case 8
	.4byte _0800E326 @ case 9
	.4byte _0800E326 @ case 10
	.4byte _0800E326 @ case 11
	.4byte _0800E326 @ case 12
	.4byte _0800E326 @ case 13
	.4byte _0800E326 @ case 14
	.4byte _0800E326 @ case 15
	.4byte _0800E326 @ case 16
	.4byte _0800E326 @ case 17
	.4byte _0800E2EC @ case 18
_0800E280:
	ldr r0, _0800E29C
	bl sub_0800BA88
	ldr r0, _0800E2A0
	movs r2, #1
	strh r2, [r0, #4]
	ldr r1, _0800E2A4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r2, [r0, #0xa]
	b _0800E326
	.align 2, 0
_0800E29C: .4byte 0x020227E4
_0800E2A0: .4byte 0x030050A0
_0800E2A4: .4byte 0x03005B60
_0800E2A8:
	ldr r4, _0800E2CC
	ldrb r0, [r4, #0xc]
	ldr r3, _0800E2D0
	movs r1, #0
	movs r2, #0xf0
	bl sub_0800BB10
	movs r0, #3
	strh r0, [r4, #4]
	ldr r1, _0800E2D4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #6
	strh r1, [r0, #0xa]
	b _0800E326
	.align 2, 0
_0800E2CC: .4byte 0x030050A0
_0800E2D0: .4byte 0x082C0430
_0800E2D4: .4byte 0x03005B60
_0800E2D8:
	movs r0, #0
	bl sub_0800BD38
	ldr r1, _0800E2E8
	movs r0, #5
	strh r0, [r1, #4]
	b _0800E326
	.align 2, 0
_0800E2E8: .4byte 0x030050A0
_0800E2EC:
	ldr r4, _0800E32C
	ldr r0, _0800E330
	adds r1, r4, r0
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0800E334
	bl sub_0800CFE8
	bl sub_0800E578
	bl sub_0800E5C0
	movs r0, #0x14
	strh r0, [r4, #4]
	ldr r1, _0800E338
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	strh r1, [r0, #0xa]
	ldr r0, _0800E33C
	movs r1, #5
	bl CreateTask
	adds r0, r5, #0
	bl DestroyTask
_0800E326:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E32C: .4byte 0x030050A0
_0800E330: .4byte 0x00000993
_0800E334: .4byte 0x0800E87D
_0800E338: .4byte 0x03005B60
_0800E33C: .4byte 0x0801034D
	thumb_func_end sub_0800E20C

	thumb_func_start sub_0800E340
sub_0800E340: @ 0x0800E340
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0800E34C
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800E34C: .4byte 0x082C03F5
	thumb_func_end sub_0800E340

	thumb_func_start sub_0800E350
sub_0800E350: @ 0x0800E350
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r1, #0
	movs r4, #1
	adds r1, r2, #0
	movs r6, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0800E390
	movs r3, #0
	movs r5, #1
	ldr r1, _0800E38C
_0800E36A:
	adds r0, r2, #0
	ands r0, r5
	cmp r0, #0
	beq _0800E37C
	adds r0, r3, r1
	strb r4, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0800E37C:
	asrs r2, r2, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800E36A
	b _0800E406
	.align 2, 0
_0800E38C: .4byte 0x03005A36
_0800E390:
	movs r3, #0
	mvns r0, r1
	mov ip, r0
	movs r7, #1
	ldr r4, _0800E40C
_0800E39A:
	adds r2, r1, #0
	ands r2, r7
	cmp r2, #0
	bne _0800E3A6
	adds r0, r3, r4
	strb r2, [r0]
_0800E3A6:
	asrs r1, r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800E39A
	movs r4, #4
	ldr r0, _0800E40C
	ldrb r7, [r0]
_0800E3B8:
	movs r3, #0
	subs r1, r4, #1
	cmp r7, r4
	beq _0800E3D4
	ldr r2, _0800E40C
_0800E3C2:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bhi _0800E3D4
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, r4
	bne _0800E3C2
_0800E3D4:
	cmp r3, #4
	bne _0800E3DA
	adds r6, r4, #0
_0800E3DA:
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0800E3B8
	mov r0, ip
	ands r5, r0
	movs r3, #0
	movs r2, #1
	ldr r1, _0800E40C
_0800E3EC:
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _0800E3FA
	adds r0, r3, r1
	strb r6, [r0]
	adds r6, #1
_0800E3FA:
	asrs r5, r5, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800E3EC
_0800E406:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E40C: .4byte 0x03005A36
	thumb_func_end sub_0800E350

	thumb_func_start sub_0800E410
sub_0800E410: @ 0x0800E410
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0800E42C
	ldrh r3, [r0, #4]
	adds r7, r0, #0
	cmp r3, #0xc
	bls _0800E422
	b _0800E55E
_0800E422:
	lsls r0, r3, #2
	ldr r1, _0800E430
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E42C: .4byte 0x030050A0
_0800E430: .4byte 0x0800E434
_0800E434: @ jump table
	.4byte _0800E468 @ case 0
	.4byte _0800E55E @ case 1
	.4byte _0800E55E @ case 2
	.4byte _0800E55E @ case 3
	.4byte _0800E55E @ case 4
	.4byte _0800E55E @ case 5
	.4byte _0800E480 @ case 6
	.4byte _0800E55E @ case 7
	.4byte _0800E55E @ case 8
	.4byte _0800E4A8 @ case 9
	.4byte _0800E55E @ case 10
	.4byte _0800E4BC @ case 11
	.4byte _0800E500 @ case 12
_0800E468:
	ldr r0, _0800E478
	bl sub_0800BA88
	ldr r0, _0800E47C
	movs r2, #1
	strh r2, [r0, #4]
	b _0800E490
	.align 2, 0
_0800E478: .4byte 0x082C0358
_0800E47C: .4byte 0x030050A0
_0800E480:
	ldrb r0, [r7, #0xc]
	ldr r3, _0800E4A0
	movs r1, #0
	movs r2, #0xf0
	bl sub_0800BB10
	movs r2, #7
	strh r2, [r7, #4]
_0800E490:
	ldr r1, _0800E4A4
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r2, [r0, #0xa]
	b _0800E55E
	.align 2, 0
_0800E4A0: .4byte 0x082C0430
_0800E4A4: .4byte 0x03005B60
_0800E4A8:
	ldr r0, _0800E4B8
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xa
	strh r0, [r1, #0xa]
	b _0800E55E
	.align 2, 0
_0800E4B8: .4byte 0x03005B60
_0800E4BC:
	bl sub_080102A0
	cmp r0, #6
	beq _0800E4E0
	cmp r0, #6
	bgt _0800E4CE
	cmp r0, #5
	beq _0800E4D4
	b _0800E55E
_0800E4CE:
	cmp r0, #9
	beq _0800E4E0
	b _0800E55E
_0800E4D4:
	ldr r1, _0800E4DC
	movs r0, #0xc
	strh r0, [r1, #4]
	b _0800E55E
	.align 2, 0
_0800E4DC: .4byte 0x030050A0
_0800E4E0:
	bl sub_0800D0EC
	ldr r0, _0800E4F8
	ldr r1, _0800E4FC
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	adds r0, r6, #0
	bl DestroyTask
	b _0800E55E
	.align 2, 0
_0800E4F8: .4byte 0x030050A0
_0800E4FC: .4byte 0x0000099C
_0800E500:
	ldr r0, _0800E564
	adds r4, r7, r0
	ldrb r0, [r4]
	movs r5, #0x80
	lsls r5, r5, #0x11
	lsls r5, r0
	lsrs r5, r5, #0x18
	ldrb r1, [r4]
	movs r0, #0xc
	bl rfu_clearSlot
	ldrb r1, [r4]
	ldr r0, _0800E568
	adds r2, r7, r0
	movs r0, #0x10
	movs r3, #0x46
	bl rfu_setRecvBuffer
	adds r1, r7, #0
	adds r1, #0x4c
	adds r0, r5, #0
	movs r2, #0xe
	bl rfu_UNI_setSendData
	ldr r1, _0800E56C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	strh r1, [r0, #0xa]
	adds r0, r6, #0
	bl DestroyTask
	ldr r4, _0800E570
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _0800E556
	bl sub_08011D68
	ldrb r0, [r4, #0xf]
	adds r0, #1
	strb r0, [r4, #0xf]
_0800E556:
	ldr r0, _0800E574
	movs r1, #5
	bl CreateTask
_0800E55E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E564: .4byte 0x000008F6
_0800E568: .4byte 0x000008F7
_0800E56C: .4byte 0x03005B60
_0800E570: .4byte 0x020227FC
_0800E574: .4byte 0x0801034D
	thumb_func_end sub_0800E410

	thumb_func_start sub_0800E578
sub_0800E578: @ 0x0800E578
	push {r4, r5, lr}
	ldr r0, _0800E5B8
	ldrb r5, [r0]
	movs r4, #0
_0800E580:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0800E5A4
	lsls r2, r4, #3
	subs r2, r2, r4
	lsls r2, r2, #1
	ldr r0, _0800E5BC
	adds r2, r2, r0
	movs r0, #0x10
	adds r1, r4, #0
	movs r3, #0xe
	bl rfu_setRecvBuffer
	movs r0, #3
	adds r1, r4, #0
	bl rfu_clearSlot
_0800E5A4:
	lsrs r5, r5, #1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0800E580
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E5B8: .4byte 0x030041E0
_0800E5BC: .4byte 0x030050B4
	thumb_func_end sub_0800E578

	thumb_func_start sub_0800E5C0
sub_0800E5C0: @ 0x0800E5C0
	push {r4, r5, r6, lr}
	ldr r0, _0800E5FC
	ldrb r5, [r0]
	ldr r4, _0800E600
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x46
	bl rfu_UNI_setSendData
	adds r0, r5, #0
	bl sub_0800E340
	ldr r1, _0800E604
	adds r6, r4, r1
	adds r1, r4, #0
	adds r1, #0x53
	strb r0, [r1]
	adds r4, #0x5b
	strb r5, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r5, #0
	bl sub_0800E350
	movs r0, #1
	strb r0, [r6, #0xc]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E5FC: .4byte 0x030041E0
_0800E600: .4byte 0x030059DF
_0800E604: .4byte 0xFFFFF6C1
	thumb_func_end sub_0800E5C0

	thumb_func_start sub_0800E608
sub_0800E608: @ 0x0800E608
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x54
	bne _0800E63C
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0800E63C
	ldr r0, _0800E654
	ldrb r0, [r0]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	movs r0, #0
	movs r1, #0
	bl sub_08011554
_0800E63C:
	ldr r0, _0800E658
	ldrh r2, [r0, #4]
	adds r6, r0, #0
	cmp r2, #0x12
	bls _0800E648
	b _0800E7BA
_0800E648:
	lsls r0, r2, #2
	ldr r1, _0800E65C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E654: .4byte 0x030041E0
_0800E658: .4byte 0x030050A0
_0800E65C: .4byte 0x0800E660
_0800E660: @ jump table
	.4byte _0800E6AC @ case 0
	.4byte _0800E7BA @ case 1
	.4byte _0800E7BA @ case 2
	.4byte _0800E7BA @ case 3
	.4byte _0800E7BA @ case 4
	.4byte _0800E7BA @ case 5
	.4byte _0800E7BA @ case 6
	.4byte _0800E7BA @ case 7
	.4byte _0800E7BA @ case 8
	.4byte _0800E7BA @ case 9
	.4byte _0800E7BA @ case 10
	.4byte _0800E7BA @ case 11
	.4byte _0800E7BA @ case 12
	.4byte _0800E6FC @ case 13
	.4byte _0800E75C @ case 14
	.4byte _0800E7BA @ case 15
	.4byte _0800E770 @ case 16
	.4byte _0800E6D4 @ case 17
	.4byte _0800E7BA @ case 18
_0800E6AC:
	ldr r0, _0800E6C8
	bl sub_0800BA88
	ldr r0, _0800E6CC
	movs r2, #1
	strh r2, [r0, #4]
	ldr r1, _0800E6D0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r2, [r0, #0xa]
	b _0800E7BA
	.align 2, 0
_0800E6C8: .4byte 0x020227E4
_0800E6CC: .4byte 0x030050A0
_0800E6D0: .4byte 0x03005B60
_0800E6D4:
	ldr r3, _0800E6F0
	movs r0, #2
	movs r1, #0
	movs r2, #0xf0
	bl sub_0800BB10
	ldr r0, _0800E6F4
	bl sub_0800CFE8
	ldr r1, _0800E6F8
	movs r0, #0x12
	strh r0, [r1, #4]
	b _0800E7BA
	.align 2, 0
_0800E6F0: .4byte 0x082C0430
_0800E6F4: .4byte 0x0800E7F5
_0800E6F8: .4byte 0x030050A0
_0800E6FC:
	ldr r1, _0800E740
	adds r0, r6, r1
	ldrb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r1
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0x4c
	movs r2, #0xe
	bl rfu_UNI_setSendData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0800E7BA
	strb r0, [r6, #0xc]
	adds r0, r5, #0
	bl DestroyTask
	ldr r0, _0800E744
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0800E74C
	ldr r0, _0800E748
	movs r1, #1
	bl CreateTask
	b _0800E7BA
	.align 2, 0
_0800E740: .4byte 0x000008F6
_0800E744: .4byte 0x03005B60
_0800E748: .4byte 0x080107FD
_0800E74C:
	ldr r0, _0800E758
	movs r1, #5
	bl CreateTask
	b _0800E7BA
	.align 2, 0
_0800E758: .4byte 0x0801034D
_0800E75C:
	movs r0, #0
	bl sub_0800BD38
	ldr r1, _0800E76C
	movs r0, #0xf
	strh r0, [r1, #4]
	b _0800E7BA
	.align 2, 0
_0800E76C: .4byte 0x030050A0
_0800E770:
	ldr r0, _0800E7C0
	adds r1, r6, r0
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0800E7C4
	bl sub_0800CFE8
	movs r0, #1
	bl sub_08010B58
	bl sub_0800E578
	bl sub_0800E5C0
	movs r0, #0x14
	strh r0, [r6, #4]
	ldr r1, _0800E7C8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	strh r1, [r0, #0xa]
	movs r4, #1
	strb r4, [r6, #0xc]
	ldr r0, _0800E7CC
	movs r1, #5
	bl CreateTask
	movs r1, #0x9a
	lsls r1, r1, #4
	adds r0, r6, r1
	strb r4, [r0]
	adds r0, r5, #0
	bl DestroyTask
_0800E7BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E7C0: .4byte 0x00000993
_0800E7C4: .4byte 0x0800E87D
_0800E7C8: .4byte 0x03005B60
_0800E7CC: .4byte 0x0801034D
	thumb_func_end sub_0800E608

	thumb_func_start sub_0800E7D0
sub_0800E7D0: @ 0x0800E7D0
	push {lr}
	ldr r3, _0800E7E4
	movs r0, #1
	movs r1, #0
	movs r2, #0xf0
	bl sub_0800BB10
	pop {r0}
	bx r0
	.align 2, 0
_0800E7E4: .4byte 0x082C0430
	thumb_func_end sub_0800E7D0

	thumb_func_start sub_0800E7E8
sub_0800E7E8: @ 0x0800E7E8
	push {lr}
	movs r0, #0
	bl sub_0800BD38
	pop {r0}
	bx r0
	thumb_func_end sub_0800E7E8

	thumb_func_start sub_0800E7F4
sub_0800E7F4: @ 0x0800E7F4
	push {r4, lr}
	ldr r0, _0800E864
	movs r2, #0
	movs r1, #0xd
	adds r0, #0x59
_0800E7FE:
	strb r2, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _0800E7FE
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	ldr r1, _0800E868
	ldr r3, _0800E864
	ldr r0, _0800E86C
	adds r4, r3, r0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _0800E858
	ldr r2, _0800E870
	adds r1, r3, r2
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r1, #0x92
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r2, _0800E874
	adds r1, r3, r2
	bl sub_0800D294
	ldr r1, _0800E878
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
	bl sub_0800EB08
	ldrb r0, [r4]
	bl rfu_UNI_readySendData
	ldrb r0, [r4]
	bl rfu_UNI_clearRecvNewDataFlag
_0800E858:
	movs r0, #1
	bl rfu_REQ_sendData_wrapper
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E864: .4byte 0x030050A0
_0800E868: .4byte 0x03007610
_0800E86C: .4byte 0x000008F6
_0800E870: .4byte 0x00000988
_0800E874: .4byte 0x000008F7
_0800E878: .4byte 0x020227FC
	thumb_func_end sub_0800E7F4

	thumb_func_start sub_0800E87C
sub_0800E87C: @ 0x0800E87C
	ldr r0, _0800E88C
	ldr r1, _0800E890
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0800E88C: .4byte 0x030050A0
_0800E890: .4byte 0x00000993
	thumb_func_end sub_0800E87C

	thumb_func_start sub_0800E894
sub_0800E894: @ 0x0800E894
	push {r4, r5, r6, lr}
	bl sub_0800BB04
	ldr r4, _0800E8A8
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	bne _0800E8B0
	ldr r0, _0800E8AC
	b _0800E8B6
	.align 2, 0
_0800E8A8: .4byte 0x030050A0
_0800E8AC: .4byte 0x0800E20D
_0800E8B0:
	cmp r0, #0
	bne _0800E8D8
	ldr r0, _0800E8D4
_0800E8B6:
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0800E8F8
	adds r0, r4, #0
	adds r0, #0x67
	ldrb r0, [r0]
	bl DestroyTask
	bl sub_0800E0C8
	b _0800E8F8
	.align 2, 0
_0800E8D4: .4byte 0x0800E411
_0800E8D8:
	cmp r0, #2
	bne _0800E8F8
	ldr r0, _0800E930
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0800E8F8
	adds r0, r4, #0
	adds r0, #0x67
	ldrb r0, [r0]
	bl DestroyTask
	bl sub_0800E0C8
_0800E8F8:
	movs r5, #0
	ldr r6, _0800E934
_0800E8FC:
	lsls r0, r5, #2
	adds r0, r0, r6
	ldr r4, [r0]
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0800E91E
	adds r0, r4, #0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0800E91E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0800E8FC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E930: .4byte 0x0800E609
_0800E934: .4byte 0x082C0530
	thumb_func_end sub_0800E894

	thumb_func_start sub_0800E938
sub_0800E938: @ 0x0800E938
	push {lr}
	ldr r0, _0800E94C
	movs r1, #1
	bl CreateTask
	ldr r1, _0800E950
	adds r1, #0x67
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0800E94C: .4byte 0x0800E20D
_0800E950: .4byte 0x030050A0
	thumb_func_end sub_0800E938

	thumb_func_start sub_0800E954
sub_0800E954: @ 0x0800E954
	push {lr}
	ldr r1, _0800E96C
	ldrh r0, [r1, #4]
	cmp r0, #7
	bne _0800E974
	ldr r2, _0800E970
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800E974
	movs r0, #1
	b _0800E976
	.align 2, 0
_0800E96C: .4byte 0x030050A0
_0800E970: .4byte 0x00000985
_0800E974:
	movs r0, #0
_0800E976:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800E954

	thumb_func_start sub_0800E97C
sub_0800E97C: @ 0x0800E97C
	push {r4, lr}
	ldr r4, _0800E9AC
	ldrh r0, [r4, #4]
	cmp r0, #7
	bne _0800E9B8
	ldr r0, _0800E9B0
	ldr r1, [r0]
	ldr r2, _0800E9B4
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	movs r1, #0xf0
	bl sub_0800BBE8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800E9B8
	movs r0, #9
	strh r0, [r4, #4]
	movs r0, #1
	b _0800E9BA
	.align 2, 0
_0800E9AC: .4byte 0x030050A0
_0800E9B0: .4byte 0x03007630
_0800E9B4: .4byte 0x000008F5
_0800E9B8:
	movs r0, #0
_0800E9BA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0800E97C

	thumb_func_start sub_0800E9C0
sub_0800E9C0: @ 0x0800E9C0
	push {lr}
	ldr r0, _0800E9D4
	movs r1, #1
	bl CreateTask
	ldr r1, _0800E9D8
	adds r1, #0x67
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0800E9D4: .4byte 0x0800E411
_0800E9D8: .4byte 0x030050A0
	thumb_func_end sub_0800E9C0

	thumb_func_start sub_0800E9DC
sub_0800E9DC: @ 0x0800E9DC
	push {lr}
	ldr r0, _0800E9EC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800E9F0
	movs r0, #0
	b _0800E9F2
	.align 2, 0
_0800E9EC: .4byte 0x030041E0
_0800E9F0:
	movs r0, #1
_0800E9F2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800E9DC

	thumb_func_start sub_0800E9F8
sub_0800E9F8: @ 0x0800E9F8
	ldr r1, _0800EA0C
	movs r0, #4
	strh r0, [r1, #4]
	ldr r0, _0800EA10
	ldrb r0, [r0]
	ldr r2, _0800EA14
	adds r1, r1, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0800EA0C: .4byte 0x030050A0
_0800EA10: .4byte 0x030041E0
_0800EA14: .4byte 0x0000099F
	thumb_func_end sub_0800E9F8

	thumb_func_start sub_0800EA18
sub_0800EA18: @ 0x0800EA18
	push {lr}
	adds r1, r0, #0
	ldr r2, _0800EA30
	ldrh r0, [r2, #4]
	cmp r0, #0x11
	beq _0800EA28
	cmp r1, #0
	beq _0800EA34
_0800EA28:
	movs r0, #0x12
	strh r0, [r2, #4]
	movs r0, #1
	b _0800EA36
	.align 2, 0
_0800EA30: .4byte 0x030050A0
_0800EA34:
	movs r0, #0
_0800EA36:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800EA18

	thumb_func_start sub_0800EA3C
sub_0800EA3C: @ 0x0800EA3C
	ldr r1, _0800EA44
	movs r0, #0xe
	strh r0, [r1, #4]
	bx lr
	.align 2, 0
_0800EA44: .4byte 0x030050A0
	thumb_func_end sub_0800EA3C

	thumb_func_start sub_0800EA48
sub_0800EA48: @ 0x0800EA48
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0
	b _0800EA5A
_0800EA52:
	lsrs r1, r1, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0800EA5A:
	cmp r2, #3
	bhi _0800EA6C
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800EA52
	adds r0, r2, #0
	bl rfu_UNI_readySendData
_0800EA6C:
	pop {r0}
	bx r0
	thumb_func_end sub_0800EA48

	thumb_func_start sub_0800EA70
sub_0800EA70: @ 0x0800EA70
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r2, #0
	ldr r7, _0800EAC4
	ldr r0, _0800EAC8
	adds r6, r7, #0
	ldr r1, _0800EACC
	adds r5, r0, r1
_0800EA80:
	movs r3, #0
	lsls r0, r2, #3
	lsls r1, r2, #4
	adds r4, r2, #1
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r2, r0, r5
	adds r1, r1, r6
_0800EA90:
	ldrh r0, [r1]
	lsrs r0, r0, #8
	strb r0, [r2, #1]
	ldrh r0, [r1]
	strb r0, [r2]
	adds r2, #2
	adds r1, #2
	adds r3, #1
	cmp r3, #6
	ble _0800EA90
	adds r2, r4, #0
	cmp r2, #4
	ble _0800EA80
	movs r0, #0
	mov r1, sp
	strh r0, [r1]
	ldr r2, _0800EAD0
	mov r0, sp
	adds r1, r7, #0
	bl CpuSet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EAC4: .4byte 0x03003130
_0800EAC8: .4byte 0x030050A0
_0800EACC: .4byte 0x0000093F
_0800EAD0: .4byte 0x01000028
	thumb_func_end sub_0800EA70

	thumb_func_start sub_0800EAD4
sub_0800EAD4: @ 0x0800EAD4
	push {lr}
	ldr r3, _0800EB00
	ldr r2, _0800EB04
	movs r1, #6
_0800EADC:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0800EADC
	ldr r1, _0800EB00
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0xc
_0800EAF2:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _0800EAF2
	pop {r0}
	bx r0
	.align 2, 0
_0800EB00: .4byte 0x030031B0
_0800EB04: .4byte 0x03003130
	thumb_func_end sub_0800EAD4

	thumb_func_start sub_0800EB08
sub_0800EB08: @ 0x0800EB08
	push {r4, r5, lr}
	ldr r4, _0800EB68
	ldr r0, _0800EB6C
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800EB3A
	ldr r1, _0800EB70
	adds r0, r4, r1
	adds r1, r4, #0
	adds r1, #0x4c
	bl sub_0800D594
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0800EB74
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, r0, #0
	cmp r1, #0
	bne _0800EB36
	ldrb r0, [r5]
	strb r1, [r5]
_0800EB36:
	cmp r2, #0
	bne _0800EB60
_0800EB3A:
	ldr r5, _0800EB68
	ldr r1, _0800EB6C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800EB60
	movs r1, #0xd4
	lsls r1, r1, #3
	adds r0, r5, r1
	adds r4, r5, #0
	adds r4, #0x4c
	adds r1, r4, #0
	bl sub_0800D4A8
	ldr r1, _0800EB70
	adds r0, r5, r1
	adds r1, r4, #0
	bl sub_0800D534
_0800EB60:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EB68: .4byte 0x030050A0
_0800EB6C: .4byte 0x000008F4
_0800EB70: .4byte 0x000008D4
_0800EB74: .4byte 0x000008F2
	thumb_func_end sub_0800EB08

	thumb_func_start IsRfuRecvQueueEmpty
IsRfuRecvQueueEmpty: @ 0x0800EB78
	push {r4, lr}
	ldr r0, _0800EB88
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _0800EB8C
_0800EB84:
	movs r0, #0
	b _0800EBAC
	.align 2, 0
_0800EB88: .4byte 0x03007630
_0800EB8C:
	movs r3, #0
	ldr r4, _0800EBB4
_0800EB90:
	movs r2, #0
	lsls r0, r3, #4
	adds r1, r0, r4
_0800EB96:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0800EB84
	adds r1, #2
	adds r2, #1
	cmp r2, #6
	ble _0800EB96
	adds r3, #1
	cmp r3, #4
	ble _0800EB90
	movs r0, #1
_0800EBAC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EBB4: .4byte 0x03003130
	thumb_func_end IsRfuRecvQueueEmpty

	thumb_func_start sub_0800EBB8
sub_0800EBB8: @ 0x0800EBB8
	push {r4, r5, r6, lr}
	ldr r6, _0800EBD4
	ldrh r0, [r6, #4]
	cmp r0, #0x13
	bhi _0800EBD8
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	movs r0, #0
	bl rfu_REQ_sendData_wrapper
	b _0800EC92
	.align 2, 0
_0800EBD4: .4byte 0x030050A0
_0800EBD8:
	ldr r0, _0800EC34
	adds r1, r6, r0
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0800EC38
	adds r1, r6, r0
	ldr r0, _0800EC3C
	ldr r0, [r0]
	ldrb r1, [r1]
	ldrb r0, [r0, #2]
	ands r0, r1
	cmp r0, r1
	bne _0800EC92
	cmp r0, #0
	beq _0800EC92
	ldr r1, _0800EC40
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r5, r0, #0
	cmp r5, #0
	bne _0800EC88
	ldr r0, _0800EC44
	adds r4, r6, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0800EC68
	bl sub_08011858
	strb r5, [r4]
	ldr r1, _0800EC48
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800EC4C
	movs r4, #0x80
	lsls r4, r4, #8
	movs r0, #2
	adds r1, r4, #0
	bl sub_08011554
	adds r0, r4, #0
	bl sub_08010C60
	b _0800EC92
	.align 2, 0
_0800EC34: .4byte 0x00000993
_0800EC38: .4byte 0x0000099A
_0800EC3C: .4byte 0x03007630
_0800EC40: .4byte 0x00000994
_0800EC44: .4byte 0x0000099B
_0800EC48: .4byte 0x0000099C
_0800EC4C:
	ldr r0, _0800EC60
	ldrb r4, [r0]
	cmp r4, #0
	bne _0800EC68
	bl sub_0800E894
	ldr r0, _0800EC64
	strb r4, [r0]
	b _0800EC92
	.align 2, 0
_0800EC60: .4byte 0x030041E0
_0800EC64: .4byte 0x030031C4
_0800EC68:
	bl sub_0800EA70
	ldr r0, _0800EC80
	ldr r1, _0800EC84
	adds r0, r0, r1
	ldrb r0, [r0]
	bl rfu_UNI_readySendData
	movs r0, #1
	bl rfu_REQ_sendData_wrapper
	b _0800EC8C
	.align 2, 0
_0800EC80: .4byte 0x030050A0
_0800EC84: .4byte 0x00000992
_0800EC88:
	bl rfu_REQ_PARENT_resumeRetransmitAndChange
_0800EC8C:
	ldr r1, _0800EC9C
	movs r0, #1
	strb r0, [r1, #0xe]
_0800EC92:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800EC9C: .4byte 0x030050A0
	thumb_func_end sub_0800EBB8

	thumb_func_start sub_0800ECA0
sub_0800ECA0: @ 0x0800ECA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0800ED80
	ldrh r1, [r0, #4]
	adds r6, r0, #0
	cmp r1, #0x13
	bhi _0800ECB8
	b _0800EF1A
_0800ECB8:
	ldrb r0, [r6, #0xe]
	cmp r0, #1
	beq _0800ECC0
	b _0800EF1A
_0800ECC0:
	bl rfu_waitREQComplete
	ldr r0, _0800ED84
	adds r2, r6, r0
	ldrb r0, [r2]
	cmp r0, #0
	bne _0800ECE0
	adds r1, r6, #0
	adds r1, #0xee
_0800ECD2:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800ECDA
	b _0800EF40
_0800ECDA:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0800ECD2
_0800ECE0:
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	ldr r2, _0800ED88
	ldr r4, _0800ED80
	ldr r1, _0800ED8C
	adds r0, r4, r1
	ldrb r1, [r2, #3]
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, r0
	beq _0800ECFC
	b _0800EF04
_0800ECFC:
	ldr r6, _0800ED90
	adds r1, r4, r6
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0800ED94
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
	ldrb r7, [r2]
	movs r5, #0
_0800ED12:
	movs r0, #1
	ands r0, r7
	lsrs r1, r7, #1
	str r1, [sp, #4]
	adds r2, r5, #1
	str r2, [sp]
	cmp r0, #0
	bne _0800ED24
	b _0800EE24
_0800ED24:
	ldr r1, _0800ED80
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r4, r0, #1
	adds r0, r1, #0
	adds r0, #0x15
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r6, r1, #0
	adds r3, r2, #0
	lsls r1, r5, #0x18
	mov sl, r1
	cmp r0, #0
	beq _0800EE1C
	ldr r2, _0800ED98
	adds r0, r6, r2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800EDA0
	adds r0, r6, #0
	adds r0, #0x14
	adds r0, r4, r0
	ldrb r2, [r0]
	lsrs r2, r2, #5
	ldrb r0, [r1]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	cmp r2, r0
	beq _0800EDA0
	ldr r0, _0800ED9C
	adds r1, r6, r0
	adds r1, r5, r1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _0800EE1C
	movs r0, #0x81
	lsls r0, r0, #8
	bl sub_08010C60
	b _0800EE1C
	.align 2, 0
_0800ED80: .4byte 0x030050A0
_0800ED84: .4byte 0x00000993
_0800ED88: .4byte 0x030041E0
_0800ED8C: .4byte 0x0000099A
_0800ED90: .4byte 0x00000994
_0800ED94: .4byte 0x020227FC
_0800ED98: .4byte 0x000009A6
_0800ED9C: .4byte 0x000009A2
_0800EDA0:
	ldr r2, _0800EEE0
	ldr r6, _0800EEE4
	adds r1, r2, r6
	adds r1, r5, r1
	subs r3, r3, r5
	lsls r3, r3, #1
	adds r4, r2, #0
	adds r4, #0x14
	adds r2, r3, r4
	ldrb r0, [r2]
	lsrs r0, r0, #5
	strb r0, [r1]
	ldr r1, _0800EEE0
	subs r6, #4
	adds r0, r1, r6
	adds r0, r5, r0
	movs r1, #0
	strb r1, [r0]
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	strb r0, [r2]
	ldr r2, _0800EEE8
	adds r0, r5, r2
	ldrb r0, [r0]
	movs r6, #0
	lsls r1, r5, #0x18
	mov sl, r1
	lsrs r2, r7, #1
	str r2, [sp, #4]
	adds r5, #1
	str r5, [sp]
	ldr r1, _0800EEEC
	mov sb, r1
	adds r5, r3, #0
	adds r7, r4, #0
	lsls r0, r0, #4
	mov r8, r0
	adds r2, r5, #1
	mov ip, r2
_0800EDF0:
	lsls r1, r6, #1
	mov r0, r8
	adds r4, r1, r0
	add r4, sb
	mov r2, ip
	adds r3, r1, r2
	adds r3, r3, r7
	ldrb r2, [r3]
	lsls r2, r2, #8
	adds r1, r1, r5
	adds r1, r1, r7
	ldrb r0, [r1]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #0
	strb r0, [r3]
	strb r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #6
	bls _0800EDF0
_0800EE1C:
	mov r1, sl
	lsrs r0, r1, #0x18
	bl rfu_UNI_clearRecvNewDataFlag
_0800EE24:
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	lsrs r7, r0, #0x10
	ldr r6, [sp]
	lsls r0, r6, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bhi _0800EE36
	b _0800ED12
_0800EE36:
	bl sub_0800EAD4
	movs r0, #0
	bl sub_0800F350
	bl sub_08010028
	ldr r4, _0800EEE0
	ldr r1, _0800EEF0
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800EF12
	ldr r2, _0800EEF4
	adds r0, r4, r2
	ldrb r2, [r0]
	cmp r2, #0
	bne _0800EF12
	ldr r0, _0800EEF8
	ldrb r1, [r0, #0xe]
	strb r2, [r0, #0xe]
	ldr r6, _0800EEFC
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, #3
	bl rfu_clearSlot
	movs r5, #0
	adds r7, r4, #0
	adds r7, #0x14
_0800EE72:
	ldr r0, _0800EEF0
	adds r6, r4, r0
	ldrb r0, [r6]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800EE96
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r5, #3
	subs r2, r2, r5
	lsls r2, r2, #1
	adds r2, r2, r7
	movs r0, #0x10
	movs r3, #0xe
	bl rfu_setRecvBuffer
_0800EE96:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _0800EE72
	subs r4, r6, #3
	ldrb r0, [r4]
	ldrb r2, [r6]
	adds r1, r0, #0
	orrs r1, r2
	bl sub_0800E350
	ldrb r1, [r6]
	movs r2, #0
	strb r1, [r6, #4]
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	strb r2, [r6]
	ldrb r0, [r4]
	adds r1, r6, #0
	subs r1, #0x5e
	movs r2, #0x46
	bl rfu_UNI_setSendData
	ldrb r0, [r4]
	bl sub_0800E340
	adds r1, r6, #0
	subs r1, #0xb
	strb r0, [r1]
	ldr r0, _0800EF00
	movs r1, #0
	bl CreateTask
	b _0800EF12
	.align 2, 0
_0800EEE0: .4byte 0x030050A0
_0800EEE4: .4byte 0x000009A6
_0800EEE8: .4byte 0x03005A36
_0800EEEC: .4byte 0x03003130
_0800EEF0: .4byte 0x0000099D
_0800EEF4: .4byte 0x00000991
_0800EEF8: .4byte 0x020227FC
_0800EEFC: .4byte 0x00000992
_0800EF00: .4byte 0x080105A5
_0800EF04:
	ldr r2, _0800EF34
	adds r1, r4, r2
	ldrb r0, [r1]
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	strb r2, [r4, #0xe]
_0800EF12:
	ldr r1, _0800EF38
	movs r0, #0
	strb r0, [r1, #0xe]
	adds r6, r1, #0
_0800EF1A:
	ldr r1, _0800EF34
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r1, r0, #0
	ldr r0, _0800EF3C
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _0800EF44
	movs r0, #1
	ands r0, r1
	b _0800EF46
	.align 2, 0
_0800EF34: .4byte 0x00000994
_0800EF38: .4byte 0x030050A0
_0800EF3C: .4byte 0x03007630
_0800EF40:
	movs r0, #0
	b _0800EF46
_0800EF44:
	movs r0, #0
_0800EF46:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800ECA0

	thumb_func_start sub_0800EF58
sub_0800EF58: @ 0x0800EF58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldrh r1, [r4]
	cmp r1, #0
	beq _0800EF9C
	ldr r0, _0800EF98
	movs r5, #0x81
	lsls r5, r5, #1
	adds r3, r0, r5
	ldrb r0, [r3]
	lsls r0, r0, #5
	orrs r0, r1
	strh r0, [r4]
	ldrb r0, [r3]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	strb r0, [r3]
	adds r3, r4, #0
	movs r4, #6
_0800EF82:
	ldrh r1, [r3]
	lsrs r0, r1, #8
	strb r0, [r2, #1]
	strb r1, [r2]
	adds r2, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _0800EF82
	b _0800EFAA
	.align 2, 0
_0800EF98: .4byte 0x030050A0
_0800EF9C:
	movs r1, #0
	adds r0, r2, #0
	adds r0, #0xd
_0800EFA2:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r2
	bge _0800EFA2
_0800EFAA:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0800EF58

	thumb_func_start sub_0800EFB0
sub_0800EFB0: @ 0x0800EFB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x58
	ldr r0, _0800F0D4
	mov r1, sp
	bl sub_0800D3F4
	movs r1, #0
	ldr r0, _0800F0D8
	mov ip, r0
_0800EFC6:
	movs r4, #0
	lsls r0, r1, #3
	adds r2, r1, #1
	mov r8, r2
	lsls r6, r1, #4
	subs r0, r0, r1
	lsls r5, r0, #1
_0800EFD4:
	lsls r1, r4, #1
	adds r3, r1, r6
	add r3, ip
	adds r1, r5, r1
	adds r0, r1, #1
	add r0, sp
	ldrb r2, [r0]
	lsls r2, r2, #8
	mov r7, sp
	adds r0, r7, r1
	ldrb r0, [r0]
	orrs r0, r2
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _0800EFD4
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0800EFC6
	movs r0, #0
	bl sub_0800F350
	ldr r0, _0800F0DC
	ldrb r0, [r0, #2]
	cmp r0, #0
	bne _0800F080
	ldr r0, _0800F0E0
	ldr r2, _0800F0E4
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800F080
	ldr r0, _0800F0E8
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	ldrb r0, [r0, #3]
	orrs r0, r1
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0800F04C
	cmp r0, #6
	beq _0800F04C
	cmp r0, #9
	beq _0800F04C
	movs r1, #0x90
	lsls r1, r1, #8
	movs r0, #2
	bl sub_08011554
_0800F04C:
	bl rfu_clearAllSlot
	ldr r1, _0800F0EC
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0800F0E0
	movs r5, #0
	str r5, [r0]
	ldr r7, _0800F0E4
	adds r6, r0, r7
	ldrb r0, [r6]
	cmp r0, #1
	bne _0800F078
	movs r4, #0x90
	lsls r4, r4, #8
	movs r0, #2
	adds r1, r4, #0
	bl sub_08011554
	adds r0, r4, #0
	bl sub_08010C60
_0800F078:
	ldr r0, _0800F0DC
	strb r5, [r0, #5]
	strb r5, [r0, #4]
	strb r5, [r6]
_0800F080:
	ldr r6, _0800F0E0
	ldr r0, _0800F0F0
	adds r2, r6, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0800F0C4
	ldrb r0, [r2]
	subs r0, #1
	ldrb r1, [r2]
	strb r0, [r2]
	bl sub_08010028
	ldr r5, _0800F0F4
	add r4, sp, #0x48
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800EF58
	movs r1, #0xd4
	lsls r1, r1, #3
	adds r0, r6, r1
	adds r1, r4, #0
	bl sub_0800D348
	movs r1, #0
	movs r2, #0
_0800F0B4:
	lsls r0, r1, #1
	adds r0, r0, r5
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #6
	bls _0800F0B4
_0800F0C4:
	bl IsRfuRecvQueueEmpty
	add sp, #0x58
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800F0D4: .4byte 0x030051C4
_0800F0D8: .4byte 0x03003130
_0800F0DC: .4byte 0x030041E0
_0800F0E0: .4byte 0x030050A0
_0800F0E4: .4byte 0x0000099C
_0800F0E8: .4byte 0x03007630
_0800F0EC: .4byte 0x030031C4
_0800F0F0: .4byte 0x00000988
_0800F0F4: .4byte 0x030031B0
	thumb_func_end sub_0800EFB0

	thumb_func_start sub_0800F0F8
sub_0800F0F8: @ 0x0800F0F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0800F1A4
	ldr r2, [r0, #0x70]
	mov sl, r2
	movs r5, #0
	adds r2, r0, #0
	adds r2, #0x6e
	ldrh r3, [r2]
	cmp r5, r3
	bge _0800F194
	mov sb, r0
	ldr r0, _0800F1A8
	mov r8, r0
_0800F11A:
	movs r0, #1
	ands r0, r1
	lsrs r7, r1, #1
	adds r6, r5, #1
	cmp r0, #0
	bne _0800F188
	ldr r1, _0800F1AC
	adds r0, r1, #0
	adds r1, r5, #0
	orrs r1, r0
	mov r2, r8
	strh r1, [r2]
	movs r4, #0
	lsls r0, r5, #1
	ldr r3, _0800F1B0
	mov ip, r3
	adds r0, r0, r5
	lsls r0, r0, #2
	mov r1, sl
	adds r2, r0, r1
	mov r3, r8
	adds r3, #2
_0800F146:
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	ldrb r0, [r2]
	orrs r0, r1
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	adds r4, #1
	cmp r4, #6
	ble _0800F146
	movs r4, #0
	ldr r2, _0800F1A8
	ldr r1, _0800F1B0
_0800F160:
	ldrh r0, [r2]
	lsrs r0, r0, #8
	strb r0, [r1, #1]
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #6
	ble _0800F160
	ldr r0, _0800F1B4
	mov r1, ip
	bl sub_0800D348
	movs r1, #1
	lsls r1, r5
	mov r2, sb
	ldr r0, [r2, #0x78]
	orrs r0, r1
	str r0, [r2, #0x78]
_0800F188:
	adds r1, r7, #0
	adds r5, r6, #0
	ldr r3, _0800F1B8
	ldrh r3, [r3]
	cmp r5, r3
	blt _0800F11A
_0800F194:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F1A4: .4byte 0x030050A0
_0800F1A8: .4byte 0x03000D90
_0800F1AC: .4byte 0xFFFF8900
_0800F1B0: .4byte 0x03000D80
_0800F1B4: .4byte 0x03005740
_0800F1B8: .4byte 0x0300510E
	thumb_func_end sub_0800F0F8

	thumb_func_start sub_0800F1BC
sub_0800F1BC: @ 0x0800F1BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0800F1D8
	ldrb r2, [r0, #0xc]
	cmp r2, #1
	bne _0800F1DC
	cmp r1, #0
	beq _0800F1DC
	adds r0, #0x61
	adds r0, r1, r0
	strb r2, [r0]
	b _0800F1E4
	.align 2, 0
_0800F1D8: .4byte 0x030050A0
_0800F1DC:
	adds r0, #0x5c
	adds r0, r1, r0
	movs r1, #1
	strb r1, [r0]
_0800F1E4:
	pop {r0}
	bx r0
	thumb_func_end sub_0800F1BC

	thumb_func_start sub_0800F1E8
sub_0800F1E8: @ 0x0800F1E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0800F208
	adds r1, r3, #0
	adds r1, #0x5c
	adds r1, r0, r1
	movs r2, #0
	strb r2, [r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r1, #0x92
	strb r2, [r1]
	bx lr
	.align 2, 0
_0800F208: .4byte 0x030050A0
	thumb_func_end sub_0800F1E8

	thumb_func_start sub_0800F20C
sub_0800F20C: @ 0x0800F20C
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _0800F220
	ldrb r1, [r0, #0xc]
	adds r5, r0, #0
	cmp r1, #1
	bne _0800F224
	movs r0, #0
	b _0800F246
	.align 2, 0
_0800F220: .4byte 0x030050A0
_0800F224:
	movs r2, #0
	ldr r0, _0800F24C
	adds r4, r5, r0
_0800F22A:
	adds r1, r2, r4
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0800F22A
	ldr r1, _0800F250
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_0800F246:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800F24C: .4byte 0x00000996
_0800F250: .4byte 0x000008F6
	thumb_func_end sub_0800F20C

	thumb_func_start rfu_func_080F97B8
rfu_func_080F97B8: @ 0x0800F254
	push {lr}
	ldr r0, _0800F28C
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800F286
	ldr r3, _0800F290
	ldrh r2, [r3]
	cmp r2, #0
	beq _0800F286
	ldr r0, _0800F294
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800F286
	ldr r1, _0800F298
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r0, r2
	strh r0, [r3]
	movs r0, #0xbe
	lsls r0, r0, #8
	bl sub_0800F7F8
_0800F286:
	pop {r0}
	bx r0
	.align 2, 0
_0800F28C: .4byte 0x030031C4
_0800F290: .4byte 0x03005B08
_0800F294: .4byte 0x03002354
_0800F298: .4byte 0x03000D78
	thumb_func_end rfu_func_080F97B8

	thumb_func_start sub_0800F29C
sub_0800F29C: @ 0x0800F29C
	ldr r0, _0800F2A0
	bx lr
	.align 2, 0
_0800F2A0: .4byte 0x020227CC
	thumb_func_end sub_0800F29C

	thumb_func_start IsSendingKeysToRfu
IsSendingKeysToRfu: @ 0x0800F2A4
	push {lr}
	movs r2, #0
	ldr r0, _0800F2BC
	ldr r1, [r0]
	ldr r0, _0800F2C0
	cmp r1, r0
	bne _0800F2B4
	movs r2, #1
_0800F2B4:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800F2BC: .4byte 0x030050A0
_0800F2C0: .4byte 0x0800F255
	thumb_func_end IsSendingKeysToRfu

	thumb_func_start sub_0800F2C4
sub_0800F2C4: @ 0x0800F2C4
	push {r4, lr}
	ldr r4, _0800F2E4
	ldr r0, [r4]
	cmp r0, #0
	beq _0800F2DA
	ldr r0, _0800F2E8
	ldr r1, _0800F2EC
	ldr r2, _0800F2F0
	movs r3, #1
	bl AGBAssert
_0800F2DA:
	ldr r0, _0800F2F4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800F2E4: .4byte 0x030050A0
_0800F2E8: .4byte 0x082C053C
_0800F2EC: .4byte 0x000005E6
_0800F2F0: .4byte 0x082C0544
_0800F2F4: .4byte 0x0800F255
	thumb_func_end sub_0800F2C4

	thumb_func_start Rfu_set_zero
Rfu_set_zero: @ 0x0800F2F8
	ldr r1, _0800F300
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_0800F300: .4byte 0x030050A0
	thumb_func_end Rfu_set_zero

	thumb_func_start sub_0800F304
sub_0800F304: @ 0x0800F304
	push {lr}
	movs r0, #0x88
	lsls r0, r0, #7
	bl sub_0800F7F8
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F320
	bl GetBlenderArrowPosition
	ldr r1, _0800F32C
	strh r0, [r1, #0xc]
_0800F320:
	ldr r1, _0800F330
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0800F32C: .4byte 0x030031B0
_0800F330: .4byte 0x02022078
	thumb_func_end sub_0800F304

	thumb_func_start sub_0800F334
sub_0800F334: @ 0x0800F334
	push {lr}
	ldr r1, _0800F348
	ldr r0, [r1]
	cmp r0, #0
	bne _0800F342
	ldr r0, _0800F34C
	str r0, [r1]
_0800F342:
	pop {r0}
	bx r0
	.align 2, 0
_0800F348: .4byte 0x030050A0
_0800F34C: .4byte 0x0800F305
	thumb_func_end sub_0800F334

	thumb_func_start sub_0800F350
sub_0800F350: @ 0x0800F350
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov r8, r0
_0800F35E:
	mov r1, r8
	lsls r0, r1, #4
	ldr r2, _0800F3A4
	adds r1, r0, r2
	ldrh r7, [r1]
	movs r3, #0xff
	lsls r3, r3, #8
	adds r1, r3, #0
	ands r1, r7
	movs r2, #0x88
	lsls r2, r2, #8
	adds r5, r0, #0
	cmp r1, r2
	beq _0800F444
	cmp r1, r2
	bgt _0800F3BA
	movs r0, #0xcc
	lsls r0, r0, #7
	cmp r1, r0
	bne _0800F388
	b _0800F5C4
_0800F388:
	cmp r1, r0
	bgt _0800F3A8
	movs r0, #0x88
	lsls r0, r0, #7
	cmp r1, r0
	bne _0800F396
	b _0800F6D8
_0800F396:
	movs r0, #0xbe
	lsls r0, r0, #7
	cmp r1, r0
	bne _0800F3A0
	b _0800F5B4
_0800F3A0:
	b _0800F6E8
	.align 2, 0
_0800F3A4: .4byte 0x03003130
_0800F3A8:
	movs r0, #0xee
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800F404
	movs r0, #0xf0
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800F3F2
	b _0800F6E8
_0800F3BA:
	movs r0, #0xbe
	lsls r0, r0, #8
	cmp r1, r0
	bne _0800F3C4
	b _0800F6D8
_0800F3C4:
	cmp r1, r0
	bgt _0800F3DC
	movs r0, #0x89
	lsls r0, r0, #8
	cmp r1, r0
	beq _0800F4AC
	movs r0, #0xa1
	lsls r0, r0, #8
	cmp r1, r0
	bne _0800F3DA
	b _0800F590
_0800F3DA:
	b _0800F6E8
_0800F3DC:
	movs r0, #0xed
	lsls r0, r0, #8
	cmp r1, r0
	bne _0800F3E6
	b _0800F5F4
_0800F3E6:
	movs r0, #0xee
	lsls r0, r0, #8
	cmp r1, r0
	bne _0800F3F0
	b _0800F694
_0800F3F0:
	b _0800F6E8
_0800F3F2:
	ldr r4, _0800F42C
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	bne _0800F404
	ldr r0, _0800F430
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800F404
	b _0800F734
_0800F404:
	ldr r0, _0800F434
	ldr r0, [r0]
	ldrb r0, [r0]
	mov r6, r8
	adds r6, #1
	cmp r0, #0
	beq _0800F414
	b _0800F6EC
_0800F414:
	ldr r1, _0800F438
	adds r0, r5, r1
	ldrh r0, [r0]
	ldr r2, _0800F42C
	strb r0, [r2, #0xd]
	ldr r3, _0800F43C
	adds r0, r5, r3
	bl sub_0800F20C
	ldr r4, _0800F440
	strb r0, [r4]
	b _0800F6EC
	.align 2, 0
_0800F42C: .4byte 0x030050A0
_0800F430: .4byte 0x030031C4
_0800F434: .4byte 0x03007630
_0800F438: .4byte 0x03003132
_0800F43C: .4byte 0x03003134
_0800F440: .4byte 0x03005A26
_0800F444:
	ldr r0, _0800F4A0
	mov sb, r0
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r7, r0, #2
	mov r2, sb
	adds r3, r7, r2
	movs r4, #0x92
	adds r4, r4, r3
	mov ip, r4
	ldrb r4, [r4]
	mov r6, r8
	adds r6, #1
	cmp r4, #0
	beq _0800F466
	b _0800F6EC
_0800F466:
	adds r0, r3, #0
	adds r0, #0x80
	movs r2, #0
	strh r4, [r0]
	ldr r1, _0800F4A4
	adds r0, r5, r1
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x82
	strh r0, [r1]
	ldr r1, _0800F4A8
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x91
	strb r1, [r0]
	mov r0, sb
	adds r0, #0x88
	adds r0, r7, r0
	str r4, [r0]
	movs r0, #1
	mov r3, ip
	strb r0, [r3]
	mov r0, sb
	adds r0, #0x5c
	add r0, r8
	strb r2, [r0]
	b _0800F6EC
	.align 2, 0
_0800F4A0: .4byte 0x030050A0
_0800F4A4: .4byte 0x03003132
_0800F4A8: .4byte 0x03003134
_0800F4AC:
	ldr r4, _0800F57C
	mov sb, r4
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r1, r0
	lsls r4, r0, #2
	mov r3, sb
	adds r2, r4, r3
	adds r0, r2, #0
	adds r0, #0x92
	ldrb r3, [r0]
	mov sl, r1
	mov r6, r8
	adds r6, #1
	cmp r3, #1
	beq _0800F4CE
	b _0800F6EC
_0800F4CE:
	movs r0, #0xff
	ands r0, r7
	adds r2, #0x80
	strh r0, [r2]
	mov r1, sb
	adds r1, #0x88
	adds r1, r4, r1
	lsls r3, r0
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
	movs r4, #0
	ldr r0, _0800F580
	mov sb, r0
	mov ip, r2
	mov r1, r8
	lsls r7, r1, #8
	adds r3, r5, #0
_0800F4F2:
	mov r2, ip
	ldrh r0, [r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r7
	add r1, sb
	adds r2, r4, #1
	lsls r0, r2, #1
	adds r0, r0, r3
	ldr r4, _0800F584
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	cmp r4, #5
	bls _0800F4F2
	ldr r4, _0800F57C
	mov r0, sl
	add r0, r8
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x88
	adds r1, r0, r1
	adds r2, r0, r4
	adds r0, r2, #0
	adds r0, #0x82
	ldrh r0, [r0]
	lsls r0, r0, #2
	ldr r3, _0800F588
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	beq _0800F540
	b _0800F6EC
_0800F540:
	adds r1, r2, #0
	adds r1, #0x92
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800F1BC
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x45
	beq _0800F562
	b _0800F6EC
_0800F562:
	ldr r0, _0800F58C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800F56C
	b _0800F6EC
_0800F56C:
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _0800F574
	b _0800F6EC
_0800F574:
	ldr r0, _0800F580
	bl sub_08010568
	b _0800F6EC
	.align 2, 0
_0800F57C: .4byte 0x030050A0
_0800F580: .4byte 0x0202207C
_0800F584: .4byte 0x03003130
_0800F588: .4byte 0x082C0378
_0800F58C: .4byte 0x030031C4
_0800F590:
	ldr r2, _0800F5AC
	ldr r3, _0800F5B0
	adds r0, r5, r3
	ldrh r1, [r0]
	lsls r1, r1, #3
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_0800F968
	b _0800F6E8
	.align 2, 0
_0800F5AC: .4byte 0x082C0408
_0800F5B0: .4byte 0x03003132
_0800F5B4:
	ldr r1, _0800F5C0
	add r1, r8
	movs r0, #1
	strb r0, [r1]
	b _0800F6E8
	.align 2, 0
_0800F5C0: .4byte 0x03005184
_0800F5C4:
	ldr r2, _0800F5EC
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	ldr r3, _0800F5F0
	adds r1, r5, r3
	ldrh r0, [r0]
	mov r6, r8
	adds r6, #1
	ldrh r1, [r1]
	cmp r0, r1
	beq _0800F5DE
	b _0800F6EC
_0800F5DE:
	adds r0, r2, #0
	adds r0, #0xe9
	add r0, r8
	movs r1, #1
	strb r1, [r0]
	b _0800F6EC
	.align 2, 0
_0800F5EC: .4byte 0x030050A0
_0800F5F0: .4byte 0x03003132
_0800F5F4:
	ldr r7, _0800F640
	ldrb r2, [r7, #0xc]
	cmp r2, #0
	bne _0800F65C
	ldr r3, _0800F644
	ldrb r0, [r3]
	mov r6, r8
	adds r6, #1
	cmp r0, #0
	beq _0800F6EC
	ldr r0, _0800F648
	adds r4, r5, r0
	ldrh r1, [r4]
	ldr r0, _0800F64C
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	ands r1, r0
	cmp r1, #0
	beq _0800F62C
	strb r2, [r3]
	bl sub_0800D0EC
	ldr r1, _0800F650
	adds r0, r5, r1
	ldrh r1, [r0]
	ldr r2, _0800F654
	adds r0, r7, r2
	strb r1, [r0]
_0800F62C:
	ldr r0, _0800F658
	adds r0, #6
	adds r0, r5, r0
	ldrh r0, [r0]
	strb r0, [r7, #0xd]
	ldrh r0, [r4]
	bl sub_080104E8
	b _0800F6EC
	.align 2, 0
_0800F640: .4byte 0x030050A0
_0800F644: .4byte 0x030031C4
_0800F648: .4byte 0x03003132
_0800F64C: .4byte 0x03007630
_0800F650: .4byte 0x03003134
_0800F654: .4byte 0x0000099C
_0800F658: .4byte 0x03003130
_0800F65C:
	movs r0, #0xee
	lsls r0, r0, #8
	bl sub_0800F7F8
	ldr r1, _0800F684
	ldr r3, _0800F688
	adds r0, r5, r3
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r4, _0800F68C
	adds r0, r5, r4
	ldrh r0, [r0]
	strh r0, [r1, #4]
	ldr r0, _0800F690
	adds r0, #6
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r1, #6]
	b _0800F6E8
	.align 2, 0
_0800F684: .4byte 0x030031B0
_0800F688: .4byte 0x03003132
_0800F68C: .4byte 0x03003134
_0800F690: .4byte 0x03003130
_0800F694:
	ldr r4, _0800F6C4
	ldrb r0, [r4, #0xc]
	mov r6, r8
	adds r6, #1
	cmp r0, #1
	bne _0800F728
	ldr r0, _0800F6C8
	adds r2, r4, r0
	ldr r1, _0800F6CC
	adds r3, r5, r1
	ldrb r1, [r3]
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _0800F6D0
	adds r0, r5, r2
	ldrh r1, [r0]
	ldr r2, _0800F6D4
	adds r0, r4, r2
	strb r1, [r0]
	ldrh r0, [r3]
	bl sub_080104E8
	b _0800F6EC
	.align 2, 0
_0800F6C4: .4byte 0x030050A0
_0800F6C8: .4byte 0x0000099B
_0800F6CC: .4byte 0x03003132
_0800F6D0: .4byte 0x03003134
_0800F6D4: .4byte 0x0000099C
_0800F6D8:
	ldr r0, _0800F718
	mov r3, r8
	lsls r1, r3, #1
	adds r1, r1, r0
	ldr r4, _0800F71C
	adds r0, r5, r4
	ldrh r0, [r0]
	strh r0, [r1]
_0800F6E8:
	mov r6, r8
	adds r6, #1
_0800F6EC:
	ldr r3, _0800F720
	ldrb r4, [r3, #0xc]
	cmp r4, #1
	bne _0800F728
	adds r0, r3, #0
	adds r0, #0x61
	mov r1, r8
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0800F728
	cmp r1, #4
	bne _0800F724
	adds r0, r3, #0
	adds r0, #0x5c
	add r0, r8
	movs r1, #0
	strb r4, [r0]
	strb r1, [r2]
	b _0800F728
	.align 2, 0
_0800F718: .4byte 0x030030C0
_0800F71C: .4byte 0x03003132
_0800F720: .4byte 0x030050A0
_0800F724:
	adds r0, #1
	strb r0, [r2]
_0800F728:
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #4
	bhi _0800F734
	b _0800F35E
_0800F734:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0800F350

	thumb_func_start sub_0800F744
sub_0800F744: @ 0x0800F744
	push {lr}
	movs r2, #0
	ldr r0, _0800F758
	adds r1, r0, #0
	adds r1, #0x92
_0800F74E:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800F75C
	movs r0, #0
	b _0800F766
	.align 2, 0
_0800F758: .4byte 0x030050A0
_0800F75C:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #4
	ble _0800F74E
	movs r0, #1
_0800F766:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800F744

	thumb_func_start sub_0800F76C
sub_0800F76C: @ 0x0800F76C
	push {r4, lr}
	movs r1, #0
	ldr r2, _0800F794
	ldrb r0, [r2, #0xd]
	cmp r1, r0
	bge _0800F7A0
	adds r4, r0, #0
	adds r3, r2, #0
	adds r3, #0x92
	adds r2, #0x5c
_0800F780:
	ldrb r0, [r3]
	cmp r0, #2
	bne _0800F78E
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800F798
_0800F78E:
	movs r0, #0
	b _0800F7A2
	.align 2, 0
_0800F794: .4byte 0x030050A0
_0800F798:
	adds r3, #0x14
	adds r1, #1
	cmp r1, r4
	blt _0800F780
_0800F7A0:
	movs r0, #1
_0800F7A2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0800F76C

	thumb_func_start sub_0800F7A8
sub_0800F7A8: @ 0x0800F7A8
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	str r1, [r0, #4]
	str r1, [r0, #8]
	strb r2, [r0, #0x10]
	strb r2, [r0, #0x11]
	strb r2, [r0, #0x12]
	bx lr
	thumb_func_end sub_0800F7A8

	thumb_func_start sub_0800F7BC
sub_0800F7BC: @ 0x0800F7BC
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r0, _0800F7F4
	adds r3, r0, #0
	adds r3, #0x92
	adds r4, r0, #0
	adds r4, #0x5c
_0800F7CC:
	ldrb r0, [r3]
	cmp r0, #2
	bne _0800F7E2
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800F7E2
	lsls r0, r1
	orrs r2, r0
	lsls r0, r2, #0x18
	lsrs r2, r0, #0x18
_0800F7E2:
	adds r3, #0x14
	adds r1, #1
	cmp r1, #4
	ble _0800F7CC
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800F7F4: .4byte 0x030050A0
	thumb_func_end sub_0800F7BC

	thumb_func_start sub_0800F7F8
sub_0800F7F8: @ 0x0800F7F8
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r5, _0800F830
	strh r1, [r5]
	movs r0, #0xf0
	lsls r0, r0, #7
	adds r4, r5, #0
	cmp r1, r0
	beq _0800F894
	cmp r1, r0
	bgt _0800F846
	movs r0, #0xbe
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800F8E4
	cmp r1, r0
	bgt _0800F834
	movs r0, #0xbc
	lsls r0, r0, #6
	cmp r1, r0
	beq _0800F904
	movs r0, #0x88
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800F8F8
	b _0800F92A
	.align 2, 0
_0800F830: .4byte 0x030031B0
_0800F834:
	movs r0, #0xcc
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800F8E4
	movs r0, #0xee
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800F894
	b _0800F92A
_0800F846:
	movs r0, #0xbe
	lsls r0, r0, #8
	cmp r1, r0
	beq _0800F924
	cmp r1, r0
	bgt _0800F92A
	movs r0, #0x88
	lsls r0, r0, #8
	cmp r1, r0
	beq _0800F864
	movs r0, #0xa1
	lsls r0, r0, #8
	cmp r1, r0
	beq _0800F87C
	b _0800F92A
_0800F864:
	ldr r0, _0800F878
	adds r1, r0, #0
	adds r1, #0x6e
	ldrh r1, [r1]
	strh r1, [r5, #2]
	adds r0, #0x7d
	ldrb r0, [r0]
	adds r0, #0x80
	strh r0, [r5, #4]
	b _0800F92A
	.align 2, 0
_0800F878: .4byte 0x030050A0
_0800F87C:
	bl sub_0800F744
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800F92A
	ldr r0, _0800F890
	adds r0, #0x5a
	ldrb r0, [r0]
	b _0800F928
	.align 2, 0
_0800F890: .4byte 0x030050A0
_0800F894:
	ldr r3, _0800F8D0
	ldr r1, _0800F8D4
	adds r0, r3, r1
	ldr r2, _0800F8D8
	adds r1, r3, r2
	ldrb r2, [r0]
	ldrb r0, [r1]
	eors r0, r2
	ldr r1, _0800F8DC
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #1
	strb r0, [r3, #0xd]
	ldrb r0, [r3, #0xd]
	strh r0, [r4, #2]
	adds r2, r4, #4
	movs r4, #0
	ldr r0, _0800F8E0
	adds r3, r3, r0
_0800F8BA:
	adds r1, r2, r4
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0800F8BA
	b _0800F92A
	.align 2, 0
_0800F8D0: .4byte 0x030050A0
_0800F8D4: .4byte 0x0000099A
_0800F8D8: .4byte 0x0000099B
_0800F8DC: .4byte 0x082C03E5
_0800F8E0: .4byte 0x00000996
_0800F8E4:
	ldr r0, _0800F8F4
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #2]
	b _0800F92A
	.align 2, 0
_0800F8F4: .4byte 0x030050A0
_0800F8F8:
	strh r1, [r5]
	ldr r0, _0800F900
	ldrh r0, [r0, #0x2c]
	b _0800F928
	.align 2, 0
_0800F900: .4byte 0x03002360
_0800F904:
	movs r4, #0
	ldr r3, _0800F920
_0800F908:
	adds r2, r4, #1
	lsls r1, r2, #1
	adds r1, r1, r5
	lsls r0, r4, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #5
	bls _0800F908
	b _0800F92A
	.align 2, 0
_0800F920: .4byte 0x03005192
_0800F924:
	ldr r0, _0800F930
	ldrh r0, [r0]
_0800F928:
	strh r0, [r5, #2]
_0800F92A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F930: .4byte 0x03005B08
	thumb_func_end sub_0800F7F8

	thumb_func_start sub_0800F934
sub_0800F934: @ 0x0800F934
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800F960
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800F95A
	bl sub_08011570
	cmp r0, #0
	bne _0800F95A
	ldr r0, _0800F964
	adds r1, r4, #0
	movs r2, #0xc
	bl memcpy
	movs r0, #0xbc
	lsls r0, r0, #6
	bl sub_0800F7F8
_0800F95A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800F960: .4byte 0x030031B0
_0800F964: .4byte 0x03005192
	thumb_func_end sub_0800F934

	thumb_func_start sub_0800F968
sub_0800F968: @ 0x0800F968
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	cmp r6, #0xfc
	bls _0800F984
	ldr r0, _0800F9B0
	ldr r1, _0800F9B4
	ldr r2, _0800F9B8
	movs r3, #1
	bl AGBAssert
_0800F984:
	ldr r5, _0800F9BC
	ldr r0, [r5]
	cmp r0, #0
	bne _0800F9AC
	ldr r0, _0800F9C0
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800F9AC
	movs r0, #0x7c
	adds r0, r0, r5
	mov sb, r0
	ldrb r1, [r0]
	mov r8, r1
	cmp r1, #0
	beq _0800F9C8
	ldr r1, _0800F9C4
	adds r1, #0x83
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0800F9AC:
	movs r0, #0
	b _0800FA32
	.align 2, 0
_0800F9B0: .4byte 0x082C053C
_0800F9B4: .4byte 0x00000755
_0800F9B8: .4byte 0x082C0558
_0800F9BC: .4byte 0x030050A0
_0800F9C0: .4byte 0x030031B0
_0800F9C4: .4byte 0x020227FC
_0800F9C8:
	adds r0, r6, #0
	movs r1, #0xc
	bl __umodsi3
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	bl GetMultiplayerId
	adds r1, r5, #0
	adds r1, #0x7d
	strb r0, [r1]
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xc
	bl __udivsi3
	adds r0, r0, r4
	adds r1, r5, #0
	adds r1, #0x6e
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6c
	mov r1, r8
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r6, r0
	bls _0800FA0A
	str r7, [r5, #0x70]
	b _0800FA1C
_0800FA0A:
	ldr r4, _0800FA40
	cmp r7, r4
	beq _0800FA1A
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl memcpy
_0800FA1A:
	str r4, [r5, #0x70]
_0800FA1C:
	movs r0, #0x88
	lsls r0, r0, #8
	bl sub_0800F7F8
	ldr r0, _0800FA44
	ldr r1, _0800FA48
	str r1, [r0]
	adds r0, #0x5b
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
_0800FA32:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800FA40: .4byte 0x0202257C
_0800FA44: .4byte 0x030050A0
_0800FA48: .4byte 0x0800FA4D
	thumb_func_end sub_0800F968

	thumb_func_start rfufunc_80F9F44
rfufunc_80F9F44: @ 0x0800FA4C
	push {r4, r5, lr}
	ldr r0, _0800FA7C
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800FAA0
	movs r5, #0x88
	lsls r5, r5, #8
	adds r0, r5, #0
	bl sub_0800F7F8
	ldr r4, _0800FA80
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	bne _0800FA84
	adds r1, r4, #0
	adds r1, #0x5b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0800FAA0
	b _0800FA9C
	.align 2, 0
_0800FA7C: .4byte 0x030031B0
_0800FA80: .4byte 0x030050A0
_0800FA84:
	bl GetMultiplayerId
	ldr r1, _0800FAA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, r5
	bne _0800FAA0
_0800FA9C:
	ldr r0, _0800FAAC
	str r0, [r4]
_0800FAA0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800FAA8: .4byte 0x03003130
_0800FAAC: .4byte 0x0800FAB1
	thumb_func_end rfufunc_80F9F44

	thumb_func_start sub_0800FAB0
sub_0800FAB0: @ 0x0800FAB0
	push {r4, r5, r6, lr}
	ldr r0, _0800FB1C
	mov ip, r0
	ldr r5, [r0, #0x70]
	ldr r3, _0800FB20
	mov r2, ip
	adds r2, #0x6c
	ldrh r1, [r2]
	movs r4, #0x89
	lsls r4, r4, #8
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3]
	movs r4, #0
	adds r6, r2, #0
	adds r3, #2
_0800FAD0:
	lsls r2, r4, #1
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, r0, r5
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	cmp r4, #6
	ble _0800FAD0
	mov r0, ip
	adds r0, #0x6c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r0, #2
	ldrh r0, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r0, r1
	bhi _0800FB14
	mov r0, ip
	adds r0, #0x7c
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800FB24
	mov r1, ip
	str r0, [r1]
_0800FB14:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800FB1C: .4byte 0x030050A0
_0800FB20: .4byte 0x030031B0
_0800FB24: .4byte 0x0800FB29
	thumb_func_end sub_0800FAB0

	thumb_func_start rfufunc_80FA020
rfufunc_80FA020: @ 0x0800FB28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r5, _0800FBD0
	ldr r0, [r5, #0x70]
	mov r8, r0
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	bne _0800FBF0
	ldr r3, _0800FBD4
	adds r2, r5, #0
	adds r2, #0x6e
	ldrh r0, [r2]
	subs r0, #1
	ldr r4, _0800FBD8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	movs r4, #0
	mov sb, r5
	ldr r0, _0800FBDC
	mov ip, r0
	lsls r5, r6, #4
	adds r7, r2, #0
	adds r3, #2
_0800FB64:
	lsls r2, r4, #1
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	add r0, r8
	adds r1, r0, #0
	subs r1, #0xb
	ldrb r1, [r1]
	lsls r1, r1, #8
	subs r0, #0xc
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	cmp r4, #6
	ble _0800FB64
	mov r1, ip
	adds r0, r5, r1
	ldrb r1, [r0]
	mov r3, sb
	adds r0, r3, #0
	adds r0, #0x6e
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bne _0800FBF4
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x88
	adds r1, r0, r1
	ldr r2, _0800FBE0
	adds r0, r0, r3
	adds r0, #0x82
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	beq _0800FBE8
	adds r0, r6, #0
	bl sub_0800F0F8
	ldr r1, _0800FBE4
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0800FBF4
	.align 2, 0
_0800FBD0: .4byte 0x030050A0
_0800FBD4: .4byte 0x030031B0
_0800FBD8: .4byte 0xFFFF8900
_0800FBDC: .4byte 0x03003130
_0800FBE0: .4byte 0x082C0378
_0800FBE4: .4byte 0x020227FC
_0800FBE8:
	movs r0, #0
	mov r4, sb
	str r0, [r4]
	b _0800FBF4
_0800FBF0:
	movs r0, #0
	str r0, [r5]
_0800FBF4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end rfufunc_80FA020

	thumb_func_start sub_0800FC00
sub_0800FC00: @ 0x0800FC00
	push {lr}
	ldr r1, _0800FC18
	adds r1, #0x5a
	strb r0, [r1]
	movs r0, #0xa1
	lsls r0, r0, #8
	bl sub_0800F7F8
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0800FC18: .4byte 0x030050A0
	thumb_func_end sub_0800FC00

	thumb_func_start sub_0800FC1C
sub_0800FC1C: @ 0x0800FC1C
	push {lr}
	bl rfu_clearAllSlot
	bl sub_0800BB04
	ldr r1, _0800FC40
	movs r0, #0
	strb r0, [r1]
	ldr r2, _0800FC44
	adds r3, r2, #0
	adds r3, #0xef
	movs r1, #0
	movs r0, #1
	strb r0, [r3]
	str r1, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0800FC40: .4byte 0x030031C4
_0800FC44: .4byte 0x030050A0
	thumb_func_end sub_0800FC1C

	thumb_func_start sub_0800FC48
sub_0800FC48: @ 0x0800FC48
	push {lr}
	ldr r0, _0800FC64
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	ldrb r0, [r0, #3]
	orrs r0, r1
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	bl sub_0800FC1C
	pop {r0}
	bx r0
	.align 2, 0
_0800FC64: .4byte 0x03007630
	thumb_func_end sub_0800FC48

	thumb_func_start sub_0800FC68
sub_0800FC68: @ 0x0800FC68
	push {r4, lr}
	ldr r4, _0800FC80
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	bne _0800FC88
	bl sub_0800D0EC
	ldr r0, _0800FC84
	adds r1, r4, r0
	movs r0, #2
	strb r0, [r1]
	b _0800FC8C
	.align 2, 0
_0800FC80: .4byte 0x030050A0
_0800FC84: .4byte 0x0000099C
_0800FC88:
	ldr r0, _0800FC94
	str r0, [r4]
_0800FC8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FC94: .4byte 0x0800FC49
	thumb_func_end sub_0800FC68

	thumb_func_start LinkRfu_FatalError
LinkRfu_FatalError: @ 0x0800FC98
	push {lr}
	bl sub_0800D0EC
	ldr r2, _0800FCBC
	ldr r0, _0800FCC0
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0800FCC4
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	orrs r0, r1
	ldr r1, _0800FCC8
	adds r2, r2, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0800FCBC: .4byte 0x030050A0
_0800FCC0: .4byte 0x0000099C
_0800FCC4: .4byte 0x03007630
_0800FCC8: .4byte 0x0000099B
	thumb_func_end LinkRfu_FatalError

	thumb_func_start sub_0800FCCC
sub_0800FCCC: @ 0x0800FCCC
	push {r4, r5, lr}
	ldr r0, _0800FD14
	ldrb r5, [r0, #0xd]
	movs r2, #0
	movs r1, #0
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xe4
_0800FCDC:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800FCE6
	adds r2, #1
_0800FCE6:
	adds r1, #1
	cmp r1, #4
	ble _0800FCDC
	cmp r2, r5
	bne _0800FD20
	ldr r2, _0800FD18
	ldr r0, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldrb r0, [r3, #0xc]
	cmp r0, #0
	bne _0800FD1C
	adds r0, r3, #0
	adds r0, #0xee
	ldrb r1, [r0]
	movs r1, #3
	strb r1, [r0]
	bl sub_0800FC68
	b _0800FD20
	.align 2, 0
_0800FD14: .4byte 0x030050A0
_0800FD18: .4byte 0x02022C90
_0800FD1C:
	ldr r0, _0800FD28
	str r0, [r3]
_0800FD20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800FD28: .4byte 0x0800FC69
	thumb_func_end sub_0800FCCC

	thumb_func_start sub_0800FD2C
sub_0800FD2C: @ 0x0800FD2C
	push {r4, lr}
	ldr r0, _0800FD58
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800FD50
	ldr r4, _0800FD5C
	movs r1, #0x9a
	lsls r1, r1, #4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800FD50
	movs r0, #0xbe
	lsls r0, r0, #7
	bl sub_0800F7F8
	ldr r0, _0800FD60
	str r0, [r4]
_0800FD50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FD58: .4byte 0x030031B0
_0800FD5C: .4byte 0x030050A0
_0800FD60: .4byte 0x0800FCCD
	thumb_func_end sub_0800FD2C

	thumb_func_start sub_0800FD64
sub_0800FD64: @ 0x0800FD64
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _0800FD88
	ldr r0, [r2]
	cmp r0, #0
	bne _0800FD84
	ldr r1, _0800FD8C
	adds r0, r2, r1
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0800FD90
	str r0, [r2]
	adds r0, r3, #0
	bl DestroyTask
_0800FD84:
	pop {r0}
	bx r0
	.align 2, 0
_0800FD88: .4byte 0x030050A0
_0800FD8C: .4byte 0x00000991
_0800FD90: .4byte 0x0800FD2D
	thumb_func_end sub_0800FD64

	thumb_func_start task_add_05_task_del_08FA224_when_no_RfuFunc
task_add_05_task_del_08FA224_when_no_RfuFunc: @ 0x0800FD94
	push {r4, lr}
	ldr r4, _0800FDB4
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800FDAC
	adds r0, r4, #0
	movs r1, #5
	bl CreateTask
_0800FDAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FDB4: .4byte 0x0800FD65
	thumb_func_end task_add_05_task_del_08FA224_when_no_RfuFunc

	thumb_func_start sub_0800FDB8
sub_0800FDB8: @ 0x0800FDB8
	push {r4, r5, lr}
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800FDE6
	ldr r1, _0800FE50
	ldr r2, _0800FE54
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r0, #0
	cmp r4, #0
	bne _0800FDE6
	adds r5, r1, #0
	adds r5, #0xfe
	ldrh r0, [r5]
	cmp r0, #0x3c
	bls _0800FDE6
	movs r0, #0xcc
	lsls r0, r0, #7
	bl sub_0800F7F8
	strh r4, [r5]
_0800FDE6:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	cmp r1, r2
	bhs _0800FE12
	ldr r0, _0800FE50
	adds r3, r0, #0
	adds r3, #0xe9
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800FE12
_0800FE00:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	bhs _0800FE12
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800FE00
_0800FE12:
	ldr r4, _0800FE50
	cmp r1, r2
	bne _0800FE3E
	movs r1, #0
	adds r3, r4, #0
	adds r3, #0xe9
	movs r2, #0
_0800FE20:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0800FE20
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	strh r1, [r0]
	str r2, [r4]
_0800FE3E:
	adds r1, r4, #0
	adds r1, #0xfe
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800FE50: .4byte 0x030050A0
_0800FE54: .4byte 0x0000069E
	thumb_func_end sub_0800FDB8

	thumb_func_start sub_0800FE58
sub_0800FE58: @ 0x0800FE58
	push {r4, lr}
	ldr r4, _0800FE80
	ldr r1, _0800FE84
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800FE7A
	ldr r0, _0800FE88
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800FE7A
	movs r0, #0xcc
	lsls r0, r0, #7
	bl sub_0800F7F8
	ldr r0, _0800FE8C
	str r0, [r4]
_0800FE7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FE80: .4byte 0x030050A0
_0800FE84: .4byte 0x0000069E
_0800FE88: .4byte 0x030031B0
_0800FE8C: .4byte 0x0800FDB9
	thumb_func_end sub_0800FE58

	thumb_func_start sub_0800FE90
sub_0800FE90: @ 0x0800FE90
	push {r4, lr}
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800FECC
	ldr r4, _0800FEBC
	ldr r1, _0800FEC0
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800FF1E
	ldr r0, _0800FEC4
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800FF1E
	movs r0, #0xcc
	lsls r0, r0, #7
	bl sub_0800F7F8
	ldr r0, _0800FEC8
	b _0800FF1C
	.align 2, 0
_0800FEBC: .4byte 0x030050A0
_0800FEC0: .4byte 0x0000069E
_0800FEC4: .4byte 0x030031B0
_0800FEC8: .4byte 0x0800FDB9
_0800FECC:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #1
	cmp r1, r2
	bhs _0800FEFA
	ldr r3, _0800FF24
	adds r0, r3, #0
	adds r0, #0xea
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800FEFA
	adds r3, #0xe9
_0800FEE8:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	bhs _0800FEFA
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800FEE8
_0800FEFA:
	cmp r1, r2
	bne _0800FF1E
	ldr r4, _0800FF24
	ldr r1, _0800FF28
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800FF1E
	ldr r0, _0800FF2C
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800FF1E
	movs r0, #0xcc
	lsls r0, r0, #7
	bl sub_0800F7F8
	ldr r0, _0800FF30
_0800FF1C:
	str r0, [r4]
_0800FF1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FF24: .4byte 0x030050A0
_0800FF28: .4byte 0x0000069E
_0800FF2C: .4byte 0x030031B0
_0800FF30: .4byte 0x0800FE59
	thumb_func_end sub_0800FE90

	thumb_func_start sub_0800FF34
sub_0800FF34: @ 0x0800FF34
	push {lr}
	ldr r1, _0800FF4C
	ldr r2, [r1]
	cmp r2, #0
	bne _0800FF48
	ldr r0, _0800FF50
	str r0, [r1]
	adds r0, r1, #0
	adds r0, #0xfe
	strh r2, [r0]
_0800FF48:
	pop {r0}
	bx r0
	.align 2, 0
_0800FF4C: .4byte 0x030050A0
_0800FF50: .4byte 0x0800FE91
	thumb_func_end sub_0800FF34

	thumb_func_start sub_0800FF54
sub_0800FF54: @ 0x0800FF54
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, _0800FF70
	ldrh r0, [r1]
	cmp r0, r3
	beq _0800FF82
	ldr r4, _0800FF74
	adds r2, r1, #0
_0800FF64:
	ldrh r0, [r2]
	cmp r0, r4
	bne _0800FF78
	movs r0, #0
	b _0800FF84
	.align 2, 0
_0800FF70: .4byte 0x082C0430
_0800FF74: .4byte 0x0000FFFF
_0800FF78:
	adds r1, #2
	adds r2, #2
	ldrh r0, [r1]
	cmp r0, r3
	bne _0800FF64
_0800FF82:
	movs r0, #1
_0800FF84:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800FF54

	thumb_func_start sub_0800FF8C
sub_0800FF8C: @ 0x0800FF8C
	push {lr}
	cmp r0, #0
	beq _0800FFA0
	movs r1, #0x96
	lsls r1, r1, #2
	movs r0, #1
	bl sub_0800D00C
	movs r0, #0
	b _0800FFAC
_0800FFA0:
	movs r0, #0
	movs r1, #0
	bl sub_0800D00C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0800FFAC:
	pop {r1}
	bx r1
	thumb_func_end sub_0800FF8C

	thumb_func_start sub_0800FFB0
sub_0800FFB0: @ 0x0800FFB0
	push {lr}
	ldr r0, _0800FFC8
	ldr r1, _0800FFCC
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	movs r0, #0
	bl sub_0800BD38
	pop {r0}
	bx r0
	.align 2, 0
_0800FFC8: .4byte 0x030050A0
_0800FFCC: .4byte 0x00000991
	thumb_func_end sub_0800FFB0

	thumb_func_start rfu_get_multiplayer_id
rfu_get_multiplayer_id: @ 0x0800FFD0
	push {lr}
	ldr r1, _0800FFE4
	ldrb r0, [r1, #0xc]
	cmp r0, #1
	beq _0800FFEC
	ldr r2, _0800FFE8
	adds r0, r1, r2
	ldrb r0, [r0]
	b _0800FFEE
	.align 2, 0
_0800FFE4: .4byte 0x030050A0
_0800FFE8: .4byte 0x00000986
_0800FFEC:
	movs r0, #0
_0800FFEE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end rfu_get_multiplayer_id

	thumb_func_start sub_0800FFF4
sub_0800FFF4: @ 0x0800FFF4
	ldr r0, _0800FFFC
	ldrb r0, [r0, #0xd]
	bx lr
	.align 2, 0
_0800FFFC: .4byte 0x030050A0
	thumb_func_end sub_0800FFF4

	thumb_func_start sub_08010000
sub_08010000: @ 0x08010000
	push {lr}
	ldr r2, _08010014
	adds r0, r2, #0
	adds r0, #0xf1
	ldrb r0, [r0]
	cmp r0, #2
	bne _08010018
	movs r0, #0
	b _08010024
	.align 2, 0
_08010014: .4byte 0x030050A0
_08010018:
	movs r1, #0
	ldr r0, [r2]
	cmp r0, #0
	bne _08010022
	movs r1, #1
_08010022:
	adds r0, r1, #0
_08010024:
	pop {r1}
	bx r1
	thumb_func_end sub_08010000

	thumb_func_start sub_08010028
sub_08010028: @ 0x08010028
	push {lr}
	ldr r0, _0801003C
	ldr r0, [r0]
	cmp r0, #0
	beq _08010036
	bl _call_via_r0
_08010036:
	pop {r0}
	bx r0
	.align 2, 0
_0801003C: .4byte 0x030050A0
	thumb_func_end sub_08010028

	thumb_func_start sub_08010040
sub_08010040: @ 0x08010040
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	movs r5, #0
	ldr r6, _080100AC
	ldr r0, _080100B0
	adds r0, r0, r6
	mov r8, r0
_08010052:
	ldr r1, _080100B4
	adds r0, r6, r1
	adds r4, r5, r0
	ldrb r0, [r4]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080100DA
	ldr r1, _080100B8
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #0x34]
	cmp r0, #0x46
	beq _08010076
	cmp r0, #0x48
	bne _080100C0
_08010076:
	ldr r2, _080100BC
	adds r0, r6, r2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #8
	bne _080100DA
	movs r0, #9
	strb r0, [r4]
	movs r0, #0xa
	strb r0, [r1]
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r0, #8
	bl rfu_clearSlot
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r5
	lsrs r0, r0, #0x18
	movs r1, #8
	adds r2, r4, #0
	movs r3, #1
	bl rfu_NI_setSendData
	movs r7, #1
	b _080100DA
	.align 2, 0
_080100AC: .4byte 0x030050A0
_080100B0: .4byte 0x000008F6
_080100B4: .4byte 0x00000989
_080100B8: .4byte 0x03007620
_080100BC: .4byte 0x0000098D
_080100C0:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #0x34]
	cmp r0, #0x47
	bne _080100DA
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r0, #8
	bl rfu_clearSlot
_080100DA:
	adds r5, #1
	cmp r5, #3
	ble _08010052
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08010040

	thumb_func_start sub_080100EC
sub_080100EC: @ 0x080100EC
	push {r4, r5, r6, lr}
	movs r3, #0
	movs r1, #0
	ldr r5, _08010138
	movs r6, #1
	movs r4, #0
_080100F8:
	adds r2, r1, r5
	ldrb r0, [r2]
	cmp r0, #0xb
	bne _0801010C
	adds r0, r6, #0
	lsls r0, r1
	orrs r3, r0
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	strb r4, [r2]
_0801010C:
	adds r1, #1
	cmp r1, #3
	ble _080100F8
	cmp r3, #0
	beq _08010120
	adds r0, r3, #0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_08010120:
	movs r1, #0
	ldr r2, _08010138
_08010124:
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0801013C
	movs r0, #1
	b _08010144
	.align 2, 0
_08010138: .4byte 0x03005A2D
_0801013C:
	adds r1, #1
	cmp r1, #3
	ble _08010124
	movs r0, #0
_08010144:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080100EC

	thumb_func_start sub_0801014C
sub_0801014C: @ 0x0801014C
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r1, r2, #0
	bl sub_080117D0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq _08010180
	ldr r0, _08010178
	ldr r2, _0801017C
	adds r0, r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #9
	beq _08010180
	movs r0, #0
	b _08010182
	.align 2, 0
_08010178: .4byte 0x030050A0
_0801017C: .4byte 0x00000989
_08010180:
	movs r0, #1
_08010182:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0801014C

	thumb_func_start sub_08010188
sub_08010188: @ 0x08010188
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, r2, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_080117D0
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080101CC
	ldr r0, _080101D0
	adds r5, r5, r0
	adds r5, r4, r5
	strb r6, [r5]
	movs r0, #4
	adds r1, r4, #0
	bl rfu_clearSlot
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r4
	lsrs r0, r0, #0x18
	movs r1, #8
	adds r2, r5, #0
	movs r3, #1
	bl rfu_NI_setSendData
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080101CC: .4byte 0x030050A0
_080101D0: .4byte 0x00000989
	thumb_func_end sub_08010188

	thumb_func_start sub_080101D4
sub_080101D4: @ 0x080101D4
	push {r4, r5, lr}
	ldr r4, _08010208
	ldr r0, _0801020C
	adds r5, r4, r0
	movs r0, #8
	strb r0, [r5]
	ldr r0, _08010210
	adds r4, r4, r0
	ldrb r1, [r4]
	movs r0, #4
	bl rfu_clearSlot
	ldrb r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r1
	lsrs r0, r0, #0x18
	movs r1, #8
	adds r2, r5, #0
	movs r3, #1
	bl rfu_NI_setSendData
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010208: .4byte 0x030050A0
_0801020C: .4byte 0x0000093D
_08010210: .4byte 0x000008F6
	thumb_func_end sub_080101D4

	thumb_func_start sub_08010214
sub_08010214: @ 0x08010214
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r1, r2, #0
	bl sub_080117D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08010230
	movs r0, #2
	b _0801024A
_08010230:
	ldr r1, _08010244
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	beq _08010248
	movs r0, #0
	b _0801024A
	.align 2, 0
_08010244: .4byte 0x03007620
_08010248:
	movs r0, #1
_0801024A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08010214

	thumb_func_start sub_08010250
sub_08010250: @ 0x08010250
	push {r4, r5, lr}
	bl sub_08010040
	movs r4, #0
	ldr r0, _08010294
	ldr r1, _08010298
	adds r5, r0, r1
_0801025E:
	ldr r1, _0801029C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #0x26
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08010288
	adds r1, r4, r5
	ldrb r0, [r1]
	cmp r0, #0xa
	bne _0801027E
	movs r0, #0xb
	strb r0, [r1]
_0801027E:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #4
	bl rfu_clearSlot
_08010288:
	adds r4, #1
	cmp r4, #3
	ble _0801025E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010294: .4byte 0x030050A0
_08010298: .4byte 0x0000098D
_0801029C: .4byte 0x03007620
	thumb_func_end sub_08010250

	thumb_func_start sub_080102A0
sub_080102A0: @ 0x080102A0
	push {r4, r5, lr}
	movs r4, #0
	ldr r1, _08010318
	ldr r2, _0801031C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #8
	bne _080102DA
	ldr r2, _08010320
	ldr r0, _08010324
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #0x26
	beq _080102D2
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #0x27
	bne _080102DA
_080102D2:
	ldrb r1, [r1]
	movs r0, #4
	bl rfu_clearSlot
_080102DA:
	ldr r2, _08010320
	ldr r5, _08010318
	ldr r0, _08010324
	adds r1, r5, r0
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #0x34]
	cmp r0, #0x46
	beq _080102FE
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #0x34]
	cmp r0, #0x48
	bne _0801032C
_080102FE:
	ldrb r1, [r1]
	movs r0, #8
	bl rfu_clearSlot
	ldr r2, _08010328
	adds r4, r5, r2
	ldrb r0, [r4]
	movs r1, #0
	bl sub_08011554
	ldrb r4, [r4]
	b _08010344
	.align 2, 0
_08010318: .4byte 0x030050A0
_0801031C: .4byte 0x0000093D
_08010320: .4byte 0x03007620
_08010324: .4byte 0x000008F6
_08010328: .4byte 0x0000093E
_0801032C:
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #0x34]
	cmp r0, #0x47
	bne _08010344
	ldrb r1, [r1]
	movs r0, #8
	bl rfu_clearSlot
	movs r4, #6
_08010344:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080102A0

	thumb_func_start sub_0801034C
sub_0801034C: @ 0x0801034C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _0801039C
	adds r0, r5, #0
	adds r0, #0xf1
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08010374
	movs r0, #0x9a
	lsls r0, r0, #4
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	bl DestroyTask
_08010374:
	ldr r2, _080103A0
	lsls r1, r6, #2
	adds r0, r1, r6
	lsls r0, r0, #3
	adds r4, r0, r2
	movs r2, #8
	ldrsh r0, [r4, r2]
	adds r7, r1, #0
	cmp r0, #3
	beq _0801041C
	cmp r0, #3
	bgt _080103A4
	cmp r0, #1
	beq _080103CC
	cmp r0, #1
	bgt _08010418
	cmp r0, #0
	beq _080103B6
	b _080104D4
	.align 2, 0
_0801039C: .4byte 0x030050A0
_080103A0: .4byte 0x03005B60
_080103A4:
	cmp r0, #5
	beq _08010450
	cmp r0, #5
	blt _0801043E
	cmp r0, #6
	beq _08010484
	cmp r0, #0x65
	beq _08010404
	b _080104D4
_080103B6:
	bl sub_0800F744
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080103C2
	b _080104D4
_080103C2:
	bl ResetBlockReceivedFlags
	bl sub_0800AE24
	b _08010448
_080103CC:
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _0801040C
	ldr r0, _080103E4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080103E8
	movs r0, #0xf0
	lsls r0, r0, #7
	bl sub_0800F7F8
	b _080103F0
	.align 2, 0
_080103E4: .4byte 0x030031C4
_080103E8:
	movs r0, #0xee
	lsls r0, r0, #7
	bl sub_0800F7F8
_080103F0:
	ldr r0, _08010400
	adds r1, r7, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x65
	strh r0, [r1, #8]
	b _080104D4
	.align 2, 0
_08010400: .4byte 0x03005B60
_08010404:
	ldr r0, _08010414
	ldrh r0, [r0]
	cmp r0, #0
	bne _080104D4
_0801040C:
	movs r0, #2
	strh r0, [r4, #8]
	b _080104D4
	.align 2, 0
_08010414: .4byte 0x030031B0
_08010418:
	ldrb r0, [r5, #0xd]
	b _08010444
_0801041C:
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _08010448
	bl sub_0800F744
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080104D4
	adds r1, r5, #0
	adds r1, #0x5a
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xa1
	lsls r0, r0, #8
	bl sub_0800F7F8
	b _08010448
_0801043E:
	bl sub_0800F76C
	lsls r0, r0, #0x18
_08010444:
	cmp r0, #0
	beq _080104D4
_08010448:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080104D4
_08010450:
	movs r4, #0
	ldrb r0, [r5, #0xd]
	cmp r4, r0
	bge _0801046E
_08010458:
	adds r0, r4, #0
	bl sub_0800AE80
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800F1E8
	adds r4, #1
	ldrb r2, [r5, #0xd]
	cmp r4, r2
	blt _08010458
_0801046E:
	ldr r0, _08010480
	adds r1, r7, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080104D4
	.align 2, 0
_08010480: .4byte 0x03005B60
_08010484:
	adds r0, r6, #0
	bl DestroyTask
	ldr r1, _080104DC
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x9a
	lsls r0, r0, #4
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	movs r0, #1
	bl sub_0800D00C
	ldr r2, _080104E0
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _080104D4
	movs r4, #0
	adds r2, r1, #0
	movs r3, #1
	ldr r0, _080104E4
	adds r5, r5, r0
_080104B8:
	ldrb r0, [r2]
	asrs r0, r4
	ands r0, r3
	cmp r0, #0
	beq _080104CE
	adds r0, r3, #0
	lsls r0, r4
	strb r0, [r5]
	ldrb r1, [r2]
	eors r0, r1
	strb r0, [r2]
_080104CE:
	adds r4, #1
	cmp r4, #3
	ble _080104B8
_080104D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080104DC: .4byte 0x030031C4
_080104E0: .4byte 0x0000099E
_080104E4: .4byte 0x0000099D
	thumb_func_end sub_0801034C

	thumb_func_start sub_080104E8
sub_080104E8: @ 0x080104E8
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	movs r5, #1
	ldr r4, _08010510
	movs r3, #0
_080104F6:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _08010504
	adds r0, r1, r4
	strb r3, [r0]
_08010504:
	adds r1, #1
	cmp r1, #3
	ble _080104F6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010510: .4byte 0x03005A36
	thumb_func_end sub_080104E8

	thumb_func_start sub_08010514
sub_08010514: @ 0x08010514
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r1, _0801055C
	ldrb r0, [r3, #0xf]
	strb r0, [r1, #0xd]
	movs r2, #0
	ldr r0, _08010560
	adds r5, r1, r0
	adds r4, r3, #0
	adds r4, #0x10
_08010528:
	adds r0, r2, r5
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _08010528
	ldr r4, _08010564
	movs r2, #4
_0801053A:
	adds r0, r4, #0
	adds r1, r3, #0
	adds r1, #0x14
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r3, #0x1c
	adds r4, #0x1c
	subs r2, #1
	cmp r2, #0
	bge _0801053A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801055C: .4byte 0x030050A0
_08010560: .4byte 0x00000996
_08010564: .4byte 0x020226A0
	thumb_func_end sub_08010514

	thumb_func_start sub_08010568
sub_08010568: @ 0x08010568
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0801059C
	adds r1, r4, #0
	bl strcmp
	adds r5, r0, #0
	cmp r5, #0
	bne _08010594
	adds r0, r4, #0
	bl sub_08010514
	mov r0, sp
	strh r5, [r0]
	ldr r2, _080105A0
	adds r1, r4, #0
	bl CpuSet
	movs r0, #0
	bl ResetBlockReceivedFlag
_08010594:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801059C: .4byte 0x082C0564
_080105A0: .4byte 0x0100007E
	thumb_func_end sub_08010568

	thumb_func_start sub_080105A4
sub_080105A4: @ 0x080105A4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, _08010604
	ldr r2, _08010608
	ldr r1, _0801060C
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r2, _08010610
	adds r0, r3, r2
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r3, #0
	adds r0, #0xf1
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080105E2
	movs r0, #0x9a
	lsls r0, r0, #4
	adds r1, r3, r0
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	bl DestroyTask
_080105E2:
	ldr r0, _08010614
	lsls r2, r6, #2
	adds r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r3, #8
	ldrsh r1, [r1, r3]
	adds r3, r0, #0
	adds r7, r2, #0
	cmp r1, #5
	bls _080105FA
	b _080107E2
_080105FA:
	lsls r0, r1, #2
	ldr r1, _08010618
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010604: .4byte 0x030050A0
_08010608: .4byte 0x082C03DC
_0801060C: .4byte 0x000009A1
_08010610: .4byte 0x00000996
_08010614: .4byte 0x03005B60
_08010618: .4byte 0x0801061C
_0801061C: @ jump table
	.4byte _08010634 @ case 0
	.4byte _08010654 @ case 1
	.4byte _0801066C @ case 2
	.4byte _080106B0 @ case 3
	.4byte _080106FA @ case 4
	.4byte _08010784 @ case 5
_08010634:
	ldr r0, _08010650
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801063E
	b _080107E2
_0801063E:
	adds r0, r4, #0
	bl ResetBlockReceivedFlag
	movs r0, #0xf0
	lsls r0, r0, #7
	bl sub_0800F7F8
	b _0801073A
	.align 2, 0
_08010650: .4byte 0x030031B0
_08010654:
	ldr r0, _08010668
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801065E
	b _080107E2
_0801065E:
	adds r1, r7, r6
	lsls r1, r1, #3
	adds r1, r1, r3
	b _08010742
	.align 2, 0
_08010668: .4byte 0x030031B0
_0801066C:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010680
	b _080107E2
_08010680:
	adds r0, r4, #0
	bl ResetBlockReceivedFlag
	lsls r1, r4, #8
	ldr r0, _080106A8
	adds r1, r1, r0
	ldr r2, _080106AC
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r1, #0x10
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
	b _0801073A
	.align 2, 0
_080106A8: .4byte 0x0202207C
_080106AC: .4byte 0x020226A0
_080106B0:
	ldr r5, _0801074C
	adds r1, r5, #0
	ldr r0, _08010750
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldrh r2, [r0]
	strh r2, [r1]
	ldrb r0, [r0, #2]
	strb r0, [r1, #2]
	ldr r1, _08010754
	ldrb r0, [r1, #0xd]
	strb r0, [r5, #0xf]
	movs r2, #0
	adds r4, r5, #0
	adds r4, #0x10
	ldr r0, _08010758
	adds r3, r1, r0
_080106D2:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _080106D2
	ldr r1, _0801075C
	adds r0, r5, #0
	adds r0, #0x14
	movs r2, #0x8c
	bl memcpy
	ldr r0, _08010760
	adds r1, r7, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_080106FA:
	ldr r5, _0801074C
	ldr r1, _08010754
	ldrb r0, [r1, #0xd]
	strb r0, [r5, #0xf]
	movs r2, #0
	ldr r3, _0801075C
	mov ip, r3
	adds r4, r5, #0
	adds r4, #0x10
	ldr r0, _08010758
	adds r3, r1, r0
_08010710:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _08010710
	adds r0, r5, #0
	adds r0, #0x14
	mov r1, ip
	movs r2, #0x8c
	bl memcpy
	ldr r1, _0801074C
	movs r0, #0
	movs r2, #0xa0
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080107E2
_0801073A:
	ldr r0, _08010760
	adds r1, r7, r6
	lsls r1, r1, #3
	adds r1, r1, r0
_08010742:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080107E2
	.align 2, 0
_0801074C: .4byte 0x0202257C
_08010750: .4byte 0x082C0564
_08010754: .4byte 0x030050A0
_08010758: .4byte 0x00000996
_0801075C: .4byte 0x020226A0
_08010760: .4byte 0x03005B60
_08010764:
	adds r0, r3, #0
	lsls r0, r2
	ldr r2, _08010780
	adds r1, r5, r2
	strb r0, [r1]
	ldrb r1, [r4]
	eors r0, r1
	strb r0, [r4]
	movs r4, #0x9a
	lsls r4, r4, #4
	adds r0, r5, r4
	strb r3, [r0]
	b _080107DC
	.align 2, 0
_08010780: .4byte 0x0000099D
_08010784:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080107E2
	bl GetBlockReceivedStatus
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080107E2
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r1, _080107EC
	ldr r2, _080107F0
	bl CpuSet
	movs r0, #0
	bl ResetBlockReceivedFlag
	ldr r1, _080107F4
	movs r2, #0x9a
	lsls r2, r2, #4
	adds r0, r1, r2
	strb r4, [r0]
	ldr r4, _080107F8
	adds r3, r1, r4
	ldrb r0, [r3]
	cmp r0, #0
	beq _080107DC
	movs r2, #0
	adds r5, r1, #0
	adds r4, r3, #0
	ldrb r1, [r4]
	movs r3, #1
_080107CC:
	adds r0, r1, #0
	asrs r0, r2
	ands r0, r3
	cmp r0, #0
	bne _08010764
	adds r2, #1
	cmp r2, #3
	ble _080107CC
_080107DC:
	adds r0, r6, #0
	bl DestroyTask
_080107E2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080107EC: .4byte 0x0202207C
_080107F0: .4byte 0x0100007E
_080107F4: .4byte 0x030050A0
_080107F8: .4byte 0x0000099E
	thumb_func_end sub_080105A4

	thumb_func_start sub_080107FC
sub_080107FC: @ 0x080107FC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _08010838
	adds r0, r6, #0
	adds r0, #0xf1
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0801081A
	adds r0, r5, #0
	bl DestroyTask
_0801081A:
	ldr r1, _0801083C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08010860
	cmp r0, #1
	bgt _08010840
	cmp r0, #0
	beq _08010846
	b _08010896
	.align 2, 0
_08010838: .4byte 0x030050A0
_0801083C: .4byte 0x03005B60
_08010840:
	cmp r0, #2
	beq _08010872
	b _08010896
_08010846:
	ldrb r0, [r6, #0xd]
	cmp r0, #0
	beq _08010896
	bl sub_0800AE24
	ldr r1, _0801085C
	movs r0, #0
	movs r2, #0x3c
	bl SendBlock
	b _0801086A
	.align 2, 0
_0801085C: .4byte 0x0202257C
_08010860:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08010896
_0801086A:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08010896
_08010872:
	bl GetBlockReceivedStatus
	movs r4, #1
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0
	beq _08010896
	ldr r0, _0801089C
	bl sub_08010514
	movs r0, #0
	bl ResetBlockReceivedFlag
	ldr r0, _080108A0
	strb r4, [r0]
	adds r0, r5, #0
	bl DestroyTask
_08010896:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801089C: .4byte 0x0202207C
_080108A0: .4byte 0x030031C4
	thumb_func_end sub_080107FC

	thumb_func_start sub_080108A4
sub_080108A4: @ 0x080108A4
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801092C
	adds r1, r0, #0
	adds r1, #0xee
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	bne _0801094C
	ldr r2, _08010930
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0801094C
	ldr r0, _08010934
	ldr r1, [r0, #4]
	ldr r0, _08010938
	cmp r1, r0
	beq _080108CE
	ldr r0, [r2, #0x3c]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080108D4
_080108CE:
	ldr r1, _0801093C
	movs r0, #2
	strb r0, [r1]
_080108D4:
	ldr r4, _08010940
	adds r0, r4, #0
	bl SetMainCallback2
	ldr r0, _08010934
	str r4, [r0, #8]
	ldr r5, _0801092C
	ldrh r0, [r5, #0xa]
	lsls r4, r0, #0x10
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #8
	orrs r4, r0
	ldrh r0, [r5, #0x12]
	orrs r4, r0
	ldr r1, _08010944
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r7, r0, #0
	ldr r1, _08010948
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r6, r0, #0
	bl sub_08011564
	movs r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08010910
	movs r3, #1
_08010910:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_0800A9F4
	adds r0, r5, #0
	adds r0, #0xee
	ldrb r1, [r0]
	movs r1, #2
	strb r1, [r0]
	bl CloseLink
	b _0801097E
	.align 2, 0
_0801092C: .4byte 0x030050A0
_08010930: .4byte 0x030041E0
_08010934: .4byte 0x03002360
_08010938: .4byte 0x08017ED1
_0801093C: .4byte 0x0300319C
_08010940: .4byte 0x0800AA0D
_08010944: .4byte 0x0000069E
_08010948: .4byte 0x000008D2
_0801094C:
	ldr r1, _08010984
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08010960
	ldr r1, _08010988
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0801097E
_08010960:
	ldr r0, _0801098C
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0801096C
	bl sub_0800D0EC
_0801096C:
	movs r4, #0xe0
	lsls r4, r4, #7
	movs r0, #1
	adds r1, r4, #0
	bl sub_08011554
	adds r0, r4, #0
	bl sub_08010C60
_0801097E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010984: .4byte 0x000008D3
_08010988: .4byte 0x0000069F
_0801098C: .4byte 0x030041E0
	thumb_func_end sub_080108A4

	thumb_func_start rfu_REQ_recvData_then_sendData
rfu_REQ_recvData_then_sendData: @ 0x08010990
	push {lr}
	ldr r0, _080109AC
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _080109A8
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	movs r0, #0
	bl rfu_REQ_sendData_wrapper
_080109A8:
	pop {r0}
	bx r0
	.align 2, 0
_080109AC: .4byte 0x030041E0
	thumb_func_end rfu_REQ_recvData_then_sendData

	thumb_func_start sub_080109B0
sub_080109B0: @ 0x080109B0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _080109E4
	ldr r1, _080109E8
	adds r0, r4, r1
	strb r5, [r0]
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800C008
	adds r0, r4, #0
	adds r0, #0xef
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010A04
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	beq _080109F2
	cmp r0, #1
	bgt _080109EC
	cmp r0, #0
	beq _080109F8
	b _08010A04
	.align 2, 0
_080109E4: .4byte 0x030050A0
_080109E8: .4byte 0x00000985
_080109EC:
	cmp r0, #2
	beq _08010A00
	b _08010A04
_080109F2:
	bl sub_0800EBB8
	b _08010A04
_080109F8:
	bl sub_0800EFB0
	adds r5, r0, #0
	b _08010A04
_08010A00:
	bl rfu_REQ_recvData_then_sendData
_08010A04:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080109B0

	thumb_func_start sub_08010A0C
sub_08010A0C: @ 0x08010A0C
	push {r4, lr}
	movs r4, #0
	ldr r1, _08010A34
	adds r0, r1, #0
	adds r0, #0xef
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010A2C
	ldrb r0, [r1, #0xc]
	cmp r0, #1
	bne _08010A28
	bl sub_0800ECA0
	adds r4, r0, #0
_08010A28:
	bl sub_080108A4
_08010A2C:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08010A34: .4byte 0x030050A0
	thumb_func_end sub_08010A0C

	thumb_func_start sub_08010A38
sub_08010A38: @ 0x08010A38
	push {lr}
	ldr r0, _08010A48
	ldr r1, _08010A4C
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_08010A48: .4byte 0x020227DA
_08010A4C: .4byte 0x03005AF0
	thumb_func_end sub_08010A38

	thumb_func_start sub_08010A50
sub_08010A50: @ 0x08010A50
	push {r4, lr}
	ldr r4, _08010A70
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xd
	bl memset
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_0800D860
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010A70: .4byte 0x020227CC
	thumb_func_end sub_08010A50

	thumb_func_start sub_08010A74
sub_08010A74: @ 0x08010A74
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08010A8C
	adds r1, r4, #0
	bl sub_0800D860
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010A8C: .4byte 0x020227CC
	thumb_func_end sub_08010A74

	thumb_func_start sub_08010A90
sub_08010A90: @ 0x08010A90
	push {r4, r5, lr}
	ldr r5, _08010AB8
	movs r4, #1
	ands r0, r4
	lsls r0, r0, #4
	ldrb r3, [r5]
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r2, r3
	orrs r2, r0
	ands r1, r4
	lsls r1, r1, #5
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	orrs r2, r1
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010AB8: .4byte 0x020227CC
	thumb_func_end sub_08010A90

	thumb_func_start sub_08010ABC
sub_08010ABC: @ 0x08010ABC
	push {r4, r5, lr}
	ldr r5, _08010AF0
	lsls r0, r0, #2
	ldrb r4, [r5, #9]
	movs r3, #3
	ands r3, r4
	orrs r3, r0
	strb r3, [r5, #9]
	ldr r3, _08010AF4
	adds r0, r3, #0
	ands r1, r0
	ldrh r3, [r5, #8]
	ldr r0, _08010AF8
	ands r0, r3
	orrs r0, r1
	strh r0, [r5, #8]
	lsls r2, r2, #1
	ldrb r1, [r5, #0xb]
	movs r0, #1
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #0xb]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010AF0: .4byte 0x020227CC
_08010AF4: .4byte 0x000003FF
_08010AF8: .4byte 0xFFFFFC00
	thumb_func_end sub_08010ABC

	thumb_func_start sub_08010AFC
sub_08010AFC: @ 0x08010AFC
	push {r4, lr}
	movs r4, #0x80
	ldr r3, _08010B28
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r3
	ldrb r2, [r0, #0x13]
	lsls r2, r2, #3
	orrs r2, r4
	adds r3, #4
	adds r1, r1, r3
	ldr r0, [r1]
	movs r1, #7
	ands r0, r1
	orrs r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08010B28: .4byte 0x020226A0
	thumb_func_end sub_08010AFC

	thumb_func_start sub_08010B2C
sub_08010B2C: @ 0x08010B2C
	push {r4, r5, lr}
	ldr r5, _08010B34
	movs r4, #1
	b _08010B44
	.align 2, 0
_08010B34: .4byte 0x020227CC
_08010B38:
	adds r0, r4, #0
	bl sub_08010AFC
	adds r1, r5, r4
	strb r0, [r1, #3]
	adds r4, #1
_08010B44:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08010B38
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08010B2C

	thumb_func_start sub_08010B58
sub_08010B58: @ 0x08010B58
	push {lr}
	lsls r0, r0, #0x18
	ldr r2, _08010B78
	lsrs r0, r0, #0x11
	ldrb r3, [r2, #0xa]
	movs r1, #0x7f
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #0xa]
	ldr r3, _08010B7C
	movs r0, #0
	movs r1, #2
	bl rfu_REQ_configGameData
	pop {r0}
	bx r0
	.align 2, 0
_08010B78: .4byte 0x020227CC
_08010B7C: .4byte 0x020227DA
	thumb_func_end sub_08010B58

	thumb_func_start sub_08010B80
sub_08010B80: @ 0x08010B80
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08010B8E
	bl sub_08010A74
_08010B8E:
	ldr r2, _08010BA0
	ldr r3, _08010BA4
	movs r0, #0
	movs r1, #2
	bl rfu_REQ_configGameData
	pop {r0}
	bx r0
	.align 2, 0
_08010BA0: .4byte 0x020227CC
_08010BA4: .4byte 0x020227DA
	thumb_func_end sub_08010B80

	thumb_func_start sub_08010BA8
sub_08010BA8: @ 0x08010BA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x45
	bne _08010C3C
	movs r5, #0
	movs r7, #0
	ldr r3, _08010C4C
	ldr r1, _08010C50
	adds r0, r3, r1
	ldr r2, _08010C54
	adds r1, r3, r2
	ldrb r2, [r0]
	ldrb r0, [r1]
	adds r1, r0, #0
	eors r1, r2
	mov r8, r1
	movs r4, #0
	movs r6, #1
	ldr r2, _08010C58
	mov ip, r2
	ldr r0, _08010C5C
	adds r0, r0, r3
	mov sl, r0
	mov r3, ip
	adds r3, #4
_08010BEC:
	mov r0, r8
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _08010C2C
	mov r1, sl
	adds r0, r4, r1
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r2, ip
	adds r1, r0, r2
	ldrb r1, [r1, #0x13]
	adds r2, r6, #0
	ands r2, r1
	lsls r2, r2, #3
	adds r0, r0, r3
	ldr r1, [r0]
	movs r0, #7
	ands r1, r0
	movs r0, #0x80
	orrs r1, r0
	orrs r2, r1
	lsls r0, r5, #3
	lsls r2, r0
	orrs r7, r2
	adds r5, #1
	mov r0, sb
	subs r0, #1
	cmp r5, r0
	beq _08010C32
_08010C2C:
	adds r4, #1
	cmp r4, #3
	ble _08010BEC
_08010C32:
	movs r0, #0x45
	adds r1, r7, #0
	movs r2, #0
	bl sub_08010B80
_08010C3C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010C4C: .4byte 0x030050A0
_08010C50: .4byte 0x0000099A
_08010C54: .4byte 0x0000099B
_08010C58: .4byte 0x020226A0
_08010C5C: .4byte 0x00000996
	thumb_func_end sub_08010BA8

	thumb_func_start sub_08010C60
sub_08010C60: @ 0x08010C60
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08010C88
	adds r3, r2, #0
	adds r3, #0xee
	ldrb r0, [r3]
	cmp r0, #0
	bne _08010C82
	ldr r1, _08010C8C
	ldrh r0, [r1, #0x14]
	strh r0, [r2, #0x10]
	ldrh r0, [r1, #0x16]
	strh r0, [r2, #0x12]
	strh r4, [r2, #0xa]
	ldrb r0, [r3]
	movs r0, #1
	strb r0, [r3]
_08010C82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010C88: .4byte 0x030050A0
_08010C8C: .4byte 0x030041E0
	thumb_func_end sub_08010C60

	thumb_func_start sub_08010C90
sub_08010C90: @ 0x08010C90
	ldr r0, _08010C9C
	adds r0, #0xee
	ldrb r1, [r0]
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08010C9C: .4byte 0x030050A0
	thumb_func_end sub_08010C90

	thumb_func_start sub_08010CA0
sub_08010CA0: @ 0x08010CA0
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	bne _08010CB8
	ldr r0, _08010CB4
	adds r0, #0xee
	ldrb r1, [r0]
	strb r2, [r0]
	b _08010CC2
	.align 2, 0
_08010CB4: .4byte 0x030050A0
_08010CB8:
	ldr r0, _08010CC8
	adds r0, #0xee
	ldrb r1, [r0]
	movs r1, #4
	strb r1, [r0]
_08010CC2:
	pop {r0}
	bx r0
	.align 2, 0
_08010CC8: .4byte 0x030050A0
	thumb_func_end sub_08010CA0

	thumb_func_start sub_08010CCC
sub_08010CCC: @ 0x08010CCC
	push {lr}
	ldr r0, _08010CE4
	ldrb r0, [r0]
	movs r1, #1
	bl sub_08011980
	ldr r1, _08010CE8
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08010CE4: .4byte 0x030041E0
_08010CE8: .4byte 0x030050A0
	thumb_func_end sub_08010CCC

	thumb_func_start sub_08010CEC
sub_08010CEC: @ 0x08010CEC
	ldr r1, _08010CF4
	ldr r0, _08010CF8
	str r0, [r1]
	bx lr
	.align 2, 0
_08010CF4: .4byte 0x030050A0
_08010CF8: .4byte 0x08010CCD
	thumb_func_end sub_08010CEC

	thumb_func_start sub_08010CFC
sub_08010CFC: @ 0x08010CFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r6, #0
	cmp r4, #0x32
	bne _08010D12
	b _08010E50
_08010D12:
	cmp r4, #0x32
	bgt _08010D42
	cmp r4, #0x13
	bgt _08010D30
	cmp r4, #0x12
	blt _08010D20
	b _08010EDE
_08010D20:
	cmp r4, #0x10
	bne _08010D26
	b _08010EDE
_08010D26:
	cmp r4, #0x10
	bgt _08010D7C
	cmp r4, #0
	beq _08010D6E
	b _08010EDE
_08010D30:
	cmp r4, #0x30
	bne _08010D36
	b _08010E5C
_08010D36:
	cmp r4, #0x30
	ble _08010D3C
	b _08010E44
_08010D3C:
	cmp r4, #0x14
	beq _08010E18
	b _08010EDE
_08010D42:
	cmp r4, #0x44
	bgt _08010D54
	cmp r4, #0x42
	blt _08010D4C
	b _08010EDE
_08010D4C:
	cmp r4, #0x33
	bne _08010D52
	b _08010E5C
_08010D52:
	b _08010EDE
_08010D54:
	cmp r4, #0xf3
	bne _08010D5A
	b _08010EAA
_08010D5A:
	cmp r4, #0xf3
	bgt _08010D66
	cmp r4, #0xf0
	bge _08010D64
	b _08010EDE
_08010D64:
	b _08010EC4
_08010D66:
	cmp r4, #0xff
	bne _08010D6C
	b _08010EC4
_08010D6C:
	b _08010EDE
_08010D6E:
	ldr r1, _08010D78
	movs r0, #2
	strh r0, [r1, #4]
	b _08010EDE
	.align 2, 0
_08010D78: .4byte 0x030050A0
_08010D7C:
	ldr r0, _08010DE0
	ldrh r0, [r0, #0x14]
	bl sub_080110DC
	movs r5, #0
	movs r0, #1
	mov r8, r0
	ldr r1, _08010DE4
	mov sb, r1
	ldr r3, _08010DE8
	add r3, sb
	mov sl, r3
	movs r7, #0x7f
_08010D96:
	ldr r0, _08010DE0
	ldrh r0, [r0, #0x14]
	asrs r0, r5
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08010DFE
	ldr r0, _08010DEC
	lsls r1, r5, #5
	adds r1, #0x14
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0, #0x10]
	adds r4, r7, #0
	ands r4, r0
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	adds r0, r7, #0
	ands r0, r1
	cmp r4, r0
	bne _08010DF4
	ldr r0, _08010DF0
	add r0, sb
	adds r0, r5, r0
	movs r1, #0
	strb r1, [r0]
	mov r3, sl
	adds r2, r5, r3
	strb r1, [r2]
	movs r0, #0x20
	adds r1, r5, #0
	movs r3, #1
	bl rfu_setRecvBuffer
	b _08010DFE
	.align 2, 0
_08010DE0: .4byte 0x030041E0
_08010DE4: .4byte 0x030050A0
_08010DE8: .4byte 0x0000098D
_08010DEC: .4byte 0x03007630
_08010DF0: .4byte 0x00000989
_08010DF4:
	mov r0, r8
	lsls r0, r5
	orrs r6, r0
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
_08010DFE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08010D96
	cmp r6, #0
	beq _08010EDE
	adds r0, r6, #0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	b _08010EDE
_08010E18:
	ldr r4, _08010E38
	ldr r1, _08010E3C
	adds r0, r4, r1
	ldr r1, _08010E40
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	beq _08010E32
	eors r0, r2
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_08010E32:
	movs r0, #0x11
	strh r0, [r4, #4]
	b _08010EDE
	.align 2, 0
_08010E38: .4byte 0x030050A0
_08010E3C: .4byte 0x0000099F
_08010E40: .4byte 0x030041E0
_08010E44:
	ldr r0, _08010E4C
	adds r0, #0xf0
	b _08010EDA
	.align 2, 0
_08010E4C: .4byte 0x030050A0
_08010E50:
	ldr r0, _08010E58
	adds r0, #0xf0
	movs r1, #3
	b _08010EDC
	.align 2, 0
_08010E58: .4byte 0x030050A0
_08010E5C:
	ldr r1, _08010E8C
	adds r2, r1, #0
	adds r2, #0xf0
	movs r0, #4
	strb r0, [r2]
	ldr r3, _08010E90
	adds r1, r1, r3
	ldr r0, _08010E94
	ldrb r2, [r0, #0x14]
	ldrb r0, [r1]
	adds r3, r0, #0
	bics r3, r2
	adds r2, r3, #0
	strb r2, [r1]
	ldr r0, _08010E98
	ldrb r0, [r0]
	cmp r0, #1
	bne _08010EA0
	cmp r2, #0
	bne _08010E9C
	adds r0, r4, #0
	bl sub_08010C60
	b _08010EA0
	.align 2, 0
_08010E8C: .4byte 0x030050A0
_08010E90: .4byte 0x0000099A
_08010E94: .4byte 0x030041E0
_08010E98: .4byte 0x030031C4
_08010E9C:
	bl sub_08010CEC
_08010EA0:
	movs r0, #2
	adds r1, r4, #0
	bl sub_08011554
	b _08010EDE
_08010EAA:
	movs r0, #1
	movs r1, #0xf3
	bl sub_08011554
	movs r0, #0xf3
	bl sub_08010C60
	ldr r0, _08010EC0
	adds r0, #0xef
	b _08010EDA
	.align 2, 0
_08010EC0: .4byte 0x030050A0
_08010EC4:
	adds r0, r4, #0
	bl sub_08010C60
	movs r0, #1
	adds r1, r4, #0
	bl sub_08011554
	ldr r0, _08010EEC
	ldr r1, _08010EF0
	adds r0, r0, r1
	ldrb r1, [r0]
_08010EDA:
	movs r1, #1
_08010EDC:
	strb r1, [r0]
_08010EDE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010EEC: .4byte 0x030050A0
_08010EF0: .4byte 0x00000993
	thumb_func_end sub_08010CFC

	thumb_func_start sub_08010EF4
sub_08010EF4: @ 0x08010EF4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x31
	bne _08010F00
	b _08011060
_08010F00:
	cmp r4, #0x31
	bgt _08010F2E
	cmp r4, #0x22
	beq _08010F84
	cmp r4, #0x22
	bgt _08010F1C
	cmp r4, #0x20
	beq _08010F6C
	cmp r4, #0x20
	ble _08010F16
	b _080110CE
_08010F16:
	cmp r4, #0
	beq _08010F5E
	b _080110CE
_08010F1C:
	cmp r4, #0x24
	beq _08010FAA
	cmp r4, #0x24
	blt _08010FA0
	cmp r4, #0x25
	beq _08010FF4
	cmp r4, #0x30
	beq _08010FFE
	b _080110CE
_08010F2E:
	cmp r4, #0x44
	bgt _08010F44
	cmp r4, #0x42
	blt _08010F38
	b _080110CE
_08010F38:
	cmp r4, #0x33
	beq _08011012
	cmp r4, #0x33
	bge _08010F42
	b _0801107C
_08010F42:
	b _080110CE
_08010F44:
	cmp r4, #0xf3
	bne _08010F4A
	b _0801109C
_08010F4A:
	cmp r4, #0xf3
	bgt _08010F56
	cmp r4, #0xf0
	bge _08010F54
	b _080110CE
_08010F54:
	b _080110B4
_08010F56:
	cmp r4, #0xff
	bne _08010F5C
	b _080110B4
_08010F5C:
	b _080110CE
_08010F5E:
	ldr r1, _08010F68
	movs r0, #6
	strh r0, [r1, #4]
	b _080110CE
	.align 2, 0
_08010F68: .4byte 0x030050A0
_08010F6C:
	ldr r0, _08010F78
	ldr r1, _08010F7C
	ldrh r1, [r1, #0x14]
	ldr r2, _08010F80
	adds r0, r0, r2
	b _080110CC
	.align 2, 0
_08010F78: .4byte 0x030050A0
_08010F7C: .4byte 0x030041E0
_08010F80: .4byte 0x00000985
_08010F84:
	ldr r0, _08010F94
	ldr r1, _08010F98
	ldrh r1, [r1, #0x14]
	ldr r2, _08010F9C
	adds r0, r0, r2
	ldrb r2, [r0]
	b _080110CC
	.align 2, 0
_08010F94: .4byte 0x030050A0
_08010F98: .4byte 0x030041E0
_08010F9C: .4byte 0x000008F6
_08010FA0:
	movs r0, #2
	adds r1, r4, #0
	bl sub_08011554
	b _080110CE
_08010FAA:
	ldr r4, _08010FE0
	movs r1, #0
	movs r0, #0xb
	strh r0, [r4, #4]
	ldr r2, _08010FE4
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08010FE8
	adds r2, r4, r0
	strb r1, [r2]
	ldr r1, _08010FEC
	adds r5, r4, r1
	ldrb r1, [r5]
	movs r0, #0x20
	movs r3, #1
	bl rfu_setRecvBuffer
	ldrb r1, [r5]
	ldr r2, _08010FF0
	adds r4, r4, r2
	movs r0, #0x10
	adds r2, r4, #0
	movs r3, #0x46
	bl rfu_setRecvBuffer
	b _080110CE
	.align 2, 0
_08010FE0: .4byte 0x030050A0
_08010FE4: .4byte 0x0000093D
_08010FE8: .4byte 0x0000093E
_08010FEC: .4byte 0x000008F6
_08010FF0: .4byte 0x000008F7
_08010FF4:
	movs r0, #2
	movs r1, #0x25
	bl sub_08011554
	b _080110CE
_08010FFE:
	ldr r0, _08011050
	adds r2, r0, #0
	adds r2, #0xf0
	movs r1, #2
	strb r1, [r2]
	ldr r1, _08011054
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #6
	beq _080110CE
_08011012:
	ldr r2, _08011050
	adds r1, r2, #0
	adds r1, #0xf0
	ldrb r0, [r1]
	cmp r0, #2
	beq _08011022
	movs r0, #4
	strb r0, [r1]
_08011022:
	ldr r1, _08011054
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #9
	beq _08011034
	movs r0, #2
	adds r1, r4, #0
	bl sub_08011554
_08011034:
	ldr r0, _08011058
	movs r1, #5
	movs r2, #5
	bl nullsub_13
	ldr r0, _0801105C
	ldrb r0, [r0]
	cmp r0, #1
	bne _080110CE
	adds r0, r4, #0
	bl sub_08010C60
	b _080110CE
	.align 2, 0
_08011050: .4byte 0x030050A0
_08011054: .4byte 0x0000093E
_08011058: .4byte 0x082C0578
_0801105C: .4byte 0x030031C4
_08011060:
	ldr r0, _08011074
	adds r0, #0xf0
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08011078
	movs r1, #5
	movs r2, #5
	bl nullsub_13
	b _080110CE
	.align 2, 0
_08011074: .4byte 0x030050A0
_08011078: .4byte 0x082C0590
_0801107C:
	ldr r1, _08011094
	adds r2, r1, #0
	adds r2, #0xf0
	movs r0, #3
	strb r0, [r2]
	ldr r2, _08011098
	adds r1, r1, r2
	ldrb r0, [r1]
	movs r0, #1
	strb r0, [r1]
	b _080110CE
	.align 2, 0
_08011094: .4byte 0x030050A0
_08011098: .4byte 0x000008F4
_0801109C:
	movs r0, #1
	movs r1, #0xf3
	bl sub_08011554
	movs r0, #0xf3
	bl sub_08010C60
	ldr r0, _080110B0
	adds r0, #0xef
	b _080110CA
	.align 2, 0
_080110B0: .4byte 0x030050A0
_080110B4:
	movs r0, #1
	adds r1, r4, #0
	bl sub_08011554
	adds r0, r4, #0
	bl sub_08010C60
	ldr r0, _080110D4
	ldr r1, _080110D8
	adds r0, r0, r1
	ldrb r1, [r0]
_080110CA:
	movs r1, #1
_080110CC:
	strb r1, [r0]
_080110CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080110D4: .4byte 0x030050A0
_080110D8: .4byte 0x00000993
	thumb_func_end sub_08010EF4

	thumb_func_start sub_080110DC
sub_080110DC: @ 0x080110DC
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r6, #1
	ldr r0, _08011110
	ldr r4, _08011114
	adds r1, r0, r4
	movs r5, #0
	movs r4, #0xff
_080110EE:
	adds r0, r3, #0
	asrs r0, r2
	ands r0, r6
	cmp r0, #0
	beq _08011100
	strb r5, [r1]
	ldrb r0, [r1, #4]
	orrs r0, r4
	strb r0, [r1, #4]
_08011100:
	adds r1, #1
	adds r2, #1
	cmp r2, #3
	ble _080110EE
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011110: .4byte 0x030050A0
_08011114: .4byte 0x000009A2
	thumb_func_end sub_080110DC

	thumb_func_start sub_08011118
sub_08011118: @ 0x08011118
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r3, #0
	movs r2, #0
	movs r4, #1
	ldr r6, _08011160
	movs r7, #0x7f
_08011126:
	adds r0, r5, #0
	asrs r0, r2
	ands r0, r4
	cmp r0, #0
	beq _0801114C
	lsls r1, r2, #5
	adds r1, #0x14
	ldr r0, [r6]
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0x45
	bne _0801114C
	adds r0, r4, #0
	lsls r0, r2
	orrs r3, r0
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
_0801114C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _08011126
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08011160: .4byte 0x03007630
	thumb_func_end sub_08011118

	thumb_func_start sub_08011164
sub_08011164: @ 0x08011164
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x25
	bne _08011170
	b _080113DC
_08011170:
	cmp r4, #0x25
	bgt _080111B2
	cmp r4, #0x14
	bne _0801117A
	b _080112F4
_0801117A:
	cmp r4, #0x14
	bgt _08011192
	cmp r4, #0x11
	beq _08011212
	cmp r4, #0x11
	ble _08011188
	b _08011532
_08011188:
	cmp r4, #0
	beq _080111FC
	cmp r4, #0x10
	beq _08011208
	b _08011532
_08011192:
	cmp r4, #0x22
	bne _08011198
	b _08011358
_08011198:
	cmp r4, #0x22
	bgt _080111A4
	cmp r4, #0x20
	bne _080111A2
	b _08011340
_080111A2:
	b _08011532
_080111A4:
	cmp r4, #0x23
	bne _080111AA
	b _08011374
_080111AA:
	cmp r4, #0x24
	bne _080111B0
	b _080113AA
_080111B0:
	b _08011532
_080111B2:
	cmp r4, #0x44
	bgt _080111E2
	cmp r4, #0x42
	blt _080111BC
	b _08011532
_080111BC:
	cmp r4, #0x32
	bne _080111C2
	b _08011404
_080111C2:
	cmp r4, #0x32
	bgt _080111D4
	cmp r4, #0x30
	bne _080111CC
	b _08011430
_080111CC:
	cmp r4, #0x31
	bne _080111D2
	b _080113E6
_080111D2:
	b _08011532
_080111D4:
	cmp r4, #0x33
	bne _080111DA
	b _08011438
_080111DA:
	cmp r4, #0x40
	bne _080111E0
	b _080114EC
_080111E0:
	b _08011532
_080111E2:
	cmp r4, #0xf3
	bne _080111E8
	b _080114FC
_080111E8:
	cmp r4, #0xf3
	bgt _080111F4
	cmp r4, #0xf0
	bge _080111F2
	b _08011532
_080111F2:
	b _08011518
_080111F4:
	cmp r4, #0xff
	bne _080111FA
	b _08011518
_080111FA:
	b _08011532
_080111FC:
	ldr r1, _08011204
	movs r0, #0x11
	strh r0, [r1, #4]
	b _08011532
	.align 2, 0
_08011204: .4byte 0x030050A0
_08011208:
	movs r0, #4
	movs r1, #0
	bl sub_08011554
	b _08011532
_08011212:
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x45
	bne _080112CC
	ldr r5, _08011278
	ldr r1, _0801127C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080112CC
	ldr r0, _08011280
	ldrh r0, [r0, #0x14]
	bl sub_08011118
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08011296
	adds r0, r4, #0
	bl sub_0800E340
	movs r2, #1
	mov ip, r2
	mov r1, ip
	lsls r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r7, _08011284
	adds r6, r5, r7
	ldrb r2, [r6]
	cmp r2, #0
	bne _08011288
	movs r0, #0x9a
	lsls r0, r0, #4
	adds r3, r5, r0
	ldrb r0, [r3]
	cmp r0, #0
	bne _08011288
	subs r7, #1
	adds r0, r5, r7
	strb r1, [r0]
	eors r1, r4
	orrs r1, r2
	strb r1, [r6]
	mov r0, ip
	strb r0, [r3]
	b _08011296
	.align 2, 0
_08011278: .4byte 0x030050A0
_0801127C: .4byte 0x00000991
_08011280: .4byte 0x030041E0
_08011284: .4byte 0x0000099E
_08011288:
	ldr r0, _080112B8
	ldr r1, _080112BC
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r1, r4, #0
	orrs r1, r2
	strb r1, [r0]
_08011296:
	ldr r0, _080112C0
	ldrh r1, [r0, #0x14]
	cmp r4, r1
	beq _080112E6
	ldr r2, _080112B8
	ldr r7, _080112C4
	adds r3, r2, r7
	adds r0, r4, #0
	eors r0, r1
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080112C8
	adds r2, r2, r0
	movs r0, #2
	strb r0, [r2]
	b _080112E6
	.align 2, 0
_080112B8: .4byte 0x030050A0
_080112BC: .4byte 0x0000099E
_080112C0: .4byte 0x030041E0
_080112C4: .4byte 0x0000099B
_080112C8: .4byte 0x0000099C
_080112CC:
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x54
	bne _080112E6
	ldr r0, _080112F0
	ldrb r0, [r0]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080112E6:
	ldr r0, _080112F0
	ldrh r0, [r0, #0x14]
	bl sub_080110DC
	b _08011532
	.align 2, 0
_080112F0: .4byte 0x030041E0
_080112F4:
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x45
	beq _08011326
	ldr r4, _08011338
	ldrb r0, [r4, #1]
	cmp r0, #1
	bls _08011326
	ldrb r0, [r4, #0x14]
	bl sub_0800E340
	movs r1, #0x80
	lsls r1, r1, #0x11
	lsls r1, r0
	lsrs r1, r1, #0x18
	ldrb r0, [r4]
	eors r1, r0
	adds r0, r1, #0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_08011326:
	ldr r1, _0801133C
	ldrh r0, [r1, #4]
	cmp r0, #0xf
	beq _08011330
	b _08011532
_08011330:
	movs r0, #0x10
	strh r0, [r1, #4]
	b _08011532
	.align 2, 0
_08011338: .4byte 0x030041E0
_0801133C: .4byte 0x030050A0
_08011340:
	ldr r0, _0801134C
	ldr r1, _08011350
	ldrh r1, [r1, #0x14]
	ldr r2, _08011354
	adds r0, r0, r2
	b _08011530
	.align 2, 0
_0801134C: .4byte 0x030050A0
_08011350: .4byte 0x030041E0
_08011354: .4byte 0x00000985
_08011358:
	ldr r0, _08011368
	ldr r1, _0801136C
	ldrh r1, [r1, #0x14]
	ldr r7, _08011370
	adds r0, r0, r7
	ldrb r2, [r0]
	b _08011530
	.align 2, 0
_08011368: .4byte 0x030050A0
_0801136C: .4byte 0x030041E0
_08011370: .4byte 0x000008F6
_08011374:
	ldr r1, _08011394
	movs r0, #0x12
	strh r0, [r1, #4]
	ldr r0, _08011398
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #1
	bhi _080113A0
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0801139C
	movs r1, #2
	bl CreateTask
	b _08011532
	.align 2, 0
_08011394: .4byte 0x030050A0
_08011398: .4byte 0x00000987
_0801139C: .4byte 0x08011B89
_080113A0:
	movs r0, #2
	movs r1, #0x23
	bl sub_08011554
	b _08011532
_080113AA:
	ldr r4, _080113D0
	movs r0, #0xd
	strh r0, [r4, #4]
	movs r0, #3
	movs r1, #0
	bl sub_08011554
	ldr r1, _080113D4
	adds r0, r4, r1
	ldrb r1, [r0]
	ldr r2, _080113D8
	adds r4, r4, r2
	movs r0, #0x10
	adds r2, r4, #0
	movs r3, #0x46
	bl rfu_setRecvBuffer
	b _08011532
	.align 2, 0
_080113D0: .4byte 0x030050A0
_080113D4: .4byte 0x000008F6
_080113D8: .4byte 0x000008F7
_080113DC:
	movs r0, #2
	movs r1, #0x25
	bl sub_08011554
	b _08011532
_080113E6:
	ldr r0, _080113FC
	ldrb r1, [r0]
	ldrh r0, [r0, #0x14]
	ands r1, r0
	cmp r1, #0
	bne _080113F4
	b _08011532
_080113F4:
	ldr r0, _08011400
	adds r0, #0xf0
	movs r1, #1
	b _08011530
	.align 2, 0
_080113FC: .4byte 0x030041E0
_08011400: .4byte 0x030050A0
_08011404:
	ldr r2, _08011424
	adds r1, r2, #0
	adds r1, #0xf0
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08011428
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801141A
	b _08011532
_0801141A:
	ldr r7, _0801142C
	adds r0, r2, r7
	ldrb r1, [r0]
	movs r1, #1
	b _08011530
	.align 2, 0
_08011424: .4byte 0x030050A0
_08011428: .4byte 0x03007630
_0801142C: .4byte 0x000008F4
_08011430:
	ldr r0, _08011470
	adds r0, #0xf0
	movs r1, #2
	strb r1, [r0]
_08011438:
	ldr r2, _08011470
	adds r1, r2, #0
	adds r1, #0xf0
	ldrb r0, [r1]
	cmp r0, #2
	beq _08011448
	movs r0, #4
	strb r0, [r1]
_08011448:
	ldrb r0, [r2, #0xc]
	cmp r0, #1
	bne _08011486
	ldr r0, _08011474
	ldrb r0, [r0]
	cmp r0, #1
	bne _080114A4
	ldr r0, _08011478
	adds r2, r2, r0
	ldr r0, _0801147C
	ldrb r1, [r0, #0x14]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	cmp r0, #0
	bne _08011480
	adds r0, r4, #0
	bl sub_08010C60
	b _080114A4
	.align 2, 0
_08011470: .4byte 0x030050A0
_08011474: .4byte 0x030031C4
_08011478: .4byte 0x0000099A
_0801147C: .4byte 0x030041E0
_08011480:
	bl sub_08010CEC
	b _080114A4
_08011486:
	ldr r1, _080114D4
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #2
	beq _080114A4
	ldr r0, _080114D8
	ldrb r0, [r0]
	cmp r0, #1
	bne _080114A4
	adds r0, r4, #0
	bl sub_08010C60
	movs r0, #0
	bl sub_0800BD38
_080114A4:
	ldr r0, _080114DC
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080114CA
	ldr r0, _080114E0
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _080114CA
	ldr r0, _080114E4
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080114CA
	ldr r1, _080114E8
	movs r0, #0x11
	strh r0, [r1, #4]
_080114CA:
	movs r0, #2
	adds r1, r4, #0
	bl sub_08011554
	b _08011532
	.align 2, 0
_080114D4: .4byte 0x0000099C
_080114D8: .4byte 0x030031C4
_080114DC: .4byte 0x03007630
_080114E0: .4byte 0x030041E0
_080114E4: .4byte 0x0800E609
_080114E8: .4byte 0x030050A0
_080114EC:
	ldr r0, _080114F4
	ldr r2, _080114F8
	adds r0, r0, r2
	b _0801152E
	.align 2, 0
_080114F4: .4byte 0x030050A0
_080114F8: .4byte 0x0000099B
_080114FC:
	movs r0, #1
	movs r1, #0xf3
	bl sub_08011554
	movs r0, #0xf3
	bl sub_08010C60
	ldr r0, _08011514
	adds r0, #0xef
	movs r1, #1
	b _08011530
	.align 2, 0
_08011514: .4byte 0x030050A0
_08011518:
	adds r0, r4, #0
	bl sub_08010C60
	movs r0, #1
	adds r1, r4, #0
	bl sub_08011554
	ldr r0, _08011538
	ldr r7, _0801153C
	adds r0, r0, r7
	ldrb r1, [r0]
_0801152E:
	movs r1, #0
_08011530:
	strb r1, [r0]
_08011532:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011538: .4byte 0x030050A0
_0801153C: .4byte 0x00000993
	thumb_func_end sub_08011164

	thumb_func_start sub_08011540
sub_08011540: @ 0x08011540
	ldr r0, _0801154C
	ldr r1, _08011550
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0801154C: .4byte 0x030050A0
_08011550: .4byte 0x0000099C
	thumb_func_end sub_08011540

	thumb_func_start sub_08011554
sub_08011554: @ 0x08011554
	ldr r2, _08011560
	adds r3, r2, #0
	adds r3, #0xf1
	strb r0, [r3]
	strh r1, [r2, #0xa]
	bx lr
	.align 2, 0
_08011560: .4byte 0x030050A0
	thumb_func_end sub_08011554

	thumb_func_start sub_08011564
sub_08011564: @ 0x08011564
	ldr r0, _0801156C
	adds r0, #0xf1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0801156C: .4byte 0x030050A0
	thumb_func_end sub_08011564

	thumb_func_start sub_08011570
sub_08011570: @ 0x08011570
	push {lr}
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r0, #1
	bls _08011584
	movs r0, #0
	b _08011586
_08011584:
	movs r0, #1
_08011586:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08011570

	thumb_func_start GetRfuRecvQueueLength
GetRfuRecvQueueLength: @ 0x0801158C
	ldr r0, _08011598
	movs r1, #0x9a
	lsls r1, r1, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08011598: .4byte 0x030050A0
	thumb_func_end GetRfuRecvQueueLength

	thumb_func_start Rfu_IsMaster
Rfu_IsMaster: @ 0x0801159C
	ldr r0, _080115A4
	ldrb r0, [r0, #0xc]
	bx lr
	.align 2, 0
_080115A4: .4byte 0x030050A0
	thumb_func_end Rfu_IsMaster

	thumb_func_start ReadU16
ReadU16: @ 0x080115A8
	push {lr}
	bl rfu_syncVBlank_
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ReadU16

	thumb_func_start sub_080115B4
sub_080115B4: @ 0x080115B4
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080115CC
	ldr r2, _080115D0
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080115CC: .4byte 0x03003130
_080115D0: .4byte 0x05000014
	thumb_func_end sub_080115B4

	thumb_func_start sub_080115D4
sub_080115D4: @ 0x080115D4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080115D4

	thumb_func_start sub_080115E8
sub_080115E8: @ 0x080115E8
	push {r4, lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl ResetPaletteFade
	ldr r0, _08011664
	bl SetVBlankCallback
	bl IsWirelessAdapterConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801165C
	ldr r1, _08011668
	ldr r2, _0801166C
	adds r0, r2, #0
	strh r0, [r1]
	bl sub_0800AF5C
	bl OpenLink
	ldr r0, _08011670
	ldrh r0, [r0, #0x24]
	bl SeedRng
	movs r4, #0
_08011624:
	bl Random
	ldr r1, _08011674
	ldr r1, [r1]
	adds r1, #0xa
	adds r1, r1, r4
	strb r0, [r1]
	adds r4, #1
	cmp r4, #3
	ble _08011624
	movs r1, #0xaa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_08011690
	ldr r0, _08011678
	bl SetMainCallback2
_0801165C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011664: .4byte 0x080115D5
_08011668: .4byte 0x0202267E
_0801166C: .4byte 0x00001111
_08011670: .4byte 0x03002360
_08011674: .4byte 0x03005AF0
_08011678: .4byte 0x080116E5
	thumb_func_end sub_080115E8

	thumb_func_start sub_0801167C
sub_0801167C: @ 0x0801167C
	push {lr}
	ldr r0, _0801168C
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0801168C: .4byte 0x0800E609
	thumb_func_end sub_0801167C

	thumb_func_start sub_08011690
sub_08011690: @ 0x08011690
	push {r4, lr}
	ldr r4, _080116B4
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080116AE
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	ldr r1, _080116B8
	adds r1, #0x66
	strb r0, [r1]
_080116AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080116B4: .4byte 0x08011FD5
_080116B8: .4byte 0x030050A0
	thumb_func_end sub_08011690

	thumb_func_start sub_080116BC
sub_080116BC: @ 0x080116BC
	push {lr}
	ldr r0, _080116DC
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080116D6
	ldr r0, _080116E0
	adds r0, #0x66
	ldrb r0, [r0]
	bl DestroyTask
_080116D6:
	pop {r0}
	bx r0
	.align 2, 0
_080116DC: .4byte 0x08011FD5
_080116E0: .4byte 0x030050A0
	thumb_func_end sub_080116BC

	thumb_func_start sub_080116E4
sub_080116E4: @ 0x080116E4
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080116E4

	thumb_func_start sub_080116FC
sub_080116FC: @ 0x080116FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08011734
	movs r0, #1
	strb r0, [r1, #0xc]
	bl sub_08010A38
	ldr r0, _08011738
	movs r1, #0
	bl sub_0800BA08
	ldr r2, _0801173C
	adds r1, r2, #0
	ldr r0, _08011740
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, _08011744
	subs r4, #1
	adds r4, r4, r0
	ldrb r0, [r4]
	strh r0, [r2, #2]
	bl sub_0800E938
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011734: .4byte 0x030050A0
_08011738: .4byte 0x08010CFD
_0801173C: .4byte 0x020227E4
_08011740: .4byte 0x082C0358
_08011744: .4byte 0x082C0370
	thumb_func_end sub_080116FC

	thumb_func_start sub_08011748
sub_08011748: @ 0x08011748
	push {lr}
	ldr r1, _08011764
	movs r0, #0
	strb r0, [r1, #0xc]
	bl sub_08010A38
	ldr r0, _08011768
	ldr r1, _0801176C
	bl sub_0800BA08
	bl sub_0800E9C0
	pop {r0}
	bx r0
	.align 2, 0
_08011764: .4byte 0x030050A0
_08011768: .4byte 0x08010EF5
_0801176C: .4byte 0x0800E7F5
	thumb_func_end sub_08011748

	thumb_func_start sub_08011770
sub_08011770: @ 0x08011770
	push {r4, r5, r6, r7, lr}
	ldr r4, _080117B0
	movs r5, #0
	movs r0, #2
	strb r0, [r4, #0xc]
	bl sub_08010A38
	ldr r0, _080117B4
	movs r1, #0
	bl sub_0800BA08
	ldr r2, _080117B8
	adds r1, r2, #0
	ldr r0, _080117BC
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	strb r5, [r2, #0x11]
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r2, #0x12]
	ldr r0, _080117C0
	movs r1, #1
	bl CreateTask
	adds r4, #0x67
	strb r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080117B0: .4byte 0x030050A0
_080117B4: .4byte 0x08011165
_080117B8: .4byte 0x020227E4
_080117BC: .4byte 0x082C0358
_080117C0: .4byte 0x0800E609
	thumb_func_end sub_08011770

	thumb_func_start sub_080117C4
sub_080117C4: @ 0x080117C4
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0]
	orrs r0, r1
	bx lr
	.align 2, 0
	thumb_func_end sub_080117C4

	thumb_func_start sub_080117D0
sub_080117D0: @ 0x080117D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	movs r0, #0xff
	mov sb, r0
	movs r7, #0
	ldr r1, _08011854
	mov r8, r1
_080117EE:
	lsls r4, r7, #5
	adds r5, r4, #0
	adds r5, #0x14
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r5
	adds r0, #8
	bl sub_080117C4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	ldrh r0, [r0, #0x18]
	bl sub_0800FF54
	cmp r0, #0
	beq _08011838
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r5
	adds r1, #0x15
	ldr r0, [sp]
	bl StringCompare
	cmp r0, #0
	bne _08011838
	cmp sl, r6
	bne _08011838
	mov sb, r7
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0, #0x16]
	cmp r0, #0xff
	bne _08011842
_08011838:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _080117EE
_08011842:
	mov r0, sb
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08011854: .4byte 0x03007630
	thumb_func_end sub_080117D0

	thumb_func_start sub_08011858
sub_08011858: @ 0x08011858
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	ldr r4, _0801189C
	ldr r0, _080118A0
	adds r5, r4, r0
	ldrb r0, [r5]
	bics r0, r6
	strb r0, [r5]
	ldr r1, _080118A4
	adds r6, r4, r1
	ldrb r1, [r6]
	movs r0, #1
	bl rfu_clearSlot
	ldrb r0, [r5]
	ldr r1, _080118A8
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #0x46
	bl rfu_UNI_setSendData
	ldrb r0, [r5]
	bl sub_0800E340
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801189C: .4byte 0x030050A0
_080118A0: .4byte 0x0000099A
_080118A4: .4byte 0x00000992
_080118A8: .4byte 0x0000093F
	thumb_func_end sub_08011858

	thumb_func_start sub_080118AC
sub_080118AC: @ 0x080118AC
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_080117D0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq _080118C6
	movs r0, #1
	lsls r0, r1
	bl sub_08011858
_080118C6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080118AC

	thumb_func_start sub_080118CC
sub_080118CC: @ 0x080118CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _0801190C
	movs r3, #0
	movs r2, #0
	ldr r5, _08011914
	adds r6, r5, #4
_080118DC:
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r4
	bne _080118FA
	ldrb r0, [r6]
	asrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080118FA
	adds r0, r1, #0
	lsls r0, r2
	orrs r3, r0
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
_080118FA:
	adds r2, #1
	cmp r2, #3
	ble _080118DC
	cmp r3, #0
	beq _0801190C
	adds r0, r3, #0
	movs r1, #2
	bl sub_08011980
_0801190C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011914: .4byte 0x03005A36
	thumb_func_end sub_080118CC

	thumb_func_start sub_08011918
sub_08011918: @ 0x08011918
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08011970
	ldrh r0, [r6]
	cmp r0, #0
	bne _08011968
	ldr r5, _08011974
	movs r1, #0x9a
	lsls r1, r1, #4
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08011968
	movs r0, #0xed
	lsls r0, r0, #8
	bl sub_0800F7F8
	ldr r1, _08011978
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	strh r1, [r6, #2]
	ldrh r1, [r0, #0xa]
	strh r1, [r6, #4]
	ldr r1, _0801197C
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r1, [r5, #0xd]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r5, #0xd]
	ldrb r0, [r5, #0xd]
	strh r0, [r6, #6]
	adds r0, r4, #0
	bl DestroyTask
_08011968:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011970: .4byte 0x030031B0
_08011974: .4byte 0x030050A0
_08011978: .4byte 0x03005B60
_0801197C: .4byte 0x082C03E5
	thumb_func_end sub_08011918

	thumb_func_start sub_08011980
sub_08011980: @ 0x08011980
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r5, _080119B0
	adds r0, r5, #0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _080119B8
	adds r0, r5, #0
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080119B4
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #8]
	b _080119C8
	.align 2, 0
_080119B0: .4byte 0x08011919
_080119B4: .4byte 0x03005B60
_080119B8:
	ldr r0, _080119DC
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	orrs r4, r0
	strh r4, [r1, #8]
_080119C8:
	ldr r1, _080119DC
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080119DC: .4byte 0x03005B60
	thumb_func_end sub_08011980

	thumb_func_start sub_080119E0
sub_080119E0: @ 0x080119E0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _08011A38
	adds r4, r0, r1
	bl sub_0800E954
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08011A90
	adds r0, r4, #0
	adds r0, #0x10
	bl sub_080117C4
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_080117D0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08011A78
	ldr r0, _08011A3C
	ldr r0, [r0]
	lsls r1, r2, #5
	adds r0, r0, r1
	ldrb r0, [r0, #0x16]
	cmp r0, #0xff
	beq _08011A48
	ldr r0, _08011A40
	ldr r1, _08011A44
	adds r0, r0, r1
	strb r2, [r0]
	bl sub_0800E97C
	cmp r0, #0
	beq _08011A96
	b _08011A70
	.align 2, 0
_08011A38: .4byte 0x03005B68
_08011A3C: .4byte 0x03007630
_08011A40: .4byte 0x030050A0
_08011A44: .4byte 0x000008F5
_08011A48:
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	movs r5, #0x7f
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #6
	beq _08011A90
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #7
	beq _08011A90
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl sub_08011554
_08011A70:
	adds r0, r6, #0
	bl DestroyTask
	b _08011A96
_08011A78:
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
	ldr r0, _08011A88
	ldr r1, _08011A8C
	adds r0, r0, r1
	strb r2, [r0]
	b _08011A96
	.align 2, 0
_08011A88: .4byte 0x030050A0
_08011A8C: .4byte 0x000008F5
_08011A90:
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
_08011A96:
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0xf0
	ble _08011AAE
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl sub_08011554
	adds r0, r6, #0
	bl DestroyTask
_08011AAE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080119E0

	thumb_func_start sub_08011AB4
sub_08011AB4: @ 0x08011AB4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08011AEC
	adds r0, #0xf1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08011AF0
	movs r1, #3
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08011AF4
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r6, #0
	bl StringCopy
	strh r5, [r4, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011AEC: .4byte 0x030050A0
_08011AF0: .4byte 0x080119E1
_08011AF4: .4byte 0x03005B68
	thumb_func_end sub_08011AB4

	thumb_func_start sub_08011AF8
sub_08011AF8: @ 0x08011AF8
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	bl sub_0800F29C
	ldrb r1, [r0, #0xa]
	movs r2, #0x7f
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x45
	bne _08011B1E
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x45
	beq _08011B7E
_08011B1A:
	movs r0, #1
	b _08011B80
_08011B1E:
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08011B1A
	cmp r5, #0x44
	bne _08011B7E
	ldr r5, _08011B4C
	ldrh r0, [r5, #8]
	ldr r3, _08011B50
	adds r2, r3, #0
	ands r2, r0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r2, r0
	bne _08011B54
	ldrh r1, [r4, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r2
	beq _08011B7E
	b _08011B1A
	.align 2, 0
_08011B4C: .4byte 0x030051AA
_08011B50: .4byte 0x000003FF
_08011B54:
	ldrh r1, [r4, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r2
	bne _08011B1A
	ldrb r2, [r4, #0xb]
	movs r0, #0xfe
	ldrb r3, [r5, #0xb]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _08011B1A
	ldrb r2, [r4, #9]
	movs r0, #0xfc
	ldrb r3, [r5, #9]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _08011B1A
_08011B7E:
	movs r0, #0
_08011B80:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08011AF8

	thumb_func_start sub_08011B88
sub_08011B88: @ 0x08011B88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r8, r5
	ldr r6, _08011C40
	adds r0, r6, #0
	adds r0, #0xf1
	ldrb r0, [r0]
	cmp r0, #4
	bne _08011BA6
	adds r0, r5, #0
	bl DestroyTask
_08011BA6:
	ldr r1, _08011C44
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	ble _08011BD0
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl sub_08011554
	adds r0, r5, #0
	bl DestroyTask
_08011BD0:
	ldr r1, _08011C48
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08011C68
	ldr r0, _08011C4C
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _08011C68
	movs r2, #0x86
	lsls r2, r2, #1
	adds r0, r6, r2
	bl sub_080117C4
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08011C50
	adds r0, r6, r2
	bl sub_080117D0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08011C68
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldr r7, _08011C54
	lsls r4, r2, #5
	adds r2, r4, #0
	adds r2, #0x14
	ldr r1, [r7]
	adds r1, r1, r2
	adds r1, #6
	bl sub_08011AF8
	cmp r0, #0
	bne _08011C58
	ldr r0, [r7]
	adds r1, r0, r4
	ldrb r0, [r1, #0x16]
	cmp r0, #0xff
	beq _08011C68
	ldrh r0, [r1, #0x14]
	movs r1, #0x5a
	bl sub_0800BBE8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08011C68
	movs r0, #0xa
	strh r0, [r6, #4]
	adds r0, r5, #0
	bl DestroyTask
	b _08011C68
	.align 2, 0
_08011C40: .4byte 0x030050A0
_08011C44: .4byte 0x03005B60
_08011C48: .4byte 0x00000985
_08011C4C: .4byte 0x030041E0
_08011C50: .4byte 0x00000119
_08011C54: .4byte 0x03007630
_08011C58:
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl sub_08011554
	mov r0, r8
	bl DestroyTask
_08011C68:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08011B88

	thumb_func_start sub_08011C74
sub_08011C74: @ 0x08011C74
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _08011CE4
	ldr r1, _08011CE8
	adds r0, r6, r1
	movs r7, #0
	strb r7, [r0]
	adds r0, r6, #0
	adds r0, #0xf1
	strb r7, [r0]
	ldr r1, _08011CEC
	adds r0, r6, r1
	adds r1, r3, #0
	bl StringCopy
	movs r1, #0x85
	lsls r1, r1, #1
	adds r0, r6, r1
	adds r1, r5, #0
	movs r2, #0xd
	bl memcpy
	bl sub_0800D114
	ldr r0, _08011CF0
	movs r1, #2
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08011CF4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	strh r4, [r1, #0xa]
	ldr r0, _08011CF8
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	cmp r4, #0x45
	bne _08011CFC
	cmp r1, #0xff
	beq _08011D0A
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #1
	strh r1, [r0, #0x16]
	b _08011D0A
	.align 2, 0
_08011CE4: .4byte 0x030050A0
_08011CE8: .4byte 0x00000987
_08011CEC: .4byte 0x00000119
_08011CF0: .4byte 0x08011B89
_08011CF4: .4byte 0x03005B60
_08011CF8: .4byte 0x0800E609
_08011CFC:
	cmp r2, #0xff
	beq _08011D0A
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r7, [r0, #0x16]
_08011D0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08011C74

	thumb_func_start sub_08011D10
sub_08011D10: @ 0x08011D10
	push {lr}
	ldr r0, _08011D20
	adds r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #1
	beq _08011D24
	movs r0, #0
	b _08011D26
	.align 2, 0
_08011D20: .4byte 0x030050A0
_08011D24:
	movs r0, #1
_08011D26:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08011D10

	thumb_func_start sub_08011D2C
sub_08011D2C: @ 0x08011D2C
	push {r4, lr}
	movs r1, #0
	ldr r0, _08011D50
	ldrb r2, [r0]
	ldr r4, _08011D54
	movs r3, #1
_08011D38:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08011D58
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08011D58
	movs r0, #0
	b _08011D60
	.align 2, 0
_08011D50: .4byte 0x030041E0
_08011D54: .4byte 0x03005A29
_08011D58:
	adds r1, #1
	cmp r1, #3
	ble _08011D38
	movs r0, #1
_08011D60:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08011D2C

	thumb_func_start sub_08011D68
sub_08011D68: @ 0x08011D68
	push {r4, lr}
	movs r4, #0
_08011D6C:
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _08011D84
	movs r1, #0
	bl nullsub_13
	adds r4, #1
	cmp r4, #0x13
	ble _08011D6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011D84: .4byte 0x082C05A8
	thumb_func_end sub_08011D68

	thumb_func_start sub_08011D88
sub_08011D88: @ 0x08011D88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x1c
	movs r2, #0x13
	movs r3, #2
	bl nullsub_5
	ldr r4, _08011E58
	ldr r0, [r4]
	ldrb r0, [r0, #2]
	movs r1, #0x14
	movs r2, #1
	movs r3, #1
	bl nullsub_5
	ldr r0, [r4]
	ldrb r0, [r0, #3]
	movs r1, #0x17
	movs r2, #1
	movs r3, #1
	bl nullsub_5
	ldr r0, _08011E5C
	ldrb r0, [r0, #0xc]
	cmp r0, #1
	bne _08011E64
	movs r6, #0
	adds r7, r4, #0
	movs r5, #0x14
_08011DCC:
	ldr r2, [r7]
	ldrb r0, [r2, #7]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08011E0A
	lsls r0, r6, #5
	adds r0, r2, r0
	ldrh r0, [r0, #0x18]
	adds r4, r6, #3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r2, r4, #0
	movs r3, #4
	bl nullsub_5
	ldr r0, [r7]
	adds r0, r0, r5
	adds r0, #6
	movs r1, #6
	adds r2, r4, #0
	bl nullsub_13
	ldr r0, [r7]
	adds r0, r0, r5
	adds r0, #0x15
	movs r1, #0x16
	adds r2, r4, #0
	bl nullsub_13
_08011E0A:
	adds r5, #0x20
	adds r6, #1
	cmp r6, #3
	ble _08011DCC
	movs r6, #0
	ldr r0, _08011E5C
	mov r8, r0
_08011E18:
	movs r5, #0
	adds r7, r6, #1
	lsls r0, r6, #3
	adds r2, r6, #0
	adds r2, #0xb
	subs r0, r0, r6
	lsls r0, r0, #1
	mov r1, r8
	adds r1, #0x14
	adds r4, r0, r1
	lsls r6, r2, #0x18
_08011E2E:
	ldrb r0, [r4]
	lsls r1, r5, #0x19
	lsrs r1, r1, #0x18
	lsrs r2, r6, #0x18
	movs r3, #2
	bl nullsub_5
	adds r4, #1
	adds r5, #1
	cmp r5, #0xd
	ble _08011E2E
	adds r6, r7, #0
	cmp r6, #3
	ble _08011E18
	ldr r0, _08011E60
	movs r1, #1
	movs r2, #0xf
	bl nullsub_13
	b _08011F96
	.align 2, 0
_08011E58: .4byte 0x03007630
_08011E5C: .4byte 0x030050A0
_08011E60: .4byte 0x082C05E4
_08011E64:
	ldr r1, [r4]
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08011F00
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _08011F00
	movs r6, #0
	movs r5, #0xc0
	lsls r5, r5, #0x12
_08011E78:
	lsrs r4, r5, #0x18
	movs r0, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #4
	bl nullsub_5
	ldr r0, _08011EEC
	movs r1, #6
	adds r2, r4, #0
	bl nullsub_13
	ldr r0, _08011EF0
	movs r1, #0x16
	adds r2, r4, #0
	bl nullsub_13
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r5, r5, r1
	adds r6, #1
	cmp r6, #3
	ble _08011E78
	ldr r5, _08011EF4
	ldr r1, [r5]
	ldr r4, _08011EF8
	ldr r0, _08011EFC
	adds r4, r4, r0
	ldrb r0, [r4]
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	movs r1, #1
	movs r2, #3
	movs r3, #4
	bl nullsub_5
	ldrb r1, [r4]
	lsls r1, r1, #5
	adds r1, #0x14
	ldr r0, [r5]
	adds r0, r0, r1
	adds r0, #6
	movs r1, #6
	movs r2, #3
	bl nullsub_13
	ldrb r1, [r4]
	lsls r1, r1, #5
	adds r1, #0x14
	ldr r0, [r5]
	adds r0, r0, r1
	adds r0, #0x15
	movs r1, #0x16
	movs r2, #3
	bl nullsub_13
	b _08011F96
	.align 2, 0
_08011EEC: .4byte 0x082C05C7
_08011EF0: .4byte 0x082C05D7
_08011EF4: .4byte 0x03007630
_08011EF8: .4byte 0x030050A0
_08011EFC: .4byte 0x000008F6
_08011F00:
	movs r6, #0
	ldr r1, _08011FA0
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r6, r0
	bge _08011F5C
	adds r7, r1, #0
	movs r1, #0x14
	mov r8, r1
_08011F12:
	ldr r0, [r7]
	lsls r5, r6, #5
	adds r1, r0, r5
	ldrb r0, [r1, #0x16]
	cmp r0, #0xff
	beq _08011F4E
	ldrh r0, [r1, #0x18]
	adds r4, r6, #3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #1
	adds r2, r4, #0
	movs r3, #4
	bl nullsub_5
	ldr r0, [r7]
	adds r0, r0, r5
	ldrh r0, [r0, #0x14]
	movs r1, #6
	adds r2, r4, #0
	movs r3, #4
	bl nullsub_5
	ldr r0, [r7]
	add r0, r8
	adds r0, #0x15
	movs r1, #0x16
	adds r2, r4, #0
	bl nullsub_13
_08011F4E:
	movs r0, #0x20
	add r8, r0
	adds r6, #1
	ldr r0, [r7]
	ldrb r0, [r0, #8]
	cmp r6, r0
	blt _08011F12
_08011F5C:
	cmp r6, #3
	bgt _08011F96
	lsls r0, r6, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
_08011F68:
	lsrs r4, r5, #0x18
	movs r0, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #4
	bl nullsub_5
	ldr r0, _08011FA4
	movs r1, #6
	adds r2, r4, #0
	bl nullsub_13
	ldr r0, _08011FA8
	movs r1, #0x16
	adds r2, r4, #0
	bl nullsub_13
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r6, #1
	cmp r6, #3
	ble _08011F68
_08011F96:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011FA0: .4byte 0x03007630
_08011FA4: .4byte 0x082C05C7
_08011FA8: .4byte 0x082C05D7
	thumb_func_end sub_08011D88

	thumb_func_start sub_08011FAC
sub_08011FAC: @ 0x08011FAC
	ldr r0, _08011FB8
	ldr r1, _08011FBC
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08011FB8: .4byte 0x030050A0
_08011FBC: .4byte 0x000008D2
	thumb_func_end sub_08011FAC

	thumb_func_start sub_08011FC0
sub_08011FC0: @ 0x08011FC0
	ldr r0, _08011FCC
	ldr r1, _08011FD0
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08011FCC: .4byte 0x030050A0
_08011FD0: .4byte 0x0000069E
	thumb_func_end sub_08011FC0

