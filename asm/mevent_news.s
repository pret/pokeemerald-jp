.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GenerateRandomNews
GenerateRandomNews: @ 0x0801D978
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0801AB1C
	adds r5, r0, #0
	movs r0, #3
	adds r1, r4, #0
	ands r1, r0
	ldrb r2, [r5]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	cmp r4, #2
	bhi _0801D99E
	cmp r4, #1
	bhs _0801D9A4
	b _0801D9C8
_0801D99E:
	cmp r4, #3
	beq _0801D9B6
	b _0801D9C8
_0801D9A4:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf
	bl __umodsi3
	adds r0, #0x10
	b _0801D9C6
_0801D9B6:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf
	bl __umodsi3
	adds r0, #1
_0801D9C6:
	strb r0, [r5, #1]
_0801D9C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GenerateRandomNews

	thumb_func_start sub_0801D9D0
sub_0801D9D0: @ 0x0801D9D0
	push {lr}
	bl sub_0801AB1C
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	ldr r0, _0801D9E8
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0801D9E8: .4byte 0x0000402E
	thumb_func_end sub_0801D9D0

	thumb_func_start sub_0801D9EC
sub_0801D9EC: @ 0x0801D9EC
	push {r4, lr}
	ldr r0, _0801DA28
	bl GetVarPointer
	adds r4, r0, #0
	bl sub_0801AB1C
	adds r2, r0, #0
	ldr r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1d
	cmp r0, #4
	bls _0801DA20
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	ldr r1, _0801DA2C
	cmp r0, r1
	bls _0801DA20
	ldrb r0, [r2]
	movs r1, #0x1f
	ands r1, r0
	strb r1, [r2]
	movs r0, #0
	strh r0, [r4]
_0801DA20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DA28: .4byte 0x0000402E
_0801DA2C: .4byte 0x01F30000
	thumb_func_end sub_0801D9EC

	thumb_func_start sub_0801DA30
sub_0801DA30: @ 0x0801DA30
	push {r4, r5, r6, lr}
	ldr r6, _0801DA50
	bl sub_0801AB1C
	adds r4, r0, #0
	bl IsMysteryEventEnabled
	cmp r0, #0
	beq _0801DA4A
	bl ValidateReceivedWonderNews
	cmp r0, #0
	bne _0801DA54
_0801DA4A:
	movs r0, #0
	b _0801DAB6
	.align 2, 0
_0801DA50: .4byte 0x02037290
_0801DA54:
	adds r0, r4, #0
	bl sub_0801DB54
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #6
	bhi _0801DAB4
	lsls r0, r5, #2
	ldr r1, _0801DA6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801DA6C: .4byte 0x0801DA70
_0801DA70: @ jump table
	.4byte _0801DAB4 @ case 0
	.4byte _0801DA8C @ case 1
	.4byte _0801DA8C @ case 2
	.4byte _0801DAB4 @ case 3
	.4byte _0801DA96 @ case 4
	.4byte _0801DAA6 @ case 5
	.4byte _0801DAB4 @ case 6
_0801DA8C:
	adds r0, r4, #0
	bl sub_0801DABC
	strh r0, [r6]
	b _0801DAB4
_0801DA96:
	adds r0, r4, #0
	bl sub_0801DABC
	strh r0, [r6]
	adds r0, r4, #0
	bl sub_0801DAE8
	b _0801DAB4
_0801DAA6:
	adds r0, r4, #0
	bl sub_0801DABC
	strh r0, [r6]
	adds r0, r4, #0
	bl sub_0801DADC
_0801DAB4:
	adds r0, r5, #0
_0801DAB6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0801DA30

	thumb_func_start sub_0801DABC
sub_0801DABC: @ 0x0801DABC
	push {r4, lr}
	ldrb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldrb r4, [r0, #1]
	adds r4, #0x84
	movs r1, #0
	strb r1, [r0, #1]
	bl sub_0801DB20
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0801DABC

	thumb_func_start sub_0801DADC
sub_0801DADC: @ 0x0801DADC
	ldrb r2, [r0]
	movs r1, #0x1d
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_0801DADC

	thumb_func_start sub_0801DAE8
sub_0801DAE8: @ 0x0801DAE8
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1d
	adds r0, #1
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #2
	ldrb r1, [r3]
	movs r4, #0x1d
	rsbs r4, r4, #0
	adds r2, r4, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	ldr r0, [r3]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1d
	cmp r0, #4
	bls _0801DB1A
	ands r2, r4
	movs r0, #0x10
	orrs r2, r0
	strb r2, [r3]
_0801DB1A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0801DAE8

	thumb_func_start sub_0801DB20
sub_0801DB20: @ 0x0801DB20
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1d
	adds r0, #1
	lsls r0, r0, #5
	ldrb r1, [r3]
	movs r4, #0x1f
	adds r2, r4, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	ldr r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1d
	cmp r0, #5
	bls _0801DB4C
	ands r2, r4
	movs r0, #0xa0
	orrs r2, r0
	strb r2, [r3]
_0801DB4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0801DB20

	thumb_func_start sub_0801DB54
sub_0801DB54: @ 0x0801DB54
	push {lr}
	adds r2, r0, #0
	ldrb r1, [r2]
	movs r0, #0xe0
	ands r0, r1
	cmp r0, #0xa0
	bne _0801DB66
	movs r0, #6
	b _0801DBB0
_0801DB66:
	ldr r1, [r2]
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0801DB88
	cmp r0, #1
	bgt _0801DB7A
	cmp r0, #0
	beq _0801DB84
	b _0801DBA0
_0801DB7A:
	cmp r0, #2
	beq _0801DB8C
	cmp r0, #3
	beq _0801DB90
	b _0801DBA0
_0801DB84:
	movs r0, #3
	b _0801DBB0
_0801DB88:
	movs r0, #1
	b _0801DBB0
_0801DB8C:
	movs r0, #2
	b _0801DBB0
_0801DB90:
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	cmp r0, #2
	bhi _0801DB9C
	movs r0, #4
	b _0801DBB0
_0801DB9C:
	movs r0, #5
	b _0801DBB0
_0801DBA0:
	ldr r0, _0801DBB4
	movs r1, #0xc0
	lsls r1, r1, #1
	ldr r2, _0801DBB8
	movs r3, #1
	bl AGBAssert
	movs r0, #0
_0801DBB0:
	pop {r1}
	bx r1
	.align 2, 0
_0801DBB4: .4byte 0x082C5050
_0801DBB8: .4byte 0x082C5060
	thumb_func_end sub_0801DB54

