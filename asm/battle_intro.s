.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetAnimBgAttribute
SetAnimBgAttribute: @ 0x0811887C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r6, #3
	bls _08118890
	b _08118982
_08118890:
	ldr r0, _081188AC
	adds r0, r6, r0
	ldrb r0, [r0]
	bl GetGpuReg
	ldr r1, _081188B0
	strh r0, [r1]
	cmp r5, #6
	bhi _08118974
	lsls r0, r5, #2
	ldr r1, _081188B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081188AC: .4byte 0x08572FFE
_081188B0: .4byte 0x02039DE0
_081188B4: .4byte 0x081188B8
_081188B8: @ jump table
	.4byte _081188D4 @ case 0
	.4byte _081188E8 @ case 1
	.4byte _08118900 @ case 2
	.4byte _08118918 @ case 3
	.4byte _08118930 @ case 4
	.4byte _0811894C @ case 5
	.4byte _08118960 @ case 6
_081188D4:
	ldr r2, _081188E4
	lsls r3, r4, #6
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #1]
	b _08118974
	.align 2, 0
_081188E4: .4byte 0x02039DE0
_081188E8:
	ldr r3, _081188FC
	movs r0, #1
	adds r1, r4, #0
	ands r1, r0
	lsls r1, r1, #5
	ldrb r2, [r3, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	b _0811896E
	.align 2, 0
_081188FC: .4byte 0x02039DE0
_08118900:
	ldr r3, _08118914
	movs r0, #1
	adds r1, r4, #0
	ands r1, r0
	lsls r1, r1, #6
	ldrb r2, [r3]
	movs r0, #0x41
	rsbs r0, r0, #0
	b _0811893E
	.align 2, 0
_08118914: .4byte 0x02039DE0
_08118918:
	ldr r3, _0811892C
	movs r0, #3
	adds r1, r4, #0
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	b _0811893E
	.align 2, 0
_0811892C: .4byte 0x02039DE0
_08118930:
	ldr r3, _08118948
	movs r0, #3
	adds r1, r4, #0
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #4
	rsbs r0, r0, #0
_0811893E:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08118974
	.align 2, 0
_08118948: .4byte 0x02039DE0
_0811894C:
	ldr r2, _0811895C
	lsls r3, r4, #7
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b _08118974
	.align 2, 0
_0811895C: .4byte 0x02039DE0
_08118960:
	ldr r3, _08118988
	movs r0, #0x1f
	adds r1, r4, #0
	ands r1, r0
	ldrb r2, [r3, #1]
	movs r0, #0x20
	rsbs r0, r0, #0
_0811896E:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
_08118974:
	ldr r0, _0811898C
	adds r0, r6, r0
	ldrb r0, [r0]
	ldr r1, _08118988
	ldrh r1, [r1]
	bl SetGpuReg
_08118982:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08118988: .4byte 0x02039DE0
_0811898C: .4byte 0x08572FFE
	thumb_func_end SetAnimBgAttribute

	thumb_func_start GetAnimBgAttribute
GetAnimBgAttribute: @ 0x08118990
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r2, #3
	bhi _08118A18
	ldr r0, _081189BC
	adds r0, r2, r0
	ldrb r0, [r0]
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	cmp r4, #6
	bhi _08118A18
	lsls r0, r4, #2
	ldr r1, _081189C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081189BC: .4byte 0x08573002
_081189C0: .4byte 0x081189C4
_081189C4: @ jump table
	.4byte _081189E0 @ case 0
	.4byte _081189E8 @ case 1
	.4byte _081189F0 @ case 2
	.4byte _081189F8 @ case 3
	.4byte _08118A00 @ case 4
	.4byte _08118A08 @ case 5
	.4byte _08118A10 @ case 6
_081189E0:
	ldr r0, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1e
	b _08118A1A
_081189E8:
	ldr r0, [sp]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x1f
	b _08118A1A
_081189F0:
	ldr r0, [sp]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	b _08118A1A
_081189F8:
	ldr r0, [sp]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	b _08118A1A
_08118A00:
	ldr r0, [sp]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	b _08118A1A
_08118A08:
	ldr r0, [sp]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	b _08118A1A
_08118A10:
	ldr r0, [sp]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1b
	b _08118A1A
_08118A18:
	movs r0, #0
_08118A1A:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetAnimBgAttribute

	thumb_func_start HandleIntroSlide
HandleIntroSlide: @ 0x08118A24
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _08118A48
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08118A58
	ldr r0, _08118A4C
	ldrh r1, [r0]
	ldr r0, _08118A50
	cmp r1, r0
	beq _08118A58
	ldr r0, _08118A54
	b _08118AA8
	.align 2, 0
_08118A48: .4byte 0x02022C90
_08118A4C: .4byte 0x0203886E
_08118A50: .4byte 0x00000C03
_08118A54: .4byte 0x081195B9
_08118A58:
	ldr r2, [r2]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08118A6C
	ldr r0, _08118A68
	b _08118AA8
	.align 2, 0
_08118A68: .4byte 0x08119311
_08118A6C:
	ldr r0, _08118A78
	ands r0, r2
	cmp r0, #0
	beq _08118A80
	ldr r0, _08118A7C
	b _08118AA8
	.align 2, 0
_08118A78: .4byte 0x003F0100
_08118A7C: .4byte 0x08119095
_08118A80:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r2, r0
	cmp r2, #0
	beq _08118AA0
	ldr r0, _08118A98
	ldrb r0, [r0]
	cmp r0, #2
	beq _08118AA0
	movs r4, #3
	ldr r0, _08118A9C
	b _08118AA8
	.align 2, 0
_08118A98: .4byte 0x0829BDA4
_08118A9C: .4byte 0x08118D89
_08118AA0:
	ldr r1, _08118AD4
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
_08118AA8:
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08118AD8
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1, #8]
	strh r4, [r1, #0xa]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x10]
	strh r0, [r1, #0x12]
	strh r0, [r1, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08118AD4: .4byte 0x08573008
_08118AD8: .4byte 0x03005B60
	thumb_func_end HandleIntroSlide

	thumb_func_start sub_08118ADC
sub_08118ADC: @ 0x08118ADC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	ldr r0, _08118B28
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08118B2C
	strh r1, [r0]
	ldr r0, _08118B30
	strh r1, [r0]
	ldr r0, _08118B34
	strh r1, [r0]
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldr r4, _08118B38
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08118B28: .4byte 0x02022ACC
_08118B2C: .4byte 0x02022ACE
_08118B30: .4byte 0x02022AD0
_08118B34: .4byte 0x02022AD2
_08118B38: .4byte 0x00003F3F
	thumb_func_end sub_08118ADC

	thumb_func_start BattleIntroSlide1
BattleIntroSlide1: @ 0x08118B3C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08118B74
	ldrh r0, [r1]
	adds r0, #6
	strh r0, [r1]
	ldr r1, _08118B78
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, #4
	bls _08118B68
	b _08118D7A
_08118B68:
	lsls r0, r0, #2
	ldr r1, _08118B7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08118B74: .4byte 0x02022ACC
_08118B78: .4byte 0x03005B60
_08118B7C: .4byte 0x08118B80
_08118B80: @ jump table
	.4byte _08118B94 @ case 0
	.4byte _08118BC4 @ case 1
	.4byte _08118BEC @ case 2
	.4byte _08118C34 @ case 3
	.4byte _08118D74 @ case 4
_08118B94:
	ldr r0, _08118BAC
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08118BB0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	add r0, r8
	movs r1, #0x10
	b _08118BBA
	.align 2, 0
_08118BAC: .4byte 0x02022C90
_08118BB0:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	add r0, r8
	movs r1, #1
_08118BBA:
	strh r1, [r0, #0xc]
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _08118D7A
_08118BC4:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	mov r3, r8
	adds r1, r0, r3
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08118BDC
	b _08118D7A
_08118BDC:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	b _08118D7A
_08118BEC:
	ldr r1, _08118C28
	ldrh r0, [r1]
	subs r0, #0xff
	strh r0, [r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	movs r1, #0xc0
	lsls r1, r1, #6
	cmp r0, r1
	beq _08118C04
	b _08118D7A
_08118C04:
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	add r1, r8
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0xf0
	strh r0, [r1, #0xc]
	movs r0, #0x20
	strh r0, [r1, #0xe]
	ldr r2, _08118C2C
	ldrh r1, [r2]
	ldr r0, _08118C30
	ands r0, r1
	strh r0, [r2]
	b _08118D7A
	.align 2, 0
_08118C28: .4byte 0x02022ADA
_08118C2C: .4byte 0x020240A0
_08118C30: .4byte 0x0000FFFE
_08118C34:
	lsls r0, r4, #2
	adds r1, r0, r4
	lsls r1, r1, #3
	mov r5, r8
	adds r2, r1, r5
	ldrh r3, [r2, #0xe]
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	mov ip, r0
	cmp r1, #0
	beq _08118C50
	subs r0, r3, #1
	strh r0, [r2, #0xe]
	b _08118C7E
_08118C50:
	movs r1, #0xa
	ldrsh r0, [r2, r1]
	cmp r0, #1
	bne _08118C70
	ldr r2, _08118C68
	ldrh r1, [r2]
	ldr r0, _08118C6C
	cmp r1, r0
	beq _08118C7E
	subs r0, r1, #2
	b _08118C7C
	.align 2, 0
_08118C68: .4byte 0x02022ACE
_08118C6C: .4byte 0x0000FFB0
_08118C70:
	ldr r2, _08118D50
	ldrh r1, [r2]
	ldr r0, _08118D54
	cmp r1, r0
	beq _08118C7E
	subs r0, r1, #1
_08118C7C:
	strh r0, [r2]
_08118C7E:
	ldr r2, _08118D58
	ldrh r1, [r2]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08118C92
	ldr r3, _08118D5C
	adds r0, r1, r3
	strh r0, [r2]
_08118C92:
	mov r5, ip
	adds r0, r5, r4
	lsls r0, r0, #3
	mov r2, r8
	adds r1, r0, r2
	ldrh r2, [r1, #0xc]
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08118CAA
	subs r0, r2, #2
	strh r0, [r1, #0xc]
_08118CAA:
	movs r3, #0
	ldr r5, _08118D60
	mov sb, r5
	ldr r7, _08118D64
	mov r6, sb
	adds r5, r1, #0
_08118CB6:
	lsls r2, r3, #1
	ldrb r1, [r6, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r7
	ldrh r0, [r5, #0xc]
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x4f
	ble _08118CB6
	cmp r3, #0x9f
	bgt _08118CFA
	ldr r7, _08118D64
	ldr r6, _08118D60
	ldr r1, _08118D68
	mov r2, ip
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r5, r0, r1
_08118CE0:
	lsls r2, r3, #1
	ldrb r1, [r6, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r7
	ldrh r0, [r5, #0xc]
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x9f
	ble _08118CE0
_08118CFA:
	mov r3, ip
	adds r0, r3, r4
	lsls r0, r0, #3
	mov r5, r8
	adds r1, r0, r5
	movs r0, #0xc
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bne _08118D7A
	movs r0, #3
	mov r3, sb
	strb r0, [r3, #0x15]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	str r2, [sp]
	ldr r1, _08118D6C
	ldr r2, _08118D70
	mov r0, sp
	bl CpuSet
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r1, #0x9c
	lsls r1, r1, #8
	movs r0, #0xa
	bl SetGpuReg
	movs r1, #0xbc
	lsls r1, r1, #7
	movs r0, #0xc
	bl SetGpuReg
	b _08118D7A
	.align 2, 0
_08118D50: .4byte 0x02022ACE
_08118D54: .4byte 0x0000FFC8
_08118D58: .4byte 0x02022ADA
_08118D5C: .4byte 0xFFFFFC04
_08118D60: .4byte 0x020397C8
_08118D64: .4byte 0x020388C8
_08118D68: .4byte 0x03005B60
_08118D6C: .4byte 0x0600E000
_08118D70: .4byte 0x05000200
_08118D74:
	adds r0, r4, #0
	bl sub_08118ADC
_08118D7A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end BattleIntroSlide1

	thumb_func_start BattleIntroSlide2
BattleIntroSlide2: @ 0x08118D88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08118DB4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0xa
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #3
	beq _08118DC8
	cmp r0, #3
	bgt _08118DB8
	cmp r0, #2
	beq _08118DBC
	b _08118DD0
	.align 2, 0
_08118DB4: .4byte 0x03005B60
_08118DB8:
	cmp r0, #4
	bne _08118DD0
_08118DBC:
	ldr r1, _08118DC4
	ldrh r0, [r1]
	adds r0, #8
	b _08118DCE
	.align 2, 0
_08118DC4: .4byte 0x02022ACC
_08118DC8:
	ldr r1, _08118E0C
	ldrh r0, [r1]
	adds r0, #6
_08118DCE:
	strh r0, [r1]
_08118DD0:
	lsls r0, r5, #2
	adds r1, r0, r5
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r3, #0xa
	ldrsh r1, [r4, r3]
	adds r6, r0, #0
	cmp r1, #4
	bne _08118E34
	ldr r7, _08118E10
	ldrh r0, [r4, #0x14]
	bl Cos2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08118DF6
	ldr r1, _08118E14
	adds r0, r0, r1
_08118DF6:
	asrs r0, r0, #9
	subs r0, #8
	strh r0, [r7]
	ldrh r1, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #0xb3
	bgt _08118E18
	adds r0, r1, #4
	b _08118E1A
	.align 2, 0
_08118E0C: .4byte 0x02022ACC
_08118E10: .4byte 0x02022ACE
_08118E14: .4byte 0x000001FF
_08118E18:
	adds r0, r1, #6
_08118E1A:
	strh r0, [r4, #0x14]
	ldr r2, _08118E50
	adds r0, r6, r5
	lsls r0, r0, #3
	adds r3, r0, r2
	movs r0, #0x14
	ldrsh r1, [r3, r0]
	movs r0, #0xb4
	lsls r0, r0, #1
	cmp r1, r0
	bne _08118E34
	movs r0, #0
	strh r0, [r3, #0x14]
_08118E34:
	adds r0, r6, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bls _08118E44
	b _0811906A
_08118E44:
	lsls r0, r0, #2
	ldr r1, _08118E54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08118E50: .4byte 0x03005B60
_08118E54: .4byte 0x08118E58
_08118E58: @ jump table
	.4byte _08118E6C @ case 0
	.4byte _08118E9C @ case 1
	.4byte _08118EC8 @ case 2
	.4byte _08118F18 @ case 3
	.4byte _08119064 @ case 4
_08118E6C:
	ldr r1, _08118E88
	adds r0, r6, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r3, #0x10
	strh r3, [r2, #0x10]
	ldr r0, _08118E8C
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08118E90
	strh r3, [r2, #0xc]
	b _08118E94
	.align 2, 0
_08118E88: .4byte 0x03005B60
_08118E8C: .4byte 0x02022C90
_08118E90:
	movs r0, #1
	strh r0, [r2, #0xc]
_08118E94:
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	b _0811906A
_08118E9C:
	ldr r0, _08118EC4
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08118EB2
	b _0811906A
_08118EB2:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	b _0811906A
	.align 2, 0
_08118EC4: .4byte 0x03005B60
_08118EC8:
	ldr r1, _08118F08
	ldrh r0, [r1]
	subs r0, #0xff
	strh r0, [r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	movs r1, #0xc0
	lsls r1, r1, #6
	cmp r0, r1
	beq _08118EE0
	b _0811906A
_08118EE0:
	ldr r0, _08118F0C
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0xf0
	strh r0, [r1, #0xc]
	movs r0, #0x20
	strh r0, [r1, #0xe]
	movs r0, #1
	strh r0, [r1, #0x12]
	ldr r2, _08118F10
	ldrh r1, [r2]
	ldr r0, _08118F14
	ands r0, r1
	strh r0, [r2]
	b _0811906A
	.align 2, 0
_08118F08: .4byte 0x02022ADA
_08118F0C: .4byte 0x03005B60
_08118F10: .4byte 0x020240A0
_08118F14: .4byte 0x0000FFFE
_08118F18:
	ldr r0, _08118F50
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1, #0xe]
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08118F58
	subs r0, r2, #1
	strh r0, [r1, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08118F78
	ldr r1, _08118F54
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0xf
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	b _08118F78
	.align 2, 0
_08118F50: .4byte 0x03005B60
_08118F54: .4byte 0x00001842
_08118F58:
	ldrh r2, [r1, #0x10]
	movs r0, #0x1f
	ands r0, r2
	cmp r0, #0
	beq _08118F78
	ldrh r0, [r1, #0x12]
	subs r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08118F78
	adds r0, r2, #0
	adds r0, #0xff
	strh r0, [r1, #0x10]
	movs r0, #4
	strh r0, [r1, #0x12]
_08118F78:
	ldr r2, _08119048
	ldrh r1, [r2]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08118F8C
	ldr r3, _0811904C
	adds r0, r1, r3
	strh r0, [r2]
_08118F8C:
	ldr r0, _08119050
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1, #0xc]
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08118FA2
	subs r0, r2, #2
	strh r0, [r1, #0xc]
_08118FA2:
	movs r3, #0
	ldr r0, _08119054
	mov r8, r0
	ldr r2, _08119058
	mov ip, r2
	mov r7, r8
	adds r4, r1, #0
_08118FB0:
	lsls r2, r3, #1
	ldrb r1, [r7, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	add r2, ip
	ldrh r0, [r4, #0xc]
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x4f
	ble _08118FB0
	cmp r3, #0x9f
	bgt _08118FF4
	ldr r0, _08119058
	mov ip, r0
	ldr r7, _08119054
	ldr r1, _08119050
	adds r0, r6, r5
	lsls r0, r0, #3
	adds r4, r0, r1
_08118FDA:
	lsls r2, r3, #1
	ldrb r1, [r7, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	add r2, ip
	ldrh r0, [r4, #0xc]
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x9f
	ble _08118FDA
_08118FF4:
	ldr r1, _08119050
	adds r0, r6, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	cmp r2, #0
	bne _0811906A
	movs r0, #3
	mov r3, r8
	strb r0, [r3, #0x15]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	str r2, [sp]
	ldr r1, _0811905C
	ldr r2, _08119060
	mov r0, sp
	bl CpuSet
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r1, #0x9c
	lsls r1, r1, #8
	movs r0, #0xa
	bl SetGpuReg
	movs r1, #0xbc
	lsls r1, r1, #7
	movs r0, #0xc
	bl SetGpuReg
	b _0811906A
	.align 2, 0
_08119048: .4byte 0x02022ADA
_0811904C: .4byte 0xFFFFFC04
_08119050: .4byte 0x03005B60
_08119054: .4byte 0x020397C8
_08119058: .4byte 0x020388C8
_0811905C: .4byte 0x0600E000
_08119060: .4byte 0x05000200
_08119064:
	adds r0, r5, #0
	bl sub_08118ADC
_0811906A:
	ldr r0, _08119090
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #4
	beq _08119082
	ldrh r1, [r1, #0x10]
	movs r0, #0x52
	bl SetGpuReg
_08119082:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119090: .4byte 0x03005B60
	thumb_func_end BattleIntroSlide2

	thumb_func_start BattleIntroSlide3
BattleIntroSlide3: @ 0x08119094
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _081190C8
	ldrh r0, [r1]
	adds r0, #8
	strh r0, [r1]
	ldr r1, _081190CC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r4, r1, #0
	cmp r0, #4
	bls _081190BE
	b _081192E6
_081190BE:
	lsls r0, r0, #2
	ldr r1, _081190D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081190C8: .4byte 0x02022ACC
_081190CC: .4byte 0x03005B60
_081190D0: .4byte 0x081190D4
_081190D4: @ jump table
	.4byte _081190E8 @ case 0
	.4byte _08119140 @ case 1
	.4byte _0811916C @ case 2
	.4byte _081191BC @ case 3
	.4byte _081192E0 @ case 4
_081190E8:
	ldr r1, _08119120
	movs r0, #0x50
	bl SetGpuReg
	ldr r4, _08119124
	movs r0, #0x52
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldr r1, _08119128
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	strh r4, [r2, #0x10]
	ldr r0, _0811912C
	ldr r0, [r0]
	ldr r1, _08119130
	ands r0, r1
	cmp r0, #0
	beq _08119134
	movs r0, #0x10
	b _08119136
	.align 2, 0
_08119120: .4byte 0x00001842
_08119124: .4byte 0x00000808
_08119128: .4byte 0x03005B60
_0811912C: .4byte 0x02022C90
_08119130: .4byte 0x02000002
_08119134:
	movs r0, #1
_08119136:
	strh r0, [r2, #0xc]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	b _081192E6
_08119140:
	ldr r0, _08119168
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08119158
	b _081192E6
_08119158:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	b _081192E6
	.align 2, 0
_08119168: .4byte 0x03005B60
_0811916C:
	ldr r1, _081191AC
	ldrh r0, [r1]
	subs r0, #0xff
	strh r0, [r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	movs r1, #0xc0
	lsls r1, r1, #6
	cmp r0, r1
	beq _08119184
	b _081192E6
_08119184:
	ldr r0, _081191B0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0xf0
	strh r0, [r1, #0xc]
	movs r0, #0x20
	strh r0, [r1, #0xe]
	movs r0, #1
	strh r0, [r1, #0x12]
	ldr r2, _081191B4
	ldrh r1, [r2]
	ldr r0, _081191B8
	ands r0, r1
	strh r0, [r2]
	b _081192E6
	.align 2, 0
_081191AC: .4byte 0x02022ADA
_081191B0: .4byte 0x03005B60
_081191B4: .4byte 0x020240A0
_081191B8: .4byte 0x0000FFFE
_081191BC:
	lsls r0, r5, #2
	adds r1, r0, r5
	lsls r1, r1, #3
	adds r2, r1, r4
	ldrh r3, [r2, #0xe]
	movs r6, #0xe
	ldrsh r1, [r2, r6]
	mov ip, r0
	cmp r1, #0
	beq _081191D6
	subs r0, r3, #1
	strh r0, [r2, #0xe]
	b _081191F6
_081191D6:
	ldrh r1, [r2, #0x10]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _081191F6
	ldrh r0, [r2, #0x12]
	subs r0, #1
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081191F6
	adds r0, r1, #0
	adds r0, #0xff
	strh r0, [r2, #0x10]
	movs r0, #6
	strh r0, [r2, #0x12]
_081191F6:
	ldr r2, _081192C4
	ldrh r1, [r2]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0811920A
	ldr r3, _081192C8
	adds r0, r1, r3
	strh r0, [r2]
_0811920A:
	mov r6, ip
	adds r0, r6, r5
	lsls r0, r0, #3
	adds r1, r0, r4
	ldrh r2, [r1, #0xc]
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08119220
	subs r0, r2, #2
	strh r0, [r1, #0xc]
_08119220:
	movs r3, #0
	ldr r6, _081192CC
	mov r8, r6
	ldr r7, _081192D0
	adds r4, r1, #0
_0811922A:
	lsls r2, r3, #1
	ldrb r1, [r6, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r7
	ldrh r0, [r4, #0xc]
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x4f
	ble _0811922A
	cmp r3, #0x9f
	bgt _0811926E
	ldr r7, _081192D0
	ldr r6, _081192CC
	ldr r1, _081192D4
	mov r2, ip
	adds r0, r2, r5
	lsls r0, r0, #3
	adds r4, r0, r1
_08119254:
	lsls r2, r3, #1
	ldrb r1, [r6, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r7
	ldrh r0, [r4, #0xc]
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x9f
	ble _08119254
_0811926E:
	ldr r1, _081192D4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	cmp r2, #0
	bne _081192E6
	movs r0, #3
	mov r6, r8
	strb r0, [r6, #0x15]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	str r2, [sp]
	ldr r1, _081192D8
	ldr r2, _081192DC
	mov r0, sp
	bl CpuSet
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r1, #0x9c
	lsls r1, r1, #8
	movs r0, #0xa
	bl SetGpuReg
	movs r1, #0xbc
	lsls r1, r1, #7
	movs r0, #0xc
	bl SetGpuReg
	b _081192E6
	.align 2, 0
_081192C4: .4byte 0x02022ADA
_081192C8: .4byte 0xFFFFFC04
_081192CC: .4byte 0x020397C8
_081192D0: .4byte 0x020388C8
_081192D4: .4byte 0x03005B60
_081192D8: .4byte 0x0600E000
_081192DC: .4byte 0x05000200
_081192E0:
	adds r0, r5, #0
	bl sub_08118ADC
_081192E6:
	ldr r0, _0811930C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #4
	beq _08119300
	ldrh r1, [r1, #0x10]
	movs r0, #0x52
	bl SetGpuReg
_08119300:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811930C: .4byte 0x03005B60
	thumb_func_end BattleIntroSlide3

	thumb_func_start BattleIntroSlideLink
BattleIntroSlideLink: @ 0x08119310
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0811935C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r7, r0, r1
	movs r1, #8
	ldrsh r0, [r7, r1]
	cmp r0, #1
	ble _08119386
	movs r2, #0x10
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bne _08119386
	ldr r2, _08119360
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0811934E
	cmp r1, #0x4f
	bhi _08119368
_0811934E:
	adds r0, r1, #3
	strh r0, [r2]
	ldr r1, _08119364
	ldrh r0, [r1]
	subs r0, #3
	strh r0, [r1]
	b _08119386
	.align 2, 0
_0811935C: .4byte 0x03005B60
_08119360: .4byte 0x02022ACC
_08119364: .4byte 0x02022AD0
_08119368:
	str r5, [sp]
	ldr r1, _081193A8
	ldr r4, _081193AC
	mov r0, sp
	adds r2, r4, #0
	bl CpuSet
	str r5, [sp, #4]
	add r0, sp, #4
	ldr r1, _081193B0
	adds r2, r4, #0
	bl CpuSet
	movs r0, #1
	strh r0, [r7, #0x10]
_08119386:
	ldr r0, _081193B4
	lsls r2, r6, #2
	adds r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r3, #8
	ldrsh r1, [r1, r3]
	mov sb, r0
	adds r5, r2, #0
	cmp r1, #4
	bls _0811939E
	b _081195AA
_0811939E:
	lsls r0, r1, #2
	ldr r1, _081193B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081193A8: .4byte 0x0600E000
_081193AC: .4byte 0x05000200
_081193B0: .4byte 0x0600F000
_081193B4: .4byte 0x03005B60
_081193B8: .4byte 0x081193BC
_081193BC: @ jump table
	.4byte _081193D0 @ case 0
	.4byte _081193E2 @ case 1
	.4byte _08119488 @ case 2
	.4byte _081194CC @ case 3
	.4byte _081195A4 @ case 4
_081193D0:
	adds r0, r5, r6
	lsls r0, r0, #3
	add r0, sb
	movs r1, #0x20
	strh r1, [r0, #0xc]
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _081195AA
_081193E2:
	adds r0, r5, r6
	lsls r0, r0, #3
	mov r2, sb
	adds r1, r0, r2
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081193F8
	b _081195AA
_081193F8:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	ldr r4, _08119478
	ldr r5, _0811947C
	ldr r0, [r5]
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r3, [r1, #1]
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	movs r3, #8
	mov sb, r3
	mov r3, sb
	orrs r0, r3
	strb r0, [r1, #1]
	ldr r3, [r5]
	adds r0, r3, #0
	adds r0, #0x7d
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x1c
	adds r1, r1, r4
	mov r8, r1
	add r0, r8
	ldr r6, _08119480
	str r6, [r0]
	adds r3, #0x7e
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	ands r2, r1
	mov r3, sb
	orrs r2, r3
	strb r2, [r0, #1]
	ldr r0, [r5]
	adds r0, #0x7e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	str r6, [r0]
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	ldr r1, _08119484
	movs r0, #0x4a
	bl SetGpuReg
	b _081195AA
	.align 2, 0
_08119478: .4byte 0x020205AC
_0811947C: .4byte 0x02024140
_08119480: .4byte 0x08038829
_08119484: .4byte 0x00003F06
_08119488:
	ldr r1, _081194C0
	ldrh r0, [r1]
	subs r0, #0xff
	strh r0, [r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	movs r1, #0xc0
	lsls r1, r1, #6
	cmp r0, r1
	beq _081194A0
	b _081195AA
_081194A0:
	adds r1, r5, r6
	lsls r1, r1, #3
	add r1, sb
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0xf0
	strh r0, [r1, #0xc]
	movs r0, #0x20
	strh r0, [r1, #0xe]
	ldr r2, _081194C4
	ldrh r1, [r2]
	ldr r0, _081194C8
	ands r0, r1
	strh r0, [r2]
	b _081195AA
	.align 2, 0
_081194C0: .4byte 0x02022ADA
_081194C4: .4byte 0x020240A0
_081194C8: .4byte 0x0000FFFE
_081194CC:
	ldr r2, _08119590
	ldrh r1, [r2]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081194E0
	ldr r3, _08119594
	adds r0, r1, r3
	strh r0, [r2]
_081194E0:
	adds r0, r5, r6
	lsls r0, r0, #3
	mov r2, sb
	adds r1, r0, r2
	ldrh r2, [r1, #0xc]
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _081194F6
	subs r0, r2, #2
	strh r0, [r1, #0xc]
_081194F6:
	movs r3, #0
	ldr r0, _08119598
	mov ip, r0
	ldr r2, _0811959C
	mov r8, r2
	mov r7, ip
	adds r4, r1, #0
_08119504:
	lsls r2, r3, #1
	ldrb r1, [r7, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	add r2, r8
	ldrh r0, [r4, #0xc]
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x4f
	ble _08119504
	cmp r3, #0x9f
	bgt _08119548
	ldr r0, _0811959C
	mov r8, r0
	ldr r7, _08119598
	ldr r1, _081195A0
	adds r0, r5, r6
	lsls r0, r0, #3
	adds r4, r0, r1
_0811952E:
	lsls r2, r3, #1
	ldrb r1, [r7, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	add r2, r8
	ldrh r0, [r4, #0xc]
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x9f
	ble _0811952E
_08119548:
	adds r0, r5, r6
	lsls r0, r0, #3
	mov r2, sb
	adds r1, r0, r2
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _081195AA
	movs r0, #3
	mov r2, ip
	strb r0, [r2, #0x15]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r1, #0x9c
	lsls r1, r1, #8
	movs r0, #0xa
	bl SetGpuReg
	movs r1, #0xbc
	lsls r1, r1, #7
	movs r0, #0xc
	bl SetGpuReg
	b _081195AA
	.align 2, 0
_08119590: .4byte 0x02022ADA
_08119594: .4byte 0xFFFFFC04
_08119598: .4byte 0x020397C8
_0811959C: .4byte 0x020388C8
_081195A0: .4byte 0x03005B60
_081195A4:
	adds r0, r6, #0
	bl sub_08118ADC
_081195AA:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end BattleIntroSlideLink

	thumb_func_start BattleIntroSlidePartner
BattleIntroSlidePartner: @ 0x081195B8
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _081195E0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r6, r1, #0
	cmp r0, #5
	bls _081195D6
	b _08119802
_081195D6:
	lsls r0, r0, #2
	ldr r1, _081195E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081195E0: .4byte 0x03005B60
_081195E4: .4byte 0x081195E8
_081195E8: @ jump table
	.4byte _08119600 @ case 0
	.4byte _0811960E @ case 1
	.4byte _0811969C @ case 2
	.4byte _081196F8 @ case 3
	.4byte _08119750 @ case 4
	.4byte _081197FC @ case 5
_08119600:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r1, #1
	strh r1, [r0, #0xc]
	b _081197D4
_0811960E:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r6
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08119624
	b _08119802
_08119624:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	ldr r1, _0811967C
	movs r0, #0xa
	bl SetGpuReg
	ldr r1, _08119680
	movs r0, #0xc
	bl SetGpuReg
	movs r0, #0
	bl GetGpuReg
	adds r1, r0, #0
	ldr r2, _08119684
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl SetGpuReg
	movs r1, #0xf8
	lsls r1, r1, #6
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _08119688
	movs r0, #0x4a
	bl SetGpuReg
	ldr r1, _0811968C
	ldr r2, _08119690
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08119694
	movs r0, #0xf0
	strh r0, [r1]
	ldr r1, _08119698
	subs r2, #0xc0
	adds r0, r2, #0
	strh r0, [r1]
	b _08119802
	.align 2, 0
_0811967C: .4byte 0x00005C0A
_08119680: .4byte 0x00005E0A
_08119684: .4byte 0x0000F040
_08119688: .4byte 0x00003F3F
_0811968C: .4byte 0x02022ACA
_08119690: .4byte 0x0000FFD0
_08119694: .4byte 0x02022ACC
_08119698: .4byte 0x02022AD0
_0811969C:
	ldr r2, _081196EC
	ldrh r3, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	adds r1, r3, r0
	strh r1, [r2]
	movs r5, #0xff
	lsls r5, r5, #8
	ands r1, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	beq _081196BE
	adds r0, r3, #0
	adds r0, #0xff
	strh r0, [r2]
_081196BE:
	ldrh r0, [r2]
	adds r1, r5, #0
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r1, r0
	beq _081196CE
	b _08119802
_081196CE:
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r6
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0xf0
	strh r0, [r1, #0xc]
	ldr r2, _081196F0
	ldrh r1, [r2]
	ldr r0, _081196F4
	ands r0, r1
	strh r0, [r2]
	b _08119802
	.align 2, 0
_081196EC: .4byte 0x02022ADA
_081196F0: .4byte 0x020240A0
_081196F4: .4byte 0x0000FFFE
_081196F8:
	ldr r3, _08119744
	ldrh r2, [r3]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r2
	movs r1, #0x98
	lsls r1, r1, #7
	cmp r0, r1
	beq _08119712
	movs r1, #0xff
	lsls r1, r1, #2
	adds r0, r2, r1
	strh r0, [r3]
_08119712:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r3, r0, r6
	ldrh r1, [r3, #0xc]
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _08119728
	subs r0, r1, #2
	strh r0, [r3, #0xc]
_08119728:
	ldr r1, _08119748
	ldrh r0, [r3, #0xc]
	strh r0, [r1]
	ldr r2, _0811974C
	rsbs r1, r0, #0
	strh r1, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08119802
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	b _08119802
	.align 2, 0
_08119744: .4byte 0x02022ADA
_08119748: .4byte 0x02022ACC
_0811974C: .4byte 0x02022AD0
_08119750:
	ldr r1, _081197DC
	ldrh r0, [r1]
	adds r3, r0, #2
	strh r3, [r1]
	ldr r1, _081197E0
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	ldr r5, _081197E4
	ldrh r2, [r5]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r2
	movs r1, #0xa0
	lsls r1, r1, #7
	cmp r0, r1
	beq _08119778
	adds r0, r2, #0
	adds r0, #0xff
	strh r0, [r5]
_08119778:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08119802
	str r0, [sp]
	ldr r1, _081197E8
	ldr r2, _081197EC
	mov r0, sp
	bl CpuSet
	movs r0, #0
	bl GetGpuReg
	ldr r1, _081197F0
	ands r1, r0
	movs r0, #0
	bl SetGpuReg
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r1, #0x9c
	lsls r1, r1, #8
	movs r0, #0xa
	bl SetGpuReg
	movs r1, #0xbc
	lsls r1, r1, #7
	movs r0, #0xc
	bl SetGpuReg
	ldr r1, _081197F4
	movs r0, #3
	strb r0, [r1, #0x15]
	ldr r1, _081197F8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
_081197D4:
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _08119802
	.align 2, 0
_081197DC: .4byte 0x02022ACA
_081197E0: .4byte 0x02022AD2
_081197E4: .4byte 0x02022ADA
_081197E8: .4byte 0x0600E000
_081197EC: .4byte 0x05000800
_081197F0: .4byte 0x0000BFFF
_081197F4: .4byte 0x020397C8
_081197F8: .4byte 0x03005B60
_081197FC:
	adds r0, r4, #0
	bl sub_08118ADC
_08119802:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleIntroSlidePartner

	thumb_func_start sub_0811980C
sub_0811980C: @ 0x0811980C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x24]
	ldr r7, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov sb, r2
	ldr r5, [sp, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081198DC
	ldr r2, [r1]
	lsls r4, r4, #2
	adds r2, #4
	adds r2, r2, r4
	ldr r1, _081198E0
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #0xb
	ldr r0, [r2]
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r7, #0
	bl CpuSet
	ldr r1, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r7, #0
	adds r3, r5, #0
	bl LoadBgTiles
	adds r0, r6, #0
	adds r0, #8
	cmp r6, r0
	bge _081198B8
	mov ip, r0
	mov r2, r8
	lsls r7, r2, #1
_0811988A:
	mov r1, r8
	adds r2, r1, #0
	adds r2, #8
	adds r4, r6, #1
	cmp r1, r2
	bge _081198B2
	mov r0, sl
	lsls r3, r0, #0xc
	lsls r0, r6, #6
	add r0, sb
	adds r6, r7, r0
	subs r1, r2, r1
_081198A2:
	adds r0, r5, #0
	orrs r0, r3
	strh r0, [r6]
	adds r5, #1
	adds r6, #2
	subs r1, #1
	cmp r1, #0
	bne _081198A2
_081198B2:
	adds r6, r4, #0
	cmp r6, ip
	blt _0811988A
_081198B8:
	ldr r1, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #4
	mov r1, sb
	movs r3, #0
	bl LoadBgTilemap
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081198DC: .4byte 0x02024178
_081198E0: .4byte 0x02024188
	thumb_func_end sub_0811980C

	thumb_func_start unref_sub_8119094
unref_sub_8119094: @ 0x081198E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x28]
	mov r8, r5
	ldr r5, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	mov sb, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	mov r7, r8
	lsls r7, r7, #0x10
	lsrs r6, r7, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, sb
	lsls r0, r0, #0x18
	mov sb, r0
	ldr r4, _081199A8
	ldr r0, _081199AC
	ldr r0, [r0]
	lsrs r2, r2, #0x16
	adds r0, #4
	adds r0, r0, r2
	lsrs r3, r3, #0xd
	ldr r0, [r0]
	adds r0, r0, r3
	str r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r6, r6, r0
	str r6, [r4, #4]
	ldr r0, _081199B0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r2, r7, #0
	lsrs r2, r2, #0x15
	mov r6, sb
	lsrs r6, r6, #0xf
	subs r4, r2, r6
	lsrs r0, r1, #0x18
	adds r1, r0, #0
	adds r1, #8
	cmp r0, r1
	bge _08119998
	mov sb, r1
	mov r7, ip
	lsls r7, r7, #1
	mov r8, r7
	lsls r5, r5, #0xb
	str r5, [sp]
_08119960:
	mov r2, ip
	adds r3, r2, #0
	adds r3, #8
	adds r5, r0, #1
	cmp r2, r3
	bge _08119992
	mov r1, sl
	lsls r6, r1, #0xc
	lsls r0, r0, #6
	movs r7, #0xc0
	lsls r7, r7, #0x13
	adds r0, r0, r7
	ldr r1, [sp]
	adds r0, r1, r0
	mov r7, r8
	adds r1, r7, r0
	subs r2, r3, r2
_08119982:
	adds r0, r4, #0
	orrs r0, r6
	strh r0, [r1]
	adds r4, #1
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _08119982
_08119992:
	adds r0, r5, #0
	cmp r0, sb
	blt _08119960
_08119998:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081199A8: .4byte 0x040000D4
_081199AC: .4byte 0x02024178
_081199B0: .4byte 0x80000400
	thumb_func_end unref_sub_8119094

