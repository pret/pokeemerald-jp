.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081D1340
sub_081D1340: @ 0x081D1340
	push {r4, lr}
	lsls r0, r0, #0x18
	ldr r4, _081D1358
	lsrs r0, r0, #0x15
	adds r0, #8
	bl Alloc
	str r0, [r4]
	cmp r0, #0
	bne _081D135C
	movs r0, #0
	b _081D1376
	.align 2, 0
_081D1358: .4byte 0x0203CC18
_081D135C:
	movs r2, #0
	ldr r4, _081D137C
	movs r3, #0xff
_081D1362:
	adds r0, r2, r4
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _081D1362
	movs r0, #1
_081D1376:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081D137C: .4byte 0x0203CC14
	thumb_func_end sub_081D1340

	thumb_func_start sub_081D1380
sub_081D1380: @ 0x081D1380
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _081D13AC
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _081D13A4
	lsls r0, r1, #3
	ldr r1, _081D13B0
	adds r0, r0, r1
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl SetStandardWindowBorderStyle
_081D13A4:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081D13AC: .4byte 0x0203CC14
_081D13B0: .4byte 0x085F7AF4
	thumb_func_end sub_081D1380

	thumb_func_start MoveRelearnerCursorCallback
MoveRelearnerCursorCallback: @ 0x081D13B4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081D13E0
	adds r4, r4, r0
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #0xff
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D13E0: .4byte 0x0203CC14
	thumb_func_end MoveRelearnerCursorCallback

	thumb_func_start sub_081D13E4
sub_081D13E4: @ 0x081D13E4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081D13F0
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081D13F0: .4byte 0x0203CC14
	thumb_func_end sub_081D13E4

	thumb_func_start sub_081D13F4
sub_081D13F4: @ 0x081D13F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	movs r3, #0
	ldr r0, _081D14A8
	mov r8, r0
	ldr r1, _081D14AC
	mov sb, r1
	ldr r6, _081D14B0
	ldr r0, _081D14B4
	mov sl, r0
	ldrb r1, [r7, #5]
	cmp r3, r1
	bhs _081D1440
	mov ip, r8
	ldr r5, _081D14B8
	ldr r4, _081D14BC
_081D141C:
	mov r0, ip
	ldr r2, [r0]
	lsls r0, r3, #3
	adds r2, r0, r2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r5]
	adds r1, r1, r0
	adds r1, #0x12
	str r1, [r2]
	str r3, [r2, #4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrb r1, [r7, #5]
	cmp r3, r1
	blo _081D141C
_081D1440:
	mov r0, r8
	ldr r2, [r0]
	lsls r0, r3, #3
	adds r0, r0, r2
	mov r1, sb
	str r1, [r0]
	movs r1, #2
	rsbs r1, r1, #0
	str r1, [r0, #4]
	str r2, [r6]
	ldrb r0, [r7, #5]
	adds r0, #1
	movs r4, #0
	movs r5, #0
	strh r0, [r6, #0xc]
	mov r1, sl
	ldrb r0, [r1, #1]
	strb r0, [r6, #0x10]
	strb r4, [r6, #0x11]
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	strb r0, [r6, #0x12]
	strb r4, [r6, #0x13]
	movs r0, #8
	strh r0, [r6, #0xe]
	movs r0, #0x2a
	strb r0, [r6, #0x14]
	movs r0, #0x31
	strb r0, [r6, #0x15]
	ldr r0, _081D14C0
	str r0, [r6, #4]
	str r5, [r6, #8]
	movs r0, #1
	strb r0, [r6, #0x17]
	movs r0, #0
	strb r0, [r6, #0x16]
	ldrh r1, [r7, #2]
	ldrh r2, [r7]
	adds r0, r6, #0
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081D14A8: .4byte 0x0203CC18
_081D14AC: .4byte 0x085C93C8
_081D14B0: .4byte 0x03006050
_081D14B4: .4byte 0x0203CC14
_081D14B8: .4byte 0x03005AEC
_081D14BC: .4byte 0x00002CB8
_081D14C0: .4byte 0x081D14C5
	thumb_func_end sub_081D13F4

	thumb_func_start sub_081D14C4
sub_081D14C4: @ 0x081D14C4
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _081D14D4
	movs r0, #5
	bl PlaySE
_081D14D4:
	pop {r0}
	bx r0
	thumb_func_end sub_081D14C4

	thumb_func_start sub_081D14D8
sub_081D14D8: @ 0x081D14D8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	subs r0, r0, r1
	adds r0, #1
	str r0, [sp]
	movs r0, #0x6e
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #2
	str r0, [sp, #0xc]
	movs r0, #2
	movs r1, #0xc8
	movs r2, #0xc
	movs r3, #0x94
	bl AddScrollIndicatorArrowPairParameterized
	strb r0, [r4, #9]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081D14D8

	thumb_func_start sub_081D1508
sub_081D1508: @ 0x081D1508
	push {lr}
	ldr r0, _081D1518
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_081D1518: .4byte 0x0203CC18
	thumb_func_end sub_081D1508

	thumb_func_start sub_081D151C
sub_081D151C: @ 0x081D151C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r3, r0, #0
	movs r6, #0
	movs r7, #0
_081D152E:
	movs r2, #0
	lsls r5, r6, #2
	adds r0, r6, #1
	mov sl, r0
	adds r4, r5, #0
_081D1538:
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, r3, r0
	adds r1, r0, #0
	adds r1, #0x64
	strh r7, [r1]
	adds r0, #0x66
	strh r7, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #9
	bls _081D1538
	movs r2, #0
	mov sb, r2
	str r5, [sp]
	movs r1, #0x9b
	mov r8, r1
	movs r4, #0x5b
	mov ip, r4
_081D1564:
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r1, r6, r0
	adds r1, r3, r1
	mov r4, sb
	strb r4, [r1]
	lsls r0, r0, #2
	ldr r1, [sp]
	adds r0, r1, r0
	adds r0, r3, r0
	mov r4, r8
	strh r4, [r0, #0x14]
	mov r1, ip
	strh r1, [r0, #0x16]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _081D1564
	adds r1, r3, r5
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r1, r2
	strh r7, [r0]
	movs r4, #0x97
	lsls r4, r4, #1
	adds r0, r1, r4
	strh r7, [r0]
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #4
	bls _081D152E
	movs r2, #0xd5
	lsls r2, r2, #2
	adds r0, r3, r2
	movs r1, #0
	strb r1, [r0]
	ldr r4, _081D15C8
	adds r0, r3, r4
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D15C8: .4byte 0x00000352
	thumb_func_end sub_081D151C

	thumb_func_start sub_081D15CC
sub_081D15CC: @ 0x081D15CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	str r1, [sp]
	mov sb, r2
	movs r7, #0
_081D15E0:
	lsls r4, r7, #2
	ldr r1, [sp]
	adds r0, r4, r1
	ldrh r1, [r0]
	lsls r5, r1, #8
	mov r2, sb
	adds r0, r4, r2
	ldrh r0, [r0]
	subs r0, r0, r1
	lsls r0, r0, #8
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	movs r3, #0
	adds r7, #1
	mov sl, r7
	mov ip, r4
_081D1604:
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, ip
	add r0, r8
	asrs r2, r5, #8
	asrs r1, r5, #7
	movs r7, #1
	ands r1, r7
	adds r2, r2, r1
	adds r0, #0x64
	strh r2, [r0]
	adds r5, r5, r6
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #8
	bls _081D1604
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r4, r0
	add r0, r8
	mov r1, sb
	adds r2, r4, r1
	ldrh r1, [r2]
	adds r0, #0x64
	strh r1, [r0]
	ldr r7, [sp]
	adds r0, r4, r7
	ldrh r1, [r0, #2]
	lsls r5, r1, #8
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	lsls r0, r0, #8
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	movs r3, #0
	str r4, [sp, #4]
	movs r0, #1
	mov ip, r0
_081D165A:
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, [sp, #4]
	adds r0, r1, r0
	add r0, r8
	asrs r2, r5, #8
	asrs r1, r5, #7
	mov r7, ip
	ands r1, r7
	adds r2, r2, r1
	adds r0, #0x66
	strh r2, [r0]
	adds r5, r5, r6
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #8
	bls _081D165A
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r4, r0
	add r0, r8
	mov r2, sb
	adds r1, r4, r2
	ldrh r1, [r1, #2]
	adds r0, #0x66
	strh r1, [r0]
	mov r7, sl
	lsls r0, r7, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #4
	bls _081D15E0
	ldr r1, _081D16B8
	add r1, r8
	movs r0, #0
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D16B8: .4byte 0x00000352
	thumb_func_end sub_081D15CC

	thumb_func_start sub_081D16BC
sub_081D16BC: @ 0x081D16BC
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _081D16D0
	adds r4, r1, r0
	ldrh r0, [r4]
	cmp r0, #9
	bls _081D16D4
	movs r0, #0
	b _081D16EE
	.align 2, 0
_081D16D0: .4byte 0x00000352
_081D16D4:
	adds r0, r1, #0
	bl sub_081D1878
	ldrh r1, [r4]
	adds r1, #1
	strh r1, [r4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0xa
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
_081D16EE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081D16BC

	thumb_func_start sub_081D16F4
sub_081D16F4: @ 0x081D16F4
	ldr r1, _081D1700
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_081D1700: .4byte 0x00000355
	thumb_func_end sub_081D16F4

	thumb_func_start sub_081D1704
sub_081D1704: @ 0x081D1704
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _081D1718
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _081D171C
	cmp r0, #1
	beq _081D172A
	b _081D1742
	.align 2, 0
_081D1718: .4byte 0x00000355
_081D171C:
	bl ScanlineEffect_Clear
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #1
	b _081D1744
_081D172A:
	mov r0, sp
	ldr r1, _081D174C
	ldm r1!, {r2, r3, r5}
	stm r0!, {r2, r3, r5}
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ScanlineEffect_SetParams
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_081D1742:
	movs r0, #0
_081D1744:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081D174C: .4byte 0x085F7B0C
	thumb_func_end sub_081D1704

	thumb_func_start sub_081D1750
sub_081D1750: @ 0x081D1750
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	movs r1, #0xd5
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081D1806
	adds r0, r6, #0
	bl sub_081D1AEC
	adds r0, r6, #0
	bl sub_081D1C48
	movs r7, #0
	ldr r5, _081D1818
	mov ip, r5
	movs r0, #0xf0
	lsls r0, r0, #3
	add r0, ip
	mov sb, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r1, r6, r1
	str r1, [sp]
	ldr r5, _081D181C
	mov r8, r5
	movs r0, #0xa1
	lsls r0, r0, #1
	adds r0, r6, r0
	str r0, [sp, #4]
	movs r1, #0x92
	lsls r1, r1, #2
	adds r1, r6, r1
	str r1, [sp, #8]
	ldr r5, _081D1820
	adds r5, r5, r6
	mov sl, r5
_081D17A6:
	adds r2, r7, #0
	adds r2, #0x37
	lsls r3, r2, #2
	mov r0, sb
	adds r0, r3, r0
	str r0, [sp, #0xc]
	add r3, ip
	lsls r4, r7, #2
	ldr r1, [sp]
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r5, [sp, #4]
	adds r1, r5, r4
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	mov r1, r8
	ands r0, r1
	ldr r5, [sp, #0xc]
	strh r0, [r5]
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	mov r0, sb
	adds r3, r2, r0
	add r2, ip
	ldr r1, [sp, #8]
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r0, r0, #8
	add r4, sl
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r2]
	mov r5, r8
	ands r0, r5
	strh r0, [r3]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x41
	bls _081D17A6
	movs r0, #0xd5
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1]
_081D1806:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D1818: .4byte 0x020388C8
_081D181C: .4byte 0x0000FFFF
_081D1820: .4byte 0x0000024A
	thumb_func_end sub_081D1750

	thumb_func_start sub_081D1824
sub_081D1824: @ 0x081D1824
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _081D1830
	movs r1, #0
_081D1830:
	movs r0, #1
	lsls r0, r1
	movs r5, #0x1f
	bics r5, r0
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	movs r0, #0x42
	movs r1, #0x9b
	bl SetGpuReg
	ldr r4, _081D1870
	movs r0, #0x44
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x46
	adds r1, r4, #0
	bl SetGpuReg
	ldr r1, _081D1874
	movs r0, #0x48
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r5, #0
	bl SetGpuReg
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D1870: .4byte 0x00003879
_081D1874: .4byte 0x00003F3F
	thumb_func_end sub_081D1824

	thumb_func_start sub_081D1878
sub_081D1878: @ 0x081D1878
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	movs r4, #0
	movs r7, #0x96
	lsls r7, r7, #1
	add r7, ip
	ldr r6, _081D18BC
	add r6, ip
	mov r5, ip
	adds r5, #0x64
_081D188C:
	lsls r2, r4, #2
	adds r3, r7, r2
	ldrh r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r2, r5, r2
	ldr r0, [r2]
	str r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _081D188C
	movs r1, #0xd5
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D18BC: .4byte 0x00000352
	thumb_func_end sub_081D1878

	thumb_func_start sub_081D18C0
sub_081D18C0: @ 0x081D18C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	adds r6, r1, #0
	adds r5, r2, #0
	str r3, [sp, #4]
	ldr r0, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0xc]
	ldrh r0, [r5, #2]
	ldrh r1, [r3, #2]
	cmp r0, r1
	bhs _081D18FA
	adds r2, r0, #0
	mov sl, r2
	ldrh r0, [r3, #2]
	ldrh r1, [r5]
	lsls r4, r1, #0xa
	ldrh r3, [r3]
	str r3, [sp, #8]
	b _081D190E
_081D18FA:
	ldrh r0, [r5, #2]
	ldr r1, [sp, #4]
	ldrh r1, [r1, #2]
	mov sl, r1
	ldr r2, [sp, #4]
	ldrh r1, [r2]
	lsls r4, r1, #0xa
	ldrh r3, [r5]
	str r3, [sp, #8]
	mov r2, sl
_081D190E:
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0
	beq _081D1926
	subs r0, r3, r1
	lsls r0, r0, #0xa
	mov r1, r8
	bl __divsi3
	str r0, [sp, #0xc]
_081D1926:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r7, #0
	bne _081D1970
	mov r0, sl
	subs r0, #0x38
	lsls r0, r0, #2
	adds r6, r6, r0
	movs r5, #0
	mov r3, sb
	lsls r3, r3, #1
	mov ip, r3
	ldr r0, [sp, #8]
	add r0, sb
	str r0, [sp, #0x10]
	cmp r7, r8
	bhs _081D19FE
	movs r7, #1
_081D1950:
	adds r2, r3, r6
	asrs r1, r4, #0xa
	asrs r0, r4, #9
	ands r0, r7
	adds r1, r1, r0
	add r1, sb
	strh r1, [r2]
	ldr r1, [sp, #0xc]
	adds r4, r4, r1
	adds r6, #4
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r8
	blo _081D1950
	b _081D19FE
_081D1970:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	ble _081D1A08
	mov r0, sl
	subs r0, #0x38
	lsls r0, r0, #2
	adds r7, r7, r0
	movs r5, #0
	mov r3, sb
	lsls r3, r3, #1
	mov ip, r3
	ldr r0, [sp, #8]
	add r0, sb
	str r0, [sp, #0x10]
	cmp r5, r8
	bhs _081D19C2
	ldr r0, _081D1A04
	cmp r4, r0
	bgt _081D19C2
	mov r1, ip
	str r1, [sp, #0x14]
_081D199A:
	ldr r3, [sp, #0x14]
	adds r2, r3, r7
	asrs r1, r4, #0xa
	asrs r0, r4, #9
	movs r3, #1
	ands r0, r3
	adds r1, r1, r0
	add r1, sb
	strh r1, [r2]
	ldr r0, [sp, #0xc]
	adds r4, r4, r0
	adds r7, #4
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r8
	bhs _081D19C2
	ldr r1, _081D1A04
	cmp r4, r1
	ble _081D199A
_081D19C2:
	mov r2, sl
	adds r1, r2, r5
	ldr r3, [sp]
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r3, r2
	strh r1, [r0]
	ldrh r0, [r0]
	subs r0, #0x38
	lsls r0, r0, #2
	adds r6, r6, r0
	cmp r5, r8
	bhs _081D19FE
	mov r3, ip
	movs r7, #1
_081D19E0:
	adds r2, r3, r6
	asrs r1, r4, #0xa
	asrs r0, r4, #9
	ands r0, r7
	adds r1, r1, r0
	add r1, sb
	strh r1, [r2]
	ldr r0, [sp, #0xc]
	adds r4, r4, r0
	adds r6, #4
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r8
	blo _081D19E0
_081D19FE:
	subs r0, r6, #4
	b _081D1AD4
	.align 2, 0
_081D1A04: .4byte 0x00026BFF
_081D1A08:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	bge _081D1AAC
	mov r0, sl
	subs r0, #0x38
	lsls r0, r0, #2
	adds r6, r6, r0
	movs r5, #0
	mov r2, sb
	lsls r2, r2, #1
	mov ip, r2
	ldr r3, [sp, #8]
	add r3, sb
	str r3, [sp, #0x10]
	cmp r5, r8
	bhs _081D1A66
	adds r3, r2, r6
	asrs r1, r4, #0xa
	asrs r0, r4, #9
	movs r2, #1
	ands r0, r2
	adds r1, r1, r0
	add r1, sb
	strh r1, [r3]
	b _081D1A5C
_081D1A3A:
	ldr r0, [sp, #0xc]
	adds r4, r4, r0
	adds r6, #4
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r8
	bhs _081D1A66
	mov r1, ip
	adds r3, r1, r6
	asrs r2, r4, #0xa
	asrs r0, r4, #9
	movs r1, #1
	ands r0, r1
	adds r2, r2, r0
	add r2, sb
	strh r2, [r3]
_081D1A5C:
	ldr r0, _081D1AA8
	cmp r4, r0
	bgt _081D1A3A
	movs r0, #0x9b
	strh r0, [r3]
_081D1A66:
	mov r2, sl
	adds r1, r2, r5
	ldr r3, [sp]
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r3, r2
	strh r1, [r0]
	ldrh r0, [r0]
	subs r0, #0x38
	lsls r0, r0, #2
	adds r7, r7, r0
	cmp r5, r8
	bhs _081D1AA2
	mov r3, ip
	movs r6, #1
_081D1A84:
	adds r2, r3, r7
	asrs r1, r4, #0xa
	asrs r0, r4, #9
	ands r0, r6
	adds r1, r1, r0
	add r1, sb
	strh r1, [r2]
	ldr r0, [sp, #0xc]
	adds r4, r4, r0
	adds r7, #4
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r8
	blo _081D1A84
_081D1AA2:
	subs r0, r7, #4
	b _081D1AD4
	.align 2, 0
_081D1AA8: .4byte 0x00026BFF
_081D1AAC:
	ldr r1, [sp]
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r1, r2
	mov r3, sl
	strh r3, [r0]
	mov r0, sl
	subs r0, #0x38
	lsls r0, r0, #2
	adds r6, r6, r0
	adds r7, r7, r0
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r6, #2]
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	strh r0, [r7]
	movs r0, #0x9b
	strh r0, [r7, #2]
	b _081D1ADC
_081D1AD4:
	add r0, ip
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0]
_081D1ADC:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D18C0

	thumb_func_start sub_081D1AEC
sub_081D1AEC: @ 0x081D1AEC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x97
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r3, #0x99
	lsls r3, r3, #1
	adds r1, r4, r3
	ldrh r0, [r2]
	ldrh r3, [r1]
	cmp r0, r3
	bhs _081D1B28
	adds r7, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r3, #0x96
	lsls r3, r3, #1
	adds r2, r4, r3
	subs r0, #0x10
	adds r3, r4, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	bl sub_081D18C0
	b _081D1B48
_081D1B28:
	ldrh r7, [r1]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r3, #0x98
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r0, #0x96
	lsls r0, r0, #1
	adds r3, r4, r0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	bl sub_081D18C0
_081D1B48:
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r5, r4, r1
	movs r3, #0x98
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r6, r4, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl sub_081D18C0
	movs r2, #0
	movs r1, #0x9b
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r3, #0x9d
	lsls r3, r3, #1
	adds r1, r4, r3
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bhi _081D1B84
	movs r2, #1
_081D1B84:
	movs r0, #0x9c
	lsls r0, r0, #1
	adds r3, r4, r0
	str r2, [sp]
	movs r1, #0x92
	lsls r1, r1, #2
	adds r0, r4, r1
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_081D18C0
	movs r2, #0x38
	cmp r2, r7
	bhs _081D1BC6
	adds r6, r5, #0
	movs r3, #0
	movs r0, #0xa1
	lsls r0, r0, #1
	adds r5, r4, r0
_081D1BAE:
	adds r0, r2, #0
	subs r0, #0x38
	lsls r0, r0, #2
	adds r1, r6, r0
	strh r3, [r1]
	adds r0, r5, r0
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r7
	blo _081D1BAE
_081D1BC6:
	movs r1, #0x97
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r2, [r0]
	movs r3, #0xd4
	lsls r3, r3, #2
	adds r0, r4, r3
	ldrh r1, [r0]
	cmp r2, r1
	bhi _081D1BFA
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r3, r4, r1
	movs r5, #0x9b
	adds r1, r0, #0
_081D1BE4:
	adds r0, r2, #0
	subs r0, #0x38
	lsls r0, r0, #2
	adds r0, r3, r0
	strh r5, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r1]
	cmp r2, r0
	bls _081D1BE4
_081D1BFA:
	movs r2, #0x9b
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r3, #0xd4
	lsls r3, r3, #2
	adds r0, r4, r3
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bhs _081D1C10
	adds r0, r1, #0
_081D1C10:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x79
	bhi _081D1C40
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r5, r4, r0
	movs r3, #0
	movs r1, #0xa1
	lsls r1, r1, #1
	adds r4, r4, r1
_081D1C28:
	adds r0, r2, #0
	subs r0, #0x38
	lsls r0, r0, #2
	adds r1, r5, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x79
	bls _081D1C28
_081D1C40:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D1AEC

	thumb_func_start sub_081D1C48
sub_081D1C48: @ 0x081D1C48
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x97
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r3, #0x9f
	lsls r3, r3, #1
	adds r1, r4, r3
	ldrh r0, [r2]
	ldrh r3, [r1]
	cmp r0, r3
	bhs _081D1C84
	adds r7, r0, #0
	movs r0, #0x92
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r3, #0x96
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r0, #0x9e
	lsls r0, r0, #1
	adds r3, r4, r0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	bl sub_081D18C0
	b _081D1CA6
_081D1C84:
	ldrh r7, [r1]
	movs r2, #0x92
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r3, #0x9e
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r0, #0x96
	lsls r0, r0, #1
	adds r3, r4, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	bl sub_081D18C0
_081D1CA6:
	movs r1, #0x92
	lsls r1, r1, #2
	adds r5, r4, r1
	movs r3, #0x9e
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r0, #0x9c
	lsls r0, r0, #1
	adds r3, r4, r0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_081D18C0
	movs r2, #0x38
	cmp r2, r7
	bhs _081D1CEC
	adds r6, r5, #0
	movs r3, #0
	ldr r1, _081D1D6C
	adds r5, r4, r1
_081D1CD4:
	adds r0, r2, #0
	subs r0, #0x38
	lsls r0, r0, #2
	adds r1, r6, r0
	strh r3, [r1]
	adds r0, r5, r0
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r7
	blo _081D1CD4
_081D1CEC:
	movs r2, #0x97
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrh r2, [r0]
	movs r3, #0xd4
	lsls r3, r3, #2
	adds r0, r4, r3
	ldrh r1, [r0]
	cmp r2, r1
	bhi _081D1D1E
	ldr r1, _081D1D6C
	adds r3, r4, r1
	movs r5, #0x9b
	adds r1, r0, #0
_081D1D08:
	adds r0, r2, #0
	subs r0, #0x38
	lsls r0, r0, #2
	adds r0, r3, r0
	strh r5, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r1]
	cmp r2, r0
	bls _081D1D08
_081D1D1E:
	movs r1, #0x9d
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r0, [r0]
	adds r1, r0, #1
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrh r0, [r0]
	cmp r0, r1
	bge _081D1D36
	adds r0, r1, #0
_081D1D36:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x79
	bhi _081D1D62
	movs r3, #0x92
	lsls r3, r3, #2
	adds r5, r4, r3
	movs r3, #0
	ldr r0, _081D1D6C
	adds r4, r4, r0
_081D1D4A:
	adds r0, r2, #0
	subs r0, #0x38
	lsls r0, r0, #2
	adds r1, r5, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x79
	bls _081D1D4A
_081D1D62:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D1D6C: .4byte 0x0000024A
	thumb_func_end sub_081D1C48

	thumb_func_start sub_081D1D70
sub_081D1D70: @ 0x081D1D70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov r8, r1
	ldr r1, _081D1E38
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r6, #1
	movs r0, #0x9b
	mov r3, r8
	strh r0, [r3]
	movs r0, #0x5b
	subs r0, r0, r2
	strh r0, [r3, #2]
	movs r7, #0x40
	movs r0, #0
	mov ip, r0
	movs r2, #1
	mov sb, r2
	ldr r3, _081D1E3C
	mov sl, r3
_081D1DA2:
	adds r0, r7, #0
	adds r0, #0x33
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r1, ip
	lsls r0, r1, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r3, r0, #0x18
	mov ip, r3
	cmp r0, #0
	bge _081D1DC0
	movs r0, #4
	mov ip, r0
_081D1DC0:
	mov r1, ip
	lsls r0, r1, #0x18
	asrs r4, r0, #0x18
	cmp r4, #2
	bne _081D1DD0
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_081D1DD0:
	ldrb r0, [r6]
	ldr r2, _081D1E38
	adds r0, r0, r2
	ldrb r2, [r0]
	adds r6, #1
	lsls r0, r4, #2
	mov r1, r8
	adds r3, r0, r1
	adds r0, r7, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r5, r0, #8
	adds r0, r5, #0
	adds r0, #0x9b
	strh r0, [r3]
	lsls r0, r7, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r0, #0x5b
	subs r0, r0, r1
	strh r0, [r3, #2]
	cmp r4, #2
	bgt _081D1E1C
	cmp r2, #0x20
	bne _081D1E16
	cmp r4, #2
	beq _081D1E1C
_081D1E16:
	adds r0, r5, #0
	adds r0, #0x9c
	strh r0, [r3]
_081D1E1C:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #4
	bls _081D1DA2
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D1E38: .4byte 0x085F7B18
_081D1E3C: .4byte 0x082FA8CC
	thumb_func_end sub_081D1D70

	thumb_func_start InitMoveRelearnerWindows
InitMoveRelearnerWindows: @ 0x081D1E40
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081D1E90
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	movs r1, #1
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	ldr r0, _081D1E94
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r4, #0
_081D1E66:
	adds r0, r4, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _081D1E66
	cmp r5, #0
	bne _081D1E98
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	b _081D1EAA
	.align 2, 0
_081D1E90: .4byte 0x085F7C18
_081D1E94: .4byte 0x085D7B04
_081D1E98:
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #1
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
_081D1EAA:
	movs r0, #2
	bl PutWindowTilemap
	movs r0, #3
	bl PutWindowTilemap
	movs r0, #2
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	movs r0, #3
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	bl sub_081D1EE0
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitMoveRelearnerWindows

	thumb_func_start sub_081D1EE0
sub_081D1EE0: @ 0x081D1EE0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0xc
	ldr r2, _081D1FB8
	movs r0, #2
	mov sb, r0
	str r0, [sp]
	movs r5, #0xff
	str r5, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #0x30
	bl AddTextPrinterParameterized
	ldr r0, _081D1FBC
	mov sl, r0
	movs r0, #0x1a
	mov r8, r0
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	mov r2, sl
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r2, _081D1FC0
	mov r0, r8
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #0x50
	bl AddTextPrinterParameterized
	ldr r2, _081D1FC4
	movs r6, #0x2a
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldr r2, _081D1FC8
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #0x48
	bl AddTextPrinterParameterized
	ldr r2, _081D1FCC
	mov r0, sb
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0x2c
	bl AddTextPrinterParameterized
	mov r0, r8
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	mov r2, sl
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r2, _081D1FD0
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r2, _081D1FD4
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0x50
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D1FB8: .4byte 0x085F7C50
_081D1FBC: .4byte 0x085F7C5F
_081D1FC0: .4byte 0x085F7C68
_081D1FC4: .4byte 0x085F7C64
_081D1FC8: .4byte 0x085F7C6E
_081D1FCC: .4byte 0x085F7C57
_081D1FD0: .4byte 0x085F7C75
_081D1FD4: .4byte 0x085F7C7A
	thumb_func_end sub_081D1EE0

	thumb_func_start LoadMoveRelearnerMovesList
LoadMoveRelearnerMovesList: @ 0x081D1FD8
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r3, _081D1FF8
	adds r2, r3, #0
	ldr r1, _081D1FFC
	ldm r1!, {r5, r6, r7}
	stm r2!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r2!, {r5, r6, r7}
	strh r4, [r3, #0xc]
	str r0, [r3]
	cmp r4, #5
	bhi _081D2000
	strh r4, [r3, #0xe]
	b _081D2004
	.align 2, 0
_081D1FF8: .4byte 0x03006050
_081D1FFC: .4byte 0x085F7C80
_081D2000:
	movs r0, #6
	strh r0, [r3, #0xe]
_081D2004:
	ldrb r0, [r3, #0xe]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end LoadMoveRelearnerMovesList

	thumb_func_start MoveRelearnerMenuLoadContestMoveDescription
MoveRelearnerMenuLoadContestMoveDescription: @ 0x081D200C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _081D2024
	movs r0, #5
	bl PlaySE
_081D2024:
	movs r6, #0x20
	str r6, [sp]
	movs r4, #0x10
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0x11
	movs r2, #0x20
	movs r3, #0x1a
	bl FillWindowPixelRect
	movs r5, #0x18
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0x11
	movs r2, #0x78
	movs r3, #0x1a
	bl FillWindowPixelRect
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0x11
	movs r2, #0x20
	movs r3, #0x2a
	bl FillWindowPixelRect
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0x11
	movs r2, #0x78
	movs r3, #0x2a
	bl FillWindowPixelRect
	movs r5, #0x90
	str r5, [sp]
	str r6, [sp, #4]
	movs r0, #0
	movs r1, #0x11
	movs r2, #0
	movs r3, #0x42
	bl FillWindowPixelRect
	movs r0, #0x28
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #0x11
	movs r2, #0x20
	movs r3, #0x1a
	bl FillWindowPixelRect
	str r5, [sp]
	str r6, [sp, #4]
	movs r0, #1
	movs r1, #0x11
	movs r2, #0
	movs r3, #0x42
	bl FillWindowPixelRect
	movs r0, #2
	rsbs r0, r0, #0
	cmp r7, r0
	bne _081D20B8
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
	b _081D21E4
_081D20B8:
	ldr r1, _081D20F4
	lsls r4, r7, #1
	adds r0, r4, r7
	lsls r0, r0, #2
	adds r5, r0, r1
	ldrb r0, [r5, #2]
	lsls r2, r0, #2
	adds r2, r2, r0
	ldr r0, _081D20F8
	adds r2, r2, r0
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0x20
	bl AddTextPrinterParameterized
	ldrb r0, [r5, #1]
	adds r6, r4, #0
	cmp r0, #1
	bhi _081D2100
	ldr r1, _081D20FC
	add r0, sp, #0xc
	bl StringCopy
	b _081D210C
	.align 2, 0
_081D20F4: .4byte 0x082ED220
_081D20F8: .4byte 0x082EBC88
_081D20FC: .4byte 0x085C9406
_081D2100:
	ldrb r1, [r5, #1]
	add r0, sp, #0xc
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
_081D210C:
	movs r0, #0x1a
	str r0, [sp]
	movs r5, #0xff
	str r5, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #0x78
	bl AddTextPrinterParameterized
	ldr r1, _081D215C
	adds r0, r6, r7
	lsls r0, r0, #2
	adds r6, r0, r1
	ldrb r1, [r6, #4]
	add r0, sp, #0xc
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r0, #0x2a
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #0x20
	bl AddTextPrinterParameterized
	ldrb r0, [r6, #3]
	cmp r0, #0
	bne _081D2164
	ldr r1, _081D2160
	add r0, sp, #0xc
	bl StringCopy
	b _081D2170
	.align 2, 0
_081D215C: .4byte 0x082ED220
_081D2160: .4byte 0x085C9406
_081D2164:
	ldrb r1, [r6, #3]
	add r0, sp, #0xc
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
_081D2170:
	movs r0, #0x2a
	str r0, [sp]
	movs r0, #0xff
	mov r8, r0
	str r0, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #0x78
	bl AddTextPrinterParameterized
	lsls r4, r7, #3
	subs r2, r4, r7
	lsls r2, r2, #3
	ldr r0, _081D21F8
	adds r2, r2, r0
	movs r6, #0x42
	str r6, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r1, _081D21FC
	ldr r0, _081D2200
	adds r4, r4, r0
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1b
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x1a
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0x20
	bl AddTextPrinterParameterized
	ldr r1, _081D2204
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	str r6, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
_081D21E4:
	adds r0, r7, #0
	bl MoveRelearnerShowHideHearts
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D21F8: .4byte 0x085E7FFC
_081D21FC: .4byte 0x08560CAC
_081D2200: .4byte 0x08565FCC
_081D2204: .4byte 0x08560BB4
	thumb_func_end MoveRelearnerMenuLoadContestMoveDescription

	thumb_func_start MoveRelearnerPrintText
MoveRelearnerPrintText: @ 0x081D2208
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _081D224C
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	bl GetPlayerTextSpeedDelay
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D224C: .4byte 0x030030B4
	thumb_func_end MoveRelearnerPrintText

	thumb_func_start MoveRelearnerRunTextPrinters
MoveRelearnerRunTextPrinters: @ 0x081D2250
	push {lr}
	bl RunTextPrinters
	movs r0, #3
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end MoveRelearnerRunTextPrinters

	thumb_func_start MoveRelearnerCreateYesNoMenu
MoveRelearnerCreateYesNoMenu: @ 0x081D2264
	push {lr}
	ldr r0, _081D2278
	movs r1, #1
	movs r2, #1
	movs r3, #0xe
	bl sub_08198D44
	pop {r0}
	bx r0
	.align 2, 0
_081D2278: .4byte 0x085F7C48
	thumb_func_end MoveRelearnerCreateYesNoMenu

	thumb_func_start GetBoxOrPartyMonData
GetBoxOrPartyMonData: @ 0x081D227C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r0, #0xe
	bne _081D22BC
	cmp r2, #2
	beq _081D2292
	cmp r2, #7
	bne _081D22A8
_081D2292:
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081D22A4
	adds r0, r0, r1
	adds r1, r2, #0
	adds r2, r3, #0
	bl GetMonData
	b _081D22DE
	.align 2, 0
_081D22A4: .4byte 0x02024190
_081D22A8:
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081D22B8
	adds r0, r0, r1
	adds r1, r2, #0
	bl GetMonData
	b _081D22DE
	.align 2, 0
_081D22B8: .4byte 0x02024190
_081D22BC:
	cmp r2, #2
	beq _081D22C4
	cmp r2, #7
	bne _081D22D2
_081D22C4:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl GetAndCopyBoxMonDataAt
	b _081D22DE
_081D22D2:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl GetBoxMonDataAt
_081D22DE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBoxOrPartyMonData

	thumb_func_start sub_081D22E4
sub_081D22E4: @ 0x081D22E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r0, #0xfc
	strb r0, [r5]
	adds r5, #1
	movs r0, #4
	strb r0, [r5]
	adds r5, #1
	movs r0, #8
	strb r0, [r5]
	adds r5, #1
	movs r0, #0
	strb r0, [r5]
	adds r5, #1
	movs r0, #9
	strb r0, [r5]
	adds r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x2d
	movs r3, #0
	bl GetBoxOrPartyMonData
	cmp r0, #0
	beq _081D2334
	ldr r1, _081D2330
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0xc
	bl StringCopyPadded
	b _081D24A2
	.align 2, 0
_081D2330: .4byte 0x085C8C62
_081D2334:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	adds r3, r5, #0
	bl GetBoxOrPartyMonData
	adds r0, r5, #0
	bl StringGetEnd10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xb
	movs r3, #0
	bl GetBoxOrPartyMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, #0xe
	bne _081D2384
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _081D2380
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r4, #0
	bl GetMonGender
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _081D23A6
	.align 2, 0
_081D2380: .4byte 0x02024190
_081D2384:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	bl GetBoxedMonPtr
	adds r4, r0, #0
	bl GetBoxMonGender
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	bl GetLevelFromBoxMonExp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_081D23A6:
	cmp r7, #0x1d
	beq _081D23AE
	cmp r7, #0x20
	bne _081D23C4
_081D23AE:
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _081D23CC
	adds r1, r1, r0
	adds r0, r5, #0
	bl StringCompare
	cmp r0, #0
	bne _081D23C4
	movs r6, #0xff
_081D23C4:
	adds r3, r5, #0
	movs r2, #0
	b _081D23D8
	.align 2, 0
_081D23CC: .4byte 0x082EA31C
_081D23D0:
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_081D23D8:
	ldrb r0, [r3]
	cmp r0, #0xff
	bne _081D23D0
	adds r1, r2, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, #4
	bhi _081D23FC
	movs r4, #0
_081D23EC:
	strb r4, [r3]
	adds r3, #1
	adds r1, r2, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, #4
	bls _081D23EC
_081D23FC:
	movs r0, #0
	strb r0, [r3]
	adds r3, #1
	cmp r6, #0
	beq _081D240C
	cmp r6, #0xfe
	beq _081D2432
	b _081D2456
_081D240C:
	movs r1, #0xfc
	strb r1, [r3]
	adds r3, #1
	movs r0, #1
	strb r0, [r3]
	adds r3, #1
	movs r0, #4
	strb r0, [r3]
	adds r3, #1
	strb r1, [r3]
	adds r3, #1
	movs r0, #3
	strb r0, [r3]
	adds r3, #1
	movs r0, #5
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xb5
	b _081D2456
_081D2432:
	movs r1, #0xfc
	strb r1, [r3]
	adds r3, #1
	movs r0, #1
	strb r0, [r3]
	adds r3, #1
	movs r0, #6
	strb r0, [r3]
	adds r3, #1
	strb r1, [r3]
	adds r3, #1
	movs r0, #3
	strb r0, [r3]
	adds r3, #1
	movs r0, #7
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xb6
_081D2456:
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xfc
	strb r0, [r3]
	adds r3, #1
	movs r0, #4
	strb r0, [r3]
	adds r3, #1
	movs r0, #8
	strb r0, [r3]
	adds r3, #1
	movs r4, #0
	strb r4, [r3]
	adds r3, #1
	movs r0, #9
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xba
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xf9
	strb r0, [r3]
	adds r3, #1
	movs r0, #5
	strb r0, [r3]
	adds r3, #1
	adds r0, r3, #0
	mov r1, r8
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r3, r0, #0
	strb r4, [r3]
	adds r3, #1
	movs r0, #0xff
	strb r0, [r3]
	adds r0, r3, #0
_081D24A2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081D22E4

	thumb_func_start sub_081D24AC
sub_081D24AC: @ 0x081D24AC
	push {r4, lr}
	adds r4, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	b _081D24C4
_081D24B6:
	strb r3, [r4]
	adds r1, #1
	adds r4, #1
	lsls r0, r2, #0x10
	ldr r2, _081D2500
	adds r0, r0, r2
	lsrs r2, r0, #0x10
_081D24C4:
	ldrb r3, [r1]
	adds r0, r3, #0
	cmp r0, #0xff
	bne _081D24B6
	adds r1, r2, #0
	lsls r0, r1, #0x10
	ldr r2, _081D2500
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	cmp r1, #0
	ble _081D24F2
	movs r3, #0
_081D24DE:
	strb r3, [r4]
	adds r4, #1
	adds r1, r2, #0
	lsls r0, r1, #0x10
	ldr r2, _081D2500
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _081D24DE
_081D24F2:
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081D2500: .4byte 0xFFFF0000
	thumb_func_end sub_081D24AC

	thumb_func_start sub_081D2504
sub_081D2504: @ 0x081D2504
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r4, r4, #0x18
	cmp r4, #0
	bne _081D252C
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_081D252C:
	cmp r2, r0
	beq _081D2572
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r3, #0
	bl sub_081D22E4
	movs r0, #0xfc
	strb r0, [r5]
	movs r0, #4
	strb r0, [r5, #1]
	movs r0, #8
	strb r0, [r5, #2]
	movs r0, #0
	strb r0, [r5, #3]
	movs r0, #9
	strb r0, [r5, #4]
	cmp r7, #0xe
	bne _081D255C
	adds r0, r5, #5
	ldr r1, _081D2558
	b _081D256A
	.align 2, 0
_081D2558: .4byte 0x085CB7C6
_081D255C:
	adds r4, r5, #5
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl GetBoxNamePtr
	adds r1, r0, #0
	adds r0, r4, #0
_081D256A:
	movs r2, #8
	bl sub_081D24AC
	b _081D25A2
_081D2572:
	movs r1, #0
	movs r2, #0
_081D2576:
	adds r0, r6, r1
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xb
	bls _081D2576
	adds r1, r6, r1
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0
	movs r2, #0
_081D258E:
	adds r0, r5, r1
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #7
	bls _081D258E
	adds r1, r5, r1
	movs r0, #0xff
	strb r0, [r1]
_081D25A2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D2504

	thumb_func_start sub_081D25A8
sub_081D25A8: @ 0x081D25A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	lsls r5, r5, #0x18
	cmp r5, #0
	bne _081D25E0
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_081D25E0:
	cmp r2, r0
	beq _081D268C
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x16
	movs r3, #0
	bl GetBoxOrPartyMonData
	mov r1, sb
	lsls r5, r1, #2
	adds r4, r5, r1
	mov r2, r8
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x2f
	movs r3, #0
	bl GetBoxOrPartyMonData
	mov r1, r8
	adds r1, #1
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x21
	movs r3, #0
	bl GetBoxOrPartyMonData
	mov r1, r8
	adds r1, #2
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x18
	movs r3, #0
	bl GetBoxOrPartyMonData
	mov r1, r8
	adds r1, #3
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x17
	movs r3, #0
	bl GetBoxOrPartyMonData
	mov r1, r8
	adds r1, #4
	adds r1, r1, r4
	strb r0, [r1]
	mov r4, sl
	add r4, sb
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x30
	movs r3, #0
	bl GetBoxOrPartyMonData
	cmp r0, #0xff
	beq _081D2674
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x30
	movs r3, #0
	bl GetBoxOrPartyMonData
	movs r1, #0x1d
	bl __udivsi3
	b _081D2676
_081D2674:
	movs r0, #9
_081D2676:
	strb r0, [r4]
	mov r0, sb
	adds r1, r5, r0
	mov r2, r8
	adds r0, r2, r1
	lsls r1, r1, #2
	adds r1, #0x14
	add r1, r8
	bl sub_081D1D70
	b _081D26B6
_081D268C:
	movs r2, #0
	mov r0, sb
	lsls r5, r0, #2
	adds r1, r5, r0
	movs r6, #0
	lsls r3, r1, #2
	movs r5, #0x9b
	movs r4, #0x5b
_081D269C:
	adds r0, r2, r1
	add r0, r8
	strb r6, [r0]
	lsls r0, r2, #2
	adds r0, r0, r3
	add r0, r8
	strh r5, [r0, #0x14]
	strh r4, [r0, #0x16]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #4
	bls _081D269C
_081D26B6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D25A8

	thumb_func_start sub_081D26C4
sub_081D26C4: @ 0x081D26C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	ldr r4, [sp, #0x28]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r4, r4, #0x18
	cmp r4, #0
	bne _081D26F4
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_081D26F4:
	cmp r2, r0
	beq _081D274A
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x41
	movs r3, #0
	bl GetBoxOrPartyMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #0
	bl GetBoxOrPartyMonData
	adds r6, r0, #0
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl GetBoxOrPartyMonData
	adds r5, r0, #0
	lsls r0, r4, #3
	ldr r1, _081D2758
	adds r0, r0, r1
	movs r1, #1
	str r1, [sp]
	mov r1, r8
	adds r2, r4, #0
	adds r3, r5, #0
	bl LoadSpecialPokePic
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl GetMonSpritePalFromSpeciesAndPersonality
	mov r1, sb
	bl LZ77UnCompWram
_081D274A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D2758: .4byte 0x082DDA1C
	thumb_func_end sub_081D26C4

	thumb_func_start sub_081D275C
sub_081D275C: @ 0x081D275C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1]
	adds r0, #0x18
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _081D2770
	movs r0, #0
	strh r0, [r1]
_081D2770:
	movs r0, #0
	ldrsh r1, [r1, r0]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081D275C

	thumb_func_start sub_081D2780
sub_081D2780: @ 0x081D2780
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1]
	subs r0, #0x18
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x50
	rsbs r2, r2, #0
	cmp r0, r2
	bge _081D2798
	strh r2, [r1]
_081D2798:
	movs r0, #0
	ldrsh r1, [r1, r0]
	eors r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	thumb_func_end sub_081D2780

	thumb_func_start sub_081D27A8
sub_081D27A8: @ 0x081D27A8
	push {r4, r5, lr}
	adds r5, r1, #0
	bl sub_081D16BC
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	bl sub_081D275C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	cmp r4, #0
	bne _081D27CA
	cmp r0, #0
	beq _081D27CC
_081D27CA:
	movs r1, #1
_081D27CC:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081D27A8

	thumb_func_start sub_081D27D4
sub_081D27D4: @ 0x081D27D4
	push {r4, r5, lr}
	adds r5, r1, #0
	bl sub_081D16BC
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	bl sub_081D2780
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	cmp r4, #0
	bne _081D27F6
	cmp r0, #0
	beq _081D27F8
_081D27F6:
	movs r1, #1
_081D27F8:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081D27D4

	thumb_func_start sub_081D2800
sub_081D2800: @ 0x081D2800
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r3, _081D2840
	ldr r4, [r3]
	ldr r5, [r3, #4]
	str r4, [sp, #0x18]
	str r5, [sp, #0x1c]
	mov r4, sp
	ldr r3, _081D2844
	ldm r3!, {r5, r6, r7}
	stm r4!, {r5, r6, r7}
	ldm r3!, {r5, r6, r7}
	stm r4!, {r5, r6, r7}
	ldr r3, _081D2848
	ldr r4, [r3, #4]
	ldr r3, [r3]
	ldr r5, [sp, #0x18]
	ldr r6, [sp, #0x1c]
	str r5, [r0]
	str r6, [r0, #4]
	mov r0, sp
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	str r3, [r2]
	str r4, [r2, #4]
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D2840: .4byte 0x085FA898
_081D2844: .4byte 0x085FA8A0
_081D2848: .4byte 0x085FA8B8
	thumb_func_end sub_081D2800

	thumb_func_start sub_081D284C
sub_081D284C: @ 0x081D284C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x50
	adds r5, r0, #0
	mov ip, r1
	mov r8, r2
	mov r1, sp
	ldr r0, _081D28D4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	add r3, sp, #0x20
	adds r1, r3, #0
	ldr r0, _081D28D8
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	add r2, sp, #0x38
	adds r1, r2, #0
	ldr r0, _081D28DC
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	movs r4, #0
_081D2888:
	lsls r0, r4, #3
	add r0, sp
	ldr r1, [r0, #4]
	ldr r0, [r0]
	stm r5!, {r0, r1}
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081D2888
	mov r1, ip
	adds r0, r2, #0
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
	movs r4, #0
_081D28AA:
	lsls r0, r4, #3
	adds r0, r3, r0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	mov r5, r8
	adds r5, #8
	mov r8, r5
	subs r5, #8
	stm r5!, {r0, r1}
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _081D28AA
	add sp, #0x50
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D28D4: .4byte 0x085FA8C0
_081D28D8: .4byte 0x085FA8E0
_081D28DC: .4byte 0x085FA8F8
	thumb_func_end sub_081D284C

	thumb_func_start sub_081D28E0
sub_081D28E0: @ 0x081D28E0
	push {r4, r5, lr}
	ldr r2, _081D28FC
	ldr r4, [r2]
	ldr r5, [r2, #4]
	ldr r2, _081D2900
	ldr r3, [r2, #4]
	ldr r2, [r2]
	str r4, [r0]
	str r5, [r0, #4]
	str r2, [r1]
	str r3, [r1, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D28FC: .4byte 0x085FA910
_081D2900: .4byte 0x085FA918
	thumb_func_end sub_081D28E0

	thumb_func_start sub_081D2904
sub_081D2904: @ 0x081D2904
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _081D2920
	movs r0, #0
	strh r0, [r1, #0x30]
	adds r0, r1, #0
	bl sub_081D2A38
_081D2920:
	pop {r0}
	bx r0
	thumb_func_end sub_081D2904

	thumb_func_start sub_081D2924
sub_081D2924: @ 0x081D2924
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081D293C
	movs r0, #0
	strh r0, [r2, #0x30]
	ldr r0, _081D2940
	str r0, [r2, #0x1c]
_081D293C:
	pop {r0}
	bx r0
	.align 2, 0
_081D2940: .4byte 0x081D2905
	thumb_func_end sub_081D2924

	thumb_func_start sub_081D2944
sub_081D2944: @ 0x081D2944
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081D2988
	adds r3, r1, r0
	cmp r3, #0
	beq _081D2990
	ldrh r1, [r3, #0x24]
	ldrh r2, [r3, #0x20]
	adds r1, r1, r2
	ldr r2, _081D298C
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r1, [r3, #0x26]
	ldrh r3, [r3, #0x22]
	adds r1, r1, r3
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	lsls r0, r0, #2
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r1
	b _081D29AE
	.align 2, 0
_081D2988: .4byte 0x020205AC
_081D298C: .4byte 0x085FA97C
_081D2990:
	ldr r1, _081D29B8
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x28
	strh r0, [r4, #0x20]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x68
_081D29AE:
	strh r0, [r4, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D29B8: .4byte 0x085FA97C
	thumb_func_end sub_081D2944

	thumb_func_start sub_081D29BC
sub_081D29BC: @ 0x081D29BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r5, #0
_081D29CE:
	lsls r0, r5, #2
	mov r1, r8
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, #0
	beq _081D2A20
	strh r5, [r0, #0x2e]
	ldr r1, [r4]
	lsls r0, r5, #4
	adds r0, #1
	strh r0, [r1, #0x30]
	ldr r0, [r4]
	strh r6, [r0, #0x32]
	ldr r0, [r4]
	strh r5, [r0, #0x34]
	cmp r7, #0
	beq _081D29F4
	cmp r6, #9
	beq _081D2A00
_081D29F4:
	ldr r1, [r4]
	ldr r0, _081D29FC
	str r0, [r1, #0x1c]
	b _081D2A20
	.align 2, 0
_081D29FC: .4byte 0x081D2B95
_081D2A00:
	ldr r0, [r4]
	bl sub_081D2944
	ldr r0, [r4]
	bl sub_081D2C18
	ldr r2, [r4]
	ldr r0, _081D2A34
	str r0, [r2, #0x1c]
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r3, #5
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strb r0, [r2]
_081D2A20:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #9
	bls _081D29CE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D2A34: .4byte 0x081D2925
	thumb_func_end sub_081D29BC

	thumb_func_start sub_081D2A38
sub_081D2A38: @ 0x081D2A38
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r3, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	adds r0, #1
	cmp r3, r0
	bge _081D2A84
	ldr r5, _081D2A8C
	movs r7, #0x1c
	adds r7, r7, r5
	mov ip, r7
	ldr r6, _081D2A90
_081D2A58:
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r1, r5
	movs r7, #0x2e
	ldrsh r0, [r2, r7]
	lsls r0, r0, #4
	adds r0, #1
	strh r0, [r2, #0x30]
	add r1, ip
	str r6, [r1]
	ldrh r0, [r2, #0x38]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	adds r0, #1
	cmp r3, r0
	blt _081D2A58
_081D2A84:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D2A8C: .4byte 0x020205AC
_081D2A90: .4byte 0x081D2B95
	thumb_func_end sub_081D2A38

	thumb_func_start sub_081D2A94
sub_081D2A94: @ 0x081D2A94
	push {lr}
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_081D2A9C:
	lsls r0, r1, #2
	adds r0, r0, r2
	str r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	bls _081D2A9C
	pop {r0}
	bx r0
	thumb_func_end sub_081D2A94

	thumb_func_start sub_081D2AB0
sub_081D2AB0: @ 0x081D2AB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	movs r0, #0
	mov sb, r0
	lsrs r7, r2, #0x18
	movs r5, #0
	adds r0, r7, #1
	cmp sb, r0
	bge _081D2B2E
_081D2AD2:
	ldr r0, _081D2B18
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r6, r3, #0
	cmp r3, #0x40
	beq _081D2B2E
	lsls r0, r5, #2
	mov r1, r8
	adds r4, r0, r1
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, _081D2B1C
	adds r0, r0, r1
	str r0, [r4]
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	mov r1, sl
	strh r1, [r0, #0x36]
	cmp r5, #0
	beq _081D2B20
	subs r0, r4, #4
	ldr r0, [r0]
	strh r3, [r0, #0x38]
	b _081D2B22
	.align 2, 0
_081D2B18: .4byte 0x085FA964
_081D2B1C: .4byte 0x020205AC
_081D2B20:
	mov sb, r6
_081D2B22:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r7, #1
	cmp r5, r0
	blt _081D2AD2
_081D2B2E:
	lsls r0, r7, #2
	add r0, r8
	ldr r0, [r0]
	mov r1, sb
	strh r1, [r0, #0x38]
	adds r0, r7, #0
	movs r1, #1
	mov r2, r8
	bl sub_081D29BC
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D2AB0

	thumb_func_start sub_081D2B50
sub_081D2B50: @ 0x081D2B50
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_081D2B56:
	cmp r5, #9
	bhi _081D2B74
	lsls r0, r5, #2
	adds r4, r0, r6
	ldr r0, [r4]
	cmp r0, #0
	beq _081D2B74
	bl DestroySprite
	movs r0, #0
	str r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _081D2B56
_081D2B74:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D2B50

	thumb_func_start nullsub_79
nullsub_79: @ 0x081D2B7C
	push {lr}
	bl sub_081D2B50
	movs r0, #0x68
	bl FreeSpriteTilesByTag
	movs r0, #0x68
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end nullsub_79

	thumb_func_start sub_081D2B94
sub_081D2B94: @ 0x081D2B94
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _081D2BC2
	subs r0, r1, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081D2C0C
	adds r0, r4, #0
	movs r1, #0
	bl SeekSpriteAnim
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_081D2BC2:
	adds r0, r4, #0
	bl sub_081D2944
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081D2C0C
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _081D2C08
	cmp r1, #9
	bne _081D2C00
	adds r0, r4, #0
	bl sub_081D2C18
	ldr r0, _081D2BFC
	b _081D2C0A
	.align 2, 0
_081D2BFC: .4byte 0x081D2925
_081D2C00:
	ldr r0, _081D2C04
	b _081D2C0A
	.align 2, 0
_081D2C04: .4byte 0x081D2905
_081D2C08:
	ldr r0, _081D2C14
_081D2C0A:
	str r0, [r4, #0x1c]
_081D2C0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D2C14: .4byte 0x08007141
	thumb_func_end sub_081D2B94

	thumb_func_start sub_081D2C18
sub_081D2C18: @ 0x081D2C18
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x38]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r5, #0
	movs r2, #0x32
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r5, r0
	bge _081D2C66
	movs r0, #5
	rsbs r0, r0, #0
	adds r7, r0, #0
_081D2C34:
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	ldr r0, _081D2C6C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0
	bl SeekSpriteAnim
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	ands r0, r7
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r2, #0x32
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r5, r0
	blt _081D2C34
_081D2C66:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D2C6C: .4byte 0x020205AC
	thumb_func_end sub_081D2C18

	thumb_func_start DrawLevelUpWindowPg1
DrawLevelUpWindowPg1: @ 0x081D2C70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r3, [sp, #0x4c]
	ldr r0, [sp, #0x50]
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r4, #4
	orrs r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r3, [sp, #0x28]
	bl FillWindowPixelBuffer
	add r2, sp, #0xc
	ldrh r0, [r5]
	ldrh r1, [r6]
	subs r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r5, #2]
	ldrh r1, [r6, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	ldrh r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r2, #4]
	ldrh r0, [r5, #8]
	ldrh r1, [r6, #8]
	subs r0, r0, r1
	strh r0, [r2, #6]
	ldrh r0, [r5, #0xa]
	ldrh r1, [r6, #0xa]
	subs r0, r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r5, #6]
	ldrh r1, [r6, #6]
	subs r0, r0, r1
	strh r0, [r2, #0xa]
	add r0, sp, #0x24
	strb r4, [r0]
	ldr r3, [sp, #0x28]
	strb r3, [r0, #1]
	mov r1, sb
	strb r1, [r0, #2]
	movs r7, #0
	mov sl, r0
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	add r6, sp, #0x18
_081D2CFA:
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r1, sl
	str r1, [sp]
	mov r0, sb
	str r0, [sp, #4]
	ldr r1, _081D2DA8
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	mov r0, r8
	movs r1, #1
	movs r2, #0
	adds r3, r5, #0
	bl AddTextPrinterParameterized3
	lsls r0, r7, #1
	mov r4, sp
	adds r4, r4, r0
	adds r4, #0xc
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, _081D2DAC
	cmp r0, #0
	blt _081D2D34
	ldr r1, _081D2DB0
_081D2D34:
	adds r0, r6, #0
	bl StringCopy
	mov r0, sl
	str r0, [sp]
	mov r1, sb
	str r1, [sp, #4]
	str r6, [sp, #8]
	mov r0, r8
	movs r1, #1
	movs r2, #0x36
	adds r3, r5, #0
	bl AddTextPrinterParameterized3
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _081D2D5C
	rsbs r0, r1, #0
_081D2D5C:
	movs r4, #8
	cmp r0, #9
	bgt _081D2D64
	movs r4, #0x10
_081D2D64:
	cmp r1, #0
	bge _081D2D6A
	rsbs r1, r1, #0
_081D2D6A:
	adds r0, r6, #0
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	adds r2, r4, #0
	adds r2, #0x36
	mov r1, sl
	str r1, [sp]
	mov r0, sb
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, r8
	movs r1, #1
	adds r3, r5, #0
	bl AddTextPrinterParameterized3
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #5
	bls _081D2CFA
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D2DA8: .4byte 0x085FA9CC
_081D2DAC: .4byte 0x085FA9C7
_081D2DB0: .4byte 0x085FA9C4
	thumb_func_end DrawLevelUpWindowPg1

	thumb_func_start DrawLevelUpWindowPg2
DrawLevelUpWindowPg2: @ 0x081D2DB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r2, [sp, #0x4c]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r4, #4
	orrs r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r2, [sp, #0x28]
	bl FillWindowPixelBuffer
	add r1, sp, #0xc
	ldrh r0, [r5]
	strh r0, [r1]
	ldrh r0, [r5, #2]
	strh r0, [r1, #2]
	ldrh r0, [r5, #4]
	strh r0, [r1, #4]
	ldrh r0, [r5, #8]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0xa]
	strh r0, [r1, #8]
	ldrh r0, [r5, #6]
	strh r0, [r1, #0xa]
	add r0, sp, #0x24
	strb r4, [r0]
	strb r6, [r0, #1]
	ldr r2, [sp, #0x28]
	strb r2, [r0, #2]
	movs r6, #0
	add r1, sp, #0x18
	mov sb, r1
	mov r7, r8
	mov sl, r0
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
_081D2E1E:
	lsls r1, r6, #1
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0xc
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r5, #3
	cmp r0, #0x63
	bgt _081D2E38
	movs r5, #1
	cmp r0, #9
	ble _081D2E38
	movs r5, #2
_081D2E38:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r0, sb
	movs r2, #0
	adds r3, r5, #0
	bl ConvertIntToDecimalStringN
	movs r4, #3
	subs r4, r4, r5
	lsls r4, r4, #0x13
	lsrs r4, r4, #0x10
	lsls r5, r6, #4
	subs r5, r5, r6
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, sl
	str r0, [sp]
	mov r1, r8
	str r1, [sp, #4]
	ldr r1, _081D2EB4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	movs r2, #0
	adds r3, r5, #0
	bl AddTextPrinterParameterized3
	adds r4, #0x36
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r2, sl
	str r2, [sp]
	mov r0, r8
	str r0, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	adds r2, r4, #0
	adds r3, r5, #0
	bl AddTextPrinterParameterized3
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	bls _081D2E1E
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D2EB4: .4byte 0x085FA9CC
	thumb_func_end DrawLevelUpWindowPg2

	thumb_func_start GetMonLevelUpWindowStats
GetMonLevelUpWindowStats: @ 0x081D2EB8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #0x3a
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0x3b
	bl GetMonData
	strh r0, [r5, #2]
	adds r0, r4, #0
	movs r1, #0x3c
	bl GetMonData
	strh r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0x3d
	bl GetMonData
	strh r0, [r5, #6]
	adds r0, r4, #0
	movs r1, #0x3e
	bl GetMonData
	strh r0, [r5, #8]
	adds r0, r4, #0
	movs r1, #0x3f
	bl GetMonData
	strh r0, [r5, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetMonLevelUpWindowStats

