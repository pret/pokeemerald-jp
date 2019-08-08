.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearDma3Requests
ClearDma3Requests: @ 0x08000C48
	push {lr}
	ldr r2, _08000C74
	movs r0, #1
	strb r0, [r2]
	ldr r1, _08000C78
	movs r0, #0
	strb r0, [r1]
	movs r3, #0
	ldr r0, _08000C7C
	movs r1, #0x7f
_08000C5C:
	strh r3, [r0, #8]
	str r3, [r0]
	str r3, [r0, #4]
	adds r0, #0x10
	subs r1, #1
	cmp r1, #0
	bge _08000C5C
	movs r0, #0
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08000C74: .4byte 0x03000810
_08000C78: .4byte 0x03000811
_08000C7C: .4byte 0x03000010
	thumb_func_end ClearDma3Requests

	thumb_func_start ProcessDma3Requests
ProcessDma3Requests: @ 0x08000C80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _08000CFC
	ldrb r0, [r0]
	cmp r0, #0
	beq _08000C96
	b _08000ED6
_08000C96:
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _08000D00
	ldr r2, _08000D04
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	mov ip, r2
	cmp r0, #0
	bne _08000CAE
	b _08000ED6
_08000CAE:
	mov r8, r1
	adds r1, #4
	mov sl, r1
	movs r6, #0x80
	lsls r6, r6, #5
	ldr r7, _08000D08
	movs r2, #0
	mov sb, r2
_08000CBE:
	mov r3, ip
	ldrb r0, [r3]
	lsls r5, r0, #4
	mov r0, r8
	adds r1, r5, r0
	ldrh r0, [r1, #8]
	ldr r2, [sp, #8]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xa0
	lsls r0, r0, #8
	ldr r3, [sp, #8]
	cmp r3, r0
	bls _08000CE0
	b _08000ED6
_08000CE0:
	ldr r0, _08000D0C
	ldrb r0, [r0]
	cmp r0, #0xe0
	bls _08000CEA
	b _08000ED6
_08000CEA:
	ldrh r0, [r1, #0xa]
	cmp r0, #2
	beq _08000D60
	cmp r0, #2
	bgt _08000D10
	cmp r0, #1
	beq _08000D1C
	b _08000E80
	.align 2, 0
_08000CFC: .4byte 0x03000810
_08000D00: .4byte 0x03000010
_08000D04: .4byte 0x03000811
_08000D08: .4byte 0x040000D4
_08000D0C: .4byte 0x04000006
_08000D10:
	cmp r0, #3
	beq _08000DCC
	cmp r0, #4
	bne _08000D1A
	b _08000E18
_08000D1A:
	b _08000E80
_08000D1C:
	ldr r3, [r1]
	mov r2, sl
	adds r0, r5, r2
	ldr r2, [r0]
	ldrh r1, [r1, #8]
	cmp r1, r6
	bhi _08000D36
	str r3, [r7]
	str r2, [r7, #4]
	lsrs r0, r1, #2
	movs r1, #0x84
	lsls r1, r1, #0x18
	b _08000E3A
_08000D36:
	ldr r4, _08000D58
	str r3, [r4]
	str r2, [r4, #4]
	ldr r0, _08000D5C
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r3, r3, r6
	adds r2, r2, r6
	subs r1, r1, r6
	cmp r1, r6
	bhi _08000D36
	str r3, [r4]
	str r2, [r4, #4]
	lsrs r0, r1, #2
	movs r1, #0x84
	lsls r1, r1, #0x18
	b _08000E06
	.align 2, 0
_08000D58: .4byte 0x040000D4
_08000D5C: .4byte 0x84000400
_08000D60:
	mov r3, sl
	adds r0, r5, r3
	ldr r4, [r0]
	ldrh r1, [r1, #8]
	cmp r1, r6
	bhi _08000D84
	mov r0, r8
	adds r0, #0xc
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp]
	mov r5, sp
	str r5, [r7]
	str r4, [r7, #4]
	lsrs r0, r1, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	b _08000E3A
_08000D84:
	mov r2, ip
	ldrb r0, [r2]
	lsls r0, r0, #4
	mov r5, r8
	adds r5, #0xc
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [sp]
	ldr r3, _08000DC4
	mov r0, sp
	str r0, [r3]
	str r4, [r3, #4]
	ldr r0, _08000DC8
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	adds r4, r4, r6
	subs r1, r1, r6
	cmp r1, r6
	bhi _08000D84
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [sp]
	mov r2, sp
	str r2, [r3]
	str r4, [r3, #4]
	lsrs r0, r1, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	b _08000E7A
	.align 2, 0
_08000DC4: .4byte 0x040000D4
_08000DC8: .4byte 0x85000400
_08000DCC:
	ldr r3, [r1]
	mov r2, sl
	adds r0, r5, r2
	ldr r2, [r0]
	ldrh r1, [r1, #8]
	cmp r1, r6
	bhi _08000DE6
	str r3, [r7]
	str r2, [r7, #4]
	lsrs r0, r1, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	b _08000E3A
_08000DE6:
	ldr r4, _08000E10
	str r3, [r4]
	str r2, [r4, #4]
	ldr r0, _08000E14
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r3, r3, r6
	adds r2, r2, r6
	subs r1, r1, r6
	cmp r1, r6
	bhi _08000DE6
	str r3, [r4]
	str r2, [r4, #4]
	lsrs r0, r1, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
_08000E06:
	orrs r0, r1
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	b _08000E80
	.align 2, 0
_08000E10: .4byte 0x040000D4
_08000E14: .4byte 0x80000800
_08000E18:
	mov r3, sl
	adds r0, r5, r3
	ldr r2, [r0]
	ldrh r4, [r1, #8]
	add r1, sp, #4
	cmp r4, r6
	bhi _08000E42
	mov r0, r8
	adds r0, #0xc
	adds r0, r5, r0
	ldr r0, [r0]
	strh r0, [r1]
	str r1, [r7]
	str r2, [r7, #4]
	lsrs r0, r4, #1
	movs r1, #0x81
	lsls r1, r1, #0x18
_08000E3A:
	orrs r0, r1
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	b _08000E80
_08000E42:
	mov r5, ip
	ldrb r0, [r5]
	lsls r0, r0, #4
	ldr r3, _08000EE8
	adds r0, r0, r3
	ldr r0, [r0]
	strh r0, [r1]
	ldr r3, _08000EEC
	str r1, [r3]
	str r2, [r3, #4]
	ldr r0, _08000EF0
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	adds r2, r2, r6
	subs r4, r4, r6
	cmp r4, r6
	bhi _08000E42
	ldrb r0, [r5]
	lsls r0, r0, #4
	ldr r5, _08000EE8
	adds r0, r0, r5
	ldr r0, [r0]
	strh r0, [r1]
	str r1, [r3]
	str r2, [r3, #4]
	lsrs r0, r4, #1
	movs r1, #0x81
	lsls r1, r1, #0x18
_08000E7A:
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_08000E80:
	ldr r1, _08000EF4
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r1
	mov r2, sb
	str r2, [r0]
	ldrb r0, [r3]
	lsls r0, r0, #4
	add r0, sl
	str r2, [r0]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r1
	movs r4, #0
	strh r2, [r0, #8]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r1
	mov r5, sb
	strh r5, [r0, #0xa]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r1, #0xc
	adds r0, r0, r1
	mov r1, sb
	str r1, [r0]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08000EC4
	strb r4, [r3]
_08000EC4:
	mov r2, ip
	ldrb r0, [r2]
	lsls r0, r0, #4
	ldr r3, _08000EF4
	adds r0, r0, r3
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _08000ED6
	b _08000CBE
_08000ED6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000EE8: .4byte 0x0300001C
_08000EEC: .4byte 0x040000D4
_08000EF0: .4byte 0x81000800
_08000EF4: .4byte 0x03000010
	thumb_func_end ProcessDma3Requests

	thumb_func_start RequestDma3Copy
RequestDma3Copy: @ 0x08000EF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	movs r5, #0
	ldr r1, _08000F44
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08000F48
	ldrb r2, [r0]
	mov sl, r1
	ldr r6, _08000F4C
	mov sb, r6
	lsls r0, r2, #4
	adds r1, r0, r6
_08000F24:
	lsls r3, r2, #4
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _08000F64
	mov r0, ip
	str r0, [r1]
	mov r0, sb
	adds r0, #4
	adds r0, r3, r0
	mov r3, r8
	str r3, [r0]
	strh r7, [r1, #8]
	cmp r4, #1
	bne _08000F50
	strh r4, [r1, #0xa]
	b _08000F54
	.align 2, 0
_08000F44: .4byte 0x03000810
_08000F48: .4byte 0x03000811
_08000F4C: .4byte 0x03000010
_08000F50:
	movs r0, #3
	strh r0, [r1, #0xa]
_08000F54:
	movs r0, #0
	ldr r1, _08000F60
	strb r0, [r1]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	b _08000F80
	.align 2, 0
_08000F60: .4byte 0x03000810
_08000F64:
	adds r1, #0x10
	adds r2, #1
	cmp r2, #0x7f
	ble _08000F70
	adds r1, r6, #0
	movs r2, #0
_08000F70:
	adds r5, #1
	cmp r5, #0x7f
	ble _08000F24
	movs r0, #0
	mov r3, sl
	strb r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
_08000F80:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RequestDma3Copy

	thumb_func_start RequestDma3Fill
RequestDma3Fill: @ 0x08000F90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	movs r6, #0
	ldr r0, _08000FE8
	ldrb r2, [r0]
	ldr r1, _08000FEC
	movs r0, #1
	strb r0, [r1]
	mov sl, r1
	ldr r0, _08000FF0
	mov ip, r0
	mov r4, ip
	lsls r0, r2, #4
	adds r0, #8
	adds r1, r0, r4
_08000FC0:
	lsls r3, r2, #4
	ldrh r0, [r1]
	cmp r0, #0
	bne _08001008
	adds r0, r4, #4
	adds r0, r3, r0
	mov r6, r8
	str r6, [r0]
	strh r7, [r1]
	strh r5, [r1, #2]
	adds r0, r4, #0
	adds r0, #0xc
	adds r0, r3, r0
	mov r3, sb
	str r3, [r0]
	cmp r5, #1
	bne _08000FF4
	movs r0, #2
	b _08000FF6
	.align 2, 0
_08000FE8: .4byte 0x03000811
_08000FEC: .4byte 0x03000810
_08000FF0: .4byte 0x03000010
_08000FF4:
	movs r0, #4
_08000FF6:
	strh r0, [r1, #2]
	movs r0, #0
	ldr r6, _08001004
	strb r0, [r6]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	b _08001026
	.align 2, 0
_08001004: .4byte 0x03000810
_08001008:
	adds r1, #0x10
	adds r2, #1
	cmp r2, #0x7f
	ble _08001016
	mov r1, ip
	adds r1, #8
	movs r2, #0
_08001016:
	adds r6, #1
	cmp r6, #0x7f
	ble _08000FC0
	movs r0, #0
	mov r1, sl
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
_08001026:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end RequestDma3Fill

	thumb_func_start CheckForSpaceForDma3Request
CheckForSpaceForDma3Request: @ 0x08001034
	push {lr}
	movs r2, #0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r3, #1
	rsbs r3, r3, #0
	cmp r1, r3
	bne _0800105C
	ldr r1, _08001058
_08001046:
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _08001068
	adds r1, #0x10
	adds r2, #1
	cmp r2, #0x7f
	ble _08001046
_08001054:
	movs r0, #0
	b _0800106C
	.align 2, 0
_08001058: .4byte 0x03000010
_0800105C:
	ldr r0, _08001070
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	cmp r0, #0
	beq _08001054
_08001068:
	movs r0, #1
	rsbs r0, r0, #0
_0800106C:
	pop {r1}
	bx r1
	.align 2, 0
_08001070: .4byte 0x03000010
	thumb_func_end CheckForSpaceForDma3Request

