    .include "asm/macros.inc"
    .include "constants/constants.inc"
	.text
    .syntax unified

	thumb_func_start STWI_init_all
STWI_init_all: @ 0x08290FA0
	push {r4, lr}
	adds r3, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #1
	bne _08290FDC
	adds r2, r3, #0
	adds r2, #0xe8
	str r2, [r1]
	ldr r1, _08290FC8
	ldr r0, _08290FCC
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _08290FD0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _08290FD4
	ldr r2, _08290FD8
	adds r0, r3, r2
	b _08290FE6
	.align 2, 0
_08290FC8: .4byte 0x040000D4
_08290FCC: .4byte IntrSIO32
_08290FD0: .4byte 0x800004B0
_08290FD4: .4byte gUnknown_3007608
_08290FD8: .4byte 0x00000A48
_08290FDC:
	ldr r0, _08291060
	str r0, [r1]
	ldr r1, _08291064
	adds r0, r3, #0
	adds r0, #0xe8
_08290FE6:
	str r0, [r1]
	adds r2, r1, #0
	ldr r1, [r2]
	str r3, [r1, #0x28]
	adds r0, r3, #0
	adds r0, #0x74
	str r0, [r1, #0x24]
	ldrb r0, [r1, #0x14]
	movs r4, #0
	movs r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r2]
	str r4, [r0]
	strb r4, [r0, #4]
	ldr r0, [r2]
	strb r4, [r0, #5]
	ldr r0, [r2]
	strb r4, [r0, #7]
	ldr r0, [r2]
	strb r4, [r0, #8]
	ldr r0, [r2]
	strb r4, [r0, #9]
	ldr r0, [r2]
	str r4, [r0, #0xc]
	ldrb r1, [r0, #0x10]
	strb r4, [r0, #0x10]
	ldr r0, [r2]
	ldrh r1, [r0, #0x12]
	movs r1, #0
	strh r4, [r0, #0x12]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r1, _08291068
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	ldr r2, _0829106C
	adds r0, r2, #0
	strh r0, [r1]
	bl STWI_init_Callback_M
	bl STWI_init_Callback_S
	ldr r3, _08291070
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08291074
	ldrh r0, [r4]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08291060: .4byte IntrSIO32
_08291064: .4byte gUnknown_3007608
_08291068: .4byte 0x04000134
_0829106C: .4byte 0x00005003
_08291070: .4byte 0x04000208
_08291074: .4byte 0x04000200
	thumb_func_end STWI_init_all

	thumb_func_start STWI_init_timer
STWI_init_timer: @ 0x08291078
	push {r4, r5, lr}
	ldr r2, _082910A4
	str r2, [r0]
	ldr r5, _082910A8
	ldr r0, [r5]
	movs r4, #0
	strb r1, [r0, #0xa]
	ldr r3, _082910AC
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _082910B0
	ldr r1, [r5]
	movs r0, #8
	ldrb r1, [r1, #0xa]
	lsls r0, r1
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_082910A4: .4byte STWI_intr_timer
_082910A8: .4byte gUnknown_3007608
_082910AC: .4byte 0x04000208
_082910B0: .4byte 0x04000200
	thumb_func_end STWI_init_timer

	thumb_func_start AgbRFU_SoftReset
AgbRFU_SoftReset: @ 0x082910B4
	push {r4, r5, lr}
	ldr r5, _0829114C
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r1, #0
	strh r0, [r5]
	ldr r2, _08291150
	adds r0, r2, #0
	strh r0, [r5]
	ldr r1, _08291154
	ldr r0, [r1]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	ldr r3, _08291158
	adds r2, r0, r3
	ldr r4, _0829115C
	adds r3, r0, r4
	movs r0, #0
	strh r0, [r3]
	strh r0, [r2]
	movs r0, #0x83
	strh r0, [r3]
	ldrh r0, [r2]
	adds r4, r1, #0
	cmp r0, #0x11
	bhi _082910F4
	ldr r0, _08291160
	adds r1, r0, #0
_082910EC:
	strh r1, [r5]
	ldrh r0, [r2]
	cmp r0, #0x11
	bls _082910EC
_082910F4:
	movs r0, #3
	strh r0, [r3]
	ldr r1, _0829114C
	ldr r2, _08291150
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	ldr r3, _08291164
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, [r4]
	movs r2, #0
	str r2, [r0]
	strb r2, [r0, #4]
	ldr r0, [r4]
	strb r2, [r0, #5]
	ldr r0, [r4]
	strb r2, [r0, #6]
	ldr r0, [r4]
	strb r2, [r0, #7]
	ldr r0, [r4]
	strb r2, [r0, #8]
	ldr r0, [r4]
	strb r2, [r0, #9]
	ldr r0, [r4]
	str r2, [r0, #0xc]
	ldrb r1, [r0, #0x10]
	strb r2, [r0, #0x10]
	ldr r1, [r4]
	ldrh r0, [r1, #0x12]
	movs r3, #0
	strh r2, [r1, #0x12]
	ldrb r0, [r1, #0x14]
	movs r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r4]
	strb r3, [r0, #0x15]
	ldr r0, [r4]
	adds r0, #0x2c
	ldrb r1, [r0]
	strb r3, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0829114C: .4byte 0x04000134
_08291150: .4byte 0x000080A0
_08291154: .4byte gUnknown_3007608
_08291158: .4byte 0x04000100
_0829115C: .4byte 0x04000102
_08291160: .4byte 0x000080A2
_08291164: .4byte 0x00005003
	thumb_func_end AgbRFU_SoftReset

	thumb_func_start STWI_set_MS_mode
STWI_set_MS_mode: @ 0x08291168
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08291178
	ldr r1, [r1]
	ldrb r2, [r1, #0x14]
	strb r0, [r1, #0x14]
	bx lr
	.align 2, 0
_08291178: .4byte gUnknown_3007608
	thumb_func_end STWI_set_MS_mode

	thumb_func_start STWI_read_status
STWI_read_status: @ 0x0829117C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	beq _082911A8
	cmp r0, #1
	bgt _08291192
	cmp r0, #0
	beq _0829119C
	b _082911D0
_08291192:
	cmp r1, #2
	beq _082911B4
	cmp r1, #3
	beq _082911C4
	b _082911D0
_0829119C:
	ldr r0, _082911A4
	ldr r0, [r0]
	ldrh r0, [r0, #0x12]
	b _082911D2
	.align 2, 0
_082911A4: .4byte gUnknown_3007608
_082911A8:
	ldr r0, _082911B0
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	b _082911D2
	.align 2, 0
_082911B0: .4byte gUnknown_3007608
_082911B4:
	ldr r0, _082911C0
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _082911D2
	.align 2, 0
_082911C0: .4byte gUnknown_3007608
_082911C4:
	ldr r0, _082911CC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	b _082911D2
	.align 2, 0
_082911CC: .4byte gUnknown_3007608
_082911D0:
	ldr r0, _082911D8
_082911D2:
	pop {r1}
	bx r1
	.align 2, 0
_082911D8: .4byte 0x0000FFFF
	thumb_func_end STWI_read_status

	thumb_func_start STWI_init_Callback_M
STWI_init_Callback_M: @ 0x082911DC
	push {lr}
	movs r0, #0
	bl STWI_set_Callback_M
	pop {r0}
	bx r0
	thumb_func_end STWI_init_Callback_M

	thumb_func_start STWI_init_Callback_S
STWI_init_Callback_S: @ 0x082911E8
	push {lr}
	movs r0, #0
	bl STWI_set_Callback_S
	pop {r0}
	bx r0
	thumb_func_end STWI_init_Callback_S

	thumb_func_start STWI_set_Callback_M
STWI_set_Callback_M: @ 0x082911F4
	ldr r1, _082911FC
	ldr r1, [r1]
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_082911FC: .4byte gUnknown_3007608
	thumb_func_end STWI_set_Callback_M

	thumb_func_start STWI_set_Callback_S
STWI_set_Callback_S: @ 0x08291200
	ldr r1, _08291208
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	bx lr
	.align 2, 0
_08291208: .4byte gUnknown_3007608
	thumb_func_end STWI_set_Callback_S

	thumb_func_start STWI_set_Callback_ID
STWI_set_Callback_ID: @ 0x0829120C
	ldr r1, _08291214
	ldr r1, [r1]
	str r0, [r1, #0x20]
	bx lr
	.align 2, 0
_08291214: .4byte gUnknown_3007608
	thumb_func_end STWI_set_Callback_ID

	thumb_func_start STWI_poll_CommandEnd
STWI_poll_CommandEnd: @ 0x08291218
	push {lr}
	ldr r0, _0829123C
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	adds r3, r0, #0
	cmp r1, #1
	bne _08291232
	adds r1, r2, #0
_0829122C:
	ldrb r0, [r1]
	cmp r0, #1
	beq _0829122C
_08291232:
	ldr r0, [r3]
	ldrh r0, [r0, #0x12]
	pop {r1}
	bx r1
	.align 2, 0
_0829123C: .4byte gUnknown_3007608
	thumb_func_end STWI_poll_CommandEnd

	thumb_func_start STWI_send_ResetREQ
STWI_send_ResetREQ: @ 0x08291240
	push {lr}
	movs r0, #0x10
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0829125A
	ldr r0, _08291260
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_0829125A:
	pop {r0}
	bx r0
	.align 2, 0
_08291260: .4byte gUnknown_3007608
	thumb_func_end STWI_send_ResetREQ

	thumb_func_start STWI_send_LinkStatusREQ
STWI_send_LinkStatusREQ: @ 0x08291264
	push {lr}
	movs r0, #0x11
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0829127E
	ldr r0, _08291284
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_0829127E:
	pop {r0}
	bx r0
	.align 2, 0
_08291284: .4byte gUnknown_3007608
	thumb_func_end STWI_send_LinkStatusREQ

	thumb_func_start STWI_send_VersionStatusREQ
STWI_send_VersionStatusREQ: @ 0x08291288
	push {lr}
	movs r0, #0x12
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082912A2
	ldr r0, _082912A8
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_082912A2:
	pop {r0}
	bx r0
	.align 2, 0
_082912A8: .4byte gUnknown_3007608
	thumb_func_end STWI_send_VersionStatusREQ

	thumb_func_start STWI_send_SystemStatusREQ
STWI_send_SystemStatusREQ: @ 0x082912AC
	push {lr}
	movs r0, #0x13
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082912C6
	ldr r0, _082912CC
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_082912C6:
	pop {r0}
	bx r0
	.align 2, 0
_082912CC: .4byte gUnknown_3007608
	thumb_func_end STWI_send_SystemStatusREQ

	thumb_func_start STWI_send_SlotStatusREQ
STWI_send_SlotStatusREQ: @ 0x082912D0
	push {lr}
	movs r0, #0x14
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082912EA
	ldr r0, _082912F0
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_082912EA:
	pop {r0}
	bx r0
	.align 2, 0
_082912F0: .4byte gUnknown_3007608
	thumb_func_end STWI_send_SlotStatusREQ

	thumb_func_start STWI_send_ConfigStatusREQ
STWI_send_ConfigStatusREQ: @ 0x082912F4
	push {lr}
	movs r0, #0x15
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0829130E
	ldr r0, _08291314
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_0829130E:
	pop {r0}
	bx r0
	.align 2, 0
_08291314: .4byte gUnknown_3007608
	thumb_func_end STWI_send_ConfigStatusREQ

	thumb_func_start STWI_send_GameConfigREQ
STWI_send_GameConfigREQ: @ 0x08291318
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0x16
	bl STWI_init
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08291364
	ldr r2, _0829136C
	ldr r1, [r2]
	movs r0, #6
	strb r0, [r1, #4]
	ldr r0, [r2]
	ldr r1, [r0, #0x24]
	adds r1, #4
	ldrh r0, [r4]
	strh r0, [r1]
	adds r1, #2
	adds r4, #2
	movs r2, #0xd
_08291342:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r1, #1
	adds r4, #1
	subs r2, #1
	cmp r2, #0
	bge _08291342
	movs r2, #7
_08291352:
	ldrb r0, [r5]
	strb r0, [r1]
	adds r1, #1
	adds r5, #1
	subs r2, #1
	cmp r2, #0
	bge _08291352
	bl STWI_start_Command
_08291364:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0829136C: .4byte gUnknown_3007608
	thumb_func_end STWI_send_GameConfigREQ

	thumb_func_start STWI_send_SystemConfigREQ
STWI_send_SystemConfigREQ: @ 0x08291370
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r0, #0x17
	bl STWI_init
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _082913A6
	ldr r2, _082913AC
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #4]
	ldr r0, [r2]
	ldr r0, [r0, #0x24]
	adds r0, #4
	strb r4, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strh r6, [r0]
	bl STWI_start_Command
_082913A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_082913AC: .4byte gUnknown_3007608
	thumb_func_end STWI_send_SystemConfigREQ

	thumb_func_start STWI_send_SC_StartREQ
STWI_send_SC_StartREQ: @ 0x082913B0
	push {lr}
	movs r0, #0x19
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082913CA
	ldr r0, _082913D0
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_082913CA:
	pop {r0}
	bx r0
	.align 2, 0
_082913D0: .4byte gUnknown_3007608
	thumb_func_end STWI_send_SC_StartREQ

	thumb_func_start STWI_send_SC_PollingREQ
STWI_send_SC_PollingREQ: @ 0x082913D4
	push {lr}
	movs r0, #0x1a
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082913EE
	ldr r0, _082913F4
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_082913EE:
	pop {r0}
	bx r0
	.align 2, 0
_082913F4: .4byte gUnknown_3007608
	thumb_func_end STWI_send_SC_PollingREQ

	thumb_func_start STWI_send_SC_EndREQ
STWI_send_SC_EndREQ: @ 0x082913F8
	push {lr}
	movs r0, #0x1b
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08291412
	ldr r0, _08291418
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_08291412:
	pop {r0}
	bx r0
	.align 2, 0
_08291418: .4byte gUnknown_3007608
	thumb_func_end STWI_send_SC_EndREQ

	thumb_func_start STWI_send_SP_StartREQ
STWI_send_SP_StartREQ: @ 0x0829141C
	push {lr}
	movs r0, #0x1c
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08291436
	ldr r0, _0829143C
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_08291436:
	pop {r0}
	bx r0
	.align 2, 0
_0829143C: .4byte gUnknown_3007608
	thumb_func_end STWI_send_SP_StartREQ

	thumb_func_start STWI_send_SP_PollingREQ
STWI_send_SP_PollingREQ: @ 0x08291440
	push {lr}
	movs r0, #0x1d
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0829145A
	ldr r0, _08291460
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_0829145A:
	pop {r0}
	bx r0
	.align 2, 0
_08291460: .4byte gUnknown_3007608
	thumb_func_end STWI_send_SP_PollingREQ

	thumb_func_start STWI_send_SP_EndREQ
STWI_send_SP_EndREQ: @ 0x08291464
	push {lr}
	movs r0, #0x1e
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0829147E
	ldr r0, _08291484
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_0829147E:
	pop {r0}
	bx r0
	.align 2, 0
_08291484: .4byte gUnknown_3007608
	thumb_func_end STWI_send_SP_EndREQ

	thumb_func_start STWI_send_CP_StartREQ
STWI_send_CP_StartREQ: @ 0x08291488
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x1f
	bl STWI_init
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _082914AC
	ldr r2, _082914B4
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #4]
	ldr r0, [r2]
	ldr r0, [r0, #0x24]
	str r4, [r0, #4]
	bl STWI_start_Command
_082914AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_082914B4: .4byte gUnknown_3007608
	thumb_func_end STWI_send_CP_StartREQ

	thumb_func_start STWI_send_CP_PollingREQ
STWI_send_CP_PollingREQ: @ 0x082914B8
	push {lr}
	movs r0, #0x20
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082914D2
	ldr r0, _082914D8
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_082914D2:
	pop {r0}
	bx r0
	.align 2, 0
_082914D8: .4byte gUnknown_3007608
	thumb_func_end STWI_send_CP_PollingREQ

	thumb_func_start STWI_send_CP_EndREQ
STWI_send_CP_EndREQ: @ 0x082914DC
	push {lr}
	movs r0, #0x21
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082914F6
	ldr r0, _082914FC
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_082914F6:
	pop {r0}
	bx r0
	.align 2, 0
_082914FC: .4byte gUnknown_3007608
	thumb_func_end STWI_send_CP_EndREQ

	thumb_func_start STWI_send_DataTxREQ
STWI_send_DataTxREQ: @ 0x08291500
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r5, r4, #0x18
	movs r0, #0x24
	bl STWI_init
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0829153E
	lsrs r2, r4, #0x1a
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq _08291520
	adds r2, #1
_08291520:
	ldr r1, _08291544
	ldr r0, [r1]
	strb r2, [r0, #4]
	ldr r0, [r1]
	ldr r1, [r0, #0x24]
	adds r1, #4
	ldrb r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r2, r0
	adds r0, r6, #0
	bl CpuSet
	bl STWI_start_Command
_0829153E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08291544: .4byte gUnknown_3007608
	thumb_func_end STWI_send_DataTxREQ

	thumb_func_start STWI_send_DataTxAndChangeREQ
STWI_send_DataTxAndChangeREQ: @ 0x08291548
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r5, r4, #0x18
	movs r0, #0x25
	bl STWI_init
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08291586
	lsrs r2, r4, #0x1a
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq _08291568
	adds r2, #1
_08291568:
	ldr r1, _0829158C
	ldr r0, [r1]
	strb r2, [r0, #4]
	ldr r0, [r1]
	ldr r1, [r0, #0x24]
	adds r1, #4
	ldrb r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r2, r0
	adds r0, r6, #0
	bl CpuSet
	bl STWI_start_Command
_08291586:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0829158C: .4byte gUnknown_3007608
	thumb_func_end STWI_send_DataTxAndChangeREQ

	thumb_func_start STWI_send_DataRxREQ
STWI_send_DataRxREQ: @ 0x08291590
	push {lr}
	movs r0, #0x26
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082915AA
	ldr r0, _082915B0
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_082915AA:
	pop {r0}
	bx r0
	.align 2, 0
_082915B0: .4byte gUnknown_3007608
	thumb_func_end STWI_send_DataRxREQ

	thumb_func_start STWI_send_MS_ChangeREQ
STWI_send_MS_ChangeREQ: @ 0x082915B4
	push {lr}
	movs r0, #0x27
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082915CE
	ldr r0, _082915D4
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_082915CE:
	pop {r0}
	bx r0
	.align 2, 0
_082915D4: .4byte gUnknown_3007608
	thumb_func_end STWI_send_MS_ChangeREQ

	thumb_func_start STWI_send_DataReadyAndChangeREQ
STWI_send_DataReadyAndChangeREQ: @ 0x082915D8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	movs r0, #0x28
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0829161E
	cmp r4, #0
	bne _08291600
	ldr r0, _082915FC
	ldr r0, [r0]
	strb r3, [r0, #4]
	b _0829161A
	.align 2, 0
_082915FC: .4byte gUnknown_3007608
_08291600:
	ldr r2, _08291624
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #4]
	ldr r0, [r2]
	ldr r0, [r0, #0x24]
	adds r0, #4
	strb r5, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	strb r3, [r0, #1]
_0829161A:
	bl STWI_start_Command
_0829161E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08291624: .4byte gUnknown_3007608
	thumb_func_end STWI_send_DataReadyAndChangeREQ

	thumb_func_start STWI_send_DisconnectedAndChangeREQ
STWI_send_DisconnectedAndChangeREQ: @ 0x08291628
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #0x29
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0829165E
	ldr r2, _08291664
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #4]
	ldr r0, [r2]
	ldr r0, [r0, #0x24]
	adds r0, #4
	strb r4, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strb r3, [r0]
	strb r3, [r0, #1]
	bl STWI_start_Command
_0829165E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08291664: .4byte gUnknown_3007608
	thumb_func_end STWI_send_DisconnectedAndChangeREQ

	thumb_func_start STWI_send_ResumeRetransmitAndChangeREQ
STWI_send_ResumeRetransmitAndChangeREQ: @ 0x08291668
	push {lr}
	movs r0, #0x37
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08291682
	ldr r0, _08291688
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_08291682:
	pop {r0}
	bx r0
	.align 2, 0
_08291688: .4byte gUnknown_3007608
	thumb_func_end STWI_send_ResumeRetransmitAndChangeREQ

	thumb_func_start STWI_send_DisconnectREQ
STWI_send_DisconnectREQ: @ 0x0829168C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x30
	bl STWI_init
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _082916B0
	ldr r2, _082916B8
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #4]
	ldr r0, [r2]
	ldr r0, [r0, #0x24]
	str r4, [r0, #4]
	bl STWI_start_Command
_082916B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_082916B8: .4byte gUnknown_3007608
	thumb_func_end STWI_send_DisconnectREQ

	thumb_func_start STWI_send_TestModeREQ
STWI_send_TestModeREQ: @ 0x082916BC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r0, #0x31
	bl STWI_init
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _082916E8
	ldr r2, _082916F0
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #4]
	ldr r0, [r2]
	ldr r1, [r0, #0x24]
	lsls r0, r4, #8
	orrs r0, r5
	str r0, [r1, #4]
	bl STWI_start_Command
_082916E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_082916F0: .4byte gUnknown_3007608
	thumb_func_end STWI_send_TestModeREQ

	thumb_func_start STWI_send_CPR_StartREQ
STWI_send_CPR_StartREQ: @ 0x082916F4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r0, #0x32
	bl STWI_init
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08291726
	ldr r2, _0829172C
	ldr r1, [r2]
	movs r0, #2
	strb r0, [r1, #4]
	lsls r0, r5, #0x10
	orrs r0, r4
	ldr r1, [r2]
	ldr r1, [r1, #0x24]
	str r0, [r1, #4]
	str r6, [r1, #8]
	bl STWI_start_Command
_08291726:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0829172C: .4byte gUnknown_3007608
	thumb_func_end STWI_send_CPR_StartREQ

	thumb_func_start STWI_send_CPR_PollingREQ
STWI_send_CPR_PollingREQ: @ 0x08291730
	push {lr}
	movs r0, #0x33
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0829174A
	ldr r0, _08291750
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_0829174A:
	pop {r0}
	bx r0
	.align 2, 0
_08291750: .4byte gUnknown_3007608
	thumb_func_end STWI_send_CPR_PollingREQ

	thumb_func_start STWI_send_CPR_EndREQ
STWI_send_CPR_EndREQ: @ 0x08291754
	push {lr}
	movs r0, #0x34
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0829176E
	ldr r0, _08291774
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_0829176E:
	pop {r0}
	bx r0
	.align 2, 0
_08291774: .4byte gUnknown_3007608
	thumb_func_end STWI_send_CPR_EndREQ

	thumb_func_start STWI_send_StopModeREQ
STWI_send_StopModeREQ: @ 0x08291778
	push {lr}
	movs r0, #0x3d
	bl STWI_init
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08291792
	ldr r0, _08291798
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl STWI_start_Command
_08291792:
	pop {r0}
	bx r0
	.align 2, 0
_08291798: .4byte gUnknown_3007608
	thumb_func_end STWI_send_StopModeREQ

	thumb_func_start STWI_intr_timer
STWI_intr_timer: @ 0x0829179C
	push {r4, lr}
	ldr r4, _082917B4
	ldr r1, [r4]
	ldr r0, [r1, #0xc]
	cmp r0, #2
	beq _082917C2
	cmp r0, #2
	bgt _082917B8
	cmp r0, #1
	beq _082917D0
	b _082917F8
	.align 2, 0
_082917B4: .4byte gUnknown_3007608
_082917B8:
	cmp r0, #3
	beq _082917DA
	cmp r0, #4
	beq _082917D0
	b _082917F8
_082917C2:
	ldrb r0, [r1, #0x10]
	movs r0, #1
	strb r0, [r1, #0x10]
	movs r0, #0x32
	bl STWI_set_timer
	b _082917F8
_082917D0:
	bl STWI_stop_timer
	bl STWI_restart_Command
	b _082917F8
_082917DA:
	ldrb r0, [r1, #0x10]
	movs r0, #1
	strb r0, [r1, #0x10]
	bl STWI_stop_timer
	bl STWI_reset_ClockCounter
	ldr r0, [r4]
	ldr r2, [r0, #0x18]
	cmp r2, #0
	beq _082917F8
	movs r0, #0xff
	movs r1, #0
	bl _call_via_r2
_082917F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end STWI_intr_timer

	thumb_func_start STWI_set_timer
STWI_set_timer: @ 0x08291800
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r5, r3, #0
	ldr r2, _08291830
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	ldr r1, _08291834
	adds r4, r0, r1
	adds r1, #2
	adds r7, r0, r1
	ldr r1, _08291838
	movs r0, #0
	strh r0, [r1]
	adds r6, r2, #0
	cmp r3, #0x50
	beq _08291858
	cmp r3, #0x50
	bgt _0829183C
	cmp r3, #0x32
	beq _08291846
	b _08291884
	.align 2, 0
_08291830: .4byte gUnknown_3007608
_08291834: .4byte 0x04000100
_08291838: .4byte 0x04000208
_0829183C:
	cmp r5, #0x64
	beq _08291868
	cmp r5, #0x82
	beq _08291878
	b _08291884
_08291846:
	ldr r1, _08291854
	adds r0, r1, #0
	strh r0, [r4]
	ldr r1, [r6]
	movs r0, #1
	b _08291882
	.align 2, 0
_08291854: .4byte 0x0000FCCB
_08291858:
	ldr r1, _08291864
	adds r0, r1, #0
	strh r0, [r4]
	ldr r1, [r6]
	movs r0, #2
	b _08291882
	.align 2, 0
_08291864: .4byte 0x0000FAE0
_08291868:
	ldr r1, _08291874
	adds r0, r1, #0
	strh r0, [r4]
	ldr r1, [r6]
	movs r0, #3
	b _08291882
	.align 2, 0
_08291874: .4byte 0x0000F996
_08291878:
	ldr r1, _082918A0
	adds r0, r1, #0
	strh r0, [r4]
	ldr r1, [r6]
	movs r0, #4
_08291882:
	str r0, [r1, #0xc]
_08291884:
	movs r0, #0xc3
	strh r0, [r7]
	ldr r2, _082918A4
	ldr r1, [r6]
	movs r0, #8
	ldrb r1, [r1, #0xa]
	lsls r0, r1
	strh r0, [r2]
	ldr r1, _082918A8
	movs r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_082918A0: .4byte 0x0000F7AD
_082918A4: .4byte 0x04000202
_082918A8: .4byte 0x04000208
	thumb_func_end STWI_set_timer

	thumb_func_start STWI_stop_timer
STWI_stop_timer: @ 0x082918AC
	ldr r2, _082918CC
	ldr r0, [r2]
	movs r1, #0
	str r1, [r0, #0xc]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	ldr r3, _082918D0
	adds r0, r0, r3
	strh r1, [r0]
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	ldr r2, _082918D4
	adds r0, r0, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_082918CC: .4byte gUnknown_3007608
_082918D0: .4byte 0x04000100
_082918D4: .4byte 0x04000102
	thumb_func_end STWI_stop_timer

	thumb_func_start STWI_init
STWI_init: @ 0x082918D8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	ldr r0, _08291904
	ldrh r0, [r0]
	cmp r0, #0
	bne _0829190C
	ldr r0, _08291908
	ldr r1, [r0]
	ldrh r0, [r1, #0x12]
	movs r0, #6
	strh r0, [r1, #0x12]
	ldr r2, [r1, #0x18]
	cmp r2, #0
	beq _08291956
	ldrh r1, [r1, #0x12]
	adds r0, r5, #0
	bl _call_via_r2
	b _08291956
	.align 2, 0
_08291904: .4byte 0x04000208
_08291908: .4byte gUnknown_3007608
_0829190C:
	ldr r4, _08291938
	ldr r2, [r4]
	adds r3, r2, #0
	adds r3, #0x2c
	ldrb r0, [r3]
	cmp r0, #1
	bne _0829193C
	ldrh r0, [r2, #0x12]
	movs r1, #0
	movs r0, #2
	strh r0, [r2, #0x12]
	ldrb r0, [r3]
	strb r1, [r3]
	ldr r0, [r4]
	ldr r2, [r0, #0x18]
	cmp r2, #0
	beq _08291956
	ldrh r1, [r0, #0x12]
	adds r0, r5, #0
	bl _call_via_r2
	b _08291956
	.align 2, 0
_08291938: .4byte gUnknown_3007608
_0829193C:
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0829195A
	ldrh r0, [r2, #0x12]
	movs r0, #4
	strh r0, [r2, #0x12]
	ldr r3, [r2, #0x18]
	cmp r3, #0
	beq _08291956
	ldrh r1, [r2, #0x12]
	adds r0, r5, #0
	bl _call_via_r3
_08291956:
	movs r0, #1
	b _082919A2
_0829195A:
	ldrb r0, [r3]
	movs r1, #0
	movs r0, #1
	strb r0, [r3]
	ldr r0, [r4]
	strb r6, [r0, #6]
	ldr r0, [r4]
	str r1, [r0]
	strb r1, [r0, #4]
	ldr r0, [r4]
	strb r1, [r0, #5]
	ldr r0, [r4]
	strb r1, [r0, #7]
	ldr r0, [r4]
	strb r1, [r0, #8]
	ldr r0, [r4]
	strb r1, [r0, #9]
	ldr r0, [r4]
	str r1, [r0, #0xc]
	ldrb r2, [r0, #0x10]
	strb r1, [r0, #0x10]
	ldr r0, [r4]
	ldrh r2, [r0, #0x12]
	movs r2, #0
	strh r1, [r0, #0x12]
	strb r2, [r0, #0x15]
	ldr r1, _082919A8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	ldr r2, _082919AC
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0
_082919A2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_082919A8: .4byte 0x04000134
_082919AC: .4byte 0x00005003
	thumb_func_end STWI_init

	thumb_func_start STWI_start_Command
STWI_start_Command: @ 0x082919B0
	push {r4, r5, lr}
	ldr r5, _08291A08
	ldr r0, [r5]
	ldr r3, [r0, #0x24]
	ldrb r1, [r0, #4]
	lsls r1, r1, #8
	ldrb r0, [r0, #6]
	ldr r2, _08291A0C
	orrs r0, r2
	orrs r1, r0
	str r1, [r3]
	ldr r2, _08291A10
	ldr r1, [r5]
	ldr r0, [r1, #0x24]
	ldr r0, [r0]
	str r0, [r2]
	movs r2, #0
	str r2, [r1]
	movs r0, #1
	strb r0, [r1, #5]
	ldr r4, _08291A14
	ldrh r3, [r4]
	strh r2, [r4]
	ldr r2, _08291A18
	ldr r1, [r5]
	movs r0, #8
	ldrb r1, [r1, #0xa]
	lsls r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	strh r3, [r4]
	ldr r1, _08291A1C
	ldr r2, _08291A20
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08291A08: .4byte gUnknown_3007608
_08291A0C: .4byte 0x99660000
_08291A10: .4byte 0x04000120
_08291A14: .4byte 0x04000208
_08291A18: .4byte 0x04000200
_08291A1C: .4byte 0x04000128
_08291A20: .4byte 0x00005083
	thumb_func_end STWI_start_Command

	thumb_func_start STWI_restart_Command
STWI_restart_Command: @ 0x08291A24
	push {r4, lr}
	ldr r4, _08291A3C
	ldr r2, [r4]
	ldrb r0, [r2, #0x15]
	adds r3, r4, #0
	cmp r0, #1
	bhi _08291A40
	adds r0, #1
	strb r0, [r2, #0x15]
	bl STWI_start_Command
	b _08291A9A
	.align 2, 0
_08291A3C: .4byte gUnknown_3007608
_08291A40:
	ldrb r0, [r2, #6]
	cmp r0, #0x27
	beq _08291A52
	cmp r0, #0x25
	beq _08291A52
	cmp r0, #0x35
	beq _08291A52
	cmp r0, #0x37
	bne _08291A74
_08291A52:
	ldr r0, [r3]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	movs r1, #1
	strh r1, [r0, #0x12]
	adds r0, #0x2c
	ldrb r1, [r0]
	strb r2, [r0]
	ldr r1, [r3]
	ldr r2, [r1, #0x18]
	cmp r2, #0
	beq _08291A9A
	ldrb r0, [r1, #6]
	ldrh r1, [r1, #0x12]
	bl _call_via_r2
	b _08291A9A
_08291A74:
	ldrh r0, [r2, #0x12]
	movs r1, #0
	movs r0, #1
	strh r0, [r2, #0x12]
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r1, [r4]
	ldr r2, [r1, #0x18]
	cmp r2, #0
	beq _08291A94
	ldrb r0, [r1, #6]
	ldrh r1, [r1, #0x12]
	bl _call_via_r2
_08291A94:
	ldr r1, [r4]
	movs r0, #4
	str r0, [r1]
_08291A9A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end STWI_restart_Command

	thumb_func_start STWI_reset_ClockCounter
STWI_reset_ClockCounter: @ 0x08291AA4
	ldr r3, _08291AD0
	ldr r1, [r3]
	movs r0, #5
	str r0, [r1]
	movs r2, #0
	strb r2, [r1, #4]
	ldr r0, [r3]
	strb r2, [r0, #5]
	ldr r1, _08291AD4
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r1]
	adds r1, #8
	strh r2, [r1]
	ldr r2, _08291AD8
	adds r0, r2, #0
	strh r0, [r1]
	adds r2, #0x7f
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_08291AD0: .4byte gUnknown_3007608
_08291AD4: .4byte 0x04000120
_08291AD8: .4byte 0x00005003
	thumb_func_end STWI_reset_ClockCounter
