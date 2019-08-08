.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08145420
sub_08145420: @ 0x08145420
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r0, #0
	mov r8, r0
	ldr r0, _08145444
	ldrb r0, [r0]
	cmp r0, #1
	beq _081454C4
	cmp r0, #1
	bgt _08145448
	cmp r0, #0
	beq _0814544E
	b _08145516
	.align 2, 0
_08145444: .4byte 0x03005F2C
_08145448:
	cmp r0, #2
	beq _08145500
	b _08145516
_0814544E:
	ldr r5, _081454B8
	ldr r0, [r5]
	cmp r0, #0
	bne _0814546A
	movs r0, #0x1c
	bl AllocZeroed
	str r0, [r5]
	ldr r4, _081454BC
	adds r0, r7, #0
	movs r1, #7
	bl GetWindowAttribute
	str r0, [r4]
_0814546A:
	ldr r1, [r5]
	ldrh r0, [r6]
	movs r2, #0
	strh r0, [r1, #0x14]
	ldrb r0, [r6, #5]
	strb r0, [r1, #0x16]
	ldr r0, [r5]
	strb r2, [r0, #0x1a]
	ldr r0, [r5]
	strb r2, [r0, #0x1b]
	ldr r0, [r5]
	strb r2, [r0, #0x10]
	ldr r1, [r5]
	movs r0, #0x1c
	strb r0, [r1, #0x12]
	ldr r0, [r5]
	strb r2, [r0, #0x11]
	ldrb r1, [r6, #4]
	lsls r1, r1, #0x13
	rsbs r1, r1, #0
	asrs r1, r1, #0x10
	adds r0, r7, #0
	movs r2, #1
	bl sub_081458F0
	movs r4, #0
_0814549E:
	adds r0, r7, #0
	ldr r1, _081454C0
	movs r2, #0x20
	adds r3, r4, #0
	bl CopyToWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xdf
	bls _0814549E
	b _081454EC
	.align 2, 0
_081454B8: .4byte 0x0203A85C
_081454BC: .4byte 0x0203A860
_081454C0: .4byte 0x085987C4
_081454C4:
	movs r4, #0
	ldr r1, _081454F8
	ldr r0, [r1]
	ldrb r0, [r0, #0x16]
	lsls r0, r0, #3
	cmp r8, r0
	bge _081454EC
	adds r5, r1, #0
_081454D4:
	adds r0, r4, #0
	movs r1, #0
	bl sub_08145774
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [r5]
	ldrb r0, [r0, #0x16]
	lsls r0, r0, #3
	cmp r4, r0
	blt _081454D4
_081454EC:
	ldr r1, _081454FC
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08145516
	.align 2, 0
_081454F8: .4byte 0x0203A85C
_081454FC: .4byte 0x03005F2C
_08145500:
	adds r0, r7, #0
	bl sub_081458E0
	ldr r0, _08145524
	ldrb r1, [r6, #3]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadPalette
	movs r0, #1
	mov r8, r0
_08145516:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08145524: .4byte 0x085987A4
	thumb_func_end sub_08145420

	thumb_func_start sub_08145528
sub_08145528: @ 0x08145528
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_081458E0
	adds r0, r4, #0
	bl sub_08145714
	ldr r2, _0814556C
	ldr r1, [r2]
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _0814554A
	subs r0, #1
	strb r0, [r1, #0x1b]
_0814554A:
	ldr r1, [r2]
	ldrb r0, [r1, #0x1a]
	cmp r0, #0
	beq _08145570
	subs r0, #1
	strb r0, [r1, #0x1a]
	ldr r1, [r2]
	ldrb r0, [r1, #0x1a]
	cmp r0, #0
	bne _08145570
	ldrh r0, [r1, #0x18]
	bl sub_08145654
	bl sub_081456D8
	b _081455F6
	.align 2, 0
_0814556C: .4byte 0x0203A85C
_08145570:
	ldr r5, _08145580
	ldr r0, [r5]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _08145584
	bl sub_081456D8
	b _081455F6
	.align 2, 0
_08145580: .4byte 0x0203A85C
_08145584:
	cmp r0, #1
	bne _0814558E
	bl sub_08145674
	b _081455B2
_0814558E:
	cmp r0, #8
	bls _081455B2
	bl IsCryPlaying
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081455A8
	bl sub_081456D8
	ldr r0, [r5]
	strb r4, [r0, #0x10]
	b _081455F6
_081455A8:
	bl sub_08145674
	ldr r1, [r5]
	movs r0, #1
	strb r0, [r1, #0x10]
_081455B2:
	ldr r5, _081455FC
	ldr r1, [r5]
	ldrb r4, [r1, #0x10]
	subs r4, #1
	lsls r4, r4, #0x19
	lsrs r4, r4, #0x18
	ldrb r0, [r1, #0x16]
	lsls r0, r0, #3
	ldrb r2, [r1, #0x11]
	adds r0, r0, r2
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r1, r4
	ldrb r1, [r1]
	bl sub_08145774
	ldr r1, [r5]
	ldrb r0, [r1, #0x16]
	lsls r0, r0, #3
	ldrb r2, [r1, #0x11]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #1
	adds r1, r1, r4
	ldrb r1, [r1]
	bl sub_08145774
	ldr r1, [r5]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
_081455F6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081455FC: .4byte 0x0203A85C
	thumb_func_end sub_08145528

	thumb_func_start sub_08145600
sub_08145600: @ 0x08145600
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	ldr r0, _08145640
	ldr r0, [r0, #4]
	cmp r0, #0
	bge _0814564E
	ldr r6, _08145644
	ldr r1, [r6]
	ldrb r0, [r1, #0x1a]
	cmp r0, #0
	bne _0814564E
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	bne _0814564E
	movs r0, #4
	strb r0, [r1, #0x1b]
	bl IsCryPlaying
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08145648
	bl StopCry
	ldr r1, [r6]
	strh r4, [r1, #0x18]
	movs r0, #2
	strb r0, [r1, #0x1a]
	b _0814564E
	.align 2, 0
_08145640: .4byte 0x030074D0
_08145644: .4byte 0x0203A85C
_08145648:
	adds r0, r5, #0
	bl sub_08145654
_0814564E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08145600

	thumb_func_start sub_08145654
sub_08145654: @ 0x08145654
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0x7d
	movs r3, #0xa
	bl PlayCry2
	ldr r0, _08145670
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08145670: .4byte 0x0203A85C
	thumb_func_end sub_08145654

	thumb_func_start sub_08145674
sub_08145674: @ 0x08145674
	push {r4, lr}
	ldr r3, _08145684
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #1
	bgt _0814568C
	ldr r0, _08145688
	b _081456A4
	.align 2, 0
_08145684: .4byte 0x03002FF0
_08145688: .4byte 0x03006470
_0814568C:
	ldr r2, _081456D0
	ldrb r1, [r2, #0xb]
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r0, #1
	subs r1, r1, r0
	ldr r0, [r2, #0x10]
	muls r0, r1, r0
	movs r1, #0xd4
	lsls r1, r1, #2
	adds r2, r2, r1
	adds r0, r0, r2
_081456A4:
	movs r1, #0xc6
	lsls r1, r1, #3
	adds r3, r0, r1
	movs r2, #0
	ldr r4, _081456D4
_081456AE:
	ldr r1, [r4]
	adds r1, r1, r2
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _081456AE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081456D0: .4byte 0x03006120
_081456D4: .4byte 0x0203A85C
	thumb_func_end sub_08145674

	thumb_func_start sub_081456D8
sub_081456D8: @ 0x081456D8
	push {r4, lr}
	ldr r4, _08145710
	ldr r1, [r4]
	ldrb r0, [r1, #0x16]
	lsls r0, r0, #3
	ldrb r1, [r1, #0x11]
	adds r0, r0, r1
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_08145774
	ldr r1, [r4]
	ldrb r0, [r1, #0x16]
	lsls r0, r0, #3
	ldrb r1, [r1, #0x11]
	adds r0, r0, r1
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_08145774
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145710: .4byte 0x0203A85C
	thumb_func_end sub_081456D8

	thumb_func_start sub_08145714
sub_08145714: @ 0x08145714
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _0814576C
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	adds r0, r6, #0
	movs r2, #0
	bl sub_081458F0
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	adds r0, #2
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	lsrs r0, r0, #3
	ldrb r1, [r1, #0x16]
	adds r1, r0, r1
	adds r2, r1, #1
	adds r0, r2, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #0
_0814574A:
	lsls r3, r4, #5
	adds r3, r5, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, r6, #0
	ldr r1, _08145770
	movs r2, #0x20
	bl CopyToWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _0814574A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814576C: .4byte 0x0203A85C
_08145770: .4byte 0x085987C4
	thumb_func_end sub_08145714

	thumb_func_start sub_08145774
sub_08145774: @ 0x08145774
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r7, r0, #0x18
	lsrs r4, r7, #0x18
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	bl __floatsidf
	ldr r3, _08145834
	ldr r2, _08145830
	bl __divdf3
	bl __fixunsdfsi
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x37
	bls _081457AA
	movs r5, #0x37
_081457AA:
	str r5, [sp]
	movs r6, #1
	ands r6, r4
	ldr r0, _08145838
	ldr r1, [r0]
	lsrs r7, r7, #0x1b
	mov r8, r7
	ldr r0, _0814583C
	ldrb r1, [r1, #0x12]
	cmp r5, r1
	bls _0814584C
	ldr r3, _08145840
	adds r0, r6, r0
	ldrb r0, [r0]
	mov sb, r0
	movs r7, #7
	ands r7, r4
_081457CC:
	lsls r1, r5, #1
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r2, _08145844
	adds r1, r1, r2
	mov r4, r8
	lsls r0, r4, #5
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, [r3]
	adds r1, r1, r2
	ldrb r0, [r1]
	mov r4, sb
	ands r0, r4
	strb r0, [r1]
	ldr r4, [r3]
	adds r4, r4, r2
	adds r0, r5, #0
	movs r1, #3
	str r3, [sp, #4]
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r1, r6, #4
	adds r0, r0, r1
	ldr r1, _08145848
	adds r0, r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r4]
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _08145838
	ldr r0, [r2]
	ldr r3, [sp, #4]
	ldrb r0, [r0, #0x12]
	cmp r5, r0
	bhi _081457CC
	b _081458B6
	.align 2, 0
_08145830: .4byte 0x40920000
_08145834: .4byte 0x00000000
_08145838: .4byte 0x0203A85C
_0814583C: .4byte 0x085987E4
_08145840: .4byte 0x0203A860
_08145844: .4byte 0x08598324
_08145848: .4byte 0x085987E6
_0814584C:
	lsls r3, r6, #4
	mov sl, r3
	ldr r7, _081458D0
	adds r0, r6, r0
	ldrb r0, [r0]
	mov sb, r0
	movs r6, #7
	ands r6, r4
_0814585C:
	lsls r1, r5, #1
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r4, _081458D4
	adds r1, r1, r4
	mov r2, r8
	lsls r0, r2, #5
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, [r7]
	adds r1, r1, r2
	ldrb r0, [r1]
	mov r3, sb
	ands r0, r3
	strb r0, [r1]
	ldr r4, [r7]
	adds r4, r4, r2
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	movs r1, #0xf
	ands r0, r1
	add r0, sl
	ldr r1, _081458D8
	adds r0, r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _081458DC
	ldr r0, [r2]
	ldrb r0, [r0, #0x12]
	cmp r5, r0
	blo _0814585C
_081458B6:
	ldr r3, _081458DC
	ldr r0, [r3]
	mov r4, sp
	ldrb r4, [r4]
	strb r4, [r0, #0x12]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081458D0: .4byte 0x0203A860
_081458D4: .4byte 0x08598324
_081458D8: .4byte 0x085987E6
_081458DC: .4byte 0x0203A85C
	thumb_func_end sub_08145774

	thumb_func_start sub_081458E0
sub_081458E0: @ 0x081458E0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_081458E0

	thumb_func_start sub_081458F0
sub_081458F0: @ 0x081458F0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	cmp r2, #0
	bne _08145914
	movs r1, #0
	bl GetWindowAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #8
	movs r2, #0
	bl ChangeBgX
_08145914:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081458F0

	thumb_func_start sub_0814591C
sub_0814591C: @ 0x0814591C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r0, #0
	mov r8, r0
	ldr r6, _0814593C
	ldrb r0, [r6]
	cmp r0, #0
	beq _08145940
	cmp r0, #1
	beq _0814597C
	b _081459C4
	.align 2, 0
_0814593C: .4byte 0x03005F2C
_08145940:
	ldr r5, _08145970
	ldr r0, [r5]
	cmp r0, #0
	bne _08145950
	movs r0, #8
	bl AllocZeroed
	str r0, [r5]
_08145950:
	ldr r1, _08145974
	adds r0, r7, #0
	movs r2, #0
	movs r3, #0
	bl CopyToWindowPixelBuffer
	ldr r0, _08145978
	ldrb r1, [r4, #3]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadPalette
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _081459C4
	.align 2, 0
_08145970: .4byte 0x0203A864
_08145974: .4byte 0x08597FEC
_08145978: .4byte 0x08597FCC
_0814597C:
	ldr r0, _081459D0
	bl LoadSpriteSheets
	ldr r0, _081459D4
	bl LoadSpritePalettes
	ldr r0, _081459D8
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x13
	movs r2, #0xa0
	lsls r2, r2, #0xe
	adds r1, r1, r2
	asrs r1, r1, #0x10
	ldrb r2, [r4, #5]
	lsls r2, r2, #0x13
	movs r3, #0xe0
	lsls r3, r3, #0xe
	adds r2, r2, r3
	asrs r2, r2, #0x10
	movs r3, #1
	bl CreateSprite
	ldr r2, _081459DC
	ldr r3, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	strh r0, [r3, #4]
	movs r1, #0x20
	strb r1, [r3]
	ldr r0, [r2]
	strb r1, [r0, #1]
	ldr r0, [r2]
	strb r4, [r0, #2]
	movs r0, #1
	mov r8, r0
_081459C4:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081459D0: .4byte 0x08598834
_081459D4: .4byte 0x08598844
_081459D8: .4byte 0x0859881C
_081459DC: .4byte 0x0203A864
	thumb_func_end sub_0814591C

	thumb_func_start sub_081459E0
sub_081459E0: @ 0x081459E0
	push {r4, r5, r6, lr}
	ldr r4, _08145A2C
	ldr r6, _08145A30
	ldr r0, [r6]
	ldrh r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeSpritePaletteByTag
	ldr r0, [r6]
	ldrh r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r4, _08145A34
	ldr r0, [r4]
	bl Free
	movs r5, #0
	str r5, [r4]
	ldr r0, [r6]
	bl Free
	str r5, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08145A2C: .4byte 0x020205AC
_08145A30: .4byte 0x0203A864
_08145A34: .4byte 0x0203A85C
	thumb_func_end sub_081459E0

	thumb_func_start sub_08145A38
sub_08145A38: @ 0x08145A38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r3, _08145A80
	ldr r4, _08145A84
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r2, [r0, #1]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #1]
	ldr r2, [r4]
	ldrh r1, [r2, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #6]
	ldr r0, _08145A88
	ldr r0, [r0]
	ldrb r1, [r0, #0x10]
	cmp r1, #2
	beq _08145AB4
	cmp r1, #2
	bgt _08145A8C
	cmp r1, #0
	beq _08145A92
	b _08145AFA
	.align 2, 0
_08145A80: .4byte 0x020205AC
_08145A84: .4byte 0x0203A864
_08145A88: .4byte 0x0203A85C
_08145A8C:
	cmp r1, #6
	beq _08145AEC
	b _08145AFA
_08145A92:
	movs r0, #0x20
	strb r0, [r2, #1]
	ldr r1, [r4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08145AAE
	ldrb r0, [r1, #2]
	add r4, sp, #0xc
	cmp r0, #1
	beq _08145AFC
	subs r0, #1
	strb r0, [r1, #2]
	b _08145AFC
_08145AAE:
	movs r0, #5
	strb r0, [r1, #2]
	b _08145AFA
_08145AB4:
	movs r3, #0
	movs r2, #0
	add r4, sp, #0xc
	adds r5, r0, #0
_08145ABC:
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r1, r0
	bge _08145ACA
	adds r3, r0, #0
_08145ACA:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xf
	bls _08145ABC
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xd0
	muls r0, r1, r0
	cmp r0, #0
	bge _08145AE2
	adds r0, #0xff
_08145AE2:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl sub_08145BF0
	b _08145AFC
_08145AEC:
	ldrb r1, [r0, #0xa]
	movs r0, #0xd0
	muls r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl sub_08145BF0
_08145AFA:
	add r4, sp, #0xc
_08145AFC:
	ldr r0, _08145B2C
	ldr r2, [r0]
	ldrb r5, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r3, #1
	ldrsb r3, [r2, r3]
	adds r6, r0, #0
	cmp r1, r3
	beq _08145B4E
	cmp r1, r3
	bge _08145B30
	ldrb r0, [r2, #2]
	adds r0, r5, r0
	strb r0, [r2]
	ldr r2, [r6]
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r3, [r2, #1]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r1, r0
	ble _08145B4E
	b _08145B46
	.align 2, 0
_08145B2C: .4byte 0x0203A864
_08145B30:
	ldrb r0, [r2, #2]
	subs r0, r5, r0
	strb r0, [r2]
	ldr r2, [r6]
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r3, [r2, #1]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bge _08145B4E
_08145B46:
	strb r3, [r2]
	ldr r1, [r6]
	movs r0, #0
	strb r0, [r1, #1]
_08145B4E:
	ldr r2, _08145BE4
	ldr r0, [sp, #4]
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	ldr r1, _08145BE8
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	orrs r0, r1
	str r0, [sp, #4]
	ldr r0, [r6]
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	ldr r0, [sp, #8]
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #8]
	add r0, sp, #4
	adds r1, r4, #0
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	add r0, sp, #0xc
	ldrh r1, [r0]
	ldrh r2, [r4, #2]
	ldrh r3, [r4, #4]
	ldrh r0, [r4, #6]
	str r0, [sp]
	movs r0, #0
	bl SetOamMatrix
	ldr r2, _08145BEC
	ldr r0, [r6]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x7f
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r2
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	cmp r0, #0
	bge _08145BC2
	adds r0, #0xff
_08145BC2:
	asrs r0, r0, #8
	strh r0, [r7, #0x24]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	cmp r0, #0
	bge _08145BD6
	adds r0, #0xff
_08145BD6:
	asrs r0, r0, #8
	strh r0, [r7, #0x26]
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08145BE4: .4byte 0xFFFF0000
_08145BE8: .4byte 0x0000FFFF
_08145BEC: .4byte 0x082FA8CC
	thumb_func_end sub_08145A38

	thumb_func_start sub_08145BF0
sub_08145BF0: @ 0x08145BF0
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x20
	subs r2, r1, r0
	movs r0, #0xff
	ands r2, r0
	adds r0, r2, #0
	subs r0, #0x21
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xbe
	bhi _08145C0C
	movs r2, #0xe0
_08145C0C:
	ldr r1, _08145C1C
	ldr r0, [r1]
	strb r2, [r0, #1]
	ldr r1, [r1]
	movs r0, #5
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_08145C1C: .4byte 0x0203A864
	thumb_func_end sub_08145BF0

