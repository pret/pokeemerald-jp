.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start RtcDisableInterrupts
RtcDisableInterrupts: @ 0x0802ED30
	ldr r2, _0802ED40
	ldr r1, _0802ED44
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0802ED40: .4byte 0x03000DCE
_0802ED44: .4byte 0x04000208
	thumb_func_end RtcDisableInterrupts

	thumb_func_start RtcRestoreInterrupts
RtcRestoreInterrupts: @ 0x0802ED48
	ldr r0, _0802ED54
	ldr r1, _0802ED58
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0802ED54: .4byte 0x04000208
_0802ED58: .4byte 0x03000DCE
	thumb_func_end RtcRestoreInterrupts

	thumb_func_start ConvertBcdToBinary
ConvertBcdToBinary: @ 0x0802ED5C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x9f
	bhi _0802ED6E
	movs r3, #0xf
	ands r3, r2
	cmp r3, #9
	bls _0802ED72
_0802ED6E:
	movs r0, #0xff
	b _0802ED80
_0802ED72:
	lsrs r1, r0, #0x1c
	movs r0, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
_0802ED80:
	pop {r1}
	bx r1
	thumb_func_end ConvertBcdToBinary

	thumb_func_start IsLeapYear
IsLeapYear: @ 0x0802ED84
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _0802ED9C
	adds r0, r4, #0
	movs r1, #0x64
	bl __umodsi3
	cmp r0, #0
	bne _0802EDAA
_0802ED9C:
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r4, #0
	bl __umodsi3
	cmp r0, #0
	bne _0802EDAE
_0802EDAA:
	movs r0, #1
	b _0802EDB0
_0802EDAE:
	movs r0, #0
_0802EDB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsLeapYear

	thumb_func_start ConvertDateToDayCount
ConvertDateToDayCount: @ 0x0802EDB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r5, #0
	subs r4, r7, #1
	cmp r4, #0
	blt _0802EDF6
_0802EDD4:
	ldr r1, _0802EE3C
	adds r0, r5, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl IsLeapYear
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802EDF0
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0802EDF0:
	subs r4, #1
	cmp r4, #0
	bge _0802EDD4
_0802EDF6:
	subs r0, r6, #1
	cmp r0, #0
	ble _0802EE0E
	ldr r1, _0802EE40
	adds r4, r0, #0
_0802EE00:
	ldm r1!, {r0}
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	subs r4, #1
	cmp r4, #0
	bne _0802EE00
_0802EE0E:
	cmp r6, #2
	bls _0802EE26
	adds r0, r7, #0
	bl IsLeapYear
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802EE26
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0802EE26:
	mov r1, r8
	adds r0, r5, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802EE3C: .4byte 0x0000016D
_0802EE40: .4byte 0x082D2558
	thumb_func_end ConvertDateToDayCount

	thumb_func_start RtcGetDayCount
RtcGetDayCount: @ 0x0802EE44
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrb r0, [r6]
	bl ConvertBcdToBinary
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldrb r0, [r6, #1]
	bl ConvertBcdToBinary
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r6, #2]
	bl ConvertBcdToBinary
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl ConvertDateToDayCount
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RtcGetDayCount

	thumb_func_start RtcInit
RtcInit: @ 0x0802EE80
	push {r4, r5, lr}
	ldr r5, _0802EEAC
	movs r0, #0
	strh r0, [r5]
	bl RtcDisableInterrupts
	bl SiiRtcUnprotect
	bl SiiRtcProbe
	ldr r4, _0802EEB0
	strb r0, [r4]
	bl RtcRestoreInterrupts
	ldrb r4, [r4]
	movs r0, #0xf
	ands r0, r4
	cmp r0, #1
	beq _0802EEB4
	movs r0, #1
	strh r0, [r5]
	b _0802EED2
	.align 2, 0
_0802EEAC: .4byte 0x03000DB8
_0802EEB0: .4byte 0x03000DCC
_0802EEB4:
	movs r0, #0xf0
	ands r0, r4
	cmp r0, #0
	beq _0802EEBE
	movs r0, #2
_0802EEBE:
	strh r0, [r5]
	ldr r4, _0802EED8
	adds r0, r4, #0
	bl RtcGetRawInfo
	adds r0, r4, #0
	bl RtcCheckInfo
	ldr r1, _0802EEDC
	strh r0, [r1]
_0802EED2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EED8: .4byte 0x03000DC0
_0802EEDC: .4byte 0x03000DB8
	thumb_func_end RtcInit

	thumb_func_start RtcGetErrorStatus
RtcGetErrorStatus: @ 0x0802EEE0
	ldr r0, _0802EEE8
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0802EEE8: .4byte 0x03000DB8
	thumb_func_end RtcGetErrorStatus

	thumb_func_start RtcGetInfo
RtcGetInfo: @ 0x0802EEEC
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _0802EF08
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0802EF10
	adds r1, r2, #0
	ldr r0, _0802EF0C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	b _0802EF16
	.align 2, 0
_0802EF08: .4byte 0x03000DB8
_0802EF0C: .4byte 0x082D254C
_0802EF10:
	adds r0, r2, #0
	bl RtcGetRawInfo
_0802EF16:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RtcGetInfo

	thumb_func_start RtcGetDateTime
RtcGetDateTime: @ 0x0802EF1C
	push {r4, lr}
	adds r4, r0, #0
	bl RtcDisableInterrupts
	adds r0, r4, #0
	bl SiiRtcGetDateTime
	bl RtcRestoreInterrupts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RtcGetDateTime

	thumb_func_start RtcGetStatus
RtcGetStatus: @ 0x0802EF34
	push {r4, lr}
	adds r4, r0, #0
	bl RtcDisableInterrupts
	adds r0, r4, #0
	bl SiiRtcGetStatus
	bl RtcRestoreInterrupts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RtcGetStatus

	thumb_func_start RtcGetRawInfo
RtcGetRawInfo: @ 0x0802EF4C
	push {r4, lr}
	adds r4, r0, #0
	bl RtcGetStatus
	adds r0, r4, #0
	bl RtcGetDateTime
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RtcGetRawInfo

	thumb_func_start RtcCheckInfo
RtcCheckInfo: @ 0x0802EF60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldrb r1, [r7, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #0x20
	ands r4, r0
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802EF86
	movs r0, #0x10
	orrs r4, r0
_0802EF86:
	ldrb r0, [r7]
	bl ConvertBcdToBinary
	mov r8, r0
	cmp r0, #0xff
	bne _0802EF9A
	movs r0, #0x40
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0802EF9A:
	ldrb r0, [r7, #1]
	bl ConvertBcdToBinary
	adds r6, r0, #0
	cmp r6, #0xff
	beq _0802EFAE
	cmp r6, #0
	beq _0802EFAE
	cmp r6, #0xc
	ble _0802EFB6
_0802EFAE:
	movs r0, #0x80
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0802EFB6:
	ldrb r0, [r7, #2]
	bl ConvertBcdToBinary
	adds r5, r0, #0
	cmp r5, #0xff
	bne _0802EFCE
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0802EFCE:
	cmp r6, #2
	bne _0802EFE8
	mov r0, r8
	bl IsLeapYear
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0802EFE4
	ldr r1, [r1, #4]
	adds r0, r0, r1
	b _0802EFF2
	.align 2, 0
_0802EFE4: .4byte 0x082D2558
_0802EFE8:
	ldr r0, _0802F058
	subs r1, r6, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
_0802EFF2:
	cmp r5, r0
	ble _0802F002
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0802F002:
	ldrb r0, [r7, #4]
	bl ConvertBcdToBinary
	adds r5, r0, #0
	cmp r5, #0x18
	ble _0802F01A
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0802F01A:
	ldrb r0, [r7, #5]
	bl ConvertBcdToBinary
	adds r5, r0, #0
	cmp r5, #0x3c
	ble _0802F032
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0802F032:
	ldrb r0, [r7, #6]
	bl ConvertBcdToBinary
	adds r5, r0, #0
	cmp r5, #0x3c
	ble _0802F04A
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0802F04A:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802F058: .4byte 0x082D2558
	thumb_func_end RtcCheckInfo

	thumb_func_start RtcReset
RtcReset: @ 0x0802F05C
	push {lr}
	bl RtcDisableInterrupts
	bl SiiRtcReset
	bl RtcRestoreInterrupts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RtcReset

	thumb_func_start FormatDecimalTime
FormatDecimalTime: @ 0x0802F070
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	adds r6, r3, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r4, #0xf0
	strb r4, [r0]
	adds r0, #1
	adds r1, r5, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	strb r4, [r0]
	adds r0, #1
	adds r1, r6, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FormatDecimalTime

	thumb_func_start FormatHexTime
FormatHexTime: @ 0x0802F0A8
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	adds r6, r3, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToHexStringN
	movs r4, #0xf0
	strb r4, [r0]
	adds r0, #1
	adds r1, r5, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToHexStringN
	strb r4, [r0]
	adds r0, #1
	adds r1, r6, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToHexStringN
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FormatHexTime

	thumb_func_start FormatHexRtcTime
FormatHexRtcTime: @ 0x0802F0E0
	push {lr}
	ldr r3, _0802F0F4
	ldrb r1, [r3, #4]
	ldrb r2, [r3, #5]
	ldrb r3, [r3, #6]
	bl FormatHexTime
	pop {r0}
	bx r0
	.align 2, 0
_0802F0F4: .4byte 0x03000DC0
	thumb_func_end FormatHexRtcTime

	thumb_func_start FormatDecimalDate
FormatDecimalDate: @ 0x0802F0F8
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	adds r6, r3, #0
	movs r2, #2
	movs r3, #4
	bl ConvertIntToDecimalStringN
	movs r4, #0xae
	strb r4, [r0]
	adds r0, #1
	adds r1, r5, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	strb r4, [r0]
	adds r0, #1
	adds r1, r6, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FormatDecimalDate

	thumb_func_start FormatHexDate
FormatHexDate: @ 0x0802F130
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	adds r6, r3, #0
	movs r2, #2
	movs r3, #4
	bl ConvertIntToHexStringN
	movs r4, #0xae
	strb r4, [r0]
	adds r0, #1
	adds r1, r5, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToHexStringN
	strb r4, [r0]
	adds r0, #1
	adds r1, r6, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToHexStringN
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FormatHexDate

	thumb_func_start RtcCalcTimeDifference
RtcCalcTimeDifference: @ 0x0802F168
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	bl RtcGetDayCount
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r5, #6]
	bl ConvertBcdToBinary
	ldrb r1, [r6, #4]
	subs r0, r0, r1
	strb r0, [r7, #4]
	ldrb r0, [r5, #5]
	bl ConvertBcdToBinary
	ldrb r1, [r6, #3]
	subs r0, r0, r1
	strb r0, [r7, #3]
	ldrb r0, [r5, #4]
	bl ConvertBcdToBinary
	ldrb r1, [r6, #2]
	subs r0, r0, r1
	strb r0, [r7, #2]
	ldrh r0, [r6]
	subs r4, r4, r0
	strh r4, [r7]
	ldrb r1, [r7, #4]
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	bge _0802F1BA
	adds r0, r1, #0
	adds r0, #0x3c
	strb r0, [r7, #4]
	ldrb r0, [r7, #3]
	subs r0, #1
	strb r0, [r7, #3]
_0802F1BA:
	ldrb r1, [r7, #3]
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	bge _0802F1D0
	adds r0, r1, #0
	adds r0, #0x3c
	strb r0, [r7, #3]
	ldrb r0, [r7, #2]
	subs r0, #1
	strb r0, [r7, #2]
_0802F1D0:
	ldrb r1, [r7, #2]
	movs r0, #2
	ldrsb r0, [r7, r0]
	cmp r0, #0
	bge _0802F1E6
	adds r0, r1, #0
	adds r0, #0x18
	strb r0, [r7, #2]
	ldrh r0, [r7]
	subs r0, #1
	strh r0, [r7]
_0802F1E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end RtcCalcTimeDifference

	thumb_func_start RtcCalcLocalTime
RtcCalcLocalTime: @ 0x0802F1EC
	push {r4, lr}
	ldr r4, _0802F20C
	adds r0, r4, #0
	bl RtcGetInfo
	ldr r1, _0802F210
	ldr r0, _0802F214
	ldr r2, [r0]
	adds r2, #0x98
	adds r0, r4, #0
	bl RtcCalcTimeDifference
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F20C: .4byte 0x03000DC0
_0802F210: .4byte 0x03005A50
_0802F214: .4byte 0x03005AF0
	thumb_func_end RtcCalcLocalTime

	thumb_func_start RtcInitLocalTimeOffset
RtcInitLocalTimeOffset: @ 0x0802F218
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r0, #0
	adds r1, r3, #0
	movs r3, #0
	bl RtcCalcLocalTimeOffset
	pop {r0}
	bx r0
	thumb_func_end RtcInitLocalTimeOffset

	thumb_func_start RtcCalcLocalTimeOffset
RtcCalcLocalTimeOffset: @ 0x0802F22C
	push {r4, r5, lr}
	ldr r4, _0802F254
	strh r0, [r4]
	strb r1, [r4, #2]
	strb r2, [r4, #3]
	strb r3, [r4, #4]
	ldr r5, _0802F258
	adds r0, r5, #0
	bl RtcGetInfo
	ldr r0, _0802F25C
	ldr r1, [r0]
	adds r1, #0x98
	adds r0, r5, #0
	adds r2, r4, #0
	bl RtcCalcTimeDifference
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F254: .4byte 0x03005A50
_0802F258: .4byte 0x03000DC0
_0802F25C: .4byte 0x03005AF0
	thumb_func_end RtcCalcLocalTimeOffset

	thumb_func_start CalcTimeDifference
CalcTimeDifference: @ 0x0802F260
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r3, [r2, #4]
	ldrb r0, [r1, #4]
	subs r5, r3, r0
	strb r5, [r4, #4]
	ldrb r3, [r2, #3]
	ldrb r0, [r1, #3]
	subs r6, r3, r0
	strb r6, [r4, #3]
	ldrb r0, [r2, #2]
	ldrb r3, [r1, #2]
	subs r0, r0, r3
	strb r0, [r4, #2]
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r4]
	lsls r0, r5, #0x18
	cmp r0, #0
	bge _0802F294
	adds r0, r5, #0
	adds r0, #0x3c
	strb r0, [r4, #4]
	subs r0, r6, #1
	strb r0, [r4, #3]
_0802F294:
	ldrb r1, [r4, #3]
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _0802F2AA
	adds r0, r1, #0
	adds r0, #0x3c
	strb r0, [r4, #3]
	ldrb r0, [r4, #2]
	subs r0, #1
	strb r0, [r4, #2]
_0802F2AA:
	ldrb r1, [r4, #2]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _0802F2C0
	adds r0, r1, #0
	adds r0, #0x18
	strb r0, [r4, #2]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
_0802F2C0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CalcTimeDifference

	thumb_func_start RtcGetMinuteCount
RtcGetMinuteCount: @ 0x0802F2C8
	push {r4, lr}
	ldr r4, _0802F2FC
	adds r0, r4, #0
	bl RtcGetInfo
	adds r0, r4, #0
	bl RtcGetDayCount
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #5
	ldrb r2, [r4, #4]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r4, [r4, #5]
	adds r0, r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802F2FC: .4byte 0x03000DC0
	thumb_func_end RtcGetMinuteCount

	thumb_func_start RtcGetLocalDayCount
RtcGetLocalDayCount: @ 0x0802F300
	push {lr}
	ldr r0, _0802F310
	bl RtcGetDayCount
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_0802F310: .4byte 0x03000DC0
	thumb_func_end RtcGetLocalDayCount

