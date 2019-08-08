.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0811FE38
sub_0811FE38: @ 0x0811FE38
	push {lr}
	sub sp, #4
	ldr r0, _0811FE70
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	lsrs r0, r0, #3
	bl GetWindowFrameTilesPal
	ldr r3, _0811FE74
	ldr r2, [r3]
	ldr r1, [r0]
	str r1, [r2, #0x2c]
	ldr r0, [r0, #4]
	str r0, [r2, #0x30]
	ldr r0, _0811FE78
	adds r2, r2, r0
	movs r1, #0
	strb r1, [r2]
	mov r0, sp
	strh r1, [r0]
	ldr r1, [r3]
	adds r1, #0x34
	ldr r2, _0811FE7C
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0811FE70: .4byte 0x03005AF0
_0811FE74: .4byte 0x02039DF0
_0811FE78: .4byte 0x000010B4
_0811FE7C: .4byte 0x01000800
	thumb_func_end sub_0811FE38

	thumb_func_start sub_0811FE80
sub_0811FE80: @ 0x0811FE80
	push {r4, r5, r6, r7, lr}
	ldr r0, _0811FEA0
	ldr r1, [r0]
	ldr r2, _0811FEA4
	adds r0, r1, r2
	ldrb r2, [r0]
	lsls r0, r2, #8
	adds r0, #0x34
	adds r5, r1, r0
	cmp r2, #0xd
	beq _0811FF50
	cmp r2, #0xd
	bgt _0811FEA8
	cmp r2, #0
	beq _0811FEAE
	b _0811FEF8
	.align 2, 0
_0811FEA0: .4byte 0x02039DF0
_0811FEA4: .4byte 0x000010B4
_0811FEA8:
	cmp r2, #0xe
	beq _0811FF9C
	b _0811FEF8
_0811FEAE:
	ldr r0, [r1, #0x2c]
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	movs r4, #0
	adds r7, r5, #0
	adds r7, #0xe0
_0811FEBE:
	ldr r6, _0811FEF0
	ldr r0, [r6]
	ldr r0, [r0, #0x2c]
	adds r0, #0x20
	adds r4, #1
	lsls r1, r4, #5
	adds r1, r5, r1
	movs r2, #8
	bl CpuFastSet
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #5
	bls _0811FEBE
	ldr r0, [r6]
	ldr r0, [r0, #0x2c]
	adds r0, #0x40
	adds r1, r7, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r0, _0811FEF4
	adds r1, r1, r0
	b _0811FF3E
	.align 2, 0
_0811FEF0: .4byte 0x02039DF0
_0811FEF4: .4byte 0x000010B4
_0811FEF8:
	ldr r0, _0811FF48
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	adds r0, #0x60
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	movs r4, #0
	adds r7, r5, #0
	adds r7, #0xe0
_0811FF0E:
	ldr r6, _0811FF48
	ldr r0, [r6]
	ldr r0, [r0, #0x2c]
	adds r0, #0x80
	adds r4, #1
	lsls r1, r4, #5
	adds r1, r5, r1
	movs r2, #8
	bl CpuFastSet
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #5
	bls _0811FF0E
	ldr r0, [r6]
	ldr r0, [r0, #0x2c]
	adds r0, #0xa0
	adds r1, r7, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r2, _0811FF4C
	adds r1, r1, r2
_0811FF3E:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0811FFA8
	.align 2, 0
_0811FF48: .4byte 0x02039DF0
_0811FF4C: .4byte 0x000010B4
_0811FF50:
	ldr r0, [r1, #0x2c]
	adds r0, #0xc0
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	movs r4, #0
	adds r7, r5, #0
	adds r7, #0xe0
_0811FF62:
	ldr r6, _0811FFA0
	ldr r0, [r6]
	ldr r0, [r0, #0x2c]
	adds r0, #0xe0
	adds r4, #1
	lsls r1, r4, #5
	adds r1, r5, r1
	movs r2, #8
	bl CpuFastSet
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #5
	bls _0811FF62
	ldr r0, [r6]
	ldr r0, [r0, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r2, _0811FFA4
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0811FF9C:
	movs r0, #0
	b _0811FFAA
	.align 2, 0
_0811FFA0: .4byte 0x02039DF0
_0811FFA4: .4byte 0x000010B4
_0811FFA8:
	movs r0, #1
_0811FFAA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0811FE80

	thumb_func_start sub_0811FFB0
sub_0811FFB0: @ 0x0811FFB0
	push {lr}
	bl sub_0811FE38
_0811FFB6:
	bl sub_0811FE80
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811FFB6
	pop {r0}
	bx r0
	thumb_func_end sub_0811FFB0

	thumb_func_start sub_0811FFC4
sub_0811FFC4: @ 0x0811FFC4
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r2, _08120014
	ldr r3, [r2]
	movs r1, #0
	strb r1, [r3, #5]
	ldr r1, [r2]
	strb r0, [r1, #4]
	movs r3, #0
	adds r7, r2, #0
	adds r4, r7, #0
	movs r2, #1
_0811FFE2:
	ldr r0, [r4]
	adds r1, r0, #6
	adds r1, r1, r3
	ldrb r0, [r0, #4]
	asrs r0, r3
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bls _0811FFE2
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r3, [r7]
	ldrh r2, [r3]
	ldrh r3, [r3, #2]
	bl sub_081201A0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120014: .4byte 0x02039DF0
	thumb_func_end sub_0811FFC4

	thumb_func_start sub_08120018
sub_08120018: @ 0x08120018
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r4, _081200C0
_0812001E:
	ldr r0, [r4]
	ldrh r0, [r0]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeSpritePaletteByTag
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #1
	bls _0812001E
	movs r5, #0
	ldr r6, _081200C0
_08120048:
	ldr r0, [r6]
	lsls r4, r5, #2
	adds r0, #0xc
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _081200BA
	bl DestroySprite
	ldr r0, [r6]
	adds r0, #0xc
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #1
	bls _08120048
	movs r5, #0
	ldr r6, _081200C0
_08120072:
	ldr r0, [r6]
	lsls r4, r5, #2
	adds r0, #0x14
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _081200BA
	bl DestroySprite
	ldr r0, [r6]
	adds r0, #0x14
	adds r0, r0, r4
	movs r7, #0
	str r7, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _08120072
	ldr r4, _081200C0
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _081200AA
	bl DestroySprite
	ldr r0, [r4]
	str r7, [r0, #0x24]
_081200AA:
	ldr r0, [r4]
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _081200BA
	bl DestroySprite
	ldr r0, [r4]
	str r7, [r0, #0x28]
_081200BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081200C0: .4byte 0x02039DF0
	thumb_func_end sub_08120018

	thumb_func_start sub_081200C4
sub_081200C4: @ 0x081200C4
	push {r4, r5, lr}
	ldr r0, _081200F4
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _081200FC
	movs r0, #5
	bl PlaySE
	ldr r2, _081200F8
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08120184
	ldr r1, [r2]
	movs r0, #5
	strb r0, [r1, #5]
	b _08120184
	.align 2, 0
_081200F4: .4byte 0x03002360
_081200F8: .4byte 0x02039DF0
_081200FC:
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0812012C
	movs r0, #5
	bl PlaySE
	ldr r2, _08120128
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	adds r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	ble _08120184
	ldr r0, [r2]
	strb r5, [r0, #5]
	b _08120184
	.align 2, 0
_08120128: .4byte 0x02039DF0
_0812012C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08120188
	movs r0, #5
	bl PlaySE
	ldr r2, _0812015C
	ldr r0, [r2]
	movs r1, #5
	ldrsb r1, [r0, r1]
	cmp r1, #4
	beq _08120160
	cmp r1, #5
	beq _08120196
	adds r0, #6
	adds r1, r0, r1
	movs r2, #0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08120182
	movs r2, #1
	b _08120182
	.align 2, 0
_0812015C: .4byte 0x02039DF0
_08120160:
	strb r4, [r0, #4]
	movs r3, #0
	adds r4, r2, #0
_08120166:
	ldr r2, [r4]
	adds r0, r2, #6
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r3
	ldrb r1, [r2, #4]
	orrs r0, r1
	strb r0, [r2, #4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bls _08120166
	b _08120196
_08120182:
	strb r2, [r1]
_08120184:
	movs r0, #1
	b _08120198
_08120188:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08120184
	movs r0, #5
	bl PlaySE
_08120196:
	movs r0, #0
_08120198:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081200C4

	thumb_func_start sub_081201A0
sub_081201A0: @ 0x081201A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	mov r8, r0
	mov sb, r1
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r4, _08120398
	ldr r0, [r4]
	adds r0, #0x34
	str r0, [sp, #0x18]
	add r1, sp, #0x1c
	movs r7, #0
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r1]
	mov r0, sp
	adds r0, #0x1e
	strh r5, [r0]
	add r1, sp, #0x20
	ldr r0, _0812039C
	str r0, [sp, #0x20]
	movs r0, #0xc8
	lsls r0, r0, #2
	strh r0, [r1, #4]
	adds r0, r5, #1
	strh r0, [r1, #6]
	add r0, sp, #0x28
	movs r1, #0
	movs r2, #8
	bl memset
	add r2, sp, #0x18
	mov sl, r2
	mov r0, sp
	mov r1, sl
	movs r2, #0x18
	bl memcpy
	ldr r0, [r4]
	ldr r0, [r0, #0x30]
	str r0, [sp, #0x30]
	add r0, sp, #0x34
	strh r6, [r0]
	add r1, sp, #0x38
	ldr r0, _081203A0
	str r0, [sp, #0x38]
	adds r0, r6, #1
	strh r0, [r1, #4]
	add r0, sp, #0x40
	movs r1, #0
	movs r2, #8
	bl memset
	add r4, sp, #0x30
	mov r0, sl
	adds r1, r4, #0
	movs r2, #0x18
	bl memcpy
	strh r5, [r4]
	strh r6, [r4, #2]
	ldr r0, _081203A4
	str r0, [r4, #4]
	ldr r0, _081203A8
	str r0, [r4, #8]
	str r7, [r4, #0xc]
	ldr r0, _081203AC
	str r0, [r4, #0x10]
	ldr r0, _081203B0
	str r0, [r4, #0x14]
	mov r0, sp
	bl LoadSpriteSheets
	mov r0, sl
	bl LoadSpritePalettes
	movs r5, #0
	mov r3, r8
	lsls r3, r3, #0x10
	mov r8, r3
	movs r0, #0x80
	lsls r0, r0, #0xe
	add r0, r8
	mov sl, r0
	mov r1, r8
	str r1, [sp, #0x48]
	mov r2, sb
	lsls r2, r2, #0x10
	mov sb, r2
	movs r7, #0x80
	lsls r7, r7, #0xe
	add r7, sb
	mov r3, sb
	str r3, [sp, #0x4c]
_08120278:
	adds r0, r4, #0
	mov r2, sl
	asrs r1, r2, #0x10
	asrs r2, r7, #0x10
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	bne _08120290
	b _0812041C
_08120290:
	ldr r6, _08120398
	ldr r2, [r6]
	lsls r0, r5, #2
	adds r2, #0xc
	adds r2, r2, r0
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, _081203B4
	adds r0, r0, r1
	str r0, [r2]
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #1
	bls _08120278
	ldr r0, [r6]
	ldr r1, [r0, #0x10]
	ldr r3, [sp, #0x4c]
	asrs r0, r3, #0x10
	adds r0, #0x60
	strh r0, [r1, #0x22]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	ldr r0, _081203B8
	str r0, [r4, #8]
	ldr r0, _081203BC
	str r0, [r4, #0x14]
	ldr r0, _081203C0
	str r0, [r4, #4]
	movs r5, #0
	ldr r0, [sp, #0x48]
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r0, r0, r1
	mov sb, r0
_081202E8:
	lsls r2, r5, #4
	adds r2, #0x10
	ldr r3, [sp, #0x4c]
	asrs r3, r3, #0x10
	mov r8, r3
	add r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	mov r3, sb
	asrs r1, r3, #0x10
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	bne _0812030E
	b _0812042C
_0812030E:
	ldr r6, _08120398
	ldr r1, [r6]
	lsls r0, r5, #2
	adds r1, #0x14
	adds r1, r1, r0
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r7, _081203B4
	adds r0, r0, r7
	str r0, [r1]
	strh r5, [r0, #0x2e]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _081202E8
	ldr r0, _081203C4
	str r0, [r4, #0x14]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _081203C8
	ldr r0, [r6]
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r7
	str r1, [r0, #0x28]
	ldrb r3, [r1, #1]
	movs r2, #0x3f
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1, #1]
	ldr r0, [r6]
	ldr r1, [r0, #0x28]
	ldrb r0, [r1, #3]
	ands r2, r0
	movs r0, #0x80
	orrs r2, r0
	strb r2, [r1, #3]
	ldr r0, [r6]
	ldr r0, [r0, #0x28]
	movs r1, #9
	bl StartSpriteAnim
	ldr r1, [r6]
	ldr r2, [r1, #0x28]
	ldr r3, [sp, #0x48]
	asrs r0, r3, #0x10
	adds r0, #0x20
	strh r0, [r2, #0x20]
	ldr r2, [r1, #0x28]
	mov r0, r8
	adds r0, #0x50
	strh r0, [r2, #0x22]
	ldr r0, [r1, #0x28]
	movs r1, #1
	movs r2, #2
	movs r3, #0
	bl CalcCenterToCornerVec
	b _081203CE
	.align 2, 0
_08120398: .4byte 0x02039DF0
_0812039C: .4byte 0x08579F58
_081203A0: .4byte 0x08579F38
_081203A4: .4byte 0x0857AAA0
_081203A8: .4byte 0x0857AB38
_081203AC: .4byte 0x082BF310
_081203B0: .4byte 0x0812045D
_081203B4: .4byte 0x020205AC
_081203B8: .4byte 0x0857AB00
_081203BC: .4byte 0x08120461
_081203C0: .4byte 0x0857AAA8
_081203C4: .4byte 0x08007141
_081203C8:
	ldr r1, [r6]
	movs r0, #0
	str r0, [r1, #0x28]
_081203CE:
	ldr r0, _08120410
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x48]
	movs r2, #0xc0
	lsls r2, r2, #0xc
	adds r1, r0, r2
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _08120440
	ldr r0, _08120414
	ldr r2, [r0]
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r0, _08120418
	adds r1, r1, r0
	str r1, [r2, #0x24]
	ldr r3, [sp, #0x4c]
	asrs r0, r3, #0x10
	adds r0, #0x10
	strh r0, [r1, #0x2e]
	ldr r0, [r2, #0x24]
	movs r1, #8
	bl StartSpriteAnim
	b _08120448
	.align 2, 0
_08120410: .4byte 0x0812049D
_08120414: .4byte 0x02039DF0
_08120418: .4byte 0x020205AC
_0812041C:
	ldr r0, _08120428
	ldr r0, [r0]
	lsls r1, r5, #2
	adds r0, #0xc
	b _08120434
	.align 2, 0
_08120428: .4byte 0x02039DF0
_0812042C:
	ldr r0, _0812043C
	ldr r0, [r0]
	lsls r1, r5, #2
	adds r0, #0x14
_08120434:
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	b _08120448
	.align 2, 0
_0812043C: .4byte 0x02039DF0
_08120440:
	ldr r0, _08120458
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x24]
_08120448:
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120458: .4byte 0x02039DF0
	thumb_func_end sub_081201A0

	thumb_func_start TaskDummy7
TaskDummy7: @ 0x0812045C
	bx lr
	.align 2, 0
	thumb_func_end TaskDummy7

	thumb_func_start sub_08120460
sub_08120460: @ 0x08120460
	push {lr}
	adds r2, r0, #0
	ldr r0, _08120488
	ldr r0, [r0]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r0, #6
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0812048C
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl StartSpriteAnim
	b _08120496
	.align 2, 0
_08120488: .4byte 0x02039DF0
_0812048C:
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl StartSpriteAnim
_08120496:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08120460

	thumb_func_start sub_0812049C
sub_0812049C: @ 0x0812049C
	ldr r1, _081204B0
	ldr r1, [r1]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	ldrh r2, [r0, #0x2e]
	adds r1, r1, r2
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_081204B0: .4byte 0x02039DF0
	thumb_func_end sub_0812049C

	thumb_func_start sub_081204B4
sub_081204B4: @ 0x081204B4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r2, #0
	bne _081204C4
	ldr r2, _081204D0
_081204C4:
	movs r3, #0x10
	bl sub_081204F4
	pop {r1}
	bx r1
	.align 2, 0
_081204D0: .4byte 0x0857A278
	thumb_func_end sub_081204B4

	thumb_func_start sub_081204D4
sub_081204D4: @ 0x081204D4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r2, #0
	bne _081204E4
	ldr r2, _081204F0
_081204E4:
	movs r3, #1
	bl sub_081204F4
	pop {r1}
	bx r1
	.align 2, 0
_081204F0: .4byte 0x0857A278
	thumb_func_end sub_081204D4

	thumb_func_start sub_081204F4
sub_081204F4: @ 0x081204F4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _08120570
	str r4, [sp, #0x18]
	movs r4, #0x80
	add r5, sp, #0x18
	lsrs r6, r0, #0x10
	orrs r0, r4
	str r0, [r5, #4]
	str r2, [sp, #0x20]
	ldr r0, _08120574
	mov r8, r0
	add r4, sp, #0x20
	ldr r0, [r4, #4]
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	str r0, [r4, #4]
	mov r0, sp
	movs r2, #0
	strh r6, [r0]
	strh r1, [r0, #2]
	ldr r0, _08120578
	str r0, [sp, #4]
	ldr r0, _0812057C
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, _08120580
	str r0, [sp, #0x10]
	ldr r0, _08120584
	str r0, [sp, #0x14]
	lsls r3, r3, #0x17
	lsrs r3, r3, #0x10
	ldr r0, [r5, #4]
	mov r1, r8
	ands r0, r1
	orrs r0, r3
	str r0, [r5, #4]
	adds r0, r5, #0
	bl LoadSpriteSheet
	adds r0, r4, #0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	bne _08120588
	movs r0, #0
	b _08120592
	.align 2, 0
_08120570: .4byte 0x0857A298
_08120574: .4byte 0xFFFF0000
_08120578: .4byte 0x0857AB40
_0812057C: .4byte 0x0857ABC8
_08120580: .4byte 0x082BF310
_08120584: .4byte 0x0812045D
_08120588:
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081205A0
	adds r0, r0, r1
_08120592:
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081205A0: .4byte 0x020205AC
	thumb_func_end sub_081204F4

	thumb_func_start sub_081205A4
sub_081205A4: @ 0x081205A4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x11
	ldr r2, _081205BC
	adds r0, r0, r2
	movs r2, #0x80
	movs r3, #0x10
	bl RequestDma3Copy
	pop {r0}
	bx r0
	.align 2, 0
_081205BC: .4byte 0x0857A298
	thumb_func_end sub_081205A4

