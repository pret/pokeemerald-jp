.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DisableWildEncounters
DisableWildEncounters: @ 0x080B4010
	ldr r1, _080B4018
	strb r0, [r1]
	bx lr
	.align 2, 0
_080B4018: .4byte 0x020388A0
	thumb_func_end DisableWildEncounters

	thumb_func_start GetRoute119WaterTileNum
GetRoute119WaterTileNum: @ 0x080B401C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _080B40A4
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r2, r1, #1
	adds r2, r2, r3
	adds r0, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	mov sb, r0
	adds r1, #2
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r6, [r1]
	ldrh r5, [r2]
	cmp r5, sb
	bhi _080B40C6
	ldr r0, _080B40A8
	mov sl, r0
_080B405E:
	movs r4, #0
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	cmp r4, r0
	bge _080B40BC
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_080B4078:
	adds r0, r4, #7
	adds r1, r5, #7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSurfableAndNotWaterfall
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B40AC
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r8, r4
	bne _080B40AC
	cmp r7, r5
	bne _080B40AC
	adds r0, r6, #0
	b _080B40CC
	.align 2, 0
_080B40A4: .4byte 0x0852E728
_080B40A8: .4byte 0x02036FB8
_080B40AC:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	cmp r4, r0
	blt _080B4078
_080B40BC:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	bls _080B405E
_080B40C6:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080B40CC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetRoute119WaterTileNum

	thumb_func_start CheckFeebas
CheckFeebas: @ 0x080B40DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	movs r7, #0
	ldr r0, _080B4154
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x88
	lsls r0, r0, #6
	cmp r1, r0
	bne _080B41D2
	add r5, sp, #0xc
	mov r4, sp
	adds r4, #0xe
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldrh r0, [r5]
	subs r0, #7
	strh r0, [r5]
	ldrh r0, [r4]
	subs r0, #7
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, _080B4158
	mov sb, r5
	mov r8, r4
	ldrh r2, [r0, #6]
	cmp r1, r2
	blt _080B4128
	ldrh r3, [r0, #8]
	cmp r1, r3
	bgt _080B4128
	movs r7, #1
_080B4128:
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldrh r2, [r0, #0xc]
	cmp r1, r2
	blt _080B413C
	ldrh r0, [r0, #0xe]
	cmp r1, r0
	bgt _080B413C
	movs r7, #2
_080B413C:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bls _080B4160
	b _080B41D2
	.align 2, 0
_080B4154: .4byte 0x03005AEC
_080B4158: .4byte 0x0852E728
_080B415C:
	movs r0, #1
	b _080B41D4
_080B4160:
	ldr r0, _080B41E4
	ldr r0, [r0]
	ldr r3, _080B41E8
	adds r0, r0, r3
	ldrh r0, [r0]
	bl FeebasSeedRng
	movs r5, #0
	ldr r6, _080B41EC
_080B4172:
	bl FeebasRandom
	lsls r1, r5, #1
	mov r2, sp
	adds r4, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __umodsi3
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B4190
	strh r6, [r4]
_080B4190:
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080B41A2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080B41A2:
	cmp r5, #6
	bne _080B4172
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r7, #0
	bl GetRoute119WaterTileNum
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r5, #0
_080B41BE:
	lsls r0, r5, #1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _080B415C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _080B41BE
_080B41D2:
	movs r0, #0
_080B41D4:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B41E4: .4byte 0x03005AEC
_080B41E8: .4byte 0x00002E6A
_080B41EC: .4byte 0x000001BF
	thumb_func_end CheckFeebas

	thumb_func_start FeebasRandom
FeebasRandom: @ 0x080B41F0
	ldr r2, _080B4204
	ldr r1, [r2]
	ldr r0, _080B4208
	muls r0, r1, r0
	ldr r1, _080B420C
	adds r0, r0, r1
	str r0, [r2]
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_080B4204: .4byte 0x020388A4
_080B4208: .4byte 0x41C64E6D
_080B420C: .4byte 0x00003039
	thumb_func_end FeebasRandom

	thumb_func_start FeebasSeedRng
FeebasSeedRng: @ 0x080B4210
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080B421C
	str r0, [r1]
	bx lr
	.align 2, 0
_080B421C: .4byte 0x020388A4
	thumb_func_end FeebasSeedRng

	thumb_func_start ChooseWildMonIndex_Land
ChooseWildMonIndex_Land: @ 0x080B4220
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bhi _080B423C
	movs r0, #0
	b _080B42D6
_080B423C:
	adds r0, r1, #0
	subs r0, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _080B424C
	movs r0, #1
	b _080B42D6
_080B424C:
	adds r0, r1, #0
	subs r0, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _080B425C
	movs r0, #2
	b _080B42D6
_080B425C:
	adds r0, r1, #0
	subs r0, #0x32
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _080B426C
	movs r0, #3
	b _080B42D6
_080B426C:
	adds r0, r1, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _080B427C
	movs r0, #4
	b _080B42D6
_080B427C:
	adds r0, r1, #0
	subs r0, #0x46
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _080B428C
	movs r0, #5
	b _080B42D6
_080B428C:
	adds r0, r1, #0
	subs r0, #0x50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080B429C
	movs r0, #6
	b _080B42D6
_080B429C:
	adds r0, r1, #0
	subs r0, #0x55
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080B42AC
	movs r0, #7
	b _080B42D6
_080B42AC:
	adds r0, r1, #0
	subs r0, #0x5a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _080B42BC
	movs r0, #8
	b _080B42D6
_080B42BC:
	adds r0, r1, #0
	subs r0, #0x5e
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _080B42CC
	movs r0, #9
	b _080B42D6
_080B42CC:
	cmp r1, #0x62
	beq _080B42D4
	movs r0, #0xb
	b _080B42D6
_080B42D4:
	movs r0, #0xa
_080B42D6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ChooseWildMonIndex_Land

	thumb_func_start ChooseWildMonIndex_WaterRock
ChooseWildMonIndex_WaterRock: @ 0x080B42DC
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	cmp r1, #0x3b
	bhi _080B42FA
	movs r0, #0
	b _080B432C
_080B42FA:
	adds r0, r1, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bhi _080B430A
	movs r0, #1
	b _080B432C
_080B430A:
	adds r0, r1, #0
	subs r0, #0x5a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080B431A
	movs r0, #2
	b _080B432C
_080B431A:
	adds r0, r2, #0
	subs r0, #0x5f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _080B432A
	movs r0, #4
	b _080B432C
_080B432A:
	movs r0, #3
_080B432C:
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonIndex_WaterRock

	thumb_func_start ChooseWildMonIndex_Fishing
ChooseWildMonIndex_Fishing: @ 0x080B4330
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	movs r5, #0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r4, #1
	beq _080B436A
	cmp r4, #1
	bgt _080B435A
	cmp r4, #0
	beq _080B4360
	b _080B43C4
_080B435A:
	cmp r6, #2
	beq _080B438E
	b _080B43C4
_080B4360:
	movs r5, #1
	cmp r1, #0x45
	bhi _080B43C4
	movs r5, #0
	b _080B43C4
_080B436A:
	cmp r1, #0x3b
	bhi _080B4370
	movs r5, #2
_080B4370:
	adds r0, r1, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _080B437E
	movs r5, #3
_080B437E:
	adds r0, r1, #0
	subs r0, #0x50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _080B43C4
	movs r5, #4
	b _080B43C4
_080B438E:
	cmp r1, #0x27
	bhi _080B4394
	movs r5, #5
_080B4394:
	adds r0, r1, #0
	subs r0, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x27
	bhi _080B43A2
	movs r5, #6
_080B43A2:
	adds r0, r1, #0
	subs r0, #0x50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe
	bhi _080B43B0
	movs r5, #7
_080B43B0:
	adds r0, r1, #0
	subs r0, #0x5f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _080B43BE
	movs r5, #8
_080B43BE:
	cmp r1, #0x63
	bne _080B43C4
	movs r5, #9
_080B43C4:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonIndex_Fishing

	thumb_func_start ChooseWildMonLevel
ChooseWildMonLevel: @ 0x080B43CC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	cmp r0, r1
	blo _080B43DE
	ldrb r7, [r4]
	adds r6, r0, #0
	b _080B43E2
_080B43DE:
	ldrb r7, [r4, #1]
	ldrb r6, [r4]
_080B43E2:
	subs r4, r6, r7
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _080B4434
	adds r0, r5, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _080B4442
	adds r0, r5, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	beq _080B4420
	cmp r0, #0x48
	beq _080B4420
	cmp r0, #0x2e
	bne _080B4442
_080B4420:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080B4438
	adds r0, r6, #0
	b _080B4448
	.align 2, 0
_080B4434: .4byte 0x02024190
_080B4438:
	cmp r4, #0
	beq _080B4442
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080B4442:
	adds r0, r7, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080B4448:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ChooseWildMonLevel

	thumb_func_start GetCurrentMapWildMonHeaderId
GetCurrentMapWildMonHeaderId: @ 0x080B4450
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r0, _080B44A0
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0xff
	beq _080B44C4
	ldr r6, _080B44A4
_080B4460:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r3, r0, r5
	ldrb r1, [r3]
	ldr r0, _080B44A8
	ldr r2, [r0]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080B44B0
	ldrb r1, [r3, #1]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080B44B0
	ldrh r0, [r2, #4]
	cmp r0, r6
	bne _080B449C
	ldr r0, _080B44AC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _080B4496
	movs r0, #0
_080B4496:
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080B449C:
	adds r0, r4, #0
	b _080B44C6
	.align 2, 0
_080B44A0: .4byte 0x0852D9F4
_080B44A4: .4byte 0x00006A18
_080B44A8: .4byte 0x03005AEC
_080B44AC: .4byte 0x0000403E
_080B44B0:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080B4460
_080B44C4:
	ldr r0, _080B44CC
_080B44C6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B44CC: .4byte 0x0000FFFF
	thumb_func_end GetCurrentMapWildMonHeaderId

	thumb_func_start PickWildMonNature
PickWildMonNature: @ 0x080B44D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	bl GetSafariZoneFlag
	cmp r0, #1
	bne _080B4566
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4f
	bhi _080B4566
	bl SafariZoneGetActivePokeblock
	adds r7, r0, #0
	cmp r7, #0
	beq _080B4566
	movs r5, #0
_080B44FE:
	mov r1, sp
	adds r0, r1, r5
	strb r5, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x18
	bls _080B44FE
	movs r5, #0
_080B4510:
	adds r1, r5, #1
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	adds r6, r1, #0
	cmp r4, #0x18
	bhi _080B4540
	add r5, sp
_080B451E:
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080B4536
	ldrb r2, [r5]
	mov r0, sp
	adds r1, r0, r4
	ldrb r0, [r1]
	strb r0, [r5]
	strb r2, [r1]
_080B4536:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x18
	bls _080B451E
_080B4540:
	lsls r0, r6, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _080B4510
	movs r5, #0
_080B454A:
	mov r1, sp
	adds r4, r1, r5
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_08137054
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080B45A0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x18
	bls _080B454A
_080B4566:
	ldr r4, _080B459C
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _080B45A4
	adds r0, r4, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1c
	bne _080B45A4
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080B45A4
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	b _080B45AC
	.align 2, 0
_080B459C: .4byte 0x02024190
_080B45A0:
	ldrb r0, [r4]
	b _080B45B6
_080B45A4:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080B45AC:
	movs r1, #0x19
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080B45B6:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PickWildMonNature

	thumb_func_start CreateWildMon
CreateWildMon: @ 0x080B45C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	bl ZeroEnemyPartyMons
	movs r2, #1
	ldr r1, _080B4650
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _080B45EE
	cmp r0, #0
	blt _080B45F0
	cmp r0, #0xff
	bgt _080B45F0
	cmp r0, #0xfe
	blt _080B45F0
_080B45EE:
	movs r2, #0
_080B45F0:
	cmp r2, #0
	beq _080B4680
	ldr r5, _080B4654
	adds r0, r5, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _080B4680
	adds r0, r5, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x38
	bne _080B4680
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080B4680
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0
	bl GetMonData
	adds r1, r0, #0
	adds r0, r4, #0
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xfe
	bne _080B4658
	movs r4, #0
	b _080B465A
	.align 2, 0
_080B4650: .4byte 0x082F0D54
_080B4654: .4byte 0x02024190
_080B4658:
	movs r4, #0xfe
_080B465A:
	bl PickWildMonNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B467C
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0x20
	bl CreateMonWithGenderNatureLetter
	b _080B4698
	.align 2, 0
_080B467C: .4byte 0x020243E8
_080B4680:
	bl PickWildMonNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B46A0
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0x20
	bl CreateMonWithNature
_080B4698:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B46A0: .4byte 0x020243E8
	thumb_func_end CreateWildMon

	thumb_func_start TryGenerateWildMon
TryGenerateWildMon: @ 0x080B46A4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r4, r3, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r1, #0
	mov r0, sp
	strb r1, [r0]
	cmp r3, #1
	beq _080B46F8
	cmp r3, #1
	bgt _080B46C8
	cmp r3, #0
	beq _080B46CE
	b _080B4712
_080B46C8:
	cmp r4, #2
	beq _080B470A
	b _080B4712
_080B46CE:
	ldr r0, [r5, #4]
	movs r1, #8
	movs r2, #0x2a
	mov r3, sp
	bl TryGetAbilityInfluencedWildMonIndex
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B4712
	ldr r0, [r5, #4]
	movs r1, #0xd
	movs r2, #9
	mov r3, sp
	bl TryGetAbilityInfluencedWildMonIndex
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B4712
	bl ChooseWildMonIndex_Land
	b _080B470E
_080B46F8:
	ldr r0, [r5, #4]
	movs r1, #0xd
	movs r2, #9
	mov r3, sp
	bl TryGetAbilityInfluencedWildMonIndex
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B4712
_080B470A:
	bl ChooseWildMonIndex_WaterRock
_080B470E:
	mov r1, sp
	strb r0, [r1]
_080B4712:
	mov r0, sp
	ldrb r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r5, #4]
	adds r0, r0, r1
	bl ChooseWildMonLevel
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _080B4738
	adds r0, r4, #0
	bl IsWildLevelAllowedByRepel
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4758
_080B4738:
	ldr r0, _080B475C
	ldrh r1, [r0, #0x12]
	movs r0, #0xb3
	lsls r0, r0, #1
	cmp r1, r0
	beq _080B4760
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _080B4760
	adds r0, r4, #0
	bl IsAbilityAllowingEncounter
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B4760
_080B4758:
	movs r0, #0
	b _080B4774
	.align 2, 0
_080B475C: .4byte 0x02036FB8
_080B4760:
	mov r0, sp
	ldrb r0, [r0]
	ldr r1, [r5, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	adds r1, r4, #0
	bl CreateWildMon
	movs r0, #1
_080B4774:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end TryGenerateWildMon

	thumb_func_start GenerateFishingWildMon
GenerateFishingWildMon: @ 0x080B477C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl ChooseWildMonIndex_Fishing
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl ChooseWildMonLevel
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #4]
	adds r0, r4, r0
	ldrh r0, [r0, #2]
	bl CreateWildMon
	ldr r0, [r5, #4]
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GenerateFishingWildMon

	thumb_func_start SetUpMassOutbreakEncounter
SetUpMassOutbreakEncounter: @ 0x080B47B4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B47E4
	ldr r0, _080B47DC
	ldr r0, [r0]
	ldr r1, _080B47E0
	adds r0, r0, r1
	ldrb r0, [r0]
	bl IsWildLevelAllowedByRepel
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B47E4
	movs r0, #0
	b _080B481E
	.align 2, 0
_080B47DC: .4byte 0x03005AEC
_080B47E0: .4byte 0x00002B94
_080B47E4:
	ldr r0, _080B4824
	ldr r1, [r0]
	ldr r2, _080B4828
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, #4
	adds r1, r1, r2
	ldrb r1, [r1]
	bl CreateWildMon
	movs r4, #0
_080B47FA:
	ldr r0, _080B4824
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _080B482C
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _080B4830
	bl SetMonMoveSlot
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _080B47FA
	movs r0, #1
_080B481E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B4824: .4byte 0x03005AEC
_080B4828: .4byte 0x00002B90
_080B482C: .4byte 0x00002B98
_080B4830: .4byte 0x020243E8
	thumb_func_end SetUpMassOutbreakEncounter

	thumb_func_start DoMassOutbreakEncounterTest
DoMassOutbreakEncounterTest: @ 0x080B4834
	push {r4, lr}
	ldr r4, _080B4884
	ldr r2, [r4]
	ldr r1, _080B4888
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080B4894
	movs r1, #5
	ldrsb r1, [r2, r1]
	ldr r3, _080B488C
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _080B4894
	movs r1, #4
	ldrsb r1, [r2, r1]
	adds r3, #1
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _080B4894
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	ldr r1, [r4]
	ldr r2, _080B4890
	adds r1, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	bhs _080B4894
	movs r0, #1
	b _080B4896
	.align 2, 0
_080B4884: .4byte 0x03005AEC
_080B4888: .4byte 0x00002B90
_080B488C: .4byte 0x00002B92
_080B4890: .4byte 0x00002BA1
_080B4894:
	movs r0, #0
_080B4896:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DoMassOutbreakEncounterTest

	thumb_func_start DoWildEncounterRateDiceRoll
DoWildEncounterRateDiceRoll: @ 0x080B489C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xb4
	lsls r1, r1, #4
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	blo _080B48C0
	movs r0, #0
	b _080B48C2
_080B48C0:
	movs r0, #1
_080B48C2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DoWildEncounterRateDiceRoll

	thumb_func_start DoWildEncounterRateTest
DoWildEncounterRateTest: @ 0x080B48C8
	push {r4, lr}
	sub sp, #4
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #6
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B48F2
	ldr r1, [sp]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0x64
	bl __udivsi3
	str r0, [sp]
_080B48F2:
	mov r0, sp
	bl ApplyFluteEncounterRateMod
	mov r0, sp
	bl ApplyCleanseTagEncounterRateMod
	cmp r4, #0
	bne _080B496E
	ldr r4, _080B4934
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _080B496E
	adds r0, r4, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4940
	ldr r0, _080B4938
	ldrh r1, [r0, #0x12]
	ldr r0, _080B493C
	cmp r1, r0
	bne _080B4968
	ldr r1, [sp]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsrs r0, r0, #2
	b _080B496C
	.align 2, 0
_080B4934: .4byte 0x02024190
_080B4938: .4byte 0x02036FB8
_080B493C: .4byte 0x00000169
_080B4940:
	cmp r0, #0x23
	bne _080B494A
	ldr r0, [sp]
	lsls r0, r0, #1
	b _080B496C
_080B494A:
	cmp r0, #0x49
	beq _080B4968
	cmp r0, #0x47
	bne _080B4958
	ldr r0, [sp]
	lsls r0, r0, #1
	b _080B496C
_080B4958:
	cmp r0, #8
	bne _080B496E
	ldr r0, _080B4990
	ldr r0, [r0]
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #8
	bne _080B496E
_080B4968:
	ldr r0, [sp]
	lsrs r0, r0, #1
_080B496C:
	str r0, [sp]
_080B496E:
	ldr r0, [sp]
	movs r1, #0xb4
	lsls r1, r1, #4
	cmp r0, r1
	bls _080B497A
	str r1, [sp]
_080B497A:
	ldr r0, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl DoWildEncounterRateDiceRoll
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B4990: .4byte 0x03005AEC
	thumb_func_end DoWildEncounterRateTest

	thumb_func_start DoGlobalWildEncounterDiceRoll
DoGlobalWildEncounterDiceRoll: @ 0x080B4994
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3b
	bhi _080B49B0
	movs r0, #1
	b _080B49B2
_080B49B0:
	movs r0, #0
_080B49B2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DoGlobalWildEncounterDiceRoll

	thumb_func_start AreLegendariesInSootopolisPreventingEncounters
AreLegendariesInSootopolisPreventingEncounters: @ 0x080B49B8
	push {lr}
	ldr r0, _080B49D4
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xe0
	lsls r0, r0, #3
	cmp r1, r0
	bne _080B49D8
	movs r0, #0x53
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B49DA
	.align 2, 0
_080B49D4: .4byte 0x03005AEC
_080B49D8:
	movs r0, #0
_080B49DA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AreLegendariesInSootopolisPreventingEncounters

	thumb_func_start StandardWildEncounter
StandardWildEncounter: @ 0x080B49E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov sb, r6
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	mov r8, r7
	ldr r0, _080B4A78
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B49FE
	b _080B4C56
_080B49FE:
	bl GetCurrentMapWildMonHeaderId
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080B4A7C
	cmp r5, r0
	bne _080B4AF4
	ldr r0, _080B4A80
	ldrh r1, [r0, #0x12]
	movs r0, #0xb3
	lsls r0, r0, #1
	cmp r1, r0
	bne _080B4A88
	bl GetBattlePikeWildMonHeaderId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r7, r6
	beq _080B4A30
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B4A30
	b _080B4C56
_080B4A30:
	ldr r1, _080B4A84
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, #4
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	movs r1, #0
	bl DoWildEncounterRateTest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4A50
	b _080B4C56
_080B4A50:
	ldr r0, [r4]
	movs r1, #0
	movs r2, #2
	bl TryGenerateWildMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4A64
	b _080B4C56
_080B4A64:
	movs r0, #1
	bl TryGenerateBattlePikeWildMon
	cmp r0, #0
	bne _080B4A70
	b _080B4C56
_080B4A70:
	bl BattleSetup_StartBattlePikeWildBattle
	movs r0, #1
	b _080B4C58
	.align 2, 0
_080B4A78: .4byte 0x020388A0
_080B4A7C: .4byte 0x0000FFFF
_080B4A80: .4byte 0x02036FB8
_080B4A84: .4byte 0x0852E6C0
_080B4A88:
	ldr r0, _080B4AE4
	cmp r1, r0
	beq _080B4A90
	b _080B4C56
_080B4A90:
	ldr r0, _080B4AE8
	ldr r0, [r0]
	ldr r1, _080B4AEC
	adds r0, r0, r1
	ldrh r5, [r0]
	cmp r7, r6
	beq _080B4AAA
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B4AAA
	b _080B4C56
_080B4AAA:
	ldr r1, _080B4AF0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, #4
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	movs r1, #0
	bl DoWildEncounterRateTest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4ACA
	b _080B4C56
_080B4ACA:
	ldr r0, [r4]
	movs r1, #0
	movs r2, #2
	bl TryGenerateWildMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4ADE
	b _080B4C56
_080B4ADE:
	bl GenerateBattlePyramidWildMon
	b _080B4C4E
	.align 2, 0
_080B4AE4: .4byte 0x00000169
_080B4AE8: .4byte 0x03005AF0
_080B4AEC: .4byte 0x00000CB2
_080B4AF0: .4byte 0x0852E540
_080B4AF4:
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsLandWildEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4B94
	ldr r1, _080B4B90
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r4, r2, #0
	cmp r0, #0
	bne _080B4B1C
	b _080B4C56
_080B4B1C:
	cmp r7, r6
	beq _080B4B2C
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B4B2C
	b _080B4C56
_080B4B2C:
	ldr r1, _080B4B90
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	movs r1, #0
	bl DoWildEncounterRateTest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4B4A
	b _080B4C56
_080B4B4A:
	bl TryStartRoamerEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4C12
	bl DoMassOutbreakEncounterTest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4B70
	movs r0, #3
	bl SetUpMassOutbreakEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4C4E
_080B4B70:
	ldr r1, _080B4B90
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	movs r2, #3
	bl TryGenerateWildMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4C4E
	b _080B4C56
	.align 2, 0
_080B4B90: .4byte 0x0852D9F4
_080B4B94:
	adds r0, r4, #0
	bl MetatileBehavior_IsWaterWildEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4BBC
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4C56
	adds r0, r4, #0
	bl MetatileBehavior_IsBridge
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4C56
_080B4BBC:
	bl AreLegendariesInSootopolisPreventingEncounters
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4C56
	ldr r1, _080B4C30
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	adds r4, r2, #0
	cmp r0, #0
	beq _080B4C56
	cmp r8, sb
	beq _080B4BEA
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4C56
_080B4BEA:
	ldr r1, _080B4C30
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r1, #8
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	movs r1, #0
	bl DoWildEncounterRateTest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4C56
	bl TryStartRoamerEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4C3C
_080B4C12:
	ldr r0, _080B4C34
	ldr r0, [r0]
	ldr r1, _080B4C38
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	bl IsWildLevelAllowedByRepel
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4C56
	bl BattleSetup_StartRoamerBattle
	movs r0, #1
	b _080B4C58
	.align 2, 0
_080B4C30: .4byte 0x0852D9F4
_080B4C34: .4byte 0x03005AEC
_080B4C38: .4byte 0x000031DC
_080B4C3C:
	ldr r0, [r4]
	movs r1, #1
	movs r2, #3
	bl TryGenerateWildMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4C56
_080B4C4E:
	bl BattleSetup_StartWildBattle
	movs r0, #1
	b _080B4C58
_080B4C56:
	movs r0, #0
_080B4C58:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end StandardWildEncounter

	thumb_func_start RockSmashWildEncounter
RockSmashWildEncounter: @ 0x080B4C64
	push {r4, lr}
	bl GetCurrentMapWildMonHeaderId
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _080B4CB4
	cmp r2, r0
	beq _080B4CC0
	ldr r1, _080B4CB8
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #0xc
	adds r0, r0, r1
	ldr r4, [r0]
	cmp r4, #0
	beq _080B4CAC
	ldrb r0, [r4]
	movs r1, #1
	bl DoWildEncounterRateTest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4CC0
	adds r0, r4, #0
	movs r1, #2
	movs r2, #3
	bl TryGenerateWildMon
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _080B4CC0
	bl BattleSetup_StartWildBattle
_080B4CAC:
	ldr r0, _080B4CBC
	strh r4, [r0]
	b _080B4CC6
	.align 2, 0
_080B4CB4: .4byte 0x0000FFFF
_080B4CB8: .4byte 0x0852D9F4
_080B4CBC: .4byte 0x02037290
_080B4CC0:
	ldr r1, _080B4CCC
	movs r0, #0
	strh r0, [r1]
_080B4CC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4CCC: .4byte 0x02037290
	thumb_func_end RockSmashWildEncounter

	thumb_func_start SweetScentWildEncounter
SweetScentWildEncounter: @ 0x080B4CD0
	push {r4, r5, lr}
	sub sp, #4
	mov r5, sp
	adds r5, #2
	mov r0, sp
	adds r1, r5, #0
	bl PlayerGetDestCoords
	bl GetCurrentMapWildMonHeaderId
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080B4D30
	cmp r4, r0
	bne _080B4D84
	ldr r0, _080B4D34
	ldrh r1, [r0, #0x12]
	movs r0, #0xb3
	lsls r0, r0, #1
	cmp r1, r0
	bne _080B4D3C
	bl GetBattlePikeWildMonHeaderId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080B4D38
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0
	bl TryGenerateWildMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4D22
	b _080B4E4A
_080B4D22:
	movs r0, #0
	bl TryGenerateBattlePikeWildMon
	bl BattleSetup_StartBattlePikeWildBattle
	movs r0, #1
	b _080B4E4C
	.align 2, 0
_080B4D30: .4byte 0x0000FFFF
_080B4D34: .4byte 0x02036FB8
_080B4D38: .4byte 0x0852E6C0
_080B4D3C:
	ldr r0, _080B4D74
	cmp r1, r0
	beq _080B4D44
	b _080B4E4A
_080B4D44:
	ldr r0, _080B4D78
	ldr r0, [r0]
	ldr r1, _080B4D7C
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r1, _080B4D80
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0
	bl TryGenerateWildMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4E4A
	bl GenerateBattlePyramidWildMon
	b _080B4E42
	.align 2, 0
_080B4D74: .4byte 0x00000169
_080B4D78: .4byte 0x03005AF0
_080B4D7C: .4byte 0x00000CB2
_080B4D80: .4byte 0x0852E540
_080B4D84:
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsLandWildEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4DE4
	ldr r1, _080B4DD4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r4, [r0]
	cmp r4, #0
	beq _080B4E4A
	bl TryStartRoamerEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4E2C
	bl DoMassOutbreakEncounterTest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4DD8
	movs r0, #0
	bl SetUpMassOutbreakEncounter
	b _080B4E42
	.align 2, 0
_080B4DD4: .4byte 0x0852D9F4
_080B4DD8:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl TryGenerateWildMon
	b _080B4E42
_080B4DE4:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsWaterWildEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4E4A
	bl AreLegendariesInSootopolisPreventingEncounters
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B4E4A
	ldr r1, _080B4E34
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r4, [r0]
	cmp r4, #0
	beq _080B4E4A
	bl TryStartRoamerEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4E38
_080B4E2C:
	bl BattleSetup_StartRoamerBattle
	movs r0, #1
	b _080B4E4C
	.align 2, 0
_080B4E34: .4byte 0x0852D9F4
_080B4E38:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl TryGenerateWildMon
_080B4E42:
	bl BattleSetup_StartWildBattle
	movs r0, #1
	b _080B4E4C
_080B4E4A:
	movs r0, #0
_080B4E4C:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end SweetScentWildEncounter

	thumb_func_start DoesCurrentMapHaveFishingMons
DoesCurrentMapHaveFishingMons: @ 0x080B4E54
	push {lr}
	bl GetCurrentMapWildMonHeaderId
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _080B4E7C
	cmp r2, r0
	beq _080B4E84
	ldr r0, _080B4E80
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r0, #0x10
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080B4E84
	movs r0, #1
	b _080B4E86
	.align 2, 0
_080B4E7C: .4byte 0x0000FFFF
_080B4E80: .4byte 0x0852D9F4
_080B4E84:
	movs r0, #0
_080B4E86:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DoesCurrentMapHaveFishingMons

	thumb_func_start FishingWildEncounter
FishingWildEncounter: @ 0x080B4E8C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl CheckFeebas
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B4EBC
	ldr r4, _080B4EB8
	adds r0, r4, #0
	bl ChooseWildMonLevel
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r4, [r4, #2]
	adds r0, r4, #0
	bl CreateWildMon
	b _080B4EDC
	.align 2, 0
_080B4EB8: .4byte 0x0852E724
_080B4EBC:
	ldr r4, _080B4EF4
	bl GetCurrentMapWildMonHeaderId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, #0x10
	adds r1, r1, r4
	ldr r0, [r1]
	adds r1, r5, #0
	bl GenerateFishingWildMon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080B4EDC:
	movs r0, #0xc
	bl IncrementGameStat
	adds r0, r4, #0
	bl SetPokemonAnglerSpecies
	bl BattleSetup_StartWildBattle
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4EF4: .4byte 0x0852D9F4
	thumb_func_end FishingWildEncounter

	thumb_func_start GetLocalWildMon
GetLocalWildMon: @ 0x080B4EF8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	strb r0, [r6]
	bl GetCurrentMapWildMonHeaderId
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080B4F30
	cmp r3, r0
	beq _080B4F2A
	ldr r2, _080B4F34
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r5, [r0]
	adds r2, #8
	adds r1, r1, r2
	ldr r4, [r1]
	cmp r5, #0
	bne _080B4F38
	cmp r4, #0
	bne _080B4F3E
_080B4F2A:
	movs r0, #0
	b _080B4F7E
	.align 2, 0
_080B4F30: .4byte 0x0000FFFF
_080B4F34: .4byte 0x0852D9F4
_080B4F38:
	cmp r4, #0
	bne _080B4F4C
	b _080B4F70
_080B4F3E:
	movs r0, #1
	strb r0, [r6]
	bl ChooseWildMonIndex_WaterRock
	lsls r0, r0, #0x18
	ldr r1, [r4, #4]
	b _080B4F78
_080B4F4C:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4f
	bls _080B4F70
	movs r0, #1
	strb r0, [r6]
	bl ChooseWildMonIndex_WaterRock
	lsls r0, r0, #0x18
	ldr r1, [r4, #4]
	b _080B4F78
_080B4F70:
	bl ChooseWildMonIndex_Land
	lsls r0, r0, #0x18
	ldr r1, [r5, #4]
_080B4F78:
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0, #2]
_080B4F7E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetLocalWildMon

	thumb_func_start GetLocalWaterMon
GetLocalWaterMon: @ 0x080B4F84
	push {r4, lr}
	bl GetCurrentMapWildMonHeaderId
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _080B4FB8
	cmp r2, r0
	beq _080B4FC0
	ldr r1, _080B4FBC
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r4, [r0]
	cmp r4, #0
	beq _080B4FC0
	bl ChooseWildMonIndex_WaterRock
	lsls r0, r0, #0x18
	ldr r1, [r4, #4]
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	b _080B4FC2
	.align 2, 0
_080B4FB8: .4byte 0x0000FFFF
_080B4FBC: .4byte 0x0852D9F4
_080B4FC0:
	movs r0, #0
_080B4FC2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLocalWaterMon

	thumb_func_start UpdateRepelCounter
UpdateRepelCounter: @ 0x080B4FC8
	push {r4, r5, lr}
	bl InBattlePike
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B501C
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B501C
	bl InUnionRoom
	cmp r0, #1
	beq _080B501C
	ldr r5, _080B5014
	adds r0, r5, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080B501C
	subs r4, r0, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl VarSet
	cmp r4, #0
	bne _080B501C
	ldr r0, _080B5018
	bl ScriptContext1_SetupScript
	movs r0, #1
	b _080B501E
	.align 2, 0
_080B5014: .4byte 0x00004021
_080B5018: .4byte 0x08262393
_080B501C:
	movs r0, #0
_080B501E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end UpdateRepelCounter

	thumb_func_start IsWildLevelAllowedByRepel
IsWildLevelAllowedByRepel: @ 0x080B5024
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080B5070
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080B506A
	movs r5, #0
_080B5038:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _080B5074
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080B5078
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _080B5078
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	blo _080B5082
_080B506A:
	movs r0, #1
	b _080B5084
	.align 2, 0
_080B5070: .4byte 0x00004021
_080B5074: .4byte 0x02024190
_080B5078:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _080B5038
_080B5082:
	movs r0, #0
_080B5084:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsWildLevelAllowedByRepel

	thumb_func_start IsAbilityAllowingEncounter
IsAbilityAllowingEncounter: @ 0x080B508C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _080B50DC
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _080B50E0
	adds r0, r4, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x33
	beq _080B50B2
	cmp r0, #0x16
	bne _080B50E0
_080B50B2:
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _080B50E0
	subs r0, #5
	cmp r5, r0
	bgt _080B50E0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080B50E0
	movs r0, #0
	b _080B50E2
	.align 2, 0
_080B50DC: .4byte 0x02024190
_080B50E0:
	movs r0, #1
_080B50E2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsAbilityAllowingEncounter

	thumb_func_start TryGetRandomWildMonIndexByType
TryGetRandomWildMonIndexByType: @ 0x080B50E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r7, sp
	mov ip, r0
	mov r8, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [r7]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, sp
	adds r0, r2, #3
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r1, sp
	subs r1, r1, r0
	mov sp, r1
	mov r5, sp
	movs r3, #0
	cmp r3, r2
	bhs _080B512A
	movs r1, #0
_080B511C:
	adds r0, r5, r3
	strb r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _080B511C
_080B512A:
	movs r4, #0
	movs r3, #0
	cmp r4, r2
	bhs _080B516A
	ldr r6, _080B5178
	mov sl, r6
_080B5136:
	lsls r0, r3, #2
	add r0, ip
	ldrh r1, [r0, #2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r6, sl
	adds r1, r0, r6
	ldrb r0, [r1, #6]
	ldr r6, [r7]
	cmp r0, r6
	beq _080B5154
	ldrb r0, [r1, #7]
	cmp r0, r6
	bne _080B5160
_080B5154:
	adds r1, r4, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r1, r5, r1
	strb r3, [r1]
_080B5160:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _080B5136
_080B516A:
	cmp r4, #0
	beq _080B5172
	cmp r4, r2
	bne _080B517C
_080B5172:
	movs r0, #0
	b _080B5194
	.align 2, 0
_080B5178: .4byte 0x082F0D54
_080B517C:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	adds r0, r5, r0
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	movs r0, #1
_080B5194:
	mov sp, sb
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryGetRandomWildMonIndexByType

	thumb_func_start TryGetAbilityInfluencedWildMonIndex
TryGetAbilityInfluencedWildMonIndex: @ 0x080B51A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r3
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r4, _080B51F8
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _080B51FC
	adds r0, r4, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	bne _080B51FC
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080B51FC
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0xc
	mov r3, r8
	bl TryGetRandomWildMonIndexByType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B51FE
	.align 2, 0
_080B51F8: .4byte 0x02024190
_080B51FC:
	movs r0, #0
_080B51FE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end TryGetAbilityInfluencedWildMonIndex

	thumb_func_start ApplyFluteEncounterRateMod
ApplyFluteEncounterRateMod: @ 0x080B5208
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B5224
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B5228
	ldr r0, [r4]
	lsrs r1, r0, #1
	adds r0, r0, r1
	b _080B523A
	.align 2, 0
_080B5224: .4byte 0x000008AD
_080B5228:
	ldr r0, _080B5244
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B523C
	ldr r0, [r4]
	lsrs r0, r0, #1
_080B523A:
	str r0, [r4]
_080B523C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5244: .4byte 0x000008AE
	thumb_func_end ApplyFluteEncounterRateMod

	thumb_func_start ApplyCleanseTagEncounterRateMod
ApplyCleanseTagEncounterRateMod: @ 0x080B5248
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B526C
	movs r1, #0xc
	bl GetMonData
	cmp r0, #0xbe
	bne _080B5264
	ldr r0, [r4]
	lsls r0, r0, #1
	movs r1, #3
	bl __udivsi3
	str r0, [r4]
_080B5264:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B526C: .4byte 0x02024190
	thumb_func_end ApplyCleanseTagEncounterRateMod

