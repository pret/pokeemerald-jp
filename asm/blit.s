.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start BlitBitmapRect4BitWithoutColorKey
BlitBitmapRect4BitWithoutColorKey: @ 0x08002AB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	ldr r7, [sp, #0x38]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	movs r4, #0xff
	str r4, [sp, #0x10]
	bl BlitBitmapRect4Bit
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end BlitBitmapRect4BitWithoutColorKey

	thumb_func_start BlitBitmapRect4Bit
BlitBitmapRect4Bit: @ 0x08002AFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0x4c]
	ldr r1, [sp, #0x50]
	ldr r4, [sp, #0x54]
	ldr r5, [sp, #0x58]
	ldr r6, [sp, #0x5c]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #0x10]
	ldr r0, [sp, #4]
	ldrh r3, [r0, #4]
	ldr r1, [sp, #0xc]
	subs r0, r3, r1
	adds r2, r2, r4
	mov r8, r2
	cmp r0, r4
	bge _08002B50
	ldr r2, [sp, #8]
	adds r0, r0, r2
	mov r8, r0
_08002B50:
	ldr r4, [sp, #4]
	ldrh r0, [r4, #6]
	mov r1, sb
	subs r0, r0, r1
	adds r2, r5, r7
	str r2, [sp, #0x14]
	cmp r0, r5
	bge _08002B64
	adds r0, r0, r7
	str r0, [sp, #0x14]
_08002B64:
	ldr r4, [sp]
	ldrh r1, [r4, #4]
	movs r2, #7
	adds r0, r1, #0
	ands r0, r2
	adds r1, r1, r0
	asrs r1, r1, #3
	str r1, [sp, #0x18]
	adds r0, r3, #0
	ands r0, r2
	adds r0, r3, r0
	asrs r0, r0, #3
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	cmp r0, #0xff
	bne _08002C22
	adds r3, r7, #0
	mov r1, sb
	ldr r2, [sp, #0x14]
	cmp r3, r2
	blt _08002B90
	b _08002CCA
_08002B90:
	ldr r5, [sp, #8]
	ldr r6, [sp, #0xc]
	adds r4, r3, #1
	str r4, [sp, #0x24]
	adds r0, r1, #1
	str r0, [sp, #0x28]
	cmp r5, r8
	bge _08002C16
	movs r7, #3
	asrs r0, r3, #3
	ldr r2, [sp, #0x18]
	muls r0, r2, r0
	lsls r0, r0, #5
	mov sl, r0
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1b
	mov sb, r0
	asrs r0, r1, #3
	ldr r4, [sp, #0x1c]
	muls r0, r4, r0
	lsls r0, r0, #5
	mov ip, r0
	lsls r0, r1, #0x1d
	lsrs r3, r0, #0x1b
_08002BC0:
	asrs r0, r5, #1
	ands r0, r7
	ldr r2, [sp]
	ldr r1, [r2]
	adds r1, r1, r0
	asrs r0, r5, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r1, sl
	mov r4, sb
	adds r2, r1, r4
	asrs r0, r6, #1
	ands r0, r7
	ldr r4, [sp, #4]
	ldr r1, [r4]
	adds r1, r1, r0
	asrs r0, r6, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r1, ip
	adds r4, r1, r3
	ldrb r2, [r2]
	adds r0, r5, #0
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	asrs r2, r0
	movs r0, #0xf
	ands r2, r0
	adds r0, r6, #0
	ands r0, r1
	lsls r1, r0, #2
	lsls r2, r1
	movs r0, #0xf0
	asrs r0, r1
	ldrb r1, [r4]
	ands r0, r1
	orrs r2, r0
	strb r2, [r4]
	adds r5, #1
	adds r6, #1
	cmp r5, r8
	blt _08002BC0
_08002C16:
	ldr r3, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x14]
	cmp r3, r2
	blt _08002B90
	b _08002CCA
_08002C22:
	adds r3, r7, #0
	mov r1, sb
	ldr r4, [sp, #0x14]
	cmp r3, r4
	bge _08002CCA
_08002C2C:
	ldr r5, [sp, #8]
	ldr r6, [sp, #0xc]
	adds r0, r3, #1
	str r0, [sp, #0x24]
	adds r2, r1, #1
	str r2, [sp, #0x28]
	cmp r5, r8
	bge _08002CC0
	movs r4, #3
	mov sb, r4
	asrs r0, r3, #3
	ldr r2, [sp, #0x18]
	muls r0, r2, r0
	lsls r0, r0, #5
	str r0, [sp, #0x20]
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1b
	mov sl, r0
	movs r3, #1
	asrs r0, r1, #3
	ldr r4, [sp, #0x1c]
	muls r0, r4, r0
	lsls r0, r0, #5
	mov ip, r0
	lsls r0, r1, #0x1d
	lsrs r7, r0, #0x1b
_08002C60:
	asrs r0, r5, #1
	mov r1, sb
	ands r0, r1
	ldr r2, [sp]
	ldr r1, [r2]
	adds r1, r1, r0
	asrs r0, r5, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r4, [sp, #0x20]
	adds r1, r1, r4
	mov r0, sl
	adds r2, r1, r0
	asrs r0, r6, #1
	mov r1, sb
	ands r0, r1
	ldr r4, [sp, #4]
	ldr r1, [r4]
	adds r1, r1, r0
	asrs r0, r6, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r1, ip
	adds r4, r1, r7
	ldrb r2, [r2]
	adds r0, r5, #0
	ands r0, r3
	lsls r0, r0, #2
	asrs r2, r0
	movs r0, #0xf
	ands r2, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	beq _08002CB8
	adds r0, r6, #0
	ands r0, r3
	lsls r1, r0, #2
	lsls r2, r1
	movs r0, #0xf0
	asrs r0, r1
	ldrb r1, [r4]
	ands r0, r1
	orrs r2, r0
	strb r2, [r4]
_08002CB8:
	adds r5, #1
	adds r6, #1
	cmp r5, r8
	blt _08002C60
_08002CC0:
	ldr r3, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x14]
	cmp r3, r2
	blt _08002C2C
_08002CCA:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BlitBitmapRect4Bit

	thumb_func_start FillBitmapRect4Bit
FillBitmapRect4Bit: @ 0x08002CDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, [sp, #0x24]
	ldr r4, [sp, #0x28]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r5, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	adds r4, r1, r3
	mov r3, sb
	ldrh r1, [r3, #4]
	cmp r4, r1
	ble _08002D12
	adds r4, r1, #0
_08002D12:
	adds r2, r2, r0
	mov ip, r2
	mov r2, sb
	ldrh r0, [r2, #6]
	cmp ip, r0
	ble _08002D20
	mov ip, r0
_08002D20:
	movs r0, #7
	ands r0, r1
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [sp]
	adds r1, r5, #0
	cmp r1, ip
	bge _08002D88
_08002D30:
	mov r3, sl
	adds r0, r1, #1
	mov r8, r0
	cmp r3, r4
	bge _08002D82
	asrs r0, r1, #3
	ldr r2, [sp]
	muls r0, r2, r0
	lsls r6, r0, #5
	lsls r0, r1, #0x1d
	lsrs r5, r0, #0x1b
_08002D46:
	asrs r2, r3, #1
	movs r0, #3
	ands r2, r0
	mov r0, sb
	ldr r1, [r0]
	adds r1, r1, r2
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r6
	adds r2, r1, r5
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08002D72
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	lsls r0, r7, #4
	orrs r1, r0
	strb r1, [r2]
	b _08002D7C
_08002D72:
	ldrb r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	orrs r0, r7
	strb r0, [r2]
_08002D7C:
	adds r3, #1
	cmp r3, r4
	blt _08002D46
_08002D82:
	mov r1, r8
	cmp r1, ip
	blt _08002D30
_08002D88:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end FillBitmapRect4Bit

	thumb_func_start BlitBitmapRect4BitTo8Bit
BlitBitmapRect4BitTo8Bit: @ 0x08002D98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	ldr r5, [sp, #0x64]
	ldr r4, [sp, #0x68]
	ldr r6, [sp, #0x6c]
	ldr r7, [sp, #0x70]
	mov r8, r7
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #0x10]
	mov r0, r8
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	lsls r0, r6, #0x1c
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
	ldr r1, [sp, #4]
	ldrh r0, [r1, #4]
	ldr r2, [sp, #0xc]
	subs r0, r0, r2
	ldr r1, [sp, #8]
	adds r1, r5, r1
	str r1, [sp, #0x18]
	cmp r0, r5
	bge _08002DFE
	ldr r2, [sp, #8]
	adds r0, r0, r2
	str r0, [sp, #0x18]
_08002DFE:
	ldr r5, [sp, #4]
	ldrh r1, [r5, #6]
	subs r0, r1, r7
	cmp r0, r4
	bge _08002E10
	adds r0, r3, r1
	subs r0, r0, r7
	str r0, [sp, #0x1c]
	b _08002E14
_08002E10:
	adds r4, r3, r4
	str r4, [sp, #0x1c]
_08002E14:
	ldr r0, [sp]
	ldrh r1, [r0, #4]
	movs r2, #7
	adds r0, r1, #0
	ands r0, r2
	adds r1, r1, r0
	asrs r1, r1, #3
	str r1, [sp, #0x20]
	ldr r5, [sp, #4]
	ldrh r1, [r5, #4]
	adds r0, r1, #0
	ands r0, r2
	adds r1, r1, r0
	asrs r1, r1, #3
	str r1, [sp, #0x24]
	ldr r0, [sp, #0x10]
	cmp r0, #0xff
	bne _08002EF4
	adds r2, r3, #0
	adds r5, r7, #0
	ldr r1, [sp, #0x1c]
	cmp r2, r1
	blt _08002E44
	b _08002FD6
_08002E44:
	ldr r3, [sp, #8]
	lsrs r3, r3, #1
	str r3, [sp, #0x2c]
	movs r0, #3
	ands r3, r0
	str r3, [sp, #0x2c]
	ldr r7, [sp, #8]
	lsrs r0, r7, #3
	lsls r0, r0, #5
	str r0, [sp, #0x30]
_08002E58:
	ldr r0, [sp]
	ldr r1, [r0]
	ldr r3, [sp, #0x2c]
	adds r1, r1, r3
	ldr r7, [sp, #0x30]
	adds r1, r1, r7
	asrs r0, r2, #3
	ldr r3, [sp, #0x20]
	muls r0, r3, r0
	lsls r0, r0, #5
	mov r8, r0
	add r1, r8
	lsls r0, r2, #0x1d
	lsrs r7, r0, #0x1b
	adds r6, r1, r7
	ldr r3, [sp, #8]
	ldr r4, [sp, #0xc]
	adds r2, #1
	mov sl, r2
	adds r0, r5, #1
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x18]
	cmp r3, r1
	bge _08002EE8
	asrs r0, r5, #3
	ldr r2, [sp, #0x24]
	muls r0, r2, r0
	lsls r0, r0, #6
	mov ip, r0
	lsls r0, r5, #0x1d
	lsrs r0, r0, #0x1a
	mov sb, r0
_08002E98:
	movs r0, #7
	ands r0, r4
	ldr r5, [sp, #4]
	ldr r1, [r5]
	adds r1, r1, r0
	asrs r0, r4, #3
	lsls r0, r0, #6
	adds r1, r1, r0
	add r1, ip
	mov r0, sb
	adds r5, r1, r0
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08002EBC
	ldrb r0, [r6]
	lsrs r0, r0, #4
	b _08002ED8
_08002EBC:
	asrs r2, r3, #1
	movs r0, #3
	ands r2, r0
	ldr r0, [sp]
	ldr r1, [r0]
	adds r1, r1, r2
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r1, r8
	adds r6, r1, r7
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
_08002ED8:
	ldr r1, [sp, #0x14]
	adds r0, r1, r0
	strb r0, [r5]
	adds r3, #1
	adds r4, #1
	ldr r2, [sp, #0x18]
	cmp r3, r2
	blt _08002E98
_08002EE8:
	mov r2, sl
	ldr r5, [sp, #0x38]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	blt _08002E58
	b _08002FD6
_08002EF4:
	adds r2, r3, #0
	adds r5, r7, #0
	ldr r7, [sp, #0x1c]
	cmp r2, r7
	bge _08002FD6
	ldr r0, [sp, #8]
	lsrs r0, r0, #1
	str r0, [sp, #0x34]
	movs r0, #3
	ldr r1, [sp, #0x34]
	ands r1, r0
	str r1, [sp, #0x34]
_08002F0C:
	ldr r3, [sp]
	ldr r1, [r3]
	ldr r7, [sp, #0x34]
	adds r1, r1, r7
	ldr r3, [sp, #8]
	lsrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	asrs r0, r2, #3
	ldr r7, [sp, #0x20]
	muls r0, r7, r0
	lsls r0, r0, #5
	mov r8, r0
	add r1, r8
	lsls r0, r2, #0x1d
	lsrs r7, r0, #0x1b
	adds r6, r1, r7
	ldr r4, [sp, #0xc]
	adds r2, #1
	mov sl, r2
	adds r0, r5, #1
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x18]
	cmp r3, r1
	bge _08002FCC
	asrs r0, r5, #3
	ldr r2, [sp, #0x24]
	muls r0, r2, r0
	lsls r0, r0, #6
	mov sb, r0
	lsls r0, r5, #0x1d
	lsrs r0, r0, #0x1a
	mov ip, r0
_08002F4E:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08002F82
	ldrb r2, [r6]
	movs r0, #0xf0
	ands r0, r2
	ldr r5, [sp, #0x28]
	cmp r0, r5
	beq _08002FC2
	adds r0, r4, #0
	movs r1, #7
	ands r0, r1
	ldr r5, [sp, #4]
	ldr r1, [r5]
	adds r1, r1, r0
	asrs r0, r4, #3
	lsls r0, r0, #6
	adds r1, r1, r0
	add r1, sb
	mov r0, ip
	adds r5, r1, r0
	lsrs r0, r2, #4
	ldr r1, [sp, #0x14]
	adds r0, r1, r0
	b _08002FC0
_08002F82:
	asrs r2, r3, #1
	movs r0, #3
	ands r2, r0
	ldr r5, [sp]
	ldr r1, [r5]
	adds r1, r1, r2
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r1, r8
	adds r6, r1, r7
	ldrb r0, [r6]
	movs r2, #0xf
	ands r2, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	beq _08002FC2
	adds r0, r4, #0
	movs r1, #7
	ands r0, r1
	ldr r5, [sp, #4]
	ldr r1, [r5]
	adds r1, r1, r0
	asrs r0, r4, #3
	lsls r0, r0, #6
	adds r1, r1, r0
	add r1, sb
	mov r0, ip
	adds r5, r1, r0
	ldr r1, [sp, #0x14]
	adds r0, r1, r2
_08002FC0:
	strb r0, [r5]
_08002FC2:
	adds r3, #1
	adds r4, #1
	ldr r2, [sp, #0x18]
	cmp r3, r2
	blt _08002F4E
_08002FCC:
	mov r2, sl
	ldr r5, [sp, #0x38]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	blt _08002F0C
_08002FD6:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BlitBitmapRect4BitTo8Bit

	thumb_func_start FillBitmapRect8Bit
FillBitmapRect8Bit: @ 0x08002FE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r0, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r6, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sb, r4
	adds r5, r1, r3
	mov r3, r8
	ldrh r1, [r3, #4]
	cmp r5, r1
	ble _08003020
	adds r5, r1, #0
_08003020:
	adds r7, r2, r0
	mov r2, r8
	ldrh r0, [r2, #6]
	cmp r7, r0
	ble _0800302C
	adds r7, r0, #0
_0800302C:
	movs r0, #7
	ands r0, r1
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [sp]
	adds r1, r6, #0
	cmp r1, r7
	bge _0800307C
_0800303C:
	mov r3, sl
	adds r6, r1, #1
	str r6, [sp, #4]
	cmp r3, r5
	bge _08003076
	movs r0, #7
	mov ip, r0
	asrs r0, r1, #3
	ldr r2, [sp]
	muls r0, r2, r0
	lsls r4, r0, #6
	lsls r0, r1, #0x1d
	lsrs r2, r0, #0x1a
_08003056:
	adds r0, r3, #0
	mov r6, ip
	ands r0, r6
	mov r6, r8
	ldr r1, [r6]
	adds r1, r1, r0
	asrs r0, r3, #3
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r1, r1, r4
	adds r1, r1, r2
	mov r0, sb
	strb r0, [r1]
	adds r3, #1
	cmp r3, r5
	blt _08003056
_08003076:
	ldr r1, [sp, #4]
	cmp r1, r7
	blt _0800303C
_0800307C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end FillBitmapRect8Bit

