.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ContestAI_ResetAI
ContestAI_ResetAI: @ 0x08156200
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _08156258
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0
	movs r2, #0x44
	bl memset
	movs r1, #0
	movs r3, #0x64
	adds r2, r4, #0
_0815621A:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	adds r0, #5
	adds r0, r0, r1
	strb r3, [r0]
	adds r1, #1
	cmp r1, #3
	ble _0815621A
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	adds r0, #0x41
	movs r1, #0
	strb r5, [r0]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	adds r0, #0x40
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, [r0, #0xc]
	ldr r1, _0815625C
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08156258: .4byte 0x02039BD4
_0815625C: .4byte 0x02039AA0
	thumb_func_end ContestAI_ResetAI

	thumb_func_start ContestAI_GetActionToUse
ContestAI_GetActionToUse: @ 0x08156260
	push {r4, r5, r6, lr}
	ldr r1, _081562E8
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _081562A6
	adds r4, r1, #0
	movs r5, #0
_08156272:
	ldr r0, [r4]
	ldr r2, [r0, #0xc]
	ldr r0, [r2, #0x14]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08156286
	strb r5, [r2]
	bl ContestAI_DoAIProcessing
_08156286:
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ldr r0, [r1, #0x14]
	lsrs r0, r0, #1
	str r0, [r1, #0x14]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	strb r5, [r0, #4]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _08156272
_081562A6:
	movs r6, #3
_081562A8:
	bl Random
	adds r5, r0, #0
	ands r5, r6
	ldr r4, _081562E8
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	adds r0, r1, #5
	adds r0, r0, r5
	ldrb r3, [r0]
	movs r2, #0
	ldrb r1, [r1, #5]
	cmp r3, r1
	blo _081562DA
	adds r1, r4, #0
_081562C6:
	adds r2, #1
	cmp r2, #3
	bgt _081562DA
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	adds r0, #5
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r3, r0
	bhs _081562C6
_081562DA:
	cmp r2, #4
	bne _081562A8
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081562E8: .4byte 0x02039BD4
	thumb_func_end ContestAI_GetActionToUse

	thumb_func_start ContestAI_DoAIProcessing
ContestAI_DoAIProcessing: @ 0x081562EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _08156344
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	ldrb r0, [r0]
	adds r4, r5, #0
	cmp r0, #2
	beq _081563DC
	adds r7, r5, #0
	ldr r6, _08156348
	ldr r0, _0815634C
	mov r8, r0
_08156308:
	ldr r0, [r7]
	ldr r2, [r0, #0xc]
	ldrb r0, [r2]
	cmp r0, #1
	beq _08156362
	cmp r0, #1
	bgt _081563D2
	cmp r0, #0
	bne _081563D2
	ldr r1, _08156350
	ldrb r0, [r2, #0x10]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r6]
	ldrb r1, [r2, #4]
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	add r1, r8
	ldrh r1, [r1]
	adds r0, r1, #0
	cmp r0, #0
	bne _08156354
	strh r0, [r2, #2]
	b _08156356
	.align 2, 0
_08156344: .4byte 0x02039BD4
_08156348: .4byte 0x0203A804
_0815634C: .4byte 0x02039ABE
_08156350: .4byte 0x0828C8D8
_08156354:
	strh r1, [r2, #2]
_08156356:
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081563D2
_08156362:
	ldrh r1, [r2, #2]
	cmp r1, #0
	beq _08156380
	ldr r1, _0815637C
	ldr r0, [r6]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _08156394
	.align 2, 0
_0815637C: .4byte 0x085ACB08
_08156380:
	adds r0, r2, #5
	ldrb r2, [r2, #4]
	adds r0, r0, r2
	strb r1, [r0]
	ldr r0, [r7]
	ldr r2, [r0, #0xc]
	ldrb r1, [r2, #9]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #9]
_08156394:
	ldr r2, _081563BC
	ldr r0, [r2]
	ldr r3, [r0, #0xc]
	ldrb r1, [r3, #9]
	movs r0, #1
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _081563D2
	ldrb r0, [r3, #4]
	adds r0, #1
	movs r2, #0
	strb r0, [r3, #4]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ldrb r0, [r1, #4]
	cmp r0, #3
	bhi _081563C0
	strb r2, [r1]
	b _081563C6
	.align 2, 0
_081563BC: .4byte 0x02039BD4
_081563C0:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_081563C6:
	ldr r0, [r4]
	ldr r2, [r0, #0xc]
	ldrb r1, [r2, #9]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2, #9]
_081563D2:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	ldrb r0, [r0]
	cmp r0, #2
	bne _08156308
_081563DC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAI_DoAIProcessing

	thumb_func_start sub_081563E8
sub_081563E8: @ 0x081563E8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _081563F8
	ldr r0, [r3]
	ldr r0, [r0, #8]
	b _08156408
	.align 2, 0
_081563F8: .4byte 0x02039BD4
_081563FC:
	adds r1, #1
	cmp r1, #3
	bgt _0815640E
	ldr r0, [r3]
	ldr r0, [r0, #8]
	adds r0, r0, r1
_08156408:
	ldrb r0, [r0]
	cmp r0, r2
	bne _081563FC
_0815640E:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081563E8

	thumb_func_start ContestAICmd_score
ContestAICmd_score: @ 0x08156418
	push {r4, lr}
	ldr r3, _08156444
	ldr r0, [r3]
	ldr r0, [r0, #0xc]
	adds r1, r0, #5
	ldrb r0, [r0, #4]
	adds r1, r1, r0
	ldr r2, _08156448
	ldr r0, [r2]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0815644C
	movs r4, #0xff
	b _08156452
	.align 2, 0
_08156444: .4byte 0x02039BD4
_08156448: .4byte 0x0203A804
_0815644C:
	cmp r0, #0
	bge _08156452
	movs r4, #0
_08156452:
	ldr r0, [r3]
	ldr r1, [r0, #0xc]
	adds r0, r1, #5
	ldrb r1, [r1, #4]
	adds r0, r0, r1
	strb r4, [r0]
	ldr r0, [r2]
	adds r0, #2
	str r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_score

	thumb_func_start ContestAICmd_get_turn
ContestAICmd_get_turn: @ 0x0815646C
	ldr r0, _08156484
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	strh r0, [r1, #0x18]
	ldr r1, _08156488
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08156484: .4byte 0x02039BD4
_08156488: .4byte 0x0203A804
	thumb_func_end ContestAICmd_get_turn

	thumb_func_start ContestAICmd_if_turn_less_than
ContestAICmd_if_turn_less_than: @ 0x0815648C
	push {lr}
	bl ContestAICmd_get_turn
	ldr r0, _081564C0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081564C4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _081564C8
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081564CC
	.align 2, 0
_081564C0: .4byte 0x02039BD4
_081564C4: .4byte 0x0203A804
_081564C8:
	adds r0, r2, #5
	str r0, [r3]
_081564CC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_turn_less_than

	thumb_func_start ContestAICmd_if_turn_more_than
ContestAICmd_if_turn_more_than: @ 0x081564D0
	push {lr}
	bl ContestAICmd_get_turn
	ldr r0, _08156504
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156508
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0815650C
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156510
	.align 2, 0
_08156504: .4byte 0x02039BD4
_08156508: .4byte 0x0203A804
_0815650C:
	adds r0, r2, #5
	str r0, [r3]
_08156510:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_turn_more_than

	thumb_func_start ContestAICmd_if_turn_eq
ContestAICmd_if_turn_eq: @ 0x08156514
	push {lr}
	bl ContestAICmd_get_turn
	ldr r0, _08156548
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0815654C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08156550
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156554
	.align 2, 0
_08156548: .4byte 0x02039BD4
_0815654C: .4byte 0x0203A804
_08156550:
	adds r0, r2, #5
	str r0, [r3]
_08156554:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_turn_eq

	thumb_func_start ContestAICmd_if_turn_not_eq
ContestAICmd_if_turn_not_eq: @ 0x08156558
	push {lr}
	bl ContestAICmd_get_turn
	ldr r0, _0815658C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156590
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08156594
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156598
	.align 2, 0
_0815658C: .4byte 0x02039BD4
_08156590: .4byte 0x0203A804
_08156594:
	adds r0, r2, #5
	str r0, [r3]
_08156598:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_turn_not_eq

	thumb_func_start ContestAICmd_get_excitement
ContestAICmd_get_excitement: @ 0x0815659C
	ldr r0, _081565B8
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0x18]
	ldr r1, _081565BC
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_081565B8: .4byte 0x02039BD4
_081565BC: .4byte 0x0203A804
	thumb_func_end ContestAICmd_get_excitement

	thumb_func_start ContestAICmd_if_excitement_less_than
ContestAICmd_if_excitement_less_than: @ 0x081565C0
	push {lr}
	bl ContestAICmd_get_excitement
	ldr r0, _081565F4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081565F8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _081565FC
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156600
	.align 2, 0
_081565F4: .4byte 0x02039BD4
_081565F8: .4byte 0x0203A804
_081565FC:
	adds r0, r2, #5
	str r0, [r3]
_08156600:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_excitement_less_than

	thumb_func_start ContestAICmd_if_excitement_more_than
ContestAICmd_if_excitement_more_than: @ 0x08156604
	push {lr}
	bl ContestAICmd_get_excitement
	ldr r0, _08156638
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0815663C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08156640
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156644
	.align 2, 0
_08156638: .4byte 0x02039BD4
_0815663C: .4byte 0x0203A804
_08156640:
	adds r0, r2, #5
	str r0, [r3]
_08156644:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_excitement_more_than

	thumb_func_start ContestAICmd_if_excitement_eq
ContestAICmd_if_excitement_eq: @ 0x08156648
	push {lr}
	bl ContestAICmd_get_excitement
	ldr r0, _0815667C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156680
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08156684
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156688
	.align 2, 0
_0815667C: .4byte 0x02039BD4
_08156680: .4byte 0x0203A804
_08156684:
	adds r0, r2, #5
	str r0, [r3]
_08156688:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_excitement_eq

	thumb_func_start ContestAICmd_if_excitement_not_eq
ContestAICmd_if_excitement_not_eq: @ 0x0815668C
	push {lr}
	bl ContestAICmd_get_excitement
	ldr r0, _081566C0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081566C4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081566C8
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081566CC
	.align 2, 0
_081566C0: .4byte 0x02039BD4
_081566C4: .4byte 0x0203A804
_081566C8:
	adds r0, r2, #5
	str r0, [r3]
_081566CC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_excitement_not_eq

	thumb_func_start ContestAICmd_get_user_order
ContestAICmd_get_user_order: @ 0x081566D0
	ldr r0, _081566F0
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #8]
	adds r1, r2, #0
	adds r1, #0x41
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r2, #0x18]
	ldr r1, _081566F4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_081566F0: .4byte 0x02039BD4
_081566F4: .4byte 0x0203A804
	thumb_func_end ContestAICmd_get_user_order

	thumb_func_start ContestAICmd_if_user_order_less_than
ContestAICmd_if_user_order_less_than: @ 0x081566F8
	push {lr}
	bl ContestAICmd_get_user_order
	ldr r0, _0815672C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156730
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08156734
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156738
	.align 2, 0
_0815672C: .4byte 0x02039BD4
_08156730: .4byte 0x0203A804
_08156734:
	adds r0, r2, #5
	str r0, [r3]
_08156738:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_user_order_less_than

	thumb_func_start ContestAICmd_if_user_order_more_than
ContestAICmd_if_user_order_more_than: @ 0x0815673C
	push {lr}
	bl ContestAICmd_get_user_order
	ldr r0, _08156770
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156774
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08156778
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0815677C
	.align 2, 0
_08156770: .4byte 0x02039BD4
_08156774: .4byte 0x0203A804
_08156778:
	adds r0, r2, #5
	str r0, [r3]
_0815677C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_user_order_more_than

	thumb_func_start ContestAICmd_if_user_order_eq
ContestAICmd_if_user_order_eq: @ 0x08156780
	push {lr}
	bl ContestAICmd_get_user_order
	ldr r0, _081567B4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081567B8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081567BC
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081567C0
	.align 2, 0
_081567B4: .4byte 0x02039BD4
_081567B8: .4byte 0x0203A804
_081567BC:
	adds r0, r2, #5
	str r0, [r3]
_081567C0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_user_order_eq

	thumb_func_start ContestAICmd_if_user_order_not_eq
ContestAICmd_if_user_order_not_eq: @ 0x081567C4
	push {lr}
	bl ContestAICmd_get_user_order
	ldr r0, _081567F8
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081567FC
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08156800
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156804
	.align 2, 0
_081567F8: .4byte 0x02039BD4
_081567FC: .4byte 0x0203A804
_08156800:
	adds r0, r2, #5
	str r0, [r3]
_08156804:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_user_order_not_eq

	thumb_func_start ContestAICmd_get_user_condition
ContestAICmd_get_user_condition: @ 0x08156808
	push {r4, lr}
	ldr r0, _08156840
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r1, [r1]
	ldr r2, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x18]
	ldr r1, _08156844
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08156840: .4byte 0x02039BD4
_08156844: .4byte 0x0203A804
	thumb_func_end ContestAICmd_get_user_condition

	thumb_func_start ContestAICmd_if_user_condition_less_than
ContestAICmd_if_user_condition_less_than: @ 0x08156848
	push {lr}
	bl ContestAICmd_get_user_condition
	ldr r0, _0815687C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156880
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08156884
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156888
	.align 2, 0
_0815687C: .4byte 0x02039BD4
_08156880: .4byte 0x0203A804
_08156884:
	adds r0, r2, #5
	str r0, [r3]
_08156888:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_user_condition_less_than

	thumb_func_start ContestAICmd_if_user_condition_more_than
ContestAICmd_if_user_condition_more_than: @ 0x0815688C
	push {lr}
	bl ContestAICmd_get_user_condition
	ldr r0, _081568C0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081568C4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _081568C8
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081568CC
	.align 2, 0
_081568C0: .4byte 0x02039BD4
_081568C4: .4byte 0x0203A804
_081568C8:
	adds r0, r2, #5
	str r0, [r3]
_081568CC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_user_condition_more_than

	thumb_func_start ContestAICmd_if_user_condition_eq
ContestAICmd_if_user_condition_eq: @ 0x081568D0
	push {lr}
	bl ContestAICmd_get_user_condition
	ldr r0, _08156904
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156908
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0815690C
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156910
	.align 2, 0
_08156904: .4byte 0x02039BD4
_08156908: .4byte 0x0203A804
_0815690C:
	adds r0, r2, #5
	str r0, [r3]
_08156910:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_user_condition_eq

	thumb_func_start ContestAICmd_if_user_condition_not_eq
ContestAICmd_if_user_condition_not_eq: @ 0x08156914
	push {lr}
	bl ContestAICmd_get_user_condition
	ldr r0, _08156948
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0815694C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08156950
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156954
	.align 2, 0
_08156948: .4byte 0x02039BD4
_0815694C: .4byte 0x0203A804
_08156950:
	adds r0, r2, #5
	str r0, [r3]
_08156954:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_user_condition_not_eq

	thumb_func_start ContestAICmd_unk_15
ContestAICmd_unk_15: @ 0x08156958
	ldr r0, _0815697C
	ldr r0, [r0]
	ldr r3, [r0, #0xc]
	adds r1, r3, #0
	adds r1, #0x41
	ldrb r1, [r1]
	ldr r2, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r3, #0x18]
	ldr r1, _08156980
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0815697C: .4byte 0x02039BD4
_08156980: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_15

	thumb_func_start ContestAICmd_unk_1B
ContestAICmd_unk_1B: @ 0x08156984
	push {r4, r5, lr}
	bl ContestAICmd_unk_15
	ldr r0, _081569C0
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _081569C4
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	orrs r1, r0
	movs r5, #0x18
	ldrsh r0, [r2, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bge _081569C8
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _081569CC
	.align 2, 0
_081569C0: .4byte 0x02039BD4
_081569C4: .4byte 0x0203A804
_081569C8:
	adds r0, r3, #6
	str r0, [r4]
_081569CC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_1B

	thumb_func_start ContestAICmd_unk_17
ContestAICmd_unk_17: @ 0x081569D4
	push {r4, r5, lr}
	bl ContestAICmd_unk_15
	ldr r0, _08156A10
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08156A14
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	orrs r1, r0
	movs r5, #0x18
	ldrsh r0, [r2, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	ble _08156A18
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08156A1C
	.align 2, 0
_08156A10: .4byte 0x02039BD4
_08156A14: .4byte 0x0203A804
_08156A18:
	adds r0, r3, #6
	str r0, [r4]
_08156A1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_17

	thumb_func_start ContestAICmd_unk_18
ContestAICmd_unk_18: @ 0x08156A24
	push {r4, r5, lr}
	bl ContestAICmd_unk_15
	ldr r0, _08156A60
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08156A64
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	orrs r1, r0
	movs r5, #0x18
	ldrsh r0, [r2, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bne _08156A68
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08156A6C
	.align 2, 0
_08156A60: .4byte 0x02039BD4
_08156A64: .4byte 0x0203A804
_08156A68:
	adds r0, r3, #6
	str r0, [r4]
_08156A6C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_18

	thumb_func_start ContestAICmd_unk_1E
ContestAICmd_unk_1E: @ 0x08156A74
	push {r4, r5, lr}
	bl ContestAICmd_unk_15
	ldr r0, _08156AB0
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08156AB4
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	orrs r1, r0
	movs r5, #0x18
	ldrsh r0, [r2, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	beq _08156AB8
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08156ABC
	.align 2, 0
_08156AB0: .4byte 0x02039BD4
_08156AB4: .4byte 0x0203A804
_08156AB8:
	adds r0, r3, #6
	str r0, [r4]
_08156ABC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_1E

	thumb_func_start ContestAICmd_unk_1A
ContestAICmd_unk_1A: @ 0x08156AC4
	ldr r0, _08156AE4
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r1, _08156AE8
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x18]
	ldr r1, _08156AEC
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08156AE4: .4byte 0x02039BD4
_08156AE8: .4byte 0x02039BA0
_08156AEC: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_1A

	thumb_func_start ContestAICmd_unk_16
ContestAICmd_unk_16: @ 0x08156AF0
	push {r4, r5, lr}
	bl ContestAICmd_unk_1A
	ldr r0, _08156B2C
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08156B30
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	orrs r1, r0
	movs r5, #0x18
	ldrsh r0, [r2, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bge _08156B34
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08156B38
	.align 2, 0
_08156B2C: .4byte 0x02039BD4
_08156B30: .4byte 0x0203A804
_08156B34:
	adds r0, r3, #6
	str r0, [r4]
_08156B38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_16

	thumb_func_start ContestAICmd_unk_1C
ContestAICmd_unk_1C: @ 0x08156B40
	push {r4, r5, lr}
	bl ContestAICmd_unk_1A
	ldr r0, _08156B7C
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08156B80
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	orrs r1, r0
	movs r5, #0x18
	ldrsh r0, [r2, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	ble _08156B84
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08156B88
	.align 2, 0
_08156B7C: .4byte 0x02039BD4
_08156B80: .4byte 0x0203A804
_08156B84:
	adds r0, r3, #6
	str r0, [r4]
_08156B88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_1C

	thumb_func_start ContestAICmd_unk_1D
ContestAICmd_unk_1D: @ 0x08156B90
	push {r4, r5, lr}
	bl ContestAICmd_unk_1A
	ldr r0, _08156BCC
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08156BD0
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	orrs r1, r0
	movs r5, #0x18
	ldrsh r0, [r2, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bne _08156BD4
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08156BD8
	.align 2, 0
_08156BCC: .4byte 0x02039BD4
_08156BD0: .4byte 0x0203A804
_08156BD4:
	adds r0, r3, #6
	str r0, [r4]
_08156BD8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_1D

	thumb_func_start ContestAICmd_unk_19
ContestAICmd_unk_19: @ 0x08156BE0
	push {r4, r5, lr}
	bl ContestAICmd_unk_1A
	ldr r0, _08156C1C
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08156C20
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	orrs r1, r0
	movs r5, #0x18
	ldrsh r0, [r2, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	beq _08156C24
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08156C28
	.align 2, 0
_08156C1C: .4byte 0x02039BD4
_08156C20: .4byte 0x0203A804
_08156C24:
	adds r0, r3, #6
	str r0, [r4]
_08156C28:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_19

	thumb_func_start ContestAICmd_get_contest_type
ContestAICmd_get_contest_type: @ 0x08156C30
	ldr r0, _08156C48
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, _08156C4C
	ldrh r0, [r0]
	strh r0, [r1, #0x18]
	ldr r1, _08156C50
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08156C48: .4byte 0x02039BD4
_08156C4C: .4byte 0x02039BCC
_08156C50: .4byte 0x0203A804
	thumb_func_end ContestAICmd_get_contest_type

	thumb_func_start ContestAICmd_if_contest_type_eq
ContestAICmd_if_contest_type_eq: @ 0x08156C54
	push {lr}
	bl ContestAICmd_get_contest_type
	ldr r0, _08156C88
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156C8C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08156C90
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156C94
	.align 2, 0
_08156C88: .4byte 0x02039BD4
_08156C8C: .4byte 0x0203A804
_08156C90:
	adds r0, r2, #5
	str r0, [r3]
_08156C94:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_contest_type_eq

	thumb_func_start ContestAICmd_if_contest_type_not_eq
ContestAICmd_if_contest_type_not_eq: @ 0x08156C98
	push {lr}
	bl ContestAICmd_get_contest_type
	ldr r0, _08156CCC
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156CD0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08156CD4
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156CD8
	.align 2, 0
_08156CCC: .4byte 0x02039BD4
_08156CD0: .4byte 0x0203A804
_08156CD4:
	adds r0, r2, #5
	str r0, [r3]
_08156CD8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_contest_type_not_eq

	thumb_func_start ContestAICmd_get_move_excitement
ContestAICmd_get_move_excitement: @ 0x08156CDC
	push {r4, lr}
	ldr r2, _08156D14
	ldr r4, _08156D18
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	ldrb r1, [r0, #4]
	lsls r1, r1, #1
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r0, [r1]
	bl Contest_GetMoveExcitement
	ldr r1, [r4]
	ldr r1, [r1, #0xc]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0x18]
	ldr r1, _08156D1C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08156D14: .4byte 0x02039AA0
_08156D18: .4byte 0x02039BD4
_08156D1C: .4byte 0x0203A804
	thumb_func_end ContestAICmd_get_move_excitement

	thumb_func_start ContestAICmd_if_move_excitement_less_than
ContestAICmd_if_move_excitement_less_than: @ 0x08156D20
	push {r4, lr}
	bl ContestAICmd_get_move_excitement
	ldr r0, _08156D54
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldr r3, _08156D58
	ldr r2, [r3]
	movs r4, #0x18
	ldrsh r1, [r0, r4]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bge _08156D5C
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156D60
	.align 2, 0
_08156D54: .4byte 0x02039BD4
_08156D58: .4byte 0x0203A804
_08156D5C:
	adds r0, r2, #5
	str r0, [r3]
_08156D60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_if_move_excitement_less_than

	thumb_func_start ContestAICmd_if_move_excitement_greater_than
ContestAICmd_if_move_excitement_greater_than: @ 0x08156D68
	push {r4, lr}
	bl ContestAICmd_get_move_excitement
	ldr r0, _08156D9C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldr r3, _08156DA0
	ldr r2, [r3]
	movs r4, #0x18
	ldrsh r1, [r0, r4]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	ble _08156DA4
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156DA8
	.align 2, 0
_08156D9C: .4byte 0x02039BD4
_08156DA0: .4byte 0x0203A804
_08156DA4:
	adds r0, r2, #5
	str r0, [r3]
_08156DA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_if_move_excitement_greater_than

	thumb_func_start ContestAICmd_if_move_excitement_eq
ContestAICmd_if_move_excitement_eq: @ 0x08156DB0
	push {r4, lr}
	bl ContestAICmd_get_move_excitement
	ldr r0, _08156DE4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldr r3, _08156DE8
	ldr r2, [r3]
	movs r4, #0x18
	ldrsh r1, [r0, r4]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08156DEC
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156DF0
	.align 2, 0
_08156DE4: .4byte 0x02039BD4
_08156DE8: .4byte 0x0203A804
_08156DEC:
	adds r0, r2, #5
	str r0, [r3]
_08156DF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_if_move_excitement_eq

	thumb_func_start ContestAICmd_if_move_excitement_not_eq
ContestAICmd_if_move_excitement_not_eq: @ 0x08156DF8
	push {r4, lr}
	bl ContestAICmd_get_move_excitement
	ldr r0, _08156E2C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldr r3, _08156E30
	ldr r2, [r3]
	movs r4, #0x18
	ldrsh r1, [r0, r4]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _08156E34
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156E38
	.align 2, 0
_08156E2C: .4byte 0x02039BD4
_08156E30: .4byte 0x0203A804
_08156E34:
	adds r0, r2, #5
	str r0, [r3]
_08156E38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_if_move_excitement_not_eq

	thumb_func_start ContestAICmd_get_move_effect
ContestAICmd_get_move_effect: @ 0x08156E40
	ldr r2, _08156E70
	ldr r0, _08156E74
	ldr r0, [r0]
	ldr r3, [r0, #0xc]
	ldrb r1, [r3, #4]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r0, [r1]
	ldr r1, _08156E78
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r3, #0x18]
	ldr r1, _08156E7C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08156E70: .4byte 0x02039AA0
_08156E74: .4byte 0x02039BD4
_08156E78: .4byte 0x08565FCC
_08156E7C: .4byte 0x0203A804
	thumb_func_end ContestAICmd_get_move_effect

	thumb_func_start ContestAICmd_if_move_effect_eq
ContestAICmd_if_move_effect_eq: @ 0x08156E80
	push {lr}
	bl ContestAICmd_get_move_effect
	ldr r0, _08156EB4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156EB8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08156EBC
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156EC0
	.align 2, 0
_08156EB4: .4byte 0x02039BD4
_08156EB8: .4byte 0x0203A804
_08156EBC:
	adds r0, r2, #5
	str r0, [r3]
_08156EC0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_move_effect_eq

	thumb_func_start ContestAICmd_if_move_effect_not_eq
ContestAICmd_if_move_effect_not_eq: @ 0x08156EC4
	push {lr}
	bl ContestAICmd_get_move_effect
	ldr r0, _08156EF8
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156EFC
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08156F00
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156F04
	.align 2, 0
_08156EF8: .4byte 0x02039BD4
_08156EFC: .4byte 0x0203A804
_08156F00:
	adds r0, r2, #5
	str r0, [r3]
_08156F04:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_move_effect_not_eq

	thumb_func_start ContestAICmd_get_move_effect_type
ContestAICmd_get_move_effect_type: @ 0x08156F08
	ldr r2, _08156F40
	ldr r0, _08156F44
	ldr r0, [r0]
	ldr r3, [r0, #0xc]
	ldrb r1, [r3, #4]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r0, [r1]
	ldr r2, _08156F48
	ldr r1, _08156F4C
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r3, #0x18]
	ldr r1, _08156F50
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08156F40: .4byte 0x02039AA0
_08156F44: .4byte 0x02039BD4
_08156F48: .4byte 0x08566AE4
_08156F4C: .4byte 0x08565FCC
_08156F50: .4byte 0x0203A804
	thumb_func_end ContestAICmd_get_move_effect_type

	thumb_func_start ContestAICmd_if_move_effect_type_eq
ContestAICmd_if_move_effect_type_eq: @ 0x08156F54
	push {lr}
	bl ContestAICmd_get_move_effect_type
	ldr r0, _08156F88
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156F8C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08156F90
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156F94
	.align 2, 0
_08156F88: .4byte 0x02039BD4
_08156F8C: .4byte 0x0203A804
_08156F90:
	adds r0, r2, #5
	str r0, [r3]
_08156F94:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_move_effect_type_eq

	thumb_func_start ContestAICmd_if_move_effect_type_not_eq
ContestAICmd_if_move_effect_type_not_eq: @ 0x08156F98
	push {lr}
	bl ContestAICmd_get_move_effect_type
	ldr r0, _08156FCC
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08156FD0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08156FD4
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08156FD8
	.align 2, 0
_08156FCC: .4byte 0x02039BD4
_08156FD0: .4byte 0x0203A804
_08156FD4:
	adds r0, r2, #5
	str r0, [r3]
_08156FD8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_move_effect_type_not_eq

	thumb_func_start ContestAICmd_check_most_appealing_move
ContestAICmd_check_most_appealing_move: @ 0x08156FDC
	push {r4, r5, r6, r7, lr}
	ldr r2, _0815703C
	ldr r5, _08157040
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	ldrb r0, [r1, #4]
	lsls r0, r0, #1
	adds r1, #0x41
	ldrb r1, [r1]
	lsls r1, r1, #6
	adds r0, r0, r1
	adds r2, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r3, _08157044
	ldr r4, _08157048
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r7, [r0, #1]
	movs r6, #0
	ldr r0, _0815704C
	mov ip, r0
	adds r1, r1, r2
_08157010:
	ldrh r0, [r1]
	cmp r0, #0
	beq _08157026
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	cmp r7, r0
	blo _0815702E
_08157026:
	adds r1, #2
	adds r6, #1
	cmp r6, #3
	ble _08157010
_0815702E:
	cmp r6, #4
	bne _08157050
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r0, #1
	b _08157056
	.align 2, 0
_0815703C: .4byte 0x02039AA0
_08157040: .4byte 0x02039BD4
_08157044: .4byte 0x08566AE4
_08157048: .4byte 0x08565FCC
_0815704C: .4byte 0x0203A804
_08157050:
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r0, #0
_08157056:
	strh r0, [r1, #0x18]
	mov r1, ip
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_check_most_appealing_move

	thumb_func_start ContestAICmd_if_most_appealing_move
ContestAICmd_if_most_appealing_move: @ 0x08157068
	push {lr}
	bl ContestAICmd_check_most_appealing_move
	ldr r0, _08157098
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _081570A0
	ldr r3, _0815709C
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081570A8
	.align 2, 0
_08157098: .4byte 0x02039BD4
_0815709C: .4byte 0x0203A804
_081570A0:
	ldr r1, _081570AC
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_081570A8:
	pop {r0}
	bx r0
	.align 2, 0
_081570AC: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_most_appealing_move

	thumb_func_start ContestAICmd_unk_2F
ContestAICmd_unk_2F: @ 0x081570B0
	push {r4, r5, r6, r7, lr}
	ldr r2, _08157110
	ldr r5, _08157114
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	ldrb r0, [r1, #4]
	lsls r0, r0, #1
	adds r1, #0x41
	ldrb r1, [r1]
	lsls r1, r1, #6
	adds r0, r0, r1
	adds r2, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r3, _08157118
	ldr r4, _0815711C
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r7, [r0, #2]
	movs r6, #0
	ldr r0, _08157120
	mov ip, r0
	adds r1, r1, r2
_081570E4:
	ldrh r0, [r1]
	cmp r0, #0
	beq _081570FA
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	cmp r7, r0
	blo _08157102
_081570FA:
	adds r1, #2
	adds r6, #1
	cmp r6, #3
	ble _081570E4
_08157102:
	cmp r6, #4
	bne _08157124
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r0, #1
	b _0815712A
	.align 2, 0
_08157110: .4byte 0x02039AA0
_08157114: .4byte 0x02039BD4
_08157118: .4byte 0x08566AE4
_0815711C: .4byte 0x08565FCC
_08157120: .4byte 0x0203A804
_08157124:
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r0, #0
_0815712A:
	strh r0, [r1, #0x18]
	mov r1, ip
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_2F

	thumb_func_start ContestAICmd_unk_30
ContestAICmd_unk_30: @ 0x0815713C
	push {lr}
	bl ContestAICmd_unk_2F
	ldr r0, _0815716C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08157174
	ldr r3, _08157170
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0815717C
	.align 2, 0
_0815716C: .4byte 0x02039BD4
_08157170: .4byte 0x0203A804
_08157174:
	ldr r1, _08157180
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
_0815717C:
	pop {r0}
	bx r0
	.align 2, 0
_08157180: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_30

	thumb_func_start ContestAICmd_unk_31
ContestAICmd_unk_31: @ 0x08157184
	push {r4, lr}
	ldr r2, _081571CC
	ldr r0, _081571D0
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	ldrb r1, [r4, #4]
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r0, [r1]
	ldr r2, _081571D4
	ldr r1, _081571D8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x18]
	ldr r1, _081571DC
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081571CC: .4byte 0x02039AA0
_081571D0: .4byte 0x02039BD4
_081571D4: .4byte 0x08566AE4
_081571D8: .4byte 0x08565FCC
_081571DC: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_31

	thumb_func_start ContestAICmd_unk_32
ContestAICmd_unk_32: @ 0x081571E0
	push {lr}
	bl ContestAICmd_unk_31
	ldr r0, _08157214
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157218
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _0815721C
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157220
	.align 2, 0
_08157214: .4byte 0x02039BD4
_08157218: .4byte 0x0203A804
_0815721C:
	adds r0, r2, #5
	str r0, [r3]
_08157220:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_32

	thumb_func_start ContestAICmd_if_used_combo_starter_more_than
ContestAICmd_if_used_combo_starter_more_than: @ 0x08157224
	push {lr}
	bl ContestAICmd_unk_31
	ldr r0, _08157258
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0815725C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08157260
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157264
	.align 2, 0
_08157258: .4byte 0x02039BD4
_0815725C: .4byte 0x0203A804
_08157260:
	adds r0, r2, #5
	str r0, [r3]
_08157264:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_used_combo_starter_more_than

	thumb_func_start ContestAICmd_if_used_combo_starter_eq
ContestAICmd_if_used_combo_starter_eq: @ 0x08157268
	push {lr}
	bl ContestAICmd_unk_31
	ldr r0, _0815729C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081572A0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081572A4
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081572A8
	.align 2, 0
_0815729C: .4byte 0x02039BD4
_081572A0: .4byte 0x0203A804
_081572A4:
	adds r0, r2, #5
	str r0, [r3]
_081572A8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_used_combo_starter_eq

	thumb_func_start ContestAICmd_unk_35
ContestAICmd_unk_35: @ 0x081572AC
	push {lr}
	bl ContestAICmd_unk_31
	ldr r0, _081572E0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081572E4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081572E8
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081572EC
	.align 2, 0
_081572E0: .4byte 0x02039BD4
_081572E4: .4byte 0x0203A804
_081572E8:
	adds r0, r2, #5
	str r0, [r3]
_081572EC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_35

	thumb_func_start ContestAICmd_unk_36
ContestAICmd_unk_36: @ 0x081572F0
	push {r4, lr}
	ldr r2, _08157338
	ldr r0, _0815733C
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	ldrb r1, [r4, #4]
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r0, [r1]
	ldr r2, _08157340
	ldr r1, _08157344
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x18]
	ldr r1, _08157348
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08157338: .4byte 0x02039AA0
_0815733C: .4byte 0x02039BD4
_08157340: .4byte 0x08566AE4
_08157344: .4byte 0x08565FCC
_08157348: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_36

	thumb_func_start ContestAICmd_unk_37
ContestAICmd_unk_37: @ 0x0815734C
	push {lr}
	bl ContestAICmd_unk_36
	ldr r0, _08157380
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157384
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08157388
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0815738C
	.align 2, 0
_08157380: .4byte 0x02039BD4
_08157384: .4byte 0x0203A804
_08157388:
	adds r0, r2, #5
	str r0, [r3]
_0815738C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_37

	thumb_func_start ContestAICmd_unk_33
ContestAICmd_unk_33: @ 0x08157390
	push {lr}
	bl ContestAICmd_unk_36
	ldr r0, _081573C4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081573C8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _081573CC
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081573D0
	.align 2, 0
_081573C4: .4byte 0x02039BD4
_081573C8: .4byte 0x0203A804
_081573CC:
	adds r0, r2, #5
	str r0, [r3]
_081573D0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_33

	thumb_func_start ContestAICmd_unk_34
ContestAICmd_unk_34: @ 0x081573D4
	push {lr}
	bl ContestAICmd_unk_36
	ldr r0, _08157408
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0815740C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08157410
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157414
	.align 2, 0
_08157408: .4byte 0x02039BD4
_0815740C: .4byte 0x0203A804
_08157410:
	adds r0, r2, #5
	str r0, [r3]
_08157414:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_34

	thumb_func_start ContestAICmd_unk_3A
ContestAICmd_unk_3A: @ 0x08157418
	push {lr}
	bl ContestAICmd_unk_36
	ldr r0, _0815744C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157450
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08157454
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157458
	.align 2, 0
_0815744C: .4byte 0x02039BD4
_08157450: .4byte 0x0203A804
_08157454:
	adds r0, r2, #5
	str r0, [r3]
_08157458:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_3A

	thumb_func_start ContestAICmd_get_move_used_count
ContestAICmd_get_move_used_count: @ 0x0815745C
	push {r4, r5, lr}
	ldr r3, _0815748C
	ldr r5, _08157490
	ldr r4, [r5]
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #4]
	lsls r0, r0, #1
	adds r1, #0x41
	ldrb r2, [r1]
	lsls r1, r2, #6
	adds r0, r0, r1
	adds r3, #0x1e
	adds r0, r0, r3
	ldrh r3, [r0]
	ldr r1, [r4, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	cmp r3, r1
	beq _08157494
	movs r1, #0
	b _0815749C
	.align 2, 0
_0815748C: .4byte 0x02039AA0
_08157490: .4byte 0x02039BD4
_08157494:
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	adds r1, r0, #1
_0815749C:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	strh r1, [r0, #0x18]
	ldr r1, _081574B0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081574B0: .4byte 0x0203A804
	thumb_func_end ContestAICmd_get_move_used_count

	thumb_func_start ContestAICmd_if_most_used_count_less_than
ContestAICmd_if_most_used_count_less_than: @ 0x081574B4
	push {lr}
	bl ContestAICmd_get_move_used_count
	ldr r0, _081574E8
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081574EC
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _081574F0
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081574F4
	.align 2, 0
_081574E8: .4byte 0x02039BD4
_081574EC: .4byte 0x0203A804
_081574F0:
	adds r0, r2, #5
	str r0, [r3]
_081574F4:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_most_used_count_less_than

	thumb_func_start ContestAICmd_if_most_used_count_more_than
ContestAICmd_if_most_used_count_more_than: @ 0x081574F8
	push {lr}
	bl ContestAICmd_get_move_used_count
	ldr r0, _0815752C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157530
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08157534
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157538
	.align 2, 0
_0815752C: .4byte 0x02039BD4
_08157530: .4byte 0x0203A804
_08157534:
	adds r0, r2, #5
	str r0, [r3]
_08157538:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_most_used_count_more_than

	thumb_func_start ContestAICmd_if_most_used_count_eq
ContestAICmd_if_most_used_count_eq: @ 0x0815753C
	push {lr}
	bl ContestAICmd_get_move_used_count
	ldr r0, _08157570
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157574
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08157578
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0815757C
	.align 2, 0
_08157570: .4byte 0x02039BD4
_08157574: .4byte 0x0203A804
_08157578:
	adds r0, r2, #5
	str r0, [r3]
_0815757C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_most_used_count_eq

	thumb_func_start ContestAICmd_if_most_used_count_not_eq
ContestAICmd_if_most_used_count_not_eq: @ 0x08157580
	push {lr}
	bl ContestAICmd_get_move_used_count
	ldr r0, _081575B4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081575B8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081575BC
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081575C0
	.align 2, 0
_081575B4: .4byte 0x02039BD4
_081575B8: .4byte 0x0203A804
_081575BC:
	adds r0, r2, #5
	str r0, [r3]
_081575C0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_most_used_count_not_eq

	thumb_func_start ContestAICmd_check_combo_starter
ContestAICmd_check_combo_starter: @ 0x081575C4
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r2, _08157630
	ldr r0, _08157634
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrb r1, [r0, #4]
	lsls r1, r1, #1
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	movs r4, #0
	adds r6, r2, #0
_081575E6:
	lsls r1, r4, #1
	ldr r0, _08157634
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	cmp r0, #0
	beq _0815760E
	adds r1, r0, #0
	adds r0, r5, #0
	bl AreMovesContestCombo
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08157618
_0815760E:
	adds r4, #1
	cmp r4, #3
	ble _081575E6
	cmp r3, #0
	beq _0815761A
_08157618:
	movs r3, #1
_0815761A:
	ldr r0, _08157634
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	strh r3, [r0, #0x18]
	ldr r1, _08157638
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08157630: .4byte 0x02039AA0
_08157634: .4byte 0x02039BD4
_08157638: .4byte 0x0203A804
	thumb_func_end ContestAICmd_check_combo_starter

	thumb_func_start ContestAICmd_if_combo_starter
ContestAICmd_if_combo_starter: @ 0x0815763C
	push {lr}
	bl ContestAICmd_check_combo_starter
	ldr r0, _0815766C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08157674
	ldr r3, _08157670
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0815767C
	.align 2, 0
_0815766C: .4byte 0x02039BD4
_08157670: .4byte 0x0203A804
_08157674:
	ldr r1, _08157680
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_0815767C:
	pop {r0}
	bx r0
	.align 2, 0
_08157680: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_combo_starter

	thumb_func_start ContestAICmd_if_not_combo_starter
ContestAICmd_if_not_combo_starter: @ 0x08157684
	push {lr}
	bl ContestAICmd_check_combo_starter
	ldr r0, _081576B4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _081576BC
	ldr r3, _081576B8
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081576C4
	.align 2, 0
_081576B4: .4byte 0x02039BD4
_081576B8: .4byte 0x0203A804
_081576BC:
	ldr r1, _081576C8
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_081576C4:
	pop {r0}
	bx r0
	.align 2, 0
_081576C8: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_not_combo_starter

	thumb_func_start ContestAICmd_check_combo_finisher
ContestAICmd_check_combo_finisher: @ 0x081576CC
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r2, _08157738
	ldr r0, _0815773C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrb r1, [r0, #4]
	lsls r1, r1, #1
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	movs r4, #0
	adds r6, r2, #0
_081576EE:
	lsls r1, r4, #1
	ldr r0, _0815773C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	cmp r0, #0
	beq _08157714
	adds r1, r5, #0
	bl AreMovesContestCombo
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0815771E
_08157714:
	adds r4, #1
	cmp r4, #3
	ble _081576EE
	cmp r3, #0
	beq _08157720
_0815771E:
	movs r3, #1
_08157720:
	ldr r0, _0815773C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	strh r3, [r0, #0x18]
	ldr r1, _08157740
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08157738: .4byte 0x02039AA0
_0815773C: .4byte 0x02039BD4
_08157740: .4byte 0x0203A804
	thumb_func_end ContestAICmd_check_combo_finisher

	thumb_func_start ContestAICmd_if_combo_finisher
ContestAICmd_if_combo_finisher: @ 0x08157744
	push {lr}
	bl ContestAICmd_check_combo_finisher
	ldr r0, _08157774
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0815777C
	ldr r3, _08157778
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157784
	.align 2, 0
_08157774: .4byte 0x02039BD4
_08157778: .4byte 0x0203A804
_0815777C:
	ldr r1, _08157788
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157784:
	pop {r0}
	bx r0
	.align 2, 0
_08157788: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_combo_finisher

	thumb_func_start ContestAICmd_if_not_combo_finisher
ContestAICmd_if_not_combo_finisher: @ 0x0815778C
	push {lr}
	bl ContestAICmd_check_combo_finisher
	ldr r0, _081577BC
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _081577C4
	ldr r3, _081577C0
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081577CC
	.align 2, 0
_081577BC: .4byte 0x02039BD4
_081577C0: .4byte 0x0203A804
_081577C4:
	ldr r1, _081577D0
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_081577CC:
	pop {r0}
	bx r0
	.align 2, 0
_081577D0: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_not_combo_finisher

	thumb_func_start ContestAICmd_check_would_finish_combo
ContestAICmd_check_would_finish_combo: @ 0x081577D4
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r3, _08157828
	ldr r6, _0815782C
	ldr r4, [r6]
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #4]
	lsls r0, r0, #1
	adds r1, #0x41
	ldrb r2, [r1]
	lsls r1, r2, #6
	adds r0, r0, r1
	adds r3, #0x1e
	adds r0, r0, r3
	ldrh r3, [r0]
	ldr r1, [r4, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrh r0, [r1, #8]
	cmp r0, #0
	beq _0815780C
	adds r1, r3, #0
	bl AreMovesContestCombo
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0815780C:
	cmp r5, #0
	beq _08157812
	movs r5, #1
_08157812:
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	strh r5, [r0, #0x18]
	ldr r1, _08157830
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08157828: .4byte 0x02039AA0
_0815782C: .4byte 0x02039BD4
_08157830: .4byte 0x0203A804
	thumb_func_end ContestAICmd_check_would_finish_combo

	thumb_func_start ContestAICmd_if_would_finish_combo
ContestAICmd_if_would_finish_combo: @ 0x08157834
	push {lr}
	bl ContestAICmd_check_would_finish_combo
	ldr r0, _08157864
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0815786C
	ldr r3, _08157868
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157874
	.align 2, 0
_08157864: .4byte 0x02039BD4
_08157868: .4byte 0x0203A804
_0815786C:
	ldr r1, _08157878
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157874:
	pop {r0}
	bx r0
	.align 2, 0
_08157878: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_would_finish_combo

	thumb_func_start ContestAICmd_if_would_not_finish_combo
ContestAICmd_if_would_not_finish_combo: @ 0x0815787C
	push {lr}
	bl ContestAICmd_check_would_finish_combo
	ldr r0, _081578AC
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _081578B4
	ldr r3, _081578B0
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081578BC
	.align 2, 0
_081578AC: .4byte 0x02039BD4
_081578B0: .4byte 0x0203A804
_081578B4:
	ldr r1, _081578C0
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_081578BC:
	pop {r0}
	bx r0
	.align 2, 0
_081578C0: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_would_not_finish_combo

	thumb_func_start ContestAICmd_get_condition
ContestAICmd_get_condition: @ 0x081578C4
	push {r4, r5, lr}
	ldr r4, _08157900
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl sub_081563E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08157904
	ldr r1, [r1]
	ldr r5, [r1, #0xc]
	ldr r2, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0xd
	ldrsb r0, [r1, r0]
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0x18]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08157900: .4byte 0x0203A804
_08157904: .4byte 0x02039BD4
	thumb_func_end ContestAICmd_get_condition

	thumb_func_start ContestAICmd_if_condition_less_than
ContestAICmd_if_condition_less_than: @ 0x08157908
	push {lr}
	bl ContestAICmd_get_condition
	ldr r0, _0815793C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157940
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08157944
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157948
	.align 2, 0
_0815793C: .4byte 0x02039BD4
_08157940: .4byte 0x0203A804
_08157944:
	adds r0, r2, #5
	str r0, [r3]
_08157948:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_condition_less_than

	thumb_func_start ContestAICmd_if_condition_more_than
ContestAICmd_if_condition_more_than: @ 0x0815794C
	push {lr}
	bl ContestAICmd_get_condition
	ldr r0, _08157980
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157984
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08157988
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0815798C
	.align 2, 0
_08157980: .4byte 0x02039BD4
_08157984: .4byte 0x0203A804
_08157988:
	adds r0, r2, #5
	str r0, [r3]
_0815798C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_condition_more_than

	thumb_func_start ContestAICmd_if_condition_eq
ContestAICmd_if_condition_eq: @ 0x08157990
	push {lr}
	bl ContestAICmd_get_condition
	ldr r0, _081579C4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081579C8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081579CC
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081579D0
	.align 2, 0
_081579C4: .4byte 0x02039BD4
_081579C8: .4byte 0x0203A804
_081579CC:
	adds r0, r2, #5
	str r0, [r3]
_081579D0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_condition_eq

	thumb_func_start ContestAICmd_if_condition_not_eq
ContestAICmd_if_condition_not_eq: @ 0x081579D4
	push {lr}
	bl ContestAICmd_get_condition
	ldr r0, _08157A08
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157A0C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08157A10
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157A14
	.align 2, 0
_08157A08: .4byte 0x02039BD4
_08157A0C: .4byte 0x0203A804
_08157A10:
	adds r0, r2, #5
	str r0, [r3]
_08157A14:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_condition_not_eq

	thumb_func_start ContestAICmd_get_used_combo_starter
ContestAICmd_get_used_combo_starter: @ 0x08157A18
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _08157A68
	ldr r0, [r5]
	ldrb r0, [r0, #1]
	bl sub_081563E8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_080DD94C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08157A54
	ldr r2, _08157A6C
	ldr r0, _08157A70
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r1, [r0, #2]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r6, r0, #0x1f
_08157A54:
	ldr r0, _08157A70
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	strh r6, [r0, #0x18]
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08157A68: .4byte 0x0203A804
_08157A6C: .4byte 0x08565FCC
_08157A70: .4byte 0x02039BD4
	thumb_func_end ContestAICmd_get_used_combo_starter

	thumb_func_start ContestAICmd_if_used_combo_starter_less_than
ContestAICmd_if_used_combo_starter_less_than: @ 0x08157A74
	push {lr}
	bl ContestAICmd_get_used_combo_starter
	ldr r0, _08157AA8
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157AAC
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08157AB0
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157AB4
	.align 2, 0
_08157AA8: .4byte 0x02039BD4
_08157AAC: .4byte 0x0203A804
_08157AB0:
	adds r0, r2, #5
	str r0, [r3]
_08157AB4:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_used_combo_starter_less_than

	thumb_func_start ContestAICmd_unk_38
ContestAICmd_unk_38: @ 0x08157AB8
	push {lr}
	bl ContestAICmd_get_used_combo_starter
	ldr r0, _08157AEC
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157AF0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08157AF4
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157AF8
	.align 2, 0
_08157AEC: .4byte 0x02039BD4
_08157AF0: .4byte 0x0203A804
_08157AF4:
	adds r0, r2, #5
	str r0, [r3]
_08157AF8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_38

	thumb_func_start ContestAICmd_unk_39
ContestAICmd_unk_39: @ 0x08157AFC
	push {lr}
	bl ContestAICmd_get_used_combo_starter
	ldr r0, _08157B30
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157B34
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08157B38
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157B3C
	.align 2, 0
_08157B30: .4byte 0x02039BD4
_08157B34: .4byte 0x0203A804
_08157B38:
	adds r0, r2, #5
	str r0, [r3]
_08157B3C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_39

	thumb_func_start ContestAICmd_if_used_combo_starter_not_eq
ContestAICmd_if_used_combo_starter_not_eq: @ 0x08157B40
	push {lr}
	bl ContestAICmd_get_used_combo_starter
	ldr r0, _08157B74
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08157B78
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08157B7C
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157B80
	.align 2, 0
_08157B74: .4byte 0x02039BD4
_08157B78: .4byte 0x0203A804
_08157B7C:
	adds r0, r2, #5
	str r0, [r3]
_08157B80:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_if_used_combo_starter_not_eq

	thumb_func_start ContestAICmd_check_can_participate
ContestAICmd_check_can_participate: @ 0x08157B84
	push {lr}
	ldr r0, _08157BA8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	bl sub_081563E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl Contest_IsMonsTurnDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08157BB0
	ldr r0, _08157BAC
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	movs r0, #0
	b _08157BB8
	.align 2, 0
_08157BA8: .4byte 0x0203A804
_08157BAC: .4byte 0x02039BD4
_08157BB0:
	ldr r0, _08157BC8
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	movs r0, #1
_08157BB8:
	strh r0, [r1, #0x18]
	ldr r1, _08157BCC
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08157BC8: .4byte 0x02039BD4
_08157BCC: .4byte 0x0203A804
	thumb_func_end ContestAICmd_check_can_participate

	thumb_func_start ContestAICmd_if_can_participate
ContestAICmd_if_can_participate: @ 0x08157BD0
	push {lr}
	bl ContestAICmd_check_can_participate
	ldr r0, _08157C00
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08157C08
	ldr r3, _08157C04
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157C10
	.align 2, 0
_08157C00: .4byte 0x02039BD4
_08157C04: .4byte 0x0203A804
_08157C08:
	ldr r1, _08157C14
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157C10:
	pop {r0}
	bx r0
	.align 2, 0
_08157C14: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_can_participate

	thumb_func_start ContestAICmd_if_cannot_participate
ContestAICmd_if_cannot_participate: @ 0x08157C18
	push {lr}
	bl ContestAICmd_check_can_participate
	ldr r0, _08157C48
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08157C50
	ldr r3, _08157C4C
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157C58
	.align 2, 0
_08157C48: .4byte 0x02039BD4
_08157C4C: .4byte 0x0203A804
_08157C50:
	ldr r1, _08157C5C
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157C58:
	pop {r0}
	bx r0
	.align 2, 0
_08157C5C: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_cannot_participate

	thumb_func_start ContestAICmd_get_val_812A188
ContestAICmd_get_val_812A188: @ 0x08157C60
	push {r4, lr}
	ldr r4, _08157C94
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl sub_081563E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08157C98
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x15]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	strh r0, [r3, #0x18]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08157C94: .4byte 0x0203A804
_08157C98: .4byte 0x02039BD4
	thumb_func_end ContestAICmd_get_val_812A188

	thumb_func_start ContestAICmd_unk_57
ContestAICmd_unk_57: @ 0x08157C9C
	push {lr}
	bl ContestAICmd_get_val_812A188
	ldr r0, _08157CCC
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08157CD4
	ldr r3, _08157CD0
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157CDC
	.align 2, 0
_08157CCC: .4byte 0x02039BD4
_08157CD0: .4byte 0x0203A804
_08157CD4:
	ldr r1, _08157CE0
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157CDC:
	pop {r0}
	bx r0
	.align 2, 0
_08157CE0: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_57

	thumb_func_start ContestAICmd_contest_58
ContestAICmd_contest_58: @ 0x08157CE4
	push {lr}
	bl ContestAICmd_get_val_812A188
	ldr r0, _08157D14
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08157D1C
	ldr r3, _08157D18
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157D24
	.align 2, 0
_08157D14: .4byte 0x02039BD4
_08157D18: .4byte 0x0203A804
_08157D1C:
	ldr r1, _08157D28
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157D24:
	pop {r0}
	bx r0
	.align 2, 0
_08157D28: .4byte 0x0203A804
	thumb_func_end ContestAICmd_contest_58

	thumb_func_start ContestAICmd_unk_59
ContestAICmd_unk_59: @ 0x08157D2C
	push {r4, r5, lr}
	ldr r4, _08157D70
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl sub_081563E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08157D74
	ldr r1, [r1]
	ldr r5, [r1, #0xc]
	ldr r3, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r1, #4]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08157D70: .4byte 0x0203A804
_08157D74: .4byte 0x02039BD4
	thumb_func_end ContestAICmd_unk_59

	thumb_func_start ContestAICmd_unk_5A
ContestAICmd_unk_5A: @ 0x08157D78
	push {lr}
	bl ContestAICmd_unk_59
	ldr r0, _08157DA8
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08157DB0
	ldr r3, _08157DAC
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157DB8
	.align 2, 0
_08157DA8: .4byte 0x02039BD4
_08157DAC: .4byte 0x0203A804
_08157DB0:
	ldr r1, _08157DBC
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157DB8:
	pop {r0}
	bx r0
	.align 2, 0
_08157DBC: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_5A

	thumb_func_start ContestAICmd_unk_5B
ContestAICmd_unk_5B: @ 0x08157DC0
	push {lr}
	bl ContestAICmd_unk_59
	ldr r0, _08157DF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08157DF8
	ldr r3, _08157DF4
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157E00
	.align 2, 0
_08157DF0: .4byte 0x02039BD4
_08157DF4: .4byte 0x0203A804
_08157DF8:
	ldr r1, _08157E04
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157E00:
	pop {r0}
	bx r0
	.align 2, 0
_08157E04: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_5B

	thumb_func_start ContestAICmd_unk_5C
ContestAICmd_unk_5C: @ 0x08157E08
	push {lr}
	bl ContestAICmd_unk_59
	ldr r0, _08157E38
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08157E40
	ldr r3, _08157E3C
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157E48
	.align 2, 0
_08157E38: .4byte 0x02039BD4
_08157E3C: .4byte 0x0203A804
_08157E40:
	ldr r1, _08157E4C
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157E48:
	pop {r0}
	bx r0
	.align 2, 0
_08157E4C: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_5C

	thumb_func_start ContestAICmd_unk_5D
ContestAICmd_unk_5D: @ 0x08157E50
	push {lr}
	bl ContestAICmd_unk_59
	ldr r0, _08157E80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08157E88
	ldr r3, _08157E84
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157E90
	.align 2, 0
_08157E80: .4byte 0x02039BD4
_08157E84: .4byte 0x0203A804
_08157E88:
	ldr r1, _08157E94
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157E90:
	pop {r0}
	bx r0
	.align 2, 0
_08157E94: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_5D

	thumb_func_start ContestAICmd_unk_5E
ContestAICmd_unk_5E: @ 0x08157E98
	push {r4, lr}
	ldr r4, _08157ED0
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl sub_081563E8
	lsls r0, r0, #0x18
	ldr r1, _08157ED4
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	ldr r2, _08157ED8
	lsrs r0, r0, #0x17
	adds r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x41
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r3, #0x18]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08157ED0: .4byte 0x0203A804
_08157ED4: .4byte 0x02039BD4
_08157ED8: .4byte 0x02039BA0
	thumb_func_end ContestAICmd_unk_5E

	thumb_func_start ContestAICmd_unk_5F
ContestAICmd_unk_5F: @ 0x08157EDC
	push {lr}
	bl ContestAICmd_unk_5E
	ldr r0, _08157F0C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08157F14
	ldr r3, _08157F10
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157F1C
	.align 2, 0
_08157F0C: .4byte 0x02039BD4
_08157F10: .4byte 0x0203A804
_08157F14:
	ldr r1, _08157F20
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157F1C:
	pop {r0}
	bx r0
	.align 2, 0
_08157F20: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_5F

	thumb_func_start ContestAICmd_unk_60
ContestAICmd_unk_60: @ 0x08157F24
	push {lr}
	bl ContestAICmd_unk_5E
	ldr r0, _08157F54
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08157F5C
	ldr r3, _08157F58
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157F64
	.align 2, 0
_08157F54: .4byte 0x02039BD4
_08157F58: .4byte 0x0203A804
_08157F5C:
	ldr r1, _08157F68
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157F64:
	pop {r0}
	bx r0
	.align 2, 0
_08157F68: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_60

	thumb_func_start ContestAICmd_unk_61
ContestAICmd_unk_61: @ 0x08157F6C
	push {lr}
	bl ContestAICmd_unk_5E
	ldr r0, _08157F9C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08157FA4
	ldr r3, _08157FA0
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157FAC
	.align 2, 0
_08157F9C: .4byte 0x02039BD4
_08157FA0: .4byte 0x0203A804
_08157FA4:
	ldr r1, _08157FB0
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157FAC:
	pop {r0}
	bx r0
	.align 2, 0
_08157FB0: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_61

	thumb_func_start ContestAICmd_unk_62
ContestAICmd_unk_62: @ 0x08157FB4
	push {lr}
	bl ContestAICmd_unk_5E
	ldr r0, _08157FE4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08157FEC
	ldr r3, _08157FE8
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08157FF4
	.align 2, 0
_08157FE4: .4byte 0x02039BD4
_08157FE8: .4byte 0x0203A804
_08157FEC:
	ldr r1, _08157FF8
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08157FF4:
	pop {r0}
	bx r0
	.align 2, 0
_08157FF8: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_62

	thumb_func_start ContestAICmd_unk_63
ContestAICmd_unk_63: @ 0x08157FFC
	push {r4, r5, lr}
	ldr r5, _08158038
	ldr r0, [r5]
	ldrb r0, [r0, #1]
	bl sub_081563E8
	lsls r0, r0, #0x18
	ldr r3, [r5]
	ldrb r2, [r3, #2]
	ldr r1, _0815803C
	ldr r4, [r1]
	ldr r1, [r4]
	lsrs r0, r0, #0x17
	lsls r2, r2, #3
	adds r0, r0, r2
	adds r1, #0x1c
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r2, [r4, #0xc]
	ldr r1, _08158040
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r2, #0x18]
	adds r3, #3
	str r3, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08158038: .4byte 0x0203A804
_0815803C: .4byte 0x02039BD4
_08158040: .4byte 0x08565FCC
	thumb_func_end ContestAICmd_unk_63

	thumb_func_start ContestAICmd_unk_64
ContestAICmd_unk_64: @ 0x08158044
	push {lr}
	bl ContestAICmd_unk_63
	ldr r0, _08158078
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0815807C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08158080
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158084
	.align 2, 0
_08158078: .4byte 0x02039BD4
_0815807C: .4byte 0x0203A804
_08158080:
	adds r0, r2, #5
	str r0, [r3]
_08158084:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_64

	thumb_func_start ContestAICmd_unk_65
ContestAICmd_unk_65: @ 0x08158088
	push {lr}
	bl ContestAICmd_unk_63
	ldr r0, _081580BC
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081580C0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _081580C4
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081580C8
	.align 2, 0
_081580BC: .4byte 0x02039BD4
_081580C0: .4byte 0x0203A804
_081580C4:
	adds r0, r2, #5
	str r0, [r3]
_081580C8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_65

	thumb_func_start ContestAICmd_unk_66
ContestAICmd_unk_66: @ 0x081580CC
	push {lr}
	bl ContestAICmd_unk_63
	ldr r0, _08158100
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08158104
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08158108
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0815810C
	.align 2, 0
_08158100: .4byte 0x02039BD4
_08158104: .4byte 0x0203A804
_08158108:
	adds r0, r2, #5
	str r0, [r3]
_0815810C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_66

	thumb_func_start ContestAICmd_unk_67
ContestAICmd_unk_67: @ 0x08158110
	push {lr}
	bl ContestAICmd_unk_63
	ldr r0, _08158144
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08158148
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0815814C
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158150
	.align 2, 0
_08158144: .4byte 0x02039BD4
_08158148: .4byte 0x0203A804
_0815814C:
	adds r0, r2, #5
	str r0, [r3]
_08158150:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_67

	thumb_func_start ContestAICmd_unk_68
ContestAICmd_unk_68: @ 0x08158154
	push {r4, r5, lr}
	ldr r5, _08158188
	ldr r0, [r5]
	ldrb r0, [r0, #1]
	bl sub_081563E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [r5]
	ldrb r2, [r3, #2]
	ldr r1, _0815818C
	ldr r4, [r1]
	ldr r1, [r4]
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r1, #0x44
	adds r1, r1, r0
	ldr r2, [r4, #0xc]
	movs r0, #0
	ldrsb r0, [r1, r0]
	strh r0, [r2, #0x18]
	adds r3, #3
	str r3, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08158188: .4byte 0x0203A804
_0815818C: .4byte 0x02039BD4
	thumb_func_end ContestAICmd_unk_68

	thumb_func_start ContestAICmd_unk_69
ContestAICmd_unk_69: @ 0x08158190
	push {lr}
	bl ContestAICmd_unk_68
	ldr r0, _081581C4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081581C8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _081581CC
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081581D0
	.align 2, 0
_081581C4: .4byte 0x02039BD4
_081581C8: .4byte 0x0203A804
_081581CC:
	adds r0, r2, #5
	str r0, [r3]
_081581D0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_69

	thumb_func_start ContestAICmd_unk_6A
ContestAICmd_unk_6A: @ 0x081581D4
	push {lr}
	bl ContestAICmd_unk_68
	ldr r0, _08158208
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0815820C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08158210
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158214
	.align 2, 0
_08158208: .4byte 0x02039BD4
_0815820C: .4byte 0x0203A804
_08158210:
	adds r0, r2, #5
	str r0, [r3]
_08158214:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6A

	thumb_func_start ContestAICmd_unk_6B
ContestAICmd_unk_6B: @ 0x08158218
	push {lr}
	bl ContestAICmd_unk_68
	ldr r0, _0815824C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08158250
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08158254
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158258
	.align 2, 0
_0815824C: .4byte 0x02039BD4
_08158250: .4byte 0x0203A804
_08158254:
	adds r0, r2, #5
	str r0, [r3]
_08158258:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6B

	thumb_func_start ContestAICmd_unk_6C
ContestAICmd_unk_6C: @ 0x0815825C
	push {lr}
	bl ContestAICmd_unk_68
	ldr r0, _08158290
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08158294
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08158298
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0815829C
	.align 2, 0
_08158290: .4byte 0x02039BD4
_08158294: .4byte 0x0203A804
_08158298:
	adds r0, r2, #5
	str r0, [r3]
_0815829C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6C

	thumb_func_start ContestAICmd_unk_6D
ContestAICmd_unk_6D: @ 0x081582A0
	push {r4, r5, lr}
	ldr r5, _081582E4
	ldr r0, [r5]
	ldrb r0, [r0, #1]
	bl sub_081563E8
	lsls r0, r0, #0x18
	ldr r3, [r5]
	ldrb r2, [r3, #2]
	ldr r1, _081582E8
	ldr r4, [r1]
	ldr r1, [r4]
	lsrs r0, r0, #0x17
	lsls r2, r2, #3
	adds r0, r0, r2
	adds r1, #0x1c
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r4, [r4, #0xc]
	ldr r2, _081582EC
	ldr r1, _081582F0
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x18]
	adds r3, #3
	str r3, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081582E4: .4byte 0x0203A804
_081582E8: .4byte 0x02039BD4
_081582EC: .4byte 0x08566AE4
_081582F0: .4byte 0x08565FCC
	thumb_func_end ContestAICmd_unk_6D

	thumb_func_start ContestAICmd_unk_6E
ContestAICmd_unk_6E: @ 0x081582F4
	push {lr}
	bl ContestAICmd_unk_6D
	ldr r0, _08158328
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0815832C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08158330
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158334
	.align 2, 0
_08158328: .4byte 0x02039BD4
_0815832C: .4byte 0x0203A804
_08158330:
	adds r0, r2, #5
	str r0, [r3]
_08158334:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6E

	thumb_func_start ContestAICmd_unk_6F
ContestAICmd_unk_6F: @ 0x08158338
	push {lr}
	bl ContestAICmd_unk_6D
	ldr r0, _0815836C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08158370
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08158374
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158378
	.align 2, 0
_0815836C: .4byte 0x02039BD4
_08158370: .4byte 0x0203A804
_08158374:
	adds r0, r2, #5
	str r0, [r3]
_08158378:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6F

	thumb_func_start ContestAICmd_unk_70
ContestAICmd_unk_70: @ 0x0815837C
	push {r4, lr}
	ldr r0, _081583A0
	ldr r0, [r0]
	ldr r3, [r0, #0xc]
	ldr r4, _081583A4
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	lsls r0, r0, #1
	adds r1, r3, #0
	adds r1, #0x1a
	adds r1, r1, r0
	ldrh r0, [r3, #0x18]
	strh r0, [r1]
	adds r2, #2
	str r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081583A0: .4byte 0x02039BD4
_081583A4: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_70

	thumb_func_start ContestAICmd_unk_71
ContestAICmd_unk_71: @ 0x081583A8
	push {r4, lr}
	ldr r0, _081583D0
	ldr r0, [r0]
	ldr r3, [r0, #0xc]
	ldr r4, _081583D4
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	lsls r0, r0, #1
	adds r3, #0x1a
	adds r3, r3, r0
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r3]
	adds r2, #4
	str r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081583D0: .4byte 0x02039BD4
_081583D4: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_71

	thumb_func_start ContestAICmd_unk_72
ContestAICmd_unk_72: @ 0x081583D8
	push {r4, lr}
	ldr r0, _08158408
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _0815840C
	ldr r3, [r4]
	ldrb r0, [r3, #1]
	lsls r0, r0, #1
	adds r2, #0x1a
	adds r2, r2, r0
	movs r1, #2
	ldrsb r1, [r3, r1]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrh r0, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	adds r3, #4
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08158408: .4byte 0x02039BD4
_0815840C: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_72

	thumb_func_start ContestAICmd_unk_74
ContestAICmd_unk_74: @ 0x08158410
	push {r4, lr}
	ldr r0, _0815843C
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08158440
	ldr r3, [r4]
	ldrb r1, [r3, #1]
	lsls r1, r1, #1
	adds r2, #0x1a
	adds r1, r2, r1
	ldrb r0, [r3, #2]
	lsls r0, r0, #1
	adds r2, r2, r0
	ldrh r0, [r2]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	adds r3, #3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815843C: .4byte 0x02039BD4
_08158440: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_74

	thumb_func_start ContestAICmd_unk_73
ContestAICmd_unk_73: @ 0x08158444
	push {r4, lr}
	ldr r0, _08158470
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08158474
	ldr r3, [r4]
	ldrb r1, [r3, #1]
	lsls r1, r1, #1
	adds r2, #0x1a
	adds r1, r2, r1
	ldrb r0, [r3, #2]
	lsls r0, r0, #1
	adds r2, r2, r0
	ldrh r0, [r2]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	adds r3, #3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08158470: .4byte 0x02039BD4
_08158474: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_73

	thumb_func_start ContestAICmd_unk_75
ContestAICmd_unk_75: @ 0x08158478
	push {r4, lr}
	ldr r0, _081584B4
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r4, _081584B8
	ldr r3, [r4]
	ldrb r0, [r3, #1]
	lsls r0, r0, #1
	adds r1, #0x1a
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	cmp r2, r1
	bge _081584BC
	ldrb r1, [r3, #4]
	ldrb r0, [r3, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _081584C2
	.align 2, 0
_081584B4: .4byte 0x02039BD4
_081584B8: .4byte 0x0203A804
_081584BC:
	adds r0, r3, #0
	adds r0, #8
	str r0, [r4]
_081584C2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_75

	thumb_func_start ContestAICmd_unk_76
ContestAICmd_unk_76: @ 0x081584C8
	push {r4, lr}
	ldr r0, _08158504
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r4, _08158508
	ldr r3, [r4]
	ldrb r0, [r3, #1]
	lsls r0, r0, #1
	adds r1, #0x1a
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	cmp r2, r1
	ble _0815850C
	ldrb r1, [r3, #4]
	ldrb r0, [r3, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08158512
	.align 2, 0
_08158504: .4byte 0x02039BD4
_08158508: .4byte 0x0203A804
_0815850C:
	adds r0, r3, #0
	adds r0, #8
	str r0, [r4]
_08158512:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_76

	thumb_func_start ContestAICmd_unk_77
ContestAICmd_unk_77: @ 0x08158518
	push {r4, lr}
	ldr r0, _08158554
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r4, _08158558
	ldr r3, [r4]
	ldrb r0, [r3, #1]
	lsls r0, r0, #1
	adds r1, #0x1a
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	cmp r2, r1
	bne _0815855C
	ldrb r1, [r3, #4]
	ldrb r0, [r3, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08158562
	.align 2, 0
_08158554: .4byte 0x02039BD4
_08158558: .4byte 0x0203A804
_0815855C:
	adds r0, r3, #0
	adds r0, #8
	str r0, [r4]
_08158562:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_77

	thumb_func_start ContestAICmd_unk_78
ContestAICmd_unk_78: @ 0x08158568
	push {r4, lr}
	ldr r0, _081585A4
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r4, _081585A8
	ldr r3, [r4]
	ldrb r0, [r3, #1]
	lsls r0, r0, #1
	adds r1, #0x1a
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	cmp r2, r1
	beq _081585AC
	ldrb r1, [r3, #4]
	ldrb r0, [r3, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _081585B2
	.align 2, 0
_081585A4: .4byte 0x02039BD4
_081585A8: .4byte 0x0203A804
_081585AC:
	adds r0, r3, #0
	adds r0, #8
	str r0, [r4]
_081585B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_78

	thumb_func_start ContestAICmd_unk_79
ContestAICmd_unk_79: @ 0x081585B8
	push {r4, r5, lr}
	ldr r0, _081585F8
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _081585FC
	ldr r3, [r4]
	ldrb r1, [r3, #1]
	lsls r1, r1, #1
	adds r2, #0x1a
	adds r1, r2, r1
	ldrb r0, [r3, #2]
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r1, r0
	bge _08158600
	ldrb r1, [r3, #3]
	ldrb r0, [r3, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08158604
	.align 2, 0
_081585F8: .4byte 0x02039BD4
_081585FC: .4byte 0x0203A804
_08158600:
	adds r0, r3, #7
	str r0, [r4]
_08158604:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_79

	thumb_func_start ContestAICmd_unk_7A
ContestAICmd_unk_7A: @ 0x0815860C
	push {r4, r5, lr}
	ldr r0, _0815864C
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _08158650
	ldr r3, [r4]
	ldrb r1, [r3, #1]
	lsls r1, r1, #1
	adds r2, #0x1a
	adds r1, r2, r1
	ldrb r0, [r3, #2]
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r1, r0
	ble _08158654
	ldrb r1, [r3, #3]
	ldrb r0, [r3, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08158658
	.align 2, 0
_0815864C: .4byte 0x02039BD4
_08158650: .4byte 0x0203A804
_08158654:
	adds r0, r3, #7
	str r0, [r4]
_08158658:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_7A

	thumb_func_start ContestAICmd_unk_7B
ContestAICmd_unk_7B: @ 0x08158660
	push {r4, r5, lr}
	ldr r0, _081586A0
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _081586A4
	ldr r3, [r4]
	ldrb r1, [r3, #1]
	lsls r1, r1, #1
	adds r2, #0x1a
	adds r1, r2, r1
	ldrb r0, [r3, #2]
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r1, r0
	bne _081586A8
	ldrb r1, [r3, #3]
	ldrb r0, [r3, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _081586AC
	.align 2, 0
_081586A0: .4byte 0x02039BD4
_081586A4: .4byte 0x0203A804
_081586A8:
	adds r0, r3, #7
	str r0, [r4]
_081586AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_7B

	thumb_func_start ContestAICmd_unk_7C
ContestAICmd_unk_7C: @ 0x081586B4
	push {r4, r5, lr}
	ldr r0, _081586F4
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r4, _081586F8
	ldr r3, [r4]
	ldrb r1, [r3, #1]
	lsls r1, r1, #1
	adds r2, #0x1a
	adds r1, r2, r1
	ldrb r0, [r3, #2]
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r1, r0
	beq _081586FC
	ldrb r1, [r3, #3]
	ldrb r0, [r3, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08158700
	.align 2, 0
_081586F4: .4byte 0x02039BD4
_081586F8: .4byte 0x0203A804
_081586FC:
	adds r0, r3, #7
	str r0, [r4]
_08158700:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_7C

	thumb_func_start ContestAICmd_if_random
ContestAICmd_if_random: @ 0x08158708
	push {r4, r5, lr}
	bl Random
	movs r2, #0xff
	ands r2, r0
	ldr r0, _08158744
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r4, _08158748
	ldr r3, [r4]
	ldrb r0, [r3, #1]
	lsls r0, r0, #1
	adds r1, #0x1a
	adds r1, r1, r0
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r2, r0
	bge _0815874C
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08158750
	.align 2, 0
_08158744: .4byte 0x02039BD4
_08158748: .4byte 0x0203A804
_0815874C:
	adds r0, r3, #6
	str r0, [r4]
_08158750:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_if_random

	thumb_func_start ContestAICmd_unk_7E
ContestAICmd_unk_7E: @ 0x08158758
	push {r4, r5, lr}
	bl Random
	movs r2, #0xff
	ands r2, r0
	ldr r0, _08158794
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r4, _08158798
	ldr r3, [r4]
	ldrb r0, [r3, #1]
	lsls r0, r0, #1
	adds r1, #0x1a
	adds r1, r1, r0
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r2, r0
	ble _0815879C
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _081587A0
	.align 2, 0
_08158794: .4byte 0x02039BD4
_08158798: .4byte 0x0203A804
_0815879C:
	adds r0, r3, #6
	str r0, [r4]
_081587A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestAICmd_unk_7E

	thumb_func_start ContestAICmd_jump
ContestAICmd_jump: @ 0x081587A8
	ldr r3, _081587C4
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_081587C4: .4byte 0x0203A804
	thumb_func_end ContestAICmd_jump

	thumb_func_start ContestAICmd_call
ContestAICmd_call: @ 0x081587C8
	push {r4, lr}
	ldr r4, _081587F4
	ldr r0, [r4]
	adds r0, #5
	bl AIStackPushVar
	ldr r2, [r4]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081587F4: .4byte 0x0203A804
	thumb_func_end ContestAICmd_call

	thumb_func_start ContestAICmd_end
ContestAICmd_end: @ 0x081587F8
	push {lr}
	bl AIStackPop
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08158812
	ldr r0, _08158818
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldrb r1, [r2, #9]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #9]
_08158812:
	pop {r0}
	bx r0
	.align 2, 0
_08158818: .4byte 0x02039BD4
	thumb_func_end ContestAICmd_end

	thumb_func_start AIStackPushVar
AIStackPushVar: @ 0x0815881C
	push {r4, lr}
	ldr r1, _08158840
	ldr r1, [r1]
	ldr r3, [r1, #0xc]
	adds r4, r3, #0
	adds r4, #0x40
	ldrb r1, [r4]
	adds r2, r1, #1
	strb r2, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	adds r3, #0x20
	adds r3, r3, r1
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08158840: .4byte 0x02039BD4
	thumb_func_end AIStackPushVar

	thumb_func_start AIStackPop
AIStackPop: @ 0x08158844
	push {lr}
	ldr r3, _0815885C
	ldr r0, [r3]
	ldr r0, [r0, #0xc]
	adds r1, r0, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	bne _08158860
	movs r0, #0
	b _0815887C
	.align 2, 0
_0815885C: .4byte 0x02039BD4
_08158860:
	subs r0, #1
	strb r0, [r1]
	ldr r2, _08158880
	ldr r0, [r3]
	ldr r1, [r0, #0xc]
	adds r0, r1, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, #0x20
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	movs r0, #1
_0815887C:
	pop {r1}
	bx r1
	.align 2, 0
_08158880: .4byte 0x0203A804
	thumb_func_end AIStackPop

	thumb_func_start ContestAICmd_check_user_has_exciting_move
ContestAICmd_check_user_has_exciting_move: @ 0x08158884
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r4, #0
	ldr r6, _081588B4
_0815888C:
	lsls r1, r4, #1
	ldr r0, _081588B8
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	cmp r0, #0
	beq _081588BC
	bl Contest_GetMoveExcitement
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _081588BC
	movs r5, #1
	b _081588C2
	.align 2, 0
_081588B4: .4byte 0x02039ABE
_081588B8: .4byte 0x02039BD4
_081588BC:
	adds r4, #1
	cmp r4, #3
	ble _0815888C
_081588C2:
	ldr r0, _081588D8
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	strh r5, [r0, #0x18]
	ldr r1, _081588DC
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081588D8: .4byte 0x02039BD4
_081588DC: .4byte 0x0203A804
	thumb_func_end ContestAICmd_check_user_has_exciting_move

	thumb_func_start ContestAICmd_if_user_has_exciting_move
ContestAICmd_if_user_has_exciting_move: @ 0x081588E0
	push {lr}
	bl ContestAICmd_check_user_has_exciting_move
	ldr r0, _08158910
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08158918
	ldr r3, _08158914
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158920
	.align 2, 0
_08158910: .4byte 0x02039BD4
_08158914: .4byte 0x0203A804
_08158918:
	ldr r1, _08158924
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08158920:
	pop {r0}
	bx r0
	.align 2, 0
_08158924: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_user_has_exciting_move

	thumb_func_start ContestAICmd_if_user_doesnt_have_exciting_move
ContestAICmd_if_user_doesnt_have_exciting_move: @ 0x08158928
	push {lr}
	bl ContestAICmd_check_user_has_exciting_move
	ldr r0, _08158958
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08158960
	ldr r3, _0815895C
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158968
	.align 2, 0
_08158958: .4byte 0x02039BD4
_0815895C: .4byte 0x0203A804
_08158960:
	ldr r1, _0815896C
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08158968:
	pop {r0}
	bx r0
	.align 2, 0
_0815896C: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_user_doesnt_have_exciting_move

	thumb_func_start ContestAICmd_unk_85
ContestAICmd_unk_85: @ 0x08158970
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r3, _0815899C
	ldr r0, [r3]
	ldrb r5, [r0, #1]
	ldrb r0, [r0, #2]
	lsls r0, r0, #8
	orrs r5, r0
	movs r4, #0
	ldr r0, _081589A0
	mov ip, r0
	ldr r2, _081589A4
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	mov r1, ip
	adds r1, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	b _081589C4
	.align 2, 0
_0815899C: .4byte 0x0203A804
_081589A0: .4byte 0x02039AA0
_081589A4: .4byte 0x02039BD4
_081589A8:
	adds r4, #1
	cmp r4, #3
	bgt _081589CA
	lsls r1, r4, #1
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
_081589C4:
	cmp r0, r5
	bne _081589A8
	movs r6, #1
_081589CA:
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	strh r6, [r0, #0x18]
	ldr r0, [r3]
	adds r0, #3
	str r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_85

	thumb_func_start ContestAICmd_unk_86
ContestAICmd_unk_86: @ 0x081589DC
	push {lr}
	bl ContestAICmd_unk_85
	ldr r0, _08158A0C
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08158A14
	ldr r3, _08158A10
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158A1C
	.align 2, 0
_08158A0C: .4byte 0x02039BD4
_08158A10: .4byte 0x0203A804
_08158A14:
	ldr r1, _08158A20
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08158A1C:
	pop {r0}
	bx r0
	.align 2, 0
_08158A20: .4byte 0x0203A804
	thumb_func_end ContestAICmd_unk_86

	thumb_func_start ContestAICmd_if_effect_in_user_moveset
ContestAICmd_if_effect_in_user_moveset: @ 0x08158A24
	push {lr}
	bl ContestAICmd_unk_85
	ldr r0, _08158A54
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08158A5C
	ldr r3, _08158A58
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08158A64
	.align 2, 0
_08158A54: .4byte 0x02039BD4
_08158A58: .4byte 0x0203A804
_08158A5C:
	ldr r1, _08158A68
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
_08158A64:
	pop {r0}
	bx r0
	.align 2, 0
_08158A68: .4byte 0x0203A804
	thumb_func_end ContestAICmd_if_effect_in_user_moveset

