.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_082952F4
sub_082952F4: @ 0x082952F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0829530C
	ldrh r0, [r0]
	cmp r0, #0
	bne _08295310
	movs r0, #1
	rsbs r0, r0, #0
	b _08295390
	.align 2, 0
_0829530C: .4byte 0x04000208
_08295310:
	ldr r0, _0829533C
	ldrh r0, [r0]
	mov r8, r0
	ldr r4, _08295340
	ldr r1, [r4]
	movs r0, #0xa
	str r0, [r1]
	ldr r0, _08295344
	bl STWI_set_Callback_ID
	bl sub_082953A8
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	ldr r1, _08295348
	adds r4, r0, r1
	lsls r0, r5, #0x1b
	lsrs r5, r0, #0x18
	movs r7, #0
	b _0829535E
	.align 2, 0
_0829533C: .4byte 0x04000200
_08295340: .4byte 0x03007608
_08295344: .4byte 0x08295511
_08295348: .4byte 0x04000100
_0829534C:
	strh r6, [r4, #2]
	strh r6, [r4]
	movs r0, #0x83
	strh r0, [r4, #2]
_08295354:
	ldrh r0, [r4]
	cmp r0, #0x1f
	bls _08295354
	strh r7, [r4, #2]
	strh r7, [r4]
_0829535E:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xff
	beq _08295372
	bl sub_0829541C
	adds r6, r0, #0
	cmp r6, #0
	beq _0829534C
_08295372:
	ldr r1, _0829539C
	movs r0, #0
	strh r0, [r1]
	ldr r0, _082953A0
	mov r2, r8
	strh r2, [r0]
	movs r0, #1
	strh r0, [r1]
	ldr r0, _082953A4
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1]
	bl STWI_set_Callback_ID
	adds r0, r6, #0
_08295390:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0829539C: .4byte 0x04000208
_082953A0: .4byte 0x04000200
_082953A4: .4byte 0x03007608
	thumb_func_end sub_082952F4

	thumb_func_start sub_082953A8
sub_082953A8: @ 0x082953A8
	push {r4, r5, lr}
	sub sp, #4
	ldr r3, _08295400
	movs r4, #0
	strh r4, [r3]
	ldr r2, _08295404
	ldr r0, _08295408
	ldr r0, [r0]
	movs r1, #8
	ldrb r0, [r0, #0xa]
	lsls r1, r0
	movs r5, #0x80
	orrs r1, r5
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0829540C
	strh r4, [r0]
	subs r2, #0xd8
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r1, #0
	strh r0, [r2]
	ldrh r0, [r2]
	movs r3, #0x81
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	str r0, [sp]
	ldr r1, _08295410
	ldr r2, _08295414
	mov r0, sp
	bl CpuSet
	ldr r0, _08295418
	strh r5, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08295400: .4byte 0x04000208
_08295404: .4byte 0x04000200
_08295408: .4byte 0x03007608
_0829540C: .4byte 0x04000134
_08295410: .4byte 0x03007640
_08295414: .4byte 0x05000003
_08295418: .4byte 0x04000202
	thumb_func_end sub_082953A8

	thumb_func_start sub_0829541C
sub_0829541C: @ 0x0829541C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08295430
	ldrb r1, [r0, #1]
	mov ip, r1
	adds r7, r0, #0
	cmp r1, #0
	beq _08295434
	cmp r1, #1
	beq _0829546C
	b _08295504
	.align 2, 0
_08295430: .4byte 0x03007640
_08295434:
	movs r6, #1
	strb r6, [r7]
	ldr r3, _08295460
	ldrh r0, [r3]
	movs r5, #1
	orrs r0, r5
	strh r0, [r3]
	ldr r4, _08295464
	mov r0, ip
	strh r0, [r4]
	ldr r2, _08295468
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	strh r6, [r4]
	strb r5, [r7, #1]
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
	b _08295508
	.align 2, 0
_08295460: .4byte 0x04000128
_08295464: .4byte 0x04000208
_08295468: .4byte 0x04000200
_0829546C:
	ldrh r0, [r7, #0xa]
	cmp r0, #0
	bne _08295500
	ldrb r0, [r7]
	cmp r0, #1
	bne _0829549C
	ldrh r0, [r7, #2]
	cmp r0, #0
	bne _08295508
	ldr r3, _08295494
	strh r0, [r3]
	ldr r2, _08295498
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	mov r1, ip
	strh r1, [r3]
	b _08295508
	.align 2, 0
_08295494: .4byte 0x04000208
_08295498: .4byte 0x04000128
_0829549C:
	ldrh r1, [r7, #4]
	ldr r0, _082954E8
	cmp r1, r0
	beq _08295508
	ldrh r6, [r7, #2]
	cmp r6, #0
	bne _08295508
	ldr r4, _082954EC
	strh r6, [r4]
	ldr r3, _082954F0
	ldrh r1, [r3]
	ldr r0, _082954F4
	ands r0, r1
	strh r0, [r3]
	mov r7, ip
	strh r7, [r4]
	ldr r2, _082954F8
	strh r6, [r2]
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r1, #0
	strh r0, [r2]
	ldr r0, _082954FC
	movs r5, #0x80
	strh r5, [r0]
	ldrh r0, [r2]
	movs r7, #0x81
	lsls r7, r7, #7
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2]
	strh r6, [r4]
	ldrh r0, [r3]
	orrs r0, r5
	strh r0, [r3]
	mov r0, ip
	strh r0, [r4]
	b _08295508
	.align 2, 0
_082954E8: .4byte 0x00008001
_082954EC: .4byte 0x04000208
_082954F0: .4byte 0x04000200
_082954F4: .4byte 0x0000FF7F
_082954F8: .4byte 0x04000128
_082954FC: .4byte 0x04000202
_08295500:
	movs r0, #2
	strb r0, [r7, #1]
_08295504:
	ldrh r0, [r7, #0xa]
	b _0829550A
_08295508:
	movs r0, #0
_0829550A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0829541C

	thumb_func_start sub_08295510
sub_08295510: @ 0x08295510
	push {r4, r5, lr}
	ldr r0, _08295558
	ldr r5, [r0]
	ldr r0, _0829555C
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	beq _0829552A
	ldr r0, _08295560
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
_0829552A:
	ldrb r2, [r4]
	lsls r1, r2, #4
	adds r0, r5, #0
	lsls r0, r1
	lsrs r1, r0, #0x10
	movs r0, #1
	subs r0, r0, r2
	lsls r0, r0, #4
	lsls r5, r0
	adds r0, r5, #0
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	bne _0829557E
	ldrh r2, [r4, #6]
	cmp r1, r2
	bne _0829557C
	ldrh r3, [r4, #2]
	cmp r3, #3
	bls _08295564
	strh r5, [r4, #0xa]
	b _0829557E
	.align 2, 0
_08295558: .4byte 0x04000120
_0829555C: .4byte 0x03007640
_08295560: .4byte 0x04000128
_08295564:
	ldrh r0, [r4, #4]
	mvns r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _0829557E
	mvns r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bne _0829557E
	adds r0, r3, #1
_0829557C:
	strh r0, [r4, #2]
_0829557E:
	ldrh r0, [r4, #2]
	cmp r0, #3
	bhi _08295594
	lsls r0, r0, #1
	ldr r1, _08295590
	adds r0, r0, r1
	ldrh r0, [r0]
	b _08295596
	.align 2, 0
_08295590: .4byte 0x0890EEDC
_08295594:
	ldr r0, _082955EC
_08295596:
	strh r0, [r4, #4]
	mvns r0, r5
	strh r0, [r4, #6]
	ldr r3, _082955F0
	ldrh r2, [r4, #4]
	ldrb r1, [r4]
	movs r0, #1
	subs r0, r0, r1
	lsls r0, r0, #4
	lsls r2, r0
	ldrh r0, [r4, #6]
	lsls r1, r1, #4
	lsls r0, r1
	adds r2, r2, r0
	str r2, [r3]
	ldrb r0, [r4]
	cmp r0, #1
	bne _082955E4
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _082955C6
	ldr r0, _082955F4
	cmp r5, r0
	bne _082955E4
_082955C6:
	movs r0, #0
	ldr r1, _082955F8
_082955CA:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bls _082955CA
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	bne _082955E4
	ldr r0, _082955FC
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
_082955E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_082955EC: .4byte 0x00008001
_082955F0: .4byte 0x04000120
_082955F4: .4byte 0x0000494E
_082955F8: .4byte 0x00000257
_082955FC: .4byte 0x04000128
	thumb_func_end sub_08295510

