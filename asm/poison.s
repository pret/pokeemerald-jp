.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0810E3FC
sub_0810E3FC: @ 0x0810E3FC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0810E450
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810E412
	adds r0, r5, #0
	movs r1, #2
	bl StartSpriteAnim
_0810E412:
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldrh r0, [r4, #4]
	strh r0, [r5, #0x2e]
	ldr r4, _0810E454
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x36]
	ldr r0, _0810E458
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	bl InitAnimArcTranslation
	ldr r0, _0810E45C
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E450: .4byte 0x020380BE
_0810E454: .4byte 0x020380D7
_0810E458: .4byte 0x0000FFE2
_0810E45C: .4byte 0x0810E461
	thumb_func_end sub_0810E3FC

	thumb_func_start sub_0810E460
sub_0810E460: @ 0x0810E460
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E474
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810E474:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810E460

	thumb_func_start sub_0810E47C
sub_0810E47C: @ 0x0810E47C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _0810E4F0
	movs r1, #6
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0810E494
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
_0810E494:
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _0810E4F4
	ldrb r0, [r0]
	mov r6, sp
	adds r6, #2
	movs r1, #1
	mov r2, sp
	adds r3, r6, #0
	bl SetAverageBattlerPositions
	ldr r0, _0810E4F8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E4C2
	ldrh r0, [r5, #8]
	rsbs r0, r0, #0
	strh r0, [r5, #8]
_0810E4C2:
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x2e]
	mov r1, sp
	ldrh r0, [r5, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldrh r0, [r5, #0xa]
	ldrh r6, [r6]
	adds r0, r0, r6
	strh r0, [r4, #0x36]
	ldr r0, _0810E4FC
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldr r0, _0810E500
	str r0, [r4, #0x1c]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E4F0: .4byte 0x020380BE
_0810E4F4: .4byte 0x020380D7
_0810E4F8: .4byte 0x020380D6
_0810E4FC: .4byte 0x0000FFE2
_0810E500: .4byte 0x0810E505
	thumb_func_end sub_0810E47C

	thumb_func_start sub_0810E504
sub_0810E504: @ 0x0810E504
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E518
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810E518:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810E504

	thumb_func_start sub_0810E520
sub_0810E520: @ 0x0810E520
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0810E56C
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl InitSpriteDataForLinearTranslation
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r2, #4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, #0x38]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r2, #4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, #0x3a]
	ldr r0, _0810E570
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E56C: .4byte 0x020380BE
_0810E570: .4byte 0x0810E575
	thumb_func_end sub_0810E520

	thumb_func_start sub_0810E574
sub_0810E574: @ 0x0810E574
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateSpriteLinearFixedPoint
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x38]
	subs r0, r0, r1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x32]
	ldrh r1, [r4, #0x3a]
	subs r0, r0, r1
	strh r0, [r4, #0x32]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810E59A
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810E59A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810E574

	thumb_func_start sub_0810E5A0
sub_0810E5A0: @ 0x0810E5A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0810E600
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #1
	bl SetAverageBattlerPositions
	ldr r0, _0810E604
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E5CC
	ldr r1, _0810E608
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r1]
_0810E5CC:
	ldr r0, _0810E608
	ldrh r2, [r0]
	ldrh r1, [r4, #0x20]
	adds r2, r2, r1
	strh r2, [r4, #0x20]
	ldrh r1, [r0, #2]
	ldrh r3, [r4, #0x22]
	adds r1, r1, r3
	strh r1, [r4, #0x22]
	ldrh r3, [r0, #8]
	strh r3, [r4, #0x2e]
	ldrh r0, [r0, #4]
	adds r2, r2, r0
	strh r2, [r4, #0x32]
	adds r1, r1, r3
	strh r1, [r4, #0x36]
	ldr r0, _0810E60C
	str r0, [r4, #0x1c]
	ldr r1, _0810E610
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E600: .4byte 0x020380D7
_0810E604: .4byte 0x020380D6
_0810E608: .4byte 0x020380BE
_0810E60C: .4byte 0x080A67B5
_0810E610: .4byte 0x080A34C5
	thumb_func_end sub_0810E5A0

	thumb_func_start AnimBubbleEffect
AnimBubbleEffect: @ 0x0810E614
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0810E62C
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0810E630
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	b _0810E666
	.align 2, 0
_0810E62C: .4byte 0x020380BE
_0810E630:
	ldr r0, _0810E670
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #1
	bl SetAverageBattlerPositions
	ldr r0, _0810E674
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E656
	ldrh r0, [r5]
	rsbs r0, r0, #0
	strh r0, [r5]
_0810E656:
	ldrh r0, [r5]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
_0810E666:
	ldr r0, _0810E678
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E670: .4byte 0x020380D7
_0810E674: .4byte 0x020380D6
_0810E678: .4byte 0x0810E67D
	thumb_func_end AnimBubbleEffect

	thumb_func_start AnimBubbleEffectStep
AnimBubbleEffectStep: @ 0x0810E67C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #0xb
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #4
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x30]
	adds r0, #0x30
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0810E6B8
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810E6B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimBubbleEffectStep

