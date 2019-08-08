.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetTruckCameraBobbingY
GetTruckCameraBobbingY: @ 0x080FB920
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x78
	bl __modsi3
	cmp r0, #0
	bne _080FB934
	movs r0, #1
	rsbs r0, r0, #0
	b _080FB946
_080FB934:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	cmp r0, #4
	ble _080FB944
	movs r0, #0
	b _080FB946
_080FB944:
	movs r0, #1
_080FB946:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetTruckCameraBobbingY

	thumb_func_start GetTruckBoxMovement
GetTruckBoxMovement: @ 0x080FB94C
	push {lr}
	adds r0, #0x78
	movs r1, #0xb4
	bl __modsi3
	cmp r0, #0
	beq _080FB95E
	movs r0, #0
	b _080FB962
_080FB95E:
	movs r0, #1
	rsbs r0, r0, #0
_080FB962:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetTruckBoxMovement

	thumb_func_start Task_Truck1
Task_Truck1: @ 0x080FB968
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080FBA0C
	adds r5, r1, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r0, #0x1e
	bl GetTruckBoxMovement
	ldr r4, _080FBA10
	ldr r2, [r4]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	lsls r0, r0, #0x12
	movs r3, #0xc0
	lsls r3, r3, #0xa
	orrs r0, r3
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r3, #3
	bl sub_0808E19C
	movs r3, #0
	ldrsh r0, [r5, r3]
	bl GetTruckBoxMovement
	ldr r2, [r4]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	lsls r0, r0, #0x11
	ldr r3, _080FBA14
	adds r0, r0, r3
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #2
	movs r3, #0
	bl sub_0808E19C
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTruckBoxMovement
	ldr r2, [r4]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	movs r4, #0
	movs r3, #3
	rsbs r3, r3, #0
	lsls r0, r0, #0x12
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl sub_0808E19C
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	ldr r1, _080FBA18
	cmp r0, r1
	bne _080FB9F0
	strh r4, [r5]
_080FB9F0:
	movs r3, #0
	ldrsh r0, [r5, r3]
	bl GetTruckCameraBobbingY
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl SetCameraPanning
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FBA0C: .4byte 0x03005B68
_080FBA10: .4byte 0x03005AEC
_080FBA14: .4byte 0xFFFD0000
_080FBA18: .4byte 0x75300000
	thumb_func_end Task_Truck1

	thumb_func_start Task_Truck2
Task_Truck2: @ 0x080FBA1C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r3, r0, #3
	ldr r4, _080FBA5C
	adds r7, r3, r4
	ldrh r1, [r7]
	adds r1, #1
	strh r1, [r7]
	ldrh r0, [r7, #4]
	adds r0, #1
	strh r0, [r7, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _080FBA4C
	movs r0, #0
	strh r0, [r7]
	ldrh r0, [r7, #2]
	adds r0, #1
	strh r0, [r7, #2]
_080FBA4C:
	ldrh r0, [r7, #2]
	cmp r0, #0x13
	bne _080FBA60
	adds r0, r2, #0
	bl DestroyTask
	b _080FBB18
	.align 2, 0
_080FBA5C: .4byte 0x03005B68
_080FBA60:
	ldr r2, _080FBB20
	movs r1, #2
	ldrsh r0, [r7, r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _080FBA7C
	adds r0, r4, #0
	subs r0, #8
	adds r0, r3, r0
	ldr r1, _080FBB24
	str r1, [r0]
_080FBA7C:
	movs r4, #2
	ldrsh r0, [r7, r4]
	adds r0, r0, r2
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r1, #4
	ldrsh r0, [r7, r1]
	bl GetTruckCameraBobbingY
	adds r1, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl SetCameraPanning
	movs r4, #4
	ldrsh r0, [r7, r4]
	adds r0, #0x1e
	bl GetTruckBoxMovement
	ldr r6, _080FBB28
	ldr r2, [r6]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	movs r3, #3
	subs r3, r3, r5
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x12
	movs r4, #0xc0
	lsls r4, r4, #0xa
	orrs r0, r4
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	bl sub_0808E19C
	movs r1, #4
	ldrsh r0, [r7, r1]
	bl GetTruckBoxMovement
	ldr r2, [r6]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	rsbs r3, r5, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x11
	ldr r4, _080FBB2C
	adds r0, r0, r4
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #2
	bl sub_0808E19C
	movs r1, #4
	ldrsh r0, [r7, r1]
	bl GetTruckBoxMovement
	ldr r2, [r6]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	movs r4, #3
	rsbs r4, r4, #0
	adds r3, r4, #0
	subs r3, r3, r5
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x12
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl sub_0808E19C
_080FBB18:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FBB20: .4byte 0x0856A47C
_080FBB24: .4byte 0x080FBB31
_080FBB28: .4byte 0x03005AEC
_080FBB2C: .4byte 0xFFFD0000
	thumb_func_end Task_Truck2

	thumb_func_start Task_Truck3
Task_Truck3: @ 0x080FBB30
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	ldr r1, _080FBB70
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _080FBB60
	movs r0, #0
	strh r0, [r2]
	ldrh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #2]
_080FBB60:
	ldrh r0, [r2, #2]
	cmp r0, #0x13
	bne _080FBB74
	adds r0, r3, #0
	bl DestroyTask
	b _080FBBC8
	.align 2, 0
_080FBB70: .4byte 0x03005B68
_080FBB74:
	ldr r1, _080FBBD4
	movs r3, #2
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	movs r1, #0
	mov r8, r1
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r0, r6, #0
	bl SetCameraPanning
	ldr r5, _080FBBD8
	ldr r0, [r5]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r3, #3
	subs r3, r3, r6
	movs r0, #3
	str r0, [sp]
	movs r0, #1
	bl sub_0808E19C
	ldr r0, [r5]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	rsbs r3, r6, #0
	mov r4, r8
	subs r4, #3
	str r4, [sp]
	movs r0, #2
	bl sub_0808E19C
	ldr r0, [r5]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	subs r4, r4, r6
	mov r3, r8
	str r3, [sp]
	movs r0, #3
	adds r3, r4, #0
	bl sub_0808E19C
_080FBBC8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBBD4: .4byte 0x0856A47C
_080FBBD8: .4byte 0x03005AEC
	thumb_func_end Task_Truck3

	thumb_func_start Task_HandleTruckSequence
Task_HandleTruckSequence: @ 0x080FBBDC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080FBC00
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bls _080FBBF6
	b _080FBD48
_080FBBF6:
	lsls r0, r0, #2
	ldr r1, _080FBC04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FBC00: .4byte 0x03005B68
_080FBC04: .4byte 0x080FBC08
_080FBC08: @ jump table
	.4byte _080FBC20 @ case 0
	.4byte _080FBC58 @ case 1
	.4byte _080FBC74 @ case 2
	.4byte _080FBCC0 @ case 3
	.4byte _080FBCE4 @ case 4
	.4byte _080FBD02 @ case 5
_080FBC20:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5a
	beq _080FBC30
	b _080FBD48
_080FBC30:
	movs r0, #0
	bl SetCameraPanningCallback
	movs r0, #0
	strh r0, [r4, #2]
	ldr r0, _080FBC54
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #4]
	movs r0, #1
	strh r0, [r4]
	movs r0, #0x31
	bl PlaySE
	b _080FBD48
	.align 2, 0
_080FBC54: .4byte 0x080FB969
_080FBC58:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x96
	bne _080FBD48
	bl pal_fill_black
	movs r0, #0
	strh r0, [r4, #2]
	movs r0, #2
	strh r0, [r4]
	b _080FBD48
_080FBC74:
	ldrh r0, [r4, #2]
	adds r3, r0, #1
	strh r3, [r4, #2]
	ldr r0, _080FBCB8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080FBD48
	lsls r1, r3, #0x10
	movs r0, #0x96
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080FBD48
	strh r2, [r4, #2]
	ldrb r0, [r4, #4]
	bl DestroyTask
	ldr r0, _080FBCBC
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #6]
	movs r0, #3
	strh r0, [r4]
	movs r0, #0x32
	bl PlaySE
	b _080FBD48
	.align 2, 0
_080FBCB8: .4byte 0x02037C74
_080FBCBC: .4byte 0x080FBA1D
_080FBCC0:
	ldr r2, _080FBCE0
	movs r0, #6
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r5, [r0, #4]
	cmp r5, #0
	bne _080FBD48
	bl InstallCameraPanAheadCallback
	strh r5, [r4, #2]
	movs r0, #4
	strh r0, [r4]
	b _080FBD48
	.align 2, 0
_080FBCE0: .4byte 0x03005B60
_080FBCE4:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5a
	bne _080FBD48
	movs r0, #0x33
	bl PlaySE
	movs r0, #0
	strh r0, [r4, #2]
	movs r0, #5
	strh r0, [r4]
	b _080FBD48
_080FBD02:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	bne _080FBD48
	movs r2, #0x82
	lsls r2, r2, #2
	movs r0, #0xb
	movs r1, #8
	bl MapGridSetMetatileIdAt
	movs r2, #0x84
	lsls r2, r2, #2
	movs r0, #0xb
	movs r1, #9
	bl MapGridSetMetatileIdAt
	movs r2, #0x86
	lsls r2, r2, #2
	movs r0, #0xb
	movs r1, #0xa
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, #0x34
	bl PlaySE
	adds r0, r5, #0
	bl DestroyTask
	bl ScriptContext2_Disable
_080FBD48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_HandleTruckSequence

	thumb_func_start ExecuteTruckSequence
ExecuteTruckSequence: @ 0x080FBD50
	push {lr}
	sub sp, #4
	ldr r2, _080FBD98
	movs r0, #0xb
	movs r1, #8
	bl MapGridSetMetatileIdAt
	ldr r2, _080FBD9C
	movs r0, #0xb
	movs r1, #9
	bl MapGridSetMetatileIdAt
	ldr r2, _080FBDA0
	movs r0, #0xb
	movs r1, #0xa
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	bl ScriptContext2_Enable
	movs r0, #0
	str r0, [sp]
	ldr r1, _080FBDA4
	ldr r2, _080FBDA8
	mov r0, sp
	bl CpuFastSet
	ldr r0, _080FBDAC
	movs r1, #0xa
	bl CreateTask
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080FBD98: .4byte 0x0000020D
_080FBD9C: .4byte 0x00000215
_080FBDA0: .4byte 0x0000021D
_080FBDA4: .4byte 0x020377B4
_080FBDA8: .4byte 0x01000100
_080FBDAC: .4byte 0x080FBBDD
	thumb_func_end ExecuteTruckSequence

	thumb_func_start EndTruckSequence
EndTruckSequence: @ 0x080FBDB0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _080FBE04
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _080FBDFA
	ldr r4, _080FBE08
	ldr r0, [r4]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r0, #3
	str r0, [sp]
	movs r0, #1
	movs r3, #3
	bl sub_0808E19C
	ldr r0, [r4]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r5, #3
	rsbs r5, r5, #0
	str r5, [sp]
	movs r0, #2
	movs r3, #0
	bl sub_0808E19C
	ldr r0, [r4]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	str r6, [sp]
	movs r0, #3
	adds r3, r5, #0
	bl sub_0808E19C
_080FBDFA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBE04: .4byte 0x080FBBDD
_080FBE08: .4byte 0x03005AEC
	thumb_func_end EndTruckSequence

	thumb_func_start sub_080FBE0C
sub_080FBE0C: @ 0x080FBE0C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	mov r4, sp
	adds r4, #5
	mov r5, sp
	adds r5, #6
	add r6, sp, #8
	add r0, sp, #4
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl GetSSTidalLocation
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FBE4E
	add r0, sp, #4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	rsbs r2, r2, #0
	movs r3, #0
	ldrsb r3, [r5, r3]
	movs r4, #0
	ldrsb r4, [r6, r4]
	str r4, [sp]
	bl SetWarpDestination
	movs r0, #1
	b _080FBE50
_080FBE4E:
	movs r0, #0
_080FBE50:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080FBE0C

	thumb_func_start Task_HandlePorthole
Task_HandlePorthole: @ 0x080FBE58
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080FBE88
	adds r4, r0, r1
	ldr r0, _080FBE8C
	bl GetVarPointer
	adds r7, r0, #0
	ldr r0, _080FBE90
	ldr r3, [r0]
	adds r6, r3, #4
	movs r0, #0
	ldrsh r2, [r4, r0]
	cmp r2, #1
	beq _080FBEB8
	cmp r2, #1
	bgt _080FBE94
	cmp r2, #0
	beq _080FBE9E
	b _080FBF52
	.align 2, 0
_080FBE88: .4byte 0x03005B68
_080FBE8C: .4byte 0x000040B4
_080FBE90: .4byte 0x03005AEC
_080FBE94:
	cmp r2, #2
	beq _080FBEFA
	cmp r2, #3
	beq _080FBF34
	b _080FBF52
_080FBE9E:
	ldr r0, _080FBEB4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080FBF52
	strh r2, [r4, #2]
	movs r0, #2
	strh r0, [r4]
	b _080FBF52
	.align 2, 0
_080FBEB4: .4byte 0x02037C74
_080FBEB8:
	ldr r0, _080FBEEC
	ldrh r1, [r0, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080FBEC6
	strh r2, [r4, #2]
_080FBEC6:
	ldrb r1, [r6, #1]
	ldrb r2, [r3, #4]
	movs r0, #0xff
	bl ScriptMovement_IsObjectMovementFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FBF52
	movs r0, #1
	bl CountSSTidalStep
	cmp r0, #1
	bne _080FBEF6
	ldrh r0, [r7]
	cmp r0, #2
	bne _080FBEF0
	movs r0, #9
	b _080FBEF2
	.align 2, 0
_080FBEEC: .4byte 0x03002360
_080FBEF0:
	movs r0, #0xa
_080FBEF2:
	strh r0, [r7]
	b _080FBF02
_080FBEF6:
	movs r0, #2
	strh r0, [r4]
_080FBEFA:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080FBF08
_080FBF02:
	movs r0, #3
	strh r0, [r4]
	b _080FBF52
_080FBF08:
	ldrh r0, [r7]
	cmp r0, #2
	bne _080FBF1C
	ldrb r1, [r6, #1]
	ldrb r2, [r6]
	ldr r3, _080FBF18
	b _080FBF22
	.align 2, 0
_080FBF18: .4byte 0x0856A48F
_080FBF1C:
	ldrb r1, [r6, #1]
	ldrb r2, [r6]
	ldr r3, _080FBF30
_080FBF22:
	movs r0, #0xff
	bl ScriptMovement_StartObjectMovementScript
	movs r0, #1
	strh r0, [r4]
	b _080FBF52
	.align 2, 0
_080FBF30: .4byte 0x0856A491
_080FBF34:
	ldr r0, _080FBF58
	bl FlagClear
	movs r0, #0x80
	lsls r0, r0, #7
	bl FlagClear
	movs r0, #0
	bl SetWarpDestinationToDynamicWarp
	bl DoDiveWarp
	adds r0, r5, #0
	bl DestroyTask
_080FBF52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FBF58: .4byte 0x00004001
	thumb_func_end Task_HandlePorthole

	thumb_func_start sub_080FBF5C
sub_080FBF5C: @ 0x080FBF5C
	push {r4, lr}
	sub sp, #4
	ldr r1, _080FBFB0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x8c
	movs r2, #0x70
	movs r3, #0x50
	bl AddPseudoEventObject
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FBFB4
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r2
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080FBFB8
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _080FBFBC
	movs r0, #4
	bl GetJumpInPlaceMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	b _080FBFCE
	.align 2, 0
_080FBFB0: .4byte 0x08007141
_080FBFB4: .4byte 0x020205AC
_080FBFB8: .4byte 0x000040B4
_080FBFBC:
	movs r0, #3
	bl GetJumpInPlaceMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
_080FBFCE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080FBF5C

	thumb_func_start sub_080FBFD8
sub_080FBFD8: @ 0x080FBFD8
	push {lr}
	bl sub_080FBF5C
	ldr r2, _080FC008
	ldr r0, _080FC00C
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #1]
	bl pal_fill_black
	ldr r0, _080FC010
	movs r1, #0x50
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_080FC008: .4byte 0x02036FF0
_080FC00C: .4byte 0x02037230
_080FC010: .4byte 0x080FBE59
	thumb_func_end sub_080FBFD8

	thumb_func_start sub_080FC014
sub_080FC014: @ 0x080FC014
	push {lr}
	ldr r0, _080FC04C
	bl FlagSet
	ldr r0, _080FC050
	bl FlagSet
	movs r0, #0x80
	lsls r0, r0, #7
	bl FlagSet
	ldr r0, _080FC054
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	bl sub_080FBE0C
	bl sub_080AF1B4
	pop {r0}
	bx r0
	.align 2, 0
_080FC04C: .4byte 0x0000088D
_080FC050: .4byte 0x00004001
_080FC054: .4byte 0x03005AEC
	thumb_func_end sub_080FC014

