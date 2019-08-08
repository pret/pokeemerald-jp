.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start MovePlayerOnBike
MovePlayerOnBike: @ 0x081199B4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _081199D8
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081199DC
	adds r0, r3, #0
	adds r1, r4, #0
	bl MovePlayerOnMachBike
	b _081199E4
	.align 2, 0
_081199D8: .4byte 0x02037230
_081199DC:
	adds r0, r3, #0
	adds r1, r4, #0
	bl MovePlayerOnAcroBike
_081199E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MovePlayerOnBike

	thumb_func_start MovePlayerOnMachBike
MovePlayerOnMachBike: @ 0x081199EC
	push {r4, lr}
	sub sp, #4
	mov r1, sp
	strb r0, [r1]
	ldr r4, _08119A18
	mov r0, sp
	bl GetMachBikeTransition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	mov r1, sp
	ldrb r1, [r1]
	ldr r2, [r0]
	adds r0, r1, #0
	bl _call_via_r2
	add sp, #4
	thumb_func_end MovePlayerOnMachBike

	thumb_func_start AcroBikeTransition_FaceDirection
AcroBikeTransition_FaceDirection: @ 0x08119A10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119A18: .4byte 0x08573030
	thumb_func_end AcroBikeTransition_FaceDirection

	thumb_func_start GetMachBikeTransition
GetMachBikeTransition: @ 0x08119A1C
	push {r4, lr}
	adds r4, r0, #0
	bl GetPlayerMovementDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	ldrb r1, [r4]
	cmp r1, #0
	bne _08119A44
	strb r0, [r4]
	ldr r2, _08119A40
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	bne _08119A58
	strb r1, [r2, #2]
	movs r0, #0
	b _08119A6C
	.align 2, 0
_08119A40: .4byte 0x02037230
_08119A44:
	ldr r2, _08119A60
	cmp r1, r3
	beq _08119A68
	ldrb r0, [r2, #2]
	cmp r0, #2
	beq _08119A68
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	beq _08119A64
	strb r3, [r4]
_08119A58:
	movs r0, #2
	strb r0, [r2, #2]
	movs r0, #3
	b _08119A6C
	.align 2, 0
_08119A60: .4byte 0x02037230
_08119A64:
	movs r0, #1
	b _08119A6A
_08119A68:
	movs r0, #2
_08119A6A:
	strb r0, [r2, #2]
_08119A6C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetMachBikeTransition

	thumb_func_start MachBikeTransition_FaceDirection
MachBikeTransition_FaceDirection: @ 0x08119A74
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PlayerFaceDirection
	bl Bike_SetBikeStill
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MachBikeTransition_FaceDirection

	thumb_func_start MachBikeTransition_TurnDirection
MachBikeTransition_TurnDirection: @ 0x08119A88
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08119AB8
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08119ABC
	adds r4, r0, r1
	ldrb r1, [r4, #0x1e]
	adds r0, r5, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08119AC0
	adds r0, r5, #0
	bl PlayerTurnInPlace
	bl Bike_SetBikeStill
	b _08119ACA
	.align 2, 0
_08119AB8: .4byte 0x02037230
_08119ABC: .4byte 0x02036FF0
_08119AC0:
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl MachBikeTransition_FaceDirection
_08119ACA:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end MachBikeTransition_TurnDirection

	thumb_func_start MachBikeTransition_TrySpeedUp
MachBikeTransition_TrySpeedUp: @ 0x08119AD0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r5, #0
	ldr r6, _08119B04
	ldrb r1, [r6, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08119B08
	adds r4, r0, r1
	ldrb r1, [r4, #0x1e]
	adds r0, r5, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08119B16
	ldrb r0, [r6, #0xb]
	cmp r0, #0
	beq _08119B0C
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl MachBikeTransition_TrySlowDown
	b _08119B8A
	.align 2, 0
_08119B04: .4byte 0x02037230
_08119B08: .4byte 0x02036FF0
_08119B0C:
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl MachBikeTransition_FaceDirection
	b _08119B8A
_08119B16:
	adds r0, r5, #0
	bl get_some_collision
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bhi _08119B66
	cmp r4, #6
	bne _08119B38
	adds r0, r5, #0
	bl PlayerJumpLedge
	b _08119B8A
_08119B38:
	bl Bike_SetBikeStill
	cmp r4, #4
	bne _08119B54
	adds r0, r5, #0
	bl IsPlayerCollidingWithFarawayIslandMew
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08119B54
	adds r0, r5, #0
	bl PlayerOnBikeCollideWithFarawayIslandMew
	b _08119B8A
_08119B54:
	subs r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08119B8A
	adds r0, r7, #0
	bl PlayerOnBikeCollide
	b _08119B8A
_08119B66:
	ldr r1, _08119B90
	ldrb r0, [r6, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r7, #0
	bl _call_via_r1
	ldrb r2, [r6, #0xa]
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	lsrs r0, r0, #0x19
	adds r0, r2, r0
	strb r0, [r6, #0xb]
	cmp r1, #1
	bhi _08119B8A
	adds r0, r2, #1
	strb r0, [r6, #0xa]
_08119B8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119B90: .4byte 0x08573040
	thumb_func_end MachBikeTransition_TrySpeedUp

	thumb_func_start MachBikeTransition_TrySlowDown
MachBikeTransition_TrySlowDown: @ 0x08119B94
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r5, #0
	ldr r6, _08119BCC
	ldrb r0, [r6, #0xb]
	cmp r0, #0
	beq _08119BAA
	subs r0, #1
	strb r0, [r6, #0xb]
	strb r0, [r6, #0xa]
_08119BAA:
	adds r0, r5, #0
	bl get_some_collision
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bhi _08119BFE
	cmp r4, #6
	bne _08119BD0
	adds r0, r5, #0
	bl PlayerJumpLedge
	b _08119C0E
	.align 2, 0
_08119BCC: .4byte 0x02037230
_08119BD0:
	bl Bike_SetBikeStill
	cmp r4, #4
	bne _08119BEC
	adds r0, r5, #0
	bl IsPlayerCollidingWithFarawayIslandMew
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08119BEC
	adds r0, r5, #0
	bl PlayerOnBikeCollideWithFarawayIslandMew
	b _08119C0E
_08119BEC:
	subs r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08119C0E
	adds r0, r7, #0
	bl PlayerOnBikeCollide
	b _08119C0E
_08119BFE:
	ldr r0, _08119C14
	ldrb r1, [r6, #0xa]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r7, #0
	bl _call_via_r1
_08119C0E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119C14: .4byte 0x08573040
	thumb_func_end MachBikeTransition_TrySlowDown

	thumb_func_start MovePlayerOnAcroBike
MovePlayerOnAcroBike: @ 0x08119C18
	push {r4, lr}
	sub sp, #4
	mov r3, sp
	strb r0, [r3]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _08119C4C
	mov r0, sp
	bl CheckMovementInputAcroBike
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	mov r1, sp
	ldrb r1, [r1]
	ldr r2, [r0]
	adds r0, r1, #0
	bl _call_via_r2
	add sp, #4
	thumb_func_end MovePlayerOnAcroBike

	thumb_func_start sub_08119C44
sub_08119C44: @ 0x08119C44
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119C4C: .4byte 0x0857304C
	thumb_func_end sub_08119C44

	thumb_func_start CheckMovementInputAcroBike
CheckMovementInputAcroBike: @ 0x08119C50
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _08119C74
	ldr r3, _08119C78
	ldrb r3, [r3, #8]
	lsls r3, r3, #2
	adds r3, r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08119C74: .4byte 0x08573080
_08119C78: .4byte 0x02037230
	thumb_func_end CheckMovementInputAcroBike

	thumb_func_start AcroBikeHandleInputNormal
AcroBikeHandleInputNormal: @ 0x08119C7C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	bl GetPlayerMovementDirection
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _08119CB0
	movs r0, #0
	strb r0, [r2, #0xa]
	ldrb r1, [r4]
	cmp r1, #0
	bne _08119CBC
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _08119CB4
	strb r3, [r4]
	strb r1, [r2, #2]
	movs r0, #2
	strb r0, [r2, #8]
	movs r0, #3
	b _08119D10
	.align 2, 0
_08119CB0: .4byte 0x02037230
_08119CB4:
	strb r3, [r4]
	strb r1, [r2, #2]
	movs r0, #0
	b _08119D10
_08119CBC:
	cmp r1, r3
	bne _08119CE2
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _08119CDA
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	bne _08119CDA
	adds r0, #1
	strb r0, [r2, #0xb]
	movs r0, #4
	strb r0, [r2, #8]
	movs r0, #0xb
	b _08119D10
_08119CDA:
	ldrb r0, [r4]
	ldr r2, _08119D08
	cmp r0, r3
	beq _08119D0C
_08119CE2:
	ldr r0, _08119D08
	ldrb r1, [r0, #2]
	adds r2, r0, #0
	cmp r1, #2
	beq _08119D0C
	movs r1, #0
	movs r0, #1
	strb r0, [r2, #8]
	ldrb r0, [r4]
	strb r0, [r2, #9]
	strb r1, [r2, #2]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl CheckMovementInputAcroBike
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08119D10
	.align 2, 0
_08119D08: .4byte 0x02037230
_08119D0C:
	movs r0, #2
	strb r0, [r2, #2]
_08119D10:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AcroBikeHandleInputNormal

	thumb_func_start AcroBikeHandleInputTurning
AcroBikeHandleInputTurning: @ 0x08119D18
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08119D40
	ldrb r0, [r4, #9]
	strb r0, [r5]
	ldrb r0, [r4, #0xa]
	adds r0, #1
	strb r0, [r4, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bls _08119D44
	movs r0, #1
	strb r0, [r4, #2]
	movs r0, #0
	strb r0, [r4, #8]
	bl Bike_SetBikeStill
	movs r0, #1
	b _08119D8A
	.align 2, 0
_08119D40: .4byte 0x02037230
_08119D44:
	bl GetPlayerMovementDirection
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl AcroBike_GetJumpDirection
	ldrb r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _08119D86
	bl Bike_SetBikeStill
	movs r0, #1
	strb r0, [r4, #0xb]
	adds r0, r6, #0
	bl GetOppositeDirection
	ldrb r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _08119D7A
	movs r0, #6
	strb r0, [r4, #8]
	movs r0, #9
	b _08119D8A
_08119D7A:
	movs r0, #2
	strb r0, [r4, #2]
	movs r0, #5
	strb r0, [r4, #8]
	movs r0, #8
	b _08119D8A
_08119D86:
	strb r6, [r5]
	movs r0, #0
_08119D8A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end AcroBikeHandleInputTurning

	thumb_func_start AcroBikeHandleInputWheelieStanding
AcroBikeHandleInputWheelieStanding: @ 0x08119D90
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r4, r2, #0x10
	lsrs r4, r4, #0x10
	bl GetPlayerMovementDirection
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _08119DDC
	ldrb r1, [r5, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08119DE0
	adds r1, r0, r1
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #2
	ands r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #0
	bne _08119DE4
	strb r4, [r5, #0xa]
	ldrb r0, [r1, #0x1e]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08119DEA
	strb r6, [r7]
	strb r0, [r5, #8]
	bl Bike_SetBikeStill
	movs r0, #4
	b _08119E28
	.align 2, 0
_08119DDC: .4byte 0x02037230
_08119DE0: .4byte 0x02036FF0
_08119DE4:
	ldrb r0, [r5, #0xa]
	adds r0, #1
	strb r0, [r5, #0xa]
_08119DEA:
	ldr r1, _08119E00
	ldrb r0, [r1, #0xa]
	cmp r0, #0x27
	bls _08119E04
	strb r6, [r7]
	movs r0, #3
	strb r0, [r1, #8]
	bl Bike_SetBikeStill
	movs r0, #6
	b _08119E28
	.align 2, 0
_08119E00: .4byte 0x02037230
_08119E04:
	ldrb r0, [r7]
	cmp r0, r6
	bne _08119E1A
	movs r0, #2
	strb r0, [r1, #2]
	movs r0, #4
	strb r0, [r1, #8]
	bl Bike_SetBikeStill
	movs r0, #0xa
	b _08119E28
_08119E1A:
	cmp r0, #0
	beq _08119E24
	movs r0, #1
	strb r0, [r1, #2]
	b _08119E26
_08119E24:
	strb r6, [r7]
_08119E26:
	movs r0, #5
_08119E28:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AcroBikeHandleInputWheelieStanding

	thumb_func_start AcroBikeHandleInputBunnyHop
AcroBikeHandleInputBunnyHop: @ 0x08119E30
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	bl GetPlayerMovementDirection
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r2, r5, #0
	ldr r4, _08119E90
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08119E94
	adds r7, r0, r1
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _08119EA2
	bl Bike_SetBikeStill
	ldrb r0, [r7, #0x1e]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08119E98
	movs r0, #2
	strb r0, [r4, #8]
	adds r0, r6, #0
	mov r1, sb
	mov r2, r8
	bl CheckMovementInputAcroBike
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08119EC6
	.align 2, 0
_08119E90: .4byte 0x02037230
_08119E94: .4byte 0x02036FF0
_08119E98:
	strb r5, [r6]
	strb r0, [r4, #2]
	strb r0, [r4, #8]
	movs r0, #4
	b _08119EC6
_08119EA2:
	ldrb r0, [r6]
	cmp r0, #0
	bne _08119EAC
	strb r5, [r6]
	b _08119EB8
_08119EAC:
	cmp r0, r2
	beq _08119EBE
	ldrb r0, [r4, #2]
	cmp r0, #2
	beq _08119EBE
	movs r0, #1
_08119EB8:
	strb r0, [r4, #2]
	movs r0, #6
	b _08119EC6
_08119EBE:
	ldr r1, _08119ED4
	movs r0, #2
	strb r0, [r1, #2]
	movs r0, #7
_08119EC6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08119ED4: .4byte 0x02037230
	thumb_func_end AcroBikeHandleInputBunnyHop

	thumb_func_start AcroBikeHandleInputWheelieMoving
AcroBikeHandleInputWheelieMoving: @ 0x08119ED8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r2, r5, #0
	ldr r4, _08119F34
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08119F38
	adds r7, r0, r1
	movs r0, #2
	mov sb, r0
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _08119F70
	bl Bike_SetBikeStill
	ldrb r0, [r7, #0x1e]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08119F5C
	strb r1, [r4, #8]
	ldrb r0, [r6]
	cmp r0, #0
	bne _08119F3C
	strb r5, [r6]
	b _08119F46
	.align 2, 0
_08119F34: .4byte 0x02037230
_08119F38: .4byte 0x02036FF0
_08119F3C:
	cmp r0, r5
	beq _08119F4C
	ldrb r0, [r4, #2]
	cmp r0, #2
	beq _08119F4C
_08119F46:
	strb r1, [r4, #2]
	movs r0, #4
	b _08119FA0
_08119F4C:
	ldr r1, _08119F58
	movs r0, #2
	strb r0, [r1, #2]
	movs r0, #0xc
	b _08119FA0
	.align 2, 0
_08119F58: .4byte 0x02037230
_08119F5C:
	mov r0, sb
	strb r0, [r4, #8]
	adds r0, r6, #0
	mov r1, sl
	mov r2, r8
	bl CheckMovementInputAcroBike
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08119FA0
_08119F70:
	ldrb r0, [r6]
	cmp r0, #0
	bne _08119F86
	strb r5, [r6]
	mov r1, sb
	strb r1, [r4, #8]
	strb r0, [r4, #2]
	bl Bike_SetBikeStill
	movs r0, #5
	b _08119FA0
_08119F86:
	cmp r2, r0
	beq _08119F98
	ldrb r0, [r4, #2]
	cmp r0, #2
	beq _08119F98
	movs r0, #0
	strb r0, [r4, #2]
	movs r0, #5
	b _08119FA0
_08119F98:
	ldr r1, _08119FB0
	movs r0, #2
	strb r0, [r1, #2]
	movs r0, #0xa
_08119FA0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08119FB0: .4byte 0x02037230
	thumb_func_end AcroBikeHandleInputWheelieMoving

	thumb_func_start AcroBikeHandleInputSidewaysJump
AcroBikeHandleInputSidewaysJump: @ 0x08119FB4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r6, _0811A008
	ldrb r1, [r6, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A00C
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r0, #0x18]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl SetEventObjectDirection
	movs r0, #0
	strb r0, [r6, #8]
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl CheckMovementInputAcroBike
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811A008: .4byte 0x02037230
_0811A00C: .4byte 0x02036FF0
	thumb_func_end AcroBikeHandleInputSidewaysJump

	thumb_func_start AcroBikeHandleInputTurnJump
AcroBikeHandleInputTurnJump: @ 0x0811A010
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _0811A030
	movs r3, #0
	strb r3, [r4, #8]
	bl CheckMovementInputAcroBike
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811A030: .4byte 0x02037230
	thumb_func_end AcroBikeHandleInputTurnJump

	thumb_func_start AcroBikeTransition_TurnJump
AcroBikeTransition_TurnJump: @ 0x0811A034
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PlayerFaceDirection
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AcroBikeTransition_TurnJump

	thumb_func_start AcroBikeTransition_TurnDirection
AcroBikeTransition_TurnDirection: @ 0x0811A044
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0811A078
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A07C
	adds r5, r0, r1
	ldrb r1, [r5, #0x1e]
	adds r0, r4, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A06A
	ldrb r0, [r5, #0x18]
	lsrs r4, r0, #4
_0811A06A:
	adds r0, r4, #0
	bl PlayerFaceDirection
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A078: .4byte 0x02037230
_0811A07C: .4byte 0x02036FF0
	thumb_func_end AcroBikeTransition_TurnDirection

	thumb_func_start AcroBikeTransition_Moving
AcroBikeTransition_Moving: @ 0x0811A080
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	ldr r0, _0811A0B0
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A0B4
	adds r4, r0, r1
	ldrb r1, [r4, #0x1e]
	adds r0, r5, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A0B8
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl AcroBikeTransition_TurnJump
	b _0811A10A
	.align 2, 0
_0811A0B0: .4byte 0x02037230
_0811A0B4: .4byte 0x02036FF0
_0811A0B8:
	adds r0, r5, #0
	bl get_some_collision
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bhi _0811A104
	cmp r4, #6
	bne _0811A0DA
	adds r0, r5, #0
	bl PlayerJumpLedge
	b _0811A10A
_0811A0DA:
	cmp r4, #4
	bne _0811A0F2
	adds r0, r5, #0
	bl IsPlayerCollidingWithFarawayIslandMew
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811A0F2
	adds r0, r5, #0
	bl PlayerOnBikeCollideWithFarawayIslandMew
	b _0811A10A
_0811A0F2:
	subs r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0811A10A
	adds r0, r6, #0
	bl PlayerOnBikeCollide
	b _0811A10A
_0811A104:
	adds r0, r6, #0
	bl PlayerRideWaterCurrent
_0811A10A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AcroBikeTransition_Moving

	thumb_func_start AcroBikeTransition_NormalToWheelie
AcroBikeTransition_NormalToWheelie: @ 0x0811A110
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0811A144
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A148
	adds r5, r0, r1
	ldrb r1, [r5, #0x1e]
	adds r0, r4, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A136
	ldrb r0, [r5, #0x18]
	lsrs r4, r0, #4
_0811A136:
	adds r0, r4, #0
	bl PlayerStartWheelie
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A144: .4byte 0x02037230
_0811A148: .4byte 0x02036FF0
	thumb_func_end AcroBikeTransition_NormalToWheelie

	thumb_func_start AcroBikeTransition_WheelieToNormal
AcroBikeTransition_WheelieToNormal: @ 0x0811A14C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0811A180
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A184
	adds r5, r0, r1
	ldrb r1, [r5, #0x1e]
	adds r0, r4, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A172
	ldrb r0, [r5, #0x18]
	lsrs r4, r0, #4
_0811A172:
	adds r0, r4, #0
	bl PlayerEndWheelie
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A180: .4byte 0x02037230
_0811A184: .4byte 0x02036FF0
	thumb_func_end AcroBikeTransition_WheelieToNormal

	thumb_func_start AcroBikeTransition_WheelieIdle
AcroBikeTransition_WheelieIdle: @ 0x0811A188
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0811A1BC
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A1C0
	adds r5, r0, r1
	ldrb r1, [r5, #0x1e]
	adds r0, r4, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A1AE
	ldrb r0, [r5, #0x18]
	lsrs r4, r0, #4
_0811A1AE:
	adds r0, r4, #0
	bl PlayerIdleWheelie
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A1BC: .4byte 0x02037230
_0811A1C0: .4byte 0x02036FF0
	thumb_func_end AcroBikeTransition_WheelieIdle

	thumb_func_start AcroBikeTransition_WheelieHoppingStanding
AcroBikeTransition_WheelieHoppingStanding: @ 0x0811A1C4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0811A1F8
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A1FC
	adds r5, r0, r1
	ldrb r1, [r5, #0x1e]
	adds r0, r4, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A1EA
	ldrb r0, [r5, #0x18]
	lsrs r4, r0, #4
_0811A1EA:
	adds r0, r4, #0
	bl PlayerStandingHoppingWheelie
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A1F8: .4byte 0x02037230
_0811A1FC: .4byte 0x02036FF0
	thumb_func_end AcroBikeTransition_WheelieHoppingStanding

	thumb_func_start AcroBikeTransition_WheelieHoppingMoving
AcroBikeTransition_WheelieHoppingMoving: @ 0x0811A200
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0811A22C
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A230
	adds r5, r0, r1
	ldrb r1, [r5, #0x1e]
	adds r0, r4, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A234
	ldrb r0, [r5, #0x18]
	lsrs r0, r0, #4
	bl AcroBikeTransition_WheelieHoppingStanding
	b _0811A26E
	.align 2, 0
_0811A22C: .4byte 0x02037230
_0811A230: .4byte 0x02036FF0
_0811A234:
	adds r0, r4, #0
	bl get_some_collision
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0811A268
	cmp r1, #9
	beq _0811A268
	cmp r1, #6
	bne _0811A252
	adds r0, r4, #0
	bl PlayerLedgeHoppingWheelie
	b _0811A26E
_0811A252:
	subs r0, r1, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0811A26E
	cmp r1, #0xb
	bhi _0811A268
	adds r0, r4, #0
	bl AcroBikeTransition_WheelieHoppingStanding
	b _0811A26E
_0811A268:
	adds r0, r4, #0
	bl PlayerMovingHoppingWheelie
_0811A26E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AcroBikeTransition_WheelieHoppingMoving

	thumb_func_start AcroBikeTransition_SideJump
AcroBikeTransition_SideJump: @ 0x0811A274
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl get_some_collision
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0
	beq _0811A2A8
	cmp r0, #7
	beq _0811A2D4
	cmp r0, #9
	bls _0811A2A0
	adds r0, r1, #0
	adds r1, r5, #0
	bl WillPlayerCollideWithCollision
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A2A8
_0811A2A0:
	adds r0, r5, #0
	bl AcroBikeTransition_TurnDirection
	b _0811A2D4
_0811A2A8:
	ldr r0, _0811A2DC
	ldrb r0, [r0, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0811A2E0
	adds r4, r4, r0
	movs r0, #0x22
	bl PlaySE
	ldrb r0, [r4, #1]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl sub_08092E84
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl PlayerSetAnimId
_0811A2D4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A2DC: .4byte 0x02037230
_0811A2E0: .4byte 0x02036FF0
	thumb_func_end AcroBikeTransition_SideJump

	thumb_func_start sub_0811A2E4
sub_0811A2E4: @ 0x0811A2E4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PlayerAcroTurnJump
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811A2E4

	thumb_func_start AcroBikeTransition_WheelieMoving
AcroBikeTransition_WheelieMoving: @ 0x0811A2F4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r7, _0811A324
	ldrb r1, [r7, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A328
	adds r5, r0, r1
	ldrb r1, [r5, #0x1e]
	adds r0, r4, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A32C
	ldrb r0, [r5, #0x18]
	lsrs r0, r0, #4
	bl PlayerIdleWheelie
	b _0811A37C
	.align 2, 0
_0811A324: .4byte 0x02037230
_0811A328: .4byte 0x02036FF0
_0811A32C:
	adds r0, r4, #0
	bl get_some_collision
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bhi _0811A372
	cmp r1, #6
	bne _0811A34E
	adds r0, r4, #0
	bl PlayerLedgeHoppingWheelie
	b _0811A37C
_0811A34E:
	cmp r1, #9
	beq _0811A362
	cmp r1, #4
	bhi _0811A37C
	ldrb r0, [r5, #0x1e]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811A36A
_0811A362:
	adds r0, r4, #0
	bl PlayerIdleWheelie
	b _0811A37C
_0811A36A:
	adds r0, r4, #0
	bl sub_0808B2E4
	b _0811A37C
_0811A372:
	adds r0, r6, #0
	bl sub_0808B320
	movs r0, #2
	strb r0, [r7, #2]
_0811A37C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AcroBikeTransition_WheelieMoving

	thumb_func_start AcroBikeTransition_WheelieRisingMoving
AcroBikeTransition_WheelieRisingMoving: @ 0x0811A384
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r7, _0811A3B4
	ldrb r1, [r7, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A3B8
	adds r5, r0, r1
	ldrb r1, [r5, #0x1e]
	adds r0, r4, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A3BC
	ldrb r0, [r5, #0x18]
	lsrs r0, r0, #4
	bl PlayerStartWheelie
	b _0811A40C
	.align 2, 0
_0811A3B4: .4byte 0x02037230
_0811A3B8: .4byte 0x02036FF0
_0811A3BC:
	adds r0, r4, #0
	bl get_some_collision
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bhi _0811A402
	cmp r1, #6
	bne _0811A3DE
	adds r0, r4, #0
	bl PlayerLedgeHoppingWheelie
	b _0811A40C
_0811A3DE:
	cmp r1, #9
	beq _0811A3F2
	cmp r1, #4
	bhi _0811A40C
	ldrb r0, [r5, #0x1e]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811A3FA
_0811A3F2:
	adds r0, r4, #0
	bl PlayerIdleWheelie
	b _0811A40C
_0811A3FA:
	adds r0, r4, #0
	bl sub_0808B2E4
	b _0811A40C
_0811A402:
	adds r0, r6, #0
	bl sub_0808B308
	movs r0, #2
	strb r0, [r7, #2]
_0811A40C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AcroBikeTransition_WheelieRisingMoving

	thumb_func_start AcroBikeTransition_WheelieLoweringMoving
AcroBikeTransition_WheelieLoweringMoving: @ 0x0811A414
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r0, _0811A444
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811A448
	adds r5, r0, r1
	ldrb r1, [r5, #0x1e]
	adds r0, r4, #0
	bl CanBikeFaceDirOnMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A44C
	ldrb r0, [r5, #0x18]
	lsrs r0, r0, #4
	bl PlayerEndWheelie
	b _0811A486
	.align 2, 0
_0811A444: .4byte 0x02037230
_0811A448: .4byte 0x02036FF0
_0811A44C:
	adds r0, r4, #0
	bl get_some_collision
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bhi _0811A480
	cmp r1, #6
	bne _0811A46E
	adds r0, r4, #0
	bl PlayerJumpLedge
	b _0811A486
_0811A46E:
	subs r0, r1, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0811A486
	adds r0, r4, #0
	bl PlayerEndWheelie
	b _0811A486
_0811A480:
	adds r0, r6, #0
	bl sub_0808B338
_0811A486:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AcroBikeTransition_WheelieLoweringMoving

	thumb_func_start Bike_TryAcroBikeHistoryUpdate
Bike_TryAcroBikeHistoryUpdate: @ 0x0811A48C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r0, _0811A4B0
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0811A4AA
	adds r0, r3, #0
	adds r1, r2, #0
	bl AcroBike_TryHistoryUpdate
_0811A4AA:
	pop {r0}
	bx r0
	.align 2, 0
_0811A4B0: .4byte 0x02037230
	thumb_func_end Bike_TryAcroBikeHistoryUpdate

	thumb_func_start AcroBike_TryHistoryUpdate
AcroBike_TryHistoryUpdate: @ 0x0811A4B4
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r5, #0
	bl Bike_DPadToDirection
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r4, _0811A4DC
	ldr r0, [r4, #0xc]
	movs r1, #0xf
	ands r0, r1
	cmp r2, r0
	bne _0811A4E0
	ldrb r0, [r4, #0x14]
	cmp r0, #0xfe
	bhi _0811A4EA
	adds r0, #1
	strb r0, [r4, #0x14]
	b _0811A4EA
	.align 2, 0
_0811A4DC: .4byte 0x02037230
_0811A4E0:
	adds r0, r2, #0
	bl Bike_UpdateDirTimerHistory
	movs r0, #0
	strb r0, [r4, #0xb]
_0811A4EA:
	movs r0, #0xf
	adds r2, r5, #0
	ands r2, r0
	ldr r4, _0811A508
	ldr r0, [r4, #0x10]
	movs r1, #0xf
	ands r0, r1
	cmp r2, r0
	bne _0811A50C
	ldrb r0, [r4, #0x1c]
	cmp r0, #0xfe
	bhi _0811A516
	adds r0, #1
	strb r0, [r4, #0x1c]
	b _0811A516
	.align 2, 0
_0811A508: .4byte 0x02037230
_0811A50C:
	adds r0, r2, #0
	bl Bike_UpdateABStartSelectHistory
	movs r0, #0
	strb r0, [r4, #0xb]
_0811A516:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AcroBike_TryHistoryUpdate

	thumb_func_start HasPlayerInputTakenLongerThanList
HasPlayerInputTakenLongerThanList: @ 0x0811A51C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r2, #0
	ldrb r0, [r3]
	cmp r0, #0
	beq _0811A546
	ldr r5, _0811A560
_0811A52C:
	adds r0, r2, r5
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhi _0811A55C
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0811A52C
_0811A546:
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0811A576
	ldr r3, _0811A564
_0811A550:
	adds r0, r2, r3
	adds r1, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _0811A568
_0811A55C:
	movs r0, #0
	b _0811A578
	.align 2, 0
_0811A560: .4byte 0x02037244
_0811A564: .4byte 0x0203724C
_0811A568:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0811A550
_0811A576:
	movs r0, #1
_0811A578:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end HasPlayerInputTakenLongerThanList

	thumb_func_start AcroBike_GetJumpDirection
AcroBike_GetJumpDirection: @ 0x0811A580
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0
_0811A586:
	ldr r0, _0811A5B8
	adds r4, r5, r0
	ldr r0, _0811A5BC
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #0x10]
	ldr r0, [r4, #8]
	ands r1, r0
	ldr r0, [r4, #0xc]
	ands r2, r0
	ldr r0, [r4]
	cmp r1, r0
	bne _0811A5C0
	ldr r0, [r4, #4]
	cmp r2, r0
	bne _0811A5C0
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	bl HasPlayerInputTakenLongerThanList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811A5C0
	ldrb r0, [r4, #0x18]
	b _0811A5CA
	.align 2, 0
_0811A5B8: .4byte 0x085730A4
_0811A5BC: .4byte 0x02037230
_0811A5C0:
	adds r5, #0x1c
	adds r6, #1
	cmp r6, #3
	bls _0811A586
	movs r0, #0
_0811A5CA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end AcroBike_GetJumpDirection

	thumb_func_start Bike_UpdateDirTimerHistory
Bike_UpdateDirTimerHistory: @ 0x0811A5D0
	push {r4, lr}
	lsls r0, r0, #0x18
	ldr r3, _0811A608
	ldr r2, [r3, #0xc]
	lsls r2, r2, #4
	movs r1, #0xf0
	lsls r1, r1, #0x14
	ands r1, r0
	lsrs r1, r1, #0x18
	orrs r2, r1
	str r2, [r3, #0xc]
	movs r1, #7
	adds r4, r3, #0
	adds r3, #0x14
_0811A5EC:
	adds r2, r1, r3
	subs r1, #1
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0
	bne _0811A5EC
	movs r0, #1
	strb r0, [r4, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A608: .4byte 0x02037230
	thumb_func_end Bike_UpdateDirTimerHistory

	thumb_func_start Bike_UpdateABStartSelectHistory
Bike_UpdateABStartSelectHistory: @ 0x0811A60C
	push {r4, lr}
	lsls r0, r0, #0x18
	ldr r3, _0811A644
	ldr r2, [r3, #0x10]
	lsls r2, r2, #4
	movs r1, #0xf0
	lsls r1, r1, #0x14
	ands r1, r0
	lsrs r1, r1, #0x18
	orrs r2, r1
	str r2, [r3, #0x10]
	movs r1, #7
	adds r4, r3, #0
	adds r3, #0x1c
_0811A628:
	adds r2, r1, r3
	subs r1, #1
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0
	bne _0811A628
	movs r0, #1
	strb r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A644: .4byte 0x02037230
	thumb_func_end Bike_UpdateABStartSelectHistory

	thumb_func_start Bike_DPadToDirection
Bike_DPadToDirection: @ 0x0811A648
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0811A65C
	movs r0, #2
	b _0811A682
_0811A65C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0811A668
	movs r0, #1
	b _0811A682
_0811A668:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0811A674
	movs r0, #3
	b _0811A682
_0811A674:
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	bne _0811A680
	movs r0, #0
	b _0811A682
_0811A680:
	movs r0, #4
_0811A682:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Bike_DPadToDirection

	thumb_func_start get_some_collision
get_some_collision: @ 0x0811A688
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0811A6EC
	ldrb r0, [r0, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0811A6F0
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
	bl Bike_CheckCollisionTryAdvanceCollisionCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811A6EC: .4byte 0x02037230
_0811A6F0: .4byte 0x02036FF0
	thumb_func_end get_some_collision

	thumb_func_start Bike_CheckCollisionTryAdvanceCollisionCount
Bike_CheckCollisionTryAdvanceCollisionCount: @ 0x0811A6F4
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r5, r4, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r5, [sp]
	bl CheckForEventObjectCollision
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0811A734
	cmp r4, #0
	bne _0811A730
	adds r0, r5, #0
	bl IsRunningDisallowedByMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811A72C
	movs r4, #2
_0811A72C:
	cmp r4, #0
	beq _0811A734
_0811A730:
	bl Bike_TryAdvanceCyclingRoadCollisions
_0811A734:
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Bike_CheckCollisionTryAdvanceCollisionCount

	thumb_func_start RS_IsRunningDisallowed
RS_IsRunningDisallowed: @ 0x0811A740
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsRunningDisallowedByMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A758
	ldr r0, _0811A75C
	ldrb r0, [r0, #0x17]
	cmp r0, #8
	bne _0811A760
_0811A758:
	movs r0, #1
	b _0811A762
	.align 2, 0
_0811A75C: .4byte 0x02036FB8
_0811A760:
	movs r0, #0
_0811A762:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RS_IsRunningDisallowed

	thumb_func_start IsRunningDisallowedByMetatile
IsRunningDisallowedByMetatile: @ 0x0811A768
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsRunningDisallowed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A792
	adds r0, r4, #0
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811A796
	bl PlayerGetZCoord
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0811A796
_0811A792:
	movs r0, #1
	b _0811A798
_0811A796:
	movs r0, #0
_0811A798:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsRunningDisallowedByMetatile

	thumb_func_start Bike_TryAdvanceCyclingRoadCollisions
Bike_TryAdvanceCyclingRoadCollisions: @ 0x0811A7A0
	push {lr}
	ldr r0, _0811A7BC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0811A7B6
	ldr r1, _0811A7C0
	ldrb r0, [r1]
	cmp r0, #0x63
	bhi _0811A7B6
	adds r0, #1
	strb r0, [r1]
_0811A7B6:
	pop {r0}
	bx r0
	.align 2, 0
_0811A7BC: .4byte 0x0203A820
_0811A7C0: .4byte 0x0203A821
	thumb_func_end Bike_TryAdvanceCyclingRoadCollisions

	thumb_func_start CanBikeFaceDirOnMetatile
CanBikeFaceDirOnMetatile: @ 0x0811A7C4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r5, r4, #0
	movs r1, #0xfd
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0811A7EE
	adds r0, r4, #0
	bl MetatileBehavior_IsIsolatedVerticalRail
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A806
	adds r0, r4, #0
	bl MetatileBehavior_IsVerticalRail
	b _0811A800
_0811A7EE:
	adds r0, r5, #0
	bl MetatileBehavior_IsIsolatedHorizontalRail
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A806
	adds r0, r5, #0
	bl MetatileBehavior_IsHorizontalRail
_0811A800:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811A80A
_0811A806:
	movs r0, #0
	b _0811A80C
_0811A80A:
	movs r0, #1
_0811A80C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CanBikeFaceDirOnMetatile

	thumb_func_start WillPlayerCollideWithCollision
WillPlayerCollideWithCollision: @ 0x0811A814
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	lsls r1, r1, #0x18
	movs r3, #0xff
	lsls r3, r3, #0x18
	adds r1, r1, r3
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _0811A834
	cmp r0, #0xa
	beq _0811A83C
	cmp r0, #0xc
	bne _0811A840
	b _0811A83C
_0811A834:
	cmp r2, #0xb
	beq _0811A83C
	cmp r2, #0xd
	bne _0811A840
_0811A83C:
	movs r0, #0
	b _0811A842
_0811A840:
	movs r0, #1
_0811A842:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WillPlayerCollideWithCollision

	thumb_func_start IsBikingDisallowedByPlayer
IsBikingDisallowedByPlayer: @ 0x0811A848
	push {r4, lr}
	sub sp, #4
	ldr r0, _0811A884
	ldrb r1, [r0]
	movs r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _0811A888
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsRunningDisallowedByMetatile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811A888
	movs r0, #0
	b _0811A88A
	.align 2, 0
_0811A884: .4byte 0x02037230
_0811A888:
	movs r0, #1
_0811A88A:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsBikingDisallowedByPlayer

	thumb_func_start player_should_look_direction_be_enforced_upon_movement
player_should_look_direction_be_enforced_upon_movement: @ 0x0811A894
	push {lr}
	movs r0, #4
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811A8C8
	ldr r2, _0811A8C0
	ldr r0, _0811A8C4
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1e]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811A8C8
	movs r0, #0
	b _0811A8CA
	.align 2, 0
_0811A8C0: .4byte 0x02036FF0
_0811A8C4: .4byte 0x02037230
_0811A8C8:
	movs r0, #1
_0811A8CA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end player_should_look_direction_be_enforced_upon_movement

	thumb_func_start GetOnOffBike
GetOnOffBike: @ 0x0811A8D0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0811A8F8
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0811A8FC
	ldrb r1, [r0]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0811A900
	movs r0, #1
	bl SetPlayerAvatarTransitionFlags
	bl Overworld_ClearSavedMusic
	bl Overworld_PlaySpecialMapMusic
	b _0811A914
	.align 2, 0
_0811A8F8: .4byte 0x02036FE8
_0811A8FC: .4byte 0x02037230
_0811A900:
	adds r0, r2, #0
	bl SetPlayerAvatarTransitionFlags
	ldr r4, _0811A91C
	adds r0, r4, #0
	bl Overworld_SetSavedMusic
	adds r0, r4, #0
	bl Overworld_ChangeMusicTo
_0811A914:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A91C: .4byte 0x00000193
	thumb_func_end GetOnOffBike

	thumb_func_start BikeClearState
BikeClearState: @ 0x0811A920
	push {lr}
	ldr r2, _0811A95C
	movs r3, #0
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	strb r3, [r2, #0xa]
	strb r3, [r2, #0xb]
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
	movs r1, #0
	adds r2, #0x14
_0811A936:
	adds r0, r1, r2
	strb r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #7
	bls _0811A936
	movs r1, #0
	ldr r3, _0811A960
	movs r2, #0
_0811A94A:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #7
	bls _0811A94A
	pop {r0}
	bx r0
	.align 2, 0
_0811A95C: .4byte 0x02037230
_0811A960: .4byte 0x0203724C
	thumb_func_end BikeClearState

	thumb_func_start Bike_UpdateBikeCounterSpeed
Bike_UpdateBikeCounterSpeed: @ 0x0811A964
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0811A974
	strb r0, [r2, #0xa]
	lsrs r1, r0, #1
	adds r0, r0, r1
	strb r0, [r2, #0xb]
	bx lr
	.align 2, 0
_0811A974: .4byte 0x02037230
	thumb_func_end Bike_UpdateBikeCounterSpeed

	thumb_func_start Bike_SetBikeStill
Bike_SetBikeStill: @ 0x0811A978
	ldr r1, _0811A984
	movs r0, #0
	strb r0, [r1, #0xa]
	strb r0, [r1, #0xb]
	bx lr
	.align 2, 0
_0811A984: .4byte 0x02037230
	thumb_func_end Bike_SetBikeStill

	thumb_func_start GetPlayerSpeed
GetPlayerSpeed: @ 0x0811A988
	push {lr}
	sub sp, #8
	ldr r1, _0811A9B0
	mov r0, sp
	movs r2, #6
	bl memcpy
	ldr r2, _0811A9B4
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0811A9B8
	ldrb r0, [r2, #0xa]
	lsls r0, r0, #1
	add r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0811A9D2
	.align 2, 0
_0811A9B0: .4byte 0x0857309C
_0811A9B4: .4byte 0x02037230
_0811A9B8:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0811A9C4
	movs r0, #3
	b _0811A9D2
_0811A9C4:
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	bne _0811A9D0
	movs r0, #1
	b _0811A9D2
_0811A9D0:
	movs r0, #2
_0811A9D2:
	add sp, #8
	pop {r1}
	bx r1
	thumb_func_end GetPlayerSpeed

	thumb_func_start Bike_HandleBumpySlopeJump
Bike_HandleBumpySlopeJump: @ 0x0811A9D8
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _0811AA28
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0811AA20
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsBumpySlope
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811AA20
	movs r0, #2
	strb r0, [r5, #8]
	bl GetPlayerMovementDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0808BB18
_0811AA20:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811AA28: .4byte 0x02037230
	thumb_func_end Bike_HandleBumpySlopeJump

	thumb_func_start IsRunningDisallowed
IsRunningDisallowed: @ 0x0811AA2C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0811AA50
	ldrb r1, [r0, #0x1a]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0811AA4C
	adds r0, r2, #0
	bl IsRunningDisallowedByMetatile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0811AA54
_0811AA4C:
	movs r0, #1
	b _0811AA56
	.align 2, 0
_0811AA50: .4byte 0x02036FB8
_0811AA54:
	movs r0, #0
_0811AA56:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsRunningDisallowed

