.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CallFrontierUtilFunc
CallFrontierUtilFunc: @ 0x081A1628
	push {lr}
	ldr r1, _081A1640
	ldr r0, _081A1644
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end CallFrontierUtilFunc

	thumb_func_start sub_081A163C
sub_081A163C: @ 0x081A163C
	bx r0
	.align 2, 0
_081A1640: .4byte 0x085DD244
_081A1644: .4byte 0x02037280
	thumb_func_end sub_081A163C

	thumb_func_start sub_081A1648
sub_081A1648: @ 0x081A1648
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0xff
	bl VarSet
	ldr r0, _081A166C
	ldr r0, [r0]
	ldr r1, _081A1670
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #4
	bhi _081A16CA
	lsls r0, r0, #2
	ldr r1, _081A1674
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A166C: .4byte 0x03005AF0
_081A1670: .4byte 0x00000CA8
_081A1674: .4byte 0x081A1678
_081A1678: @ jump table
	.4byte _081A16CA @ case 0
	.4byte _081A168C @ case 1
	.4byte _081A16B8 @ case 2
	.4byte _081A1694 @ case 3
	.4byte _081A1690 @ case 4
_081A168C:
	movs r0, #0
	b _081A1696
_081A1690:
	movs r0, #0
	b _081A1696
_081A1694:
	movs r0, #1
_081A1696:
	bl sub_0813A880
	movs r0, #0x80
	lsls r0, r0, #7
	ldr r1, _081A16B0
	ldr r1, [r1]
	ldr r2, _081A16B4
	adds r1, r1, r2
	ldrb r1, [r1]
	bl VarSet
	b _081A16CA
	.align 2, 0
_081A16B0: .4byte 0x03005AF0
_081A16B4: .4byte 0x00000CA8
_081A16B8:
	movs r0, #0x80
	lsls r0, r0, #7
	ldr r1, _081A16D0
	ldr r1, [r1]
	ldr r2, _081A16D4
	adds r1, r1, r2
	ldrb r1, [r1]
	bl VarSet
_081A16CA:
	pop {r0}
	bx r0
	.align 2, 0
_081A16D0: .4byte 0x03005AF0
_081A16D4: .4byte 0x00000CA8
	thumb_func_end sub_081A1648

	thumb_func_start sub_081A16D8
sub_081A16D8: @ 0x081A16D8
	push {r4, r5, r6, lr}
	ldr r0, _081A1708
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r6, #0
	bl GetPlayerSymbolCountForFacility
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bne _081A16F4
	movs r5, #1
_081A16F4:
	ldr r0, _081A170C
	ldrh r0, [r0]
	cmp r0, #7
	bls _081A16FE
	b _081A17FE
_081A16FE:
	lsls r0, r0, #2
	ldr r1, _081A1710
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A1708: .4byte 0x000040CF
_081A170C: .4byte 0x02037282
_081A1710: .4byte 0x081A1714
_081A1714: @ jump table
	.4byte _081A1734 @ case 0
	.4byte _081A1750 @ case 1
	.4byte _081A1770 @ case 2
	.4byte _081A178C @ case 3
	.4byte _081A17FE @ case 4
	.4byte _081A17A8 @ case 5
	.4byte _081A17C0 @ case 6
	.4byte _081A17E0 @ case 7
_081A1734:
	ldr r1, _081A1744
	ldr r0, _081A1748
	ldr r0, [r0]
	ldr r2, _081A174C
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	b _081A17FE
	.align 2, 0
_081A1744: .4byte 0x02037290
_081A1748: .4byte 0x03005AF0
_081A174C: .4byte 0x00000CA8
_081A1750:
	ldr r1, _081A1764
	ldr r0, _081A1768
	ldr r0, [r0]
	ldr r2, _081A176C
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	strh r0, [r1]
	b _081A17FE
	.align 2, 0
_081A1764: .4byte 0x02037290
_081A1768: .4byte 0x03005AF0
_081A176C: .4byte 0x00000CA9
_081A1770:
	ldr r1, _081A1780
	ldr r0, _081A1784
	ldr r0, [r0]
	ldr r2, _081A1788
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	b _081A17FE
	.align 2, 0
_081A1780: .4byte 0x02037290
_081A1784: .4byte 0x03005AF0
_081A1788: .4byte 0x00000CB2
_081A178C:
	ldr r1, _081A179C
	ldr r0, _081A17A0
	ldr r0, [r0]
	ldr r2, _081A17A4
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _081A17CE
	.align 2, 0
_081A179C: .4byte 0x02037290
_081A17A0: .4byte 0x03005AF0
_081A17A4: .4byte 0x00000CA9
_081A17A8:
	ldr r2, _081A17B8
	ldr r1, _081A17BC
	ldrb r0, [r1]
	strh r0, [r2]
	movs r0, #0
	strb r0, [r1]
	b _081A17FE
	.align 2, 0
_081A17B8: .4byte 0x02037290
_081A17BC: .4byte 0x02023FDE
_081A17C0:
	ldr r1, _081A17D4
	ldr r0, _081A17D8
	ldr r0, [r0]
	ldr r2, _081A17DC
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
_081A17CE:
	lsrs r0, r0, #0x1f
	strh r0, [r1]
	b _081A17FE
	.align 2, 0
_081A17D4: .4byte 0x02037290
_081A17D8: .4byte 0x03005AF0
_081A17DC: .4byte 0x00000CA9
_081A17E0:
	ldr r4, _081A1804
	ldr r0, _081A1808
	ldr r2, [r0]
	movs r0, #0xd0
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _081A180C
	lsls r0, r5, #1
	lsls r1, r6, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r1, [r2]
	ldrh r0, [r0]
	ands r0, r1
	strh r0, [r4]
_081A17FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A1804: .4byte 0x02037290
_081A1808: .4byte 0x03005AF0
_081A180C: .4byte 0x085DD228
	thumb_func_end sub_081A16D8

	thumb_func_start sub_081A1810
sub_081A1810: @ 0x081A1810
	push {r4, r5, lr}
	ldr r0, _081A1840
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl GetPlayerSymbolCountForFacility
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bne _081A182C
	movs r4, #1
_081A182C:
	ldr r0, _081A1844
	ldrh r0, [r0]
	cmp r0, #7
	bls _081A1836
	b _081A196C
_081A1836:
	lsls r0, r0, #2
	ldr r1, _081A1848
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A1840: .4byte 0x000040CF
_081A1844: .4byte 0x02037282
_081A1848: .4byte 0x081A184C
_081A184C: @ jump table
	.4byte _081A186C @ case 0
	.4byte _081A1888 @ case 1
	.4byte _081A18B4 @ case 2
	.4byte _081A18D0 @ case 3
	.4byte _081A18F8 @ case 4
	.4byte _081A196C @ case 5
	.4byte _081A1924 @ case 6
	.4byte _081A1950 @ case 7
_081A186C:
	ldr r0, _081A187C
	ldr r0, [r0]
	ldr r1, _081A1880
	ldrh r1, [r1]
	ldr r2, _081A1884
	adds r0, r0, r2
	strb r1, [r0]
	b _081A196C
	.align 2, 0
_081A187C: .4byte 0x03005AF0
_081A1880: .4byte 0x02037284
_081A1884: .4byte 0x00000CA8
_081A1888:
	ldr r0, _081A18A8
	ldr r2, [r0]
	ldr r0, _081A18AC
	ldrb r0, [r0]
	ldr r1, _081A18B0
	adds r2, r2, r1
	movs r1, #3
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _081A196C
	.align 2, 0
_081A18A8: .4byte 0x03005AF0
_081A18AC: .4byte 0x02037284
_081A18B0: .4byte 0x00000CA9
_081A18B4:
	ldr r0, _081A18C4
	ldr r0, [r0]
	ldr r1, _081A18C8
	ldrh r1, [r1]
	ldr r2, _081A18CC
	adds r0, r0, r2
	strh r1, [r0]
	b _081A196C
	.align 2, 0
_081A18C4: .4byte 0x03005AF0
_081A18C8: .4byte 0x02037284
_081A18CC: .4byte 0x00000CB2
_081A18D0:
	ldr r0, _081A18EC
	ldr r3, [r0]
	ldr r0, _081A18F0
	ldrb r0, [r0]
	ldr r1, _081A18F4
	adds r3, r3, r1
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	b _081A193C
	.align 2, 0
_081A18EC: .4byte 0x03005AF0
_081A18F0: .4byte 0x02037284
_081A18F4: .4byte 0x00000CA9
_081A18F8:
	movs r2, #0
	ldr r5, _081A1918
	ldr r4, _081A191C
	ldr r3, _081A1920
_081A1900:
	ldr r1, [r5]
	lsls r0, r2, #1
	adds r1, r1, r4
	adds r1, r1, r0
	adds r0, r2, r3
	ldrb r0, [r0]
	strh r0, [r1]
	adds r2, #1
	cmp r2, #3
	ble _081A1900
	b _081A196C
	.align 2, 0
_081A1918: .4byte 0x03005AF0
_081A191C: .4byte 0x00000CAA
_081A1920: .4byte 0x0203CBC4
_081A1924:
	ldr r0, _081A1944
	ldr r3, [r0]
	ldr r0, _081A1948
	ldrb r0, [r0]
	ldr r2, _081A194C
	adds r3, r3, r2
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3]
	movs r0, #9
	rsbs r0, r0, #0
_081A193C:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _081A196C
	.align 2, 0
_081A1944: .4byte 0x03005AF0
_081A1948: .4byte 0x02037284
_081A194C: .4byte 0x00000CA9
_081A1950:
	ldr r0, _081A1974
	ldr r2, [r0]
	movs r0, #0xd0
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _081A1978
	lsls r1, r4, #1
	lsls r0, r5, #2
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r2]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_081A196C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A1974: .4byte 0x03005AF0
_081A1978: .4byte 0x085DD228
	thumb_func_end sub_081A1810

	thumb_func_start sub_081A197C
sub_081A197C: @ 0x081A197C
	push {r4, r5, r6, r7, lr}
	bl sub_081B81F8
	movs r3, #0
	ldr r4, _081A19B4
	ldrh r0, [r4]
	cmp r3, r0
	bge _081A19A8
	ldr r7, _081A19B8
	ldr r6, _081A19BC
	ldr r5, _081A19C0
_081A1992:
	adds r2, r3, r7
	ldr r0, [r6]
	lsls r1, r3, #1
	adds r0, r0, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	adds r3, #1
	ldrh r0, [r4]
	cmp r3, r0
	blt _081A1992
_081A19A8:
	bl ReducePlayerPartyToSelectedMons
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A19B4: .4byte 0x02037282
_081A19B8: .4byte 0x0203CBC4
_081A19BC: .4byte 0x03005AF0
_081A19C0: .4byte 0x00000CAA
	thumb_func_end sub_081A197C

	thumb_func_start DoSoftReset_
DoSoftReset_: @ 0x081A19C4
	push {lr}
	bl DoSoftReset
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DoSoftReset_

	thumb_func_start sub_081A19D0
sub_081A19D0: @ 0x081A19D0
	ldr r1, _081A19D8
	ldr r0, _081A19DC
	str r0, [r1]
	bx lr
	.align 2, 0
_081A19D8: .4byte 0x0203B954
_081A19DC: .4byte 0x085B4A10
	thumb_func_end sub_081A19D0

	thumb_func_start sub_081A19E0
sub_081A19E0: @ 0x081A19E0
	push {r4, r5, lr}
	movs r4, #0
	movs r5, #0x64
_081A19E6:
	ldr r0, _081A1A30
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A1A34
	adds r0, r0, r2
	adds r1, r0, r1
	ldrh r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bhi _081A1A1E
	ldr r0, _081A1A38
	ldr r0, [r0]
	ldrh r1, [r1]
	subs r1, #1
	muls r1, r5, r1
	adds r0, r0, r1
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r2, _081A1A3C
	adds r1, r4, #0
	muls r1, r5, r1
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
_081A1A1E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081A19E6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A1A30: .4byte 0x03005AF0
_081A1A34: .4byte 0x00000CAA
_081A1A38: .4byte 0x03005AEC
_081A1A3C: .4byte 0x02024190
	thumb_func_end sub_081A19E0

	thumb_func_start ShowFacilityResultsWindow
ShowFacilityResultsWindow: @ 0x081A1A40
	push {lr}
	ldr r0, _081A1A64
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #3
	bls _081A1A50
	movs r0, #0
	strh r0, [r2]
_081A1A50:
	ldr r0, _081A1A68
	ldrh r0, [r0]
	cmp r0, #7
	bhi _081A1AC6
	lsls r0, r0, #2
	ldr r1, _081A1A6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A1A64: .4byte 0x02037284
_081A1A68: .4byte 0x02037282
_081A1A6C: .4byte 0x081A1A70
_081A1A70: @ jump table
	.4byte _081A1A90 @ case 0
	.4byte _081A1A98 @ case 1
	.4byte _081A1AA0 @ case 2
	.4byte _081A1AB6 @ case 3
	.4byte _081A1AAE @ case 4
	.4byte _081A1AA8 @ case 5
	.4byte _081A1ABC @ case 6
	.4byte _081A1AC2 @ case 7
_081A1A90:
	ldrb r0, [r2]
	bl ShowTowerResultsWindow
	b _081A1AC6
_081A1A98:
	ldrb r0, [r2]
	bl ShowDomeResultsWindow
	b _081A1AC6
_081A1AA0:
	ldrb r0, [r2]
	bl ShowPalaceResultsWindow
	b _081A1AC6
_081A1AA8:
	bl ShowPikeResultsWindow
	b _081A1AC6
_081A1AAE:
	ldrb r0, [r2]
	bl ShowFactoryResultsWindow
	b _081A1AC6
_081A1AB6:
	bl ShowArenaResultsWindow
	b _081A1AC6
_081A1ABC:
	bl ShowPyramidResultsWindow
	b _081A1AC6
_081A1AC2:
	bl PrintHallRecords
_081A1AC6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ShowFacilityResultsWindow

	thumb_func_start sub_081A1ACC
sub_081A1ACC: @ 0x081A1ACC
	push {lr}
	ldr r1, _081A1AE4
	ldr r1, [r1]
	ldr r2, _081A1AE8
	adds r1, r1, r2
	ldr r1, [r1]
	ands r1, r0
	cmp r1, #0
	bne _081A1AEC
	movs r0, #0
	b _081A1AEE
	.align 2, 0
_081A1AE4: .4byte 0x03005AF0
_081A1AE8: .4byte 0x00000CDC
_081A1AEC:
	movs r0, #1
_081A1AEE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081A1ACC

	thumb_func_start TowerPrintStreak
TowerPrintStreak: @ 0x081A1AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	ldr r0, _081A1B78
	mov sb, r0
	ldrb r0, [r0]
	lsls r4, r2, #0x1b
	lsrs r4, r4, #0x18
	lsrs r3, r3, #0x15
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	str r5, [sp]
	movs r7, #0
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	mov r2, ip
	adds r3, r4, #0
	bl AddTextPrinterParameterized
	ldr r0, _081A1B7C
	cmp r6, r0
	bls _081A1B38
	adds r6, r0, #0
_081A1B38:
	ldr r0, _081A1B80
	adds r1, r6, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _081A1B84
	ldr r1, _081A1B88
	adds r0, r4, #0
	bl StringExpandPlaceholders
	mov r1, sb
	ldrb r0, [r1]
	mov r3, r8
	adds r3, #6
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A1B78: .4byte 0x0203A840
_081A1B7C: .4byte 0x0000270F
_081A1B80: .4byte 0x02021C40
_081A1B84: .4byte 0x02021C7C
_081A1B88: .4byte 0x085DD41D
	thumb_func_end TowerPrintStreak

	thumb_func_start TowerPrintRecordStreak
TowerPrintRecordStreak: @ 0x081A1B8C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r4, _081A1BBC
	ldr r4, [r4]
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	movs r0, #0xcf
	lsls r0, r0, #4
	adds r4, r4, r0
	adds r4, r4, r1
	ldrh r1, [r4]
	ldr r0, _081A1BC0
	bl TowerPrintStreak
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A1BBC: .4byte 0x03005AF0
_081A1BC0: .4byte 0x085DD42A
	thumb_func_end TowerPrintRecordStreak

	thumb_func_start TowerGetWinStreak
TowerGetWinStreak: @ 0x081A1BC4
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _081A1BEC
	ldr r2, [r2]
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	movs r0, #0xce
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	ldr r1, _081A1BF0
	cmp r0, r1
	bls _081A1BE6
	adds r0, r1, #0
_081A1BE6:
	pop {r1}
	bx r1
	.align 2, 0
_081A1BEC: .4byte 0x03005AF0
_081A1BF0: .4byte 0x0000270F
	thumb_func_end TowerGetWinStreak

	thumb_func_start TowerPrintPrevOrCurrentStreak
TowerPrintPrevOrCurrentStreak: @ 0x081A1BF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	adds r0, r4, #0
	adds r1, r5, #0
	bl TowerGetWinStreak
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r4, #1
	beq _081A1C34
	cmp r4, #1
	ble _081A1C28
	cmp r4, #2
	beq _081A1C44
	cmp r4, #3
	beq _081A1C54
_081A1C28:
	cmp r5, #0
	beq _081A1C30
	movs r0, #2
	b _081A1C62
_081A1C30:
	movs r0, #1
	b _081A1C62
_081A1C34:
	cmp r5, #0
	beq _081A1C3E
	movs r0, #0x80
	lsls r0, r0, #8
	b _081A1C62
_081A1C3E:
	movs r0, #0x80
	lsls r0, r0, #7
	b _081A1C62
_081A1C44:
	cmp r5, #0
	beq _081A1C4E
	movs r0, #0x80
	lsls r0, r0, #0xa
	b _081A1C62
_081A1C4E:
	movs r0, #0x80
	lsls r0, r0, #9
	b _081A1C62
_081A1C54:
	cmp r5, #0
	beq _081A1C5E
	movs r0, #0x80
	lsls r0, r0, #0xc
	b _081A1C62
_081A1C5E:
	movs r0, #0x80
	lsls r0, r0, #0xb
_081A1C62:
	bl sub_081A1ACC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081A1C80
	ldr r0, _081A1C7C
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl TowerPrintStreak
	b _081A1C8C
	.align 2, 0
_081A1C7C: .4byte 0x085DD425
_081A1C80:
	ldr r0, _081A1C98
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl TowerPrintStreak
_081A1C8C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A1C98: .4byte 0x085DD42F
	thumb_func_end TowerPrintPrevOrCurrentStreak

	thumb_func_start ShowTowerResultsWindow
ShowTowerResultsWindow: @ 0x081A1C9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _081A1CCC
	ldr r0, _081A1CD0
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	cmp r6, #0
	bne _081A1CDC
	ldr r0, _081A1CD4
	ldr r1, _081A1CD8
	bl StringExpandPlaceholders
	b _081A1D14
	.align 2, 0
_081A1CCC: .4byte 0x0203A840
_081A1CD0: .4byte 0x085DD2A0
_081A1CD4: .4byte 0x02021C7C
_081A1CD8: .4byte 0x085DD2EC
_081A1CDC:
	cmp r6, #1
	bne _081A1CF4
	ldr r0, _081A1CEC
	ldr r1, _081A1CF0
	bl StringExpandPlaceholders
	b _081A1D14
	.align 2, 0
_081A1CEC: .4byte 0x02021C7C
_081A1CF0: .4byte 0x085DD303
_081A1CF4:
	cmp r6, #2
	bne _081A1D0C
	ldr r0, _081A1D04
	ldr r1, _081A1D08
	bl StringExpandPlaceholders
	b _081A1D14
	.align 2, 0
_081A1D04: .4byte 0x02021C7C
_081A1D08: .4byte 0x085DD31A
_081A1D0C:
	ldr r0, _081A1DC4
	ldr r1, _081A1DC8
	bl StringExpandPlaceholders
_081A1D14:
	ldr r5, _081A1DCC
	ldrb r0, [r5]
	ldr r2, _081A1DC4
	movs r1, #0x12
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A1DD0
	movs r1, #0x32
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A1DD4
	movs r1, #0x62
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	movs r5, #0
_081A1D56:
	ldr r7, _081A1DCC
	ldrb r0, [r7]
	lsls r3, r4, #1
	adds r3, r3, r4
	adds r3, #1
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r1, #0x52
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _081A1DD8
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa
	bls _081A1D56
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xb
	movs r3, #6
	bl TowerPrintPrevOrCurrentStreak
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xb
	movs r3, #8
	bl TowerPrintRecordStreak
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0xb
	movs r3, #0xc
	bl TowerPrintPrevOrCurrentStreak
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0xb
	movs r3, #0xe
	bl TowerPrintRecordStreak
	ldrb r0, [r7]
	bl PutWindowTilemap
	ldrb r0, [r7]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A1DC4: .4byte 0x02021C7C
_081A1DC8: .4byte 0x085DD331
_081A1DCC: .4byte 0x0203A840
_081A1DD0: .4byte 0x085DD40E
_081A1DD4: .4byte 0x085DD415
_081A1DD8: .4byte 0x085DD2E8
	thumb_func_end ShowTowerResultsWindow

	thumb_func_start DomeGetWinStreak
DomeGetWinStreak: @ 0x081A1DDC
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _081A1E00
	ldr r2, [r2]
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r0, _081A1E04
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	ldr r1, _081A1E08
	cmp r0, r1
	bls _081A1DFC
	adds r0, r1, #0
_081A1DFC:
	pop {r1}
	bx r1
	.align 2, 0
_081A1E00: .4byte 0x03005AF0
_081A1E04: .4byte 0x00000D0C
_081A1E08: .4byte 0x0000270F
	thumb_func_end DomeGetWinStreak

	thumb_func_start PrintTwoStrings
PrintTwoStrings: @ 0x081A1E0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x2c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	ldr r0, _081A1E94
	mov sb, r0
	ldrb r0, [r0]
	lsls r3, r5, #0x1b
	lsrs r3, r3, #0x18
	lsrs r4, r4, #0x15
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	mov r2, sl
	bl AddTextPrinterParameterized
	ldr r0, _081A1E98
	adds r1, r6, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r6, _081A1E9C
	adds r0, r6, #0
	adds r1, r7, #0
	bl StringExpandPlaceholders
	mov r1, sb
	ldrb r0, [r1]
	adds r5, #5
	lsls r5, r5, #0x1b
	lsrs r5, r5, #0x18
	str r4, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A1E94: .4byte 0x0203A840
_081A1E98: .4byte 0x02021C40
_081A1E9C: .4byte 0x02021C7C
	thumb_func_end PrintTwoStrings

	thumb_func_start PyramidPrintPrevOrCurrentStreak
PyramidPrintPrevOrCurrentStreak: @ 0x081A1EA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl DomeGetWinStreak
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, #0
	beq _081A1ECE
	cmp r4, #1
	beq _081A1EDA
_081A1ECE:
	cmp r5, #0
	beq _081A1ED6
	movs r0, #8
	b _081A1EE8
_081A1ED6:
	movs r0, #4
	b _081A1EE8
_081A1EDA:
	cmp r5, #0
	beq _081A1EE4
	movs r0, #0x80
	lsls r0, r0, #0xe
	b _081A1EE8
_081A1EE4:
	movs r0, #0x80
	lsls r0, r0, #0xd
_081A1EE8:
	bl sub_081A1ACC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081A1F0C
	ldr r0, _081A1F04
	ldr r1, _081A1F08
	str r6, [sp]
	adds r2, r7, #0
	mov r3, r8
	bl PrintTwoStrings
	b _081A1F1A
	.align 2, 0
_081A1F04: .4byte 0x085DD425
_081A1F08: .4byte 0x085DD447
_081A1F0C:
	ldr r0, _081A1F28
	ldr r1, _081A1F2C
	str r6, [sp]
	adds r2, r7, #0
	mov r3, r8
	bl PrintTwoStrings
_081A1F1A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A1F28: .4byte 0x085DD42F
_081A1F2C: .4byte 0x085DD447
	thumb_func_end PyramidPrintPrevOrCurrentStreak

	thumb_func_start ShowDomeResultsWindow
ShowDomeResultsWindow: @ 0x081A1F30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _081A1F68
	ldr r0, _081A1F6C
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	cmp r6, #0
	bne _081A1F78
	ldr r0, _081A1F70
	ldr r1, _081A1F74
	bl StringExpandPlaceholders
	b _081A1F80
	.align 2, 0
_081A1F68: .4byte 0x0203A840
_081A1F6C: .4byte 0x085DD2A8
_081A1F70: .4byte 0x02021C7C
_081A1F74: .4byte 0x085DD34A
_081A1F78:
	ldr r0, _081A2094
	ldr r1, _081A2098
	bl StringExpandPlaceholders
_081A1F80:
	ldr r5, _081A209C
	ldrb r0, [r5]
	ldr r2, _081A2094
	movs r1, #2
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A20A0
	movs r1, #0x22
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A20A4
	movs r1, #0x62
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	lsls r7, r6, #2
	movs r5, #0
_081A1FC4:
	ldr r0, _081A209C
	mov sl, r0
	ldrb r0, [r0]
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r1, #0x52
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _081A20A8
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #9
	bls _081A1FC4
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #4
	bl PyramidPrintPrevOrCurrentStreak
	ldr r1, _081A20AC
	mov r8, r1
	ldr r4, _081A20B0
	ldr r0, [r4]
	ldr r1, _081A20B4
	adds r0, r0, r1
	adds r0, r0, r7
	ldrh r2, [r0]
	movs r0, #6
	str r0, [sp]
	mov r0, r8
	ldr r1, _081A20B8
	movs r3, #0xa
	bl PrintTwoStrings
	ldr r5, _081A20BC
	ldr r0, _081A20C0
	mov sb, r0
	ldr r0, [r4]
	ldr r1, _081A20C4
	adds r0, r0, r1
	adds r0, r0, r7
	ldrh r2, [r0]
	movs r0, #8
	str r0, [sp]
	adds r0, r5, #0
	mov r1, sb
	movs r3, #0xa
	bl PrintTwoStrings
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0xa
	movs r3, #0xc
	bl PyramidPrintPrevOrCurrentStreak
	ldr r0, [r4]
	ldr r1, _081A20C8
	adds r0, r0, r1
	adds r0, r0, r7
	ldrh r2, [r0]
	movs r0, #0xe
	str r0, [sp]
	mov r0, r8
	ldr r1, _081A20B8
	movs r3, #0xa
	bl PrintTwoStrings
	ldr r0, [r4]
	ldr r1, _081A20CC
	adds r0, r0, r1
	adds r0, r0, r7
	ldrh r2, [r0]
	movs r0, #0x10
	str r0, [sp]
	adds r0, r5, #0
	mov r1, sb
	movs r3, #0xa
	bl PrintTwoStrings
	mov r1, sl
	ldrb r0, [r1]
	bl PutWindowTilemap
	mov r1, sl
	ldrb r0, [r1]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2094: .4byte 0x02021C7C
_081A2098: .4byte 0x085DD363
_081A209C: .4byte 0x0203A840
_081A20A0: .4byte 0x085DD40E
_081A20A4: .4byte 0x085DD415
_081A20A8: .4byte 0x085DD2E8
_081A20AC: .4byte 0x085DD42A
_081A20B0: .4byte 0x03005AF0
_081A20B4: .4byte 0x00000D14
_081A20B8: .4byte 0x085DD447
_081A20BC: .4byte 0x085DD442
_081A20C0: .4byte 0x085DD44D
_081A20C4: .4byte 0x00000D1C
_081A20C8: .4byte 0x00000D16
_081A20CC: .4byte 0x00000D1E
	thumb_func_end ShowDomeResultsWindow

	thumb_func_start PalacePrintStreak
PalacePrintStreak: @ 0x081A20D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	ldr r0, _081A2154
	mov sb, r0
	ldrb r0, [r0]
	lsls r4, r2, #0x1b
	lsrs r4, r4, #0x18
	lsrs r3, r3, #0x15
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	str r5, [sp]
	movs r7, #0
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	mov r2, ip
	adds r3, r4, #0
	bl AddTextPrinterParameterized
	ldr r0, _081A2158
	cmp r6, r0
	bls _081A2114
	adds r6, r0, #0
_081A2114:
	ldr r0, _081A215C
	adds r1, r6, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _081A2160
	ldr r1, _081A2164
	adds r0, r4, #0
	bl StringExpandPlaceholders
	mov r1, sb
	ldrb r0, [r1]
	mov r3, r8
	adds r3, #6
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2154: .4byte 0x0203A840
_081A2158: .4byte 0x0000270F
_081A215C: .4byte 0x02021C40
_081A2160: .4byte 0x02021C7C
_081A2164: .4byte 0x085DD41D
	thumb_func_end PalacePrintStreak

	thumb_func_start PalacePrintRecordStreak
PalacePrintRecordStreak: @ 0x081A2168
	push {r4, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r4, _081A2198
	ldr r4, [r4]
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	movs r0, #0xdd
	lsls r0, r0, #4
	adds r4, r4, r0
	adds r4, r4, r1
	ldrh r1, [r4]
	ldr r0, _081A219C
	bl PalacePrintStreak
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A2198: .4byte 0x03005AF0
_081A219C: .4byte 0x085DD42A
	thumb_func_end PalacePrintRecordStreak

	thumb_func_start FactoryGetRentsCount
FactoryGetRentsCount: @ 0x081A21A0
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _081A21C4
	ldr r2, [r2]
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r0, _081A21C8
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	ldr r1, _081A21CC
	cmp r0, r1
	bls _081A21C0
	adds r0, r1, #0
_081A21C0:
	pop {r1}
	bx r1
	.align 2, 0
_081A21C4: .4byte 0x03005AF0
_081A21C8: .4byte 0x00000DC8
_081A21CC: .4byte 0x0000270F
	thumb_func_end FactoryGetRentsCount

	thumb_func_start ArenaPrintPrevOrCurrentStreak
ArenaPrintPrevOrCurrentStreak: @ 0x081A21D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	adds r0, r4, #0
	adds r1, r5, #0
	bl FactoryGetRentsCount
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r4, #0
	beq _081A21FC
	cmp r4, #1
	beq _081A2208
_081A21FC:
	cmp r5, #0
	beq _081A2204
	movs r0, #0x20
	b _081A2216
_081A2204:
	movs r0, #0x10
	b _081A2216
_081A2208:
	cmp r5, #0
	beq _081A2212
	movs r0, #0x80
	lsls r0, r0, #0x10
	b _081A2216
_081A2212:
	movs r0, #0x80
	lsls r0, r0, #0xf
_081A2216:
	bl sub_081A1ACC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081A2234
	ldr r0, _081A2230
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl PalacePrintStreak
	b _081A2240
	.align 2, 0
_081A2230: .4byte 0x085DD425
_081A2234:
	ldr r0, _081A224C
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl PalacePrintStreak
_081A2240:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A224C: .4byte 0x085DD42F
	thumb_func_end ArenaPrintPrevOrCurrentStreak

	thumb_func_start ShowPalaceResultsWindow
ShowPalaceResultsWindow: @ 0x081A2250
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _081A2280
	ldr r0, _081A2284
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	cmp r7, #0
	bne _081A2290
	ldr r0, _081A2288
	ldr r1, _081A228C
	bl StringExpandPlaceholders
	b _081A2298
	.align 2, 0
_081A2280: .4byte 0x0203A840
_081A2284: .4byte 0x085DD2B0
_081A2288: .4byte 0x02021C7C
_081A228C: .4byte 0x085DD37B
_081A2290:
	ldr r0, _081A2348
	ldr r1, _081A234C
	bl StringExpandPlaceholders
_081A2298:
	ldr r5, _081A2350
	ldrb r0, [r5]
	ldr r2, _081A2348
	movs r1, #0x12
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2354
	movs r1, #0x32
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2358
	movs r1, #0x62
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	movs r5, #0
_081A22DA:
	ldr r6, _081A2350
	ldrb r0, [r6]
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r1, #0x52
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _081A235C
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa
	bls _081A22DA
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xb
	movs r3, #6
	bl ArenaPrintPrevOrCurrentStreak
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xb
	movs r3, #8
	bl PalacePrintRecordStreak
	adds r0, r7, #0
	movs r1, #1
	movs r2, #0xb
	movs r3, #0xc
	bl ArenaPrintPrevOrCurrentStreak
	adds r0, r7, #0
	movs r1, #1
	movs r2, #0xb
	movs r3, #0xe
	bl PalacePrintRecordStreak
	ldrb r0, [r6]
	bl PutWindowTilemap
	ldrb r0, [r6]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2348: .4byte 0x02021C7C
_081A234C: .4byte 0x085DD391
_081A2350: .4byte 0x0203A840
_081A2354: .4byte 0x085DD40E
_081A2358: .4byte 0x085DD415
_081A235C: .4byte 0x085DD2E8
	thumb_func_end ShowPalaceResultsWindow

	thumb_func_start ArenaGetWinStreak
ArenaGetWinStreak: @ 0x081A2360
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _081A2380
	ldr r1, [r1]
	lsrs r0, r0, #0x17
	ldr r2, _081A2384
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _081A2388
	cmp r0, r1
	bls _081A237A
	adds r0, r1, #0
_081A237A:
	pop {r1}
	bx r1
	.align 2, 0
_081A2380: .4byte 0x03005AF0
_081A2384: .4byte 0x00000E04
_081A2388: .4byte 0x0000270F
	thumb_func_end ArenaGetWinStreak

	thumb_func_start PikePrintCleared
PikePrintCleared: @ 0x081A238C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x2c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	ldr r0, _081A2414
	mov sb, r0
	ldrb r0, [r0]
	lsls r3, r5, #0x1b
	lsrs r3, r3, #0x18
	lsrs r4, r4, #0x15
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	mov r2, sl
	bl AddTextPrinterParameterized
	ldr r0, _081A2418
	adds r1, r6, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r6, _081A241C
	adds r0, r6, #0
	adds r1, r7, #0
	bl StringExpandPlaceholders
	mov r1, sb
	ldrb r0, [r1]
	adds r5, #5
	lsls r5, r5, #0x1b
	lsrs r5, r5, #0x18
	str r4, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2414: .4byte 0x0203A840
_081A2418: .4byte 0x02021C40
_081A241C: .4byte 0x02021C7C
	thumb_func_end PikePrintCleared

	thumb_func_start PikePrintPrevOrCurrentStreak
PikePrintPrevOrCurrentStreak: @ 0x081A2420
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r0, r4, #0
	bl ArenaGetWinStreak
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r4, #0
	beq _081A2446
	movs r0, #0x80
	lsls r0, r0, #4
	b _081A244A
_081A2446:
	movs r0, #0x80
	lsls r0, r0, #3
_081A244A:
	bl sub_081A1ACC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081A2470
	ldr r0, _081A2468
	ldr r1, _081A246C
	str r5, [sp]
	adds r2, r6, #0
	adds r3, r7, #0
	bl PrintTwoStrings
	b _081A247E
	.align 2, 0
_081A2468: .4byte 0x085DD425
_081A246C: .4byte 0x085DD458
_081A2470:
	ldr r0, _081A2488
	ldr r1, _081A248C
	str r5, [sp]
	adds r2, r6, #0
	adds r3, r7, #0
	bl PrintTwoStrings
_081A247E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2488: .4byte 0x085DD42F
_081A248C: .4byte 0x085DD458
	thumb_func_end PikePrintPrevOrCurrentStreak

	thumb_func_start ShowPikeResultsWindow
ShowPikeResultsWindow: @ 0x081A2490
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r5, _081A25BC
	ldr r0, _081A25C0
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r5]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r6, _081A25C4
	ldr r1, _081A25C8
	adds r0, r6, #0
	bl StringExpandPlaceholders
	ldrb r0, [r5]
	movs r1, #2
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	movs r3, #0x28
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A25CC
	movs r1, #0x22
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A25D0
	movs r1, #0x62
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r5, #0
_081A24FE:
	ldr r7, _081A25BC
	ldrb r0, [r7]
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r1, #0x52
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _081A25D4
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa
	bls _081A24FE
	movs r0, #0
	movs r1, #0xb
	movs r2, #4
	bl PikePrintPrevOrCurrentStreak
	ldr r0, _081A25D8
	mov r8, r0
	ldr r1, _081A25DC
	mov sb, r1
	ldr r4, _081A25E0
	ldr r0, [r4]
	ldr r1, _081A25E4
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #6
	str r0, [sp]
	mov r0, r8
	mov r1, sb
	movs r3, #0xb
	bl PikePrintCleared
	ldr r5, _081A25E8
	ldr r6, _081A25EC
	ldr r0, [r4]
	ldr r1, _081A25F0
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #8
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xb
	bl PikePrintCleared
	movs r0, #1
	movs r1, #0xb
	movs r2, #0xc
	bl PikePrintPrevOrCurrentStreak
	ldr r0, [r4]
	ldr r1, _081A25F4
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #0xe
	str r0, [sp]
	mov r0, r8
	mov r1, sb
	movs r3, #0xb
	bl PikePrintCleared
	ldr r0, [r4]
	ldr r1, _081A25F8
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #0x10
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xb
	bl PikePrintCleared
	ldrb r0, [r7]
	bl PutWindowTilemap
	ldrb r0, [r7]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A25BC: .4byte 0x0203A840
_081A25C0: .4byte 0x085DD2B8
_081A25C4: .4byte 0x02021C7C
_081A25C8: .4byte 0x085DD3A6
_081A25CC: .4byte 0x085DD40E
_081A25D0: .4byte 0x085DD415
_081A25D4: .4byte 0x085DD2E8
_081A25D8: .4byte 0x085DD42A
_081A25DC: .4byte 0x085DD458
_081A25E0: .4byte 0x03005AF0
_081A25E4: .4byte 0x00000E08
_081A25E8: .4byte 0x085DD442
_081A25EC: .4byte 0x085DD461
_081A25F0: .4byte 0x00000E0C
_081A25F4: .4byte 0x00000E0A
_081A25F8: .4byte 0x00000E0E
	thumb_func_end ShowPikeResultsWindow

	thumb_func_start ArenaPrintStreak
ArenaPrintStreak: @ 0x081A25FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	ldr r0, _081A2684
	mov sb, r0
	ldrb r0, [r0]
	lsls r4, r2, #0x1b
	lsrs r4, r4, #0x18
	lsrs r3, r3, #0x15
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	str r5, [sp]
	movs r7, #0
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	mov r2, ip
	adds r3, r4, #0
	bl AddTextPrinterParameterized
	ldr r0, _081A2688
	cmp r6, r0
	bls _081A2640
	adds r6, r0, #0
_081A2640:
	ldr r0, _081A268C
	adds r1, r6, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _081A2690
	ldr r1, _081A2694
	adds r0, r4, #0
	bl StringExpandPlaceholders
	mov r1, sb
	ldrb r0, [r1]
	mov r1, r8
	lsls r3, r1, #0x1b
	movs r1, #0xc0
	lsls r1, r1, #0x16
	adds r3, r3, r1
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2684: .4byte 0x0203A840
_081A2688: .4byte 0x0000270F
_081A268C: .4byte 0x02021C40
_081A2690: .4byte 0x02021C7C
_081A2694: .4byte 0x085DD46A
	thumb_func_end ArenaPrintStreak

	thumb_func_start ArenaPrintRecordStreak
ArenaPrintRecordStreak: @ 0x081A2698
	push {r4, lr}
	adds r4, r1, #0
	adds r3, r2, #0
	lsls r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, _081A26C4
	ldr r1, [r1]
	lsrs r0, r0, #0x17
	ldr r2, _081A26C8
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r0, _081A26CC
	adds r2, r4, #0
	bl ArenaPrintStreak
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A26C4: .4byte 0x03005AF0
_081A26C8: .4byte 0x00000DDE
_081A26CC: .4byte 0x085DD42A
	thumb_func_end ArenaPrintRecordStreak

	thumb_func_start PikeGetWinStreak
PikeGetWinStreak: @ 0x081A26D0
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _081A26F0
	ldr r1, [r1]
	lsrs r0, r0, #0x17
	ldr r2, _081A26F4
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _081A26F8
	cmp r0, r1
	bls _081A26EA
	adds r0, r1, #0
_081A26EA:
	pop {r1}
	bx r1
	.align 2, 0
_081A26F0: .4byte 0x03005AF0
_081A26F4: .4byte 0x00000DDA
_081A26F8: .4byte 0x0000270F
	thumb_func_end PikeGetWinStreak

	thumb_func_start sub_081A26FC
sub_081A26FC: @ 0x081A26FC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	adds r0, r4, #0
	bl PikeGetWinStreak
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r4, #0
	beq _081A271E
	movs r0, #0x80
	b _081A2720
_081A271E:
	movs r0, #0x40
_081A2720:
	bl sub_081A1ACC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081A2740
	ldr r0, _081A273C
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ArenaPrintStreak
	b _081A274C
	.align 2, 0
_081A273C: .4byte 0x085DD425
_081A2740:
	ldr r0, _081A2754
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ArenaPrintStreak
_081A274C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2754: .4byte 0x085DD42F
	thumb_func_end sub_081A26FC

	thumb_func_start ShowArenaResultsWindow
ShowArenaResultsWindow: @ 0x081A2758
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, _081A2828
	ldr r0, _081A282C
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r4, #0
	movs r5, #0
_081A277A:
	ldr r6, _081A2828
	ldrb r0, [r6]
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r1, #0x52
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _081A2830
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #9
	bls _081A277A
	ldr r5, _081A2834
	ldr r1, _081A2838
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldrb r0, [r6]
	movs r1, #0x10
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x10
	bl AddTextPrinterParameterized
	ldrb r0, [r6]
	ldr r2, _081A283C
	movs r1, #0x30
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	ldrb r0, [r6]
	ldr r2, _081A2840
	movs r1, #0x60
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #0xb
	movs r2, #6
	bl sub_081A26FC
	movs r0, #0
	movs r1, #0xb
	movs r2, #8
	bl ArenaPrintRecordStreak
	movs r0, #1
	movs r1, #0xb
	movs r2, #0xc
	bl sub_081A26FC
	movs r0, #1
	movs r1, #0xb
	movs r2, #0xe
	bl ArenaPrintRecordStreak
	ldrb r0, [r6]
	bl PutWindowTilemap
	ldrb r0, [r6]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A2828: .4byte 0x0203A840
_081A282C: .4byte 0x085DD2C0
_081A2830: .4byte 0x085DD2E8
_081A2834: .4byte 0x02021C7C
_081A2838: .4byte 0x085DD3B7
_081A283C: .4byte 0x085DD40E
_081A2840: .4byte 0x085DD415
	thumb_func_end ShowArenaResultsWindow

	thumb_func_start FactoryPrintStreak
FactoryPrintStreak: @ 0x081A2844
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	ldr r4, [sp, #0x30]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r5, r3, #0
	lsls r4, r4, #0x18
	ldr r0, _081A290C
	mov sb, r0
	ldrb r0, [r0]
	lsls r3, r5, #0x1b
	lsrs r3, r3, #0x18
	lsrs r4, r4, #0x15
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	str r7, [sp]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	mov r2, ip
	bl AddTextPrinterParameterized
	ldr r0, _081A2910
	cmp r6, r0
	bls _081A2892
	adds r6, r0, #0
_081A2892:
	ldr r0, _081A2914
	mov sl, r0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _081A2918
	ldr r1, _081A291C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	mov r1, sb
	ldrb r0, [r1]
	lsls r3, r5, #0x1b
	movs r1, #0xc0
	lsls r1, r1, #0x16
	adds r3, r3, r1
	lsrs r3, r3, #0x18
	str r7, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
	mov r0, sl
	ldr r1, [sp, #0xc]
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r1, _081A2920
	adds r0, r4, #0
	bl StringExpandPlaceholders
	mov r1, sb
	ldrb r0, [r1]
	lsls r3, r5, #0x1b
	movs r1, #0x98
	lsls r1, r1, #0x18
	adds r3, r3, r1
	lsrs r3, r3, #0x18
	str r7, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A290C: .4byte 0x0203A840
_081A2910: .4byte 0x0000270F
_081A2914: .4byte 0x02021C40
_081A2918: .4byte 0x02021C7C
_081A291C: .4byte 0x085DD41D
_081A2920: .4byte 0x085DD471
	thumb_func_end FactoryPrintStreak

	thumb_func_start PyramidPrintRecordStreak
PyramidPrintRecordStreak: @ 0x081A2924
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _081A2964
	ldr r2, [r2]
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r5, _081A2968
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r0, _081A296C
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r2, [r2]
	ldr r0, _081A2970
	str r3, [sp]
	adds r1, r5, #0
	adds r3, r4, #0
	bl FactoryPrintStreak
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A2964: .4byte 0x03005AF0
_081A2968: .4byte 0x00000DEA
_081A296C: .4byte 0x00000DFA
_081A2970: .4byte 0x085DD42A
	thumb_func_end PyramidPrintRecordStreak

	thumb_func_start FactoryGetWinStreak
FactoryGetWinStreak: @ 0x081A2974
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _081A2998
	ldr r2, [r2]
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r0, _081A299C
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	ldr r1, _081A29A0
	cmp r0, r1
	bls _081A2994
	adds r0, r1, #0
_081A2994:
	pop {r1}
	bx r1
	.align 2, 0
_081A2998: .4byte 0x03005AF0
_081A299C: .4byte 0x00000DE2
_081A29A0: .4byte 0x0000270F
	thumb_func_end FactoryGetWinStreak

	thumb_func_start PalaceGetWinStreak
PalaceGetWinStreak: @ 0x081A29A4
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _081A29C8
	ldr r2, [r2]
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r0, _081A29CC
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	ldr r1, _081A29D0
	cmp r0, r1
	bls _081A29C4
	adds r0, r1, #0
_081A29C4:
	pop {r1}
	bx r1
	.align 2, 0
_081A29C8: .4byte 0x03005AF0
_081A29CC: .4byte 0x00000DF2
_081A29D0: .4byte 0x0000270F
	thumb_func_end PalaceGetWinStreak

	thumb_func_start PalacePrintPrevOrCurrentStreak
PalacePrintPrevOrCurrentStreak: @ 0x081A29D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	adds r0, r4, #0
	adds r1, r5, #0
	bl FactoryGetWinStreak
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl PalaceGetWinStreak
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r4, #0
	beq _081A2A12
	cmp r4, #1
	beq _081A2A22
_081A2A12:
	cmp r5, #0
	beq _081A2A1C
	movs r0, #0x80
	lsls r0, r0, #2
	b _081A2A30
_081A2A1C:
	movs r0, #0x80
	lsls r0, r0, #1
	b _081A2A30
_081A2A22:
	cmp r5, #0
	beq _081A2A2C
	movs r0, #0x80
	lsls r0, r0, #0x12
	b _081A2A30
_081A2A2C:
	movs r0, #0x80
	lsls r0, r0, #0x11
_081A2A30:
	bl sub_081A1ACC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081A2A54
	ldr r0, _081A2A50
	mov r1, r8
	str r1, [sp]
	adds r1, r7, #0
	adds r2, r6, #0
	mov r3, sb
	bl FactoryPrintStreak
	b _081A2A64
	.align 2, 0
_081A2A50: .4byte 0x085DD425
_081A2A54:
	ldr r0, _081A2A74
	mov r1, r8
	str r1, [sp]
	adds r1, r7, #0
	adds r2, r6, #0
	mov r3, sb
	bl FactoryPrintStreak
_081A2A64:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2A74: .4byte 0x085DD42F
	thumb_func_end PalacePrintPrevOrCurrentStreak

	thumb_func_start ShowFactoryResultsWindow
ShowFactoryResultsWindow: @ 0x081A2A78
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _081A2AA8
	ldr r0, _081A2AAC
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	cmp r7, #0
	bne _081A2AB8
	ldr r0, _081A2AB0
	ldr r1, _081A2AB4
	bl StringExpandPlaceholders
	b _081A2AC0
	.align 2, 0
_081A2AA8: .4byte 0x0203A840
_081A2AAC: .4byte 0x085DD2C8
_081A2AB0: .4byte 0x02021C7C
_081A2AB4: .4byte 0x085DD3CC
_081A2AB8:
	ldr r0, _081A2B80
	ldr r1, _081A2B84
	bl StringExpandPlaceholders
_081A2AC0:
	ldr r5, _081A2B88
	ldrb r0, [r5]
	ldr r2, _081A2B80
	movs r1, #2
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2B8C
	movs r6, #0x22
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2B90
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x80
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2B94
	movs r1, #0x62
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r5, #0
_081A2B14:
	ldr r6, _081A2B88
	ldrb r0, [r6]
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r1, #0x52
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _081A2B98
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #9
	bls _081A2B14
	adds r0, r7, #0
	movs r1, #0
	movs r2, #1
	movs r3, #6
	bl PalacePrintPrevOrCurrentStreak
	adds r0, r7, #0
	movs r1, #0
	movs r2, #1
	movs r3, #8
	bl PyramidPrintRecordStreak
	adds r0, r7, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0xe
	bl PalacePrintPrevOrCurrentStreak
	adds r0, r7, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0x10
	bl PyramidPrintRecordStreak
	ldrb r0, [r6]
	bl PutWindowTilemap
	ldrb r0, [r6]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2B80: .4byte 0x02021C7C
_081A2B84: .4byte 0x085DD3E3
_081A2B88: .4byte 0x0203A840
_081A2B8C: .4byte 0x085DD40E
_081A2B90: .4byte 0x085DD438
_081A2B94: .4byte 0x085DD415
_081A2B98: .4byte 0x085DD2E8
	thumb_func_end ShowFactoryResultsWindow

	thumb_func_start PyramidPrintStreak
PyramidPrintStreak: @ 0x081A2B9C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	ldr r0, _081A2C24
	mov sb, r0
	ldrb r0, [r0]
	lsls r4, r2, #0x1b
	lsrs r4, r4, #0x18
	lsrs r3, r3, #0x15
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	str r5, [sp]
	movs r7, #0
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	mov r2, ip
	adds r3, r4, #0
	bl AddTextPrinterParameterized
	ldr r0, _081A2C28
	cmp r6, r0
	bls _081A2BE0
	adds r6, r0, #0
_081A2BE0:
	ldr r0, _081A2C2C
	adds r1, r6, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _081A2C30
	ldr r1, _081A2C34
	adds r0, r4, #0
	bl StringExpandPlaceholders
	mov r1, sb
	ldrb r0, [r1]
	mov r1, r8
	lsls r3, r1, #0x1b
	movs r1, #0xc0
	lsls r1, r1, #0x16
	adds r3, r3, r1
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2C24: .4byte 0x0203A840
_081A2C28: .4byte 0x0000270F
_081A2C2C: .4byte 0x02021C40
_081A2C30: .4byte 0x02021C7C
_081A2C34: .4byte 0x085DD476
	thumb_func_end PyramidPrintStreak

	thumb_func_start PyramidGetWinStreak
PyramidGetWinStreak: @ 0x081A2C38
	push {r4, lr}
	adds r4, r1, #0
	adds r3, r2, #0
	lsls r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, _081A2C64
	ldr r1, [r1]
	lsrs r0, r0, #0x17
	ldr r2, _081A2C68
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r0, _081A2C6C
	adds r2, r4, #0
	bl PyramidPrintStreak
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A2C64: .4byte 0x03005AF0
_081A2C68: .4byte 0x00000E1E
_081A2C6C: .4byte 0x085DD42A
	thumb_func_end PyramidGetWinStreak

	thumb_func_start sub_081A2C70
sub_081A2C70: @ 0x081A2C70
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _081A2C90
	ldr r1, [r1]
	lsrs r0, r0, #0x17
	ldr r2, _081A2C94
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _081A2C98
	cmp r0, r1
	bls _081A2C8A
	adds r0, r1, #0
_081A2C8A:
	pop {r1}
	bx r1
	.align 2, 0
_081A2C90: .4byte 0x03005AF0
_081A2C94: .4byte 0x00000E1A
_081A2C98: .4byte 0x0000270F
	thumb_func_end sub_081A2C70

	thumb_func_start sub_081A2C9C
sub_081A2C9C: @ 0x081A2C9C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	adds r0, r4, #0
	bl sub_081A2C70
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r4, #0
	beq _081A2CC0
	movs r0, #0x80
	lsls r0, r0, #6
	b _081A2CC4
_081A2CC0:
	movs r0, #0x80
	lsls r0, r0, #5
_081A2CC4:
	bl sub_081A1ACC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081A2CE4
	ldr r0, _081A2CE0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl PyramidPrintStreak
	b _081A2CF0
	.align 2, 0
_081A2CE0: .4byte 0x085DD425
_081A2CE4:
	ldr r0, _081A2CF8
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl PyramidPrintStreak
_081A2CF0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2CF8: .4byte 0x085DD42F
	thumb_func_end sub_081A2C9C

	thumb_func_start ShowPyramidResultsWindow
ShowPyramidResultsWindow: @ 0x081A2CFC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r5, _081A2DC8
	ldr r0, _081A2DCC
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r5]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r6, _081A2DD0
	ldr r1, _081A2DD4
	adds r0, r6, #0
	bl StringExpandPlaceholders
	ldrb r0, [r5]
	movs r1, #0x12
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	movs r3, #0x18
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2DD8
	movs r1, #0x32
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2DDC
	movs r1, #0x62
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	movs r5, #0
_081A2D64:
	ldr r6, _081A2DC8
	ldrb r0, [r6]
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r1, #0x52
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _081A2DE0
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa
	bls _081A2D64
	movs r0, #0
	movs r1, #0xa
	movs r2, #6
	bl sub_081A2C9C
	movs r0, #0
	movs r1, #0xa
	movs r2, #8
	bl PyramidGetWinStreak
	movs r0, #1
	movs r1, #0xa
	movs r2, #0xc
	bl sub_081A2C9C
	movs r0, #1
	movs r1, #0xa
	movs r2, #0xe
	bl PyramidGetWinStreak
	ldrb r0, [r6]
	bl PutWindowTilemap
	ldrb r0, [r6]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A2DC8: .4byte 0x0203A840
_081A2DCC: .4byte 0x085DD2D0
_081A2DD0: .4byte 0x02021C7C
_081A2DD4: .4byte 0x085DD3F9
_081A2DD8: .4byte 0x085DD40E
_081A2DDC: .4byte 0x085DD415
_081A2DE0: .4byte 0x085DD2E8
	thumb_func_end ShowPyramidResultsWindow

	thumb_func_start PrintHallRecords
PrintHallRecords: @ 0x081A2DE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r5, _081A2F54
	ldr r0, _081A2F58
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r5]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _081A2F5C
	mov r8, r0
	ldr r1, _081A2F60
	bl StringExpandPlaceholders
	ldrb r0, [r5]
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	mov r2, r8
	movs r3, #0x10
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2F64
	movs r6, #0x20
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x48
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2F68
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x70
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2F6C
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x98
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2F70
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0xc0
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2F74
	movs r1, #0x30
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2F78
	movs r1, #0x40
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2F7C
	movs r1, #0x50
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2F80
	movs r1, #0x60
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A2F84
	movs r1, #0x70
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r1, #0
	mov sl, r8
_081A2EDA:
	adds r2, r1, #1
	mov sb, r2
	lsls r0, r1, #0x1c
	movs r2, #0xc0
	lsls r2, r2, #0x16
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r6, #0xe0
	lsls r6, r6, #0x16
	lsls r4, r1, #3
	movs r5, #3
_081A2EF2:
	ldr r0, _081A2F88
	ldr r0, [r0]
	ldr r1, _081A2F8C
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r1, [r0]
	mov r0, sl
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r7, _081A2F54
	ldrb r0, [r7]
	lsrs r3, r6, #0x18
	mov r2, r8
	str r2, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	mov r2, sl
	bl AddTextPrinterParameterized
	movs r0, #0xa0
	lsls r0, r0, #0x16
	adds r6, r6, r0
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _081A2EF2
	mov r1, sb
	cmp r1, #4
	ble _081A2EDA
	ldrb r0, [r7]
	bl PutWindowTilemap
	ldrb r0, [r7]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A2F54: .4byte 0x0203A840
_081A2F58: .4byte 0x085DD2D8
_081A2F5C: .4byte 0x02021C7C
_081A2F60: .4byte 0x085CCEA5
_081A2F64: .4byte 0x085CCEB9
_081A2F68: .4byte 0x085CCEBC
_081A2F6C: .4byte 0x085CCEBF
_081A2F70: .4byte 0x085CCEC2
_081A2F74: .4byte 0x085CAC84
_081A2F78: .4byte 0x085CAC8A
_081A2F7C: .4byte 0x085CAC90
_081A2F80: .4byte 0x085CAC95
_081A2F84: .4byte 0x085CAC9A
_081A2F88: .4byte 0x03005AF0
_081A2F8C: .4byte 0x00000624
	thumb_func_end PrintHallRecords

	thumb_func_start sub_081A2F90
sub_081A2F90: @ 0x081A2F90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _081A2FD0
	ldr r0, [r0]
	ldr r1, _081A2FD4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _081A2FD8
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _081A2FDC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r4, #6
	bls _081A2FC4
	b _081A335E
_081A2FC4:
	lsls r0, r4, #2
	ldr r1, _081A2FE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A2FD0: .4byte 0x03005AF0
_081A2FD4: .4byte 0x00000CA9
_081A2FD8: .4byte 0x000040CF
_081A2FDC: .4byte 0x000040CE
_081A2FE0: .4byte 0x081A2FE4
_081A2FE4: @ jump table
	.4byte _081A3000 @ case 0
	.4byte _081A3138 @ case 1
	.4byte _081A31A0 @ case 2
	.4byte _081A3208 @ case 3
	.4byte _081A3258 @ case 4
	.4byte _081A32DA @ case 5
	.4byte _081A3324 @ case 6
_081A3000:
	ldr r2, _081A30D0
	mov r8, r2
	ldr r1, [r2]
	lsls r3, r5, #1
	lsls r4, r6, #2
	adds r2, r3, r4
	movs r7, #0xce
	lsls r7, r7, #4
	adds r0, r1, r7
	adds r0, r0, r2
	adds r7, #0x10
	adds r1, r1, r7
	adds r1, r1, r2
	ldrh r0, [r0]
	str r3, [sp]
	str r4, [sp, #8]
	ldrh r2, [r1]
	cmp r0, r2
	bhi _081A3028
	b _081A335E
_081A3028:
	strh r0, [r1]
	cmp r6, #3
	bne _081A309A
	movs r3, #0
	ldr r7, _081A30D4
	mov sl, r7
	lsls r0, r5, #2
	str r0, [sp, #4]
	mov sb, r8
	movs r1, #0x25
	add r1, sl
	mov ip, r1
	ldr r2, _081A30D8
	adds r2, #8
	mov r8, r2
	lsls r7, r5, #3
	ldr r4, _081A30DC
_081A304A:
	mov r0, sb
	ldr r2, [r0]
	adds r0, r3, r7
	adds r2, r2, r4
	adds r2, r2, r0
	mov r1, ip
	ldrb r0, [r1]
	movs r5, #1
	adds r1, r5, #0
	eors r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	cmp r3, #7
	ble _081A304A
	mov r0, sl
	adds r0, #0x25
	ldrb r0, [r0]
	adds r1, r5, #0
	eors r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081A30D8
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _081A30D0
	ldr r2, _081A30E0
	ldr r3, [sp, #4]
	adds r2, r3, r2
	ldr r1, [r1]
	adds r1, r1, r2
	bl SetTrainerId
_081A309A:
	ldr r4, _081A30D0
	ldr r0, [r4]
	ldr r5, [sp]
	ldr r7, [sp, #8]
	adds r1, r5, r7
	movs r7, #0xce
	lsls r7, r7, #4
	adds r0, r0, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #1
	bhi _081A30B4
	b _081A335E
_081A30B4:
	bl sub_080EF330
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A30C0
	b _081A335E
_081A30C0:
	cmp r6, #1
	beq _081A30FE
	cmp r6, #1
	bgt _081A30E4
	cmp r6, #0
	beq _081A30EE
	b _081A335E
	.align 2, 0
_081A30D0: .4byte 0x03005AF0
_081A30D4: .4byte 0x02024118
_081A30D8: .4byte 0x020226A0
_081A30DC: .4byte 0x00000EE1
_081A30E0: .4byte 0x00000EF1
_081A30E4:
	cmp r6, #2
	beq _081A3110
	cmp r6, #3
	beq _081A3124
	b _081A335E
_081A30EE:
	ldr r0, [r4]
	adds r0, r0, r7
	adds r0, r0, r5
	ldrh r0, [r0]
	movs r1, #1
	bl sub_080EF3E0
	b _081A335E
_081A30FE:
	ldr r0, [r4]
	adds r1, r5, #4
	adds r0, r0, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #2
	bl sub_080EF3E0
	b _081A335E
_081A3110:
	ldr r0, [r4]
	adds r1, r5, #0
	adds r1, #8
	adds r0, r0, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #3
	bl sub_080EF3E0
	b _081A335E
_081A3124:
	ldr r0, [r4]
	ldr r1, [sp]
	adds r1, #0xc
	adds r0, r0, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #4
	bl sub_080EF3E0
	b _081A335E
_081A3138:
	ldr r7, _081A3184
	ldr r0, [r7]
	lsls r5, r5, #1
	mov r8, r5
	lsls r1, r6, #2
	adds r4, r5, r1
	ldr r5, _081A3188
	adds r1, r0, r5
	adds r1, r1, r4
	ldr r2, _081A318C
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r2, [r1]
	ldrh r3, [r0]
	cmp r2, r3
	bhi _081A315A
	b _081A335E
_081A315A:
	strh r2, [r0]
	ldrh r0, [r1]
	cmp r0, #1
	bhi _081A3164
	b _081A335E
_081A3164:
	bl sub_080EF330
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A3170
	b _081A335E
_081A3170:
	cmp r6, #0
	bne _081A3190
	ldr r0, [r7]
	adds r0, r0, r5
	add r0, r8
	ldrh r0, [r0]
	movs r1, #5
	bl sub_080EF3E0
	b _081A335E
	.align 2, 0
_081A3184: .4byte 0x03005AF0
_081A3188: .4byte 0x00000D0C
_081A318C: .4byte 0x00000D14
_081A3190:
	ldr r0, [r7]
	adds r0, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #6
	bl sub_080EF3E0
	b _081A335E
_081A31A0:
	ldr r7, _081A31F0
	ldr r0, [r7]
	lsls r5, r5, #1
	mov r8, r5
	lsls r1, r6, #2
	adds r4, r5, r1
	ldr r5, _081A31F4
	adds r1, r0, r5
	adds r1, r1, r4
	movs r2, #0xdd
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r2, [r1]
	ldrh r3, [r0]
	cmp r2, r3
	bhi _081A31C4
	b _081A335E
_081A31C4:
	strh r2, [r0]
	ldrh r0, [r1]
	cmp r0, #1
	bhi _081A31CE
	b _081A335E
_081A31CE:
	bl sub_080EF330
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A31DA
	b _081A335E
_081A31DA:
	cmp r6, #0
	bne _081A31F8
	ldr r0, [r7]
	adds r0, r0, r5
	add r0, r8
	ldrh r0, [r0]
	movs r1, #0xb
	bl sub_080EF3E0
	b _081A335E
	.align 2, 0
_081A31F0: .4byte 0x03005AF0
_081A31F4: .4byte 0x00000DC8
_081A31F8:
	ldr r0, [r7]
	adds r0, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #0xc
	bl sub_080EF3E0
	b _081A335E
_081A3208:
	ldr r6, _081A324C
	ldr r1, [r6]
	lsls r4, r5, #1
	ldr r5, _081A3250
	adds r0, r1, r5
	adds r0, r0, r4
	ldr r7, _081A3254
	adds r1, r1, r7
	adds r1, r1, r4
	ldrh r2, [r0]
	ldrh r3, [r1]
	cmp r2, r3
	bhi _081A3224
	b _081A335E
_081A3224:
	strh r2, [r1]
	ldrh r0, [r0]
	cmp r0, #1
	bhi _081A322E
	b _081A335E
_081A322E:
	bl sub_080EF330
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A323A
	b _081A335E
_081A323A:
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #0xa
	bl sub_080EF3E0
	b _081A335E
	.align 2, 0
_081A324C: .4byte 0x03005AF0
_081A3250: .4byte 0x00000DDA
_081A3254: .4byte 0x00000DDE
_081A3258:
	ldr r7, _081A32B4
	mov sb, r7
	mov r0, sb
	ldr r2, [r0]
	lsls r5, r5, #1
	mov r8, r5
	lsls r0, r6, #2
	adds r4, r5, r0
	ldr r5, _081A32B8
	adds r0, r2, r5
	adds r3, r0, r4
	ldr r1, _081A32BC
	adds r0, r2, r1
	adds r0, r0, r4
	ldrh r1, [r3]
	ldrh r7, [r0]
	cmp r1, r7
	bls _081A335E
	strh r1, [r0]
	ldr r0, _081A32C0
	adds r1, r2, r0
	adds r1, r1, r4
	ldr r7, _081A32C4
	adds r0, r2, r7
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r3]
	cmp r0, #1
	bls _081A335E
	bl sub_080EF330
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A335E
	cmp r6, #0
	bne _081A32C8
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r5
	add r0, r8
	ldrh r0, [r0]
	movs r1, #7
	bl sub_080EF3E0
	b _081A335E
	.align 2, 0
_081A32B4: .4byte 0x03005AF0
_081A32B8: .4byte 0x00000DE2
_081A32BC: .4byte 0x00000DEA
_081A32C0: .4byte 0x00000DFA
_081A32C4: .4byte 0x00000DF2
_081A32C8:
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #8
	bl sub_080EF3E0
	b _081A335E
_081A32DA:
	ldr r6, _081A3318
	ldr r1, [r6]
	lsls r4, r5, #1
	ldr r5, _081A331C
	adds r0, r1, r5
	adds r0, r0, r4
	ldr r3, _081A3320
	adds r1, r1, r3
	adds r1, r1, r4
	ldrh r2, [r0]
	ldrh r7, [r1]
	cmp r2, r7
	bls _081A335E
	strh r2, [r1]
	ldrh r0, [r0]
	cmp r0, #1
	bls _081A335E
	bl sub_080EF330
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A335E
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #9
	bl sub_080EF3E0
	b _081A335E
	.align 2, 0
_081A3318: .4byte 0x03005AF0
_081A331C: .4byte 0x00000E04
_081A3320: .4byte 0x00000E08
_081A3324:
	ldr r6, _081A3370
	ldr r1, [r6]
	lsls r4, r5, #1
	ldr r5, _081A3374
	adds r0, r1, r5
	adds r0, r0, r4
	ldr r2, _081A3378
	adds r1, r1, r2
	adds r1, r1, r4
	ldrh r2, [r0]
	ldrh r3, [r1]
	cmp r2, r3
	bls _081A335E
	strh r2, [r1]
	ldrh r0, [r0]
	cmp r0, #1
	bls _081A335E
	bl sub_080EF330
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A335E
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #0xd
	bl sub_080EF3E0
_081A335E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A3370: .4byte 0x03005AF0
_081A3374: .4byte 0x00000E1A
_081A3378: .4byte 0x00000E1E
	thumb_func_end sub_081A2F90

	thumb_func_start sub_081A337C
sub_081A337C: @ 0x081A337C
	push {r4, lr}
	ldr r0, _081A3398
	bl VarGet
	ldr r4, _081A339C
	bl sub_081A33A0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A3398: .4byte 0x000040CF
_081A339C: .4byte 0x02037290
	thumb_func_end sub_081A337C

	thumb_func_start sub_081A33A0
sub_081A33A0: @ 0x081A33A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r0, _081A33E0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _081A33E4
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl GetCurrentFacilityWinStreak
	lsls r0, r0, #0x10
	ldr r1, _081A33E8
	mov sb, r1
	lsls r7, r6, #2
	adds r1, #3
	adds r1, r7, r1
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	adds r5, r0, r1
	cmp r4, #0
	beq _081A33EC
	movs r0, #0
	b _081A3452
	.align 2, 0
_081A33E0: .4byte 0x000040CF
_081A33E4: .4byte 0x000040CE
_081A33E8: .4byte 0x085DCB7C
_081A33EC:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl GetPlayerSymbolCountForFacility
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	blt _081A3410
	cmp r1, #1
	bgt _081A3410
	adds r0, r1, r7
	add r0, sb
	ldrb r0, [r0]
	cmp r5, r0
	bne _081A344C
	adds r1, #1
	mov r8, r1
	b _081A344C
_081A3410:
	ldr r1, _081A3420
	lsls r2, r6, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r5, r0
	bne _081A3424
	movs r0, #3
	b _081A344A
	.align 2, 0
_081A3420: .4byte 0x085DCB7C
_081A3424:
	adds r0, r1, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r5, r0
	bne _081A3434
	movs r1, #4
	mov r8, r1
	b _081A344C
_081A3434:
	cmp r5, r0
	ble _081A344C
	subs r0, r5, r0
	adds r1, #2
	adds r1, r2, r1
	ldrb r1, [r1]
	bl __modsi3
	cmp r0, #0
	bne _081A344C
	movs r0, #4
_081A344A:
	mov r8, r0
_081A344C:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
_081A3452:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081A33A0

	thumb_func_start CopyFrontierTrainerText
CopyFrontierTrainerText: @ 0x081A3460
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	cmp r0, #1
	beq _081A34F6
	cmp r0, #1
	bgt _081A347A
	cmp r0, #0
	beq _081A3482
	b _081A368E
_081A347A:
	cmp r2, #2
	bne _081A3480
	b _081A35A8
_081A3480:
	b _081A368E
_081A3482:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r3, r0
	bne _081A349C
	ldr r0, _081A3494
	ldr r0, [r0]
	ldr r1, _081A3498
	b _081A3656
	.align 2, 0
_081A3494: .4byte 0x03005AF0
_081A3498: .4byte 0x00000BFC
_081A349C:
	ldr r0, _081A34BC
	cmp r3, r0
	beq _081A3516
	ldr r0, _081A34C0
	cmp r3, r0
	bhi _081A34C8
	ldr r2, _081A34C4
	movs r0, #0x34
	adds r1, r3, #0
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0xc
	bl FrontierSpeechToString
	b _081A368E
	.align 2, 0
_081A34BC: .4byte 0x000003FE
_081A34C0: .4byte 0x0000012B
_081A34C4: .4byte 0x0203B954
_081A34C8:
	ldr r0, _081A34DC
	cmp r3, r0
	bhi _081A34E8
	ldr r1, _081A34E0
	movs r0, #0xec
	muls r0, r3, r0
	ldr r1, [r1]
	adds r0, r0, r1
	ldr r1, _081A34E4
	b _081A3656
	.align 2, 0
_081A34DC: .4byte 0x0000018F
_081A34E0: .4byte 0x03005AF0
_081A34E4: .4byte 0xFFFEF2B8
_081A34E8:
	adds r0, r3, #0
	adds r0, #0x70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl CopyFriendsApprenticeChallengeText
	b _081A368E
_081A34F6:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r3, r0
	bne _081A3510
	ldr r0, _081A3508
	ldr r0, [r0]
	ldr r1, _081A350C
	b _081A3656
	.align 2, 0
_081A3508: .4byte 0x03005AF0
_081A350C: .4byte 0x00000C08
_081A3510:
	ldr r0, _081A3520
	cmp r3, r0
	bne _081A3524
_081A3516:
	movs r0, #0
	bl CopyFrontierBrainText
	b _081A368E
	.align 2, 0
_081A3520: .4byte 0x000003FE
_081A3524:
	ldr r0, _081A3540
	cmp r3, r0
	bhi _081A3548
	ldr r2, _081A3544
	movs r0, #0x34
	adds r1, r3, #0
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0x18
	bl FrontierSpeechToString
	b _081A368E
	.align 2, 0
_081A3540: .4byte 0x0000012B
_081A3544: .4byte 0x0203B954
_081A3548:
	ldr r0, _081A356C
	cmp r3, r0
	bhi _081A357C
	ldr r0, _081A3570
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _081A360C
	ldr r1, _081A3574
	movs r0, #0xec
	muls r0, r3, r0
	ldr r1, [r1]
	adds r0, r0, r1
	ldr r1, _081A3578
	b _081A3656
	.align 2, 0
_081A356C: .4byte 0x0000018F
_081A3570: .4byte 0x02022C90
_081A3574: .4byte 0x03005AF0
_081A3578: .4byte 0xFFFEF2C4
_081A357C:
	ldr r0, _081A359C
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _081A360C
	ldr r1, _081A35A0
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r0, r0, r1
	ldr r1, _081A35A4
	b _081A3656
	.align 2, 0
_081A359C: .4byte 0x02022C90
_081A35A0: .4byte 0x03005AF0
_081A35A4: .4byte 0xFFFF96C4
_081A35A8:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r3, r0
	bne _081A35C0
	ldr r0, _081A35B8
	ldr r0, [r0]
	ldr r1, _081A35BC
	b _081A3656
	.align 2, 0
_081A35B8: .4byte 0x03005AF0
_081A35BC: .4byte 0x00000C14
_081A35C0:
	ldr r0, _081A35D0
	cmp r3, r0
	bne _081A35D4
	movs r0, #1
	bl CopyFrontierBrainText
	b _081A368E
	.align 2, 0
_081A35D0: .4byte 0x000003FE
_081A35D4:
	ldr r0, _081A35F0
	cmp r3, r0
	bhi _081A35F8
	ldr r2, _081A35F4
	movs r0, #0x34
	adds r1, r3, #0
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0x24
	bl FrontierSpeechToString
	b _081A368E
	.align 2, 0
_081A35F0: .4byte 0x0000012B
_081A35F4: .4byte 0x0203B954
_081A35F8:
	ldr r0, _081A3618
	cmp r3, r0
	bhi _081A3638
	ldr r0, _081A361C
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _081A3620
_081A360C:
	bl GetRecordedBattleEasyChatSpeech
	bl FrontierSpeechToString
	b _081A368E
	.align 2, 0
_081A3618: .4byte 0x0000018F
_081A361C: .4byte 0x02022C90
_081A3620:
	ldr r1, _081A3630
	movs r0, #0xec
	muls r0, r3, r0
	ldr r1, [r1]
	adds r0, r0, r1
	ldr r1, _081A3634
	b _081A3656
	.align 2, 0
_081A3630: .4byte 0x03005AF0
_081A3634: .4byte 0xFFFEF2D0
_081A3638:
	ldr r0, _081A3660
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _081A3668
	bl GetTextSpeedInRecordedBattle
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	ldr r1, _081A3664
_081A3656:
	adds r0, r0, r1
	bl FrontierSpeechToString
	b _081A368E
	.align 2, 0
_081A3660: .4byte 0x02022C90
_081A3664: .4byte 0x085DC23E
_081A3668:
	ldr r0, _081A3694
	ldr r1, [r0]
	ldr r0, _081A3698
	adds r2, r3, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xdc
	ldrb r0, [r1]
	lsls r0, r0, #0x1b
	lsrs r3, r0, #0x1b
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	ldr r1, _081A369C
	adds r0, r0, r1
	bl FrontierSpeechToString
_081A368E:
	pop {r0}
	bx r0
	.align 2, 0
_081A3694: .4byte 0x03005AF0
_081A3698: .4byte 0xFFFFFE70
_081A369C: .4byte 0x085DC23E
	thumb_func_end CopyFrontierTrainerText

	thumb_func_start sub_081A36A0
sub_081A36A0: @ 0x081A36A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _081A3744
	ldr r1, [r0]
	ldr r2, _081A3748
	adds r1, r1, r2
	movs r2, #0
	str r2, [r1]
	movs r4, #0
	mov sb, r0
	mov r8, sb
	movs r6, #0
_081A36BE:
	movs r5, #0
	lsls r7, r4, #2
	mov sl, r7
	adds r0, r4, #1
	mov ip, r0
_081A36C8:
	mov r1, r8
	ldr r2, [r1]
	lsls r3, r5, #1
	mov r7, sl
	adds r1, r3, r7
	movs r7, #0xce
	lsls r7, r7, #4
	adds r0, r2, r7
	adds r0, r0, r1
	strh r6, [r0]
	cmp r4, #1
	bgt _081A36F8
	adds r7, #0x2c
	adds r0, r2, r7
	adds r0, r0, r1
	strh r6, [r0]
	adds r7, #0xbc
	adds r0, r2, r7
	adds r0, r0, r1
	strh r6, [r0]
	adds r7, #0x1a
	adds r0, r2, r7
	adds r0, r0, r1
	strh r6, [r0]
_081A36F8:
	cmp r4, #0
	bne _081A3718
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _081A374C
	adds r1, r0, r2
	adds r1, r1, r3
	strh r4, [r1]
	ldr r7, _081A3750
	adds r1, r0, r7
	adds r1, r1, r3
	strh r4, [r1]
	ldr r1, _081A3754
	adds r0, r0, r1
	adds r0, r0, r3
	strh r4, [r0]
_081A3718:
	adds r5, #1
	cmp r5, #1
	ble _081A36C8
	mov r4, ip
	cmp r4, #3
	ble _081A36BE
	mov r2, sb
	ldr r0, [r2]
	ldr r7, _081A3758
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, #0
	beq _081A3736
	movs r0, #1
	strb r0, [r1]
_081A3736:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A3744: .4byte 0x03005AF0
_081A3748: .4byte 0x00000CDC
_081A374C: .4byte 0x00000DDA
_081A3750: .4byte 0x00000E04
_081A3754: .4byte 0x00000E1A
_081A3758: .4byte 0x00000CA8
	thumb_func_end sub_081A36A0

	thumb_func_start GetCurrentFacilityWinStreak
GetCurrentFacilityWinStreak: @ 0x081A375C
	push {r4, r5, lr}
	ldr r0, _081A3790
	ldr r0, [r0]
	ldr r1, _081A3794
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r4, r0, #0x1e
	ldr r0, _081A3798
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _081A379C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bhi _081A385C
	lsls r0, r0, #2
	ldr r1, _081A37A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A3790: .4byte 0x03005AF0
_081A3794: .4byte 0x00000CA9
_081A3798: .4byte 0x000040CE
_081A379C: .4byte 0x000040CF
_081A37A0: .4byte 0x081A37A4
_081A37A4: @ jump table
	.4byte _081A37C0 @ case 0
	.4byte _081A37D4 @ case 1
	.4byte _081A37EC @ case 2
	.4byte _081A3804 @ case 3
	.4byte _081A3818 @ case 4
	.4byte _081A3830 @ case 5
	.4byte _081A3844 @ case 6
_081A37C0:
	ldr r0, _081A37D0
	ldr r0, [r0]
	lsls r1, r4, #1
	lsls r2, r5, #2
	adds r1, r1, r2
	movs r2, #0xce
	lsls r2, r2, #4
	b _081A384C
	.align 2, 0
_081A37D0: .4byte 0x03005AF0
_081A37D4:
	ldr r0, _081A37E4
	ldr r0, [r0]
	lsls r1, r4, #1
	lsls r2, r5, #2
	adds r1, r1, r2
	ldr r2, _081A37E8
	b _081A384C
	.align 2, 0
_081A37E4: .4byte 0x03005AF0
_081A37E8: .4byte 0x00000D0C
_081A37EC:
	ldr r0, _081A37FC
	ldr r0, [r0]
	lsls r1, r4, #1
	lsls r2, r5, #2
	adds r1, r1, r2
	ldr r2, _081A3800
	b _081A384C
	.align 2, 0
_081A37FC: .4byte 0x03005AF0
_081A3800: .4byte 0x00000DC8
_081A3804:
	ldr r0, _081A3810
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A3814
	b _081A384C
	.align 2, 0
_081A3810: .4byte 0x03005AF0
_081A3814: .4byte 0x00000DDA
_081A3818:
	ldr r0, _081A3828
	ldr r0, [r0]
	lsls r1, r4, #1
	lsls r2, r5, #2
	adds r1, r1, r2
	ldr r2, _081A382C
	b _081A384C
	.align 2, 0
_081A3828: .4byte 0x03005AF0
_081A382C: .4byte 0x00000DE2
_081A3830:
	ldr r0, _081A383C
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A3840
	b _081A384C
	.align 2, 0
_081A383C: .4byte 0x03005AF0
_081A3840: .4byte 0x00000E04
_081A3844:
	ldr r0, _081A3854
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A3858
_081A384C:
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	b _081A385E
	.align 2, 0
_081A3854: .4byte 0x03005AF0
_081A3858: .4byte 0x00000E1A
_081A385C:
	movs r0, #0
_081A385E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetCurrentFacilityWinStreak

	thumb_func_start sub_081A3864
sub_081A3864: @ 0x081A3864
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _081A388C
	ldr r4, _081A3890
	ldr r0, _081A3894
	adds r3, r0, #0
_081A3870:
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r0, r0, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r2, #1
	cmp r2, #0x13
	ble _081A3870
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A388C: .4byte 0x03005AF0
_081A3890: .4byte 0x00000CB4
_081A3894: .4byte 0x0000FFFF
	thumb_func_end sub_081A3864

	thumb_func_start sub_081A3898
sub_081A3898: @ 0x081A3898
	push {lr}
	ldr r0, _081A38AC
	ldrh r1, [r0]
	ldr r0, _081A38B0
	cmp r1, r0
	bne _081A38B8
	ldr r1, _081A38B4
	movs r0, #1
	b _081A38BC
	.align 2, 0
_081A38AC: .4byte 0x0203886A
_081A38B0: .4byte 0x000003FE
_081A38B4: .4byte 0x02037290
_081A38B8:
	ldr r1, _081A38C4
	movs r0, #0
_081A38BC:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081A38C4: .4byte 0x02037290
	thumb_func_end sub_081A3898

	thumb_func_start GetPlayerSymbolCountForFacility
GetPlayerSymbolCountForFacility: @ 0x081A38C8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x17
	ldr r1, _081A38F4
	adds r0, r4, r1
	bl FlagGet
	adds r5, r0, #0
	ldr r0, _081A38F8
	adds r4, r4, r0
	adds r0, r4, #0
	bl FlagGet
	adds r5, r5, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081A38F4: .4byte 0x000008C4
_081A38F8: .4byte 0x000008C5
	thumb_func_end GetPlayerSymbolCountForFacility

	thumb_func_start sub_081A38FC
sub_081A38FC: @ 0x081A38FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r0, _081A3938
	ldr r0, [r0]
	ldr r1, _081A393C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r4, r0, #0x1e
	ldr r0, _081A3940
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _081A3944
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r7, #6
	bhi _081A3A10
	lsls r0, r7, #2
	ldr r1, _081A3948
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A3938: .4byte 0x03005AF0
_081A393C: .4byte 0x00000CA9
_081A3940: .4byte 0x000040CF
_081A3944: .4byte 0x000040CE
_081A3948: .4byte 0x081A394C
_081A394C: @ jump table
	.4byte _081A3968 @ case 0
	.4byte _081A397C @ case 1
	.4byte _081A3998 @ case 2
	.4byte _081A39B0 @ case 3
	.4byte _081A39C4 @ case 4
	.4byte _081A39DC @ case 5
	.4byte _081A39F8 @ case 6
_081A3968:
	ldr r0, _081A3978
	ldr r0, [r0]
	lsls r1, r4, #1
	lsls r2, r6, #2
	adds r1, r1, r2
	movs r2, #0xce
	lsls r2, r2, #4
	b _081A3A00
	.align 2, 0
_081A3978: .4byte 0x03005AF0
_081A397C:
	ldr r0, _081A3990
	ldr r0, [r0]
	lsls r1, r4, #1
	lsls r2, r6, #2
	adds r1, r1, r2
	ldr r2, _081A3994
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r5, [r0]
	b _081A3A10
	.align 2, 0
_081A3990: .4byte 0x03005AF0
_081A3994: .4byte 0x00000D0C
_081A3998:
	ldr r0, _081A39A8
	ldr r0, [r0]
	lsls r1, r4, #1
	lsls r2, r6, #2
	adds r1, r1, r2
	ldr r2, _081A39AC
	b _081A3A00
	.align 2, 0
_081A39A8: .4byte 0x03005AF0
_081A39AC: .4byte 0x00000DC8
_081A39B0:
	ldr r0, _081A39BC
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A39C0
	b _081A3A00
	.align 2, 0
_081A39BC: .4byte 0x03005AF0
_081A39C0: .4byte 0x00000DDA
_081A39C4:
	ldr r0, _081A39D4
	ldr r0, [r0]
	lsls r1, r4, #1
	lsls r2, r6, #2
	adds r1, r1, r2
	ldr r2, _081A39D8
	b _081A3A00
	.align 2, 0
_081A39D4: .4byte 0x03005AF0
_081A39D8: .4byte 0x00000DE2
_081A39DC:
	ldr r0, _081A39F0
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A39F4
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0xe
	b _081A3A08
	.align 2, 0
_081A39F0: .4byte 0x03005AF0
_081A39F4: .4byte 0x00000E04
_081A39F8:
	ldr r0, _081A3AA0
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A3AA4
_081A3A00:
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #7
_081A3A08:
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_081A3A10:
	cmp r5, #0
	beq _081A3A16
	subs r5, #1
_081A3A16:
	cmp r5, #0x1d
	bls _081A3A1C
	movs r5, #0x1d
_081A3A1C:
	ldr r2, _081A3AA8
	lsls r1, r7, #2
	adds r1, r6, r1
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r7, r1, r2
	ldrb r5, [r7]
	ldr r0, _081A3AAC
	mov sb, r0
	ldrh r0, [r0]
	ldr r1, _081A3AB0
	mov r8, r1
	cmp r0, r8
	bne _081A3A3E
	adds r5, #0xa
_081A3A3E:
	ldr r6, _081A3AA0
	ldr r1, [r6]
	ldr r4, _081A3AB4
	adds r1, r1, r4
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
	ldr r0, _081A3AB8
	adds r1, r5, #0
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r2, r0, r4
	ldrh r0, [r2]
	ldr r1, _081A3ABC
	cmp r0, r1
	bls _081A3A66
	strh r1, [r2]
_081A3A66:
	ldr r0, [r6]
	ldr r4, _081A3AC0
	adds r0, r0, r4
	ldrh r5, [r0]
	ldrb r0, [r7]
	adds r5, r5, r0
	bl sub_080EF864
	mov r2, sb
	ldrh r0, [r2]
	cmp r0, r8
	bne _081A3A86
	adds r5, #0xa
	movs r0, #0xa
	bl sub_080EF864
_081A3A86:
	ldr r0, _081A3AC4
	cmp r5, r0
	ble _081A3A8E
	adds r5, r0, #0
_081A3A8E:
	ldr r0, [r6]
	adds r0, r0, r4
	strh r5, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A3AA0: .4byte 0x03005AF0
_081A3AA4: .4byte 0x00000E1A
_081A3AA8: .4byte 0x085DCEE0
_081A3AAC: .4byte 0x0203886A
_081A3AB0: .4byte 0x000003FE
_081A3AB4: .4byte 0x00000EB8
_081A3AB8: .4byte 0x02021C40
_081A3ABC: .4byte 0x0000270F
_081A3AC0: .4byte 0x00000EBA
_081A3AC4: .4byte 0x0000FFFF
	thumb_func_end sub_081A38FC

	thumb_func_start sub_081A3AC8
sub_081A3AC8: @ 0x081A3AC8
	push {r4, lr}
	ldr r0, _081A3AE8
	bl VarGet
	ldr r4, _081A3AEC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetPlayerSymbolCountForFacility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A3AE8: .4byte 0x000040CF
_081A3AEC: .4byte 0x02037290
	thumb_func_end sub_081A3AC8

	thumb_func_start sub_081A3AF0
sub_081A3AF0: @ 0x081A3AF0
	push {r4, lr}
	ldr r0, _081A3B18
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetPlayerSymbolCountForFacility
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A3B20
	lsls r0, r4, #0x11
	ldr r1, _081A3B1C
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	bl FlagSet
	b _081A3B2C
	.align 2, 0
_081A3B18: .4byte 0x000040CF
_081A3B1C: .4byte 0x08C40000
_081A3B20:
	lsls r0, r4, #0x11
	ldr r1, _081A3B34
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	bl FlagSet
_081A3B2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A3B34: .4byte 0x08C50000
	thumb_func_end sub_081A3AF0

	thumb_func_start sub_081A3B38
sub_081A3B38: @ 0x081A3B38
	push {lr}
	ldr r0, _081A3B50
	ldr r1, _081A3B54
	ldrh r1, [r1]
	ldr r2, [r0]
	ands r2, r1
	cmp r2, #0
	beq _081A3B5C
	ldr r1, _081A3B58
	movs r0, #1
	strh r0, [r1]
	b _081A3B60
	.align 2, 0
_081A3B50: .4byte 0x02022C90
_081A3B54: .4byte 0x02037282
_081A3B58: .4byte 0x02037290
_081A3B5C:
	ldr r0, _081A3B64
	strh r2, [r0]
_081A3B60:
	pop {r0}
	bx r0
	.align 2, 0
_081A3B64: .4byte 0x02037290
	thumb_func_end sub_081A3B38

	thumb_func_start sub_081A3B68
sub_081A3B68: @ 0x081A3B68
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A3BFC
	cmp r4, #0
	bne _081A3B94
	ldr r0, _081A3BBC
	ldr r1, _081A3BC0
	bl StringAppend
_081A3B94:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _081A3BBC
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r0, _081A3BC4
	adds r1, r1, r0
	adds r0, r6, #0
	bl StringAppend
	cmp r4, #5
	beq _081A3BE0
	cmp r4, #5
	bgt _081A3BC8
	cmp r4, #2
	beq _081A3BD2
	b _081A3BF4
	.align 2, 0
_081A3BBC: .4byte 0x02021C40
_081A3BC0: .4byte 0x085ABC6C
_081A3BC4: .4byte 0x082EA31C
_081A3BC8:
	cmp r4, #8
	beq _081A3BE0
	cmp r4, #0xb
	beq _081A3BE0
	b _081A3BF4
_081A3BD2:
	ldr r1, _081A3BDC
	adds r0, r6, #0
	bl StringAppend
	b _081A3BFC
	.align 2, 0
_081A3BDC: .4byte 0x085ABC70
_081A3BE0:
	ldr r0, _081A3BEC
	ldr r1, _081A3BF0
	bl StringAppend
	b _081A3BFC
	.align 2, 0
_081A3BEC: .4byte 0x02021C40
_081A3BF0: .4byte 0x085ABC6E
_081A3BF4:
	ldr r0, _081A3C04
	ldr r1, _081A3C08
	bl StringAppend
_081A3BFC:
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081A3C04: .4byte 0x02021C40
_081A3C08: .4byte 0x085ABC6C
	thumb_func_end sub_081A3B68

	thumb_func_start AppendIfValid
AppendIfValid: @ 0x081A3C0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, [sp, #0x20]
	ldr r4, [sp, #0x24]
	mov sb, r4
	ldr r4, [sp, #0x28]
	mov sl, r4
	ldr r7, [sp, #0x2c]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov ip, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r2, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	beq _081A3CDA
	cmp r4, #0
	beq _081A3CDA
	ldr r0, _081A3CE8
	ldrh r1, [r0]
	ldr r5, _081A3CEC
	adds r3, r0, #0
	cmp r1, r5
	beq _081A3C70
	cmp r1, r4
	beq _081A3C64
	adds r1, r3, #0
_081A3C56:
	adds r1, #2
	adds r2, #1
	ldrh r0, [r1]
	cmp r0, r5
	beq _081A3C70
	cmp r0, r4
	bne _081A3C56
_081A3C64:
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	ldr r0, _081A3CEC
	cmp r1, r0
	bne _081A3CDA
_081A3C70:
	mov r0, ip
	cmp r0, #0
	bne _081A3C7C
	mov r1, r8
	cmp r1, #0x32
	bhi _081A3CDA
_081A3C7C:
	movs r2, #0
	ldrb r3, [r7]
	cmp r2, r3
	bge _081A3C9C
	mov r1, sb
	ldrh r0, [r1]
	cmp r0, r4
	beq _081A3C9C
	adds r5, r3, #0
_081A3C8E:
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	bge _081A3C9C
	ldrh r0, [r1]
	cmp r0, r4
	bne _081A3C8E
_081A3C9C:
	cmp r2, r3
	bne _081A3CDA
	cmp r6, #0
	beq _081A3CC6
	movs r2, #0
	cmp r2, r3
	bge _081A3CC2
	mov r1, sl
	ldrh r0, [r1]
	cmp r0, r6
	beq _081A3CC2
	adds r5, r3, #0
_081A3CB4:
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	bge _081A3CC2
	ldrh r0, [r1]
	cmp r0, r6
	bne _081A3CB4
_081A3CC2:
	cmp r2, r3
	bne _081A3CDA
_081A3CC6:
	lsls r0, r3, #1
	add r0, sb
	strh r4, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #1
	add r0, sl
	strh r6, [r0]
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
_081A3CDA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A3CE8: .4byte 0x085DD48E
_081A3CEC: .4byte 0x0000FFFF
	thumb_func_end AppendIfValid

	thumb_func_start sub_081A3CF0
sub_081A3CF0: @ 0x081A3CF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	movs r0, #0
	mov sl, r0
	add r4, sp, #0x28
	mov r1, sl
	strb r1, [r4]
	ldr r0, _081A3D20
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r4
	cmp r0, #1
	beq _081A3D32
	cmp r0, #1
	bgt _081A3D24
	cmp r0, #0
	beq _081A3D2C
	b _081A3D46
	.align 2, 0
_081A3D20: .4byte 0x000040CE
_081A3D24:
	cmp r0, #3
	bgt _081A3D46
	movs r0, #2
	b _081A3D44
_081A3D2C:
	movs r1, #3
	mov sl, r1
	b _081A3D46
_081A3D32:
	ldr r0, _081A3DB4
	bl VarGet
	lsls r0, r0, #0x10
	movs r1, #3
	mov sl, r1
	cmp r0, #0
	bne _081A3D46
	movs r0, #4
_081A3D44:
	mov sl, r0
_081A3D46:
	movs r1, #0
	mov r8, r1
_081A3D4A:
	movs r0, #0x64
	mov r4, r8
	muls r4, r0, r4
	ldr r0, _081A3DB8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _081A3DB4
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _081A3DC0
	cmp r6, #0
	bne _081A3DDC
	ldr r0, _081A3DBC
	ldrb r3, [r0]
	str r5, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, sp, #0x1c
	str r0, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl AppendIfValid
	b _081A3DDC
	.align 2, 0
_081A3DB4: .4byte 0x000040CF
_081A3DB8: .4byte 0x02024190
_081A3DBC: .4byte 0x02037290
_081A3DC0:
	ldr r0, _081A3E44
	ldrb r3, [r0]
	str r5, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	add r0, sp, #0x1c
	str r0, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl AppendIfValid
_081A3DDC:
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #5
	ble _081A3D4A
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, sl
	bge _081A3E6C
	ldr r1, _081A3E48
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _081A3E4C
	movs r0, #1
	strh r0, [r1]
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	ldr r2, _081A3E50
	ldrh r0, [r2]
	ldr r1, _081A3E54
	cmp r0, r1
	beq _081A3E22
	mov r5, sb
	adds r6, r1, #0
	adds r4, r2, #0
_081A3E10:
	ldrh r0, [r4]
	ldrb r1, [r5]
	bl sub_081A3B68
	strb r0, [r5]
	adds r4, #2
	ldrh r0, [r4]
	cmp r0, r6
	bne _081A3E10
_081A3E22:
	ldr r4, _081A3E48
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	subs r0, #1
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #2
	bhi _081A3E5C
	ldr r1, _081A3E58
	b _081A3E5E
	.align 2, 0
_081A3E44: .4byte 0x02037290
_081A3E48: .4byte 0x02021C40
_081A3E4C: .4byte 0x02037280
_081A3E50: .4byte 0x085DD48E
_081A3E54: .4byte 0x0000FFFF
_081A3E58: .4byte 0x085ABC72
_081A3E5C:
	ldr r1, _081A3E68
_081A3E5E:
	adds r0, r4, #0
	bl StringAppend
	b _081A3E8E
	.align 2, 0
_081A3E68: .4byte 0x085ABC75
_081A3E6C:
	ldr r1, _081A3EA0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _081A3EA4
	ldr r2, [r0]
	ldr r0, _081A3EA8
	ldrb r0, [r0]
	ldr r1, _081A3EAC
	adds r2, r2, r1
	movs r1, #3
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_081A3E8E:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A3EA0: .4byte 0x02037280
_081A3EA4: .4byte 0x03005AF0
_081A3EA8: .4byte 0x02037290
_081A3EAC: .4byte 0x00000CA9
	thumb_func_end sub_081A3CF0

	thumb_func_start sub_081A3EB0
sub_081A3EB0: @ 0x081A3EB0
	push {lr}
	bl ValidateEReaderTrainer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081A3EB0

	thumb_func_start sub_081A3EBC
sub_081A3EBC: @ 0x081A3EBC
	push {r4, r5, r6, r7, lr}
	ldr r0, _081A3EF0
	ldr r0, [r0]
	ldr r1, _081A3EF4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r4, r0, #0x1e
	ldr r0, _081A3EF8
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _081A3EFC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bls _081A3EE6
	b _081A4020
_081A3EE6:
	lsls r0, r0, #2
	ldr r1, _081A3F00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A3EF0: .4byte 0x03005AF0
_081A3EF4: .4byte 0x00000CA9
_081A3EF8: .4byte 0x000040CE
_081A3EFC: .4byte 0x000040CF
_081A3F00: .4byte 0x081A3F04
_081A3F04: @ jump table
	.4byte _081A3F20 @ case 0
	.4byte _081A3F68 @ case 1
	.4byte _081A3FA8 @ case 2
	.4byte _081A3FC4 @ case 3
	.4byte _081A3FD8 @ case 4
	.4byte _081A3FF4 @ case 5
	.4byte _081A4008 @ case 6
_081A3F20:
	ldr r7, _081A3F5C
	ldr r0, [r7]
	lsls r4, r4, #1
	lsls r1, r5, #2
	adds r1, r4, r1
	movs r6, #0xce
	lsls r6, r6, #4
	adds r3, r0, r6
	adds r2, r3, r1
	ldrh r1, [r2]
	ldr r0, _081A3F60
	cmp r1, r0
	bhi _081A4020
	adds r0, r1, #1
	strh r0, [r2]
	cmp r5, #0
	bne _081A4020
	adds r0, r3, r4
	ldrh r1, [r0]
	movs r0, #0x20
	bl SetGameStat
	ldr r1, [r7]
	adds r0, r1, r6
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r2, _081A3F64
	adds r1, r1, r2
	b _081A401E
	.align 2, 0
_081A3F5C: .4byte 0x03005AF0
_081A3F60: .4byte 0x0000270E
_081A3F64: .4byte 0x00000D02
_081A3F68:
	ldr r6, _081A3F98
	ldr r0, [r6]
	lsls r2, r4, #1
	lsls r1, r5, #2
	adds r1, r2, r1
	ldr r3, _081A3F9C
	adds r0, r0, r3
	adds r3, r0, r1
	ldrh r0, [r3]
	ldr r2, _081A3FA0
	cmp r0, r2
	bhi _081A3F84
	adds r0, #1
	strh r0, [r3]
_081A3F84:
	ldr r0, [r6]
	ldr r3, _081A3FA4
	adds r0, r0, r3
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r2
	bhi _081A4020
	adds r0, #1
	b _081A401E
	.align 2, 0
_081A3F98: .4byte 0x03005AF0
_081A3F9C: .4byte 0x00000D0C
_081A3FA0: .4byte 0x0000270E
_081A3FA4: .4byte 0x00000D1C
_081A3FA8:
	ldr r0, _081A3FBC
	ldr r2, [r0]
	lsls r0, r4, #1
	lsls r1, r5, #2
	adds r0, r0, r1
	ldr r1, _081A3FC0
	adds r2, r2, r1
	adds r1, r2, r0
	b _081A4014
	.align 2, 0
_081A3FBC: .4byte 0x03005AF0
_081A3FC0: .4byte 0x00000DC8
_081A3FC4:
	ldr r0, _081A3FD0
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A3FD4
	adds r0, r0, r2
	b _081A4012
	.align 2, 0
_081A3FD0: .4byte 0x03005AF0
_081A3FD4: .4byte 0x00000DDA
_081A3FD8:
	ldr r0, _081A3FEC
	ldr r2, [r0]
	lsls r0, r4, #1
	lsls r1, r5, #2
	adds r0, r0, r1
	ldr r3, _081A3FF0
	adds r2, r2, r3
	adds r1, r2, r0
	b _081A4014
	.align 2, 0
_081A3FEC: .4byte 0x03005AF0
_081A3FF0: .4byte 0x00000DE2
_081A3FF4:
	ldr r0, _081A4000
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A4004
	adds r0, r0, r2
	b _081A4012
	.align 2, 0
_081A4000: .4byte 0x03005AF0
_081A4004: .4byte 0x00000E04
_081A4008:
	ldr r0, _081A4028
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r3, _081A402C
	adds r0, r0, r3
_081A4012:
	adds r1, r0, r1
_081A4014:
	ldrh r3, [r1]
	ldr r0, _081A4030
	cmp r3, r0
	bhi _081A4020
	adds r0, r3, #1
_081A401E:
	strh r0, [r1]
_081A4020:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A4028: .4byte 0x03005AF0
_081A402C: .4byte 0x00000E1A
_081A4030: .4byte 0x0000270E
	thumb_func_end sub_081A3EBC

	thumb_func_start sub_081A4034
sub_081A4034: @ 0x081A4034
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r4, #0
	ldr r6, _081A408C
	movs r5, #0x64
_081A403E:
	ldr r0, _081A4090
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _081A4094
	adds r0, r0, r2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	beq _081A407A
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xea
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r6]
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	muls r0, r5, r0
	ldr r1, _081A4098
	adds r0, r0, r1
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
_081A407A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081A403E
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A408C: .4byte 0x03005AEC
_081A4090: .4byte 0x03005AF0
_081A4094: .4byte 0x00000CAA
_081A4098: .4byte 0x02024190
	thumb_func_end sub_081A4034

	thumb_func_start PrintAligned
PrintAligned: @ 0x081A409C
	push {r4, lr}
	ldr r4, _081A40BC
	bl MoveRecordedBattleToSaveData
	strh r0, [r4]
	ldr r0, _081A40C0
	ldr r1, [r0]
	ldr r0, _081A40C4
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #8
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A40BC: .4byte 0x02037290
_081A40C0: .4byte 0x03005AF0
_081A40C4: .4byte 0x00000CA9
	thumb_func_end PrintAligned

	thumb_func_start GetFrontierBrainTrainerClass
GetFrontierBrainTrainerClass: @ 0x081A40C8
	push {lr}
	ldr r0, _081A40D8
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A40DC
	cmp r0, #1
	beq _081A40F0
	b _081A40FA
	.align 2, 0
_081A40D8: .4byte 0x02037282
_081A40DC:
	ldr r0, _081A40E8
	ldr r1, _081A40EC
	ldrh r1, [r1]
	bl GetFrontierTrainerName
	b _081A40FA
	.align 2, 0
_081A40E8: .4byte 0x02021C40
_081A40EC: .4byte 0x0203886A
_081A40F0:
	ldr r0, _081A4100
	ldr r1, _081A4104
	ldrh r1, [r1]
	bl GetFrontierTrainerName
_081A40FA:
	pop {r0}
	bx r0
	.align 2, 0
_081A4100: .4byte 0x02021C54
_081A4104: .4byte 0x0203886A
	thumb_func_end GetFrontierBrainTrainerClass

	thumb_func_start sub_081A4108
sub_081A4108: @ 0x081A4108
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	str r0, [sp]
_081A4118:
	ldr r1, _081A41F8
	ldr r0, [r1]
	ldr r2, [sp]
	lsls r1, r2, #1
	ldr r4, _081A41FC
	adds r0, r0, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r1
	adds r2, #1
	str r2, [sp, #4]
	cmp r0, #5
	bhi _081A41DA
	movs r6, #0
	ldr r0, [sp]
	movs r2, #0x64
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r0, _081A4200
	adds r7, r1, r0
_081A4146:
	movs r5, #0
	movs r4, #0xd
	adds r4, r4, r6
	mov r8, r4
	adds r0, r6, #1
	mov sl, r0
_081A4152:
	ldr r1, _081A41F8
	ldr r0, [r1]
	ldr r2, _081A41FC
	adds r0, r0, r2
	add r0, sb
	ldrh r0, [r0]
	movs r4, #0x64
	adds r1, r0, #0
	muls r1, r4, r1
	movs r0, #0xea
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r2, _081A4204
	ldr r0, [r2]
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0xd
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	bl GetMonData
	cmp r4, r0
	beq _081A4194
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _081A4152
_081A4194:
	cmp r5, #4
	bne _081A41A2
	adds r0, r7, #0
	movs r1, #0xa6
	adds r2, r6, #0
	bl SetMonMoveSlot
_081A41A2:
	mov r4, sl
	lsls r0, r4, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _081A4146
	ldr r0, _081A4204
	ldr r0, [r0]
	ldr r2, _081A41F8
	ldr r1, [r2]
	ldr r4, _081A41FC
	adds r1, r1, r4
	add r1, sb
	ldrh r1, [r1]
	subs r1, #1
	movs r3, #0x64
	muls r1, r3, r1
	adds r0, r0, r1
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r2, _081A4200
	ldr r4, [sp]
	adds r1, r4, #0
	muls r1, r3, r1
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
_081A41DA:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	cmp r0, #3
	bls _081A4118
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A41F8: .4byte 0x03005AF0
_081A41FC: .4byte 0x00000CAA
_081A4200: .4byte 0x02024190
_081A4204: .4byte 0x03005AEC
	thumb_func_end sub_081A4108

	thumb_func_start GetFrontierBrainTrainerPicIndex
GetFrontierBrainTrainerPicIndex: @ 0x081A4208
	push {lr}
	ldr r0, _081A421C
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetFrontierBrainEventObjGfx
	pop {r0}
	bx r0
	.align 2, 0
_081A421C: .4byte 0x000040CF
	thumb_func_end GetFrontierBrainTrainerPicIndex

	thumb_func_start Print1PRecord
Print1PRecord: @ 0x081A4220
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r1
	adds r6, r3, #0
	ldr r1, _081A42DC
	mov sl, r1
	ldrb r5, [r1]
	lsls r4, r0, #1
	ldr r1, _081A42E0
	adds r4, r4, r1
	mov r1, sb
	lsls r3, r1, #0x1b
	lsrs r3, r3, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, #2
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	str r7, [sp]
	movs r0, #0
	mov r8, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
	movs r0, #0xff
	strb r0, [r6, #0xd]
	ldrh r0, [r6, #4]
	cmp r0, #0
	beq _081A42CC
	mov r1, sl
	ldrb r0, [r1]
	adds r2, r6, #6
	mov r3, sb
	adds r3, #2
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	str r7, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	bl AddTextPrinterParameterized
	ldrh r1, [r6, #4]
	ldr r0, _081A42E4
	cmp r1, r0
	bls _081A4294
	adds r1, r0, #0
_081A4294:
	ldr r0, _081A42E8
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _081A42EC
	ldr r1, _081A42F0
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringExpandPlaceholders
	mov r1, sl
	ldrb r0, [r1]
	mov r3, sb
	adds r3, #0xe
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	str r7, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
_081A42CC:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A42DC: .4byte 0x0203A840
_081A42E0: .4byte 0x085DD564
_081A42E4: .4byte 0x0000270F
_081A42E8: .4byte 0x02021C54
_081A42EC: .4byte 0x02021C7C
_081A42F0: .4byte 0x085DD53C
	thumb_func_end Print1PRecord

	thumb_func_start FactoryPrintPrevOrCurrentStreak
FactoryPrintPrevOrCurrentStreak: @ 0x081A42F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r1, _081A43E0
	mov sb, r1
	ldrb r5, [r1]
	lsls r2, r0, #1
	ldr r1, _081A43E4
	adds r2, r2, r1
	mov r1, r8
	lsls r3, r1, #0x1b
	lsrs r3, r3, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r4, r4, r1
	lsls r0, r4, #3
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	str r0, [sp]
	movs r7, #0
	str r7, [sp, #4]
	str r7, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	bl AddTextPrinterParameterized
	ldrh r0, [r6, #8]
	cmp r0, #0
	beq _081A43D0
	movs r0, #0xff
	strb r0, [r6, #0x11]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r6, #0x19]
	mov r1, sb
	ldrb r0, [r1]
	adds r2, r6, #0
	adds r2, #0xa
	mov r3, r8
	adds r3, #2
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	subs r1, r4, #1
	lsls r1, r1, #3
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	bl AddTextPrinterParameterized
	mov r1, sb
	ldrb r0, [r1]
	adds r2, r6, #0
	adds r2, #0x12
	mov r3, r8
	adds r3, #4
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	adds r1, r4, #1
	lsls r1, r1, #3
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	bl AddTextPrinterParameterized
	ldrh r1, [r6, #8]
	ldr r0, _081A43E8
	cmp r1, r0
	bls _081A439E
	adds r1, r0, #0
_081A439E:
	ldr r0, _081A43EC
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _081A43F0
	ldr r0, _081A43F4
	ldr r1, [r0, #0x24]
	adds r0, r4, #0
	bl StringExpandPlaceholders
	mov r1, sb
	ldrb r0, [r1]
	mov r3, r8
	adds r3, #0xe
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	mov r1, sl
	str r1, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized
_081A43D0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A43E0: .4byte 0x0203A840
_081A43E4: .4byte 0x085DD564
_081A43E8: .4byte 0x0000270F
_081A43EC: .4byte 0x02021C54
_081A43F0: .4byte 0x02021C7C
_081A43F4: .4byte 0x085DD53C
	thumb_func_end FactoryPrintPrevOrCurrentStreak

	thumb_func_start Fill1PRecords
Fill1PRecords: @ 0x081A43F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x44
	mov sb, r0
	mov sl, r1
	str r2, [sp, #0x40]
	movs r0, #0xac
	lsls r0, r0, #1
	bl AllocZeroed
	mov r8, r0
	bl GetPlayerHallRecords
	add r0, sp, #0x30
	mov ip, r0
	ldr r0, _081A44C8
	ldr r2, [r0]
	ldr r3, [sp, #0x40]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #4
	mov r4, sl
	lsls r0, r4, #1
	add r0, sl
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r4, r1, r2
	mov r3, sp
	movs r2, #2
_081A4438:
	adds r0, r3, #0
	movs r5, #0x87
	lsls r5, r5, #2
	adds r1, r4, r5
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r4, #0x10
	adds r3, #0x10
	subs r2, #1
	cmp r2, #0
	bge _081A4438
	ldr r6, [sp, #0x40]
	lsls r0, r6, #4
	mov r7, sl
	lsls r1, r7, #5
	adds r0, r0, r1
	mov r1, ip
	add r0, r8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	movs r2, #0
_081A446A:
	movs r1, #0
	movs r4, #0
	movs r3, #0
	lsls r5, r2, #4
	adds r6, r2, #1
	mov r2, sp
_081A4476:
	ldrh r0, [r2, #4]
	cmp r0, r1
	ble _081A4480
	adds r4, r3, #0
	adds r1, r0, #0
_081A4480:
	adds r2, #0x10
	adds r3, #1
	cmp r3, #3
	ble _081A4476
	mov r0, sp
	ldrh r0, [r0, #0x34]
	cmp r0, r1
	blt _081A4492
	movs r4, #3
_081A4492:
	lsls r0, r4, #4
	mov r7, sp
	adds r2, r7, r0
	mov r0, sb
	adds r1, r5, r0
	adds r0, r2, #0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #0
	strh r0, [r2, #4]
	adds r2, r6, #0
	cmp r2, #2
	ble _081A446A
	mov r0, r8
	bl Free
	add sp, #0x44
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A44C8: .4byte 0x03005AF0
	thumb_func_end Fill1PRecords

	thumb_func_start Fill2PRecords
Fill2PRecords: @ 0x081A44CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	mov sb, r0
	mov sl, r1
	movs r0, #0xac
	lsls r0, r0, #1
	bl AllocZeroed
	mov r8, r0
	bl GetPlayerHallRecords
	mov r0, sp
	adds r0, #0x54
	str r0, [sp, #0x70]
	add r1, sp, #0x5c
	mov ip, r1
	ldr r0, _081A45A8
	ldr r1, [r0]
	movs r0, #0x54
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	adds r3, r0, r1
	mov r2, sp
	movs r4, #2
_081A4506:
	adds r0, r2, #0
	ldr r5, _081A45AC
	adds r1, r3, r5
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r3, #0x1c
	adds r2, #0x1c
	subs r4, #1
	cmp r4, #0
	bge _081A4506
	mov r6, sl
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [sp, #0x70]
	movs r7, #0x90
	lsls r7, r7, #1
	adds r0, r0, r7
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldr r0, [r0]
	str r0, [r1]
	movs r4, #0
_081A4542:
	movs r1, #0
	movs r5, #0
	movs r3, #0
	lsls r6, r4, #3
	adds r7, r4, #1
	mov r2, sp
_081A454E:
	ldrh r0, [r2, #8]
	cmp r0, r1
	ble _081A4558
	adds r5, r3, #0
	adds r1, r0, #0
_081A4558:
	adds r2, #0x1c
	adds r3, #1
	cmp r3, #2
	ble _081A454E
	mov r2, ip
	ldrh r0, [r2]
	cmp r0, r1
	blt _081A456A
	movs r5, #3
_081A456A:
	subs r1, r6, r4
	lsls r1, r1, #2
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	mov r3, sp
	adds r2, r3, r0
	add r1, sb
	adds r0, r2, #0
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #0
	strh r0, [r2, #8]
	adds r4, r7, #0
	cmp r4, #2
	ble _081A4542
	mov r0, r8
	bl Free
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A45A8: .4byte 0x03005AF0
_081A45AC: .4byte 0x0000057C
	thumb_func_end Fill2PRecords

	thumb_func_start DomePrintPrevOrCurrentStreak
DomePrintPrevOrCurrentStreak: @ 0x081A45B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x90
	adds r7, r0, #0
	mov sb, r1
	ldr r0, _081A464C
	ldr r4, _081A4650
	lsls r5, r7, #3
	adds r1, r5, r4
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _081A4654
	mov r8, r0
	adds r4, #4
	adds r5, r5, r4
	ldr r1, [r5]
	bl StringExpandPlaceholders
	ldr r5, _081A4658
	ldrb r0, [r5]
	movs r6, #2
	str r6, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	mov r2, r8
	movs r3, #0xc
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	ldr r2, _081A465C
	mov r3, sb
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x84
	bl AddTextPrinterParameterized
	cmp r7, #9
	bne _081A4668
	ldr r2, _081A4660
	ldr r0, [r2]
	ldr r1, _081A4664
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r2]
	movs r3, #0xef
	lsls r3, r3, #4
	adds r0, r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	add r4, sp, #0x3c
	adds r0, r4, #0
	mov r1, sb
	bl Fill2PRecords
	movs r5, #0
_081A4636:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #4
	adds r3, r4, #0
	bl FactoryPrintPrevOrCurrentStreak
	adds r4, #0x1c
	adds r5, #1
	cmp r5, #2
	ble _081A4636
	b _081A468C
	.align 2, 0
_081A464C: .4byte 0x02021C40
_081A4650: .4byte 0x085DD4A4
_081A4654: .4byte 0x02021C7C
_081A4658: .4byte 0x0203A840
_081A465C: .4byte 0x085DD504
_081A4660: .4byte 0x03005AF0
_081A4664: .4byte 0x00000EE8
_081A4668:
	add r0, sp, #0xc
	adds r1, r7, #0
	mov r2, sb
	bl Fill1PRecords
	movs r5, #0
	add r4, sp, #0xc
_081A4676:
	str r7, [sp]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #4
	adds r3, r4, #0
	bl Print1PRecord
	adds r4, #0x10
	adds r5, #1
	cmp r5, #2
	ble _081A4676
_081A468C:
	add sp, #0x90
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DomePrintPrevOrCurrentStreak

	thumb_func_start ShowRankingHallRecordsWindow
ShowRankingHallRecordsWindow: @ 0x081A469C
	push {r4, lr}
	ldr r4, _081A46D8
	ldr r0, _081A46DC
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _081A46E0
	ldrh r0, [r0]
	movs r1, #0
	bl DomePrintPrevOrCurrentStreak
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A46D8: .4byte 0x0203A840
_081A46DC: .4byte 0x085DD2E0
_081A46E0: .4byte 0x02037282
	thumb_func_end ShowRankingHallRecordsWindow

	thumb_func_start ScrollRankingHallRecordsWindow
ScrollRankingHallRecordsWindow: @ 0x081A46E4
	push {r4, lr}
	ldr r4, _081A4708
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _081A470C
	ldrh r0, [r0]
	movs r1, #1
	bl DomePrintPrevOrCurrentStreak
	ldrb r0, [r4]
	movs r1, #2
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A4708: .4byte 0x0203A840
_081A470C: .4byte 0x02037282
	thumb_func_end ScrollRankingHallRecordsWindow

	thumb_func_start ClearRankingHallRecords
ClearRankingHallRecords: @ 0x081A4710
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r1, #0
	ldr r3, _081A4814
_081A4720:
	movs r6, #0
	lsls r0, r1, #1
	adds r2, r1, #1
	mov sl, r2
	adds r0, r0, r1
	lsls r0, r0, #5
	mov r8, r0
	movs r7, #0
	movs r0, #0x87
	lsls r0, r0, #2
	add r0, r8
	mov sb, r0
_081A4738:
	movs r5, #0
	adds r2, r7, #0
	mov r1, r8
	adds r4, r7, r1
_081A4740:
	ldr r0, [r3]
	add r0, sb
	adds r0, r0, r2
	lsls r1, r5, #4
	adds r0, r0, r1
	movs r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl CopyTrainerId
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r0, r0, r4
	ldr r1, _081A4818
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, r0, r4
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	adds r4, #0x10
	adds r5, #1
	ldr r2, [sp]
	cmp r5, #2
	ble _081A4740
	adds r7, #0x30
	adds r6, #1
	cmp r6, #1
	ble _081A4738
	mov r1, sl
	cmp r1, #8
	ble _081A4720
	movs r6, #0
	ldr r7, _081A4814
	movs r2, #0x54
	mov sl, r2
	movs r3, #0xff
	mov sb, r3
_081A4794:
	adds r0, r6, #1
	mov r8, r0
	mov r1, sl
	muls r1, r6, r1
	movs r0, #0x54
	adds r4, r6, #0
	muls r4, r0, r4
	movs r2, #0
	ldr r3, _081A481C
	adds r6, r1, r3
	movs r5, #2
_081A47AA:
	ldr r0, [r7]
	adds r0, r0, r6
	adds r0, r0, r2
	movs r1, #0
	str r2, [sp]
	bl CopyTrainerId
	ldr r0, [r7]
	adds r0, r0, r6
	ldr r2, [sp]
	adds r0, r0, r2
	adds r0, #4
	movs r1, #0
	bl CopyTrainerId
	ldr r1, [r7]
	adds r1, r1, r4
	ldr r0, _081A4820
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r3, sb
	orrs r0, r3
	strb r0, [r1]
	ldr r1, [r7]
	adds r1, r1, r4
	ldr r0, _081A4824
	adds r1, r1, r0
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, r0, r4
	ldr r1, _081A4828
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	adds r4, #0x1c
	ldr r2, [sp]
	adds r2, #0x1c
	subs r5, #1
	cmp r5, #0
	bge _081A47AA
	mov r6, r8
	cmp r6, #1
	ble _081A4794
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A4814: .4byte 0x03005AF0
_081A4818: .4byte 0x00000222
_081A481C: .4byte 0x0000057C
_081A4820: .4byte 0x00000586
_081A4824: .4byte 0x0000058E
_081A4828: .4byte 0x00000584
	thumb_func_end ClearRankingHallRecords

	thumb_func_start sub_081A482C
sub_081A482C: @ 0x081A482C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0x96
	lsls r0, r0, #2
	bl AllocZeroed
	adds r7, r0, #0
	adds r4, r7, #0
	movs r5, #0
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r6, r7, r0
	ldr r0, _081A48A4
	mov r8, r0
_081A484A:
	mov r0, r8
	adds r1, r5, r0
	adds r0, r4, #0
	movs r2, #0x64
	bl memcpy
	adds r4, #0x64
	adds r5, #0x64
	cmp r4, r6
	ble _081A484A
	ldr r4, _081A48A8
	ldrb r5, [r4]
	bl LoadPlayerParty
	bl SetContinueGameWarpStatusToDynamicWarp
	movs r0, #1
	bl TrySavingData
	bl ClearContinueGameWarpStatus
	strb r5, [r4]
	adds r4, r7, #0
	ldr r5, _081A48A4
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r6, r7, r0
_081A4880:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x64
	bl memcpy
	adds r4, #0x64
	adds r5, #0x64
	cmp r4, r6
	ble _081A4880
	adds r0, r7, #0
	bl Free
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A48A4: .4byte 0x02024190
_081A48A8: .4byte 0x0202418D
	thumb_func_end sub_081A482C

	thumb_func_start PrintHyphens
PrintHyphens: @ 0x081A48AC
	push {lr}
	ldr r0, _081A48C8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _081A48CC
	bl GetRecordedBattleApprenticeLanguage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081A48D6
	.align 2, 0
_081A48C8: .4byte 0x02022C90
_081A48CC:
	ldr r0, _081A48EC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_081A48D6:
	ldr r2, _081A48F0
	ldr r1, _081A48F4
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r2
	ldrb r0, [r0, #3]
	pop {r1}
	bx r1
	.align 2, 0
_081A48EC: .4byte 0x000040CF
_081A48F0: .4byte 0x082E383C
_081A48F4: .4byte 0x085DD56A
	thumb_func_end PrintHyphens

	thumb_func_start sub_081A48F8
sub_081A48F8: @ 0x081A48F8
	push {lr}
	ldr r0, _081A4914
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _081A4918
	bl GetRecordedBattleApprenticeLanguage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081A4922
	.align 2, 0
_081A4914: .4byte 0x02022C90
_081A4918:
	ldr r0, _081A4938
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_081A4922:
	ldr r2, _081A493C
	ldr r1, _081A4940
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	pop {r1}
	bx r1
	.align 2, 0
_081A4938: .4byte 0x000040CF
_081A493C: .4byte 0x082E383C
_081A4940: .4byte 0x085DD56A
	thumb_func_end sub_081A48F8

	thumb_func_start CopyFrontierBrainTrainerName
CopyFrontierBrainTrainerName: @ 0x081A4944
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081A4960
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _081A4964
	bl GetRecordedBattleApprenticeLanguage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081A496E
	.align 2, 0
_081A4960: .4byte 0x02022C90
_081A4964:
	ldr r0, _081A499C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_081A496E:
	movs r3, #0
	lsls r0, r0, #1
	ldr r2, _081A49A0
	ldr r1, _081A49A4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r2, #4
	adds r2, r0, r2
_081A4980:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r3, #1
	cmp r3, #6
	ble _081A4980
	adds r1, r4, r3
	movs r0, #0xff
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A499C: .4byte 0x000040CF
_081A49A0: .4byte 0x082E383C
_081A49A4: .4byte 0x085DD56A
	thumb_func_end CopyFrontierBrainTrainerName

	thumb_func_start IsFrontierBrainFemale
IsFrontierBrainFemale: @ 0x081A49A8
	push {lr}
	ldr r0, _081A49C0
	bl VarGet
	lsls r0, r0, #0x10
	ldr r1, _081A49C4
	lsrs r0, r0, #0xf
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_081A49C0: .4byte 0x000040CF
_081A49C4: .4byte 0x085DD47F
	thumb_func_end IsFrontierBrainFemale

	thumb_func_start SetFrontierBrainEventObjGfx_2
SetFrontierBrainEventObjGfx_2: @ 0x081A49C8
	push {lr}
	ldr r0, _081A49E8
	bl VarGet
	lsls r0, r0, #0x10
	ldr r2, _081A49EC
	ldr r1, _081A49F0
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_081A49E8: .4byte 0x000040CF
_081A49EC: .4byte 0x00004010
_081A49F0: .4byte 0x085DD47F
	thumb_func_end SetFrontierBrainEventObjGfx_2

	thumb_func_start CreateFrontierBrainPokemon
CreateFrontierBrainPokemon: @ 0x081A49F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x44
	ldr r0, _081A4A2C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	bl GetFronterBrainSymbol
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _081A4A34
	ldr r0, _081A4A30
	bl TrainerIdToTournamentId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetDomeTrainerMonCountInBits
	adds r4, r0, #0
	b _081A4A36
	.align 2, 0
_081A4A2C: .4byte 0x000040CF
_081A4A30: .4byte 0x000003FE
_081A4A34:
	movs r4, #7
_081A4A36:
	bl ZeroEnemyPartyMons
	movs r1, #0
	str r1, [sp, #0x18]
	bl SetFacilityPtrsGetLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	movs r2, #0
	str r2, [sp, #0x14]
_081A4A4C:
	movs r0, #1
	ands r0, r4
	asrs r4, r4, #1
	str r4, [sp, #0x30]
	ldr r3, [sp, #0x14]
	adds r3, #1
	str r3, [sp, #0x28]
	cmp r0, #0
	bne _081A4A60
	b _081A4BB4
_081A4A60:
	ldr r4, [sp, #0x14]
	lsls r4, r4, #2
	mov sb, r4
	ldr r0, [sp, #0x24]
	lsls r0, r0, #4
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x20]
	lsls r1, r1, #4
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x1c]
	lsls r2, r2, #0x18
	str r2, [sp, #0x3c]
	ldr r3, [sp, #0x18]
	adds r3, #1
	str r3, [sp, #0x2c]
	ldr r0, [sp, #0x14]
	add r0, sb
	lsls r0, r0, #2
	mov r8, r0
_081A4A86:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	lsls r0, r0, #0x10
	orrs r7, r0
	ldr r0, _081A4BD0
	adds r1, r7, #0
	bl IsShinyOtIdPersonality
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A4A86
	ldr r4, [sp, #0x38]
	ldr r1, [sp, #0x24]
	subs r0, r4, r1
	lsls r5, r0, #2
	mov r2, r8
	adds r4, r2, r5
	ldr r3, [sp, #0x34]
	ldr r1, [sp, #0x20]
	subs r0, r3, r1
	lsls r6, r0, #3
	adds r4, r4, r6
	ldr r2, _081A4BD4
	adds r4, r4, r2
	adds r0, r7, #0
	bl GetNatureFromPersonality
	ldrb r1, [r4, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _081A4A86
	ldr r4, [sp, #0x18]
	movs r0, #0x64
	adds r3, r4, #0
	muls r3, r0, r3
	mov r8, r3
	ldr r1, _081A4BD8
	add r1, r8
	mov sl, r1
	ldr r4, [sp, #0x14]
	add r4, sb
	lsls r4, r4, #2
	adds r0, r4, r5
	adds r0, r0, r6
	ldr r2, _081A4BD4
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r3, [sp, #0x3c]
	lsrs r2, r3, #0x18
	ldrb r3, [r0, #4]
	movs r0, #1
	str r0, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _081A4BD0
	str r0, [sp, #0xc]
	mov r0, sl
	bl CreateMon
	ldr r0, _081A4BD4
	adds r5, r5, r0
	adds r5, r6, r5
	adds r4, r5, r4
	adds r4, #2
	mov r0, sl
	movs r1, #0xc
	adds r2, r4, #0
	bl SetMonData
	movs r7, #0
	mov r6, r8
	ldr r3, _081A4BD8
_081A4B22:
	adds r1, r7, #0
	adds r1, #0x1a
	ldr r0, [sp, #0x14]
	add r0, sb
	lsls r4, r0, #2
	adds r2, r5, r4
	adds r0, r7, #6
	adds r2, r2, r0
	adds r0, r6, r3
	str r3, [sp, #0x40]
	bl SetMonData
	adds r7, #1
	ldr r3, [sp, #0x40]
	cmp r7, #5
	ble _081A4B22
	movs r1, #0xff
	add r0, sp, #0x10
	strb r1, [r0]
	movs r7, #0
	ldr r1, [sp, #0x18]
	movs r2, #0x64
	adds r6, r1, #0
	muls r6, r2, r6
	ldr r3, _081A4BDC
	mov r8, r3
	ldr r3, _081A4BD8
	adds r5, r4, #0
_081A4B5A:
	ldr r4, [sp, #0x38]
	ldr r0, [sp, #0x24]
	subs r1, r4, r0
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r2, [sp, #0x34]
	ldr r4, [sp, #0x20]
	subs r0, r2, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	add r1, r8
	ldrh r4, [r1]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, r3
	adds r1, r4, #0
	str r3, [sp, #0x40]
	bl SetMonMoveSlot
	ldr r3, [sp, #0x40]
	cmp r4, #0xda
	bne _081A4B8C
	movs r1, #0
	add r0, sp, #0x10
	strb r1, [r0]
_081A4B8C:
	adds r5, #2
	adds r7, #1
	cmp r7, #3
	ble _081A4B5A
	ldr r0, [sp, #0x18]
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	ldr r0, _081A4BD8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	add r2, sp, #0x10
	bl SetMonData
	adds r0, r4, #0
	bl CalculateMonStats
	ldr r2, [sp, #0x2c]
	str r2, [sp, #0x18]
_081A4BB4:
	ldr r4, [sp, #0x30]
	ldr r3, [sp, #0x28]
	str r3, [sp, #0x14]
	cmp r3, #2
	bgt _081A4BC0
	b _081A4A4C
_081A4BC0:
	add sp, #0x44
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A4BD0: .4byte 0x0000EF2A
_081A4BD4: .4byte 0x085DCB98
_081A4BD8: .4byte 0x020243E8
_081A4BDC: .4byte 0x085DCBA4
	thumb_func_end CreateFrontierBrainPokemon

	thumb_func_start GetFrontierBrainMonSpecies
GetFrontierBrainMonSpecies: @ 0x081A4BE0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081A4C18
	bl VarGet
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl GetFronterBrainSymbol
	ldr r3, _081A4C1C
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r1, r0, #4
	subs r1, r1, r0
	adds r1, r1, r2
	lsls r1, r1, #2
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081A4C18: .4byte 0x000040CF
_081A4C1C: .4byte 0x085DCB98
	thumb_func_end GetFrontierBrainMonSpecies

	thumb_func_start SetFrontierBrainEventObjGfx
SetFrontierBrainEventObjGfx: @ 0x081A4C20
	push {lr}
	lsls r0, r0, #0x18
	ldr r2, _081A4C40
	ldr r3, _081A4C44
	adds r1, r3, #0
	strh r1, [r2]
	ldr r2, _081A4C48
	ldr r1, _081A4C4C
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_081A4C40: .4byte 0x0203886A
_081A4C44: .4byte 0x000003FE
_081A4C48: .4byte 0x00004010
_081A4C4C: .4byte 0x085DD47F
	thumb_func_end SetFrontierBrainEventObjGfx

	thumb_func_start GetFrontierBrainMonMove
GetFrontierBrainMonMove: @ 0x081A4C50
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081A4C98
	bl VarGet
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl GetFronterBrainSymbol
	ldr r2, _081A4C9C
	lsls r4, r4, #1
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r4, r4, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r4, r4, r1
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r4, r4, r0
	adds r2, #0xc
	adds r4, r4, r2
	ldrh r0, [r4]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081A4C98: .4byte 0x000040CF
_081A4C9C: .4byte 0x085DCB98
	thumb_func_end GetFrontierBrainMonMove

	thumb_func_start GetFrontierBrainMonNature
GetFrontierBrainMonNature: @ 0x081A4CA0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081A4CD8
	bl VarGet
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl GetFronterBrainSymbol
	ldr r3, _081A4CDC
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r1, r0, #4
	subs r1, r1, r0
	adds r1, r1, r2
	lsls r1, r1, #2
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1, #5]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081A4CD8: .4byte 0x000040CF
_081A4CDC: .4byte 0x085DCB98
	thumb_func_end GetFrontierBrainMonNature

	thumb_func_start GetFrontierBrainMonEvs
GetFrontierBrainMonEvs: @ 0x081A4CE0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081A4D24
	bl VarGet
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl GetFronterBrainSymbol
	ldr r2, _081A4D28
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r4, r4, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r4, r4, r1
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r4, r4, r0
	adds r2, #6
	adds r4, r4, r2
	ldrb r0, [r4]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081A4D24: .4byte 0x000040CF
_081A4D28: .4byte 0x085DCB98
	thumb_func_end GetFrontierBrainMonEvs

	thumb_func_start GetFronterBrainSymbol
GetFronterBrainSymbol: @ 0x081A4D2C
	push {r4, r5, lr}
	ldr r0, _081A4D68
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetPlayerSymbolCountForFacility
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bne _081A4D90
	bl GetCurrentFacilityWinStreak
	lsls r0, r0, #0x10
	ldr r3, _081A4D6C
	lsls r2, r5, #2
	adds r1, r3, #3
	adds r1, r2, r1
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	adds r1, r0, r1
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _081A4D70
	movs r4, #0
	b _081A4D90
	.align 2, 0
_081A4D68: .4byte 0x000040CF
_081A4D6C: .4byte 0x085DCB7C
_081A4D70:
	adds r0, r3, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r1, r0
	beq _081A4D8E
	cmp r1, r0
	ble _081A4D90
	subs r0, r1, r0
	adds r1, r3, #2
	adds r1, r2, r1
	ldrb r1, [r1]
	bl __modsi3
	cmp r0, #0
	bne _081A4D90
_081A4D8E:
	movs r4, #1
_081A4D90:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetFronterBrainSymbol

	thumb_func_start CopyFrontierBrainText
CopyFrontierBrainText: @ 0x081A4D98
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081A4DC0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _081A4DC4
	bl GetRecordedBattleApprenticeLanguage
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl GetRecordedBattleFronterBrainSymbol
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _081A4DD4
	.align 2, 0
_081A4DC0: .4byte 0x02022C90
_081A4DC4:
	ldr r0, _081A4DE0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetFronterBrainSymbol
	adds r1, r0, #0
_081A4DD4:
	cmp r5, #0
	beq _081A4DE4
	cmp r5, #1
	beq _081A4E04
	b _081A4E18
	.align 2, 0
_081A4DE0: .4byte 0x000040CF
_081A4DE4:
	ldr r0, _081A4DFC
	ldr r2, _081A4E00
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	lsls r1, r4, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	b _081A4E18
	.align 2, 0
_081A4DFC: .4byte 0x02021C7C
_081A4E00: .4byte 0x085DD5E8
_081A4E04:
	ldr r0, _081A4E20
	ldr r2, _081A4E24
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	lsls r1, r4, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
_081A4E18:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A4E20: .4byte 0x02021C7C
_081A4E24: .4byte 0x085DD5F0
	thumb_func_end CopyFrontierBrainText

