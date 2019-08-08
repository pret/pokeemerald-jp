.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CallBattlePalaceFunction
CallBattlePalaceFunction: @ 0x08195560
	push {lr}
	ldr r1, _08195578
	ldr r0, _0819557C
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end CallBattlePalaceFunction

	thumb_func_start sub_08195574
sub_08195574: @ 0x08195574
	bx r0
	.align 2, 0
_08195578: .4byte 0x085D68CC
_0819557C: .4byte 0x02037280
	thumb_func_end sub_08195574

	thumb_func_start sub_08195580
sub_08195580: @ 0x08195580
	push {r4, r5, r6, r7, lr}
	ldr r4, _08195614
	ldr r0, [r4]
	ldr r1, _08195618
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _0819561C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r4]
	ldr r2, _08195620
	adds r0, r0, r2
	movs r6, #0
	strb r6, [r0]
	ldr r1, [r4]
	adds r2, #0xa
	adds r0, r1, r2
	strh r6, [r0]
	ldr r0, _08195618
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	ldr r2, _08195618
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r4, [r4]
	ldr r0, _08195624
	adds r3, r4, r0
	ldr r2, _08195628
	lsls r1, r5, #2
	lsls r0, r7, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r0, [r3]
	ldr r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _081955F2
	lsls r0, r5, #1
	lsls r1, r7, #2
	adds r0, r0, r1
	ldr r2, _0819562C
	adds r1, r4, r2
	adds r1, r1, r0
	strh r6, [r1]
_081955F2:
	ldr r0, _08195630
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	ldr r0, _08195634
	strh r6, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08195614: .4byte 0x03005AF0
_08195618: .4byte 0x00000CA9
_0819561C: .4byte 0x000040CE
_08195620: .4byte 0x00000CA8
_08195624: .4byte 0x00000CDC
_08195628: .4byte 0x085D6914
_0819562C: .4byte 0x00000DC8
_08195630: .4byte 0x03005AEC
_08195634: .4byte 0x0203886A
	thumb_func_end sub_08195580

	thumb_func_start sub_08195638
sub_08195638: @ 0x08195638
	push {r4, r5, r6, r7, lr}
	ldr r5, _08195664
	ldr r0, [r5]
	ldr r1, _08195668
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r7, r0, #0x1e
	ldr r0, _0819566C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08195670
	ldrh r0, [r0]
	cmp r0, #1
	beq _08195690
	cmp r0, #1
	bgt _08195674
	cmp r0, #0
	beq _0819567A
	b _081956D0
	.align 2, 0
_08195664: .4byte 0x03005AF0
_08195668: .4byte 0x00000CA9
_0819566C: .4byte 0x000040CE
_08195670: .4byte 0x02037282
_08195674:
	cmp r0, #2
	beq _081956B0
	b _081956D0
_0819567A:
	ldr r0, _08195688
	ldr r1, [r5]
	ldr r2, _0819568C
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r0]
	b _081956D0
	.align 2, 0
_08195688: .4byte 0x02037290
_0819568C: .4byte 0x00000DC6
_08195690:
	ldr r3, _081956A8
	ldr r0, [r5]
	lsls r1, r7, #1
	lsls r2, r6, #2
	adds r1, r1, r2
	ldr r2, _081956AC
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
	b _081956D0
	.align 2, 0
_081956A8: .4byte 0x02037290
_081956AC: .4byte 0x00000DC8
_081956B0:
	ldr r4, _081956D8
	ldr r2, [r5]
	ldr r0, _081956DC
	adds r2, r2, r0
	ldr r3, _081956E0
	lsls r0, r7, #2
	lsls r1, r6, #3
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	strh r0, [r4]
_081956D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081956D8: .4byte 0x02037290
_081956DC: .4byte 0x00000CDC
_081956E0: .4byte 0x085D6914
	thumb_func_end sub_08195638

	thumb_func_start sub_081956E4
sub_081956E4: @ 0x081956E4
	push {r4, r5, r6, lr}
	ldr r6, _08195710
	ldr r0, [r6]
	ldr r1, _08195714
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _08195718
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0819571C
	ldrh r0, [r0]
	cmp r0, #1
	beq _0819573C
	cmp r0, #1
	bgt _08195720
	cmp r0, #0
	beq _08195726
	b _081957A0
	.align 2, 0
_08195710: .4byte 0x03005AF0
_08195714: .4byte 0x00000CA9
_08195718: .4byte 0x000040CE
_0819571C: .4byte 0x02037282
_08195720:
	cmp r0, #2
	beq _0819575C
	b _081957A0
_08195726:
	ldr r0, [r6]
	ldr r1, _08195734
	ldrh r1, [r1]
	ldr r2, _08195738
	adds r0, r0, r2
	strh r1, [r0]
	b _081957A0
	.align 2, 0
_08195734: .4byte 0x02037284
_08195738: .4byte 0x00000DC6
_0819573C:
	ldr r2, [r6]
	lsls r0, r5, #1
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r1, _08195754
	adds r2, r2, r1
	adds r2, r2, r0
	ldr r0, _08195758
	ldrh r0, [r0]
	strh r0, [r2]
	b _081957A0
	.align 2, 0
_08195754: .4byte 0x00000DC8
_08195758: .4byte 0x02037284
_0819575C:
	ldr r0, _0819577C
	ldrh r0, [r0]
	cmp r0, #0
	beq _08195788
	ldr r2, [r6]
	ldr r0, _08195780
	adds r2, r2, r0
	ldr r3, _08195784
	lsls r1, r5, #2
	lsls r0, r4, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r2]
	ldr r1, [r1]
	orrs r0, r1
	b _0819579E
	.align 2, 0
_0819577C: .4byte 0x02037284
_08195780: .4byte 0x00000CDC
_08195784: .4byte 0x085D6914
_08195788:
	ldr r2, [r6]
	ldr r1, _081957A8
	adds r2, r2, r1
	ldr r3, _081957AC
	lsls r1, r5, #2
	lsls r0, r4, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r2]
	ldr r1, [r1]
	ands r0, r1
_0819579E:
	str r0, [r2]
_081957A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081957A8: .4byte 0x00000CDC
_081957AC: .4byte 0x085D6924
	thumb_func_end sub_081956E4

	thumb_func_start sub_081957B0
sub_081957B0: @ 0x081957B0
	push {r4, lr}
	ldr r0, _081957EC
	bl VarGet
	lsls r0, r0, #0x10
	ldr r1, _081957F0
	ldr r2, [r1]
	ldr r3, _081957F4
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1d
	lsrs r0, r0, #0xe
	adds r1, r1, r0
	ldr r0, _081957F8
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	cmp r0, #0x31
	bhi _08195800
	ldr r4, _081957FC
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	strh r0, [r4]
	b _08195816
	.align 2, 0
_081957EC: .4byte 0x000040CE
_081957F0: .4byte 0x03005AF0
_081957F4: .4byte 0x00000CA9
_081957F8: .4byte 0x00000DC8
_081957FC: .4byte 0x02037290
_08195800:
	cmp r0, #0x62
	bhi _08195810
	ldr r1, _0819580C
	movs r0, #3
	b _08195814
	.align 2, 0
_0819580C: .4byte 0x02037290
_08195810:
	ldr r1, _0819581C
	movs r0, #4
_08195814:
	strh r0, [r1]
_08195816:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819581C: .4byte 0x02037290
	thumb_func_end sub_081957B0

	thumb_func_start sub_08195820
sub_08195820: @ 0x08195820
	push {r4, lr}
	ldr r4, _0819584C
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xff
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsrs r1, r1, #6
	strh r1, [r4]
	ldrh r0, [r4]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819584C: .4byte 0x0203886A
	thumb_func_end sub_08195820

	thumb_func_start sub_08195850
sub_08195850: @ 0x08195850
	push {lr}
	ldr r3, _08195870
	ldrh r1, [r3]
	ldr r0, _08195874
	cmp r1, r0
	bhi _0819586C
	ldr r2, _08195878
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0xc
	bl FrontierSpeechToString
_0819586C:
	pop {r0}
	bx r0
	.align 2, 0
_08195870: .4byte 0x0203886A
_08195874: .4byte 0x0000012B
_08195878: .4byte 0x0203B954
	thumb_func_end sub_08195850

	thumb_func_start sub_0819587C
sub_0819587C: @ 0x0819587C
	push {r4, r5, r6, r7, lr}
	ldr r4, _081958D0
	ldr r0, [r4]
	ldr r1, _081958D4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r7, r0, #0x1e
	ldr r0, _081958D8
	bl VarGet
	lsls r0, r0, #0x18
	ldr r4, [r4]
	lsls r1, r7, #1
	lsrs r5, r0, #0x16
	adds r1, r1, r5
	ldr r3, _081958DC
	adds r6, r4, r3
	adds r3, r6, r1
	ldrh r2, [r3]
	ldr r0, _081958E0
	cmp r2, r0
	bhi _081958CA
	adds r2, #1
	strh r2, [r3]
	movs r3, #0xdd
	lsls r3, r3, #4
	adds r0, r4, r3
	adds r1, r0, r1
	adds r0, r5, #0
	ldrh r3, [r1]
	cmp r7, r3
	bls _081958C0
	adds r0, #2
_081958C0:
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _081958CA
	strh r2, [r1]
_081958CA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081958D0: .4byte 0x03005AF0
_081958D4: .4byte 0x00000CA9
_081958D8: .4byte 0x000040CE
_081958DC: .4byte 0x00000DC8
_081958E0: .4byte 0x0000270E
	thumb_func_end sub_0819587C

	thumb_func_start sub_081958E4
sub_081958E4: @ 0x081958E4
	push {r4, lr}
	ldr r4, _08195918
	ldr r0, [r4]
	ldr r1, _0819591C
	ldrh r1, [r1]
	ldr r2, _08195920
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _08195924
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	bl sub_081A482C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08195918: .4byte 0x03005AF0
_0819591C: .4byte 0x02037282
_08195920: .4byte 0x00000CA8
_08195924: .4byte 0x00000CA9
	thumb_func_end sub_081958E4

	thumb_func_start sub_08195928
sub_08195928: @ 0x08195928
	push {r4, r5, lr}
	ldr r0, _08195970
	bl VarGet
	lsls r0, r0, #0x10
	ldr r4, _08195974
	ldr r2, [r4]
	ldr r3, _08195978
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1d
	lsrs r0, r0, #0xe
	adds r1, r1, r0
	ldr r0, _0819597C
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	cmp r0, #0x29
	bls _08195988
	bl Random
	ldr r4, [r4]
	ldr r5, _08195980
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #9
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r1, _08195984
	adds r4, r4, r1
	b _081959A6
	.align 2, 0
_08195970: .4byte 0x000040CE
_08195974: .4byte 0x03005AF0
_08195978: .4byte 0x00000CA9
_0819597C: .4byte 0x00000DC8
_08195980: .4byte 0x085D6900
_08195984: .4byte 0x00000DC6
_08195988:
	bl Random
	ldr r4, [r4]
	ldr r5, _081959B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r3, _081959B4
	adds r4, r4, r3
_081959A6:
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081959B0: .4byte 0x085D68F4
_081959B4: .4byte 0x00000DC6
	thumb_func_end sub_08195928

	thumb_func_start sub_081959B8
sub_081959B8: @ 0x081959B8
	push {r4, r5, lr}
	ldr r4, _081959F0
	ldr r0, [r4]
	ldr r1, _081959F4
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _08195A00
	ldr r0, [r4]
	ldr r1, _081959F4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _081959F8
	bl CopyItemName
	ldr r0, [r4]
	ldr r1, _081959F4
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081959FC
	strh r5, [r0]
	b _08195A06
	.align 2, 0
_081959F0: .4byte 0x03005AF0
_081959F4: .4byte 0x00000DC6
_081959F8: .4byte 0x02021C40
_081959FC: .4byte 0x02037290
_08195A00:
	ldr r1, _08195A0C
	movs r0, #0
	strh r0, [r1]
_08195A06:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08195A0C: .4byte 0x02037290
	thumb_func_end sub_081959B8

