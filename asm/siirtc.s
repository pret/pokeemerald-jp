    .include "asm/macros.inc"
    .include "constants/constants.inc"
	.text
    .syntax unified

	thumb_func_start SiiRtcUnprotect
SiiRtcUnprotect: @ 0x082906D8
	push {r7, lr}
	mov r7, sp
	bl sub_08290F78
	ldr r0, _082906EC
	movs r1, #0
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_082906EC: .4byte gUnknown_3001A76
	thumb_func_end SiiRtcUnprotect

	thumb_func_start SiiRtcProtect
SiiRtcProtect: @ 0x082906F0
	push {r7, lr}
	mov r7, sp
	bl sub_08290F8C
	ldr r0, _08290704
	movs r1, #1
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08290704: .4byte gUnknown_3001A76
	thumb_func_end SiiRtcProtect

	thumb_func_start SiiRtcProbe
SiiRtcProbe: @ 0x08290708
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	adds r1, r7, #4
	adds r0, r1, #0
	bl SiiRtcGetStatus
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08290722
	movs r0, #0
	b _082907D6
_08290722:
	adds r0, r7, #0
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #4
	ldrb r1, [r0, #7]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0x80
	beq _08290752
	adds r0, r7, #4
	ldrb r1, [r0, #7]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08290770
	b _08290752
_08290752:
	bl SiiRtcReset
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08290762
	movs r0, #0
	b _082907D6
_08290762:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
_08290770:
	adds r1, r7, #4
	adds r0, r1, #0
	bl SiiRtcGetTime
	adds r0, r7, #4
	ldrb r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _082907BE
	bl SiiRtcReset
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _082907B0
	adds r0, r7, #0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r1, r0, #0
	movs r2, #0xf
	adds r0, r1, #0
	bics r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	b _082907D6
_082907B0:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
_082907BE:
	adds r0, r7, #0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r1, r0, #0
	movs r2, #1
	adds r0, r1, #0
	orrs r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	b _082907D6
_082907D6:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SiiRtcProbe

	thumb_func_start SiiRtcReset
SiiRtcReset: @ 0x082907E0
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	ldr r0, _082907F4
	ldrb r1, [r0]
	cmp r1, #1
	bne _082907F8
	movs r0, #0
	b _0829085C
	.align 2, 0
_082907F4: .4byte gUnknown_3001A76
_082907F8:
	ldr r0, _08290850
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08290854
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290854
	movs r1, #5
	strh r1, [r0]
	ldr r0, _08290858
	movs r1, #7
	strh r1, [r0]
	movs r0, #0x60
	bl sub_08290DA8
	ldr r0, _08290854
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290854
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290850
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #4
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #7]
	adds r1, r7, #4
	adds r0, r1, #0
	bl SiiRtcSetStatus
	adds r1, r7, #0
	strb r0, [r1]
	adds r0, r7, #0
	ldrb r1, [r0]
	adds r0, r1, #0
	b _0829085C
	.align 2, 0
_08290850: .4byte gUnknown_3001A76
_08290854: .4byte 0x080000C4
_08290858: .4byte 0x080000C6
_0829085C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end SiiRtcReset

	thumb_func_start SiiRtcGetStatus
SiiRtcGetStatus: @ 0x08290864
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08290878
	ldrb r1, [r0]
	cmp r1, #1
	bne _0829087C
	movs r0, #0
	b _08290928
	.align 2, 0
_08290878: .4byte gUnknown_3001A76
_0829087C:
	ldr r0, _0829091C
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08290920
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290920
	movs r1, #5
	strh r1, [r0]
	ldr r0, _08290924
	movs r1, #7
	strh r1, [r0]
	movs r0, #0x63
	bl sub_08290DA8
	ldr r0, _08290924
	movs r1, #5
	strh r1, [r0]
	bl sub_08290EEC
	adds r1, r7, #4
	strb r0, [r1]
	ldr r0, [r7]
	adds r1, r7, #4
	ldrb r2, [r1]
	movs r3, #0xc0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r7, #4
	ldrb r3, [r2]
	movs r4, #0x20
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	lsrs r3, r2, #3
	adds r2, r3, #0
	orrs r1, r2
	adds r2, r7, #4
	ldrb r3, [r2]
	movs r4, #8
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	lsrs r3, r2, #2
	adds r2, r3, #0
	orrs r1, r2
	adds r2, r7, #4
	ldrb r3, [r2]
	movs r4, #2
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	lsrs r3, r2, #1
	adds r2, r3, #0
	orrs r1, r2
	ldrb r2, [r0, #7]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #7]
	ldr r0, _08290920
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290920
	movs r1, #1
	strh r1, [r0]
	ldr r0, _0829091C
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	b _08290928
	.align 2, 0
_0829091C: .4byte gUnknown_3001A76
_08290920: .4byte 0x080000C4
_08290924: .4byte 0x080000C6
_08290928:
	add sp, #8
	pop {r4, r7}
	pop {r1}
	bx r1
	thumb_func_end SiiRtcGetStatus

	thumb_func_start SiiRtcSetStatus
SiiRtcSetStatus: @ 0x08290930
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08290944
	ldrb r1, [r0]
	cmp r1, #1
	bne _08290948
	movs r0, #0
	b _082909D0
	.align 2, 0
_08290944: .4byte gUnknown_3001A76
_08290948:
	ldr r0, _082909C4
	movs r1, #1
	strb r1, [r0]
	ldr r0, _082909C8
	movs r1, #1
	strh r1, [r0]
	ldr r0, _082909C8
	movs r1, #5
	strh r1, [r0]
	adds r0, r7, #4
	ldr r1, [r7]
	ldrb r2, [r1, #7]
	movs r3, #4
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	lsls r1, r2, #3
	ldr r2, [r7]
	ldrb r3, [r2, #7]
	movs r4, #2
	adds r2, r3, #0
	ands r2, r4
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r3, r2, #0
	movs r4, #0x40
	adds r2, r3, #0
	orrs r2, r4
	orrs r1, r2
	ldr r2, [r7]
	ldrb r3, [r2, #7]
	movs r4, #1
	adds r2, r3, #0
	ands r2, r4
	adds r3, r2, #0
	lsls r2, r3, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _082909CC
	movs r1, #7
	strh r1, [r0]
	movs r0, #0x62
	bl sub_08290DA8
	adds r0, r7, #4
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_08290E4C
	ldr r0, _082909C8
	movs r1, #1
	strh r1, [r0]
	ldr r0, _082909C8
	movs r1, #1
	strh r1, [r0]
	ldr r0, _082909C4
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	b _082909D0
	.align 2, 0
_082909C4: .4byte gUnknown_3001A76
_082909C8: .4byte 0x080000C4
_082909CC: .4byte 0x080000C6
_082909D0:
	add sp, #8
	pop {r4, r7}
	pop {r1}
	bx r1
	thumb_func_end SiiRtcSetStatus

	thumb_func_start SiiRtcGetDateTime
SiiRtcGetDateTime: @ 0x082909D8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _082909EC
	ldrb r1, [r0]
	cmp r1, #1
	bne _082909F0
	movs r0, #0
	b _08290A80
	.align 2, 0
_082909EC: .4byte gUnknown_3001A76
_082909F0:
	ldr r0, _08290A24
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08290A28
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290A28
	movs r1, #5
	strh r1, [r0]
	ldr r0, _08290A2C
	movs r1, #7
	strh r1, [r0]
	movs r0, #0x65
	bl sub_08290DA8
	ldr r0, _08290A2C
	movs r1, #5
	strh r1, [r0]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
_08290A1A:
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #6
	bls _08290A30
	b _08290A4E
	.align 2, 0
_08290A24: .4byte gUnknown_3001A76
_08290A28: .4byte 0x080000C4
_08290A2C: .4byte 0x080000C6
_08290A30:
	bl sub_08290EEC
	adds r1, r7, #4
	ldrb r2, [r1]
	ldr r3, [r7]
	adds r1, r2, r3
	strb r0, [r1]
	adds r1, r7, #4
	adds r0, r7, #4
	adds r1, r7, #4
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08290A1A
_08290A4E:
	ldr r1, [r7]
	adds r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #4
	ldrb r2, [r1]
	movs r3, #0x7f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08290A78
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290A78
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290A7C
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	b _08290A80
	.align 2, 0
_08290A78: .4byte 0x080000C4
_08290A7C: .4byte gUnknown_3001A76
_08290A80:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end SiiRtcGetDateTime

	thumb_func_start SiiRtcSetDateTime
SiiRtcSetDateTime: @ 0x08290A88
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08290A9C
	ldrb r1, [r0]
	cmp r1, #1
	bne _08290AA0
	movs r0, #0
	b _08290B1C
	.align 2, 0
_08290A9C: .4byte gUnknown_3001A76
_08290AA0:
	ldr r0, _08290AD0
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08290AD4
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290AD4
	movs r1, #5
	strh r1, [r0]
	ldr r0, _08290AD8
	movs r1, #7
	strh r1, [r0]
	movs r0, #0x64
	bl sub_08290DA8
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
_08290AC4:
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #6
	bls _08290ADC
	b _08290AFC
	.align 2, 0
_08290AD0: .4byte gUnknown_3001A76
_08290AD4: .4byte 0x080000C4
_08290AD8: .4byte 0x080000C6
_08290ADC:
	adds r0, r7, #4
	ldrb r1, [r0]
	ldr r2, [r7]
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_08290E4C
	adds r1, r7, #4
	adds r0, r7, #4
	adds r1, r7, #4
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08290AC4
_08290AFC:
	ldr r0, _08290B14
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290B14
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290B18
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	b _08290B1C
	.align 2, 0
_08290B14: .4byte 0x080000C4
_08290B18: .4byte gUnknown_3001A76
_08290B1C:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end SiiRtcSetDateTime

	thumb_func_start SiiRtcGetTime
SiiRtcGetTime: @ 0x08290B24
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08290B38
	ldrb r1, [r0]
	cmp r1, #1
	bne _08290B3C
	movs r0, #0
	b _08290BD0
	.align 2, 0
_08290B38: .4byte gUnknown_3001A76
_08290B3C:
	ldr r0, _08290B70
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08290B74
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290B74
	movs r1, #5
	strh r1, [r0]
	ldr r0, _08290B78
	movs r1, #7
	strh r1, [r0]
	movs r0, #0x67
	bl sub_08290DA8
	ldr r0, _08290B78
	movs r1, #5
	strh r1, [r0]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
_08290B66:
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #2
	bls _08290B7C
	b _08290B9C
	.align 2, 0
_08290B70: .4byte gUnknown_3001A76
_08290B74: .4byte 0x080000C4
_08290B78: .4byte 0x080000C6
_08290B7C:
	bl sub_08290EEC
	adds r1, r7, #4
	ldrb r2, [r1]
	ldr r3, [r7]
	adds r1, r2, r3
	adds r2, r1, #4
	strb r0, [r2]
	adds r1, r7, #4
	adds r0, r7, #4
	adds r1, r7, #4
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08290B66
_08290B9C:
	ldr r1, [r7]
	adds r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #4
	ldrb r2, [r1]
	movs r3, #0x7f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08290BC8
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290BC8
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290BCC
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	b _08290BD0
	.align 2, 0
_08290BC8: .4byte 0x080000C4
_08290BCC: .4byte gUnknown_3001A76
_08290BD0:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end SiiRtcGetTime

	thumb_func_start SiiRtcSetTime
SiiRtcSetTime: @ 0x08290BD8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08290BEC
	ldrb r1, [r0]
	cmp r1, #1
	bne _08290BF0
	movs r0, #0
	b _08290C6C
	.align 2, 0
_08290BEC: .4byte gUnknown_3001A76
_08290BF0:
	ldr r0, _08290C20
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08290C24
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290C24
	movs r1, #5
	strh r1, [r0]
	ldr r0, _08290C28
	movs r1, #7
	strh r1, [r0]
	movs r0, #0x66
	bl sub_08290DA8
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
_08290C14:
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #2
	bls _08290C2C
	b _08290C4E
	.align 2, 0
_08290C20: .4byte gUnknown_3001A76
_08290C24: .4byte 0x080000C4
_08290C28: .4byte 0x080000C6
_08290C2C:
	adds r0, r7, #4
	ldrb r1, [r0]
	ldr r2, [r7]
	adds r0, r1, r2
	adds r1, r0, #4
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_08290E4C
	adds r1, r7, #4
	adds r0, r7, #4
	adds r1, r7, #4
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08290C14
_08290C4E:
	ldr r0, _08290C64
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290C64
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290C68
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	b _08290C6C
	.align 2, 0
_08290C64: .4byte 0x080000C4
_08290C68: .4byte gUnknown_3001A76
_08290C6C:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end SiiRtcSetTime

	thumb_func_start SiiRtcSetAlarm
SiiRtcSetAlarm: @ 0x08290C74
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _08290C88
	ldrb r1, [r0]
	cmp r1, #1
	bne _08290C8C
	movs r0, #0
	b _08290DA0
	.align 2, 0
_08290C88: .4byte gUnknown_3001A76
_08290C8C:
	ldr r0, _08290CF4
	movs r1, #1
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7]
	ldrb r2, [r1, #8]
	movs r3, #0xf
	adds r1, r2, #0
	ands r1, r3
	ldr r2, [r7]
	ldrb r3, [r2, #8]
	lsrs r2, r3, #4
	adds r3, r2, #0
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #0xb
	bhi _08290CF8
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7]
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #8]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08290D16
	.align 2, 0
_08290CF4: .4byte gUnknown_3001A76
_08290CF8:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7]
	ldrb r2, [r1, #8]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_08290D16:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7]
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #9]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	ldr r0, _08290D58
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290D58
	movs r1, #5
	strh r1, [r0]
	ldr r0, _08290D5C
	movs r1, #7
	strh r1, [r0]
	movs r0, #0x68
	bl sub_08290DA8
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
_08290D4C:
	adds r0, r7, #4
	ldrb r1, [r0]
	cmp r1, #1
	bls _08290D60
	b _08290D82
	.align 2, 0
_08290D58: .4byte 0x080000C4
_08290D5C: .4byte 0x080000C6
_08290D60:
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #4
	ldrb r2, [r1]
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_08290E4C
	adds r1, r7, #4
	adds r0, r7, #4
	adds r1, r7, #4
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08290D4C
_08290D82:
	ldr r0, _08290D98
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290D98
	movs r1, #1
	strh r1, [r0]
	ldr r0, _08290D9C
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	b _08290DA0
	.align 2, 0
_08290D98: .4byte 0x080000C4
_08290D9C: .4byte gUnknown_3001A76
_08290DA0:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1
	thumb_func_end SiiRtcSetAlarm

	thumb_func_start sub_08290DA8
sub_08290DA8: @ 0x08290DA8
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r0, #0
	adds r2, r7, #0
	strb r1, [r2]
	adds r1, r7, #1
	movs r2, #0
	strb r2, [r1]
_08290DBA:
	adds r1, r7, #1
	ldrb r2, [r1]
	cmp r2, #7
	bls _08290DC4
	b _08290E44
_08290DC4:
	adds r1, r7, #2
	adds r3, r7, #0
	ldrb r2, [r3]
	adds r3, r7, #1
	ldrb r4, [r3]
	movs r5, #7
	subs r3, r5, r4
	asrs r2, r3
	adds r3, r2, #0
	movs r4, #1
	adds r2, r3, #0
	ands r2, r4
	adds r3, r2, #0
	strb r3, [r1]
	ldr r1, _08290E40
	adds r2, r7, #2
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r2, r3, #0
	movs r3, #4
	orrs r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	ldr r1, _08290E40
	adds r2, r7, #2
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r2, r3, #0
	movs r3, #4
	orrs r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	ldr r1, _08290E40
	adds r2, r7, #2
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r2, r3, #0
	movs r3, #4
	orrs r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	ldr r1, _08290E40
	adds r2, r7, #2
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r2, r3, #0
	movs r3, #5
	orrs r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	adds r2, r7, #1
	adds r1, r7, #1
	adds r2, r7, #1
	ldrb r3, [r2]
	adds r2, r3, #1
	adds r3, r2, #0
	strb r3, [r1]
	b _08290DBA
	.align 2, 0
_08290E40: .4byte 0x080000C4
_08290E44:
	add sp, #4
	pop {r4, r5, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08290DA8

	thumb_func_start sub_08290E4C
sub_08290E4C: @ 0x08290E4C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r0, #0
	adds r2, r7, #0
	strb r1, [r2]
	adds r1, r7, #1
	movs r2, #0
	strb r2, [r1]
_08290E5E:
	adds r1, r7, #1
	ldrb r2, [r1]
	cmp r2, #7
	bls _08290E68
	b _08290EE4
_08290E68:
	adds r1, r7, #2
	adds r3, r7, #0
	ldrb r2, [r3]
	adds r3, r7, #1
	ldrb r4, [r3]
	asrs r2, r4
	adds r3, r2, #0
	movs r4, #1
	adds r2, r3, #0
	ands r2, r4
	adds r3, r2, #0
	strb r3, [r1]
	ldr r1, _08290EE0
	adds r2, r7, #2
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r2, r3, #0
	movs r3, #4
	orrs r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	ldr r1, _08290EE0
	adds r2, r7, #2
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r2, r3, #0
	movs r3, #4
	orrs r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	ldr r1, _08290EE0
	adds r2, r7, #2
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r2, r3, #0
	movs r3, #4
	orrs r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	ldr r1, _08290EE0
	adds r2, r7, #2
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r2, r3, #0
	movs r3, #5
	orrs r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	adds r2, r7, #1
	adds r1, r7, #1
	adds r2, r7, #1
	ldrb r3, [r2]
	adds r2, r3, #1
	adds r3, r2, #0
	strb r3, [r1]
	b _08290E5E
	.align 2, 0
_08290EE0: .4byte 0x080000C4
_08290EE4:
	add sp, #4
	pop {r4, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08290E4C

	thumb_func_start sub_08290EEC
sub_08290EEC: @ 0x08290EEC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	movs r1, #0
	strb r1, [r0]
_08290EF8:
	adds r0, r7, #0
	ldrb r1, [r0]
	cmp r1, #7
	bls _08290F02
	b _08290F68
_08290F02:
	ldr r0, _08290F64
	movs r1, #4
	strh r1, [r0]
	ldr r0, _08290F64
	movs r1, #4
	strh r1, [r0]
	ldr r0, _08290F64
	movs r1, #4
	strh r1, [r0]
	ldr r0, _08290F64
	movs r1, #4
	strh r1, [r0]
	ldr r0, _08290F64
	movs r1, #4
	strh r1, [r0]
	ldr r0, _08290F64
	movs r1, #5
	strh r1, [r0]
	adds r0, r7, #1
	ldr r1, _08290F64
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	ands r1, r3
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	lsrs r2, r1, #1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #2
	adds r1, r7, #2
	ldrb r2, [r1]
	lsrs r1, r2, #1
	adds r2, r7, #1
	ldrb r3, [r2]
	lsls r2, r3, #7
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrb r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08290EF8
	.align 2, 0
_08290F64: .4byte 0x080000C4
_08290F68:
	adds r0, r7, #2
	ldrb r1, [r0]
	adds r0, r1, #0
	b _08290F70
_08290F70:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08290EEC

	thumb_func_start sub_08290F78
sub_08290F78: @ 0x08290F78
	push {r7, lr}
	mov r7, sp
	ldr r0, _08290F88
	movs r1, #1
	strh r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08290F88: .4byte 0x080000C8
	thumb_func_end sub_08290F78

	thumb_func_start sub_08290F8C
sub_08290F8C: @ 0x08290F8C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08290F9C
	movs r1, #0
	strh r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08290F9C: .4byte 0x080000C8
	thumb_func_end sub_08290F8C
