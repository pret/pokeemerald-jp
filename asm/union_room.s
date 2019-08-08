.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start nullsub_14
nullsub_14: @ 0x08011FD4
	bx lr
	.align 2, 0
	thumb_func_end nullsub_14

	thumb_func_start sub_08011FD8
sub_08011FD8: @ 0x08011FD8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r0, r6, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	lsls r4, r4, #8
	movs r0, #0x90
	lsls r0, r0, #6
	cmp r4, r0
	beq _08012074
	cmp r4, r0
	bgt _08012012
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	beq _08012024
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r4, r0
	beq _08012030
	b _08012092
_08012012:
	movs r0, #0x94
	lsls r0, r0, #6
	cmp r4, r0
	beq _08012040
	movs r0, #0xd4
	lsls r0, r0, #6
	cmp r4, r0
	beq _08012050
	b _08012092
_08012024:
	ldr r1, _0801202C
	subs r0, r5, #1
	lsls r0, r0, #2
	b _08012058
	.align 2, 0
_0801202C: .4byte 0x082C0840
_08012030:
	ldr r1, _0801203C
	subs r0, r5, #1
	lsls r0, r0, #2
	adds r1, #0x14
	b _08012058
	.align 2, 0
_0801203C: .4byte 0x082C0840
_08012040:
	ldr r1, _0801204C
	subs r0, r5, #1
	lsls r0, r0, #2
	adds r1, #0x28
	b _08012058
	.align 2, 0
_0801204C: .4byte 0x082C0840
_08012050:
	ldr r1, _08012070
	subs r0, r5, #1
	lsls r0, r0, #2
	adds r1, #0x3c
_08012058:
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	movs r3, #2
	bl sub_08016EA4
	b _08012092
	.align 2, 0
_08012070: .4byte 0x082C0840
_08012074:
	ldr r1, _080120A4
	subs r0, r5, #1
	lsls r0, r0, #2
	adds r1, #0x50
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	movs r3, #2
	bl sub_08016EA4
_08012092:
	adds r0, r6, #0
	movs r1, #2
	bl CopyWindowToVram
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080120A4: .4byte 0x082C0840
	thumb_func_end sub_08011FD8

	thumb_func_start sub_080120A8
sub_080120A8: @ 0x080120A8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x28
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0801212C
	mov r8, r0
	ldr r1, [r0]
	add r0, sp, #8
	movs r2, #5
	bl StringCopyN_Multibyte
	movs r0, #3
	str r0, [sp]
	movs r1, #0
	mov sb, r1
	str r1, [sp, #4]
	adds r0, r4, #0
	movs r1, #1
	add r2, sp, #8
	movs r3, #2
	bl sub_08016EA4
	add r5, sp, #0x1c
	ldr r1, _08012130
	adds r0, r5, #0
	bl StringCopy
	add r6, sp, #0x10
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xa
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	movs r2, #2
	movs r3, #5
	bl ConvertIntToDecimalStringN
	adds r0, r5, #0
	adds r1, r6, #0
	bl StringAppend
	movs r0, #0x10
	str r0, [sp]
	mov r0, sb
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	movs r3, #2
	bl sub_08016EA4
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801212C: .4byte 0x03005AF0
_08012130: .4byte 0x082C0648
	thumb_func_end sub_080120A8

	thumb_func_start sub_08012134
sub_08012134: @ 0x08012134
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	subs r0, r1, #1
	cmp r0, #0x1b
	bhi _080121C8
	lsls r0, r0, #2
	ldr r1, _0801214C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801214C: .4byte 0x08012150
_08012150: @ jump table
	.4byte _080121C0 @ case 0
	.4byte _080121C0 @ case 1
	.4byte _080121C0 @ case 2
	.4byte _080121C0 @ case 3
	.4byte _080121C8 @ case 4
	.4byte _080121C0 @ case 5
	.4byte _080121C0 @ case 6
	.4byte _080121C8 @ case 7
	.4byte _080121C0 @ case 8
	.4byte _080121C0 @ case 9
	.4byte _080121C0 @ case 10
	.4byte _080121C8 @ case 11
	.4byte _080121C8 @ case 12
	.4byte _080121C0 @ case 13
	.4byte _080121C0 @ case 14
	.4byte _080121C0 @ case 15
	.4byte _080121C8 @ case 16
	.4byte _080121C8 @ case 17
	.4byte _080121C8 @ case 18
	.4byte _080121C8 @ case 19
	.4byte _080121C8 @ case 20
	.4byte _080121C8 @ case 21
	.4byte _080121C0 @ case 22
	.4byte _080121C0 @ case 23
	.4byte _080121C0 @ case 24
	.4byte _080121C0 @ case 25
	.4byte _080121C0 @ case 26
	.4byte _080121C0 @ case 27
_080121C0:
	ldr r0, _080121CC
	ldr r1, _080121D0
	bl StringExpandPlaceholders
_080121C8:
	pop {r0}
	bx r0
	.align 2, 0
_080121CC: .4byte 0x02021C7C
_080121D0: .4byte 0x082C069C
	thumb_func_end sub_08012134

	thumb_func_start sub_080121D4
sub_080121D4: @ 0x080121D4
	push {lr}
	subs r0, #9
	cmp r0, #0x12
	bhi _0801223C
	lsls r0, r0, #2
	ldr r1, _080121E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080121E8: .4byte 0x080121EC
_080121EC: @ jump table
	.4byte _08012238 @ case 0
	.4byte _08012238 @ case 1
	.4byte _08012238 @ case 2
	.4byte _0801223C @ case 3
	.4byte _0801223C @ case 4
	.4byte _0801223C @ case 5
	.4byte _08012238 @ case 6
	.4byte _08012238 @ case 7
	.4byte _0801223C @ case 8
	.4byte _0801223C @ case 9
	.4byte _0801223C @ case 10
	.4byte _0801223C @ case 11
	.4byte _0801223C @ case 12
	.4byte _0801223C @ case 13
	.4byte _08012238 @ case 14
	.4byte _08012238 @ case 15
	.4byte _08012238 @ case 16
	.4byte _08012238 @ case 17
	.4byte _08012238 @ case 18
_08012238:
	movs r0, #1
	b _0801223E
_0801223C:
	movs r0, #0
_0801223E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080121D4

	thumb_func_start BerryBlenderLinkBecomeLeader
BerryBlenderLinkBecomeLeader: @ 0x08012244
	push {lr}
	ldr r0, _08012274
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08012278
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0801227C
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _08012280
	str r1, [r0]
	movs r0, #0
	strb r0, [r1, #0xc]
	strb r0, [r1, #0xd]
	ldr r1, _08012284
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08012274: .4byte 0x08012289
_08012278: .4byte 0x020228E4
_0801227C: .4byte 0x03005B68
_08012280: .4byte 0x03000DA0
_08012284: .4byte 0x02037290
	thumb_func_end BerryBlenderLinkBecomeLeader

	thumb_func_start sub_08012288
sub_08012288: @ 0x08012288
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080122A8
	ldr r5, [r0]
	ldrb r0, [r5, #0xc]
	cmp r0, #0x1e
	bls _0801229E
	bl _08012A54
_0801229E:
	lsls r0, r0, #2
	ldr r1, _080122AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080122A8: .4byte 0x020228E4
_080122AC: .4byte 0x080122B0
_080122B0: @ jump table
	.4byte _0801232C @ case 0
	.4byte _08012A54 @ case 1
	.4byte _08012A54 @ case 2
	.4byte _080123A4 @ case 3
	.4byte _080124CC @ case 4
	.4byte _08012554 @ case 5
	.4byte _08012570 @ case 6
	.4byte _08012690 @ case 7
	.4byte _08012A54 @ case 8
	.4byte _08012600 @ case 9
	.4byte _08012618 @ case 10
	.4byte _080126AC @ case 11
	.4byte _08012760 @ case 12
	.4byte _0801285E @ case 13
	.4byte _0801287C @ case 14
	.4byte _0801288E @ case 15
	.4byte _080128AC @ case 16
	.4byte _08012966 @ case 17
	.4byte _0801297C @ case 18
	.4byte _080128F6 @ case 19
	.4byte _08012914 @ case 20
	.4byte _080129D4 @ case 21
	.4byte _08012A00 @ case 22
	.4byte _080129D4 @ case 23
	.4byte _080129EA @ case 24
	.4byte _08012A54 @ case 25
	.4byte _08012A18 @ case 26
	.4byte _08012A54 @ case 27
	.4byte _08012A54 @ case 28
	.4byte _08012658 @ case 29
	.4byte _080129BA @ case 30
_0801232C:
	ldr r0, _0801238C
	ldrh r2, [r0]
	adds r3, r0, #0
	cmp r2, #0x14
	bne _0801234C
	ldr r0, _08012390
	ldr r0, [r0]
	ldr r1, _08012394
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _0801234C
	adds r0, r2, #1
	strh r0, [r3]
_0801234C:
	ldr r2, _08012398
	ldr r1, _0801239C
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2]
	ldr r4, _080123A0
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsrs r0, r0, #8
	strb r0, [r4]
	ldrb r0, [r2]
	movs r1, #0
	movs r2, #0
	bl sub_08010A74
	bl sub_0800AF5C
	bl OpenLink
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	bl sub_080116FC
	movs r0, #3
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_0801238C: .4byte 0x02037280
_08012390: .4byte 0x03005AF0
_08012394: .4byte 0x00000CA9
_08012398: .4byte 0x020228E0
_0801239C: .4byte 0x082C1FCC
_080123A0: .4byte 0x020228E1
_080123A4:
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r5, #4]
	movs r0, #0xa0
	bl AllocZeroed
	str r0, [r5]
	movs r0, #0xa0
	bl AllocZeroed
	str r0, [r5, #8]
	ldr r0, [r5, #4]
	movs r1, #4
	bl sub_080170B0
	ldr r0, [r5]
	movs r1, #5
	bl sub_08017044
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x10
	bl sub_0800DA5C
	ldr r1, [r5]
	movs r3, #0
	movs r0, #0
	strh r0, [r1, #0x18]
	ldr r2, [r5]
	ldrb r1, [r2, #0x1a]
	subs r0, #4
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x1a]
	ldr r2, [r5]
	ldrb r1, [r2, #0x1a]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x1a]
	ldr r0, [r5]
	strb r3, [r0, #0x1b]
	ldr r0, [r5, #4]
	movs r1, #0xff
	bl sub_08016AD0
	strb r0, [r5, #0x17]
	ldr r0, _08012424
	bl AddWindow
	strb r0, [r5, #0x10]
	ldr r0, _08012428
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	blt _0801243C
	cmp r1, #4
	ble _0801242C
	cmp r1, #5
	beq _08012434
	b _0801243C
	.align 2, 0
_08012424: .4byte 0x082C1FC4
_08012428: .4byte 0x020228E1
_0801242C:
	ldr r0, _08012430
	b _08012436
	.align 2, 0
_08012430: .4byte 0x082C2024
_08012434:
	ldr r0, _080124B8
_08012436:
	bl AddWindow
	strb r0, [r5, #0xf]
_0801243C:
	ldr r0, _080124BC
	bl AddWindow
	strb r0, [r5, #0x11]
	ldrb r0, [r5, #0x10]
	movs r1, #0x22
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0x10]
	ldr r2, _080124C0
	movs r1, #2
	str r1, [sp]
	movs r4, #4
	str r4, [sp, #4]
	movs r1, #1
	movs r3, #8
	bl sub_08016EA4
	ldrb r0, [r5, #0x10]
	bl PutWindowTilemap
	ldrb r0, [r5, #0x10]
	movs r1, #2
	bl CopyWindowToVram
	ldrb r0, [r5, #0xf]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldr r0, _080124C4
	adds r2, r0, #0
	ldr r1, _080124C8
	ldm r1!, {r3, r6, r7}
	stm r2!, {r3, r6, r7}
	ldm r1!, {r3, r6, r7}
	stm r2!, {r3, r6, r7}
	ldrb r1, [r5, #0xf]
	strb r1, [r0, #0x10]
	movs r1, #0
	movs r2, #0
	bl ListMenuInit
	strb r0, [r5, #0x12]
	ldrb r0, [r5, #0x11]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r5, #0x11]
	bl PutWindowTilemap
	ldrb r0, [r5, #0x11]
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	strb r0, [r5, #0x13]
	strb r4, [r5, #0xc]
	b _08012A54
	.align 2, 0
_080124B8: .4byte 0x082C202C
_080124BC: .4byte 0x082C2034
_080124C0: .4byte 0x082C08A4
_080124C4: .4byte 0x03006050
_080124C8: .4byte 0x082C2064
_080124CC:
	ldr r0, _08012504
	ldr r2, _08012508
	ldr r4, _0801250C
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08012510
	ldrb r2, [r0]
	lsrs r0, r2, #4
	cmp r0, #0
	beq _08012530
	ldrb r1, [r5, #0x13]
	subs r0, #1
	cmp r1, r0
	ble _0801251C
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _0801251C
	ldr r0, _08012514
	ldr r1, _08012518
	bl StringExpandPlaceholders
	b _08012538
	.align 2, 0
_08012504: .4byte 0x02021C40
_08012508: .4byte 0x082C1E58
_0801250C: .4byte 0x020228E0
_08012510: .4byte 0x020228E1
_08012514: .4byte 0x02021C7C
_08012518: .4byte 0x082C06B8
_0801251C:
	ldr r0, _08012528
	ldr r1, _0801252C
	bl StringExpandPlaceholders
	b _08012538
	.align 2, 0
_08012528: .4byte 0x02021C7C
_0801252C: .4byte 0x082C069C
_08012530:
	ldr r0, _0801254C
	ldrb r1, [r4]
	bl sub_08012134
_08012538:
	ldrb r0, [r5, #0x11]
	ldr r1, _08012550
	ldrb r1, [r1]
	ldrb r2, [r5, #0x13]
	bl sub_08011FD8
	movs r0, #5
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_0801254C: .4byte 0x02021C7C
_08012550: .4byte 0x020228E1
_08012554:
	adds r0, r5, #0
	adds r0, #0xd
	ldr r1, _0801256C
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08012566
	b _08012A54
_08012566:
	movs r0, #6
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_0801256C: .4byte 0x02021C7C
_08012570:
	adds r0, r5, #0
	movs r1, #7
	movs r2, #0xa
	bl sub_08012D0C
	ldr r0, _08012590
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080125AC
	ldrb r0, [r5, #0x13]
	cmp r0, #1
	bne _08012594
	movs r0, #0x17
	b _080125AA
	.align 2, 0
_08012590: .4byte 0x03002360
_08012594:
	ldr r0, _080125A4
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _080125A8
	movs r0, #0x1e
	b _080125AA
	.align 2, 0
_080125A4: .4byte 0x020228E1
_080125A8:
	movs r0, #0x13
_080125AA:
	strb r0, [r5, #0xc]
_080125AC:
	ldr r0, _080125F8
	ldrb r2, [r0]
	lsrs r0, r2, #4
	cmp r0, #0
	beq _080125E2
	ldrb r1, [r5, #0x13]
	subs r0, #1
	cmp r1, r0
	ble _080125E2
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080125E2
	bl sub_08011D2C
	cmp r0, #0
	beq _080125E2
	ldr r0, _080125FC
	ldrh r1, [r0, #0x2e]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080125E2
	strb r4, [r5, #0xc]
	bl sub_0800E9F8
_080125E2:
	ldrb r0, [r5, #0xc]
	cmp r0, #6
	beq _080125EA
	b _08012A54
_080125EA:
	bl sub_080100EC
	cmp r0, #0
	bne _080125F4
	b _08012A54
_080125F4:
	b _0801275A
	.align 2, 0
_080125F8: .4byte 0x020228E1
_080125FC: .4byte 0x03002360
_08012600:
	bl sub_080100EC
	cmp r0, #0
	beq _0801260A
	b _08012A54
_0801260A:
	movs r0, #6
	strb r0, [r5, #0xc]
	ldr r0, [r5]
	bl sub_08012E9C
	strb r0, [r5, #0x13]
	b _08012A54
_08012618:
	movs r3, #0
	ldr r0, _08012650
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #2
	bne _08012628
	movs r3, #1
_08012628:
	adds r0, r5, #0
	adds r0, #0xd
	ldr r2, _08012654
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08012640
	b _08012A54
_08012640:
	ldr r0, [r5]
	bl sub_08012E9C
	strb r0, [r5, #0x13]
	ldrb r0, [r5, #0x12]
	bl RedrawListMenu
	b _08012960
	.align 2, 0
_08012650: .4byte 0x020228E0
_08012654: .4byte 0x082C09E0
_08012658:
	ldr r0, _08012688
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	movs r0, #2
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
	adds r0, r5, #0
	adds r0, #0xd
	ldr r2, _0801268C
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08012682
	b _08012A54
_08012682:
	movs r0, #0x15
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_08012688: .4byte 0x020228E1
_0801268C: .4byte 0x082C09E0
_08012690:
	adds r0, r5, #0
	adds r0, #0xd
	ldr r1, _080126A8
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080126A2
	b _08012A54
_080126A2:
	movs r0, #0xb
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_080126A8: .4byte 0x02021C7C
_080126AC:
	adds r4, r5, #0
	adds r4, #0xd
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	adds r0, #2
	bl ReadAsU16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r5, #0x13]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	adds r1, #0x10
	bl sub_0801014C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08016BC8
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0801272C
	cmp r1, r0
	bgt _080126F0
	subs r0, #2
	cmp r1, r0
	beq _0801275A
	b _08012A54
_080126F0:
	cmp r1, #0
	beq _080126FA
	cmp r1, #1
	beq _0801272C
	b _08012A54
_080126FA:
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	movs r0, #5
	strb r0, [r5, #0x19]
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	adds r0, #2
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #5
	ldr r2, [r5]
	adds r2, r2, r0
	adds r2, #0x10
	movs r0, #5
	b _08012750
_0801272C:
	movs r0, #6
	strb r0, [r5, #0x19]
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	adds r0, #2
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #5
	ldr r2, [r5]
	adds r2, r2, r0
	adds r2, #0x10
	movs r0, #6
_08012750:
	bl sub_08010188
	movs r0, #0xc
	strb r0, [r5, #0xc]
	b _08012A54
_0801275A:
	movs r0, #9
	strb r0, [r5, #0xc]
	b _08012A54
_08012760:
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	adds r0, #2
	bl ReadAsU16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r5, #0x13]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	adds r1, #0x10
	bl sub_08010214
	cmp r0, #1
	bne _0801284E
	ldrb r0, [r5, #0x19]
	cmp r0, #5
	bne _08012808
	ldr r1, [r5]
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1, #0x1b]
	ldrb r0, [r5, #0x12]
	bl RedrawListMenu
	ldrb r0, [r5, #0x13]
	adds r0, #1
	strb r0, [r5, #0x13]
	ldr r1, _080127C4
	ldrb r1, [r1]
	movs r3, #0xf
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, #0
	ands r0, r1
	cmp r2, r0
	bne _08012844
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _080127C0
	cmp r2, #4
	bne _080127C8
_080127C0:
	strb r3, [r5, #0xc]
	b _080127E4
	.align 2, 0
_080127C4: .4byte 0x020228E1
_080127C8:
	ldr r0, _080127F8
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r2, [r5]
	adds r1, r1, r2
	subs r1, #0x10
	bl StringCopy7
	ldr r0, _080127FC
	ldr r1, _08012800
	bl StringExpandPlaceholders
	movs r0, #0xd
	strb r0, [r5, #0xc]
_080127E4:
	bl sub_0800E9F8
	ldrb r0, [r5, #0x11]
	ldr r1, _08012804
	ldrb r1, [r1]
	ldrb r2, [r5, #0x13]
	bl sub_08011FD8
	b _08012848
	.align 2, 0
_080127F8: .4byte 0x02021C40
_080127FC: .4byte 0x02021C7C
_08012800: .4byte 0x082C0948
_08012804: .4byte 0x020228E1
_08012808:
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	adds r4, r0, #0
	adds r4, #0x10
	adds r0, #2
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_080118AC
	ldr r1, [r5]
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrb r2, [r1, #0x1a]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x1a]
	ldr r0, [r5]
	bl sub_08012E9C
	ldrb r0, [r5, #0x12]
	bl RedrawListMenu
_08012844:
	movs r0, #4
	strb r0, [r5, #0xc]
_08012848:
	movs r0, #0
	strb r0, [r5, #0x19]
	b _08012A54
_0801284E:
	cmp r0, #2
	beq _08012854
	b _08012A54
_08012854:
	movs r0, #0
	movs r1, #0
	bl sub_08011554
	b _08012960
_0801285E:
	adds r0, r5, #0
	adds r0, #0xd
	ldr r1, _08012878
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08012870
	b _08012A54
_08012870:
	movs r0, #0xe
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_08012878: .4byte 0x02021C7C
_0801287C:
	ldrb r0, [r5, #0xe]
	adds r0, #1
	strb r0, [r5, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bhi _0801288C
	b _08012A54
_0801288C:
	b _080128D2
_0801288E:
	adds r0, r5, #0
	adds r0, #0xd
	ldr r1, _080128A8
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080128A0
	b _08012A54
_080128A0:
	movs r0, #0x10
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_080128A8: .4byte 0x082C0914
_080128AC:
	adds r0, r5, #0
	adds r0, #0xd
	movs r1, #0
	bl sub_08016BC8
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080128D2
	cmp r1, #0
	bgt _080128CC
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080128D8
	b _08012A54
_080128CC:
	cmp r1, #1
	beq _080128D8
	b _08012A54
_080128D2:
	movs r0, #0x11
	strb r0, [r5, #0xc]
	b _08012A54
_080128D8:
	ldr r0, _080128EC
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _080128F0
	movs r0, #0x1e
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_080128EC: .4byte 0x020228E1
_080128F0:
	movs r0, #0x13
	strb r0, [r5, #0xc]
	b _08012A54
_080128F6:
	adds r0, r5, #0
	adds r0, #0xd
	ldr r1, _08012910
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08012908
	b _08012A54
_08012908:
	movs r0, #0x14
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_08012910: .4byte 0x082C092C
_08012914:
	adds r0, r5, #0
	adds r0, #0xd
	movs r1, #0
	bl sub_08016BC8
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080129CA
	cmp r1, #0
	bgt _08012934
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0801293A
	b _08012A54
_08012934:
	cmp r1, #1
	beq _0801293A
	b _08012A54
_0801293A:
	ldr r0, _0801294C
	ldrb r2, [r0]
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _08012950
	movs r0, #0xf
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_0801294C: .4byte 0x020228E1
_08012950:
	movs r3, #0xf
	ldrb r1, [r5, #0x13]
	adds r0, r3, #0
	ands r0, r2
	cmp r1, r0
	bne _08012960
	strb r3, [r5, #0xc]
	b _08012A54
_08012960:
	movs r0, #4
	strb r0, [r5, #0xc]
	b _08012A54
_08012966:
	adds r0, r5, #0
	movs r1, #7
	movs r2, #0x1d
	bl sub_08012D0C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08012A54
	movs r0, #0x12
	strb r0, [r5, #0xc]
	b _08012A54
_0801297C:
	bl sub_0800E9DC
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080129B2
	movs r0, #0
	bl sub_0800EA18
	cmp r0, #0
	beq _08012998
	movs r0, #0x1a
	strb r0, [r5, #0xc]
	b _08012A54
_08012998:
	ldrh r0, [r5, #0x1a]
	adds r0, #1
	strh r0, [r5, #0x1a]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _08012A54
	movs r0, #0x1d
	strb r0, [r5, #0xc]
	movs r0, #0
	strb r0, [r5, #0xd]
	b _08012A54
_080129B2:
	movs r0, #0x1d
	strb r0, [r5, #0xc]
	strb r1, [r5, #0xd]
	b _08012A54
_080129BA:
	adds r0, r5, #0
	adds r0, #0xd
	ldr r1, _080129D0
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08012A54
_080129CA:
	movs r0, #0x17
	strb r0, [r5, #0xc]
	b _08012A54
	.align 2, 0
_080129D0: .4byte 0x082C09A8
_080129D4:
	bl DestroyWirelessStatusIndicatorSprite
	bl sub_0800E894
	adds r0, r5, #0
	bl sub_08012A64
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
	b _08012A54
_080129EA:
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
	ldr r1, _080129FC
	movs r0, #5
	strh r0, [r1]
	b _08012A54
	.align 2, 0
_080129FC: .4byte 0x02037290
_08012A00:
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
	ldr r1, _08012A14
	movs r0, #8
	strh r0, [r1]
	b _08012A54
	.align 2, 0
_08012A14: .4byte 0x02037290
_08012A18:
	bl sub_08011570
	cmp r0, #0
	beq _08012A26
	movs r0, #0x1d
	strb r0, [r5, #0xc]
	b _08012A54
_08012A26:
	ldr r0, _08012A5C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08012A54
	ldr r0, _08012A60
	ldrb r0, [r0]
	bl sub_080121D4
	cmp r0, #0
	beq _08012A3E
	bl sub_08010B2C
_08012A3E:
	movs r0, #1
	bl sub_08010B58
	bl sub_080144CC
	adds r0, r5, #0
	bl sub_08012A64
	adds r0, r4, #0
	bl DestroyTask
_08012A54:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012A5C: .4byte 0x030031C4
_08012A60: .4byte 0x020228E0
	thumb_func_end sub_08012288

	thumb_func_start sub_08012A64
sub_08012A64: @ 0x08012A64
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x11]
	bl ClearWindowTilemap
	ldrb r0, [r4, #0x11]
	movs r1, #0
	bl DrawStdWindowFrame
	ldrb r0, [r4, #0x12]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r4, #0x10]
	bl ClearWindowTilemap
	ldrb r0, [r4, #0xf]
	movs r1, #0
	bl DrawStdWindowFrame
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r4, #0x11]
	bl RemoveWindow
	ldrb r0, [r4, #0xf]
	bl RemoveWindow
	ldrb r0, [r4, #0x10]
	bl RemoveWindow
	ldrb r0, [r4, #0x17]
	bl DestroyTask
	ldr r0, [r4, #8]
	bl Free
	ldr r0, [r4]
	bl Free
	ldr r0, [r4, #4]
	bl Free
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08012A64

	thumb_func_start sub_08012AC4
sub_08012AC4: @ 0x08012AC4
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	subs r0, r1, #1
	cmp r0, #0x1b
	bhi _08012B70
	lsls r0, r0, #2
	ldr r1, _08012ADC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012ADC: .4byte 0x08012AE0
_08012AE0: @ jump table
	.4byte _08012B50 @ case 0
	.4byte _08012B50 @ case 1
	.4byte _08012B68 @ case 2
	.4byte _08012B50 @ case 3
	.4byte _08012B70 @ case 4
	.4byte _08012B58 @ case 5
	.4byte _08012B58 @ case 6
	.4byte _08012B70 @ case 7
	.4byte _08012B68 @ case 8
	.4byte _08012B68 @ case 9
	.4byte _08012B68 @ case 10
	.4byte _08012B70 @ case 11
	.4byte _08012B70 @ case 12
	.4byte _08012B50 @ case 13
	.4byte _08012B68 @ case 14
	.4byte _08012B68 @ case 15
	.4byte _08012B70 @ case 16
	.4byte _08012B70 @ case 17
	.4byte _08012B70 @ case 18
	.4byte _08012B70 @ case 19
	.4byte _08012B70 @ case 20
	.4byte _08012B70 @ case 21
	.4byte _08012B68 @ case 22
	.4byte _08012B68 @ case 23
	.4byte _08012B68 @ case 24
	.4byte _08012B68 @ case 25
	.4byte _08012B68 @ case 26
	.4byte _08012B50 @ case 27
_08012B50:
	ldr r1, _08012B54
	b _08012B5A
	.align 2, 0
_08012B54: .4byte 0x082C08C4
_08012B58:
	ldr r1, _08012B64
_08012B5A:
	adds r0, r2, #0
	bl StringExpandPlaceholders
	b _08012B70
	.align 2, 0
_08012B64: .4byte 0x082C08DC
_08012B68:
	ldr r1, _08012B74
	adds r0, r2, #0
	bl StringExpandPlaceholders
_08012B70:
	pop {r0}
	bx r0
	.align 2, 0
_08012B74: .4byte 0x082C08F8
	thumb_func_end sub_08012AC4

	thumb_func_start sub_08012B78
sub_08012B78: @ 0x08012B78
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r1, #0
	cmp r1, #0x44
	beq _08012B98
	cmp r1, #0x44
	bgt _08012B8E
	cmp r1, #0x41
	beq _08012B98
	b _08012BAA
_08012B8E:
	cmp r2, #0x45
	beq _08012BA4
	cmp r2, #0x48
	beq _08012BA4
	b _08012BAA
_08012B98:
	ldr r1, _08012BA0
	bl StringExpandPlaceholders
	b _08012BAA
	.align 2, 0
_08012BA0: .4byte 0x082C0EE0
_08012BA4:
	ldr r1, _08012BB0
	bl StringExpandPlaceholders
_08012BAA:
	pop {r0}
	bx r0
	.align 2, 0
_08012BB0: .4byte 0x082C0EF4
	thumb_func_end sub_08012B78

	thumb_func_start sub_08012BB4
sub_08012BB4: @ 0x08012BB4
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	subs r0, r1, #1
	cmp r0, #0x1b
	bhi _08012C58
	lsls r0, r0, #2
	ldr r1, _08012BCC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012BCC: .4byte 0x08012BD0
_08012BD0: @ jump table
	.4byte _08012C40 @ case 0
	.4byte _08012C40 @ case 1
	.4byte _08012C50 @ case 2
	.4byte _08012C40 @ case 3
	.4byte _08012C58 @ case 4
	.4byte _08012C40 @ case 5
	.4byte _08012C40 @ case 6
	.4byte _08012C58 @ case 7
	.4byte _08012C50 @ case 8
	.4byte _08012C50 @ case 9
	.4byte _08012C50 @ case 10
	.4byte _08012C58 @ case 11
	.4byte _08012C58 @ case 12
	.4byte _08012C40 @ case 13
	.4byte _08012C50 @ case 14
	.4byte _08012C50 @ case 15
	.4byte _08012C58 @ case 16
	.4byte _08012C58 @ case 17
	.4byte _08012C58 @ case 18
	.4byte _08012C58 @ case 19
	.4byte _08012C58 @ case 20
	.4byte _08012C58 @ case 21
	.4byte _08012C50 @ case 22
	.4byte _08012C50 @ case 23
	.4byte _08012C50 @ case 24
	.4byte _08012C50 @ case 25
	.4byte _08012C50 @ case 26
	.4byte _08012C40 @ case 27
_08012C40:
	ldr r1, _08012C4C
	adds r0, r2, #0
	bl StringExpandPlaceholders
	b _08012C58
	.align 2, 0
_08012C4C: .4byte 0x082C1C80
_08012C50:
	ldr r1, _08012C5C
	adds r0, r2, #0
	bl StringExpandPlaceholders
_08012C58:
	pop {r0}
	bx r0
	.align 2, 0
_08012C5C: .4byte 0x082C1C94
	thumb_func_end sub_08012BB4

	thumb_func_start sub_08012C60
sub_08012C60: @ 0x08012C60
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	subs r0, r1, #1
	cmp r0, #0x1b
	bhi _08012D04
	lsls r0, r0, #2
	ldr r1, _08012C78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012C78: .4byte 0x08012C7C
_08012C7C: @ jump table
	.4byte _08012CEC @ case 0
	.4byte _08012CEC @ case 1
	.4byte _08012CFC @ case 2
	.4byte _08012CEC @ case 3
	.4byte _08012D04 @ case 4
	.4byte _08012CEC @ case 5
	.4byte _08012CEC @ case 6
	.4byte _08012D04 @ case 7
	.4byte _08012CFC @ case 8
	.4byte _08012CFC @ case 9
	.4byte _08012CFC @ case 10
	.4byte _08012D04 @ case 11
	.4byte _08012D04 @ case 12
	.4byte _08012CEC @ case 13
	.4byte _08012CFC @ case 14
	.4byte _08012CFC @ case 15
	.4byte _08012D04 @ case 16
	.4byte _08012D04 @ case 17
	.4byte _08012D04 @ case 18
	.4byte _08012D04 @ case 19
	.4byte _08012D04 @ case 20
	.4byte _08012D04 @ case 21
	.4byte _08012CFC @ case 22
	.4byte _08012CFC @ case 23
	.4byte _08012CFC @ case 24
	.4byte _08012CFC @ case 25
	.4byte _08012CFC @ case 26
	.4byte _08012CEC @ case 27
_08012CEC:
	ldr r1, _08012CF8
	adds r0, r2, #0
	bl StringExpandPlaceholders
	b _08012D04
	.align 2, 0
_08012CF8: .4byte 0x082C09F8
_08012CFC:
	ldr r1, _08012D08
	adds r0, r2, #0
	bl StringExpandPlaceholders
_08012D04:
	pop {r0}
	bx r0
	.align 2, 0
_08012D08: .4byte 0x082C0A10
	thumb_func_end sub_08012C60

	thumb_func_start sub_08012D0C
sub_08012D0C: @ 0x08012D0C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [r4]
	bl sub_08012DD8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08012D28
	cmp r0, #2
	beq _08012D60
	b _08012D74
_08012D28:
	movs r0, #2
	bl PlaySE
	ldrb r0, [r4, #0x12]
	bl RedrawListMenu
	ldr r0, _08012D54
	ldrb r2, [r4, #0x13]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	adds r1, #0x10
	bl StringCopy7
	ldr r0, _08012D58
	ldr r1, _08012D5C
	ldrb r1, [r1]
	bl sub_08012AC4
	strb r6, [r4, #0xc]
	b _08012D74
	.align 2, 0
_08012D54: .4byte 0x02021C54
_08012D58: .4byte 0x02021C7C
_08012D5C: .4byte 0x020228E0
_08012D60:
	movs r0, #0
	movs r1, #0
	bl sub_08011554
	ldrb r0, [r4, #0x12]
	bl RedrawListMenu
	strb r5, [r4, #0xc]
	movs r0, #1
	b _08012D76
_08012D74:
	movs r0, #0
_08012D76:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08012D0C

	thumb_func_start sub_08012D7C
sub_08012D7C: @ 0x08012D7C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _08012DA8
	ldr r3, [r0]
	movs r2, #0
	ldr r1, [r3]
	lsls r0, r4, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _08012DAC
	cmp r0, #2
	beq _08012DB6
	b _08012DB8
	.align 2, 0
_08012DA8: .4byte 0x020228E4
_08012DAC:
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _08012DB8
	movs r2, #2
	b _08012DB8
_08012DB6:
	movs r2, #1
_08012DB8:
	lsls r0, r4, #5
	ldr r3, [r3]
	adds r3, r3, r0
	str r2, [sp]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl sub_08017360
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08012D7C

	thumb_func_start sub_08012DD8
sub_08012DD8: @ 0x08012DD8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _08012E30
	ldr r5, [r0]
	movs r0, #0
	mov r8, r0
	movs r3, #1
_08012DEC:
	ldr r0, [r5]
	lsls r6, r3, #5
	adds r2, r0, r6
	ldrb r0, [r2, #0x1a]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	mov sb, r0
	cmp r0, #1
	bne _08012E4C
	ldr r1, [r5, #4]
	adds r0, r2, #0
	str r3, [sp]
	bl sub_080171A8
	adds r4, r0, #0
	ldr r3, [sp]
	cmp r4, #0xff
	beq _08012E34
	ldr r1, [r5]
	ldr r0, [r5, #4]
	lsls r2, r4, #3
	subs r2, r2, r4
	lsls r2, r2, #2
	adds r1, r1, r6
	adds r0, r0, r2
	ldm r0!, {r2, r4, r7}
	stm r1!, {r2, r4, r7}
	ldm r0!, {r2, r4, r7}
	stm r1!, {r2, r4, r7}
	ldr r0, [r5]
	adds r0, r0, r6
	mov r1, sb
	strh r1, [r0, #0x18]
	b _08012E4C
	.align 2, 0
_08012E30: .4byte 0x020228E4
_08012E34:
	ldr r2, [r5]
	adds r2, r2, r6
	ldrb r1, [r2, #0x1a]
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x1a]
	movs r7, #2
	mov r8, r7
_08012E4C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #4
	bls _08012DEC
	movs r6, #0
	movs r4, #3
_08012E5A:
	ldr r0, [r5]
	ldr r1, [r5, #4]
	adds r1, r1, r6
	movs r2, #5
	bl sub_080171F8
	adds r6, #0x1c
	subs r4, #1
	ldr r0, [r5]
	cmp r4, #0
	bge _08012E5A
	mov r1, r8
	cmp r1, #2
	beq _08012E8C
	adds r1, r0, #0
	movs r4, #4
_08012E7A:
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _08012E84
	movs r2, #1
	mov r8, r2
_08012E84:
	adds r1, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08012E7A
_08012E8C:
	mov r0, r8
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08012DD8

	thumb_func_start sub_08012E9C
sub_08012E9C: @ 0x08012E9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08012F70
	ldr r4, [r0]
	movs r3, #0
_08012EAC:
	ldr r0, [r4, #8]
	lsls r2, r3, #5
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r2
	ldm r1!, {r2, r5, r6}
	stm r0!, {r2, r5, r6}
	ldm r1!, {r2, r5, r7}
	stm r0!, {r2, r5, r7}
	ldm r1!, {r6, r7}
	stm r0!, {r6, r7}
	adds r3, #1
	ldr r0, [r4, #8]
	ldr r1, [r4]
	cmp r3, #4
	ble _08012EAC
	movs r5, #0
	mov r8, r1
	mov sb, r0
	movs r3, #4
_08012ED4:
	mov r1, sb
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _08012EF6
	lsls r0, r5, #5
	add r0, r8
	ldm r1!, {r2, r6, r7}
	stm r0!, {r2, r6, r7}
	ldm r1!, {r2, r6, r7}
	stm r0!, {r2, r6, r7}
	ldm r1!, {r2, r6}
	stm r0!, {r2, r6}
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08012EF6:
	movs r7, #0x20
	add sb, r7
	subs r3, #1
	cmp r3, #0
	bge _08012ED4
	mov sl, r5
	cmp r5, #4
	bhi _08012F58
	ldr r0, _08012F74
	mov sb, r0
	movs r1, #0
	mov ip, r1
	movs r2, #4
	rsbs r2, r2, #0
	mov r8, r2
_08012F14:
	ldr r1, [r4]
	lsls r3, r5, #5
	adds r1, r1, r3
	mov r0, sb
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
	ldr r0, [r4]
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #0x18]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1, #0x1a]
	mov r0, r8
	ands r0, r2
	strb r0, [r1, #0x1a]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1, #0x1a]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x1a]
	ldr r0, [r4]
	adds r0, r0, r3
	mov r6, ip
	strb r6, [r0, #0x1b]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08012F14
_08012F58:
	movs r3, #0
	ldr r1, [r4]
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _08012F78
	ldrb r0, [r1, #0x1b]
	cmp r0, #0x40
	bne _08012F78
	mov sl, r3
	b _08012F98
	.align 2, 0
_08012F70: .4byte 0x020228E4
_08012F74: .4byte 0x082C2364
_08012F78:
	adds r3, #1
	cmp r3, #4
	bgt _08012F98
	lsls r0, r3, #5
	adds r2, r1, r0
	ldrb r0, [r2, #0x1a]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _08012F78
	ldrb r0, [r2, #0x1b]
	cmp r0, #0x40
	bne _08012F78
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_08012F98:
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08012E9C

	thumb_func_start BerryBlenderLinkJoinGroup
BerryBlenderLinkJoinGroup: @ 0x08012FA8
	push {lr}
	ldr r0, _08012FD8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08012FDC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08012FE0
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _08012FE4
	str r1, [r0]
	movs r0, #0
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	ldr r1, _08012FE8
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08012FD8: .4byte 0x08012FED
_08012FDC: .4byte 0x020228E4
_08012FE0: .4byte 0x03005B68
_08012FE4: .4byte 0x03000DA4
_08012FE8: .4byte 0x02037290
	thumb_func_end BerryBlenderLinkJoinGroup

	thumb_func_start sub_08012FEC
sub_08012FEC: @ 0x08012FEC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0801300C
	ldr r6, [r0]
	ldrb r0, [r6, #8]
	cmp r0, #0x17
	bls _08013000
	b _08013686
_08013000:
	lsls r0, r0, #2
	ldr r1, _08013010
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801300C: .4byte 0x020228E4
_08013010: .4byte 0x08013014
_08013014: @ jump table
	.4byte _08013074 @ case 0
	.4byte _080130E4 @ case 1
	.4byte _08013110 @ case 2
	.4byte _080131DC @ case 3
	.4byte _08013686 @ case 4
	.4byte _0801328C @ case 5
	.4byte _080132C8 @ case 6
	.4byte _08013514 @ case 7
	.4byte _08013530 @ case 8
	.4byte _0801357E @ case 9
	.4byte _08013590 @ case 10
	.4byte _08013618 @ case 11
	.4byte _08013590 @ case 12
	.4byte _080135E8 @ case 13
	.4byte _08013590 @ case 14
	.4byte _08013628 @ case 15
	.4byte _08013686 @ case 16
	.4byte _08013686 @ case 17
	.4byte _08013590 @ case 18
	.4byte _08013648 @ case 19
	.4byte _08013590 @ case 20
	.4byte _0801367C @ case 21
	.4byte _08013686 @ case 22
	.4byte _0801366C @ case 23
_08013074:
	ldr r0, _080130D0
	ldrh r2, [r0]
	adds r3, r0, #0
	cmp r2, #0x14
	bne _08013094
	ldr r0, _080130D4
	ldr r0, [r0]
	ldr r1, _080130D8
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _08013094
	adds r0, r2, #1
	strh r0, [r3]
_08013094:
	ldr r2, _080130DC
	ldr r1, _080130E0
	ldrh r0, [r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	movs r1, #0
	movs r2, #0
	bl sub_08010A74
	bl sub_0800AF5C
	bl OpenLink
	bl sub_08011748
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r6, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r6]
	movs r0, #1
	strb r0, [r6, #8]
	b _08013686
	.align 2, 0
_080130D0: .4byte 0x02037280
_080130D4: .4byte 0x03005AF0
_080130D8: .4byte 0x00000CA9
_080130DC: .4byte 0x020228E0
_080130E0: .4byte 0x082C2438
_080130E4:
	adds r0, r6, #0
	adds r0, #9
	ldr r2, _08013108
	ldr r1, _0801310C
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08013100
	b _08013686
_08013100:
	movs r0, #2
	strb r0, [r6, #8]
	b _08013686
	.align 2, 0
_08013108: .4byte 0x082C1BE4
_0801310C: .4byte 0x02037280
_08013110:
	ldr r0, [r6, #4]
	movs r1, #4
	bl sub_080170B0
	ldr r0, [r6]
	movs r1, #0x10
	bl sub_08017044
	ldr r0, [r6, #4]
	ldr r1, _080131C0
	ldrh r1, [r1]
	bl sub_08016AD0
	movs r4, #0
	strb r0, [r6, #0x11]
	ldr r0, _080131C4
	bl AddWindow
	strb r0, [r6, #0xc]
	ldr r0, _080131C8
	bl AddWindow
	strb r0, [r6, #0xb]
	ldr r0, _080131CC
	bl AddWindow
	strb r0, [r6, #0xd]
	ldrb r0, [r6, #0xc]
	movs r1, #0x22
	bl FillWindowPixelBuffer
	ldrb r0, [r6, #0xc]
	ldr r2, _080131D0
	movs r1, #2
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #1
	movs r3, #8
	bl sub_08016EA4
	ldrb r0, [r6, #0xc]
	bl PutWindowTilemap
	ldrb r0, [r6, #0xc]
	movs r1, #2
	bl CopyWindowToVram
	ldrb r0, [r6, #0xb]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldr r0, _080131D4
	adds r2, r0, #0
	ldr r1, _080131D8
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldrb r1, [r6, #0xb]
	strb r1, [r0, #0x10]
	movs r1, #0
	movs r2, #0
	bl ListMenuInit
	strb r0, [r6, #0xe]
	ldrb r0, [r6, #0xd]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r6, #0xd]
	bl PutWindowTilemap
	ldrb r0, [r6, #0xd]
	bl sub_080120A8
	ldrb r0, [r6, #0xd]
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	strb r4, [r6, #0xf]
	movs r0, #3
	strb r0, [r6, #8]
	b _08013686
	.align 2, 0
_080131C0: .4byte 0x02037280
_080131C4: .4byte 0x082C1FC4
_080131C8: .4byte 0x082C207C
_080131CC: .4byte 0x082C2084
_080131D0: .4byte 0x082C19B8
_080131D4: .4byte 0x03006050
_080131D8: .4byte 0x082C210C
_080131DC:
	bl sub_0801394C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _080131F6
	cmp r4, #1
	beq _080131EE
	b _08013576
_080131EE:
	movs r0, #2
	bl PlaySE
	b _08013576
_080131F6:
	ldrb r0, [r6, #0xe]
	bl ListMenu_ProcessInput
	adds r4, r0, #0
	ldr r0, _08013244
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08013274
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08013274
	ldr r0, [r6]
	lsls r1, r4, #5
	adds r0, r0, r1
	ldrb r1, [r0, #0xa]
	ldrb r0, [r0, #0x1a]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _0801326C
	lsrs r0, r1, #7
	cmp r0, #0
	bne _0801326C
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08013690
	adds r1, r0, #0
	cmp r1, #0
	bne _08013248
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080136DC
	movs r0, #5
	b _0801325A
	.align 2, 0
_08013244: .4byte 0x03002360
_08013248:
	ldr r0, _08013264
	ldr r2, _08013268
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, #0x12
_0801325A:
	strb r0, [r6, #8]
	movs r0, #0x6e
	bl PlaySE
	b _08013686
	.align 2, 0
_08013264: .4byte 0x02021C7C
_08013268: .4byte 0x082C09A0
_0801326C:
	movs r0, #7
	bl PlaySE
	b _08013686
_08013274:
	ldr r0, _08013288
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08013282
	b _08013686
_08013282:
	movs r0, #0xa
	strb r0, [r6, #8]
	b _08013686
	.align 2, 0
_08013288: .4byte 0x03002360
_0801328C:
	ldr r4, _080132BC
	ldr r0, _080132C0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_08012BB4
	adds r0, r6, #0
	adds r0, #9
	adds r1, r4, #0
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080132AA
	b _08013686
_080132AA:
	ldr r0, _080132C4
	ldrb r2, [r6, #0xf]
	lsls r2, r2, #5
	ldr r1, [r6]
	adds r1, r1, r2
	adds r1, #0x10
	bl StringCopy7
	b _0801358A
	.align 2, 0
_080132BC: .4byte 0x02021C7C
_080132C0: .4byte 0x020228E0
_080132C4: .4byte 0x02021C40
_080132C8:
	ldr r0, _080132FC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801337E
	ldr r4, _08013300
	ldr r1, [r6]
	ldrb r0, [r6, #0xf]
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	strb r0, [r4]
	movs r0, #0
	movs r1, #0
	bl sub_08011554
	ldrb r0, [r4]
	subs r0, #1
	cmp r0, #0x1b
	bhi _0801337E
	lsls r0, r0, #2
	ldr r1, _08013304
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080132FC: .4byte 0x030031C4
_08013300: .4byte 0x020228E0
_08013304: .4byte 0x08013308
_08013308: @ jump table
	.4byte _08013378 @ case 0
	.4byte _08013378 @ case 1
	.4byte _08013378 @ case 2
	.4byte _08013378 @ case 3
	.4byte _08013378 @ case 4
	.4byte _08013378 @ case 5
	.4byte _08013378 @ case 6
	.4byte _0801337E @ case 7
	.4byte _08013378 @ case 8
	.4byte _08013378 @ case 9
	.4byte _08013378 @ case 10
	.4byte _0801337E @ case 11
	.4byte _08013378 @ case 12
	.4byte _08013378 @ case 13
	.4byte _08013378 @ case 14
	.4byte _08013378 @ case 15
	.4byte _0801337E @ case 16
	.4byte _0801337E @ case 17
	.4byte _0801337E @ case 18
	.4byte _0801337E @ case 19
	.4byte _0801337E @ case 20
	.4byte _0801337E @ case 21
	.4byte _08013378 @ case 22
	.4byte _08013378 @ case 23
	.4byte _08013378 @ case 24
	.4byte _08013378 @ case 25
	.4byte _08013378 @ case 26
	.4byte _08013378 @ case 27
_08013378:
	movs r0, #0x14
	strb r0, [r6, #8]
	b _08013686
_0801337E:
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r0, #8
	bls _0801338E
	b _080134F0
_0801338E:
	lsls r0, r0, #2
	ldr r1, _08013398
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013398: .4byte 0x0801339C
_0801339C: @ jump table
	.4byte _080133C0 @ case 0
	.4byte _080133C6 @ case 1
	.4byte _080134F0 @ case 2
	.4byte _080134F0 @ case 3
	.4byte _080133CC @ case 4
	.4byte _080133C6 @ case 5
	.4byte _08013438 @ case 6
	.4byte _080134F0 @ case 7
	.4byte _080133C6 @ case 8
_080133C0:
	movs r0, #0xc
	strb r0, [r6, #8]
	b _080134F0
_080133C6:
	movs r0, #0xe
	strb r0, [r6, #8]
	b _080134F0
_080133CC:
	ldr r5, _08013400
	ldr r4, _08013404
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08012C60
	adds r0, r6, #0
	adds r0, #9
	adds r1, r5, #0
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080133EA
	b _080134F0
_080133EA:
	ldrb r0, [r4]
	cmp r0, #0x1c
	beq _080133F4
	cmp r0, #0xe
	bne _08013408
_080133F4:
	movs r0, #0xc
	movs r1, #0
	bl sub_08011554
	b _080134F0
	.align 2, 0
_08013400: .4byte 0x02021C7C
_08013404: .4byte 0x020228E0
_08013408:
	movs r0, #7
	movs r1, #0
	bl sub_08011554
	ldr r0, _0801342C
	ldr r2, _08013430
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r1, _08013434
	adds r0, r5, #0
	bl StringExpandPlaceholders
	b _080134F0
	.align 2, 0
_0801342C: .4byte 0x02021C40
_08013430: .4byte 0x082C1E58
_08013434: .4byte 0x082C0A4C
_08013438:
	ldrb r0, [r6, #0x15]
	adds r2, r0, #0
	cmp r2, #0xf0
	bls _08013460
	adds r0, r6, #0
	adds r0, #9
	ldr r1, _0801345C
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080134F0
	movs r0, #0xc
	movs r1, #0
	bl sub_08011554
	movs r0, #0
	b _080134EE
	.align 2, 0
_0801345C: .4byte 0x02021C7C
_08013460:
	ldr r0, _08013474
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x1b
	bhi _080134EC
	lsls r0, r0, #2
	ldr r1, _08013478
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013474: .4byte 0x020228E0
_08013478: .4byte 0x0801347C
_0801347C: @ jump table
	.4byte _080134F0 @ case 0
	.4byte _080134F0 @ case 1
	.4byte _080134EC @ case 2
	.4byte _080134F0 @ case 3
	.4byte _080134EC @ case 4
	.4byte _080134EC @ case 5
	.4byte _080134EC @ case 6
	.4byte _080134EC @ case 7
	.4byte _080134EC @ case 8
	.4byte _080134EC @ case 9
	.4byte _080134EC @ case 10
	.4byte _080134EC @ case 11
	.4byte _080134EC @ case 12
	.4byte _080134F0 @ case 13
	.4byte _080134EC @ case 14
	.4byte _080134EC @ case 15
	.4byte _080134EC @ case 16
	.4byte _080134EC @ case 17
	.4byte _080134EC @ case 18
	.4byte _080134EC @ case 19
	.4byte _080134EC @ case 20
	.4byte _080134EC @ case 21
	.4byte _080134EC @ case 22
	.4byte _080134EC @ case 23
	.4byte _080134EC @ case 24
	.4byte _080134EC @ case 25
	.4byte _080134EC @ case 26
	.4byte _080134F0 @ case 27
_080134EC:
	adds r0, r2, #1
_080134EE:
	strb r0, [r6, #0x15]
_080134F0:
	bl sub_08011564
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080134FC
	b _08013686
_080134FC:
	ldr r0, _08013510
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0801350A
	b _08013686
_0801350A:
	movs r0, #7
	strb r0, [r6, #8]
	b _08013686
	.align 2, 0
_08013510: .4byte 0x03002360
_08013514:
	adds r0, r6, #0
	adds r0, #9
	ldr r1, _0801352C
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08013526
	b _08013686
_08013526:
	movs r0, #8
	strb r0, [r6, #8]
	b _08013686
	.align 2, 0
_0801352C: .4byte 0x082C0A64
_08013530:
	adds r4, r6, #0
	adds r4, #9
	bl sub_08011564
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_08016BC8
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0801356E
	cmp r1, r0
	bgt _0801355C
	subs r0, #2
	cmp r1, r0
	beq _08013572
	b _08013686
_0801355C:
	cmp r1, #0
	beq _08013566
	cmp r1, #1
	beq _0801356E
	b _08013686
_08013566:
	bl sub_080101D4
	movs r0, #9
	b _08013574
_0801356E:
	movs r0, #5
	b _08013574
_08013572:
	movs r0, #6
_08013574:
	strb r0, [r6, #8]
_08013576:
	ldrb r0, [r6, #0xe]
	bl RedrawListMenu
	b _08013686
_0801357E:
	bl sub_08011564
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801358A
	b _08013686
_0801358A:
	movs r0, #6
	strb r0, [r6, #8]
	b _08013686
_08013590:
	ldrb r0, [r6, #0xd]
	bl ClearWindowTilemap
	ldrb r0, [r6, #0xd]
	movs r1, #0
	bl DrawStdWindowFrame
	ldrb r0, [r6, #0xe]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r6, #0xc]
	bl ClearWindowTilemap
	ldrb r0, [r6, #0xb]
	movs r1, #0
	bl DrawStdWindowFrame
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r6, #0xd]
	bl RemoveWindow
	ldrb r0, [r6, #0xb]
	bl RemoveWindow
	ldrb r0, [r6, #0xc]
	bl RemoveWindow
	ldrb r0, [r6, #0x11]
	bl DestroyTask
	ldr r0, [r6]
	bl Free
	ldr r0, [r6, #4]
	bl Free
	ldrb r0, [r6, #8]
	adds r0, #1
	strb r0, [r6, #8]
	b _08013686
_080135E8:
	bl DestroyWirelessStatusIndicatorSprite
	adds r5, r6, #0
	adds r5, #9
	ldr r4, _08013610
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, #0
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013686
	ldr r0, _08013614
	movs r1, #6
	b _0801365C
	.align 2, 0
_08013610: .4byte 0x082C0A84
_08013614: .4byte 0x02037290
_08013618:
	bl DestroyWirelessStatusIndicatorSprite
	ldr r0, _08013624
	movs r1, #5
	b _0801365C
	.align 2, 0
_08013624: .4byte 0x02037290
_08013628:
	bl DestroyWirelessStatusIndicatorSprite
	adds r5, r6, #0
	adds r5, #9
	ldr r4, _08013644
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, #0
	b _0801364E
	.align 2, 0
_08013644: .4byte 0x082C0A84
_08013648:
	adds r0, r6, #0
	adds r0, #9
	ldr r1, _08013664
_0801364E:
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013686
	ldr r0, _08013668
	movs r1, #8
_0801365C:
	strh r1, [r0]
	movs r0, #0x17
	strb r0, [r6, #8]
	b _08013686
	.align 2, 0
_08013664: .4byte 0x02021C7C
_08013668: .4byte 0x02037290
_0801366C:
	adds r0, r4, #0
	bl DestroyTask
	bl sub_08016E98
	bl sub_0800E894
	b _08013686
_0801367C:
	bl sub_080144CC
	adds r0, r4, #0
	bl DestroyTask
_08013686:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08012FEC

	thumb_func_start sub_08013690
sub_08013690: @ 0x08013690
	push {lr}
	lsls r1, r1, #5
	ldr r0, [r0]
	adds r3, r0, r1
	ldr r0, _080136C0
	ldrb r0, [r0]
	cmp r0, #4
	bne _080136D2
	ldrb r1, [r3, #1]
	movs r0, #0x3c
	ands r0, r1
	cmp r0, #0xc
	beq _080136D2
	ldr r0, _080136C4
	ldr r0, [r0]
	ldrb r1, [r0, #9]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _080136C8
	movs r0, #1
	b _080136D8
	.align 2, 0
_080136C0: .4byte 0x020228E0
_080136C4: .4byte 0x03005AF0
_080136C8:
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080136D6
_080136D2:
	movs r0, #0
	b _080136D8
_080136D6:
	movs r0, #2
_080136D8:
	pop {r1}
	bx r1
	thumb_func_end sub_08013690

	thumb_func_start sub_080136DC
sub_080136DC: @ 0x080136DC
	push {r4, lr}
	adds r4, r0, #0
	strb r1, [r4, #0xf]
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	ldrb r0, [r4, #0xe]
	bl RedrawListMenu
	ldr r0, _0801373C
	ldrb r2, [r4, #0xf]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	adds r1, #0x10
	bl StringCopy7
	ldr r1, _08013740
	ldr r0, _08013744
	ldrh r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	ldrb r1, [r4, #0xf]
	lsls r1, r1, #5
	ldr r0, [r4]
	adds r0, r0, r1
	adds r4, r0, #0
	adds r4, #0x10
	adds r0, #2
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08011AB4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801373C: .4byte 0x02021C40
_08013740: .4byte 0x082C2438
_08013744: .4byte 0x02037280
	thumb_func_end sub_080136DC

	thumb_func_start sub_08013748
sub_08013748: @ 0x08013748
	push {lr}
	ldr r0, _08013774
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08013778
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r2, _0801377C
	adds r1, r1, r2
	str r1, [r3]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	ldr r2, _08013780
	str r1, [r2]
	pop {r1}
	bx r1
	.align 2, 0
_08013774: .4byte 0x08013785
_08013778: .4byte 0x020228E4
_0801377C: .4byte 0x03005B68
_08013780: .4byte 0x03000DA4
	thumb_func_end sub_08013748

	thumb_func_start sub_08013784
sub_08013784: @ 0x08013784
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080137A0
	ldr r4, [r0]
	ldrb r0, [r4, #8]
	cmp r0, #0xb
	bhi _08013888
	lsls r0, r0, #2
	ldr r1, _080137A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080137A0: .4byte 0x020228E4
_080137A4: .4byte 0x080137A8
_080137A8: @ jump table
	.4byte _080137D8 @ case 0
	.4byte _08013888 @ case 1
	.4byte _0801380C @ case 2
	.4byte _08013830 @ case 3
	.4byte _08013888 @ case 4
	.4byte _08013888 @ case 5
	.4byte _08013888 @ case 6
	.4byte _08013888 @ case 7
	.4byte _08013888 @ case 8
	.4byte _08013888 @ case 9
	.4byte _08013860 @ case 10
	.4byte _0801387E @ case 11
_080137D8:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08010A74
	bl sub_0800AF5C
	bl OpenLink
	bl sub_08011748
	movs r0, #1
	bl sub_08010CA0
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r4]
	movs r0, #2
	strb r0, [r4, #8]
	b _08013888
_0801380C:
	ldr r0, [r4, #4]
	movs r1, #4
	bl sub_080170B0
	ldr r0, [r4]
	movs r1, #0x10
	bl sub_08017044
	ldr r0, [r4, #4]
	movs r1, #0xff
	bl sub_08016AD0
	movs r1, #0
	strb r0, [r4, #0x11]
	strb r1, [r4, #0xf]
	movs r0, #3
	strb r0, [r4, #8]
	b _08013888
_08013830:
	bl sub_0801394C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08013842
	movs r0, #2
	bl PlaySE
_08013842:
	ldr r0, _0801385C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0x26
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	bne _08013888
	movs r0, #0xa
	strb r0, [r4, #8]
	b _08013888
	.align 2, 0
_0801385C: .4byte 0x03005B60
_08013860:
	ldrb r0, [r4, #0x11]
	bl DestroyTask
	ldr r0, [r4]
	bl Free
	ldr r0, [r4, #4]
	bl Free
	bl sub_0800E894
	ldrb r0, [r4, #8]
	adds r0, #1
	strb r0, [r4, #8]
	b _08013888
_0801387E:
	bl sub_0800E894
	adds r0, r5, #0
	bl DestroyTask
_08013888:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08013784

	thumb_func_start sub_08013890
sub_08013890: @ 0x08013890
	push {lr}
	adds r2, r0, #0
	cmp r1, #0xff
	bne _0801389C
_08013898:
	movs r0, #1
	b _080138C0
_0801389C:
	cmp r1, #0x16
	bhi _080138BE
	ldr r0, _080138AC
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	b _080138B8
	.align 2, 0
_080138AC: .4byte 0x082C23E0
_080138B0:
	ldrb r0, [r1]
	cmp r0, r2
	beq _08013898
	adds r1, #1
_080138B8:
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080138B0
_080138BE:
	movs r0, #0
_080138C0:
	pop {r1}
	bx r1
	thumb_func_end sub_08013890

	thumb_func_start sub_080138C4
sub_080138C4: @ 0x080138C4
	push {lr}
	ldr r0, [r0]
	lsls r1, r1, #5
	adds r1, r0, r1
	ldrb r2, [r1, #0x1a]
	lsls r0, r2, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _080138F6
	ldrb r0, [r1, #0xa]
	lsrs r0, r0, #7
	cmp r0, #0
	beq _080138E2
	movs r0, #3
	b _080138F8
_080138E2:
	lsls r0, r2, #0x1d
	cmp r0, #0
	bge _080138EC
	movs r0, #1
	b _080138F8
_080138EC:
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _080138F6
	movs r0, #2
	b _080138F8
_080138F6:
	movs r0, #0
_080138F8:
	pop {r1}
	bx r1
	thumb_func_end sub_080138C4

	thumb_func_start sub_080138FC
sub_080138FC: @ 0x080138FC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _08013948
	ldr r0, [r0]
	mov r8, r0
	bl sub_080138C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #5
	mov r2, r8
	ldr r3, [r2]
	adds r3, r3, r1
	str r0, [sp]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #9
	adds r2, r6, #0
	bl sub_0801727C
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013948: .4byte 0x020228E4
	thumb_func_end sub_080138FC

	thumb_func_start sub_0801394C
sub_0801394C: @ 0x0801394C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _080139B4
	ldr r6, [r0]
	movs r7, #0
	movs r3, #0
_0801395C:
	ldr r0, [r6]
	lsls r5, r3, #5
	adds r2, r0, r5
	ldrb r0, [r2, #0x1a]
	lsls r0, r0, #0x1e
	mov r8, r5
	cmp r0, #0
	beq _08013A28
	ldr r1, [r6, #4]
	adds r0, r2, #0
	str r3, [sp]
	bl sub_080171A8
	adds r4, r0, #0
	ldr r3, [sp]
	cmp r4, #0xff
	beq _080139F6
	ldr r0, [r6]
	adds r2, r0, r5
	ldrb r1, [r2, #0x1a]
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _080139D4
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r4, r0, #2
	ldr r1, [r6, #4]
	adds r1, r1, r4
	adds r0, r2, #0
	bl sub_0801713C
	ldr r3, [sp]
	cmp r0, #0
	beq _080139B8
	ldr r1, [r6]
	ldr r0, [r6, #4]
	adds r1, r1, r5
	adds r0, r0, r4
	ldm r0!, {r2, r4, r7}
	stm r1!, {r2, r4, r7}
	ldm r0!, {r2, r4, r7}
	stm r1!, {r2, r4, r7}
	b _080139E2
	.align 2, 0
_080139B4: .4byte 0x020228E4
_080139B8:
	ldr r0, [r6]
	adds r1, r0, r5
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _080139EC
	subs r0, #1
	strb r0, [r1, #0x1b]
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	bne _080139EC
	movs r7, #2
	b _080139EC
_080139D4:
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x1a]
_080139E2:
	ldr r0, [r6]
	adds r0, r0, r5
	movs r1, #0x40
	strb r1, [r0, #0x1b]
	movs r7, #1
_080139EC:
	ldr r0, [r6]
	add r0, r8
	movs r1, #0
	strh r1, [r0, #0x18]
	b _08013A28
_080139F6:
	ldr r0, [r6]
	adds r1, r0, r5
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #2
	beq _08013A28
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
	ldr r0, [r6]
	adds r2, r0, r5
	ldrh r1, [r2, #0x18]
	ldr r0, _08013A64
	cmp r1, r0
	bls _08013A28
	ldrb r0, [r2, #0x1a]
	movs r7, #4
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0x1a]
	movs r7, #2
_08013A28:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0801395C
	movs r5, #0
	movs r4, #3
_08013A36:
	ldr r0, [r6]
	ldr r1, [r6, #4]
	adds r1, r1, r5
	movs r2, #0x10
	bl sub_080171F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08013A4C
	movs r7, #1
_08013A4C:
	adds r5, #0x1c
	subs r4, #1
	cmp r4, #0
	bge _08013A36
	adds r0, r7, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08013A64: .4byte 0x0000012B
	thumb_func_end sub_0801394C

	thumb_func_start sub_08013A68
sub_08013A68: @ 0x08013A68
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_08076DB4
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08013A68

	thumb_func_start sub_08013A80
sub_08013A80: @ 0x08013A80
	push {lr}
	ldr r0, _08013A94
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08013A94: .4byte 0x08013A69
	thumb_func_end sub_08013A80

	thumb_func_start sub_08013A98
sub_08013A98: @ 0x08013A98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08013AD4
	mov r8, r0
	bl GetMultiplayerId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl sub_08017BDC
	adds r7, r0, #0
	ldr r1, _08013AD8
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _08013B04
	cmp r0, #1
	bgt _08013ADC
	cmp r0, #0
	beq _08013AE6
	b _08013BC4
	.align 2, 0
_08013AD4: .4byte 0x020228F4
_08013AD8: .4byte 0x03005B60
_08013ADC:
	cmp r0, #2
	beq _08013B40
	cmp r0, #3
	beq _08013B78
	b _08013BC4
_08013AE6:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _08013B00
	adds r1, r1, r0
	movs r0, #0
	movs r2, #0x64
	bl SendBlock
	b _08013BC4
	.align 2, 0
_08013B00: .4byte 0x02024190
_08013B04:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _08013BC4
	bl GetMultiplayerId
	adds r1, r0, #0
	ldr r0, _08013B38
	movs r2, #1
	eors r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	ldr r2, _08013B3C
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
	movs r0, #0x32
	bl IncrementGameStat
	bl ResetBlockReceivedFlags
	b _08013B62
	.align 2, 0
_08013B38: .4byte 0x020243E8
_08013B3C: .4byte 0x0202207C
_08013B40:
	ldr r4, _08013B6C
	ldr r0, _08013B70
	ldr r1, [r0]
	ldr r0, _08013B74
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xdc
	bl memcpy
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0xdc
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013BC4
_08013B62:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _08013BC4
	.align 2, 0
_08013B6C: .4byte 0x0202257C
_08013B70: .4byte 0x03005AEC
_08013B74: .4byte 0x00002BE0
_08013B78:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _08013BC4
	ldr r4, _08013BD0
	bl GetMultiplayerId
	adds r1, r0, #0
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	ldr r0, _08013BD4
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xd8
	bl memcpy
	bl ResetBlockReceivedFlags
	ldr r1, _08013BD8
	strb r7, [r1]
	movs r0, #6
	strb r0, [r1, #1]
	ldr r1, _08013BDC
	ldr r0, _08013BE0
	str r0, [r1, #8]
	ldr r0, _08013BE4
	bl SetMainCallback2
	mov r0, r8
	bl sub_08017B38
	adds r0, r6, #0
	bl DestroyTask
_08013BC4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013BD0: .4byte 0x02031E60
_08013BD4: .4byte 0x0202207C
_08013BD8: .4byte 0x02031F38
_08013BDC: .4byte 0x03002360
_08013BE0: .4byte 0x08085A31
_08013BE4: .4byte 0x0807A8AD
	thumb_func_end sub_08013A98

	thumb_func_start sub_08013BE8
sub_08013BE8: @ 0x08013BE8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08013C08
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08013C0C
	cmp r0, #1
	beq _08013C24
	b _08013CA6
	.align 2, 0
_08013C08: .4byte 0x03005B60
_08013C0C:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08013C1C
	movs r0, #2
	bl sub_0800A09C
_08013C1C:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08013CA6
_08013C24:
	bl GetBlockReceivedStatus
	adds r4, r0, #0
	bl sub_0800A59C
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _08013CA6
	movs r4, #0
	ldr r5, _08013C3C
	b _08013C5A
	.align 2, 0
_08013C3C: .4byte 0x020226A0
_08013C40:
	lsls r1, r4, #8
	ldr r0, _08013C90
	adds r3, r1, r0
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _08013C94
	adds r0, r0, r1
	ldrb r2, [r5]
	adds r1, r3, #0
	bl CopyTrainerCardData
	adds r5, #0x1c
	adds r4, #1
_08013C5A:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08013C40
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08013C98
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _08013C90
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x60
	ldrh r0, [r0]
	bl sub_0801B464
	b _08013C9C
	.align 2, 0
_08013C90: .4byte 0x0202207C
_08013C94: .4byte 0x020397F8
_08013C98:
	bl sub_0801B458
_08013C9C:
	bl ResetBlockReceivedFlags
	adds r0, r6, #0
	bl DestroyTask
_08013CA6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08013BE8

	thumb_func_start sub_08013CAC
sub_08013CAC: @ 0x08013CAC
	push {r4, lr}
	ldr r0, _08013CC4
	movs r1, #0x87
	lsls r1, r1, #3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _08013CC8
	cmp r0, #1
	beq _08013CDC
	b _08013CFA
	.align 2, 0
_08013CC4: .4byte 0x03002360
_08013CC8:
	ldr r0, _08013CD8
	movs r1, #5
	bl CreateTask
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08013CFA
	.align 2, 0
_08013CD8: .4byte 0x08013BE9
_08013CDC:
	ldr r0, _08013D10
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08013CFA
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08013D14
	bl ShowTrainerCardInLink
_08013CFA:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D10: .4byte 0x08013BE9
_08013D14: .4byte 0x08085A31
	thumb_func_end sub_08013CAC

	thumb_func_start sub_08013D18
sub_08013D18: @ 0x08013D18
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	bl HealPlayerParty
	bl SavePlayerParty
	bl LoadPlayerBag
	ldr r5, _08013D84
	ldr r0, _08013D88
	str r0, [r5, #0x14]
	bl GetMultiplayerId
	adds r4, r0, #0
	bl GetMultiplayerId
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x18]
	bl GetMultiplayerId
	adds r4, r0, #0
	bl GetMultiplayerId
	movs r2, #1
	eors r4, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r5
	eors r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x18]
	ldr r1, _08013D8C
	ldr r0, _08013D90
	str r0, [r1, #8]
	ldr r0, _08013D94
	str r6, [r0]
	bl GetFlavorRelationByPersonality
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013D84: .4byte 0x020226A0
_08013D88: .4byte 0x00002211
_08013D8C: .4byte 0x03002360
_08013D90: .4byte 0x080B2D69
_08013D94: .4byte 0x02022C90
	thumb_func_end sub_08013D18

	thumb_func_start sub_08013D98
sub_08013D98: @ 0x08013D98
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08013E04
	adds r1, r3, #0
	bl VarSet
	ldr r6, _08013E08
	ldr r1, [r6]
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	str r5, [sp]
	adds r3, r4, #0
	bl SetWarpDestination
	ldr r0, [r6]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0
	mov r3, r8
	bl SetDynamicWarpWithCoords
	bl WarpIntoMap
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013E04: .4byte 0x00004087
_08013E08: .4byte 0x03005AEC
	thumb_func_end sub_08013D98

	thumb_func_start sub_08013E0C
sub_08013E0C: @ 0x08013E0C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	adds r6, r3, #0
	ldr r1, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08013E7C
	strh r1, [r0]
	ldr r0, _08013E80
	bl VarSet
	bl GetLinkPlayerCount
	ldr r1, _08013E84
	strb r0, [r1]
	bl GetMultiplayerId
	ldr r1, _08013E88
	strb r0, [r1]
	bl SetCableClubWarp
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, r8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r3, r8
	bl SetWarpDestination
	bl WarpIntoMap
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013E7C: .4byte 0x02037280
_08013E80: .4byte 0x00004087
_08013E84: .4byte 0x03005B18
_08013E88: .4byte 0x03005B14
	thumb_func_end sub_08013E0C

	thumb_func_start sub_08013E8C
sub_08013E8C: @ 0x08013E8C
	push {r4, lr}
	ldr r0, _08013EA4
	movs r1, #0x87
	lsls r1, r1, #3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _08013EA8
	cmp r0, #1
	beq _08013EBC
	b _08013ECE
	.align 2, 0
_08013EA4: .4byte 0x03002360
_08013EA8:
	ldr r0, _08013EB8
	movs r1, #5
	bl CreateTask
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08013ECE
	.align 2, 0
_08013EB8: .4byte 0x08013BE9
_08013EBC:
	ldr r0, _08013EE4
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08013ECE
	ldr r0, _08013EE8
	bl SetMainCallback2
_08013ECE:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013EE4: .4byte 0x08013BE9
_08013EE8: .4byte 0x080859DD
	thumb_func_end sub_08013E8C

	thumb_func_start sub_08013EEC
sub_08013EEC: @ 0x08013EEC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl TrainerCard_GenerateCardForPlayer
	cmp r5, #0
	beq _08013F06
	bl GetWonderCardFlagID
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
	b _08013F0C
_08013F06:
	adds r0, r4, #0
	adds r0, #0x60
	strh r5, [r0]
_08013F0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08013EEC

	thumb_func_start sub_08013F14
sub_08013F14: @ 0x08013F14
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_0801B458
	ldr r0, _08013F34
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0xe
	bhi _08013F7C
	lsls r0, r0, #2
	ldr r1, _08013F38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013F34: .4byte 0x020228E0
_08013F38: .4byte 0x08013F3C
_08013F3C: @ jump table
	.4byte _08013F78 @ case 0
	.4byte _08013F78 @ case 1
	.4byte _08013F78 @ case 2
	.4byte _08013F78 @ case 3
	.4byte _08013F7C @ case 4
	.4byte _08013F7C @ case 5
	.4byte _08013F7C @ case 6
	.4byte _08013F7C @ case 7
	.4byte _08013F78 @ case 8
	.4byte _08013F78 @ case 9
	.4byte _08013F78 @ case 10
	.4byte _08013F7C @ case 11
	.4byte _08013F78 @ case 12
	.4byte _08013F7C @ case 13
	.4byte _08013F78 @ case 14
_08013F78:
	bl RecordMixTrainerNames
_08013F7C:
	ldr r0, _08013F94
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x50
	bls _08013F88
	b _0801426C
_08013F88:
	lsls r0, r0, #2
	ldr r1, _08013F98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013F94: .4byte 0x020228E0
_08013F98: .4byte 0x08013F9C
_08013F9C: @ jump table
	.4byte _080140FC @ case 0
	.4byte _08014128 @ case 1
	.4byte _08014154 @ case 2
	.4byte _08014180 @ case 3
	.4byte _080141E0 @ case 4
	.4byte _0801426C @ case 5
	.4byte _0801426C @ case 6
	.4byte _08014204 @ case 7
	.4byte _0801421C @ case 8
	.4byte _0801423C @ case 9
	.4byte _08014254 @ case 10
	.4byte _0801426C @ case 11
	.4byte _0801426C @ case 12
	.4byte _0801426C @ case 13
	.4byte _080141A0 @ case 14
	.4byte _0801426C @ case 15
	.4byte _0801426C @ case 16
	.4byte _0801426C @ case 17
	.4byte _0801426C @ case 18
	.4byte _0801426C @ case 19
	.4byte _0801426C @ case 20
	.4byte _0801426C @ case 21
	.4byte _0801426C @ case 22
	.4byte _0801426C @ case 23
	.4byte _0801426C @ case 24
	.4byte _0801426C @ case 25
	.4byte _0801426C @ case 26
	.4byte _0801426C @ case 27
	.4byte _0801426C @ case 28
	.4byte _0801426C @ case 29
	.4byte _0801426C @ case 30
	.4byte _0801426C @ case 31
	.4byte _0801426C @ case 32
	.4byte _0801426C @ case 33
	.4byte _0801426C @ case 34
	.4byte _0801426C @ case 35
	.4byte _0801426C @ case 36
	.4byte _0801426C @ case 37
	.4byte _0801426C @ case 38
	.4byte _0801426C @ case 39
	.4byte _0801426C @ case 40
	.4byte _0801426C @ case 41
	.4byte _0801426C @ case 42
	.4byte _0801426C @ case 43
	.4byte _0801426C @ case 44
	.4byte _0801426C @ case 45
	.4byte _0801426C @ case 46
	.4byte _0801426C @ case 47
	.4byte _0801426C @ case 48
	.4byte _0801426C @ case 49
	.4byte _0801426C @ case 50
	.4byte _0801426C @ case 51
	.4byte _0801426C @ case 52
	.4byte _0801426C @ case 53
	.4byte _0801426C @ case 54
	.4byte _0801426C @ case 55
	.4byte _0801426C @ case 56
	.4byte _0801426C @ case 57
	.4byte _0801426C @ case 58
	.4byte _0801426C @ case 59
	.4byte _0801426C @ case 60
	.4byte _0801426C @ case 61
	.4byte _0801426C @ case 62
	.4byte _0801426C @ case 63
	.4byte _080140E0 @ case 64
	.4byte _0801426C @ case 65
	.4byte _0801426C @ case 66
	.4byte _080141CC @ case 67
	.4byte _080141E0 @ case 68
	.4byte _0801426C @ case 69
	.4byte _0801426C @ case 70
	.4byte _08014204 @ case 71
	.4byte _0801426C @ case 72
	.4byte _0801426C @ case 73
	.4byte _0801426C @ case 74
	.4byte _0801426C @ case 75
	.4byte _0801426C @ case 76
	.4byte _0801426C @ case 77
	.4byte _0801426C @ case 78
	.4byte _0801426C @ case 79
	.4byte _080140E0 @ case 80
_080140E0:
	bl CleanupOverworldWindowsAndTilemaps
	ldr r1, _080140F4
	ldr r0, _080140F8
	str r0, [r1, #8]
	movs r0, #3
	bl InitChooseHalfPartyForBattle
	b _0801426C
	.align 2, 0
_080140F4: .4byte 0x03002360
_080140F8: .4byte 0x0801A729
_080140FC:
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _08014124
	movs r1, #1
	bl sub_08013EEC
	bl HealPlayerParty
	bl SavePlayerParty
	bl LoadPlayerBag
	movs r0, #1
	str r0, [sp]
	movs r0, #0x19
	movs r1, #0x18
	movs r2, #6
	movs r3, #8
	b _080141B8
	.align 2, 0
_08014124: .4byte 0x0202257C
_08014128:
	bl CleanupOverworldWindowsAndTilemaps
	bl HealPlayerParty
	bl SavePlayerParty
	bl LoadPlayerBag
	ldr r0, _08014150
	movs r1, #1
	bl sub_08013EEC
	movs r0, #2
	str r0, [sp]
	movs r0, #0x19
	movs r1, #0x18
	movs r2, #6
	movs r3, #8
	b _080141B8
	.align 2, 0
_08014150: .4byte 0x0202257C
_08014154:
	bl CleanupOverworldWindowsAndTilemaps
	bl HealPlayerParty
	bl SavePlayerParty
	bl LoadPlayerBag
	ldr r0, _0801417C
	movs r1, #1
	bl sub_08013EEC
	movs r0, #5
	str r0, [sp]
	movs r0, #0x19
	movs r1, #0x1b
	movs r2, #5
	movs r3, #8
	b _080141B8
	.align 2, 0
_0801417C: .4byte 0x0202257C
_08014180:
	ldr r0, _0801419C
	movs r1, #1
	bl sub_08013EEC
	bl CleanupOverworldWindowsAndTilemaps
	movs r0, #3
	str r0, [sp]
	movs r0, #0x19
	movs r1, #0x19
	movs r2, #5
	movs r3, #8
	b _080141B8
	.align 2, 0
_0801419C: .4byte 0x0202257C
_080141A0:
	ldr r0, _080141C4
	movs r1, #1
	bl sub_08013EEC
	bl CleanupOverworldWindowsAndTilemaps
	movs r0, #4
	str r0, [sp]
	movs r0, #0x19
	movs r1, #0x1a
	movs r2, #8
	movs r3, #9
_080141B8:
	bl sub_08013E0C
	ldr r0, _080141C8
	bl SetMainCallback2
	b _0801426C
	.align 2, 0
_080141C4: .4byte 0x0202257C
_080141C8: .4byte 0x08013E8D
_080141CC:
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _080141DC
	movs r1, #0
	bl CreateTask
	b _0801426C
	.align 2, 0
_080141DC: .4byte 0x08013A99
_080141E0:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080141F0
	bl sub_0800E7D0
	b _080141FE
_080141F0:
	bl sub_0800E7E8
	movs r0, #0x45
	movs r1, #0
	movs r2, #1
	bl sub_08010A74
_080141FE:
	bl sub_0801DBBC
	b _0801426C
_08014204:
	ldr r0, _08014214
	movs r1, #0
	bl sub_08013EEC
	ldr r0, _08014218
	bl SetMainCallback2
	b _0801426C
	.align 2, 0
_08014214: .4byte 0x0202257C
_08014218: .4byte 0x08013CAD
_0801421C:
	movs r0, #8
	movs r1, #5
	movs r2, #1
	bl sub_08013D98
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08014238
	bl sub_0802A69C
	b _0801426C
	.align 2, 0
_08014238: .4byte 0x08085935
_0801423C:
	movs r0, #7
	movs r1, #9
	movs r2, #1
	bl sub_08013D98
	ldr r0, _08014250
	bl sub_08020988
	b _0801426C
	.align 2, 0
_08014250: .4byte 0x08085935
_08014254:
	movs r0, #8
	movs r1, #5
	movs r2, #1
	bl sub_08013D98
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0801428C
	bl sub_08024704
_0801426C:
	adds r0, r4, #0
	bl DestroyTask
	ldr r1, _08014290
	movs r0, #1
	strh r0, [r1]
	ldr r0, _08014294
	ldrb r0, [r0]
	cmp r0, #0x44
	beq _08014284
	bl ScriptContext2_Disable
_08014284:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801428C: .4byte 0x08085935
_08014290: .4byte 0x02037290
_08014294: .4byte 0x020228E0
	thumb_func_end sub_08013F14

	thumb_func_start sub_08014298
sub_08014298: @ 0x08014298
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080142C8
	adds r7, r0, r1
	ldr r0, _080142CC
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r7, r1]
	mov r2, sb
	cmp r0, #8
	bls _080142BE
	b _080144BA
_080142BE:
	lsls r0, r0, #2
	ldr r1, _080142D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080142C8: .4byte 0x03005B68
_080142CC: .4byte 0x0202257C
_080142D0: .4byte 0x080142D4
_080142D4: @ jump table
	.4byte _080142F8 @ case 0
	.4byte _080143D4 @ case 1
	.4byte _080143EC @ case 2
	.4byte _08014426 @ case 3
	.4byte _0801443C @ case 4
	.4byte _08014452 @ case 5
	.4byte _0801448E @ case 6
	.4byte _0801449A @ case 7
	.4byte _080144A4 @ case 8
_080142F8:
	ldr r1, _08014314
	movs r0, #1
	strh r0, [r1]
	ldr r0, _08014318
	ldrb r0, [r0]
	subs r0, #0xe
	cmp r0, #0xe
	bhi _080143CA
	lsls r0, r0, #2
	ldr r1, _0801431C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08014314: .4byte 0x02037290
_08014318: .4byte 0x020228E0
_0801431C: .4byte 0x08014320
_08014320: @ jump table
	.4byte _0801435C @ case 0
	.4byte _080143CA @ case 1
	.4byte _080143C0 @ case 2
	.4byte _080143CA @ case 3
	.4byte _080143CA @ case 4
	.4byte _080143CA @ case 5
	.4byte _080143CA @ case 6
	.4byte _080143CA @ case 7
	.4byte _080143CA @ case 8
	.4byte _080143C0 @ case 9
	.4byte _080143C0 @ case 10
	.4byte _080143C0 @ case 11
	.4byte _080143C0 @ case 12
	.4byte _080143C0 @ case 13
	.4byte _0801435C @ case 14
_0801435C:
	ldr r1, _080143AC
	ldr r0, _080143B0
	str r0, [r1, #0x14]
	movs r2, #0
	mov r8, r2
	mov r0, r8
	strh r0, [r1, #0x18]
	movs r0, #2
	strh r0, [r1, #0x34]
	ldr r6, _080143B4
	ldrb r0, [r6]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _080143B8
	adds r0, r0, r4
	movs r1, #0xb
	bl GetMonData
	mov r1, sb
	strh r0, [r1]
	ldrb r0, [r6, #1]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	mov r2, sb
	strh r0, [r2, #2]
	ldr r0, _080143BC
	mov r1, r8
	str r1, [r0, #8]
	movs r0, #4
	strh r0, [r7]
	bl RecordMixTrainerNames
	bl ResetBlockReceivedFlags
	b _080144BA
	.align 2, 0
_080143AC: .4byte 0x020226A0
_080143B0: .4byte 0x00002211
_080143B4: .4byte 0x0203CBC4
_080143B8: .4byte 0x0202412C
_080143BC: .4byte 0x03002360
_080143C0:
	bl RecordMixTrainerNames
	adds r0, r4, #0
	bl DestroyTask
_080143CA:
	bl EnableBothScriptContexts
	movs r0, #1
	strh r0, [r7]
	b _080144BA
_080143D4:
	bl ScriptContext1_IsScriptSetUp
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080144BA
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	movs r0, #2
	strh r0, [r7]
	b _080144BA
_080143EC:
	ldr r0, _08014410
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080144BA
	ldr r0, _08014414
	ldrb r0, [r0]
	cmp r0, #0x1d
	bne _0801441C
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _08014418
	bl SetMainCallback2
	b _080144BA
	.align 2, 0
_08014410: .4byte 0x02037C74
_08014414: .4byte 0x020228E0
_08014418: .4byte 0x08076DB5
_0801441C:
	bl sub_0800A8D4
	movs r0, #3
	strh r0, [r7]
	b _080144BA
_08014426:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080144BA
	adds r0, r4, #0
	bl DestroyTask
	bl sub_080144E0
	b _080144BA
_0801443C:
	movs r0, #0
	adds r1, r2, #0
	movs r2, #0xe
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080144BA
	movs r0, #5
	strh r0, [r7]
	b _080144BA
_08014452:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080144BA
	bl ResetBlockReceivedFlags
	ldr r0, _08014480
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	bl sub_080B23D0
	cmp r0, #0
	beq _08014488
	ldr r0, _08014484
	movs r1, #0xb
	strh r1, [r0]
	movs r0, #7
	strh r0, [r7]
	b _080144BA
	.align 2, 0
_08014480: .4byte 0x0202207C
_08014484: .4byte 0x02037290
_08014488:
	movs r0, #6
	strh r0, [r7]
	b _080144BA
_0801448E:
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
	b _080144BA
_0801449A:
	bl sub_0800A7F8
	movs r0, #8
	strh r0, [r7]
	b _080144BA
_080144A4:
	ldr r0, _080144C8
	ldrb r0, [r0]
	cmp r0, #0
	bne _080144BA
	bl DestroyWirelessStatusIndicatorSprite
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
_080144BA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080144C8: .4byte 0x030031C4
	thumb_func_end sub_08014298

	thumb_func_start sub_080144CC
sub_080144CC: @ 0x080144CC
	push {lr}
	ldr r0, _080144DC
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080144DC: .4byte 0x08014299
	thumb_func_end sub_080144CC

	thumb_func_start sub_080144E0
sub_080144E0: @ 0x080144E0
	push {lr}
	ldr r0, _08014500
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08014504
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08014500: .4byte 0x08013F15
_08014504: .4byte 0x03005B60
	thumb_func_end sub_080144E0

	thumb_func_start MEvent_CreateTask_Leader
MEvent_CreateTask_Leader: @ 0x08014508
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08014538
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0801453C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08014540
	adds r1, r1, r0
	str r1, [r2]
	movs r2, #0
	strb r2, [r1, #0xc]
	strb r2, [r1, #0xd]
	strb r4, [r1, #0x18]
	ldr r0, _08014544
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014538: .4byte 0x08014549
_0801453C: .4byte 0x020228E4
_08014540: .4byte 0x03005B68
_08014544: .4byte 0x02037290
	thumb_func_end MEvent_CreateTask_Leader

	thumb_func_start sub_08014548
sub_08014548: @ 0x08014548
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08014568
	ldr r5, [r0]
	ldrb r0, [r5, #0xc]
	cmp r0, #0x11
	bls _0801455C
	b _080149FA
_0801455C:
	lsls r0, r0, #2
	ldr r1, _0801456C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08014568: .4byte 0x020228E4
_0801456C: .4byte 0x08014570
_08014570: @ jump table
	.4byte _080145B8 @ case 0
	.4byte _080145F4 @ case 1
	.4byte _080146C4 @ case 2
	.4byte _080146F4 @ case 3
	.4byte _08014704 @ case 4
	.4byte _08014754 @ case 5
	.4byte _0801472C @ case 6
	.4byte _0801475A @ case 7
	.4byte _080147FA @ case 8
	.4byte _080148C4 @ case 9
	.4byte _080148D4 @ case 10
	.4byte _080148EA @ case 11
	.4byte _08014902 @ case 12
	.4byte _0801491E @ case 13
	.4byte _08014956 @ case 14
	.4byte _0801497C @ case 15
	.4byte _080149B0 @ case 16
	.4byte _080149EA @ case 17
_080145B8:
	ldr r1, _080145EC
	ldrb r0, [r5, #0x18]
	strb r0, [r1]
	ldr r1, _080145F0
	movs r0, #2
	strb r0, [r1]
	ldrb r0, [r5, #0x18]
	movs r1, #0
	movs r2, #0
	bl sub_08010A74
	movs r0, #0
	movs r1, #0
	bl sub_08010A90
	bl sub_0800AF5C
	bl OpenLink
	movs r0, #2
	bl sub_080116FC
	movs r0, #1
	strb r0, [r5, #0xc]
	b _080149FA
	.align 2, 0
_080145EC: .4byte 0x020228E0
_080145F0: .4byte 0x020228E1
_080145F4:
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r5, #4]
	movs r0, #0xa0
	bl AllocZeroed
	str r0, [r5]
	movs r0, #0xa0
	bl AllocZeroed
	str r0, [r5, #8]
	ldr r0, [r5, #4]
	movs r1, #4
	bl sub_080170B0
	ldr r0, [r5]
	movs r1, #5
	bl sub_08017044
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x10
	bl sub_0800DA5C
	ldr r1, [r5]
	movs r3, #0
	movs r0, #0
	strh r0, [r1, #0x18]
	ldr r2, [r5]
	ldrb r1, [r2, #0x1a]
	subs r0, #4
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x1a]
	ldr r2, [r5]
	ldrb r1, [r2, #0x1a]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x1a]
	ldr r0, [r5]
	strb r3, [r0, #0x1b]
	ldr r0, [r5, #4]
	movs r1, #0xff
	bl sub_08016AD0
	strb r0, [r5, #0x17]
	ldr r0, _080146B0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	bl GetMysteryGiftBaseBlock
	lsls r0, r0, #0x10
	ldr r2, _080146B4
	ldr r1, [sp, #4]
	ands r1, r2
	orrs r1, r0
	ldr r0, _080146B8
	ands r1, r0
	movs r0, #0xc0
	lsls r0, r0, #4
	orrs r1, r0
	str r1, [sp, #4]
	mov r0, sp
	bl AddWindow
	strb r0, [r5, #0xf]
	ldrb r0, [r5, #0xf]
	bl MG_DrawTextBorder
	ldr r0, _080146BC
	adds r2, r0, #0
	ldr r1, _080146C0
	ldm r1!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	ldm r1!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	ldrb r1, [r5, #0xf]
	strb r1, [r0, #0x10]
	movs r1, #0
	movs r2, #0
	bl ListMenuInit
	strb r0, [r5, #0x12]
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	strb r0, [r5, #0x13]
	b _0801474A
	.align 2, 0
_080146B0: .4byte 0x082C2024
_080146B4: .4byte 0x0000FFFF
_080146B8: .4byte 0xFFFF00FF
_080146BC: .4byte 0x03006050
_080146C0: .4byte 0x082C2064
_080146C4:
	ldr r0, _080146E4
	ldr r2, _080146E8
	ldr r4, _080146EC
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _080146F0
	ldrb r1, [r4]
	bl sub_08012134
	movs r0, #3
	strb r0, [r5, #0xc]
	b _080149FA
	.align 2, 0
_080146E4: .4byte 0x02021C40
_080146E8: .4byte 0x082C1E58
_080146EC: .4byte 0x020228E0
_080146F0: .4byte 0x02021C7C
_080146F4:
	ldr r0, _08014700
	bl AddTextPrinterToWindow1
	movs r0, #4
	strb r0, [r5, #0xc]
	b _080149FA
	.align 2, 0
_08014700: .4byte 0x02021C7C
_08014704:
	adds r0, r5, #0
	movs r1, #5
	movs r2, #6
	bl sub_08012D0C
	ldr r0, _08014728
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0801471C
	b _080149FA
_0801471C:
	movs r0, #0xd
	strb r0, [r5, #0xc]
	bl DestroyWirelessStatusIndicatorSprite
	b _080149FA
	.align 2, 0
_08014728: .4byte 0x03002360
_0801472C:
	adds r0, r5, #0
	adds r0, #0xd
	ldr r1, _08014750
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, #0
	bne _0801473C
	b _080149FA
_0801473C:
	ldr r0, [r5]
	bl sub_08012E9C
	strb r0, [r5, #0x13]
	ldrb r0, [r5, #0x12]
	bl RedrawListMenu
_0801474A:
	movs r0, #2
	strb r0, [r5, #0xc]
	b _080149FA
	.align 2, 0
_08014750: .4byte 0x082C0AE4
_08014754:
	movs r0, #7
	strb r0, [r5, #0xc]
	b _080149FA
_0801475A:
	adds r0, r5, #0
	adds r0, #0xd
	adds r1, r5, #0
	adds r1, #0x14
	ldr r3, _08014780
	movs r2, #0
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0801478A
	cmp r4, #0
	bgt _08014784
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _080147CC
	b _080149FA
	.align 2, 0
_08014780: .4byte 0x02021C7C
_08014784:
	cmp r4, #1
	beq _080147CC
	b _080149FA
_0801478A:
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	ldr r1, [r5]
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #5
	adds r1, r1, r0
	strb r4, [r1, #0x1b]
	ldrb r0, [r5, #0x12]
	bl RedrawListMenu
	movs r0, #5
	strb r0, [r5, #0x19]
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	adds r0, #2
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #5
	ldr r2, [r5]
	adds r2, r2, r0
	adds r2, #0x10
	movs r0, #5
	b _080147F0
_080147CC:
	movs r0, #6
	strb r0, [r5, #0x19]
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	adds r0, #2
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #5
	ldr r2, [r5]
	adds r2, r2, r0
	adds r2, #0x10
	movs r0, #6
_080147F0:
	bl sub_08010188
	movs r0, #8
	strb r0, [r5, #0xc]
	b _080149FA
_080147FA:
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	adds r0, #2
	bl ReadAsU16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r5, #0x13]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	adds r1, #0x10
	bl sub_08010214
	adds r4, r0, #0
	cmp r4, #1
	bne _080148B2
	ldrb r0, [r5, #0x19]
	cmp r0, #5
	bne _0801486C
	ldr r1, [r5]
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1, #0x1b]
	ldrb r0, [r5, #0x12]
	bl RedrawListMenu
	ldrb r0, [r5, #0x13]
	adds r0, #1
	strb r0, [r5, #0x13]
	ldr r0, _08014860
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r2, [r5]
	adds r1, r1, r2
	subs r1, #0x10
	bl StringCopy7
	ldr r0, _08014864
	ldr r1, _08014868
	bl StringExpandPlaceholders
	movs r0, #9
	strb r0, [r5, #0xc]
	bl sub_0800E9F8
	b _080148AC
	.align 2, 0
_08014860: .4byte 0x02021C40
_08014864: .4byte 0x02021C7C
_08014868: .4byte 0x082C0948
_0801486C:
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	adds r4, r0, #0
	adds r4, #0x10
	adds r0, #2
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_080118AC
	ldr r1, [r5]
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrb r2, [r1, #0x1a]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x1a]
	ldr r0, [r5]
	bl sub_08012E9C
	ldrb r0, [r5, #0x12]
	bl RedrawListMenu
	movs r0, #2
	strb r0, [r5, #0xc]
_080148AC:
	movs r0, #0
	strb r0, [r5, #0x19]
	b _080149FA
_080148B2:
	cmp r4, #2
	beq _080148B8
	b _080149FA
_080148B8:
	movs r0, #0
	movs r1, #0
	bl sub_08011554
	strb r4, [r5, #0xc]
	b _080149FA
_080148C4:
	ldr r0, _080148D0
	bl AddTextPrinterToWindow1
	movs r0, #0xa
	strb r0, [r5, #0xc]
	b _080149FA
	.align 2, 0
_080148D0: .4byte 0x02021C7C
_080148D4:
	ldrb r0, [r5, #0xe]
	adds r0, #1
	strb r0, [r5, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bhi _080148E4
	b _080149FA
_080148E4:
	movs r0, #0xb
	strb r0, [r5, #0xc]
	b _080149FA
_080148EA:
	adds r0, r5, #0
	movs r1, #5
	movs r2, #6
	bl sub_08012D0C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080148FC
	b _080149FA
_080148FC:
	movs r0, #0xc
	strb r0, [r5, #0xc]
	b _080149FA
_08014902:
	bl sub_0800E9DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08014918
	movs r0, #0
	bl sub_0800EA18
	movs r0, #0xf
	strb r0, [r5, #0xc]
	b _080149FA
_08014918:
	movs r0, #6
	strb r0, [r5, #0xc]
	b _080149FA
_0801491E:
	bl DestroyWirelessStatusIndicatorSprite
	bl sub_0800E894
	ldrb r0, [r5, #0x12]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, #0xf]
	bl RemoveWindow
	ldrb r0, [r5, #0x17]
	bl DestroyTask
	ldr r0, [r5, #8]
	bl Free
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, #4]
	bl Free
	b _080149E2
_08014956:
	adds r0, r5, #0
	adds r0, #0xd
	ldr r1, _08014974
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, #0
	beq _080149FA
	adds r0, r4, #0
	bl DestroyTask
	ldr r1, _08014978
	movs r0, #5
	strh r0, [r1]
	b _080149FA
	.align 2, 0
_08014974: .4byte 0x082C064C
_08014978: .4byte 0x02037290
_0801497C:
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08014994
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0801499A
_08014994:
	movs r0, #0xd
	strb r0, [r5, #0xc]
	b _080149FA
_0801499A:
	ldr r0, _080149AC
	ldrb r0, [r0]
	cmp r0, #0
	beq _080149FA
	movs r0, #1
	bl sub_08010B58
	b _080149E2
	.align 2, 0
_080149AC: .4byte 0x030031C4
_080149B0:
	ldrb r0, [r5, #0x12]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, #0xf]
	bl RemoveWindow
	ldrb r0, [r5, #0x17]
	bl DestroyTask
	ldr r0, [r5, #8]
	bl Free
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, #4]
	bl Free
	bl sub_0800A8D4
_080149E2:
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
	b _080149FA
_080149EA:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080149FA
	adds r0, r4, #0
	bl DestroyTask
_080149FA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08014548

	thumb_func_start MEvent_CreateTask_CardOrNewsWithFriend
MEvent_CreateTask_CardOrNewsWithFriend: @ 0x08014A04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08014A3C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08014A40
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08014A44
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _08014A48
	str r1, [r0]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	subs r4, #6
	strb r4, [r1, #0x12]
	ldr r0, _08014A4C
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014A3C: .4byte 0x08014A51
_08014A40: .4byte 0x020228E4
_08014A44: .4byte 0x03005B68
_08014A48: .4byte 0x03000DA4
_08014A4C: .4byte 0x02037290
	thumb_func_end MEvent_CreateTask_CardOrNewsWithFriend

	thumb_func_start sub_08014A50
sub_08014A50: @ 0x08014A50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08014A70
	ldr r7, [r0]
	ldrb r0, [r7, #8]
	cmp r0, #0xc
	bls _08014A64
	b _08014DA8
_08014A64:
	lsls r0, r0, #2
	ldr r1, _08014A74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08014A70: .4byte 0x020228E4
_08014A74: .4byte 0x08014A78
_08014A78: @ jump table
	.4byte _08014AAC @ case 0
	.4byte _08014AE0 @ case 1
	.4byte _08014AF0 @ case 2
	.4byte _08014BC0 @ case 3
	.4byte _08014C88 @ case 4
	.4byte _08014CAC @ case 5
	.4byte _08014D0C @ case 6
	.4byte _08014D68 @ case 7
	.4byte _08014D0C @ case 8
	.4byte _08014D42 @ case 9
	.4byte _08014D0C @ case 10
	.4byte _08014D8C @ case 11
	.4byte _08014D98 @ case 12
_08014AAC:
	ldrb r0, [r7, #0x12]
	adds r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #0
	bl sub_08010A74
	bl sub_0800AF5C
	bl OpenLink
	bl sub_08011748
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r7, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r7]
	movs r0, #1
	strb r0, [r7, #8]
	b _08014DA8
_08014AE0:
	ldr r0, _08014AEC
	bl AddTextPrinterToWindow1
	movs r0, #2
	strb r0, [r7, #8]
	b _08014DA8
	.align 2, 0
_08014AEC: .4byte 0x082C19CC
_08014AF0:
	ldr r0, [r7, #4]
	movs r1, #4
	bl sub_080170B0
	ldr r0, [r7]
	movs r1, #0x10
	bl sub_08017044
	ldr r0, [r7, #4]
	ldrb r1, [r7, #0x12]
	adds r1, #7
	bl sub_08016AD0
	movs r6, #0
	strb r0, [r7, #0x11]
	ldr r0, _08014BA8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	bl GetMysteryGiftBaseBlock
	lsls r0, r0, #0x10
	ldr r2, _08014BAC
	ldr r1, [sp, #4]
	ands r1, r2
	orrs r1, r0
	ldr r5, _08014BB0
	ands r1, r5
	movs r4, #0xc0
	lsls r4, r4, #4
	orrs r1, r4
	str r1, [sp, #4]
	mov r0, sp
	bl AddWindow
	strb r0, [r7, #0xb]
	ldr r0, _08014BB4
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, sp, #8
	ldr r1, [r0, #4]
	ands r1, r5
	orrs r1, r4
	str r1, [r0, #4]
	bl AddWindow
	strb r0, [r7, #0xd]
	ldrb r0, [r7, #0xb]
	bl MG_DrawTextBorder
	ldr r0, _08014BB8
	adds r2, r0, #0
	ldr r1, _08014BBC
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldrb r1, [r7, #0xb]
	strb r1, [r0, #0x10]
	movs r1, #0
	movs r2, #0
	bl ListMenuInit
	strb r0, [r7, #0xe]
	ldrb r0, [r7, #0xd]
	bl MG_DrawTextBorder
	ldrb r0, [r7, #0xd]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r7, #0xd]
	bl PutWindowTilemap
	ldrb r0, [r7, #0xd]
	bl sub_080120A8
	ldrb r0, [r7, #0xd]
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	strb r6, [r7, #0xf]
	movs r0, #3
	strb r0, [r7, #8]
	b _08014DA8
	.align 2, 0
_08014BA8: .4byte 0x082C207C
_08014BAC: .4byte 0x0000FFFF
_08014BB0: .4byte 0xFFFF00FF
_08014BB4: .4byte 0x082C2084
_08014BB8: .4byte 0x03006050
_08014BBC: .4byte 0x082C210C
_08014BC0:
	bl sub_0801394C
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08014BDE
	cmp r2, #1
	bne _08014BD6
	movs r0, #2
	bl PlaySE
_08014BD6:
	ldrb r0, [r7, #0xe]
	bl RedrawListMenu
	b _08014DA8
_08014BDE:
	ldrb r0, [r7, #0xe]
	bl ListMenu_ProcessInput
	adds r2, r0, #0
	ldr r0, _08014C60
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08014C70
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _08014C70
	ldr r0, [r7]
	lsls r1, r2, #5
	adds r0, r0, r1
	ldrb r1, [r0, #0xa]
	ldrb r0, [r0, #0x1a]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _08014C68
	lsrs r0, r1, #7
	cmp r0, #0
	bne _08014C68
	strb r2, [r7, #0xf]
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	ldrb r0, [r7, #0xe]
	bl RedrawListMenu
	ldr r0, _08014C64
	ldrb r2, [r7, #0xf]
	lsls r2, r2, #5
	ldr r1, [r7]
	adds r1, r1, r2
	adds r1, #0x10
	bl StringCopy
	ldrb r1, [r7, #0xf]
	lsls r1, r1, #5
	ldr r0, [r7]
	adds r0, r0, r1
	adds r4, r0, #0
	adds r4, #0x10
	adds r0, #2
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08011AB4
	movs r0, #0x6e
	bl PlaySE
	movs r0, #4
	strb r0, [r7, #8]
	b _08014DA8
	.align 2, 0
_08014C60: .4byte 0x03002360
_08014C64: .4byte 0x02021C40
_08014C68:
	movs r0, #7
	bl PlaySE
	b _08014DA8
_08014C70:
	ldr r0, _08014C84
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08014C7E
	b _08014DA8
_08014C7E:
	movs r0, #6
	strb r0, [r7, #8]
	b _08014DA8
	.align 2, 0
_08014C84: .4byte 0x03002360
_08014C88:
	ldr r0, _08014CA4
	bl AddTextPrinterToWindow1
	ldr r0, _08014CA8
	ldrb r2, [r7, #0xf]
	lsls r2, r2, #5
	ldr r1, [r7]
	adds r1, r1, r2
	adds r1, #0x10
	bl StringCopy
	movs r0, #5
	strb r0, [r7, #8]
	b _08014DA8
	.align 2, 0
_08014CA4: .4byte 0x082C1C80
_08014CA8: .4byte 0x02021C40
_08014CAC:
	ldr r0, _08014CE4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08014CCA
	ldr r2, _08014CE8
	ldr r1, [r7]
	ldrb r0, [r7, #0xf]
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	strb r0, [r2]
	movs r0, #0xa
	strb r0, [r7, #8]
_08014CCA:
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	beq _08014CF6
	cmp r0, #5
	bgt _08014CEC
	cmp r0, #2
	bgt _08014DA8
	cmp r0, #1
	blt _08014DA8
	b _08014CF0
	.align 2, 0
_08014CE4: .4byte 0x030031C4
_08014CE8: .4byte 0x020228E0
_08014CEC:
	cmp r0, #6
	bne _08014DA8
_08014CF0:
	movs r0, #8
	strb r0, [r7, #8]
	b _08014DA8
_08014CF6:
	ldr r0, _08014D08
	bl AddTextPrinterToWindow1
	movs r0, #0
	movs r1, #0
	bl sub_08011554
	b _08014DA8
	.align 2, 0
_08014D08: .4byte 0x082C09F8
_08014D0C:
	ldrb r0, [r7, #0xe]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r7, #0xd]
	bl RemoveWindow
	ldrb r0, [r7, #0xb]
	bl RemoveWindow
	ldrb r0, [r7, #0x11]
	bl DestroyTask
	ldr r0, [r7]
	bl Free
	ldr r0, [r7, #4]
	bl Free
	ldrb r0, [r7, #8]
	adds r0, #1
	strb r0, [r7, #8]
	b _08014DA8
_08014D42:
	adds r5, r7, #0
	adds r5, #9
	ldr r4, _08014D64
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, #0
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, #0
	beq _08014DA8
	bl DestroyWirelessStatusIndicatorSprite
	b _08014D72
	.align 2, 0
_08014D64: .4byte 0x082C0B1C
_08014D68:
	bl DestroyWirelessStatusIndicatorSprite
	ldr r0, _08014D84
	bl AddTextPrinterToWindow1
_08014D72:
	adds r0, r6, #0
	bl DestroyTask
	bl sub_0800E894
	ldr r1, _08014D88
	movs r0, #5
	strh r0, [r1]
	b _08014DA8
	.align 2, 0
_08014D84: .4byte 0x082C064C
_08014D88: .4byte 0x02037290
_08014D8C:
	ldrb r0, [r7, #8]
	adds r0, #1
	strb r0, [r7, #8]
	bl sub_0800A8D4
	b _08014DA8
_08014D98:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08014DA8
	adds r0, r6, #0
	bl DestroyTask
_08014DA8:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08014A50

	thumb_func_start MEvent_CreateTask_CardOrNewsOverWireless
MEvent_CreateTask_CardOrNewsOverWireless: @ 0x08014DB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08014DE8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08014DEC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08014DF0
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _08014DF4
	str r1, [r0]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	subs r4, #6
	strb r4, [r1, #0x12]
	ldr r0, _08014DF8
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014DE8: .4byte 0x08014DFD
_08014DEC: .4byte 0x020228E4
_08014DF0: .4byte 0x03005B68
_08014DF4: .4byte 0x03000DA4
_08014DF8: .4byte 0x02037290
	thumb_func_end MEvent_CreateTask_CardOrNewsOverWireless

	thumb_func_start sub_08014DFC
sub_08014DFC: @ 0x08014DFC
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08014E1C
	ldr r5, [r0]
	ldrb r0, [r5, #8]
	cmp r0, #0xe
	bls _08014E10
	b _0801510C
_08014E10:
	lsls r0, r0, #2
	ldr r1, _08014E20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08014E1C: .4byte 0x020228E4
_08014E20: .4byte 0x08014E24
_08014E24: @ jump table
	.4byte _08014E60 @ case 0
	.4byte _08014E8E @ case 1
	.4byte _08014EA0 @ case 2
	.4byte _08014F28 @ case 3
	.4byte _08014FE8 @ case 4
	.4byte _0801500C @ case 5
	.4byte _0801506C @ case 6
	.4byte _080150B0 @ case 7
	.4byte _0801506C @ case 8
	.4byte _080150A2 @ case 9
	.4byte _0801506C @ case 10
	.4byte _080150BC @ case 11
	.4byte _0801506C @ case 12
	.4byte _080150F0 @ case 13
	.4byte _080150FC @ case 14
_08014E60:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08010A74
	bl sub_0800AF5C
	bl OpenLink
	bl sub_08011748
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r5]
	movs r0, #1
	strb r0, [r5, #8]
	b _0801510C
_08014E8E:
	ldr r0, _08014E9C
	bl AddTextPrinterToWindow1
	movs r0, #2
	strb r0, [r5, #8]
	b _0801510C
	.align 2, 0
_08014E9C: .4byte 0x082C1C3C
_08014EA0:
	ldr r0, [r5, #4]
	movs r1, #4
	bl sub_080170B0
	ldr r0, [r5]
	movs r1, #0x10
	bl sub_08017044
	ldr r0, [r5, #4]
	ldrb r1, [r5, #0x12]
	adds r1, #7
	bl sub_08016B00
	strb r0, [r5, #0x11]
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _08014F0C
	ldr r0, _08014F18
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	bl GetMysteryGiftBaseBlock
	lsls r0, r0, #0x10
	ldr r2, _08014F1C
	ldr r1, [sp, #4]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, #4]
	mov r0, sp
	bl AddWindow
	strb r0, [r5, #0xb]
	ldrb r0, [r5, #0xb]
	bl MG_DrawTextBorder
	ldr r0, _08014F20
	adds r2, r0, #0
	ldr r1, _08014F24
	ldm r1!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	ldm r1!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	ldrb r1, [r5, #0xb]
	strb r1, [r0, #0x10]
	movs r1, #0
	movs r2, #0
	bl ListMenuInit
	strb r0, [r5, #0xe]
	movs r0, #0
	bl CopyBgTilemapBufferToVram
_08014F0C:
	movs r0, #0
	strb r0, [r5, #0xf]
	movs r0, #3
	strb r0, [r5, #8]
	b _0801510C
	.align 2, 0
_08014F18: .4byte 0x082C207C
_08014F1C: .4byte 0x0000FFFF
_08014F20: .4byte 0x03006050
_08014F24: .4byte 0x082C210C
_08014F28:
	bl sub_0801394C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08014F4E
	cmp r0, #1
	bne _08014F3E
	movs r0, #2
	bl PlaySE
_08014F3E:
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	bne _08014F46
	b _0801510C
_08014F46:
	ldrb r0, [r5, #0xe]
	bl RedrawListMenu
	b _0801510C
_08014F4E:
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _08014F5A
	ldrb r0, [r5, #0xe]
	bl ListMenu_ProcessInput
_08014F5A:
	ldrb r0, [r5, #0x14]
	cmp r0, #0x78
	bls _08014FC8
	ldr r2, [r5]
	ldrb r1, [r2, #0x1a]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _08014FDC
	ldrb r1, [r2, #0xa]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08014FDC
	ldrb r1, [r5, #0x12]
	adds r1, #7
	adds r0, r2, #0
	bl sub_08016A2C
	cmp r0, #0
	beq _08014FBC
	strb r4, [r5, #0xf]
	strb r4, [r5, #0x14]
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	ldr r0, [r5]
	adds r4, r0, #0
	adds r4, #0x10
	adds r0, #2
	bl ReadAsU16
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08011AB4
	movs r0, #0x6e
	bl PlaySE
	movs r0, #4
	strb r0, [r5, #8]
	b _08014FDC
_08014FBC:
	movs r0, #0x16
	bl PlaySE
	movs r0, #0xa
	strb r0, [r5, #8]
	b _08014FDC
_08014FC8:
	ldr r0, _08014FE4
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08014FDC
	movs r1, #0
	movs r0, #6
	strb r0, [r5, #8]
	strb r1, [r5, #0x14]
_08014FDC:
	ldrb r0, [r5, #0x14]
	adds r0, #1
	strb r0, [r5, #0x14]
	b _0801510C
	.align 2, 0
_08014FE4: .4byte 0x03002360
_08014FE8:
	ldr r0, _08015004
	bl AddTextPrinterToWindow1
	ldr r0, _08015008
	ldrb r2, [r5, #0xf]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	adds r1, #0x10
	bl StringCopy
	movs r0, #5
	strb r0, [r5, #8]
	b _0801510C
	.align 2, 0
_08015004: .4byte 0x082C1CB8
_08015008: .4byte 0x02021C40
_0801500C:
	ldr r0, _08015044
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801502A
	ldr r2, _08015048
	ldr r1, [r5]
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	strb r0, [r2]
	movs r0, #0xc
	strb r0, [r5, #8]
_0801502A:
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	beq _08015056
	cmp r0, #5
	bgt _0801504C
	cmp r0, #2
	bgt _0801510C
	cmp r0, #1
	blt _0801510C
	b _08015050
	.align 2, 0
_08015044: .4byte 0x030031C4
_08015048: .4byte 0x020228E0
_0801504C:
	cmp r0, #6
	bne _0801510C
_08015050:
	movs r0, #8
	strb r0, [r5, #8]
	b _0801510C
_08015056:
	ldr r0, _08015068
	bl AddTextPrinterToWindow1
	movs r0, #0
	movs r1, #0
	bl sub_08011554
	b _0801510C
	.align 2, 0
_08015068: .4byte 0x082C0AAC
_0801506C:
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _08015088
	ldrb r0, [r5, #0xe]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, #0xb]
	bl RemoveWindow
_08015088:
	ldrb r0, [r5, #0x11]
	bl DestroyTask
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, #4]
	bl Free
	ldrb r0, [r5, #8]
	adds r0, #1
	strb r0, [r5, #8]
	b _0801510C
_080150A2:
	adds r0, r5, #0
	adds r0, #9
	ldr r1, _080150AC
	b _080150CA
	.align 2, 0
_080150AC: .4byte 0x082C0AC8
_080150B0:
	adds r0, r5, #0
	adds r0, #9
	ldr r1, _080150B8
	b _080150CA
	.align 2, 0
_080150B8: .4byte 0x082C066C
_080150BC:
	adds r0, r5, #0
	adds r0, #9
	ldr r2, _080150E8
	ldrb r1, [r5, #0x12]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
_080150CA:
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, #0
	beq _0801510C
	bl DestroyWirelessStatusIndicatorSprite
	adds r0, r4, #0
	bl DestroyTask
	bl sub_0800E894
	ldr r1, _080150EC
	movs r0, #5
	strh r0, [r1]
	b _0801510C
	.align 2, 0
_080150E8: .4byte 0x082C1D30
_080150EC: .4byte 0x02037290
_080150F0:
	ldrb r0, [r5, #8]
	adds r0, #1
	strb r0, [r5, #8]
	bl sub_0800A8D4
	b _0801510C
_080150FC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801510C
	adds r0, r4, #0
	bl DestroyTask
_0801510C:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08014DFC

	thumb_func_start UnionRoomSpecial
UnionRoomSpecial: @ 0x08015114
	push {r4, lr}
	bl sub_08010A50
	ldr r0, _08015150
	movs r1, #0xa
	bl CreateTask
	ldr r4, _08015154
	movs r0, #0x89
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _08015158
	str r0, [r1]
	movs r1, #0
	strb r1, [r0, #0x14]
	strb r1, [r0, #0x16]
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	ldr r0, _0801515C
	strh r1, [r0]
	movs r0, #0xd0
	movs r1, #1
	bl sub_08199F54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015150: .4byte 0x080151E9
_08015154: .4byte 0x020228E4
_08015158: .4byte 0x03000DA8
_0801515C: .4byte 0x02037290
	thumb_func_end UnionRoomSpecial

	thumb_func_start ReadAsU16
ReadAsU16: @ 0x08015160
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0]
	orrs r0, r1
	bx lr
	.align 2, 0
	thumb_func_end ReadAsU16

	thumb_func_start sub_0801516C
sub_0801516C: @ 0x0801516C
	push {lr}
	adds r3, r1, #0
	ldr r1, _0801518C
	ldr r2, [r1]
	movs r1, #8
	strb r1, [r2, #0x14]
	strb r0, [r2, #0x15]
	ldr r0, _08015190
	cmp r3, r0
	beq _08015186
	adds r1, r3, #0
	bl StringExpandPlaceholders
_08015186:
	pop {r0}
	bx r0
	.align 2, 0
_0801518C: .4byte 0x020228E4
_08015190: .4byte 0x02021C7C
	thumb_func_end sub_0801516C

	thumb_func_start sub_08015194
sub_08015194: @ 0x08015194
	push {lr}
	adds r2, r0, #0
	ldr r0, _080151B0
	ldr r1, [r0]
	movs r0, #0x1a
	strb r0, [r1, #0x14]
	ldr r0, _080151B4
	cmp r2, r0
	beq _080151AC
	adds r1, r2, #0
	bl StringExpandPlaceholders
_080151AC:
	pop {r0}
	bx r0
	.align 2, 0
_080151B0: .4byte 0x020228E4
_080151B4: .4byte 0x02021C7C
	thumb_func_end sub_08015194

	thumb_func_start sub_080151B8
sub_080151B8: @ 0x080151B8
	push {lr}
	ldr r3, _080151CC
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r3, #0
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_080151CC: .4byte 0x0201FF00
	thumb_func_end sub_080151B8

	thumb_func_start sub_080151D0
sub_080151D0: @ 0x080151D0
	push {lr}
	ldr r0, [r0]
	ldr r1, _080151E4
	movs r2, #0x80
	lsls r2, r2, #1
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_080151E4: .4byte 0x0201FF00
	thumb_func_end sub_080151D0

	thumb_func_start sub_080151E8
sub_080151E8: @ 0x080151E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0
	ldr r0, _08015214
	ldr r6, [r0]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08015218
	adds r7, r0, r1
	ldrb r0, [r6, #0x14]
	cmp r0, #0x38
	bls _0801520A
	bl _0801638C
_0801520A:
	lsls r0, r0, #2
	ldr r1, _0801521C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015214: .4byte 0x020228E4
_08015218: .4byte 0x03005B68
_0801521C: .4byte 0x08015220
_08015220: @ jump table
	.4byte _08015304 @ case 0
	.4byte _0801535C @ case 1
	.4byte _08015380 @ case 2
	.4byte _080153D0 @ case 3
	.4byte _080154AE @ case 4
	.4byte _08015964 @ case 5
	.4byte _0801575C @ case 6
	.4byte _08015964 @ case 7
	.4byte _08016378 @ case 8
	.4byte _08015CD4 @ case 9
	.4byte _08015DE0 @ case 10
	.4byte _08015BB4 @ case 11
	.4byte _08015BCE @ case 12
	.4byte _08015E30 @ case 13
	.4byte _08015E54 @ case 14
	.4byte _08015E5C @ case 15
	.4byte _08015E6C @ case 16
	.4byte _08015E9A @ case 17
	.4byte _08015EAE @ case 18
	.4byte _08015A3A @ case 19
	.4byte _08015AC0 @ case 20
	.4byte _08015ADE @ case 21
	.4byte _08015B52 @ case 22
	.4byte _080155E2 @ case 23
	.4byte _08015608 @ case 24
	.4byte _08015680 @ case 25
	.4byte _0801634C @ case 26
	.4byte _08015854 @ case 27
	.4byte _0801583C @ case 28
	.4byte _080158D8 @ case 29
	.4byte _08015732 @ case 30
	.4byte _080158AE @ case 31
	.4byte _080158A4 @ case 32
	.4byte _08015C64 @ case 33
	.4byte _08015C84 @ case 34
	.4byte _08015CC4 @ case 35
	.4byte _08015DE8 @ case 36
	.4byte _08015E24 @ case 37
	.4byte _080156FC @ case 38
	.4byte _08015C10 @ case 39
	.4byte _0801599C @ case 40
	.4byte _080159CC @ case 41
	.4byte _08015ED8 @ case 42
	.4byte _08015F6C @ case 43
	.4byte _080160B8 @ case 44
	.4byte _08016120 @ case 45
	.4byte _0801613C @ case 46
	.4byte _08015F88 @ case 47
	.4byte _08016144 @ case 48
	.4byte _0801624C @ case 49
	.4byte _08016280 @ case 50
	.4byte _08016308 @ case 51
	.4byte _0801603C @ case 52
	.4byte _08015FF0 @ case 53
	.4byte _08016004 @ case 54
	.4byte _0801609C @ case 55
	.4byte _080160EC @ case 56
_08015304:
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r6, #4]
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r6, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	bl AllocZeroed
	str r0, [r6]
	movs r0, #0x20
	bl AllocZeroed
	str r0, [r6, #8]
	ldr r0, [r6]
	movs r1, #8
	bl sub_08017044
	ldr r1, _08015358
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, [r6, #0xc]
	ldr r1, [r6, #4]
	movs r2, #9
	bl sub_08016900
	adds r1, r6, #0
	adds r1, #0x20
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x88
	bl sub_080195B4
	bl sub_080199C8
	movs r0, #1
	bl _0801638A
	.align 2, 0
_08015358: .4byte 0x020228E0
_0801535C:
	adds r0, r6, #0
	adds r0, #0x21
	movs r2, #0
	ldrsh r1, [r7, r2]
	bl sub_0801990C
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	beq _0801537A
	bl _0801638C
_0801537A:
	movs r0, #2
	bl _0801638A
_08015380:
	movs r0, #0x40
	movs r1, #0
	movs r2, #0
	bl sub_08010A74
	ldr r2, _080153C8
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #0xa]
	ldrh r2, [r2, #0xc]
	bl sub_08010ABC
	bl sub_0800AF5C
	bl OpenLink
	bl sub_08011770
	ldr r0, [r6, #8]
	movs r1, #1
	bl sub_08017044
	ldr r0, [r6, #4]
	movs r1, #4
	bl sub_080170B0
	ldr r0, [r6, #0xc]
	movs r1, #4
	bl sub_080170B0
	ldr r1, _080153CC
	movs r0, #0
	strh r0, [r1]
	movs r0, #3
	bl _0801638A
	.align 2, 0
_080153C8: .4byte 0x020228F4
_080153CC: .4byte 0x02037290
_080153D0:
	bl sub_081B1030
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	beq _080153E8
	bl sub_081B1030
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bne _080154A8
_080153E8:
	ldr r4, _08015404
	ldrh r0, [r4]
	cmp r0, #0
	beq _080154A8
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r4]
	cmp r0, #1
	beq _08015408
	cmp r0, #2
	beq _08015458
	b _08015496
	.align 2, 0
_08015404: .4byte 0x020228F4
_08015408:
	movs r0, #0x54
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	cmp r5, #5
	bls _08015434
	adds r0, r4, #0
	bl sub_08017B38
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08010ABC
	ldr r0, _08015430
	bl sub_08015194
	b _08015496
	.align 2, 0
_08015430: .4byte 0x082C1808
_08015434:
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_08017B5C
	cmp r0, #0
	bne _08015454
	ldr r1, _08015450
	movs r0, #0x34
	bl sub_0801516C
	b _08015496
	.align 2, 0
_08015450: .4byte 0x082C17CC
_08015454:
	movs r0, #0x37
	b _08015494
_08015458:
	adds r0, r6, #0
	bl sub_080151D0
	ldrb r0, [r4, #8]
	strh r0, [r7, #2]
	cmp r5, #5
	bls _08015474
	ldr r0, _08015470
	bl sub_08015194
	b _08015496
	.align 2, 0
_08015470: .4byte 0x082C1830
_08015474:
	movs r0, #0x54
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	ldr r1, _080154A0
	movs r0, #0x44
	strb r0, [r1]
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_08017BA4
	movs r0, #0x33
_08015494:
	strb r0, [r6, #0x14]
_08015496:
	ldr r1, _080154A4
	movs r0, #0
	strh r0, [r1]
	bl _0801638C
	.align 2, 0
_080154A0: .4byte 0x020228E0
_080154A4: .4byte 0x020228F4
_080154A8:
	movs r0, #4
	bl _0801638A
_080154AE:
	ldr r4, _080154DC
	ldrh r0, [r4]
	cmp r0, #0
	beq _08015512
	cmp r0, #9
	bne _080154E8
	movs r0, #0x54
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	movs r0, #2
	bl PlaySE
	ldr r0, _080154E0
	ldr r1, _080154E4
	ldr r1, [r1]
	bl StringCopy
	movs r1, #0
	movs r0, #0x2a
	b _0801550A
	.align 2, 0
_080154DC: .4byte 0x02037290
_080154E0: .4byte 0x02021C40
_080154E4: .4byte 0x03005AF0
_080154E8:
	cmp r0, #0xb
	bne _080154FC
	movs r0, #0x54
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	movs r1, #0
	movs r0, #0x17
	b _0801550A
_080154FC:
	movs r0, #0
	strh r0, [r7]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r7, #2]
	movs r1, #0
	movs r0, #0x18
_0801550A:
	strb r0, [r6, #0x14]
	strh r1, [r4]
	bl _0801638C
_08015512:
	bl ScriptContext2_IsEnabled
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08015522
	bl _0801638C
_08015522:
	ldr r0, _08015550
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08015588
	ldr r0, [r6]
	adds r2, r7, #2
	adds r3, r6, #0
	adds r3, #0x21
	adds r1, r7, #0
	bl sub_08019D60
	cmp r0, #0
	beq _08015554
	movs r0, #5
	bl PlaySE
	bl sub_08017C88
	movs r0, #0x18
	bl _0801638A
	.align 2, 0
_08015550: .4byte 0x03002360
_08015554:
	bl sub_080173FC
	cmp r0, #0
	beq _08015588
	movs r0, #0x54
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	movs r0, #2
	bl PlaySE
	bl sub_08017C88
	ldr r0, _08015580
	ldr r1, _08015584
	ldr r1, [r1]
	bl StringCopy
	movs r0, #0x2d
	bl _0801638A
	.align 2, 0
_08015580: .4byte 0x02021C40
_08015584: .4byte 0x03005AF0
_08015588:
	bl sub_08016610
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080155AA
	cmp r0, #2
	bgt _0801559E
	cmp r0, #1
	beq _080155A4
	b _080155D8
_0801559E:
	cmp r0, #4
	beq _080155B2
	b _080155D8
_080155A4:
	movs r0, #2
	bl PlaySE
_080155AA:
	adds r0, r6, #0
	bl sub_08019D2C
	b _080155D8
_080155B2:
	movs r0, #0xb
	strb r0, [r6, #0x14]
	bl sub_08017C88
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08010ABC
	adds r0, r6, #0
	bl sub_08017C98
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0x53
	movs r2, #0
	bl sub_08010B80
_080155D8:
	adds r0, r6, #0
	bl sub_08019D3C
	bl _0801638C
_080155E2:
	ldr r0, _08015604
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080155F2
	bl _0801638C
_080155F2:
	movs r0, #0x40
	movs r1, #0
	movs r2, #0
	bl sub_08010B80
	movs r0, #4
	bl _0801638A
	.align 2, 0
_08015604: .4byte 0x0809F30D
_08015608:
	bl sub_08016B5C
	movs r3, #2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	bl sub_080177B8
	adds r4, r0, #0
	movs r0, #0x54
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	ldr r0, [r6]
	ldrb r1, [r7]
	ldrb r2, [r7, #2]
	adds r3, r4, #0
	bl sub_08017484
	cmp r0, #1
	beq _0801564C
	cmp r0, #1
	bgt _0801563E
	cmp r0, #0
	beq _08015646
	bl _0801638C
_0801563E:
	cmp r0, #2
	beq _08015670
	bl _0801638C
_08015646:
	movs r0, #0x1a
	bl _0801638A
_0801564C:
	movs r1, #2
	ldrsh r0, [r7, r1]
	lsls r0, r0, #5
	ldr r1, [r6]
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	ldr r2, _0801566C
	ldrb r2, [r2]
	bl sub_08011C74
	strh r5, [r6, #0x12]
	movs r0, #0x19
	bl _0801638A
	.align 2, 0
_0801566C: .4byte 0x020228E0
_08015670:
	ldr r1, _0801567C
	movs r0, #0x13
	bl sub_0801516C
	bl _0801638C
	.align 2, 0
_0801567C: .4byte 0x02021C7C
_08015680:
	bl sub_08016B5C
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	blt _080156C6
	cmp r4, #2
	ble _080156A2
	cmp r4, #4
	bne _080156C6
	movs r0, #1
	bl sub_08017C48
	strb r4, [r6, #0x14]
	b _080156C6
_080156A2:
	bl sub_0801167C
	cmp r0, #1
	bne _080156B8
	ldr r0, _080156B4
	bl sub_08015194
	b _080156C0
	.align 2, 0
_080156B4: .4byte 0x082C0FE0
_080156B8:
	ldr r1, _080156E8
	movs r0, #0x1e
	bl sub_0801516C
_080156C0:
	ldr r1, _080156EC
	movs r0, #0x40
	strb r0, [r1]
_080156C6:
	ldr r0, _080156F0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080156D2
	bl _0801638C
_080156D2:
	ldr r0, _080156F4
	movs r1, #1
	bl sub_08013EEC
	ldr r0, _080156F8
	movs r1, #5
	bl CreateTask
	movs r0, #0x26
	bl _0801638A
	.align 2, 0
_080156E8: .4byte 0x082C0FE0
_080156EC: .4byte 0x020228E0
_080156F0: .4byte 0x030031C4
_080156F4: .4byte 0x0202257C
_080156F8: .4byte 0x08013BE9
_080156FC:
	ldr r0, _08015720
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801570C
	bl _0801638C
_0801570C:
	ldr r0, _08015724
	ldrb r0, [r0]
	cmp r0, #0x44
	bne _0801572C
	ldr r1, _08015728
	movs r0, #0x1f
	bl sub_0801516C
	bl _0801638C
	.align 2, 0
_08015720: .4byte 0x08013BE9
_08015724: .4byte 0x020228E0
_08015728: .4byte 0x082C0B80
_0801572C:
	movs r0, #5
	bl _0801638A
_08015732:
	ldr r0, _08015758
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801573E
	bl _0801638C
_0801573E:
	movs r0, #0
	bl sub_08017C48
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r3, #2
	ldrsh r1, [r7, r3]
	ldr r2, [r6]
	bl sub_08019E88
	movs r0, #2
	bl _0801638A
	.align 2, 0
_08015758: .4byte 0x030031C4
_0801575C:
	adds r0, r6, #0
	adds r0, #0x16
	adds r1, r6, #0
	adds r1, #0x1b
	adds r2, r6, #0
	adds r2, #0x1c
	ldr r3, _08015790
	ldr r4, _08015794
	str r4, [sp]
	bl sub_08016C88
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08015780
	bl _0801638C
_08015780:
	ldr r0, _08015798
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801579C
	movs r0, #0x1c
	bl _0801638A
	.align 2, 0
_08015790: .4byte 0x082C2124
_08015794: .4byte 0x082C214C
_08015798: .4byte 0x030031C4
_0801579C:
	adds r1, r6, #0
	adds r1, #0x80
	movs r0, #0
	strh r0, [r1]
	movs r2, #2
	ldrsh r0, [r7, r2]
	ldr r1, [r6]
	bl sub_080177B8
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	beq _080157BA
	cmp r5, #0x40
	bne _080157EC
_080157BA:
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0x40
	strh r1, [r0]
	bl sub_0800F934
	ldr r0, _080157E0
	ldr r2, _080157E4
	ldr r1, _080157E8
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, #0x20
	bl _0801638A
	.align 2, 0
_080157E0: .4byte 0x02021C7C
_080157E4: .4byte 0x082C12BC
_080157E8: .4byte 0x020226A0
_080157EC:
	ldr r0, _08015814
	strb r5, [r0]
	ldr r1, _08015818
	lsrs r0, r5, #8
	strb r0, [r1]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x41
	bne _08015820
	bl sub_08017AE0
	cmp r0, #0
	bne _08015820
	ldr r1, _0801581C
	movs r0, #5
	bl sub_0801516C
	bl _0801638C
	.align 2, 0
_08015814: .4byte 0x020228E0
_08015818: .4byte 0x020228E1
_0801581C: .4byte 0x082C12E4
_08015820:
	ldr r0, _08015838
	ldrb r0, [r0]
	movs r1, #0x40
	orrs r1, r0
	adds r0, r6, #0
	adds r0, #0x4c
	strh r1, [r0]
	bl sub_0800F934
	movs r0, #0x1b
	bl _0801638A
	.align 2, 0
_08015838: .4byte 0x020228E0
_0801583C:
	ldr r0, _0801584C
	ldr r1, _08015850
	bl StringCopy
	movs r0, #0x24
	bl _0801638A
	.align 2, 0
_0801584C: .4byte 0x02021C7C
_08015850: .4byte 0x082C12C4
_08015854:
	adds r0, r6, #0
	bl sub_08017A94
	movs r3, #2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	bl sub_080177B8
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	bl sub_08017440
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x16
	ldr r3, _080158A0
	lsls r1, r5, #2
	lsls r2, r4, #4
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r1, [r1]
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015894
	bl _0801638C
_08015894:
	movs r0, #0
	strh r0, [r7, #6]
	movs r0, #0x1d
	bl _0801638A
	.align 2, 0
_080158A0: .4byte 0x082C10A4
_080158A4:
	bl sub_0800A7F8
	movs r0, #0x24
	bl _0801638A
_080158AE:
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0x44
	strh r1, [r0]
	ldr r2, _080158D4
	ldrh r1, [r2, #0xe]
	adds r3, r6, #0
	adds r3, #0x4e
	strh r1, [r3]
	ldrh r2, [r2, #0x10]
	adds r1, r6, #0
	adds r1, #0x50
	strh r2, [r1]
	bl sub_0800F934
	movs r0, #0x1d
	bl _0801638A
	.align 2, 0
_080158D4: .4byte 0x020228F4
_080158D8:
	ldr r0, _080158F0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080158FC
	ldr r0, _080158F4
	ldr r1, _080158F8
	bl StringCopy
	movs r0, #0x1c
	bl _0801638A
	.align 2, 0
_080158F0: .4byte 0x030031C4
_080158F4: .4byte 0x02021C7C
_080158F8: .4byte 0x082C12C4
_080158FC:
	adds r0, r6, #0
	bl sub_08017A94
	adds r0, r6, #0
	adds r0, #0x80
	ldrh r0, [r0]
	cmp r0, #0x51
	bne _08015932
	ldr r0, _08015924
	ldrb r0, [r0]
	cmp r0, #8
	bne _0801592C
	ldr r0, _08015928
	adds r1, r6, #0
	movs r2, #0
	bl sub_08017CDC
	movs r0, #0x28
	bl _0801638A
	.align 2, 0
_08015924: .4byte 0x020228E0
_08015928: .4byte 0x02021C7C
_0801592C:
	movs r0, #0xd
	bl _0801638A
_08015932:
	cmp r0, #0x52
	beq _0801593A
	bl _0801638C
_0801593A:
	movs r5, #0
	movs r0, #0x20
	strb r0, [r6, #0x14]
	ldr r0, _08015958
	ldr r4, _0801595C
	ldrb r2, [r4]
	movs r1, #0x40
	orrs r1, r2
	ldr r2, _08015960
	ldrb r2, [r2, #0x13]
	bl sub_0801785C
	strb r5, [r4]
	bl _0801638C
	.align 2, 0
_08015958: .4byte 0x02021C7C
_0801595C: .4byte 0x020228E0
_08015960: .4byte 0x020226A0
_08015964:
	movs r0, #2
	ldrsh r1, [r7, r0]
	lsls r1, r1, #5
	ldr r0, [r6]
	adds r0, r0, r1
	bl sub_08017468
	adds r5, r0, #0
	movs r1, #2
	ldrsh r0, [r7, r1]
	ldr r1, [r6]
	bl sub_080177B8
	adds r4, r0, #0
	ldr r2, _08015998
	lsls r0, r4, #2
	lsls r1, r5, #3
	adds r0, r0, r1
	adds r0, r0, r2
	ldr r1, [r0]
	movs r0, #6
	bl sub_0801516C
	bl _0801638C
	.align 2, 0
_08015998: .4byte 0x082C0D3C
_0801599C:
	adds r0, r6, #0
	adds r0, #0x16
	ldr r1, _080159C8
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080159B0
	bl _0801638C
_080159B0:
	movs r4, #0
	movs r0, #0x29
	strb r0, [r6, #0x14]
	bl sub_0800A8D4
	adds r0, r6, #0
	adds r0, #0x80
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	bl _0801638C
	.align 2, 0
_080159C8: .4byte 0x02021C7C
_080159CC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080159DA
	bl _0801638C
_080159DA:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015A34
	ldr r5, _08015A24
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r4, _08015A28
	adds r1, r1, r4
	adds r0, r5, #0
	bl StringCopy
	ldrh r0, [r4, #0x18]
	adds r4, #0x1c
	adds r1, r4, #0
	bl sub_0800E004
	adds r5, r0, #0
	ldr r0, _08015A2C
	ldr r2, _08015A30
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	movs r0, #0x21
	bl _0801638A
	.align 2, 0
_08015A24: .4byte 0x02021C40
_08015A28: .4byte 0x020226A8
_08015A2C: .4byte 0x02021C7C
_08015A30: .4byte 0x082C0DE4
_08015A34:
	movs r0, #7
	bl _0801638A
_08015A3A:
	adds r0, r6, #0
	adds r0, #0x16
	movs r1, #0
	bl sub_08016BC8
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	beq _08015A64
	cmp r5, #0
	bgt _08015A5C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _08015AA0
	bl _0801638C
_08015A5C:
	cmp r5, #1
	beq _08015AA0
	bl _0801638C
_08015A64:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r4, _08015A9C
	movs r0, #0x45
	strb r0, [r4]
	movs r0, #0x45
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	movs r2, #2
	ldrsh r0, [r7, r2]
	lsls r0, r0, #5
	ldr r1, [r6]
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	ldrb r2, [r4]
	bl sub_08011C74
	ldrh r0, [r7, #2]
	strh r0, [r6, #0x12]
	movs r0, #0x14
	strb r0, [r6, #0x14]
	strh r5, [r7, #6]
	bl _0801638C
	.align 2, 0
_08015A9C: .4byte 0x020228E0
_08015AA0:
	movs r3, #2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	bl sub_080177B8
	adds r4, r0, #0
	ldr r1, _08015ABC
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08015194
	bl _0801638C
	.align 2, 0
_08015ABC: .4byte 0x082C1364
_08015AC0:
	ldrh r0, [r7, #4]
	adds r0, #1
	strh r0, [r7, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bgt _08015AD2
	bl _0801638C
_08015AD2:
	movs r1, #0
	movs r0, #0x15
	strb r0, [r6, #0x14]
	strh r1, [r7, #4]
	bl _0801638C
_08015ADE:
	bl sub_08011564
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	beq _08015B44
	cmp r4, #3
	ble _08015AFC
	cmp r4, #4
	bne _08015B48
	movs r0, #1
	bl sub_08017C48
	strb r4, [r6, #0x14]
	b _08015B48
_08015AFC:
	cmp r4, #1
	blt _08015B48
	movs r1, #2
	ldrsh r0, [r7, r1]
	ldr r1, [r6]
	bl sub_080177B8
	adds r4, r0, #0
	movs r0, #0x54
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	bl sub_0801167C
	cmp r0, #1
	bne _08015B30
	ldr r0, _08015B2C
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_08015194
	b _08015B48
	.align 2, 0
_08015B2C: .4byte 0x082C13C4
_08015B30:
	ldr r0, _08015B40
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #0x1e
	bl sub_0801516C
	b _08015B48
	.align 2, 0
_08015B40: .4byte 0x082C13C4
_08015B44:
	movs r0, #0x16
	strb r0, [r6, #0x14]
_08015B48:
	ldrh r0, [r7, #6]
	adds r0, #1
	strh r0, [r7, #6]
	bl _0801638C
_08015B52:
	bl sub_08011570
	cmp r0, #0
	beq _08015B9A
	movs r2, #2
	ldrsh r0, [r7, r2]
	ldr r1, [r6]
	bl sub_080177B8
	adds r4, r0, #0
	movs r0, #0x54
	movs r1, #0
	movs r2, #1
	bl sub_08010B80
	bl sub_0801167C
	cmp r0, #1
	bne _08015B8C
	ldr r0, _08015B88
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_08015194
	b _08015B9A
	.align 2, 0
_08015B88: .4byte 0x082C13C4
_08015B8C:
	ldr r0, _08015BAC
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #0x1e
	bl sub_0801516C
_08015B9A:
	ldr r0, _08015BB0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08015BA6
	bl _0801638C
_08015BA6:
	movs r0, #0x10
	bl _0801638A
	.align 2, 0
_08015BAC: .4byte 0x082C13C4
_08015BB0: .4byte 0x030031C4
_08015BB4:
	movs r0, #0x49
	bl PlaySE
	bl sub_0800EA3C
	movs r0, #0
	movs r1, #0xc
	strb r1, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x82
	strh r0, [r1]
	bl _0801638C
_08015BCE:
	bl sub_08011570
	cmp r0, #0
	beq _08015BE2
	movs r0, #0
	bl sub_08017C48
	movs r0, #2
	bl _0801638A
_08015BE2:
	ldr r0, _08015C04
	ldrb r0, [r0]
	cmp r0, #0
	bne _08015BEE
	bl _0801638C
_08015BEE:
	ldr r0, _08015C08
	movs r1, #1
	bl sub_08013EEC
	ldr r0, _08015C0C
	movs r1, #5
	bl CreateTask
	movs r0, #0x27
	b _0801638A
	.align 2, 0
_08015C04: .4byte 0x030031C4
_08015C08: .4byte 0x0202257C
_08015C0C: .4byte 0x08013BE9
_08015C10:
	adds r0, r6, #0
	bl sub_080163B0
	ldr r0, _08015C50
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08015C24
	b _0801638C
_08015C24:
	movs r0, #0x21
	strb r0, [r6, #0x14]
	ldr r0, _08015C54
	ldr r4, _08015C58
	adds r1, r4, #0
	bl StringCopy
	adds r0, r4, #0
	subs r0, #0x24
	ldrh r0, [r0, #0x20]
	adds r1, r4, #0
	bl sub_0800E004
	adds r5, r0, #0
	ldr r0, _08015C5C
	ldr r2, _08015C60
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	b _0801638C
	.align 2, 0
_08015C50: .4byte 0x08013BE9
_08015C54: .4byte 0x02021C40
_08015C58: .4byte 0x020226C4
_08015C5C: .4byte 0x02021C7C
_08015C60: .4byte 0x082C0DB8
_08015C64:
	adds r0, r6, #0
	bl sub_080163B0
	adds r0, r6, #0
	adds r0, #0x16
	ldr r1, _08015C80
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015C7C
	b _0801638C
_08015C7C:
	movs r0, #0x22
	b _0801638A
	.align 2, 0
_08015C80: .4byte 0x02021C7C
_08015C84:
	adds r0, r6, #0
	bl sub_080163B0
	adds r0, r6, #0
	bl sub_080163F0
	cmp r0, #0
	bne _08015C96
	b _0801638C
_08015C96:
	ldr r0, _08015CB8
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08015CA4
	b _0801638C
_08015CA4:
	movs r0, #1
	bl sub_080118CC
	ldr r0, _08015CBC
	ldr r1, _08015CC0
	bl StringCopy
	movs r0, #0x24
	b _0801638A
	.align 2, 0
_08015CB8: .4byte 0x03002360
_08015CBC: .4byte 0x02021C7C
_08015CC0: .4byte 0x082C0F04
_08015CC4:
	ldr r1, _08015CD0
	movs r0, #9
	bl sub_0801516C
	b _0801638C
	.align 2, 0
_08015CD0: .4byte 0x02021C7C
_08015CD4:
	adds r0, r6, #0
	adds r0, #0x16
	movs r1, #0
	bl sub_08016BC8
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08015CFA
	cmp r1, #0
	bgt _08015CF4
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08015DBA
	b _0801638C
_08015CF4:
	cmp r1, #1
	beq _08015DBA
	b _0801638C
_08015CFA:
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0x51
	strh r1, [r0]
	ldr r1, _08015D28
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0x45
	bne _08015D2C
	movs r4, #0x40
	orrs r4, r1
	movs r0, #1
	bl sub_08010AFC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	movs r2, #0
	bl sub_08010B80
	b _08015D4A
	.align 2, 0
_08015D28: .4byte 0x020228E0
_08015D2C:
	movs r0, #0x40
	adds r4, r1, #0
	orrs r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl sub_08010AFC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	movs r2, #1
	bl sub_08010B80
_08015D4A:
	ldr r1, [r6, #8]
	movs r0, #0
	strb r0, [r1, #0x1b]
	strh r0, [r7, #6]
	ldr r0, _08015D7C
	ldrb r0, [r0]
	cmp r0, #0x41
	bne _08015D92
	bl sub_08017AE0
	cmp r0, #0
	bne _08015D88
	movs r0, #0x52
	strh r0, [r5]
	adds r0, r5, #0
	bl sub_0800F934
	movs r0, #0xa
	strb r0, [r6, #0x14]
	ldr r0, _08015D80
	ldr r1, _08015D84
	bl StringCopy
	b _0801638C
	.align 2, 0
_08015D7C: .4byte 0x020228E0
_08015D80: .4byte 0x02021C7C
_08015D84: .4byte 0x082C1310
_08015D88:
	adds r0, r5, #0
	bl sub_0800F934
	movs r0, #0xd
	b _0801638A
_08015D92:
	cmp r0, #0x48
	bne _08015DB0
	adds r0, r5, #0
	bl sub_0800F934
	ldr r0, _08015DAC
	adds r1, r6, #0
	movs r2, #1
	bl sub_08017CDC
	movs r0, #0x28
	b _0801638A
	.align 2, 0
_08015DAC: .4byte 0x02021C7C
_08015DB0:
	adds r0, r5, #0
	bl sub_0800F934
	movs r0, #0xd
	b _0801638A
_08015DBA:
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0x52
	strh r1, [r0]
	bl sub_0800F934
	movs r0, #0xa
	strb r0, [r6, #0x14]
	ldr r0, _08015DD8
	ldr r1, _08015DDC
	ldrb r1, [r1]
	bl sub_08012B78
	b _0801638C
	.align 2, 0
_08015DD8: .4byte 0x02021C7C
_08015DDC: .4byte 0x020228E0
_08015DE0:
	bl sub_0800A7F8
	movs r0, #0x24
	b _0801638A
_08015DE8:
	ldr r0, _08015E18
	ldrb r4, [r0]
	cmp r4, #0
	beq _08015DF2
	b _0801638C
_08015DF2:
	ldr r1, _08015E1C
	movs r0, #0x40
	strb r0, [r1]
	ldr r1, _08015E20
	movs r0, #0x25
	bl sub_0801516C
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0
	movs r2, #0xc
	bl memset
	adds r0, r6, #0
	adds r0, #0x82
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	b _0801638C
	.align 2, 0
_08015E18: .4byte 0x030031C4
_08015E1C: .4byte 0x020228E0
_08015E20: .4byte 0x02021C7C
_08015E24:
	movs r0, #2
	strb r0, [r6, #0x14]
	movs r0, #0
	bl sub_08017C48
	b _0801638C
_08015E30:
	ldr r4, _08015E4C
	ldr r0, _08015E50
	ldrb r0, [r0]
	movs r1, #0x40
	orrs r1, r0
	adds r0, r4, #0
	bl sub_080178C0
	movs r0, #0xe
	adds r1, r4, #0
	bl sub_0801516C
	b _0801638C
	.align 2, 0
_08015E4C: .4byte 0x02021C7C
_08015E50: .4byte 0x020228E0
_08015E54:
	bl sub_0800A8D4
	movs r0, #0xf
	b _0801638A
_08015E5C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015E68
	b _0801638C
_08015E68:
	movs r0, #0x10
	b _0801638A
_08015E6C:
	ldr r0, [r6, #8]
	bl Free
	ldr r0, [r6]
	bl Free
	ldr r0, [r6, #0xc]
	bl Free
	ldr r0, [r6, #4]
	bl Free
	adds r0, r6, #0
	adds r0, #0x20
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r6, #0
	adds r0, #0x21
	bl sub_080199A0
	movs r0, #0x11
	b _0801638A
_08015E9A:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #0x12
	b _0801638A
_08015EAE:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08015EBA
	b _0801638C
_08015EBA:
	bl sub_080198D8
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _08015ED4
	ldr r0, [r0]
	bl Free
	bl sub_080144E0
	b _0801638C
	.align 2, 0
_08015ED4: .4byte 0x020228E4
_08015ED8:
	bl sub_0800F29C
	ldrh r1, [r0, #8]
	ldr r4, _08015EEC
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08015EF0
	movs r0, #0x2b
	b _0801638A
	.align 2, 0
_08015EEC: .4byte 0x000003FF
_08015EF0:
	bl sub_0800F29C
	ldrh r1, [r0, #8]
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	bne _08015F14
	ldr r0, _08015F0C
	ldr r1, _08015F10
	bl StringCopy
	b _08015F4C
	.align 2, 0
_08015F0C: .4byte 0x02021C7C
_08015F10: .4byte 0x082C1864
_08015F14:
	ldr r4, _08015F58
	bl sub_0800F29C
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08015F5C
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	ldr r4, _08015F60
	bl sub_0800F29C
	ldrb r1, [r0, #0xb]
	lsrs r1, r1, #1
	adds r0, r4, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, _08015F64
	ldr r1, _08015F68
	bl StringExpandPlaceholders
_08015F4C:
	ldr r1, _08015F64
	movs r0, #0x2c
	bl sub_0801516C
	b _0801638C
	.align 2, 0
_08015F58: .4byte 0x02021C40
_08015F5C: .4byte 0x082EA31C
_08015F60: .4byte 0x02021C54
_08015F64: .4byte 0x02021C7C
_08015F68: .4byte 0x082C1844
_08015F6C:
	adds r0, r6, #0
	adds r0, #0x16
	ldr r1, _08015F84
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015F7E
	b _0801638C
_08015F7E:
	movs r0, #0x2f
	b _0801638A
	.align 2, 0
_08015F84: .4byte 0x082C169C
_08015F88:
	adds r0, r6, #0
	adds r0, #0x16
	adds r1, r6, #0
	adds r1, #0x1d
	adds r2, r6, #0
	adds r2, #0x1e
	ldr r3, _08015FC0
	ldr r4, _08015FC4
	str r4, [sp]
	bl sub_08016C88
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08015FAA
	b _0801638C
_08015FAA:
	subs r0, #1
	cmp r5, r0
	beq _08015FB4
	cmp r5, #3
	bne _08015FC8
_08015FB4:
	movs r0, #4
	strb r0, [r6, #0x14]
	movs r0, #1
	bl sub_08017C48
	b _0801638C
	.align 2, 0
_08015FC0: .4byte 0x082C2164
_08015FC4: .4byte 0x082C2184
_08015FC8:
	cmp r5, #1
	beq _08015FD2
	cmp r5, #2
	beq _08015FE0
	b _0801638C
_08015FD2:
	ldr r1, _08015FDC
	movs r0, #0x35
	bl sub_0801516C
	b _0801638C
	.align 2, 0
_08015FDC: .4byte 0x082C17E8
_08015FE0:
	ldr r1, _08015FEC
	movs r0, #0x2f
	bl sub_0801516C
	b _0801638C
	.align 2, 0
_08015FEC: .4byte 0x082C16E0
_08015FF0:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #0x36
	b _0801638A
_08016004:
	ldr r0, _08016028
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08016012
	b _0801638C
_08016012:
	ldr r1, _0801602C
	movs r0, #1
	strh r0, [r1]
	ldr r1, _08016030
	ldr r0, _08016034
	str r0, [r1]
	ldr r1, _08016038
	movs r0, #8
	bl sub_081B85A4
	b _0801638C
	.align 2, 0
_08016028: .4byte 0x02037C74
_0801602C: .4byte 0x020228F4
_08016030: .4byte 0x03005B0C
_08016034: .4byte 0x080AEA25
_08016038: .4byte 0x08085A31
_0801603C:
	adds r0, r6, #0
	adds r0, #0x16
	adds r1, r6, #0
	adds r1, #0x1d
	adds r2, r6, #0
	adds r2, #0x1e
	ldr r3, _08016080
	ldr r4, _08016084
	str r4, [sp]
	bl sub_08016C88
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0801605E
	b _0801638C
_0801605E:
	subs r0, #1
	cmp r5, r0
	beq _08016068
	cmp r5, #0x12
	bne _08016090
_08016068:
	ldr r0, _08016088
	bl sub_08017B38
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08010ABC
	ldr r0, _0801608C
	bl sub_08015194
	b _0801638C
	.align 2, 0
_08016080: .4byte 0x082C219C
_08016084: .4byte 0x082C2234
_08016088: .4byte 0x020228F4
_0801608C: .4byte 0x082C1808
_08016090:
	ldr r0, _08016098
	strh r5, [r0, #2]
	movs r0, #0x37
	b _0801638A
	.align 2, 0
_08016098: .4byte 0x020228F4
_0801609C:
	ldr r2, _080160B0
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #0xa]
	ldrh r2, [r2, #0xc]
	bl sub_08010ABC
	ldr r0, _080160B4
	bl sub_08015194
	b _0801638C
	.align 2, 0
_080160B0: .4byte 0x020228F4
_080160B4: .4byte 0x082C181C
_080160B8:
	adds r0, r6, #0
	adds r0, #0x16
	movs r1, #0
	bl sub_08016BC8
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080160DE
	cmp r1, #0
	bgt _080160D8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080160E2
	b _0801638C
_080160D8:
	cmp r1, #1
	beq _080160E2
	b _0801638C
_080160DE:
	movs r0, #0x38
	b _0801638A
_080160E2:
	movs r0, #1
	bl sub_08017C48
	movs r0, #4
	b _0801638A
_080160EC:
	adds r0, r6, #0
	adds r0, #0x16
	ldr r1, _08016118
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080160FE
	b _0801638C
_080160FE:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08010ABC
	ldr r0, _0801611C
	bl sub_08017B38
	movs r0, #1
	bl sub_08017C48
	movs r0, #4
	b _0801638A
	.align 2, 0
_08016118: .4byte 0x082C1880
_0801611C: .4byte 0x020228F4
_08016120:
	adds r0, r6, #0
	adds r0, #0x16
	ldr r1, _08016138
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016132
	b _0801638C
_08016132:
	movs r0, #0x2e
	b _0801638A
	.align 2, 0
_08016138: .4byte 0x082C1688
_0801613C:
	bl sub_08016E74
	movs r0, #0x30
	b _0801638A
_08016144:
	adds r0, r6, #0
	adds r0, #0x16
	adds r1, r6, #0
	adds r1, #0x1d
	adds r2, r6, #0
	adds r2, #0x4a
	adds r3, r6, #0
	adds r3, #0x1e
	ldr r4, _08016184
	str r4, [sp]
	ldr r4, _08016188
	str r4, [sp, #4]
	ldr r4, [r6]
	str r4, [sp, #8]
	bl sub_08016D5C
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08016170
	b _0801638C
_08016170:
	subs r0, #1
	cmp r5, r0
	beq _0801617A
	cmp r5, #8
	bne _0801618C
_0801617A:
	movs r0, #1
	bl sub_08017C48
	movs r0, #4
	b _0801638A
	.align 2, 0
_08016184: .4byte 0x082C2254
_08016188: .4byte 0x082C22AC
_0801618C:
	bl sub_08016E74
	ldr r1, [r6]
	lsls r4, r5, #5
	adds r1, r1, r4
	ldrb r0, [r1, #9]
	lsrs r0, r0, #2
	ldrh r1, [r1, #8]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	bl sub_080177C4
	cmp r0, #1
	beq _080161D8
	cmp r0, #1
	bgt _080161B2
	cmp r0, #0
	beq _080161B8
	b _0801638C
_080161B2:
	cmp r0, #2
	beq _08016210
	b _0801638C
_080161B8:
	ldr r0, _080161D0
	ldr r1, [r6]
	adds r1, r1, r4
	adds r1, #0x10
	bl StringCopy
	ldr r1, _080161D4
	movs r0, #0x31
	bl sub_0801516C
	strh r5, [r7, #2]
	b _0801638C
	.align 2, 0
_080161D0: .4byte 0x02021C40
_080161D4: .4byte 0x082C18CC
_080161D8:
	ldr r0, _08016200
	ldr r1, [r6]
	adds r1, r1, r4
	adds r1, #0x10
	bl StringCopy
	ldr r0, _08016204
	ldr r1, [r6]
	adds r1, r1, r4
	ldrb r2, [r1, #9]
	lsrs r2, r2, #2
	lsls r1, r2, #2
	adds r1, r1, r2
	ldr r2, _08016208
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _0801620C
	b _08016234
	.align 2, 0
_08016200: .4byte 0x02021C40
_08016204: .4byte 0x02021C54
_08016208: .4byte 0x082EBC88
_0801620C: .4byte 0x082C1918
_08016210:
	ldr r0, _0801623C
	ldr r1, [r6]
	adds r1, r1, r4
	adds r1, #0x10
	bl StringCopy
	ldr r0, _08016240
	ldr r1, [r6]
	adds r1, r1, r4
	ldrb r2, [r1, #9]
	lsrs r2, r2, #2
	lsls r1, r2, #2
	adds r1, r1, r2
	ldr r2, _08016244
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _08016248
_08016234:
	movs r0, #0x2e
	bl sub_0801516C
	b _0801638C
	.align 2, 0
_0801623C: .4byte 0x02021C40
_08016240: .4byte 0x02021C54
_08016244: .4byte 0x082EBC88
_08016248: .4byte 0x082C1938
_0801624C:
	adds r0, r6, #0
	adds r0, #0x16
	movs r1, #0
	bl sub_08016BC8
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08016272
	cmp r1, #0
	bgt _0801626C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08016276
	b _0801638C
_0801626C:
	cmp r1, #1
	beq _08016276
	b _0801638C
_08016272:
	movs r0, #0x32
	b _0801638A
_08016276:
	movs r0, #1
	bl sub_08017C48
	movs r0, #4
	b _0801638A
_08016280:
	adds r0, r6, #0
	adds r0, #0x16
	ldr r1, _080162E8
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016292
	b _0801638C
_08016292:
	ldr r4, _080162EC
	movs r0, #2
	strh r0, [r4]
	ldr r2, _080162F0
	movs r3, #2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r2, _080162F4
	ldr r1, [r6]
	movs r3, #2
	ldrsh r0, [r7, r3]
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrb r0, [r1, #9]
	lsrs r0, r0, #2
	strb r0, [r2]
	ldr r2, _080162F8
	ldr r1, [r6]
	movs r3, #2
	ldrsh r0, [r7, r3]
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	strh r0, [r2]
	ldr r1, _080162FC
	ldr r0, _08016300
	str r0, [r1]
	ldr r1, _08016304
	movs r0, #9
	bl sub_081B85A4
	adds r0, r6, #0
	bl sub_080151B8
	ldrh r0, [r7, #2]
	strb r0, [r4, #8]
	b _0801638C
	.align 2, 0
_080162E8: .4byte 0x082C17E8
_080162EC: .4byte 0x020228F4
_080162F0: .4byte 0x020228EC
_080162F4: .4byte 0x020228F2
_080162F8: .4byte 0x020228F0
_080162FC: .4byte 0x03005B0C
_08016300: .4byte 0x080AEA25
_08016304: .4byte 0x08085A31
_08016308:
	ldr r1, _08016340
	movs r0, #0x44
	strb r0, [r1]
	movs r1, #2
	ldrsh r0, [r7, r1]
	lsls r0, r0, #5
	ldr r1, [r6]
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	movs r2, #0x44
	bl sub_08011C74
	ldr r0, _08016344
	movs r3, #2
	ldrsh r2, [r7, r3]
	lsls r2, r2, #5
	ldr r1, [r6]
	adds r1, r1, r2
	adds r1, #0x10
	bl StringCopy
	ldr r0, _08016348
	ldr r0, [r0, #8]
	bl sub_08016B30
	movs r0, #0x19
	b _0801638A
	.align 2, 0
_08016340: .4byte 0x020228E0
_08016344: .4byte 0x02021C40
_08016348: .4byte 0x082C0CD8
_0801634C:
	adds r0, r6, #0
	adds r0, #0x16
	ldr r1, _08016374
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801638C
	movs r0, #1
	bl sub_08017C48
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r2, #2
	ldrsh r1, [r7, r2]
	ldr r2, [r6]
	bl sub_08019E88
	movs r0, #4
	b _0801638A
	.align 2, 0
_08016374: .4byte 0x02021C7C
_08016378:
	adds r0, r6, #0
	adds r0, #0x16
	ldr r1, _08016394
	bl PrintOnTextbox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801638C
	ldrb r0, [r6, #0x15]
_0801638A:
	strb r0, [r6, #0x14]
_0801638C:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016394: .4byte 0x02021C7C
	thumb_func_end sub_080151E8

	thumb_func_start var_800D_set_xB
var_800D_set_xB: @ 0x08016398
	push {lr}
	bl InUnionRoom
	cmp r0, #1
	bne _080163A8
	ldr r1, _080163AC
	movs r0, #0xb
	strh r0, [r1]
_080163A8:
	pop {r0}
	bx r0
	.align 2, 0
_080163AC: .4byte 0x02037290
	thumb_func_end var_800D_set_xB

	thumb_func_start sub_080163B0
sub_080163B0: @ 0x080163B0
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, _080163EC
	ldrh r5, [r3, #0x12]
	adds r4, r5, #0
	cmp r4, #0
	beq _080163E4
	ldrh r0, [r3, #0x10]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	movs r0, #0xbc
	lsls r0, r0, #6
	cmp r1, r0
	bne _080163E4
	adds r0, r2, #0
	adds r0, #0x82
	strh r5, [r0]
	cmp r4, #0x44
	bne _080163E4
	ldrh r1, [r3, #0x14]
	adds r0, #2
	strh r1, [r0]
	ldrh r1, [r3, #0x16]
	adds r0, #2
	strh r1, [r0]
_080163E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080163EC: .4byte 0x03003130
	thumb_func_end sub_080163B0

	thumb_func_start sub_080163F0
sub_080163F0: @ 0x080163F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x82
	ldrh r0, [r5]
	cmp r0, #0
	beq _08016440
	ldr r0, _08016424
	ldr r1, _08016428
	adds r1, #0x2f
	ldrb r1, [r1]
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08017960
	cmp r0, #0
	beq _08016440
	cmp r0, #1
	bne _08016430
	movs r0, #0x23
	strb r0, [r4, #0x14]
	ldr r1, _0801642C
	ldrh r0, [r5]
	strb r0, [r1]
	movs r0, #0
	b _08016442
	.align 2, 0
_08016424: .4byte 0x02021C7C
_08016428: .4byte 0x020226A0
_0801642C: .4byte 0x020228E0
_08016430:
	cmp r0, #2
	bne _08016440
	movs r0, #0x24
	strb r0, [r4, #0x14]
	bl sub_0800A7F8
	movs r0, #0
	b _08016442
_08016440:
	movs r0, #1
_08016442:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080163F0

	thumb_func_start sub_08016448
sub_08016448: @ 0x08016448
	push {r4, r5, lr}
	ldr r5, _08016480
	movs r0, #0xff
	strb r0, [r5]
	ldr r0, _08016484
	movs r1, #0
	bl CreateTask
	ldr r4, _08016488
	movs r0, #0x89
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _0801648C
	str r0, [r1]
	movs r1, #0
	strb r1, [r0, #0x14]
	strb r1, [r0, #0x16]
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016480: .4byte 0x020228D8
_08016484: .4byte 0x08016491
_08016488: .4byte 0x020228E4
_0801648C: .4byte 0x03000DA8
	thumb_func_end sub_08016448

	thumb_func_start sub_08016490
sub_08016490: @ 0x08016490
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080164AC
	ldr r4, [r0]
	ldrb r0, [r4, #0x14]
	cmp r0, #4
	bls _080164A2
	b _080165D8
_080164A2:
	lsls r0, r0, #2
	ldr r1, _080164B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080164AC: .4byte 0x020228E4
_080164B0: .4byte 0x080164B4
_080164B4: @ jump table
	.4byte _080164C8 @ case 0
	.4byte _080164CE @ case 1
	.4byte _080164F0 @ case 2
	.4byte _08016540 @ case 3
	.4byte _080165A4 @ case 4
_080164C8:
	movs r0, #1
	strb r0, [r4, #0x14]
	b _080165D8
_080164CE:
	movs r0, #0xc
	movs r1, #0
	movs r2, #0
	bl sub_08010A74
	bl sub_0800AF5C
	bl OpenLink
	bl sub_08011770
	movs r0, #1
	bl sub_08010CA0
	movs r0, #2
	strb r0, [r4, #0x14]
	b _080165D8
_080164F0:
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r4, #4]
	movs r1, #4
	bl sub_080170B0
	movs r0, #0x70
	bl AllocZeroed
	str r0, [r4, #0xc]
	movs r1, #4
	bl sub_080170B0
	movs r0, #0x80
	lsls r0, r0, #1
	bl AllocZeroed
	str r0, [r4]
	movs r1, #8
	bl sub_08017044
	movs r0, #0x20
	bl AllocZeroed
	str r0, [r4, #8]
	movs r1, #1
	bl sub_08017044
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #4]
	movs r2, #0xa
	bl sub_08016900
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
	movs r0, #3
	strb r0, [r4, #0x14]
	b _080165D8
_08016540:
	bl sub_08016610
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	blt _080165D8
	cmp r0, #2
	bgt _080165D8
	ldr r0, _0801658C
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080165D8
	movs r6, #0
_0801655A:
	ldr r0, [r4]
	lsls r5, r6, #5
	adds r1, r0, r5
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _08016582
	adds r0, r1, #2
	bl ReadAsU16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [r4]
	adds r1, r1, r5
	adds r1, #0x10
	bl sub_0800E004
	cmp r0, #0
	bne _08016590
_08016582:
	adds r6, #1
	cmp r6, #7
	ble _0801655A
	b _080165D8
	.align 2, 0
_0801658C: .4byte 0x020228D8
_08016590:
	ldr r0, _080165A0
	ldr r1, [r4]
	adds r1, r1, r5
	adds r1, #0x10
	bl StringCopy
	b _080165D8
	.align 2, 0
_080165A0: .4byte 0x020228D8
_080165A4:
	ldr r0, [r4, #8]
	bl Free
	ldr r0, [r4]
	bl Free
	ldr r0, [r4, #0xc]
	bl Free
	ldr r0, [r4, #4]
	bl Free
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, _080165E0
	ldr r0, [r0]
	bl Free
	bl sub_0800E894
	adds r0, r5, #0
	bl DestroyTask
_080165D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080165E0: .4byte 0x020228E4
	thumb_func_end sub_08016490

	thumb_func_start sp182_move_string
sp182_move_string: @ 0x080165E4
	push {r4, lr}
	ldr r4, _080165F4
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _080165F8
	movs r0, #0
	b _08016606
	.align 2, 0
_080165F4: .4byte 0x020228D8
_080165F8:
	ldr r0, _0801660C
	adds r1, r4, #0
	bl StringCopy
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #1
_08016606:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801660C: .4byte 0x02021C40
	thumb_func_end sp182_move_string

	thumb_func_start sub_08016610
sub_08016610: @ 0x08016610
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08016664
	ldr r4, [r0]
	movs r7, #0
	movs r6, #0
	movs r5, #0
_08016622:
	ldr r0, [r4, #0xc]
	adds r0, r0, r5
	ldr r1, _08016668
	bl sub_080170F4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _0801666C
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	adds r1, r1, r5
	ldm r1!, {r2, r5, r6}
	stm r0!, {r2, r5, r6}
	ldm r1!, {r2, r5, r6}
	stm r0!, {r2, r5, r6}
	ldr r1, [r4, #8]
	movs r0, #0
	strh r0, [r1, #0x18]
	ldr r2, [r4, #8]
	ldrb r1, [r2, #0x1a]
	movs r5, #4
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #0x1a]
	ldr r0, [r4, #8]
	strb r3, [r0, #0x1b]
	movs r0, #4
	b _080167A0
	.align 2, 0
_08016664: .4byte 0x020228E4
_08016668: .4byte 0x082C2364
_0801666C:
	adds r5, #0x1c
	adds r6, #1
	cmp r6, #3
	ble _08016622
	movs r6, #0
	mov sb, r6
_08016678:
	ldr r0, [r4]
	mov r1, sb
	lsls r5, r1, #5
	adds r2, r0, r5
	ldrb r0, [r2, #0x1a]
	lsls r0, r0, #0x1e
	mov r8, r5
	cmp r0, #0
	beq _0801676C
	ldr r1, [r4, #4]
	adds r0, r2, #0
	bl sub_080171A8
	adds r6, r0, #0
	cmp r6, #0xff
	beq _08016712
	ldr r0, [r4]
	adds r2, r0, r5
	ldrb r1, [r2, #0x1a]
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _080166F0
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r6, r0, #2
	ldr r1, [r4, #4]
	adds r1, r1, r6
	adds r0, r2, #0
	bl sub_0801713C
	cmp r0, #0
	beq _080166D6
	ldr r1, [r4]
	ldr r0, [r4, #4]
	adds r1, r1, r5
	adds r0, r0, r6
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #0x40
	strb r1, [r0, #0x1b]
	movs r7, #1
	b _08016708
_080166D6:
	ldr r0, [r4]
	adds r1, r0, r5
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _08016708
	subs r0, #1
	strb r0, [r1, #0x1b]
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	bne _08016708
	b _08016706
_080166F0:
	movs r3, #4
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x1a]
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0, #0x1b]
_08016706:
	movs r7, #2
_08016708:
	ldr r0, [r4]
	add r0, r8
	movs r1, #0
	strh r1, [r0, #0x18]
	b _0801676C
_08016712:
	ldr r0, [r4]
	adds r1, r0, r5
	ldrb r0, [r1, #0x1a]
	lsls r2, r0, #0x1e
	lsrs r0, r2, #0x1e
	cmp r0, #2
	beq _0801674C
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	adds r2, r0, r5
	ldrh r1, [r2, #0x18]
	ldr r0, _08016748
	cmp r1, r0
	bls _0801676C
	ldrb r0, [r2, #0x1a]
	movs r5, #4
	rsbs r5, r5, #0
	adds r1, r5, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0x1a]
	movs r7, #2
	b _0801676C
	.align 2, 0
_08016748: .4byte 0x00000257
_0801674C:
	lsrs r0, r2, #0x1e
	cmp r0, #2
	bne _0801676C
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	adds r2, r0, r5
	ldrh r1, [r2, #0x18]
	ldr r0, _080167AC
	cmp r1, r0
	bls _0801676C
	adds r0, r2, #0
	movs r1, #1
	bl sub_08017044
_0801676C:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #7
	bhi _0801677C
	b _08016678
_0801677C:
	movs r5, #0
	movs r6, #3
_08016780:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	adds r1, r1, r5
	movs r2, #8
	bl sub_080171F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08016796
	movs r7, #1
_08016796:
	adds r5, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _08016780
	adds r0, r7, #0
_080167A0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080167AC: .4byte 0x00000383
	thumb_func_end sub_08016610

	thumb_func_start sub_080167B0
sub_080167B0: @ 0x080167B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r0, r0, #2
	add r0, sl
	lsls r0, r0, #3
	ldr r1, _080168A0
	adds r6, r0, r1
	movs r7, #0
	mov r0, sp
	adds r0, #0x10
	str r0, [sp, #0x18]
_080167D4:
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	mov r0, sp
	ldr r1, [sp, #0x18]
	bl sub_0800D948
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, sp
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	mov r2, sl
	lsls r1, r2, #2
	add r1, sl
	lsls r1, r1, #3
	ldr r3, _080168A4
	adds r1, r1, r3
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	bl sub_08013890
	cmp r0, #0
	bne _08016810
	mov r1, sp
	ldr r0, _080168A8
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
_08016810:
	mov r0, sp
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	beq _08016828
	mov r1, sp
	ldr r0, _080168A8
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
_08016828:
	cmp r4, #0
	bne _080168AC
	lsls r0, r7, #3
	mov r8, r0
	adds r1, r7, #1
	mov sb, r1
	cmp r7, #0
	ble _08016868
	movs r2, #0
	str r2, [sp, #0x1c]
	adds r4, r7, #0
_0801683E:
	ldr r0, [r6, #4]
	ldr r3, [sp, #0x1c]
	adds r0, r0, r3
	mov r1, sp
	bl sub_080170F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801685C
	mov r1, sp
	ldr r0, _080168A8
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
_0801685C:
	ldr r5, [sp, #0x1c]
	adds r5, #0x1c
	str r5, [sp, #0x1c]
	subs r4, #1
	cmp r4, #0
	bne _0801683E
_08016868:
	ldr r1, [r6, #4]
	mov r0, r8
	subs r4, r0, r7
	lsls r4, r4, #2
	adds r1, r1, r4
	mov r0, sp
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r6, #4]
	adds r0, r0, r4
	ldr r1, _080168A8
	bl sub_080170F4
	ldr r3, [r6, #4]
	adds r3, r3, r4
	movs r2, #1
	ands r2, r0
	ldrb r0, [r3, #0x18]
	movs r4, #2
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x18]
	b _080168E4
	.align 2, 0
_080168A0: .4byte 0x03005B68
_080168A4: .4byte 0x03005B60
_080168A8: .4byte 0x082C2364
_080168AC:
	ldr r1, [r6]
	lsls r4, r7, #3
	subs r4, r4, r7
	lsls r4, r4, #2
	adds r1, r1, r4
	mov r0, sp
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r6]
	adds r0, r0, r4
	ldr r1, _080168FC
	bl sub_080170F4
	ldr r3, [r6]
	adds r3, r3, r4
	movs r2, #1
	ands r2, r0
	ldrb r0, [r3, #0x18]
	movs r4, #2
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x18]
	adds r7, #1
	mov sb, r7
_080168E4:
	mov r7, sb
	cmp r7, #3
	bgt _080168EC
	b _080167D4
_080168EC:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080168FC: .4byte 0x082C2364
	thumb_func_end sub_080167B0

	thumb_func_start sub_08016900
sub_08016900: @ 0x08016900
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0801692C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r2, _08016930
	adds r3, r1, r2
	str r4, [r3]
	str r5, [r3, #4]
	adds r2, r2, r1
	strh r6, [r2, #8]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801692C: .4byte 0x080167B1
_08016930: .4byte 0x03005B68
	thumb_func_end sub_08016900

	thumb_func_start sub_08016934
sub_08016934: @ 0x08016934
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r0, r0, #2
	add r0, sl
	lsls r0, r0, #3
	ldr r1, _08016A20
	adds r6, r0, r1
	movs r3, #0
_08016952:
	lsls r4, r3, #3
	subs r0, r4, r3
	lsls r5, r0, #2
	ldr r0, [r6]
	adds r0, r0, r5
	adds r1, r0, #0
	adds r1, #0x10
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r3, [sp]
	bl sub_0800D948
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	mov r2, sl
	lsls r1, r2, #2
	add r1, sl
	lsls r1, r1, #3
	ldr r7, _08016A24
	adds r1, r1, r7
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	bl sub_08013890
	mov r8, r4
	ldr r3, [sp]
	cmp r0, #0
	bne _0801699E
	ldr r1, [r6]
	adds r1, r1, r5
	ldr r0, _08016A28
	ldm r0!, {r2, r4, r7}
	stm r1!, {r2, r4, r7}
	ldm r0!, {r2, r4, r7}
	stm r1!, {r2, r4, r7}
_0801699E:
	adds r4, r3, #1
	mov sb, r4
	cmp r3, #0
	ble _080169E2
	str r5, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	adds r4, r3, #0
_080169AE:
	ldr r1, [r6]
	ldr r7, [sp, #8]
	adds r0, r1, r7
	ldr r2, [sp, #4]
	adds r1, r1, r2
	str r3, [sp]
	bl sub_080170F4
	lsls r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, #0
	bne _080169D6
	ldr r1, [r6]
	ldr r5, [sp, #4]
	adds r1, r1, r5
	ldr r0, _08016A28
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
_080169D6:
	ldr r7, [sp, #8]
	adds r7, #0x1c
	str r7, [sp, #8]
	subs r4, #1
	cmp r4, #0
	bne _080169AE
_080169E2:
	mov r0, r8
	subs r4, r0, r3
	lsls r4, r4, #2
	ldr r0, [r6]
	adds r0, r0, r4
	ldr r1, _08016A28
	bl sub_080170F4
	ldr r3, [r6]
	adds r3, r3, r4
	movs r2, #1
	ands r2, r0
	ldrb r0, [r3, #0x18]
	movs r4, #2
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x18]
	mov r3, sb
	cmp r3, #3
	ble _08016952
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016A20: .4byte 0x03005B68
_08016A24: .4byte 0x03005B60
_08016A28: .4byte 0x082C2364
	thumb_func_end sub_08016934

	thumb_func_start sub_08016A2C
sub_08016A2C: @ 0x08016A2C
	push {lr}
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #7
	bne _08016A3C
	ldrb r1, [r0]
	movs r0, #0x20
	b _08016A44
_08016A3C:
	cmp r1, #8
	bne _08016A4E
	ldrb r1, [r0]
	movs r0, #0x10
_08016A44:
	ands r0, r1
	cmp r0, #0
	beq _08016A4E
	movs r0, #1
	b _08016A50
_08016A4E:
	movs r0, #0
_08016A50:
	pop {r1}
	bx r1
	thumb_func_end sub_08016A2C

	thumb_func_start sub_08016A54
sub_08016A54: @ 0x08016A54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08016AC8
	adds r4, r1, r0
	movs r6, #0
	subs r0, #8
	movs r5, #0
	adds r1, r1, r0
	mov r8, r1
_08016A72:
	ldr r0, [r4]
	adds r0, r0, r5
	adds r1, r0, #0
	adds r1, #0x10
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	bl sub_0800DA00
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016A96
	ldr r0, [r4]
	adds r0, r0, r5
	mov r2, r8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	bl sub_08016A2C
_08016A96:
	ldr r0, [r4]
	adds r0, r0, r5
	ldr r1, _08016ACC
	bl sub_080170F4
	ldr r3, [r4]
	adds r3, r3, r5
	movs r2, #1
	ands r2, r0
	ldrb r0, [r3, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x18]
	adds r5, #0x1c
	adds r6, #1
	cmp r6, #3
	ble _08016A72
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016AC8: .4byte 0x03005B68
_08016ACC: .4byte 0x082C2364
	thumb_func_end sub_08016A54

	thumb_func_start sub_08016AD0
sub_08016AD0: @ 0x08016AD0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08016AF8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	ldr r1, _08016AFC
	adds r3, r2, r1
	str r4, [r3]
	adds r1, r1, r2
	strh r5, [r1, #4]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08016AF8: .4byte 0x08016935
_08016AFC: .4byte 0x03005B68
	thumb_func_end sub_08016AD0

	thumb_func_start sub_08016B00
sub_08016B00: @ 0x08016B00
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08016B28
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	ldr r1, _08016B2C
	adds r3, r2, r1
	str r4, [r3]
	adds r1, r1, r2
	strh r5, [r1, #4]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08016B28: .4byte 0x08016A55
_08016B2C: .4byte 0x03005B68
	thumb_func_end sub_08016B00

	thumb_func_start sub_08016B30
sub_08016B30: @ 0x08016B30
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08196F98
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrame
	ldr r0, _08016B58
	adds r1, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterWithCustomSpeedForMessage
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016B58: .4byte 0x02021C7C
	thumb_func_end sub_08016B30

	thumb_func_start sub_08016B5C
sub_08016B5C: @ 0x08016B5C
	push {lr}
	bl RunTextPrintersAndIsPrinter0Active
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08016B6C
	movs r0, #0
	b _08016B6E
_08016B6C:
	movs r0, #1
_08016B6E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08016B5C

	thumb_func_start PrintOnTextbox
PrintOnTextbox: @ 0x08016B74
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08016B86
	cmp r0, #1
	beq _08016BAC
	b _08016BBE
_08016B86:
	bl sub_08196F98
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrame
	ldr r0, _08016BA8
	adds r1, r5, #0
	bl StringExpandPlaceholders
	movs r0, #1
	bl AddTextPrinterForMessage_2
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08016BBE
	.align 2, 0
_08016BA8: .4byte 0x02021C7C
_08016BAC:
	bl RunTextPrintersAndIsPrinter0Active
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08016BBE
	strb r0, [r4]
	movs r0, #1
	b _08016BC0
_08016BBE:
	movs r0, #0
_08016BC0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PrintOnTextbox

	thumb_func_start sub_08016BC8
sub_08016BC8: @ 0x08016BC8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08016BDA
	cmp r0, #1
	beq _08016BF0
	b _08016C1C
_08016BDA:
	cmp r5, #0
	beq _08016BE4
	movs r0, #3
	rsbs r0, r0, #0
	b _08016C20
_08016BE4:
	bl DisplayYesNoMenuDefaultYes
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08016C1C
_08016BF0:
	cmp r5, #0
	beq _08016C02
	bl sub_08198D88
	movs r0, #0
	strb r0, [r4]
	movs r0, #3
	rsbs r0, r0, #0
	b _08016C20
_08016C02:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08016C1C
	strb r5, [r4]
	adds r0, r1, #0
	b _08016C20
_08016C1C:
	movs r0, #2
	rsbs r0, r0, #0
_08016C20:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08016BC8

	thumb_func_start sub_08016C28
sub_08016C28: @ 0x08016C28
	push {r4, lr}
	sub sp, #8
	bl AddWindow
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl ClearStdWindowAndFrame
	adds r0, r4, #0
	movs r1, #0xff
	bl FillWindowPixelBuffer
	ldr r2, _08016C74
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #8
	bl sub_08016EA4
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016C74: .4byte 0x082C1D60
	thumb_func_end sub_08016C28

	thumb_func_start sub_08016C78
sub_08016C78: @ 0x08016C78
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl RemoveWindow
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08016C78

	thumb_func_start sub_08016C88
sub_08016C88: @ 0x08016C88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r5, r1, #0
	mov sb, r2
	adds r0, r3, #0
	ldrb r4, [r7]
	cmp r4, #0
	beq _08016CA4
	cmp r4, #1
	beq _08016CE4
	b _08016D4A
_08016CA4:
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldr r0, _08016CE0
	adds r2, r0, #0
	ldr r1, [sp, #0x1c]
	ldm r1!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	ldm r1!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	ldrb r1, [r5]
	strb r1, [r0, #0x10]
	movs r1, #0
	movs r2, #0
	bl ListMenuInit
	mov r1, sb
	strb r0, [r1]
	ldrb r0, [r5]
	movs r1, #1
	bl CopyWindowToVram
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	b _08016D4A
	.align 2, 0
_08016CE0: .4byte 0x03006050
_08016CE4:
	mov r3, sb
	ldrb r0, [r3]
	bl ListMenu_ProcessInput
	mov r8, r0
	ldr r0, _08016D1C
	ldrh r1, [r0, #0x2e]
	ands r4, r1
	cmp r4, #0
	beq _08016D20
	mov r4, sb
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r5]
	movs r1, #1
	bl DrawStdWindowFrame
	ldrb r0, [r5]
	bl RemoveWindow
	movs r0, #0
	strb r0, [r7]
	mov r0, r8
	b _08016D4E
	.align 2, 0
_08016D1C: .4byte 0x03002360
_08016D20:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016D4A
	mov r6, sb
	ldrb r0, [r6]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r5]
	movs r1, #1
	bl DrawStdWindowFrame
	ldrb r0, [r5]
	bl RemoveWindow
	strb r4, [r7]
	movs r0, #2
	rsbs r0, r0, #0
	b _08016D4E
_08016D4A:
	movs r0, #1
	rsbs r0, r0, #0
_08016D4E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08016C88

	thumb_func_start sub_08016D5C
sub_08016D5C: @ 0x08016D5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	mov sl, r2
	mov r8, r3
	ldrb r4, [r6]
	cmp r4, #1
	beq _08016DC8
	cmp r4, #1
	bgt _08016D7E
	cmp r4, #0
	beq _08016D84
	b _08016E60
_08016D7E:
	cmp r4, #2
	beq _08016DD8
	b _08016E60
_08016D84:
	ldr r0, _08016DC0
	bl sub_08016C28
	mov r1, r8
	strb r0, [r1]
	ldr r0, [sp, #0x20]
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldr r0, _08016DC4
	adds r2, r0, #0
	ldr r1, [sp, #0x24]
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	ldrb r1, [r5]
	strb r1, [r0, #0x10]
	movs r1, #0
	movs r2, #1
	bl ListMenuInit
	mov r1, sl
	strb r0, [r1]
	b _08016DD0
	.align 2, 0
_08016DC0: .4byte 0x082C224C
_08016DC4: .4byte 0x03006050
_08016DC8:
	ldrb r0, [r5]
	movs r1, #1
	bl CopyWindowToVram
_08016DD0:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _08016E60
_08016DD8:
	mov r3, sl
	ldrb r0, [r3]
	bl ListMenu_ProcessInput
	adds r1, r0, #0
	ldr r0, _08016E20
	ldrh r2, [r0, #0x2e]
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	beq _08016E60
	cmp r1, #8
	beq _08016DFA
	ands r4, r2
	mov sb, r4
	cmp r4, #0
	beq _08016E24
_08016DFA:
	mov r4, sl
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r5]
	bl RemoveWindow
	mov r7, r8
	ldrb r0, [r7]
	bl sub_08016C78
	movs r0, #0
	strb r0, [r6]
	movs r0, #2
	rsbs r0, r0, #0
	b _08016E64
	.align 2, 0
_08016E20: .4byte 0x03002360
_08016E24:
	ldr r0, [sp, #0x28]
	bl sub_08017770
	adds r4, r0, #0
	cmp r4, #0
	blt _08016E5A
	mov r1, sl
	ldrb r0, [r1]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r5]
	movs r1, #1
	bl DrawStdWindowFrame
	ldrb r0, [r5]
	bl RemoveWindow
	mov r3, r8
	ldrb r0, [r3]
	bl sub_08016C78
	mov r7, sb
	strb r7, [r6]
	adds r0, r4, #0
	b _08016E64
_08016E5A:
	movs r0, #7
	bl PlaySE
_08016E60:
	movs r0, #1
	rsbs r0, r0, #0
_08016E64:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08016D5C

	thumb_func_start sub_08016E74
sub_08016E74: @ 0x08016E74
	push {lr}
	sub sp, #0xc
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r0}
	bx r0
	thumb_func_end sub_08016E74

	thumb_func_start sub_08016E98
sub_08016E98: @ 0x08016E98
	push {lr}
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08016E98

	thumb_func_start sub_08016EA4
sub_08016EA4: @ 0x08016EA4
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r5, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r2, [sp]
	mov r2, sp
	strb r0, [r2, #4]
	mov r0, sp
	strb r1, [r0, #5]
	strb r3, [r0, #6]
	strb r5, [r0, #7]
	strb r3, [r0, #8]
	strb r5, [r0, #9]
	ldrb r1, [r2, #0xc]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xc]
	ldr r2, _08016EF0
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	cmp r4, #6
	bls _08016EE6
	b _08017032
_08016EE6:
	lsls r0, r4, #2
	ldr r1, _08016EF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016EF0: .4byte 0x030030B4
_08016EF4: .4byte 0x08016EF8
_08016EF8: @ jump table
	.4byte _08016F14 @ case 0
	.4byte _08016F40 @ case 1
	.4byte _08016F6C @ case 2
	.4byte _08016F98 @ case 3
	.4byte _08016FC4 @ case 4
	.4byte _08016FF0 @ case 5
	.4byte _08017008 @ case 6
_08016F14:
	mov r0, sp
	movs r1, #0
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	mov r2, sp
	ldrb r1, [r2, #0xc]
	movs r3, #0xf
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldrb r1, [r2, #0xd]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0xd]
	ands r0, r3
	movs r1, #0x30
	b _0801702E
_08016F40:
	mov r0, sp
	movs r1, #0
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	mov r2, sp
	ldrb r1, [r2, #0xc]
	movs r3, #0xf
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldrb r1, [r2, #0xd]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0xd]
	ands r0, r3
	movs r1, #0x50
	b _0801702E
_08016F6C:
	mov r0, sp
	movs r1, #0
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	mov r2, sp
	ldrb r1, [r2, #0xc]
	movs r3, #0xf
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x60
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldrb r1, [r2, #0xd]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0xd]
	ands r0, r3
	movs r1, #0x70
	b _0801702E
_08016F98:
	mov r0, sp
	movs r1, #0
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	mov r2, sp
	ldrb r1, [r2, #0xc]
	movs r3, #0xf
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldrb r1, [r2, #0xd]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0xd]
	ands r0, r3
	movs r1, #0x30
	b _0801702E
_08016FC4:
	mov r0, sp
	movs r1, #0
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	mov r2, sp
	ldrb r1, [r2, #0xc]
	movs r3, #0xf
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldrb r1, [r2, #0xd]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0xd]
	ands r0, r3
	movs r1, #0x30
	b _0801702E
_08016FF0:
	mov r0, sp
	movs r1, #0
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	mov r2, sp
	ldrb r1, [r2, #0xc]
	movs r4, #0xf
	movs r3, #0xf
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x70
	b _0801701E
_08017008:
	mov r0, sp
	movs r1, #0
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	mov r2, sp
	ldrb r1, [r2, #0xc]
	movs r4, #0xf
	movs r3, #0xf
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0xe0
_0801701E:
	orrs r0, r1
	strb r0, [r2, #0xc]
	mov r1, sp
	ldrb r0, [r1, #0xd]
	orrs r0, r4
	strb r0, [r1, #0xd]
	ands r0, r3
	movs r1, #0x90
_0801702E:
	orrs r0, r1
	strb r0, [r2, #0xd]
_08017032:
	mov r0, sp
	movs r1, #0xff
	movs r2, #0
	bl AddTextPrinter
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08016EA4

	thumb_func_start sub_08017044
sub_08017044: @ 0x08017044
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0
	beq _0801709C
	ldr r2, _080170AC
	mov r8, r2
	movs r5, #0
	mov sb, r5
	movs r6, #4
	rsbs r6, r6, #0
	mov ip, r6
	adds r2, r0, #0
	adds r2, #0x18
	adds r4, r0, #0
	movs r7, #0xff
	mov sl, r7
	adds r3, r1, #0
_08017070:
	adds r1, r4, #0
	mov r0, r8
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	mov r0, sl
	strh r0, [r2]
	ldrb r1, [r2, #2]
	mov r0, ip
	ands r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #2]
	mov r5, sb
	strb r5, [r2, #3]
	adds r2, #0x20
	adds r4, #0x20
	subs r3, #1
	cmp r3, #0
	bne _08017070
_0801709C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080170AC: .4byte 0x082C2364
	thumb_func_end sub_08017044

	thumb_func_start sub_080170B0
sub_080170B0: @ 0x080170B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _080170F0
	mov ip, r1
	movs r5, #2
	rsbs r5, r5, #0
	mov r8, r5
	adds r2, r0, #0
	adds r2, #0x18
	adds r3, r0, #0
	movs r4, #3
_080170C8:
	adds r1, r3, #0
	mov r0, ip
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	strb r0, [r2]
	adds r2, #0x1c
	adds r3, #0x1c
	subs r4, #1
	cmp r4, #0
	bge _080170C8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080170F0: .4byte 0x082C2364
	thumb_func_end sub_080170B0

	thumb_func_start sub_080170F4
sub_080170F4: @ 0x080170F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r2, #0
	adds r4, r5, #2
	adds r3, r6, #2
_08017100:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08017128
	adds r2, #1
	cmp r2, #1
	ble _08017100
	movs r2, #0
	adds r4, r5, #0
	adds r4, #0x10
	adds r3, r6, #0
	adds r3, #0x10
_0801711C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0801712C
_08017128:
	movs r0, #1
	b _08017134
_0801712C:
	adds r2, #1
	cmp r2, #7
	ble _0801711C
	movs r0, #0
_08017134:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080170F4

	thumb_func_start sub_0801713C
sub_0801713C: @ 0x0801713C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r3, [r5, #0xa]
	movs r0, #0x7f
	ldrb r2, [r6, #0xa]
	adds r1, r0, #0
	ands r1, r3
	ands r0, r2
	cmp r1, r0
	bne _080171A0
	movs r0, #0x80
	adds r1, r0, #0
	ands r1, r3
	ands r0, r2
	cmp r1, r0
	bne _080171A0
	movs r2, #0
	adds r4, r5, #4
	adds r3, r6, #4
_08017164:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080171A0
	adds r2, #1
	cmp r2, #3
	ble _08017164
	ldrh r2, [r5, #8]
	ldr r0, _0801719C
	ldrh r3, [r6, #8]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _080171A0
	ldrb r2, [r5, #9]
	movs r0, #0xfc
	ldrb r3, [r6, #9]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _080171A0
	movs r0, #0
	b _080171A2
	.align 2, 0
_0801719C: .4byte 0x000003FF
_080171A0:
	movs r0, #1
_080171A2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0801713C

	thumb_func_start sub_080171A8
sub_080171A8: @ 0x080171A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0xff
	movs r6, #0
	adds r4, r1, #0
	adds r4, #0x18
	adds r5, r1, #0
_080171BA:
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080171E2
	mov r0, r8
	adds r1, r5, #0
	bl sub_080170F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080171E2
	lsls r0, r6, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r4]
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	strb r0, [r4]
_080171E2:
	adds r4, #0x1c
	adds r5, #0x1c
	adds r6, #1
	cmp r6, #3
	ble _080171BA
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080171A8

	thumb_func_start sub_080171F8
sub_080171F8: @ 0x080171F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r3, r0, #0
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldrb r1, [r1, #0x18]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801726C
	movs r5, #0
	cmp r5, r6
	bge _0801726C
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #2
	rsbs r1, r1, #0
	mov ip, r1
	adds r2, r3, #0
	adds r2, #0x18
	adds r1, r3, #0
_0801722A:
	ldrb r0, [r2, #2]
	movs r3, #3
	ands r3, r0
	cmp r3, #0
	bne _08017262
	mov r0, r8
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	strh r3, [r2]
	ldrb r1, [r2, #2]
	mov r0, sb
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #2]
	movs r0, #0x40
	strb r0, [r2, #3]
	mov r0, r8
	ldrb r1, [r0, #0x18]
	mov r0, ip
	ands r0, r1
	mov r1, r8
	strb r0, [r1, #0x18]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	b _0801726E
_08017262:
	adds r2, #0x20
	adds r1, #0x20
	adds r5, #1
	cmp r5, r6
	blt _0801722A
_0801726C:
	movs r0, #0xff
_0801726E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080171F8

	thumb_func_start sub_0801727C
sub_0801727C: @ 0x0801727C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r3, #0
	ldr r3, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r6, _08017354
	adds r1, #1
	adds r0, r6, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r1, _08017358
	adds r0, r6, #0
	bl StringAppend
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	mov r0, r8
	movs r1, #1
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08016EA4
	adds r4, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r5, #0xa]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x19
	ldrb r1, [r5, #0x1a]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _08017344
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	bne _08017344
	adds r1, r5, #0
	adds r1, #0x10
	adds r0, r6, #0
	movs r2, #5
	bl StringCopyN_Multibyte
	str r7, [sp]
	mov r0, sb
	str r0, [sp, #4]
	mov r0, r8
	movs r1, #2
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08016EA4
	ldrb r1, [r5, #2]
	ldrb r0, [r5, #3]
	lsls r0, r0, #8
	orrs r1, r0
	add r0, sp, #8
	movs r2, #2
	movs r3, #5
	bl ConvertIntToDecimalStringN
	ldr r1, _0801735C
	adds r0, r6, #0
	bl StringCopy
	adds r0, r6, #0
	add r1, sp, #8
	bl StringAppend
	adds r3, r4, #0
	adds r3, #0x38
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r7, [sp]
	mov r0, sb
	str r0, [sp, #4]
	mov r0, r8
	movs r1, #1
	adds r2, r6, #0
	bl sub_08016EA4
_08017344:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017354: .4byte 0x02021C7C
_08017358: .4byte 0x082C0644
_0801735C: .4byte 0x082C0648
	thumb_func_end sub_0801727C

	thumb_func_start sub_08017360
sub_08017360: @ 0x08017360
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r5, r3, #0
	ldr r3, [sp, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	ldrb r1, [r5, #0x1a]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _080173E6
	ldr r4, _080173F4
	adds r1, r5, #0
	adds r1, #0x10
	adds r0, r4, #0
	movs r2, #5
	bl StringCopyN_Multibyte
	mov r0, r8
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, sb
	movs r1, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl sub_08016EA4
	ldrb r1, [r5, #2]
	ldrb r0, [r5, #3]
	lsls r0, r0, #8
	orrs r1, r0
	add r0, sp, #8
	movs r2, #2
	movs r3, #5
	bl ConvertIntToDecimalStringN
	ldr r1, _080173F8
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	add r1, sp, #8
	bl StringAppend
	adds r3, r6, #0
	adds r3, #0x38
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, r8
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, sb
	movs r1, #1
	adds r2, r4, #0
	bl sub_08016EA4
_080173E6:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080173F4: .4byte 0x02021C7C
_080173F8: .4byte 0x082C0648
	thumb_func_end sub_08017360

	thumb_func_start sub_080173FC
sub_080173FC: @ 0x080173FC
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
	cmp r0, #9
	bne _08017434
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #8
	bne _08017434
	ldr r0, _08017430
	ldrb r0, [r0, #3]
	cmp r0, #2
	beq _0801742A
	cmp r0, #0
	bne _08017434
_0801742A:
	movs r0, #1
	b _08017436
	.align 2, 0
_08017430: .4byte 0x02037230
_08017434:
	movs r0, #0
_08017436:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080173FC

	thumb_func_start sub_08017440
sub_08017440: @ 0x08017440
	push {lr}
	cmp r0, #4
	beq _08017458
	cmp r0, #4
	ble _08017460
	cmp r0, #5
	beq _08017454
	cmp r0, #8
	beq _0801745C
	b _08017460
_08017454:
	movs r0, #1
	b _08017462
_08017458:
	movs r0, #2
	b _08017462
_0801745C:
	movs r0, #3
	b _08017462
_08017460:
	movs r0, #0
_08017462:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08017440

	thumb_func_start sub_08017468
sub_08017468: @ 0x08017468
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #2
	bl ReadAsU16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, #0x10
	adds r1, r4, #0
	bl sub_0800E004
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08017468

	thumb_func_start sub_08017484
sub_08017484: @ 0x08017484
	push {r4, r5, r6, lr}
	adds r6, r3, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x13
	adds r5, r0, r2
	ldrb r1, [r5, #0xa]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08017500
	cmp r4, #0
	bne _08017500
	ldr r4, _080174E0
	adds r1, r5, #0
	adds r1, #0x10
	adds r0, r4, #0
	bl StringCopy
	adds r0, r5, #2
	bl ReadAsU16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_0800E004
	adds r2, r0, #0
	ldrb r1, [r5, #0xa]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x45
	bne _080174EC
	ldr r0, _080174E4
	ldr r3, _080174E8
	lsls r1, r6, #2
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r1, [r1]
	bl StringExpandPlaceholders
	movs r0, #2
	b _080175DE
	.align 2, 0
_080174E0: .4byte 0x02021C40
_080174E4: .4byte 0x02021C7C
_080174E8: .4byte 0x082C0FD0
_080174EC:
	ldr r0, _080174FC
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_08016B30
	movs r0, #1
	b _080175DE
	.align 2, 0
_080174FC: .4byte 0x082C0CD8
_08017500:
	ldr r0, _08017530
	adds r1, r5, #0
	adds r1, #0x10
	bl StringCopy
	cmp r4, #0
	beq _08017518
	adds r0, r5, r4
	ldrb r0, [r0, #3]
	lsrs r6, r0, #3
	movs r0, #1
	ands r6, r0
_08017518:
	ldrb r0, [r5, #0xa]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	movs r1, #0x3f
	ands r1, r0
	cmp r1, #4
	beq _08017564
	cmp r1, #4
	bgt _08017534
	cmp r1, #1
	beq _0801753E
	b _080175D4
	.align 2, 0
_08017530: .4byte 0x02021C40
_08017534:
	cmp r1, #5
	beq _08017584
	cmp r1, #8
	beq _080175A8
	b _080175D4
_0801753E:
	ldr r5, _0801755C
	ldr r4, _08017560
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsrs r1, r1, #0xe
	lsls r0, r6, #4
	adds r1, r1, r0
	adds r1, r1, r4
	ldr r1, [r1]
	b _080175C2
	.align 2, 0
_0801755C: .4byte 0x02021C7C
_08017560: .4byte 0x082C1498
_08017564:
	ldr r5, _0801757C
	ldr r4, _08017580
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	lsls r1, r6, #4
	b _080175BC
	.align 2, 0
_0801757C: .4byte 0x02021C7C
_08017580: .4byte 0x082C1668
_08017584:
	ldr r5, _080175A0
	ldr r4, _080175A4
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsrs r1, r1, #0xe
	lsls r0, r6, #4
	adds r1, r1, r0
	adds r1, r1, r4
	ldr r1, [r1]
	b _080175C2
	.align 2, 0
_080175A0: .4byte 0x02021C7C
_080175A4: .4byte 0x082C1564
_080175A8:
	ldr r5, _080175CC
	ldr r4, _080175D0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	lsls r1, r6, #3
_080175BC:
	adds r0, r0, r1
	adds r0, r0, r4
	ldr r1, [r0]
_080175C2:
	adds r0, r5, #0
	bl StringExpandPlaceholders
	b _080175DC
	.align 2, 0
_080175CC: .4byte 0x02021C7C
_080175D0: .4byte 0x082C15E8
_080175D4:
	ldr r0, _080175E4
	ldr r1, _080175E8
	bl StringExpandPlaceholders
_080175DC:
	movs r0, #0
_080175DE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080175E4: .4byte 0x02021C7C
_080175E8: .4byte 0x082C0FE0
	thumb_func_end sub_08017484

	thumb_func_start nullsub_89
nullsub_89: @ 0x080175EC
	bx lr
	.align 2, 0
	thumb_func_end nullsub_89

	thumb_func_start sub_080175F0
sub_080175F0: @ 0x080175F0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r4, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	ldrh r0, [r2, #8]
	lsls r0, r0, #0x16
	lsrs r4, r0, #0x16
	ldrb r0, [r2, #9]
	lsrs r0, r0, #2
	mov r8, r0
	ldrb r0, [r2, #0xb]
	lsrs r0, r0, #1
	mov sb, r0
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	adds r2, r3, #0
	movs r3, #0xa
	bl sub_08016EA4
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	bne _08017648
	ldr r2, _08017644
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	movs r3, #0x46
	bl sub_08016EA4
	b _0801769E
	.align 2, 0
_08017644: .4byte 0x082C19AC
_08017648:
	mov r1, r8
	adds r1, #1
	adds r0, r6, #0
	movs r2, #0x46
	adds r3, r5, #0
	bl blit_move_info_icon
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #1
	ldr r0, _080176AC
	adds r2, r2, r0
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	movs r3, #0x78
	bl sub_08016EA4
	add r0, sp, #8
	mov r1, sb
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	movs r0, #1
	add r1, sp, #8
	movs r2, #0
	bl GetStringWidth
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0xdc
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	add r2, sp, #8
	bl sub_08016EA4
_0801769E:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080176AC: .4byte 0x082EA31C
	thumb_func_end sub_080175F0

	thumb_func_start sub_080176B0
sub_080176B0: @ 0x080176B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	ldr r0, _08017700
	ldr r0, [r0]
	mov r8, r0
	movs r0, #3
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0801772C
	cmp r2, #1
	bne _0801772C
	bl sub_0800F29C
	adds r2, r0, #0
	ldrh r1, [r2, #8]
	ldr r0, _08017704
	ands r0, r1
	cmp r0, #0
	beq _08017760
	ldr r0, _08017708
	ldr r3, [r0]
	movs r0, #5
	str r0, [sp]
	mov r0, sl
	movs r1, #1
	bl sub_080175F0
	b _08017760
	.align 2, 0
_08017700: .4byte 0x020228E4
_08017704: .4byte 0x000003FF
_08017708: .4byte 0x03005AF0
_0801770C:
	adds r1, r7, r4
	adds r1, #0x10
	add r0, sp, #4
	bl StringCopy
	mov r0, r8
	ldr r2, [r0]
	adds r2, r2, r4
	movs r0, #6
	str r0, [sp]
	mov r0, sl
	mov r1, sb
	add r3, sp, #4
	bl sub_080175F0
	b _08017760
_0801772C:
	movs r5, #0
	movs r1, #0
	mov r0, r8
	ldr r7, [r0]
	adds r2, r7, #0
	adds r2, #8
	movs r3, #0
	adds r6, r4, #1
_0801773C:
	ldrb r0, [r2, #0x12]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	adds r4, r3, #0
	cmp r0, #1
	bne _08017752
	ldrh r0, [r2]
	lsls r0, r0, #0x16
	cmp r0, #0
	beq _08017752
	adds r5, #1
_08017752:
	cmp r5, r6
	beq _0801770C
	adds r2, #0x20
	adds r3, #0x20
	adds r1, #1
	cmp r1, #7
	ble _0801773C
_08017760:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080176B0

	thumb_func_start sub_08017770
sub_08017770: @ 0x08017770
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	movs r3, #0
	movs r7, #3
	ldr r6, _080177A0
	adds r2, r0, #0
	adds r2, #8
	adds r5, r1, #1
_08017780:
	ldrb r1, [r2, #0x12]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #1
	bne _08017796
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08017796
	adds r4, #1
_08017796:
	cmp r4, r5
	bne _080177A4
	adds r0, r3, #0
	b _080177B0
	.align 2, 0
_080177A0: .4byte 0x000003FF
_080177A4:
	adds r2, #0x20
	adds r3, #1
	cmp r3, #7
	ble _08017780
	movs r0, #1
	rsbs r0, r0, #0
_080177B0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08017770

	thumb_func_start sub_080177B8
sub_080177B8: @ 0x080177B8
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	thumb_func_end sub_080177B8

	thumb_func_start sub_080177C4
sub_080177C4: @ 0x080177C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	bne _08017804
	movs r4, #0
	b _080177EE
_080177D4:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _080177FC
	adds r0, r0, r1
	movs r1, #0x41
	bl GetMonData
	adds r1, r0, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	beq _08017834
	adds r4, #1
_080177EE:
	ldr r0, _08017800
	ldrb r0, [r0]
	cmp r4, r0
	blt _080177D4
	movs r0, #2
	b _08017850
	.align 2, 0
_080177FC: .4byte 0x02024190
_08017800: .4byte 0x0202418D
_08017804:
	movs r4, #0
	ldr r0, _08017838
	ldrb r0, [r0]
	cmp r4, r0
	bge _0801784E
	ldr r6, _0801783C
_08017810:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _08017840
	adds r0, r0, r1
	movs r1, #0x41
	bl GetMonData
	adds r1, r0, #0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r6
	ldrb r0, [r1, #6]
	cmp r0, r5
	beq _08017834
	ldrb r0, [r1, #7]
	cmp r0, r5
	bne _08017844
_08017834:
	movs r0, #0
	b _08017850
	.align 2, 0
_08017838: .4byte 0x0202418D
_0801783C: .4byte 0x082F0D54
_08017840: .4byte 0x02024190
_08017844:
	adds r4, #1
	ldr r0, _08017858
	ldrb r0, [r0]
	cmp r4, r0
	blt _08017810
_0801784E:
	movs r0, #1
_08017850:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08017858: .4byte 0x0202418D
	thumb_func_end sub_080177C4

	thumb_func_start sub_0801785C
sub_0801785C: @ 0x0801785C
	push {lr}
	adds r3, r0, #0
	cmp r1, #0x44
	beq _08017898
	cmp r1, #0x44
	bgt _0801786E
	cmp r1, #0x41
	beq _08017878
	b _080178B6
_0801786E:
	cmp r1, #0x45
	beq _08017888
	cmp r1, #0x48
	beq _080178A8
	b _080178B6
_08017878:
	ldr r0, _08017884
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	b _0801789A
	.align 2, 0
_08017884: .4byte 0x082C1224
_08017888:
	ldr r0, _08017894
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	b _0801789A
	.align 2, 0
_08017894: .4byte 0x082C13C4
_08017898:
	ldr r1, _080178A4
_0801789A:
	adds r0, r3, #0
	bl StringExpandPlaceholders
	b _080178B6
	.align 2, 0
_080178A4: .4byte 0x082C1998
_080178A8:
	ldr r0, _080178BC
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r3, #0
	bl StringExpandPlaceholders
_080178B6:
	pop {r0}
	bx r0
	.align 2, 0
_080178BC: .4byte 0x082C127C
	thumb_func_end sub_0801785C

	thumb_func_start sub_080178C0
sub_080178C0: @ 0x080178C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r6, r4, #0
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _080178F4
	movs r0, #1
	adds r1, r3, #0
	eors r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x13]
	cmp r4, #0x44
	beq _08017914
	cmp r4, #0x44
	bgt _080178F8
	cmp r4, #0x41
	beq _080178FE
	b _08017954
	.align 2, 0
_080178F4: .4byte 0x020226A0
_080178F8:
	cmp r6, #0x45
	beq _08017938
	b _08017954
_080178FE:
	ldr r2, _08017910
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08017926
	.align 2, 0
_08017910: .4byte 0x082C1188
_08017914:
	ldr r2, _08017934
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r2, #8
_08017926:
	adds r1, r1, r2
	ldr r1, [r1]
	adds r0, r5, #0
	bl StringCopy
	b _08017954
	.align 2, 0
_08017934: .4byte 0x082C1188
_08017938:
	ldr r2, _0801795C
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r0, r5, #0
	bl StringCopy
_08017954:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801795C: .4byte 0x082C1188
	thumb_func_end sub_080178C0

	thumb_func_start sub_08017960
sub_08017960: @ 0x08017960
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r2, #0
	mov r8, r2
	ldrh r0, [r6]
	subs r0, #0x40
	cmp r0, #8
	bls _0801797A
	b _08017A82
_0801797A:
	lsls r0, r0, #2
	ldr r1, _08017984
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017984: .4byte 0x08017988
_08017988: @ jump table
	.4byte _08017A78 @ case 0
	.4byte _080179AC @ case 1
	.4byte _08017A82 @ case 2
	.4byte _08017A82 @ case 3
	.4byte _080179E8 @ case 4
	.4byte _080179B4 @ case 5
	.4byte _08017A82 @ case 6
	.4byte _08017A82 @ case 7
	.4byte _08017A68 @ case 8
_080179AC:
	ldr r1, _080179B0
	b _08017A6A
	.align 2, 0
_080179B0: .4byte 0x082C0E1C
_080179B4:
	ldr r1, _080179B8
	b _08017A6A
	.align 2, 0
_080179B8: .4byte 0x082C0E40
_080179BC:
	adds r0, r5, #0
	adds r0, #0x6c
	ldrh r1, [r6, #4]
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r5, #0
	adds r0, #0x76
	ldrh r2, [r6, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080179E4
	adds r1, r1, r2
	bl StringCopy
	ldrh r6, [r6, #2]
	mov r8, r6
	b _08017A20
	.align 2, 0
_080179E4: .4byte 0x082EA31C
_080179E8:
	adds r0, r5, #0
	adds r0, #0x58
	ldr r4, _08017A34
	ldrh r1, [r4, #0xc]
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r5, #0
	adds r0, #0x62
	ldrh r2, [r4, #0xa]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _08017A38
	adds r1, r1, r2
	bl StringCopy
	movs r4, #0
	ldr r0, _08017A3C
	ldr r1, [r0]
_08017A12:
	ldrh r0, [r1, #0x18]
	cmp r0, #2
	beq _080179BC
	adds r1, #0x20
	adds r4, #1
	cmp r4, #3
	ble _08017A12
_08017A20:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r8, r0
	bne _08017A44
	ldr r1, _08017A40
	adds r0, r7, #0
	bl StringCopy
	b _08017A70
	.align 2, 0
_08017A34: .4byte 0x020228F4
_08017A38: .4byte 0x082EA31C
_08017A3C: .4byte 0x03007630
_08017A40: .4byte 0x082C0EA8
_08017A44:
	movs r4, #0
	adds r5, #0x58
_08017A48:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	adds r5, #0xa
	adds r4, #1
	cmp r4, #3
	ble _08017A48
	ldr r1, _08017A64
	adds r0, r7, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _08017A70
	.align 2, 0
_08017A64: .4byte 0x082C0E68
_08017A68:
	ldr r1, _08017A74
_08017A6A:
	adds r0, r7, #0
	bl StringExpandPlaceholders
_08017A70:
	movs r2, #1
	b _08017A82
	.align 2, 0
_08017A74: .4byte 0x082C0DEC
_08017A78:
	ldr r1, _08017A90
	adds r0, r7, #0
	bl StringExpandPlaceholders
	movs r2, #2
_08017A82:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017A90: .4byte 0x082C0ED4
	thumb_func_end sub_08017960

	thumb_func_start sub_08017A94
sub_08017A94: @ 0x08017A94
	push {lr}
	adds r2, r0, #0
	ldr r0, _08017AB4
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _08017AB8
	cmp r1, #0x51
	beq _08017AA8
	cmp r1, #0x52
	bne _08017AB8
_08017AA8:
	adds r0, r2, #0
	adds r0, #0x80
	strh r1, [r0]
	movs r0, #1
	b _08017ABA
	.align 2, 0
_08017AB4: .4byte 0x03003130
_08017AB8:
	movs r0, #0
_08017ABA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08017A94

	thumb_func_start InUnionRoom
InUnionRoom: @ 0x08017AC0
	push {lr}
	movs r2, #0
	ldr r0, _08017AD8
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _08017ADC
	cmp r1, r0
	bne _08017AD2
	movs r2, #1
_08017AD2:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08017AD8: .4byte 0x03005AEC
_08017ADC: .4byte 0x00003C19
	thumb_func_end InUnionRoom

	thumb_func_start sub_08017AE0
sub_08017AE0: @ 0x08017AE0
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0
	ldr r0, _08017B28
	ldrb r0, [r0]
	cmp r6, r0
	bge _08017B20
_08017AEE:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08017B2C
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	cmp r0, #0x1e
	bhi _08017B16
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _08017B16
	adds r6, #1
_08017B16:
	adds r5, #1
	ldr r0, _08017B28
	ldrb r0, [r0]
	cmp r5, r0
	blt _08017AEE
_08017B20:
	cmp r6, #1
	bgt _08017B30
	movs r0, #0
	b _08017B32
	.align 2, 0
_08017B28: .4byte 0x0202418D
_08017B2C: .4byte 0x02024190
_08017B30:
	movs r0, #1
_08017B32:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08017AE0

	thumb_func_start sub_08017B38
sub_08017B38: @ 0x08017B38
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	str r1, [r0, #4]
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	strh r1, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_08017B38

	thumb_func_start sub_08017B4C
sub_08017B4C: @ 0x08017B4C
	push {lr}
	ldr r0, _08017B58
	bl sub_08017B38
	pop {r0}
	bx r0
	.align 2, 0
_08017B58: .4byte 0x020228F4
	thumb_func_end sub_08017B4C

	thumb_func_start sub_08017B5C
sub_08017B5C: @ 0x08017B5C
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	ldr r0, _08017B98
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	strh r0, [r5, #0xa]
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	strh r0, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	beq _08017B9C
	movs r0, #0
	b _08017B9E
	.align 2, 0
_08017B98: .4byte 0x02024190
_08017B9C:
	movs r0, #1
_08017B9E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08017B5C

	thumb_func_start sub_08017BA4
sub_08017BA4: @ 0x08017BA4
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	ldr r0, _08017BD8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	strh r0, [r5, #0xe]
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	strh r0, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [r5, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08017BD8: .4byte 0x02024190
	thumb_func_end sub_08017BA4

	thumb_func_start sub_08017BDC
sub_08017BDC: @ 0x08017BDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r1, r1, #0x18
	movs r2, #0
	mov r8, r2
	cmp r1, #0
	bne _08017BFA
	ldrh r7, [r0, #0xa]
	ldr r6, [r0, #4]
	b _08017BFE
_08017BF2:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	b _08017C32
_08017BFA:
	ldrh r7, [r0, #0xe]
	ldr r6, [r0, #0x14]
_08017BFE:
	movs r5, #0
	b _08017C2A
_08017C02:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08017C40
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	cmp r0, r6
	bne _08017C28
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r7
	beq _08017BF2
_08017C28:
	adds r5, #1
_08017C2A:
	ldr r0, _08017C44
	ldrb r0, [r0]
	cmp r5, r0
	blt _08017C02
_08017C32:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017C40: .4byte 0x02024190
_08017C44: .4byte 0x0202418D
	thumb_func_end sub_08017BDC

	thumb_func_start sub_08017C48
sub_08017C48: @ 0x08017C48
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08016E74
	bl ScriptContext2_Disable
	bl sub_08097EAC
	ldr r1, _08017C80
	movs r0, #0
	strb r0, [r1]
	cmp r4, #0
	beq _08017C78
	ldr r2, _08017C84
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #0xa]
	ldrh r2, [r2, #0xc]
	bl sub_08010ABC
	movs r0, #0x40
	movs r1, #0
	movs r2, #0
	bl sub_08010B80
_08017C78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017C80: .4byte 0x020228E0
_08017C84: .4byte 0x020228F4
	thumb_func_end sub_08017C48

	thumb_func_start sub_08017C88
sub_08017C88: @ 0x08017C88
	push {lr}
	bl ScriptContext2_Enable
	bl ScriptFreezeEventObjects
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08017C88

	thumb_func_start sub_08017C98
sub_08017C98: @ 0x08017C98
	push {r4, lr}
	movs r3, #0x80
	movs r2, #0
	ldr r4, [r0, #0xc]
_08017CA0:
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrb r0, [r1, #0x18]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08017CC8
	ldrb r0, [r1, #0xb]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	orrs r3, r0
	ldrb r1, [r1, #2]
	movs r0, #7
	ands r0, r1
	orrs r3, r0
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	b _08017CD2
_08017CC8:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _08017CA0
_08017CD2:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08017C98

	thumb_func_start sub_08017CDC
sub_08017CDC: @ 0x08017CDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r1, r0, r1
	ldr r0, _08017E68
	adds r1, r1, r0
	mov r8, r1
	bl DynamicPlaceholderTextUtil_Reset
	mov r7, sb
	adds r7, #0xa8
	bl sub_080686F0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xb
	muls r1, r0, r1
	ldr r0, _08017E6C
	adds r1, r1, r0
	adds r0, r7, #0
	bl StringCopy
	movs r0, #0
	adds r1, r7, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r1, r8
	adds r1, #0x30
	movs r0, #1
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r6, sb
	adds r6, #0xb7
	ldr r1, _08017E70
	mov r2, r8
	ldrb r0, [r2, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl StringCopy
	movs r0, #2
	adds r1, r6, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r5, sb
	adds r5, #0xc6
	mov r0, r8
	ldrh r1, [r0, #0xc]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	movs r0, #3
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r2, #0xd5
	add r2, sb
	mov sl, r2
	mov r0, r8
	ldrh r1, [r0, #0x10]
	mov r0, sl
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	mov r4, sb
	adds r4, #0xe4
	mov r2, r8
	ldrh r1, [r2, #0x12]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r0, #4
	mov r1, sl
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #5
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r4, #0xae
	lsls r4, r4, #1
	add r4, sb
	ldr r1, _08017E74
	adds r0, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r0, _08017E78
	adds r1, r4, #0
	bl StringCopy
	mov r0, r8
	ldrh r1, [r0, #0x14]
	ldr r4, _08017E7C
	cmp r1, r4
	ble _08017DC6
	adds r1, r4, #0
_08017DC6:
	adds r0, r7, #0
	movs r2, #0
	movs r3, #4
	bl ConvertIntToDecimalStringN
	movs r0, #0
	adds r1, r7, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r2, r8
	ldrh r1, [r2, #0x16]
	cmp r1, r4
	ble _08017DE2
	adds r1, r4, #0
_08017DE2:
	adds r0, r6, #0
	movs r2, #0
	movs r3, #4
	bl ConvertIntToDecimalStringN
	movs r0, #2
	adds r1, r6, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r0, r8
	ldrh r1, [r0, #0x20]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #5
	bl ConvertIntToDecimalStringN
	movs r0, #3
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r7, #0
	movs r6, #0x80
	lsls r6, r6, #0x13
	mov r5, r8
	adds r5, #0x28
	mov r4, sl
_08017E16:
	ldrh r1, [r5]
	adds r0, r4, #0
	bl CopyEasyChatWord
	lsrs r0, r6, #0x18
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r6, r6, r2
	adds r5, #2
	adds r4, #0xf
	adds r7, #1
	cmp r7, #3
	ble _08017E16
	movs r4, #0xae
	lsls r4, r4, #1
	add r4, sb
	ldr r1, _08017E80
	adds r0, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r5, _08017E78
	adds r0, r5, #0
	adds r1, r4, #0
	bl StringAppend
	ldr r0, [sp]
	cmp r0, #1
	bne _08017E88
	ldr r1, _08017E84
	adds r0, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	adds r0, r5, #0
	adds r1, r4, #0
	bl StringAppend
	b _08017EA8
	.align 2, 0
_08017E68: .4byte 0x020397F8
_08017E6C: .4byte 0x082E3564
_08017E70: .4byte 0x082C1F08
_08017E74: .4byte 0x082C1F1C
_08017E78: .4byte 0x02021C7C
_08017E7C: .4byte 0x0000270F
_08017E80: .4byte 0x082C1F54
_08017E84: .4byte 0x082C1FAC
_08017E88:
	ldr r2, [sp]
	cmp r2, #0
	bne _08017EA8
	ldr r0, _08017EB8
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	adds r0, r5, #0
	adds r1, r4, #0
	bl StringAppend
_08017EA8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017EB8: .4byte 0x082C1FA4
	thumb_func_end sub_08017CDC

