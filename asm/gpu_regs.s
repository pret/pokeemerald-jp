.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitGpuRegManager
InitGpuRegManager: @ 0x08001074
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r2, #0
	ldr r7, _080010B8
	ldr r0, _080010BC
	mov ip, r0
	ldr r1, _080010C0
	mov r8, r1
	ldr r6, _080010C4
	movs r5, #0
	ldr r4, _080010C8
	movs r3, #0xff
_0800108E:
	adds r0, r2, r6
	strb r5, [r0]
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, #1
	cmp r2, #0x5f
	ble _0800108E
	movs r0, #0
	strb r0, [r7]
	mov r1, ip
	strb r0, [r1]
	movs r0, #0
	mov r1, r8
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080010B8: .4byte 0x030008D8
_080010BC: .4byte 0x030008D9
_080010C0: .4byte 0x030008DA
_080010C4: .4byte 0x03000818
_080010C8: .4byte 0x03000878
	thumb_func_end InitGpuRegManager

	thumb_func_start CopyBufferedValueToGpuReg
CopyBufferedValueToGpuReg: @ 0x080010CC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bne _080010F8
	ldr r2, _080010EC
	ldrh r1, [r2]
	ldr r0, _080010F0
	ands r0, r1
	strh r0, [r2]
	ldr r1, _080010F4
	ldrh r0, [r2]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	b _08001106
	.align 2, 0
_080010EC: .4byte 0x04000004
_080010F0: .4byte 0x0000FFE7
_080010F4: .4byte 0x0300081C
_080010F8:
	movs r0, #0x80
	lsls r0, r0, #0x13
	adds r0, r2, r0
	ldr r1, _0800110C
	adds r1, r2, r1
	ldrh r1, [r1]
	strh r1, [r0]
_08001106:
	pop {r0}
	bx r0
	.align 2, 0
_0800110C: .4byte 0x03000818
	thumb_func_end CopyBufferedValueToGpuReg

	thumb_func_start CopyBufferedValuesToGpuRegs
CopyBufferedValuesToGpuRegs: @ 0x08001110
	push {r4, r5, lr}
	ldr r0, _0800113C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08001134
	movs r5, #0
_0800111C:
	ldr r0, _08001140
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08001134
	bl CopyBufferedValueToGpuReg
	movs r0, #0xff
	strb r0, [r4]
	adds r5, #1
	cmp r5, #0x5f
	ble _0800111C
_08001134:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800113C: .4byte 0x030008D8
_08001140: .4byte 0x03000878
	thumb_func_end CopyBufferedValuesToGpuRegs

	thumb_func_start SetGpuReg
SetGpuReg: @ 0x08001144
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r4, #0x5f
	bhi _080011C0
	ldr r0, _08001180
	adds r0, r4, r0
	strh r1, [r0]
	ldr r0, _08001184
	ldrh r1, [r0]
	movs r0, #0xff
	ands r0, r1
	subs r0, #0xa1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x40
	bls _08001178
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800118E
_08001178:
	adds r0, r4, #0
	bl CopyBufferedValueToGpuReg
	b _080011C0
	.align 2, 0
_08001180: .4byte 0x03000818
_08001184: .4byte 0x04000006
_08001188:
	movs r0, #0
	strb r0, [r5]
	b _080011C0
_0800118E:
	ldr r2, _080011C8
	movs r0, #1
	strb r0, [r2]
	movs r3, #0
	ldr r0, _080011CC
	ldrb r1, [r0]
	adds r5, r2, #0
	adds r2, r0, #0
	cmp r1, #0xff
	beq _080011B8
	adds r1, r2, #0
_080011A4:
	ldrb r0, [r1]
	cmp r0, r4
	beq _08001188
	adds r1, #1
	adds r3, #1
	cmp r3, #0x5f
	bgt _080011B8
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080011A4
_080011B8:
	adds r0, r3, r2
	movs r1, #0
	strb r4, [r0]
	strb r1, [r5]
_080011C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080011C8: .4byte 0x030008D8
_080011CC: .4byte 0x03000878
	thumb_func_end SetGpuReg

	thumb_func_start GetGpuReg
GetGpuReg: @ 0x080011D0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r1, #4
	bne _080011E4
	ldr r0, _080011E0
	b _080011F6
	.align 2, 0
_080011E0: .4byte 0x04000004
_080011E4:
	cmp r1, #6
	beq _080011F4
	ldr r0, _080011F0
	adds r0, r1, r0
	ldrh r0, [r0]
	b _080011F8
	.align 2, 0
_080011F0: .4byte 0x03000818
_080011F4:
	ldr r0, _080011FC
_080011F6:
	ldrh r0, [r0]
_080011F8:
	pop {r1}
	bx r1
	.align 2, 0
_080011FC: .4byte 0x04000006
	thumb_func_end GetGpuReg

	thumb_func_start SetGpuRegBits
SetGpuRegBits: @ 0x08001200
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0800121C
	adds r1, r0, r1
	ldrh r1, [r1]
	orrs r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0800121C: .4byte 0x03000818
	thumb_func_end SetGpuRegBits

	thumb_func_start ClearGpuRegBits
ClearGpuRegBits: @ 0x08001220
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	ldr r1, _0800123C
	adds r1, r0, r1
	ldrh r1, [r1]
	lsrs r2, r2, #0x10
	bics r1, r2
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0800123C: .4byte 0x03000818
	thumb_func_end ClearGpuRegBits

	thumb_func_start SyncRegIE
SyncRegIE: @ 0x08001240
	push {r4, r5, lr}
	ldr r5, _08001264
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800125E
	ldr r2, _08001268
	ldrh r1, [r2]
	movs r4, #0
	strh r4, [r2]
	ldr r3, _0800126C
	ldr r0, _08001270
	ldrh r0, [r0]
	strh r0, [r3]
	strh r1, [r2]
	strb r4, [r5]
_0800125E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001264: .4byte 0x030008D9
_08001268: .4byte 0x04000208
_0800126C: .4byte 0x04000200
_08001270: .4byte 0x030008DA
	thumb_func_end SyncRegIE

	thumb_func_start EnableInterrupts
EnableInterrupts: @ 0x08001274
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08001298
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _0800129C
	movs r0, #1
	strb r0, [r1]
	bl SyncRegIE
	ldrh r0, [r4]
	bl UpdateRegDispstatIntrBits
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001298: .4byte 0x030008DA
_0800129C: .4byte 0x030008D9
	thumb_func_end EnableInterrupts

	thumb_func_start DisableInterrupts
DisableInterrupts: @ 0x080012A0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080012C4
	ldrh r1, [r4]
	bics r1, r0
	strh r1, [r4]
	ldr r1, _080012C8
	movs r0, #1
	strb r0, [r1]
	bl SyncRegIE
	ldrh r0, [r4]
	bl UpdateRegDispstatIntrBits
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080012C4: .4byte 0x030008DA
_080012C8: .4byte 0x030008D9
	thumb_func_end DisableInterrupts

	thumb_func_start UpdateRegDispstatIntrBits
UpdateRegDispstatIntrBits: @ 0x080012CC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #4
	bl GetGpuReg
	movs r2, #0x18
	ands r2, r0
	movs r1, #1
	ands r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r1, r0, #0x1f
	movs r0, #8
	ands r1, r0
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080012F8
	movs r0, #0x10
	orrs r1, r0
_080012F8:
	cmp r2, r1
	beq _08001302
	movs r0, #4
	bl SetGpuReg
_08001302:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end UpdateRegDispstatIntrBits

