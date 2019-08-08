.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08113EEC
sub_08113EEC: @ 0x08113EEC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x38]
	adds r0, r0, r2
	strh r0, [r4, #0x38]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl __divsi3
	strh r0, [r4, #0x24]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl __divsi3
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08113F30
	adds r0, r4, #0
	bl DestroyAnimSprite
_08113F30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08113EEC

	thumb_func_start sub_08113F38
sub_08113F38: @ 0x08113F38
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08113F74
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08113F78
	ldrh r1, [r1]
	strh r1, [r0, #8]
	ldr r1, _08113F7C
	ldrb r4, [r1]
	movs r1, #0x10
	strh r1, [r0, #0xa]
	movs r0, #0x52
	bl SetGpuReg
	adds r0, r4, #0
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08113F84
	ldr r1, _08113F80
	movs r0, #0x50
	bl SetGpuReg
	b _08113F8C
	.align 2, 0
_08113F74: .4byte 0x03005B60
_08113F78: .4byte 0x020380BE
_08113F7C: .4byte 0x020380D6
_08113F80: .4byte 0x00003F42
_08113F84:
	ldr r1, _08113FA0
	movs r0, #0x50
	bl SetGpuReg
_08113F8C:
	ldr r0, _08113FA4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08113FA8
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113FA0: .4byte 0x00003F44
_08113FA4: .4byte 0x03005B60
_08113FA8: .4byte 0x08113FAD
	thumb_func_end sub_08113F38

	thumb_func_start sub_08113FAC
sub_08113FAC: @ 0x08113FAC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08114018
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r6, r0, r1
	ldrh r0, [r6, #0xa]
	lsrs r4, r0, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	ldrb r2, [r6, #8]
	cmp r0, r2
	bne _08114028
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #8
	orrs r1, r0
	movs r5, #0
	strh r1, [r6, #0xa]
	ldrh r1, [r6, #0xa]
	movs r0, #0x52
	bl SetGpuReg
	strh r5, [r6, #0xc]
	cmp r4, #0x10
	bne _0811402E
	ldr r2, _0811401C
	ldr r1, _08114020
	ldr r0, _08114024
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r7, #0
	bl DestroyAnimVisualTask
	b _0811402E
	.align 2, 0
_08114018: .4byte 0x03005B60
_0811401C: .4byte 0x020205AC
_08114020: .4byte 0x02023E88
_08114024: .4byte 0x020380D6
_08114028:
	ldrh r0, [r6, #0xc]
	adds r0, #1
	strh r0, [r6, #0xc]
_0811402E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08113FAC

	thumb_func_start sub_08114034
sub_08114034: @ 0x08114034
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08114060
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r1
	ldr r0, _08114064
	ldrh r0, [r0]
	strh r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #5
	strh r1, [r2, #0xa]
	ldr r0, _08114068
	str r0, [r2]
	movs r0, #0x52
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_08114060: .4byte 0x03005B60
_08114064: .4byte 0x020380BE
_08114068: .4byte 0x0811406D
	thumb_func_end sub_08114034

	thumb_func_start sub_0811406C
sub_0811406C: @ 0x0811406C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _081140C8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r6, r0, r1
	ldrh r0, [r6, #0xa]
	lsrs r4, r0, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	ldrb r2, [r6, #8]
	cmp r0, r2
	bne _081140CC
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #8
	orrs r1, r0
	movs r5, #0
	strh r1, [r6, #0xa]
	ldrh r1, [r6, #0xa]
	movs r0, #0x52
	bl SetGpuReg
	strh r5, [r6, #0xc]
	cmp r4, #0
	bne _081140D2
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r7, #0
	bl DestroyAnimVisualTask
	b _081140D2
	.align 2, 0
_081140C8: .4byte 0x03005B60
_081140CC:
	ldrh r0, [r6, #0xc]
	adds r0, #1
	strh r0, [r6, #0xc]
_081140D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0811406C

	thumb_func_start sub_081140D8
sub_081140D8: @ 0x081140D8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	ldr r0, _08114104
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0811410C
	ldr r1, _08114108
	movs r0, #0x50
	bl SetGpuReg
	b _08114114
	.align 2, 0
_08114104: .4byte 0x020380D6
_08114108: .4byte 0x00003F42
_0811410C:
	ldr r1, _08114120
	movs r0, #0x50
	bl SetGpuReg
_08114114:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08114120: .4byte 0x00003F44
	thumb_func_end sub_081140D8

	thumb_func_start sub_08114124
sub_08114124: @ 0x08114124
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _08114190
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x30]
	ldr r5, _08114194
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	ldrb r0, [r6]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x34]
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x36]
	movs r0, #0x7e
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl InitSpriteDataForLinearTranslation
	ldrh r0, [r4, #0x30]
	rsbs r0, r0, #0
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x32]
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
	ldr r0, _08114198
	strh r0, [r4, #0x3a]
	ldr r1, _0811419C
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08114190: .4byte 0x020380D7
_08114194: .4byte 0x020380D6
_08114198: .4byte 0x0000FFD8
_0811419C: .4byte 0x081141A1
	thumb_func_end sub_08114124

	thumb_func_start sub_081141A0
sub_081141A0: @ 0x081141A0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0x30]
	ldrh r0, [r4, #0x34]
	adds r2, r5, r0
	strh r2, [r4, #0x34]
	ldrh r3, [r4, #0x32]
	ldrh r6, [r4, #0x36]
	adds r1, r3, r6
	strh r1, [r4, #0x36]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	movs r6, #0x3c
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _081141E2
	adds r0, r2, r5
	strh r0, [r4, #0x34]
	adds r1, r1, r3
	strh r1, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strh r1, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
_081141E2:
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r6, [r4, #0x26]
	adds r0, r0, r6
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x38]
	adds r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	cmp r0, #0x7f
	ble _08114212
	movs r0, #0
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3a]
	adds r0, #0x14
	strh r0, [r4, #0x3a]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
_08114212:
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08114224
	adds r0, r4, #0
	bl DestroyAnimSprite
_08114224:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081141A0

	thumb_func_start sub_0811422C
sub_0811422C: @ 0x0811422C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08114260
	ldrh r0, [r5]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrb r1, [r5, #4]
	adds r0, r4, #0
	bl StartSpriteAffineAnim
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x30]
	ldrh r0, [r5, #0xa]
	strh r0, [r4, #0x32]
	ldr r0, _08114264
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08114260: .4byte 0x020380BE
_08114264: .4byte 0x08114269
	thumb_func_end sub_0811422C

	thumb_func_start sub_08114268
sub_08114268: @ 0x08114268
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x36]
	adds r0, r0, r1
	strh r0, [r2, #0x36]
	ldrh r1, [r2, #0x30]
	ldrh r3, [r2, #0x38]
	adds r1, r1, r3
	strh r1, [r2, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r2, #0x24]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strh r1, [r2, #0x26]
	ldrh r0, [r2, #0x34]
	adds r0, #1
	strh r0, [r2, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne _0811429E
	ldr r0, _081142A4
	str r0, [r2, #0x1c]
_0811429E:
	pop {r0}
	bx r0
	.align 2, 0
_081142A4: .4byte 0x081142A9
	thumb_func_end sub_08114268

	thumb_func_start sub_081142A8
sub_081142A8: @ 0x081142A8
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x36]
	ldrh r0, [r3, #0x2e]
	subs r1, r1, r0
	strh r1, [r3, #0x36]
	ldrh r0, [r3, #0x38]
	ldrh r2, [r3, #0x30]
	subs r0, r0, r2
	strh r0, [r3, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strh r1, [r3, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r3, #0x26]
	ldrh r0, [r3, #0x34]
	subs r0, #1
	strh r0, [r3, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081142DA
	adds r0, r3, #0
	bl DestroySpriteAndMatrix
_081142DA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081142A8

	thumb_func_start sub_081142E0
sub_081142E0: @ 0x081142E0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _081142F4
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #0
	bne _081142FC
	ldr r0, _081142F8
	b _081142FE
	.align 2, 0
_081142F4: .4byte 0x020380BE
_081142F8: .4byte 0x020380D6
_081142FC:
	ldr r0, _0811432C
_081142FE:
	ldrb r5, [r0]
	movs r6, #0x14
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #4
	ldr r7, _08114330
	adds r0, r7, #0
	ands r1, r0
	ldr r0, _08114334
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, #1
	beq _0811435C
	cmp r0, #1
	bgt _08114338
	cmp r0, #0
	beq _08114342
	b _081143B0
	.align 2, 0
_0811432C: .4byte 0x020380D7
_08114330: .4byte 0x000003FF
_08114334: .4byte 0xFFFFFC00
_08114338:
	cmp r0, #2
	beq _08114376
	cmp r0, #3
	beq _0811438E
	b _081143B0
_08114342:
	adds r0, r5, #0
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	subs r0, #8
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	strh r0, [r4, #0x22]
	b _081143B0
_0811435C:
	adds r0, r5, #0
	movs r1, #5
	bl GetBattlerSpriteCoordAttr
	subs r0, #0xe
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	adds r0, #0x10
	strh r0, [r4, #0x22]
	b _081143B0
_08114376:
	adds r0, r5, #0
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	adds r0, #8
	b _081143A4
_0811438E:
	adds r0, r5, #0
	movs r1, #4
	bl GetBattlerSpriteCoordAttr
	adds r0, #0xe
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	adds r0, #0x10
_081143A4:
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	movs r6, #0xec
_081143B0:
	movs r0, #0x20
	strh r0, [r4, #0x2e]
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	adds r0, #0xc
	strh r0, [r4, #0x36]
	ldr r0, _081143D8
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldr r0, _081143DC
	str r0, [r4, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081143D8: .4byte 0x0000FFF4
_081143DC: .4byte 0x081143E1
	thumb_func_end sub_081142E0

	thumb_func_start sub_081143E0
sub_081143E0: @ 0x081143E0
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081143F4
	adds r0, r4, #0
	bl DestroySpriteAndMatrix
_081143F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081143E0

	thumb_func_start sub_081143FC
sub_081143FC: @ 0x081143FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08114460
	adds r5, r1, r0
	ldr r4, _08114464
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x1f
	movs r6, #0
	strh r0, [r5, #0x16]
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	subs r0, #7
	strh r0, [r5, #0x14]
	ldrh r1, [r5, #0x16]
	strh r1, [r5, #0x12]
	strh r0, [r5, #0x10]
	subs r1, r1, r0
	lsls r1, r1, #8
	strh r1, [r5, #0x22]
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	subs r1, #0x20
	strh r1, [r5, #0x24]
	adds r0, #0x20
	strh r0, [r5, #0x26]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811446C
	ldr r0, _08114468
	b _0811446E
	.align 2, 0
_08114460: .4byte 0x03005B60
_08114464: .4byte 0x020380D6
_08114468: .4byte 0x0000FFF4
_0811446C:
	ldr r0, _081144B8
_0811446E:
	strh r0, [r5, #0x18]
	ldr r0, _081144BC
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xe]
	cmp r0, #1
	bne _081144D0
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_080A63F8
	ldr r0, _081144C0
	ldrh r0, [r0]
	strh r0, [r5, #0x1c]
	ldr r1, _081144C4
	movs r0, #0x50
	bl SetGpuReg
	ldrb r1, [r4, #8]
	lsls r1, r1, #4
	movs r0, #0
	movs r2, #0x20
	bl FillPalette
	ldr r0, _081144C8
	str r0, [sp]
	movs r7, #2
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08114500
	ldr r1, _081144CC
	b _081144FA
	.align 2, 0
_081144B8: .4byte 0x0000FFC0
_081144BC: .4byte 0x020380D6
_081144C0: .4byte 0x02022ACE
_081144C4: .4byte 0x00003F42
_081144C8: .4byte 0x04000016
_081144CC: .4byte 0x02022AD0
_081144D0:
	ldr r0, _08114588
	ldrh r0, [r0]
	strh r0, [r5, #0x1c]
	ldr r1, _0811458C
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x20
	bl FillPalette
	ldr r0, _08114590
	str r0, [sp]
	movs r7, #4
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08114500
	ldr r1, _08114594
_081144FA:
	ldrh r0, [r1]
	adds r0, #0xf0
	strh r0, [r1]
_08114500:
	ldr r0, _08114598
	str r0, [sp, #4]
	mov r2, sp
	movs r1, #0
	movs r0, #1
	strb r0, [r2, #8]
	mov r0, sp
	strb r1, [r0, #9]
	strh r1, [r5, #0x1e]
	movs r0, #0x10
	strh r0, [r5, #0x20]
	strh r1, [r5, #8]
	strh r1, [r5, #0xa]
	strh r1, [r5, #0xc]
	movs r0, #3
	bl sub_08114BC4
	movs r3, #0
	ldr r4, _0811459C
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r6, r4, r0
_0811452C:
	lsls r1, r3, #1
	adds r2, r1, r4
	ldrh r0, [r5, #0x1c]
	strh r0, [r2]
	adds r1, r1, r6
	ldrh r0, [r5, #0x1c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x6f
	bls _0811452C
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ScanlineEffect_SetParams
	movs r0, #0x3f
	eors r7, r0
	movs r1, #0xfc
	lsls r1, r1, #6
	adds r0, r1, #0
	orrs r7, r0
	movs r0, #0x4a
	adds r1, r7, #0
	bl SetGpuReg
	ldr r1, _081145A0
	movs r0, #0x48
	bl SetGpuReg
	ldr r2, _081145A4
	ldrh r0, [r5, #0x24]
	lsls r0, r0, #8
	ldrh r1, [r5, #0x26]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _081145A8
	movs r0, #0xa0
	strh r0, [r1]
	ldr r0, _081145AC
	str r0, [r5]
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08114588: .4byte 0x02022AD2
_0811458C: .4byte 0x00003F44
_08114590: .4byte 0x0400001A
_08114594: .4byte 0x02022ACC
_08114598: .4byte 0xA2600001
_0811459C: .4byte 0x020388C8
_081145A0: .4byte 0x00003F3F
_081145A4: .4byte 0x02022AD8
_081145A8: .4byte 0x02022ADA
_081145AC: .4byte 0x081145B1
	thumb_func_end sub_081143FC

	thumb_func_start sub_081145B0
sub_081145B0: @ 0x081145B0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081145D4
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bls _081145CA
	b _081146C2
_081145CA:
	lsls r0, r0, #2
	ldr r1, _081145D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081145D4: .4byte 0x03005B60
_081145D8: .4byte 0x081145DC
_081145DC: @ jump table
	.4byte _081145F0 @ case 0
	.4byte _08114652 @ case 1
	.4byte _0811466C @ case 2
	.4byte _081146A8 @ case 3
	.4byte _081146BC @ case 4
_081145F0:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _081146C2
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08114620
	ldrh r1, [r4, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r4, r2]
	cmp r0, #0xc
	beq _0811462E
	adds r0, r1, #1
	strh r0, [r4, #0x1e]
	b _0811462E
_08114620:
	ldrh r1, [r4, #0x20]
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r0, #8
	beq _0811462E
	subs r0, r1, #1
	strh r0, [r4, #0x20]
_0811462E:
	ldrh r1, [r4, #0x20]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x1e]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0xc
	bne _081146C2
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bne _081146C2
	b _081146AE
_08114652:
	ldrh r0, [r4, #0x10]
	subs r0, #8
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08114A94
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _081146C2
	b _081146AE
_0811466C:
	ldrh r0, [r4, #0x10]
	subs r0, #8
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08114A94
	ldrh r1, [r4, #0x24]
	adds r1, #4
	strh r1, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	subs r2, r0, #4
	strh r2, [r4, #0x26]
	lsls r1, r1, #0x10
	lsls r0, r2, #0x10
	cmp r1, r0
	blt _0811468E
	strh r2, [r4, #0x24]
_0811468E:
	ldr r3, _081146A4
	ldrh r2, [r4, #0x24]
	lsls r0, r2, #8
	ldrh r1, [r4, #0x26]
	orrs r0, r1
	strh r0, [r3]
	lsls r2, r2, #0x10
	lsls r1, r1, #0x10
	cmp r2, r1
	bne _081146C2
	b _081146AE
	.align 2, 0
_081146A4: .4byte 0x02022AD8
_081146A8:
	ldr r1, _081146B8
	movs r0, #3
	strb r0, [r1, #0x15]
_081146AE:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _081146C2
	.align 2, 0
_081146B8: .4byte 0x020397C8
_081146BC:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_081146C2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081145B0

	thumb_func_start sub_081146C8
sub_081146C8: @ 0x081146C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081146F0
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #4
	bls _081146E4
	b _081148F6
_081146E4:
	lsls r0, r0, #2
	ldr r1, _081146F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081146F0: .4byte 0x03005B60
_081146F4: .4byte 0x081146F8
_081146F8: @ jump table
	.4byte _0811470C @ case 0
	.4byte _08114790 @ case 1
	.4byte _081147D4 @ case 2
	.4byte _08114840 @ case 3
	.4byte _081148A8 @ case 4
_0811470C:
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08114748
	ldr r0, _0811473C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08114740
	strh r1, [r0]
	ldr r4, _08114744
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	b _081148F6
	.align 2, 0
_0811473C: .4byte 0x02022AD8
_08114740: .4byte 0x02022ADA
_08114744: .4byte 0x00003F3F
_08114748:
	ldr r0, _08114768
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xe]
	cmp r0, #1
	bne _08114774
	ldr r1, _0811476C
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _08114770
	b _0811477E
	.align 2, 0
_08114768: .4byte 0x020380D7
_0811476C: .4byte 0x00003F42
_08114770: .4byte 0x02022AD0
_08114774:
	ldr r1, _08114788
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _0811478C
_0811477E:
	ldrh r0, [r1]
	adds r0, #0xf0
	strh r0, [r1]
	b _08114894
	.align 2, 0
_08114788: .4byte 0x00003F44
_0811478C: .4byte 0x02022ACC
_08114790:
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _081147B8
	mov r0, sp
	bl sub_080A63F8
	ldr r0, _081147B4
	ldrh r0, [r0]
	strh r0, [r5, #0x1c]
	mov r0, sp
	ldrb r1, [r0, #8]
	lsls r1, r1, #4
	movs r0, #0
	movs r2, #0x20
	bl FillPalette
	b _081147C8
	.align 2, 0
_081147B4: .4byte 0x02022ACE
_081147B8:
	ldr r0, _081147D0
	ldrh r0, [r0]
	strh r0, [r5, #0x1c]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x20
	bl FillPalette
_081147C8:
	movs r0, #3
	bl sub_08114BC4
	b _08114894
	.align 2, 0
_081147D0: .4byte 0x02022AD2
_081147D4:
	ldr r4, _08114820
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x1f
	movs r6, #0
	strh r0, [r5, #0x16]
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoordAttr
	subs r0, #7
	strh r0, [r5, #0x14]
	ldrh r1, [r5, #0x16]
	subs r1, r1, r0
	lsls r1, r1, #8
	strh r1, [r5, #0x22]
	ldrb r0, [r4]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r1, r0, #4
	strh r1, [r5, #0x24]
	adds r0, #4
	strh r0, [r5, #0x26]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08114828
	ldr r0, _08114824
	b _0811482A
	.align 2, 0
_08114820: .4byte 0x020380D7
_08114824: .4byte 0x0000FFF4
_08114828:
	ldr r0, _0811483C
_0811482A:
	strh r0, [r5, #0x18]
	ldrh r0, [r5, #0x18]
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	movs r0, #0xc
	strh r0, [r5, #0x1e]
	movs r0, #8
	strh r0, [r5, #0x20]
	b _08114894
	.align 2, 0
_0811483C: .4byte 0x0000FFC0
_08114840:
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _08114850
	ldr r0, _0811484C
	b _08114852
	.align 2, 0
_0811484C: .4byte 0x04000016
_08114850:
	ldr r0, _0811489C
_08114852:
	str r0, [sp, #0x10]
	movs r3, #0
	add r4, sp, #0x10
	ldr r6, _081148A0
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r7, r6, r0
_08114860:
	lsls r1, r3, #1
	adds r2, r1, r6
	ldrh r0, [r5, #0x1c]
	adds r0, #0x9f
	subs r0, r0, r3
	strh r0, [r2]
	adds r1, r1, r7
	ldrh r0, [r5, #0x1c]
	adds r0, #0x9f
	subs r0, r0, r3
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x6f
	bls _08114860
	ldr r1, _081148A4
	str r1, [r4, #4]
	movs r2, #0
	movs r0, #1
	strb r0, [r4, #8]
	strb r2, [r4, #9]
	ldr r0, [sp, #0x10]
	ldr r2, [r4, #8]
	bl ScanlineEffect_SetParams
_08114894:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _081148F6
	.align 2, 0
_0811489C: .4byte 0x0400001A
_081148A0: .4byte 0x020388C8
_081148A4: .4byte 0xA2600001
_081148A8:
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _081148C0
	ldr r1, _081148BC
	movs r0, #0x4a
	bl SetGpuReg
	b _081148C8
	.align 2, 0
_081148BC: .4byte 0x00003F3D
_081148C0:
	ldr r1, _08114900
	movs r0, #0x4a
	bl SetGpuReg
_081148C8:
	ldr r1, _08114904
	movs r0, #0x48
	bl SetGpuReg
	ldr r2, _08114908
	ldrh r0, [r5, #0x24]
	lsls r0, r0, #8
	ldrh r1, [r5, #0x26]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0811490C
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0
	strh r0, [r5, #8]
	strh r0, [r5, #0xa]
	strh r0, [r5, #0xc]
	ldr r1, _08114910
	movs r0, #0x52
	bl SetGpuReg
	ldr r0, _08114914
	str r0, [r5]
_081148F6:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08114900: .4byte 0x00003F3B
_08114904: .4byte 0x00003F3F
_08114908: .4byte 0x02022AD8
_0811490C: .4byte 0x02022ADA
_08114910: .4byte 0x0000080C
_08114914: .4byte 0x08114919
	thumb_func_end sub_081146C8

	thumb_func_start sub_08114918
sub_08114918: @ 0x08114918
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0811493C
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bls _08114932
	b _08114A82
_08114932:
	lsls r0, r0, #2
	ldr r1, _08114940
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811493C: .4byte 0x03005B60
_08114940: .4byte 0x08114944
_08114944: @ jump table
	.4byte _08114958 @ case 0
	.4byte _08114984 @ case 1
	.4byte _081149EC @ case 2
	.4byte _08114A4E @ case 3
	.4byte _08114A60 @ case 4
_08114958:
	ldrh r0, [r4, #0x12]
	adds r0, #8
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r4, #0x16]
	movs r3, #0x16
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _0811496E
	strh r2, [r4, #0x12]
_0811496E:
	adds r0, r4, #0
	bl sub_08114A94
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _08114982
	b _08114A82
_08114982:
	b _08114A54
_08114984:
	movs r3, #0x26
	ldrsh r0, [r4, r3]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	cmp r0, #0x3f
	bgt _081149A0
	ldrh r0, [r4, #0x24]
	subs r0, #4
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	adds r0, #4
	strh r0, [r4, #0x26]
	b _081149A4
_081149A0:
	movs r0, #1
	strh r0, [r4, #0xa]
_081149A4:
	ldr r2, _081149E8
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #8
	ldrh r1, [r4, #0x26]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, #0x10]
	adds r0, #8
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _081149C6
	strh r2, [r4, #0x10]
_081149C6:
	adds r0, r4, #0
	bl sub_08114A94
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08114A82
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08114A82
	movs r0, #0
	strh r0, [r4, #0xa]
	b _08114A54
	.align 2, 0
_081149E8: .4byte 0x02022AD8
_081149EC:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08114A82
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08114A1C
	ldrh r1, [r4, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08114A2A
	subs r0, r1, #1
	strh r0, [r4, #0x1e]
	b _08114A2A
_08114A1C:
	ldrh r1, [r4, #0x20]
	movs r3, #0x20
	ldrsh r0, [r4, r3]
	cmp r0, #0xf
	bgt _08114A2A
	adds r0, r1, #1
	strh r0, [r4, #0x20]
_08114A2A:
	ldrh r1, [r4, #0x20]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x1e]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08114A82
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r0, #0x10
	bne _08114A82
	b _08114A54
_08114A4E:
	ldr r1, _08114A5C
	movs r0, #3
	strb r0, [r1, #0x15]
_08114A54:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08114A82
	.align 2, 0
_08114A5C: .4byte 0x020397C8
_08114A60:
	ldr r0, _08114A88
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08114A8C
	strh r1, [r0]
	ldr r4, _08114A90
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08114A82:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08114A88: .4byte 0x02022AD8
_08114A8C: .4byte 0x02022ADA
_08114A90: .4byte 0x00003F3F
	thumb_func_end sub_08114918

	thumb_func_start sub_08114A94
sub_08114A94: @ 0x08114A94
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldrh r0, [r6, #0x12]
	ldrh r4, [r6, #0x10]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _08114B88
	movs r2, #0x22
	ldrsh r0, [r6, r2]
	bl __divsi3
	mov r8, r0
	movs r3, #0x14
	ldrsh r0, [r6, r3]
	lsls r5, r0, #8
	lsls r0, r4, #0x10
	movs r4, #0
	cmp r0, #0
	ble _08114AF4
	ldr r0, _08114B80
	mov ip, r0
	ldr r7, _08114B84
_08114AC8:
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	lsls r3, r2, #1
	ldrb r1, [r7, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r3, r3, r0
	add r3, ip
	adds r1, r2, #0
	subs r1, #0x9f
	ldrh r0, [r6, #0x1c]
	subs r0, r0, r1
	strh r0, [r3]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r2, r0
	blt _08114AC8
_08114AF4:
	ldrh r4, [r6, #0x10]
	lsls r3, r4, #0x10
	asrs r1, r3, #0x10
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r1, r0
	bgt _08114B3E
	ldr r0, _08114B80
	mov ip, r0
	ldr r7, _08114B84
_08114B08:
	asrs r4, r3, #0x10
	cmp r4, #0
	blt _08114B2A
	asrs r1, r5, #8
	subs r1, r1, r4
	lsls r3, r4, #1
	ldrb r2, [r7, #0x14]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #7
	adds r3, r3, r0
	add r3, ip
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r6, #0x1c]
	adds r1, r1, r2
	strh r1, [r3]
_08114B2A:
	add r5, r8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r3, r4, #0x10
	asrs r1, r3, #0x10
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _08114B08
_08114B3E:
	movs r3, #0x1c
	ldrsh r0, [r6, r3]
	adds r0, #0x9f
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	subs r5, r0, r1
	movs r3, #0x16
	ldrsh r0, [r6, r3]
	cmp r1, r0
	bge _08114BB6
	ldr r7, _08114B80
	ldr r4, _08114B84
_08114B56:
	asrs r3, r2, #0x10
	cmp r3, #0
	blt _08114B6E
	lsls r2, r3, #1
	ldrb r1, [r4, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r7
	strh r5, [r2]
	subs r5, #1
_08114B6E:
	adds r0, r3, #1
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	movs r3, #0x16
	ldrsh r0, [r6, r3]
	cmp r1, r0
	blt _08114B56
	b _08114BB6
	.align 2, 0
_08114B80: .4byte 0x020388C8
_08114B84: .4byte 0x020397C8
_08114B88:
	movs r1, #0x1c
	ldrsh r0, [r6, r1]
	adds r5, r0, #0
	adds r5, #0x9f
	movs r4, #0
	ldr r3, _08114BC0
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r6, r3, r2
_08114B9A:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #1
	adds r1, r2, r3
	strh r5, [r1]
	adds r2, r2, r6
	strh r5, [r2]
	subs r5, #1
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6f
	ble _08114B9A
_08114BB6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08114BC0: .4byte 0x020388C8
	thumb_func_end sub_08114A94

	thumb_func_start sub_08114BC4
sub_08114BC4: @ 0x08114BC4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	ldr r7, _08114C0C
	movs r1, #3
	ands r0, r1
	lsls r5, r0, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	adds r6, r0, #0
_08114BDA:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08114BFA
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r0, [r1, #5]
	ands r0, r6
	orrs r0, r5
	strb r0, [r1, #5]
_08114BFA:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _08114BDA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08114C0C: .4byte 0x020205AC
	thumb_func_end sub_08114BC4

	thumb_func_start sub_08114C10
sub_08114C10: @ 0x08114C10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r6, _08114CB4
	ldrb r0, [r6]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	ldrb r0, [r6]
	adds r1, r4, #0
	movs r2, #1
	bl MoveBattlerSpriteToBG
	ldr r0, _08114CB8
	mov sb, r0
	ldr r0, _08114CBC
	mov r8, r0
	ldrb r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sb
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r7, #5
	rsbs r7, r7, #0
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r6]
	movs r5, #2
	eors r0, r5
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08114C9E
	ldrb r0, [r6]
	eors r0, r5
	movs r1, #1
	eors r4, r1
	adds r1, r4, #0
	movs r2, #1
	bl MoveBattlerSpriteToBG
	ldrb r0, [r6]
	eors r0, r5
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	adds r0, #0x3e
	ldrb r2, [r0]
	adds r1, r7, #0
	ands r1, r2
	strb r1, [r0]
_08114C9E:
	mov r0, sl
	bl DestroyAnimVisualTask
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08114CB4: .4byte 0x020380D6
_08114CB8: .4byte 0x020205AC
_08114CBC: .4byte 0x02023E88
	thumb_func_end sub_08114C10

	thumb_func_start sub_08114CC0
sub_08114CC0: @ 0x08114CC0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _08114D08
	ldrb r0, [r4]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r5, r1, #0x1f
	adds r0, r5, #0
	bl sub_080A4044
	ldrb r1, [r4]
	movs r0, #2
	eors r0, r1
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08114CFC
	movs r0, #1
	eors r5, r0
	adds r0, r5, #0
	bl sub_080A4044
_08114CFC:
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08114D08: .4byte 0x020380D6
	thumb_func_end sub_08114CC0

	thumb_func_start sub_08114D0C
sub_08114D0C: @ 0x08114D0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08114D3C
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	ldrb r1, [r1, #4]
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r0, _08114D40
	str r0, [r4, #0x1c]
	ldr r1, _08114D44
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08114D3C: .4byte 0x020380BE
_08114D40: .4byte 0x080A60A1
_08114D44: .4byte 0x080A34C5
	thumb_func_end sub_08114D0C

	thumb_func_start AnimTask_MetallicShine
AnimTask_MetallicShine: @ 0x08114D48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	ldr r0, _08114E3C
	strh r6, [r0]
	ldr r0, _08114E40
	strh r6, [r0]
	ldr r1, _08114E44
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _08114E48
	movs r0, #0x4a
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #0
	bl SetGpuRegBits
	ldr r1, _08114E4C
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _08114E50
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08114DAC
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
_08114DAC:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08114E26
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08114E26
	ldr r4, _08114E54
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _08114DDC
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08114E26
_08114DDC:
	ldrb r0, [r4]
	movs r5, #2
	eors r0, r5
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08114E26
	ldr r3, _08114E58
	ldr r1, _08114E5C
	ldrb r0, [r4]
	eors r0, r5
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrb r3, [r2, #5]
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1e
	subs r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	movs r6, #1
_08114E26:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08114E64
	ldr r0, _08114E60
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r5, [r0]
	b _08114EAC
	.align 2, 0
_08114E3C: .4byte 0x02022AD8
_08114E40: .4byte 0x02022ADA
_08114E44: .4byte 0x00003F3F
_08114E48: .4byte 0x00003F3D
_08114E4C: .4byte 0x00003F42
_08114E50: .4byte 0x00000C08
_08114E54: .4byte 0x020380D6
_08114E58: .4byte 0x020205AC
_08114E5C: .4byte 0x02023E88
_08114E60: .4byte 0x02039BD4
_08114E64:
	ldr r4, _08114E84
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08114E90
	ldr r1, _08114E88
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08114E8C
	b _08114EA0
	.align 2, 0
_08114E84: .4byte 0x020380D6
_08114E88: .4byte 0x02023D12
_08114E8C: .4byte 0x020243E8
_08114E90:
	ldr r1, _08114F30
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08114F34
_08114EA0:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08114EAC:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08114F38
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080A8290
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _08114F3C
	bl AnimLoadCompressedBgTilemap
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _08114F40
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r0, _08114F44
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r2, _08114F48
	ldr r0, _08114F4C
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x20]
	rsbs r0, r0, #0
	adds r0, #0x60
	strh r0, [r2]
	ldr r2, _08114F50
	ldrh r0, [r1, #0x22]
	rsbs r0, r0, #0
	adds r0, #0x20
	strh r0, [r2]
	ldrb r0, [r1, #5]
	lsrs r0, r0, #4
	adds r0, #0x10
	adds r1, r0, #0
	ldr r2, _08114F54
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _08114F58
	adds r0, r1, #0
	movs r1, #0
	bl SetGreyscaleOrOriginalPalette
	b _08114F64
	.align 2, 0
_08114F30: .4byte 0x02023D12
_08114F34: .4byte 0x02024190
_08114F38: .4byte 0x020380D6
_08114F3C: .4byte 0x08C1D258
_08114F40: .4byte 0x08C1D0F4
_08114F44: .4byte 0x08C1D230
_08114F48: .4byte 0x02022ACC
_08114F4C: .4byte 0x020205AC
_08114F50: .4byte 0x02022ACE
_08114F54: .4byte 0x020380BE
_08114F58:
	lsls r0, r1, #4
	ldrh r3, [r2, #4]
	movs r1, #0x10
	movs r2, #0xb
	bl BlendPalette
_08114F64:
	ldr r1, _08114F8C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #8]
	ldr r2, _08114F90
	ldrh r1, [r2]
	strh r1, [r0, #0xa]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0xc]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xe]
	strh r6, [r0, #0x14]
	ldr r1, _08114F94
	str r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08114F8C: .4byte 0x03005B60
_08114F90: .4byte 0x020380BE
_08114F94: .4byte 0x08114F99
	thumb_func_end AnimTask_MetallicShine

	thumb_func_start sub_08114F98
sub_08114F98: @ 0x08114F98
	push {r4, r5, r6, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r1, _08115060
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x1c]
	adds r0, #4
	movs r5, #0
	strh r0, [r4, #0x1c]
	ldr r2, _08115064
	ldrh r3, [r2]
	subs r1, r3, #4
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x80
	beq _08114FC6
	b _081150D6
_08114FC6:
	strh r5, [r4, #0x1c]
	adds r0, r3, #0
	adds r0, #0x7c
	strh r0, [r2]
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08115074
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08115068
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #5]
	lsrs r0, r0, #4
	adds r0, #0x10
	adds r1, r0, #0
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08115008
	adds r0, r1, #0
	movs r1, #1
	bl SetGreyscaleOrOriginalPalette
_08115008:
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	bl sub_080A6530
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _081150D6
	ldr r2, _0811506C
	ldr r0, _08115070
	ldrb r1, [r0]
	movs r0, #2
	eors r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r5
	ldrb r3, [r2, #5]
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1e
	adds r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	b _081150D6
	.align 2, 0
_08115060: .4byte 0x03005B60
_08115064: .4byte 0x02022ACC
_08115068: .4byte 0x020205AC
_0811506C: .4byte 0x02023E88
_08115070: .4byte 0x020380D6
_08115074:
	cmp r0, #3
	bne _081150D6
	ldr r0, _081150E0
	strh r5, [r0]
	ldr r0, _081150E4
	strh r5, [r0]
	ldr r4, _081150E8
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081150A6
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_081150A6:
	movs r0, #0
	bl GetGpuReg
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_081150D6:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081150E0: .4byte 0x02022AD8
_081150E4: .4byte 0x02022ADA
_081150E8: .4byte 0x00003F3F
	thumb_func_end sub_08114F98

	thumb_func_start AnimTask_SetGreyscaleOrOriginalPal
AnimTask_SetGreyscaleOrOriginalPal: @ 0x081150EC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r0, _0811510C
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #7
	bhi _08115150
	lsls r0, r1, #2
	ldr r1, _08115110
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811510C: .4byte 0x020380BE
_08115110: .4byte 0x08115114
_08115114: @ jump table
	.4byte _08115134 @ case 0
	.4byte _08115134 @ case 1
	.4byte _08115134 @ case 2
	.4byte _08115134 @ case 3
	.4byte _08115140 @ case 4
	.4byte _08115144 @ case 5
	.4byte _08115148 @ case 6
	.4byte _0811514C @ case 7
_08115134:
	ldrb r0, [r2]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _08115152
_08115140:
	movs r4, #0
	b _08115158
_08115144:
	movs r4, #2
	b _08115158
_08115148:
	movs r4, #1
	b _08115158
_0811514C:
	movs r4, #3
	b _08115158
_08115150:
	movs r2, #0xff
_08115152:
	movs r0, #0
	cmp r0, #0
	beq _0811517E
_08115158:
	adds r0, r4, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811517C
	ldr r0, _08115178
	adds r0, r4, r0
	ldrb r2, [r0]
	b _0811517E
	.align 2, 0
_08115178: .4byte 0x02023E88
_0811517C:
	movs r2, #0xff
_0811517E:
	cmp r2, #0xff
	beq _0811519A
	ldr r1, _081151A8
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	adds r0, #0x10
	ldr r1, _081151AC
	ldrb r1, [r1, #2]
	bl SetGreyscaleOrOriginalPalette
_0811519A:
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081151A8: .4byte 0x020205AC
_081151AC: .4byte 0x020380BE
	thumb_func_end AnimTask_SetGreyscaleOrOriginalPal

	thumb_func_start sub_081151B0
sub_081151B0: @ 0x081151B0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _081151DC
	ldrb r0, [r2]
	cmp r0, #1
	bhi _081151C4
	ldr r1, _081151E0
	movs r0, #0
	strh r0, [r1, #0xe]
_081151C4:
	ldrb r0, [r2]
	cmp r0, #2
	bne _081151D0
	ldr r1, _081151E0
	movs r0, #1
	strh r0, [r1, #0xe]
_081151D0:
	adds r0, r3, #0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_081151DC: .4byte 0x020380D2
_081151E0: .4byte 0x020380BE
	thumb_func_end sub_081151B0

