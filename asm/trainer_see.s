.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CheckForTrainersWantingBattle
CheckForTrainersWantingBattle: @ 0x080B3340
	push {r4, r5, r6, r7, lr}
	ldr r0, _080B33CC
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080B33D0
	strb r1, [r0]
	movs r4, #0
	ldr r6, _080B33D4
_080B3350:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r6
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080B3390
	ldrb r0, [r1, #7]
	cmp r0, #1
	beq _080B336A
	cmp r0, #3
	bne _080B3390
_080B336A:
	adds r0, r4, #0
	bl CheckTrainer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080B339A
	cmp r0, #0
	beq _080B3390
	ldr r0, _080B33CC
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #1
	bhi _080B33E0
	bl GetMonsStateToDoubles_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B339A
_080B3390:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _080B3350
_080B339A:
	ldr r0, _080B33CC
	ldrb r4, [r0]
	adds r5, r0, #0
	cmp r4, #1
	bne _080B33E0
	bl ResetTrainerOpponentIds
	ldr r2, _080B33D8
	ldrb r0, [r5]
	subs r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	bl ConfigureAndSetUpOneTrainerBattle
	ldr r0, _080B33DC
	strb r4, [r0]
	movs r0, #1
	b _080B344C
	.align 2, 0
_080B33CC: .4byte 0x03005E08
_080B33D0: .4byte 0x0203889C
_080B33D4: .4byte 0x02036FF0
_080B33D8: .4byte 0x03005DF0
_080B33DC: .4byte 0x03005E0C
_080B33E0:
	ldrb r0, [r5]
	cmp r0, #2
	bne _080B3444
	bl ResetTrainerOpponentIds
	movs r4, #0
	ldrb r5, [r5]
	cmp r4, r5
	bhs _080B341E
	ldr r6, _080B3434
	adds r7, r6, #4
	ldr r5, _080B3438
_080B33F8:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, r1, r6
	ldrb r0, [r0]
	adds r1, r1, r7
	ldr r1, [r1]
	bl ConfigureTwoTrainersBattle
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _080B343C
	ldrb r0, [r0]
	cmp r4, r0
	blo _080B33F8
_080B341E:
	bl SetUpTwoTrainersBattle
	ldr r1, _080B3438
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080B3440
	movs r0, #1
	strb r0, [r1]
	movs r0, #1
	b _080B344C
	.align 2, 0
_080B3434: .4byte 0x03005DF0
_080B3438: .4byte 0x0203889C
_080B343C: .4byte 0x03005E08
_080B3440: .4byte 0x03005E0C
_080B3444:
	ldr r1, _080B3454
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
_080B344C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B3454: .4byte 0x03005E0C
	thumb_func_end CheckForTrainersWantingBattle

	thumb_func_start CheckTrainer
CheckTrainer: @ 0x080B3458
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #1
	mov sb, r0
	bl InTrainerHill
	cmp r0, #1
	bne _080B3476
	bl GetTrainerHillTrainerScript
	b _080B347C
_080B3476:
	adds r0, r5, #0
	bl GetEventObjectScriptPointerByEventObjectId
_080B347C:
	adds r7, r0, #0
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3496
	adds r0, r5, #0
	bl GetBattlePyramidTrainerFlag
_080B348E:
	lsls r0, r0, #0x18
_080B3490:
	cmp r0, #0
	beq _080B34AE
	b _080B3538
_080B3496:
	bl InTrainerHill
	cmp r0, #1
	bne _080B34A6
	adds r0, r5, #0
	bl GetHillTrainerFlag
	b _080B348E
_080B34A6:
	adds r0, r7, #0
	bl GetTrainerFlagFromScriptPointer
	b _080B3490
_080B34AE:
	lsls r4, r5, #3
	adds r0, r4, r5
	lsls r0, r0, #2
	ldr r1, _080B352C
	adds r0, r0, r1
	bl GetTrainerApproachDistance
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r8, r4
	cmp r6, #0
	beq _080B3538
	ldrb r0, [r7, #1]
	cmp r0, #4
	beq _080B34D4
	cmp r0, #7
	beq _080B34D4
	cmp r0, #6
	bne _080B34E2
_080B34D4:
	bl GetMonsStateToDoubles_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B3538
	movs r1, #2
	mov sb, r1
_080B34E2:
	ldr r2, _080B3530
	ldr r4, _080B3534
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r5, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #4
	adds r0, r0, r1
	str r7, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r6, [r0, #1]
	mov r1, r8
	adds r0, r1, r5
	lsls r0, r0, #2
	ldr r1, _080B352C
	adds r0, r0, r1
	subs r1, r6, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl TrainerApproachPlayer
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	mov r0, sb
	b _080B353A
	.align 2, 0
_080B352C: .4byte 0x02036FF0
_080B3530: .4byte 0x03005DF0
_080B3534: .4byte 0x03005E08
_080B3538:
	movs r0, #0
_080B353A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckTrainer

	thumb_func_start GetTrainerApproachDistance
GetTrainerApproachDistance: @ 0x080B3548
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	ldrb r0, [r7, #7]
	mov r8, r4
	cmp r0, #1
	bne _080B35A8
	ldr r1, _080B35A0
	ldrb r0, [r7, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1a
	subs r0, #4
	adds r0, r0, r1
	ldrb r1, [r7, #0x1d]
	mov r2, sp
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r4, [r0]
	adds r0, r7, #0
	bl _call_via_r4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r2, [r7, #0x18]
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x1c
	adds r0, r7, #0
	adds r1, r6, #0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B35E8
	.align 2, 0
_080B35A0: .4byte 0x0852B3D8
_080B35A4:
	adds r0, r6, #0
	b _080B35E8
_080B35A8:
	movs r5, #0
_080B35AA:
	ldr r0, _080B35F4
	lsls r4, r5, #2
	adds r4, r4, r0
	ldrb r1, [r7, #0x1d]
	mov r0, sp
	movs r6, #0
	ldrsh r2, [r0, r6]
	mov r0, r8
	movs r6, #0
	ldrsh r3, [r0, r6]
	ldr r4, [r4]
	adds r0, r7, #0
	bl _call_via_r4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B35A4
	adds r5, r4, #0
	cmp r5, #3
	bls _080B35AA
	movs r0, #0
_080B35E8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B35F4: .4byte 0x0852B3D8
	thumb_func_end GetTrainerApproachDistance

	thumb_func_start GetTrainerApproachDistanceSouth
GetTrainerApproachDistanceSouth: @ 0x080B35F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r0, r2
	bne _080B3632
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	ldrh r3, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r2, r0
	ble _080B3632
	adds r1, r0, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	cmp r2, r1
	bgt _080B3632
	subs r0, r5, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B3634
_080B3632:
	movs r0, #0
_080B3634:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetTrainerApproachDistanceSouth

	thumb_func_start GetTrainerApproachDistanceNorth
GetTrainerApproachDistanceNorth: @ 0x080B363C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r0, r2
	bne _080B3676
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	ldrh r3, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r2, r0
	bge _080B3676
	adds r1, r0, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	cmp r2, r1
	blt _080B3676
	subs r0, r3, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B3678
_080B3676:
	movs r0, #0
_080B3678:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetTrainerApproachDistanceNorth

	thumb_func_start GetTrainerApproachDistanceWest
GetTrainerApproachDistanceWest: @ 0x080B3680
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	cmp r0, r3
	bne _080B36BA
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	ldrh r2, [r4, #0x10]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080B36BA
	adds r1, r0, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	cmp r3, r1
	blt _080B36BA
	subs r0, r2, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B36BC
_080B36BA:
	movs r0, #0
_080B36BC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetTrainerApproachDistanceWest

	thumb_func_start GetTrainerApproachDistanceEast
GetTrainerApproachDistanceEast: @ 0x080B36C4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	cmp r0, r3
	bne _080B36FE
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	ldrh r2, [r4, #0x10]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _080B36FE
	adds r1, r0, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	cmp r3, r1
	bgt _080B36FE
	subs r0, r5, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B3700
_080B36FE:
	movs r0, #0
_080B3700:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetTrainerApproachDistanceEast

	thumb_func_start CheckPathBetweenTrainerAndPlayer
CheckPathBetweenTrainerAndPlayer: @ 0x080B3708
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	cmp r1, #0
	beq _080B37AE
	ldrh r1, [r6, #0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, #0x12]
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	adds r0, r7, #0
	mov r1, sp
	adds r2, r4, #0
	bl MoveCoords
	movs r5, #0
	mov r8, r4
	mov r4, sb
	subs r4, #1
	cmp r5, r4
	bge _080B3780
_080B3746:
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, #0
	ldrsh r2, [r3, r0]
	adds r0, r6, #0
	adds r3, r7, #0
	bl GetCollisionFlagsAtCoords
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080B376C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	cmp r1, #0
	bne _080B37AE
_080B376C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, #0
	mov r1, sp
	mov r2, r8
	bl MoveCoords
	cmp r5, r4
	blt _080B3746
_080B3780:
	ldrb r4, [r6, #0x19]
	lsls r5, r4, #0x1c
	lsrs r5, r5, #0x1c
	lsrs r4, r4, #4
	movs r0, #0
	strb r0, [r6, #0x19]
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, #0
	ldrsh r2, [r3, r0]
	adds r0, r6, #0
	adds r3, r7, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r4, r4, #4
	orrs r5, r4
	strb r5, [r6, #0x19]
	cmp r1, #4
	beq _080B37B2
_080B37AE:
	movs r0, #0
	b _080B37B4
_080B37B2:
	mov r0, sb
_080B37B4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckPathBetweenTrainerAndPlayer

	thumb_func_start TrainerApproachPlayer
TrainerApproachPlayer: @ 0x080B37C4
	push {r4, r5, lr}
	lsls r5, r1, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080B3810
	movs r1, #0x50
	bl CreateTask
	ldr r4, _080B3814
	ldr r3, _080B3818
	ldrb r2, [r3]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	strb r0, [r1, #8]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #8]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B381C
	adds r1, r1, r0
	strh r5, [r1, #0xe]
	ldrb r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	strh r0, [r1, #0x16]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3810: .4byte 0x080B3871
_080B3814: .4byte 0x03005DF0
_080B3818: .4byte 0x03005E08
_080B381C: .4byte 0x03005B60
	thumb_func_end TrainerApproachPlayer

	thumb_func_start sub_080B3820
sub_080B3820: @ 0x080B3820
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, _080B3834
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B383C
	ldr r0, _080B3838
	ldrb r5, [r0, #8]
	b _080B3840
	.align 2, 0
_080B3834: .4byte 0x0203889C
_080B3838: .4byte 0x03005DF0
_080B383C:
	ldr r0, _080B3864
	ldrb r5, [r0, #0x14]
_080B3840:
	ldr r4, _080B3868
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _080B386C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #8]
	adds r0, r5, #0
	bl _call_via_r4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3864: .4byte 0x03005DF0
_080B3868: .4byte 0x080B3871
_080B386C: .4byte 0x03005B60
	thumb_func_end sub_080B3820

	thumb_func_start Task_RunTrainerSeeFuncList
Task_RunTrainerSeeFuncList: @ 0x080B3870
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _080B38A0
	adds r4, r0, r1
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B38A4
	adds r5, r0, r1
	ldrb r0, [r5]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080B38A8
	adds r0, r6, #0
	bl SwitchTaskToFollowupFunc
	b _080B38C4
	.align 2, 0
_080B38A0: .4byte 0x03005B60
_080B38A4: .4byte 0x02036FF0
_080B38A8:
	ldr r7, _080B38CC
_080B38AA:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B38AA
_080B38C4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B38CC: .4byte 0x0852B3E8
	thumb_func_end Task_RunTrainerSeeFuncList

	thumb_func_start sub_080B38D0
sub_080B38D0: @ 0x080B38D0
	movs r0, #0
	bx lr
	thumb_func_end sub_080B38D0

	thumb_func_start TrainerExclamationMark
TrainerExclamationMark: @ 0x080B38D4
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r1, _080B3914
	adds r2, r1, #4
	adds r3, r1, #0
	adds r3, #8
	adds r0, r4, #0
	bl EventObjectGetLocalIdAndMap
	movs r0, #0
	bl FieldEffectStart
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B3914: .4byte 0x020388A8
	thumb_func_end TrainerExclamationMark

	thumb_func_start WaitTrainerExclamationMark
WaitTrainerExclamationMark: @ 0x080B3918
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B392E
	movs r0, #0
	b _080B3950
_080B392E:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldrb r0, [r5, #6]
	subs r0, #0x39
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080B3944
	movs r0, #6
	strh r0, [r4, #8]
_080B3944:
	ldrb r0, [r5, #6]
	cmp r0, #0x3f
	bne _080B394E
	movs r0, #8
	strh r0, [r4, #8]
_080B394E:
	movs r0, #1
_080B3950:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WaitTrainerExclamationMark

	thumb_func_start TrainerMoveToPlayer
TrainerMoveToPlayer: @ 0x080B3958
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3976
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B39AA
_080B3976:
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080B399C
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CF8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #0xe]
	subs r0, #1
	strh r0, [r5, #0xe]
	b _080B39AA
_080B399C:
	adds r0, r4, #0
	movs r1, #0x3e
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_080B39AA:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TrainerMoveToPlayer

	thumb_func_start PlayerFaceApproachingTrainer
PlayerFaceApproachingTrainer: @ 0x080B39B4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B39D2
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3A60
_080B39D2:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GroundEffect_DeepSandTracks
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl SetTrainerMovementType
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GroundEffect_DeepSandTracks
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl TryOverrideTemplateCoordsForEventObject
	adds r0, r5, #0
	bl OverrideTemplateCoordsForEventObject
	ldr r0, _080B3A68
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B3A6C
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3A2A
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3A60
_080B3A2A:
	bl sub_0808B64C
	ldr r0, _080B3A68
	ldrb r0, [r0, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B3A6C
	adds r4, r4, r0
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetOppositeDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
_080B3A60:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B3A68: .4byte 0x02037230
_080B3A6C: .4byte 0x02036FF0
	thumb_func_end PlayerFaceApproachingTrainer

	thumb_func_start WaitPlayerFaceApproachingTrainer
WaitPlayerFaceApproachingTrainer: @ 0x080B3A70
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080B3AAC
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B3AB0
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3A9C
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3AA2
_080B3A9C:
	adds r0, r5, #0
	bl SwitchTaskToFollowupFunc
_080B3AA2:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B3AAC: .4byte 0x02037230
_080B3AB0: .4byte 0x02036FF0
	thumb_func_end WaitPlayerFaceApproachingTrainer

	thumb_func_start RevealDisguisedTrainer
RevealDisguisedTrainer: @ 0x080B3AB4
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3AD2
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3AE0
_080B3AD2:
	adds r0, r4, #0
	movs r1, #0x59
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_080B3AE0:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end RevealDisguisedTrainer

	thumb_func_start WaitRevealDisguisedTrainer
WaitRevealDisguisedTrainer: @ 0x080B3AE8
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r2, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3AFC
	movs r0, #3
	strh r0, [r4, #8]
_080B3AFC:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end WaitRevealDisguisedTrainer

	thumb_func_start RevealHiddenTrainer
RevealHiddenTrainer: @ 0x080B3B04
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3B22
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3B30
_080B3B22:
	adds r0, r4, #0
	movs r1, #0x3e
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_080B3B30:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end RevealHiddenTrainer

	thumb_func_start PopOutOfAshHiddenTrainer
PopOutOfAshHiddenTrainer: @ 0x080B3B38
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3B7E
	ldr r2, _080B3B88
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, #4]
	ldr r3, _080B3B8C
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x43
	ldrb r0, [r0]
	subs r0, #1
	str r0, [r2, #8]
	movs r0, #2
	str r0, [r2, #0xc]
	movs r0, #0x31
	bl FieldEffectStart
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_080B3B7E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B3B88: .4byte 0x020388A8
_080B3B8C: .4byte 0x020205AC
	thumb_func_end PopOutOfAshHiddenTrainer

	thumb_func_start JumpInPlaceHiddenTrainer
JumpInPlaceHiddenTrainer: @ 0x080B3B90
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r2, _080B3C00
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #2
	bne _080B3BF8
	ldrb r1, [r4, #3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #5]
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092E2C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_080B3BF8:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B3C00: .4byte 0x020205AC
	thumb_func_end JumpInPlaceHiddenTrainer

	thumb_func_start WaitRevealHiddenTrainer
WaitRevealHiddenTrainer: @ 0x080B3C04
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x31
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B3C18
	movs r0, #3
	strh r0, [r4, #8]
_080B3C18:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end WaitRevealHiddenTrainer

	thumb_func_start sub_080B3C20
sub_080B3C20: @ 0x080B3C20
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080B3CB4
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0xa
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B3C52
	ldr r0, [sp]
	bl EventObjectClearHeldMovement
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
_080B3C52:
	ldr r1, _080B3CB8
	movs r2, #8
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [sp]
	ldr r3, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r3
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne _080B3CBC
	movs r0, #0x31
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B3CBC
	ldr r4, [sp]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GroundEffect_DeepSandTracks
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetTrainerMovementType
	ldr r4, [sp]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GroundEffect_DeepSandTracks
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl TryOverrideTemplateCoordsForEventObject
	adds r0, r5, #0
	bl DestroyTask
	b _080B3CC6
	.align 2, 0
_080B3CB4: .4byte 0x03005B60
_080B3CB8: .4byte 0x0852B418
_080B3CBC:
	ldr r2, [sp]
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_080B3CC6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B3C20

	thumb_func_start sub_080B3CD0
sub_080B3CD0: @ 0x080B3CD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B3CFC
	movs r1, #0
	bl CreateTask
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _080B3D00
	adds r0, r0, r1
	adds r0, #2
	adds r1, r4, #0
	bl StoreWordInTwoHalfwords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3CFC: .4byte 0x080B3C21
_080B3D00: .4byte 0x03005B68
	thumb_func_end sub_080B3CD0

	thumb_func_start EndTrainerApproach
EndTrainerApproach: @ 0x080B3D04
	push {lr}
	ldr r0, _080B3D10
	bl sub_080B3820
	pop {r0}
	bx r0
	.align 2, 0
_080B3D10: .4byte 0x080B3D15
	thumb_func_end EndTrainerApproach

	thumb_func_start Task_DestroyTrainerApproachTask
Task_DestroyTrainerApproachTask: @ 0x080B3D14
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_DestroyTrainerApproachTask

	thumb_func_start TryPrepareSecondApproachingTrainer
TryPrepareSecondApproachingTrainer: @ 0x080B3D28
	push {lr}
	ldr r0, _080B3D54
	ldrb r0, [r0]
	cmp r0, #2
	bne _080B3D68
	ldr r1, _080B3D58
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B3D64
	adds r0, #1
	strb r0, [r1]
	ldr r1, _080B3D5C
	movs r0, #1
	strh r0, [r1]
	bl UnfreezeEventObjects
	ldr r0, _080B3D60
	ldrb r0, [r0, #0xc]
	bl FreezeEventObjectsExceptOne
	b _080B3D6E
	.align 2, 0
_080B3D54: .4byte 0x03005E08
_080B3D58: .4byte 0x0203889C
_080B3D5C: .4byte 0x02037290
_080B3D60: .4byte 0x03005DF0
_080B3D64:
	movs r0, #0
	strb r0, [r1]
_080B3D68:
	ldr r1, _080B3D74
	movs r0, #0
	strh r0, [r1]
_080B3D6E:
	pop {r0}
	bx r0
	.align 2, 0
_080B3D74: .4byte 0x02037290
	thumb_func_end TryPrepareSecondApproachingTrainer

	thumb_func_start FldEff_ExclamationMarkIcon
FldEff_ExclamationMarkIcon: @ 0x080B3D78
	push {lr}
	ldr r0, _080B3DA8
	movs r1, #0
	movs r2, #0
	movs r3, #0x53
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _080B3DA0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B3DAC
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0
	bl SetIconSpriteData
_080B3DA0:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080B3DA8: .4byte 0x0852B460
_080B3DAC: .4byte 0x020205AC
	thumb_func_end FldEff_ExclamationMarkIcon

	thumb_func_start FldEff_QuestionMarkIcon
FldEff_QuestionMarkIcon: @ 0x080B3DB0
	push {lr}
	ldr r0, _080B3DE0
	movs r1, #0
	movs r2, #0
	movs r3, #0x52
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _080B3DD8
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B3DE4
	adds r0, r0, r1
	movs r1, #0x21
	movs r2, #1
	bl SetIconSpriteData
_080B3DD8:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080B3DE0: .4byte 0x0852B460
_080B3DE4: .4byte 0x020205AC
	thumb_func_end FldEff_QuestionMarkIcon

	thumb_func_start FldEff_HeartIcon
FldEff_HeartIcon: @ 0x080B3DE8
	push {r4, lr}
	ldr r0, _080B3E28
	movs r1, #0
	movs r2, #0
	movs r3, #0x52
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _080B3E1E
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B3E2C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x2e
	movs r2, #0
	bl SetIconSpriteData
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4, #5]
_080B3E1E:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B3E28: .4byte 0x0852B478
_080B3E2C: .4byte 0x020205AC
	thumb_func_end FldEff_HeartIcon

	thumb_func_start SetIconSpriteData
SetIconSpriteData: @ 0x080B3E30
	push {r4, lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r4, [r0, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r3, r4
	movs r4, #4
	orrs r3, r4
	strb r3, [r0, #5]
	movs r3, #0x3e
	adds r3, r3, r0
	mov ip, r3
	ldrb r3, [r3]
	movs r4, #2
	orrs r3, r4
	mov r4, ip
	strb r3, [r4]
	ldr r4, _080B3E74
	ldr r3, [r4]
	strh r3, [r0, #0x2e]
	ldr r3, [r4, #4]
	strh r3, [r0, #0x30]
	ldr r3, [r4, #8]
	strh r3, [r0, #0x32]
	ldr r3, _080B3E78
	strh r3, [r0, #0x34]
	strh r1, [r0, #0x3c]
	adds r1, r2, #0
	bl StartSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E74: .4byte 0x020388A8
_080B3E78: .4byte 0x0000FFFB
	thumb_func_end SetIconSpriteData

	thumb_func_start SpriteCB_TrainerIcons
SpriteCB_TrainerIcons: @ 0x080B3E7C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x32]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B3EAE
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B3EBC
_080B3EAE:
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl FieldEffectStop
	b _080B3F0A
_080B3EBC:
	ldr r2, _080B3F00
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080B3F04
	adds r1, r1, r0
	ldrh r3, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	adds r2, r3, r0
	strh r2, [r4, #0x36]
	ldrh r0, [r1, #0x20]
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #0x22]
	subs r0, #0x10
	strh r0, [r4, #0x22]
	ldrh r0, [r1, #0x24]
	strh r0, [r4, #0x24]
	ldrh r0, [r1, #0x26]
	adds r0, r0, r2
	strh r0, [r4, #0x26]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0
	beq _080B3F08
	adds r0, r3, #1
	strh r0, [r4, #0x34]
	b _080B3F0A
	.align 2, 0
_080B3F00: .4byte 0x02036FF0
_080B3F04: .4byte 0x020205AC
_080B3F08:
	strh r2, [r4, #0x34]
_080B3F0A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_TrainerIcons

	thumb_func_start GetCurrentApproachingTrainerEventObjectId
GetCurrentApproachingTrainerEventObjectId: @ 0x080B3F14
	push {lr}
	ldr r0, _080B3F24
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B3F2C
	ldr r0, _080B3F28
	ldrb r0, [r0, #0xc]
	b _080B3F30
	.align 2, 0
_080B3F24: .4byte 0x0203889C
_080B3F28: .4byte 0x03005DF0
_080B3F2C:
	ldr r0, _080B3F34
	ldrb r0, [r0]
_080B3F30:
	pop {r1}
	bx r1
	.align 2, 0
_080B3F34: .4byte 0x03005DF0
	thumb_func_end GetCurrentApproachingTrainerEventObjectId

	thumb_func_start GetChosenApproachingTrainerEventObjectId
GetChosenApproachingTrainerEventObjectId: @ 0x080B3F38
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080B3F46
	movs r0, #0
	b _080B3F58
_080B3F46:
	cmp r0, #0
	beq _080B3F54
	ldr r0, _080B3F50
	ldrb r0, [r0, #0xc]
	b _080B3F58
	.align 2, 0
_080B3F50: .4byte 0x03005DF0
_080B3F54:
	ldr r0, _080B3F5C
	ldrb r0, [r0]
_080B3F58:
	pop {r1}
	bx r1
	.align 2, 0
_080B3F5C: .4byte 0x03005DF0
	thumb_func_end GetChosenApproachingTrainerEventObjectId

	thumb_func_start sub_080B3F60
sub_080B3F60: @ 0x080B3F60
	push {lr}
	ldr r0, _080B3FB0
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B3FC8
	ldr r2, _080B3FB4
	ldr r0, _080B3FB8
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B3FBC
	adds r0, r0, r1
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetOppositeDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092CA0
	ldr r3, _080B3FC0
	strb r0, [r3]
	movs r0, #0xfe
	strb r0, [r3, #1]
	ldr r0, _080B3FC4
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r0, #0xff
	bl ScriptMovement_StartObjectMovementScript
	b _080B3FF6
	.align 2, 0
_080B3FB0: .4byte 0x03005E0C
_080B3FB4: .4byte 0x03005DF0
_080B3FB8: .4byte 0x03005DE0
_080B3FBC: .4byte 0x02036FF0
_080B3FC0: .4byte 0x03005DE4
_080B3FC4: .4byte 0x03005AEC
_080B3FC8:
	ldr r0, _080B4000
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B4004
	adds r0, r0, r1
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	ldr r3, _080B4008
	strb r0, [r3]
	movs r0, #0xfe
	strb r0, [r3, #1]
	ldr r0, _080B400C
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r0, #0xff
	bl ScriptMovement_StartObjectMovementScript
_080B3FF6:
	movs r0, #0xff
	bl sub_0809B720
	pop {r0}
	bx r0
	.align 2, 0
_080B4000: .4byte 0x02037230
_080B4004: .4byte 0x02036FF0
_080B4008: .4byte 0x03005DE4
_080B400C: .4byte 0x03005AEC
	thumb_func_end sub_080B3F60

