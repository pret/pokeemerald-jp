.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Task_RunPerStepCallback
Task_RunPerStepCallback: @ 0x0809D164
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0809D188
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #8
	ldrsh r1, [r1, r2]
	ldr r2, _0809D18C
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0809D188: .4byte 0x03005B60
_0809D18C: .4byte 0x084E898C
	thumb_func_end Task_RunPerStepCallback

	thumb_func_start RunTimeBasedEvents
RunTimeBasedEvents: @ 0x0809D190
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0809D1A2
	cmp r0, #1
	beq _0809D1C0
	b _0809D1D4
_0809D1A2:
	ldr r0, _0809D1BC
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _0809D1D4
	bl DoTimeBasedEvents
	ldrh r0, [r4]
	adds r0, #1
	b _0809D1D2
	.align 2, 0
_0809D1BC: .4byte 0x03002360
_0809D1C0:
	ldr r0, _0809D1DC
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0809D1D4
	ldrh r0, [r4]
	subs r0, #1
_0809D1D2:
	strh r0, [r4]
_0809D1D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D1DC: .4byte 0x03002360
	thumb_func_end RunTimeBasedEvents

	thumb_func_start Task_RunTimeBasedEvents
Task_RunTimeBasedEvents: @ 0x0809D1E0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0809D210
	adds r4, r1, r0
	bl ScriptContext2_IsEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D208
	adds r0, r4, #0
	bl RunTimeBasedEvents
	adds r0, r4, #2
	adds r1, r4, #4
	bl UpdateAmbientCry
_0809D208:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D210: .4byte 0x03005B68
	thumb_func_end Task_RunTimeBasedEvents

	thumb_func_start SetUpFieldTasks
SetUpFieldTasks: @ 0x0809D214
	push {r4, r5, lr}
	ldr r5, _0809D270
	adds r0, r5, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0809D23E
	adds r0, r5, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0809D274
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
_0809D23E:
	ldr r4, _0809D278
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D254
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
_0809D254:
	ldr r4, _0809D27C
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D26A
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
_0809D26A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D270: .4byte 0x0809D165
_0809D274: .4byte 0x03005B60
_0809D278: .4byte 0x0809DF11
_0809D27C: .4byte 0x0809D1E1
	thumb_func_end SetUpFieldTasks

	thumb_func_start ActivatePerStepCallback
ActivatePerStepCallback: @ 0x0809D280
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0809D2B8
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq _0809D2C2
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0809D2BC
	adds r1, r0, r1
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1e
_0809D2A4:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _0809D2A4
	cmp r4, #7
	bls _0809D2C0
	movs r0, #0
	strh r0, [r1]
	b _0809D2C2
	.align 2, 0
_0809D2B8: .4byte 0x0809D165
_0809D2BC: .4byte 0x03005B68
_0809D2C0:
	strh r4, [r1]
_0809D2C2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ActivatePerStepCallback

	thumb_func_start ResetFieldTasksArgs
ResetFieldTasksArgs: @ 0x0809D2C8
	push {lr}
	ldr r0, _0809D2F8
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0809D2FC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq _0809D2F2
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0809D300
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #4]
_0809D2F2:
	pop {r0}
	bx r0
	.align 2, 0
_0809D2F8: .4byte 0x0809D165
_0809D2FC: .4byte 0x0809D1E1
_0809D300: .4byte 0x03005B68
	thumb_func_end ResetFieldTasksArgs

	thumb_func_start DummyPerStepCallback
DummyPerStepCallback: @ 0x0809D304
	bx lr
	.align 2, 0
	thumb_func_end DummyPerStepCallback

	thumb_func_start GetPacifidlogBridgeMetatileOffsets
GetPacifidlogBridgeMetatileOffsets: @ 0x0809D308
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogVerticalLog1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D320
	adds r0, r5, #0
	b _0809D358
_0809D320:
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogVerticalLog2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D332
	adds r0, r5, #0
	adds r0, #8
	b _0809D358
_0809D332:
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogHorizontalLog1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D344
	adds r0, r5, #0
	adds r0, #0x10
	b _0809D358
_0809D344:
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogHorizontalLog2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D354
	movs r0, #0
	b _0809D358
_0809D354:
	adds r0, r5, #0
	adds r0, #0x18
_0809D358:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetPacifidlogBridgeMetatileOffsets

	thumb_func_start SetPacifidlogBridgeMetatiles
SetPacifidlogBridgeMetatiles: @ 0x0809D360
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r3
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	adds r0, r6, #0
	adds r1, r7, #0
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	bl GetPacifidlogBridgeMetatileOffsets
	adds r4, r0, #0
	adds r5, r4, #0
	cmp r4, #0
	beq _0809D3DE
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	ldrh r2, [r4, #2]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, #0
	beq _0809D3B6
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_0809D3B6:
	movs r0, #4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, #5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	ldrh r2, [r5, #6]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, #0
	beq _0809D3DE
	movs r0, #4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, #5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_0809D3DE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SetPacifidlogBridgeMetatiles

	thumb_func_start UpdateHalfSubmergedBridgeMetatiles
UpdateHalfSubmergedBridgeMetatiles: @ 0x0809D3E8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _0809D408
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetPacifidlogBridgeMetatiles
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D408: .4byte 0x084E89AC
	thumb_func_end UpdateHalfSubmergedBridgeMetatiles

	thumb_func_start UpdateFullySubmergedBridgeMetatiles
UpdateFullySubmergedBridgeMetatiles: @ 0x0809D40C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _0809D42C
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetPacifidlogBridgeMetatiles
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D42C: .4byte 0x084E89CC
	thumb_func_end UpdateFullySubmergedBridgeMetatiles

	thumb_func_start UpdateFloatingBridgeMetatiles
UpdateFloatingBridgeMetatiles: @ 0x0809D430
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _0809D450
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetPacifidlogBridgeMetatiles
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D450: .4byte 0x084E89EC
	thumb_func_end UpdateFloatingBridgeMetatiles

	thumb_func_start StandingOnNewPacifidlogBridge
StandingOnNewPacifidlogBridge: @ 0x0809D454
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov sl, r8
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	mov sb, r7
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r3, r3, #0x10
	asrs r5, r3, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogVerticalLog1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D498
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	ble _0809D4DE
_0809D494:
	movs r0, #0
	b _0809D4E0
_0809D498:
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogVerticalLog2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D4B0
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bge _0809D4DE
	b _0809D494
_0809D4B0:
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogHorizontalLog1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D4C8
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	ble _0809D4DE
	b _0809D494
_0809D4C8:
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogHorizontalLog2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D4DE
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	blt _0809D494
_0809D4DE:
	movs r0, #1
_0809D4E0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StandingOnNewPacifidlogBridge

	thumb_func_start StandingOnSamePacifidlogBridge
StandingOnSamePacifidlogBridge: @ 0x0809D4F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	mov sl, r8
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	mov sb, r7
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogVerticalLog1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D534
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r5, r0
	bge _0809D57A
_0809D530:
	movs r0, #0
	b _0809D57C
_0809D534:
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogVerticalLog2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D54C
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r5, r0
	ble _0809D57A
	b _0809D530
_0809D54C:
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogHorizontalLog1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D564
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r6, r0
	bge _0809D57A
	b _0809D530
_0809D564:
	adds r0, r4, #0
	bl MetatileBehavior_IsPacifilogHorizontalLog2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D57A
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r6, r0
	bgt _0809D530
_0809D57A:
	movs r0, #1
_0809D57C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StandingOnSamePacifidlogBridge

	thumb_func_start PacifidlogBridgePerStepCallback
PacifidlogBridgePerStepCallback: @ 0x0809D58C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0809D5C0
	adds r4, r1, r0
	mov r5, sp
	adds r5, #2
	mov r0, sp
	adds r1, r5, #0
	bl PlayerGetDestCoords
	movs r1, #2
	ldrsh r0, [r4, r1]
	adds r6, r5, #0
	cmp r0, #1
	beq _0809D5E6
	cmp r0, #1
	bgt _0809D5C4
	cmp r0, #0
	beq _0809D5CA
	b _0809D6F6
	.align 2, 0
_0809D5C0: .4byte 0x03005B68
_0809D5C4:
	cmp r0, #2
	beq _0809D6B4
	b _0809D6F6
_0809D5CA:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #4]
	ldrh r0, [r5]
	strh r0, [r4, #6]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r2, #1
	bl UpdateFullySubmergedBridgeMetatiles
	b _0809D6F2
_0809D5E6:
	mov r0, sp
	movs r7, #0
	ldrsh r1, [r0, r7]
	movs r2, #4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0809D600
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r7, #6
	ldrsh r0, [r4, r7]
	cmp r1, r0
	beq _0809D6F6
_0809D600:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r5, #6
	ldrsh r3, [r4, r5]
	bl StandingOnNewPacifidlogBridge
	cmp r0, #0
	beq _0809D648
	movs r7, #4
	ldrsh r0, [r4, r7]
	movs r2, #6
	ldrsh r1, [r4, r2]
	movs r2, #1
	bl UpdateHalfSubmergedBridgeMetatiles
	movs r3, #4
	ldrsh r0, [r4, r3]
	movs r5, #6
	ldrsh r1, [r4, r5]
	movs r2, #0
	bl UpdateFloatingBridgeMetatiles
	ldrh r0, [r4, #4]
	strh r0, [r4, #8]
	ldrh r0, [r4, #6]
	strh r0, [r4, #0xa]
	movs r0, #2
	strh r0, [r4, #2]
	movs r0, #8
	strh r0, [r4, #0xc]
	b _0809D652
_0809D648:
	movs r7, #1
	rsbs r7, r7, #0
	adds r0, r7, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
_0809D652:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r5, r6, #0
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r7, #6
	ldrsh r3, [r4, r7]
	bl StandingOnSamePacifidlogBridge
	cmp r0, #0
	beq _0809D686
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r2, #1
	bl UpdateHalfSubmergedBridgeMetatiles
	movs r0, #2
	strh r0, [r4, #2]
	movs r0, #8
	strh r0, [r4, #0xc]
_0809D686:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #4]
	ldrh r0, [r6]
	strh r0, [r4, #6]
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r5, #0
	ldrsh r1, [r6, r5]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D6F6
	movs r0, #0x46
	bl PlaySE
	b _0809D6F6
_0809D6B4:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0809D6F6
	mov r0, sp
	movs r7, #0
	ldrsh r0, [r0, r7]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r2, #1
	bl UpdateFullySubmergedBridgeMetatiles
	movs r3, #8
	ldrsh r0, [r4, r3]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0809D6F2
	movs r5, #0xa
	ldrsh r0, [r4, r5]
	cmp r0, r1
	beq _0809D6F2
	movs r7, #8
	ldrsh r0, [r4, r7]
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	movs r2, #1
	bl UpdateFloatingBridgeMetatiles
_0809D6F2:
	movs r0, #1
	strh r0, [r4, #2]
_0809D6F6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PacifidlogBridgePerStepCallback

	thumb_func_start SetLoweredForetreeBridgeMetatile
SetLoweredForetreeBridgeMetatile: @ 0x0809D700
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	bl PlayerGetZCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809D75A
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	ldr r0, _0809D73C
	cmp r1, r0
	beq _0809D740
	adds r0, #8
	cmp r1, r0
	beq _0809D750
	b _0809D75A
	.align 2, 0
_0809D73C: .4byte 0x0000024E
_0809D740:
	ldr r2, _0809D74C
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
	b _0809D75A
	.align 2, 0
_0809D74C: .4byte 0x0000024F
_0809D750:
	ldr r2, _0809D760
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
_0809D75A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D760: .4byte 0x00000257
	thumb_func_end SetLoweredForetreeBridgeMetatile

	thumb_func_start SetNormalFortreeBridgeMetatile
SetNormalFortreeBridgeMetatile: @ 0x0809D764
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	bl PlayerGetZCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809D7BE
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	ldr r0, _0809D7A0
	cmp r1, r0
	beq _0809D7A4
	adds r0, #8
	cmp r1, r0
	beq _0809D7B4
	b _0809D7BE
	.align 2, 0
_0809D7A0: .4byte 0x0000024F
_0809D7A4:
	ldr r2, _0809D7B0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
	b _0809D7BE
	.align 2, 0
_0809D7B0: .4byte 0x0000024E
_0809D7B4:
	ldr r2, _0809D7C4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
_0809D7BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D7C4: .4byte 0x00000256
	thumb_func_end SetNormalFortreeBridgeMetatile

	thumb_func_start FortreeBridgePerStepCallback
FortreeBridgePerStepCallback: @ 0x0809D7C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0809D804
	adds r6, r1, r0
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	movs r0, #2
	ldrsh r5, [r6, r0]
	mov sb, r4
	cmp r5, #1
	beq _0809D85C
	cmp r5, #1
	bgt _0809D808
	cmp r5, #0
	beq _0809D810
	b _0809D9CE
	.align 2, 0
_0809D804: .4byte 0x03005B68
_0809D808:
	cmp r5, #2
	bne _0809D80E
	b _0809D93C
_0809D80E:
	b _0809D9CE
_0809D810:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, #4]
	mov r1, sb
	ldrh r0, [r1]
	strh r0, [r6, #6]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r3, #0
	ldrsh r1, [r1, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D83A
	b _0809D9CA
_0809D83A:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, sb
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl SetLoweredForetreeBridgeMetatile
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, sb
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
	b _0809D9CA
_0809D85C:
	ldrh r0, [r6, #6]
	mov r8, r0
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r2, [r6, #4]
	mov sl, r2
	movs r3, #4
	ldrsh r7, [r6, r3]
	cmp r0, r7
	bne _0809D884
	mov r0, sb
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0809D884
	b _0809D9CE
_0809D884:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, sb
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r1, r4, #0x10
	adds r0, r7, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	bl PlayerGetZCoord
	movs r1, #0
	ands r5, r0
	lsls r0, r5, #0x18
	adds r5, r4, #0
	cmp r0, #0
	bne _0809D8CC
	movs r1, #1
_0809D8CC:
	cmp r1, #0
	beq _0809D8E0
	ldr r1, [sp, #4]
	cmp r1, #1
	beq _0809D8DA
	cmp r7, #1
	bne _0809D8E0
_0809D8DA:
	movs r0, #0x47
	bl PlaySE
_0809D8E0:
	cmp r7, #0
	beq _0809D91C
	mov r2, sl
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetNormalFortreeBridgeMetatile
	adds r0, r4, #0
	adds r1, r5, #0
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	mov r2, sb
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl SetLoweredForetreeBridgeMetatile
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, sb
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
_0809D91C:
	mov r0, sl
	strh r0, [r6, #8]
	mov r1, r8
	strh r1, [r6, #0xa]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, #4]
	mov r2, sb
	ldrh r0, [r2]
	strh r0, [r6, #6]
	cmp r7, #0
	beq _0809D9CE
	movs r0, #0x10
	strh r0, [r6, #0xc]
	movs r0, #2
	strh r0, [r6, #2]
_0809D93C:
	ldrh r0, [r6, #0xc]
	subs r0, #1
	strh r0, [r6, #0xc]
	ldrh r3, [r6, #8]
	mov sl, r3
	ldrh r0, [r6, #0xa]
	mov r8, r0
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	movs r1, #7
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bhi _0809D9C2
	lsls r0, r0, #2
	ldr r1, _0809D968
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809D968: .4byte 0x0809D96C
_0809D96C: @ jump table
	.4byte _0809D98C @ case 0
	.4byte _0809D9C2 @ case 1
	.4byte _0809D9C2 @ case 2
	.4byte _0809D9C2 @ case 3
	.4byte _0809D99E @ case 4
	.4byte _0809D9C2 @ case 5
	.4byte _0809D9C2 @ case 6
	.4byte _0809D9C2 @ case 7
_0809D98C:
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	bl CurrentMapDrawMetatileAt
	b _0809D9C2
_0809D99E:
	mov r0, sl
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	mov r1, r8
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetLoweredForetreeBridgeMetatile
	adds r0, r5, #0
	adds r1, r4, #0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetNormalFortreeBridgeMetatile
_0809D9C2:
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bne _0809D9CE
_0809D9CA:
	movs r0, #1
	strh r0, [r6, #2]
_0809D9CE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FortreeBridgePerStepCallback

	thumb_func_start CoordInIcePuzzleRegion
CoordInIcePuzzleRegion: @ 0x0809D9E0
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	ldr r2, _0809DA10
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0xa
	bhi _0809DA1C
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	ldr r2, _0809DA14
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0xd
	bhi _0809DA1C
	ldr r0, _0809DA18
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _0809DA1C
	movs r0, #1
	b _0809DA1E
	.align 2, 0
_0809DA10: .4byte 0xFFFD0000
_0809DA14: .4byte 0xFFFA0000
_0809DA18: .4byte 0x084E8A0C
_0809DA1C:
	movs r0, #0
_0809DA1E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CoordInIcePuzzleRegion

	thumb_func_start MarkIcePuzzleCoordVisited
MarkIcePuzzleCoordVisited: @ 0x0809DA24
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl CoordInIcePuzzleRegion
	cmp r0, #0
	beq _0809DA52
	ldr r1, _0809DA58
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetVarPointer
	subs r2, r5, #3
	movs r1, #1
	lsls r1, r2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_0809DA52:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DA58: .4byte 0x084E8A0C
	thumb_func_end MarkIcePuzzleCoordVisited

	thumb_func_start IsIcePuzzleCoordVisited
IsIcePuzzleCoordVisited: @ 0x0809DA5C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl CoordInIcePuzzleRegion
	cmp r0, #0
	beq _0809DA8E
	ldr r1, _0809DA94
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl VarGet
	lsls r0, r0, #0x10
	subs r2, r5, #3
	movs r1, #0x80
	lsls r1, r1, #9
	lsls r1, r2
	ands r1, r0
	cmp r1, #0
	bne _0809DA98
_0809DA8E:
	movs r0, #0
	b _0809DA9A
	.align 2, 0
_0809DA94: .4byte 0x084E8A0C
_0809DA98:
	movs r0, #1
_0809DA9A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsIcePuzzleCoordVisited

	thumb_func_start SetSootopolisGymCrackedIceMetatiles
SetSootopolisGymCrackedIceMetatiles: @ 0x0809DAA0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0809DAF4
	ldr r0, [r0]
	ldr r1, [r0]
	mov sb, r1
	ldr r7, [r0, #4]
	movs r5, #0
	cmp r5, sb
	bge _0809DAE8
_0809DAB8:
	movs r4, #0
	adds r0, r5, #1
	mov r8, r0
	cmp r4, r7
	bge _0809DAE2
	lsls r6, r5, #0x10
_0809DAC4:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	asrs r0, r6, #0x10
	bl IsIcePuzzleCoordVisited
	cmp r0, #1
	bne _0809DADC
	adds r1, r4, #7
	adds r0, r5, #7
	ldr r2, _0809DAF8
	bl MapGridSetMetatileIdAt
_0809DADC:
	adds r4, #1
	cmp r4, r7
	blt _0809DAC4
_0809DAE2:
	mov r5, r8
	cmp r5, sb
	blt _0809DAB8
_0809DAE8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DAF4: .4byte 0x02036FB8
_0809DAF8: .4byte 0x0000020E
	thumb_func_end SetSootopolisGymCrackedIceMetatiles

	thumb_func_start SootopolisGymIcePerStepCallback
SootopolisGymIcePerStepCallback: @ 0x0809DAFC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0809DB20
	adds r5, r1, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _0809DB48
	cmp r0, #1
	bgt _0809DB24
	cmp r0, #0
	beq _0809DB30
	b _0809DC7E
	.align 2, 0
_0809DB20: .4byte 0x03005B68
_0809DB24:
	cmp r0, #2
	beq _0809DBDE
	cmp r0, #3
	bne _0809DB2E
	b _0809DC38
_0809DB2E:
	b _0809DC7E
_0809DB30:
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #4]
	ldrh r0, [r4]
	strh r0, [r5, #6]
	b _0809DC7A
_0809DB48:
	mov r7, sp
	adds r7, #2
	mov r0, sp
	adds r1, r7, #0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0809DB72
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r3, #6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0809DB72
	b _0809DC7E
_0809DB72:
	strh r2, [r5, #4]
	ldrh r0, [r7]
	strh r0, [r5, #6]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r7, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0809DBB4
	bl GetVarPointer
	adds r6, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsThinIce
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809DBB8
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r0, #4
	strh r0, [r5, #0xc]
	movs r0, #2
	b _0809DBD0
	.align 2, 0
_0809DBB4: .4byte 0x00004022
_0809DBB8:
	adds r0, r4, #0
	bl MetatileBehavior_IsCrackedIce
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809DC7E
	movs r0, #0
	strh r0, [r6]
	movs r0, #4
	strh r0, [r5, #0xc]
	movs r0, #3
_0809DBD0:
	strh r0, [r5, #2]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #8]
	ldrh r0, [r7]
	strh r0, [r5, #0xa]
	b _0809DC7E
_0809DBDE:
	ldrh r1, [r5, #0xc]
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bne _0809DC42
	mov r1, sp
	ldrh r0, [r5, #8]
	strh r0, [r1]
	mov r4, sp
	adds r4, #2
	ldrh r0, [r5, #0xa]
	strh r0, [r4]
	movs r0, #0x2a
	bl PlaySE
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r2, _0809DC34
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	ldrh r0, [r0]
	subs r0, #7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4]
	subs r1, #7
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl MarkIcePuzzleCoordVisited
	b _0809DC7A
	.align 2, 0
_0809DC34: .4byte 0x0000020E
_0809DC38:
	ldrh r1, [r5, #0xc]
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	cmp r0, #0
	beq _0809DC48
_0809DC42:
	subs r0, r1, #1
	strh r0, [r5, #0xc]
	b _0809DC7E
_0809DC48:
	mov r1, sp
	ldrh r0, [r5, #8]
	strh r0, [r1]
	mov r4, sp
	adds r4, #2
	ldrh r0, [r5, #0xa]
	strh r0, [r4]
	movs r0, #0x29
	bl PlaySE
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r2, _0809DC88
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
_0809DC7A:
	movs r0, #1
	strh r0, [r5, #2]
_0809DC7E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DC88: .4byte 0x00000206
	thumb_func_end SootopolisGymIcePerStepCallback

	thumb_func_start AshGrassPerStepCallback
AshGrassPerStepCallback: @ 0x0809DC8C
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0809DD10
	adds r5, r1, r0
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0809DCC6
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0809DD52
_0809DCC6:
	strh r2, [r5, #2]
	ldrh r0, [r4]
	strh r0, [r5, #4]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsAshGrass
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809DD52
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _0809DD14
	cmp r0, r1
	bne _0809DD1C
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r2, _0809DD18
	movs r3, #4
	bl StartAshFieldEffect
	b _0809DD2E
	.align 2, 0
_0809DD10: .4byte 0x03005B68
_0809DD14: .4byte 0x0000020A
_0809DD18: .4byte 0x00000212
_0809DD1C:
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r2, _0809DD5C
	movs r3, #4
	bl StartAshFieldEffect
_0809DD2E:
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #1
	bl CheckBagHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809DD52
	ldr r0, _0809DD60
	bl GetVarPointer
	adds r2, r0, #0
	ldrh r1, [r2]
	ldr r0, _0809DD64
	cmp r1, r0
	bhi _0809DD52
	adds r0, r1, #1
	strh r0, [r2]
_0809DD52:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DD5C: .4byte 0x00000206
_0809DD60: .4byte 0x00004048
_0809DD64: .4byte 0x0000270E
	thumb_func_end AshGrassPerStepCallback

	thumb_func_start SetCrackedFloorHoleMetatile
SetCrackedFloorHoleMetatile: @ 0x0809DD68
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _0809DD9C
	ldr r2, _0809DDA0
	cmp r0, r1
	bne _0809DD84
	subs r2, #0x31
_0809DD84:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
	adds r0, r5, #0
	adds r1, r4, #0
	bl CurrentMapDrawMetatileAt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DD9C: .4byte 0x0000022F
_0809DDA0: .4byte 0x00000237
	thumb_func_end SetCrackedFloorHoleMetatile

	thumb_func_start CrackedFloorPerStepCallback
CrackedFloorPerStepCallback: @ 0x0809DDA4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0809DE8C
	adds r5, r1, r0
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
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r1, [r5, #8]
	movs r3, #8
	ldrsh r0, [r5, r3]
	adds r7, r4, #0
	cmp r0, #0
	beq _0809DDF6
	subs r0, r1, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0809DDF6
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	bl SetCrackedFloorHoleMetatile
_0809DDF6:
	ldrh r1, [r5, #0xe]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	cmp r0, #0
	beq _0809DE16
	subs r0, r1, #1
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0809DE16
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	bl SetCrackedFloorHoleMetatile
_0809DE16:
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	adds r0, r6, #0
	bl MetatileBehavior_IsCrackedFloorHole
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809DE2E
	ldr r0, _0809DE90
	movs r1, #0
	bl VarSet
_0809DE2E:
	mov r0, sp
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0809DE4A
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r3, #6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0809DEAA
_0809DE4A:
	strh r2, [r5, #4]
	adds r4, r7, #0
	ldrh r0, [r4]
	strh r0, [r5, #6]
	adds r0, r6, #0
	bl MetatileBehavior_IsCrackedFloor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809DEAA
	bl GetPlayerSpeed
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	beq _0809DE72
	ldr r0, _0809DE90
	movs r1, #0
	bl VarSet
_0809DE72:
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0809DE94
	movs r0, #3
	strh r0, [r5, #8]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	ldrh r0, [r4]
	strh r0, [r5, #0xc]
	b _0809DEAA
	.align 2, 0
_0809DE8C: .4byte 0x03005B68
_0809DE90: .4byte 0x00004022
_0809DE94:
	movs r2, #0xe
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0809DEAA
	movs r0, #3
	strh r0, [r5, #0xe]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0x10]
	ldrh r0, [r7]
	strh r0, [r5, #0x12]
_0809DEAA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CrackedFloorPerStepCallback

	thumb_func_start SetMuddySlopeMetatile
SetMuddySlopeMetatile: @ 0x0809DEB4
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0809DED0
	movs r2, #0xe8
	b _0809DEE4
_0809DED0:
	ldr r1, _0809DF0C
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #0
	bge _0809DEDC
	adds r0, #7
_0809DEDC:
	asrs r0, r0, #3
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
_0809DEE4:
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
	adds r0, r5, #0
	adds r1, r4, #0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xe8
	bl MapGridSetMetatileIdAt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DF0C: .4byte 0x084E8A40
	thumb_func_end SetMuddySlopeMetatile

	thumb_func_start Task_MuddySlope
Task_MuddySlope: @ 0x0809DF10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0809DF58
	adds r4, r1, r0
	mov r5, sp
	adds r5, #2
	mov r0, sp
	adds r1, r5, #0
	bl PlayerGetDestCoords
	ldr r0, _0809DF5C
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	lsls r1, r1, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #2
	ldrsh r1, [r4, r0]
	mov r8, r5
	cmp r1, #0
	beq _0809DF60
	cmp r1, #1
	beq _0809DF8C
	b _0809DFE0
	.align 2, 0
_0809DF58: .4byte 0x03005B68
_0809DF5C: .4byte 0x03005AEC
_0809DF60:
	strh r7, [r4]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #4]
	ldrh r0, [r5]
	strh r0, [r4, #6]
	movs r0, #1
	strh r0, [r4, #2]
	strh r1, [r4, #8]
	strh r1, [r4, #0xe]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1a]
	b _0809DFE0
_0809DF7A:
	movs r0, #0x20
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, #2]
	mov r2, r8
	ldrh r0, [r2]
	strh r0, [r1, #4]
	b _0809DFE0
_0809DF8C:
	mov r0, sp
	movs r3, #4
	ldrsh r1, [r4, r3]
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0809DFA8
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r3, #0
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0809DFE0
_0809DFA8:
	strh r2, [r4, #4]
	ldrh r0, [r5]
	strh r0, [r4, #6]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsMuddySlope
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809DFE0
	movs r6, #4
	adds r1, r4, #0
	adds r1, #8
_0809DFD0:
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0809DF7A
	adds r1, #6
	adds r6, #3
	cmp r6, #0xd
	ble _0809DFD0
_0809DFE0:
	ldr r2, _0809DFFC
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809E000
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r7, r0
	beq _0809E000
	strh r7, [r4]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	b _0809E004
	.align 2, 0
_0809DFFC: .4byte 0x02036FD4
_0809E000:
	movs r0, #0
	movs r1, #0
_0809E004:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	adds r5, r4, #0
	adds r5, #8
	adds r4, r5, #0
	movs r6, #9
_0809E016:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0809E03A
	ldrh r0, [r4, #2]
	mov r3, r8
	subs r0, r0, r3
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, r0, r7
	strh r0, [r4, #4]
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl SetMuddySlopeMetatile
_0809E03A:
	adds r4, #6
	adds r5, #6
	subs r6, #3
	cmp r6, #0
	bge _0809E016
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Task_MuddySlope

