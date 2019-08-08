.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start RemoveBagSprite
RemoveBagSprite: @ 0x080D452C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080D4578
	ldr r2, _080D457C
	adds r1, r4, r2
	ldr r0, [r0]
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _080D4572
	adds r4, #0x64
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080D4580
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	movs r0, #0xff
	strb r0, [r5]
_080D4572:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D4578: .4byte 0x0203CB20
_080D457C: .4byte 0x00000804
_080D4580: .4byte 0x020205AC
	thumb_func_end RemoveBagSprite

	thumb_func_start AddBagVisualSprite
AddBagVisualSprite: @ 0x080D4584
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080D45B0
	ldr r4, [r0]
	ldr r0, _080D45B4
	adds r4, r4, r0
	ldr r0, _080D45B8
	movs r1, #0x44
	movs r2, #0x42
	movs r3, #0
	bl CreateSprite
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl SetBagVisualPocketId
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D45B0: .4byte 0x0203CB20
_080D45B4: .4byte 0x00000804
_080D45B8: .4byte 0x0855A67C
	thumb_func_end AddBagVisualSprite

	thumb_func_start SetBagVisualPocketId
SetBagVisualPocketId: @ 0x080D45BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	ldr r0, _080D45F4
	ldr r0, [r0]
	ldr r2, _080D45F8
	adds r0, r0, r2
	ldrb r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080D45FC
	adds r2, r0, r2
	cmp r1, #0
	beq _080D4608
	ldr r0, _080D4600
	strh r0, [r2, #0x26]
	ldr r0, _080D4604
	str r0, [r2, #0x1c]
	adds r0, r3, #1
	strh r0, [r2, #0x2e]
	adds r0, r2, #0
	movs r1, #0
	bl StartSpriteAnim
	b _080D4614
	.align 2, 0
_080D45F4: .4byte 0x0203CB20
_080D45F8: .4byte 0x00000804
_080D45FC: .4byte 0x020205AC
_080D4600: .4byte 0x0000FFFB
_080D4604: .4byte 0x080D4619
_080D4608:
	adds r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl StartSpriteAnim
_080D4614:
	pop {r0}
	bx r0
	thumb_func_end SetBagVisualPocketId

	thumb_func_start SpriteCB_BagVisualSwitchingPockets
SpriteCB_BagVisualSwitchingPockets: @ 0x080D4618
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x26]
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080D462C
	adds r0, r1, #1
	strh r0, [r4, #0x26]
	b _080D463C
_080D462C:
	ldrh r1, [r4, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r0, _080D4644
	str r0, [r4, #0x1c]
_080D463C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4644: .4byte 0x08007141
	thumb_func_end SpriteCB_BagVisualSwitchingPockets

	thumb_func_start ShakeBagVisual
ShakeBagVisual: @ 0x080D4648
	push {r4, lr}
	ldr r0, _080D4680
	ldr r0, [r0]
	ldr r1, _080D4684
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080D4688
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080D4678
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r0, _080D468C
	str r0, [r4, #0x1c]
_080D4678:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4680: .4byte 0x0203CB20
_080D4684: .4byte 0x00000804
_080D4688: .4byte 0x020205AC
_080D468C: .4byte 0x080D4691
	thumb_func_end ShakeBagVisual

	thumb_func_start SpriteCB_ShakeBagVisual
SpriteCB_ShakeBagVisual: @ 0x080D4690
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080D46AC
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	ldr r0, _080D46B4
	str r0, [r4, #0x1c]
_080D46AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D46B4: .4byte 0x08007141
	thumb_func_end SpriteCB_ShakeBagVisual

	thumb_func_start AddSwitchPocketRotatingBallSprite
AddSwitchPocketRotatingBallSprite: @ 0x080D46B8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080D46F8
	ldr r4, [r0]
	ldr r0, _080D46FC
	adds r4, r4, r0
	ldr r0, _080D4700
	bl LoadSpriteSheet
	ldr r0, _080D4704
	bl LoadSpritePalette
	ldr r0, _080D4708
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl CreateSprite
	strb r0, [r4]
	ldr r2, _080D470C
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D46F8: .4byte 0x0203CB20
_080D46FC: .4byte 0x00000805
_080D4700: .4byte 0x0855A6D0
_080D4704: .4byte 0x0855A6D8
_080D4708: .4byte 0x0855A6E0
_080D470C: .4byte 0x020205AC
	thumb_func_end AddSwitchPocketRotatingBallSprite

	thumb_func_start UpdateSwitchPocketRotatingBallCoords
UpdateSwitchPocketRotatingBallCoords: @ 0x080D4710
	ldrh r2, [r0, #0x30]
	ldrh r1, [r0, #0x34]
	adds r1, #1
	movs r3, #1
	ands r1, r3
	subs r2, r2, r1
	adds r1, r0, #0
	adds r1, #0x28
	strb r2, [r1]
	ldrh r2, [r0, #0x30]
	ldrh r1, [r0, #0x34]
	adds r1, #1
	ands r1, r3
	subs r2, r2, r1
	adds r0, #0x29
	strb r2, [r0]
	bx lr
	.align 2, 0
	thumb_func_end UpdateSwitchPocketRotatingBallCoords

	thumb_func_start SpriteCB_SwitchPocketRotatingBallInit
SpriteCB_SwitchPocketRotatingBallInit: @ 0x080D4734
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080D475C
	ldr r0, _080D4758
	b _080D475E
	.align 2, 0
_080D4758: .4byte 0x0855A6C8
_080D475C:
	ldr r0, _080D4790
_080D475E:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl InitSpriteAffineAnim
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x30]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x30]
	adds r0, r4, #0
	bl UpdateSwitchPocketRotatingBallCoords
	ldr r0, _080D4794
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4790: .4byte 0x0855A6CC
_080D4794: .4byte 0x080D4799
	thumb_func_end SpriteCB_SwitchPocketRotatingBallInit

	thumb_func_start SpriteCB_SwitchPocketRotatingBallContinue
SpriteCB_SwitchPocketRotatingBallContinue: @ 0x080D4798
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl UpdateSwitchPocketRotatingBallCoords
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _080D47B6
	movs r0, #1
	bl RemoveBagSprite
_080D47B6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_SwitchPocketRotatingBallContinue

	thumb_func_start AddBagItemIconSprite
AddBagItemIconSprite: @ 0x080D47BC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _080D4810
	ldr r2, _080D4814
	adds r1, r4, r2
	ldr r0, [r0]
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _080D480A
	adds r4, #0x66
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl AddItemIconSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _080D480A
	strb r2, [r5]
	ldr r1, _080D4818
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0, #0x24]
	movs r1, #0x58
	strh r1, [r0, #0x26]
_080D480A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4810: .4byte 0x0203CB20
_080D4814: .4byte 0x00000806
_080D4818: .4byte 0x020205AC
	thumb_func_end AddBagItemIconSprite

	thumb_func_start RemoveBagItemIconSprite
RemoveBagItemIconSprite: @ 0x080D481C
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	bl RemoveBagSprite
	pop {r0}
	bx r0
	thumb_func_end RemoveBagItemIconSprite

	thumb_func_start sub_080D4830
sub_080D4830: @ 0x080D4830
	push {lr}
	ldr r0, _080D4844
	ldr r0, [r0]
	ldr r1, _080D4848
	adds r0, r0, r1
	movs r1, #8
	bl sub_08122350
	pop {r0}
	bx r0
	.align 2, 0
_080D4844: .4byte 0x0203CB20
_080D4848: .4byte 0x00000808
	thumb_func_end sub_080D4830

	thumb_func_start sub_080D484C
sub_080D484C: @ 0x080D484C
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _080D4868
	ldr r0, [r0]
	ldr r1, _080D486C
	adds r0, r0, r1
	movs r1, #8
	bl sub_08122408
	pop {r0}
	bx r0
	.align 2, 0
_080D4868: .4byte 0x0203CB20
_080D486C: .4byte 0x00000808
	thumb_func_end sub_080D484C

	thumb_func_start sub_080D4870
sub_080D4870: @ 0x080D4870
	push {lr}
	adds r3, r0, #0
	lsls r3, r3, #0x18
	ldr r0, _080D4894
	ldr r0, [r0]
	ldr r1, _080D4898
	adds r0, r0, r1
	lsrs r3, r3, #4
	movs r1, #0x80
	lsls r1, r1, #0xd
	adds r3, r3, r1
	lsrs r3, r3, #0x10
	movs r1, #0x88
	movs r2, #0x78
	bl sub_08122454
	pop {r0}
	bx r0
	.align 2, 0
_080D4894: .4byte 0x0203CB20
_080D4898: .4byte 0x00000808
	thumb_func_end sub_080D4870

	thumb_func_start sub_080D489C
sub_080D489C: @ 0x080D489C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r4, #0
	movs r1, #0
	bl memset
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r7, #0
_080D48BA:
	adds r4, #0x20
	movs r5, #0
	adds r1, r7, #1
	mov r8, r1
_080D48C2:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x20
	bl memcpy
	adds r4, #0x20
	adds r6, #0x20
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _080D48C2
	cmp r7, #5
	beq _080D48E0
	adds r4, #0x20
_080D48E0:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #5
	bls _080D48BA
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080D489C

	thumb_func_start LoadBerryGfx
LoadBerryGfx: @ 0x080D48F4
	push {r4, r5, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #0x2a
	bne _080D4906
	bl IsEnigmaBerryValid
_080D4906:
	ldr r5, _080D4944
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, _080D4948
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r1, _080D494C
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadCompressedSpritePalette
	adds r4, r4, r5
	ldr r0, [r4]
	ldr r4, _080D4950
	adds r1, r4, #0
	bl LZDecompressVram
	ldr r0, _080D4954
	adds r1, r4, r0
	adds r0, r4, #0
	bl sub_080D489C
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D4944: .4byte 0x0855A7C4
_080D4948: .4byte 0xFFFF0000
_080D494C: .4byte 0x00007544
_080D4950: .4byte 0x0201D000
_080D4954: .4byte 0xFFFFF000
	thumb_func_end LoadBerryGfx

	thumb_func_start CreateBerryTagSprite
CreateBerryTagSprite: @ 0x080D4958
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl LoadBerryGfx
	ldr r0, _080D498C
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D498C: .4byte 0x0855A71C
	thumb_func_end CreateBerryTagSprite

	thumb_func_start FreeBerryTagSpritePalette
FreeBerryTagSpritePalette: @ 0x080D4990
	push {lr}
	ldr r0, _080D499C
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_080D499C: .4byte 0x00007544
	thumb_func_end FreeBerryTagSpritePalette

	thumb_func_start LoadSpinningBerryPicGfx
LoadSpinningBerryPicGfx: @ 0x080D49A0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080D4A04
	bl FreeSpritePaletteByTag
	adds r0, r4, #0
	bl LoadBerryGfx
	ldr r0, _080D4A08
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r4, r1, #0
	mov r0, r8
	cmp r0, #1
	bne _080D49F6
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080D4A0C
	adds r0, r0, r1
	movs r1, #1
	bl StartSpriteAffineAnim
_080D49F6:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D4A04: .4byte 0x00007544
_080D4A08: .4byte 0x0855A7AC
_080D4A0C: .4byte 0x020205AC
	thumb_func_end LoadSpinningBerryPicGfx

	thumb_func_start CreateBerryFlavorCircleSprite
CreateBerryFlavorCircleSprite: @ 0x080D4A10
	push {lr}
	adds r1, r0, #0
	ldr r0, _080D4A2C
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x63
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080D4A2C: .4byte 0x0855A940
	thumb_func_end CreateBerryFlavorCircleSprite

