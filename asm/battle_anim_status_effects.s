.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_080A9538
sub_080A9538: @ 0x080A9538
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080A95DC
	adds r0, r4, r0
	ldrb r6, [r0]
	ldr r0, _080A95E0
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080A95E4
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _080A95E8
	bl LoadCompressedSpritePaletteUsingHeap
	ldr r1, _080A95EC
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r1
	strh r4, [r1, #8]
	cmp r5, #0
	beq _080A95F8
	movs r0, #0x1f
	strh r0, [r1, #0xa]
	movs r5, #0
	lsls r0, r6, #4
	ldr r7, _080A95F0
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r6, r0, r7
_080A958C:
	movs r0, #0x20
	ldrsh r1, [r6, r0]
	ldrh r2, [r6, #0x22]
	adds r2, #0x20
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, _080A95F4
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r3, r0, r7
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r1, r0, #4
	adds r0, r0, r1
	strh r0, [r3, #0x2e]
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r3, #0x30]
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	cmp r5, #4
	bls _080A95D0
	movs r0, #0x15
	strh r0, [r3, #0x3a]
_080A95D0:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _080A958C
	b _080A9658
	.align 2, 0
_080A95DC: .4byte 0x02023E88
_080A95E0: .4byte 0x080A967D
_080A95E4: .4byte 0x084FD690
_080A95E8: .4byte 0x084FDF98
_080A95EC: .4byte 0x03005B60
_080A95F0: .4byte 0x020205AC
_080A95F4: .4byte 0x085176BC
_080A95F8:
	movs r0, #0xf8
	lsls r0, r0, #7
	strh r0, [r1, #0xa]
	movs r5, #0
	lsls r0, r6, #4
	ldr r7, _080A9674
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r6, r0, r7
_080A960A:
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	ldrh r2, [r6, #0x22]
	subs r2, #0x20
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, _080A9678
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r3, r0, r7
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r1, r0, #4
	adds r0, r0, r1
	strh r0, [r3, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x30]
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	cmp r5, #4
	bls _080A964E
	movs r0, #0x15
	strh r0, [r3, #0x3a]
_080A964E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _080A960A
_080A9658:
	ldr r0, _080A9674
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A9674: .4byte 0x020205AC
_080A9678: .4byte 0x085176BC
	thumb_func_end sub_080A9538

	thumb_func_start sub_080A967C
sub_080A967C: @ 0x080A967C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080A96D4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #2
	bne _080A9702
	movs r0, #0
	strh r0, [r4, #0xc]
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	ldrb r2, [r4, #0x10]
	ldrh r3, [r4, #0xa]
	movs r1, #0x10
	bl BlendPalette
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080A96D8
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080A9706
	movs r0, #1
	eors r0, r2
	strh r0, [r4, #0x12]
	b _080A9706
	.align 2, 0
_080A96D4: .4byte 0x03005B60
_080A96D8:
	ldrh r1, [r4, #0x10]
	subs r0, r1, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080A9706
	strh r1, [r4, #0x10]
	movs r0, #1
	eors r0, r2
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _080A9706
	adds r0, r5, #0
	bl DestroyTask
	b _080A9706
_080A9702:
	adds r0, r1, #1
	strh r0, [r4, #0xc]
_080A9706:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080A967C

	thumb_func_start sub_080A970C
sub_080A970C: @ 0x080A970C
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x3a]
	movs r3, #0x3a
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _080A9738
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3]
	ldr r1, _080A9734
	str r1, [r2, #0x1c]
	adds r0, r2, #0
	bl _call_via_r1
	b _080A973C
	.align 2, 0
_080A9734: .4byte 0x080A9741
_080A9738:
	subs r0, r1, #1
	strh r0, [r2, #0x3a]
_080A973C:
	pop {r0}
	bx r0
	thumb_func_end sub_080A970C

	thumb_func_start sub_080A9740
sub_080A9740: @ 0x080A9740
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #0x20
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	strh r0, [r4, #0x26]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	bgt _080A976C
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x1d
	b _080A9772
_080A976C:
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x1f
_080A9772:
	strb r0, [r1]
	ldrh r0, [r4, #0x2e]
	adds r0, #8
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x38]
	adds r0, r0, r1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x34
	bne _080A97B4
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080A97AE
	adds r0, r4, #0
	bl DestroySpriteAndFreeResources
	b _080A97B4
_080A97AE:
	adds r0, r4, #0
	bl DestroySprite
_080A97B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A9740

	thumb_func_start sub_080A97BC
sub_080A97BC: @ 0x080A97BC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _080A986C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	ldr r1, _080A9870
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	ldrb r0, [r4]
	movs r1, #3
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	ldr r1, _080A9874
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A97FA
	lsls r0, r5, #0x10
	ldr r1, _080A9878
	adds r0, r0, r1
	lsrs r5, r0, #0x10
_080A97FA:
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	ldr r0, _080A987C
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r3, #4
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A9880
	bl GetSpriteTileStartByTag
	lsls r0, r0, #0x10
	ldr r1, _080A9884
	cmp r0, r1
	bne _080A9844
	ldr r1, _080A9888
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080A9844:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080A9888
	adds r0, r0, r1
	ldr r1, _080A988C
	bl SetSubspriteTables
	ldr r1, _080A9890
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #0x26]
	ldr r1, _080A9894
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A986C: .4byte 0x020380D7
_080A9870: .4byte 0xFFE00000
_080A9874: .4byte 0xFFDC0000
_080A9878: .4byte 0xFFFA0000
_080A987C: .4byte 0x085176A4
_080A9880: .4byte 0x0000271A
_080A9884: .4byte 0xFFFF0000
_080A9888: .4byte 0x020205AC
_080A988C: .4byte 0x0851769C
_080A9890: .4byte 0x03005B60
_080A9894: .4byte 0x080A9899
	thumb_func_end sub_080A97BC

	thumb_func_start sub_080A9898
sub_080A9898: @ 0x080A9898
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A98C4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #0xa]
	adds r0, #1
	adds r2, r0, #0
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080A98CC
	ldr r0, _080A98C8
	str r0, [r1]
	movs r0, #0
	strh r0, [r1, #0xa]
	b _080A98E2
	.align 2, 0
_080A98C4: .4byte 0x03005B60
_080A98C8: .4byte 0x080A98E9
_080A98CC:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
_080A98E2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A9898

	thumb_func_start sub_080A98E8
sub_080A98E8: @ 0x080A98E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A9980
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080A9984
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #0xa]
	adds r1, r0, #1
	strh r1, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd
	ble _080A9978
	ldrh r0, [r5, #0xc]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _080A9978
	ldr r3, _080A9988
	lsls r2, r2, #4
	mov ip, r2
	ldr r1, _080A998C
	add r1, ip
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r4, [r1]
	movs r2, #0x87
	lsls r2, r2, #1
	add r2, ip
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r0, _080A9990
	add r0, ip
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	strh r1, [r2]
	strh r4, [r0]
	strh r6, [r5, #0xc]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _080A9978
	strh r6, [r5, #0xe]
	strh r6, [r5, #0xa]
	ldrh r0, [r5, #0x10]
	adds r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _080A9978
	movs r0, #9
	strh r0, [r5, #0xa]
	ldr r0, _080A9994
	str r0, [r5]
_080A9978:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9980: .4byte 0x0000271A
_080A9984: .4byte 0x03005B60
_080A9988: .4byte 0x020377B4
_080A998C: .4byte 0x0000010D
_080A9990: .4byte 0x0000010F
_080A9994: .4byte 0x080A9999
	thumb_func_end sub_080A98E8

	thumb_func_start sub_080A9998
sub_080A9998: @ 0x080A9998
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A99C8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, r1, r2
	ldrh r0, [r2, #0xa]
	subs r0, #1
	adds r3, r0, #0
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080A99D0
	ldr r0, _080A99CC
	str r0, [r2]
	movs r0, #0
	strh r0, [r2, #0xa]
	b _080A99E6
	.align 2, 0
_080A99C8: .4byte 0x03005B60
_080A99CC: .4byte 0x080A99ED
_080A99D0:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
_080A99E6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A9998

	thumb_func_start sub_080A99EC
sub_080A99EC: @ 0x080A99EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	ldr r1, _080A9A2C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x25
	bne _080A9A34
	ldrh r0, [r1, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080A9A30
	adds r4, r4, r0
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	b _080A9A4E
	.align 2, 0
_080A9A2C: .4byte 0x03005B60
_080A9A30: .4byte 0x020205AC
_080A9A34:
	cmp r0, #0x27
	bne _080A9A4E
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_080A9A4E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080A99EC

	thumb_func_start AnimTask_StatsChange
AnimTask_StatsChange: @ 0x080A9A54
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r0, _080A9A78
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrh r0, [r0]
	subs r0, #0xf
	cmp r0, #0x2b
	bls _080A9A6C
	b _080A9BF0
_080A9A6C:
	lsls r0, r0, #2
	ldr r1, _080A9A7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A9A78: .4byte 0x02024174
_080A9A7C: .4byte 0x080A9A80
_080A9A80: @ jump table
	.4byte _080A9B30 @ case 0
	.4byte _080A9B36 @ case 1
	.4byte _080A9B3C @ case 2
	.4byte _080A9B42 @ case 3
	.4byte _080A9B48 @ case 4
	.4byte _080A9B4E @ case 5
	.4byte _080A9B54 @ case 6
	.4byte _080A9B5A @ case 7
	.4byte _080A9B60 @ case 8
	.4byte _080A9B66 @ case 9
	.4byte _080A9B6C @ case 10
	.4byte _080A9B72 @ case 11
	.4byte _080A9B78 @ case 12
	.4byte _080A9B7E @ case 13
	.4byte _080A9BF0 @ case 14
	.4byte _080A9BF0 @ case 15
	.4byte _080A9BF0 @ case 16
	.4byte _080A9BF0 @ case 17
	.4byte _080A9BF0 @ case 18
	.4byte _080A9BF0 @ case 19
	.4byte _080A9BF0 @ case 20
	.4byte _080A9BF0 @ case 21
	.4byte _080A9BF0 @ case 22
	.4byte _080A9BF0 @ case 23
	.4byte _080A9B84 @ case 24
	.4byte _080A9B88 @ case 25
	.4byte _080A9B8C @ case 26
	.4byte _080A9B90 @ case 27
	.4byte _080A9B94 @ case 28
	.4byte _080A9B98 @ case 29
	.4byte _080A9B9C @ case 30
	.4byte _080A9BA0 @ case 31
	.4byte _080A9BA8 @ case 32
	.4byte _080A9BB0 @ case 33
	.4byte _080A9BB8 @ case 34
	.4byte _080A9BC0 @ case 35
	.4byte _080A9BC8 @ case 36
	.4byte _080A9BD0 @ case 37
	.4byte _080A9BF0 @ case 38
	.4byte _080A9BF0 @ case 39
	.4byte _080A9BD8 @ case 40
	.4byte _080A9BDC @ case 41
	.4byte _080A9BE0 @ case 42
	.4byte _080A9BE8 @ case 43
_080A9B30:
	movs r5, #0
	movs r2, #0
	b _080A9BF8
_080A9B36:
	movs r5, #0
	movs r2, #1
	b _080A9BF8
_080A9B3C:
	movs r5, #0
	movs r2, #3
	b _080A9BF8
_080A9B42:
	movs r5, #0
	movs r2, #5
	b _080A9BF8
_080A9B48:
	movs r5, #0
	movs r2, #6
	b _080A9BF8
_080A9B4E:
	movs r5, #0
	movs r2, #2
	b _080A9BF8
_080A9B54:
	movs r5, #0
	movs r2, #4
	b _080A9BF8
_080A9B5A:
	movs r5, #1
	movs r2, #0
	b _080A9BF8
_080A9B60:
	movs r5, #1
	movs r2, #1
	b _080A9BF8
_080A9B66:
	movs r5, #1
	movs r2, #3
	b _080A9BF8
_080A9B6C:
	movs r5, #1
	movs r2, #5
	b _080A9BF8
_080A9B72:
	movs r5, #1
	movs r2, #6
	b _080A9BF8
_080A9B78:
	movs r5, #1
	movs r2, #2
	b _080A9BF8
_080A9B7E:
	movs r5, #1
	movs r2, #4
	b _080A9BF8
_080A9B84:
	movs r5, #0
	b _080A9BA2
_080A9B88:
	movs r5, #0
	b _080A9BAA
_080A9B8C:
	movs r5, #0
	b _080A9BB2
_080A9B90:
	movs r5, #0
	b _080A9BBA
_080A9B94:
	movs r5, #0
	b _080A9BC2
_080A9B98:
	movs r5, #0
	b _080A9BCA
_080A9B9C:
	movs r5, #0
	b _080A9BD2
_080A9BA0:
	movs r5, #1
_080A9BA2:
	movs r2, #0
	movs r3, #1
	b _080A9BF8
_080A9BA8:
	movs r5, #1
_080A9BAA:
	movs r2, #1
	movs r3, #1
	b _080A9BF8
_080A9BB0:
	movs r5, #1
_080A9BB2:
	movs r2, #3
	movs r3, #1
	b _080A9BF8
_080A9BB8:
	movs r5, #1
_080A9BBA:
	movs r2, #5
	movs r3, #1
	b _080A9BF8
_080A9BC0:
	movs r5, #1
_080A9BC2:
	movs r2, #6
	movs r3, #1
	b _080A9BF8
_080A9BC8:
	movs r5, #1
_080A9BCA:
	movs r2, #2
	movs r3, #1
	b _080A9BF8
_080A9BD0:
	movs r5, #1
_080A9BD2:
	movs r2, #4
	movs r3, #1
	b _080A9BF8
_080A9BD8:
	movs r5, #0
	b _080A9BE2
_080A9BDC:
	movs r5, #0
	b _080A9BEA
_080A9BE0:
	movs r5, #1
_080A9BE2:
	movs r2, #0xff
	movs r3, #0
	b _080A9BF8
_080A9BE8:
	movs r5, #1
_080A9BEA:
	movs r2, #0xff
	movs r3, #1
	b _080A9BF8
_080A9BF0:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _080A9C1A
_080A9BF8:
	ldr r0, _080A9C20
	movs r1, #0
	strh r5, [r0]
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r3, [r0, #8]
	ldr r1, _080A9C24
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080A9C28
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
_080A9C1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C20: .4byte 0x020380BE
_080A9C24: .4byte 0x03005B60
_080A9C28: .4byte 0x08117705
	thumb_func_end AnimTask_StatsChange

	thumb_func_start LaunchStatusAnimation
LaunchStatusAnimation: @ 0x080A9C2C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080A9C68
	strb r4, [r0]
	ldr r0, _080A9C6C
	strb r4, [r0]
	ldr r0, _080A9C70
	movs r2, #0
	bl LaunchBattleAnimation
	ldr r0, _080A9C74
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A9C78
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C68: .4byte 0x020380D6
_080A9C6C: .4byte 0x020380D7
_080A9C70: .4byte 0x08277888
_080A9C74: .4byte 0x080A9C7D
_080A9C78: .4byte 0x03005B60
	thumb_func_end LaunchStatusAnimation

	thumb_func_start Task_DoStatusAnimation
Task_DoStatusAnimation: @ 0x080A9C7C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A9CC4
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _080A9CC8
	thumb_func_end Task_DoStatusAnimation

	thumb_func_start sub_080A9C8C
sub_080A9C8C: @ 0x080A9C8C
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A9CBE
	ldr r0, _080A9CCC
	ldr r2, [r0]
	ldr r1, _080A9CD0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	ldr r2, [r2, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl DestroyTask
_080A9CBE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9CC4: .4byte 0x02038098
_080A9CC8: .4byte 0x0203809D
_080A9CCC: .4byte 0x02024174
_080A9CD0: .4byte 0x03005B60
	thumb_func_end sub_080A9C8C

