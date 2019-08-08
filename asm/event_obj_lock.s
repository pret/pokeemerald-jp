.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start walkrun_is_standing_still
walkrun_is_standing_still: @ 0x08097D10
	push {lr}
	ldr r0, _08097D20
	ldrb r0, [r0, #3]
	cmp r0, #1
	beq _08097D24
	movs r0, #1
	b _08097D26
	.align 2, 0
_08097D20: .4byte 0x02037230
_08097D24:
	movs r0, #0
_08097D26:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end walkrun_is_standing_still

	thumb_func_start sub_08097D2C
sub_08097D2C: @ 0x08097D2C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl walkrun_is_standing_still
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097D46
	bl sub_0808B1C8
	adds r0, r4, #0
	bl DestroyTask
_08097D46:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08097D2C

	thumb_func_start sub_08097D4C
sub_08097D4C: @ 0x08097D4C
	push {lr}
	ldr r0, _08097D64
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097D68
	bl sub_0808B658
	movs r0, #1
	b _08097D6A
	.align 2, 0
_08097D64: .4byte 0x08097D2D
_08097D68:
	movs r0, #0
_08097D6A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08097D4C

	thumb_func_start ScriptFreezeEventObjects
ScriptFreezeEventObjects: @ 0x08097D70
	push {lr}
	bl FreezeEventObjects
	ldr r0, _08097D84
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08097D84: .4byte 0x08097D2D
	thumb_func_end ScriptFreezeEventObjects

	thumb_func_start sub_08097D88
sub_08097D88: @ 0x08097D88
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _08097DF8
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08097DB2
	bl walkrun_is_standing_still
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _08097DB2
	bl sub_0808B1C8
	strh r4, [r5, #8]
_08097DB2:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08097DDA
	ldr r2, _08097DFC
	ldr r0, _08097E00
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097DDA
	adds r0, r1, #0
	bl FreezeEventObject
	movs r0, #1
	strh r0, [r5, #0xa]
_08097DDA:
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08097DF0
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08097DF0
	adds r0, r6, #0
	bl DestroyTask
_08097DF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08097DF8: .4byte 0x03005B60
_08097DFC: .4byte 0x02036FF0
_08097E00: .4byte 0x03005B50
	thumb_func_end sub_08097D88

	thumb_func_start sub_08097E04
sub_08097E04: @ 0x08097E04
	push {lr}
	ldr r0, _08097E1C
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097E20
	bl sub_0808B658
	movs r0, #1
	b _08097E22
	.align 2, 0
_08097E1C: .4byte 0x08097D89
_08097E20:
	movs r0, #0
_08097E22:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08097E04

	thumb_func_start LockSelectedEventObject
LockSelectedEventObject: @ 0x08097E28
	push {r4, r5, lr}
	ldr r4, _08097E6C
	ldrb r0, [r4]
	bl FreezeEventObjectsExceptOne
	ldr r0, _08097E70
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _08097E74
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097E66
	adds r0, r1, #0
	bl FreezeEventObject
	ldr r0, _08097E78
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0xa]
_08097E66:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097E6C: .4byte 0x03005B50
_08097E70: .4byte 0x08097D89
_08097E74: .4byte 0x02036FF0
_08097E78: .4byte 0x03005B60
	thumb_func_end LockSelectedEventObject

	thumb_func_start ScriptUnfreezeEventObjects
ScriptUnfreezeEventObjects: @ 0x08097E7C
	push {lr}
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08097EA8
	adds r0, r0, r1
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	bl sub_080D2C2C
	bl UnfreezeEventObjects
	pop {r0}
	bx r0
	.align 2, 0
_08097EA8: .4byte 0x02036FF0
	thumb_func_end ScriptUnfreezeEventObjects

	thumb_func_start sub_08097EAC
sub_08097EAC: @ 0x08097EAC
	push {r4, lr}
	ldr r4, _08097EF4
	ldr r0, _08097EF8
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08097ECA
	adds r0, r1, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
_08097ECA:
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	bl sub_080D2C2C
	bl UnfreezeEventObjects
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097EF4: .4byte 0x02036FF0
_08097EF8: .4byte 0x03005B50
	thumb_func_end sub_08097EAC

	thumb_func_start sub_08097EFC
sub_08097EFC: @ 0x08097EFC
	push {lr}
	ldr r0, _08097F18
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08097F1C
	adds r0, r0, r1
	ldr r1, _08097F20
	ldrb r1, [r1]
	bl EventObjectFaceOppositeDirection
	pop {r0}
	bx r0
	.align 2, 0
_08097F18: .4byte 0x03005B50
_08097F1C: .4byte 0x02036FF0
_08097F20: .4byte 0x02037294
	thumb_func_end sub_08097EFC

	thumb_func_start sub_08097F24
sub_08097F24: @ 0x08097F24
	push {lr}
	ldr r0, _08097F3C
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08097F40
	adds r0, r0, r1
	bl EventObjectClearHeldMovementIfActive
	pop {r0}
	bx r0
	.align 2, 0
_08097F3C: .4byte 0x03005B50
_08097F40: .4byte 0x02036FF0
	thumb_func_end sub_08097F24

	thumb_func_start sub_08097F44
sub_08097F44: @ 0x08097F44
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _08097FB0
	adds r5, r0, r1
	ldrb r7, [r5, #0xc]
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08097F70
	bl walkrun_is_standing_still
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _08097F70
	bl sub_0808B1C8
	strh r4, [r5, #8]
_08097F70:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08097F94
	ldr r0, _08097FB4
	lsls r1, r7, #3
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097F94
	adds r0, r1, #0
	bl FreezeEventObject
	movs r0, #1
	strh r0, [r5, #0xa]
_08097F94:
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08097FAA
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08097FAA
	adds r0, r6, #0
	bl DestroyTask
_08097FAA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097FB0: .4byte 0x03005B60
_08097FB4: .4byte 0x02036FF0
	thumb_func_end sub_08097F44

	thumb_func_start sub_08097FB8
sub_08097FB8: @ 0x08097FB8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	bl GetChosenApproachingTrainerEventObjectId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08098058
	ldrb r0, [r0]
	cmp r0, #2
	bne _08098068
	movs r0, #1
	bl GetChosenApproachingTrainerEventObjectId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080979FC
	ldr r7, _0809805C
	adds r0, r7, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08098060
	mov sb, r0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	mov r1, sb
	adds r6, r0, r1
	strh r4, [r6, #0xc]
	ldr r2, _08098064
	mov r8, r2
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098022
	adds r0, r1, #0
	bl FreezeEventObject
	movs r0, #1
	strh r0, [r6, #0xa]
_08098022:
	adds r0, r7, #0
	movs r1, #0x51
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	mov r1, sb
	adds r4, r0, r1
	strh r5, [r4, #0xc]
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080980A2
	adds r0, r1, #0
	bl FreezeEventObject
	movs r0, #1
	strh r0, [r4, #0xa]
	b _080980A2
	.align 2, 0
_08098058: .4byte 0x03005E08
_0809805C: .4byte 0x08097F45
_08098060: .4byte 0x03005B60
_08098064: .4byte 0x02036FF0
_08098068:
	adds r0, r4, #0
	bl FreezeEventObjectsExceptOne
	ldr r0, _080980B0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080980B4
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r5, r0, r1
	strh r4, [r5, #0xc]
	ldr r1, _080980B8
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080980A2
	adds r0, r1, #0
	bl FreezeEventObject
	movs r0, #1
	strh r0, [r5, #0xa]
_080980A2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080980B0: .4byte 0x08097F45
_080980B4: .4byte 0x03005B60
_080980B8: .4byte 0x02036FF0
	thumb_func_end sub_08097FB8

	thumb_func_start sub_080980BC
sub_080980BC: @ 0x080980BC
	push {lr}
	ldr r0, _080980D4
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080980D8
	bl sub_0808B658
	movs r0, #1
	b _080980DA
	.align 2, 0
_080980D4: .4byte 0x08097F45
_080980D8:
	movs r0, #0
_080980DA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080980BC

