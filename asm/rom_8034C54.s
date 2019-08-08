.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08034AAC
sub_08034AAC: @ 0x08034AAC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _08034ACC
	ldr r0, [r5]
	cmp r0, #0
	beq _08034ABC
	bl sub_08034B20
_08034ABC:
	movs r0, #8
	bl Alloc
	str r0, [r5]
	cmp r0, #0
	bne _08034AD0
	movs r0, #0
	b _08034B18
	.align 2, 0
_08034ACC: .4byte 0x02022AC4
_08034AD0:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	bl Alloc
	ldr r1, [r5]
	str r0, [r1, #4]
	cmp r0, #0
	bne _08034AEC
	adds r0, r1, #0
	bl Free
	movs r0, #0
	b _08034B18
_08034AEC:
	str r4, [r1]
	movs r3, #0
	cmp r3, r4
	bhs _08034B16
	movs r7, #0
	movs r6, #0xff
	movs r2, #0
_08034AFA:
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r0, r2, r0
	strb r7, [r0]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r2, r1
	ldrb r0, [r1, #1]
	orrs r0, r6
	strb r0, [r1, #1]
	adds r2, #0x1c
	adds r3, #1
	cmp r3, r4
	blo _08034AFA
_08034B16:
	movs r0, #1
_08034B18:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08034AAC

	thumb_func_start sub_08034B20
sub_08034B20: @ 0x08034B20
	push {r4, r5, lr}
	ldr r2, _08034B68
	ldr r1, [r2]
	cmp r1, #0
	beq _08034B60
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _08034B54
	movs r4, #0
	ldr r0, [r1]
	cmp r4, r0
	bhs _08034B4A
	adds r5, r2, #0
_08034B3A:
	adds r0, r4, #0
	bl sub_08035234
	adds r4, #1
	ldr r0, [r5]
	ldr r0, [r0]
	cmp r4, r0
	blo _08034B3A
_08034B4A:
	ldr r0, _08034B68
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl Free
_08034B54:
	ldr r4, _08034B68
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
_08034B60:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034B68: .4byte 0x02022AC4
	thumb_func_end sub_08034B20

	thumb_func_start sub_08034B6C
sub_08034B6C: @ 0x08034B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov sl, r1
	adds r5, r2, #0
	ldr r6, _08034BE4
	ldr r0, [r6]
	cmp r0, #0
	beq _08034C2C
	ldr r1, [r0, #4]
	mov r0, r8
	lsls r2, r0, #3
	subs r0, r2, r0
	lsls r4, r0, #2
	adds r1, r4, r1
	ldrb r0, [r1]
	mov sb, r2
	cmp r0, #0
	bne _08034C2C
	ldrb r0, [r5, #1]
	bl sub_08035370
	ldr r1, [r6]
	ldr r1, [r1, #4]
	adds r1, r4, r1
	strb r0, [r1, #1]
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	ldrb r0, [r0, #1]
	cmp r0, #0xff
	beq _08034C2C
	ldr r0, [r5, #8]
	ldrh r0, [r0, #6]
	bl GetSpriteTileStartByTag
	ldr r2, [r6]
	ldr r1, [r2, #4]
	adds r1, r4, r1
	strh r0, [r1, #0xa]
	ldr r0, [r2, #4]
	adds r0, r4, r0
	ldrh r1, [r0, #0xa]
	ldr r7, _08034BE8
	lsrs r0, r7, #0x10
	cmp r1, r0
	bne _08034C38
	ldr r2, [r5, #8]
	ldrh r0, [r2, #4]
	adds r1, r2, #0
	cmp r0, #0
	beq _08034BEC
	adds r0, r1, #0
	bl LoadSpriteSheet
	b _08034C0C
	.align 2, 0
_08034BE4: .4byte 0x02022AC4
_08034BE8: .4byte 0xFFFF0000
_08034BEC:
	ldr r0, [r2]
	ldr r1, [r2, #4]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r2]
	bl GetDecompressedDataSize
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #4]
	ands r1, r7
	orrs r1, r0
	str r1, [sp, #4]
	mov r0, sp
	bl LoadCompressedSpriteSheet
_08034C0C:
	ldr r1, [r6]
	ldr r1, [r1, #4]
	adds r1, r4, r1
	strh r0, [r1, #0xa]
	ldr r0, _08034C30
	ldr r0, [r0]
	ldr r1, [r0, #4]
	mov r2, sb
	mov r3, r8
	subs r0, r2, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0xa]
	ldr r0, _08034C34
	cmp r1, r0
	bne _08034C38
_08034C2C:
	movs r0, #0
	b _08034D40
	.align 2, 0
_08034C30: .4byte 0x02022AC4
_08034C34: .4byte 0x0000FFFF
_08034C38:
	ldr r0, [r5, #0xc]
	ldrh r0, [r0, #4]
	bl IndexOfSpritePaletteTag
	ldr r6, _08034D50
	ldr r1, [r6]
	ldr r1, [r1, #4]
	mov r4, sb
	mov r3, r8
	subs r2, r4, r3
	lsls r4, r2, #2
	adds r1, r4, r1
	strb r0, [r1, #4]
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne _08034C6C
	ldr r0, [r5, #0xc]
	bl LoadSpritePalette
	ldr r1, [r6]
	ldr r1, [r1, #4]
	adds r1, r4, r1
	strb r0, [r1, #4]
_08034C6C:
	ldr r0, [r6]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	strb r0, [r1, #2]
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	ldrb r1, [r5, #1]
	strb r1, [r0, #3]
	ldr r2, [r6]
	ldr r0, [r2, #4]
	adds r0, r4, r0
	ldrh r1, [r5, #4]
	strh r1, [r0, #0xc]
	ldr r0, [r2, #4]
	adds r0, r4, r0
	ldrh r1, [r5, #6]
	strh r1, [r0, #0xe]
	ldr r1, [r2, #4]
	adds r1, r4, r1
	ldrb r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	strb r0, [r1, #6]
	ldr r0, [r6]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r0, [r5]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r1, #5]
	ldr r0, [r6]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r0, [r5]
	lsrs r0, r0, #6
	strb r0, [r1, #7]
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	ldrb r1, [r5, #2]
	strb r1, [r0, #8]
	ldrb r1, [r5]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1e
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	bl sub_08035450
	ldr r1, [r6]
	ldr r1, [r1, #4]
	adds r1, r4, r1
	strb r0, [r1, #9]
	ldr r2, [r6]
	ldr r0, [r2, #4]
	adds r0, r4, r0
	ldr r1, [r5, #8]
	ldrh r1, [r1, #6]
	strh r1, [r0, #0x10]
	ldr r0, [r2, #4]
	adds r0, r4, r0
	ldr r1, [r5, #0xc]
	ldrh r1, [r1, #4]
	strh r1, [r0, #0x12]
	ldr r0, [r2, #4]
	adds r0, r4, r0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	str r1, [r0, #0x14]
	movs r3, #1
	ldrb r0, [r5, #1]
	cmp r3, r0
	bhs _08034D22
_08034D0A:
	ldr r0, [r6]
	ldr r2, [r0, #4]
	adds r2, r4, r2
	ldr r1, [r2, #0x14]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	str r0, [r2, #0x14]
	adds r3, #1
	ldrb r2, [r5, #1]
	cmp r3, r2
	blo _08034D0A
_08034D22:
	ldr r0, _08034D50
	ldr r0, [r0]
	mov r3, sb
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #2
	ldr r0, [r0, #4]
	adds r0, r0, r1
	bl sub_08034D54
	mov r0, r8
	mov r1, sl
	bl sub_08034E9C
	movs r0, #1
_08034D40:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08034D50: .4byte 0x02022AC4
	thumb_func_end sub_08034B6C

	thumb_func_start sub_08034D54
sub_08034D54: @ 0x08034D54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldrb r5, [r4, #1]
	movs r0, #0xc
	ldrsh r7, [r4, r0]
	ldrb r0, [r4, #3]
	adds r0, #1
	mov r8, r0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	lsls r1, r5, #3
	ldr r2, _08034E84
	mov sb, r2
	add r1, sb
	mov r0, r8
	lsls r2, r0, #2
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuSet
	movs r6, #0
	ldrb r5, [r4, #1]
	cmp r6, r8
	bhs _08034E26
	movs r1, #0x3f
	mov sl, r1
	movs r2, #0xd
	rsbs r2, r2, #0
	mov sb, r2
_08034D9E:
	lsls r0, r5, #3
	ldr r1, _08034E88
	adds r3, r0, r1
	ldrh r1, [r4, #0xe]
	adds r0, r3, #0
	adds r0, #0x38
	strb r1, [r0]
	ldr r2, _08034E8C
	adds r0, r2, #0
	adds r1, r7, #0
	ands r1, r0
	ldrh r2, [r3, #0x3a]
	ldr r0, _08034E90
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x3a]
	ldrb r1, [r4, #6]
	movs r0, #0x39
	adds r0, r0, r3
	mov ip, r0
	lsls r1, r1, #6
	ldrb r2, [r0]
	mov r0, sl
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrb r1, [r4, #5]
	movs r2, #0x3b
	adds r2, r2, r3
	mov ip, r2
	lsls r1, r1, #6
	ldrb r2, [r2]
	mov r0, sl
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #0xa]
	ldr r1, _08034E94
	ands r1, r0
	ldrh r2, [r3, #0x3c]
	ldr r0, _08034E98
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r3, #0x3d
	movs r0, #3
	ldrb r1, [r4, #7]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	mov r0, sb
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrb r2, [r4, #4]
	lsls r2, r2, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	ldrb r0, [r4, #8]
	adds r7, r7, r0
	adds r6, #1
	adds r5, #1
	cmp r6, r8
	blo _08034D9E
_08034E26:
	subs r5, #1
	ldr r0, _08034E88
	lsls r3, r5, #3
	adds r3, r3, r0
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	ldrb r0, [r4, #8]
	subs r1, r1, r0
	ldr r2, _08034E8C
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #0x3a]
	ldr r0, _08034E90
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x3a]
	adds r2, r3, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4, #9]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r4, [r4, #0xa]
	adds r1, r1, r4
	ldr r2, _08034E94
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #0x3c]
	ldr r0, _08034E98
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x3c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034E84: .4byte 0x03002398
_08034E88: .4byte 0x03002360
_08034E8C: .4byte 0x000001FF
_08034E90: .4byte 0xFFFFFE00
_08034E94: .4byte 0x000003FF
_08034E98: .4byte 0xFFFFFC00
	thumb_func_end sub_08034D54

	thumb_func_start sub_08034E9C
sub_08034E9C: @ 0x08034E9C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08034ECC
	ldr r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _08034F00
	ldr r2, [r1, #4]
	lsls r1, r3, #3
	subs r0, r1, r3
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2]
	adds r5, r1, #0
	cmp r0, #0
	beq _08034F00
	str r4, [r2, #0x18]
	cmp r4, #0
	bge _08034ED0
	movs r2, #1
	rsbs r4, r4, #0
	b _08034ED2
	.align 2, 0
_08034ECC: .4byte 0x02022AC4
_08034ED0:
	movs r2, #0
_08034ED2:
	ldr r0, [r6]
	ldr r1, [r0, #4]
	subs r0, r5, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r3, [r0, #2]
	cmp r3, #1
	beq _08034EF2
	cmp r3, #1
	ble _08034EEA
	cmp r3, #2
	beq _08034EFA
_08034EEA:
	adds r1, r4, #0
	bl sub_08034F08
	b _08034F00
_08034EF2:
	adds r1, r4, #0
	bl sub_08034FBC
	b _08034F00
_08034EFA:
	adds r1, r4, #0
	bl sub_08035118
_08034F00:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08034E9C

	thumb_func_start sub_08034F08
sub_08034F08: @ 0x08034F08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	str r2, [sp]
	ldr r5, [r0, #0x14]
	ldrb r7, [r0, #1]
	ldr r0, _08034F8C
	mov sl, r0
	cmp r5, #0
	beq _08034F72
	lsls r0, r7, #3
	adds r0, #0x3c
	mov r1, sl
	adds r6, r0, r1
_08034F2E:
	mov r0, sb
	adds r1, r5, #0
	bl __udivsi3
	adds r4, r0, #0
	adds r0, r4, #0
	muls r0, r5, r0
	mov r2, sb
	subs r2, r2, r0
	mov sb, r2
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	adds r5, r0, #0
	mov r1, r8
	ldrb r0, [r1, #9]
	adds r1, r4, #0
	muls r1, r0, r1
	mov r2, r8
	ldrh r2, [r2, #0xa]
	adds r1, r1, r2
	ldr r2, _08034F90
	adds r0, r2, #0
	ands r1, r0
	ldrh r0, [r6]
	ldr r2, _08034F94
	ands r0, r2
	orrs r0, r1
	strh r0, [r6]
	adds r6, #8
	adds r7, #1
	cmp r5, #0
	bne _08034F2E
_08034F72:
	ldr r0, [sp]
	cmp r0, #0
	beq _08034F98
	lsls r0, r7, #3
	add r0, sl
	adds r0, #0x39
	ldrb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	b _08034FAC
	.align 2, 0
_08034F8C: .4byte 0x03002360
_08034F90: .4byte 0x000003FF
_08034F94: .4byte 0xFFFFFC00
_08034F98:
	lsls r2, r7, #3
	add r2, sl
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
_08034FAC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08034F08

	thumb_func_start sub_08034FBC
sub_08034FBC: @ 0x08034FBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	str r2, [sp]
	ldr r5, [r6, #0x14]
	ldr r3, _08035064
	ldrb r0, [r6, #1]
	str r0, [r3]
	ldr r2, _08035068
	movs r0, #0
	str r0, [r2]
	ldr r1, _0803506C
	subs r0, #1
	str r0, [r1]
	adds r7, r3, #0
	mov sl, r1
	ldr r0, _08035070
	mov sb, r0
	cmp r5, #0
	beq _080350A4
_08034FEE:
	mov r0, r8
	adds r1, r5, #0
	bl __udivsi3
	adds r4, r0, #0
	adds r0, r4, #0
	muls r0, r5, r0
	mov r1, r8
	subs r1, r1, r0
	mov r8, r1
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	adds r5, r0, #0
	cmp r4, #0
	bne _08035020
	mov r2, sl
	ldr r1, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08035020
	cmp r5, #0
	bne _0803507C
_08035020:
	ldr r2, [r7]
	lsls r2, r2, #3
	add r2, sb
	ldrb r0, [r6, #9]
	adds r3, r4, #0
	muls r3, r0, r3
	ldrh r4, [r6, #0xa]
	adds r3, r3, r4
	ldr r1, _08035074
	adds r0, r1, #0
	ands r3, r0
	ldrh r0, [r2, #0x3c]
	ldr r4, _08035078
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r3
	strh r0, [r2, #0x3c]
	adds r2, #0x39
	ldrb r0, [r2]
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	mov r2, sl
	ldr r1, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08035092
	ldr r4, _08035068
	ldr r0, [r4]
	str r0, [r2]
	b _08035092
	.align 2, 0
_08035064: .4byte 0x03000DD4
_08035068: .4byte 0x03000DD8
_0803506C: .4byte 0x03000DDC
_08035070: .4byte 0x03002360
_08035074: .4byte 0x000003FF
_08035078: .4byte 0xFFFFFC00
_0803507C:
	ldr r0, [r7]
	lsls r0, r0, #3
	add r0, sb
	adds r0, #0x39
	ldrb r1, [r0]
	movs r2, #4
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
_08035092:
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
	ldr r4, _080350E4
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	cmp r5, #0
	bne _08034FEE
_080350A4:
	ldr r0, [sp]
	cmp r0, #0
	beq _080350F0
	ldr r1, [r7]
	lsls r1, r1, #3
	add r1, sb
	adds r1, #0x39
	ldrb r2, [r1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r3, [r7]
	lsls r3, r3, #3
	add r3, sb
	movs r1, #0xc
	ldrsh r2, [r6, r1]
	mov r4, sl
	ldr r0, [r4]
	subs r0, #1
	ldrb r1, [r6, #8]
	muls r0, r1, r0
	adds r2, r2, r0
	ldr r1, _080350E8
	adds r0, r1, #0
	ands r2, r0
	ldrh r1, [r3, #0x3a]
	ldr r0, _080350EC
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #0x3a]
	b _08035106
	.align 2, 0
_080350E4: .4byte 0x03000DD8
_080350E8: .4byte 0x000001FF
_080350EC: .4byte 0xFFFFFE00
_080350F0:
	ldr r0, [r7]
	lsls r0, r0, #3
	add r0, sb
	adds r0, #0x39
	ldrb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
_08035106:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08034FBC

	thumb_func_start sub_08035118
sub_08035118: @ 0x08035118
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	mov sl, r1
	str r2, [sp]
	ldr r5, [r0, #0x14]
	ldrb r3, [r0, #1]
	movs r0, #0
	str r0, [sp, #4]
	mov sb, r0
	cmp r5, #0
	beq _080351B2
_08035138:
	lsls r0, r3, #3
	adds r1, r0, #0
	adds r1, #0x39
	ldr r2, _080351FC
	adds r7, r1, r2
	adds r0, #0x3c
	adds r6, r0, r2
_08035146:
	mov r0, sl
	adds r1, r5, #0
	str r3, [sp, #8]
	bl __udivsi3
	adds r4, r0, #0
	adds r0, r4, #0
	muls r0, r5, r0
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	adds r5, r0, #0
	ldr r3, [sp, #8]
	cmp r4, #0
	bne _08035176
	ldr r2, [sp, #4]
	cmp r2, #0
	bne _08035176
	cmp r5, #0
	bne _08035138
_08035176:
	movs r0, #1
	str r0, [sp, #4]
	mov r1, r8
	ldrb r0, [r1, #9]
	adds r2, r4, #0
	muls r2, r0, r2
	ldrh r4, [r1, #0xa]
	adds r2, r2, r4
	ldr r1, _08035200
	adds r0, r1, #0
	ands r2, r0
	ldrh r0, [r6]
	ldr r4, _08035204
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r6]
	ldrb r0, [r7]
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	strb r0, [r7]
	adds r7, #8
	adds r6, #8
	adds r3, #1
	movs r4, #1
	add sb, r4
	cmp r5, #0
	bne _08035146
_080351B2:
	mov r0, r8
	ldrb r0, [r0, #3]
	cmp sb, r0
	bge _080351E2
	ldr r1, _080351FC
	movs r5, #4
	rsbs r5, r5, #0
	movs r4, #2
	lsls r0, r3, #3
	adds r0, #0x39
	adds r2, r0, r1
_080351C8:
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
	adds r2, #8
	adds r3, #1
	movs r1, #1
	add sb, r1
	mov r0, r8
	ldrb r0, [r0, #3]
	cmp sb, r0
	blt _080351C8
_080351E2:
	ldr r1, [sp]
	cmp r1, #0
	beq _08035208
	lsls r0, r3, #3
	ldr r2, _080351FC
	adds r0, r0, r2
	adds r0, #0x39
	ldrb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	b _0803521E
	.align 2, 0
_080351FC: .4byte 0x03002360
_08035200: .4byte 0x000003FF
_08035204: .4byte 0xFFFFFC00
_08035208:
	lsls r2, r3, #3
	ldr r4, _08035230
	adds r2, r2, r4
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
_0803521E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035230: .4byte 0x03002360
	thumb_func_end sub_08035118

	thumb_func_start sub_08035234
sub_08035234: @ 0x08035234
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _080352CC
	ldr r0, [r0]
	cmp r0, #0
	beq _080352C6
	ldr r2, [r0, #4]
	lsls r1, r4, #3
	subs r0, r1, r4
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2]
	adds r5, r1, #0
	cmp r0, #0
	beq _080352C6
	ldrb r3, [r2, #3]
	adds r0, r3, #1
	ldrb r2, [r2, #1]
	cmp r0, #0
	beq _0803527E
	ldr r1, _080352D0
	movs r7, #4
	rsbs r7, r7, #0
	movs r6, #2
	adds r3, r0, #0
	lsls r0, r2, #3
	adds r0, #0x39
	adds r2, r0, r1
_0803526C:
	ldrb r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	orrs r0, r6
	strb r0, [r2]
	subs r3, #1
	adds r2, #8
	cmp r3, #0
	bne _0803526C
_0803527E:
	adds r0, r4, #0
	bl SharesTileWithAnyActive
	cmp r0, #0
	bne _0803529A
	ldr r0, _080352CC
	ldr r0, [r0]
	ldr r1, [r0, #4]
	subs r0, r5, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x10]
	bl FreeSpriteTilesByTag
_0803529A:
	adds r0, r4, #0
	bl SharesPalWithAnyActive
	cmp r0, #0
	bne _080352B6
	ldr r0, _080352CC
	ldr r0, [r0]
	ldr r1, [r0, #4]
	subs r0, r5, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x12]
	bl FreeSpritePaletteByTag
_080352B6:
	ldr r0, _080352CC
	ldr r0, [r0]
	ldr r1, [r0, #4]
	subs r0, r5, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_080352C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080352CC: .4byte 0x02022AC4
_080352D0: .4byte 0x03002360
	thumb_func_end sub_08035234

	thumb_func_start sub_080352D4
sub_080352D4: @ 0x080352D4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08035328
	ldr r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _08035364
	ldr r2, [r1, #4]
	lsls r1, r4, #3
	subs r0, r1, r4
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2]
	adds r6, r1, #0
	cmp r0, #0
	beq _08035364
	ldrb r3, [r2, #3]
	adds r1, r3, #1
	ldrb r0, [r2, #1]
	cmp r5, #0
	beq _08035330
	cmp r1, #0
	beq _08035364
	ldr r1, _0803532C
	movs r5, #4
	rsbs r5, r5, #0
	movs r4, #2
	adds r3, #1
	lsls r0, r0, #3
	adds r0, #0x39
	adds r2, r0, r1
_08035314:
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
	subs r3, #1
	adds r2, #8
	cmp r3, #0
	bne _08035314
	b _08035364
	.align 2, 0
_08035328: .4byte 0x02022AC4
_0803532C: .4byte 0x03002360
_08035330:
	cmp r1, #0
	beq _08035352
	ldr r1, _0803536C
	movs r5, #4
	rsbs r5, r5, #0
	adds r3, #1
	lsls r0, r0, #3
	adds r0, #0x39
	adds r2, r0, r1
_08035342:
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2]
	subs r3, #1
	adds r2, #8
	cmp r3, #0
	bne _08035342
_08035352:
	ldr r0, [r7]
	ldr r1, [r0, #4]
	subs r0, r6, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0, #0x18]
	adds r0, r4, #0
	bl sub_08034E9C
_08035364:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803536C: .4byte 0x03002360
	thumb_func_end sub_080352D4

	thumb_func_start sub_08035370
sub_08035370: @ 0x08035370
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0x40
	movs r3, #0
	ldr r0, _0803539C
	ldr r0, [r0]
	ldr r2, [r0]
	cmp r3, r2
	bhs _080353B2
	ldr r1, [r0, #4]
_08035386:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080353A0
	ldrb r0, [r1, #1]
	cmp r0, #0xff
	beq _080353AA
	ldrb r0, [r1, #3]
	cmp r0, r4
	bhi _080353AA
	ldrb r0, [r1, #1]
	b _080353C2
	.align 2, 0
_0803539C: .4byte 0x02022AC4
_080353A0:
	adds r0, r5, #1
	ldrb r5, [r1, #3]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080353AA:
	adds r1, #0x1c
	adds r3, #1
	cmp r3, r2
	blo _08035386
_080353B2:
	adds r0, r5, r4
	adds r0, #1
	cmp r0, #0x80
	bgt _080353C0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	b _080353C2
_080353C0:
	movs r0, #0xff
_080353C2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08035370

	thumb_func_start SharesTileWithAnyActive
SharesTileWithAnyActive: @ 0x080353C8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r0, _080353F8
	ldr r0, [r0]
	ldr r4, [r0]
	cmp r2, r4
	bhs _08035404
	ldr r1, [r0, #4]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r5, r0, r1
_080353E2:
	ldrb r0, [r1]
	cmp r0, #0
	beq _080353FC
	cmp r2, r3
	beq _080353FC
	ldrh r0, [r1, #0x10]
	ldrh r6, [r5, #0x10]
	cmp r0, r6
	bne _080353FC
	movs r0, #1
	b _08035406
	.align 2, 0
_080353F8: .4byte 0x02022AC4
_080353FC:
	adds r1, #0x1c
	adds r2, #1
	cmp r2, r4
	blo _080353E2
_08035404:
	movs r0, #0
_08035406:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end SharesTileWithAnyActive

	thumb_func_start SharesPalWithAnyActive
SharesPalWithAnyActive: @ 0x0803540C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r0, _0803543C
	ldr r0, [r0]
	ldr r4, [r0]
	cmp r2, r4
	bhs _08035448
	ldr r1, [r0, #4]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r5, r0, r1
_08035426:
	ldrb r0, [r1]
	cmp r0, #0
	beq _08035440
	cmp r2, r3
	beq _08035440
	ldrh r0, [r1, #0x12]
	ldrh r6, [r5, #0x12]
	cmp r0, r6
	bne _08035440
	movs r0, #1
	b _0803544A
	.align 2, 0
_0803543C: .4byte 0x02022AC4
_08035440:
	adds r1, #0x1c
	adds r2, #1
	cmp r2, r4
	blo _08035426
_08035448:
	movs r0, #0
_0803544A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end SharesPalWithAnyActive

	thumb_func_start sub_08035450
sub_08035450: @ 0x08035450
	ldr r2, _0803545C
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0803545C: .4byte 0x082D2A58
	thumb_func_end sub_08035450

	thumb_func_start sub_08035460
sub_08035460: @ 0x08035460
	push {lr}
	bl ResetSpriteData
	ldr r0, _08035494
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08035498
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0803549C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08035494: .4byte 0x082EBAE0
_08035498: .4byte 0x020205AC
_0803549C: .4byte 0x080354A1
	thumb_func_end sub_08035460

	thumb_func_start sub_080354A0
sub_080354A0: @ 0x080354A0
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080354A0

