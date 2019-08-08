.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start mevent_srv_sub_recv
mevent_srv_sub_recv: @ 0x0801D6D0
	push {lr}
	ldr r1, [r0, #0x20]
	bl _call_via_r1
	pop {r1}
	bx r1
	thumb_func_end mevent_srv_sub_recv

	thumb_func_start mevent_srv_sub_send
mevent_srv_sub_send: @ 0x0801D6DC
	push {lr}
	ldr r1, [r0, #0x24]
	bl _call_via_r1
	pop {r1}
	bx r1
	thumb_func_end mevent_srv_sub_send

	thumb_func_start mevent_srv_sub_init
mevent_srv_sub_init: @ 0x0801D6E8
	movs r3, #0
	strb r1, [r0, #4]
	strb r2, [r0, #5]
	str r3, [r0]
	strh r3, [r0, #0x12]
	strh r3, [r0, #0x14]
	strh r3, [r0, #0x10]
	strh r3, [r0, #0xa]
	strh r3, [r0, #0xc]
	strh r3, [r0, #8]
	str r3, [r0, #0x1c]
	str r3, [r0, #0x18]
	ldr r1, _0801D70C
	str r1, [r0, #0x24]
	ldr r1, _0801D710
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_0801D70C: .4byte 0x0801D86D
_0801D710: .4byte 0x0801D799
	thumb_func_end mevent_srv_sub_init

	thumb_func_start mevent_srv_sub_init_send
mevent_srv_sub_init_send: @ 0x0801D714
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	cmp r3, #0
	beq _0801D72A
	strh r3, [r4, #0x14]
	b _0801D730
_0801D72A:
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x14]
_0801D730:
	str r2, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end mevent_srv_sub_init_send

	thumb_func_start mevent_srv_sub_init_recv
mevent_srv_sub_init_recv: @ 0x0801D738
	movs r3, #0
	str r3, [r0]
	strh r1, [r0, #6]
	strh r3, [r0, #8]
	strh r3, [r0, #0xa]
	strh r3, [r0, #0xc]
	str r2, [r0, #0x18]
	bx lr
	thumb_func_end mevent_srv_sub_init_recv

	thumb_func_start mevent_recv_block
mevent_recv_block: @ 0x0801D748
	push {lr}
	adds r3, r0, #0
	adds r0, r1, #0
	lsls r3, r3, #8
	ldr r1, _0801D760
	adds r3, r3, r1
	adds r1, r3, #0
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_0801D760: .4byte 0x0202207C
	thumb_func_end mevent_recv_block

	thumb_func_start mevent_has_received
mevent_has_received: @ 0x0801D764
	push {r4, lr}
	adds r4, r0, #0
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801D77E
	movs r0, #0
	b _0801D780
_0801D77E:
	movs r0, #1
_0801D780:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end mevent_has_received

	thumb_func_start mevent_reset_recv
mevent_reset_recv: @ 0x0801D788
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ResetBlockReceivedFlag
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end mevent_reset_recv

	thumb_func_start mevent_receive_func
mevent_receive_func: @ 0x0801D798
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r6, [r5]
	cmp r6, #1
	beq _0801D7FC
	cmp r6, #1
	bgt _0801D7AE
	cmp r6, #0
	beq _0801D7B4
	b _0801D862
_0801D7AE:
	cmp r6, #2
	beq _0801D848
	b _0801D862
_0801D7B4:
	ldrb r0, [r5, #5]
	bl mevent_has_received
	cmp r0, #0
	beq _0801D862
	ldrb r0, [r5, #5]
	mov r4, sp
	mov r1, sp
	movs r2, #8
	bl mevent_recv_block
	ldrh r1, [r4, #4]
	strh r1, [r5, #0xc]
	ldrh r0, [r4, #2]
	strh r0, [r5, #0xa]
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x13
	cmp r1, r0
	bls _0801D7E2
_0801D7DC:
	bl LinkRfu_FatalError
	b _0801D862
_0801D7E2:
	mov r1, sp
	ldrh r0, [r5, #6]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0801D7DC
	strh r6, [r5, #8]
	ldrb r0, [r5, #5]
	bl mevent_reset_recv
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	b _0801D862
_0801D7FC:
	ldrb r0, [r5, #5]
	bl mevent_has_received
	cmp r0, #0
	beq _0801D862
	ldrh r0, [r5, #8]
	lsls r1, r0, #6
	subs r1, r1, r0
	lsls r3, r1, #2
	ldrh r0, [r5, #0xc]
	subs r2, r0, r3
	cmp r2, #0xfc
	bhi _0801D82E
	ldrb r0, [r5, #5]
	ldr r1, [r5, #0x18]
	adds r1, r1, r3
	bl mevent_recv_block
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	b _0801D840
_0801D82E:
	ldrb r0, [r5, #5]
	ldr r1, [r5, #0x18]
	adds r1, r1, r3
	movs r2, #0xfc
	bl mevent_recv_block
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_0801D840:
	ldrb r0, [r5, #5]
	bl mevent_reset_recv
	b _0801D862
_0801D848:
	ldr r0, [r5, #0x18]
	ldrh r1, [r5, #0xc]
	bl CalcCRC16WithTable
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #0xa]
	cmp r0, r1
	bne _0801D7DC
	movs r0, #0
	str r0, [r5]
	movs r0, #1
	b _0801D864
_0801D862:
	movs r0, #0
_0801D864:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end mevent_receive_func

	thumb_func_start mevent_send_func
mevent_send_func: @ 0x0801D86C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, [r4]
	cmp r5, #1
	beq _0801D8D8
	cmp r5, #1
	bgt _0801D882
	cmp r5, #0
	beq _0801D88C
	b _0801D96E
_0801D882:
	cmp r5, #2
	beq _0801D92C
	cmp r5, #3
	beq _0801D956
	b _0801D96E
_0801D88C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D96E
	ldrh r1, [r4, #0xe]
	ldr r2, _0801D8D0
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldrh r1, [r4, #0x14]
	ldr r0, [sp, #4]
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #4]
	ldr r0, [r4, #0x1c]
	bl CalcCRC16WithTable
	lsls r0, r0, #0x10
	ldr r2, _0801D8D4
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	lsrs r1, r1, #0x10
	strh r1, [r4, #0x12]
	strh r5, [r4, #0x10]
	movs r0, #0
	mov r1, sp
	movs r2, #8
	bl SendBlock
	b _0801D94E
	.align 2, 0
_0801D8D0: .4byte 0xFFFF0000
_0801D8D4: .4byte 0x0000FFFF
_0801D8D8:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D96E
	ldrb r0, [r4, #4]
	bl mevent_has_received
	cmp r0, #0
	beq _0801D96E
	ldrb r0, [r4, #4]
	bl mevent_reset_recv
	ldrh r1, [r4, #0x10]
	lsls r0, r1, #6
	subs r0, r0, r1
	lsls r3, r0, #2
	ldrh r0, [r4, #0x14]
	subs r0, r0, r3
	cmp r0, #0xfc
	bhi _0801D918
	ldr r1, [r4, #0x1c]
	adds r1, r1, r3
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SendBlock
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	b _0801D94E
_0801D918:
	ldr r1, [r4, #0x1c]
	adds r1, r1, r3
	movs r0, #0
	movs r2, #0xfc
	bl SendBlock
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	b _0801D96E
_0801D92C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D96E
	ldr r0, [r4, #0x1c]
	ldrh r1, [r4, #0x14]
	bl CalcCRC16WithTable
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x12]
	cmp r0, r1
	beq _0801D94E
	bl LinkRfu_FatalError
	b _0801D96E
_0801D94E:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	b _0801D96E
_0801D956:
	ldrb r0, [r4, #4]
	bl mevent_has_received
	cmp r0, #0
	beq _0801D96E
	ldrb r0, [r4, #4]
	bl mevent_reset_recv
	movs r0, #0
	str r0, [r4]
	movs r0, #1
	b _0801D970
_0801D96E:
	movs r0, #0
_0801D970:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end mevent_send_func

