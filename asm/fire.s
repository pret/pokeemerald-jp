.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08109718
sub_08109718: @ 0x08109718
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0810974C
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	movs r0, #0x3c
	strh r0, [r4, #0x30]
	movs r0, #9
	strh r0, [r4, #0x32]
	movs r0, #0x1e
	strh r0, [r4, #0x34]
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r4, #0x36]
	ldr r1, _08109750
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r1, _08109754
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810974C: .4byte 0x020380BE
_08109750: .4byte 0x080A34C5
_08109754: .4byte 0x080A5C15
	thumb_func_end sub_08109718

	thumb_func_start sub_08109758
sub_08109758: @ 0x08109758
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08109790
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	bl SetAnimSpriteInitialXOffset
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x30]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x32]
	ldr r0, _08109794
	str r0, [r4, #0x1c]
	ldr r1, _08109798
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08109790: .4byte 0x020380BE
_08109794: .4byte 0x080A5E35
_08109798: .4byte 0x080A34C5
	thumb_func_end sub_08109758

	thumb_func_start sub_0810979C
sub_0810979C: @ 0x0810979C
	push {r4, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r0, _081097D0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081097D8
	ldr r2, _081097D4
	ldrh r0, [r4, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r2, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrh r0, [r2, #8]
	rsbs r0, r0, #0
	strh r0, [r4, #0x32]
	adds r1, r2, #0
	b _081097EE
	.align 2, 0
_081097D0: .4byte 0x020380D6
_081097D4: .4byte 0x020380BE
_081097D8:
	ldr r1, _08109804
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x32]
_081097EE:
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x36]
	ldrh r0, [r1, #0xa]
	strh r0, [r4, #0x34]
	ldr r0, _08109808
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109804: .4byte 0x020380BE
_08109808: .4byte 0x08109879
	thumb_func_end sub_0810979C

	thumb_func_start sub_0810980C
sub_0810980C: @ 0x0810980C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08109838
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08109840
	ldr r2, _0810983C
	ldrh r0, [r4, #0x20]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r2, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrh r0, [r2, #8]
	strh r0, [r4, #0x32]
	adds r1, r2, #0
	b _08109858
	.align 2, 0
_08109838: .4byte 0x020380D6
_0810983C: .4byte 0x020380BE
_08109840:
	ldr r1, _08109870
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	ldrh r0, [r1, #8]
	rsbs r0, r0, #0
	strh r0, [r4, #0x32]
_08109858:
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x36]
	ldrh r0, [r1, #0xa]
	strh r0, [r4, #0x34]
	ldr r0, _08109874
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109870: .4byte 0x020380BE
_08109874: .4byte 0x08109879
	thumb_func_end sub_0810980C

	thumb_func_start sub_08109878
sub_08109878: @ 0x08109878
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _0810989E
	ldrh r0, [r2, #0x32]
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x34]
	ldrh r3, [r2, #0x26]
	adds r0, r0, r3
	strh r0, [r2, #0x26]
_0810989E:
	movs r0, #0x2e
	ldrsh r1, [r2, r0]
	movs r3, #0x30
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _081098B0
	adds r0, r2, #0
	bl DestroySpriteAndMatrix
_081098B0:
	pop {r0}
	bx r0
	thumb_func_end sub_08109878

	thumb_func_start sub_081098B4
sub_081098B4: @ 0x081098B4
	push {r4, lr}
	adds r4, r0, #0
	bl SetSpriteCoordsToAnimAttackerCoords
	ldr r0, _081098D8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081098E0
	ldr r0, _081098DC
	ldrh r1, [r4, #0x20]
	ldrh r2, [r0]
	subs r1, r1, r2
	strh r1, [r4, #0x20]
	b _081098F2
	.align 2, 0
_081098D8: .4byte 0x020380D6
_081098DC: .4byte 0x020380BE
_081098E0:
	ldr r0, _08109920
	ldrh r1, [r0]
	ldrh r2, [r4, #0x20]
	adds r1, r1, r2
	strh r1, [r4, #0x20]
	adds r2, r4, #0
	adds r2, #0x43
	movs r1, #8
	strb r1, [r2]
_081098F2:
	adds r2, r0, #0
	ldrh r0, [r2, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x22]
	ldrh r0, [r2, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r2, #6]
	strh r0, [r4, #0x30]
	ldrh r0, [r2, #8]
	strh r0, [r4, #0x32]
	ldrh r0, [r2, #0xa]
	strh r0, [r4, #0x34]
	ldrh r0, [r2, #0xc]
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
	ldr r0, _08109924
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109920: .4byte 0x020380BE
_08109924: .4byte 0x08109929
	thumb_func_end sub_081098B4

	thumb_func_start sub_08109928
sub_08109928: @ 0x08109928
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081099B0
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	ldr r0, _08109994
	cmp r1, r0
	ble _08109946
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #1
	strb r0, [r1]
_08109946:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r2, [r4, #0x30]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r2, [r4, #0x30]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x2e]
	adds r1, r0, r2
	strh r1, [r4, #0x2e]
	ldrh r0, [r4, #0x36]
	ldrh r2, [r4, #0x38]
	adds r0, r0, r2
	strh r0, [r4, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0810999C
	ldr r2, _08109998
	b _081099A4
	.align 2, 0
_08109994: .4byte 0x00002710
_08109998: .4byte 0xFFFFFF00
_0810999C:
	cmp r0, #0
	bge _081099A8
	movs r2, #0x80
	lsls r2, r2, #1
_081099A4:
	adds r0, r1, r2
	strh r0, [r4, #0x2e]
_081099A8:
	ldrh r0, [r4, #0x34]
	subs r0, #1
	strh r0, [r4, #0x34]
	b _081099B6
_081099B0:
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_081099B6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08109928

	thumb_func_start sub_081099BC
sub_081099BC: @ 0x081099BC
	push {lr}
	movs r1, #0
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	movs r1, #0x3c
	strh r1, [r0, #0x2e]
	movs r1, #0x8c
	strh r1, [r0, #0x32]
	movs r1, #0x50
	strh r1, [r0, #0x36]
	ldr r1, _081099E0
	str r1, [r0, #0x1c]
	ldr r1, _081099E4
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_081099E0: .4byte 0x080A67B5
_081099E4: .4byte 0x080A34C5
	thumb_func_end sub_081099BC

	thumb_func_start AnimEmberFlare
AnimEmberFlare: @ 0x081099E8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08109A40
	ldrb r0, [r5]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r0, _08109A44
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _08109A2E
	movs r0, #2
	bl GetBattlerAtPosition
	ldrb r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _08109A26
	movs r0, #3
	bl GetBattlerAtPosition
	ldrb r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _08109A2E
_08109A26:
	ldr r1, _08109A48
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_08109A2E:
	ldr r1, _08109A4C
	str r1, [r6, #0x1c]
	adds r0, r6, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109A40: .4byte 0x020380D6
_08109A44: .4byte 0x020380D7
_08109A48: .4byte 0x020380BE
_08109A4C: .4byte 0x080A7201
	thumb_func_end AnimEmberFlare

	thumb_func_start sub_08109A50
sub_08109A50: @ 0x08109A50
	ldr r2, _08109A64
	ldrh r1, [r2]
	rsbs r1, r1, #0
	strh r1, [r2]
	ldrh r1, [r2, #4]
	rsbs r1, r1, #0
	strh r1, [r2, #4]
	ldr r1, _08109A68
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_08109A64: .4byte 0x020380BE
_08109A68: .4byte 0x080A7201
	thumb_func_end sub_08109A50

	thumb_func_start AnimFireRing
AnimFireRing: @ 0x08109A6C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _08109A8C
	ldrh r0, [r0, #4]
	movs r1, #0
	strh r0, [r4, #0x3c]
	strh r1, [r4, #0x2e]
	ldr r0, _08109A90
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109A8C: .4byte 0x020380BE
_08109A90: .4byte 0x08109A95
	thumb_func_end AnimFireRing

	thumb_func_start AnimFireRingStep1
AnimFireRingStep1: @ 0x08109A94
	push {r4, r5, lr}
	adds r5, r0, #0
	bl UpdateFireRingCircleOffset
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x12
	bne _08109ADE
	movs r0, #0x19
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	ldr r4, _08109AE4
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl InitAnimLinearTranslation
	ldr r0, _08109AE8
	str r0, [r5, #0x1c]
_08109ADE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08109AE4: .4byte 0x020380D7
_08109AE8: .4byte 0x08109AED
	thumb_func_end AnimFireRingStep1

	thumb_func_start AnimFireRingStep2
AnimFireRingStep2: @ 0x08109AEC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08109B34
	movs r4, #0
	strh r4, [r6, #0x2e]
	ldr r5, _08109B2C
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x20]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x22]
	strh r4, [r6, #0x26]
	strh r4, [r6, #0x24]
	ldr r1, _08109B30
	str r1, [r6, #0x1c]
	adds r0, r6, #0
	bl _call_via_r1
	b _08109B5E
	.align 2, 0
_08109B2C: .4byte 0x020380D7
_08109B30: .4byte 0x08109B65
_08109B34:
	movs r1, #0x3c
	ldrsh r0, [r6, r1]
	movs r1, #0x1c
	bl Sin
	ldrh r1, [r6, #0x24]
	adds r0, r0, r1
	strh r0, [r6, #0x24]
	movs r1, #0x3c
	ldrsh r0, [r6, r1]
	movs r1, #0x1c
	bl Cos
	ldrh r1, [r6, #0x26]
	adds r0, r0, r1
	strh r0, [r6, #0x26]
	ldrh r0, [r6, #0x3c]
	adds r0, #0x14
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6, #0x3c]
_08109B5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AnimFireRingStep2

	thumb_func_start AnimFireRingStep3
AnimFireRingStep3: @ 0x08109B64
	push {r4, lr}
	adds r4, r0, #0
	bl UpdateFireRingCircleOffset
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _08109B80
	adds r0, r4, #0
	bl DestroyAnimSprite
_08109B80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimFireRingStep3

	thumb_func_start UpdateFireRingCircleOffset
UpdateFireRingCircleOffset: @ 0x08109B88
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #0x1c
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #0x1c
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3c]
	adds r0, #0x14
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end UpdateFireRingCircleOffset

	thumb_func_start AnimFireCross
AnimFireCross: @ 0x08109BB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08109BE8
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x32]
	ldr r1, _08109BEC
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08109BF0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109BE8: .4byte 0x020380BE
_08109BEC: .4byte 0x080A34C5
_08109BF0: .4byte 0x080A5E05
	thumb_func_end AnimFireCross

	thumb_func_start sub_08109BF4
sub_08109BF4: @ 0x08109BF4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r1, _08109C28
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x2e]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08109C2C
	str r0, [r4, #0x1c]
	ldr r1, _08109C30
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109C28: .4byte 0x020380BE
_08109C2C: .4byte 0x080A5D79
_08109C30: .4byte 0x08109C35
	thumb_func_end sub_08109BF4

	thumb_func_start sub_08109C34
sub_08109C34: @ 0x08109C34
	push {lr}
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r3]
	ldrh r1, [r0, #0x30]
	movs r2, #0
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	ldr r1, _08109C58
	str r1, [r0, #0x1c]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08109C58: .4byte 0x08109C5D
	thumb_func_end sub_08109C34

	thumb_func_start sub_08109C5C
sub_08109C5C: @ 0x08109C5C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #0xa
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x32]
	adds r0, #0xd0
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08109CA8
	adds r0, r4, #0
	bl DestroyAnimSprite
_08109CA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08109C5C

	thumb_func_start sub_08109CB0
sub_08109CB0: @ 0x08109CB0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08109D10
	adds r4, r4, r0
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r4, #0x26]
	strh r5, [r4, #8]
	strh r5, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0xe]
	ldr r2, _08109D14
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x22]
	strh r0, [r4, #0x10]
	ldr r0, _08109D18
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x12]
	strh r5, [r4, #0x14]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	ldr r0, _08109D1C
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08109D10: .4byte 0x03005B60
_08109D14: .4byte 0x020205AC
_08109D18: .4byte 0x020380D6
_08109D1C: .4byte 0x08109D21
	thumb_func_end sub_08109CB0

	thumb_func_start sub_08109D20
sub_08109D20: @ 0x08109D20
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08109D48
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bls _08109D3C
	b _08109FFA
_08109D3C:
	lsls r0, r0, #2
	ldr r1, _08109D4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08109D48: .4byte 0x03005B60
_08109D4C: .4byte 0x08109D50
_08109D50: @ jump table
	.4byte _08109D6C @ case 0
	.4byte _08109D92 @ case 1
	.4byte _08109E44 @ case 2
	.4byte _08109EA4 @ case 3
	.4byte _08109EC2 @ case 4
	.4byte _08109F98 @ case 5
	.4byte _08109FEC @ case 6
_08109D6C:
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #1
	movs r0, #0xe0
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r2, r3, #0
	bl sub_080A7924
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08109D92:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08109DDA
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08109DC8
	ldr r2, _08109DC4
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	b _08109DD8
	.align 2, 0
_08109DC4: .4byte 0x020205AC
_08109DC8:
	ldr r2, _08109E3C
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _08109E40
_08109DD8:
	strh r1, [r0, #0x24]
_08109DDA:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08109E08
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08109E08
	movs r0, #0
	strh r0, [r4, #0xe]
	ldr r2, _08109E3C
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	adds r1, #1
	strh r1, [r0, #0x22]
_08109E08:
	adds r0, r4, #0
	bl sub_080A7990
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _08109E18
	b _08109FFA
_08109E18:
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBattlerSpriteYOffsetFromYScale
	ldr r2, _08109E3C
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r5, [r0, #0x24]
	strh r5, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0xe]
	b _08109FE0
	.align 2, 0
_08109E3C: .4byte 0x020205AC
_08109E40: .4byte 0x0000FFFD
_08109E44:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bgt _08109E54
	b _08109FFA
_08109E54:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08109E7E
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0xf0
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0xe0
	bl sub_080A7924
	b _08109E9E
_08109E7E:
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0xc0
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0xe0
	bl sub_080A7924
_08109E9E:
	movs r0, #0
	strh r0, [r4, #0xa]
	b _08109FE0
_08109EA4:
	adds r0, r4, #0
	bl sub_080A7990
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08109EB2
	b _08109FFA
_08109EB2:
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	movs r2, #6
	bl sub_0810A004
	b _08109FE0
_08109EC2:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08109F10
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08109EFC
	ldr r2, _08109EF8
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	adds r1, #3
	b _08109F0E
	.align 2, 0
_08109EF8: .4byte 0x020205AC
_08109EFC:
	ldr r2, _08109F48
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	subs r1, #3
_08109F0E:
	strh r1, [r0, #0x26]
_08109F10:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	ble _08109FFA
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08109F4C
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r3, #0xf0
	bl sub_080A7924
	b _08109F6A
	.align 2, 0
_08109F48: .4byte 0x020205AC
_08109F4C:
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r3, #0xc0
	bl sub_080A7924
_08109F6A:
	ldrh r1, [r4, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08109F88
	ldr r2, _08109F94
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	subs r1, #3
	strh r1, [r0, #0x26]
_08109F88:
	movs r0, #0
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	b _08109FE0
	.align 2, 0
_08109F94: .4byte 0x020205AC
_08109F98:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08109FB4
	ldr r2, _08109FE8
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	subs r1, #1
	strh r1, [r0, #0x22]
_08109FB4:
	adds r0, r4, #0
	bl sub_080A7990
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08109FFA
	ldr r2, _08109FE8
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x22]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ResetSpriteRotScale
	strh r5, [r4, #0xc]
_08109FE0:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08109FFA
	.align 2, 0
_08109FE8: .4byte 0x020205AC
_08109FEC:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08109FFA
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08109FFA:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08109D20

	thumb_func_start sub_0810A004
sub_0810A004: @ 0x0810A004
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	adds r0, r4, #0
	bl sub_0810A180
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r1, _0810A054
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r4, [r0, #0x20]
	ldr r0, _0810A058
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810A05C
	adds r0, r4, #0
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #1
	b _0810A066
	.align 2, 0
_0810A054: .4byte 0x020205AC
_0810A058: .4byte 0x020380D6
_0810A05C:
	adds r0, r4, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xff
_0810A066:
	movs r6, #0
	movs r5, #0
	lsls r4, r4, #0x10
	str r4, [sp, #8]
	mov r1, sb
	lsls r1, r1, #0x10
	str r1, [sp, #4]
	ldr r2, _0810A120
	mov sb, r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r3, r8
	lsls r3, r3, #1
	mov sl, r3
_0810A084:
	ldr r0, _0810A124
	ldr r2, [sp, #8]
	asrs r1, r2, #0x10
	ldr r3, [sp, #4]
	asrs r2, r3, #0x10
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _0810A106
	ldr r1, _0810A128
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	lsls r0, r5, #2
	adds r0, #0x40
	adds r1, r1, r0
	ldr r3, _0810A12C
	adds r0, r3, #0
	ands r1, r0
	ldr r3, _0810A130
	adds r0, r3, #0
	ands r2, r0
	orrs r2, r1
	strh r2, [r4, #4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bls _0810A0CE
	movs r5, #0
_0810A0CE:
	lsls r2, r6, #2
	mov r1, sb
	adds r0, r2, r1
	ldrh r0, [r0]
	ldr r3, [sp]
	adds r1, r0, #0
	muls r1, r3, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _0810A134
	adds r2, r2, r0
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r0, r4, #0
	bl sub_0810A1D4
	strh r7, [r4, #0x3a]
	mov r0, r8
	strh r0, [r4, #0x3c]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	add r0, sl
	ldr r1, _0810A138
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
_0810A106:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #6
	bls _0810A084
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810A120: .4byte 0x085711B0
_0810A124: .4byte 0x08571198
_0810A128: .4byte 0x020205AC
_0810A12C: .4byte 0x000003FF
_0810A130: .4byte 0xFFFFFC00
_0810A134: .4byte 0x085711B2
_0810A138: .4byte 0x03005B68
	thumb_func_end sub_0810A004

	thumb_func_start sub_0810A13C
sub_0810A13C: @ 0x0810A13C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0810A1F0
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0810A176
	ldr r3, _0810A17C
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r3, #8
	adds r1, r1, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	bl DestroySprite
_0810A176:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810A17C: .4byte 0x03005B60
	thumb_func_end sub_0810A13C

	thumb_func_start sub_0810A180
sub_0810A180: @ 0x0810A180
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0810A1B8
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0x26]
	ldrh r0, [r1, #0x22]
	adds r2, r2, r0
	adds r1, #0x29
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0810A1BC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810A1C0
	lsls r0, r4, #0x10
	movs r1, #0x94
	lsls r1, r1, #0xf
	b _0810A1C6
	.align 2, 0
_0810A1B8: .4byte 0x020205AC
_0810A1BC: .4byte 0x020380D6
_0810A1C0:
	lsls r0, r4, #0x10
	movs r1, #0xb0
	lsls r1, r1, #0xe
_0810A1C6:
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0810A180

	thumb_func_start sub_0810A1D4
sub_0810A1D4: @ 0x0810A1D4
	movs r3, #0
	strh r3, [r0, #0x2e]
	strh r3, [r0, #0x30]
	ldrh r3, [r0, #0x20]
	lsls r3, r3, #3
	strh r3, [r0, #0x32]
	ldrh r3, [r0, #0x22]
	lsls r3, r3, #3
	strh r3, [r0, #0x34]
	lsls r1, r1, #3
	strh r1, [r0, #0x36]
	lsls r2, r2, #3
	strh r2, [r0, #0x38]
	bx lr
	thumb_func_end sub_0810A1D4

	thumb_func_start sub_0810A1F0
sub_0810A1F0: @ 0x0810A1F0
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0810A21A
	movs r0, #0
	strh r0, [r2, #0x2e]
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	ldrh r0, [r2, #0x30]
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	ldrh r3, [r2, #0x34]
	adds r0, r0, r3
	strh r0, [r2, #0x34]
_0810A21A:
	ldrh r0, [r2, #0x36]
	ldrh r1, [r2, #0x32]
	adds r0, r0, r1
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	strh r0, [r2, #0x20]
	ldrh r1, [r2, #0x38]
	ldrh r3, [r2, #0x34]
	adds r1, r1, r3
	strh r1, [r2, #0x34]
	lsls r1, r1, #0x10
	asrs r3, r1, #0x13
	strh r3, [r2, #0x22]
	adds r0, #8
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0810A250
	adds r1, r3, #0
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0810A250
	cmp r1, #0x78
	ble _0810A25C
_0810A250:
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_0810A25C:
	pop {r0}
	bx r0
	thumb_func_end sub_0810A1F0

	thumb_func_start sub_0810A260
sub_0810A260: @ 0x0810A260
	push {r4, r5, lr}
	ldr r3, _0810A2A4
	ldrh r1, [r3]
	movs r2, #0
	strh r1, [r0, #0x20]
	ldrh r1, [r3, #2]
	strh r1, [r0, #0x22]
	strh r2, [r0, #0x2e]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x32]
	ldrh r1, [r3, #4]
	strh r1, [r0, #0x3a]
	ldrh r1, [r3, #6]
	strh r1, [r0, #0x3c]
	ldrh r4, [r0, #4]
	lsls r2, r4, #0x16
	lsrs r2, r2, #0x16
	movs r5, #8
	ldrsh r1, [r3, r5]
	lsls r1, r1, #4
	adds r2, r2, r1
	ldr r3, _0810A2A8
	adds r1, r3, #0
	ands r2, r1
	ldr r1, _0810A2AC
	ands r1, r4
	orrs r1, r2
	strh r1, [r0, #4]
	ldr r1, _0810A2B0
	str r1, [r0, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810A2A4: .4byte 0x020380BE
_0810A2A8: .4byte 0x000003FF
_0810A2AC: .4byte 0xFFFFFC00
_0810A2B0: .4byte 0x0810A2B5
	thumb_func_end sub_0810A260

	thumb_func_start sub_0810A2B4
sub_0810A2B4: @ 0x0810A2B4
	push {r4, lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #1
	beq _0810A2E6
	cmp r0, #1
	bgt _0810A2CA
	cmp r0, #0
	beq _0810A2D0
	b _0810A344
_0810A2CA:
	cmp r0, #2
	beq _0810A304
	b _0810A344
_0810A2D0:
	ldrh r1, [r2, #0x3a]
	movs r3, #0x3a
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0810A2E0
	subs r0, r1, #1
	strh r0, [r2, #0x3a]
	b _0810A344
_0810A2E0:
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
_0810A2E6:
	ldrh r0, [r2, #0x22]
	adds r0, #8
	strh r0, [r2, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r2, #0x3c]
	movs r4, #0x3c
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _0810A344
	strh r3, [r2, #0x22]
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	b _0810A344
_0810A304:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0810A330
	movs r0, #0
	strh r0, [r2, #0x30]
	ldrh r0, [r2, #0x32]
	adds r0, #1
	strh r0, [r2, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0810A32C
	ldr r0, _0810A328
	b _0810A32E
	.align 2, 0
_0810A328: .4byte 0x0000FFFD
_0810A32C:
	movs r0, #3
_0810A32E:
	strh r0, [r2, #0x26]
_0810A330:
	ldrh r0, [r2, #0x34]
	adds r0, #1
	strh r0, [r2, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _0810A344
	adds r0, r2, #0
	bl DestroyAnimSprite
_0810A344:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810A2B4

	thumb_func_start sub_0810A34C
sub_0810A34C: @ 0x0810A34C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _0810A3C0
	cmp r0, #1
	bgt _0810A362
	cmp r0, #0
	beq _0810A368
	b _0810A48E
_0810A362:
	cmp r0, #2
	beq _0810A41E
	b _0810A48E
_0810A368:
	adds r0, r5, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldr r4, _0810A390
	ldrb r1, [r4, #4]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldrh r0, [r4, #4]
	strh r0, [r5, #0x3c]
	ldr r0, _0810A394
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810A398
	movs r0, #4
	b _0810A39A
	.align 2, 0
_0810A390: .4byte 0x020380BE
_0810A394: .4byte 0x020380D6
_0810A398:
	ldr r0, _0810A3B8
_0810A39A:
	strh r0, [r5, #0x36]
	ldr r0, _0810A3BC
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0810A416
	.align 2, 0
_0810A3B8: .4byte 0x0000FFFC
_0810A3BC: .4byte 0x020380D7
_0810A3C0:
	ldrh r0, [r5, #0x30]
	adds r0, #0xc0
	strh r0, [r5, #0x30]
	ldr r0, _0810A3E0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810A3E4
	ldrh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	b _0810A3EA
	.align 2, 0
_0810A3E0: .4byte 0x020380D6
_0810A3E4:
	ldrh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
_0810A3EA:
	strh r0, [r5, #0x26]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	movs r2, #0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, #0x24]
	ldrh r0, [r5, #0x32]
	adds r0, #4
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x34]
	adds r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0810A48E
	movs r0, #0
	strh r0, [r5, #0x34]
_0810A416:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _0810A48E
_0810A41E:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r2, #0x36
	ldrsh r1, [r5, r2]
	bl Sin
	adds r2, r0, #0
	movs r3, #0
	strh r2, [r5, #0x24]
	ldrh r0, [r5, #0x32]
	adds r0, #4
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x34]
	adds r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _0810A48E
	ldrh r0, [r5, #0x20]
	adds r1, r2, r0
	strh r1, [r5, #0x20]
	ldrh r0, [r5, #0x26]
	ldrh r2, [r5, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	strh r3, [r5, #0x26]
	strh r3, [r5, #0x24]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x2e]
	strh r1, [r5, #0x30]
	ldr r4, _0810A494
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl sub_080A689C
	ldr r0, _0810A498
	str r0, [r5, #0x1c]
_0810A48E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810A494: .4byte 0x020380D7
_0810A498: .4byte 0x0810A49D
	thumb_func_end sub_0810A34C

	thumb_func_start sub_0810A49C
sub_0810A49C: @ 0x0810A49C
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810A4F4
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0x10
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	ldrh r2, [r4, #0x38]
	adds r0, r2, #4
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x38]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0
	beq _0810A4D2
	cmp r2, #0xc4
	ble _0810A4FA
_0810A4D2:
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0810A4FA
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810A4FA
	ldr r0, _0810A4F0
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0x90
	bl PlaySE12WithPanning
	b _0810A4FA
	.align 2, 0
_0810A4F0: .4byte 0x020380E0
_0810A4F4:
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810A4FA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810A49C

	thumb_func_start sub_0810A500
sub_0810A500: @ 0x0810A500
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0810A518
	ldr r0, _0810A584
	ldrh r0, [r0]
	strh r0, [r4, #0x30]
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
_0810A518:
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r0, #0
	ldrh r2, [r4, #0x34]
	adds r1, r1, r2
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	adds r0, #0xa0
	strh r0, [r4, #0x36]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #0x36]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #7
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810A5B4
	ldrh r0, [r4, #0x30]
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x83
	bls _0810A58C
	ldr r0, _0810A588
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	b _0810A5D0
	.align 2, 0
_0810A584: .4byte 0x020380BE
_0810A588: .4byte 0x020380D7
_0810A58C:
	ldr r0, _0810A5B0
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #1
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	ldrb r2, [r4, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #5]
	b _0810A5D0
	.align 2, 0
_0810A5B0: .4byte 0x020380D7
_0810A5B4:
	ldrh r0, [r4, #0x30]
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x83
	bls _0810A5C8
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x1d
	b _0810A5CE
_0810A5C8:
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x1f
_0810A5CE:
	strb r0, [r1]
_0810A5D0:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0810A5F8
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
_0810A5F8:
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0x1e
	bne _0810A606
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810A606:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810A500

	thumb_func_start sub_0810A60C
sub_0810A60C: @ 0x0810A60C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0810A66C
	adds r4, r1, r0
	ldr r0, _0810A670
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
	cmp r0, #0
	bne _0810A632
	movs r1, #1
_0810A632:
	strh r1, [r4, #0x20]
	ldr r0, _0810A674
	ldrb r1, [r0]
	movs r0, #2
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #1
	strh r0, [r4, #0x22]
	movs r0, #1
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	movs r0, #3
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldr r0, _0810A678
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810A66C: .4byte 0x03005B60
_0810A670: .4byte 0x020380D6
_0810A674: .4byte 0x020380D7
_0810A678: .4byte 0x0810A67D
	thumb_func_end sub_0810A60C

	thumb_func_start sub_0810A67C
sub_0810A67C: @ 0x0810A67C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0810A6A0
	adds r2, r0, r1
	movs r0, #8
	ldrsh r3, [r2, r0]
	cmp r3, #1
	beq _0810A744
	cmp r3, #1
	bgt _0810A6A4
	cmp r3, #0
	beq _0810A6B2
	b _0810A8A4
	.align 2, 0
_0810A6A0: .4byte 0x03005B60
_0810A6A4:
	cmp r3, #2
	bne _0810A6AA
	b _0810A7CC
_0810A6AA:
	cmp r3, #3
	bne _0810A6B0
	b _0810A860
_0810A6B0:
	b _0810A8A4
_0810A6B2:
	movs r1, #0x20
	ldrsh r0, [r2, r1]
	lsls r0, r0, #1
	ldrh r5, [r2, #0x1c]
	adds r0, r0, r5
	strh r0, [r2, #0x1c]
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0810A6E4
	strh r3, [r2, #0xa]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0810A6E0
	movs r0, #2
	b _0810A6E2
_0810A6E0:
	ldr r0, _0810A73C
_0810A6E2:
	strh r0, [r2, #0x1e]
_0810A6E4:
	movs r1, #0
	strh r1, [r2, #0xe]
	movs r7, #0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _0810A726
	ldr r4, _0810A740
	adds r3, r2, #0
	adds r3, #8
_0810A6F6:
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r3, r0
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r2, #0x1e]
	ldrh r7, [r2, #0x1c]
	adds r0, r0, r7
	strh r0, [r1, #0x24]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _0810A6F6
_0810A726:
	ldrh r0, [r2, #0x1a]
	adds r0, #1
	strh r0, [r2, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	beq _0810A736
	b _0810A8A4
_0810A736:
	movs r0, #0
	strh r0, [r2, #0x1a]
	b _0810A850
	.align 2, 0
_0810A73C: .4byte 0x0000FFFE
_0810A740: .4byte 0x020205AC
_0810A744:
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0810A76C
	movs r0, #0
	strh r0, [r2, #0xa]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	ands r0, r3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0810A768
	movs r0, #2
	b _0810A76A
_0810A768:
	ldr r0, _0810A7C4
_0810A76A:
	strh r0, [r2, #0x1e]
_0810A76C:
	movs r1, #0
	strh r1, [r2, #0xe]
	movs r7, #0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _0810A7AE
	ldr r4, _0810A7C8
	adds r3, r2, #0
	adds r3, #8
_0810A77E:
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r3, r0
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r2, #0x1e]
	ldrh r7, [r2, #0x1c]
	adds r0, r0, r7
	strh r0, [r1, #0x24]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _0810A77E
_0810A7AE:
	ldrh r0, [r2, #0x1a]
	adds r0, #1
	strh r0, [r2, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x60
	bne _0810A8A4
	movs r0, #0
	strh r0, [r2, #0x1a]
	b _0810A850
	.align 2, 0
_0810A7C4: .4byte 0x0000FFFE
_0810A7C8: .4byte 0x020205AC
_0810A7CC:
	movs r7, #0x20
	ldrsh r1, [r2, r7]
	lsls r1, r1, #1
	ldrh r0, [r2, #0x1c]
	subs r0, r0, r1
	strh r0, [r2, #0x1c]
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0810A800
	movs r0, #0
	strh r0, [r2, #0xa]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0810A7FC
	strh r3, [r2, #0x1e]
	b _0810A800
_0810A7FC:
	ldr r0, _0810A858
	strh r0, [r2, #0x1e]
_0810A800:
	movs r1, #0
	strh r1, [r2, #0xe]
	movs r3, #0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0810A842
	ldr r4, _0810A85C
	adds r3, r2, #0
	adds r3, #8
_0810A812:
	movs r5, #0xe
	ldrsh r0, [r2, r5]
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r3, r0
	movs r7, #0
	ldrsh r0, [r0, r7]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r2, #0x1e]
	ldrh r5, [r2, #0x1c]
	adds r0, r0, r5
	strh r0, [r1, #0x24]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _0810A812
_0810A842:
	ldrh r0, [r2, #0x1a]
	adds r0, #1
	strh r0, [r2, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0810A8A4
_0810A850:
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	b _0810A8A4
	.align 2, 0
_0810A858: .4byte 0x0000FFFE
_0810A85C: .4byte 0x020205AC
_0810A860:
	movs r1, #0
	strh r1, [r2, #0xe]
	movs r3, #0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0810A89E
	ldr r6, _0810A8AC
	adds r3, r2, #0
	adds r3, #8
	movs r5, #0
_0810A874:
	movs r7, #0xe
	ldrsh r0, [r2, r7]
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r3, r0
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r5, [r0, #0x24]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _0810A874
_0810A89E:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_0810A8A4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810A8AC: .4byte 0x020205AC
	thumb_func_end sub_0810A67C

	thumb_func_start AnimTask_BlendBackground
AnimTask_BlendBackground: @ 0x0810A8B0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #8]
	lsls r0, r0, #4
	ldr r1, _0810A8E0
	ldrb r2, [r1]
	ldrh r3, [r1, #2]
	movs r1, #0x10
	bl BlendPalette
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810A8E0: .4byte 0x020380BE
	thumb_func_end AnimTask_BlendBackground

	thumb_func_start sub_0810A8E4
sub_0810A8E4: @ 0x0810A8E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0810A93C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r3, #8
	ldrsh r0, [r2, r3]
	mov sb, r1
	ldr r4, _0810A940
	mov r8, r4
	cmp r0, #0
	bne _0810A91A
	ldrh r0, [r4]
	strh r0, [r2, #0xa]
	ldrh r0, [r4, #2]
	strh r0, [r2, #0xc]
	ldrh r0, [r4, #4]
	strh r0, [r2, #0xe]
	ldrh r0, [r4, #6]
	strh r0, [r2, #0x10]
_0810A91A:
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	ldr r1, _0810A944
	ldr r0, _0810A948
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r6, [r0]
	movs r5, #0x10
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0810A950
	ldr r4, _0810A94C
	movs r1, #8
	ldrsh r0, [r2, r1]
	b _0810A956
	.align 2, 0
_0810A93C: .4byte 0x03005B60
_0810A940: .4byte 0x020380BE
_0810A944: .4byte 0x02023E88
_0810A948: .4byte 0x020380D7
_0810A94C: .4byte 0x08571268
_0810A950:
	ldr r4, _0810A99C
	movs r3, #8
	ldrsh r0, [r2, r3]
_0810A956:
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r4
	ldrb r5, [r0]
	lsls r0, r7, #2
	adds r1, r0, r7
	lsls r1, r1, #3
	add r1, sb
	movs r4, #0xe
	ldrsh r1, [r1, r4]
	mov ip, r0
	cmp r1, #1
	bne _0810A9A4
	ldr r2, _0810A9A0
	lsls r3, r6, #4
	adds r0, r3, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	mov sl, r0
	mov r0, r8
	movs r4, #2
	ldrsh r1, [r0, r4]
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	muls r0, r1, r0
	cmp r0, #0
	bge _0810A994
	rsbs r0, r0, #0
_0810A994:
	mov r5, sl
	strh r0, [r5, #0x26]
	b _0810A9BE
	.align 2, 0
_0810A99C: .4byte 0x08571278
_0810A9A0: .4byte 0x020205AC
_0810A9A4:
	ldr r3, _0810A9F4
	lsls r4, r6, #4
	adds r2, r4, r6
	lsls r2, r2, #2
	adds r2, r2, r3
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r5, r8
	ldrh r1, [r5, #2]
	muls r0, r1, r0
	strh r0, [r2, #0x24]
	adds r2, r3, #0
	adds r3, r4, #0
_0810A9BE:
	mov r1, ip
	adds r0, r1, r7
	lsls r0, r0, #3
	add r0, sb
	movs r4, #8
	ldrsh r1, [r0, r4]
	movs r5, #0xa
	ldrsh r0, [r0, r5]
	cmp r1, r0
	bne _0810A9E4
	adds r0, r3, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x24]
	strh r1, [r0, #0x26]
	adds r0, r7, #0
	bl DestroyAnimVisualTask
_0810A9E4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810A9F4: .4byte 0x020205AC
	thumb_func_end sub_0810A8E4

