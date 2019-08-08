.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08074C24
sub_08074C24: @ 0x08074C24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	ldr r5, _08074D5C
	ldrh r0, [r5, #6]
	bl GetSpriteTileStartByTag
	lsls r0, r0, #0x10
	ldr r1, _08074D60
	cmp r0, r1
	bne _08074C56
	adds r0, r5, #0
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _08074D64
	bl LoadCompressedSpritePaletteUsingHeap
_08074C56:
	ldr r0, _08074D68
	bl CreateInvisibleSpriteWithCallback
	mov r8, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r5, r0, #4
	add r5, r8
	lsls r5, r5, #2
	ldr r0, _08074D6C
	adds r5, r5, r0
	strh r4, [r5, #0x30]
	ldr r0, _08074D70
	mov sb, r0
	lsls r6, r6, #0x10
	asrs r0, r6, #0x10
	mov sl, r0
	ldr r0, _08074D74
	adds r6, r6, r0
	asrs r6, r6, #0x10
	lsls r4, r7, #0x10
	asrs r7, r4, #0x10
	adds r4, r4, r0
	asrs r4, r4, #0x10
	mov r0, sb
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08074D6C
	adds r1, r1, r0
	mov r0, r8
	strh r0, [r1, #0x2e]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	adds r0, r1, #0
	bl AnimateSprite
	mov r0, sb
	mov r1, sl
	adds r2, r4, #0
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _08074D6C
	adds r4, r4, r0
	mov r0, r8
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r4, #0
	bl AnimateSprite
	mov r0, sb
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _08074D6C
	adds r4, r4, r0
	mov r0, r8
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
	adds r0, r4, #0
	bl AnimateSprite
	mov r0, sb
	mov r1, sl
	adds r2, r7, #0
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _08074D6C
	adds r4, r4, r0
	mov r0, r8
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	movs r1, #3
	bl StartSpriteAnim
	adds r0, r4, #0
	bl AnimateSprite
	mov r0, r8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074D5C: .4byte 0x082ECFA8
_08074D60: .4byte 0xFFFF0000
_08074D64: .4byte 0x082ECFB0
_08074D68: .4byte 0x08074D79
_08074D6C: .4byte 0x020205AC
_08074D70: .4byte 0x082ED010
_08074D74: .4byte 0xFFF00000
	thumb_func_end sub_08074C24

	thumb_func_start sub_08074D78
sub_08074D78: @ 0x08074D78
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08074DB0
	ldr r0, _08074DA4
	ldrh r0, [r0, #6]
	bl FreeSpriteTilesByTag
	ldr r0, _08074DA8
	ldrh r0, [r0, #4]
	bl FreeSpritePaletteByTag
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08074DAC
	adds r0, r4, #0
	bl DestroySprite
	b _08074DB0
	.align 2, 0
_08074DA4: .4byte 0x082ECFA8
_08074DA8: .4byte 0x082ECFB0
_08074DAC:
	ldr r0, _08074DB8
	str r0, [r4, #0x1c]
_08074DB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074DB8: .4byte 0x08007141
	thumb_func_end sub_08074D78

	thumb_func_start sub_08074DBC
sub_08074DBC: @ 0x08074DBC
	push {lr}
	adds r3, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08074DE6
	ldr r2, _08074DEC
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x2e]
	subs r1, #1
	strh r1, [r0, #0x2e]
	adds r0, r3, #0
	bl DestroySprite
_08074DE6:
	pop {r0}
	bx r0
	.align 2, 0
_08074DEC: .4byte 0x020205AC
	thumb_func_end sub_08074DBC

