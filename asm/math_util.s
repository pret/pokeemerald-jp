.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081514A4
sub_081514A4: @ 0x081514A4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081514B2
	cmp r0, #1
	beq _081514DC
_081514B2:
	ldr r1, _081514D8
	ldr r2, [r1]
	movs r3, #0
	movs r0, #2
	strb r0, [r2, #0x1b]
	ldr r0, [r1]
	strb r3, [r0, #0x19]
	ldr r2, [r1]
	movs r0, #0x14
	strb r0, [r2, #0x1a]
	ldr r1, [r1]
	movs r0, #0xc
	strb r0, [r1, #0x18]
	bl sub_08151064
	bl sub_081511F0
	b _081514FE
	.align 2, 0
_081514D8: .4byte 0x0203A878
_081514DC:
	ldr r1, _0815150C
	ldr r2, [r1]
	movs r0, #2
	strb r0, [r2, #0x1b]
	ldr r2, [r1]
	movs r0, #0x1c
	strb r0, [r2, #0x19]
	ldr r2, [r1]
	movs r0, #0x14
	strb r0, [r2, #0x1a]
	ldr r1, [r1]
	movs r0, #4
	strb r0, [r1, #0x18]
	bl sub_08151064
	bl sub_08151364
_081514FE:
	ldr r0, _0815150C
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #0x1c]
	pop {r0}
	bx r0
	.align 2, 0
_0815150C: .4byte 0x0203A878
	thumb_func_end sub_081514A4

	thumb_func_start sub_08151510
sub_08151510: @ 0x08151510
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	adds r1, r0, #0
	cmp r0, #0
	bge _08151524
	adds r1, #0xff
_08151524:
	lsls r0, r1, #8
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end sub_08151510

	thumb_func_start sub_0815152C
sub_0815152C: @ 0x0815152C
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	muls r3, r2, r3
	movs r1, #1
	lsls r1, r0
	adds r0, r3, #0
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end sub_0815152C

	thumb_func_start sub_08151550
sub_08151550: @ 0x08151550
	push {r4, r5, r6, r7, lr}
	adds r2, r1, #0
	adds r4, r0, #0
	asrs r5, r0, #0x1f
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r7, r5, #0
	adds r6, r4, #0
	cmp r5, #0
	bge _08151576
	movs r6, #0xff
	movs r7, #0
	adds r6, r6, r4
	adcs r7, r5
_08151576:
	lsls r3, r7, #0x18
	lsrs r2, r6, #8
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r7, #8
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08151550

	thumb_func_start sub_0815158C
sub_0815158C: @ 0x0815158C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	beq _081515A8
	lsls r0, r0, #0x10
	asrs r0, r0, #8
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _081515AA
_081515A8:
	movs r0, #0
_081515AA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0815158C

	thumb_func_start sub_081515B0
sub_081515B0: @ 0x081515B0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	cmp r1, #0
	beq _081515D2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r0, r3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _081515D4
_081515D2:
	movs r0, #0
_081515D4:
	pop {r1}
	bx r1
	thumb_func_end sub_081515B0

	thumb_func_start sub_081515D8
sub_081515D8: @ 0x081515D8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	cmp r6, #0
	beq _081515F8
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	lsrs r5, r2, #0x18
	lsls r4, r3, #8
	adds r1, r5, #0
	orrs r1, r4
	lsls r0, r2, #8
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	bl __divdi3
	b _081515FA
_081515F8:
	movs r0, #0
_081515FA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081515D8

	thumb_func_start sub_08151600
sub_08151600: @ 0x08151600
	push {lr}
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end sub_08151600

	thumb_func_start sub_08151618
sub_08151618: @ 0x08151618
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08151618

