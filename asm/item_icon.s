.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AllocItemIconTemporaryBuffers
AllocItemIconTemporaryBuffers: @ 0x081AFABC
	push {r4, r5, lr}
	ldr r5, _081AFAE4
	movs r0, #0x90
	lsls r0, r0, #1
	bl Alloc
	str r0, [r5]
	cmp r0, #0
	beq _081AFAF2
	ldr r4, _081AFAE8
	movs r0, #0x80
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r4]
	cmp r0, #0
	beq _081AFAEC
	movs r0, #1
	b _081AFAF4
	.align 2, 0
_081AFAE4: .4byte 0x0203CB88
_081AFAE8: .4byte 0x0203CB8C
_081AFAEC:
	ldr r0, [r5]
	bl Free
_081AFAF2:
	movs r0, #0
_081AFAF4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AllocItemIconTemporaryBuffers

	thumb_func_start FreeItemIconTemporaryBuffers
FreeItemIconTemporaryBuffers: @ 0x081AFAFC
	push {lr}
	ldr r0, _081AFB14
	ldr r0, [r0]
	bl Free
	ldr r0, _081AFB18
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_081AFB14: .4byte 0x0203CB88
_081AFB18: .4byte 0x0203CB8C
	thumb_func_end FreeItemIconTemporaryBuffers

	thumb_func_start CopyItemIconPicTo4x4Buffer
CopyItemIconPicTo4x4Buffer: @ 0x081AFB1C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r4, #0
_081AFB24:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r0, r6, r0
	lsls r1, r4, #7
	adds r1, r5, r1
	movs r2, #0x30
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _081AFB24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CopyItemIconPicTo4x4Buffer

	thumb_func_start AddItemIconSprite
AddItemIconSprite: @ 0x081AFB48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	bl AllocItemIconTemporaryBuffers
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AFC00
	adds r0, r5, #0
	movs r1, #0
	bl GetItemIconPicOrPalette
	ldr r4, _081AFBEC
	ldr r1, [r4]
	bl LZDecompressVram
	ldr r0, [r4]
	ldr r4, _081AFBF0
	ldr r1, [r4]
	bl CopyItemIconPicTo4x4Buffer
	ldr r0, [r4]
	str r0, [sp]
	ldr r4, _081AFBF4
	ldr r0, [sp, #4]
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	lsls r2, r7, #0x10
	ldr r1, _081AFBF8
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r5, #0
	movs r1, #1
	bl GetItemIconPicOrPalette
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, [r0, #4]
	ands r1, r4
	orrs r1, r6
	str r1, [r0, #4]
	bl LoadCompressedSpritePalette
	movs r0, #0x18
	bl Alloc
	adds r5, r0, #0
	ldr r0, _081AFBFC
	adds r1, r5, #0
	movs r2, #0xc
	bl CpuSet
	strh r7, [r5]
	strh r6, [r5, #2]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl FreeItemIconTemporaryBuffers
	adds r0, r5, #0
	bl Free
	adds r0, r4, #0
	b _081AFC02
	.align 2, 0
_081AFBEC: .4byte 0x0203CB88
_081AFBF0: .4byte 0x0203CB8C
_081AFBF4: .4byte 0xFFFF0000
_081AFBF8: .4byte 0x0000FFFF
_081AFBFC: .4byte 0x085E08AC
_081AFC00:
	movs r0, #0x40
_081AFC02:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AddItemIconSprite

	thumb_func_start AddCustomItemIconSprite
AddCustomItemIconSprite: @ 0x081AFC0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	bl AllocItemIconTemporaryBuffers
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AFCC4
	adds r0, r5, #0
	movs r1, #0
	bl GetItemIconPicOrPalette
	ldr r4, _081AFCB4
	ldr r1, [r4]
	bl LZDecompressVram
	ldr r0, [r4]
	ldr r4, _081AFCB8
	ldr r1, [r4]
	bl CopyItemIconPicTo4x4Buffer
	ldr r0, [r4]
	str r0, [sp]
	ldr r4, _081AFCBC
	ldr r0, [sp, #4]
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	lsls r2, r7, #0x10
	ldr r1, _081AFCC0
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r5, #0
	movs r1, #1
	bl GetItemIconPicOrPalette
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, [r0, #4]
	ands r1, r4
	orrs r1, r6
	str r1, [r0, #4]
	bl LoadCompressedSpritePalette
	movs r0, #0x18
	bl Alloc
	adds r5, r0, #0
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0xc
	bl CpuSet
	strh r7, [r5]
	strh r6, [r5, #2]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl FreeItemIconTemporaryBuffers
	adds r0, r5, #0
	bl Free
	adds r0, r4, #0
	b _081AFCC6
	.align 2, 0
_081AFCB4: .4byte 0x0203CB88
_081AFCB8: .4byte 0x0203CB8C
_081AFCBC: .4byte 0xFFFF0000
_081AFCC0: .4byte 0x0000FFFF
_081AFCC4:
	movs r0, #0x40
_081AFCC6:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AddCustomItemIconSprite

	thumb_func_start GetItemIconPicOrPalette
GetItemIconPicOrPalette: @ 0x081AFCD4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _081AFCE8
	cmp r3, r0
	bne _081AFCF0
	ldr r3, _081AFCEC
	b _081AFCFA
	.align 2, 0
_081AFCE8: .4byte 0x0000FFFF
_081AFCEC: .4byte 0x00000179
_081AFCF0:
	movs r0, #0xbc
	lsls r0, r0, #1
	cmp r3, r0
	bls _081AFCFA
	movs r3, #0
_081AFCFA:
	ldr r2, _081AFD0C
	lsls r0, r1, #2
	lsls r1, r3, #3
	adds r0, r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_081AFD0C: .4byte 0x085DFCC8
	thumb_func_end GetItemIconPicOrPalette

