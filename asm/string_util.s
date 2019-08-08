.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start StringCopy10
StringCopy10: @ 0x08008828
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #5
	movs r3, #0
_08008830:
	adds r2, r4, r3
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08008844
	adds r0, r2, #0
	b _08008854
_08008844:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r5
	blo _08008830
	adds r0, r4, r3
	movs r1, #0xff
	strb r1, [r0]
_08008854:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StringCopy10

	thumb_func_start StringGetEnd10
StringGetEnd10: @ 0x0800885C
	push {r4, lr}
	adds r3, r0, #0
	movs r4, #5
	movs r2, #0
_08008864:
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08008870
	adds r0, r1, #0
	b _08008880
_08008870:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r4
	blo _08008864
	adds r0, r3, r2
	movs r1, #0xff
	strb r1, [r0]
_08008880:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StringGetEnd10

	thumb_func_start StringCopy7
StringCopy7: @ 0x08008888
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #5
	movs r3, #0
_08008890:
	adds r2, r4, r3
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080088A4
	adds r0, r2, #0
	b _080088B0
_080088A4:
	adds r3, #1
	cmp r3, r5
	blt _08008890
	adds r0, r4, r3
	movs r1, #0xff
	strb r1, [r0]
_080088B0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StringCopy7

	thumb_func_start StringCopy
StringCopy: @ 0x080088B8
	push {lr}
	adds r3, r0, #0
	b _080088C4
_080088BE:
	strb r2, [r3]
	adds r3, #1
	adds r1, #1
_080088C4:
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _080088BE
	movs r0, #0xff
	strb r0, [r3]
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StringCopy

	thumb_func_start StringAppend
StringAppend: @ 0x080088D8
	push {lr}
	adds r2, r0, #0
	b _080088E0
_080088DE:
	adds r2, #1
_080088E0:
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080088DE
	adds r0, r2, #0
	bl StringCopy
	pop {r1}
	bx r1
	thumb_func_end StringAppend

	thumb_func_start StringCopyN
StringCopyN: @ 0x080088F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r3, #0
	adds r0, r5, #0
	cmp r3, r0
	bhs _08008916
	adds r2, r0, #0
_08008904:
	adds r1, r4, r3
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	blo _08008904
_08008916:
	adds r0, r4, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StringCopyN

	thumb_func_start StringAppendN
StringAppendN: @ 0x08008920
	push {lr}
	adds r3, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	b _0800892C
_0800892A:
	adds r3, #1
_0800892C:
	ldrb r0, [r3]
	cmp r0, #0xff
	bne _0800892A
	adds r0, r3, #0
	bl StringCopyN
	pop {r1}
	bx r1
	thumb_func_end StringAppendN

	thumb_func_start StringLength
StringLength: @ 0x0800893C
	push {lr}
	adds r2, r0, #0
	movs r1, #0
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08008956
_08008948:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08008948
_08008956:
	adds r0, r1, #0
	pop {r1}
	bx r1
	thumb_func_end StringLength

	thumb_func_start StringCompare
StringCompare: @ 0x0800895C
	push {lr}
	adds r2, r0, #0
	b _0800896E
_08008962:
	cmp r0, #0xff
	bne _0800896A
	movs r0, #0
	b _0800897C
_0800896A:
	adds r2, #1
	adds r1, #1
_0800896E:
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r0, r3
	beq _08008962
	ldrb r0, [r2]
	ldrb r1, [r1]
	subs r0, r0, r1
_0800897C:
	pop {r1}
	bx r1
	thumb_func_end StringCompare

	thumb_func_start StringCompareN
StringCompareN: @ 0x08008980
	push {r4, lr}
	adds r3, r0, #0
	b _08008998
_08008986:
	cmp r0, #0xff
	beq _08008994
	adds r3, #1
	adds r1, #1
	subs r2, #1
	cmp r2, #0
	bne _08008998
_08008994:
	movs r0, #0
	b _080089A6
_08008998:
	ldrb r0, [r3]
	ldrb r4, [r1]
	cmp r0, r4
	beq _08008986
	ldrb r0, [r3]
	ldrb r1, [r1]
	subs r0, r0, r1
_080089A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StringCompareN

	thumb_func_start IsStringLengthAtLeast
IsStringLengthAtLeast: @ 0x080089AC
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	cmp r2, r1
	bge _080089D0
_080089B6:
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080089C6
	cmp r0, #0xff
	beq _080089C6
	movs r0, #1
	b _080089D2
_080089C6:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	blt _080089B6
_080089D0:
	movs r0, #0
_080089D2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsStringLengthAtLeast

	thumb_func_start ConvertIntToDecimalStringN
ConvertIntToDecimalStringN: @ 0x080089D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r3, r3, #0x18
	ldr r0, _08008A28
	lsrs r3, r3, #0x16
	subs r3, #4
	adds r3, r3, r0
	ldr r0, [r3]
	movs r7, #0
	cmp r2, #1
	bne _080089F6
	movs r7, #2
_080089F6:
	cmp r2, #2
	bne _080089FC
	movs r7, #1
_080089FC:
	adds r5, r0, #0
	cmp r5, #0
	ble _08008A68
	ldr r0, _08008A2C
	mov r8, r0
_08008A06:
	adds r0, r6, #0
	adds r1, r5, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r5, #0
	muls r0, r2, r0
	subs r1, r6, r0
	cmp r7, #1
	bne _08008A30
	adds r3, r4, #0
	adds r4, #1
	cmp r2, #9
	bls _08008A42
	b _08008A4A
	.align 2, 0
_08008A28: .4byte 0x082BF44C
_08008A2C: .4byte 0x082BF43C
_08008A30:
	cmp r2, #0
	bne _08008A38
	cmp r5, #1
	bne _08008A50
_08008A38:
	movs r7, #1
	adds r3, r4, #0
	adds r4, #1
	cmp r2, #9
	bhi _08008A4A
_08008A42:
	mov r6, r8
	adds r0, r2, r6
	ldrb r0, [r0]
	b _08008A4C
_08008A4A:
	movs r0, #0xac
_08008A4C:
	strb r0, [r3]
	b _08008A58
_08008A50:
	cmp r7, #2
	bne _08008A58
	strb r2, [r4]
	adds r4, #1
_08008A58:
	adds r6, r1, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bgt _08008A06
_08008A68:
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end ConvertIntToDecimalStringN

	thumb_func_start ConvertUIntToDecimalStringN
ConvertUIntToDecimalStringN: @ 0x08008A78
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r3, r3, #0x18
	ldr r0, _08008AC8
	lsrs r3, r3, #0x16
	subs r3, #4
	adds r3, r3, r0
	ldr r0, [r3]
	movs r7, #0
	cmp r2, #1
	bne _08008A96
	movs r7, #2
_08008A96:
	cmp r2, #2
	bne _08008A9C
	movs r7, #1
_08008A9C:
	adds r5, r0, #0
	cmp r5, #0
	ble _08008B08
	ldr r0, _08008ACC
	mov r8, r0
_08008AA6:
	adds r0, r6, #0
	adds r1, r5, #0
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r5, #0
	muls r0, r2, r0
	subs r1, r6, r0
	cmp r7, #1
	bne _08008AD0
	adds r3, r4, #0
	adds r4, #1
	cmp r2, #9
	bls _08008AE2
	b _08008AEA
	.align 2, 0
_08008AC8: .4byte 0x082BF44C
_08008ACC: .4byte 0x082BF43C
_08008AD0:
	cmp r2, #0
	bne _08008AD8
	cmp r5, #1
	bne _08008AF0
_08008AD8:
	movs r7, #1
	adds r3, r4, #0
	adds r4, #1
	cmp r2, #9
	bhi _08008AEA
_08008AE2:
	mov r6, r8
	adds r0, r2, r6
	ldrb r0, [r0]
	b _08008AEC
_08008AEA:
	movs r0, #0xac
_08008AEC:
	strb r0, [r3]
	b _08008AF8
_08008AF0:
	cmp r7, #2
	bne _08008AF8
	strb r2, [r4]
	adds r4, #1
_08008AF8:
	adds r6, r1, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bgt _08008AA6
_08008B08:
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end ConvertUIntToDecimalStringN

	thumb_func_start ConvertIntToHexStringN
ConvertIntToHexStringN: @ 0x08008B18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #1
	movs r0, #1
	cmp r1, r3
	bhs _08008B3C
_08008B30:
	lsls r1, r1, #4
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r3
	blo _08008B30
_08008B3C:
	movs r3, #0
	cmp r2, #1
	bne _08008B44
	movs r3, #2
_08008B44:
	cmp r2, #2
	bne _08008B4A
	movs r3, #1
_08008B4A:
	adds r5, r1, #0
	cmp r5, #0
	ble _08008BB8
	ldr r0, _08008B7C
	mov r8, r0
_08008B54:
	adds r0, r7, #0
	adds r1, r5, #0
	str r3, [sp]
	bl __divsi3
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r5, #0
	bl __modsi3
	adds r1, r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bne _08008B80
	adds r2, r6, #0
	adds r6, #1
	cmp r4, #0xf
	bls _08008B92
	b _08008B9A
	.align 2, 0
_08008B7C: .4byte 0x082BF43C
_08008B80:
	cmp r4, #0
	bne _08008B88
	cmp r5, #1
	bne _08008BA0
_08008B88:
	movs r3, #1
	adds r2, r6, #0
	adds r6, #1
	cmp r4, #0xf
	bhi _08008B9A
_08008B92:
	mov r7, r8
	adds r0, r4, r7
	ldrb r0, [r0]
	b _08008B9C
_08008B9A:
	movs r0, #0xac
_08008B9C:
	strb r0, [r2]
	b _08008BA8
_08008BA0:
	cmp r3, #2
	bne _08008BA8
	strb r4, [r6]
	adds r6, #1
_08008BA8:
	adds r7, r1, #0
	adds r0, r5, #0
	cmp r5, #0
	bge _08008BB2
	adds r0, #0xf
_08008BB2:
	asrs r5, r0, #4
	cmp r5, #0
	bgt _08008B54
_08008BB8:
	movs r0, #0xff
	strb r0, [r6]
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ConvertIntToHexStringN

	thumb_func_start StringExpandPlaceholders
StringExpandPlaceholders: @ 0x08008BCC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
_08008BD2:
	ldrb r2, [r5]
	adds r5, #1
	adds r0, r2, #0
	subs r0, #0xfa
	cmp r0, #5
	bhi _08008CA6
	lsls r0, r0, #2
	ldr r1, _08008BE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008BE8: .4byte 0x08008BEC
_08008BEC: @ jump table
	.4byte _08008CA6 @ case 0
	.4byte _08008CA6 @ case 1
	.4byte _08008C18 @ case 2
	.4byte _08008C04 @ case 3
	.4byte _08008CA6 @ case 4
	.4byte _08008CAC @ case 5
_08008C04:
	ldrb r0, [r5]
	adds r5, #1
	bl GetExpandedPlaceholder
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r4, r0, #0
	b _08008BD2
_08008C18:
	strb r2, [r4]
	adds r4, #1
	ldrb r2, [r5]
	adds r5, #1
	strb r2, [r4]
	adds r4, #1
	subs r0, r2, #4
	cmp r0, #0x14
	bhi _08008C9C
	lsls r0, r0, #2
	ldr r1, _08008C34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008C34: .4byte 0x08008C38
_08008C38: @ jump table
	.4byte _08008C8C @ case 0
	.4byte _08008C9C @ case 1
	.4byte _08008C9C @ case 2
	.4byte _08008BD2 @ case 3
	.4byte _08008C9C @ case 4
	.4byte _08008BD2 @ case 5
	.4byte _08008C9C @ case 6
	.4byte _08008C94 @ case 7
	.4byte _08008C9C @ case 8
	.4byte _08008C9C @ case 9
	.4byte _08008C9C @ case 10
	.4byte _08008BD2 @ case 11
	.4byte _08008C9C @ case 12
	.4byte _08008C9C @ case 13
	.4byte _08008C9C @ case 14
	.4byte _08008C9C @ case 15
	.4byte _08008C9C @ case 16
	.4byte _08008BD2 @ case 17
	.4byte _08008BD2 @ case 18
	.4byte _08008BD2 @ case 19
	.4byte _08008BD2 @ case 20
_08008C8C:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
_08008C94:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
_08008C9C:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	b _08008BD2
_08008CA6:
	strb r2, [r4]
	adds r4, #1
	b _08008BD2
_08008CAC:
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end StringExpandPlaceholders

	thumb_func_start StringBraille
StringBraille: @ 0x08008CB8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08008CF0
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r4, sp, #4
	ldr r1, _08008CF4
	adds r0, r4, #0
	movs r2, #5
	bl memcpy
	adds r0, r5, #0
	mov r1, sp
_08008CDA:
	bl StringCopy
	adds r5, r0, #0
_08008CE0:
	ldrb r0, [r6]
	adds r6, #1
	cmp r0, #0xfe
	beq _08008CF8
	cmp r0, #0xff
	bne _08008CFE
	b _08008D0A
	.align 2, 0
_08008CF0: .4byte 0x082BF474
_08008CF4: .4byte 0x082BF478
_08008CF8:
	adds r0, r5, #0
	adds r1, r4, #0
	b _08008CDA
_08008CFE:
	strb r0, [r5]
	adds r5, #1
	adds r0, #0x40
	strb r0, [r5]
	adds r5, #1
	b _08008CE0
_08008D0A:
	strb r0, [r5]
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StringBraille

	thumb_func_start ExpandPlaceholder_UnknownStringVar
ExpandPlaceholder_UnknownStringVar: @ 0x08008D18
	ldr r0, _08008D1C
	bx lr
	.align 2, 0
_08008D1C: .4byte 0x02022064
	thumb_func_end ExpandPlaceholder_UnknownStringVar

	thumb_func_start ExpandPlaceholder_PlayerName
ExpandPlaceholder_PlayerName: @ 0x08008D20
	ldr r0, _08008D28
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08008D28: .4byte 0x03005AF0
	thumb_func_end ExpandPlaceholder_PlayerName

	thumb_func_start ExpandPlaceholder_StringVar1
ExpandPlaceholder_StringVar1: @ 0x08008D2C
	ldr r0, _08008D30
	bx lr
	.align 2, 0
_08008D30: .4byte 0x02021C40
	thumb_func_end ExpandPlaceholder_StringVar1

	thumb_func_start ExpandPlaceholder_StringVar2
ExpandPlaceholder_StringVar2: @ 0x08008D34
	ldr r0, _08008D38
	bx lr
	.align 2, 0
_08008D38: .4byte 0x02021C54
	thumb_func_end ExpandPlaceholder_StringVar2

	thumb_func_start ExpandPlaceholder_StringVar3
ExpandPlaceholder_StringVar3: @ 0x08008D3C
	ldr r0, _08008D40
	bx lr
	.align 2, 0
_08008D40: .4byte 0x02021C68
	thumb_func_end ExpandPlaceholder_StringVar3

	thumb_func_start ExpandPlaceholder_KunChan
ExpandPlaceholder_KunChan: @ 0x08008D44
	push {lr}
	ldr r0, _08008D54
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08008D5C
	ldr r0, _08008D58
	b _08008D5E
	.align 2, 0
_08008D54: .4byte 0x03005AF0
_08008D58: .4byte 0x085C8C28
_08008D5C:
	ldr r0, _08008D64
_08008D5E:
	pop {r1}
	bx r1
	.align 2, 0
_08008D64: .4byte 0x085C8C25
	thumb_func_end ExpandPlaceholder_KunChan

	thumb_func_start ExpandPlaceholder_RivalName
ExpandPlaceholder_RivalName: @ 0x08008D68
	push {lr}
	ldr r0, _08008D78
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08008D80
	ldr r0, _08008D7C
	b _08008D82
	.align 2, 0
_08008D78: .4byte 0x03005AF0
_08008D7C: .4byte 0x085C8C5A
_08008D80:
	ldr r0, _08008D88
_08008D82:
	pop {r1}
	bx r1
	.align 2, 0
_08008D88: .4byte 0x085C8C5E
	thumb_func_end ExpandPlaceholder_RivalName

	thumb_func_start ExpandPlaceholder_Version
ExpandPlaceholder_Version: @ 0x08008D8C
	ldr r0, _08008D90
	bx lr
	.align 2, 0
_08008D90: .4byte 0x085C8C36
	thumb_func_end ExpandPlaceholder_Version

	thumb_func_start ExpandPlaceholder_Aqua
ExpandPlaceholder_Aqua: @ 0x08008D94
	ldr r0, _08008D98
	bx lr
	.align 2, 0
_08008D98: .4byte 0x085C8C3C
	thumb_func_end ExpandPlaceholder_Aqua

	thumb_func_start ExpandPlaceholder_Magma
ExpandPlaceholder_Magma: @ 0x08008D9C
	ldr r0, _08008DA0
	bx lr
	.align 2, 0
_08008DA0: .4byte 0x085C8C40
	thumb_func_end ExpandPlaceholder_Magma

	thumb_func_start ExpandPlaceholder_Archie
ExpandPlaceholder_Archie: @ 0x08008DA4
	ldr r0, _08008DA8
	bx lr
	.align 2, 0
_08008DA8: .4byte 0x085C8C44
	thumb_func_end ExpandPlaceholder_Archie

	thumb_func_start ExpandPlaceholder_Maxie
ExpandPlaceholder_Maxie: @ 0x08008DAC
	ldr r0, _08008DB0
	bx lr
	.align 2, 0
_08008DB0: .4byte 0x085C8C49
	thumb_func_end ExpandPlaceholder_Maxie

	thumb_func_start ExpandPlaceholder_Kyogre
ExpandPlaceholder_Kyogre: @ 0x08008DB4
	ldr r0, _08008DB8
	bx lr
	.align 2, 0
_08008DB8: .4byte 0x085C8C4E
	thumb_func_end ExpandPlaceholder_Kyogre

	thumb_func_start ExpandPlaceholder_Groudon
ExpandPlaceholder_Groudon: @ 0x08008DBC
	ldr r0, _08008DC0
	bx lr
	.align 2, 0
_08008DC0: .4byte 0x085C8C54
	thumb_func_end ExpandPlaceholder_Groudon

	thumb_func_start GetExpandedPlaceholder
GetExpandedPlaceholder: @ 0x08008DC4
	push {lr}
	cmp r0, #0xd
	bhi _08008DDC
	ldr r1, _08008DD8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _08008DDE
	.align 2, 0
_08008DD8: .4byte 0x082BF480
_08008DDC:
	ldr r0, _08008DE4
_08008DDE:
	pop {r1}
	bx r1
	.align 2, 0
_08008DE4: .4byte 0x085C8C24
	thumb_func_end GetExpandedPlaceholder

	thumb_func_start StringFill
StringFill: @ 0x08008DE8
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	cmp r0, r2
	bhs _08008E08
_08008DFA:
	strb r1, [r3]
	adds r3, #1
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r2
	blo _08008DFA
_08008E08:
	movs r0, #0xff
	strb r0, [r3]
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StringFill

	thumb_func_start StringCopyPadded
StringCopyPadded: @ 0x08008E14
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	b _08008E34
_08008E24:
	strb r1, [r4]
	adds r5, #1
	adds r4, #1
	cmp r3, #0
	beq _08008E34
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08008E34:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _08008E24
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08008E64
	cmp r3, r0
	beq _08008E58
	adds r1, r0, #0
_08008E4A:
	strb r2, [r4]
	adds r4, #1
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	bne _08008E4A
_08008E58:
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08008E64: .4byte 0x0000FFFF
	thumb_func_end StringCopyPadded

	thumb_func_start StringFillWithTerminator
StringFillWithTerminator: @ 0x08008E68
	push {lr}
	lsls r2, r1, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0xff
	bl StringFill
	pop {r1}
	bx r1
	thumb_func_end StringFillWithTerminator

	thumb_func_start StringCopyN_Multibyte
StringCopyN_Multibyte: @ 0x08008E78
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	subs r2, #1
	movs r5, #1
	rsbs r5, r5, #0
	b _08008E9E
_08008E86:
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r0, r3, #1
	ldrb r0, [r0]
	cmp r0, #0xf9
	bne _08008E9C
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
_08008E9C:
	subs r2, #1
_08008E9E:
	cmp r2, r5
	beq _08008EAA
	ldrb r0, [r3]
	adds r1, r0, #0
	cmp r1, #0xff
	bne _08008E86
_08008EAA:
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StringCopyN_Multibyte

	thumb_func_start StringLength_Multibyte
StringLength_Multibyte: @ 0x08008EB8
	push {lr}
	adds r2, r0, #0
	movs r3, #0
	b _08008ECA
_08008EC0:
	cmp r1, #0xf9
	bne _08008EC6
	adds r2, #1
_08008EC6:
	adds r2, #1
	adds r3, #1
_08008ECA:
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _08008EC0
	adds r0, r3, #0
	pop {r1}
	bx r1
	thumb_func_end StringLength_Multibyte

	thumb_func_start WriteColorChangeControlCode
WriteColorChangeControlCode: @ 0x08008ED8
	push {lr}
	adds r3, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0xfc
	strb r0, [r3]
	adds r3, #1
	cmp r1, #1
	beq _08008EFA
	cmp r1, #1
	blo _08008EF4
	cmp r1, #2
	beq _08008F00
	b _08008F04
_08008EF4:
	movs r0, #1
	strb r0, [r3]
	b _08008F02
_08008EFA:
	movs r0, #3
	strb r0, [r3]
	b _08008F02
_08008F00:
	strb r1, [r3]
_08008F02:
	adds r3, #1
_08008F04:
	strb r2, [r3]
	adds r3, #1
	movs r0, #0xff
	strb r0, [r3]
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WriteColorChangeControlCode

	thumb_func_start IsStringJapanese
IsStringJapanese: @ 0x08008F14
	push {lr}
	adds r2, r0, #0
	b _08008F2A
_08008F1A:
	adds r0, r1, #0
	cmp r0, #0xa0
	bhi _08008F28
	cmp r0, #0
	beq _08008F28
	movs r0, #1
	b _08008F34
_08008F28:
	adds r2, #1
_08008F2A:
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _08008F1A
	movs r0, #0
_08008F34:
	pop {r1}
	bx r1
	thumb_func_end IsStringJapanese

	thumb_func_start sub_08008F38
sub_08008F38: @ 0x08008F38
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r1, #0
	b _08008F54
_08008F42:
	adds r0, r2, #0
	cmp r0, #0xa0
	bhi _08008F50
	cmp r0, #0
	beq _08008F50
	movs r0, #1
	b _08008F62
_08008F50:
	adds r3, #1
	adds r1, #1
_08008F54:
	ldrb r2, [r3]
	adds r0, r2, #0
	cmp r0, #0xff
	beq _08008F60
	cmp r1, r4
	blt _08008F42
_08008F60:
	movs r0, #0
_08008F62:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08008F38

