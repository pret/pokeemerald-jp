.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start FieldClearPlayerInput
FieldClearPlayerInput: @ 0x0809B7B4
	push {r4, r5, lr}
	movs r1, #2
	rsbs r1, r1, #0
	movs r3, #3
	rsbs r3, r3, #0
	movs r4, #5
	rsbs r4, r4, #0
	movs r5, #9
	rsbs r5, r5, #0
	movs r2, #0
	strb r2, [r0]
	ldrb r2, [r0, #1]
	ands r1, r2
	ands r1, r3
	ands r1, r4
	ands r1, r5
	strb r1, [r0, #1]
	movs r1, #0
	strb r1, [r0, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end FieldClearPlayerInput

	thumb_func_start FieldGetPlayerInput
FieldGetPlayerInput: @ 0x0809B7E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r0, _0809B8B0
	ldrb r6, [r0, #3]
	ldrb r0, [r0, #2]
	mov sb, r0
	bl GetPlayerCurMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsForcedMovementTile
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r6, #2
	bne _0809B814
	cmp r7, #0
	beq _0809B818
_0809B814:
	cmp r6, #0
	bne _0809B87A
_0809B818:
	bl GetPlayerSpeed
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	beq _0809B864
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _0809B834
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_0809B834:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0809B844
	ldrb r0, [r4]
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
_0809B844:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0809B854
	ldrb r0, [r4]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4]
_0809B854:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0809B864
	ldrb r0, [r4]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4]
_0809B864:
	movs r0, #0xf0
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0809B87A
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4]
_0809B87A:
	cmp r7, #0
	bne _0809B8A0
	cmp r6, #2
	bne _0809B890
	mov r0, sb
	cmp r0, #2
	bne _0809B890
	ldrb r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4]
_0809B890:
	cmp r7, #0
	bne _0809B8A0
	cmp r6, #2
	bne _0809B8A0
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
_0809B8A0:
	movs r0, #0x40
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0809B8B4
	movs r0, #2
	b _0809B8DC
	.align 2, 0
_0809B8B0: .4byte 0x02037230
_0809B8B4:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0809B8C2
	movs r0, #1
	b _0809B8DC
_0809B8C2:
	movs r0, #0x20
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0809B8D0
	movs r0, #3
	b _0809B8DC
_0809B8D0:
	movs r0, #0x10
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0809B8DE
	movs r0, #4
_0809B8DC:
	strb r0, [r4, #2]
_0809B8DE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FieldGetPlayerInput

	thumb_func_start ProcessPlayerFieldInput
ProcessPlayerFieldInput: @ 0x0809B8EC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0809BA2C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0809BA30
	strb r1, [r0]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r4, sp
	mov r0, sp
	bl GetPlayerPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl CheckForTrainersWantingBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809BA26
	bl TryRunOnFrameMapScript
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809BA26
	ldrb r1, [r5]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809B948
	bl TrySetupDiveEmergeScript
	cmp r0, #1
	beq _0809BA26
_0809B948:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B96E
	movs r0, #5
	bl IncrementGameStat
	bl IncrementBirthIslandRockStepCount
	mov r0, sp
	adds r1, r4, #0
	adds r2, r6, #0
	bl TryStartStepBasedScript
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809BA26
_0809B96E:
	ldrb r1, [r5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809B986
	adds r0, r4, #0
	bl CheckStandardWildEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809BA26
_0809B986:
	ldrb r1, [r5]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809B9A8
	ldrb r0, [r5, #2]
	cmp r0, r6
	bne _0809B9A8
	mov r0, sp
	adds r1, r4, #0
	adds r2, r6, #0
	bl TryArrowWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809BA26
_0809B9A8:
	mov r4, sp
	mov r0, sp
	bl GetInFrontOfPlayerPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B9DE
	mov r0, sp
	adds r1, r4, #0
	adds r2, r6, #0
	bl TryStartInteractionScript
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809BA26
_0809B9DE:
	ldrb r1, [r5]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809BA00
	ldrb r0, [r5, #2]
	cmp r0, r6
	bne _0809BA00
	mov r0, sp
	adds r1, r4, #0
	adds r2, r6, #0
	bl TryDoorWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809BA26
_0809BA00:
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BA12
	bl TrySetupDiveDownScript
	cmp r0, #1
	beq _0809BA26
_0809BA12:
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0809BA34
	movs r0, #6
	bl PlaySE
	bl ShowStartMenu
_0809BA26:
	movs r0, #1
	b _0809BA4A
	.align 2, 0
_0809BA2C: .4byte 0x02037292
_0809BA30: .4byte 0x03005B50
_0809BA34:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0809BA48
	bl UseRegisteredKeyItemOnField
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809BA26
_0809BA48:
	movs r0, #0
_0809BA4A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ProcessPlayerFieldInput

	thumb_func_start GetPlayerPosition
GetPlayerPosition: @ 0x0809BA54
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #2
	bl PlayerGetDestCoords
	bl PlayerGetZCoord
	strb r0, [r4, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetPlayerPosition

	thumb_func_start GetInFrontOfPlayerPosition
GetInFrontOfPlayerPosition: @ 0x0809BA6C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r1, r5, #2
	bl GetXYCoordsOneStepInFrontOfPlayer
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
	bl MapGridGetZCoordAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0809BA9E
	bl PlayerGetZCoord
_0809BA9E:
	strb r0, [r5, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end GetInFrontOfPlayerPosition

	thumb_func_start GetPlayerCurMetatileBehavior
GetPlayerCurMetatileBehavior: @ 0x0809BAA8
	push {r4, lr}
	sub sp, #4
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
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetPlayerCurMetatileBehavior

	thumb_func_start TryStartInteractionScript
TryStartInteractionScript: @ 0x0809BAD4
	push {r4, lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl GetInteractionScript
	adds r4, r0, #0
	cmp r4, #0
	bne _0809BAEC
	movs r0, #0
	b _0809BB24
_0809BAEC:
	ldr r0, _0809BB2C
	cmp r4, r0
	beq _0809BB1C
	ldr r0, _0809BB30
	cmp r4, r0
	beq _0809BB1C
	ldr r0, _0809BB34
	cmp r4, r0
	beq _0809BB1C
	ldr r0, _0809BB38
	cmp r4, r0
	beq _0809BB1C
	ldr r0, _0809BB3C
	cmp r4, r0
	beq _0809BB1C
	ldr r0, _0809BB40
	cmp r4, r0
	beq _0809BB1C
	ldr r0, _0809BB44
	cmp r4, r0
	beq _0809BB1C
	movs r0, #5
	bl PlaySE
_0809BB1C:
	adds r0, r4, #0
	bl ScriptContext1_SetupScript
	movs r0, #1
_0809BB24:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809BB2C: .4byte 0x081F01BC
_0809BB30: .4byte 0x081F0D9F
_0809BB34: .4byte 0x0821D3AA
_0809BB38: .4byte 0x0821D478
_0809BB3C: .4byte 0x082465B5
_0809BB40: .4byte 0x082465B9
_0809BB44: .4byte 0x08242E1E
	thumb_func_end TryStartInteractionScript

	thumb_func_start GetInteractionScript
GetInteractionScript: @ 0x0809BB48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	mov r8, r5
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	adds r7, r4, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl GetInteractedEventObjectScript
	cmp r0, #0
	bne _0809BB94
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl GetInteractedBackgroundEventScript
	cmp r0, #0
	bne _0809BB94
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl GetInteractedMetatileScript
	cmp r0, #0
	bne _0809BB94
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	bl GetInteractedWaterScript
	cmp r0, #0
	bne _0809BB94
	movs r0, #0
_0809BB94:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetInteractionScript

	thumb_func_start GetInteractedLinkPlayerScript
GetInteractedLinkPlayerScript: @ 0x0809BBA0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsCounter
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809BBC8
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	b _0809BBE6
_0809BBC8:
	ldr r1, _0809BC0C
	lsls r2, r6, #3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, #4
	adds r2, r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
_0809BBE6:
	ldrb r2, [r4, #4]
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x10
	beq _0809BC06
	ldr r1, _0809BC10
	lsls r2, r3, #3
	adds r0, r2, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	adds r5, r1, #0
	cmp r0, #0xff
	bne _0809BC14
_0809BC06:
	movs r0, #0
	b _0809BC46
	.align 2, 0
_0809BC0C: .4byte 0x0830FCB0
_0809BC10: .4byte 0x02036FF0
_0809BC14:
	movs r4, #0
	ldr r1, _0809BC4C
_0809BC18:
	ldrb r0, [r1]
	cmp r0, #1
	bne _0809BC24
	ldrb r0, [r1, #2]
	cmp r0, r3
	beq _0809BC06
_0809BC24:
	adds r1, #4
	adds r4, #1
	cmp r4, #3
	ble _0809BC18
	ldr r0, _0809BC50
	strb r3, [r0]
	ldr r1, _0809BC54
	adds r0, r2, r3
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0, #8]
	strh r0, [r1]
	ldr r0, _0809BC58
	strh r6, [r0]
	adds r0, r3, #0
	bl GetEventObjectScriptPointerByEventObjectId
_0809BC46:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809BC4C: .4byte 0x02031FA8
_0809BC50: .4byte 0x03005B50
_0809BC54: .4byte 0x02037292
_0809BC58: .4byte 0x02037294
	thumb_func_end GetInteractedLinkPlayerScript

	thumb_func_start GetInteractedEventObjectScript
GetInteractedEventObjectScript: @ 0x0809BC5C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	ldrb r2, [r5, #4]
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x10
	beq _0809BC8C
	ldr r1, _0809BCDC
	lsls r2, r4, #3
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	adds r3, r1, #0
	cmp r0, #0xff
	bne _0809BCE4
_0809BC8C:
	adds r0, r6, #0
	bl MetatileBehavior_IsCounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BCD8
	ldr r1, _0809BCE0
	lsls r2, r7, #3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r5]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, #4
	adds r2, r2, r1
	ldr r2, [r2]
	ldrh r1, [r5, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r2, [r5, #4]
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x10
	beq _0809BCD8
	ldr r1, _0809BCDC
	lsls r2, r4, #3
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	adds r3, r1, #0
	cmp r0, #0xff
	bne _0809BCE4
_0809BCD8:
	movs r0, #0
	b _0809BD26
	.align 2, 0
_0809BCDC: .4byte 0x02036FF0
_0809BCE0: .4byte 0x0830FCB0
_0809BCE4:
	ldr r0, _0809BD08
	strb r4, [r0]
	ldr r1, _0809BD0C
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	strh r0, [r1]
	ldr r0, _0809BD10
	strh r7, [r0]
	bl InTrainerHill
	cmp r0, #1
	bne _0809BD14
	bl GetTrainerHillTrainerScript
	b _0809BD1A
	.align 2, 0
_0809BD08: .4byte 0x03005B50
_0809BD0C: .4byte 0x02037292
_0809BD10: .4byte 0x02037294
_0809BD14:
	adds r0, r4, #0
	bl GetEventObjectScriptPointerByEventObjectId
_0809BD1A:
	adds r1, r0, #0
	ldr r0, _0809BD2C
	ldrb r0, [r0]
	bl GetRamScript
	adds r1, r0, #0
_0809BD26:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809BD2C: .4byte 0x02037292
	thumb_func_end GetInteractedEventObjectScript

	thumb_func_start GetInteractedBackgroundEventScript
GetInteractedBackgroundEventScript: @ 0x0809BD30
	push {r4, r5, lr}
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r4, _0809BD60
	ldrh r1, [r0]
	subs r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r0, #2]
	subs r2, #7
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r3, [r0, #4]
	adds r0, r4, #0
	bl GetBackgroundEventAtPosition
	cmp r0, #0
	beq _0809BDA4
	ldr r2, [r0, #8]
	cmp r2, #0
	bne _0809BD68
	ldr r0, _0809BD64
	b _0809BE0A
	.align 2, 0
_0809BD60: .4byte 0x02036FB8
_0809BD64: .4byte 0x08276D3D
_0809BD68:
	ldrb r0, [r0, #5]
	cmp r0, #8
	bhi _0809BE08
	lsls r0, r0, #2
	ldr r1, _0809BD78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809BD78: .4byte 0x0809BD7C
_0809BD7C: @ jump table
	.4byte _0809BE08 @ case 0
	.4byte _0809BDA0 @ case 1
	.4byte _0809BDA8 @ case 2
	.4byte _0809BDAE @ case 3
	.4byte _0809BDB4 @ case 4
	.4byte _0809BDBA @ case 5
	.4byte _0809BDBA @ case 6
	.4byte _0809BDBA @ case 7
	.4byte _0809BDE8 @ case 8
_0809BDA0:
	cmp r5, #2
	beq _0809BE08
_0809BDA4:
	movs r0, #0
	b _0809BE0A
_0809BDA8:
	cmp r5, #1
	beq _0809BE08
	b _0809BDA4
_0809BDAE:
	cmp r5, #4
	beq _0809BE08
	b _0809BDA4
_0809BDB4:
	cmp r5, #3
	beq _0809BE08
	b _0809BDA4
_0809BDBA:
	ldr r1, _0809BDDC
	lsrs r0, r2, #0x10
	movs r3, #0xfa
	lsls r3, r3, #1
	adds r0, r0, r3
	strh r0, [r1]
	ldr r0, _0809BDE0
	strh r2, [r0]
	ldrh r0, [r1]
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809BDA4
	ldr r0, _0809BDE4
	b _0809BE0A
	.align 2, 0
_0809BDDC: .4byte 0x02037280
_0809BDE0: .4byte 0x02037282
_0809BDE4: .4byte 0x08242D49
_0809BDE8:
	cmp r5, #2
	bne _0809BDA4
	ldr r0, _0809BE00
	strh r2, [r0]
	bl TrySetCurSecretBase
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809BDA4
	ldr r0, _0809BE04
	b _0809BE0A
	.align 2, 0
_0809BE00: .4byte 0x02037280
_0809BE04: .4byte 0x08245AA0
_0809BE08:
	adds r0, r2, #0
_0809BE0A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetInteractedBackgroundEventScript

	thumb_func_start GetInteractedMetatileScript
GetInteractedMetatileScript: @ 0x0809BE10
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl MetatileBehavior_IsPlayerFacingTVScreen
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BE34
	ldr r0, _0809BE30
	b _0809C0BC
	.align 2, 0
_0809BE30: .4byte 0x0824C47B
_0809BE34:
	adds r0, r5, #0
	bl MetatileBehavior_IsPC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BE4C
	ldr r0, _0809BE48
	b _0809C0BC
	.align 2, 0
_0809BE48: .4byte 0x08242E1E
_0809BE4C:
	adds r0, r5, #0
	bl MetatileBehavior_IsClosedSootopolisDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BE64
	ldr r0, _0809BE60
	b _0809C0BC
	.align 2, 0
_0809BE60: .4byte 0x081E27F7
_0809BE64:
	adds r0, r5, #0
	bl MetatileBehavior_IsUnknownClosedDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BE7C
	ldr r0, _0809BE78
	b _0809C0BC
	.align 2, 0
_0809BE78: .4byte 0x0821BD3E
_0809BE7C:
	adds r0, r5, #0
	bl MetatileBehavior_IsCableBoxResults1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BE8C
	b _0809BFBC
_0809BE8C:
	adds r0, r5, #0
	bl MetatileBehavior_IsPokeblockFeeder
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BEA4
	ldr r0, _0809BEA0
	b _0809C0BC
	.align 2, 0
_0809BEA0: .4byte 0x0826240A
_0809BEA4:
	adds r0, r5, #0
	bl MetatileBehavior_IsTrickHousePuzzleDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BEBC
	ldr r0, _0809BEB8
	b _0809C0BC
	.align 2, 0
_0809BEB8: .4byte 0x0823CFFB
_0809BEBC:
	adds r0, r5, #0
	bl MetatileBehavior_IsRegionMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BED4
	ldr r0, _0809BED0
	b _0809C0BC
	.align 2, 0
_0809BED0: .4byte 0x0824311B
_0809BED4:
	adds r0, r5, #0
	bl MetatileBehavior_IsRunningShoesManual
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BEEC
	ldr r0, _0809BEE8
	b _0809C0BC
	.align 2, 0
_0809BEE8: .4byte 0x082585CF
_0809BEEC:
	adds r0, r5, #0
	bl MetatileBehavior_IsPictureBookShelf
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BF04
	ldr r0, _0809BF00
	b _0809C0BC
	.align 2, 0
_0809BF00: .4byte 0x08243651
_0809BF04:
	adds r0, r5, #0
	bl MetatileBehavior_IsBookShelf
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BF1C
	ldr r0, _0809BF18
	b _0809C0BC
	.align 2, 0
_0809BF18: .4byte 0x0824365A
_0809BF1C:
	adds r0, r5, #0
	bl MetatileBehavior_IsPokeCenterBookShelf
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BF34
	ldr r0, _0809BF30
	b _0809C0BC
	.align 2, 0
_0809BF30: .4byte 0x08243663
_0809BF34:
	adds r0, r5, #0
	bl MetatileBehavior_IsVase
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BF4C
	ldr r0, _0809BF48
	b _0809C0BC
	.align 2, 0
_0809BF48: .4byte 0x0824366C
_0809BF4C:
	adds r0, r5, #0
	bl MetatileBehavior_IsTrashCan
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BF64
	ldr r0, _0809BF60
	b _0809C0BC
	.align 2, 0
_0809BF60: .4byte 0x08243675
_0809BF64:
	adds r0, r5, #0
	bl MetatileBehavior_IsShopShelf
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BF7C
	ldr r0, _0809BF78
	b _0809C0BC
	.align 2, 0
_0809BF78: .4byte 0x0824367E
_0809BF7C:
	adds r0, r5, #0
	bl MetatileBehavior_IsBlueprint
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BF94
	ldr r0, _0809BF90
	b _0809C0BC
	.align 2, 0
_0809BF90: .4byte 0x08243687
_0809BF94:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MetatileBehavior_IsPlayerFacingWirelessBoxResults
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BFAC
	ldr r0, _0809BFA8
	b _0809C0BC
	.align 2, 0
_0809BFA8: .4byte 0x08247869
_0809BFAC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MetatileBehavior_IsCableBoxResults2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BFC4
_0809BFBC:
	ldr r0, _0809BFC0
	b _0809C0BC
	.align 2, 0
_0809BFC0: .4byte 0x08247044
_0809BFC4:
	adds r0, r5, #0
	bl MetatileBehavior_IsQuestionnaire
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BFDC
	ldr r0, _0809BFD8
	b _0809C0BC
	.align 2, 0
_0809BFD8: .4byte 0x08244245
_0809BFDC:
	adds r0, r5, #0
	bl MetatileBehavior_IsTrainerHillTimer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BFF4
	ldr r0, _0809BFF0
	b _0809C0BC
	.align 2, 0
_0809BFF0: .4byte 0x08276CAF
_0809BFF4:
	movs r4, #4
	ldrsb r4, [r6, r4]
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	bl MapGridGetZCoordAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0809C0A8
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBasePC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C024
	ldr r0, _0809C020
	b _0809C0BC
	.align 2, 0
_0809C020: .4byte 0x0821D3AA
_0809C024:
	adds r0, r5, #0
	bl MetatileBehavior_IsRecordMixingSecretBasePC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C03C
	ldr r0, _0809C038
	b _0809C0BC
	.align 2, 0
_0809C038: .4byte 0x0821D478
_0809C03C:
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBaseSandOrnament
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C054
	ldr r0, _0809C050
	b _0809C0BC
	.align 2, 0
_0809C050: .4byte 0x0821D573
_0809C054:
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBaseShieldOrToyTV
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C06C
	ldr r0, _0809C068
	b _0809C0BC
	.align 2, 0
_0809C068: .4byte 0x0821D57B
_0809C06C:
	adds r0, r5, #0
	bl MetatileBehavior_IsMB_C6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C080
	bl SetSecretBaseSecretsTvFlags_MiscFurnature
	b _0809C0BA
_0809C080:
	adds r0, r5, #0
	bl MetatileBehavior_HoldsLargeDecoration
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C094
	bl SetSecretBaseSecretsTvFlags_LargeDecorationSpot
	b _0809C0BA
_0809C094:
	adds r0, r5, #0
	bl MetatileBehavior_HoldsSmallDecoration
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C0BA
	bl SetSecretBaseSecretsTvFlags_SmallDecorationSpot
	b _0809C0BA
_0809C0A8:
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBasePoster
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C0BA
	bl SetSecretBaseSecretsTvFlags_Poster
_0809C0BA:
	movs r0, #0
_0809C0BC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetInteractedMetatileScript

	thumb_func_start GetInteractedWaterScript
GetInteractedWaterScript: @ 0x0809C0C4
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _0809C0F4
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C0FC
	bl PartyHasMonWithSurf
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C0FC
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C0FC
	ldr r0, _0809C0F8
	b _0809C13A
	.align 2, 0
_0809C0F4: .4byte 0x0000086B
_0809C0F8: .4byte 0x08242F2C
_0809C0FC:
	adds r0, r4, #0
	bl MetatileBehavior_IsWaterfall
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C138
	ldr r0, _0809C128
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C130
	bl IsPlayerSurfingNorth
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C130
	ldr r0, _0809C12C
	b _0809C13A
	.align 2, 0
_0809C128: .4byte 0x0000086E
_0809C12C: .4byte 0x0825685D
_0809C130:
	ldr r0, _0809C134
	b _0809C13A
	.align 2, 0
_0809C134: .4byte 0x08256897
_0809C138:
	movs r0, #0
_0809C13A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetInteractedWaterScript

	thumb_func_start TrySetupDiveDownScript
TrySetupDiveDownScript: @ 0x0809C140
	push {lr}
	ldr r0, _0809C164
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C16C
	bl TrySetDiveWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0809C16C
	ldr r0, _0809C168
	bl ScriptContext1_SetupScript
	movs r0, #1
	b _0809C16E
	.align 2, 0
_0809C164: .4byte 0x0000086D
_0809C168: .4byte 0x082568EA
_0809C16C:
	movs r0, #0
_0809C16E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TrySetupDiveDownScript

	thumb_func_start TrySetupDiveEmergeScript
TrySetupDiveEmergeScript: @ 0x0809C174
	push {lr}
	ldr r0, _0809C1A0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C1AC
	ldr r0, _0809C1A4
	ldrb r0, [r0, #0x17]
	cmp r0, #5
	bne _0809C1AC
	bl TrySetDiveWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C1AC
	ldr r0, _0809C1A8
	bl ScriptContext1_SetupScript
	movs r0, #1
	b _0809C1AE
	.align 2, 0
_0809C1A0: .4byte 0x0000086D
_0809C1A4: .4byte 0x02036FB8
_0809C1A8: .4byte 0x08256935
_0809C1AC:
	movs r0, #0
_0809C1AE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TrySetupDiveEmergeScript

	thumb_func_start TryStartStepBasedScript
TryStartStepBasedScript: @ 0x0809C1B4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r6, r4, #0
	bl TryStartCoordEventScript
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C206
	adds r0, r5, #0
	adds r1, r4, #0
	bl TryStartWarpEventScript
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C206
	adds r0, r4, #0
	bl TryStartMiscWalkingScripts
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C206
	adds r0, r6, #0
	bl TryStartStepCountScript
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C206
	bl UpdateRepelCounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C206
	movs r0, #0
	b _0809C208
_0809C206:
	movs r0, #1
_0809C208:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryStartStepBasedScript

	thumb_func_start TryStartCoordEventScript
TryStartCoordEventScript: @ 0x0809C210
	push {r4, lr}
	ldr r4, _0809C238
	ldrh r1, [r0]
	subs r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r0, #2]
	subs r2, #7
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r3, [r0, #4]
	adds r0, r4, #0
	bl GetCoordEventScriptAtPosition
	cmp r0, #0
	beq _0809C23C
	bl ScriptContext1_SetupScript
	movs r0, #1
	b _0809C23E
	.align 2, 0
_0809C238: .4byte 0x02036FB8
_0809C23C:
	movs r0, #0
_0809C23E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryStartCoordEventScript

	thumb_func_start TryStartMiscWalkingScripts
TryStartMiscWalkingScripts: @ 0x0809C244
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsCrackedFloorHole
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C260
	ldr r0, _0809C25C
	b _0809C26E
	.align 2, 0
_0809C25C: .4byte 0x0826433F
_0809C260:
	adds r0, r4, #0
	bl MetatileBehavior_IsBattlePyramidWarp
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C27C
	ldr r0, _0809C278
_0809C26E:
	bl ScriptContext1_SetupScript
	movs r0, #1
	b _0809C2C2
	.align 2, 0
_0809C278: .4byte 0x0822D6B1
_0809C27C:
	adds r0, r4, #0
	bl MetatileBehavior_IsSecretBaseGlitterMat
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C290
	bl DoSecretBaseGlitterMatSparkle
	b _0809C2C0
_0809C290:
	adds r0, r4, #0
	bl MetatileBehavior_IsSecretBaseSoundMat
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C2C0
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
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl PlaySecretBaseMusicNoteMatSound
_0809C2C0:
	movs r0, #0
_0809C2C2:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryStartMiscWalkingScripts

	thumb_func_start TryStartStepCountScript
TryStartStepCountScript: @ 0x0809C2CC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl InUnionRoom
	cmp r0, #1
	bne _0809C2DC
	b _0809C3FC
_0809C2DC:
	bl IncrementRematchStepCounter
	bl UpdateHappinessStepCounter
	bl UpdateFarawayIslandStepCounter
	ldr r0, _0809C318
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0809C3D0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsForcedMovementTile
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809C3D0
	bl UpdatePoisonStepCounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C320
	ldr r0, _0809C31C
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C318: .4byte 0x02037230
_0809C31C: .4byte 0x082440E6
_0809C320:
	bl ShouldEggHatch
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C33C
	movs r0, #0xd
	bl IncrementGameStat
	ldr r0, _0809C338
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C338: .4byte 0x08257A89
_0809C33C:
	bl UnusualWeatherHasExpired
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C354
	ldr r0, _0809C350
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C350: .4byte 0x08244749
_0809C354:
	bl ShouldDoBrailleRegicePuzzle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C36C
	ldr r0, _0809C368
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C368: .4byte 0x0821B7F4
_0809C36C:
	bl ShouldDoWallyCall
	cmp r0, #1
	bne _0809C380
	ldr r0, _0809C37C
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C37C: .4byte 0x081DDDF3
_0809C380:
	bl ShouldDoWinonaCall
	cmp r0, #1
	bne _0809C394
	ldr r0, _0809C390
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C390: .4byte 0x081ED2AD
_0809C394:
	bl ShouldDoScottCall
	cmp r0, #1
	bne _0809C3A8
	ldr r0, _0809C3A4
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C3A4: .4byte 0x081F1A71
_0809C3A8:
	bl ShouldDoRoxanneCall
	cmp r0, #1
	bne _0809C3BC
	ldr r0, _0809C3B8
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C3B8: .4byte 0x08202410
_0809C3BC:
	bl ShouldDoRivalRayquazaCall
	cmp r0, #1
	bne _0809C3D0
	ldr r0, _0809C3CC
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C3CC: .4byte 0x0820DA9F
_0809C3D0:
	bl SafariZoneTakeStep
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C400
	movs r0, #1
	bl CountSSTidalStep
	cmp r0, #1
	bne _0809C3F4
	ldr r0, _0809C3F0
	bl ScriptContext1_SetupScript
	b _0809C400
	.align 2, 0
_0809C3F0: .4byte 0x0821DEC7
_0809C3F4:
	bl TryStartMatchCall
	cmp r0, #0
	bne _0809C400
_0809C3FC:
	movs r0, #0
	b _0809C402
_0809C400:
	movs r0, #1
_0809C402:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryStartStepCountScript

	thumb_func_start Unref_ClearHappinessStepCounter
Unref_ClearHappinessStepCounter: @ 0x0809C408
	push {lr}
	ldr r0, _0809C418
	movs r1, #0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0809C418: .4byte 0x0000402A
	thumb_func_end Unref_ClearHappinessStepCounter

	thumb_func_start UpdateHappinessStepCounter
UpdateHappinessStepCounter: @ 0x0809C41C
	push {r4, r5, lr}
	ldr r0, _0809C450
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, #0x7f
	ands r1, r2
	strh r1, [r0]
	cmp r1, #0
	bne _0809C44A
	ldr r5, _0809C454
	movs r4, #5
_0809C43A:
	adds r0, r5, #0
	movs r1, #5
	bl AdjustFriendship
	adds r5, #0x64
	subs r4, #1
	cmp r4, #0
	bge _0809C43A
_0809C44A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809C450: .4byte 0x0000402A
_0809C454: .4byte 0x02024190
	thumb_func_end UpdateHappinessStepCounter

	thumb_func_start ClearPoisonStepCounter
ClearPoisonStepCounter: @ 0x0809C458
	push {lr}
	ldr r0, _0809C468
	movs r1, #0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0809C468: .4byte 0x0000402B
	thumb_func_end ClearPoisonStepCounter

	thumb_func_start UpdatePoisonStepCounter
UpdatePoisonStepCounter: @ 0x0809C46C
	push {lr}
	ldr r0, _0809C4A4
	ldrb r0, [r0, #0x17]
	cmp r0, #9
	beq _0809C4AC
	ldr r0, _0809C4A8
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, #3
	ands r1, r2
	strh r1, [r0]
	cmp r1, #0
	bne _0809C4AC
	bl DoPoisonFieldEffect
	cmp r0, #1
	beq _0809C4AC
	cmp r0, #1
	ble _0809C4AC
	cmp r0, #2
	bne _0809C4AC
	movs r0, #1
	b _0809C4AE
	.align 2, 0
_0809C4A4: .4byte 0x02036FB8
_0809C4A8: .4byte 0x0000402B
_0809C4AC:
	movs r0, #0
_0809C4AE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end UpdatePoisonStepCounter

	thumb_func_start RestartWildEncounterImmunitySteps
RestartWildEncounterImmunitySteps: @ 0x0809C4B4
	ldr r1, _0809C4BC
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0809C4BC: .4byte 0x02037274
	thumb_func_end RestartWildEncounterImmunitySteps

	thumb_func_start CheckStandardWildEncounter
CheckStandardWildEncounter: @ 0x0809C4C0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r7, r4, #0
	ldr r6, _0809C4DC
	ldrb r0, [r6]
	cmp r0, #3
	bhi _0809C4E4
	adds r0, #1
	strb r0, [r6]
	ldr r0, _0809C4E0
	strh r4, [r0]
	movs r0, #0
	b _0809C508
	.align 2, 0
_0809C4DC: .4byte 0x02037274
_0809C4E0: .4byte 0x02037276
_0809C4E4:
	ldr r5, _0809C4FC
	ldrh r1, [r5]
	adds r0, r4, #0
	bl StandardWildEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C500
	strh r4, [r5]
	movs r0, #0
	b _0809C508
	.align 2, 0
_0809C4FC: .4byte 0x02037276
_0809C500:
	movs r0, #0
	strb r0, [r6]
	strh r7, [r5]
	movs r0, #1
_0809C508:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckStandardWildEncounter

	thumb_func_start TryArrowWarp
TryArrowWarp: @ 0x0809C510
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0809C564
	mov r8, r0
	adds r1, r7, #0
	bl GetWarpEventAtMapPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsArrowWarpMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C568
	lsls r0, r6, #0x18
	asrs r4, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0809C568
	bl StoreInitialPlayerAvatarState
	mov r0, r8
	adds r1, r4, #0
	adds r2, r7, #0
	bl SetupWarp
	bl DoWarp
	movs r0, #1
	b _0809C56A
	.align 2, 0
_0809C564: .4byte 0x02036FB8
_0809C568:
	movs r0, #0
_0809C56A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end TryArrowWarp

	thumb_func_start TryStartWarpEventScript
TryStartWarpEventScript: @ 0x0809C574
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r7, _0809C5CC
	adds r0, r7, #0
	adds r1, r6, #0
	bl GetWarpEventAtMapPosition
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0809C662
	adds r0, r5, #0
	bl IsWarpMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C662
	bl StoreInitialPlayerAvatarState
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetupWarp
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsEscalator
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C5D0
	adds r0, r4, #0
	bl sub_080AF108
	movs r0, #1
	b _0809C664
	.align 2, 0
_0809C5CC: .4byte 0x02036FB8
_0809C5D0:
	adds r0, r4, #0
	bl MetatileBehavior_IsLavaridgeB1FWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C5E6
	bl sub_080AF124
	movs r0, #1
	b _0809C664
_0809C5E6:
	adds r0, r4, #0
	bl MetatileBehavior_IsLavaridge1FWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C5FC
	bl sub_080AF134
	movs r0, #1
	b _0809C664
_0809C5FC:
	adds r0, r4, #0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C612
	bl sub_080AF144
	movs r0, #1
	b _0809C664
_0809C612:
	adds r0, r4, #0
	bl MetatileBehavior_IsWarpOrBridge
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C628
	bl sub_080AFB64
	movs r0, #1
	b _0809C664
_0809C628:
	adds r0, r4, #0
	bl MetatileBehavior_IsMtPyreHole
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C644
	ldr r0, _0809C640
	bl ScriptContext1_SetupScript
	movs r0, #1
	b _0809C664
	.align 2, 0
_0809C640: .4byte 0x08264358
_0809C644:
	adds r0, r4, #0
	bl MetatileBehavior_IsMossdeepGymWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C65A
	bl sub_080AF178
	movs r0, #1
	b _0809C664
_0809C65A:
	bl DoWarp
	movs r0, #1
	b _0809C664
_0809C662:
	movs r0, #0
_0809C664:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryStartWarpEventScript

	thumb_func_start IsWarpMetatileBehavior
IsWarpMetatileBehavior: @ 0x0809C66C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsWarpDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	adds r0, r4, #0
	bl MetatileBehavior_IsLadder
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	adds r0, r4, #0
	bl MetatileBehavior_IsEscalator
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	adds r0, r4, #0
	bl MetatileBehavior_IsNonAnimDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	adds r0, r4, #0
	bl MetatileBehavior_IsLavaridgeB1FWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	adds r0, r4, #0
	bl MetatileBehavior_IsLavaridge1FWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	adds r0, r4, #0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	adds r0, r4, #0
	bl MetatileBehavior_IsMtPyreHole
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	adds r0, r4, #0
	bl MetatileBehavior_IsMossdeepGymWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	adds r0, r4, #0
	bl MetatileBehavior_IsWarpOrBridge
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809C702
	movs r0, #0
	b _0809C704
_0809C702:
	movs r0, #1
_0809C704:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsWarpMetatileBehavior

	thumb_func_start IsArrowWarpMetatileBehavior
IsArrowWarpMetatileBehavior: @ 0x0809C70C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r1, #0
	cmp r1, #2
	beq _0809C730
	cmp r1, #2
	bgt _0809C726
	cmp r1, #1
	beq _0809C73A
	b _0809C75C
_0809C726:
	cmp r2, #3
	beq _0809C744
	cmp r2, #4
	beq _0809C74E
	b _0809C75C
_0809C730:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsNorthArrowWarp
	b _0809C756
_0809C73A:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSouthArrowWarp
	b _0809C756
_0809C744:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsWestArrowWarp
	b _0809C756
_0809C74E:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsEastArrowWarp
_0809C756:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0809C75E
_0809C75C:
	movs r0, #0
_0809C75E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsArrowWarpMetatileBehavior

	thumb_func_start GetWarpEventAtMapPosition
GetWarpEventAtMapPosition: @ 0x0809C764
	push {lr}
	adds r3, r1, #0
	ldrh r1, [r3]
	subs r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r3, #2]
	subs r2, #7
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r3, [r3, #4]
	bl GetWarpEventAtPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetWarpEventAtMapPosition

	thumb_func_start SetupWarp
SetupWarp: @ 0x0809C788
	push {r4, r5, r6, r7, lr}
	adds r7, r2, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl GetCurrentTrainerHillMapId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	cmp r5, #0
	beq _0809C7D8
	bl sub_081D5E30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _0809C7C8
	lsls r0, r4, #0x18
	adds r4, r0, #0
	cmp r4, #0
	bne _0809C7C0
	ldr r0, _0809C7BC
	ldr r0, [r0, #4]
	ldr r5, [r0, #8]
	b _0809C7E6
	.align 2, 0
_0809C7BC: .4byte 0x02036FB8
_0809C7C0:
	bl sub_081D5ABC
	adds r5, r0, #0
	b _0809C7E6
_0809C7C8:
	cmp r6, #5
	bne _0809C7D8
	lsls r4, r4, #0x18
	lsrs r0, r4, #0x18
	bl sub_081D5AD0
	adds r5, r0, #0
	b _0809C7E6
_0809C7D8:
	ldr r0, _0809C7F4
	ldr r0, [r0, #4]
	lsls r2, r4, #0x18
	asrs r1, r2, #0x15
	ldr r0, [r0, #8]
	adds r5, r0, r1
	adds r4, r2, #0
_0809C7E6:
	ldrb r0, [r5, #6]
	cmp r0, #0x7f
	bne _0809C7F8
	ldrb r0, [r5, #5]
	bl SetWarpDestinationToDynamicWarp
	b _0809C846
	.align 2, 0
_0809C7F4: .4byte 0x02036FB8
_0809C7F8:
	movs r0, #7
	ldrsb r0, [r5, r0]
	movs r1, #6
	ldrsb r1, [r5, r1]
	movs r2, #5
	ldrsb r2, [r5, r2]
	bl SetWarpDestinationToMapWarp
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r2, #2
	ldrsh r1, [r7, r2]
	bl UpdateEscapeWarp
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #6]
	bl Overworld_GetMapHeaderByGroupAndId
	ldr r1, [r0, #4]
	ldrb r0, [r5, #5]
	ldr r1, [r1, #8]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #6]
	cmp r0, #0x7f
	bne _0809C846
	asrs r3, r4, #0x18
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	ldr r1, _0809C84C
	ldr r2, [r1]
	movs r1, #4
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #5]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl SetDynamicWarp
_0809C846:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C84C: .4byte 0x03005AEC
	thumb_func_end SetupWarp

	thumb_func_start TryDoorWarp
TryDoorWarp: @ 0x0809C850
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	adds r7, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #2
	bne _0809C8D4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsOpenSecretBaseDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C888
	ldr r0, _0809C884
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl WarpIntoSecretBase
	movs r0, #1
	b _0809C8D6
	.align 2, 0
_0809C884: .4byte 0x02036FB8
_0809C888:
	adds r0, r4, #0
	bl MetatileBehavior_IsWarpDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C8D4
	ldr r6, _0809C8D0
	adds r0, r6, #0
	adds r1, r5, #0
	bl GetWarpEventAtMapPosition
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0809C8D4
	adds r0, r7, #0
	bl IsWarpMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809C8D4
	bl StoreInitialPlayerAvatarState
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetupWarp
	bl DoDoorWarp
	movs r0, #1
	b _0809C8D6
	.align 2, 0
_0809C8D0: .4byte 0x02036FB8
_0809C8D4:
	movs r0, #0
_0809C8D6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end TryDoorWarp

	thumb_func_start GetWarpEventAtPosition
GetWarpEventAtPosition: @ 0x0809C8DC
	push {r4, r5, r6, lr}
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r0, [r0, #4]
	ldr r1, [r0, #8]
	ldrb r3, [r0, #1]
	movs r2, #0
	cmp r2, r3
	bge _0809C91A
_0809C8F6:
	ldrh r0, [r1]
	cmp r0, r6
	bne _0809C912
	ldrh r0, [r1, #2]
	cmp r0, r5
	bne _0809C912
	ldrb r0, [r1, #4]
	cmp r0, r4
	beq _0809C90C
	cmp r0, #0
	bne _0809C912
_0809C90C:
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	b _0809C91E
_0809C912:
	adds r2, #1
	adds r1, #8
	cmp r2, r3
	blt _0809C8F6
_0809C91A:
	movs r0, #1
	rsbs r0, r0, #0
_0809C91E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetWarpEventAtPosition

	thumb_func_start TryRunCoordEventScript
TryRunCoordEventScript: @ 0x0809C924
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _0809C95A
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _0809C93A
	ldrb r0, [r4, #6]
	bl DoCoordEventWeather
	b _0809C95A
_0809C93A:
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _0809C954
	ldrh r0, [r4, #6]
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r4, #8]
	cmp r0, r1
	bne _0809C95A
	ldr r0, [r4, #0xc]
	b _0809C95C
_0809C954:
	adds r0, r1, #0
	bl ScriptContext2_RunNewScript
_0809C95A:
	movs r0, #0
_0809C95C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryRunCoordEventScript

	thumb_func_start GetCoordEventScriptAtPosition
GetCoordEventScriptAtPosition: @ 0x0809C964
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xc]
	ldrb r7, [r0, #2]
	movs r6, #0
	cmp r6, r7
	bge _0809C9BA
	adds r5, r1, #0
	adds r4, r5, #0
_0809C990:
	ldrh r0, [r4]
	cmp r0, sl
	bne _0809C9B0
	ldrh r0, [r4, #2]
	cmp r0, sb
	bne _0809C9B0
	ldrb r0, [r4, #4]
	cmp r0, r8
	beq _0809C9A6
	cmp r0, #0
	bne _0809C9B0
_0809C9A6:
	adds r0, r5, #0
	bl TryRunCoordEventScript
	cmp r0, #0
	bne _0809C9BC
_0809C9B0:
	adds r4, #0x10
	adds r5, #0x10
	adds r6, #1
	cmp r6, r7
	blt _0809C990
_0809C9BA:
	movs r0, #0
_0809C9BC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetCoordEventScriptAtPosition

	thumb_func_start GetCoordEventScriptAtMapPosition
GetCoordEventScriptAtMapPosition: @ 0x0809C9CC
	push {r4, lr}
	ldr r4, _0809C9F0
	ldrh r1, [r0]
	subs r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r0, #2]
	subs r2, #7
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r3, [r0, #4]
	adds r0, r4, #0
	bl GetCoordEventScriptAtPosition
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809C9F0: .4byte 0x02036FB8
	thumb_func_end GetCoordEventScriptAtMapPosition

	thumb_func_start GetBackgroundEventAtPosition
GetBackgroundEventAtPosition: @ 0x0809C9F4
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, [r0, #4]
	ldr r4, [r0, #0x10]
	ldrb r3, [r0, #3]
	movs r2, #0
	cmp r2, r3
	bhs _0809CA3A
_0809CA0E:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r7
	bne _0809CA30
	ldrh r0, [r1, #2]
	cmp r0, r6
	bne _0809CA30
	ldrb r0, [r1, #4]
	cmp r0, r5
	beq _0809CA2C
	cmp r0, #0
	bne _0809CA30
_0809CA2C:
	adds r0, r1, #0
	b _0809CA3C
_0809CA30:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r3
	blo _0809CA0E
_0809CA3A:
	movs r0, #0
_0809CA3C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBackgroundEventAtPosition

	thumb_func_start dive_warp
dive_warp: @ 0x0809CA44
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _0809CA78
	ldrb r0, [r0, #0x17]
	cmp r0, #5
	bne _0809CA7C
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsUnableToEmerge
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809CA7C
	ldrh r0, [r4]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	subs r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SetDiveWarpEmerge
	b _0809CAA0
	.align 2, 0
_0809CA78: .4byte 0x02036FB8
_0809CA7C:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsDiveable
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809CAB8
	ldrh r0, [r4]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	subs r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SetDiveWarpDive
_0809CAA0:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CAB8
	bl StoreInitialPlayerAvatarState
	bl DoDiveWarp
	movs r0, #0xe9
	bl PlaySE
	movs r0, #1
	b _0809CABA
_0809CAB8:
	movs r0, #0
_0809CABA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end dive_warp

	thumb_func_start TrySetDiveWarp
TrySetDiveWarp: @ 0x0809CAC0
	push {r4, r5, lr}
	sub sp, #4
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
	lsrs r5, r0, #0x18
	ldr r0, _0809CB18
	ldrb r0, [r0, #0x17]
	cmp r0, #5
	bne _0809CB1C
	adds r0, r5, #0
	bl MetatileBehavior_IsUnableToEmerge
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809CB1C
	mov r0, sp
	ldrh r0, [r0]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4]
	subs r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SetDiveWarpEmerge
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809CB4C
	movs r0, #1
	b _0809CB4E
	.align 2, 0
_0809CB18: .4byte 0x02036FB8
_0809CB1C:
	adds r0, r5, #0
	bl MetatileBehavior_IsDiveable
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809CB4C
	mov r0, sp
	ldrh r0, [r0]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4]
	subs r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SetDiveWarpDive
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809CB4C
	movs r0, #2
	b _0809CB4E
_0809CB4C:
	movs r0, #0
_0809CB4E:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TrySetDiveWarp

	thumb_func_start GetEventObjectScriptPointerPlayerFacing
GetEventObjectScriptPointerPlayerFacing: @ 0x0809CB58
	push {r4, r5, lr}
	sub sp, #8
	bl GetPlayerMovementDirection
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r5, sp
	mov r0, sp
	bl GetInFrontOfPlayerPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, sp
	adds r2, r4, #0
	bl GetInteractedEventObjectScript
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetEventObjectScriptPointerPlayerFacing

	thumb_func_start SetCableClubWarp
SetCableClubWarp: @ 0x0809CB94
	push {r4, lr}
	sub sp, #8
	bl GetPlayerMovementDirection
	mov r4, sp
	mov r0, sp
	bl GetPlayerPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	ldr r4, _0809CBD4
	adds r0, r4, #0
	mov r1, sp
	bl GetWarpEventAtMapPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	mov r2, sp
	bl SetupWarp
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809CBD4: .4byte 0x02036FB8
	thumb_func_end SetCableClubWarp

