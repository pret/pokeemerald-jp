.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetContestTrainerGfxIds
SetContestTrainerGfxIds: @ 0x080F9068
	push {r4, lr}
	ldr r0, _080F9098
	ldr r2, [r0]
	ldr r1, _080F909C
	ldrb r3, [r1, #0x15]
	ldr r4, _080F90A0
	adds r0, r2, r4
	strh r3, [r0]
	adds r0, r1, #0
	adds r0, #0x55
	ldrb r3, [r0]
	adds r4, #2
	adds r0, r2, r4
	strh r3, [r0]
	adds r1, #0x95
	ldrb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #5
	adds r2, r2, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9098: .4byte 0x03005AEC
_080F909C: .4byte 0x02039AA0
_080F90A0: .4byte 0x000013BC
	thumb_func_end SetContestTrainerGfxIds

	thumb_func_start sub_080F90A4
sub_080F90A4: @ 0x080F90A4
	push {lr}
	ldr r0, _080F90BC
	ldrb r0, [r0]
	adds r1, r0, #0
	cmp r0, #1
	beq _080F90CA
	cmp r0, #1
	bgt _080F90C0
	cmp r0, #0
	beq _080F90C6
	b _080F90D2
	.align 2, 0
_080F90BC: .4byte 0x02037282
_080F90C0:
	cmp r1, #2
	beq _080F90CE
	b _080F90D2
_080F90C6:
	movs r1, #3
	b _080F90D4
_080F90CA:
	movs r1, #4
	b _080F90D4
_080F90CE:
	movs r1, #5
	b _080F90D4
_080F90D2:
	movs r1, #0x64
_080F90D4:
	ldr r0, _080F90DC
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080F90DC: .4byte 0x02037280
	thumb_func_end sub_080F90A4

	thumb_func_start sub_080F90E0
sub_080F90E0: @ 0x080F90E0
	push {lr}
	bl sub_080F8AF4
	bl sub_080F8B18
	bl sub_080F8CBC
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080F90E0

	thumb_func_start sub_080F90F4
sub_080F90F4: @ 0x080F90F4
	push {lr}
	ldr r0, _080F9108
	ldrh r0, [r0]
	cmp r0, #4
	bhi _080F9134
	lsls r0, r0, #2
	ldr r1, _080F910C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F9108: .4byte 0x02039BCC
_080F910C: .4byte 0x080F9110
_080F9110: @ jump table
	.4byte _080F9124 @ case 0
	.4byte _080F9128 @ case 1
	.4byte _080F912C @ case 2
	.4byte _080F9130 @ case 3
	.4byte _080F9134 @ case 4
_080F9124:
	movs r1, #8
	b _080F9136
_080F9128:
	movs r1, #9
	b _080F9136
_080F912C:
	movs r1, #0xa
	b _080F9136
_080F9130:
	movs r1, #0xb
	b _080F9136
_080F9134:
	movs r1, #0xc
_080F9136:
	ldr r0, _080F9150
	ldr r0, [r0]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080F9154
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	bne _080F915C
	ldr r0, _080F9158
	strh r1, [r0]
	b _080F9162
	.align 2, 0
_080F9150: .4byte 0x03005AEC
_080F9154: .4byte 0x00002E98
_080F9158: .4byte 0x02037280
_080F915C:
	ldr r1, _080F9168
	movs r0, #1
	strh r0, [r1]
_080F9162:
	pop {r0}
	bx r0
	.align 2, 0
_080F9168: .4byte 0x02037280
	thumb_func_end sub_080F90F4

	thumb_func_start sub_080F916C
sub_080F916C: @ 0x080F916C
	push {lr}
	movs r0, #0xff
	bl sub_080DE4B0
	pop {r0}
	bx r0
	thumb_func_end sub_080F916C

	thumb_func_start sub_080F9178
sub_080F9178: @ 0x080F9178
	push {lr}
	ldr r0, _080F91A8
	ldr r1, _080F91AC
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F91C0
	ldr r0, _080F91B0
	ldrh r0, [r0]
	cmp r0, #3
	bne _080F91C0
	ldr r1, _080F91B4
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _080F91B8
	cmp r1, r0
	ble _080F91C0
	ldr r1, _080F91BC
	movs r0, #1
	b _080F91C4
	.align 2, 0
_080F91A8: .4byte 0x02039BC0
_080F91AC: .4byte 0x02039BC5
_080F91B0: .4byte 0x02039BCE
_080F91B4: .4byte 0x02039BA8
_080F91B8: .4byte 0x0000031F
_080F91BC: .4byte 0x02037280
_080F91C0:
	ldr r1, _080F91CC
	movs r0, #0
_080F91C4:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F91CC: .4byte 0x02037280
	thumb_func_end sub_080F9178

	thumb_func_start CountPlayerContestPaintings
CountPlayerContestPaintings: @ 0x080F91D0
	push {lr}
	movs r3, #0
	ldr r0, _080F91F8
	ldr r0, [r0]
	ldr r2, _080F91FC
	adds r1, r0, r2
	movs r2, #4
_080F91DE:
	ldrh r0, [r1]
	cmp r0, #0
	beq _080F91EA
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_080F91EA:
	adds r1, #0x20
	subs r2, #1
	cmp r2, #0
	bge _080F91DE
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_080F91F8: .4byte 0x03005AEC
_080F91FC: .4byte 0x00002F98
	thumb_func_end CountPlayerContestPaintings

	thumb_func_start sub_080F9200
sub_080F9200: @ 0x080F9200
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _080F932C
	mov ip, r0
	ldr r1, _080F9330
	mov r8, r1
	ldr r2, _080F9334
	mov sl, r2
	ldr r4, _080F9338
	mov sb, r4
	mov r2, ip
	mov r1, sp
	movs r6, #3
_080F9222:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r6, #1
	cmp r6, #0
	bge _080F9222
	movs r6, #0
_080F9232:
	movs r1, #3
	cmp r1, r6
	ble _080F925C
_080F9238:
	subs r4, r1, #1
	lsls r0, r4, #1
	mov r5, sp
	adds r3, r5, r0
	lsls r0, r1, #1
	adds r2, r5, r0
	ldrh r5, [r3]
	movs r7, #0
	ldrsh r1, [r3, r7]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080F9256
	strh r5, [r2]
	strh r0, [r3]
_080F9256:
	adds r1, r4, #0
	cmp r1, r6
	bgt _080F9238
_080F925C:
	adds r6, #1
	cmp r6, #2
	ble _080F9232
	mov r2, r8
	ldrh r0, [r2]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	movs r2, #0
	movs r7, #0
	movs r6, #0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r3, r0, #0
	mov r1, sp
_080F927A:
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, r4
	bne _080F9296
	lsls r0, r2, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r2, r0, #0x18
	mov r5, r8
	ldrh r5, [r5]
	cmp r6, r5
	bne _080F9296
	adds r7, r2, #0
_080F9296:
	adds r1, #2
	adds r6, #1
	cmp r6, #3
	ble _080F927A
	movs r6, #0
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r1, r3, #0x10
	lsls r2, r2, #0x18
	mov r8, r2
	cmp r0, r1
	beq _080F92C4
	adds r2, r1, #0
	mov r1, sp
_080F92B4:
	adds r1, #2
	adds r6, #1
	cmp r6, #3
	bgt _080F92C4
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bne _080F92B4
_080F92C4:
	lsls r0, r6, #0x18
	lsrs r5, r0, #0x18
	adds r2, r7, #0
	movs r6, #0
	asrs r0, r3, #0x10
	str r0, [sp, #8]
	mov r1, ip
	movs r4, #0
	ldrsh r0, [r1, r4]
	ldr r1, [sp, #8]
	cmp r1, r0
	bne _080F92E6
	cmp r7, #1
	beq _080F92FE
_080F92E0:
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080F92E6:
	adds r6, #1
	cmp r6, #3
	bgt _080F92FE
	lsls r0, r6, #1
	add r0, ip
	asrs r1, r3, #0x10
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne _080F92E6
	cmp r2, #1
	bne _080F92E0
_080F92FE:
	lsls r4, r6, #6
	mov r0, sb
	adds r1, r4, r0
	mov r0, sl
	bl StringCopy
	ldr r0, _080F933C
	mov r1, sb
	adds r1, #0xb
	adds r4, r4, r1
	adds r1, r4, #0
	bl StringCopy
	mov r1, r8
	asrs r0, r1, #0x18
	cmp r0, #1
	beq _080F9324
	cmp r7, r0
	bne _080F9340
_080F9324:
	ldr r0, _080F9330
	strh r5, [r0]
	b _080F9346
	.align 2, 0
_080F932C: .4byte 0x02039BA0
_080F9330: .4byte 0x02037284
_080F9334: .4byte 0x02021C40
_080F9338: .4byte 0x02039AA2
_080F933C: .4byte 0x02021C54
_080F9340:
	ldr r1, _080F9358
	adds r0, r5, #4
	strh r0, [r1]
_080F9346:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9358: .4byte 0x02037284
	thumb_func_end sub_080F9200

	thumb_func_start ShowContestWinnerCleanup
ShowContestWinnerCleanup: @ 0x080F935C
	push {lr}
	ldr r0, _080F9368
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080F9368: .4byte 0x08085B35
	thumb_func_end ShowContestWinnerCleanup

	thumb_func_start ShowContestWinner
ShowContestWinner: @ 0x080F936C
	push {lr}
	ldr r0, _080F9380
	bl SetMainCallback2
	ldr r1, _080F9384
	ldr r0, _080F9388
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080F9380: .4byte 0x0812FE25
_080F9384: .4byte 0x03002360
_080F9388: .4byte 0x080F935D
	thumb_func_end ShowContestWinner

	thumb_func_start sub_080F938C
sub_080F938C: @ 0x080F938C
	push {r4, r5, lr}
	ldr r0, _080F93C0
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080F940C
	movs r3, #0
	ldr r0, _080F93C4
	adds r4, r0, #0
	ldr r5, _080F93C8
	ldrb r0, [r4]
	cmp r3, r0
	bge _080F93E0
	adds r2, r5, #0
	ldr r1, _080F93CC
_080F93AC:
	ldrb r0, [r1]
	subs r0, #1
	cmp r0, #1
	bhi _080F93D4
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	bne _080F93D0
	movs r0, #0xeb
	b _080F93D2
	.align 2, 0
_080F93C0: .4byte 0x02039BCA
_080F93C4: .4byte 0x02039BD0
_080F93C8: .4byte 0x02039AA0
_080F93CC: .4byte 0x020226A0
_080F93D0:
	movs r0, #0xec
_080F93D2:
	strb r0, [r2, #0x15]
_080F93D4:
	adds r2, #0x40
	adds r1, #0x1c
	adds r3, #1
	ldrb r0, [r4]
	cmp r3, r0
	blt _080F93AC
_080F93E0:
	ldr r0, _080F9414
	ldrb r1, [r5, #0x15]
	bl VarSet
	ldr r0, _080F9418
	adds r1, r5, #0
	adds r1, #0x55
	ldrb r1, [r1]
	bl VarSet
	ldr r0, _080F941C
	adds r1, r5, #0
	adds r1, #0x95
	ldrb r1, [r1]
	bl VarSet
	ldr r0, _080F9420
	adds r1, r5, #0
	adds r1, #0xd5
	ldrb r1, [r1]
	bl VarSet
_080F940C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9414: .4byte 0x00004010
_080F9418: .4byte 0x00004011
_080F941C: .4byte 0x00004012
_080F9420: .4byte 0x00004013
	thumb_func_end sub_080F938C

	thumb_func_start sub_080F9424
sub_080F9424: @ 0x080F9424
	push {r4, r5, r6, r7, lr}
	ldr r1, _080F9498
	movs r0, #0xc
	strb r0, [r1]
	ldr r0, _080F949C
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080F94FE
	movs r5, #0
	ldr r0, _080F94A0
	ldrb r0, [r0]
	cmp r5, r0
	bge _080F94FE
	movs r7, #0
	movs r6, #0x60
	movs r4, #0xb0
	lsls r4, r4, #0x11
_080F944A:
	ldr r0, _080F94A4
	adds r0, r5, r0
	ldrb r0, [r0]
	ldr r1, _080F94A8
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080F94AC
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080F94B0
	adds r1, r1, r0
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r6
	strb r0, [r1, #5]
	ldr r0, _080F94B4
	adds r1, r7, r0
	ldrb r0, [r1]
	subs r0, #1
	cmp r0, #1
	bhi _080F94C8
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	bne _080F94BC
	lsrs r1, r4, #0x10
	ldr r0, _080F94B8
	b _080F94D2
	.align 2, 0
_080F9498: .4byte 0x030030BC
_080F949C: .4byte 0x02039BCA
_080F94A0: .4byte 0x02039BD0
_080F94A4: .4byte 0x085694CC
_080F94A8: .4byte 0x03005AEC
_080F94AC: .4byte 0x02036FF0
_080F94B0: .4byte 0x020205AC
_080F94B4: .4byte 0x020226A0
_080F94B8: .4byte 0x08471E6C
_080F94BC:
	lsrs r1, r4, #0x10
	ldr r0, _080F94C4
	b _080F94D2
	.align 2, 0
_080F94C4: .4byte 0x0847D90C
_080F94C8:
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	bne _080F94E0
	lsrs r1, r4, #0x10
	ldr r0, _080F94DC
_080F94D2:
	movs r2, #0x20
	bl LoadPalette
	b _080F94EA
	.align 2, 0
_080F94DC: .4byte 0x08470C4C
_080F94E0:
	lsrs r1, r4, #0x10
	ldr r0, _080F9504
	movs r2, #0x20
	bl LoadPalette
_080F94EA:
	movs r0, #0x80
	lsls r0, r0, #0xd
	adds r4, r4, r0
	adds r7, #0x1c
	adds r6, #0x10
	adds r5, #1
	ldr r0, _080F9508
	ldrb r0, [r0]
	cmp r5, r0
	blt _080F944A
_080F94FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9504: .4byte 0x0847C6CC
_080F9508: .4byte 0x02039BD0
	thumb_func_end sub_080F9424

	thumb_func_start GiveMonArtistRibbon
GiveMonArtistRibbon: @ 0x080F950C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080F958C
	ldrb r0, [r6]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _080F9590
	adds r0, r0, r4
	movs r1, #0x46
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	strb r0, [r1]
	cmp r0, #0
	bne _080F95A8
	ldr r0, _080F9594
	ldr r1, _080F9598
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F95A8
	ldr r0, _080F959C
	ldrh r0, [r0]
	cmp r0, #3
	bne _080F95A8
	ldr r1, _080F95A0
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _080F95A4
	cmp r1, r0
	ble _080F95A8
	movs r1, #1
	mov r0, sp
	strb r1, [r0]
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x46
	mov r2, sp
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	bl GetRibbonCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080F9586
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x46
	bl sub_080EEFFC
_080F9586:
	movs r0, #1
	b _080F95AA
	.align 2, 0
_080F958C: .4byte 0x02039BC4
_080F9590: .4byte 0x02024190
_080F9594: .4byte 0x02039BC0
_080F9598: .4byte 0x02039BC5
_080F959C: .4byte 0x02039BCE
_080F95A0: .4byte 0x02039BA8
_080F95A4: .4byte 0x0000031F
_080F95A8:
	movs r0, #0
_080F95AA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GiveMonArtistRibbon

	thumb_func_start sub_080F95B4
sub_080F95B4: @ 0x080F95B4
	movs r0, #0
	bx lr
	thumb_func_end sub_080F95B4

	thumb_func_start ShowContestEntryMonPic
ShowContestEntryMonPic: @ 0x080F95B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _080F9638
	adds r0, r7, #0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _080F95D4
	b _080F972C
_080F95D4:
	bl AllocateMonSpritesGfx
	movs r0, #0xa
	mov sb, r0
	movs r1, #3
	mov sl, r1
	ldr r2, _080F963C
	ldr r4, _080F9640
	ldrh r1, [r4]
	lsls r1, r1, #6
	adds r0, r1, r2
	ldrh r6, [r0]
	adds r0, r2, #0
	adds r0, #0x38
	adds r0, r1, r0
	ldr r5, [r0]
	adds r2, #0x3c
	adds r1, r1, r2
	ldr r1, [r1]
	mov r8, r1
	adds r0, r7, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080F9644
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
	strh r6, [r0, #0xa]
	ldr r1, _080F9648
	ldrh r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F9654
	lsls r0, r6, #3
	ldr r1, _080F964C
	adds r0, r0, r1
	ldr r1, _080F9650
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r2, r6, #0
	adds r3, r5, #0
	bl HandleLoadSpecialPokePic_2
	b _080F9668
	.align 2, 0
_080F9638: .4byte 0x080F9779
_080F963C: .4byte 0x02039AA0
_080F9640: .4byte 0x02037284
_080F9644: .4byte 0x03005B60
_080F9648: .4byte 0x02039BC5
_080F964C: .4byte 0x082DDA1C
_080F9650: .4byte 0x02024178
_080F9654:
	lsls r0, r6, #3
	ldr r1, _080F96D4
	adds r0, r0, r1
	ldr r1, _080F96D8
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r2, r6, #0
	adds r3, r5, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
_080F9668:
	adds r0, r6, #0
	mov r1, r8
	adds r2, r5, #0
	bl GetMonSpritePalStructFromOtIdPersonality
	adds r4, r0, #0
	bl LoadCompressedSpritePalette
	adds r0, r6, #0
	movs r1, #1
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080F96DC
	ldrh r1, [r4, #4]
	strh r1, [r0, #2]
	mov r1, sb
	adds r1, #1
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #0xe
	adds r1, r1, r2
	asrs r1, r1, #0x10
	mov r3, sl
	lsls r2, r3, #0x13
	movs r3, #0xa0
	lsls r3, r3, #0xe
	adds r2, r2, r3
	asrs r2, r2, #0x10
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080F96E0
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080F96E8
	movs r0, #4
	ands r0, r1
	lsls r4, r5, #4
	cmp r0, #0
	bne _080F96FC
	adds r0, r4, r5
	lsls r0, r0, #2
	ldr r1, _080F96E4
	adds r0, r0, r1
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl DoMonFrontSpriteAnimation
	b _080F96FC
	.align 2, 0
_080F96D4: .4byte 0x082DDA1C
_080F96D8: .4byte 0x02024178
_080F96DC: .4byte 0x02024640
_080F96E0: .4byte 0x02039BCA
_080F96E4: .4byte 0x020205AC
_080F96E8:
	lsls r4, r5, #4
	adds r0, r4, r5
	lsls r0, r0, #2
	ldr r1, _080F973C
	adds r0, r0, r1
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl DoMonFrontSpriteAnimation
_080F96FC:
	ldr r1, _080F9740
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #0xc]
	mov r1, sb
	strh r1, [r0, #0xe]
	mov r2, sl
	strh r2, [r0, #0x10]
	ldr r3, _080F973C
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r1, r0
	ldr r2, _080F9744
	str r2, [r0]
	adds r1, r1, r3
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
_080F972C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F973C: .4byte 0x020205AC
_080F9740: .4byte 0x03005B60
_080F9744: .4byte 0x08007141
	thumb_func_end ShowContestEntryMonPic

	thumb_func_start sub_080F9748
sub_080F9748: @ 0x080F9748
	push {lr}
	ldr r0, _080F9770
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _080F976C
	ldr r0, _080F9774
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	bl FreeMonSpritesGfx
_080F976C:
	pop {r0}
	bx r0
	.align 2, 0
_080F9770: .4byte 0x080F9779
_080F9774: .4byte 0x03005B60
	thumb_func_end sub_080F9748

	thumb_func_start sub_080F9778
sub_080F9778: @ 0x080F9778
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080F979C
	adds r5, r0, r1
	movs r2, #8
	ldrsh r0, [r5, r2]
	adds r2, r1, #0
	cmp r0, #4
	bhi _080F9828
	lsls r0, r0, #2
	ldr r1, _080F97A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F979C: .4byte 0x03005B60
_080F97A0: .4byte 0x080F97A4
_080F97A4: @ jump table
	.4byte _080F9808 @ case 0
	.4byte _080F97B8 @ case 1
	.4byte _080F9828 @ case 2
	.4byte _080F97D2 @ case 3
	.4byte _080F9814 @ case 4
_080F97B8:
	movs r0, #0xa
	movs r1, #3
	movs r2, #8
	movs r3, #8
	bl CreateWindowFromRect
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x12]
	movs r1, #1
	bl SetStandardWindowBorderStyle
	b _080F9808
_080F97D2:
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F9810
	adds r4, r0, r1
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeSpritePaletteByTag
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	beq _080F9802
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
_080F9802:
	adds r0, r4, #0
	bl DestroySprite
_080F9808:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _080F9828
	.align 2, 0
_080F9810: .4byte 0x020205AC
_080F9814:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #0x12]
	bl ClearToTransparentAndRemoveWindow
	adds r0, r4, #0
	bl DestroyTask
_080F9828:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080F9778

	thumb_func_start ScriptGetMultiplayerId
ScriptGetMultiplayerId: @ 0x080F9830
	push {r4, lr}
	ldr r0, _080F985C
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080F9868
	ldr r0, _080F9860
	ldrb r0, [r0]
	cmp r0, #4
	bne _080F9868
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080F9868
	ldr r4, _080F9864
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	b _080F986E
	.align 2, 0
_080F985C: .4byte 0x02039BCA
_080F9860: .4byte 0x02039BD0
_080F9864: .4byte 0x02037290
_080F9868:
	ldr r1, _080F9874
	movs r0, #4
	strh r0, [r1]
_080F986E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9874: .4byte 0x02037290
	thumb_func_end ScriptGetMultiplayerId

	thumb_func_start ScriptRandom
ScriptRandom: @ 0x080F9878
	push {r4, lr}
	ldr r0, _080F989C
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080F98B0
	ldr r2, _080F98A0
	ldr r1, [r2]
	ldr r0, _080F98A4
	muls r0, r1, r0
	ldr r1, _080F98A8
	adds r0, r0, r1
	str r0, [r2]
	lsrs r0, r0, #0x10
	ldr r4, _080F98AC
	b _080F98BA
	.align 2, 0
_080F989C: .4byte 0x02039BCA
_080F98A0: .4byte 0x03005E18
_080F98A4: .4byte 0x41C64E6D
_080F98A8: .4byte 0x00006073
_080F98AC: .4byte 0x02037290
_080F98B0:
	ldr r4, _080F98C8
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080F98BA:
	ldrh r1, [r4]
	bl __umodsi3
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F98C8: .4byte 0x02037290
	thumb_func_end ScriptRandom

	thumb_func_start sub_080F98CC
sub_080F98CC: @ 0x080F98CC
	ldr r2, _080F98E0
	ldr r1, [r2]
	ldr r0, _080F98E4
	muls r0, r1, r0
	ldr r1, _080F98E8
	adds r0, r0, r1
	str r0, [r2]
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_080F98E0: .4byte 0x03005E18
_080F98E4: .4byte 0x41C64E6D
_080F98E8: .4byte 0x00006073
	thumb_func_end sub_080F98CC

	thumb_func_start sub_080F98EC
sub_080F98EC: @ 0x080F98EC
	push {lr}
	ldr r0, _080F9900
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080F9904
	movs r0, #0
	b _080F990E
	.align 2, 0
_080F9900: .4byte 0x02039BCA
_080F9904:
	ldr r0, _080F9914
	movs r1, #5
	bl CreateTask
	movs r0, #1
_080F990E:
	pop {r1}
	bx r1
	.align 2, 0
_080F9914: .4byte 0x080F9919
	thumb_func_end sub_080F98EC

	thumb_func_start sub_080F9918
sub_080F9918: @ 0x080F9918
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080F994C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080F9950
	cmp r0, #1
	beq _080F995E
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080F9964
	bl EnableBothScriptContexts
	adds r0, r5, #0
	bl DestroyTask
	b _080F9964
	.align 2, 0
_080F994C: .4byte 0x03005B60
_080F9950:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080F9964
	bl sub_0800A8D4
_080F995E:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080F9964:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080F9918

	thumb_func_start sub_080F996C
sub_080F996C: @ 0x080F996C
	push {lr}
	ldr r0, _080F9994
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080F998E
	ldr r0, _080F9998
	ldrb r0, [r0]
	cmp r0, #0
	beq _080F998E
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #8
	movs r1, #8
	bl CreateWirelessStatusIndicatorSprite
_080F998E:
	pop {r0}
	bx r0
	.align 2, 0
_080F9994: .4byte 0x02039BCA
_080F9998: .4byte 0x030031C4
	thumb_func_end sub_080F996C

	thumb_func_start sub_080F999C
sub_080F999C: @ 0x080F999C
	push {lr}
	ldr r0, _080F99BC
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080F99B6
	ldr r0, _080F99C0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080F99B6
	bl DestroyWirelessStatusIndicatorSprite
_080F99B6:
	pop {r0}
	bx r0
	.align 2, 0
_080F99BC: .4byte 0x02039BCA
_080F99C0: .4byte 0x030031C4
	thumb_func_end sub_080F999C

	thumb_func_start sub_080F99C4
sub_080F99C4: @ 0x080F99C4
	push {lr}
	ldr r0, _080F99D8
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080F99DC
	movs r0, #0
	b _080F99DE
	.align 2, 0
_080F99D8: .4byte 0x02039BCA
_080F99DC:
	movs r0, #1
_080F99DE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080F99C4

	thumb_func_start sub_080F99E4
sub_080F99E4: @ 0x080F99E4
	ldr r1, _080F99EC
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080F99EC: .4byte 0x02039BCA
	thumb_func_end sub_080F99E4

	thumb_func_start sub_080F99F0
sub_080F99F0: @ 0x080F99F0
	push {lr}
	ldr r0, _080F9A04
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080F9A08
	movs r0, #0
	b _080F9A0A
	.align 2, 0
_080F9A04: .4byte 0x02039BCA
_080F9A08:
	movs r0, #1
_080F9A0A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080F99F0

	thumb_func_start HealPlayerParty
HealPlayerParty: @ 0x080F9A10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	mov r8, r0
	ldr r0, _080F9ACC
	ldrb r0, [r0]
	cmp r8, r0
	bhs _080F9ABC
	ldr r1, _080F9AD0
	mov sl, r1
	mov r6, sp
_080F9A2E:
	movs r0, #0x64
	mov r4, r8
	muls r4, r0, r4
	add r4, sl
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	lsls r1, r0, #0x10
	strb r0, [r6]
	lsrs r1, r1, #0x18
	strb r1, [r6, #1]
	adds r0, r4, #0
	movs r1, #0x39
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x15
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r5, #0
	movs r1, #1
	add r1, r8
	mov sb, r1
_080F9A64:
	adds r1, r5, #0
	adds r1, #0xd
	adds r0, r4, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r7, #0
	adds r2, r5, #0
	bl CalculatePPWithBonus
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x11
	adds r0, r4, #0
	mov r2, sp
	bl SetMonData
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _080F9A64
	movs r0, #0
	strb r0, [r6]
	strb r0, [r6, #1]
	strb r0, [r6, #2]
	strb r0, [r6, #3]
	movs r1, #0x64
	mov r0, r8
	muls r0, r1, r0
	add r0, sl
	movs r1, #0x37
	mov r2, sp
	bl SetMonData
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080F9ACC
	ldrb r0, [r0]
	cmp r8, r0
	blo _080F9A2E
_080F9ABC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9ACC: .4byte 0x0202418D
_080F9AD0: .4byte 0x02024190
	thumb_func_end HealPlayerParty

	thumb_func_start ScriptGiveMon
ScriptGiveMon: @ 0x080F9AD4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x78
	adds r5, r0, #0
	adds r3, r1, #0
	adds r4, r2, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	mov r8, r0
	add r6, sp, #0x14
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r3, #0
	movs r3, #0x20
	bl CreateMon
	add r0, sp, #0x10
	mov r1, r8
	strb r1, [r0]
	lsrs r4, r4, #0x18
	strb r4, [r0, #1]
	adds r0, r6, #0
	movs r1, #0xc
	add r2, sp, #0x10
	bl SetMonData
	adds r0, r6, #0
	bl GiveMonToPlayer
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r4, #1
	bgt _080F9B48
	cmp r4, #0
	blt _080F9B48
	adds r0, r5, #0
	movs r1, #2
	bl GetSetPokedexFlag
	adds r0, r5, #0
	movs r1, #3
	bl GetSetPokedexFlag
_080F9B48:
	adds r0, r4, #0
	add sp, #0x78
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScriptGiveMon

	thumb_func_start ScriptGiveEgg
ScriptGiveEgg: @ 0x080F9B58
	push {lr}
	sub sp, #0x68
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, sp
	movs r2, #1
	bl CreateEgg
	add r2, sp, #0x64
	movs r0, #1
	strb r0, [r2]
	mov r0, sp
	movs r1, #0x2d
	bl SetMonData
	mov r0, sp
	bl GiveMonToPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0x68
	pop {r1}
	bx r1
	thumb_func_end ScriptGiveEgg

	thumb_func_start HasEnoughMonsForDoubleBattle
HasEnoughMonsForDoubleBattle: @ 0x080F9B88
	push {lr}
	bl GetMonsStateToDoubles
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	beq _080F9BA4
	cmp r1, #1
	bgt _080F9BA0
	cmp r1, #0
	beq _080F9BA4
	b _080F9BA8
_080F9BA0:
	cmp r1, #2
	bne _080F9BA8
_080F9BA4:
	ldr r0, _080F9BAC
	strh r1, [r0]
_080F9BA8:
	pop {r0}
	bx r0
	.align 2, 0
_080F9BAC: .4byte 0x02037290
	thumb_func_end HasEnoughMonsForDoubleBattle

	thumb_func_start CheckPartyMonHasHeldItem
CheckPartyMonHasHeldItem: @ 0x080F9BB0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #0
	movs r7, #0xce
	lsls r7, r7, #1
_080F9BBC:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _080F9BEC
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080F9BF0
	cmp r0, r7
	beq _080F9BF0
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	cmp r0, r6
	bne _080F9BF0
	movs r0, #1
	b _080F9BF8
	.align 2, 0
_080F9BEC: .4byte 0x02024190
_080F9BF0:
	adds r5, #1
	cmp r5, #5
	ble _080F9BBC
	movs r0, #0
_080F9BF8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckPartyMonHasHeldItem

	thumb_func_start sub_080F9C00
sub_080F9C00: @ 0x080F9C00
	push {r4, lr}
	movs r0, #0xaf
	bl CheckPartyMonHasHeldItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #1
	bne _080F9C22
	movs r0, #0xaf
	bl ItemIdToBerryType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080F9C2C
	bl GetBerryNameByBerryType
_080F9C22:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F9C2C: .4byte 0x02021C40
	thumb_func_end sub_080F9C00

	thumb_func_start CreateScriptedWildMon
CreateScriptedWildMon: @ 0x080F9C30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r7, r2, #0x10
	lsrs r6, r7, #0x10
	bl ZeroEnemyPartyMons
	ldr r0, _080F9C8C
	mov r8, r0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0x20
	bl CreateMon
	cmp r6, #0
	beq _080F9C7E
	add r0, sp, #0x10
	strb r6, [r0]
	adds r1, r0, #0
	lsrs r0, r7, #0x18
	strb r0, [r1, #1]
	mov r0, r8
	movs r1, #0xc
	add r2, sp, #0x10
	bl SetMonData
_080F9C7E:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9C8C: .4byte 0x020243E8
	thumb_func_end CreateScriptedWildMon

	thumb_func_start ScriptSetMonMoveSlot
ScriptSetMonMoveSlot: @ 0x080F9C90
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r3, #6
	bls _080F9CAC
	ldr r0, _080F9CC0
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_080F9CAC:
	movs r0, #0x64
	muls r0, r3, r0
	ldr r1, _080F9CC4
	adds r0, r0, r1
	adds r1, r4, #0
	bl SetMonMoveSlot
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9CC0: .4byte 0x0202418D
_080F9CC4: .4byte 0x02024190
	thumb_func_end ScriptSetMonMoveSlot

	thumb_func_start ChooseHalfPartyForBattle
ChooseHalfPartyForBattle: @ 0x080F9CC8
	push {lr}
	ldr r0, _080F9CE4
	ldr r1, _080F9CE8
	str r1, [r0, #8]
	ldr r0, _080F9CEC
	movs r1, #9
	bl VarSet
	movs r0, #0
	bl InitChooseHalfPartyForBattle
	pop {r0}
	bx r0
	.align 2, 0
_080F9CE4: .4byte 0x03002360
_080F9CE8: .4byte 0x080F9CF1
_080F9CEC: .4byte 0x000040CF
	thumb_func_end ChooseHalfPartyForBattle

	thumb_func_start CB2_ReturnFromChooseHalfParty
CB2_ReturnFromChooseHalfParty: @ 0x080F9CF0
	push {lr}
	ldr r0, _080F9D00
	ldrb r1, [r0]
	cmp r1, #0
	bne _080F9D08
	ldr r0, _080F9D04
	strh r1, [r0]
	b _080F9D0E
	.align 2, 0
_080F9D00: .4byte 0x0203CBC4
_080F9D04: .4byte 0x02037290
_080F9D08:
	ldr r1, _080F9D18
	movs r0, #1
	strh r0, [r1]
_080F9D0E:
	ldr r0, _080F9D1C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080F9D18: .4byte 0x02037290
_080F9D1C: .4byte 0x08085B35
	thumb_func_end CB2_ReturnFromChooseHalfParty

	thumb_func_start sub_080F9D20
sub_080F9D20: @ 0x080F9D20
	push {lr}
	ldr r1, _080F9D3C
	ldr r0, _080F9D40
	str r0, [r1, #8]
	ldr r0, _080F9D44
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl InitChooseHalfPartyForBattle
	pop {r0}
	bx r0
	.align 2, 0
_080F9D3C: .4byte 0x03002360
_080F9D40: .4byte 0x080F9D49
_080F9D44: .4byte 0x02037280
	thumb_func_end sub_080F9D20

	thumb_func_start sub_080F9D48
sub_080F9D48: @ 0x080F9D48
	push {lr}
	ldr r0, _080F9D58
	ldrb r1, [r0]
	cmp r1, #0
	bne _080F9D60
	ldr r0, _080F9D5C
	strh r1, [r0]
	b _080F9D66
	.align 2, 0
_080F9D58: .4byte 0x0203CBC4
_080F9D5C: .4byte 0x02037290
_080F9D60:
	ldr r1, _080F9D70
	movs r0, #1
	strh r0, [r1]
_080F9D66:
	ldr r0, _080F9D74
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080F9D70: .4byte 0x02037290
_080F9D74: .4byte 0x08085B35
	thumb_func_end sub_080F9D48

	thumb_func_start ReducePlayerPartyToSelectedMons
ReducePlayerPartyToSelectedMons: @ 0x080F9D78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x198
	add r0, sp, #0x190
	movs r1, #0
	str r1, [r0]
	ldr r2, _080F9DE8
	mov r1, sp
	bl CpuSet
	movs r5, #0
	movs r7, #0x64
	ldr r6, _080F9DEC
	mov r4, sp
_080F9D92:
	ldr r0, _080F9DF0
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080F9DAC
	subs r0, #1
	adds r1, r0, #0
	muls r1, r7, r1
	adds r1, r1, r6
	adds r0, r4, #0
	movs r2, #0x64
	bl memcpy
_080F9DAC:
	adds r4, #0x64
	adds r5, #1
	cmp r5, #3
	ble _080F9D92
	add r0, sp, #0x194
	movs r1, #0
	str r1, [r0]
	ldr r4, _080F9DEC
	ldr r2, _080F9DF4
	adds r1, r4, #0
	bl CpuSet
	mov r5, sp
	add r6, sp, #0x12c
_080F9DC8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x64
	bl memcpy
	adds r5, #0x64
	adds r4, #0x64
	cmp r5, r6
	ble _080F9DC8
	bl CalculatePlayerPartyCount
	add sp, #0x198
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9DE8: .4byte 0x05000064
_080F9DEC: .4byte 0x02024190
_080F9DF0: .4byte 0x0203CBC4
_080F9DF4: .4byte 0x05000096
	thumb_func_end ReducePlayerPartyToSelectedMons

