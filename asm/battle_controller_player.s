.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start nullsub_21
nullsub_21: @ 0x08057068
	bx lr
	.align 2, 0
	thumb_func_end nullsub_21

	thumb_func_start SetControllerToPlayer
SetControllerToPlayer: @ 0x0805706C
	ldr r1, _08057088
	ldr r0, _0805708C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08057090
	str r1, [r0]
	ldr r0, _08057094
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08057098
	strb r1, [r0]
	bx lr
	.align 2, 0
_08057088: .4byte 0x03005AC0
_0805708C: .4byte 0x02023D08
_08057090: .4byte 0x08057115
_08057094: .4byte 0x0202415D
_08057098: .4byte 0x02024170
	thumb_func_end SetControllerToPlayer

	thumb_func_start PlayerBufferExecCompleted
PlayerBufferExecCompleted: @ 0x0805709C
	push {r4, lr}
	sub sp, #4
	ldr r1, _080570DC
	ldr r4, _080570E0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080570E4
	str r1, [r0]
	ldr r0, _080570E8
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080570F0
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, #2
	movs r1, #4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _080570EC
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r1
	movs r1, #0x38
	strb r1, [r0]
	b _08057102
	.align 2, 0
_080570DC: .4byte 0x03005AC0
_080570E0: .4byte 0x02023D08
_080570E4: .4byte 0x08057115
_080570E8: .4byte 0x02022C90
_080570EC: .4byte 0x02022D08
_080570F0:
	ldr r2, _0805710C
	ldr r1, _08057110
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_08057102:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805710C: .4byte 0x02023D0C
_08057110: .4byte 0x082FACB4
	thumb_func_end PlayerBufferExecCompleted

	thumb_func_start PlayerBufferRunCommand
PlayerBufferRunCommand: @ 0x08057114
	push {lr}
	ldr r2, _08057148
	ldr r1, _0805714C
	ldr r0, _08057150
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08057160
	ldr r0, _08057154
	lsls r1, r3, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x38
	bhi _0805715C
	ldr r0, _08057158
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _08057160
	.align 2, 0
_08057148: .4byte 0x02023D0C
_0805714C: .4byte 0x082FACB4
_08057150: .4byte 0x02023D08
_08057154: .4byte 0x02022D08
_08057158: .4byte 0x082ECE9C
_0805715C:
	bl PlayerBufferExecCompleted
_08057160:
	pop {r0}
	bx r0
	thumb_func_end PlayerBufferRunCommand

	thumb_func_start CompleteOnBankSpritePosX_0
CompleteOnBankSpritePosX_0: @ 0x08057164
	push {lr}
	ldr r2, _0805718C
	ldr r1, _08057190
	ldr r0, _08057194
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x24
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08057186
	bl PlayerBufferExecCompleted
_08057186:
	pop {r0}
	bx r0
	.align 2, 0
_0805718C: .4byte 0x020205AC
_08057190: .4byte 0x02023E88
_08057194: .4byte 0x02023D08
	thumb_func_end CompleteOnBankSpritePosX_0

	thumb_func_start sub_08057198
sub_08057198: @ 0x08057198
	push {r4, r5, r6, r7, lr}
	ldr r3, _080571E8
	ldr r4, _080571EC
	ldrb r0, [r4]
	lsls r2, r0, #9
	adds r1, r3, #2
	adds r1, r2, r1
	ldrb r5, [r1]
	adds r3, #3
	adds r2, r2, r3
	ldrb r1, [r2]
	lsls r1, r1, #8
	orrs r5, r1
	movs r1, #1
	movs r2, #7
	movs r3, #1
	bl DoBounceEffect
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #7
	movs r3, #1
	bl DoBounceEffect
	ldr r0, _080571F0
	ldrh r1, [r0, #0x30]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _080571FC
	ldr r0, _080571F4
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #2
	bne _080571FC
	ldr r1, _080571F8
	ldrb r0, [r1]
	adds r0, #1
	b _08057200
	.align 2, 0
_080571E8: .4byte 0x02022D08
_080571EC: .4byte 0x02023D08
_080571F0: .4byte 0x03002360
_080571F4: .4byte 0x03005AF0
_080571F8: .4byte 0x02024170
_080571FC:
	ldr r1, _08057230
	movs r0, #0
_08057200:
	strb r0, [r1]
	ldr r0, _08057234
	ldrh r2, [r0, #0x2e]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	beq _08057268
	movs r0, #5
	bl PlaySE
	ldr r1, _08057238
	ldr r0, _0805723C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08057250
	cmp r0, #1
	bgt _08057240
	cmp r0, #0
	beq _0805724A
	b _080573D2
	.align 2, 0
_08057230: .4byte 0x02024170
_08057234: .4byte 0x03002360
_08057238: .4byte 0x02024150
_0805723C: .4byte 0x02023D08
_08057240:
	cmp r0, #2
	beq _08057256
	cmp r0, #3
	beq _0805725C
	b _080573D2
_0805724A:
	movs r0, #1
	movs r1, #0
	b _080573CC
_08057250:
	movs r0, #1
	movs r1, #1
	b _080573CC
_08057256:
	movs r0, #1
	movs r1, #2
	b _080573CC
_0805725C:
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	b _080573D2
_08057268:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080572A8
	ldr r5, _080572A0
	ldr r4, _080572A4
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08057284
	b _080573F8
_08057284:
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r2, #1
	b _08057342
	.align 2, 0
_080572A0: .4byte 0x02024150
_080572A4: .4byte 0x02023D08
_080572A8:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080572E8
	ldr r5, _080572E0
	ldr r4, _080572E4
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080572C4
	b _080573F8
_080572C4:
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r2, #1
	b _08057342
	.align 2, 0
_080572E0: .4byte 0x02024150
_080572E4: .4byte 0x02023D08
_080572E8:
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r2
	cmp r0, #0
	beq _08057310
	ldr r5, _08057308
	ldr r4, _0805730C
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080573F8
	b _0805732A
	.align 2, 0
_08057308: .4byte 0x02024150
_0805730C: .4byte 0x02023D08
_08057310:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0805735C
	ldr r5, _08057354
	ldr r4, _08057358
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080573F8
_0805732A:
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r2, #2
_08057342:
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0
	bl SetCB2ToReshowScreenAfterMenu
	b _080573F8
	.align 2, 0
_08057354: .4byte 0x02024150
_08057358: .4byte 0x02023D08
_0805735C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0805736A
	ldrb r0, [r1]
	cmp r0, #0x3b
	bls _080573EC
_0805736A:
	ldr r4, _080573D8
	ldr r0, [r4]
	ands r0, r3
	cmp r0, #0
	beq _080573F8
	ldr r6, _080573DC
	ldrb r0, [r6]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _080573F8
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r1, _080573E0
	ldrb r1, [r1]
	ldr r2, _080573E4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080573F8
	ldr r0, [r4]
	ands r0, r7
	cmp r0, #0
	bne _080573F8
	ldr r0, _080573E8
	ldrb r1, [r6]
	lsls r1, r1, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _080573C2
	cmp r5, #0xc
	bhi _080573F8
	adds r0, r5, #0
	movs r1, #1
	bl AddBagItem
_080573C2:
	movs r0, #5
	bl PlaySE
	movs r0, #1
	movs r1, #0xc
_080573CC:
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
_080573D2:
	bl PlayerBufferExecCompleted
	b _080573F8
	.align 2, 0
_080573D8: .4byte 0x02022C90
_080573DC: .4byte 0x02023D08
_080573E0: .4byte 0x02023EB4
_080573E4: .4byte 0x082FACB4
_080573E8: .4byte 0x02022D08
_080573EC:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _080573F8
	bl SwapHpBarsWithHpText
_080573F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08057198

	thumb_func_start sub_08057400
sub_08057400: @ 0x08057400
	push {r4, lr}
	ldr r4, _08057428
	ldrb r0, [r4]
	movs r1, #1
	bl EndBounceEffect
	ldrb r0, [r4]
	movs r1, #0
	bl EndBounceEffect
	ldr r1, _0805742C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08057430
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057428: .4byte 0x02023D08
_0805742C: .4byte 0x03005AC0
_08057430: .4byte 0x08057435
	thumb_func_end sub_08057400

	thumb_func_start HandleInputChooseTarget
HandleInputChooseTarget: @ 0x08057434
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _08057494
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _08057498
	ldrb r0, [r0]
	movs r1, #1
	movs r2, #0xf
	movs r3, #1
	bl DoBounceEffect
	movs r4, #0
	ldr r0, _0805749C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08057476
_0805745A:
	ldr r0, _08057498
	ldrb r0, [r0]
	cmp r4, r0
	beq _0805746C
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl EndBounceEffect
_0805746C:
	adds r4, #1
	ldr r0, _0805749C
	ldrb r0, [r0]
	cmp r4, r0
	blt _0805745A
_08057476:
	ldr r2, _080574A0
	ldrh r1, [r2, #0x2c]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _080574AC
	ldr r0, _080574A4
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #2
	bne _080574AC
	ldr r1, _080574A8
	ldrb r0, [r1]
	adds r0, #1
	b _080574B0
	.align 2, 0
_08057494: .4byte 0x082ECF80
_08057498: .4byte 0x03005AD4
_0805749C: .4byte 0x02023D10
_080574A0: .4byte 0x03002360
_080574A4: .4byte 0x03005AF0
_080574A8: .4byte 0x02024170
_080574AC:
	ldr r1, _08057504
	movs r0, #0
_080574B0:
	strb r0, [r1]
	ldrh r2, [r2, #0x2e]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08057520
	movs r0, #5
	bl PlaySE
	ldr r2, _08057508
	ldr r1, _0805750C
	ldr r4, _08057510
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08057514
	str r1, [r0]
	ldr r1, _08057518
	ldr r0, _0805751C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldrb r0, [r4]
	lsls r0, r0, #8
	orrs r2, r0
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
	ldrb r0, [r4]
	movs r1, #1
	bl EndBounceEffect
	bl PlayerBufferExecCompleted
	b _080577D8
	.align 2, 0
_08057504: .4byte 0x02024170
_08057508: .4byte 0x020205AC
_0805750C: .4byte 0x02023E88
_08057510: .4byte 0x03005AD4
_08057514: .4byte 0x08039771
_08057518: .4byte 0x02024154
_0805751C: .4byte 0x02023D08
_08057520:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0805752E
	ldrb r0, [r1]
	cmp r0, #0x3b
	bls _0805759C
_0805752E:
	movs r0, #5
	bl PlaySE
	ldr r2, _08057580
	ldr r1, _08057584
	ldr r5, _08057588
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _0805758C
	str r1, [r0]
	ldr r1, _08057590
	ldr r4, _08057594
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08057598
	str r1, [r0]
	ldrb r0, [r4]
	movs r1, #1
	movs r2, #7
	movs r3, #1
	bl DoBounceEffect
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #7
	movs r3, #1
	bl DoBounceEffect
	ldrb r0, [r5]
	movs r1, #1
	bl EndBounceEffect
	b _080577D8
	.align 2, 0
_08057580: .4byte 0x020205AC
_08057584: .4byte 0x02023E88
_08057588: .4byte 0x03005AD4
_0805758C: .4byte 0x08039771
_08057590: .4byte 0x03005AC0
_08057594: .4byte 0x02023D08
_08057598: .4byte 0x0805780D
_0805759C:
	movs r0, #0x60
	ands r0, r2
	cmp r0, #0
	bne _080575A6
	b _080576C0
_080575A6:
	movs r0, #5
	bl PlaySE
	ldr r2, _080575D8
	ldr r1, _080575DC
	ldr r3, _080575E0
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _080575E4
	str r1, [r0]
	adds r5, r3, #0
_080575C8:
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r4, #0
	mov r0, sp
	b _080575F2
	.align 2, 0
_080575D8: .4byte 0x020205AC
_080575DC: .4byte 0x02023E88
_080575E0: .4byte 0x03005AD4
_080575E4: .4byte 0x08039771
_080575E8:
	adds r4, #1
	cmp r4, #3
	bgt _080575F8
	mov r2, sp
	adds r0, r2, r4
_080575F2:
	ldrb r0, [r0]
	cmp r1, r0
	bne _080575E8
_080575F8:
	subs r4, #1
	cmp r4, #0
	bge _08057600
	movs r4, #4
_08057600:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetBattlerAtPosition
	strb r0, [r5]
	ldr r1, _08057634
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	beq _080575F8
	movs r4, #0
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0805767E
	cmp r0, #1
	bgt _08057638
	cmp r0, #0
	beq _08057642
	b _08057680
	.align 2, 0
_08057634: .4byte 0x02023D10
_08057638:
	cmp r0, #2
	beq _08057642
	cmp r0, #3
	beq _0805767E
	b _08057680
_08057642:
	ldr r2, _080576A0
	ldrb r0, [r2]
	ldrb r1, [r5]
	cmp r0, r1
	bne _0805767E
	ldr r1, _080576A4
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080576A8
	adds r0, r0, r1
	ldr r1, _080576AC
	adds r2, r2, r1
	ldrb r1, [r2]
	adds r1, #0xd
	bl GetMonData
	ldr r2, _080576B0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #6]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08057680
_0805767E:
	adds r4, #1
_08057680:
	ldr r0, _080576B4
	ldrb r1, [r0]
	ldr r2, _080576B8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _080576BC
	cmp r1, #0
	beq _08057698
	movs r4, #0
_08057698:
	cmp r4, #0
	beq _080575C8
	b _080577C0
	.align 2, 0
_080576A0: .4byte 0x02023D08
_080576A4: .4byte 0x02023D12
_080576A8: .4byte 0x02024190
_080576AC: .4byte 0x02024154
_080576B0: .4byte 0x082ED220
_080576B4: .4byte 0x02023EB4
_080576B8: .4byte 0x082FACB4
_080576BC: .4byte 0x03005AD4
_080576C0:
	movs r0, #0x90
	ands r0, r2
	cmp r0, #0
	bne _080576CA
	b _080577D8
_080576CA:
	movs r0, #5
	bl PlaySE
	ldr r2, _080576FC
	ldr r1, _08057700
	ldr r3, _08057704
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08057708
	str r1, [r0]
	adds r5, r3, #0
_080576EC:
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r4, #0
	mov r0, sp
	b _08057716
	.align 2, 0
_080576FC: .4byte 0x020205AC
_08057700: .4byte 0x02023E88
_08057704: .4byte 0x03005AD4
_08057708: .4byte 0x08039771
_0805770C:
	adds r4, #1
	cmp r4, #3
	bgt _0805771C
	mov r2, sp
	adds r0, r2, r4
_08057716:
	ldrb r0, [r0]
	cmp r1, r0
	bne _0805770C
_0805771C:
	adds r4, #1
	cmp r4, #3
	ble _08057724
	movs r4, #0
_08057724:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetBattlerAtPosition
	strb r0, [r5]
	ldr r1, _08057758
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	beq _0805771C
	movs r4, #0
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080577A2
	cmp r0, #1
	bgt _0805775C
	cmp r0, #0
	beq _08057766
	b _080577A4
	.align 2, 0
_08057758: .4byte 0x02023D10
_0805775C:
	cmp r0, #2
	beq _08057766
	cmp r0, #3
	beq _080577A2
	b _080577A4
_08057766:
	ldr r2, _080577E0
	ldrb r0, [r2]
	ldrb r1, [r5]
	cmp r0, r1
	bne _080577A2
	ldr r1, _080577E4
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080577E8
	adds r0, r0, r1
	ldr r1, _080577EC
	adds r2, r2, r1
	ldrb r1, [r2]
	adds r1, #0xd
	bl GetMonData
	ldr r2, _080577F0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #6]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080577A4
_080577A2:
	adds r4, #1
_080577A4:
	ldr r0, _080577F4
	ldrb r1, [r0]
	ldr r2, _080577F8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _080577FC
	cmp r1, #0
	beq _080577BC
	movs r4, #0
_080577BC:
	cmp r4, #0
	beq _080576EC
_080577C0:
	ldr r2, _08057800
	ldr r1, _08057804
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08057808
	str r1, [r0]
_080577D8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080577E0: .4byte 0x02023D08
_080577E4: .4byte 0x02023D12
_080577E8: .4byte 0x02024190
_080577EC: .4byte 0x02024154
_080577F0: .4byte 0x082ED220
_080577F4: .4byte 0x02023EB4
_080577F8: .4byte 0x082FACB4
_080577FC: .4byte 0x03005AD4
_08057800: .4byte 0x020205AC
_08057804: .4byte 0x02023E88
_08057808: .4byte 0x0803971D
	thumb_func_end HandleInputChooseTarget

	thumb_func_start HandleInputChooseMove
HandleInputChooseMove: @ 0x0805780C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	ldr r3, _08057840
	ldrb r0, [r3]
	lsls r0, r0, #9
	ldr r1, _08057844
	adds r6, r0, r1
	ldr r2, _08057848
	ldrh r1, [r2, #0x2c]
	movs r0, #0xf0
	ands r0, r1
	adds r7, r3, #0
	cmp r0, #0
	beq _08057854
	ldr r0, _0805784C
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #2
	bne _08057854
	ldr r1, _08057850
	ldrb r0, [r1]
	adds r0, #1
	b _08057858
	.align 2, 0
_08057840: .4byte 0x02023D08
_08057844: .4byte 0x02022D0C
_08057848: .4byte 0x03002360
_0805784C: .4byte 0x03005AF0
_08057850: .4byte 0x02024170
_08057854:
	ldr r1, _0805789C
	movs r0, #0
_08057858:
	strb r0, [r1]
	ldrh r2, [r2, #0x2e]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _08057868
	b _08057A14
_08057868:
	movs r0, #5
	bl PlaySE
	ldr r1, _080578A0
	ldr r0, _080578A4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrh r0, [r1]
	cmp r0, #0xae
	bne _080578A8
	ldrb r0, [r6, #0x12]
	movs r4, #0
	cmp r0, #7
	beq _080578B6
	ldrb r1, [r6, #0x13]
	movs r0, #7
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r4, r0, #0x1f
	movs r0, #0x10
	ands r4, r0
	b _080578B6
	.align 2, 0
_0805789C: .4byte 0x02024170
_080578A0: .4byte 0x02024154
_080578A4: .4byte 0x02023D08
_080578A8:
	ldr r2, _080578C8
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r4, [r0, #6]
_080578B6:
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _080578D4
	ldr r0, _080578CC
	ldr r1, _080578D0
	ldrb r1, [r1]
	strb r1, [r0]
	b _080578EE
	.align 2, 0
_080578C8: .4byte 0x082ED220
_080578CC: .4byte 0x03005AD4
_080578D0: .4byte 0x02023D08
_080578D4:
	ldr r0, _0805791C
	ldrb r0, [r0]
	bl GetBattlerPosition
	adds r1, r0, #0
	movs r2, #1
	movs r0, #1
	ands r0, r1
	eors r0, r2
	bl GetBattlerAtPosition
	ldr r1, _08057920
	strb r0, [r1]
_080578EE:
	ldr r5, _08057924
	ldr r0, _0805791C
	ldrb r3, [r0]
	lsls r2, r3, #9
	adds r1, r5, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r7, r0, #0
	cmp r1, #0
	bne _08057928
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0805796A
	adds r0, r5, #2
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805796A
	movs r0, #1
	add r8, r0
	b _0805796A
	.align 2, 0
_0805791C: .4byte 0x02023D08
_08057920: .4byte 0x03005AD4
_08057924: .4byte 0x02022D08
_08057928:
	movs r0, #0x7d
	ands r0, r4
	cmp r0, #0
	bne _08057934
	movs r0, #1
	add r8, r0
_08057934:
	ldr r0, _08057984
	adds r0, r3, r0
	adds r1, r6, #0
	adds r1, #8
	ldrb r0, [r0]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08057972
	movs r0, #0x12
	ands r0, r4
	cmp r0, #0
	bne _0805796A
	movs r0, #0
	bl CountAliveMonsInBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0805796A
	ldrb r0, [r7]
	bl GetDefaultMoveTarget
	ldr r1, _08057988
	strb r0, [r1]
	movs r0, #0
	mov r8, r0
_0805796A:
	ldr r7, _0805798C
	mov r0, r8
	cmp r0, #0
	bne _08057990
_08057972:
	ldr r1, _08057984
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _08057988
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r2, r0
	b _08057A2C
	.align 2, 0
_08057984: .4byte 0x02024154
_08057988: .4byte 0x03005AD4
_0805798C: .4byte 0x02023D08
_08057990:
	ldr r1, _080579AC
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080579B0
	str r1, [r0]
	movs r0, #0x12
	ands r4, r0
	cmp r4, #0
	beq _080579B8
	ldr r1, _080579B4
	ldrb r0, [r7]
	b _080579E8
	.align 2, 0
_080579AC: .4byte 0x03005AC0
_080579B0: .4byte 0x08057435
_080579B4: .4byte 0x03005AD4
_080579B8:
	movs r0, #1
	bl GetBattlerAtPosition
	ldr r1, _080579D8
	ldrb r1, [r1]
	ldr r2, _080579DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080579E0
	movs r0, #3
	b _080579E2
	.align 2, 0
_080579D8: .4byte 0x02023EB4
_080579DC: .4byte 0x082FACB4
_080579E0:
	movs r0, #1
_080579E2:
	bl GetBattlerAtPosition
	ldr r1, _08057A04
_080579E8:
	strb r0, [r1]
	ldr r2, _08057A08
	ldr r1, _08057A0C
	ldr r0, _08057A04
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08057A10
	b _08057BAC
	.align 2, 0
_08057A04: .4byte 0x03005AD4
_08057A08: .4byte 0x020205AC
_08057A0C: .4byte 0x02023E88
_08057A10: .4byte 0x0803971D
_08057A14:
	movs r6, #2
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	bne _08057A24
	ldrb r0, [r1]
	cmp r0, #0x3b
	bls _08057A40
_08057A24:
	movs r0, #5
	bl PlaySE
	ldr r2, _08057A3C
_08057A2C:
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
	bl PlayerBufferExecCompleted
	b _08057BAE
	.align 2, 0
_08057A3C: .4byte 0x0000FFFF
_08057A40:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08057A70
	ldr r4, _08057A6C
	ldrb r0, [r7]
	adds r2, r0, r4
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08057A5A
	b _08057BAE
_08057A5A:
	ldrb r0, [r2]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r7]
	adds r1, r1, r4
	ldrb r0, [r1]
	movs r2, #1
	eors r0, r2
	b _08057B18
	.align 2, 0
_08057A6C: .4byte 0x02024154
_08057A70:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08057AB4
	ldr r4, _08057AAC
	ldrb r0, [r7]
	adds r3, r0, r4
	ldrb r2, [r3]
	movs r6, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _08057A8C
	b _08057BAE
_08057A8C:
	ldr r1, _08057AB0
	adds r0, r6, #0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	blo _08057A9A
	b _08057BAE
_08057A9A:
	ldrb r0, [r3]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r7]
	adds r1, r1, r4
	ldrb r0, [r1]
	eors r0, r6
	b _08057B18
	.align 2, 0
_08057AAC: .4byte 0x02024154
_08057AB0: .4byte 0x03005AD8
_08057AB4:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08057AE4
	ldr r4, _08057AE0
	ldrb r0, [r7]
	adds r2, r0, r4
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08057BAE
	ldrb r0, [r2]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r7]
	adds r1, r1, r4
	ldrb r0, [r1]
	movs r2, #2
	eors r0, r2
	b _08057B18
	.align 2, 0
_08057AE0: .4byte 0x02024154
_08057AE4:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08057B40
	ldr r4, _08057B38
	ldrb r0, [r7]
	adds r3, r0, r4
	ldrb r2, [r3]
	movs r5, #2
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	bne _08057BAE
	ldr r1, _08057B3C
	adds r0, r5, #0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08057BAE
	ldrb r0, [r3]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r7]
	adds r1, r1, r4
	ldrb r0, [r1]
	eors r0, r5
_08057B18:
	strb r0, [r1]
	movs r0, #5
	bl PlaySE
	ldrb r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0
	bl MoveSelectionCreateCursorAt
	bl MoveSelectionDisplayPpNumber
	bl ActionSelectionCreateCursorAt
	b _08057BAE
	.align 2, 0
_08057B38: .4byte 0x02024154
_08057B3C: .4byte 0x03005AD8
_08057B40:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08057BAE
	ldr r0, _08057B78
	ldrb r0, [r0]
	cmp r0, #1
	bls _08057BAE
	ldr r0, _08057B7C
	ldr r5, [r0]
	ands r5, r6
	cmp r5, #0
	bne _08057BAE
	ldr r4, _08057B80
	ldrb r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0x1d
	bl MoveSelectionCreateCursorAt
	ldrb r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08057B88
	ldr r0, _08057B84
	strb r5, [r0]
	b _08057B90
	.align 2, 0
_08057B78: .4byte 0x03005AD8
_08057B7C: .4byte 0x02022C90
_08057B80: .4byte 0x02024154
_08057B84: .4byte 0x03005AD4
_08057B88:
	ldr r1, _08057BB8
	adds r0, #1
	strb r0, [r1]
	adds r0, r1, #0
_08057B90:
	ldrb r0, [r0]
	movs r1, #0x1b
	bl MoveSelectionCreateCursorAt
	ldr r0, _08057BBC
	movs r1, #0xb
	bl sub_0814FA04
	ldr r1, _08057BC0
	ldr r0, _08057BC4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08057BC8
_08057BAC:
	str r1, [r0]
_08057BAE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057BB8: .4byte 0x03005AD4
_08057BBC: .4byte 0x085ABBD8
_08057BC0: .4byte 0x03005AC0
_08057BC4: .4byte 0x02023D08
_08057BC8: .4byte 0x08057D49
	thumb_func_end HandleInputChooseMove

	thumb_func_start sub_08057BCC
sub_08057BCC: @ 0x08057BCC
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r4, _08057D30
	ldrh r1, [r4, #0x2e]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08057BE6
	movs r0, #5
	bl PlaySE
	movs r7, #1
_08057BE6:
	ldrh r1, [r4, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08057C08
	movs r0, #5
	bl PlaySE
	ldr r1, _08057D34
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08057D38
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	movs r7, #0xff
_08057C08:
	ldrh r1, [r4, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08057C48
	ldr r5, _08057D3C
	ldr r4, _08057D40
	ldrb r0, [r4]
	adds r2, r0, r5
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08057C48
	ldrb r0, [r2]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r2, #1
	eors r0, r2
	strb r0, [r1]
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0
	bl MoveSelectionCreateCursorAt
_08057C48:
	ldr r0, _08057D30
	ldrh r1, [r0, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08057C96
	ldr r5, _08057D3C
	ldr r4, _08057D40
	ldrb r0, [r4]
	adds r3, r0, r5
	ldrb r2, [r3]
	movs r6, #1
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08057C96
	ldr r1, _08057D44
	adds r0, r6, #0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08057C96
	ldrb r0, [r3]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	eors r0, r6
	strb r0, [r1]
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0
	bl MoveSelectionCreateCursorAt
_08057C96:
	ldr r0, _08057D30
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08057CD8
	ldr r5, _08057D3C
	ldr r4, _08057D40
	ldrb r0, [r4]
	adds r2, r0, r5
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08057CD8
	ldrb r0, [r2]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r2, #2
	eors r0, r2
	strb r0, [r1]
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0
	bl MoveSelectionCreateCursorAt
_08057CD8:
	ldr r0, _08057D30
	ldrh r1, [r0, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08057D26
	ldr r5, _08057D3C
	ldr r4, _08057D40
	ldrb r0, [r4]
	adds r3, r0, r5
	ldrb r2, [r3]
	movs r6, #2
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _08057D26
	ldr r1, _08057D44
	adds r0, r6, #0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08057D26
	ldrb r0, [r3]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r1, r5
	ldrb r0, [r1]
	eors r0, r6
	strb r0, [r1]
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0
	bl MoveSelectionCreateCursorAt
_08057D26:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08057D30: .4byte 0x03002360
_08057D34: .4byte 0x02022AC8
_08057D38: .4byte 0x02022ACA
_08057D3C: .4byte 0x02024154
_08057D40: .4byte 0x02023D08
_08057D44: .4byte 0x03005AD8
	thumb_func_end sub_08057BCC

	thumb_func_start HandleMoveSwitching
HandleMoveSwitching: @ 0x08057D48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _080580E0
	ldrh r1, [r0, #0x2e]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	bne _08057D62
	b _08058110
_08057D62:
	movs r0, #5
	bl PlaySE
	ldr r0, _080580E4
	mov sl, r0
	ldr r1, _080580E8
	mov r8, r1
	ldrb r1, [r1]
	adds r2, r1, r0
	ldr r5, _080580EC
	ldrb r0, [r2]
	ldrb r3, [r5]
	cmp r0, r3
	bne _08057D80
	b _080580B8
_08057D80:
	lsls r1, r1, #9
	ldr r0, _080580F0
	adds r1, r1, r0
	mov sb, r1
	ldrb r1, [r2]
	lsls r1, r1, #1
	add r1, sb
	ldrh r6, [r1]
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r1]
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, sb
	strh r6, [r0]
	mov r1, r8
	ldrb r0, [r1]
	add r0, sl
	ldrb r1, [r0]
	mov r7, sb
	adds r7, #8
	adds r1, r7, r1
	ldrb r6, [r1]
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, r7, r0
	strb r6, [r0]
	mov r2, r8
	ldrb r0, [r2]
	add r0, sl
	ldrb r1, [r0]
	mov r2, sb
	adds r2, #0xc
	adds r1, r2, r1
	ldrb r6, [r1]
	ldrb r0, [r5]
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r2, r2, r0
	strb r6, [r2]
	mov r3, r8
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _080580F4
	adds r6, r0, r2
	ldrb r4, [r6, #0x18]
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x1c
	ldr r0, _080580F8
	mov ip, r0
	add r1, sl
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, ip
	ldr r0, [r0]
	ands r2, r0
	cmp r2, #0
	beq _08057E3A
	lsrs r1, r3, #0x1c
	bics r1, r0
	lsls r1, r1, #4
	movs r2, #0xf
	adds r0, r2, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r6, #0x18]
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r3, _080580F4
	adds r1, r1, r3
	ldrb r4, [r1, #0x18]
	lsrs r3, r4, #4
	ldrb r0, [r5]
	lsls r0, r0, #2
	add r0, ip
	ldr r0, [r0]
	orrs r0, r3
	lsls r0, r0, #4
	ands r2, r4
	orrs r2, r0
	strb r2, [r1, #0x18]
_08057E3A:
	bl MoveSelectionDisplayMoveNames
	movs r6, #0
	mov ip, r7
	mov r5, sp
	adds r5, #0x18
	str r5, [sp, #0x1c]
	ldr r2, _080580FC
	mov r0, r8
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	adds r4, r0, #0
	adds r4, #0x3b
	mov r7, r8
	mov sl, r2
	movs r5, #3
_08057E5E:
	mov r1, sp
	adds r3, r1, r6
	ldrb r1, [r4]
	lsls r2, r6, #1
	adds r0, r5, #0
	lsls r0, r2
	ands r1, r0
	asrs r1, r2
	strb r1, [r3]
	adds r6, #1
	cmp r6, #3
	ble _08057E5E
	ldr r1, _080580E4
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r0, [r0]
	add r0, sp
	ldrb r0, [r0]
	ldr r2, [sp, #0x1c]
	strb r0, [r2]
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r3, sp
	adds r2, r3, r0
	ldr r1, _080580EC
	ldrb r0, [r1]
	add r0, sp
	ldrb r0, [r0]
	movs r3, #0
	strb r0, [r2]
	ldrb r0, [r1]
	mov r5, sp
	adds r1, r5, r0
	ldr r2, [sp, #0x1c]
	ldrb r0, [r2]
	strb r0, [r1]
	strb r3, [r2]
	movs r6, #0
	ldr r2, [sp, #0x1c]
_08057EAE:
	mov r3, sp
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r6, #1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r6, #1
	cmp r6, #3
	ble _08057EAE
	ldrb r1, [r7]
	movs r0, #0x58
	muls r0, r1, r0
	add r0, sl
	adds r0, #0x3b
	ldr r5, [sp, #0x1c]
	ldrb r1, [r5]
	strb r1, [r0]
	movs r6, #0
	adds r4, r7, #0
	movs r3, #0x58
	movs r0, #0x24
	add r0, sl
	mov r8, r0
	mov r2, sb
	mov r7, sl
	adds r7, #0xc
	mov r5, ip
_08057EE8:
	lsls r1, r6, #1
	ldrb r0, [r4]
	muls r0, r3, r0
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r2]
	strh r0, [r1]
	ldrb r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r6, r1
	add r1, r8
	adds r0, r5, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, #2
	adds r6, #1
	cmp r6, #3
	ble _08057EE8
	ldr r2, _080580E8
	ldrb r1, [r2]
	movs r0, #0x58
	muls r0, r1, r0
	mov r1, sl
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08057F2A
	b _080580B8
_08057F2A:
	movs r6, #0
	mov r1, sp
	adds r1, #4
	str r1, [sp, #0x20]
	add r3, sp, #0xc
	mov sl, r3
	ldr r5, _08058100
	mov sb, r5
	mov r8, r2
	movs r7, #0x64
	ldr r5, _08058104
	adds r4, r1, #0
_08057F42:
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	muls r0, r7, r0
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0xd
	bl GetMonData
	strh r0, [r4]
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	muls r0, r7, r0
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0x11
	bl GetMonData
	mov r3, sl
	adds r1, r3, r6
	strb r0, [r1]
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _08057F42
	ldr r1, _08058100
	ldr r0, _080580E8
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08058104
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	ldr r5, [sp, #0x1c]
	strb r0, [r5]
	movs r6, #0
	movs r5, #3
	ldr r4, [sp, #0x1c]
_08057FA2:
	mov r0, sp
	adds r3, r0, r6
	lsls r2, r6, #1
	adds r1, r5, #0
	lsls r1, r2
	ldrb r0, [r4]
	ands r0, r1
	asrs r0, r2
	strb r0, [r3]
	adds r6, #1
	cmp r6, #3
	ble _08057FA2
	ldr r4, _080580E4
	ldr r3, _080580E8
	ldrb r0, [r3]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r1, r1, #1
	ldr r2, [sp, #0x20]
	adds r1, r2, r1
	ldrh r6, [r1]
	ldr r2, _080580EC
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldr r5, [sp, #0x20]
	adds r0, r5, r0
	ldrh r0, [r0]
	movs r5, #0
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldr r1, [sp, #0x20]
	adds r0, r1, r0
	strh r6, [r0]
	ldrb r0, [r3]
	adds r0, r0, r4
	ldrb r1, [r0]
	add r1, sl
	ldrb r6, [r1]
	ldrb r0, [r2]
	add r0, sl
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	add r0, sl
	strb r6, [r0]
	ldrb r0, [r3]
	adds r0, r0, r4
	ldrb r0, [r0]
	add r0, sp
	ldrb r0, [r0]
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	ldrb r0, [r3]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r3, sp
	adds r1, r3, r0
	ldrb r0, [r2]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	adds r1, r3, r0
	ldr r2, [sp, #0x1c]
	ldrb r0, [r2]
	strb r0, [r1]
	strb r5, [r2]
	movs r6, #0
	ldr r2, [sp, #0x1c]
_0805802E:
	mov r3, sp
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r6, #1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r6, #1
	cmp r6, #3
	ble _0805802E
	movs r6, #0
	ldr r5, _08058100
	mov sl, r5
	ldr r0, _080580E8
	mov sb, r0
	movs r1, #0x64
	mov r8, r1
	ldr r7, _08058104
	ldr r5, [sp, #0x20]
	adds r5, #8
	ldr r4, [sp, #0x20]
_0805805A:
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	adds r0, r0, r7
	adds r1, r6, #0
	adds r1, #0xd
	adds r2, r4, #0
	bl SetMonData
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, r0, r7
	adds r1, r6, #0
	adds r1, #0x11
	adds r2, r5, #0
	bl SetMonData
	adds r5, #1
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _0805805A
	ldr r1, _08058100
	ldr r0, _080580E8
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08058104
	adds r0, r0, r1
	movs r1, #0x15
	ldr r2, [sp, #0x1c]
	bl SetMonData
_080580B8:
	ldr r1, _08058108
	ldr r2, _080580E8
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805810C
	str r1, [r0]
	ldr r3, _080580E4
	ldrb r0, [r2]
	adds r0, r0, r3
	ldr r1, _080580EC
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r1, #0
	bl MoveSelectionCreateCursorAt
	b _08058142
	.align 2, 0
_080580E0: .4byte 0x03002360
_080580E4: .4byte 0x02024154
_080580E8: .4byte 0x02023D08
_080580EC: .4byte 0x03005AD4
_080580F0: .4byte 0x02022D0C
_080580F4: .4byte 0x02023F60
_080580F8: .4byte 0x082FACB4
_080580FC: .4byte 0x02023D28
_08058100: .4byte 0x02023D12
_08058104: .4byte 0x02024190
_08058108: .4byte 0x03005AC0
_0805810C: .4byte 0x0805780D
_08058110:
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _08058164
	movs r0, #5
	bl PlaySE
	ldr r0, _08058150
	ldrb r0, [r0]
	bl MoveSelectionDestroyCursorAt
	ldr r1, _08058154
	ldr r4, _08058158
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl MoveSelectionCreateCursorAt
	ldr r1, _0805815C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08058160
	str r1, [r0]
_08058142:
	bl PlayerHandleTwoReturnValues
	bl MoveSelectionDisplayPpNumber
	bl ActionSelectionCreateCursorAt
	b _080582F8
	.align 2, 0
_08058150: .4byte 0x03005AD4
_08058154: .4byte 0x02024154
_08058158: .4byte 0x02023D08
_0805815C: .4byte 0x03005AC0
_08058160: .4byte 0x0805780D
_08058164:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080581B4
	ldr r3, _08058194
	ldrb r2, [r3]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0805817A
	b _080582F8
_0805817A:
	ldr r0, _08058198
	ldr r1, _0805819C
	ldrb r1, [r1]
	adds r1, r1, r0
	ldrb r5, [r1]
	cmp r2, r5
	bne _080581A0
_08058188:
	ldrb r0, [r1]
	movs r1, #0x1d
	bl MoveSelectionCreateCursorAt
	b _080581A6
	.align 2, 0
_08058194: .4byte 0x03005AD4
_08058198: .4byte 0x02024154
_0805819C: .4byte 0x02023D08
_080581A0:
	ldrb r0, [r3]
	bl MoveSelectionDestroyCursorAt
_080581A6:
	ldr r4, _080581B0
	ldrb r0, [r4]
	movs r1, #1
	b _0805823C
	.align 2, 0
_080581B0: .4byte 0x03005AD4
_080581B4:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080581F8
	ldr r3, _080581E8
	ldrb r2, [r3]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080581CA
	b _080582F8
_080581CA:
	ldr r1, _080581EC
	movs r0, #1
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	blo _080581D8
	b _080582F8
_080581D8:
	ldr r0, _080581F0
	ldr r1, _080581F4
	ldrb r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r2, r0
	beq _08058188
	b _080581A0
	.align 2, 0
_080581E8: .4byte 0x03005AD4
_080581EC: .4byte 0x03005AD8
_080581F0: .4byte 0x02024154
_080581F4: .4byte 0x02023D08
_080581F8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805826C
	ldr r3, _08058224
	ldrb r2, [r3]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080582F8
	ldr r0, _08058228
	ldr r1, _0805822C
	ldrb r1, [r1]
	adds r1, r1, r0
	ldrb r5, [r1]
	cmp r2, r5
	bne _08058230
	ldrb r0, [r1]
	movs r1, #0x1d
	bl MoveSelectionCreateCursorAt
	b _08058236
	.align 2, 0
_08058224: .4byte 0x03005AD4
_08058228: .4byte 0x02024154
_0805822C: .4byte 0x02023D08
_08058230:
	ldrb r0, [r3]
	bl MoveSelectionDestroyCursorAt
_08058236:
	ldr r4, _08058260
	ldrb r0, [r4]
	movs r1, #2
_0805823C:
	eors r0, r1
	strb r0, [r4]
	movs r0, #5
	bl PlaySE
	ldr r1, _08058264
	ldr r0, _08058268
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	beq _080582DA
	ldrb r0, [r4]
	movs r1, #0x1b
	bl MoveSelectionCreateCursorAt
	b _080582F8
	.align 2, 0
_08058260: .4byte 0x03005AD4
_08058264: .4byte 0x02024154
_08058268: .4byte 0x02023D08
_0805826C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080582F8
	ldr r3, _080582A4
	ldrb r2, [r3]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _080582F8
	ldr r1, _080582A8
	movs r0, #2
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bhs _080582F8
	ldr r0, _080582AC
	ldr r1, _080582B0
	ldrb r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r2, r0
	bne _080582B4
	ldrb r0, [r1]
	movs r1, #0x1d
	bl MoveSelectionCreateCursorAt
	b _080582BA
	.align 2, 0
_080582A4: .4byte 0x03005AD4
_080582A8: .4byte 0x03005AD8
_080582AC: .4byte 0x02024154
_080582B0: .4byte 0x02023D08
_080582B4:
	ldrb r0, [r3]
	bl MoveSelectionDestroyCursorAt
_080582BA:
	ldr r4, _080582E4
	ldrb r0, [r4]
	movs r1, #2
	eors r0, r1
	strb r0, [r4]
	movs r0, #5
	bl PlaySE
	ldr r1, _080582E8
	ldr r0, _080582EC
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080582F0
_080582DA:
	adds r0, r1, #0
	movs r1, #0
	bl MoveSelectionCreateCursorAt
	b _080582F8
	.align 2, 0
_080582E4: .4byte 0x03005AD4
_080582E8: .4byte 0x02024154
_080582EC: .4byte 0x02023D08
_080582F0:
	ldrb r0, [r4]
	movs r1, #0x1b
	bl MoveSelectionCreateCursorAt
_080582F8:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end HandleMoveSwitching

	thumb_func_start sub_08058308
sub_08058308: @ 0x08058308
	push {lr}
	ldr r0, _08058350
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805836C
	ldr r0, _08058354
	ldrb r0, [r0]
	cmp r0, #0
	bne _080583A8
	movs r0, #0x5a
	bl m4aSongNumStop
	ldr r3, _08058358
	ldr r0, _0805835C
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08058360
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _08058364
	bl SetMainCallback2
	ldr r0, _08058368
	ldrb r0, [r0]
	cmp r0, #1
	bne _08058348
	bl TryPutLinkBattleTvShowOnAir
_08058348:
	bl FreeAllWindowBuffers
	b _080583A8
	.align 2, 0
_08058350: .4byte 0x0300319C
_08058354: .4byte 0x030031C4
_08058358: .4byte 0x03002360
_0805835C: .4byte 0x00000439
_08058360: .4byte 0x03005A60
_08058364: .4byte 0x08038A19
_08058368: .4byte 0x02023FDE
_0805836C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080583A8
	movs r0, #0x5a
	bl m4aSongNumStop
	ldr r3, _080583AC
	ldr r0, _080583B0
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080583B4
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _080583B8
	bl SetMainCallback2
	ldr r0, _080583BC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080583A4
	bl TryPutLinkBattleTvShowOnAir
_080583A4:
	bl FreeAllWindowBuffers
_080583A8:
	pop {r0}
	bx r0
	.align 2, 0
_080583AC: .4byte 0x03002360
_080583B0: .4byte 0x00000439
_080583B4: .4byte 0x03005A60
_080583B8: .4byte 0x08038A19
_080583BC: .4byte 0x02023FDE
	thumb_func_end sub_08058308

	thumb_func_start sub_080583C0
sub_080583C0: @ 0x080583C0
	push {lr}
	ldr r0, _080583F4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08058442
	ldr r0, _080583F8
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08058420
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08058442
	ldr r0, _080583FC
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058400
	bl sub_0800A7F8
	b _08058404
	.align 2, 0
_080583F4: .4byte 0x02037C74
_080583F8: .4byte 0x02022C90
_080583FC: .4byte 0x0300319C
_08058400:
	bl sub_0800A8D4
_08058404:
	ldr r1, _08058414
	ldr r0, _08058418
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805841C
	str r1, [r0]
	b _08058442
	.align 2, 0
_08058414: .4byte 0x03005AC0
_08058418: .4byte 0x02023D08
_0805841C: .4byte 0x08058309
_08058420:
	movs r0, #0x5a
	bl m4aSongNumStop
	ldr r2, _08058448
	ldr r0, _0805844C
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _08058450
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, #8]
	bl SetMainCallback2
_08058442:
	pop {r0}
	bx r0
	.align 2, 0
_08058448: .4byte 0x03002360
_0805844C: .4byte 0x00000439
_08058450: .4byte 0x03005A60
	thumb_func_end sub_080583C0

	thumb_func_start PlayerHandleIntroSlide
PlayerHandleIntroSlide: @ 0x08058454
	push {lr}
	ldr r2, _0805847C
	ldr r1, _08058480
	ldr r0, _08058484
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08058488
	cmp r1, r0
	bne _08058478
	bl PlayerBufferExecCompleted
_08058478:
	pop {r0}
	bx r0
	.align 2, 0
_0805847C: .4byte 0x020205AC
_08058480: .4byte 0x02023E88
_08058484: .4byte 0x02023D08
_08058488: .4byte 0x08007141
	thumb_func_end PlayerHandleIntroSlide

	thumb_func_start PlayerHandleChosenMonReturnValue
PlayerHandleChosenMonReturnValue: @ 0x0805848C
	push {lr}
	ldr r2, _080584B4
	ldr r1, _080584B8
	ldr r0, _080584BC
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _080584C0
	cmp r1, r0
	bne _080584B0
	bl PlayerBufferExecCompleted
_080584B0:
	pop {r0}
	bx r0
	.align 2, 0
_080584B4: .4byte 0x020205AC
_080584B8: .4byte 0x02023E88
_080584BC: .4byte 0x02023D08
_080584C0: .4byte 0x08007141
	thumb_func_end PlayerHandleChosenMonReturnValue

	thumb_func_start sub_080584C4
sub_080584C4: @ 0x080584C4
	push {r4, r5, r6, lr}
	ldr r6, _08058520
	ldr r5, _08058524
	ldr r4, _08058528
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805852C
	cmp r1, r0
	bne _08058518
	ldr r0, _08058530
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	bl sub_0805DBFC
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl FreeSpriteOamMatrix
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	bl PlayerBufferExecCompleted
_08058518:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058520: .4byte 0x020205AC
_08058524: .4byte 0x02023E88
_08058528: .4byte 0x02023D08
_0805852C: .4byte 0x08007141
_08058530: .4byte 0x03005AF0
	thumb_func_end sub_080584C4

	thumb_func_start sub_08058534
sub_08058534: @ 0x08058534
	push {r4, lr}
	ldr r4, _08058574
	ldr r1, [r4]
	ldr r3, _08058578
	ldrb r0, [r3]
	ldr r2, [r1, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0805856C
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #9]
	bl PlayerBufferExecCompleted
_0805856C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058574: .4byte 0x02024174
_08058578: .4byte 0x02023D08
	thumb_func_end sub_08058534

	thumb_func_start sub_0805857C
sub_0805857C: @ 0x0805857C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r7, #0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080585A8
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080585E0
	ldr r0, _080585CC
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080585E0
_080585A8:
	ldr r2, _080585D0
	ldr r1, _080585D4
	ldr r3, _080585D8
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _080585DC
	mov sl, r3
	cmp r1, r0
	bne _0805861A
	b _0805861E
	.align 2, 0
_080585CC: .4byte 0x02022C90
_080585D0: .4byte 0x020205AC
_080585D4: .4byte 0x03005AD0
_080585D8: .4byte 0x02023D08
_080585DC: .4byte 0x08007141
_080585E0:
	ldr r3, _08058728
	ldr r6, _0805872C
	ldr r2, _08058730
	ldrb r4, [r2]
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r3, #0
	adds r5, #0x1c
	adds r0, r0, r5
	ldr r3, [r0]
	ldr r0, _08058734
	mov sl, r2
	cmp r3, r0
	bne _0805861A
	movs r0, #2
	eors r4, r0
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	bne _0805861A
	movs r7, #1
_0805861A:
	cmp r7, #0
	beq _08058718
_0805861E:
	ldr r0, _08058738
	mov sb, r0
	ldr r0, [r0]
	mov r6, sl
	ldrb r2, [r6]
	ldr r3, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r3
	ldrb r1, [r4, #1]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08058718
	movs r1, #2
	mov r8, r1
	mov r1, r8
	eors r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #1]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08058718
	ldrb r1, [r4]
	movs r3, #0x7f
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r4]
	mov r2, sb
	ldr r0, [r2]
	ldrb r2, [r6]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	strb r0, [r1, #1]
	mov r0, sb
	ldr r2, [r0]
	ldrb r0, [r6]
	mov r1, r8
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	mov r1, sb
	ldr r2, [r1]
	ldrb r0, [r6]
	mov r1, r8
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	ands r4, r1
	strb r4, [r0, #1]
	ldr r4, _0805873C
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldr r7, _08058740
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _08058744
	adds r0, r0, r4
	bl HandleLowHpMusicChange
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080586F4
	ldrb r0, [r6]
	mov r1, r8
	eors r1, r0
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r4
	bl HandleLowHpMusicChange
_080586F4:
	mov r2, sb
	ldr r0, [r2]
	mov r2, sl
	ldrb r1, [r2]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #9]
	ldr r1, _08058748
	mov r2, sl
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805874C
	str r1, [r0]
_08058718:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058728: .4byte 0x020205AC
_0805872C: .4byte 0x03005AD0
_08058730: .4byte 0x02023D08
_08058734: .4byte 0x08007141
_08058738: .4byte 0x02024174
_0805873C: .4byte 0x000027F9
_08058740: .4byte 0x02023D12
_08058744: .4byte 0x02024190
_08058748: .4byte 0x03005AC0
_0805874C: .4byte 0x08058535
	thumb_func_end sub_0805857C

	thumb_func_start sub_08058750
sub_08058750: @ 0x08058750
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov sb, r0
	mov r8, r0
	ldr r4, _080588FC
	ldr r0, [r4]
	ldr r7, _08058900
	ldrb r2, [r7]
	ldr r1, [r0, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r5, #0x88
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08058790
	ldr r0, _08058904
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08058908
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_08058790:
	ldr r1, [r4]
	ldrb r0, [r7]
	movs r6, #2
	adds r2, r6, #0
	eors r2, r0
	ldr r1, [r1, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _080587C2
	ldr r0, _08058904
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08058908
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_080587C2:
	ldr r0, [r4]
	ldrb r2, [r7]
	ldr r3, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r3
	ldrb r1, [r4]
	movs r5, #8
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08058892
	adds r1, r6, #0
	eors r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08058892
	ldrb r1, [r4, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08058878
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08058848
	ldr r0, _0805890C
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08058848
	ldr r4, _08058910
	ldrb r0, [r7]
	adds r1, r6, #0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08058904
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08058908
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r7]
	eors r0, r6
	bl sub_08076320
	ldrb r0, [r7]
	eors r0, r6
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_08058848:
	ldr r5, _08058910
	ldr r4, _08058900
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08058904
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08058908
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_08076320
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_08058878:
	ldr r0, _080588FC
	ldr r2, [r0]
	ldr r0, _08058900
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0, #1]
_08058892:
	ldr r5, _080588FC
	ldr r0, [r5]
	ldr r4, _08058900
	ldrb r2, [r4]
	ldr r3, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #1]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _08058942
	movs r1, #2
	eors r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08058942
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058942
	ldr r0, [r5]
	ldrb r1, [r4]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08058924
	ldr r0, _0805890C
	ldr r0, [r0]
	movs r1, #0x42
	ands r0, r1
	cmp r0, #0x42
	bne _08058918
	ldr r0, _08058914
	bl m4aMPlayContinue
	b _08058924
	.align 2, 0
_080588FC: .4byte 0x02024174
_08058900: .4byte 0x02023D08
_08058904: .4byte 0x02023D12
_08058908: .4byte 0x02024190
_0805890C: .4byte 0x02022C90
_08058910: .4byte 0x03005AD0
_08058914: .4byte 0x030074D0
_08058918:
	ldr r0, _08058998
	ldr r1, _0805899C
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
_08058924:
	ldr r0, _080589A0
	ldr r2, [r0]
	ldr r0, _080589A4
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #1]
	movs r0, #1
	mov sb, r0
_08058942:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08058962
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080589BC
	ldr r0, _080589A8
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080589BC
_08058962:
	ldr r2, _080589AC
	ldr r0, _080589B0
	ldr r1, _080589A4
	ldrb r4, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r3, [r0]
	ldr r0, _080589B4
	cmp r3, r0
	bne _08058A1A
	ldr r0, _080589B8
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r3
	bne _08058A1A
	b _08058A16
	.align 2, 0
_08058998: .4byte 0x030074D0
_0805899C: .4byte 0x0000FFFF
_080589A0: .4byte 0x02024174
_080589A4: .4byte 0x02023D08
_080589A8: .4byte 0x02022C90
_080589AC: .4byte 0x020205AC
_080589B0: .4byte 0x03005ADC
_080589B4: .4byte 0x08007141
_080589B8: .4byte 0x02023E88
_080589BC:
	ldr r2, _08058AC8
	ldr r7, _08058ACC
	ldr r0, _08058AD0
	ldrb r3, [r0]
	adds r0, r3, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r4, [r0]
	ldr r0, _08058AD4
	cmp r4, r0
	bne _08058A1A
	ldr r6, _08058AD8
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	cmp r5, r4
	bne _08058A1A
	movs r0, #2
	eors r3, r0
	adds r0, r3, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	cmp r4, r5
	bne _08058A1A
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _08058A1A
_08058A16:
	movs r0, #1
	mov r8, r0
_08058A1A:
	mov r0, sb
	cmp r0, #0
	beq _08058ABA
	mov r0, r8
	cmp r0, #0
	beq _08058ABA
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08058A58
	ldr r0, _08058ADC
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08058A58
	ldr r2, _08058ACC
	ldr r0, _08058AD0
	ldrb r1, [r0]
	movs r0, #2
	eors r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08058AC8
	adds r0, r0, r1
	bl DestroySprite
_08058A58:
	ldr r1, _08058ACC
	ldr r4, _08058AD0
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08058AC8
	adds r0, r0, r1
	bl DestroySprite
	ldr r3, _08058AE0
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r1, [r2, #9]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldr r0, [r3]
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldr r0, [r3]
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1, #1]
	ldr r1, _08058AE4
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08058AE8
	str r1, [r0]
_08058ABA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058AC8: .4byte 0x020205AC
_08058ACC: .4byte 0x03005ADC
_08058AD0: .4byte 0x02023D08
_08058AD4: .4byte 0x08007141
_08058AD8: .4byte 0x02023E88
_08058ADC: .4byte 0x02022C90
_08058AE0: .4byte 0x02024174
_08058AE4: .4byte 0x03005AC0
_08058AE8: .4byte 0x0805857D
	thumb_func_end sub_08058750

	thumb_func_start sub_08058AEC
sub_08058AEC: @ 0x08058AEC
	push {r4, r5, r6, lr}
	ldr r2, _08058BAC
	ldr r0, _08058BB0
	ldr r6, _08058BB4
	ldrb r3, [r6]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r4, [r0]
	ldr r0, _08058BB8
	cmp r4, r0
	bne _08058BA4
	ldr r5, _08058BBC
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08058BA4
	ldr r0, _08058BC0
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _08058BA4
	adds r0, r3, #0
	bl CopyBattleSpriteInvisibility
	ldr r0, [r5]
	ldrb r2, [r6]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r2, [r6]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldr r4, _08058BC4
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldr r0, [r5]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08058B98
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
_08058B98:
	ldr r0, _08058BC8
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _08058BCC
	str r0, [r1]
_08058BA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058BAC: .4byte 0x020205AC
_08058BB0: .4byte 0x03005AD0
_08058BB4: .4byte 0x02023D08
_08058BB8: .4byte 0x08007141
_08058BBC: .4byte 0x02024174
_08058BC0: .4byte 0x02023E88
_08058BC4: .4byte 0x000027F9
_08058BC8: .4byte 0x03005AC0
_08058BCC: .4byte 0x08058BD1
	thumb_func_end sub_08058AEC

	thumb_func_start sub_08058BD0
sub_08058BD0: @ 0x08058BD0
	push {r4, lr}
	ldr r0, _08058C24
	ldr r0, [r0]
	ldr r4, _08058C28
	ldrb r1, [r4]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08058C1E
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058C1E
	ldr r0, _08058C2C
	ldr r1, _08058C30
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	ldr r2, _08058C34
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _08058C38
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	bl PlayerBufferExecCompleted
_08058C1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058C24: .4byte 0x02024174
_08058C28: .4byte 0x02023D08
_08058C2C: .4byte 0x030074D0
_08058C30: .4byte 0x0000FFFF
_08058C34: .4byte 0x02023D12
_08058C38: .4byte 0x02024190
	thumb_func_end sub_08058BD0

	thumb_func_start sub_08058C3C
sub_08058C3C: @ 0x08058C3C
	push {r4, r5, r6, lr}
	ldr r6, _08058CE8
	ldr r0, [r6]
	ldr r5, _08058CEC
	ldrb r2, [r5]
	ldr r1, [r0, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	bne _08058C6E
	ldr r0, _08058CF0
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08058CF4
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_08058C6E:
	ldr r4, _08058CF8
	ldr r0, _08058CFC
	ldrb r2, [r5]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r3, r0, #2
	adds r0, r4, #0
	adds r0, #0x1c
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _08058D00
	cmp r1, r0
	bne _08058CE2
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08058CE2
	adds r0, r3, r4
	bl DestroySprite
	ldr r4, _08058D04
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08058CF0
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08058CF4
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	bl sub_08076320
	ldrb r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r1, _08058D08
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08058D0C
	str r1, [r0]
_08058CE2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058CE8: .4byte 0x02024174
_08058CEC: .4byte 0x02023D08
_08058CF0: .4byte 0x02023D12
_08058CF4: .4byte 0x02024190
_08058CF8: .4byte 0x020205AC
_08058CFC: .4byte 0x03005ADC
_08058D00: .4byte 0x08007141
_08058D04: .4byte 0x03005AD0
_08058D08: .4byte 0x03005AC0
_08058D0C: .4byte 0x08058AED
	thumb_func_end sub_08058C3C

	thumb_func_start c3_0802FDF4
c3_0802FDF4: @ 0x08058D10
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058D32
	ldr r0, _08058D38
	ldr r1, _08058D3C
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	bl DestroyTask
_08058D32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058D38: .4byte 0x030074D0
_08058D3C: .4byte 0x0000FFFF
	thumb_func_end c3_0802FDF4

	thumb_func_start MoveSelectionDisplayMoveType
MoveSelectionDisplayMoveType: @ 0x08058D40
	push {r4, r5, r6, lr}
	ldr r5, _08058D80
	ldrb r0, [r5]
	ldr r6, _08058D84
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, #0
	movs r3, #0
	bl MoveBattleBar
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08058D88
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r2, #0
	bl sub_080726F4
	b _08058DA2
	.align 2, 0
_08058D80: .4byte 0x02023D08
_08058D84: .4byte 0x03005AD0
_08058D88:
	ldr r2, _08058DA8
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _08058DAC
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	bl PlayerBufferExecCompleted
_08058DA2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058DA8: .4byte 0x02023D12
_08058DAC: .4byte 0x02024190
	thumb_func_end MoveSelectionDisplayMoveType

	thumb_func_start PlayerHandleCmd42
PlayerHandleCmd42: @ 0x08058DB0
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08058DC2
	bl PlayerBufferExecCompleted
_08058DC2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerHandleCmd42

	thumb_func_start sub_08058DC8
sub_08058DC8: @ 0x08058DC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r1, _08058EC8
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	mov r8, r0
	ldrb r0, [r0, #8]
	mov sl, r0
	mov r1, r8
	ldrb r7, [r1, #0xc]
	str r7, [sp, #8]
	ldrh r2, [r1, #0xa]
	str r2, [sp, #0xc]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08058E0E
	ldr r1, _08058ECC
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp sl, r0
	bne _08058E0E
	b _08058F24
_08058E0E:
	movs r0, #0x64
	mov r1, sl
	muls r1, r0, r1
	ldr r0, _08058ED0
	adds r6, r1, r0
	adds r0, r6, #0
	movs r1, #0xb
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	movs r1, #0x19
	bl GetMonData
	str r0, [sp, #4]
	ldr r3, _08058ED4
	adds r4, #1
	lsls r4, r4, #2
	ldr r2, _08058ED8
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x13]
	movs r1, #0xca
	lsls r1, r1, #1
	muls r1, r2, r1
	adds r4, r4, r1
	adds r4, r4, r3
	ldr r2, [r4]
	str r2, [sp]
	ldr r3, [sp, #0xc]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r1
	cmp r0, r2
	blo _08058EFC
	adds r0, r6, #0
	movs r1, #0x19
	mov r2, sp
	bl SetMonData
	adds r0, r6, #0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, #4
	ldrh r0, [r0]
	subs r2, r2, r0
	ldr r0, [sp, #0xc]
	subs r2, r0, r2
	ldr r4, _08058EDC
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xb
	bl BtlController_EmitTwoReturnValues
	strb r5, [r4]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08058EE4
	ldr r2, _08058ECC
	lsls r0, r7, #1
	adds r0, r0, r2
	mov r1, sl
	ldrh r0, [r0]
	cmp r1, r0
	beq _08058EC2
	movs r0, #2
	eors r7, r0
	lsls r0, r7, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r1, r0
	bne _08058EE4
_08058EC2:
	ldr r0, _08058EE0
	b _08058F26
	.align 2, 0
_08058EC8: .4byte 0x03005B60
_08058ECC: .4byte 0x02023D12
_08058ED0: .4byte 0x02024190
_08058ED4: .4byte 0x082F00B4
_08058ED8: .4byte 0x082F0D54
_08058EDC: .4byte 0x02023D08
_08058EE0: .4byte 0x08059155
_08058EE4:
	ldr r0, _08058EF4
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08058EF8
	b _08058F28
	.align 2, 0
_08058EF4: .4byte 0x03005B60
_08058EF8: .4byte 0x0805926D
_08058EFC:
	str r0, [sp, #4]
	add r2, sp, #4
	adds r0, r6, #0
	movs r1, #0x19
	bl SetMonData
	ldr r1, _08058F1C
	ldr r3, [sp, #8]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, _08058F20
	str r1, [r0]
	mov r0, sb
	bl DestroyTask
	b _08058F2A
	.align 2, 0
_08058F1C: .4byte 0x03005AC0
_08058F20: .4byte 0x08058DB1
_08058F24:
	ldr r0, _08058F3C
_08058F26:
	mov r1, r8
_08058F28:
	str r0, [r1]
_08058F2A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058F3C: .4byte 0x08058F41
	thumb_func_end sub_08058DC8

	thumb_func_start sub_08058F40
sub_08058F40: @ 0x08058F40
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08058FF8
	lsls r2, r0, #2
	mov r8, r2
	add r8, r0
	mov r0, r8
	lsls r0, r0, #3
	mov r8, r0
	add r8, r1
	mov r2, r8
	ldrb r1, [r2, #8]
	movs r0, #0xa
	ldrsh r2, [r2, r0]
	mov sb, r2
	mov r2, r8
	ldrb r2, [r2, #0xc]
	mov sl, r2
	movs r0, #0x64
	adds r6, r1, #0
	muls r6, r0, r6
	ldr r0, _08058FFC
	adds r6, r6, r0
	adds r0, r6, #0
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	movs r1, #0xb
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	movs r1, #0x19
	bl GetMonData
	adds r3, r0, #0
	ldr r6, _08059000
	lsls r1, r4, #2
	ldr r2, _08059004
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	muls r0, r2, r0
	adds r1, r1, r0
	adds r1, r1, r6
	ldr r1, [r1]
	subs r3, r3, r1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r0
	adds r4, r4, r6
	ldr r2, [r4]
	subs r2, r2, r1
	ldr r0, _08059008
	add r0, sl
	ldrb r1, [r0]
	mov r0, sb
	rsbs r0, r0, #0
	str r0, [sp]
	mov r0, sl
	bl SetBattleBarStruct
	movs r0, #0x21
	bl PlaySE
	ldr r0, _0805900C
	mov r1, r8
	str r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058FF8: .4byte 0x03005B60
_08058FFC: .4byte 0x02024190
_08059000: .4byte 0x082F00B4
_08059004: .4byte 0x082F0D54
_08059008: .4byte 0x03005AD0
_0805900C: .4byte 0x08059011
	thumb_func_end sub_08058F40

	thumb_func_start sub_08059010
sub_08059010: @ 0x08059010
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _0805903C
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r6, r0, r1
	ldrh r1, [r6, #0x1c]
	movs r2, #0x1c
	ldrsh r0, [r6, r2]
	cmp r0, #0xc
	bgt _08059040
	adds r0, r1, #1
	strh r0, [r6, #0x1c]
	b _0805913C
	.align 2, 0
_0805903C: .4byte 0x03005B60
_08059040:
	ldrb r0, [r6, #8]
	mov sb, r0
	ldrh r2, [r6, #0xa]
	mov sl, r2
	ldrb r7, [r6, #0xc]
	ldr r5, _08059108
	adds r5, r7, r5
	ldrb r1, [r5]
	adds r0, r7, #0
	movs r2, #1
	movs r3, #0
	bl MoveBattleBar
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r5]
	bl SetHealthboxSpriteVisible
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805913C
	movs r0, #0x21
	bl m4aSongNumStop
	movs r0, #0x64
	mov r1, sb
	muls r1, r0, r1
	ldr r0, _0805910C
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x19
	bl GetMonData
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _08059110
	adds r4, #1
	lsls r4, r4, #2
	ldr r2, _08059114
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	muls r0, r1, r0
	adds r4, r4, r0
	adds r4, r4, r3
	ldr r1, [r4]
	str r1, [sp]
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	ldr r0, [sp, #4]
	adds r0, r0, r4
	cmp r0, r1
	blt _08059120
	adds r0, r5, #0
	movs r1, #0x19
	mov r2, sp
	bl SetMonData
	adds r0, r5, #0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, #4
	ldrh r0, [r0]
	subs r2, r2, r0
	subs r2, r4, r2
	ldr r4, _08059118
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xb
	bl BtlController_EmitTwoReturnValues
	strb r5, [r4]
	ldr r0, _0805911C
	str r0, [r6]
	b _0805913C
	.align 2, 0
_08059108: .4byte 0x03005AD0
_0805910C: .4byte 0x02024190
_08059110: .4byte 0x082F00B4
_08059114: .4byte 0x082F0D54
_08059118: .4byte 0x02023D08
_0805911C: .4byte 0x08059155
_08059120:
	str r0, [sp, #4]
	add r2, sp, #4
	adds r0, r5, #0
	movs r1, #0x19
	bl SetMonData
	ldr r1, _0805914C
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, _08059150
	str r1, [r0]
	mov r0, r8
	bl DestroyTask
_0805913C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805914C: .4byte 0x03005AC0
_08059150: .4byte 0x08058DB1
	thumb_func_end sub_08059010

	thumb_func_start Task_LaunchLvlUpAnim
Task_LaunchLvlUpAnim: @ 0x08059154
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080591A8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r4, [r0, #0xc]
	ldrb r6, [r0, #8]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08059188
	ldr r1, _080591AC
	movs r0, #2
	adds r2, r4, #0
	eors r2, r0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bne _08059188
	adds r4, r2, #0
_08059188:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0
	bl InitAndLaunchSpecialAnimation
	ldr r0, _080591A8
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080591B0
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080591A8: .4byte 0x03005B60
_080591AC: .4byte 0x02023D12
_080591B0: .4byte 0x080591B5
	thumb_func_end Task_LaunchLvlUpAnim

	thumb_func_start Task_UpdateLvlInHealthbox
Task_UpdateLvlInHealthbox: @ 0x080591B4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08059220
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrb r5, [r2, #0xc]
	ldr r0, _08059224
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08059256
	ldrb r4, [r2, #8]
	movs r0, #0x64
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _08059228
	adds r7, r1, r0
	adds r0, r7, #0
	movs r1, #0x38
	bl GetMonData
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08059234
	ldr r1, _0805922C
	movs r0, #2
	adds r2, r5, #0
	eors r2, r0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _08059234
	ldr r0, _08059230
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, r7, #0
	movs r2, #0
	bl UpdateHealthboxAttribute
	b _08059248
	.align 2, 0
_08059220: .4byte 0x03005B60
_08059224: .4byte 0x02024174
_08059228: .4byte 0x02024190
_0805922C: .4byte 0x02023D12
_08059230: .4byte 0x03005AD0
_08059234:
	ldr r0, _0805925C
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, #0x64
	muls r1, r4, r1
	ldr r2, _08059260
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
_08059248:
	ldr r0, _08059264
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08059268
	str r0, [r1]
_08059256:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805925C: .4byte 0x03005AD0
_08059260: .4byte 0x02024190
_08059264: .4byte 0x03005B60
_08059268: .4byte 0x0805926D
	thumb_func_end Task_UpdateLvlInHealthbox

	thumb_func_start MoveSelectionDisplayPpString
MoveSelectionDisplayPpString: @ 0x0805926C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080592A8
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r1, [r4, #8]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080592AC
	adds r0, r0, r1
	movs r1, #0x38
	bl GetMonData
	ldrb r0, [r4, #0xc]
	ldr r1, _080592B0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080592B4
	str r1, [r0]
	adds r0, r5, #0
	bl DestroyTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080592A8: .4byte 0x03005B60
_080592AC: .4byte 0x02024190
_080592B0: .4byte 0x03005AC0
_080592B4: .4byte 0x08058DB1
	thumb_func_end MoveSelectionDisplayPpString

	thumb_func_start sub_080592B8
sub_080592B8: @ 0x080592B8
	push {r4, r5, r6, lr}
	ldr r6, _0805933C
	ldr r5, _08059340
	ldr r4, _08059344
	ldrb r2, [r4]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r3, #0x22
	ldrsh r1, [r0, r3]
	movs r3, #0x26
	ldrsh r0, [r0, r3]
	adds r1, r1, r0
	cmp r1, #0xa0
	ble _08059334
	ldr r1, _08059348
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805934C
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0805DB50
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	ldr r1, _08059350
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerBufferExecCompleted
_08059334:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805933C: .4byte 0x020205AC
_08059340: .4byte 0x02023E88
_08059344: .4byte 0x02023D08
_08059348: .4byte 0x02023D12
_0805934C: .4byte 0x02024190
_08059350: .4byte 0x03005AD0
	thumb_func_end sub_080592B8

	thumb_func_start sub_08059354
sub_08059354: @ 0x08059354
	push {r4, r5, r6, lr}
	ldr r0, _080593B0
	ldr r0, [r0]
	ldr r6, _080593B4
	ldrb r2, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080593A8
	ldr r5, _080593B8
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080593BC
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r1, _080593C0
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerBufferExecCompleted
_080593A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080593B0: .4byte 0x02024174
_080593B4: .4byte 0x02023D08
_080593B8: .4byte 0x02023E88
_080593BC: .4byte 0x020205AC
_080593C0: .4byte 0x03005AD0
	thumb_func_end sub_08059354

	thumb_func_start PlayerHandleDataTransfer
PlayerHandleDataTransfer: @ 0x080593C4
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080593D6
	bl PlayerBufferExecCompleted
_080593D6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerHandleDataTransfer

	thumb_func_start OpenPartyMenuToChooseMon
OpenPartyMenuToChooseMon: @ 0x080593DC
	push {r4, lr}
	ldr r0, _08059420
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0805941A
	ldr r1, _08059424
	ldr r2, _08059428
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805942C
	str r1, [r0]
	ldr r3, _08059430
	ldr r1, _08059434
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrb r4, [r1, #8]
	bl DestroyTask
	bl FreeAllWindowBuffers
	adds r0, r4, #0
	bl OpenPartyMenuInBattle
_0805941A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059420: .4byte 0x02037C74
_08059424: .4byte 0x03005AC0
_08059428: .4byte 0x02023D08
_0805942C: .4byte 0x08059439
_08059430: .4byte 0x03005B60
_08059434: .4byte 0x03005ADC
	thumb_func_end OpenPartyMenuToChooseMon

	thumb_func_start WaitForMonSelection
WaitForMonSelection: @ 0x08059438
	push {lr}
	ldr r0, _08059468
	ldr r1, [r0, #4]
	ldr r0, _0805946C
	cmp r1, r0
	bne _080594A8
	ldr r0, _08059470
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080594A8
	ldr r0, _08059474
	ldrb r0, [r0]
	cmp r0, #1
	bne _08059480
	ldr r0, _08059478
	ldrb r1, [r0]
	ldr r2, _0805947C
	movs r0, #1
	bl BtlController_EmitChosenMonReturnValue
	b _0805948A
	.align 2, 0
_08059468: .4byte 0x03002360
_0805946C: .4byte 0x080380FD
_08059470: .4byte 0x02037C74
_08059474: .4byte 0x0203CBB4
_08059478: .4byte 0x0203CBB5
_0805947C: .4byte 0x0203CBCC
_08059480:
	movs r0, #1
	movs r1, #6
	movs r2, #0
	bl BtlController_EmitChosenMonReturnValue
_0805948A:
	ldr r1, _080594AC
	ldr r0, _080594B0
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _080594A4
	bl PrintLinkStandbyMsg
_080594A4:
	bl PlayerBufferExecCompleted
_080594A8:
	pop {r0}
	bx r0
	.align 2, 0
_080594AC: .4byte 0x02022D08
_080594B0: .4byte 0x02023D08
	thumb_func_end WaitForMonSelection

	thumb_func_start OpenBagAndChooseItem
OpenBagAndChooseItem: @ 0x080594B4
	push {lr}
	ldr r0, _080594E0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080594DC
	ldr r1, _080594E4
	ldr r0, _080594E8
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080594EC
	str r1, [r0]
	bl nullsub_35
	bl FreeAllWindowBuffers
	bl sub_081AA928
_080594DC:
	pop {r0}
	bx r0
	.align 2, 0
_080594E0: .4byte 0x02037C74
_080594E4: .4byte 0x03005AC0
_080594E8: .4byte 0x02023D08
_080594EC: .4byte 0x080594F1
	thumb_func_end OpenBagAndChooseItem

	thumb_func_start CompleteWhenChoseItem
CompleteWhenChoseItem: @ 0x080594F0
	push {lr}
	ldr r0, _0805951C
	ldr r1, [r0, #4]
	ldr r0, _08059520
	cmp r1, r0
	bne _08059516
	ldr r0, _08059524
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08059516
	ldr r0, _08059528
	ldrh r1, [r0]
	movs r0, #1
	bl BtlController_EmitOneReturnValue
	bl PlayerBufferExecCompleted
_08059516:
	pop {r0}
	bx r0
	.align 2, 0
_0805951C: .4byte 0x03002360
_08059520: .4byte 0x080380FD
_08059524: .4byte 0x02037C74
_08059528: .4byte 0x0203CB48
	thumb_func_end CompleteWhenChoseItem

	thumb_func_start PlayerHandleOneReturnValue_Duplicate
PlayerHandleOneReturnValue_Duplicate: @ 0x0805952C
	push {lr}
	ldr r0, _0805955C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059552
	ldr r0, _08059560
	ldr r2, [r0]
	ldr r0, _08059564
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08059556
_08059552:
	bl PlayerBufferExecCompleted
_08059556:
	pop {r0}
	bx r0
	.align 2, 0
_0805955C: .4byte 0x0202415D
_08059560: .4byte 0x02024174
_08059564: .4byte 0x02023D08
	thumb_func_end PlayerHandleOneReturnValue_Duplicate

	thumb_func_start PlayerHandleHitAnimation
PlayerHandleHitAnimation: @ 0x08059568
	push {r4, lr}
	ldr r1, _080595A4
	ldr r0, _080595A8
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _080595AC
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _080595B4
	movs r3, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080595B0
	strb r3, [r0]
	bl PlayerBufferExecCompleted
	b _080595DE
	.align 2, 0
_080595A4: .4byte 0x02023E88
_080595A8: .4byte 0x02023D08
_080595AC: .4byte 0x020205AC
_080595B0: .4byte 0x0202415D
_080595B4:
	ldrh r0, [r4, #0x30]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080595D8
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
_080595D8:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_080595DE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerHandleHitAnimation

	thumb_func_start PlayerHandleUnknownYesNoInput
PlayerHandleUnknownYesNoInput: @ 0x080595E4
	push {r4, lr}
	sub sp, #4
	ldr r0, _08059674
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059612
	ldr r4, _08059678
	ldrb r0, [r4]
	cmp r0, #0
	beq _08059612
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	bl BattleDestroyYesNoCursorAt
	movs r0, #0
	strb r0, [r4]
	movs r0, #0
	bl BattleCreateYesNoCursorAt
_08059612:
	ldr r0, _08059674
	ldrh r1, [r0, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805963C
	ldr r4, _08059678
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805963C
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4]
	bl BattleDestroyYesNoCursorAt
	movs r0, #1
	strb r0, [r4]
	movs r0, #1
	bl BattleCreateYesNoCursorAt
_0805963C:
	ldr r0, _08059674
	ldrh r1, [r0, #0x2e]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0805968A
	str r2, [sp]
	movs r0, #0x18
	movs r1, #8
	movs r2, #0x1d
	movs r3, #0xd
	bl HandleBattleWindow
	movs r0, #5
	bl PlaySE
	ldr r0, _08059678
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805967C
	movs r0, #1
	movs r1, #0xe
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	b _08059686
	.align 2, 0
_08059674: .4byte 0x03002360
_08059678: .4byte 0x03005AD4
_0805967C:
	movs r0, #1
	movs r1, #0xd
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
_08059686:
	bl PlayerBufferExecCompleted
_0805968A:
	ldr r0, _080596B8
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080596B0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x18
	movs r1, #8
	movs r2, #0x1d
	movs r3, #0xd
	bl HandleBattleWindow
	movs r0, #5
	bl PlaySE
	bl PlayerBufferExecCompleted
_080596B0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080596B8: .4byte 0x03002360
	thumb_func_end PlayerHandleUnknownYesNoInput

	thumb_func_start MoveSelectionDisplayMoveNames
MoveSelectionDisplayMoveNames: @ 0x080596BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08059720
	ldrb r1, [r0]
	lsls r1, r1, #9
	ldr r3, _08059724
	ldr r2, _08059728
	movs r0, #0
	strb r0, [r2]
	movs r5, #0
	ldr r0, _0805972C
	mov r8, r0
	adds r4, r1, r3
	adds r7, r2, #0
	movs r6, #0xc0
	lsls r6, r6, #0x12
_080596DE:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl MoveSelectionDestroyCursorAt
	ldrh r1, [r4]
	lsls r1, r1, #3
	ldr r0, _08059730
	adds r1, r1, r0
	mov r0, r8
	bl StringCopy
	lsrs r1, r6, #0x18
	mov r0, r8
	bl sub_0814FA04
	ldrh r0, [r4]
	cmp r0, #0
	beq _08059708
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
_08059708:
	adds r4, #2
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r6, r6, r0
	adds r5, #1
	cmp r5, #3
	ble _080596DE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059720: .4byte 0x02023D08
_08059724: .4byte 0x02022D0C
_08059728: .4byte 0x03005AD8
_0805972C: .4byte 0x02022AE0
_08059730: .4byte 0x082EACC4
	thumb_func_end MoveSelectionDisplayMoveNames

	thumb_func_start PlayerHandleTwoReturnValues
PlayerHandleTwoReturnValues: @ 0x08059734
	push {r4, lr}
	ldr r4, _08059760
	ldr r1, _08059764
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	movs r1, #7
	bl sub_0814FA04
	ldr r1, _08059768
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	movs r1, #8
	bl sub_0814FA04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059760: .4byte 0x02022AE0
_08059764: .4byte 0x085ABB9B
_08059768: .4byte 0x085ABBA1
	thumb_func_end PlayerHandleTwoReturnValues

	thumb_func_start MoveSelectionDisplayPpNumber
MoveSelectionDisplayPpNumber: @ 0x0805976C
	push {r4, r5, r6, r7, lr}
	ldr r5, _080597D0
	ldr r7, _080597D4
	ldrb r0, [r7]
	lsls r0, r0, #9
	adds r1, r5, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080597C8
	bl SetPpNumbersPaletteInMoveSelection
	ldrb r1, [r7]
	lsls r4, r1, #9
	adds r0, r5, #4
	adds r4, r4, r0
	ldr r6, _080597D8
	ldr r5, _080597DC
	adds r1, r1, r5
	adds r0, r4, #0
	adds r0, #8
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r6, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r1, #0xba
	strb r1, [r0]
	adds r0, #1
	ldrb r1, [r7]
	adds r1, r1, r5
	adds r4, #0xc
	ldrb r1, [r1]
	adds r4, r4, r1
	ldrb r1, [r4]
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	adds r0, r6, #0
	movs r1, #9
	bl sub_0814FA04
_080597C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080597D0: .4byte 0x02022D08
_080597D4: .4byte 0x02023D08
_080597D8: .4byte 0x02022AE0
_080597DC: .4byte 0x02024154
	thumb_func_end MoveSelectionDisplayPpNumber

	thumb_func_start ActionSelectionCreateCursorAt
ActionSelectionCreateCursorAt: @ 0x080597E0
	push {r4, lr}
	ldr r0, _08059824
	ldrb r1, [r0]
	lsls r2, r1, #9
	ldr r0, _08059828
	adds r2, r2, r0
	ldr r4, _0805982C
	ldr r3, _08059830
	ldr r0, _08059834
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r2, r2, r0
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldr r0, _08059838
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_0814FA04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059824: .4byte 0x02023D08
_08059828: .4byte 0x02022D0C
_0805982C: .4byte 0x02022AE0
_08059830: .4byte 0x082ED220
_08059834: .4byte 0x02024154
_08059838: .4byte 0x082EBC88
	thumb_func_end ActionSelectionCreateCursorAt

	thumb_func_start MoveSelectionCreateCursorAt
MoveSelectionCreateCursorAt: @ 0x0805983C
	push {lr}
	sub sp, #0x10
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	add r2, sp, #0xc
	adds r0, r1, #1
	strh r0, [r2]
	adds r0, r2, #0
	adds r1, #2
	strh r1, [r0, #2]
	movs r1, #1
	adds r2, r3, #0
	ands r2, r1
	lsls r2, r2, #3
	adds r2, #1
	movs r0, #2
	ands r3, r0
	adds r3, #0x37
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	add r1, sp, #0xc
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MoveSelectionCreateCursorAt

	thumb_func_start MoveSelectionDestroyCursorAt
MoveSelectionDestroyCursorAt: @ 0x08059884
	push {lr}
	sub sp, #0x10
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	add r0, sp, #0xc
	ldr r1, _080598C4
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r1, #1
	adds r2, r3, #0
	ands r2, r1
	lsls r2, r2, #3
	adds r2, #1
	movs r0, #2
	ands r3, r0
	adds r3, #0x37
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	add r1, sp, #0xc
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080598C4: .4byte 0x00001016
	thumb_func_end MoveSelectionDestroyCursorAt

	thumb_func_start SetCB2ToReshowScreenAfterMenu
SetCB2ToReshowScreenAfterMenu: @ 0x080598C8
	push {r4, lr}
	sub sp, #0x10
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	add r0, sp, #0xc
	movs r4, #1
	strh r4, [r0]
	movs r1, #2
	strh r1, [r0, #2]
	adds r0, r3, #0
	ands r0, r4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #0x19
	movs r0, #0x90
	lsls r0, r0, #0x15
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	ands r3, r1
	adds r3, #0x23
	str r4, [sp]
	str r1, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	add r1, sp, #0xc
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SetCB2ToReshowScreenAfterMenu

	thumb_func_start ActionSelectionDestroyCursorAt
ActionSelectionDestroyCursorAt: @ 0x08059910
	push {lr}
	sub sp, #0x10
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	add r0, sp, #0xc
	ldr r1, _08059958
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r1, #1
	adds r0, r3, #0
	ands r0, r1
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #0x19
	movs r0, #0x90
	lsls r0, r0, #0x15
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	movs r0, #2
	ands r3, r0
	adds r3, #0x23
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	add r1, sp, #0xc
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08059958: .4byte 0x00001016
	thumb_func_end ActionSelectionDestroyCursorAt

	thumb_func_start SetCB2ToReshowScreenAfterMenu2
SetCB2ToReshowScreenAfterMenu2: @ 0x0805995C
	push {lr}
	ldr r0, _08059968
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08059968: .4byte 0x080A8BC1
	thumb_func_end SetCB2ToReshowScreenAfterMenu2

	thumb_func_start sub_0805996C
sub_0805996C: @ 0x0805996C
	push {lr}
	ldr r0, _08059978
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08059978: .4byte 0x080A8BC1
	thumb_func_end sub_0805996C

	thumb_func_start sub_0805997C
sub_0805997C: @ 0x0805997C
	push {lr}
	ldr r0, _080599A4
	ldr r2, [r0]
	ldr r0, _080599A8
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0805999E
	bl PlayerBufferExecCompleted
_0805999E:
	pop {r0}
	bx r0
	.align 2, 0
_080599A4: .4byte 0x02024174
_080599A8: .4byte 0x02023D08
	thumb_func_end sub_0805997C

	thumb_func_start sub_080599AC
sub_080599AC: @ 0x080599AC
	push {lr}
	ldr r0, _080599D4
	ldr r2, [r0]
	ldr r0, _080599D8
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080599CE
	bl PlayerBufferExecCompleted
_080599CE:
	pop {r0}
	bx r0
	.align 2, 0
_080599D4: .4byte 0x02024174
_080599D8: .4byte 0x02023D08
	thumb_func_end sub_080599AC

	thumb_func_start PrintLinkStandbyMsg
PrintLinkStandbyMsg: @ 0x080599DC
	push {lr}
	ldr r0, _08059A00
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080599FC
	ldr r0, _08059A04
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08059A08
	strh r1, [r0]
	ldr r0, _08059A0C
	movs r1, #0
	bl sub_0814FA04
_080599FC:
	pop {r0}
	bx r0
	.align 2, 0
_08059A00: .4byte 0x02022C90
_08059A04: .4byte 0x02022AC8
_08059A08: .4byte 0x02022ACA
_08059A0C: .4byte 0x085ABB62
	thumb_func_end PrintLinkStandbyMsg

	thumb_func_start PlayerHandleGetMonData
PlayerHandleGetMonData: @ 0x08059A10
	push {r4, r5, r6, lr}
	sub sp, #0x100
	movs r6, #0
	ldr r1, _08059A3C
	ldr r0, _08059A40
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08059A48
	ldr r0, _08059A44
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl CopyPlayerMonData
	adds r6, r0, #0
	b _08059A6A
	.align 2, 0
_08059A3C: .4byte 0x02022D08
_08059A40: .4byte 0x02023D08
_08059A44: .4byte 0x02023D12
_08059A48:
	ldrb r4, [r1]
	movs r5, #0
_08059A4C:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08059A62
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	adds r1, r2, r6
	bl CopyPlayerMonData
	adds r6, r6, r0
_08059A62:
	lsrs r4, r4, #1
	adds r5, #1
	cmp r5, #5
	ble _08059A4C
_08059A6A:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl PlayerBufferExecCompleted
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerHandleGetMonData

	thumb_func_start CopyPlayerMonData
CopyPlayerMonData: @ 0x08059A84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	ldr r2, _08059AB8
	ldr r3, _08059ABC
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _08059AAE
	bl _0805A21A
_08059AAE:
	lsls r0, r0, #2
	ldr r1, _08059AC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08059AB8: .4byte 0x02022D08
_08059ABC: .4byte 0x02023D08
_08059AC0: .4byte 0x08059AC4
_08059AC4: @ jump table
	.4byte _08059BB4 @ case 0
	.4byte _08059DD8 @ case 1
	.4byte _08059DE8 @ case 2
	.4byte _08059DF8 @ case 3
	.4byte _08059E60 @ case 4
	.4byte _08059E60 @ case 5
	.4byte _08059E60 @ case 6
	.4byte _08059E60 @ case 7
	.4byte _08059E7C @ case 8
	.4byte _08059EB8 @ case 9
	.4byte _08059EB8 @ case 10
	.4byte _08059EB8 @ case 11
	.4byte _08059EB8 @ case 12
	.4byte _0805A21A @ case 13
	.4byte _0805A21A @ case 14
	.4byte _0805A21A @ case 15
	.4byte _0805A21A @ case 16
	.4byte _08059ED4 @ case 17
	.4byte _08059EE4 @ case 18
	.4byte _08059F14 @ case 19
	.4byte _08059F24 @ case 20
	.4byte _08059F34 @ case 21
	.4byte _08059F44 @ case 22
	.4byte _08059F54 @ case 23
	.4byte _08059F64 @ case 24
	.4byte _08059F74 @ case 25
	.4byte _08059F84 @ case 26
	.4byte _08059F94 @ case 27
	.4byte _08059FA4 @ case 28
	.4byte _08059FB4 @ case 29
	.4byte _08059FC4 @ case 30
	.4byte _08059FD4 @ case 31
	.4byte _0805A024 @ case 32
	.4byte _0805A034 @ case 33
	.4byte _0805A044 @ case 34
	.4byte _0805A054 @ case 35
	.4byte _0805A064 @ case 36
	.4byte _0805A074 @ case 37
	.4byte _0805A084 @ case 38
	.4byte _0805A094 @ case 39
	.4byte _0805A0A4 @ case 40
	.4byte _0805A0D8 @ case 41
	.4byte _0805A0E8 @ case 42
	.4byte _0805A0F8 @ case 43
	.4byte _0805A108 @ case 44
	.4byte _0805A118 @ case 45
	.4byte _0805A128 @ case 46
	.4byte _0805A138 @ case 47
	.4byte _0805A148 @ case 48
	.4byte _0805A168 @ case 49
	.4byte _0805A178 @ case 50
	.4byte _0805A188 @ case 51
	.4byte _0805A198 @ case 52
	.4byte _0805A1A8 @ case 53
	.4byte _0805A1B8 @ case 54
	.4byte _0805A1C8 @ case 55
	.4byte _0805A1D8 @ case 56
	.4byte _0805A1E8 @ case 57
	.4byte _0805A1F8 @ case 58
	.4byte _0805A208 @ case 59
_08059BB4:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08059DC8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x2e]
	movs r6, #0
	add r0, sp, #0x24
	mov sb, r0
	movs r1, #0x3b
	add r1, sp
	mov sl, r1
	mov r2, sp
	adds r2, #0x2b
	str r2, [sp, #0x80]
	mov r0, sp
	adds r0, #0x2a
	str r0, [sp, #0x7c]
	mov r1, sp
	adds r1, #0x68
	str r1, [sp, #0x8c]
	adds r2, #5
	str r2, [sp, #0x84]
	adds r0, #0x12
	str r0, [sp, #0x88]
	mov r8, r4
	add r4, sp, #0xc
_08059C00:
	adds r1, r6, #0
	adds r1, #0xd
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x11
	mov r0, r8
	bl GetMonData
	mov r2, sb
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _08059C00
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08059DC8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x15
	bl GetMonData
	mov r1, sl
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	ldr r2, [sp, #0x80]
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0x19
	bl GetMonData
	str r0, [sp, #0x44]
	adds r0, r4, #0
	movs r1, #0x27
	bl GetMonData
	mov r3, sp
	movs r5, #0x1f
	ands r0, r5
	ldrb r2, [r3, #0x14]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x14]
	adds r0, r4, #0
	movs r1, #0x28
	bl GetMonData
	mov r3, sp
	movs r6, #0x1f
	ands r0, r6
	lsls r0, r0, #5
	ldrh r2, [r3, #0x14]
	ldr r1, _08059DCC
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #0x14]
	adds r0, r4, #0
	movs r1, #0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r3, #0x15]
	movs r1, #0x7d
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x15]
	adds r0, r4, #0
	movs r1, #0x2a
	bl GetMonData
	movs r1, #0x1f
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [sp, #0x14]
	ldr r2, _08059DD0
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0x14]
	adds r0, r4, #0
	movs r1, #0x2b
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, r0, #4
	ldrh r2, [r3, #0x16]
	ldr r1, _08059DD4
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #0x16]
	adds r0, r4, #0
	movs r1, #0x2c
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, r0, #1
	ldrb r2, [r3, #0x17]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [sp, #0x48]
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	str r0, [sp, #0x4c]
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	ldr r1, [sp, #0x7c]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x28]
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x2c]
	adds r0, r4, #0
	movs r1, #0x3b
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #2]
	adds r0, r4, #0
	movs r1, #0x3c
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #4]
	adds r0, r4, #0
	movs r1, #0x3d
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #6]
	adds r0, r4, #0
	movs r1, #0x3e
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #8]
	adds r0, r4, #0
	movs r1, #0x3f
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0xa]
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	mov r3, sp
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #6
	ldrb r2, [r3, #0x17]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #0x2e
	bl GetMonData
	mov r3, sp
	lsls r0, r0, #7
	ldrb r2, [r3, #0x17]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	str r0, [sp, #0x54]
	adds r0, r4, #0
	movs r1, #2
	ldr r2, [sp, #0x8c]
	bl GetMonData
	ldr r0, [sp, #0x84]
	ldr r1, [sp, #0x8c]
	bl StringCopy10
	adds r0, r4, #0
	movs r1, #7
	ldr r2, [sp, #0x88]
	bl GetMonData
	mov r2, sp
	movs r6, #0
_08059DB8:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x57
	bls _08059DB8
	b _0805A21A
	.align 2, 0
_08059DC8: .4byte 0x02024190
_08059DCC: .4byte 0xFFFFFC1F
_08059DD0: .4byte 0xFFF07FFF
_08059DD4: .4byte 0xFFFFFE0F
_08059DD8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059DE4
	adds r0, r0, r1
	movs r1, #0xb
	b _0805A152
	.align 2, 0
_08059DE4: .4byte 0x02024190
_08059DE8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059DF4
	adds r0, r0, r1
	movs r1, #0xc
	b _0805A152
	.align 2, 0
_08059DF4: .4byte 0x02024190
_08059DF8:
	movs r6, #0
	add r2, sp, #0x58
	mov sb, r2
	add r0, sp, #0x60
	mov sl, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08059E5C
	adds r4, r1, r0
	mov r8, sb
_08059E0E:
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r4, #0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, #0
	adds r1, #0x11
	adds r0, r4, #0
	bl GetMonData
	mov r2, sl
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, #2
	add r8, r0
	adds r6, #1
	cmp r6, #3
	ble _08059E0E
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059E5C
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	mov r1, sb
	strb r0, [r1, #0xc]
	mov r2, sb
	movs r6, #0
_08059E4C:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0xf
	bls _08059E4C
	b _0805A21A
	.align 2, 0
_08059E5C: .4byte 0x02024190
_08059E60:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059E78
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #9
	b _0805A152
	.align 2, 0
_08059E78: .4byte 0x02024190
_08059E7C:
	movs r6, #0
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r2, _08059EB4
	mov r8, r2
_08059E88:
	adds r1, r6, #0
	adds r1, #0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	cmp r6, #3
	ble _08059E88
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059EB4
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	b _0805A21A
	.align 2, 0
_08059EB4: .4byte 0x02024190
_08059EB8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059ED0
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #8
	b _0805A212
	.align 2, 0
_08059ED0: .4byte 0x02024190
_08059ED4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059EE0
	adds r0, r0, r1
	movs r1, #1
	b _08059EEE
	.align 2, 0
_08059EE0: .4byte 0x02024190
_08059EE4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059F10
	adds r0, r0, r1
	movs r1, #0x19
_08059EEE:
	bl GetMonData
	adds r1, r0, #0
	strb r1, [r7]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	strb r0, [r7, #2]
	movs r6, #3
	b _0805A21A
	.align 2, 0
_08059F10: .4byte 0x02024190
_08059F14:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059F20
	adds r0, r0, r1
	movs r1, #0x1a
	b _0805A212
	.align 2, 0
_08059F20: .4byte 0x02024190
_08059F24:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059F30
	adds r0, r0, r1
	movs r1, #0x1b
	b _0805A212
	.align 2, 0
_08059F30: .4byte 0x02024190
_08059F34:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059F40
	adds r0, r0, r1
	movs r1, #0x1c
	b _0805A212
	.align 2, 0
_08059F40: .4byte 0x02024190
_08059F44:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059F50
	adds r0, r0, r1
	movs r1, #0x1d
	b _0805A212
	.align 2, 0
_08059F50: .4byte 0x02024190
_08059F54:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059F60
	adds r0, r0, r1
	movs r1, #0x1e
	b _0805A212
	.align 2, 0
_08059F60: .4byte 0x02024190
_08059F64:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059F70
	adds r0, r0, r1
	movs r1, #0x1f
	b _0805A212
	.align 2, 0
_08059F70: .4byte 0x02024190
_08059F74:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059F80
	adds r0, r0, r1
	movs r1, #0x20
	b _0805A212
	.align 2, 0
_08059F80: .4byte 0x02024190
_08059F84:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059F90
	adds r0, r0, r1
	movs r1, #0x22
	b _0805A212
	.align 2, 0
_08059F90: .4byte 0x02024190
_08059F94:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059FA0
	adds r0, r0, r1
	movs r1, #0x23
	b _0805A212
	.align 2, 0
_08059FA0: .4byte 0x02024190
_08059FA4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059FB0
	adds r0, r0, r1
	movs r1, #0x24
	b _0805A212
	.align 2, 0
_08059FB0: .4byte 0x02024190
_08059FB4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059FC0
	adds r0, r0, r1
	movs r1, #0x25
	b _0805A212
	.align 2, 0
_08059FC0: .4byte 0x02024190
_08059FC4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08059FD0
	adds r0, r0, r1
	movs r1, #0x26
	b _0805A212
	.align 2, 0
_08059FD0: .4byte 0x02024190
_08059FD4:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0805A020
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, #0
	movs r1, #0x28
	bl GetMonData
	strb r0, [r7, #1]
	adds r0, r4, #0
	movs r1, #0x29
	bl GetMonData
	strb r0, [r7, #2]
	adds r0, r4, #0
	movs r1, #0x2a
	bl GetMonData
	strb r0, [r7, #3]
	adds r0, r4, #0
	movs r1, #0x2b
	bl GetMonData
	strb r0, [r7, #4]
	adds r0, r4, #0
	movs r1, #0x2c
	bl GetMonData
	strb r0, [r7, #5]
	movs r6, #6
	b _0805A21A
	.align 2, 0
_0805A020: .4byte 0x02024190
_0805A024:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A030
	adds r0, r0, r1
	movs r1, #0x27
	b _0805A212
	.align 2, 0
_0805A030: .4byte 0x02024190
_0805A034:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A040
	adds r0, r0, r1
	movs r1, #0x28
	b _0805A212
	.align 2, 0
_0805A040: .4byte 0x02024190
_0805A044:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A050
	adds r0, r0, r1
	movs r1, #0x29
	b _0805A212
	.align 2, 0
_0805A050: .4byte 0x02024190
_0805A054:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A060
	adds r0, r0, r1
	movs r1, #0x2a
	b _0805A212
	.align 2, 0
_0805A060: .4byte 0x02024190
_0805A064:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A070
	adds r0, r0, r1
	movs r1, #0x2b
	b _0805A212
	.align 2, 0
_0805A070: .4byte 0x02024190
_0805A074:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A080
	adds r0, r0, r1
	movs r1, #0x2c
	b _0805A212
	.align 2, 0
_0805A080: .4byte 0x02024190
_0805A084:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A090
	adds r0, r0, r1
	movs r1, #0
	b _0805A0AE
	.align 2, 0
_0805A090: .4byte 0x02024190
_0805A094:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A0A0
	adds r0, r0, r1
	movs r1, #9
	b _0805A152
	.align 2, 0
_0805A0A0: .4byte 0x02024190
_0805A0A4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A0D4
	adds r0, r0, r1
	movs r1, #0x37
_0805A0AE:
	bl GetMonData
	adds r1, r0, #0
	strb r1, [r7]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	strb r0, [r7, #2]
	lsrs r0, r1, #0x18
	strb r0, [r7, #3]
	movs r6, #4
	b _0805A21A
	.align 2, 0
_0805A0D4: .4byte 0x02024190
_0805A0D8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A0E4
	adds r0, r0, r1
	movs r1, #0x38
	b _0805A212
	.align 2, 0
_0805A0E4: .4byte 0x02024190
_0805A0E8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A0F4
	adds r0, r0, r1
	movs r1, #0x39
	b _0805A152
	.align 2, 0
_0805A0F4: .4byte 0x02024190
_0805A0F8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A104
	adds r0, r0, r1
	movs r1, #0x3a
	b _0805A152
	.align 2, 0
_0805A104: .4byte 0x02024190
_0805A108:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A114
	adds r0, r0, r1
	movs r1, #0x3b
	b _0805A152
	.align 2, 0
_0805A114: .4byte 0x02024190
_0805A118:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A124
	adds r0, r0, r1
	movs r1, #0x3c
	b _0805A152
	.align 2, 0
_0805A124: .4byte 0x02024190
_0805A128:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A134
	adds r0, r0, r1
	movs r1, #0x3d
	b _0805A152
	.align 2, 0
_0805A134: .4byte 0x02024190
_0805A138:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A144
	adds r0, r0, r1
	movs r1, #0x3e
	b _0805A152
	.align 2, 0
_0805A144: .4byte 0x02024190
_0805A148:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A164
	adds r0, r0, r1
	movs r1, #0x3f
_0805A152:
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strb r0, [r7]
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r6, #2
	b _0805A21A
	.align 2, 0
_0805A164: .4byte 0x02024190
_0805A168:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A174
	adds r0, r0, r1
	movs r1, #0x16
	b _0805A212
	.align 2, 0
_0805A174: .4byte 0x02024190
_0805A178:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A184
	adds r0, r0, r1
	movs r1, #0x17
	b _0805A212
	.align 2, 0
_0805A184: .4byte 0x02024190
_0805A188:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A194
	adds r0, r0, r1
	movs r1, #0x18
	b _0805A212
	.align 2, 0
_0805A194: .4byte 0x02024190
_0805A198:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A1A4
	adds r0, r0, r1
	movs r1, #0x21
	b _0805A212
	.align 2, 0
_0805A1A4: .4byte 0x02024190
_0805A1A8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A1B4
	adds r0, r0, r1
	movs r1, #0x2f
	b _0805A212
	.align 2, 0
_0805A1B4: .4byte 0x02024190
_0805A1B8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A1C4
	adds r0, r0, r1
	movs r1, #0x30
	b _0805A212
	.align 2, 0
_0805A1C4: .4byte 0x02024190
_0805A1C8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A1D4
	adds r0, r0, r1
	movs r1, #0x32
	b _0805A212
	.align 2, 0
_0805A1D4: .4byte 0x02024190
_0805A1D8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A1E4
	adds r0, r0, r1
	movs r1, #0x33
	b _0805A212
	.align 2, 0
_0805A1E4: .4byte 0x02024190
_0805A1E8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A1F4
	adds r0, r0, r1
	movs r1, #0x34
	b _0805A212
	.align 2, 0
_0805A1F4: .4byte 0x02024190
_0805A1F8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A204
	adds r0, r0, r1
	movs r1, #0x35
	b _0805A212
	.align 2, 0
_0805A204: .4byte 0x02024190
_0805A208:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A22C
	adds r0, r0, r1
	movs r1, #0x36
_0805A212:
	bl GetMonData
	strb r0, [r7]
	movs r6, #1
_0805A21A:
	adds r0, r6, #0
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805A22C: .4byte 0x02024190
	thumb_func_end CopyPlayerMonData

	thumb_func_start PlayerHandleGetRawMonData
PlayerHandleGetRawMonData: @ 0x0805A230
	push {r4, r5, r6, r7, lr}
	sub sp, #0x58
	ldr r2, _0805A2A8
	ldr r5, _0805A2AC
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	adds r4, r2, #0
	muls r4, r0, r4
	ldr r3, _0805A2B0
	lsls r1, r1, #9
	adds r0, r3, #1
	adds r0, r1, r0
	ldrb r2, [r0]
	ldr r0, _0805A2B4
	adds r0, r2, r0
	adds r6, r4, r0
	mov r0, sp
	adds r4, r0, r2
	movs r2, #0
	adds r0, r3, #2
	adds r1, r1, r0
	adds r7, r5, #0
	mov ip, r3
	ldrb r1, [r1]
	cmp r2, r1
	bhs _0805A286
	adds r3, r0, #0
_0805A26C:
	adds r1, r4, r2
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrb r0, [r5]
	lsls r0, r0, #9
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r2, r0
	blo _0805A26C
_0805A286:
	ldrb r0, [r7]
	lsls r0, r0, #9
	mov r1, ip
	adds r1, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	adds r2, r4, #0
	bl BtlController_EmitDataTransfer
	bl PlayerBufferExecCompleted
	add sp, #0x58
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A2A8: .4byte 0x02023D12
_0805A2AC: .4byte 0x02023D08
_0805A2B0: .4byte 0x02022D08
_0805A2B4: .4byte 0x02024190
	thumb_func_end PlayerHandleGetRawMonData

	thumb_func_start PlayerHandleSetMonData
PlayerHandleSetMonData: @ 0x0805A2B8
	push {r4, r5, lr}
	ldr r1, _0805A2DC
	ldr r0, _0805A2E0
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805A2E8
	ldr r0, _0805A2E4
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl SetPlayerMonData
	b _0805A306
	.align 2, 0
_0805A2DC: .4byte 0x02022D08
_0805A2E0: .4byte 0x02023D08
_0805A2E4: .4byte 0x02023D12
_0805A2E8:
	ldrb r4, [r1]
	movs r5, #0
_0805A2EC:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0805A2FA
	adds r0, r5, #0
	bl SetPlayerMonData
_0805A2FA:
	lsrs r4, r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _0805A2EC
_0805A306:
	bl PlayerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end PlayerHandleSetMonData

	thumb_func_start SetPlayerMonData
SetPlayerMonData: @ 0x0805A310
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0805A348
	ldrb r0, [r0]
	lsls r0, r0, #9
	ldr r2, _0805A34C
	adds r3, r0, r2
	adds r6, r3, #0
	subs r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r2, #0
	cmp r0, #0x3b
	bls _0805A33C
	bl _0805ACD6
_0805A33C:
	lsls r0, r0, #2
	ldr r1, _0805A350
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A348: .4byte 0x02023D08
_0805A34C: .4byte 0x02022D0B
_0805A350: .4byte 0x0805A354
_0805A354: @ jump table
	.4byte _0805A444 @ case 0
	.4byte _0805A5DC @ case 1
	.4byte _0805A5FC @ case 2
	.4byte _0805A61C @ case 3
	.4byte _0805A674 @ case 4
	.4byte _0805A674 @ case 5
	.4byte _0805A674 @ case 6
	.4byte _0805A674 @ case 7
	.4byte _0805A69C @ case 8
	.4byte _0805A700 @ case 9
	.4byte _0805A700 @ case 10
	.4byte _0805A700 @ case 11
	.4byte _0805A700 @ case 12
	.4byte _0805ACD6 @ case 13
	.4byte _0805ACD6 @ case 14
	.4byte _0805ACD6 @ case 15
	.4byte _0805ACD6 @ case 16
	.4byte _0805A730 @ case 17
	.4byte _0805A750 @ case 18
	.4byte _0805A770 @ case 19
	.4byte _0805A790 @ case 20
	.4byte _0805A7B0 @ case 21
	.4byte _0805A7D0 @ case 22
	.4byte _0805A7F0 @ case 23
	.4byte _0805A810 @ case 24
	.4byte _0805A830 @ case 25
	.4byte _0805A850 @ case 26
	.4byte _0805A870 @ case 27
	.4byte _0805A890 @ case 28
	.4byte _0805A8B0 @ case 29
	.4byte _0805A8D0 @ case 30
	.4byte _0805A8F0 @ case 31
	.4byte _0805A960 @ case 32
	.4byte _0805A980 @ case 33
	.4byte _0805A9A0 @ case 34
	.4byte _0805A9C0 @ case 35
	.4byte _0805A9E0 @ case 36
	.4byte _0805AA00 @ case 37
	.4byte _0805AA20 @ case 38
	.4byte _0805AA40 @ case 39
	.4byte _0805AA60 @ case 40
	.4byte _0805AA80 @ case 41
	.4byte _0805AAA0 @ case 42
	.4byte _0805AAC0 @ case 43
	.4byte _0805AAE0 @ case 44
	.4byte _0805AB00 @ case 45
	.4byte _0805AB20 @ case 46
	.4byte _0805AB40 @ case 47
	.4byte _0805AB60 @ case 48
	.4byte _0805AB80 @ case 49
	.4byte _0805ABA0 @ case 50
	.4byte _0805ABC0 @ case 51
	.4byte _0805ABE0 @ case 52
	.4byte _0805AC00 @ case 53
	.4byte _0805AC20 @ case 54
	.4byte _0805AC40 @ case 55
	.4byte _0805AC60 @ case 56
	.4byte _0805AC80 @ case 57
	.4byte _0805ACA0 @ case 58
	.4byte _0805ACC0 @ case 59
_0805A444:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0805A5D8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r6, #0
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0x2e
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	movs r0, #0
	mov r8, r0
	movs r0, #0x3b
	adds r0, r0, r6
	mov sl, r0
	adds r0, r6, #0
	adds r0, #0x2b
	str r0, [sp, #0x20]
	adds r0, #0x19
	str r0, [sp, #0x28]
	adds r0, #4
	str r0, [sp, #0x2c]
	adds r0, #4
	str r0, [sp, #0x30]
	subs r0, #0x22
	str r0, [sp, #0x1c]
	subs r0, #2
	str r0, [sp, #0x18]
	adds r0, #4
	str r0, [sp, #0x24]
	adds r0, r6, #2
	str r0, [sp, #4]
	adds r0, r6, #4
	str r0, [sp, #8]
	adds r0, r6, #6
	str r0, [sp, #0xc]
	adds r0, #2
	str r0, [sp, #0x10]
	adds r0, #2
	str r0, [sp, #0x14]
	mov sb, r4
	adds r7, r6, #0
	adds r7, #0x24
	adds r4, r6, #0
	adds r4, #0xc
_0805A4AA:
	mov r1, r8
	adds r1, #0xd
	mov r0, sb
	adds r2, r4, #0
	bl SetMonData
	mov r1, r8
	adds r1, #0x11
	mov r0, sb
	adds r2, r7, #0
	bl SetMonData
	adds r7, #1
	adds r4, #2
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _0805A4AA
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0805A5D8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x15
	mov r2, sl
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x20
	ldr r2, [sp, #0x20]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x19
	ldr r2, [sp, #0x28]
	bl SetMonData
	ldrb r0, [r6, #0x14]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, #0x14]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, #0x15]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, #0x14]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2a
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, #0x16]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2b
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2c
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0
	ldr r2, [sp, #0x2c]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x37
	ldr r2, [sp, #0x30]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x38
	ldr r2, [sp, #0x1c]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x39
	ldr r2, [sp, #0x18]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3a
	ldr r2, [sp, #0x24]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3b
	ldr r2, [sp, #4]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3c
	ldr r2, [sp, #8]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3d
	ldr r2, [sp, #0xc]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3e
	ldr r2, [sp, #0x10]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3f
	ldr r2, [sp, #0x14]
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A5D8: .4byte 0x02024190
_0805A5DC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A5F4
	adds r0, r0, r1
	ldr r1, _0805A5F8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xb
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A5F4: .4byte 0x02024190
_0805A5F8: .4byte 0x02023D08
_0805A5FC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A614
	adds r0, r0, r1
	ldr r1, _0805A618
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xc
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A614: .4byte 0x02024190
_0805A618: .4byte 0x02023D08
_0805A61C:
	movs r0, #0
	mov r8, r0
	movs r0, #0xc
	adds r0, r0, r3
	mov sb, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0805A670
	adds r7, r1, r0
	adds r6, r3, #0
	adds r6, #8
	adds r4, r3, #0
_0805A636:
	mov r1, r8
	adds r1, #0xd
	adds r0, r7, #0
	adds r2, r4, #0
	bl SetMonData
	mov r1, r8
	adds r1, #0x11
	adds r0, r7, #0
	adds r2, r6, #0
	bl SetMonData
	adds r6, #1
	adds r4, #2
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _0805A636
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A670
	adds r0, r0, r1
	movs r1, #0x15
	mov r2, sb
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A670: .4byte 0x02024190
_0805A674:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A690
	adds r0, r0, r1
	ldr r3, _0805A694
	ldr r1, _0805A698
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #9
	b _0805A718
	.align 2, 0
_0805A690: .4byte 0x02024190
_0805A694: .4byte 0x02022D08
_0805A698: .4byte 0x02023D08
_0805A69C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0805A6F8
	adds r4, r4, r0
	ldr r5, _0805A6FC
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r2, r2, r7
	adds r0, r4, #0
	movs r1, #0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x15
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A6F8: .4byte 0x02024190
_0805A6FC: .4byte 0x02023D08
_0805A700:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A724
	adds r0, r0, r1
	ldr r3, _0805A728
	ldr r1, _0805A72C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #8
_0805A718:
	adds r3, #3
	adds r2, r2, r3
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A724: .4byte 0x02024190
_0805A728: .4byte 0x02022D08
_0805A72C: .4byte 0x02023D08
_0805A730:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A748
	adds r0, r0, r1
	ldr r1, _0805A74C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #1
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A748: .4byte 0x02024190
_0805A74C: .4byte 0x02023D08
_0805A750:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A768
	adds r0, r0, r1
	ldr r1, _0805A76C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x19
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A768: .4byte 0x02024190
_0805A76C: .4byte 0x02023D08
_0805A770:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A788
	adds r0, r0, r1
	ldr r1, _0805A78C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1a
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A788: .4byte 0x02024190
_0805A78C: .4byte 0x02023D08
_0805A790:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A7A8
	adds r0, r0, r1
	ldr r1, _0805A7AC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1b
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A7A8: .4byte 0x02024190
_0805A7AC: .4byte 0x02023D08
_0805A7B0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A7C8
	adds r0, r0, r1
	ldr r1, _0805A7CC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1c
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A7C8: .4byte 0x02024190
_0805A7CC: .4byte 0x02023D08
_0805A7D0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A7E8
	adds r0, r0, r1
	ldr r1, _0805A7EC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1d
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A7E8: .4byte 0x02024190
_0805A7EC: .4byte 0x02023D08
_0805A7F0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A808
	adds r0, r0, r1
	ldr r1, _0805A80C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1e
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A808: .4byte 0x02024190
_0805A80C: .4byte 0x02023D08
_0805A810:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A828
	adds r0, r0, r1
	ldr r1, _0805A82C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1f
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A828: .4byte 0x02024190
_0805A82C: .4byte 0x02023D08
_0805A830:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A848
	adds r0, r0, r1
	ldr r1, _0805A84C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x20
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A848: .4byte 0x02024190
_0805A84C: .4byte 0x02023D08
_0805A850:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A868
	adds r0, r0, r1
	ldr r1, _0805A86C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x22
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A868: .4byte 0x02024190
_0805A86C: .4byte 0x02023D08
_0805A870:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A888
	adds r0, r0, r1
	ldr r1, _0805A88C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x23
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A888: .4byte 0x02024190
_0805A88C: .4byte 0x02023D08
_0805A890:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A8A8
	adds r0, r0, r1
	ldr r1, _0805A8AC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x24
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A8A8: .4byte 0x02024190
_0805A8AC: .4byte 0x02023D08
_0805A8B0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A8C8
	adds r0, r0, r1
	ldr r1, _0805A8CC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x25
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A8C8: .4byte 0x02024190
_0805A8CC: .4byte 0x02023D08
_0805A8D0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A8E8
	adds r0, r0, r1
	ldr r1, _0805A8EC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x26
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A8E8: .4byte 0x02024190
_0805A8EC: .4byte 0x02023D08
_0805A8F0:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0805A958
	adds r4, r4, r0
	ldr r5, _0805A95C
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r2, r2, r7
	adds r0, r4, #0
	movs r1, #0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2a
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2b
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #5
	adds r2, r2, r0
	adds r0, r4, #0
	b _0805AA10
	.align 2, 0
_0805A958: .4byte 0x02024190
_0805A95C: .4byte 0x02023D08
_0805A960:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A978
	adds r0, r0, r1
	ldr r1, _0805A97C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x27
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A978: .4byte 0x02024190
_0805A97C: .4byte 0x02023D08
_0805A980:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A998
	adds r0, r0, r1
	ldr r1, _0805A99C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x28
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A998: .4byte 0x02024190
_0805A99C: .4byte 0x02023D08
_0805A9A0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A9B8
	adds r0, r0, r1
	ldr r1, _0805A9BC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x29
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A9B8: .4byte 0x02024190
_0805A9BC: .4byte 0x02023D08
_0805A9C0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A9D8
	adds r0, r0, r1
	ldr r1, _0805A9DC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2a
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A9D8: .4byte 0x02024190
_0805A9DC: .4byte 0x02023D08
_0805A9E0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805A9F8
	adds r0, r0, r1
	ldr r1, _0805A9FC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2b
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805A9F8: .4byte 0x02024190
_0805A9FC: .4byte 0x02023D08
_0805AA00:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AA18
	adds r0, r0, r1
	ldr r1, _0805AA1C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
_0805AA10:
	movs r1, #0x2c
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AA18: .4byte 0x02024190
_0805AA1C: .4byte 0x02023D08
_0805AA20:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AA38
	adds r0, r0, r1
	ldr r1, _0805AA3C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AA38: .4byte 0x02024190
_0805AA3C: .4byte 0x02023D08
_0805AA40:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AA58
	adds r0, r0, r1
	ldr r1, _0805AA5C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #9
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AA58: .4byte 0x02024190
_0805AA5C: .4byte 0x02023D08
_0805AA60:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AA78
	adds r0, r0, r1
	ldr r1, _0805AA7C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x37
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AA78: .4byte 0x02024190
_0805AA7C: .4byte 0x02023D08
_0805AA80:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AA98
	adds r0, r0, r1
	ldr r1, _0805AA9C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x38
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AA98: .4byte 0x02024190
_0805AA9C: .4byte 0x02023D08
_0805AAA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AAB8
	adds r0, r0, r1
	ldr r1, _0805AABC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x39
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AAB8: .4byte 0x02024190
_0805AABC: .4byte 0x02023D08
_0805AAC0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AAD8
	adds r0, r0, r1
	ldr r1, _0805AADC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3a
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AAD8: .4byte 0x02024190
_0805AADC: .4byte 0x02023D08
_0805AAE0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AAF8
	adds r0, r0, r1
	ldr r1, _0805AAFC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3b
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AAF8: .4byte 0x02024190
_0805AAFC: .4byte 0x02023D08
_0805AB00:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AB18
	adds r0, r0, r1
	ldr r1, _0805AB1C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3c
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AB18: .4byte 0x02024190
_0805AB1C: .4byte 0x02023D08
_0805AB20:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AB38
	adds r0, r0, r1
	ldr r1, _0805AB3C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3d
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AB38: .4byte 0x02024190
_0805AB3C: .4byte 0x02023D08
_0805AB40:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AB58
	adds r0, r0, r1
	ldr r1, _0805AB5C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3e
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AB58: .4byte 0x02024190
_0805AB5C: .4byte 0x02023D08
_0805AB60:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AB78
	adds r0, r0, r1
	ldr r1, _0805AB7C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3f
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AB78: .4byte 0x02024190
_0805AB7C: .4byte 0x02023D08
_0805AB80:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AB98
	adds r0, r0, r1
	ldr r1, _0805AB9C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x16
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AB98: .4byte 0x02024190
_0805AB9C: .4byte 0x02023D08
_0805ABA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805ABB8
	adds r0, r0, r1
	ldr r1, _0805ABBC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x17
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805ABB8: .4byte 0x02024190
_0805ABBC: .4byte 0x02023D08
_0805ABC0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805ABD8
	adds r0, r0, r1
	ldr r1, _0805ABDC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x18
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805ABD8: .4byte 0x02024190
_0805ABDC: .4byte 0x02023D08
_0805ABE0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805ABF8
	adds r0, r0, r1
	ldr r1, _0805ABFC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x21
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805ABF8: .4byte 0x02024190
_0805ABFC: .4byte 0x02023D08
_0805AC00:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AC18
	adds r0, r0, r1
	ldr r1, _0805AC1C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2f
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AC18: .4byte 0x02024190
_0805AC1C: .4byte 0x02023D08
_0805AC20:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AC38
	adds r0, r0, r1
	ldr r1, _0805AC3C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x30
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AC38: .4byte 0x02024190
_0805AC3C: .4byte 0x02023D08
_0805AC40:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AC58
	adds r0, r0, r1
	ldr r1, _0805AC5C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x32
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AC58: .4byte 0x02024190
_0805AC5C: .4byte 0x02023D08
_0805AC60:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AC78
	adds r0, r0, r1
	ldr r1, _0805AC7C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x33
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AC78: .4byte 0x02024190
_0805AC7C: .4byte 0x02023D08
_0805AC80:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AC98
	adds r0, r0, r1
	ldr r1, _0805AC9C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x34
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805AC98: .4byte 0x02024190
_0805AC9C: .4byte 0x02023D08
_0805ACA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805ACB8
	adds r0, r0, r1
	ldr r1, _0805ACBC
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x35
	bl SetMonData
	b _0805ACD6
	.align 2, 0
_0805ACB8: .4byte 0x02024190
_0805ACBC: .4byte 0x02023D08
_0805ACC0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0805AD00
	adds r0, r0, r1
	ldr r1, _0805AD04
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x36
	bl SetMonData
_0805ACD6:
	ldr r2, _0805AD08
	ldr r0, _0805AD04
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0805AD00
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AD00: .4byte 0x02024190
_0805AD04: .4byte 0x02023D08
_0805AD08: .4byte 0x02023D12
	thumb_func_end SetPlayerMonData

	thumb_func_start PlayerHandleSetRawMonData
PlayerHandleSetRawMonData: @ 0x0805AD0C
	push {r4, r5, r6, r7, lr}
	ldr r1, _0805AD70
	ldr r7, _0805AD74
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r4, _0805AD78
	lsls r2, r2, #9
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _0805AD7C
	adds r0, r0, r1
	adds r5, r3, r0
	movs r3, #0
	adds r0, r4, #2
	adds r2, r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bhs _0805AD64
	adds r6, r4, #0
	adds r2, r7, #0
	adds r4, r0, #0
_0805AD42:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, r0, #9
	adds r0, #3
	adds r0, r3, r0
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r2]
	lsls r0, r0, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	blo _0805AD42
_0805AD64:
	bl PlayerBufferExecCompleted
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AD70: .4byte 0x02023D12
_0805AD74: .4byte 0x02023D08
_0805AD78: .4byte 0x02022D08
_0805AD7C: .4byte 0x02024190
	thumb_func_end PlayerHandleSetRawMonData

	thumb_func_start PlayerHandleLoadMonSprite
PlayerHandleLoadMonSprite: @ 0x0805AD80
	push {r4, lr}
	ldr r2, _0805ADCC
	ldr r4, _0805ADD0
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0805ADD4
	adds r0, r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldr r2, _0805ADD8
	ldr r0, _0805ADDC
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldr r1, _0805ADE0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805ADE4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805ADCC: .4byte 0x02023D12
_0805ADD0: .4byte 0x02023D08
_0805ADD4: .4byte 0x02024190
_0805ADD8: .4byte 0x020205AC
_0805ADDC: .4byte 0x02023E88
_0805ADE0: .4byte 0x03005AC0
_0805ADE4: .4byte 0x08057165
	thumb_func_end PlayerHandleLoadMonSprite

	thumb_func_start PlayerHandleSwitchInAnim
PlayerHandleSwitchInAnim: @ 0x0805ADE8
	push {r4, r5, r6, lr}
	ldr r5, _0805AE54
	ldrb r0, [r5]
	ldr r4, _0805AE58
	lsls r1, r0, #9
	adds r6, r4, #2
	adds r1, r1, r6
	ldrb r1, [r1]
	bl ClearTemporarySpeciesSpriteData
	ldr r2, _0805AE5C
	ldrb r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r2
	lsls r0, r0, #9
	adds r4, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r4, #0
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0805AE60
	adds r0, r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldr r1, _0805AE64
	ldrb r0, [r5]
	adds r0, r0, r1
	strb r4, [r0]
	ldr r1, _0805AE68
	ldrb r0, [r5]
	adds r0, r0, r1
	strb r4, [r0]
	ldrb r0, [r5]
	lsls r1, r0, #9
	adds r1, r1, r6
	ldrb r1, [r1]
	bl sub_0805AE74
	ldr r1, _0805AE6C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805AE70
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE54: .4byte 0x02023D08
_0805AE58: .4byte 0x02022D08
_0805AE5C: .4byte 0x02023D12
_0805AE60: .4byte 0x02024190
_0805AE64: .4byte 0x02024150
_0805AE68: .4byte 0x02024154
_0805AE6C: .4byte 0x03005AC0
_0805AE70: .4byte 0x08058C3D
	thumb_func_end PlayerHandleSwitchInAnim

	thumb_func_start sub_0805AE74
sub_0805AE74: @ 0x0805AE74
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl ClearTemporarySpeciesSpriteData
	ldr r0, _0805AFC8
	lsls r2, r6, #1
	adds r2, r2, r0
	ldr r0, _0805AFCC
	lsls r1, r6, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805AFD0
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0805AFD4
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _0805AFD8
	mov sb, r1
	add sb, r6
	mov r1, sb
	strb r0, [r1]
	adds r0, r6, #0
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0805AFDC
	mov sl, r0
	adds r0, r6, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, sl
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _0805AFE0
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0805AFE4
	mov r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r4]
	strh r1, [r0, #0x30]
	mov r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x32]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x2e]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x32]
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r3, r6, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0805AFE8
	adds r6, r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0805AFEC
	str r1, [r0]
	movs r0, #0
	movs r1, #0xff
	bl DoPokeballSendOutAnimation
	mov r1, sb
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x2e]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AFC8: .4byte 0x02023D12
_0805AFCC: .4byte 0x02022D08
_0805AFD0: .4byte 0x02024190
_0805AFD4: .4byte 0x0805D331
_0805AFD8: .4byte 0x03005ADC
_0805AFDC: .4byte 0x02024640
_0805AFE0: .4byte 0x02023E88
_0805AFE4: .4byte 0x020205AC
_0805AFE8: .4byte 0x02024188
_0805AFEC: .4byte 0x08007141
	thumb_func_end sub_0805AE74

	thumb_func_start PlayerHandleReturnMonToBall
PlayerHandleReturnMonToBall: @ 0x0805AFF0
	push {r4, r5, r6, lr}
	ldr r1, _0805B024
	ldr r6, _0805B028
	ldrb r2, [r6]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _0805B038
	ldr r0, _0805B02C
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r3, [r0, #4]
	ldr r1, _0805B030
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805B034
	str r1, [r0]
	b _0805B06E
	.align 2, 0
_0805B024: .4byte 0x02022D08
_0805B028: .4byte 0x02023D08
_0805B02C: .4byte 0x02024174
_0805B030: .4byte 0x03005AC0
_0805B034: .4byte 0x0805B081
_0805B038:
	ldr r5, _0805B074
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0805B078
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r1, _0805B07C
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerBufferExecCompleted
_0805B06E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B074: .4byte 0x02023E88
_0805B078: .4byte 0x020205AC
_0805B07C: .4byte 0x03005AD0
	thumb_func_end PlayerHandleReturnMonToBall

	thumb_func_start sub_0805B080
sub_0805B080: @ 0x0805B080
	push {r4, r5, r6, lr}
	ldr r6, _0805B0A0
	ldr r4, [r6]
	ldr r5, _0805B0A4
	ldrb r2, [r5]
	ldr r1, [r4, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _0805B0A8
	cmp r0, #1
	beq _0805B0D6
	b _0805B0FE
	.align 2, 0
_0805B0A0: .4byte 0x02024174
_0805B0A4: .4byte 0x02023D08
_0805B0A8:
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0805B0C2
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0805B0C2:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _0805B0FE
_0805B0D6:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805B0FE
	strb r0, [r3, #4]
	ldrb r2, [r5]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #1
	bl InitAndLaunchSpecialAnimation
	ldr r1, _0805B104
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805B108
	str r1, [r0]
_0805B0FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B104: .4byte 0x03005AC0
_0805B108: .4byte 0x08059355
	thumb_func_end sub_0805B080

	thumb_func_start PlayerHandleDrawTrainerPic
PlayerHandleDrawTrainerPic: @ 0x0805B10C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0805B16C
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0805B1D0
	bl GetMultiplayerId
	ldr r5, _0805B170
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r4, #0xff
	ldrb r0, [r1]
	cmp r0, #4
	beq _0805B154
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #5
	bne _0805B174
_0805B154:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #0x13]
	adds r4, r0, #2
	b _0805B1D6
	.align 2, 0
_0805B16C: .4byte 0x02022C90
_0805B170: .4byte 0x020226A0
_0805B174:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #2
	beq _0805B1A6
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, #1
	bne _0805B1BC
_0805B1A6:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #0x13]
	adds r4, r0, #4
	b _0805B1D6
_0805B1BC:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r4, [r1, #0x13]
	b _0805B1D6
_0805B1D0:
	ldr r0, _0805B21C
	ldr r0, [r0]
	ldrb r4, [r0, #8]
_0805B1D6:
	ldr r0, _0805B220
	ldr r1, [r0]
	movs r2, #0x40
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _0805B258
	ldr r0, _0805B224
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r1, #2
	ands r1, r0
	movs r0, #0x20
	mov sb, r0
	cmp r1, #0
	beq _0805B1FC
	movs r1, #0x5a
	mov sb, r1
_0805B1FC:
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0805B234
	ldr r0, _0805B228
	ldrh r1, [r0]
	ldr r0, _0805B22C
	cmp r1, r0
	beq _0805B234
	movs r0, #0x5a
	mov sb, r0
	ldr r1, _0805B230
	b _0805B25E
	.align 2, 0
_0805B21C: .4byte 0x03005AF0
_0805B220: .4byte 0x02022C90
_0805B224: .4byte 0x02023D08
_0805B228: .4byte 0x0203886E
_0805B22C: .4byte 0x00000C03
_0805B230: .4byte 0x082D8D70
_0805B234:
	ldr r1, _0805B250
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x12
	movs r1, #0xa0
	lsls r1, r1, #0xf
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	ldr r5, _0805B254
	b _0805B272
	.align 2, 0
_0805B250: .4byte 0x082D95BC
_0805B254: .4byte 0x02022C90
_0805B258:
	movs r0, #0x50
	mov sb, r0
	ldr r1, _0805B384
_0805B25E:
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x12
	movs r1, #0xa0
	lsls r1, r1, #0xf
	adds r0, r0, r1
	lsrs r7, r0, #0x10
_0805B272:
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0805B280
	b _0805B3B0
_0805B280:
	ldr r0, _0805B388
	ldrh r1, [r0]
	ldr r0, _0805B38C
	cmp r1, r0
	bne _0805B28C
	b _0805B3B0
_0805B28C:
	ldr r0, _0805B390
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	bl PlayerGenderToFrontTrainerPicId
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	ldr r6, _0805B394
	ldrb r1, [r6]
	adds r0, r5, #0
	bl DecompressTrainerFrontPic
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl SetMultiuseSpriteTemplateToTrainerFront
	ldr r0, _0805B398
	mov r8, r0
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	ldrb r0, [r6]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, r8
	mov r1, sb
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _0805B39C
	ldrb r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, _0805B3A0
	lsls r5, r5, #3
	adds r5, r5, r0
	ldrh r0, [r5, #4]
	bl IndexOfSpritePaletteTag
	ldr r5, _0805B3A4
	ldrb r1, [r6]
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r5
	lsls r0, r0, #4
	ldrb r3, [r2, #5]
	movs r1, #0xf
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #5]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0xf0
	strh r1, [r0, #0x24]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x30
	strh r1, [r0, #0x26]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0805B3A8
	strh r1, [r0, #0x2e]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0805B3AC
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r2, [r1, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	b _0805B446
	.align 2, 0
_0805B384: .4byte 0x082D95BC
_0805B388: .4byte 0x0203886E
_0805B38C: .4byte 0x00000C03
_0805B390: .4byte 0x03005AF0
_0805B394: .4byte 0x02023D08
_0805B398: .4byte 0x02024640
_0805B39C: .4byte 0x02023E88
_0805B3A0: .4byte 0x082D91CC
_0805B3A4: .4byte 0x020205AC
_0805B3A8: .4byte 0x0000FFFE
_0805B3AC: .4byte 0x0805D3C9
_0805B3B0:
	ldr r5, _0805B460
	ldrb r1, [r5]
	adds r0, r4, #0
	bl DecompressTrainerBackPic
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r6, _0805B464
	mov r8, sb
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	ldrb r0, [r5]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl CreateSprite
	ldr r6, _0805B468
	ldrb r1, [r5]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r4, _0805B46C
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xf0
	strh r1, [r0, #0x24]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0805B470
	strh r1, [r0, #0x2e]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _0805B474
	str r1, [r0]
_0805B446:
	ldr r1, _0805B478
	ldr r0, _0805B460
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805B47C
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B460: .4byte 0x02023D08
_0805B464: .4byte 0x02024640
_0805B468: .4byte 0x02023E88
_0805B46C: .4byte 0x020205AC
_0805B470: .4byte 0x0000FFFE
_0805B474: .4byte 0x0805D3C9
_0805B478: .4byte 0x03005AC0
_0805B47C: .4byte 0x08058455
	thumb_func_end PlayerHandleDrawTrainerPic

	thumb_func_start PlayerHandleTrainerSlide
PlayerHandleTrainerSlide: @ 0x0805B480
	push {r4, r5, r6, lr}
	ldr r0, _0805B4D8
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0805B53C
	bl GetMultiplayerId
	ldr r5, _0805B4DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r4, #0xff
	ldrb r0, [r1]
	cmp r0, #4
	beq _0805B4C2
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #5
	bne _0805B4E0
_0805B4C2:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #0x13]
	adds r4, r0, #2
	b _0805B542
	.align 2, 0
_0805B4D8: .4byte 0x02022C90
_0805B4DC: .4byte 0x020226A0
_0805B4E0:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #2
	beq _0805B512
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, #1
	bne _0805B528
_0805B512:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #0x13]
	adds r4, r0, #4
	b _0805B542
_0805B528:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r4, [r1, #0x13]
	b _0805B542
_0805B53C:
	ldr r0, _0805B5EC
	ldr r0, [r0]
	ldrb r4, [r0, #8]
_0805B542:
	ldr r5, _0805B5F0
	ldrb r1, [r5]
	adds r0, r4, #0
	bl DecompressTrainerBackPic
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _0805B5F4
	ldr r1, _0805B5F8
	lsls r4, r4, #2
	adds r4, r4, r1
	ldrb r1, [r4]
	movs r2, #8
	subs r2, r2, r1
	lsls r2, r2, #0x12
	movs r1, #0xa0
	lsls r1, r1, #0xf
	adds r2, r2, r1
	asrs r2, r2, #0x10
	movs r1, #0x50
	movs r3, #0x1e
	bl CreateSprite
	ldr r6, _0805B5FC
	ldrb r1, [r5]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r4, _0805B600
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0805B604
	strh r1, [r0, #0x24]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #2
	strh r1, [r0, #0x2e]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _0805B608
	str r1, [r0]
	ldr r1, _0805B60C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805B610
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B5EC: .4byte 0x03005AF0
_0805B5F0: .4byte 0x02023D08
_0805B5F4: .4byte 0x02024640
_0805B5F8: .4byte 0x082D95BC
_0805B5FC: .4byte 0x02023E88
_0805B600: .4byte 0x020205AC
_0805B604: .4byte 0x0000FFA0
_0805B608: .4byte 0x0805D3C9
_0805B60C: .4byte 0x03005AC0
_0805B610: .4byte 0x0805848D
	thumb_func_end PlayerHandleTrainerSlide

	thumb_func_start PlayerHandleTrainerSlideBack
PlayerHandleTrainerSlideBack: @ 0x0805B614
	push {r4, r5, r6, lr}
	ldr r5, _0805B6B4
	ldr r6, _0805B6B8
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0805B6BC
	adds r0, r0, r4
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x32
	strh r1, [r0, #0x2e]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0805B6C0
	strh r1, [r0, #0x32]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0805B6C4
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0805B6C8
	bl StoreSpriteCallbackInData6
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAnim
	ldr r1, _0805B6CC
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805B6D0
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B6B4: .4byte 0x02023E88
_0805B6B8: .4byte 0x02023D08
_0805B6BC: .4byte 0x020205AC
_0805B6C0: .4byte 0x0000FFD8
_0805B6C4: .4byte 0x080A67B5
_0805B6C8: .4byte 0x08007141
_0805B6CC: .4byte 0x03005AC0
_0805B6D0: .4byte 0x080584C5
	thumb_func_end PlayerHandleTrainerSlideBack

	thumb_func_start PlayerHandleFaintAnimation
PlayerHandleFaintAnimation: @ 0x0805B6D4
	push {r4, r5, r6, lr}
	ldr r6, _0805B720
	ldr r4, [r6]
	ldr r5, _0805B724
	ldrb r2, [r5]
	ldr r0, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _0805B728
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0805B708
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0805B708:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	adds r1, #1
	strb r1, [r0, #4]
	b _0805B79E
	.align 2, 0
_0805B720: .4byte 0x02024174
_0805B724: .4byte 0x02023D08
_0805B728:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0805B79E
	strb r4, [r3, #4]
	ldr r2, _0805B7A4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0805B7A8
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	movs r1, #0x40
	rsbs r1, r1, #0
	movs r0, #0x10
	bl PlaySE12WithPanning
	ldr r2, _0805B7AC
	ldr r3, _0805B7B0
	ldrb r0, [r5]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r4, [r0, #0x30]
	ldrb r0, [r5]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #5
	strh r1, [r0, #0x32]
	ldrb r0, [r5]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _0805B7B4
	str r1, [r0]
	ldr r1, _0805B7B8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805B7BC
	str r1, [r0]
_0805B79E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B7A4: .4byte 0x02023D12
_0805B7A8: .4byte 0x02024190
_0805B7AC: .4byte 0x020205AC
_0805B7B0: .4byte 0x02023E88
_0805B7B4: .4byte 0x08039845
_0805B7B8: .4byte 0x03005AC0
_0805B7BC: .4byte 0x080592B9
	thumb_func_end PlayerHandleFaintAnimation

	thumb_func_start PlayerHandlePaletteFade
PlayerHandlePaletteFade: @ 0x0805B7C0
	push {lr}
	sub sp, #4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	bl PlayerBufferExecCompleted
	add sp, #4
	pop {r0}
	bx r0
	thumb_func_end PlayerHandlePaletteFade

	thumb_func_start PlayerHandleSuccessBallThrowAnim
PlayerHandleSuccessBallThrowAnim: @ 0x0805B7E0
	push {r4, r5, lr}
	ldr r0, _0805B820
	ldr r0, [r0]
	ldr r1, [r0, #8]
	movs r0, #4
	strb r0, [r1, #8]
	ldr r1, _0805B824
	movs r0, #1
	strb r0, [r1]
	ldr r5, _0805B828
	ldrb r4, [r5]
	movs r0, #1
	bl GetBattlerAtPosition
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r4, #0
	movs r3, #3
	bl InitAndLaunchSpecialAnimation
	ldr r1, _0805B82C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805B830
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B820: .4byte 0x02024174
_0805B824: .4byte 0x0202415D
_0805B828: .4byte 0x02023D08
_0805B82C: .4byte 0x03005AC0
_0805B830: .4byte 0x0805952D
	thumb_func_end PlayerHandleSuccessBallThrowAnim

	thumb_func_start PlayerHandleBallThrowAnim
PlayerHandleBallThrowAnim: @ 0x0805B834
	push {r4, r5, lr}
	ldr r1, _0805B87C
	ldr r5, _0805B880
	ldrb r0, [r5]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, _0805B884
	ldr r0, [r0]
	ldr r0, [r0, #8]
	strb r1, [r0, #8]
	ldr r1, _0805B888
	movs r0, #1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, #1
	bl GetBattlerAtPosition
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r4, #0
	movs r3, #3
	bl InitAndLaunchSpecialAnimation
	ldr r1, _0805B88C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805B890
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B87C: .4byte 0x02022D08
_0805B880: .4byte 0x02023D08
_0805B884: .4byte 0x02024174
_0805B888: .4byte 0x0202415D
_0805B88C: .4byte 0x03005AC0
_0805B890: .4byte 0x0805952D
	thumb_func_end PlayerHandleBallThrowAnim

	thumb_func_start PlayerHandlePause
PlayerHandlePause: @ 0x0805B894
	push {lr}
	ldr r1, _0805B8BC
	ldr r0, _0805B8C0
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805B8B2
_0805B8A8:
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805B8A8
_0805B8B2:
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0805B8BC: .4byte 0x02022D08
_0805B8C0: .4byte 0x02023D08
	thumb_func_end PlayerHandlePause

	thumb_func_start PlayerHandleMoveAnimation
PlayerHandleMoveAnimation: @ 0x0805B8C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0805B9B4
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805B8DA
	b _0805BA00
_0805B8DA:
	ldr r0, _0805B9B8
	mov ip, r0
	ldrb r1, [r5]
	lsls r1, r1, #9
	adds r0, #1
	adds r0, r1, r0
	ldrb r6, [r0]
	mov r0, ip
	adds r0, #2
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r6, r0
	ldr r0, _0805B9BC
	mov r8, r0
	mov r0, ip
	adds r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	ldr r3, _0805B9C0
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #4
	adds r0, r1, r0
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #5
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r3]
	ldr r3, _0805B9C4
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #6
	adds r0, r1, r0
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #7
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r2, r0
	mov r0, ip
	adds r0, #8
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x10
	orrs r2, r0
	mov r0, ip
	adds r0, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r3]
	ldr r2, _0805B9C8
	ldrb r0, [r5]
	lsls r0, r0, #9
	mov r1, ip
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r4, _0805B9CC
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #0xc
	adds r0, r1, r0
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #0xd
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r4]
	ldr r7, _0805B9D0
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #0x10
	adds r1, r1, r0
	str r1, [r7]
	ldr r2, _0805B9D4
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r1]
	str r1, [r0]
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, #0
	bl IsMoveWithoutAnimation
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _0805B9D8
	bl PlayerBufferExecCompleted
	b _0805BA00
	.align 2, 0
_0805B9B4: .4byte 0x02023D08
_0805B9B8: .4byte 0x02022D08
_0805B9BC: .4byte 0x020380D2
_0805B9C0: .4byte 0x020380A8
_0805B9C4: .4byte 0x020380A4
_0805B9C8: .4byte 0x020380BA
_0805B9CC: .4byte 0x020380BC
_0805B9D0: .4byte 0x020380A0
_0805B9D4: .4byte 0x02024160
_0805B9D8:
	ldr r0, _0805BA0C
	ldr r0, [r0]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #4]
	ldr r1, _0805BA10
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805BA14
	str r1, [r0]
	ldrh r1, [r4]
	ldr r2, [r7]
	adds r0, r6, #0
	bl BattleTv_SetDataBasedOnMove
_0805BA00:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA0C: .4byte 0x02024174
_0805BA10: .4byte 0x03005AC0
_0805BA14: .4byte 0x0805BA19
	thumb_func_end PlayerHandleMoveAnimation

	thumb_func_start PlayerDoMoveAnimation
PlayerDoMoveAnimation: @ 0x0805BA18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _0805BA64
	ldr r6, _0805BA68
	ldrb r3, [r6]
	lsls r1, r3, #9
	adds r0, r2, #1
	mov sl, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, r2, #2
	mov sb, r5
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r4, r0
	adds r2, #0xb
	adds r1, r1, r2
	ldrb r1, [r1]
	mov r8, r1
	ldr r7, _0805BA6C
	ldr r5, [r7]
	ldr r1, [r5, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _0805BAB0
	cmp r2, #1
	bgt _0805BA70
	cmp r2, #0
	beq _0805BA7A
	b _0805BB8C
	.align 2, 0
_0805BA64: .4byte 0x02022D08
_0805BA68: .4byte 0x02023D08
_0805BA6C: .4byte 0x02024174
_0805BA70:
	cmp r2, #2
	beq _0805BADA
	cmp r2, #3
	beq _0805BB50
	b _0805BB8C
_0805BA7A:
	ldr r1, [r5]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, #0xc
	ands r0, r2
	cmp r0, #4
	bne _0805BA9C
	movs r0, #8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0805BA9C:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _0805BB8C
_0805BAB0:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0805BB8C
	movs r0, #0
	bl sub_0805E7B8
	adds r0, r4, #0
	bl DoMoveAnim
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #2
	strb r1, [r0, #4]
	b _0805BB8C
_0805BADA:
	ldr r0, _0805BB40
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0805BB44
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805BB8C
	movs r0, #1
	bl sub_0805E7B8
	ldr r0, [r7]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0805BB28
	mov r0, r8
	cmp r0, #1
	bhi _0805BB28
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_0805BB28:
	ldr r0, _0805BB48
	ldr r2, [r0]
	ldr r0, _0805BB4C
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #4]
	b _0805BB8C
	.align 2, 0
_0805BB40: .4byte 0x02038098
_0805BB44: .4byte 0x0203809D
_0805BB48: .4byte 0x02024174
_0805BB4C: .4byte 0x02023D08
_0805BB50:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0805BB8C
	bl CopyAllBattleSpritesInvisibilities
	ldrb r0, [r6]
	lsls r2, r0, #9
	mov r3, sl
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, sb
	ldrb r2, [r2]
	lsls r2, r2, #8
	orrs r1, r2
	bl TrySetBehindSubstituteSpriteBit
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r4, [r0, #4]
	bl PlayerBufferExecCompleted
_0805BB8C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerDoMoveAnimation

	thumb_func_start PlayerHandlePrintString
PlayerHandlePrintString: @ 0x0805BB9C
	push {r4, r5, lr}
	ldr r0, _0805BBE0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0805BBE4
	strh r1, [r0]
	ldr r5, _0805BBE8
	ldrb r4, [r5]
	lsls r4, r4, #9
	ldr r0, _0805BBEC
	adds r4, r4, r0
	ldrh r0, [r4]
	bl BufferStringBattle
	ldr r0, _0805BBF0
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0805BBF4
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805BBF8
	str r1, [r0]
	ldrh r0, [r4]
	bl BattleTv_SetDataBasedOnString
	ldrb r0, [r5]
	ldrh r1, [r4]
	bl BattleArena_DeductMindPoints
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805BBE0: .4byte 0x02022AC8
_0805BBE4: .4byte 0x02022ACA
_0805BBE8: .4byte 0x02023D08
_0805BBEC: .4byte 0x02022D0A
_0805BBF0: .4byte 0x02022AE0
_0805BBF4: .4byte 0x03005AC0
_0805BBF8: .4byte 0x080593C5
	thumb_func_end PlayerHandlePrintString

	thumb_func_start PlayerHandlePrintSelectionString
PlayerHandlePrintSelectionString: @ 0x0805BBFC
	push {lr}
	ldr r0, _0805BC14
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BC18
	bl PlayerHandlePrintString
	b _0805BC1C
	.align 2, 0
_0805BC14: .4byte 0x02023D08
_0805BC18:
	bl PlayerBufferExecCompleted
_0805BC1C:
	pop {r0}
	bx r0
	thumb_func_end PlayerHandlePrintSelectionString

	thumb_func_start sub_0805BC20
sub_0805BC20: @ 0x0805BC20
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0805BC46
	ldr r0, _0805BC4C
	strh r1, [r0]
	ldr r1, _0805BC50
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _0805BC54
	ldr r0, _0805BC58
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805BC5C
	str r1, [r0]
_0805BC46:
	pop {r0}
	bx r0
	.align 2, 0
_0805BC4C: .4byte 0x02022AC8
_0805BC50: .4byte 0x02022ACA
_0805BC54: .4byte 0x03005AC0
_0805BC58: .4byte 0x02023D08
_0805BC5C: .4byte 0x08057199
	thumb_func_end sub_0805BC20

	thumb_func_start PlayerHandleChooseAction
PlayerHandleChooseAction: @ 0x0805BC60
	push {r4, lr}
	ldr r1, _0805BCB0
	ldr r0, _0805BCB4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805BCB8
	str r1, [r0]
	bl BattleTv_ClearExplosionFaintCause
	ldr r0, _0805BCBC
	movs r1, #2
	bl sub_0814FA04
	movs r4, #0
_0805BC7E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl ActionSelectionDestroyCursorAt
	adds r4, #1
	cmp r4, #3
	ble _0805BC7E
	ldr r1, _0805BCC0
	ldr r0, _0805BCB4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl SetCB2ToReshowScreenAfterMenu
	ldr r0, _0805BCC4
	bl TryGetStatusString
	ldr r0, _0805BCC8
	movs r1, #1
	bl sub_0814FA04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BCB0: .4byte 0x03005AC0
_0805BCB4: .4byte 0x02023D08
_0805BCB8: .4byte 0x0805BC21
_0805BCBC: .4byte 0x085ABB72
_0805BCC0: .4byte 0x02024150
_0805BCC4: .4byte 0x085ABB43
_0805BCC8: .4byte 0x02022AE0
	thumb_func_end PlayerHandleChooseAction

	thumb_func_start PlayerHandleUnknownYesNoBox
PlayerHandleUnknownYesNoBox: @ 0x0805BCCC
	push {r4, lr}
	sub sp, #4
	ldr r4, _0805BD10
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805BD24
	str r0, [sp]
	movs r0, #0x18
	movs r1, #8
	movs r2, #0x1d
	movs r3, #0xd
	bl HandleBattleWindow
	ldr r0, _0805BD14
	movs r1, #0xc
	bl sub_0814FA04
	ldr r1, _0805BD18
	movs r0, #1
	strb r0, [r1]
	movs r0, #1
	bl BattleCreateYesNoCursorAt
	ldr r1, _0805BD1C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805BD20
	str r1, [r0]
	b _0805BD28
	.align 2, 0
_0805BD10: .4byte 0x02023D08
_0805BD14: .4byte 0x085ABBC9
_0805BD18: .4byte 0x03005AD4
_0805BD1C: .4byte 0x03005AC0
_0805BD20: .4byte 0x080595E5
_0805BD24:
	bl PlayerBufferExecCompleted
_0805BD28:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerHandleUnknownYesNoBox

	thumb_func_start HandleChooseMoveAfterDma3
HandleChooseMoveAfterDma3: @ 0x0805BD30
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0805BD5A
	ldr r0, _0805BD60
	strh r1, [r0]
	ldr r1, _0805BD64
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0805BD68
	ldr r0, _0805BD6C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805BD70
	str r1, [r0]
_0805BD5A:
	pop {r0}
	bx r0
	.align 2, 0
_0805BD60: .4byte 0x02022AC8
_0805BD64: .4byte 0x02022ACA
_0805BD68: .4byte 0x03005AC0
_0805BD6C: .4byte 0x02023D08
_0805BD70: .4byte 0x0805780D
	thumb_func_end HandleChooseMoveAfterDma3

	thumb_func_start PlayerChooseMoveInBattlePalace
PlayerChooseMoveInBattlePalace: @ 0x0805BD74
	push {lr}
	ldr r0, _0805BDB4
	ldrb r1, [r0]
	ldr r0, _0805BDB8
	ldr r0, [r0]
	adds r1, r1, r0
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BDB0
	ldr r1, _0805BDBC
	ldr r0, _0805BDC0
	ldr r0, [r0]
	str r0, [r1]
	bl ChooseMoveAndTargetInBattlePalace
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
	bl PlayerBufferExecCompleted
_0805BDB0:
	pop {r0}
	bx r0
	.align 2, 0
_0805BDB4: .4byte 0x02023D08
_0805BDB8: .4byte 0x02024140
_0805BDBC: .4byte 0x0203B9FC
_0805BDC0: .4byte 0x03005AE0
	thumb_func_end PlayerChooseMoveInBattlePalace

	thumb_func_start PlayerHandleChooseMove
PlayerHandleChooseMove: @ 0x0805BDC4
	push {lr}
	ldr r0, _0805BDF4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0805BE08
	ldr r2, _0805BDF8
	ldrb r0, [r2]
	ldr r1, _0805BDFC
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xa6
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #8
	strb r1, [r0]
	ldr r1, _0805BE00
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805BE04
	b _0805BE18
	.align 2, 0
_0805BDF4: .4byte 0x02022C90
_0805BDF8: .4byte 0x02023D08
_0805BDFC: .4byte 0x02024140
_0805BE00: .4byte 0x03005AC0
_0805BE04: .4byte 0x0805BD75
_0805BE08:
	bl InitMoveSelectionsVarsAndStrings
	ldr r1, _0805BE20
	ldr r0, _0805BE24
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805BE28
_0805BE18:
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0805BE20: .4byte 0x03005AC0
_0805BE24: .4byte 0x02023D08
_0805BE28: .4byte 0x0805BD31
	thumb_func_end PlayerHandleChooseMove

	thumb_func_start InitMoveSelectionsVarsAndStrings
InitMoveSelectionsVarsAndStrings: @ 0x0805BE2C
	push {lr}
	bl MoveSelectionDisplayMoveNames
	ldr r1, _0805BE58
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0805BE5C
	ldr r0, _0805BE60
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl MoveSelectionCreateCursorAt
	bl PlayerHandleTwoReturnValues
	bl MoveSelectionDisplayPpNumber
	bl ActionSelectionCreateCursorAt
	pop {r0}
	bx r0
	.align 2, 0
_0805BE58: .4byte 0x03005AD4
_0805BE5C: .4byte 0x02024154
_0805BE60: .4byte 0x02023D08
	thumb_func_end InitMoveSelectionsVarsAndStrings

	thumb_func_start PlayerHandleChooseItem
PlayerHandleChooseItem: @ 0x0805BE64
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _0805BEB0
	ldr r2, _0805BEB4
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805BEB8
	str r1, [r0]
	ldr r1, _0805BEBC
	ldrb r0, [r2]
	strb r0, [r1]
	movs r3, #0
	ldr r5, _0805BEC0
	ldr r4, _0805BEC4
_0805BE92:
	adds r0, r3, r5
	ldrb r1, [r2]
	lsls r1, r1, #9
	adds r1, #1
	adds r1, r3, r1
	adds r1, r1, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #2
	ble _0805BE92
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805BEB0: .4byte 0x03005AC0
_0805BEB4: .4byte 0x02023D08
_0805BEB8: .4byte 0x080594B5
_0805BEBC: .4byte 0x0202415C
_0805BEC0: .4byte 0x0203CBCC
_0805BEC4: .4byte 0x02022D08
	thumb_func_end PlayerHandleChooseItem

	thumb_func_start PlayerHandleChoosePokemon
PlayerHandleChoosePokemon: @ 0x0805BEC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r3, #0
	ldr r0, _0805BF38
	mov ip, r0
	ldr r1, _0805BF3C
	mov r8, r1
	ldr r2, _0805BF40
	ldr r7, _0805BF44
	mov r6, ip
	mov r5, r8
	adds r4, r2, #0
_0805BEE4:
	adds r0, r3, r6
	ldrb r1, [r4]
	lsls r1, r1, #9
	adds r1, #4
	adds r1, r3, r1
	adds r1, r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #2
	ble _0805BEE4
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0805BF4C
	ldrb r3, [r2]
	lsls r0, r3, #9
	mov r1, r8
	adds r1, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #2
	beq _0805BF4C
	ldr r1, _0805BF48
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	mov r2, ip
	bl BtlController_EmitChosenMonReturnValue
	bl PlayerBufferExecCompleted
	b _0805BFD8
	.align 2, 0
_0805BF38: .4byte 0x0203CBCC
_0805BF3C: .4byte 0x02022D08
_0805BF40: .4byte 0x02023D08
_0805BF44: .4byte 0x02022C90
_0805BF48: .4byte 0x02023D12
_0805BF4C:
	ldr r0, _0805BFE4
	movs r1, #0xff
	bl CreateTask
	ldr r3, _0805BFE8
	ldr r4, _0805BFEC
	ldrb r1, [r4]
	adds r1, r1, r3
	movs r2, #0
	mov r8, r2
	strb r0, [r1]
	ldr r5, _0805BFF0
	ldrb r2, [r4]
	adds r3, r2, r3
	ldrb r0, [r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldr r5, _0805BFF4
	lsls r2, r2, #9
	adds r6, r5, #1
	adds r2, r2, r6
	ldrb r2, [r2]
	movs r0, #0xf
	ands r0, r2
	strh r0, [r1, #8]
	ldr r3, _0805BFF8
	ldr r1, [r3]
	adds r1, #0x49
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #4
	strb r0, [r1]
	ldr r2, [r3]
	adds r2, #0x8b
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r1, r5, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r1, [r3]
	adds r1, #0xb0
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r5, #3
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	mov r1, r8
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _0805BFFC
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805C000
	str r1, [r0]
	ldr r1, _0805C004
	ldrb r0, [r4]
	strb r0, [r1]
_0805BFD8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BFE4: .4byte 0x080A8A41
_0805BFE8: .4byte 0x03005ADC
_0805BFEC: .4byte 0x02023D08
_0805BFF0: .4byte 0x03005B60
_0805BFF4: .4byte 0x02022D08
_0805BFF8: .4byte 0x02024140
_0805BFFC: .4byte 0x03005AC0
_0805C000: .4byte 0x080593DD
_0805C004: .4byte 0x0202415C
	thumb_func_end PlayerHandleChoosePokemon

	thumb_func_start PlayerHandleCmd23
PlayerHandleCmd23: @ 0x0805C008
	push {lr}
	sub sp, #4
	bl BattleStopLowHpSound
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	bl PlayerBufferExecCompleted
	add sp, #4
	pop {r0}
	bx r0
	thumb_func_end PlayerHandleCmd23

	thumb_func_start PlayerHandleHealthBarUpdate
PlayerHandleHealthBarUpdate: @ 0x0805C02C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	bl LoadBattleBarGfx
	ldr r3, _0805C0B4
	ldr r0, _0805C0B8
	mov sb, r0
	ldrb r1, [r0]
	lsls r1, r1, #9
	adds r0, r3, #2
	adds r0, r1, r0
	ldrb r2, [r0]
	adds r3, #3
	adds r1, r1, r3
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r2, r0
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	cmp r7, #0
	ble _0805C066
	ldr r1, _0805C0BC
	ldr r0, [r1]
	adds r0, r0, r7
	str r0, [r1]
_0805C066:
	ldr r0, _0805C0C0
	cmp r7, r0
	beq _0805C0D0
	ldr r6, _0805C0C4
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _0805C0C8
	adds r0, r0, r4
	movs r1, #0x3a
	bl GetMonData
	mov r8, r0
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x39
	bl GetMonData
	adds r3, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _0805C0CC
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _0805C10E
	.align 2, 0
_0805C0B4: .4byte 0x02022D08
_0805C0B8: .4byte 0x02023D08
_0805C0BC: .4byte 0x0203CA3C
_0805C0C0: .4byte 0x00007FFF
_0805C0C4: .4byte 0x02023D12
_0805C0C8: .4byte 0x02024190
_0805C0CC: .4byte 0x03005AD0
_0805C0D0:
	ldr r1, _0805C12C
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805C130
	adds r0, r0, r1
	movs r1, #0x3a
	bl GetMonData
	adds r2, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r4, _0805C134
	adds r1, r0, r4
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, #0
	bl SetBattleBarStruct
	mov r2, sb
	ldrb r0, [r2]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #0
	bl sub_080726F4
_0805C10E:
	ldr r1, _0805C138
	ldr r0, _0805C13C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805C140
	str r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C12C: .4byte 0x02023D12
_0805C130: .4byte 0x02024190
_0805C134: .4byte 0x03005AD0
_0805C138: .4byte 0x03005AC0
_0805C13C: .4byte 0x02023D08
_0805C140: .4byte 0x08058D41
	thumb_func_end PlayerHandleHealthBarUpdate

	thumb_func_start PlayerHandleExpUpdate
PlayerHandleExpUpdate: @ 0x0805C144
	push {r4, r5, r6, r7, lr}
	ldr r5, _0805C170
	ldr r6, _0805C174
	ldrb r0, [r6]
	lsls r0, r0, #9
	adds r1, r5, #1
	adds r0, r0, r1
	ldrb r7, [r0]
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _0805C178
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	cmp r0, #0x63
	bls _0805C17C
	bl PlayerBufferExecCompleted
	b _0805C1C8
	.align 2, 0
_0805C170: .4byte 0x02022D08
_0805C174: .4byte 0x02023D08
_0805C178: .4byte 0x02024190
_0805C17C:
	movs r0, #1
	bl LoadBattleBarGfx
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	ldrb r1, [r6]
	lsls r1, r1, #9
	adds r0, r5, #2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r5, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r4, r0
	ldr r0, _0805C1D0
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0805C1D4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r7, [r1, #8]
	strh r4, [r1, #0xa]
	ldrb r0, [r6]
	strh r0, [r1, #0xc]
	ldr r1, _0805C1D8
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805C1DC
	str r1, [r0]
_0805C1C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C1D0: .4byte 0x08058DC9
_0805C1D4: .4byte 0x03005B60
_0805C1D8: .4byte 0x03005AC0
_0805C1DC: .4byte 0x08057069
	thumb_func_end PlayerHandleExpUpdate

	thumb_func_start PlayerHandleStatusIconUpdate
PlayerHandleStatusIconUpdate: @ 0x0805C1E0
	push {r4, lr}
	ldr r4, _0805C23C
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805C234
	ldr r0, _0805C240
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0805C244
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0805C248
	adds r1, r1, r2
	movs r2, #9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _0805C24C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _0805C250
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805C254
	str r1, [r0]
_0805C234:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C23C: .4byte 0x02023D08
_0805C240: .4byte 0x03005AD0
_0805C244: .4byte 0x02023D12
_0805C248: .4byte 0x02024190
_0805C24C: .4byte 0x02024174
_0805C250: .4byte 0x03005AC0
_0805C254: .4byte 0x0805997D
	thumb_func_end PlayerHandleStatusIconUpdate

	thumb_func_start PlayerHandleStatusAnimation
PlayerHandleStatusAnimation: @ 0x0805C258
	push {r4, r5, lr}
	ldr r5, _0805C2B0
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805C2A8
	ldr r4, _0805C2B4
	ldrb r3, [r5]
	lsls r3, r3, #9
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, r2, #8
	orrs r1, r2
	adds r2, r4, #4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, r2, #0x10
	orrs r1, r2
	adds r4, #5
	adds r3, r3, r4
	ldrb r2, [r3]
	lsls r2, r2, #0x18
	orrs r1, r2
	bl InitAndLaunchChosenStatusAnimation
	ldr r1, _0805C2B8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805C2BC
	str r1, [r0]
_0805C2A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C2B0: .4byte 0x02023D08
_0805C2B4: .4byte 0x02022D08
_0805C2B8: .4byte 0x03005AC0
_0805C2BC: .4byte 0x0805997D
	thumb_func_end PlayerHandleStatusAnimation

	thumb_func_start PlayerHandleStatusXor
PlayerHandleStatusXor: @ 0x0805C2C0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r0, _0805C31C
	mov r8, r0
	ldr r4, _0805C320
	ldrb r0, [r4]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0805C324
	adds r0, r0, r5
	movs r1, #0x37
	bl GetMonData
	ldr r2, _0805C328
	ldrb r1, [r4]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	eors r0, r1
	mov r1, sp
	strb r0, [r1]
	ldrb r0, [r4]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x37
	mov r2, sp
	bl SetMonData
	bl PlayerBufferExecCompleted
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C31C: .4byte 0x02023D12
_0805C320: .4byte 0x02023D08
_0805C324: .4byte 0x02024190
_0805C328: .4byte 0x02022D08
	thumb_func_end PlayerHandleStatusXor

	thumb_func_start sub_0805C32C
sub_0805C32C: @ 0x0805C32C
	push {lr}
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0805C32C

	thumb_func_start PlayerHandleDMA3Transfer
PlayerHandleDMA3Transfer: @ 0x0805C338
	push {r4, r5, lr}
	ldr r3, _0805C39C
	ldr r0, _0805C3A0
	ldrb r2, [r0]
	lsls r2, r2, #9
	adds r0, r3, #1
	adds r0, r2, r0
	ldrb r5, [r0]
	adds r0, r3, #2
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r5, r0
	adds r0, r3, #3
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x10
	orrs r5, r0
	adds r0, r3, #4
	adds r0, r2, r0
	ldrb r4, [r0]
	lsls r4, r4, #0x18
	adds r0, r3, #5
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r3, #6
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	adds r3, #7
	adds r2, r2, r3
	orrs r5, r4
	lsrs r4, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #5
	cmp r4, r0
	bhi _0805C3A8
	ldr r0, _0805C3A4
	str r2, [r0]
	str r5, [r0, #4]
	lsrs r1, r1, #0x11
	movs r2, #0x80
	lsls r2, r2, #0x18
	orrs r1, r2
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0805C3D4
	.align 2, 0
_0805C39C: .4byte 0x02022D08
_0805C3A0: .4byte 0x02023D08
_0805C3A4: .4byte 0x040000D4
_0805C3A8:
	ldr r3, _0805C3E0
	str r2, [r3]
	str r5, [r3, #4]
	ldr r0, _0805C3E4
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r2, r2, r0
	adds r5, r5, r0
	ldr r1, _0805C3E8
	adds r4, r4, r1
	cmp r4, r0
	bhi _0805C3A8
	str r2, [r3]
	str r5, [r3, #4]
	lsrs r0, r4, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_0805C3D4:
	bl PlayerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C3E0: .4byte 0x040000D4
_0805C3E4: .4byte 0x80000800
_0805C3E8: .4byte 0xFFFFF000
	thumb_func_end PlayerHandleDMA3Transfer

	thumb_func_start PlayerHandlePlayBGM
PlayerHandlePlayBGM: @ 0x0805C3EC
	push {lr}
	ldr r2, _0805C414
	ldr r0, _0805C418
	ldrb r1, [r0]
	lsls r1, r1, #9
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayBGM
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0805C414: .4byte 0x02022D08
_0805C418: .4byte 0x02023D08
	thumb_func_end PlayerHandlePlayBGM

	thumb_func_start PlayerHandleCmd32
PlayerHandleCmd32: @ 0x0805C41C
	push {lr}
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerHandleCmd32

	thumb_func_start sub_0805C428
sub_0805C428: @ 0x0805C428
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_0805C428

	thumb_func_start sub_0805C43C
sub_0805C43C: @ 0x0805C43C
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BtlController_EmitChosenMonReturnValue
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_0805C43C

	thumb_func_start sub_0805C450
sub_0805C450: @ 0x0805C450
	push {lr}
	movs r0, #1
	movs r1, #0
	bl BtlController_EmitOneReturnValue
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0805C450

	thumb_func_start PlayerHandleOneReturnValue
PlayerHandleOneReturnValue: @ 0x0805C464
	push {lr}
	movs r0, #1
	movs r1, #0
	bl BtlController_EmitOneReturnValue_Duplicate
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerHandleOneReturnValue

	thumb_func_start PlayerHandleCmd37
PlayerHandleCmd37: @ 0x0805C478
	push {lr}
	ldr r2, _0805C490
	ldrb r1, [r2]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0805C490: .4byte 0x020229C0
	thumb_func_end PlayerHandleCmd37

	thumb_func_start PlayerHandleCmd38
PlayerHandleCmd38: @ 0x0805C494
	push {lr}
	ldr r3, _0805C4C0
	ldr r1, _0805C4C4
	ldr r0, _0805C4C8
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0805C4C0: .4byte 0x020229C0
_0805C4C4: .4byte 0x02022D08
_0805C4C8: .4byte 0x02023D08
	thumb_func_end PlayerHandleCmd38

	thumb_func_start PlayerHandleCmd39
PlayerHandleCmd39: @ 0x0805C4CC
	push {lr}
	ldr r2, _0805C4E0
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0805C4E0: .4byte 0x020229C0
	thumb_func_end PlayerHandleCmd39

	thumb_func_start PlayerHandleCmd40
PlayerHandleCmd40: @ 0x0805C4E4
	push {lr}
	ldr r3, _0805C508
	ldr r1, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #7
	ldrb r2, [r3]
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0805C508: .4byte 0x020229C0
	thumb_func_end PlayerHandleCmd40

	thumb_func_start sub_0805C50C
sub_0805C50C: @ 0x0805C50C
	push {r4, lr}
	ldr r3, _0805C534
	ldr r2, _0805C538
	ldr r4, _0805C53C
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _0805C540
	bl PlayerBufferExecCompleted
	b _0805C56A
	.align 2, 0
_0805C534: .4byte 0x020205AC
_0805C538: .4byte 0x02023E88
_0805C53C: .4byte 0x02023D08
_0805C540:
	ldr r1, _0805C570
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #0x30]
	ldrb r0, [r4]
	bl DoHitAnimHealthboxEffect
	ldr r1, _0805C574
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805C578
	str r1, [r0]
_0805C56A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C570: .4byte 0x0202415D
_0805C574: .4byte 0x03005AC0
_0805C578: .4byte 0x08059569
	thumb_func_end sub_0805C50C

	thumb_func_start sub_0805C57C
sub_0805C57C: @ 0x0805C57C
	push {lr}
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0805C57C

	thumb_func_start PlayerHandlePlaySE
PlayerHandlePlaySE: @ 0x0805C588
	push {r4, lr}
	ldr r4, _0805C5C4
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r3, #0x3f
	cmp r0, #0
	bne _0805C59C
	movs r3, #0xc0
_0805C59C:
	ldr r2, _0805C5C8
	ldrb r1, [r4]
	lsls r1, r1, #9
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	bl PlaySE12WithPanning
	bl PlayerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C5C4: .4byte 0x02023D08
_0805C5C8: .4byte 0x02022D08
	thumb_func_end PlayerHandlePlaySE

	thumb_func_start PlayerHandlePlayFanfareOrBGM
PlayerHandlePlayFanfareOrBGM: @ 0x0805C5CC
	push {r4, r5, lr}
	ldr r4, _0805C600
	ldr r5, _0805C604
	ldrb r0, [r5]
	lsls r3, r0, #9
	adds r0, r4, #3
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805C608
	bl BattleStopLowHpSound
	ldrb r1, [r5]
	lsls r1, r1, #9
	adds r0, r4, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r4, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayBGM
	b _0805C61C
	.align 2, 0
_0805C600: .4byte 0x02022D08
_0805C604: .4byte 0x02023D08
_0805C608:
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayFanfare
_0805C61C:
	bl PlayerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerHandlePlayFanfareOrBGM

	thumb_func_start PlayerHandleFaintingCry
PlayerHandleFaintingCry: @ 0x0805C628
	push {lr}
	ldr r1, _0805C65C
	ldr r0, _0805C660
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805C664
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	rsbs r1, r1, #0
	movs r2, #5
	bl PlayCry3
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0805C65C: .4byte 0x02023D12
_0805C660: .4byte 0x02023D08
_0805C664: .4byte 0x02024190
	thumb_func_end PlayerHandleFaintingCry

	thumb_func_start sub_0805C668
sub_0805C668: @ 0x0805C668
	push {lr}
	ldr r1, _0805C690
	ldr r0, _0805C694
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _0805C698
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0805C690: .4byte 0x02022D08
_0805C694: .4byte 0x02023D08
_0805C698: .4byte 0x020240A0
	thumb_func_end sub_0805C668

	thumb_func_start PlayerHandleIntroTrainerBallThrow
PlayerHandleIntroTrainerBallThrow: @ 0x0805C69C
	push {r4, r5, r6, r7, lr}
	ldr r6, _0805C7DC
	ldr r7, _0805C7E0
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0805C7E4
	adds r0, r0, r5
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x32
	strh r1, [r0, #0x2e]
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0805C7E8
	strh r1, [r0, #0x32]
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0805C7EC
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x38]
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0805C7F0
	bl StoreSpriteCallbackInData6
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, _0805C7F4
	bl AllocSpritePalette
	adds r4, r0, #0
	lsls r4, r4, #0x18
	ldr r1, _0805C7F8
	ldr r0, _0805C7FC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	lsrs r4, r4, #0x14
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r2, #0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, #5]
	ldr r0, _0805C800
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0805C804
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r7]
	strh r0, [r1, #8]
	ldr r3, _0805C808
	ldr r0, [r3]
	ldrb r2, [r7]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805C7BE
	ldr r0, _0805C80C
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, _0805C810
	str r1, [r0]
_0805C7BE:
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r0, [r2, #9]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #9]
	ldr r1, _0805C814
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805C818
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C7DC: .4byte 0x02023E88
_0805C7E0: .4byte 0x02023D08
_0805C7E4: .4byte 0x020205AC
_0805C7E8: .4byte 0x0000FFD8
_0805C7EC: .4byte 0x080A67B5
_0805C7F0: .4byte 0x0805C81D
_0805C7F4: .4byte 0x0000D6F8
_0805C7F8: .4byte 0x082D961C
_0805C7FC: .4byte 0x03005AF0
_0805C800: .4byte 0x0805C885
_0805C804: .4byte 0x03005B60
_0805C808: .4byte 0x02024174
_0805C80C: .4byte 0x02024158
_0805C810: .4byte 0x0807352D
_0805C814: .4byte 0x03005AC0
_0805C818: .4byte 0x08057069
	thumb_func_end PlayerHandleIntroTrainerBallThrow

	thumb_func_start sub_0805C81C
sub_0805C81C: @ 0x0805C81C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r4, [r5, #0x38]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl FreeSpriteOamMatrix
	ldrb r0, [r5, #5]
	lsrs r0, r0, #4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeSpritePaletteByTag
	adds r0, r5, #0
	bl DestroySprite
	ldr r1, _0805C874
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805C878
	adds r0, r0, r1
	adds r1, r4, #0
	bl BattleLoadPlayerMonSpriteGfx
	ldr r0, _0805C87C
	adds r4, r4, r0
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0805C880
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C874: .4byte 0x02023D12
_0805C878: .4byte 0x02024190
_0805C87C: .4byte 0x02023E88
_0805C880: .4byte 0x020205AC
	thumb_func_end sub_0805C81C

	thumb_func_start task05_08033660
task05_08033660: @ 0x0805C884
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _0805C8AC
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	bgt _0805C8B0
	adds r0, r2, #1
	strh r0, [r1, #0xa]
	b _0805C96C
	.align 2, 0
_0805C8AC: .4byte 0x03005B60
_0805C8B0:
	ldr r7, _0805C8F0
	ldrb r0, [r7]
	mov sb, r0
	ldrh r0, [r1, #8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C8D0
	ldr r0, _0805C8F4
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805C900
_0805C8D0:
	ldr r0, _0805C8F8
	ldrb r1, [r7]
	lsls r2, r1, #9
	adds r0, #1
	adds r2, r2, r0
	ldr r0, _0805C8FC
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_0805AE74
	b _0805C954
	.align 2, 0
_0805C8F0: .4byte 0x02023D08
_0805C8F4: .4byte 0x02022C90
_0805C8F8: .4byte 0x02022D08
_0805C8FC: .4byte 0x02023D12
_0805C900:
	ldr r4, _0805C978
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r4, #1
	adds r1, r1, r4
	ldr r5, _0805C97C
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_0805AE74
	ldrb r0, [r7]
	movs r6, #2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r1, r1, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0805C980
	adds r0, r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r7]
	movs r1, #0
	bl sub_0805AE74
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_0805C954:
	ldr r1, _0805C984
	ldr r2, _0805C988
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805C98C
	str r1, [r0]
	mov r3, sb
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_0805C96C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C978: .4byte 0x02022D08
_0805C97C: .4byte 0x02023D12
_0805C980: .4byte 0x02024190
_0805C984: .4byte 0x03005AC0
_0805C988: .4byte 0x02023D08
_0805C98C: .4byte 0x08058751
	thumb_func_end task05_08033660

	thumb_func_start PlayerHandleDrawPartyStatusSummary
PlayerHandleDrawPartyStatusSummary: @ 0x0805C990
	push {r4, r5, r6, lr}
	ldr r1, _0805C9B8
	ldr r0, _0805C9BC
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805C9C0
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805C9C0
	bl PlayerBufferExecCompleted
	b _0805CA34
	.align 2, 0
_0805C9B8: .4byte 0x02022D08
_0805C9BC: .4byte 0x02023D08
_0805C9C0:
	ldr r6, _0805CA3C
	ldr r0, [r6]
	ldr r5, _0805CA40
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, #9
	ldr r4, _0805CA44
	adds r1, r3, r4
	subs r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, #2
	adds r3, r3, r4
	ldrb r3, [r3]
	bl CreatePartyStatusSummarySprites
	ldr r2, _0805CA48
	ldrb r1, [r5]
	adds r1, r1, r2
	movs r3, #0
	strb r0, [r1]
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #5]
	ldrb r2, [r5]
	lsls r0, r2, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805CA28
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x5d
	strb r1, [r0, #5]
_0805CA28:
	ldr r0, _0805CA4C
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0805CA50
	str r0, [r1]
_0805CA34:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA3C: .4byte 0x02024174
_0805CA40: .4byte 0x02023D08
_0805CA44: .4byte 0x02022D0C
_0805CA48: .4byte 0x02024158
_0805CA4C: .4byte 0x03005AC0
_0805CA50: .4byte 0x0805CA55
	thumb_func_end PlayerHandleDrawPartyStatusSummary

	thumb_func_start sub_0805CA54
sub_0805CA54: @ 0x0805CA54
	push {r4, lr}
	ldr r4, _0805CA94
	ldr r0, [r4]
	ldr r3, _0805CA98
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	adds r2, r1, #1
	strb r2, [r0, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0x5c
	bls _0805CA8C
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #5]
	bl PlayerBufferExecCompleted
_0805CA8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA94: .4byte 0x02024174
_0805CA98: .4byte 0x02023D08
	thumb_func_end sub_0805CA54

	thumb_func_start PlayerHandleHidePartyStatusSummary
PlayerHandleHidePartyStatusSummary: @ 0x0805CA9C
	push {lr}
	ldr r0, _0805CAD8
	ldr r1, [r0]
	ldr r0, _0805CADC
	ldrb r3, [r0]
	ldr r1, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805CACE
	ldr r2, _0805CAE0
	ldr r0, _0805CAE4
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _0805CAE8
	str r1, [r0]
_0805CACE:
	bl PlayerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0805CAD8: .4byte 0x02024174
_0805CADC: .4byte 0x02023D08
_0805CAE0: .4byte 0x03005B60
_0805CAE4: .4byte 0x02024158
_0805CAE8: .4byte 0x0807352D
	thumb_func_end PlayerHandleHidePartyStatusSummary

	thumb_func_start PlayerHandleEndBounceEffect
PlayerHandleEndBounceEffect: @ 0x0805CAEC
	push {r4, lr}
	ldr r4, _0805CB0C
	ldrb r0, [r4]
	movs r1, #1
	bl EndBounceEffect
	ldrb r0, [r4]
	movs r1, #0
	bl EndBounceEffect
	bl PlayerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB0C: .4byte 0x02023D08
	thumb_func_end PlayerHandleEndBounceEffect

	thumb_func_start PlayerHandleSpriteInvisibility
PlayerHandleSpriteInvisibility: @ 0x0805CB10
	push {r4, lr}
	ldr r4, _0805CB60
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805CB56
	ldr r3, _0805CB64
	ldr r0, _0805CB68
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _0805CB6C
	lsls r1, r1, #9
	adds r0, #1
	adds r1, r1, r0
	adds r2, #0x3e
	movs r0, #1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl CopyBattleSpriteInvisibility
_0805CB56:
	bl PlayerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB60: .4byte 0x02023D08
_0805CB64: .4byte 0x020205AC
_0805CB68: .4byte 0x02023E88
_0805CB6C: .4byte 0x02022D08
	thumb_func_end PlayerHandleSpriteInvisibility

	thumb_func_start PlayerHandleBattleAnimation
PlayerHandleBattleAnimation: @ 0x0805CB70
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _0805CBB8
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805CBD2
	ldr r4, _0805CBBC
	ldrb r2, [r5]
	lsls r1, r2, #9
	adds r0, r4, #1
	adds r0, r1, r0
	ldrb r6, [r0]
	adds r0, r4, #2
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r4, #3
	adds r1, r1, r4
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r3, r0
	str r3, [sp]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r3, r6, #0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805CBC0
	bl PlayerBufferExecCompleted
	b _0805CBCC
	.align 2, 0
_0805CBB8: .4byte 0x02023D08
_0805CBBC: .4byte 0x02022D08
_0805CBC0:
	ldr r0, _0805CBDC
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0805CBE0
	str r0, [r1]
_0805CBCC:
	adds r0, r6, #0
	bl BattleTv_SetDataBasedOnAnimation
_0805CBD2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CBDC: .4byte 0x03005AC0
_0805CBE0: .4byte 0x080599AD
	thumb_func_end PlayerHandleBattleAnimation

	thumb_func_start PlayerHandleLinkStandbyMsg
PlayerHandleLinkStandbyMsg: @ 0x0805CBE4
	push {r4, r5, lr}
	ldr r5, _0805CC0C
	ldrb r0, [r5]
	lsls r0, r0, #9
	ldr r4, _0805CC10
	adds r0, r0, r4
	bl sub_08185008
	ldrb r0, [r5]
	lsls r0, r0, #9
	subs r4, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805CC1E
	cmp r0, #1
	bgt _0805CC14
	cmp r0, #0
	beq _0805CC1A
	b _0805CC3C
	.align 2, 0
_0805CC0C: .4byte 0x02023D08
_0805CC10: .4byte 0x02022D0A
_0805CC14:
	cmp r0, #2
	beq _0805CC38
	b _0805CC3C
_0805CC1A:
	bl PrintLinkStandbyMsg
_0805CC1E:
	ldr r4, _0805CC34
	ldrb r0, [r4]
	movs r1, #1
	bl EndBounceEffect
	ldrb r0, [r4]
	movs r1, #0
	bl EndBounceEffect
	b _0805CC3C
	.align 2, 0
_0805CC34: .4byte 0x02023D08
_0805CC38:
	bl PrintLinkStandbyMsg
_0805CC3C:
	bl PlayerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerHandleLinkStandbyMsg

	thumb_func_start PlayerHandleResetActionMoveSelection
PlayerHandleResetActionMoveSelection: @ 0x0805CC48
	push {r4, lr}
	ldr r1, _0805CC68
	ldr r4, _0805CC6C
	ldrb r3, [r4]
	lsls r0, r3, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r2, [r0]
	cmp r2, #1
	beq _0805CC90
	cmp r2, #1
	bgt _0805CC70
	cmp r2, #0
	beq _0805CC76
	b _0805CCA0
	.align 2, 0
_0805CC68: .4byte 0x02022D08
_0805CC6C: .4byte 0x02023D08
_0805CC70:
	cmp r2, #2
	beq _0805CC98
	b _0805CCA0
_0805CC76:
	ldr r0, _0805CC88
	adds r0, r3, r0
	strb r2, [r0]
	ldr r1, _0805CC8C
	ldrb r0, [r4]
	adds r0, r0, r1
	strb r2, [r0]
	b _0805CCA0
	.align 2, 0
_0805CC88: .4byte 0x02024150
_0805CC8C: .4byte 0x02024154
_0805CC90:
	ldr r0, _0805CC94
	b _0805CC9A
	.align 2, 0
_0805CC94: .4byte 0x02024150
_0805CC98:
	ldr r0, _0805CCAC
_0805CC9A:
	adds r0, r3, r0
	movs r1, #0
	strb r1, [r0]
_0805CCA0:
	bl PlayerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CCAC: .4byte 0x02024154
	thumb_func_end PlayerHandleResetActionMoveSelection

	thumb_func_start PlayerHandleCmd55
PlayerHandleCmd55: @ 0x0805CCB0
	push {r4, r5, lr}
	ldr r5, _0805CD14
	ldrb r0, [r5]
	lsls r0, r0, #9
	ldr r4, _0805CD18
	adds r0, r0, r4
	bl sub_08185008
	ldr r2, _0805CD1C
	ldrb r0, [r5]
	lsls r0, r0, #9
	subs r1, r4, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _0805CD20
	ldr r3, [r0]
	ldrb r0, [r5]
	lsls r0, r0, #9
	subs r4, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0805CD24
	adds r3, r3, r1
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #5
	bl FadeOutMapMusic
	movs r0, #3
	bl BeginFastPaletteFade
	bl PlayerBufferExecCompleted
	ldr r1, _0805CD28
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0805CD2C
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CD14: .4byte 0x02023D08
_0805CD18: .4byte 0x02022D0C
_0805CD1C: .4byte 0x02023FDE
_0805CD20: .4byte 0x03005AF0
_0805CD24: .4byte 0x00000CA9
_0805CD28: .4byte 0x03005AC0
_0805CD2C: .4byte 0x080583C1
	thumb_func_end PlayerHandleCmd55

	thumb_func_start PlayerCmdEnd
PlayerCmdEnd: @ 0x0805CD30
	bx lr
	.align 2, 0
	thumb_func_end PlayerCmdEnd

