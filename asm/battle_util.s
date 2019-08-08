.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetBattlerForBattleScript
GetBattlerForBattleScript: @ 0x0803F00C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #0
	cmp r1, #0xe
	bhi _0803F0BA
	lsls r0, r1, #2
	ldr r1, _0803F024
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F024: .4byte 0x0803F028
_0803F028: @ jump table
	.4byte _0803F064 @ case 0
	.4byte _0803F070 @ case 1
	.4byte _0803F07C @ case 2
	.4byte _0803F098 @ case 3
	.4byte _0803F0A4 @ case 4
	.4byte _0803F098 @ case 5
	.4byte _0803F0A4 @ case 6
	.4byte _0803F088 @ case 7
	.4byte _0803F0A4 @ case 8
	.4byte _0803F0A4 @ case 9
	.4byte _0803F08C @ case 10
	.4byte _0803F0A4 @ case 11
	.4byte _0803F0A8 @ case 12
	.4byte _0803F0AC @ case 13
	.4byte _0803F0B0 @ case 14
_0803F064:
	ldr r0, _0803F06C
	ldrb r0, [r0]
	b _0803F0BA
	.align 2, 0
_0803F06C: .4byte 0x02023EB0
_0803F070:
	ldr r0, _0803F078
	ldrb r0, [r0]
	b _0803F0BA
	.align 2, 0
_0803F078: .4byte 0x02023EAF
_0803F07C:
	ldr r0, _0803F084
	ldrb r0, [r0]
	b _0803F0BA
	.align 2, 0
_0803F084: .4byte 0x02023EB2
_0803F088:
	movs r0, #0
	b _0803F0BA
_0803F08C:
	ldr r0, _0803F094
	ldrb r0, [r0, #0x17]
	b _0803F0BA
	.align 2, 0
_0803F094: .4byte 0x02024118
_0803F098:
	ldr r0, _0803F0A0
	ldrb r0, [r0]
	b _0803F0BA
	.align 2, 0
_0803F0A0: .4byte 0x02023EB1
_0803F0A4:
	movs r0, #0
	b _0803F0B2
_0803F0A8:
	movs r0, #1
	b _0803F0B2
_0803F0AC:
	movs r0, #2
	b _0803F0B2
_0803F0B0:
	movs r0, #3
_0803F0B2:
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0803F0BA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattlerForBattleScript

	thumb_func_start PressurePPLose
PressurePPLose: @ 0x0803F0C0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _0803F0F0
	movs r4, #0x58
	muls r0, r4, r0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	mov ip, r1
	cmp r0, #0x2e
	bne _0803F172
	movs r3, #0
	adds r0, r5, #0
	muls r0, r4, r0
	adds r1, #0xc
	adds r1, r0, r1
	b _0803F0FC
	.align 2, 0
_0803F0F0: .4byte 0x02023D28
_0803F0F4:
	adds r1, #2
	adds r3, #1
	cmp r3, #3
	bgt _0803F102
_0803F0FC:
	ldrh r0, [r1]
	cmp r0, r2
	bne _0803F0F4
_0803F102:
	cmp r3, #4
	beq _0803F172
	movs r7, #0x58
	adds r2, r5, #0
	muls r2, r7, r2
	adds r0, r3, r2
	mov r6, ip
	adds r6, #0x24
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F11E
	subs r0, #1
	strb r0, [r1]
_0803F11E:
	mov r0, ip
	adds r0, #0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	bne _0803F172
	ldr r1, _0803F17C
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x18]
	lsrs r1, r1, #4
	ldr r2, _0803F180
	lsls r0, r3, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0803F172
	ldr r4, _0803F184
	strb r5, [r4]
	adds r1, r3, #0
	adds r1, #9
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r4]
	muls r0, r7, r0
	adds r0, r0, r6
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #1
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803F172:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F17C: .4byte 0x02023F60
_0803F180: .4byte 0x082FACB4
_0803F184: .4byte 0x02023D08
	thumb_func_end PressurePPLose

	thumb_func_start PressurePPLoseOnUsingImprison
PressurePPLoseOnUsingImprison: @ 0x0803F188
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #4
	mov r8, r0
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r4, #0
	ldr r0, _0803F2A8
	ldrb r0, [r0]
	cmp r4, r0
	bge _0803F230
	ldr r1, _0803F2AC
	movs r0, #0x58
	adds r7, r5, #0
	muls r7, r0, r7
	adds r1, #0xc
	mov sl, r1
_0803F1BE:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r4, #1
	cmp sb, r0
	beq _0803F226
	ldr r0, _0803F2AC
	movs r3, #0x58
	adds r1, r4, #0
	muls r1, r3, r1
	adds r1, r1, r0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0x2e
	bne _0803F226
	movs r2, #0
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r4, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x8f
	lsls r1, r1, #1
	cmp r0, r1
	beq _0803F20E
	adds r3, r1, #0
	mov r0, sl
	adds r1, r7, r0
_0803F200:
	adds r1, #2
	adds r2, #1
	cmp r2, #3
	bgt _0803F20E
	ldrh r0, [r1]
	cmp r0, r3
	bne _0803F200
_0803F20E:
	cmp r2, #4
	beq _0803F226
	mov r8, r2
	adds r1, r2, r7
	adds r0, r4, #0
	adds r0, #0x24
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F226
	subs r0, #1
	strb r0, [r1]
_0803F226:
	adds r4, r6, #0
	ldr r0, _0803F2A8
	ldrb r0, [r0]
	cmp r4, r0
	blt _0803F1BE
_0803F230:
	mov r1, r8
	cmp r1, #4
	beq _0803F298
	ldr r6, _0803F2AC
	movs r3, #0x58
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r6, #0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	bne _0803F298
	ldr r1, _0803F2B0
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x18]
	lsrs r1, r1, #4
	ldr r2, _0803F2B4
	mov r4, r8
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0803F298
	ldr r4, _0803F2B8
	strb r5, [r4]
	mov r1, r8
	adds r1, #9
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r4]
	muls r0, r3, r0
	adds r2, r6, #0
	adds r2, #0x24
	adds r0, r0, r2
	add r0, r8
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #1
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803F298:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F2A8: .4byte 0x02023D10
_0803F2AC: .4byte 0x02023D28
_0803F2B0: .4byte 0x02023F60
_0803F2B4: .4byte 0x082FACB4
_0803F2B8: .4byte 0x02023D08
	thumb_func_end PressurePPLoseOnUsingImprison

	thumb_func_start PressurePPLoseOnUsingPerishSong
PressurePPLoseOnUsingPerishSong: @ 0x0803F2BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r6, #4
	movs r1, #0
	ldr r0, _0803F3B4
	mov r8, r0
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803F33E
	ldr r7, _0803F3B8
	movs r2, #0x58
	mov ip, r2
	mov r5, ip
	muls r5, r3, r5
	adds r0, r7, #0
	adds r0, #0xc
	adds r2, r5, r0
	mov sl, r2
	mov sb, r5
_0803F2EE:
	mov r0, ip
	muls r0, r1, r0
	adds r0, r0, r7
	adds r0, #0x20
	ldrb r0, [r0]
	adds r4, r1, #1
	cmp r0, #0x2e
	bne _0803F334
	cmp r1, r3
	beq _0803F334
	movs r2, #0
	mov r1, sl
	ldrh r0, [r1]
	cmp r0, #0xc3
	beq _0803F31E
	ldr r1, _0803F3BC
	add r1, sb
_0803F310:
	adds r1, #2
	adds r2, #1
	cmp r2, #3
	bgt _0803F31E
	ldrh r0, [r1]
	cmp r0, #0xc3
	bne _0803F310
_0803F31E:
	cmp r2, #4
	beq _0803F334
	adds r6, r2, #0
	adds r0, r6, r5
	ldr r2, _0803F3C0
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F334
	subs r0, #1
	strb r0, [r1]
_0803F334:
	adds r1, r4, #0
	mov r0, r8
	ldrb r0, [r0]
	cmp r1, r0
	blt _0803F2EE
_0803F33E:
	cmp r6, #4
	beq _0803F3A2
	ldr r7, _0803F3B8
	movs r5, #0x58
	adds r0, r3, #0
	muls r0, r5, r0
	adds r1, r7, #0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	bne _0803F3A2
	ldr r1, _0803F3C4
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x18]
	lsrs r1, r1, #4
	ldr r2, _0803F3C8
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0803F3A2
	ldr r4, _0803F3CC
	strb r3, [r4]
	adds r1, r6, #0
	adds r1, #9
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r4]
	muls r0, r5, r0
	adds r2, r7, #0
	adds r2, #0x24
	adds r0, r0, r2
	adds r0, r0, r6
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #1
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0803F3A2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F3B4: .4byte 0x02023D10
_0803F3B8: .4byte 0x02023D28
_0803F3BC: .4byte 0x02023D34
_0803F3C0: .4byte 0x02023D4C
_0803F3C4: .4byte 0x02023F60
_0803F3C8: .4byte 0x082FACB4
_0803F3CC: .4byte 0x02023D08
	thumb_func_end PressurePPLoseOnUsingPerishSong

	thumb_func_start MarkAllBattlersForControllerExec
MarkAllBattlersForControllerExec: @ 0x0803F3D0
	push {r4, r5, lr}
	ldr r0, _0803F400
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F410
	movs r2, #0
	ldr r4, _0803F404
	ldrb r0, [r4]
	cmp r2, r0
	bge _0803F42E
	ldr r3, _0803F408
	ldr r5, _0803F40C
_0803F3EC:
	ldm r5!, {r1}
	lsls r1, r1, #0x1c
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r2, #1
	ldrb r0, [r4]
	cmp r2, r0
	blt _0803F3EC
	b _0803F42E
	.align 2, 0
_0803F400: .4byte 0x02022C90
_0803F404: .4byte 0x02023D10
_0803F408: .4byte 0x02023D0C
_0803F40C: .4byte 0x082FACB4
_0803F410:
	movs r2, #0
	ldr r4, _0803F434
	ldrb r0, [r4]
	cmp r2, r0
	bge _0803F42E
	ldr r3, _0803F438
	ldr r5, _0803F43C
_0803F41E:
	ldr r0, [r3]
	ldm r5!, {r1}
	orrs r0, r1
	str r0, [r3]
	adds r2, #1
	ldrb r0, [r4]
	cmp r2, r0
	blt _0803F41E
_0803F42E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F434: .4byte 0x02023D10
_0803F438: .4byte 0x02023D0C
_0803F43C: .4byte 0x082FACB4
	thumb_func_end MarkAllBattlersForControllerExec

	thumb_func_start MarkBattlerForControllerExec
MarkBattlerForControllerExec: @ 0x0803F440
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0803F468
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F474
	ldr r2, _0803F46C
	ldr r1, _0803F470
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _0803F484
	.align 2, 0
_0803F468: .4byte 0x02022C90
_0803F46C: .4byte 0x02023D0C
_0803F470: .4byte 0x082FACB4
_0803F474:
	ldr r2, _0803F488
	ldr r1, _0803F48C
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_0803F484:
	pop {r0}
	bx r0
	.align 2, 0
_0803F488: .4byte 0x02023D0C
_0803F48C: .4byte 0x082FACB4
	thumb_func_end MarkBattlerForControllerExec

	thumb_func_start sub_0803F490
sub_0803F490: @ 0x0803F490
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r4, #0
	ldr r5, _0803F4A4
	ldr r1, _0803F4A8
	lsls r0, r7, #2
	adds r6, r0, r1
	b _0803F4BA
	.align 2, 0
_0803F4A4: .4byte 0x02023D0C
_0803F4A8: .4byte 0x082FACB4
_0803F4AC:
	lsls r0, r4, #2
	ldr r1, [r6]
	lsls r1, r0
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	adds r4, #1
_0803F4BA:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0803F4AC
	ldr r2, _0803F4DC
	movs r1, #0x80
	lsls r1, r1, #0x15
	lsls r1, r7
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F4DC: .4byte 0x02023D0C
	thumb_func_end sub_0803F490

	thumb_func_start CancelMultiTurnMoves
CancelMultiTurnMoves: @ 0x0803F4E0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803F530
	movs r2, #0x58
	adds r3, r0, #0
	muls r3, r2, r3
	adds r1, #0x50
	adds r3, r3, r1
	ldr r1, [r3]
	ldr r2, _0803F534
	ands r1, r2
	ldr r2, _0803F538
	ands r1, r2
	movs r2, #0x71
	rsbs r2, r2, #0
	ands r1, r2
	ldr r2, _0803F53C
	ands r1, r2
	str r1, [r3]
	ldr r1, _0803F540
	lsls r2, r0, #2
	adds r2, r2, r1
	ldr r1, [r2]
	ldr r3, _0803F544
	ands r1, r3
	str r1, [r2]
	ldr r2, _0803F548
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x11]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x11]
	movs r0, #0
	strb r0, [r1, #0x10]
	bx lr
	.align 2, 0
_0803F530: .4byte 0x02023D28
_0803F534: .4byte 0xFFFFEFFF
_0803F538: .4byte 0xFFFFF3FF
_0803F53C: .4byte 0xFFFFFCFF
_0803F540: .4byte 0x02023F50
_0803F544: .4byte 0xFFFBFF3F
_0803F548: .4byte 0x02023F60
	thumb_func_end CancelMultiTurnMoves

	thumb_func_start WasUnableToUseMove
WasUnableToUseMove: @ 0x0803F54C
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _0803F598
	lsrs r0, r0, #0x14
	adds r1, r0, r1
	ldrb r0, [r1]
	lsrs r0, r0, #7
	cmp r0, #0
	bne _0803F592
	ldrb r2, [r1, #1]
	lsls r0, r2, #0x1e
	cmp r0, #0
	blt _0803F592
	lsls r0, r2, #0x1a
	cmp r0, #0
	blt _0803F592
	lsls r0, r2, #0x19
	cmp r0, #0
	blt _0803F592
	lsrs r0, r2, #7
	cmp r0, #0
	bne _0803F592
	ldrb r1, [r1, #2]
	lsls r0, r1, #0x1f
	cmp r0, #0
	bne _0803F592
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _0803F592
	lsls r0, r1, #0x1d
	cmp r0, #0
	blt _0803F592
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq _0803F59C
_0803F592:
	movs r0, #1
	b _0803F59E
	.align 2, 0
_0803F598: .4byte 0x02023FE0
_0803F59C:
	movs r0, #0
_0803F59E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WasUnableToUseMove

	thumb_func_start PrepareStringBattle
PrepareStringBattle: @ 0x0803F5A4
	push {r4, lr}
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _0803F5C4
	strb r1, [r4]
	movs r0, #0
	adds r1, r2, #0
	bl BtlController_EmitPrintString
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F5C4: .4byte 0x02023D08
	thumb_func_end PrepareStringBattle

	thumb_func_start ResetSentPokesToOpponentValue
ResetSentPokesToOpponentValue: @ 0x0803F5C8
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r0, _0803F61C
	strb r3, [r0]
	strb r3, [r0, #1]
	movs r1, #0
	ldr r0, _0803F620
	ldrb r2, [r0]
	adds r6, r0, #0
	cmp r1, r2
	bge _0803F5F6
	ldr r5, _0803F624
	adds r4, r2, #0
	ldr r2, _0803F628
_0803F5E4:
	ldrh r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	orrs r3, r0
	adds r2, #4
	adds r1, #2
	cmp r1, r4
	blt _0803F5E4
_0803F5F6:
	movs r1, #1
	adds r2, r6, #0
	ldrb r0, [r2]
	cmp r1, r0
	bge _0803F616
	ldr r5, _0803F61C
	movs r4, #2
_0803F604:
	adds r0, r1, #0
	ands r0, r4
	asrs r0, r0, #1
	adds r0, r0, r5
	strb r3, [r0]
	adds r1, #2
	ldrb r0, [r2]
	cmp r1, r0
	blt _0803F604
_0803F616:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F61C: .4byte 0x020240A2
_0803F620: .4byte 0x02023D10
_0803F624: .4byte 0x082FACB4
_0803F628: .4byte 0x02023D12
	thumb_func_end ResetSentPokesToOpponentValue

	thumb_func_start sub_0803F62C
sub_0803F62C: @ 0x0803F62C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0803F690
	movs r0, #2
	ands r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	mov ip, r0
	ldr r1, _0803F69C
	adds r0, r0, r1
	strb r4, [r0]
	adds r5, r4, #0
	ldr r0, _0803F6A0
	ldrb r2, [r0]
	mov r8, r1
	cmp r4, r2
	bge _0803F68A
	ldr r0, _0803F6A4
	ldrb r7, [r0]
	ldr r1, _0803F6A8
	adds r6, r2, #0
	ldr r3, _0803F6AC
	adds r2, r1, #0
_0803F66E:
	ldr r0, [r2]
	ands r0, r7
	cmp r0, #0
	bne _0803F680
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	orrs r4, r0
_0803F680:
	adds r3, #4
	adds r2, #8
	adds r5, #2
	cmp r5, r6
	blt _0803F66E
_0803F68A:
	mov r0, ip
	add r0, r8
	strb r4, [r0]
_0803F690:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F69C: .4byte 0x020240A2
_0803F6A0: .4byte 0x02023D10
_0803F6A4: .4byte 0x02023EB4
_0803F6A8: .4byte 0x082FACB4
_0803F6AC: .4byte 0x02023D12
	thumb_func_end sub_0803F62C

	thumb_func_start sub_0803F6B0
sub_0803F6B0: @ 0x0803F6B0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0803F6CC
	adds r0, r4, #0
	bl sub_0803F62C
	b _0803F702
_0803F6CC:
	movs r3, #1
	ldr r5, _0803F708
	ldrb r0, [r5]
	cmp r3, r0
	bge _0803F702
	ldr r0, _0803F70C
	mov ip, r0
	movs r7, #2
	ldr r6, _0803F710
	ldr r1, _0803F714
	lsls r0, r4, #1
	adds r4, r0, r1
_0803F6E4:
	adds r2, r3, #0
	ands r2, r7
	asrs r2, r2, #1
	add r2, ip
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r3, #1
	ldrb r0, [r5]
	cmp r3, r0
	blt _0803F6E4
_0803F702:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F708: .4byte 0x02023D10
_0803F70C: .4byte 0x020240A2
_0803F710: .4byte 0x082FACB4
_0803F714: .4byte 0x02023D12
	thumb_func_end sub_0803F6B0

	thumb_func_start BattleScriptPush
BattleScriptPush: @ 0x0803F718
	push {r4, lr}
	ldr r1, _0803F738
	ldr r1, [r1]
	ldr r3, [r1, #8]
	adds r4, r3, #0
	adds r4, #0x20
	ldrb r1, [r4]
	adds r2, r1, #1
	strb r2, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	adds r3, r3, r1
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F738: .4byte 0x0202414C
	thumb_func_end BattleScriptPush

	thumb_func_start BattleScriptPushCursor
BattleScriptPushCursor: @ 0x0803F73C
	ldr r0, _0803F75C
	ldr r0, [r0]
	ldr r2, [r0, #8]
	adds r3, r2, #0
	adds r3, #0x20
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r2, r2, r0
	ldr r0, _0803F760
	ldr r0, [r0]
	str r0, [r2]
	bx lr
	.align 2, 0
_0803F75C: .4byte 0x0202414C
_0803F760: .4byte 0x02023EB8
	thumb_func_end BattleScriptPushCursor

	thumb_func_start HandleAction_RunBattleScript
HandleAction_RunBattleScript: @ 0x0803F764
	ldr r3, _0803F784
	ldr r0, _0803F788
	ldr r0, [r0]
	ldr r1, [r0, #8]
	adds r2, r1, #0
	adds r2, #0x20
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r3]
	bx lr
	.align 2, 0
_0803F784: .4byte 0x02023EB8
_0803F788: .4byte 0x0202414C
	thumb_func_end HandleAction_RunBattleScript

	thumb_func_start TrySetCantSelectMoveBattleScript
TrySetCantSelectMoveBattleScript: @ 0x0803F78C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	ldr r2, _0803F80C
	ldr r1, _0803F810
	ldr r3, _0803F814
	ldrb r4, [r3]
	lsls r0, r4, #9
	adds r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	movs r1, #0x58
	muls r1, r4, r1
	adds r0, r0, r1
	adds r2, #0xc
	adds r0, r0, r2
	ldrh r5, [r0]
	ldr r1, _0803F818
	lsls r0, r4, #1
	adds r0, #0xc8
	ldr r1, [r1]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _0803F81C
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r7, r3, #0
	adds r3, r1, #0
	cmp r0, r5
	bne _0803F846
	cmp r5, #0
	beq _0803F846
	ldr r0, _0803F820
	strb r4, [r0, #0x17]
	ldr r0, _0803F824
	strh r5, [r0]
	ldr r0, _0803F828
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0803F838
	ldr r1, _0803F82C
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803F830
	str r1, [r0]
	ldr r0, _0803F834
	ldrb r1, [r7]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1, #2]
	b _0803F846
	.align 2, 0
_0803F80C: .4byte 0x02023D28
_0803F810: .4byte 0x02023508
_0803F814: .4byte 0x02023D08
_0803F818: .4byte 0x02024140
_0803F81C: .4byte 0x02023F60
_0803F820: .4byte 0x02024118
_0803F824: .4byte 0x02023E8E
_0803F828: .4byte 0x02022C90
_0803F82C: .4byte 0x02023ED4
_0803F830: .4byte 0x082893B2
_0803F834: .4byte 0x02023FE0
_0803F838:
	ldr r0, _0803F89C
	ldrb r1, [r7]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0803F8A0
	str r0, [r1]
	movs r6, #1
_0803F846:
	ldr r1, _0803F8A4
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	bne _0803F8D0
	cmp r5, #0xa5
	beq _0803F8D0
	ldr r1, _0803F8A8
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _0803F8D0
	adds r0, r2, #0
	bl CancelMultiTurnMoves
	ldr r0, _0803F8AC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0803F8BC
	ldr r1, _0803F8B0
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803F8B4
	str r1, [r0]
	ldr r0, _0803F8B8
	ldrb r1, [r7]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1, #2]
	b _0803F8CE
	.align 2, 0
_0803F89C: .4byte 0x02023EC4
_0803F8A0: .4byte 0x082893A7
_0803F8A4: .4byte 0x02023EEC
_0803F8A8: .4byte 0x02023D28
_0803F8AC: .4byte 0x02022C90
_0803F8B0: .4byte 0x02023ED4
_0803F8B4: .4byte 0x08289620
_0803F8B8: .4byte 0x02023FE0
_0803F8BC:
	ldr r1, _0803F924
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803F928
	str r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803F8CE:
	ldr r3, _0803F92C
_0803F8D0:
	ldrb r0, [r7]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r1, #0x13]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _0803F95A
	ldr r0, _0803F930
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0803F95A
	ldr r0, _0803F934
	strh r5, [r0]
	ldr r0, _0803F938
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0803F948
	ldr r1, _0803F93C
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803F940
	str r1, [r0]
	ldr r0, _0803F944
	ldrb r1, [r7]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1, #2]
	b _0803F95A
	.align 2, 0
_0803F924: .4byte 0x02023EC4
_0803F928: .4byte 0x08289611
_0803F92C: .4byte 0x02023F60
_0803F930: .4byte 0x082ED220
_0803F934: .4byte 0x02023E8E
_0803F938: .4byte 0x02022C90
_0803F93C: .4byte 0x02023ED4
_0803F940: .4byte 0x08289637
_0803F944: .4byte 0x02023FE0
_0803F948:
	ldr r1, _0803F99C
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803F9A0
	str r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803F95A:
	ldr r4, _0803F9A4
	ldrb r0, [r4]
	adds r1, r5, #0
	bl GetImprisonedMovesCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F9CE
	ldr r0, _0803F9A8
	strh r5, [r0]
	ldr r0, _0803F9AC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0803F9BC
	ldr r1, _0803F9B0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803F9B4
	str r1, [r0]
	ldr r0, _0803F9B8
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1, #2]
	b _0803F9CE
	.align 2, 0
_0803F99C: .4byte 0x02023EC4
_0803F9A0: .4byte 0x08289628
_0803F9A4: .4byte 0x02023D08
_0803F9A8: .4byte 0x02023E8E
_0803F9AC: .4byte 0x02022C90
_0803F9B0: .4byte 0x02023ED4
_0803F9B4: .4byte 0x0828970D
_0803F9B8: .4byte 0x02023FE0
_0803F9BC:
	ldr r1, _0803F9F0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803F9F4
	str r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803F9CE:
	ldr r1, _0803F9F8
	ldr r0, _0803F9FC
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, r0, r1
	ldrh r0, [r1, #0x2e]
	cmp r0, #0xaf
	bne _0803FA04
	ldr r1, _0803FA00
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0, #7]
	b _0803FA0E
	.align 2, 0
_0803F9F0: .4byte 0x02023EC4
_0803F9F4: .4byte 0x08289709
_0803F9F8: .4byte 0x02023D28
_0803F9FC: .4byte 0x02023D08
_0803FA00: .4byte 0x020240A8
_0803FA04:
	ldrh r0, [r1, #0x2e]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803FA0E:
	ldr r2, _0803FA68
	ldr r1, _0803FA6C
	ldrb r0, [r1]
	strb r0, [r2]
	ldr r0, _0803FA70
	mov ip, r0
	adds r7, r1, #0
	cmp r4, #0x1d
	bne _0803FA98
	mov r0, r8
	ldrh r1, [r0]
	adds r2, r1, #0
	cmp r2, #0
	beq _0803FA98
	ldr r0, _0803FA74
	cmp r2, r0
	beq _0803FA98
	cmp r2, r5
	beq _0803FA98
	ldr r0, _0803FA78
	strh r1, [r0]
	ldr r2, _0803FA7C
	ldrb r1, [r7]
	movs r0, #0x58
	muls r0, r1, r0
	add r0, ip
	ldrh r0, [r0, #0x2e]
	strh r0, [r2]
	ldr r0, _0803FA80
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r1, r0
	ldrb r2, [r7]
	cmp r1, #0
	beq _0803FA88
	ldr r0, _0803FA84
	lsls r1, r2, #4
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1, #2]
	b _0803FA98
	.align 2, 0
_0803FA68: .4byte 0x02023EB3
_0803FA6C: .4byte 0x02023D08
_0803FA70: .4byte 0x02023D28
_0803FA74: .4byte 0x0000FFFF
_0803FA78: .4byte 0x02023E8E
_0803FA7C: .4byte 0x02023EAC
_0803FA80: .4byte 0x02022C90
_0803FA84: .4byte 0x02023FE0
_0803FA88:
	ldr r1, _0803FAD4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _0803FAD8
	str r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803FA98:
	ldr r0, _0803FADC
	ldrb r3, [r7]
	lsls r1, r3, #9
	adds r0, #2
	adds r1, r1, r0
	movs r0, #0x58
	muls r0, r3, r0
	ldrb r1, [r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x24
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803FAF8
	ldr r0, _0803FAE0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0803FAE8
	ldr r0, _0803FAE4
	lsls r1, r3, #4
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1, #2]
	b _0803FAF8
	.align 2, 0
_0803FAD4: .4byte 0x02023EC4
_0803FAD8: .4byte 0x08289D9A
_0803FADC: .4byte 0x02023508
_0803FAE0: .4byte 0x02022C90
_0803FAE4: .4byte 0x02023FE0
_0803FAE8:
	ldr r1, _0803FB04
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, _0803FB08
	str r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803FAF8:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803FB04: .4byte 0x02023EC4
_0803FB08: .4byte 0x082895FE
	thumb_func_end TrySetCantSelectMoveBattleScript

	thumb_func_start CheckMoveLimitations
CheckMoveLimitations: @ 0x0803FB0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	ldr r1, _0803FB50
	lsls r0, r7, #1
	adds r0, #0xc8
	ldr r1, [r1]
	adds r1, r1, r0
	str r1, [sp, #4]
	ldr r1, _0803FB54
	movs r0, #0x58
	muls r0, r7, r0
	adds r1, r0, r1
	ldrh r0, [r1, #0x2e]
	cmp r0, #0xaf
	bne _0803FB5C
	ldr r2, _0803FB58
	lsls r1, r7, #3
	subs r0, r1, r7
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #7]
	str r0, [sp]
	b _0803FB6E
	.align 2, 0
_0803FB50: .4byte 0x02024140
_0803FB54: .4byte 0x02023D28
_0803FB58: .4byte 0x020240A8
_0803FB5C:
	ldrh r0, [r1, #0x2e]
	str r3, [sp, #0x14]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r7, #3
	ldr r3, [sp, #0x14]
_0803FB6E:
	ldr r0, _0803FCE8
	strb r7, [r0]
	movs r0, #0
	mov sb, r0
	lsls r2, r7, #1
	str r2, [sp, #0xc]
	ldr r5, _0803FCEC
	mov ip, r5
	ldr r0, _0803FCF0
	movs r2, #0x58
	adds r6, r7, #0
	muls r6, r2, r6
	str r6, [sp, #8]
	ldr r2, _0803FCF4
	adds r5, r6, r2
	movs r6, #0
	str r6, [sp, #0x10]
	mov sl, r0
	subs r0, r1, r7
	lsls r0, r0, #2
	mov r8, r0
	ldr r6, _0803FCF8
_0803FB9A:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0803FBB0
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0803FBB0
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0803FBB0:
	ldr r0, [sp, #8]
	add r0, sb
	mov r1, sl
	adds r1, #0x24
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803FBD0
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0803FBD0
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0803FBD0:
	mov r1, r8
	add r1, ip
	ldrh r0, [r5]
	ldrh r1, [r1, #4]
	cmp r0, r1
	bne _0803FBEC
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _0803FBEC
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0803FBEC:
	movs r0, #0x58
	adds r2, r7, #0
	muls r2, r0, r2
	ldr r1, [sp, #0x10]
	adds r0, r1, r2
	ldr r1, _0803FCF4
	adds r0, r0, r1
	mov ip, r0
	ldr r1, _0803FCFC
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	str r1, [sp, #0x18]
	mov r1, ip
	ldrh r1, [r1]
	mov ip, r1
	ldr r0, [sp, #0x18]
	ldrh r0, [r0]
	cmp ip, r0
	bne _0803FC2E
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0803FC2E
	mov r0, sl
	adds r0, #0x50
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	bge _0803FC2E
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0803FC2E:
	ldr r0, _0803FCEC
	add r0, r8
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _0803FC5C
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0803FC5C
	ldr r2, _0803FD00
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0803FC5C
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0803FC5C:
	ldrh r1, [r5]
	adds r0, r7, #0
	str r3, [sp, #0x14]
	bl GetImprisonedMovesCount
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r0, #0
	beq _0803FC7E
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0803FC7E
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0803FC7E:
	ldr r1, _0803FCEC
	mov r0, r8
	adds r2, r0, r1
	ldrb r0, [r2, #0xe]
	lsls r0, r0, #0x1c
	mov ip, r1
	cmp r0, #0
	beq _0803FC9E
	ldrh r0, [r2, #6]
	ldrh r1, [r5]
	cmp r0, r1
	beq _0803FC9E
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0803FC9E:
	ldr r2, [sp]
	cmp r2, #0x1d
	bne _0803FCC0
	ldr r0, [sp, #4]
	ldrh r1, [r0]
	cmp r1, #0
	beq _0803FCC0
	ldr r0, _0803FD04
	cmp r1, r0
	beq _0803FCC0
	ldrh r2, [r5]
	cmp r1, r2
	beq _0803FCC0
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0803FCC0:
	adds r6, #4
	adds r5, #2
	ldr r0, [sp, #0x10]
	adds r0, #2
	str r0, [sp, #0x10]
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #3
	bgt _0803FCD6
	b _0803FB9A
_0803FCD6:
	adds r0, r4, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803FCE8: .4byte 0x02023EB3
_0803FCEC: .4byte 0x02023F60
_0803FCF0: .4byte 0x02023D28
_0803FCF4: .4byte 0x02023D34
_0803FCF8: .4byte 0x082FACB4
_0803FCFC: .4byte 0x02023EEC
_0803FD00: .4byte 0x082ED220
_0803FD04: .4byte 0x0000FFFF
	thumb_func_end CheckMoveLimitations

	thumb_func_start AreAllMovesUnusable
AreAllMovesUnusable: @ 0x0803FD08
	push {r4, lr}
	ldr r4, _0803FD3C
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #0xff
	bl CheckMoveLimitations
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bne _0803FD4C
	ldr r0, _0803FD40
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0803FD44
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0803FD48
	str r1, [r0]
	b _0803FD5E
	.align 2, 0
_0803FD3C: .4byte 0x02023D08
_0803FD40: .4byte 0x02023FE0
_0803FD44: .4byte 0x02023EC4
_0803FD48: .4byte 0x082895FA
_0803FD4C:
	ldr r0, _0803FD6C
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_0803FD5E:
	movs r0, #0
	cmp r3, #0xf
	bne _0803FD66
	movs r0, #1
_0803FD66:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803FD6C: .4byte 0x02023FE0
	thumb_func_end AreAllMovesUnusable

	thumb_func_start GetImprisonedMovesCount
GetImprisonedMovesCount: @ 0x0803FD70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r4, #0
	ldr r0, _0803FE04
	ldrb r0, [r0]
	cmp r6, r0
	bge _0803FDF4
	ldr r7, _0803FE08
	mov r8, r7
_0803FD9A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r4, #1
	cmp sb, r0
	beq _0803FDEA
	ldr r1, _0803FE0C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _0803FDEA
	movs r2, #0
	movs r0, #0x58
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, r7
	ldrh r0, [r0]
	cmp r5, r0
	beq _0803FDE0
	mov r4, r8
	adds r0, r1, r4
_0803FDD2:
	adds r0, #2
	adds r2, #1
	cmp r2, #3
	bgt _0803FDEA
	ldrh r1, [r0]
	cmp r5, r1
	bne _0803FDD2
_0803FDE0:
	cmp r2, #3
	bgt _0803FDEA
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803FDEA:
	adds r4, r3, #0
	ldr r0, _0803FE04
	ldrb r0, [r0]
	cmp r4, r0
	blt _0803FD9A
_0803FDF4:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803FE04: .4byte 0x02023D10
_0803FE08: .4byte 0x02023D34
_0803FE0C: .4byte 0x02023F50
	thumb_func_end GetImprisonedMovesCount

	thumb_func_start DoFieldEndTurnEffects
DoFieldEndTurnEffects: @ 0x0803FE10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sb, r0
	ldr r1, _0803FEB4
	mov r2, sb
	strb r2, [r1]
	ldr r0, _0803FEB8
	ldrb r4, [r0]
	adds r6, r1, #0
	mov sl, r0
	ldr r7, _0803FEBC
	ldr r3, _0803FEC0
	mov ip, r3
	cmp sb, r4
	bhs _0803FE64
	ldr r2, _0803FEC4
	ldrb r1, [r2]
	ldr r5, _0803FEC8
	ldr r0, [r5]
	ands r1, r0
	cmp r1, #0
	beq _0803FE64
	adds r3, r6, #0
_0803FE46:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r4
	bhs _0803FE64
	ldrb r0, [r2]
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803FE46
_0803FE64:
	movs r0, #0
	strb r0, [r7]
	mov r0, sl
	ldrb r4, [r0]
	cmp r4, #0
	beq _0803FE9E
	ldr r2, _0803FEC4
	ldrb r1, [r2]
	ldr r5, _0803FEC8
	ldr r0, [r5]
	ands r1, r0
	cmp r1, #0
	beq _0803FE9E
	adds r3, r7, #0
_0803FE80:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r4
	bhs _0803FE9E
	ldrb r0, [r2]
	ldrb r1, [r7]
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803FE80
_0803FE9E:
	mov r1, ip
	ldr r0, [r1]
	ldrb r0, [r0, #3]
	cmp r0, #0xa
	bls _0803FEAA
	b _08040536
_0803FEAA:
	lsls r0, r0, #2
	ldr r1, _0803FECC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FEB4: .4byte 0x02023EAF
_0803FEB8: .4byte 0x02023D10
_0803FEBC: .4byte 0x02023EB0
_0803FEC0: .4byte 0x02024140
_0803FEC4: .4byte 0x02023EB4
_0803FEC8: .4byte 0x082FACB4
_0803FECC: .4byte 0x0803FED0
_0803FED0: @ jump table
	.4byte _0803FEFC @ case 0
	.4byte _0803FF82 @ case 1
	.4byte _08040048 @ case 2
	.4byte _08040114 @ case 3
	.4byte _080401F0 @ case 4
	.4byte _080402A8 @ case 5
	.4byte _0804035C @ case 6
	.4byte _080403E0 @ case 7
	.4byte _08040450 @ case 8
	.4byte _080404A8 @ case 9
	.4byte _0804052C @ case 10
_0803FEFC:
	movs r5, #0
	ldr r1, _0803FF1C
	mov sl, r1
	ldrb r2, [r1]
	cmp r5, r2
	bge _0803FF16
	ldr r2, _0803FF20
_0803FF0A:
	adds r0, r5, r2
	strb r5, [r0]
	adds r5, #1
	ldrb r3, [r1]
	cmp r5, r3
	blt _0803FF0A
_0803FF16:
	movs r5, #0
	b _0803FF64
	.align 2, 0
_0803FF1C: .4byte 0x02023D10
_0803FF20: .4byte 0x02023D22
_0803FF24:
	adds r4, r5, #1
	adds r6, r4, #0
	ldrb r1, [r1]
	cmp r6, r1
	bge _0803FF62
	ldr r7, _08040020
	ldr r0, _08040024
	mov sl, r0
	lsls r1, r5, #0x18
	mov r8, r1
_0803FF38:
	adds r0, r5, r7
	ldrb r0, [r0]
	adds r1, r4, r7
	ldrb r1, [r1]
	movs r2, #0
	bl GetWhoStrikesFirst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FF58
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, r8
	lsrs r0, r2, #0x18
	bl SwapTurnOrder
_0803FF58:
	adds r4, #1
	ldr r0, _08040024
	ldrb r0, [r0]
	cmp r4, r0
	blt _0803FF38
_0803FF62:
	adds r5, r6, #0
_0803FF64:
	mov r1, sl
	ldrb r0, [r1]
	subs r0, #1
	cmp r5, r0
	blt _0803FF24
	ldr r2, _08040028
	ldr r1, [r2]
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, [r2]
	adds r0, #0xdb
	movs r1, #0
	strb r1, [r0]
	mov ip, r2
_0803FF82:
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #1
	bls _0803FF90
	b _0804026C
_0803FF90:
	ldr r3, _0804002C
	mov r8, r3
	movs r7, #0
	ldr r6, _08040030
	ldr r5, _08040034
_0803FF9A:
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r4, [r0]
	ldr r2, _08040038
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2, #1]
	strb r0, [r6]
	mov r3, r8
	strb r0, [r3]
	ldr r0, _0804003C
	adds r3, r1, r0
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803FFFC
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r4, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803FFFC
	ldrh r0, [r3]
	ldr r2, _08040040
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08040044
	bl BattleScriptExecute
	movs r0, #0xfd
	strb r0, [r5]
	movs r0, #2
	strb r0, [r5, #1]
	movs r0, #0x73
	strb r0, [r5, #2]
	strb r7, [r5, #3]
	ldrb r0, [r5, #4]
	orrs r0, r4
	strb r0, [r5, #4]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0803FFFC:
	ldr r2, _08040028
	ldr r1, [r2]
	adds r1, #0xdb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov ip, r2
	mov r3, sb
	cmp r3, #0
	beq _08040012
	b _0804053E
_08040012:
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #1
	bls _0803FF9A
	b _0804026C
	.align 2, 0
_08040020: .4byte 0x02023D22
_08040024: .4byte 0x02023D10
_08040028: .4byte 0x02024140
_0804002C: .4byte 0x02023D08
_08040030: .4byte 0x02023EAF
_08040034: .4byte 0x02022C0C
_08040038: .4byte 0x02023F38
_0804003C: .4byte 0x02023F32
_08040040: .4byte 0x0000FFFE
_08040044: .4byte 0x08289282
_08040048:
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #1
	bls _08040056
	b _080401B0
_08040056:
	movs r0, #2
	mov sl, r0
	movs r2, #0
	mov r8, r2
	ldr r7, _080400F0
	ldr r5, _080400F4
_08040062:
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r4, [r0]
	ldr r2, _080400F8
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2, #3]
	strb r0, [r7]
	ldr r3, _080400FC
	strb r0, [r3]
	ldr r0, _08040100
	adds r3, r1, r0
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080400CA
	ldrb r0, [r2, #2]
	subs r0, #1
	strb r0, [r2, #2]
	movs r6, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080400CA
	ldrh r0, [r3]
	ldr r2, _08040104
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08040108
	bl BattleScriptExecute
	ldr r0, _0804010C
	strb r4, [r0, #5]
	movs r0, #0xfd
	strb r0, [r5]
	mov r3, sl
	strb r3, [r5, #1]
	movs r0, #0x71
	strb r0, [r5, #2]
	mov r0, r8
	strb r0, [r5, #3]
	ldrb r0, [r5, #4]
	orrs r0, r6
	strb r0, [r5, #4]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_080400CA:
	ldr r2, _08040110
	ldr r1, [r2]
	adds r1, #0xdb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov ip, r2
	mov r1, sb
	cmp r1, #0
	beq _080400E0
	b _0804053E
_080400E0:
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #1
	bls _08040062
	b _080401B0
	.align 2, 0
_080400F0: .4byte 0x02023EAF
_080400F4: .4byte 0x02022C0C
_080400F8: .4byte 0x02023F38
_080400FC: .4byte 0x02023D08
_08040100: .4byte 0x02023F32
_08040104: .4byte 0x0000FFFD
_08040108: .4byte 0x08289282
_0804010C: .4byte 0x02023FD6
_08040110: .4byte 0x02024140
_08040114:
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #1
	bhi _080401B0
	ldr r0, _080401CC
	mov sl, r0
	movs r2, #0
	mov r8, r2
	ldr r7, _080401D0
	ldr r5, _080401D4
_0804012C:
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r4, [r0]
	ldr r1, _080401D8
	lsls r3, r4, #1
	adds r0, r3, r4
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1, #5]
	strb r0, [r7]
	mov r2, sl
	strb r0, [r2]
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0804018E
	subs r0, #1
	strb r0, [r1, #4]
	movs r6, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804018E
	ldr r2, _080401DC
	adds r2, r3, r2
	ldrh r0, [r2]
	ldr r3, _080401E0
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080401E4
	bl BattleScriptExecute
	ldr r0, _080401E8
	strb r4, [r0, #5]
	movs r0, #0xfd
	strb r0, [r5]
	movs r0, #2
	strb r0, [r5, #1]
	movs r0, #0x36
	strb r0, [r5, #2]
	mov r0, r8
	strb r0, [r5, #3]
	ldrb r0, [r5, #4]
	orrs r0, r6
	strb r0, [r5, #4]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0804018E:
	ldr r2, _080401EC
	ldr r1, [r2]
	adds r1, #0xdb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov ip, r2
	mov r1, sb
	cmp r1, #0
	beq _080401A4
	b _0804053E
_080401A4:
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #1
	bls _0804012C
_080401B0:
	mov r2, sb
	cmp r2, #0
	beq _080401B8
	b _0804053E
_080401B8:
	mov r3, ip
	ldr r0, [r3]
	ldrb r1, [r0, #3]
	adds r1, #1
	strb r1, [r0, #3]
	ldr r0, [r3]
	adds r0, #0xdb
	strb r2, [r0]
	b _08040536
	.align 2, 0
_080401CC: .4byte 0x02023D08
_080401D0: .4byte 0x02023EAF
_080401D4: .4byte 0x02022C0C
_080401D8: .4byte 0x02023F38
_080401DC: .4byte 0x02023F32
_080401E0: .4byte 0x0000FEFF
_080401E4: .4byte 0x08289282
_080401E8: .4byte 0x02023FD6
_080401EC: .4byte 0x02024140
_080401F0:
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0804026C
	ldr r6, _0804028C
	ldr r5, _08040290
_08040200:
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r4, [r0]
	ldr r2, _08040294
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2, #7]
	strb r0, [r5]
	strb r0, [r6]
	ldr r0, _08040298
	adds r3, r1, r0
	ldrh r1, [r3]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0804024A
	ldrb r0, [r2, #6]
	subs r0, #1
	strb r0, [r2, #6]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804024A
	ldrh r0, [r3]
	ldr r2, _0804029C
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _080402A0
	bl BattleScriptExecute
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0804024A:
	ldr r2, _080402A4
	ldr r1, [r2]
	adds r1, #0xdb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov ip, r2
	mov r3, sb
	cmp r3, #0
	beq _08040260
	b _0804053E
_08040260:
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #1
	bls _08040200
_0804026C:
	mov r0, sb
	cmp r0, #0
	beq _08040274
	b _0804053E
_08040274:
	mov r1, ip
	ldr r0, [r1]
	ldrb r1, [r0, #3]
	adds r1, #1
	strb r1, [r0, #3]
	mov r2, ip
	ldr r0, [r2]
	adds r0, #0xdb
	mov r3, sb
	strb r3, [r0]
	b _08040536
	.align 2, 0
_0804028C: .4byte 0x02023D08
_08040290: .4byte 0x02023EAF
_08040294: .4byte 0x02023F38
_08040298: .4byte 0x02023F32
_0804029C: .4byte 0x0000FFDF
_080402A0: .4byte 0x08289293
_080402A4: .4byte 0x02024140
_080402A8:
	mov r2, ip
	ldr r0, [r2]
	adds r0, #0xdb
	ldr r1, _0804033C
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08040328
	ldr r4, _08040340
	ldr r5, _08040344
_080402BC:
	ldr r0, [r2]
	adds r0, #0xdb
	ldrb r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _08040348
	adds r0, #0x20
	ldrb r2, [r4]
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _08040304
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040304
	ldr r1, _0804034C
	ldrb r2, [r4]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	beq _08040304
	ldr r0, _08040350
	strb r2, [r0]
	ldr r0, _08040354
	bl BattleScriptExecute
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08040304:
	ldr r2, _08040358
	ldr r1, [r2]
	adds r1, #0xdb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov ip, r2
	mov r3, sb
	cmp r3, #0
	beq _0804031A
	b _0804053E
_0804031A:
	ldr r0, [r2]
	adds r0, #0xdb
	ldr r1, _0804033C
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _080402BC
_08040328:
	mov r0, sb
	cmp r0, #0
	beq _08040330
	b _0804053E
_08040330:
	mov r2, ip
	ldr r1, [r2]
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	b _08040536
	.align 2, 0
_0804033C: .4byte 0x02023D10
_08040340: .4byte 0x02023D08
_08040344: .4byte 0x02023D22
_08040348: .4byte 0x02024074
_0804034C: .4byte 0x02023D28
_08040350: .4byte 0x02023EB0
_08040354: .4byte 0x0828963F
_08040358: .4byte 0x02024140
_0804035C:
	ldr r3, _08040394
	ldrh r2, [r3]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	bne _0804036A
	b _08040508
_0804036A:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	bne _080403B6
	ldr r1, _08040398
	adds r1, #0x28
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080403A8
	ldr r0, _0804039C
	ands r0, r2
	ldr r1, _080403A0
	ands r0, r1
	strh r0, [r3]
	ldr r1, _080403A4
	movs r0, #2
	strb r0, [r1, #5]
	b _080403D4
	.align 2, 0
_08040394: .4byte 0x02024070
_08040398: .4byte 0x02024074
_0804039C: .4byte 0x0000FFFE
_080403A0: .4byte 0x0000FFFD
_080403A4: .4byte 0x02023FD6
_080403A8:
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080403C2
	b _080403D0
_080403B6:
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080403D0
_080403C2:
	ldr r1, _080403CC
	movs r0, #1
	strb r0, [r1, #5]
	b _080403D4
	.align 2, 0
_080403CC: .4byte 0x02023FD6
_080403D0:
	ldr r0, _080403D8
	strb r1, [r0, #5]
_080403D4:
	ldr r0, _080403DC
	b _080404FA
	.align 2, 0
_080403D8: .4byte 0x02023FD6
_080403DC: .4byte 0x082891B4
_080403E0:
	ldr r3, _08040414
	ldrh r2, [r3]
	movs r0, #0x18
	ands r0, r2
	cmp r0, #0
	bne _080403EE
	b _08040508
_080403EE:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _08040428
	ldr r1, _08040418
	adds r1, #0x28
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040428
	ldr r0, _0804041C
	ands r0, r2
	strh r0, [r3]
	ldr r1, _08040420
	ldr r0, _08040424
	b _0804042C
	.align 2, 0
_08040414: .4byte 0x02024070
_08040418: .4byte 0x02024074
_0804041C: .4byte 0x0000FFF7
_08040420: .4byte 0x02023EB8
_08040424: .4byte 0x08289251
_08040428:
	ldr r1, _08040440
	ldr r0, _08040444
_0804042C:
	str r0, [r1]
	adds r3, r1, #0
	ldr r1, _08040448
	movs r2, #0
	movs r0, #0xc
	strb r0, [r1, #0x10]
	ldr r0, _0804044C
	strb r2, [r0, #5]
	b _080404F8
	.align 2, 0
_08040440: .4byte 0x02023EB8
_08040444: .4byte 0x082891CF
_08040448: .4byte 0x02024118
_0804044C: .4byte 0x02023FD6
_08040450:
	ldr r3, _08040480
	ldrh r2, [r3]
	movs r0, #0x60
	ands r0, r2
	cmp r0, #0
	beq _08040508
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08040494
	ldr r1, _08040484
	adds r1, #0x28
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040494
	ldr r0, _08040488
	ands r0, r2
	strh r0, [r3]
	ldr r1, _0804048C
	ldr r0, _08040490
	b _08040498
	.align 2, 0
_08040480: .4byte 0x02024070
_08040484: .4byte 0x02024074
_08040488: .4byte 0x0000FFDF
_0804048C: .4byte 0x02023EB8
_08040490: .4byte 0x08289268
_08040494:
	ldr r1, _080404A0
	ldr r0, _080404A4
_08040498:
	str r0, [r1]
	adds r3, r1, #0
	b _080404F8
	.align 2, 0
_080404A0: .4byte 0x02023EB8
_080404A4: .4byte 0x0828925A
_080404A8:
	ldr r3, _080404D0
	ldrh r2, [r3]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08040508
	ldr r1, _080404D4
	adds r1, #0x28
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080404E4
	ldr r0, _080404D8
	ands r0, r2
	strh r0, [r3]
	ldr r1, _080404DC
	ldr r0, _080404E0
	b _080404E8
	.align 2, 0
_080404D0: .4byte 0x02024070
_080404D4: .4byte 0x02024074
_080404D8: .4byte 0x0000FF7F
_080404DC: .4byte 0x02023EB8
_080404E0: .4byte 0x08289251
_080404E4:
	ldr r1, _08040518
	ldr r0, _0804051C
_080404E8:
	str r0, [r1]
	adds r3, r1, #0
	ldr r1, _08040520
	movs r0, #0xd
	strb r0, [r1, #0x10]
	ldr r1, _08040524
	movs r0, #1
	strb r0, [r1, #5]
_080404F8:
	ldr r0, [r3]
_080404FA:
	bl BattleScriptExecute
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08040508:
	ldr r2, _08040528
	ldr r1, [r2]
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	mov ip, r2
	b _08040536
	.align 2, 0
_08040518: .4byte 0x02023EB8
_0804051C: .4byte 0x082891CF
_08040520: .4byte 0x02024118
_08040524: .4byte 0x02023FD6
_08040528: .4byte 0x02024140
_0804052C:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08040536:
	mov r3, sb
	cmp r3, #0
	bne _0804053E
	b _0803FE9E
_0804053E:
	ldr r0, _0804055C
	ldr r1, [r0]
	ldr r0, _08040560
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804055C: .4byte 0x03005A64
_08040560: .4byte 0x0803B601
	thumb_func_end DoFieldEndTurnEffects

	thumb_func_start BattleScriptPop
BattleScriptPop: @ 0x08040564
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	mov sb, r0
	ldr r2, _08040598
	ldr r0, [r2]
	ldr r1, _0804059C
	orrs r0, r1
	str r0, [r2]
	ldr r5, _080405A0
	ldr r2, [r5]
	ldr r0, _080405A4
	ldrb r1, [r2, #1]
	adds r7, r5, #0
	mov r8, r0
	ldrb r3, [r0]
	cmp r1, r3
	blo _08040594
	bl _08040F78
_08040594:
	bl _08040F6E
	.align 2, 0
_08040598: .4byte 0x02023F24
_0804059C: .4byte 0x01000020
_080405A0: .4byte 0x02024140
_080405A4: .4byte 0x02023D10
	thumb_func_end BattleScriptPop

	thumb_func_start DoBattlerEndTurnEffects
DoBattlerEndTurnEffects: @ 0x080405A8
	ldr r3, _080405DC
	ldr r4, _080405E0
	ldr r1, _080405E4
	ldr r5, [r5]
	ldrb r0, [r5, #1]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	strb r0, [r3]
	ldr r0, _080405E8
	ldrb r1, [r0]
	ldr r2, _080405EC
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	adds r6, r3, #0
	cmp r1, #0
	beq _080405F0
	ldrb r0, [r5, #1]
	adds r0, #1
	strb r0, [r5, #1]
	bl _08040F5C
	.align 2, 0
_080405DC: .4byte 0x02023D08
_080405E0: .4byte 0x02023EAF
_080405E4: .4byte 0x02023D22
_080405E8: .4byte 0x02023EB4
_080405EC: .4byte 0x082FACB4
_080405F0:
	ldrb r0, [r5]
	cmp r0, #0x13
	bls _080405FA
	bl _08040F52
_080405FA:
	lsls r0, r0, #2
	ldr r1, _08040604
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08040604: .4byte 0x08040608
_08040608: @ jump table
	.4byte _08040658 @ case 0
	.4byte _080406B8 @ case 1
	.4byte _080406D6 @ case 2
	.4byte _08040706 @ case 3
	.4byte _08040784 @ case 4
	.4byte _080407CC @ case 5
	.4byte _0804084C @ case 6
	.4byte _08040894 @ case 7
	.4byte _080408F8 @ case 8
	.4byte _08040940 @ case 9
	.4byte _08040AA0 @ case 10
	.4byte _08040BBC @ case 11
	.4byte _08040C64 @ case 12
	.4byte _08040D28 @ case 13
	.4byte _08040DDC @ case 14
	.4byte _08040DFC @ case 15
	.4byte _08040E48 @ case 16
	.4byte _08040E78 @ case 17
	.4byte _080406EE @ case 18
	.4byte _08040F44 @ case 19
_08040658:
	ldr r1, _080406A8
	ldrb r3, [r6]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08040670
	bl _08040F1E
_08040670:
	ldr r0, _080406AC
	movs r1, #0x58
	muls r1, r3, r1
	adds r0, r1, r0
	ldrh r2, [r0, #0x28]
	ldrh r5, [r0, #0x2c]
	cmp r2, r5
	bne _08040684
	bl _08040F1E
_08040684:
	cmp r2, #0
	bne _0804068C
	bl _08040F1E
_0804068C:
	ldr r1, _080406B0
	ldrh r0, [r0, #0x2c]
	lsrs r0, r0, #4
	str r0, [r1]
	cmp r0, #0
	bne _0804069C
	movs r0, #1
	str r0, [r1]
_0804069C:
	ldr r0, [r1]
	rsbs r0, r0, #0
	str r0, [r1]
	ldr r0, _080406B4
	bl _08040F10
	.align 2, 0
_080406A8: .4byte 0x02023F50
_080406AC: .4byte 0x02023D28
_080406B0: .4byte 0x02023E94
_080406B4: .4byte 0x08289676
_080406B8:
	ldrb r1, [r6]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080406D2
	bl _08040F1E
_080406D2:
	bl _08040F14
_080406D6:
	ldrb r1, [r6]
	movs r0, #1
	movs r2, #0
	bl ItemBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080406EA
	bl _08040F1E
_080406EA:
	bl _08040F14
_080406EE:
	ldrb r1, [r6]
	movs r0, #1
	movs r2, #1
	bl ItemBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040702
	bl _08040F1E
_08040702:
	bl _08040F14
_08040706:
	ldr r0, _0804076C
	ldrb r2, [r6]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0804071C
	bl _08040F1E
_0804071C:
	ldr r3, _08040770
	movs r5, #3
	ands r5, r1
	movs r1, #0x58
	adds r0, r5, #0
	muls r0, r1, r0
	adds r0, r0, r3
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08040734
	bl _08040F1E
_08040734:
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, r0, r3
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08040744
	bl _08040F1E
_08040744:
	ldr r0, _08040774
	strb r5, [r0]
	ldr r2, _08040778
	ldrb r0, [r6]
	muls r0, r1, r0
	adds r0, r0, r3
	ldrh r0, [r0, #0x2c]
	lsrs r0, r0, #3
	str r0, [r2]
	cmp r0, #0
	bne _0804075E
	movs r0, #1
	str r0, [r2]
_0804075E:
	ldr r1, _0804077C
	strb r5, [r1, #0x10]
	ldrb r0, [r4]
	strb r0, [r1, #0x11]
	ldr r0, _08040780
	b _08040F10
	.align 2, 0
_0804076C: .4byte 0x02023F50
_08040770: .4byte 0x02023D28
_08040774: .4byte 0x02023EB0
_08040778: .4byte 0x02023E94
_0804077C: .4byte 0x02024118
_08040780: .4byte 0x0828929D
_08040784:
	ldr r2, _080407C0
	ldrb r1, [r6]
	movs r0, #0x58
	adds r3, r1, #0
	muls r3, r0, r3
	adds r0, r2, #0
	adds r0, #0x4c
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080407A0
	b _08040F1E
_080407A0:
	adds r1, r3, r2
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	bne _080407AA
	b _08040F1E
_080407AA:
	ldr r2, _080407C4
	ldrh r0, [r1, #0x2c]
	lsrs r0, r0, #3
	str r0, [r2]
	cmp r0, #0
	bne _080407BA
	movs r0, #1
	str r0, [r2]
_080407BA:
	ldr r0, _080407C8
	b _08040F10
	.align 2, 0
_080407C0: .4byte 0x02023D28
_080407C4: .4byte 0x02023E94
_080407C8: .4byte 0x082897C5
_080407CC:
	ldr r4, _08040840
	ldrb r0, [r6]
	movs r7, #0x58
	mov r8, r7
	mov r2, r8
	muls r2, r0, r2
	adds r3, r4, #0
	adds r3, #0x4c
	adds r0, r2, r3
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080407EA
	b _08040F1E
_080407EA:
	adds r1, r2, r4
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	bne _080407F4
	b _08040F1E
_080407F4:
	ldr r5, _08040844
	ldrh r0, [r1, #0x2c]
	lsrs r0, r0, #4
	str r0, [r5]
	cmp r0, #0
	bne _08040804
	movs r0, #1
	str r0, [r5]
_08040804:
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r2, r0, r3
	ldr r1, [r2]
	movs r4, #0xf0
	lsls r4, r4, #4
	adds r0, r1, #0
	ands r0, r4
	cmp r0, r4
	beq _08040824
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r1, r7
	str r0, [r2]
_08040824:
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r3
	ldr r0, [r0]
	ands r0, r4
	lsrs r0, r0, #8
	ldr r1, [r5]
	muls r0, r1, r0
	str r0, [r5]
	ldr r0, _08040848
	b _08040F10
	.align 2, 0
_08040840: .4byte 0x02023D28
_08040844: .4byte 0x02023E94
_08040848: .4byte 0x082897C5
_0804084C:
	ldr r2, _08040888
	ldrb r1, [r6]
	movs r0, #0x58
	adds r3, r1, #0
	muls r3, r0, r3
	adds r0, r2, #0
	adds r0, #0x4c
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08040868
	b _08040F1E
_08040868:
	adds r1, r3, r2
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	bne _08040872
	b _08040F1E
_08040872:
	ldr r2, _0804088C
	ldrh r0, [r1, #0x2c]
	lsrs r0, r0, #3
	str r0, [r2]
	cmp r0, #0
	bne _08040882
	movs r0, #1
	str r0, [r2]
_08040882:
	ldr r0, _08040890
	b _08040F10
	.align 2, 0
_08040888: .4byte 0x02023D28
_0804088C: .4byte 0x02023E94
_08040890: .4byte 0x082897E7
_08040894:
	ldr r4, _080408E0
	ldrb r1, [r6]
	movs r0, #0x58
	muls r1, r0, r1
	adds r0, r4, #0
	adds r0, #0x50
	adds r5, r1, r0
	ldr r2, [r5]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r2
	cmp r0, #0
	bne _080408B0
	b _08040F1E
_080408B0:
	adds r3, r1, r4
	ldrh r0, [r3, #0x28]
	cmp r0, #0
	bne _080408BA
	b _08040F1E
_080408BA:
	adds r0, r4, #0
	adds r0, #0x4c
	adds r0, r1, r0
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080408EC
	ldr r1, _080408E4
	ldrh r0, [r3, #0x2c]
	lsrs r0, r0, #2
	str r0, [r1]
	cmp r0, #0
	bne _080408DA
	movs r0, #1
	str r0, [r1]
_080408DA:
	ldr r0, _080408E8
	b _08040F10
	.align 2, 0
_080408E0: .4byte 0x02023D28
_080408E4: .4byte 0x02023E94
_080408E8: .4byte 0x082898C7
_080408EC:
	ldr r0, _080408F4
	ands r2, r0
	str r2, [r5]
	b _08040F1E
	.align 2, 0
_080408F4: .4byte 0xF7FFFFFF
_080408F8:
	ldr r2, _08040934
	ldrb r1, [r6]
	movs r0, #0x58
	adds r3, r1, #0
	muls r3, r0, r3
	adds r0, r2, #0
	adds r0, #0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _08040916
	b _08040F1E
_08040916:
	adds r1, r3, r2
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	bne _08040920
	b _08040F1E
_08040920:
	ldr r2, _08040938
	ldrh r0, [r1, #0x2c]
	lsrs r0, r0, #2
	str r0, [r2]
	cmp r0, #0
	bne _08040930
	movs r0, #1
	str r0, [r2]
_08040930:
	ldr r0, _0804093C
	b _08040F10
	.align 2, 0
_08040934: .4byte 0x02023D28
_08040938: .4byte 0x02023E94
_0804093C: .4byte 0x082898D8
_08040940:
	ldr r3, _080409E0
	mov r8, r3
	ldrb r0, [r6]
	movs r3, #0x58
	adds r1, r0, #0
	muls r1, r3, r1
	movs r5, #0x50
	add r5, r8
	mov sl, r5
	adds r4, r1, r5
	ldr r2, [r4]
	movs r5, #0xe0
	lsls r5, r5, #8
	adds r0, r2, #0
	ands r0, r5
	cmp r0, #0
	bne _08040964
	b _08040F1E
_08040964:
	mov r7, r8
	adds r0, r1, r7
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08040970
	b _08040F1E
_08040970:
	ldr r1, _080409E4
	adds r0, r2, r1
	str r0, [r4]
	ldrb r4, [r6]
	adds r0, r4, #0
	muls r0, r3, r0
	add r0, sl
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _08040A00
	ldr r1, _080409E8
	ldr r0, _080409EC
	ldr r2, [r0]
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	strb r0, [r1, #0x10]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0, #5]
	strb r0, [r1, #0x11]
	ldr r1, _080409F0
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #2
	strb r0, [r1, #1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	strb r0, [r1, #2]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0, #5]
	strb r0, [r1, #3]
	movs r0, #0xff
	strb r0, [r1, #4]
	ldr r1, _080409F4
	ldr r0, _080409F8
	str r0, [r1]
	ldr r2, _080409FC
	ldrb r0, [r6]
	muls r0, r3, r0
	add r0, r8
	ldrh r0, [r0, #0x2c]
	lsrs r0, r0, #4
	str r0, [r2]
	cmp r0, #0
	bne _08040A2C
	movs r0, #1
	str r0, [r2]
	b _08040A2C
	.align 2, 0
_080409E0: .4byte 0x02023D28
_080409E4: .4byte 0xFFFFE000
_080409E8: .4byte 0x02024118
_080409EC: .4byte 0x02024140
_080409F0: .4byte 0x02022C0C
_080409F4: .4byte 0x02023EB8
_080409F8: .4byte 0x08289896
_080409FC: .4byte 0x02023E94
_08040A00:
	ldr r2, _08040A30
	movs r0, #0xfd
	strb r0, [r2]
	movs r0, #2
	strb r0, [r2, #1]
	ldrb r1, [r6]
	ldr r0, _08040A34
	ldr r3, [r0]
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrb r0, [r1, #4]
	strb r0, [r2, #2]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0, #5]
	strb r0, [r2, #3]
	movs r0, #0xff
	strb r0, [r2, #4]
	ldr r1, _08040A38
	ldr r0, _08040A3C
	str r0, [r1]
_08040A2C:
	ldr r0, [r1]
	b _08040F10
	.align 2, 0
_08040A30: .4byte 0x02022C0C
_08040A34: .4byte 0x02024140
_08040A38: .4byte 0x02023EB8
_08040A3C: .4byte 0x082898A8
_08040A40:
	movs r0, #8
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r2]
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0, r2
	mov r0, sl
	adds r0, #0x50
	adds r2, r2, r0
	ldr r0, [r2]
	ldr r1, _08040A90
	ands r0, r1
	str r0, [r2]
	ldr r1, _08040A94
	movs r0, #1
	strb r0, [r1, #5]
	ldr r0, _08040A98
	bl BattleScriptExecute
	ldr r4, _08040A9C
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r0, [r4]
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	add r0, sb
	str r0, [sp]
	movs r0, #0
	movs r1, #0x28
	movs r2, #0
	movs r3, #4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _08040B08
	.align 2, 0
_08040A90: .4byte 0xF7FFFFFF
_08040A94: .4byte 0x02023FD6
_08040A98: .4byte 0x082897BC
_08040A9C: .4byte 0x02023D08
_08040AA0:
	ldr r2, _08040B1C
	ldrb r1, [r6]
	movs r0, #0x58
	muls r0, r1, r0
	adds r1, r2, #0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x70
	ands r1, r0
	adds r7, r2, #0
	cmp r1, #0
	beq _08040BAA
	movs r0, #0
	strb r0, [r4]
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, #0
	beq _08040B08
	mov sl, r7
	adds r6, r4, #0
	movs r1, #0x58
	mov r8, r1
	movs r3, #0x4c
	adds r3, r3, r7
	mov sb, r3
	str r0, [sp, #4]
	movs r5, #7
	mov ip, r5
_08040ADA:
	ldrb r4, [r6]
	mov r1, r8
	muls r1, r4, r1
	mov r0, sb
	adds r2, r1, r0
	ldr r3, [r2]
	adds r0, r3, #0
	mov r5, ip
	ands r0, r5
	cmp r0, #0
	beq _08040AFA
	adds r0, r1, r7
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x2b
	bne _08040A40
_08040AFA:
	adds r0, r4, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #4]
	cmp r0, r1
	blo _08040ADA
_08040B08:
	ldr r2, _08040B20
	ldr r1, _08040B24
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08040B28
	movs r3, #2
	mov sb, r3
	b _08040F58
	.align 2, 0
_08040B1C: .4byte 0x02023D28
_08040B20: .4byte 0x02023EAF
_08040B24: .4byte 0x02023D10
_08040B28:
	ldr r5, _08040B60
	ldrb r0, [r5]
	strb r0, [r2]
	ldr r2, _08040B64
	ldrb r0, [r5]
	movs r7, #0x58
	adds r1, r0, #0
	muls r1, r7, r1
	adds r6, r2, #0
	adds r6, #0x50
	adds r1, r1, r6
	ldr r0, [r1]
	subs r0, #0x10
	str r0, [r1]
	ldrb r0, [r5]
	bl WasUnableToUseMove
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08040B6C
	ldrb r0, [r5]
	bl CancelMultiTurnMoves
	ldr r1, _08040B68
	movs r0, #1
	strb r0, [r1, #5]
	b _08040BA0
	.align 2, 0
_08040B60: .4byte 0x02023D08
_08040B64: .4byte 0x02023D28
_08040B68: .4byte 0x02023FD6
_08040B6C:
	ldrb r3, [r5]
	adds r0, r3, #0
	muls r0, r7, r0
	adds r2, r0, r6
	ldr r0, [r2]
	movs r1, #0x70
	ands r0, r1
	cmp r0, #0
	beq _08040B94
	ldr r0, _08040B90
	strb r4, [r0, #5]
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2]
	b _08040BA0
	.align 2, 0
_08040B90: .4byte 0x02023FD6
_08040B94:
	ldr r1, _08040BB4
	movs r0, #1
	strb r0, [r1, #5]
	adds r0, r3, #0
	bl CancelMultiTurnMoves
_08040BA0:
	ldr r0, _08040BB8
	bl BattleScriptExecute
	movs r5, #1
	mov sb, r5
_08040BAA:
	mov r7, sb
	cmp r7, #2
	bne _08040BB2
	b _08040F52
_08040BB2:
	b _08040F1E
	.align 2, 0
_08040BB4: .4byte 0x02023FD6
_08040BB8: .4byte 0x0828982E
_08040BBC:
	ldr r1, _08040BF4
	ldrb r0, [r6]
	movs r7, #0x58
	muls r0, r7, r0
	adds r5, r1, #0
	adds r5, #0x50
	adds r2, r0, r5
	ldr r1, [r2]
	movs r4, #0xc0
	lsls r4, r4, #4
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0
	bne _08040BDA
	b _08040F1E
_08040BDA:
	ldr r3, _08040BF8
	adds r0, r1, r3
	str r0, [r2]
	ldrb r0, [r6]
	bl WasUnableToUseMove
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040BFC
	ldrb r0, [r6]
	bl CancelMultiTurnMoves
	b _08040F1E
	.align 2, 0
_08040BF4: .4byte 0x02023D28
_08040BF8: .4byte 0xFFFFFC00
_08040BFC:
	ldrb r0, [r6]
	muls r0, r7, r0
	adds r2, r0, r5
	ldr r1, [r2]
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0
	beq _08040C0E
	b _08040F1E
_08040C0E:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	bne _08040C1A
	b _08040F1E
_08040C1A:
	ldr r0, _08040C58
	ands r1, r0
	str r1, [r2]
	ldrb r0, [r6]
	muls r0, r7, r0
	adds r0, r0, r5
	ldr r0, [r0]
	movs r4, #7
	ands r0, r4
	cmp r0, #0
	beq _08040C32
	b _08040F1E
_08040C32:
	ldr r1, _08040C5C
	movs r0, #0x47
	strb r0, [r1, #3]
	movs r0, #1
	movs r1, #0
	bl SetMoveEffect
	ldrb r0, [r6]
	muls r0, r7, r0
	adds r0, r0, r5
	ldr r0, [r0]
	ands r0, r4
	cmp r0, #0
	bne _08040C50
	b _08040F14
_08040C50:
	ldr r0, _08040C60
	bl BattleScriptExecute
	b _08040F14
	.align 2, 0
_08040C58: .4byte 0xFFFFEFFF
_08040C5C: .4byte 0x02023FD6
_08040C60: .4byte 0x08289837
_08040C64:
	ldr r0, _08040CE4
	ldrb r3, [r6]
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #2
	adds r5, r1, r0
	ldrb r1, [r5, #0xb]
	lsls r1, r1, #0x1c
	adds r7, r0, #0
	cmp r1, #0
	bne _08040C7C
	b _08040F1E
_08040C7C:
	movs r4, #0
	ldr r2, _08040CE8
	movs r0, #0x58
	adds r1, r3, #0
	muls r1, r0, r1
	adds r2, #0xc
	adds r1, r1, r2
	ldrh r0, [r5, #4]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08040CBA
	mov ip, r7
	mov r8, r2
	adds r5, r6, #0
	movs r3, #0x58
_08040C9A:
	adds r4, #1
	cmp r4, #3
	bgt _08040CBA
	ldrb r2, [r5]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	add r1, ip
	lsls r0, r4, #1
	muls r2, r3, r2
	adds r0, r0, r2
	add r0, r8
	ldrh r1, [r1, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _08040C9A
_08040CBA:
	cmp r4, #4
	bne _08040CEC
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	movs r1, #0
	strh r1, [r0, #4]
	ldrb r0, [r6]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r1, #0xb]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0xb]
	b _08040F1E
	.align 2, 0
_08040CE4: .4byte 0x02023F60
_08040CE8: .4byte 0x02023D28
_08040CEC:
	ldrb r0, [r6]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r7
	ldrb r3, [r2, #0xb]
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1c
	subs r1, #1
	movs r0, #0xf
	ands r1, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0xb]
	adds r2, r1, #0
	cmp r2, #0
	beq _08040D14
	b _08040F1E
_08040D14:
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #4]
	ldr r0, _08040D24
	b _08040F10
	.align 2, 0
_08040D24: .4byte 0x082893AB
_08040D28:
	ldr r3, _08040D74
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r3
	ldrb r5, [r2, #0xe]
	lsls r4, r5, #0x1c
	cmp r4, #0
	bne _08040D3E
	b _08040F1E
_08040D3E:
	ldr r7, _08040D78
	mov r8, r7
	ldrb r0, [r2, #0xc]
	lsls r0, r0, #1
	movs r7, #0x58
	muls r1, r7, r1
	adds r0, r0, r1
	mov r1, r8
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2, #6]
	cmp r0, r1
	beq _08040D7C
	movs r0, #0
	strh r0, [r2, #6]
	ldrb r0, [r6]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r1, #0xe]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0xe]
	b _08040F1E
	.align 2, 0
_08040D74: .4byte 0x02023F60
_08040D78: .4byte 0x02023D28
_08040D7C:
	lsrs r1, r4, #0x1c
	subs r1, #1
	movs r0, #0xf
	ands r1, r0
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r1
	strb r0, [r2, #0xe]
	cmp r1, #0
	beq _08040DB2
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	muls r1, r7, r1
	ldrb r0, [r0, #0xc]
	adds r1, r1, r0
	mov r0, r8
	adds r0, #0x24
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08040DB2
	b _08040F1E
_08040DB2:
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #6]
	ldrb r0, [r6]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r1, #0xe]
	adds r0, r4, #0
	ands r0, r2
	strb r0, [r1, #0xe]
	ldr r0, _08040DD8
	b _08040F10
	.align 2, 0
_08040DD8: .4byte 0x082893BF
_08040DDC:
	ldr r0, _08040DF8
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0x18
	ands r0, r2
	cmp r0, #0
	beq _08040DF4
	adds r0, r2, #0
	subs r0, #8
	str r0, [r1]
_08040DF4:
	ldr r1, [r7]
	b _08040F22
	.align 2, 0
_08040DF8: .4byte 0x02023F50
_08040DFC:
	ldr r2, _08040E3C
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r2
	ldrb r2, [r3, #0x12]
	lsls r1, r2, #0x1c
	cmp r1, #0
	beq _08040E36
	lsrs r1, r1, #0x1c
	subs r1, #1
	movs r0, #0xf
	ands r1, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x12]
	cmp r1, #0
	bne _08040E36
	ldr r0, _08040E40
	ldrb r2, [r6]
	lsls r2, r2, #2
	adds r2, r2, r0
	ldr r0, [r2]
	ldr r1, _08040E44
	ands r0, r1
	str r0, [r2]
_08040E36:
	ldr r1, [r7]
	b _08040F22
	.align 2, 0
_08040E3C: .4byte 0x02023F60
_08040E40: .4byte 0x02023F50
_08040E44: .4byte 0xFFFFFDFF
_08040E48:
	ldr r2, _08040E74
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r2
	ldrb r2, [r3, #0x13]
	lsls r1, r2, #0x1c
	cmp r1, #0
	beq _08040E6E
	lsrs r1, r1, #0x1c
	subs r1, #1
	movs r0, #0xf
	ands r1, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x13]
_08040E6E:
	ldr r1, [r7]
	b _08040F22
	.align 2, 0
_08040E74: .4byte 0x02023F60
_08040E78:
	ldr r4, _08040F2C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r2, r0, r4
	ldr r1, [r2]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	beq _08040F1E
	ldr r5, _08040F30
	adds r0, r1, r5
	str r0, [r2]
	ldrb r2, [r6]
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ands r0, r3
	cmp r0, #0
	bne _08040F1E
	ldr r3, _08040F34
	movs r5, #0x58
	adds r1, r2, #0
	muls r1, r5, r1
	adds r4, r3, #0
	adds r4, #0x4c
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040F1E
	adds r0, r1, r3
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x48
	beq _08040F1E
	cmp r0, #0xf
	beq _08040F1E
	adds r0, r2, #0
	bl UproarWakeUpCheck
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040F1E
	ldrb r0, [r6]
	bl CancelMultiTurnMoves
	bl Random
	ldrb r1, [r6]
	adds r2, r1, #0
	muls r2, r5, r2
	adds r2, r2, r4
	movs r1, #3
	ands r1, r0
	adds r1, #2
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #0
	movs r1, #0x28
	movs r2, #0
	movs r3, #4
	bl BtlController_EmitSetMonData
	ldrb r0, [r6]
	bl MarkBattlerForControllerExec
	ldr r1, _08040F38
	ldrb r0, [r6]
	strb r0, [r1]
	ldr r0, _08040F3C
_08040F10:
	bl BattleScriptExecute
_08040F14:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08040F1E:
	ldr r0, _08040F40
	ldr r1, [r0]
_08040F22:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08040F52
	.align 2, 0
_08040F2C: .4byte 0x02023F50
_08040F30: .4byte 0xFFFFF800
_08040F34: .4byte 0x02023D28
_08040F38: .4byte 0x02023EB2
_08040F3C: .4byte 0x08289900
_08040F40: .4byte 0x02024140
_08040F44:
	ldr r1, [r7]
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r7]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
_08040F52:
	mov r7, sb
	cmp r7, #0
	beq _08040F5C
_08040F58:
	mov r0, sb
	b _08040F84
_08040F5C:
	ldr r5, _08040F94
	ldr r2, [r5]
	ldr r0, _08040F98
	ldrb r1, [r2, #1]
	adds r7, r5, #0
	mov r8, r0
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08040F78
_08040F6E:
	ldrb r0, [r2]
	cmp r0, #0x13
	bhi _08040F78
	bl DoBattlerEndTurnEffects
_08040F78:
	ldr r0, _08040F9C
	ldr r1, [r0]
	ldr r2, _08040FA0
	ands r1, r2
	str r1, [r0]
	movs r0, #0
_08040F84:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08040F94: .4byte 0x02024140
_08040F98: .4byte 0x02023D10
_08040F9C: .4byte 0x02023F24
_08040FA0: .4byte 0xFEFFFFDF
	thumb_func_end DoBattlerEndTurnEffects

	thumb_func_start HandleWishPerishSongOnTurnEnd
HandleWishPerishSongOnTurnEnd: @ 0x08040FA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _08040FD8
	ldr r0, [r2]
	ldr r1, _08040FDC
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08040FE0
	ldr r3, [r1]
	movs r4, #0xd0
	lsls r4, r4, #1
	adds r0, r3, r4
	ldrb r0, [r0]
	mov sl, r2
	adds r6, r1, #0
	cmp r0, #1
	bne _08040FCE
	b _08041188
_08040FCE:
	cmp r0, #1
	bgt _08040FE4
	cmp r0, #0
	beq _08040FEC
	b _08041348
	.align 2, 0
_08040FD8: .4byte 0x02023F24
_08040FDC: .4byte 0x01000020
_08040FE0: .4byte 0x02024140
_08040FE4:
	cmp r0, #2
	bne _08040FEA
	b _080412DA
_08040FEA:
	b _08041348
_08040FEC:
	ldr r2, _08041030
	adds r0, r3, r2
	ldr r1, _08041034
	ldrb r0, [r0]
	mov r8, r1
	ldrb r7, [r1]
	cmp r0, r7
	blo _08040FFE
	b _08041172
_08040FFE:
	ldr r4, _08041038
	ldr r5, _0804103C
	ldr r7, _08041040
	movs r0, #0x18
	adds r0, r0, r7
	mov ip, r0
_0804100A:
	ldr r0, [r6]
	adds r3, r0, r2
	ldrb r0, [r3]
	strb r0, [r4]
	ldr r0, _08041044
	ldrb r1, [r0]
	ldr r2, _08041048
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0804104C
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _08041160
	.align 2, 0
_08041030: .4byte 0x000001A1
_08041034: .4byte 0x02023D10
_08041038: .4byte 0x02023D08
_0804103C: .4byte 0x02022C0C
_08041040: .4byte 0x02024074
_08041044: .4byte 0x02023EB4
_08041048: .4byte 0x082FACB4
_0804104C:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r1, _08041090
	ldrb r0, [r4]
	adds r2, r0, r1
	ldrb r0, [r2]
	mov sb, r1
	cmp r0, #0
	bne _08041062
	b _08041160
_08041062:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08041160
	ldr r1, _08041094
	ldrb r2, [r4]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	beq _08041160
	lsls r0, r2, #1
	add r0, ip
	ldrh r0, [r0]
	cmp r0, #0xf8
	bne _0804109C
	ldr r0, _08041098
	strb r3, [r0, #5]
	b _080410A2
	.align 2, 0
_08041090: .4byte 0x02024074
_08041094: .4byte 0x02023D28
_08041098: .4byte 0x02023FD6
_0804109C:
	ldr r1, _0804113C
	movs r0, #1
	strb r0, [r1, #5]
_080410A2:
	movs r0, #0xfd
	strb r0, [r5]
	movs r6, #2
	movs r0, #2
	strb r0, [r5, #1]
	ldrb r0, [r4]
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	strb r0, [r5, #2]
	ldrb r0, [r4]
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsrs r0, r0, #8
	strb r0, [r5, #3]
	movs r0, #0xff
	strb r0, [r5, #4]
	ldr r5, _08041140
	ldrb r0, [r4]
	strb r0, [r5]
	ldr r1, _08041144
	adds r0, r7, #4
	ldrb r2, [r4]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r2, _08041148
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r2, _0804114C
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #4
	adds r0, r0, r2
	ldr r1, _08041150
	str r1, [r0]
	ldr r0, _08041154
	bl BattleScriptExecute
	ldrb r1, [r4]
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804110C
	b _080412A4
_0804110C:
	eors r1, r6
	mov r3, sb
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804111A
	b _080412A4
_0804111A:
	ldrb r0, [r5]
	bl GetBattlerPosition
	ldr r2, _08041158
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r4, _0804115C
	adds r2, r4, #0
	ands r1, r2
	strh r1, [r0]
	b _080412A4
	.align 2, 0
_0804113C: .4byte 0x02023FD6
_08041140: .4byte 0x02023EB0
_08041144: .4byte 0x02023EAF
_08041148: .4byte 0x02023E94
_0804114C: .4byte 0x02024020
_08041150: .4byte 0x0000FFFF
_08041154: .4byte 0x0828956C
_08041158: .4byte 0x02023F32
_0804115C: .4byte 0x0000FFBF
_08041160:
	ldr r0, [r6]
	ldr r2, _080411D8
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08041172
	b _0804100A
_08041172:
	ldr r0, [r6]
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6]
	ldr r3, _080411D8
	adds r1, r0, r3
	movs r0, #0
	strb r0, [r1]
_08041188:
	adds r3, r6, #0
	ldr r0, [r6]
	ldr r2, _080411D8
	adds r0, r0, r2
	ldr r1, _080411DC
	ldrb r0, [r0]
	mov r8, r1
	ldrb r4, [r1]
	cmp r0, r4
	blo _0804119E
	b _080412C4
_0804119E:
	ldr r5, _080411E0
	ldr r4, _080411E4
	ldr r7, _080411E8
	mov ip, r7
	ldr r0, _080411EC
	mov sb, r0
_080411AA:
	ldr r1, _080411F0
	ldr r0, [r3]
	adds r3, r0, r2
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, sb
	strb r0, [r1]
	strb r0, [r5]
	ldr r0, _080411F4
	ldrb r1, [r0]
	ldr r2, _080411F8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080411FC
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _080412B0
	.align 2, 0
_080411D8: .4byte 0x000001A1
_080411DC: .4byte 0x02023D10
_080411E0: .4byte 0x02023D08
_080411E4: .4byte 0x02022C0C
_080411E8: .4byte 0x02023F60
_080411EC: .4byte 0x02023EAF
_080411F0: .4byte 0x02023D22
_080411F4: .4byte 0x02023EB4
_080411F8: .4byte 0x082FACB4
_080411FC:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r7, _08041270
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080412B0
	movs r0, #0xfd
	strb r0, [r4]
	movs r0, #1
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r4, #4]
	movs r0, #0xff
	strb r0, [r4, #5]
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	mov r3, ip
	adds r4, r0, r3
	ldrb r3, [r4, #0xf]
	lsls r1, r3, #0x1c
	cmp r1, #0
	bne _08041284
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r0, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r3, _08041274
	ldr r2, _08041278
	ldrb r1, [r5]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #0x28]
	str r0, [r3]
	ldr r1, _0804127C
	ldr r0, _08041280
	b _0804129C
	.align 2, 0
_08041270: .4byte 0x02023F50
_08041274: .4byte 0x02023E94
_08041278: .4byte 0x02023D28
_0804127C: .4byte 0x02023EB8
_08041280: .4byte 0x0828948D
_08041284:
	lsrs r1, r1, #0x1c
	subs r1, #1
	movs r0, #0xf
	ands r1, r0
	movs r7, #0x10
	rsbs r7, r7, #0
	adds r0, r7, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, #0xf]
	ldr r1, _080412A8
	ldr r0, _080412AC
_0804129C:
	str r0, [r1]
	ldr r0, [r1]
	bl BattleScriptExecute
_080412A4:
	movs r0, #1
	b _08041354
	.align 2, 0
_080412A8: .4byte 0x02023EB8
_080412AC: .4byte 0x082894A8
_080412B0:
	adds r3, r6, #0
	ldr r0, [r6]
	ldr r2, _08041330
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bhs _080412C4
	b _080411AA
_080412C4:
	ldr r0, [r6]
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r6]
	ldr r3, _08041330
	adds r1, r0, r3
	movs r0, #0
	strb r0, [r1]
_080412DA:
	ldr r0, _08041334
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08041348
	ldr r0, [r6]
	adds r0, #0xda
	ldrb r0, [r0]
	cmp r0, #2
	bne _08041348
	ldr r1, _08041338
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	beq _08041348
	adds r0, r1, #0
	adds r0, #0x80
	ldrh r0, [r0]
	cmp r0, #0
	beq _08041348
	movs r4, #0
_08041306:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl CancelMultiTurnMoves
	adds r4, #1
	cmp r4, #1
	ble _08041306
	ldr r1, _0804133C
	ldr r0, _08041340
	str r0, [r1]
	bl BattleScriptExecute
	ldr r0, _08041344
	ldr r1, [r0]
	movs r4, #0xd0
	lsls r4, r4, #1
	adds r1, r1, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080412A4
	.align 2, 0
_08041330: .4byte 0x000001A1
_08041334: .4byte 0x02022C90
_08041338: .4byte 0x02023D28
_0804133C: .4byte 0x02023EB8
_08041340: .4byte 0x08289E7B
_08041344: .4byte 0x02024140
_08041348:
	mov r7, sl
	ldr r0, [r7]
	ldr r1, _08041364
	ands r0, r1
	str r0, [r7]
	movs r0, #0
_08041354:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041364: .4byte 0xFEFFFFDF
	thumb_func_end HandleWishPerishSongOnTurnEnd

	thumb_func_start HandleFaintedMonActions
HandleFaintedMonActions: @ 0x08041368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08041380
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080413B0
	b _0804164A
	.align 2, 0
_08041380: .4byte 0x02022C90
_08041384:
	ldr r0, _08041394
	bl BattleScriptExecute
	ldr r0, [r5]
	adds r0, #0x4d
	movs r1, #2
	b _080413A4
	.align 2, 0
_08041394: .4byte 0x08288D4C
_08041398:
	ldr r0, _080413AC
	bl BattleScriptExecute
	ldr r0, [r5]
	adds r0, #0x4d
	movs r1, #5
_080413A4:
	strb r1, [r0]
_080413A6:
	movs r0, #1
	b _0804164C
	.align 2, 0
_080413AC: .4byte 0x08288D55
_080413B0:
	ldr r0, _080413CC
	mov r8, r0
_080413B4:
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #7
	bls _080413C2
	b _0804163C
_080413C2:
	lsls r0, r0, #2
	ldr r1, _080413D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080413CC: .4byte 0x02024140
_080413D0: .4byte 0x080413D4
_080413D4: @ jump table
	.4byte _080413F4 @ case 0
	.4byte _08041446 @ case 1
	.4byte _080414E0 @ case 2
	.4byte _08041522 @ case 3
	.4byte _08041536 @ case 4
	.4byte _080415A0 @ case 5
	.4byte _080415D4 @ case 6
	.4byte _0804163C @ case 7
_080413F4:
	mov r4, r8
	ldr r0, [r4]
	adds r0, #0x4e
	movs r1, #0
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, #0x4d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r5, #0
	ldr r0, _080414C0
	ldrb r0, [r0]
	cmp r5, r0
	bge _08041446
	ldr r6, _080414C4
_08041414:
	ldrb r0, [r6]
	ldr r2, _080414C8
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r4, [r1]
	ands r0, r4
	cmp r0, #0
	beq _0804143C
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	movs r1, #6
	movs r2, #6
	bl HasNoMonsToSwitch
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804143C
	ldrb r0, [r6]
	bics r0, r4
	strb r0, [r6]
_0804143C:
	adds r5, #1
	ldr r0, _080414C0
	ldrb r0, [r0]
	cmp r5, r0
	blt _08041414
_08041446:
	ldr r0, _080414CC
	mov r8, r0
	ldr r1, _080414D0
	mov ip, r1
	ldr r2, _080414D4
	mov r5, r8
	ldr r7, _080414D8
	ldr r6, _080414DC
_08041456:
	ldr r3, [r5]
	adds r1, r3, #0
	adds r1, #0x4e
	ldrb r0, [r1]
	strb r0, [r2]
	mov r4, ip
	strb r0, [r4]
	ldrb r4, [r1]
	movs r0, #0x58
	muls r0, r4, r0
	adds r0, r0, r7
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _0804149E
	adds r0, r3, #0
	adds r0, #0xdf
	ldrb r1, [r0]
	ldr r3, _080414C8
	lsls r0, r4, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0804149E
	ldr r0, _080414C4
	ldrb r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0804149E
	b _08041384
_0804149E:
	ldr r0, [r5]
	adds r0, #0x4e
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, _080414C0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r0]
	cmp r1, r0
	bne _08041456
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x4d
	movs r1, #3
	strb r1, [r0]
	b _0804163C
	.align 2, 0
_080414C0: .4byte 0x02023D10
_080414C4: .4byte 0x02023EB4
_080414C8: .4byte 0x082FACB4
_080414CC: .4byte 0x02024140
_080414D0: .4byte 0x02023EB1
_080414D4: .4byte 0x02023EB0
_080414D8: .4byte 0x02023D28
_080414DC: .4byte 0x02023D12
_080414E0:
	ldr r0, _0804150C
	ldrb r0, [r0]
	bl sub_0803F62C
	ldr r2, _08041510
	ldr r1, [r2]
	adds r1, #0x4e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08041514
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _08041518
	ldr r0, [r2]
	adds r0, #0x4d
	movs r1, #3
	strb r1, [r0]
	b _0804163A
	.align 2, 0
_0804150C: .4byte 0x02023EB1
_08041510: .4byte 0x02024140
_08041514: .4byte 0x02023D10
_08041518:
	ldr r0, [r2]
	adds r0, #0x4d
	movs r1, #1
	strb r1, [r0]
	b _0804163A
_08041522:
	mov r4, r8
	ldr r0, [r4]
	adds r0, #0x4e
	movs r1, #0
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, #0x4d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08041536:
	ldr r0, _08041584
	mov ip, r0
	ldr r7, _08041588
	ldr r5, _0804158C
	ldr r2, _08041590
	ldr r6, _08041594
_08041542:
	ldr r0, [r5]
	adds r4, r0, #0
	adds r4, #0x4e
	ldrb r0, [r4]
	strb r0, [r7]
	mov r1, ip
	strb r0, [r1]
	ldrb r3, [r4]
	movs r0, #0x58
	muls r0, r3, r0
	adds r0, r0, r2
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08041570
	ldr r0, _08041598
	ldrb r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08041570
	b _08041398
_08041570:
	adds r0, r3, #1
	strb r0, [r4]
	ldr r1, _0804159C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _08041542
	b _080415B8
	.align 2, 0
_08041584: .4byte 0x02023EB1
_08041588: .4byte 0x02023EB0
_0804158C: .4byte 0x02024140
_08041590: .4byte 0x02023D28
_08041594: .4byte 0x082FACB4
_08041598: .4byte 0x02023EB4
_0804159C: .4byte 0x02023D10
_080415A0:
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x4e
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, _080415C4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r0]
	cmp r1, r0
	bne _080415C8
_080415B8:
	mov r4, r8
	ldr r0, [r4]
	adds r0, #0x4d
	movs r1, #6
	strb r1, [r0]
	b _0804163C
	.align 2, 0
_080415C4: .4byte 0x02023D10
_080415C8:
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x4d
	movs r1, #4
	strb r1, [r0]
	b _0804163C
_080415D4:
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080415EE
	b _080413A6
_080415EE:
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041604
	b _080413A6
_08041604:
	movs r0, #1
	movs r1, #0
	movs r2, #1
	bl ItemBattleEffects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08041618
	b _080413A6
_08041618:
	str r0, [sp]
	movs r0, #6
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804162E
	b _080413A6
_0804162E:
	ldr r2, _08041658
	ldr r1, [r2]
	adds r1, #0x4d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0804163A:
	mov r8, r2
_0804163C:
	mov r4, r8
	ldr r0, [r4]
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #7
	beq _0804164A
	b _080413B4
_0804164A:
	movs r0, #0
_0804164C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041658: .4byte 0x02024140
	thumb_func_end HandleFaintedMonActions

	thumb_func_start TryClearRageStatuses
TryClearRageStatuses: @ 0x0804165C
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r0, _0804169C
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r3, r0
	bge _08041694
	ldr r4, _080416A0
	movs r6, #0x80
	lsls r6, r6, #0x10
	ldr r2, _080416A4
_08041672:
	ldr r1, [r2]
	adds r0, r1, #0
	ands r0, r6
	cmp r0, #0
	beq _08041688
	ldrh r0, [r4]
	cmp r0, #0x63
	beq _08041688
	ldr r0, _080416A8
	ands r1, r0
	str r1, [r2]
_08041688:
	adds r4, #2
	adds r2, #0x58
	adds r3, #1
	ldrb r0, [r5]
	cmp r3, r0
	blt _08041672
_08041694:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804169C: .4byte 0x02023D10
_080416A0: .4byte 0x02023F18
_080416A4: .4byte 0x02023D78
_080416A8: .4byte 0xFF7FFFFF
	thumb_func_end TryClearRageStatuses

	thumb_func_start sub_080416AC
sub_080416AC: @ 0x080416AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #0
	mov sb, r0
	ldr r1, _080416C8
	mov sl, r1
	ldr r2, _080416CC
	mov r8, r2
	b _080416DA
	.align 2, 0
_080416C8: .4byte 0x0202411C
_080416CC: .4byte 0x02024140
	thumb_func_end sub_080416AC

	thumb_func_start AtkCanceller_UnableToUseMove
AtkCanceller_UnableToUseMove: @ 0x080416D0
	mov r3, sb
	cmp r3, #0
	beq _080416DA
	bl _08041FC8
_080416DA:
	mov r4, r8
	ldr r0, [r4]
	ldr r7, _080416F8
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0xe
	bls _080416EC
	bl _08041FB6
_080416EC:
	lsls r0, r0, #2
	ldr r1, _080416FC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080416F8: .4byte 0x000001A3
_080416FC: .4byte 0x08041700
_08041700: @ jump table
	.4byte _0804173C @ case 0
	.4byte _08041788 @ case 1
	.4byte _080418D0 @ case 2
	.4byte _08041990 @ case 3
	.4byte _08041A04 @ case 4
	.4byte _08041A80 @ case 5
	.4byte _08041AF8 @ case 6
	.4byte _08041B78 @ case 7
	.4byte _08041C00 @ case 8
	.4byte _08041C68 @ case 9
	.4byte _08041D54 @ case 10
	.4byte _08041DD4 @ case 11
	.4byte _08041E74 @ case 12
	.4byte _08041F5C @ case 13
	.4byte _08041FB6 @ case 14
_0804173C:
	ldr r1, _08041770
	ldr r3, _08041774
	ldrb r2, [r3]
	movs r0, #0x58
	muls r2, r0, r2
	adds r1, #0x50
	adds r2, r2, r1
	ldr r0, [r2]
	ldr r1, _08041778
	ands r0, r1
	str r0, [r2]
	ldr r0, _0804177C
	ldrb r2, [r3]
	lsls r2, r2, #2
	adds r2, r2, r0
	ldr r0, [r2]
	ldr r1, _08041780
	ands r0, r1
	str r0, [r2]
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _08041784
	adds r1, r0, r2
	bl _08041FB0
	.align 2, 0
_08041770: .4byte 0x02023D28
_08041774: .4byte 0x02023EAF
_08041778: .4byte 0xFDFFFFFF
_0804177C: .4byte 0x02023F50
_08041780: .4byte 0xFFFFBFFF
_08041784: .4byte 0x000001A3
_08041788:
	ldr r7, _080417F0
	ldr r4, _080417F4
	ldrb r1, [r4]
	movs r5, #0x58
	adds r0, r1, #0
	muls r0, r5, r0
	adds r6, r7, #0
	adds r6, #0x4c
	adds r0, r0, r6
	ldr r0, [r0]
	movs r3, #7
	mov r8, r3
	ands r0, r3
	cmp r0, #0
	bne _080417A8
	b _080418AE
_080417A8:
	adds r0, r1, #0
	bl UproarWakeUpCheck
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041808
	ldrb r0, [r4]
	adds r2, r0, #0
	muls r2, r5, r2
	adds r2, r2, r6
	ldr r0, [r2]
	movs r1, #8
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldrb r0, [r4]
	adds r2, r0, #0
	muls r2, r5, r2
	adds r0, r7, #0
	adds r0, #0x50
	adds r2, r2, r0
	ldr r0, [r2]
	ldr r1, _080417F8
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _080417FC
	movs r0, #1
	strb r0, [r1, #5]
	ldr r1, _08041800
	ldr r0, _08041804
	str r0, [r1]
	movs r4, #2
	mov sb, r4
	b _080418AE
	.align 2, 0
_080417F0: .4byte 0x02023D28
_080417F4: .4byte 0x02023EAF
_080417F8: .4byte 0xF7FFFFFF
_080417FC: .4byte 0x02023FD6
_08041800: .4byte 0x02023EB8
_08041804: .4byte 0x082897A8
_08041808:
	ldrb r0, [r4]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r1, r7
	adds r0, #0x20
	ldrb r0, [r0]
	movs r3, #1
	cmp r0, #0x30
	bne _0804181C
	movs r3, #2
_0804181C:
	adds r2, r1, r6
	ldr r1, [r2]
	adds r0, r1, #0
	mov r7, r8
	ands r0, r7
	cmp r0, r3
	bhs _08041834
	movs r0, #8
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	b _08041838
_08041834:
	subs r0, r1, r3
	str r0, [r2]
_08041838:
	ldr r2, _08041878
	ldr r0, _0804187C
	ldrb r1, [r0]
	movs r0, #0x58
	muls r1, r0, r1
	adds r0, r2, #0
	adds r0, #0x4c
	adds r0, r1, r0
	ldr r4, [r0]
	movs r0, #7
	ands r4, r0
	cmp r4, #0
	beq _08041890
	ldr r0, _08041880
	ldrh r0, [r0]
	cmp r0, #0xad
	beq _080418AE
	cmp r0, #0xd6
	beq _080418AE
	ldr r1, _08041884
	ldr r0, _08041888
	str r0, [r1]
	ldr r2, _0804188C
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
	movs r0, #2
	mov sb, r0
	b _080418AE
	.align 2, 0
_08041878: .4byte 0x02023D28
_0804187C: .4byte 0x02023EAF
_08041880: .4byte 0x02023E8E
_08041884: .4byte 0x02023EB8
_08041888: .4byte 0x0828979B
_0804188C: .4byte 0x02023F24
_08041890:
	adds r2, #0x50
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r1, _080418B8
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r0, _080418BC
	strb r4, [r0, #5]
	ldr r1, _080418C0
	ldr r0, _080418C4
	str r0, [r1]
	movs r1, #2
	mov sb, r1
_080418AE:
	ldr r1, _080418C8
	ldr r0, [r1]
	ldr r3, _080418CC
	adds r2, r0, r3
	b _08041DAA
	.align 2, 0
_080418B8: .4byte 0xF7FFFFFF
_080418BC: .4byte 0x02023FD6
_080418C0: .4byte 0x02023EB8
_080418C4: .4byte 0x082897A8
_080418C8: .4byte 0x02024140
_080418CC: .4byte 0x000001A3
_080418D0:
	ldr r1, _0804192C
	ldr r7, _08041930
	ldrb r0, [r7]
	movs r6, #0x58
	muls r0, r6, r0
	adds r5, r1, #0
	adds r5, #0x4c
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08041970
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08041948
	ldr r2, _08041934
	ldr r0, _08041938
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x7d
	bne _08041916
	b _08041DA2
_08041916:
	ldr r1, _0804193C
	ldr r0, _08041940
	str r0, [r1]
	ldr r2, _08041944
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r2]
	b _08041968
	.align 2, 0
_0804192C: .4byte 0x02023D28
_08041930: .4byte 0x02023EAF
_08041934: .4byte 0x082ED220
_08041938: .4byte 0x02023E8E
_0804193C: .4byte 0x02023EB8
_08041940: .4byte 0x082897F2
_08041944: .4byte 0x02023F24
_08041948:
	ldrb r0, [r7]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r2, r5
	ldr r0, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0804197C
	ldr r0, _08041980
	str r0, [r1]
	ldr r0, _08041984
	strb r4, [r0, #5]
_08041968:
	movs r7, #2
	mov sb, r7
	ldr r0, _08041988
	mov r8, r0
_08041970:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _0804198C
	adds r1, r0, r2
	b _08041FB0
	.align 2, 0
_0804197C: .4byte 0x02023EB8
_08041980: .4byte 0x082897FF
_08041984: .4byte 0x02023FD6
_08041988: .4byte 0x02024140
_0804198C: .4byte 0x000001A3
_08041990:
	ldr r1, _080419E4
	ldr r0, _080419E8
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x36
	beq _080419A6
	b _08041DA2
_080419A6:
	ldr r0, _080419EC
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x18]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080419BA
	b _08041DA2
_080419BA:
	adds r0, r2, #0
	bl CancelMultiTurnMoves
	ldr r2, _080419F0
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
	ldr r1, _080419F4
	movs r0, #0
	strb r0, [r1, #5]
	ldr r1, _080419F8
	ldr r0, _080419FC
	str r0, [r1]
	ldr r2, _08041A00
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	b _08041D9E
	.align 2, 0
_080419E4: .4byte 0x02023D28
_080419E8: .4byte 0x02023EAF
_080419EC: .4byte 0x02023F60
_080419F0: .4byte 0x02023F24
_080419F4: .4byte 0x02023FD6
_080419F8: .4byte 0x02023EB8
_080419FC: .4byte 0x08289C35
_08041A00: .4byte 0x02023F20
_08041A04:
	ldr r1, _08041A5C
	ldr r3, _08041A60
	ldrb r2, [r3]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08041A50
	ldr r0, _08041A64
	ands r1, r0
	str r1, [r2]
	ldr r2, _08041A68
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #0x19]
	ldrb r0, [r3]
	bl CancelMultiTurnMoves
	ldr r1, _08041A6C
	ldr r0, _08041A70
	str r0, [r1]
	ldr r2, _08041A74
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
	movs r7, #1
	mov sb, r7
_08041A50:
	ldr r1, _08041A78
	ldr r0, [r1]
	ldr r3, _08041A7C
	adds r2, r0, r3
	b _08041DAA
	.align 2, 0
_08041A5C: .4byte 0x02023D28
_08041A60: .4byte 0x02023EAF
_08041A64: .4byte 0xFFBFFFFF
_08041A68: .4byte 0x02023F60
_08041A6C: .4byte 0x02023EB8
_08041A70: .4byte 0x082879EA
_08041A74: .4byte 0x02023F24
_08041A78: .4byte 0x02024140
_08041A7C: .4byte 0x000001A3
_08041A80:
	ldr r1, _08041AD8
	ldr r3, _08041ADC
	ldrb r2, [r3]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08041ACC
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	ldr r0, _08041AE0
	ldrb r2, [r3]
	lsls r2, r2, #4
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #2]
	ldrb r0, [r3]
	bl CancelMultiTurnMoves
	ldr r1, _08041AE4
	ldr r0, _08041AE8
	str r0, [r1]
	ldr r2, _08041AEC
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
	movs r4, #1
	mov sb, r4
_08041ACC:
	ldr r1, _08041AF0
	ldr r0, [r1]
	ldr r7, _08041AF4
	adds r2, r0, r7
	b _08041DAA
	.align 2, 0
_08041AD8: .4byte 0x02023D28
_08041ADC: .4byte 0x02023EAF
_08041AE0: .4byte 0x02023FE0
_08041AE4: .4byte 0x02023EB8
_08041AE8: .4byte 0x08289823
_08041AEC: .4byte 0x02023F24
_08041AF0: .4byte 0x02024140
_08041AF4: .4byte 0x000001A3
_08041AF8:
	ldr r0, _08041B50
	ldr r3, _08041B54
	ldrb r2, [r3]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _08041B58
	ldrh r1, [r1, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _08041B44
	cmp r1, #0
	beq _08041B44
	ldr r0, _08041B5C
	lsls r2, r2, #4
	adds r2, r2, r0
	ldrb r0, [r2, #1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, _08041B60
	ldrb r0, [r3]
	strb r0, [r1, #0x17]
	ldrb r0, [r3]
	bl CancelMultiTurnMoves
	ldr r1, _08041B64
	ldr r0, _08041B68
	str r0, [r1]
	ldr r2, _08041B6C
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
	movs r0, #1
	mov sb, r0
_08041B44:
	ldr r1, _08041B70
	ldr r0, [r1]
	ldr r3, _08041B74
	adds r2, r0, r3
	b _08041DAA
	.align 2, 0
_08041B50: .4byte 0x02023F60
_08041B54: .4byte 0x02023EAF
_08041B58: .4byte 0x02023E8E
_08041B5C: .4byte 0x02023FE0
_08041B60: .4byte 0x02024118
_08041B64: .4byte 0x02023EB8
_08041B68: .4byte 0x0828939C
_08041B6C: .4byte 0x02023F24
_08041B70: .4byte 0x02024140
_08041B74: .4byte 0x000001A3
_08041B78:
	ldr r0, _08041BD8
	ldr r4, _08041BDC
	ldrb r3, [r4]
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x13]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _08041BCC
	ldr r2, _08041BE0
	ldr r0, _08041BE4
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08041BCC
	ldr r0, _08041BE8
	lsls r2, r3, #4
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #2]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
	ldr r1, _08041BEC
	ldr r0, _08041BF0
	str r0, [r1]
	ldr r2, _08041BF4
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
	movs r4, #1
	mov sb, r4
_08041BCC:
	ldr r1, _08041BF8
	ldr r0, [r1]
	ldr r7, _08041BFC
	adds r2, r0, r7
	b _08041DAA
	.align 2, 0
_08041BD8: .4byte 0x02023F60
_08041BDC: .4byte 0x02023EAF
_08041BE0: .4byte 0x082ED220
_08041BE4: .4byte 0x02023E8E
_08041BE8: .4byte 0x02023FE0
_08041BEC: .4byte 0x02023EB8
_08041BF0: .4byte 0x0828962C
_08041BF4: .4byte 0x02023F24
_08041BF8: .4byte 0x02024140
_08041BFC: .4byte 0x000001A3
_08041C00:
	ldr r4, _08041C48
	ldrb r0, [r4]
	ldr r1, _08041C4C
	ldrh r1, [r1]
	bl GetImprisonedMovesCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041C3E
	ldr r0, _08041C50
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, r2, r0
	ldrb r0, [r2, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
	ldr r1, _08041C54
	ldr r0, _08041C58
	str r0, [r1]
	ldr r2, _08041C5C
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
	movs r0, #1
	mov sb, r0
_08041C3E:
	ldr r1, _08041C60
	ldr r0, [r1]
	ldr r3, _08041C64
	adds r2, r0, r3
	b _08041DAA
	.align 2, 0
_08041C48: .4byte 0x02023EAF
_08041C4C: .4byte 0x02023E8E
_08041C50: .4byte 0x02023FE0
_08041C54: .4byte 0x02023EB8
_08041C58: .4byte 0x082896FE
_08041C5C: .4byte 0x02023F24
_08041C60: .4byte 0x02024140
_08041C64: .4byte 0x000001A3
_08041C68:
	ldr r7, _08041CB0
	ldr r5, _08041CB4
	ldrb r0, [r5]
	movs r6, #0x58
	muls r0, r6, r0
	adds r4, r7, #0
	adds r4, #0x50
	adds r2, r0, r4
	ldr r1, [r2]
	movs r3, #7
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	beq _08041D3A
	subs r0, r1, #1
	str r0, [r2]
	ldrb r0, [r5]
	muls r0, r6, r0
	adds r0, r0, r4
	ldr r0, [r0]
	ands r0, r3
	cmp r0, #0
	beq _08041D28
	bl Random
	movs r1, #1
	movs r2, #1
	ands r2, r0
	cmp r2, #0
	beq _08041CBC
	ldr r1, _08041CB8
	movs r0, #0
	strb r0, [r1, #5]
	bl BattleScriptPushCursor
	b _08041D06
	.align 2, 0
_08041CB0: .4byte 0x02023D28
_08041CB4: .4byte 0x02023EAF
_08041CB8: .4byte 0x02023FD6
_08041CBC:
	ldr r0, _08041D0C
	movs r4, #1
	strb r1, [r0, #5]
	ldr r1, _08041D10
	ldrb r0, [r5]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r1, r0, #0
	muls r1, r6, r1
	adds r1, r1, r7
	movs r0, #0x28
	str r0, [sp]
	str r2, [sp, #4]
	ldrb r0, [r5]
	str r0, [sp, #8]
	ldrb r0, [r5]
	str r0, [sp, #0xc]
	adds r0, r1, #0
	movs r2, #1
	movs r3, #0
	bl CalculateBaseDamage
	ldr r1, _08041D14
	str r0, [r1]
	ldr r0, _08041D18
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	orrs r0, r4
	strb r0, [r1, #1]
	ldr r2, _08041D1C
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
_08041D06:
	ldr r1, _08041D20
	ldr r0, _08041D24
	b _08041D30
	.align 2, 0
_08041D0C: .4byte 0x02023FD6
_08041D10: .4byte 0x02023EB0
_08041D14: .4byte 0x02023E94
_08041D18: .4byte 0x02023FE0
_08041D1C: .4byte 0x02023F24
_08041D20: .4byte 0x02023EB8
_08041D24: .4byte 0x08289845
_08041D28:
	bl BattleScriptPushCursor
	ldr r1, _08041D44
	ldr r0, _08041D48
_08041D30:
	str r0, [r1]
	movs r4, #1
	mov sb, r4
	ldr r7, _08041D4C
	mov r8, r7
_08041D3A:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _08041D50
	adds r1, r0, r2
	b _08041FB0
	.align 2, 0
_08041D44: .4byte 0x02023EB8
_08041D48: .4byte 0x08289888
_08041D4C: .4byte 0x02024140
_08041D50: .4byte 0x000001A3
_08041D54:
	ldr r1, _08041DB4
	ldr r4, _08041DB8
	ldrb r2, [r4]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08041DA2
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	bne _08041DA2
	ldr r0, _08041DBC
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08041DC0
	ldr r0, _08041DC4
	str r0, [r1]
	ldr r2, _08041DC8
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
_08041D9E:
	movs r3, #1
	mov sb, r3
_08041DA2:
	ldr r1, _08041DCC
	ldr r0, [r1]
	ldr r4, _08041DD0
	adds r2, r0, r4
_08041DAA:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	mov r8, r1
	b _08041FB6
	.align 2, 0
_08041DB4: .4byte 0x02023D28
_08041DB8: .4byte 0x02023EAF
_08041DBC: .4byte 0x02023FE0
_08041DC0: .4byte 0x02023EB8
_08041DC4: .4byte 0x08289813
_08041DC8: .4byte 0x02023F24
_08041DCC: .4byte 0x02024140
_08041DD0: .4byte 0x000001A3
_08041DD4:
	ldr r1, _08041E0C
	ldr r4, _08041E10
	ldrb r2, [r4]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r1, r0
	cmp r1, #0
	beq _08041E4E
	lsrs r0, r1, #0x10
	bl CountTrailingZeroBits
	ldr r1, _08041E14
	strb r0, [r1, #0x17]
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08041E18
	bl BattleScriptPushCursor
	b _08041E40
	.align 2, 0
_08041E0C: .4byte 0x02023D28
_08041E10: .4byte 0x02023EAF
_08041E14: .4byte 0x02024118
_08041E18:
	ldr r0, _08041E58
	bl BattleScriptPush
	ldr r2, _08041E5C
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r2]
	ldr r0, _08041E60
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, r2, r0
	ldrb r0, [r2, #1]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
_08041E40:
	ldr r1, _08041E64
	ldr r0, _08041E68
	str r0, [r1]
	movs r7, #1
	mov sb, r7
	ldr r0, _08041E6C
	mov r8, r0
_08041E4E:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _08041E70
	adds r1, r0, r2
	b _08041FB0
	.align 2, 0
_08041E58: .4byte 0x082898BC
_08041E5C: .4byte 0x02023F24
_08041E60: .4byte 0x02023FE0
_08041E64: .4byte 0x02023EB8
_08041E68: .4byte 0x082898AF
_08041E6C: .4byte 0x02024140
_08041E70: .4byte 0x000001A3
_08041E74:
	ldr r1, _08041EAC
	ldr r6, _08041EB0
	ldrb r0, [r6]
	movs r5, #0x58
	muls r0, r5, r0
	adds r1, #0x50
	adds r3, r0, r1
	ldr r2, [r3]
	movs r4, #0xc0
	lsls r4, r4, #2
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	beq _08041F46
	ldr r7, _08041EB4
	adds r0, r2, r7
	str r0, [r3]
	ldrb r2, [r6]
	adds r0, r2, #0
	muls r0, r5, r0
	adds r0, r0, r1
	ldr r0, [r0]
	ands r0, r4
	cmp r0, #0
	beq _08041EC0
	ldr r1, _08041EB8
	ldr r0, _08041EBC
	b _08041F40
	.align 2, 0
_08041EAC: .4byte 0x02023D28
_08041EB0: .4byte 0x02023EAF
_08041EB4: .4byte 0xFFFFFF00
_08041EB8: .4byte 0x02023EB8
_08041EBC: .4byte 0x082892F9
_08041EC0:
	ldr r3, _08041F18
	lsls r0, r2, #2
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _08041F3C
	ldr r1, _08041F1C
	movs r0, #0x75
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r0, r0, #1
	mov r1, sl
	str r0, [r1]
	ldr r4, _08041F20
	ldr r1, _08041F24
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _08041F28
	ldrb r1, [r0]
	ldr r2, _08041F2C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08041F0A
	movs r0, #0x75
	movs r1, #1
	bl GetMoveTarget
	strb r0, [r4]
_08041F0A:
	ldr r1, _08041F30
	ldr r0, _08041F34
	str r0, [r1]
	ldr r2, _08041F38
	mov r8, r2
	b _08041F42
	.align 2, 0
_08041F18: .4byte 0x02023E9C
_08041F1C: .4byte 0x02023E8E
_08041F20: .4byte 0x02023EB0
_08041F24: .4byte 0x02023F2C
_08041F28: .4byte 0x02023EB4
_08041F2C: .4byte 0x082FACB4
_08041F30: .4byte 0x02023EB8
_08041F34: .4byte 0x08289304
_08041F38: .4byte 0x02024140
_08041F3C:
	ldr r1, _08041F50
	ldr r0, _08041F54
_08041F40:
	str r0, [r1]
_08041F42:
	movs r3, #1
	mov sb, r3
_08041F46:
	mov r4, r8
	ldr r0, [r4]
	ldr r7, _08041F58
	adds r1, r0, r7
	b _08041FB0
	.align 2, 0
_08041F50: .4byte 0x02023EB8
_08041F54: .4byte 0x0828934C
_08041F58: .4byte 0x000001A3
_08041F5C:
	ldr r1, _08042008
	ldr r0, _0804200C
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x4c
	adds r4, r0, r1
	ldr r3, [r4]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08041FA8
	ldr r2, _08042010
	ldr r0, _08042014
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x7d
	bne _08041FA0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4]
	bl BattleScriptPushCursor
	ldr r1, _08042018
	ldr r0, _0804201C
	str r0, [r1]
	ldr r1, _08042020
	movs r0, #1
	strb r0, [r1, #5]
_08041FA0:
	movs r0, #2
	mov sb, r0
	ldr r1, _08042024
	mov r8, r1
_08041FA8:
	mov r2, r8
	ldr r0, [r2]
	ldr r3, _08042028
	adds r1, r0, r3
_08041FB0:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08041FB6:
	mov r4, r8
	ldr r0, [r4]
	ldr r7, _08042028
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _08041FC8
	bl AtkCanceller_UnableToUseMove
_08041FC8:
	mov r0, sb
	cmp r0, #2
	bne _08041FF4
	ldr r4, _0804202C
	ldr r0, _0804200C
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x58
	muls r0, r1, r0
	ldr r1, _08042030
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #0x28
	movs r2, #0
	movs r3, #4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_08041FF4:
	mov r0, sb
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08042008: .4byte 0x02023D28
_0804200C: .4byte 0x02023EAF
_08042010: .4byte 0x082ED220
_08042014: .4byte 0x02023E8E
_08042018: .4byte 0x02023EB8
_0804201C: .4byte 0x082897FF
_08042020: .4byte 0x02023FD6
_08042024: .4byte 0x02024140
_08042028: .4byte 0x000001A3
_0804202C: .4byte 0x02023D08
_08042030: .4byte 0x02023D74
	thumb_func_end AtkCanceller_UnableToUseMove

	thumb_func_start HasNoMonsToSwitch
HasNoMonsToSwitch: @ 0x08042034
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	ldr r0, _08042060
	ldr r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08042064
	movs r0, #0
	b _080422E0
	.align 2, 0
_08042060: .4byte 0x02022C90
_08042064:
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080420DC
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _080420D4
	mov r8, r1
	cmp r0, #0
	bne _08042082
	ldr r2, _080420D8
	mov r8, r2
_08042082:
	movs r0, #2
	ands r0, r4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x19
	lsls r0, r6, #1
	adds r4, r0, r6
	adds r0, r4, #3
	cmp r4, r0
	bge _080420CC
	adds r7, r0, #0
_08042096:
	movs r0, #0x64
	muls r0, r4, r0
	mov r1, r8
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080420C6
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _080420C6
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	bne _080420CC
_080420C6:
	adds r4, #1
	cmp r4, r7
	blt _08042096
_080420CC:
	movs r1, #0
	lsls r0, r6, #1
	adds r0, r0, r6
	b _08042196
	.align 2, 0
_080420D4: .4byte 0x020243E8
_080420D8: .4byte 0x02024190
_080420DC:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080421AC
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08042124
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08042110
	ldr r2, _0804210C
	mov r8, r2
	adds r0, r4, #0
	bl GetBattlerMultiplayerId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08042142
	.align 2, 0
_0804210C: .4byte 0x02024190
_08042110:
	ldr r0, _08042120
	mov r8, r0
	movs r1, #1
	eors r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r6, r0, #0x1f
	b _0804214C
	.align 2, 0
_08042120: .4byte 0x020243E8
_08042124:
	adds r0, r4, #0
	bl GetBattlerMultiplayerId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _080421A4
	mov r8, r1
	cmp r0, #0
	bne _08042142
	ldr r2, _080421A8
	mov r8, r2
_08042142:
	adds r0, r7, #0
	bl GetLinkTrainerFlankId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0804214C:
	lsls r0, r6, #1
	adds r4, r0, r6
	adds r1, r4, #3
	mov sb, r0
	cmp r4, r1
	bge _08042190
	adds r7, r1, #0
_0804215A:
	movs r0, #0x64
	muls r0, r4, r0
	mov r1, r8
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _0804218A
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _0804218A
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	bne _08042190
_0804218A:
	adds r4, #1
	cmp r4, r7
	blt _0804215A
_08042190:
	movs r1, #0
	mov r2, sb
	adds r0, r2, r6
_08042196:
	adds r0, #3
	cmp r4, r0
	bne _0804219E
	movs r1, #1
_0804219E:
	adds r0, r1, #0
	b _080422E0
	.align 2, 0
_080421A4: .4byte 0x020243E8
_080421A8: .4byte 0x02024190
_080421AC:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0804221A
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0804221A
	ldr r0, _080421D8
	mov r8, r0
	movs r6, #3
	cmp r4, #1
	bne _080421D0
	movs r6, #0
_080421D0:
	adds r4, r6, #0
	adds r6, r4, #3
	b _080421DE
	.align 2, 0
_080421D8: .4byte 0x020243E8
_080421DC:
	adds r4, #1
_080421DE:
	cmp r4, r6
	bge _08042212
	movs r0, #0x64
	muls r0, r4, r0
	mov r1, r8
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080421DC
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _080421DC
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _080421DC
_08042212:
	movs r0, #0
	cmp r4, r6
	bne _080422E0
	b _080422DE
_0804221A:
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08042248
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #3
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _08042244
	mov r8, r2
	b _08042260
	.align 2, 0
_08042244: .4byte 0x020243E8
_08042248:
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #2
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080422F0
	mov r8, r0
_08042260:
	mov r1, sl
	cmp r1, #6
	bne _08042270
	ldr r1, _080422F4
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sl, r0
_08042270:
	mov r2, sb
	cmp r2, #6
	bne _08042280
	ldr r1, _080422F4
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
_08042280:
	movs r4, #0
_08042282:
	movs r0, #0x64
	muls r0, r4, r0
	mov r1, r8
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080422D2
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _080422D2
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _080422D2
	cmp r4, sl
	beq _080422D2
	cmp r4, sb
	beq _080422D2
	ldr r0, _080422F8
	ldr r1, [r0]
	adds r0, r7, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r4, r0
	beq _080422D2
	adds r0, r6, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r4, r0
	bne _080422D8
_080422D2:
	adds r4, #1
	cmp r4, #5
	ble _08042282
_080422D8:
	movs r0, #0
	cmp r4, #6
	bne _080422E0
_080422DE:
	movs r0, #1
_080422E0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080422F0: .4byte 0x02024190
_080422F4: .4byte 0x02023D12
_080422F8: .4byte 0x02024140
	thumb_func_end HasNoMonsToSwitch

	thumb_func_start CastformDataTypeChange
CastformDataTypeChange: @ 0x080422FC
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	ldr r1, _0804236C
	movs r0, #0x58
	muls r0, r6, r0
	adds r4, r0, r1
	ldrh r1, [r4]
	ldr r0, _08042370
	cmp r1, r0
	bne _080423A0
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _080423A0
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	beq _080423A0
	str r5, [sp]
	movs r0, #0x13
	movs r1, #0
	movs r2, #0xd
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804234E
	str r5, [sp]
	movs r0, #0x13
	movs r1, #0
	movs r2, #0x4d
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042374
_0804234E:
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #0
	beq _08042374
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0
	beq _08042374
	strb r5, [r2]
	strb r5, [r1]
	movs r0, #1
	b _08042458
	.align 2, 0
_0804236C: .4byte 0x02023D28
_08042370: .4byte 0x00000181
_08042374:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0
	movs r2, #0xd
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080423A0
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0
	movs r2, #0x4d
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080423A4
_080423A0:
	movs r0, #0
	b _08042458
_080423A4:
	ldr r1, _08042460
	ldrh r0, [r1]
	movs r2, #0xe7
	ands r2, r0
	adds r4, r1, #0
	cmp r2, #0
	bne _080423D2
	ldr r1, _08042464
	movs r0, #0x58
	muls r0, r6, r0
	adds r1, r0, r1
	adds r3, r1, #0
	adds r3, #0x21
	ldrb r0, [r3]
	cmp r0, #0
	beq _080423D2
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0
	beq _080423D2
	strb r2, [r3]
	strb r2, [r1]
	movs r5, #1
_080423D2:
	ldrh r1, [r4]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _080423FE
	ldr r1, _08042464
	movs r0, #0x58
	muls r0, r6, r0
	adds r1, r0, r1
	adds r2, r1, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #0xa
	beq _080423FE
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xa
	beq _080423FE
	movs r0, #0xa
	strb r0, [r2]
	strb r0, [r1]
	movs r5, #2
_080423FE:
	ldrh r1, [r4]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0804242A
	ldr r1, _08042464
	movs r0, #0x58
	muls r0, r6, r0
	adds r1, r0, r1
	adds r2, r1, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #0xb
	beq _0804242A
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xb
	beq _0804242A
	movs r0, #0xb
	strb r0, [r2]
	strb r0, [r1]
	movs r5, #3
_0804242A:
	ldrh r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08042456
	ldr r1, _08042464
	movs r0, #0x58
	muls r0, r6, r0
	adds r1, r0, r1
	adds r2, r1, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #0xf
	beq _08042456
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xf
	beq _08042456
	movs r0, #0xf
	strb r0, [r2]
	strb r0, [r1]
	movs r5, #4
_08042456:
	adds r0, r5, #0
_08042458:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08042460: .4byte 0x02024070
_08042464: .4byte 0x02023D28
	thumb_func_end CastformDataTypeChange

	thumb_func_start AbilityBattleEffects
AbilityBattleEffects: @ 0x08042468
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r4, [sp, #0x48]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	mov sb, r0
	ldr r5, _080424C4
	ldr r1, _080424C8
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	blo _080424A4
	mov r1, sl
	strb r1, [r5]
_080424A4:
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080424D4
	ldr r1, _080424CC
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _080424D0
	b _080424E4
	.align 2, 0
_080424C4: .4byte 0x02023EAF
_080424C8: .4byte 0x02023D10
_080424CC: .4byte 0x02023D12
_080424D0: .4byte 0x02024190
_080424D4:
	ldr r1, _08042514
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08042518
_080424E4:
	adds r7, r1, r0
	ldr r5, _0804251C
	ldr r1, _08042520
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	blo _080424F6
	mov r2, sl
	strb r2, [r5]
_080424F6:
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08042528
	ldr r1, _08042514
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08042524
	b _08042538
	.align 2, 0
_08042514: .4byte 0x02023D12
_08042518: .4byte 0x020243E8
_0804251C: .4byte 0x02023EB0
_08042520: .4byte 0x02023D10
_08042524: .4byte 0x02024190
_08042528:
	ldr r1, _08042588
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0804258C
_08042538:
	adds r5, r1, r0
	adds r0, r7, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #0
	bl GetMonData
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #0
	bl GetMonData
	str r0, [sp, #0x14]
	ldr r0, _08042590
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804257A
	bl _0804407A
_0804257A:
	mov r3, r8
	cmp r3, #0
	beq _08042598
	ldr r0, _08042594
	strb r3, [r0]
	adds r7, r0, #0
	b _080425AE
	.align 2, 0
_08042588: .4byte 0x02023D12
_0804258C: .4byte 0x020243E8
_08042590: .4byte 0x02022C90
_08042594: .4byte 0x02023EAE
_08042598:
	ldr r2, _080425B8
	ldr r1, _080425BC
	movs r0, #0x58
	mov r5, sl
	muls r5, r0, r5
	adds r0, r5, #0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	strb r0, [r2]
	adds r7, r2, #0
_080425AE:
	cmp r4, #0
	beq _080425C0
	adds r5, r4, #0
	b _080425C4
	.align 2, 0
_080425B8: .4byte 0x02023EAE
_080425BC: .4byte 0x02023D28
_080425C0:
	ldr r0, _080425D8
	ldrh r5, [r0]
_080425C4:
	ldr r1, _080425DC
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	mov r8, r1
	cmp r0, #0
	beq _080425E0
	movs r3, #0x3f
	ands r3, r0
	b _080425EC
	.align 2, 0
_080425D8: .4byte 0x02023E8E
_080425DC: .4byte 0x02024140
_080425E0:
	ldr r1, _08042600
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r3, [r0, #2]
_080425EC:
	ldr r0, [sp, #4]
	cmp r0, #0x13
	bls _080425F6
	bl _0804405E
_080425F6:
	lsls r0, r0, #2
	ldr r1, _08042604
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08042600: .4byte 0x082ED220
_08042604: .4byte 0x08042608
_08042608: @ jump table
	.4byte _08042658 @ case 0
	.4byte _0804291C @ case 1
	.4byte _08042B38 @ case 2
	.4byte _08042BCC @ case 3
	.4byte _08042DEC @ case 4
	.4byte _08043548 @ case 5
	.4byte _080438AC @ case 6
	.4byte _080438FC @ case 7
	.4byte _08043980 @ case 8
	.4byte _08043A04 @ case 9
	.4byte _08043C24 @ case 10
	.4byte _08043A48 @ case 11
	.4byte _08043C68 @ case 12
	.4byte _08043CC4 @ case 13
	.4byte _08043D20 @ case 14
	.4byte _08043E1C @ case 15
	.4byte _08043E60 @ case 16
	.4byte _08043EBC @ case 17
	.4byte _0804402C @ case 18
	.4byte _08043DD6 @ case 19
_08042658:
	ldr r2, _0804268C
	ldr r0, _08042690
	ldrb r1, [r2]
	adds r5, r0, #0
	ldrb r3, [r5]
	cmp r1, r3
	blo _0804266A
	mov r0, sl
	strb r0, [r2]
_0804266A:
	ldrb r0, [r7]
	cmp r0, #0x2d
	bne _08042672
	b _080427E8
_08042672:
	cmp r0, #0x2d
	bgt _080426A4
	cmp r0, #0xd
	bne _0804267C
	b _080428E4
_0804267C:
	cmp r0, #0xd
	bgt _08042694
	cmp r0, #2
	bne _08042686
	b _080427B8
_08042686:
	bl _0804405E
	.align 2, 0
_0804268C: .4byte 0x02023EAF
_08042690: .4byte 0x02023D10
_08042694:
	cmp r0, #0x16
	bne _0804269A
	b _08042848
_0804269A:
	cmp r0, #0x24
	bne _080426A0
	b _080428A8
_080426A0:
	bl _0804405E
_080426A4:
	cmp r0, #0x46
	bne _080426AA
	b _08042818
_080426AA:
	cmp r0, #0x46
	bgt _080426B8
	cmp r0, #0x3b
	bne _080426B4
	b _0804287C
_080426B4:
	bl _0804405E
_080426B8:
	cmp r0, #0x4d
	bne _080426BE
	b _080428E4
_080426BE:
	cmp r0, #0xff
	beq _080426C6
	bl _0804405E
_080426C6:
	ldr r0, _080426EC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _0804278C
	bl GetCurrentWeather
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #3
	cmp r0, #0xa
	bhi _0804278C
	lsls r0, r0, #2
	ldr r1, _080426F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080426EC: .4byte 0x02022C90
_080426F0: .4byte 0x080426F4
_080426F4: @ jump table
	.4byte _08042720 @ case 0
	.4byte _0804278C @ case 1
	.4byte _08042720 @ case 2
	.4byte _0804278C @ case 3
	.4byte _0804278C @ case 4
	.4byte _08042744 @ case 5
	.4byte _0804278C @ case 6
	.4byte _0804278C @ case 7
	.4byte _0804278C @ case 8
	.4byte _08042768 @ case 9
	.4byte _08042720 @ case 10
_08042720:
	ldr r2, _0804273C
	ldrh r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0804278C
	movs r0, #5
	strh r0, [r2]
	ldr r1, _08042740
	movs r0, #0xa
	strb r0, [r1, #0x10]
	mov r2, sl
	strb r2, [r1, #0x17]
	b _08042782
	.align 2, 0
_0804273C: .4byte 0x02024070
_08042740: .4byte 0x02024118
_08042744:
	ldr r3, _08042760
	ldrh r1, [r3]
	movs r2, #0x18
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0804278C
	strh r2, [r3]
	ldr r1, _08042764
	movs r0, #0xc
	strb r0, [r1, #0x10]
	mov r3, sl
	strb r3, [r1, #0x17]
	b _08042782
	.align 2, 0
_08042760: .4byte 0x02024070
_08042764: .4byte 0x02024118
_08042768:
	ldr r3, _080427A8
	ldrh r1, [r3]
	movs r2, #0x60
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0804278C
	strh r2, [r3]
	ldr r1, _080427AC
	movs r0, #0xb
	strb r0, [r1, #0x10]
	mov r5, sl
	strb r5, [r1, #0x17]
_08042782:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0804278C:
	mov r0, sb
	cmp r0, #0
	bne _08042796
	bl _0804407A
_08042796:
	bl GetCurrentWeather
	ldr r1, _080427B0
	strb r0, [r1, #5]
	ldr r0, _080427B4
	bl BattleScriptPushCursorAndCallback
	bl _0804405E
	.align 2, 0
_080427A8: .4byte 0x02024070
_080427AC: .4byte 0x02024118
_080427B0: .4byte 0x02023FD6
_080427B4: .4byte 0x0828926F
_080427B8:
	ldr r2, _080427DC
	ldrh r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080427C8
	bl _0804405E
_080427C8:
	movs r0, #5
	strh r0, [r2]
	ldr r0, _080427E0
	bl BattleScriptPushCursorAndCallback
	ldr r0, _080427E4
	mov r1, sl
	strb r1, [r0, #0x17]
	bl _08044010
	.align 2, 0
_080427DC: .4byte 0x02024070
_080427E0: .4byte 0x082899B8
_080427E4: .4byte 0x02024118
_080427E8:
	ldr r2, _0804280C
	ldrh r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080427F8
	bl _0804405E
_080427F8:
	movs r0, #0x18
	strh r0, [r2]
	ldr r0, _08042810
	bl BattleScriptPushCursorAndCallback
	ldr r0, _08042814
	mov r2, sl
	strb r2, [r0, #0x17]
	bl _08044010
	.align 2, 0
_0804280C: .4byte 0x02024070
_08042810: .4byte 0x082899F8
_08042814: .4byte 0x02024118
_08042818:
	ldr r2, _0804283C
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08042828
	bl _0804405E
_08042828:
	movs r0, #0x60
	strh r0, [r2]
	ldr r0, _08042840
	bl BattleScriptPushCursorAndCallback
	ldr r0, _08042844
	mov r3, sl
	strb r3, [r0, #0x17]
	bl _08044010
	.align 2, 0
_0804283C: .4byte 0x02024070
_08042840: .4byte 0x08289AB2
_08042844: .4byte 0x02024118
_08042848:
	ldr r0, _08042874
	mov r5, sl
	lsls r2, r5, #2
	adds r1, r2, r5
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bge _08042860
	bl _0804405E
_08042860:
	ldr r1, _08042878
	adds r1, r2, r1
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0xc
	orrs r0, r2
	str r0, [r1]
	ldrb r0, [r3]
	movs r1, #8
	b _080428D2
	.align 2, 0
_08042874: .4byte 0x02024020
_08042878: .4byte 0x02023F50
_0804287C:
	mov r0, sl
	bl CastformDataTypeChange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0
	bne _08042890
	bl _0804407A
_08042890:
	ldr r0, _080428A0
	bl BattleScriptPushCursorAndCallback
	ldr r0, _080428A4
	mov r1, sl
	strb r1, [r0, #0x17]
	bl _08043F22
	.align 2, 0
_080428A0: .4byte 0x08289A31
_080428A4: .4byte 0x02024118
_080428A8:
	ldr r0, _080428DC
	mov r3, sl
	lsls r2, r3, #2
	adds r1, r2, r3
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _080428C0
	bl _0804405E
_080428C0:
	ldr r1, _080428E0
	adds r1, r2, r1
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0xd
	orrs r0, r2
	str r0, [r1]
	ldrb r0, [r3]
	movs r1, #0x10
_080428D2:
	orrs r0, r1
	strb r0, [r3]
	bl _0804405E
	.align 2, 0
_080428DC: .4byte 0x02024020
_080428E0: .4byte 0x02023F50
_080428E4:
	movs r6, #0
	ldrb r5, [r5]
	cmp r6, r5
	blo _080428F0
	bl _0804405E
_080428F0:
	adds r0, r6, #0
	bl CastformDataTypeChange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0
	beq _08042904
	bl sub_08043F18
_08042904:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08042918
	ldrb r0, [r0]
	cmp r6, r0
	blo _080428F0
	bl _0804405E
	.align 2, 0
_08042918: .4byte 0x02023D10
_0804291C:
	ldr r5, _0804294C
	mov r8, r5
	movs r0, #0x58
	mov r6, sl
	muls r6, r0, r6
	adds r4, r6, r5
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	bne _08042932
	bl _0804405E
_08042932:
	ldr r0, _08042950
	mov r1, sl
	strb r1, [r0]
	ldrb r5, [r7]
	cmp r5, #0x2c
	beq _08042962
	cmp r5, #0x2c
	bgt _08042954
	cmp r5, #3
	bne _08042948
	b _08042AC4
_08042948:
	bl _0804405E
	.align 2, 0
_0804294C: .4byte 0x02023D28
_08042950: .4byte 0x02023EAF
_08042954:
	cmp r5, #0x36
	bne _0804295A
	b _08042B10
_0804295A:
	cmp r5, #0x3d
	beq _080429E0
	bl _0804405E
_08042962:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0
	movs r2, #0xd
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0804297E
	bl _0804405E
_0804297E:
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0
	movs r2, #0x4d
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042996
	bl _0804405E
_08042996:
	ldr r0, _080429D4
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080429A6
	bl _0804405E
_080429A6:
	ldrh r0, [r4, #0x2c]
	ldrh r2, [r4, #0x28]
	cmp r0, r2
	bhi _080429B2
	bl _0804405E
_080429B2:
	strb r5, [r7]
	ldr r0, _080429D8
	bl BattleScriptPushCursorAndCallback
	ldr r1, _080429DC
	ldrh r0, [r4, #0x2c]
	lsrs r0, r0, #4
	str r0, [r1]
	cmp r0, #0
	bne _080429CA
	movs r0, #1
	str r0, [r1]
_080429CA:
	ldr r0, [r1]
	rsbs r0, r0, #0
	str r0, [r1]
	bl _08044010
	.align 2, 0
_080429D4: .4byte 0x02024070
_080429D8: .4byte 0x082899E4
_080429DC: .4byte 0x02023E94
_080429E0:
	mov r0, r8
	adds r0, #0x4c
	adds r5, r6, r0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080429F0
	bl _0804405E
_080429F0:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08042A0A
	bl _0804405E
_08042A0A:
	ldr r0, [r5]
	movs r1, #0x88
	ands r0, r1
	cmp r0, #0
	beq _08042A1C
	ldr r0, _08042A9C
	ldr r1, _08042AA0
	bl StringCopy
_08042A1C:
	ldr r0, [r5]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08042A2E
	ldr r0, _08042A9C
	ldr r1, _08042AA4
	bl StringCopy
_08042A2E:
	ldr r0, [r5]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08042A40
	ldr r0, _08042A9C
	ldr r1, _08042AA8
	bl StringCopy
_08042A40:
	ldr r0, [r5]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08042A52
	ldr r0, _08042A9C
	ldr r1, _08042AAC
	bl StringCopy
_08042A52:
	ldr r0, [r5]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08042A64
	ldr r0, _08042A9C
	ldr r1, _08042AB0
	bl StringCopy
_08042A64:
	str r4, [r5]
	mov r1, r8
	adds r1, #0x50
	adds r1, r6, r1
	ldr r0, [r1]
	ldr r2, _08042AB4
	ands r0, r2
	str r0, [r1]
	ldr r0, _08042AB8
	ldr r4, _08042ABC
	mov r3, sl
	strb r3, [r4]
	strb r3, [r0, #0x17]
	ldr r0, _08042AC0
	bl BattleScriptPushCursorAndCallback
	str r5, [sp]
	movs r0, #0
	movs r1, #0x28
	movs r2, #0
	movs r3, #4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	bl _08044010
	.align 2, 0
_08042A9C: .4byte 0x02022C0C
_08042AA0: .4byte 0x085ABC54
_08042AA4: .4byte 0x085ABC50
_08042AA8: .4byte 0x085ABC5B
_08042AAC: .4byte 0x085ABC57
_08042AB0: .4byte 0x085ABC5E
_08042AB4: .4byte 0xF7FFFFFF
_08042AB8: .4byte 0x02024118
_08042ABC: .4byte 0x02023D08
_08042AC0: .4byte 0x08289A0C
_08042AC4:
	ldrb r2, [r4, #0x1b]
	movs r0, #0x1b
	ldrsb r0, [r4, r0]
	cmp r0, #0xb
	ble _08042AD2
	bl _0804405E
_08042AD2:
	ldr r0, _08042B04
	mov r5, sl
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x16]
	cmp r0, #2
	bne _08042AE8
	bl _0804405E
_08042AE8:
	adds r0, r2, #1
	movs r1, #0
	strb r0, [r4, #0x1b]
	ldr r4, _08042B08
	movs r0, #0x11
	strb r0, [r4, #0x10]
	strb r1, [r4, #0x11]
	ldr r0, _08042B0C
	bl BattleScriptPushCursorAndCallback
	strb r5, [r4, #0x17]
	bl _08044010
	.align 2, 0
_08042B04: .4byte 0x02023F60
_08042B08: .4byte 0x02024118
_08042B0C: .4byte 0x082899CC
_08042B10:
	ldr r2, _08042B34
	ldrb r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r3, [r1, #0x18]
	lsls r0, r3, #0x1f
	lsrs r0, r0, #0x1f
	movs r2, #1
	eors r2, r0
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #0x18]
	bl _0804405E
	.align 2, 0
_08042B34: .4byte 0x02023F60
_08042B38:
	ldrb r0, [r7]
	cmp r0, #0x2b
	beq _08042B42
	bl _0804405E
_08042B42:
	movs r4, #0
	ldr r0, _08042BB0
	ldrh r2, [r0]
	ldr r3, _08042BB4
	adds r1, r0, #0
	cmp r2, r3
	bne _08042B54
	bl _0804405E
_08042B54:
	cmp r2, r5
	beq _08042B6C
	adds r2, r1, #0
_08042B5A:
	adds r2, #2
	adds r4, #1
	ldrh r0, [r2]
	cmp r0, r3
	bne _08042B68
	bl _0804405E
_08042B68:
	cmp r0, r5
	bne _08042B5A
_08042B6C:
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _08042BB4
	cmp r1, r0
	bne _08042B7C
	bl _0804405E
_08042B7C:
	ldr r1, _08042BB8
	ldr r0, _08042BBC
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _08042BA2
	ldr r0, _08042BC0
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	orrs r1, r2
	str r1, [r0]
_08042BA2:
	ldr r1, _08042BC4
	ldr r0, _08042BC8
	str r0, [r1]
	movs r0, #1
	mov sb, r0
	bl _08044064
	.align 2, 0
_08042BB0: .4byte 0x082EC67C
_08042BB4: .4byte 0x0000FFFF
_08042BB8: .4byte 0x02023D28
_08042BBC: .4byte 0x02023EAF
_08042BC0: .4byte 0x02023F24
_08042BC4: .4byte 0x02023EB8
_08042BC8: .4byte 0x08289BA7
_08042BCC:
	cmp r5, #0
	bne _08042BD4
	bl _0804405E
_08042BD4:
	ldrb r0, [r7]
	cmp r0, #0xb
	beq _08042C44
	cmp r0, #0xb
	bgt _08042BE4
	cmp r0, #0xa
	beq _08042BEA
	b _08042D66
_08042BE4:
	cmp r0, #0x12
	beq _08042C9C
	b _08042D66
_08042BEA:
	cmp r3, #0xd
	beq _08042BF0
	b _08042D66
_08042BF0:
	ldr r0, _08042C1C
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _08042C02
	b _08042D66
_08042C02:
	ldr r1, _08042C20
	ldr r0, _08042C24
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bge _08042C30
	ldr r1, _08042C28
	ldr r0, _08042C2C
	b _08042C34
	.align 2, 0
_08042C1C: .4byte 0x082ED220
_08042C20: .4byte 0x02023FE0
_08042C24: .4byte 0x02023EAF
_08042C28: .4byte 0x02023EB8
_08042C2C: .4byte 0x08289AF7
_08042C30:
	ldr r1, _08042C3C
	ldr r0, _08042C40
_08042C34:
	str r0, [r1]
	movs r1, #1
	b _08042D64
	.align 2, 0
_08042C3C: .4byte 0x02023EB8
_08042C40: .4byte 0x08289AF6
_08042C44:
	cmp r3, #0xb
	beq _08042C4A
	b _08042D66
_08042C4A:
	ldr r0, _08042C74
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _08042C5C
	b _08042D66
_08042C5C:
	ldr r1, _08042C78
	ldr r0, _08042C7C
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bge _08042C88
	ldr r1, _08042C80
	ldr r0, _08042C84
	b _08042C8C
	.align 2, 0
_08042C74: .4byte 0x082ED220
_08042C78: .4byte 0x02023FE0
_08042C7C: .4byte 0x02023EAF
_08042C80: .4byte 0x02023EB8
_08042C84: .4byte 0x08289AF7
_08042C88:
	ldr r1, _08042C94
	ldr r0, _08042C98
_08042C8C:
	str r0, [r1]
	movs r2, #1
	mov sb, r2
	b _08042D66
	.align 2, 0
_08042C94: .4byte 0x02023EB8
_08042C98: .4byte 0x08289AF6
_08042C9C:
	cmp r3, #0xa
	bne _08042D66
	ldr r1, _08042CEC
	movs r0, #0x58
	mov r3, sl
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08042D66
	ldr r2, _08042CF0
	ldr r0, [r2]
	ldr r0, [r0, #4]
	mov r5, sl
	lsls r1, r5, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r4, #1
	ands r3, r4
	adds r5, r1, #0
	cmp r3, #0
	bne _08042D2C
	ldr r0, _08042CF4
	strb r3, [r0, #5]
	ldr r1, _08042CF8
	ldr r0, _08042CFC
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bge _08042D08
	ldr r1, _08042D00
	ldr r0, _08042D04
	b _08042D0C
	.align 2, 0
_08042CEC: .4byte 0x02023D28
_08042CF0: .4byte 0x0202414C
_08042CF4: .4byte 0x02023FD6
_08042CF8: .4byte 0x02023FE0
_08042CFC: .4byte 0x02023EAF
_08042D00: .4byte 0x02023EB8
_08042D04: .4byte 0x08289B30
_08042D08:
	ldr r1, _08042D24
	ldr r0, _08042D28
_08042D0C:
	str r0, [r1]
	ldr r0, [r2]
	ldr r1, [r0, #4]
	adds r1, r1, r5
	ldr r0, [r1]
	movs r2, #1
	orrs r0, r2
	str r0, [r1]
	movs r0, #2
	mov sb, r0
	b _08042D66
	.align 2, 0
_08042D24: .4byte 0x02023EB8
_08042D28: .4byte 0x08289B2F
_08042D2C:
	ldr r0, _08042D48
	strb r4, [r0, #5]
	ldr r1, _08042D4C
	ldr r0, _08042D50
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bge _08042D5C
	ldr r1, _08042D54
	ldr r0, _08042D58
	b _08042D60
	.align 2, 0
_08042D48: .4byte 0x02023FD6
_08042D4C: .4byte 0x02023FE0
_08042D50: .4byte 0x02023EAF
_08042D54: .4byte 0x02023EB8
_08042D58: .4byte 0x08289B30
_08042D5C:
	ldr r1, _08042DA0
	ldr r0, _08042DA4
_08042D60:
	str r0, [r1]
	movs r1, #2
_08042D64:
	mov sb, r1
_08042D66:
	mov r2, sb
	cmp r2, #1
	beq _08042D70
	bl _0804405E
_08042D70:
	ldr r1, _08042DA8
	movs r0, #0x58
	mov r3, sl
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r0, r1
	ldrh r0, [r1, #0x2c]
	ldrh r5, [r1, #0x28]
	cmp r0, r5
	bne _08042DCC
	ldr r1, _08042DAC
	ldr r0, _08042DB0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bge _08042DB8
	ldr r1, _08042DA0
	ldr r0, _08042DB4
	str r0, [r1]
	bl _0804405E
	.align 2, 0
_08042DA0: .4byte 0x02023EB8
_08042DA4: .4byte 0x08289B2F
_08042DA8: .4byte 0x02023D28
_08042DAC: .4byte 0x02023FE0
_08042DB0: .4byte 0x02023EAF
_08042DB4: .4byte 0x08289B1A
_08042DB8:
	ldr r1, _08042DC4
	ldr r0, _08042DC8
	str r0, [r1]
	bl _0804405E
	.align 2, 0
_08042DC4: .4byte 0x02023EB8
_08042DC8: .4byte 0x08289B19
_08042DCC:
	ldr r2, _08042DE8
	ldrh r0, [r1, #0x2c]
	lsrs r0, r0, #2
	str r0, [r2]
	cmp r0, #0
	bne _08042DDC
	mov r0, sb
	str r0, [r2]
_08042DDC:
	ldr r0, [r2]
	rsbs r0, r0, #0
	str r0, [r2]
	bl _0804405E
	.align 2, 0
_08042DE8: .4byte 0x02023E94
_08042DEC:
	ldrb r0, [r7]
	subs r0, #9
	cmp r0, #0x2f
	bls _08042DF8
	bl _0804405E
_08042DF8:
	lsls r0, r0, #2
	ldr r1, _08042E04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08042E04: .4byte 0x08042E08
_08042E08: @ jump table
	.4byte _08043224 @ case 0
	.4byte _0804405E @ case 1
	.4byte _0804405E @ case 2
	.4byte _0804405E @ case 3
	.4byte _0804405E @ case 4
	.4byte _0804405E @ case 5
	.4byte _0804405E @ case 6
	.4byte _08042EC8 @ case 7
	.4byte _0804405E @ case 8
	.4byte _0804405E @ case 9
	.4byte _0804405E @ case 10
	.4byte _0804405E @ case 11
	.4byte _0804405E @ case 12
	.4byte _0804405E @ case 13
	.4byte _0804405E @ case 14
	.4byte _08042F90 @ case 15
	.4byte _0804405E @ case 16
	.4byte _0804405E @ case 17
	.4byte _08043050 @ case 18
	.4byte _0804405E @ case 19
	.4byte _0804405E @ case 20
	.4byte _0804405E @ case 21
	.4byte _0804405E @ case 22
	.4byte _0804405E @ case 23
	.4byte _0804405E @ case 24
	.4byte _0804405E @ case 25
	.4byte _0804405E @ case 26
	.4byte _0804405E @ case 27
	.4byte _0804405E @ case 28
	.4byte _08043148 @ case 29
	.4byte _0804405E @ case 30
	.4byte _0804405E @ case 31
	.4byte _0804405E @ case 32
	.4byte _0804405E @ case 33
	.4byte _0804405E @ case 34
	.4byte _0804405E @ case 35
	.4byte _0804405E @ case 36
	.4byte _0804405E @ case 37
	.4byte _0804405E @ case 38
	.4byte _0804405E @ case 39
	.4byte _08043300 @ case 40
	.4byte _0804405E @ case 41
	.4byte _0804405E @ case 42
	.4byte _0804405E @ case 43
	.4byte _0804405E @ case 44
	.4byte _0804405E @ case 45
	.4byte _0804405E @ case 46
	.4byte _080433DC @ case 47
_08042EC8:
	ldr r0, _08042F70
	ldrb r1, [r0]
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	beq _08042ED8
	bl _0804405E
_08042ED8:
	cmp r5, #0xa5
	bne _08042EE0
	bl _0804405E
_08042EE0:
	ldr r0, _08042F74
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _08042EF4
	bl _0804405E
_08042EF4:
	ldr r2, _08042F78
	ldr r0, _08042F7C
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08042F1C
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08042F1C
	bl _0804405E
_08042F1C:
	ldr r1, _08042F80
	movs r0, #0x58
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, r0, r1
	adds r4, r1, #0
	adds r4, #0x21
	ldrb r0, [r4]
	cmp r0, r3
	bne _08042F36
	bl _0804405E
_08042F36:
	adds r2, r1, #0
	adds r2, #0x22
	ldrb r0, [r2]
	cmp r0, r3
	bne _08042F44
	bl _0804405E
_08042F44:
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	bne _08042F4E
	bl _0804405E
_08042F4E:
	strb r3, [r4]
	strb r3, [r2]
	ldr r1, _08042F84
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #3
	strb r0, [r1, #1]
	strb r3, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	bl BattleScriptPushCursor
	ldr r1, _08042F88
	ldr r0, _08042F8C
	str r0, [r1]
	bl _08044010
	.align 2, 0
_08042F70: .4byte 0x02023F20
_08042F74: .4byte 0x082ED220
_08042F78: .4byte 0x02024020
_08042F7C: .4byte 0x02023EB0
_08042F80: .4byte 0x02023D28
_08042F84: .4byte 0x02022C0C
_08042F88: .4byte 0x02023EB8
_08042F8C: .4byte 0x08289BD5
_08042F90:
	ldr r0, _08043028
	ldrb r1, [r0]
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	beq _08042FA0
	bl _0804405E
_08042FA0:
	ldr r1, _0804302C
	ldr r0, _08043030
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r3, r0, r1
	ldrh r0, [r3, #0x28]
	cmp r0, #0
	bne _08042FB6
	bl _0804405E
_08042FB6:
	ldr r0, _08043034
	lsls r1, r2, #4
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08042FC8
	bl _0804405E
_08042FC8:
	ldr r2, _08043038
	ldr r0, _0804303C
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08042FF0
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08042FF0
	bl _0804405E
_08042FF0:
	ldr r1, _08043040
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0804300A
	bl _0804405E
_0804300A:
	ldr r1, _08043044
	ldrh r0, [r3, #0x2c]
	lsrs r0, r0, #4
	str r0, [r1]
	cmp r0, #0
	bne _08043018
	str r2, [r1]
_08043018:
	bl BattleScriptPushCursor
	ldr r1, _08043048
	ldr r0, _0804304C
	str r0, [r1]
	bl _08044010
	.align 2, 0
_08043028: .4byte 0x02023F20
_0804302C: .4byte 0x02023D28
_08043030: .4byte 0x02023EAF
_08043034: .4byte 0x02023FE0
_08043038: .4byte 0x02024020
_0804303C: .4byte 0x02023EB0
_08043040: .4byte 0x082ED220
_08043044: .4byte 0x02023E94
_08043048: .4byte 0x02023EB8
_0804304C: .4byte 0x08289BDC
_08043050:
	ldr r0, _0804311C
	ldrb r1, [r0]
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	beq _08043060
	bl _0804405E
_08043060:
	ldr r1, _08043120
	ldr r0, _08043124
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08043076
	bl _0804405E
_08043076:
	ldr r0, _08043128
	lsls r1, r2, #4
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08043088
	bl _0804405E
_08043088:
	ldr r2, _0804312C
	ldr r0, _08043130
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _080430B0
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _080430B0
	bl _0804405E
_080430B0:
	ldr r1, _08043134
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080430C8
	bl _0804405E
_080430C8:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080430E0
	bl _0804405E
_080430E0:
	ldr r5, _08043138
	movs r4, #3
_080430E4:
	bl Random
	ands r0, r4
	strb r0, [r5, #3]
	cmp r0, #0
	beq _080430E4
	ldr r1, _08043138
	ldrb r0, [r1, #3]
	cmp r0, #3
	bne _080430FC
	adds r0, #2
	strb r0, [r1, #3]
_080430FC:
	ldrb r0, [r1, #3]
	adds r0, #0x40
	strb r0, [r1, #3]
	bl BattleScriptPushCursor
	ldr r1, _0804313C
	ldr r0, _08043140
	str r0, [r1]
	ldr r2, _08043144
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2]
	bl _08044010
	.align 2, 0
_0804311C: .4byte 0x02023F20
_08043120: .4byte 0x02023D28
_08043124: .4byte 0x02023EAF
_08043128: .4byte 0x02023FE0
_0804312C: .4byte 0x02024020
_08043130: .4byte 0x02023EB0
_08043134: .4byte 0x082ED220
_08043138: .4byte 0x02023FD6
_0804313C: .4byte 0x02023EB8
_08043140: .4byte 0x08289C04
_08043144: .4byte 0x02023F24
_08043148:
	ldr r0, _080431F8
	ldrb r1, [r0]
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	beq _08043158
	bl _0804405E
_08043158:
	ldr r1, _080431FC
	ldr r0, _08043200
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _0804316E
	bl _0804405E
_0804316E:
	ldr r0, _08043204
	lsls r1, r2, #4
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08043180
	bl _0804405E
_08043180:
	ldr r2, _08043208
	ldr r0, _0804320C
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _080431A8
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _080431A8
	bl _0804405E
_080431A8:
	ldr r1, _08043210
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080431C0
	bl _0804405E
_080431C0:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080431D8
	bl _0804405E
_080431D8:
	ldr r1, _08043214
	movs r0, #0x42
	strb r0, [r1, #3]
	bl BattleScriptPushCursor
	ldr r1, _08043218
	ldr r0, _0804321C
	str r0, [r1]
	ldr r2, _08043220
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2]
	bl _08044010
	.align 2, 0
_080431F8: .4byte 0x02023F20
_080431FC: .4byte 0x02023D28
_08043200: .4byte 0x02023EAF
_08043204: .4byte 0x02023FE0
_08043208: .4byte 0x02024020
_0804320C: .4byte 0x02023EB0
_08043210: .4byte 0x082ED220
_08043214: .4byte 0x02023FD6
_08043218: .4byte 0x02023EB8
_0804321C: .4byte 0x08289C04
_08043220: .4byte 0x02023F24
_08043224:
	ldr r0, _080432D4
	ldrb r1, [r0]
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	beq _08043234
	bl _0804405E
_08043234:
	ldr r1, _080432D8
	ldr r0, _080432DC
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _0804324A
	bl _0804405E
_0804324A:
	ldr r0, _080432E0
	lsls r1, r2, #4
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0804325C
	bl _0804405E
_0804325C:
	ldr r2, _080432E4
	ldr r0, _080432E8
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08043284
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08043284
	bl _0804405E
_08043284:
	ldr r1, _080432EC
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0804329C
	bl _0804405E
_0804329C:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080432B4
	bl _0804405E
_080432B4:
	ldr r1, _080432F0
	movs r0, #0x45
	strb r0, [r1, #3]
	bl BattleScriptPushCursor
	ldr r1, _080432F4
	ldr r0, _080432F8
	str r0, [r1]
	ldr r2, _080432FC
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2]
	bl _08044010
	.align 2, 0
_080432D4: .4byte 0x02023F20
_080432D8: .4byte 0x02023D28
_080432DC: .4byte 0x02023EAF
_080432E0: .4byte 0x02023FE0
_080432E4: .4byte 0x02024020
_080432E8: .4byte 0x02023EB0
_080432EC: .4byte 0x082ED220
_080432F0: .4byte 0x02023FD6
_080432F4: .4byte 0x02023EB8
_080432F8: .4byte 0x08289C04
_080432FC: .4byte 0x02023F24
_08043300:
	ldr r0, _080433B0
	ldrb r1, [r0]
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	beq _08043310
	bl _0804405E
_08043310:
	ldr r1, _080433B4
	ldr r0, _080433B8
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08043326
	bl _0804405E
_08043326:
	ldr r0, _080433BC
	lsls r1, r2, #4
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08043338
	bl _0804405E
_08043338:
	ldr r1, _080433C0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08043350
	bl _0804405E
_08043350:
	ldr r2, _080433C4
	ldr r0, _080433C8
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08043378
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08043378
	bl _0804405E
_08043378:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08043390
	bl _0804405E
_08043390:
	ldr r1, _080433CC
	movs r0, #0x43
	strb r0, [r1, #3]
	bl BattleScriptPushCursor
	ldr r1, _080433D0
	ldr r0, _080433D4
	str r0, [r1]
	ldr r2, _080433D8
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2]
	bl _08044010
	.align 2, 0
_080433B0: .4byte 0x02023F20
_080433B4: .4byte 0x02023D28
_080433B8: .4byte 0x02023EAF
_080433BC: .4byte 0x02023FE0
_080433C0: .4byte 0x082ED220
_080433C4: .4byte 0x02024020
_080433C8: .4byte 0x02023EB0
_080433CC: .4byte 0x02023FD6
_080433D0: .4byte 0x02023EB8
_080433D4: .4byte 0x08289C04
_080433D8: .4byte 0x02023F24
_080433DC:
	ldr r0, _08043520
	ldrb r1, [r0]
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	beq _080433EC
	bl _0804405E
_080433EC:
	ldr r6, _08043524
	ldr r3, _08043528
	mov r8, r3
	ldrb r1, [r3]
	movs r7, #0x58
	adds r0, r1, #0
	muls r0, r7, r0
	adds r0, r0, r6
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08043406
	bl _0804405E
_08043406:
	ldr r0, _0804352C
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08043418
	bl _0804405E
_08043418:
	ldr r1, _08043530
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08043430
	bl _0804405E
_08043430:
	ldr r3, _08043534
	ldr r5, _08043538
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r2, r0, #2
	adds r0, r3, #0
	adds r0, #8
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08043458
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08043458
	bl _0804405E
_08043458:
	adds r0, r1, #0
	muls r0, r7, r0
	adds r0, r0, r6
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08043468
	bl _0804405E
_08043468:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08043480
	bl _0804405E
_08043480:
	mov r1, r8
	ldrb r0, [r1]
	muls r0, r7, r0
	adds r0, r0, r6
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08043494
	bl _0804405E
_08043494:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	bl GetGenderFromSpeciesAndPersonality
	adds r4, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	bl GetGenderFromSpeciesAndPersonality
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080434B2
	bl _0804405E
_080434B2:
	mov r2, r8
	ldrb r0, [r2]
	muls r0, r7, r0
	adds r4, r6, #0
	adds r4, #0x50
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080434CE
	bl _0804405E
_080434CE:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080434E2
	bl _0804405E
_080434E2:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080434F6
	bl _0804405E
_080434F6:
	mov r3, r8
	ldrb r0, [r3]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r2, r2, r4
	ldr r1, _0804353C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r1, r1, #0x10
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _08043540
	ldr r0, _08043544
	str r0, [r1]
	bl _08044010
	.align 2, 0
_08043520: .4byte 0x02023F20
_08043524: .4byte 0x02023D28
_08043528: .4byte 0x02023EAF
_0804352C: .4byte 0x02023FE0
_08043530: .4byte 0x082ED220
_08043534: .4byte 0x02024020
_08043538: .4byte 0x02023EB0
_0804353C: .4byte 0x082FACB4
_08043540: .4byte 0x02023EB8
_08043544: .4byte 0x08289BF7
_08043548:
	movs r5, #0
	mov sl, r5
	ldr r0, _0804357C
	ldrb r0, [r0]
	cmp sl, r0
	blo _08043558
	bl _0804405E
_08043558:
	ldr r1, _08043580
	movs r0, #0x58
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	subs r0, #7
	adds r2, r1, #0
	cmp r0, #0x41
	bls _08043572
	b _080437D6
_08043572:
	lsls r0, r0, #2
	ldr r1, _08043584
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804357C: .4byte 0x02023D10
_08043580: .4byte 0x02023D28
_08043584: .4byte 0x08043588
_08043588: @ jump table
	.4byte _080436EC @ case 0
	.4byte _080437D6 @ case 1
	.4byte _080437D6 @ case 2
	.4byte _080437D6 @ case 3
	.4byte _080437D6 @ case 4
	.4byte _080437B0 @ case 5
	.4byte _080437D6 @ case 6
	.4byte _080437D6 @ case 7
	.4byte _08043714 @ case 8
	.4byte _080437D6 @ case 9
	.4byte _08043690 @ case 10
	.4byte _080437D6 @ case 11
	.4byte _080437D6 @ case 12
	.4byte _080436BC @ case 13
	.4byte _080437D6 @ case 14
	.4byte _080437D6 @ case 15
	.4byte _080437D6 @ case 16
	.4byte _080437D6 @ case 17
	.4byte _080437D6 @ case 18
	.4byte _080437D6 @ case 19
	.4byte _080437D6 @ case 20
	.4byte _080437D6 @ case 21
	.4byte _080437D6 @ case 22
	.4byte _080437D6 @ case 23
	.4byte _080437D6 @ case 24
	.4byte _080437D6 @ case 25
	.4byte _080437D6 @ case 26
	.4byte _080437D6 @ case 27
	.4byte _080437D6 @ case 28
	.4byte _080437D6 @ case 29
	.4byte _080437D6 @ case 30
	.4byte _080437D6 @ case 31
	.4byte _080437D6 @ case 32
	.4byte _08043780 @ case 33
	.4byte _08043750 @ case 34
	.4byte _080437D6 @ case 35
	.4byte _080437D6 @ case 36
	.4byte _080437D6 @ case 37
	.4byte _080437D6 @ case 38
	.4byte _080437D6 @ case 39
	.4byte _080437D6 @ case 40
	.4byte _080437D6 @ case 41
	.4byte _080437D6 @ case 42
	.4byte _080437D6 @ case 43
	.4byte _080437D6 @ case 44
	.4byte _080437D6 @ case 45
	.4byte _080437D6 @ case 46
	.4byte _080437D6 @ case 47
	.4byte _080437D6 @ case 48
	.4byte _080437D6 @ case 49
	.4byte _080437D6 @ case 50
	.4byte _080437D6 @ case 51
	.4byte _080437D6 @ case 52
	.4byte _080437D6 @ case 53
	.4byte _080437D6 @ case 54
	.4byte _080437D6 @ case 55
	.4byte _080437D6 @ case 56
	.4byte _080437D6 @ case 57
	.4byte _080437D6 @ case 58
	.4byte _080437D6 @ case 59
	.4byte _080437D6 @ case 60
	.4byte _080437D6 @ case 61
	.4byte _080437D6 @ case 62
	.4byte _080437D6 @ case 63
	.4byte _080437D6 @ case 64
	.4byte _08043714 @ case 65
_08043690:
	movs r0, #0x58
	mov r3, sl
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r2, #0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080436B0
	ands r0, r1
	cmp r0, #0
	bne _080436AA
	b _080437D6
_080436AA:
	ldr r0, _080436B4
	ldr r1, _080436B8
	b _0804379C
	.align 2, 0
_080436B0: .4byte 0x00000F88
_080436B4: .4byte 0x02022C0C
_080436B8: .4byte 0x085ABC54
_080436BC:
	movs r0, #0x58
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	adds r1, r2, #0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _080436D6
	b _080437D6
_080436D6:
	ldr r0, _080436E4
	ldr r1, _080436E8
	bl StringCopy
	movs r2, #2
	mov sb, r2
	b _080437DC
	.align 2, 0
_080436E4: .4byte 0x02022C0C
_080436E8: .4byte 0x085ABC62
_080436EC:
	movs r0, #0x58
	mov r3, sl
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r2, #0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080437D6
	ldr r0, _0804370C
	ldr r1, _08043710
	b _0804379C
	.align 2, 0
_0804370C: .4byte 0x02022C0C
_08043710: .4byte 0x085ABC5B
_08043714:
	movs r0, #0x58
	mov r3, sl
	muls r3, r0, r3
	adds r0, r2, #0
	adds r0, #0x4c
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080437D6
	adds r2, #0x50
	adds r2, r3, r2
	ldr r0, [r2]
	ldr r1, _08043744
	ands r0, r1
	str r0, [r2]
	ldr r0, _08043748
	ldr r1, _0804374C
	bl StringCopy
	movs r0, #1
	mov sb, r0
	b _080437DC
	.align 2, 0
_08043744: .4byte 0xF7FFFFFF
_08043748: .4byte 0x02022C0C
_0804374C: .4byte 0x085ABC50
_08043750:
	movs r0, #0x58
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	adds r1, r2, #0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080437D6
	ldr r0, _08043778
	ldr r1, _0804377C
	bl StringCopy
	movs r2, #1
	mov sb, r2
	b _080437DC
	.align 2, 0
_08043778: .4byte 0x02022C0C
_0804377C: .4byte 0x085ABC57
_08043780:
	movs r0, #0x58
	mov r3, sl
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r2, #0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080437D6
	ldr r0, _080437A8
	ldr r1, _080437AC
_0804379C:
	bl StringCopy
	movs r5, #1
	mov sb, r5
	b _080437DC
	.align 2, 0
_080437A8: .4byte 0x02022C0C
_080437AC: .4byte 0x085ABC5E
_080437B0:
	movs r0, #0x58
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	adds r1, r2, #0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080437D6
	ldr r0, _080437EC
	ldr r1, _080437F0
	bl StringCopy
	movs r2, #3
	mov sb, r2
_080437D6:
	mov r3, sb
	cmp r3, #0
	beq _08043890
_080437DC:
	mov r5, sb
	cmp r5, #2
	beq _08043810
	cmp r5, #2
	bgt _080437F4
	cmp r5, #1
	beq _080437FC
	b _0804383C
	.align 2, 0
_080437EC: .4byte 0x02022C0C
_080437F0: .4byte 0x085ABC67
_080437F4:
	mov r0, sb
	cmp r0, #3
	beq _08043828
	b _0804383C
_080437FC:
	ldr r1, _0804380C
	movs r0, #0x58
	mov r2, sl
	muls r2, r0, r2
	adds r1, #0x4c
	adds r2, r2, r1
	movs r0, #0
	b _0804383A
	.align 2, 0
_0804380C: .4byte 0x02023D28
_08043810:
	ldr r1, _08043824
	movs r0, #0x58
	mov r2, sl
	muls r2, r0, r2
	adds r1, #0x50
	adds r2, r2, r1
	ldr r0, [r2]
	movs r1, #8
	rsbs r1, r1, #0
	b _08043838
	.align 2, 0
_08043824: .4byte 0x02023D28
_08043828:
	ldr r1, _08043874
	movs r0, #0x58
	mov r2, sl
	muls r2, r0, r2
	adds r1, #0x50
	adds r2, r2, r1
	ldr r0, [r2]
	ldr r1, _08043878
_08043838:
	ands r0, r1
_0804383A:
	str r0, [r2]
_0804383C:
	bl BattleScriptPushCursor
	ldr r1, _0804387C
	ldr r0, _08043880
	str r0, [r1]
	ldr r0, _08043884
	mov r1, sl
	strb r1, [r0, #0x17]
	ldr r4, _08043888
	strb r1, [r4]
	ldrb r1, [r4]
	movs r0, #0x58
	muls r0, r1, r0
	ldr r1, _0804388C
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #0x28
	movs r2, #0
	movs r3, #4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	bl _0804407A
	.align 2, 0
_08043874: .4byte 0x02023D28
_08043878: .4byte 0xFFF0FFFF
_0804387C: .4byte 0x02023EB8
_08043880: .4byte 0x08289C14
_08043884: .4byte 0x02024118
_08043888: .4byte 0x02023D08
_0804388C: .4byte 0x02023D74
_08043890:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _080438A8
	ldrb r0, [r0]
	cmp sl, r0
	bhs _080438A4
	b _08043558
_080438A4:
	bl _0804405E
	.align 2, 0
_080438A8: .4byte 0x02023D10
_080438AC:
	movs r2, #0
	mov sl, r2
	ldr r0, _080438F4
	ldrb r0, [r0]
	cmp sl, r0
	blo _080438BA
	b _0804405E
_080438BA:
	ldr r4, _080438F8
_080438BC:
	movs r0, #0x58
	mov r3, sl
	muls r3, r0, r3
	adds r0, r3, #0
	adds r0, r0, r4
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _080438E0
	mov r0, sl
	bl CastformDataTypeChange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0
	beq _080438E0
	b _08043F3C
_080438E0:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _080438F4
	ldrb r0, [r0]
	cmp sl, r0
	blo _080438BC
	b _0804405E
	.align 2, 0
_080438F4: .4byte 0x02023D10
_080438F8: .4byte 0x02023D28
_080438FC:
	ldrb r0, [r7]
	cmp r0, #0x1c
	beq _08043904
	b _0804405E
_08043904:
	ldr r4, _08043964
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08043914
	b _0804405E
_08043914:
	ldr r0, _08043968
	ands r1, r0
	str r1, [r4]
	mov r5, r8
	ldr r1, [r5]
	adds r1, #0xb2
	ldrb r2, [r1]
	movs r0, #0x3f
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0xb2
	ldrb r0, [r1]
	cmp r0, #6
	bne _08043938
	movs r0, #2
	strb r0, [r1]
_08043938:
	ldr r1, _0804396C
	mov r2, r8
	ldr r0, [r2]
	adds r0, #0xb2
	ldrb r0, [r0]
	adds r0, #0x40
	strb r0, [r1, #3]
	ldr r1, _08043970
	ldr r0, _08043974
	ldrb r0, [r0]
	strb r0, [r1, #0x17]
	bl BattleScriptPushCursor
	ldr r1, _08043978
	ldr r0, _0804397C
	str r0, [r1]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4]
	b _08044010
	.align 2, 0
_08043964: .4byte 0x02023F24
_08043968: .4byte 0xFFFFBFFF
_0804396C: .4byte 0x02023FD6
_08043970: .4byte 0x02024118
_08043974: .4byte 0x02023EB0
_08043978: .4byte 0x02023EB8
_0804397C: .4byte 0x08289C07
_08043980:
	ldrb r0, [r7]
	cmp r0, #0x1c
	beq _08043988
	b _0804405E
_08043988:
	ldr r4, _080439E8
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08043998
	b _0804405E
_08043998:
	ldr r0, _080439EC
	ands r1, r0
	str r1, [r4]
	mov r3, r8
	ldr r1, [r3]
	adds r1, #0xb2
	ldrb r2, [r1]
	movs r0, #0x3f
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0xb2
	ldrb r0, [r1]
	cmp r0, #6
	bne _080439BC
	movs r0, #2
	strb r0, [r1]
_080439BC:
	ldr r1, _080439F0
	mov r3, r8
	ldr r0, [r3]
	adds r0, #0xb2
	ldrb r0, [r0]
	strb r0, [r1, #3]
	ldr r1, _080439F4
	ldr r0, _080439F8
	ldrb r0, [r0]
	strb r0, [r1, #0x17]
	bl BattleScriptPushCursor
	ldr r1, _080439FC
	ldr r0, _08043A00
	str r0, [r1]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4]
	b _08044010
	.align 2, 0
_080439E8: .4byte 0x02023F24
_080439EC: .4byte 0xFFFFBFFF
_080439F0: .4byte 0x02023FD6
_080439F4: .4byte 0x02024118
_080439F8: .4byte 0x02023EAF
_080439FC: .4byte 0x02023EB8
_08043A00: .4byte 0x08289C07
_08043A04:
	movs r4, #0
	ldr r0, _08043A3C
	ldrb r1, [r0]
	cmp r4, r1
	blt _08043A10
	b _0804405E
_08043A10:
	ldr r0, _08043A40
	adds r5, r1, #0
	ldr r2, _08043A44
	adds r3, r0, #0
	adds r3, #0x20
	movs r6, #0x80
	lsls r6, r6, #0xc
_08043A1E:
	ldrb r1, [r3]
	cmp r1, #0x16
	bne _08043A2E
	ldr r0, [r2]
	ands r0, r6
	cmp r0, #0
	beq _08043A2E
	b _08043F64
_08043A2E:
	adds r2, #4
	adds r3, #0x58
	adds r4, #1
	cmp r4, r5
	blt _08043A1E
	b _0804405E
	.align 2, 0
_08043A3C: .4byte 0x02023D10
_08043A40: .4byte 0x02023D28
_08043A44: .4byte 0x02023F50
_08043A48:
	movs r4, #0
	ldr r0, _08043B24
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043A54
	b _0804405E
_08043A54:
	ldr r5, _08043B28
	mov r8, r5
	ldr r0, _08043B2C
	adds r0, #0x20
	str r0, [sp, #0x1c]
	movs r1, #0
	str r1, [sp, #0x20]
_08043A62:
	ldr r2, [sp, #0x1c]
	ldrb r0, [r2]
	cmp r0, #0x24
	beq _08043A6C
	b _08043BFE
_08043A6C:
	ldr r0, _08043B30
	ldr r3, [sp, #0x20]
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	str r3, [sp, #0x18]
	cmp r1, #0
	bne _08043A82
	b _08043BFE
_08043A82:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerPosition
	movs r1, #1
	adds r5, r0, #0
	eors r5, r1
	ands r5, r1
	adds r0, r5, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #2
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08043B34
	ldr r0, [r0]
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _08043AB4
	b _08043BC4
_08043AB4:
	movs r1, #0x58
	adds r0, r6, #0
	muls r0, r1, r0
	ldr r3, _08043B2C
	adds r1, r0, r3
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043B80
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	beq _08043B3C
	movs r1, #0x58
	adds r0, r7, #0
	muls r0, r1, r0
	adds r1, r0, r3
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043B3C
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	beq _08043B3C
	str r2, [sp, #0x24]
	bl Random
	ldr r2, [sp, #0x24]
	adds r1, r2, #0
	ands r1, r0
	lsls r1, r1, #1
	orrs r5, r1
	adds r0, r5, #0
	bl GetBattlerAtPosition
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r2]
	movs r3, #0x58
	muls r0, r3, r0
	ldr r5, _08043B2C
	adds r0, r0, r5
	adds r0, #0x20
	ldrb r0, [r0]
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	ldrb r0, [r2]
	muls r0, r3, r0
	adds r0, r0, r5
	adds r0, #0x20
	ldrb r0, [r0]
	ldr r2, _08043B38
	strb r0, [r2]
	b _08043BEC
	.align 2, 0
_08043B24: .4byte 0x02023D10
_08043B28: .4byte 0x02023D08
_08043B2C: .4byte 0x02023D28
_08043B30: .4byte 0x02023F50
_08043B34: .4byte 0x02022C90
_08043B38: .4byte 0x02023EAE
_08043B3C:
	ldr r3, _08043B7C
	movs r2, #0x58
	adds r0, r6, #0
	muls r0, r2, r0
	adds r1, r0, r3
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043B80
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	beq _08043B80
	mov r5, r8
	strb r6, [r5]
	adds r1, r4, #0
	muls r1, r2, r1
	adds r1, r1, r3
	ldrb r0, [r5]
	muls r0, r2, r0
	adds r0, r0, r3
	adds r0, #0x20
	ldrb r0, [r0]
	adds r1, #0x20
	strb r0, [r1]
	ldrb r0, [r5]
	muls r0, r2, r0
	adds r0, r0, r3
	adds r0, #0x20
	ldrb r0, [r0]
	b _08043BE8
	.align 2, 0
_08043B7C: .4byte 0x02023D28
_08043B80:
	ldr r3, _08043BC0
	movs r2, #0x58
	adds r0, r7, #0
	muls r0, r2, r0
	adds r1, r0, r3
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043BF6
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	beq _08043BF6
	mov r5, r8
	strb r7, [r5]
	adds r1, r4, #0
	muls r1, r2, r1
	adds r1, r1, r3
	ldrb r0, [r5]
	muls r0, r2, r0
	adds r0, r0, r3
	adds r0, #0x20
	ldrb r0, [r0]
	adds r1, #0x20
	strb r0, [r1]
	ldrb r0, [r5]
	muls r0, r2, r0
	adds r0, r0, r3
	adds r0, #0x20
	ldrb r0, [r0]
	b _08043BE8
	.align 2, 0
_08043BC0: .4byte 0x02023D28
_08043BC4:
	mov r2, r8
	strb r6, [r2]
	movs r3, #0x58
	adds r0, r6, #0
	muls r0, r3, r0
	ldr r5, _08043C18
	adds r0, r0, r5
	adds r2, r0, #0
	adds r2, #0x20
	ldrb r1, [r2]
	cmp r1, #0
	beq _08043BF6
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	beq _08043BF6
	ldr r0, [sp, #0x1c]
	strb r1, [r0]
	ldrb r0, [r2]
_08043BE8:
	ldr r1, _08043C1C
	strb r0, [r1]
_08043BEC:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043BF6:
	mov r2, sb
	cmp r2, #0
	beq _08043BFE
	b _08043F80
_08043BFE:
	ldr r3, [sp, #0x1c]
	adds r3, #0x58
	str r3, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	adds r5, #4
	str r5, [sp, #0x20]
	adds r4, #1
	ldr r0, _08043C20
	ldrb r0, [r0]
	cmp r4, r0
	bge _08043C16
	b _08043A62
_08043C16:
	b _0804405E
	.align 2, 0
_08043C18: .4byte 0x02023D28
_08043C1C: .4byte 0x02023EAE
_08043C20: .4byte 0x02023D10
_08043C24:
	movs r4, #0
	ldr r0, _08043C5C
	ldrb r1, [r0]
	cmp r4, r1
	blt _08043C30
	b _0804405E
_08043C30:
	ldr r0, _08043C60
	adds r5, r1, #0
	ldr r2, _08043C64
	adds r3, r0, #0
	adds r3, #0x20
	movs r6, #0x80
	lsls r6, r6, #0xc
_08043C3E:
	ldrb r1, [r3]
	cmp r1, #0x16
	bne _08043C4E
	ldr r0, [r2]
	ands r0, r6
	cmp r0, #0
	beq _08043C4E
	b _08043FF4
_08043C4E:
	adds r2, #4
	adds r3, #0x58
	adds r4, #1
	cmp r4, r5
	blt _08043C3E
	b _0804405E
	.align 2, 0
_08043C5C: .4byte 0x02023D10
_08043C60: .4byte 0x02023D28
_08043C64: .4byte 0x02023F50
_08043C68:
	mov r0, sl
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r0, _08043CB8
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043C7E
	b _0804405E
_08043C7E:
	ldr r7, _08043CBC
_08043C80:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r4, #1
	cmp r0, r5
	beq _08043CAA
	movs r0, #0x58
	muls r0, r4, r0
	adds r0, r0, r7
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08043CAA
	ldr r0, _08043CC0
	strb r6, [r0]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043CAA:
	adds r4, r3, #0
	ldr r0, _08043CB8
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043C80
	b _0804405E
	.align 2, 0
_08043CB8: .4byte 0x02023D10
_08043CBC: .4byte 0x02023D28
_08043CC0: .4byte 0x02023EAE
_08043CC4:
	mov r0, sl
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r0, _08043D14
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043CDA
	b _0804405E
_08043CDA:
	ldr r7, _08043D18
_08043CDC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r4, #1
	cmp r0, r5
	bne _08043D06
	movs r0, #0x58
	muls r0, r4, r0
	adds r0, r0, r7
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08043D06
	ldr r0, _08043D1C
	strb r6, [r0]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043D06:
	adds r4, r3, #0
	ldr r0, _08043D14
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043CDC
	b _0804405E
	.align 2, 0
_08043D14: .4byte 0x02023D10
_08043D18: .4byte 0x02023D28
_08043D1C: .4byte 0x02023EAE
_08043D20:
	ldrb r0, [r7]
	cmp r0, #0xfd
	beq _08043D44
	cmp r0, #0xfe
	beq _08043D7C
	movs r4, #0
	ldr r0, _08043D3C
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r4, r0
	blt _08043D38
	b _0804405E
_08043D38:
	ldr r2, _08043D40
	b _08043DB4
	.align 2, 0
_08043D3C: .4byte 0x02023D10
_08043D40: .4byte 0x02023D28
_08043D44:
	movs r4, #0
	ldr r0, _08043D74
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043D50
	b _0804405E
_08043D50:
	ldr r5, _08043D78
	movs r2, #0x80
	lsls r2, r2, #9
	adds r1, r0, #0
_08043D58:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ands r0, r2
	adds r3, r4, #1
	cmp r0, #0
	beq _08043D6C
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043D6C:
	adds r4, r3, #0
	cmp r4, r1
	blt _08043D58
	b _0804405E
	.align 2, 0
_08043D74: .4byte 0x02023D10
_08043D78: .4byte 0x02023F50
_08043D7C:
	movs r4, #0
	ldr r0, _08043DAC
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043D88
	b _0804405E
_08043D88:
	ldr r5, _08043DB0
	movs r2, #0x80
	lsls r2, r2, #0xa
	adds r1, r0, #0
_08043D90:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ands r0, r2
	adds r3, r4, #1
	cmp r0, #0
	beq _08043DA4
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043DA4:
	adds r4, r3, #0
	cmp r4, r1
	blt _08043D90
	b _0804405E
	.align 2, 0
_08043DAC: .4byte 0x02023D10
_08043DB0: .4byte 0x02023F50
_08043DB4:
	movs r0, #0x58
	muls r0, r4, r0
	adds r0, r0, r2
	adds r0, #0x20
	ldrb r0, [r0]
	adds r3, r4, #1
	cmp r0, r6
	bne _08043DCC
	strb r6, [r7]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043DCC:
	adds r4, r3, #0
	ldrb r1, [r5]
	cmp r4, r1
	blt _08043DB4
	b _0804405E
_08043DD6:
	movs r4, #0
	ldr r0, _08043E14
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043DE2
	b _0804405E
_08043DE2:
	ldr r2, _08043E18
	mov r8, r2
	adds r2, r0, #0
	movs r5, #0x58
_08043DEA:
	adds r0, r4, #0
	muls r0, r5, r0
	mov r3, r8
	adds r1, r0, r3
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r3, r4, #1
	cmp r0, r6
	bne _08043E0C
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	beq _08043E0C
	strb r6, [r7]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043E0C:
	adds r4, r3, #0
	cmp r4, r2
	blt _08043DEA
	b _0804405E
	.align 2, 0
_08043E14: .4byte 0x02023D10
_08043E18: .4byte 0x02023D28
_08043E1C:
	movs r4, #0
	ldr r0, _08043E54
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043E28
	b _0804405E
_08043E28:
	ldr r7, _08043E58
	adds r1, r0, #0
	movs r5, #0x58
	ldr r2, _08043E5C
_08043E30:
	adds r0, r4, #0
	muls r0, r5, r0
	adds r0, r0, r7
	adds r0, #0x20
	ldrb r0, [r0]
	adds r3, r4, #1
	cmp r0, r6
	bne _08043E4C
	cmp r4, sl
	beq _08043E4C
	strb r6, [r2]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043E4C:
	adds r4, r3, #0
	cmp r4, r1
	blt _08043E30
	b _0804405E
	.align 2, 0
_08043E54: .4byte 0x02023D10
_08043E58: .4byte 0x02023D28
_08043E5C: .4byte 0x02023EAE
_08043E60:
	mov r0, sl
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r0, _08043EB0
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043E76
	b _0804405E
_08043E76:
	ldr r7, _08043EB4
_08043E78:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	beq _08043EA4
	movs r0, #0x58
	muls r0, r4, r0
	adds r0, r0, r7
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08043EA4
	ldr r0, _08043EB8
	strb r6, [r0]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043EA4:
	adds r4, #1
	ldr r0, _08043EB0
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043E78
	b _0804405E
	.align 2, 0
_08043EB0: .4byte 0x02023D10
_08043EB4: .4byte 0x02023D28
_08043EB8: .4byte 0x02023EAE
_08043EBC:
	mov r0, sl
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r0, _08043F0C
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043ED2
	b _0804405E
_08043ED2:
	ldr r7, _08043F10
_08043ED4:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	bne _08043F00
	movs r0, #0x58
	muls r0, r4, r0
	adds r0, r0, r7
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08043F00
	ldr r0, _08043F14
	strb r6, [r0]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08043F00:
	adds r4, #1
	ldr r0, _08043F0C
	ldrb r0, [r0]
	cmp r4, r0
	blt _08043ED4
	b _0804405E
	.align 2, 0
_08043F0C: .4byte 0x02023D10
_08043F10: .4byte 0x02023D28
_08043F14: .4byte 0x02023EAE
	thumb_func_end AbilityBattleEffects

	thumb_func_start sub_08043F18
sub_08043F18: @ 0x08043F18
	ldr r0, _08043F30
	bl BattleScriptPushCursorAndCallback
	ldr r0, _08043F34
	strb r6, [r0, #0x17]
_08043F22:
	ldr r0, _08043F38
	ldr r0, [r0]
	adds r0, #0x7f
	mov r1, sb
	subs r1, #1
	strb r1, [r0]
	b _0804405E
	.align 2, 0
_08043F30: .4byte 0x08289A31
_08043F34: .4byte 0x02024118
_08043F38: .4byte 0x02024140
_08043F3C:
	ldr r0, _08043F58
	bl BattleScriptPushCursorAndCallback
	ldr r0, _08043F5C
	mov r5, sl
	strb r5, [r0, #0x17]
	ldr r0, _08043F60
	ldr r0, [r0]
	adds r0, #0x7f
	mov r1, sb
	subs r1, #1
	strb r1, [r0]
	b _0804407A
	.align 2, 0
_08043F58: .4byte 0x08289A31
_08043F5C: .4byte 0x02024118
_08043F60: .4byte 0x02024140
_08043F64:
	strb r1, [r7]
	ldr r0, [r2]
	ldr r1, _08043F78
	ands r0, r1
	str r0, [r2]
	ldr r0, _08043F7C
	bl BattleScriptPushCursorAndCallback
	b _08044008
	.align 2, 0
_08043F78: .4byte 0xFFF7FFFF
_08043F7C: .4byte 0x08289A40
_08043F80:
	ldr r0, _08043FD0
	bl BattleScriptPushCursorAndCallback
	ldr r1, _08043FD4
	ldr r0, [sp, #0x18]
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r2, _08043FD8
	ands r0, r2
	str r0, [r1]
	ldr r0, _08043FDC
	strb r4, [r0, #0x17]
	ldr r1, _08043FE0
	movs r4, #0xfd
	strb r4, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	ldr r2, _08043FE4
	ldrb r0, [r2]
	strb r0, [r1, #2]
	ldr r3, _08043FE8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strb r0, [r1, #3]
	movs r0, #0xff
	strb r0, [r1, #4]
	ldr r1, _08043FEC
	strb r4, [r1]
	movs r0, #9
	strb r0, [r1, #1]
	ldr r0, _08043FF0
	ldrb r0, [r0]
	strb r0, [r1, #2]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1, #3]
	b _0804405E
	.align 2, 0
_08043FD0: .4byte 0x082899DA
_08043FD4: .4byte 0x02023F50
_08043FD8: .4byte 0xFFEFFFFF
_08043FDC: .4byte 0x02024118
_08043FE0: .4byte 0x02022C0C
_08043FE4: .4byte 0x02023D08
_08043FE8: .4byte 0x02023D12
_08043FEC: .4byte 0x02022C1C
_08043FF0: .4byte 0x02023EAE
_08043FF4:
	strb r1, [r7]
	ldr r0, [r2]
	ldr r1, _0804401C
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _08044020
	ldr r0, _08044024
	str r0, [r1]
_08044008:
	ldr r0, _08044028
	ldr r0, [r0]
	adds r0, #0xd8
	strb r4, [r0]
_08044010:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _0804405E
	.align 2, 0
_0804401C: .4byte 0xFFF7FFFF
_08044020: .4byte 0x02023EB8
_08044024: .4byte 0x08289A49
_08044028: .4byte 0x02024140
_0804402C:
	movs r4, #0
	ldr r0, _0804408C
	ldrb r1, [r0]
	cmp r4, r1
	bge _0804405E
	ldr r0, _08044090
	adds r2, r1, #0
	adds r1, r0, #0
	adds r1, #0x20
	ldr r3, _08044094
_08044040:
	ldrb r0, [r1]
	cmp r0, r6
	bne _08044056
	cmp r4, sl
	beq _08044056
	strb r6, [r3]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08044056:
	adds r1, #0x58
	adds r4, #1
	cmp r4, r2
	blt _08044040
_0804405E:
	mov r1, sb
	cmp r1, #0
	beq _0804407A
_08044064:
	ldr r2, [sp, #4]
	cmp r2, #0xb
	bhi _0804407A
	ldr r1, _08044094
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0804407A
	adds r1, r0, #0
	mov r0, sl
	bl RecordAbilityBattle
_0804407A:
	mov r0, sb
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804408C: .4byte 0x02023D10
_08044090: .4byte 0x02023D28
_08044094: .4byte 0x02023EAE
	thumb_func_end sub_08043F18

	thumb_func_start BattleScriptExecute
BattleScriptExecute: @ 0x08044098
	ldr r1, _080440C4
	str r0, [r1]
	ldr r0, _080440C8
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	adds r3, r2, #0
	adds r3, #0x20
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r2, r2, r0
	ldr r1, _080440CC
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _080440D0
	str r0, [r1]
	ldr r1, _080440D4
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080440C4: .4byte 0x02023EB8
_080440C8: .4byte 0x0202414C
_080440CC: .4byte 0x03005A64
_080440D0: .4byte 0x0803DC59
_080440D4: .4byte 0x02023D27
	thumb_func_end BattleScriptExecute

	thumb_func_start BattleScriptPushCursorAndCallback
BattleScriptPushCursorAndCallback: @ 0x080440D8
	push {r4, lr}
	adds r4, r0, #0
	bl BattleScriptPushCursor
	ldr r0, _0804410C
	str r4, [r0]
	ldr r0, _08044110
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	adds r3, r2, #0
	adds r3, #0x20
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r2, r2, r0
	ldr r1, _08044114
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _08044118
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804410C: .4byte 0x02023EB8
_08044110: .4byte 0x0202414C
_08044114: .4byte 0x03005A64
_08044118: .4byte 0x0803DCCD
	thumb_func_end BattleScriptPushCursorAndCallback

	thumb_func_start ItemBattleEffects
ItemBattleEffects: @ 0x0804411C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0xc]
	add r0, sp, #4
	strb r1, [r0]
	ldr r4, _08044168
	ldr r1, _0804416C
	movs r0, #0x58
	muls r0, r7, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x2e]
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _08044174
	ldr r1, _08044170
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r5, [r0, #7]
	ldrb r0, [r0, #0x1a]
	b _08044188
	.align 2, 0
_08044168: .4byte 0x02023EAC
_0804416C: .4byte 0x02023D28
_08044170: .4byte 0x020240A8
_08044174:
	ldrh r0, [r4]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r4]
	bl sub_080D6D1C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08044188:
	mov sb, r0
	ldr r1, _080441B0
	ldr r0, _080441B4
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x2e]
	str r0, [sp, #0x14]
	cmp r0, #0xaf
	bne _080441BC
	ldr r1, _080441B8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r3, [r0, #7]
	mov r8, r3
	ldrb r0, [r0, #0x1a]
	b _080441D2
	.align 2, 0
_080441B0: .4byte 0x02023D28
_080441B4: .4byte 0x02023EAF
_080441B8: .4byte 0x020240A8
_080441BC:
	ldr r0, [sp, #0x14]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [sp, #0x14]
	bl sub_080D6D1C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080441D2:
	str r0, [sp, #0x10]
	ldr r2, _08044208
	ldr r0, _0804420C
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r4, [r0, #0x2e]
	cmp r4, #0xaf
	beq _080441F2
	adds r0, r4, #0
	bl sub_080D6CF8
	adds r0, r4, #0
	bl sub_080D6D1C
_080441F2:
	ldr r0, [sp, #8]
	cmp r0, #4
	bls _080441FC
	bl _0804546A
_080441FC:
	lsls r0, r0, #2
	ldr r1, _08044210
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044208: .4byte 0x02023D28
_0804420C: .4byte 0x02023EB0
_08044210: .4byte 0x08044214
_08044214: @ jump table
	.4byte _08044228 @ case 0
	.4byte _080442C8 @ case 1
	.4byte _0804546A @ case 2
	.4byte _08044EC0 @ case 3
	.4byte _08045310 @ case 4
_08044228:
	cmp r5, #0x17
	beq _08044258
	cmp r5, #0x20
	beq _08044234
	bl _0804546A
_08044234:
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044244
	bl _0804546A
_08044244:
	ldr r0, _08044254
	ldr r0, [r0]
	adds r0, #0x4a
	movs r1, #2
	strb r1, [r0]
	bl _0804546A
	.align 2, 0
_08044254: .4byte 0x02024140
_08044258:
	ldr r1, _080442B0
	mov r8, r1
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	mov r0, r8
	adds r0, #0x18
	adds r1, r1, r0
	movs r2, #6
	movs r3, #7
	mov sl, r3
_0804426E:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #5
	bgt _0804427C
	strb r2, [r1]
	movs r5, #5
	str r5, [sp, #0xc]
_0804427C:
	adds r1, #1
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r3, sl
	cmp r3, #0
	bge _0804426E
	ldr r5, [sp, #0xc]
	cmp r5, #0
	bne _08044294
	bl _0804546A
_08044294:
	ldr r0, _080442B4
	strb r7, [r0, #0x17]
	ldr r0, _080442B8
	strb r7, [r0]
	ldr r1, _080442BC
	ldr r0, _080442C0
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _080442C4
	bl BattleScriptExecute
	bl _0804546A
	.align 2, 0
_080442B0: .4byte 0x02023D28
_080442B4: .4byte 0x02024118
_080442B8: .4byte 0x02023EB3
_080442BC: .4byte 0x02023D08
_080442C0: .4byte 0x02023EAF
_080442C4: .4byte 0x08289D36
_080442C8:
	ldr r1, _080442F0
	movs r0, #0x58
	muls r0, r7, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	mov r8, r1
	cmp r0, #0
	bne _080442DC
	bl _0804546A
_080442DC:
	subs r0, r5, #1
	cmp r0, #0x2a
	bls _080442E6
	bl _08044E16
_080442E6:
	lsls r0, r0, #2
	ldr r1, _080442F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080442F0: .4byte 0x02023D28
_080442F4: .4byte 0x080442F8
_080442F8: @ jump table
	.4byte _080443A4 @ case 0
	.4byte _08044B84 @ case 1
	.4byte _08044C48 @ case 2
	.4byte _08044BB4 @ case 3
	.4byte _08044BE8 @ case 4
	.4byte _08044C18 @ case 5
	.4byte _080443F0 @ case 6
	.4byte _08044C84 @ case 7
	.4byte _08044CB4 @ case 8
	.4byte _080445BC @ case 9
	.4byte _0804463C @ case 10
	.4byte _080446B8 @ case 11
	.4byte _0804474C @ case 12
	.4byte _080447E0 @ case 13
	.4byte _08044874 @ case 14
	.4byte _080448DC @ case 15
	.4byte _08044930 @ case 16
	.4byte _08044984 @ case 17
	.4byte _080449EC @ case 18
	.4byte _08044A50 @ case 19
	.4byte _08044A9C @ case 20
	.4byte _08044E16 @ case 21
	.4byte _080444F0 @ case 22
	.4byte _08044E16 @ case 23
	.4byte _08044E16 @ case 24
	.4byte _08044E16 @ case 25
	.4byte _08044E16 @ case 26
	.4byte _08044DE0 @ case 27
	.4byte _08044E16 @ case 28
	.4byte _08044E16 @ case 29
	.4byte _08044E16 @ case 30
	.4byte _08044E16 @ case 31
	.4byte _08044E16 @ case 32
	.4byte _08044E16 @ case 33
	.4byte _08044E16 @ case 34
	.4byte _08044E16 @ case 35
	.4byte _08044E16 @ case 36
	.4byte _08044E16 @ case 37
	.4byte _08044E16 @ case 38
	.4byte _08044E16 @ case 39
	.4byte _08044E16 @ case 40
	.4byte _08044E16 @ case 41
	.4byte _0804455C @ case 42
_080443A4:
	movs r0, #0x58
	muls r0, r7, r0
	mov r1, r8
	adds r2, r0, r1
	ldrh r0, [r2, #0x2c]
	ldrh r1, [r2, #0x28]
	lsrs r0, r0, #1
	cmp r1, r0
	bls _080443BA
	bl _08044E16
_080443BA:
	cmp r6, #0
	beq _080443C2
	bl _08044E16
_080443C2:
	ldr r4, _080443E8
	mov r3, sb
	str r3, [r4]
	ldrh r3, [r2, #0x28]
	mov r5, sb
	adds r0, r3, r5
	ldrh r1, [r2, #0x2c]
	cmp r0, r1
	ble _080443D8
	subs r0, r1, r3
	str r0, [r4]
_080443D8:
	ldr r0, [r4]
	rsbs r0, r0, #0
	str r0, [r4]
	ldr r0, _080443EC
	bl BattleScriptExecute
	b _08044742
	.align 2, 0
_080443E8: .4byte 0x02023E94
_080443EC: .4byte 0x08289D4C
_080443F0:
	cmp r6, #0
	beq _080443F8
	bl _08044E16
_080443F8:
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804441C
	ldr r1, _08044414
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08044418
	b _0804442A
	.align 2, 0
_08044414: .4byte 0x02023D12
_08044418: .4byte 0x02024190
_0804441C:
	ldr r1, _08044498
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0804449C
_0804442A:
	adds r4, r1, r0
	movs r1, #0
	mov sl, r1
	add r5, sp, #4
_08044432:
	mov r1, sl
	adds r1, #0xd
	adds r0, r4, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r1, sl
	adds r1, #0x11
	adds r0, r4, #0
	bl GetMonData
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #0x15
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r6, #0
	beq _08044462
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804446C
_08044462:
	movs r2, #1
	add sl, r2
	mov r3, sl
	cmp r3, #3
	ble _08044432
_0804446C:
	mov r5, sl
	cmp r5, #4
	bne _08044476
	bl _08044E16
_08044476:
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	add r0, sp, #4
	ldrb r0, [r0]
	mov r3, sb
	adds r1, r0, r3
	cmp r1, r2
	ble _080444A0
	add r0, sp, #4
	strb r2, [r0]
	b _080444A4
	.align 2, 0
_08044498: .4byte 0x02023D12
_0804449C: .4byte 0x020243E8
_080444A0:
	add r0, sp, #4
	strb r1, [r0]
_080444A4:
	ldr r1, _080444E4
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #2
	strb r0, [r1, #1]
	strb r6, [r1, #2]
	lsrs r0, r6, #8
	strb r0, [r1, #3]
	movs r0, #0xff
	strb r0, [r1, #4]
	ldr r0, _080444E8
	bl BattleScriptExecute
	mov r1, sl
	adds r1, #9
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	add r5, sp, #4
	str r5, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #1
	bl BtlController_EmitSetMonData
	ldr r0, _080444EC
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	movs r0, #3
	str r0, [sp, #0xc]
	bl _08044E1E
	.align 2, 0
_080444E4: .4byte 0x02022C0C
_080444E8: .4byte 0x08289D69
_080444EC: .4byte 0x02023D08
_080444F0:
	ldr r0, _08044544
	movs r1, #0x58
	muls r1, r7, r1
	adds r0, #0x18
	adds r1, r1, r0
	movs r2, #6
	movs r3, #7
	mov sl, r3
_08044500:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #5
	bgt _0804450E
	strb r2, [r1]
	movs r5, #5
	str r5, [sp, #0xc]
_0804450E:
	adds r1, #1
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r3, sl
	cmp r3, #0
	bge _08044500
	movs r5, #8
	mov sl, r5
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0804452A
	bl _0804546A
_0804452A:
	ldr r0, _08044548
	strb r7, [r0, #0x17]
	ldr r0, _0804454C
	strb r7, [r0]
	ldr r1, _08044550
	ldr r0, _08044554
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _08044558
	bl BattleScriptExecute
	bl _08044E16
	.align 2, 0
_08044544: .4byte 0x02023D28
_08044548: .4byte 0x02024118
_0804454C: .4byte 0x02023EB3
_08044550: .4byte 0x02023D08
_08044554: .4byte 0x02023EAF
_08044558: .4byte 0x08289D36
_0804455C:
	movs r0, #0x58
	muls r0, r7, r0
	mov r2, r8
	adds r1, r0, r2
	ldrh r0, [r1, #0x28]
	ldrh r3, [r1, #0x2c]
	cmp r0, r3
	blo _08044570
	bl _08044E16
_08044570:
	cmp r6, #0
	beq _08044578
	bl _08044E16
_08044578:
	ldr r3, _080445B4
	ldrh r0, [r1, #0x2c]
	lsrs r0, r0, #4
	str r0, [r3]
	cmp r0, #0
	bne _08044588
	movs r0, #1
	str r0, [r3]
_08044588:
	ldrh r2, [r1, #0x28]
	ldr r0, [r3]
	adds r0, r2, r0
	ldrh r1, [r1, #0x2c]
	cmp r0, r1
	ble _08044598
	subs r0, r1, r2
	str r0, [r3]
_08044598:
	ldr r0, [r3]
	rsbs r0, r0, #0
	str r0, [r3]
	ldr r0, _080445B8
	bl BattleScriptExecute
	movs r0, #4
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r5, #0
	bl RecordItemEffectBattle
	bl _08044E16
	.align 2, 0
_080445B4: .4byte 0x02023E94
_080445B8: .4byte 0x08289D79
_080445BC:
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	str r1, [sp, #0x18]
	adds r4, r1, #0
	add r4, r8
	ldrh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x28]
	lsrs r0, r0, #1
	cmp r1, r0
	bls _080445D6
	bl _08044E16
_080445D6:
	cmp r6, #0
	beq _080445DE
	bl _08044E16
_080445DE:
	ldr r1, _08044634
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #8
	strb r0, [r1, #1]
	strb r6, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r5, _08044638
	ldrh r0, [r4, #0x2c]
	mov r1, sb
	bl __divsi3
	str r0, [r5]
	cmp r0, #0
	bne _08044602
	movs r0, #1
	str r0, [r5]
_08044602:
	ldrh r2, [r4, #0x28]
	ldr r0, [r5]
	adds r0, r2, r0
	ldrh r1, [r4, #0x2c]
	cmp r0, r1
	ble _08044612
	subs r0, r1, r2
	str r0, [r5]
_08044612:
	ldr r0, [r5]
	rsbs r0, r0, #0
	str r0, [r5]
	mov r0, r8
	adds r0, #0x48
	ldr r2, [sp, #0x18]
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, #0
	bl sub_0806E30C
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08044630
	b _080447BC
_08044630:
	b _080447D0
	.align 2, 0
_08044634: .4byte 0x02022C0C
_08044638: .4byte 0x02023E94
_0804463C:
	movs r0, #0x58
	adds r5, r7, #0
	muls r5, r0, r5
	str r5, [sp, #0x1c]
	add r5, r8
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x28]
	lsrs r0, r0, #1
	cmp r1, r0
	bls _08044654
	bl _08044E16
_08044654:
	cmp r6, #0
	beq _0804465C
	bl _08044E16
_0804465C:
	ldr r1, _080446B0
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #8
	strb r0, [r1, #1]
	movs r6, #1
	strb r6, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r4, _080446B4
	ldrh r0, [r5, #0x2c]
	mov r1, sb
	bl __divsi3
	str r0, [r4]
	cmp r0, #0
	bne _08044680
	str r6, [r4]
_08044680:
	ldrh r2, [r5, #0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	ble _08044690
	subs r0, r1, r2
	str r0, [r4]
_08044690:
	ldr r0, [r4]
	rsbs r0, r0, #0
	str r0, [r4]
	mov r0, r8
	adds r0, #0x48
	ldr r1, [sp, #0x1c]
	adds r0, r1, r0
	ldr r0, [r0]
	movs r1, #1
	bl sub_0806E30C
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _080446AE
	b _0804484E
_080446AE:
	b _08044864
	.align 2, 0
_080446B0: .4byte 0x02022C0C
_080446B4: .4byte 0x02023E94
_080446B8:
	movs r0, #0x58
	adds r3, r7, #0
	muls r3, r0, r3
	str r3, [sp, #0x20]
	adds r5, r3, #0
	add r5, r8
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x28]
	lsrs r0, r0, #1
	cmp r1, r0
	bls _080446D0
	b _08044E16
_080446D0:
	cmp r6, #0
	beq _080446D6
	b _08044E16
_080446D6:
	ldr r1, _08044730
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #8
	strb r0, [r1, #1]
	movs r0, #2
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r4, _08044734
	ldrh r0, [r5, #0x2c]
	mov r1, sb
	bl __divsi3
	str r0, [r4]
	cmp r0, #0
	bne _080446FC
	movs r0, #1
	str r0, [r4]
_080446FC:
	ldrh r2, [r5, #0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	ble _0804470C
	subs r0, r1, r2
	str r0, [r4]
_0804470C:
	ldr r0, [r4]
	rsbs r0, r0, #0
	str r0, [r4]
	mov r0, r8
	adds r0, #0x48
	ldr r5, [sp, #0x20]
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #2
	bl sub_0806E30C
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0804473C
	ldr r0, _08044738
	bl BattleScriptExecute
	b _08044742
	.align 2, 0
_08044730: .4byte 0x02022C0C
_08044734: .4byte 0x02023E94
_08044738: .4byte 0x08289DAC
_0804473C:
	ldr r0, _08044748
	bl BattleScriptExecute
_08044742:
	movs r0, #4
	str r0, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044748: .4byte 0x08289D4C
_0804474C:
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	str r1, [sp, #0x24]
	adds r5, r1, #0
	add r5, r8
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x28]
	lsrs r0, r0, #1
	cmp r1, r0
	bls _08044764
	b _08044E16
_08044764:
	cmp r6, #0
	beq _0804476A
	b _08044E16
_0804476A:
	ldr r1, _080447C4
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #8
	strb r0, [r1, #1]
	movs r0, #3
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r4, _080447C8
	ldrh r0, [r5, #0x2c]
	mov r1, sb
	bl __divsi3
	str r0, [r4]
	cmp r0, #0
	bne _08044790
	movs r0, #1
	str r0, [r4]
_08044790:
	ldrh r2, [r5, #0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	ble _080447A0
	subs r0, r1, r2
	str r0, [r4]
_080447A0:
	ldr r0, [r4]
	rsbs r0, r0, #0
	str r0, [r4]
	mov r0, r8
	adds r0, #0x48
	ldr r2, [sp, #0x24]
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, #3
	bl sub_0806E30C
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _080447D0
_080447BC:
	ldr r0, _080447CC
	bl BattleScriptExecute
	b _080447D6
	.align 2, 0
_080447C4: .4byte 0x02022C0C
_080447C8: .4byte 0x02023E94
_080447CC: .4byte 0x08289DAC
_080447D0:
	ldr r0, _080447DC
	bl BattleScriptExecute
_080447D6:
	movs r3, #4
	str r3, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_080447DC: .4byte 0x08289D4C
_080447E0:
	movs r0, #0x58
	adds r5, r7, #0
	muls r5, r0, r5
	str r5, [sp, #0x28]
	add r5, r8
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x28]
	lsrs r0, r0, #1
	cmp r1, r0
	bls _080447F6
	b _08044E16
_080447F6:
	cmp r6, #0
	beq _080447FC
	b _08044E16
_080447FC:
	ldr r1, _08044858
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #8
	strb r0, [r1, #1]
	movs r0, #4
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r4, _0804485C
	ldrh r0, [r5, #0x2c]
	mov r1, sb
	bl __divsi3
	str r0, [r4]
	cmp r0, #0
	bne _08044822
	movs r0, #1
	str r0, [r4]
_08044822:
	ldrh r2, [r5, #0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	ble _08044832
	subs r0, r1, r2
	str r0, [r4]
_08044832:
	ldr r0, [r4]
	rsbs r0, r0, #0
	str r0, [r4]
	mov r0, r8
	adds r0, #0x48
	ldr r1, [sp, #0x28]
	adds r0, r1, r0
	ldr r0, [r0]
	movs r1, #4
	bl sub_0806E30C
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08044864
_0804484E:
	ldr r0, _08044860
	bl BattleScriptExecute
	b _0804486A
	.align 2, 0
_08044858: .4byte 0x02022C0C
_0804485C: .4byte 0x02023E94
_08044860: .4byte 0x08289DAC
_08044864:
	ldr r0, _08044870
	bl BattleScriptExecute
_0804486A:
	movs r2, #4
	str r2, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044870: .4byte 0x08289D4C
_08044874:
	movs r0, #0x58
	muls r0, r7, r0
	mov r3, r8
	adds r5, r0, r3
	ldrh r4, [r5, #0x28]
	ldrh r0, [r5, #0x2c]
	mov r1, sb
	bl __divsi3
	cmp r4, r0
	ble _0804488C
	b _08044E16
_0804488C:
	cmp r6, #0
	beq _08044892
	b _08044E16
_08044892:
	movs r0, #0x19
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	ble _0804489C
	b _08044E16
_0804489C:
	ldr r1, _080448CC
	movs r2, #0xfd
	strb r2, [r1]
	movs r0, #5
	strb r0, [r1, #1]
	movs r0, #1
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r1, _080448D0
	strb r2, [r1]
	strb r6, [r1, #1]
	movs r0, #0xd2
	strb r0, [r1, #2]
	strb r6, [r1, #3]
	subs r0, #0xd3
	strb r0, [r1, #4]
	ldr r0, _080448D4
	strb r7, [r0]
	ldr r1, _080448D8
	movs r0, #0x11
	strb r0, [r1, #0x1a]
	movs r0, #0xf
	b _08044A30
	.align 2, 0
_080448CC: .4byte 0x02022C0C
_080448D0: .4byte 0x02022C1C
_080448D4: .4byte 0x02023EB2
_080448D8: .4byte 0x02024118
_080448DC:
	movs r0, #0x58
	muls r0, r7, r0
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, #0x28]
	ldrh r0, [r5, #0x2c]
	mov r1, sb
	bl __divsi3
	cmp r4, r0
	ble _080448F4
	b _08044E16
_080448F4:
	cmp r6, #0
	beq _080448FA
	b _08044E16
_080448FA:
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	ble _08044904
	b _08044E16
_08044904:
	ldr r1, _08044924
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #5
	strb r0, [r1, #1]
	movs r0, #2
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r0, _08044928
	strb r7, [r0]
	ldr r1, _0804492C
	movs r0, #0x12
	strb r0, [r1, #0x1a]
	movs r0, #0x10
	b _080449CA
	.align 2, 0
_08044924: .4byte 0x02022C0C
_08044928: .4byte 0x02023EB2
_0804492C: .4byte 0x02024118
_08044930:
	movs r0, #0x58
	muls r0, r7, r0
	mov r3, r8
	adds r5, r0, r3
	ldrh r4, [r5, #0x28]
	ldrh r0, [r5, #0x2c]
	mov r1, sb
	bl __divsi3
	cmp r4, r0
	ble _08044948
	b _08044E16
_08044948:
	cmp r6, #0
	beq _0804494E
	b _08044E16
_0804494E:
	movs r0, #0x1b
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	ble _08044958
	b _08044E16
_08044958:
	ldr r1, _08044978
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #5
	strb r0, [r1, #1]
	movs r0, #3
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r0, _0804497C
	strb r7, [r0]
	ldr r1, _08044980
	movs r0, #0x13
	strb r0, [r1, #0x1a]
	movs r0, #0x11
	b _08044A30
	.align 2, 0
_08044978: .4byte 0x02022C0C
_0804497C: .4byte 0x02023EB2
_08044980: .4byte 0x02024118
_08044984:
	movs r0, #0x58
	muls r0, r7, r0
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, #0x28]
	ldrh r0, [r5, #0x2c]
	mov r1, sb
	bl __divsi3
	cmp r4, r0
	ble _0804499C
	b _08044E16
_0804499C:
	cmp r6, #0
	beq _080449A2
	b _08044E16
_080449A2:
	movs r0, #0x1c
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	ble _080449AC
	b _08044E16
_080449AC:
	ldr r1, _080449DC
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #5
	strb r0, [r1, #1]
	movs r0, #4
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r0, _080449E0
	strb r7, [r0]
	ldr r1, _080449E4
	movs r0, #0x14
	strb r0, [r1, #0x1a]
	movs r0, #0x12
_080449CA:
	strb r0, [r1, #0x10]
	strb r6, [r1, #0x11]
	ldr r0, _080449E8
	bl BattleScriptExecute
	movs r2, #5
	str r2, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_080449DC: .4byte 0x02022C0C
_080449E0: .4byte 0x02023EB2
_080449E4: .4byte 0x02024118
_080449E8: .4byte 0x08289DD6
_080449EC:
	movs r0, #0x58
	muls r0, r7, r0
	mov r3, r8
	adds r5, r0, r3
	ldrh r4, [r5, #0x28]
	ldrh r0, [r5, #0x2c]
	mov r1, sb
	bl __divsi3
	cmp r4, r0
	ble _08044A04
	b _08044E16
_08044A04:
	cmp r6, #0
	beq _08044A0A
	b _08044E16
_08044A0A:
	movs r0, #0x1d
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	ble _08044A14
	b _08044E16
_08044A14:
	ldr r1, _08044A40
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #5
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r0, _08044A44
	strb r7, [r0]
	ldr r1, _08044A48
	movs r0, #0x15
	strb r0, [r1, #0x1a]
	movs r0, #0x13
_08044A30:
	strb r0, [r1, #0x10]
	strb r6, [r1, #0x11]
	ldr r0, _08044A4C
	bl BattleScriptExecute
	movs r5, #5
	str r5, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044A40: .4byte 0x02022C0C
_08044A44: .4byte 0x02023EB2
_08044A48: .4byte 0x02024118
_08044A4C: .4byte 0x08289DD6
_08044A50:
	movs r0, #0x58
	adds r5, r7, #0
	muls r5, r0, r5
	mov r1, r8
	adds r0, r5, r1
	ldrh r4, [r0, #0x28]
	ldrh r0, [r0, #0x2c]
	mov r1, sb
	bl __divsi3
	cmp r4, r0
	ble _08044A6A
	b _08044E16
_08044A6A:
	cmp r6, #0
	beq _08044A70
	b _08044E16
_08044A70:
	mov r0, r8
	adds r0, #0x50
	adds r1, r5, r0
	ldr r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #0xd
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	beq _08044A86
	b _08044E16
_08044A86:
	orrs r2, r3
	str r2, [r1]
	ldr r0, _08044A98
	bl BattleScriptExecute
	movs r2, #2
	str r2, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044A98: .4byte 0x08289DF1
_08044A9C:
	cmp r6, #0
	beq _08044AA2
	b _08044E16
_08044AA2:
	movs r0, #0x58
	adds r5, r7, #0
	muls r5, r0, r5
	mov r3, r8
	adds r0, r5, r3
	ldrh r4, [r0, #0x28]
	ldrh r0, [r0, #0x2c]
	mov r1, sb
	bl __divsi3
	cmp r4, r0
	ble _08044ABC
	b _08044E16
_08044ABC:
	movs r0, #0
	mov sl, r0
	adds r0, r5, #1
	mov r1, r8
	adds r1, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	ble _08044AEC
	mov r0, r8
	adds r0, #0x19
	adds r1, r5, r0
_08044AD8:
	adds r1, #1
	movs r2, #1
	add sl, r2
	mov r3, sl
	cmp r3, #4
	bgt _08044AEC
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xb
	bgt _08044AD8
_08044AEC:
	mov r5, sl
	cmp r5, #5
	bne _08044AF4
	b _08044E16
_08044AF4:
	movs r0, #0x58
	muls r0, r7, r0
	adds r4, r0, #1
	ldr r5, _08044B6C
_08044AFC:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	adds r0, r0, r4
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xc
	beq _08044AFC
	ldr r1, _08044B70
	movs r2, #0
	movs r3, #0xfd
	strb r3, [r1]
	movs r0, #5
	strb r0, [r1, #1]
	mov r0, sl
	adds r0, #1
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r0, _08044B74
	strb r3, [r0]
	strb r2, [r0, #1]
	movs r1, #0xd1
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	strb r2, [r0, #4]
	movs r1, #0xd2
	strb r1, [r0, #5]
	strb r2, [r0, #6]
	subs r1, #0xd3
	strb r1, [r0, #7]
	ldr r0, _08044B78
	strb r7, [r0]
	ldr r1, _08044B7C
	mov r0, sl
	adds r0, #0x21
	strb r0, [r1, #0x1a]
	adds r0, #6
	strb r0, [r1, #0x10]
	strb r2, [r1, #0x11]
	ldr r0, _08044B80
	bl BattleScriptExecute
	movs r0, #5
	str r0, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044B6C: .4byte 0x02023D40
_08044B70: .4byte 0x02022C0C
_08044B74: .4byte 0x02022C1C
_08044B78: .4byte 0x02023EB2
_08044B7C: .4byte 0x02024118
_08044B80: .4byte 0x08289DD6
_08044B84:
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	mov r0, r8
	adds r0, #0x4c
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08044B9C
	b _08044E16
_08044B9C:
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r1]
	ldr r0, _08044BB0
	bl BattleScriptExecute
	movs r1, #1
	str r1, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044BB0: .4byte 0x08289C8E
_08044BB4:
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	mov r0, r8
	adds r0, #0x4c
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0x88
	ands r0, r2
	cmp r0, #0
	bne _08044BCC
	b _08044E16
_08044BCC:
	ldr r0, _08044BE0
	ands r2, r0
	str r2, [r1]
	ldr r0, _08044BE4
	bl BattleScriptExecute
	movs r2, #1
	str r2, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044BE0: .4byte 0xFFFFF077
_08044BE4: .4byte 0x08289CA6
_08044BE8:
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	mov r0, r8
	adds r0, #0x4c
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _08044C00
	b _08044E16
_08044C00:
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r1]
	ldr r0, _08044C14
	bl BattleScriptExecute
	movs r3, #1
	str r3, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044C14: .4byte 0x08289CBE
_08044C18:
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	mov r0, r8
	adds r0, #0x4c
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _08044C30
	b _08044E16
_08044C30:
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r1]
	ldr r0, _08044C44
	bl BattleScriptExecute
	movs r5, #1
	str r5, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044C44: .4byte 0x08289CD6
_08044C48:
	movs r0, #0x58
	adds r3, r7, #0
	muls r3, r0, r3
	mov r0, r8
	adds r0, #0x4c
	adds r2, r3, r0
	ldr r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08044C60
	b _08044E16
_08044C60:
	movs r0, #8
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	mov r1, r8
	adds r1, #0x50
	adds r1, r3, r1
	ldr r0, [r1]
	ldr r2, _08044C7C
	ands r0, r2
	str r0, [r1]
	ldr r0, _08044C80
	b _08044DCA
	.align 2, 0
_08044C7C: .4byte 0xF7FFFFFF
_08044C80: .4byte 0x08289CEE
_08044C84:
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	mov r0, r8
	adds r0, #0x50
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	bne _08044C9C
	b _08044E16
_08044C9C:
	movs r0, #8
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r1]
	ldr r0, _08044CB0
	bl BattleScriptExecute
	movs r1, #2
	str r1, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044CB0: .4byte 0x08289D06
_08044CB4:
	movs r0, #0x58
	adds r5, r7, #0
	muls r5, r0, r5
	mov r0, r8
	adds r0, #0x4c
	adds r4, r5, r0
	ldr r2, [r4]
	ldrb r0, [r4]
	cmp r0, #0
	bne _08044CDA
	mov r0, r8
	adds r0, #0x50
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _08044CDA
	b _08044E16
_08044CDA:
	movs r3, #0
	mov sl, r3
	movs r0, #0x88
	ands r2, r0
	cmp r2, #0
	beq _08044CF2
	ldr r0, _08044D80
	ldr r1, _08044D84
	bl StringCopy
	movs r0, #1
	mov sl, r0
_08044CF2:
	ldr r0, [r4]
	movs r1, #7
	mov sb, r1
	ands r0, r1
	mov r6, r8
	adds r6, #0x50
	cmp r0, #0
	beq _08044D18
	adds r2, r5, r6
	ldr r0, [r2]
	ldr r1, _08044D88
	ands r0, r1
	str r0, [r2]
	ldr r0, _08044D80
	ldr r1, _08044D8C
	bl StringCopy
	movs r2, #1
	add sl, r2
_08044D18:
	ldr r0, [r4]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08044D2E
	ldr r0, _08044D80
	ldr r1, _08044D90
	bl StringCopy
	movs r3, #1
	add sl, r3
_08044D2E:
	ldr r0, [r4]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08044D44
	ldr r0, _08044D80
	ldr r1, _08044D94
	bl StringCopy
	movs r0, #1
	add sl, r0
_08044D44:
	ldr r0, [r4]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08044D5A
	ldr r0, _08044D80
	ldr r1, _08044D98
	bl StringCopy
	movs r1, #1
	add sl, r1
_08044D5A:
	adds r0, r5, r6
	ldr r0, [r0]
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08044D72
	ldr r0, _08044D80
	ldr r1, _08044D9C
	bl StringCopy
	movs r3, #1
	add sl, r3
_08044D72:
	mov r5, sl
	cmp r5, #1
	bgt _08044DA4
	ldr r1, _08044DA0
	movs r0, #0
	b _08044DA8
	.align 2, 0
_08044D80: .4byte 0x02022C0C
_08044D84: .4byte 0x085ABC54
_08044D88: .4byte 0xF7FFFFFF
_08044D8C: .4byte 0x085ABC50
_08044D90: .4byte 0x085ABC5B
_08044D94: .4byte 0x085ABC57
_08044D98: .4byte 0x085ABC5E
_08044D9C: .4byte 0x085ABC62
_08044DA0: .4byte 0x02023FD6
_08044DA4:
	ldr r1, _08044DD4
	movs r0, #1
_08044DA8:
	strb r0, [r1, #5]
	ldr r2, _08044DD8
	movs r0, #0x58
	adds r3, r7, #0
	muls r3, r0, r3
	adds r0, r2, #0
	adds r0, #0x4c
	adds r0, r3, r0
	movs r1, #0
	str r1, [r0]
	adds r2, #0x50
	adds r3, r3, r2
	ldr r0, [r3]
	subs r1, #8
	ands r0, r1
	str r0, [r3]
	ldr r0, _08044DDC
_08044DCA:
	bl BattleScriptExecute
	movs r0, #1
	str r0, [sp, #0xc]
	b _08044E1E
	.align 2, 0
_08044DD4: .4byte 0x02023FD6
_08044DD8: .4byte 0x02023D28
_08044DDC: .4byte 0x08289D1C
_08044DE0:
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	mov r0, r8
	adds r0, #0x50
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _08044E16
	ldr r0, _08044E3C
	ands r2, r0
	str r2, [r1]
	ldr r0, _08044E40
	ldr r1, _08044E44
	bl StringCopy
	ldr r0, _08044E48
	bl BattleScriptExecute
	ldr r1, _08044E4C
	movs r0, #0
	strb r0, [r1, #5]
	movs r1, #2
	str r1, [sp, #0xc]
_08044E16:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _08044E1E
	b _0804546A
_08044E1E:
	ldr r0, _08044E50
	strb r7, [r0, #0x17]
	ldr r0, _08044E54
	strb r7, [r0]
	ldr r4, _08044E58
	ldr r0, _08044E5C
	strb r7, [r0]
	strb r7, [r4]
	ldr r3, [sp, #0xc]
	cmp r3, #1
	beq _08044E60
	cmp r3, #3
	beq _08044E66
	b _0804546A
	.align 2, 0
_08044E3C: .4byte 0xFFF0FFFF
_08044E40: .4byte 0x02022C0C
_08044E44: .4byte 0x085ABC67
_08044E48: .4byte 0x08289D1C
_08044E4C: .4byte 0x02023FD6
_08044E50: .4byte 0x02024118
_08044E54: .4byte 0x02023EB3
_08044E58: .4byte 0x02023D08
_08044E5C: .4byte 0x02023EAF
_08044E60:
	movs r0, #0x58
	muls r0, r7, r0
	b _080452CC
_08044E66:
	ldr r4, _08044EB4
	movs r0, #0x58
	adds r3, r7, #0
	muls r3, r0, r3
	adds r0, r4, #0
	adds r0, #0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08044E82
	b _0804546A
_08044E82:
	ldr r1, _08044EB8
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x18]
	lsrs r1, r1, #4
	ldr r2, _08044EBC
	mov r5, sl
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08044EA2
	b _0804546A
_08044EA2:
	adds r1, r5, r3
	adds r0, r4, #0
	adds r0, #0x24
	adds r1, r1, r0
	add r0, sp, #4
	ldrb r0, [r0]
	strb r0, [r1]
	b _0804546A
	.align 2, 0
_08044EB4: .4byte 0x02023D28
_08044EB8: .4byte 0x02023F60
_08044EBC: .4byte 0x082FACB4
_08044EC0:
	movs r7, #0
	ldr r0, _08044EF0
	ldrb r0, [r0]
	cmp r7, r0
	blo _08044ECC
	b _0804546A
_08044ECC:
	ldr r4, _08044EF4
	ldr r1, _08044EF8
	movs r0, #0x58
	muls r0, r7, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x2e]
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _08044F00
	ldr r1, _08044EFC
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r5, [r0, #7]
	b _08044F10
	.align 2, 0
_08044EF0: .4byte 0x02023D10
_08044EF4: .4byte 0x02023EAC
_08044EF8: .4byte 0x02023D28
_08044EFC: .4byte 0x020240A8
_08044F00:
	ldrh r0, [r4]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r4]
	bl sub_080D6D1C
_08044F10:
	subs r0, r5, #2
	cmp r0, #0x1a
	bls _08044F18
	b _080452B4
_08044F18:
	lsls r0, r0, #2
	ldr r1, _08044F24
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044F24: .4byte 0x08044F28
_08044F28: @ jump table
	.4byte _08044F94 @ case 0
	.4byte _08045084 @ case 1
	.4byte _08044FD0 @ case 2
	.4byte _0804500C @ case 3
	.4byte _08045048 @ case 4
	.4byte _080452B4 @ case 5
	.4byte _080450CC @ case 6
	.4byte _08045160 @ case 7
	.4byte _080452B4 @ case 8
	.4byte _080452B4 @ case 9
	.4byte _080452B4 @ case 10
	.4byte _080452B4 @ case 11
	.4byte _080452B4 @ case 12
	.4byte _080452B4 @ case 13
	.4byte _080452B4 @ case 14
	.4byte _080452B4 @ case 15
	.4byte _080452B4 @ case 16
	.4byte _080452B4 @ case 17
	.4byte _080452B4 @ case 18
	.4byte _080452B4 @ case 19
	.4byte _080452B4 @ case 20
	.4byte _08045254 @ case 21
	.4byte _080452B4 @ case 22
	.4byte _080452B4 @ case 23
	.4byte _080452B4 @ case 24
	.4byte _080452B4 @ case 25
	.4byte _08045108 @ case 26
_08044F94:
	ldr r1, _08044FC4
	movs r0, #0x58
	muls r0, r7, r0
	adds r1, #0x4c
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08044FAA
	b _080452B4
_08044FAA:
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _08044FC8
	ldr r0, _08044FCC
	str r0, [r1]
	movs r0, #1
	str r0, [sp, #0xc]
	b _080452BA
	.align 2, 0
_08044FC4: .4byte 0x02023D28
_08044FC8: .4byte 0x02023EB8
_08044FCC: .4byte 0x08289C94
_08044FD0:
	ldr r1, _08044FFC
	movs r0, #0x58
	muls r0, r7, r0
	adds r1, #0x4c
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	bne _08044FE6
	b _080452B4
_08044FE6:
	ldr r0, _08045000
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _08045004
	ldr r0, _08045008
	str r0, [r1]
	movs r1, #1
	str r1, [sp, #0xc]
	b _080452BA
	.align 2, 0
_08044FFC: .4byte 0x02023D28
_08045000: .4byte 0xFFFFF077
_08045004: .4byte 0x02023EB8
_08045008: .4byte 0x08289CAC
_0804500C:
	ldr r1, _0804503C
	movs r0, #0x58
	muls r0, r7, r0
	adds r1, #0x4c
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08045022
	b _080452B4
_08045022:
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _08045040
	ldr r0, _08045044
	str r0, [r1]
	movs r2, #1
	str r2, [sp, #0xc]
	b _080452BA
	.align 2, 0
_0804503C: .4byte 0x02023D28
_08045040: .4byte 0x02023EB8
_08045044: .4byte 0x08289CC4
_08045048:
	ldr r1, _08045078
	movs r0, #0x58
	muls r0, r7, r0
	adds r1, #0x4c
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0804505E
	b _080452B4
_0804505E:
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _0804507C
	ldr r0, _08045080
	str r0, [r1]
	movs r3, #1
	str r3, [sp, #0xc]
	b _080452BA
	.align 2, 0
_08045078: .4byte 0x02023D28
_0804507C: .4byte 0x02023EB8
_08045080: .4byte 0x08289CDC
_08045084:
	ldr r2, _080450BC
	movs r0, #0x58
	adds r4, r7, #0
	muls r4, r0, r4
	adds r0, r2, #0
	adds r0, #0x4c
	adds r3, r4, r0
	ldr r1, [r3]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0804509E
	b _080452B4
_0804509E:
	movs r0, #8
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3]
	adds r2, #0x50
	adds r2, r4, r2
	ldr r0, [r2]
	ldr r1, _080450C0
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r1, _080450C4
	ldr r0, _080450C8
	b _0804521C
	.align 2, 0
_080450BC: .4byte 0x02023D28
_080450C0: .4byte 0xF7FFFFFF
_080450C4: .4byte 0x02023EB8
_080450C8: .4byte 0x08289CF4
_080450CC:
	ldr r1, _080450FC
	movs r0, #0x58
	muls r0, r7, r0
	adds r1, #0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080450E2
	b _080452B4
_080450E2:
	movs r0, #8
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	bl BattleScriptPushCursor
	ldr r1, _08045100
	ldr r0, _08045104
	str r0, [r1]
	movs r0, #2
	str r0, [sp, #0xc]
	b _080452BA
	.align 2, 0
_080450FC: .4byte 0x02023D28
_08045100: .4byte 0x02023EB8
_08045104: .4byte 0x08289D0C
_08045108:
	ldr r1, _08045144
	movs r0, #0x58
	muls r0, r7, r0
	adds r1, #0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _08045120
	b _080452B4
_08045120:
	ldr r0, _08045148
	ands r1, r0
	str r1, [r2]
	ldr r0, _0804514C
	ldr r1, _08045150
	bl StringCopy
	bl BattleScriptPushCursor
	ldr r1, _08045154
	movs r0, #0
	strb r0, [r1, #5]
	ldr r1, _08045158
	ldr r0, _0804515C
	str r0, [r1]
	movs r1, #2
	str r1, [sp, #0xc]
	b _080452BA
	.align 2, 0
_08045144: .4byte 0x02023D28
_08045148: .4byte 0xFFF0FFFF
_0804514C: .4byte 0x02022C0C
_08045150: .4byte 0x085ABC67
_08045154: .4byte 0x02023FD6
_08045158: .4byte 0x02023EB8
_0804515C: .4byte 0x08289D22
_08045160:
	ldr r4, _08045224
	movs r0, #0x58
	adds r5, r7, #0
	muls r5, r0, r5
	adds r0, r4, #0
	adds r0, #0x4c
	adds r6, r5, r0
	ldr r2, [r6]
	ldrb r0, [r6]
	cmp r0, #0
	bne _08045188
	adds r0, r4, #0
	adds r0, #0x50
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _08045188
	b _080452B4
_08045188:
	movs r0, #0x88
	ands r2, r0
	cmp r2, #0
	beq _08045198
	ldr r0, _08045228
	ldr r1, _0804522C
	bl StringCopy
_08045198:
	ldr r0, [r6]
	movs r2, #7
	mov r8, r2
	ands r0, r2
	adds r4, #0x50
	cmp r0, #0
	beq _080451B8
	adds r2, r5, r4
	ldr r0, [r2]
	ldr r1, _08045230
	ands r0, r1
	str r0, [r2]
	ldr r0, _08045228
	ldr r1, _08045234
	bl StringCopy
_080451B8:
	ldr r0, [r6]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080451CA
	ldr r0, _08045228
	ldr r1, _08045238
	bl StringCopy
_080451CA:
	ldr r0, [r6]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080451DC
	ldr r0, _08045228
	ldr r1, _0804523C
	bl StringCopy
_080451DC:
	ldr r0, [r6]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080451EE
	ldr r0, _08045228
	ldr r1, _08045240
	bl StringCopy
_080451EE:
	adds r5, r5, r4
	ldr r0, [r5]
	mov r3, r8
	ands r0, r3
	cmp r0, #0
	beq _08045202
	ldr r0, _08045228
	ldr r1, _08045244
	bl StringCopy
_08045202:
	movs r4, #0
	str r4, [r6]
	ldr r0, [r5]
	movs r1, #8
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5]
	bl BattleScriptPushCursor
	ldr r0, _08045248
	strb r4, [r0, #5]
	ldr r1, _0804524C
	ldr r0, _08045250
_0804521C:
	str r0, [r1]
	movs r5, #1
	str r5, [sp, #0xc]
	b _080452BA
	.align 2, 0
_08045224: .4byte 0x02023D28
_08045228: .4byte 0x02022C0C
_0804522C: .4byte 0x085ABC54
_08045230: .4byte 0xF7FFFFFF
_08045234: .4byte 0x085ABC50
_08045238: .4byte 0x085ABC5B
_0804523C: .4byte 0x085ABC57
_08045240: .4byte 0x085ABC5E
_08045244: .4byte 0x085ABC62
_08045248: .4byte 0x02023FD6
_0804524C: .4byte 0x02023EB8
_08045250: .4byte 0x08289D22
_08045254:
	ldr r0, _080452A0
	mov r8, r0
	movs r0, #0x58
	adds r1, r7, #0
	muls r1, r0, r1
	mov r0, r8
	adds r0, #0x18
	adds r1, r1, r0
	movs r2, #6
	movs r3, #7
	mov sl, r3
_0804526A:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #5
	bgt _08045278
	strb r2, [r1]
	movs r5, #5
	str r5, [sp, #0xc]
_08045278:
	adds r1, #1
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r3, sl
	cmp r3, #0
	bge _0804526A
	ldr r5, [sp, #0xc]
	cmp r5, #0
	beq _080452F8
	ldr r0, _080452A4
	strb r7, [r0, #0x17]
	ldr r0, _080452A8
	strb r7, [r0]
	bl BattleScriptPushCursor
	ldr r1, _080452AC
	ldr r0, _080452B0
	str r0, [r1]
	b _0804546A
	.align 2, 0
_080452A0: .4byte 0x02023D28
_080452A4: .4byte 0x02024118
_080452A8: .4byte 0x02023EB3
_080452AC: .4byte 0x02023EB8
_080452B0: .4byte 0x08289D3C
_080452B4:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _080452F8
_080452BA:
	ldr r0, _080452E8
	strb r7, [r0, #0x17]
	ldr r0, _080452EC
	strb r7, [r0]
	ldr r4, _080452F0
	strb r7, [r4]
	ldrb r1, [r4]
	movs r0, #0x58
	muls r0, r1, r0
_080452CC:
	ldr r1, _080452F4
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #0x28
	movs r2, #0
	movs r3, #4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _0804546A
	.align 2, 0
_080452E8: .4byte 0x02024118
_080452EC: .4byte 0x02023EB3
_080452F0: .4byte 0x02023D08
_080452F4: .4byte 0x02023D74
_080452F8:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0804530C
	ldrb r0, [r0]
	cmp r7, r0
	bhs _08045308
	b _08044ECC
_08045308:
	b _0804546A
	.align 2, 0
_0804530C: .4byte 0x02023D10
_08045310:
	ldr r7, _08045328
	ldr r0, [r7]
	cmp r0, #0
	bne _0804531A
	b _0804546A
_0804531A:
	mov r1, r8
	cmp r1, #0x1e
	beq _0804532C
	cmp r1, #0x3e
	beq _080453D4
	b _0804546A
	.align 2, 0
_08045328: .4byte 0x02023E94
_0804532C:
	ldr r0, _080453B8
	ldrb r1, [r0]
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	beq _0804533A
	b _0804546A
_0804533A:
	ldr r2, _080453BC
	ldr r4, _080453C0
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08045360
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08045360
	b _0804546A
_08045360:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bhs _0804546A
	ldr r2, _080453C4
	ldr r0, _080453C8
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0804546A
	ldr r2, _080453CC
	ldrb r1, [r4]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	beq _0804546A
	ldr r1, _080453D0
	movs r0, #8
	strb r0, [r1, #3]
	bl BattleScriptPushCursor
	movs r0, #0
	movs r1, #0
	bl SetMoveEffect
	bl HandleAction_RunBattleScript
	b _0804546A
	.align 2, 0
_080453B8: .4byte 0x02023F20
_080453BC: .4byte 0x02024020
_080453C0: .4byte 0x02023EB0
_080453C4: .4byte 0x082ED220
_080453C8: .4byte 0x02023E8E
_080453CC: .4byte 0x02023D28
_080453D0: .4byte 0x02023FD6
_080453D4:
	ldr r0, _0804547C
	ldrb r0, [r0]
	movs r5, #0x29
	ands r5, r0
	cmp r5, #0
	bne _0804546A
	ldr r1, _08045480
	ldr r4, _08045484
	ldrb r2, [r4]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r6, r1, #4
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _0804546A
	ldr r0, _08045488
	cmp r1, r0
	beq _0804546A
	ldr r0, _0804548C
	ldrb r3, [r0]
	cmp r3, r2
	beq _0804546A
	ldr r2, _08045490
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #0x28]
	ldrh r0, [r0, #0x2c]
	cmp r1, r0
	beq _0804546A
	cmp r1, #0
	beq _0804546A
	ldr r0, _08045494
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r0]
	ldr r0, _08045498
	strb r3, [r0]
	ldr r0, _0804549C
	strb r3, [r0, #0x17]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	bl __divsi3
	rsbs r0, r0, #0
	str r0, [r7]
	ldrb r1, [r4]
	cmp r0, #0
	bne _0804544C
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7]
_0804544C:
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	str r5, [r0]
	bl BattleScriptPushCursor
	ldr r1, _080454A0
	ldr r0, _080454A4
	str r0, [r1]
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
_0804546A:
	ldr r0, [sp, #0xc]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804547C: .4byte 0x02023F20
_08045480: .4byte 0x02024020
_08045484: .4byte 0x02023EB0
_08045488: .4byte 0x0000FFFF
_0804548C: .4byte 0x02023EAF
_08045490: .4byte 0x02023D28
_08045494: .4byte 0x02023EAC
_08045498: .4byte 0x02023EB3
_0804549C: .4byte 0x02024118
_080454A0: .4byte 0x02023EB8
_080454A4: .4byte 0x08289D7F
	thumb_func_end ItemBattleEffects

	thumb_func_start ClearFuryCutterDestinyBondGrudge
ClearFuryCutterDestinyBondGrudge: @ 0x080454A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080454E0
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1, #0x10]
	ldr r1, _080454E4
	movs r2, #0x58
	adds r3, r0, #0
	muls r3, r2, r3
	adds r1, #0x50
	adds r3, r3, r1
	ldr r1, [r3]
	ldr r2, _080454E8
	ands r1, r2
	str r1, [r3]
	ldr r1, _080454EC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, _080454F0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080454E0: .4byte 0x02023F60
_080454E4: .4byte 0x02023D28
_080454E8: .4byte 0xFDFFFFFF
_080454EC: .4byte 0x02023F50
_080454F0: .4byte 0xFFFFBFFF
	thumb_func_end ClearFuryCutterDestinyBondGrudge

	thumb_func_start sub_080454F4
sub_080454F4: @ 0x080454F4
	push {lr}
	ldr r0, _08045514
	ldr r0, [r0]
	cmp r0, #0
	bne _08045510
	ldr r1, _08045518
	ldr r0, _0804551C
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08045510:
	pop {r0}
	bx r0
	.align 2, 0
_08045514: .4byte 0x02023D0C
_08045518: .4byte 0x082EC694
_0804551C: .4byte 0x02023EB8
	thumb_func_end sub_080454F4

	thumb_func_start GetMoveTarget
GetMoveTarget: @ 0x08045520
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	movs r5, #0
	cmp r0, #0
	beq _0804553E
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0804554A
_0804553E:
	ldr r1, _0804555C
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r6, [r0, #6]
_0804554A:
	cmp r6, #0x40
	bls _08045550
	b _08045860
_08045550:
	lsls r0, r6, #2
	ldr r1, _08045560
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804555C: .4byte 0x082ED220
_08045560: .4byte 0x08045564
_08045564: @ jump table
	.4byte _08045668 @ case 0
	.4byte _08045768 @ case 1
	.4byte _0804585C @ case 2
	.4byte _08045860 @ case 3
	.4byte _08045780 @ case 4
	.4byte _08045860 @ case 5
	.4byte _08045860 @ case 6
	.4byte _08045860 @ case 7
	.4byte _08045768 @ case 8
	.4byte _08045860 @ case 9
	.4byte _08045860 @ case 10
	.4byte _08045860 @ case 11
	.4byte _08045860 @ case 12
	.4byte _08045860 @ case 13
	.4byte _08045860 @ case 14
	.4byte _08045860 @ case 15
	.4byte _0804585C @ case 16
	.4byte _08045860 @ case 17
	.4byte _08045860 @ case 18
	.4byte _08045860 @ case 19
	.4byte _08045860 @ case 20
	.4byte _08045860 @ case 21
	.4byte _08045860 @ case 22
	.4byte _08045860 @ case 23
	.4byte _08045860 @ case 24
	.4byte _08045860 @ case 25
	.4byte _08045860 @ case 26
	.4byte _08045860 @ case 27
	.4byte _08045860 @ case 28
	.4byte _08045860 @ case 29
	.4byte _08045860 @ case 30
	.4byte _08045860 @ case 31
	.4byte _08045768 @ case 32
	.4byte _08045860 @ case 33
	.4byte _08045860 @ case 34
	.4byte _08045860 @ case 35
	.4byte _08045860 @ case 36
	.4byte _08045860 @ case 37
	.4byte _08045860 @ case 38
	.4byte _08045860 @ case 39
	.4byte _08045860 @ case 40
	.4byte _08045860 @ case 41
	.4byte _08045860 @ case 42
	.4byte _08045860 @ case 43
	.4byte _08045860 @ case 44
	.4byte _08045860 @ case 45
	.4byte _08045860 @ case 46
	.4byte _08045860 @ case 47
	.4byte _08045860 @ case 48
	.4byte _08045860 @ case 49
	.4byte _08045860 @ case 50
	.4byte _08045860 @ case 51
	.4byte _08045860 @ case 52
	.4byte _08045860 @ case 53
	.4byte _08045860 @ case 54
	.4byte _08045860 @ case 55
	.4byte _08045860 @ case 56
	.4byte _08045860 @ case 57
	.4byte _08045860 @ case 58
	.4byte _08045860 @ case 59
	.4byte _08045860 @ case 60
	.4byte _08045860 @ case 61
	.4byte _08045860 @ case 62
	.4byte _08045860 @ case 63
	.4byte _08045768 @ case 64
_08045668:
	ldr r0, _08045748
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0804574C
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _0804569A
	ldr r1, _08045750
	ldrb r4, [r2, #9]
	movs r0, #0x58
	muls r0, r4, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	beq _0804569A
	b _080457B0
_0804569A:
	ldr r0, _08045748
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r7, #1
	mov r8, r0
_080456AA:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08045754
	ldrb r1, [r1]
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _08045748
	ldrb r3, [r6]
	cmp r5, r3
	beq _080456AA
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	beq _080456AA
	ldr r0, _08045758
	ldrb r2, [r0]
	ldr r1, _0804575C
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, #0
	bne _080456AA
	ldr r0, _08045760
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	cmp r0, #0xd
	beq _080456F8
	b _08045860
_080456F8:
	ldrb r1, [r6]
	str r2, [sp]
	movs r0, #0x10
	movs r2, #0x1f
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804570E
	b _08045860
_0804570E:
	ldr r2, _08045750
	movs r1, #0x58
	adds r0, r5, #0
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x1f
	bne _08045722
	b _08045860
_08045722:
	movs r4, #2
	eors r5, r4
	adds r0, r5, #0
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r5, #0
	bl RecordAbilityBattle
	ldr r1, _08045764
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	b _08045860
	.align 2, 0
_08045748: .4byte 0x02023EAF
_0804574C: .4byte 0x02023F38
_08045750: .4byte 0x02023D28
_08045754: .4byte 0x02023D10
_08045758: .4byte 0x02023EB4
_0804575C: .4byte 0x082FACB4
_08045760: .4byte 0x082ED220
_08045764: .4byte 0x02024020
_08045768:
	ldr r0, _0804577C
	ldrb r0, [r0]
	bl GetBattlerPosition
	adds r1, r0, #0
	movs r2, #1
	movs r0, #1
	ands r0, r1
	eors r0, r2
	b _08045812
	.align 2, 0
_0804577C: .4byte 0x02023EAF
_08045780:
	ldr r0, _080457B4
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080457B8
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _080457C0
	ldr r1, _080457BC
	ldrb r4, [r2, #9]
	movs r0, #0x58
	muls r0, r4, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	beq _080457C0
_080457B0:
	adds r5, r4, #0
	b _08045860
	.align 2, 0
_080457B4: .4byte 0x02023EAF
_080457B8: .4byte 0x02023F38
_080457BC: .4byte 0x02023D28
_080457C0:
	ldr r0, _080457F4
	ldr r0, [r0]
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	beq _0804583C
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _0804583C
	ldr r0, _080457F8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08045800
	bl Random
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0
	beq _080457FC
	movs r0, #1
	b _08045812
	.align 2, 0
_080457F4: .4byte 0x02022C90
_080457F8: .4byte 0x02023EAF
_080457FC:
	movs r0, #3
	b _08045812
_08045800:
	bl Random
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0
	beq _08045810
	movs r0, #0
	b _08045812
_08045810:
	movs r0, #2
_08045812:
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08045834
	ldrb r1, [r0]
	ldr r2, _08045838
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08045860
	movs r0, #2
	eors r5, r0
	b _08045860
	.align 2, 0
_08045834: .4byte 0x02023EB4
_08045838: .4byte 0x082FACB4
_0804583C:
	ldr r0, _08045858
	ldrb r0, [r0]
	bl GetBattlerPosition
	adds r1, r0, #0
	movs r2, #1
	movs r0, #1
	ands r0, r1
	eors r0, r2
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08045860
	.align 2, 0
_08045858: .4byte 0x02023EAF
_0804585C:
	ldr r0, _0804587C
	ldrb r5, [r0]
_08045860:
	ldr r0, _0804587C
	ldrb r0, [r0]
	ldr r1, _08045880
	ldr r1, [r1]
	adds r0, r0, r1
	strb r5, [r0, #0xc]
	adds r0, r5, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804587C: .4byte 0x02023EAF
_08045880: .4byte 0x02024140
	thumb_func_end GetMoveTarget

	thumb_func_start HasObedientBitSet
HasObedientBitSet: @ 0x08045884
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080458CA
	ldr r0, _080458D0
	lsls r4, r4, #1
	adds r5, r4, r0
	ldrh r0, [r5]
	movs r7, #0x64
	muls r0, r7, r0
	ldr r6, _080458D4
	adds r0, r0, r6
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	movs r1, #0xcd
	lsls r1, r1, #1
	cmp r0, r1
	beq _080458D8
	ldrh r0, [r5]
	muls r0, r7, r0
	adds r0, r0, r6
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0x97
	beq _080458D8
_080458CA:
	movs r0, #1
	b _080458EE
	.align 2, 0
_080458D0: .4byte 0x02023D12
_080458D4: .4byte 0x02024190
_080458D8:
	ldr r0, _080458F4
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080458F8
	adds r0, r0, r1
	movs r1, #0x50
	movs r2, #0
	bl GetMonData
_080458EE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080458F4: .4byte 0x02023D12
_080458F8: .4byte 0x02024190
	thumb_func_end HasObedientBitSet

	thumb_func_start IsMonDisobedient
IsMonDisobedient: @ 0x080458FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	movs r6, #0
	ldr r5, _080459F0
	ldr r0, [r5]
	ldr r1, _080459F4
	ands r0, r1
	cmp r0, #0
	bne _080459EC
	ldr r4, _080459F8
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080459EC
	ldrb r0, [r4]
	bl HasObedientBitSet
	cmp r0, #0
	beq _080459B6
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08045948
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080459EC
_08045948:
	ldr r0, _080459F0
	ldr r1, [r0]
	ldr r0, _080459FC
	ands r0, r1
	cmp r0, #0
	bne _080459EC
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r1, r0
	cmp r1, #0
	bne _080459EC
	ldr r2, _08045A00
	ldr r0, _080459F8
	ldrb r1, [r0]
	movs r0, #0x58
	muls r1, r0, r1
	adds r0, r2, #0
	adds r0, #0x54
	adds r0, r1, r0
	ldr r0, [r0]
	adds r2, #0x3c
	adds r1, r1, r2
	bl IsOtherTrainer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080459EC
	ldr r0, _08045A04
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080459EC
	movs r6, #0xa
	ldr r0, _08045A08
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804599A
	movs r6, #0x1e
_0804599A:
	ldr r0, _08045A0C
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080459A8
	movs r6, #0x32
_080459A8:
	ldr r0, _08045A10
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080459B6
	movs r6, #0x46
_080459B6:
	ldr r5, _08045A00
	ldr r0, _080459F8
	mov r8, r0
	ldrb r0, [r0]
	movs r7, #0x58
	muls r0, r7, r0
	adds r0, r0, r5
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r6
	bls _080459EC
	bl Random
	movs r1, #0xff
	ands r1, r0
	mov r2, r8
	ldrb r0, [r2]
	adds r2, r0, #0
	muls r2, r7, r2
	adds r0, r2, r5
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r0, r0, r6
	muls r0, r1, r0
	asrs r4, r0, #8
	cmp r4, r6
	bge _08045A14
_080459EC:
	movs r0, #0
	b _08045C10
	.align 2, 0
_080459F0: .4byte 0x02022C90
_080459F4: .4byte 0x02000002
_080459F8: .4byte 0x02023EAF
_080459FC: .4byte 0x003F0100
_08045A00: .4byte 0x02023D28
_08045A04: .4byte 0x0000086E
_08045A08: .4byte 0x00000868
_08045A0C: .4byte 0x0000086A
_08045A10: .4byte 0x0000086C
_08045A14:
	ldr r3, _08045A50
	ldrh r0, [r3]
	cmp r0, #0x63
	bne _08045A2A
	adds r0, r5, #0
	adds r0, #0x50
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r2, _08045A54
	ands r1, r2
	str r1, [r0]
_08045A2A:
	mov r1, r8
	ldrb r0, [r1]
	muls r0, r7, r0
	adds r1, r5, #0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08045A60
	ldrh r0, [r3]
	cmp r0, #0xad
	beq _08045A4A
	cmp r0, #0xd6
	bne _08045A60
_08045A4A:
	ldr r1, _08045A58
	ldr r0, _08045A5C
	b _08045BBA
	.align 2, 0
_08045A50: .4byte 0x02023E8E
_08045A54: .4byte 0xFF7FFFFF
_08045A58: .4byte 0x02023EB8
_08045A5C: .4byte 0x08289C1D
_08045A60:
	bl Random
	movs r5, #0xff
	adds r1, r5, #0
	ands r1, r0
	ldr r7, _08045B00
	ldr r2, _08045B04
	mov sb, r2
	ldrb r3, [r2]
	movs r0, #0x58
	mov r8, r0
	mov r0, r8
	muls r0, r3, r0
	adds r0, r0, r7
	adds r0, #0x2a
	ldrb r2, [r0]
	adds r0, r2, r6
	muls r0, r1, r0
	asrs r4, r0, #8
	cmp r4, r6
	bge _08045B28
	ldr r6, _08045B08
	ldr r5, _08045B0C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0]
	adds r0, r3, #0
	movs r2, #0xff
	bl CheckMoveLimitations
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bne _08045AA8
	b _08045BAA
_08045AA8:
	ldr r1, _08045B10
	mov r8, r1
	movs r7, #3
_08045AAE:
	bl Random
	ands r0, r7
	mov r2, r8
	strb r0, [r2]
	strb r0, [r5]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ands r0, r4
	cmp r0, #0
	bne _08045AAE
	ldr r4, _08045B14
	ldr r3, _08045B00
	ldr r0, _08045B0C
	ldrb r0, [r0]
	lsls r0, r0, #1
	ldr r1, _08045B04
	ldrb r2, [r1]
	movs r1, #0x58
	muls r1, r2, r1
	adds r0, r0, r1
	adds r3, #0xc
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r1, _08045B18
	ldr r0, _08045B1C
	str r0, [r1]
	ldrh r0, [r4]
	movs r1, #0
	bl GetMoveTarget
	ldr r1, _08045B20
	strb r0, [r1]
	ldr r2, _08045B24
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xe
	b _08045C0A
	.align 2, 0
_08045B00: .4byte 0x02023D28
_08045B04: .4byte 0x02023EAF
_08045B08: .4byte 0x082FACB4
_08045B0C: .4byte 0x02023E8C
_08045B10: .4byte 0x02023E8D
_08045B14: .4byte 0x02023E92
_08045B18: .4byte 0x02023EB8
_08045B1C: .4byte 0x08289C2D
_08045B20: .4byte 0x02023EB0
_08045B24: .4byte 0x02023F24
_08045B28:
	subs r0, r2, r6
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl Random
	adds r4, r5, #0
	ands r4, r0
	cmp r4, r6
	bge _08045BA4
	mov r1, sb
	ldrb r0, [r1]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r1, r0
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	bne _08045BA4
	adds r0, r1, r7
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x48
	beq _08045BA4
	cmp r0, #0xf
	beq _08045BA4
	movs r2, #0
	ldr r0, _08045B98
	ldrb r3, [r0]
	mov r8, r0
	cmp r2, r3
	bge _08045B8A
	ldr r0, [r7, #0x50]
	movs r1, #0x70
	ands r0, r1
	cmp r0, #0
	bne _08045B8A
	adds r1, r7, #0
	adds r1, #0x50
	movs r5, #0x70
_08045B7A:
	adds r1, #0x58
	adds r2, #1
	cmp r2, r3
	bge _08045B8A
	ldr r0, [r1]
	ands r0, r5
	cmp r0, #0
	beq _08045B7A
_08045B8A:
	mov r0, r8
	ldrb r0, [r0]
	cmp r2, r0
	bne _08045BA4
	ldr r1, _08045B9C
	ldr r0, _08045BA0
	b _08045BBA
	.align 2, 0
_08045B98: .4byte 0x02023D10
_08045B9C: .4byte 0x02023EB8
_08045BA0: .4byte 0x08289C61
_08045BA4:
	subs r4, r4, r6
	cmp r4, r6
	blt _08045BCC
_08045BAA:
	bl Random
	ldr r2, _08045BC0
	movs r1, #3
	ands r1, r0
	strb r1, [r2, #5]
	ldr r1, _08045BC4
	ldr r0, _08045BC8
_08045BBA:
	str r0, [r1]
	movs r0, #1
	b _08045C10
	.align 2, 0
_08045BC0: .4byte 0x02023FD6
_08045BC4: .4byte 0x02023EB8
_08045BC8: .4byte 0x08289C35
_08045BCC:
	ldr r4, _08045C20
	ldrb r1, [r4]
	movs r0, #0x58
	muls r1, r0, r1
	ldr r0, _08045C24
	adds r1, r1, r0
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldrb r0, [r4]
	str r0, [sp, #8]
	ldrb r0, [r4]
	str r0, [sp, #0xc]
	adds r0, r1, #0
	movs r2, #1
	movs r3, #0
	bl CalculateBaseDamage
	ldr r1, _08045C28
	str r0, [r1]
	ldr r1, _08045C2C
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r1, _08045C30
	ldr r0, _08045C34
	str r0, [r1]
	ldr r2, _08045C38
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xc
_08045C0A:
	orrs r0, r1
	str r0, [r2]
	movs r0, #2
_08045C10:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045C20: .4byte 0x02023EAF
_08045C24: .4byte 0x02023D28
_08045C28: .4byte 0x02023E94
_08045C2C: .4byte 0x02023EB0
_08045C30: .4byte 0x02023EB8
_08045C34: .4byte 0x08289C78
_08045C38: .4byte 0x02023F24
	thumb_func_end IsMonDisobedient

