.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ScriptMovement_StartObjectMovementScript
ScriptMovement_StartObjectMovementScript: @ 0x080D2B88
	push {r4, lr}
	sub sp, #4
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D2BAA
	movs r0, #1
	b _080D2BD2
_080D2BAA:
	ldr r0, _080D2BDC
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D2BBC
	movs r0, #0x32
	bl sub_080D2C4C
_080D2BBC:
	bl sub_080D2C94
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1]
	adds r2, r4, #0
	bl sub_080D2CA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080D2BD2:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D2BDC: .4byte 0x080D2F01
	thumb_func_end ScriptMovement_StartObjectMovementScript

	thumb_func_start ScriptMovement_IsObjectMovementFinished
ScriptMovement_IsObjectMovementFinished: @ 0x080D2BE0
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D2C22
	bl sub_080D2C94
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080D2D14
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x10
	beq _080D2C22
	adds r0, r4, #0
	bl sub_080D2E24
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080D2C24
_080D2C22:
	movs r0, #1
_080D2C24:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScriptMovement_IsObjectMovementFinished

	thumb_func_start sub_080D2C2C
sub_080D2C2C: @ 0x080D2C2C
	push {r4, lr}
	bl sub_080D2C94
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xff
	beq _080D2C46
	adds r0, r4, #0
	bl UnfreezeObjects
	adds r0, r4, #0
	bl DestroyTask
_080D2C46:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080D2C2C

	thumb_func_start sub_080D2C4C
sub_080D2C4C: @ 0x080D2C4C
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080D2C88
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r3, r1, #3
	ldr r5, _080D2C8C
	ldr r0, _080D2C90
	adds r4, r0, #0
_080D2C6C:
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r5
	ldrh r1, [r0]
	orrs r1, r4
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080D2C6C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2C88: .4byte 0x080D2F01
_080D2C8C: .4byte 0x03005B68
_080D2C90: .4byte 0x0000FFFF
	thumb_func_end sub_080D2C4C

	thumb_func_start sub_080D2C94
sub_080D2C94: @ 0x080D2C94
	push {lr}
	ldr r0, _080D2CA4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080D2CA4: .4byte 0x080D2F01
	thumb_func_end sub_080D2C94

	thumb_func_start sub_080D2CA8
sub_080D2CA8: @ 0x080D2CA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r5, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	mov r8, r6
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080D2D14
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x10
	beq _080D2CE4
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080D2E24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D2D04
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	b _080D2CFA
_080D2CE4:
	adds r0, r7, #0
	movs r1, #0xff
	bl sub_080D2D14
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x10
	beq _080D2D04
	adds r0, r7, #0
	adds r1, r4, #0
	mov r2, r8
_080D2CFA:
	mov r3, sb
	bl sub_080D2E7C
	movs r0, #0
	b _080D2D06
_080D2D04:
	movs r0, #1
_080D2D06:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D2CA8

	thumb_func_start sub_080D2D14
sub_080D2D14: @ 0x080D2D14
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080D2D38
	adds r1, r1, r0
	adds r1, #2
	movs r2, #0
_080D2D2C:
	ldrb r0, [r1]
	cmp r0, r3
	bne _080D2D3C
	adds r0, r2, #0
	b _080D2D4A
	.align 2, 0
_080D2D38: .4byte 0x03005B68
_080D2D3C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r1, #1
	cmp r2, #0xf
	bls _080D2D2C
	movs r0, #0x10
_080D2D4A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D2D14

	thumb_func_start sub_080D2D50
sub_080D2D50: @ 0x080D2D50
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080D2D80
	adds r1, r1, r0
	adds r1, #2
	str r1, [r2]
	movs r0, #0
	cmp r0, r3
	bhs _080D2D7C
_080D2D6E:
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #1
	cmp r0, r3
	blo _080D2D6E
	str r1, [r2]
_080D2D7C:
	pop {r0}
	bx r0
	.align 2, 0
_080D2D80: .4byte 0x03005B68
	thumb_func_end sub_080D2D50

	thumb_func_start sub_080D2D84
sub_080D2D84: @ 0x080D2D84
	push {r4, lr}
	sub sp, #4
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r2, sp
	bl sub_080D2D50
	ldr r0, [sp]
	strb r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080D2D84

	thumb_func_start sub_080D2DA8
sub_080D2DA8: @ 0x080D2DA8
	push {r4, lr}
	sub sp, #4
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r2, sp
	bl sub_080D2D50
	ldr r0, [sp]
	ldrb r0, [r0]
	strb r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080D2DA8

	thumb_func_start sub_080D2DCC
sub_080D2DCC: @ 0x080D2DCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _080D2DF4
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r2, [r1]
	mvns r2, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _080D2DF8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrh r0, [r1, #8]
	ands r2, r0
	strh r2, [r1, #8]
	bx lr
	.align 2, 0
_080D2DF4: .4byte 0x082FACB4
_080D2DF8: .4byte 0x03005B60
	thumb_func_end sub_080D2DCC

	thumb_func_start sub_080D2DFC
sub_080D2DFC: @ 0x080D2DFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r3, _080D2E1C
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	ldr r0, _080D2E20
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r0, [r1]
	ldrh r1, [r2, #8]
	orrs r0, r1
	strh r0, [r2, #8]
	bx lr
	.align 2, 0
_080D2E1C: .4byte 0x03005B60
_080D2E20: .4byte 0x082FACB4
	thumb_func_end sub_080D2DFC

	thumb_func_start sub_080D2E24
sub_080D2E24: @ 0x080D2E24
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r3, _080D2E4C
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	ldr r0, _080D2E50
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r0, [r1]
	ldrh r1, [r2, #8]
	ands r0, r1
	cmp r0, #0
	bne _080D2E54
	movs r0, #0
	b _080D2E56
	.align 2, 0
_080D2E4C: .4byte 0x03005B60
_080D2E50: .4byte 0x082FACB4
_080D2E54:
	movs r0, #1
_080D2E56:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D2E24

	thumb_func_start npc_obj_offscreen_culling_and_flag_update
npc_obj_offscreen_culling_and_flag_update: @ 0x080D2E5C
	lsls r0, r0, #0x18
	ldr r2, _080D2E68
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080D2E68: .4byte 0x02039A30
	thumb_func_end npc_obj_offscreen_culling_and_flag_update

	thumb_func_start sub_080D2E6C
sub_080D2E6C: @ 0x080D2E6C
	lsls r0, r0, #0x18
	ldr r1, _080D2E78
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080D2E78: .4byte 0x02039A30
	thumb_func_end sub_080D2E6C

	thumb_func_start sub_080D2E7C
sub_080D2E7C: @ 0x080D2E7C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080D2DCC
	adds r0, r4, #0
	mov r1, r8
	bl npc_obj_offscreen_culling_and_flag_update
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_080D2D84
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080D2E7C

	thumb_func_start UnfreezeObjects
UnfreezeObjects: @ 0x080D2EBC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080D2EF8
	adds r1, r1, r0
	adds r4, r1, #2
	movs r5, #0
_080D2ED0:
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _080D2EE6
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080D2EFC
	adds r0, r0, r1
	bl UnfreezeEventObject
_080D2EE6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #1
	cmp r5, #0xf
	bls _080D2ED0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2EF8: .4byte 0x03005B68
_080D2EFC: .4byte 0x02036FF0
	thumb_func_end UnfreezeObjects

	thumb_func_start sub_080D2F00
sub_080D2F00: @ 0x080D2F00
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r5, #0
	mov r6, sp
_080D2F0C:
	adds r0, r7, #0
	adds r1, r5, #0
	mov r2, sp
	bl sub_080D2DA8
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _080D2F30
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_080D2E6C
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_080D2F44
_080D2F30:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _080D2F0C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080D2F00

	thumb_func_start sub_080D2F44
sub_080D2F44: @ 0x080D2F44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r3, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	mov r8, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _080D2F94
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsHeldMovementActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D2F7C
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D2FAE
_080D2F7C:
	ldrb r1, [r5]
	cmp r1, #0xfe
	bne _080D2F98
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_080D2DFC
	adds r0, r4, #0
	bl FreezeEventObject
	b _080D2FAE
	.align 2, 0
_080D2F94: .4byte 0x02036FF0
_080D2F98:
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D2FAE
	adds r5, #1
	mov r0, r8
	adds r1, r5, #0
	bl npc_obj_offscreen_culling_and_flag_update
_080D2FAE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080D2F44

