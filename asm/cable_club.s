.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_080B1C58
sub_080B1C58: @ 0x080B1C58
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r4, _080B1C94
	adds r0, r4, #0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080B1C8C
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B1C98
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r6, [r1, #0xa]
	strh r5, [r1, #0xc]
_080B1C8C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B1C94: .4byte 0x080B1F11
_080B1C98: .4byte 0x03005B60
	thumb_func_end sub_080B1C58

	thumb_func_start sub_080B1C9C
sub_080B1C9C: @ 0x080B1C9C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080B1CEC
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldr r5, _080B1CF0
	ldr r1, _080B1CF4
	adds r0, r5, #0
	bl StringExpandPlaceholders
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1CEC: .4byte 0x02021C40
_080B1CF0: .4byte 0x02021C7C
_080B1CF4: .4byte 0x0852B230
	thumb_func_end sub_080B1C9C

	thumb_func_start sub_080B1CF8
sub_080B1CF8: @ 0x080B1CF8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl DrawStdWindowFrame
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B1CF8

	thumb_func_start sub_080B1D18
sub_080B1D18: @ 0x080B1D18
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B1D40
	adds r4, r1, r0
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r5, r0
	beq _080B1D4E
	cmp r5, #1
	bhi _080B1D44
	ldrh r0, [r4, #0xa]
	bl sub_080B1CF8
	b _080B1D4C
	.align 2, 0
_080B1D40: .4byte 0x03005B68
_080B1D44:
	ldrh r0, [r4, #0xa]
	adds r1, r5, #0
	bl sub_080B1C9C
_080B1D4C:
	strh r5, [r4, #6]
_080B1D4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080B1D18

	thumb_func_start sub_080B1D54
sub_080B1D54: @ 0x080B1D54
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl GetLinkPlayerDataExchangeStatusTimed
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r0, #6
	bhi _080B1DCC
	lsls r0, r0, #2
	ldr r1, _080B1D78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B1D78: .4byte 0x080B1D7C
_080B1D7C: @ jump table
	.4byte _080B1D98 @ case 0
	.4byte _080B1DCC @ case 1
	.4byte _080B1D9C @ case 2
	.4byte _080B1DA0 @ case 3
	.4byte _080B1DA4 @ case 4
	.4byte _080B1DA8 @ case 5
	.4byte _080B1DC8 @ case 6
_080B1D98:
	movs r0, #1
	b _080B1DCE
_080B1D9C:
	movs r0, #3
	b _080B1DCE
_080B1DA0:
	movs r0, #7
	b _080B1DCE
_080B1DA4:
	movs r0, #9
	b _080B1DCE
_080B1DA8:
	ldr r4, _080B1DC4
	bl GetLinkPlayerCount_2
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	movs r0, #4
	b _080B1DCE
	.align 2, 0
_080B1DC4: .4byte 0x02021C40
_080B1DC8:
	movs r0, #0xa
	b _080B1DCE
_080B1DCC:
	movs r0, #0
_080B1DCE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080B1D54

	thumb_func_start sub_080B1DD4
sub_080B1DD4: @ 0x080B1DD4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl HasLinkErrorOccurred
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B1DEA
	movs r0, #0
	b _080B1DFA
_080B1DEA:
	ldr r0, _080B1E00
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080B1E04
	str r0, [r1]
	movs r0, #1
_080B1DFA:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B1E00: .4byte 0x03005B60
_080B1E04: .4byte 0x080B2609
	thumb_func_end sub_080B1DD4

	thumb_func_start sub_080B1E08
sub_080B1E08: @ 0x080B1E08
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080B1E3C
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B1E4C
	bl IsLinkConnectionEstablished
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080B1E4C
	ldr r0, _080B1E40
	strh r1, [r0]
	ldr r1, _080B1E44
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080B1E48
	str r1, [r0]
	movs r0, #1
	b _080B1E4E
	.align 2, 0
_080B1E3C: .4byte 0x03002360
_080B1E40: .4byte 0x0202267E
_080B1E44: .4byte 0x03005B60
_080B1E48: .4byte 0x080B25C9
_080B1E4C:
	movs r0, #0
_080B1E4E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080B1E08

	thumb_func_start sub_080B1E54
sub_080B1E54: @ 0x080B1E54
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsLinkConnectionEstablished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1E6A
	movs r0, #1
	bl SetSuppressLinkErrorMessage
_080B1E6A:
	ldr r0, _080B1E7C
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080B1E80
	movs r0, #0
	b _080B1E96
	.align 2, 0
_080B1E7C: .4byte 0x03002360
_080B1E80:
	ldr r1, _080B1E9C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080B1EA0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080B1EA4
	str r1, [r0]
	movs r0, #1
_080B1E96:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B1E9C: .4byte 0x0202267E
_080B1EA0: .4byte 0x03005B60
_080B1EA4: .4byte 0x080B25C9
	thumb_func_end sub_080B1E54

	thumb_func_start sub_080B1EA8
sub_080B1EA8: @ 0x080B1EA8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl GetSioMultiSI
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B1EBE
	movs r0, #0
	b _080B1ECE
_080B1EBE:
	ldr r0, _080B1ED4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080B1ED8
	str r0, [r1]
	movs r0, #1
_080B1ECE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B1ED4: .4byte 0x03005B60
_080B1ED8: .4byte 0x080B2609
	thumb_func_end sub_080B1EA8

	thumb_func_start sub_080B1EDC
sub_080B1EDC: @ 0x080B1EDC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080B1F0C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080B1F06
	movs r0, #2
	bl sub_0800A09C
	adds r0, r4, #0
	bl DestroyTask
_080B1F06:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1F0C: .4byte 0x03005B60
	thumb_func_end sub_080B1EDC

	thumb_func_start sub_080B1F10
sub_080B1F10: @ 0x080B1F10
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B1F40
	adds r4, r1, r0
	movs r3, #0
	ldrsh r2, [r4, r3]
	cmp r2, #0
	bne _080B1F48
	bl OpenLinkTimed
	bl sub_0800A75C
	bl ResetLinkPlayers
	ldr r0, _080B1F44
	bl AddWindow
	strh r0, [r4, #0xa]
	b _080B1F54
	.align 2, 0
_080B1F40: .4byte 0x03005B68
_080B1F44: .4byte 0x0852B23C
_080B1F48:
	cmp r2, #9
	ble _080B1F54
	subs r0, #8
	adds r0, r1, r0
	ldr r1, _080B1F60
	str r1, [r0]
_080B1F54:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1F60: .4byte 0x080B1F65
	thumb_func_end sub_080B1F10

	thumb_func_start sub_080B1F64
sub_080B1F64: @ 0x080B1F64
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl sub_080B1E08
	cmp r0, #1
	beq _080B1FD8
	adds r0, r4, #0
	bl sub_080B1E54
	cmp r0, #1
	beq _080B1FD8
	cmp r5, #1
	bls _080B1FD8
	movs r0, #1
	bl SetSuppressLinkErrorMessage
	ldr r1, _080B1FBC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #0
	strh r0, [r4, #0xe]
	bl IsLinkMaster
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B1FC8
	movs r0, #0x15
	bl PlaySE
	ldr r0, _080B1FC0
	bl ShowFieldAutoScrollMessage
	ldr r0, _080B1FC4
	b _080B1FD6
	.align 2, 0
_080B1FBC: .4byte 0x03005B60
_080B1FC0: .4byte 0x08247C97
_080B1FC4: .4byte 0x080B1FE9
_080B1FC8:
	movs r0, #0x16
	bl PlaySE
	ldr r0, _080B1FE0
	bl ShowFieldAutoScrollMessage
	ldr r0, _080B1FE4
_080B1FD6:
	str r0, [r4]
_080B1FD8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1FE0: .4byte 0x08247CDA
_080B1FE4: .4byte 0x080B21F5
	thumb_func_end sub_080B1F64

	thumb_func_start sub_080B1FE8
sub_080B1FE8: @ 0x080B1FE8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_080B1E08
	cmp r0, #1
	beq _080B2028
	adds r0, r4, #0
	bl sub_080B1EA8
	cmp r0, #1
	beq _080B2028
	adds r0, r4, #0
	bl sub_080B1DD4
	cmp r0, #1
	beq _080B2028
	bl GetFieldMessageBoxMode
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080B2028
	ldr r0, _080B2030
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r2, [r1, #0xe]
	ldr r0, _080B2034
	str r0, [r1]
_080B2028:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2030: .4byte 0x03005B60
_080B2034: .4byte 0x080B2039
	thumb_func_end sub_080B1FE8

	thumb_func_start sub_080B2038
sub_080B2038: @ 0x080B2038
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	mov r8, r0
	ldr r0, _080B20CC
	mov sb, r0
	mov r7, r8
	add r7, sb
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl sub_080B1E08
	cmp r0, #1
	beq _080B20C0
	adds r0, r4, #0
	bl sub_080B1EA8
	cmp r0, #1
	beq _080B20C0
	adds r0, r4, #0
	bl sub_080B1DD4
	cmp r0, #1
	beq _080B20C0
	adds r6, r5, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080B1D18
	ldr r0, _080B20D0
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B20C0
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r5, r0
	blt _080B20C0
	adds r0, r6, #0
	bl sub_0800A5C8
	ldrh r0, [r7, #0xa]
	bl sub_080B1CF8
	ldr r0, _080B20D4
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r0, _080B20D8
	bl ShowFieldAutoScrollMessage
	mov r0, sb
	subs r0, #8
	add r0, r8
	ldr r1, _080B20DC
	str r1, [r0]
_080B20C0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B20CC: .4byte 0x03005B68
_080B20D0: .4byte 0x03002360
_080B20D4: .4byte 0x02021C40
_080B20D8: .4byte 0x08247CB5
_080B20DC: .4byte 0x080B20E1
	thumb_func_end sub_080B2038

	thumb_func_start sub_080B20E0
sub_080B20E0: @ 0x080B20E0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	adds r0, r5, #0
	bl sub_080B1E08
	cmp r0, #1
	beq _080B2174
	adds r0, r5, #0
	bl sub_080B1EA8
	cmp r0, #1
	beq _080B2174
	adds r0, r5, #0
	bl sub_080B1DD4
	cmp r0, #1
	beq _080B2174
	bl GetFieldMessageBoxMode
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B2174
	bl GetSavedPlayerCount
	adds r4, r0, #0
	bl GetLinkPlayerCount_2
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080B212E
	ldr r0, _080B2144
	ldrh r1, [r0, #0x2c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B2154
_080B212E:
	ldr r0, _080B2148
	bl ShowFieldAutoScrollMessage
	ldr r1, _080B214C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080B2150
	str r1, [r0]
	b _080B2174
	.align 2, 0
_080B2144: .4byte 0x03002360
_080B2148: .4byte 0x08247C97
_080B214C: .4byte 0x03005B60
_080B2150: .4byte 0x080B1FE9
_080B2154:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B2174
	movs r0, #5
	bl PlaySE
	bl CheckShouldAdvanceLinkState
	ldr r0, _080B217C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080B2180
	str r0, [r1]
_080B2174:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B217C: .4byte 0x03005B60
_080B2180: .4byte 0x080B2185
	thumb_func_end sub_080B20E0

	thumb_func_start sub_080B2184
sub_080B2184: @ 0x080B2184
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080B21C8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrb r7, [r5, #0xa]
	ldrb r6, [r5, #0xc]
	adds r0, r4, #0
	bl sub_080B1DD4
	cmp r0, #1
	beq _080B21E6
	adds r0, r4, #0
	bl sub_080B2648
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080B21E6
	bl GetLinkPlayerCount_2
	adds r4, r0, #0
	bl GetSavedPlayerCount
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _080B21D0
	ldr r0, _080B21CC
	b _080B21E4
	.align 2, 0
_080B21C8: .4byte 0x03005B60
_080B21CC: .4byte 0x080B2609
_080B21D0:
	ldr r4, _080B21EC
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_080B1D54
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080B21E6
	ldr r0, _080B21F0
_080B21E4:
	str r0, [r5]
_080B21E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B21EC: .4byte 0x02037290
_080B21F0: .4byte 0x080B22E5
	thumb_func_end sub_080B2184

	thumb_func_start sub_080B21F4
sub_080B21F4: @ 0x080B21F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080B224C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r7, r0, r1
	ldrb r6, [r7, #0xa]
	ldrb r5, [r7, #0xc]
	adds r0, r4, #0
	bl sub_080B1E08
	cmp r0, #1
	beq _080B22C2
	adds r0, r4, #0
	bl sub_080B1DD4
	cmp r0, #1
	beq _080B22C2
	ldr r4, _080B2250
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080B1D54
	adds r1, r0, #0
	strh r1, [r4]
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080B22C2
	subs r0, r1, #3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080B2258
	bl sub_0800A7F8
	bl HideFieldMessageBox
	ldr r0, _080B2254
	b _080B22C0
	.align 2, 0
_080B224C: .4byte 0x03005B60
_080B2250: .4byte 0x02037290
_080B2254: .4byte 0x080B258D
_080B2258:
	cmp r2, #7
	beq _080B2260
	cmp r2, #9
	bne _080B2270
_080B2260:
	bl CloseLink
	bl HideFieldMessageBox
	ldr r0, _080B226C
	b _080B22C0
	.align 2, 0
_080B226C: .4byte 0x080B258D
_080B2270:
	bl GetLinkPlayerCount_2
	ldr r4, _080B22CC
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _080B22D0
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_0800A5C8
	ldr r4, _080B22D4
	adds r0, r4, #0
	bl TrainerCard_GenerateCardForPlayer
	ldr r0, _080B22D8
	mov r8, r0
	ldrb r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080B22DC
	adds r0, r0, r5
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r1, r4, #0
	adds r1, #0x54
	strh r0, [r1]
	mov r1, r8
	ldrb r0, [r1, #1]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r4, #0x56
	strh r0, [r4]
	ldr r0, _080B22E0
_080B22C0:
	str r0, [r7]
_080B22C2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B22CC: .4byte 0x03005B18
_080B22D0: .4byte 0x03005B14
_080B22D4: .4byte 0x0202257C
_080B22D8: .4byte 0x0203CBC4
_080B22DC: .4byte 0x0202412C
_080B22E0: .4byte 0x080B250D
	thumb_func_end sub_080B21F4

	thumb_func_start sub_080B22E4
sub_080B22E4: @ 0x080B22E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r7, #0
	bl sub_080B1DD4
	cmp r0, #1
	beq _080B23AA
	ldr r0, _080B2310
	ldrh r0, [r0]
	cmp r0, #4
	bne _080B2314
	bl Link_AnyPartnersPlayingRubyOrSapphire
	cmp r0, #0
	bne _080B2326
	bl sub_0800A7F8
	b _080B232A
	.align 2, 0
_080B2310: .4byte 0x02037290
_080B2314:
	cmp r0, #3
	bne _080B231E
	bl sub_0800A7F8
	b _080B232A
_080B231E:
	cmp r0, #7
	beq _080B2326
	cmp r0, #9
	bne _080B2348
_080B2326:
	bl CloseLink
_080B232A:
	bl HideFieldMessageBox
	ldr r0, _080B2340
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080B2344
	str r0, [r1]
	b _080B23AA
	.align 2, 0
_080B2340: .4byte 0x03005B60
_080B2344: .4byte 0x080B258D
_080B2348:
	bl GetLinkPlayerCount_2
	ldr r4, _080B23B4
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _080B23B8
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_0800A5C8
	ldr r4, _080B23BC
	adds r0, r4, #0
	bl TrainerCard_GenerateCardForPlayer
	ldr r0, _080B23C0
	mov r8, r0
	ldrb r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080B23C4
	adds r0, r0, r5
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r1, r4, #0
	adds r1, #0x54
	strh r0, [r1]
	mov r1, r8
	ldrb r0, [r1, #1]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r4, #0x56
	strh r0, [r4]
	ldr r1, _080B23C8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080B23CC
	str r1, [r0]
	movs r0, #2
	bl sub_0800A09C
_080B23AA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B23B4: .4byte 0x03005B18
_080B23B8: .4byte 0x03005B14
_080B23BC: .4byte 0x0202257C
_080B23C0: .4byte 0x0203CBC4
_080B23C4: .4byte 0x0202412C
_080B23C8: .4byte 0x03005B60
_080B23CC: .4byte 0x080B250D
	thumb_func_end sub_080B22E4

	thumb_func_start sub_080B23D0
sub_080B23D0: @ 0x080B23D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	movs r2, #0
	movs r7, #0
	ldr r1, _080B2460
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _080B2464
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r1, #0
	ldr r0, _080B2468
	mov sb, r0
_080B23F8:
	lsls r0, r1, #1
	adds r1, #1
	mov r8, r1
	ldr r1, [sp]
	adds r4, r0, r1
	mov r5, sl
	movs r6, #1
_080B2406:
	ldrh r0, [r4]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080B243A
	cmp r7, #0
	bne _080B2422
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, sb
	ldr r0, _080B2460
	bl StringCopy
	movs r2, #1
_080B2422:
	cmp r7, #1
	bne _080B2438
	ldrh r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, sb
	ldr r0, _080B2464
	bl StringCopy
	movs r2, #1
_080B2438:
	adds r7, #1
_080B243A:
	adds r5, #2
	subs r6, #1
	cmp r6, #0
	bge _080B2406
	mov r1, r8
	cmp r1, #1
	ble _080B23F8
	ldr r0, _080B246C
	strh r7, [r0]
	adds r0, r2, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B2460: .4byte 0x02021C40
_080B2464: .4byte 0x02021C54
_080B2468: .4byte 0x082EA31C
_080B246C: .4byte 0x02037282
	thumb_func_end sub_080B23D0

	thumb_func_start task_map_chg_seq_0807EC34
task_map_chg_seq_0807EC34: @ 0x080B2470
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _080B24B4
	ldrh r0, [r5]
	cmp r0, #1
	bne _080B24EC
	ldr r0, _080B24B8
	ldrh r2, [r0]
	ldr r0, _080B24BC
	cmp r2, r0
	beq _080B248E
	adds r0, #0x11
	cmp r2, r0
	bne _080B24C8
_080B248E:
	adds r0, r1, #0
	adds r0, #0x54
	adds r1, #0xb8
	bl sub_080B23D0
	cmp r0, #0
	beq _080B24C8
	movs r0, #0xb
	strh r0, [r5]
	bl sub_0800A7F8
	ldr r1, _080B24C0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080B24C4
	str r1, [r0]
	b _080B24FE
	.align 2, 0
_080B24B4: .4byte 0x020397F8
_080B24B8: .4byte 0x0202267E
_080B24BC: .4byte 0x00002266
_080B24C0: .4byte 0x03005B60
_080B24C4: .4byte 0x080B258D
_080B24C8:
	ldr r1, _080B24E8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #0x12]
	bl sub_080B1CF8
	bl EnableBothScriptContexts
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	b _080B24FE
	.align 2, 0
_080B24E8: .4byte 0x03005B60
_080B24EC:
	bl sub_0800A7F8
	ldr r0, _080B2504
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080B2508
	str r0, [r1]
_080B24FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2504: .4byte 0x03005B60
_080B2508: .4byte 0x080B258D
	thumb_func_end task_map_chg_seq_0807EC34

	thumb_func_start sub_080B250C
sub_080B250C: @ 0x080B250C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl sub_080B1DD4
	cmp r0, #1
	beq _080B2578
	bl GetBlockReceivedStatus
	adds r4, r0, #0
	bl sub_0800A56C
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080B2578
	movs r4, #0
	ldr r6, _080B2534
	b _080B255A
	.align 2, 0
_080B2534: .4byte 0x020226A0
_080B2538:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _080B2580
	adds r0, r0, r1
	lsls r1, r4, #8
	ldr r2, _080B2584
	adds r1, r1, r2
	lsls r2, r4, #3
	subs r2, r2, r4
	lsls r2, r2, #2
	adds r2, r2, r6
	ldrb r2, [r2]
	bl CopyTrainerCardData
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080B255A:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _080B2538
	movs r0, #0
	bl SetSuppressLinkErrorMessage
	bl ResetBlockReceivedFlags
	ldr r0, _080B2588
	adds r1, r5, #0
	bl task_map_chg_seq_0807EC34
_080B2578:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2580: .4byte 0x020397F8
_080B2584: .4byte 0x0202207C
_080B2588: .4byte 0x02037290
	thumb_func_end sub_080B250C

	thumb_func_start sub_080B258C
sub_080B258C: @ 0x080B258C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080B25C0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B25BA
	ldr r0, _080B25C4
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #0x12]
	bl sub_080B1CF8
	bl EnableBothScriptContexts
	ldrb r0, [r4, #0x12]
	bl RemoveWindow
	adds r0, r5, #0
	bl DestroyTask
_080B25BA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B25C0: .4byte 0x030031C4
_080B25C4: .4byte 0x03005B60
	thumb_func_end sub_080B258C

	thumb_func_start sub_080B25C8
sub_080B25C8: @ 0x080B25C8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080B2600
	movs r0, #5
	strh r0, [r1]
	ldr r0, _080B2604
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #0x12]
	bl sub_080B1CF8
	bl sub_08097CFC
	ldrb r0, [r4, #0x12]
	bl RemoveWindow
	bl EnableBothScriptContexts
	adds r0, r5, #0
	bl DestroyTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2600: .4byte 0x02037290
_080B2604: .4byte 0x03005B60
	thumb_func_end sub_080B25C8

	thumb_func_start sub_080B2608
sub_080B2608: @ 0x080B2608
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080B2640
	movs r0, #6
	strh r0, [r1]
	ldr r0, _080B2644
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #0x12]
	bl sub_080B1CF8
	ldrb r0, [r4, #0x12]
	bl RemoveWindow
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r5, #0
	bl DestroyTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2640: .4byte 0x02037290
_080B2644: .4byte 0x03005B60
	thumb_func_end sub_080B2608

	thumb_func_start sub_080B2648
sub_080B2648: @ 0x080B2648
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B266C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, r1, r2
	ldrh r0, [r2, #0x10]
	adds r0, #1
	strh r0, [r2, #0x10]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x12
	cmp r0, r1
	bgt _080B2670
	movs r0, #0
	b _080B2676
	.align 2, 0
_080B266C: .4byte 0x03005B60
_080B2670:
	ldr r0, _080B267C
	str r0, [r2]
	movs r0, #1
_080B2676:
	pop {r1}
	bx r1
	.align 2, 0
_080B267C: .4byte 0x080B2609
	thumb_func_end sub_080B2648

	thumb_func_start sub_080B2680
sub_080B2680: @ 0x080B2680
	push {r4, lr}
	movs r3, #2
	movs r2, #2
	ldr r0, _080B2698
	ldrh r0, [r0]
	cmp r0, #2
	beq _080B26B8
	cmp r0, #2
	bgt _080B269C
	cmp r0, #1
	beq _080B26A6
	b _080B2710
	.align 2, 0
_080B2698: .4byte 0x02037280
_080B269C:
	cmp r0, #5
	beq _080B26C8
	cmp r0, #9
	beq _080B26DC
	b _080B2710
_080B26A6:
	movs r3, #2
	ldr r1, _080B26B0
	ldr r4, _080B26B4
	b _080B270C
	.align 2, 0
_080B26B0: .4byte 0x0202267E
_080B26B4: .4byte 0x00002233
_080B26B8:
	movs r3, #2
	ldr r1, _080B26C0
	ldr r4, _080B26C4
	b _080B270C
	.align 2, 0
_080B26C0: .4byte 0x0202267E
_080B26C4: .4byte 0x00002244
_080B26C8:
	movs r3, #4
	movs r2, #4
	ldr r1, _080B26D4
	ldr r4, _080B26D8
	b _080B270C
	.align 2, 0
_080B26D4: .4byte 0x0202267E
_080B26D8: .4byte 0x00002255
_080B26DC:
	movs r3, #2
	ldr r0, _080B26F8
	ldr r0, [r0]
	ldr r1, _080B26FC
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080B2708
	ldr r1, _080B2700
	ldr r4, _080B2704
	b _080B270C
	.align 2, 0
_080B26F8: .4byte 0x03005AF0
_080B26FC: .4byte 0x00000CA9
_080B2700: .4byte 0x0202267E
_080B2704: .4byte 0x00002266
_080B2708:
	ldr r1, _080B2720
	ldr r4, _080B2724
_080B270C:
	adds r0, r4, #0
	strh r0, [r1]
_080B2710:
	adds r0, r3, #0
	adds r1, r2, #0
	bl sub_080B1C58
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2720: .4byte 0x0202267E
_080B2724: .4byte 0x00002277
	thumb_func_end sub_080B2680

	thumb_func_start sub_080B2728
sub_080B2728: @ 0x080B2728
	push {lr}
	ldr r1, _080B2744
	ldr r2, _080B2748
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080B274C
	movs r0, #0
	str r0, [r1]
	movs r0, #2
	movs r1, #2
	bl sub_080B1C58
	pop {r0}
	bx r0
	.align 2, 0
_080B2744: .4byte 0x0202267E
_080B2748: .4byte 0x00001133
_080B274C: .4byte 0x02022C90
	thumb_func_end sub_080B2728

	thumb_func_start sub_080B2750
sub_080B2750: @ 0x080B2750
	push {lr}
	ldr r1, _080B2774
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080B2778
	ldr r2, _080B277C
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080B2780
	movs r0, #0
	str r0, [r1]
	movs r0, #2
	movs r1, #4
	bl sub_080B1C58
	pop {r0}
	bx r0
	.align 2, 0
_080B2774: .4byte 0x02037290
_080B2778: .4byte 0x0202267E
_080B277C: .4byte 0x00003311
_080B2780: .4byte 0x02022C90
	thumb_func_end sub_080B2750

	thumb_func_start sub_080B2784
sub_080B2784: @ 0x080B2784
	push {lr}
	ldr r1, _080B27A0
	ldr r2, _080B27A4
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080B27A8
	movs r0, #0
	str r0, [r1]
	movs r0, #2
	movs r1, #4
	bl sub_080B1C58
	pop {r0}
	bx r0
	.align 2, 0
_080B27A0: .4byte 0x0202267E
_080B27A4: .4byte 0x00004411
_080B27A8: .4byte 0x02022C90
	thumb_func_end sub_080B2784

	thumb_func_start sub_080B27AC
sub_080B27AC: @ 0x080B27AC
	push {lr}
	ldr r1, _080B27C8
	ldr r2, _080B27CC
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080B27D0
	movs r0, #0
	str r0, [r1]
	movs r0, #4
	movs r1, #4
	bl sub_080B1C58
	pop {r0}
	bx r0
	.align 2, 0
_080B27C8: .4byte 0x0202267E
_080B27CC: .4byte 0x00006601
_080B27D0: .4byte 0x02022C90
	thumb_func_end sub_080B27AC

	thumb_func_start sub_080B27D4
sub_080B27D4: @ 0x080B27D4
	push {lr}
	ldr r1, _080B27F0
	ldr r2, _080B27F4
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080B27F8
	movs r0, #0
	str r0, [r1]
	movs r0, #2
	movs r1, #4
	bl sub_080B1C58
	pop {r0}
	bx r0
	.align 2, 0
_080B27F0: .4byte 0x0202267E
_080B27F4: .4byte 0x00006602
_080B27F8: .4byte 0x02022C90
	thumb_func_end sub_080B27D4

	thumb_func_start sub_080B27FC
sub_080B27FC: @ 0x080B27FC
	push {lr}
	ldr r0, _080B2810
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B2814
	movs r0, #0xff
	b _080B28E0
	.align 2, 0
_080B2810: .4byte 0x080B28F1
_080B2814:
	ldr r0, _080B2828
	ldrh r0, [r0]
	subs r0, #1
	cmp r0, #8
	bhi _080B28D4
	lsls r0, r0, #2
	ldr r1, _080B282C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2828: .4byte 0x02037280
_080B282C: .4byte 0x080B2830
_080B2830: @ jump table
	.4byte _080B2854 @ case 0
	.4byte _080B2864 @ case 1
	.4byte _080B28BC @ case 2
	.4byte _080B28CC @ case 3
	.4byte _080B2874 @ case 4
	.4byte _080B28D4 @ case 5
	.4byte _080B28D4 @ case 6
	.4byte _080B28D4 @ case 7
	.4byte _080B2884 @ case 8
_080B2854:
	ldr r1, _080B285C
	ldr r2, _080B2860
	b _080B28D0
	.align 2, 0
_080B285C: .4byte 0x0202267E
_080B2860: .4byte 0x00002233
_080B2864:
	ldr r1, _080B286C
	ldr r2, _080B2870
	b _080B28D0
	.align 2, 0
_080B286C: .4byte 0x0202267E
_080B2870: .4byte 0x00002244
_080B2874:
	ldr r1, _080B287C
	ldr r2, _080B2880
	b _080B28D0
	.align 2, 0
_080B287C: .4byte 0x0202267E
_080B2880: .4byte 0x00002255
_080B2884:
	ldr r0, _080B289C
	ldr r0, [r0]
	ldr r1, _080B28A0
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080B28AC
	ldr r1, _080B28A4
	ldr r2, _080B28A8
	b _080B28D0
	.align 2, 0
_080B289C: .4byte 0x03005AF0
_080B28A0: .4byte 0x00000CA9
_080B28A4: .4byte 0x0202267E
_080B28A8: .4byte 0x00002266
_080B28AC:
	ldr r1, _080B28B4
	ldr r2, _080B28B8
	b _080B28D0
	.align 2, 0
_080B28B4: .4byte 0x0202267E
_080B28B8: .4byte 0x00002277
_080B28BC:
	ldr r1, _080B28C4
	ldr r2, _080B28C8
	b _080B28D0
	.align 2, 0
_080B28C4: .4byte 0x0202267E
_080B28C8: .4byte 0x00001111
_080B28CC:
	ldr r1, _080B28E4
	ldr r2, _080B28E8
_080B28D0:
	adds r0, r2, #0
	strh r0, [r1]
_080B28D4:
	ldr r0, _080B28EC
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080B28E0:
	pop {r1}
	bx r1
	.align 2, 0
_080B28E4: .4byte 0x0202267E
_080B28E8: .4byte 0x00003322
_080B28EC: .4byte 0x080B28F1
	thumb_func_end sub_080B27FC

	thumb_func_start sub_080B28F0
sub_080B28F0: @ 0x080B28F0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B291C
	adds r4, r1, r0
	movs r3, #0
	ldrsh r2, [r4, r3]
	cmp r2, #0
	bne _080B2924
	bl OpenLink
	bl ResetLinkPlayers
	ldr r0, _080B2920
	movs r1, #0x50
	bl CreateTask
	b _080B2930
	.align 2, 0
_080B291C: .4byte 0x03005B68
_080B2920: .4byte 0x080B3189
_080B2924:
	cmp r2, #9
	ble _080B2930
	subs r0, #8
	adds r0, r1, r0
	ldr r1, _080B293C
	str r1, [r0]
_080B2930:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B293C: .4byte 0x080B2941
	thumb_func_end sub_080B28F0

	thumb_func_start sub_080B2940
sub_080B2940: @ 0x080B2940
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080B2986
	bl IsLinkMaster
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B2978
	ldr r0, _080B2970
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080B2974
	b _080B2984
	.align 2, 0
_080B2970: .4byte 0x03005B60
_080B2974: .4byte 0x080B2995
_080B2978:
	ldr r0, _080B298C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080B2990
_080B2984:
	str r0, [r1]
_080B2986:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B298C: .4byte 0x03005B60
_080B2990: .4byte 0x080B29CD
	thumb_func_end sub_080B2940

	thumb_func_start sub_080B2994
sub_080B2994: @ 0x080B2994
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl GetSavedPlayerCount
	adds r4, r0, #0
	bl GetLinkPlayerCount_2
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080B29BE
	bl CheckShouldAdvanceLinkState
	ldr r0, _080B29C4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080B29C8
	str r0, [r1]
_080B29BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B29C4: .4byte 0x03005B60
_080B29C8: .4byte 0x080B29CD
	thumb_func_end sub_080B2994

	thumb_func_start sub_080B29CC
sub_080B29CC: @ 0x080B29CC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080B29FC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B29F4
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B29F4
	bl sub_0800A6DC
	bl sub_08009AB0
	adds r0, r4, #0
	bl DestroyTask
_080B29F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B29FC: .4byte 0x030031C4
	thumb_func_end sub_080B29CC

	thumb_func_start sub_080B2A00
sub_080B2A00: @ 0x080B2A00
	push {lr}
	bl SaveGame
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B2A00

	thumb_func_start sub_080B2A0C
sub_080B2A0C: @ 0x080B2A0C
	push {lr}
	cmp r0, #2
	beq _080B2A30
	cmp r0, #2
	bgt _080B2A1C
	cmp r0, #1
	beq _080B2A26
	b _080B2A52
_080B2A1C:
	cmp r0, #5
	beq _080B2A3C
	cmp r0, #9
	beq _080B2A4C
	b _080B2A52
_080B2A26:
	ldr r1, _080B2A2C
	movs r0, #0xa
	b _080B2A50
	.align 2, 0
_080B2A2C: .4byte 0x02022C90
_080B2A30:
	ldr r1, _080B2A38
	movs r0, #0xb
	b _080B2A50
	.align 2, 0
_080B2A38: .4byte 0x02022C90
_080B2A3C:
	bl ReducePlayerPartyToSelectedMons
	ldr r1, _080B2A48
	movs r0, #0x4b
	b _080B2A50
	.align 2, 0
_080B2A48: .4byte 0x02022C90
_080B2A4C:
	ldr r1, _080B2A58
	ldr r0, _080B2A5C
_080B2A50:
	str r0, [r1]
_080B2A52:
	pop {r0}
	bx r0
	.align 2, 0
_080B2A58: .4byte 0x02022C90
_080B2A5C: .4byte 0x0000014B
	thumb_func_end sub_080B2A0C

	thumb_func_start sub_080B2A60
sub_080B2A60: @ 0x080B2A60
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080B2A84
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bhi _080B2B4C
	lsls r0, r0, #2
	ldr r1, _080B2A88
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2A84: .4byte 0x03005B60
_080B2A88: .4byte 0x080B2A8C
_080B2A8C: @ jump table
	.4byte _080B2AA4 @ case 0
	.4byte _080B2AC4 @ case 1
	.4byte _080B2AD4 @ case 2
	.4byte _080B2AE4 @ case 3
	.4byte _080B2AEA @ case 4
	.4byte _080B2B00 @ case 5
_080B2AA4:
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r1, _080B2ABC
	ldr r2, _080B2AC0
	adds r0, r2, #0
	strh r0, [r1]
	bl ClearLinkCallback_2
	b _080B2AF2
	.align 2, 0
_080B2ABC: .4byte 0x0202267E
_080B2AC0: .4byte 0x00002211
_080B2AC4:
	ldr r0, _080B2AD0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	b _080B2AEE
	.align 2, 0
_080B2AD0: .4byte 0x02037C74
_080B2AD4:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _080B2B4C
	b _080B2AF2
_080B2AE4:
	bl sub_0800A7F8
	b _080B2AF2
_080B2AEA:
	ldr r0, _080B2AFC
	ldrb r0, [r0]
_080B2AEE:
	cmp r0, #0
	bne _080B2B4C
_080B2AF2:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080B2B4C
	.align 2, 0
_080B2AFC: .4byte 0x030031C4
_080B2B00:
	ldr r0, _080B2B14
	ldr r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B2B1C
	ldr r0, _080B2B18
	bl PlayMapChosenOrBattleBGM
	b _080B2B24
	.align 2, 0
_080B2B14: .4byte 0x020226A0
_080B2B18: .4byte 0x000001DD
_080B2B1C:
	movs r0, #0xee
	lsls r0, r0, #1
	bl PlayMapChosenOrBattleBGM
_080B2B24:
	ldr r0, _080B2B54
	ldrh r0, [r0]
	bl sub_080B2A0C
	bl CleanupOverworldWindowsAndTilemaps
	ldr r1, _080B2B58
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080B2B5C
	bl SetMainCallback2
	ldr r1, _080B2B60
	ldr r0, _080B2B64
	str r0, [r1, #8]
	adds r0, r5, #0
	bl DestroyTask
_080B2B4C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2B54: .4byte 0x02037280
_080B2B58: .4byte 0x0203886A
_080B2B5C: .4byte 0x080365B5
_080B2B60: .4byte 0x03002360
_080B2B64: .4byte 0x080B2D69
	thumb_func_end sub_080B2A60

	thumb_func_start sub_080B2B68
sub_080B2B68: @ 0x080B2B68
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080B2B8C
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #7
	bls _080B2B82
	b _080B2CDA
_080B2B82:
	lsls r0, r0, #2
	ldr r1, _080B2B90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2B8C: .4byte 0x03005B68
_080B2B90: .4byte 0x080B2B94
_080B2B94: @ jump table
	.4byte _080B2BB4 @ case 0
	.4byte _080B2BD8 @ case 1
	.4byte _080B2BF0 @ case 2
	.4byte _080B2C04 @ case 3
	.4byte _080B2C58 @ case 4
	.4byte _080B2C6C @ case 5
	.4byte _080B2C76 @ case 6
	.4byte _080B2C86 @ case 7
_080B2BB4:
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r0, _080B2BD0
	ldr r2, _080B2BD4
	adds r1, r2, #0
	strh r1, [r0]
	bl ClearLinkCallback_2
	movs r0, #1
	strh r0, [r5]
	b _080B2CDA
	.align 2, 0
_080B2BD0: .4byte 0x0202267E
_080B2BD4: .4byte 0x00002211
_080B2BD8:
	ldr r0, _080B2BEC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080B2BE6
	b _080B2CDA
_080B2BE6:
	movs r0, #2
	strh r0, [r5]
	b _080B2CDA
	.align 2, 0
_080B2BEC: .4byte 0x02037C74
_080B2BF0:
	ldr r1, _080B2C00
	movs r0, #0
	movs r2, #0x1c
	bl SendBlock
	movs r0, #3
	strh r0, [r5]
	b _080B2CDA
	.align 2, 0
_080B2C00: .4byte 0x02022684
_080B2C04:
	bl GetBlockReceivedStatus
	adds r4, r0, #0
	bl sub_0800A59C
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080B2CDA
	movs r4, #0
	ldr r6, _080B2C1C
	b _080B2C40
	.align 2, 0
_080B2C1C: .4byte 0x020226A0
_080B2C20:
	lsls r1, r4, #8
	ldr r2, _080B2C54
	adds r0, r6, #0
	adds r1, r1, r2
	ldm r1!, {r2, r3, r7}
	stm r0!, {r2, r3, r7}
	ldm r1!, {r2, r3, r7}
	stm r0!, {r2, r3, r7}
	ldr r1, [r1]
	str r1, [r0]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl ResetBlockReceivedFlag
	adds r6, #0x1c
	adds r4, #1
_080B2C40:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _080B2C20
	movs r0, #4
	strh r0, [r5]
	b _080B2CDA
	.align 2, 0
_080B2C54: .4byte 0x0202207C
_080B2C58:
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _080B2CDA
	movs r0, #5
	strh r0, [r5]
	b _080B2CDA
_080B2C6C:
	bl sub_0800A8D4
	movs r0, #6
	strh r0, [r5]
	b _080B2CDA
_080B2C76:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B2CDA
	movs r0, #7
	strh r0, [r5]
	b _080B2CDA
_080B2C86:
	ldr r0, _080B2C9C
	ldr r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B2CA4
	ldr r0, _080B2CA0
	bl PlayMapChosenOrBattleBGM
	b _080B2CAC
	.align 2, 0
_080B2C9C: .4byte 0x020226A0
_080B2CA0: .4byte 0x000001DD
_080B2CA4:
	movs r0, #0xee
	lsls r0, r0, #1
	bl PlayMapChosenOrBattleBGM
_080B2CAC:
	ldr r1, _080B2CE0
	ldr r0, _080B2CE4
	str r0, [r1, #0x14]
	ldr r0, _080B2CE8
	ldrh r0, [r0]
	bl sub_080B2A0C
	bl CleanupOverworldWindowsAndTilemaps
	ldr r1, _080B2CEC
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _080B2CF0
	bl SetMainCallback2
	ldr r1, _080B2CF4
	ldr r0, _080B2CF8
	str r0, [r1, #8]
	adds r0, r4, #0
	bl DestroyTask
_080B2CDA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2CE0: .4byte 0x020226A0
_080B2CE4: .4byte 0x00002211
_080B2CE8: .4byte 0x02037280
_080B2CEC: .4byte 0x0203886A
_080B2CF0: .4byte 0x080365B5
_080B2CF4: .4byte 0x03002360
_080B2CF8: .4byte 0x080B2D69
	thumb_func_end sub_080B2B68

	thumb_func_start sub_080B2CFC
sub_080B2CFC: @ 0x080B2CFC
	push {r4, lr}
	ldr r0, _080B2D18
	movs r1, #0x87
	lsls r1, r1, #3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #1
	beq _080B2D3A
	cmp r0, #1
	bgt _080B2D1C
	cmp r0, #0
	beq _080B2D22
	b _080B2D5A
	.align 2, 0
_080B2D18: .4byte 0x03002360
_080B2D1C:
	cmp r0, #2
	beq _080B2D54
	b _080B2D5A
_080B2D22:
	bl sub_0800A7F8
	bl sub_08009C40
	cmp r0, #0
	beq _080B2D34
	movs r0, #2
	strb r0, [r4]
	b _080B2D5A
_080B2D34:
	movs r0, #1
	strb r0, [r4]
	b _080B2D5A
_080B2D3A:
	ldr r0, _080B2D4C
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B2D5A
	ldr r0, _080B2D50
	bl SetMainCallback2
	b _080B2D5A
	.align 2, 0
_080B2D4C: .4byte 0x030031C4
_080B2D50: .4byte 0x08085A31
_080B2D54:
	ldr r0, _080B2D64
	bl SetMainCallback2
_080B2D5A:
	bl RunTasks
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2D64: .4byte 0x08085A31
	thumb_func_end sub_080B2CFC

	thumb_func_start sub_080B2D68
sub_080B2D68: @ 0x080B2D68
	push {r4, r5, lr}
	ldr r2, _080B2DB8
	ldr r0, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	bl Overworld_ResetMapMusic
	bl LoadPlayerParty
	bl SavePlayerBag
	bl sub_0813BF34
	ldr r0, _080B2DBC
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080B2E0E
	ldr r0, _080B2DC0
	ldrb r0, [r0]
	movs r5, #1
	eors r0, r5
	bl UpdatePlayerLinkBattleRecords
	ldr r0, _080B2DC4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B2E0E
	ldr r0, _080B2DC8
	ldrb r0, [r0]
	cmp r0, #1
	beq _080B2DCC
	cmp r0, #2
	beq _080B2DF0
	b _080B2E0E
	.align 2, 0
_080B2DB8: .4byte 0x02022C90
_080B2DBC: .4byte 0x02037280
_080B2DC0: .4byte 0x03005B14
_080B2DC4: .4byte 0x0300319C
_080B2DC8: .4byte 0x02023FDE
_080B2DCC:
	ldr r4, _080B2DEC
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r4, #4
	adds r1, r1, r4
	ldr r1, [r1]
	movs r0, #0
	bl sub_0801B4A8
	b _080B2E0E
	.align 2, 0
_080B2DEC: .4byte 0x020226A0
_080B2DF0:
	ldr r4, _080B2E1C
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r4, #4
	adds r1, r1, r4
	ldr r1, [r1]
	movs r0, #1
	bl sub_0801B4A8
_080B2E0E:
	bl InUnionRoom
	cmp r0, #1
	bne _080B2E28
	ldr r1, _080B2E20
	ldr r0, _080B2E24
	b _080B2E2C
	.align 2, 0
_080B2E1C: .4byte 0x020226A0
_080B2E20: .4byte 0x03002360
_080B2E24: .4byte 0x080B2CFD
_080B2E28:
	ldr r1, _080B2E3C
	ldr r0, _080B2E40
_080B2E2C:
	str r0, [r1, #8]
	ldr r0, _080B2E44
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2E3C: .4byte 0x03002360
_080B2E40: .4byte 0x08085AA9
_080B2E44: .4byte 0x0809FDED
	thumb_func_end sub_080B2D68

	thumb_func_start CleanupLinkRoomState
CleanupLinkRoomState: @ 0x080B2E48
	push {lr}
	ldr r0, _080B2E74
	ldrh r1, [r0]
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080B2E62
	adds r0, r1, #0
	cmp r0, #5
	beq _080B2E62
	cmp r0, #9
	bne _080B2E6A
_080B2E62:
	bl LoadPlayerParty
	bl SavePlayerBag
_080B2E6A:
	movs r0, #0x7f
	bl SetWarpDestinationToDynamicWarp
	pop {r0}
	bx r0
	.align 2, 0
_080B2E74: .4byte 0x02037280
	thumb_func_end CleanupLinkRoomState

	thumb_func_start ExitLinkRoom
ExitLinkRoom: @ 0x080B2E78
	push {lr}
	bl QueueExitLinkRoomKey
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ExitLinkRoom

	thumb_func_start sub_080B2E84
sub_080B2E84: @ 0x080B2E84
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080B2EA8
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _080B2EC8
	cmp r0, #1
	bgt _080B2EAC
	cmp r0, #0
	beq _080B2EB6
	b _080B2F28
	.align 2, 0
_080B2EA8: .4byte 0x03005B60
_080B2EAC:
	cmp r0, #2
	beq _080B2EE8
	cmp r0, #3
	beq _080B2F14
	b _080B2F28
_080B2EB6:
	ldr r0, _080B2EC4
	bl ShowFieldMessage
	movs r0, #1
	strh r0, [r5, #8]
	b _080B2F28
	.align 2, 0
_080B2EC4: .4byte 0x08247C79
_080B2EC8:
	bl IsFieldMessageBoxHidden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B2F28
	bl sub_08086BEC
	ldr r0, _080B2EE4
	ldrb r0, [r0]
	bl SetLocalLinkPlayerId
	movs r0, #2
	strh r0, [r5, #8]
	b _080B2F28
	.align 2, 0
_080B2EE4: .4byte 0x02037282
_080B2EE8:
	bl sub_08086B78
	cmp r0, #1
	beq _080B2EFA
	cmp r0, #1
	blo _080B2F28
	cmp r0, #2
	beq _080B2F0E
	b _080B2F28
_080B2EFA:
	bl HideFieldMessageBox
	movs r0, #0
	strh r0, [r5, #8]
	bl sub_08086C28
	adds r0, r4, #0
	bl SwitchTaskToFollowupFunc
	b _080B2F28
_080B2F0E:
	movs r0, #3
	strh r0, [r5, #8]
	b _080B2F28
_080B2F14:
	bl sub_08086C00
	movs r0, #1
	bl sub_081978F0
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B2F28:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B2E84

	thumb_func_start sub_080B2F30
sub_080B2F30: @ 0x080B2F30
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080B2F54
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2F54: .4byte 0x080B2E85
	thumb_func_end sub_080B2F30

	thumb_func_start sub_080B2F58
sub_080B2F58: @ 0x080B2F58
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080B2F7C
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080B2F9C
	cmp r0, #1
	bgt _080B2F80
	cmp r0, #0
	beq _080B2F8A
	b _080B2FE0
	.align 2, 0
_080B2F7C: .4byte 0x03005B60
_080B2F80:
	cmp r0, #2
	beq _080B2FB0
	cmp r0, #3
	beq _080B2FCC
	b _080B2FE0
_080B2F8A:
	bl ScriptContext2_Enable
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	bl ClearLinkCallback_2
	b _080B2FC0
_080B2F9C:
	ldr r0, _080B2FAC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B2FE0
	b _080B2FC0
	.align 2, 0
_080B2FAC: .4byte 0x02037C74
_080B2FB0:
	ldr r1, _080B2FC8
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	bl m4aMPlayAllStop
	bl sub_0800A7F8
_080B2FC0:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080B2FE0
	.align 2, 0
_080B2FC8: .4byte 0x02031F38
_080B2FCC:
	ldr r0, _080B2FE8
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B2FE0
	ldr r0, _080B2FEC
	bl SetMainCallback2
	adds r0, r5, #0
	bl DestroyTask
_080B2FE0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2FE8: .4byte 0x030031C4
_080B2FEC: .4byte 0x08076DB5
	thumb_func_end sub_080B2F58

	thumb_func_start sub_080B2FF0
sub_080B2FF0: @ 0x080B2FF0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080B3014
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080B3034
	cmp r0, #1
	bgt _080B3018
	cmp r0, #0
	beq _080B3022
	b _080B3078
	.align 2, 0
_080B3014: .4byte 0x03005B68
_080B3018:
	cmp r0, #2
	beq _080B3048
	cmp r0, #3
	beq _080B3064
	b _080B3078
_080B3022:
	bl ScriptContext2_Enable
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	bl Rfu_set_zero
	b _080B3058
_080B3034:
	ldr r0, _080B3044
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B3078
	b _080B3058
	.align 2, 0
_080B3044: .4byte 0x02037C74
_080B3048:
	ldr r1, _080B3060
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	bl m4aMPlayAllStop
	bl sub_0800A8D4
_080B3058:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080B3078
	.align 2, 0
_080B3060: .4byte 0x02031F38
_080B3064:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3078
	bl sub_08013A80
	adds r0, r5, #0
	bl DestroyTask
_080B3078:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B2FF0

	thumb_func_start PlayerEnteredTradeSeat
PlayerEnteredTradeSeat: @ 0x080B3080
	push {lr}
	ldr r0, _080B3094
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B309C
	ldr r0, _080B3098
	bl sub_080B2F30
	b _080B30A2
	.align 2, 0
_080B3094: .4byte 0x0300319C
_080B3098: .4byte 0x080B2FF1
_080B309C:
	ldr r0, _080B30A8
	bl sub_080B2F30
_080B30A2:
	pop {r0}
	bx r0
	.align 2, 0
_080B30A8: .4byte 0x080B2F59
	thumb_func_end PlayerEnteredTradeSeat

	thumb_func_start sub_080B30AC
sub_080B30AC: @ 0x080B30AC
	push {lr}
	ldr r0, _080B30BC
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B30BC: .4byte 0x080B2F59
	thumb_func_end sub_080B30AC

	thumb_func_start nullsub_37
nullsub_37: @ 0x080B30C0
	bx lr
	.align 2, 0
	thumb_func_end nullsub_37

	thumb_func_start ColosseumPlayerSpotTriggered
ColosseumPlayerSpotTriggered: @ 0x080B30C4
	push {lr}
	ldr r1, _080B30E0
	ldr r2, _080B30E4
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080B30E8
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B30F0
	ldr r0, _080B30EC
	bl sub_080B2F30
	b _080B30F6
	.align 2, 0
_080B30E0: .4byte 0x0202267E
_080B30E4: .4byte 0x00002211
_080B30E8: .4byte 0x0300319C
_080B30EC: .4byte 0x080B2B69
_080B30F0:
	ldr r0, _080B30FC
	bl sub_080B2F30
_080B30F6:
	pop {r0}
	bx r0
	.align 2, 0
_080B30FC: .4byte 0x080B2A61
	thumb_func_end ColosseumPlayerSpotTriggered

	thumb_func_start sub_080B3100
sub_080B3100: @ 0x080B3100
	push {lr}
	ldr r0, _080B3114
	movs r1, #0x50
	bl CreateTask
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080B3114: .4byte 0x080B2E85
	thumb_func_end sub_080B3100

	thumb_func_start sp02A_crash_sound
sp02A_crash_sound: @ 0x080B3118
	push {lr}
	ldr r0, _080B3128
	ldrb r0, [r0]
	ldr r1, _080B312C
	bl ShowTrainerCardInLink
	pop {r0}
	bx r0
	.align 2, 0
_080B3128: .4byte 0x02037284
_080B312C: .4byte 0x08085B35
	thumb_func_end sp02A_crash_sound

	thumb_func_start GetLinkTrainerCardColor
GetLinkTrainerCardColor: @ 0x080B3130
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B316C
	strh r4, [r0]
	ldr r0, _080B3170
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	ldr r2, _080B3174
	adds r1, r1, r2
	bl StringCopy
	adds r0, r4, #0
	bl GetTrainerCardStars
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _080B3180
	ldr r0, _080B3178
	lsls r1, r2, #2
	adds r1, r1, r2
	ldr r2, _080B317C
	adds r1, r1, r2
	bl StringCopy
	movs r0, #1
	b _080B3182
	.align 2, 0
_080B316C: .4byte 0x02037284
_080B3170: .4byte 0x02021C40
_080B3174: .4byte 0x020226A8
_080B3178: .4byte 0x02021C54
_080B317C: .4byte 0x0852B23F
_080B3180:
	movs r0, #0
_080B3182:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLinkTrainerCardColor

	thumb_func_start task00_08081A90
task00_08081A90: @ 0x080B3188
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080B31E8
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	lsls r1, r1, #0x10
	movs r0, #0x96
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080B31BA
	bl CloseLink
	ldr r0, _080B31EC
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_080B31BA:
	ldr r0, _080B31F0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B31FE
	ldr r0, _080B31F4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B31F8
	bl sub_0800A624
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B31DE
	bl CloseLink
	ldr r0, _080B31EC
	bl SetMainCallback2
_080B31DE:
	adds r0, r4, #0
	bl DestroyTask
	b _080B31FE
	.align 2, 0
_080B31E8: .4byte 0x03005B60
_080B31EC: .4byte 0x0800AA0D
_080B31F0: .4byte 0x030031C4
_080B31F4: .4byte 0x0300319C
_080B31F8:
	adds r0, r5, #0
	bl DestroyTask
_080B31FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end task00_08081A90

	thumb_func_start sub_080B3204
sub_080B3204: @ 0x080B3204
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080B3224
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B321C
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
_080B321C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3224: .4byte 0x030031C4
	thumb_func_end sub_080B3204

	thumb_func_start sub_080B3228
sub_080B3228: @ 0x080B3228
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_0800A7F8
	ldr r1, _080B3248
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080B324C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3248: .4byte 0x03005B60
_080B324C: .4byte 0x080B3205
	thumb_func_end sub_080B3228

	thumb_func_start sub_080B3250
sub_080B3250: @ 0x080B3250
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080B3274
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _080B32AC
	cmp r0, #1
	bgt _080B3278
	cmp r0, #0
	beq _080B3282
	b _080B3310
	.align 2, 0
_080B3274: .4byte 0x03005B68
_080B3278:
	cmp r0, #2
	beq _080B32C0
	cmp r0, #3
	beq _080B32F6
	b _080B3310
_080B3282:
	ldr r0, _080B3294
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B3298
	adds r0, r4, #0
	bl DestroyTask
	b _080B3310
	.align 2, 0
_080B3294: .4byte 0x0300319C
_080B3298:
	bl OpenLink
	ldr r0, _080B32A8
	movs r1, #1
	bl CreateTask
	b _080B32EE
	.align 2, 0
_080B32A8: .4byte 0x080B3189
_080B32AC:
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _080B3310
	movs r0, #0
	strh r0, [r5, #2]
	b _080B32EE
_080B32C0:
	bl GetLinkPlayerCount_2
	adds r4, r0, #0
	bl GetSavedPlayerCount
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	blo _080B3310
	bl IsLinkMaster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B32EE
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _080B3310
	bl CheckShouldAdvanceLinkState
_080B32EE:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _080B3310
_080B32F6:
	ldr r0, _080B3318
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B3310
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B3310
	adds r0, r4, #0
	bl DestroyTask
_080B3310:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3318: .4byte 0x030031C4
	thumb_func_end sub_080B3250

	thumb_func_start sub_080B331C
sub_080B331C: @ 0x080B331C
	push {lr}
	ldr r0, _080B3334
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B332E
	ldr r1, _080B3338
	ldr r2, _080B333C
	adds r0, r2, #0
	strh r0, [r1]
_080B332E:
	pop {r0}
	bx r0
	.align 2, 0
_080B3334: .4byte 0x0300319C
_080B3338: .4byte 0x0202267E
_080B333C: .4byte 0x00002288
	thumb_func_end sub_080B331C

