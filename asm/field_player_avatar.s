.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start MovementType_Player
MovementType_Player: @ 0x0808A2FC
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808A318
	adds r0, r0, r2
	ldr r2, _0808A31C
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808A318: .4byte 0x02036FF0
_0808A31C: .4byte 0x0808A321
	thumb_func_end MovementType_Player

	thumb_func_start EventObjectCB2_NoMovement2
EventObjectCB2_NoMovement2: @ 0x0808A320
	movs r0, #0
	bx lr
	thumb_func_end EventObjectCB2_NoMovement2

	thumb_func_start player_step
player_step: @ 0x0808A324
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r4, _0808A394
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808A398
	adds r5, r0, r1
	adds r0, r5, #0
	bl sub_0808BBE4
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0808A38A
	adds r0, r7, #0
	adds r1, r6, #0
	bl Bike_TryAcroBikeHistoryUpdate
	adds r0, r5, #0
	mov r1, r8
	bl TryInterruptEventObjectSpecialAnim
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A38A
	adds r0, r5, #0
	bl npc_clear_strange_bits
	bl DoPlayerAvatarTransition
	bl TryDoMetatileBehaviorForcedMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A38A
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	bl MovePlayerAvatarUsingKeypadInput
	bl PlayerAllowForcedMovementIfMovingSameDirection
_0808A38A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A394: .4byte 0x02037230
_0808A398: .4byte 0x02036FF0
	thumb_func_end player_step

	thumb_func_start TryInterruptEventObjectSpecialAnim
TryInterruptEventObjectSpecialAnim: @ 0x0808A39C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r6, r5, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A3F6
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A3F6
	adds r0, r4, #0
	bl EventObjectGetHeldMovementActionId
	lsls r0, r0, #0x18
	movs r1, #0xe7
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _0808A3D4
	cmp r5, #0
	bne _0808A3D8
_0808A3D4:
	movs r0, #1
	b _0808A3F8
_0808A3D8:
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	cmp r0, r5
	beq _0808A3E8
_0808A3E0:
	adds r0, r4, #0
	bl EventObjectClearHeldMovement
	b _0808A3F6
_0808A3E8:
	adds r0, r6, #0
	bl sub_0808A98C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A3E0
	b _0808A3D4
_0808A3F6:
	movs r0, #0
_0808A3F8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryInterruptEventObjectSpecialAnim

	thumb_func_start npc_clear_strange_bits
npc_clear_strange_bits: @ 0x0808A400
	ldrb r2, [r0, #1]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	adds r2, #2
	ands r1, r2
	strb r1, [r0, #1]
	ldr r2, _0808A420
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0808A420: .4byte 0x02037230
	thumb_func_end npc_clear_strange_bits

	thumb_func_start MovePlayerAvatarUsingKeypadInput
MovePlayerAvatarUsingKeypadInput: @ 0x0808A424
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _0808A448
	ldrb r1, [r0]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0808A44C
	adds r0, r3, #0
	adds r1, r4, #0
	bl MovePlayerOnBike
	b _0808A454
	.align 2, 0
_0808A448: .4byte 0x02037230
_0808A44C:
	adds r0, r3, #0
	adds r1, r2, #0
	bl MovePlayerNotOnBike
_0808A454:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MovePlayerAvatarUsingKeypadInput

	thumb_func_start PlayerAllowForcedMovementIfMovingSameDirection
PlayerAllowForcedMovementIfMovingSameDirection: @ 0x0808A45C
	push {lr}
	ldr r2, _0808A474
	ldrb r0, [r2, #2]
	cmp r0, #2
	bne _0808A46E
	ldrb r1, [r2]
	movs r0, #0xdf
	ands r0, r1
	strb r0, [r2]
_0808A46E:
	pop {r0}
	bx r0
	.align 2, 0
_0808A474: .4byte 0x02037230
	thumb_func_end PlayerAllowForcedMovementIfMovingSameDirection

	thumb_func_start TryDoMetatileBehaviorForcedMovement
TryDoMetatileBehaviorForcedMovement: @ 0x0808A478
	push {r4, lr}
	ldr r4, _0808A498
	bl GetForcedMovementByMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end TryDoMetatileBehaviorForcedMovement

	thumb_func_start sub_0808A48C
sub_0808A48C: @ 0x0808A48C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808A498: .4byte 0x0846F864
	thumb_func_end sub_0808A48C

	thumb_func_start GetForcedMovementByMetatileBehavior
GetForcedMovementByMetatileBehavior: @ 0x0808A49C
	push {r4, r5, r6, lr}
	ldr r3, _0808A4D8
	ldrb r1, [r3]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0808A4EE
	ldr r2, _0808A4DC
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r5, [r0, #0x1e]
	movs r4, #0
	ldr r6, _0808A4E0
_0808A4BC:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A4E4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0808A4F0
	.align 2, 0
_0808A4D8: .4byte 0x02037230
_0808A4DC: .4byte 0x02036FF0
_0808A4E0: .4byte 0x0846F81C
_0808A4E4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x11
	bls _0808A4BC
_0808A4EE:
	movs r0, #0
_0808A4F0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetForcedMovementByMetatileBehavior

	thumb_func_start ForcedMovement_None
ForcedMovement_None: @ 0x0808A4F8
	push {r4, lr}
	ldr r4, _0808A53C
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808A532
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808A540
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r0, #0x18]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl SetEventObjectDirection
	ldrb r1, [r4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r4]
_0808A532:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808A53C: .4byte 0x02037230
_0808A540: .4byte 0x02036FF0
	thumb_func_end ForcedMovement_None

	thumb_func_start DoForcedMovement
DoForcedMovement: @ 0x0808A544
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _0808A584
	adds r0, r5, #0
	bl CheckForPlayerAvatarCollision
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	ldrb r0, [r6]
	movs r1, #0x40
	mov sl, r1
	movs r1, #0
	mov r8, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r6]
	cmp r4, #0
	beq _0808A5A0
	bl ForcedMovement_None
	cmp r4, #4
	bhi _0808A588
	movs r0, #0
	b _0808A5AC
	.align 2, 0
_0808A584: .4byte 0x02037230
_0808A588:
	cmp r7, #6
	bne _0808A592
	adds r0, r5, #0
	bl PlayerJumpLedge
_0808A592:
	ldrb r0, [r6]
	mov r1, sl
	orrs r0, r1
	strb r0, [r6]
	movs r0, #2
	strb r0, [r6, #2]
	b _0808A5AA
_0808A5A0:
	movs r0, #2
	strb r0, [r6, #2]
	adds r0, r5, #0
	bl _call_via_r9
_0808A5AA:
	movs r0, #1
_0808A5AC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DoForcedMovement

	thumb_func_start DoForcedMovementInCurrentDirection
DoForcedMovementInCurrentDirection: @ 0x0808A5BC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0808A5E8
	ldrb r2, [r0, #5]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808A5EC
	adds r0, r0, r2
	ldrb r2, [r0, #1]
	movs r3, #4
	orrs r2, r3
	strb r2, [r0, #1]
	ldrb r0, [r0, #0x18]
	lsrs r0, r0, #4
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A5E8: .4byte 0x02037230
_0808A5EC: .4byte 0x02036FF0
	thumb_func_end DoForcedMovementInCurrentDirection

	thumb_func_start ForcedMovement_Slip
ForcedMovement_Slip: @ 0x0808A5F0
	push {lr}
	ldr r0, _0808A600
	bl DoForcedMovementInCurrentDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A600: .4byte 0x0808B09D
	thumb_func_end ForcedMovement_Slip

	thumb_func_start ForcedMovement_WalkSouth
ForcedMovement_WalkSouth: @ 0x0808A604
	push {lr}
	ldr r1, _0808A618
	movs r0, #1
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A618: .4byte 0x0808B085
	thumb_func_end ForcedMovement_WalkSouth

	thumb_func_start ForcedMovement_WalkNorth
ForcedMovement_WalkNorth: @ 0x0808A61C
	push {lr}
	ldr r1, _0808A630
	movs r0, #2
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A630: .4byte 0x0808B085
	thumb_func_end ForcedMovement_WalkNorth

	thumb_func_start ForcedMovement_WalkWest
ForcedMovement_WalkWest: @ 0x0808A634
	push {lr}
	ldr r1, _0808A648
	movs r0, #3
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A648: .4byte 0x0808B085
	thumb_func_end ForcedMovement_WalkWest

	thumb_func_start ForcedMovement_WalkEast
ForcedMovement_WalkEast: @ 0x0808A64C
	push {lr}
	ldr r1, _0808A660
	movs r0, #4
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A660: .4byte 0x0808B085
	thumb_func_end ForcedMovement_WalkEast

	thumb_func_start ForcedMovement_PushedSouthByCurrent
ForcedMovement_PushedSouthByCurrent: @ 0x0808A664
	push {lr}
	ldr r1, _0808A678
	movs r0, #1
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A678: .4byte 0x0808B0B5
	thumb_func_end ForcedMovement_PushedSouthByCurrent

	thumb_func_start ForcedMovement_PushedNorthByCurrent
ForcedMovement_PushedNorthByCurrent: @ 0x0808A67C
	push {lr}
	ldr r1, _0808A690
	movs r0, #2
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A690: .4byte 0x0808B0B5
	thumb_func_end ForcedMovement_PushedNorthByCurrent

	thumb_func_start ForcedMovement_PushedWestByCurrent
ForcedMovement_PushedWestByCurrent: @ 0x0808A694
	push {lr}
	ldr r1, _0808A6A8
	movs r0, #3
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A6A8: .4byte 0x0808B0B5
	thumb_func_end ForcedMovement_PushedWestByCurrent

	thumb_func_start ForcedMovement_PushedEastByCurrent
ForcedMovement_PushedEastByCurrent: @ 0x0808A6AC
	push {lr}
	ldr r1, _0808A6C0
	movs r0, #4
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A6C0: .4byte 0x0808B0B5
	thumb_func_end ForcedMovement_PushedEastByCurrent

	thumb_func_start ForcedMovement_Slide
ForcedMovement_Slide: @ 0x0808A6C4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808A6F4
	ldrb r3, [r2, #5]
	lsls r2, r3, #3
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, _0808A6F8
	adds r2, r2, r3
	ldrb r3, [r2, #1]
	movs r4, #4
	orrs r3, r4
	movs r4, #2
	orrs r3, r4
	strb r3, [r2, #1]
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808A6F4: .4byte 0x02037230
_0808A6F8: .4byte 0x02036FF0
	thumb_func_end ForcedMovement_Slide

	thumb_func_start ForcedMovement_SlideSouth
ForcedMovement_SlideSouth: @ 0x0808A6FC
	push {lr}
	ldr r1, _0808A710
	movs r0, #1
	bl ForcedMovement_Slide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A710: .4byte 0x0808B09D
	thumb_func_end ForcedMovement_SlideSouth

	thumb_func_start ForcedMovement_SlideNorth
ForcedMovement_SlideNorth: @ 0x0808A714
	push {lr}
	ldr r1, _0808A728
	movs r0, #2
	bl ForcedMovement_Slide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A728: .4byte 0x0808B09D
	thumb_func_end ForcedMovement_SlideNorth

	thumb_func_start ForcedMovement_SlideWest
ForcedMovement_SlideWest: @ 0x0808A72C
	push {lr}
	ldr r1, _0808A740
	movs r0, #3
	bl ForcedMovement_Slide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A740: .4byte 0x0808B09D
	thumb_func_end ForcedMovement_SlideWest

	thumb_func_start ForcedMovement_SlideEast
ForcedMovement_SlideEast: @ 0x0808A744
	push {lr}
	ldr r1, _0808A758
	movs r0, #4
	bl ForcedMovement_Slide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A758: .4byte 0x0808B09D
	thumb_func_end ForcedMovement_SlideEast

	thumb_func_start ForcedMovement_0xBB
ForcedMovement_0xBB: @ 0x0808A75C
	push {lr}
	bl DoPlayerMatJump
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ForcedMovement_0xBB

	thumb_func_start ForcedMovement_0xBC
ForcedMovement_0xBC: @ 0x0808A768
	push {lr}
	bl DoPlayerMatSpin
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ForcedMovement_0xBC

	thumb_func_start ForcedMovement_MuddySlope
ForcedMovement_MuddySlope: @ 0x0808A774
	push {r4, lr}
	ldr r0, _0808A7B8
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808A7BC
	adds r4, r0, r1
	ldrb r1, [r4, #0x18]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x20
	bne _0808A79A
	bl GetPlayerSpeed
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bgt _0808A7C4
_0808A79A:
	movs r0, #0
	bl Bike_UpdateBikeCounterSpeed
	ldrb r0, [r4, #1]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r1, _0808A7C0
	movs r0, #1
	bl DoForcedMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0808A7C6
	.align 2, 0
_0808A7B8: .4byte 0x02037230
_0808A7BC: .4byte 0x02036FF0
_0808A7C0: .4byte 0x0808B09D
_0808A7C4:
	movs r0, #0
_0808A7C6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ForcedMovement_MuddySlope

	thumb_func_start MovePlayerNotOnBike
MovePlayerNotOnBike: @ 0x0808A7CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r6, _0808A7F8
	adds r0, r4, #0
	bl CheckMovementInputNotOnBike
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	pop {r4, r5, r6}
	thumb_func_end MovePlayerNotOnBike

	thumb_func_start sub_0808A7F4
sub_0808A7F4: @ 0x0808A7F4
	pop {r0}
	bx r0
	.align 2, 0
_0808A7F8: .4byte 0x0846F8B0
	thumb_func_end sub_0808A7F4

	thumb_func_start CheckMovementInputNotOnBike
CheckMovementInputNotOnBike: @ 0x0808A7FC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0808A814
	ldr r0, _0808A810
	strb r4, [r0, #2]
	movs r0, #0
	b _0808A836
	.align 2, 0
_0808A810: .4byte 0x02037230
_0808A814:
	bl GetPlayerMovementDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	beq _0808A830
	ldr r1, _0808A82C
	ldrb r0, [r1, #2]
	cmp r0, #2
	beq _0808A830
	movs r0, #1
	b _0808A834
	.align 2, 0
_0808A82C: .4byte 0x02037230
_0808A830:
	ldr r1, _0808A83C
	movs r0, #2
_0808A834:
	strb r0, [r1, #2]
_0808A836:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808A83C: .4byte 0x02037230
	thumb_func_end CheckMovementInputNotOnBike

	thumb_func_start PlayerNotOnBikeNotMoving
PlayerNotOnBikeNotMoving: @ 0x0808A840
	push {lr}
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PlayerFaceDirection
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerNotOnBikeNotMoving

	thumb_func_start PlayerNotOnBikeTurningInPlace
PlayerNotOnBikeTurningInPlace: @ 0x0808A854
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PlayerTurnInPlace
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerNotOnBikeTurningInPlace

	thumb_func_start PlayerNotOnBikeMoving
PlayerNotOnBikeMoving: @ 0x0808A864
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	adds r0, r5, #0
	bl CheckForPlayerAvatarCollision
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0808A8B2
	cmp r4, #6
	bne _0808A888
	adds r0, r5, #0
	bl PlayerJumpLedge
	b _0808A91A
_0808A888:
	cmp r4, #4
	bne _0808A8A0
	adds r0, r5, #0
	bl IsPlayerCollidingWithFarawayIslandMew
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A8A0
	adds r0, r5, #0
	bl PlayerNotOnBikeCollideWithFarawayIslandMew
	b _0808A91A
_0808A8A0:
	subs r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0808A91A
	adds r0, r5, #0
	bl PlayerNotOnBikeCollide
	b _0808A91A
_0808A8B2:
	ldr r4, _0808A8C8
	ldrb r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808A8CC
	adds r0, r5, #0
	bl PlayerGoSpeed2
	b _0808A91A
	.align 2, 0
_0808A8C8: .4byte 0x02037230
_0808A8CC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0808A914
	movs r0, #2
	ands r6, r0
	cmp r6, #0
	beq _0808A914
	movs r0, #0x8c
	lsls r0, r0, #4
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A914
	ldr r2, _0808A910
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1e]
	bl IsRunningDisallowed
	cmp r0, #0
	bne _0808A914
	adds r0, r5, #0
	bl PlayerRun
	ldrb r1, [r4]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r4]
	b _0808A91A
	.align 2, 0
_0808A910: .4byte 0x02036FF0
_0808A914:
	adds r0, r5, #0
	bl PlayerGoSpeed1
_0808A91A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeMoving

	thumb_func_start CheckForPlayerAvatarCollision
CheckForPlayerAvatarCollision: @ 0x0808A920
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0808A984
	ldrb r0, [r0, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808A988
	adds r4, r4, r0
	ldrh r1, [r4, #0x10]
	add r0, sp, #4
	strh r1, [r0]
	ldrh r0, [r4, #0x12]
	mov r5, sp
	adds r5, #6
	strh r0, [r5]
	adds r0, r6, #0
	add r1, sp, #4
	adds r2, r5, #0
	bl MoveCoords
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r1, sp, #4
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r5, r3]
	str r0, [sp]
	adds r0, r4, #0
	adds r3, r6, #0
	bl CheckForEventObjectCollision
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808A984: .4byte 0x02037230
_0808A988: .4byte 0x02036FF0
	thumb_func_end CheckForPlayerAvatarCollision

	thumb_func_start sub_0808A98C
sub_0808A98C: @ 0x0808A98C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0808A9F0
	ldrb r0, [r0, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808A9F4
	adds r4, r4, r0
	ldrh r1, [r4, #0x10]
	add r0, sp, #4
	strh r1, [r0]
	ldrh r0, [r4, #0x12]
	mov r5, sp
	adds r5, #6
	strh r0, [r5]
	adds r0, r6, #0
	add r1, sp, #4
	adds r2, r5, #0
	bl MoveCoords
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r1, sp, #4
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r5, r3]
	str r0, [sp]
	adds r0, r4, #0
	adds r3, r6, #0
	bl sub_0808AAC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808A9F0: .4byte 0x02037230
_0808A9F4: .4byte 0x02036FF0
	thumb_func_end sub_0808A98C

	thumb_func_start CheckForEventObjectCollision
CheckForEventObjectCollision: @ 0x0808A9F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	lsrs r7, r1, #0x10
	asrs r5, r1, #0x10
	lsrs r1, r2, #0x10
	mov sb, r1
	asrs r4, r2, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	strb r0, [r1]
	cmp r0, #3
	bne _0808AA48
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_0808AB20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808AA48
	movs r0, #5
	b _0808AAB6
_0808AA48:
	lsls r5, r7, #0x10
	asrs r0, r5, #0x10
	mov r8, r0
	mov r1, sb
	lsls r4, r1, #0x10
	asrs r7, r4, #0x10
	adds r1, r7, #0
	adds r2, r6, #0
	bl ShouldJumpLedge
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808AA6C
	movs r0, #0x2b
	bl IncrementGameStat
	movs r0, #6
	b _0808AAB6
_0808AA6C:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #4
	bne _0808AA88
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_0808AB9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808AA88
	movs r0, #7
	b _0808AAB6
_0808AA88:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808AAB2
	asrs r5, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl CheckForRotatingGatePuzzleCollision
	cmp r0, #0
	beq _0808AAA6
	movs r0, #8
	b _0808AAB6
_0808AAA6:
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sl
	mov r3, sp
	bl check_acro_bike_metatile
_0808AAB2:
	mov r0, sp
	ldrb r0, [r0]
_0808AAB6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckForEventObjectCollision

	thumb_func_start sub_0808AAC8
sub_0808AAC8: @ 0x0808AAC8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, [sp, #0x18]
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	strb r0, [r1]
	cmp r0, #0
	bne _0808AB12
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl CheckForRotatingGatePuzzleCollisionWithoutAnimation
	cmp r0, #0
	beq _0808AB06
	movs r0, #8
	b _0808AB16
_0808AB06:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	mov r3, sp
	bl check_acro_bike_metatile
_0808AB12:
	mov r0, sp
	ldrb r0, [r0]
_0808AB16:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0808AAC8

	thumb_func_start sub_0808AB20
sub_0808AB20: @ 0x0808AB20
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _0808AB6C
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808AB70
	lsls r5, r3, #0x10
	asrs r0, r5, #0x10
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	bl MapGridGetZCoordAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808AB70
	lsrs r0, r5, #0x10
	lsrs r1, r4, #0x10
	movs r2, #3
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _0808AB70
	adds r0, r6, #0
	bl sub_0808C0B4
	movs r0, #1
	b _0808AB72
	.align 2, 0
_0808AB6C: .4byte 0x02037230
_0808AB70:
	movs r0, #0
_0808AB72:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0808AB20

	thumb_func_start ShouldJumpLedge
ShouldJumpLedge: @ 0x0808AB78
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl GetLedgeJumpDirection
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808AB94
	movs r0, #0
	b _0808AB96
_0808AB94:
	movs r0, #1
_0808AB96:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldJumpLedge

	thumb_func_start sub_0808AB9C
sub_0808AB9C: @ 0x0808AB9C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	mov r3, sp
	strh r0, [r3]
	mov r5, sp
	adds r5, #2
	strh r1, [r5]
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r0, _0808AC34
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808AC3C
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl GetEventObjectIdByXY
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x10
	beq _0808AC3C
	ldr r0, _0808AC38
	lsls r1, r6, #3
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r4, r1, r0
	ldrb r0, [r4, #5]
	cmp r0, #0x57
	bne _0808AC3C
	ldrh r1, [r4, #0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r4, #0x12]
	strh r0, [r5]
	adds r0, r7, #0
	mov r1, sp
	adds r2, r5, #0
	bl MoveCoords
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	adds r0, r4, #0
	adds r3, r7, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808AC3C
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsNonAnimDoor
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808AC3C
	adds r0, r6, #0
	adds r1, r7, #0
	bl StartStrengthAnim
	movs r0, #1
	b _0808AC3E
	.align 2, 0
_0808AC34: .4byte 0x00000889
_0808AC38: .4byte 0x02036FF0
_0808AC3C:
	movs r0, #0
_0808AC3E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0808AB9C

	thumb_func_start check_acro_bike_metatile
check_acro_bike_metatile: @ 0x0808AC48
	push {r4, r5, r6, r7, lr}
	adds r6, r3, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r4, #0
	ldr r7, _0808AC70
_0808AC54:
	lsls r0, r4, #2
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808AC78
	ldr r0, _0808AC74
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r6]
	b _0808AC82
	.align 2, 0
_0808AC70: .4byte 0x0846F8BC
_0808AC74: .4byte 0x0846F8D0
_0808AC78:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0808AC54
_0808AC82:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end check_acro_bike_metatile

	thumb_func_start IsPlayerCollidingWithFarawayIslandMew
IsPlayerCollidingWithFarawayIslandMew: @ 0x0808AC88
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0808AD1C
	ldrb r2, [r1, #5]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r5, _0808AD20
	adds r3, r1, r5
	ldrh r2, [r3, #0x10]
	mov r1, sp
	strh r2, [r1]
	ldrh r1, [r3, #0x12]
	mov r4, sp
	adds r4, #2
	strh r1, [r4]
	mov r1, sp
	adds r2, r4, #0
	bl MoveCoords
	movs r0, #1
	movs r1, #0x39
	movs r2, #0x1a
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r6, r4, #0
	cmp r1, #0x10
	beq _0808AD24
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r5
	mov r0, sp
	movs r1, #0x14
	ldrsh r2, [r3, r1]
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r2, r0
	bne _0808AD24
	movs r5, #0x16
	ldrsh r1, [r3, r5]
	movs r4, #0
	ldrsh r0, [r6, r4]
	ldrh r4, [r3, #0x16]
	cmp r1, r0
	bne _0808ACFC
	movs r5, #0x10
	ldrsh r0, [r3, r5]
	cmp r0, r2
	bne _0808ACFC
	movs r2, #0x12
	ldrsh r0, [r3, r2]
	cmp r0, r1
	beq _0808AD24
_0808ACFC:
	mov r0, sp
	movs r5, #0x14
	ldrsh r1, [r3, r5]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _0808AD24
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r4, #0
	ldrsh r1, [r6, r4]
	cmp r0, r1
	bne _0808AD24
	movs r0, #1
	b _0808AD26
	.align 2, 0
_0808AD1C: .4byte 0x02037230
_0808AD20: .4byte 0x02036FF0
_0808AD24:
	movs r0, #0
_0808AD26:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsPlayerCollidingWithFarawayIslandMew

	thumb_func_start SetPlayerAvatarTransitionFlags
SetPlayerAvatarTransitionFlags: @ 0x0808AD30
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0808AD48
	ldrb r1, [r2, #1]
	orrs r0, r1
	strb r0, [r2, #1]
	bl DoPlayerAvatarTransition
	pop {r0}
	bx r0
	.align 2, 0
_0808AD48: .4byte 0x02037230
	thumb_func_end SetPlayerAvatarTransitionFlags

	thumb_func_start DoPlayerAvatarTransition
DoPlayerAvatarTransition: @ 0x0808AD4C
	push {r4, r5, lr}
	ldr r0, _0808AD94
	ldrb r4, [r0, #1]
	cmp r4, #0
	beq _0808AD8C
	movs r5, #0
_0808AD58:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0808AD7A
	ldr r0, _0808AD98
	lsls r2, r5, #2
	adds r2, r2, r0
	ldr r0, _0808AD94
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808AD9C
	adds r0, r0, r1
	ldr r1, [r2]
	bl _call_via_r1
_0808AD7A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsrs r4, r4, #1
	cmp r5, #7
	bls _0808AD58
	ldr r1, _0808AD94
	movs r0, #0
	strb r0, [r1, #1]
_0808AD8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808AD94: .4byte 0x02037230
_0808AD98: .4byte 0x0846F8D8
_0808AD9C: .4byte 0x02036FF0
	thumb_func_end DoPlayerAvatarTransition

	thumb_func_start PlayerAvatarTransition_Dummy
PlayerAvatarTransition_Dummy: @ 0x0808ADA0
	bx lr
	.align 2, 0
	thumb_func_end PlayerAvatarTransition_Dummy

	thumb_func_start PlayerAvatarTransition_Normal
PlayerAvatarTransition_Normal: @ 0x0808ADA4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl EventObjectTurn
	movs r0, #1
	bl SetPlayerAvatarStateMask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_Normal

	thumb_func_start PlayerAvatarTransition_MachBike
PlayerAvatarTransition_MachBike: @ 0x0808ADD0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl EventObjectTurn
	movs r0, #2
	bl SetPlayerAvatarStateMask
	movs r0, #0
	movs r1, #0
	bl BikeClearState
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_MachBike

	thumb_func_start PlayerAvatarTransition_AcroBike
PlayerAvatarTransition_AcroBike: @ 0x0808AE04
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl EventObjectTurn
	movs r0, #4
	bl SetPlayerAvatarStateMask
	movs r0, #0
	movs r1, #0
	bl BikeClearState
	bl Bike_HandleBumpySlopeJump
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_AcroBike

	thumb_func_start PlayerAvatarTransition_Surfing
PlayerAvatarTransition_Surfing: @ 0x0808AE3C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl EventObjectTurn
	movs r0, #8
	bl SetPlayerAvatarStateMask
	ldr r1, _0808AE90
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, #4]
	ldr r0, _0808AE94
	ldrb r0, [r0, #5]
	str r0, [r1, #8]
	movs r0, #8
	bl FieldEffectStart
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strb r0, [r4, #0x1a]
	movs r1, #1
	bl sub_081554E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AE90: .4byte 0x020388A8
_0808AE94: .4byte 0x02037230
	thumb_func_end PlayerAvatarTransition_Surfing

	thumb_func_start PlayerAvatarTransition_Underwater
PlayerAvatarTransition_Underwater: @ 0x0808AE98
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #4
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl EventObjectTurn
	movs r0, #0x10
	bl SetPlayerAvatarStateMask
	ldrb r0, [r4, #4]
	bl sub_0815573C
	strb r0, [r4, #0x1a]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_Underwater

	thumb_func_start PlayerAvatarTransition_ReturnToField
PlayerAvatarTransition_ReturnToField: @ 0x0808AECC
	ldr r2, _0808AED8
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0808AED8: .4byte 0x02037230
	thumb_func_end PlayerAvatarTransition_ReturnToField

	thumb_func_start sub_0808AEDC
sub_0808AEDC: @ 0x0808AEDC
	push {r4, lr}
	ldr r4, _0808AF08
	movs r0, #0
	strb r0, [r4, #3]
	bl PlayerCheckIfAnimFinishedOrInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808AF1A
	bl PlayerIsAnimActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808AF0C
	bl player_is_anim_in_certain_ranges
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808AF1A
	movs r0, #1
	b _0808AF18
	.align 2, 0
_0808AF08: .4byte 0x02037230
_0808AF0C:
	bl sub_0808AF7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808AF1A
	movs r0, #2
_0808AF18:
	strb r0, [r4, #3]
_0808AF1A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0808AEDC

	thumb_func_start player_is_anim_in_certain_ranges
player_is_anim_in_certain_ranges: @ 0x0808AF20
	push {lr}
	ldr r2, _0808AF6C
	ldr r0, _0808AF70
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x1c]
	cmp r1, #3
	bls _0808AF66
	adds r0, r1, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _0808AF66
	adds r0, r1, #0
	subs r0, #0x19
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _0808AF66
	adds r0, r1, #0
	subs r0, #0x64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bls _0808AF66
	adds r0, r1, #0
	subs r0, #0x7c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _0808AF74
_0808AF66:
	movs r0, #1
	b _0808AF76
	.align 2, 0
_0808AF6C: .4byte 0x02036FF0
_0808AF70: .4byte 0x02037230
_0808AF74:
	movs r0, #0
_0808AF76:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end player_is_anim_in_certain_ranges

	thumb_func_start sub_0808AF7C
sub_0808AF7C: @ 0x0808AF7C
	push {lr}
	bl player_is_anim_in_certain_ranges
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808AF98
	ldr r0, _0808AF94
	ldrb r0, [r0, #2]
	cmp r0, #1
	beq _0808AF98
	movs r0, #1
	b _0808AF9A
	.align 2, 0
_0808AF94: .4byte 0x02037230
_0808AF98:
	movs r0, #0
_0808AF9A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0808AF7C

	thumb_func_start PlayerCheckIfAnimFinishedOrInactive
PlayerCheckIfAnimFinishedOrInactive: @ 0x0808AFA0
	push {lr}
	ldr r0, _0808AFBC
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808AFC0
	adds r0, r0, r1
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808AFBC: .4byte 0x02037230
_0808AFC0: .4byte 0x02036FF0
	thumb_func_end PlayerCheckIfAnimFinishedOrInactive

	thumb_func_start PlayerIsAnimActive
PlayerIsAnimActive: @ 0x0808AFC4
	push {lr}
	ldr r0, _0808AFE0
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808AFE4
	adds r0, r0, r1
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808AFE0: .4byte 0x02037230
_0808AFE4: .4byte 0x02036FF0
	thumb_func_end PlayerIsAnimActive

	thumb_func_start PlayerSetCopyableMovement
PlayerSetCopyableMovement: @ 0x0808AFE8
	ldr r3, _0808AFFC
	ldr r1, _0808B000
	ldrb r2, [r1, #5]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r1, #0x22
	strb r0, [r1]
	bx lr
	.align 2, 0
_0808AFFC: .4byte 0x02036FF0
_0808B000: .4byte 0x02037230
	thumb_func_end PlayerSetCopyableMovement

	thumb_func_start PlayerGetCopyableMovement
PlayerGetCopyableMovement: @ 0x0808B004
	ldr r2, _0808B018
	ldr r0, _0808B01C
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x22
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0808B018: .4byte 0x02036FF0
_0808B01C: .4byte 0x02037230
	thumb_func_end PlayerGetCopyableMovement

	thumb_func_start sub_0808B020
sub_0808B020: @ 0x0808B020
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0808B040
	ldrb r2, [r0, #5]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808B044
	adds r0, r0, r2
	bl EventObjectForceSetHeldMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808B040: .4byte 0x02037230
_0808B044: .4byte 0x02036FF0
	thumb_func_end sub_0808B020

	thumb_func_start PlayerSetAnimId
PlayerSetAnimId: @ 0x0808B048
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl PlayerCheckIfAnimFinishedOrInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808B076
	adds r0, r4, #0
	bl PlayerSetCopyableMovement
	ldr r0, _0808B07C
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808B080
	adds r0, r0, r1
	adds r1, r5, #0
	bl EventObjectSetHeldMovement
_0808B076:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B07C: .4byte 0x02037230
_0808B080: .4byte 0x02036FF0
	thumb_func_end PlayerSetAnimId

	thumb_func_start PlayerGoSpeed1
PlayerGoSpeed1: @ 0x0808B084
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092CF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSpeed1

	thumb_func_start PlayerGoSpeed2
PlayerGoSpeed2: @ 0x0808B09C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092D24
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSpeed2

	thumb_func_start PlayerRideWaterCurrent
PlayerRideWaterCurrent: @ 0x0808B0B4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092D50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerRideWaterCurrent

	thumb_func_start PlayerGoSpeed4
PlayerGoSpeed4: @ 0x0808B0CC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092D7C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSpeed4

	thumb_func_start PlayerRun
PlayerRun: @ 0x0808B0E4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092DD4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerRun

	thumb_func_start PlayerOnBikeCollide
PlayerOnBikeCollide: @ 0x0808B0FC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PlayCollisionSoundIfNotFacingWarp
	adds r0, r4, #0
	bl sub_08092F08
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerOnBikeCollide

	thumb_func_start PlayerOnBikeCollideWithFarawayIslandMew
PlayerOnBikeCollideWithFarawayIslandMew: @ 0x0808B120
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092F08
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerOnBikeCollideWithFarawayIslandMew

	thumb_func_start PlayerNotOnBikeCollide
PlayerNotOnBikeCollide: @ 0x0808B138
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PlayCollisionSoundIfNotFacingWarp
	adds r0, r4, #0
	bl sub_08092EDC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeCollide

	thumb_func_start PlayerNotOnBikeCollideWithFarawayIslandMew
PlayerNotOnBikeCollideWithFarawayIslandMew: @ 0x0808B15C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092EDC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeCollideWithFarawayIslandMew

	thumb_func_start PlayerFaceDirection
PlayerFaceDirection: @ 0x0808B174
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092CA0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerFaceDirection

	thumb_func_start PlayerTurnInPlace
PlayerTurnInPlace: @ 0x0808B18C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092F34
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerTurnInPlace

	thumb_func_start PlayerJumpLedge
PlayerJumpLedge: @ 0x0808B1A4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0xa
	bl PlaySE
	adds r0, r4, #0
	bl sub_08092E00
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerJumpLedge

	thumb_func_start sub_0808B1C8
sub_0808B1C8: @ 0x0808B1C8
	push {r4, lr}
	ldr r4, _0808B204
	ldrb r0, [r4, #3]
	cmp r0, #2
	beq _0808B1D6
	cmp r0, #0
	bne _0808B1FE
_0808B1D6:
	bl player_should_look_direction_be_enforced_upon_movement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808B1FE
	ldr r2, _0808B208
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0808B020
_0808B1FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B204: .4byte 0x02037230
_0808B208: .4byte 0x02036FF0
	thumb_func_end sub_0808B1C8

	thumb_func_start PlayerIdleWheelie
PlayerIdleWheelie: @ 0x0808B20C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092FB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerIdleWheelie

	thumb_func_start PlayerStartWheelie
PlayerStartWheelie: @ 0x0808B224
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092FE4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerStartWheelie

	thumb_func_start PlayerEndWheelie
PlayerEndWheelie: @ 0x0808B23C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl EventObjectExecSingleMovementAction
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerEndWheelie

	thumb_func_start PlayerStandingHoppingWheelie
PlayerStandingHoppingWheelie: @ 0x0808B254
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x22
	bl PlaySE
	adds r0, r4, #0
	bl sub_0809303C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerStandingHoppingWheelie

	thumb_func_start PlayerMovingHoppingWheelie
PlayerMovingHoppingWheelie: @ 0x0808B278
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x22
	bl PlaySE
	adds r0, r4, #0
	bl GetAcroEndWheelieFaceDirectionMovementAction
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerMovingHoppingWheelie

	thumb_func_start PlayerLedgeHoppingWheelie
PlayerLedgeHoppingWheelie: @ 0x0808B29C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x22
	bl PlaySE
	adds r0, r4, #0
	bl sub_08093094
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerLedgeHoppingWheelie

	thumb_func_start PlayerAcroTurnJump
PlayerAcroTurnJump: @ 0x0808B2C0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x22
	bl PlaySE
	adds r0, r4, #0
	bl sub_08092E58
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAcroTurnJump

	thumb_func_start sub_0808B2E4
sub_0808B2E4: @ 0x0808B2E4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #7
	bl PlaySE
	adds r0, r4, #0
	bl sub_080930C0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0808B2E4

	thumb_func_start sub_0808B308
sub_0808B308: @ 0x0808B308
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080930EC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_0808B308

	thumb_func_start sub_0808B320
sub_0808B320: @ 0x0808B320
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08093118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_0808B320

	thumb_func_start sub_0808B338
sub_0808B338: @ 0x0808B338
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08093144
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_0808B338

	thumb_func_start PlayCollisionSoundIfNotFacingWarp
PlayCollisionSoundIfNotFacingWarp: @ 0x0808B350
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _0808B3C0
	ldr r0, _0808B3C4
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1e]
	ldr r2, _0808B3C8
	subs r1, r4, #1
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808B3B8
	cmp r4, #2
	bne _0808B3B2
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	movs r0, #2
	mov r1, sp
	adds r2, r4, #0
	bl MoveCoords
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsWarpDoor
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808B3B8
_0808B3B2:
	movs r0, #7
	bl PlaySE
_0808B3B8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B3C0: .4byte 0x02036FF0
_0808B3C4: .4byte 0x02037230
_0808B3C8: .4byte 0x0846F8F8
	thumb_func_end PlayCollisionSoundIfNotFacingWarp

	thumb_func_start GetXYCoordsOneStepInFrontOfPlayer
GetXYCoordsOneStepInFrontOfPlayer: @ 0x0808B3CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r3, _0808B408
	ldr r2, _0808B40C
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x10]
	strh r0, [r4]
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x12]
	strh r0, [r5]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r5, #0
	bl MoveCoords
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B408: .4byte 0x02036FF0
_0808B40C: .4byte 0x02037230
	thumb_func_end GetXYCoordsOneStepInFrontOfPlayer

	thumb_func_start PlayerGetDestCoords
PlayerGetDestCoords: @ 0x0808B410
	push {r4, r5, lr}
	ldr r5, _0808B438
	ldr r4, _0808B43C
	ldrb r3, [r4, #5]
	lsls r2, r3, #3
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r5
	ldrh r2, [r2, #0x10]
	strh r2, [r0]
	ldrb r2, [r4, #5]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x12]
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B438: .4byte 0x02036FF0
_0808B43C: .4byte 0x02037230
	thumb_func_end PlayerGetDestCoords

	thumb_func_start player_get_pos_including_state_based_drift
player_get_pos_including_state_based_drift: @ 0x0808B440
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0808B494
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808B498
	adds r3, r0, r1
	ldrb r1, [r3]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x40
	beq _0808B460
	b _0808B588
_0808B460:
	ldr r2, _0808B49C
	ldrb r1, [r3, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x32
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0808B476
	b _0808B588
_0808B476:
	ldrh r0, [r3, #0x10]
	strh r0, [r4]
	ldrh r0, [r3, #0x12]
	strh r0, [r5]
	ldrb r0, [r3, #0x1c]
	subs r0, #8
	cmp r0, #0x30
	bls _0808B488
	b _0808B588
_0808B488:
	lsls r0, r0, #2
	ldr r1, _0808B4A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B494: .4byte 0x02037230
_0808B498: .4byte 0x02036FF0
_0808B49C: .4byte 0x020205AC
_0808B4A0: .4byte 0x0808B4A4
_0808B4A4: @ jump table
	.4byte _0808B568 @ case 0
	.4byte _0808B56E @ case 1
	.4byte _0808B578 @ case 2
	.4byte _0808B57E @ case 3
	.4byte _0808B588 @ case 4
	.4byte _0808B588 @ case 5
	.4byte _0808B588 @ case 6
	.4byte _0808B588 @ case 7
	.4byte _0808B588 @ case 8
	.4byte _0808B588 @ case 9
	.4byte _0808B588 @ case 10
	.4byte _0808B588 @ case 11
	.4byte _0808B588 @ case 12
	.4byte _0808B588 @ case 13
	.4byte _0808B588 @ case 14
	.4byte _0808B588 @ case 15
	.4byte _0808B588 @ case 16
	.4byte _0808B588 @ case 17
	.4byte _0808B588 @ case 18
	.4byte _0808B588 @ case 19
	.4byte _0808B588 @ case 20
	.4byte _0808B588 @ case 21
	.4byte _0808B588 @ case 22
	.4byte _0808B588 @ case 23
	.4byte _0808B588 @ case 24
	.4byte _0808B588 @ case 25
	.4byte _0808B588 @ case 26
	.4byte _0808B588 @ case 27
	.4byte _0808B588 @ case 28
	.4byte _0808B588 @ case 29
	.4byte _0808B588 @ case 30
	.4byte _0808B588 @ case 31
	.4byte _0808B588 @ case 32
	.4byte _0808B588 @ case 33
	.4byte _0808B588 @ case 34
	.4byte _0808B588 @ case 35
	.4byte _0808B588 @ case 36
	.4byte _0808B588 @ case 37
	.4byte _0808B588 @ case 38
	.4byte _0808B588 @ case 39
	.4byte _0808B588 @ case 40
	.4byte _0808B588 @ case 41
	.4byte _0808B588 @ case 42
	.4byte _0808B588 @ case 43
	.4byte _0808B588 @ case 44
	.4byte _0808B568 @ case 45
	.4byte _0808B56E @ case 46
	.4byte _0808B578 @ case 47
	.4byte _0808B57E @ case 48
_0808B568:
	ldrh r0, [r5]
	adds r0, #1
	b _0808B572
_0808B56E:
	ldrh r0, [r5]
	subs r0, #1
_0808B572:
	strh r0, [r5]
	movs r0, #1
	b _0808B594
_0808B578:
	ldrh r0, [r4]
	subs r0, #1
	b _0808B582
_0808B57E:
	ldrh r0, [r4]
	adds r0, #1
_0808B582:
	strh r0, [r4]
	movs r0, #1
	b _0808B594
_0808B588:
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	strh r0, [r4]
	strh r0, [r5]
	movs r0, #0
_0808B594:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end player_get_pos_including_state_based_drift

	thumb_func_start GetPlayerFacingDirection
GetPlayerFacingDirection: @ 0x0808B59C
	ldr r2, _0808B5B4
	ldr r0, _0808B5B8
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bx lr
	.align 2, 0
_0808B5B4: .4byte 0x02036FF0
_0808B5B8: .4byte 0x02037230
	thumb_func_end GetPlayerFacingDirection

	thumb_func_start GetPlayerMovementDirection
GetPlayerMovementDirection: @ 0x0808B5BC
	ldr r2, _0808B5D0
	ldr r0, _0808B5D4
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x18]
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
_0808B5D0: .4byte 0x02036FF0
_0808B5D4: .4byte 0x02037230
	thumb_func_end GetPlayerMovementDirection

	thumb_func_start PlayerGetZCoord
PlayerGetZCoord: @ 0x0808B5D8
	ldr r2, _0808B5EC
	ldr r0, _0808B5F0
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0xb]
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
_0808B5EC: .4byte 0x02036FF0
_0808B5F0: .4byte 0x02037230
	thumb_func_end PlayerGetZCoord

	thumb_func_start sub_0808B5F4
sub_0808B5F4: @ 0x0808B5F4
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _0808B61C
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808B620
	adds r0, r0, r1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r3, #0
	bl MoveEventObjectToMapCoords
	pop {r0}
	bx r0
	.align 2, 0
_0808B61C: .4byte 0x02037230
_0808B620: .4byte 0x02036FF0
	thumb_func_end sub_0808B5F4

	thumb_func_start TestPlayerAvatarFlags
TestPlayerAvatarFlags: @ 0x0808B624
	ldr r1, _0808B630
	ldrb r1, [r1]
	ands r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0808B630: .4byte 0x02037230
	thumb_func_end TestPlayerAvatarFlags

	thumb_func_start sub_0808B634
sub_0808B634: @ 0x0808B634
	ldr r0, _0808B63C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0808B63C: .4byte 0x02037230
	thumb_func_end sub_0808B634

	thumb_func_start GetPlayerAvatarObjectId
GetPlayerAvatarObjectId: @ 0x0808B640
	ldr r0, _0808B648
	ldrb r0, [r0, #4]
	bx lr
	.align 2, 0
_0808B648: .4byte 0x02037230
	thumb_func_end GetPlayerAvatarObjectId

	thumb_func_start sub_0808B64C
sub_0808B64C: @ 0x0808B64C
	push {lr}
	bl ForcedMovement_None
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0808B64C

	thumb_func_start sub_0808B658
sub_0808B658: @ 0x0808B658
	push {r4, lr}
	ldr r0, _0808B698
	ldrb r0, [r0, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808B69C
	adds r4, r4, r0
	adds r0, r4, #0
	bl npc_clear_strange_bits
	ldrb r1, [r4, #0x18]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #6
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808B690
	bl Bike_HandleBumpySlopeJump
	movs r0, #0
	bl Bike_UpdateBikeCounterSpeed
_0808B690:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B698: .4byte 0x02037230
_0808B69C: .4byte 0x02036FF0
	thumb_func_end sub_0808B658

	thumb_func_start GetPlayerAvatarGraphicsIdByStateIdAndGender
GetPlayerAvatarGraphicsIdByStateIdAndGender: @ 0x0808B6A0
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808B6B4
	lsrs r0, r0, #0x17
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0808B6B4: .4byte 0x0846F908
	thumb_func_end GetPlayerAvatarGraphicsIdByStateIdAndGender

	thumb_func_start sub_0808B6B8
sub_0808B6B8: @ 0x0808B6B8
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808B6CC
	lsrs r0, r0, #0x17
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0808B6CC: .4byte 0x0846F918
	thumb_func_end sub_0808B6B8

	thumb_func_start sub_0808B6D0
sub_0808B6D0: @ 0x0808B6D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0808B6DC
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0808B6DC: .4byte 0x0846F928
	thumb_func_end sub_0808B6D0

	thumb_func_start GetFRLGAvatarGraphicsIdByGender
GetFRLGAvatarGraphicsIdByGender: @ 0x0808B6E0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0808B6EC
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0808B6EC: .4byte 0x0846F92A
	thumb_func_end GetFRLGAvatarGraphicsIdByGender

	thumb_func_start GetPlayerAvatarGraphicsIdByStateId
GetPlayerAvatarGraphicsIdByStateId: @ 0x0808B6F0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0808B708
	ldrb r1, [r1, #7]
	bl sub_0808B6B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808B708: .4byte 0x02037230
	thumb_func_end GetPlayerAvatarGraphicsIdByStateId

	thumb_func_start unref_GetRivalAvatarGenderByGraphicsId
unref_GetRivalAvatarGenderByGraphicsId: @ 0x0808B70C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x70
	beq _0808B72E
	cmp r0, #0x70
	bgt _0808B726
	cmp r0, #0x6d
	bgt _0808B732
	cmp r0, #0x69
	blt _0808B732
	b _0808B72E
_0808B726:
	cmp r1, #0x8a
	beq _0808B72E
	cmp r1, #0xc0
	bne _0808B732
_0808B72E:
	movs r0, #1
	b _0808B734
_0808B732:
	movs r0, #0
_0808B734:
	pop {r1}
	bx r1
	thumb_func_end unref_GetRivalAvatarGenderByGraphicsId

	thumb_func_start GetPlayerAvatarGenderByGraphicsId
GetPlayerAvatarGenderByGraphicsId: @ 0x0808B738
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x70
	beq _0808B75A
	cmp r0, #0x70
	bgt _0808B752
	cmp r0, #0x5d
	bgt _0808B75E
	cmp r0, #0x59
	blt _0808B75E
	b _0808B75A
_0808B752:
	cmp r1, #0x8a
	beq _0808B75A
	cmp r1, #0xc0
	bne _0808B75E
_0808B75A:
	movs r0, #1
	b _0808B760
_0808B75E:
	movs r0, #0
_0808B760:
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarGenderByGraphicsId

	thumb_func_start PartyHasMonWithSurf
PartyHasMonWithSurf: @ 0x0808B764
	push {r4, r5, lr}
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808B7A8
	movs r5, #0
	b _0808B78E
_0808B776:
	adds r0, r4, #0
	movs r1, #0x39
	bl MonKnowsMove
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808B788
	movs r0, #1
	b _0808B7AA
_0808B788:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0808B78E:
	cmp r5, #5
	bhi _0808B7A8
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0808B7B0
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	bne _0808B776
_0808B7A8:
	movs r0, #0
_0808B7AA:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808B7B0: .4byte 0x02024190
	thumb_func_end PartyHasMonWithSurf

	thumb_func_start IsPlayerSurfingNorth
IsPlayerSurfingNorth: @ 0x0808B7B4
	push {lr}
	bl GetPlayerMovementDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808B7D2
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808B7D2
	movs r0, #1
	b _0808B7D4
_0808B7D2:
	movs r0, #0
_0808B7D4:
	pop {r1}
	bx r1
	thumb_func_end IsPlayerSurfingNorth

	thumb_func_start IsPlayerFacingSurfableFishableWater
IsPlayerFacingSurfableFishableWater: @ 0x0808B7D8
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0808B850
	ldrb r0, [r0, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808B854
	adds r4, r4, r0
	ldrh r1, [r4, #0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r4, #0x12]
	mov r5, sp
	adds r5, #2
	strh r0, [r5]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	mov r1, sp
	adds r2, r5, #0
	bl MoveCoords
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldrb r3, [r4, #0x18]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1c
	adds r0, r4, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808B858
	bl PlayerGetZCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808B858
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSurfableFishableWater
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808B858
	movs r0, #1
	b _0808B85A
	.align 2, 0
_0808B850: .4byte 0x02037230
_0808B854: .4byte 0x02036FF0
_0808B858:
	movs r0, #0
_0808B85A:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsPlayerFacingSurfableFishableWater

	thumb_func_start ClearPlayerAvatarInfo
ClearPlayerAvatarInfo: @ 0x0808B864
	push {lr}
	ldr r0, _0808B874
	movs r1, #0
	movs r2, #0x24
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_0808B874: .4byte 0x02037230
	thumb_func_end ClearPlayerAvatarInfo

	thumb_func_start SetPlayerAvatarStateMask
SetPlayerAvatarStateMask: @ 0x0808B878
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0808B88C
	ldrb r2, [r3]
	movs r1, #0xe0
	ands r1, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_0808B88C: .4byte 0x02037230
	thumb_func_end SetPlayerAvatarStateMask

	thumb_func_start GetPlayerAvatarStateTransitionByGraphicsId
GetPlayerAvatarStateTransitionByGraphicsId: @ 0x0808B890
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	ldr r3, _0808B8B8
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r4, r0, #1
	adds r6, r3, #1
_0808B8A6:
	lsls r0, r2, #1
	adds r1, r0, r4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r5
	bne _0808B8BC
	adds r0, r1, r6
	ldrb r0, [r0]
	b _0808B8C8
	.align 2, 0
_0808B8B8: .4byte 0x0846F92C
_0808B8BC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bls _0808B8A6
	movs r0, #1
_0808B8C8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetPlayerAvatarStateTransitionByGraphicsId

	thumb_func_start GetPlayerAvatarGraphicsIdByCurrentState
GetPlayerAvatarGraphicsIdByCurrentState: @ 0x0808B8D0
	push {r4, r5, r6, lr}
	ldr r0, _0808B8F8
	ldrb r5, [r0]
	movs r2, #0
	ldr r3, _0808B8FC
	ldrb r1, [r0, #7]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r4, r0, #1
	adds r6, r3, #1
_0808B8E4:
	lsls r0, r2, #1
	adds r1, r0, r4
	adds r0, r1, r6
	ldrb r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0808B900
	adds r0, r1, r3
	ldrb r0, [r0]
	b _0808B90C
	.align 2, 0
_0808B8F8: .4byte 0x02037230
_0808B8FC: .4byte 0x0846F92C
_0808B900:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bls _0808B8E4
	movs r0, #0
_0808B90C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetPlayerAvatarGraphicsIdByCurrentState

	thumb_func_start SetPlayerAvatarExtraStateTransition
SetPlayerAvatarExtraStateTransition: @ 0x0808B914
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0808B940
	ldrb r1, [r5, #7]
	bl GetPlayerAvatarStateTransitionByGraphicsId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r0, r4
	ldrb r1, [r5, #1]
	orrs r0, r1
	strb r0, [r5, #1]
	bl DoPlayerAvatarTransition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B940: .4byte 0x02037230
	thumb_func_end SetPlayerAvatarExtraStateTransition

	thumb_func_start InitPlayerAvatar
InitPlayerAvatar: @ 0x0808B944
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x18
	adds r4, r0, #0
	adds r5, r1, #0
	mov sb, r2
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0
	mov r1, r8
	bl sub_0808B6B8
	mov r1, sp
	movs r3, #0
	strb r0, [r1, #1]
	mov r0, sp
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #7
	movs r6, #0
	strh r4, [r0, #4]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	subs r5, #7
	strh r5, [r0, #6]
	strb r6, [r0, #8]
	movs r0, #0xb
	strb r0, [r1, #9]
	mov r2, sp
	ldrb r1, [r2, #0xa]
	subs r0, #0x1b
	ands r0, r1
	strb r0, [r2, #0xa]
	mov r0, sp
	strb r6, [r0, #0xa]
	strh r3, [r0, #0xc]
	strh r3, [r0, #0xe]
	str r3, [sp, #0x10]
	strh r3, [r0, #0x14]
	bl SpawnSpecialEventObject
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #3
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, _0808BA04
	adds r4, r4, r0
	ldrb r0, [r4, #2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #2]
	bl CreateWarpArrowSprite
	strb r0, [r4, #0x1b]
	adds r0, r4, #0
	mov r1, sb
	bl EventObjectTurn
	bl ClearPlayerAvatarInfo
	ldr r0, _0808BA08
	strb r6, [r0, #2]
	strb r6, [r0, #3]
	strb r5, [r0, #5]
	ldrb r1, [r4, #4]
	strb r1, [r0, #4]
	mov r1, r8
	strb r1, [r0, #7]
	movs r0, #0x21
	bl SetPlayerAvatarStateMask
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BA04: .4byte 0x02036FF0
_0808BA08: .4byte 0x02037230
	thumb_func_end InitPlayerAvatar

	thumb_func_start sub_0808BA0C
sub_0808BA0C: @ 0x0808BA0C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _0808BA6C
	ldr r5, _0808BA70
	ldrb r0, [r5, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r0, #1
	ands r4, r0
	lsls r3, r4, #5
	ldrb r2, [r1, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #1]
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808BA64
	ldr r2, _0808BA74
	ldrb r1, [r5, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #0x1a]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	lsls r3, r4, #2
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_0808BA64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BA6C: .4byte 0x02036FF0
_0808BA70: .4byte 0x02037230
_0808BA74: .4byte 0x020205AC
	thumb_func_end sub_0808BA0C

	thumb_func_start sub_0808BA78
sub_0808BA78: @ 0x0808BA78
	push {r4, r5, lr}
	ldr r5, _0808BAB4
	ldrb r0, [r5, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808BAB8
	adds r4, r4, r0
	movs r0, #5
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808BABC
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BAB4: .4byte 0x02037230
_0808BAB8: .4byte 0x02036FF0
_0808BABC: .4byte 0x020205AC
	thumb_func_end sub_0808BA78

	thumb_func_start sub_0808BAC0
sub_0808BAC0: @ 0x0808BAC0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _0808BB0C
	ldrb r0, [r6, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808BB10
	adds r4, r4, r0
	movs r0, #6
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r0, [r6, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808BB14
	adds r4, r4, r0
	adds r0, r5, #0
	bl GetWalkInPlaceNormalMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BB0C: .4byte 0x02037230
_0808BB10: .4byte 0x02036FF0
_0808BB14: .4byte 0x020205AC
	thumb_func_end sub_0808BAC0

	thumb_func_start sub_0808BB18
sub_0808BB18: @ 0x0808BB18
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _0808BB80
	ldrb r0, [r6, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808BB84
	adds r4, r4, r0
	movs r0, #2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r0, [r6, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808BB88
	mov r8, r0
	add r4, r8
	adds r0, r5, #0
	bl GetSlideMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldrb r1, [r6, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	movs r1, #1
	bl SeekSpriteAnim
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BB80: .4byte 0x02037230
_0808BB84: .4byte 0x02036FF0
_0808BB88: .4byte 0x020205AC
	thumb_func_end sub_0808BB18

	thumb_func_start sub_0808BB8C
sub_0808BB8C: @ 0x0808BB8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _0808BBD8
	ldrb r0, [r6, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808BBDC
	adds r4, r4, r0
	movs r0, #7
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r0, [r6, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808BBE0
	adds r4, r4, r0
	adds r0, r5, #0
	bl GetJumpInPlaceMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BBD8: .4byte 0x02037230
_0808BBDC: .4byte 0x02036FF0
_0808BBE0: .4byte 0x020205AC
	thumb_func_end sub_0808BB8C

	thumb_func_start sub_0808BBE4
sub_0808BBE4: @ 0x0808BBE4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldrb r0, [r5, #0x1e]
	mov r8, r0
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	movs r6, #1
	ldr r1, _0808BC48
	mov sb, r1
	mov r4, sp
	mov r7, sp
	adds r7, #2
_0808BC06:
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, sb
	ldr r1, [r0]
	mov r0, r8
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808BC4C
	ldrb r0, [r5, #0x18]
	lsrs r0, r0, #4
	cmp r6, r0
	bne _0808BC4C
	ldrh r0, [r5, #0x10]
	strh r0, [r4]
	ldrh r0, [r5, #0x12]
	strh r0, [r7]
	adds r0, r6, #0
	mov r1, sp
	adds r2, r7, #0
	bl MoveCoords
	ldrb r0, [r5, #0x1b]
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #0
	ldrsh r3, [r7, r1]
	adds r1, r6, #0
	bl ShowWarpArrowSprite
	b _0808BC66
	.align 2, 0
_0808BC48: .4byte 0x0846F940
_0808BC4C:
	ldrh r1, [r4]
	adds r1, #1
	strh r1, [r4]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #3
	ble _0808BC06
	ldrb r0, [r5, #0x1b]
	bl SetSpriteInvisible
_0808BC66:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0808BBE4

	thumb_func_start StartStrengthAnim
StartStrengthAnim: @ 0x0808BC74
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _0808BCA8
	adds r0, r6, #0
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808BCAC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xa]
	strh r5, [r1, #0xc]
	bl _call_via_r6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BCA8: .4byte 0x0808BCB1
_0808BCAC: .4byte 0x03005B60
	thumb_func_end StartStrengthAnim

	thumb_func_start Task_BumpBoulder
Task_BumpBoulder: @ 0x0808BCB0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _0808BCF8
	ldr r2, _0808BCFC
	ldr r5, _0808BD00
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0808BCC4:
	movs r0, #8
	ldrsh r3, [r4, r0]
	lsls r3, r3, #2
	adds r3, r3, r6
	ldr r0, _0808BD04
	ldrb r0, [r0, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r5
	ldr r3, [r3]
	adds r0, r4, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808BCC4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BCF8: .4byte 0x0846F950
_0808BCFC: .4byte 0x03005B60
_0808BD00: .4byte 0x02036FF0
_0808BD04: .4byte 0x02037230
	thumb_func_end Task_BumpBoulder

	thumb_func_start sub_0808BD08
sub_0808BD08: @ 0x0808BD08
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptContext2_Enable
	ldr r1, _0808BD24
	movs r0, #1
	strb r0, [r1, #6]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808BD24: .4byte 0x02037230
	thumb_func_end sub_0808BD08

	thumb_func_start do_boulder_dust
do_boulder_dust: @ 0x0808BD28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r5, #0
	bl EventObjectIsHeldMovementActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808BD42
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
_0808BD42:
	adds r0, r4, #0
	bl EventObjectIsHeldMovementActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808BD54
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
_0808BD54:
	adds r0, r5, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808BDD6
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808BDD6
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	ldrb r0, [r6, #0xc]
	bl sub_08092F08
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl EventObjectSetHeldMovement
	ldrb r0, [r6, #0xc]
	bl sub_08092CCC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldr r2, _0808BDE0
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, #4]
	ldrb r0, [r4, #0xb]
	lsrs r0, r0, #4
	str r0, [r2, #8]
	ldr r3, _0808BDE4
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	str r0, [r2, #0xc]
	movs r0, #0xa
	bl FieldEffectStart
	movs r0, #0xd6
	bl PlaySE
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
_0808BDD6:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808BDE0: .4byte 0x020388A8
_0808BDE4: .4byte 0x020205AC
	thumb_func_end do_boulder_dust

	thumb_func_start sub_0808BDE8
sub_0808BDE8: @ 0x0808BDE8
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	adds r0, r4, #0
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808BE2A
	adds r0, r5, #0
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808BE2A
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	ldr r1, _0808BE34
	movs r0, #0
	strb r0, [r1, #6]
	bl ScriptContext2_Disable
	ldr r0, _0808BE38
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0808BE2A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808BE34: .4byte 0x02037230
_0808BE38: .4byte 0x0808BCB1
	thumb_func_end sub_0808BDE8

	thumb_func_start DoPlayerMatJump
DoPlayerMatJump: @ 0x0808BE3C
	push {r4, lr}
	ldr r4, _0808BE58
	adds r0, r4, #0
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808BE58: .4byte 0x0808BE5D
	thumb_func_end DoPlayerMatJump

	thumb_func_start DoPlayerAvatarSecretBaseMatJump
DoPlayerAvatarSecretBaseMatJump: @ 0x0808BE5C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0808BE98
	ldr r2, _0808BE9C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0808BE6E:
	movs r0, #8
	ldrsh r2, [r4, r0]
	lsls r2, r2, #2
	adds r2, r2, r5
	ldr r0, _0808BEA0
	ldrb r0, [r0, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0808BEA4
	adds r1, r1, r0
	ldr r2, [r2]
	adds r0, r4, #0
	bl _call_via_r2
	thumb_func_end DoPlayerAvatarSecretBaseMatJump

	thumb_func_start sub_0808BE8C
sub_0808BE8C: @ 0x0808BE8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808BE6E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BE98: .4byte 0x0846F95C
_0808BE9C: .4byte 0x03005B60
_0808BEA0: .4byte 0x02037230
_0808BEA4: .4byte 0x02036FF0
	thumb_func_end sub_0808BE8C

	thumb_func_start PlayerAvatar_DoSecretBaseMatJump
PlayerAvatar_DoSecretBaseMatJump: @ 0x0808BEA8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _0808BF0C
	movs r0, #1
	strb r0, [r5, #6]
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808BF04
	movs r0, #0xa
	bl PlaySE
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092E2C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldrh r0, [r6, #0xa]
	adds r0, #1
	strh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0808BF04
	movs r0, #0
	strb r0, [r5, #6]
	ldrb r0, [r5, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r5, #1]
	ldr r0, _0808BF10
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0808BF04:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808BF0C: .4byte 0x02037230
_0808BF10: .4byte 0x0808BE5D
	thumb_func_end PlayerAvatar_DoSecretBaseMatJump

	thumb_func_start DoPlayerMatSpin
DoPlayerMatSpin: @ 0x0808BF14
	push {r4, lr}
	ldr r4, _0808BF30
	adds r0, r4, #0
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808BF30: .4byte 0x0808BF35
	thumb_func_end DoPlayerMatSpin

	thumb_func_start PlayerAvatar_DoSecretBaseMatSpin
PlayerAvatar_DoSecretBaseMatSpin: @ 0x0808BF34
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0808BF70
	ldr r2, _0808BF74
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0808BF46:
	movs r0, #8
	ldrsh r2, [r4, r0]
	lsls r2, r2, #2
	adds r2, r2, r5
	ldr r0, _0808BF78
	ldrb r0, [r0, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0808BF7C
	adds r1, r1, r0
	ldr r2, [r2]
	adds r0, r4, #0
	bl _call_via_r2
	thumb_func_end PlayerAvatar_DoSecretBaseMatSpin

	thumb_func_start sub_0808BF64
sub_0808BF64: @ 0x0808BF64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808BF46
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BF70: .4byte 0x0846F960
_0808BF74: .4byte 0x03005B60
_0808BF78: .4byte 0x02037230
_0808BF7C: .4byte 0x02036FF0
	thumb_func_end sub_0808BF64

	thumb_func_start PlayerAvatar_SecretBaseMatSpinStep0
PlayerAvatar_SecretBaseMatSpinStep0: @ 0x0808BF80
	push {lr}
	ldrh r2, [r0, #8]
	adds r2, #1
	strh r2, [r0, #8]
	ldrb r1, [r1, #0x18]
	lsrs r1, r1, #4
	strh r1, [r0, #0xa]
	ldr r1, _0808BFA4
	movs r0, #1
	strb r0, [r1, #6]
	bl ScriptContext2_Enable
	movs r0, #0x2d
	bl PlaySE
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0808BFA4: .4byte 0x02037230
	thumb_func_end PlayerAvatar_SecretBaseMatSpinStep0

	thumb_func_start PlayerAvatar_SecretBaseMatSpinStep1
PlayerAvatar_SecretBaseMatSpinStep1: @ 0x0808BFA8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0808C01C
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808C010
	ldrb r0, [r5, #0x18]
	lsrs r0, r0, #4
	subs r0, #1
	add r0, sp
	ldrb r6, [r0]
	adds r0, r6, #0
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl EventObjectSetHeldMovement
	ldrb r0, [r4, #0xa]
	cmp r6, r0
	bne _0808BFEE
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
_0808BFEE:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #3
	ble _0808C010
	ldrb r0, [r4, #0xa]
	bl GetOppositeDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bne _0808C010
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0808C010:
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808C01C: .4byte 0x0846F970
	thumb_func_end PlayerAvatar_SecretBaseMatSpinStep1

	thumb_func_start PlayerAvatar_SecretBaseMatSpinStep2
PlayerAvatar_SecretBaseMatSpinStep2: @ 0x0808C020
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0808C05C
	mov r0, sp
	movs r2, #5
	bl memcpy
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808C050
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	movs r0, #1
	strh r0, [r5, #8]
_0808C050:
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C05C: .4byte 0x0846F974
	thumb_func_end PlayerAvatar_SecretBaseMatSpinStep2

	thumb_func_start PlayerAvatar_SecretBaseMatSpinStep3
PlayerAvatar_SecretBaseMatSpinStep3: @ 0x0808C060
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808C0A4
	ldrb r0, [r4, #0xa]
	bl GetOppositeDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092CCC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl EventObjectSetHeldMovement
	bl ScriptContext2_Disable
	ldr r1, _0808C0AC
	movs r0, #0
	strb r0, [r1, #6]
	ldr r0, _0808C0B0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0808C0A4:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C0AC: .4byte 0x02037230
_0808C0B0: .4byte 0x0808BF35
	thumb_func_end PlayerAvatar_SecretBaseMatSpinStep3

	thumb_func_start sub_0808C0B4
sub_0808C0B4: @ 0x0808C0B4
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ScriptContext2_Enable
	bl Overworld_ClearSavedMusic
	bl Overworld_ChangeMusicToDefault
	ldr r2, _0808C100
	ldrb r1, [r2]
	movs r0, #0xf7
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strb r0, [r2, #6]
	ldr r5, _0808C104
	adds r0, r5, #0
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808C108
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	bl _call_via_r5
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808C100: .4byte 0x02037230
_0808C104: .4byte 0x0808C10D
_0808C108: .4byte 0x03005B60
	thumb_func_end sub_0808C0B4

	thumb_func_start taskFF_0805D1D4
taskFF_0805D1D4: @ 0x0808C10C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0808C168
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808C16C
	adds r5, r0, r1
	adds r0, r5, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808C138
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808C160
_0808C138:
	ldrb r0, [r5, #0x1a]
	movs r1, #2
	bl sub_081554E8
	ldr r0, _0808C170
	lsls r4, r6, #2
	adds r4, r4, r6
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r0, [r4, #8]
	bl sub_08092EB0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl EventObjectSetHeldMovement
	ldr r0, _0808C174
	str r0, [r4]
_0808C160:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C168: .4byte 0x02037230
_0808C16C: .4byte 0x02036FF0
_0808C170: .4byte 0x03005B60
_0808C174: .4byte 0x0808C179
	thumb_func_end taskFF_0805D1D4

	thumb_func_start sub_0808C178
sub_0808C178: @ 0x0808C178
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _0808C1E4
	ldrb r1, [r6, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808C1E8
	adds r4, r0, r1
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808C1DE
	movs r0, #0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	movs r0, #0
	strb r0, [r6, #6]
	bl ScriptContext2_Disable
	ldrb r1, [r4, #0x1a]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808C1EC
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r5, #0
	bl DestroyTask
_0808C1DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C1E4: .4byte 0x02037230
_0808C1E8: .4byte 0x02036FF0
_0808C1EC: .4byte 0x020205AC
	thumb_func_end sub_0808C178

	thumb_func_start StartFishing
StartFishing: @ 0x0808C1F0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0808C21C
	adds r0, r5, #0
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808C220
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0x26]
	bl _call_via_r5
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808C21C: .4byte 0x0808C225
_0808C220: .4byte 0x03005B60
	thumb_func_end StartFishing

	thumb_func_start Task_Fishing
Task_Fishing: @ 0x0808C224
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0808C254
	ldr r2, _0808C258
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0808C236:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808C236
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808C254: .4byte 0x0846F97C
_0808C258: .4byte 0x03005B60
	thumb_func_end Task_Fishing

	thumb_func_start Fishing1
Fishing1: @ 0x0808C25C
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptContext2_Enable
	ldr r1, _0808C278
	movs r0, #1
	strb r0, [r1, #6]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808C278: .4byte 0x02037230
	thumb_func_end Fishing1

	thumb_func_start Fishing2
Fishing2: @ 0x0808C27C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _0808C304
	mov r0, sp
	movs r2, #6
	bl memcpy
	add r4, sp, #8
	ldr r1, _0808C308
	adds r0, r4, #0
	movs r2, #6
	bl memcpy
	movs r0, #0
	strh r0, [r5, #0x20]
	bl Random
	movs r2, #0x26
	ldrsh r1, [r5, r2]
	lsls r1, r1, #1
	mov r2, sp
	adds r6, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r4, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r6]
	adds r1, r1, r0
	strh r1, [r5, #0x22]
	ldr r3, _0808C30C
	ldr r2, _0808C310
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #5]
	strh r0, [r5, #0x24]
	ldrb r0, [r2, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r3
	adds r0, r4, #0
	bl EventObjectClearHeldMovementIfActive
	ldrb r0, [r4, #1]
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_0808BAC0
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808C304: .4byte 0x0846F9BC
_0808C308: .4byte 0x0846F9C2
_0808C30C: .4byte 0x02036FF0
_0808C310: .4byte 0x02037230
	thumb_func_end Fishing2

	thumb_func_start Fishing3
Fishing3: @ 0x0808C314
	push {r4, lr}
	adds r4, r0, #0
	bl AlignFishingAnimationFrames
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	ble _0808C330
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0808C330:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Fishing3

	thumb_func_start Fishing4
Fishing4: @ 0x0808C338
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #1
	bl sub_08197650
	ldrh r0, [r4, #8]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	strh r1, [r4, #0xc]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0808C370
	adds r0, r1, #4
	strh r0, [r4, #0xe]
_0808C370:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #9
	ble _0808C37C
	movs r0, #0xa
	strh r0, [r4, #0xe]
_0808C37C:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Fishing4

	thumb_func_start Fishing5
Fishing5: @ 0x0808C384
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r1, _0808C3C0
	add r0, sp, #0xc
	movs r2, #2
	bl memcpy
	bl AlignFishingAnimationFrames
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	strh r1, [r4, #0xa]
	ldr r0, _0808C3C4
	ldrh r0, [r0, #0x2e]
	movs r2, #1
	ands r2, r0
	cmp r2, #0
	beq _0808C3C8
	movs r0, #0xb
	strh r0, [r4, #8]
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0808C3BA
	movs r0, #0xc
	strh r0, [r4, #8]
_0808C3BA:
	movs r0, #1
	b _0808C41A
	.align 2, 0
_0808C3C0: .4byte 0x0846F9C8
_0808C3C4: .4byte 0x03002360
_0808C3C8:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _0808C418
	strh r2, [r4, #0xa]
	movs r3, #0xc
	ldrsh r1, [r4, r3]
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _0808C3F8
	ldrh r0, [r4, #8]
	adds r1, r0, #1
	strh r1, [r4, #8]
	ldrh r2, [r4, #0x20]
	movs r3, #0x20
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0808C3F2
	adds r0, r1, #1
	strh r0, [r4, #8]
_0808C3F2:
	adds r0, r2, #1
	strh r0, [r4, #0x20]
	b _0808C418
_0808C3F8:
	movs r0, #0xc
	ldrsh r3, [r4, r0]
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r0, #2
	str r0, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r0, #0
	movs r1, #1
	add r2, sp, #0xc
	bl AddTextPrinterParameterized
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
_0808C418:
	movs r0, #0
_0808C41A:
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Fishing5

	thumb_func_start Fishing6
Fishing6: @ 0x0808C424
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl AlignFishingAnimationFrames
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r6, #0
	bl DoesCurrentMapHaveFishingMons
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808C444
	movs r0, #0xb
	strh r0, [r5, #8]
	b _0808C4C4
_0808C444:
	ldr r4, _0808C494
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _0808C47C
	adds r0, r4, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x15
	beq _0808C464
	cmp r0, #0x3c
	bne _0808C47C
_0808C464:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bls _0808C47C
	movs r6, #1
_0808C47C:
	cmp r6, #0
	bne _0808C49A
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808C498
	movs r0, #0xb
	strh r0, [r5, #8]
	b _0808C49A
	.align 2, 0
_0808C494: .4byte 0x02024190
_0808C498:
	movs r6, #1
_0808C49A:
	cmp r6, #1
	bne _0808C4C4
	ldr r0, _0808C4CC
	ldrb r0, [r0, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808C4D0
	adds r4, r4, r0
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetWalkNormalMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
_0808C4C4:
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808C4CC: .4byte 0x02037230
_0808C4D0: .4byte 0x020205AC
	thumb_func_end Fishing6

	thumb_func_start Fishing7
Fishing7: @ 0x0808C4D4
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, _0808C510
	add r0, sp, #0xc
	movs r2, #0xc
	bl memcpy
	bl AlignFishingAnimationFrames
	movs r0, #0x12
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	strh r4, [r5, #0xa]
	movs r0, #0
	add sp, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C510: .4byte 0x0846F9CA
	thumb_func_end Fishing7

	thumb_func_start Fishing8
Fishing8: @ 0x0808C514
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _0808C548
	mov r0, sp
	movs r2, #6
	bl memcpy
	bl AlignFishingAnimationFrames
	ldrh r1, [r4, #0xa]
	adds r1, #1
	strh r1, [r4, #0xa]
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	add r0, sp
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _0808C54C
	movs r0, #0xc
	b _0808C55C
	.align 2, 0
_0808C548: .4byte 0x0846F9D6
_0808C54C:
	ldr r0, _0808C568
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808C55E
	ldrh r0, [r4, #8]
	adds r0, #1
_0808C55C:
	strh r0, [r4, #8]
_0808C55E:
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808C568: .4byte 0x03002360
	thumb_func_end Fishing8

	thumb_func_start Fishing9
Fishing9: @ 0x0808C56C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _0808C5D0
	mov r0, sp
	movs r2, #0xc
	bl memcpy
	bl AlignFishingAnimationFrames
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0808C5C2
	cmp r1, #1
	bgt _0808C5C6
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	movs r3, #0x20
	ldrsh r2, [r4, r3]
	lsls r2, r2, #1
	movs r3, #0x26
	ldrsh r1, [r4, r3]
	lsls r1, r1, #2
	adds r2, r2, r1
	mov r3, sp
	adds r1, r3, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _0808C5C6
_0808C5C2:
	movs r0, #3
	strh r0, [r4, #8]
_0808C5C6:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808C5D0: .4byte 0x0846F9DC
	thumb_func_end Fishing9

	thumb_func_start Fishing10
Fishing10: @ 0x0808C5D4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl AlignFishingAnimationFrames
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _0808C614
	movs r5, #0
	str r5, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #1
	bl AddTextPrinterParameterized2
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	strh r5, [r4, #0xa]
	movs r0, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C614: .4byte 0x0846F9E8
	thumb_func_end Fishing10

	thumb_func_start Fishing11
Fishing11: @ 0x0808C618
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0808C62C
	bl AlignFishingAnimationFrames
_0808C62C:
	bl RunTextPrinters
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0808C6C8
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	bne _0808C6C0
	ldr r7, _0808C6B4
	ldrb r0, [r7, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808C6B8
	mov r8, r0
	add r4, r8
	ldrh r1, [r5, #0x24]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl EventObjectTurn
	ldrb r1, [r7]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808C68A
	ldrb r0, [r7, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrb r0, [r1, #0x1a]
	movs r1, #0
	movs r2, #0
	bl sub_08155540
_0808C68A:
	ldr r2, _0808C6BC
	ldrb r1, [r7, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r6, [r0, #0x24]
	ldrb r1, [r7, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r6, [r0, #0x26]
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	b _0808C6F0
	.align 2, 0
_0808C6B4: .4byte 0x02037230
_0808C6B8: .4byte 0x02036FF0
_0808C6BC: .4byte 0x020205AC
_0808C6C0:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0808C6F0
_0808C6C8:
	ldr r1, _0808C6FC
	movs r0, #0
	strb r0, [r1, #6]
	bl ScriptContext2_Disable
	ldrh r0, [r5, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FishingWildEncounter
	movs r0, #1
	bl sub_080EE470
	ldr r0, _0808C700
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0808C6F0:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808C6FC: .4byte 0x02037230
_0808C700: .4byte 0x0808C225
	thumb_func_end Fishing11

	thumb_func_start Fishing12
Fishing12: @ 0x0808C704
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl AlignFishingAnimationFrames
	ldr r0, _0808C768
	ldrb r0, [r0, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808C76C
	adds r4, r4, r0
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetWalkInPlaceSlowMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _0808C770
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #1
	bl AddTextPrinterParameterized2
	movs r0, #0xd
	strh r0, [r5, #8]
	movs r0, #1
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C768: .4byte 0x02037230
_0808C76C: .4byte 0x020205AC
_0808C770: .4byte 0x0846F9F7
	thumb_func_end Fishing12

	thumb_func_start Fishing13
Fishing13: @ 0x0808C774
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl AlignFishingAnimationFrames
	ldr r0, _0808C7D8
	ldrb r0, [r0, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808C7DC
	adds r4, r4, r0
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetWalkInPlaceSlowMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _0808C7E0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #1
	bl AddTextPrinterParameterized2
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #1
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C7D8: .4byte 0x02037230
_0808C7DC: .4byte 0x020205AC
_0808C7E0: .4byte 0x0846FA03
	thumb_func_end Fishing13

	thumb_func_start Fishing14
Fishing14: @ 0x0808C7E4
	push {r4, lr}
	adds r4, r0, #0
	bl AlignFishingAnimationFrames
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Fishing14

	thumb_func_start Fishing15
Fishing15: @ 0x0808C7FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl AlignFishingAnimationFrames
	ldr r7, _0808C890
	ldr r5, _0808C894
	ldrb r0, [r5, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x3f
	ldrb r0, [r1]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _0808C882
	ldrb r0, [r5, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0808C898
	mov r8, r0
	add r4, r8
	ldrh r1, [r6, #0x24]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl EventObjectTurn
	ldrb r1, [r5]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808C862
	ldrb r0, [r5, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrb r0, [r1, #0x1a]
	movs r1, #0
	movs r2, #0
	bl sub_08155540
_0808C862:
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	movs r2, #0
	strh r2, [r0, #0x24]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
_0808C882:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808C890: .4byte 0x020205AC
_0808C894: .4byte 0x02037230
_0808C898: .4byte 0x02036FF0
	thumb_func_end Fishing15

	thumb_func_start Fishing16
Fishing16: @ 0x0808C89C
	push {lr}
	bl RunTextPrinters
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0808C8D8
	ldr r0, _0808C8E0
	strb r1, [r0, #6]
	bl ScriptContext2_Disable
	bl UnfreezeEventObjects
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	movs r0, #0
	bl sub_080EE470
	ldr r0, _0808C8E4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0808C8D8:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0808C8E0: .4byte 0x02037230
_0808C8E4: .4byte 0x0808C225
	thumb_func_end Fishing16

	thumb_func_start AlignFishingAnimationFrames
AlignFishingAnimationFrames: @ 0x0808C8E8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0808C9D4
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808C9D8
	adds r4, r0, r1
	adds r0, r4, #0
	bl AnimateSprite
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r5, [r0]
	movs r0, #0x2a
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	ldr r1, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r6, r5, #2
	adds r0, r6, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, r7
	beq _0808C95A
	adds r3, r4, #0
	adds r3, #0x2c
	ldrb r2, [r3]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1a
	adds r1, #1
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r1, ip
	ldrb r0, [r1]
	ldr r1, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r6, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0808C960
_0808C95A:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0808C960:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	ldr r1, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r5, [r0]
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0808C992
	movs r0, #8
	strh r0, [r4, #0x24]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808C992
	ldr r0, _0808C9DC
	strh r0, [r4, #0x24]
_0808C992:
	cmp r5, #5
	bne _0808C99A
	ldr r0, _0808C9DC
	strh r0, [r4, #0x26]
_0808C99A:
	adds r0, r5, #0
	subs r0, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0808C9AA
	movs r0, #8
	strh r0, [r4, #0x26]
_0808C9AA:
	ldr r3, _0808C9D4
	ldrb r1, [r3]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808C9CE
	ldr r2, _0808C9E0
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	movs r1, #0x26
	ldrsh r2, [r4, r1]
	movs r1, #1
	bl sub_08155540
_0808C9CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C9D4: .4byte 0x02037230
_0808C9D8: .4byte 0x020205AC
_0808C9DC: .4byte 0x0000FFF8
_0808C9E0: .4byte 0x02036FF0
	thumb_func_end AlignFishingAnimationFrames

	thumb_func_start sub_0808C9E4
sub_0808C9E4: @ 0x0808C9E4
	ldr r1, _0808C9EC
	strb r0, [r1]
	bx lr
	.align 2, 0
_0808C9EC: .4byte 0x02036FEC
	thumb_func_end sub_0808C9E4

	thumb_func_start sub_0808C9F0
sub_0808C9F0: @ 0x0808C9F0
	push {lr}
	ldr r1, _0808CA00
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808C9FC
	movs r0, #1
_0808C9FC:
	pop {r1}
	bx r1
	.align 2, 0
_0808CA00: .4byte 0x02036FEC
	thumb_func_end sub_0808C9F0

	thumb_func_start sub_0808CA04
sub_0808CA04: @ 0x0808CA04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	ldr r0, _0808CA48
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808CA4C
	adds r4, r0, r1
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808CA50
	adds r7, r0, r1
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0808CA54
	adds r5, r0, r1
	movs r0, #0
	ldrsh r6, [r5, r0]
	cmp r6, #1
	beq _0808CABA
	cmp r6, #1
	bgt _0808CA58
	cmp r6, #0
	beq _0808CA5E
	b _0808CAFA
	.align 2, 0
_0808CA48: .4byte 0x02037230
_0808CA4C: .4byte 0x02036FF0
_0808CA50: .4byte 0x020205AC
_0808CA54: .4byte 0x03005B68
_0808CA58:
	cmp r6, #2
	beq _0808CAF4
	b _0808CAFA
_0808CA5E:
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808CAFA
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_0808C9E4
	movs r1, #0
	mov r8, r1
	strh r6, [r5, #2]
	movs r0, #1
	strh r0, [r5, #4]
	ldrh r0, [r7, #0x26]
	ldrh r2, [r7, #0x22]
	adds r0, r0, r2
	lsls r0, r0, #4
	strh r0, [r5, #6]
	strh r6, [r7, #0x26]
	bl CameraObjectReset2
	ldrb r0, [r4, #3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4, #3]
	ldrb r1, [r7, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #5]
	adds r0, r7, #0
	adds r0, #0x43
	mov r1, r8
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_0808CABA:
	adds r1, r5, #2
	adds r0, r4, #0
	bl sub_0808CCFC
	ldrh r0, [r5, #6]
	ldrh r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r5, #6]
	adds r1, #3
	strh r1, [r5, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r7, #0x22]
	movs r2, #0x22
	ldrsh r1, [r7, r2]
	ldr r0, _0808CAF0
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r1, r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0808CAFA
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _0808CAFA
	.align 2, 0
_0808CAF0: .4byte 0x03005B48
_0808CAF4:
	adds r0, r2, #0
	bl DestroyTask
_0808CAFA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0808CA04

	thumb_func_start sub_0808CB04
sub_0808CB04: @ 0x0808CB04
	push {r4, lr}
	ldr r4, _0808CB20
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808CB20: .4byte 0x0808CB6D
	thumb_func_end sub_0808CB04

	thumb_func_start sub_0808CB24
sub_0808CB24: @ 0x0808CB24
	push {lr}
	ldr r0, _0808CB34
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808CB34: .4byte 0x0808CB6D
	thumb_func_end sub_0808CB24

	thumb_func_start sub_0808CB38
sub_0808CB38: @ 0x0808CB38
	push {r4, lr}
	ldr r4, _0808CB54
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808CB54: .4byte 0x0808CA05
	thumb_func_end sub_0808CB38

	thumb_func_start sub_0808CB58
sub_0808CB58: @ 0x0808CB58
	push {lr}
	ldr r0, _0808CB68
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808CB68: .4byte 0x0808CA05
	thumb_func_end sub_0808CB58

	thumb_func_start sub_0808CB6C
sub_0808CB6C: @ 0x0808CB6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0808CBB4
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808CBB8
	adds r4, r0, r1
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808CBBC
	adds r7, r0, r1
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _0808CBC0
	adds r5, r0, r1
	movs r2, #0
	ldrsh r6, [r5, r2]
	cmp r6, #1
	beq _0808CC4E
	cmp r6, #1
	bgt _0808CBC4
	cmp r6, #0
	beq _0808CBCE
	b _0808CCEE
	.align 2, 0
_0808CBB4: .4byte 0x02037230
_0808CBB8: .4byte 0x02036FF0
_0808CBBC: .4byte 0x020205AC
_0808CBC0: .4byte 0x03005B68
_0808CBC4:
	cmp r6, #2
	beq _0808CC8C
	cmp r6, #3
	beq _0808CCAA
	b _0808CCEE
_0808CBCE:
	bl sub_0808C9F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xa]
	ldr r1, _0808CC88
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectForceSetHeldMovement
	movs r0, #0
	mov sb, r0
	strh r6, [r5, #2]
	movs r0, #0x74
	strh r0, [r5, #4]
	ldrh r0, [r7, #0x22]
	strh r0, [r5, #8]
	ldrb r0, [r7, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	strh r0, [r5, #0xc]
	movs r1, #0x43
	adds r1, r1, r7
	mov r8, r1
	ldrb r0, [r1]
	strh r0, [r5, #0xe]
	ldrh r0, [r7, #0x26]
	adds r0, #0x20
	rsbs r0, r0, #0
	lsls r0, r0, #4
	strh r0, [r5, #6]
	strh r6, [r7, #0x26]
	bl CameraObjectReset2
	ldrb r0, [r4, #3]
	movs r2, #4
	orrs r0, r2
	strb r0, [r4, #3]
	ldrb r1, [r7, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, #5]
	mov r3, sb
	mov r2, r8
	strb r3, [r2]
	adds r2, r7, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_0808CC4E:
	adds r1, r5, #2
	adds r0, r4, #0
	bl sub_0808CCFC
	ldrh r0, [r5, #4]
	ldrh r2, [r5, #6]
	adds r1, r0, r2
	strh r1, [r5, #6]
	subs r0, #3
	strh r0, [r5, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bgt _0808CC6E
	movs r0, #4
	strh r0, [r5, #4]
_0808CC6E:
	ldrh r0, [r5, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r7, #0x22]
	ldrh r2, [r5, #8]
	movs r3, #8
	ldrsh r1, [r5, r3]
	cmp r0, r1
	blt _0808CCEE
	strh r2, [r7, #0x22]
	movs r0, #0
	strh r0, [r5, #0x10]
	b _0808CCA2
	.align 2, 0
_0808CC88: .4byte 0x0846FA13
_0808CC8C:
	adds r1, r5, #2
	adds r0, r4, #0
	bl sub_0808CCFC
	ldrh r0, [r5, #0x10]
	adds r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0808CCEE
_0808CCA2:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _0808CCEE
_0808CCAA:
	movs r0, #0xa
	ldrsh r6, [r5, r0]
	adds r1, r5, #2
	adds r0, r4, #0
	bl sub_0808CCFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bne _0808CCEE
	ldrb r1, [r4, #3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	movs r0, #3
	ldrb r1, [r5, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r7, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #5]
	ldrh r1, [r5, #0xe]
	adds r0, r7, #0
	adds r0, #0x43
	strb r1, [r0]
	bl CameraObjectReset1
	mov r0, r8
	bl DestroyTask
_0808CCEE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0808CB6C

	thumb_func_start sub_0808CCFC
sub_0808CCFC: @ 0x0808CCFC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldrh r1, [r6]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #7
	bgt _0808CD18
	adds r0, r1, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0808CD54
_0808CD18:
	adds r0, r5, #0
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808CD54
	ldr r4, _0808CD50
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl EventObjectForceSetHeldMovement
	movs r0, #0
	strh r0, [r6]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, r0, r4
	ldrb r0, [r0]
	b _0808CD5A
	.align 2, 0
_0808CD50: .4byte 0x0846FA13
_0808CD54:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
_0808CD5A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0808CCFC

