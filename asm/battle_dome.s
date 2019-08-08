.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitDomeChallenge
InitDomeChallenge: @ 0x0818E628
	push {r4, r5, r6, r7, lr}
	ldr r4, _0818E6BC
	ldr r0, [r4]
	ldr r1, _0818E6C0
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _0818E6C4
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r4]
	ldr r2, _0818E6C8
	adds r0, r0, r2
	movs r6, #0
	strb r6, [r0]
	ldr r1, [r4]
	adds r2, #0xa
	adds r0, r1, r2
	strh r6, [r0]
	ldr r0, _0818E6C0
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	ldr r2, _0818E6C0
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r4, [r4]
	ldr r0, _0818E6CC
	adds r3, r4, r0
	ldr r2, _0818E6D0
	lsls r1, r5, #2
	lsls r0, r7, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r0, [r3]
	ldr r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0818E69A
	lsls r0, r5, #1
	lsls r1, r7, #2
	adds r0, r0, r1
	ldr r2, _0818E6D4
	adds r1, r4, r2
	adds r1, r1, r0
	strh r6, [r1]
_0818E69A:
	ldr r0, _0818E6D8
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	ldr r0, _0818E6DC
	strh r6, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818E6BC: .4byte 0x03005AF0
_0818E6C0: .4byte 0x00000CA9
_0818E6C4: .4byte 0x000040CE
_0818E6C8: .4byte 0x00000CA8
_0818E6CC: .4byte 0x00000CDC
_0818E6D0: .4byte 0x085D5B68
_0818E6D4: .4byte 0x00000D0C
_0818E6D8: .4byte 0x03005AEC
_0818E6DC: .4byte 0x0203886A
	thumb_func_end InitDomeChallenge

	thumb_func_start GetDomeData
GetDomeData: @ 0x0818E6E0
	push {r4, r5, r6, lr}
	ldr r0, _0818E710
	ldr r0, [r0]
	ldr r1, _0818E714
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _0818E718
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0818E71C
	ldrh r0, [r0]
	cmp r0, #9
	bls _0818E704
	b _0818E96C
_0818E704:
	lsls r0, r0, #2
	ldr r1, _0818E720
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0818E710: .4byte 0x03005AF0
_0818E714: .4byte 0x00000CA9
_0818E718: .4byte 0x000040CE
_0818E71C: .4byte 0x02037282
_0818E720: .4byte 0x0818E724
_0818E724: @ jump table
	.4byte _0818E74C @ case 0
	.4byte _0818E770 @ case 1
	.4byte _0818E7A4 @ case 2
	.4byte _0818E7C0 @ case 3
	.4byte _0818E7DC @ case 4
	.4byte _0818E7F4 @ case 5
	.4byte _0818E810 @ case 6
	.4byte _0818E89C @ case 7
	.4byte _0818E92C @ case 8
	.4byte _0818E950 @ case 9
_0818E74C:
	ldr r3, _0818E764
	ldr r0, _0818E768
	ldr r0, [r0]
	lsls r1, r5, #1
	lsls r2, r6, #2
	adds r1, r1, r2
	ldr r2, _0818E76C
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
	b _0818E96C
	.align 2, 0
_0818E764: .4byte 0x02037290
_0818E768: .4byte 0x03005AF0
_0818E76C: .4byte 0x00000D0C
_0818E770:
	ldr r4, _0818E794
	ldr r0, _0818E798
	ldr r2, [r0]
	ldr r3, _0818E79C
	adds r2, r2, r3
	ldr r3, _0818E7A0
	lsls r0, r5, #2
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
	b _0818E96C
	.align 2, 0
_0818E794: .4byte 0x02037290
_0818E798: .4byte 0x03005AF0
_0818E79C: .4byte 0x00000CDC
_0818E7A0: .4byte 0x085D5B68
_0818E7A4:
	ldr r1, _0818E7B4
	ldr r0, _0818E7B8
	ldr r0, [r0]
	ldr r2, _0818E7BC
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _0818E91A
	.align 2, 0
_0818E7B4: .4byte 0x02037290
_0818E7B8: .4byte 0x03005AF0
_0818E7BC: .4byte 0x00000D08
_0818E7C0:
	ldr r1, _0818E7D0
	ldr r0, _0818E7D4
	ldr r0, [r0]
	ldr r3, _0818E7D8
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _0818E91A
	.align 2, 0
_0818E7D0: .4byte 0x02037290
_0818E7D4: .4byte 0x03005AF0
_0818E7D8: .4byte 0x00000D08
_0818E7DC:
	ldr r1, _0818E7E8
	ldr r0, _0818E7EC
	ldr r0, [r0]
	ldr r2, _0818E7F0
	adds r0, r0, r2
	b _0818E916
	.align 2, 0
_0818E7E8: .4byte 0x02037290
_0818E7EC: .4byte 0x03005AF0
_0818E7F0: .4byte 0x00000D08
_0818E7F4:
	ldr r1, _0818E804
	ldr r0, _0818E808
	ldr r0, [r0]
	ldr r3, _0818E80C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	b _0818E91A
	.align 2, 0
_0818E804: .4byte 0x02037290
_0818E808: .4byte 0x03005AF0
_0818E80C: .4byte 0x00000D08
_0818E810:
	ldr r0, _0818E834
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _0818E860
	cmp r5, #0
	beq _0818E844
	ldr r1, _0818E838
	ldr r0, _0818E83C
	ldr r0, [r0]
	ldr r2, _0818E840
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	b _0818E91A
	.align 2, 0
_0818E834: .4byte 0x000040CE
_0818E838: .4byte 0x02037290
_0818E83C: .4byte 0x03005AF0
_0818E840: .4byte 0x00000D08
_0818E844:
	ldr r1, _0818E854
	ldr r0, _0818E858
	ldr r0, [r0]
	ldr r3, _0818E85C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	b _0818E91A
	.align 2, 0
_0818E854: .4byte 0x02037290
_0818E858: .4byte 0x03005AF0
_0818E85C: .4byte 0x00000D08
_0818E860:
	cmp r5, #0
	beq _0818E880
	ldr r1, _0818E874
	ldr r0, _0818E878
	ldr r0, [r0]
	ldr r2, _0818E87C
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _0818E91A
	.align 2, 0
_0818E874: .4byte 0x02037290
_0818E878: .4byte 0x03005AF0
_0818E87C: .4byte 0x00000D08
_0818E880:
	ldr r1, _0818E890
	ldr r0, _0818E894
	ldr r0, [r0]
	ldr r3, _0818E898
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _0818E91A
	.align 2, 0
_0818E890: .4byte 0x02037290
_0818E894: .4byte 0x03005AF0
_0818E898: .4byte 0x00000D08
_0818E89C:
	ldr r0, _0818E8C0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _0818E8EC
	cmp r5, #0
	beq _0818E8D0
	ldr r1, _0818E8C4
	ldr r0, _0818E8C8
	ldr r0, [r0]
	ldr r2, _0818E8CC
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r0, r0, #7
	strh r0, [r1]
	b _0818E96C
	.align 2, 0
_0818E8C0: .4byte 0x000040CE
_0818E8C4: .4byte 0x02037290
_0818E8C8: .4byte 0x03005AF0
_0818E8CC: .4byte 0x00000D08
_0818E8D0:
	ldr r1, _0818E8E0
	ldr r0, _0818E8E4
	ldr r0, [r0]
	ldr r3, _0818E8E8
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	b _0818E91A
	.align 2, 0
_0818E8E0: .4byte 0x02037290
_0818E8E4: .4byte 0x03005AF0
_0818E8E8: .4byte 0x00000D08
_0818E8EC:
	cmp r5, #0
	beq _0818E90C
	ldr r1, _0818E900
	ldr r0, _0818E904
	ldr r0, [r0]
	ldr r2, _0818E908
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	b _0818E91A
	.align 2, 0
_0818E900: .4byte 0x02037290
_0818E904: .4byte 0x03005AF0
_0818E908: .4byte 0x00000D08
_0818E90C:
	ldr r1, _0818E920
	ldr r0, _0818E924
	ldr r0, [r0]
	ldr r3, _0818E928
	adds r0, r0, r3
_0818E916:
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
_0818E91A:
	lsrs r0, r0, #0x1f
	strh r0, [r1]
	b _0818E96C
	.align 2, 0
_0818E920: .4byte 0x02037290
_0818E924: .4byte 0x03005AF0
_0818E928: .4byte 0x00000D08
_0818E92C:
	bl sub_081B81F8
	ldr r2, _0818E948
	ldr r0, _0818E94C
	ldr r0, [r0]
	movs r1, #0xcb
	lsls r1, r1, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	strb r1, [r2]
	ldrh r0, [r0]
	lsrs r0, r0, #8
	strb r0, [r2, #1]
	b _0818E96C
	.align 2, 0
_0818E948: .4byte 0x0203CBC4
_0818E94C: .4byte 0x03005AF0
_0818E950:
	ldr r2, _0818E974
	ldr r0, _0818E978
	ldr r1, [r0]
	ldr r3, _0818E97C
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r3, #1
	adds r1, r1, r3
	ldr r3, _0818E980
	adds r0, r0, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r2]
_0818E96C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818E974: .4byte 0x02037290
_0818E978: .4byte 0x03005AF0
_0818E97C: .4byte 0x00000D0A
_0818E980: .4byte 0x0000FFFD
	thumb_func_end GetDomeData

	thumb_func_start SetDomeData
SetDomeData: @ 0x0818E984
	push {r4, r5, lr}
	ldr r0, _0818E9B4
	ldr r0, [r0]
	ldr r1, _0818E9B8
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r4, r0, #0x1e
	ldr r0, _0818E9BC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0818E9C0
	ldrh r0, [r0]
	cmp r0, #8
	bls _0818E9A8
	b _0818EC7A
_0818E9A8:
	lsls r0, r0, #2
	ldr r1, _0818E9C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0818E9B4: .4byte 0x03005AF0
_0818E9B8: .4byte 0x00000CA9
_0818E9BC: .4byte 0x000040CE
_0818E9C0: .4byte 0x02037282
_0818E9C4: .4byte 0x0818E9C8
_0818E9C8: @ jump table
	.4byte _0818E9EC @ case 0
	.4byte _0818EA10 @ case 1
	.4byte _0818EA6C @ case 2
	.4byte _0818EA90 @ case 3
	.4byte _0818EAB8 @ case 4
	.4byte _0818EAD4 @ case 5
	.4byte _0818EAFC @ case 6
	.4byte _0818EBAC @ case 7
	.4byte _0818EC64 @ case 8
_0818E9EC:
	ldr r0, _0818EA04
	ldr r2, [r0]
	lsls r0, r4, #1
	lsls r1, r5, #2
	adds r0, r0, r1
	ldr r1, _0818EA08
	adds r2, r2, r1
	adds r2, r2, r0
	ldr r0, _0818EA0C
	ldrh r0, [r0]
	strh r0, [r2]
	b _0818EC7A
	.align 2, 0
_0818EA04: .4byte 0x03005AF0
_0818EA08: .4byte 0x00000D0C
_0818EA0C: .4byte 0x02037284
_0818EA10:
	ldr r0, _0818EA34
	ldrh r0, [r0]
	cmp r0, #0
	beq _0818EA44
	ldr r0, _0818EA38
	ldr r2, [r0]
	ldr r0, _0818EA3C
	adds r2, r2, r0
	ldr r3, _0818EA40
	lsls r1, r4, #2
	lsls r0, r5, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r2]
	ldr r1, [r1]
	orrs r0, r1
	str r0, [r2]
	b _0818EC7A
	.align 2, 0
_0818EA34: .4byte 0x02037284
_0818EA38: .4byte 0x03005AF0
_0818EA3C: .4byte 0x00000CDC
_0818EA40: .4byte 0x085D5B68
_0818EA44:
	ldr r0, _0818EA60
	ldr r2, [r0]
	ldr r1, _0818EA64
	adds r2, r2, r1
	ldr r3, _0818EA68
	lsls r1, r4, #2
	lsls r0, r5, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r2]
	ldr r1, [r1]
	ands r0, r1
	str r0, [r2]
	b _0818EC7A
	.align 2, 0
_0818EA60: .4byte 0x03005AF0
_0818EA64: .4byte 0x00000CDC
_0818EA68: .4byte 0x085D5B78
_0818EA6C:
	ldr r0, _0818EA84
	ldr r2, [r0]
	ldr r0, _0818EA88
	ldrb r0, [r0]
	ldr r1, _0818EA8C
	adds r2, r2, r1
	movs r1, #1
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	b _0818EBD0
	.align 2, 0
_0818EA84: .4byte 0x03005AF0
_0818EA88: .4byte 0x02037284
_0818EA8C: .4byte 0x00000D08
_0818EA90:
	ldr r0, _0818EAAC
	ldr r3, [r0]
	ldr r0, _0818EAB0
	ldrb r0, [r0]
	ldr r2, _0818EAB4
	adds r3, r3, r2
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r3]
	movs r0, #3
	rsbs r0, r0, #0
	b _0818EC50
	.align 2, 0
_0818EAAC: .4byte 0x03005AF0
_0818EAB0: .4byte 0x02037284
_0818EAB4: .4byte 0x00000D08
_0818EAB8:
	ldr r0, _0818EAC8
	ldr r3, [r0]
	ldr r0, _0818EACC
	ldrb r0, [r0]
	ldr r1, _0818EAD0
	adds r3, r3, r1
	b _0818EC44
	.align 2, 0
_0818EAC8: .4byte 0x03005AF0
_0818EACC: .4byte 0x02037284
_0818EAD0: .4byte 0x00000D08
_0818EAD4:
	ldr r0, _0818EAF0
	ldr r3, [r0]
	ldr r0, _0818EAF4
	ldrb r0, [r0]
	ldr r2, _0818EAF8
	adds r3, r3, r2
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3]
	movs r0, #9
	rsbs r0, r0, #0
	b _0818EC50
	.align 2, 0
_0818EAF0: .4byte 0x03005AF0
_0818EAF4: .4byte 0x02037284
_0818EAF8: .4byte 0x00000D08
_0818EAFC:
	ldr r0, _0818EB28
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #1
	bne _0818EB5C
	cmp r4, #0
	beq _0818EB38
	ldr r0, _0818EB2C
	ldr r3, [r0]
	ldr r0, _0818EB30
	ldrb r0, [r0]
	ldr r2, _0818EB34
	adds r3, r3, r2
	ands r1, r0
	lsls r1, r1, #5
	ldrb r2, [r3]
	movs r0, #0x21
	rsbs r0, r0, #0
	b _0818EC50
	.align 2, 0
_0818EB28: .4byte 0x000040CE
_0818EB2C: .4byte 0x03005AF0
_0818EB30: .4byte 0x02037284
_0818EB34: .4byte 0x00000D08
_0818EB38:
	ldr r0, _0818EB50
	ldr r3, [r0]
	ldr r0, _0818EB54
	ldrb r0, [r0]
	ldr r2, _0818EB58
	adds r3, r3, r2
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r3]
	movs r0, #0x11
	rsbs r0, r0, #0
	b _0818EC50
	.align 2, 0
_0818EB50: .4byte 0x03005AF0
_0818EB54: .4byte 0x02037284
_0818EB58: .4byte 0x00000D08
_0818EB5C:
	cmp r4, #0
	beq _0818EB88
	ldr r0, _0818EB7C
	ldr r3, [r0]
	ldr r0, _0818EB80
	ldrb r0, [r0]
	ldr r1, _0818EB84
	adds r3, r3, r1
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r3]
	movs r0, #3
	rsbs r0, r0, #0
	b _0818EC50
	.align 2, 0
_0818EB7C: .4byte 0x03005AF0
_0818EB80: .4byte 0x02037284
_0818EB84: .4byte 0x00000D08
_0818EB88:
	ldr r0, _0818EBA0
	ldr r2, [r0]
	ldr r0, _0818EBA4
	ldrb r0, [r0]
	ldr r1, _0818EBA8
	adds r2, r2, r1
	movs r1, #1
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	b _0818EBD0
	.align 2, 0
_0818EBA0: .4byte 0x03005AF0
_0818EBA4: .4byte 0x02037284
_0818EBA8: .4byte 0x00000D08
_0818EBAC:
	ldr r0, _0818EBD8
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #1
	bne _0818EC0C
	cmp r4, #0
	beq _0818EBE8
	ldr r0, _0818EBDC
	ldr r2, [r0]
	ldr r0, _0818EBE0
	ldrb r1, [r0]
	ldr r0, _0818EBE4
	adds r2, r2, r0
	lsls r1, r1, #7
	ldrb r3, [r2]
	movs r0, #0x7f
_0818EBD0:
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _0818EC7A
	.align 2, 0
_0818EBD8: .4byte 0x000040CE
_0818EBDC: .4byte 0x03005AF0
_0818EBE0: .4byte 0x02037284
_0818EBE4: .4byte 0x00000D08
_0818EBE8:
	ldr r0, _0818EC00
	ldr r3, [r0]
	ldr r0, _0818EC04
	ldrb r0, [r0]
	ldr r2, _0818EC08
	adds r3, r3, r2
	ands r1, r0
	lsls r1, r1, #6
	ldrb r2, [r3]
	movs r0, #0x41
	rsbs r0, r0, #0
	b _0818EC50
	.align 2, 0
_0818EC00: .4byte 0x03005AF0
_0818EC04: .4byte 0x02037284
_0818EC08: .4byte 0x00000D08
_0818EC0C:
	cmp r4, #0
	beq _0818EC38
	ldr r0, _0818EC2C
	ldr r3, [r0]
	ldr r0, _0818EC30
	ldrb r0, [r0]
	ldr r1, _0818EC34
	adds r3, r3, r1
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3]
	movs r0, #9
	rsbs r0, r0, #0
	b _0818EC50
	.align 2, 0
_0818EC2C: .4byte 0x03005AF0
_0818EC30: .4byte 0x02037284
_0818EC34: .4byte 0x00000D08
_0818EC38:
	ldr r0, _0818EC58
	ldr r3, [r0]
	ldr r0, _0818EC5C
	ldrb r0, [r0]
	ldr r2, _0818EC60
	adds r3, r3, r2
_0818EC44:
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
_0818EC50:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _0818EC7A
	.align 2, 0
_0818EC58: .4byte 0x03005AF0
_0818EC5C: .4byte 0x02037284
_0818EC60: .4byte 0x00000D08
_0818EC64:
	ldr r0, _0818EC80
	ldr r2, [r0]
	ldr r0, _0818EC84
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	orrs r1, r0
	movs r0, #0xcb
	lsls r0, r0, #4
	adds r2, r2, r0
	strh r1, [r2]
_0818EC7A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818EC80: .4byte 0x03005AF0
_0818EC84: .4byte 0x0203CBC4
	thumb_func_end SetDomeData

	thumb_func_start InitDomeTrainers
InitDomeTrainers: @ 0x0818EC88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x20
	bl AllocZeroed
	str r0, [sp, #0x18]
	movs r0, #0x18
	bl AllocZeroed
	str r0, [sp, #0x1c]
	ldr r4, _0818EE48
	ldr r1, [r4]
	ldr r2, _0818EE4C
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	adds r0, #1
	ldr r3, _0818EE50
	adds r1, r1, r3
	strb r0, [r1]
	ldr r0, _0818EE54
	bl VarGet
	ldr r1, [r4]
	adds r0, #1
	ldr r5, _0818EE58
	adds r1, r1, r5
	strb r0, [r1]
	ldr r2, [r4]
	ldr r7, _0818EE5C
	adds r3, r2, r7
	ldrh r0, [r3]
	ldr r5, _0818EE60
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r3, _0818EE64
	adds r2, r2, r3
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	strb r0, [r1]
	movs r7, #0
	mov sl, r7
	mov r8, r4
	ldr r0, _0818EE68
	mov sb, r0
	movs r4, #0
_0818ED16:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _0818EE6C
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r3, #0x64
	muls r0, r3, r0
	add r0, sb
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	mov r5, r8
	ldr r1, [r5]
	ldr r7, _0818EE70
	adds r1, r1, r7
	adds r1, r1, r4
	strh r0, [r1]
	movs r5, #0
	mov r0, sl
	lsls r7, r0, #4
	adds r6, r7, #0
_0818ED44:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _0818EE6C
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r3, #0x64
	muls r0, r3, r0
	add r0, sb
	adds r1, r5, #0
	adds r1, #0xd
	movs r2, #0
	bl GetMonData
	mov r2, r8
	ldr r1, [r2]
	ldr r3, _0818EE74
	adds r1, r1, r3
	adds r1, r1, r6
	strh r0, [r1]
	adds r6, #2
	adds r5, #1
	cmp r5, #3
	ble _0818ED44
	movs r5, #0
	ldr r6, _0818EE48
_0818ED78:
	ldr r0, [r6]
	ldr r1, _0818EE6C
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0x64
	muls r0, r2, r0
	add r0, sb
	adds r1, r5, #0
	adds r1, #0x1a
	movs r2, #0
	bl GetMonData
	ldr r1, [r6]
	adds r2, r5, r7
	ldr r3, _0818EE78
	adds r1, r1, r3
	adds r1, r1, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #5
	ble _0818ED78
	mov r5, r8
	ldr r0, [r5]
	ldr r1, _0818EE6C
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0x64
	muls r0, r2, r0
	add r0, sb
	bl GetNature
	ldr r1, [r5]
	adds r1, r1, r7
	ldr r3, _0818EE7C
	adds r1, r1, r3
	strb r0, [r1]
	adds r4, #2
	movs r5, #1
	add sl, r5
	mov r7, sl
	cmp r7, #2
	ble _0818ED16
	mov sl, r5
	movs r0, #4
	str r0, [sp, #0x34]
	movs r1, #6
	str r1, [sp, #0x38]
_0818EDDA:
	mov r2, sl
	cmp r2, #5
	ble _0818EE88
_0818EDE0:
	bl GetCurrentFacilityWinStreak
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #1
	cmp r5, sl
	bge _0818EE26
	ldr r3, _0818EE48
	ldr r0, [r3]
	ldr r7, _0818EE80
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r2, r3, #0
	cmp r0, r4
	beq _0818EE26
	ldr r3, _0818EE5C
_0818EE0E:
	adds r5, #1
	cmp r5, sl
	bge _0818EE26
	ldr r0, [r2]
	lsls r1, r5, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r4
	bne _0818EE0E
_0818EE26:
	cmp r5, sl
	bne _0818EDE0
	ldr r0, _0818EE48
	ldr r3, [r0]
	ldr r1, [sp, #0x34]
	adds r3, r3, r1
	ldr r2, _0818EE5C
	adds r3, r3, r2
	ldr r5, _0818EE60
	adds r0, r5, #0
	adds r2, r4, #0
	ands r2, r0
	ldrh r0, [r3]
	ldr r7, _0818EE84
	adds r1, r7, #0
	b _0818EEEE
	.align 2, 0
_0818EE48: .4byte 0x03005AF0
_0818EE4C: .4byte 0x00000CA9
_0818EE50: .4byte 0x00000D0A
_0818EE54: .4byte 0x000040CE
_0818EE58: .4byte 0x00000D0B
_0818EE5C: .4byte 0x00000D24
_0818EE60: .4byte 0x000003FF
_0818EE64: .4byte 0x00000D25
_0818EE68: .4byte 0x0202412C
_0818EE6C: .4byte 0x00000CAA
_0818EE70: .4byte 0x00000D64
_0818EE74: .4byte 0x00000EFC
_0818EE78: .4byte 0x00000F04
_0818EE7C: .4byte 0x00000F0A
_0818EE80: .4byte 0x00000D28
_0818EE84: .4byte 0xFFFFFC00
_0818EE88:
	bl GetCurrentFacilityWinStreak
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #1
	cmp r5, sl
	bge _0818EED0
	ldr r1, _0818F22C
	ldr r0, [r1]
	ldr r2, _0818F230
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r2, r1, #0
	cmp r0, r4
	beq _0818EED0
	ldr r3, _0818F234
_0818EEB8:
	adds r5, #1
	cmp r5, sl
	bge _0818EED0
	ldr r0, [r2]
	lsls r1, r5, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r4
	bne _0818EEB8
_0818EED0:
	cmp r5, sl
	bne _0818EE88
	ldr r5, _0818F22C
	ldr r3, [r5]
	ldr r7, [sp, #0x34]
	adds r3, r3, r7
	ldr r0, _0818F234
	adds r3, r3, r0
	ldr r1, _0818F238
	adds r0, r1, #0
	adds r2, r4, #0
	ands r2, r0
	ldrh r0, [r3]
	ldr r5, _0818F23C
	adds r1, r5, #0
_0818EEEE:
	ands r0, r1
	orrs r0, r2
	strh r0, [r3]
	movs r5, #0
	lsls r4, r4, #0x10
	str r4, [sp, #0x2c]
	ldr r7, [sp, #0x38]
	str r7, [sp, #0x20]
_0818EEFE:
	lsls r0, r5, #1
	mov sb, r0
	adds r1, r5, #1
	str r1, [sp, #0x24]
	lsls r2, r5, #2
	str r2, [sp, #0x28]
_0818EF0A:
	ldr r3, [sp, #0x2c]
	lsrs r0, r3, #0x10
	bl RandomizeFacilityTrainerMonSet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r7, #0
	cmp r7, r5
	bge _0818EF5C
	ldr r0, _0818F22C
	ldr r0, [r0]
	ldr r1, [sp, #8]
	mov r8, r1
	ldr r2, [sp, #0xc]
	mov ip, r2
	ldr r3, _0818F240
	adds r0, r0, r3
	ldr r1, [sp, #0x20]
	adds r4, r1, r0
_0818EF30:
	ldrh r3, [r4]
	cmp r3, r6
	beq _0818EF5C
	ldr r2, _0818F244
	ldr r1, [r2]
	lsls r0, r6, #4
	adds r2, r0, r1
	ldrh r0, [r2]
	cmp r8, r0
	beq _0818EF5C
	cmp ip, r0
	beq _0818EF5C
	lsls r0, r3, #4
	adds r0, r0, r1
	ldrb r0, [r0, #0xa]
	ldrb r2, [r2, #0xa]
	cmp r0, r2
	beq _0818EF5C
	adds r4, #2
	adds r7, #1
	cmp r7, r5
	blt _0818EF30
_0818EF5C:
	cmp r7, r5
	bne _0818EF0A
	ldr r3, _0818F22C
	ldr r0, [r3]
	ldr r1, [sp, #0x38]
	add r1, sb
	ldr r5, _0818F240
	adds r0, r0, r5
	adds r0, r0, r1
	strh r6, [r0]
	ldr r2, [sp, #0x28]
	add r2, sp
	adds r2, #8
	ldr r0, _0818F244
	ldr r1, [r0]
	lsls r0, r6, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r2]
	ldr r5, [sp, #0x24]
	cmp r5, #2
	ble _0818EEFE
	ldr r2, [r3]
	ldr r7, [sp, #0x34]
	adds r2, r2, r7
	ldr r0, _0818F248
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r3, #5
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strb r0, [r2]
	ldr r5, _0818F22C
	ldr r2, [r5]
	adds r2, r2, r7
	ldr r7, _0818F248
	adds r2, r2, r7
	ldrb r0, [r2]
	subs r3, #0x14
	adds r1, r3, #0
	ands r0, r1
	strb r0, [r2]
	ldr r1, [r5]
	ldr r5, [sp, #0x34]
	adds r1, r1, r5
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	strb r0, [r1]
	adds r5, #4
	str r5, [sp, #0x34]
	ldr r7, [sp, #0x38]
	adds r7, #6
	str r7, [sp, #0x38]
	movs r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #0xf
	bgt _0818EFD8
	b _0818EDDA
_0818EFD8:
	movs r7, #0
	ldr r2, [sp, #0x18]
	strh r7, [r2]
	movs r3, #0
	mov sl, r3
	ldr r6, _0818F24C
	ldr r5, _0818F250
_0818EFE6:
	ldr r0, _0818F22C
	ldr r0, [r0]
	mov r2, sl
	lsls r1, r2, #1
	ldr r3, _0818F254
	adds r0, r0, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r4, r0, #1
	movs r0, #0x64
	muls r4, r0, r4
	ldr r0, _0818F258
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x3b
	movs r2, #0
	bl GetMonData
	ldr r2, [sp, #0x18]
	ldrh r1, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0
	bl GetMonData
	ldr r3, [sp, #0x18]
	ldrh r1, [r3]
	adds r1, r1, r0
	strh r1, [r3]
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl GetMonData
	ldr r2, [sp, #0x18]
	ldrh r1, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	adds r0, r4, #0
	movs r1, #0x3f
	movs r2, #0
	bl GetMonData
	ldr r3, [sp, #0x18]
	ldrh r1, [r3]
	adds r1, r1, r0
	strh r1, [r3]
	adds r0, r4, #0
	movs r1, #0x3d
	movs r2, #0
	bl GetMonData
	ldr r2, [sp, #0x18]
	ldrh r1, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	adds r0, r4, #0
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	ldr r3, [sp, #0x18]
	ldrh r1, [r3]
	adds r1, r1, r0
	strh r1, [r3]
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #6]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	orrs r7, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #7]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	orrs r7, r0
	movs r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #2
	ble _0818EFE6
	movs r4, #0
	movs r1, #1
	movs r5, #0x1f
_0818F0B4:
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0818F0BE
	adds r4, #1
_0818F0BE:
	asrs r7, r7, #1
	subs r5, #1
	cmp r5, #0
	bge _0818F0B4
	bl SetFacilityPtrsGetLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	adds r2, r0, #0
	adds r0, r4, #0
	muls r0, r2, r0
	movs r1, #0x14
	bl __divsi3
	ldr r3, [sp, #0x18]
	ldrh r1, [r3]
	adds r1, r1, r0
	strh r1, [r3]
	movs r5, #1
	mov sl, r5
	adds r6, r3, #0
	adds r6, #2
	movs r7, #2
	str r7, [sp, #0x30]
_0818F0F0:
	movs r7, #0
	strh r7, [r6]
	ldr r1, _0818F22C
	ldr r0, [r1]
	mov r2, sl
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r3, _0818F234
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	bl GetDomeTrainerMonIvs
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	ldr r0, [sp, #0x30]
	mov sb, r0
_0818F118:
	ldr r1, _0818F22C
	ldr r0, [r1]
	mov r4, sb
	add r4, sl
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r2, _0818F240
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r3, _0818F244
	ldr r0, [r3]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrb r3, [r1, #0xb]
	ldrb r1, [r1, #0xc]
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	str r1, [sp, #4]
	ldr r1, [sp, #0x14]
	mov r2, r8
	bl CalcDomeMonStats
	ldr r2, [sp, #0x1c]
	ldr r1, [r2, #4]
	ldrh r0, [r6]
	adds r0, r0, r1
	ldr r1, [r2, #8]
	adds r0, r0, r1
	ldr r1, [r2, #0x10]
	adds r0, r0, r1
	ldr r1, [r2, #0x14]
	adds r0, r0, r1
	ldr r1, [r2, #0xc]
	adds r0, r0, r1
	ldr r1, [r2]
	adds r0, r0, r1
	strh r0, [r6]
	ldr r3, _0818F22C
	ldr r0, [r3]
	ldr r1, _0818F240
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r2, _0818F244
	ldr r1, [r2]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r3, _0818F250
	adds r1, r1, r3
	ldrb r0, [r1, #6]
	lsls r0, r0, #2
	ldr r2, _0818F24C
	adds r0, r0, r2
	ldr r0, [r0]
	orrs r7, r0
	ldrb r0, [r1, #7]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	orrs r7, r0
	adds r5, #1
	cmp r5, #2
	ble _0818F118
	movs r4, #0
	movs r1, #1
	movs r5, #0x1f
_0818F1A8:
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0818F1B2
	adds r4, #1
_0818F1B2:
	asrs r7, r7, #1
	subs r5, #1
	cmp r5, #0
	bge _0818F1A8
	ldr r3, [sp, #0x14]
	adds r0, r4, #0
	muls r0, r3, r0
	movs r1, #0x14
	bl __divsi3
	ldrh r1, [r6]
	adds r1, r1, r0
	strh r1, [r6]
	adds r6, #2
	ldr r5, [sp, #0x30]
	adds r5, #2
	str r5, [sp, #0x30]
	movs r7, #1
	add sl, r7
	mov r0, sl
	cmp r0, #0xf
	ble _0818F0F0
	movs r1, #0
	mov sl, r1
	ldr r2, _0818F238
	mov r8, r2
_0818F1E6:
	mov r5, sl
	adds r5, #1
	adds r7, r5, #0
	cmp r5, #0xf
	bgt _0818F282
	mov r3, sl
	lsls r0, r3, #1
	ldr r1, [sp, #0x18]
	adds r6, r0, r1
	lsls r0, r5, #1
	adds r4, r0, r1
_0818F1FC:
	ldrh r1, [r6]
	ldrh r0, [r4]
	cmp r1, r0
	blo _0818F21E
	cmp r1, r0
	bne _0818F27A
	ldr r0, _0818F22C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r1, r0
	ldr r2, _0818F234
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r2, r0, #0x16
	lsrs r0, r2, #0x16
	cmp r0, r8
	bne _0818F25E
_0818F21E:
	mov r0, sl
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl SwapDomeTrainers
	b _0818F25C
	.align 2, 0
_0818F22C: .4byte 0x03005AF0
_0818F230: .4byte 0x00000D28
_0818F234: .4byte 0x00000D24
_0818F238: .4byte 0x000003FF
_0818F23C: .4byte 0xFFFFFC00
_0818F240: .4byte 0x00000D64
_0818F244: .4byte 0x0203B958
_0818F248: .4byte 0x00000D25
_0818F24C: .4byte 0x082FACB4
_0818F250: .4byte 0x082F0D54
_0818F254: .4byte 0x00000CAA
_0818F258: .4byte 0x02024190
_0818F25C:
	b _0818F27A
_0818F25E:
	mov r3, sl
	lsls r0, r3, #2
	adds r0, r1, r0
	ldr r1, _0818F2F0
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	cmp r0, r2
	bls _0818F27A
	mov r0, sl
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl SwapDomeTrainers
_0818F27A:
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	ble _0818F1FC
_0818F282:
	mov sl, r7
	mov r2, sl
	cmp r2, #0xe
	ble _0818F1E6
	bl sub_081A33A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0818F34A
	movs r3, #0
	mov sl, r3
	ldr r0, _0818F2F4
	ldr r1, [r0]
	ldr r4, _0818F2F0
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldr r3, _0818F2F8
	adds r2, r0, #0
	ldr r6, _0818F2FC
	cmp r1, r3
	beq _0818F2D0
	adds r5, r2, #0
_0818F2B2:
	movs r7, #1
	add sl, r7
	mov r0, sl
	cmp r0, #0xf
	bgt _0818F2D0
	ldr r0, [r5]
	mov r7, sl
	lsls r1, r7, #2
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r3
	bne _0818F2B2
_0818F2D0:
	mov r1, sl
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0818F308
	movs r5, #0
	ldr r2, [r2]
	ldr r3, _0818F2F0
	adds r2, r2, r3
	ldrh r1, [r2]
	ldr r0, _0818F300
	ands r0, r1
	ldr r7, _0818F304
	adds r1, r7, #0
	b _0818F31A
	.align 2, 0
_0818F2F0: .4byte 0x00000D24
_0818F2F4: .4byte 0x03005AF0
_0818F2F8: .4byte 0x000003FF
_0818F2FC: .4byte 0x085D5E6D
_0818F300: .4byte 0xFFFFFC00
_0818F304: .4byte 0x000003FE
_0818F308:
	movs r5, #1
	ldr r2, [r2]
	ldr r0, _0818F368
	adds r2, r2, r0
	ldrh r1, [r2]
	ldr r0, _0818F36C
	ands r0, r1
	ldr r3, _0818F370
	adds r1, r3, #0
_0818F31A:
	orrs r0, r1
	strh r0, [r2]
	movs r7, #0
	mov sl, r7
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r4, r0, #1
_0818F328:
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl GetFrontierBrainMonSpecies
	ldr r1, _0818F374
	ldr r1, [r1]
	ldr r2, _0818F378
	adds r1, r1, r2
	adds r1, r1, r4
	strh r0, [r1]
	adds r4, #2
	movs r3, #1
	add sl, r3
	mov r5, sl
	cmp r5, #2
	ble _0818F328
_0818F34A:
	ldr r0, [sp, #0x18]
	bl Free
	ldr r0, [sp, #0x1c]
	bl Free
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818F368: .4byte 0x00000D28
_0818F36C: .4byte 0xFFFFFC00
_0818F370: .4byte 0x000003FE
_0818F374: .4byte 0x03005AF0
_0818F378: .4byte 0x00000D64
	thumb_func_end InitDomeTrainers

	thumb_func_start CalcDomeMonStats
CalcDomeMonStats: @ 0x0818F37C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r1, #0
	mov sb, r2
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x40]
	mov r8, r2
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	movs r1, #0
	adds r4, r5, #0
	movs r3, #1
	movs r2, #5
_0818F3A8:
	adds r0, r4, #0
	ands r0, r3
	cmp r0, #0
	beq _0818F3B2
	adds r1, #1
_0818F3B2:
	lsrs r4, r4, #1
	subs r2, #1
	cmp r2, #0
	bge _0818F3A8
	movs r0, #0xff
	lsls r0, r0, #1
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r0, r6, #3
	mov sl, r0
	movs r1, #0
	mov ip, r1
	mov r1, sp
	movs r2, #5
_0818F3D2:
	mov r0, ip
	str r0, [r1]
	adds r0, r5, #0
	ands r0, r4
	cmp r0, #0
	beq _0818F3E0
	str r3, [r1]
_0818F3E0:
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
	adds r1, #4
	subs r2, #1
	cmp r2, #0
	bge _0818F3D2
	ldr r0, _0818F3F8
	cmp r6, r0
	bne _0818F3FC
	movs r0, #1
	b _0818F426
	.align 2, 0
_0818F3F8: .4byte 0x0000012F
_0818F3FC:
	mov r2, sl
	subs r0, r2, r6
	lsls r0, r0, #2
	ldr r1, _0818F55C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	mov r2, sb
	adds r1, r0, r2
	ldr r0, [sp]
	cmp r0, #0
	bge _0818F416
	adds r0, #3
_0818F416:
	asrs r0, r0, #2
	adds r0, r1, r0
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, r0, r7
	adds r0, #0xa
_0818F426:
	mov r1, r8
	str r0, [r1]
	mov r2, sl
	subs r0, r2, r6
	lsls r0, r0, #2
	ldr r1, _0818F55C
	adds r4, r0, r1
	ldrb r0, [r4, #1]
	lsls r0, r0, #1
	mov r2, sb
	adds r1, r0, r2
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _0818F444
	adds r0, #3
_0818F444:
	asrs r0, r0, #2
	adds r0, r1, r0
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r1, r0, #0
	adds r1, #5
	mov r0, r8
	str r1, [r0, #4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x18]
	movs r2, #1
	bl ModifyStatByNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	str r0, [r1, #4]
	ldrb r0, [r4, #2]
	lsls r0, r0, #1
	mov r2, sb
	adds r1, r0, r2
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _0818F47C
	adds r0, #3
_0818F47C:
	asrs r0, r0, #2
	adds r0, r1, r0
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r1, r0, #0
	adds r1, #5
	mov r0, r8
	str r1, [r0, #8]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x18]
	movs r2, #2
	bl ModifyStatByNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	str r0, [r1, #8]
	ldrb r0, [r4, #3]
	lsls r0, r0, #1
	mov r2, sb
	adds r1, r0, r2
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _0818F4B4
	adds r0, #3
_0818F4B4:
	asrs r0, r0, #2
	adds r0, r1, r0
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r1, r0, #0
	adds r1, #5
	mov r0, r8
	str r1, [r0, #0xc]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x18]
	movs r2, #3
	bl ModifyStatByNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	str r0, [r1, #0xc]
	ldrb r0, [r4, #4]
	lsls r0, r0, #1
	mov r2, sb
	adds r1, r0, r2
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bge _0818F4EC
	adds r0, #3
_0818F4EC:
	asrs r0, r0, #2
	adds r0, r1, r0
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r1, r0, #0
	adds r1, #5
	mov r0, r8
	str r1, [r0, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x18]
	movs r2, #4
	bl ModifyStatByNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	str r0, [r1, #0x10]
	ldrb r0, [r4, #5]
	lsls r0, r0, #1
	mov r1, sb
	adds r2, r0, r1
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bge _0818F524
	adds r0, #3
_0818F524:
	asrs r0, r0, #2
	adds r0, r2, r0
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r1, r0, #0
	adds r1, #5
	mov r2, r8
	str r1, [r2, #0x14]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x18]
	movs r2, #5
	bl ModifyStatByNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	str r0, [r1, #0x14]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818F55C: .4byte 0x082F0D54
	thumb_func_end CalcDomeMonStats

	thumb_func_start SwapDomeTrainers
SwapDomeTrainers: @ 0x0818F560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r3, r0, #1
	mov ip, r3
	adds r4, r3, r2
	ldrh r5, [r4]
	lsls r7, r1, #1
	mov sb, r7
	add r2, sb
	ldrh r3, [r2]
	strh r3, [r4]
	strh r5, [r2]
	ldr r2, _0818F5FC
	ldr r5, [r2]
	lsls r6, r0, #2
	adds r6, r5, r6
	ldr r3, _0818F600
	adds r6, r6, r3
	ldrh r7, [r6]
	mov sl, r7
	mov r2, sl
	lsls r2, r2, #0x16
	mov r8, r2
	lsls r2, r1, #2
	adds r5, r5, r2
	adds r5, r5, r3
	ldrh r4, [r5]
	lsls r4, r4, #0x16
	lsrs r4, r4, #0x16
	ldr r3, _0818F604
	adds r2, r3, #0
	mov r7, sl
	ands r2, r7
	orrs r2, r4
	strh r2, [r6]
	mov r2, r8
	lsrs r2, r2, #0x16
	mov r8, r2
	ldrh r2, [r5]
	ands r3, r2
	mov r7, r8
	orrs r3, r7
	strh r3, [r5]
	ldr r2, _0818F5FC
	mov r8, r2
	add ip, r0
	add sb, r1
	mov r3, sb
	lsls r4, r3, #1
	mov r7, ip
	lsls r3, r7, #1
	ldr r7, _0818F608
	movs r6, #2
_0818F5D0:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r7
	adds r2, r0, r3
	ldrh r5, [r2]
	adds r0, r0, r4
	ldrh r1, [r0]
	strh r1, [r2]
	strh r5, [r0]
	adds r4, #2
	adds r3, #2
	subs r6, #1
	cmp r6, #0
	bge _0818F5D0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818F5FC: .4byte 0x03005AF0
_0818F600: .4byte 0x00000D24
_0818F604: .4byte 0xFFFFFC00
_0818F608: .4byte 0x00000D64
	thumb_func_end SwapDomeTrainers

	thumb_func_start BufferDomeRoundText
BufferDomeRoundText: @ 0x0818F60C
	push {lr}
	ldr r0, _0818F62C
	ldr r2, _0818F630
	ldr r1, _0818F634
	ldr r1, [r1]
	ldr r3, _0818F638
	adds r1, r1, r3
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_0818F62C: .4byte 0x02021C40
_0818F630: .4byte 0x085ABD3C
_0818F634: .4byte 0x03005AF0
_0818F638: .4byte 0x00000CB2
	thumb_func_end BufferDomeRoundText

	thumb_func_start BufferDomeOpponentName
BufferDomeOpponentName: @ 0x0818F63C
	push {lr}
	ldr r0, _0818F664
	ldr r2, _0818F668
	ldr r1, _0818F66C
	ldr r1, [r1]
	ldr r3, _0818F670
	adds r1, r1, r3
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _0818F674
	ldr r1, _0818F678
	ldrh r1, [r1]
	bl CopyDomeTrainerName
	pop {r0}
	bx r0
	.align 2, 0
_0818F664: .4byte 0x02021C40
_0818F668: .4byte 0x085ABD3C
_0818F66C: .4byte 0x03005AF0
_0818F670: .4byte 0x00000CB2
_0818F674: .4byte 0x02021C54
_0818F678: .4byte 0x0203886A
	thumb_func_end BufferDomeOpponentName

	thumb_func_start InitDomeOpponentParty
InitDomeOpponentParty: @ 0x0818F67C
	push {r4, r5, lr}
	ldr r1, _0818F6C0
	movs r0, #0
	str r0, [r1]
	ldr r4, _0818F6C4
	adds r0, r4, #0
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	ldr r5, _0818F6C8
	str r0, [r5]
	adds r4, #0x64
	adds r0, r4, #0
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	bl CalculatePlayerPartyCount
	ldr r0, _0818F6CC
	ldrh r0, [r0]
	bl TrainerIdToDomeTournamentId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CreateDomeOpponentMons
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818F6C0: .4byte 0x0203CA3C
_0818F6C4: .4byte 0x02024190
_0818F6C8: .4byte 0x0203CA40
_0818F6CC: .4byte 0x0203886A
	thumb_func_end InitDomeOpponentParty

	thumb_func_start CreateDomeOpponentMon
CreateDomeOpponentMon: @ 0x0818F6D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r5, r2, #0
	str r3, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x28]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	add r0, sp, #0xc
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	ldr r0, [sp, #0x28]
	bl GetDomeTrainerMonIvs
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #0x2c]
	bl SetFacilityPtrsGetLevel
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x64
	ldr r4, [sp, #0x10]
	adds r3, r4, #0
	muls r3, r0, r3
	str r3, [sp, #0x18]
	ldr r6, _0818F824
	adds r0, r3, r6
	ldr r7, _0818F828
	ldr r4, [r7]
	lsls r5, r5, #1
	ldr r3, [sp, #0x28]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r5, r1
	ldr r6, _0818F82C
	adds r4, r4, r6
	adds r4, r4, r1
	ldrh r3, [r4]
	ldr r7, _0818F830
	ldr r7, [r7]
	mov r8, r7
	lsls r3, r3, #4
	add r3, r8
	ldrh r1, [r3]
	ldrb r3, [r3, #0xc]
	ldr r6, [sp, #0x2c]
	str r6, [sp]
	ldrh r4, [r4]
	lsls r4, r4, #4
	add r4, r8
	ldrb r4, [r4, #0xb]
	str r4, [sp, #4]
	ldr r7, [sp, #0x14]
	str r7, [sp, #8]
	bl CreateMonWithEVSpreadNatureOTID
	add r0, sp, #0xc
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	movs r6, #0
	ldr r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	mov sl, r5
	ldr r3, _0818F82C
	mov sb, r3
	ldr r3, _0818F830
	mov r4, sl
	str r4, [sp, #0x20]
_0818F774:
	ldr r7, _0818F828
	ldr r1, [r7]
	ldr r2, [sp, #0x28]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	mov r8, r0
	mov r5, sl
	add r5, r8
	add r1, sb
	adds r1, r1, r5
	ldrh r0, [r1]
	ldr r1, [r3]
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r4, r6, #1
	adds r0, #2
	adds r0, r0, r4
	ldrh r1, [r0]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	ldr r7, [sp, #0x1c]
	ldr r2, _0818F824
	adds r0, r7, r2
	mov r2, ip
	str r3, [sp, #0x24]
	bl SetMonMoveSlot
	ldr r7, _0818F828
	ldr r0, [r7]
	add r0, sb
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r3, [sp, #0x24]
	ldr r1, [r3]
	lsls r0, r0, #4
	adds r0, r0, r1
	adds r0, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0xda
	bne _0818F7D0
	movs r1, #0
	add r0, sp, #0xc
	strb r1, [r0]
_0818F7D0:
	adds r6, #1
	cmp r6, #3
	ble _0818F774
	movs r0, #0x64
	ldr r1, [sp, #0x10]
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _0818F824
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	add r2, sp, #0xc
	bl SetMonData
	ldr r0, _0818F828
	ldr r0, [r0]
	ldr r1, [sp, #0x20]
	add r1, r8
	ldr r2, _0818F82C
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0818F830
	ldr r1, [r1]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r2, [r0, #0xa]
	lsls r2, r2, #1
	ldr r0, _0818F834
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818F824: .4byte 0x020243E8
_0818F828: .4byte 0x03005AF0
_0818F82C: .4byte 0x00000D64
_0818F830: .4byte 0x0203B958
_0818F834: .4byte 0x085ADBF4
	thumb_func_end CreateDomeOpponentMon

	thumb_func_start CreateDomeOpponentMons
CreateDomeOpponentMons: @ 0x0818F838
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r6, #0
	bl ZeroEnemyPartyMons
	mov r0, r8
	bl GetDomeTrainerMonCountInBits
	adds r5, r0, #0
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	lsls r0, r0, #0x10
	orrs r7, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bls _0818F8A2
	movs r4, #0
_0818F87C:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0818F898
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	mov r1, r8
	adds r3, r7, #0
	bl CreateDomeOpponentMon
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0818F898:
	asrs r5, r5, #1
	adds r4, #1
	cmp r4, #2
	ble _0818F87C
	b _0818F8C8
_0818F8A2:
	movs r4, #2
_0818F8A4:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0818F8C0
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	mov r1, r8
	adds r3, r7, #0
	bl CreateDomeOpponentMon
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0818F8C0:
	lsls r5, r5, #1
	subs r4, #1
	cmp r4, #0
	bge _0818F8A4
_0818F8C8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateDomeOpponentMons

	thumb_func_start GetDomeTrainerMonCountInBits
GetDomeTrainerMonCountInBits: @ 0x0818F8D4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0818F8FE
	adds r0, r4, #0
	movs r1, #0
	bl sub_0818F918
	cmp r0, #0
	bne _0818F912
	adds r0, r4, #0
	movs r1, #1
	bl sub_0818FA14
	b _0818F912
_0818F8FE:
	adds r0, r5, #0
	movs r1, #0
	bl sub_0818FA14
	cmp r0, #0
	bne _0818F912
	adds r0, r5, #0
	movs r1, #1
	bl sub_0818F918
_0818F912:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetDomeTrainerMonCountInBits

	thumb_func_start sub_0818F918
sub_0818F918: @ 0x0818F918
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	movs r0, #0
	mov sb, r0
	mov r1, r8
	lsls r1, r1, #2
	str r1, [sp, #0x18]
_0818F93A:
	mov r2, sb
	lsls r0, r2, #2
	mov r2, sp
	adds r1, r2, r0
	movs r0, #0
	str r0, [r1]
	movs r7, #0
	mov r0, sb
	adds r0, #1
	str r0, [sp, #0x14]
	adds r5, r1, #0
	mov r1, sb
	lsls r1, r1, #1
	str r1, [sp, #0x10]
_0818F956:
	movs r6, #0
	adds r2, r7, #1
	mov sl, r2
_0818F95C:
	ldr r0, _0818F98C
	ldr r1, [r0]
	ldr r2, [sp, #0x18]
	adds r0, r1, r2
	ldr r2, _0818F990
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	ldr r2, _0818F994
	cmp r0, r2
	bne _0818F998
	mov r1, sb
	lsls r0, r1, #0x18
	lsls r1, r7, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl GetFrontierBrainMonMove
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	b _0818F9BC
	.align 2, 0
_0818F98C: .4byte 0x03005AF0
_0818F990: .4byte 0x00000D24
_0818F994: .4byte 0x000003FE
_0818F998:
	mov r2, r8
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #1
	ldr r2, [sp, #0x10]
	adds r0, r2, r0
	ldr r2, _0818FA08
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _0818FA0C
	ldr r1, [r1]
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r1, r7, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r4, [r0]
_0818F9BC:
	movs r0, #0x64
	muls r0, r6, r0
	ldr r1, _0818FA10
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl GetTypeEffectivenessPoints
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	adds r6, #1
	cmp r6, #2
	ble _0818F95C
	mov r7, sl
	cmp r7, #3
	ble _0818F956
	ldr r0, [sp, #0x14]
	mov sb, r0
	cmp r0, #2
	ble _0818F93A
	mov r0, sp
	ldr r1, [sp, #0xc]
	bl sub_0818FB10
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818FA08: .4byte 0x00000D64
_0818FA0C: .4byte 0x0203B958
_0818FA10: .4byte 0x02024190
	thumb_func_end sub_0818F918

	thumb_func_start sub_0818FA14
sub_0818FA14: @ 0x0818FA14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	movs r0, #0
	mov sb, r0
	mov r1, r8
	lsls r1, r1, #2
	str r1, [sp, #0x18]
_0818FA36:
	mov r2, sb
	lsls r0, r2, #2
	mov r2, sp
	adds r1, r2, r0
	movs r0, #0
	str r0, [r1]
	movs r7, #0
	mov r0, sb
	adds r0, #1
	str r0, [sp, #0x14]
	adds r5, r1, #0
	mov r1, sb
	lsls r1, r1, #1
	str r1, [sp, #0x10]
_0818FA52:
	movs r6, #0
	adds r2, r7, #1
	mov sl, r2
_0818FA58:
	ldr r0, _0818FA88
	ldr r1, [r0]
	ldr r2, [sp, #0x18]
	adds r0, r1, r2
	ldr r2, _0818FA8C
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	ldr r2, _0818FA90
	cmp r0, r2
	bne _0818FA94
	mov r1, sb
	lsls r0, r1, #0x18
	lsls r1, r7, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl GetFrontierBrainMonMove
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	b _0818FAB8
	.align 2, 0
_0818FA88: .4byte 0x03005AF0
_0818FA8C: .4byte 0x00000D24
_0818FA90: .4byte 0x000003FE
_0818FA94:
	mov r2, r8
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #1
	ldr r2, [sp, #0x10]
	adds r0, r2, r0
	ldr r2, _0818FB04
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _0818FB08
	ldr r1, [r1]
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r1, r7, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r4, [r0]
_0818FAB8:
	movs r0, #0x64
	muls r0, r6, r0
	ldr r1, _0818FB0C
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl GetTypeEffectivenessPoints
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	adds r6, #1
	cmp r6, #2
	ble _0818FA58
	mov r7, sl
	cmp r7, #3
	ble _0818FA52
	ldr r0, [sp, #0x14]
	mov sb, r0
	cmp r0, #2
	ble _0818FA36
	mov r0, sp
	ldr r1, [sp, #0xc]
	bl sub_0818FB10
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818FB04: .4byte 0x00000D64
_0818FB08: .4byte 0x0203B958
_0818FB0C: .4byte 0x02024190
	thumb_func_end sub_0818FA14

	thumb_func_start sub_0818FB10
sub_0818FB10: @ 0x0818FB10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	str r0, [sp, #0xc]
	movs r3, #2
	add r0, sp, #8
_0818FB2A:
	str r3, [r0]
	subs r0, #4
	subs r3, #1
	cmp r3, #0
	bge _0818FB2A
	mov r3, sl
	ldr r2, [r3]
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0818FB7C
	ldr r0, [r3, #8]
	cmp r2, r0
	bne _0818FB7C
	cmp r1, #0
	beq _0818FC06
	movs r3, #0
	ldr r4, _0818FB78
_0818FB4C:
	str r3, [sp, #0x14]
	bl Random
	movs r1, #3
	ands r1, r0
	ldr r3, [sp, #0x14]
	cmp r1, #3
	beq _0818FB72
	lsls r0, r1, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _0818FB72
	ldr r0, [sp, #0xc]
	orrs r0, r1
	str r0, [sp, #0xc]
	adds r3, #1
_0818FB72:
	cmp r3, #2
	bne _0818FB4C
	b _0818FC06
	.align 2, 0
_0818FB78: .4byte 0x082FACB4
_0818FB7C:
	movs r3, #0
	mov sb, sp
	mov r8, sl
_0818FB82:
	adds r2, r3, #1
	cmp r2, #2
	bgt _0818FBE0
	mov r6, r8
	mov r7, sb
	lsls r0, r2, #2
	mov r1, sp
	adds r5, r0, r1
	mov r1, sl
	adds r4, r0, r1
_0818FB96:
	ldr r0, [r6]
	ldr r1, [r4]
	cmp r0, r1
	bge _0818FBAA
	str r1, [r6]
	str r0, [r4]
	ldr r1, [r7]
	ldr r0, [r5]
	str r0, [r7]
	str r1, [r5]
_0818FBAA:
	ldr r1, [r6]
	ldr r0, [r4]
	cmp r1, r0
	bne _0818FBD6
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	bl Random
	movs r1, #1
	ands r1, r0
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	cmp r1, #0
	beq _0818FBD6
	ldr r1, [r6]
	ldr r0, [r4]
	str r0, [r6]
	str r1, [r4]
	ldr r1, [r7]
	ldr r0, [r5]
	str r0, [r7]
	str r1, [r5]
_0818FBD6:
	adds r5, #4
	adds r4, #4
	adds r2, #1
	cmp r2, #2
	ble _0818FB96
_0818FBE0:
	movs r4, #4
	add sb, r4
	add r8, r4
	adds r3, #1
	cmp r3, #1
	ble _0818FB82
	ldr r2, _0818FC18
	mov r1, sp
	movs r3, #1
_0818FBF2:
	ldm r1!, {r0}
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r4, [sp, #0xc]
	orrs r4, r0
	str r4, [sp, #0xc]
	subs r3, #1
	cmp r3, #0
	bge _0818FBF2
_0818FC06:
	ldr r0, [sp, #0xc]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818FC18: .4byte 0x082FACB4
	thumb_func_end sub_0818FB10

	thumb_func_start GetTypeEffectivenessPoints
GetTypeEffectivenessPoints: @ 0x0818FC1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r3, r0, #0
	adds r4, r1, #0
	str r2, [sp]
	movs r6, #0
	movs r2, #0x14
	cmp r3, #0
	beq _0818FC4C
	ldr r0, _0818FC50
	cmp r3, r0
	beq _0818FC4C
	ldr r0, _0818FC54
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3, #1]
	cmp r0, #0
	bne _0818FC58
_0818FC4C:
	movs r0, #0
	b _0818FDB2
	.align 2, 0
_0818FC50: .4byte 0x0000FFFF
_0818FC54: .4byte 0x082ED220
_0818FC58:
	ldr r1, _0818FC84
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #6]
	mov sl, r1
	ldrb r1, [r0, #7]
	mov sb, r1
	ldrb r0, [r0, #0x16]
	mov r8, r0
	ldrb r3, [r3, #2]
	str r3, [sp, #4]
	cmp r0, #0x1a
	bne _0818FC88
	cmp r3, #4
	bne _0818FC88
	ldr r0, [sp]
	cmp r0, #1
	bne _0818FD06
	movs r2, #8
	b _0818FD00
	.align 2, 0
_0818FC84: .4byte 0x082F0D54
_0818FC88:
	ldr r0, _0818FD14
	adds r1, r6, r0
	ldrb r0, [r1]
	ldr r7, _0818FD14
	cmp r0, #0xff
	beq _0818FD00
	adds r4, r1, #0
_0818FC96:
	ldrb r0, [r4]
	cmp r0, #0xfe
	beq _0818FCF2
	ldrb r0, [r4]
	ldr r1, [sp, #4]
	cmp r0, r1
	bne _0818FCF2
	ldrb r0, [r4, #1]
	adds r5, r6, #1
	cmp r0, sl
	bne _0818FCC8
	adds r1, r6, #2
	mov r0, r8
	cmp r0, #0x19
	bne _0818FCBA
	ldrb r0, [r4, #2]
	cmp r0, #0x28
	bne _0818FCC8
_0818FCBA:
	adds r0, r1, r7
	ldrb r0, [r0]
	muls r0, r2, r0
	movs r1, #0xa
	bl __divsi3
	adds r2, r0, #0
_0818FCC8:
	adds r0, r5, r7
	ldrb r0, [r0]
	cmp r0, sb
	bne _0818FCF2
	cmp sl, sb
	beq _0818FCF2
	adds r1, r6, #2
	mov r0, r8
	cmp r0, #0x19
	bne _0818FCE4
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0x28
	bne _0818FCF2
_0818FCE4:
	adds r0, r1, r7
	ldrb r0, [r0]
	muls r0, r2, r0
	movs r1, #0xa
	bl __divsi3
	adds r2, r0, #0
_0818FCF2:
	adds r4, #3
	adds r6, #3
	ldr r1, _0818FD14
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0818FC96
_0818FD00:
	ldr r0, [sp]
	cmp r0, #1
	beq _0818FD3C
_0818FD06:
	ldr r1, [sp]
	cmp r1, #1
	bgt _0818FD18
	cmp r1, #0
	beq _0818FD20
	b _0818FDB0
	.align 2, 0
_0818FD14: .4byte 0x082EBB38
_0818FD18:
	ldr r0, [sp]
	cmp r0, #2
	beq _0818FD70
	b _0818FDB0
_0818FD20:
	cmp r2, #0xa
	beq _0818FDA2
	cmp r2, #0xa
	ble _0818FDA2
	cmp r2, #0x28
	beq _0818FDA6
	cmp r2, #0x28
	bgt _0818FD36
	cmp r2, #0x14
	beq _0818FD60
	b _0818FDA2
_0818FD36:
	cmp r2, #0x50
	bne _0818FDA2
	b _0818FD5C
_0818FD3C:
	cmp r2, #0xa
	beq _0818FD60
	cmp r2, #0xa
	bgt _0818FD4E
	cmp r2, #0
	beq _0818FD5C
	cmp r2, #5
	beq _0818FDA6
	b _0818FDA2
_0818FD4E:
	cmp r2, #0x28
	beq _0818FD64
	cmp r2, #0x28
	ble _0818FDA2
	cmp r2, #0x50
	beq _0818FD6A
	b _0818FDA2
_0818FD5C:
	movs r2, #8
	b _0818FDB0
_0818FD60:
	movs r2, #2
	b _0818FDB0
_0818FD64:
	movs r2, #2
	rsbs r2, r2, #0
	b _0818FDB0
_0818FD6A:
	movs r2, #4
	rsbs r2, r2, #0
	b _0818FDB0
_0818FD70:
	cmp r2, #0xa
	beq _0818FDA2
	cmp r2, #0xa
	bgt _0818FD82
	cmp r2, #0
	beq _0818FD96
	cmp r2, #5
	beq _0818FD9C
	b _0818FDA2
_0818FD82:
	cmp r2, #0x28
	beq _0818FDAA
	cmp r2, #0x28
	bgt _0818FD90
	cmp r2, #0x14
	beq _0818FDA6
	b _0818FDA2
_0818FD90:
	cmp r2, #0x50
	beq _0818FDAE
	b _0818FDA2
_0818FD96:
	movs r2, #0x10
	rsbs r2, r2, #0
	b _0818FDB0
_0818FD9C:
	movs r2, #8
	rsbs r2, r2, #0
	b _0818FDB0
_0818FDA2:
	movs r2, #0
	b _0818FDB0
_0818FDA6:
	movs r2, #4
	b _0818FDB0
_0818FDAA:
	movs r2, #0xc
	b _0818FDB0
_0818FDAE:
	movs r2, #0x14
_0818FDB0:
	adds r0, r2, #0
_0818FDB2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetTypeEffectivenessPoints

	thumb_func_start GetDomeTrainerMonIvs
GetDomeTrainerMonIvs: @ 0x0818FDC4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	cmp r0, #0x63
	bls _0818FDF6
	movs r1, #6
	cmp r0, #0x77
	bls _0818FDF6
	movs r1, #9
	cmp r0, #0x8b
	bls _0818FDF6
	movs r1, #0xc
	cmp r0, #0x9f
	bls _0818FDF6
	movs r1, #0xf
	cmp r0, #0xb3
	bls _0818FDF6
	movs r1, #0x12
	cmp r0, #0xc7
	bls _0818FDF6
	movs r1, #0x1f
	cmp r0, #0xdb
	bhi _0818FDF6
	movs r1, #0x15
_0818FDF6:
	adds r0, r1, #0
	pop {r1}
	bx r1
	thumb_func_end GetDomeTrainerMonIvs

	thumb_func_start TournamentIdOfOpponent
TournamentIdOfOpponent: @ 0x0818FDFC
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r5, #0
	ldr r0, _0818FE4C
	ldr r1, [r0]
	ldr r4, _0818FE50
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	mov ip, r0
	ldr r6, _0818FE54
	cmp r1, r2
	beq _0818FE34
	mov r7, ip
_0818FE1C:
	adds r5, #1
	cmp r5, #0xf
	bgt _0818FE34
	ldr r0, [r7]
	lsls r1, r5, #2
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r2
	bne _0818FE1C
_0818FE34:
	cmp r3, #0
	beq _0818FEC8
	cmp r3, #3
	bne _0818FE58
	lsls r0, r5, #2
	adds r1, r0, #3
	adds r1, r1, r6
	ldrb r1, [r1]
	adds r4, r1, #0
	adds r4, #8
	b _0818FE62
	.align 2, 0
_0818FE4C: .4byte 0x03005AF0
_0818FE50: .4byte 0x00000D24
_0818FE54: .4byte 0x085D5B88
_0818FE58:
	lsls r0, r5, #2
	adds r1, r3, r0
	adds r1, r1, r6
	ldrb r1, [r1]
	adds r4, r1, #4
_0818FE62:
	adds r0, r3, r0
	adds r0, r0, r6
	ldrb r2, [r0]
	cmp r2, r4
	bge _0818FEB2
	ldr r1, _0818FE88
	adds r0, r2, r1
	ldrb r3, [r0]
	adds r6, r1, #0
	cmp r3, r5
	beq _0818FE90
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r3, #2
	adds r0, r0, r1
	ldr r3, _0818FE8C
	adds r0, r0, r3
	b _0818FEAA
	.align 2, 0
_0818FE88: .4byte 0x085D5BC8
_0818FE8C: .4byte 0x00000D25
_0818FE90:
	adds r2, #1
	cmp r2, r4
	bge _0818FEB2
	adds r0, r2, r6
	ldrb r1, [r0]
	cmp r1, r5
	beq _0818FE90
	mov r3, ip
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _0818FEC0
	adds r0, r0, r1
_0818FEAA:
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _0818FE90
_0818FEB2:
	cmp r2, r4
	beq _0818FEE2
	ldr r0, _0818FEC4
	adds r0, r2, r0
	ldrb r0, [r0]
	b _0818FEEE
	.align 2, 0
_0818FEC0: .4byte 0x00000D25
_0818FEC4: .4byte 0x085D5BC8
_0818FEC8:
	mov r3, ip
	ldr r1, [r3]
	lsls r0, r5, #2
	adds r0, r0, r6
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r1, r1, r0
	ldr r0, _0818FEE8
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _0818FEEC
_0818FEE2:
	movs r0, #0xff
	b _0818FEEE
	.align 2, 0
_0818FEE8: .4byte 0x00000D25
_0818FEEC:
	adds r0, r2, #0
_0818FEEE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end TournamentIdOfOpponent

	thumb_func_start SetDomeOpponentId
SetDomeOpponentId: @ 0x0818FEF4
	push {lr}
	bl TrainerIdOfPlayerOpponent
	ldr r1, _0818FF04
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0818FF04: .4byte 0x0203886A
	thumb_func_end SetDomeOpponentId

	thumb_func_start TrainerIdOfPlayerOpponent
TrainerIdOfPlayerOpponent: @ 0x0818FF08
	push {r4, lr}
	ldr r0, _0818FF30
	ldr r4, [r0]
	ldr r1, _0818FF34
	adds r0, r4, r1
	ldrh r0, [r0]
	ldr r1, _0818FF38
	bl TournamentIdOfOpponent
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, _0818FF3C
	adds r4, r4, r0
	ldrh r0, [r4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0818FF30: .4byte 0x03005AF0
_0818FF34: .4byte 0x00000CB2
_0818FF38: .4byte 0x000003FF
_0818FF3C: .4byte 0x00000D24
	thumb_func_end TrainerIdOfPlayerOpponent

	thumb_func_start SetDomeOpponentGraphicsId
SetDomeOpponentGraphicsId: @ 0x0818FF40
	push {lr}
	ldr r0, _0818FF50
	ldrh r0, [r0]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	pop {r0}
	bx r0
	.align 2, 0
_0818FF50: .4byte 0x0203886A
	thumb_func_end SetDomeOpponentGraphicsId

	thumb_func_start sub_0818FF54
sub_0818FF54: @ 0x0818FF54
	push {r4, lr}
	ldr r4, _0818FF88
	ldr r0, [r4]
	ldr r1, _0818FF8C
	ldrh r1, [r1]
	ldr r2, _0818FF90
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _0818FF94
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
_0818FF88: .4byte 0x03005AF0
_0818FF8C: .4byte 0x02037282
_0818FF90: .4byte 0x00000CA8
_0818FF94: .4byte 0x00000CA9
	thumb_func_end sub_0818FF54

	thumb_func_start UpdateDomeStreaks
UpdateDomeStreaks: @ 0x0818FF98
	push {r4, r5, lr}
	ldr r5, _0818FFF8
	ldr r0, [r5]
	ldr r1, _0818FFFC
	adds r0, r0, r1
	ldrb r4, [r0]
	lsls r4, r4, #0x1e
	lsrs r4, r4, #0x1e
	ldr r0, _08190000
	bl VarGet
	lsls r0, r0, #0x18
	ldr r1, [r5]
	lsls r4, r4, #1
	lsrs r0, r0, #0x16
	adds r4, r4, r0
	ldr r3, _08190004
	adds r1, r1, r3
	adds r1, r1, r4
	ldrh r0, [r1]
	ldr r2, _08190008
	cmp r0, r2
	bhi _0818FFCA
	adds r0, #1
	strh r0, [r1]
_0818FFCA:
	ldr r0, [r5]
	ldr r1, _0819000C
	adds r0, r0, r1
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r2
	bhi _0818FFDC
	adds r0, #1
	strh r0, [r1]
_0818FFDC:
	ldr r0, [r5]
	adds r1, r0, r3
	adds r1, r1, r4
	ldr r2, _08190010
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r1, [r1]
	ldrh r2, [r0]
	cmp r1, r2
	bls _0818FFF2
	strh r1, [r0]
_0818FFF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818FFF8: .4byte 0x03005AF0
_0818FFFC: .4byte 0x00000CA9
_08190000: .4byte 0x000040CE
_08190004: .4byte 0x00000D0C
_08190008: .4byte 0x000003E6
_0819000C: .4byte 0x00000D1C
_08190010: .4byte 0x00000D14
	thumb_func_end UpdateDomeStreaks

	thumb_func_start ShowDomeOpponentInfo
ShowDomeOpponentInfo: @ 0x08190014
	push {r4, r5, lr}
	ldr r0, _08190050
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08190054
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r5, #0
	strh r5, [r4, #8]
	bl TrainerIdOfPlayerOpponent
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl TrainerIdToDomeTournamentId
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0xe]
	ldr r0, _08190058
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08190050: .4byte 0x0819005D
_08190054: .4byte 0x03005B60
_08190058: .4byte 0x08194755
	thumb_func_end ShowDomeOpponentInfo

	thumb_func_start Task_ShowOpponentInfo
Task_ShowOpponentInfo: @ 0x0819005C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r1, _08190098
	lsls r0, r0, #2
	add r0, sl
	lsls r0, r0, #3
	adds r6, r0, r1
	movs r0, #0xa
	ldrsh r5, [r6, r0]
	movs r2, #0xc
	ldrsh r1, [r6, r2]
	mov sb, r1
	movs r0, #0xe
	ldrsh r7, [r6, r0]
	movs r1, #8
	ldrsh r4, [r6, r1]
	cmp r4, #1
	beq _08190164
	cmp r4, #1
	bgt _0819009C
	cmp r4, #0
	beq _081900AA
	b _081903CE
	.align 2, 0
_08190098: .4byte 0x03005B60
_0819009C:
	cmp r4, #2
	bne _081900A2
	b _081901CC
_081900A2:
	cmp r4, #3
	bne _081900A8
	b _08190290
_081900A8:
	b _081903CE
_081900AA:
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #1
	bl EnableInterrupts
	str r4, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0819010C
	add r0, sp, #4
	bl CpuSet
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08190110
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r0, _08190114
	bl InitWindows
	bl DeactivateAllTextPrinters
	ldr r0, _08190118
	strh r4, [r0]
	ldr r0, _0819011C
	strh r4, [r0]
	ldr r0, _08190120
	strh r4, [r0]
	ldr r0, _08190124
	strh r4, [r0]
	ldr r0, _08190128
	strh r4, [r0]
	ldr r0, _0819012C
	strh r4, [r0]
	mov r2, sb
	cmp r2, #2
	bne _08190138
	ldr r0, _08190130
	strh r4, [r0]
	ldr r0, _08190134
	strh r4, [r0]
	b _08190142
	.align 2, 0
_0819010C: .4byte 0x05006000
_08190110: .4byte 0x085D5928
_08190114: .4byte 0x085D5958
_08190118: .4byte 0x02022AC8
_0819011C: .4byte 0x02022ACA
_08190120: .4byte 0x02022ACC
_08190124: .4byte 0x02022ACE
_08190128: .4byte 0x02022AD4
_0819012C: .4byte 0x02022AD6
_08190130: .4byte 0x02022AD0
_08190134: .4byte 0x02022AD2
_08190138:
	ldr r0, _08190158
	strh r4, [r0]
	ldr r1, _0819015C
	movs r0, #0xa0
	strh r0, [r1]
_08190142:
	ldr r0, _08190160
	mov r2, sl
	lsls r1, r2, #2
	add r1, sl
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _081903CE
	.align 2, 0
_08190158: .4byte 0x02022AD0
_0819015C: .4byte 0x02022AD2
_08190160: .4byte 0x03005B60
_08190164:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x42
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x46
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x3f
	bl SetGpuReg
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _081901C8
	movs r0, #4
	strb r0, [r1]
	b _0819025E
	.align 2, 0
_081901C8: .4byte 0x030030BC
_081901CC:
	ldr r1, _08190268
	movs r5, #0x80
	lsls r5, r5, #6
	movs r7, #0
	str r7, [sp]
	movs r0, #2
	adds r2, r5, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _0819026C
	movs r4, #1
	str r4, [sp]
	movs r0, #2
	adds r2, r5, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _08190270
	movs r2, #0x80
	lsls r2, r2, #4
	str r4, [sp]
	movs r0, #3
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, _08190274
	bl LoadCompressedSpriteSheet
	ldr r0, _08190278
	movs r4, #0x80
	lsls r4, r4, #2
	movs r1, #0
	adds r2, r4, #0
	bl LoadCompressedPalette
	ldr r0, _0819027C
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r4, #0
	bl LoadCompressedPalette
	ldr r0, _08190280
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadCompressedPalette
	mov r0, sb
	cmp r0, #2
	bne _0819023A
	ldr r0, _08190284
	movs r1, #0x50
	movs r2, #0x20
	bl LoadCompressedPalette
_0819023A:
	str r7, [sp, #8]
	add r0, sp, #8
	ldr r1, _08190288
	ldr r2, _0819028C
	bl CpuSet
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
_0819025E:
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	b _081903CE
	.align 2, 0
_08190268: .4byte 0x08D83DF4
_0819026C: .4byte 0x08D84A08
_08190270: .4byte 0x08D84F98
_08190274: .4byte 0x085D59FC
_08190278: .4byte 0x08D8533C
_0819027C: .4byte 0x08D85428
_08190280: .4byte 0x08D855E4
_08190284: .4byte 0x08D854AC
_08190288: .4byte 0x020377B4
_0819028C: .4byte 0x05000100
_08190290:
	ldr r0, _081902F4
	bl SetVBlankCallback
	ldr r4, _081902F8
	movs r0, #0x14
	bl AllocZeroed
	str r0, [r4]
	movs r6, #0
	lsls r5, r5, #0x18
	movs r2, #0xff
_081902A6:
	ldr r1, [r4]
	adds r1, r1, r6
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r6, #1
	cmp r6, #0xf
	ble _081902A6
	bl LoadMonIconPalettes
	ldr r0, _081902FC
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08190300
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xc]
	mov r1, sb
	strh r1, [r0, #0xe]
	strh r7, [r0, #0x10]
	mov r2, sb
	cmp r2, #2
	bne _08190304
	lsrs r1, r5, #0x18
	movs r0, #0
	bl DisplayMatchInfoOnCard
	ldr r0, _081902F8
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x10]
	b _0819030C
	.align 2, 0
_081902F4: .4byte 0x08194771
_081902F8: .4byte 0x0203CA44
_081902FC: .4byte 0x08190931
_08190300: .4byte 0x03005B60
_08190304:
	lsrs r1, r5, #0x18
	movs r0, #0
	bl DisplayTrainerInfoOnCard
_0819030C:
	movs r1, #0xfa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	mov r0, sb
	cmp r0, #0
	beq _081903C8
	ldr r5, _081903E0
	adds r0, r5, #0
	movs r1, #0x78
	movs r2, #4
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	ldr r1, _081903E4
	mov r8, r1
	add r4, r8
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
	strh r6, [r4, #0x2e]
	adds r0, r5, #0
	movs r1, #0x78
	movs r2, #0x9c
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	add r4, r8
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	strh r6, [r4, #0x2e]
	ldr r5, _081903E8
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	mov r2, r8
	adds r4, r0, r2
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
	strh r6, [r4, #0x2e]
	movs r0, #0
	strh r0, [r4, #0x30]
	mov r1, sb
	cmp r1, #1
	bne _081903A2
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_081903A2:
	adds r0, r5, #0
	movs r1, #0xea
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	add r4, r8
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	strh r6, [r4, #0x2e]
	movs r0, #1
	strh r0, [r4, #0x30]
_081903C8:
	mov r0, sl
	bl DestroyTask
_081903CE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081903E0: .4byte 0x085D5AE4
_081903E4: .4byte 0x020205AC
_081903E8: .4byte 0x085D5ACC
	thumb_func_end Task_ShowOpponentInfo

	thumb_func_start SpriteCb_TrainerIconCardScrollUp
SpriteCb_TrainerIconCardScrollUp: @ 0x081903EC
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x22]
	adds r1, r0, #4
	strh r1, [r2, #0x22]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _08190430
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	blt _08190418
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
_08190418:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _0819044C
	ldr r0, _0819042C
	str r0, [r2, #0x1c]
	b _0819044C
	.align 2, 0
_0819042C: .4byte 0x08007141
_08190430:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xbf
	ble _0819044C
	ldr r0, _08190450
	ldr r0, [r0]
	movs r3, #0x32
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldrh r0, [r2, #0x34]
	bl FreeAndDestroyTrainerPicSprite
_0819044C:
	pop {r0}
	bx r0
	.align 2, 0
_08190450: .4byte 0x0203CA44
	thumb_func_end SpriteCb_TrainerIconCardScrollUp

	thumb_func_start SpriteCb_TrainerIconCardScrollDown
SpriteCb_TrainerIconCardScrollDown: @ 0x08190454
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x22]
	subs r1, r0, #4
	strh r1, [r2, #0x22]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _08190494
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	bgt _0819047C
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
_0819047C:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _081904B4
	ldr r0, _08190490
	str r0, [r2, #0x1c]
	b _081904B4
	.align 2, 0
_08190490: .4byte 0x08007141
_08190494:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _081904B4
	ldr r0, _081904B8
	ldr r0, [r0]
	movs r3, #0x32
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldrh r0, [r2, #0x34]
	bl FreeAndDestroyTrainerPicSprite
_081904B4:
	pop {r0}
	bx r0
	.align 2, 0
_081904B8: .4byte 0x0203CA44
	thumb_func_end SpriteCb_TrainerIconCardScrollDown

	thumb_func_start SpriteCb_TrainerIconCardScrollLeft
SpriteCb_TrainerIconCardScrollLeft: @ 0x081904BC
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x20]
	adds r1, r0, #4
	strh r1, [r2, #0x20]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _08190500
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	blt _081904E8
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
_081904E8:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bne _0819051C
	ldr r0, _081904FC
	str r0, [r2, #0x1c]
	b _0819051C
	.align 2, 0
_081904FC: .4byte 0x08007141
_08190500:
	lsls r1, r1, #0x10
	ldr r0, _08190520
	cmp r1, r0
	ble _0819051C
	ldr r0, _08190524
	ldr r0, [r0]
	movs r3, #0x32
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldrh r0, [r2, #0x34]
	bl FreeAndDestroyTrainerPicSprite
_0819051C:
	pop {r0}
	bx r0
	.align 2, 0
_08190520: .4byte 0x010F0000
_08190524: .4byte 0x0203CA44
	thumb_func_end SpriteCb_TrainerIconCardScrollLeft

	thumb_func_start SpriteCb_TrainerIconCardScrollRight
SpriteCb_TrainerIconCardScrollRight: @ 0x08190528
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x20]
	subs r1, r0, #4
	strh r1, [r2, #0x20]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0819056C
	lsls r1, r1, #0x10
	movs r0, #0x88
	lsls r0, r0, #0x11
	cmp r1, r0
	bgt _08190552
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
_08190552:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bne _0819058C
	ldr r0, _08190568
	str r0, [r2, #0x1c]
	b _0819058C
	.align 2, 0
_08190568: .4byte 0x08007141
_0819056C:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _0819058C
	ldr r0, _08190590
	ldr r0, [r0]
	movs r3, #0x32
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldrh r0, [r2, #0x34]
	bl FreeAndDestroyTrainerPicSprite
_0819058C:
	pop {r0}
	bx r0
	.align 2, 0
_08190590: .4byte 0x0203CA44
	thumb_func_end SpriteCb_TrainerIconCardScrollRight

	thumb_func_start SpriteCb_MonIcon
SpriteCb_MonIcon: @ 0x08190594
	push {lr}
	adds r1, r0, #0
	movs r2, #0x34
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _081905A6
	adds r0, r1, #0
	bl UpdateMonIconFrame
_081905A6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCb_MonIcon

	thumb_func_start SpriteCb_MonIconCardScrollUp
SpriteCb_MonIconCardScrollUp: @ 0x081905AC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081905BE
	adds r0, r4, #0
	bl UpdateMonIconFrame
_081905BE:
	ldrh r0, [r4, #0x22]
	adds r1, r0, #4
	strh r1, [r4, #0x22]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08190600
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	blt _081905E6
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_081905E6:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _0819061C
	ldr r0, _081905FC
	str r0, [r4, #0x1c]
	b _0819061C
	.align 2, 0
_081905FC: .4byte 0x08190595
_08190600:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xaf
	ble _0819061C
	ldr r0, _08190624
	ldr r0, [r0]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_080D2798
_0819061C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08190624: .4byte 0x0203CA44
	thumb_func_end SpriteCb_MonIconCardScrollUp

	thumb_func_start SpriteCb_MonIconCardScrollDown
SpriteCb_MonIconCardScrollDown: @ 0x08190628
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0819063A
	adds r0, r4, #0
	bl UpdateMonIconFrame
_0819063A:
	ldrh r0, [r4, #0x22]
	subs r1, r0, #4
	strh r1, [r4, #0x22]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08190678
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb0
	bgt _0819065E
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0819065E:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _08190698
	ldr r0, _08190674
	str r0, [r4, #0x1c]
	b _08190698
	.align 2, 0
_08190674: .4byte 0x08190595
_08190678:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _08190698
	ldr r0, _081906A0
	ldr r0, [r0]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_080D2798
_08190698:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081906A0: .4byte 0x0203CA44
	thumb_func_end SpriteCb_MonIconCardScrollDown

	thumb_func_start SpriteCb_MonIconCardScrollLeft
SpriteCb_MonIconCardScrollLeft: @ 0x081906A4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081906B6
	adds r0, r4, #0
	bl UpdateMonIconFrame
_081906B6:
	ldrh r0, [r4, #0x20]
	adds r1, r0, #4
	strh r1, [r4, #0x20]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _081906F8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	blt _081906DE
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_081906DE:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bne _08190714
	ldr r0, _081906F4
	str r0, [r4, #0x1c]
	b _08190714
	.align 2, 0
_081906F4: .4byte 0x08190595
_081906F8:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _08190714
	ldr r0, _0819071C
	ldr r0, [r0]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_080D2798
_08190714:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819071C: .4byte 0x0203CA44
	thumb_func_end SpriteCb_MonIconCardScrollLeft

	thumb_func_start SpriteCb_MonIconCardScrollRight
SpriteCb_MonIconCardScrollRight: @ 0x08190720
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08190732
	adds r0, r4, #0
	bl UpdateMonIconFrame
_08190732:
	ldrh r0, [r4, #0x20]
	subs r1, r0, #4
	strh r1, [r4, #0x20]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08190770
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	cmp r1, r0
	bgt _08190758
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_08190758:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bne _08190790
	ldr r0, _0819076C
	str r0, [r4, #0x1c]
	b _08190790
	.align 2, 0
_0819076C: .4byte 0x08190595
_08190770:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _08190790
	ldr r0, _08190798
	ldr r0, [r0]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_080D2798
_08190790:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08190798: .4byte 0x0203CA44
	thumb_func_end SpriteCb_MonIconCardScrollRight

	thumb_func_start sub_0819079C
sub_0819079C: @ 0x0819079C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	movs r0, #0x2e
	ldrsh r6, [r3, r0]
	ldr r2, _08190840
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r2
	movs r7, #0x10
	ldrsh r1, [r4, r7]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	ldr r1, _08190844
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sl, r0
	ldr r1, _08190848
	ldr r5, [r1]
	ldr r7, _0819084C
	adds r0, r5, r7
	ldrh r0, [r0]
	mov ip, r0
	movs r7, #0xe
	ldrsh r0, [r4, r7]
	mov sb, r2
	mov r8, r1
	cmp r0, #1
	bne _08190868
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _08190858
	mov r2, sl
	lsls r0, r2, #2
	adds r1, r5, r0
	ldr r7, _08190850
	adds r1, r1, r7
	ldrb r2, [r1]
	lsls r1, r2, #0x1d
	adds r4, r0, #0
	cmp r1, #0
	bge _08190812
	ldr r0, _08190854
	ldr r0, [r0]
	ldrb r1, [r0, #0x10]
	subs r1, #1
	lsls r0, r2, #0x1b
	lsrs r0, r0, #0x1e
	cmp r1, r0
	blt _0819088E
_08190812:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	ldr r2, _08190850
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _08190830
	ldr r0, _08190854
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	subs r0, #1
	cmp r0, ip
	blt _0819088E
_08190830:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	add r0, sb
	movs r7, #8
	ldrsh r0, [r0, r7]
	b _081908A8
	.align 2, 0
_08190840: .4byte 0x03005B60
_08190844: .4byte 0x085D5AFC
_08190848: .4byte 0x03005AF0
_0819084C: .4byte 0x00000CB2
_08190850: .4byte 0x00000D25
_08190854: .4byte 0x0203CA44
_08190858:
	ldr r0, _08190864
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _0819088E
	b _081908A4
	.align 2, 0
_08190864: .4byte 0x0203CA44
_08190868:
	movs r2, #0x30
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _08190884
	ldr r0, _08190880
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #1
	bls _0819088E
	movs r7, #8
	ldrsh r0, [r4, r7]
	b _081908A8
	.align 2, 0
_08190880: .4byte 0x0203CA44
_08190884:
	ldr r0, _081908A0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _081908A4
_0819088E:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _081908B8
	.align 2, 0
_081908A0: .4byte 0x0203CA44
_081908A4:
	movs r1, #8
	ldrsh r0, [r4, r1]
_081908A8:
	cmp r0, #2
	bne _081908B8
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_081908B8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819079C

	thumb_func_start sub_081908C8
sub_081908C8: @ 0x081908C8
	push {lr}
	adds r3, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	ldr r2, _081908F0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _081908F8
	ldr r0, _081908F4
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _08190902
	b _0819091C
	.align 2, 0
_081908F0: .4byte 0x03005B60
_081908F4: .4byte 0x0203CA44
_081908F8:
	ldr r0, _08190918
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #1
	beq _0819091C
_08190902:
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #2
	bne _0819092A
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _0819092A
	.align 2, 0
_08190918: .4byte 0x0203CA44
_0819091C:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0819092A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081908C8

	thumb_func_start sub_08190930
sub_08190930: @ 0x08190930
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _0819096C
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r2, [r0, r3]
	mov sb, r2
	movs r4, #0x10
	ldrsh r7, [r0, r4]
	movs r5, #8
	ldrsh r0, [r0, r5]
	cmp r0, #8
	bls _08190962
	bl _08191E5E
_08190962:
	lsls r0, r0, #2
	ldr r1, _08190970
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0819096C: .4byte 0x03005B60
_08190970: .4byte 0x08190974
_08190974: @ jump table
	.4byte _08190998 @ case 0
	.4byte _081909D8 @ case 1
	.4byte _08190A04 @ case 2
	.4byte _08190AA4 @ case 3
	.4byte _08191C54 @ case 4
	.4byte _08191C94 @ case 5
	.4byte _08191CD4 @ case 6
	.4byte _08191D18 @ case 7
	.4byte _08191D62 @ case 8
_08190998:
	ldr r0, _081909D0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _081909AC
	bl _08191E5E
_081909AC:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, _081909D4
	mov r6, r8
	lsls r0, r6, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #8]
	bl _08191E5E
	.align 2, 0
_081909D0: .4byte 0x02037C74
_081909D4: .4byte 0x03005B60
_081909D8:
	ldr r0, _081909FC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081909E8
	bl _08191E5E
_081909E8:
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r2, _08190A00
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #8]
	bl _08191E5E
	.align 2, 0
_081909FC: .4byte 0x02037C74
_08190A00: .4byte 0x03005B60
_08190A04:
	mov r0, r8
	bl sub_08191E78
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #8
	bgt _08190A1A
	cmp r6, #1
	bge _08190A4C
	bl _08191E5E
_08190A1A:
	cmp r6, #9
	beq _08190A22
	bl _08191E5E
_08190A22:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _08190A48
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	strh r1, [r0, #8]
	bl _08191E5E
	.align 2, 0
_08190A48: .4byte 0x03005B60
_08190A4C:
	ldr r1, _08190AA0
	mov r4, r8
	lsls r2, r4, #2
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #0x12]
	movs r5, #0xc
	ldrsh r0, [r0, r5]
	movs r1, #0
	mov sb, r2
	cmp r0, #0
	beq _08190A68
	movs r1, #9
_08190A68:
	adds r6, r1, #0
	adds r0, r6, #0
	adds r0, #9
	cmp r6, r0
	bge _08190A8E
	adds r5, r0, #0
_08190A74:
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r6, #1
	cmp r6, r5
	blt _08190A74
_08190A8E:
	ldr r0, _08190AA0
	mov r1, sb
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	strh r0, [r1, #8]
	bl _08191E5E
	.align 2, 0
_08190AA0: .4byte 0x03005B60
_08190AA4:
	mov r6, r8
	lsls r1, r6, #2
	adds r0, r1, r6
	lsls r0, r0, #3
	ldr r2, _08190ACC
	adds r0, r0, r2
	movs r3, #0x12
	ldrsh r6, [r0, r3]
	subs r0, r6, #1
	mov sb, r1
	cmp r0, #7
	bls _08190AC0
	bl _08191E5E
_08190AC0:
	lsls r0, r0, #2
	ldr r1, _08190AD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08190ACC: .4byte 0x03005B60
_08190AD0: .4byte 0x08190AD4
_08190AD4: @ jump table
	.4byte _08190AF4 @ case 0
	.4byte _08190E90 @ case 1
	.4byte _08191228 @ case 2
	.4byte _08191764 @ case 3
	.4byte _08190AF4 @ case 4
	.4byte _08190E90 @ case 5
	.4byte _081914D8 @ case 6
	.4byte _081919C4 @ case 7
_08190AF4:
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r4, _08190B1C
	adds r0, r0, r4
	movs r5, #0xc
	ldrsh r2, [r0, r5]
	cmp r2, #0
	beq _08190B30
	ldr r0, _08190B20
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08190B24
	strh r1, [r0]
	ldr r0, _08190B28
	strh r1, [r0]
	ldr r1, _08190B2C
	movs r0, #0xa0
	strh r0, [r1]
	b _08190B42
	.align 2, 0
_08190B1C: .4byte 0x03005B60
_08190B20: .4byte 0x02022AC8
_08190B24: .4byte 0x02022ACA
_08190B28: .4byte 0x02022ACC
_08190B2C: .4byte 0x02022ACE
_08190B30:
	ldr r0, _08190B88
	strh r2, [r0]
	ldr r1, _08190B8C
	movs r0, #0xa0
	strh r0, [r1]
	ldr r0, _08190B90
	strh r2, [r0]
	ldr r0, _08190B94
	strh r2, [r0]
_08190B42:
	cmp r6, #1
	bne _08190BF8
	ldr r5, _08190B98
	ldr r0, [r5]
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _08190BAC
	ldr r0, _08190B9C
	strh r1, [r0]
	ldr r1, _08190BA0
	movs r6, #0xa0
	lsls r6, r6, #1
	adds r0, r6, #0
	strh r0, [r1]
	ldr r3, _08190BA4
	ldr r2, _08190BA8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r4, #0xa
	ldrsh r1, [r0, r4]
	adds r1, r1, r3
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r2, [r0, #0xc]
	movs r0, #0x10
	orrs r0, r2
	ldrb r1, [r1]
	bl DisplayTrainerInfoOnCard
	b _08190CE0
	.align 2, 0
_08190B88: .4byte 0x02022AC8
_08190B8C: .4byte 0x02022ACA
_08190B90: .4byte 0x02022ACC
_08190B94: .4byte 0x02022ACE
_08190B98: .4byte 0x0203CA44
_08190B9C: .4byte 0x02022AD0
_08190BA0: .4byte 0x02022AD2
_08190BA4: .4byte 0x085D5AFC
_08190BA8: .4byte 0x03005B60
_08190BAC:
	ldr r1, _08190BE8
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r6, #0
	strh r0, [r1]
	ldr r0, _08190BEC
	movs r4, #0
	strh r4, [r0]
	ldr r3, _08190BF0
	ldr r2, _08190BF4
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r6, #0xa
	ldrsh r1, [r0, r6]
	adds r1, r1, r3
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r2, [r0, #0xc]
	movs r0, #0x10
	orrs r0, r2
	ldrb r1, [r1]
	bl DisplayTrainerInfoOnCard
	ldr r0, [r5]
	strb r4, [r0, #0x10]
	b _08190CE0
	.align 2, 0
_08190BE8: .4byte 0x02022AD0
_08190BEC: .4byte 0x02022AD2
_08190BF0: .4byte 0x085D5AFC
_08190BF4: .4byte 0x03005B60
_08190BF8:
	ldr r6, _08190C44
	ldr r1, [r6]
	ldrb r5, [r1, #0x10]
	cmp r5, #0
	bne _08190C54
	ldr r4, _08190C48
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r2, #0xa
	ldrsh r0, [r0, r2]
	adds r2, r0, #0
	subs r2, #0x10
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x11
	bl sub_08192B3C
	ldr r0, _08190C4C
	strh r5, [r0]
	ldr r1, _08190C50
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r3, #0
	strh r0, [r1]
	ldr r2, [r6]
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	movs r0, #0x10
	orrs r0, r1
	ldrb r1, [r2, #0x11]
	bl DisplayTrainerInfoOnCard
	b _08190CE0
	.align 2, 0
_08190C44: .4byte 0x0203CA44
_08190C48: .4byte 0x03005B60
_08190C4C: .4byte 0x02022AD0
_08190C50: .4byte 0x02022AD2
_08190C54:
	cmp r5, #2
	bne _08190CA8
	ldr r4, _08190C9C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r5, #0xa
	ldrsh r0, [r0, r5]
	adds r2, r0, #0
	subs r2, #0x10
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x11
	bl sub_08192B3C
	ldr r1, _08190CA0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08190CA4
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, [r6]
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	movs r0, #0x10
	orrs r0, r1
	ldrb r1, [r2, #0x12]
	bl DisplayTrainerInfoOnCard
	b _08190CE0
	.align 2, 0
_08190C9C: .4byte 0x03005B60
_08190CA0: .4byte 0x02022AD0
_08190CA4: .4byte 0x02022AD2
_08190CA8:
	ldr r1, _08190D50
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _08190D54
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _08190D58
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r4, #0xa
	ldrsh r0, [r0, r4]
	adds r2, r0, #0
	subs r2, #0x10
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #0xc]
	movs r0, #0x10
	orrs r0, r1
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl DisplayMatchInfoOnCard
_08190CE0:
	movs r6, #0
	ldr r5, _08190D5C
	mov sl, r5
	ldr r3, _08190D60
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _08190D58
	adds r5, r0, r1
	mov ip, r6
	adds r4, r3, #0
	adds r4, #0x1c
	movs r7, #1
_08190CFA:
	cmp r6, #1
	bgt _08190D68
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08190DAC
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08190D64
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _08190DAC
	.align 2, 0
_08190D50: .4byte 0x02022AD0
_08190D54: .4byte 0x02022AD2
_08190D58: .4byte 0x03005B60
_08190D5C: .4byte 0x0203CA44
_08190D60: .4byte 0x020205AC
_08190D64: .4byte 0x081903ED
_08190D68:
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08190DAC
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08190E1C
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_08190DAC:
	adds r6, #1
	cmp r6, #7
	ble _08190CFA
	movs r6, #8
	ldr r2, _08190E20
	mov ip, r2
	ldr r3, _08190E24
	ldr r1, _08190E28
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x1c
_08190DCA:
	cmp r6, #9
	bgt _08190E30
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08190E70
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _08190E2C
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _08190E70
	.align 2, 0
_08190E1C: .4byte 0x081905AD
_08190E20: .4byte 0x0203CA44
_08190E24: .4byte 0x020205AC
_08190E28: .4byte 0x03005B60
_08190E2C: .4byte 0x081903ED
_08190E30:
	mov r2, ip
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08190E70
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _08190E88
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_08190E70:
	adds r6, #1
	cmp r6, #0xf
	ble _08190DCA
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r3, _08190E8C
	adds r0, r0, r3
	movs r2, #0
	movs r1, #4
	bl _08191C44
	.align 2, 0
_08190E88: .4byte 0x081905AD
_08190E8C: .4byte 0x03005B60
_08190E90:
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r4, _08190EBC
	adds r0, r0, r4
	movs r5, #0xc
	ldrsh r2, [r0, r5]
	cmp r2, #0
	beq _08190ED4
	ldr r0, _08190EC0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08190EC4
	strh r1, [r0]
	ldr r0, _08190EC8
	strh r1, [r0]
	ldr r1, _08190ECC
	ldr r2, _08190ED0
	adds r0, r2, #0
	strh r0, [r1]
	b _08190EE8
	.align 2, 0
_08190EBC: .4byte 0x03005B60
_08190EC0: .4byte 0x02022AC8
_08190EC4: .4byte 0x02022ACA
_08190EC8: .4byte 0x02022ACC
_08190ECC: .4byte 0x02022ACE
_08190ED0: .4byte 0x0000FF60
_08190ED4:
	ldr r0, _08190F28
	strh r2, [r0]
	ldr r1, _08190F2C
	ldr r3, _08190F30
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _08190F34
	strh r2, [r0]
	ldr r0, _08190F38
	strh r2, [r0]
_08190EE8:
	cmp r6, #2
	bne _08190F98
	ldr r5, _08190F3C
	ldr r0, [r5]
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _08190F50
	ldr r0, _08190F40
	strh r1, [r0]
	ldr r1, _08190F44
	movs r0, #0xa0
	strh r0, [r1]
	ldr r3, _08190F48
	ldr r2, _08190F4C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r4, #0xa
	ldrsh r1, [r0, r4]
	adds r1, r1, r3
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r2, [r0, #0xc]
	movs r0, #4
	orrs r0, r2
	ldrb r1, [r1]
	bl DisplayTrainerInfoOnCard
	b _08191078
	.align 2, 0
_08190F28: .4byte 0x02022AC8
_08190F2C: .4byte 0x02022ACA
_08190F30: .4byte 0x0000FF60
_08190F34: .4byte 0x02022ACC
_08190F38: .4byte 0x02022ACE
_08190F3C: .4byte 0x0203CA44
_08190F40: .4byte 0x02022AD0
_08190F44: .4byte 0x02022AD2
_08190F48: .4byte 0x085D5AFC
_08190F4C: .4byte 0x03005B60
_08190F50:
	ldr r0, _08190F88
	movs r4, #0
	strh r4, [r0]
	ldr r0, _08190F8C
	strh r4, [r0]
	ldr r3, _08190F90
	ldr r2, _08190F94
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r6, #0xa
	ldrsh r1, [r0, r6]
	adds r1, r1, r3
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r2, [r0, #0xc]
	movs r0, #4
	orrs r0, r2
	ldrb r1, [r1]
	bl DisplayTrainerInfoOnCard
	ldr r0, [r5]
	strb r4, [r0, #0x10]
	b _08191078
	.align 2, 0
_08190F88: .4byte 0x02022AD0
_08190F8C: .4byte 0x02022AD2
_08190F90: .4byte 0x085D5AFC
_08190F94: .4byte 0x03005B60
_08190F98:
	ldr r6, _08190FE0
	ldr r1, [r6]
	ldrb r5, [r1, #0x10]
	cmp r5, #0
	bne _08190FF0
	ldr r4, _08190FE4
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r2, #0xa
	ldrsh r0, [r0, r2]
	adds r2, r0, #0
	subs r2, #0x10
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x11
	bl sub_08192B3C
	ldr r0, _08190FE8
	strh r5, [r0]
	ldr r1, _08190FEC
	movs r0, #0xa0
	strh r0, [r1]
	ldr r2, [r6]
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	movs r0, #4
	orrs r0, r1
	ldrb r1, [r2, #0x11]
	bl DisplayTrainerInfoOnCard
	b _08191078
	.align 2, 0
_08190FE0: .4byte 0x0203CA44
_08190FE4: .4byte 0x03005B60
_08190FE8: .4byte 0x02022AD0
_08190FEC: .4byte 0x02022AD2
_08190FF0:
	cmp r5, #2
	bne _08191040
	ldr r4, _08191034
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r3, #0xa
	ldrsh r0, [r0, r3]
	adds r2, r0, #0
	subs r2, #0x10
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x11
	bl sub_08192B3C
	ldr r1, _08191038
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0819103C
	movs r0, #0xa0
	strh r0, [r1]
	ldr r2, [r6]
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	movs r0, #4
	orrs r0, r1
	ldrb r1, [r2, #0x12]
	bl DisplayTrainerInfoOnCard
	b _08191078
	.align 2, 0
_08191034: .4byte 0x03005B60
_08191038: .4byte 0x02022AD0
_0819103C: .4byte 0x02022AD2
_08191040:
	ldr r1, _081910E8
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	strh r0, [r1]
	ldr r1, _081910EC
	movs r0, #0
	strh r0, [r1]
	ldr r1, _081910F0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r5, #0xa
	ldrsh r0, [r0, r5]
	adds r2, r0, #0
	subs r2, #0x10
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #0xc]
	movs r0, #4
	orrs r0, r1
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl DisplayMatchInfoOnCard
_08191078:
	movs r6, #0
	ldr r0, _081910F4
	mov sl, r0
	ldr r3, _081910F8
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _081910F0
	adds r5, r0, r1
	mov ip, r6
	adds r4, r3, #0
	adds r4, #0x1c
	movs r7, #1
_08191092:
	cmp r6, #1
	bgt _08191100
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191144
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _081910FC
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _08191144
	.align 2, 0
_081910E8: .4byte 0x02022AD0
_081910EC: .4byte 0x02022AD2
_081910F0: .4byte 0x03005B60
_081910F4: .4byte 0x0203CA44
_081910F8: .4byte 0x020205AC
_081910FC: .4byte 0x08190455
_08191100:
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191144
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _081911B4
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_08191144:
	adds r6, #1
	cmp r6, #7
	ble _08191092
	movs r6, #8
	ldr r2, _081911B8
	mov ip, r2
	ldr r3, _081911BC
	ldr r1, _081911C0
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x1c
_08191162:
	cmp r6, #9
	bgt _081911C8
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191208
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _081911C4
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _08191208
	.align 2, 0
_081911B4: .4byte 0x08190629
_081911B8: .4byte 0x0203CA44
_081911BC: .4byte 0x020205AC
_081911C0: .4byte 0x03005B60
_081911C4: .4byte 0x08190455
_081911C8:
	mov r2, ip
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191208
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _08191220
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_08191208:
	adds r6, #1
	cmp r6, #0xf
	ble _08191162
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r3, _08191224
	adds r0, r0, r3
	movs r2, #0
	movs r1, #5
	bl _08191C44
	.align 2, 0
_08191220: .4byte 0x08190629
_08191224: .4byte 0x03005B60
_08191228:
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r4, _08191254
	adds r0, r0, r4
	movs r5, #0xc
	ldrsh r2, [r0, r5]
	cmp r2, #0
	beq _08191268
	ldr r0, _08191258
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0819125C
	strh r1, [r0]
	ldr r2, _08191260
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r6, #0
	strh r0, [r2]
	ldr r0, _08191264
	strh r1, [r0]
	b _0819127E
	.align 2, 0
_08191254: .4byte 0x03005B60
_08191258: .4byte 0x02022AC8
_0819125C: .4byte 0x02022ACA
_08191260: .4byte 0x02022ACC
_08191264: .4byte 0x02022ACE
_08191268:
	ldr r1, _081912C0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _081912C4
	strh r2, [r0]
	ldr r0, _081912C8
	strh r2, [r0]
	ldr r0, _081912CC
	strh r2, [r0]
_0819127E:
	ldr r0, _081912D0
	ldr r4, [r0]
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _081912E4
	ldr r1, _081912D4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	strh r0, [r1]
	ldr r1, _081912D8
	movs r0, #0xa0
	strh r0, [r1]
	ldr r3, _081912DC
	ldr r2, _081912E0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r5, #0xa
	ldrsh r1, [r0, r5]
	adds r1, r1, r3
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r2, [r0, #0xc]
	movs r0, #8
	orrs r0, r2
	ldrb r1, [r1]
	bl DisplayTrainerInfoOnCard
	b _08191322
	.align 2, 0
_081912C0: .4byte 0x02022AC8
_081912C4: .4byte 0x02022ACA
_081912C8: .4byte 0x02022ACC
_081912CC: .4byte 0x02022ACE
_081912D0: .4byte 0x0203CA44
_081912D4: .4byte 0x02022AD0
_081912D8: .4byte 0x02022AD2
_081912DC: .4byte 0x085D5AFC
_081912E0: .4byte 0x03005B60
_081912E4:
	ldr r1, _08191394
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r6, #0
	strh r0, [r1]
	ldr r1, _08191398
	movs r0, #0
	strh r0, [r1]
	ldr r3, _0819139C
	ldr r2, _081913A0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r5, #0xa
	ldrsh r1, [r0, r5]
	lsls r1, r1, #2
	subs r1, #1
	ldrb r4, [r4, #0x10]
	adds r1, r1, r4
	adds r1, r1, r3
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r2, [r0, #0xc]
	movs r0, #8
	orrs r0, r2
	ldrb r1, [r1]
	bl DisplayMatchInfoOnCard
_08191322:
	movs r6, #0
	ldr r0, _081913A4
	mov sl, r0
	ldr r3, _081913A8
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _081913A0
	adds r5, r0, r1
	mov ip, r6
	adds r4, r3, #0
	adds r4, #0x1c
	movs r7, #1
_0819133C:
	cmp r6, #1
	bgt _081913B0
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _081913F4
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _081913AC
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _081913F4
	.align 2, 0
_08191394: .4byte 0x02022AD0
_08191398: .4byte 0x02022AD2
_0819139C: .4byte 0x085D5BD8
_081913A0: .4byte 0x03005B60
_081913A4: .4byte 0x0203CA44
_081913A8: .4byte 0x020205AC
_081913AC: .4byte 0x081904BD
_081913B0:
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _081913F4
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08191464
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_081913F4:
	adds r6, #1
	cmp r6, #7
	ble _0819133C
	movs r6, #8
	ldr r2, _08191468
	mov ip, r2
	ldr r3, _0819146C
	ldr r1, _08191470
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x1c
_08191412:
	cmp r6, #9
	bgt _08191478
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _081914B8
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _08191474
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _081914B8
	.align 2, 0
_08191464: .4byte 0x081906A5
_08191468: .4byte 0x0203CA44
_0819146C: .4byte 0x020205AC
_08191470: .4byte 0x03005B60
_08191474: .4byte 0x081904BD
_08191478:
	mov r2, ip
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _081914B8
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _081914D0
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_081914B8:
	adds r6, #1
	cmp r6, #0xf
	ble _08191412
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r3, _081914D4
	adds r0, r0, r3
	movs r2, #0
	movs r1, #6
	b _08191C44
	.align 2, 0
_081914D0: .4byte 0x081906A5
_081914D4: .4byte 0x03005B60
_081914D8:
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r4, _08191504
	adds r0, r0, r4
	movs r5, #0xc
	ldrsh r2, [r0, r5]
	cmp r2, #0
	beq _08191518
	ldr r0, _08191508
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0819150C
	strh r1, [r0]
	ldr r2, _08191510
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r6, #0
	strh r0, [r2]
	ldr r0, _08191514
	strh r1, [r0]
	b _0819152E
	.align 2, 0
_08191504: .4byte 0x03005B60
_08191508: .4byte 0x02022AC8
_0819150C: .4byte 0x02022ACA
_08191510: .4byte 0x02022ACC
_08191514: .4byte 0x02022ACE
_08191518:
	ldr r1, _08191560
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _08191564
	strh r2, [r0]
	ldr r0, _08191568
	strh r2, [r0]
	ldr r0, _0819156C
	strh r2, [r0]
_0819152E:
	ldr r0, _08191570
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	cmp r0, #0
	bne _08191580
	ldr r1, _08191574
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	strh r0, [r1]
	ldr r1, _08191578
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _0819157C
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #0xc]
	movs r0, #8
	orrs r0, r1
	ldrb r1, [r2, #0x11]
	bl DisplayTrainerInfoOnCard
	b _081915B4
	.align 2, 0
_08191560: .4byte 0x02022AC8
_08191564: .4byte 0x02022ACA
_08191568: .4byte 0x02022ACC
_0819156C: .4byte 0x02022ACE
_08191570: .4byte 0x0203CA44
_08191574: .4byte 0x02022AD0
_08191578: .4byte 0x02022AD2
_0819157C: .4byte 0x03005B60
_08191580:
	ldr r1, _08191624
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08191628
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _0819162C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r5, #0xa
	ldrsh r0, [r0, r5]
	adds r2, r0, #0
	subs r2, #0x10
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #0xc]
	movs r0, #8
	orrs r0, r1
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl DisplayMatchInfoOnCard
_081915B4:
	movs r6, #0
	ldr r0, _08191630
	mov sl, r0
	ldr r3, _08191634
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _0819162C
	adds r5, r0, r1
	mov ip, r6
	adds r4, r3, #0
	adds r4, #0x1c
	movs r7, #1
_081915CE:
	cmp r6, #1
	bgt _0819163C
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191680
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08191638
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _08191680
	.align 2, 0
_08191624: .4byte 0x02022AD0
_08191628: .4byte 0x02022AD2
_0819162C: .4byte 0x03005B60
_08191630: .4byte 0x0203CA44
_08191634: .4byte 0x020205AC
_08191638: .4byte 0x081904BD
_0819163C:
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191680
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _081916F0
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_08191680:
	adds r6, #1
	cmp r6, #7
	ble _081915CE
	movs r6, #8
	ldr r2, _081916F4
	mov ip, r2
	ldr r3, _081916F8
	ldr r1, _081916FC
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x1c
_0819169E:
	cmp r6, #9
	bgt _08191704
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191744
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _08191700
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _08191744
	.align 2, 0
_081916F0: .4byte 0x081906A5
_081916F4: .4byte 0x0203CA44
_081916F8: .4byte 0x020205AC
_081916FC: .4byte 0x03005B60
_08191700: .4byte 0x081904BD
_08191704:
	mov r2, ip
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191744
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _0819175C
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_08191744:
	adds r6, #1
	cmp r6, #0xf
	ble _0819169E
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r3, _08191760
	adds r0, r0, r3
	movs r2, #0
	movs r1, #6
	b _08191C44
	.align 2, 0
_0819175C: .4byte 0x081906A5
_08191760: .4byte 0x03005B60
_08191764:
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r4, _08191790
	adds r0, r0, r4
	movs r5, #0xc
	ldrsh r2, [r0, r5]
	cmp r2, #0
	beq _081917A4
	ldr r0, _08191794
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08191798
	strh r1, [r0]
	ldr r2, _0819179C
	movs r6, #0xff
	lsls r6, r6, #8
	adds r0, r6, #0
	strh r0, [r2]
	ldr r0, _081917A0
	strh r1, [r0]
	b _081917BA
	.align 2, 0
_08191790: .4byte 0x03005B60
_08191794: .4byte 0x02022AC8
_08191798: .4byte 0x02022ACA
_0819179C: .4byte 0x02022ACC
_081917A0: .4byte 0x02022ACE
_081917A4:
	ldr r1, _081917D4
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _081917D8
	strh r2, [r0]
	ldr r0, _081917DC
	strh r2, [r0]
	ldr r0, _081917E0
	strh r2, [r0]
_081917BA:
	ldr r0, _081917E4
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #1
	bne _081917F0
	ldr r1, _081917E8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _081917EC
	movs r0, #0xa0
	strh r0, [r1]
	b _081917FA
	.align 2, 0
_081917D4: .4byte 0x02022AC8
_081917D8: .4byte 0x02022ACA
_081917DC: .4byte 0x02022ACC
_081917E0: .4byte 0x02022ACE
_081917E4: .4byte 0x0203CA44
_081917E8: .4byte 0x02022AD0
_081917EC: .4byte 0x02022AD2
_081917F0:
	ldr r0, _08191890
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08191894
	strh r1, [r0]
_081917FA:
	ldr r4, _08191898
	ldr r5, _0819189C
	ldr r3, [r5]
	ldr r2, _081918A0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r6, #0xa
	ldrsh r1, [r0, r6]
	lsls r1, r1, #2
	subs r1, #1
	ldrb r3, [r3, #0x10]
	adds r1, r1, r3
	adds r1, r1, r4
	mov r4, sb
	add r4, r8
	lsls r4, r4, #3
	adds r4, r4, r2
	ldrb r2, [r4, #0xc]
	movs r0, #2
	orrs r0, r2
	ldrb r1, [r1]
	bl DisplayMatchInfoOnCard
	movs r6, #0
	ldr r7, _081918A4
	mov ip, r6
	mov sl, r5
	adds r5, r7, #0
	adds r5, #0x1c
_08191838:
	cmp r6, #1
	bgt _081918AC
	mov r1, sl
	ldr r0, [r1]
	adds r3, r0, r6
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _081918F2
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _081918A8
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r4, #0xc]
	movs r2, #1
	eors r1, r2
	strh r1, [r0, #0x2e]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r2, ip
	strh r2, [r0, #0x30]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r6, [r0, #0x32]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r1, [r0, #0x34]
	b _081918F2
	.align 2, 0
_08191890: .4byte 0x02022AD0
_08191894: .4byte 0x02022AD2
_08191898: .4byte 0x085D5BD8
_0819189C: .4byte 0x0203CA44
_081918A0: .4byte 0x03005B60
_081918A4: .4byte 0x020205AC
_081918A8: .4byte 0x08190529
_081918AC:
	mov r3, sl
	ldr r0, [r3]
	adds r3, r0, r6
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _081918F2
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _08191964
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r4, #0xc]
	movs r2, #1
	eors r1, r2
	strh r1, [r0, #0x2e]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r6, [r0, #0x32]
_081918F2:
	adds r6, #1
	cmp r6, #7
	ble _08191838
	movs r6, #8
	ldr r2, _08191968
	mov ip, r2
	ldr r3, _0819196C
	ldr r1, _08191970
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x1c
_08191910:
	cmp r6, #9
	bgt _08191978
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _081919B8
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _08191974
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _081919B8
	.align 2, 0
_08191964: .4byte 0x08190721
_08191968: .4byte 0x0203CA44
_0819196C: .4byte 0x020205AC
_08191970: .4byte 0x03005B60
_08191974: .4byte 0x08190529
_08191978:
	mov r2, ip
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _081919B8
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _081919C0
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_081919B8:
	adds r6, #1
	cmp r6, #0xf
	ble _08191910
	b _08191C36
	.align 2, 0
_081919C0: .4byte 0x08190721
_081919C4:
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r4, _081919F0
	adds r0, r0, r4
	movs r5, #0xc
	ldrsh r2, [r0, r5]
	cmp r2, #0
	beq _08191A04
	ldr r0, _081919F4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081919F8
	strh r1, [r0]
	ldr r2, _081919FC
	movs r6, #0xff
	lsls r6, r6, #8
	adds r0, r6, #0
	strh r0, [r2]
	ldr r0, _08191A00
	strh r1, [r0]
	b _08191A1A
	.align 2, 0
_081919F0: .4byte 0x03005B60
_081919F4: .4byte 0x02022AC8
_081919F8: .4byte 0x02022ACA
_081919FC: .4byte 0x02022ACC
_08191A00: .4byte 0x02022ACE
_08191A04:
	ldr r1, _08191A4C
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _08191A50
	strh r2, [r0]
	ldr r0, _08191A54
	strh r2, [r0]
	ldr r0, _08191A58
	strh r2, [r0]
_08191A1A:
	ldr r0, _08191A5C
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	cmp r0, #2
	bne _08191A6C
	ldr r1, _08191A60
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	strh r0, [r1]
	ldr r1, _08191A64
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _08191A68
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #0xc]
	movs r0, #2
	orrs r0, r1
	ldrb r1, [r2, #0x12]
	bl DisplayTrainerInfoOnCard
	b _08191AA0
	.align 2, 0
_08191A4C: .4byte 0x02022AC8
_08191A50: .4byte 0x02022ACA
_08191A54: .4byte 0x02022ACC
_08191A58: .4byte 0x02022ACE
_08191A5C: .4byte 0x0203CA44
_08191A60: .4byte 0x02022AD0
_08191A64: .4byte 0x02022AD2
_08191A68: .4byte 0x03005B60
_08191A6C:
	ldr r1, _08191B10
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08191B14
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _08191B18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r5, #0xa
	ldrsh r0, [r0, r5]
	adds r2, r0, #0
	subs r2, #0x10
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #0xc]
	movs r0, #2
	orrs r0, r1
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl DisplayMatchInfoOnCard
_08191AA0:
	movs r6, #0
	ldr r0, _08191B1C
	mov sl, r0
	ldr r3, _08191B20
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _08191B18
	adds r5, r0, r1
	mov ip, r6
	adds r4, r3, #0
	adds r4, #0x1c
	movs r7, #1
_08191ABA:
	cmp r6, #1
	bgt _08191B28
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191B6C
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08191B24
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _08191B6C
	.align 2, 0
_08191B10: .4byte 0x02022AD0
_08191B14: .4byte 0x02022AD2
_08191B18: .4byte 0x03005B60
_08191B1C: .4byte 0x0203CA44
_08191B20: .4byte 0x020205AC
_08191B24: .4byte 0x08190529
_08191B28:
	mov r2, sl
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191B6C
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08191BDC
	str r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r5, #0xc]
	eors r0, r7
	strh r0, [r1, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	mov r1, ip
	strh r1, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_08191B6C:
	adds r6, #1
	cmp r6, #7
	ble _08191ABA
	movs r6, #8
	ldr r2, _08191BE0
	mov ip, r2
	ldr r3, _08191BE4
	ldr r1, _08191BE8
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x1c
_08191B8A:
	cmp r6, #9
	bgt _08191BF0
	mov r1, ip
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191C30
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _08191BEC
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r1, [r0, #0x34]
	b _08191C30
	.align 2, 0
_08191BDC: .4byte 0x08190721
_08191BE0: .4byte 0x0203CA44
_08191BE4: .4byte 0x020205AC
_08191BE8: .4byte 0x03005B60
_08191BEC: .4byte 0x08190529
_08191BF0:
	mov r2, ip
	ldr r0, [r2]
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08191C30
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _08191C4C
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0x2e]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r6, [r0, #0x32]
_08191C30:
	adds r6, #1
	cmp r6, #0xf
	ble _08191B8A
_08191C36:
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r3, _08191C50
	adds r0, r0, r3
	movs r2, #0
	movs r1, #7
_08191C44:
	strh r1, [r0, #8]
	strh r2, [r0, #0x12]
	b _08191E5E
	.align 2, 0
_08191C4C: .4byte 0x08190721
_08191C50: .4byte 0x03005B60
_08191C54:
	mov r4, r8
	lsls r0, r4, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r5, _08191C84
	adds r1, r0, r5
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x29
	beq _08191D5C
	ldr r1, _08191C88
	ldrh r0, [r1]
	subs r0, #4
	strh r0, [r1]
	ldr r1, _08191C8C
	ldrh r0, [r1]
	subs r0, #4
	strh r0, [r1]
	ldr r1, _08191C90
	b _08191D00
	.align 2, 0
_08191C84: .4byte 0x03005B60
_08191C88: .4byte 0x02022ACA
_08191C8C: .4byte 0x02022ACE
_08191C90: .4byte 0x02022AD2
_08191C94:
	mov r6, r8
	lsls r0, r6, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r2, _08191CC4
	adds r1, r0, r2
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x29
	beq _08191D5C
	ldr r1, _08191CC8
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	ldr r1, _08191CCC
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	ldr r1, _08191CD0
	b _08191D44
	.align 2, 0
_08191CC4: .4byte 0x03005B60
_08191CC8: .4byte 0x02022ACA
_08191CCC: .4byte 0x02022ACE
_08191CD0: .4byte 0x02022AD2
_08191CD4:
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r4, _08191D08
	adds r1, r0, r4
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x41
	beq _08191D5C
	ldr r1, _08191D0C
	ldrh r0, [r1]
	subs r0, #4
	strh r0, [r1]
	ldr r1, _08191D10
	ldrh r0, [r1]
	subs r0, #4
	strh r0, [r1]
	ldr r1, _08191D14
_08191D00:
	ldrh r0, [r1]
	subs r0, #4
	strh r0, [r1]
	b _08191E5E
	.align 2, 0
_08191D08: .4byte 0x03005B60
_08191D0C: .4byte 0x02022AC8
_08191D10: .4byte 0x02022ACC
_08191D14: .4byte 0x02022AD0
_08191D18:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r6, _08191D4C
	adds r1, r0, r6
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x41
	beq _08191D5C
	ldr r1, _08191D50
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	ldr r1, _08191D54
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	ldr r1, _08191D58
_08191D44:
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	b _08191E5E
	.align 2, 0
_08191D4C: .4byte 0x03005B60
_08191D50: .4byte 0x02022AC8
_08191D54: .4byte 0x02022ACC
_08191D58: .4byte 0x02022AD0
_08191D5C:
	movs r0, #2
	strh r0, [r1, #8]
	b _08191E5E
_08191D62:
	ldr r0, _08191D88
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08191E5E
	movs r6, #0
	ldr r4, _08191D8C
_08191D72:
	cmp r6, #1
	bgt _08191D90
	ldr r0, [r4]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08191DAA
	bl FreeAndDestroyTrainerPicSprite
	b _08191DAA
	.align 2, 0
_08191D88: .4byte 0x02037C74
_08191D8C: .4byte 0x0203CA44
_08191D90:
	ldr r0, [r4]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08191DAA
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08191DC8
	adds r0, r0, r1
	bl sub_080D2798
_08191DAA:
	adds r6, #1
	cmp r6, #7
	ble _08191D72
	movs r6, #8
	ldr r4, _08191DCC
_08191DB4:
	cmp r6, #9
	bgt _08191DD0
	ldr r0, [r4]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08191DEA
	bl FreeAndDestroyTrainerPicSprite
	b _08191DEA
	.align 2, 0
_08191DC8: .4byte 0x020205AC
_08191DCC: .4byte 0x0203CA44
_08191DD0:
	ldr r0, [r4]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08191DEA
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08191E14
	adds r0, r0, r1
	bl sub_080D2798
_08191DEA:
	adds r6, #1
	cmp r6, #0xf
	ble _08191DB4
	bl FreeMonIconPalettes
	ldr r4, _08191E18
	ldr r0, [r4]
	bl Free
	movs r5, #0
	str r5, [r4]
	bl FreeAllWindowBuffers
	mov r0, sb
	cmp r0, #0
	bne _08191E20
	ldr r0, _08191E1C
	bl SetMainCallback2
	b _08191E58
	.align 2, 0
_08191E14: .4byte 0x020205AC
_08191E18: .4byte 0x0203CA44
_08191E1C: .4byte 0x08085B35
_08191E20:
	ldr r0, _08191E70
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _08191E74
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r5, [r1, #8]
	strh r5, [r1, #0xa]
	movs r0, #3
	strh r0, [r1, #0xc]
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x10]
	strh r0, [r1, #0xe]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x14]
	strh r0, [r1, #0x10]
_08191E58:
	mov r0, r8
	bl DestroyTask
_08191E5E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08191E70: .4byte 0x08193E01
_08191E74: .4byte 0x03005B60
	thumb_func_end sub_08190930

	thumb_func_start sub_08191E78
sub_08191E78: @ 0x08191E78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r7, #0
	ldr r2, _08191EF8
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r2
	mov ip, r0
	movs r1, #0x10
	ldrsh r6, [r0, r1]
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r3, #0xa
	ldrsh r5, [r0, r3]
	ldr r0, _08191EFC
	adds r0, r5, r0
	ldrb r0, [r0]
	mov sl, r0
	ldr r3, _08191F00
	ldr r0, [r3]
	ldr r1, _08191F04
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	ldr r1, _08191F08
	ldrh r4, [r1, #0x2e]
	movs r0, #3
	ands r0, r4
	adds r2, r1, #0
	cmp r0, #0
	beq _08191ECA
	movs r7, #9
_08191ECA:
	mov r3, ip
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _08191ED6
	b _08192128
_08191ED6:
	cmp r0, #1
	beq _08191EDC
	b _0819200C
_08191EDC:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _08191F16
	ldr r0, _08191F0C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _08191F16
	cmp r5, #0
	bne _08191F10
	movs r5, #0xf
	b _08191F12
	.align 2, 0
_08191EF8: .4byte 0x03005B60
_08191EFC: .4byte 0x085D5AFC
_08191F00: .4byte 0x03005AF0
_08191F04: .4byte 0x00000CB2
_08191F08: .4byte 0x03002360
_08191F0C: .4byte 0x0203CA44
_08191F10:
	subs r5, #1
_08191F12:
	movs r7, #1
	b _08191FBC
_08191F16:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08191F3E
	ldr r0, _08191F34
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _08191F3E
	cmp r5, #0xf
	bne _08191F38
	movs r5, #0
	b _08191F3A
	.align 2, 0
_08191F34: .4byte 0x0203CA44
_08191F38:
	adds r5, #1
_08191F3A:
	movs r7, #2
	b _08191FBC
_08191F3E:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08191F60
	ldr r0, _08191F5C
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _08191F60
	subs r0, #1
	strb r0, [r1, #0x10]
	movs r7, #3
	b _08191FBC
	.align 2, 0
_08191F5C: .4byte 0x0203CA44
_08191F60:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08191FBC
	ldr r2, _08191FE8
	ldr r0, [r2]
	mov r3, sl
	lsls r1, r3, #2
	adds r0, r0, r1
	ldr r2, _08191FEC
	adds r0, r0, r2
	ldrb r3, [r0]
	lsls r0, r3, #0x1d
	mov ip, r1
	cmp r0, #0
	bge _08191F98
	ldr r0, _08191FF0
	ldr r2, [r0]
	ldrb r4, [r2, #0x10]
	subs r1, r4, #1
	lsls r0, r3, #0x1b
	lsrs r0, r0, #0x1e
	cmp r1, r0
	bge _08191F98
	adds r0, r4, #1
	strb r0, [r2, #0x10]
	movs r7, #4
_08191F98:
	ldr r3, _08191FE8
	ldr r0, [r3]
	add r0, ip
	ldr r1, _08191FEC
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _08191FBC
	ldr r0, _08191FF0
	ldr r3, [r0]
	ldrb r1, [r3, #0x10]
	subs r0, r1, #1
	cmp r0, r8
	bge _08191FBC
	adds r0, r1, #1
	strb r0, [r3, #0x10]
	movs r7, #4
_08191FBC:
	cmp r7, #9
	beq _08191FC2
	b _081920FC
_08191FC2:
	ldr r0, _08191FF0
	ldr r3, [r0]
	ldrb r0, [r3, #0x10]
	cmp r0, #0
	beq _08191FFC
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	ldr r2, _08191FF4
	adds r1, r1, r2
	ldr r2, _08191FF8
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r0, r0, #1
	lsls r0, r0, #2
	subs r0, #1
	ldrb r3, [r3, #0x10]
	adds r0, r0, r3
	b _081920DE
	.align 2, 0
_08191FE8: .4byte 0x03005AF0
_08191FEC: .4byte 0x00000D25
_08191FF0: .4byte 0x0203CA44
_08191FF4: .4byte 0x03005B60
_08191FF8: .4byte 0x085D5C1C
_08191FFC:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r3, _08192008
	adds r0, r0, r3
	b _081920FA
	.align 2, 0
_08192008: .4byte 0x03005B60
_0819200C:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0819203A
	ldr r0, _0819202C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #1
	bne _0819203A
	cmp r5, #0x10
	bne _08192034
	ldr r0, _08192030
	add r0, r8
	ldrb r5, [r0]
	b _08192036
	.align 2, 0
_0819202C: .4byte 0x0203CA44
_08192030: .4byte 0x085D5C18
_08192034:
	subs r5, #1
_08192036:
	movs r7, #5
	b _081920A2
_0819203A:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0819206A
	ldr r0, _0819205C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #1
	bne _0819206A
	ldr r0, _08192060
	add r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	bne _08192064
	movs r5, #0x10
	b _08192066
	.align 2, 0
_0819205C: .4byte 0x0203CA44
_08192060: .4byte 0x085D5C18
_08192064:
	adds r5, #1
_08192066:
	movs r7, #6
	b _081920A2
_0819206A:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08192088
	ldr r0, _08192084
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _08192088
	movs r7, #7
	subs r0, #1
	b _081920A0
	.align 2, 0
_08192084: .4byte 0x0203CA44
_08192088:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081920A2
	ldr r0, _081920C0
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	cmp r0, #1
	bhi _081920A2
	movs r7, #8
	adds r0, #1
_081920A0:
	strb r0, [r1, #0x10]
_081920A2:
	cmp r7, #9
	bne _081920FC
	ldr r0, _081920C0
	ldr r0, [r0]
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _081920CC
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	ldr r2, _081920C4
	adds r1, r1, r2
	ldr r2, _081920C8
	ldrb r0, [r0, #0x11]
	b _081920DE
	.align 2, 0
_081920C0: .4byte 0x0203CA44
_081920C4: .4byte 0x03005B60
_081920C8: .4byte 0x085D5C3C
_081920CC:
	cmp r1, #2
	bne _081920F0
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	ldr r3, _081920E8
	adds r1, r1, r3
	ldr r2, _081920EC
	ldrb r0, [r0, #0x12]
_081920DE:
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0xa]
	b _081920FC
	.align 2, 0
_081920E8: .4byte 0x03005B60
_081920EC: .4byte 0x085D5C3C
_081920F0:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _08192138
	adds r0, r0, r1
_081920FA:
	strh r5, [r0, #0xa]
_081920FC:
	cmp r7, #0
	beq _08192128
	cmp r7, #9
	beq _08192128
	movs r0, #5
	bl PlaySE
	ldr r1, _08192138
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #0xa]
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0xc]
	movs r2, #1
	eors r1, r2
	strh r1, [r0, #0xc]
_08192128:
	adds r0, r7, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08192138: .4byte 0x03005B60
	thumb_func_end sub_08191E78

	thumb_func_start DisplayTrainerInfoOnCard
DisplayTrainerInfoOnCard: @ 0x0819213C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]
	movs r5, #0
	movs r0, #0
	str r0, [sp, #0x28]
	movs r1, #0
	str r1, [sp, #0x2c]
	movs r2, #0
	str r2, [sp, #0x30]
	movs r4, #0
	movs r0, #0x24
	bl AllocZeroed
	mov r8, r0
	ldr r0, _081921E4
	ldr r1, [r0]
	ldr r3, [sp, #0x20]
	lsls r0, r3, #2
	adds r0, r1, r0
	ldr r2, _081921E8
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	str r0, [sp, #0x24]
	movs r0, #1
	ldr r3, [sp, #0x1c]
	ands r0, r3
	cmp r0, #0
	beq _08192194
	movs r5, #8
	movs r4, #9
	str r4, [sp, #0x28]
	movs r4, #2
_08192194:
	movs r0, #2
	ldr r2, [sp, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _081921A4
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp, #0x2c]
_081921A4:
	movs r0, #4
	ldr r2, [sp, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _081921B2
	movs r3, #0xa0
	str r3, [sp, #0x30]
_081921B2:
	movs r0, #8
	ldr r2, [sp, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _081921C0
	ldr r3, _081921EC
	str r3, [sp, #0x2c]
_081921C0:
	movs r0, #0x10
	ldr r2, [sp, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _081921D0
	movs r3, #0xa0
	rsbs r3, r3, #0
	str r3, [sp, #0x30]
_081921D0:
	ldr r0, _081921F0
	ldr r2, [sp, #0x24]
	cmp r2, r0
	bne _081921F4
	ldrb r0, [r1, #8]
	bl PlayerGenderToFrontTrainerPicId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08192212
	.align 2, 0
_081921E4: .4byte 0x03005AF0
_081921E8: .4byte 0x00000D24
_081921EC: .4byte 0xFFFFFF00
_081921F0: .4byte 0x000003FF
_081921F4:
	ldr r0, _08192204
	ldr r3, [sp, #0x24]
	cmp r3, r0
	bne _08192208
	bl CallBattleDomeFunction
	b _0819220E
	.align 2, 0
_08192204: .4byte 0x000003FE
_08192208:
	ldr r0, [sp, #0x24]
	bl GetFrontierTrainerFrontSpriteId
_0819220E:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08192212:
	ldr r2, [sp, #0x2c]
	adds r2, #0x30
	ldr r3, [sp, #0x30]
	adds r3, #0x40
	adds r1, r4, #0
	adds r1, #0xc
	str r1, [sp]
	ldr r1, _081922A0
	str r1, [sp, #4]
	movs r1, #1
	bl CreateTrainerPicSprite
	ldr r1, _081922A4
	ldr r1, [r1]
	adds r1, r1, r5
	strb r0, [r1]
	movs r0, #0x1e
	ldr r4, [sp, #0x1c]
	ands r0, r4
	cmp r0, #0
	beq _08192258
	ldr r2, _081922A8
	ldr r0, _081922A4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_08192258:
	movs r7, #0
	ldr r0, [sp, #0x20]
	lsls r0, r0, #1
	str r0, [sp, #0x3c]
	adds r1, r5, #2
	ldr r2, [sp, #0x28]
	lsls r2, r2, #0x18
	str r2, [sp, #0x44]
	ldr r3, [sp, #0x28]
	adds r3, #4
	str r3, [sp, #0x40]
	ldr r4, [sp, #0x20]
	adds r0, r0, r4
	ldr r6, _081922A4
	ldr r2, _081922A8
	mov sl, r2
	adds r4, r1, #0
	lsls r5, r0, #1
	movs r3, #0
	mov sb, r3
_08192280:
	ldr r0, _081922AC
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _081922BC
	ldr r0, _081922B0
	ldr r0, [r0]
	ldr r2, _081922B4
	adds r0, r0, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r1, _081922B8
	adds r1, r7, r1
	ldrb r2, [r1]
	ldr r3, [sp, #0x2c]
	orrs r2, r3
	b _0819230C
	.align 2, 0
_081922A0: .4byte 0x0000FFFF
_081922A4: .4byte 0x0203CA44
_081922A8: .4byte 0x020205AC
_081922AC: .4byte 0x000003FF
_081922B0: .4byte 0x03005AF0
_081922B4: .4byte 0x00000D64
_081922B8: .4byte 0x085D5DBC
_081922BC:
	ldr r0, _081922DC
	ldr r3, [sp, #0x24]
	cmp r3, r0
	bne _081922EC
	ldr r0, _081922E0
	ldr r0, [r0]
	ldr r1, _081922E4
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r1, _081922E8
	adds r1, r7, r1
	ldrb r2, [r1]
	ldr r3, [sp, #0x2c]
	orrs r2, r3
	b _0819230C
	.align 2, 0
_081922DC: .4byte 0x000003FE
_081922E0: .4byte 0x03005AF0
_081922E4: .4byte 0x00000D64
_081922E8: .4byte 0x085D5DBC
_081922EC:
	ldr r0, _081923C0
	ldr r0, [r0]
	ldr r3, _081923C4
	adds r0, r0, r3
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r0, _081923C8
	ldr r0, [r0]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _081923CC
	adds r1, r7, r1
	ldrb r2, [r1]
	ldr r1, [sp, #0x2c]
	orrs r2, r1
_0819230C:
	ldr r1, _081923D0
	adds r1, r7, r1
	ldrb r3, [r1]
	ldr r1, [sp, #0x30]
	adds r3, r3, r1
	mov r1, sb
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	ldr r1, _081923D4
	bl CreateMonIcon
	ldr r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrb r1, [r0, #5]
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r1, r2
	strb r1, [r0, #5]
	movs r0, #0x1e
	ldr r3, [sp, #0x1c]
	ands r0, r3
	cmp r0, #0
	beq _08192366
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_08192366:
	adds r4, #1
	adds r5, #2
	adds r7, #1
	cmp r7, #2
	ble _08192280
	add r0, sp, #0xc
	movs r2, #0
	movs r3, #2
	strb r3, [r0, #5]
	strb r2, [r0, #6]
	strb r2, [r0, #7]
	adds r1, r0, #0
	adds r0, r2, #0
	strb r0, [r1, #8]
	adds r0, r1, #0
	ldrb r0, [r0, #7]
	strb r0, [r1, #9]
	adds r0, r1, #0
	strb r3, [r0, #0xa]
	strb r2, [r0, #0xb]
	adds r3, r0, #0
	ldrb r2, [r3, #0xc]
	movs r1, #0x10
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r2, r3, #0
	movs r0, #0xe0
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	ands r1, r0
	strb r1, [r2, #0xd]
	adds r1, r2, #0
	movs r0, #0xd0
	strb r0, [r1, #0xd]
	movs r7, #0
	ldr r0, _081923D8
	ldr r4, [sp, #0x24]
	cmp r4, r0
	bne _081923E0
	ldr r0, _081923DC
	adds r0, #0x3c
	ldrb r5, [r0]
	b _081923FE
	.align 2, 0
_081923C0: .4byte 0x03005AF0
_081923C4: .4byte 0x00000D64
_081923C8: .4byte 0x0203B958
_081923CC: .4byte 0x085D5DBC
_081923D0: .4byte 0x085D5DBF
_081923D4: .4byte 0x08190595
_081923D8: .4byte 0x000003FF
_081923DC: .4byte 0x082EFF52
_081923E0:
	ldr r0, _081923F0
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _081923F4
	bl GetDomeBrainTrainerClass
	b _081923FA
	.align 2, 0
_081923F0: .4byte 0x000003FE
_081923F4:
	ldr r0, [sp, #0x24]
	bl GetFrontierOpponentClass
_081923FA:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_081923FE:
	ldr r2, _0819244C
	movs r0, #0xb
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08192426
	ldr r3, _08192450
	adds r0, r1, r2
	adds r2, r7, r0
_08192416:
	adds r0, r7, r3
	ldrb r1, [r2]
	strb r1, [r0]
	adds r2, #1
	adds r7, #1
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _08192416
_08192426:
	ldr r5, _08192450
	adds r1, r7, r5
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #1
	adds r0, r0, r5
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _08192454
	ldr r2, [sp, #0x24]
	cmp r2, r0
	bne _0819245C
	ldr r0, _08192458
	ldr r1, [r0]
	adds r0, r5, #0
	bl StringAppend
	b _08192492
	.align 2, 0
_0819244C: .4byte 0x082E3564
_08192450: .4byte 0x02021C40
_08192454: .4byte 0x000003FF
_08192458: .4byte 0x03005AF0
_0819245C:
	ldr r0, _08192478
	ldr r3, [sp, #0x24]
	cmp r3, r0
	bne _08192480
	ldr r4, _0819247C
	adds r0, r4, #0
	bl CopyDomeBrainTrainerName
	adds r0, r5, #0
	adds r1, r4, #0
	bl StringAppend
	b _08192492
	.align 2, 0
_08192478: .4byte 0x000003FE
_0819247C: .4byte 0x02021C54
_08192480:
	ldr r4, _081924F4
	ldr r1, [sp, #0x24]
	adds r0, r4, #0
	bl CopyDomeTrainerName
	adds r0, r5, #0
	adds r1, r4, #0
	bl StringAppend
_08192492:
	ldr r0, _081924F8
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	movs r5, #0
	add r4, sp, #0x28
	ldrb r4, [r4]
	strb r4, [r0, #4]
	ldr r0, [sp, #0x44]
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	add r0, sp, #0xc
	strb r5, [r0, #0xa]
	movs r7, #0
	add r1, sp, #0xc
	mov sb, r1
	ldr r2, [sp, #0x3c]
	ldr r3, [sp, #0x20]
	adds r0, r2, r3
	lsls r6, r0, #1
	ldr r4, _081924FC
	mov sl, r4
_081924D2:
	ldr r0, _08192500
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r1, sb
	strb r0, [r1, #9]
	ldr r0, _08192504
	ldr r2, [sp, #0x24]
	cmp r2, r0
	bne _08192510
	ldr r3, _08192508
	ldr r1, [r3]
	lsls r0, r7, #1
	adds r0, r0, r6
	ldr r4, _0819250C
	adds r1, r1, r4
	b _0819254A
	.align 2, 0
_081924F4: .4byte 0x02021C54
_081924F8: .4byte 0x02021C40
_081924FC: .4byte 0x082EA31C
_08192500: .4byte 0x085D5DC2
_08192504: .4byte 0x000003FF
_08192508: .4byte 0x03005AF0
_0819250C: .4byte 0x00000D64
_08192510:
	ldr r0, _08192528
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _08192534
	ldr r2, _0819252C
	ldr r1, [r2]
	lsls r0, r7, #1
	adds r0, r0, r6
	ldr r3, _08192530
	adds r1, r1, r3
	b _0819254A
	.align 2, 0
_08192528: .4byte 0x000003FE
_0819252C: .4byte 0x03005AF0
_08192530: .4byte 0x00000D64
_08192534:
	ldr r4, _081925A4
	ldr r1, [r4]
	lsls r0, r7, #1
	adds r0, r0, r6
	ldr r2, _081925A8
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r0, _081925AC
	ldr r0, [r0]
	lsls r1, r1, #4
_0819254A:
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0xc]
	adds r5, r7, #1
	ldr r3, [sp, #0x28]
	adds r4, r5, r3
	mov r0, sb
	strb r4, [r0, #4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	adds r7, r5, #0
	cmp r7, #2
	ble _081924D2
	ldr r4, [sp, #0x40]
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _081925B0
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _081925B8
	ldr r0, _081925B4
	ldr r0, [r0, #0x40]
	b _081925C2
	.align 2, 0
_081925A4: .4byte 0x03005AF0
_081925A8: .4byte 0x00000D64
_081925AC: .4byte 0x0203B958
_081925B0: .4byte 0x000003FE
_081925B4: .4byte 0x085D5C4C
_081925B8:
	ldr r0, _08192628
	ldr r2, [sp, #0x20]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
_081925C2:
	str r0, [sp, #0xc]
	add r1, sp, #0xc
	movs r0, #1
	strb r0, [r1, #5]
	adds r0, r1, #0
	add r3, sp, #0x40
	ldrb r3, [r3]
	strb r3, [r0, #4]
	movs r1, #5
	strb r1, [r0, #7]
	strb r1, [r0, #9]
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	movs r7, #0
	ldr r3, _0819262C
_081925E4:
	movs r5, #0
	adds r4, r7, #1
	str r4, [sp, #0x38]
	lsls r0, r7, #1
	str r0, [sp, #0x34]
	lsls r2, r7, #4
_081925F0:
	movs r6, #0
	lsls r1, r5, #1
	mov sl, r1
	mov r4, r8
	mov sb, r2
_081925FA:
	ldr r0, _08192630
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _08192634
	lsls r0, r7, #0x18
	lsls r1, r5, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	str r2, [sp, #0x48]
	str r3, [sp, #0x4c]
	bl GetFrontierBrainMonMove
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xc
	adds r0, r6, r0
	ldr r3, [sp, #0x4c]
	adds r0, r0, r3
	ldrh r1, [r4]
	ldrb r0, [r0]
	adds r1, r1, r0
	strh r1, [r4]
	ldr r2, [sp, #0x48]
	b _0819268C
	.align 2, 0
_08192628: .4byte 0x085D5C4C
_0819262C: .4byte 0x085D3DFC
_08192630: .4byte 0x000003FE
_08192634:
	ldr r0, _08192648
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _08192654
	ldr r0, _0819264C
	ldr r0, [r0]
	ldr r1, _08192650
	adds r0, r0, r1
	add r0, sb
	b _0819267C
	.align 2, 0
_08192648: .4byte 0x000003FF
_0819264C: .4byte 0x03005AF0
_08192650: .4byte 0x00000EFC
_08192654:
	ldr r0, _0819273C
	ldr r0, [r0]
	mov ip, r0
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	str r0, [sp, #0x50]
	lsls r0, r0, #1
	ldr r1, [sp, #0x34]
	adds r0, r1, r0
	ldr r1, _08192740
	add r1, ip
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _08192744
	ldr r1, [r1]
	lsls r0, r0, #4
	adds r0, r0, r1
	adds r0, #2
	add r0, sl
_0819267C:
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r0, r6, r0
	adds r0, r0, r3
	ldrh r1, [r4]
	ldrb r0, [r0]
	adds r1, r1, r0
	strh r1, [r4]
_0819268C:
	adds r4, #2
	adds r6, #1
	cmp r6, #0xf
	ble _081925FA
	adds r2, #2
	adds r5, #1
	cmp r5, #3
	ble _081925F0
	ldr r7, [sp, #0x38]
	cmp r7, #2
	ble _081925E4
	movs r7, #0
	ldr r2, _08192748
	mov sb, r2
	ldr r3, _0819274C
	mov sl, r3
_081926AC:
	movs r4, #0
	movs r6, #0
	movs r5, #0
	mov r3, r8
	lsls r0, r7, #4
	mov r1, sl
	adds r2, r0, r1
_081926BA:
	ldrb r0, [r2]
	cmp r0, #0
	beq _081926D2
	adds r4, #1
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _081926D2
	ldrb r1, [r2]
	cmp r0, r1
	blt _081926D2
	adds r6, #1
_081926D2:
	adds r3, #2
	adds r2, #1
	adds r5, #1
	cmp r5, #0xf
	ble _081926BA
	cmp r4, r6
	beq _081926E6
	adds r7, #1
	cmp r7, #0x1e
	bls _081926AC
_081926E6:
	lsls r0, r7, #2
	add r0, sb
	ldr r0, [r0]
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	movs r1, #0x15
	strb r1, [r0, #7]
	strb r1, [r0, #9]
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	movs r1, #0
	mov r0, r8
	adds r0, #0x22
_08192704:
	strh r1, [r0]
	subs r0, #2
	cmp r0, r8
	bge _08192704
	ldr r2, [sp, #0x24]
	ldr r3, _08192750
	adds r0, r2, r3
	cmp r0, #1
	bls _08192718
	b _08192858
_08192718:
	movs r7, #0
	movs r4, #0
	mov sb, r4
_0819271E:
	movs r5, #0
	mov r4, r8
	mov r6, sb
_08192724:
	ldr r0, _08192754
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _08192758
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r6, #0x18
	bl GetFrontierBrainMonEvs
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08192768
	.align 2, 0
_0819273C: .4byte 0x03005AF0
_08192740: .4byte 0x00000D64
_08192744: .4byte 0x0203B958
_08192748: .4byte 0x085D5C90
_0819274C: .4byte 0x085D542C
_08192750: .4byte 0xFFFFFC02
_08192754: .4byte 0x000003FE
_08192758:
	ldr r0, _08192798
	ldr r0, [r0]
	lsls r1, r7, #4
	adds r1, r5, r1
	ldr r2, _0819279C
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
_08192768:
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #5
	ble _08192724
	mov r3, r8
	ldrh r0, [r3]
	ldrh r4, [r3, #0xc]
	adds r0, r0, r4
	strh r0, [r3, #0xc]
	movs r5, #0
	mov r4, r8
_08192780:
	ldr r0, _081927A0
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _081927A4
	mov r2, sb
	lsrs r0, r2, #0x18
	bl GetFrontierBrainMonNature
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _081927B2
	.align 2, 0
_08192798: .4byte 0x03005AF0
_0819279C: .4byte 0x00000F04
_081927A0: .4byte 0x000003FE
_081927A4:
	ldr r0, _081927DC
	ldr r0, [r0]
	lsls r1, r7, #4
	adds r0, r0, r1
	ldr r3, _081927E0
	adds r0, r0, r3
	ldrb r2, [r0]
_081927B2:
	ldr r1, _081927E4
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r0, r5, r0
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _081927E8
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0x6e
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	ldrh r1, [r4, #0xe]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
	b _08192810
	.align 2, 0
_081927DC: .4byte 0x03005AF0
_081927E0: .4byte 0x00000F0A
_081927E4: .4byte 0x082EF1A0
_081927E8:
	cmp r0, #0
	bge _08192808
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r0, #0x5a
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	ldrh r1, [r4, #0xe]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
	ldrh r0, [r4, #0x1a]
	adds r0, #1
	strh r0, [r4, #0x1a]
	b _08192810
_08192808:
	ldrh r0, [r4, #2]
	ldrh r3, [r4, #0xe]
	adds r0, r0, r3
	strh r0, [r4, #0xe]
_08192810:
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _08192780
	movs r4, #0x80
	lsls r4, r4, #0x11
	add sb, r4
	adds r7, #1
	cmp r7, #2
	bgt _08192826
	b _0819271E
_08192826:
	movs r5, #0
	mov r1, r8
	movs r7, #5
_0819282C:
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	adds r5, r5, r0
	adds r1, #2
	subs r7, #1
	cmp r7, #0
	bge _0819282C
	movs r6, #0x64
	mov r4, r8
	movs r7, #5
_08192840:
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	muls r0, r6, r0
	adds r1, r5, #0
	bl __divsi3
	strh r0, [r4]
	adds r4, #2
	subs r7, #1
	cmp r7, #0
	bge _08192840
	b _081929A4
_08192858:
	ldr r4, _08192928
	mov sl, r4
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	lsls r0, r0, #1
	mov sb, r0
	movs r7, #2
_08192868:
	ldr r3, _0819292C
	ldr r0, [r3]
	ldr r4, _08192930
	adds r0, r0, r4
	add r0, sb
	ldrh r0, [r0]
	mov r2, sl
	ldr r1, [r2]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r2, [r0, #0xb]
	movs r6, #0
	movs r4, #0
	movs r3, #1
	mov r1, r8
	movs r5, #5
_08192888:
	strh r4, [r1]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	beq _08192894
	adds r6, #1
_08192894:
	asrs r2, r2, #1
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bge _08192888
	movs r0, #0xff
	lsls r0, r0, #1
	adds r1, r6, #0
	bl __divsi3
	adds r6, r0, #0
	ldr r3, _0819292C
	ldr r0, [r3]
	ldr r4, _08192930
	adds r0, r0, r4
	add r0, sb
	ldrh r0, [r0]
	mov r2, sl
	ldr r1, [r2]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r2, [r0, #0xb]
	movs r3, #1
	mov r1, r8
	movs r5, #5
_081928C6:
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	beq _081928D0
	strh r6, [r1]
_081928D0:
	asrs r2, r2, #1
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bge _081928C6
	mov r3, r8
	ldrh r0, [r3]
	ldrh r4, [r3, #0xc]
	adds r0, r0, r4
	strh r0, [r3, #0xc]
	movs r5, #0
	mov r4, r8
_081928E8:
	ldr r1, _0819292C
	ldr r0, [r1]
	ldr r2, _08192930
	adds r0, r0, r2
	add r0, sb
	ldrh r0, [r0]
	mov r3, sl
	ldr r1, [r3]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r2, [r0, #0xc]
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r0, r5, r0
	ldr r1, _08192934
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08192938
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r0, #0x6e
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	ldrh r1, [r4, #0xe]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
	b _08192960
	.align 2, 0
_08192928: .4byte 0x0203B958
_0819292C: .4byte 0x03005AF0
_08192930: .4byte 0x00000D64
_08192934: .4byte 0x082EF1A0
_08192938:
	cmp r0, #0
	bge _08192958
	movs r3, #2
	ldrsh r1, [r4, r3]
	movs r0, #0x5a
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	ldrh r1, [r4, #0xe]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
	ldrh r0, [r4, #0x1a]
	adds r0, #1
	strh r0, [r4, #0x1a]
	b _08192960
_08192958:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #0xe]
	adds r0, r0, r1
	strh r0, [r4, #0xe]
_08192960:
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _081928E8
	movs r2, #2
	add sb, r2
	subs r7, #1
	cmp r7, #0
	blt _08192974
	b _08192868
_08192974:
	movs r5, #0
	mov r1, r8
	movs r7, #5
_0819297A:
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	adds r5, r5, r0
	adds r1, #2
	subs r7, #1
	cmp r7, #0
	bge _0819297A
	movs r6, #0x64
	mov r4, r8
	movs r7, #5
_0819298E:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	muls r0, r6, r0
	adds r1, r5, #0
	bl __divsi3
	strh r0, [r4]
	adds r4, #2
	subs r7, #1
	cmp r7, #0
	bge _0819298E
_081929A4:
	movs r7, #0
	movs r5, #0
	movs r6, #0
	mov r4, r8
	mov sl, r8
	mov sb, r8
_081929B0:
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r1, #0x1d
	ble _08192A12
	cmp r7, #2
	bne _08192A08
	mov r3, r8
	movs r0, #0xc
	ldrsh r3, [r3, r0]
	mov ip, r3
	cmp ip, r1
	bge _081929FA
	mov r2, r8
	ldrh r2, [r2, #0xe]
	add r3, sp, #0x54
	strh r2, [r3]
	mov r2, r8
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	cmp r0, r1
	bge _081929EE
	cmp ip, r0
	bge _081929E8
	add r0, sp, #0x54
	ldrh r0, [r0]
	strh r0, [r2, #0xc]
	strh r6, [r2, #0xe]
	b _08192A12
_081929E8:
	mov r1, r8
	strh r6, [r1, #0xe]
	b _08192A12
_081929EE:
	add r2, sp, #0x54
	ldrh r3, [r2]
	mov r2, r8
	strh r3, [r2, #0xc]
	strh r6, [r2, #0xe]
	b _08192A12
_081929FA:
	mov r3, r8
	movs r2, #0xe
	ldrsh r0, [r3, r2]
	cmp r0, r1
	bge _08192A12
	strh r6, [r3, #0xe]
	b _08192A12
_08192A08:
	mov r3, sb
	strh r6, [r3, #0xc]
	movs r0, #2
	add sb, r0
	adds r7, #1
_08192A12:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08192A98
	cmp r5, #2
	bne _08192A8E
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bgt _08192A4C
	cmp r0, #1
	bne _08192A98
	mov r3, r8
	movs r1, #0x10
	ldrsh r0, [r3, r1]
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0x18
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08192A56
	movs r1, #0x12
	ldrsh r0, [r3, r1]
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0x18
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08192A56
_08192A4C:
	mov r3, r8
	ldrh r0, [r3, #0x12]
	strh r0, [r3, #0x10]
	strh r6, [r3, #0x12]
	b _08192A98
_08192A56:
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _08192A98
	mov r2, r8
	movs r3, #0x10
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08192A78
	ldrh r0, [r2, #0x12]
	strh r0, [r2, #0x10]
	strh r6, [r2, #0x12]
	b _08192A98
_08192A78:
	mov r2, r8
	movs r3, #0x12
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08192A98
	strh r6, [r2, #0x12]
	b _08192A98
_08192A8E:
	mov r2, sl
	strh r6, [r2, #0x10]
	movs r3, #2
	add sl, r3
	adds r5, #1
_08192A98:
	adds r4, #2
	adds r6, #1
	cmp r6, #5
	ble _081929B0
	cmp r7, #2
	bne _08192AC0
	ldr r0, _08192ABC
	mov r4, r8
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	adds r0, r2, r0
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	subs r1, #1
	subs r1, r1, r2
	ldrb r0, [r0]
	adds r7, r1, r0
	b _08192B06
	.align 2, 0
_08192ABC: .4byte 0x085D5DC5
_08192AC0:
	cmp r7, #1
	bne _08192AD0
	mov r4, r8
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	adds r7, r0, #0
	adds r7, #0xf
	b _08192B06
_08192AD0:
	cmp r5, #2
	bne _08192AF4
	ldr r0, _08192AF0
	mov r3, r8
	movs r4, #0x10
	ldrsh r2, [r3, r4]
	adds r0, r2, r0
	movs r4, #0x12
	ldrsh r1, [r3, r4]
	subs r1, #1
	subs r1, r1, r2
	ldrb r0, [r0]
	adds r1, r1, r0
	adds r7, r1, #0
	adds r7, #0x15
	b _08192B06
	.align 2, 0
_08192AF0: .4byte 0x085D5DC5
_08192AF4:
	cmp r5, #1
	bne _08192B04
	mov r1, r8
	movs r2, #0x10
	ldrsh r0, [r1, r2]
	adds r7, r0, #0
	adds r7, #0x24
	b _08192B06
_08192B04:
	movs r7, #0x2a
_08192B06:
	lsls r0, r7, #2
	ldr r3, _08192B38
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	movs r1, #0x25
	strb r1, [r0, #7]
	strb r1, [r0, #9]
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	mov r0, r8
	bl Free
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08192B38: .4byte 0x085D5D10
	thumb_func_end DisplayTrainerInfoOnCard

	thumb_func_start sub_08192B3C
sub_08192B3C: @ 0x08192B3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r1, [sp]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0
	str r0, [sp, #4]
	mov r8, r0
	ldr r2, _08192BB0
	lsls r0, r7, #1
	adds r0, r0, r7
	adds r1, r0, r2
	ldrb r6, [r1]
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, r6, r0
	adds r3, r2, #0
	cmp r6, r0
	bge _08192C08
	ldr r5, _08192BB4
	ldr r1, _08192BB8
	mov sl, r1
	ldr r2, _08192BBC
	mov sb, r2
_08192B76:
	ldr r0, _08192BC0
	adds r0, r6, r0
	ldrb r4, [r0]
	ldr r0, [r5]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r2, _08192BC4
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _08192BF2
	ldr r0, [sp]
	add r0, r8
	strb r4, [r0]
	ldr r2, [r5]
	adds r0, r2, r1
	ldr r1, _08192BC8
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	cmp r0, sl
	bne _08192BD0
	ldr r0, _08192BCC
	adds r1, r2, #0
	bl StringCopy
	b _08192BEC
	.align 2, 0
_08192BB0: .4byte 0x085D5E40
_08192BB4: .4byte 0x03005AF0
_08192BB8: .4byte 0x000003FF
_08192BBC: .4byte 0x000003FE
_08192BC0: .4byte 0x085D5E30
_08192BC4: .4byte 0x00000D25
_08192BC8: .4byte 0x00000D24
_08192BCC: .4byte 0x02021C40
_08192BD0:
	lsrs r0, r1, #0x16
	cmp r0, sb
	bne _08192BE4
	ldr r0, _08192BE0
	bl CopyDomeBrainTrainerName
	b _08192BEC
	.align 2, 0
_08192BE0: .4byte 0x02021C40
_08192BE4:
	lsrs r1, r1, #0x16
	ldr r0, _08192C14
	bl CopyDomeTrainerName
_08192BEC:
	movs r2, #1
	add r8, r2
	ldr r3, _08192C18
_08192BF2:
	adds r6, #1
	lsls r1, r7, #1
	adds r1, r1, r7
	adds r0, r1, r3
	ldrb r2, [r0]
	adds r0, r3, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r2, r0
	cmp r6, r2
	blt _08192B76
_08192C08:
	mov r5, r8
	cmp r5, #2
	bne _08192C1C
	movs r0, #0
	b _08192D6C
	.align 2, 0
_08192C14: .4byte 0x02021C40
_08192C18: .4byte 0x085D5E40
_08192C1C:
	mov ip, r3
	lsls r3, r7, #1
	adds r0, r3, r7
	mov r2, ip
	adds r1, r0, r2
	ldrb r6, [r1]
	mov r1, ip
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, r6, r0
	str r3, [sp, #8]
	cmp r6, r0
	blt _08192C3A
	b _08192D56
_08192C3A:
	ldr r5, _08192CD8
	mov sl, r5
	ldr r0, _08192CDC
	mov sb, r0
_08192C42:
	ldr r0, _08192CE0
	adds r0, r6, r0
	ldrb r4, [r0]
	mov r1, sl
	ldr r0, [r1]
	lsls r2, r4, #2
	str r2, [sp, #0xc]
	adds r0, r0, r2
	add r0, sb
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	cmp r0, #0
	bge _08192D30
	lsls r2, r2, #0x1b
	adds r1, r3, r7
	mov r0, ip
	adds r0, #2
	adds r1, r1, r0
	lsrs r2, r2, #0x1e
	ldrb r1, [r1]
	cmp r2, r1
	blo _08192D30
	ldr r0, [sp]
	add r0, r8
	strb r4, [r0]
	movs r5, #1
	add r8, r5
	mov r0, sl
	ldr r3, [r0]
	ldr r5, [sp, #0xc]
	adds r2, r3, r5
	adds r0, r2, #0
	add r0, sb
	ldrb r5, [r0]
	mov ip, r5
	mov r0, ip
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, r1
	bne _08192CEC
	lsls r4, r4, #1
	movs r1, #0xec
	lsls r1, r1, #4
	adds r0, r3, r1
	adds r0, r0, r4
	ldrh r1, [r0]
	lsls r1, r1, #3
	ldr r0, _08192CE4
	adds r1, r1, r0
	ldr r0, _08192CE8
	bl StringCopy
	mov r2, sl
	ldr r1, [r2]
	ldr r5, [sp, #0xc]
	adds r0, r1, r5
	add r0, sb
	ldrb r0, [r0]
	lsls r2, r0, #0x18
	lsrs r0, r2, #0x1d
	lsls r0, r0, #1
	str r0, [sp, #4]
	movs r0, #0xec
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0
	bne _08192D30
	lsrs r0, r2, #0x1d
	cmp r0, #0
	bne _08192D30
	movs r1, #4
	str r1, [sp, #4]
	b _08192D30
	.align 2, 0
_08192CD8: .4byte 0x03005AF0
_08192CDC: .4byte 0x00000D25
_08192CE0: .4byte 0x085D5E30
_08192CE4: .4byte 0x082EACC4
_08192CE8: .4byte 0x02021C54
_08192CEC:
	ldr r5, _08192D04
	adds r0, r2, r5
	ldrh r0, [r0]
	lsls r1, r0, #0x16
	ldr r0, _08192D08
	cmp r1, r0
	bne _08192D10
	ldr r0, _08192D0C
	adds r1, r3, #0
	bl StringCopy
	b _08192D30
	.align 2, 0
_08192D04: .4byte 0x00000D24
_08192D08: .4byte 0xFFC00000
_08192D0C: .4byte 0x02021C40
_08192D10:
	ldr r0, _08192D20
	cmp r1, r0
	bne _08192D28
	ldr r0, _08192D24
	bl CopyDomeBrainTrainerName
	b _08192D30
	.align 2, 0
_08192D20: .4byte 0xFF800000
_08192D24: .4byte 0x02021C40
_08192D28:
	lsrs r1, r1, #0x16
	ldr r0, _08192D60
	bl CopyDomeTrainerName
_08192D30:
	mov r0, r8
	cmp r0, #2
	beq _08192D56
	adds r6, #1
	ldr r1, _08192D64
	mov ip, r1
	ldr r3, [sp, #8]
	adds r1, r3, r7
	mov r2, ip
	adds r0, r1, r2
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r2, r0
	cmp r6, r2
	bge _08192D56
	b _08192C42
_08192D56:
	cmp r7, #0xe
	beq _08192D68
	ldr r0, [sp, #4]
	adds r0, #1
	b _08192D6C
	.align 2, 0
_08192D60: .4byte 0x02021C40
_08192D64: .4byte 0x085D5E40
_08192D68:
	ldr r0, [sp, #4]
	adds r0, #2
_08192D6C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08192B3C

	thumb_func_start DisplayMatchInfoOnCard
DisplayMatchInfoOnCard: @ 0x08192D7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x34]
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r0, #0
	str r0, [sp, #0x3c]
	movs r7, #0
	movs r1, #0
	str r1, [sp, #0x40]
	movs r2, #0
	str r2, [sp, #0x44]
	mov sb, r2
	movs r0, #1
	ldr r3, [sp, #0x34]
	ands r0, r3
	cmp r0, #0
	beq _08192DB6
	movs r7, #8
	str r7, [sp, #0x3c]
	movs r7, #9
	movs r0, #2
	mov sb, r0
_08192DB6:
	movs r0, #2
	ldr r1, [sp, #0x34]
	ands r0, r1
	cmp r0, #0
	beq _08192DC6
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #0x40]
_08192DC6:
	movs r0, #4
	ldr r3, [sp, #0x34]
	ands r0, r3
	cmp r0, #0
	beq _08192DD4
	movs r0, #0xa0
	str r0, [sp, #0x44]
_08192DD4:
	movs r0, #8
	ldr r1, [sp, #0x34]
	ands r0, r1
	cmp r0, #0
	beq _08192DE2
	ldr r2, _08192EB4
	str r2, [sp, #0x40]
_08192DE2:
	movs r0, #0x10
	ldr r3, [sp, #0x34]
	ands r0, r3
	cmp r0, #0
	beq _08192DF2
	movs r0, #0xa0
	rsbs r0, r0, #0
	str r0, [sp, #0x44]
_08192DF2:
	ldr r4, _08192EB8
	ldr r1, [r4]
	adds r1, #0x11
	adds r0, r6, #0
	bl sub_08192B3C
	str r0, [sp, #0x38]
	movs r5, #0
	mov r1, sp
	adds r1, #0x1c
	str r1, [sp, #0x4c]
	mov r2, sp
	adds r2, #0x24
	str r2, [sp, #0x50]
	lsls r1, r6, #1
	mov r3, sp
	adds r3, #0x2c
	str r3, [sp, #0x54]
	ldr r0, [sp, #0x40]
	adds r0, #0x30
	mov r8, r0
	ldr r2, [sp, #0x44]
	adds r2, #0x58
	str r2, [sp, #0x7c]
	movs r3, #0xc
	add r3, sb
	mov sl, r3
	ldr r0, [sp, #0x40]
	adds r0, #0xc0
	str r0, [sp, #0x48]
	mov r2, sb
	adds r2, #0xd
	str r2, [sp, #0x78]
	ldr r3, [sp, #0x3c]
	adds r3, #1
	mov sb, r3
	ldr r0, [sp, #0x3c]
	adds r0, #2
	str r0, [sp, #0x58]
	ldr r2, [sp, #0x3c]
	adds r2, #5
	str r2, [sp, #0x60]
	adds r3, r7, #0
	adds r3, #8
	str r3, [sp, #0x70]
	adds r0, r7, #6
	str r0, [sp, #0x68]
	adds r2, r7, #7
	str r2, [sp, #0x6c]
	lsls r3, r6, #2
	str r3, [sp, #0x5c]
	adds r0, r7, #5
	str r0, [sp, #0x64]
	ldr r0, [r4]
	adds r0, #0x11
	mov ip, r0
	ldr r0, _08192EBC
	ldr r4, [r0]
	ldr r0, _08192EC0
	movs r3, #0
	adds r1, r1, r6
	adds r1, r1, r0
	ldrb r6, [r1]
_08192E70:
	ldr r1, [sp, #0x4c]
	adds r2, r3, r1
	mov r7, ip
	adds r0, r7, r5
	ldrb r0, [r0]
	str r0, [r2]
	ldr r7, [sp, #0x50]
	adds r1, r3, r7
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r7, _08192EC4
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	str r0, [r1]
	ldr r0, [r2]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r1, _08192EC8
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, r6
	bhi _08192ECC
	lsls r0, r1, #0x1d
	cmp r0, #0
	bge _08192ECC
	ldr r2, [sp, #0x54]
	adds r1, r3, r2
	movs r0, #1
	b _08192ED2
	.align 2, 0
_08192EB4: .4byte 0xFFFFFF00
_08192EB8: .4byte 0x0203CA44
_08192EBC: .4byte 0x03005AF0
_08192EC0: .4byte 0x085D5E42
_08192EC4: .4byte 0x00000D24
_08192EC8: .4byte 0x00000D25
_08192ECC:
	ldr r7, [sp, #0x54]
	adds r1, r3, r7
	movs r0, #0
_08192ED2:
	str r0, [r1]
	adds r3, #4
	adds r5, #1
	cmp r5, #1
	ble _08192E70
	ldr r1, [sp, #0x24]
	ldr r0, _08192EFC
	cmp r1, r0
	bne _08192F04
	ldr r0, _08192F00
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	bl PlayerGenderToFrontTrainerPicId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, r8
	ldr r3, [sp, #0x7c]
	mov r1, sl
	str r1, [sp]
	b _08192F28
	.align 2, 0
_08192EFC: .4byte 0x000003FF
_08192F00: .4byte 0x03005AF0
_08192F04:
	ldr r0, _08192F10
	cmp r1, r0
	bne _08192F14
	bl CallBattleDomeFunction
	b _08192F1C
	.align 2, 0
_08192F10: .4byte 0x000003FE
_08192F14:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl GetFrontierTrainerFrontSpriteId
_08192F1C:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, r8
	ldr r3, [sp, #0x7c]
	mov r7, sl
	str r7, [sp]
_08192F28:
	ldr r1, _08192FA4
	str r1, [sp, #4]
	movs r1, #1
	bl CreateTrainerPicSprite
	ldr r1, _08192FA8
	ldr r1, [r1]
	ldr r2, [sp, #0x3c]
	adds r1, r1, r2
	strb r0, [r1]
	movs r0, #0x1e
	ldr r3, [sp, #0x34]
	ands r0, r3
	cmp r0, #0
	beq _08192F64
	ldr r2, _08192FAC
	ldr r0, _08192FA8
	ldr r0, [r0]
	ldr r7, [sp, #0x3c]
	adds r0, r0, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_08192F64:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _08192F8A
	ldr r2, _08192FAC
	ldr r0, _08192FA8
	ldr r0, [r0]
	ldr r1, [sp, #0x3c]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #5]
	movs r1, #0xf
	ands r1, r2
	movs r2, #0x30
	orrs r1, r2
	strb r1, [r0, #5]
_08192F8A:
	ldr r2, [sp, #0x50]
	ldr r1, [r2, #4]
	ldr r0, _08192FB0
	cmp r1, r0
	bne _08192FB8
	ldr r0, _08192FB4
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	bl PlayerGenderToFrontTrainerPicId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08192FE0
	.align 2, 0
_08192FA4: .4byte 0x0000FFFF
_08192FA8: .4byte 0x0203CA44
_08192FAC: .4byte 0x020205AC
_08192FB0: .4byte 0x000003FF
_08192FB4: .4byte 0x03005AF0
_08192FB8:
	ldr r0, _08192FD0
	cmp r1, r0
	bne _08192FD4
	bl CallBattleDomeFunction
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x7c]
	ldr r1, [sp, #0x78]
	str r1, [sp]
	b _08192FE8
	.align 2, 0
_08192FD0: .4byte 0x000003FE
_08192FD4:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl GetFrontierTrainerFrontSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08192FE0:
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x7c]
	ldr r7, [sp, #0x78]
	str r7, [sp]
_08192FE8:
	ldr r1, _0819307C
	str r1, [sp, #4]
	movs r1, #1
	bl CreateTrainerPicSprite
	ldr r1, _08193080
	ldr r1, [r1]
	add r1, sb
	strb r0, [r1]
	movs r0, #0x1e
	ldr r1, [sp, #0x34]
	ands r0, r1
	cmp r0, #0
	beq _08193020
	ldr r2, _08193084
	ldr r0, _08193080
	ldr r0, [r0]
	add r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_08193020:
	ldr r2, [sp, #0x54]
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _08193046
	ldr r2, _08193084
	ldr r0, _08193080
	ldr r0, [r0]
	add r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #5]
	movs r1, #0xf
	ands r1, r2
	movs r2, #0x30
	orrs r1, r2
	strb r1, [r0, #5]
_08193046:
	movs r5, #0
	ldr r3, [sp, #0x38]
	lsls r3, r3, #2
	str r3, [sp, #0x74]
	mov r8, r5
	ldr r6, _08193080
	ldr r7, _08193084
	ldr r4, [sp, #0x58]
	mov sb, r5
	movs r0, #1
	mov sl, r0
_0819305C:
	ldr r1, [sp, #0x24]
	ldr r0, _08193088
	cmp r1, r0
	bne _08193094
	ldr r0, _0819308C
	ldr r2, [r0]
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldr r1, _08193090
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r0, [r2]
	b _081930E0
	.align 2, 0
_0819307C: .4byte 0x0000FFFF
_08193080: .4byte 0x0203CA44
_08193084: .4byte 0x020205AC
_08193088: .4byte 0x000003FF
_0819308C: .4byte 0x03005AF0
_08193090: .4byte 0x00000D64
_08193094:
	ldr r0, _081930B4
	cmp r1, r0
	bne _081930C0
	ldr r0, _081930B8
	ldr r2, [r0]
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldr r1, _081930BC
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r0, [r2]
	b _081930E0
	.align 2, 0
_081930B4: .4byte 0x000003FE
_081930B8: .4byte 0x03005AF0
_081930BC: .4byte 0x00000D64
_081930C0:
	ldr r0, _081931B8
	ldr r2, [r0]
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldr r1, _081931BC
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r1, [r2]
	ldr r0, _081931C0
	ldr r0, [r0]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrh r0, [r1]
_081930E0:
	ldr r1, _081931C4
	adds r1, r5, r1
	ldrb r2, [r1]
	ldr r3, [sp, #0x40]
	orrs r2, r3
	ldr r1, _081931C8
	adds r1, r5, r1
	ldrb r3, [r1]
	ldr r1, [sp, #0x44]
	adds r3, r3, r1
	mov r1, r8
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, sl
	str r1, [sp, #8]
	ldr r1, _081931CC
	bl CreateMonIcon
	ldr r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrb r1, [r0, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	strb r1, [r0, #5]
	movs r0, #0x1e
	ldr r1, [sp, #0x34]
	ands r0, r1
	cmp r0, #0
	beq _08193146
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_08193146:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _08193178
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	movs r2, #0x30
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r2, sl
	strh r2, [r0, #0x34]
_08193178:
	adds r4, #1
	movs r3, #2
	add sb, r3
	adds r5, #1
	cmp r5, #2
	bgt _08193186
	b _0819305C
_08193186:
	movs r5, #0
	ldr r6, _081931D0
	ldr r7, _081931D4
	mov r8, r7
	ldr r4, [sp, #0x60]
	mov sb, r5
	movs r7, #0
_08193194:
	ldr r0, [sp, #0x50]
	ldr r1, [r0, #4]
	ldr r0, _081931D8
	cmp r1, r0
	bne _081931DC
	ldr r0, _081931B8
	ldr r2, [r0]
	ldr r3, [sp, #0x4c]
	ldr r1, [r3, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldr r1, _081931BC
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r0, [r2]
	b _0819322A
	.align 2, 0
_081931B8: .4byte 0x03005AF0
_081931BC: .4byte 0x00000D64
_081931C0: .4byte 0x0203B958
_081931C4: .4byte 0x085D5E24
_081931C8: .4byte 0x085D5E27
_081931CC: .4byte 0x08190595
_081931D0: .4byte 0x0203CA44
_081931D4: .4byte 0x020205AC
_081931D8: .4byte 0x000003FF
_081931DC:
	ldr r0, _081931FC
	cmp r1, r0
	bne _08193208
	ldr r0, _08193200
	ldr r2, [r0]
	ldr r0, [sp, #0x4c]
	ldr r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldr r1, _08193204
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r0, [r2]
	b _0819322A
	.align 2, 0
_081931FC: .4byte 0x000003FE
_08193200: .4byte 0x03005AF0
_08193204: .4byte 0x00000D64
_08193208:
	ldr r0, _0819335C
	ldr r2, [r0]
	ldr r0, [sp, #0x4c]
	ldr r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldr r1, _08193360
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r1, [r2]
	ldr r0, _08193364
	ldr r0, [r0]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrh r0, [r1]
_0819322A:
	ldr r1, _08193368
	adds r1, r5, r1
	ldrb r2, [r1]
	ldr r3, [sp, #0x40]
	orrs r2, r3
	ldr r1, _0819336C
	adds r1, r5, r1
	ldrb r3, [r1]
	ldr r1, [sp, #0x44]
	adds r3, r3, r1
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	ldr r1, _08193370
	bl CreateMonIcon
	ldr r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r0, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	strb r1, [r0, #5]
	movs r0, #0x1e
	ldr r1, [sp, #0x34]
	ands r0, r1
	cmp r0, #0
	beq _0819328E
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_0819328E:
	ldr r2, [sp, #0x54]
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _081932C2
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	movs r2, #0x30
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	movs r1, #1
	strh r1, [r0, #0x34]
_081932C2:
	adds r4, #1
	movs r3, #2
	add sb, r3
	adds r5, #1
	cmp r5, #2
	bgt _081932D0
	b _08193194
_081932D0:
	add r0, sp, #0xc
	movs r2, #0
	strb r2, [r0, #6]
	adds r1, r0, #0
	movs r0, #2
	strb r0, [r1, #7]
	adds r0, r1, #0
	ldrb r0, [r0, #6]
	strb r0, [r1, #8]
	adds r0, r1, #0
	ldrb r0, [r0, #7]
	strb r0, [r1, #9]
	adds r0, r1, #0
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	adds r3, r0, #0
	ldrb r2, [r3, #0xc]
	movs r1, #0x10
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r2, r3, #0
	movs r0, #0xe0
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	ands r1, r0
	strb r1, [r2, #0xd]
	adds r1, r2, #0
	movs r0, #0xd0
	strb r0, [r1, #0xd]
	ldr r4, _08193374
	ldr r0, _08193378
	ldr r7, [sp, #0x74]
	adds r0, r7, r0
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringExpandPlaceholders
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	add r1, sp, #0x70
	ldrb r1, [r1]
	strb r1, [r0, #4]
	adds r1, r0, #0
	movs r0, #1
	strb r0, [r1, #5]
	ldr r4, [sp, #0x70]
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	ldr r1, [sp, #0x24]
	ldr r0, _0819337C
	cmp r1, r0
	bne _08193384
	ldr r0, _08193380
	ldr r1, _0819335C
	ldr r1, [r1]
	bl StringCopy
	b _081933A6
	.align 2, 0
_0819335C: .4byte 0x03005AF0
_08193360: .4byte 0x00000D64
_08193364: .4byte 0x0203B958
_08193368: .4byte 0x085D5E2A
_0819336C: .4byte 0x085D5E2D
_08193370: .4byte 0x08190595
_08193374: .4byte 0x02021C7C
_08193378: .4byte 0x085D5E08
_0819337C: .4byte 0x000003FF
_08193380: .4byte 0x02021C40
_08193384:
	ldr r0, _08193394
	cmp r1, r0
	bne _0819339C
	ldr r0, _08193398
	bl CopyDomeBrainTrainerName
	b _081933A6
	.align 2, 0
_08193394: .4byte 0x000003FE
_08193398: .4byte 0x02021C40
_0819339C:
	ldr r0, _081933E8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl CopyDomeTrainerName
_081933A6:
	add r0, sp, #0xc
	movs r1, #2
	strb r1, [r0, #5]
	strb r1, [r0, #0xa]
	ldr r5, _081933E8
	str r5, [sp, #0xc]
	add r2, sp, #0x68
	ldrb r2, [r2]
	strb r2, [r0, #4]
	ldr r4, [sp, #0x68]
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	ldr r3, [sp, #0x50]
	ldr r1, [r3, #4]
	ldr r0, _081933EC
	cmp r1, r0
	bne _081933F4
	ldr r0, _081933F0
	ldr r1, [r0]
	adds r0, r5, #0
	bl StringCopy
	b _08193412
	.align 2, 0
_081933E8: .4byte 0x02021C40
_081933EC: .4byte 0x000003FF
_081933F0: .4byte 0x03005AF0
_081933F4:
	ldr r0, _08193404
	cmp r1, r0
	bne _08193408
	adds r0, r5, #0
	bl CopyDomeBrainTrainerName
	b _08193412
	.align 2, 0
_08193404: .4byte 0x000003FE
_08193408:
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	bl CopyDomeTrainerName
_08193412:
	ldr r0, _0819347C
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	movs r5, #0
	add r7, sp, #0x6c
	ldrb r7, [r7]
	strb r7, [r0, #4]
	ldr r4, [sp, #0x6c]
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	add r0, sp, #0xc
	strb r5, [r0, #0xa]
	ldr r0, _08193480
	ldr r1, [sp, #0x5c]
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	add r2, sp, #0x64
	ldrb r2, [r2]
	strb r2, [r0, #4]
	ldr r4, [sp, #0x64]
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819347C: .4byte 0x02021C40
_08193480: .4byte 0x085D5DCC
	thumb_func_end DisplayMatchInfoOnCard

	thumb_func_start ShowDomeTourneyTree
ShowDomeTourneyTree: @ 0x08193484
	push {lr}
	ldr r0, _081934B4
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081934B8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1, #8]
	strh r2, [r1, #0xa]
	movs r0, #2
	strh r0, [r1, #0xc]
	strh r2, [r1, #0x10]
	ldr r0, _081934BC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081934B4: .4byte 0x08193E01
_081934B8: .4byte 0x03005B60
_081934BC: .4byte 0x08194755
	thumb_func_end ShowDomeTourneyTree

	thumb_func_start ShowPreviousDomeResultsTourneyTree
ShowPreviousDomeResultsTourneyTree: @ 0x081934C0
	push {r4, lr}
	bl InitDomeFacilityTrainersAndMons
	ldr r4, _08193520
	ldr r2, [r4]
	ldr r1, _08193524
	adds r0, r2, r1
	ldrb r1, [r0]
	subs r1, #1
	ldr r0, _08193528
	adds r2, r2, r0
	movs r0, #3
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r4]
	ldr r1, _0819352C
	adds r0, r0, r1
	movs r4, #0
	movs r1, #3
	strh r1, [r0]
	ldr r0, _08193530
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08193534
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	strh r4, [r1, #0xa]
	movs r0, #2
	strh r0, [r1, #0xc]
	movs r0, #1
	strh r0, [r1, #0x10]
	ldr r0, _08193538
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08193520: .4byte 0x03005AF0
_08193524: .4byte 0x00000D0A
_08193528: .4byte 0x00000CA9
_0819352C: .4byte 0x00000CB2
_08193530: .4byte 0x08193E01
_08193534: .4byte 0x03005B60
_08193538: .4byte 0x08194755
	thumb_func_end ShowPreviousDomeResultsTourneyTree

	thumb_func_start sub_0819353C
sub_0819353C: @ 0x0819353C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08193568
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0xa
	ldrsh r7, [r0, r2]
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #7
	bls _0819355E
	b _081937A2
_0819355E:
	lsls r0, r0, #2
	ldr r1, _0819356C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08193568: .4byte 0x03005B60
_0819356C: .4byte 0x08193570
_08193570: @ jump table
	.4byte _08193590 @ case 0
	.4byte _081935E0 @ case 1
	.4byte _08193600 @ case 2
	.4byte _08193688 @ case 3
	.4byte _081937A2 @ case 4
	.4byte _08193700 @ case 5
	.4byte _081937A2 @ case 6
	.4byte _08193764 @ case 7
_08193590:
	ldr r0, _081935D4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _081935A2
	b _081937A2
_081935A2:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, _081935D8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #8]
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _081935DC
	adds r0, r0, r1
	movs r1, #1
	bl StartSpriteAnim
	b _081937A2
	.align 2, 0
_081935D4: .4byte 0x02037C74
_081935D8: .4byte 0x03005B60
_081935DC: .4byte 0x020205AC
_081935E0:
	ldr r0, _081935FC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081935EE
	b _081937A2
_081935EE:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #8]
	b _081937A2
	.align 2, 0
_081935FC: .4byte 0x02037C74
_08193600:
	adds r0, r5, #0
	bl UpdateTourneyTreeCursor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08193610
	b _081937A2
_08193610:
	cmp r0, #1
	ble _0819361C
	cmp r0, #2
	beq _08193640
	cmp r0, #3
	beq _08193664
_0819361C:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _0819363C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #7
	strh r1, [r0, #8]
	b _081937A2
	.align 2, 0
_0819363C: .4byte 0x03005B60
_08193640:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _08193660
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #3
	strh r1, [r0, #8]
	b _081937A2
	.align 2, 0
_08193660: .4byte 0x03005B60
_08193664:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _08193684
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #5
	strh r1, [r0, #8]
	b _081937A2
	.align 2, 0
_08193684: .4byte 0x03005B60
_08193688:
	ldr r0, _081936E8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _0819369A
	b _081937A2
_0819369A:
	bl FreeAllWindowBuffers
	bl ScanlineEffect_Stop
	ldr r4, _081936EC
	ldr r0, [r4]
	bl Free
	str r6, [r4]
	ldr r0, _081936F0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _081936F4
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r3, #0
	strh r6, [r1, #8]
	ldr r0, _081936F8
	adds r0, r7, r0
	ldrb r0, [r0]
	strh r0, [r1, #0xa]
	movs r0, #1
	strh r0, [r1, #0xc]
	strh r5, [r1, #0xe]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #4
	strh r1, [r0, #8]
	ldr r0, _081936FC
	ldr r0, [r0]
	strb r3, [r0, #0x10]
	b _081937A2
	.align 2, 0
_081936E8: .4byte 0x02037C74
_081936EC: .4byte 0x0203CA48
_081936F0: .4byte 0x0819005D
_081936F4: .4byte 0x03005B60
_081936F8: .4byte 0x085D5AFC
_081936FC: .4byte 0x0203CA44
_08193700:
	ldr r0, _08193754
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _081937A2
	bl FreeAllWindowBuffers
	bl ScanlineEffect_Stop
	ldr r4, _08193758
	ldr r0, [r4]
	bl Free
	str r6, [r4]
	ldr r0, _0819375C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _08193760
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r6, [r0, #8]
	adds r1, r7, #0
	subs r1, #0x10
	strh r1, [r0, #0xa]
	movs r1, #2
	strh r1, [r0, #0xc]
	strh r5, [r0, #0xe]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #6
	strh r1, [r0, #8]
	b _081937A2
	.align 2, 0
_08193754: .4byte 0x02037C74
_08193758: .4byte 0x0203CA48
_0819375C: .4byte 0x0819005D
_08193760: .4byte 0x03005B60
_08193764:
	ldr r0, _081937AC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _081937A2
	bl FreeAllWindowBuffers
	bl ScanlineEffect_Stop
	ldr r4, _081937B0
	ldr r0, [r4]
	bl Free
	str r6, [r4]
	ldr r0, _081937B4
	bl SetMainCallback2
	ldr r1, _081937B8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #0x16]
	bl DestroyTask
	adds r0, r5, #0
	bl DestroyTask
_081937A2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081937AC: .4byte 0x02037C74
_081937B0: .4byte 0x0203CA48
_081937B4: .4byte 0x08085B35
_081937B8: .4byte 0x03005B60
	thumb_func_end sub_0819353C

	thumb_func_start UpdateTourneyTreeCursor
UpdateTourneyTreeCursor: @ 0x081937BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #1
	mov sb, r0
	movs r1, #4
	mov r8, r1
	ldr r1, _0819380C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xa
	ldrsh r5, [r0, r1]
	ldr r0, _08193810
	ldr r0, [r0]
	ldr r1, _08193814
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r0, _08193818
	ldrh r1, [r0, #0x2e]
	adds r2, r1, #0
	adds r3, r0, #0
	cmp r2, #2
	beq _08193800
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _08193838
	cmp r5, #0x1f
	bne _0819381C
_08193800:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	mov sb, r0
	b _081938BE
	.align 2, 0
_0819380C: .4byte 0x03005B60
_08193810: .4byte 0x03005AF0
_08193814: .4byte 0x00000CB2
_08193818: .4byte 0x03002360
_0819381C:
	cmp r5, #0xf
	bgt _0819382C
	movs r0, #5
	bl PlaySE
	movs r1, #2
	mov sb, r1
	b _081938BE
_0819382C:
	movs r0, #5
	bl PlaySE
	movs r0, #3
	mov sb, r0
	b _081938BE
_08193838:
	cmp r2, #0x40
	bne _08193858
	ldr r0, _08193854
	lsls r1, r5, #2
	adds r1, r1, r5
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08193858
	movs r1, #0
	mov r8, r1
	b _081938BE
	.align 2, 0
_08193854: .4byte 0x085D5695
_08193858:
	ldrh r0, [r3, #0x2e]
	cmp r0, #0x80
	bne _0819387C
	ldr r0, _08193878
	lsls r1, r5, #2
	adds r1, r1, r5
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0819387C
	movs r0, #1
	b _081938BC
	.align 2, 0
_08193878: .4byte 0x085D5695
_0819387C:
	ldrh r0, [r3, #0x2e]
	cmp r0, #0x20
	bne _081938A0
	ldr r0, _0819389C
	lsls r1, r5, #2
	adds r1, r1, r5
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r0, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081938A0
	movs r1, #2
	mov r8, r1
	b _081938BE
	.align 2, 0
_0819389C: .4byte 0x085D5695
_081938A0:
	ldrh r0, [r3, #0x2e]
	cmp r0, #0x10
	bne _081938BE
	ldr r0, _08193914
	lsls r1, r5, #2
	adds r1, r1, r5
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081938BE
	movs r0, #3
_081938BC:
	mov r8, r0
_081938BE:
	mov r1, r8
	cmp r1, #4
	beq _08193906
	movs r0, #5
	bl PlaySE
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r4, _08193918
	adds r0, r0, r4
	movs r1, #0
	bl StartSpriteAnim
	ldr r2, _08193914
	lsls r1, r6, #2
	add r1, r8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r5, [r1]
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAnim
	ldr r1, _0819391C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #0xa]
_08193906:
	mov r0, sb
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08193914: .4byte 0x085D5695
_08193918: .4byte 0x020205AC
_0819391C: .4byte 0x03005B60
	thumb_func_end UpdateTourneyTreeCursor

	thumb_func_start ShowNonInteractiveDomeTourneyTree
ShowNonInteractiveDomeTourneyTree: @ 0x08193920
	push {lr}
	ldr r0, _08193950
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08193954
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1, #8]
	movs r0, #1
	strh r0, [r1, #0xa]
	movs r0, #2
	strh r0, [r1, #0xc]
	strh r2, [r1, #0x10]
	ldr r0, _08193958
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08193950: .4byte 0x08193E01
_08193954: .4byte 0x03005B60
_08193958: .4byte 0x08194755
	thumb_func_end ShowNonInteractiveDomeTourneyTree

	thumb_func_start ResolveDomeRoundWinners
ResolveDomeRoundWinners: @ 0x0819395C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _081939D8
	ldrh r0, [r7]
	cmp r0, #1
	bne _081939F0
	ldr r5, _081939DC
	ldrh r0, [r5]
	bl TrainerIdToDomeTournamentId
	ldr r4, _081939E0
	ldr r2, [r4]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r6, _081939E4
	adds r2, r2, r6
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5]
	bl TrainerIdToDomeTournamentId
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r2, _081939E8
	mov r8, r2
	add r1, r8
	adds r0, r0, r6
	movs r3, #3
	ldrb r2, [r1]
	ands r2, r3
	lsls r2, r2, #3
	ldrb r3, [r0]
	movs r1, #0x19
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	ldrh r0, [r5]
	bl TrainerIdToDomeTournamentId
	ldr r2, [r4]
	lsls r0, r0, #1
	movs r3, #0xec
	lsls r3, r3, #4
	adds r1, r2, r3
	adds r1, r1, r0
	ldr r0, _081939EC
	ldrh r0, [r0, #0x22]
	strh r0, [r1]
	add r2, r8
	ldrh r0, [r2]
	cmp r0, #2
	bhi _08193A8E
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DecideRoundWinners
	b _08193A8E
	.align 2, 0
_081939D8: .4byte 0x02037282
_081939DC: .4byte 0x0203886A
_081939E0: .4byte 0x03005AF0
_081939E4: .4byte 0x00000D25
_081939E8: .4byte 0x00000CB2
_081939EC: .4byte 0x03005A70
_081939F0:
	ldr r5, _08193A98
	adds r0, r5, #0
	bl TrainerIdToDomeTournamentId
	ldr r4, _08193A9C
	ldr r2, [r4]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r6, _08193AA0
	adds r2, r2, r6
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl TrainerIdToDomeTournamentId
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r2, _08193AA4
	adds r1, r1, r2
	adds r0, r0, r6
	movs r3, #3
	ldrb r2, [r1]
	ands r2, r3
	lsls r2, r2, #3
	ldrb r3, [r0]
	movs r1, #0x19
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl TrainerIdToDomeTournamentId
	ldr r1, [r4]
	lsls r0, r0, #1
	movs r3, #0xec
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r1, r1, r0
	ldr r0, _08193AA8
	ldrh r0, [r0, #0x24]
	strh r0, [r1]
	ldr r0, _08193AAC
	ldrb r0, [r0]
	cmp r0, #9
	beq _08193A58
	ldrh r0, [r7]
	cmp r0, #9
	bne _08193A72
_08193A58:
	adds r0, r5, #0
	bl TrainerIdToDomeTournamentId
	ldr r2, [r4]
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r2, r2, r6
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
_08193A72:
	ldr r0, _08193A9C
	ldr r0, [r0]
	ldr r1, _08193AA4
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #3
	bgt _08193A8E
_08193A80:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl DecideRoundWinners
	adds r4, #1
	cmp r4, #3
	ble _08193A80
_08193A8E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08193A98: .4byte 0x000003FF
_08193A9C: .4byte 0x03005AF0
_08193AA0: .4byte 0x00000D25
_08193AA4: .4byte 0x00000CB2
_08193AA8: .4byte 0x03005A70
_08193AAC: .4byte 0x02023FDE
	thumb_func_end ResolveDomeRoundWinners

	thumb_func_start GetWinningMove
GetWinningMove: @ 0x08193AB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x84
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	str r0, [sp, #0x54]
	movs r1, #0
	str r1, [sp, #0x58]
	bl SetFacilityPtrsGetLevel
	movs r2, #0
	str r2, [sp, #0x50]
	add r3, sp, #0x30
	mov sl, r3
	ldr r5, [sp, #0x4c]
	lsls r5, r5, #1
	str r5, [sp, #0x70]
	subs r4, #1
	str r4, [sp, #0x78]
_08193AE2:
	movs r0, #0
	mov sb, r0
	ldr r1, [sp, #0x50]
	lsls r1, r1, #2
	str r1, [sp, #0x74]
	ldr r2, [sp, #0x48]
	lsls r2, r2, #2
	str r2, [sp, #0x6c]
	ldr r3, [sp, #0x50]
	adds r3, #1
	str r3, [sp, #0x60]
_08193AF8:
	ldr r4, [sp, #0x74]
	add r4, sb
	lsls r0, r4, #2
	mov r5, sp
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	ldr r0, _08193B34
	ldr r3, [r0]
	ldr r1, [sp, #0x6c]
	adds r0, r3, r1
	ldr r2, _08193B38
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	ldr r1, _08193B3C
	cmp r0, r1
	bne _08193B40
	ldr r3, [sp, #0x50]
	lsls r0, r3, #0x18
	mov r5, sb
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r0, #0x18
	bl GetFrontierBrainMonMove
	lsls r1, r4, #1
	add r1, sl
	strh r0, [r1]
	b _08193B6C
	.align 2, 0
_08193B34: .4byte 0x03005AF0
_08193B38: .4byte 0x00000D24
_08193B3C: .4byte 0xFF800000
_08193B40:
	lsls r2, r4, #1
	add r2, sl
	ldr r1, [sp, #0x48]
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r4, [sp, #0x50]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r5, _08193B8C
	adds r1, r3, r5
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _08193B90
	ldr r1, [r1]
	lsls r0, r0, #4
	adds r0, r0, r1
	mov r3, sb
	lsls r1, r3, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_08193B6C:
	ldr r0, _08193B94
	ldr r1, [sp, #0x74]
	add r1, sb
	lsls r1, r1, #1
	add r1, sl
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r6, [r1, #1]
	cmp r6, #0
	bne _08193B98
	movs r6, #0x28
	b _08193BB0
	.align 2, 0
_08193B8C: .4byte 0x00000D64
_08193B90: .4byte 0x0203B958
_08193B94: .4byte 0x082ED220
_08193B98:
	cmp r6, #1
	bne _08193BA0
	movs r6, #0x3c
	b _08193BB0
_08193BA0:
	adds r1, r2, #0
	cmp r1, #0x78
	beq _08193BAA
	cmp r1, #0x99
	bne _08193BB0
_08193BAA:
	lsrs r0, r6, #0x1f
	adds r0, r6, r0
	asrs r6, r0, #1
_08193BB0:
	movs r1, #0
	mov r4, sb
	adds r4, #1
	str r4, [sp, #0x64]
	ldr r5, [sp, #0x70]
	ldr r2, [sp, #0x4c]
	adds r0, r5, r2
	lsls r0, r0, #1
	str r0, [sp, #0x5c]
_08193BC2:
	lsls r7, r1, #1
	adds r1, #1
	str r1, [sp, #0x68]
	ldr r3, [sp, #0x5c]
	adds r3, r3, r7
	mov r8, r3
_08193BCE:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	lsls r0, r0, #0x10
	orrs r5, r0
	ldr r2, _08193C38
	ldr r0, [r2]
	ldr r4, _08193C3C
	adds r0, r0, r4
	add r0, r8
	ldrh r4, [r0]
	ldr r3, _08193C40
	ldr r0, [r3]
	lsls r4, r4, #4
	adds r4, r4, r0
	adds r0, r5, #0
	str r2, [sp, #0x7c]
	str r3, [sp, #0x80]
	bl GetNatureFromPersonality
	ldrb r1, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x7c]
	ldr r3, [sp, #0x80]
	cmp r1, r0
	bne _08193BCE
	ldr r0, [r2]
	ldr r2, [sp, #0x5c]
	adds r1, r7, r2
	ldr r4, _08193C3C
	adds r0, r0, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, [r3]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r5, r0
	cmp r5, #0
	beq _08193C48
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _08193C44
	adds r0, r0, r5
	ldrb r2, [r0, #0x17]
	b _08193C54
	.align 2, 0
_08193C38: .4byte 0x03005AF0
_08193C3C: .4byte 0x00000D64
_08193C40: .4byte 0x0203B958
_08193C44: .4byte 0x082F0D54
_08193C48:
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _08193C78
	adds r0, r0, r2
	ldrb r2, [r0, #0x16]
_08193C54:
	ldr r4, [sp, #0x74]
	add r4, sb
	lsls r0, r4, #1
	add r0, sl
	ldrh r0, [r0]
	bl AI_TypeCalc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #6
	ands r0, r5
	cmp r0, #6
	bne _08193C7C
	lsls r0, r4, #2
	mov r3, sp
	adds r1, r3, r0
	b _08193CB8
	.align 2, 0
_08193C78: .4byte 0x082F0D54
_08193C7C:
	movs r0, #0x29
	ands r0, r5
	cmp r0, #0
	bne _08193CBE
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _08193C96
	lsls r0, r4, #2
	mov r5, sp
	adds r2, r5, r0
	lsls r1, r6, #1
	b _08193CAA
_08193C96:
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	beq _08193CB2
	lsls r0, r4, #2
	mov r1, sp
	adds r2, r1, r0
	lsrs r1, r6, #0x1f
	adds r1, r6, r1
	asrs r1, r1, #1
_08193CAA:
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	b _08193CBE
_08193CB2:
	lsls r0, r4, #2
	mov r2, sp
	adds r1, r2, r0
_08193CB8:
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
_08193CBE:
	ldr r1, [sp, #0x68]
	cmp r1, #2
	bgt _08193CC6
	b _08193BC2
_08193CC6:
	ldr r2, [sp, #0x74]
	add r2, sb
	lsls r0, r2, #2
	add r0, sp
	ldr r1, [r0]
	ldr r3, [sp, #0x54]
	cmp r3, r1
	bge _08193CE4
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x58]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x54]
	b _08193D02
_08193CE4:
	ldr r4, [sp, #0x54]
	cmp r4, r1
	bne _08193D02
	ldr r5, [sp, #0x58]
	lsls r0, r5, #1
	add r0, sl
	lsls r1, r2, #1
	add r1, sl
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bhs _08193D02
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x58]
_08193D02:
	ldr r0, [sp, #0x64]
	mov sb, r0
	cmp r0, #3
	bgt _08193D0C
	b _08193AF8
_08193D0C:
	ldr r1, [sp, #0x60]
	str r1, [sp, #0x50]
	cmp r1, #2
	bgt _08193D16
	b _08193AE2
_08193D16:
	ldr r2, [sp, #0x58]
	mov sb, r2
	b _08193D62
_08193D1C:
	movs r3, #0
	mov sb, r3
	movs r1, #0
	mov r4, sl
	mov r3, sl
	mov r2, sp
_08193D28:
	ldr r0, [r2]
	ldr r5, [sp, #0x54]
	cmp r5, r0
	bge _08193D3A
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x54]
	b _08193D50
_08193D3A:
	ldr r5, [sp, #0x54]
	cmp r5, r0
	bne _08193D50
	mov r5, sb
	lsls r0, r5, #1
	adds r0, r4, r0
	ldrh r0, [r0]
	ldrh r5, [r3]
	cmp r0, r5
	bhs _08193D50
	mov sb, r1
_08193D50:
	adds r3, #2
	adds r2, #4
	adds r1, #1
	cmp r1, #0xb
	ble _08193D28
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x78]
	cmp r0, r1
	beq _08193DD4
_08193D62:
	movs r2, #0
	str r2, [sp, #0x50]
	mov r3, sb
	lsls r7, r3, #2
	ldr r4, [sp, #0x78]
	cmp r2, r4
	bge _08193DAA
	lsls r0, r3, #1
	mov r5, sl
	adds r6, r5, r0
	ldr r0, [sp, #0x48]
	lsls r5, r0, #0x18
_08193D7A:
	ldr r0, _08193DFC
	ldr r4, [r0]
	ldr r2, [sp, #0x50]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r5, #0x18
	bl sub_08194FE8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	movs r3, #0xec
	lsls r3, r3, #4
	adds r4, r4, r3
	adds r4, r4, r0
	ldrh r0, [r4]
	ldrh r4, [r6]
	cmp r0, r4
	beq _08193DAA
	ldr r0, [sp, #0x50]
	adds r0, #1
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x78]
	cmp r0, r1
	blt _08193D7A
_08193DAA:
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x78]
	cmp r2, r3
	beq _08193DD4
	mov r4, sp
	adds r1, r4, r7
	movs r0, #0
	str r0, [r1]
	movs r5, #0
	str r5, [sp, #0x54]
	mov sb, r5
	mov r2, sp
	movs r1, #0xb
_08193DC4:
	ldm r2!, {r0}
	add sb, r0
	subs r1, #1
	cmp r1, #0
	bge _08193DC4
	mov r0, sb
	cmp r0, #0
	bne _08193D1C
_08193DD4:
	mov r1, sb
	lsls r0, r1, #2
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0
	bne _08193DE4
	ldr r2, [sp, #0x58]
	mov sb, r2
_08193DE4:
	mov r3, sb
	lsls r0, r3, #1
	add r0, sl
	ldrh r0, [r0]
	add sp, #0x84
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08193DFC: .4byte 0x03005AF0
	thumb_func_end GetWinningMove

	thumb_func_start Task_ShowTourneyTree
Task_ShowTourneyTree: @ 0x08193E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _08193E3C
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	mov sl, r1
	movs r3, #0xc
	ldrsh r4, [r0, r3]
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #5
	bls _08193E30
	b _08194466
_08193E30:
	lsls r0, r0, #2
	ldr r1, _08193E40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08193E3C: .4byte 0x03005B60
_08193E40: .4byte 0x08193E44
_08193E44: @ jump table
	.4byte _08193E5C @ case 0
	.4byte _08193EFC @ case 1
	.4byte _08193F6C @ case 2
	.4byte _0819405C @ case 3
	.4byte _081940B0 @ case 4
	.4byte _0819436C @ case 5
_08193E5C:
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #3
	bl EnableInterrupts
	movs r4, #0
	str r4, [sp, #0x14]
	add r0, sp, #0x14
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _08193EDC
	bl CpuSet
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08193EE0
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r0, _08193EE4
	bl InitWindows
	bl DeactivateAllTextPrinters
	ldr r0, _08193EE8
	strh r4, [r0]
	ldr r0, _08193EEC
	strh r4, [r0]
	ldr r0, _08193EF0
	strh r4, [r0]
	ldr r0, _08193EF4
	strh r4, [r0]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r1, #0xb0
	lsls r1, r1, #4
	movs r0, #3
	movs r2, #0
	bl ChangeBgY
	ldr r1, _08193EF8
	mov r2, r8
	lsls r0, r2, #2
	b _0819401C
	.align 2, 0
_08193EDC: .4byte 0x05006000
_08193EE0: .4byte 0x085D5918
_08193EE4: .4byte 0x085D5938
_08193EE8: .4byte 0x02022AC8
_08193EEC: .4byte 0x02022ACA
_08193EF0: .4byte 0x02022ACC
_08193EF4: .4byte 0x02022ACE
_08193EF8: .4byte 0x03005B60
_08193EFC:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	ldr r1, _08193F60
	movs r0, #0x40
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0x9f
	bl SetGpuReg
	ldr r1, _08193F64
	movs r0, #0x42
	bl SetGpuReg
	movs r0, #0x46
	movs r1, #0x9f
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x3f
	bl SetGpuReg
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08193F68
	mov r3, r8
	lsls r0, r3, #2
	b _0819401C
	.align 2, 0
_08193F60: .4byte 0x00005860
_08193F64: .4byte 0x00009098
_08193F68: .4byte 0x03005B60
_08193F6C:
	ldr r4, _0819402C
	movs r0, #0x80
	lsls r0, r0, #4
	bl AllocZeroed
	adds r1, r0, #0
	str r1, [r4]
	ldr r0, _08194030
	bl LZDecompressVram
	ldr r1, [r4]
	movs r0, #1
	bl SetBgTilemapBuffer
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	ldr r1, _08194034
	movs r5, #0x80
	lsls r5, r5, #6
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	adds r2, r5, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _08194038
	str r6, [sp]
	movs r0, #2
	adds r2, r5, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _0819403C
	movs r4, #1
	str r4, [sp]
	movs r0, #2
	adds r2, r5, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _08194040
	str r4, [sp]
	movs r0, #3
	adds r2, r5, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, _08194044
	movs r4, #0x80
	lsls r4, r4, #2
	movs r1, #0
	adds r2, r4, #0
	bl LoadCompressedPalette
	ldr r0, _08194048
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r4, #0
	bl LoadCompressedPalette
	ldr r0, _0819404C
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadCompressedPalette
	str r6, [sp, #0x18]
	add r0, sp, #0x18
	ldr r1, _08194050
	ldr r2, _08194054
	bl CpuSet
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	ldr r1, _08194058
	mov r4, r8
	lsls r0, r4, #2
_0819401C:
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _08194466
	.align 2, 0
_0819402C: .4byte 0x0203CA48
_08194030: .4byte 0x08D839A4
_08194034: .4byte 0x08D82FB4
_08194038: .4byte 0x08D835A0
_0819403C: .4byte 0x08D83BD0
_08194040: .4byte 0x08D83CE0
_08194044: .4byte 0x08D8533C
_08194048: .4byte 0x08D85428
_0819404C: .4byte 0x08D855E4
_08194050: .4byte 0x020377B4
_08194054: .4byte 0x05000100
_08194058: .4byte 0x03005B60
_0819405C:
	ldr r0, _0819409C
	bl LoadCompressedSpriteSheet
	mov r0, r8
	lsls r0, r0, #2
	str r0, [sp, #0x1c]
	mov r1, sl
	cmp r1, #0
	bne _08194092
	movs r5, #0
	ldr r4, _081940A0
_08194072:
	ldrb r1, [r4]
	ldrb r2, [r4, #1]
	ldr r0, _081940A4
	movs r3, #0
	bl CreateSprite
	adds r4, #2
	adds r5, #1
	cmp r5, #0x1e
	bls _08194072
	ldr r0, _081940A8
	movs r1, #0xda
	movs r2, #0xc
	movs r3, #0
	bl CreateSprite
_08194092:
	ldr r1, _081940AC
	movs r0, #0
	bl SetGpuReg
	b _0819434A
	.align 2, 0
_0819409C: .4byte 0x085D59FC
_081940A0: .4byte 0x085D5E8D
_081940A4: .4byte 0x085D5A54
_081940A8: .4byte 0x085D5A84
_081940AC: .4byte 0x00007F40
_081940B0:
	add r0, sp, #4
	movs r2, #0
	movs r1, #2
	strb r1, [r0, #5]
	ldr r0, _0819414C
	str r0, [sp, #4]
	add r0, sp, #4
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #7]
	strb r1, [r0, #0xa]
	strb r2, [r0, #0xb]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	adds r3, r0, #0
	ldrb r2, [r3, #0xc]
	subs r1, #0x12
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r2, r3, #0
	movs r0, #0xe0
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	ands r1, r0
	strb r1, [r2, #0xd]
	adds r1, r2, #0
	movs r0, #0xd0
	strb r0, [r1, #0xd]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	mov r2, r8
	lsls r2, r2, #2
	str r2, [sp, #0x1c]
	add r4, sp, #4
	movs r3, #0xf
	mov sb, r3
	movs r0, #0
	str r0, [sp, #0x20]
	movs r1, #0
	str r1, [sp, #0x24]
	movs r7, #0
	movs r5, #0xf
_0819410C:
	ldr r2, _08194150
	ldr r0, [r2]
	adds r0, r0, r7
	ldr r3, _08194154
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldr r0, _08194158
	bl CopyDomeTrainerName
	mov r0, sl
	cmp r0, #1
	bne _08194164
	ldr r1, _08194150
	ldr r2, [r1]
	adds r0, r2, r7
	ldr r3, _0819415C
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #0x1d
	cmp r0, #0
	blt _0819417C
	ldr r3, _08194160
	adds r0, r2, r3
	ldrh r1, [r0]
	cmp r1, #1
	beq _081941D4
	ldr r2, [sp, #0x24]
	lsrs r0, r2, #0x18
	subs r1, #2
	b _0819418A
	.align 2, 0
_0819414C: .4byte 0x085ABD18
_08194150: .4byte 0x03005AF0
_08194154: .4byte 0x00000D24
_08194158: .4byte 0x02022AE0
_0819415C: .4byte 0x00000D25
_08194160: .4byte 0x00000CB2
_08194164:
	mov r3, sl
	cmp r3, #0
	bne _081941D4
	ldr r0, _08194194
	ldr r2, [r0]
	adds r0, r2, r7
	ldr r1, _08194198
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #0x1d
	cmp r0, #0
	bge _0819419C
_0819417C:
	lsls r1, r1, #0x1b
	lsrs r0, r1, #0x1e
	cmp r0, #0
	beq _081941D4
	subs r1, r0, #1
	ldr r2, [sp, #0x24]
	lsrs r0, r2, #0x18
_0819418A:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_08194490
	b _081941D4
	.align 2, 0
_08194194: .4byte 0x03005AF0
_08194198: .4byte 0x00000D25
_0819419C:
	ldr r3, _081941BC
	adds r1, r2, r3
	ldrh r0, [r1]
	cmp r0, #0
	beq _081941D4
	ldr r0, [sp, #0x1c]
	add r0, r8
	lsls r0, r0, #3
	ldr r2, _081941C0
	adds r0, r0, r2
	movs r3, #0x10
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _081941C4
	ldrh r1, [r1]
	b _081941C8
	.align 2, 0
_081941BC: .4byte 0x00000CB2
_081941C0: .4byte 0x03005B60
_081941C4:
	ldrh r0, [r1]
	subs r1, r0, #1
_081941C8:
	ldr r2, [sp, #0x24]
	lsrs r0, r2, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_08194490
_081941D4:
	ldr r0, [sp, #0x1c]
	add r0, r8
	lsls r0, r0, #3
	ldr r3, _081941F4
	adds r0, r0, r3
	movs r1, #0x10
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08194200
	ldr r2, _081941F8
	ldr r0, [r2]
	ldr r3, _081941FC
	adds r0, r0, r3
	ldrh r3, [r0]
	adds r6, r2, #0
	b _0819420E
	.align 2, 0
_081941F4: .4byte 0x03005B60
_081941F8: .4byte 0x03005AF0
_081941FC: .4byte 0x00000CB2
_08194200:
	ldr r1, _0819427C
	ldr r0, [r1]
	ldr r2, _08194280
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r3, r0, #1
	adds r6, r1, #0
_0819420E:
	mov r0, sl
	cmp r0, #1
	bne _0819422E
	ldr r2, [r6]
	adds r0, r2, r7
	ldr r1, _08194284
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1e
	ldr r0, _08194280
	adds r2, r2, r0
	ldrh r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08194246
_0819422E:
	mov r1, sl
	cmp r1, #0
	bne _0819429A
	ldr r0, [r6]
	adds r0, r0, r7
	ldr r2, _08194284
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, r3
	bgt _0819429A
_08194246:
	ldr r0, [r6]
	adds r1, r0, r7
	ldr r3, _08194284
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _0819429A
	ldr r2, _08194288
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	ldr r3, _0819428C
	cmp r0, r3
	bne _08194290
	ldrb r1, [r4, #0xc]
	mov r0, sb
	ands r0, r1
	movs r1, #0x30
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0xd]
	mov r0, sb
	ands r0, r1
	movs r1, #0x40
	b _081942E0
	.align 2, 0
_0819427C: .4byte 0x03005AF0
_08194280: .4byte 0x00000CB2
_08194284: .4byte 0x00000D25
_08194288: .4byte 0x00000D24
_0819428C: .4byte 0x000003FF
_08194290:
	ldrb r1, [r4, #0xc]
	mov r0, sb
	ands r0, r1
	movs r1, #0xb0
	b _081942D4
_0819429A:
	ldr r0, [r6]
	adds r0, r0, r7
	ldr r1, _081942C4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	ldr r2, _081942C8
	cmp r0, r2
	bne _081942CC
	ldrb r1, [r4, #0xc]
	mov r0, sb
	ands r0, r1
	movs r1, #0x30
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0xd]
	mov r0, sb
	ands r0, r1
	movs r1, #0x40
	b _081942E0
	.align 2, 0
_081942C4: .4byte 0x00000D24
_081942C8: .4byte 0x000003FF
_081942CC:
	ldrb r1, [r4, #0xc]
	mov r0, sb
	ands r0, r1
	movs r1, #0xe0
_081942D4:
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0xd]
	mov r0, sb
	ands r0, r1
	movs r1, #0xd0
_081942E0:
	orrs r0, r1
	strb r0, [r4, #0xd]
	ldr r0, _08194304
	ldr r3, [sp, #0x20]
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0819430C
	ldrb r0, [r4, #5]
	ldrb r2, [r4, #0xa]
	ldr r1, _08194308
	bl GetStringWidth
	ldrb r1, [r4, #0xa]
	adds r1, r0, r1
	movs r0, #0x40
	subs r0, r0, r1
	b _0819430E
	.align 2, 0
_08194304: .4byte 0x085D5E6D
_08194308: .4byte 0x02022AE0
_0819430C:
	movs r0, #4
_0819430E:
	strb r0, [r4, #8]
	ldr r0, _0819435C
	str r0, [sp, #4]
	ldr r0, _08194360
	ldr r1, [sp, #0x20]
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r4, #4]
	ldr r2, _08194364
	adds r0, r1, r2
	ldrb r0, [r0]
	strb r0, [r4, #9]
	add r0, sp, #4
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	ldr r3, [sp, #0x20]
	adds r3, #2
	str r3, [sp, #0x20]
	ldr r0, [sp, #0x24]
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	str r0, [sp, #0x24]
	adds r7, #4
	subs r5, #1
	cmp r5, #0
	blt _0819434A
	b _0819410C
_0819434A:
	ldr r0, _08194368
	ldr r1, [sp, #0x1c]
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _08194466
	.align 2, 0
_0819435C: .4byte 0x02022AE0
_08194360: .4byte 0x085D5E6D
_08194364: .4byte 0x085D5E6E
_08194368: .4byte 0x03005B60
_0819436C:
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #2
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #2
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _081943D8
	bl SetHBlankCallback
	ldr r0, _081943DC
	bl SetVBlankCallback
	cmp r4, #2
	bne _08194400
	mov r2, sl
	cmp r2, #0
	bne _081943E8
	ldr r0, _081943E0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _081943E4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r2
	mov r3, sl
	strh r3, [r1, #8]
	strh r3, [r1, #0xa]
	mov r4, r8
	lsls r0, r4, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x10]
	strh r0, [r1, #0x14]
	b _0819441C
	.align 2, 0
_081943D8: .4byte 0x081947ED
_081943DC: .4byte 0x081948E5
_081943E0: .4byte 0x0819353D
_081943E4: .4byte 0x03005B60
_081943E8:
	ldr r0, _081943F8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _081943FC
	b _08194410
	.align 2, 0
_081943F8: .4byte 0x081944F5
_081943FC: .4byte 0x03005B60
_08194400:
	ldr r1, _08194478
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r5, [r0, r3]
_08194410:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
_0819441C:
	bl ScanlineEffect_Clear
	ldr r0, _0819447C
	ldr r2, _08194480
	movs r4, #0xf0
	lsls r4, r4, #3
	adds r1, r0, r4
	movs r5, #0x5a
_0819442C:
	strh r2, [r0]
	strh r2, [r1]
	adds r1, #2
	adds r0, #2
	subs r5, #1
	cmp r5, #0
	bge _0819442C
	movs r5, #0x5b
	ldr r3, _08194484
	ldr r0, _0819447C
	ldr r2, _08194488
	ldr r4, _0819448C
	adds r1, r0, r4
	adds r0, #0xb6
_08194448:
	strh r2, [r0]
	strh r2, [r1]
	adds r1, #2
	adds r0, #2
	adds r5, #1
	cmp r5, #0x9f
	ble _08194448
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r3, #8]
	bl ScanlineEffect_SetParams
	mov r0, r8
	bl DestroyTask
_08194466:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08194478: .4byte 0x03005B60
_0819447C: .4byte 0x020388C8
_08194480: .4byte 0x00001F0A
_08194484: .4byte 0x085D59F0
_08194488: .4byte 0x00001F09
_0819448C: .4byte 0x00000836
	thumb_func_end Task_ShowTourneyTree

	thumb_func_start sub_08194490
sub_08194490: @ 0x08194490
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r4, _081944EC
	lsls r2, r1, #2
	lsls r3, r0, #4
	adds r2, r2, r3
	adds r2, r2, r4
	ldr r3, [r2]
	ldr r2, _081944F0
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _081944DC
	movs r7, #1
	adds r4, r3, #0
	adds r5, r4, #2
	adds r6, r0, #0
_081944BE:
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	str r7, [sp]
	str r7, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r5, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	adds r4, #4
	adds r5, #4
	subs r6, #1
	cmp r6, #0
	bne _081944BE
_081944DC:
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081944EC: .4byte 0x085D678C
_081944F0: .4byte 0x085D688C
	thumb_func_end sub_08194490

	thumb_func_start sub_081944F4
sub_081944F4: @ 0x081944F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08194524
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #4
	bls _0819451A
	b _0819473C
_0819451A:
	lsls r0, r0, #2
	ldr r1, _08194528
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08194524: .4byte 0x03005B60
_08194528: .4byte 0x0819452C
_0819452C: @ jump table
	.4byte _08194540 @ case 0
	.4byte _08194564 @ case 1
	.4byte _081946D4 @ case 2
	.4byte _081946EE @ case 3
	.4byte _08194724 @ case 4
_08194540:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, _08194560
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #8]
	b _0819473C
	.align 2, 0
_08194560: .4byte 0x03005B60
_08194564:
	ldr r0, _0819460C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08194572
	b _0819473C
_08194572:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #0
	movs r3, #2
	movs r1, #2
	strh r1, [r0, #8]
	movs r1, #0x40
	strh r1, [r0, #0xe]
	add r0, sp, #4
	strb r3, [r0, #5]
	strb r2, [r0, #6]
	strb r2, [r0, #7]
	strb r3, [r0, #0xa]
	strb r2, [r0, #0xb]
	adds r3, r0, #0
	ldrb r2, [r3, #0xc]
	subs r1, #0x50
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r2, r3, #0
	movs r0, #0xb0
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	ands r1, r0
	strb r1, [r2, #0xd]
	adds r1, r2, #0
	movs r0, #0xd0
	strb r0, [r1, #0xd]
	movs r7, #0
	adds r6, r1, #0
	ldr r0, _08194610
	mov r8, r0
_081945B8:
	ldr r1, _08194614
	ldr r0, [r1]
	lsls r4, r7, #2
	adds r0, r0, r4
	ldr r2, _08194618
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldr r0, _0819461C
	bl CopyDomeTrainerName
	ldr r0, _08194614
	ldr r1, [r0]
	adds r0, r1, r4
	ldr r2, _08194620
	adds r0, r0, r2
	ldrb r3, [r0]
	lsls r2, r3, #0x1b
	lsrs r2, r2, #0x1e
	ldr r0, _08194624
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #1
	mov sb, r4
	adds r1, r7, #1
	mov sl, r1
	cmp r2, r0
	bne _0819468A
	lsls r0, r3, #0x1d
	cmp r0, #0
	bge _0819468A
	lsls r0, r7, #1
	ldr r2, _08194628
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	bne _08194660
	movs r4, #0
	b _08194636
	.align 2, 0
_0819460C: .4byte 0x02037C74
_08194610: .4byte 0x02021C40
_08194614: .4byte 0x03005AF0
_08194618: .4byte 0x00000D24
_0819461C: .4byte 0x02022AE0
_08194620: .4byte 0x00000D25
_08194624: .4byte 0x00000CB2
_08194628: .4byte 0x085D5E6D
_0819462C:
	mov r0, r8
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	adds r4, #1
_08194636:
	ldr r0, _0819465C
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	subs r1, r1, r0
	cmp r4, r1
	blt _0819462C
	mov r1, r8
	adds r0, r4, r1
	movs r1, #0xff
	strb r1, [r0]
	mov r0, r8
	ldr r1, _0819465C
	bl StringAppend
	movs r0, #2
	b _0819466A
	.align 2, 0
_0819465C: .4byte 0x02022AE0
_08194660:
	ldr r0, _081946BC
	ldr r1, _081946C0
	bl StringCopy
	movs r0, #4
_0819466A:
	strb r0, [r6, #8]
	mov r2, r8
	str r2, [sp, #4]
	ldr r1, _081946C4
	adds r0, r5, r1
	ldrb r0, [r0]
	strb r0, [r6, #4]
	ldr r2, _081946C8
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r6, #9]
	add r0, sp, #4
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
_0819468A:
	ldr r0, _081946CC
	ldr r1, [r0]
	mov r2, sb
	adds r0, r1, r2
	ldr r2, _081946D0
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _081946B2
	subs r2, #0x73
	adds r0, r1, r2
	ldrh r0, [r0]
	subs r4, r0, #1
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl sub_08194490
_081946B2:
	mov r7, sl
	cmp r7, #0xf
	bgt _081946BA
	b _081945B8
_081946BA:
	b _0819473C
	.align 2, 0
_081946BC: .4byte 0x02021C40
_081946C0: .4byte 0x02022AE0
_081946C4: .4byte 0x085D5E6D
_081946C8: .4byte 0x085D5E6E
_081946CC: .4byte 0x03005AF0
_081946D0: .4byte 0x00000D25
_081946D4:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r0, [r1, #0xe]
	subs r0, #1
	strh r0, [r1, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0819473C
	movs r0, #3
	strh r0, [r1, #8]
	b _0819473C
_081946EE:
	ldr r0, _0819471C
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0819473C
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _08194720
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	strh r1, [r0, #8]
	b _0819473C
	.align 2, 0
_0819471C: .4byte 0x03002360
_08194720: .4byte 0x03005B60
_08194724:
	ldr r0, _0819474C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0819473C
	ldr r0, _08194750
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_0819473C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819474C: .4byte 0x02037C74
_08194750: .4byte 0x08085B35
	thumb_func_end sub_081944F4

	thumb_func_start CB2_BattleDome
CB2_BattleDome: @ 0x08194754
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_BattleDome

	thumb_func_start VblankCb0_BattleDome
VblankCb0_BattleDome: @ 0x08194770
	push {lr}
	movs r0, #3
	movs r1, #0x80
	movs r2, #1
	bl ChangeBgX
	movs r0, #3
	movs r1, #0x80
	movs r2, #2
	bl ChangeBgY
	ldr r0, _081947D4
	ldrh r1, [r0]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, _081947D8
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r0, _081947DC
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, _081947E0
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, _081947E4
	ldrh r1, [r0]
	movs r0, #0x18
	bl SetGpuReg
	ldr r0, _081947E8
	ldrh r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_081947D4: .4byte 0x02022AC8
_081947D8: .4byte 0x02022ACA
_081947DC: .4byte 0x02022ACC
_081947E0: .4byte 0x02022ACE
_081947E4: .4byte 0x02022AD0
_081947E8: .4byte 0x02022AD2
	thumb_func_end VblankCb0_BattleDome

	thumb_func_start HblankCb_BattleDome
HblankCb_BattleDome: @ 0x081947EC
	push {lr}
	ldr r0, _0819480C
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r0, #0x29
	bls _081948C8
	cmp r0, #0x31
	bhi _0819481C
	ldr r1, _08194810
	ldr r2, _08194814
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #8
	ldr r0, _08194818
	b _081948D4
	.align 2, 0
_0819480C: .4byte 0x04000006
_08194810: .4byte 0x04000048
_08194814: .4byte 0x00003B3B
_08194818: .4byte 0x989B5558
_0819481C:
	cmp r0, #0x39
	bls _081948C8
	cmp r0, #0x4a
	bhi _08194840
	ldr r1, _08194834
	ldr r2, _08194838
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #8
	ldr r0, _0819483C
	b _081948D4
	.align 2, 0
_08194834: .4byte 0x04000048
_08194838: .4byte 0x00003B3B
_0819483C: .4byte 0x90985860
_08194840:
	cmp r0, #0x51
	bhi _08194860
	ldr r1, _08194854
	ldr r2, _08194858
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #8
	ldr r0, _0819485C
	b _081948D4
	.align 2, 0
_08194854: .4byte 0x04000048
_08194858: .4byte 0x00003B3B
_0819485C: .4byte 0x989B5558
_08194860:
	cmp r0, #0x5e
	bls _081948C8
	cmp r0, #0x66
	bhi _08194884
	ldr r1, _08194878
	ldr r2, _0819487C
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #8
	ldr r0, _08194880
	b _081948D4
	.align 2, 0
_08194878: .4byte 0x04000048
_0819487C: .4byte 0x00003737
_08194880: .4byte 0x989B5558
_08194884:
	cmp r0, #0x76
	bhi _081948A4
	ldr r1, _08194898
	ldr r2, _0819489C
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #8
	ldr r0, _081948A0
	b _081948D4
	.align 2, 0
_08194898: .4byte 0x04000048
_0819489C: .4byte 0x00003737
_081948A0: .4byte 0x90985860
_081948A4:
	cmp r0, #0x7e
	bls _081948C8
	cmp r1, #0x86
	bhi _081948C8
	ldr r1, _081948BC
	ldr r2, _081948C0
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #8
	ldr r0, _081948C4
	b _081948D4
	.align 2, 0
_081948BC: .4byte 0x04000048
_081948C0: .4byte 0x00003737
_081948C4: .4byte 0x989B5558
_081948C8:
	ldr r1, _081948DC
	ldr r2, _081948E0
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #8
	movs r0, #0
_081948D4:
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081948DC: .4byte 0x04000048
_081948E0: .4byte 0x00003F3F
	thumb_func_end HblankCb_BattleDome

	thumb_func_start VblankCb1_BattleDome
VblankCb1_BattleDome: @ 0x081948E4
	push {lr}
	ldr r0, _08194938
	ldrh r1, [r0]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, _0819493C
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r0, _08194940
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, _08194944
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	movs r0, #2
	movs r1, #0x80
	movs r2, #2
	bl ChangeBgY
	movs r0, #3
	movs r1, #0x80
	movs r2, #1
	bl ChangeBgY
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08194938: .4byte 0x02022AC8
_0819493C: .4byte 0x02022ACA
_08194940: .4byte 0x02022ACC
_08194944: .4byte 0x02022ACE
	thumb_func_end VblankCb1_BattleDome

	thumb_func_start InitDomeFacilityTrainersAndMons
InitDomeFacilityTrainersAndMons: @ 0x08194948
	ldr r1, _08194958
	ldr r0, _0819495C
	str r0, [r1]
	ldr r1, _08194960
	ldr r0, _08194964
	str r0, [r1]
	bx lr
	.align 2, 0
_08194958: .4byte 0x0203B958
_0819495C: .4byte 0x085B8700
_08194960: .4byte 0x0203B954
_08194964: .4byte 0x085B4A10
	thumb_func_end InitDomeFacilityTrainersAndMons

	thumb_func_start RestoreDomePlayerParty
RestoreDomePlayerParty: @ 0x08194968
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r3, #0
_08194976:
	ldr r0, _081949B0
	ldr r1, [r0]
	ldr r0, _081949B4
	adds r0, r3, r0
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #1
	ldr r2, _081949B8
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #1
	mov sl, r0
	movs r6, #0
	adds r0, r3, #1
	str r0, [sp]
	movs r1, #0x64
	mov r0, sl
	muls r0, r1, r0
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r2, r2, r0
	mov sb, r2
	adds r7, r3, #0
	muls r7, r1, r7
_081949A8:
	movs r5, #0
	adds r0, r6, #1
	mov r8, r0
	b _081949BE
	.align 2, 0
_081949B0: .4byte 0x03005AF0
_081949B4: .4byte 0x0203CBC4
_081949B8: .4byte 0x00000CAA
_081949BC:
	adds r5, #1
_081949BE:
	cmp r5, #3
	bgt _081949EA
	ldr r1, _08194A3C
	ldr r0, [r1]
	add r0, sb
	adds r1, r5, #0
	adds r1, #0xd
	movs r2, #0
	str r3, [sp, #4]
	bl GetMonData
	adds r4, r0, #0
	adds r1, r6, #0
	adds r1, #0xd
	ldr r2, _08194A40
	adds r0, r7, r2
	movs r2, #0
	bl GetMonData
	ldr r3, [sp, #4]
	cmp r4, r0
	bne _081949BC
_081949EA:
	cmp r5, #4
	bne _08194A00
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _08194A40
	adds r0, r7, r1
	movs r1, #0xa6
	str r3, [sp, #4]
	bl SetMonMoveSlot
	ldr r3, [sp, #4]
_08194A00:
	mov r6, r8
	cmp r6, #3
	ble _081949A8
	ldr r2, _08194A3C
	ldr r0, [r2]
	movs r2, #0x64
	mov r1, sl
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r1, r3, #0
	muls r1, r2, r1
	ldr r2, _08194A40
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
	ldr r3, [sp]
	cmp r3, #1
	ble _08194976
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08194A3C: .4byte 0x03005AEC
_08194A40: .4byte 0x02024190
	thumb_func_end RestoreDomePlayerParty

	thumb_func_start RestoreDomePlayerPartyHeldItems
RestoreDomePlayerPartyHeldItems: @ 0x08194A44
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r4, #0
	ldr r7, _08194AA0
	movs r6, #0x64
	movs r5, #0
_08194A50:
	ldr r0, _08194AA4
	ldr r1, [r0]
	ldr r0, _08194AA8
	adds r0, r4, r0
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #1
	ldr r2, _08194AAC
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #1
	adds r1, r0, #0
	muls r1, r6, r1
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, [r7]
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _08194AB0
	adds r0, r5, r0
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	adds r5, #0x64
	adds r4, #1
	cmp r4, #1
	ble _08194A50
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08194AA0: .4byte 0x03005AEC
_08194AA4: .4byte 0x03005AF0
_08194AA8: .4byte 0x0203CBC4
_08194AAC: .4byte 0x00000CAA
_08194AB0: .4byte 0x02024190
	thumb_func_end RestoreDomePlayerPartyHeldItems

	thumb_func_start GetDomeBrainTrainerPicId
GetDomeBrainTrainerPicId: @ 0x08194AB4
	push {lr}
	bl ReducePlayerPartyToSelectedMons
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetDomeBrainTrainerPicId

	thumb_func_start GetPlayerSeededBeforeOpponent
GetPlayerSeededBeforeOpponent: @ 0x08194AC0
	push {r4, lr}
	ldr r0, _08194ADC
	ldrh r0, [r0]
	bl TrainerIdToDomeTournamentId
	adds r4, r0, #0
	ldr r0, _08194AE0
	bl TrainerIdToDomeTournamentId
	cmp r4, r0
	ble _08194AE8
	ldr r1, _08194AE4
	movs r0, #1
	b _08194AEC
	.align 2, 0
_08194ADC: .4byte 0x0203886A
_08194AE0: .4byte 0x000003FF
_08194AE4: .4byte 0x02037290
_08194AE8:
	ldr r1, _08194AF4
	movs r0, #2
_08194AEC:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08194AF4: .4byte 0x02037290
	thumb_func_end GetPlayerSeededBeforeOpponent

	thumb_func_start BufferLastDomeWinnerName
BufferLastDomeWinnerName: @ 0x08194AF8
	push {r4, lr}
	bl InitDomeFacilityTrainersAndMons
	movs r2, #0
	ldr r3, _08194B48
	ldr r0, [r3]
	ldr r1, _08194B4C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _08194B2A
	adds r4, r3, #0
	adds r3, r1, #0
_08194B14:
	adds r2, #1
	cmp r2, #0xf
	bgt _08194B2A
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _08194B14
_08194B2A:
	ldr r0, _08194B50
	ldr r1, _08194B48
	ldr r1, [r1]
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r2, _08194B54
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	bl CopyDomeTrainerName
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08194B48: .4byte 0x03005AF0
_08194B4C: .4byte 0x00000D25
_08194B50: .4byte 0x02021C40
_08194B54: .4byte 0x00000D24
	thumb_func_end BufferLastDomeWinnerName

	thumb_func_start sub_08194B58
sub_08194B58: @ 0x08194B58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r4, _08194BE8
	ldr r2, [r4]
	ldr r5, _08194BEC
	adds r0, r2, r5
	ldrb r1, [r0]
	ldr r6, _08194BF0
	adds r0, r2, r6
	ldrb r0, [r0]
	cmn r1, r0
	beq _08194B8C
	ldr r1, _08194BF4
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08194B8C
	b _08194F3E
_08194B8C:
	movs r0, #0x20
	bl AllocZeroed
	str r0, [sp, #0x18]
	movs r0, #0x18
	bl AllocZeroed
	str r0, [sp, #0x1c]
	ldr r1, [r4]
	ldr r2, _08194BF8
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r0, r2, #0x1e
	lsrs r0, r0, #0x1e
	str r0, [sp, #0x14]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, #1
	adds r0, r0, r5
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r0, r6
	strb r1, [r0]
	movs r3, #0
	mov sl, r3
	movs r4, #0
	str r4, [sp, #0x38]
	movs r5, #0
	str r5, [sp, #0x3c]
_08194BCC:
	mov r0, sl
	cmp r0, #4
	bgt _08194BFC
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08194C30
	.align 2, 0
_08194BE8: .4byte 0x03005AF0
_08194BEC: .4byte 0x00000D0A
_08194BF0: .4byte 0x00000D0B
_08194BF4: .4byte 0x00000CA8
_08194BF8: .4byte 0x00000CA9
_08194BFC:
	mov r1, sl
	cmp r1, #0xe
	bgt _08194C1A
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	adds r4, #0xa
	b _08194C30
_08194C1A:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	adds r4, #0x1e
_08194C30:
	movs r6, #0
	cmp r6, sl
	bge _08194C64
	ldr r2, _08194EA0
	ldr r0, [r2]
	ldr r3, _08194EA4
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r4
	beq _08194C64
	adds r3, r2, #0
	ldr r2, _08194EA4
_08194C4C:
	adds r6, #1
	cmp r6, sl
	bge _08194C64
	ldr r0, [r3]
	lsls r1, r6, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r4
	bne _08194C4C
_08194C64:
	cmp r6, sl
	bne _08194BCC
	ldr r5, _08194EA0
	ldr r3, [r5]
	ldr r0, [sp, #0x38]
	adds r3, r3, r0
	ldr r1, _08194EA4
	adds r3, r3, r1
	ldr r2, _08194EA8
	adds r0, r2, #0
	adds r2, r4, #0
	ands r2, r0
	ldrh r0, [r3]
	ldr r5, _08194EAC
	adds r1, r5, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3]
	movs r6, #0
	lsls r4, r4, #0x10
	str r4, [sp, #0x30]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x20]
_08194C92:
	adds r1, r6, #1
	str r1, [sp, #0x24]
	lsls r2, r6, #2
	str r2, [sp, #0x2c]
	lsls r3, r6, #1
	str r3, [sp, #0x28]
_08194C9E:
	ldr r4, [sp, #0x30]
	lsrs r0, r4, #0x10
	bl RandomizeFacilityTrainerMonSet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r7, #0
	cmp r7, r6
	bge _08194CF4
	ldr r0, _08194EA0
	ldr r0, [r0]
	ldr r1, _08194EB0
	mov sb, r1
	ldr r2, [sp, #8]
	mov r8, r2
	ldr r3, [sp, #0xc]
	mov ip, r3
	ldr r4, _08194EB4
	adds r0, r0, r4
	ldr r1, [sp, #0x20]
	adds r4, r1, r0
_08194CC8:
	ldrh r3, [r4]
	cmp r3, r5
	beq _08194CF4
	mov r2, sb
	ldr r1, [r2]
	lsls r0, r5, #4
	adds r2, r0, r1
	ldrh r0, [r2]
	cmp r8, r0
	beq _08194CF4
	cmp ip, r0
	beq _08194CF4
	lsls r0, r3, #4
	adds r0, r0, r1
	ldrb r0, [r0, #0xa]
	ldrb r2, [r2, #0xa]
	cmp r0, r2
	beq _08194CF4
	adds r4, #2
	adds r7, #1
	cmp r7, r6
	blt _08194CC8
_08194CF4:
	cmp r7, r6
	bne _08194C9E
	ldr r3, _08194EA0
	ldr r0, [r3]
	ldr r4, [sp, #0x28]
	ldr r2, [sp, #0x3c]
	adds r1, r4, r2
	ldr r3, _08194EB4
	adds r0, r0, r3
	adds r0, r0, r1
	strh r5, [r0]
	ldr r2, [sp, #0x2c]
	add r2, sp
	adds r2, #8
	ldr r3, _08194EB0
	ldr r1, [r3]
	lsls r0, r5, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r2]
	ldr r6, [sp, #0x24]
	cmp r6, #2
	ble _08194C92
	ldr r4, _08194EA0
	ldr r2, [r4]
	ldr r5, [sp, #0x38]
	adds r2, r2, r5
	ldr r0, _08194EB8
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r4, #5
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	strb r0, [r2]
	ldr r5, _08194EA0
	ldr r2, [r5]
	ldr r0, [sp, #0x38]
	adds r2, r2, r0
	ldr r1, _08194EB8
	adds r2, r2, r1
	ldrb r0, [r2]
	subs r4, #0x14
	adds r1, r4, #0
	ands r0, r1
	strb r0, [r2]
	ldr r1, [r5]
	ldr r5, [sp, #0x38]
	adds r1, r1, r5
	ldr r0, _08194EB8
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	strb r0, [r1]
	adds r5, #4
	str r5, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	adds r1, #6
	str r1, [sp, #0x3c]
	movs r2, #1
	add sl, r2
	mov r4, sl
	cmp r4, #0xf
	bgt _08194D78
	b _08194BCC
_08194D78:
	movs r5, #0
	mov sl, r5
	ldr r5, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x34]
_08194D82:
	movs r7, #0
	strh r7, [r5]
	ldr r1, _08194EA0
	ldr r0, [r1]
	mov r2, sl
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r3, _08194EA4
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	bl GetDomeTrainerMonIvs
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r6, #0
	ldr r4, [sp, #0x34]
	mov sb, r4
_08194DAA:
	ldr r1, _08194EA0
	ldr r0, [r1]
	mov r4, sb
	add r4, sl
	adds r4, r4, r6
	lsls r4, r4, #1
	ldr r2, _08194EB4
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r3, _08194EB0
	ldr r0, [r3]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrb r3, [r1, #0xb]
	ldrb r1, [r1, #0xc]
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	str r1, [sp, #4]
	movs r1, #0x32
	mov r2, r8
	bl CalcDomeMonStats
	ldr r2, [sp, #0x1c]
	ldr r1, [r2, #4]
	ldrh r0, [r5]
	adds r0, r0, r1
	ldr r1, [r2, #8]
	adds r0, r0, r1
	ldr r1, [r2, #0x10]
	adds r0, r0, r1
	ldr r1, [r2, #0x14]
	adds r0, r0, r1
	ldr r1, [r2, #0xc]
	adds r0, r0, r1
	ldr r1, [r2]
	adds r0, r0, r1
	strh r0, [r5]
	ldr r3, _08194EA0
	ldr r0, [r3]
	ldr r1, _08194EB4
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r2, _08194EB0
	ldr r1, [r2]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r3, _08194EBC
	adds r1, r1, r3
	ldrb r0, [r1, #6]
	lsls r0, r0, #2
	ldr r4, _08194EC0
	adds r0, r0, r4
	ldr r0, [r0]
	orrs r7, r0
	ldrb r0, [r1, #7]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	orrs r7, r0
	adds r6, #1
	cmp r6, #2
	ble _08194DAA
	movs r4, #0
	movs r1, #1
	movs r6, #0x1f
_08194E3A:
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08194E44
	adds r4, #1
_08194E44:
	asrs r7, r7, #1
	subs r6, #1
	cmp r6, #0
	bge _08194E3A
	movs r1, #0x32
	adds r0, r4, #0
	muls r0, r1, r0
	movs r1, #0x14
	bl __divsi3
	ldrh r1, [r5]
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	ldr r2, [sp, #0x34]
	adds r2, #2
	str r2, [sp, #0x34]
	movs r3, #1
	add sl, r3
	mov r4, sl
	cmp r4, #0xf
	ble _08194D82
	movs r5, #0
	mov sl, r5
	ldr r7, [sp, #0x18]
_08194E76:
	mov r6, sl
	adds r6, #1
	cmp r6, #0xf
	bgt _08194EF8
	mov r8, r7
	ldr r5, _08194EA4
	lsls r0, r6, #1
	ldr r1, [sp, #0x18]
	adds r4, r0, r1
_08194E88:
	mov r2, r8
	ldrh r1, [r2]
	ldrh r0, [r4]
	cmp r1, r0
	bhs _08194EC4
	mov r0, sl
	adds r1, r6, #0
	ldr r2, [sp, #0x18]
	bl SwapDomeTrainers
	b _08194EF0
	.align 2, 0
_08194EA0: .4byte 0x03005AF0
_08194EA4: .4byte 0x00000D24
_08194EA8: .4byte 0x000003FF
_08194EAC: .4byte 0xFFFFFC00
_08194EB0: .4byte 0x0203B958
_08194EB4: .4byte 0x00000D64
_08194EB8: .4byte 0x00000D25
_08194EBC: .4byte 0x082F0D54
_08194EC0: .4byte 0x082FACB4
_08194EC4:
	cmp r1, r0
	bne _08194EF0
	ldr r0, _08194F50
	ldr r1, [r0]
	mov r3, sl
	lsls r0, r3, #2
	adds r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0]
	lsls r2, r2, #0x16
	lsls r0, r6, #2
	adds r1, r1, r0
	adds r1, r1, r5
	ldrh r0, [r1]
	lsls r0, r0, #0x16
	cmp r2, r0
	bls _08194EF0
	mov r0, sl
	adds r1, r6, #0
	ldr r2, [sp, #0x18]
	bl SwapDomeTrainers
_08194EF0:
	adds r4, #2
	adds r6, #1
	cmp r6, #0xf
	ble _08194E88
_08194EF8:
	adds r7, #2
	movs r4, #1
	add sl, r4
	mov r5, sl
	cmp r5, #0xe
	ble _08194E76
	ldr r0, [sp, #0x18]
	bl Free
	ldr r0, [sp, #0x1c]
	bl Free
	movs r0, #0
	mov sl, r0
_08194F14:
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl DecideRoundWinners
	movs r2, #1
	add sl, r2
	mov r3, sl
	cmp r3, #3
	ble _08194F14
	ldr r0, _08194F50
	ldr r1, [r0]
	ldr r4, _08194F54
	adds r1, r1, r4
	ldrb r2, [r1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	ldr r5, [sp, #0x14]
	orrs r0, r5
	strb r0, [r1]
_08194F3E:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08194F50: .4byte 0x03005AF0
_08194F54: .4byte 0x00000CA9
	thumb_func_end sub_08194B58

	thumb_func_start TrainerIdToDomeTournamentId
TrainerIdToDomeTournamentId: @ 0x08194F58
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r4, _08194F98
	ldr r0, [r4]
	ldr r1, _08194F9C
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r3
	beq _08194F8E
	adds r5, r4, #0
	adds r4, r1, #0
_08194F76:
	adds r2, #1
	cmp r2, #0xf
	bgt _08194F8E
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r3
	bne _08194F76
_08194F8E:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08194F98: .4byte 0x03005AF0
_08194F9C: .4byte 0x00000D24
	thumb_func_end TrainerIdToDomeTournamentId

	thumb_func_start TrainerIdToTournamentId
TrainerIdToTournamentId: @ 0x08194FA0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r4, _08194FE0
	ldr r0, [r4]
	ldr r1, _08194FE4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r3
	beq _08194FD6
	adds r5, r4, #0
	adds r4, r1, #0
_08194FBE:
	adds r2, #1
	cmp r2, #0xf
	bgt _08194FD6
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r3
	bne _08194FBE
_08194FD6:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08194FE0: .4byte 0x03005AF0
_08194FE4: .4byte 0x00000D24
	thumb_func_end TrainerIdToTournamentId

	thumb_func_start sub_08194FE8
sub_08194FE8: @ 0x08194FE8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08195024
	ldr r0, _08195028
	adds r0, r4, r0
	ldrb r0, [r0]
	lsrs r0, r0, #1
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	bl sub_08192B3C
	mov r0, sp
	ldrb r0, [r0]
	cmp r4, r0
	beq _0819502C
	mov r0, sp
	ldrb r0, [r0]
	b _08195030
	.align 2, 0
_08195024: .4byte 0x085D5C1C
_08195028: .4byte 0x085D5C3C
_0819502C:
	mov r0, sp
	ldrb r0, [r0, #1]
_08195030:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08194FE8

	thumb_func_start DecideRoundWinners
DecideRoundWinners: @ 0x08195038
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	movs r5, #0
	movs r1, #3
	ldr r0, [sp]
	ands r0, r1
	lsls r0, r0, #3
	str r0, [sp, #0x14]
_0819505E:
	ldr r2, _081950F0
	ldr r0, [r2]
	lsls r4, r5, #2
	adds r1, r0, r4
	ldr r3, _081950F4
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	adds r2, r5, #1
	str r2, [sp, #0x24]
	cmp r0, #0
	bge _08195078
	b _08195476
_08195078:
	subs r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r1, r0, #0x16
	ldr r0, _081950F8
	cmp r1, r0
	bne _08195088
	b _08195476
_08195088:
	str r5, [sp, #4]
	lsrs r1, r1, #0x16
	ldr r0, [sp]
	bl TournamentIdOfOpponent
	str r0, [sp, #8]
	ldr r0, _081950F0
	ldr r3, [r0]
	adds r0, r3, r4
	ldr r1, _081950FC
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	ldr r1, _08195100
	cmp r0, r1
	bne _08195104
	ldr r2, [sp, #8]
	cmp r2, #0xff
	beq _08195104
	lsls r2, r2, #2
	adds r1, r3, r2
	ldr r3, _081950F4
	adds r1, r1, r3
	ldrb r0, [r1]
	movs r3, #4
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _081950F0
	ldr r1, [r0]
	adds r1, r1, r2
	ldr r2, _081950F4
	adds r1, r1, r2
	ldrb r0, [r1]
	subs r3, #0x1d
	ands r0, r3
	ldr r2, [sp, #0x14]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	ldr r1, [sp, #8]
	ldr r2, [sp]
	bl GetWinningMove
	ldr r3, _081950F0
	ldr r1, [r3]
	ldr r5, [sp, #8]
	lsls r2, r5, #1
	movs r3, #0xec
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r1, r1, r2
	b _08195474
	.align 2, 0
_081950F0: .4byte 0x03005AF0
_081950F4: .4byte 0x00000D25
_081950F8: .4byte 0xFFC00000
_081950FC: .4byte 0x00000D24
_08195100: .4byte 0xFF800000
_08195104:
	ldr r4, _0819516C
	ldr r3, [r4]
	ldr r0, [sp, #8]
	lsls r2, r0, #2
	adds r0, r3, r2
	ldr r1, _08195170
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	ldr r1, _08195174
	str r2, [sp, #0x30]
	cmp r0, r1
	bne _0819517C
	ldr r2, [sp, #4]
	cmp r2, #0xff
	beq _0819517C
	lsls r2, r2, #2
	adds r1, r3, r2
	ldr r3, _08195178
	adds r1, r1, r3
	ldrb r0, [r1]
	movs r3, #4
	orrs r0, r3
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, r1, r2
	ldr r0, _08195178
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #0x19
	rsbs r2, r2, #0
	ands r0, r2
	ldr r3, [sp, #0x14]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl GetWinningMove
	ldr r1, [r4]
	ldr r3, [sp, #4]
	lsls r2, r3, #1
	movs r3, #0xec
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r1, r1, r2
	strh r0, [r1]
	adds r5, #1
	str r5, [sp, #0x24]
	b _08195476
	.align 2, 0
_0819516C: .4byte 0x03005AF0
_08195170: .4byte 0x00000D24
_08195174: .4byte 0xFF800000
_08195178: .4byte 0x00000D25
_0819517C:
	adds r5, #1
	str r5, [sp, #0x24]
	ldr r5, [sp, #8]
	cmp r5, #0xff
	bne _08195188
	b _08195476
_08195188:
	movs r0, #0
	mov sl, r0
	lsls r1, r5, #1
	str r1, [sp, #0x2c]
	ldr r2, [sp, #4]
	lsls r2, r2, #1
	str r2, [sp, #0x28]
	ldr r3, [sp, #4]
	adds r0, r2, r3
	lsls r0, r0, #1
	mov sb, r0
	adds r0, r1, r5
	lsls r0, r0, #1
	str r0, [sp, #0x18]
_081951A4:
	movs r5, #0
	mov r0, sb
	str r0, [sp, #0x38]
_081951AA:
	movs r6, #0
	lsls r7, r5, #1
	ldr r4, [sp, #0x18]
_081951B0:
	ldr r2, _08195370
	ldr r1, [r2]
	ldr r3, _08195374
	adds r1, r1, r3
	ldr r2, [sp, #0x38]
	adds r0, r1, r2
	ldrh r0, [r0]
	ldr r3, _08195378
	mov r8, r3
	ldr r2, [r3]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r0, #2
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #2
	bl GetTypeEffectivenessPoints
	ldr r1, [sp, #0xc]
	adds r1, r1, r0
	str r1, [sp, #0xc]
	adds r4, #2
	adds r6, #1
	cmp r6, #2
	ble _081951B0
	adds r5, #1
	cmp r5, #3
	ble _081951AA
	ldr r2, _08195370
	ldr r0, [r2]
	ldr r3, _08195374
	adds r0, r0, r3
	add r0, sb
	ldrh r0, [r0]
	mov r5, r8
	ldr r1, [r5]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r0, _0819537C
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	ldrb r2, [r1, #1]
	adds r0, r0, r2
	ldrb r2, [r1, #2]
	adds r0, r0, r2
	ldrb r2, [r1, #3]
	adds r0, r0, r2
	ldrb r3, [r1, #4]
	adds r0, r0, r3
	ldrb r1, [r1, #5]
	adds r0, r0, r1
	movs r1, #0xa
	bl __divsi3
	ldr r5, [sp, #0xc]
	adds r5, r5, r0
	str r5, [sp, #0xc]
	movs r0, #2
	add sb, r0
	movs r1, #1
	add sl, r1
	mov r2, sl
	cmp r2, #2
	ble _081951A4
	bl Random
	movs r1, #0x1f
	ands r1, r0
	adds r5, r5, r1
	ldr r3, [sp, #4]
	adds r5, r5, r3
	str r5, [sp, #0xc]
	movs r5, #0
	mov sl, r5
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #8]
	adds r0, r1, r2
	lsls r0, r0, #1
	str r0, [sp, #0x1c]
	ldr r5, [sp, #0x28]
	adds r0, r5, r3
	lsls r0, r0, #1
	str r0, [sp, #0x20]
_08195268:
	movs r5, #0
	mov r0, sl
	lsls r3, r0, #1
	movs r1, #1
	add sl, r1
	ldr r2, [sp, #0x1c]
	adds r2, r2, r3
	mov r8, r2
_08195278:
	movs r6, #0
	lsls r7, r5, #1
	adds r5, #1
	str r5, [sp, #0x3c]
	ldr r4, [sp, #0x20]
_08195282:
	ldr r5, _08195370
	ldr r1, [r5]
	ldr r0, _08195374
	adds r1, r1, r0
	mov r2, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	ldr r5, _08195378
	mov sb, r5
	ldr r2, [r5]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r0, #2
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #2
	str r3, [sp, #0x34]
	bl GetTypeEffectivenessPoints
	ldr r1, [sp, #0x10]
	adds r1, r1, r0
	str r1, [sp, #0x10]
	adds r4, #2
	adds r6, #1
	ldr r3, [sp, #0x34]
	cmp r6, #2
	ble _08195282
	ldr r5, [sp, #0x3c]
	cmp r5, #3
	ble _08195278
	ldr r2, _08195370
	ldr r0, [r2]
	ldr r5, [sp, #0x1c]
	adds r1, r3, r5
	ldr r2, _08195374
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r3, sb
	ldr r1, [r3]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r0, _0819537C
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	ldrb r2, [r1, #1]
	adds r0, r0, r2
	ldrb r5, [r1, #2]
	adds r0, r0, r5
	ldrb r2, [r1, #3]
	adds r0, r0, r2
	ldrb r2, [r1, #4]
	adds r0, r0, r2
	ldrb r1, [r1, #5]
	adds r0, r0, r1
	movs r1, #0xa
	bl __divsi3
	ldr r3, [sp, #0x10]
	adds r3, r3, r0
	str r3, [sp, #0x10]
	mov r5, sl
	cmp r5, #2
	ble _08195268
	bl Random
	movs r1, #0x1f
	ands r1, r0
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	ldr r1, [sp, #8]
	adds r0, r0, r1
	str r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	cmp r2, r0
	ble _08195384
	ldr r3, _08195370
	ldr r1, [r3]
	ldr r5, [sp, #0x30]
	adds r1, r1, r5
	ldr r0, _08195380
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, r1, r5
	ldr r3, _08195380
	adds r1, r1, r3
	ldrb r0, [r1]
	movs r5, #0x19
	rsbs r5, r5, #0
	ands r0, r5
	ldr r2, [sp, #0x14]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp]
	bl GetWinningMove
	ldr r3, _08195370
	ldr r1, [r3]
	movs r5, #0xec
	lsls r5, r5, #4
	adds r1, r1, r5
	ldr r2, [sp, #0x2c]
	adds r1, r1, r2
	b _08195474
	.align 2, 0
_08195370: .4byte 0x03005AF0
_08195374: .4byte 0x00000D64
_08195378: .4byte 0x0203B958
_0819537C: .4byte 0x082F0D54
_08195380: .4byte 0x00000D25
_08195384:
	ldr r3, [sp, #0xc]
	ldr r5, [sp, #0x10]
	cmp r3, r5
	bge _081953DC
	ldr r0, _081953D4
	ldr r1, [r0]
	ldr r3, [sp, #4]
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r5, _081953D8
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r3, #4
	orrs r0, r3
	strb r0, [r1]
	ldr r5, _081953D4
	ldr r1, [r5]
	adds r1, r1, r2
	ldr r0, _081953D8
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #0x19
	rsbs r2, r2, #0
	ands r0, r2
	ldr r3, [sp, #0x14]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl GetWinningMove
	ldr r1, [r5]
	movs r5, #0xec
	lsls r5, r5, #4
	adds r1, r1, r5
	ldr r2, [sp, #0x28]
	adds r1, r1, r2
	b _08195474
	.align 2, 0
_081953D4: .4byte 0x03005AF0
_081953D8: .4byte 0x00000D25
_081953DC:
	ldr r3, [sp, #4]
	ldr r5, [sp, #8]
	cmp r3, r5
	ble _08195430
	ldr r0, _08195428
	ldr r1, [r0]
	ldr r2, [sp, #0x30]
	adds r1, r1, r2
	ldr r3, _0819542C
	adds r1, r1, r3
	ldrb r0, [r1]
	movs r5, #4
	orrs r0, r5
	strb r0, [r1]
	ldr r0, _08195428
	ldr r1, [r0]
	adds r1, r1, r2
	adds r1, r1, r3
	ldrb r0, [r1]
	movs r2, #0x19
	rsbs r2, r2, #0
	ands r0, r2
	ldr r3, [sp, #0x14]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp]
	bl GetWinningMove
	ldr r5, _08195428
	ldr r1, [r5]
	movs r2, #0xec
	lsls r2, r2, #4
	adds r1, r1, r2
	ldr r3, [sp, #0x2c]
	b _08195472
	.align 2, 0
_08195428: .4byte 0x03005AF0
_0819542C: .4byte 0x00000D25
_08195430:
	ldr r5, _08195490
	ldr r1, [r5]
	ldr r0, [sp, #4]
	lsls r2, r0, #2
	adds r1, r1, r2
	ldr r3, _08195494
	adds r1, r1, r3
	ldrb r0, [r1]
	movs r5, #4
	orrs r0, r5
	strb r0, [r1]
	ldr r0, _08195490
	ldr r1, [r0]
	adds r1, r1, r2
	adds r1, r1, r3
	ldrb r0, [r1]
	movs r2, #0x19
	rsbs r2, r2, #0
	ands r0, r2
	ldr r3, [sp, #0x14]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl GetWinningMove
	ldr r5, _08195490
	ldr r1, [r5]
	movs r2, #0xec
	lsls r2, r2, #4
	adds r1, r1, r2
	ldr r3, [sp, #0x28]
_08195472:
	adds r1, r1, r3
_08195474:
	strh r0, [r1]
_08195476:
	ldr r5, [sp, #0x24]
	cmp r5, #0xf
	bgt _0819547E
	b _0819505E
_0819547E:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08195490: .4byte 0x03005AF0
_08195494: .4byte 0x00000D25
	thumb_func_end DecideRoundWinners

	thumb_func_start CopyDomeTrainerName
CopyDomeTrainerName: @ 0x08195498
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r4, #0
	bl SetFacilityPtrsGetLevel
	ldr r0, _081954B4
	cmp r5, r0
	bne _081954B8
	adds r0, r6, #0
	bl CopyDomeBrainTrainerName
	b _08195502
	.align 2, 0
_081954B4: .4byte 0x000003FE
_081954B8:
	ldr r0, _081954D4
	cmp r5, r0
	bne _081954DC
	ldr r0, _081954D8
	ldr r2, [r0]
_081954C2:
	adds r0, r6, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #6
	ble _081954C2
	b _081954FC
	.align 2, 0
_081954D4: .4byte 0x000003FF
_081954D8: .4byte 0x03005AF0
_081954DC:
	ldr r0, _08195508
	cmp r5, r0
	bhi _081954FC
	ldr r0, _0819550C
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r5, r0
	adds r0, r0, r1
	adds r2, r0, #4
_081954EE:
	adds r0, r6, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #6
	ble _081954EE
_081954FC:
	adds r1, r6, r4
	movs r0, #0xff
	strb r0, [r1]
_08195502:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08195508: .4byte 0x0000012B
_0819550C: .4byte 0x0203B954
	thumb_func_end CopyDomeTrainerName

	thumb_func_start CallBattleDomeFunction
CallBattleDomeFunction: @ 0x08195510
	ldr r0, _0819551C
	ldr r1, _08195520
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0819551C: .4byte 0x082E383C
_08195520: .4byte 0x000064C3
	thumb_func_end CallBattleDomeFunction

	thumb_func_start GetDomeBrainTrainerClass
GetDomeBrainTrainerClass: @ 0x08195524
	ldr r0, _08195530
	ldr r1, _08195534
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08195530: .4byte 0x082E383C
_08195534: .4byte 0x000064C1
	thumb_func_end GetDomeBrainTrainerClass

	thumb_func_start CopyDomeBrainTrainerName
CopyDomeBrainTrainerName: @ 0x08195538
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r4, _0819555C
_08195540:
	adds r0, r3, r2
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _08195540
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819555C: .4byte 0x082E9D00
	thumb_func_end CopyDomeBrainTrainerName

