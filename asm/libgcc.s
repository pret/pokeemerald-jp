    .include "asm/macros.inc"
    .include "constants/constants.inc"
	.text
    .syntax unified

	thumb_func_start _call_via_r0
_call_via_r0: @ 0x08295A08
	bx r0
	nop
	thumb_func_end _call_via_r0

	thumb_func_start _call_via_r1
_call_via_r1: @ 0x08295A0C
	bx r1
	nop
	thumb_func_end _call_via_r1

	thumb_func_start _call_via_r2
_call_via_r2: @ 0x08295A10
	bx r2
	nop
	thumb_func_end _call_via_r2

	thumb_func_start _call_via_r3
_call_via_r3: @ 0x08295A14
	bx r3
	nop
	thumb_func_end _call_via_r3

	thumb_func_start _call_via_r4
_call_via_r4: @ 0x08295A18
	bx r4
	nop
	thumb_func_end _call_via_r4

	thumb_func_start _call_via_r5
_call_via_r5: @ 0x08295A1C
	bx r5
	nop
	thumb_func_end _call_via_r5

	thumb_func_start _call_via_r6
_call_via_r6: @ 0x08295A20
	bx r6
	nop
	thumb_func_end _call_via_r6

	thumb_func_start _call_via_r7
_call_via_r7: @ 0x08295A24
	bx r7
	nop
	thumb_func_end _call_via_r7

	thumb_func_start _call_via_r8
_call_via_r8: @ 0x08295A28
	bx r8
	nop
	thumb_func_end _call_via_r8

	thumb_func_start _call_via_r9
_call_via_r9: @ 0x08295A2C
	bx sb
	nop
	thumb_func_end _call_via_r9

	thumb_func_start _call_via_sl
_call_via_sl: @ 0x08295A30
	bx sl
	nop
	thumb_func_end _call_via_sl

	thumb_func_start _call_via_fp
_call_via_fp: @ 0x08295A34
	bx fp
	nop
	thumb_func_end _call_via_fp

	thumb_func_start _call_via_ip
_call_via_ip: @ 0x08295A38
	bx ip
	nop
	thumb_func_end _call_via_ip

	thumb_func_start _call_via_sp
_call_via_sp: @ 0x08295A3C
	bx sp
	nop
	thumb_func_end _call_via_sp

	thumb_func_start _call_via_lr
_call_via_lr: @ 0x08295A40
	bx lr
	nop
	thumb_func_end _call_via_lr

	thumb_func_start __divdi3
__divdi3: @ 0x08295A44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	movs r4, #0
	str r4, [sp]
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0
	bge _08295A74
	ldr r0, [sp]
	mvns r0, r0
	str r0, [sp]
	rsbs r0, r4, #0
	adds r6, r0, #0
	rsbs r1, r5, #0
	cmp r0, #0
	beq _08295A6E
	subs r1, #1
_08295A6E:
	adds r7, r1, #0
	adds r5, r7, #0
	adds r4, r6, #0
_08295A74:
	cmp r3, #0
	bge _08295A90
	ldr r1, [sp]
	mvns r1, r1
	str r1, [sp]
	rsbs r0, r2, #0
	str r0, [sp, #4]
	rsbs r2, r3, #0
	cmp r0, #0
	beq _08295A8A
	subs r2, #1
_08295A8A:
	str r2, [sp, #8]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
_08295A90:
	adds r7, r2, #0
	adds r6, r3, #0
	mov sl, r4
	mov r8, r5
	cmp r6, #0
	beq _08295A9E
	b _08295CEC
_08295A9E:
	cmp r7, r8
	bls _08295B78
	ldr r0, _08295AB4
	cmp r7, r0
	bhi _08295AB8
	movs r1, #0
	cmp r7, #0xff
	bls _08295AC2
	movs r1, #8
	b _08295AC2
	.align 2, 0
_08295AB4: .4byte 0x0000FFFF
_08295AB8:
	ldr r0, _08295B6C
	movs r1, #0x18
	cmp r7, r0
	bhi _08295AC2
	movs r1, #0x10
_08295AC2:
	ldr r0, _08295B70
	lsrs r2, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0x20
	subs r2, r1, r0
	cmp r2, #0
	beq _08295AEA
	lsls r7, r2
	mov r3, r8
	lsls r3, r2
	subs r1, r1, r2
	mov r0, sl
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, sl
	lsls r4, r2
	mov sl, r4
_08295AEA:
	lsrs r0, r7, #0x10
	mov sb, r0
	ldr r1, _08295B74
	ands r1, r7
	str r1, [sp, #0xc]
	mov r0, r8
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	mov r0, r8
	mov r1, sb
	bl __udivsi3
	adds r6, r0, #0
	ldr r3, [sp, #0xc]
	adds r2, r6, #0
	muls r2, r3, r2
	lsls r4, r4, #0x10
	mov r1, sl
	lsrs r0, r1, #0x10
	orrs r4, r0
	cmp r4, r2
	bhs _08295B2A
	subs r6, #1
	adds r4, r4, r7
	cmp r4, r7
	blo _08295B2A
	cmp r4, r2
	bhs _08295B2A
	subs r6, #1
	adds r4, r4, r7
_08295B2A:
	subs r4, r4, r2
	adds r0, r4, #0
	mov r1, sb
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r1, r0, #0
	ldr r3, [sp, #0xc]
	adds r2, r1, #0
	muls r2, r3, r2
	lsls r5, r5, #0x10
	ldr r0, _08295B74
	mov r4, sl
	ands r4, r0
	orrs r5, r4
	cmp r5, r2
	bhs _08295B62
	subs r1, #1
	adds r5, r5, r7
	cmp r5, r7
	blo _08295B62
	cmp r5, r2
	bhs _08295B62
	subs r1, #1
_08295B62:
	lsls r6, r6, #0x10
	orrs r6, r1
	movs r0, #0
	str r0, [sp, #0x10]
	b _08295E42
	.align 2, 0
_08295B6C: .4byte 0x00FFFFFF
_08295B70: .4byte gUnknown_890EF58
_08295B74: .4byte 0x0000FFFF
_08295B78:
	cmp r2, #0
	bne _08295B86
	movs r0, #1
	movs r1, #0
	bl __udivsi3
	adds r7, r0, #0
_08295B86:
	adds r1, r7, #0
	ldr r0, _08295B98
	cmp r7, r0
	bhi _08295B9C
	movs r2, #0
	cmp r7, #0xff
	bls _08295BA6
	movs r2, #8
	b _08295BA6
	.align 2, 0
_08295B98: .4byte 0x0000FFFF
_08295B9C:
	ldr r0, _08295BC4
	movs r2, #0x18
	cmp r7, r0
	bhi _08295BA6
	movs r2, #0x10
_08295BA6:
	ldr r0, _08295BC8
	lsrs r1, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r0, r0, r2
	movs r1, #0x20
	subs r2, r1, r0
	cmp r2, #0
	bne _08295BCC
	mov r1, r8
	subs r1, r1, r7
	mov r8, r1
	movs r2, #1
	str r2, [sp, #0x10]
	b _08295C6A
	.align 2, 0
_08295BC4: .4byte 0x00FFFFFF
_08295BC8: .4byte gUnknown_890EF58
_08295BCC:
	subs r1, r1, r2
	lsls r7, r2
	mov r5, r8
	lsrs r5, r1
	mov r3, r8
	lsls r3, r2
	mov r0, sl
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, sl
	lsls r4, r2
	mov sl, r4
	lsrs r0, r7, #0x10
	mov sb, r0
	ldr r1, _08295CE8
	ands r1, r7
	str r1, [sp, #0x14]
	adds r0, r5, #0
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sb
	bl __udivsi3
	adds r6, r0, #0
	ldr r2, [sp, #0x14]
	adds r1, r6, #0
	muls r1, r2, r1
	lsls r4, r4, #0x10
	mov r3, r8
	lsrs r0, r3, #0x10
	orrs r4, r0
	cmp r4, r1
	bhs _08295C26
	subs r6, #1
	adds r4, r4, r7
	cmp r4, r7
	blo _08295C26
	cmp r4, r1
	bhs _08295C26
	subs r6, #1
	adds r4, r4, r7
_08295C26:
	subs r4, r4, r1
	adds r0, r4, #0
	mov r1, sb
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r2, r0, #0
	ldr r4, [sp, #0x14]
	adds r1, r2, #0
	muls r1, r4, r1
	lsls r5, r5, #0x10
	ldr r0, _08295CE8
	mov r3, r8
	ands r3, r0
	orrs r5, r3
	cmp r5, r1
	bhs _08295C60
	subs r2, #1
	adds r5, r5, r7
	cmp r5, r7
	blo _08295C60
	cmp r5, r1
	bhs _08295C60
	subs r2, #1
	adds r5, r5, r7
_08295C60:
	lsls r6, r6, #0x10
	orrs r6, r2
	str r6, [sp, #0x10]
	subs r1, r5, r1
	mov r8, r1
_08295C6A:
	lsrs r4, r7, #0x10
	mov sb, r4
	ldr r0, _08295CE8
	ands r0, r7
	str r0, [sp, #0x18]
	mov r0, r8
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	mov r0, r8
	mov r1, sb
	bl __udivsi3
	adds r6, r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r6, #0
	muls r2, r1, r2
	lsls r4, r4, #0x10
	mov r3, sl
	lsrs r0, r3, #0x10
	orrs r4, r0
	cmp r4, r2
	bhs _08295CAA
	subs r6, #1
	adds r4, r4, r7
	cmp r4, r7
	blo _08295CAA
	cmp r4, r2
	bhs _08295CAA
	subs r6, #1
	adds r4, r4, r7
_08295CAA:
	subs r4, r4, r2
	adds r0, r4, #0
	mov r1, sb
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r1, r0, #0
	ldr r4, [sp, #0x18]
	adds r2, r1, #0
	muls r2, r4, r2
	lsls r5, r5, #0x10
	ldr r0, _08295CE8
	mov r3, sl
	ands r3, r0
	orrs r5, r3
	cmp r5, r2
	bhs _08295CE2
	subs r1, #1
	adds r5, r5, r7
	cmp r5, r7
	blo _08295CE2
	cmp r5, r2
	bhs _08295CE2
	subs r1, #1
_08295CE2:
	lsls r6, r6, #0x10
	orrs r6, r1
	b _08295E42
	.align 2, 0
_08295CE8: .4byte 0x0000FFFF
_08295CEC:
	cmp r6, r8
	bls _08295CF8
	movs r6, #0
	movs r4, #0
	str r4, [sp, #0x10]
	b _08295E42
_08295CF8:
	adds r1, r6, #0
	ldr r0, _08295D0C
	cmp r6, r0
	bhi _08295D10
	movs r2, #0
	cmp r6, #0xff
	bls _08295D1A
	movs r2, #8
	b _08295D1A
	.align 2, 0
_08295D0C: .4byte 0x0000FFFF
_08295D10:
	ldr r0, _08295D3C
	movs r2, #0x18
	cmp r6, r0
	bhi _08295D1A
	movs r2, #0x10
_08295D1A:
	ldr r0, _08295D40
	lsrs r1, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r0, r0, r2
	movs r1, #0x20
	subs r2, r1, r0
	cmp r2, #0
	bne _08295D48
	cmp r8, r6
	bhi _08295D34
	cmp sl, r7
	blo _08295D44
_08295D34:
	movs r6, #1
	mov r1, sl
	b _08295E3C
	.align 2, 0
_08295D3C: .4byte 0x00FFFFFF
_08295D40: .4byte gUnknown_890EF58
_08295D44:
	movs r6, #0
	b _08295E3E
_08295D48:
	subs r1, r1, r2
	lsls r6, r2
	adds r0, r7, #0
	lsrs r0, r1
	orrs r6, r0
	lsls r7, r2
	mov r5, r8
	lsrs r5, r1
	mov r3, r8
	lsls r3, r2
	mov r0, sl
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, sl
	lsls r4, r2
	mov sl, r4
	lsrs r0, r6, #0x10
	mov sb, r0
	ldr r1, _08295E74
	ands r1, r6
	str r1, [sp, #0x1c]
	adds r0, r5, #0
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sb
	bl __udivsi3
	adds r3, r0, #0
	ldr r2, [sp, #0x1c]
	adds r1, r3, #0
	muls r1, r2, r1
	lsls r4, r4, #0x10
	mov r2, r8
	lsrs r0, r2, #0x10
	orrs r4, r0
	cmp r4, r1
	bhs _08295DAA
	subs r3, #1
	adds r4, r4, r6
	cmp r4, r6
	blo _08295DAA
	cmp r4, r1
	bhs _08295DAA
	subs r3, #1
	adds r4, r4, r6
_08295DAA:
	subs r4, r4, r1
	adds r0, r4, #0
	mov r1, sb
	str r3, [sp, #0x30]
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r2, r0, #0
	ldr r4, [sp, #0x1c]
	adds r1, r2, #0
	muls r1, r4, r1
	lsls r5, r5, #0x10
	ldr r0, _08295E74
	mov r4, r8
	ands r4, r0
	orrs r5, r4
	ldr r3, [sp, #0x30]
	cmp r5, r1
	bhs _08295DE8
	subs r2, #1
	adds r5, r5, r6
	cmp r5, r6
	blo _08295DE8
	cmp r5, r1
	bhs _08295DE8
	subs r2, #1
	adds r5, r5, r6
_08295DE8:
	lsls r6, r3, #0x10
	orrs r6, r2
	subs r1, r5, r1
	mov r8, r1
	ldr r0, _08295E74
	mov sb, r0
	adds r1, r6, #0
	ands r1, r0
	lsrs r3, r6, #0x10
	adds r0, r7, #0
	mov r2, sb
	ands r0, r2
	lsrs r2, r7, #0x10
	adds r5, r1, #0
	muls r5, r0, r5
	adds r4, r1, #0
	muls r4, r2, r4
	adds r1, r3, #0
	muls r1, r0, r1
	muls r3, r2, r3
	lsrs r0, r5, #0x10
	adds r4, r4, r0
	adds r4, r4, r1
	cmp r4, r1
	bhs _08295E20
	movs r0, #0x80
	lsls r0, r0, #9
	adds r3, r3, r0
_08295E20:
	lsrs r0, r4, #0x10
	adds r3, r3, r0
	mov r1, sb
	ands r4, r1
	lsls r0, r4, #0x10
	ands r5, r1
	adds r1, r0, r5
	cmp r3, r8
	bhi _08295E3A
	cmp r3, r8
	bne _08295E3E
	cmp r1, sl
	bls _08295E3E
_08295E3A:
	subs r6, #1
_08295E3C:
	subs r0, r1, r7
_08295E3E:
	movs r2, #0
	str r2, [sp, #0x10]
_08295E42:
	str r6, [sp, #0x20]
	ldr r3, [sp, #0x10]
	str r3, [sp, #0x24]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r4, [sp]
	cmp r4, #0
	beq _08295E64
	rsbs r0, r1, #0
	str r0, [sp, #0x28]
	rsbs r1, r2, #0
	cmp r0, #0
	beq _08295E5E
	subs r1, #1
_08295E5E:
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
_08295E64:
	adds r0, r1, #0
	adds r1, r2, #0
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08295E74: .4byte 0x0000FFFF
	thumb_func_end __divdi3

	thumb_func_start __divsi3
__divsi3: @ 0x08295E78
	cmp r1, #0
	beq _08295F00
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _08295E8E
	rsbs r1, r1, #0
_08295E8E:
	cmp r0, #0
	bpl _08295E94
	rsbs r0, r0, #0
_08295E94:
	cmp r0, r1
	blo _08295EF2
	movs r4, #1
	lsls r4, r4, #0x1c
_08295E9C:
	cmp r1, r4
	bhs _08295EAA
	cmp r1, r0
	bhs _08295EAA
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _08295E9C
_08295EAA:
	lsls r4, r4, #3
_08295EAC:
	cmp r1, r4
	bhs _08295EBA
	cmp r1, r0
	bhs _08295EBA
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _08295EAC
_08295EBA:
	cmp r0, r1
	blo _08295EC2
	subs r0, r0, r1
	orrs r2, r3
_08295EC2:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _08295ECE
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_08295ECE:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _08295EDA
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_08295EDA:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _08295EE6
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_08295EE6:
	cmp r0, #0
	beq _08295EF2
	lsrs r3, r3, #4
	beq _08295EF2
	lsrs r1, r1, #4
	b _08295EBA
_08295EF2:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _08295EFC
	rsbs r0, r0, #0
_08295EFC:
	pop {r4}
	mov pc, lr
_08295F00:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}
	.align 2, 0
	thumb_func_end __divsi3

	thumb_func_start __div0
__div0: @ 0x08295F0C
	mov pc, lr
	.align 2, 0
	thumb_func_end __div0

	thumb_func_start __fixunsdfsi
__fixunsdfsi: @ 0x08295F10
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r3, _08295F30
	ldr r2, _08295F2C
	bl __gedf2
	cmp r0, #0
	bge _08295F34
	adds r1, r5, #0
	adds r0, r4, #0
	bl __fixdfsi
	b _08295F4A
	.align 2, 0
_08295F2C: .4byte 0x41E00000
_08295F30: .4byte 0x00000000
_08295F34:
	ldr r3, _08295F50
	ldr r2, _08295F4C
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	bl __fixdfsi
	movs r1, #0x80
	lsls r1, r1, #0x18
	adds r0, r0, r1
_08295F4A:
	pop {r4, r5, pc}
	.align 2, 0
_08295F4C: .4byte 0xC1E00000
_08295F50: .4byte 0x00000000
	thumb_func_end __fixunsdfsi

	thumb_func_start __fixunssfsi
__fixunssfsi: @ 0x08295F54
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08295F6C
	bl __gesf2
	cmp r0, #0
	bge _08295F70
	adds r0, r4, #0
	bl __fixsfsi
	b _08295F82
	.align 2, 0
_08295F6C: .4byte 0x4F000000
_08295F70:
	ldr r1, _08295F84
	adds r0, r4, #0
	bl __addsf3
	bl __fixsfsi
	movs r1, #0x80
	lsls r1, r1, #0x18
	adds r0, r0, r1
_08295F82:
	pop {r4, pc}
	.align 2, 0
_08295F84: .4byte 0xCF000000
	thumb_func_end __fixunssfsi

	thumb_func_start __modsi3
__modsi3: @ 0x08295F88
	movs r3, #1
	cmp r1, #0
	beq _0829604C
	bpl _08295F92
	rsbs r1, r1, #0
_08295F92:
	push {r4}
	push {r0}
	cmp r0, #0
	bpl _08295F9C
	rsbs r0, r0, #0
_08295F9C:
	cmp r0, r1
	blo _08296040
	movs r4, #1
	lsls r4, r4, #0x1c
_08295FA4:
	cmp r1, r4
	bhs _08295FB2
	cmp r1, r0
	bhs _08295FB2
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _08295FA4
_08295FB2:
	lsls r4, r4, #3
_08295FB4:
	cmp r1, r4
	bhs _08295FC2
	cmp r1, r0
	bhs _08295FC2
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _08295FB4
_08295FC2:
	movs r2, #0
	cmp r0, r1
	blo _08295FCA
	subs r0, r0, r1
_08295FCA:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _08295FDC
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08295FDC:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _08295FEE
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08295FEE:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _08296000
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08296000:
	mov ip, r3
	cmp r0, #0
	beq _0829600E
	lsrs r3, r3, #4
	beq _0829600E
	lsrs r1, r1, #4
	b _08295FC2
_0829600E:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	beq _08296040
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _08296024
	lsrs r4, r1, #3
	adds r0, r0, r4
_08296024:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _08296032
	lsrs r4, r1, #2
	adds r0, r0, r4
_08296032:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _08296040
	lsrs r4, r1, #1
	adds r0, r0, r4
_08296040:
	pop {r4}
	cmp r4, #0
	bpl _08296048
	rsbs r0, r0, #0
_08296048:
	pop {r4}
	mov pc, lr
_0829604C:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}
	.align 2, 0
	thumb_func_end __modsi3

	thumb_func_start __muldi3
__muldi3: @ 0x08296058
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r3, [sp]
	ldr r0, _082960C4
	mov ip, r0
	adds r2, r3, #0
	ands r2, r0
	lsrs r3, r3, #0x10
	ldr r1, [sp, #8]
	adds r0, r1, #0
	mov r4, ip
	ands r0, r4
	lsrs r1, r1, #0x10
	adds r5, r2, #0
	muls r5, r0, r5
	adds r4, r2, #0
	muls r4, r1, r4
	adds r2, r3, #0
	muls r2, r0, r2
	muls r3, r1, r3
	lsrs r0, r5, #0x10
	adds r4, r4, r0
	adds r4, r4, r2
	cmp r4, r2
	bhs _08296098
	movs r0, #0x80
	lsls r0, r0, #9
	adds r3, r3, r0
_08296098:
	lsrs r0, r4, #0x10
	adds r7, r3, r0
	mov r1, ip
	ands r4, r1
	lsls r0, r4, #0x10
	ands r5, r1
	adds r6, r0, #0
	orrs r6, r5
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r3, [sp]
	ldr r4, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r5, [sp, #4]
	ldr r4, [sp, #8]
	adds r3, r5, #0
	muls r3, r4, r3
	adds r2, r2, r3
	adds r1, r7, r2
	add sp, #0x10
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_082960C4: .4byte 0x0000FFFF
	thumb_func_end __muldi3

	thumb_func_start __udivdi3
__udivdi3: @ 0x082960C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r2, #0
	adds r6, r3, #0
	mov sl, r0
	mov r8, r1
	cmp r6, #0
	beq _082960E2
	b _08296330
_082960E2:
	cmp r7, r8
	bls _082961BC
	ldr r0, _082960F8
	cmp r7, r0
	bhi _082960FC
	movs r1, #0
	cmp r7, #0xff
	bls _08296106
	movs r1, #8
	b _08296106
	.align 2, 0
_082960F8: .4byte 0x0000FFFF
_082960FC:
	ldr r0, _082961B0
	movs r1, #0x18
	cmp r7, r0
	bhi _08296106
	movs r1, #0x10
_08296106:
	ldr r0, _082961B4
	lsrs r2, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0x20
	subs r2, r1, r0
	cmp r2, #0
	beq _08296132
	lsls r7, r2
	mov r0, r8
	lsls r0, r2
	mov r8, r0
	subs r1, r1, r2
	mov r0, sl
	lsrs r0, r1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
	mov r3, sl
	lsls r3, r2
	mov sl, r3
_08296132:
	lsrs r4, r7, #0x10
	mov sb, r4
	ldr r0, _082961B8
	ands r0, r7
	str r0, [sp]
	mov r0, r8
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	mov r0, r8
	mov r1, sb
	bl __udivsi3
	adds r6, r0, #0
	ldr r1, [sp]
	adds r2, r6, #0
	muls r2, r1, r2
	lsls r4, r4, #0x10
	mov r3, sl
	lsrs r0, r3, #0x10
	orrs r4, r0
	cmp r4, r2
	bhs _08296172
	subs r6, #1
	adds r4, r4, r7
	cmp r4, r7
	blo _08296172
	cmp r4, r2
	bhs _08296172
	subs r6, #1
	adds r4, r4, r7
_08296172:
	subs r4, r4, r2
	adds r0, r4, #0
	mov r1, sb
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r1, r0, #0
	ldr r4, [sp]
	adds r2, r1, #0
	muls r2, r4, r2
	lsls r5, r5, #0x10
	ldr r0, _082961B8
	mov r3, sl
	ands r3, r0
	orrs r5, r3
	cmp r5, r2
	bhs _082961AA
	subs r1, #1
	adds r5, r5, r7
	cmp r5, r7
	blo _082961AA
	cmp r5, r2
	bhs _082961AA
	subs r1, #1
_082961AA:
	lsls r6, r6, #0x10
	orrs r6, r1
	b _08296336
	.align 2, 0
_082961B0: .4byte 0x00FFFFFF
_082961B4: .4byte gUnknown_890F058
_082961B8: .4byte 0x0000FFFF
_082961BC:
	cmp r2, #0
	bne _082961CA
	movs r0, #1
	movs r1, #0
	bl __udivsi3
	adds r7, r0, #0
_082961CA:
	adds r1, r7, #0
	ldr r0, _082961DC
	cmp r7, r0
	bhi _082961E0
	movs r2, #0
	cmp r7, #0xff
	bls _082961EA
	movs r2, #8
	b _082961EA
	.align 2, 0
_082961DC: .4byte 0x0000FFFF
_082961E0:
	ldr r0, _08296208
	movs r2, #0x18
	cmp r7, r0
	bhi _082961EA
	movs r2, #0x10
_082961EA:
	ldr r0, _0829620C
	lsrs r1, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r0, r0, r2
	movs r1, #0x20
	subs r2, r1, r0
	cmp r2, #0
	bne _08296210
	mov r0, r8
	subs r0, r0, r7
	mov r8, r0
	movs r1, #1
	str r1, [sp, #4]
	b _082962AE
	.align 2, 0
_08296208: .4byte 0x00FFFFFF
_0829620C: .4byte gUnknown_890F058
_08296210:
	subs r1, r1, r2
	lsls r7, r2
	mov r5, r8
	lsrs r5, r1
	mov r3, r8
	lsls r3, r2
	mov r0, sl
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, sl
	lsls r4, r2
	mov sl, r4
	lsrs r0, r7, #0x10
	mov sb, r0
	ldr r1, _0829632C
	ands r1, r7
	str r1, [sp, #8]
	adds r0, r5, #0
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sb
	bl __udivsi3
	adds r6, r0, #0
	ldr r2, [sp, #8]
	adds r1, r6, #0
	muls r1, r2, r1
	lsls r4, r4, #0x10
	mov r3, r8
	lsrs r0, r3, #0x10
	orrs r4, r0
	cmp r4, r1
	bhs _0829626A
	subs r6, #1
	adds r4, r4, r7
	cmp r4, r7
	blo _0829626A
	cmp r4, r1
	bhs _0829626A
	subs r6, #1
	adds r4, r4, r7
_0829626A:
	subs r4, r4, r1
	adds r0, r4, #0
	mov r1, sb
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r2, r0, #0
	ldr r4, [sp, #8]
	adds r1, r2, #0
	muls r1, r4, r1
	lsls r5, r5, #0x10
	ldr r0, _0829632C
	mov r3, r8
	ands r3, r0
	orrs r5, r3
	cmp r5, r1
	bhs _082962A4
	subs r2, #1
	adds r5, r5, r7
	cmp r5, r7
	blo _082962A4
	cmp r5, r1
	bhs _082962A4
	subs r2, #1
	adds r5, r5, r7
_082962A4:
	lsls r6, r6, #0x10
	orrs r6, r2
	str r6, [sp, #4]
	subs r1, r5, r1
	mov r8, r1
_082962AE:
	lsrs r4, r7, #0x10
	mov sb, r4
	ldr r0, _0829632C
	ands r0, r7
	str r0, [sp, #0xc]
	mov r0, r8
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	mov r0, r8
	mov r1, sb
	bl __udivsi3
	adds r6, r0, #0
	ldr r1, [sp, #0xc]
	adds r2, r6, #0
	muls r2, r1, r2
	lsls r4, r4, #0x10
	mov r3, sl
	lsrs r0, r3, #0x10
	orrs r4, r0
	cmp r4, r2
	bhs _082962EE
	subs r6, #1
	adds r4, r4, r7
	cmp r4, r7
	blo _082962EE
	cmp r4, r2
	bhs _082962EE
	subs r6, #1
	adds r4, r4, r7
_082962EE:
	subs r4, r4, r2
	adds r0, r4, #0
	mov r1, sb
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r1, r0, #0
	ldr r4, [sp, #0xc]
	adds r2, r1, #0
	muls r2, r4, r2
	lsls r5, r5, #0x10
	ldr r0, _0829632C
	mov r3, sl
	ands r3, r0
	orrs r5, r3
	cmp r5, r2
	bhs _08296326
	subs r1, #1
	adds r5, r5, r7
	cmp r5, r7
	blo _08296326
	cmp r5, r2
	bhs _08296326
	subs r1, #1
_08296326:
	lsls r6, r6, #0x10
	orrs r6, r1
	b _08296486
	.align 2, 0
_0829632C: .4byte 0x0000FFFF
_08296330:
	cmp r6, r8
	bls _0829633C
	movs r6, #0
_08296336:
	movs r4, #0
	str r4, [sp, #4]
	b _08296486
_0829633C:
	adds r1, r6, #0
	ldr r0, _08296350
	cmp r6, r0
	bhi _08296354
	movs r2, #0
	cmp r6, #0xff
	bls _0829635E
	movs r2, #8
	b _0829635E
	.align 2, 0
_08296350: .4byte 0x0000FFFF
_08296354:
	ldr r0, _08296380
	movs r2, #0x18
	cmp r6, r0
	bhi _0829635E
	movs r2, #0x10
_0829635E:
	ldr r0, _08296384
	lsrs r1, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r0, r0, r2
	movs r1, #0x20
	subs r2, r1, r0
	cmp r2, #0
	bne _0829638C
	cmp r8, r6
	bhi _08296378
	cmp sl, r7
	blo _08296388
_08296378:
	movs r6, #1
	mov r1, sl
	b _08296480
	.align 2, 0
_08296380: .4byte 0x00FFFFFF
_08296384: .4byte gUnknown_890F058
_08296388:
	movs r6, #0
	b _08296482
_0829638C:
	subs r1, r1, r2
	lsls r6, r2
	adds r0, r7, #0
	lsrs r0, r1
	orrs r6, r0
	lsls r7, r2
	mov r5, r8
	lsrs r5, r1
	mov r3, r8
	lsls r3, r2
	mov r0, sl
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, sl
	lsls r4, r2
	mov sl, r4
	lsrs r0, r6, #0x10
	mov sb, r0
	ldr r1, _0829649C
	ands r1, r6
	str r1, [sp, #0x10]
	adds r0, r5, #0
	mov r1, sb
	bl __umodsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sb
	bl __udivsi3
	adds r3, r0, #0
	ldr r2, [sp, #0x10]
	adds r1, r3, #0
	muls r1, r2, r1
	lsls r4, r4, #0x10
	mov r2, r8
	lsrs r0, r2, #0x10
	orrs r4, r0
	cmp r4, r1
	bhs _082963EE
	subs r3, #1
	adds r4, r4, r6
	cmp r4, r6
	blo _082963EE
	cmp r4, r1
	bhs _082963EE
	subs r3, #1
	adds r4, r4, r6
_082963EE:
	subs r4, r4, r1
	adds r0, r4, #0
	mov r1, sb
	str r3, [sp, #0x1c]
	bl __umodsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sb
	bl __udivsi3
	adds r2, r0, #0
	ldr r4, [sp, #0x10]
	adds r1, r2, #0
	muls r1, r4, r1
	lsls r5, r5, #0x10
	ldr r0, _0829649C
	mov r4, r8
	ands r4, r0
	orrs r5, r4
	ldr r3, [sp, #0x1c]
	cmp r5, r1
	bhs _0829642C
	subs r2, #1
	adds r5, r5, r6
	cmp r5, r6
	blo _0829642C
	cmp r5, r1
	bhs _0829642C
	subs r2, #1
	adds r5, r5, r6
_0829642C:
	lsls r6, r3, #0x10
	orrs r6, r2
	subs r1, r5, r1
	mov r8, r1
	ldr r0, _0829649C
	mov sb, r0
	adds r1, r6, #0
	ands r1, r0
	lsrs r3, r6, #0x10
	adds r0, r7, #0
	mov r2, sb
	ands r0, r2
	lsrs r2, r7, #0x10
	adds r5, r1, #0
	muls r5, r0, r5
	adds r4, r1, #0
	muls r4, r2, r4
	adds r1, r3, #0
	muls r1, r0, r1
	muls r3, r2, r3
	lsrs r0, r5, #0x10
	adds r4, r4, r0
	adds r4, r4, r1
	cmp r4, r1
	bhs _08296464
	movs r0, #0x80
	lsls r0, r0, #9
	adds r3, r3, r0
_08296464:
	lsrs r0, r4, #0x10
	adds r3, r3, r0
	mov r1, sb
	ands r4, r1
	lsls r0, r4, #0x10
	ands r5, r1
	adds r1, r0, r5
	cmp r3, r8
	bhi _0829647E
	cmp r3, r8
	bne _08296482
	cmp r1, sl
	bls _08296482
_0829647E:
	subs r6, #1
_08296480:
	subs r0, r1, r7
_08296482:
	movs r2, #0
	str r2, [sp, #4]
_08296486:
	str r6, [sp, #0x14]
	ldr r3, [sp, #4]
	str r3, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0829649C: .4byte 0x0000FFFF
	thumb_func_end __udivdi3

	thumb_func_start __udivsi3
__udivsi3: @ 0x082964A0
	cmp r1, #0
	beq _0829650E
	movs r3, #1
	movs r2, #0
	push {r4}
	cmp r0, r1
	blo _08296508
	movs r4, #1
	lsls r4, r4, #0x1c
_082964B2:
	cmp r1, r4
	bhs _082964C0
	cmp r1, r0
	bhs _082964C0
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _082964B2
_082964C0:
	lsls r4, r4, #3
_082964C2:
	cmp r1, r4
	bhs _082964D0
	cmp r1, r0
	bhs _082964D0
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _082964C2
_082964D0:
	cmp r0, r1
	blo _082964D8
	subs r0, r0, r1
	orrs r2, r3
_082964D8:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _082964E4
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_082964E4:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _082964F0
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_082964F0:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _082964FC
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_082964FC:
	cmp r0, #0
	beq _08296508
	lsrs r3, r3, #4
	beq _08296508
	lsrs r1, r1, #4
	b _082964D0
_08296508:
	adds r0, r2, #0
	pop {r4}
	mov pc, lr
_0829650E:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}
	thumb_func_end __udivsi3

	thumb_func_start __umodsi3
__umodsi3: @ 0x08296518
	cmp r1, #0
	beq _082965CE
	movs r3, #1
	cmp r0, r1
	bhs _08296524
	mov pc, lr
_08296524:
	push {r4}
	movs r4, #1
	lsls r4, r4, #0x1c
_0829652A:
	cmp r1, r4
	bhs _08296538
	cmp r1, r0
	bhs _08296538
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _0829652A
_08296538:
	lsls r4, r4, #3
_0829653A:
	cmp r1, r4
	bhs _08296548
	cmp r1, r0
	bhs _08296548
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _0829653A
_08296548:
	movs r2, #0
	cmp r0, r1
	blo _08296550
	subs r0, r0, r1
_08296550:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _08296562
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08296562:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _08296574
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08296574:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _08296586
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_08296586:
	mov ip, r3
	cmp r0, #0
	beq _08296594
	lsrs r3, r3, #4
	beq _08296594
	lsrs r1, r1, #4
	b _08296548
_08296594:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	bne _082965A0
	pop {r4}
	mov pc, lr
_082965A0:
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _082965AE
	lsrs r4, r1, #3
	adds r0, r0, r4
_082965AE:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _082965BC
	lsrs r4, r1, #2
	adds r0, r0, r4
_082965BC:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _082965CA
	lsrs r4, r1, #1
	adds r0, r0, r4
_082965CA:
	pop {r4}
	mov pc, lr
_082965CE:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}
	thumb_func_end __umodsi3

	thumb_func_start __pack_d
__pack_d: @ 0x082965D8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	ldr r5, [r1, #0x10]
	ldr r7, [r1, #4]
	movs r6, #0
	movs r2, #0
	ldr r0, [r1]
	cmp r0, #1
	bhi _082965F0
	movs r2, #1
_082965F0:
	cmp r2, #0
	beq _08296610
	ldr r6, _08296604
	ldr r2, _08296608
	ldr r3, _0829660C
	adds r0, r4, #0
	adds r1, r5, #0
	orrs r1, r3
	b _082966C8
	.align 2, 0
_08296604: .4byte 0x000007FF
_08296608: .4byte 0x00000000
_0829660C: .4byte 0x00080000
_08296610:
	movs r2, #0
	cmp r0, #4
	bne _08296618
	movs r2, #1
_08296618:
	cmp r2, #0
	bne _08296664
	movs r2, #0
	cmp r0, #2
	bne _08296624
	movs r2, #1
_08296624:
	cmp r2, #0
	beq _0829662E
	movs r4, #0
	movs r5, #0
	b _082966CC
_0829662E:
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _082966CC
	ldr r2, [r1, #8]
	ldr r0, _0829664C
	cmp r2, r0
	bge _0829665E
	subs r2, r0, r2
	cmp r2, #0x38
	ble _08296650
	movs r4, #0
	movs r5, #0
	b _082966BE
	.align 2, 0
_0829664C: .4byte 0xFFFFFC02
_08296650:
	adds r1, r5, #0
	adds r0, r4, #0
	bl __lshrdi3
	adds r5, r1, #0
	adds r4, r0, #0
	b _082966BE
_0829665E:
	ldr r0, _0829666C
	cmp r2, r0
	ble _08296674
_08296664:
	ldr r6, _08296670
	movs r4, #0
	movs r5, #0
	b _082966CC
	.align 2, 0
_0829666C: .4byte 0x000003FF
_08296670: .4byte 0x000007FF
_08296674:
	ldr r0, _0829669C
	adds r6, r2, r0
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _082966A0
	cmp r2, #0
	bne _082966A0
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	beq _082966A8
	movs r0, #0x80
	movs r1, #0
	b _082966A4
	.align 2, 0
_0829669C: .4byte 0x000003FF
_082966A0:
	movs r0, #0x7f
	movs r1, #0
_082966A4:
	adds r4, r4, r0
	adcs r5, r1
_082966A8:
	ldr r0, _0829670C
	cmp r5, r0
	bls _082966BE
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r6, #1
_082966BE:
	lsls r3, r5, #0x18
	lsrs r2, r4, #8
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #8
_082966C8:
	adds r5, r1, #0
	adds r4, r0, #0
_082966CC:
	str r4, [sp]
	ldr r2, _08296710
	ands r2, r5
	ldr r0, [sp, #4]
	ldr r1, _08296714
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r2, sp
	ldr r1, _08296718
	adds r0, r1, #0
	ands r6, r0
	lsls r1, r6, #4
	ldr r0, _0829671C
	ldrh r3, [r2, #6]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #6]
	lsls r1, r7, #7
	movs r0, #0x7f
	ldrb r3, [r2, #7]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0829670C: .4byte 0x1FFFFFFF
_08296710: .4byte 0x000FFFFF
_08296714: .4byte 0xFFF00000
_08296718: .4byte 0x000007FF
_0829671C: .4byte 0xFFFF800F
	thumb_func_end __pack_d

	thumb_func_start __unpack_d
__unpack_d: @ 0x08296720
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r1, [r2, #4]
	str r1, [sp]
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r2, sp
	adds r4, r1, #0
	lsls r0, r0, #0xc
	lsrs r5, r0, #0xc
	ldrh r3, [r2, #6]
	lsls r0, r3, #0x11
	lsrs r3, r0, #0x15
	ldrb r2, [r2, #7]
	lsrs r0, r2, #7
	str r0, [r6, #4]
	cmp r3, #0
	bne _08296794
	orrs r1, r5
	cmp r1, #0
	bne _08296754
	movs r0, #2
	str r0, [r6]
	b _082967E8
_08296754:
	ldr r0, _0829678C
	str r0, [r6, #8]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #3
	str r0, [r6]
	ldr r0, _08296790
	cmp r5, r0
	bhi _082967C4
	adds r7, r0, #0
_08296772:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [r6, #8]
	subs r0, #1
	str r0, [r6, #8]
	cmp r5, r7
	bls _08296772
	b _082967C4
	.align 2, 0
_0829678C: .4byte 0xFFFFFC02
_08296790: .4byte 0x0FFFFFFF
_08296794:
	ldr r0, _082967A8
	cmp r3, r0
	bne _082967CA
	orrs r1, r5
	cmp r1, #0
	bne _082967AC
	movs r0, #4
	str r0, [r6]
	b _082967E8
	.align 2, 0
_082967A8: .4byte 0x000007FF
_082967AC:
	movs r2, #0x80
	lsls r2, r2, #0xc
	movs r0, #0
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	cmp r1, #0
	beq _082967C2
	movs r0, #1
	str r0, [r6]
	b _082967C4
_082967C2:
	str r1, [r6]
_082967C4:
	str r4, [r6, #0xc]
	str r5, [r6, #0x10]
	b _082967E8
_082967CA:
	ldr r1, _082967EC
	adds r0, r3, r1
	str r0, [r6, #8]
	movs r0, #3
	str r0, [r6]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	ldr r2, _082967F0
	ldr r3, _082967F4
	orrs r1, r3
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
_082967E8:
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_082967EC: .4byte 0xFFFFFC01
_082967F0: .4byte 0x00000000
_082967F4: .4byte 0x10000000
	thumb_func_end __unpack_d

	thumb_func_start sub_082967F8
sub_082967F8: @ 0x082967F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r3, r0, #0
	adds r4, r1, #0
	mov sl, r2
	movs r0, #0
	ldr r2, [r3]
	cmp r2, #1
	bhi _08296814
	movs r0, #1
_08296814:
	cmp r0, #0
	beq _0829681C
_08296818:
	adds r0, r3, #0
	b _08296A54
_0829681C:
	movs r1, #0
	ldr r0, [r4]
	cmp r0, #1
	bhi _08296826
	movs r1, #1
_08296826:
	cmp r1, #0
	bne _0829689E
	movs r1, #0
	cmp r2, #4
	bne _08296832
	movs r1, #1
_08296832:
	cmp r1, #0
	beq _08296854
	movs r1, #0
	cmp r0, #4
	bne _0829683E
	movs r1, #1
_0829683E:
	cmp r1, #0
	beq _08296818
	ldr r1, [r3, #4]
	ldr r0, [r4, #4]
	cmp r1, r0
	beq _08296818
	ldr r0, _08296850
	b _08296A54
	.align 2, 0
_08296850: .4byte gUnknown_3001A78
_08296854:
	movs r1, #0
	cmp r0, #4
	bne _0829685C
	movs r1, #1
_0829685C:
	cmp r1, #0
	bne _0829689E
	movs r1, #0
	cmp r0, #2
	bne _08296868
	movs r1, #1
_08296868:
	cmp r1, #0
	beq _08296890
	movs r0, #0
	cmp r2, #2
	bne _08296874
	movs r0, #1
_08296874:
	cmp r0, #0
	beq _08296818
	mov r1, sl
	adds r0, r3, #0
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldr r0, [r3, #4]
	ldr r1, [r4, #4]
	ands r0, r1
	mov r6, sl
	str r0, [r6, #4]
	b _08296A52
_08296890:
	movs r1, #0
	ldr r0, [r3]
	cmp r0, #2
	bne _0829689A
	movs r1, #1
_0829689A:
	cmp r1, #0
	beq _082968A2
_0829689E:
	adds r0, r4, #0
	b _08296A54
_082968A2:
	ldr r0, [r3, #8]
	mov sb, r0
	ldr r1, [r4, #8]
	mov r8, r1
	ldr r6, [r3, #0xc]
	ldr r7, [r3, #0x10]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	str r0, [sp]
	str r1, [sp, #4]
	mov r1, sb
	mov r2, r8
	subs r0, r1, r2
	cmp r0, #0
	bge _082968C2
	rsbs r0, r0, #0
_082968C2:
	cmp r0, #0x3f
	bgt _08296940
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
	cmp sb, r8
	ble _0829690C
	mov r3, sb
	mov r4, r8
	subs r3, r3, r4
	mov r8, r3
_082968DA:
	movs r5, #1
	rsbs r5, r5, #0
	add r8, r5
	ldr r2, [sp]
	movs r0, #1
	ands r2, r0
	movs r3, #0
	ldr r1, [sp, #4]
	lsls r5, r1, #0x1f
	ldr r0, [sp]
	lsrs r4, r0, #1
	adds r0, r5, #0
	orrs r0, r4
	adds r4, r1, #0
	lsrs r1, r4, #1
	adds r5, r2, #0
	orrs r5, r0
	str r5, [sp]
	adds r4, r3, #0
	orrs r4, r1
	str r4, [sp, #4]
	mov r5, r8
	cmp r5, #0
	bne _082968DA
	mov r8, sb
_0829690C:
	cmp r8, sb
	ble _0829695C
	mov r0, r8
	mov r1, sb
	subs r0, r0, r1
	mov sb, r0
_08296918:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	movs r2, #1
	ands r2, r6
	movs r3, #0
	lsls r5, r7, #0x1f
	lsrs r4, r6, #1
	adds r0, r5, #0
	orrs r0, r4
	lsrs r1, r7, #1
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r3, #0
	orrs r7, r1
	mov r3, sb
	cmp r3, #0
	bne _08296918
	mov sb, r8
	b _0829695C
_08296940:
	cmp sb, r8
	ble _0829694E
	movs r0, #0
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	b _08296954
_0829694E:
	mov sb, r8
	movs r6, #0
	movs r7, #0
_08296954:
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
_0829695C:
	ldr r1, [sp, #8]
	cmp ip, r1
	beq _08296A04
	mov r2, ip
	cmp r2, #0
	beq _0829697E
	adds r1, r7, #0
	adds r0, r6, #0
	bl __negdi2
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r4, [sp]
	ldr r5, [sp, #4]
	adds r2, r2, r4
	adcs r3, r5
	b _0829698A
_0829697E:
	adds r3, r7, #0
	adds r2, r6, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	subs r2, r2, r0
	sbcs r3, r1
_0829698A:
	cmp r3, #0
	blt _082969A0
	movs r0, #0
	mov r1, sl
	str r0, [r1, #4]
	mov r4, sb
	str r4, [r1, #8]
	mov r5, sl
	str r2, [r5, #0xc]
	str r3, [r5, #0x10]
	b _082969B8
_082969A0:
	movs r0, #1
	mov r6, sl
	str r0, [r6, #4]
	mov r0, sb
	str r0, [r6, #8]
	adds r1, r3, #0
	adds r0, r2, #0
	bl __negdi2
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_082969B8:
	mov r4, sl
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
_082969C4:
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, _08296A00
	cmp r3, r0
	bhi _08296A1C
	cmp r3, r0
	bne _082969DA
	movs r0, #2
	rsbs r0, r0, #0
	cmp r2, r0
	bhi _08296A1C
_082969DA:
	mov r5, sl
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	mov r6, sl
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
	ldr r2, [r6, #8]
	subs r2, #1
	str r2, [r6, #8]
	movs r2, #1
	rsbs r2, r2, #0
	asrs r3, r2, #0x1f
	b _082969C4
	.align 2, 0
_08296A00: .4byte 0x0FFFFFFF
_08296A04:
	mov r0, ip
	mov r1, sl
	str r0, [r1, #4]
	mov r2, sb
	str r2, [r1, #8]
	ldr r3, [sp]
	ldr r4, [sp, #4]
	adds r6, r6, r3
	adcs r7, r4
	mov r4, sl
	str r6, [r4, #0xc]
	str r7, [r4, #0x10]
_08296A1C:
	movs r0, #3
	mov r5, sl
	str r0, [r5]
	ldr r1, [r5, #0x10]
	ldr r0, _08296A60
	cmp r1, r0
	bls _08296A52
	ldr r4, [r5, #0xc]
	ldr r5, [r5, #0x10]
	movs r2, #1
	adds r0, r4, #0
	ands r0, r2
	movs r1, #0
	lsls r6, r5, #0x1f
	mov r8, r6
	lsrs r6, r4, #1
	mov r2, r8
	orrs r2, r6
	lsrs r3, r5, #1
	orrs r0, r2
	orrs r1, r3
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
_08296A52:
	mov r0, sl
_08296A54:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08296A60: .4byte 0x1FFFFFFF
	thumb_func_end sub_082967F8

	thumb_func_start __adddf3
__adddf3: @ 0x08296A64
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl sub_082967F8
	bl __pack_d
	add sp, #0x4c
	pop {r4, pc}
	thumb_func_end __adddf3

	thumb_func_start __subdf3
__subdf3: @ 0x08296A94
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	ldr r0, [r4, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #4]
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl sub_082967F8
	bl __pack_d
	add sp, #0x4c
	pop {r4, pc}
	thumb_func_end __subdf3

	thumb_func_start __muldf3
__muldf3: @ 0x08296ACC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov r8, sp
	add r0, sp, #0x28
	mov sl, r0
	movs r0, #0
	ldr r1, [sp]
	cmp r1, #1
	bhi _08296B02
	movs r0, #1
_08296B02:
	cmp r0, #0
	bne _08296B66
	movs r2, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _08296B10
	movs r2, #1
_08296B10:
	cmp r2, #0
	beq _08296B18
	ldr r0, [sp, #4]
	b _08296B88
_08296B18:
	movs r2, #0
	cmp r1, #4
	bne _08296B20
	movs r2, #1
_08296B20:
	cmp r2, #0
	beq _08296B32
	movs r1, #0
	cmp r0, #2
	bne _08296B2C
	movs r1, #1
_08296B2C:
	cmp r1, #0
	bne _08296B4A
	b _08296B66
_08296B32:
	movs r2, #0
	cmp r0, #4
	bne _08296B3A
	movs r2, #1
_08296B3A:
	cmp r2, #0
	beq _08296B5A
	movs r0, #0
	cmp r1, #2
	bne _08296B46
	movs r0, #1
_08296B46:
	cmp r0, #0
	beq _08296B54
_08296B4A:
	ldr r0, _08296B50
	b _08296D52
	.align 2, 0
_08296B50: .4byte gUnknown_3001A78
_08296B54:
	mov r1, r8
	ldr r0, [r1, #4]
	b _08296B88
_08296B5A:
	movs r2, #0
	cmp r1, #2
	bne _08296B62
	movs r2, #1
_08296B62:
	cmp r2, #0
	beq _08296B78
_08296B66:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _08296D52
_08296B78:
	movs r1, #0
	cmp r0, #2
	bne _08296B80
	movs r1, #1
_08296B80:
	cmp r1, #0
	beq _08296B98
	mov r2, r8
	ldr r0, [r2, #4]
_08296B88:
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x18]
	adds r0, r4, #0
	b _08296D52
_08296B98:
	mov r4, r8
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r6, r0, #0
	movs r7, #0
	str r1, [sp, #0x4c]
	movs r5, #0
	str r5, [sp, #0x50]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	adds r4, r0, #0
	str r1, [sp, #0x54]
	movs r0, #0
	str r0, [sp, #0x58]
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	str r0, [sp, #0x5c]
	str r1, [sp, #0x60]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	str r0, [sp, #0x64]
	str r1, [sp, #0x68]
	movs r1, #0
	movs r2, #0
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	adds r3, r7, #0
	adds r2, r6, #0
	adds r2, r2, r4
	adcs r3, r5
	cmp r7, r3
	bhi _08296C10
	cmp r7, r3
	bne _08296C18
	cmp r6, r2
	bls _08296C18
_08296C10:
	ldr r5, _08296D68
	ldr r4, _08296D64
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_08296C18:
	adds r1, r2, #0
	movs r6, #0
	adds r7, r1, #0
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	adds r6, r6, r0
	adcs r7, r1
	cmp r1, r7
	bhi _08296C34
	ldr r1, [sp, #0x60]
	cmp r1, r7
	bne _08296C44
	cmp r0, r6
	bls _08296C44
_08296C34:
	movs r0, #1
	movs r1, #0
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	adds r4, r4, r0
	adcs r5, r1
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_08296C44:
	adds r0, r3, #0
	adds r2, r0, #0
	movs r3, #0
	adds r5, r3, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x64]
	ldr r1, [sp, #0x68]
	adds r4, r4, r0
	adcs r5, r1
	ldr r1, [sp, #0x6c]
	ldr r2, [sp, #0x70]
	adds r4, r4, r1
	adcs r5, r2
	mov r0, r8
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x1c]
	adds r2, r2, r0
	str r2, [sp, #0x30]
	mov r0, r8
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x18]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x2c]
	adds r2, #4
	str r2, [sp, #0x30]
	ldr r0, _08296D6C
	cmp r5, r0
	bls _08296CC6
	movs r1, #1
	mov sb, r1
	mov r8, r0
	mov ip, r2
_08296C8A:
	movs r2, #1
	add ip, r2
	mov r0, sb
	ands r0, r4
	cmp r0, #0
	beq _08296CB0
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r6, #0
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r1, r7
	adds r7, r1, #0
	adds r6, r0, #0
_08296CB0:
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, r8
	bhi _08296C8A
	mov r0, ip
	str r0, [sp, #0x30]
_08296CC6:
	ldr r0, _08296D70
	cmp r5, r0
	bhi _08296D18
	movs r1, #0x80
	lsls r1, r1, #0x18
	mov sb, r1
	mov r8, r0
	ldr r2, [sp, #0x30]
	mov ip, r2
_08296CD8:
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0
	mov r1, sb
	ands r1, r7
	orrs r0, r1
	cmp r0, #0
	beq _08296D02
	movs r0, #1
	orrs r0, r4
	adds r1, r5, #0
	adds r5, r1, #0
	adds r4, r0, #0
_08296D02:
	lsrs r3, r6, #0x1f
	lsls r2, r7, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r6, #1
	adds r7, r1, #0
	adds r6, r0, #0
	cmp r5, r8
	bls _08296CD8
	mov r1, ip
	str r1, [sp, #0x30]
_08296D18:
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _08296D46
	cmp r2, #0
	bne _08296D46
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _08296D3E
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	beq _08296D46
_08296D3E:
	movs r0, #0x80
	movs r1, #0
	adds r4, r4, r0
	adcs r5, r1
_08296D46:
	str r4, [sp, #0x34]
	str r5, [sp, #0x38]
	movs r0, #3
	mov r2, sl
	str r0, [r2]
	add r0, sp, #0x28
_08296D52:
	bl __pack_d
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08296D64: .4byte 0x00000000
_08296D68: .4byte 0x00000001
_08296D6C: .4byte 0x1FFFFFFF
_08296D70: .4byte 0x0FFFFFFF
	thumb_func_end __muldf3

	thumb_func_start __divdf3
__divdf3: @ 0x08296D74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov ip, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _08296D9E
	movs r0, #1
_08296D9E:
	cmp r0, #0
	beq _08296DA6
	mov r1, sp
	b _08296EE8
_08296DA6:
	movs r0, #0
	ldr r2, [sp, #0x14]
	adds r5, r2, #0
	cmp r2, #1
	bhi _08296DB2
	movs r0, #1
_08296DB2:
	cmp r0, #0
	beq _08296DBA
	adds r1, r4, #0
	b _08296EE8
_08296DBA:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _08296DCA
	movs r0, #1
_08296DCA:
	cmp r0, #0
	bne _08296DDA
	movs r4, #0
	cmp r3, #2
	bne _08296DD6
	movs r4, #1
_08296DD6:
	cmp r4, #0
	beq _08296DEC
_08296DDA:
	mov r1, ip
	ldr r0, [r1]
	cmp r0, r5
	beq _08296DE4
	b _08296EE8
_08296DE4:
	ldr r1, _08296DE8
	b _08296EE8
	.align 2, 0
_08296DE8: .4byte gUnknown_3001A78
_08296DEC:
	movs r0, #0
	cmp r2, #4
	bne _08296DF4
	movs r0, #1
_08296DF4:
	cmp r0, #0
	beq _08296E06
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r4, [sp, #8]
	mov r1, sp
	b _08296EE8
_08296E06:
	movs r0, #0
	cmp r2, #2
	bne _08296E0E
	movs r0, #1
_08296E0E:
	cmp r0, #0
	beq _08296E1A
	movs r0, #4
	mov r2, ip
	str r0, [r2]
	b _08296EE6
_08296E1A:
	mov r3, ip
	ldr r1, [r3, #8]
	ldr r0, [sp, #0x1c]
	subs r6, r1, r0
	str r6, [r3, #8]
	ldr r4, [r3, #0xc]
	ldr r5, [r3, #0x10]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r1, r5
	bhi _08296E3E
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bne _08296E52
	cmp r0, r4
	bls _08296E52
_08296E3E:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	subs r0, r6, #1
	mov r2, ip
	str r0, [r2, #8]
_08296E52:
	ldr r7, _08296EF8
	ldr r6, _08296EF4
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_08296E5E:
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bhi _08296E82
	cmp r1, r5
	bne _08296E6E
	ldr r2, [sp, #0x38]
	cmp r2, r4
	bhi _08296E82
_08296E6E:
	ldr r0, [sp, #0x40]
	orrs r0, r6
	ldr r1, [sp, #0x44]
	orrs r1, r7
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	subs r4, r4, r0
	sbcs r5, r1
_08296E82:
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	bne _08296E5E
	movs r0, #0xff
	ldr r1, [sp, #0x40]
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _08296EDC
	cmp r2, #0
	bne _08296EDC
	adds r0, #1
	ldr r1, [sp, #0x40]
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _08296ECC
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _08296EDC
_08296ECC:
	movs r0, #0x80
	movs r1, #0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
_08296EDC:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	mov r2, ip
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_08296EE6:
	mov r1, ip
_08296EE8:
	adds r0, r1, #0
	bl __pack_d
	add sp, #0x48
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08296EF4: .4byte 0x00000000
_08296EF8: .4byte 0x10000000
	thumb_func_end __divdf3

	thumb_func_start __fpcmp_parts_d
__fpcmp_parts_d: @ 0x08296EFC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0
	ldr r1, [r5]
	cmp r1, #1
	bhi _08296F0C
	movs r0, #1
_08296F0C:
	cmp r0, #0
	bne _08296F1E
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _08296F1A
	movs r0, #1
_08296F1A:
	cmp r0, #0
	beq _08296F22
_08296F1E:
	movs r0, #1
	b _08296FF8
_08296F22:
	movs r0, #0
	cmp r1, #4
	bne _08296F2A
	movs r0, #1
_08296F2A:
	cmp r0, #0
	beq _08296F42
	movs r0, #0
	cmp r2, #4
	bne _08296F36
	movs r0, #1
_08296F36:
	cmp r0, #0
	beq _08296F42
	ldr r0, [r6, #4]
	ldr r1, [r5, #4]
	subs r0, r0, r1
	b _08296FF8
_08296F42:
	movs r1, #0
	ldr r0, [r5]
	cmp r0, #4
	bne _08296F4C
	movs r1, #1
_08296F4C:
	cmp r1, #0
	bne _08296F9A
	movs r1, #0
	cmp r2, #4
	bne _08296F58
	movs r1, #1
_08296F58:
	cmp r1, #0
	beq _08296F6A
_08296F5C:
	ldr r0, [r6, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _08296FA4
	movs r1, #1
	b _08296FA4
_08296F6A:
	movs r1, #0
	cmp r0, #2
	bne _08296F72
	movs r1, #1
_08296F72:
	cmp r1, #0
	beq _08296F82
	movs r1, #0
	cmp r2, #2
	bne _08296F7E
	movs r1, #1
_08296F7E:
	cmp r1, #0
	bne _08296FF6
_08296F82:
	movs r1, #0
	cmp r0, #2
	bne _08296F8A
	movs r1, #1
_08296F8A:
	cmp r1, #0
	bne _08296F5C
	movs r0, #0
	cmp r2, #2
	bne _08296F96
	movs r0, #1
_08296F96:
	cmp r0, #0
	beq _08296FA8
_08296F9A:
	ldr r0, [r5, #4]
	movs r1, #1
	cmp r0, #0
	beq _08296FA4
	subs r1, #2
_08296FA4:
	adds r0, r1, #0
	b _08296FF8
_08296FA8:
	ldr r0, [r6, #4]
	ldr r4, [r5, #4]
	cmp r4, r0
	beq _08296FBA
_08296FB0:
	movs r0, #1
	cmp r4, #0
	beq _08296FF8
	subs r0, #2
	b _08296FF8
_08296FBA:
	ldr r1, [r5, #8]
	ldr r0, [r6, #8]
	cmp r1, r0
	bgt _08296FB0
	cmp r1, r0
	bge _08296FD2
_08296FC6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, #0
	beq _08296FF8
	movs r0, #1
	b _08296FF8
_08296FD2:
	ldr r3, [r5, #0x10]
	ldr r2, [r6, #0x10]
	cmp r3, r2
	bhi _08296FB0
	cmp r3, r2
	bne _08296FE6
	ldr r1, [r5, #0xc]
	ldr r0, [r6, #0xc]
	cmp r1, r0
	bhi _08296FB0
_08296FE6:
	cmp r2, r3
	bhi _08296FC6
	cmp r2, r3
	bne _08296FF6
	ldr r1, [r6, #0xc]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bhi _08296FC6
_08296FF6:
	movs r0, #0
_08296FF8:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end __fpcmp_parts_d

	thumb_func_start __cmpdf2
__cmpdf2: @ 0x08296FFC
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __cmpdf2

	thumb_func_start __eqdf2
__eqdf2: @ 0x08297028
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08297050
	movs r1, #1
_08297050:
	cmp r1, #0
	bne _08297062
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _0829705E
	movs r1, #1
_0829705E:
	cmp r1, #0
	beq _08297066
_08297062:
	movs r0, #1
	b _0829706E
_08297066:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_0829706E:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __eqdf2

	thumb_func_start __nedf2
__nedf2: @ 0x08297074
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _0829709C
	movs r1, #1
_0829709C:
	cmp r1, #0
	bne _082970AE
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _082970AA
	movs r1, #1
_082970AA:
	cmp r1, #0
	beq _082970B2
_082970AE:
	movs r0, #1
	b _082970BA
_082970B2:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_082970BA:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __nedf2

	thumb_func_start __gtdf2
__gtdf2: @ 0x082970C0
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _082970E8
	movs r1, #1
_082970E8:
	cmp r1, #0
	bne _082970FA
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _082970F6
	movs r1, #1
_082970F6:
	cmp r1, #0
	beq _08297100
_082970FA:
	movs r0, #1
	rsbs r0, r0, #0
	b _08297108
_08297100:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_08297108:
	add sp, #0x38
	pop {r4, pc}
	thumb_func_end __gtdf2

	thumb_func_start __gedf2
__gedf2: @ 0x0829710C
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08297134
	movs r1, #1
_08297134:
	cmp r1, #0
	bne _08297146
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _08297142
	movs r1, #1
_08297142:
	cmp r1, #0
	beq _0829714C
_08297146:
	movs r0, #1
	rsbs r0, r0, #0
	b _08297154
_0829714C:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_08297154:
	add sp, #0x38
	pop {r4, pc}
	thumb_func_end __gedf2

	thumb_func_start __ltdf2
__ltdf2: @ 0x08297158
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08297180
	movs r1, #1
_08297180:
	cmp r1, #0
	bne _08297192
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _0829718E
	movs r1, #1
_0829718E:
	cmp r1, #0
	beq _08297196
_08297192:
	movs r0, #1
	b _0829719E
_08297196:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_0829719E:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __ltdf2

	thumb_func_start __ledf2
__ledf2: @ 0x082971A4
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _082971CC
	movs r1, #1
_082971CC:
	cmp r1, #0
	bne _082971DE
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _082971DA
	movs r1, #1
_082971DA:
	cmp r1, #0
	beq _082971E2
_082971DE:
	movs r0, #1
	b _082971EA
_082971E2:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_082971EA:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __ledf2

	thumb_func_start __floatsidf
__floatsidf: @ 0x082971F0
	push {r4, r5, lr}
	sub sp, #0x14
	adds r2, r0, #0
	movs r0, #3
	str r0, [sp]
	lsrs r1, r2, #0x1f
	str r1, [sp, #4]
	cmp r2, #0
	bne _08297208
	movs r0, #2
	str r0, [sp]
	b _0829725E
_08297208:
	movs r0, #0x3c
	str r0, [sp, #8]
	cmp r1, #0
	beq _0829722E
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r2, r0
	bne _08297228
	ldr r1, _08297224
	ldr r0, _08297220
	b _08297264
	.align 2, 0
_08297220: .4byte 0xC1E00000
_08297224: .4byte 0x00000000
_08297228:
	rsbs r0, r2, #0
	asrs r1, r0, #0x1f
	b _08297232
_0829722E:
	adds r0, r2, #0
	asrs r1, r2, #0x1f
_08297232:
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x10]
	ldr r1, _08297268
	cmp r0, r1
	bhi _0829725E
	adds r5, r1, #0
	ldr r4, [sp, #8]
_08297242:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	subs r4, #1
	ldr r0, [sp, #0x10]
	cmp r0, r5
	bls _08297242
	str r4, [sp, #8]
_0829725E:
	mov r0, sp
	bl __pack_d
_08297264:
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_08297268: .4byte 0x0FFFFFFF
	thumb_func_end __floatsidf

	thumb_func_start __fixdfsi
__fixdfsi: @ 0x0829726C
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _08297286
	movs r1, #1
_08297286:
	cmp r1, #0
	bne _082972BA
	movs r1, #0
	cmp r0, #1
	bhi _08297292
	movs r1, #1
_08297292:
	cmp r1, #0
	bne _082972BA
	movs r1, #0
	cmp r0, #4
	bne _0829729E
	movs r1, #1
_0829729E:
	cmp r1, #0
	beq _082972B4
_082972A2:
	ldr r0, [sp, #4]
	ldr r1, _082972B0
	cmp r0, #0
	beq _082972D8
	adds r1, #1
	b _082972D8
	.align 2, 0
_082972B0: .4byte 0x7FFFFFFF
_082972B4:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _082972BE
_082972BA:
	movs r0, #0
	b _082972DA
_082972BE:
	cmp r0, #0x1e
	bgt _082972A2
	movs r2, #0x3c
	subs r2, r2, r0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __lshrdi3
	adds r1, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _082972D8
	rsbs r1, r1, #0
_082972D8:
	adds r0, r1, #0
_082972DA:
	add sp, #0x1c
	pop {pc}
	.align 2, 0
	thumb_func_end __fixdfsi

	thumb_func_start __negdf2
__negdf2: @ 0x082972E0
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _082972FA
	movs r1, #1
_082972FA:
	str r1, [sp, #4]
	mov r0, sp
	bl __pack_d
	add sp, #0x1c
	pop {pc}
	.align 2, 0
	thumb_func_end __negdf2

	thumb_func_start __make_dp
__make_dp: @ 0x08297308
	sub sp, #4
	push {r4, lr}
	sub sp, #0x14
	str r3, [sp, #0x1c]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, sp
	bl __pack_d
	add sp, #0x14
	pop {r4}
	pop {r3}
	add sp, #4
	bx r3
	.align 2, 0
	thumb_func_end __make_dp

	thumb_func_start __truncdfsf2
__truncdfsf2: @ 0x08297330
	push {r4, r5, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	lsls r5, r3, #2
	lsrs r4, r2, #0x1e
	adds r0, r5, #0
	orrs r0, r4
	adds r5, r0, #0
	ldr r4, _08297370
	adds r0, r2, #0
	ands r0, r4
	movs r1, #0
	orrs r0, r1
	cmp r0, #0
	beq _08297360
	movs r0, #1
	orrs r5, r0
_08297360:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r3, r5, #0
	bl __make_fp
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_08297370: .4byte 0x3FFFFFFF
	thumb_func_end __truncdfsf2

	thumb_func_start __pack_f
__pack_f: @ 0x08297374
	push {r4, r5, r6, lr}
	ldr r2, [r0, #0xc]
	ldr r6, [r0, #4]
	movs r5, #0
	movs r1, #0
	ldr r3, [r0]
	cmp r3, #1
	bhi _08297386
	movs r1, #1
_08297386:
	cmp r1, #0
	beq _08297394
	movs r5, #0xff
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r2, r0
	b _082973FA
_08297394:
	movs r1, #0
	cmp r3, #4
	bne _0829739C
	movs r1, #1
_0829739C:
	cmp r1, #0
	bne _082973D0
	movs r1, #0
	cmp r3, #2
	bne _082973A8
	movs r1, #1
_082973A8:
	cmp r1, #0
	beq _082973B0
	movs r2, #0
	b _082973FA
_082973B0:
	cmp r2, #0
	beq _082973FA
	ldr r0, [r0, #8]
	movs r3, #0x7e
	rsbs r3, r3, #0
	cmp r0, r3
	bge _082973CC
	subs r0, r3, r0
	cmp r0, #0x19
	ble _082973C8
	movs r2, #0
	b _082973F8
_082973C8:
	lsrs r2, r0
	b _082973F8
_082973CC:
	cmp r0, #0x7f
	ble _082973D6
_082973D0:
	movs r5, #0xff
	movs r2, #0
	b _082973FA
_082973D6:
	adds r5, r0, #0
	adds r5, #0x7f
	movs r0, #0x7f
	ands r0, r2
	cmp r0, #0x40
	bne _082973EE
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _082973F0
	adds r2, #0x40
	b _082973F0
_082973EE:
	adds r2, #0x3f
_082973F0:
	cmp r2, #0
	bge _082973F8
	lsrs r2, r2, #1
	adds r5, #1
_082973F8:
	lsrs r2, r2, #7
_082973FA:
	ldr r0, _0829741C
	ands r2, r0
	ldr r0, _08297420
	ands r4, r0
	orrs r4, r2
	movs r0, #0xff
	ands r5, r0
	lsls r1, r5, #0x17
	ldr r0, _08297424
	ands r4, r0
	orrs r4, r1
	lsls r1, r6, #0x1f
	ldr r0, _08297428
	ands r4, r0
	orrs r4, r1
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0829741C: .4byte 0x007FFFFF
_08297420: .4byte 0xFF800000
_08297424: .4byte 0x807FFFFF
_08297428: .4byte 0x7FFFFFFF
	thumb_func_end __pack_f

	thumb_func_start __unpack_f
__unpack_f: @ 0x0829742C
	push {r4, lr}
	adds r3, r1, #0
	ldr r0, [r0]
	lsls r1, r0, #9
	lsrs r2, r1, #9
	lsls r1, r0, #1
	lsrs r1, r1, #0x18
	lsrs r0, r0, #0x1f
	str r0, [r3, #4]
	cmp r1, #0
	bne _08297470
	cmp r2, #0
	bne _0829744C
	movs r0, #2
	str r0, [r3]
	b _082974A4
_0829744C:
	adds r4, r1, #0
	subs r4, #0x7e
	str r4, [r3, #8]
	lsls r2, r2, #7
	movs r0, #3
	str r0, [r3]
	ldr r1, _0829746C
	cmp r2, r1
	bhi _0829748C
	adds r0, r4, #0
_08297460:
	lsls r2, r2, #1
	subs r0, #1
	cmp r2, r1
	bls _08297460
	str r0, [r3, #8]
	b _0829748C
	.align 2, 0
_0829746C: .4byte 0x3FFFFFFF
_08297470:
	cmp r1, #0xff
	bne _08297490
	cmp r2, #0
	bne _0829747E
	movs r0, #4
	str r0, [r3]
	b _082974A4
_0829747E:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _0829748A
	movs r0, #1
_0829748A:
	str r0, [r3]
_0829748C:
	str r2, [r3, #0xc]
	b _082974A4
_08297490:
	adds r0, r1, #0
	subs r0, #0x7f
	str r0, [r3, #8]
	movs r0, #3
	str r0, [r3]
	lsls r0, r2, #7
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3, #0xc]
_082974A4:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __unpack_f

	thumb_func_start sub_082974A8
sub_082974A8: @ 0x082974A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _082974BE
	movs r0, #1
_082974BE:
	cmp r0, #0
	beq _082974C6
_082974C2:
	adds r0, r6, #0
	b _0829761C
_082974C6:
	movs r1, #0
	ldr r0, [r7]
	cmp r0, #1
	bhi _082974D0
	movs r1, #1
_082974D0:
	cmp r1, #0
	bne _08297544
	movs r1, #0
	cmp r2, #4
	bne _082974DC
	movs r1, #1
_082974DC:
	cmp r1, #0
	beq _082974FC
	movs r1, #0
	cmp r0, #4
	bne _082974E8
	movs r1, #1
_082974E8:
	cmp r1, #0
	beq _082974C2
	ldr r1, [r6, #4]
	ldr r0, [r7, #4]
	cmp r1, r0
	beq _082974C2
	ldr r0, _082974F8
	b _0829761C
	.align 2, 0
_082974F8: .4byte gUnknown_3001A90
_082974FC:
	movs r1, #0
	cmp r0, #4
	bne _08297504
	movs r1, #1
_08297504:
	cmp r1, #0
	bne _08297544
	movs r1, #0
	cmp r0, #2
	bne _08297510
	movs r1, #1
_08297510:
	cmp r1, #0
	beq _08297536
	movs r0, #0
	cmp r2, #2
	bne _0829751C
	movs r0, #1
_0829751C:
	cmp r0, #0
	beq _082974C2
	adds r1, r5, #0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #4]
	ldr r1, [r7, #4]
	ands r0, r1
	str r0, [r5, #4]
	b _0829761A
_08297536:
	movs r1, #0
	ldr r0, [r6]
	cmp r0, #2
	bne _08297540
	movs r1, #1
_08297540:
	cmp r1, #0
	beq _08297548
_08297544:
	adds r0, r7, #0
	b _0829761C
_08297548:
	ldr r1, [r6, #8]
	ldr r3, [r7, #8]
	ldr r2, [r6, #0xc]
	ldr r4, [r7, #0xc]
	subs r0, r1, r3
	cmp r0, #0
	bge _08297558
	rsbs r0, r0, #0
_08297558:
	cmp r0, #0x1f
	bgt _0829759C
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
	cmp r1, r3
	ble _0829757E
	movs r7, #1
	mov ip, r7
	subs r3, r1, r3
_0829756C:
	subs r3, #1
	adds r0, r4, #0
	mov r7, ip
	ands r0, r7
	lsrs r4, r4, #1
	orrs r4, r0
	cmp r3, #0
	bne _0829756C
	adds r3, r1, #0
_0829757E:
	cmp r3, r1
	ble _082975AE
	movs r0, #1
	mov ip, r0
	subs r1, r3, r1
_08297588:
	subs r1, #1
	adds r0, r2, #0
	mov r7, ip
	ands r0, r7
	lsrs r2, r2, #1
	orrs r2, r0
	cmp r1, #0
	bne _08297588
	adds r1, r3, #0
	b _082975AE
_0829759C:
	cmp r1, r3
	ble _082975A4
	movs r4, #0
	b _082975A8
_082975A4:
	adds r1, r3, #0
	movs r2, #0
_082975A8:
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
_082975AE:
	cmp r6, r8
	beq _082975F8
	cmp r6, #0
	beq _082975BA
	subs r3, r4, r2
	b _082975BC
_082975BA:
	subs r3, r2, r4
_082975BC:
	cmp r3, #0
	blt _082975CA
	movs r0, #0
	str r0, [r5, #4]
	str r1, [r5, #8]
	str r3, [r5, #0xc]
	b _082975D4
_082975CA:
	movs r0, #1
	str r0, [r5, #4]
	str r1, [r5, #8]
	rsbs r0, r3, #0
	str r0, [r5, #0xc]
_082975D4:
	ldr r1, [r5, #0xc]
	subs r0, r1, #1
	ldr r2, _082975F4
	cmp r0, r2
	bhi _08297600
_082975DE:
	lsls r0, r1, #1
	str r0, [r5, #0xc]
	ldr r1, [r5, #8]
	subs r1, #1
	str r1, [r5, #8]
	adds r1, r0, #0
	subs r0, r1, #1
	cmp r0, r2
	bls _082975DE
	b _08297600
	.align 2, 0
_082975F4: .4byte 0x3FFFFFFE
_082975F8:
	str r6, [r5, #4]
	str r1, [r5, #8]
	adds r0, r2, r4
	str r0, [r5, #0xc]
_08297600:
	movs r0, #3
	str r0, [r5]
	ldr r1, [r5, #0xc]
	cmp r1, #0
	bge _0829761A
	movs r0, #1
	ands r0, r1
	lsrs r1, r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	ldr r0, [r5, #8]
	adds r0, #1
	str r0, [r5, #8]
_0829761A:
	adds r0, r5, #0
_0829761C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end sub_082974A8

	thumb_func_start __addsf3
__addsf3: @ 0x08297624
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	add r2, sp, #0x20
	mov r0, sp
	adds r1, r4, #0
	bl sub_082974A8
	bl __pack_f
	add sp, #0x38
	pop {r4, pc}
	thumb_func_end __addsf3

	thumb_func_start __subsf3
__subsf3: @ 0x08297650
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	ldr r0, [r4, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #4]
	add r2, sp, #0x20
	mov r0, sp
	adds r1, r4, #0
	bl sub_082974A8
	bl __pack_f
	add sp, #0x38
	pop {r4, pc}
	thumb_func_end __subsf3

	thumb_func_start __mulsf3
__mulsf3: @ 0x08297684
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r7, sp
	add r0, sp, #0x20
	mov r8, r0
	movs r0, #0
	ldr r1, [sp]
	mov sb, r8
	cmp r1, #1
	bhi _082976B6
	movs r0, #1
_082976B6:
	cmp r0, #0
	bne _08297714
	movs r2, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _082976C4
	movs r2, #1
_082976C4:
	cmp r2, #0
	beq _082976CC
	ldr r0, [sp, #4]
	b _08297734
_082976CC:
	movs r2, #0
	cmp r1, #4
	bne _082976D4
	movs r2, #1
_082976D4:
	cmp r2, #0
	beq _082976E6
	movs r1, #0
	cmp r0, #2
	bne _082976E0
	movs r1, #1
_082976E0:
	cmp r1, #0
	bne _082976FE
	b _08297714
_082976E6:
	movs r2, #0
	cmp r0, #4
	bne _082976EE
	movs r2, #1
_082976EE:
	cmp r2, #0
	beq _08297708
	movs r0, #0
	cmp r1, #2
	bne _082976FA
	movs r0, #1
_082976FA:
	cmp r0, #0
	beq _08297732
_082976FE:
	ldr r0, _08297704
	b _082977D6
	.align 2, 0
_08297704: .4byte gUnknown_3001A90
_08297708:
	movs r2, #0
	cmp r1, #2
	bne _08297710
	movs r2, #1
_08297710:
	cmp r2, #0
	beq _08297726
_08297714:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _082977D6
_08297726:
	movs r1, #0
	cmp r0, #2
	bne _0829772E
	movs r1, #1
_0829772E:
	cmp r1, #0
	beq _08297744
_08297732:
	ldr r0, [r7, #4]
_08297734:
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x14]
	adds r0, r4, #0
	b _082977D6
_08297744:
	ldr r0, [r7, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x1c]
	movs r3, #0
	bl __muldi3
	adds r2, r1, #0
	adds r5, r2, #0
	adds r6, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [sp, #0x18]
	adds r4, r4, r0
	str r4, [sp, #0x28]
	ldr r1, [r7, #4]
	ldr r0, [sp, #0x14]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x24]
	adds r4, #2
	str r4, [sp, #0x28]
	cmp r2, #0
	bge _08297790
	movs r2, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
_0829777A:
	adds r4, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _08297788
	lsrs r6, r6, #1
	orrs r6, r1
_08297788:
	lsrs r5, r5, #1
	cmp r5, #0
	blt _0829777A
	str r4, [sp, #0x28]
_08297790:
	ldr r0, _082977E4
	cmp r5, r0
	bhi _082977B6
	movs r4, #0x80
	lsls r4, r4, #0x18
	movs r3, #1
	adds r2, r0, #0
	ldr r1, [sp, #0x28]
_082977A0:
	subs r1, #1
	lsls r5, r5, #1
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	beq _082977AE
	orrs r5, r3
_082977AE:
	lsls r6, r6, #1
	cmp r5, r2
	bls _082977A0
	str r1, [sp, #0x28]
_082977B6:
	movs r0, #0x7f
	ands r0, r5
	cmp r0, #0x40
	bne _082977CC
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _082977CA
	cmp r6, #0
	beq _082977CC
_082977CA:
	adds r5, #0x40
_082977CC:
	str r5, [sp, #0x2c]
	movs r0, #3
	mov r1, r8
	str r0, [r1]
	mov r0, sb
_082977D6:
	bl __pack_f
	add sp, #0x38
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_082977E4: .4byte 0x3FFFFFFF
	thumb_func_end __mulsf3

	thumb_func_start __divsf3
__divsf3: @ 0x082977E8
	push {r4, r5, r6, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r5, sp, #0x10
	adds r1, r5, #0
	bl __unpack_f
	mov r4, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _0829780E
	movs r0, #1
_0829780E:
	cmp r0, #0
	beq _08297816
	mov r1, sp
	b _082978C8
_08297816:
	movs r0, #0
	ldr r2, [sp, #0x10]
	adds r6, r2, #0
	cmp r2, #1
	bhi _08297822
	movs r0, #1
_08297822:
	cmp r0, #0
	beq _0829782A
	adds r1, r5, #0
	b _082978C8
_0829782A:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _0829783A
	movs r0, #1
_0829783A:
	cmp r0, #0
	bne _0829784A
	movs r0, #0
	cmp r3, #2
	bne _08297846
	movs r0, #1
_08297846:
	cmp r0, #0
	beq _0829785C
_0829784A:
	ldr r0, [r4]
	adds r1, r4, #0
	cmp r0, r6
	bne _082978C8
	ldr r1, _08297858
	b _082978C8
	.align 2, 0
_08297858: .4byte gUnknown_3001A90
_0829785C:
	movs r1, #0
	cmp r2, #4
	bne _08297864
	movs r1, #1
_08297864:
	cmp r1, #0
	beq _08297870
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r1, sp
	b _082978C8
_08297870:
	movs r0, #0
	cmp r2, #2
	bne _08297878
	movs r0, #1
_08297878:
	cmp r0, #0
	beq _08297882
	movs r0, #4
	str r0, [r4]
	b _082978C6
_08297882:
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x18]
	subs r0, r1, r0
	str r0, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	bhs _08297898
	lsls r2, r2, #1
	subs r0, #1
	str r0, [r4, #8]
_08297898:
	movs r0, #0x80
	lsls r0, r0, #0x17
	movs r1, #0
_0829789E:
	cmp r2, r3
	blo _082978A6
	orrs r1, r0
	subs r2, r2, r3
_082978A6:
	lsrs r0, r0, #1
	lsls r2, r2, #1
	cmp r0, #0
	bne _0829789E
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x40
	bne _082978C4
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _082978C2
	cmp r2, #0
	beq _082978C4
_082978C2:
	adds r1, #0x40
_082978C4:
	str r1, [r4, #0xc]
_082978C6:
	adds r1, r4, #0
_082978C8:
	adds r0, r1, #0
	bl __pack_f
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end __divsf3

	thumb_func_start __fpcmp_parts_f
__fpcmp_parts_f: @ 0x082978D4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	ldr r2, [r4]
	cmp r2, #1
	bhi _082978E2
	movs r0, #1
_082978E2:
	cmp r0, #0
	bne _082978F4
	movs r0, #0
	ldr r3, [r1]
	cmp r3, #1
	bhi _082978F0
	movs r0, #1
_082978F0:
	cmp r0, #0
	beq _082978F8
_082978F4:
	movs r0, #1
	b _082979B6
_082978F8:
	movs r0, #0
	cmp r2, #4
	bne _08297900
	movs r0, #1
_08297900:
	cmp r0, #0
	beq _08297918
	movs r0, #0
	cmp r3, #4
	bne _0829790C
	movs r0, #1
_0829790C:
	cmp r0, #0
	beq _08297918
	ldr r0, [r1, #4]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	b _082979B6
_08297918:
	movs r2, #0
	ldr r0, [r4]
	cmp r0, #4
	bne _08297922
	movs r2, #1
_08297922:
	cmp r2, #0
	bne _08297970
	movs r2, #0
	cmp r3, #4
	bne _0829792E
	movs r2, #1
_0829792E:
	cmp r2, #0
	beq _08297940
_08297932:
	ldr r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _0829797A
	movs r1, #1
	b _0829797A
_08297940:
	movs r2, #0
	cmp r0, #2
	bne _08297948
	movs r2, #1
_08297948:
	cmp r2, #0
	beq _08297958
	movs r2, #0
	cmp r3, #2
	bne _08297954
	movs r2, #1
_08297954:
	cmp r2, #0
	bne _082979B4
_08297958:
	movs r2, #0
	cmp r0, #2
	bne _08297960
	movs r2, #1
_08297960:
	cmp r2, #0
	bne _08297932
	movs r0, #0
	cmp r3, #2
	bne _0829796C
	movs r0, #1
_0829796C:
	cmp r0, #0
	beq _0829797E
_08297970:
	ldr r0, [r4, #4]
	movs r1, #1
	cmp r0, #0
	beq _0829797A
	subs r1, #2
_0829797A:
	adds r0, r1, #0
	b _082979B6
_0829797E:
	ldr r3, [r4, #4]
	ldr r0, [r1, #4]
	cmp r3, r0
	beq _08297990
_08297986:
	movs r0, #1
	cmp r3, #0
	beq _082979B6
	subs r0, #2
	b _082979B6
_08297990:
	ldr r2, [r4, #8]
	ldr r0, [r1, #8]
	cmp r2, r0
	bgt _08297986
	cmp r2, r0
	bge _082979A8
_0829799C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, #0
	beq _082979B6
	movs r0, #1
	b _082979B6
_082979A8:
	ldr r0, [r4, #0xc]
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bhi _08297986
	cmp r0, r1
	blo _0829799C
_082979B4:
	movs r0, #0
_082979B6:
	pop {r4, pc}
	thumb_func_end __fpcmp_parts_f

	thumb_func_start __cmpsf2
__cmpsf2: @ 0x082979B8
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __cmpsf2

	thumb_func_start __eqsf2
__eqsf2: @ 0x082979E0
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08297A04
	movs r1, #1
_08297A04:
	cmp r1, #0
	bne _08297A16
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08297A12
	movs r1, #1
_08297A12:
	cmp r1, #0
	beq _08297A1A
_08297A16:
	movs r0, #1
	b _08297A22
_08297A1A:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08297A22:
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __eqsf2

	thumb_func_start __nesf2
__nesf2: @ 0x08297A28
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08297A4C
	movs r1, #1
_08297A4C:
	cmp r1, #0
	bne _08297A5E
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08297A5A
	movs r1, #1
_08297A5A:
	cmp r1, #0
	beq _08297A62
_08297A5E:
	movs r0, #1
	b _08297A6A
_08297A62:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08297A6A:
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __nesf2

	thumb_func_start __gtsf2
__gtsf2: @ 0x08297A70
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08297A94
	movs r1, #1
_08297A94:
	cmp r1, #0
	bne _08297AA6
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08297AA2
	movs r1, #1
_08297AA2:
	cmp r1, #0
	beq _08297AAC
_08297AA6:
	movs r0, #1
	rsbs r0, r0, #0
	b _08297AB4
_08297AAC:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08297AB4:
	add sp, #0x28
	pop {r4, pc}
	thumb_func_end __gtsf2

	thumb_func_start __gesf2
__gesf2: @ 0x08297AB8
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08297ADC
	movs r1, #1
_08297ADC:
	cmp r1, #0
	bne _08297AEE
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08297AEA
	movs r1, #1
_08297AEA:
	cmp r1, #0
	beq _08297AF4
_08297AEE:
	movs r0, #1
	rsbs r0, r0, #0
	b _08297AFC
_08297AF4:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08297AFC:
	add sp, #0x28
	pop {r4, pc}
	thumb_func_end __gesf2

	thumb_func_start __ltsf2
__ltsf2: @ 0x08297B00
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08297B24
	movs r1, #1
_08297B24:
	cmp r1, #0
	bne _08297B36
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08297B32
	movs r1, #1
_08297B32:
	cmp r1, #0
	beq _08297B3A
_08297B36:
	movs r0, #1
	b _08297B42
_08297B3A:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08297B42:
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __ltsf2

	thumb_func_start __lesf2
__lesf2: @ 0x08297B48
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08297B6C
	movs r1, #1
_08297B6C:
	cmp r1, #0
	bne _08297B7E
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08297B7A
	movs r1, #1
_08297B7A:
	cmp r1, #0
	beq _08297B82
_08297B7E:
	movs r0, #1
	b _08297B8A
_08297B82:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08297B8A:
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __lesf2

	thumb_func_start __floatsisf
__floatsisf: @ 0x08297B90
	push {lr}
	sub sp, #0x10
	adds r1, r0, #0
	movs r0, #3
	str r0, [sp]
	lsrs r2, r1, #0x1f
	str r2, [sp, #4]
	cmp r1, #0
	bne _08297BA8
	movs r0, #2
	str r0, [sp]
	b _08297BE0
_08297BA8:
	movs r0, #0x1e
	str r0, [sp, #8]
	cmp r2, #0
	beq _08297BC6
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r1, r0
	bne _08297BC0
	ldr r0, _08297BBC
	b _08297BE6
	.align 2, 0
_08297BBC: .4byte 0xCF000000
_08297BC0:
	rsbs r0, r1, #0
	str r0, [sp, #0xc]
	b _08297BC8
_08297BC6:
	str r1, [sp, #0xc]
_08297BC8:
	ldr r2, [sp, #0xc]
	ldr r3, _08297BEC
	cmp r2, r3
	bhi _08297BE0
	ldr r1, [sp, #8]
_08297BD2:
	lsls r0, r2, #1
	subs r1, #1
	adds r2, r0, #0
	cmp r0, r3
	bls _08297BD2
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_08297BE0:
	mov r0, sp
	bl __pack_f
_08297BE6:
	add sp, #0x10
	pop {pc}
	.align 2, 0
_08297BEC: .4byte 0x3FFFFFFF
	thumb_func_end __floatsisf

	thumb_func_start __fixsfsi
__fixsfsi: @ 0x08297BF0
	push {lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	mov r1, sp
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _08297C08
	movs r1, #1
_08297C08:
	cmp r1, #0
	bne _08297C3A
	movs r1, #0
	cmp r0, #1
	bhi _08297C14
	movs r1, #1
_08297C14:
	cmp r1, #0
	bne _08297C3A
	movs r1, #0
	cmp r0, #4
	bne _08297C20
	movs r1, #1
_08297C20:
	cmp r1, #0
	beq _08297C34
_08297C24:
	ldr r0, [sp, #4]
	ldr r1, _08297C30
	cmp r0, #0
	beq _08297C52
	adds r1, #1
	b _08297C52
	.align 2, 0
_08297C30: .4byte 0x7FFFFFFF
_08297C34:
	ldr r1, [sp, #8]
	cmp r1, #0
	bge _08297C3E
_08297C3A:
	movs r0, #0
	b _08297C54
_08297C3E:
	cmp r1, #0x1e
	bgt _08297C24
	movs r0, #0x1e
	subs r0, r0, r1
	ldr r1, [sp, #0xc]
	lsrs r1, r0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _08297C52
	rsbs r1, r1, #0
_08297C52:
	adds r0, r1, #0
_08297C54:
	add sp, #0x14
	pop {pc}
	thumb_func_end __fixsfsi

	thumb_func_start __negsf2
__negsf2: @ 0x08297C58
	push {lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	mov r1, sp
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _08297C70
	movs r1, #1
_08297C70:
	str r1, [sp, #4]
	mov r0, sp
	bl __pack_f
	add sp, #0x14
	pop {pc}
	thumb_func_end __negsf2

	thumb_func_start __make_fp
__make_fp: @ 0x08297C7C
	push {lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, sp
	bl __pack_f
	add sp, #0x10
	pop {pc}
	.align 2, 0
	thumb_func_end __make_fp

	thumb_func_start __extendsfdf2
__extendsfdf2: @ 0x08297C94
	push {r4, r5, r6, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	add r0, sp, #0x14
	add r1, sp, #4
	bl __unpack_f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	movs r4, #0
	lsrs r6, r3, #2
	lsls r5, r4, #0x1e
	adds r4, r6, #0
	orrs r4, r5
	lsls r3, r3, #0x1e
	str r4, [sp]
	bl __make_dp
	add sp, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end __extendsfdf2

	thumb_func_start __lshrdi3
__lshrdi3: @ 0x08297CC0
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _08297CF0
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _08297CDC
	movs r4, #0
	rsbs r0, r0, #0
	adds r3, r6, #0
	lsrs r3, r0
	b _08297CEC
_08297CDC:
	adds r1, r6, #0
	lsls r1, r0
	adds r4, r6, #0
	lsrs r4, r2
	adds r0, r5, #0
	lsrs r0, r2
	adds r3, r0, #0
	orrs r3, r1
_08297CEC:
	adds r1, r4, #0
	adds r0, r3, #0
_08297CF0:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end __lshrdi3

	thumb_func_start __negdi2
__negdi2: @ 0x08297CF4
	push {r4, lr}
	rsbs r2, r0, #0
	adds r3, r2, #0
	rsbs r1, r1, #0
	cmp r2, #0
	beq _08297D02
	subs r1, #1
_08297D02:
	adds r4, r1, #0
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end __negdi2
