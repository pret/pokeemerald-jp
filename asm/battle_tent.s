.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081B9654
sub_081B9654: @ 0x081B9654
	push {lr}
	ldr r1, _081B966C
	ldr r0, _081B9670
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end sub_081B9654

	thumb_func_start sub_081B9668
sub_081B9668: @ 0x081B9668
	bx r0
	.align 2, 0
_081B966C: .4byte 0x085E196C
_081B9670: .4byte 0x02037280
	thumb_func_end sub_081B9668

	thumb_func_start sub_081B9674
sub_081B9674: @ 0x081B9674
	push {lr}
	ldr r1, _081B96B4
	ldr r0, [r1]
	ldr r2, _081B96B8
	adds r0, r0, r2
	movs r2, #0
	strb r2, [r0]
	ldr r1, [r1]
	ldr r3, _081B96BC
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _081B96C0
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _081B96C4
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	pop {r0}
	bx r0
	.align 2, 0
_081B96B4: .4byte 0x03005AF0
_081B96B8: .4byte 0x00000CA8
_081B96BC: .4byte 0x00000CB2
_081B96C0: .4byte 0x00000CA9
_081B96C4: .4byte 0x03005AEC
	thumb_func_end sub_081B9674

	thumb_func_start sub_081B96C8
sub_081B96C8: @ 0x081B96C8
	ldr r1, _081B96D8
	ldr r0, _081B96DC
	ldr r0, [r0]
	ldr r2, _081B96E0
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_081B96D8: .4byte 0x02037290
_081B96DC: .4byte 0x03005AF0
_081B96E0: .4byte 0x00000E6A
	thumb_func_end sub_081B96C8

	thumb_func_start sub_081B96E4
sub_081B96E4: @ 0x081B96E4
	ldr r0, _081B96F4
	ldr r0, [r0]
	ldr r1, _081B96F8
	ldrh r1, [r1]
	ldr r2, _081B96FC
	adds r0, r0, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_081B96F4: .4byte 0x03005AF0
_081B96F8: .4byte 0x02037284
_081B96FC: .4byte 0x00000E6A
	thumb_func_end sub_081B96E4

	thumb_func_start sub_081B9700
sub_081B9700: @ 0x081B9700
	push {r4, lr}
	ldr r4, _081B972C
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
_081B972C: .4byte 0x0203886A
	thumb_func_end sub_081B9700

	thumb_func_start sub_081B9730
sub_081B9730: @ 0x081B9730
	push {lr}
	ldr r3, _081B9750
	ldrh r1, [r3]
	ldr r0, _081B9754
	cmp r1, r0
	bhi _081B974C
	ldr r2, _081B9758
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0xc
	bl FrontierSpeechToString
_081B974C:
	pop {r0}
	bx r0
	.align 2, 0
_081B9750: .4byte 0x0203886A
_081B9754: .4byte 0x0000012B
_081B9758: .4byte 0x0203B954
	thumb_func_end sub_081B9730

	thumb_func_start sub_081B975C
sub_081B975C: @ 0x081B975C
	push {r4, lr}
	ldr r4, _081B9790
	ldr r0, [r4]
	ldr r1, _081B9794
	ldrh r1, [r1]
	ldr r2, _081B9798
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _081B979C
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
_081B9790: .4byte 0x03005AF0
_081B9794: .4byte 0x02037282
_081B9798: .4byte 0x00000CA8
_081B979C: .4byte 0x00000CA9
	thumb_func_end sub_081B975C

	thumb_func_start sub_081B97A0
sub_081B97A0: @ 0x081B97A0
	push {r4, r5, lr}
	ldr r0, _081B97BC
	ldr r4, [r0]
	ldr r5, _081B97C0
	bl Random
	ldrh r0, [r5]
	ldr r1, _081B97C4
	adds r4, r4, r1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B97BC: .4byte 0x03005AF0
_081B97C0: .4byte 0x085E198C
_081B97C4: .4byte 0x00000E6A
	thumb_func_end sub_081B97A0

	thumb_func_start sub_081B97C8
sub_081B97C8: @ 0x081B97C8
	push {r4, r5, lr}
	ldr r4, _081B9800
	ldr r0, [r4]
	ldr r1, _081B9804
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _081B9810
	ldr r0, [r4]
	ldr r1, _081B9804
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _081B9808
	bl CopyItemName
	ldr r0, [r4]
	ldr r1, _081B9804
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081B980C
	strh r5, [r0]
	b _081B9816
	.align 2, 0
_081B9800: .4byte 0x03005AF0
_081B9804: .4byte 0x00000E6A
_081B9808: .4byte 0x02021C40
_081B980C: .4byte 0x02037290
_081B9810:
	ldr r1, _081B981C
	movs r0, #0
	strh r0, [r1]
_081B9816:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B981C: .4byte 0x02037290
	thumb_func_end sub_081B97C8

	thumb_func_start sub_081B9820
sub_081B9820: @ 0x081B9820
	push {lr}
	ldr r1, _081B9838
	ldr r0, _081B983C
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end sub_081B9820

	thumb_func_start sub_081B9834
sub_081B9834: @ 0x081B9834
	bx r0
	.align 2, 0
_081B9838: .4byte 0x085E1990
_081B983C: .4byte 0x02037280
	thumb_func_end sub_081B9834

	thumb_func_start sub_081B9840
sub_081B9840: @ 0x081B9840
	push {lr}
	ldr r1, _081B9880
	ldr r0, [r1]
	ldr r2, _081B9884
	adds r0, r0, r2
	movs r2, #0
	strb r2, [r0]
	ldr r1, [r1]
	ldr r3, _081B9888
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _081B988C
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _081B9890
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	pop {r0}
	bx r0
	.align 2, 0
_081B9880: .4byte 0x03005AF0
_081B9884: .4byte 0x00000CA8
_081B9888: .4byte 0x00000CB2
_081B988C: .4byte 0x00000CA9
_081B9890: .4byte 0x03005AEC
	thumb_func_end sub_081B9840

	thumb_func_start sub_081B9894
sub_081B9894: @ 0x081B9894
	ldr r1, _081B98A4
	ldr r0, _081B98A8
	ldr r0, [r0]
	ldr r2, _081B98AC
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_081B98A4: .4byte 0x02037290
_081B98A8: .4byte 0x03005AF0
_081B98AC: .4byte 0x00000E6C
	thumb_func_end sub_081B9894

	thumb_func_start sub_081B98B0
sub_081B98B0: @ 0x081B98B0
	ldr r0, _081B98C0
	ldr r0, [r0]
	ldr r1, _081B98C4
	ldrh r1, [r1]
	ldr r2, _081B98C8
	adds r0, r0, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_081B98C0: .4byte 0x03005AF0
_081B98C4: .4byte 0x02037284
_081B98C8: .4byte 0x00000E6C
	thumb_func_end sub_081B98B0

	thumb_func_start sub_081B98CC
sub_081B98CC: @ 0x081B98CC
	push {r4, lr}
	ldr r4, _081B9900
	ldr r0, [r4]
	ldr r1, _081B9904
	ldrh r1, [r1]
	ldr r2, _081B9908
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _081B990C
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
_081B9900: .4byte 0x03005AF0
_081B9904: .4byte 0x02037282
_081B9908: .4byte 0x00000CA8
_081B990C: .4byte 0x00000CA9
	thumb_func_end sub_081B98CC

	thumb_func_start sub_081B9910
sub_081B9910: @ 0x081B9910
	push {r4, r5, lr}
	ldr r0, _081B992C
	ldr r4, [r0]
	ldr r5, _081B9930
	bl Random
	ldrh r0, [r5]
	ldr r1, _081B9934
	adds r4, r4, r1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B992C: .4byte 0x03005AF0
_081B9930: .4byte 0x085E19AC
_081B9934: .4byte 0x00000E6C
	thumb_func_end sub_081B9910

	thumb_func_start sub_081B9938
sub_081B9938: @ 0x081B9938
	push {r4, r5, lr}
	ldr r4, _081B9970
	ldr r0, [r4]
	ldr r1, _081B9974
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _081B9980
	ldr r0, [r4]
	ldr r1, _081B9974
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _081B9978
	bl CopyItemName
	ldr r0, [r4]
	ldr r1, _081B9974
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081B997C
	strh r5, [r0]
	b _081B9986
	.align 2, 0
_081B9970: .4byte 0x03005AF0
_081B9974: .4byte 0x00000E6C
_081B9978: .4byte 0x02021C40
_081B997C: .4byte 0x02037290
_081B9980:
	ldr r1, _081B998C
	movs r0, #0
	strh r0, [r1]
_081B9986:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B998C: .4byte 0x02037290
	thumb_func_end sub_081B9938

	thumb_func_start sub_081B9990
sub_081B9990: @ 0x081B9990
	push {lr}
	ldr r0, _081B99A0
	ldr r1, _081B99A4
	ldrh r1, [r1]
	bl GetFrontierTrainerName
	pop {r0}
	bx r0
	.align 2, 0
_081B99A0: .4byte 0x02021C40
_081B99A4: .4byte 0x0203886A
	thumb_func_end sub_081B9990

	thumb_func_start sub_081B99A8
sub_081B99A8: @ 0x081B99A8
	push {lr}
	ldr r1, _081B99C0
	ldr r0, _081B99C4
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end sub_081B99A8

	thumb_func_start sub_081B99BC
sub_081B99BC: @ 0x081B99BC
	bx r0
	.align 2, 0
_081B99C0: .4byte 0x085E19B0
_081B99C4: .4byte 0x02037280
	thumb_func_end sub_081B99BC

	thumb_func_start sub_081B99C8
sub_081B99C8: @ 0x081B99C8
	push {lr}
	ldr r1, _081B9A08
	ldr r0, [r1]
	ldr r2, _081B9A0C
	adds r0, r0, r2
	movs r2, #0
	strb r2, [r0]
	ldr r1, [r1]
	ldr r3, _081B9A10
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _081B9A14
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _081B9A18
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	pop {r0}
	bx r0
	.align 2, 0
_081B9A08: .4byte 0x03005AF0
_081B9A0C: .4byte 0x00000CA8
_081B9A10: .4byte 0x00000CB2
_081B9A14: .4byte 0x00000CA9
_081B9A18: .4byte 0x03005AEC
	thumb_func_end sub_081B99C8

	thumb_func_start sub_081B9A1C
sub_081B9A1C: @ 0x081B9A1C
	ldr r1, _081B9A2C
	ldr r0, _081B9A30
	ldr r0, [r0]
	ldr r2, _081B9A34
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_081B9A2C: .4byte 0x02037290
_081B9A30: .4byte 0x03005AF0
_081B9A34: .4byte 0x00000E6E
	thumb_func_end sub_081B9A1C

	thumb_func_start sub_081B9A38
sub_081B9A38: @ 0x081B9A38
	ldr r0, _081B9A48
	ldr r0, [r0]
	ldr r1, _081B9A4C
	ldrh r1, [r1]
	ldr r2, _081B9A50
	adds r0, r0, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_081B9A48: .4byte 0x03005AF0
_081B9A4C: .4byte 0x02037284
_081B9A50: .4byte 0x00000E6E
	thumb_func_end sub_081B9A38

	thumb_func_start sub_081B9A54
sub_081B9A54: @ 0x081B9A54
	push {r4, lr}
	ldr r4, _081B9A88
	ldr r0, [r4]
	ldr r1, _081B9A8C
	ldrh r1, [r1]
	ldr r2, _081B9A90
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _081B9A94
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
_081B9A88: .4byte 0x03005AF0
_081B9A8C: .4byte 0x02037282
_081B9A90: .4byte 0x00000CA8
_081B9A94: .4byte 0x00000CA9
	thumb_func_end sub_081B9A54

	thumb_func_start sub_081B9A98
sub_081B9A98: @ 0x081B9A98
	push {r4, r5, lr}
	ldr r0, _081B9AB4
	ldr r4, [r0]
	ldr r5, _081B9AB8
	bl Random
	ldrh r0, [r5]
	ldr r1, _081B9ABC
	adds r4, r4, r1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B9AB4: .4byte 0x03005AF0
_081B9AB8: .4byte 0x085E19D8
_081B9ABC: .4byte 0x00000E6E
	thumb_func_end sub_081B9A98

	thumb_func_start sub_081B9AC0
sub_081B9AC0: @ 0x081B9AC0
	push {r4, r5, lr}
	ldr r4, _081B9AF8
	ldr r0, [r4]
	ldr r1, _081B9AFC
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _081B9B08
	ldr r0, [r4]
	ldr r1, _081B9AFC
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _081B9B00
	bl CopyItemName
	ldr r0, [r4]
	ldr r1, _081B9AFC
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081B9B04
	strh r5, [r0]
	b _081B9B0E
	.align 2, 0
_081B9AF8: .4byte 0x03005AF0
_081B9AFC: .4byte 0x00000E6E
_081B9B00: .4byte 0x02021C40
_081B9B04: .4byte 0x02037290
_081B9B08:
	ldr r1, _081B9B14
	movs r0, #0
	strh r0, [r1]
_081B9B0E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B9B14: .4byte 0x02037290
	thumb_func_end sub_081B9AC0

	thumb_func_start sub_081B9B18
sub_081B9B18: @ 0x081B9B18
	push {lr}
	bl ZeroPlayerPartyMons
	bl DoBattleFactorySelectScreen
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B9B18

	thumb_func_start sub_081B9B28
sub_081B9B28: @ 0x081B9B28
	push {lr}
	bl DoBattleFactorySwapScreen
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B9B28

	thumb_func_start InSlateportBattleTent
InSlateportBattleTent: @ 0x081B9B34
	push {lr}
	movs r2, #0
	ldr r1, _081B9B58
	ldrb r0, [r1, #0x14]
	cmp r0, #8
	bne _081B9B52
	ldr r3, _081B9B5C
	adds r0, r3, #0
	ldrh r1, [r1, #0x12]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _081B9B52
	movs r2, #1
_081B9B52:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_081B9B58: .4byte 0x02036FB8
_081B9B5C: .4byte 0xFFFFFE7F
	thumb_func_end InSlateportBattleTent

	thumb_func_start sub_081B9B60
sub_081B9B60: @ 0x081B9B60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	ldr r1, _081B9C58
	ldr r0, _081B9C5C
	str r0, [r1]
	add r0, sp, #0xc
	mov sb, r0
	mov r1, sp
	adds r1, #0x18
	str r1, [sp, #0x2c]
	ldr r5, _081B9C60
	ldr r4, _081B9C64
	movs r2, #0
	adds r3, r1, #0
	mov r1, sb
	mov r0, sp
	movs r6, #5
	mov r8, r6
_081B9B8C:
	strh r2, [r0]
	strh r2, [r1]
	strh r2, [r3]
	adds r3, #2
	adds r1, #2
	adds r0, #2
	movs r7, #1
	rsbs r7, r7, #0
	add r8, r7
	mov r6, r8
	cmp r6, #0
	bge _081B9B8C
	str r4, [r5]
	movs r7, #0
	mov sl, r7
	movs r0, #0
	mov r8, r0
	ldr r1, [sp, #0x2c]
	str r1, [sp, #0x30]
	mov r2, sp
	str r2, [sp, #0x34]
	lsls r6, r0, #1
	str r6, [sp, #0x24]
	add r6, sb
	str r6, [sp, #0x28]
_081B9BBE:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x46
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r2, #0
	mov r7, r8
	adds r6, r2, r7
	cmp r2, r6
	bge _081B9C1C
	ldr r1, [sp, #0x28]
	ldrh r0, [r1]
	cmp r0, r5
	beq _081B9C1C
	ldr r0, _081B9C60
	ldr r1, [r0]
	lsls r0, r5, #4
	adds r4, r0, r1
	ldrh r7, [r4]
	mov ip, r7
	lsls r3, r2, #1
	ldr r1, [sp, #0x24]
	add r1, sp
	str r6, [sp, #0x38]
_081B9BF6:
	ldrh r0, [r1]
	cmp r0, ip
	bne _081B9C06
	mov r0, sl
	cmp r0, #0
	bne _081B9C1C
	ldrh r7, [r4]
	mov sl, r7
_081B9C06:
	adds r3, #2
	adds r1, #2
	adds r2, #1
	ldr r0, [sp, #0x38]
	cmp r2, r0
	bge _081B9C1C
	mov r7, sb
	adds r0, r7, r3
	ldrh r0, [r0]
	cmp r0, r5
	bne _081B9BF6
_081B9C1C:
	cmp r2, r6
	bne _081B9CBC
	movs r2, #0
	cmp r2, r6
	bge _081B9C74
	ldr r0, _081B9C68
	mov ip, r0
	ldr r7, _081B9C60
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x2c]
	adds r4, r1, r0
_081B9C32:
	ldrh r3, [r4]
	cmp r3, #0
	beq _081B9C6C
	ldr r1, [r7]
	lsls r0, r5, #4
	adds r1, r0, r1
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	cmp r3, r0
	bne _081B9C6C
	ldrh r0, [r1]
	cmp r0, sl
	bne _081B9C74
	movs r1, #0
	mov sl, r1
	b _081B9C74
	.align 2, 0
_081B9C58: .4byte 0x0203B954
_081B9C5C: .4byte 0x085BC958
_081B9C60: .4byte 0x0203B958
_081B9C64: .4byte 0x085BCF70
_081B9C68: .4byte 0x085ADBF4
_081B9C6C:
	adds r4, #2
	adds r2, #1
	cmp r2, r6
	blt _081B9C32
_081B9C74:
	cmp r2, r6
	bne _081B9CBC
	ldr r0, _081B9CD4
	ldr r1, [r0]
	mov r2, r8
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r6, #0xe7
	lsls r6, r6, #4
	adds r1, r1, r6
	strh r5, [r1]
	ldr r0, _081B9CD8
	ldr r0, [r0]
	lsls r1, r5, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r7, [sp, #0x34]
	strh r0, [r7]
	ldr r2, _081B9CDC
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, [sp, #0x30]
	strh r0, [r1]
	add r3, sb
	strh r5, [r3]
	adds r1, #2
	str r1, [sp, #0x30]
	adds r2, r7, #0
	adds r2, #2
	str r2, [sp, #0x34]
	movs r6, #1
	add r8, r6
_081B9CBC:
	mov r7, r8
	cmp r7, #6
	beq _081B9CC4
	b _081B9BBE
_081B9CC4:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B9CD4: .4byte 0x03005AF0
_081B9CD8: .4byte 0x0203B958
_081B9CDC: .4byte 0x085ADBF4
	thumb_func_end sub_081B9B60

	thumb_func_start sub_081B9CE0
sub_081B9CE0: @ 0x081B9CE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #0
	mov sl, r0
	ldr r1, _081B9D8C
	ldr r0, _081B9D90
	str r0, [r1]
	ldr r1, _081B9D94
	ldr r0, _081B9D98
	str r0, [r1]
	ldr r7, _081B9D9C
	ldr r1, _081B9DA0
	mov r8, r1
_081B9D02:
	mov r2, sl
	lsls r6, r2, #1
_081B9D06:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x1e
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r5, #0
	ldr r1, [r7]
	ldr r4, _081B9DA4
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r5, r0
	bge _081B9D4A
	ldr r2, _081B9DA8
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, r3
	beq _081B9D4A
	ldr r0, _081B9D9C
	ldr r1, [r0]
	adds r0, r1, r4
	ldrh r2, [r0]
	adds r4, #2
	adds r1, r1, r4
_081B9D3C:
	adds r1, #2
	adds r5, #1
	cmp r5, r2
	bge _081B9D4A
	ldrh r0, [r1]
	cmp r0, r3
	bne _081B9D3C
_081B9D4A:
	ldr r0, [r7]
	ldr r1, _081B9DA4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	bne _081B9D06
	ldr r2, _081B9DAC
	strh r3, [r2]
	ldrh r3, [r2]
	ldr r4, _081B9D8C
	ldr r1, [r4]
	movs r0, #0x34
	muls r0, r3, r0
	adds r0, r0, r1
	ldr r0, [r0, #0x30]
	adds r1, r6, r0
	ldrh r0, [r1]
	cmp r0, r8
	beq _081B9D7E
	ldr r3, _081B9DA0
_081B9D72:
	adds r1, #2
	movs r6, #1
	add sl, r6
	ldrh r0, [r1]
	cmp r0, r3
	bne _081B9D72
_081B9D7E:
	mov r0, sl
	cmp r0, #8
	bgt _081B9DB0
	movs r1, #0
	mov sl, r1
	b _081B9D02
	.align 2, 0
_081B9D8C: .4byte 0x0203B954
_081B9D90: .4byte 0x085BC958
_081B9D94: .4byte 0x0203B958
_081B9D98: .4byte 0x085BCF70
_081B9D9C: .4byte 0x03005AF0
_081B9DA0: .4byte 0x0000FFFF
_081B9DA4: .4byte 0x00000CB2
_081B9DA8: .4byte 0x00000CB4
_081B9DAC: .4byte 0x0203886A
_081B9DB0:
	ldr r0, _081B9ED4
	ldr r1, [r0]
	ldr r6, _081B9ED8
	adds r3, r1, r6
	ldrh r0, [r3]
	cmp r0, #1
	bhi _081B9DCA
	lsls r0, r0, #1
	ldr r3, _081B9EDC
	adds r1, r1, r3
	adds r1, r1, r0
	ldrh r0, [r2]
	strh r0, [r1]
_081B9DCA:
	ldrh r1, [r2]
	ldr r2, [r4]
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldr r0, [r0, #0x30]
	mov sb, r0
	movs r5, #0
	ldr r7, _081B9EE0
	mov r8, sp
_081B9DDE:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	bl __modsi3
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r7]
	movs r2, #0
	ldrh r0, [r7]
	ldr r4, _081B9EE4
	ldr r3, [r4]
	lsls r0, r0, #4
	adds r0, r0, r3
	ldr r1, _081B9ED4
	ldrh r6, [r0]
	ldr r1, [r1]
_081B9E06:
	movs r4, #0xe7
	lsls r4, r4, #4
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r6, r0
	beq _081B9E20
	adds r1, #0xc
	adds r2, #1
	cmp r2, #5
	ble _081B9E06
_081B9E20:
	cmp r2, #6
	bne _081B9EC0
	movs r4, #0
	cmp r4, r5
	bge _081B9E50
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, r6
	beq _081B9E50
	ldr r6, _081B9EE0
	ldr r3, _081B9EE4
	mov r2, sp
_081B9E38:
	adds r2, #2
	adds r4, #1
	cmp r4, r5
	bge _081B9E50
	ldrh r0, [r6]
	ldr r1, [r3]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	cmp r1, r0
	bne _081B9E38
_081B9E50:
	cmp r4, r5
	bne _081B9EC0
	movs r4, #0
	cmp r4, r5
	bge _081B9E86
	ldr r6, _081B9EE8
	mov ip, r6
	add r3, sp, #8
_081B9E60:
	ldrh r2, [r3]
	cmp r2, #0
	beq _081B9E7E
	ldr r1, _081B9EE0
	ldrh r0, [r1]
	ldr r6, _081B9EE4
	ldr r1, [r6]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	cmp r2, r0
	beq _081B9E86
_081B9E7E:
	adds r3, #2
	adds r4, #1
	cmp r4, r5
	blt _081B9E60
_081B9E86:
	cmp r4, r5
	bne _081B9EC0
	lsls r2, r5, #1
	ldrh r0, [r7]
	ldr r1, _081B9EE4
	ldr r4, [r1]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r3, r8
	strh r0, [r3]
	add r1, sp, #8
	adds r1, r1, r2
	ldr r3, _081B9EE8
	ldrh r0, [r7]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _081B9EEC
	adds r2, r2, r0
	ldrh r0, [r7]
	strh r0, [r2]
	movs r4, #2
	add r8, r4
	adds r5, #1
_081B9EC0:
	cmp r5, #3
	bne _081B9DDE
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B9ED4: .4byte 0x03005AF0
_081B9ED8: .4byte 0x00000CB2
_081B9EDC: .4byte 0x00000CB4
_081B9EE0: .4byte 0x03001294
_081B9EE4: .4byte 0x0203B958
_081B9EE8: .4byte 0x085ADBF4
_081B9EEC: .4byte 0x03005FD8
	thumb_func_end sub_081B9CE0

