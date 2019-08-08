.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetMewEventObjectId
GetMewEventObjectId: @ 0x081D38D8
	push {lr}
	sub sp, #4
	ldr r0, _081D38F8
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r0, #1
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	mov r0, sp
	ldrb r0, [r0]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_081D38F8: .4byte 0x03005AEC
	thumb_func_end GetMewEventObjectId

	thumb_func_start GetMewMoveDirection
GetMewMoveDirection: @ 0x081D38FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl GetMewEventObjectId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _081D39A0
	adds r5, r1, r2
	ldr r4, _081D39A4
	ldr r3, _081D39A8
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x14]
	ldrh r1, [r5, #0x10]
	subs r0, r0, r1
	strh r0, [r4]
	ldr r4, _081D39AC
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x16]
	ldrh r1, [r5, #0x12]
	subs r0, r0, r1
	strh r0, [r4]
	movs r0, #0
	mov r8, r0
	ldr r2, _081D39B0
	movs r1, #0
_081D394A:
	mov r3, r8
	adds r0, r3, r2
	strb r1, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bls _081D394A
	ldr r2, _081D39A0
	ldr r0, _081D39A8
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	movs r6, #0x10
	ldrsh r0, [r2, r6]
	cmp r1, r0
	bne _081D3984
	movs r0, #0x16
	ldrsh r1, [r2, r0]
	movs r3, #0x12
	ldrsh r0, [r2, r3]
	cmp r1, r0
	beq _081D39D6
_081D3984:
	ldr r0, _081D39B4
	bl VarGet
	lsls r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r1, r0
	cmp r1, #0
	bne _081D39B8
	ldrb r1, [r5, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	b _081D39BE
	.align 2, 0
_081D39A0: .4byte 0x02036FF0
_081D39A4: .4byte 0x030012F0
_081D39A8: .4byte 0x02037230
_081D39AC: .4byte 0x030012F2
_081D39B0: .4byte 0x030012F4
_081D39B4: .4byte 0x0000403A
_081D39B8:
	ldrb r0, [r5, #1]
	movs r1, #0x20
	orrs r0, r1
_081D39BE:
	strb r0, [r5, #1]
	ldr r0, _081D39DC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #9
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081D39E0
_081D39D6:
	movs r0, #0
	b _081D3E96
	.align 2, 0
_081D39DC: .4byte 0x0000403A
_081D39E0:
	movs r4, #0
	mov r8, r4
	ldr r6, _081D3A30
	mov sl, r6
_081D39E8:
	ldr r3, _081D3A34
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sl
	adds r4, r0, r1
	mov r2, r8
	lsls r1, r2, #2
	ldr r6, _081D3A38
	adds r0, r1, r6
	movs r6, #0x14
	ldrsh r2, [r4, r6]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _081D3A30
	mov sb, r6
	mov ip, r3
	adds r7, r1, #0
	cmp r2, r0
	beq _081D3A14
	b _081D3B1E
_081D3A14:
	movs r3, #0
	ldr r1, _081D3A3C
	adds r0, r7, r1
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	movs r4, #0
	ldrsh r2, [r0, r4]
	cmp r1, r2
	bge _081D3A40
	movs r6, #0x12
	ldrsh r0, [r5, r6]
	cmp r0, r2
	bgt _081D3A4A
	b _081D3B1E
	.align 2, 0
_081D3A30: .4byte 0x02036FF0
_081D3A34: .4byte 0x02037230
_081D3A38: .4byte 0x085FAF28
_081D3A3C: .4byte 0x085FAF2A
_081D3A40:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, r2
	blt _081D3A4A
	movs r3, #1
_081D3A4A:
	cmp r3, #0
	bne _081D3B1E
	ldr r0, _081D3A8C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	ble _081D3A90
	movs r3, #0x10
	ldrsh r2, [r5, r3]
	adds r2, #1
	mov r4, ip
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	movs r6, #0x14
	ldrsh r0, [r0, r6]
	cmp r2, r0
	bne _081D3AC6
	ldrh r0, [r5, #0x10]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3AC6
_081D3A88:
	movs r0, #4
	b _081D3E96
	.align 2, 0
_081D3A8C: .4byte 0x030012F0
_081D3A90:
	cmp r0, #0
	bge _081D3AC6
	movs r3, #0x10
	ldrsh r2, [r5, r3]
	subs r2, #1
	mov r4, ip
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	movs r6, #0x14
	ldrsh r0, [r0, r6]
	cmp r2, r0
	bne _081D3AC6
	ldrh r0, [r5, #0x10]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3AC6
	b _081D3C2A
_081D3AC6:
	ldr r0, _081D3B00
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	movs r4, #0x14
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne _081D3B1E
	ldr r0, _081D3B04
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, #0
	ble _081D3B08
	adds r0, r1, #0
	ldrh r1, [r5, #0x12]
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3B1E
_081D3AFC:
	movs r0, #2
	b _081D3E96
	.align 2, 0
_081D3B00: .4byte 0x02037230
_081D3B04: .4byte 0x030012F2
_081D3B08:
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	ldrh r1, [r5, #0x12]
	adds r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D3BB8
_081D3B1E:
	ldr r2, _081D3B60
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r3, sl
	adds r4, r0, r3
	ldr r6, _081D3B64
	ldr r1, _081D3B68
	adds r0, r7, r1
	movs r3, #0x16
	ldrsh r1, [r4, r3]
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r3, _081D3B6C
	mov sb, r3
	mov ip, r2
	cmp r1, r0
	beq _081D3B46
	b _081D3C50
_081D3B46:
	movs r3, #0
	adds r0, r7, r6
	movs r6, #0x14
	ldrsh r1, [r4, r6]
	movs r4, #0
	ldrsh r2, [r0, r4]
	cmp r1, r2
	bge _081D3B70
	movs r6, #0x10
	ldrsh r0, [r5, r6]
	cmp r0, r2
	bgt _081D3B7A
	b _081D3C50
	.align 2, 0
_081D3B60: .4byte 0x02037230
_081D3B64: .4byte 0x085FAF28
_081D3B68: .4byte 0x085FAF2A
_081D3B6C: .4byte 0x02036FF0
_081D3B70:
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r0, r2
	blt _081D3B7A
	movs r3, #1
_081D3B7A:
	cmp r3, #0
	bne _081D3C50
	ldr r0, _081D3BBC
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	ble _081D3BC0
	movs r3, #0x12
	ldrsh r2, [r5, r3]
	adds r2, #1
	mov r4, ip
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	movs r6, #0x16
	ldrsh r0, [r0, r6]
	cmp r2, r0
	bne _081D3BF6
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	ldrh r1, [r5, #0x12]
	adds r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3BF6
_081D3BB8:
	movs r0, #1
	b _081D3E96
	.align 2, 0
_081D3BBC: .4byte 0x030012F2
_081D3BC0:
	cmp r0, #0
	bge _081D3BF6
	movs r3, #0x12
	ldrsh r2, [r5, r3]
	subs r2, #1
	mov r4, ip
	ldrb r1, [r4, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	movs r6, #0x16
	ldrsh r0, [r0, r6]
	cmp r2, r0
	bne _081D3BF6
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	ldrh r1, [r5, #0x12]
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3BF6
	b _081D3AFC
_081D3BF6:
	ldr r0, _081D3C30
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	movs r3, #0x16
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _081D3C50
	ldr r0, _081D3C34
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	ble _081D3C38
	ldrh r0, [r5, #0x10]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3C50
_081D3C2A:
	movs r0, #3
	b _081D3E96
	.align 2, 0
_081D3C30: .4byte 0x02037230
_081D3C34: .4byte 0x030012F0
_081D3C38:
	ldrh r0, [r5, #0x10]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3C50
	b _081D3A88
_081D3C50:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _081D3C60
	b _081D39E8
_081D3C60:
	adds r0, r5, #0
	movs r1, #0
	bl sub_081D4294
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3C9C
	adds r0, r5, #0
	movs r1, #1
	bl sub_081D42D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3C84
	movs r0, #2
	bl sub_081D43A4
	b _081D3E92
_081D3C84:
	adds r0, r5, #0
	movs r1, #1
	bl sub_081D4360
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D3C94
	b _081D3AFC
_081D3C94:
	movs r0, #2
	bl sub_081D43A4
	b _081D3E92
_081D3C9C:
	adds r0, r5, #0
	movs r1, #0
	bl sub_081D431C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3CD8
	adds r0, r5, #0
	movs r1, #1
	bl sub_081D42D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3CC0
	movs r0, #2
	bl sub_081D43A4
	b _081D3E92
_081D3CC0:
	adds r0, r5, #0
	movs r1, #1
	bl sub_081D4360
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D3CD0
	b _081D3BB8
_081D3CD0:
	movs r0, #2
	bl sub_081D43A4
	b _081D3E92
_081D3CD8:
	adds r0, r5, #0
	movs r1, #0
	bl sub_081D42D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3D14
	adds r0, r5, #0
	movs r1, #1
	bl sub_081D4294
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3CFC
	movs r0, #2
	bl sub_081D43A4
	b _081D3E92
_081D3CFC:
	adds r0, r5, #0
	movs r1, #1
	bl sub_081D431C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D3D0C
	b _081D3A88
_081D3D0C:
	movs r0, #2
	bl sub_081D43A4
	b _081D3E92
_081D3D14:
	adds r0, r5, #0
	movs r1, #0
	bl sub_081D4360
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3D50
	adds r0, r5, #0
	movs r1, #1
	bl sub_081D4294
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3D38
	movs r0, #2
	bl sub_081D43A4
	b _081D3E92
_081D3D38:
	adds r0, r5, #0
	movs r1, #1
	bl sub_081D431C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D3D48
	b _081D3C2A
_081D3D48:
	movs r0, #2
	bl sub_081D43A4
	b _081D3E92
_081D3D50:
	ldr r0, _081D3EA4
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _081D3DEE
	ldr r2, _081D3EA8
	ldr r0, _081D3EAC
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r4, #0x12
	ldrsh r1, [r0, r4]
	ldrh r2, [r5, #0x12]
	movs r6, #0x12
	ldrsh r0, [r5, r6]
	cmp r1, r0
	ble _081D3D8C
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	subs r1, r2, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3D8C
	b _081D3AFC
_081D3D8C:
	ldr r2, _081D3EA8
	ldr r0, _081D3EAC
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r2, #0x12
	ldrsh r1, [r0, r2]
	ldrh r2, [r5, #0x12]
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bge _081D3DBE
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	adds r1, r2, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3DBE
	b _081D3BB8
_081D3DBE:
	movs r6, #0x10
	ldrsh r0, [r5, r6]
	ldrh r1, [r5, #0x12]
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3DD6
	b _081D3AFC
_081D3DD6:
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	ldrh r1, [r5, #0x12]
	adds r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3DEE
	b _081D3BB8
_081D3DEE:
	ldr r0, _081D3EB0
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _081D3E8C
	ldr r2, _081D3EA8
	ldr r0, _081D3EAC
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x10
	ldrsh r1, [r0, r3]
	ldrh r2, [r5, #0x10]
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	cmp r1, r0
	ble _081D3E2A
	subs r0, r2, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x12
	ldrsh r1, [r5, r6]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3E2A
	b _081D3C2A
_081D3E2A:
	ldr r2, _081D3EA8
	ldr r0, _081D3EAC
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	ldrh r2, [r5, #0x10]
	movs r3, #0x10
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bge _081D3E5C
	adds r0, r2, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x12
	ldrsh r1, [r5, r4]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3E5C
	b _081D3A88
_081D3E5C:
	ldrh r0, [r5, #0x10]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x12
	ldrsh r1, [r5, r6]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3E74
	b _081D3A88
_081D3E74:
	ldrh r0, [r5, #0x10]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D3E8C
	b _081D3C2A
_081D3E8C:
	movs r0, #0
	bl sub_081D3F10
_081D3E92:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_081D3E96:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081D3EA4: .4byte 0x030012F2
_081D3EA8: .4byte 0x02036FF0
_081D3EAC: .4byte 0x02037230
_081D3EB0: .4byte 0x030012F0
	thumb_func_end GetMewMoveDirection

	thumb_func_start CanMewWalkToCoords
CanMewWalkToCoords: @ 0x081D3EB4
	push {r4, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r3, _081D3EE8
	ldr r1, _081D3EEC
	ldrb r2, [r1, #5]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r1, r3
	movs r3, #0x10
	ldrsh r1, [r2, r3]
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _081D3EF0
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _081D3EF0
	movs r0, #0
	b _081D3F08
	.align 2, 0
_081D3EE8: .4byte 0x02036FF0
_081D3EEC: .4byte 0x02037230
_081D3EF0:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsPokeGrass
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_081D3F08:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CanMewWalkToCoords

	thumb_func_start sub_081D3F10
sub_081D3F10: @ 0x081D3F10
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	bl GetMewEventObjectId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081D3FEC
	adds r4, r1, r0
	movs r1, #0
	ldr r3, _081D3FF0
	movs r2, #0
_081D3F30:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _081D3F30
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #0x12]
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081D3F68
	cmp r6, #2
	beq _081D3F68
	ldr r0, _081D3FF0
	adds r0, r5, r0
	movs r1, #2
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_081D3F68:
	ldrh r0, [r4, #0x10]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081D3F92
	cmp r6, #4
	beq _081D3F92
	ldr r0, _081D3FF0
	adds r0, r5, r0
	movs r1, #4
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_081D3F92:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #0x12]
	adds r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _081D3FBA
	cmp r6, #1
	beq _081D3FBA
	ldr r0, _081D3FF0
	adds r0, r5, r0
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_081D3FBA:
	ldrh r0, [r4, #0x10]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081D3FE4
	cmp r6, #3
	beq _081D3FE4
	ldr r0, _081D3FF0
	adds r0, r5, r0
	movs r1, #3
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_081D3FE4:
	cmp r5, #1
	bhi _081D3FF4
	ldr r0, _081D3FF0
	b _081D4008
	.align 2, 0
_081D3FEC: .4byte 0x02036FF0
_081D3FF0: .4byte 0x030012F4
_081D3FF4:
	ldr r4, _081D4010
	ldr r0, _081D4014
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __modsi3
	adds r0, r0, r4
_081D4008:
	ldrb r0, [r0]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081D4010: .4byte 0x030012F4
_081D4014: .4byte 0x0000403A
	thumb_func_end sub_081D3F10

	thumb_func_start UpdateFarawayIslandStepCounter
UpdateFarawayIslandStepCounter: @ 0x081D4018
	push {r4, lr}
	ldr r4, _081D4048
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _081D404C
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _081D4050
	cmp r1, r0
	bne _081D4060
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _081D4054
	cmp r2, r0
	bls _081D4058
	adds r0, r4, #0
	movs r1, #0
	bl VarSet
	b _081D4060
	.align 2, 0
_081D4048: .4byte 0x0000403A
_081D404C: .4byte 0x03005AEC
_081D4050: .4byte 0x0000391A
_081D4054: .4byte 0x0000270E
_081D4058:
	adds r0, r4, #0
	adds r1, r2, #0
	bl VarSet
_081D4060:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateFarawayIslandStepCounter

	thumb_func_start EventObjectIsFarawayIslandMew
EventObjectIsFarawayIslandMew: @ 0x081D4068
	push {lr}
	adds r2, r0, #0
	ldr r0, _081D4084
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _081D4088
	cmp r1, r0
	bne _081D408C
	ldrb r0, [r2, #5]
	cmp r0, #0xe5
	bne _081D408C
	movs r0, #1
	b _081D408E
	.align 2, 0
_081D4084: .4byte 0x03005AEC
_081D4088: .4byte 0x0000391A
_081D408C:
	movs r0, #0
_081D408E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end EventObjectIsFarawayIslandMew

	thumb_func_start IsMewPlayingHideAndSeek
IsMewPlayingHideAndSeek: @ 0x081D4094
	push {lr}
	ldr r0, _081D40C4
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _081D40C8
	cmp r1, r0
	bne _081D40D0
	movs r0, #0xe5
	lsls r0, r0, #1
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081D40D0
	ldr r0, _081D40CC
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081D40D0
	movs r0, #1
	b _081D40D2
	.align 2, 0
_081D40C4: .4byte 0x03005AEC
_081D40C8: .4byte 0x0000391A
_081D40CC: .4byte 0x000002CE
_081D40D0:
	movs r0, #0
_081D40D2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsMewPlayingHideAndSeek

	thumb_func_start sub_081D40D8
sub_081D40D8: @ 0x081D40D8
	push {r4, lr}
	ldr r4, _081D4100
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	ldr r1, _081D4104
	cmp r0, r1
	beq _081D4108
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	bne _081D4108
	movs r0, #1
	b _081D410A
	.align 2, 0
_081D4100: .4byte 0x0000403A
_081D4104: .4byte 0xFFFF0000
_081D4108:
	movs r0, #0
_081D410A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081D40D8

	thumb_func_start sub_081D4110
sub_081D4110: @ 0x081D4110
	push {r4, r5, r6, lr}
	sub sp, #4
	bl GetMewEventObjectId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081D416C
	adds r5, r1, r0
	ldrb r1, [r5, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	ldr r0, _081D4170
	ldrh r4, [r0]
	cmp r4, #1
	bne _081D4178
	ldrb r0, [r5, #3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r5, #3]
	ldr r3, _081D4174
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x42
	ldrb r2, [r0]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x43
	strb r4, [r0]
	b _081D4244
	.align 2, 0
_081D416C: .4byte 0x02036FF0
_081D4170: .4byte 0x02037280
_081D4174: .4byte 0x020205AC
_081D4178:
	ldr r0, _081D424C
	ldr r1, _081D4250
	bl VarSet
	ldrb r0, [r5, #3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r5, #3]
	ldr r6, _081D4254
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x42
	ldrb r2, [r0]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _081D4258
	ldrh r0, [r0]
	cmp r0, #2
	beq _081D41BA
	ldrb r0, [r5, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r1, #0x43
	movs r0, #1
	strb r0, [r1]
_081D41BA:
	ldr r4, _081D425C
	adds r0, r4, #0
	bl LoadSpritePalette
	ldrh r0, [r4, #4]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl UpdateSpritePaletteWithWeather
	ldrh r1, [r5, #0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, #0x12]
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _081D4260
	ldr r0, [r0, #0x3c]
	mov r1, sp
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldrb r4, [r5, #4]
	lsls r3, r4, #4
	adds r3, r3, r4
	lsls r3, r3, #2
	adds r3, r3, r6
	adds r3, #0x43
	ldrb r3, [r3]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl CreateSpriteAtEnd
	ldr r1, _081D4264
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _081D4244
	ldrb r0, [r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r2, #2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #8
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r0, _081D4268
	str r0, [r1, #0x1c]
_081D4244:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D424C: .4byte 0x0000403A
_081D4250: .4byte 0x0000FFFF
_081D4254: .4byte 0x020205AC
_081D4258: .4byte 0x02037294
_081D425C: .4byte 0x084E4E1C
_081D4260: .4byte 0x084DDE4C
_081D4264: .4byte 0x0203CC1C
_081D4268: .4byte 0x08007141
	thumb_func_end sub_081D4110

	thumb_func_start sub_081D426C
sub_081D426C: @ 0x081D426C
	push {lr}
	ldr r1, _081D428C
	ldrb r0, [r1]
	cmp r0, #0x40
	beq _081D4286
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081D4290
	adds r0, r0, r1
	bl DestroySprite
_081D4286:
	pop {r0}
	bx r0
	.align 2, 0
_081D428C: .4byte 0x0203CC1C
_081D4290: .4byte 0x020205AC
	thumb_func_end sub_081D426C

	thumb_func_start sub_081D4294
sub_081D4294: @ 0x081D4294
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _081D42C8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _081D42D0
	movs r1, #0x10
	ldrsh r0, [r2, r1]
	ldrh r1, [r2, #0x12]
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D42D0
	ldr r0, _081D42CC
	adds r0, r4, r0
	movs r1, #2
	strb r1, [r0]
	movs r0, #1
	b _081D42D2
	.align 2, 0
_081D42C8: .4byte 0x030012F2
_081D42CC: .4byte 0x030012F4
_081D42D0:
	movs r0, #0
_081D42D2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081D4294

	thumb_func_start sub_081D42D8
sub_081D42D8: @ 0x081D42D8
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _081D430C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _081D4314
	ldrh r0, [r2, #0x10]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x12
	ldrsh r1, [r2, r3]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D4314
	ldr r0, _081D4310
	adds r0, r4, r0
	movs r1, #4
	strb r1, [r0]
	movs r0, #1
	b _081D4316
	.align 2, 0
_081D430C: .4byte 0x030012F0
_081D4310: .4byte 0x030012F4
_081D4314:
	movs r0, #0
_081D4316:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081D42D8

	thumb_func_start sub_081D431C
sub_081D431C: @ 0x081D431C
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _081D4350
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _081D4358
	movs r1, #0x10
	ldrsh r0, [r2, r1]
	ldrh r1, [r2, #0x12]
	adds r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D4358
	ldr r0, _081D4354
	adds r0, r4, r0
	movs r1, #1
	strb r1, [r0]
	movs r0, #1
	b _081D435A
	.align 2, 0
_081D4350: .4byte 0x030012F2
_081D4354: .4byte 0x030012F4
_081D4358:
	movs r0, #0
_081D435A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081D431C

	thumb_func_start sub_081D4360
sub_081D4360: @ 0x081D4360
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _081D4394
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _081D439C
	ldrh r0, [r2, #0x10]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x12
	ldrsh r1, [r2, r3]
	bl CanMewWalkToCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D439C
	ldr r0, _081D4398
	adds r0, r4, r0
	movs r1, #3
	strb r1, [r0]
	movs r0, #1
	b _081D439E
	.align 2, 0
_081D4394: .4byte 0x030012F0
_081D4398: .4byte 0x030012F4
_081D439C:
	movs r0, #0
_081D439E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081D4360

	thumb_func_start sub_081D43A4
sub_081D43A4: @ 0x081D43A4
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _081D43C8
	ldr r0, _081D43CC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081D43C8: .4byte 0x030012F4
_081D43CC: .4byte 0x0000403A
	thumb_func_end sub_081D43A4

