.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	arm_func_start IntrSIO32
IntrSIO32: @ 0x08291ADC
	mov ip, sp
	push {fp, ip, lr, pc}
	ldr r3, _08291B3C
	ldr r0, [r3]
	ldr r2, [r0]
	sub fp, ip, #4
	cmp r2, #0xa
	bne _08291B18
	ldr r0, [r0, #0x20]
	cmp r0, #0
	ldmdbeq fp, {fp, sp, lr}
	bxeq lr
	arm_func_end IntrSIO32

	arm_func_start sub_08291B0C
sub_08291B0C: @ 0x08291B0C
	bl sub_08292438
	ldmdb fp, {fp, sp, lr}
	bx lr
_08291B18:
	ldrb r3, [r0, #0x14]
	cmp r3, #1
	bne _08291B30
	bl sio32intr_clock_master
	ldmdb fp, {fp, sp, lr}
	bx lr
_08291B30:
	bl sio32intr_clock_slave
	ldmdb fp, {fp, sp, lr}
	bx lr
	.align 2, 0
_08291B3C: .4byte 0x03007608
	arm_func_end sub_08291B0C

	arm_func_start sio32intr_clock_master
sio32intr_clock_master: @ 0x08291B40
	mov ip, sp
	push {r4, r5, r6, fp, ip, lr, pc}
	mov r0, #0x50
	sub fp, ip, #4
	bl STWI_set_timer_in_RAM
	mov r4, #0x120
	ldr r2, _08291DB4
	add r4, r4, #0x4000000
	ldr lr, [r4]
	ldr ip, [r2]
	ldr r3, [ip]
	mov r6, r2
	cmp r3, #0
	bne _08291BC0
	cmp lr, #-0x80000000
	bne _08291C40
	ldrb r2, [ip, #5]
	ldrb r3, [ip, #4]
	cmp r2, r3
	bhi _08291BB0
	ldr r3, [ip, #0x24]
	mov r1, r2
	ldr r2, [r3, r1, lsl #2]
	str r2, [r4]
	ldrb r3, [ip, #5]
	add r3, r3, #1
	strb r3, [ip, #5]
	b _08291C9C
_08291BB0:
	mov r3, #1
	str r3, [ip]
	str lr, [r4]
	b _08291C9C
_08291BC0:
	ldr r3, [ip]
	cmp r3, #1
	bne _08291C50
	mov r3, #-0x67000000
	add r3, r3, #0x660000
	mov r5, #-0x80000000
	and r2, lr, r5, asr #15
	cmp r2, r3
	bne _08291C40
	mov r3, #0
	strb r3, [ip, #8]
	ldr r1, [r6]
	ldrb r0, [r1, #8]
	ldr r2, [r1, #0x28]
	str lr, [r2, r0, lsl #2]
	ldrb r3, [r1, #8]
	add r3, r3, #1
	strb r3, [r1, #8]
	ldr r2, [r6]
	strb lr, [r2, #9]
	ldr r3, [r6]
	lsr r2, lr, #8
	strb r2, [r3, #7]
	ldr r1, [r6]
	ldrb r2, [r1, #7]
	ldrb r3, [r1, #8]
	cmp r2, r3
	blo _08291C88
	mov r3, #2
	str r3, [r1]
	str r5, [r4]
	b _08291C9C
_08291C40:
	bl STWI_stop_timer_in_RAM
	mov r0, #0x82
	bl STWI_set_timer_in_RAM
	b _08291DC8
_08291C50:
	ldr r3, [ip]
	cmp r3, #2
	bne _08291C9C
	ldrb r1, [ip, #8]
	ldr r2, [ip, #0x28]
	str lr, [r2, r1, lsl #2]
	ldrb r3, [ip, #8]
	add r3, r3, #1
	strb r3, [ip, #8]
	ldr r1, [r6]
	ldrb r2, [r1, #7]
	ldrb r3, [r1, #8]
	cmp r2, r3
	bhs _08291C94
_08291C88:
	mov r3, #3
	str r3, [r1]
	b _08291C9C
_08291C94:
	mov r3, #-0x80000000
	str r3, [r4]
_08291C9C:
	mov r0, #1
	bl handshake_wait
	lsl r0, r0, #0x10
	cmp r0, #0x10000
	beq _08291DC8
	mov r4, #0x128
	add r4, r4, #0x4000000
	mov r5, #0x5000
	add r3, r5, #0xb
	strh r3, [r4]
	mov r0, #0
	bl handshake_wait
	lsl r0, r0, #0x10
	cmp r0, #0x10000
	beq _08291DC8
	bl STWI_stop_timer_in_RAM
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, #3
	bne _08291DB8
	ldrb r3, [r1, #9]
	cmp r3, #0xa5
	cmpne r3, #0xa7
	beq _08291D10
	and r3, r3, #0xff
	cmp r3, #0xb5
	beq _08291D10
	cmp r3, #0xb7
	bne _08291D58
_08291D10:
	mov r1, #0x120
	add r1, r1, #0x4000000
	mov ip, #0x128
	add ip, ip, #0x4000000
	ldr r0, [r6]
	mov r3, #0
	strb r3, [r0, #0x14]
	mov r2, #-0x80000000
	str r2, [r1]
	add r3, r3, #0x5000
	add r2, r3, #2
	strh r2, [ip]
	add r3, r3, #0x82
	strh r3, [ip]
	ldr r2, [r6]
	mov r3, #5
	str r3, [r2]
	b _08291D88
_08291D58:
	cmp r3, #0xee
	bne _08291D78
	add r3, r5, #3
	strh r3, [r4]
	mov r2, #4
	str r2, [r1]
	strh r0, [r1, #0x12]
	b _08291D88
_08291D78:
	add r3, r5, #3
	strh r3, [r4]
	mov r2, #4
	str r2, [r1]
_08291D88:
	ldr r2, [r6]
	mov r3, #0
	strb r3, [r2, #0x2c]
	ldr r0, [r6]
	ldr r2, [r0, #0x18]
	cmp r2, r3
	beq _08291DC8
	ldrh r1, [r0, #0x12]
	ldrb r0, [r0, #6]
	bl sub_08292430
	b _08291DC8
	.align 2, 0
_08291DB4: .4byte 0x03007608
_08291DB8:
	add r3, r5, #3
	strh r3, [r4]
	add r2, r5, #0x83
	strh r2, [r4]
_08291DC8:
	ldmdb fp, {r4, r5, r6, fp, sp, lr}
	bx lr
	arm_func_end sio32intr_clock_master

	arm_func_start sio32intr_clock_slave
sio32intr_clock_slave: @ 0x08291DD0
	mov ip, sp
	push {r4, r5, r6, fp, ip, lr, pc}
	ldr r4, _0829217C
	mov r0, #0x64
	ldr r3, [r4]
	mov r6, #0
	strb r6, [r3, #0x10]
	sub fp, ip, #4
	bl STWI_set_timer_in_RAM
	mov r0, r6
	bl handshake_wait
	lsl r0, r0, #0x10
	cmp r0, #0x10000
	mov r5, r4
	beq _082921D4
	mov r3, #0x128
	add r3, r3, #0x4000000
	mov r2, #0x5000
	add r2, r2, #0xa
	strh r2, [r3]
	mov lr, #0x120
	ldr r0, [r5]
	add lr, lr, #0x4000000
	ldr ip, [lr]
	ldr r3, [r0]
	cmp r3, #5
	bne _08291F00
	ldr r3, [r0, #0x28]
	mov r4, #1
	mov r0, #-0x67000000
	str ip, [r3]
	add r0, r0, #0x660000
	ldr r2, [r5]
	lsr r3, r0, #0x10
	strb r4, [r2, #5]
	cmp r3, ip, lsr #16
	bne _0829204C
	ldr r3, [r5]
	lsr r2, ip, #8
	strb r2, [r3, #4]
	ldr r2, [r5]
	strb ip, [r2, #6]
	ldr r1, [r5]
	ldrb r3, [r1, #4]
	cmp r3, r6
	bne _08291EE4
	ldrb r2, [r1, #6]
	sub r3, r2, #0x27
	cmp r2, #0x36
	cmpne r3, #2
	bhi _08291EB8
	add r3, r2, #0x80
	strb r3, [r1, #9]
	ldr r2, [r5]
	ldrb r3, [r2, #9]
	ldr r1, [r2, #0x24]
	add r3, r3, r0
	b _08291F68
_08291EB8:
	ldr r2, [r1, #0x24]
	ldr r3, _08292180
	str r3, [r2]
	ldr r2, [r5]
	ldrb r3, [r2, #6]
	sub r3, r3, #0x10
	cmp r3, #0x2d
	bhi _08291FA0
	ldr r3, [r2, #0x24]
	str r4, [r3, #4]
	b _08291FAC
_08291EE4:
	mov r3, #-0x80000000
	str r3, [lr]
	strb r4, [r1, #5]
	ldr r2, [r5]
	add r3, r3, #-0x7ffffffa
	str r3, [r2]
	b _0829205C
_08291F00:
	ldr r3, [r0]
	cmp r3, #6
	bne _08292000
	ldrb r1, [r0, #5]
	ldr r2, [r0, #0x28]
	str ip, [r2, r1, lsl #2]
	ldrb r3, [r0, #5]
	add r3, r3, #1
	strb r3, [r0, #5]
	ldr r1, [r5]
	ldrb r2, [r1, #4]
	ldrb r3, [r1, #5]
	cmp r2, r3
	bhs _08291FF4
	ldrb r2, [r1, #6]
	sub r3, r2, #0x28
	cmp r2, #0x36
	cmpne r3, #1
	bhi _08291F78
	add r3, r2, #0x80
	strb r3, [r1, #9]
	ldr r2, [r5]
	ldrb r3, [r2, #9]
	ldr r1, [r2, #0x24]
	orr r3, r3, #0x99000000
	orr r3, r3, #0x660000
_08291F68:
	str r3, [r1]
	ldr r2, [r5]
	strb r6, [r2, #7]
	b _08291FC4
_08291F78:
	ldr r2, [r1, #0x24]
	ldr r3, _08292180
	str r3, [r2]
	ldr r2, [r5]
	ldrb r3, [r2, #6]
	sub r3, r3, #0x10
	cmp r3, #0x2d
	ldrls r2, [r2, #0x24]
	movls r3, #1
	bls _08291FA8
_08291FA0:
	ldr r2, [r2, #0x24]
	mov r3, #2
_08291FA8:
	str r3, [r2, #4]
_08291FAC:
	ldr r2, [r5]
	mov r3, #1
	strb r3, [r2, #7]
	ldr r1, [r5]
	add r3, r3, #2
	strh r3, [r1, #0x12]
_08291FC4:
	ldr r0, [r5]
	ldr r2, [r0, #0x24]
	mov r3, #0x120
	ldr r1, [r2]
	add r3, r3, #0x4000000
	str r1, [r3]
	mov r2, #1
	strb r2, [r0, #8]
	ldr r1, [r5]
	mov r3, #7
	str r3, [r1]
	b _0829205C
_08291FF4:
	mov r3, #-0x80000000
	str r3, [lr]
	b _0829205C
_08292000:
	ldr r3, [r0]
	cmp r3, #7
	bne _0829205C
	cmp ip, #-0x80000000
	bne _0829204C
	ldrb r2, [r0, #7]
	ldrb r3, [r0, #8]
	cmp r2, r3
	movlo r3, #8
	strlo r3, [r0]
	blo _0829205C
	ldrb r1, [r0, #8]
	ldr r3, [r0, #0x24]
	ldr r2, [r3, r1, lsl #2]
	str r2, [lr]
	ldrb r3, [r0, #8]
	add r3, r3, #1
	strb r3, [r0, #8]
	b _0829205C
_0829204C:
	bl STWI_stop_timer_in_RAM
	mov r0, #0x64
	bl STWI_set_timer_in_RAM
	b _082921D4
_0829205C:
	mov r0, #1
	bl handshake_wait
	lsl r0, r0, #0x10
	cmp r0, #0x10000
	beq _082921D4
	mov r6, r5
	ldr r3, [r6]
	ldr r2, [r3]
	cmp r2, #8
	bne _08292124
	mov r4, #0x128
	add r4, r4, #0x4000000
	mov r3, #0x5000
	add r3, r3, #2
	strh r3, [r4]
	bl STWI_stop_timer_in_RAM
	arm_func_end sio32intr_clock_slave

	arm_func_start sub_0829209C
sub_0829209C: @ 0x0829209C
	ldr r0, [r6]
	ldrh r3, [r0, #0x12]
	cmp r3, #3
	bne _082920D0
	bl STWI_init_slave
	ldr r3, [r6]
	ldr r1, [r3, #0x1c]
	cmp r1, #0
	beq _082921D4
	mov r0, #0x1ec
	add r0, r0, #2
	bl sub_08292434
	b _082921D4
_082920D0:
	mov r3, #0x120
	add r3, r3, #0x4000000
	mov r1, #0
	str r1, [r3]
	mov r2, #0x5000
	strh r1, [r4]
	add r2, r2, #3
	strh r2, [r4]
	mov r3, #1
	strb r3, [r0, #0x14]
	ldr r0, [r5]
	ldr r2, [r0, #0x1c]
	str r1, [r0]
	cmp r2, r1
	beq _082921D4
	ldrb r3, [r0, #4]
	ldrb r0, [r0, #6]
	mov r1, r2
	orr r0, r0, r3, lsl #8
	bl sub_08292434
	b _082921D4
_08292124:
	mov r3, #0x208
	add r3, r3, #0x4000000
	mov r2, #0
	strh r2, [r3]
	mov r1, #0x100
	add r2, r1, #0x4000002
	ldrh r3, [r2]
	tst r3, #0x80
	beq _082921A8
	ldrh r3, [r2]
	tst r3, #3
	bne _08292184
	mov r2, #0xff00
	add r1, r1, #0x4000000
	ldrh r3, [r1]
	add r2, r2, #0x9b
	cmp r3, r2
	bls _082921A8
_0829216C:
	ldrh r3, [r1]
	cmp r3, r2
	bhi _0829216C
	b _082921A8
	.align 2, 0
_0829217C: .4byte 0x03007608
_08292180: .4byte 0x996601EE
_08292184:
	mov r2, #0xff00
	add r1, r1, #0x4000000
	ldrh r3, [r1]
	add r2, r2, #0xfe
	cmp r3, r2
	bls _082921A8
_0829219C:
	ldrh r3, [r1]
	cmp r3, r2
	bhi _0829219C
_082921A8:
	mov r1, #0x128
	add r1, r1, #0x4000000
	mov r0, #0x208
	add r0, r0, #0x4000000
	mov r3, #0x5000
	add r2, r3, #2
	strh r2, [r1]
	add r3, r3, #0x82
	strh r3, [r1]
	mov r2, #1
	strh r2, [r0]
_082921D4:
	ldmdb fp, {r4, r5, r6, fp, sp, lr}
	bx lr
	arm_func_end sub_0829209C

	arm_func_start handshake_wait
handshake_wait: @ 0x082921DC
	mov ip, sp
	push {fp, ip, lr, pc}
	mov r1, #0x128
	add r1, r1, #0x4000000
	lsl r0, r0, #0x10
	ldr r2, _08292240
	sub fp, ip, #4
	lsr lr, r0, #0xe
	ldr ip, [r2]
_08292200:
	ldrb r3, [ip, #0x10]
	and r0, r3, #0xff
	cmp r0, #1
	beq _0829222C
	ldrh r3, [r1]
	and r3, r3, #4
	cmp r3, lr
	bne _08292200
	mov r0, #0
	ldmdb fp, {fp, sp, lr}
	bx lr
_0829222C:
	ldr r2, [r2]
	mov r3, #0
	strb r3, [r2, #0x10]
	ldmdb fp, {fp, sp, lr}
	bx lr
	.align 2, 0
_08292240: .4byte 0x03007608
	arm_func_end handshake_wait

	arm_func_start STWI_set_timer_in_RAM
STWI_set_timer_in_RAM: @ 0x08292244
	mov ip, sp
	push {r4, r5, fp, ip, lr, pc}
	mov r1, #0x208
	add r1, r1, #0x4000000
	mov r3, #0
	sub fp, ip, #4
	ldr ip, _082922FC
	and lr, r0, #0xff
	ldr r2, [ip]
	cmp lr, #0x50
	ldrb r0, [r2, #0xa]
	mov r4, ip
	mov r2, lr
	strh r3, [r1]
	lsl r0, r0, #2
	add r3, r3, #0x100
	add r1, r3, #0x4000000
	add r3, r3, #0x4000002
	add r5, r0, r3
	beq _082922CC
	bgt _082922A4
	cmp lr, #0x32
	beq _082922B8
	b _08292318
_082922A4:
	cmp r2, #0x64
	beq _082922E4
	cmp r2, #0x82
	beq _08292300
	b _08292318
_082922B8:
	mvn r3, #0x334
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, #1
	b _08292314
_082922CC:
	mov r3, #-0x52000000
	asr r3, r3, #0x14
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, #2
	b _08292314
_082922E4:
	mvn r3, #0x660
	sub r3, r3, #9
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, #3
	b _08292314
	.align 2, 0
_082922FC: .4byte 0x03007608
_08292300:
	mvn r3, #0x850
	sub r3, r3, #2
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, #4
_08292314:
	str r3, [r2, #0xc]
_08292318:
	mov ip, #0x200
	add ip, ip, #0x4000002
	mov r3, #0xc3
	strh r3, [r5]
	mov r1, #0x208
	ldr r2, [r4]
	add r1, r1, #0x4000000
	ldrb r0, [r2, #0xa]
	sub r3, r3, #0xbb
	lsl r3, r3, r0
	strh r3, [ip]
	mov r2, #1
	strh r2, [r1]
	ldmdb fp, {r4, r5, fp, sp, lr}
	bx lr
STWI_stop_timer_in_RAM:
	mov ip, sp
	push {fp, ip, lr, pc}
	mov r1, #0x100
	ldr lr, _082923A0
	add r0, r1, #0x4000000
	ldr r2, [lr]
	sub fp, ip, #4
	ldrb r3, [r2, #0xa]
	mov ip, #0
	str ip, [r2, #0xc]
	lsl r3, r3, #2
	strh ip, [r3, r0]
	ldr r2, [lr]
	ldrb r3, [r2, #0xa]
	add r1, r1, #0x4000002
	lsl r3, r3, #2
	strh ip, [r3, r1]
	ldmdb fp, {fp, sp, lr}
	bx lr
	.align 2, 0
_082923A0: .4byte 0x03007608
	arm_func_end STWI_set_timer_in_RAM

	arm_func_start STWI_init_slave
STWI_init_slave: @ 0x082923A4
	mov ip, sp
	push {fp, ip, lr, pc}
	ldr r0, _0829242C
	ldr r2, [r0]
	mov r3, #5
	str r3, [r2]
	mov r1, #0
	strb r1, [r2, #0x14]
	ldr r3, [r0]
	strb r1, [r3, #4]
	ldr r2, [r0]
	strb r1, [r2, #5]
	ldr r3, [r0]
	strb r1, [r3, #6]
	ldr r2, [r0]
	strb r1, [r2, #7]
	ldr r3, [r0]
	strb r1, [r3, #8]
	ldr r2, [r0]
	strb r1, [r2, #9]
	ldr r3, [r0]
	str r1, [r3, #0xc]
	sub fp, ip, #4
	strb r1, [r3, #0x10]
	mov r2, #0x128
	ldr ip, [r0]
	add r2, r2, #0x4000000
	strh r1, [ip, #0x12]
	mov r3, #0x5000
	strb r1, [ip, #0x15]
	add r3, r3, #0x82
	strh r3, [r2]
	ldmdb fp, {fp, sp, lr}
	bx lr
	.align 2, 0
_0829242C: .4byte 0x03007608
	arm_func_end STWI_init_slave

	arm_func_start sub_08292430
sub_08292430: @ 0x08292430
	bx r2
	arm_func_end sub_08292430

	arm_func_start sub_08292434
sub_08292434: @ 0x08292434
	bx r1
	arm_func_end sub_08292434

	arm_func_start sub_08292438
sub_08292438: @ 0x08292438
	bx r0
	arm_func_end sub_08292438

