.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start rfu_initializeAPI
rfu_initializeAPI: @ 0x0829243C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	mov ip, r2
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r0, #0xf0
	lsls r0, r0, #0x14
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	bne _0829245C
	cmp r7, #0
	bne _08292464
_0829245C:
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	beq _08292468
_08292464:
	movs r0, #2
	b _08292540
_08292468:
	cmp r7, #0
	beq _08292474
	ldr r3, _08292470
	b _08292476
	.align 2, 0
_08292470: .4byte 0x00000E64
_08292474:
	ldr r3, _08292480
_08292476:
	cmp r2, r3
	bhs _08292484
	movs r0, #1
	b _08292540
	.align 2, 0
_08292480: .4byte 0x00000504
_08292484:
	ldr r0, _08292548
	str r4, [r0]
	ldr r1, _0829254C
	adds r0, r4, #0
	adds r0, #0xb4
	str r0, [r1]
	ldr r1, _08292550
	adds r0, #0x28
	str r0, [r1]
	ldr r2, _08292554
	movs r1, #0xde
	lsls r1, r1, #1
	adds r0, r4, r1
	str r0, [r2]
	ldr r1, _08292558
	movs r3, #0xdf
	lsls r3, r3, #2
	adds r0, r4, r3
	str r0, [r1]
	movs r5, #1
	adds r6, r2, #0
	adds r4, r1, #0
_082924B0:
	lsls r2, r5, #2
	adds r3, r2, r6
	subs r1, r5, #1
	lsls r1, r1, #2
	adds r0, r1, r6
	ldr r0, [r0]
	adds r0, #0x70
	str r0, [r3]
	adds r2, r2, r4
	adds r1, r1, r4
	ldr r0, [r1]
	adds r0, #0x1c
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _082924B0
	ldr r0, _08292550
	ldr r1, [r0]
	adds r1, #0xdc
	ldr r4, _08292558
	ldr r0, [r4, #0xc]
	adds r0, #0x1c
	str r0, [r1]
	mov r1, ip
	adds r2, r7, #0
	bl STWI_init_all
	bl rfu_STC_clearAPIVariables
	movs r5, #0
	ldr r3, _08292554
	movs r2, #0
_082924F4:
	lsls r1, r5, #2
	adds r0, r1, r3
	ldr r0, [r0]
	str r2, [r0, #0x68]
	str r2, [r0, #0x6c]
	adds r1, r1, r4
	ldr r0, [r1]
	str r2, [r0, #0x14]
	str r2, [r0, #0x18]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _082924F4
	ldr r4, _0829255C
	movs r0, #2
	rsbs r0, r0, #0
	ands r4, r0
	ldr r1, _08292550
	ldr r0, [r1]
	adds r2, r0, #0
	adds r2, #8
	movs r3, #0x2f
	ldr r5, _08292560
_08292524:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r5
	bne _08292524
	ldr r1, [r1]
	adds r0, r1, #0
	adds r0, #9
	str r0, [r1, #4]
	movs r0, #0
_08292540:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08292548: .4byte 0x03007630
_0829254C: .4byte 0x03007634
_08292550: .4byte 0x03007638
_08292554: .4byte 0x03007620
_08292558: .4byte 0x03007610
_0829255C: .4byte 0x0829397D
_08292560: .4byte 0x0000FFFF
	thumb_func_end rfu_initializeAPI

	thumb_func_start rfu_STC_clearAPIVariables
rfu_STC_clearAPIVariables: @ 0x08292564
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _082925D8
	ldrh r0, [r1]
	adds r7, r0, #0
	movs r6, #0
	strh r6, [r1]
	ldr r5, _082925DC
	ldr r1, [r5]
	ldrb r4, [r1]
	mov r0, sp
	strh r6, [r0]
	ldr r2, _082925E0
	bl CpuSet
	ldr r2, [r5]
	movs r0, #8
	ands r4, r0
	movs r1, #0
	strb r4, [r2]
	mov r0, sp
	adds r0, #2
	strh r1, [r0]
	ldr r4, _082925E4
	ldr r1, [r4]
	ldr r2, _082925E8
	bl CpuSet
	ldr r1, [r4]
	movs r0, #4
	strb r0, [r1, #9]
	ldr r0, [r5]
	strb r6, [r0, #6]
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1]
	bl rfu_clearAllSlot
	ldr r0, [r5]
	strb r6, [r0, #9]
	movs r2, #0
	movs r3, #0
_082925B8:
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r0, #0x12
	adds r0, r0, r1
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _082925B8
	ldr r0, _082925D8
	strh r7, [r0]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_082925D8: .4byte 0x04000208
_082925DC: .4byte 0x03007634
_082925E0: .4byte 0x01000014
_082925E4: .4byte 0x03007630
_082925E8: .4byte 0x0100005A
	thumb_func_end rfu_STC_clearAPIVariables

	thumb_func_start rfu_REQ_PARENT_resumeRetransmitAndChange
rfu_REQ_PARENT_resumeRetransmitAndChange: @ 0x082925EC
	push {lr}
	ldr r0, _082925FC
	bl STWI_set_Callback_M
	bl STWI_send_ResumeRetransmitAndChangeREQ
	pop {r0}
	bx r0
	.align 2, 0
_082925FC: .4byte 0x082926C1
	thumb_func_end rfu_REQ_PARENT_resumeRetransmitAndChange

	thumb_func_start rfu_UNI_PARENT_getDRAC_ACK
rfu_UNI_PARENT_getDRAC_ACK: @ 0x08292600
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	ldr r5, _08292618
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, #1
	beq _0829261C
	movs r0, #0xc0
	lsls r0, r0, #2
	b _08292642
	.align 2, 0
_08292618: .4byte 0x03007630
_0829261C:
	bl rfu_getSTWIRecvBuffer
	adds r1, r0, #0
	ldrb r0, [r1]
	cmp r0, #0x28
	beq _0829262C
	cmp r0, #0x36
	bne _08292640
_0829262C:
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _08292638
	ldr r0, [r5]
	ldrb r0, [r0, #2]
	b _0829263A
_08292638:
	ldrb r0, [r1, #4]
_0829263A:
	strb r0, [r4]
	movs r0, #0
	b _08292642
_08292640:
	movs r0, #0x10
_08292642:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end rfu_UNI_PARENT_getDRAC_ACK

	thumb_func_start rfu_setTimerInterrupt
rfu_setTimerInterrupt: @ 0x08292648
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r1, r2, #0
	bl STWI_init_timer
	pop {r0}
	bx r0
	thumb_func_end rfu_setTimerInterrupt

	thumb_func_start rfu_getSTWIRecvBuffer
rfu_getSTWIRecvBuffer: @ 0x0829265C
	ldr r0, _08292668
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08292668: .4byte 0x03007638
	thumb_func_end rfu_getSTWIRecvBuffer

	thumb_func_start rfu_setMSCCallback
rfu_setMSCCallback: @ 0x0829266C
	push {lr}
	bl STWI_set_Callback_S
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end rfu_setMSCCallback

	thumb_func_start rfu_setREQCallback
rfu_setREQCallback: @ 0x08292678
	push {lr}
	adds r1, r0, #0
	ldr r0, _08292690
	ldr r0, [r0]
	str r1, [r0]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bl rfu_enableREQCallback
	pop {r0}
	bx r0
	.align 2, 0
_08292690: .4byte 0x03007638
	thumb_func_end rfu_setREQCallback

	thumb_func_start rfu_enableREQCallback
rfu_enableREQCallback: @ 0x08292694
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _082926AC
	ldr r0, _082926A8
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	b _082926B6
	.align 2, 0
_082926A8: .4byte 0x03007634
_082926AC:
	ldr r0, _082926BC
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, #0xf7
	ands r0, r1
_082926B6:
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_082926BC: .4byte 0x03007634
	thumb_func_end rfu_enableREQCallback

	thumb_func_start rfu_STC_REQ_callback
rfu_STC_REQ_callback: @ 0x082926C0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _082926F4
	bl STWI_set_Callback_M
	ldr r0, _082926F8
	ldr r0, [r0]
	strh r4, [r0, #0x1c]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _082926EE
	ldr r0, _082926FC
	ldr r0, [r0]
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r2
_082926EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_082926F4: .4byte 0x08292701
_082926F8: .4byte 0x03007634
_082926FC: .4byte 0x03007638
	thumb_func_end rfu_STC_REQ_callback

	thumb_func_start rfu_CB_defaultCallback
rfu_CB_defaultCallback: @ 0x08292700
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	cmp r0, #0xff
	bne _0829275C
	ldr r0, _08292764
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0829272A
	ldr r0, _08292768
	ldr r0, [r0]
	ldr r2, [r0]
	movs r0, #0xff
	adds r1, r3, #0
	bl _call_via_r2
_0829272A:
	ldr r0, _0829276C
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	ldrb r0, [r0, #3]
	adds r5, r0, #0
	orrs r5, r1
	movs r4, #0
_08292738:
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0829274A
	adds r0, r4, #0
	bl rfu_STC_removeLinkData
_0829274A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08292738
	ldr r0, _0829276C
	ldr r1, [r0]
	movs r0, #0xff
	strb r0, [r1]
_0829275C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08292764: .4byte 0x03007634
_08292768: .4byte 0x03007638
_0829276C: .4byte 0x03007630
	thumb_func_end rfu_CB_defaultCallback

	thumb_func_start rfu_waitREQComplete
rfu_waitREQComplete: @ 0x08292770
	push {lr}
	bl STWI_poll_CommandEnd
	ldr r0, _08292780
	ldr r0, [r0]
	ldrh r0, [r0, #0x1c]
	pop {r1}
	bx r1
	.align 2, 0
_08292780: .4byte 0x03007634
	thumb_func_end rfu_waitREQComplete

	thumb_func_start rfu_REQ_RFUStatus
rfu_REQ_RFUStatus: @ 0x08292784
	push {lr}
	ldr r0, _08292794
	bl STWI_set_Callback_M
	bl STWI_send_SystemStatusREQ
	pop {r0}
	bx r0
	.align 2, 0
_08292794: .4byte 0x082926C1
	thumb_func_end rfu_REQ_RFUStatus

	thumb_func_start rfu_getRFUStatus
rfu_getRFUStatus: @ 0x08292798
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _082927B0
	ldr r0, [r5]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x93
	beq _082927B4
	movs r0, #0x10
	b _082927CE
	.align 2, 0
_082927B0: .4byte 0x03007638
_082927B4:
	bl STWI_poll_CommandEnd
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _082927C8
	ldr r0, [r5]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	b _082927CA
_082927C8:
	movs r0, #0xff
_082927CA:
	strb r0, [r4]
	movs r0, #0
_082927CE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end rfu_getRFUStatus

	thumb_func_start sub_082927D4
sub_082927D4: @ 0x082927D4
	push {lr}
	ldr r2, _082927DC
	ldr r3, _082927E0
	b _082927EE
	.align 2, 0
_082927DC: .4byte 0x0890EED0
_082927E0: .4byte 0x030000F0
_082927E4:
	ldrb r0, [r3]
	adds r3, #1
	adds r2, #1
	cmp r1, r0
	bne _08292844
_082927EE:
	ldrb r1, [r2]
	cmp r1, #0
	bne _082927E4
	movs r2, #0xc0
	lsls r2, r2, #0x12
	movs r3, #0
	movs r1, #0
_082927FC:
	ldrh r0, [r2]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r2, #2
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x59
	bls _082927FC
	ldr r0, _08292838
	ldrh r0, [r0]
	cmp r3, r0
	bne _08292844
	movs r0, #0xc0
	lsls r0, r0, #0x12
	ldr r1, _0829283C
	ldr r1, [r1]
	movs r2, #0x5a
	bl CpuSet
	ldr r0, _08292840
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	b _08292846
	.align 2, 0
_08292838: .4byte 0x030000FA
_0829283C: .4byte 0x03007630
_08292840: .4byte 0x03007634
_08292844:
	movs r0, #1
_08292846:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_082927D4

	thumb_func_start rfu_REQ_stopMode
rfu_REQ_stopMode: @ 0x0829284C
	push {lr}
	ldr r0, _0829286C
	ldrh r0, [r0]
	cmp r0, #0
	bne _08292874
	movs r0, #0x3d
	movs r1, #6
	bl rfu_STC_REQ_callback
	ldr r0, _08292870
	ldr r1, [r0]
	ldrh r0, [r1, #0x12]
	movs r0, #6
	strh r0, [r1, #0x12]
	b _082928EA
	.align 2, 0
_0829286C: .4byte 0x04000208
_08292870: .4byte 0x03007608
_08292874:
	bl AgbRFU_SoftReset
	bl rfu_STC_clearAPIVariables
	movs r0, #8
	bl sub_082952F4
	ldr r1, _082928C4
	cmp r0, r1
	bne _082928D8
	ldr r0, _082928C8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	ldr r2, _082928CC
	adds r1, r0, r2
	movs r0, #0
	str r0, [r1]
	movs r0, #0x83
	lsls r0, r0, #0x10
	str r0, [r1]
	ldr r0, [r1]
	lsls r0, r0, #0x10
	ldr r2, _082928D0
	ldr r3, _082928D4
	cmp r0, r2
	bhi _082928B2
_082928AA:
	ldr r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, r2
	bls _082928AA
_082928B2:
	movs r0, #0
	str r0, [r1]
	adds r0, r3, #0
	bl STWI_set_Callback_M
	bl STWI_send_StopModeREQ
	b _082928EA
	.align 2, 0
_082928C4: .4byte 0x00008001
_082928C8: .4byte 0x03007608
_082928CC: .4byte 0x04000100
_082928D0: .4byte 0x0105FFFF
_082928D4: .4byte 0x082928F5
_082928D8:
	ldr r1, _082928F0
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x3d
	movs r1, #0
	bl rfu_STC_REQ_callback
_082928EA:
	pop {r0}
	bx r0
	.align 2, 0
_082928F0: .4byte 0x04000128
	thumb_func_end rfu_REQ_stopMode

	thumb_func_start rfu_CB_stopMode
rfu_CB_stopMode: @ 0x082928F4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r1, #0
	cmp r2, #0
	bne _0829290E
	ldr r1, _0829291C
	movs r4, #0x80
	lsls r4, r4, #6
	adds r0, r4, #0
	strh r0, [r1]
_0829290E:
	adds r0, r3, #0
	adds r1, r2, #0
	bl rfu_STC_REQ_callback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0829291C: .4byte 0x04000128
	thumb_func_end rfu_CB_stopMode

	thumb_func_start rfu_REQBN_softReset_and_checkID
rfu_REQBN_softReset_and_checkID: @ 0x08292920
	push {lr}
	ldr r0, _08292930
	ldrh r0, [r0]
	cmp r0, #0
	bne _08292934
	movs r0, #1
	rsbs r0, r0, #0
	b _08292954
	.align 2, 0
_08292930: .4byte 0x04000208
_08292934:
	bl AgbRFU_SoftReset
	bl rfu_STC_clearAPIVariables
	movs r0, #0x1e
	bl sub_082952F4
	adds r2, r0, #0
	cmp r2, #0
	bne _08292952
	ldr r1, _08292958
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	strh r0, [r1]
_08292952:
	adds r0, r2, #0
_08292954:
	pop {r1}
	bx r1
	.align 2, 0
_08292958: .4byte 0x04000128
	thumb_func_end rfu_REQBN_softReset_and_checkID

	thumb_func_start rfu_REQ_reset
rfu_REQ_reset: @ 0x0829295C
	push {lr}
	ldr r0, _0829296C
	bl STWI_set_Callback_M
	bl STWI_send_ResetREQ
	pop {r0}
	bx r0
	.align 2, 0
_0829296C: .4byte 0x08292971
	thumb_func_end rfu_REQ_reset

	thumb_func_start rfu_CB_reset
rfu_CB_reset: @ 0x08292970
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r4, r1, #0
	cmp r4, #0
	bne _08292984
	bl rfu_STC_clearAPIVariables
_08292984:
	adds r0, r5, #0
	adds r1, r4, #0
	bl rfu_STC_REQ_callback
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end rfu_CB_reset

	thumb_func_start rfu_REQ_configSystem
rfu_REQ_configSystem: @ 0x08292994
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _082929CC
	bl STWI_set_Callback_M
	movs r0, #3
	ands r4, r0
	movs r0, #0x3c
	orrs r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl STWI_send_SystemConfigREQ
	cmp r6, #0
	bne _082929D4
	ldr r0, _082929D0
	ldr r1, [r0]
	movs r0, #1
	strh r0, [r1, #0x1a]
	b _082929EE
	.align 2, 0
_082929CC: .4byte 0x082926C1
_082929D0: .4byte 0x03007634
_082929D4:
	ldr r5, _082929F4
	ldrh r4, [r5]
	movs r0, #0
	strh r0, [r5]
	movs r0, #0x96
	lsls r0, r0, #2
	adds r1, r6, #0
	bl Div
	ldr r1, _082929F8
	ldr r1, [r1]
	strh r0, [r1, #0x1a]
	strh r4, [r5]
_082929EE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_082929F4: .4byte 0x04000208
_082929F8: .4byte 0x03007634
	thumb_func_end rfu_REQ_configSystem

	thumb_func_start rfu_REQ_configGameData
rfu_REQ_configGameData: @ 0x082929FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r2, #0
	adds r7, r3, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r1, #0x10
	adds r5, r4, #0
	mov r0, sp
	strb r1, [r0]
	lsrs r2, r2, #0x18
	strb r2, [r0, #1]
	cmp r6, #0
	beq _08292A22
	movs r1, #0x80
	orrs r2, r1
	movs r1, #0
	orrs r2, r1
	strb r2, [r0, #1]
_08292A22:
	movs r2, #2
	ldr r0, _08292A84
	mov ip, r0
_08292A28:
	mov r3, sp
	adds r1, r3, r2
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xe
	bls _08292A28
	movs r3, #0
	adds r1, r7, #0
	movs r2, #0
_08292A42:
	ldrb r0, [r1]
	adds r0, r3, r0
	lsls r0, r0, #0x18
	adds r1, #1
	lsrs r0, r0, #0x18
	ldrb r3, [r5]
	adds r0, r0, r3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r5, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _08292A42
	mov r1, sp
	mvns r0, r3
	strb r0, [r1, #0xf]
	cmp r6, #0
	beq _08292A6E
	movs r0, #0
	strb r0, [r1, #0xe]
_08292A6E:
	mov r0, ip
	bl STWI_set_Callback_M
	mov r0, sp
	adds r1, r7, #0
	bl STWI_send_GameConfigREQ
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08292A84: .4byte 0x08292A89
	thumb_func_end rfu_REQ_configGameData

	thumb_func_start rfu_CB_configGameData
rfu_CB_configGameData: @ 0x08292A88
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	cmp r7, #0
	bne _08292B12
	ldr r0, _08292ACC
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	ldr r0, _08292AD0
	ldr r6, [r0]
	ldrb r2, [r1, #4]
	adds r5, r6, #0
	adds r5, #0x98
	strh r2, [r5]
	ldrb r0, [r1, #5]
	lsls r3, r0, #8
	orrs r3, r2
	strh r3, [r5]
	adds r4, r1, #6
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08292AD4
	eors r3, r1
	strh r3, [r5]
	adds r1, r6, #0
	adds r1, #0x97
	movs r0, #1
	b _08292ADA
	.align 2, 0
_08292ACC: .4byte 0x03007608
_08292AD0: .4byte 0x03007630
_08292AD4:
	adds r1, r6, #0
	adds r1, #0x97
	movs r0, #0
_08292ADA:
	strb r0, [r1]
	movs r2, #0
	ldr r3, _08292B20
_08292AE0:
	ldr r0, [r3]
	adds r0, #0x9a
	adds r0, r0, r2
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xc
	bls _08292AE0
	adds r4, #1
	movs r2, #0
	ldr r3, _08292B20
_08292AFC:
	ldr r0, [r3]
	adds r0, #0xa9
	adds r0, r0, r2
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _08292AFC
_08292B12:
	mov r0, ip
	adds r1, r7, #0
	bl rfu_STC_REQ_callback
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08292B20: .4byte 0x03007630
	thumb_func_end rfu_CB_configGameData

	thumb_func_start rfu_REQ_startSearchChild
rfu_REQ_startSearchChild: @ 0x08292B24
	push {r4, lr}
	movs r1, #0
	ldr r4, _08292B6C
	ldr r3, _08292B70
	movs r2, #0
_08292B2E:
	ldr r0, [r3]
	adds r0, #0xe
	adds r0, r0, r1
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #3
	bls _08292B2E
	adds r0, r4, #0
	bl STWI_set_Callback_M
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08292B78
	ldr r0, _08292B74
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _08292B7E
	movs r0, #1
	bl rfu_STC_clearLinkStatus
	b _08292B7E
	.align 2, 0
_08292B6C: .4byte 0x08292701
_08292B70: .4byte 0x03007634
_08292B74: .4byte 0x03007638
_08292B78:
	movs r0, #0x19
	bl rfu_STC_REQ_callback
_08292B7E:
	ldr r0, _08292B90
	bl STWI_set_Callback_M
	bl STWI_send_SC_StartREQ
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08292B90: .4byte 0x08292B95
	thumb_func_end rfu_REQ_startSearchChild

	thumb_func_start rfu_CB_startSearchChild
rfu_CB_startSearchChild: @ 0x08292B94
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r1, #0
	cmp r2, #0
	bne _08292BAC
	ldr r0, _08292BB8
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #9]
_08292BAC:
	adds r0, r3, #0
	adds r1, r2, #0
	bl rfu_STC_REQ_callback
	pop {r0}
	bx r0
	.align 2, 0
_08292BB8: .4byte 0x03007634
	thumb_func_end rfu_CB_startSearchChild

	thumb_func_start rfu_STC_clearLinkStatus
rfu_STC_clearLinkStatus: @ 0x08292BBC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl rfu_clearAllSlot
	cmp r4, #0
	beq _08292BE4
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r4, _08292C18
	ldr r1, [r4]
	adds r1, #0x14
	ldr r2, _08292C1C
	bl CpuSet
	ldr r0, [r4]
	strb r5, [r0, #8]
_08292BE4:
	movs r1, #0
	ldr r2, _08292C18
	adds r4, r2, #0
	movs r3, #0
_08292BEC:
	ldr r0, [r4]
	adds r0, #0xa
	adds r0, r0, r1
	strb r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _08292BEC
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #1]
	ldr r0, [r2]
	strb r1, [r0, #2]
	ldr r0, [r2]
	strb r1, [r0, #3]
	ldr r0, [r2]
	strb r1, [r0, #7]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08292C18: .4byte 0x03007630
_08292C1C: .4byte 0x01000040
	thumb_func_end rfu_STC_clearLinkStatus

	thumb_func_start rfu_REQ_pollSearchChild
rfu_REQ_pollSearchChild: @ 0x08292C20
	push {lr}
	ldr r0, _08292C30
	bl STWI_set_Callback_M
	bl STWI_send_SC_PollingREQ
	pop {r0}
	bx r0
	.align 2, 0
_08292C30: .4byte 0x08292C49
	thumb_func_end rfu_REQ_pollSearchChild

	thumb_func_start rfu_REQ_endSearchChild
rfu_REQ_endSearchChild: @ 0x08292C34
	push {lr}
	ldr r0, _08292C44
	bl STWI_set_Callback_M
	bl STWI_send_SC_EndREQ
	pop {r0}
	bx r0
	.align 2, 0
_08292C44: .4byte 0x08292C49
	thumb_func_end rfu_REQ_endSearchChild

	thumb_func_start rfu_CB_pollAndEndSearchChild
rfu_CB_pollAndEndSearchChild: @ 0x08292C48
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	cmp r6, #0
	bne _08292C5A
	bl rfu_STC_readChildList
_08292C5A:
	cmp r4, #0x1a
	bne _08292C9C
	ldr r5, _08292C90
	ldr r0, [r5]
	adds r0, #0x94
	ldrh r0, [r0]
	cmp r0, #0
	bne _08292CB8
	ldr r0, _08292C94
	bl STWI_set_Callback_M
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08292CB8
	ldr r1, [r5]
	ldr r0, _08292C98
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	adds r1, #0x94
	strh r0, [r1]
	b _08292CB8
	.align 2, 0
_08292C90: .4byte 0x03007630
_08292C94: .4byte 0x08292701
_08292C98: .4byte 0x03007638
_08292C9C:
	cmp r4, #0x1b
	bne _08292CB8
	ldr r0, _08292CC8
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08292CB0
	adds r1, #0x94
	movs r0, #0
	strh r0, [r1]
_08292CB0:
	ldr r0, _08292CCC
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #9]
_08292CB8:
	adds r0, r4, #0
	adds r1, r6, #0
	bl rfu_STC_REQ_callback
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08292CC8: .4byte 0x03007630
_08292CCC: .4byte 0x03007634
	thumb_func_end rfu_CB_pollAndEndSearchChild

	thumb_func_start rfu_STC_readChildList
rfu_STC_readChildList: @ 0x08292CD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08292D80
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrb r7, [r0, #1]
	adds r6, r0, #4
	cmp r7, #0
	beq _08292D76
	ldr r0, _08292D84
	mov r8, r0
	ldr r1, _08292D88
	mov ip, r1
_08292CEE:
	ldrb r4, [r6, #2]
	cmp r4, #3
	bhi _08292D6A
	mov r2, ip
	ldr r1, [r2]
	ldrb r0, [r1, #2]
	asrs r0, r4
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	bne _08292D6A
	ldrb r0, [r1, #3]
	asrs r0, r4
	ands r0, r5
	cmp r0, #0
	bne _08292D6A
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xe
	adds r0, r0, r4
	movs r1, #0xf0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xa
	adds r0, r0, r4
	movs r1, #0x10
	strb r1, [r0]
	ldr r2, [r2]
	adds r0, r5, #0
	lsls r0, r4
	ldrb r1, [r2, #2]
	orrs r0, r1
	strb r0, [r2, #2]
	mov r2, ip
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	ldr r1, [r2]
	lsls r3, r4, #5
	adds r1, r1, r3
	ldrh r0, [r6]
	strh r0, [r1, #0x14]
	strb r4, [r1, #0x16]
	ldr r0, [r2]
	strb r5, [r0]
	mov r0, r8
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	mov r2, r8
	ldr r1, [r2]
	lsls r0, r4, #1
	adds r1, #0x12
	adds r1, r1, r0
	mov r2, ip
	ldr r0, [r2]
	adds r0, r0, r3
	ldrh r0, [r0, #0x14]
	strh r0, [r1]
_08292D6A:
	subs r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r6, #4
	cmp r7, #0
	bne _08292CEE
_08292D76:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08292D80: .4byte 0x03007638
_08292D84: .4byte 0x03007634
_08292D88: .4byte 0x03007630
	thumb_func_end rfu_STC_readChildList

	thumb_func_start rfu_REQ_startSearchParent
rfu_REQ_startSearchParent: @ 0x08292D8C
	push {lr}
	ldr r0, _08292D9C
	bl STWI_set_Callback_M
	bl STWI_send_SP_StartREQ
	pop {r0}
	bx r0
	.align 2, 0
_08292D9C: .4byte 0x08292DA1
	thumb_func_end rfu_REQ_startSearchParent

	thumb_func_start rfu_CB_startSearchParent
rfu_CB_startSearchParent: @ 0x08292DA0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r4, r1, #0
	cmp r4, #0
	bne _08292DB6
	movs r0, #0
	bl rfu_STC_clearLinkStatus
_08292DB6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl rfu_STC_REQ_callback
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end rfu_CB_startSearchParent

	thumb_func_start rfu_REQ_pollSearchParent
rfu_REQ_pollSearchParent: @ 0x08292DC4
	push {lr}
	ldr r0, _08292DD4
	bl STWI_set_Callback_M
	bl STWI_send_SP_PollingREQ
	pop {r0}
	bx r0
	.align 2, 0
_08292DD4: .4byte 0x08292DD9
	thumb_func_end rfu_REQ_pollSearchParent

	thumb_func_start sub_08292DD8
sub_08292DD8: @ 0x08292DD8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r4, r1, #0
	cmp r4, #0
	bne _08292DEC
	bl rfu_STC_readParentCandidateList
_08292DEC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl rfu_STC_REQ_callback
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08292DD8

	thumb_func_start rfu_REQ_endSearchParent
rfu_REQ_endSearchParent: @ 0x08292DFC
	push {lr}
	ldr r0, _08292E0C
	bl STWI_set_Callback_M
	bl STWI_send_SP_EndREQ
	pop {r0}
	bx r0
	.align 2, 0
_08292E0C: .4byte 0x082926C1
	thumb_func_end rfu_REQ_endSearchParent

	thumb_func_start rfu_STC_readParentCandidateList
rfu_STC_readParentCandidateList: @ 0x08292E10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r5, _08292EB8
	ldr r1, [r5]
	adds r1, #0x14
	ldr r2, _08292EBC
	bl CpuSet
	ldr r0, _08292EC0
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r2, [r0]
	ldrb r7, [r2, #1]
	adds r2, #4
	ldr r0, [r5]
	strb r4, [r0, #8]
	movs r6, #0
	cmp r7, #0
	beq _08292F14
	mov ip, r5
	ldr r0, _08292EC4
	mov r8, r0
_08292E46:
	subs r0, r7, #7
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r1, r2, #6
	adds r2, #0x13
	ldrb r0, [r2]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r2, #1
	movs r4, #0
	movs r3, #0
	adds r6, #1
_08292E60:
	ldrb r0, [r2]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	adds r2, #1
	lsrs r0, r0, #0x18
	ldrb r4, [r1]
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08292E60
	cmp r4, r5
	bne _08292F08
	subs r2, #0x1c
	mov r0, ip
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	lsls r0, r0, #5
	adds r0, #0x14
	adds r4, r1, r0
	ldrh r0, [r2]
	movs r3, #0
	strh r0, [r4]
	adds r2, #2
	ldrb r0, [r2]
	strb r0, [r4, #2]
	adds r2, #2
	ldrh r1, [r2]
	mov r0, r8
	ands r0, r1
	strh r0, [r4, #4]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08292EC8
	movs r0, #1
	strb r0, [r4, #3]
	b _08292ECA
	.align 2, 0
_08292EB8: .4byte 0x03007630
_08292EBC: .4byte 0x01000040
_08292EC0: .4byte 0x03007638
_08292EC4: .4byte 0x00007FFF
_08292EC8:
	strb r3, [r4, #3]
_08292ECA:
	adds r2, #2
	movs r3, #0
	adds r5, r4, #0
	adds r5, #0x15
	adds r4, #6
_08292ED4:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xc
	bls _08292ED4
	adds r2, #1
	movs r3, #0
	adds r4, r5, #0
_08292EEC:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08292EEC
	mov r4, ip
	ldr r1, [r4]
	ldrb r0, [r1, #8]
	adds r0, #1
	strb r0, [r1, #8]
_08292F08:
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bhi _08292F14
	cmp r7, #0
	bne _08292E46
_08292F14:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end rfu_STC_readParentCandidateList

	thumb_func_start rfu_REQ_startConnectParent
rfu_REQ_startConnectParent: @ 0x08292F20
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	movs r2, #0
	ldr r1, _08292F6C
	ldr r0, [r1]
	ldrh r0, [r0, #0x14]
	cmp r0, r4
	beq _08292F4C
	adds r5, r1, #0
_08292F36:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _08292F4C
	ldr r0, [r5]
	lsls r1, r2, #5
	adds r0, r0, r1
	ldrh r0, [r0, #0x14]
	cmp r0, r4
	bne _08292F36
_08292F4C:
	cmp r2, #4
	bne _08292F54
	movs r3, #0x80
	lsls r3, r3, #1
_08292F54:
	cmp r3, #0
	bne _08292F78
	ldr r0, _08292F70
	ldr r0, [r0]
	strh r4, [r0, #0x1e]
	ldr r0, _08292F74
	bl STWI_set_Callback_M
	adds r0, r4, #0
	bl STWI_send_CP_StartREQ
	b _08292F80
	.align 2, 0
_08292F6C: .4byte 0x03007630
_08292F70: .4byte 0x03007634
_08292F74: .4byte 0x082926C1
_08292F78:
	movs r0, #0x1f
	adds r1, r3, #0
	bl rfu_STC_REQ_callback
_08292F80:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end rfu_REQ_startConnectParent

	thumb_func_start rfu_REQ_pollConnectParent
rfu_REQ_pollConnectParent: @ 0x08292F88
	push {lr}
	ldr r0, _08292F98
	bl STWI_set_Callback_M
	bl STWI_send_CP_PollingREQ
	pop {r0}
	bx r0
	.align 2, 0
_08292F98: .4byte 0x08292F9D
	thumb_func_end rfu_REQ_pollConnectParent

	thumb_func_start rfu_CB_pollConnectParent
rfu_CB_pollConnectParent: @ 0x08292F9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x28]
	cmp r1, #0
	bne _0829309E
	ldr r0, _08293058
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrh r5, [r0, #4]
	ldrb r1, [r0, #6]
	mov sl, r1
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _0829309E
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r1
	lsrs r2, r0, #0x18
	ldr r4, _0829305C
	ldr r3, [r4]
	ldrb r1, [r3, #2]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0829309E
	adds r0, r2, #0
	orrs r0, r1
	strb r0, [r3, #2]
	ldr r1, [r4]
	ldrb r0, [r1, #3]
	bics r0, r2
	strb r0, [r1, #3]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x94
	movs r2, #0
	strh r5, [r0]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	ldr r0, [r4]
	strb r2, [r0]
	ldr r3, _08293060
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r5, #0
	adds r7, r4, #0
	add r6, sp, #0x20
	movs r0, #0
	mov r8, r0
_0829301A:
	ldr r2, [r7]
	lsls r4, r5, #5
	adds r0, r2, r4
	ldr r1, [r3]
	ldrh r0, [r0, #0x14]
	ldrh r1, [r1, #0x1e]
	cmp r0, r1
	bne _08293072
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _08293068
	mov sb, sp
	adds r0, r4, #0
	adds r0, #0x14
	adds r0, r2, r0
	mov r1, sp
	movs r2, #0x10
	bl CpuSet
	mov r1, r8
	strh r1, [r6]
	ldr r1, [r7]
	adds r1, #0x14
	adds r0, r6, #0
	ldr r2, _08293064
	bl CpuSet
	ldr r0, [r7]
	mov r1, r8
	strb r1, [r0, #8]
	b _0829307C
	.align 2, 0
_08293058: .4byte 0x03007638
_0829305C: .4byte 0x03007630
_08293060: .4byte 0x03007634
_08293064: .4byte 0x01000040
_08293068:
	adds r0, r4, #0
	adds r0, #0x14
	adds r2, r2, r0
	mov sb, r2
	b _0829307C
_08293072:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _0829301A
_0829307C:
	cmp r5, #3
	bhi _0829309E
	ldr r4, _082930B8
	mov r0, sl
	lsls r5, r0, #5
	adds r0, r5, #0
	adds r0, #0x14
	ldr r1, [r4]
	adds r1, r1, r0
	mov r0, sb
	movs r2, #0x10
	bl CpuSet
	ldr r0, [r4]
	adds r0, r0, r5
	mov r1, sl
	strb r1, [r0, #0x16]
_0829309E:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl rfu_STC_REQ_callback
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_082930B8: .4byte 0x03007630
	thumb_func_end rfu_CB_pollConnectParent

	thumb_func_start rfu_getConnectParentStatus
rfu_getConnectParentStatus: @ 0x082930BC
	push {lr}
	adds r3, r0, #0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _082930DC
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r2, [r0]
	ldrb r0, [r2]
	adds r0, #0x60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _082930E0
	movs r0, #0x10
	b _082930EC
	.align 2, 0
_082930DC: .4byte 0x03007638
_082930E0:
	adds r2, #6
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r3]
	movs r0, #0
_082930EC:
	pop {r1}
	bx r1
	thumb_func_end rfu_getConnectParentStatus

	thumb_func_start rfu_REQ_endConnectParent
rfu_REQ_endConnectParent: @ 0x082930F0
	push {lr}
	ldr r0, _0829311C
	bl STWI_set_Callback_M
	bl STWI_send_CP_EndREQ
	ldr r0, _08293120
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	cmp r0, #3
	bhi _08293118
	ldr r0, _08293124
	ldr r0, [r0]
	adds r0, #0xa
	ldrb r1, [r1, #6]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_08293118:
	pop {r0}
	bx r0
	.align 2, 0
_0829311C: .4byte 0x08292F9D
_08293120: .4byte 0x03007638
_08293124: .4byte 0x03007634
	thumb_func_end rfu_REQ_endConnectParent

	thumb_func_start rfu_syncVBlank
rfu_syncVBlank: @ 0x08293128
	push {r4, r5, lr}
	bl rfu_NI_checkCommFailCounter
	ldr r0, _08293170
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08293200
	ldr r4, _08293174
	ldr r1, [r4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _08293146
	subs r0, #1
	strb r0, [r1, #6]
_08293146:
	bl rfu_getMasterSlave
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08293178
	cmp r3, #0
	bne _08293186
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r4]
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r1, #0x20]
	b _08293182
	.align 2, 0
_08293170: .4byte 0x03007630
_08293174: .4byte 0x03007634
_08293178:
	cmp r3, #0
	beq _08293198
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2]
_08293182:
	cmp r3, #0
	beq _08293198
_08293186:
	ldr r3, _08293194
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	b _082931A2
	.align 2, 0
_08293194: .4byte 0x03007634
_08293198:
	ldr r3, _082931F4
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
_082931A2:
	strb r0, [r2]
	ldr r3, [r3]
	ldrb r1, [r3]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08293200
	ldrh r0, [r3, #0x20]
	cmp r0, #0
	bne _082931FC
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r3]
	ldr r0, _082931F8
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	ldrb r0, [r0, #3]
	adds r5, r0, #0
	orrs r5, r1
	movs r4, #0
_082931CA:
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _082931DC
	adds r0, r4, #0
	bl rfu_STC_removeLinkData
_082931DC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _082931CA
	ldr r0, _082931F8
	ldr r1, [r0]
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	b _08293202
	.align 2, 0
_082931F4: .4byte 0x03007634
_082931F8: .4byte 0x03007630
_082931FC:
	subs r0, #1
	strh r0, [r3, #0x20]
_08293200:
	movs r0, #0
_08293202:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end rfu_syncVBlank

	thumb_func_start rfu_REQBN_watchLink
rfu_REQBN_watchLink: @ 0x08293208
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r1
	str r2, [sp]
	str r3, [sp, #4]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	mov r2, r8
	strb r1, [r2]
	mov r0, sp
	ldrb r1, [r0, #0xc]
	ldr r0, [sp]
	strb r1, [r0]
	mov r2, sp
	ldrb r0, [r2, #0xc]
	ldr r2, [sp, #4]
	strb r0, [r2]
	ldr r5, _082932A8
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08293246
	b _082935D6
_08293246:
	ldr r0, _082932AC
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _08293252
	b _082935D6
_08293252:
	ldr r3, _082932B0
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r4, #4
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08293268
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r2, #0x20]
_08293268:
	ldr r1, [r3]
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _08293276
	strb r4, [r1, #6]
	movs r1, #1
	str r1, [sp, #8]
_08293276:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x29
	bne _082932B8
	ldr r0, _082932B4
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r1, [r0]
	ldrb r0, [r1, #4]
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r1, #5]
	ldr r1, [sp]
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _082932A0
	ldr r0, [r5]
	ldrb r0, [r0, #2]
	strb r0, [r2]
_082932A0:
	movs r2, #2
	str r2, [sp, #8]
	b _08293310
	.align 2, 0
_082932A8: .4byte 0x03007630
_082932AC: .4byte 0x03007608
_082932B0: .4byte 0x03007634
_082932B4: .4byte 0x03007638
_082932B8:
	movs r0, #0x9b
	lsls r0, r0, #1
	cmp r6, r0
	bne _08293308
	ldr r0, _08293364
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrb r6, [r0, #5]
	ldr r0, [r5]
	ldrb r0, [r0, #2]
	eors r6, r0
	ands r6, r0
	mov r0, r8
	strb r6, [r0]
	movs r0, #1
	ldr r1, [sp]
	strb r0, [r1]
	movs r5, #0
_082932DE:
	mov r2, r8
	ldrb r0, [r2]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _082932FE
	ldr r0, _08293368
	ldr r0, [r0]
	adds r0, #0xa
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl rfu_STC_removeLinkData
_082932FE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _082932DE
_08293308:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _08293310
	b _082935D6
_08293310:
	ldr r4, _08293364
	ldr r0, [r4]
	adds r0, #0xdc
	ldr r0, [r0]
	ldr r1, [r0]
	str r1, [sp, #0x10]
	ldr r0, [r0, #4]
	str r0, [sp, #0x14]
	ldr r0, _0829336C
	bl STWI_set_Callback_M
	bl STWI_send_LinkStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _08293370
	ldr r0, [r4]
	adds r0, #0xdc
	ldr r0, [r0]
	adds r2, r0, #4
	movs r5, #0
	ldr r3, _08293368
_08293344:
	ldr r0, [r3]
	adds r0, #0xa
	adds r0, r0, r5
	ldrb r1, [r2]
	strb r1, [r0]
	adds r2, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08293344
	movs r2, #0
	mov sb, r2
	movs r5, #0
	b _0829337C
	.align 2, 0
_08293364: .4byte 0x03007638
_08293368: .4byte 0x03007630
_0829336C: .4byte 0x08292701
_08293370:
	movs r0, #0x11
	ldr r1, [sp, #0xc]
	bl rfu_STC_REQ_callback
	ldr r0, [sp, #0xc]
	b _082935D8
_0829337C:
	ldr r1, _08293404
	ldr r0, [r1]
	adds r0, #0xe
	adds r2, r0, r5
	ldrb r0, [r2]
	adds r3, r1, #0
	cmp r0, #0
	beq _082933A2
	subs r0, #4
	strb r0, [r2]
	ldr r0, _08293408
	ldr r0, [r0]
	adds r0, #0xa
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _082933A2
	movs r0, #0x10
	strb r0, [r1]
_082933A2:
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r5
	lsrs r6, r0, #0x18
	adds r0, r5, #1
	mov sl, r0
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _082933B6
	b _0829358A
_082933B6:
	ldr r2, [sp, #8]
	cmp r2, #1
	bne _08293498
	ldr r4, _08293408
	ldr r1, [r4]
	ldrb r0, [r1, #2]
	ands r0, r6
	cmp r0, #0
	beq _08293498
	adds r0, r1, #0
	adds r0, #0xa
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0829348C
	ldrb r0, [r1]
	cmp r0, #1
	bne _0829340C
	ldr r1, [r3]
	adds r1, #0xa
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, #0xa
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #3
	bls _08293498
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, #0
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	ldr r0, [sp]
	strb r2, [r0]
	b _08293498
	.align 2, 0
_08293404: .4byte 0x03007634
_08293408: .4byte 0x03007630
_0829340C:
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08293498
	ldr r0, _0829343C
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _08293440
	mov r2, r8
	ldrb r1, [r2]
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r2]
	mov r0, sp
	ldrb r1, [r0, #8]
	ldr r0, [sp]
	b _08293496
	.align 2, 0
_0829343C: .4byte 0x03007638
_08293440:
	ldr r2, _08293488
	ldr r1, [r2]
	adds r1, #0xa
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	ldr r2, [r2]
	lsrs r0, r0, #0x18
	ldrh r1, [r2, #0x1a]
	cmp r0, r1
	bls _08293498
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r0, r5
	mov r2, sp
	ldrb r2, [r2, #0xc]
	strb r2, [r0]
	ldr r0, [r4]
	ldrb r0, [r0, #2]
	bl STWI_send_DisconnectREQ
	bl STWI_poll_CommandEnd
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, #0
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp]
	strb r0, [r2]
	b _08293498
	.align 2, 0
_08293488: .4byte 0x03007634
_0829348C:
	ldr r0, [r3]
	adds r0, #0xa
	adds r0, r0, r5
	mov r1, sp
	ldrb r1, [r1, #0xc]
_08293496:
	strb r1, [r0]
_08293498:
	ldr r2, _082934F8
	mov ip, r2
	ldr r1, [r2]
	ldrb r7, [r1]
	adds r0, r5, #1
	mov sl, r0
	cmp r7, #1
	bne _0829358A
	adds r0, r1, #0
	adds r0, #0xa
	adds r4, r0, r5
	ldrb r3, [r4]
	cmp r3, #0
	beq _0829358A
	ldrb r2, [r1, #3]
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _08293506
	cmp r3, #0xa
	bls _08293500
	ldr r2, [sp, #4]
	ldrb r1, [r2]
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	ldr r2, [r0]
	ldrb r1, [r2, #2]
	adds r0, r6, #0
	orrs r0, r1
	movs r3, #0
	strb r0, [r2, #2]
	mov r2, ip
	ldr r1, [r2]
	ldrb r0, [r1, #3]
	bics r0, r6
	strb r0, [r1, #3]
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	ldr r0, _082934FC
	ldr r0, [r0]
	adds r0, #0xa
	adds r0, r0, r5
	strb r3, [r0]
	b _0829358A
	.align 2, 0
_082934F8: .4byte 0x03007630
_082934FC: .4byte 0x03007634
_08293500:
	movs r0, #0
	strb r0, [r4]
	b _0829358A
_08293506:
	ldrb r0, [r1, #2]
	orrs r0, r2
	ands r0, r6
	cmp r0, #0
	bne _0829358A
	bl STWI_send_SlotStatusREQ
	bl STWI_poll_CommandEnd
	ldr r0, _08293550
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r2, [r0]
	ldrb r0, [r2, #1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, #8
	cmp r3, #0
	beq _0829358A
	ldrh r4, [r2]
	ldrb r0, [r2, #2]
	cmp r0, r5
	bne _08293558
	ldr r0, _08293554
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _08293558
	lsls r7, r5
	mov r0, sb
	orrs r0, r7
	lsls r0, r0, #0x18
	b _08293586
	.align 2, 0
_08293550: .4byte 0x03007638
_08293554: .4byte 0x03007634
_08293558:
	adds r2, #4
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _0829358A
	ldrh r4, [r2]
	ldrb r0, [r2, #2]
	cmp r0, r5
	bne _08293558
	ldr r0, _082935E8
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _08293558
	movs r0, #1
	lsls r0, r5
	mov r1, sb
	orrs r1, r0
	lsls r0, r1, #0x18
_08293586:
	lsrs r0, r0, #0x18
	mov sb, r0
_0829358A:
	ldr r0, _082935EC
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	mov r2, r8
	ldrb r0, [r2]
	ands r0, r1
	ands r6, r0
	cmp r6, #0
	beq _082935A4
	adds r0, r5, #0
	movs r1, #0
	bl rfu_STC_removeLinkData
_082935A4:
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bhi _082935B0
	b _0829337C
_082935B0:
	mov r2, sb
	cmp r2, #0
	beq _082935C0
	mov r0, sb
	bl STWI_send_DisconnectREQ
	bl STWI_poll_CommandEnd
_082935C0:
	ldr r1, _082935F0
	ldr r0, [r1]
	adds r0, #0xdc
	ldr r0, [r0]
	ldr r2, [sp, #0x10]
	str r2, [r0]
	ldr r0, [r1]
	adds r0, #0xdc
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	str r1, [r0, #4]
_082935D6:
	movs r0, #0
_082935D8:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_082935E8: .4byte 0x03007634
_082935EC: .4byte 0x03007630
_082935F0: .4byte 0x03007638
	thumb_func_end rfu_REQBN_watchLink

	thumb_func_start rfu_STC_removeLinkData
rfu_STC_removeLinkData: @ 0x082935F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r7
	lsrs r6, r0, #0x18
	ldr r0, _082936A4
	ldr r0, [r0]
	adds r0, #0xe
	adds r0, r0, r7
	movs r1, #0
	strb r1, [r0]
	ldr r1, _082936A8
	ldr r4, [r1]
	ldrb r0, [r4, #2]
	ands r0, r6
	mov r8, r1
	cmp r0, #0
	beq _08293632
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _08293632
	subs r0, #1
	strb r0, [r4, #1]
_08293632:
	mov r3, r8
	ldr r2, [r3]
	mvns r5, r6
	ldrb r1, [r2, #2]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2, #2]
	ldr r2, [r3]
	ldrb r1, [r2, #3]
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r2, #3]
	ldr r3, [r3]
	ldr r0, [r3]
	ldr r1, _082936AC
	ands r0, r1
	cmp r0, #0
	bne _0829365A
	movs r0, #0xff
	strb r0, [r3]
_0829365A:
	mov r0, ip
	cmp r0, #0
	beq _08293698
	mov r1, sp
	movs r4, #0
	movs r0, #0
	strh r0, [r1]
	lsls r0, r7, #5
	adds r0, #0x14
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r2, _082936B0
	mov r0, sp
	bl CpuSet
	mov r0, r8
	ldr r2, [r0]
	ldrb r1, [r2, #3]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2, #3]
	mov r2, r8
	ldr r1, [r2]
	ldrb r0, [r1, #7]
	ands r5, r0
	strb r5, [r1, #7]
	ldr r0, [r2]
	adds r0, #0xa
	adds r0, r0, r7
	strb r4, [r0]
_08293698:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_082936A4: .4byte 0x03007634
_082936A8: .4byte 0x03007630
_082936AC: .4byte 0x00FF00FF
_082936B0: .4byte 0x01000010
	thumb_func_end rfu_STC_removeLinkData

	thumb_func_start rfu_REQ_disconnect
rfu_REQ_disconnect: @ 0x082936B4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _082936F8
	ldr r1, [r2]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	orrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _08293738
	ldr r0, _082936FC
	ldr r1, [r0]
	strb r4, [r1, #5]
	ldr r2, [r2]
	ldrb r1, [r2]
	adds r3, r0, #0
	cmp r1, #0xff
	bne _08293700
	ldr r0, [r3]
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08293700
	ldrb r0, [r2, #3]
	ands r0, r4
	cmp r0, #0
	beq _08293738
	movs r0, #0x30
	movs r1, #0
	bl rfu_CB_disconnect
	b _08293738
	.align 2, 0
_082936F8: .4byte 0x03007630
_082936FC: .4byte 0x03007634
_08293700:
	ldr r0, [r3]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0829372C
	ldr r0, _08293728
	bl STWI_set_Callback_M
	bl STWI_send_SC_EndREQ
	bl STWI_poll_CommandEnd
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0829372C
	movs r0, #0x1b
	bl rfu_STC_REQ_callback
	b _08293738
	.align 2, 0
_08293728: .4byte 0x08292701
_0829372C:
	ldr r0, _08293740
	bl STWI_set_Callback_M
	adds r0, r4, #0
	bl STWI_send_DisconnectREQ
_08293738:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08293740: .4byte rfu_CB_disconnect
	thumb_func_end rfu_REQ_disconnect

	thumb_func_start rfu_CB_disconnect
rfu_CB_disconnect: @ 0x08293744
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r5, #3
	bne _08293780
	ldr r0, _08293814
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _08293780
	ldr r0, _08293818
	bl STWI_set_Callback_M
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08293780
	ldr r0, _0829381C
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _08293780
	movs r5, #0
_08293780:
	ldr r3, _08293820
	ldr r2, [r3]
	ldr r0, _08293814
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	orrs r0, r1
	ldrb r1, [r2, #5]
	ands r0, r1
	strb r0, [r2, #5]
	ldr r0, _0829381C
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r1, [r0]
	ldr r0, [r3]
	ldrb r0, [r0, #5]
	strb r0, [r1, #8]
	cmp r5, #0
	bne _082937CE
	movs r4, #0
_082937A8:
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r4
	lsrs r0, r0, #0x18
	ldr r1, _08293820
	ldr r1, [r1]
	ldrb r1, [r1, #5]
	ands r0, r1
	cmp r0, #0
	beq _082937C4
	adds r0, r4, #0
	movs r1, #1
	bl rfu_STC_removeLinkData
_082937C4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _082937A8
_082937CE:
	ldr r0, _08293814
	ldr r2, [r0]
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	orrs r0, r1
	cmp r0, #0
	bne _082937E0
	movs r0, #0xff
	strb r0, [r2]
_082937E0:
	adds r0, r6, #0
	adds r1, r5, #0
	bl rfu_STC_REQ_callback
	ldr r0, _08293820
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0829380E
	ldr r0, _08293818
	bl STWI_set_Callback_M
	bl STWI_send_SC_StartREQ
	bl STWI_poll_CommandEnd
	adds r5, r0, #0
	cmp r5, #0
	beq _0829380E
	movs r0, #0x19
	adds r1, r5, #0
	bl rfu_STC_REQ_callback
_0829380E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08293814: .4byte gUnknown_3007630
_08293818: .4byte rfu_CB_defaultCallback
_0829381C: .4byte gUnknown_3007638
_08293820: .4byte gUnknown_3007634
	thumb_func_end rfu_CB_disconnect

	thumb_func_start rfu_REQ_CHILD_startConnectRecovery
rfu_REQ_CHILD_startConnectRecovery: @ 0x08293824
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08293874
	ldr r0, [r0]
	strb r5, [r0, #5]
	movs r4, #0
	movs r0, #1
	ands r0, r5
	ldr r2, _08293878
	cmp r0, #0
	bne _08293852
	movs r1, #1
_0829383E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bhi _08293852
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r1
	cmp r0, #0
	beq _0829383E
_08293852:
	adds r0, r2, #0
	bl STWI_set_Callback_M
	ldr r0, _0829387C
	ldr r1, [r0]
	lsls r0, r4, #5
	adds r0, r1, r0
	ldrh r0, [r0, #0x14]
	adds r1, #0x94
	ldrh r1, [r1]
	adds r2, r5, #0
	bl STWI_send_CPR_StartREQ
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08293874: .4byte gUnknown_3007634
_08293878: .4byte rfu_STC_REQ_callback
_0829387C: .4byte gUnknown_3007630
	thumb_func_end rfu_REQ_CHILD_startConnectRecovery

	thumb_func_start rfu_REQ_CHILD_pollConnectRecovery
rfu_REQ_CHILD_pollConnectRecovery: @ 0x08293880
	push {lr}
	ldr r0, _08293890
	bl STWI_set_Callback_M
	bl STWI_send_CPR_PollingREQ
	pop {r0}
	bx r0
	.align 2, 0
_08293890: .4byte rfu_CB_CHILD_pollConnectRecovery
	thumb_func_end rfu_REQ_CHILD_pollConnectRecovery

	thumb_func_start rfu_CB_CHILD_pollConnectRecovery
rfu_CB_CHILD_pollConnectRecovery: @ 0x08293894
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	cmp r7, #0
	bne _08293918
	ldr r0, _0829392C
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08293918
	ldr r0, _08293930
	ldr r1, [r0]
	ldrb r1, [r1, #5]
	adds r6, r0, #0
	cmp r1, #0
	beq _08293918
	ldr r1, _08293934
	ldr r0, [r1]
	strb r7, [r0]
	movs r4, #0
	adds r5, r1, #0
	mov ip, r4
_082938CE:
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r4
	lsrs r3, r0, #0x18
	ldr r2, [r5]
	ldr r0, [r6]
	ldrb r0, [r0, #5]
	ands r0, r3
	ldrb r1, [r2, #3]
	ands r0, r1
	cmp r0, #0
	beq _08293908
	ldrb r1, [r2, #2]
	adds r0, r3, #0
	orrs r0, r1
	strb r0, [r2, #2]
	ldr r1, [r5]
	ldrb r0, [r1, #3]
	bics r0, r3
	strb r0, [r1, #3]
	ldr r1, [r5]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	ldr r0, [r6]
	adds r0, #0xa
	adds r0, r0, r4
	mov r1, ip
	strb r1, [r0]
_08293908:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _082938CE
	ldr r1, [r6]
	movs r0, #0
	strb r0, [r1, #5]
_08293918:
	mov r0, r8
	adds r1, r7, #0
	bl rfu_STC_REQ_callback
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0829392C: .4byte gUnknown_3007638
_08293930: .4byte gUnknown_3007634
_08293934: .4byte gUnknown_3007630
	thumb_func_end rfu_CB_CHILD_pollConnectRecovery

	thumb_func_start rfu_CHILD_getConnectRecoveryStatus
rfu_CHILD_getConnectRecoveryStatus: @ 0x08293938
	push {lr}
	adds r2, r0, #0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _08293958
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #0x4d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0829395C
	movs r0, #0x10
	b _08293962
	.align 2, 0
_08293958: .4byte gUnknown_3007638
_0829395C:
	ldrb r0, [r1, #4]
	strb r0, [r2]
	movs r0, #0
_08293962:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end rfu_CHILD_getConnectRecoveryStatus

	thumb_func_start rfu_REQ_CHILD_endConnectRecovery
rfu_REQ_CHILD_endConnectRecovery: @ 0x08293968
	push {lr}
	ldr r0, _08293978
	bl STWI_set_Callback_M
	bl STWI_send_CPR_EndREQ
	pop {r0}
	bx r0
	.align 2, 0
_08293978: .4byte rfu_CB_CHILD_pollConnectRecovery
	thumb_func_end rfu_REQ_CHILD_endConnectRecovery

	thumb_func_start sub_0829397C
sub_0829397C: @ 0x0829397C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r3, [r5]
	ldr r1, [r6]
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _082939A0
	adds r4, r0, #0
_08293992:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, #1
	adds r1, #1
	subs r2, #1
	cmp r2, r4
	bne _08293992
_082939A0:
	str r3, [r5]
	str r1, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0829397C

	thumb_func_start rfu_REQ_changeMasterSlave
rfu_REQ_changeMasterSlave: @ 0x082939AC
	push {lr}
	movs r0, #1
	bl STWI_read_status
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _082939CC
	ldr r0, _082939C8
	bl STWI_set_Callback_M
	bl STWI_send_MS_ChangeREQ
	b _082939D4
	.align 2, 0
_082939C8: .4byte rfu_STC_REQ_callback
_082939CC:
	movs r0, #0x27
	movs r1, #0
	bl rfu_STC_REQ_callback
_082939D4:
	pop {r0}
	bx r0
	thumb_func_end rfu_REQ_changeMasterSlave

	thumb_func_start rfu_getMasterSlave
rfu_getMasterSlave: @ 0x082939D8
	push {lr}
	movs r0, #1
	bl STWI_read_status
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #1
	bne _08293A06
	ldr r0, _08293A0C
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	beq _08293A06
	ldrb r0, [r1, #6]
	cmp r0, #0x27
	beq _08293A04
	cmp r0, #0x25
	beq _08293A04
	cmp r0, #0x37
	bne _08293A06
_08293A04:
	movs r2, #0
_08293A06:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08293A0C: .4byte gUnknown_3007608
	thumb_func_end rfu_getMasterSlave

	thumb_func_start rfu_clearAllSlot
rfu_clearAllSlot: @ 0x08293A10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r1, _08293A94
	ldrh r0, [r1]
	mov r8, r0
	movs r0, #0
	strh r0, [r1]
	movs r5, #0
	mov r0, sp
	adds r0, #2
	movs r7, #0
	adds r6, r0, #0
_08293A2C:
	mov r0, sp
	strh r7, [r0]
	ldr r0, _08293A98
	lsls r4, r5, #2
	adds r0, r4, r0
	ldr r1, [r0]
	mov r0, sp
	ldr r2, _08293A9C
	bl CpuSet
	strh r7, [r6]
	ldr r0, _08293AA0
	adds r4, r4, r0
	ldr r1, [r4]
	adds r0, r6, #0
	ldr r2, _08293AA4
	bl CpuSet
	ldr r3, _08293AA8
	ldr r0, [r3]
	adds r0, #0x10
	adds r0, r0, r5
	movs r1, #0x10
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _08293A2C
	ldr r2, [r3]
	movs r1, #0
	movs r0, #0x57
	strb r0, [r2, #0xf]
	ldr r0, [r3]
	strb r1, [r0, #4]
	ldr r0, [r3]
	strb r1, [r0, #5]
	ldr r0, [r3]
	strb r1, [r0, #6]
	ldr r0, _08293AAC
	ldr r0, [r0]
	strb r1, [r0, #2]
	ldr r0, _08293A94
	mov r1, r8
	strh r1, [r0]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08293A94: .4byte 0x04000208
_08293A98: .4byte gUnknown_3007620
_08293A9C: .4byte 0x01000034
_08293AA0: .4byte gUnknown_3007610
_08293AA4: .4byte 0x0100000A
_08293AA8: .4byte gUnknown_3007630
_08293AAC: .4byte gUnknown_3007634
	thumb_func_end rfu_clearAllSlot

	thumb_func_start rfu_STC_releaseFrame
rfu_STC_releaseFrame: @ 0x08293AB0
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r5, r2, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r0, _08293AE8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08293AF0
	ldr r6, _08293AEC
	cmp r3, #0
	bne _08293ADC
	ldr r1, [r6]
	ldrb r0, [r1, #0xf]
	ldrh r4, [r4, #0x2e]
	adds r0, r0, r4
	strb r0, [r1, #0xf]
_08293ADC:
	ldr r1, [r6]
	ldrb r0, [r1, #0xf]
	adds r0, #3
	strb r0, [r1, #0xf]
	b _08293B10
	.align 2, 0
_08293AE8: .4byte gUnknown_3007634
_08293AEC: .4byte gUnknown_3007630
_08293AF0:
	ldr r6, _08293B18
	cmp r3, #0
	bne _08293B04
	ldr r1, [r6]
	adds r1, #0x10
	adds r1, r1, r2
	ldrb r0, [r1]
	ldrh r4, [r4, #0x2e]
	adds r0, r0, r4
	strb r0, [r1]
_08293B04:
	ldr r1, [r6]
	adds r1, #0x10
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #2
	strb r0, [r1]
_08293B10:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08293B18: .4byte gUnknown_3007630
	thumb_func_end rfu_STC_releaseFrame

	thumb_func_start rfu_clearSlot
rfu_clearSlot: @ 0x08293B1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	cmp r7, #3
	bls _08293B3C
	movs r0, #0x80
	lsls r0, r0, #3
	b _08293CB4
_08293B3C:
	movs r0, #0xf
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _08293B4C
	movs r0, #0xc0
	lsls r0, r0, #3
	b _08293CB4
_08293B4C:
	ldr r1, _08293B90
	ldrh r0, [r1]
	mov sl, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0xc
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _08293C14
	movs r3, #0
	ldr r1, _08293B94
	lsls r0, r7, #2
	adds r0, r0, r1
	mov sb, r0
_08293B6A:
	movs r4, #0
	cmp r3, #0
	bne _08293B9C
	movs r0, #4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08293BBC
	mov r2, sb
	ldr r4, [r2]
	ldr r0, _08293B98
	ldr r2, [r0]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	ldrb r0, [r2, #4]
	bics r0, r1
	strb r0, [r2, #4]
	b _08293BBC
	.align 2, 0
_08293B90: .4byte 0x04000208
_08293B94: .4byte gUnknown_3007620
_08293B98: .4byte gUnknown_3007630
_08293B9C:
	movs r0, #8
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08293BBC
	mov r2, sb
	ldr r0, [r2]
	adds r4, r0, #0
	adds r4, #0x34
	ldr r0, _08293C50
	ldr r2, [r0]
	movs r1, #1
	lsls r1, r7
	ldrb r0, [r2, #5]
	bics r0, r1
	strb r0, [r2, #5]
_08293BBC:
	adds r6, r3, #1
	cmp r4, #0
	beq _08293C0C
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08293BFC
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	adds r0, r7, #0
	adds r2, r4, #0
	bl rfu_STC_releaseFrame
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x2c
	movs r5, #1
	movs r3, #0
_08293BE6:
	ldrb r0, [r2]
	asrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _08293BF2
	strh r3, [r4, #2]
_08293BF2:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #3
	bls _08293BE6
_08293BFC:
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	mov r0, sp
	adds r1, r4, #0
	ldr r2, _08293C54
	bl CpuSet
_08293C0C:
	lsls r0, r6, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08293B6A
_08293C14:
	movs r0, #1
	mov r4, r8
	ands r0, r4
	cmp r0, #0
	beq _08293C8A
	ldr r1, _08293C58
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08293C7C
	ldr r0, _08293C5C
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08293C60
	ldr r2, _08293C50
	ldr r1, [r2]
	ldrb r0, [r1, #0xf]
	adds r0, #3
	ldrb r4, [r3, #4]
	adds r0, r0, r4
	strb r0, [r1, #0xf]
	b _08293C72
	.align 2, 0
_08293C50: .4byte gUnknown_3007630
_08293C54: .4byte 0x0100001A
_08293C58: .4byte gUnknown_3007610
_08293C5C: .4byte gUnknown_3007634
_08293C60:
	ldr r2, _08293CC4
	ldr r1, [r2]
	adds r1, #0x10
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #2
	ldrb r4, [r3, #4]
	adds r0, r0, r4
	strb r0, [r1]
_08293C72:
	ldr r2, [r2]
	ldrb r1, [r3, #3]
	ldrb r0, [r2, #6]
	bics r0, r1
	strb r0, [r2, #6]
_08293C7C:
	mov r0, sp
	movs r1, #0
	strh r1, [r0]
	ldr r2, _08293CC8
	adds r1, r3, #0
	bl CpuSet
_08293C8A:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08293CAC
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08293CCC
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0xc
	ldr r2, _08293CD0
	mov r0, sp
	bl CpuSet
_08293CAC:
	ldr r0, _08293CD4
	mov r2, sl
	strh r2, [r0]
	movs r0, #0
_08293CB4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08293CC4: .4byte gUnknown_3007630
_08293CC8: .4byte 0x01000006
_08293CCC: .4byte gUnknown_3007610
_08293CD0: .4byte 0x01000004
_08293CD4: .4byte 0x04000208
	thumb_func_end rfu_clearSlot

	thumb_func_start rfu_setRecvBuffer
rfu_setRecvBuffer: @ 0x08293CD8
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, r3, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r4, r1, #0
	cmp r1, #3
	bls _08293CF4
	movs r0, #0x80
	lsls r0, r0, #3
	b _08293D2C
_08293CF4:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08293D10
	ldr r0, _08293D0C
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r5, [r0, #0x68]
	str r6, [r0, #0x6c]
	b _08293D2A
	.align 2, 0
_08293D0C: .4byte gUnknown_3007620
_08293D10:
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	bne _08293D1E
	movs r0, #0xc0
	lsls r0, r0, #3
	b _08293D2C
_08293D1E:
	ldr r0, _08293D34
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r5, [r0, #0x14]
	str r6, [r0, #0x18]
_08293D2A:
	movs r0, #0
_08293D2C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08293D34: .4byte gUnknown_3007610
	thumb_func_end rfu_setRecvBuffer

	thumb_func_start rfu_NI_setSendData
rfu_NI_setSendData: @ 0x08293D38
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r3, [sp]
	movs r0, #0x20
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl rfu_STC_setSendData_org
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end rfu_NI_setSendData

	thumb_func_start rfu_UNI_setSendData
rfu_UNI_setSendData: @ 0x08293D64
	push {lr}
	sub sp, #4
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _08293D80
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _08293D84
	adds r0, r2, #3
	b _08293D86
	.align 2, 0
_08293D80: .4byte gUnknown_3007630
_08293D84:
	adds r0, r2, #2
_08293D86:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	bl rfu_STC_setSendData_org
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end rfu_UNI_setSendData

	thumb_func_start rfu_NI_CHILD_setSendGameName
rfu_NI_CHILD_setSendGameName: @ 0x08293DA0
	push {lr}
	sub sp, #4
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	lsls r1, r0
	lsrs r1, r1, #0x18
	ldr r0, _08293DD0
	ldr r3, [r0]
	adds r3, #0x98
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #0x40
	bl rfu_STC_setSendData_org
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_08293DD0: .4byte gUnknown_3007630
	thumb_func_end rfu_NI_CHILD_setSendGameName

	thumb_func_start rfu_STC_setSendData_org
rfu_STC_setSendData_org: @ 0x08293DD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r3, [sp]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r0, _08293E00
	ldr r2, [r0]
	ldrb r1, [r2]
	mov sl, r0
	cmp r1, #0xff
	bne _08293E08
	ldr r0, _08293E04
	b _08293FBE
	.align 2, 0
_08293E00: .4byte gUnknown_3007630
_08293E04: .4byte 0x00000301
_08293E08:
	movs r0, #0xf
	ands r0, r3
	cmp r0, #0
	bne _08293E16
	movs r0, #0x80
	lsls r0, r0, #3
	b _08293FBE
_08293E16:
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	orrs r0, r1
	ands r0, r3
	cmp r0, r3
	beq _08293E2C
	ldr r0, _08293E28
	b _08293FBE
	.align 2, 0
_08293E28: .4byte 0x00000401
_08293E2C:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _08293E38
	ldrb r0, [r2, #6]
	b _08293E3A
_08293E38:
	ldrb r0, [r2, #4]
_08293E3A:
	ands r0, r3
	cmp r0, #0
	beq _08293E48
	ldr r0, _08293E44
	b _08293FBE
	.align 2, 0
_08293E44: .4byte 0x00000402
_08293E48:
	movs r2, #0
	movs r0, #1
	ands r0, r3
	ldr r4, _08293E78
	cmp r0, #0
	bne _08293E6A
	movs r1, #1
_08293E56:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _08293E6A
	adds r0, r3, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _08293E56
_08293E6A:
	mov r0, sl
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #1
	bne _08293E7C
	adds r1, #0xf
	b _08293E86
	.align 2, 0
_08293E78: .4byte gUnknown_890EEA4
_08293E7C:
	cmp r0, #0
	bne _08293E88
	adds r0, r2, #0
	adds r0, #0x10
	adds r1, r1, r0
_08293E86:
	mov sb, r1
_08293E88:
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r4, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r8, r0
	bhi _08293EA0
	cmp r8, r4
	bhi _08293EA6
_08293EA0:
	movs r0, #0xa0
	lsls r0, r0, #3
	b _08293FBE
_08293EA6:
	ldr r1, _08293EF4
	ldrh r0, [r1]
	str r0, [sp, #4]
	movs r7, #0
	strh r7, [r1]
	movs r0, #0x20
	ands r0, r6
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08293EC0
	cmp r6, #0x40
	bne _08293F7C
_08293EC0:
	ldr r1, _08293EF8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov ip, r0
	movs r1, #0
	strh r1, [r0, #0x18]
	mov r1, ip
	adds r1, #0x2d
	mov r2, ip
	str r1, [r2, #4]
	movs r0, #7
	str r0, [r2, #0x14]
	mov r0, ip
	adds r0, #0x2c
	strb r3, [r0]
	strb r3, [r2, #0x1a]
	mov r2, r8
	subs r0, r2, r4
	mov r2, ip
	strh r0, [r2, #0x2e]
	cmp r5, #0
	beq _08293EFC
	strb r7, [r1]
	b _08293F00
	.align 2, 0
_08293EF4: .4byte 0x04000208
_08293EF8: .4byte gUnknown_3007620
_08293EFC:
	movs r0, #1
	strb r0, [r1]
_08293F00:
	ldr r0, [sp, #0x28]
	mov r1, ip
	str r0, [r1, #0x30]
	ldr r2, [sp]
	str r2, [r1, #0x28]
	movs r1, #0
	mov r0, ip
	strb r1, [r0, #0x1f]
	adds r0, #0x20
	strb r1, [r0]
	mov r4, ip
	adds r4, #0x1b
	movs r6, #0
	mov r2, ip
	adds r2, #0x21
	movs r5, #1
_08293F20:
	adds r0, r4, r1
	strb r6, [r0]
	adds r0, r2, r1
	strb r5, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _08293F20
	movs r2, #0
	movs r5, #1
	ldr r4, _08293F74
	movs r1, #0
_08293F3A:
	adds r0, r3, #0
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _08293F4C
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r0, [r0]
	strh r1, [r0, #2]
_08293F4C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _08293F3A
	mov r1, sl
	ldr r2, [r1]
	ldrb r1, [r2, #4]
	adds r0, r3, #0
	orrs r0, r1
	strb r0, [r2, #4]
	mov r2, sb
	ldrb r0, [r2]
	mov r1, r8
	subs r0, r0, r1
	strb r0, [r2]
	ldr r0, _08293F78
	mov r2, ip
	strh r0, [r2]
	b _08293FB4
	.align 2, 0
_08293F74: .4byte gUnknown_3007620
_08293F78: .4byte 0x00008021
_08293F7C:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _08293FB4
	ldr r1, _08293FD0
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	strb r3, [r1, #3]
	ldr r0, [sp]
	str r0, [r1, #8]
	mov r2, r8
	subs r0, r2, r4
	strh r0, [r1, #4]
	mov r2, sb
	ldrb r0, [r2]
	mov r2, r8
	subs r0, r0, r2
	mov r2, sb
	strb r0, [r2]
	ldr r0, _08293FD4
	strh r0, [r1]
	mov r0, sl
	ldr r2, [r0]
	ldrb r1, [r2, #6]
	adds r0, r3, #0
	orrs r0, r1
	strb r0, [r2, #6]
_08293FB4:
	ldr r0, _08293FD8
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0]
	movs r0, #0
_08293FBE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08293FD0: .4byte gUnknown_3007610
_08293FD4: .4byte 0x00008024
_08293FD8: .4byte 0x04000208
	thumb_func_end rfu_STC_setSendData_org

	thumb_func_start rfu_changeSendTarget
rfu_changeSendTarget: @ 0x08293FDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	cmp r7, #3
	bls _08294000
	movs r0, #0x80
	lsls r0, r0, #3
	b _08294134
_08294000:
	cmp r0, #0x20
	bne _082940A0
	ldr r0, _08294090
	mov ip, r0
	lsls r0, r7, #2
	add r0, ip
	ldr r5, [r0]
	ldrh r2, [r5]
	ldr r1, _08294094
	adds r0, r1, #0
	ands r0, r2
	cmp r0, r1
	bne _082940B6
	ldrb r0, [r5, #0x1a]
	adds r3, r6, #0
	eors r3, r0
	adds r2, r3, #0
	ands r2, r6
	cmp r2, #0
	bne _082940EE
	cmp r3, #0
	bne _0829402E
	b _08294132
_0829402E:
	ldr r1, _08294098
	ldrh r0, [r1]
	mov r8, r0
	strh r2, [r1]
	movs r2, #0
	mvns r1, r3
	str r1, [sp]
	lsls r4, r6, #0x18
	mov sl, r4
	movs r0, #1
	mov sb, r0
	movs r1, #0
_08294046:
	adds r0, r3, #0
	asrs r0, r2
	mov r4, sb
	ands r0, r4
	cmp r0, #0
	beq _0829405A
	lsls r0, r2, #2
	add r0, ip
	ldr r0, [r0]
	strh r1, [r0, #2]
_0829405A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _08294046
	ldr r0, _0829409C
	ldr r1, [r0]
	ldrb r0, [r1, #4]
	ldr r2, [sp]
	ands r2, r0
	strb r2, [r1, #4]
	strb r6, [r5, #0x1a]
	mov r0, sl
	cmp r0, #0
	bne _08294086
	adds r0, r7, #0
	movs r1, #0
	adds r2, r5, #0
	bl rfu_STC_releaseFrame
	movs r0, #0x27
	strh r0, [r5]
_08294086:
	ldr r0, _08294098
	mov r1, r8
	strh r1, [r0]
	b _08294132
	.align 2, 0
_08294090: .4byte gUnknown_3007620
_08294094: .4byte 0x00008020
_08294098: .4byte 0x04000208
_0829409C: .4byte gUnknown_3007630
_082940A0:
	cmp r3, #0x10
	bne _0829412C
	ldr r3, _082940BC
	lsls r1, r7, #2
	adds r0, r1, r3
	ldr r0, [r0]
	ldrh r2, [r0]
	ldr r0, _082940C0
	adds r5, r3, #0
	cmp r2, r0
	beq _082940C8
_082940B6:
	ldr r0, _082940C4
	b _08294134
	.align 2, 0
_082940BC: .4byte gUnknown_3007610
_082940C0: .4byte 0x00008024
_082940C4: .4byte 0x00000403
_082940C8:
	movs r3, #0
	movs r2, #0
	adds r4, r5, #0
_082940CE:
	cmp r2, r7
	beq _082940DC
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	orrs r3, r0
_082940DC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _082940CE
	adds r2, r6, #0
	ands r2, r3
	cmp r2, #0
	beq _082940F8
_082940EE:
	ldr r0, _082940F4
	b _08294134
	.align 2, 0
_082940F4: .4byte 0x00000404
_082940F8:
	ldr r3, _08294124
	ldrh r0, [r3]
	mov r8, r0
	strh r2, [r3]
	ldr r4, _08294128
	ldr r2, [r4]
	adds r5, r1, r5
	ldr r0, [r5]
	ldrb r1, [r0, #3]
	ldrb r0, [r2, #6]
	bics r0, r1
	strb r0, [r2, #6]
	ldr r2, [r4]
	ldrb r1, [r2, #6]
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r2, #6]
	ldr r0, [r5]
	strb r6, [r0, #3]
	mov r2, r8
	strh r2, [r3]
	b _08294132
	.align 2, 0
_08294124: .4byte 0x04000208
_08294128: .4byte gUnknown_3007630
_0829412C:
	movs r0, #0xc0
	lsls r0, r0, #3
	b _08294134
_08294132:
	movs r0, #0
_08294134:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_changeSendTarget

	thumb_func_start rfu_NI_stopReceivingData
rfu_NI_stopReceivingData: @ 0x08294144
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08294154
	movs r0, #0x80
	lsls r0, r0, #3
	b _082941AE
_08294154:
	ldr r1, _08294180
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r5, r2, #0
	adds r5, #0x34
	ldr r1, _08294184
	ldrh r0, [r1]
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r1]
	ldrh r1, [r2, #0x34]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _082941A8
	ldr r0, _08294188
	cmp r1, r0
	bne _0829418C
	movs r0, #0x48
	b _0829418E
	.align 2, 0
_08294180: .4byte gUnknown_3007620
_08294184: .4byte 0x04000208
_08294188: .4byte 0x00008043
_0829418C:
	movs r0, #0x47
_0829418E:
	strh r0, [r2, #0x34]
	ldr r0, _082941B4
	ldr r2, [r0]
	movs r1, #1
	lsls r1, r3
	ldrb r0, [r2, #5]
	bics r0, r1
	strb r0, [r2, #5]
	adds r0, r3, #0
	movs r1, #1
	adds r2, r5, #0
	bl rfu_STC_releaseFrame
_082941A8:
	ldr r0, _082941B8
	strh r4, [r0]
	movs r0, #0
_082941AE:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_082941B4: .4byte gUnknown_3007630
_082941B8: .4byte 0x04000208
	thumb_func_end rfu_NI_stopReceivingData

	thumb_func_start rfu_UNI_changeAndReadySendData
rfu_UNI_changeAndReadySendData: @ 0x082941BC
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	cmp r0, #3
	bls _082941D4
	movs r0, #0x80
	lsls r0, r0, #3
	b _08294248
_082941D4:
	ldr r1, _082941E8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldrh r1, [r4]
	ldr r0, _082941EC
	cmp r1, r0
	beq _082941F4
	ldr r0, _082941F0
	b _08294248
	.align 2, 0
_082941E8: .4byte gUnknown_3007610
_082941EC: .4byte 0x00008024
_082941F0: .4byte 0x00000403
_082941F4:
	ldr r0, _08294208
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #1
	bne _0829420C
	adds r6, r1, #0
	adds r6, #0xf
	ldrb r0, [r4, #4]
	ldrb r1, [r1, #0xf]
	b _0829421A
	.align 2, 0
_08294208: .4byte gUnknown_3007630
_0829420C:
	adds r0, r3, #0
	adds r0, #0x10
	adds r6, r1, r0
	adds r1, #0x10
	adds r1, r1, r3
	ldrb r0, [r4, #4]
	ldrb r1, [r1]
_0829421A:
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r5
	blo _08294244
	ldr r2, _08294240
	ldrh r1, [r2]
	movs r0, #0
	strh r0, [r2]
	str r7, [r4, #8]
	subs r0, r3, r5
	strb r0, [r6]
	strh r5, [r4, #4]
	movs r0, #1
	strb r0, [r4, #2]
	strh r1, [r2]
	movs r0, #0
	b _08294248
	.align 2, 0
_08294240: .4byte 0x04000208
_08294244:
	movs r0, #0xa0
	lsls r0, r0, #3
_08294248:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end rfu_UNI_changeAndReadySendData

	thumb_func_start rfu_UNI_readySendData
rfu_UNI_readySendData: @ 0x08294250
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _0829426E
	ldr r1, _08294274
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldrh r1, [r2]
	ldr r0, _08294278
	cmp r1, r0
	bne _0829426E
	movs r0, #1
	strb r0, [r2, #2]
_0829426E:
	pop {r0}
	bx r0
	.align 2, 0
_08294274: .4byte gUnknown_3007610
_08294278: .4byte 0x00008024
	thumb_func_end rfu_UNI_readySendData

	thumb_func_start rfu_UNI_clearRecvNewDataFlag
rfu_UNI_clearRecvNewDataFlag: @ 0x0829427C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _08294292
	ldr r1, _08294298
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #0x12]
_08294292:
	pop {r0}
	bx r0
	.align 2, 0
_08294298: .4byte gUnknown_3007610
	thumb_func_end rfu_UNI_clearRecvNewDataFlag

	thumb_func_start rfu_REQ_sendData
rfu_REQ_sendData: @ 0x0829429C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _082942E8
	ldr r2, [r0]
	ldrb r1, [r2]
	adds r4, r0, #0
	cmp r1, #0xff
	bne _082942B0
	b _082943D6
_082942B0:
	cmp r1, #1
	bne _08294340
	ldrb r0, [r2, #4]
	ldrb r1, [r2, #5]
	adds r3, r0, #0
	orrs r3, r1
	ldrb r0, [r2, #6]
	orrs r3, r0
	cmp r3, #0
	bne _08294340
	ldr r0, _082942EC
	ldr r2, [r0]
	ldrb r1, [r2, #3]
	adds r4, r0, #0
	cmp r1, #0
	beq _082942D8
	movs r0, #0x10
	strb r0, [r2, #8]
	ldr r0, [r4]
	strb r3, [r0, #7]
_082942D8:
	ldr r1, [r4]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _082942F0
	subs r0, #1
	strb r0, [r1, #8]
	b _082942F6
	.align 2, 0
_082942E8: .4byte gUnknown_3007630
_082942EC: .4byte gUnknown_3007634
_082942F0:
	ldrb r0, [r1, #7]
	adds r0, #1
	strb r0, [r1, #7]
_082942F6:
	ldr r1, [r4]
	ldrb r0, [r1, #8]
	cmp r0, #0
	bne _08294308
	ldrb r1, [r1, #7]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0829439A
_08294308:
	ldr r4, _0829432C
	ldr r1, [r4]
	movs r0, #1
	str r0, [r1, #0x68]
	movs r0, #0xff
	str r0, [r1, #0x78]
	ldr r0, _08294330
	bl STWI_set_Callback_M
	cmp r5, #0
	bne _08294334
	ldr r0, [r4]
	adds r0, #0x68
	movs r1, #1
	bl STWI_send_DataTxREQ
	b _082943D6
	.align 2, 0
_0829432C: .4byte gUnknown_3007638
_08294330: .4byte sub_08294488
_08294334:
	ldr r0, [r4]
	adds r0, #0x68
	movs r1, #1
	bl STWI_send_DataTxAndChangeREQ
	b _082943D6
_08294340:
	ldr r0, [r4]
	ldrb r0, [r0, #0xe]
	cmp r0, #0
	bne _0829434C
	bl rfu_constructSendLLFrame
_0829434C:
	ldr r0, [r4]
	ldrb r0, [r0, #0xe]
	cmp r0, #0
	beq _0829439A
	ldr r0, _08294378
	bl STWI_set_Callback_M
	cmp r5, #0
	beq _08294384
	ldr r0, _0829437C
	ldr r0, [r0]
	adds r0, #0x68
	ldr r1, _08294380
	ldr r1, [r1]
	ldr r1, [r1, #0x24]
	adds r1, #4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl STWI_send_DataTxAndChangeREQ
	b _082943D6
	.align 2, 0
_08294378: .4byte rfu_CB_sendData
_0829437C: .4byte gUnknown_3007638
_08294380: .4byte gUnknown_3007634
_08294384:
	ldr r0, _082943BC
	ldr r0, [r0]
	adds r0, #0x68
	ldr r1, _082943C0
	ldr r1, [r1]
	ldr r1, [r1, #0x24]
	adds r1, #4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl STWI_send_DataTxREQ
_0829439A:
	cmp r5, #0
	beq _082943D6
	ldr r0, _082943C4
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _082943CC
	ldr r0, _082943C8
	ldr r0, [r0]
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _082943D6
	movs r0, #0x27
	bl _call_via_r1
	b _082943D6
	.align 2, 0
_082943BC: .4byte gUnknown_3007638
_082943C0: .4byte gUnknown_3007634
_082943C4: .4byte gUnknown_3007630
_082943C8: .4byte gUnknown_3007608
_082943CC:
	ldr r0, _082943DC
	bl STWI_set_Callback_M
	bl STWI_send_MS_ChangeREQ
_082943D6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_082943DC: .4byte rfu_CB_sendData2
	thumb_func_end rfu_REQ_sendData

	thumb_func_start rfu_CB_sendData
rfu_CB_sendData: @ 0x082943E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	cmp r7, #0
	bne _0829444A
	movs r6, #0
	ldr r0, _08294468
	mov r8, r0
_082943F4:
	ldr r0, _0829446C
	lsls r2, r6, #2
	adds r0, r2, r0
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08294406
	movs r0, #0
	strb r0, [r1, #2]
_08294406:
	ldr r0, _08294470
	adds r0, r2, r0
	ldr r4, [r0]
	ldrh r0, [r4]
	cmp r0, r8
	bne _08294440
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	bl rfu_STC_releaseFrame
	ldr r5, _08294474
	ldr r2, [r5]
	ldrb r1, [r4, #0x1a]
	ldrb r0, [r2, #4]
	bics r0, r1
	strb r0, [r2, #4]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	cmp r3, #1
	bne _0829443C
	ldr r1, [r5]
	lsls r3, r6
	ldrb r0, [r1, #7]
	orrs r3, r0
	strb r3, [r1, #7]
_0829443C:
	movs r0, #0x26
	strh r0, [r4]
_08294440:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _082943F4
_0829444A:
	ldr r0, _08294474
	ldr r1, [r0]
	ldrb r0, [r1, #0xe]
	movs r0, #0
	strb r0, [r1, #0xe]
	movs r0, #0x24
	adds r1, r7, #0
	bl rfu_STC_REQ_callback
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08294468: .4byte 0x00008020
_0829446C: .4byte gUnknown_3007610
_08294470: .4byte gUnknown_3007620
_08294474: .4byte gUnknown_3007630
	thumb_func_end rfu_CB_sendData

	thumb_func_start rfu_CB_sendData2
rfu_CB_sendData2: @ 0x08294478
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x24
	bl rfu_STC_REQ_callback
	pop {r0}
	bx r0
	thumb_func_end rfu_CB_sendData2

	thumb_func_start sub_08294488
sub_08294488: @ 0x08294488
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0829449E
	movs r0, #0x24
	bl rfu_STC_REQ_callback
	b _082944AA
_0829449E:
	cmp r0, #0xff
	bne _082944AA
	movs r0, #0xff
	movs r1, #0
	bl rfu_STC_REQ_callback
_082944AA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08294488

	thumb_func_start rfu_constructSendLLFrame
rfu_constructSendLLFrame: @ 0x082944B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0829455C
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _082944C8
	b _082945CC
_082944C8:
	ldrb r0, [r2, #4]
	ldrb r1, [r2, #5]
	orrs r0, r1
	ldrb r1, [r2, #6]
	orrs r0, r1
	cmp r0, #0
	beq _082945CC
	ldrb r0, [r2, #0xe]
	movs r0, #0
	strb r0, [r2, #0xe]
	mov r8, r0
	ldr r0, _08294560
	ldr r0, [r0]
	adds r0, #0x6c
	str r0, [sp]
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #8
	mov sb, r0
	ldr r1, _08294564
	mov sl, r1
_082944F2:
	movs r5, #0
	ldr r0, _08294568
	lsls r7, r6, #2
	adds r4, r7, r0
	ldr r2, [r4]
	ldrh r1, [r2]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _08294512
	adds r0, r6, #0
	mov r1, sp
	bl rfu_STC_NI_constructLLSF
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08294512:
	ldr r2, [r4]
	ldrh r1, [r2, #0x34]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _0829452E
	adds r2, #0x34
	adds r0, r6, #0
	mov r1, sp
	bl rfu_STC_NI_constructLLSF
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r5, r0
_0829452E:
	ldr r0, _0829456C
	adds r0, r7, r0
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, sl
	bne _08294548
	adds r0, r6, #0
	mov r1, sp
	bl rfu_STC_UNI_constructLLSF
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r5, r0
_08294548:
	cmp r5, #0
	beq _0829457C
	ldr r0, _0829455C
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _08294570
	add r8, r5
	b _0829457C
	.align 2, 0
_0829455C: .4byte gUnknown_3007630
_08294560: .4byte gUnknown_3007638
_08294564: .4byte 0x00008024
_08294568: .4byte gUnknown_3007620
_0829456C: .4byte gUnknown_3007610
_08294570:
	adds r0, r7, r6
	adds r0, #8
	lsls r5, r0
	mov r2, r8
	orrs r2, r5
	mov r8, r2
_0829457C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _082944F2
	ldr r6, _082945DC
	mov r0, r8
	cmp r0, #0
	beq _082945C6
	ldr r2, [sp]
	movs r0, #3
	ands r0, r2
	ldr r5, _082945E0
	ldr r1, _082945E4
	cmp r0, #0
	beq _082945AE
	movs r4, #0
	movs r3, #3
_082945A0:
	strb r4, [r2]
	adds r0, r2, #1
	str r0, [sp]
	adds r2, r0, #0
	ands r0, r3
	cmp r0, #0
	bne _082945A0
_082945AE:
	ldr r0, [r1]
	mov r2, r8
	str r2, [r0, #0x68]
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, #0
	bne _082945C6
	ldr r0, [sp]
	subs r0, #0x6c
	ldr r1, [r1]
	subs r0, r0, r1
	mov r8, r0
_082945C6:
	ldr r0, [r6]
	mov r1, r8
	str r1, [r0, #0x24]
_082945CC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_082945DC: .4byte gUnknown_3007634
_082945E0: .4byte gUnknown_3007630
_082945E4: .4byte gUnknown_3007638
	thumb_func_end rfu_constructSendLLFrame

	thumb_func_start rfu_STC_NI_constructLLSF
rfu_STC_NI_constructLLSF: @ 0x082945E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov ip, r1
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r2, _08294664
	ldr r0, [r2]
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08294668
	adds r0, r0, r1
	mov r8, r0
	ldrh r1, [r4]
	ldr r0, _0829466C
	cmp r1, r0
	bne _08294652
	adds r3, r4, #0
	adds r3, #0x20
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r5, r4, #4
	adds r1, r5, r1
	ldr r2, [r4, #0x28]
	ldr r0, [r4, #0x30]
	adds r2, r2, r0
	ldr r0, [r1]
	adds r6, r3, #0
	cmp r0, r2
	blo _08294652
	movs r7, #0
_08294630:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _08294640
	strb r7, [r6]
_08294640:
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r2, [r4, #0x28]
	ldr r0, [r4, #0x30]
	adds r2, r2, r0
	ldr r0, [r1]
	cmp r0, r2
	bhs _08294630
_08294652:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	mov sb, r1
	cmp r0, #0
	beq _08294670
	movs r5, #0
	b _082946B4
	.align 2, 0
_08294664: .4byte gUnknown_3007630
_08294668: .4byte gUnknown_890EEA4
_0829466C: .4byte 0x00008022
_08294670:
	ldr r0, _0829469C
	cmp sb, r0
	bne _082946A4
	adds r3, r4, #0
	adds r3, #0x20
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r1, r4, #4
	adds r1, r1, r0
	ldrh r7, [r4, #0x2e]
	ldr r5, [r1]
	adds r2, r5, r7
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x30]
	adds r0, r1, r0
	adds r6, r3, #0
	cmp r2, r0
	bls _082946A0
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _082946B8
	.align 2, 0
_0829469C: .4byte 0x00008022
_082946A0:
	adds r5, r7, #0
	b _082946B8
_082946A4:
	ldrh r2, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	cmp r0, r2
	blo _082946B0
	adds r5, r2, #0
	b _082946B4
_082946B0:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_082946B4:
	adds r6, r4, #0
	adds r6, #0x20
_082946B8:
	movs r3, #0xf
	mov r0, sb
	ands r3, r0
	mov r1, r8
	ldrb r1, [r1, #3]
	lsls r3, r1
	ldrb r0, [r4, #0x1f]
	mov r2, r8
	ldrb r2, [r2, #4]
	lsls r0, r2
	orrs r3, r0
	ldrb r1, [r6]
	adds r0, r1, #0
	mov r7, r8
	ldrb r7, [r7, #5]
	lsls r0, r7
	orrs r3, r0
	adds r0, r4, #0
	adds r0, #0x21
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, r8
	ldrb r1, [r1, #6]
	lsls r0, r1
	orrs r3, r0
	orrs r3, r5
	str r3, [sp]
	ldr r2, _08294774
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, #1
	bne _08294700
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #0x12
	orrs r3, r0
	str r3, [sp]
_08294700:
	mov r2, sp
	movs r3, #0
	mov r7, r8
	ldrb r7, [r7]
	cmp r3, r7
	bhs _0829472A
_0829470C:
	mov r0, ip
	ldr r1, [r0]
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	mov r7, ip
	str r1, [r7]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r0, r8
	ldrb r0, [r0]
	cmp r3, r0
	blo _0829470C
_0829472A:
	cmp r5, #0
	beq _0829474A
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r0, r4, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, _08294778
	ldr r1, [r0]
	add r0, sp, #4
	ldr r3, [r1, #4]
	mov r1, ip
	adds r2, r5, #0
	bl _call_via_r3
_0829474A:
	ldrh r1, [r4]
	ldr r0, _0829477C
	cmp r1, r0
	bne _08294764
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _08294764
	movs r0, #0
	strb r0, [r6]
_08294764:
	ldr r0, _08294774
	ldr r2, [r0]
	ldrb r1, [r2]
	cmp r1, #1
	bne _08294780
	ldrb r0, [r2, #0xe]
	strb r1, [r2, #0xe]
	b _0829478E
	.align 2, 0
_08294774: .4byte gUnknown_3007630
_08294778: .4byte gUnknown_3007638
_0829477C: .4byte 0x00008022
_08294780:
	movs r0, #1
	mov r1, sl
	lsls r0, r1
	ldrb r1, [r2, #0xe]
	orrs r0, r1
	ldrb r1, [r2, #0xe]
	strb r0, [r2, #0xe]
_0829478E:
	mov r2, r8
	ldrb r0, [r2]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_STC_NI_constructLLSF

	thumb_func_start rfu_STC_UNI_constructLLSF
rfu_STC_UNI_constructLLSF: @ 0x082947A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _082947D0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _082947CC
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _082947D4
_082947CC:
	movs r0, #0
	b _08294870
	.align 2, 0
_082947D0: .4byte gUnknown_3007610
_082947D4:
	ldr r0, _0829484C
	ldr r2, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #4
	ldr r1, _08294850
	adds r5, r0, r1
	ldrh r0, [r4]
	movs r1, #0xf
	ands r1, r0
	ldrb r0, [r5, #3]
	lsls r1, r0
	ldrh r0, [r4, #4]
	orrs r1, r0
	str r1, [sp]
	ldrb r0, [r2]
	cmp r0, #1
	bne _082947FE
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x12
	orrs r1, r0
	str r1, [sp]
_082947FE:
	mov r2, sp
	movs r3, #0
	ldr r1, _08294854
	mov ip, r1
	add r7, sp, #4
	ldrb r0, [r5]
	cmp r3, r0
	bhs _08294826
_0829480E:
	ldr r1, [r6]
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	str r1, [r6]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r1, [r5]
	cmp r3, r1
	blo _0829480E
_08294826:
	ldr r0, [r4, #8]
	str r0, [sp, #4]
	mov r2, ip
	ldr r0, [r2]
	ldrh r2, [r4, #4]
	ldr r3, [r0, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	bl _call_via_r3
	ldr r0, _0829484C
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, #1
	bne _08294858
	ldrb r0, [r2, #0xe]
	movs r0, #0x10
	b _08294864
	.align 2, 0
_0829484C: .4byte gUnknown_3007630
_08294850: .4byte gUnknown_890EEA4
_08294854: .4byte gUnknown_3007638
_08294858:
	movs r0, #0x10
	mov r1, r8
	lsls r0, r1
	ldrb r1, [r2, #0xe]
	orrs r0, r1
	ldrb r1, [r2, #0xe]
_08294864:
	strb r0, [r2, #0xe]
	ldrh r0, [r4, #4]
	ldrb r5, [r5]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08294870:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_STC_UNI_constructLLSF

	thumb_func_start rfu_REQ_recvData
rfu_REQ_recvData: @ 0x0829487C
	push {r4, lr}
	ldr r0, _082948B0
	ldr r4, [r0]
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _082948A8
	ldr r2, _082948B4
	ldr r3, [r2]
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #5]
	orrs r0, r1
	ldrb r1, [r4, #6]
	orrs r0, r1
	movs r1, #0
	strb r0, [r3, #3]
	ldr r0, [r2]
	strb r1, [r0, #4]
	ldr r0, _082948B8
	bl STWI_set_Callback_M
	bl STWI_send_DataRxREQ
_082948A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_082948B0: .4byte gUnknown_3007630
_082948B4: .4byte gUnknown_3007634
_082948B8: .4byte rfu_CB_recvData
	thumb_func_end rfu_REQ_recvData

	thumb_func_start rfu_CB_recvData
rfu_CB_recvData: @ 0x082948BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	cmp r7, #0
	bne _08294980
	ldr r0, _082948F8
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _08294980
	ldr r0, _082948FC
	ldr r0, [r0]
	strb r7, [r0, #1]
	ldr r0, _08294900
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _08294904
	bl rfu_STC_PARENT_analyzeRecvPacket
	b _08294908
	.align 2, 0
_082948F8: .4byte gUnknown_3007638
_082948FC: .4byte gUnknown_3007634
_08294900: .4byte gUnknown_3007630
_08294904:
	bl rfu_STC_CHILD_analyzeRecvPacket
_08294908:
	movs r6, #0
	ldr r0, _08294998
	mov r8, r0
	ldr r3, _0829499C
_08294910:
	ldr r0, _082949A0
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r4, [r1]
	ldrh r0, [r4, #0x34]
	cmp r0, r8
	bne _08294962
	ldr r0, _082949A4
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08294962
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r2, [r0]
	cmp r2, #1
	bne _08294946
	ldr r1, [r3]
	lsls r2, r6
	ldrb r0, [r1, #7]
	orrs r2, r0
	strb r2, [r1, #7]
_08294946:
	adds r0, r6, #0
	movs r1, #1
	adds r2, r5, #0
	str r3, [sp]
	bl rfu_STC_releaseFrame
	ldr r3, [sp]
	ldr r2, [r3]
	ldrb r1, [r5, #0x1a]
	ldrb r0, [r2, #5]
	bics r0, r1
	strb r0, [r2, #5]
	movs r0, #0x46
	strh r0, [r4, #0x34]
_08294962:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _08294910
	ldr r0, _082949A4
	ldr r1, [r0]
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _08294980
	adds r7, r0, #0
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r7, r0
_08294980:
	mov r0, sb
	adds r1, r7, #0
	bl rfu_STC_REQ_callback
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08294998: .4byte 0x00008043
_0829499C: .4byte gUnknown_3007630
_082949A0: .4byte gUnknown_3007620
_082949A4: .4byte gUnknown_3007634
	thumb_func_end rfu_CB_recvData

	thumb_func_start rfu_STC_PARENT_analyzeRecvPacket
rfu_STC_PARENT_analyzeRecvPacket: @ 0x082949A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _08294A38
	ldr r0, [r1]
	adds r0, #0xdc
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsrs r3, r0, #8
	movs r5, #0
	mov ip, r1
	movs r7, #0x1f
	ldr r4, _08294A3C
	movs r6, #1
_082949C2:
	mov r0, sp
	adds r1, r0, r5
	adds r0, r3, #0
	ands r0, r7
	strb r0, [r1]
	lsrs r3, r3, #5
	cmp r0, #0
	bne _082949DE
	ldr r0, [r4]
	adds r1, r6, #0
	lsls r1, r5
	ldrb r2, [r0, #1]
	orrs r1, r2
	strb r1, [r0, #1]
_082949DE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _082949C2
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xdc
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #8
	movs r5, #0
_082949F6:
	mov r0, sp
	adds r1, r0, r5
	ldrb r0, [r1]
	adds r7, r5, #1
	cmp r0, #0
	beq _08294A28
	adds r4, r1, #0
_08294A04:
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl rfu_STC_analyzeLLSF
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r6, r0
	ldrb r1, [r4]
	subs r1, r1, r0
	strb r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08294A28
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _08294A04
_08294A28:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _082949F6
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08294A38: .4byte gUnknown_3007638
_08294A3C: .4byte gUnknown_3007634
	thumb_func_end rfu_STC_PARENT_analyzeRecvPacket

	thumb_func_start rfu_STC_CHILD_analyzeRecvPacket
rfu_STC_CHILD_analyzeRecvPacket: @ 0x08294A40
	push {r4, r5, r6, lr}
	ldr r0, _08294A90
	ldr r0, [r0]
	adds r0, #0xdc
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	movs r4, #0x7f
	ands r4, r0
	adds r5, r1, #0
	adds r5, #8
	cmp r4, #0
	bne _08294A60
	ldr r0, _08294A94
	ldr r1, [r0]
	movs r0, #0xf
	strb r0, [r1, #1]
_08294A60:
	movs r0, #0x80
	lsls r0, r0, #8
	adds r6, r0, #0
_08294A66:
	cmp r4, #0
	beq _08294A88
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl rfu_STC_analyzeLLSF
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r5, r0
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	ands r0, r6
	cmp r0, #0
	beq _08294A66
_08294A88:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08294A90: .4byte gUnknown_3007638
_08294A94: .4byte gUnknown_3007634
	thumb_func_end rfu_STC_CHILD_analyzeRecvPacket

	thumb_func_start rfu_STC_analyzeLLSF
rfu_STC_analyzeLLSF: @ 0x08294A98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	ldr r2, _08294ACC
	ldr r0, [r2]
	ldrb r0, [r0]
	mvns r0, r0
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #4
	ldr r1, _08294AD0
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r3, r0
	bhs _08294AD4
	adds r0, r3, #0
	b _08294CC6
	.align 2, 0
_08294ACC: .4byte gUnknown_3007630
_08294AD0: .4byte gUnknown_890EEA4
_08294AD4:
	movs r5, #0
	movs r4, #0
	ldrb r3, [r6, #1]
	ldrb r1, [r6, #7]
	mov r8, r1
	ldr r2, [sp]
	mov sb, r2
	cmp r4, r0
	bhs _08294AFC
	adds r2, r0, #0
_08294AE8:
	ldrb r0, [r7]
	lsls r1, r4, #3
	lsls r0, r1
	orrs r5, r0
	adds r7, #1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r2
	blo _08294AE8
_08294AFC:
	adds r0, r5, #0
	lsrs r0, r3
	mov r3, r8
	ands r0, r3
	ldr r1, _08294BD4
	mov sl, r1
	mov r3, sl
	mov r2, sb
	ands r3, r2
	orrs r3, r0
	str r3, [sp]
	adds r0, r5, #0
	ldrb r1, [r6, #2]
	lsrs r0, r1
	ldrb r1, [r6, #8]
	ands r0, r1
	lsls r0, r0, #8
	ldr r4, _08294BD8
	adds r2, r4, #0
	ands r2, r3
	orrs r2, r0
	str r2, [sp]
	adds r0, r5, #0
	ldrb r3, [r6, #3]
	lsrs r0, r3
	ldrb r1, [r6, #9]
	ands r0, r1
	lsls r0, r0, #0x10
	ldr r3, _08294BDC
	ands r3, r2
	orrs r3, r0
	str r3, [sp]
	adds r0, r5, #0
	ldrb r1, [r6, #4]
	lsrs r0, r1
	ldrb r1, [r6, #0xa]
	ands r0, r1
	lsls r0, r0, #0x18
	ldr r2, _08294BE0
	mov r8, r2
	mov r1, r8
	ands r1, r3
	orrs r1, r0
	mov r8, r1
	str r1, [sp]
	adds r1, r5, #0
	ldrb r2, [r6, #5]
	lsrs r1, r2
	ldrb r0, [r6, #0xb]
	ands r1, r0
	mov sb, sp
	ldr r2, [sp, #4]
	mov r3, sl
	ands r2, r3
	orrs r2, r1
	str r2, [sp, #4]
	adds r0, r5, #0
	ldrb r1, [r6, #6]
	lsrs r0, r1
	ldrb r1, [r6, #0xc]
	ands r0, r1
	lsls r0, r0, #8
	ands r4, r2
	orrs r4, r0
	str r4, [sp, #4]
	ldrh r0, [r6, #0xe]
	ands r5, r0
	lsls r1, r5, #0x10
	ldr r0, _08294BE4
	ands r0, r4
	orrs r0, r1
	str r0, [sp, #4]
	lsrs r0, r0, #0x10
	ldrb r6, [r6]
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _08294BA2
	b _08294CC4
_08294BA2:
	ldr r2, _08294BE8
	ldr r3, [r2]
	ldrb r2, [r3]
	cmp r2, #1
	bne _08294C60
	ldrb r0, [r3, #2]
	mov r5, ip
	asrs r0, r5
	ands r0, r2
	cmp r0, #0
	bne _08294BBA
	b _08294CC4
_08294BBA:
	mov r1, r8
	lsrs r0, r1, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _08294BEC
	mov r0, ip
	mov r1, sp
	adds r2, r7, #0
	bl rfu_STC_UNI_receive
	b _08294CC4
	.align 2, 0
_08294BD4: .4byte 0xFFFFFF00
_08294BD8: .4byte 0xFFFF00FF
_08294BDC: .4byte 0xFF00FFFF
_08294BE0: .4byte 0x00FFFFFF
_08294BE4: .4byte 0x0000FFFF
_08294BE8: .4byte gUnknown_3007630
_08294BEC:
	mov r5, sb
	ldrb r0, [r5, #3]
	cmp r0, #0
	bne _08294C00
	mov r0, ip
	mov r1, sp
	adds r2, r7, #0
	bl rfu_STC_NI_receive_Receiver
	b _08294CC4
_08294C00:
	movs r4, #0
	ldr r1, _08294C18
	ldr r0, [r1]
	ldrb r0, [r0, #0x1a]
	mov r5, ip
	asrs r0, r5
	ands r0, r2
	cmp r0, #0
	beq _08294C1C
	ldrb r0, [r3, #4]
	b _08294C42
	.align 2, 0
_08294C18: .4byte gUnknown_3007620
_08294C1C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bhi _08294CC4
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	mov r2, ip
	asrs r0, r2
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	beq _08294C1C
	ldr r3, _08294C5C
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	mov r5, ip
_08294C42:
	asrs r0, r5
	ands r0, r2
	cmp r0, #0
	beq _08294C1C
	cmp r4, #3
	bhi _08294CC4
	adds r0, r4, #0
	mov r1, ip
	mov r2, sp
	adds r3, r7, #0
	bl rfu_STC_NI_receive_Sender
	b _08294CC4
	.align 2, 0
_08294C5C: .4byte gUnknown_3007630
_08294C60:
	ldrb r1, [r3, #2]
	mov r2, sb
	ldrb r0, [r2, #1]
	adds r5, r1, #0
	ands r5, r0
	cmp r5, #0
	beq _08294CC4
	movs r4, #0
	movs r6, #1
_08294C72:
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _08294CBA
	mov r1, sp
	ldrb r0, [r1, #2]
	cmp r0, #4
	bne _08294C8E
	adds r0, r4, #0
	adds r2, r7, #0
	bl rfu_STC_UNI_receive
	b _08294CBA
_08294C8E:
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08294CA0
	adds r0, r4, #0
	mov r1, sp
	adds r2, r7, #0
	bl rfu_STC_NI_receive_Receiver
	b _08294CBA
_08294CA0:
	ldr r0, _08294CD8
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _08294CBA
	adds r0, r4, #0
	adds r1, r4, #0
	mov r2, sp
	adds r3, r7, #0
	bl rfu_STC_NI_receive_Sender
_08294CBA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08294C72
_08294CC4:
	mov r0, sl
_08294CC6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08294CD8: .4byte gUnknown_3007630
	thumb_func_end rfu_STC_analyzeLLSF

	thumb_func_start rfu_STC_UNI_receive
rfu_STC_UNI_receive: @ 0x08294CDC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r1, #0
	str r2, [sp]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _08294D10
	lsls r1, r7, #2
	adds r1, r1, r2
	ldr r3, [r1]
	adds r5, r3, #0
	adds r5, #0xc
	movs r4, #0
	movs r0, #0
	strh r0, [r5, #2]
	ldr r0, [r1]
	ldr r0, [r0, #0x18]
	adds r1, r2, #0
	ldrh r2, [r6, #6]
	cmp r0, r2
	bhs _08294D18
	movs r0, #0x49
	strh r0, [r3, #0xc]
	ldr r0, _08294D14
	strh r0, [r5, #2]
	b _08294D66
	.align 2, 0
_08294D10: .4byte gUnknown_3007610
_08294D14: .4byte 0x00000701
_08294D18:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _08294D30
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _08294D3C
	ldr r0, _08294D2C
	strh r0, [r5, #2]
	b _08294D66
	.align 2, 0
_08294D2C: .4byte 0x00000709
_08294D30:
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _08294D3C
	movs r0, #0xe1
	lsls r0, r0, #3
	strh r0, [r5, #2]
_08294D3C:
	movs r4, #0
	ldr r0, _08294D84
	strh r0, [r5]
	ldrh r0, [r6, #6]
	strh r0, [r5, #4]
	ldrh r2, [r6, #6]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	str r0, [sp, #4]
	ldr r0, _08294D88
	ldr r0, [r0]
	add r1, sp, #4
	ldr r3, [r0, #4]
	mov r0, sp
	bl _call_via_r3
	movs r0, #1
	strb r0, [r5, #6]
	strh r4, [r5]
_08294D66:
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _08294D7A
	ldr r0, _08294D8C
	ldr r2, [r0]
	movs r0, #0x10
	lsls r0, r7
	ldrb r1, [r2, #4]
	orrs r0, r1
	strb r0, [r2, #4]
_08294D7A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08294D84: .4byte 0x00008042
_08294D88: .4byte gUnknown_3007638
_08294D8C: .4byte gUnknown_3007634
	thumb_func_end rfu_STC_UNI_receive

	thumb_func_start rfu_STC_NI_receive_Sender
rfu_STC_NI_receive_Sender: @ 0x08294D90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r2, #0
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	ldr r1, _08294E5C
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	mov ip, r0
	ldrh r0, [r0]
	mov sb, r0
	mov r0, ip
	adds r0, #0x21
	ldrb r2, [r6, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	str r0, [sp]
	ldrb r2, [r6, #2]
	cmp r2, #2
	bne _08294DCC
	ldr r0, _08294E60
	cmp sb, r0
	beq _08294DE6
_08294DCC:
	cmp r2, #1
	bne _08294DD6
	ldr r0, _08294E64
	cmp sb, r0
	beq _08294DE6
_08294DD6:
	movs r3, #0x1b
	add r3, ip
	mov r8, r3
	cmp r2, #3
	bne _08294E0A
	ldr r0, _08294E68
	cmp sb, r0
	bne _08294E0A
_08294DE6:
	ldrb r1, [r6, #4]
	mov r0, ip
	adds r0, #0x21
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r7, #0x1b
	add r7, ip
	mov r8, r7
	ldrb r2, [r6, #5]
	cmp r0, r2
	bne _08294E0A
	adds r0, r7, r1
	movs r1, #1
	mov r3, sl
	lsls r1, r3
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_08294E0A:
	ldrb r2, [r6, #4]
	mov r7, r8
	adds r0, r7, r2
	ldrb r0, [r0]
	mov r3, ip
	ldrb r1, [r3, #0x1a]
	ands r0, r1
	cmp r0, r1
	bne _08294F06
	adds r3, #0x21
	adds r2, r3, r2
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	movs r1, #0
	strb r0, [r2]
	ldrb r0, [r6, #4]
	add r0, r8
	strb r1, [r0]
	mov r7, ip
	ldrh r1, [r7]
	ldr r2, _08294E6C
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r3, #0
	cmp r0, #1
	bhi _08294EF8
	ldr r0, _08294E64
	cmp r1, r0
	bne _08294E70
	ldrb r1, [r6, #4]
	lsls r1, r1, #2
	subs r3, #0x1d
	adds r1, r3, r1
	ldrh r2, [r7, #0x2e]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	b _08294E86
	.align 2, 0
_08294E5C: .4byte gUnknown_3007620
_08294E60: .4byte 0x00008022
_08294E64: .4byte 0x00008021
_08294E68: .4byte 0x00008023
_08294E6C: .4byte 0x00007FDF
_08294E70:
	ldrb r2, [r6, #4]
	lsls r2, r2, #2
	mov r3, ip
	adds r3, #4
	adds r2, r3, r2
	mov r7, ip
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08294E86:
	mov r0, ip
	ldrh r1, [r0, #0x2e]
	ldr r0, [r0, #0x14]
	subs r0, r0, r1
	mov r1, ip
	str r0, [r1, #0x14]
	cmp r0, #0
	beq _08294E9A
	cmp r0, #0
	bge _08294F06
_08294E9A:
	mov r0, ip
	adds r0, #0x20
	movs r2, #0
	strb r2, [r0]
	mov r7, ip
	ldrh r1, [r7]
	ldr r0, _08294EDC
	cmp r1, r0
	bne _08294EE4
	movs r4, #0
_08294EAE:
	adds r0, r5, r4
	movs r1, #1
	strb r1, [r0]
	lsls r1, r4, #2
	adds r1, r3, r1
	mov r2, ip
	ldrh r0, [r2, #0x2e]
	adds r2, r0, #0
	muls r2, r4, r2
	mov r7, ip
	ldr r0, [r7, #0x28]
	adds r0, r0, r2
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08294EAE
	ldr r0, [r7, #0x30]
	str r0, [r7, #0x14]
	ldr r0, _08294EE0
	strh r0, [r7]
	b _08294F06
	.align 2, 0
_08294EDC: .4byte 0x00008021
_08294EE0: .4byte 0x00008022
_08294EE4:
	strb r2, [r5]
	mov r0, ip
	str r2, [r0, #0x14]
	ldr r0, _08294EF4
	mov r1, ip
	strh r0, [r1]
	b _08294F06
	.align 2, 0
_08294EF4: .4byte 0x00008023
_08294EF8:
	lsls r1, r1, #0x10
	ldr r0, _08294F68
	cmp r1, r0
	bne _08294F06
	ldr r0, _08294F6C
	mov r2, ip
	strh r0, [r2]
_08294F06:
	mov r3, ip
	ldrh r0, [r3]
	cmp r0, sb
	bne _08294F30
	ldrb r2, [r6, #4]
	mov r0, ip
	adds r0, #0x21
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r7, [sp]
	cmp r0, r7
	bne _08294F30
	mov r1, r8
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r2, sl
	asrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08294F56
_08294F30:
	ldr r4, _08294F70
	ldrh r2, [r4]
	movs r0, #0
	strh r0, [r4]
	ldr r0, _08294F74
	ldr r3, [r0]
	movs r0, #0x10
	mov r7, sl
	lsls r0, r7
	ldrb r1, [r3, #2]
	orrs r0, r1
	movs r1, #0
	strb r0, [r3, #2]
	lsls r0, r7, #2
	ldr r3, _08294F78
	adds r0, r0, r3
	ldr r0, [r0]
	strh r1, [r0, #2]
	strh r2, [r4]
_08294F56:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08294F68: .4byte 0x80230000
_08294F6C: .4byte 0x00008020
_08294F70: .4byte 0x04000208
_08294F74: .4byte gUnknown_3007634
_08294F78: .4byte gUnknown_3007620
	thumb_func_end rfu_STC_NI_receive_Sender

	thumb_func_start rfu_STC_NI_receive_Receiver
rfu_STC_NI_receive_Receiver: @ 0x08294F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r1, #0
	str r2, [sp]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r7, #0
	ldr r1, _08294FDC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x34
	ldrh r0, [r4, #0x34]
	mov sb, r0
	ldrb r0, [r6, #4]
	adds r3, r4, #0
	adds r3, #0x55
	adds r0, r3, r0
	ldrb r0, [r0]
	mov sl, r0
	ldrb r0, [r6, #2]
	cmp r0, #3
	bne _08294FEC
	ldr r0, _08294FE0
	ldr r2, [r0]
	movs r0, #1
	mov r1, r8
	lsls r0, r1
	ldrb r1, [r2, #1]
	orrs r0, r1
	strb r0, [r2, #1]
	ldrh r1, [r4, #0x34]
	ldr r0, _08294FE4
	cmp r1, r0
	bne _08295032
	adds r0, r4, #0
	adds r0, #0x54
	strb r7, [r0]
	strb r7, [r3]
	ldr r0, _08294FE8
	strh r0, [r4, #0x34]
	b _08295032
	.align 2, 0
_08294FDC: .4byte gUnknown_3007620
_08294FE0: .4byte gUnknown_3007634
_08294FE4: .4byte 0x00008042
_08294FE8: .4byte 0x00008043
_08294FEC:
	cmp r0, #2
	bne _08295018
	ldr r0, _08295010
	cmp sb, r0
	bne _08295004
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _08295004
	mov r0, r8
	adds r1, r5, #0
	bl rfu_STC_NI_initSlot_asRecvDataEntity
_08295004:
	ldrh r1, [r5]
	ldr r0, _08295014
	cmp r1, r0
	bne _08295032
	b _08295036
	.align 2, 0
_08295010: .4byte 0x00008041
_08295014: .4byte 0x00008042
_08295018:
	cmp r0, #1
	bne _08295032
	ldr r7, _082950E4
	cmp sb, r7
	beq _08295036
	mov r0, r8
	adds r1, r5, #0
	bl rfu_STC_NI_initSlot_asRecvControllData
	ldrh r0, [r4, #0x34]
	cmp r0, r7
	bne _082950D2
	movs r7, #1
_08295032:
	cmp r7, #0
	beq _0829508C
_08295036:
	ldrb r2, [r6, #5]
	ldrb r3, [r6, #4]
	adds r4, r5, #0
	adds r4, #0x21
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	cmp r2, r0
	bne _0829508C
	ldr r0, _082950E8
	ldr r0, [r0]
	lsls r1, r3, #2
	adds r1, #4
	adds r1, r5, r1
	ldrh r2, [r6, #6]
	ldr r3, [r0, #4]
	mov r0, sp
	bl _call_via_r3
	ldrh r1, [r5]
	ldr r0, _082950EC
	cmp r1, r0
	bne _0829507C
	ldrb r0, [r6, #4]
	lsls r0, r0, #2
	adds r2, r5, #4
	adds r2, r2, r0
	ldrh r0, [r5, #0x2e]
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_0829507C:
	ldrh r1, [r6, #6]
	ldr r0, [r5, #0x14]
	subs r0, r0, r1
	str r0, [r5, #0x14]
	ldrb r0, [r6, #4]
	adds r0, r4, r0
	ldrb r1, [r6, #5]
	strb r1, [r0]
_0829508C:
	ldrh r0, [r5, #0x18]
	cmp r0, #0
	bne _082950D2
	ldrb r0, [r6, #4]
	adds r1, r5, #0
	adds r1, #0x20
	strb r0, [r1]
	ldrh r0, [r5]
	cmp r0, sb
	bne _082950B4
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r2, [r6, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, sl
	bne _082950B4
	ldrb r6, [r6, #5]
	cmp r0, r6
	bne _082950D2
_082950B4:
	ldr r3, _082950F0
	ldrh r2, [r3]
	movs r0, #0
	strh r0, [r3]
	ldr r0, _082950F4
	ldr r4, [r0]
	movs r0, #1
	mov r1, r8
	lsls r0, r1
	ldrb r1, [r4, #2]
	orrs r0, r1
	movs r1, #0
	strb r0, [r4, #2]
	strh r1, [r5, #2]
	strh r2, [r3]
_082950D2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_082950E4: .4byte 0x00008041
_082950E8: .4byte gUnknown_3007638
_082950EC: .4byte 0x00008042
_082950F0: .4byte 0x04000208
_082950F4: .4byte gUnknown_3007634
	thumb_func_end rfu_STC_NI_receive_Receiver

	thumb_func_start rfu_STC_NI_initSlot_asRecvControllData
rfu_STC_NI_initSlot_asRecvControllData: @ 0x082950F8
	push {r4, r5, r6, r7, lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08295114
	ldr r3, [r0]
	ldrb r1, [r3]
	mov ip, r0
	cmp r1, #1
	bne _08295118
	movs r5, #3
	adds r1, r3, #0
	adds r1, #0xf
	b _08295120
	.align 2, 0
_08295114: .4byte gUnknown_3007630
_08295118:
	movs r5, #2
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r3, r0
_08295120:
	movs r7, #1
	adds r0, r7, #0
	lsls r0, r4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r4, r6, #0
	ldrh r3, [r2]
	cmp r3, #0
	bne _0829517E
	ldrb r0, [r1]
	cmp r0, r5
	bhs _08295158
	movs r0, #0x49
	strh r0, [r2]
	ldr r0, _08295150
	strh r0, [r2, #0x18]
	ldr r0, _08295154
	ldr r2, [r0]
	ldrb r1, [r2, #4]
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r2, #4]
	b _0829517E
	.align 2, 0
_08295150: .4byte 0x00000702
_08295154: .4byte gUnknown_3007634
_08295158:
	strh r3, [r2, #0x18]
	ldrb r0, [r1]
	subs r0, r0, r5
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2d
	str r0, [r2, #4]
	movs r0, #7
	str r0, [r2, #0x14]
	strb r7, [r2, #0x1f]
	strh r3, [r2, #0x2e]
	strb r4, [r2, #0x1a]
	ldr r0, _08295184
	strh r0, [r2]
	mov r0, ip
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	orrs r4, r0
	strb r4, [r1, #5]
_0829517E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08295184: .4byte 0x00008041
	thumb_func_end rfu_STC_NI_initSlot_asRecvControllData

	thumb_func_start rfu_STC_NI_initSlot_asRecvDataEntity
rfu_STC_NI_initSlot_asRecvDataEntity: @ 0x08295188
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #1
	bne _082951AC
	ldr r0, _082951A8
	lsls r1, r5, #5
	adds r1, #0x14
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #4
	b _08295202
	.align 2, 0
_082951A8: .4byte gUnknown_3007630
_082951AC:
	ldr r1, _082951F0
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, [r4, #0x30]
	ldr r0, [r2, #0x6c]
	cmp r1, r0
	bls _08295200
	movs r1, #0x80
	lsls r1, r1, #0x11
	lsls r1, r5
	lsrs r1, r1, #0x18
	ldr r0, _082951F4
	ldr r3, [r0]
	ldrb r2, [r3, #4]
	adds r0, r1, #0
	orrs r0, r2
	strb r0, [r3, #4]
	ldr r0, _082951F8
	ldr r2, [r0]
	ldrb r0, [r2, #5]
	bics r0, r1
	strb r0, [r2, #5]
	ldr r0, _082951FC
	strh r0, [r4, #0x18]
	movs r0, #0x47
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl rfu_STC_releaseFrame
	b _08295234
	.align 2, 0
_082951F0: .4byte gUnknown_3007620
_082951F4: .4byte gUnknown_3007634
_082951F8: .4byte gUnknown_3007630
_082951FC: .4byte 0x00000701
_08295200:
	ldr r0, [r2, #0x68]
_08295202:
	str r0, [r4, #4]
	movs r3, #0
	adds r6, r4, #0
	adds r6, #0x21
	movs r7, #0
	adds r5, r4, #4
_0829520E:
	adds r0, r6, r3
	strb r7, [r0]
	lsls r1, r3, #2
	adds r1, r5, r1
	ldrh r0, [r4, #0x2e]
	adds r2, r0, #0
	muls r2, r3, r2
	ldr r0, [r4, #4]
	adds r0, r0, r2
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0829520E
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x14]
	ldr r0, _0829523C
	strh r0, [r4]
_08295234:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0829523C: .4byte 0x00008042
	thumb_func_end rfu_STC_NI_initSlot_asRecvDataEntity

	thumb_func_start rfu_NI_checkCommFailCounter
rfu_NI_checkCommFailCounter: @ 0x08295240
	push {r4, r5, r6, r7, lr}
	ldr r2, _082952CC
	ldr r0, [r2]
	ldrb r1, [r0, #4]
	ldrb r0, [r0, #5]
	orrs r0, r1
	cmp r0, #0
	beq _082952C6
	ldr r1, _082952D0
	ldrh r0, [r1]
	mov ip, r0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _082952D4
	ldr r0, [r1]
	ldrb r0, [r0, #2]
	lsrs r7, r0, #4
	movs r3, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r4, _082952D8
_0829526A:
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r3
	lsrs r2, r0, #0x18
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	ands r0, r2
	cmp r0, #0
	beq _08295292
	ldr r0, [r6]
	ldrb r0, [r0, #2]
	ands r0, r2
	cmp r0, #0
	bne _08295292
	lsls r0, r3, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
_08295292:
	ldr r0, [r5]
	ldrb r0, [r0, #5]
	ands r0, r2
	cmp r0, #0
	beq _082952B0
	adds r0, r7, #0
	ands r0, r2
	cmp r0, #0
	bne _082952B0
	lsls r0, r3, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_082952B0:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0829526A
	ldr r0, [r6]
	movs r1, #0
	strb r1, [r0, #2]
	ldr r0, _082952D0
	mov r1, ip
	strh r1, [r0]
_082952C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_082952CC: .4byte gUnknown_3007630
_082952D0: .4byte 0x04000208
_082952D4: .4byte gUnknown_3007634
_082952D8: .4byte gUnknown_3007620
	thumb_func_end rfu_NI_checkCommFailCounter

	thumb_func_start rfu_REQ_noise
rfu_REQ_noise: @ 0x082952DC
	push {lr}
	ldr r0, _082952F0
	bl STWI_set_Callback_M
	movs r0, #1
	movs r1, #0
	bl STWI_send_TestModeREQ
	pop {r0}
	bx r0
	.align 2, 0
_082952F0: .4byte rfu_STC_REQ_callback
	thumb_func_end rfu_REQ_noise
