.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08152084
sub_08152084: @ 0x08152084
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldr r0, [sp, #0x24]
	ldr r4, [sp, #0x28]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r8, r4
	movs r0, #0
	lsrs r4, r3, #0x18
	cmp r0, r8
	bhs _081520FE
_081520B6:
	ldr r2, [sp]
	movs r3, #0
	adds r6, r4, #1
	adds r0, #1
	mov ip, r0
	cmp r3, r7
	bhs _081520E8
	lsls r5, r4, #6
_081520C6:
	lsls r0, r2, #1
	adds r0, r0, r5
	add r0, sl
	mov r1, sb
	strh r1, [r0]
	adds r1, r2, #1
	adds r0, r1, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r7
	blo _081520C6
_081520E8:
	adds r0, r6, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r6, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r8
	blo _081520B6
_081520FE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08152084

	thumb_func_start sub_08152110
sub_08152110: @ 0x08152110
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldr r0, [sp, #0x24]
	ldr r4, [sp, #0x28]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sb, r4
	movs r0, #0
	adds r5, r1, #0
	lsrs r4, r3, #0x18
	cmp r0, sb
	bhs _0815218A
_08152140:
	ldr r2, [sp]
	movs r3, #0
	adds r7, r4, #1
	adds r0, #1
	mov r8, r0
	cmp r3, ip
	bhs _08152174
	lsls r6, r4, #6
_08152150:
	lsls r0, r2, #1
	adds r0, r0, r6
	add r0, sl
	ldrh r1, [r5]
	strh r1, [r0]
	adds r5, #2
	adds r1, r2, #1
	adds r0, r1, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, ip
	blo _08152150
_08152174:
	adds r0, r7, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, sb
	blo _08152140
_0815218A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08152110

	thumb_func_start sub_0815219C
sub_0815219C: @ 0x0815219C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0
	cmp r4, #0
	beq _081521DA
	cmp r4, #0x40
	bls _081521B2
	movs r4, #0x40
_081521B2:
	ldr r6, _081521E0
	movs r0, #8
	bl AllocZeroed
	str r0, [r6]
	cmp r0, #0
	beq _081521DA
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	bl AllocZeroed
	ldr r1, [r6]
	str r0, [r1, #4]
	cmp r0, #0
	bne _081521E4
	adds r0, r1, #0
	bl Free
	str r5, [r6]
_081521DA:
	movs r0, #0
	b _08152220
	.align 2, 0
_081521E0: .4byte 0x0203A884
_081521E4:
	strb r4, [r1]
	cmp r5, r4
	bhs _0815221E
	adds r3, r6, #0
	ldr r0, _0815222C
	mov ip, r0
	movs r2, #4
	mov r8, r2
_081521F4:
	ldr r0, [r3]
	ldr r2, [r0, #4]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #4
	adds r2, r1, r2
	mov r0, ip
	ldm r0!, {r6, r7}
	stm r2!, {r6, r7}
	ldr r0, [r3]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, #0x19]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r4
	blo _081521F4
_0815221E:
	movs r0, #1
_08152220:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0815222C: .4byte 0x082BF2F8
	thumb_func_end sub_0815219C

	thumb_func_start sub_08152230
sub_08152230: @ 0x08152230
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r0, _08152244
	ldr r2, [r0]
	adds r5, r0, #0
	cmp r2, #0
	bne _08152248
	movs r0, #0
	b _081522A0
	.align 2, 0
_08152244: .4byte 0x0203A884
_08152248:
	ldrb r2, [r2]
	cmp r3, r2
	bhs _0815226E
	ldr r0, _081522A8
	mov ip, r0
	ldr r4, _081522AC
	adds r2, r5, #0
_08152256:
	lsls r1, r3, #3
	add r1, ip
	adds r0, r4, #0
	ldm r0!, {r6, r7}
	stm r1!, {r6, r7}
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r3, r0
	blo _08152256
_0815226E:
	ldr r1, [r5]
	ldrb r0, [r1]
	lsls r2, r0, #1
	adds r2, r2, r0
	ldr r0, [r1, #4]
	lsls r2, r2, #4
	movs r1, #0
	bl memset
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl Free
	ldr r0, [r5]
	movs r4, #0
	str r4, [r0, #4]
	movs r1, #0
	movs r2, #8
	bl memset
	ldr r0, [r5]
	bl Free
	str r4, [r5]
	movs r0, #1
_081522A0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081522A8: .4byte 0x03002598
_081522AC: .4byte 0x082BF2F8
	thumb_func_end sub_08152230

	thumb_func_start sub_081522B0
sub_081522B0: @ 0x081522B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	ldr r0, _081522CC
	ldr r1, [r0]
	adds r3, r0, #0
	cmp r1, #0
	beq _081522C8
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _081522D0
_081522C8:
	movs r0, #0
	b _081523AE
	.align 2, 0
_081522CC: .4byte 0x0203A884
_081522D0:
	ldrb r1, [r1]
	cmp r6, r1
	bhs _081523AC
	adds r7, r3, #0
	movs r0, #3
	mov r8, r0
_081522DC:
	ldr r0, [r7]
	ldr r1, [r0, #4]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r5, r0, #4
	adds r2, r5, r1
	ldrb r1, [r2, #0x19]
	movs r0, #3
	ands r0, r1
	cmp r0, #3
	bne _0815239E
	ldr r1, [r2, #0x2c]
	cmp r1, #0
	beq _081522FE
	adds r0, r2, #0
	bl _call_via_r1
_081522FE:
	ldr r0, [r7]
	ldr r0, [r0, #4]
	adds r2, r5, r0
	ldrb r1, [r2, #0x19]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08152324
	lsls r0, r6, #3
	ldr r1, _0815231C
	adds r0, r0, r1
	ldr r1, _08152320
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	b _0815239C
	.align 2, 0
_0815231C: .4byte 0x03002598
_08152320: .4byte 0x082BF2F8
_08152324:
	ldrb r0, [r2, #0xe]
	ldrb r4, [r2, #0xa]
	adds r0, r0, r4
	strb r0, [r2]
	ldr r4, [r7]
	ldr r3, [r4, #4]
	adds r3, r5, r3
	movs r0, #8
	ldrsh r2, [r3, r0]
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	adds r2, r2, r0
	ldr r1, _081523B8
	adds r0, r1, #0
	ands r2, r0
	ldrh r0, [r3, #2]
	ldr r1, _081523BC
	mov ip, r1
	mov r1, ip
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #2]
	ldr r3, [r4, #4]
	adds r3, r5, r3
	ldrb r0, [r3, #0x19]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #2
	ldrb r1, [r3, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r2, r4, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #5]
	ldr r4, [r7]
	ldr r2, [r4, #4]
	adds r2, r5, r2
	ldrh r3, [r2, #0x14]
	ldr r1, _081523C0
	adds r0, r1, #0
	adds r1, r3, #0
	ands r1, r0
	mov ip, r1
	ldrh r0, [r2, #4]
	ldr r3, _081523C4
	adds r1, r3, #0
	ands r0, r1
	mov r1, ip
	orrs r0, r1
	strh r0, [r2, #4]
	lsls r1, r6, #3
	ldr r2, _081523C8
	ldr r0, [r4, #4]
	adds r1, r1, r2
	adds r0, r5, r0
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
_0815239C:
	ldr r3, _081523CC
_0815239E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r3]
	ldrb r0, [r0]
	cmp r6, r0
	blo _081522DC
_081523AC:
	movs r0, #1
_081523AE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081523B8: .4byte 0x000001FF
_081523BC: .4byte 0xFFFFFE00
_081523C0: .4byte 0x000003FF
_081523C4: .4byte 0xFFFFFC00
_081523C8: .4byte 0x03002598
_081523CC: .4byte 0x0203A884
	thumb_func_end sub_081522B0

	thumb_func_start sub_081523D0
sub_081523D0: @ 0x081523D0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r4, #0
	beq _0815240C
	ldrh r0, [r4, #0x10]
	bl GetSpriteTileStartByTag
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08152408
	cmp r5, r0
	beq _0815240C
	strb r6, [r4, #0x18]
	ldrb r0, [r4, #1]
	lsrs r0, r0, #6
	ldrb r1, [r4, #3]
	lsrs r1, r1, #6
	bl sub_08035450
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	adds r0, r5, r0
	strh r0, [r4, #0x14]
	movs r0, #1
	b _0815240E
	.align 2, 0
_08152408: .4byte 0x0000FFFF
_0815240C:
	movs r0, #0
_0815240E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081523D0

	thumb_func_start sub_08152414
sub_08152414: @ 0x08152414
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08152444
	ldr r0, [r0]
	cmp r0, #0
	beq _08152448
	ldrb r1, [r0]
	cmp r2, r1
	bhs _08152448
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r3, r0, r1
	ldrb r1, [r3, #0x19]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08152448
	str r4, [r3, #0x2c]
	adds r0, r2, #0
	b _0815244A
	.align 2, 0
_08152444: .4byte 0x0203A884
_08152448:
	movs r0, #0xff
_0815244A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08152414

	thumb_func_start sub_08152450
sub_08152450: @ 0x08152450
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r0, _08152488
	ldr r0, [r0]
	cmp r0, #0
	beq _08152484
	ldrb r1, [r0]
	cmp r3, r1
	bhs _08152484
	ldr r1, [r0, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r2, r0, r1
	ldrb r1, [r2, #0x19]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08152484
	cmp r4, #7
	bls _0815248C
_08152484:
	movs r0, #0xff
	b _08152498
	.align 2, 0
_08152488: .4byte 0x0203A884
_0815248C:
	lsls r1, r4, #1
	adds r0, r2, #0
	adds r0, #0x1a
	adds r0, r0, r1
	strh r5, [r0]
	adds r0, r3, #0
_08152498:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08152450

	thumb_func_start sub_081524A0
sub_081524A0: @ 0x081524A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r0
	ldr r0, [sp, #0x30]
	ldr r4, [sp, #0x34]
	ldr r5, [sp, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0xc]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov sl, r5
	movs r5, #0
	ldr r0, _081524EC
	ldr r0, [r0]
	cmp r0, #0
	beq _0815253A
	mov r1, sb
	cmp r1, #0
	bne _0815250C
	b _0815253A
	.align 2, 0
_081524EC: .4byte 0x0203A884
_081524F0:
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x30
	bl memset
	strb r4, [r5, #0x16]
	ldrb r0, [r5, #0x19]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r5, #0x19]
	b _08152536
_0815250C:
	movs r4, #0
	ldrb r1, [r0]
	cmp r5, r1
	bhs _08152536
	ldr r6, [r0, #4]
	adds r3, r1, #0
	movs r7, #1
_0815251A:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r2, r0, r6
	ldrb r1, [r2, #0x19]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _081524F0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r3
	blo _0815251A
_08152536:
	cmp r5, #0
	bne _0815253E
_0815253A:
	movs r0, #0xff
	b _0815259C
_0815253E:
	adds r1, r5, #0
	mov r0, sb
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0x10]
	mov r1, r8
	strh r1, [r5, #0x12]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r5, #8]
	mov r3, sp
	ldrh r3, [r3, #8]
	strh r3, [r5, #0xa]
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #4
	ldrb r1, [r5, #5]
	movs r4, #0xf
	ands r4, r1
	orrs r4, r0
	strb r4, [r5, #5]
	mov r0, sl
	cmp r0, #3
	bhi _08152592
	movs r1, #3
	ands r1, r0
	lsls r3, r1, #3
	ldrb r2, [r5, #0x19]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r5, #0x19]
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r1
	strb r4, [r5, #5]
_08152592:
	adds r0, r5, #0
	ldr r1, [sp, #0xc]
	bl sub_081523D0
	ldrb r0, [r5, #0x16]
_0815259C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081524A0

	thumb_func_start sub_081525AC
sub_081525AC: @ 0x081525AC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _081525D4
	ldr r0, [r6]
	cmp r0, #0
	beq _081525CE
	ldr r1, [r0, #4]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r4, r0, #4
	adds r2, r4, r1
	ldrb r1, [r2, #0x19]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081525D8
_081525CE:
	movs r0, #0xff
	b _08152618
	.align 2, 0
_081525D4: .4byte 0x0203A884
_081525D8:
	adds r0, r2, #0
	movs r1, #0
	movs r2, #0x30
	bl memset
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	movs r1, #0xa0
	strb r1, [r0]
	ldr r3, [r6]
	ldr r2, [r3, #4]
	adds r2, r4, r2
	ldrh r1, [r2, #2]
	ldr r0, _08152620
	ands r0, r1
	movs r1, #0xf0
	orrs r0, r1
	strh r0, [r2, #2]
	ldr r1, [r3, #4]
	adds r1, r4, r1
	ldrb r0, [r1, #0x19]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1, #0x19]
	lsls r1, r5, #3
	ldr r0, _08152624
	adds r1, r1, r0
	ldr r0, _08152628
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r0, r5, #0
_08152618:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08152620: .4byte 0xFFFFFE00
_08152624: .4byte 0x03002598
_08152628: .4byte 0x082BF2F8
	thumb_func_end sub_081525AC

