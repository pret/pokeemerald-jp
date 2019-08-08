.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearSecretBase
ClearSecretBase: @ 0x080E977C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r2, _080E97B0
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	movs r2, #0
	adds r4, #2
	movs r3, #0xff
_080E9796:
	adds r0, r4, r2
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #6
	bls _080E9796
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E97B0: .4byte 0x01000028
	thumb_func_end ClearSecretBase

	thumb_func_start ClearSecretBases
ClearSecretBases: @ 0x080E97B4
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _080E97DC
_080E97BA:
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #5
	ldr r0, _080E97E0
	adds r1, r1, r0
	ldr r0, [r5]
	adds r0, r0, r1
	bl ClearSecretBase
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _080E97BA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E97DC: .4byte 0x03005AEC
_080E97E0: .4byte 0x00001A9C
	thumb_func_end ClearSecretBases

	thumb_func_start SetCurSecretBaseId
SetCurSecretBaseId: @ 0x080E97E4
	ldr r0, _080E97F0
	ldr r1, _080E97F4
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_080E97F0: .4byte 0x02039CE8
_080E97F4: .4byte 0x02037280
	thumb_func_end SetCurSecretBaseId

	thumb_func_start TrySetCurSecretBaseIndex
TrySetCurSecretBaseIndex: @ 0x080E97F8
	push {r4, lr}
	ldr r0, _080E9808
	movs r1, #0
	strh r1, [r0]
	movs r3, #0
	adds r4, r0, #0
	b _080E9812
	.align 2, 0
_080E9808: .4byte 0x02037290
_080E980C:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080E9812:
	cmp r3, #0x13
	bhi _080E983C
	ldr r2, _080E9844
	ldr r0, _080E9848
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r0, _080E984C
	adds r1, r1, r0
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080E980C
	movs r0, #1
	strh r0, [r4]
	ldr r0, _080E9850
	adds r1, r3, #0
	bl VarSet
_080E983C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9844: .4byte 0x02039CE8
_080E9848: .4byte 0x03005AEC
_080E984C: .4byte 0x00001A9C
_080E9850: .4byte 0x00004054
	thumb_func_end TrySetCurSecretBaseIndex

	thumb_func_start CheckPlayerHasSecretBase
CheckPlayerHasSecretBase: @ 0x080E9854
	push {lr}
	ldr r0, _080E986C
	ldr r0, [r0]
	ldr r1, _080E9870
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _080E9878
	ldr r1, _080E9874
	movs r0, #1
	strh r0, [r1]
	b _080E987C
	.align 2, 0
_080E986C: .4byte 0x03005AEC
_080E9870: .4byte 0x00001A9C
_080E9874: .4byte 0x02037290
_080E9878:
	ldr r0, _080E9880
	strh r1, [r0]
_080E987C:
	pop {r0}
	bx r0
	.align 2, 0
_080E9880: .4byte 0x02037290
	thumb_func_end CheckPlayerHasSecretBase

	thumb_func_start GetSecretBaseTypeInFrontOfPlayer_
GetSecretBaseTypeInFrontOfPlayer_: @ 0x080E9884
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, #0
	ldr r2, _080E98BC
	adds r0, r2, #0
	ands r1, r0
	adds r0, r1, #0
	subs r0, #0x90
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080E98C0
	movs r0, #1
	b _080E991A
	.align 2, 0
_080E98BC: .4byte 0x00000FFF
_080E98C0:
	adds r0, r1, #0
	subs r0, #0x92
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080E98D0
	movs r0, #2
	b _080E991A
_080E98D0:
	adds r0, r1, #0
	subs r0, #0x9a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080E98E0
	movs r0, #3
	b _080E991A
_080E98E0:
	adds r0, r1, #0
	subs r0, #0x94
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080E98F0
	movs r0, #4
	b _080E991A
_080E98F0:
	adds r0, r1, #0
	subs r0, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080E9904
	cmp r1, #0x9c
	beq _080E9904
	cmp r1, #0x9d
	bne _080E9908
_080E9904:
	movs r0, #5
	b _080E991A
_080E9908:
	adds r0, r1, #0
	subs r0, #0x98
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080E9918
	movs r0, #0
	b _080E991A
_080E9918:
	movs r0, #6
_080E991A:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetSecretBaseTypeInFrontOfPlayer_

	thumb_func_start GetSecretBaseTypeInFrontOfPlayer
GetSecretBaseTypeInFrontOfPlayer: @ 0x080E9924
	push {r4, lr}
	ldr r4, _080E9938
	bl GetSecretBaseTypeInFrontOfPlayer_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9938: .4byte 0x02037286
	thumb_func_end GetSecretBaseTypeInFrontOfPlayer

	thumb_func_start FindMetatileIdMapCoords
FindMetatileIdMapCoords: @ 0x080E993C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	ldr r0, _080E99A0
	ldr r0, [r0]
	mov r8, r0
	movs r0, #0
	mov ip, r0
	mov r1, r8
	ldr r0, [r1, #4]
	cmp ip, r0
	bge _080E99C8
	ldr r4, [r1]
_080E9966:
	movs r2, #0
	mov r0, ip
	lsls r7, r0, #0x10
	cmp r2, r4
	bge _080E99B4
	asrs r0, r7, #0x10
	adds r6, r0, #0
	muls r6, r4, r6
	mov r1, r8
	ldr r5, [r1, #0xc]
	ldr r0, _080E99A4
	mov sb, r0
_080E997E:
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	mov r0, sb
	ands r0, r1
	cmp r0, sl
	bne _080E99A8
	ldr r1, [sp]
	strh r2, [r1]
	mov r0, ip
	ldr r2, [sp, #4]
	strh r0, [r2]
	b _080E99C8
	.align 2, 0
_080E99A0: .4byte 0x02036FB8
_080E99A4: .4byte 0x000003FF
_080E99A8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	blt _080E997E
_080E99B4:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r1, r7, r2
	lsrs r0, r1, #0x10
	mov ip, r0
	asrs r1, r1, #0x10
	mov r2, r8
	ldr r0, [r2, #4]
	cmp r1, r0
	blt _080E9966
_080E99C8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end FindMetatileIdMapCoords

	thumb_func_start ToggleSecretBaseEntranceMetatile
ToggleSecretBaseEntranceMetatile: @ 0x080E99D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	movs r5, #0
	mov ip, r4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	ldr r1, _080E9A24
	mov r8, r1
	adds r7, r0, #0
	mov r4, sp
	mov r6, ip
_080E9A0C:
	ldr r0, _080E9A24
	lsls r1, r5, #2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r3
	bne _080E9A28
	movs r3, #0
	ldrsh r0, [r4, r3]
	movs r5, #0
	ldrsh r1, [r6, r5]
	ldrh r3, [r2, #2]
	b _080E9A50
	.align 2, 0
_080E9A24: .4byte 0x08568A78
_080E9A28:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #6
	bls _080E9A0C
	movs r5, #0
	mov r4, sp
	mov r6, ip
_080E9A38:
	lsls r0, r5, #2
	mov r1, r8
	adds r3, r0, r1
	ldrh r1, [r3, #2]
	asrs r0, r7, #0x10
	cmp r1, r0
	bne _080E9A6A
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r5, #0
	ldrsh r1, [r6, r5]
	ldrh r3, [r3]
_080E9A50:
	movs r5, #0xc0
	lsls r5, r5, #4
	adds r2, r5, #0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl CurrentMapDrawMetatileAt
	b _080E9A74
_080E9A6A:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #6
	bls _080E9A38
_080E9A74:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ToggleSecretBaseEntranceMetatile

	thumb_func_start GetNameLength
GetNameLength: @ 0x080E9A80
	push {lr}
	adds r2, r0, #0
	movs r1, #0
_080E9A86:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080E9A92
	adds r0, r1, #0
	b _080E9A9E
_080E9A92:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #6
	bls _080E9A86
	movs r0, #7
_080E9A9E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetNameLength

	thumb_func_start SetPlayerSecretBase
SetPlayerSecretBase: @ 0x080E9AA4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r2, _080E9B40
	ldr r0, [r2]
	ldr r1, _080E9B44
	ldrb r1, [r1]
	ldr r3, _080E9B48
	adds r0, r0, r3
	strb r1, [r0]
	movs r3, #0
	ldr r5, _080E9B4C
	ldr r4, _080E9B50
_080E9ABE:
	ldr r1, [r2]
	adds r1, r1, r5
	adds r1, r1, r3
	ldr r0, [r4]
	adds r0, #0xa
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bls _080E9ABE
	ldr r0, _080E9B54
	movs r1, #0
	bl VarSet
	ldr r6, _080E9B40
	ldr r4, [r6]
	ldr r0, _080E9B58
	adds r4, r4, r0
	ldr r1, _080E9B50
	mov r8, r1
	ldr r5, [r1]
	adds r0, r5, #0
	bl GetNameLength
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl StringCopyN
	ldr r3, [r6]
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	ldr r1, _080E9B5C
	adds r3, r3, r1
	movs r4, #1
	adds r1, r4, #0
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldr r0, [r6]
	ldr r3, _080E9B60
	adds r0, r0, r3
	strb r4, [r0]
	ldr r0, _080E9B64
	ldr r1, _080E9B68
	ldrb r1, [r1, #0x14]
	bl VarSet
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9B40: .4byte 0x03005AEC
_080E9B44: .4byte 0x02039CE8
_080E9B48: .4byte 0x00001A9C
_080E9B4C: .4byte 0x00001AA5
_080E9B50: .4byte 0x03005AF0
_080E9B54: .4byte 0x00004054
_080E9B58: .4byte 0x00001A9E
_080E9B5C: .4byte 0x00001A9D
_080E9B60: .4byte 0x00001AA9
_080E9B64: .4byte 0x00004026
_080E9B68: .4byte 0x02036FB8
	thumb_func_end SetPlayerSecretBase

	thumb_func_start SetOccupiedSecretBaseEntranceMetatiles
SetOccupiedSecretBaseEntranceMetatiles: @ 0x080E9B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	movs r5, #0
	b _080E9C16
_080E9B7A:
	mov r0, r8
	ldr r1, [r0, #0x10]
	lsls r2, r5, #1
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	adds r6, r1, #0
	adds r1, r5, #1
	mov sb, r1
	cmp r0, #8
	bne _080E9C0E
	movs r4, #0
	ldr r7, _080E9BEC
_080E9B96:
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r0, _080E9BF0
	adds r1, r1, r0
	ldrb r1, [r1]
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r3, r0, r6
	ldr r0, [r3, #8]
	cmp r1, r0
	bne _080E9C04
	ldrh r5, [r3]
	adds r5, #7
	ldrh r4, [r3, #2]
	adds r4, #7
	lsls r5, r5, #0x10
	asrs r0, r5, #0x10
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	bl MapGridGetMetatileIdAt
	movs r3, #0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r6, _080E9BF4
_080E9BCE:
	lsls r0, r3, #2
	adds r2, r0, r6
	ldrh r0, [r2]
	cmp r0, r1
	bne _080E9BF8
	ldrh r0, [r2, #2]
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r2, r1, #0
	orrs r2, r0
	asrs r0, r5, #0x10
	asrs r1, r4, #0x10
	bl MapGridSetMetatileIdAt
	b _080E9C0E
	.align 2, 0
_080E9BEC: .4byte 0x03005AEC
_080E9BF0: .4byte 0x00001A9C
_080E9BF4: .4byte 0x08568A78
_080E9BF8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #6
	bls _080E9BCE
	b _080E9C0E
_080E9C04:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _080E9B96
_080E9C0E:
	mov r1, sb
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
_080E9C16:
	ldrb r0, [r0, #3]
	cmp r5, r0
	blo _080E9B7A
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SetOccupiedSecretBaseEntranceMetatiles

	thumb_func_start SetSecretBaseWarpDestination
SetSecretBaseWarpDestination: @ 0x080E9C28
	push {lr}
	ldr r0, _080E9C54
	ldrb r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	ldr r2, _080E9C58
	lsls r0, r0, #0x1a
	asrs r0, r0, #0x18
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r0, #0x19
	bl SetWarpDestinationToMapWarp
	pop {r0}
	bx r0
	.align 2, 0
_080E9C54: .4byte 0x02039CE8
_080E9C58: .4byte 0x08568A94
	thumb_func_end SetSecretBaseWarpDestination

	thumb_func_start Task_EnterSecretBase
Task_EnterSecretBase: @ 0x080E9C5C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080E9C7C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r1, #8
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _080E9C80
	cmp r0, #1
	beq _080E9C98
	b _080E9CD6
	.align 2, 0
_080E9C7C: .4byte 0x03005B60
_080E9C80:
	ldr r0, _080E9C94
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080E9CD6
	movs r0, #1
	strh r0, [r2, #8]
	b _080E9CD6
	.align 2, 0
_080E9C94: .4byte 0x02037C74
_080E9C98:
	ldr r0, _080E9CDC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080E9CE0
	ldr r2, [r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r2, r2, r1
	ldr r0, _080E9CE4
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0xfe
	bhi _080E9CBC
	adds r0, #1
	strb r0, [r2]
_080E9CBC:
	bl SetSecretBaseWarpDestination
	bl WarpIntoMap
	ldr r0, _080E9CE8
	ldr r1, _080E9CEC
	str r1, [r0]
	ldr r0, _080E9CF0
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_080E9CD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9CDC: .4byte 0x00004054
_080E9CE0: .4byte 0x03005AEC
_080E9CE4: .4byte 0x00001AAC
_080E9CE8: .4byte 0x03005B0C
_080E9CEC: .4byte 0x080AEA65
_080E9CF0: .4byte 0x08085935
	thumb_func_end Task_EnterSecretBase

	thumb_func_start EnterSecretBase
EnterSecretBase: @ 0x080E9CF4
	push {lr}
	ldr r0, _080E9D20
	movs r1, #0
	bl CreateTask
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r0, _080E9D24
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	pop {r0}
	bx r0
	.align 2, 0
_080E9D20: .4byte 0x080E9C5D
_080E9D24: .4byte 0x03005AEC
	thumb_func_end EnterSecretBase

	thumb_func_start SecretBaseMapPopupEnabled
SecretBaseMapPopupEnabled: @ 0x080E9D28
	push {lr}
	ldr r0, _080E9D44
	ldrb r0, [r0, #0x17]
	cmp r0, #9
	bne _080E9D4C
	ldr r0, _080E9D48
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080E9D4C
	movs r0, #0
	b _080E9D4E
	.align 2, 0
_080E9D44: .4byte 0x02036FB8
_080E9D48: .4byte 0x00004097
_080E9D4C:
	movs r0, #1
_080E9D4E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SecretBaseMapPopupEnabled

	thumb_func_start EnterNewlyCreatedSecretBase_WaitFadeIn
EnterNewlyCreatedSecretBase_WaitFadeIn: @ 0x080E9D54
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080E9D8C
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E9D90
	adds r0, r0, r1
	movs r1, #2
	bl EventObjectTurn
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E9D84
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
_080E9D84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9D8C: .4byte 0x02037230
_080E9D90: .4byte 0x02036FF0
	thumb_func_end EnterNewlyCreatedSecretBase_WaitFadeIn

	thumb_func_start EnterNewlyCreatedSecretBase_StartFadeIn
EnterNewlyCreatedSecretBase_StartFadeIn: @ 0x080E9D94
	push {r4, lr}
	sub sp, #4
	bl ScriptContext2_Enable
	bl HideMapNamePopUpWindow
	mov r4, sp
	adds r4, #2
	movs r2, #0x88
	lsls r2, r2, #2
	mov r0, sp
	adds r1, r4, #0
	bl FindMetatileIdMapCoords
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #7
	strh r0, [r1]
	ldrh r0, [r4]
	adds r0, #7
	strh r0, [r4]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0xe2
	lsls r2, r2, #4
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	bl pal_fill_black
	ldr r0, _080E9DF4
	movs r1, #0
	bl CreateTask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9DF4: .4byte 0x080E9D55
	thumb_func_end EnterNewlyCreatedSecretBase_StartFadeIn

	thumb_func_start Task_EnterNewlyCreatedSecretBase
Task_EnterNewlyCreatedSecretBase: @ 0x080E9DF8
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080E9E68
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080E9E60
	ldr r0, _080E9E6C
	ldrb r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	ldr r1, _080E9E70
	ldr r1, [r1]
	movs r5, #4
	ldrsb r5, [r1, r5]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	ldr r4, _080E9E74
	lsls r0, r0, #0x1a
	asrs r0, r0, #0x18
	adds r3, r0, #2
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r0, #3
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	bl SetWarpDestination
	bl WarpIntoMap
	ldr r1, _080E9E78
	ldr r0, _080E9E7C
	str r0, [r1]
	ldr r0, _080E9E80
	bl SetMainCallback2
	adds r0, r6, #0
	bl DestroyTask
_080E9E60:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9E68: .4byte 0x02037C74
_080E9E6C: .4byte 0x02039CE8
_080E9E70: .4byte 0x03005AEC
_080E9E74: .4byte 0x08568A94
_080E9E78: .4byte 0x03005B0C
_080E9E7C: .4byte 0x080E9D95
_080E9E80: .4byte 0x08085935
	thumb_func_end Task_EnterNewlyCreatedSecretBase

	thumb_func_start EnterNewlyCreatedSecretBase
EnterNewlyCreatedSecretBase: @ 0x080E9E84
	push {lr}
	ldr r0, _080E9E9C
	movs r1, #0
	bl CreateTask
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	pop {r0}
	bx r0
	.align 2, 0
_080E9E9C: .4byte 0x080E9DF9
	thumb_func_end EnterNewlyCreatedSecretBase

	thumb_func_start CurMapIsSecretBase
CurMapIsSecretBase: @ 0x080E9EA0
	push {lr}
	ldr r0, _080E9EB8
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #0x19
	bne _080E9EBC
	ldrb r0, [r1, #5]
	cmp r0, #0x17
	bhi _080E9EBC
	movs r0, #1
	b _080E9EBE
	.align 2, 0
_080E9EB8: .4byte 0x03005AEC
_080E9EBC:
	movs r0, #0
_080E9EBE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CurMapIsSecretBase

	thumb_func_start InitSecretBaseAppearance
InitSecretBaseAppearance: @ 0x080E9EC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	bl CurMapIsSecretBase
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E9FBC
	ldr r0, _080E9F74
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _080E9F78
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #5
	ldr r2, _080E9F7C
	adds r0, r0, r2
	ldr r1, [r1]
	adds r1, r1, r0
	adds r7, r1, #0
	adds r7, #0x12
	adds r6, r1, #0
	adds r6, #0x22
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	mov r4, sp
	ldr r0, _080E9F80
	mov r8, r0
_080E9F0C:
	ldrh r1, [r4]
	adds r2, r7, r1
	ldrb r0, [r2]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x77
	bhi _080E9F40
	ldrb r3, [r2]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0, #0xc]
	cmp r0, #4
	beq _080E9F40
	adds r0, r6, r1
	ldrb r2, [r0]
	lsrs r0, r2, #4
	adds r0, #7
	movs r1, #0xf
	ands r1, r2
	adds r1, #7
	adds r2, r3, #0
	bl ShowDecorationOnMap
_080E9F40:
	ldrh r0, [r4]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r4]
	cmp r0, #0xf
	bls _080E9F0C
	cmp r5, #0
	beq _080E9F88
	mov r4, sp
	adds r4, #2
	movs r2, #0x88
	lsls r2, r2, #2
	mov r0, sp
	adds r1, r4, #0
	bl FindMetatileIdMapCoords
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #7
	ldrh r1, [r4]
	adds r1, #7
	ldr r2, _080E9F84
	bl MapGridSetMetatileIdAt
	b _080E9FBC
	.align 2, 0
_080E9F74: .4byte 0x00004054
_080E9F78: .4byte 0x03005AEC
_080E9F7C: .4byte 0x00001A9C
_080E9F80: .4byte 0x08580CD0
_080E9F84: .4byte 0x00000E21
_080E9F88:
	mov r2, sb
	cmp r2, #1
	bne _080E9FBC
	ldr r0, _080E9FCC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _080E9FBC
	mov r4, sp
	adds r4, #2
	movs r2, #0x88
	lsls r2, r2, #2
	mov r0, sp
	adds r1, r4, #0
	bl FindMetatileIdMapCoords
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #7
	ldrh r1, [r4]
	adds r1, #7
	ldr r2, _080E9FD0
	bl MapGridSetMetatileIdAt
_080E9FBC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9FCC: .4byte 0x00004089
_080E9FD0: .4byte 0x00000E0A
	thumb_func_end InitSecretBaseAppearance

	thumb_func_start InitSecretBaseDecorationSprites
InitSecretBaseDecorationSprites: @ 0x080E9FD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	bl CurMapIsSecretBase
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080EA00C
	ldr r0, _080EA000
	ldr r0, [r0]
	ldr r1, _080EA004
	adds r1, r0, r1
	str r1, [sp, #4]
	ldr r2, _080EA008
	adds r2, r0, r2
	str r2, [sp, #8]
	movs r3, #0xc
	str r3, [sp, #0x10]
	b _080EA034
	.align 2, 0
_080EA000: .4byte 0x03005AEC
_080EA004: .4byte 0x0000271C
_080EA008: .4byte 0x00002728
_080EA00C:
	ldr r0, _080EA038
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080EA03C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r4, _080EA040
	adds r1, r1, r4
	ldr r0, [r2]
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0x12
	str r1, [sp, #4]
	adds r0, #0x22
	str r0, [sp, #8]
	movs r2, #0x10
	str r2, [sp, #0x10]
_080EA034:
	movs r6, #0
	b _080EA1FA
	.align 2, 0
_080EA038: .4byte 0x00004054
_080EA03C: .4byte 0x03005AEC
_080EA040: .4byte 0x00001A9C
_080EA044:
	ldr r4, [sp, #4]
	adds r0, r4, r6
	ldrb r1, [r0]
	mov sl, r0
	adds r0, r6, #1
	str r0, [sp, #0x14]
	cmp r1, #0
	bne _080EA056
	b _080EA1F4
_080EA056:
	mov r1, sl
	ldrb r0, [r1]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _080EA1B0
	adds r1, r1, r2
	ldrb r0, [r1, #0xc]
	ldrb r1, [r1, #0xe]
	str r1, [sp, #0xc]
	cmp r0, #4
	beq _080EA070
	b _080EA1F4
_080EA070:
	movs r5, #0
	ldr r0, _080EA1B4
	ldr r3, [r0, #4]
	ldrb r4, [r3]
	mov sb, r0
	cmp r5, r4
	bhs _080EA0AE
	ldr r0, [r3, #4]
	ldrh r2, [r0, #0x14]
	ldr r1, _080EA1B8
	ldrh r0, [r1]
	adds r0, #0xae
	adds r7, r1, #0
	cmp r2, r0
	beq _080EA0AE
	adds r2, r4, #0
_080EA090:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r2
	bhs _080EA0AE
	ldr r1, [r3, #4]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x14]
	ldrh r0, [r7]
	adds r0, #0xae
	cmp r1, r0
	bne _080EA090
_080EA0AE:
	mov r3, sb
	ldr r0, [r3, #4]
	ldrb r0, [r0]
	cmp r5, r0
	bne _080EA0BA
	b _080EA1F4
_080EA0BA:
	ldr r4, _080EA1BC
	mov r8, r4
	ldr r0, [sp, #8]
	adds r1, r0, r6
	ldrb r0, [r1]
	lsrs r0, r0, #4
	strh r0, [r4]
	ldr r7, _080EA1C0
	ldrb r1, [r1]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r7]
	ldrh r0, [r4]
	adds r0, #7
	ldrh r1, [r7]
	adds r1, #7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_HoldsSmallDecoration
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EA0FE
	adds r0, r4, #0
	bl MetatileBehavior_HoldsLargeDecoration
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EA1F4
_080EA0FE:
	ldr r6, _080EA1C4
	mov r1, sb
	ldr r0, [r1, #4]
	ldr r1, [r0, #4]
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r1, r4, r1
	ldr r2, _080EA1C8
	adds r0, r2, #0
	ldrb r1, [r1, #1]
	adds r0, r0, r1
	strh r0, [r6]
	ldrh r0, [r6]
	mov r3, sl
	ldrb r2, [r3]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _080EA1CC
	adds r1, r1, r2
	ldr r1, [r1]
	ldrh r1, [r1]
	bl VarSet
	mov r3, sb
	ldr r0, [r3, #4]
	ldr r0, [r0, #4]
	adds r4, r4, r0
	ldrb r0, [r4]
	strh r0, [r6]
	ldr r0, _080EA1B8
	ldrh r0, [r0]
	adds r0, #0xae
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagClear
	ldrb r0, [r6]
	ldr r5, _080EA1D0
	ldr r2, [r5]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl TrySpawnEventObject
	ldrb r0, [r6]
	ldr r2, [r5]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	mov r4, r8
	movs r3, #0
	ldrsh r4, [r4, r3]
	mov r8, r4
	movs r4, #0
	ldrsh r7, [r7, r4]
	str r7, [sp]
	mov r3, r8
	bl TryMoveEventObjectToMapCoords
	ldrb r0, [r6]
	ldr r2, [r5]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl TryOverrideEventObjectTemplateCoords
	bl CurMapIsSecretBase
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EA1EC
	ldr r0, _080EA1D4
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EA1EC
	ldr r0, [sp, #0xc]
	cmp r0, #6
	bne _080EA1D8
	ldrb r0, [r6]
	ldr r2, [r5]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	movs r3, #6
	bl OverrideSecretBaseDecorationSpriteScript
	b _080EA1EC
	.align 2, 0
_080EA1B0: .4byte 0x08580CD0
_080EA1B4: .4byte 0x02036FB8
_080EA1B8: .4byte 0x02037280
_080EA1BC: .4byte 0x02037284
_080EA1C0: .4byte 0x02037286
_080EA1C4: .4byte 0x02037290
_080EA1C8: .4byte 0x00003F20
_080EA1CC: .4byte 0x08580CE8
_080EA1D0: .4byte 0x03005AEC
_080EA1D4: .4byte 0x00004054
_080EA1D8:
	ldr r1, [sp, #0xc]
	cmp r1, #7
	bne _080EA1EC
	ldrb r0, [r6]
	ldr r2, [r5]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	movs r3, #7
	bl OverrideSecretBaseDecorationSpriteScript
_080EA1EC:
	ldr r1, _080EA214
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080EA1F4:
	ldr r2, [sp, #0x14]
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
_080EA1FA:
	ldr r3, [sp, #0x10]
	cmp r6, r3
	bhs _080EA202
	b _080EA044
_080EA202:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA214: .4byte 0x02037280
	thumb_func_end InitSecretBaseDecorationSprites

	thumb_func_start HideSecretBaseDecorationSprites
HideSecretBaseDecorationSprites: @ 0x080EA218
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r1, _080EA26C
	ldr r0, [r1, #4]
	ldrb r0, [r0]
	cmp r5, r0
	bhs _080EA264
	adds r6, r1, #0
_080EA228:
	ldr r0, [r6, #4]
	ldr r1, [r0, #4]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r4, [r1, #0x14]
	adds r0, r4, #0
	subs r0, #0xae
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xd
	bhi _080EA256
	ldrb r0, [r1]
	ldr r1, _080EA270
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl RemoveEventObjectByLocalIdAndMap
	adds r0, r4, #0
	bl FlagSet
_080EA256:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r6, #4]
	ldrb r0, [r0]
	cmp r5, r0
	blo _080EA228
_080EA264:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA26C: .4byte 0x02036FB8
_080EA270: .4byte 0x03005AEC
	thumb_func_end HideSecretBaseDecorationSprites

	thumb_func_start SetSecretBaseOwnerGfxId
SetSecretBaseOwnerGfxId: @ 0x080EA274
	push {r4, r5, lr}
	ldr r5, _080EA29C
	ldr r4, _080EA2A0
	ldr r0, _080EA2A4
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetSecretBaseOwnerType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r1, [r0]
	adds r0, r5, #0
	bl VarSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA29C: .4byte 0x0000401F
_080EA2A0: .4byte 0x08568B0C
_080EA2A4: .4byte 0x00004054
	thumb_func_end SetSecretBaseOwnerGfxId

	thumb_func_start SetCurSecretBaseIdFromPosition
SetCurSecretBaseIdFromPosition: @ 0x080EA2A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0
	ldrb r0, [r4, #3]
	cmp r3, r0
	bge _080EA300
	ldr r6, _080EA2EC
_080EA2B8:
	lsls r3, r3, #0x10
	asrs r1, r3, #0x10
	ldr r2, [r4, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2, #5]
	cmp r0, #8
	bne _080EA2F0
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldrh r0, [r2]
	adds r0, #7
	cmp r1, r0
	bne _080EA2F0
	movs r0, #2
	ldrsh r1, [r5, r0]
	ldrh r0, [r2, #2]
	adds r0, #7
	cmp r1, r0
	bne _080EA2F0
	ldr r0, [r2, #8]
	strb r0, [r6]
	b _080EA300
	.align 2, 0
_080EA2EC: .4byte 0x02039CE8
_080EA2F0:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r4, #3]
	cmp r0, r1
	blt _080EA2B8
_080EA300:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetCurSecretBaseIdFromPosition

	thumb_func_start WarpIntoSecretBase
WarpIntoSecretBase: @ 0x080EA308
	push {lr}
	bl SetCurSecretBaseIdFromPosition
	bl TrySetCurSecretBaseIndex
	ldr r0, _080EA31C
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080EA31C: .4byte 0x08245C66
	thumb_func_end WarpIntoSecretBase

	thumb_func_start TrySetCurSecretBase
TrySetCurSecretBase: @ 0x080EA320
	push {lr}
	bl SetCurSecretBaseId
	bl TrySetCurSecretBaseIndex
	ldr r0, _080EA338
	ldrh r0, [r0]
	cmp r0, #1
	beq _080EA33C
	movs r0, #1
	b _080EA33E
	.align 2, 0
_080EA338: .4byte 0x02037290
_080EA33C:
	movs r0, #0
_080EA33E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TrySetCurSecretBase

	thumb_func_start Task_WarpOutOfSecretBase
Task_WarpOutOfSecretBase: @ 0x080EA344
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080EA368
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080EA37C
	cmp r0, #1
	bgt _080EA36C
	cmp r0, #0
	beq _080EA372
	b _080EA3B4
	.align 2, 0
_080EA368: .4byte 0x03005B60
_080EA36C:
	cmp r0, #2
	beq _080EA394
	b _080EA3B4
_080EA372:
	bl ScriptContext2_Enable
	movs r0, #1
	strh r0, [r4, #8]
	b _080EA3B4
_080EA37C:
	ldr r0, _080EA390
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080EA3B4
	movs r0, #2
	strh r0, [r4, #8]
	b _080EA3B4
	.align 2, 0
_080EA390: .4byte 0x02037C74
_080EA394:
	movs r0, #0x7e
	bl SetWarpDestinationToDynamicWarp
	bl WarpIntoMap
	ldr r0, _080EA3BC
	ldr r1, _080EA3C0
	str r1, [r0]
	ldr r0, _080EA3C4
	bl SetMainCallback2
	bl ScriptContext2_Disable
	adds r0, r5, #0
	bl DestroyTask
_080EA3B4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA3BC: .4byte 0x03005B0C
_080EA3C0: .4byte 0x080AEC95
_080EA3C4: .4byte 0x08085935
	thumb_func_end Task_WarpOutOfSecretBase

	thumb_func_start WarpOutOfSecretBase
WarpOutOfSecretBase: @ 0x080EA3C8
	push {lr}
	ldr r0, _080EA3E0
	movs r1, #0
	bl CreateTask
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	pop {r0}
	bx r0
	.align 2, 0
_080EA3E0: .4byte 0x080EA345
	thumb_func_end WarpOutOfSecretBase

	thumb_func_start IsCurSecretBaseOwnedByAnotherPlayer
IsCurSecretBaseOwnedByAnotherPlayer: @ 0x080EA3E4
	push {lr}
	ldr r0, _080EA400
	ldr r0, [r0]
	ldr r1, _080EA404
	adds r0, r0, r1
	ldr r1, _080EA408
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080EA410
	ldr r1, _080EA40C
	movs r0, #1
	b _080EA414
	.align 2, 0
_080EA400: .4byte 0x03005AEC
_080EA404: .4byte 0x00001A9C
_080EA408: .4byte 0x02039CE8
_080EA40C: .4byte 0x02037290
_080EA410:
	ldr r1, _080EA41C
	movs r0, #0
_080EA414:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080EA41C: .4byte 0x02037290
	thumb_func_end IsCurSecretBaseOwnedByAnotherPlayer

	thumb_func_start GetSecretBaseMapName
GetSecretBaseMapName: @ 0x080EA420
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080EA460
	lsls r4, r1, #2
	adds r4, r4, r1
	lsls r4, r4, #5
	ldr r0, [r0]
	adds r4, r4, r0
	ldr r0, _080EA464
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetNameLength
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl StringCopyN
	movs r1, #0xff
	strb r1, [r0]
	ldr r1, _080EA468
	adds r0, r5, #0
	bl StringAppend
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080EA460: .4byte 0x03005AEC
_080EA464: .4byte 0x00001A9E
_080EA468: .4byte 0x085CA654
	thumb_func_end GetSecretBaseMapName

	thumb_func_start RegistryMenu_OnCursorMove
RegistryMenu_OnCursorMove: @ 0x080EA46C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080EA488
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl GetSecretBaseMapName
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EA488: .4byte 0x00004054
	thumb_func_end RegistryMenu_OnCursorMove

	thumb_func_start DeleteRegistry_Yes
DeleteRegistry_Yes: @ 0x080EA48C
	push {r4, r5, lr}
	ldr r0, _080EA4C8
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080EA4CC
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #5
	ldr r0, [r1]
	adds r4, r4, r0
	ldr r0, _080EA4D0
	adds r4, r4, r0
	ldr r5, _080EA4D4
	adds r0, r4, #0
	bl GetNameLength
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl StringCopyN
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA4C8: .4byte 0x00004054
_080EA4CC: .4byte 0x03005AEC
_080EA4D0: .4byte 0x00001A9E
_080EA4D4: .4byte 0x02021C40
	thumb_func_end DeleteRegistry_Yes

	thumb_func_start IsSecretBaseRegistered
IsSecretBaseRegistered: @ 0x080EA4D8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080EA4FC
	ldr r2, [r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r2, r2, r1
	ldr r0, _080EA500
	adds r2, r2, r0
	ldrb r0, [r2]
	lsrs r0, r0, #6
	cmp r0, #0
	bne _080EA504
	movs r0, #0
	b _080EA506
	.align 2, 0
_080EA4FC: .4byte 0x03005AEC
_080EA500: .4byte 0x00001A9D
_080EA504:
	movs r0, #1
_080EA506:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsSecretBaseRegistered

	thumb_func_start GetAverageEVs
GetAverageEVs: @ 0x080EA50C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x1a
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x1b
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x1c
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x1d
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x1e
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x1f
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #6
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetAverageEVs

	thumb_func_start SetPlayerSecretBaseParty
SetPlayerSecretBaseParty: @ 0x080EA574
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	mov sl, r0
	ldr r0, _080EA6D0
	ldr r1, [r0]
	ldr r2, _080EA6D4
	adds r2, r1, r2
	str r2, [sp]
	ldr r3, _080EA6D8
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080EA59A
	b _080EA6C0
_080EA59A:
	movs r6, #0
	ldr r7, _080EA6DC
	adds r7, r1, r7
	str r7, [sp, #0x14]
	ldr r0, _080EA6E0
	adds r0, r1, r0
	str r0, [sp, #0xc]
	ldr r2, _080EA6E4
	adds r2, r1, r2
	str r2, [sp, #0x10]
	adds r3, #0x94
	adds r3, r1, r3
	str r3, [sp, #0x18]
	ldr r7, _080EA6E8
	adds r7, r1, r7
	str r7, [sp, #0x1c]
	mov sb, r6
_080EA5BC:
	movs r4, #0
	lsls r5, r6, #2
	lsls r3, r6, #1
	ldr r0, _080EA6EC
	mov r8, r0
	adds r1, r6, #1
	str r1, [sp, #4]
	adds r2, r5, #0
	ldr r1, [sp, #0x14]
_080EA5CE:
	adds r0, r2, r4
	lsls r0, r0, #1
	adds r0, r1, r0
	mov r7, sb
	strh r7, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _080EA5CE
	ldr r1, [sp, #0xc]
	adds r0, r1, r3
	mov r2, sb
	strh r2, [r0]
	ldr r7, [sp, #0x10]
	adds r0, r7, r3
	strh r2, [r0]
	ldr r1, [sp, #0x18]
	adds r0, r1, r6
	mov r2, sb
	strb r2, [r0]
	ldr r3, [sp]
	adds r0, r3, r5
	mov r7, sb
	str r7, [r0]
	ldr r1, [sp, #0x1c]
	adds r0, r1, r6
	strb r7, [r0]
	movs r2, #0x64
	adds r5, r6, #0
	muls r5, r2, r5
	mov r3, r8
	adds r4, r5, r3
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _080EA6B4
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _080EA6B4
	movs r4, #0
	mov r7, sl
	lsls r7, r7, #2
	mov r8, r7
	mov r0, sl
	lsls r7, r0, #1
	adds r0, #1
	str r0, [sp, #8]
	ldr r2, _080EA6EC
_080EA63A:
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r5, r2
	str r2, [sp, #0x20]
	bl GetMonData
	mov r3, r8
	adds r1, r3, r4
	lsls r1, r1, #1
	ldr r3, [sp, #0x14]
	adds r1, r3, r1
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, [sp, #0x20]
	cmp r4, #3
	bls _080EA63A
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _080EA6EC
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	ldr r2, [sp, #0xc]
	adds r1, r2, r7
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	ldr r3, [sp, #0x10]
	adds r1, r3, r7
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	ldr r1, [sp, #0x18]
	add r1, sl
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	ldr r1, [sp]
	add r1, r8
	str r0, [r1]
	adds r0, r4, #0
	bl GetAverageEVs
	ldr r1, [sp, #0x1c]
	add r1, sl
	strb r0, [r1]
	ldr r7, [sp, #8]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
_080EA6B4:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	bhi _080EA6C0
	b _080EA5BC
_080EA6C0:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA6D0: .4byte 0x03005AEC
_080EA6D4: .4byte 0x00001AD0
_080EA6D8: .4byte 0x00001A9C
_080EA6DC: .4byte 0x00001AE8
_080EA6E0: .4byte 0x00001B18
_080EA6E4: .4byte 0x00001B24
_080EA6E8: .4byte 0x00001B36
_080EA6EC: .4byte 0x02024190
	thumb_func_end SetPlayerSecretBaseParty

	thumb_func_start ClearAndLeaveSecretBase
ClearAndLeaveSecretBase: @ 0x080EA6F0
	push {r4, r5, r6, lr}
	ldr r5, _080EA714
	ldr r0, [r5]
	ldr r4, _080EA718
	adds r1, r0, r4
	ldrh r6, [r1]
	ldr r1, _080EA71C
	adds r0, r0, r1
	bl ClearSecretBase
	ldr r0, [r5]
	adds r0, r0, r4
	strh r6, [r0]
	bl WarpOutOfSecretBase
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA714: .4byte 0x03005AEC
_080EA718: .4byte 0x00001AAA
_080EA71C: .4byte 0x00001A9C
	thumb_func_end ClearAndLeaveSecretBase

	thumb_func_start MoveOutOfSecretBase
MoveOutOfSecretBase: @ 0x080EA720
	push {lr}
	movs r0, #0x14
	bl IncrementGameStat
	bl ClearAndLeaveSecretBase
	pop {r0}
	bx r0
	thumb_func_end MoveOutOfSecretBase

	thumb_func_start ClosePlayerSecretBaseEntrance
ClosePlayerSecretBaseEntrance: @ 0x080EA730
	push {r4, r5, r6, r7, lr}
	ldr r0, _080EA73C
	ldr r4, [r0, #4]
	movs r6, #0
	b _080EA7C2
	.align 2, 0
_080EA73C: .4byte 0x02036FB8
_080EA740:
	ldr r2, [r4, #0x10]
	lsls r1, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2, #5]
	adds r7, r1, #0
	cmp r0, #8
	bne _080EA7BC
	ldr r0, _080EA790
	ldr r0, [r0]
	ldr r1, _080EA794
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, [r2, #8]
	cmp r1, r0
	bne _080EA7BC
	ldrh r0, [r2]
	adds r0, #7
	ldrh r1, [r2, #2]
	adds r1, #7
	bl MapGridGetMetatileIdAt
	movs r1, #0
	ldr r5, _080EA798
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
_080EA776:
	lsls r0, r1, #2
	adds r3, r0, r5
	ldrh r0, [r3, #2]
	cmp r0, r2
	beq _080EA79C
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #6
	bls _080EA776
_080EA78A:
	bl DrawWholeMapView
	b _080EA7C8
	.align 2, 0
_080EA790: .4byte 0x03005AEC
_080EA794: .4byte 0x00001A9C
_080EA798: .4byte 0x08568A78
_080EA79C:
	ldr r0, [r4, #0x10]
	adds r1, r7, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #7
	ldrh r1, [r1, #2]
	adds r1, #7
	ldrh r3, [r3]
	movs r4, #0xc0
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	b _080EA78A
_080EA7BC:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080EA7C2:
	ldrb r0, [r4, #3]
	cmp r6, r0
	blo _080EA740
_080EA7C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClosePlayerSecretBaseEntrance

	thumb_func_start MoveOutOfSecretBaseFromOutside
MoveOutOfSecretBaseFromOutside: @ 0x080EA7D0
	push {r4, r5, r6, lr}
	bl ClosePlayerSecretBaseEntrance
	movs r0, #0x14
	bl IncrementGameStat
	ldr r5, _080EA7FC
	ldr r0, [r5]
	ldr r4, _080EA800
	adds r1, r0, r4
	ldrh r6, [r1]
	ldr r1, _080EA804
	adds r0, r0, r1
	bl ClearSecretBase
	ldr r0, [r5]
	adds r0, r0, r4
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA7FC: .4byte 0x03005AEC
_080EA800: .4byte 0x00001AAA
_080EA804: .4byte 0x00001A9C
	thumb_func_end MoveOutOfSecretBaseFromOutside

	thumb_func_start GetNumRegisteredSecretBases
GetNumRegisteredSecretBases: @ 0x080EA808
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080EA80E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl IsSecretBaseRegistered
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EA824
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080EA824:
	lsls r0, r4, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _080EA80E
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetNumRegisteredSecretBases

	thumb_func_start GetCurSecretBaseRegistrationValidity
GetCurSecretBaseRegistrationValidity: @ 0x080EA83C
	push {lr}
	ldr r0, _080EA85C
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsSecretBaseRegistered
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080EA864
	ldr r0, _080EA860
	strh r1, [r0]
	b _080EA882
	.align 2, 0
_080EA85C: .4byte 0x00004054
_080EA860: .4byte 0x02037290
_080EA864:
	bl GetNumRegisteredSecretBases
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bls _080EA87C
	ldr r1, _080EA878
	movs r0, #2
	b _080EA880
	.align 2, 0
_080EA878: .4byte 0x02037290
_080EA87C:
	ldr r1, _080EA888
	movs r0, #0
_080EA880:
	strh r0, [r1]
_080EA882:
	pop {r0}
	bx r0
	.align 2, 0
_080EA888: .4byte 0x02037290
	thumb_func_end GetCurSecretBaseRegistrationValidity

	thumb_func_start ToggleCurSecretBaseRegistry
ToggleCurSecretBaseRegistry: @ 0x080EA88C
	push {lr}
	ldr r0, _080EA8C8
	bl VarGet
	ldr r1, _080EA8CC
	ldr r2, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r2, r2, r1
	ldr r0, _080EA8D0
	adds r2, r2, r0
	ldrb r3, [r2]
	lsrs r1, r3, #6
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x86
	lsls r0, r0, #1
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080EA8C8: .4byte 0x00004054
_080EA8CC: .4byte 0x03005AEC
_080EA8D0: .4byte 0x00001A9D
	thumb_func_end ToggleCurSecretBaseRegistry

	thumb_func_start ShowSecretBaseDecorationMenu
ShowSecretBaseDecorationMenu: @ 0x080EA8D4
	push {lr}
	ldr r0, _080EA8E4
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080EA8E4: .4byte 0x08126AA1
	thumb_func_end ShowSecretBaseDecorationMenu

	thumb_func_start ShowSecretBaseRegistryMenu
ShowSecretBaseRegistryMenu: @ 0x080EA8E8
	push {lr}
	ldr r0, _080EA8F8
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080EA8F8: .4byte 0x080EA8FD
	thumb_func_end ShowSecretBaseRegistryMenu

	thumb_func_start Task_ShowSecretBaseRegistryMenu
Task_ShowSecretBaseRegistryMenu: @ 0x080EA8FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r7, r0, #3
	ldr r0, _080EA960
	mov r8, r0
	adds r5, r7, r0
	bl ScriptContext2_Enable
	bl GetNumRegisteredSecretBases
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	cmp r0, #0
	beq _080EA970
	movs r0, #0
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	ldr r4, _080EA964
	movs r0, #0x84
	lsls r0, r0, #1
	bl AllocZeroed
	str r0, [r4]
	ldr r0, _080EA968
	bl AddWindow
	strh r0, [r5, #0xc]
	adds r0, r6, #0
	bl BuildRegistryMenuItems
	adds r0, r6, #0
	bl FinalizeRegistryMenu
	mov r0, r8
	subs r0, #8
	adds r0, r7, r0
	ldr r1, _080EA96C
	str r1, [r0]
	b _080EA97A
	.align 2, 0
_080EA960: .4byte 0x03005B68
_080EA964: .4byte 0x02039CEC
_080EA968: .4byte 0x08568B18
_080EA96C: .4byte 0x080EAAF1
_080EA970:
	ldr r1, _080EA984
	ldr r2, _080EA988
	adds r0, r6, #0
	bl DisplayItemMessageOnField
_080EA97A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA984: .4byte 0x085CA688
_080EA988: .4byte 0x080EAE19
	thumb_func_end Task_ShowSecretBaseRegistryMenu

	thumb_func_start BuildRegistryMenuItems
BuildRegistryMenuItems: @ 0x080EA98C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080EAA0C
	adds r7, r1, r0
	movs r6, #0
	movs r5, #1
	ldr r0, _080EAA10
	mov r8, r0
_080EA9A8:
	adds r0, r5, #0
	bl IsSecretBaseRegistered
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080EA9DC
	lsls r4, r6, #4
	adds r4, #0x58
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r5, #0
	bl GetSecretBaseMapName
	mov r3, r8
	ldr r0, [r3]
	lsls r2, r6, #3
	adds r1, r0, r2
	adds r4, r0, r4
	str r4, [r1]
	adds r0, #4
	adds r0, r0, r2
	str r5, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080EA9DC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x13
	bls _080EA9A8
	ldr r4, _080EAA10
	ldr r1, [r4]
	lsls r3, r6, #3
	adds r2, r1, r3
	ldr r0, _080EAA14
	str r0, [r2]
	adds r1, #4
	adds r1, r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r1]
	adds r2, r6, #1
	strh r2, [r7]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bgt _080EAA18
	strh r2, [r7, #6]
	b _080EAA1C
	.align 2, 0
_080EAA0C: .4byte 0x03005B68
_080EAA10: .4byte 0x02039CEC
_080EAA14: .4byte 0x085C93C4
_080EAA18:
	movs r0, #8
	strh r0, [r7, #6]
_080EAA1C:
	ldr r2, _080EAA44
	adds r1, r2, #0
	ldr r0, _080EAA48
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldrh r0, [r7, #0xc]
	strb r0, [r2, #0x10]
	ldrh r0, [r7]
	strh r0, [r2, #0xc]
	ldr r0, [r4]
	str r0, [r2]
	ldrh r0, [r7, #6]
	strh r0, [r2, #0xe]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAA44: .4byte 0x03006050
_080EAA48: .4byte 0x08568B28
	thumb_func_end BuildRegistryMenuItems

	thumb_func_start sub_080EAA4C
sub_080EAA4C: @ 0x080EAA4C
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _080EAA5C
	movs r0, #5
	bl PlaySE
_080EAA5C:
	pop {r0}
	bx r0
	thumb_func_end sub_080EAA4C

	thumb_func_start FinalizeRegistryMenu
FinalizeRegistryMenu: @ 0x080EAA60
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _080EAA9C
	adds r4, r4, r0
	ldrb r0, [r4, #0xc]
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldr r0, _080EAAA0
	ldrh r1, [r4, #4]
	ldrh r2, [r4, #2]
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	bl AddRegistryMenuScrollArrows
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EAA9C: .4byte 0x03005B68
_080EAAA0: .4byte 0x03006050
	thumb_func_end FinalizeRegistryMenu

	thumb_func_start AddRegistryMenuScrollArrows
AddRegistryMenuScrollArrows: @ 0x080EAAA4
	push {r4, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _080EAAE8
	adds r4, r4, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #6
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	str r0, [sp]
	ldr r0, _080EAAEC
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #4
	str r0, [sp, #0xc]
	movs r0, #2
	movs r1, #0xbc
	movs r2, #0xc
	movs r3, #0x94
	bl AddScrollIndicatorArrowPairParameterized
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x10]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EAAE8: .4byte 0x03005B68
_080EAAEC: .4byte 0x000013F8
	thumb_func_end AddRegistryMenuScrollArrows

	thumb_func_start HandleRegistryMenuInput
HandleRegistryMenuInput: @ 0x080EAAF0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _080EAB24
	adds r4, r0, r1
	ldrb r0, [r4, #0xa]
	bl ListMenu_ProcessInput
	adds r5, r0, #0
	ldrb r0, [r4, #0xa]
	adds r1, r4, #4
	adds r2, r4, #2
	bl ListMenuGetScrollAndRow
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	beq _080EAB28
	adds r0, #1
	cmp r5, r0
	bne _080EAB6C
	b _080EAB7A
	.align 2, 0
_080EAB24: .4byte 0x03005B68
_080EAB28:
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4, #0xa]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r4, #0x10]
	bl RemoveScrollIndicatorArrowPair
	ldrb r0, [r4, #0xc]
	movs r1, #0
	bl DrawStdWindowFrame
	ldrb r0, [r4, #0xc]
	bl ClearWindowTilemap
	ldrb r0, [r4, #0xc]
	bl RemoveWindow
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _080EAB68
	ldr r0, [r0]
	bl Free
	adds r0, r6, #0
	bl GoToSecretBasePCMainMenu
	b _080EAB7A
	.align 2, 0
_080EAB68: .4byte 0x02039CEC
_080EAB6C:
	movs r0, #5
	bl PlaySE
	strh r5, [r4, #8]
	adds r0, r6, #0
	bl ShowRegistryMenuActions
_080EAB7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end HandleRegistryMenuInput

	thumb_func_start ShowRegistryMenuActions
ShowRegistryMenuActions: @ 0x080EAB80
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r6, _080EABE8
	adds r5, r4, r6
	ldrb r0, [r5, #0x10]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, _080EABEC
	bl AddWindow
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldrb r0, [r5, #0xe]
	ldr r1, _080EABF0
	str r1, [sp]
	movs r1, #1
	movs r2, #0x10
	movs r3, #2
	bl sub_08198964
	ldrb r0, [r5, #0xe]
	movs r1, #0x10
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	subs r6, #8
	adds r4, r4, r6
	ldr r0, _080EABF4
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EABE8: .4byte 0x03005B68
_080EABEC: .4byte 0x08568B20
_080EABF0: .4byte 0x08568AF4
_080EABF4: .4byte 0x080EABF9
	thumb_func_end ShowRegistryMenuActions

	thumb_func_start HandleRegistryMenuActionsInput
HandleRegistryMenuActionsInput: @ 0x080EABF8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	bl Menu_ProcessInputNoWrap
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _080EAC3A
	adds r0, #1
	cmp r4, r0
	bne _080EAC24
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl ReturnToMainRegistryMenu
	b _080EAC3A
_080EAC24:
	movs r0, #5
	bl PlaySE
	ldr r0, _080EAC40
	lsls r1, r4, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r6, #0
	bl _call_via_r1
_080EAC3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EAC40: .4byte 0x08568AF4
	thumb_func_end HandleRegistryMenuActionsInput

	thumb_func_start ShowRegistryMenuDeleteConfirmation
ShowRegistryMenuDeleteConfirmation: @ 0x080EAC44
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _080EACA0
	adds r4, r4, r0
	ldrb r0, [r4, #0xc]
	movs r1, #0
	bl DrawStdWindowFrame
	ldrb r0, [r4, #0xe]
	movs r1, #0
	bl DrawStdWindowFrame
	ldrb r0, [r4, #0xc]
	bl ClearWindowTilemap
	ldrb r0, [r4, #0xe]
	bl ClearWindowTilemap
	ldrb r0, [r4, #0xe]
	bl RemoveWindow
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _080EACA4
	ldrb r1, [r4, #8]
	bl GetSecretBaseMapName
	ldr r4, _080EACA8
	ldr r1, _080EACAC
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r2, _080EACB0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EACA0: .4byte 0x03005B68
_080EACA4: .4byte 0x02021C40
_080EACA8: .4byte 0x02021C7C
_080EACAC: .4byte 0x085CA658
_080EACB0: .4byte 0x080EACB5
	thumb_func_end ShowRegistryMenuDeleteConfirmation

	thumb_func_start ShowRegistryMenuDeleteYesNo
ShowRegistryMenuDeleteYesNo: @ 0x080EACB4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _080EACD0
	adds r0, r4, #0
	bl DoYesNoFuncWithChoice
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EACD0: .4byte 0x08568B04
	thumb_func_end ShowRegistryMenuDeleteYesNo

	thumb_func_start DeleteRegistry_Yes_Callback
DeleteRegistry_Yes_Callback: @ 0x080EACD4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r4, #2
	adds r5, r5, r4
	lsls r5, r5, #3
	ldr r0, _080EAD58
	mov r8, r0
	adds r6, r5, r0
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	ldrb r0, [r6, #0xa]
	adds r1, r6, #4
	mov sb, r1
	adds r1, r6, #2
	mov sl, r1
	mov r1, sb
	mov r2, sl
	bl DestroyListMenuTask
	ldr r0, _080EAD5C
	ldr r2, [r0]
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r2, r2, r0
	ldr r1, _080EAD60
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl BuildRegistryMenuItems
	ldrb r2, [r6, #6]
	ldrb r3, [r6]
	mov r0, sb
	mov r1, sl
	bl sub_08122268
	adds r0, r4, #0
	bl FinalizeRegistryMenu
	movs r0, #8
	rsbs r0, r0, #0
	add r8, r0
	add r5, r8
	ldr r0, _080EAD64
	str r0, [r5]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EAD58: .4byte 0x03005B68
_080EAD5C: .4byte 0x03005AEC
_080EAD60: .4byte 0x00001A9D
_080EAD64: .4byte 0x080EAAF1
	thumb_func_end DeleteRegistry_Yes_Callback

	thumb_func_start sub_080EAD68
sub_080EAD68: @ 0x080EAD68
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080EAD7C
	ldr r2, _080EAD80
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_080EAD7C: .4byte 0x085CA676
_080EAD80: .4byte 0x080EACD5
	thumb_func_end sub_080EAD68

	thumb_func_start DeleteRegistry_No
DeleteRegistry_No: @ 0x080EAD84
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _080EADCC
	mov r8, r0
	adds r6, r4, r0
	movs r0, #0
	movs r1, #0
	bl DrawDialogueFrame
	ldrb r0, [r6, #0xa]
	adds r1, r6, #4
	adds r6, #2
	adds r2, r6, #0
	bl DestroyListMenuTask
	adds r0, r5, #0
	bl FinalizeRegistryMenu
	movs r0, #8
	rsbs r0, r0, #0
	add r8, r0
	add r4, r8
	ldr r0, _080EADD0
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EADCC: .4byte 0x03005B68
_080EADD0: .4byte 0x080EAAF1
	thumb_func_end DeleteRegistry_No

	thumb_func_start ReturnToMainRegistryMenu
ReturnToMainRegistryMenu: @ 0x080EADD4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r6, _080EAE10
	adds r5, r4, r6
	bl AddRegistryMenuScrollArrows
	ldrb r0, [r5, #0xe]
	movs r1, #0
	bl DrawStdWindowFrame
	ldrb r0, [r5, #0xe]
	bl ClearWindowTilemap
	ldrb r0, [r5, #0xe]
	bl RemoveWindow
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	subs r6, #8
	adds r4, r4, r6
	ldr r0, _080EAE14
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EAE10: .4byte 0x03005B68
_080EAE14: .4byte 0x080EAAF1
	thumb_func_end ReturnToMainRegistryMenu

	thumb_func_start GoToSecretBasePCMainMenu
GoToSecretBasePCMainMenu: @ 0x080EAE18
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080EAE34
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080EAE3C
	ldr r0, _080EAE38
	bl ScriptContext1_SetupScript
	b _080EAE42
	.align 2, 0
_080EAE34: .4byte 0x00004054
_080EAE38: .4byte 0x0821D3D7
_080EAE3C:
	ldr r0, _080EAE50
	bl ScriptContext1_SetupScript
_080EAE42:
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EAE50: .4byte 0x0821D4D8
	thumb_func_end GoToSecretBasePCMainMenu

	thumb_func_start GetSecretBaseOwnerType
GetSecretBaseOwnerType: @ 0x080EAE54
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080EAE8C
	ldr r4, [r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r4, r4, r1
	ldr r1, _080EAE90
	adds r0, r4, r1
	ldrb r0, [r0]
	movs r1, #5
	bl __umodsi3
	ldr r1, _080EAE94
	adds r4, r4, r1
	ldrb r2, [r4]
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x1f
	lsls r1, r2, #2
	adds r1, r1, r2
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EAE8C: .4byte 0x03005AEC
_080EAE90: .4byte 0x00001AA5
_080EAE94: .4byte 0x00001A9D
	thumb_func_end GetSecretBaseOwnerType

	thumb_func_start GetSecretBaseTrainerLoseText
GetSecretBaseTrainerLoseText: @ 0x080EAE98
	push {lr}
	ldr r0, _080EAEB8
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetSecretBaseOwnerType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0
	bne _080EAEC0
	ldr r0, _080EAEBC
	b _080EAF22
	.align 2, 0
_080EAEB8: .4byte 0x00004054
_080EAEBC: .4byte 0x0824516F
_080EAEC0:
	cmp r0, #1
	bne _080EAECC
	ldr r0, _080EAEC8
	b _080EAF22
	.align 2, 0
_080EAEC8: .4byte 0x08245374
_080EAECC:
	cmp r0, #2
	bne _080EAED8
	ldr r0, _080EAED4
	b _080EAF22
	.align 2, 0
_080EAED4: .4byte 0x08245550
_080EAED8:
	cmp r0, #3
	bne _080EAEE4
	ldr r0, _080EAEE0
	b _080EAF22
	.align 2, 0
_080EAEE0: .4byte 0x0824573E
_080EAEE4:
	cmp r0, #4
	bne _080EAEF0
	ldr r0, _080EAEEC
	b _080EAF22
	.align 2, 0
_080EAEEC: .4byte 0x082458F4
_080EAEF0:
	cmp r0, #5
	bne _080EAEFC
	ldr r0, _080EAEF8
	b _080EAF22
	.align 2, 0
_080EAEF8: .4byte 0x0824526D
_080EAEFC:
	cmp r0, #6
	bne _080EAF08
	ldr r0, _080EAF04
	b _080EAF22
	.align 2, 0
_080EAF04: .4byte 0x08245455
_080EAF08:
	cmp r0, #7
	bne _080EAF14
	ldr r0, _080EAF10
	b _080EAF22
	.align 2, 0
_080EAF10: .4byte 0x0824565C
_080EAF14:
	cmp r1, #8
	beq _080EAF20
	ldr r0, _080EAF1C
	b _080EAF22
	.align 2, 0
_080EAF1C: .4byte 0x08245A06
_080EAF20:
	ldr r0, _080EAF28
_080EAF22:
	pop {r1}
	bx r1
	.align 2, 0
_080EAF28: .4byte 0x08245819
	thumb_func_end GetSecretBaseTrainerLoseText

	thumb_func_start PrepSecretBaseBattleFlags
PrepSecretBaseBattleFlags: @ 0x080EAF2C
	push {lr}
	movs r0, #1
	bl sub_0813BB14
	ldr r1, _080EAF48
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080EAF4C
	ldr r0, _080EAF50
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080EAF48: .4byte 0x0203886A
_080EAF4C: .4byte 0x02022C90
_080EAF50: .4byte 0x08000008
	thumb_func_end PrepSecretBaseBattleFlags

	thumb_func_start sub_080EAF54
sub_080EAF54: @ 0x080EAF54
	push {lr}
	ldr r0, _080EAF8C
	bl VarGet
	ldr r1, _080EAF90
	ldr r3, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r3, r3, r1
	ldr r0, _080EAF94
	ldrb r0, [r0]
	ldr r1, _080EAF98
	adds r3, r3, r1
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #5
	ldrb r2, [r3]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_080EAF8C: .4byte 0x00004054
_080EAF90: .4byte 0x03005AEC
_080EAF94: .4byte 0x02037290
_080EAF98: .4byte 0x00001A9D
	thumb_func_end sub_080EAF54

	thumb_func_start GetSecretBaseOwnerInteractionState
GetSecretBaseOwnerInteractionState: @ 0x080EAF9C
	push {r4, r5, r6, r7, lr}
	ldr r0, _080EB014
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080EB018
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080EAFE2
	movs r3, #0
	ldr r7, _080EB01C
	ldr r4, _080EB020
	movs r6, #0x21
	rsbs r6, r6, #0
_080EAFBE:
	ldr r1, [r7]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r4
	ldrb r2, [r1]
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x13
	bls _080EAFBE
	ldr r0, _080EB018
	bl FlagSet
_080EAFE2:
	ldr r4, _080EB024
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetSecretBaseOwnerType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldr r2, _080EB028
	ldr r0, _080EB01C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r0, _080EB020
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	strh r0, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB014: .4byte 0x00004054
_080EB018: .4byte 0x00000922
_080EB01C: .4byte 0x03005AEC
_080EB020: .4byte 0x00001A9D
_080EB024: .4byte 0x02037280
_080EB028: .4byte 0x02037290
	thumb_func_end GetSecretBaseOwnerInteractionState

	thumb_func_start SecretBasePerStepCallback
SecretBasePerStepCallback: @ 0x080EB02C
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080EB050
	adds r5, r1, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _080EB090
	cmp r0, #1
	bgt _080EB054
	cmp r0, #0
	beq _080EB05C
	b _080EB468
	.align 2, 0
_080EB050: .4byte 0x03005B68
_080EB054:
	cmp r0, #2
	bne _080EB05A
	b _080EB458
_080EB05A:
	b _080EB468
_080EB05C:
	ldr r0, _080EB074
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080EB07C
	ldr r1, _080EB078
	movs r0, #1
	strb r0, [r1]
	b _080EB080
	.align 2, 0
_080EB074: .4byte 0x00004054
_080EB078: .4byte 0x02039CE9
_080EB07C:
	ldr r0, _080EB08C
	strb r1, [r0]
_080EB080:
	adds r0, r5, #4
	adds r1, r5, #6
	bl PlayerGetDestCoords
	b _080EB464
	.align 2, 0
_080EB08C: .4byte 0x02039CE9
_080EB090:
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #4
	ldrsh r0, [r5, r3]
	adds r6, r4, #0
	cmp r1, r0
	bne _080EB0BC
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r3, #6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _080EB0BC
	b _080EB468
_080EB0BC:
	strh r2, [r5, #4]
	ldrh r0, [r6]
	strh r0, [r5, #6]
	ldr r4, _080EB124
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x8d
	lsls r0, r0, #2
	cmp r4, r0
	beq _080EB10A
	adds r0, #8
	cmp r4, r0
	bne _080EB130
_080EB10A:
	ldr r0, _080EB128
	ldrb r0, [r0]
	cmp r0, #1
	beq _080EB114
	b _080EB468
_080EB114:
	ldr r4, _080EB12C
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x20
	b _080EB442
	.align 2, 0
_080EB124: .4byte 0x000040EC
_080EB128: .4byte 0x02039CE9
_080EB12C: .4byte 0x000040EF
_080EB130:
	ldr r3, _080EB17C
	adds r0, r4, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080EB162
	movs r0, #0xb0
	lsls r0, r0, #2
	cmp r4, r0
	beq _080EB162
	adds r0, #1
	cmp r4, r0
	beq _080EB162
	adds r0, #1
	cmp r4, r0
	beq _080EB162
	adds r0, #6
	cmp r4, r0
	beq _080EB162
	adds r0, #1
	cmp r4, r0
	beq _080EB162
	adds r0, #1
	cmp r4, r0
	bne _080EB188
_080EB162:
	ldr r0, _080EB180
	ldrb r0, [r0]
	cmp r0, #1
	beq _080EB16C
	b _080EB468
_080EB16C:
	ldr r4, _080EB184
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #1
	b _080EB442
	.align 2, 0
_080EB17C: .4byte 0xFFFFFD48
_080EB180: .4byte 0x02039CE9
_080EB184: .4byte 0x000040EE
_080EB188:
	ldr r0, _080EB1B8
	cmp r4, r0
	beq _080EB1A0
	adds r0, #8
	cmp r4, r0
	beq _080EB1A0
	adds r0, #0x10
	cmp r4, r0
	beq _080EB1A0
	adds r0, #8
	cmp r4, r0
	bne _080EB1C4
_080EB1A0:
	ldr r0, _080EB1BC
	ldrb r0, [r0]
	cmp r0, #1
	beq _080EB1AA
	b _080EB468
_080EB1AA:
	ldr r4, _080EB1C0
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #4
	b _080EB442
	.align 2, 0
_080EB1B8: .4byte 0x00000239
_080EB1BC: .4byte 0x02039CE9
_080EB1C0: .4byte 0x000040EE
_080EB1C4:
	cmp r5, #0x34
	bne _080EB1CE
	ldr r0, _080EB204
	cmp r4, r0
	beq _080EB1E6
_080EB1CE:
	cmp r5, #0x35
	bne _080EB214
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _080EB208
	cmp r0, r1
	bne _080EB214
_080EB1E6:
	ldr r0, _080EB20C
	ldrb r0, [r0]
	cmp r0, #1
	beq _080EB1F0
	b _080EB468
_080EB1F0:
	ldr r4, _080EB210
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	b _080EB442
	.align 2, 0
_080EB204: .4byte 0x0000026D
_080EB208: .4byte 0x0000026A
_080EB20C: .4byte 0x02039CE9
_080EB210: .4byte 0x000040EF
_080EB214:
	cmp r5, #0xc1
	bne _080EB260
	ldr r0, _080EB254
	cmp r4, r0
	bne _080EB260
	ldr r0, _080EB258
	ldrb r0, [r0]
	cmp r0, #1
	beq _080EB228
	b _080EB468
_080EB228:
	ldr r4, _080EB25C
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	b _080EB442
	.align 2, 0
_080EB254: .4byte 0x0000023D
_080EB258: .4byte 0x02039CE9
_080EB25C: .4byte 0x000040EF
_080EB260:
	cmp r5, #0x47
	bne _080EB2B0
	ldr r0, _080EB2A4
	cmp r4, r0
	bne _080EB2B0
	ldr r0, _080EB2A8
	ldrb r0, [r0]
	cmp r0, #1
	beq _080EB274
	b _080EB468
_080EB274:
	ldr r4, _080EB2AC
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	eors r1, r0
	b _080EB444
	.align 2, 0
_080EB2A4: .4byte 0x0000023E
_080EB2A8: .4byte 0x02039CE9
_080EB2AC: .4byte 0x000040EF
_080EB2B0:
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBaseGlitterMat
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB2E0
	ldr r0, _080EB2D8
	ldrb r0, [r0]
	cmp r0, #1
	beq _080EB2C8
	b _080EB468
_080EB2C8:
	ldr r4, _080EB2DC
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x80
	b _080EB442
	.align 2, 0
_080EB2D8: .4byte 0x02039CE9
_080EB2DC: .4byte 0x000040EF
_080EB2E0:
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBaseBalloon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB374
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r1, sp
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r6, r3]
	bl PopSecretBaseBalloon
	ldr r0, _080EB340
	ldrb r0, [r0]
	cmp r0, #1
	beq _080EB318
	b _080EB468
_080EB318:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	movs r0, #0xce
	lsls r0, r0, #2
	cmp r1, r0
	beq _080EB354
	cmp r1, r0
	bgt _080EB344
	movs r0, #0x8a
	lsls r0, r0, #2
	cmp r1, r0
	beq _080EB35C
	b _080EB468
	.align 2, 0
_080EB340: .4byte 0x02039CE9
_080EB344:
	movs r0, #0xcf
	lsls r0, r0, #2
	cmp r1, r0
	beq _080EB354
	adds r0, #4
	cmp r1, r0
	beq _080EB354
	b _080EB468
_080EB354:
	ldr r4, _080EB358
	b _080EB438
	.align 2, 0
_080EB358: .4byte 0x000040EE
_080EB35C:
	ldr r4, _080EB370
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	b _080EB442
	.align 2, 0
_080EB370: .4byte 0x000040EE
_080EB374:
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBaseBreakableDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB3C0
	ldr r0, _080EB3B8
	ldrb r0, [r0]
	cmp r0, #1
	bne _080EB3A6
	ldr r4, _080EB3BC
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080EB3A6:
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl ShatterSecretBaseBreakableDoor
	b _080EB468
	.align 2, 0
_080EB3B8: .4byte 0x02039CE9
_080EB3BC: .4byte 0x000040EF
_080EB3C0:
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBaseSoundMat
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB3F0
	ldr r0, _080EB3E8
	ldrb r0, [r0]
	cmp r0, #1
	bne _080EB468
	ldr r4, _080EB3EC
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	b _080EB442
	.align 2, 0
_080EB3E8: .4byte 0x02039CE9
_080EB3EC: .4byte 0x000040EE
_080EB3F0:
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBaseJumpMat
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB420
	ldr r0, _080EB418
	ldrb r0, [r0]
	cmp r0, #1
	bne _080EB468
	ldr r4, _080EB41C
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r2, #0
	b _080EB442
	.align 2, 0
_080EB418: .4byte 0x02039CE9
_080EB41C: .4byte 0x000040EF
_080EB420:
	adds r0, r5, #0
	bl MetatileBehavior_IsSecretBaseSpinMat
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB468
	ldr r0, _080EB450
	ldrb r0, [r0]
	cmp r0, #1
	bne _080EB468
	ldr r4, _080EB454
_080EB438:
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #2
_080EB442:
	orrs r1, r0
_080EB444:
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	b _080EB468
	.align 2, 0
_080EB450: .4byte 0x02039CE9
_080EB454: .4byte 0x000040EF
_080EB458:
	ldrb r0, [r5, #8]
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080EB468
_080EB464:
	movs r0, #1
	strh r0, [r5, #2]
_080EB468:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end SecretBasePerStepCallback

	thumb_func_start sub_080EB470
sub_080EB470: @ 0x080EB470
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r6, _080EB4BC
	ldr r0, [r6]
	lsls r2, r3, #2
	adds r2, r2, r3
	lsls r5, r2, #5
	adds r0, r0, r5
	ldr r2, _080EB4C0
	adds r0, r0, r2
	movs r2, #0xa0
	bl memcpy
	ldr r2, [r6]
	adds r2, r2, r5
	ldr r0, _080EB4C4
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	subs r4, #1
	cmp r4, #1
	bhi _080EB4B6
	ldr r0, [r6]
	adds r0, r0, r5
	ldr r1, _080EB4C8
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
_080EB4B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB4BC: .4byte 0x03005AEC
_080EB4C0: .4byte 0x00001A9C
_080EB4C4: .4byte 0x00001A9D
_080EB4C8: .4byte 0x00001AA9
	thumb_func_end sub_080EB470

	thumb_func_start SecretBasesHaveSameTrainerId
SecretBasesHaveSameTrainerId: @ 0x080EB4CC
	push {r4, lr}
	movs r2, #0
	adds r4, r0, #0
	adds r4, #9
	adds r3, r1, #0
	adds r3, #9
_080EB4D8:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080EB4E8
	movs r0, #0
	b _080EB4F4
_080EB4E8:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080EB4D8
	movs r0, #1
_080EB4F4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SecretBasesHaveSameTrainerId

	thumb_func_start SecretBasesHaveSameTrainerName
SecretBasesHaveSameTrainerName: @ 0x080EB4FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r3, #0
	ldrb r0, [r6, #2]
	cmp r0, #0xff
	bne _080EB510
	ldrb r0, [r5, #2]
	cmp r0, #0xff
	beq _080EB53E
_080EB510:
	adds r2, r6, #2
	adds r0, r2, r3
	adds r4, r5, #2
	adds r1, r4, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080EB524
	movs r0, #0
	b _080EB540
_080EB524:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #6
	bhi _080EB53E
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080EB510
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080EB510
_080EB53E:
	movs r0, #1
_080EB540:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SecretBasesHaveSameTrainerName

	thumb_func_start SecretBasesBelongToSamePlayer
SecretBasesBelongToSamePlayer: @ 0x080EB548
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r2, [r4, #1]
	movs r0, #0x10
	adds r1, r0, #0
	ands r1, r2
	ldrb r2, [r5, #1]
	ands r0, r2
	cmp r1, r0
	bne _080EB57E
	adds r0, r4, #0
	adds r1, r5, #0
	bl SecretBasesHaveSameTrainerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080EB57E
	adds r0, r4, #0
	adds r1, r5, #0
	bl SecretBasesHaveSameTrainerName
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080EB57E
	movs r0, #1
	b _080EB580
_080EB57E:
	movs r0, #0
_080EB580:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SecretBasesBelongToSamePlayer

	thumb_func_start GetSecretBaseIndexFromId
GetSecretBaseIndexFromId: @ 0x080EB588
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	ldr r0, _080EB5B0
	ldr r2, [r0]
	ldr r4, _080EB5B4
_080EB596:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r2, r0
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080EB5B8
	adds r0, r1, #0
	b _080EB5C8
	.align 2, 0
_080EB5B0: .4byte 0x03005AEC
_080EB5B4: .4byte 0x00001A9C
_080EB5B8:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _080EB596
	movs r0, #1
	rsbs r0, r0, #0
_080EB5C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetSecretBaseIndexFromId

	thumb_func_start FindAvailableSecretBaseIndex
FindAvailableSecretBaseIndex: @ 0x080EB5D0
	push {r4, lr}
	movs r2, #1
	ldr r0, _080EB5F4
	ldr r3, [r0]
	ldr r4, _080EB5F8
_080EB5DA:
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r3, r0
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080EB5FC
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	b _080EB60A
	.align 2, 0
_080EB5F4: .4byte 0x03005AEC
_080EB5F8: .4byte 0x00001A9C
_080EB5FC:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _080EB5DA
	movs r0, #0
_080EB60A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FindAvailableSecretBaseIndex

	thumb_func_start sub_080EB610
sub_080EB610: @ 0x080EB610
	push {r4, lr}
	movs r3, #1
	ldr r0, _080EB63C
	ldr r4, [r0]
_080EB618:
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r4, r0
	ldr r1, _080EB640
	adds r0, r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, #6
	cmp r0, #0
	bne _080EB644
	lsls r0, r1, #0x1c
	cmp r0, #0
	bne _080EB644
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	b _080EB654
	.align 2, 0
_080EB63C: .4byte 0x03005AEC
_080EB640: .4byte 0x00001A9D
_080EB644:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r2, r1
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _080EB618
	movs r0, #0
_080EB654:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080EB610

	thumb_func_start sub_080EB65C
sub_080EB65C: @ 0x080EB65C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _080EB6DE
	ldrb r0, [r5]
	bl GetSecretBaseIndexFromId
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	beq _080EB6DE
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080EB6B8
	ldr r0, _080EB6B0
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r0, _080EB6B4
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _080EB6DE
	lsrs r0, r1, #6
	cmp r0, #2
	bne _080EB6AA
	ldrb r1, [r5, #1]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _080EB6DE
_080EB6AA:
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	b _080EB6D0
	.align 2, 0
_080EB6B0: .4byte 0x03005AEC
_080EB6B4: .4byte 0x00001A9D
_080EB6B8:
	bl FindAvailableSecretBaseIndex
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080EB6D0
	bl sub_080EB610
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _080EB6DE
_080EB6D0:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080EB470
	adds r0, r4, #0
	b _080EB6E0
_080EB6DE:
	movs r0, #0
_080EB6E0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080EB65C

	thumb_func_start SortSecretBasesByRegistryStatus
SortSecretBasesByRegistryStatus: @ 0x080EB6E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xa0
	ldr r0, _080EB790
	ldr r0, [r0]
	ldr r1, _080EB794
	adds r7, r0, r1
	movs r2, #1
_080EB6FC:
	adds r1, r2, #1
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	mov sb, r1
	cmp r5, #0x13
	bhi _080EB778
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r6, r0, r7
	movs r0, #0xc0
	mov r8, r0
_080EB714:
	ldrb r0, [r6, #1]
	mov r3, r8
	ands r3, r0
	cmp r3, #0
	bne _080EB732
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #5
	adds r0, r0, r7
	ldrb r1, [r0, #1]
	mov r0, r8
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0x40
	beq _080EB74A
_080EB732:
	cmp r3, #0x80
	bne _080EB76E
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #5
	adds r0, r0, r7
	ldrb r1, [r0, #1]
	mov r0, r8
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0x80
	beq _080EB76E
_080EB74A:
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0xa0
	bl memcpy
	adds r4, r4, r5
	lsls r4, r4, #5
	adds r4, r4, r7
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xa0
	bl memcpy
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0xa0
	bl memcpy
_080EB76E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x13
	bls _080EB714
_080EB778:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x12
	bls _080EB6FC
	add sp, #0xa0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB790: .4byte 0x03005AEC
_080EB794: .4byte 0x00001A9C
	thumb_func_end SortSecretBasesByRegistryStatus

	thumb_func_start sub_080EB798
sub_080EB798: @ 0x080EB798
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r4, #1
_080EB7A2:
	ldr r0, [r5]
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #5
	adds r2, r1, r0
	ldrb r0, [r2, #1]
	lsrs r0, r0, #6
	cmp r0, r6
	bne _080EB7BC
	ldr r1, [r5, #4]
	adds r0, r2, #0
	bl sub_080EB65C
_080EB7BC:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _080EB7A2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080EB798

	thumb_func_start SecretBaseBelongsToPlayer
SecretBaseBelongsToPlayer: @ 0x080EB7CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _080EB7E8
	ldrb r0, [r5, #1]
	lsls r0, r0, #0x1b
	ldr r1, _080EB7EC
	ldr r3, [r1]
	lsrs r0, r0, #0x1f
	adds r6, r1, #0
	ldrb r1, [r3, #8]
	cmp r0, r1
	beq _080EB7F0
_080EB7E8:
	movs r0, #0
	b _080EB846
	.align 2, 0
_080EB7EC: .4byte 0x03005AF0
_080EB7F0:
	movs r2, #0
	adds r4, r5, #0
	adds r4, #9
	adds r3, #0xa
_080EB7F8:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080EB7E8
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080EB7F8
	movs r2, #0
	ldrb r0, [r5, #2]
	cmp r0, #0xff
	bne _080EB81A
	ldr r0, [r6]
	b _080EB83E
_080EB81A:
	adds r3, r5, #2
	adds r0, r3, r2
	ldr r4, [r6]
	adds r1, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080EB7E8
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #6
	bhi _080EB844
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080EB81A
	adds r0, r4, r2
_080EB83E:
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080EB81A
_080EB844:
	movs r0, #1
_080EB846:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end SecretBaseBelongsToPlayer

	thumb_func_start DeleteFirstOldBaseFromPlayerInRecordMixingFriendsRecords
DeleteFirstOldBaseFromPlayerInRecordMixingFriendsRecords: @ 0x080EB84C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	movs r5, #0
	movs r6, #0
_080EB860:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080EB88A
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #5
	mov r1, sl
	adds r4, r1, r0
	adds r0, r4, #0
	bl SecretBaseBelongsToPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB88A
	adds r0, r4, #0
	bl ClearSecretBase
	movs r0, #1
	orrs r5, r0
_080EB88A:
	movs r7, #2
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _080EB8B8
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #5
	mov r1, sb
	adds r4, r1, r0
	adds r0, r4, #0
	bl SecretBaseBelongsToPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB8B8
	adds r0, r4, #0
	bl ClearSecretBase
	orrs r5, r7
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_080EB8B8:
	movs r7, #4
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	bne _080EB8E6
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	bl SecretBaseBelongsToPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB8E6
	adds r0, r4, #0
	bl ClearSecretBase
	orrs r5, r7
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_080EB8E6:
	cmp r5, #7
	beq _080EB8F4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x13
	bls _080EB860
_080EB8F4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DeleteFirstOldBaseFromPlayerInRecordMixingFriendsRecords

	thumb_func_start sub_080EB904
sub_080EB904: @ 0x080EB904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r5, #0
_080EB914:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #5
	mov r1, r8
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _080EB96E
	adds r0, r6, #0
	adds r1, r4, #0
	bl SecretBasesBelongToSamePlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EB96E
	cmp r7, #0
	bne _080EB940
	adds r0, r4, #0
	bl ClearSecretBase
	b _080EB978
_080EB940:
	ldrh r0, [r6, #0xe]
	ldrh r3, [r4, #0xe]
	cmp r0, r3
	bls _080EB950
	adds r0, r4, #0
	bl ClearSecretBase
	b _080EB978
_080EB950:
	ldrb r0, [r6, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r1, [r4, #1]
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #1]
	adds r0, r6, #0
	bl ClearSecretBase
	movs r0, #1
	b _080EB97A
_080EB96E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x13
	bls _080EB914
_080EB978:
	movs r0, #0
_080EB97A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080EB904

	thumb_func_start sub_080EB984
sub_080EB984: @ 0x080EB984
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	adds r6, r3, #0
	movs r5, #1
_080EB996:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #5
	mov r1, sb
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _080EB9E8
	ldrb r1, [r4, #1]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x40
	bne _080EB9BE
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
_080EB9BE:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_080EB904
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080EB9E8
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl sub_080EB904
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080EB9E8
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_080EB904
_080EB9E8:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x13
	bls _080EB996
	movs r5, #0
_080EB9F4:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #5
	adds r4, r0, r7
	ldrb r0, [r4]
	cmp r0, #0
	beq _080EBA28
	ldrb r0, [r4, #1]
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl sub_080EB904
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080EBA28
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_080EB904
_080EBA28:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x13
	bls _080EB9F4
	movs r5, #0
	movs r0, #0x21
	rsbs r0, r0, #0
	adds r7, r0, #0
_080EBA3A:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r4, r0, #5
	mov r2, r8
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _080EBA5A
	ldrb r0, [r1, #1]
	ands r0, r7
	strb r0, [r1, #1]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_080EB904
_080EBA5A:
	adds r1, r4, r6
	ldrb r0, [r1]
	cmp r0, #0
	beq _080EBA68
	ldrb r0, [r1, #1]
	ands r0, r7
	strb r0, [r1, #1]
_080EBA68:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x13
	bls _080EBA3A
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080EB984

	thumb_func_start sub_080EBA80
sub_080EBA80: @ 0x080EBA80
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldrb r1, [r4, #1]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _080EBA9E
	adds r0, r4, #0
	adds r1, r2, #0
	bl sub_080EB65C
	adds r0, r4, #0
	bl ClearSecretBase
_080EBA9E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080EBA80

	thumb_func_start sub_080EBAA4
sub_080EBAA4: @ 0x080EBAA4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
_080EBAAA:
	lsls r4, r6, #2
	adds r4, r4, r6
	lsls r4, r4, #5
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, [r5, #4]
	bl sub_080EBA80
	ldr r0, [r5, #8]
	adds r0, r0, r4
	ldr r1, [r5, #0xc]
	bl sub_080EBA80
	ldr r0, [r5, #0x10]
	adds r0, r0, r4
	ldr r1, [r5, #0x14]
	bl sub_080EBA80
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x13
	bls _080EBAAA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080EBAA4

	thumb_func_start sub_080EBAE0
sub_080EBAE0: @ 0x080EBAE0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x10]
	bl DeleteFirstOldBaseFromPlayerInRecordMixingFriendsRecords
	ldr r0, _080EBB5C
	ldr r0, [r0]
	ldr r1, _080EBB60
	adds r0, r0, r1
	ldr r1, [r4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x10]
	bl sub_080EB984
	adds r0, r4, #0
	bl sub_080EBAA4
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl sub_080EB65C
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	bl sub_080EB65C
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	bl sub_080EB65C
	adds r0, r4, #0
	movs r1, #1
	bl sub_080EB798
	adds r6, r4, #0
	adds r6, #8
	adds r0, r6, #0
	movs r1, #1
	bl sub_080EB798
	adds r5, r4, #0
	adds r5, #0x10
	adds r0, r5, #0
	movs r1, #1
	bl sub_080EB798
	adds r0, r4, #0
	movs r1, #0
	bl sub_080EB798
	adds r0, r6, #0
	movs r1, #0
	bl sub_080EB798
	adds r0, r5, #0
	movs r1, #0
	bl sub_080EB798
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EBB5C: .4byte 0x03005AEC
_080EBB60: .4byte 0x00001A9C
	thumb_func_end sub_080EBAE0

	thumb_func_start ReceiveSecretBasesData
ReceiveSecretBasesData: @ 0x080EBB64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r0, #0x60
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080EBB7E
	b _080EBD0C
_080EBB7E:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080EBB90
	cmp r0, #3
	beq _080EBBAC
	b _080EBBBA
_080EBB90:
	lsls r4, r5, #1
	adds r0, r6, r4
	movs r1, #0
	adds r2, r5, #0
	bl memset
	adds r4, r4, r5
	adds r4, r6, r4
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl memset
	b _080EBBBA
_080EBBAC:
	lsls r0, r5, #1
	adds r0, r0, r5
	adds r0, r6, r0
	movs r1, #0
	adds r2, r5, #0
	bl memset
_080EBBBA:
	cmp r7, #1
	beq _080EBC00
	cmp r7, #1
	bgt _080EBBC8
	cmp r7, #0
	beq _080EBBD2
	b _080EBC76
_080EBBC8:
	cmp r7, #2
	beq _080EBC30
	cmp r7, #3
	beq _080EBC58
	b _080EBC76
_080EBBD2:
	adds r0, r6, r5
	str r0, [sp]
	ldr r3, _080EBBFC
	movs r4, #0xff
	ldrb r0, [r3, #0x1c]
	str r0, [sp, #4]
	lsls r1, r5, #1
	adds r0, r6, r1
	str r0, [sp, #8]
	ldrh r2, [r3, #0x38]
	adds r0, r4, #0
	ands r0, r2
	str r0, [sp, #0xc]
	adds r1, r1, r5
	adds r1, r6, r1
	str r1, [sp, #0x10]
	adds r3, #0x54
	ldrh r0, [r3]
	ands r4, r0
	str r4, [sp, #0x14]
	b _080EBC76
	.align 2, 0
_080EBBFC: .4byte 0x020226A0
_080EBC00:
	lsls r2, r5, #1
	adds r0, r6, r2
	str r0, [sp]
	ldr r4, _080EBC2C
	ldrh r3, [r4, #0x38]
	movs r1, #0xff
	adds r0, r1, #0
	ands r0, r3
	str r0, [sp, #4]
	adds r2, r2, r5
	adds r2, r6, r2
	str r2, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r2, [r0]
	adds r0, r1, #0
	ands r0, r2
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	ldrh r0, [r4]
	b _080EBC72
	.align 2, 0
_080EBC2C: .4byte 0x020226A0
_080EBC30:
	lsls r0, r5, #1
	adds r0, r0, r5
	adds r0, r6, r0
	str r0, [sp]
	ldr r1, _080EBC54
	adds r0, r1, #0
	adds r0, #0x54
	ldrb r0, [r0]
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldrb r0, [r1]
	str r0, [sp, #0xc]
	adds r0, r6, r5
	str r0, [sp, #0x10]
	ldrb r0, [r1, #0x1c]
	str r0, [sp, #0x14]
	b _080EBC76
	.align 2, 0
_080EBC54: .4byte 0x020226A0
_080EBC58:
	str r6, [sp]
	ldr r2, _080EBD14
	ldrb r0, [r2]
	str r0, [sp, #4]
	adds r0, r6, r5
	str r0, [sp, #8]
	movs r1, #0xff
	ldrb r0, [r2, #0x1c]
	str r0, [sp, #0xc]
	lsls r0, r5, #1
	adds r0, r6, r0
	str r0, [sp, #0x10]
	ldrh r0, [r2, #0x38]
_080EBC72:
	ands r1, r0
	str r1, [sp, #0x14]
_080EBC76:
	mov r0, sp
	bl sub_080EBAE0
	movs r3, #1
	ldr r6, _080EBD18
	movs r7, #0x10
	rsbs r7, r7, #0
_080EBC84:
	ldr r0, [r6]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r4, r1, #5
	adds r0, r0, r4
	ldr r5, _080EBD1C
	adds r2, r0, r5
	ldrb r1, [r2]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #1
	bne _080EBCB4
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r6]
	adds r1, r1, r4
	adds r1, r1, r5
	ldrb r2, [r1]
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r1]
_080EBCB4:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x13
	bls _080EBC84
	bl SortSecretBasesByRegistryStatus
	movs r3, #1
	ldr r7, _080EBD18
	adds r6, r7, #0
	adds r4, r5, #0
	movs r5, #0x3f
_080EBCCC:
	ldr r0, [r6]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r2, r0, r4
	ldrb r1, [r2]
	lsrs r0, r1, #6
	cmp r0, #2
	bne _080EBCE6
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2]
_080EBCE6:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x13
	bls _080EBCCC
	ldr r1, [r7]
	ldr r2, _080EBD20
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080EBD0C
	ldr r0, _080EBD24
	adds r2, r1, r0
	ldrh r1, [r2]
	ldr r0, _080EBD28
	cmp r1, r0
	beq _080EBD0C
	adds r0, r1, #1
	strh r0, [r2]
_080EBD0C:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EBD14: .4byte 0x020226A0
_080EBD18: .4byte 0x03005AEC
_080EBD1C: .4byte 0x00001A9D
_080EBD20: .4byte 0x00001A9C
_080EBD24: .4byte 0x00001AAA
_080EBD28: .4byte 0x0000FFFF
	thumb_func_end ReceiveSecretBasesData

	thumb_func_start ClearJapaneseSecretBases
ClearJapaneseSecretBases: @ 0x080EBD2C
	push {r4, r5, lr}
	movs r5, #0
	adds r4, r0, #0
_080EBD32:
	ldrb r0, [r4, #0xd]
	cmp r0, #1
	beq _080EBD3E
	adds r0, r4, #0
	bl ClearSecretBase
_080EBD3E:
	adds r4, #0xa0
	adds r5, #1
	cmp r5, #0x13
	bls _080EBD32
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end ClearJapaneseSecretBases

	thumb_func_start sub_080EBD4C
sub_080EBD4C: @ 0x080EBD4C
	push {lr}
	ldr r0, _080EBD84
	movs r1, #0
	bl VarSet
	ldr r0, _080EBD88
	movs r1, #0
	bl VarSet
	ldr r0, _080EBD8C
	movs r1, #0
	bl VarSet
	ldr r0, _080EBD90
	movs r1, #0
	bl VarSet
	ldr r0, _080EBD94
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EBD9C
	ldr r0, _080EBD98
	movs r1, #1
	bl VarSet
	b _080EBDA4
	.align 2, 0
_080EBD84: .4byte 0x000040EC
_080EBD88: .4byte 0x000040ED
_080EBD8C: .4byte 0x000040EE
_080EBD90: .4byte 0x000040EF
_080EBD94: .4byte 0x00004054
_080EBD98: .4byte 0x000040F0
_080EBD9C:
	ldr r0, _080EBDB0
	movs r1, #0
	bl VarSet
_080EBDA4:
	ldr r1, _080EBDB4
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080EBDB0: .4byte 0x000040F0
_080EBDB4: .4byte 0x02039CE9
	thumb_func_end sub_080EBD4C

	thumb_func_start sub_080EBDB8
sub_080EBDB8: @ 0x080EBDB8
	push {r4, r5, r6, lr}
	ldr r5, _080EBE18
	adds r0, r5, #0
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EBE12
	ldr r6, _080EBE1C
	ldrb r0, [r6]
	cmp r0, #1
	bne _080EBE12
	bl CurMapIsSecretBase
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080EBE12
	adds r0, r5, #0
	movs r1, #0
	bl VarSet
	strb r4, [r6]
	bl sub_080EF588
	ldr r0, _080EBE20
	movs r1, #0
	bl VarSet
	ldr r0, _080EBE24
	movs r1, #0
	bl VarSet
	ldr r0, _080EBE28
	movs r1, #0
	bl VarSet
	ldr r0, _080EBE2C
	movs r1, #0
	bl VarSet
	adds r0, r5, #0
	movs r1, #0
	bl VarSet
_080EBE12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EBE18: .4byte 0x000040F0
_080EBE1C: .4byte 0x02039CE9
_080EBE20: .4byte 0x000040EC
_080EBE24: .4byte 0x000040ED
_080EBE28: .4byte 0x000040EE
_080EBE2C: .4byte 0x000040EF
	thumb_func_end sub_080EBDB8

	thumb_func_start sub_080EBE30
sub_080EBE30: @ 0x080EBE30
	push {r4, lr}
	ldr r0, _080EBE60
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EBE5A
	ldr r4, _080EBE64
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080EBE5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EBE60: .4byte 0x00004054
_080EBE64: .4byte 0x000040EF
	thumb_func_end sub_080EBE30

	thumb_func_start sub_080EBE68
sub_080EBE68: @ 0x080EBE68
	push {r4, lr}
	ldr r0, _080EBE98
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EBE92
	ldr r4, _080EBE9C
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080EBE92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EBE98: .4byte 0x00004054
_080EBE9C: .4byte 0x000040EE
	thumb_func_end sub_080EBE68

	thumb_func_start sub_080EBEA0
sub_080EBEA0: @ 0x080EBEA0
	push {r4, r5, lr}
	ldr r0, _080EBEF4
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EBEEC
	ldr r5, _080EBEF8
	adds r0, r5, #0
	bl VarGet
	ldr r1, _080EBEFC
	ands r1, r0
	adds r0, r5, #0
	bl VarSet
	ldr r4, _080EBF00
	adds r0, r4, #0
	bl VarGet
	ldr r1, _080EBF04
	ands r1, r0
	adds r0, r4, #0
	bl VarSet
	adds r0, r5, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	bl VarSet
_080EBEEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EBEF4: .4byte 0x00004054
_080EBEF8: .4byte 0x000040EE
_080EBEFC: .4byte 0x0000C7FF
_080EBF00: .4byte 0x000040EF
_080EBF04: .4byte 0x0000FFFE
	thumb_func_end sub_080EBEA0

	thumb_func_start sub_080EBF08
sub_080EBF08: @ 0x080EBF08
	push {r4, r5, lr}
	ldr r0, _080EBF5C
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EBF54
	ldr r5, _080EBF60
	adds r0, r5, #0
	bl VarGet
	ldr r1, _080EBF64
	ands r1, r0
	adds r0, r5, #0
	bl VarSet
	ldr r4, _080EBF68
	adds r0, r4, #0
	bl VarGet
	ldr r1, _080EBF6C
	ands r1, r0
	adds r0, r4, #0
	bl VarSet
	adds r0, r5, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	bl VarSet
_080EBF54:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EBF5C: .4byte 0x00004054
_080EBF60: .4byte 0x000040EE
_080EBF64: .4byte 0x0000C7FF
_080EBF68: .4byte 0x000040EF
_080EBF6C: .4byte 0x0000FFFE
	thumb_func_end sub_080EBF08

	thumb_func_start CopyCurSecretBaseOwnerName_StrVar1
CopyCurSecretBaseOwnerName_StrVar1: @ 0x080EBF70
	push {r4, r5, lr}
	ldr r0, _080EBFC4
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EBFBC
	ldr r5, _080EBFC8
	adds r0, r5, #0
	bl VarGet
	ldr r1, _080EBFCC
	ands r1, r0
	adds r0, r5, #0
	bl VarSet
	ldr r4, _080EBFD0
	adds r0, r4, #0
	bl VarGet
	ldr r1, _080EBFD4
	ands r1, r0
	adds r0, r4, #0
	bl VarSet
	adds r0, r5, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	bl VarSet
_080EBFBC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EBFC4: .4byte 0x00004054
_080EBFC8: .4byte 0x000040EE
_080EBFCC: .4byte 0x0000C7FF
_080EBFD0: .4byte 0x000040EF
_080EBFD4: .4byte 0x0000FFFE
	thumb_func_end CopyCurSecretBaseOwnerName_StrVar1

	thumb_func_start GetSecretBaseName
GetSecretBaseName: @ 0x080EBFD8
	push {r4, lr}
	ldr r0, _080EC028
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EC020
	ldr r4, _080EC02C
	adds r0, r4, #0
	bl VarGet
	ldr r1, _080EC030
	ands r1, r0
	adds r0, r4, #0
	bl VarSet
	adds r4, #1
	adds r0, r4, #0
	bl VarGet
	ldr r1, _080EC034
	ands r1, r0
	adds r0, r4, #0
	bl VarSet
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #1
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080EC020:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC028: .4byte 0x00004054
_080EC02C: .4byte 0x000040EE
_080EC030: .4byte 0x0000C7FF
_080EC034: .4byte 0x0000FFFE
	thumb_func_end GetSecretBaseName

	thumb_func_start SetSecretBaseSecretsTvFlags_Poster
SetSecretBaseSecretsTvFlags_Poster: @ 0x080EC038
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _080EC068
	adds r0, r0, r1
	cmp r0, #0x18
	bhi _080EC0FC
	lsls r0, r0, #2
	ldr r1, _080EC06C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EC068: .4byte 0xFFFFFCE4
_080EC06C: .4byte 0x080EC070
_080EC070: @ jump table
	.4byte _080EC0D4 @ case 0
	.4byte _080EC0D4 @ case 1
	.4byte _080EC0D4 @ case 2
	.4byte _080EC0D4 @ case 3
	.4byte _080EC0FC @ case 4
	.4byte _080EC0FC @ case 5
	.4byte _080EC0FC @ case 6
	.4byte _080EC0FC @ case 7
	.4byte _080EC0D4 @ case 8
	.4byte _080EC0D4 @ case 9
	.4byte _080EC0D4 @ case 10
	.4byte _080EC0D4 @ case 11
	.4byte _080EC0FC @ case 12
	.4byte _080EC0FC @ case 13
	.4byte _080EC0FC @ case 14
	.4byte _080EC0FC @ case 15
	.4byte _080EC0D4 @ case 16
	.4byte _080EC0D4 @ case 17
	.4byte _080EC0FC @ case 18
	.4byte _080EC0FC @ case 19
	.4byte _080EC0D4 @ case 20
	.4byte _080EC0D4 @ case 21
	.4byte _080EC0D4 @ case 22
	.4byte _080EC0D4 @ case 23
	.4byte _080EC0D4 @ case 24
_080EC0D4:
	ldr r0, _080EC104
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EC0FC
	ldr r4, _080EC108
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080EC0FC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC104: .4byte 0x00004054
_080EC108: .4byte 0x000040EE
	thumb_func_end SetSecretBaseSecretsTvFlags_Poster

	thumb_func_start SetSecretBaseSecretsTvFlags_MiscFurnature
SetSecretBaseSecretsTvFlags_MiscFurnature: @ 0x080EC10C
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _080EC140
	adds r0, r0, r1
	cmp r0, #0xcf
	bls _080EC134
	b _080EC570
_080EC134:
	lsls r0, r0, #2
	ldr r1, _080EC144
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EC140: .4byte 0xFFFFFDD4
_080EC144: .4byte 0x080EC148
_080EC148: @ jump table
	.4byte _080EC4D0 @ case 0
	.4byte _080EC51C @ case 1
	.4byte _080EC51C @ case 2
	.4byte _080EC51C @ case 3
	.4byte _080EC570 @ case 4
	.4byte _080EC570 @ case 5
	.4byte _080EC570 @ case 6
	.4byte _080EC4D0 @ case 7
	.4byte _080EC570 @ case 8
	.4byte _080EC570 @ case 9
	.4byte _080EC570 @ case 10
	.4byte _080EC570 @ case 11
	.4byte _080EC570 @ case 12
	.4byte _080EC570 @ case 13
	.4byte _080EC570 @ case 14
	.4byte _080EC570 @ case 15
	.4byte _080EC570 @ case 16
	.4byte _080EC570 @ case 17
	.4byte _080EC570 @ case 18
	.4byte _080EC570 @ case 19
	.4byte _080EC570 @ case 20
	.4byte _080EC570 @ case 21
	.4byte _080EC570 @ case 22
	.4byte _080EC570 @ case 23
	.4byte _080EC570 @ case 24
	.4byte _080EC570 @ case 25
	.4byte _080EC570 @ case 26
	.4byte _080EC570 @ case 27
	.4byte _080EC570 @ case 28
	.4byte _080EC570 @ case 29
	.4byte _080EC570 @ case 30
	.4byte _080EC570 @ case 31
	.4byte _080EC570 @ case 32
	.4byte _080EC570 @ case 33
	.4byte _080EC570 @ case 34
	.4byte _080EC570 @ case 35
	.4byte _080EC570 @ case 36
	.4byte _080EC570 @ case 37
	.4byte _080EC570 @ case 38
	.4byte _080EC570 @ case 39
	.4byte _080EC570 @ case 40
	.4byte _080EC570 @ case 41
	.4byte _080EC570 @ case 42
	.4byte _080EC570 @ case 43
	.4byte _080EC570 @ case 44
	.4byte _080EC570 @ case 45
	.4byte _080EC570 @ case 46
	.4byte _080EC570 @ case 47
	.4byte _080EC570 @ case 48
	.4byte _080EC570 @ case 49
	.4byte _080EC570 @ case 50
	.4byte _080EC570 @ case 51
	.4byte _080EC570 @ case 52
	.4byte _080EC570 @ case 53
	.4byte _080EC570 @ case 54
	.4byte _080EC570 @ case 55
	.4byte _080EC570 @ case 56
	.4byte _080EC570 @ case 57
	.4byte _080EC570 @ case 58
	.4byte _080EC570 @ case 59
	.4byte _080EC570 @ case 60
	.4byte _080EC570 @ case 61
	.4byte _080EC570 @ case 62
	.4byte _080EC570 @ case 63
	.4byte _080EC570 @ case 64
	.4byte _080EC570 @ case 65
	.4byte _080EC570 @ case 66
	.4byte _080EC570 @ case 67
	.4byte _080EC570 @ case 68
	.4byte _080EC570 @ case 69
	.4byte _080EC570 @ case 70
	.4byte _080EC570 @ case 71
	.4byte _080EC570 @ case 72
	.4byte _080EC570 @ case 73
	.4byte _080EC570 @ case 74
	.4byte _080EC570 @ case 75
	.4byte _080EC570 @ case 76
	.4byte _080EC570 @ case 77
	.4byte _080EC570 @ case 78
	.4byte _080EC570 @ case 79
	.4byte _080EC570 @ case 80
	.4byte _080EC570 @ case 81
	.4byte _080EC570 @ case 82
	.4byte _080EC570 @ case 83
	.4byte _080EC570 @ case 84
	.4byte _080EC570 @ case 85
	.4byte _080EC570 @ case 86
	.4byte _080EC570 @ case 87
	.4byte _080EC570 @ case 88
	.4byte _080EC570 @ case 89
	.4byte _080EC570 @ case 90
	.4byte _080EC54C @ case 91
	.4byte _080EC4F4 @ case 92
	.4byte _080EC4F4 @ case 93
	.4byte _080EC488 @ case 94
	.4byte _080EC488 @ case 95
	.4byte _080EC570 @ case 96
	.4byte _080EC570 @ case 97
	.4byte _080EC570 @ case 98
	.4byte _080EC54C @ case 99
	.4byte _080EC570 @ case 100
	.4byte _080EC570 @ case 101
	.4byte _080EC570 @ case 102
	.4byte _080EC570 @ case 103
	.4byte _080EC570 @ case 104
	.4byte _080EC570 @ case 105
	.4byte _080EC570 @ case 106
	.4byte _080EC570 @ case 107
	.4byte _080EC54C @ case 108
	.4byte _080EC54C @ case 109
	.4byte _080EC54C @ case 110
	.4byte _080EC54C @ case 111
	.4byte _080EC54C @ case 112
	.4byte _080EC54C @ case 113
	.4byte _080EC54C @ case 114
	.4byte _080EC54C @ case 115
	.4byte _080EC570 @ case 116
	.4byte _080EC570 @ case 117
	.4byte _080EC570 @ case 118
	.4byte _080EC570 @ case 119
	.4byte _080EC570 @ case 120
	.4byte _080EC570 @ case 121
	.4byte _080EC570 @ case 122
	.4byte _080EC570 @ case 123
	.4byte _080EC570 @ case 124
	.4byte _080EC570 @ case 125
	.4byte _080EC570 @ case 126
	.4byte _080EC54C @ case 127
	.4byte _080EC570 @ case 128
	.4byte _080EC570 @ case 129
	.4byte _080EC570 @ case 130
	.4byte _080EC570 @ case 131
	.4byte _080EC54C @ case 132
	.4byte _080EC54C @ case 133
	.4byte _080EC54C @ case 134
	.4byte _080EC570 @ case 135
	.4byte _080EC54C @ case 136
	.4byte _080EC54C @ case 137
	.4byte _080EC54C @ case 138
	.4byte _080EC54C @ case 139
	.4byte _080EC570 @ case 140
	.4byte _080EC570 @ case 141
	.4byte _080EC570 @ case 142
	.4byte _080EC570 @ case 143
	.4byte _080EC570 @ case 144
	.4byte _080EC570 @ case 145
	.4byte _080EC570 @ case 146
	.4byte _080EC570 @ case 147
	.4byte _080EC570 @ case 148
	.4byte _080EC570 @ case 149
	.4byte _080EC570 @ case 150
	.4byte _080EC570 @ case 151
	.4byte _080EC570 @ case 152
	.4byte _080EC570 @ case 153
	.4byte _080EC570 @ case 154
	.4byte _080EC570 @ case 155
	.4byte _080EC570 @ case 156
	.4byte _080EC570 @ case 157
	.4byte _080EC570 @ case 158
	.4byte _080EC54C @ case 159
	.4byte _080EC54C @ case 160
	.4byte _080EC54C @ case 161
	.4byte _080EC54C @ case 162
	.4byte _080EC54C @ case 163
	.4byte _080EC570 @ case 164
	.4byte _080EC570 @ case 165
	.4byte _080EC570 @ case 166
	.4byte _080EC570 @ case 167
	.4byte _080EC570 @ case 168
	.4byte _080EC570 @ case 169
	.4byte _080EC570 @ case 170
	.4byte _080EC570 @ case 171
	.4byte _080EC4AC @ case 172
	.4byte _080EC4AC @ case 173
	.4byte _080EC4AC @ case 174
	.4byte _080EC4AC @ case 175
	.4byte _080EC4AC @ case 176
	.4byte _080EC4AC @ case 177
	.4byte _080EC570 @ case 178
	.4byte _080EC570 @ case 179
	.4byte _080EC570 @ case 180
	.4byte _080EC570 @ case 181
	.4byte _080EC570 @ case 182
	.4byte _080EC570 @ case 183
	.4byte _080EC570 @ case 184
	.4byte _080EC570 @ case 185
	.4byte _080EC570 @ case 186
	.4byte _080EC570 @ case 187
	.4byte _080EC4AC @ case 188
	.4byte _080EC4AC @ case 189
	.4byte _080EC4AC @ case 190
	.4byte _080EC4AC @ case 191
	.4byte _080EC4AC @ case 192
	.4byte _080EC4AC @ case 193
	.4byte _080EC4AC @ case 194
	.4byte _080EC4AC @ case 195
	.4byte _080EC570 @ case 196
	.4byte _080EC570 @ case 197
	.4byte _080EC570 @ case 198
	.4byte _080EC570 @ case 199
	.4byte _080EC570 @ case 200
	.4byte _080EC570 @ case 201
	.4byte _080EC570 @ case 202
	.4byte _080EC570 @ case 203
	.4byte _080EC4AC @ case 204
	.4byte _080EC4AC @ case 205
	.4byte _080EC4AC @ case 206
	.4byte _080EC4AC @ case 207
_080EC488:
	ldr r0, _080EC4A4
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EC570
	ldr r4, _080EC4A8
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x40
	b _080EC534
	.align 2, 0
_080EC4A4: .4byte 0x00004054
_080EC4A8: .4byte 0x000040EE
_080EC4AC:
	ldr r0, _080EC4C8
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EC570
	ldr r4, _080EC4CC
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #8
	b _080EC534
	.align 2, 0
_080EC4C8: .4byte 0x00004054
_080EC4CC: .4byte 0x000040EE
_080EC4D0:
	ldr r0, _080EC4EC
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EC570
	ldr r4, _080EC4F0
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x40
	b _080EC534
	.align 2, 0
_080EC4EC: .4byte 0x00004054
_080EC4F0: .4byte 0x000040EF
_080EC4F4:
	ldr r0, _080EC514
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EC570
	ldr r4, _080EC518
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	b _080EC534
	.align 2, 0
_080EC514: .4byte 0x00004054
_080EC518: .4byte 0x000040EF
_080EC51C:
	ldr r0, _080EC544
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EC570
	ldr r4, _080EC548
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x10
_080EC534:
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	b _080EC570
	.align 2, 0
_080EC544: .4byte 0x00004054
_080EC548: .4byte 0x000040EF
_080EC54C:
	ldr r0, _080EC578
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EC570
	ldr r4, _080EC57C
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080EC570:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC578: .4byte 0x00004054
_080EC57C: .4byte 0x000040EF
	thumb_func_end SetSecretBaseSecretsTvFlags_MiscFurnature

	thumb_func_start SetSecretBaseSecretsTvFlags_LargeDecorationSpot
SetSecretBaseSecretsTvFlags_LargeDecorationSpot: @ 0x080EC580
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _080EC5B4
	adds r0, r0, r1
	cmp r0, #0x35
	bls _080EC5A8
	b _080EC6B8
_080EC5A8:
	lsls r0, r0, #2
	ldr r1, _080EC5B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EC5B4: .4byte 0xFFFFFD6F
_080EC5B8: .4byte 0x080EC5BC
_080EC5BC: @ jump table
	.4byte _080EC694 @ case 0
	.4byte _080EC6B8 @ case 1
	.4byte _080EC6B8 @ case 2
	.4byte _080EC694 @ case 3
	.4byte _080EC6B8 @ case 4
	.4byte _080EC6B8 @ case 5
	.4byte _080EC694 @ case 6
	.4byte _080EC6B8 @ case 7
	.4byte _080EC6B8 @ case 8
	.4byte _080EC6B8 @ case 9
	.4byte _080EC6B8 @ case 10
	.4byte _080EC6B8 @ case 11
	.4byte _080EC6B8 @ case 12
	.4byte _080EC6B8 @ case 13
	.4byte _080EC6B8 @ case 14
	.4byte _080EC6B8 @ case 15
	.4byte _080EC694 @ case 16
	.4byte _080EC6B8 @ case 17
	.4byte _080EC6B8 @ case 18
	.4byte _080EC6B8 @ case 19
	.4byte _080EC694 @ case 20
	.4byte _080EC6B8 @ case 21
	.4byte _080EC6B8 @ case 22
	.4byte _080EC6B8 @ case 23
	.4byte _080EC694 @ case 24
	.4byte _080EC6B8 @ case 25
	.4byte _080EC6B8 @ case 26
	.4byte _080EC6B8 @ case 27
	.4byte _080EC694 @ case 28
	.4byte _080EC6B8 @ case 29
	.4byte _080EC6B8 @ case 30
	.4byte _080EC6B8 @ case 31
	.4byte _080EC6B8 @ case 32
	.4byte _080EC6B8 @ case 33
	.4byte _080EC6B8 @ case 34
	.4byte _080EC6B8 @ case 35
	.4byte _080EC6B8 @ case 36
	.4byte _080EC6B8 @ case 37
	.4byte _080EC6B8 @ case 38
	.4byte _080EC6B8 @ case 39
	.4byte _080EC6B8 @ case 40
	.4byte _080EC6B8 @ case 41
	.4byte _080EC694 @ case 42
	.4byte _080EC6B8 @ case 43
	.4byte _080EC6B8 @ case 44
	.4byte _080EC694 @ case 45
	.4byte _080EC6B8 @ case 46
	.4byte _080EC6B8 @ case 47
	.4byte _080EC6B8 @ case 48
	.4byte _080EC6B8 @ case 49
	.4byte _080EC694 @ case 50
	.4byte _080EC6B8 @ case 51
	.4byte _080EC6B8 @ case 52
	.4byte _080EC694 @ case 53
_080EC694:
	ldr r0, _080EC6C0
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080EC6B8
	ldr r4, _080EC6C4
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080EC6B8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC6C0: .4byte 0x00004054
_080EC6C4: .4byte 0x000040EF
	thumb_func_end SetSecretBaseSecretsTvFlags_LargeDecorationSpot

	thumb_func_start SetSecretBaseSecretsTvFlags_SmallDecorationSpot
SetSecretBaseSecretsTvFlags_SmallDecorationSpot: @ 0x080EC6C8
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _080EC6FC
	adds r0, r0, r1
	cmp r0, #0xa2
	bls _080EC6F0
	b _080ECA0C
_080EC6F0:
	lsls r0, r0, #2
	ldr r1, _080EC700
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EC6FC: .4byte 0xFFFFFDDB
_080EC700: .4byte 0x080EC704
_080EC704: @ jump table
	.4byte _080EC9E8 @ case 0
	.4byte _080EC9E8 @ case 1
	.4byte _080EC9E8 @ case 2
	.4byte _080ECA0C @ case 3
	.4byte _080ECA0C @ case 4
	.4byte _080ECA0C @ case 5
	.4byte _080ECA0C @ case 6
	.4byte _080ECA0C @ case 7
	.4byte _080ECA0C @ case 8
	.4byte _080ECA0C @ case 9
	.4byte _080ECA0C @ case 10
	.4byte _080ECA0C @ case 11
	.4byte _080ECA0C @ case 12
	.4byte _080ECA0C @ case 13
	.4byte _080ECA0C @ case 14
	.4byte _080ECA0C @ case 15
	.4byte _080ECA0C @ case 16
	.4byte _080ECA0C @ case 17
	.4byte _080ECA0C @ case 18
	.4byte _080ECA0C @ case 19
	.4byte _080ECA0C @ case 20
	.4byte _080ECA0C @ case 21
	.4byte _080ECA0C @ case 22
	.4byte _080ECA0C @ case 23
	.4byte _080ECA0C @ case 24
	.4byte _080ECA0C @ case 25
	.4byte _080ECA0C @ case 26
	.4byte _080ECA0C @ case 27
	.4byte _080ECA0C @ case 28
	.4byte _080ECA0C @ case 29
	.4byte _080ECA0C @ case 30
	.4byte _080ECA0C @ case 31
	.4byte _080ECA0C @ case 32
	.4byte _080ECA0C @ case 33
	.4byte _080ECA0C @ case 34
	.4byte _080ECA0C @ case 35
	.4byte _080ECA0C @ case 36
	.4byte _080ECA0C @ case 37
	.4byte _080ECA0C @ case 38
	.4byte _080ECA0C @ case 39
	.4byte _080ECA0C @ case 40
	.4byte _080ECA0C @ case 41
	.4byte _080ECA0C @ case 42
	.4byte _080ECA0C @ case 43
	.4byte _080ECA0C @ case 44
	.4byte _080ECA0C @ case 45
	.4byte _080ECA0C @ case 46
	.4byte _080ECA0C @ case 47
	.4byte _080ECA0C @ case 48
	.4byte _080ECA0C @ case 49
	.4byte _080ECA0C @ case 50
	.4byte _080ECA0C @ case 51
	.4byte _080ECA0C @ case 52
	.4byte _080ECA0C @ case 53
	.4byte _080ECA0C @ case 54
	.4byte _080ECA0C @ case 55
	.4byte _080ECA0C @ case 56
	.4byte _080ECA0C @ case 57
	.4byte _080ECA0C @ case 58
	.4byte _080ECA0C @ case 59
	.4byte _080ECA0C @ case 60
	.4byte _080ECA0C @ case 61
	.4byte _080ECA0C @ case 62
	.4byte _080ECA0C @ case 63
	.4byte _080ECA0C @ case 64
	.4byte _080ECA0C @ case 65
	.4byte _080ECA0C @ case 66
	.4byte _080ECA0C @ case 67
	.4byte _080ECA0C @ case 68
	.4byte _080ECA0C @ case 69
	.4byte _080ECA0C @ case 70
	.4byte _080ECA0C @ case 71
	.4byte _080ECA0C @ case 72
	.4byte _080ECA0C @ case 73
	.4byte _080ECA0C @ case 74
	.4byte _080ECA0C @ case 75
	.4byte _080ECA0C @ case 76
	.4byte _080ECA0C @ case 77
	.4byte _080ECA0C @ case 78
	.4byte _080ECA0C @ case 79
	.4byte _080ECA0C @ case 80
	.4byte _080ECA0C @ case 81
	.4byte _080ECA0C @ case 82
	.4byte _080ECA0C @ case 83
	.4byte _080ECA0C @ case 84
	.4byte _080ECA0C @ case 85
	.4byte _080ECA0C @ case 86
	.4byte _080ECA0C @ case 87
	.4byte _080ECA0C @ case 88
	.4byte _080ECA0C @ case 89
	.4byte _080ECA0C @ case 90
	.4byte _080EC9B4 @ case 91
	.4byte _080EC9B4 @ case 92
	.4byte _080ECA0C @ case 93
	.4byte _080ECA0C @ case 94
	.4byte _080ECA0C @ case 95
	.4byte _080ECA0C @ case 96
	.4byte _080ECA0C @ case 97
	.4byte _080ECA0C @ case 98
	.4byte _080ECA0C @ case 99
	.4byte _080ECA0C @ case 100
	.4byte _080ECA0C @ case 101
	.4byte _080ECA0C @ case 102
	.4byte _080ECA0C @ case 103
	.4byte _080ECA0C @ case 104
	.4byte _080ECA0C @ case 105
	.4byte _080ECA0C @ case 106
	.4byte _080EC990 @ case 107
	.4byte _080ECA0C @ case 108
	.4byte _080EC990 @ case 109
	.4byte _080EC990 @ case 110
	.4byte _080ECA0C @ case 111
	.4byte _080EC990 @ case 112
	.4byte _080EC990 @ case 113
	.4byte _080ECA0C @ case 114
	.4byte _080ECA0C @ case 115
	.4byte _080ECA0C @ case 116
	.4byte _080ECA0C @ case 117
	.4byte _080ECA0C @ case 118
	.4byte _080ECA0C @ case 119
	.4byte _080ECA0C @ case 120
	.4byte _080ECA0C @ case 121
	.4byte _080ECA0C @ case 122
	.4byte _080EC990 @ case 123
	.4byte _080ECA0C @ case 124
	.4byte _080EC990 @ case 125
	.4byte _080EC990 @ case 126
	.4byte _080EC990 @ case 127
	.4byte _080ECA0C @ case 128
	.4byte _080EC990 @ case 129
	.4byte _080EC990 @ case 130
	.4byte _080EC990 @ case 131
	.4byte _080ECA0C @ case 132
	.4byte _080EC990 @ case 133
	.4byte _080ECA0C @ case 134
	.4byte _080EC990 @ case 135
	.4byte _080ECA0C @ case 136
	.4byte _080EC990 @ case 137
	.4byte _080EC990 @ case 138
	.4byte _080ECA0C @ case 139
	.4byte _080ECA0C @ case 140
	.4byte _080ECA0C @ case 141
	.4byte _080ECA0C @ case 142
	.4byte _080ECA0C @ case 143
	.4byte _080ECA0C @ case 144
	.4byte _080ECA0C @ case 145
	.4byte _080ECA0C @ case 146
	.4byte _080ECA0C @ case 147
	.4byte _080ECA0C @ case 148
	.4byte _080ECA0C @ case 149
	.4byte _080ECA0C @ case 150
	.4byte _080EC990 @ case 151
	.4byte _080EC990 @ case 152
	.4byte _080ECA0C @ case 153
	.4byte _080EC990 @ case 154
	.4byte _080ECA0C @ case 155
	.4byte _080ECA0C @ case 156
	.4byte _080ECA0C @ case 157
	.4byte _080ECA0C @ case 158
	.4byte _080EC990 @ case 159
	.4byte _080EC990 @ case 160
	.4byte _080ECA0C @ case 161
	.4byte _080EC990 @ case 162
_080EC990:
	ldr r0, _080EC9AC
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080ECA0C
	ldr r4, _080EC9B0
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #8
	b _080EC9D0
	.align 2, 0
_080EC9AC: .4byte 0x00004054
_080EC9B0: .4byte 0x000040EF
_080EC9B4:
	ldr r0, _080EC9E0
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080ECA0C
	ldr r4, _080EC9E4
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_080EC9D0:
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	b _080ECA0C
	.align 2, 0
_080EC9E0: .4byte 0x00004054
_080EC9E4: .4byte 0x000040EF
_080EC9E8:
	ldr r0, _080ECA14
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080ECA0C
	ldr r4, _080ECA18
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x10
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080ECA0C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ECA14: .4byte 0x00004054
_080ECA18: .4byte 0x000040EF
	thumb_func_end SetSecretBaseSecretsTvFlags_SmallDecorationSpot

	thumb_func_start SetSecretBaseSecretsTvFlags_SandOrnament
SetSecretBaseSecretsTvFlags_SandOrnament: @ 0x080ECA1C
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	ldr r0, _080ECA74
	cmp r1, r0
	bgt _080ECA6C
	subs r0, #1
	cmp r1, r0
	blt _080ECA6C
	ldr r0, _080ECA78
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080ECA6C
	ldr r4, _080ECA7C
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #4
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080ECA6C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ECA74: .4byte 0x0000028E
_080ECA78: .4byte 0x00004054
_080ECA7C: .4byte 0x000040EF
	thumb_func_end SetSecretBaseSecretsTvFlags_SandOrnament

