.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CopyDoorTilesToVram
CopyDoorTilesToVram: @ 0x08089D64
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #3]
	cmp r0, #2
	bne _08089D84
	ldrh r1, [r1, #2]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	ldr r1, _08089D80
	movs r2, #0x80
	bl CpuFastSet
	b _08089D92
	.align 2, 0
_08089D80: .4byte 0x06007E00
_08089D84:
	ldrh r1, [r1, #2]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	ldr r1, _08089D98
	movs r2, #0x40
	bl CpuFastSet
_08089D92:
	pop {r0}
	bx r0
	.align 2, 0
_08089D98: .4byte 0x06007F00
	thumb_func_end CopyDoorTilesToVram

	thumb_func_start door_build_blockdef
door_build_blockdef: @ 0x08089D9C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r4, #0
	adds r1, r6, #0
_08089DA8:
	ldrb r0, [r2]
	lsls r0, r0, #0x1c
	lsrs r3, r0, #0x10
	adds r2, #1
	adds r0, r5, r4
	orrs r3, r0
	strh r3, [r1]
	adds r1, #2
	adds r4, #1
	cmp r4, #3
	ble _08089DA8
	cmp r4, #7
	bgt _08089DD6
	lsls r0, r4, #1
	adds r1, r0, r6
_08089DC6:
	ldrb r0, [r2]
	lsls r3, r0, #0xc
	adds r2, #1
	strh r3, [r1]
	adds r1, #2
	adds r4, #1
	cmp r4, #7
	ble _08089DC6
_08089DD6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end door_build_blockdef

	thumb_func_start DrawCurrentDoorAnimFrame
DrawCurrentDoorAnimFrame: @ 0x08089DDC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x30
	adds r7, r1, #0
	mov sb, r2
	adds r5, r3, #0
	ldrb r0, [r0, #3]
	cmp r0, #2
	bne _08089E58
	add r4, sp, #0x10
	movs r1, #0xfc
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r2, r5, #0
	bl door_build_blockdef
	mov r6, sb
	subs r6, #1
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl DrawDoorMetatileAt
	movs r1, #0xfd
	lsls r1, r1, #2
	adds r0, r5, #4
	mov r8, r0
	adds r0, r4, #0
	mov r2, r8
	bl door_build_blockdef
	adds r0, r7, #0
	mov r1, sb
	adds r2, r4, #0
	bl DrawDoorMetatileAt
	movs r1, #0xfe
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r2, r5, #0
	bl door_build_blockdef
	adds r5, r7, #1
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl DrawDoorMetatileAt
	movs r1, #0xff
	lsls r1, r1, #2
	adds r0, r4, #0
	mov r2, r8
	bl door_build_blockdef
	adds r0, r5, #0
	mov r1, sb
	adds r2, r4, #0
	bl DrawDoorMetatileAt
	b _08089E86
_08089E58:
	movs r1, #0xfe
	lsls r1, r1, #2
	mov r0, sp
	adds r2, r5, #0
	bl door_build_blockdef
	mov r1, sb
	subs r1, #1
	adds r0, r7, #0
	mov r2, sp
	bl DrawDoorMetatileAt
	movs r1, #0xff
	lsls r1, r1, #2
	adds r2, r5, #4
	mov r0, sp
	bl door_build_blockdef
	adds r0, r7, #0
	mov r1, sb
	mov r2, sp
	bl DrawDoorMetatileAt
_08089E86:
	add sp, #0x30
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DrawCurrentDoorAnimFrame

	thumb_func_start DrawClosedDoorTiles
DrawClosedDoorTiles: @ 0x08089E94
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	subs r7, r6, #1
	adds r0, r5, #0
	adds r1, r7, #0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, #0
	adds r1, r6, #0
	bl CurrentMapDrawMetatileAt
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _08089EC6
	adds r4, r5, #1
	adds r0, r4, #0
	adds r1, r7, #0
	bl CurrentMapDrawMetatileAt
	adds r0, r4, #0
	adds r1, r6, #0
	bl CurrentMapDrawMetatileAt
_08089EC6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DrawClosedDoorTiles

	thumb_func_start DrawDoor
DrawDoor: @ 0x08089ECC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldrh r1, [r5, #2]
	ldr r0, _08089F08
	cmp r1, r0
	bne _08089F14
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl DrawClosedDoorTiles
	bl sub_0808A2C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089F46
	ldr r0, _08089F0C
	ldrh r1, [r0]
	adds r1, #7
	ldr r0, _08089F10
	ldrh r2, [r0]
	adds r2, #7
	adds r0, r4, #0
	bl DrawClosedDoorTiles
	b _08089F46
	.align 2, 0
_08089F08: .4byte 0x0000FFFF
_08089F0C: .4byte 0x02037280
_08089F10: .4byte 0x02037282
_08089F14:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CopyDoorTilesToVram
	ldr r3, [r4, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl DrawCurrentDoorAnimFrame
	bl sub_0808A2C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089F46
	ldr r0, _08089F4C
	ldrh r1, [r0]
	adds r1, #7
	ldr r0, _08089F50
	ldrh r2, [r0]
	adds r2, #7
	ldr r3, [r4, #8]
	adds r0, r4, #0
	bl DrawCurrentDoorAnimFrame
_08089F46:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089F4C: .4byte 0x02037280
_08089F50: .4byte 0x02037282
	thumb_func_end DrawDoor

	thumb_func_start sub_08089F54
sub_08089F54: @ 0x08089F54
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08089F7A
	movs r2, #8
	ldrsh r1, [r4, r2]
	lsls r1, r1, #2
	adds r1, r5, r1
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	movs r0, #0xe
	ldrsh r3, [r4, r0]
	adds r0, r6, #0
	bl DrawDoor
_08089F7A:
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	movs r2, #8
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r1, r0
	bne _08089FA8
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08089FAE
	movs r0, #0
	b _08089FB0
_08089FA8:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
_08089FAE:
	movs r0, #1
_08089FB0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08089F54

	thumb_func_start Task_AnimateDoor
Task_AnimateDoor: @ 0x08089FB8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #3
	ldr r0, _08089FEC
	adds r2, r2, r0
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	ldrh r0, [r2, #2]
	orrs r1, r0
	ldrh r0, [r2, #4]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #6]
	orrs r0, r3
	bl sub_08089F54
	cmp r0, #0
	bne _08089FE6
	adds r0, r4, #0
	bl DestroyTask
_08089FE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089FEC: .4byte 0x03005B68
	thumb_func_end Task_AnimateDoor

	thumb_func_start GetLastDoorFrame
GetLastDoorFrame: @ 0x08089FF0
	push {lr}
	adds r1, r0, #0
	b _08089FF8
_08089FF6:
	adds r1, #4
_08089FF8:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08089FF6
	subs r0, r1, #4
	pop {r1}
	bx r1
	thumb_func_end GetLastDoorFrame

	thumb_func_start GetDoorGraphics
GetDoorGraphics: @ 0x0808A004
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	b _0808A01A
_0808A00E:
	ldrh r0, [r2]
	cmp r0, r1
	bne _0808A018
	adds r0, r2, #0
	b _0808A022
_0808A018:
	adds r2, #0xc
_0808A01A:
	ldr r0, [r2, #4]
	cmp r0, #0
	bne _0808A00E
	movs r0, #0
_0808A022:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetDoorGraphics

	thumb_func_start StartDoorAnimationTask
StartDoorAnimationTask: @ 0x0808A028
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r4, _0808A074
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0808A07C
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r2, _0808A078
	adds r1, r1, r2
	strh r7, [r1, #0xc]
	mov r2, r8
	strh r2, [r1, #0xe]
	strh r5, [r1, #2]
	lsrs r2, r5, #0x10
	strh r2, [r1]
	strh r6, [r1, #6]
	lsrs r2, r6, #0x10
	strh r2, [r1, #4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0808A080
	.align 2, 0
_0808A074: .4byte 0x08089FB9
_0808A078: .4byte 0x03005B68
_0808A07C:
	movs r0, #1
	rsbs r0, r0, #0
_0808A080:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StartDoorAnimationTask

	thumb_func_start DrawClosedDoor
DrawClosedDoor: @ 0x0808A08C
	push {lr}
	bl DrawClosedDoorTiles
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DrawClosedDoor

	thumb_func_start DrawOpenedDoor
DrawOpenedDoor: @ 0x0808A098
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl GetDoorGraphics
	adds r4, r0, #0
	cmp r4, #0
	beq _0808A0CE
	ldr r1, _0808A0D4
	adds r0, r1, #0
	bl GetLastDoorFrame
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl DrawDoor
_0808A0CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A0D4: .4byte 0x0846F3AC
	thumb_func_end DrawOpenedDoor

	thumb_func_start StartDoorOpenAnimation
StartDoorOpenAnimation: @ 0x0808A0D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl GetDoorGraphics
	adds r2, r0, #0
	adds r4, r2, #0
	cmp r2, #0
	bne _0808A102
	movs r0, #1
	rsbs r0, r0, #0
	b _0808A124
_0808A102:
	ldrb r0, [r2, #3]
	cmp r0, #2
	beq _0808A114
	ldr r1, _0808A110
	adds r0, r2, #0
	b _0808A118
	.align 2, 0
_0808A110: .4byte 0x0846F3AC
_0808A114:
	ldr r1, _0808A12C
	adds r0, r4, #0
_0808A118:
	adds r2, r5, #0
	adds r3, r6, #0
	bl StartDoorAnimationTask
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0808A124:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808A12C: .4byte 0x0846F3D4
	thumb_func_end StartDoorOpenAnimation

	thumb_func_start StartDoorCloseAnimation
StartDoorCloseAnimation: @ 0x0808A130
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl GetDoorGraphics
	cmp r0, #0
	beq _0808A164
	ldr r1, _0808A160
	adds r2, r5, #0
	adds r3, r6, #0
	bl StartDoorAnimationTask
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0808A168
	.align 2, 0
_0808A160: .4byte 0x0846F3C0
_0808A164:
	movs r0, #1
	rsbs r0, r0, #0
_0808A168:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StartDoorCloseAnimation

	thumb_func_start cur_mapdata_get_door_x2_at
cur_mapdata_get_door_x2_at: @ 0x0808A170
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl GetDoorGraphics
	cmp r0, #0
	beq _0808A194
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0808A198
_0808A194:
	movs r0, #1
	rsbs r0, r0, #0
_0808A198:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end cur_mapdata_get_door_x2_at

	thumb_func_start unref_sub_808A83C
unref_sub_808A83C: @ 0x0808A1A0
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _0808A1B4
	adds r1, r3, #0
	bl StartDoorOpenAnimation
	pop {r0}
	bx r0
	.align 2, 0
_0808A1B4: .4byte 0x0846F594
	thumb_func_end unref_sub_808A83C

	thumb_func_start FieldSetDoorOpened
FieldSetDoorOpened: @ 0x0808A1B8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsDoor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A1DA
	ldr r0, _0808A1E0
	adds r1, r4, #0
	adds r2, r5, #0
	bl DrawOpenedDoor
_0808A1DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A1E0: .4byte 0x0846F594
	thumb_func_end FieldSetDoorOpened

	thumb_func_start FieldSetDoorClosed
FieldSetDoorClosed: @ 0x0808A1E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsDoor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A206
	ldr r0, _0808A20C
	adds r1, r4, #0
	adds r2, r5, #0
	bl DrawClosedDoor
_0808A206:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A20C: .4byte 0x0846F594
	thumb_func_end FieldSetDoorClosed

	thumb_func_start FieldAnimateDoorClose
FieldAnimateDoorClose: @ 0x0808A210
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsDoor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A23C
	ldr r0, _0808A238
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartDoorCloseAnimation
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0808A240
	.align 2, 0
_0808A238: .4byte 0x0846F594
_0808A23C:
	movs r0, #1
	rsbs r0, r0, #0
_0808A240:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FieldAnimateDoorClose

	thumb_func_start FieldAnimateDoorOpen
FieldAnimateDoorOpen: @ 0x0808A248
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsDoor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A274
	ldr r0, _0808A270
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartDoorOpenAnimation
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0808A278
	.align 2, 0
_0808A270: .4byte 0x0846F594
_0808A274:
	movs r0, #1
	rsbs r0, r0, #0
_0808A278:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FieldAnimateDoorOpen

	thumb_func_start FieldIsDoorAnimationRunning
FieldIsDoorAnimationRunning: @ 0x0808A280
	push {lr}
	ldr r0, _0808A290
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0808A290: .4byte 0x08089FB9
	thumb_func_end FieldIsDoorAnimationRunning

	thumb_func_start GetDoorSoundEffect
GetDoorSoundEffect: @ 0x0808A294
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _0808A2B4
	adds r1, r3, #0
	bl cur_mapdata_get_door_x2_at
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808A2BC
	cmp r0, #1
	bne _0808A2B8
	movs r0, #0x12
	b _0808A2C2
	.align 2, 0
_0808A2B4: .4byte 0x0846F594
_0808A2B8:
	cmp r0, #2
	beq _0808A2C0
_0808A2BC:
	movs r0, #8
	b _0808A2C2
_0808A2C0:
	movs r0, #0x2f
_0808A2C2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetDoorSoundEffect

	thumb_func_start sub_0808A2C8
sub_0808A2C8: @ 0x0808A2C8
	push {lr}
	ldr r0, _0808A2E8
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A2F4
	ldr r0, _0808A2EC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _0808A2F0
	cmp r1, r0
	bne _0808A2F4
	movs r0, #1
	b _0808A2F6
	.align 2, 0
_0808A2E8: .4byte 0x00004002
_0808A2EC: .4byte 0x03005AEC
_0808A2F0: .4byte 0x0000101A
_0808A2F4:
	movs r0, #0
_0808A2F6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0808A2C8

