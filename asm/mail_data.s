.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearMailData
ClearMailData: @ 0x080D3C0C
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _080D3C34
_080D3C12:
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #2
	ldr r0, _080D3C38
	adds r1, r1, r0
	ldr r0, [r5]
	adds r0, r0, r1
	bl ClearMailStruct
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _080D3C12
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3C34: .4byte 0x03005AEC
_080D3C38: .4byte 0x00002BE0
	thumb_func_end ClearMailData

	thumb_func_start ClearMailStruct
ClearMailStruct: @ 0x080D3C3C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, _080D3C8C
	adds r4, r0, #0
	adds r1, r3, #0
	movs r2, #8
_080D3C48:
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080D3C48
	movs r2, #0
	adds r6, r3, #0
	adds r6, #0x1a
	adds r4, r3, #0
	adds r4, #0x12
	movs r5, #0xff
_080D3C62:
	adds r1, r4, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #7
	ble _080D3C62
	adds r1, r6, #0
	movs r2, #0
	adds r0, r1, #3
_080D3C76:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080D3C76
	movs r1, #0
	movs r0, #1
	strh r0, [r3, #0x1e]
	strh r1, [r3, #0x20]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D3C8C: .4byte 0x0000FFFF
	thumb_func_end ClearMailStruct

	thumb_func_start MonHasMail
MonHasMail: @ 0x080D3C90
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D3CB8
	adds r0, r4, #0
	movs r1, #0x40
	bl GetMonData
	cmp r0, #0xff
	beq _080D3CB8
	movs r0, #1
	b _080D3CBA
_080D3CB8:
	movs r0, #0
_080D3CBA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MonHasMail

	thumb_func_start GiveMailToMon
GiveMailToMon: @ 0x080D3CC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	str r0, [sp, #8]
	mov r0, sp
	movs r2, #0
	ldrb r3, [r0, #8]
	strb r3, [r0]
	lsrs r1, r1, #0x18
	strb r1, [r0, #1]
	add r4, sp, #4
	strb r2, [r4]
	mov ip, r4
	mov sl, r4
	adds r5, r4, #0
_080D3CEA:
	ldr r2, _080D3E10
	ldr r0, [r2]
	ldrb r3, [r5]
	lsls r1, r3, #3
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xb0
	lsls r1, r1, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080D3D06
	b _080D3E2C
_080D3D06:
	movs r4, #0
	ldr r3, _080D3E14
	mov sb, r3
	adds r7, r2, #0
	mov r5, ip
	ldr r0, _080D3E18
	adds r6, r0, #0
_080D3D14:
	ldr r2, [r7]
	lsls r3, r4, #1
	ldrb r1, [r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r1, _080D3E1C
	adds r2, r2, r1
	adds r2, r2, r3
	ldrh r0, [r2]
	orrs r0, r6
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #8
	bls _080D3D14
	movs r4, #0
	ldr r5, _080D3E10
	mov r3, ip
_080D3D3E:
	ldr r2, [r5]
	ldrb r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r1, _080D3E20
	adds r2, r2, r1
	adds r2, r2, r0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080D3D3E
	ldr r3, _080D3E10
	ldr r2, [r3]
	mov r0, ip
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r1, _080D3E20
	adds r2, r2, r1
	adds r2, r2, r0
	movs r0, #0xff
	strb r0, [r2]
	movs r4, #0
	adds r5, r3, #0
	mov r3, ip
_080D3D84:
	ldr r2, [r5]
	ldrb r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r1, _080D3E24
	adds r2, r2, r1
	adds r2, r2, r0
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0xa
	adds r0, r0, r4
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080D3D84
	mov r0, r8
	movs r1, #0xb
	bl GetBoxMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	movs r1, #0
	bl GetBoxMonData
	adds r1, r0, #0
	adds r0, r4, #0
	bl SpeciesToMailSpecies
	ldr r1, _080D3E10
	ldr r3, [r1]
	mov r4, sl
	ldrb r2, [r4]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r3, r1
	ldr r2, _080D3E28
	adds r1, r1, r2
	strh r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	movs r4, #0xb0
	lsls r4, r4, #6
	adds r3, r3, r4
	mov r0, sp
	ldrh r0, [r0, #8]
	strh r0, [r3]
	mov r0, r8
	movs r1, #0x40
	mov r2, sl
	bl SetMonData
	mov r0, r8
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	mov r1, sl
	ldrb r0, [r1]
	b _080D3E3A
	.align 2, 0
_080D3E10: .4byte 0x03005AEC
_080D3E14: .4byte 0x03005AF0
_080D3E18: .4byte 0x0000FFFF
_080D3E1C: .4byte 0x00002BE0
_080D3E20: .4byte 0x00002BF2
_080D3E24: .4byte 0x00002BFA
_080D3E28: .4byte 0x00002BFE
_080D3E2C:
	adds r0, r3, #1
	strb r0, [r4]
	ldrb r0, [r5]
	cmp r0, #5
	bhi _080D3E38
	b _080D3CEA
_080D3E38:
	movs r0, #0xff
_080D3E3A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GiveMailToMon

	thumb_func_start SpeciesToMailSpecies
SpeciesToMailSpecies: @ 0x080D3E4C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc9
	bne _080D3E64
	adds r0, r1, #0
	bl GetUnownLetterByPersonality
	lsls r0, r0, #0x10
	ldr r1, _080D3E68
	adds r0, r0, r1
	lsrs r0, r0, #0x10
_080D3E64:
	pop {r1}
	bx r1
	.align 2, 0
_080D3E68: .4byte 0x75300000
	thumb_func_end SpeciesToMailSpecies

	thumb_func_start MailSpeciesToSpecies
MailSpeciesToSpecies: @ 0x080D3E6C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080D3E84
	adds r2, r3, r0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1b
	bhi _080D3E88
	movs r0, #0xc9
	strh r2, [r1]
	b _080D3E8A
	.align 2, 0
_080D3E84: .4byte 0xFFFF8AD0
_080D3E88:
	adds r0, r3, #0
_080D3E8A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MailSpeciesToSpecies

	thumb_func_start GiveMailToMon2
GiveMailToMon2: @ 0x080D3E90
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	ldrh r5, [r7, #0x20]
	adds r1, r5, #0
	bl GiveMailToMon
	add r4, sp, #4
	strb r0, [r4]
	ldrb r2, [r4]
	cmp r2, #0xff
	beq _080D3EF4
	ldr r0, _080D3EEC
	ldr r1, [r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _080D3EF0
	adds r1, r1, r0
	adds r0, r7, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	adds r0, r6, #0
	movs r1, #0x40
	adds r2, r4, #0
	bl SetMonData
	mov r0, sp
	strb r5, [r0]
	mov r1, sp
	lsrs r0, r5, #8
	strb r0, [r1, #1]
	adds r0, r6, #0
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	ldrb r0, [r4]
	b _080D3EF6
	.align 2, 0
_080D3EEC: .4byte 0x03005AEC
_080D3EF0: .4byte 0x00002BE0
_080D3EF4:
	movs r0, #0xff
_080D3EF6:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GiveMailToMon2

	thumb_func_start DummyMailFunc
DummyMailFunc: @ 0x080D3F00
	movs r0, #0
	bx lr
	thumb_func_end DummyMailFunc

	thumb_func_start TakeMailFromMon
TakeMailFromMon: @ 0x080D3F04
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl MonHasMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D3F56
	adds r0, r4, #0
	movs r1, #0x40
	bl GetMonData
	add r2, sp, #4
	strb r0, [r2]
	ldr r0, _080D3F60
	ldr r3, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	movs r0, #0xb0
	lsls r0, r0, #6
	adds r3, r3, r0
	movs r1, #0
	movs r0, #0
	strh r0, [r3]
	movs r0, #0xff
	strb r0, [r2]
	mov r0, sp
	strb r1, [r0]
	strb r1, [r0, #1]
	adds r0, r4, #0
	movs r1, #0x40
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
_080D3F56:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D3F60: .4byte 0x03005AEC
	thumb_func_end TakeMailFromMon

	thumb_func_start ClearMailItemId
ClearMailItemId: @ 0x080D3F64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080D3F80
	ldr r2, [r1]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r2, r1
	movs r0, #0xb0
	lsls r0, r0, #6
	adds r2, r2, r0
	movs r0, #0
	strh r0, [r2]
	bx lr
	.align 2, 0
_080D3F80: .4byte 0x03005AEC
	thumb_func_end ClearMailItemId

	thumb_func_start TakeMailFromMon2
TakeMailFromMon2: @ 0x080D3F84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	mov r0, sp
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	add r1, sp, #4
	movs r0, #0xff
	strb r0, [r1]
	movs r7, #6
	mov sb, r1
	ldr r0, _080D401C
	mov r8, r0
	ldr r3, _080D4020
_080D3FA8:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r7, #3
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r4, r0, r1
	movs r2, #0xb0
	lsls r2, r2, #6
	adds r0, r4, r2
	ldrh r6, [r0]
	cmp r6, #0
	bne _080D4024
	adds r4, r4, r3
	adds r0, r5, #0
	movs r1, #0x40
	str r3, [sp, #8]
	bl GetMonData
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r3, [sp, #8]
	adds r1, r1, r3
	ldm r1!, {r0, r2, r3}
	stm r4!, {r0, r2, r3}
	ldm r1!, {r0, r2, r3}
	stm r4!, {r0, r2, r3}
	ldm r1!, {r0, r2, r3}
	stm r4!, {r0, r2, r3}
	adds r0, r5, #0
	movs r1, #0x40
	bl GetMonData
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r2, r1
	movs r3, #0xb0
	lsls r3, r3, #6
	adds r2, r2, r3
	strh r6, [r2]
	adds r0, r5, #0
	movs r1, #0x40
	mov r2, sb
	bl SetMonData
	adds r0, r5, #0
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	adds r0, r7, #0
	b _080D4030
	.align 2, 0
_080D401C: .4byte 0x03005AEC
_080D4020: .4byte 0x00002BE0
_080D4024:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bls _080D3FA8
	movs r0, #0xff
_080D4030:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TakeMailFromMon2

	thumb_func_start ItemIsMail
ItemIsMail: @ 0x080D4040
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x84
	bgt _080D4052
	cmp r0, #0x79
	blt _080D4052
	movs r0, #1
	b _080D4054
_080D4052:
	movs r0, #0
_080D4054:
	pop {r1}
	bx r1
	thumb_func_end ItemIsMail

