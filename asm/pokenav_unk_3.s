.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081CA294
sub_081CA294: @ 0x081CA294
	push {r4, lr}
	movs r1, #0xd4
	lsls r1, r1, #1
	movs r0, #5
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CA2C8
	ldr r0, _081CA2C0
	str r0, [r4, #0x18]
	movs r0, #0
	strh r0, [r4, #8]
	str r0, [r4, #0x10]
	ldr r0, _081CA2C4
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #0x14]
	movs r0, #1
	b _081CA2CA
	.align 2, 0
_081CA2C0: .4byte 0x081CA2F1
_081CA2C4: .4byte 0x081CA4CD
_081CA2C8:
	movs r0, #0
_081CA2CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CA294

	thumb_func_start sub_081CA2D0
sub_081CA2D0: @ 0x081CA2D0
	push {lr}
	movs r0, #5
	bl GetSubstructPtr
	ldr r1, [r0, #0x18]
	bl _call_via_r1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA2D0

	thumb_func_start sub_081CA2E4
sub_081CA2E4: @ 0x081CA2E4
	push {lr}
	movs r0, #5
	bl FreePokenavSubstruct
	pop {r0}
	bx r0
	thumb_func_end sub_081CA2E4

	thumb_func_start sub_081CA2F0
sub_081CA2F0: @ 0x081CA2F0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _081CA304
	ldrh r1, [r3, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081CA308
	movs r0, #2
	b _081CA3A0
	.align 2, 0
_081CA304: .4byte 0x03002360
_081CA308:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081CA314
	movs r0, #1
	b _081CA3A0
_081CA314:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081CA320
	movs r0, #4
	b _081CA3A0
_081CA320:
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _081CA330
	movs r0, #3
	b _081CA3A0
_081CA330:
	ldrh r1, [r3, #0x2e]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _081CA37C
	ldr r0, _081CA364
	str r0, [r4, #0x18]
	strh r2, [r4]
	bl GetSelectedMatchCall
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrb r0, [r1, #0x1c]
	cmp r0, #0
	beq _081CA35A
	ldrh r0, [r1, #0x1e]
	bl sub_081D0F04
	cmp r0, #0
	beq _081CA36C
_081CA35A:
	ldr r0, _081CA368
	str r0, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	b _081CA372
	.align 2, 0
_081CA364: .4byte 0x081CA3B1
_081CA368: .4byte 0x085F3E96
_081CA36C:
	ldr r0, _081CA378
	str r0, [r4, #4]
	strh r5, [r4, #2]
_081CA372:
	movs r0, #5
	b _081CA3A0
	.align 2, 0
_081CA378: .4byte 0x085F3E94
_081CA37C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081CA39E
	bl GetPokenavMode
	cmp r0, #1
	beq _081CA398
	ldr r0, _081CA394
	str r0, [r4, #0x18]
	movs r0, #0xf
	b _081CA3A0
	.align 2, 0
_081CA394: .4byte 0x081CA3A9
_081CA398:
	movs r0, #0x20
	bl PlaySE
_081CA39E:
	movs r0, #0
_081CA3A0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA2F0

	thumb_func_start sub_081CA3A8
sub_081CA3A8: @ 0x081CA3A8
	ldr r0, _081CA3AC
	bx lr
	.align 2, 0
_081CA3AC: .4byte 0x000186A4
	thumb_func_end sub_081CA3A8

	thumb_func_start sub_081CA3B0
sub_081CA3B0: @ 0x081CA3B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _081CA3CC
	ldrh r1, [r2, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081CA3D0
	ldrh r0, [r4]
	cmp r0, #0
	beq _081CA3D0
	subs r0, #1
	b _081CA3E4
	.align 2, 0
_081CA3CC: .4byte 0x03002360
_081CA3D0:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081CA3EA
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	cmp r0, r1
	bhs _081CA3EA
	adds r0, #1
_081CA3E4:
	strh r0, [r4]
	movs r0, #6
	b _081CA458
_081CA3EA:
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081CA444
	ldrh r1, [r4]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _081CA438
	cmp r0, #1
	bgt _081CA40A
	cmp r0, #0
	beq _081CA410
	b _081CA444
_081CA40A:
	cmp r0, #2
	bne _081CA444
	b _081CA452
_081CA410:
	bl GetPokenavMode
	cmp r0, #1
	bne _081CA41E
	movs r0, #2
	bl SetPokenavMode
_081CA41E:
	ldr r0, _081CA430
	str r0, [r4, #0x18]
	bl sub_081CA974
	cmp r0, #0
	beq _081CA434
	movs r0, #9
	b _081CA458
	.align 2, 0
_081CA430: .4byte 0x081CA4A5
_081CA434:
	movs r0, #8
	b _081CA458
_081CA438:
	ldr r0, _081CA440
	str r0, [r4, #0x18]
	movs r0, #0xb
	b _081CA458
	.align 2, 0
_081CA440: .4byte 0x081CA465
_081CA444:
	ldrh r1, [r2, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081CA452
	movs r0, #0
	b _081CA458
_081CA452:
	ldr r0, _081CA460
	str r0, [r4, #0x18]
	movs r0, #7
_081CA458:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CA460: .4byte 0x081CA2F1
	thumb_func_end sub_081CA3B0

	thumb_func_start sub_081CA464
sub_081CA464: @ 0x081CA464
	push {lr}
	adds r3, r0, #0
	ldr r2, _081CA478
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081CA47C
	movs r0, #0xc
	b _081CA49C
	.align 2, 0
_081CA478: .4byte 0x03002360
_081CA47C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081CA488
	movs r0, #0xd
	b _081CA49C
_081CA488:
	ldrh r1, [r2, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081CA496
	movs r0, #0
	b _081CA49C
_081CA496:
	ldr r0, _081CA4A0
	str r0, [r3, #0x18]
	movs r0, #0xe
_081CA49C:
	pop {r1}
	bx r1
	.align 2, 0
_081CA4A0: .4byte 0x081CA2F1
	thumb_func_end sub_081CA464

	thumb_func_start sub_081CA4A4
sub_081CA4A4: @ 0x081CA4A4
	push {lr}
	adds r2, r0, #0
	ldr r0, _081CA4B8
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081CA4BC
	movs r0, #0
	b _081CA4C2
	.align 2, 0
_081CA4B8: .4byte 0x03002360
_081CA4BC:
	ldr r0, _081CA4C8
	str r0, [r2, #0x18]
	movs r0, #0xa
_081CA4C2:
	pop {r1}
	bx r1
	.align 2, 0
_081CA4C8: .4byte 0x081CA2F1
	thumb_func_end sub_081CA4A4

	thumb_func_start sub_081CA4CC
sub_081CA4CC: @ 0x081CA4CC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #5
	bl GetSubstructPtr
	adds r4, r0, #0
	cmp r5, #1
	beq _081CA4F8
	cmp r5, #1
	bgt _081CA4E6
	cmp r5, #0
	beq _081CA4F0
	b _081CA5AC
_081CA4E6:
	cmp r5, #2
	beq _081CA548
	cmp r5, #3
	beq _081CA5A8
	b _081CA5AC
_081CA4F0:
	strh r5, [r4, #8]
	strh r5, [r4, #0xa]
_081CA4F4:
	movs r0, #1
	b _081CA5AE
_081CA4F8:
	movs r6, #0
	ldrh r5, [r4, #8]
_081CA4FC:
	adds r0, r5, #0
	bl MatchCallFlagGetByIndex
	cmp r0, #0
	beq _081CA52C
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #2
	adds r0, r4, r0
	strh r5, [r0, #0x1e]
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	strb r1, [r0, #0x1c]
	adds r0, r5, #0
	bl MatchCallMapSecGetByIndex
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #2
	adds r1, r4, r1
	strb r0, [r1, #0x1d]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
_081CA52C:
	ldrh r0, [r4, #8]
	adds r1, r0, #1
	movs r2, #0
	strh r1, [r4, #8]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	bhi _081CA5A2
	adds r6, #1
	adds r5, #1
	cmp r6, #0x1d
	ble _081CA4FC
	movs r0, #3
	b _081CA5AE
_081CA548:
	movs r6, #0
	ldrh r5, [r4, #8]
	movs r7, #0
_081CA54E:
	ldrh r0, [r4, #8]
	bl sub_081D12F4
	cmp r0, #0
	bne _081CA588
	ldrh r0, [r4, #8]
	bl sub_081CA5B4
	cmp r0, #0
	beq _081CA588
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldrh r1, [r4, #8]
	strh r1, [r0, #0x1e]
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #2
	adds r0, r4, r0
	strb r7, [r0, #0x1c]
	adds r0, r5, #0
	bl sub_081CA86C
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #2
	adds r1, r4, r1
	strb r0, [r1, #0x1d]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
_081CA588:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4d
	bhi _081CA4F4
	adds r6, #1
	adds r5, #1
	cmp r6, #0x1d
	ble _081CA54E
	movs r0, #3
	b _081CA5AE
_081CA5A2:
	strh r1, [r4, #0xc]
	strh r2, [r4, #8]
	b _081CA4F4
_081CA5A8:
	movs r0, #1
	str r0, [r4, #0x10]
_081CA5AC:
	movs r0, #4
_081CA5AE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081CA4CC

	thumb_func_start sub_081CA5B4
sub_081CA5B4: @ 0x081CA5B4
	push {lr}
	cmp r0, #0x4d
	ble _081CA5BE
	movs r0, #0
	b _081CA5D0
_081CA5BE:
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_081CA5D0:
	pop {r1}
	bx r1
	thumb_func_end sub_081CA5B4

	thumb_func_start sub_081CA5D4
sub_081CA5D4: @ 0x081CA5D4
	push {lr}
	movs r0, #5
	bl GetSubstructPtr
	ldr r0, [r0, #0x10]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA5D4

	thumb_func_start sub_081CA5E4
sub_081CA5E4: @ 0x081CA5E4
	push {lr}
	movs r0, #5
	bl GetSubstructPtr
	ldrh r0, [r0, #0xa]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA5E4

	thumb_func_start sub_081CA5F4
sub_081CA5F4: @ 0x081CA5F4
	push {lr}
	movs r0, #5
	bl GetSubstructPtr
	ldrh r0, [r0, #0xc]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA5F4

	thumb_func_start unref_sub_81CAE58
unref_sub_81CAE58: @ 0x081CA604
	push {lr}
	movs r0, #5
	bl GetSubstructPtr
	adds r1, r0, #0
	ldrh r0, [r1, #0xa]
	ldrh r1, [r1, #0xc]
	subs r0, r0, r1
	pop {r1}
	bx r1
	thumb_func_end unref_sub_81CAE58

	thumb_func_start unref_sub_81CAE6C
unref_sub_81CAE6C: @ 0x081CA618
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSubstructPtr
	adds r1, r0, #0
	ldrh r0, [r1, #0xc]
	adds r4, r4, r0
	ldrh r0, [r1, #0xa]
	cmp r4, r0
	bge _081CA636
	lsls r0, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0, #0x1e]
	b _081CA638
_081CA636:
	movs r0, #0x4e
_081CA638:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end unref_sub_81CAE6C

	thumb_func_start sub_081CA640
sub_081CA640: @ 0x081CA640
	push {lr}
	movs r0, #5
	bl GetSubstructPtr
	adds r0, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA640

	thumb_func_start sub_081CA650
sub_081CA650: @ 0x081CA650
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSubstructPtr
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r0, [r0, #0x1d]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA650

	thumb_func_start sub_081CA668
sub_081CA668: @ 0x081CA668
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSubstructPtr
	lsls r1, r4, #2
	adds r1, r0, r1
	ldrb r0, [r1, #0x1c]
	cmp r0, #0
	bne _081CA680
	ldrh r4, [r1, #0x1e]
	b _081CA688
_081CA680:
	ldrh r0, [r1, #0x1e]
	bl MatchCall_GetRematchTableIdx
	adds r4, r0, #0
_081CA688:
	cmp r4, #0x4e
	beq _081CA6A8
	ldr r0, _081CA6A0
	ldr r0, [r0]
	ldr r1, _081CA6A4
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r1, [r0]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _081CA6AA
	.align 2, 0
_081CA6A0: .4byte 0x03005AEC
_081CA6A4: .4byte 0x000009CA
_081CA6A8:
	movs r0, #0
_081CA6AA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CA668

	thumb_func_start sub_081CA6B0
sub_081CA6B0: @ 0x081CA6B0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSubstructPtr
	lsls r1, r4, #2
	adds r1, r0, r1
	ldrb r0, [r1, #0x1c]
	cmp r0, #0
	bne _081CA6DC
	ldrh r0, [r1, #0x1e]
	bl GetTrainerIdxByRematchIdx
	adds r4, r0, #0
	ldr r1, _081CA6D8
	lsls r0, r4, #5
	adds r0, r0, r1
	ldrb r0, [r0, #3]
	b _081CA710
	.align 2, 0
_081CA6D8: .4byte 0x082E383C
_081CA6DC:
	ldrh r5, [r1, #0x1e]
	adds r0, r5, #0
	bl MatchCall_GetRematchTableIdx
	adds r4, r0, #0
	cmp r4, #0x4e
	bne _081CA700
	adds r0, r5, #0
	bl sub_081D12CC
	adds r4, r0, #0
	ldr r0, _081CA6FC
	adds r0, r4, r0
	ldrb r0, [r0]
	b _081CA710
	.align 2, 0
_081CA6FC: .4byte 0x082EFF00
_081CA700:
	adds r0, r4, #0
	bl GetTrainerIdxByRematchIdx
	adds r4, r0, #0
	ldr r0, _081CA718
	lsls r1, r4, #5
	adds r1, r1, r0
	ldrb r0, [r1, #3]
_081CA710:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081CA718: .4byte 0x082E383C
	thumb_func_end sub_081CA6B0

	thumb_func_start sub_081CA71C
sub_081CA71C: @ 0x081CA71C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #5
	bl GetSubstructPtr
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r6]
	ldr r0, _081CA740
	ldrb r0, [r0, #0x17]
	bl Overworld_MapTypeAllowsTeleportAndFly
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CA748
	ldr r0, _081CA744
	b _081CA772
	.align 2, 0
_081CA740: .4byte 0x02036FB8
_081CA744: .4byte 0x085F3E99
_081CA748:
	lsls r0, r5, #2
	adds r1, r4, r0
	ldrb r0, [r1, #0x1c]
	cmp r0, #0
	bne _081CA768
	ldrh r0, [r1, #0x1e]
	bl GetTrainerIdxByRematchIdx
	ldr r1, _081CA764
	bl SelectMatchCallMessage
	strb r0, [r6]
	b _081CA770
	.align 2, 0
_081CA764: .4byte 0x02021C7C
_081CA768:
	ldrh r0, [r1, #0x1e]
	ldr r1, _081CA778
	bl MatchCall_GetMessage
_081CA770:
	ldr r0, _081CA778
_081CA772:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081CA778: .4byte 0x02021C7C
	thumb_func_end sub_081CA71C

	thumb_func_start sub_081CA77C
sub_081CA77C: @ 0x081CA77C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSubstructPtr
	lsls r4, r4, #2
	adds r4, r0, r4
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	beq _081CA7A8
	ldrh r0, [r4, #0x1e]
	bl MatchCall_GetRematchTableIdx
	adds r1, r0, #0
	cmp r1, #0x4e
	bne _081CA7AA
	ldrh r0, [r4, #0x1e]
	adds r1, r5, #0
	bl sub_081D123C
	b _081CA7B6
_081CA7A8:
	ldrh r1, [r4, #0x1e]
_081CA7AA:
	ldr r2, _081CA7BC
	lsls r0, r5, #2
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
_081CA7B6:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081CA7BC: .4byte 0x085F39B4
	thumb_func_end sub_081CA77C

	thumb_func_start sub_081CA7C0
sub_081CA7C0: @ 0x081CA7C0
	push {lr}
	movs r0, #5
	bl GetSubstructPtr
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA7C0

	thumb_func_start sub_081CA7D0
sub_081CA7D0: @ 0x081CA7D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSubstructPtr
	adds r1, r0, #0
	ldrh r0, [r1, #2]
	cmp r0, r4
	blt _081CA7EA
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	b _081CA7EC
_081CA7EA:
	movs r0, #3
_081CA7EC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA7D0

	thumb_func_start sub_081CA7F4
sub_081CA7F4: @ 0x081CA7F4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	bl StringFill
	ldrb r0, [r4]
	cmp r0, #0
	bne _081CA834
	ldrh r0, [r4, #2]
	bl GetTrainerIdxByRematchIdx
	lsls r0, r0, #5
	ldr r1, _081CA82C
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	movs r1, #0xb
	muls r1, r2, r1
	ldr r2, _081CA830
	adds r1, r1, r2
	str r1, [sp]
	adds r0, #4
	str r0, [sp, #4]
	b _081CA83E
	.align 2, 0
_081CA82C: .4byte 0x082E383C
_081CA830: .4byte 0x082E3564
_081CA834:
	ldrh r0, [r4, #2]
	add r2, sp, #4
	mov r1, sp
	bl sub_081D1178
_081CA83E:
	ldr r1, [sp]
	cmp r1, #0
	beq _081CA864
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _081CA864
	adds r0, r5, #0
	bl StringCopy
	movs r4, #0
	strb r4, [r0]
	adds r0, r5, #0
	adds r0, #0xa
	ldr r1, [sp, #4]
	bl StringCopy
	strb r4, [r0]
	movs r0, #0xff
	strb r0, [r5, #0xf]
_081CA864:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081CA7F4

	thumb_func_start sub_081CA86C
sub_081CA86C: @ 0x081CA86C
	push {lr}
	ldr r1, _081CA884
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r2, [r0, #0xa]
	ldrh r1, [r0, #0xc]
	adds r0, r2, #0
	bl Overworld_GetMapHeaderByGroupAndId
	ldrb r0, [r0, #0x14]
	pop {r1}
	bx r1
	.align 2, 0
_081CA884: .4byte 0x0852AD40
	thumb_func_end sub_081CA86C

	thumb_func_start sub_081CA888
sub_081CA888: @ 0x081CA888
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #5
	bl GetSubstructPtr
	adds r7, r0, #0
	movs r6, #1
	adds r5, #1
	ldrh r0, [r7, #0xa]
	cmp r5, r0
	bge _081CA8C4
	lsls r0, r5, #2
	adds r0, #0x1c
	adds r4, r0, r7
_081CA8A4:
	ldrb r0, [r4]
	cmp r0, #0
	beq _081CA8B4
	ldrh r0, [r4, #2]
	bl sub_081D0F04
	cmp r0, #0
	beq _081CA8B8
_081CA8B4:
	adds r0, r6, #0
	b _081CA8C6
_081CA8B8:
	adds r6, #1
	adds r4, #4
	adds r5, #1
	ldrh r0, [r7, #0xa]
	cmp r5, r0
	blt _081CA8A4
_081CA8C4:
	movs r0, #0
_081CA8C6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081CA888

	thumb_func_start sub_081CA8CC
sub_081CA8CC: @ 0x081CA8CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #5
	bl GetSubstructPtr
	adds r1, r0, #0
	movs r6, #1
	rsbs r6, r6, #0
	subs r5, #1
	cmp r5, #0
	blt _081CA906
	lsls r0, r5, #2
	adds r0, #0x1c
	adds r4, r0, r1
_081CA8E8:
	ldrb r0, [r4]
	cmp r0, #0
	beq _081CA8F8
	ldrh r0, [r4, #2]
	bl sub_081D0F04
	cmp r0, #0
	beq _081CA8FC
_081CA8F8:
	adds r0, r6, #0
	b _081CA908
_081CA8FC:
	subs r6, #1
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _081CA8E8
_081CA906:
	movs r0, #0
_081CA908:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CA8CC

	thumb_func_start unref_sub_81CB16C
unref_sub_81CB16C: @ 0x081CA910
	push {r4, lr}
	movs r4, #0
_081CA914:
	adds r0, r4, #0
	bl sub_081CA5B4
	cmp r0, #0
	beq _081CA92E
	ldr r0, _081CA95C
	ldr r0, [r0]
	ldr r1, _081CA960
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _081CA956
_081CA92E:
	adds r4, #1
	cmp r4, #0x4d
	ble _081CA914
	movs r4, #0
_081CA936:
	adds r0, r4, #0
	bl MatchCallFlagGetByIndex
	cmp r0, #0
	beq _081CA964
	adds r0, r4, #0
	bl MatchCall_GetRematchTableIdx
	ldr r1, _081CA95C
	ldr r1, [r1]
	ldr r2, _081CA960
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _081CA964
_081CA956:
	movs r0, #1
	b _081CA96C
	.align 2, 0
_081CA95C: .4byte 0x03005AEC
_081CA960: .4byte 0x000009CA
_081CA964:
	adds r4, #1
	cmp r4, #0x14
	ble _081CA936
	movs r0, #0
_081CA96C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end unref_sub_81CB16C

	thumb_func_start sub_081CA974
sub_081CA974: @ 0x081CA974
	push {r4, lr}
	movs r0, #5
	bl GetSubstructPtr
	adds r4, r0, #0
	bl GetSelectedMatchCall
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r4, r4, r0
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _081CA9BC
	adds r0, r1, #0
	bl sub_081CA650
	ldr r1, _081CA9B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #0x14]
	cmp r0, r1
	bne _081CA9FC
	ldr r0, _081CA9B4
	ldr r0, [r0]
	ldr r1, _081CA9B8
	adds r0, r0, r1
	ldrh r4, [r4, #0x1e]
	adds r0, r0, r4
	ldrb r0, [r0]
	b _081CA9EA
	.align 2, 0
_081CA9B0: .4byte 0x02036FB8
_081CA9B4: .4byte 0x03005AEC
_081CA9B8: .4byte 0x000009CA
_081CA9BC:
	ldrh r0, [r4, #0x1e]
	cmp r0, #0xb
	bne _081CA9FC
	adds r0, r1, #0
	bl sub_081CA650
	ldr r1, _081CA9F4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #0x14]
	cmp r0, r1
	bne _081CA9FC
	ldr r0, _081CA9F8
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081CA9FC
	movs r0, #0x5b
	bl FlagGet
	lsls r0, r0, #0x18
_081CA9EA:
	cmp r0, #0
	bne _081CA9FC
	movs r0, #1
	b _081CA9FE
	.align 2, 0
_081CA9F4: .4byte 0x02036FB8
_081CA9F8: .4byte 0x0000086B
_081CA9FC:
	movs r0, #0
_081CA9FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CA974

