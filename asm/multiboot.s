.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081BA3A8
sub_081BA3A8: @ 0x081BA3A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	bl sub_081BA8CC
	cmp r0, #0
	beq _081BA3BE
	b _081BA786
_081BA3BE:
	adds r0, r7, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls _081BA3D2
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b _081BA786
_081BA3D2:
	adds r1, r7, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _081BA3FC
	movs r0, #0
	strb r0, [r1]
	ldr r0, _081BA3F8
	ldrh r0, [r0]
	movs r5, #0xfc
	ands r5, r0
	cmp r5, #8
	beq _081BA3FC
	adds r0, r7, #0
	bl GetGlyphWidthFont6
	movs r0, #8
	eors r0, r5
	b _081BA788
	.align 2, 0
_081BA3F8: .4byte 0x04000128
_081BA3FC:
	ldrb r0, [r7, #0x18]
	cmp r0, #0xdf
	bls _081BA44E
	adds r0, r7, #0
	bl sub_081BA8E0
	adds r5, r0, #0
	cmp r5, #0
	beq _081BA410
	b _081BA788
_081BA410:
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _081BA42C
	ldrb r0, [r7, #0x18]
	cmp r0, #0xe1
	bls _081BA42C
	adds r0, r7, #0
	bl sub_081BA8CC
	cmp r0, #0
	bne _081BA42C
	b _081BA776
_081BA42C:
	adds r0, r7, #0
	bl sub_081BA8CC
	cmp r0, #0
	beq _081BA438
	b _081BA786
_081BA438:
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	bne _081BA448
	adds r0, r7, #0
	bl GetGlyphWidthFont6
	movs r0, #0x71
	b _081BA788
_081BA448:
	subs r0, #1
	strh r0, [r7, #0x16]
	b _081BA786
_081BA44E:
	ldrb r0, [r7, #0x18]
	cmp r0, #2
	bne _081BA456
	b _081BA58C
_081BA456:
	cmp r0, #2
	bgt _081BA464
	cmp r0, #0
	beq _081BA472
	cmp r0, #1
	beq _081BA52E
	b _081BA6C4
_081BA464:
	cmp r0, #0xd0
	bne _081BA46A
	b _081BA5D8
_081BA46A:
	cmp r0, #0xd1
	bne _081BA470
	b _081BA672
_081BA470:
	b _081BA6C4
_081BA472:
	movs r3, #0xe
	movs r5, #3
	ldr r0, _081BA4B8
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _081BA4BC
	ldrb r2, [r7, #0x1e]
	adds r6, r2, #0
	cmp r1, r0
	bne _081BA49A
	adds r4, r1, #0
	ldr r1, _081BA4C0
_081BA48A:
	asrs r3, r3, #1
	subs r1, #2
	subs r5, #1
	cmp r5, #0
	beq _081BA49A
	ldrh r0, [r1]
	cmp r0, r4
	beq _081BA48A
_081BA49A:
	movs r0, #0xe
	ands r3, r0
	strb r3, [r7, #0x1d]
	movs r5, #3
	ldr r0, _081BA4B8
	ldrh r0, [r0, #6]
	adds r4, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _081BA4C8
	ldr r0, _081BA4C4
	b _081BA4EE
	.align 2, 0
_081BA4B8: .4byte 0x04000120
_081BA4BC: .4byte 0x0000FFFF
_081BA4C0: .4byte 0x04000126
_081BA4C4: .4byte 0x00007208
_081BA4C8:
	subs r5, #1
	cmp r5, #0
	beq _081BA4F4
	lsls r0, r5, #1
	ldr r1, _081BA51C
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	adds r0, r2, #0
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _081BA4C8
	adds r0, r1, #0
	lsls r0, r5
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_081BA4EE:
	cmp r4, r0
	beq _081BA4C8
	movs r3, #0
_081BA4F4:
	adds r0, r3, #0
	ands r0, r6
	strb r0, [r7, #0x1e]
	cmp r3, #0
	bne _081BA504
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
_081BA504:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _081BA520
	ldrb r0, [r7, #0x1d]
	ldrb r2, [r7, #0x1e]
	cmp r0, r2
	beq _081BA526
	adds r0, r7, #0
	bl sub_081BA7E4
	b _081BA52E
	.align 2, 0
_081BA51C: .4byte 0x04000120
_081BA520:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
_081BA526:
	ldrb r1, [r7, #0x1e]
	movs r2, #0xc4
	lsls r2, r2, #7
	b _081BA62E
_081BA52E:
	adds r1, r7, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r5, #3
	mov ip, r1
	ldr r3, _081BA584
_081BA53C:
	lsls r0, r5, #1
	ldr r2, _081BA588
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r0, r4, #8
	subs r2, r5, #1
	cmp r0, #0x72
	bne _081BA566
	lsls r0, r2, #1
	adds r0, r0, r3
	strh r4, [r0]
	movs r0, #0xff
	ands r4, r0
	movs r0, #1
	lsls r0, r5
	cmp r4, r0
	bne _081BA566
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
_081BA566:
	adds r5, r2, #0
	cmp r5, #0
	bne _081BA53C
	ldrb r0, [r7, #0x1d]
	mov r1, ip
	ldrb r1, [r1]
	cmp r0, r1
	bne _081BA526
	movs r0, #2
	strb r0, [r7, #0x18]
	mov r2, ip
	ldrb r1, [r2]
	movs r2, #0xc2
	lsls r2, r2, #7
	b _081BA62E
	.align 2, 0
_081BA584: .4byte 0x03001298
_081BA588: .4byte 0x04000120
_081BA58C:
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	mov r4, ip
	movs r6, #1
	ldr r1, _081BA5D0
	mov sb, r1
	ldr r2, _081BA5D4
	mov r8, r2
_081BA5A0:
	ldrb r3, [r4]
	adds r0, r3, #0
	asrs r0, r5
	ands r0, r6
	subs r2, r5, #1
	cmp r0, #0
	beq _081BA5C6
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, sb
	ldrh r0, [r0]
	cmp r1, r0
	beq _081BA5C6
	adds r0, r6, #0
	lsls r0, r5
	eors r3, r0
	strb r3, [r4]
_081BA5C6:
	adds r5, r2, #0
	cmp r5, #0
	bne _081BA5A0
	b _081BA72C
	.align 2, 0
_081BA5D0: .4byte 0x03001298
_081BA5D4: .4byte 0x04000120
_081BA5D8:
	movs r3, #1
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	adds r6, r7, #0
	adds r6, #0x19
	ldr r1, _081BA63C
	mov r8, r1
_081BA5EA:
	lsls r0, r5, #1
	ldr r2, _081BA640
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	subs r2, r5, #1
	adds r0, r6, r2
	strb r4, [r0]
	mov r0, ip
	ldrb r1, [r0]
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _081BA61E
	asrs r0, r4, #8
	subs r0, #0x72
	cmp r0, #1
	bls _081BA612
	b _081BA77C
_081BA612:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r4, r0
	bne _081BA61E
	movs r3, #0
_081BA61E:
	adds r5, r2, #0
	cmp r5, #0
	bne _081BA5EA
	cmp r3, #0
	bne _081BA644
	ldrb r1, [r7, #0x1c]
	movs r2, #0xc6
	lsls r2, r2, #7
_081BA62E:
	adds r0, r2, #0
	orrs r1, r0
	adds r0, r7, #0
	bl sub_081BA798
	b _081BA788
	.align 2, 0
_081BA63C: .4byte 0x03001298
_081BA640: .4byte 0x04000120
_081BA644:
	movs r0, #0xd1
	strb r0, [r7, #0x18]
	movs r3, #0x11
	movs r5, #3
	adds r1, r6, #2
_081BA64E:
	ldrb r0, [r1]
	adds r3, r3, r0
	subs r1, #1
	subs r5, #1
	cmp r5, #0
	bne _081BA64E
	strb r3, [r7, #0x14]
	movs r0, #0xff
	ands r3, r0
	movs r1, #0xc8
	lsls r1, r1, #7
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r7, #0
	adds r1, r3, #0
	bl sub_081BA798
	b _081BA788
_081BA672:
	movs r5, #3
	movs r2, #0x49
	ldrb r1, [r2, r7]
	ldr r2, _081BA6B0
	movs r3, #1
_081BA67C:
	ldrh r0, [r2]
	adds r4, r0, #0
	adds r0, r1, #0
	asrs r0, r5
	ands r0, r3
	cmp r0, #0
	beq _081BA690
	asrs r0, r4, #8
	cmp r0, #0x73
	bne _081BA77C
_081BA690:
	subs r2, #2
	subs r5, #1
	cmp r5, #0
	bne _081BA67C
	adds r0, r7, #0
	bl MultiBoot
	adds r5, r0, #0
	cmp r5, #0
	bne _081BA6B4
	movs r0, #0xe0
	strb r0, [r7, #0x18]
	adds r0, #0xb0
	strh r0, [r7, #0x16]
	b _081BA786
	.align 2, 0
_081BA6B0: .4byte 0x04000126
_081BA6B4:
	adds r0, r7, #0
	bl GetGlyphWidthFont6
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b _081BA788
_081BA6C4:
	movs r5, #3
	movs r2, #0x49
	adds r2, r2, r7
	mov ip, r2
	mov r8, ip
	movs r0, #1
	mov sb, r0
_081BA6D2:
	mov r1, r8
	ldrb r6, [r1]
	adds r0, r6, #0
	asrs r0, r5
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _081BA70C
	lsls r0, r5, #1
	ldr r1, _081BA728
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r2, r4, #8
	ldrb r0, [r7, #0x18]
	lsrs r0, r0, #1
	movs r1, #0x62
	subs r1, r1, r0
	mov r3, sb
	lsls r3, r5
	cmp r2, r1
	bne _081BA706
	movs r0, #0xff
	ands r4, r0
	cmp r4, r3
	beq _081BA70C
_081BA706:
	eors r6, r3
	mov r2, r8
	strb r6, [r2]
_081BA70C:
	subs r5, #1
	cmp r5, #0
	bne _081BA6D2
	ldrb r0, [r7, #0x18]
	cmp r0, #0xc4
	bne _081BA72C
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	strb r0, [r7, #0x1e]
	strb r5, [r7, #0x18]
	b _081BA526
	.align 2, 0
_081BA728: .4byte 0x04000120
_081BA72C:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _081BA73E
	adds r0, r7, #0
	bl GetGlyphWidthFont6
	movs r0, #0x50
	b _081BA788
_081BA73E:
	ldrb r0, [r7, #0x18]
	adds r0, #2
	strb r0, [r7, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _081BA74E
	b _081BA526
_081BA74E:
	ldrb r0, [r7, #0x18]
	ldr r1, [r7, #0x28]
	adds r0, r0, r1
	subs r1, r0, #3
	ldrb r2, [r1]
	lsls r2, r2, #8
	subs r0, #4
	ldrb r1, [r0]
	orrs r1, r2
	adds r0, r7, #0
	bl sub_081BA798
	adds r5, r0, #0
	cmp r5, #0
	bne _081BA788
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _081BA786
_081BA776:
	bl sub_081BA9E4
	b _081BA3D2
_081BA77C:
	adds r0, r7, #0
	bl GetGlyphWidthFont6
	movs r0, #0x60
	b _081BA788
_081BA786:
	movs r0, #0
_081BA788:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081BA3A8

	thumb_func_start sub_081BA798
sub_081BA798: @ 0x081BA798
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _081BA7C4
	ldrh r0, [r3]
	movs r4, #0x8c
	ands r4, r0
	cmp r4, #8
	bne _081BA7D0
	ldr r0, _081BA7C8
	strh r1, [r0]
	ldr r1, _081BA7CC
	adds r0, r1, #0
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b _081BA7DC
	.align 2, 0
_081BA7C4: .4byte 0x04000128
_081BA7C8: .4byte 0x0400012A
_081BA7CC: .4byte 0x00002083
_081BA7D0:
	adds r0, r2, #0
	bl GetGlyphWidthFont6
	movs r0, #8
	eors r4, r0
	adds r0, r4, #0
_081BA7DC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081BA798

	thumb_func_start sub_081BA7E4
sub_081BA7E4: @ 0x081BA7E4
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _081BA7F6
	adds r0, r1, #0
	bl GetGlyphWidthFont6
	b _081BA802
_081BA7F6:
	adds r2, r1, #0
	adds r2, #0x4a
	strb r0, [r2]
	strb r0, [r1, #0x1e]
	movs r0, #1
	strb r0, [r1, #0x18]
_081BA802:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081BA7E4

	thumb_func_start sub_081BA808
sub_081BA808: @ 0x081BA808
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r3, #0
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _081BA844
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _081BA844
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _081BA844
	str r6, [r4, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, _081BA84C
	cmp r1, r0
	bls _081BA850
_081BA844:
	adds r0, r4, #0
	bl GetGlyphWidthFont6
	b _081BA8C4
	.align 2, 0
_081BA84C: .4byte 0x0003FF00
_081BA850:
	adds r0, r6, r2
	str r0, [r4, #0x24]
	lsls r1, r7, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi _081BA8B0
	lsls r0, r0, #2
	ldr r1, _081BA870
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BA870: .4byte 0x081BA874
_081BA874: @ jump table
	.4byte _081BA898 @ case 0
	.4byte _081BA898 @ case 1
	.4byte _081BA898 @ case 2
	.4byte _081BA898 @ case 3
	.4byte _081BA8A2 @ case 4
	.4byte _081BA8A8 @ case 5
	.4byte _081BA8A8 @ case 6
	.4byte _081BA8A8 @ case 7
	.4byte _081BA8A8 @ case 8
_081BA898:
	lsls r3, r5, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b _081BA8AE
_081BA8A2:
	movs r0, #0x38
	adds r3, r5, #0
	b _081BA8AE
_081BA8A8:
	lsls r3, r5, #3
	asrs r0, r2, #0x18
	subs r0, #1
_081BA8AE:
	orrs r3, r0
_081BA8B0:
	movs r0, #0x3f
	ands r3, r0
	lsls r0, r3, #1
	movs r2, #0x7f
	rsbs r2, r2, #0
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r4, #0x1c]
	movs r0, #0xd0
	strb r0, [r4, #0x18]
_081BA8C4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081BA808

	thumb_func_start sub_081BA8CC
sub_081BA8CC: @ 0x081BA8CC
	push {lr}
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq _081BA8D8
	movs r0, #0
	b _081BA8DA
_081BA8D8:
	movs r0, #1
_081BA8DA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081BA8CC

	thumb_func_start sub_081BA8E0
sub_081BA8E0: @ 0x081BA8E0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq _081BA8FC
	cmp r0, #0xe0
	blt _081BA90C
	cmp r0, #0xe8
	bgt _081BA90C
	cmp r0, #0xe7
	blt _081BA90C
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b _081BA96C
_081BA8FC:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b _081BA95E
_081BA90C:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, _081BA968
_081BA914:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _081BA928
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _081BA8FC
_081BA928:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _081BA914
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne _081BA956
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	ldrb r1, [r1]
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3, #4]
	lsls r1, r1, #5
	str r1, [r3]
_081BA956:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
_081BA95C:
	ldrh r1, [r3]
_081BA95E:
	adds r0, r3, #0
	bl sub_081BA798
	b _081BA9C4
	.align 2, 0
_081BA968: .4byte 0x04000126
_081BA96C:
	lsls r0, r4, #1
	ldr r1, _081BA9B4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _081BA988
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _081BA9B8
_081BA988:
	subs r4, #1
	cmp r4, #0
	bne _081BA96C
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _081BA9C2
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	ldrb r1, [r1]
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3]
	str r1, [r3, #4]
	b _081BA95C
	.align 2, 0
_081BA9B4: .4byte 0x04000120
_081BA9B8:
	adds r0, r3, #0
	bl GetGlyphWidthFont6
	movs r0, #0x71
	b _081BA9C4
_081BA9C2:
	movs r0, #0
_081BA9C4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081BA8E0

	thumb_func_start sub_081BA9CC
sub_081BA9CC: @ 0x081BA9CC
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq _081BA9DE
	movs r1, #0xd
	cmp r2, #8
	beq _081BA9DE
	movs r1, #4
_081BA9DE:
	subs r0, r0, r1
	bgt _081BA9DE
	bx lr
	thumb_func_end sub_081BA9CC

	thumb_func_start sub_081BA9E4
sub_081BA9E4: @ 0x081BA9E4
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _081BAA18
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081BAA08
	ldr r5, _081BAA1C
	movs r4, #0x80
_081BA9F8:
	adds r2, #1
	cmp r2, r5
	bgt _081BAA08
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _081BA9F8
_081BAA08:
	movs r0, #0x96
	lsls r0, r0, #2
	bl sub_081BA9CC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081BAA18: .4byte 0x04000128
_081BAA1C: .4byte 0x0000795C
	thumb_func_end sub_081BA9E4

