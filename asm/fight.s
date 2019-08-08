.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start unc_080B08A0
unc_080B08A0: @ 0x0810D67C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0810D6AC
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	bl SetAnimSpriteInitialXOffset
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	movs r0, #0xf
	strh r0, [r4, #0x2e]
	ldr r0, _0810D6B0
	str r0, [r4, #0x1c]
	ldr r1, _0810D6B4
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D6AC: .4byte 0x020380BE
_0810D6B0: .4byte 0x080A5D79
_0810D6B4: .4byte 0x080A34C5
	thumb_func_end unc_080B08A0

	thumb_func_start sub_0810D6B8
sub_0810D6B8: @ 0x0810D6B8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0810D6FC
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _0810D6E0
	ldr r0, _0810D700
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810D6E0
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
	ldrh r0, [r4, #6]
	rsbs r0, r0, #0
	strh r0, [r4, #6]
_0810D6E0:
	ldr r4, _0810D6FC
	ldrb r1, [r4, #0xc]
	adds r0, r5, #0
	bl StartSpriteAnim
	movs r0, #0
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	bl sub_080A7200
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D6FC: .4byte 0x020380BE
_0810D700: .4byte 0x020380D6
	thumb_func_end sub_0810D6B8

	thumb_func_start sub_0810D704
sub_0810D704: @ 0x0810D704
	push {r4, lr}
	adds r4, r0, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810D720
	ldr r0, _0810D72C
	ldrh r1, [r0, #2]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldrh r1, [r0, #6]
	rsbs r1, r1, #0
	strh r1, [r0, #6]
_0810D720:
	adds r0, r4, #0
	bl sub_0810D6B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D72C: .4byte 0x020380BE
	thumb_func_end sub_0810D704

	thumb_func_start AnimBasicFistOrFoot
AnimBasicFistOrFoot: @ 0x0810D730
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0810D750
	ldrb r1, [r4, #8]
	bl StartSpriteAnim
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810D754
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	b _0810D75C
	.align 2, 0
_0810D750: .4byte 0x020380BE
_0810D754:
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
_0810D75C:
	ldr r0, _0810D774
	ldrh r0, [r0, #4]
	strh r0, [r5, #0x2e]
	ldr r0, _0810D778
	str r0, [r5, #0x1c]
	ldr r1, _0810D77C
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D774: .4byte 0x020380BE
_0810D778: .4byte 0x080A5D79
_0810D77C: .4byte 0x080A34C5
	thumb_func_end AnimBasicFistOrFoot

	thumb_func_start sub_0810D780
sub_0810D780: @ 0x0810D780
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, _0810D79C
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov sb, r0
	cmp r1, #0
	bne _0810D7A4
	ldr r0, _0810D7A0
	b _0810D7A6
	.align 2, 0
_0810D79C: .4byte 0x020380BE
_0810D7A0: .4byte 0x020380D6
_0810D7A4:
	ldr r0, _0810D8EC
_0810D7A6:
	ldrb r0, [r0]
	mov r8, r0
	mov r4, sb
	movs r3, #4
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _0810D7C4
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __umodsi3
	strh r0, [r4, #4]
_0810D7C4:
	ldrb r1, [r4, #4]
	adds r0, r5, #0
	bl StartSpriteAnim
	mov r0, r8
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x20]
	mov r0, r8
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	mov r0, r8
	movs r1, #1
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsls r1, r1, #0xf
	lsrs r6, r1, #0x10
	mov r0, r8
	movs r1, #0
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0810D80E
	adds r0, #3
_0810D80E:
	lsls r4, r0, #0xe
	lsrs r4, r4, #0x10
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl Random2
	movs r7, #1
	adds r1, r7, #0
	ands r1, r0
	cmp r1, #0
	beq _0810D850
	lsls r0, r6, #0x10
	rsbs r0, r0, #0
	lsrs r6, r0, #0x10
_0810D850:
	bl Random2
	adds r1, r7, #0
	ands r1, r0
	cmp r1, #0
	beq _0810D862
	lsls r0, r4, #0x10
	rsbs r0, r0, #0
	lsrs r4, r0, #0x10
_0810D862:
	ldr r0, _0810D8F0
	add r0, r8
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0810D878
	lsls r0, r4, #0x10
	ldr r1, _0810D8F4
	adds r0, r0, r1
	lsrs r4, r0, #0x10
_0810D878:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x20]
	adds r0, r0, r2
	strh r0, [r5, #0x20]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x22]
	adds r0, r0, r3
	strh r0, [r5, #0x22]
	mov r1, sb
	ldrh r0, [r1, #2]
	strh r0, [r5, #0x2e]
	ldr r0, _0810D8F8
	movs r2, #0x20
	ldrsh r1, [r5, r2]
	movs r3, #0x22
	ldrsh r2, [r5, r3]
	adds r3, r5, #0
	adds r3, #0x43
	ldrb r3, [r3]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x3c]
	cmp r0, #0x40
	beq _0810D8DC
	movs r0, #0x3c
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0810D8FC
	adds r0, r0, r4
	movs r1, #0
	bl StartSpriteAffineAnim
	movs r2, #0x3c
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _0810D900
	str r1, [r0]
_0810D8DC:
	ldr r0, _0810D904
	str r0, [r5, #0x1c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810D8EC: .4byte 0x020380D7
_0810D8F0: .4byte 0x02023D1A
_0810D8F4: .4byte 0xFFF00000
_0810D8F8: .4byte 0x08572F3C
_0810D8FC: .4byte 0x020205AC
_0810D900: .4byte 0x08007141
_0810D904: .4byte 0x0810D909
	thumb_func_end sub_0810D780

	thumb_func_start sub_0810D908
sub_0810D908: @ 0x0810D908
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0810D950
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #0x40
	beq _0810D944
	ldr r4, _0810D94C
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	movs r0, #0x3c
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
_0810D944:
	adds r0, r5, #0
	bl DestroyAnimSprite
	b _0810D954
	.align 2, 0
_0810D94C: .4byte 0x020205AC
_0810D950:
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_0810D954:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810D908

	thumb_func_start sub_0810D95C
sub_0810D95C: @ 0x0810D95C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	movs r0, #0x1e
	strh r0, [r4, #0x2e]
	ldr r0, _0810D97C
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810D980
	ldrh r0, [r4, #0x20]
	subs r0, #0x14
	strh r0, [r4, #0x32]
	b _0810D992
	.align 2, 0
_0810D97C: .4byte 0x020380BE
_0810D980:
	ldrh r0, [r4, #0x20]
	adds r0, #0x14
	strh r0, [r4, #0x32]
	adds r2, r4, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_0810D992:
	ldrh r0, [r4, #0x22]
	subs r0, #0x14
	strh r0, [r4, #0x36]
	ldr r0, _0810D9AC
	str r0, [r4, #0x1c]
	ldr r1, _0810D9B0
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D9AC: .4byte 0x080A67B5
_0810D9B0: .4byte 0x0810D9B5
	thumb_func_end sub_0810D95C

	thumb_func_start sub_0810D9B4
sub_0810D9B4: @ 0x0810D9B4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	bne _0810D9F4
	ldrh r2, [r5, #0x20]
	ldrh r4, [r5, #0x24]
	subs r0, r2, r4
	strh r0, [r5, #0x32]
	ldrh r1, [r5, #0x22]
	ldrh r3, [r5, #0x26]
	subs r0, r1, r3
	strh r0, [r5, #0x36]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r2, r2, r4
	strh r2, [r5, #0x20]
	adds r1, r1, r3
	strh r1, [r5, #0x22]
	strh r6, [r5, #0x26]
	strh r6, [r5, #0x24]
	ldr r0, _0810D9FC
	str r0, [r5, #0x1c]
	ldr r1, _0810DA00
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
_0810D9F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810D9FC: .4byte 0x080A67B5
_0810DA00: .4byte 0x080A34C5
	thumb_func_end sub_0810D9B4

	thumb_func_start sub_0810DA04
sub_0810DA04: @ 0x0810DA04
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0810DA80
	ldrb r1, [r0]
	movs r0, #2
	ldr r2, _0810DA84
	eors r0, r1
	ldrb r1, [r2]
	cmp r0, r1
	bne _0810DA30
	ldrb r0, [r2]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0810DA30
	ldr r1, _0810DA88
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1]
_0810DA30:
	adds r0, r6, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r0, _0810DA80
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810DA4E
	ldr r1, _0810DA88
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_0810DA4E:
	ldr r4, _0810DA88
	ldrh r0, [r4, #6]
	movs r5, #0
	strh r0, [r6, #0x2e]
	ldrh r0, [r6, #0x20]
	strh r0, [r6, #0x30]
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r6, #0x32]
	ldrh r0, [r6, #0x22]
	strh r0, [r6, #0x34]
	strh r0, [r6, #0x36]
	adds r0, r6, #0
	bl InitAnimLinearTranslation
	ldrh r0, [r4, #0xa]
	strh r0, [r6, #0x38]
	ldrh r0, [r4, #8]
	strh r0, [r6, #0x3a]
	strh r5, [r6, #0x3c]
	ldr r0, _0810DA8C
	str r0, [r6, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810DA80: .4byte 0x020380D6
_0810DA84: .4byte 0x020380D7
_0810DA88: .4byte 0x020380BE
_0810DA8C: .4byte 0x0810DA91
	thumb_func_end sub_0810DA04

	thumb_func_start sub_0810DA90
sub_0810DA90: @ 0x0810DA90
	push {r4, lr}
	adds r4, r0, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810DABC
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3a]
	ldrh r2, [r4, #0x3c]
	adds r0, r0, r2
	strh r0, [r4, #0x3c]
	b _0810DAC2
_0810DABC:
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810DAC2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810DA90

	thumb_func_start AnimSpinningKickOrPunch
AnimSpinningKickOrPunch: @ 0x0810DAC8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r5, _0810DAF4
	ldrb r1, [r5, #4]
	adds r0, r4, #0
	bl StartSpriteAnim
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x2e]
	ldr r0, _0810DAF8
	str r0, [r4, #0x1c]
	ldr r1, _0810DAFC
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DAF4: .4byte 0x020380BE
_0810DAF8: .4byte 0x080A5D79
_0810DAFC: .4byte 0x0810DB01
	thumb_func_end AnimSpinningKickOrPunch

	thumb_func_start AnimSpinningKickOrPunchFinish
AnimSpinningKickOrPunchFinish: @ 0x0810DB00
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	ldr r0, _0810DB2C
	str r0, [r4, #0x1c]
	ldr r1, _0810DB30
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810DB2C: .4byte 0x080A5D79
_0810DB30: .4byte 0x080A34C5
	thumb_func_end AnimSpinningKickOrPunchFinish

	thumb_func_start AnimStompFoot
AnimStompFoot: @ 0x0810DB34
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r0, _0810DB50
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x2e]
	ldr r0, _0810DB54
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810DB50: .4byte 0x020380BE
_0810DB54: .4byte 0x0810DB59
	thumb_func_end AnimStompFoot

	thumb_func_start AnimStompFootStep
AnimStompFootStep: @ 0x0810DB58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	subs r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0810DB9C
	movs r0, #6
	strh r0, [r5, #0x2e]
	ldr r4, _0810DBA4
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
	ldr r0, _0810DBA8
	str r0, [r5, #0x1c]
	ldr r1, _0810DBAC
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
_0810DB9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DBA4: .4byte 0x020380D7
_0810DBA8: .4byte 0x080A67B5
_0810DBAC: .4byte 0x0810DBB1
	thumb_func_end AnimStompFootStep

	thumb_func_start AnimStompFootEnd
AnimStompFootEnd: @ 0x0810DBB0
	push {lr}
	movs r1, #0xf
	strh r1, [r0, #0x2e]
	ldr r1, _0810DBC4
	str r1, [r0, #0x1c]
	ldr r1, _0810DBC8
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_0810DBC4: .4byte 0x080A5D79
_0810DBC8: .4byte 0x080A34C5
	thumb_func_end AnimStompFootEnd

	thumb_func_start sub_0810DBCC
sub_0810DBCC: @ 0x0810DBCC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0810DBF8
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r1, _0810DBF4
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0810DC54
	.align 2, 0
_0810DBF4: .4byte 0x020380BE
_0810DBF8:
	ldrh r0, [r4, #0x30]
	ldrh r2, [r4, #0x36]
	adds r0, r0, r2
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x34]
	adds r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x34]
	cmp r0, #0x64
	ble _0810DC46
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	adds r3, r4, #0
	adds r3, #0x3e
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0810DC46:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	ble _0810DC54
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810DC54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810DBCC

	thumb_func_start sub_0810DC5C
sub_0810DC5C: @ 0x0810DC5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0810DC70
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810DC78
	ldr r4, _0810DC74
	b _0810DC7A
	.align 2, 0
_0810DC70: .4byte 0x020380BE
_0810DC74: .4byte 0x020380D6
_0810DC78:
	ldr r4, _0810DCC0
_0810DC7A:
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
	ldr r1, _0810DCC4
	ldrh r0, [r1, #2]
	ldrh r2, [r5, #0x20]
	adds r0, r0, r2
	movs r2, #0
	strh r0, [r5, #0x20]
	ldrh r0, [r1, #4]
	ldrh r3, [r5, #0x22]
	adds r0, r0, r3
	strh r0, [r5, #0x22]
	strh r2, [r5, #0x2e]
	ldrh r0, [r1, #6]
	strh r0, [r5, #0x30]
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x32]
	strh r2, [r5, #0x34]
	ldr r0, _0810DCC8
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DCC0: .4byte 0x020380D7
_0810DCC4: .4byte 0x020380BE
_0810DCC8: .4byte 0x0810DCCD
	thumb_func_end sub_0810DC5C

	thumb_func_start sub_0810DCCC
sub_0810DCCC: @ 0x0810DCCC
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	cmp r2, #0
	beq _0810DCDE
	cmp r2, #1
	beq _0810DD02
	b _0810DD3C
_0810DCDE:
	ldrh r0, [r1, #0x30]
	subs r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0810DD3C
	movs r2, #0x32
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0810DCFA
	adds r0, r1, #0
	bl DestroyAnimSprite
	b _0810DD3C
_0810DCFA:
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	b _0810DD3C
_0810DD02:
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0810DD2A
	movs r0, #0
	strh r0, [r1, #0x30]
	ldrh r0, [r1, #0x34]
	adds r0, #1
	strh r0, [r1, #0x34]
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0810DD26
	movs r0, #2
	b _0810DD28
_0810DD26:
	ldr r0, _0810DD40
_0810DD28:
	strh r0, [r1, #0x24]
_0810DD2A:
	ldrh r0, [r1, #0x32]
	subs r0, #1
	strh r0, [r1, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0810DD3C
	adds r0, r1, #0
	bl DestroyAnimSprite
_0810DD3C:
	pop {r0}
	bx r0
	.align 2, 0
_0810DD40: .4byte 0x0000FFFE
	thumb_func_end sub_0810DCCC

	thumb_func_start sub_0810DD44
sub_0810DD44: @ 0x0810DD44
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0810DD68
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0810DD70
	ldr r4, _0810DD6C
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r2, [r6, #4]
	adds r0, r0, r2
	b _0810DD82
	.align 2, 0
_0810DD68: .4byte 0x020380BE
_0810DD6C: .4byte 0x020380D6
_0810DD70:
	ldr r4, _0810DDCC
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r6, #4]
	adds r0, r0, r1
_0810DD82:
	strh r0, [r5, #0x20]
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r6, [r6, #6]
	adds r0, r0, r6
	strh r0, [r5, #0x22]
	ldrh r2, [r5, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldr r3, _0810DDD0
	movs r4, #2
	ldrsh r0, [r3, r4]
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r4, _0810DDD4
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _0810DDD8
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2e]
	movs r2, #2
	ldrsh r0, [r3, r2]
	cmp r0, #1
	beq _0810DDF0
	cmp r0, #1
	bgt _0810DDDC
	cmp r0, #0
	beq _0810DDE6
	b _0810DE16
	.align 2, 0
_0810DDCC: .4byte 0x020380D7
_0810DDD0: .4byte 0x020380BE
_0810DDD4: .4byte 0x000003FF
_0810DDD8: .4byte 0xFFFFFC00
_0810DDDC:
	cmp r0, #2
	beq _0810DE00
	cmp r0, #3
	beq _0810DE10
	b _0810DE16
_0810DDE6:
	ldr r0, _0810DDEC
	b _0810DE10
	.align 2, 0
_0810DDEC: .4byte 0x0000FFFD
_0810DDF0:
	movs r0, #3
	strh r0, [r5, #0x3a]
	ldr r0, _0810DDFC
	strh r0, [r5, #0x3c]
	b _0810DE1E
	.align 2, 0
_0810DDFC: .4byte 0x0000FFFD
_0810DE00:
	ldr r0, _0810DE0C
	strh r0, [r5, #0x3a]
	movs r0, #3
	strh r0, [r5, #0x3c]
	b _0810DE1E
	.align 2, 0
_0810DE0C: .4byte 0x0000FFFD
_0810DE10:
	strh r0, [r5, #0x3a]
	strh r0, [r5, #0x3c]
	b _0810DE1E
_0810DE16:
	adds r0, r5, #0
	bl DestroyAnimSprite
	b _0810DE22
_0810DE1E:
	ldr r0, _0810DE28
	str r0, [r5, #0x1c]
_0810DE22:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810DE28: .4byte 0x0810DE2D
	thumb_func_end sub_0810DD44

	thumb_func_start sub_0810DE2C
sub_0810DE2C: @ 0x0810DE2C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x3a]
	ldrh r2, [r1, #0x20]
	adds r0, r0, r2
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0x3c]
	ldrh r2, [r1, #0x22]
	adds r0, r0, r2
	strh r0, [r1, #0x22]
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0810DE54
	adds r0, r1, #0
	bl DestroyAnimSprite
_0810DE54:
	pop {r0}
	bx r0
	thumb_func_end sub_0810DE2C

	thumb_func_start sub_0810DE58
sub_0810DE58: @ 0x0810DE58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0810DEA4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810DEB4
	ldr r4, _0810DEA8
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
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	ldr r0, _0810DEAC
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
	ldr r0, _0810DEB0
	b _0810DED0
	.align 2, 0
_0810DEA4: .4byte 0x020380BE
_0810DEA8: .4byte 0x02023EAF
_0810DEAC: .4byte 0x020380D6
_0810DEB0: .4byte 0x020380D7
_0810DEB4:
	ldr r0, _0810DEEC
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
	ldr r0, _0810DEF0
_0810DED0:
	ldrb r0, [r0]
	strh r0, [r5, #0x3c]
	movs r0, #0
	strh r0, [r5, #0x2e]
	movs r0, #0xc
	strh r0, [r5, #0x30]
	movs r0, #8
	strh r0, [r5, #0x32]
	ldr r0, _0810DEF4
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DEEC: .4byte 0x020380D7
_0810DEF0: .4byte 0x020380D6
_0810DEF4: .4byte 0x0810DEF9
	thumb_func_end sub_0810DE58

	thumb_func_start sub_0810DEF8
sub_0810DEF8: @ 0x0810DEF8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb4
	bne _0810DF54
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl InitAnimLinearTranslation
	ldr r1, _0810DF5C
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810DF60
	str r0, [r4, #0x1c]
_0810DF54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810DF5C: .4byte 0x080A6015
_0810DF60: .4byte 0x080A6861
	thumb_func_end sub_0810DEF8

	thumb_func_start sub_0810DF64
sub_0810DF64: @ 0x0810DF64
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0810DFB0
	ldrh r0, [r4]
	strh r0, [r5, #0x20]
	movs r2, #0x78
	strh r2, [r5, #0x22]
	ldrh r0, [r4, #6]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	adds r0, #0x36
	adds r1, r5, #0
	adds r1, #0x38
	lsls r2, r2, #8
	bl StorePointerInVars
	ldrh r0, [r4, #2]
	strh r0, [r5, #0x3a]
	ldrh r2, [r5, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	movs r3, #4
	ldrsh r0, [r4, r3]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, _0810DFB4
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0810DFB8
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	ldr r0, _0810DFBC
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DFB0: .4byte 0x020380BE
_0810DFB4: .4byte 0x000003FF
_0810DFB8: .4byte 0xFFFFFC00
_0810DFBC: .4byte 0x0810DFC1
	thumb_func_end sub_0810DF64

	thumb_func_start sub_0810DFC0
sub_0810DFC0: @ 0x0810DFC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _0810E012
	movs r2, #0x36
	ldrsh r0, [r7, r2]
	movs r2, #0x38
	ldrsh r1, [r7, r2]
	bl LoadPointerFromVars
	adds r4, r0, #0
	movs r1, #0x3a
	ldrsh r0, [r7, r1]
	subs r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x36
	adds r1, r7, #0
	adds r1, #0x38
	adds r2, r4, #0
	bl StorePointerInVars
	asrs r4, r4, #8
	strh r4, [r7, #0x22]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #8
	rsbs r0, r0, #0
	cmp r4, r0
	bge _0810E00A
	adds r0, r7, #0
	bl DestroyAnimSprite
	b _0810E068
_0810E00A:
	ldrh r0, [r7, #0x2e]
	subs r0, #1
	strh r0, [r7, #0x2e]
	b _0810E068
_0810E012:
	ldr r4, _0810E074
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r2, _0810E078
	mov r8, r2
	ldrb r0, [r2]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	subs r4, r4, r6
	strh r4, [r7, #0x2e]
	lsrs r0, r0, #0x18
	subs r0, r0, r5
	strh r0, [r7, #0x30]
	ldrh r0, [r7, #0x20]
	lsls r0, r0, #4
	strh r0, [r7, #0x32]
	ldrh r0, [r7, #0x22]
	lsls r0, r0, #4
	strh r0, [r7, #0x34]
	ldr r0, _0810E07C
	str r0, [r7, #0x1c]
_0810E068:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E074: .4byte 0x020380D6
_0810E078: .4byte 0x020380D7
_0810E07C: .4byte 0x0810E081
	thumb_func_end sub_0810DFC0

	thumb_func_start sub_0810E080
sub_0810E080: @ 0x0810E080
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x32]
	adds r0, r0, r1
	strh r0, [r2, #0x32]
	ldrh r1, [r2, #0x30]
	ldrh r3, [r2, #0x34]
	adds r1, r1, r3
	strh r1, [r2, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #0x20]
	lsls r1, r1, #0x10
	asrs r3, r1, #0x14
	strh r3, [r2, #0x22]
	adds r0, #8
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0810E0BA
	adds r1, r3, #0
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0810E0BA
	cmp r1, #0x78
	ble _0810E0C0
_0810E0BA:
	adds r0, r2, #0
	bl DestroyAnimSprite
_0810E0C0:
	pop {r0}
	bx r0
	thumb_func_end sub_0810E080

	thumb_func_start sub_0810E0C4
sub_0810E0C4: @ 0x0810E0C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0810E0F8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810E108
	ldr r4, _0810E0FC
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
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	ldr r0, _0810E100
	ldrb r4, [r0]
	ldr r0, _0810E104
	b _0810E10E
	.align 2, 0
_0810E0F8: .4byte 0x020380BE
_0810E0FC: .4byte 0x02023EAF
_0810E100: .4byte 0x020380D7
_0810E104: .4byte 0x020380D6
_0810E108:
	ldr r0, _0810E140
	ldrb r4, [r0]
	ldr r0, _0810E144
_0810E10E:
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
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E148
	ldrb r2, [r5, #3]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1b
	movs r0, #8
	orrs r1, r0
	lsls r1, r1, #1
	subs r0, #0x47
	b _0810E162
	.align 2, 0
_0810E140: .4byte 0x020380D6
_0810E144: .4byte 0x020380D7
_0810E148:
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810E168
	ldrb r2, [r5, #3]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1b
	movs r0, #0x18
	orrs r1, r0
	lsls r1, r1, #1
	subs r0, #0x57
_0810E162:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #3]
_0810E168:
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	adds r0, r4, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x22]
	strh r0, [r5, #0x34]
	adds r0, r4, #0
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl InitAnimLinearTranslation
	ldr r1, _0810E1A8
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _0810E1AC
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E1A8: .4byte 0x080A34C5
_0810E1AC: .4byte 0x080A6861
	thumb_func_end sub_0810E0C4

	thumb_func_start sub_0810E1B0
sub_0810E1B0: @ 0x0810E1B0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0810E1C6
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810E1C6:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0810E1B0

	thumb_func_start sub_0810E1D4
sub_0810E1D4: @ 0x0810E1D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _0810E250
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
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	ldr r1, _0810E254
	ldrh r0, [r1, #6]
	strh r0, [r5, #0x30]
	ldrh r0, [r1]
	strh r0, [r5, #0x32]
	ldrh r0, [r1, #2]
	strh r0, [r5, #0x34]
	ldrh r0, [r1, #4]
	strh r0, [r5, #0x36]
	ldr r0, _0810E258
	ldrb r6, [r0]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810E21E
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0810E21E:
	movs r0, #1
	ands r6, r0
	cmp r6, #0
	beq _0810E232
	ldrh r0, [r5, #0x32]
	rsbs r0, r0, #0
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
_0810E232:
	ldrh r1, [r5, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
	ldrh r0, [r5, #0x32]
	strh r0, [r5, #0x24]
	ldrh r0, [r5, #0x34]
	strh r0, [r5, #0x26]
	ldr r0, _0810E25C
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E250: .4byte 0x020380D7
_0810E254: .4byte 0x020380BE
_0810E258: .4byte 0x020380D2
_0810E25C: .4byte 0x0810E1B1
	thumb_func_end sub_0810E1D4

	thumb_func_start sub_0810E260
sub_0810E260: @ 0x0810E260
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0810E278
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0810E27C
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	b _0810E284
	.align 2, 0
_0810E278: .4byte 0x020380BE
_0810E27C:
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
_0810E284:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E298
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
	b _0810E2AE
_0810E298:
	ldr r0, _0810E2C0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0810E2AE
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
_0810E2AE:
	ldr r0, _0810E2C4
	str r0, [r4, #0x1c]
	ldr r1, _0810E2C8
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E2C0: .4byte 0x020380D6
_0810E2C4: .4byte 0x080A60A1
_0810E2C8: .4byte 0x080A34C5
	thumb_func_end sub_0810E260

	thumb_func_start sub_0810E2CC
sub_0810E2CC: @ 0x0810E2CC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0810E306
	ldrh r0, [r4, #0x30]
	adds r0, #0x28
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #2
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0810E306
	adds r0, r4, #0
	bl DestroyAnimSprite
_0810E306:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0810E2CC

	thumb_func_start sub_0810E30C
sub_0810E30C: @ 0x0810E30C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0810E33C
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0810E344
	cmp r0, #1
	bgt _0810E35E
	cmp r0, #0
	bne _0810E35E
	movs r0, #0
	bl sub_080A6674
	ldr r0, _0810E340
	ldrh r0, [r0]
	strh r0, [r4, #0x18]
	b _0810E356
	.align 2, 0
_0810E33C: .4byte 0x03005B60
_0810E340: .4byte 0x020380BE
_0810E344:
	ldrh r0, [r4, #0x18]
	subs r0, #1
	strh r0, [r4, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0810E36A
_0810E356:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0810E36A
_0810E35E:
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r1, [r4, #0x1a]
	adds r0, r0, r1
	strh r0, [r4, #0x1a]
_0810E36A:
	movs r2, #0xb0
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	strh r0, [r4, #0x1c]
	ldr r0, _0810E398
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0810E3A0
	ldr r1, _0810E39C
	ldrh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	adds r7, r1, #0
	b _0810E3B0
	.align 2, 0
_0810E398: .4byte 0x020380D7
_0810E39C: .4byte 0x02022AD4
_0810E3A0:
	ldr r2, _0810E3F0
	ldrh r1, [r4, #0x1a]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r2]
	adds r7, r2, #0
_0810E3B0:
	ldr r3, _0810E3F4
	ldrh r2, [r4, #0x1c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	movs r0, #0xff
	ldrb r1, [r4, #0x1a]
	movs r5, #0
	strh r1, [r4, #0x1a]
	ands r0, r2
	strh r0, [r4, #0x1c]
	ldr r0, _0810E3F8
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0810E3E8
	strh r5, [r7]
	strh r5, [r3]
	movs r0, #1
	bl sub_080A6674
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_0810E3E8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E3F0: .4byte 0x02022AD4
_0810E3F4: .4byte 0x02022AD6
_0810E3F8: .4byte 0x020380BE
	thumb_func_end sub_0810E30C

