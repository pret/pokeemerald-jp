.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetUpReflection
SetUpReflection: @ 0x08153E10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r5, r2, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r0, #0x22
	ldrsh r2, [r4, r0]
	adds r0, r4, #0
	movs r3, #0x98
	bl CreateCopySpriteAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08153EC0
	adds r7, r1, r0
	ldr r0, _08153EC4
	str r0, [r7, #0x1c]
	ldrb r1, [r7, #5]
	movs r0, #0xc
	orrs r1, r0
	strb r1, [r7, #5]
	ldr r2, _08153EC8
	lsrs r0, r1, #4
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r2, #0xf
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #5]
	movs r1, #0x3f
	adds r1, r1, r7
	mov r8, r1
	ldrb r0, [r1]
	movs r1, #0x40
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08153ECC
	str r0, [r7, #8]
	adds r0, r7, #0
	movs r1, #0
	bl StartSpriteAnim
	ldr r0, _08153ED0
	str r0, [r7, #0x10]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #8
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x2e]
	strh r0, [r7, #0x2e]
	ldrb r0, [r6, #8]
	strh r0, [r7, #0x30]
	strh r5, [r7, #0x3c]
	adds r0, r6, #0
	adds r1, r7, #0
	bl LoadObjectReflectionPalette
	cmp r5, #0
	bne _08153EB6
	ldrb r0, [r7, #1]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r7, #1]
_08153EB6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08153EC0: .4byte 0x020205AC
_08153EC4: .4byte 0x08153FE5
_08153EC8: .4byte 0x0846FA18
_08153ECC: .4byte 0x082BF304
_08153ED0: .4byte 0x082BF310
	thumb_func_end SetUpReflection

	thumb_func_start GetReflectionVerticalOffset
GetReflectionVerticalOffset: @ 0x08153ED4
	push {lr}
	ldrb r0, [r0, #5]
	bl GetEventObjectGraphicsInfo
	ldrh r0, [r0, #0xa]
	subs r0, #2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end GetReflectionVerticalOffset

	thumb_func_start LoadObjectReflectionPalette
LoadObjectReflectionPalette: @ 0x08153EE8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _08153F40
	mov r0, sp
	movs r2, #6
	bl memcpy
	movs r0, #0
	strh r0, [r4, #0x32]
	ldrb r0, [r5, #5]
	bl GetEventObjectGraphicsInfo
	ldrb r1, [r0, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08153F44
	ldrb r0, [r5, #0x1f]
	bl MetatileBehavior_GetBridgeType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08153F2A
	ldrb r0, [r5, #0x1e]
	bl MetatileBehavior_GetBridgeType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08153F44
_08153F2A:
	subs r0, #1
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x32]
	ldrb r1, [r4, #5]
	lsrs r1, r1, #4
	adds r0, r5, #0
	bl LoadObjectHighBridgeReflectionPalette
	b _08153F4E
	.align 2, 0
_08153F40: .4byte 0x085ACA40
_08153F44:
	ldrb r1, [r4, #5]
	lsrs r1, r1, #4
	adds r0, r5, #0
	bl LoadObjectRegularReflectionPalette
_08153F4E:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadObjectReflectionPalette

	thumb_func_start LoadObjectRegularReflectionPalette
LoadObjectRegularReflectionPalette: @ 0x08153F58
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldrb r0, [r0, #5]
	bl GetEventObjectGraphicsInfo
	adds r2, r0, #0
	ldrh r1, [r2, #4]
	ldr r0, _08153F84
	cmp r1, r0
	beq _08153FAC
	ldrb r0, [r2, #0xc]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	bne _08153F88
	ldrh r0, [r2, #2]
	adds r1, r4, #0
	bl LoadPlayerObjectReflectionPalette
	b _08153FA6
	.align 2, 0
_08153F84: .4byte 0x000011FF
_08153F88:
	cmp r1, #0xa
	bne _08153F96
	ldrh r0, [r2, #2]
	adds r1, r4, #0
	bl LoadSpecialObjectReflectionPalette
	b _08153FA6
_08153F96:
	adds r0, r4, #0
	bl GetObjectPaletteTag
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl PatchObjectPalette
_08153FA6:
	adds r0, r4, #0
	bl UpdateSpritePaletteWithWeather
_08153FAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadObjectRegularReflectionPalette

	thumb_func_start LoadObjectHighBridgeReflectionPalette
LoadObjectHighBridgeReflectionPalette: @ 0x08153FB4
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldrb r0, [r0, #5]
	bl GetEventObjectGraphicsInfo
	adds r2, r0, #0
	ldrh r1, [r2, #4]
	ldr r0, _08153FE0
	cmp r1, r0
	beq _08153FD8
	adds r0, r1, #0
	adds r1, r4, #0
	bl PatchObjectPalette
	adds r0, r4, #0
	bl UpdateSpritePaletteWithWeather
_08153FD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08153FE0: .4byte 0x000011FF
	thumb_func_end LoadObjectHighBridgeReflectionPalette

	thumb_func_start UpdateObjectReflectionSprite
UpdateObjectReflectionSprite: @ 0x08153FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0815402C
	adds r7, r0, r1
	ldrb r1, [r7, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154030
	adds r5, r0, r1
	ldr r0, [r7]
	ldr r1, _08154034
	ands r0, r1
	cmp r0, r1
	bne _0815401C
	ldrb r1, [r7, #8]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _08154038
_0815401C:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _08154150
	.align 2, 0
_0815402C: .4byte 0x02036FF0
_08154030: .4byte 0x020205AC
_08154034: .4byte 0x00020001
_08154038:
	ldr r1, _0815415C
	ldrb r0, [r5, #5]
	lsrs r0, r0, #4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #4
	ldrb r2, [r4, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	ldrb r1, [r5, #1]
	lsrs r1, r1, #6
	lsls r1, r1, #6
	ldrb r2, [r4, #1]
	movs r3, #0x3f
	adds r0, r3, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r5, #3]
	lsrs r0, r0, #6
	lsls r0, r0, #6
	ldrb r2, [r4, #3]
	adds r1, r3, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #3]
	ldrb r0, [r5, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	movs r2, #0x10
	orrs r0, r2
	lsls r0, r0, #1
	subs r2, #0x4f
	mov sb, r2
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #3]
	ldrh r1, [r5, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldrh r2, [r4, #4]
	ldr r0, _08154160
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r0, [r5, #0x18]
	str r0, [r4, #0x18]
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	adds r2, r4, #0
	adds r2, #0x42
	ands r3, r0
	ldrb r1, [r2]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	movs r0, #0x3e
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	adds r6, r4, #0
	adds r6, #0x3e
	movs r1, #4
	ands r1, r0
	ldrb r2, [r6]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ldrh r0, [r5, #0x20]
	strh r0, [r4, #0x20]
	adds r0, r7, #0
	bl GetReflectionVerticalOffset
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	ldrh r1, [r4, #0x32]
	adds r1, r1, r0
	strh r1, [r4, #0x22]
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x28
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	ldrh r0, [r5, #0x24]
	strh r0, [r4, #0x24]
	ldrh r0, [r5, #0x26]
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	mov r2, r8
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	ldrb r1, [r6]
	movs r2, #3
	rsbs r2, r2, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r6]
	ldrb r0, [r7, #3]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bge _0815412A
	movs r0, #4
	orrs r2, r0
	strb r2, [r6]
_0815412A:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08154150
	ldrb r0, [r4, #3]
	mov r2, sb
	ands r2, r0
	strb r2, [r4, #3]
	ldrb r0, [r5, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08154150
	movs r1, #2
	adds r0, r2, #0
	orrs r0, r1
	strb r0, [r4, #3]
_08154150:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815415C: .4byte 0x0846FA18
_08154160: .4byte 0xFFFFFC00
	thumb_func_end UpdateObjectReflectionSprite

	thumb_func_start CreateWarpArrowSprite
CreateWarpArrowSprite: @ 0x08154164
	push {r4, lr}
	ldr r0, _081541AC
	ldr r0, [r0, #0x20]
	movs r1, #0
	movs r2, #0
	movs r3, #0x52
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x40
	beq _081541A2
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081541B0
	adds r1, r1, r0
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r3, #4
	orrs r0, r3
	strb r0, [r1, #5]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	orrs r0, r3
	strb r0, [r1]
_081541A2:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081541AC: .4byte 0x084DDE4C
_081541B0: .4byte 0x020205AC
	thumb_func_end CreateWarpArrowSprite

	thumb_func_start SetSpriteInvisible
SetSpriteInvisible: @ 0x081541B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081541D0
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_081541D0: .4byte 0x020205AC
	thumb_func_end SetSpriteInvisible

	thumb_func_start ShowWarpArrowSprite
ShowWarpArrowSprite: @ 0x081541D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08154278
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0815421E
	movs r0, #0x2e
	ldrsh r1, [r2, r0]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0815421E
	movs r0, #0x30
	ldrsh r1, [r2, r0]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	beq _0815426A
_0815421E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl SetSpritePosToMapCoords
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08154278
	adds r2, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #8
	strh r0, [r2, #0x20]
	ldrh r0, [r4]
	adds r0, #8
	strh r0, [r2, #0x22]
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	strh r7, [r2, #0x2e]
	strh r6, [r2, #0x30]
	mov r1, r8
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl StartSpriteAnim
_0815426A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154278: .4byte 0x020205AC
	thumb_func_end ShowWarpArrowSprite

	thumb_func_start FldEff_Shadow
FldEff_Shadow: @ 0x0815427C
	push {r4, r5, lr}
	ldr r5, _08154308
	ldrb r0, [r5]
	ldrb r1, [r5, #4]
	ldrb r2, [r5, #8]
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0815430C
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #5]
	bl GetEventObjectGraphicsInfo
	adds r4, r0, #0
	ldr r2, _08154310
	ldr r1, _08154314
	ldrb r0, [r4, #0xc]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0
	movs r3, #0x94
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _08154300
	ldr r0, _08154318
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r0, [r5]
	strh r0, [r2, #0x2e]
	ldr r0, [r5, #4]
	strh r0, [r2, #0x30]
	ldr r0, [r5, #8]
	strh r0, [r2, #0x32]
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	ldr r3, _0815431C
	ldrb r0, [r4, #0xc]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r2, #0x34]
_08154300:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08154308: .4byte 0x020388A8
_0815430C: .4byte 0x02036FF0
_08154310: .4byte 0x084DDE4C
_08154314: .4byte 0x085ACA46
_08154318: .4byte 0x020205AC
_0815431C: .4byte 0x085ACA4A
	thumb_func_end FldEff_Shadow

	thumb_func_start UpdateShadowFieldEffect
UpdateShadowFieldEffect: @ 0x08154320
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r5, #0x32]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815434E
	adds r0, r5, #0
	movs r1, #3
	bl FieldEffectStop
	b _081543D4
_0815434E:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081543DC
	adds r4, r0, r1
	ldrb r0, [r4, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081543E0
	adds r1, r1, r0
	ldrb r0, [r1, #5]
	movs r2, #0xc
	ands r2, r0
	ldrb r3, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5, #5]
	ldrh r0, [r1, #0x20]
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x34]
	ldrh r1, [r1, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	ldr r0, [r4]
	ldr r1, _081543E4
	ands r0, r1
	cmp r0, r1
	bne _081543CC
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsPokeGrass
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081543CC
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081543CC
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081543CC
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsReflective
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081543CC
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsReflective
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081543D4
_081543CC:
	adds r0, r5, #0
	movs r1, #3
	bl FieldEffectStop
_081543D4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081543DC: .4byte 0x02036FF0
_081543E0: .4byte 0x020205AC
_081543E4: .4byte 0x00400001
	thumb_func_end UpdateShadowFieldEffect

	thumb_func_start FldEff_TallGrass
FldEff_TallGrass: @ 0x081543E8
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _08154480
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, #4]
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08154484
	ldr r0, [r0, #0x10]
	mov r1, sp
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _08154474
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154488
	adds r3, r0, r1
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	movs r0, #3
	ldrb r1, [r5, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r0, [r5, #8]
	strh r0, [r3, #0x2e]
	ldr r0, [r5]
	strh r0, [r3, #0x30]
	ldr r0, [r5, #4]
	strh r0, [r3, #0x32]
	ldr r0, [r5, #0x10]
	strh r0, [r3, #0x34]
	ldr r0, [r5, #0x14]
	strh r0, [r3, #0x36]
	ldr r0, [r5, #0x18]
	strh r0, [r3, #0x38]
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _08154474
	adds r0, r3, #0
	movs r1, #4
	bl SeekSpriteAnim
_08154474:
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08154480: .4byte 0x020388A8
_08154484: .4byte 0x084DDE4C
_08154488: .4byte 0x020205AC
	thumb_func_end FldEff_TallGrass

	thumb_func_start UpdateTallGrassFieldEffect
UpdateTallGrassFieldEffect: @ 0x0815448C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	lsrs r4, r0, #8
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, _08154538
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081544D8
	ldr r0, _0815453C
	ldr r2, [r0]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r0, r4
	bne _081544BE
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r0, r7
	beq _081544D8
_081544BE:
	ldr r1, [r3, #4]
	ldrh r0, [r5, #0x30]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
	ldr r1, [r3, #8]
	ldrh r0, [r5, #0x32]
	subs r0, r0, r1
	strh r0, [r5, #0x32]
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	ldrb r0, [r2, #4]
	orrs r0, r1
	strh r0, [r5, #0x38]
_081544D8:
	ldrh r0, [r5, #0x34]
	lsrs r1, r0, #8
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrh r0, [r5, #0x36]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r0, r8
	adds r1, r4, #0
	adds r2, r7, #0
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815452C
	adds r0, r6, #0
	bl MetatileBehavior_IsTallGrass
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815452C
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08154540
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08154540
_0815452C:
	adds r0, r5, #0
	movs r1, #4
	bl FieldEffectStop
	b _08154584
	.align 2, 0
_08154538: .4byte 0x02036FD4
_0815453C: .4byte 0x03005AEC
_08154540:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154590
	adds r2, r0, r1
	ldr r0, [r2, #0x10]
	ldr r1, [r5, #0x30]
	cmp r0, r1
	beq _08154560
	ldr r0, [r2, #0x14]
	cmp r0, r1
	beq _08154560
	movs r0, #1
	strh r0, [r5, #0x3c]
_08154560:
	movs r6, #0
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0815456E
	movs r6, #4
_0815456E:
	adds r0, r5, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
	ldrh r1, [r5, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r2, r6, #0
	bl sub_08156138
_08154584:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154590: .4byte 0x02036FF0
	thumb_func_end UpdateTallGrassFieldEffect

	thumb_func_start FldEff_JumpTallGrass
FldEff_JumpTallGrass: @ 0x08154594
	push {r4, lr}
	ldr r4, _081545F8
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #0xc
	bl sub_08092A50
	ldr r0, _081545FC
	ldr r0, [r0, #0x28]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _081545F0
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08154600
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r4, #8]
	strh r0, [r2, #0x2e]
	movs r0, #0xc
	strh r0, [r2, #0x30]
_081545F0:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081545F8: .4byte 0x020388A8
_081545FC: .4byte 0x084DDE4C
_08154600: .4byte 0x020205AC
	thumb_func_end FldEff_JumpTallGrass

	thumb_func_start FindTallGrassFieldEffectSpriteId
FindTallGrassFieldEffectSpriteId: @ 0x08154604
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r5, #0
	ldr r0, _08154674
	mov r8, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
_08154628:
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	mov r1, r8
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0815467C
	ldr r1, [r2, #0x1c]
	ldr r0, _08154678
	cmp r1, r0
	bne _0815467C
	movs r1, #0x30
	ldrsh r0, [r2, r1]
	cmp r3, r0
	bne _0815467C
	movs r1, #0x32
	ldrsh r0, [r2, r1]
	cmp r4, r0
	bne _0815467C
	ldrh r1, [r2, #0x34]
	lsrs r0, r1, #8
	cmp ip, r0
	bne _0815467C
	movs r0, #0xff
	ands r0, r1
	cmp r7, r0
	bne _0815467C
	movs r1, #0x36
	ldrsh r0, [r2, r1]
	cmp r6, r0
	bne _0815467C
	adds r0, r5, #0
	b _08154688
	.align 2, 0
_08154674: .4byte 0x020205AC
_08154678: .4byte 0x0815448D
_0815467C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3f
	bls _08154628
	movs r0, #0x40
_08154688:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FindTallGrassFieldEffectSpriteId

	thumb_func_start FldEff_LongGrass
FldEff_LongGrass: @ 0x08154694
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _08154730
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, #4]
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08154734
	ldr r0, [r0, #0x3c]
	mov r1, sp
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _08154724
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154738
	adds r4, r0, r1
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r5, #8]
	bl sub_08096718
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r0, [r5, #8]
	strh r0, [r4, #0x2e]
	ldr r0, [r5]
	strh r0, [r4, #0x30]
	ldr r0, [r5, #4]
	strh r0, [r4, #0x32]
	ldr r0, [r5, #0x10]
	strh r0, [r4, #0x34]
	ldr r0, [r5, #0x14]
	strh r0, [r4, #0x36]
	ldr r0, [r5, #0x18]
	strh r0, [r4, #0x38]
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _08154724
	adds r0, r4, #0
	movs r1, #6
	bl SeekSpriteAnim
_08154724:
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08154730: .4byte 0x020388A8
_08154734: .4byte 0x084DDE4C
_08154738: .4byte 0x020205AC
	thumb_func_end FldEff_LongGrass

	thumb_func_start UpdateLongGrassFieldEffect
UpdateLongGrassFieldEffect: @ 0x0815473C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	lsrs r7, r0, #8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, _081547E8
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08154788
	ldr r0, _081547EC
	ldr r2, [r0]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _0815476E
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r0, r6
	beq _08154788
_0815476E:
	ldr r1, [r3, #4]
	ldrh r0, [r5, #0x30]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
	ldr r1, [r3, #8]
	ldrh r0, [r5, #0x32]
	subs r0, r0, r1
	strh r0, [r5, #0x32]
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	ldrb r0, [r2, #4]
	orrs r0, r1
	strh r0, [r5, #0x38]
_08154788:
	ldrh r0, [r5, #0x34]
	lsrs r1, r0, #8
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r5, #0x36]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081547DC
	adds r0, r4, #0
	bl MetatileBehavior_IsLongGrass_Duplicate
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081547DC
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _081547F0
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081547F0
_081547DC:
	adds r0, r5, #0
	movs r1, #0x11
	bl FieldEffectStop
	b _08154826
	.align 2, 0
_081547E8: .4byte 0x02036FD4
_081547EC: .4byte 0x03005AEC
_081547F0:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154834
	adds r2, r0, r1
	ldr r0, [r2, #0x10]
	ldr r1, [r5, #0x30]
	cmp r0, r1
	beq _08154810
	ldr r0, [r2, #0x14]
	cmp r0, r1
	beq _08154810
	movs r0, #1
	strh r0, [r5, #0x3c]
_08154810:
	adds r0, r5, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
	ldrh r1, [r5, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	movs r2, #0
	bl sub_08156138
_08154826:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154834: .4byte 0x02036FF0
	thumb_func_end UpdateLongGrassFieldEffect

	thumb_func_start FldEff_JumpLongGrass
FldEff_JumpLongGrass: @ 0x08154838
	push {r4, lr}
	ldr r4, _0815489C
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _081548A0
	ldr r0, [r0, #0x40]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08154894
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _081548A4
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r4, #8]
	strh r0, [r2, #0x2e]
	movs r0, #0x12
	strh r0, [r2, #0x30]
_08154894:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0815489C: .4byte 0x020388A8
_081548A0: .4byte 0x084DDE4C
_081548A4: .4byte 0x020205AC
	thumb_func_end FldEff_JumpLongGrass

	thumb_func_start FldEff_ShortGrass
FldEff_ShortGrass: @ 0x081548A8
	push {r4, r5, r6, lr}
	ldr r6, _0815493C
	ldrb r0, [r6]
	ldrb r1, [r6, #4]
	ldrb r2, [r6, #8]
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08154940
	adds r5, r1, r0
	ldr r0, _08154944
	ldr r0, [r0, #0x78]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08154934
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r4, _08154948
	adds r2, r2, r4
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #5]
	movs r1, #0xc
	ands r1, r0
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r6]
	strh r0, [r2, #0x2e]
	ldr r0, [r6, #4]
	strh r0, [r2, #0x30]
	ldr r0, [r6, #8]
	strh r0, [r2, #0x32]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x20]
	strh r0, [r2, #0x34]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x22]
	strh r0, [r2, #0x36]
_08154934:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0815493C: .4byte 0x020388A8
_08154940: .4byte 0x02036FF0
_08154944: .4byte 0x084DDE4C
_08154948: .4byte 0x020205AC
	thumb_func_end FldEff_ShortGrass

	thumb_func_start UpdateShortGrassFieldEffect
UpdateShortGrassFieldEffect: @ 0x0815494C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x32]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0815498A
	ldr r5, _08154994
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r5
	ldrb r0, [r1, #2]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _08154998
_0815498A:
	adds r0, r4, #0
	movs r1, #0x29
	bl FieldEffectStop
	b _08154A2E
	.align 2, 0
_08154994: .4byte 0x02036FF0
_08154998:
	ldrb r0, [r1, #5]
	bl GetEventObjectGraphicsInfo
	mov r8, r0
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154A3C
	adds r6, r0, r1
	ldrh r5, [r6, #0x22]
	ldrh r7, [r6, #0x20]
	movs r0, #0x20
	ldrsh r1, [r6, r0]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _081549D4
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _081549EE
_081549D4:
	strh r7, [r4, #0x34]
	strh r5, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081549EE
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
_081549EE:
	strh r7, [r4, #0x20]
	strh r5, [r4, #0x22]
	mov r1, r8
	ldrh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	subs r0, #8
	strh r0, [r4, #0x26]
	adds r0, r6, #0
	adds r0, #0x43
	ldrb r0, [r0]
	subs r0, #1
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	ldrb r0, [r6, #5]
	movs r1, #0xc
	ands r1, r0
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	adds r0, r4, #0
	bl UpdateEventObjectSpriteVisibility
_08154A2E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154A3C: .4byte 0x020205AC
	thumb_func_end UpdateShortGrassFieldEffect

	thumb_func_start FldEff_SandFootprints
FldEff_SandFootprints: @ 0x08154A40
	push {r4, lr}
	ldr r4, _08154AA8
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08154AAC
	ldr r0, [r0, #0x2c]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _08154A9E
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154AB0
	adds r0, r0, r1
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
	movs r1, #3
	ldrb r2, [r4, #0xc]
	ands r2, r1
	lsls r2, r2, #2
	ldrb r3, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #5]
	movs r1, #0xd
	strh r1, [r0, #0x3c]
	ldrb r1, [r4, #0x10]
	bl StartSpriteAnim
_08154A9E:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08154AA8: .4byte 0x020388A8
_08154AAC: .4byte 0x084DDE4C
_08154AB0: .4byte 0x020205AC
	thumb_func_end FldEff_SandFootprints

	thumb_func_start FldEff_DeepSandFootprints
FldEff_DeepSandFootprints: @ 0x08154AB4
	push {r4, r5, lr}
	ldr r4, _08154B1C
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08154B20
	ldr r0, [r0, #0x5c]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r5, r1, #0
	cmp r1, #0x40
	beq _08154B14
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154B24
	adds r0, r0, r1
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
	movs r1, #3
	ldrb r2, [r4, #0xc]
	ands r2, r1
	lsls r2, r2, #2
	ldrb r3, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #5]
	movs r1, #0x18
	strh r1, [r0, #0x3c]
	ldrb r1, [r4, #0x10]
	bl StartSpriteAnim
_08154B14:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08154B1C: .4byte 0x020388A8
_08154B20: .4byte 0x084DDE4C
_08154B24: .4byte 0x020205AC
	thumb_func_end FldEff_DeepSandFootprints

	thumb_func_start FldEff_BikeTireTracks
FldEff_BikeTireTracks: @ 0x08154B28
	push {r4, r5, lr}
	ldr r4, _08154B90
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08154B94
	ldr r0, [r0, #0x6c]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r5, r1, #0
	cmp r1, #0x40
	beq _08154B88
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154B98
	adds r0, r0, r1
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
	movs r1, #3
	ldrb r2, [r4, #0xc]
	ands r2, r1
	lsls r2, r2, #2
	ldrb r3, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #5]
	movs r1, #0x23
	strh r1, [r0, #0x3c]
	ldrb r1, [r4, #0x10]
	bl StartSpriteAnim
_08154B88:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08154B90: .4byte 0x020388A8
_08154B94: .4byte 0x084DDE4C
_08154B98: .4byte 0x020205AC
	thumb_func_end FldEff_BikeTireTracks

	thumb_func_start UpdateFootprintsTireTracksFieldEffect
UpdateFootprintsTireTracksFieldEffect: @ 0x08154B9C
	push {lr}
	ldr r2, _08154BB4
	movs r3, #0x2e
	ldrsh r1, [r0, r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08154BB4: .4byte 0x085ACA54
	thumb_func_end UpdateFootprintsTireTracksFieldEffect

	thumb_func_start FadeFootprintsTireTracks_Step0
FadeFootprintsTireTracks_Step0: @ 0x08154BB8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _08154BCE
	movs r0, #1
	strh r0, [r1, #0x2e]
_08154BCE:
	adds r0, r1, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FadeFootprintsTireTracks_Step0

	thumb_func_start FadeFootprintsTireTracks_Step1
FadeFootprintsTireTracks_Step1: @ 0x08154BDC
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	ldrb r1, [r3]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	adds r0, r4, #0
	bl UpdateEventObjectSpriteVisibility
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x38
	ble _08154C20
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl FieldEffectStop
_08154C20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FadeFootprintsTireTracks_Step1

	thumb_func_start FldEff_Splash
FldEff_Splash: @ 0x08154C28
	push {r4, r5, r6, lr}
	ldr r6, _08154CBC
	ldrb r0, [r6]
	ldrb r1, [r6, #4]
	ldrb r2, [r6, #8]
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08154CC0
	adds r5, r1, r0
	ldr r0, _08154CC4
	ldr r0, [r0, #0x34]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x40
	beq _08154CB2
	ldrb r0, [r5, #5]
	bl GetEventObjectGraphicsInfo
	lsls r3, r4, #4
	adds r3, r3, r4
	lsls r3, r3, #2
	ldr r4, _08154CC8
	adds r3, r3, r4
	movs r1, #0x3e
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r2, #2
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldrb r2, [r5, #4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r1, [r1, #5]
	movs r2, #0xc
	ands r2, r1
	ldrb r4, [r3, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r4
	orrs r1, r2
	strb r1, [r3, #5]
	ldr r1, [r6]
	strh r1, [r3, #0x2e]
	ldr r1, [r6, #4]
	strh r1, [r3, #0x30]
	ldr r1, [r6, #8]
	strh r1, [r3, #0x32]
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	subs r0, #4
	strh r0, [r3, #0x26]
	movs r0, #0x46
	bl PlaySE
_08154CB2:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08154CBC: .4byte 0x020388A8
_08154CC0: .4byte 0x02036FF0
_08154CC4: .4byte 0x084DDE4C
_08154CC8: .4byte 0x020205AC
	thumb_func_end FldEff_Splash

	thumb_func_start UpdateSplashFieldEffect
UpdateSplashFieldEffect: @ 0x08154CCC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08154CFC
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x32]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08154D06
_08154CFC:
	adds r0, r4, #0
	movs r1, #0xf
	bl FieldEffectStop
	b _08154D46
_08154D06:
	ldr r3, _08154D50
	ldr r2, _08154D54
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x20]
	strh r0, [r4, #0x20]
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x22]
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
_08154D46:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08154D50: .4byte 0x020205AC
_08154D54: .4byte 0x02036FF0
	thumb_func_end UpdateSplashFieldEffect

	thumb_func_start FldEff_JumpSmallSplash
FldEff_JumpSmallSplash: @ 0x08154D58
	push {r4, lr}
	ldr r4, _08154DBC
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #0xc
	bl sub_08092A50
	ldr r0, _08154DC0
	ldr r0, [r0, #0x38]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08154DB4
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08154DC4
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r4, #8]
	strh r0, [r2, #0x2e]
	movs r0, #0x10
	strh r0, [r2, #0x30]
_08154DB4:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08154DBC: .4byte 0x020388A8
_08154DC0: .4byte 0x084DDE4C
_08154DC4: .4byte 0x020205AC
	thumb_func_end FldEff_JumpSmallSplash

	thumb_func_start FldEff_JumpBigSplash
FldEff_JumpBigSplash: @ 0x08154DC8
	push {r4, lr}
	ldr r4, _08154E2C
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08154E30
	ldr r0, [r0, #0x30]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08154E24
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08154E34
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r4, #8]
	strh r0, [r2, #0x2e]
	movs r0, #0xe
	strh r0, [r2, #0x30]
_08154E24:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08154E2C: .4byte 0x020388A8
_08154E30: .4byte 0x084DDE4C
_08154E34: .4byte 0x020205AC
	thumb_func_end FldEff_JumpBigSplash

	thumb_func_start FldEff_FeetInFlowingWater
FldEff_FeetInFlowingWater: @ 0x08154E38
	push {r4, r5, r6, r7, lr}
	ldr r7, _08154ED8
	ldrb r0, [r7]
	ldrb r1, [r7, #4]
	ldrb r2, [r7, #8]
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08154EDC
	adds r6, r1, r0
	ldr r0, _08154EE0
	ldr r0, [r0, #0x34]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x40
	beq _08154ECE
	ldrb r0, [r6, #5]
	bl GetEventObjectGraphicsInfo
	adds r4, r0, #0
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r3, _08154EE4
	adds r0, r0, r3
	ldr r1, _08154EE8
	str r1, [r0, #0x1c]
	adds r5, r0, #0
	adds r5, #0x3e
	ldrb r1, [r5]
	movs r2, #2
	orrs r1, r2
	strb r1, [r5]
	ldrb r2, [r6, #4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r1, [r1, #5]
	movs r2, #0xc
	ands r2, r1
	ldrb r3, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r1, [r7]
	strh r1, [r0, #0x2e]
	ldr r1, [r7, #4]
	strh r1, [r0, #0x30]
	ldr r1, [r7, #8]
	strh r1, [r0, #0x32]
	ldr r1, _08154EEC
	strh r1, [r0, #0x34]
	movs r1, #1
	rsbs r1, r1, #0
	strh r1, [r0, #0x36]
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	subs r1, #4
	strh r1, [r0, #0x26]
	movs r1, #1
	bl StartSpriteAnim
_08154ECE:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08154ED8: .4byte 0x020388A8
_08154EDC: .4byte 0x02036FF0
_08154EE0: .4byte 0x084DDE4C
_08154EE4: .4byte 0x020205AC
_08154EE8: .4byte 0x08154EF1
_08154EEC: .4byte 0x0000FFFF
	thumb_func_end FldEff_FeetInFlowingWater

	thumb_func_start UpdateFeetInFlowingWaterFieldEffect
UpdateFeetInFlowingWaterFieldEffect: @ 0x08154EF0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x32]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08154F2A
	ldr r2, _08154F34
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r0, r2
	ldrb r0, [r5, #2]
	lsls r0, r0, #0x1c
	cmp r0, #0
	blt _08154F38
_08154F2A:
	adds r0, r4, #0
	movs r1, #0x22
	bl FieldEffectStop
	b _08154F82
	.align 2, 0
_08154F34: .4byte 0x02036FF0
_08154F38:
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08154F8C
	adds r0, r0, r1
	ldrh r1, [r0, #0x20]
	strh r1, [r4, #0x20]
	ldrh r1, [r0, #0x22]
	strh r1, [r4, #0x22]
	adds r0, #0x43
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
	ldr r1, [r5, #0x10]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	beq _08154F82
	ldrh r0, [r5, #0x10]
	strh r0, [r4, #0x34]
	ldrh r0, [r5, #0x12]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08154F82
	movs r0, #0x46
	bl PlaySE
_08154F82:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08154F8C: .4byte 0x020205AC
	thumb_func_end UpdateFeetInFlowingWaterFieldEffect

	thumb_func_start FldEff_Ripple
FldEff_Ripple: @ 0x08154F90
	push {r4, lr}
	ldr r0, _08154FE4
	ldr r0, [r0, #0x14]
	ldr r4, _08154FE8
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08154FDC
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08154FEC
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	movs r0, #5
	strh r0, [r2, #0x2e]
_08154FDC:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08154FE4: .4byte 0x084DDE4C
_08154FE8: .4byte 0x020388A8
_08154FEC: .4byte 0x020205AC
	thumb_func_end FldEff_Ripple

	thumb_func_start FldEff_HotSpringsWater
FldEff_HotSpringsWater: @ 0x08154FF0
	push {r4, r5, r6, lr}
	ldr r6, _08155084
	ldrb r0, [r6]
	ldrb r1, [r6, #4]
	ldrb r2, [r6, #8]
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08155088
	adds r5, r1, r0
	ldr r0, _0815508C
	ldr r0, [r0, #0x7c]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0815507C
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r4, _08155090
	adds r2, r2, r4
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #5]
	movs r1, #0xc
	ands r1, r0
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r6]
	strh r0, [r2, #0x2e]
	ldr r0, [r6, #4]
	strh r0, [r2, #0x30]
	ldr r0, [r6, #8]
	strh r0, [r2, #0x32]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x20]
	strh r0, [r2, #0x34]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x22]
	strh r0, [r2, #0x36]
_0815507C:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08155084: .4byte 0x020388A8
_08155088: .4byte 0x02036FF0
_0815508C: .4byte 0x084DDE4C
_08155090: .4byte 0x020205AC
	thumb_func_end FldEff_HotSpringsWater

	thumb_func_start UpdateHotSpringsWaterFieldEffect
UpdateHotSpringsWaterFieldEffect: @ 0x08155094
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x32]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081550CE
	ldr r5, _081550D8
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r5
	ldrb r0, [r1, #2]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _081550DC
_081550CE:
	adds r0, r4, #0
	movs r1, #0x2a
	bl FieldEffectStop
	b _08155120
	.align 2, 0
_081550D8: .4byte 0x02036FF0
_081550DC:
	ldrb r0, [r1, #5]
	bl GetEventObjectGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r2, [r1, #4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _08155128
	adds r1, r1, r2
	ldrh r2, [r1, #0x20]
	strh r2, [r4, #0x20]
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	ldrh r2, [r1, #0x22]
	adds r0, r0, r2
	subs r0, #8
	strh r0, [r4, #0x22]
	adds r1, #0x43
	ldrb r0, [r1]
	subs r0, #1
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
_08155120:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08155128: .4byte 0x020205AC
	thumb_func_end UpdateHotSpringsWaterFieldEffect

	thumb_func_start FldEff_Unknown19
FldEff_Unknown19: @ 0x0815512C
	push {r4, lr}
	ldr r4, _0815518C
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08155190
	ldr r0, [r0, #0x44]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08155184
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08155194
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	movs r0, #0x13
	strh r0, [r2, #0x2e]
_08155184:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0815518C: .4byte 0x020388A8
_08155190: .4byte 0x084DDE4C
_08155194: .4byte 0x020205AC
	thumb_func_end FldEff_Unknown19

	thumb_func_start FldEff_Unknown20
FldEff_Unknown20: @ 0x08155198
	push {r4, lr}
	ldr r4, _081551F8
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _081551FC
	ldr r0, [r0, #0x48]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _081551F0
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08155200
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	movs r0, #0x14
	strh r0, [r2, #0x2e]
_081551F0:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081551F8: .4byte 0x020388A8
_081551FC: .4byte 0x084DDE4C
_08155200: .4byte 0x020205AC
	thumb_func_end FldEff_Unknown20

	thumb_func_start FldEff_Unknown21
FldEff_Unknown21: @ 0x08155204
	push {r4, lr}
	ldr r4, _08155264
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08155268
	ldr r0, [r0, #0x4c]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0815525C
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _0815526C
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	movs r0, #0x15
	strh r0, [r2, #0x2e]
_0815525C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08155264: .4byte 0x020388A8
_08155268: .4byte 0x084DDE4C
_0815526C: .4byte 0x020205AC
	thumb_func_end FldEff_Unknown21

	thumb_func_start FldEff_Unknown22
FldEff_Unknown22: @ 0x08155270
	push {r4, lr}
	ldr r4, _081552D0
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _081552D4
	ldr r0, [r0, #0x50]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _081552C8
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _081552D8
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	movs r0, #0x16
	strh r0, [r2, #0x2e]
_081552C8:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081552D0: .4byte 0x020388A8
_081552D4: .4byte 0x084DDE4C
_081552D8: .4byte 0x020205AC
	thumb_func_end FldEff_Unknown22

	thumb_func_start StartAshFieldEffect
StartAshFieldEffect: @ 0x081552DC
	push {r4, lr}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _0815530C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [r4, #4]
	movs r0, #0x52
	str r0, [r4, #8]
	movs r0, #1
	str r0, [r4, #0xc]
	str r2, [r4, #0x10]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r3, [r4, #0x14]
	movs r0, #7
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815530C: .4byte 0x020388A8
	thumb_func_end StartAshFieldEffect

	thumb_func_start FldEff_Ash
FldEff_Ash: @ 0x08155310
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _08155390
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, #4]
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08155394
	ldr r0, [r0, #0x18]
	mov r1, sp
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldrb r3, [r5, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08155386
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08155398
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r5, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r5]
	strh r0, [r2, #0x30]
	ldr r0, [r5, #4]
	strh r0, [r2, #0x32]
	ldr r0, [r5, #0x10]
	strh r0, [r2, #0x34]
	ldr r0, [r5, #0x14]
	strh r0, [r2, #0x36]
_08155386:
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08155390: .4byte 0x020388A8
_08155394: .4byte 0x084DDE4C
_08155398: .4byte 0x020205AC
	thumb_func_end FldEff_Ash

	thumb_func_start UpdateAshFieldEffect
UpdateAshFieldEffect: @ 0x0815539C
	push {lr}
	ldr r2, _081553B4
	movs r3, #0x2e
	ldrsh r1, [r0, r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_081553B4: .4byte 0x085ACA5C
	thumb_func_end UpdateAshFieldEffect

	thumb_func_start UpdateAshFieldEffect_Step0
UpdateAshFieldEffect_Step0: @ 0x081553B8
	push {lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	subs r2, #0x12
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, #0x36]
	subs r0, #1
	strh r0, [r3, #0x36]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081553E2
	movs r0, #1
	strh r0, [r3, #0x2e]
_081553E2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateAshFieldEffect_Step0

	thumb_func_start UpdateAshFieldEffect_Step1
UpdateAshFieldEffect_Step1: @ 0x081553E8
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	subs r2, #0x12
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #0x34]
	bl MapGridSetMetatileIdAt
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldr r2, _08155440
	ldr r0, _08155444
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	movs r0, #2
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08155440: .4byte 0x02036FF0
_08155444: .4byte 0x02037230
	thumb_func_end UpdateAshFieldEffect_Step1

	thumb_func_start UpdateAshFieldEffect_Step2
UpdateAshFieldEffect_Step2: @ 0x08155448
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08155468
	adds r0, r4, #0
	movs r1, #7
	bl FieldEffectStop
_08155468:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateAshFieldEffect_Step2

	thumb_func_start FldEff_SurfBlob
FldEff_SurfBlob: @ 0x08155470
	push {r4, r5, lr}
	ldr r4, _081554D8
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _081554DC
	ldr r0, [r0, #0x1c]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r3, #0x96
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	cmp r0, #0x40
	beq _081554CA
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081554E0
	adds r1, r1, r0
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r2, #2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1, #5]
	ldr r0, [r4, #8]
	strh r0, [r1, #0x32]
	ldr r0, _081554E4
	strh r0, [r1, #0x34]
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r1, #0x3a]
	strh r0, [r1, #0x3c]
_081554CA:
	movs r0, #8
	bl FieldEffectActiveListRemove
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081554D8: .4byte 0x020388A8
_081554DC: .4byte 0x084DDE4C
_081554E0: .4byte 0x020205AC
_081554E4: .4byte 0x0000FFFF
	thumb_func_end FldEff_SurfBlob

	thumb_func_start sub_081554E8
sub_081554E8: @ 0x081554E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r3, _08155510
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r0, [r2, #0x2e]
	movs r3, #0x10
	rsbs r3, r3, #0
	ands r3, r0
	movs r0, #0xf0
	lsls r0, r0, #0x14
	ands r0, r1
	lsrs r0, r0, #0x18
	orrs r0, r3
	strh r0, [r2, #0x2e]
	bx lr
	.align 2, 0
_08155510: .4byte 0x020205AC
	thumb_func_end sub_081554E8

	thumb_func_start sub_08155514
sub_08155514: @ 0x08155514
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r3, _0815553C
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r0, [r2, #0x2e]
	movs r3, #0xf1
	rsbs r3, r3, #0
	ands r3, r0
	movs r0, #0xf0
	lsls r0, r0, #0x14
	ands r0, r1
	lsrs r0, r0, #0x14
	orrs r3, r0
	strh r3, [r2, #0x2e]
	bx lr
	.align 2, 0
_0815553C: .4byte 0x020205AC
	thumb_func_end sub_08155514

	thumb_func_start sub_08155540
sub_08155540: @ 0x08155540
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r4, _0815556C
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r3, r3, r4
	ldrh r0, [r3, #0x2e]
	ldr r4, _08155570
	ands r4, r0
	movs r0, #0xf0
	lsls r0, r0, #0x14
	ands r0, r1
	lsrs r0, r0, #0x10
	orrs r4, r0
	strh r4, [r3, #0x2e]
	strh r2, [r3, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815556C: .4byte 0x020205AC
_08155570: .4byte 0xFFFFF0FF
	thumb_func_end sub_08155540

	thumb_func_start sub_08155574
sub_08155574: @ 0x08155574
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf
	ands r0, r1
	bx lr
	thumb_func_end sub_08155574

	thumb_func_start sub_0815557C
sub_0815557C: @ 0x0815557C
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf0
	ands r0, r1
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
	thumb_func_end sub_0815557C

	thumb_func_start sub_08155588
sub_08155588: @ 0x08155588
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf0
	lsls r0, r0, #4
	ands r0, r1
	lsrs r0, r0, #8
	bx lr
	thumb_func_end sub_08155588

	thumb_func_start UpdateSurfBlobFieldEffect
UpdateSurfBlobFieldEffect: @ 0x08155594
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _081555E4
	adds r4, r4, r0
	ldrb r0, [r4, #4]
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	ldr r0, _081555E8
	adds r5, r5, r0
	adds r0, r4, #0
	adds r1, r6, #0
	bl SynchroniseSurfAnim
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08155624
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CreateBobbingEffect
	ldrb r0, [r5, #5]
	movs r1, #0xc
	ands r1, r0
	ldrb r2, [r6, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081555E4: .4byte 0x02036FF0
_081555E8: .4byte 0x020205AC
	thumb_func_end UpdateSurfBlobFieldEffect

	thumb_func_start SynchroniseSurfAnim
SynchroniseSurfAnim: @ 0x081555EC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _08155620
	mov r0, sp
	movs r2, #9
	bl memcpy
	adds r0, r4, #0
	bl sub_0815557C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08155618
	ldrb r0, [r5, #0x18]
	lsrs r0, r0, #4
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartSpriteAnimIfDifferent
_08155618:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08155620: .4byte 0x085ACA68
	thumb_func_end SynchroniseSurfAnim

	thumb_func_start sub_08155624
sub_08155624: @ 0x08155624
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r1, #0
	ldrh r2, [r0, #0x10]
	mov r1, sp
	strh r2, [r1]
	ldrh r1, [r0, #0x12]
	mov r0, sp
	adds r0, #2
	strh r1, [r0]
	movs r2, #0x26
	ldrsh r3, [r4, r2]
	mov r8, r0
	cmp r3, #0
	bne _081556AC
	mov r0, sp
	movs r5, #0
	ldrsh r2, [r0, r5]
	movs r5, #0x3a
	ldrsh r0, [r4, r5]
	cmp r2, r0
	bne _08155660
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x3c
	ldrsh r1, [r4, r5]
	cmp r0, r1
	beq _081556AC
_08155660:
	strh r3, [r4, #0x38]
	strh r2, [r4, #0x3a]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	strh r0, [r4, #0x3c]
	movs r5, #1
	mov r7, r8
	mov r6, sp
_08155672:
	adds r0, r5, #0
	mov r1, sp
	adds r2, r7, #0
	bl MoveCoords
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r2, #0
	ldrsh r1, [r7, r2]
	bl MapGridGetZCoordAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _08155698
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	b _081556AC
_08155698:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r4, #0x3a]
	strh r0, [r6]
	ldrh r0, [r4, #0x3c]
	mov r1, r8
	strh r0, [r1]
	cmp r5, #4
	bls _08155672
_081556AC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08155624

	thumb_func_start CreateBobbingEffect
CreateBobbingEffect: @ 0x081556B8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r1, _0815571C
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r0, r4, #0
	bl sub_08155574
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	cmp r2, #0
	beq _08155732
	ldrh r1, [r4, #0x36]
	adds r1, #1
	strh r1, [r4, #0x36]
	movs r3, #0x38
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _081556F8
	ldrh r0, [r4, #0x34]
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
_081556F8:
	ldrh r1, [r4, #0x36]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08155708
	ldrh r0, [r4, #0x34]
	rsbs r0, r0, #0
	strh r0, [r4, #0x34]
_08155708:
	cmp r2, #2
	beq _08155732
	adds r0, r4, #0
	bl sub_08155588
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08155720
	ldrh r0, [r4, #0x26]
	b _08155726
	.align 2, 0
_0815571C: .4byte 0x085ACA72
_08155720:
	ldrh r0, [r4, #0x26]
	ldrh r3, [r4, #0x30]
	adds r0, r0, r3
_08155726:
	strh r0, [r5, #0x26]
	ldrh r0, [r5, #0x20]
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #0x22]
	adds r0, #8
	strh r0, [r4, #0x22]
_08155732:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateBobbingEffect

	thumb_func_start sub_0815573C
sub_0815573C: @ 0x0815573C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08155780
	movs r1, #0
	movs r2, #0
	movs r3, #0xff
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r1, _08155784
	adds r2, r2, r1
	ldr r1, _08155788
	str r1, [r2, #0x1c]
	movs r1, #0x3e
	adds r1, r1, r2
	mov ip, r1
	ldrb r1, [r1]
	movs r3, #4
	orrs r1, r3
	mov r3, ip
	strb r1, [r3]
	strh r4, [r2, #0x2e]
	movs r1, #1
	strh r1, [r2, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08155780: .4byte 0x082BF314
_08155784: .4byte 0x020205AC
_08155788: .4byte 0x0815578D
	thumb_func_end sub_0815573C

	thumb_func_start sub_0815578C
sub_0815578C: @ 0x0815578C
	push {lr}
	adds r2, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081557C8
	adds r3, r0, r1
	ldrh r1, [r2, #0x32]
	adds r0, r1, #1
	strh r0, [r2, #0x32]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081557B4
	ldrh r0, [r2, #0x30]
	ldrh r1, [r3, #0x26]
	adds r0, r0, r1
	strh r0, [r3, #0x26]
_081557B4:
	ldrh r1, [r2, #0x32]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _081557C4
	ldrh r0, [r2, #0x30]
	rsbs r0, r0, #0
	strh r0, [r2, #0x30]
_081557C4:
	pop {r0}
	bx r0
	.align 2, 0
_081557C8: .4byte 0x020205AC
	thumb_func_end sub_0815578C

	thumb_func_start FldEff_Dust
FldEff_Dust: @ 0x081557CC
	push {r4, lr}
	ldr r4, _08155830
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #0xc
	bl sub_08092A50
	ldr r0, _08155834
	ldr r0, [r0, #0x24]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08155828
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08155838
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, [r4, #8]
	strh r0, [r2, #0x2e]
	movs r0, #0xa
	strh r0, [r2, #0x30]
_08155828:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08155830: .4byte 0x020388A8
_08155834: .4byte 0x084DDE4C
_08155838: .4byte 0x020205AC
	thumb_func_end FldEff_Dust

	thumb_func_start FldEff_SandPile
FldEff_SandPile: @ 0x0815583C
	push {r4, r5, r6, r7, lr}
	ldr r7, _081558E8
	ldrb r0, [r7]
	ldrb r1, [r7, #4]
	ldrb r2, [r7, #8]
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081558EC
	adds r6, r1, r0
	ldr r0, _081558F0
	ldr r0, [r0, #0x74]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x40
	beq _081558E0
	ldrb r0, [r6, #5]
	bl GetEventObjectGraphicsInfo
	adds r5, r0, #0
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r4, _081558F4
	adds r0, r0, r4
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
	ldrb r2, [r6, #4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r1, [r1, #5]
	movs r2, #0xc
	ands r2, r1
	ldrb r3, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r1, [r7]
	strh r1, [r0, #0x2e]
	ldr r1, [r7, #4]
	strh r1, [r0, #0x30]
	ldr r1, [r7, #8]
	strh r1, [r0, #0x32]
	ldrb r2, [r6, #4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x20]
	strh r1, [r0, #0x34]
	ldrb r2, [r6, #4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x22]
	strh r1, [r0, #0x36]
	ldrh r1, [r5, #0xa]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	subs r1, #2
	strh r1, [r0, #0x26]
	movs r1, #2
	bl SeekSpriteAnim
_081558E0:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081558E8: .4byte 0x020388A8
_081558EC: .4byte 0x02036FF0
_081558F0: .4byte 0x084DDE4C
_081558F4: .4byte 0x020205AC
	thumb_func_end FldEff_SandPile

	thumb_func_start UpdateSandPileFieldEffect
UpdateSandPileFieldEffect: @ 0x081558F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x32]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08155932
	ldr r2, _0815593C
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1, #2]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _08155940
_08155932:
	adds r0, r4, #0
	movs r1, #0x27
	bl FieldEffectStop
	b _081559B2
	.align 2, 0
_0815593C: .4byte 0x02036FF0
_08155940:
	ldr r2, _081559BC
	ldrb r1, [r1, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r5, [r0, #0x22]
	ldrh r6, [r0, #0x20]
	movs r2, #0x20
	ldrsh r1, [r0, r2]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08155968
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _08155982
_08155968:
	strh r6, [r4, #0x34]
	strh r5, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08155982
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
_08155982:
	strh r6, [r4, #0x20]
	strh r5, [r4, #0x22]
	ldr r3, _081559BC
	ldr r2, _081559C0
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x43
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
_081559B2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081559BC: .4byte 0x020205AC
_081559C0: .4byte 0x02036FF0
	thumb_func_end UpdateSandPileFieldEffect

	thumb_func_start FldEff_Bubbles
FldEff_Bubbles: @ 0x081559C4
	push {r4, lr}
	ldr r4, _08155A1C
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #0
	bl sub_08092A50
	ldr r0, _08155A20
	adds r0, #0x88
	ldr r0, [r0]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r3, #0x52
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08155A14
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08155A24
	adds r1, r1, r0
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r2, #2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	strb r0, [r1, #5]
_08155A14:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08155A1C: .4byte 0x020388A8
_08155A20: .4byte 0x084DDE4C
_08155A24: .4byte 0x020205AC
	thumb_func_end FldEff_Bubbles

	thumb_func_start UpdateBubblesFieldEffect
UpdateBubblesFieldEffect: @ 0x08155A28
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #0x80
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x22]
	subs r1, r1, r0
	strh r1, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
	ldrh r1, [r4, #0x3e]
	ldr r0, _08155A64
	ands r0, r1
	cmp r0, #0
	beq _08155A5C
	adds r0, r4, #0
	movs r1, #0x35
	bl FieldEffectStop
_08155A5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08155A64: .4byte 0x00001004
	thumb_func_end UpdateBubblesFieldEffect

	thumb_func_start FldEff_BerryTreeGrowthSparkle
FldEff_BerryTreeGrowthSparkle: @ 0x08155A68
	push {r4, lr}
	ldr r4, _08155AD0
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #4
	bl sub_08092A50
	ldr r0, _08155AD4
	ldr r0, [r0, #0x58]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08155AC8
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08155AD8
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	movs r1, #0xf
	ands r0, r1
	movs r1, #0x50
	orrs r0, r1
	strb r0, [r2, #5]
	movs r0, #0x17
	strh r0, [r2, #0x2e]
_08155AC8:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08155AD0: .4byte 0x020388A8
_08155AD4: .4byte 0x084DDE4C
_08155AD8: .4byte 0x020205AC
	thumb_func_end FldEff_BerryTreeGrowthSparkle

	thumb_func_start ShowTreeDisguiseFieldEffect
ShowTreeDisguiseFieldEffect: @ 0x08155ADC
	push {lr}
	movs r0, #0x1c
	movs r1, #0x18
	movs r2, #4
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end ShowTreeDisguiseFieldEffect

	thumb_func_start ShowMountainDisguiseFieldEffect
ShowMountainDisguiseFieldEffect: @ 0x08155AEC
	push {lr}
	movs r0, #0x1d
	movs r1, #0x19
	movs r2, #3
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end ShowMountainDisguiseFieldEffect

	thumb_func_start ShowSandDisguiseFieldEffect
ShowSandDisguiseFieldEffect: @ 0x08155AFC
	push {lr}
	movs r0, #0x24
	movs r1, #0x1c
	movs r2, #2
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end ShowSandDisguiseFieldEffect

	thumb_func_start ShowDisguiseFieldEffect
ShowDisguiseFieldEffect: @ 0x08155B0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r5, _08155B40
	ldrb r0, [r5]
	ldrb r1, [r5, #4]
	ldrb r2, [r5, #8]
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08155B44
	adds r0, r4, #0
	bl FieldEffectActiveListRemove
	movs r0, #0x40
	b _08155BB0
	.align 2, 0
_08155B40: .4byte 0x020388A8
_08155B44:
	ldr r1, _08155BBC
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSpriteAtEnd
	mov r1, sp
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08155BAC
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08155BC0
	adds r2, r2, r0
	movs r0, #0x3e
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1f
	adds r1, #1
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	lsls r3, r7, #4
	ldrb r1, [r2, #5]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #5]
	mov r0, r8
	strh r0, [r2, #0x30]
	ldr r0, [r5]
	strh r0, [r2, #0x32]
	ldr r0, [r5, #4]
	strh r0, [r2, #0x34]
	ldr r0, [r5, #8]
	strh r0, [r2, #0x36]
_08155BAC:
	mov r0, sp
	ldrb r0, [r0]
_08155BB0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08155BBC: .4byte 0x084DDE4C
_08155BC0: .4byte 0x020205AC
	thumb_func_end ShowDisguiseFieldEffect

	thumb_func_start UpdateDisguiseFieldEffect
UpdateDisguiseFieldEffect: @ 0x08155BC4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x34]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r5, #0x36]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08155BF4
	ldrh r1, [r5, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl FieldEffectStop
_08155BF4:
	ldr r4, _08155CAC
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #5]
	bl GetEventObjectGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r1, [r1, #4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	ldr r1, _08155CB0
	adds r2, r2, r1
	adds r1, r2, #0
	adds r1, #0x3e
	ldrb r1, [r1]
	movs r3, #0x3e
	adds r3, r3, r5
	mov ip, r3
	movs r3, #4
	ands r3, r1
	mov r1, ip
	ldrb r4, [r1]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r4
	orrs r1, r3
	mov r3, ip
	strb r1, [r3]
	ldrh r1, [r2, #0x20]
	strh r1, [r5, #0x20]
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	ldrh r1, [r2, #0x22]
	adds r0, r0, r1
	subs r0, #0x10
	strh r0, [r5, #0x22]
	adds r2, #0x43
	ldrb r0, [r2]
	subs r0, #1
	adds r1, r5, #0
	adds r1, #0x43
	strb r0, [r1]
	ldrh r1, [r5, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #1
	bne _08155C74
	adds r0, r1, #1
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
_08155C74:
	movs r3, #0x2e
	ldrsh r0, [r5, r3]
	ldrh r2, [r5, #0x2e]
	cmp r0, #2
	bne _08155C90
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08155C90
	movs r0, #1
	strh r0, [r5, #0x3c]
_08155C90:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _08155CA4
	ldrh r1, [r5, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl FieldEffectStop
_08155CA4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08155CAC: .4byte 0x02036FF0
_08155CB0: .4byte 0x020205AC
	thumb_func_end UpdateDisguiseFieldEffect

	thumb_func_start sub_08155CB4
sub_08155CB4: @ 0x08155CB4
	push {lr}
	adds r1, r0, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _08155CD2
	ldr r2, _08155CD8
	ldrb r1, [r1, #0x1a]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x2e]
	adds r1, #1
	strh r1, [r0, #0x2e]
_08155CD2:
	pop {r0}
	bx r0
	.align 2, 0
_08155CD8: .4byte 0x020205AC
	thumb_func_end sub_08155CB4

	thumb_func_start sub_08155CDC
sub_08155CDC: @ 0x08155CDC
	push {lr}
	adds r2, r0, #0
	adds r2, #0x21
	ldrb r1, [r2]
	cmp r1, #2
	beq _08155D12
	cmp r1, #0
	beq _08155D12
	ldrb r1, [r0, #0x1a]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08155D04
	adds r1, r0, r1
	movs r3, #0x3c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08155D08
	movs r0, #0
	b _08155D14
	.align 2, 0
_08155D04: .4byte 0x020205AC
_08155D08:
	movs r0, #2
	strb r0, [r2]
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
_08155D12:
	movs r0, #1
_08155D14:
	pop {r1}
	bx r1
	thumb_func_end sub_08155CDC

	thumb_func_start FldEff_Sparkle
FldEff_Sparkle: @ 0x08155D18
	push {r4, lr}
	ldr r4, _08155D80
	ldr r0, [r4]
	adds r0, #7
	str r0, [r4]
	ldr r0, [r4, #4]
	adds r0, #7
	str r0, [r4, #4]
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _08155D84
	adds r0, #0x8c
	ldr r0, [r0]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r3, #0x52
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _08155D78
	ldr r0, _08155D88
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #3
	ldrb r2, [r4, #8]
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
_08155D78:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08155D80: .4byte 0x020388A8
_08155D84: .4byte 0x084DDE4C
_08155D88: .4byte 0x020205AC
	thumb_func_end FldEff_Sparkle

	thumb_func_start UpdateSparkleFieldEffect
UpdateSparkleFieldEffect: @ 0x08155D8C
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _08155DC0
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08155DB8
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
_08155DB8:
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _08155DD6
_08155DC0:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x22
	ble _08155DD6
	adds r0, r2, #0
	movs r1, #0x36
	bl FieldEffectStop
_08155DD6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateSparkleFieldEffect

	thumb_func_start sub_08155DDC
sub_08155DDC: @ 0x08155DDC
	movs r1, #0
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x3c]
	bx lr
	thumb_func_end sub_08155DDC

	thumb_func_start sub_08155DE4
sub_08155DE4: @ 0x08155DE4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _08155E1A
	cmp r0, #1
	bgt _08155DFC
	cmp r0, #0
	beq _08155E06
	b _08155E7E
_08155DFC:
	cmp r0, #2
	beq _08155E42
	cmp r0, #3
	beq _08155E56
	b _08155E7E
_08155E06:
	movs r2, #0x3a
	ldrsh r0, [r5, r2]
	bl sub_080970AC
	ldrh r1, [r5, #0x24]
	adds r0, r0, r1
	strh r0, [r5, #0x24]
	movs r2, #0x3a
	ldrsh r0, [r5, r2]
	b _08155E74
_08155E1A:
	ldrh r0, [r5, #0x3a]
	movs r4, #0x47
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_080970AC
	ldrh r1, [r5, #0x24]
	subs r1, r1, r0
	strh r1, [r5, #0x24]
	ldrh r0, [r5, #0x3a]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl sub_08097098
	ldrh r2, [r5, #0x26]
	adds r0, r0, r2
	b _08155E7C
_08155E42:
	movs r1, #0x3a
	ldrsh r0, [r5, r1]
	bl sub_080970AC
	ldrh r1, [r5, #0x24]
	subs r1, r1, r0
	strh r1, [r5, #0x24]
	movs r2, #0x3a
	ldrsh r0, [r5, r2]
	b _08155E74
_08155E56:
	ldrh r0, [r5, #0x3a]
	movs r4, #0x47
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_080970AC
	ldrh r2, [r5, #0x24]
	adds r0, r0, r2
	strh r0, [r5, #0x24]
	ldrh r0, [r5, #0x3a]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
_08155E74:
	bl sub_08097098
	ldrh r1, [r5, #0x26]
	adds r0, r0, r1
_08155E7C:
	strh r0, [r5, #0x26]
_08155E7E:
	ldrh r1, [r5, #0x24]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x10
	bl SetGpuReg
	ldrh r0, [r5, #0x3a]
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x48
	bne _08155EA4
	strh r1, [r5, #0x3a]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
_08155EA4:
	movs r2, #0x3c
	ldrsh r0, [r5, r2]
	cmp r0, #4
	bne _08155EB2
	strh r1, [r5, #0x26]
	strh r1, [r5, #0x24]
	movs r6, #1
_08155EB2:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08155DE4

	thumb_func_start sub_08155EBC
sub_08155EBC: @ 0x08155EBC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #8
	bls _08155ECA
	b _08156092
_08155ECA:
	lsls r0, r0, #2
	ldr r1, _08155ED4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08155ED4: .4byte 0x08155ED8
_08155ED8: @ jump table
	.4byte _08155EFC @ case 0
	.4byte _08155F70 @ case 1
	.4byte _08155FA8 @ case 2
	.4byte _08155FCC @ case 3
	.4byte _08155FFC @ case 4
	.4byte _08156010 @ case 5
	.4byte _0815601C @ case 6
	.4byte _0815604A @ case 7
	.4byte _0815605C @ case 8
_08155EFC:
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r1, #3
	bl __divsi3
	movs r1, #0x78
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x12
	bl SetGpuReg
	movs r3, #0x2e
	ldrsh r0, [r5, r3]
	cmp r0, #0x60
	bne _08155F52
	movs r1, #0
	ldr r4, _08155F64
	mov ip, r4
	ldr r0, _08155F68
	adds r7, r0, #0
_08155F26:
	movs r2, #0xc
	lsls r0, r1, #1
	adds r3, r1, #1
	lsls r6, r1, #5
	adds r0, r0, r1
	lsls r4, r0, #1
_08155F32:
	adds r0, r6, r2
	lsls r0, r0, #1
	add r0, ip
	adds r1, r2, r7
	adds r1, r4, r1
	adds r1, #1
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x11
	bls _08155F32
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	bls _08155F26
_08155F52:
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r0, _08155F6C
	cmp r1, r0
	bgt _08155F5E
	b _08156092
_08155F5E:
	movs r1, #0
	movs r0, #1
	b _08156056
	.align 2, 0
_08155F64: .4byte 0x0600F800
_08155F68: .4byte 0x0000BFF4
_08155F6C: .4byte 0x00000137
_08155F70:
	ldr r4, _08155FA4
	movs r3, #0x2e
	ldrsh r0, [r5, r3]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	ldrh r4, [r5, #0x36]
	adds r0, r0, r4
	movs r1, #0
	strh r0, [r5, #0x22]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0xbd
	bne _08156092
	movs r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x38]
	strh r1, [r5, #0x2e]
	b _08156092
	.align 2, 0
_08155FA4: .4byte 0x082FA8CC
_08155FA8:
	movs r3, #0x2e
	ldrsh r0, [r5, r3]
	cmp r0, #0x3c
	bne _08155FBA
	ldrh r0, [r5, #0x38]
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #0x38]
	strh r1, [r5, #0x2e]
_08155FBA:
	movs r4, #0x38
	ldrsh r0, [r5, r4]
	cmp r0, #7
	bne _08156092
	movs r0, #0
	strh r0, [r5, #0x38]
	movs r0, #3
	strh r0, [r5, #0x32]
	b _08156092
_08155FCC:
	ldrh r2, [r5, #0x26]
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	adds r3, r2, #0
	cmp r1, #0
	bne _08155FE0
	strh r1, [r5, #0x2e]
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
_08155FE0:
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	cmp r0, #5
	bne _08156092
	movs r0, #0
	strh r0, [r5, #0x2e]
	cmp r1, #0
	ble _08155FF6
	subs r0, r3, #1
	strh r0, [r5, #0x26]
	b _08156092
_08155FF6:
	adds r0, r2, #1
	strh r0, [r5, #0x26]
	b _08156092
_08155FFC:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0x3c
	bne _08156092
	movs r1, #0
	movs r0, #5
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x2e]
	strh r1, [r5, #0x38]
	b _08156092
_08156010:
	adds r0, r5, #0
	bl sub_08155DDC
	movs r1, #0
	movs r0, #6
	b _08156056
_0815601C:
	adds r0, r5, #0
	bl sub_08155DE4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08156092
	movs r1, #0
	strh r1, [r5, #0x2e]
	ldrh r0, [r5, #0x38]
	adds r0, #1
	strh r0, [r5, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bgt _08156042
	adds r0, r5, #0
	bl sub_08155DDC
	b _08156092
_08156042:
	strh r1, [r5, #0x38]
	movs r0, #7
	strh r0, [r5, #0x32]
	b _08156092
_0815604A:
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0x1e
	bne _08156092
	movs r1, #0
	movs r0, #8
_08156056:
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x2e]
	b _08156092
_0815605C:
	movs r1, #0
	ldr r6, _081560CC
	movs r4, #0
_08156062:
	movs r2, #0xc
	adds r3, r1, #1
	lsls r1, r1, #5
_08156068:
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x11
	bls _08156068
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xe
	bls _08156062
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	movs r1, #0x40
	bl FieldEffectStop
_08156092:
	movs r3, #0x32
	ldrsh r0, [r5, r3]
	cmp r0, #1
	bne _081560C0
	ldrh r1, [r5, #0x30]
	movs r0, #7
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	bne _081560AE
	ldrh r0, [r5, #0x34]
	ldrh r4, [r5, #0x26]
	adds r0, r0, r4
	strh r0, [r5, #0x26]
_081560AE:
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _081560BC
	ldrh r0, [r5, #0x34]
	rsbs r0, r0, #0
	strh r0, [r5, #0x34]
_081560BC:
	adds r0, r1, #1
	strh r0, [r5, #0x30]
_081560C0:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081560CC: .4byte 0x0600F800
	thumb_func_end sub_08155EBC

	thumb_func_start sub_081560D0
sub_081560D0: @ 0x081560D0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081560EE
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl FieldEffectStop
	b _08156104
_081560EE:
	adds r0, r4, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	movs r2, #0
	bl SetObjectSubpriorityByZCoord
_08156104:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081560D0

	thumb_func_start WaitFieldEffectSpriteAnim
WaitFieldEffectSpriteAnim: @ 0x0815610C
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0815612A
	ldrh r1, [r2, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl FieldEffectStop
	b _08156132
_0815612A:
	adds r0, r2, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
_08156132:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WaitFieldEffectSpriteAnim

	thumb_func_start sub_08156138
sub_08156138: @ 0x08156138
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r1, r6, #0
	bl SetObjectSubpriorityByZCoord
	movs r7, #0
_0815614E:
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _081561E8
	adds r4, r0, r1
	ldrb r0, [r4]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _081561F0
	ldrb r0, [r4, #5]
	bl GetEventObjectGraphicsInfo
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081561EC
	adds r5, r0, r1
	adds r0, r6, #0
	adds r0, #0x28
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldrh r0, [r6, #0x20]
	adds r1, r0, r2
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x20
	ldrsh r2, [r5, r0]
	cmp r1, r2
	bge _081561F0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	ble _081561F0
	adds r0, r5, #0
	adds r0, #0x29
	movs r3, #0
	ldrsb r3, [r0, r3]
	ldrh r2, [r5, #0x22]
	adds r2, r2, r3
	ldrh r4, [r5, #0x22]
	adds r0, r6, #0
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r6, #0x22]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r3, r0, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	cmp r2, r3
	blt _081561C8
	cmp r2, r0
	bge _081561F0
_081561C8:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	ble _081561F0
	adds r2, r6, #0
	adds r2, #0x43
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r1, [r0]
	ldrb r0, [r2]
	cmp r0, r1
	bhi _081561F0
	adds r0, r1, #2
	strb r0, [r2]
	b _081561FA
	.align 2, 0
_081561E8: .4byte 0x02036FF0
_081561EC: .4byte 0x020205AC
_081561F0:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bls _0815614E
_081561FA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08156138

