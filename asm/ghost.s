.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08111E5C
sub_08111E5C: @ 0x08111E5C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _08111EB8
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	ldr r5, _08111EBC
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl sub_080A689C
	ldr r0, _08111EC0
	str r0, [r4, #0x1c]
	movs r0, #0x10
	strh r0, [r4, #0x3a]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldrh r1, [r4, #0x3a]
	movs r0, #0x52
	bl SetGpuReg
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111EB8: .4byte 0x020380BE
_08111EBC: .4byte 0x020380D7
_08111EC0: .4byte 0x08111EC5
	thumb_func_end sub_08111E5C

	thumb_func_start sub_08111EC4
sub_08111EC4: @ 0x08111EC4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08111FB4
	adds r0, r4, #0
	bl AnimTranslateLinear
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08111EE4
	ldr r0, _08111EE0
	str r0, [r4, #0x1c]
	b _08111F2E
	.align 2, 0
_08111EE0: .4byte 0x08111F39
_08111EE4:
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0xf
	bl Cos
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r2, [r4, #0x38]
	adds r0, r2, #5
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x38]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0
	beq _08111F1C
	cmp r2, #0xc4
	ble _08111F2E
_08111F1C:
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08111F2E
	ldr r0, _08111F34
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xc4
	bl PlaySE12WithPanning
_08111F2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111F34: .4byte 0x020380E0
	thumb_func_end sub_08111EC4

	thumb_func_start sub_08111F38
sub_08111F38: @ 0x08111F38
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl AnimTranslateLinear
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Sin
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0xf
	bl Cos
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r2, [r4, #0x38]
	adds r0, r2, #5
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x38]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0
	beq _08111F7E
	cmp r2, #0xc4
	ble _08111F8A
_08111F7E:
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08111F8A
	movs r0, #0xc4
	bl PlaySE
_08111F8A:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08111FA8
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08111FA4
	str r0, [r4, #0x1c]
	b _08111FAE
	.align 2, 0
_08111FA4: .4byte 0x080A60BD
_08111FA8:
	adds r0, r4, #0
	bl sub_08111FB4
_08111FAE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08111F38

	thumb_func_start sub_08111FB4
sub_08111FB4: @ 0x08111FB4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x3a]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0xff
	ble _08111FD8
	adds r0, r2, #1
	strh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	ldr r1, _08111FD4
	cmp r0, r1
	bne _0811203E
	movs r0, #0
	b _0811203C
	.align 2, 0
_08111FD4: .4byte 0x010D0000
_08111FD8:
	ldrh r1, [r4, #0x3c]
	adds r3, r1, #1
	strh r3, [r4, #0x3c]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	bne _0811203E
	ldr r1, _08111FFC
	ands r1, r3
	strh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08112000
	adds r0, r2, #1
	b _08112002
	.align 2, 0
_08111FFC: .4byte 0xFFFFFF00
_08112000:
	subs r0, r2, #1
_08112002:
	strh r0, [r4, #0x3a]
	ldrh r0, [r4, #0x3a]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08112024
	cmp r0, #0x10
	bne _08112030
_08112024:
	ldrh r0, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4, #0x3c]
_08112030:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0811203E
	movs r0, #0x80
	lsls r0, r0, #1
_0811203C:
	strh r0, [r4, #0x3a]
_0811203E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08111FB4

	thumb_func_start sub_08112044
sub_08112044: @ 0x08112044
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r1, _08112060
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08112060: .4byte 0x08112065
	thumb_func_end sub_08112044

	thumb_func_start sub_08112064
sub_08112064: @ 0x08112064
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #0x20
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	subs r0, #0x41
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x82
	bhi _08112098
	ldrb r0, [r4, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #8
	b _081120A2
_08112098:
	ldrb r0, [r4, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #4
_081120A2:
	orrs r1, r0
	strb r1, [r4, #5]
	ldrh r0, [r4, #0x2e]
	adds r0, #0x13
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x32]
	adds r0, #0x50
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3d
	bne _081120D4
	adds r0, r4, #0
	bl DestroyAnimSprite
_081120D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08112064

	thumb_func_start sub_081120DC
sub_081120DC: @ 0x081120DC
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #1
	bl PrepareBattlerSpriteForRotScale
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x80
	movs r3, #0
	bl SetSpriteRotScale
	ldr r1, _08112154
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldr r1, _08112158
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0x80
	strh r1, [r0, #8]
	ldr r1, _0811215C
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	strh r2, [r0, #0xc]
	movs r1, #0x10
	strh r1, [r0, #0xe]
	ldr r1, _08112160
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08112154: .4byte 0x020205AC
_08112158: .4byte 0x03005B60
_0811215C: .4byte 0x020380BE
_08112160: .4byte 0x08112165
	thumb_func_end sub_081120DC

	thumb_func_start sub_08112164
sub_08112164: @ 0x08112164
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081121B4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _081121AC
	movs r0, #0
	strh r0, [r4, #0x1c]
	ldrh r1, [r4, #0xc]
	adds r1, #1
	strh r1, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bne _081121AC
	ldr r0, _081121B8
	str r0, [r4]
_081121AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081121B4: .4byte 0x03005B60
_081121B8: .4byte 0x081121BD
	thumb_func_end sub_08112164

	thumb_func_start sub_081121BC
sub_081121BC: @ 0x081121BC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _081121E0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _081121E4
	subs r0, r1, #1
	strh r0, [r4, #0xa]
	b _08112228
	.align 2, 0
_081121E0: .4byte 0x03005B60
_081121E4:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrh r0, [r4, #8]
	adds r0, #8
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	bgt _0811220C
	movs r0, #8
	ldrsh r2, [r4, r0]
	adds r0, r1, #0
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	b _08112228
_0811220C:
	adds r0, r1, #0
	bl ResetSpriteRotScale
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
_08112228:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081121BC

	thumb_func_start InitAnimShadowBall
InitAnimShadowBall: @ 0x08112230
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	ldrh r5, [r4, #0x20]
	ldrh r6, [r4, #0x22]
	ldr r0, _081122CC
	mov r8, r0
	ldrb r0, [r0]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	mov sb, r1
	strh r0, [r4, #0x20]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	mov r1, sb
	strh r1, [r4, #0x2e]
	ldr r2, _081122D0
	ldrh r1, [r2]
	strh r1, [r4, #0x30]
	ldrh r1, [r2, #2]
	strh r1, [r4, #0x32]
	ldrh r1, [r2, #4]
	strh r1, [r4, #0x34]
	ldrh r1, [r4, #0x20]
	lsls r1, r1, #4
	strh r1, [r4, #0x36]
	lsls r0, r0, #4
	strh r0, [r4, #0x38]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	subs r5, r5, r0
	lsls r5, r5, #4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r1, r1, #1
	adds r0, r5, #0
	str r2, [sp]
	bl __divsi3
	strh r0, [r4, #0x3a]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	subs r6, r6, r0
	lsls r6, r6, #4
	ldr r2, [sp]
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r1, r1, #1
	adds r0, r6, #0
	bl __divsi3
	strh r0, [r4, #0x3c]
	ldr r0, _081122D4
	str r0, [r4, #0x1c]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081122CC: .4byte 0x020380D6
_081122D0: .4byte 0x020380BE
_081122D4: .4byte 0x081122D9
	thumb_func_end InitAnimShadowBall

	thumb_func_start AnimShadowBallStep
AnimShadowBallStep: @ 0x081122D8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _08112322
	cmp r0, #1
	bgt _081122EE
	cmp r0, #0
	beq _081122F8
	b _081123E6
_081122EE:
	cmp r0, #2
	beq _0811238C
	cmp r0, #3
	beq _081123E0
	b _081123E6
_081122F8:
	ldrh r0, [r5, #0x3a]
	ldrh r2, [r5, #0x36]
	adds r0, r0, r2
	strh r0, [r5, #0x36]
	ldrh r1, [r5, #0x3c]
	ldrh r2, [r5, #0x38]
	adds r1, r1, r2
	strh r1, [r5, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r5, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r5, #0x22]
	ldrh r0, [r5, #0x30]
	subs r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _081123E6
	b _081123D2
_08112322:
	ldrh r0, [r5, #0x32]
	subs r0, #1
	strh r0, [r5, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _081123E6
	ldr r4, _08112388
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x30]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x20]
	lsls r0, r0, #4
	strh r0, [r5, #0x36]
	ldrh r0, [r5, #0x22]
	lsls r0, r0, #4
	strh r0, [r5, #0x38]
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	movs r2, #0x20
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	lsls r0, r0, #4
	movs r2, #0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, #0x3a]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r2, #0x22
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	lsls r0, r0, #4
	movs r2, #0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, #0x3c]
	b _081123D2
	.align 2, 0
_08112388: .4byte 0x020380D7
_0811238C:
	ldrh r0, [r5, #0x3a]
	ldrh r1, [r5, #0x36]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
	ldrh r1, [r5, #0x3c]
	ldrh r2, [r5, #0x38]
	adds r1, r1, r2
	strh r1, [r5, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r5, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r5, #0x22]
	ldrh r0, [r5, #0x34]
	subs r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _081123E6
	ldr r4, _081123DC
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
_081123D2:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _081123E6
	.align 2, 0
_081123DC: .4byte 0x020380D7
_081123E0:
	adds r0, r5, #0
	bl DestroySpriteAndMatrix
_081123E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end AnimShadowBallStep

	thumb_func_start sub_081123EC
sub_081123EC: @ 0x081123EC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
	ldr r0, _08112400
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08112400: .4byte 0x08112405
	thumb_func_end sub_081123EC

	thumb_func_start sub_08112404
sub_08112404: @ 0x08112404
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r5, #0
	movs r6, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0811249A
	adds r1, r3, #0
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #4
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	bne _0811242E
	movs r0, #4
	orrs r0, r2
	strb r0, [r4]
_0811242E:
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0811243E
	cmp r0, #1
	beq _08112448
	movs r6, #1
	b _08112452
_0811243E:
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	cmp r0, #2
	bne _08112452
	b _08112456
_08112448:
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	cmp r0, #4
	bne _08112452
	movs r5, #1
_08112452:
	cmp r5, #0
	beq _08112488
_08112456:
	ldrb r2, [r4]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r3, #0x32]
	adds r0, #1
	movs r1, #0
	strh r0, [r3, #0x32]
	strh r1, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0811249A
	strh r1, [r3, #0x32]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	b _0811249A
_08112488:
	cmp r6, #0
	beq _08112494
	adds r0, r3, #0
	bl DestroyAnimSprite
	b _0811249A
_08112494:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
_0811249A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08112404

	thumb_func_start sub_081124A0
sub_081124A0: @ 0x081124A0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081124CC
	adds r5, r0, r1
	movs r0, #1
	bl CloneBattlerSpriteWithBlend
	movs r6, #0
	movs r1, #0
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _081124D0
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _081125AC
	.align 2, 0
_081124CC: .4byte 0x03005B60
_081124D0:
	strh r1, [r5, #0xa]
	movs r0, #0xf
	strh r0, [r5, #0xc]
	movs r0, #2
	strh r0, [r5, #0xe]
	strh r1, [r5, #0x10]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldrh r1, [r5, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r5, #0xc]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldr r4, _08112538
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x50
	strh r1, [r0, #0x2e]
	ldr r0, _0811253C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08112544
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08112540
	strh r1, [r0, #0x30]
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x70
	b _08112562
	.align 2, 0
_08112538: .4byte 0x020205AC
_0811253C: .4byte 0x020380D7
_08112540: .4byte 0x0000FF70
_08112544:
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x90
	strh r1, [r0, #0x30]
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _081125B4
_08112562:
	strh r1, [r0, #0x32]
	ldr r4, _081125B8
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0
	strh r2, [r0, #0x34]
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x36]
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _081125BC
	bl StoreSpriteCallbackInData6
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _081125C0
	str r1, [r0]
	ldr r0, _081125C4
	str r0, [r5]
_081125AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081125B4: .4byte 0x0000FF90
_081125B8: .4byte 0x020205AC
_081125BC: .4byte 0x08007141
_081125C0: .4byte 0x080A5E35
_081125C4: .4byte 0x081125C9
	thumb_func_end sub_081124A0

	thumb_func_start sub_081125C8
sub_081125C8: @ 0x081125C8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081125EC
	adds r4, r0, r1
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0811266C
	cmp r0, #1
	bgt _081125F0
	cmp r0, #0
	beq _081125F6
	b _08112698
	.align 2, 0
_081125EC: .4byte 0x03005B60
_081125F0:
	cmp r0, #2
	beq _08112692
	b _08112698
_081125F6:
	ldrh r1, [r4, #0xa]
	adds r1, #1
	strh r1, [r4, #0xa]
	movs r0, #3
	ands r0, r1
	strh r0, [r4, #0x12]
	cmp r0, #1
	bne _08112614
	ldrh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08112614
	subs r0, r1, #1
	strh r0, [r4, #0xc]
_08112614:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne _0811262A
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	bgt _0811262A
	adds r0, r1, #1
	strh r0, [r4, #0xe]
_0811262A:
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0xc]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, [r4, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xd
	cmp r1, r0
	bne _08112698
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble _08112698
	movs r2, #8
	ldrsh r1, [r4, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08112668
	adds r0, r0, r1
	bl obj_delete_but_dont_free_vram
	movs r0, #1
	strh r0, [r4, #0x10]
	b _08112698
	.align 2, 0
_08112668: .4byte 0x020205AC
_0811266C:
	ldrh r0, [r4, #0x14]
	adds r0, #1
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08112698
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	b _08112698
_08112692:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08112698:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081125C8

	thumb_func_start sub_081126A0
sub_081126A0: @ 0x081126A0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r2, _081126C0
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1, #0x26]
	ldr r2, _081126C4
	str r2, [r1]
	bl _call_via_r2
	thumb_func_end sub_081126A0

	thumb_func_start sub_081126BC
sub_081126BC: @ 0x081126BC
	pop {r0}
	bx r0
	.align 2, 0
_081126C0: .4byte 0x03005B60
_081126C4: .4byte 0x081126C9
	thumb_func_end sub_081126BC

	thumb_func_start sub_081126C8
sub_081126C8: @ 0x081126C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08112700
	adds r5, r0, r1
	ldr r0, _08112704
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r1, #0x26
	ldrsh r0, [r5, r1]
	cmp r0, #4
	bls _081126F4
	b _08112916
_081126F4:
	lsls r0, r0, #2
	ldr r1, _08112708
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112700: .4byte 0x03005B60
_08112704: .4byte 0x020380D7
_08112708: .4byte 0x0811270C
_0811270C: @ jump table
	.4byte _08112720 @ case 0
	.4byte _08112820 @ case 1
	.4byte _08112864 @ case 2
	.4byte _081128CC @ case 3
	.4byte _081128F8 @ case 4
_08112720:
	ldr r7, _08112758
	adds r0, r7, #0
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	mov r8, r2
	strh r0, [r5, #0x24]
	cmp r0, #0xff
	beq _0811274E
	cmp r0, #0xf
	beq _0811274E
	movs r0, #1
	bl CloneBattlerSpriteWithBlend
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0811275C
	adds r0, r7, #0
	bl FreeSpritePaletteByTag
_0811274E:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _0811291C
	.align 2, 0
_08112758: .4byte 0x00002771
_0811275C:
	ldr r4, _08112808
	movs r1, #8
	ldrsh r0, [r5, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r2, [r5, #0x24]
	lsls r2, r2, #4
	ldrb r3, [r1, #5]
	movs r0, #0xf
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
	movs r2, #8
	ldrsh r0, [r5, r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r2, [r1, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	movs r1, #8
	ldrsh r0, [r5, r1]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	ldr r0, _0811280C
	ldr r1, [r0]
	ldr r0, _08112810
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r1, r1, #0x1f
	adds r2, #0x3e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	mov r2, r8
	strh r2, [r5, #0xa]
	strh r2, [r5, #0xc]
	movs r0, #0x10
	strh r0, [r5, #0xe]
	movs r0, #1
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x22]
	movs r0, #0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	adds r0, #0x10
	lsls r0, r0, #4
	strh r0, [r5, #0x10]
	cmp r6, #1
	bne _08112814
	movs r1, #0x80
	lsls r1, r1, #2
	b _08112818
	.align 2, 0
_08112808: .4byte 0x020205AC
_0811280C: .4byte 0x02024174
_08112810: .4byte 0x020380D7
_08112814:
	movs r1, #0x80
	lsls r1, r1, #3
_08112818:
	movs r0, #0
	bl ClearGpuRegBits
	b _08112916
_08112820:
	movs r1, #0x24
	ldrsh r0, [r5, r1]
	adds r0, #0x10
	lsls r0, r0, #4
	strh r0, [r5, #0x24]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	ldr r1, _08112854
	adds r0, r0, r1
	movs r2, #0x24
	ldrsh r1, [r5, r2]
	lsls r1, r1, #1
	ldr r2, _08112858
	adds r1, r1, r2
	ldr r2, _0811285C
	bl CpuSet
	ldrh r0, [r5, #0x10]
	ldr r3, _08112860
	movs r1, #0x10
	movs r2, #0xa
	bl BlendPalette
	b _08112916
	.align 2, 0
_08112854: .4byte 0x020373B4
_08112858: .4byte 0x020377B4
_0811285C: .4byte 0x04000008
_08112860: .4byte 0x00003C0D
_08112864:
	ldr r2, _081128A0
	movs r0, #0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	ldrh r0, [r0, #0x22]
	adds r1, r1, r0
	subs r1, #0x20
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r1, #0
	bge _08112884
	movs r2, #0
_08112884:
	cmp r6, #1
	bne _081128A4
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	str r2, [sp]
	movs r2, #4
	str r2, [sp, #4]
	str r6, [sp, #8]
	b _081128BC
	.align 2, 0
_081128A0: .4byte 0x020205AC
_081128A4:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
_081128BC:
	movs r2, #2
	movs r3, #6
	bl ScanlineEffect_InitWave
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x1c]
	b _08112916
_081128CC:
	cmp r6, #1
	bne _081128E0
	ldr r1, _081128DC
	movs r0, #0x50
	bl SetGpuReg
	b _081128E8
	.align 2, 0
_081128DC: .4byte 0x00003F42
_081128E0:
	ldr r1, _081128F4
	movs r0, #0x50
	bl SetGpuReg
_081128E8:
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	b _08112916
	.align 2, 0
_081128F4: .4byte 0x00003F44
_081128F8:
	cmp r6, #1
	bne _08112908
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #0
	bl SetGpuRegBits
	b _08112912
_08112908:
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl SetGpuRegBits
_08112912:
	ldr r0, _08112928
	str r0, [r5]
_08112916:
	ldrh r0, [r5, #0x26]
	adds r0, #1
	strh r0, [r5, #0x26]
_0811291C:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112928: .4byte 0x0811292D
	thumb_func_end sub_081126C8

	thumb_func_start sub_0811292C
sub_0811292C: @ 0x0811292C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081129B4
	adds r4, r0, r1
	ldrh r1, [r4, #0xa]
	adds r1, #1
	strh r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	strh r0, [r4, #0x12]
	cmp r0, #0
	bne _08112964
	ldr r1, _081129B8
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x12
	bl __divsi3
	strh r0, [r4, #0xc]
_08112964:
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bne _08112986
	ldr r1, _081129B8
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x12
	bl __divsi3
	movs r1, #0x10
	subs r1, r1, r0
	strh r1, [r4, #0xe]
_08112986:
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0xc]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0x80
	bne _081129AE
	movs r0, #0
	strh r0, [r4, #0x26]
	ldr r1, _081129BC
	str r1, [r4]
	adds r0, r5, #0
	bl _call_via_r1
_081129AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081129B4: .4byte 0x03005B60
_081129B8: .4byte 0x082FA8CC
_081129BC: .4byte 0x081129C1
	thumb_func_end sub_0811292C

	thumb_func_start sub_081129C0
sub_081129C0: @ 0x081129C0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081129F0
	adds r4, r0, r1
	ldr r0, _081129F4
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08112A2C
	cmp r0, #1
	bgt _081129F8
	cmp r0, #0
	beq _081129FE
	b _08112AA8
	.align 2, 0
_081129F0: .4byte 0x03005B60
_081129F4: .4byte 0x020380D7
_081129F8:
	cmp r0, #2
	beq _08112A40
	b _08112AA8
_081129FE:
	ldr r1, _08112A1C
	movs r0, #3
	strb r0, [r1, #0x15]
	movs r0, #1
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	cmp r6, #1
	bne _08112A20
	movs r1, #0x80
	lsls r1, r1, #2
	b _08112A24
	.align 2, 0
_08112A1C: .4byte 0x020397C8
_08112A20:
	movs r1, #0x80
	lsls r1, r1, #3
_08112A24:
	movs r0, #0
	bl ClearGpuRegBits
	b _08112AA8
_08112A2C:
	ldrh r0, [r4, #0x10]
	ldr r3, _08112A3C
	movs r1, #0x10
	movs r2, #0
	bl BlendPalette
	b _08112AA8
	.align 2, 0
_08112A3C: .4byte 0x00003C0D
_08112A40:
	ldr r3, _08112A90
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	bl obj_delete_but_dont_free_vram
	ldr r0, _08112A94
	bl FreeSpritePaletteByTag
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	cmp r6, #1
	bne _08112A98
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #0
	bl SetGpuRegBits
	b _08112AA2
	.align 2, 0
_08112A90: .4byte 0x020205AC
_08112A94: .4byte 0x00002771
_08112A98:
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl SetGpuRegBits
_08112AA2:
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08112AA8:
	ldrh r0, [r4, #0x26]
	adds r0, #1
	strh r0, [r4, #0x26]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081129C0

	thumb_func_start sub_08112AB4
sub_08112AB4: @ 0x08112AB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, _08112AF0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08112AFC
	ldr r4, _08112AF4
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	movs r2, #0xe0
	lsls r2, r2, #0xd
	adds r0, r0, r2
	lsrs r5, r0, #0x10
	ldr r4, _08112AF8
	b _08112B20
	.align 2, 0
_08112AF0: .4byte 0x020380BE
_08112AF4: .4byte 0x020380D6
_08112AF8: .4byte 0x020380D7
_08112AFC:
	ldr r4, _08112BC4
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	movs r2, #0xe0
	lsls r2, r2, #0xd
	adds r0, r0, r2
	lsrs r5, r0, #0x10
	ldr r4, _08112BC8
_08112B20:
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	movs r1, #0xe0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r8, r5
	mov r2, sb
	subs r4, r2, r5
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r6, #4
	strh r0, [r7, #0x2e]
	lsls r0, r5, #4
	strh r0, [r7, #0x30]
	mov r1, sl
	subs r0, r1, r6
	lsls r0, r0, #4
	ldr r5, _08112BCC
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r7, #0x32]
	lsls r4, r4, #0x10
	asrs r4, r4, #0xc
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r7, #0x34]
	ldrh r0, [r5, #2]
	strh r0, [r7, #0x36]
	mov r1, sl
	strh r1, [r7, #0x38]
	mov r2, sb
	strh r2, [r7, #0x3a]
	movs r1, #0x36
	ldrsh r0, [r7, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r7, #0x3c]
	ldrb r1, [r7, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r7, #5]
	strh r6, [r7, #0x20]
	mov r2, r8
	strh r2, [r7, #0x22]
	ldr r0, _08112BD0
	str r0, [r7, #0x1c]
	adds r2, r7, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112BC4: .4byte 0x020380D7
_08112BC8: .4byte 0x020380D6
_08112BCC: .4byte 0x020380BE
_08112BD0: .4byte 0x08112BD5
	thumb_func_end sub_08112AB4

	thumb_func_start sub_08112BD4
sub_08112BD4: @ 0x08112BD4
	push {r4, lr}
	adds r2, r0, #0
	ldrh r3, [r2, #0x36]
	movs r1, #0x36
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _08112C0C
	ldrh r0, [r2, #0x32]
	ldrh r4, [r2, #0x2e]
	adds r0, r0, r4
	strh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x34]
	ldrh r4, [r2, #0x30]
	adds r1, r1, r4
	strh r1, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #0x20]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r2, #0x22]
	subs r0, r3, #1
	strh r0, [r2, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _08112C0C
	strh r0, [r2, #0x2e]
_08112C0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08112BD4

	thumb_func_start sub_08112C14
sub_08112C14: @ 0x08112C14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08112D64
	adds r1, r1, r0
	str r1, [sp]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0
	ldr r1, [sp]
	strh r0, [r1, #0x12]
	strh r0, [r1, #0x14]
	strh r0, [r1, #0x16]
	strh r0, [r1, #0x18]
	movs r0, #0x10
	strh r0, [r1, #0x1a]
	ldr r2, _08112D68
	ldrh r0, [r2]
	strh r0, [r1, #0x1c]
	ldr r4, _08112D6C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08112C84
	b _08112D80
_08112C84:
	movs r4, #0
_08112C86:
	lsls r1, r4, #0x10
	asrs r3, r1, #0x10
	ldr r0, _08112D6C
	ldrb r2, [r0]
	str r1, [sp, #0x10]
	cmp r3, r2
	beq _08112D52
	movs r0, #2
	eors r2, r0
	cmp r3, r2
	beq _08112D52
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08112D52
	ldr r6, [sp, #4]
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r7, r0, #0x10
	ldr r0, _08112D70
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0x37
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x40
	beq _08112D52
	adds r0, r4, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	adds r0, r4, #0
	movs r1, #3
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r0, r8
	lsls r5, r0, #4
	add r5, r8
	lsls r5, r5, #2
	ldr r1, _08112D74
	adds r4, r5, r1
	lsls r0, r6, #4
	strh r0, [r4, #0x2e]
	lsls r0, r7, #4
	strh r0, [r4, #0x30]
	mov r2, sl
	subs r0, r2, r6
	lsls r0, r0, #4
	ldr r3, _08112D68
	movs r2, #2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, #0x32]
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #4
	ldr r2, _08112D68
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, #0x34]
	ldr r1, _08112D68
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x36]
	mov r2, sl
	strh r2, [r4, #0x38]
	mov r3, sb
	strh r3, [r4, #0x3a]
	ldr r0, _08112D78
	adds r5, r5, r0
	ldr r0, _08112D7C
	str r0, [r5]
	ldr r2, [sp]
	movs r3, #0x20
	ldrsh r1, [r2, r3]
	adds r1, #0xd
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #8
	adds r0, r0, r1
	mov r1, r8
	strh r1, [r0]
	ldrh r0, [r2, #0x20]
	adds r0, #1
	strh r0, [r2, #0x20]
_08112D52:
	ldr r2, [sp, #0x10]
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r2, r3
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _08112C86
	b _08112E04
	.align 2, 0
_08112D64: .4byte 0x03005B60
_08112D68: .4byte 0x020380BE
_08112D6C: .4byte 0x020380D6
_08112D70: .4byte 0x0857299C
_08112D74: .4byte 0x020205AC
_08112D78: .4byte 0x020205C8
_08112D7C: .4byte 0x08112BD5
_08112D80:
	ldr r0, _08112E1C
	ldr r7, [sp, #4]
	ldr r2, [sp, #8]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #0xc]
	adds r1, r7, #0
	ldr r2, [sp, #0xc]
	movs r3, #0x37
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x40
	beq _08112E04
	movs r3, #0x30
	mov sl, r3
	movs r0, #0x28
	mov sb, r0
	ldr r6, _08112E20
	mov r1, r8
	lsls r5, r1, #4
	add r5, r8
	lsls r5, r5, #2
	adds r4, r5, r6
	lsls r0, r7, #4
	strh r0, [r4, #0x2e]
	ldr r2, [sp, #0xc]
	lsls r0, r2, #4
	strh r0, [r4, #0x30]
	subs r0, r3, r7
	lsls r0, r0, #4
	ldr r3, _08112E24
	movs r2, #2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, #0x32]
	mov r3, sb
	ldr r1, [sp, #0xc]
	subs r0, r3, r1
	lsls r0, r0, #4
	ldr r2, _08112E24
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, #0x34]
	ldr r1, _08112E24
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x36]
	mov r2, sl
	strh r2, [r4, #0x38]
	mov r3, sb
	strh r3, [r4, #0x3a]
	adds r6, #0x1c
	adds r5, r5, r6
	ldr r0, _08112E28
	str r0, [r5]
	mov r1, r8
	ldr r0, [sp]
	strh r1, [r0, #0x22]
	movs r0, #1
	ldr r2, [sp]
	strh r0, [r2, #0x20]
_08112E04:
	ldr r0, _08112E2C
	ldr r3, [sp]
	str r0, [r3]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112E1C: .4byte 0x0857299C
_08112E20: .4byte 0x020205AC
_08112E24: .4byte 0x020380BE
_08112E28: .4byte 0x08112BD5
_08112E2C: .4byte 0x08112E31
	thumb_func_end sub_08112C14

	thumb_func_start sub_08112E30
sub_08112E30: @ 0x08112E30
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08112E54
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _08112EE6
	cmp r1, #1
	bgt _08112E58
	cmp r1, #0
	beq _08112E66
	b _08112FA2
	.align 2, 0
_08112E54: .4byte 0x03005B60
_08112E58:
	cmp r1, #2
	bne _08112E5E
	b _08112F78
_08112E5E:
	cmp r1, #3
	bne _08112E64
	b _08112F8C
_08112E64:
	b _08112FA2
_08112E66:
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08112ECC
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08112ECC
	strh r1, [r4, #0x12]
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08112E9C
	ldrh r1, [r4, #0x18]
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	bgt _08112EAA
	adds r0, r1, #1
	strh r0, [r4, #0x18]
	b _08112EAA
_08112E9C:
	ldrh r1, [r4, #0x1a]
	movs r2, #0x1a
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08112EAA
	subs r0, r1, #1
	strh r0, [r4, #0x1a]
_08112EAA:
	ldrh r1, [r4, #0x1a]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	cmp r0, #0x17
	ble _08112ECC
	movs r0, #0
	strh r0, [r4, #0x16]
	movs r0, #1
	strh r0, [r4, #0x14]
_08112ECC:
	ldrh r1, [r4, #0x1c]
	movs r2, #0x1c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08112EDC
	subs r0, r1, #1
	strh r0, [r4, #0x1c]
	b _08112FA2
_08112EDC:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08112FA2
	b _08112F84
_08112EE6:
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08112FA2
	movs r0, #0
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
	ands r0, r1
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08112F16
	ldrh r1, [r4, #0x18]
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08112F24
	subs r0, r1, #1
	strh r0, [r4, #0x18]
	b _08112F24
_08112F16:
	ldrh r1, [r4, #0x1a]
	movs r2, #0x1a
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	bgt _08112F24
	adds r0, r1, #1
	strh r0, [r4, #0x1a]
_08112F24:
	ldrh r1, [r4, #0x1a]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #0xd
	cmp r1, r0
	bne _08112FA2
	movs r5, #0
	b _08112F68
_08112F44:
	adds r1, r5, #0
	adds r1, #0xd
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #8
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08112F74
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08112F68:
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _08112F44
	b _08112F84
	.align 2, 0
_08112F74: .4byte 0x020205AC
_08112F78:
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08112FA2
_08112F84:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08112FA2
_08112F8C:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08112FA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08112E30

	thumb_func_start sub_08112FA8
sub_08112FA8: @ 0x08112FA8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08112FF4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08112FF8
	strh r1, [r0]
	ldr r1, _08112FFC
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _08113000
	movs r0, #0x4a
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0xc8
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0x10
	bl SetGpuReg
	ldr r0, _08113004
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08112FF0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08113008
_08112FF0:
	movs r6, #0x28
	b _0811300A
	.align 2, 0
_08112FF4: .4byte 0x02022AD8
_08112FF8: .4byte 0x02022ADA
_08112FFC: .4byte 0x00003F3F
_08113000: .4byte 0x00003F1F
_08113004: .4byte 0x020380D6
_08113008:
	movs r6, #0xc8
_0811300A:
	ldr r1, _08113048
	lsls r3, r6, #0x10
	asrs r2, r3, #0x10
	lsls r0, r2, #8
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _0811304C
	movs r5, #0x28
	ldr r0, _08113050
	strh r0, [r1]
	lsrs r3, r3, #0x10
	movs r1, #0xf0
	subs r1, r1, r2
	movs r4, #0x48
	ldr r2, _08113054
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r3, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r5, [r0, #0xe]
	strh r4, [r0, #0x10]
	strh r6, [r0, #0x12]
	strh r5, [r0, #0x14]
	ldr r1, _08113058
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08113048: .4byte 0x02022AD8
_0811304C: .4byte 0x02022ADA
_08113050: .4byte 0x00002828
_08113054: .4byte 0x03005B60
_08113058: .4byte 0x0811305D
	thumb_func_end sub_08112FA8

	thumb_func_start sub_0811305C
sub_0811305C: @ 0x0811305C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0811317C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r1, [r4, #8]
	adds r0, r1, #1
	strh r0, [r4, #8]
	ldrh r5, [r4, #0xa]
	ldrh r7, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	mov sl, r0
	ldrh r2, [r4, #0x10]
	str r2, [sp, #0xc]
	ldrh r0, [r4, #0x12]
	ldrh r2, [r4, #0x14]
	mov r8, r2
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	cmp r6, #0xf
	ble _08113098
	b _08113188
_08113098:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl __floatsidf
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl __floatsidf
	ldr r2, _08113180
	ldr r3, _08113184
	bl __muldf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	bl __floatsidf
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	bl __floatsidf
	ldr r2, _08113180
	ldr r3, _08113184
	bl __muldf3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	bl __floatsidf
	adds r5, r1, #0
	adds r4, r0, #0
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl __floatsidf
	ldr r2, _08113180
	ldr r3, _08113184
	bl __muldf3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	bl __floatsidf
	ldr r2, _08113180
	ldr r3, _08113184
	bl __muldf3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _081131B6
	.align 2, 0
_0811317C: .4byte 0x03005B60
_08113180: .4byte 0x3FB00000
_08113184: .4byte 0x00000000
_08113188:
	movs r2, #0
	mov sb, r2
	movs r7, #0xf0
	movs r6, #0
	movs r5, #0x70
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r3, #0
	bl sub_080A6E74
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r6, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _081131D8
	str r0, [r4]
_081131B6:
	ldr r1, _081131DC
	mov r2, sb
	lsls r0, r2, #8
	orrs r7, r0
	strh r7, [r1]
	ldr r1, _081131E0
	lsls r0, r6, #8
	orrs r5, r0
	strh r5, [r1]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081131D8: .4byte 0x081131E5
_081131DC: .4byte 0x02022AD8
_081131E0: .4byte 0x02022ADA
	thumb_func_end sub_0811305C

	thumb_func_start sub_081131E4
sub_081131E4: @ 0x081131E4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08113230
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0811322A
	ldr r0, _08113234
	strh r1, [r0]
	ldr r0, _08113238
	strh r1, [r0]
	ldr r4, _0811323C
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0811322A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113230: .4byte 0x02037C74
_08113234: .4byte 0x02022AD8
_08113238: .4byte 0x02022ADA
_0811323C: .4byte 0x00003F3F
	thumb_func_end sub_081131E4

	thumb_func_start sub_08113240
sub_08113240: @ 0x08113240
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	ldr r0, _0811326C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08113274
	movs r2, #0x18
	ldr r3, _08113270
	ldrb r0, [r4, #3]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r4, #3]
	b _08113278
	.align 2, 0
_0811326C: .4byte 0x020380D6
_08113270: .4byte 0x0000FFFE
_08113274:
	ldr r2, _08113294
	movs r3, #2
_08113278:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	strh r3, [r4, #0x30]
	movs r0, #0x3c
	strh r0, [r4, #0x2e]
	ldr r0, _08113298
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08113294: .4byte 0x0000FFE8
_08113298: .4byte 0x0811329D
	thumb_func_end sub_08113240

	thumb_func_start sub_0811329C
sub_0811329C: @ 0x0811329C
	push {r4, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r3, r2]
	cmp r0, #0
	ble _081132AE
	subs r0, r1, #1
	b _08113312
_081132AE:
	ldrh r0, [r3, #0x30]
	ldrh r4, [r3, #0x24]
	adds r1, r0, r4
	strh r1, [r3, #0x24]
	adds r0, r1, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bls _08113314
	ldrh r0, [r3, #0x20]
	adds r0, r0, r1
	strh r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #0x24]
	ldrh r2, [r3, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #8
	ldr r4, _08113300
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _08113304
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldrh r0, [r3, #0x32]
	adds r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _08113310
	movs r0, #0x1e
	strh r0, [r3, #0x2e]
	ldr r0, _08113308
	str r0, [r3, #0x1c]
	ldr r1, _0811330C
	adds r0, r3, #0
	bl StoreSpriteCallbackInData6
	b _08113314
	.align 2, 0
_08113300: .4byte 0x000003FF
_08113304: .4byte 0xFFFFFC00
_08113308: .4byte 0x080A5D79
_0811330C: .4byte 0x0811331D
_08113310:
	movs r0, #0x28
_08113312:
	strh r0, [r3, #0x2e]
_08113314:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811329C

	thumb_func_start sub_0811331C
sub_0811331C: @ 0x0811331C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08113346
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	strh r5, [r4, #0x30]
	strh r5, [r4, #0x32]
	b _0811338A
_08113346:
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bgt _08113356
	adds r0, r1, #1
	strh r0, [r4, #0x30]
	b _0811338A
_08113356:
	movs r0, #0
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _0811338A
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08113390
	str r0, [r4, #0x1c]
_0811338A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113390: .4byte 0x08113395
	thumb_func_end sub_0811331C

	thumb_func_start sub_08113394
sub_08113394: @ 0x08113394
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	ldr r0, _081133C0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081133C4
	strh r1, [r0]
	adds r0, r4, #0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081133C0: .4byte 0x02022AD8
_081133C4: .4byte 0x02022ADA
	thumb_func_end sub_08113394

	thumb_func_start sub_081133C8
sub_081133C8: @ 0x081133C8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	movs r1, #0xc
	bl Sin
	strh r0, [r5, #0x24]
	ldr r0, _08113430
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081133EC
	ldrh r0, [r5, #0x24]
	rsbs r0, r0, #0
	strh r0, [r5, #0x24]
_081133EC:
	ldrh r0, [r5, #0x2e]
	adds r0, #6
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r5, #0x30]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	strh r0, [r5, #0x26]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08113438
	ldr r0, _08113434
	strh r0, [r5, #0x3a]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldrh r1, [r5, #0x3a]
	movs r0, #0x52
	bl SetGpuReg
	b _08113490
	.align 2, 0
_08113430: .4byte 0x020380D6
_08113434: .4byte 0x0000050B
_08113438:
	cmp r0, #0x1e
	ble _08113490
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	ldrh r1, [r5, #0x3a]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	movs r6, #0xff
	ands r6, r1
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	cmp r7, #0x10
	bls _0811345C
	movs r7, #0x10
_0811345C:
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r0, #0
	bge _08113468
	movs r6, #0
_08113468:
	lsls r4, r7, #8
	orrs r4, r6
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	strh r4, [r5, #0x3a]
	cmp r7, #0x10
	bne _08113490
	cmp r6, #0
	bne _08113490
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08113498
	str r0, [r5, #0x1c]
_08113490:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08113498: .4byte 0x0811349D
	thumb_func_end sub_081133C8

	thumb_func_start sub_0811349C
sub_0811349C: @ 0x0811349C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0811349C

	thumb_func_start sub_081134BC
sub_081134BC: @ 0x081134BC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _08113554
	adds r4, r4, r0
	movs r6, #0
	strh r6, [r4, #8]
	movs r0, #0x10
	mov r8, r0
	mov r0, r8
	strh r0, [r4, #0xa]
	ldr r5, _08113558
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1a]
	ldrb r0, [r5]
	bl GetBattlerYCoordWithElevation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x1c]
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoordAttr
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r1, #8
	strh r1, [r4, #0x1e]
	strh r6, [r4, #0x16]
	ldrb r0, [r5]
	bl GetBattlerSpriteBGPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x12]
	ldrb r0, [r5]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #2
	strh r0, [r4, #0x14]
	strh r6, [r4, #0xe]
	mov r0, r8
	strh r0, [r4, #0x10]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	strh r6, [r4, #0x18]
	ldr r0, _0811355C
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08113554: .4byte 0x03005B60
_08113558: .4byte 0x020380D6
_0811355C: .4byte 0x08113561
	thumb_func_end sub_081134BC

	thumb_func_start sub_08113560
sub_08113560: @ 0x08113560
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _08113584
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bls _0811357A
	b _081136E6
_0811357A:
	lsls r0, r0, #2
	ldr r1, _08113588
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08113584: .4byte 0x03005B60
_08113588: .4byte 0x0811358C
_0811358C: @ jump table
	.4byte _081135A4 @ case 0
	.4byte _08113614 @ case 1
	.4byte _08113656 @ case 2
	.4byte _0811366A @ case 3
	.4byte _081136C0 @ case 4
	.4byte _081136D0 @ case 5
_081135A4:
	movs r6, #0
_081135A6:
	movs r2, #0x1a
	ldrsh r1, [r4, r2]
	movs r0, #0x1c
	ldrsh r2, [r4, r0]
	ldrb r3, [r4, #0x14]
	ldr r0, _08113608
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _081135FA
	ldr r1, _0811360C
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r5, r0, r1
	strh r7, [r5, #0x2e]
	ldr r0, _08113610
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081135DC
	movs r1, #1
_081135DC:
	strh r1, [r5, #0x30]
	movs r0, #0x2a
	muls r0, r6, r0
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x32]
	ldrh r0, [r4, #0x1e]
	strh r0, [r5, #0x34]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	strh r0, [r5, #0x38]
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
_081135FA:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	bls _081135A6
	b _081136C8
	.align 2, 0
_08113608: .4byte 0x08572A14
_0811360C: .4byte 0x020205AC
_08113610: .4byte 0x020380D6
_08113614:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08113632
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0xd
	bgt _08113640
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	b _08113640
_08113632:
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #4
	ble _08113640
	subs r0, r1, #1
	strh r0, [r4, #0x10]
_08113640:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #0xe]
	ldrh r1, [r4, #0x10]
	cmp r0, #0xe
	bne _081136B0
	cmp r1, #4
	bne _081136B0
	movs r0, #0
	strh r0, [r4, #0xa]
	b _081136AA
_08113656:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _081136E6
	movs r0, #0
	strh r0, [r4, #0xa]
	b _081136C8
_0811366A:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08113688
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08113696
	subs r0, r1, #1
	strh r0, [r4, #0xe]
	b _08113696
_08113688:
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	bgt _08113696
	adds r0, r1, #1
	strh r0, [r4, #0x10]
_08113696:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #0xe]
	ldrh r1, [r4, #0x10]
	cmp r0, #0
	bne _081136B0
	cmp r1, #0x10
	bne _081136B0
	movs r0, #1
	strh r0, [r4, #0x18]
_081136AA:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_081136B0:
	lsls r1, r1, #8
	orrs r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	b _081136E6
_081136C0:
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _081136E6
_081136C8:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _081136E6
_081136D0:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r7, #0
	bl DestroyAnimVisualTask
_081136E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08113560

	thumb_func_start sub_081136EC
sub_081136EC: @ 0x081136EC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081136FE
	ldrh r0, [r4, #0x32]
	adds r0, #2
	b _08113702
_081136FE:
	ldrh r0, [r4, #0x32]
	subs r0, #2
_08113702:
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x32]
	movs r0, #0xff
	ands r0, r1
	strh r0, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	subs r0, #0x41
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _08113744
	ldr r2, _08113740
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #0x12]
	adds r1, #1
	movs r0, #3
	ands r1, r0
	b _08113758
	.align 2, 0
_08113740: .4byte 0x03005B60
_08113744:
	ldr r2, _081137AC
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #3
	ldrb r1, [r0, #0x12]
	ands r1, r2
_08113758:
	lsls r1, r1, #2
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	lsls r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3a]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	movs r1, #7
	bl Sin
	strh r0, [r4, #0x26]
	ldr r2, _081137AC
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _081137A6
	ldrh r0, [r1, #0x16]
	subs r0, #1
	strh r0, [r1, #0x16]
	adds r0, r4, #0
	bl DestroySprite
_081137A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081137AC: .4byte 0x03005B60
	thumb_func_end sub_081136EC

	thumb_func_start sub_081137B0
sub_081137B0: @ 0x081137B0
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #4
	orrs r1, r2
	strb r1, [r3]
	ldr r2, _081137F4
	ldr r1, _081137F8
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r1, [r1]
	strh r1, [r0, #0x38]
	movs r1, #0x80
	strh r1, [r0, #0x2e]
	movs r1, #0xa
	strh r1, [r0, #0x30]
	ldr r2, _081137FC
	ldrh r1, [r2]
	strh r1, [r0, #0x32]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x34]
	ldr r1, _08113800
	str r1, [r0, #0x1c]
	ldr r2, _08113804
	movs r3, #0x38
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_081137F4: .4byte 0x02023E88
_081137F8: .4byte 0x020380D6
_081137FC: .4byte 0x020380BE
_08113800: .4byte 0x08113809
_08113804: .4byte 0x020205AC
	thumb_func_end sub_081137B0

