.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start BufferStringBattle
BufferStringBattle: @ 0x0814E184
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r7, #0
	ldr r4, _0814E22C
	ldr r0, _0814E230
	mov ip, r0
	ldrb r1, [r0]
	lsls r1, r1, #9
	ldr r0, _0814E234
	adds r1, r1, r0
	str r1, [r4]
	ldr r2, _0814E238
	ldrh r0, [r1, #4]
	strh r0, [r2]
	ldr r2, _0814E23C
	ldrb r0, [r1, #6]
	strb r0, [r2]
	ldr r5, _0814E240
	ldrb r0, [r1, #7]
	strb r0, [r5, #0x17]
	ldr r3, _0814E244
	ldr r0, [r3]
	adds r0, #0x52
	ldrb r1, [r1, #8]
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, #0xb1
	ldr r1, [r4]
	ldrb r1, [r1, #9]
	strb r1, [r0]
	ldr r1, _0814E248
	ldr r2, [r4]
	ldrb r0, [r2, #0xa]
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, #0x8e
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	movs r2, #0
	mov r8, r5
	ldr r1, _0814E24C
	mov sb, r1
	ldr r3, _0814E250
_0814E1E2:
	adds r0, r2, r3
	ldr r1, [r4]
	adds r1, #0xc
	adds r1, r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _0814E1E2
	movs r2, #0
	ldr r5, _0814E24C
	ldr r3, _0814E22C
	ldr r4, _0814E254
_0814E1FC:
	adds r1, r2, r5
	ldr r0, [r3]
	adds r0, #0x10
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r4
	ldr r0, [r3]
	adds r0, #0x20
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, #1
	cmp r2, #0xf
	ble _0814E1FC
	cmp r6, #5
	bls _0814E220
	b _0814E768
_0814E220:
	lsls r0, r6, #2
	ldr r1, _0814E258
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814E22C: .4byte 0x0203A874
_0814E230: .4byte 0x02023D08
_0814E234: .4byte 0x02022D0C
_0814E238: .4byte 0x02023EAC
_0814E23C: .4byte 0x02023EAE
_0814E240: .4byte 0x02024118
_0814E244: .4byte 0x02024140
_0814E248: .4byte 0x02023EB3
_0814E24C: .4byte 0x02022C0C
_0814E250: .4byte 0x0203A870
_0814E254: .4byte 0x02022C1C
_0814E258: .4byte 0x0814E25C
_0814E25C: @ jump table
	.4byte _0814E274 @ case 0
	.4byte _0814E354 @ case 1
	.4byte _0814E43C @ case 2
	.4byte _0814E4D8 @ case 3
	.4byte _0814E5A0 @ case 4
	.4byte _0814E600 @ case 5
_0814E274:
	ldr r0, _0814E2AC
	ldr r2, [r0]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0814E314
	ldr r0, _0814E2B0
	ands r0, r2
	cmp r0, #0
	beq _0814E2F0
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0814E308
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0814E2BC
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r2, r0
	ldr r7, _0814E2B4
	cmp r2, #0
	bne _0814E2A8
	b _0814E788
_0814E2A8:
	ldr r7, _0814E2B8
	b _0814E788
	.align 2, 0
_0814E2AC: .4byte 0x02022C90
_0814E2B0: .4byte 0x02000002
_0814E2B4: .4byte 0x085AAE91
_0814E2B8: .4byte 0x085AC12D
_0814E2BC:
	ldr r0, _0814E2CC
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r1, r0
	bne _0814E2D4
	ldr r7, _0814E2D0
	b _0814E788
	.align 2, 0
_0814E2CC: .4byte 0x0203886A
_0814E2D0: .4byte 0x085AAE68
_0814E2D4:
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r2, r0
	ldr r7, _0814E2E8
	cmp r2, #0
	bne _0814E2E2
	b _0814E788
_0814E2E2:
	ldr r7, _0814E2EC
	b _0814E788
	.align 2, 0
_0814E2E8: .4byte 0x085AAE7F
_0814E2EC: .4byte 0x085AC118
_0814E2F0:
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _0814E308
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	ldr r7, _0814E30C
	cmp r2, #0
	bne _0814E308
	b _0814E788
_0814E308:
	ldr r7, _0814E310
	b _0814E788
	.align 2, 0
_0814E30C: .4byte 0x085AAE68
_0814E310: .4byte 0x085ABDF4
_0814E314:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	beq _0814E328
	ldr r7, _0814E324
	b _0814E788
	.align 2, 0
_0814E324: .4byte 0x085AAE22
_0814E328:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0814E338
	ldr r7, _0814E334
	b _0814E788
	.align 2, 0
_0814E334: .4byte 0x085AAE4E
_0814E338:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r2, r0
	ldr r7, _0814E34C
	cmp r2, #0
	bne _0814E346
	b _0814E788
_0814E346:
	ldr r7, _0814E350
	b _0814E788
	.align 2, 0
_0814E34C: .4byte 0x085AAE0C
_0814E350: .4byte 0x085AAE36
_0814E354:
	mov r1, ip
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814E3B8
	ldr r0, _0814E37C
	ldr r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0814E3B0
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0814E384
	ldr r7, _0814E380
	b _0814E788
	.align 2, 0
_0814E37C: .4byte 0x02022C90
_0814E380: .4byte 0x085ABE13
_0814E384:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0814E398
	ldr r7, _0814E394
	b _0814E788
	.align 2, 0
_0814E394: .4byte 0x085AAF4B
_0814E398:
	movs r0, #0x40
	ands r1, r0
	ldr r7, _0814E3A8
	cmp r1, #0
	bne _0814E3A4
	b _0814E788
_0814E3A4:
	ldr r7, _0814E3AC
	b _0814E788
	.align 2, 0
_0814E3A8: .4byte 0x085AAF4B
_0814E3AC: .4byte 0x085AAF8E
_0814E3B0:
	ldr r7, _0814E3B4
	b _0814E788
	.align 2, 0
_0814E3B4: .4byte 0x085AAF42
_0814E3B8:
	ldr r0, _0814E3DC
	ldr r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0814E410
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0814E3D8
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0814E3E4
_0814E3D8:
	ldr r7, _0814E3E0
	b _0814E788
	.align 2, 0
_0814E3DC: .4byte 0x02022C90
_0814E3E0: .4byte 0x085ABDBB
_0814E3E4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0814E3F4
	ldr r7, _0814E3F0
	b _0814E788
	.align 2, 0
_0814E3F0: .4byte 0x085AAF06
_0814E3F4:
	ldr r0, _0814E404
	ands r1, r0
	ldr r7, _0814E408
	cmp r1, #0
	bne _0814E400
	b _0814E788
_0814E400:
	ldr r7, _0814E40C
	b _0814E788
	.align 2, 0
_0814E404: .4byte 0x02000002
_0814E408: .4byte 0x085AAEBA
_0814E40C: .4byte 0x085AAEF3
_0814E410:
	ldr r0, _0814E42C
	ands r1, r0
	cmp r1, #0
	beq _0814E428
	ldr r0, _0814E430
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldr r7, _0814E434
	cmp r1, r0
	beq _0814E428
	b _0814E788
_0814E428:
	ldr r7, _0814E438
	b _0814E788
	.align 2, 0
_0814E42C: .4byte 0x02000002
_0814E430: .4byte 0x0203886A
_0814E434: .4byte 0x085AAEE4
_0814E438: .4byte 0x085AAEA7
_0814E43C:
	mov r1, ip
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814E494
	ldr r0, _0814E45C
	ldr r0, [r0]
	adds r0, #0xb1
	ldrb r2, [r0]
	cmp r2, #0
	bne _0814E464
	ldr r7, _0814E460
	b _0814E788
	.align 2, 0
_0814E45C: .4byte 0x02024140
_0814E460: .4byte 0x085AAFA6
_0814E464:
	cmp r2, #1
	beq _0814E474
	ldr r0, _0814E478
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0814E480
_0814E474:
	ldr r7, _0814E47C
	b _0814E788
	.align 2, 0
_0814E478: .4byte 0x02022C90
_0814E47C: .4byte 0x085AAFB4
_0814E480:
	ldr r7, _0814E48C
	cmp r2, #2
	beq _0814E488
	b _0814E788
_0814E488:
	ldr r7, _0814E490
	b _0814E788
	.align 2, 0
_0814E48C: .4byte 0x085AAFC9
_0814E490: .4byte 0x085AAFBC
_0814E494:
	ldr r0, _0814E4C0
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ldr r2, _0814E4C4
	cmp r1, r0
	beq _0814E4AE
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0814E4D0
_0814E4AE:
	ldr r0, [r2]
	movs r1, #0x40
	ands r0, r1
	ldr r7, _0814E4C8
	cmp r0, #0
	bne _0814E4BC
	b _0814E788
_0814E4BC:
	ldr r7, _0814E4CC
	b _0814E788
	.align 2, 0
_0814E4C0: .4byte 0x0203886A
_0814E4C4: .4byte 0x02022C90
_0814E4C8: .4byte 0x085AAFEB
_0814E4CC: .4byte 0x085AAFFA
_0814E4D0:
	ldr r7, _0814E4D4
	b _0814E788
	.align 2, 0
_0814E4D4: .4byte 0x085AAFD8
_0814E4D8:
	mov r4, r8
	ldrb r0, [r4, #0x17]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814E530
	ldr r0, _0814E504
	ldr r0, [r0]
	adds r0, #0xb1
	ldrb r2, [r0]
	cmp r2, #0
	beq _0814E4FE
	ldr r0, _0814E508
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0814E510
_0814E4FE:
	ldr r7, _0814E50C
	b _0814E788
	.align 2, 0
_0814E504: .4byte 0x02024140
_0814E508: .4byte 0x02022C90
_0814E50C: .4byte 0x085AAF58
_0814E510:
	cmp r2, #1
	bne _0814E51C
	ldr r7, _0814E518
	b _0814E788
	.align 2, 0
_0814E518: .4byte 0x085AAF61
_0814E51C:
	ldr r7, _0814E528
	cmp r2, #2
	beq _0814E524
	b _0814E788
_0814E524:
	ldr r7, _0814E52C
	b _0814E788
	.align 2, 0
_0814E528: .4byte 0x085AAF76
_0814E52C: .4byte 0x085AAF6C
_0814E530:
	ldr r0, _0814E54C
	ldr r1, [r0]
	ldr r0, _0814E550
	ands r0, r1
	cmp r0, #0
	beq _0814E584
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0814E554
	ldrb r0, [r4, #0x17]
	b _0814E592
	.align 2, 0
_0814E54C: .4byte 0x02022C90
_0814E550: .4byte 0x02000002
_0814E554:
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _0814E564
	ldr r7, _0814E560
	b _0814E788
	.align 2, 0
_0814E560: .4byte 0x085AAF33
_0814E564:
	ldr r0, _0814E578
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldr r7, _0814E57C
	cmp r1, r0
	beq _0814E574
	b _0814E788
_0814E574:
	ldr r7, _0814E580
	b _0814E788
	.align 2, 0
_0814E578: .4byte 0x0203886A
_0814E57C: .4byte 0x085AAF24
_0814E580: .4byte 0x085AAED1
_0814E584:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0814E574
	mov r1, r8
	ldrb r0, [r1, #0x17]
_0814E592:
	ldr r7, _0814E59C
	cmp r0, #1
	beq _0814E59A
	b _0814E788
_0814E59A:
	b _0814E574
	.align 2, 0
_0814E59C: .4byte 0x085ABDE1
_0814E5A0:
	mov r0, sb
	bl ChooseMoveUsedParticle
	ldr r0, _0814E5CC
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, #0xb1
	lsls r0, r0, #1
	cmp r1, r0
	bls _0814E5DC
	ldr r0, _0814E5D0
	ldr r1, _0814E5D4
	ldr r1, [r1]
	adds r1, #0x8e
	ldrb r2, [r1]
	lsls r1, r2, #3
	subs r1, r1, r2
	ldr r2, _0814E5D8
	adds r1, r1, r2
	bl StringCopy
	b _0814E5EA
	.align 2, 0
_0814E5CC: .4byte 0x0203A874
_0814E5D0: .4byte 0x02022C1C
_0814E5D4: .4byte 0x02024140
_0814E5D8: .4byte 0x085ABC9A
_0814E5DC:
	ldr r0, _0814E5F4
	ldrh r1, [r2]
	lsls r1, r1, #3
	ldr r2, _0814E5F8
	adds r1, r1, r2
	bl StringCopy
_0814E5EA:
	ldr r0, _0814E5F4
	bl ChooseTypeOfMoveUsedString
	ldr r7, _0814E5FC
	b _0814E788
	.align 2, 0
_0814E5F4: .4byte 0x02022C1C
_0814E5F8: .4byte 0x082EACC4
_0814E5FC: .4byte 0x085AB034
_0814E600:
	ldr r4, _0814E640
	ldrb r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0814E674
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	mov r1, ip
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0814E62E
	ldrb r1, [r4]
	cmp r1, #3
	beq _0814E62E
	movs r0, #3
	eors r0, r1
	strb r0, [r4]
_0814E62E:
	ldr r0, _0814E640
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0814E648
	ldr r7, _0814E644
	b _0814E788
	.align 2, 0
_0814E640: .4byte 0x02022C0C
_0814E644: .4byte 0x085AA970
_0814E648:
	ldr r0, _0814E658
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0814E660
	ldr r7, _0814E65C
	b _0814E788
	.align 2, 0
_0814E658: .4byte 0x02022C90
_0814E65C: .4byte 0x085AAA45
_0814E660:
	ldr r0, _0814E66C
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldr r7, _0814E670
	b _0814E788
	.align 2, 0
_0814E66C: .4byte 0x0203886A
_0814E670: .4byte 0x085AAA36
_0814E674:
	mov r1, ip
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0814E690
	ldrb r1, [r4]
	cmp r1, #3
	beq _0814E690
	movs r0, #3
	eors r0, r1
	strb r0, [r4]
_0814E690:
	ldr r0, _0814E6B0
	ldr r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0814E6E8
	ldr r0, _0814E6B4
	ldrb r0, [r0]
	cmp r0, #2
	beq _0814E6D8
	cmp r0, #2
	bgt _0814E6B8
	cmp r0, #1
	beq _0814E6BE
	b _0814E788
	.align 2, 0
_0814E6B0: .4byte 0x02022C90
_0814E6B4: .4byte 0x02022C0C
_0814E6B8:
	cmp r0, #3
	beq _0814E6E0
	b _0814E788
_0814E6BE:
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r1, r0
	ldr r7, _0814E6D0
	cmp r1, #0
	beq _0814E788
	ldr r7, _0814E6D4
	b _0814E788
	.align 2, 0
_0814E6D0: .4byte 0x085AA9D6
_0814E6D4: .4byte 0x085ABE2F
_0814E6D8:
	ldr r7, _0814E6DC
	b _0814E788
	.align 2, 0
_0814E6DC: .4byte 0x085AA9FA
_0814E6E0:
	ldr r7, _0814E6E4
	b _0814E788
	.align 2, 0
_0814E6E4: .4byte 0x085AAA20
_0814E6E8:
	ldr r0, _0814E708
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r1, r0
	bne _0814E730
	ldr r0, _0814E70C
	ldrb r0, [r0]
	cmp r0, #2
	beq _0814E720
	cmp r0, #2
	bgt _0814E710
	cmp r0, #1
	beq _0814E716
	b _0814E788
	.align 2, 0
_0814E708: .4byte 0x0203886A
_0814E70C: .4byte 0x02022C0C
_0814E710:
	cmp r0, #3
	beq _0814E728
	b _0814E788
_0814E716:
	ldr r7, _0814E71C
	b _0814E788
	.align 2, 0
_0814E71C: .4byte 0x085AAD22
_0814E720:
	ldr r7, _0814E724
	b _0814E788
	.align 2, 0
_0814E724: .4byte 0x085AC0B1
_0814E728:
	ldr r7, _0814E72C
	b _0814E788
	.align 2, 0
_0814E72C: .4byte 0x085AC0C6
_0814E730:
	ldr r0, _0814E744
	ldrb r0, [r0]
	cmp r0, #2
	beq _0814E758
	cmp r0, #2
	bgt _0814E748
	cmp r0, #1
	beq _0814E74E
	b _0814E788
	.align 2, 0
_0814E744: .4byte 0x02022C0C
_0814E748:
	cmp r0, #3
	beq _0814E760
	b _0814E788
_0814E74E:
	ldr r7, _0814E754
	b _0814E788
	.align 2, 0
_0814E754: .4byte 0x085AA9C6
_0814E758:
	ldr r7, _0814E75C
	b _0814E788
	.align 2, 0
_0814E75C: .4byte 0x085AA9EA
_0814E760:
	ldr r7, _0814E764
	b _0814E788
	.align 2, 0
_0814E764: .4byte 0x085AAA0E
_0814E768:
	movs r0, #0xbe
	lsls r0, r0, #1
	cmp r6, r0
	bls _0814E77C
	ldr r1, _0814E778
	movs r0, #0xff
	strb r0, [r1]
	b _0814E78E
	.align 2, 0
_0814E778: .4byte 0x02022AE0
_0814E77C:
	ldr r1, _0814E79C
	adds r0, r6, #0
	subs r0, #0xc
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r7, [r0]
_0814E788:
	adds r0, r7, #0
	bl TryGetStatusString
_0814E78E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814E79C: .4byte 0x085AB3DC
	thumb_func_end BufferStringBattle

	thumb_func_start TryGetStatusString
TryGetStatusString: @ 0x0814E7A0
	push {lr}
	ldr r1, _0814E7AC
	bl BattleStringExpandPlaceholdersToDisplayedString
	pop {r1}
	bx r1
	.align 2, 0
_0814E7AC: .4byte 0x02022AE0
	thumb_func_end TryGetStatusString

	thumb_func_start BattleStringExpandPlaceholdersToDisplayedString
BattleStringExpandPlaceholdersToDisplayedString: @ 0x0814E7B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov sb, r0
	mov r8, r1
	movs r6, #0
	movs r4, #0
	ldr r0, _0814E7D8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0814E7E0
	ldr r0, _0814E7DC
	ldrb r7, [r0]
	b _0814E7E8
	.align 2, 0
_0814E7D8: .4byte 0x02022C90
_0814E7DC: .4byte 0x0203C480
_0814E7E0:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0814E7E8:
	mov r0, sb
	ldrb r1, [r0]
	bl sub_0814F63C
	thumb_func_end BattleStringExpandPlaceholdersToDisplayedString

	thumb_func_start BattleStringExpandPlaceholders
BattleStringExpandPlaceholders: @ 0x0814E7F0
	cmp r1, #0xfd
	beq _0814E7F8
	bl BattlePutTextOnWindow
_0814E7F8:
	movs r1, #1
	add sb, r1
	mov r2, sb
	ldrb r0, [r2]
	cmp r0, #0x33
	bls _0814E808
	bl _0814F5DC
_0814E808:
	lsls r0, r0, #2
	ldr r1, _0814E814
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814E814: .4byte 0x0814E818
_0814E818: @ jump table
	.4byte _0814E8E8 @ case 0
	.4byte _0814E8FC @ case 1
	.4byte _0814E922 @ case 2
	.4byte _0814E92C @ case 3
	.4byte _0814E938 @ case 4
	.4byte _0814E944 @ case 5
	.4byte _0814E978 @ case 6
	.4byte _0814E9AC @ case 7
	.4byte _0814E9E0 @ case 8
	.4byte _0814EA14 @ case 9
	.4byte _0814EA50 @ case 10
	.4byte _0814EA90 @ case 11
	.4byte _0814EAD0 @ case 12
	.4byte _0814EB10 @ case 13
	.4byte _0814EBC8 @ case 14
	.4byte _0814EC50 @ case 15
	.4byte _0814ECEC @ case 16
	.4byte _0814ED88 @ case 17
	.4byte _0814EE24 @ case 18
	.4byte _0814EEC0 @ case 19
	.4byte _0814EF5C @ case 20
	.4byte _0814EF74 @ case 21
	.4byte _0814EFB0 @ case 22
	.4byte _0814F098 @ case 23
	.4byte _0814F0A0 @ case 24
	.4byte _0814F0B0 @ case 25
	.4byte _0814F0C0 @ case 26
	.4byte _0814F0D0 @ case 27
	.4byte _0814F0F0 @ case 28
	.4byte _0814F178 @ case 29
	.4byte _0814F242 @ case 30
	.4byte _0814F254 @ case 31
	.4byte _0814F268 @ case 32
	.4byte _0814F27C @ case 33
	.4byte _0814F2A0 @ case 34
	.4byte _0814F2BC @ case 35
	.4byte _0814F2E4 @ case 36
	.4byte _0814F324 @ case 37
	.4byte _0814F354 @ case 38
	.4byte _0814F3E8 @ case 39
	.4byte _0814F434 @ case 40
	.4byte _0814F43C @ case 41
	.4byte _0814F408 @ case 42
	.4byte _0814F410 @ case 43
	.4byte _0814F460 @ case 44
	.4byte _0814F468 @ case 45
	.4byte _0814F48C @ case 46
	.4byte _0814F4D8 @ case 47
	.4byte _0814F524 @ case 48
	.4byte _0814F564 @ case 49
	.4byte _0814F5B0 @ case 50
	.4byte _0814F5D0 @ case 51
_0814E8E8:
	ldr r1, _0814E8F4
	ldrb r0, [r1]
	cmp r0, #0xfd
	bne _0814E91C
	ldr r4, _0814E8F8
	b _0814E906
	.align 2, 0
_0814E8F4: .4byte 0x02022C0C
_0814E8F8: .4byte 0x02021C40
_0814E8FC:
	ldr r1, _0814E914
	ldrb r0, [r1]
	cmp r0, #0xfd
	bne _0814E91C
	ldr r4, _0814E918
_0814E906:
	adds r0, r1, #0
	adds r1, r4, #0
	bl ExpandBattleTextBuffPlaceholders
	bl _0814F5DC
	.align 2, 0
_0814E914: .4byte 0x02022C1C
_0814E918: .4byte 0x02021C54
_0814E91C:
	adds r4, r1, #0
	bl _0814F5DC
_0814E922:
	ldr r4, _0814E928
	bl _0814F5DC
	.align 2, 0
_0814E928: .4byte 0x02021C40
_0814E92C:
	ldr r4, _0814E934
	bl _0814F5DC
	.align 2, 0
_0814E934: .4byte 0x02021C54
_0814E938:
	ldr r4, _0814E940
	bl _0814F5DC
	.align 2, 0
_0814E940: .4byte 0x02021C68
_0814E944:
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r1, _0814E970
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814E974
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814E970: .4byte 0x02023D12
_0814E974: .4byte 0x02024190
_0814E978:
	movs r0, #1
	bl GetBattlerAtPosition
	ldr r1, _0814E9A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814E9A8
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814E9A4: .4byte 0x02023D12
_0814E9A8: .4byte 0x020243E8
_0814E9AC:
	movs r0, #2
	bl GetBattlerAtPosition
	ldr r1, _0814E9D8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814E9DC
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814E9D8: .4byte 0x02023D12
_0814E9DC: .4byte 0x02024190
_0814E9E0:
	movs r0, #3
	bl GetBattlerAtPosition
	ldr r1, _0814EA0C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EA10
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814EA0C: .4byte 0x02023D12
_0814EA10: .4byte 0x020243E8
_0814EA14:
	ldr r2, _0814EA44
	ldr r1, _0814EA48
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EA4C
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814EA44: .4byte 0x02023D12
_0814EA48: .4byte 0x020226A0
_0814EA4C: .4byte 0x02024190
_0814EA50:
	ldr r2, _0814EA84
	ldr r1, _0814EA88
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x18]
	movs r0, #1
	eors r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EA8C
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814EA84: .4byte 0x02023D12
_0814EA88: .4byte 0x020226A0
_0814EA8C: .4byte 0x020243E8
_0814EA90:
	ldr r2, _0814EAC4
	ldr r1, _0814EAC8
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x18]
	movs r0, #2
	eors r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EACC
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814EAC4: .4byte 0x02023D12
_0814EAC8: .4byte 0x020226A0
_0814EACC: .4byte 0x02024190
_0814EAD0:
	ldr r2, _0814EB04
	ldr r1, _0814EB08
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x18]
	movs r0, #3
	eors r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EB0C
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814EB04: .4byte 0x02023D12
_0814EB08: .4byte 0x020226A0
_0814EB0C: .4byte 0x020243E8
_0814EB10:
	ldr r4, _0814EB34
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq _0814EB8C
	ldr r0, _0814EB38
	ldr r1, [r0]
	movs r0, #8
	ands r1, r0
	ldr r4, _0814EB3C
	cmp r1, #0
	beq _0814EB4E
	ldr r4, _0814EB40
	b _0814EB4E
	.align 2, 0
_0814EB34: .4byte 0x02023EAF
_0814EB38: .4byte 0x02022C90
_0814EB3C: .4byte 0x085AB009
_0814EB40: .4byte 0x085AB00F
_0814EB44:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, #1
	adds r4, #1
_0814EB4E:
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0814EB44
	ldrb r0, [r2]
	bl GetBattlerPosition
	adds r1, r0, #0
	movs r0, #1
	ands r0, r1
	bl GetBattlerAtPosition
	ldr r1, _0814EB84
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EB88
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	b _0814EBB6
	.align 2, 0
_0814EB84: .4byte 0x02023D12
_0814EB88: .4byte 0x020243E8
_0814EB8C:
	ldrb r0, [r2]
	bl GetBattlerPosition
	adds r1, r0, #0
	movs r0, #1
	ands r0, r1
	bl GetBattlerAtPosition
	ldr r1, _0814EBC0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EBC4
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
_0814EBB6:
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814EBC0: .4byte 0x02023D12
_0814EBC4: .4byte 0x02024190
_0814EBC8:
	ldr r4, _0814EC04
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814EC10
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, #0
	movs r0, #1
	ands r0, r1
	bl GetBattlerAtPosition
	ldr r1, _0814EC08
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EC0C
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	b _0814EC3C
	.align 2, 0
_0814EC04: .4byte 0x02023EAF
_0814EC08: .4byte 0x02023D12
_0814EC0C: .4byte 0x02024190
_0814EC10:
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, #0
	movs r0, #1
	ands r0, r1
	bl GetBattlerAtPosition
	ldr r1, _0814EC48
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EC4C
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
_0814EC3C:
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814EC48: .4byte 0x02023D12
_0814EC4C: .4byte 0x020243E8
_0814EC50:
	ldr r5, _0814ECA8
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814ECC0
	ldr r0, _0814ECAC
	ldr r1, [r0]
	movs r0, #8
	ands r1, r0
	ldr r4, _0814ECB0
	cmp r1, #0
	beq _0814EC6E
	ldr r4, _0814ECB4
_0814EC6E:
	ldrb r1, [r4]
	adds r0, r1, #0
	ldr r3, _0814ECB8
	ldr r2, _0814ECBC
	mov ip, r2
	adds r2, r5, #0
	cmp r0, #0xff
	beq _0814EC90
_0814EC7E:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, #1
	adds r4, #1
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0814EC7E
_0814EC90:
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	add r0, ip
	movs r1, #2
	mov r2, sp
	bl GetMonData
	b _0814ECDA
	.align 2, 0
_0814ECA8: .4byte 0x02023EAF
_0814ECAC: .4byte 0x02022C90
_0814ECB0: .4byte 0x085AB009
_0814ECB4: .4byte 0x085AB00F
_0814ECB8: .4byte 0x02023D12
_0814ECBC: .4byte 0x020243E8
_0814ECC0:
	ldr r1, _0814ECE4
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814ECE8
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
_0814ECDA:
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814ECE4: .4byte 0x02023D12
_0814ECE8: .4byte 0x02024190
_0814ECEC:
	ldr r5, _0814ED44
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814ED5C
	ldr r0, _0814ED48
	ldr r1, [r0]
	movs r0, #8
	ands r1, r0
	ldr r4, _0814ED4C
	cmp r1, #0
	beq _0814ED0A
	ldr r4, _0814ED50
_0814ED0A:
	ldrb r1, [r4]
	adds r0, r1, #0
	ldr r3, _0814ED54
	ldr r2, _0814ED58
	mov ip, r2
	adds r2, r5, #0
	cmp r0, #0xff
	beq _0814ED2C
_0814ED1A:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, #1
	adds r4, #1
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0814ED1A
_0814ED2C:
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	add r0, ip
	movs r1, #2
	mov r2, sp
	bl GetMonData
	b _0814ED76
	.align 2, 0
_0814ED44: .4byte 0x02023EB0
_0814ED48: .4byte 0x02022C90
_0814ED4C: .4byte 0x085AB009
_0814ED50: .4byte 0x085AB00F
_0814ED54: .4byte 0x02023D12
_0814ED58: .4byte 0x020243E8
_0814ED5C:
	ldr r1, _0814ED80
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814ED84
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
_0814ED76:
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814ED80: .4byte 0x02023D12
_0814ED84: .4byte 0x02024190
_0814ED88:
	ldr r5, _0814EDE0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814EDF8
	ldr r0, _0814EDE4
	ldr r1, [r0]
	movs r0, #8
	ands r1, r0
	ldr r4, _0814EDE8
	cmp r1, #0
	beq _0814EDA6
	ldr r4, _0814EDEC
_0814EDA6:
	ldrb r1, [r4]
	adds r0, r1, #0
	ldr r3, _0814EDF0
	ldr r2, _0814EDF4
	mov ip, r2
	adds r2, r5, #0
	cmp r0, #0xff
	beq _0814EDC8
_0814EDB6:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, #1
	adds r4, #1
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0814EDB6
_0814EDC8:
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	add r0, ip
	movs r1, #2
	mov r2, sp
	bl GetMonData
	b _0814EE12
	.align 2, 0
_0814EDE0: .4byte 0x02023EB2
_0814EDE4: .4byte 0x02022C90
_0814EDE8: .4byte 0x085AB009
_0814EDEC: .4byte 0x085AB00F
_0814EDF0: .4byte 0x02023D12
_0814EDF4: .4byte 0x020243E8
_0814EDF8:
	ldr r1, _0814EE1C
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EE20
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
_0814EE12:
	mov r0, sp
	bl StringGetEnd10
	bl _0814F5DA
	.align 2, 0
_0814EE1C: .4byte 0x02023D12
_0814EE20: .4byte 0x02024190
_0814EE24:
	ldr r5, _0814EE7C
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814EE94
	ldr r0, _0814EE80
	ldr r1, [r0]
	movs r0, #8
	ands r1, r0
	ldr r4, _0814EE84
	cmp r1, #0
	beq _0814EE42
	ldr r4, _0814EE88
_0814EE42:
	ldrb r1, [r4]
	adds r0, r1, #0
	ldr r3, _0814EE8C
	ldr r2, _0814EE90
	mov ip, r2
	adds r2, r5, #0
	cmp r0, #0xff
	beq _0814EE64
_0814EE52:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, #1
	adds r4, #1
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0814EE52
_0814EE64:
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	add r0, ip
	movs r1, #2
	mov r2, sp
	bl GetMonData
	b _0814EEAE
	.align 2, 0
_0814EE7C: .4byte 0x02023D08
_0814EE80: .4byte 0x02022C90
_0814EE84: .4byte 0x085AB009
_0814EE88: .4byte 0x085AB00F
_0814EE8C: .4byte 0x02023D12
_0814EE90: .4byte 0x020243E8
_0814EE94:
	ldr r1, _0814EEB8
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EEBC
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
_0814EEAE:
	mov r0, sp
	bl StringGetEnd10
	b _0814F5DA
	.align 2, 0
_0814EEB8: .4byte 0x02023D12
_0814EEBC: .4byte 0x02024190
_0814EEC0:
	ldr r5, _0814EF18
	ldrb r0, [r5, #0x17]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814EF30
	ldr r0, _0814EF1C
	ldr r1, [r0]
	movs r0, #8
	ands r1, r0
	ldr r4, _0814EF20
	cmp r1, #0
	beq _0814EEDE
	ldr r4, _0814EF24
_0814EEDE:
	ldrb r1, [r4]
	adds r0, r1, #0
	ldr r3, _0814EF28
	ldr r2, _0814EF2C
	mov ip, r2
	adds r2, r5, #0
	cmp r0, #0xff
	beq _0814EF00
_0814EEEE:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, #1
	adds r4, #1
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0814EEEE
_0814EF00:
	ldrb r0, [r2, #0x17]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	add r0, ip
	movs r1, #2
	mov r2, sp
	bl GetMonData
	b _0814EF4A
	.align 2, 0
_0814EF18: .4byte 0x02024118
_0814EF1C: .4byte 0x02022C90
_0814EF20: .4byte 0x085AB009
_0814EF24: .4byte 0x085AB00F
_0814EF28: .4byte 0x02023D12
_0814EF2C: .4byte 0x020243E8
_0814EF30:
	ldr r1, _0814EF54
	ldrb r0, [r5, #0x17]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814EF58
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
_0814EF4A:
	mov r0, sp
	bl StringGetEnd10
	b _0814F5DA
	.align 2, 0
_0814EF54: .4byte 0x02023D12
_0814EF58: .4byte 0x02024190
_0814EF5C:
	ldr r0, _0814EF70
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, #0xb1
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0814EF82
	ldrh r0, [r2]
	b _0814EFA2
	.align 2, 0
_0814EF70: .4byte 0x0203A874
_0814EF74:
	ldr r0, _0814EF94
	ldr r2, [r0]
	ldrh r1, [r2, #2]
	movs r0, #0xb1
	lsls r0, r0, #1
	cmp r1, r0
	bls _0814EFA0
_0814EF82:
	ldr r0, _0814EF98
	ldr r0, [r0]
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	ldr r1, _0814EF9C
	adds r4, r0, r1
	b _0814F5DC
	.align 2, 0
_0814EF94: .4byte 0x0203A874
_0814EF98: .4byte 0x02024140
_0814EF9C: .4byte 0x085ABC9A
_0814EFA0:
	ldrh r0, [r2, #2]
_0814EFA2:
	lsls r0, r0, #3
	ldr r1, _0814EFAC
	adds r4, r0, r1
	b _0814F5DC
	.align 2, 0
_0814EFAC: .4byte 0x082EACC4
_0814EFB0:
	ldr r0, _0814EFE4
	ldr r1, [r0]
	ldr r0, _0814EFE8
	ands r0, r1
	cmp r0, #0
	beq _0814F086
	ldr r2, _0814EFEC
	ldrh r0, [r2]
	cmp r0, #0xaf
	bne _0814F07C
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	bne _0814F02C
	ldr r0, _0814EFF0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0814EFF8
	ldr r2, _0814EFF4
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0814F004
	b _0814F074
	.align 2, 0
_0814EFE4: .4byte 0x02022C90
_0814EFE8: .4byte 0x02000002
_0814EFEC: .4byte 0x02023EAC
_0814EFF0: .4byte 0x02024118
_0814EFF4: .4byte 0x02023EB3
_0814EFF8:
	ldr r2, _0814F020
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0814F074
_0814F004:
	ldrb r0, [r2]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0814F024
	adds r1, r1, r0
	mov r0, sp
	bl StringCopy
	ldr r1, _0814F028
	mov r0, sp
	bl StringAppend
	b _0814F5DA
	.align 2, 0
_0814F020: .4byte 0x02023EB3
_0814F024: .4byte 0x020240A8
_0814F028: .4byte 0x085AB28D
_0814F02C:
	ldr r2, _0814F060
	ldr r0, _0814F064
	adds r0, #0x25
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _0814F068
	ldrb r2, [r1]
	ldrh r0, [r0, #0x18]
	cmp r0, r2
	bne _0814F074
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r0, _0814F06C
	adds r1, r1, r0
	mov r0, sp
	bl StringCopy
	ldr r1, _0814F070
	mov r0, sp
	bl StringAppend
	b _0814F5DA
	.align 2, 0
_0814F060: .4byte 0x020226A0
_0814F064: .4byte 0x02024118
_0814F068: .4byte 0x02023EB3
_0814F06C: .4byte 0x020240A8
_0814F070: .4byte 0x085AB28D
_0814F074:
	ldr r4, _0814F078
	b _0814F5DC
	.align 2, 0
_0814F078: .4byte 0x085AB288
_0814F07C:
	ldrh r0, [r2]
	mov r1, sp
	bl CopyItemName
	b _0814F5DA
_0814F086:
	ldr r0, _0814F094
	ldrh r0, [r0]
	mov r1, sp
	bl CopyItemName
	b _0814F5DA
	.align 2, 0
_0814F094: .4byte 0x02023EAC
_0814F098:
	ldr r0, _0814F09C
	b _0814F0D8
	.align 2, 0
_0814F09C: .4byte 0x02023EAE
_0814F0A0:
	ldr r1, _0814F0A8
	ldr r0, _0814F0AC
	b _0814F0D4
	.align 2, 0
_0814F0A8: .4byte 0x0203A870
_0814F0AC: .4byte 0x02023EAF
_0814F0B0:
	ldr r1, _0814F0B8
	ldr r0, _0814F0BC
	b _0814F0D4
	.align 2, 0
_0814F0B8: .4byte 0x0203A870
_0814F0BC: .4byte 0x02023EB0
_0814F0C0:
	ldr r1, _0814F0C8
	ldr r0, _0814F0CC
	ldrb r0, [r0, #0x17]
	b _0814F0D6
	.align 2, 0
_0814F0C8: .4byte 0x0203A870
_0814F0CC: .4byte 0x02024118
_0814F0D0:
	ldr r1, _0814F0E4
	ldr r0, _0814F0E8
_0814F0D4:
	ldrb r0, [r0]
_0814F0D6:
	adds r0, r0, r1
_0814F0D8:
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r1, _0814F0EC
	adds r4, r0, r1
	b _0814F5DC
	.align 2, 0
_0814F0E4: .4byte 0x0203A870
_0814F0E8: .4byte 0x02023EB2
_0814F0EC: .4byte 0x082EBDC4
_0814F0F0:
	ldr r0, _0814F104
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0814F108
	bl GetSecretBaseTrainerPicIndex
	b _0814F5B8
	.align 2, 0
_0814F104: .4byte 0x02022C90
_0814F108:
	ldr r3, _0814F120
	ldrh r2, [r3]
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r2, r0
	bne _0814F124
	bl sub_080686F0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0814F5BC
	.align 2, 0
_0814F120: .4byte 0x0203886A
_0814F124:
	ldr r0, _0814F130
	cmp r2, r0
	bne _0814F134
	bl sub_081A48F8
	b _0814F5B8
	.align 2, 0
_0814F130: .4byte 0x000003FE
_0814F134:
	ldr r0, _0814F140
	ands r0, r1
	cmp r0, #0
	beq _0814F144
	ldrh r0, [r3]
	b _0814F5B4
	.align 2, 0
_0814F140: .4byte 0x003F0100
_0814F144:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _0814F156
	ldrh r0, [r3]
	bl GetTrainerHillOpponentClass
	b _0814F5B8
_0814F156:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0814F166
	bl GetEreaderTrainerClassId
	b _0814F5B8
_0814F166:
	ldr r1, _0814F174
	ldrh r0, [r3]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r0, #0xb
	b _0814F5BE
	.align 2, 0
_0814F174: .4byte 0x082E383C
_0814F178:
	ldr r0, _0814F1AC
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0814F1B4
	movs r3, #0
	ldr r0, _0814F1B0
	ldr r2, [r0]
_0814F18C:
	mov r1, sp
	adds r0, r1, r3
	ldr r1, [r2]
	adds r1, #2
	adds r1, r1, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #6
	ble _0814F18C
	mov r2, sp
	adds r1, r2, r3
	movs r0, #0xff
	strb r0, [r1]
	b _0814F5DA
	.align 2, 0
_0814F1AC: .4byte 0x02022C90
_0814F1B0: .4byte 0x0202414C
_0814F1B4:
	ldr r3, _0814F1EC
	ldrh r2, [r3]
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r2, r0
	bne _0814F1F4
	movs r3, #0
	ldr r2, _0814F1F0
	movs r1, #1
	adds r0, r7, #0
	eors r0, r1
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r2, #8
	adds r2, r1, r2
_0814F1D4:
	mov r5, sp
	adds r1, r5, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r3, #1
	cmp r3, #6
	ble _0814F1D4
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	b _0814F5DA
	.align 2, 0
_0814F1EC: .4byte 0x0203886A
_0814F1F0: .4byte 0x020226A0
_0814F1F4:
	ldr r0, _0814F204
	cmp r2, r0
	bne _0814F208
	mov r0, sp
	bl CopyFrontierBrainTrainerName
	b _0814F5DA
	.align 2, 0
_0814F204: .4byte 0x000003FE
_0814F208:
	ldr r0, _0814F214
	ands r0, r1
	cmp r0, #0
	beq _0814F218
	ldrh r1, [r3]
	b _0814F5D4
	.align 2, 0
_0814F214: .4byte 0x003F0100
_0814F218:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _0814F22C
	ldrh r1, [r3]
	mov r0, sp
	bl GetTrainerHillTrainerName
	b _0814F5DA
_0814F22C:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0814F23E
	mov r0, sp
	bl GetEreaderTrainerName
	b _0814F5DA
_0814F23E:
	ldrh r0, [r3]
	b _0814F514
_0814F242:
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _0814F250
	adds r4, r0, r1
	b _0814F5DC
	.align 2, 0
_0814F250: .4byte 0x020226A8
_0814F254:
	ldr r4, _0814F264
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x18]
	movs r0, #2
	b _0814F28A
	.align 2, 0
_0814F264: .4byte 0x020226A0
_0814F268:
	ldr r4, _0814F278
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x18]
	movs r0, #1
	b _0814F28A
	.align 2, 0
_0814F278: .4byte 0x020226A0
_0814F27C:
	ldr r4, _0814F29C
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x18]
	movs r0, #3
_0814F28A:
	eors r0, r1
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r4, #8
	adds r4, r1, r4
	b _0814F5DC
	.align 2, 0
_0814F29C: .4byte 0x020226A0
_0814F2A0:
	ldr r0, _0814F2B4
	ldrb r0, [r0, #0x17]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0814F2B8
	adds r4, r1, r0
	b _0814F5DC
	.align 2, 0
_0814F2B4: .4byte 0x02024118
_0814F2B8: .4byte 0x020226A8
_0814F2BC:
	ldr r0, _0814F2D0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0814F2D8
	ldr r4, _0814F2D4
	b _0814F5DC
	.align 2, 0
_0814F2D0: .4byte 0x02022C90
_0814F2D4: .4byte 0x020226A8
_0814F2D8:
	ldr r0, _0814F2E0
	ldr r4, [r0]
	b _0814F5DC
	.align 2, 0
_0814F2E0: .4byte 0x03005AF0
_0814F2E4:
	ldr r0, _0814F2F8
	ldr r1, [r0]
	ldr r0, _0814F2FC
	ands r0, r1
	cmp r0, #0
	beq _0814F304
	ldr r0, _0814F300
	ldrh r1, [r0]
	movs r0, #2
	b _0814F576
	.align 2, 0
_0814F2F8: .4byte 0x02022C90
_0814F2FC: .4byte 0x003F0100
_0814F300: .4byte 0x0203886A
_0814F304:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0814F31C
	ldr r0, _0814F318
	ldrh r1, [r0]
	movs r0, #4
	b _0814F5A0
	.align 2, 0
_0814F318: .4byte 0x0203886A
_0814F31C:
	bl GetTrainerALoseText
	adds r4, r0, #0
	b _0814F5DC
_0814F324:
	ldr r0, _0814F334
	ldr r1, [r0]
	ldr r0, _0814F338
	ands r0, r1
	cmp r0, #0
	beq _0814F340
	ldr r0, _0814F33C
	b _0814F572
	.align 2, 0
_0814F334: .4byte 0x02022C90
_0814F338: .4byte 0x003F0100
_0814F33C: .4byte 0x0203886A
_0814F340:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	bne _0814F34C
	b _0814F5DC
_0814F34C:
	ldr r0, _0814F350
	b _0814F59C
	.align 2, 0
_0814F350: .4byte 0x0203886A
_0814F354:
	ldr r0, _0814F3A8
	ldrb r0, [r0, #0x17]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814F3C0
	ldr r0, _0814F3AC
	ldr r1, [r0]
	movs r0, #8
	ands r1, r0
	ldr r4, _0814F3B0
	cmp r1, #0
	beq _0814F372
	ldr r4, _0814F3B4
_0814F372:
	ldrb r1, [r4]
	adds r0, r1, #0
	ldr r2, _0814F3B8
	mov ip, r2
	ldr r2, _0814F3BC
	cmp r0, #0xff
	beq _0814F392
_0814F380:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, #1
	adds r4, #1
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0814F380
_0814F392:
	ldr r0, [r2]
	adds r0, #0x52
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	add r0, ip
	movs r1, #2
	mov r2, sp
	bl GetMonData
	b _0814F3D8
	.align 2, 0
_0814F3A8: .4byte 0x02024118
_0814F3AC: .4byte 0x02022C90
_0814F3B0: .4byte 0x085AB009
_0814F3B4: .4byte 0x085AB00F
_0814F3B8: .4byte 0x020243E8
_0814F3BC: .4byte 0x02024140
_0814F3C0:
	ldr r0, _0814F3E0
	ldr r0, [r0]
	adds r0, #0x52
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814F3E4
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
_0814F3D8:
	mov r0, sp
	bl StringGetEnd10
	b _0814F5DA
	.align 2, 0
_0814F3E0: .4byte 0x02024140
_0814F3E4: .4byte 0x02024190
_0814F3E8:
	ldr r0, _0814F3FC
	bl FlagGet
	lsls r0, r0, #0x18
	ldr r4, _0814F400
	cmp r0, #0
	bne _0814F3F8
	b _0814F5DC
_0814F3F8:
	ldr r4, _0814F404
	b _0814F5DC
	.align 2, 0
_0814F3FC: .4byte 0x000008AB
_0814F400: .4byte 0x085AB225
_0814F404: .4byte 0x085AB22A
_0814F408:
	ldr r0, _0814F40C
	b _0814F412
	.align 2, 0
_0814F40C: .4byte 0x02023EAF
_0814F410:
	ldr r0, _0814F428
_0814F412:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r4, _0814F42C
	cmp r0, #0
	beq _0814F422
	b _0814F5DC
_0814F422:
	ldr r4, _0814F430
	b _0814F5DC
	.align 2, 0
_0814F428: .4byte 0x02023EB0
_0814F42C: .4byte 0x085AB020
_0814F430: .4byte 0x085AB025
_0814F434:
	ldr r0, _0814F438
	b _0814F43E
	.align 2, 0
_0814F438: .4byte 0x02023EAF
_0814F43C:
	ldr r0, _0814F454
_0814F43E:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r4, _0814F458
	cmp r0, #0
	beq _0814F44E
	b _0814F5DC
_0814F44E:
	ldr r4, _0814F45C
	b _0814F5DC
	.align 2, 0
_0814F454: .4byte 0x02023EB0
_0814F458: .4byte 0x085AB016
_0814F45C: .4byte 0x085AB01B
_0814F460:
	ldr r0, _0814F464
	b _0814F46A
	.align 2, 0
_0814F464: .4byte 0x02023EAF
_0814F468:
	ldr r0, _0814F480
_0814F46A:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r4, _0814F484
	cmp r0, #0
	beq _0814F47A
	b _0814F5DC
_0814F47A:
	ldr r4, _0814F488
	b _0814F5DC
	.align 2, 0
_0814F480: .4byte 0x02023EB0
_0814F484: .4byte 0x085AB02A
_0814F488: .4byte 0x085AB02F
_0814F48C:
	ldr r0, _0814F49C
	ldr r1, [r0]
	ldr r0, _0814F4A0
	ands r0, r1
	cmp r0, #0
	beq _0814F4A8
	ldr r0, _0814F4A4
	b _0814F5B2
	.align 2, 0
_0814F49C: .4byte 0x02022C90
_0814F4A0: .4byte 0x003F0100
_0814F4A4: .4byte 0x0203886C
_0814F4A8:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0814F4C0
	ldr r0, _0814F4BC
	ldrh r0, [r0]
	bl GetTrainerHillOpponentClass
	b _0814F5B8
	.align 2, 0
_0814F4BC: .4byte 0x0203886C
_0814F4C0:
	ldr r1, _0814F4D0
	ldr r0, _0814F4D4
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r0, #0xb
	b _0814F5BE
	.align 2, 0
_0814F4D0: .4byte 0x082E383C
_0814F4D4: .4byte 0x0203886C
_0814F4D8:
	ldr r0, _0814F4E8
	ldr r1, [r0]
	ldr r0, _0814F4EC
	ands r0, r1
	cmp r0, #0
	beq _0814F4F4
	ldr r0, _0814F4F0
	b _0814F5D2
	.align 2, 0
_0814F4E8: .4byte 0x02022C90
_0814F4EC: .4byte 0x003F0100
_0814F4F0: .4byte 0x0203886C
_0814F4F4:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0814F510
	ldr r0, _0814F50C
	ldrh r1, [r0]
	mov r0, sp
	bl GetTrainerHillTrainerName
	b _0814F5DA
	.align 2, 0
_0814F50C: .4byte 0x0203886C
_0814F510:
	ldr r0, _0814F51C
	ldrh r0, [r0]
_0814F514:
	lsls r0, r0, #5
	ldr r1, _0814F520
	adds r4, r0, r1
	b _0814F5DC
	.align 2, 0
_0814F51C: .4byte 0x0203886C
_0814F520: .4byte 0x082E3840
_0814F524:
	ldr r0, _0814F538
	ldr r1, [r0]
	ldr r0, _0814F53C
	ands r0, r1
	cmp r0, #0
	beq _0814F544
	ldr r0, _0814F540
	ldrh r1, [r0]
	movs r0, #2
	b _0814F576
	.align 2, 0
_0814F538: .4byte 0x02022C90
_0814F53C: .4byte 0x003F0100
_0814F540: .4byte 0x0203886C
_0814F544:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0814F55C
	ldr r0, _0814F558
	ldrh r1, [r0]
	movs r0, #4
	b _0814F5A0
	.align 2, 0
_0814F558: .4byte 0x0203886C
_0814F55C:
	bl GetTrainerBLoseText
	adds r4, r0, #0
	b _0814F5DC
_0814F564:
	ldr r0, _0814F580
	ldr r1, [r0]
	ldr r0, _0814F584
	ands r0, r1
	cmp r0, #0
	beq _0814F590
	ldr r0, _0814F588
_0814F572:
	ldrh r1, [r0]
	movs r0, #1
_0814F576:
	bl CopyFrontierTrainerText
	ldr r4, _0814F58C
	b _0814F5DC
	.align 2, 0
_0814F580: .4byte 0x02022C90
_0814F584: .4byte 0x003F0100
_0814F588: .4byte 0x0203886C
_0814F58C: .4byte 0x02021C7C
_0814F590:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0814F5DC
	ldr r0, _0814F5A8
_0814F59C:
	ldrh r1, [r0]
	movs r0, #3
_0814F5A0:
	bl CopyTrainerHillTrainerText
	ldr r4, _0814F5AC
	b _0814F5DC
	.align 2, 0
_0814F5A8: .4byte 0x0203886C
_0814F5AC: .4byte 0x02021C7C
_0814F5B0:
	ldr r0, _0814F5C8
_0814F5B2:
	ldrh r0, [r0]
_0814F5B4:
	bl GetFrontierOpponentClass
_0814F5B8:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0814F5BC:
	movs r1, #0xb
_0814F5BE:
	muls r1, r0, r1
	ldr r0, _0814F5CC
	adds r4, r1, r0
	b _0814F5DC
	.align 2, 0
_0814F5C8: .4byte 0x0203886E
_0814F5CC: .4byte 0x082E3564
_0814F5D0:
	ldr r0, _0814F628
_0814F5D2:
	ldrh r1, [r0]
_0814F5D4:
	mov r0, sp
	bl GetFrontierTrainerName
_0814F5DA:
	mov r4, sp
_0814F5DC:
	ldrb r1, [r4]
	adds r0, r1, #0
	mov r5, sb
	ldrb r2, [r5]
	mov r3, sb
	adds r3, #1
	cmp r0, #0xff
	beq _0814F5FE
_0814F5EC:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, #1
	adds r4, #1
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0814F5EC
_0814F5FE:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x24
	beq _0814F612
	cmp r0, #0x30
	beq _0814F612
	cmp r0, #0x25
	beq _0814F612
	cmp r0, #0x31
	bne _0814F638
_0814F612:
	mov r0, r8
	adds r1, r0, r6
	movs r0, #0xfc
	strb r0, [r1]
	adds r6, #1
	mov r2, r8
	adds r1, r2, r6
	movs r0, #9
	strb r0, [r1]
	adds r6, #1
	b _0814F638
	.align 2, 0
_0814F628: .4byte 0x0203886E
	thumb_func_end BattleStringExpandPlaceholders

	thumb_func_start BattlePutTextOnWindow
BattlePutTextOnWindow: @ 0x0814F62C
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, #1
	mov r3, sb
	adds r3, #1
_0814F638:
	mov sb, r3
	ldrb r1, [r3]
	thumb_func_end BattlePutTextOnWindow

	thumb_func_start sub_0814F63C
sub_0814F63C: @ 0x0814F63C
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0814F646
	bl BattleStringExpandPlaceholders
_0814F646:
	mov r5, r8
	adds r1, r5, r6
	mov r2, sb
	ldrb r0, [r2]
	strb r0, [r1]
	adds r6, #1
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0814F63C

	thumb_func_start ExpandBattleTextBuffPlaceholders
ExpandBattleTextBuffPlaceholders: @ 0x0814F664
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #1
	movs r0, #0
	mov r8, r0
	movs r0, #0xff
	strb r0, [r6]
	ldrb r0, [r7, #1]
	cmp r0, #0xff
	bne _0814F682
	b _0814F902
_0814F682:
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0xa
	bls _0814F68E
	b _0814F8F8
_0814F68E:
	lsls r0, r1, #2
	ldr r1, _0814F698
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814F698: .4byte 0x0814F69C
_0814F69C: @ jump table
	.4byte _0814F6C8 @ case 0
	.4byte _0814F6E4 @ case 1
	.4byte _0814F738 @ case 2
	.4byte _0814F750 @ case 3
	.4byte _0814F760 @ case 4
	.4byte _0814F7D8 @ case 5
	.4byte _0814F7EC @ case 6
	.4byte _0814F7FE @ case 7
	.4byte _0814F844 @ case 8
	.4byte _0814F858 @ case 9
	.4byte _0814F870 @ case 10
_0814F6C8:
	adds r0, r5, r7
	ldrb r1, [r0, #1]
	ldrb r0, [r0, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0814F6E0
	subs r1, #0xc
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	b _0814F8D6
	.align 2, 0
_0814F6E0: .4byte 0x085AB3DC
_0814F6E4:
	ldrb r0, [r4, #1]
	cmp r0, #2
	beq _0814F700
	cmp r0, #2
	bgt _0814F6F4
	cmp r0, #1
	beq _0814F6FA
	b _0814F722
_0814F6F4:
	cmp r0, #4
	beq _0814F708
	b _0814F722
_0814F6FA:
	ldrb r4, [r4, #3]
	mov r8, r4
	b _0814F722
_0814F700:
	ldrb r1, [r4, #3]
	ldrb r0, [r4, #4]
	lsls r0, r0, #8
	b _0814F71E
_0814F708:
	ldrb r0, [r4, #3]
	mov r8, r0
	ldrb r0, [r4, #4]
	lsls r0, r0, #8
	mov r1, r8
	orrs r1, r0
	ldrb r0, [r4, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r4, #6]
	lsls r0, r0, #0x18
_0814F71E:
	orrs r1, r0
	mov r8, r1
_0814F722:
	adds r4, r5, r7
	ldrb r3, [r4, #2]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	bl ConvertIntToDecimalStringN
	adds r0, r5, #3
	ldrb r4, [r4, #1]
	adds r5, r0, r4
	b _0814F8F8
_0814F738:
	adds r0, r5, r7
	ldrb r1, [r0, #1]
	ldrb r0, [r0, #2]
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #3
	ldr r0, _0814F74C
	adds r1, r1, r0
	b _0814F8D6
	.align 2, 0
_0814F74C: .4byte 0x082EACC4
_0814F750:
	adds r0, r5, r7
	ldrb r0, [r0, #1]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldr r0, _0814F75C
	b _0814F860
	.align 2, 0
_0814F75C: .4byte 0x082EBC88
_0814F760:
	ldrb r0, [r4, #1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814F784
	ldrb r1, [r4, #2]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814F780
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	b _0814F7C0
	.align 2, 0
_0814F780: .4byte 0x02024190
_0814F784:
	ldr r0, _0814F79C
	ldr r0, [r0]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0814F7A4
	ldr r1, _0814F7A0
	adds r0, r6, #0
	bl StringAppend
	b _0814F7AC
	.align 2, 0
_0814F79C: .4byte 0x02022C90
_0814F7A0: .4byte 0x085AB00F
_0814F7A4:
	ldr r1, _0814F7D0
	adds r0, r6, #0
	bl StringAppend
_0814F7AC:
	adds r0, r5, r7
	ldrb r1, [r0, #2]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814F7D4
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
_0814F7C0:
	mov r0, sp
	bl StringGetEnd10
	adds r0, r6, #0
	mov r1, sp
	bl StringAppend
	b _0814F8F6
	.align 2, 0
_0814F7D0: .4byte 0x085AB009
_0814F7D4: .4byte 0x020243E8
_0814F7D8:
	ldr r1, _0814F7E8
	adds r0, r5, r7
	ldrb r0, [r0, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	b _0814F862
	.align 2, 0
_0814F7E8: .4byte 0x085AB08C
_0814F7EC:
	adds r0, r5, r7
	ldrb r1, [r0, #1]
	ldrb r0, [r0, #2]
	lsls r0, r0, #8
	orrs r1, r0
	adds r0, r6, #0
	bl GetSpeciesName
	b _0814F8F6
_0814F7FE:
	adds r4, r5, r7
	ldrb r0, [r4, #1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814F824
	ldrb r1, [r4, #2]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814F820
	adds r0, r0, r1
	movs r1, #2
	adds r2, r6, #0
	bl GetMonData
	b _0814F836
	.align 2, 0
_0814F820: .4byte 0x02024190
_0814F824:
	ldrb r1, [r4, #2]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814F840
	adds r0, r0, r1
	movs r1, #2
	adds r2, r6, #0
	bl GetMonData
_0814F836:
	adds r0, r6, #0
	bl StringGetEnd10
	b _0814F8F6
	.align 2, 0
_0814F840: .4byte 0x020243E8
_0814F844:
	ldr r1, _0814F854
	adds r0, r5, r7
	ldrb r0, [r0, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	b _0814F862
	.align 2, 0
_0814F854: .4byte 0x085AB0D0
_0814F858:
	adds r0, r5, r7
	ldrb r1, [r0, #1]
	lsls r1, r1, #3
	ldr r0, _0814F86C
_0814F860:
	adds r1, r1, r0
_0814F862:
	adds r0, r6, #0
	bl StringAppend
	adds r5, #2
	b _0814F8F8
	.align 2, 0
_0814F86C: .4byte 0x082EBDC4
_0814F870:
	adds r0, r5, r7
	ldrb r2, [r0, #1]
	ldrb r0, [r0, #2]
	lsls r0, r0, #8
	orrs r2, r0
	ldr r0, _0814F8B8
	ldr r0, [r0]
	ldr r1, _0814F8BC
	ands r0, r1
	cmp r0, #0
	beq _0814F8EE
	cmp r2, #0xaf
	bne _0814F8E4
	ldr r2, _0814F8C0
	ldr r0, _0814F8C4
	adds r0, #0x25
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _0814F8C8
	ldrb r2, [r1]
	ldrh r0, [r0, #0x18]
	cmp r0, r2
	bne _0814F8D4
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r0, _0814F8CC
	adds r1, r1, r0
	adds r0, r6, #0
	bl StringCopy
	ldr r1, _0814F8D0
	b _0814F8D6
	.align 2, 0
_0814F8B8: .4byte 0x02022C90
_0814F8BC: .4byte 0x02000002
_0814F8C0: .4byte 0x020226A0
_0814F8C4: .4byte 0x02024118
_0814F8C8: .4byte 0x02023EB3
_0814F8CC: .4byte 0x020240A8
_0814F8D0: .4byte 0x085AB28D
_0814F8D4:
	ldr r1, _0814F8E0
_0814F8D6:
	adds r0, r6, #0
	bl StringAppend
	b _0814F8F6
	.align 2, 0
_0814F8E0: .4byte 0x085AB288
_0814F8E4:
	adds r0, r2, #0
	adds r1, r6, #0
	bl CopyItemName
	b _0814F8F6
_0814F8EE:
	adds r0, r2, #0
	adds r1, r6, #0
	bl CopyItemName
_0814F8F6:
	adds r5, #3
_0814F8F8:
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0814F902
	b _0814F682
_0814F902:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ExpandBattleTextBuffPlaceholders

	thumb_func_start ChooseMoveUsedParticle
ChooseMoveUsedParticle: @ 0x0814F910
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r5, _0814F944
	ldr r3, _0814F948
_0814F91A:
	cmp r2, #4
	beq _0814F930
	ldrh r1, [r3]
	cmp r1, #0
	bne _0814F926
	adds r2, #1
_0814F926:
	ldr r0, [r5]
	adds r3, #2
	ldrh r0, [r0]
	cmp r1, r0
	bne _0814F91A
_0814F930:
	cmp r2, #0
	blt _0814F95C
	cmp r2, #2
	bgt _0814F950
	ldr r1, _0814F94C
	adds r0, r4, #0
	bl StringCopy
	b _0814F95C
	.align 2, 0
_0814F944: .4byte 0x0203A874
_0814F948: .4byte 0x085AC146
_0814F94C: .4byte 0x085ABC96
_0814F950:
	cmp r2, #4
	bgt _0814F95C
	ldr r1, _0814F964
	adds r0, r4, #0
	bl StringCopy
_0814F95C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814F964: .4byte 0x085ABC98
	thumb_func_end ChooseMoveUsedParticle

	thumb_func_start ChooseTypeOfMoveUsedString
ChooseTypeOfMoveUsedString: @ 0x0814F968
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	b _0814F972
_0814F970:
	adds r3, #1
_0814F972:
	ldrb r0, [r3]
	cmp r0, #0xff
	bne _0814F970
	ldr r1, _0814F9A8
	ldr r5, _0814F9AC
	movs r0, #0
	lsls r0, r0, #1
	adds r2, r0, r1
_0814F982:
	cmp r4, #4
	beq _0814F99C
	ldrh r1, [r2]
	cmp r1, #0
	bne _0814F98E
	adds r4, #1
_0814F98E:
	ldr r0, [r5]
	adds r2, #2
	ldrh r0, [r0]
	cmp r1, r0
	bne _0814F982
	cmp r4, #4
	bhi _0814F9F8
_0814F99C:
	lsls r0, r4, #2
	ldr r1, _0814F9B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814F9A8: .4byte 0x085AC146
_0814F9AC: .4byte 0x0203A874
_0814F9B0: .4byte 0x0814F9B4
_0814F9B4: @ jump table
	.4byte _0814F9C8 @ case 0
	.4byte _0814F9D0 @ case 1
	.4byte _0814F9D8 @ case 2
	.4byte _0814F9E0 @ case 3
	.4byte _0814F9F0 @ case 4
_0814F9C8:
	ldr r1, _0814F9CC
	b _0814F9E2
	.align 2, 0
_0814F9CC: .4byte 0x085AB03C
_0814F9D0:
	ldr r1, _0814F9D4
	b _0814F9E2
	.align 2, 0
_0814F9D4: .4byte 0x085AB044
_0814F9D8:
	ldr r1, _0814F9DC
	b _0814F9E2
	.align 2, 0
_0814F9DC: .4byte 0x085AB048
_0814F9E0:
	ldr r1, _0814F9EC
_0814F9E2:
	adds r0, r3, #0
	bl StringCopy
	b _0814F9F8
	.align 2, 0
_0814F9EC: .4byte 0x085AB04E
_0814F9F0:
	ldr r1, _0814FA00
	adds r0, r3, #0
	bl StringCopy
_0814F9F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814FA00: .4byte 0x085AB055
	thumb_func_end ChooseTypeOfMoveUsedString

	thumb_func_start sub_0814FA04
sub_0814FA04: @ 0x0814FA04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r1, _0814FA30
	ldr r0, _0814FA34
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0814FA38
	movs r0, #0x7f
	ands r7, r0
	b _0814FA56
	.align 2, 0
_0814FA30: .4byte 0x085AC468
_0814FA34: .4byte 0x02024118
_0814FA38:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r0]
	adds r0, r7, #0
	bl FillWindowPixelBuffer
	adds r0, r7, #0
	bl PutWindowTilemap
	adds r0, r7, #0
	movs r1, #3
	bl CopyWindowToVram
_0814FA56:
	str r4, [sp]
	mov r0, sp
	strb r7, [r0, #4]
	mov r1, sp
	lsls r6, r7, #1
	adds r3, r6, r7
	lsls r3, r3, #2
	add r3, r8
	ldrb r0, [r3, #1]
	strb r0, [r1, #5]
	ldrb r0, [r3, #2]
	strb r0, [r1, #6]
	ldrb r0, [r3, #3]
	strb r0, [r1, #7]
	mov r0, sp
	ldrb r0, [r0, #6]
	strb r0, [r1, #8]
	mov r0, sp
	ldrb r0, [r0, #7]
	strb r0, [r1, #9]
	ldrb r0, [r3, #4]
	strb r0, [r1, #0xa]
	ldrb r0, [r3, #5]
	strb r0, [r1, #0xb]
	mov r4, sp
	ldrb r2, [r4, #0xc]
	movs r1, #0x10
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	mov r2, sp
	ldrb r0, [r3, #7]
	lsls r0, r0, #4
	movs r5, #0xf
	strb r0, [r2, #0xc]
	ldrb r2, [r3, #8]
	adds r0, r5, #0
	ands r0, r2
	ldrb r2, [r4, #0xd]
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #0xd]
	mov r2, sp
	ldrb r0, [r3, #9]
	lsls r0, r0, #4
	ands r1, r5
	orrs r1, r0
	strb r1, [r2, #0xd]
	cmp r7, #0x16
	bne _0814FACC
	ldr r0, _0814FAC8
	ldrb r2, [r0]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
	b _0814FAD4
	.align 2, 0
_0814FAC8: .4byte 0x030030B4
_0814FACC:
	ldr r0, _0814FAF0
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
_0814FAD4:
	strb r1, [r0]
	adds r3, r0, #0
	ldr r0, _0814FAF4
	ldr r1, [r0]
	ldr r2, _0814FAF8
	ands r1, r2
	adds r2, r0, #0
	cmp r1, #0
	beq _0814FAFC
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	b _0814FB04
	.align 2, 0
_0814FAF0: .4byte 0x030030B4
_0814FAF4: .4byte 0x02022C90
_0814FAF8: .4byte 0x01000002
_0814FAFC:
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
_0814FB04:
	strb r0, [r3]
	cmp r7, #0
	beq _0814FB0E
	cmp r7, #0x16
	bne _0814FB58
_0814FB0E:
	ldr r1, [r2]
	ldr r0, _0814FB1C
	ands r0, r1
	cmp r0, #0
	beq _0814FB20
	movs r6, #1
	b _0814FB48
	.align 2, 0
_0814FB1C: .4byte 0x02000002
_0814FB20:
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r1, r0
	cmp r1, #0
	beq _0814FB40
	ldr r4, _0814FB3C
	bl GetBattleSceneInRecordedBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r6, [r0]
	b _0814FB48
	.align 2, 0
_0814FB3C: .4byte 0x085AC470
_0814FB40:
	bl GetPlayerTextSpeedDelay
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0814FB48:
	ldr r0, _0814FB54
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	b _0814FB6A
	.align 2, 0
_0814FB54: .4byte 0x030030B4
_0814FB58:
	adds r0, r6, r7
	lsls r0, r0, #2
	add r0, r8
	ldrb r6, [r0, #6]
	ldrb r1, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
_0814FB6A:
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0
	bl AddTextPrinter
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0814FA04

	thumb_func_start SetPpNumbersPaletteInMoveSelection
SetPpNumbersPaletteInMoveSelection: @ 0x0814FB80
	push {r4, r5, lr}
	ldr r0, _0814FBE0
	ldrb r2, [r0]
	lsls r1, r2, #9
	ldr r0, _0814FBE4
	adds r1, r1, r0
	ldr r0, _0814FBE8
	adds r2, r2, r0
	ldrb r2, [r2]
	adds r0, r1, #0
	adds r0, #8
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r1, #0xc
	adds r1, r1, r2
	ldrb r1, [r1]
	bl GetCurrentPpToMaxPpState
	lsls r0, r0, #0x18
	ldr r5, _0814FBEC
	lsrs r0, r0, #0x16
	ldr r2, _0814FBF0
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r2, r5, #0
	adds r2, #0xb8
	strh r1, [r2]
	ldr r1, _0814FBF4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r5, #0xb6
	strh r0, [r5]
	ldr r4, _0814FBF8
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	subs r4, #2
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814FBE0: .4byte 0x02023D08
_0814FBE4: .4byte 0x02022D0C
_0814FBE8: .4byte 0x02024154
_0814FBEC: .4byte 0x020373B4
_0814FBF0: .4byte 0x08D85604
_0814FBF4: .4byte 0x08D85606
_0814FBF8: .4byte 0x0203786C
	thumb_func_end SetPpNumbersPaletteInMoveSelection

	thumb_func_start GetCurrentPpToMaxPpState
GetCurrentPpToMaxPpState: @ 0x0814FBFC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, r2, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, r2
	beq _0814FC44
	cmp r0, #2
	bhi _0814FC16
	cmp r2, #1
	bhi _0814FC44
	b _0814FC1E
_0814FC16:
	cmp r0, #7
	bhi _0814FC28
	cmp r2, #2
	bhi _0814FC44
_0814FC1E:
	movs r0, #2
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0814FC46
_0814FC28:
	cmp r2, #0
	bne _0814FC30
	movs r0, #2
	b _0814FC46
_0814FC30:
	lsrs r0, r1, #0x1a
	cmp r2, r0
	bhi _0814FC3A
	movs r0, #1
	b _0814FC46
_0814FC3A:
	lsrs r0, r1, #0x19
	cmp r3, r0
	bhi _0814FC44
	movs r0, #0
	b _0814FC46
_0814FC44:
	movs r0, #3
_0814FC46:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetCurrentPpToMaxPpState

