.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0810E6C0
sub_0810E6C0: @ 0x0810E6C0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
	ldrh r0, [r4, #0x22]
	adds r0, #0x14
	strh r0, [r4, #0x22]
	movs r0, #0xbf
	strh r0, [r4, #0x30]
	ldr r1, _0810E6E4
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E6E4: .4byte 0x0810E6E9
	thumb_func_end sub_0810E6C0

	thumb_func_start sub_0810E6E8
sub_0810E6E8: @ 0x0810E6E8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x20
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #5
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x47
	bne _0810E722
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810E722:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810E6E8

	thumb_func_start sub_0810E728
sub_0810E728: @ 0x0810E728
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0810E758
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldr r1, _0810E75C
	ldrh r0, [r1, #2]
	strh r0, [r4, #8]
	ldrh r0, [r1]
	strh r0, [r4, #0xa]
	ldr r0, _0810E760
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xc]
	ldr r0, _0810E764
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E758: .4byte 0x03005B60
_0810E75C: .4byte 0x020380BE
_0810E760: .4byte 0x00002719
_0810E764: .4byte 0x0810E769
	thumb_func_end sub_0810E728

	thumb_func_start sub_0810E768
sub_0810E768: @ 0x0810E768
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _0810E7E8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrh r0, [r3, #0x1c]
	adds r1, r0, #1
	strh r1, [r3, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0xa
	ldrsh r1, [r3, r4]
	adds r7, r2, #0
	cmp r0, r1
	bne _0810E7C6
	movs r0, #0
	strh r0, [r3, #0x1c]
	ldrb r0, [r3, #0xc]
	ldr r2, _0810E7EC
	lsls r0, r0, #4
	movs r3, #0x84
	lsls r3, r3, #1
	adds r1, r0, r3
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r6, [r1]
	movs r4, #7
	mov ip, r0
	ldr r0, _0810E7F0
	add r0, ip
	lsls r0, r0, #1
	adds r3, r0, r2
_0810E7AE:
	ldrh r0, [r3]
	strh r0, [r1]
	subs r3, #2
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bgt _0810E7AE
	ldr r0, _0810E7F4
	add r0, ip
	lsls r0, r0, #1
	adds r0, r0, r2
	strh r6, [r0]
_0810E7C6:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0, #8]
	subs r1, #1
	strh r1, [r0, #8]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _0810E7E0
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0810E7E0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E7E8: .4byte 0x03005B60
_0810E7EC: .4byte 0x020377B4
_0810E7F0: .4byte 0x00000107
_0810E7F4: .4byte 0x00000101
	thumb_func_end sub_0810E768

	thumb_func_start sub_0810E7F8
sub_0810E7F8: @ 0x0810E7F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _0810E864
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E818
	ldr r1, _0810E868
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_0810E818:
	ldr r4, _0810E868
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x2e]
	ldrh r0, [r6, #0x20]
	strh r0, [r6, #0x30]
	ldr r5, _0810E86C
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r6, #0x32]
	ldrh r0, [r6, #0x22]
	strh r0, [r6, #0x34]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r4, [r4, #6]
	adds r0, r0, r4
	strh r0, [r6, #0x36]
	adds r0, r6, #0
	bl InitAnimLinearTranslation
	ldr r0, _0810E870
	str r0, [r6, #0x1c]
	ldr r1, _0810E874
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E864: .4byte 0x020380D6
_0810E868: .4byte 0x020380BE
_0810E86C: .4byte 0x020380D7
_0810E870: .4byte 0x080A6085
_0810E874: .4byte 0x0810E879
	thumb_func_end sub_0810E7F8

	thumb_func_start sub_0810E878
sub_0810E878: @ 0x0810E878
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E88C
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810E88C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810E878

	thumb_func_start sub_0810E894
sub_0810E894: @ 0x0810E894
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0810E930
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E8C0
	ldr r1, _0810E934
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r1]
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	strh r0, [r1, #6]
_0810E8C0:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E8D8
	ldr r0, _0810E934
	ldrh r1, [r0, #2]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldrh r1, [r0, #6]
	rsbs r1, r1, #0
	strh r1, [r0, #6]
_0810E8D8:
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r2, _0810E934
	ldrh r1, [r2]
	ldrh r3, [r5, #0x20]
	adds r1, r1, r3
	strh r1, [r5, #0x20]
	lsrs r0, r0, #0x18
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	ldrh r0, [r2, #8]
	strh r0, [r5, #0x2e]
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _0810E93C
	ldr r4, _0810E938
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
	b _0810E94E
	.align 2, 0
_0810E930: .4byte 0x020380D6
_0810E934: .4byte 0x020380BE
_0810E938: .4byte 0x020380D7
_0810E93C:
	ldr r0, _0810E97C
	ldrb r0, [r0]
	adds r2, r5, #0
	adds r2, #0x32
	adds r3, r5, #0
	adds r3, #0x36
	movs r1, #1
	bl SetAverageBattlerPositions
_0810E94E:
	ldr r4, _0810E980
	ldrh r0, [r4, #4]
	ldrh r1, [r5, #0x32]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	ldrh r0, [r4, #6]
	ldrh r3, [r5, #0x36]
	adds r0, r0, r3
	strh r0, [r5, #0x36]
	ldr r0, _0810E984
	str r0, [r5, #0x1c]
	ldr r1, _0810E988
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldrb r1, [r4, #0xa]
	adds r0, r5, #0
	bl SeekSpriteAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E97C: .4byte 0x020380D7
_0810E980: .4byte 0x020380BE
_0810E984: .4byte 0x080A67B5
_0810E988: .4byte 0x080A34C5
	thumb_func_end sub_0810E894

	thumb_func_start sub_0810E98C
sub_0810E98C: @ 0x0810E98C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r1, _0810E9C8
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x30]
	ldr r0, _0810E9CC
	str r0, [r4, #0x1c]
	movs r0, #0
	bl GetAnimBattlerSpriteId
	ldr r2, _0810E9D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E9C8: .4byte 0x020380BE
_0810E9CC: .4byte 0x0810E9D5
_0810E9D0: .4byte 0x020205AC
	thumb_func_end sub_0810E98C

	thumb_func_start sub_0810E9D4
sub_0810E9D4: @ 0x0810E9D4
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0810E9E8
	subs r0, r1, #1
	strh r0, [r2, #0x2e]
	b _0810E9FA
_0810E9E8:
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x32]
	adds r0, r0, r1
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2, #0x26]
	subs r1, r1, r0
	strh r1, [r2, #0x26]
_0810E9FA:
	movs r3, #0x22
	ldrsh r0, [r2, r3]
	movs r3, #0x26
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0810EA12
	adds r0, r2, #0
	bl DestroyAnimSprite
_0810EA12:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810E9D4

	thumb_func_start sub_0810EA18
sub_0810EA18: @ 0x0810EA18
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0810EA40
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810EA48
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r5, #0x20]
	ldr r0, _0810EA44
	strh r0, [r5, #0x22]
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	b _0810EA4E
	.align 2, 0
_0810EA40: .4byte 0x020380D6
_0810EA44: .4byte 0x0000FFE0
_0810EA48:
	ldr r0, _0810EA8C
	strh r0, [r5, #0x20]
	strh r0, [r5, #0x22]
_0810EA4E:
	ldr r0, _0810EA90
	ldrh r0, [r0]
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	ldr r4, _0810EA94
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
	ldr r0, _0810EA98
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EA8C: .4byte 0x0000FFE0
_0810EA90: .4byte 0x020380BE
_0810EA94: .4byte 0x020380D7
_0810EA98: .4byte 0x0810EA9D
	thumb_func_end sub_0810EA18

	thumb_func_start sub_0810EA9C
sub_0810EA9C: @ 0x0810EA9C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl AnimTranslateLinear
	ldrh r1, [r4, #0x34]
	lsrs r0, r1, #8
	cmp r0, #0xc8
	bls _0810EAC4
	ldrh r0, [r4, #0x24]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x24]
	movs r0, #0xff
	ands r0, r1
	strh r0, [r4, #0x34]
_0810EAC4:
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	adds r0, #0x20
	movs r1, #0x98
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0810EAE6
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	cmp r0, #0xa0
	ble _0810EB0C
_0810EAE6:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	ldr r2, _0810EB14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810EB0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810EB14: .4byte 0x020205AC
	thumb_func_end sub_0810EA9C

	thumb_func_start sub_0810EB18
sub_0810EB18: @ 0x0810EB18
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	subs r1, r0, #1
	strh r1, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0810EB58
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0810EB4A
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
_0810EB4A:
	adds r0, r4, #0
	bl DestroySprite
	ldr r1, _0810EB60
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0810EB58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810EB60: .4byte 0x0203809E
	thumb_func_end sub_0810EB18

	thumb_func_start sub_0810EB64
sub_0810EB64: @ 0x0810EB64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x2e
	ldr r0, _0810EB84
	ldrh r1, [r0, #0xe]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0810EB8C
	ldr r0, _0810EB88
	b _0810EB8E
	.align 2, 0
_0810EB84: .4byte 0x020380BE
_0810EB88: .4byte 0x020380D6
_0810EB8C:
	ldr r0, _0810EC38
_0810EB8E:
	ldrb r6, [r0]
	adds r0, r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810EBA4
	ldr r1, _0810EC3C
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r1]
_0810EBA4:
	adds r0, r6, #0
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r4, _0810EC3C
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r7, #0x20]
	adds r0, r6, #0
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldrh r1, [r4, #2]
	lsrs r0, r0, #0x18
	adds r1, r0, r1
	strh r1, [r7, #0x22]
	lsls r1, r1, #8
	strh r1, [r5, #8]
	ldrh r1, [r4, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrh r2, [r5, #0xe]
	movs r1, #1
	ands r1, r2
	orrs r1, r0
	strh r1, [r5, #0xe]
	ldrb r0, [r5]
	movs r2, #4
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r4, #4]
	ldrb r1, [r4, #4]
	strh r1, [r5, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xa]
	ldrh r0, [r4, #6]
	strh r0, [r5, #4]
	ldrh r0, [r4, #8]
	strh r0, [r5, #6]
	ldrh r0, [r4, #0xa]
	strh r0, [r5, #0xc]
	subs r1, #0x40
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x7f
	bhi _0810EC9A
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810EC40
	adds r0, r6, #0
	bl GetBattlerSpriteBGPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #1
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	ldrb r2, [r7, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #5]
	b _0810EC58
	.align 2, 0
_0810EC38: .4byte 0x020380D7
_0810EC3C: .4byte 0x020380BE
_0810EC40:
	adds r0, r6, #0
	bl GetBattlerSpriteBGPriority
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r7, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #5]
_0810EC58:
	ldrb r1, [r5, #0xe]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r5, #0xe]
	movs r2, #4
	ldrsh r0, [r5, r2]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0810ECFA
	adds r3, r7, #0
	adds r3, #0x3f
	ldrb r2, [r3]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r7, #0
	adds r1, #0x2a
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	b _0810ECF2
_0810EC9A:
	adds r0, r6, #0
	bl GetBattlerSpriteBGPriority
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r7, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #5]
	ldrb r0, [r5, #0xe]
	movs r4, #1
	orrs r0, r4
	strb r0, [r5, #0xe]
	movs r1, #4
	ldrsh r0, [r5, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0810ECFA
	adds r3, r7, #0
	adds r3, #0x3f
	ldrb r2, [r3]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	movs r0, #1
	eors r1, r0
	ands r1, r4
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r7, #0
	adds r1, #0x2a
	strb r0, [r1]
	ldrb r0, [r3]
	mov r2, r8
	orrs r0, r2
_0810ECF2:
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
_0810ECFA:
	ldrh r1, [r5, #2]
	lsrs r1, r1, #6
	lsls r1, r1, #4
	ldrb r2, [r5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r3, _0810ED64
	ldrh r0, [r5, #2]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldrb r0, [r5, #0xc]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r7, #0x24]
	ldrb r2, [r7, #3]
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x1b
	movs r1, #0x24
	ldrsh r0, [r7, r1]
	rsbs r0, r0, #0
	asrs r0, r0, #1
	ldrb r5, [r5, #0xa]
	adds r0, r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r3
	ldrh r4, [r1]
	ldr r1, _0810ED68
	lsls r2, r2, #3
	adds r2, r2, r1
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2, #6]
	strh r0, [r2]
	strh r4, [r2, #2]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	strh r0, [r2, #4]
	ldr r0, _0810ED6C
	str r0, [r7, #0x1c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810ED64: .4byte 0x082FA8CC
_0810ED68: .4byte 0x02021B3C
_0810ED6C: .4byte 0x0810ED71
	thumb_func_end sub_0810EB64

	thumb_func_start sub_0810ED70
sub_0810ED70: @ 0x0810ED70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r2, [r4]
	movs r7, #1
	movs r0, #1
	mov sb, r0
	ands r0, r2
	cmp r0, #0
	beq _0810EDAA
	ldrb r0, [r4, #1]
	adds r1, r0, #0
	adds r1, #0xff
	strb r1, [r4, #1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810ED9E
	b _0810F286
_0810ED9E:
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r4]
	strb r6, [r4, #1]
	b _0810F286
_0810EDAA:
	ldrh r0, [r4, #2]
	lsrs r1, r0, #6
	mov ip, r0
	cmp r1, #1
	bne _0810EDB6
	b _0810EEDA
_0810EDB6:
	cmp r1, #1
	bgt _0810EDC0
	cmp r1, #0
	beq _0810EDCE
	b _0810F1CC
_0810EDC0:
	cmp r1, #2
	bne _0810EDC6
	b _0810EFCE
_0810EDC6:
	cmp r1, #3
	bne _0810EDCC
	b _0810F0C2
_0810EDCC:
	b _0810F1CC
_0810EDCE:
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x1c
	cmp r0, #1
	bne _0810EDE2
	movs r0, #8
	orrs r0, r2
	orrs r0, r7
	strb r0, [r4]
	strb r6, [r4, #1]
	b _0810EED0
_0810EDE2:
	lsrs r0, r1, #0x1c
	cmp r0, #3
	bne _0810EE04
	lsls r0, r2, #0x1e
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r0, r1
	ands r0, r7
	lsls r0, r0, #1
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	strb r1, [r4]
	strb r6, [r4, #1]
	b _0810EED0
_0810EE04:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0810EED0
	adds r3, r5, #0
	adds r3, #0x3f
	ldrb r2, [r3]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	movs r6, #1
	eors r1, r6
	ands r1, r7
	movs r0, #2
	rsbs r0, r0, #0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0810EEC2
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810EE92
	ldrb r1, [r4, #0xe]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _0810EE78
	ldrb r2, [r5, #5]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1e
	subs r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0810EEB0
_0810EE78:
	ldrb r2, [r5, #5]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1e
	adds r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0810EEB0
_0810EE92:
	ldrb r1, [r4, #0xe]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _0810EEA6
	adds r1, r5, #0
	adds r1, #0x43
	ldrb r0, [r1]
	subs r0, #0xc
	b _0810EEAE
_0810EEA6:
	adds r1, r5, #0
	adds r1, #0x43
	ldrb r0, [r1]
	adds r0, #0xc
_0810EEAE:
	strb r0, [r1]
_0810EEB0:
	ldrb r2, [r4, #0xe]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #0xe]
_0810EEC2:
	ldrb r1, [r4]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, #2]
	mov ip, r1
_0810EED0:
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	strb r0, [r4]
	b _0810F1CC
_0810EEDA:
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x1c
	cmp r0, #0
	bne _0810EEE8
	movs r0, #8
	orrs r0, r2
	b _0810EEF0
_0810EEE8:
	lsrs r0, r1, #0x1c
	cmp r0, #2
	bne _0810EEF8
	adds r0, r2, #0
_0810EEF0:
	orrs r0, r7
	strb r0, [r4]
	strb r6, [r4, #1]
	b _0810EFC4
_0810EEF8:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0810EFC4
	adds r3, r5, #0
	adds r3, #0x3f
	ldrb r2, [r3]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	movs r6, #1
	eors r1, r6
	ands r1, r7
	movs r0, #2
	rsbs r0, r0, #0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0810EFB6
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810EF86
	ldrb r1, [r4, #0xe]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _0810EF6C
	ldrb r2, [r5, #5]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1e
	subs r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0810EFA4
_0810EF6C:
	ldrb r2, [r5, #5]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1e
	adds r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0810EFA4
_0810EF86:
	ldrb r1, [r4, #0xe]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _0810EF9A
	adds r1, r5, #0
	adds r1, #0x43
	ldrb r0, [r1]
	subs r0, #0xc
	b _0810EFA2
_0810EF9A:
	adds r1, r5, #0
	adds r1, #0x43
	ldrb r0, [r1]
	adds r0, #0xc
_0810EFA2:
	strb r0, [r1]
_0810EFA4:
	ldrb r2, [r4, #0xe]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #0xe]
_0810EFB6:
	ldrb r1, [r4]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, #2]
	mov ip, r1
_0810EFC4:
	ldrb r0, [r4]
	movs r1, #0xf
	ands r1, r0
	movs r0, #0x10
	b _0810F1C8
_0810EFCE:
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x1c
	cmp r0, #3
	bne _0810EFDC
	movs r0, #8
	orrs r0, r2
	b _0810EFE4
_0810EFDC:
	lsrs r0, r1, #0x1c
	cmp r0, #1
	bne _0810EFEC
	adds r0, r2, #0
_0810EFE4:
	orrs r0, r7
	strb r0, [r4]
	strb r6, [r4, #1]
	b _0810F0B8
_0810EFEC:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0810F0B8
	adds r3, r5, #0
	adds r3, #0x3f
	ldrb r2, [r3]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	movs r6, #1
	eors r1, r6
	ands r1, r7
	movs r0, #2
	rsbs r0, r0, #0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0810F0AA
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810F07A
	ldrb r1, [r4, #0xe]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _0810F060
	ldrb r2, [r5, #5]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1e
	subs r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0810F098
_0810F060:
	ldrb r2, [r5, #5]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1e
	adds r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0810F098
_0810F07A:
	ldrb r1, [r4, #0xe]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _0810F08E
	adds r1, r5, #0
	adds r1, #0x43
	ldrb r0, [r1]
	subs r0, #0xc
	b _0810F096
_0810F08E:
	adds r1, r5, #0
	adds r1, #0x43
	ldrb r0, [r1]
	adds r0, #0xc
_0810F096:
	strb r0, [r1]
_0810F098:
	ldrb r2, [r4, #0xe]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #0xe]
_0810F0AA:
	ldrb r1, [r4]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, #2]
	mov ip, r1
_0810F0B8:
	ldrb r0, [r4]
	movs r1, #0xf
	ands r1, r0
	movs r0, #0x20
	b _0810F1C8
_0810F0C2:
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x1c
	cmp r0, #2
	bne _0810F0D2
	movs r0, #8
	orrs r0, r2
	strb r0, [r4]
	b _0810F1C0
_0810F0D2:
	lsrs r0, r1, #0x1c
	cmp r0, #0
	bne _0810F0F4
	lsls r0, r2, #0x1e
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r0, r1
	ands r0, r7
	lsls r0, r0, #1
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	strb r1, [r4]
	strb r6, [r4, #1]
	b _0810F1C0
_0810F0F4:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0810F1C0
	adds r3, r5, #0
	adds r3, #0x3f
	ldrb r2, [r3]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	movs r6, #1
	eors r1, r6
	ands r1, r7
	movs r0, #2
	rsbs r0, r0, #0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0810F1B2
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810F182
	ldrb r1, [r4, #0xe]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _0810F168
	ldrb r2, [r5, #5]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1e
	subs r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0810F1A0
_0810F168:
	ldrb r2, [r5, #5]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1e
	adds r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0810F1A0
_0810F182:
	ldrb r1, [r4, #0xe]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _0810F196
	adds r1, r5, #0
	adds r1, #0x43
	ldrb r0, [r1]
	subs r0, #0xc
	b _0810F19E
_0810F196:
	adds r1, r5, #0
	adds r1, #0x43
	ldrb r0, [r1]
	adds r0, #0xc
_0810F19E:
	strb r0, [r1]
_0810F1A0:
	ldrb r2, [r4, #0xe]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #0xe]
_0810F1B2:
	ldrb r1, [r4]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldrh r1, [r4, #2]
	mov ip, r1
_0810F1C0:
	ldrb r0, [r4]
	movs r1, #0xf
	ands r1, r0
	movs r0, #0x30
_0810F1C8:
	orrs r1, r0
	strb r1, [r4]
_0810F1CC:
	ldrb r1, [r4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	adds r0, r4, #0
	adds r0, #0xc
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r3, _0810F254
	mov r2, ip
	lsls r0, r2, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5, #0x24]
	ldrb r2, [r5, #3]
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x1b
	movs r1, #0x24
	ldrsh r0, [r5, r1]
	rsbs r0, r0, #0
	asrs r0, r0, #1
	ldrb r1, [r4, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r3
	ldrh r6, [r1]
	ldr r1, _0810F258
	lsls r2, r2, #3
	adds r2, r2, r1
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2, #6]
	strh r0, [r2]
	strh r6, [r2, #2]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	strh r0, [r2, #4]
	ldrh r0, [r4, #6]
	ldrh r2, [r4, #8]
	adds r0, r0, r2
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	movs r1, #4
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0810F25C
	ldrh r0, [r4, #4]
	subs r1, #1
	ands r1, r0
	ldrh r0, [r4, #2]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #2]
	b _0810F26C
	.align 2, 0
_0810F254: .4byte 0x082FA8CC
_0810F258: .4byte 0x02021B3C
_0810F25C:
	ldrh r0, [r4, #4]
	ldr r1, _0810F294
	ands r1, r0
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	strh r1, [r4, #2]
_0810F26C:
	movs r0, #0x22
	ldrsh r1, [r5, r0]
	movs r2, #0x26
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	ldrh r0, [r4, #0xe]
	lsrs r0, r0, #1
	cmp r1, r0
	blt _0810F286
	movs r0, #0
	strh r0, [r5, #0x2e]
	ldr r0, _0810F298
	str r0, [r5, #0x1c]
_0810F286:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810F294: .4byte 0x00007FFF
_0810F298: .4byte 0x0810EB19
	thumb_func_end sub_0810ED70

	thumb_func_start sub_0810F29C
sub_0810F29C: @ 0x0810F29C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0810F2E4
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
	ldr r5, _0810F2E8
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x20]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	ldr r0, _0810F2EC
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F2E4: .4byte 0x020380D7
_0810F2E8: .4byte 0x020380D6
_0810F2EC: .4byte 0x080A70E9
	thumb_func_end sub_0810F29C

	thumb_func_start sub_0810F2F0
sub_0810F2F0: @ 0x0810F2F0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0810F308
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810F30C
	adds r0, r5, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	b _0810F314
	.align 2, 0
_0810F308: .4byte 0x020380BE
_0810F30C:
	adds r0, r5, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
_0810F314:
	ldr r4, _0810F37C
	movs r2, #4
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0810F32C
	ldr r0, _0810F380
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810F342
_0810F32C:
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _0810F348
	ldr r0, _0810F384
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810F348
_0810F342:
	ldrh r0, [r5, #0x20]
	adds r0, #8
	strh r0, [r5, #0x20]
_0810F348:
	ldr r4, _0810F37C
	ldrb r1, [r4, #8]
	adds r0, r5, #0
	bl SeekSpriteAnim
	ldrh r0, [r5, #0x20]
	subs r0, #0x20
	strh r0, [r5, #0x20]
	ldr r0, _0810F388
	strh r0, [r5, #0x30]
	ldrh r1, [r4, #8]
	movs r0, #0xc
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
	ldrh r2, [r5, #0x24]
	adds r0, r0, r2
	strh r0, [r5, #0x24]
	strh r1, [r5, #0x2e]
	ldrh r0, [r4, #6]
	strh r0, [r5, #0x3c]
	ldr r0, _0810F38C
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F37C: .4byte 0x020380BE
_0810F380: .4byte 0x020380D6
_0810F384: .4byte 0x020380D7
_0810F388: .4byte 0x00000CCC
_0810F38C: .4byte 0x0810F391
	thumb_func_end sub_0810F2F0

	thumb_func_start sub_0810F390
sub_0810F390: @ 0x0810F390
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0810F3BA
	strh r1, [r4, #0x2e]
	strh r1, [r4, #0x24]
	adds r0, r4, #0
	bl StartSpriteAnim
_0810F3BA:
	ldrh r0, [r4, #0x3c]
	subs r0, #1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0810F3D2
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810F3D2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810F390

	thumb_func_start sub_0810F3D8
sub_0810F3D8: @ 0x0810F3D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r1, _0810F470
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r7, r0, r1
	ldrh r0, [r7, #8]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0810F452
	ldr r1, _0810F474
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r1, #8
	ldrsh r0, [r7, r1]
	movs r5, #0xd
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl Sin
	ldr r4, _0810F478
	strh r0, [r4]
	movs r1, #8
	ldrsh r0, [r7, r1]
	adds r1, r5, #0
	bl Cos
	strh r0, [r4, #2]
	movs r0, #1
	strh r0, [r4, #4]
	movs r0, #3
	strh r0, [r4, #6]
	ldr r0, _0810F47C
	mov r8, r0
	ldr r5, _0810F480
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, r8
	adds r1, r4, #0
	movs r3, #3
	bl CreateSpriteAndAnimate
_0810F452:
	ldrh r0, [r7, #8]
	adds r0, #8
	strh r0, [r7, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0810F466
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_0810F466:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810F470: .4byte 0x03005B60
_0810F474: .4byte 0x0203809E
_0810F478: .4byte 0x020380BE
_0810F47C: .4byte 0x08572FCC
_0810F480: .4byte 0x020380D7
	thumb_func_end sub_0810F3D8

	thumb_func_start sub_0810F484
sub_0810F484: @ 0x0810F484
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0810F496
	cmp r0, #1
	beq _0810F4C8
	b _0810F4DC
_0810F496:
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	movs r0, #0
	bl GetAnimBattlerSpriteId
	ldr r2, _0810F4C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0810F4DC
	.align 2, 0
_0810F4C4: .4byte 0x020205AC
_0810F4C8:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0810F4DC
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810F4DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810F484

	thumb_func_start sub_0810F4E4
sub_0810F4E4: @ 0x0810F4E4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0810F51C
	cmp r0, #1
	bgt _0810F4FA
	cmp r0, #0
	beq _0810F500
	b _0810F56E
_0810F4FA:
	cmp r0, #2
	beq _0810F530
	b _0810F56E
_0810F500:
	ldr r0, _0810F518
	ldrb r0, [r0]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	rsbs r0, r0, #0
	subs r0, #0x20
	strh r0, [r4, #0x26]
	b _0810F528
	.align 2, 0
_0810F518: .4byte 0x020380D7
_0810F51C:
	ldrh r0, [r4, #0x26]
	adds r0, #0xa
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0810F56E
_0810F528:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0810F56E
_0810F530:
	ldrh r0, [r4, #0x26]
	subs r0, #0xa
	strh r0, [r4, #0x26]
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0810F56E
	movs r0, #0
	bl GetAnimBattlerSpriteId
	ldr r2, _0810F574
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810F56E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810F574: .4byte 0x020205AC
	thumb_func_end sub_0810F4E4

	thumb_func_start sub_0810F578
sub_0810F578: @ 0x0810F578
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r1, _0810F5B4
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x30]
	ldr r0, _0810F5B8
	str r0, [r4, #0x1c]
	movs r0, #0
	bl GetAnimBattlerSpriteId
	ldr r2, _0810F5BC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810F5B4: .4byte 0x020380BE
_0810F5B8: .4byte 0x0810F5C1
_0810F5BC: .4byte 0x020205AC
	thumb_func_end sub_0810F578

	thumb_func_start sub_0810F5C0
sub_0810F5C0: @ 0x0810F5C0
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0810F5D4
	subs r0, r1, #1
	strh r0, [r2, #0x2e]
	b _0810F618
_0810F5D4:
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	movs r3, #0x26
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	ble _0810F5FA
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x32]
	adds r0, r0, r1
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2, #0x26]
	subs r1, r1, r0
	strh r1, [r2, #0x26]
	b _0810F618
_0810F5FA:
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, #0x34]
	adds r1, r0, #1
	strh r1, [r2, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0810F618
	ldr r0, _0810F61C
	str r0, [r2, #0x1c]
_0810F618:
	pop {r0}
	bx r0
	.align 2, 0
_0810F61C: .4byte 0x0810F621
	thumb_func_end sub_0810F5C0

	thumb_func_start sub_0810F620
sub_0810F620: @ 0x0810F620
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2, #0x26]
	adds r0, r0, r1
	strh r0, [r2, #0x26]
	movs r3, #0x22
	ldrsh r0, [r2, r3]
	movs r3, #0x26
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	ble _0810F650
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
_0810F650:
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _0810F65E
	adds r0, r2, #0
	bl DestroyAnimSprite
_0810F65E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810F620

	thumb_func_start sub_0810F664
sub_0810F664: @ 0x0810F664
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0810F678
	cmp r0, #1
	beq _0810F6D0
	b _0810F73C
_0810F678:
	ldr r0, _0810F688
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0810F690
	ldr r4, _0810F68C
	b _0810F692
	.align 2, 0
_0810F688: .4byte 0x020380BE
_0810F68C: .4byte 0x020380D6
_0810F690:
	ldr r4, _0810F6CC
_0810F692:
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	movs r0, #0
	movs r3, #0x80
	lsls r3, r3, #2
	strh r3, [r5, #0x30]
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	bl TrySetSpriteRotScale
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _0810F73C
	.align 2, 0
_0810F6CC: .4byte 0x020380D7
_0810F6D0:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #0xb
	bgt _0810F6DE
	ldrh r0, [r5, #0x30]
	subs r0, #0x28
	b _0810F6E2
_0810F6DE:
	ldrh r0, [r5, #0x30]
	adds r0, #0x28
_0810F6E2:
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #0x32]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0x30
	ldrsh r3, [r5, r0]
	str r1, [sp]
	adds r0, r5, #0
	bl TrySetSpriteRotScale
	ldrb r1, [r5, #3]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1b
	movs r0, #0xf4
	lsls r0, r0, #6
	ldr r2, _0810F744
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #6
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, #1
	cmp r1, #0x80
	ble _0810F71C
	movs r1, #0x80
_0810F71C:
	movs r0, #0x40
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	strh r1, [r5, #0x26]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #0x18
	bne _0810F73C
	adds r0, r5, #0
	bl sub_080A6D64
	adds r0, r5, #0
	bl DestroyAnimSprite
_0810F73C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F744: .4byte 0x02021B3C
	thumb_func_end sub_0810F664

	thumb_func_start sub_0810F748
sub_0810F748: @ 0x0810F748
	push {r4, r5, lr}
	adds r5, r0, #0
	bl Random2
	ldr r4, _0810F76C
	ands r4, r0
	bl Random2
	movs r1, #0x7f
	ands r1, r0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0810F770
	movs r2, #0xb8
	lsls r2, r2, #2
	adds r0, r4, r2
	b _0810F778
	.align 2, 0
_0810F76C: .4byte 0x000001FF
_0810F770:
	movs r2, #0xb8
	lsls r2, r2, #2
	adds r0, r2, #0
	subs r0, r0, r4
_0810F778:
	strh r0, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0810F78C
	movs r2, #0xe0
	lsls r2, r2, #2
	adds r0, r2, #0
	adds r0, r1, r0
	b _0810F794
_0810F78C:
	movs r2, #0xe0
	lsls r2, r2, #2
	adds r0, r2, #0
	subs r0, r0, r1
_0810F794:
	strh r0, [r5, #0x30]
	ldr r2, _0810F7BC
	ldrh r0, [r2]
	strh r0, [r5, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0810F7B0
	ldrb r0, [r5, #3]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r5, #3]
_0810F7B0:
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0810F7C4
	ldr r4, _0810F7C0
	b _0810F7C6
	.align 2, 0
_0810F7BC: .4byte 0x020380BE
_0810F7C0: .4byte 0x020380D6
_0810F7C4:
	ldr r4, _0810F7F0
_0810F7C6:
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x20
	strh r0, [r5, #0x22]
	ldr r0, _0810F7F4
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F7F0: .4byte 0x020380D7
_0810F7F4: .4byte 0x0810F7F9
	thumb_func_end sub_0810F748

	thumb_func_start sub_0810F7F8
sub_0810F7F8: @ 0x0810F7F8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810F810
	ldrh r3, [r4, #0x2e]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	b _0810F81A
_0810F810:
	ldrh r3, [r4, #0x2e]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x24]
	subs r0, r0, r1
_0810F81A:
	strh r0, [r4, #0x24]
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x26]
	subs r0, r0, r1
	strh r0, [r4, #0x26]
	strh r3, [r4, #0x2e]
	adds r0, r2, #0
	subs r0, #0x20
	strh r0, [r4, #0x30]
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _0810F83A
	movs r0, #0
	strh r0, [r4, #0x2e]
_0810F83A:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _0810F84E
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810F84E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810F7F8

	thumb_func_start sub_0810F854
sub_0810F854: @ 0x0810F854
	movs r1, #0
	strh r1, [r0, #0x3a]
	movs r1, #0x40
	strh r1, [r0, #0x3c]
	ldr r1, _0810F864
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_0810F864: .4byte 0x0810F869
	thumb_func_end sub_0810F854

	thumb_func_start sub_0810F868
sub_0810F868: @ 0x0810F868
	push {lr}
	adds r3, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	cmp r1, #0
	beq _0810F87A
	cmp r1, #1
	beq _0810F8C8
	b _0810F8CE
_0810F87A:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0810F8CE
	strh r1, [r3, #0x30]
	movs r1, #0x3e
	adds r1, r1, r3
	mov ip, r1
	ldrb r2, [r1]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #0x32]
	adds r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0810F8CE
	ldrb r1, [r1]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0810F8CE
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	b _0810F8CE
_0810F8C8:
	adds r0, r3, #0
	bl DestroyAnimSprite
_0810F8CE:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810F868

	thumb_func_start sub_0810F8D4
sub_0810F8D4: @ 0x0810F8D4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	ldrh r4, [r0, #0x20]
	ldrh r5, [r0, #0x22]
	ldr r6, _0810F988
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1, #0x20]
	ldrb r0, [r6]
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r2, r8
	strh r6, [r2, #0x22]
	ldrh r0, [r2, #0x20]
	mov sb, r0
	mov r1, sb
	lsls r0, r1, #4
	strh r0, [r2, #0x36]
	lsls r0, r6, #4
	strh r0, [r2, #0x38]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #0x20
	ldrsh r0, [r2, r1]
	subs r0, r4, r0
	lsls r0, r0, #4
	movs r1, #0xc
	bl __divsi3
	mov r2, r8
	strh r0, [r2, #0x3a]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	subs r0, r5, r0
	lsls r0, r0, #4
	movs r1, #0xc
	bl __divsi3
	mov r2, r8
	strh r0, [r2, #0x3c]
	mov r0, sb
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r5, r5, r6
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl ArcTan2Neg
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	str r0, [sp]
	mov r0, r8
	movs r1, #1
	adds r2, r3, #0
	bl TrySetSpriteRotScale
	ldr r0, _0810F98C
	mov r2, r8
	str r0, [r2, #0x1c]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810F988: .4byte 0x020380D6
_0810F98C: .4byte 0x0810F991
	thumb_func_end sub_0810F8D4

	thumb_func_start sub_0810F990
sub_0810F990: @ 0x0810F990
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x3a]
	ldrh r1, [r2, #0x36]
	adds r0, r0, r1
	strh r0, [r2, #0x36]
	ldrh r1, [r2, #0x3c]
	ldrh r3, [r2, #0x38]
	adds r1, r1, r3
	strh r1, [r2, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #0x20]
	lsls r1, r1, #0x10
	asrs r3, r1, #0x14
	strh r3, [r2, #0x22]
	adds r0, #0x2d
	lsls r0, r0, #0x10
	movs r1, #0xa5
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0810F9CA
	adds r1, r3, #0
	cmp r1, #0x9d
	bgt _0810F9CA
	movs r0, #0x2d
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0810F9D0
_0810F9CA:
	adds r0, r2, #0
	bl DestroySpriteAndMatrix
_0810F9D0:
	pop {r0}
	bx r0
	thumb_func_end sub_0810F990

	thumb_func_start unref_sub_810F184
unref_sub_810F184: @ 0x0810F9D4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0810FA04
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810FA0C
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0810FA08
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	b _0810FA2A
	.align 2, 0
_0810FA04: .4byte 0x020380BE
_0810FA08: .4byte 0x020205AC
_0810FA0C:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0810FA38
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
_0810FA2A:
	strb r0, [r1]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FA38: .4byte 0x020205AC
	thumb_func_end unref_sub_810F184

