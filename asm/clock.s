.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitTimeBasedEvents
InitTimeBasedEvents: @ 0x0809E050
	push {lr}
	ldr r0, _0809E078
	bl FlagSet
	bl RtcCalcLocalTime
	ldr r0, _0809E07C
	ldr r2, [r0]
	adds r2, #0xa0
	ldr r3, _0809E080
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _0809E084
	ldrh r1, [r3]
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0809E078: .4byte 0x00000895
_0809E07C: .4byte 0x03005AF0
_0809E080: .4byte 0x03005A50
_0809E084: .4byte 0x00004040
	thumb_func_end InitTimeBasedEvents

	thumb_func_start DoTimeBasedEvents
DoTimeBasedEvents: @ 0x0809E088
	push {r4, lr}
	ldr r0, _0809E0B8
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809E0B2
	bl sub_0813B9F8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809E0B2
	bl RtcCalcLocalTime
	ldr r4, _0809E0BC
	adds r0, r4, #0
	bl UpdatePerDay
	adds r0, r4, #0
	bl UpdatePerMinute
_0809E0B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E0B8: .4byte 0x00000895
_0809E0BC: .4byte 0x03005A50
	thumb_func_end DoTimeBasedEvents

	thumb_func_start UpdatePerDay
UpdatePerDay: @ 0x0809E0C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0809E12C
	bl GetVarPointer
	adds r6, r0, #0
	ldrh r0, [r6]
	movs r2, #0
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _0809E126
	cmp r0, r1
	bgt _0809E126
	ldrh r4, [r5]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl ClearDailyFlags
	adds r0, r4, #0
	bl UpdateDewfordTrendPerDay
	adds r0, r4, #0
	bl UpdateTVShowsPerDay
	adds r0, r4, #0
	bl UpdateWeatherPerDay
	adds r0, r4, #0
	bl UpdatePartyPokerusTime
	adds r0, r4, #0
	bl UpdateMirageRnd
	adds r0, r4, #0
	bl UpdateBirchState
	adds r0, r4, #0
	bl UpdateFrontierManiac
	adds r0, r4, #0
	bl UpdateFrontierGambler
	adds r0, r4, #0
	bl SetShoalItemFlag
	adds r0, r4, #0
	bl SetRandomLotteryNumber
	ldrh r0, [r5]
	strh r0, [r6]
_0809E126:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E12C: .4byte 0x00004040
	thumb_func_end UpdatePerDay

	thumb_func_start UpdatePerMinute
UpdatePerMinute: @ 0x0809E130
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	mov r4, sp
	ldr r6, _0809E188
	ldr r1, [r6]
	adds r1, #0xa0
	mov r0, sp
	adds r2, r5, #0
	bl CalcTimeDifference
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	movs r2, #2
	ldrsb r2, [r4, r2]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	cmp r0, #0
	beq _0809E180
	cmp r0, #0
	blt _0809E180
	bl BerryTreeTimeUpdate
	ldr r2, [r6]
	adds r2, #0xa0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	str r0, [r2]
	str r1, [r2, #4]
_0809E180:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E188: .4byte 0x03005AF0
	thumb_func_end UpdatePerMinute

	thumb_func_start ReturnFromStartWallClock
ReturnFromStartWallClock: @ 0x0809E18C
	push {lr}
	bl InitTimeBasedEvents
	ldr r0, _0809E19C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0809E19C: .4byte 0x08085B35
	thumb_func_end ReturnFromStartWallClock

	thumb_func_start StartWallClock
StartWallClock: @ 0x0809E1A0
	push {lr}
	ldr r0, _0809E1B4
	bl SetMainCallback2
	ldr r1, _0809E1B8
	ldr r0, _0809E1BC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0809E1B4: .4byte 0x08134A3D
_0809E1B8: .4byte 0x03002360
_0809E1BC: .4byte 0x0809E18D
	thumb_func_end StartWallClock

