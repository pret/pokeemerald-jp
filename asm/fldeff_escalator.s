.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_080E0834
sub_080E0834: @ 0x080E0834
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	ldr r2, _080E08C8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #0x10]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r1, #0x12]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r4, [r1, #0xa]
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _080E08F8
	movs r2, #0
	lsls r5, r5, #0x10
	str r5, [sp, #0xc]
	lsls r0, r3, #0x10
	lsls r1, r4, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r0, r1, #1
	mov r1, sb
	adds r7, r0, r1
_080E0888:
	movs r4, #0
	lsls r2, r2, #0x10
	mov r8, r2
	asrs r0, r2, #0x10
	ldr r2, [sp]
	adds r6, r2, r0
_080E0894:
	ldr r0, [sp, #0xc]
	asrs r1, r0, #0x10
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	adds r5, r1, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridGetMetatileIdAt
	movs r2, #0
	ldrsh r1, [r7, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _080E08DC
	ldr r0, [sp, #4]
	cmp r0, #2
	beq _080E08CC
	ldrh r0, [r7, #2]
	mov r2, sl
	orrs r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridSetMetatileIdAt
	b _080E08DC
	.align 2, 0
_080E08C8: .4byte 0x03005B60
_080E08CC:
	mov r1, sb
	ldrh r0, [r1]
	mov r2, sl
	orrs r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridSetMetatileIdAt
_080E08DC:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r4, r2
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080E0894
	adds r0, r2, #0
	add r0, r8
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080E0888
	b _080E0980
_080E08F8:
	movs r2, #0
	lsls r5, r5, #0x10
	str r5, [sp, #0xc]
	lsls r0, r3, #0x10
	lsls r1, r4, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	asrs r7, r1, #0x10
_080E0908:
	movs r4, #0
	lsls r2, r2, #0x10
	mov r8, r2
	asrs r0, r2, #0x10
	ldr r1, [sp, #8]
	adds r6, r1, r0
_080E0914:
	ldr r2, [sp, #0xc]
	asrs r1, r2, #0x10
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	adds r5, r1, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridGetMetatileIdAt
	movs r1, #2
	subs r1, r1, r7
	lsls r1, r1, #1
	add r1, sb
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _080E0966
	cmp r7, #2
	beq _080E0956
	movs r0, #1
	subs r0, r0, r7
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	mov r2, sl
	orrs r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridSetMetatileIdAt
	b _080E0966
_080E0956:
	mov r1, sb
	ldrh r0, [r1, #4]
	mov r2, sl
	orrs r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridSetMetatileIdAt
_080E0966:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r4, r2
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080E0914
	adds r0, r2, #0
	add r0, r8
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080E0908
_080E0980:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080E0834

	thumb_func_start sub_080E0990
sub_080E0990: @ 0x080E0990
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	ldr r1, _080E09B8
	adds r4, r0, r1
	movs r0, #1
	strh r0, [r4, #6]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bhi _080E0A2A
	lsls r0, r0, #2
	ldr r1, _080E09BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E09B8: .4byte 0x03005B68
_080E09BC: .4byte 0x080E09C0
_080E09C0: @ jump table
	.4byte _080E09DC @ case 0
	.4byte _080E09E4 @ case 1
	.4byte _080E09EC @ case 2
	.4byte _080E09F4 @ case 3
	.4byte _080E09FC @ case 4
	.4byte _080E0A10 @ case 5
	.4byte _080E0A20 @ case 6
_080E09DC:
	ldr r1, _080E09E0
	b _080E0A12
	.align 2, 0
_080E09E0: .4byte 0x08562A3E
_080E09E4:
	ldr r1, _080E09E8
	b _080E0A12
	.align 2, 0
_080E09E8: .4byte 0x08562A44
_080E09EC:
	ldr r1, _080E09F0
	b _080E09FE
	.align 2, 0
_080E09F0: .4byte 0x08562A4A
_080E09F4:
	ldr r1, _080E09F8
	b _080E0A12
	.align 2, 0
_080E09F8: .4byte 0x08562A50
_080E09FC:
	ldr r1, _080E0A0C
_080E09FE:
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r3, #0
	bl sub_080E0834
	b _080E0A2A
	.align 2, 0
_080E0A0C: .4byte 0x08562A56
_080E0A10:
	ldr r1, _080E0A1C
_080E0A12:
	adds r0, r3, #0
	movs r2, #0
	bl sub_080E0834
	b _080E0A2A
	.align 2, 0
_080E0A1C: .4byte 0x08562A5C
_080E0A20:
	ldr r1, _080E0A54
	adds r0, r3, #0
	movs r2, #0
	bl sub_080E0834
_080E0A2A:
	ldrh r0, [r4]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	strh r0, [r4]
	adds r5, r0, #0
	cmp r5, #0
	bne _080E0A4E
	bl DrawWholeMapView
	movs r1, #2
	ldrsh r0, [r4, r1]
	adds r0, #1
	movs r1, #3
	bl __modsi3
	strh r0, [r4, #2]
	strh r5, [r4, #6]
_080E0A4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E0A54: .4byte 0x08562A62
	thumb_func_end sub_080E0990

	thumb_func_start sub_080E0A58
sub_080E0A58: @ 0x080E0A58
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r6, _080E0A9C
	adds r0, r6, #0
	movs r1, #0
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080E0AA0
	adds r7, r0, r1
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #0xa
	bl PlayerGetDestCoords
	movs r0, #0
	strh r0, [r7]
	strh r0, [r7, #2]
	strh r5, [r7, #4]
	adds r0, r4, #0
	bl _call_via_r6
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E0A9C: .4byte 0x080E0991
_080E0AA0: .4byte 0x03005B68
	thumb_func_end sub_080E0A58

	thumb_func_start sub_080E0AA4
sub_080E0AA4: @ 0x080E0AA4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080E0A58
	ldr r1, _080E0AB8
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080E0AB8: .4byte 0x02039C2C
	thumb_func_end sub_080E0AA4

	thumb_func_start sub_080E0ABC
sub_080E0ABC: @ 0x080E0ABC
	push {lr}
	ldr r0, _080E0ACC
	ldrb r0, [r0]
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_080E0ACC: .4byte 0x02039C2C
	thumb_func_end sub_080E0ABC

	thumb_func_start sub_080E0AD0
sub_080E0AD0: @ 0x080E0AD0
	push {lr}
	ldr r2, _080E0AF4
	ldr r0, _080E0AF8
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _080E0AFC
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #2
	bne _080E0AFC
	movs r0, #0
	b _080E0AFE
	.align 2, 0
_080E0AF4: .4byte 0x03005B60
_080E0AF8: .4byte 0x02039C2C
_080E0AFC:
	movs r0, #1
_080E0AFE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080E0AD0

