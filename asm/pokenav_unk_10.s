.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081CFB00
sub_081CFB00: @ 0x081CFB00
	push {r4, lr}
	movs r0, #0xd
	movs r1, #0x9c
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CFB48
	movs r0, #0x12
	bl GetSubstructPtr
	str r0, [r4, #8]
	cmp r0, #0
	beq _081CFB48
	adds r0, r4, #0
	bl sub_081CFEC4
	adds r1, r4, #0
	adds r1, #0x98
	ldr r0, _081CFB3C
	str r0, [r1]
	ldr r1, _081CFB40
	movs r0, #3
	strh r0, [r1]
	ldr r1, _081CFB44
	movs r0, #0xa
	strh r0, [r1]
	movs r0, #1
	b _081CFB4A
	.align 2, 0
_081CFB3C: .4byte 0x081CFB75
_081CFB40: .4byte 0x0300279C
_081CFB44: .4byte 0x03002350
_081CFB48:
	movs r0, #0
_081CFB4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CFB00

	thumb_func_start sub_081CFB50
sub_081CFB50: @ 0x081CFB50
	push {lr}
	movs r0, #0xd
	bl GetSubstructPtr
	adds r1, r0, #0
	adds r1, #0x98
	ldr r1, [r1]
	bl _call_via_r1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CFB50

	thumb_func_start sub_081CFB68
sub_081CFB68: @ 0x081CFB68
	push {lr}
	movs r0, #0xd
	bl FreePokenavSubstruct
	pop {r0}
	bx r0
	thumb_func_end sub_081CFB68

	thumb_func_start sub_081CFB74
sub_081CFB74: @ 0x081CFB74
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _081CFB90
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081CFB94
	ldr r3, [r4, #8]
	ldrh r0, [r3, #2]
	cmp r0, #0
	beq _081CFB94
	subs r0, #1
	b _081CFBAC
	.align 2, 0
_081CFB90: .4byte 0x03002360
_081CFB94:
	ldrh r1, [r2, #0x30]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081CFBBC
	ldr r3, [r4, #8]
	ldrh r1, [r3, #2]
	ldrh r0, [r3]
	subs r0, #1
	cmp r1, r0
	bge _081CFBBC
	adds r0, r1, #1
_081CFBAC:
	movs r1, #0
	strh r0, [r3, #2]
	strh r1, [r4, #0xc]
	adds r0, r4, #0
	bl sub_081CFEC4
	movs r0, #1
	b _081CFBEE
_081CFBBC:
	ldrh r2, [r2, #0x2e]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _081CFBD8
	adds r1, r4, #0
	adds r1, #0x98
	ldr r0, _081CFBD4
	str r0, [r1]
	movs r0, #2
	b _081CFBEE
	.align 2, 0
_081CFBD4: .4byte 0x081CFBF9
_081CFBD8:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _081CFBE4
	movs r0, #0
	b _081CFBEE
_081CFBE4:
	adds r1, r4, #0
	adds r1, #0x98
	ldr r0, _081CFBF4
	str r0, [r1]
	movs r0, #5
_081CFBEE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CFBF4: .4byte 0x081CFC85
	thumb_func_end sub_081CFB74

	thumb_func_start sub_081CFBF8
sub_081CFBF8: @ 0x081CFBF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081CFC58
	ldrh r1, [r0, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081CFC12
	adds r0, r4, #0
	bl sub_081CFC8C
	cmp r0, #0
	bne _081CFC54
_081CFC12:
	ldr r0, _081CFC58
	ldrh r1, [r0, #0x30]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081CFC28
	adds r0, r4, #0
	bl sub_081CFCCC
	cmp r0, #0
	bne _081CFC54
_081CFC28:
	ldr r0, _081CFC58
	ldrh r1, [r0, #0x30]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081CFC3E
	adds r0, r4, #0
	bl sub_081CFD14
	cmp r0, #0
	bne _081CFC54
_081CFC3E:
	ldr r0, _081CFC58
	ldrh r1, [r0, #0x30]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081CFC5C
	adds r0, r4, #0
	bl sub_081CFD38
	cmp r0, #0
	beq _081CFC5C
_081CFC54:
	movs r0, #3
	b _081CFC7A
	.align 2, 0
_081CFC58: .4byte 0x03002360
_081CFC5C:
	ldr r0, _081CFC6C
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081CFC70
	movs r0, #0
	b _081CFC7A
	.align 2, 0
_081CFC6C: .4byte 0x03002360
_081CFC70:
	adds r1, r4, #0
	adds r1, #0x98
	ldr r0, _081CFC80
	str r0, [r1]
	movs r0, #4
_081CFC7A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CFC80: .4byte 0x081CFB75
	thumb_func_end sub_081CFBF8

	thumb_func_start sub_081CFC84
sub_081CFC84: @ 0x081CFC84
	ldr r0, _081CFC88
	bx lr
	.align 2, 0
_081CFC88: .4byte 0x000186AE
	thumb_func_end sub_081CFC84

	thumb_func_start sub_081CFC8C
sub_081CFC8C: @ 0x081CFC8C
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0xc]
	adds r2, r0, #0
	cmp r2, #0x18
	bhi _081CFCA0
	cmp r2, #8
	bls _081CFCC2
	subs r0, #9
	b _081CFCBC
_081CFCA0:
	ldrh r3, [r1, #0x10]
	adds r2, r3, #0
	cmp r2, #0
	beq _081CFCC2
	ldrh r0, [r1, #0xc]
	subs r0, #0x1b
	ldrh r4, [r1, #0xe]
	adds r0, r0, r4
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r2
	blo _081CFCBE
	subs r0, r3, #1
_081CFCBC:
	strh r0, [r1, #0xc]
_081CFCBE:
	movs r0, #1
	b _081CFCC4
_081CFCC2:
	movs r0, #0
_081CFCC4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CFC8C

	thumb_func_start sub_081CFCCC
sub_081CFCCC: @ 0x081CFCCC
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0xc]
	adds r1, r0, #0
	cmp r1, #0x18
	bhi _081CFD0C
	ldrh r3, [r2, #0xe]
	cmp r1, r3
	bhs _081CFCF0
	adds r0, #9
	strh r0, [r2, #0xc]
	ldrh r1, [r2, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	blo _081CFD08
	subs r0, r1, #1
	b _081CFD06
_081CFCF0:
	ldrh r0, [r2, #0x12]
	cmp r0, #0
	beq _081CFD0C
	ldrh r1, [r2, #0xc]
	ldrh r0, [r2, #0xe]
	subs r0, r1, r0
	ldrh r1, [r2, #0x12]
	cmp r0, r1
	blt _081CFD04
	subs r0, r1, #1
_081CFD04:
	adds r0, #0x1b
_081CFD06:
	strh r0, [r2, #0xc]
_081CFD08:
	movs r0, #1
	b _081CFD0E
_081CFD0C:
	movs r0, #0
_081CFD0E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CFCCC

	thumb_func_start sub_081CFD14
sub_081CFD14: @ 0x081CFD14
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r4, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #9
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081CFD2C
	movs r0, #0
	b _081CFD32
_081CFD2C:
	subs r0, r4, #1
	strh r0, [r5, #0xc]
	movs r0, #1
_081CFD32:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CFD14

	thumb_func_start sub_081CFD38
sub_081CFD38: @ 0x081CFD38
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r4, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #9
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #7
	bgt _081CFD6C
	cmp r4, #0x1a
	bhi _081CFD5C
	ldrh r0, [r5, #0x10]
	subs r0, #1
	cmp r4, r0
	bge _081CFD6C
	b _081CFD64
_081CFD5C:
	ldrh r0, [r5, #0x12]
	subs r0, #1
	cmp r1, r0
	bge _081CFD6C
_081CFD64:
	adds r0, r4, #1
	strh r0, [r5, #0xc]
	movs r0, #1
	b _081CFD6E
_081CFD6C:
	movs r0, #0
_081CFD6E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CFD38

	thumb_func_start sub_081CFD74
sub_081CFD74: @ 0x081CFD74
	push {lr}
	movs r0, #0xd
	bl GetSubstructPtr
	ldr r0, [r0, #8]
	ldrh r0, [r0, #2]
	pop {r1}
	bx r1
	thumb_func_end sub_081CFD74

	thumb_func_start sub_081CFD84
sub_081CFD84: @ 0x081CFD84
	push {lr}
	movs r0, #0xd
	bl GetSubstructPtr
	ldr r0, [r0, #8]
	ldrh r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end sub_081CFD84

	thumb_func_start GetCurrMonInfo1
GetCurrMonInfo1: @ 0x081CFD94
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r0, #0xd
	bl GetSubstructPtr
	ldr r1, [r0, #8]
	ldrh r0, [r1, #2]
	lsls r0, r0, #2
	adds r0, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xe
	bne _081CFDE0
	ldrb r1, [r1, #1]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _081CFDDC
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	bl GetMonData
	adds r0, r4, #0
	bl GetLevelFromMonExp
	strb r0, [r7]
	adds r0, r4, #0
	bl GetMonGender
	strb r0, [r6]
	b _081CFE02
	.align 2, 0
_081CFDDC: .4byte 0x02024190
_081CFDE0:
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl GetBoxedMonPtr
	adds r4, r0, #0
	bl GetBoxMonGender
	strb r0, [r6]
	adds r0, r4, #0
	bl GetLevelFromBoxMonExp
	strb r0, [r7]
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	bl GetBoxMonData
_081CFE02:
	adds r0, r5, #0
	bl StringGetEnd10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetCurrMonInfo1

	thumb_func_start GetCurrMonInfo2
GetCurrMonInfo2: @ 0x081CFE10
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r0, #0xd
	bl GetSubstructPtr
	ldr r1, [r0, #8]
	ldrh r0, [r1, #2]
	lsls r0, r0, #2
	adds r0, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xe
	bne _081CFE5C
	ldrb r1, [r1, #1]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _081CFE58
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [r6]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	b _081CFE80
	.align 2, 0
_081CFE58: .4byte 0x02024190
_081CFE5C:
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl GetBoxedMonPtr
	adds r4, r0, #0
	movs r1, #0xb
	bl GetBoxMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0
	bl GetBoxMonData
	str r0, [r6]
	adds r0, r4, #0
	movs r1, #1
	bl GetBoxMonData
_081CFE80:
	str r0, [r7]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end GetCurrMonInfo2

	thumb_func_start GetCurrMonRibbonCount
GetCurrMonRibbonCount: @ 0x081CFE88
	push {lr}
	movs r0, #0xd
	bl GetSubstructPtr
	ldr r1, [r0, #8]
	ldrh r0, [r1, #2]
	lsls r0, r0, #2
	adds r0, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xe
	beq _081CFEAA
	ldrb r1, [r1, #1]
	movs r2, #0x52
	bl GetBoxMonDataAt
	b _081CFEBA
_081CFEAA:
	ldrb r1, [r1, #1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081CFEC0
	adds r0, r0, r1
	movs r1, #0x52
	bl GetMonData
_081CFEBA:
	pop {r1}
	bx r1
	.align 2, 0
_081CFEC0: .4byte 0x02024190
	thumb_func_end GetCurrMonRibbonCount

	thumb_func_start sub_081CFEC4
sub_081CFEC4: @ 0x081CFEC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrh r1, [r0, #2]
	lsls r1, r1, #2
	adds r1, #4
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xe
	bne _081CFEF8
	ldrb r1, [r1, #1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081CFEF4
	adds r0, r0, r1
	movs r1, #0x53
	bl GetMonData
	b _081CFF02
	.align 2, 0
_081CFEF4: .4byte 0x02024190
_081CFEF8:
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	movs r2, #0x53
	bl GetBoxMonDataAt
_081CFF02:
	mov ip, r0
	movs r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	movs r6, #0
	ldr r0, _081CFF58
	mov sb, r0
	mov sl, sb
_081CFF12:
	lsls r2, r6, #2
	mov r3, sb
	adds r1, r2, r3
	movs r0, #1
	ldrb r3, [r1]
	lsls r0, r3
	subs r4, r0, #1
	mov r0, ip
	ands r4, r0
	ldrb r0, [r1, #3]
	adds r7, r2, #0
	cmp r0, #0
	bne _081CFF5C
	movs r3, #0
	adds r6, #1
	mov r8, r6
	cmp r3, r4
	bge _081CFF86
	adds r6, r5, #0
	adds r6, #0x14
	mov r1, sl
	adds r0, r7, r1
	ldrb r2, [r0, #2]
_081CFF40:
	ldrh r0, [r5, #0x10]
	adds r1, r0, #1
	strh r1, [r5, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r6, r0
	adds r1, r2, r3
	str r1, [r0]
	adds r3, #1
	cmp r3, r4
	blt _081CFF40
	b _081CFF86
	.align 2, 0
_081CFF58: .4byte 0x085F5E14
_081CFF5C:
	movs r3, #0
	adds r6, #1
	mov r8, r6
	cmp r3, r4
	bge _081CFF86
	adds r6, r5, #0
	adds r6, #0x78
	mov r1, sl
	adds r0, r7, r1
	ldrb r2, [r0, #2]
_081CFF70:
	ldrh r0, [r5, #0x12]
	adds r1, r0, #1
	strh r1, [r5, #0x12]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r6, r0
	adds r1, r2, r3
	str r1, [r0]
	adds r3, #1
	cmp r3, r4
	blt _081CFF70
_081CFF86:
	mov r3, sb
	adds r0, r7, r3
	mov r1, ip
	ldrb r0, [r0]
	lsrs r1, r0
	mov ip, r1
	mov r6, r8
	cmp r6, #0x10
	bls _081CFF12
	ldrh r0, [r5, #0x10]
	cmp r0, #0
	beq _081CFFB0
	subs r0, #1
	movs r1, #9
	bl __divsi3
	lsls r1, r0, #3
	adds r1, r1, r0
	movs r0, #0
	strh r1, [r5, #0xe]
	b _081CFFB4
_081CFFB0:
	strh r0, [r5, #0xe]
	movs r0, #0x1b
_081CFFB4:
	strh r0, [r5, #0xc]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081CFEC4

	thumb_func_start sub_081CFFC4
sub_081CFFC4: @ 0x081CFFC4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd
	bl GetSubstructPtr
	ldrh r1, [r0, #0x10]
	str r1, [r4]
	adds r0, #0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CFFC4

	thumb_func_start sub_081CFFDC
sub_081CFFDC: @ 0x081CFFDC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd
	bl GetSubstructPtr
	ldrh r1, [r0, #0x12]
	str r1, [r4]
	adds r0, #0x78
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CFFDC

	thumb_func_start sub_081CFFF4
sub_081CFFF4: @ 0x081CFFF4
	push {lr}
	movs r0, #0xd
	bl GetSubstructPtr
	ldrh r0, [r0, #0xc]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CFFF4

	thumb_func_start sub_081D0004
sub_081D0004: @ 0x081D0004
	push {lr}
	movs r0, #0xd
	bl GetSubstructPtr
	adds r1, r0, #0
	ldrh r0, [r1, #0xc]
	cmp r0, #0x18
	ble _081D001C
	subs r0, #0x1b
	lsls r0, r0, #2
	adds r1, #0x78
	b _081D0020
_081D001C:
	lsls r0, r0, #2
	adds r1, #0x14
_081D0020:
	adds r1, r1, r0
	ldr r0, [r1]
	pop {r1}
	bx r1
	thumb_func_end sub_081D0004

	thumb_func_start sub_081D0028
sub_081D0028: @ 0x081D0028
	push {r4, lr}
	ldr r1, _081D004C
	movs r0, #0xe
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081D0058
	ldr r0, _081D0050
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	ldr r0, _081D0054
	str r0, [r4]
	movs r0, #1
	b _081D005A
	.align 2, 0
_081D004C: .4byte 0x0000101C
_081D0050: .4byte 0x081D011D
_081D0054: .4byte 0x081D0109
_081D0058:
	movs r0, #0
_081D005A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081D0028

	thumb_func_start sub_081D0060
sub_081D0060: @ 0x081D0060
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xe
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, _081D0088
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r5, #4]
	ldr r0, _081D008C
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D0088: .4byte 0x085F721C
_081D008C: .4byte 0x081D0109
	thumb_func_end sub_081D0060

	thumb_func_start sub_081D0090
sub_081D0090: @ 0x081D0090
	push {lr}
	movs r0, #0xe
	bl GetSubstructPtr
	ldr r0, [r0]
	bl _call_via_r0
	pop {r1}
	thumb_func_end sub_081D0090

	thumb_func_start sub_081D00A0
sub_081D00A0: @ 0x081D00A0
	bx r1
	.align 2, 0
	thumb_func_end sub_081D00A0

	thumb_func_start sub_081D00A4
sub_081D00A4: @ 0x081D00A4
	push {r4, lr}
	movs r0, #0xe
	bl GetSubstructPtr
	adds r4, r0, #0
	ldrb r0, [r4, #0xa]
	bl RemoveWindow
	ldrb r0, [r4, #8]
	bl RemoveWindow
	ldrb r0, [r4, #0xc]
	bl RemoveWindow
	ldrb r0, [r4, #0xe]
	bl RemoveWindow
	adds r0, r4, #0
	bl sub_081D0894
	movs r0, #9
	bl FreeSpriteTilesByTag
	movs r0, #0xf
	bl FreeSpritePaletteByTag
	movs r0, #0x10
	bl FreeSpritePaletteByTag
	movs r0, #0x11
	bl FreeSpritePaletteByTag
	movs r0, #0x12
	bl FreeSpritePaletteByTag
	movs r0, #0x13
	bl FreeSpritePaletteByTag
	ldr r0, [r4, #0x14]
	bl FreeSpriteOamMatrix
	ldr r0, [r4, #0x14]
	bl DestroySprite
	movs r0, #0xe
	bl FreePokenavSubstruct
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081D00A4

	thumb_func_start sub_081D0108
sub_081D0108: @ 0x081D0108
	push {lr}
	movs r0, #0xe
	bl GetSubstructPtr
	ldr r0, [r0, #4]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081D0108

	thumb_func_start sub_081D011C
sub_081D011C: @ 0x081D011C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0xe
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #9
	bls _081D0130
	b _081D02F8
_081D0130:
	lsls r0, r4, #2
	ldr r1, _081D013C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081D013C: .4byte 0x081D0140
_081D0140: @ jump table
	.4byte _081D0168 @ case 0
	.4byte _081D01B4 @ case 1
	.4byte _081D0224 @ case 2
	.4byte _081D0238 @ case 3
	.4byte _081D024C @ case 4
	.4byte _081D0260 @ case 5
	.4byte _081D0274 @ case 6
	.4byte _081D0288 @ case 7
	.4byte _081D0298 @ case 8
	.4byte _081D02EC @ case 9
_081D0168:
	ldr r0, _081D01A4
	movs r1, #2
	bl InitBgTemplates
	ldr r1, _081D01A8
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	adds r1, r5, #0
	adds r1, #0x1c
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, _081D01AC
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r0, _081D01B0
	movs r1, #0x10
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	b _081D026A
	.align 2, 0
_081D01A4: .4byte 0x085F7214
_081D01A8: .4byte 0x085F64AC
_081D01AC: .4byte 0x085F65A8
_081D01B0: .4byte 0x085F648C
_081D01B4:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _081D01C2
	b _081D02F4
_081D01C2:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_08199A88
	ldr r1, _081D0214
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #1
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _081D0218
	adds r1, r5, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	ldr r0, _081D021C
	movs r1, #0x20
	movs r2, #0xa0
	bl CopyPaletteIntoBufferUnfaded
	ldr r0, _081D0220
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	movs r0, #1
	b _081D026C
	.align 2, 0
_081D0214: .4byte 0x085F6734
_081D0218: .4byte 0x0000081C
_081D021C: .4byte 0x085F6674
_081D0220: .4byte 0x085F6714
_081D0224:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D02F4
	adds r0, r5, #0
	bl sub_081D0510
	movs r0, #0
	b _081D02FA
_081D0238:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D02F4
	adds r0, r5, #0
	bl sub_081D067C
	movs r0, #0
	b _081D02FA
_081D024C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D02F4
	adds r0, r5, #0
	bl sub_081D076C
	movs r0, #0
	b _081D02FA
_081D0260:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D02F4
_081D026A:
	movs r0, #2
_081D026C:
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	b _081D02FA
_081D0274:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D02F4
	adds r0, r5, #0
	bl sub_081D0864
	movs r0, #1
	b _081D02FA
_081D0288:
	adds r0, r5, #0
	bl sub_081D09F4
	movs r0, #0xa
	bl sub_081C7364
	movs r0, #0
	b _081D02FA
_081D0298:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D02F4
	adds r0, r5, #0
	bl sub_081D0B18
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl HideBg
	movs r0, #1
	bl sub_081C7280
	movs r0, #0
	b _081D02FA
_081D02EC:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	beq _081D02F8
_081D02F4:
	movs r0, #2
	b _081D02FA
_081D02F8:
	movs r0, #4
_081D02FA:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081D011C

	thumb_func_start sub_081D0304
sub_081D0304: @ 0x081D0304
	push {lr}
	cmp r0, #0
	beq _081D0310
	cmp r0, #1
	beq _081D0320
	b _081D032C
_081D0310:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_081C7280
	movs r0, #0
	b _081D032E
_081D0320:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	beq _081D032C
	movs r0, #2
	b _081D032E
_081D032C:
	movs r0, #4
_081D032E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081D0304

	thumb_func_start sub_081D0334
sub_081D0334: @ 0x081D0334
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xe
	bl GetSubstructPtr
	adds r4, r0, #0
	cmp r5, #6
	bhi _081D03D4
	lsls r0, r5, #2
	ldr r1, _081D0350
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081D0350: .4byte 0x081D0354
_081D0354: @ jump table
	.4byte _081D0370 @ case 0
	.4byte _081D0380 @ case 1
	.4byte _081D0394 @ case 2
	.4byte _081D039E @ case 3
	.4byte _081D03A8 @ case 4
	.4byte _081D03B2 @ case 5
	.4byte _081D03C6 @ case 6
_081D0370:
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081D08F4
	movs r0, #0
	b _081D03D6
_081D0380:
	adds r0, r4, #0
	bl sub_081D0950
	cmp r0, #0
	bne _081D03D0
	adds r0, r4, #0
	bl sub_081D06A0
	movs r0, #1
	b _081D03D6
_081D0394:
	adds r0, r4, #0
	bl sub_081D09F4
	movs r0, #1
	b _081D03D6
_081D039E:
	adds r0, r4, #0
	bl sub_081D081C
	movs r0, #1
	b _081D03D6
_081D03A8:
	adds r0, r4, #0
	bl sub_081D0534
	movs r0, #1
	b _081D03D6
_081D03B2:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D03D0
	adds r0, r4, #0
	bl sub_081D0918
	movs r0, #0
	b _081D03D6
_081D03C6:
	adds r0, r4, #0
	bl sub_081D0950
	cmp r0, #0
	beq _081D03D4
_081D03D0:
	movs r0, #2
	b _081D03D6
_081D03D4:
	movs r0, #4
_081D03D6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081D0334

	thumb_func_start sub_081D03DC
sub_081D03DC: @ 0x081D03DC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xe
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081D040C
	cmp r4, #1
	bgt _081D03F6
	cmp r4, #0
	beq _081D03FC
	b _081D0434
_081D03F6:
	cmp r4, #2
	beq _081D0426
	b _081D0434
_081D03FC:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081D0B64
	movs r0, #0
	b _081D0436
_081D040C:
	adds r0, r5, #0
	bl sub_081D0C40
	cmp r0, #0
	bne _081D0430
	adds r0, r5, #0
	bl sub_081D05AC
	movs r0, #0xb
	bl sub_081C7364
	movs r0, #0
	b _081D0436
_081D0426:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D0434
_081D0430:
	movs r0, #2
	b _081D0436
_081D0434:
	movs r0, #4
_081D0436:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081D03DC

	thumb_func_start sub_081D043C
sub_081D043C: @ 0x081D043C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xe
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081D0470
	cmp r4, #1
	bgt _081D0456
	cmp r4, #0
	beq _081D0460
	b _081D04A6
_081D0456:
	cmp r4, #2
	beq _081D0484
	cmp r4, #3
	beq _081D0498
	b _081D04A6
_081D0460:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081D0C1C
	movs r0, #0
	b _081D04A8
_081D0470:
	adds r0, r5, #0
	bl sub_081D0C40
	cmp r0, #0
	bne _081D04A2
	adds r0, r5, #0
	bl sub_081D0B64
	movs r0, #0
	b _081D04A8
_081D0484:
	adds r0, r5, #0
	bl sub_081D0C40
	cmp r0, #0
	bne _081D04A2
	adds r0, r5, #0
	bl sub_081D05AC
	movs r0, #0
	b _081D04A8
_081D0498:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D04A6
_081D04A2:
	movs r0, #2
	b _081D04A8
_081D04A6:
	movs r0, #4
_081D04A8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081D043C

	thumb_func_start sub_081D04B0
sub_081D04B0: @ 0x081D04B0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xe
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081D04E0
	cmp r4, #1
	bgt _081D04CA
	cmp r4, #0
	beq _081D04D0
	b _081D0508
_081D04CA:
	cmp r4, #2
	beq _081D04FA
	b _081D0508
_081D04D0:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081D0C1C
	movs r0, #0
	b _081D050A
_081D04E0:
	adds r0, r5, #0
	bl sub_081D0C40
	cmp r0, #0
	bne _081D0504
	adds r0, r5, #0
	bl sub_081D0534
	movs r0, #0xa
	bl sub_081C7364
	movs r0, #0
	b _081D050A
_081D04FA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D0508
_081D0504:
	movs r0, #2
	b _081D050A
_081D0508:
	movs r0, #4
_081D050A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081D04B0

	thumb_func_start sub_081D0510
sub_081D0510: @ 0x081D0510
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081D0530
	bl AddWindow
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	adds r0, r4, #0
	bl sub_081D0534
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D0530: .4byte 0x085F7234
	thumb_func_end sub_081D0510

	thumb_func_start sub_081D0534
sub_081D0534: @ 0x081D0534
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _081D059C
	add r0, sp, #0xc
	movs r2, #3
	bl memcpy
	ldr r4, _081D05A0
	bl GetCurrMonRibbonCount
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, #0
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r4, _081D05A4
	ldr r1, _081D05A8
	adds r0, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldrb r0, [r5, #0xa]
	movs r1, #0x44
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0xa]
	add r1, sp, #0xc
	str r1, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	ldrb r0, [r5, #0xa]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D059C: .4byte 0x085F723C
_081D05A0: .4byte 0x02021C40
_081D05A4: .4byte 0x02021C7C
_081D05A8: .4byte 0x085CB821
	thumb_func_end sub_081D0534

	thumb_func_start sub_081D05AC
sub_081D05AC: @ 0x081D05AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl sub_081D0004
	adds r5, r0, #0
	ldr r1, _081D0608
	add r0, sp, #0xc
	movs r2, #3
	bl memcpy
	ldrb r0, [r7, #0xa]
	movs r1, #0x44
	bl FillWindowPixelBuffer
	cmp r5, #0x18
	bhi _081D0610
	lsls r1, r5, #3
	ldr r0, _081D060C
	adds r6, r1, r0
	movs r5, #0x80
	lsls r5, r5, #0x12
	movs r4, #1
_081D05DE:
	ldrb r0, [r7, #0xa]
	lsrs r3, r5, #0x18
	add r1, sp, #0xc
	str r1, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #4]
	ldm r6!, {r1}
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	bl AddTextPrinterParameterized3
	movs r0, #0x80
	lsls r0, r0, #0x15
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _081D05DE
	b _081D065A
	.align 2, 0
_081D0608: .4byte 0x085F723C
_081D060C: .4byte 0x085F5F60
_081D0610:
	ldr r0, _081D0670
	ldr r0, [r0]
	adds r0, r0, r5
	ldr r1, _081D0674
	adds r0, r0, r1
	ldrb r5, [r0]
	cmp r5, #0
	beq _081D0662
	subs r5, #1
	movs r4, #0
	ldr r0, _081D0678
	mov r8, r0
	movs r6, #0x80
	lsls r6, r6, #0x12
_081D062C:
	ldrb r0, [r7, #0xa]
	lsrs r3, r6, #0x18
	add r1, sp, #0xc
	str r1, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #4]
	lsls r1, r4, #2
	lsls r2, r5, #3
	adds r1, r1, r2
	add r1, r8
	ldr r1, [r1]
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	bl AddTextPrinterParameterized3
	movs r0, #0x80
	lsls r0, r0, #0x15
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #1
	ble _081D062C
_081D065A:
	ldrb r0, [r7, #0xa]
	movs r1, #2
	bl CopyWindowToVram
_081D0662:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D0670: .4byte 0x03005AEC
_081D0674: .4byte 0x0000318F
_081D0678: .4byte 0x085F628C
	thumb_func_end sub_081D05AC

	thumb_func_start sub_081D067C
sub_081D067C: @ 0x081D067C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081D069C
	bl AddWindow
	strh r0, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	adds r0, r4, #0
	bl sub_081D06A0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D069C: .4byte 0x085F7240
	thumb_func_end sub_081D067C

	thumb_func_start sub_081D06A0
sub_081D06A0: @ 0x081D06A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r4, _081D070C
	movs r0, #0xd
	add r0, sp
	mov r8, r0
	adds r0, r4, #0
	add r1, sp, #0xc
	mov r2, r8
	bl GetCurrMonInfo1
	ldr r6, _081D0710
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #5
	bl StringCopyPadded
	add r0, sp, #0xc
	ldrb r1, [r0]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r5, _081D0714
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #3
	bl StringCopyPadded
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, #0
	adds r1, r6, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #1
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	beq _081D071C
	cmp r0, #0xfe
	beq _081D0724
	ldr r1, _081D0718
	b _081D0726
	.align 2, 0
_081D070C: .4byte 0x02021C68
_081D0710: .4byte 0x02021C40
_081D0714: .4byte 0x02021C54
_081D0718: .4byte 0x085CB7FE
_081D071C:
	ldr r1, _081D0720
	b _081D0726
	.align 2, 0
_081D0720: .4byte 0x085CB7D6
_081D0724:
	ldr r1, _081D0764
_081D0726:
	ldr r4, _081D0768
	adds r0, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldrb r0, [r7, #8]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r7, #8]
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrb r0, [r7, #8]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D0764: .4byte 0x085CB7EA
_081D0768: .4byte 0x02021C7C
	thumb_func_end sub_081D06A0

	thumb_func_start sub_081D076C
sub_081D076C: @ 0x081D076C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _081D07B4
	adds r0, r4, #0
	bl AddWindow
	strh r0, [r5, #0xc]
	adds r4, #8
	adds r0, r4, #0
	bl AddWindow
	strh r0, [r5, #0xe]
	ldrb r0, [r5, #0xc]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0xe]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0xc]
	bl PutWindowTilemap
	ldrb r0, [r5, #0xe]
	bl PutWindowTilemap
	ldrh r0, [r5, #0xe]
	bl sub_081D07B8
	adds r0, r5, #0
	bl sub_081D081C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D07B4: .4byte 0x085F7248
	thumb_func_end sub_081D076C

	thumb_func_start sub_081D07B8
sub_081D07B8: @ 0x081D07B8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r6, _081D0818
	movs r0, #0
	mov r8, r0
	movs r0, #0xba
	strb r0, [r6]
	adds r5, r6, #1
	bl sub_081CFD84
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r6, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D0818: .4byte 0x02021C40
	thumb_func_end sub_081D07B8

	thumb_func_start sub_081D081C
sub_081D081C: @ 0x081D081C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl sub_081CFD74
	adds r1, r0, #0
	adds r1, #1
	ldr r4, _081D0860
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldrb r0, [r5, #0xc]
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrb r0, [r5, #0xc]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D0860: .4byte 0x02021C40
	thumb_func_end sub_081D081C

	thumb_func_start sub_081D0864
sub_081D0864: @ 0x081D0864
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r0, sp
	bl GetCurrMonInfo2
	bl ResetAllPicSprites
	movs r0, #0x28
	movs r1, #0x68
	bl sub_081D08A0
	strh r0, [r4, #0x10]
	movs r0, #0xf
	movs r1, #0
	bl sub_081C7150
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D0864

	thumb_func_start sub_081D0894
sub_081D0894: @ 0x081D0894
	push {lr}
	ldrh r0, [r0, #0x10]
	bl FreeAndDestroyMonPicSprite
	pop {r0}
	bx r0
	thumb_func_end sub_081D0894

	thumb_func_start sub_081D08A0
sub_081D08A0: @ 0x081D08A0
	push {lr}
	sub sp, #0x1c
	add r1, sp, #0x14
	add r2, sp, #0x18
	add r0, sp, #0x10
	bl GetCurrMonInfo2
	add r0, sp, #0x10
	ldrh r0, [r0]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	movs r3, #0x28
	str r3, [sp]
	movs r3, #0x68
	str r3, [sp, #4]
	movs r3, #0xf
	str r3, [sp, #8]
	ldr r3, _081D08EC
	str r3, [sp, #0xc]
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _081D08F0
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r3, [r2, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	strb r1, [r2, #5]
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_081D08EC: .4byte 0x0000FFFF
_081D08F0: .4byte 0x020205AC
	thumb_func_end sub_081D08A0

	thumb_func_start sub_081D08F4
sub_081D08F4: @ 0x081D08F4
	push {lr}
	ldrh r1, [r0, #0x10]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081D0914
	adds r0, r0, r1
	movs r2, #0x20
	rsbs r2, r2, #0
	movs r1, #0x28
	movs r3, #6
	bl sub_081D0974
	pop {r0}
	bx r0
	.align 2, 0
_081D0914: .4byte 0x020205AC
	thumb_func_end sub_081D08F4

	thumb_func_start sub_081D0918
sub_081D0918: @ 0x081D0918
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	bl FreeAndDestroyMonPicSprite
	movs r5, #0x20
	rsbs r5, r5, #0
	adds r0, r5, #0
	movs r1, #0x68
	bl sub_081D08A0
	strh r0, [r4, #0x10]
	ldrh r1, [r4, #0x10]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081D094C
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0x28
	movs r3, #6
	bl sub_081D0974
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D094C: .4byte 0x020205AC
	thumb_func_end sub_081D0918

	thumb_func_start sub_081D0950
sub_081D0950: @ 0x081D0950
	ldr r2, _081D096C
	ldrh r1, [r0, #0x10]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081D0970
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_081D096C: .4byte 0x020205AC
_081D0970: .4byte 0x08007141
	thumb_func_end sub_081D0950

	thumb_func_start sub_081D0974
sub_081D0974: @ 0x081D0974
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r2, #0
	adds r5, r3, #0
	subs r0, r6, r1
	strh r1, [r4, #0x20]
	lsls r1, r1, #4
	strh r1, [r4, #0x2e]
	lsls r0, r0, #4
	adds r1, r5, #0
	bl __udivsi3
	strh r0, [r4, #0x30]
	strh r5, [r4, #0x32]
	strh r6, [r4, #0x34]
	ldr r0, _081D099C
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D099C: .4byte 0x081D09A1
	thumb_func_end sub_081D0974

	thumb_func_start sub_081D09A0
sub_081D09A0: @ 0x081D09A0
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x32]
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _081D09E4
	subs r0, r1, #1
	strh r0, [r2, #0x32]
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x2e]
	adds r0, r0, r1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #0x20]
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _081D09D6
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _081D09EC
_081D09D6:
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _081D09EC
_081D09E4:
	ldrh r0, [r2, #0x34]
	strh r0, [r2, #0x20]
	ldr r0, _081D09F0
	str r0, [r2, #0x1c]
_081D09EC:
	pop {r0}
	bx r0
	.align 2, 0
_081D09F0: .4byte 0x08007141
	thumb_func_end sub_081D09A0

	thumb_func_start sub_081D09F4
sub_081D09F4: @ 0x081D09F4
	push {r4, r5, r6, lr}
	bl sub_081D0A6C
	ldr r5, _081D0A64
	adds r0, r5, #0
	bl sub_081CFFC4
	adds r6, r0, #0
	ldr r2, _081D0A68
	movs r1, #0
	str r1, [r2]
	ldr r0, [r5]
	cmp r1, r0
	bhs _081D0A26
	adds r4, r2, #0
_081D0A12:
	ldr r0, [r4]
	ldm r6!, {r1}
	bl sub_081D0A8C
	ldr r1, [r4]
	adds r1, #1
	str r1, [r4]
	ldr r0, [r5]
	cmp r1, r0
	blo _081D0A12
_081D0A26:
	ldr r4, _081D0A64
	adds r0, r4, #0
	bl sub_081CFFDC
	adds r6, r0, #0
	ldr r2, _081D0A68
	movs r1, #0
	str r1, [r2]
	ldr r0, [r4]
	cmp r1, r0
	bhs _081D0A56
	adds r4, r2, #0
_081D0A3E:
	ldr r0, [r4]
	adds r0, #0x1b
	ldm r6!, {r1}
	bl sub_081D0A8C
	ldr r1, [r4]
	adds r1, #1
	str r1, [r4]
	ldr r0, _081D0A64
	ldr r0, [r0]
	cmp r1, r0
	blo _081D0A3E
_081D0A56:
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D0A64: .4byte 0x030012B4
_081D0A68: .4byte 0x030012B8
	thumb_func_end sub_081D09F4

	thumb_func_start sub_081D0A6C
sub_081D0A6C: @ 0x081D0A6C
	push {lr}
	sub sp, #8
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D0A6C

	thumb_func_start sub_081D0A8C
sub_081D0A8C: @ 0x081D0A8C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	movs r1, #9
	bl __umodsi3
	adds r5, r0, #0
	lsls r5, r5, #1
	adds r5, #0xb
	adds r0, r4, #0
	movs r1, #9
	bl __udivsi3
	adds r4, r0, #0
	lsls r4, r4, #1
	adds r4, #4
	add r0, sp, #8
	adds r1, r6, #0
	bl sub_081D0AD8
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	add r1, sp, #8
	adds r2, r5, #0
	adds r3, r4, #0
	bl CopyToBgTilemapBufferRect
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081D0A8C

	thumb_func_start sub_081D0AD8
sub_081D0AD8: @ 0x081D0AD8
	push {r4, r5, lr}
	ldr r2, _081D0B14
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r3, [r1, #2]
	adds r3, #2
	lsls r3, r3, #0x10
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsrs r3, r3, #4
	adds r2, r1, #0
	orrs r2, r3
	strh r2, [r0]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r4, r5, #0
	orrs r2, r4
	strh r2, [r0, #2]
	adds r1, #1
	orrs r1, r3
	strh r1, [r0, #4]
	orrs r1, r4
	strh r1, [r0, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D0B14: .4byte 0x085F7258
	thumb_func_end sub_081D0AD8

	thumb_func_start sub_081D0B18
sub_081D0B18: @ 0x081D0B18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081D0B54
	bl LoadCompressedSpriteSheet
	ldr r0, _081D0B58
	bl Pokenav_AllocAndLoadPalettes
	ldr r0, _081D0B5C
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081D0B60
	adds r1, r1, r0
	str r1, [r4, #0x14]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D0B54: .4byte 0x085F72D8
_081D0B58: .4byte 0x085F72E0
_081D0B5C: .4byte 0x085F7364
_081D0B60: .4byte 0x020205AC
	thumb_func_end sub_081D0B18

	thumb_func_start sub_081D0B64
sub_081D0B64: @ 0x081D0B64
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	bl sub_081CFFF4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #9
	bl __modsi3
	adds r5, r0, #0
	lsls r5, r5, #4
	adds r5, #0x60
	adds r0, r4, #0
	movs r1, #9
	bl __divsi3
	lsls r0, r0, #4
	adds r0, #0x28
	ldr r1, [r6, #0x14]
	movs r2, #0
	mov r8, r2
	strh r5, [r1, #0x20]
	ldr r1, [r6, #0x14]
	strh r0, [r1, #0x22]
	bl sub_081D0004
	adds r4, r0, #0
	movs r0, #9
	bl GetSpriteTileStartByTag
	ldr r3, [r6, #0x14]
	ldr r1, _081D0C0C
	lsls r4, r4, #2
	adds r4, r4, r1
	ldrh r1, [r4]
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r2, _081D0C10
	adds r1, r2, #0
	ands r0, r1
	ldrh r2, [r3, #4]
	ldr r1, _081D0C14
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #4]
	ldrh r0, [r4, #2]
	adds r0, #0xf
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl IndexOfSpritePaletteTag
	ldr r3, [r6, #0x14]
	lsls r0, r0, #4
	ldrb r2, [r3, #5]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #5]
	ldr r0, [r6, #0x14]
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r1, [r6, #0x14]
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	mov r1, r8
	strh r1, [r0, #0x2e]
	ldr r1, [r6, #0x14]
	ldr r0, _081D0C18
	str r0, [r1, #0x1c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D0C0C: .4byte 0x085F7258
_081D0C10: .4byte 0x000003FF
_081D0C14: .4byte 0xFFFFFC00
_081D0C18: .4byte 0x081D0C55
	thumb_func_end sub_081D0B64

	thumb_func_start sub_081D0C1C
sub_081D0C1C: @ 0x081D0C1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	movs r0, #1
	strh r0, [r1, #0x2e]
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl StartSpriteAffineAnim
	ldr r1, [r4, #0x14]
	ldr r0, _081D0C3C
	str r0, [r1, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D0C3C: .4byte 0x081D0C55
	thumb_func_end sub_081D0C1C

	thumb_func_start sub_081D0C40
sub_081D0C40: @ 0x081D0C40
	ldr r0, [r0, #0x14]
	ldr r1, [r0, #0x1c]
	ldr r0, _081D0C50
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_081D0C50: .4byte 0x08007141
	thumb_func_end sub_081D0C40

	thumb_func_start sub_081D0C54
sub_081D0C54: @ 0x081D0C54
	push {lr}
	adds r3, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081D0C86
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	movs r0, #1
	ldrh r1, [r3, #0x2e]
	ands r1, r0
	lsls r1, r1, #2
	mov r0, ip
	ldrb r2, [r0]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldr r0, _081D0C8C
	str r0, [r3, #0x1c]
_081D0C86:
	pop {r0}
	bx r0
	.align 2, 0
_081D0C8C: .4byte 0x08007141
	thumb_func_end sub_081D0C54

