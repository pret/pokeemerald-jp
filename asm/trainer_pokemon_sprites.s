.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DummyPicSpriteCallback
DummyPicSpriteCallback: @ 0x0818CCF4
	bx lr
	.align 2, 0
	thumb_func_end DummyPicSpriteCallback

	thumb_func_start ResetAllPicSprites
ResetAllPicSprites: @ 0x0818CCF8
	push {r4, r5, r6, r7, lr}
	ldr r4, _0818CD18
	ldr r3, _0818CD1C
	movs r2, #7
_0818CD00:
	adds r1, r3, #0
	adds r0, r4, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	adds r3, #0xc
	subs r2, #1
	cmp r2, #0
	bge _0818CD00
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818CD18: .4byte 0x085D3AB8
_0818CD1C: .4byte 0x0203C9D0
	thumb_func_end ResetAllPicSprites

	thumb_func_start DecompressPic
DecompressPic: @ 0x0818CD20
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r1, #0
	adds r5, r3, #0
	ldr r3, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r7, r4, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	cmp r3, #0
	bne _0818CD94
	cmp r2, #0
	beq _0818CD60
	cmp r1, #0
	bne _0818CD54
	lsls r0, r4, #3
	ldr r1, _0818CD50
	b _0818CD68
	.align 2, 0
_0818CD50: .4byte 0x082DDA1C
_0818CD54:
	lsls r0, r4, #3
	ldr r1, _0818CD5C
	b _0818CD80
	.align 2, 0
_0818CD5C: .4byte 0x082DDA1C
_0818CD60:
	cmp r0, #0
	bne _0818CD7C
	lsls r0, r4, #3
	ldr r1, _0818CD78
_0818CD68:
	adds r0, r0, r1
	str r2, [sp]
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl LoadSpecialPokePic
	b _0818CDBA
	.align 2, 0
_0818CD78: .4byte 0x082D6148
_0818CD7C:
	lsls r0, r4, #3
	ldr r1, _0818CD90
_0818CD80:
	adds r0, r0, r1
	str r2, [sp]
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl LoadSpecialPokePic_DontHandleDeoxys
	b _0818CDBA
	.align 2, 0
_0818CD90: .4byte 0x082D6148
_0818CD94:
	cmp r2, #0
	beq _0818CDAC
	lsls r0, r4, #3
	ldr r1, _0818CDA8
	adds r0, r0, r1
	adds r1, r5, #0
	adds r2, r4, #0
	bl DecompressPicFromTable
	b _0818CDBA
	.align 2, 0
_0818CDA8: .4byte 0x082D8EE4
_0818CDAC:
	lsls r0, r7, #3
	ldr r1, _0818CDC4
	adds r0, r0, r1
	adds r1, r5, #0
	adds r2, r7, #0
	bl DecompressPicFromTable
_0818CDBA:
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818CDC4: .4byte 0x082D95DC
	thumb_func_end DecompressPic

	thumb_func_start DecompressPic_HandleDeoxys
DecompressPic_HandleDeoxys: @ 0x0818CDC8
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	bl DecompressPic
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DecompressPic_HandleDeoxys

	thumb_func_start LoadPicPaletteByTagOrSlot
LoadPicPaletteByTagOrSlot: @ 0x0818CDF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r1, #0
	mov r8, r2
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r6, r4, #0
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	mov ip, r5
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	adds r1, r3, #0
	lsls r2, r2, #0x18
	cmp r2, #0
	bne _0818CE54
	ldr r0, _0818CE34
	cmp r3, r0
	bne _0818CE3C
	ldr r2, _0818CE38
	ldrh r1, [r2, #2]
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2, #2]
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl GetMonSpritePalFromSpeciesAndPersonality
	lsls r1, r5, #0x14
	b _0818CE70
	.align 2, 0
_0818CE34: .4byte 0x0000FFFF
_0818CE38: .4byte 0x0203C9B8
_0818CE3C:
	ldr r0, _0818CE50
	strh r3, [r0, #2]
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl GetMonSpritePalStructFromOtIdPersonality
	bl LoadCompressedSpritePalette
	b _0818CE9A
	.align 2, 0
_0818CE50: .4byte 0x0203C9B8
_0818CE54:
	ldr r0, _0818CE80
	cmp r3, r0
	bne _0818CE8C
	ldr r2, _0818CE84
	ldrh r1, [r2, #2]
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2, #2]
	ldr r1, _0818CE88
	lsls r0, r4, #3
	adds r0, r0, r1
	ldr r0, [r0]
	mov r2, ip
	lsls r1, r2, #0x14
_0818CE70:
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl LoadCompressedPalette
	b _0818CE9A
	.align 2, 0
_0818CE80: .4byte 0x0000FFFF
_0818CE84: .4byte 0x0203C9B8
_0818CE88: .4byte 0x082D91CC
_0818CE8C:
	ldr r0, _0818CEA4
	strh r1, [r0, #2]
	lsls r0, r6, #3
	ldr r1, _0818CEA8
	adds r0, r0, r1
	bl LoadCompressedSpritePalette
_0818CE9A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818CEA4: .4byte 0x0203C9B8
_0818CEA8: .4byte 0x082D91CC
	thumb_func_end LoadPicPaletteByTagOrSlot

	thumb_func_start LoadPicPaletteBySlot
LoadPicPaletteBySlot: @ 0x0818CEAC
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _0818CED0
	adds r1, r5, #0
	bl GetMonSpritePalFromSpeciesAndPersonality
	lsls r1, r4, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	b _0818CEE0
_0818CED0:
	ldr r1, _0818CEE8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r4, #4
	movs r2, #0x20
	bl LoadCompressedPalette
_0818CEE0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818CEE8: .4byte 0x082D91CC
	thumb_func_end LoadPicPaletteBySlot

	thumb_func_start AssignSpriteAnimsTable
AssignSpriteAnimsTable: @ 0x0818CEEC
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0818CF04
	ldr r1, _0818CEFC
	ldr r0, _0818CF00
	str r0, [r1, #8]
	b _0818CF0C
	.align 2, 0
_0818CEFC: .4byte 0x0203C9B8
_0818CF00: .4byte 0x082D2F9C
_0818CF04:
	ldr r0, _0818CF10
	ldr r1, _0818CF14
	ldr r1, [r1]
	str r1, [r0, #8]
_0818CF0C:
	pop {r0}
	bx r0
	.align 2, 0
_0818CF10: .4byte 0x0203C9B8
_0818CF14: .4byte 0x082D8BFC
	thumb_func_end AssignSpriteAnimsTable

	thumb_func_start CreatePicSprite
CreatePicSprite: @ 0x0818CF18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x54]
	ldr r4, [sp, #0x58]
	ldr r5, [sp, #0x5c]
	ldr r6, [sp, #0x60]
	ldr r7, [sp, #0x64]
	mov r8, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x18]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x1c]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x20]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov sl, r5
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov sb, r6
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r1, _0818CFB0
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	beq _0818CF88
_0818CF70:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bhi _0818CF88
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _0818CF70
_0818CF88:
	cmp r4, #8
	beq _0818CFAC
	movs r0, #0x80
	lsls r0, r0, #6
	bl Alloc
	adds r7, r0, #0
	cmp r7, #0
	beq _0818CFAC
	movs r0, #0x20
	bl Alloc
	mov r8, r0
	cmp r0, #0
	bne _0818CFB8
	adds r0, r7, #0
	bl Free
_0818CFAC:
	ldr r0, _0818CFB4
	b _0818D082
	.align 2, 0
_0818CFB0: .4byte 0x0203C9D0
_0818CFB4: .4byte 0x0000FFFF
_0818CFB8:
	mov r1, sb
	str r1, [sp]
	str r5, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	adds r3, r7, #0
	bl DecompressPic
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0818CFAC
	lsls r2, r4, #1
	str r2, [sp, #0x2c]
	ldr r5, _0818D094
	ldr r0, _0818D098
	mov ip, r0
	ldr r1, [sp, #0x18]
	lsls r1, r1, #0x10
	str r1, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	lsls r2, r2, #0x10
	str r2, [sp, #0x28]
	movs r3, #0x80
	lsls r3, r3, #4
	mov r0, r8
	adds r1, r7, #0
	adds r6, r3, #0
	movs r2, #3
_0818CFF2:
	str r1, [r0]
	strh r3, [r0, #4]
	adds r0, #8
	adds r1, r1, r6
	subs r2, #1
	cmp r2, #0
	bge _0818CFF2
	ldr r0, _0818D09C
	strh r0, [r5]
	mov r0, ip
	str r0, [r5, #4]
	mov r0, sb
	bl AssignSpriteAnimsTable
	mov r1, r8
	str r1, [r5, #0xc]
	ldr r0, _0818D0A0
	str r0, [r5, #0x10]
	ldr r0, _0818D0A4
	str r0, [r5, #0x14]
	mov r2, sl
	str r2, [sp]
	mov r0, sb
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x20]
	bl LoadPicPaletteByTagOrSlot
	ldr r2, [sp, #0x24]
	asrs r1, r2, #0x10
	ldr r0, [sp, #0x28]
	asrs r2, r0, #0x10
	adds r0, r5, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r6, r2, #0
	ldr r0, _0818D09C
	cmp sl, r0
	bne _0818D062
	ldr r0, _0818D0A8
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [sp, #0x20]
	lsls r3, r2, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
_0818D062:
	ldr r1, _0818D0AC
	ldr r2, [sp, #0x2c]
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r2, r0, r1
	str r7, [r2]
	adds r1, #4
	adds r0, r0, r1
	mov r7, r8
	str r7, [r0]
	mov r0, sl
	strh r0, [r2, #8]
	strb r6, [r2, #0xa]
	movs r0, #1
	strb r0, [r2, #0xb]
	adds r0, r6, #0
_0818D082:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818D094: .4byte 0x0203C9B8
_0818D098: .4byte 0x085D3AC4
_0818D09C: .4byte 0x0000FFFF
_0818D0A0: .4byte 0x082BF310
_0818D0A4: .4byte 0x0818CCF5
_0818D0A8: .4byte 0x020205AC
_0818D0AC: .4byte 0x0203C9D0
	thumb_func_end CreatePicSprite

	thumb_func_start CreatePicSprite_HandleDeoxys
CreatePicSprite_HandleDeoxys: @ 0x0818D0B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x34]
	ldr r5, [sp, #0x38]
	ldr r6, [sp, #0x3c]
	ldr r7, [sp, #0x40]
	mov r8, r7
	ldr r7, [sp, #0x44]
	mov sb, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r7, r8
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov r8, r7
	mov r7, sb
	lsls r7, r7, #0x18
	lsrs r7, r7, #0x18
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp, #4]
	str r6, [sp, #8]
	mov r4, r8
	str r4, [sp, #0xc]
	str r7, [sp, #0x10]
	movs r4, #0
	str r4, [sp, #0x14]
	bl CreatePicSprite
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end CreatePicSprite_HandleDeoxys

	thumb_func_start CreatePicSprite2
CreatePicSprite2: @ 0x0818D110
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r1, [sp, #0x4c]
	ldr r2, [sp, #0x50]
	ldr r4, [sp, #0x54]
	ldr r5, [sp, #0x58]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x10]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x14]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x1c]
	movs r5, #0
	ldr r1, _0818D190
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	beq _0818D16C
_0818D154:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bhi _0818D16C
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _0818D154
_0818D16C:
	cmp r5, #8
	beq _0818D1A8
	movs r0, #0x80
	lsls r0, r0, #6
	bl Alloc
	adds r7, r0, #0
	cmp r7, #0
	beq _0818D1A8
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	beq _0818D194
	movs r0, #0x7f
	ands r6, r0
	movs r0, #3
	mov sb, r0
	b _0818D196
	.align 2, 0
_0818D190: .4byte 0x0203C9D0
_0818D194:
	mov sb, r6
_0818D196:
	movs r0, #0x20
	bl Alloc
	mov r8, r0
	cmp r0, #0
	bne _0818D1B0
	adds r0, r7, #0
	bl Free
_0818D1A8:
	ldr r0, _0818D1AC
	b _0818D2B4
	.align 2, 0
_0818D1AC: .4byte 0x0000FFFF
_0818D1B0:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, sl
	ldr r1, [sp, #0xc]
	adds r2, r6, #0
	adds r3, r7, #0
	bl DecompressPic
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0818D1A8
	lsls r1, r5, #1
	str r1, [sp, #0x28]
	ldr r4, _0818D214
	mov r2, sl
	lsls r2, r2, #2
	mov ip, r2
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0x10
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x14]
	lsls r1, r1, #0x10
	str r1, [sp, #0x24]
	movs r3, #0x80
	lsls r3, r3, #4
	mov r0, r8
	adds r1, r7, #0
	adds r6, r3, #0
	movs r2, #3
_0818D1EC:
	str r1, [r0]
	strh r3, [r0, #4]
	adds r0, #8
	adds r1, r1, r6
	subs r2, #1
	cmp r2, #0
	bge _0818D1EC
	ldr r0, _0818D218
	strh r0, [r4]
	ldr r0, _0818D21C
	add r0, ip
	ldr r0, [r0]
	str r0, [r4, #8]
	mov r2, r8
	str r2, [r4, #0xc]
	mov r0, sb
	cmp r0, #1
	bne _0818D224
	ldr r0, _0818D220
	b _0818D22C
	.align 2, 0
_0818D214: .4byte 0x0203C9B8
_0818D218: .4byte 0x0000FFFF
_0818D21C: .4byte 0x082DD33C
_0818D220: .4byte 0x082D2F24
_0818D224:
	mov r1, sb
	cmp r1, #0
	bne _0818D23C
	ldr r0, _0818D234
_0818D22C:
	str r0, [r4, #0x10]
	ldr r0, _0818D238
	str r0, [r4, #4]
	b _0818D244
	.align 2, 0
_0818D234: .4byte 0x082D2EA8
_0818D238: .4byte 0x085D3ACC
_0818D23C:
	ldr r0, _0818D2C4
	str r0, [r4, #4]
	ldr r0, _0818D2C8
	str r0, [r4, #0x10]
_0818D244:
	ldr r2, _0818D2CC
	str r2, [r4, #0x14]
	ldr r0, [sp, #0x1c]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	mov r0, sl
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x18]
	bl LoadPicPaletteByTagOrSlot
	ldr r2, [sp, #0x20]
	asrs r1, r2, #0x10
	ldr r0, [sp, #0x24]
	asrs r2, r0, #0x10
	adds r0, r4, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r6, r2, #0
	ldr r0, _0818D2D0
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	bne _0818D292
	ldr r0, _0818D2D4
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [sp, #0x18]
	lsls r3, r2, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
_0818D292:
	ldr r1, _0818D2D8
	ldr r2, [sp, #0x28]
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r2, r0, r1
	str r7, [r2]
	adds r1, #4
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	mov r0, sp
	ldrh r0, [r0, #0x1c]
	strh r0, [r2, #8]
	strb r6, [r2, #0xa]
	movs r0, #1
	strb r0, [r2, #0xb]
	adds r0, r6, #0
_0818D2B4:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818D2C4: .4byte 0x085D3AC4
_0818D2C8: .4byte 0x082BF310
_0818D2CC: .4byte 0x0818CCF5
_0818D2D0: .4byte 0x0000FFFF
_0818D2D4: .4byte 0x020205AC
_0818D2D8: .4byte 0x0203C9D0
	thumb_func_end CreatePicSprite2

	thumb_func_start FreeAndDestroyPicSpriteInternal
FreeAndDestroyPicSpriteInternal: @ 0x0818D2DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r2, #0
	ldr r0, _0818D314
	ldrb r1, [r0, #0xa]
	adds r3, r0, #0
	cmp r1, r4
	beq _0818D30C
	adds r1, r3, #0
_0818D2F4:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bhi _0818D30C
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xa]
	cmp r0, r4
	bne _0818D2F4
_0818D30C:
	cmp r2, #8
	bne _0818D31C
	ldr r0, _0818D318
	b _0818D372
	.align 2, 0
_0818D314: .4byte 0x0203C9D0
_0818D318: .4byte 0x0000FFFF
_0818D31C:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r5, r0, r3
	ldr r1, [r5]
	mov r8, r1
	adds r1, r3, #4
	adds r0, r0, r1
	ldr r7, [r0]
	ldrh r1, [r5, #8]
	ldr r0, _0818D37C
	lsls r6, r4, #4
	cmp r1, r0
	beq _0818D350
	ldr r1, _0818D380
	adds r0, r6, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeSpritePaletteByTag
_0818D350:
	adds r0, r6, r4
	lsls r0, r0, #2
	ldr r1, _0818D380
	adds r0, r0, r1
	bl DestroySprite
	mov r0, r8
	bl Free
	adds r0, r7, #0
	bl Free
	adds r1, r5, #0
	ldr r0, _0818D384
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #0
_0818D372:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818D37C: .4byte 0x0000FFFF
_0818D380: .4byte 0x020205AC
_0818D384: .4byte 0x085D3AB8
	thumb_func_end FreeAndDestroyPicSpriteInternal

	thumb_func_start sub_0818D388
sub_0818D388: @ 0x0818D388
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r1
	adds r7, r2, #0
	adds r4, r3, #0
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	adds r0, r2, #0
	movs r1, #7
	bl GetWindowAttribute
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl DecompressPic_HandleDeoxys
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0818D3E4
	str r6, [sp]
	adds r0, r5, #0
	mov r1, sb
	adds r2, r7, #0
	mov r3, r8
	bl LoadPicPaletteBySlot
	movs r0, #0
	b _0818D3E6
_0818D3E4:
	ldr r0, _0818D3F4
_0818D3E6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818D3F4: .4byte 0x0000FFFF
	thumb_func_end sub_0818D388

	thumb_func_start sub_0818D3F8
sub_0818D3F8: @ 0x0818D3F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x48]
	ldr r4, [sp, #0x4c]
	ldr r5, [sp, #0x50]
	ldr r6, [sp, #0x54]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x20]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	movs r0, #0x80
	lsls r0, r0, #6
	bl Alloc
	adds r4, r0, #0
	cmp r4, #0
	beq _0818D48E
	str r6, [sp]
	mov r0, sb
	ldr r1, [sp, #0x1c]
	adds r2, r7, #0
	adds r3, r4, #0
	bl DecompressPic_HandleDeoxys
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0818D48E
	movs r0, #0x40
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, sl
	str r1, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl BlitBitmapRectToWindow
	str r6, [sp]
	mov r0, sb
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	bl LoadPicPaletteBySlot
	adds r0, r4, #0
	bl Free
	movs r0, #0
	b _0818D490
_0818D48E:
	ldr r0, _0818D4A0
_0818D490:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818D4A0: .4byte 0x0000FFFF
	thumb_func_end sub_0818D3F8

	thumb_func_start CreateMonPicSprite
CreateMonPicSprite: @ 0x0818D4A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x34]
	ldr r5, [sp, #0x38]
	ldr r6, [sp, #0x3c]
	ldr r7, [sp, #0x40]
	mov r8, r7
	ldr r7, [sp, #0x44]
	mov sb, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r7, r8
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov r8, r7
	mov r7, sb
	lsls r7, r7, #0x18
	lsrs r7, r7, #0x18
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp, #4]
	str r6, [sp, #8]
	mov r4, r8
	str r4, [sp, #0xc]
	movs r4, #0
	str r4, [sp, #0x10]
	str r7, [sp, #0x14]
	bl CreatePicSprite
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end CreateMonPicSprite

	thumb_func_start CreateMonPicSprite_HandleDeoxys
CreateMonPicSprite_HandleDeoxys: @ 0x0818D504
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	ldr r7, [sp, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp, #4]
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	movs r4, #0
	str r4, [sp, #0x10]
	bl CreateMonPicSprite
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end CreateMonPicSprite_HandleDeoxys

	thumb_func_start FreeAndDestroyMonPicSprite
FreeAndDestroyMonPicSprite: @ 0x0818D54C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeAndDestroyPicSpriteInternal
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FreeAndDestroyMonPicSprite

	thumb_func_start sub_0818D560
sub_0818D560: @ 0x0818D560
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	bl sub_0818D388
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0818D560

	thumb_func_start sub_0818D590
sub_0818D590: @ 0x0818D590
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	ldr r7, [sp, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r7, r7, #0x18
	lsrs r7, r7, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	movs r4, #0
	str r4, [sp, #0x10]
	bl sub_0818D3F8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0818D590

	thumb_func_start CreateTrainerPicSprite
CreateTrainerPicSprite: @ 0x0818D5D8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r1, #0
	ldr r1, [sp, #0x20]
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	movs r1, #1
	str r1, [sp, #0x10]
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl CreatePicSprite_HandleDeoxys
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CreateTrainerPicSprite

	thumb_func_start FreeAndDestroyTrainerPicSprite
FreeAndDestroyTrainerPicSprite: @ 0x0818D61C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeAndDestroyPicSpriteInternal
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FreeAndDestroyTrainerPicSprite

	thumb_func_start sub_0818D630
sub_0818D630: @ 0x0818D630
	push {r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r2, [sp]
	str r3, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_0818D388
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0818D630

	thumb_func_start sub_0818D664
sub_0818D664: @ 0x0818D664
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r1, #0
	ldr r1, [sp, #0x20]
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r2, [sp]
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	movs r1, #1
	str r1, [sp, #0x10]
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_0818D3F8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0818D664

	thumb_func_start PlayerGenderToFrontTrainerPicId_Debug
PlayerGenderToFrontTrainerPicId_Debug: @ 0x0818D6A8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	bne _0818D6CE
	cmp r0, #0
	beq _0818D6C8
	ldr r0, _0818D6C4
	adds r0, #0x3f
	ldrb r0, [r0]
	b _0818D6CE
	.align 2, 0
_0818D6C4: .4byte 0x082EFF00
_0818D6C8:
	ldr r0, _0818D6D4
	adds r0, #0x3c
	ldrb r0, [r0]
_0818D6CE:
	pop {r1}
	bx r1
	.align 2, 0
_0818D6D4: .4byte 0x082EFF00
	thumb_func_end PlayerGenderToFrontTrainerPicId_Debug

