.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AreMovesContestCombo
AreMovesContestCombo: @ 0x080E4BF0
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _080E4C44
	lsrs r0, r0, #0xd
	adds r0, r0, r2
	ldrb r4, [r0, #2]
	mov r3, sp
	lsrs r1, r1, #0xd
	adds r1, r1, r2
	ldrb r0, [r1, #3]
	strb r0, [r3]
	mov r2, sp
	ldrb r0, [r1, #4]
	strb r0, [r2, #1]
	ldrb r0, [r1, #5]
	strb r0, [r2, #2]
	mov r0, sp
	ldrb r1, [r1, #6]
	strb r1, [r0, #3]
	cmp r4, #0
	beq _080E4C4C
	mov r0, sp
	ldrb r0, [r0]
	cmp r4, r0
	beq _080E4C3A
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r4, r0
	beq _080E4C3A
	mov r0, sp
	ldrb r0, [r0, #2]
	cmp r4, r0
	beq _080E4C3A
	cmp r4, r1
	bne _080E4C4C
_080E4C3A:
	ldr r0, _080E4C48
	adds r0, r4, r0
	ldrb r0, [r0]
	b _080E4C4E
	.align 2, 0
_080E4C44: .4byte 0x08565FCC
_080E4C48: .4byte 0x08566BA4
_080E4C4C:
	movs r0, #0
_080E4C4E:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AreMovesContestCombo

	thumb_func_start ContestEffect_MakeScramblingTurnOrderEasier
ContestEffect_MakeScramblingTurnOrderEasier: @ 0x080E4C58
	bx lr
	.align 2, 0
	thumb_func_end ContestEffect_MakeScramblingTurnOrderEasier

	thumb_func_start ContestEffect_UserMoreEasilyStartled
ContestEffect_UserMoreEasilyStartled: @ 0x080E4C5C
	push {lr}
	ldr r3, _080E4C88
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #0x10]
	ldr r0, [r3]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E4C88: .4byte 0x02039BD4
	thumb_func_end ContestEffect_UserMoreEasilyStartled

	thumb_func_start ContestEffect_GreatAppealButNoMoreMoves
ContestEffect_GreatAppealButNoMoreMoves: @ 0x080E4C8C
	push {lr}
	ldr r3, _080E4CB8
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #0x11]
	ldr r0, [r3]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #1
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E4CB8: .4byte 0x02039BD4
	thumb_func_end ContestEffect_GreatAppealButNoMoreMoves

	thumb_func_start ContestEffect_RepetitionNotBoring
ContestEffect_RepetitionNotBoring: @ 0x080E4CBC
	ldr r3, _080E4D0C
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #0x10]
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r0, [r0, #0x11]
	ldr r2, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x15]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x15]
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r0, [r0, #0x11]
	ldr r2, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xb]
	movs r0, #0x71
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0xb]
	bx lr
	.align 2, 0
_080E4D0C: .4byte 0x02039BD4
	thumb_func_end ContestEffect_RepetitionNotBoring

	thumb_func_start ContestEffect_AvoidStartleOnce
ContestEffect_AvoidStartleOnce: @ 0x080E4D10
	push {lr}
	ldr r3, _080E4D38
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0, #0x12]
	ldr r0, [r3]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #2
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E4D38: .4byte 0x02039BD4
	thumb_func_end ContestEffect_AvoidStartleOnce

	thumb_func_start ContestEffect_AvoidStartle
ContestEffect_AvoidStartle: @ 0x080E4D3C
	push {lr}
	ldr r3, _080E4D68
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0, #0x10]
	ldr r0, [r3]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #3
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E4D68: .4byte 0x02039BD4
	thumb_func_end ContestEffect_AvoidStartle

	thumb_func_start ContestEffect_AvoidStartleSlightly
ContestEffect_AvoidStartleSlightly: @ 0x080E4D6C
	push {lr}
	ldr r3, _080E4D94
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x14
	strb r1, [r0, #0xf]
	ldr r0, [r3]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #4
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E4D94: .4byte 0x02039BD4
	thumb_func_end ContestEffect_AvoidStartleSlightly

	thumb_func_start ContestEffect_UserLessEasilyStartled
ContestEffect_UserLessEasilyStartled: @ 0x080E4D98
	push {lr}
	ldr r3, _080E4DC4
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #0x10]
	ldr r0, [r3]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #5
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E4DC4: .4byte 0x02039BD4
	thumb_func_end ContestEffect_UserLessEasilyStartled

	thumb_func_start ContestEffect_StartleFrontMon
ContestEffect_StartleFrontMon: @ 0x080E4DC8
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _080E4E3C
	ldr r0, [r5]
	ldr r1, [r0, #8]
	ldrb r4, [r1, #0x11]
	adds r3, r1, r4
	ldrb r0, [r3]
	cmp r0, #0
	beq _080E4E16
	subs r0, #1
	ldrb r1, [r1]
	cmp r0, r1
	beq _080E4DFE
	adds r3, r5, #0
_080E4DE6:
	adds r2, #1
	cmp r2, #3
	bgt _080E4DFE
	ldr r0, [r3]
	ldr r1, [r0, #8]
	adds r0, r1, r4
	ldrb r0, [r0]
	subs r0, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	cmp r0, r1
	bne _080E4DE6
_080E4DFE:
	ldr r1, _080E4E3C
	ldr r0, [r1]
	ldr r0, [r0, #8]
	strb r2, [r0, #8]
	ldr r0, [r1]
	ldr r1, [r0, #8]
	movs r0, #0xff
	strb r0, [r1, #9]
	bl WasAtLeastOneOpponentJammed
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080E4E16:
	cmp r2, #0
	bne _080E4E28
	ldr r0, _080E4E3C
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x36
	bl SetContestantEffectStringID2
_080E4E28:
	ldr r0, _080E4E3C
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E4E3C: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartleFrontMon

	thumb_func_start ContestEffect_StartlePrevMons
ContestEffect_StartlePrevMons: @ 0x080E4E40
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r2, _080E4EB8
	ldr r0, [r2]
	ldr r0, [r0, #8]
	ldrb r5, [r0, #0x11]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E4E90
	movs r3, #0
	movs r4, #0
	adds r6, r2, #0
_080E4E5A:
	ldr r0, [r6]
	ldr r2, [r0, #8]
	adds r0, r2, r5
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080E4E74
	adds r0, r2, #0
	adds r0, #8
	adds r0, r0, r4
	strb r3, [r0]
	adds r4, #1
_080E4E74:
	adds r3, #1
	cmp r3, #3
	ble _080E4E5A
	ldr r0, _080E4EB8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, #8
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
	bl WasAtLeastOneOpponentJammed
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_080E4E90:
	cmp r1, #0
	bne _080E4EA2
	ldr r0, _080E4EB8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x36
	bl SetContestantEffectStringID2
_080E4EA2:
	ldr r0, _080E4EB8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E4EB8: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartlePrevMons

	thumb_func_start ContestEffect_StartlePrevMon2
ContestEffect_StartlePrevMon2: @ 0x080E4EBC
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x14
	cmp r0, #1
	bls _080E4EDE
	movs r1, #0x3c
	cmp r0, #7
	bhi _080E4EDE
	movs r1, #0x28
_080E4EDE:
	ldr r0, _080E4EF0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	strh r1, [r0, #4]
	bl ContestEffect_StartleFrontMon
	pop {r0}
	bx r0
	.align 2, 0
_080E4EF0: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartlePrevMon2

	thumb_func_start ContestEffect_StartlePrevMons2
ContestEffect_StartlePrevMons2: @ 0x080E4EF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r1, _080E4FA4
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r5, [r0, #0x11]
	adds r0, r0, r5
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, #0
	beq _080E4F7A
	movs r4, #0
	mov r6, r8
_080E4F12:
	ldr r0, [r6]
	ldr r2, [r0, #8]
	adds r0, r2, r5
	adds r1, r2, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080E4F74
	strb r4, [r2, #8]
	ldr r0, [r6]
	ldr r1, [r0, #8]
	movs r0, #0xff
	strb r0, [r1, #9]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	cmp r0, #0
	beq _080E4F5E
	movs r1, #0xa
	cmp r0, #2
	bls _080E4F5E
	movs r1, #0x14
	cmp r0, #4
	bls _080E4F5E
	movs r1, #0x1e
	cmp r0, #6
	bls _080E4F5E
	movs r1, #0x3c
	cmp r0, #8
	bhi _080E4F5E
	movs r1, #0x28
_080E4F5E:
	ldr r0, [r6]
	ldr r0, [r0, #8]
	strh r1, [r0, #4]
	bl WasAtLeastOneOpponentJammed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E4F74
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_080E4F74:
	adds r4, #1
	cmp r4, #3
	ble _080E4F12
_080E4F7A:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	cmp r7, #0
	bne _080E4F9A
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x36
	bl SetContestantEffectStringID2
_080E4F9A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4FA4: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartlePrevMons2

	thumb_func_start ContestEffect_ShiftJudgeAttention
ContestEffect_ShiftJudgeAttention: @ 0x080E4FA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sb, r0
	ldr r1, _080E5064
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r2, [r0, #0x11]
	mov r8, r2
	add r0, r8
	ldrb r0, [r0]
	mov sl, r1
	cmp r0, #0
	beq _080E5034
	movs r6, #0
	mov r7, sl
	movs r5, #0
_080E4FD0:
	ldr r2, [r7]
	ldr r0, [r2, #8]
	mov r3, r8
	adds r1, r0, r3
	adds r0, r0, r6
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _080E502C
	ldr r0, [r2, #4]
	adds r0, r5, r0
	ldrb r1, [r0, #0x15]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080E502C
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl CanUnnerveContestant
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E502C
	ldr r0, [r7]
	ldr r2, [r0, #4]
	adds r2, r5, r2
	ldrb r0, [r2, #0x15]
	movs r3, #0x11
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	ldr r0, [r7]
	ldr r2, [r0, #4]
	adds r2, r5, r2
	ldrb r0, [r2, #0x15]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #0x15]
	adds r0, r4, #0
	movs r1, #8
	bl SetContestantEffectStringID
	movs r0, #1
	mov sb, r0
_080E502C:
	adds r5, #0x1c
	adds r6, #1
	cmp r6, #3
	ble _080E4FD0
_080E5034:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #7
	bl SetContestantEffectStringID
	mov r2, sb
	cmp r2, #0
	bne _080E5056
	mov r3, sl
	ldr r0, [r3]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x36
	bl SetContestantEffectStringID2
_080E5056:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E5064: .4byte 0x02039BD4
	thumb_func_end ContestEffect_ShiftJudgeAttention

	thumb_func_start ContestEffect_StartleMonWithJudgesAttention
ContestEffect_StartleMonWithJudgesAttention: @ 0x080E5068
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov sb, r0
	ldr r1, _080E50B0
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r7, [r0, #0x11]
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0
	beq _080E50E6
	movs r5, #0
	movs r6, #0
	mov r8, r4
_080E508C:
	ldr r3, [r4]
	ldr r2, [r3, #8]
	adds r0, r2, r7
	adds r1, r2, r5
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080E50DC
	ldr r0, [r3, #4]
	adds r0, r6, r0
	ldrb r1, [r0, #0x15]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080E50B4
	movs r0, #0x32
	b _080E50B6
	.align 2, 0
_080E50B0: .4byte 0x02039BD4
_080E50B4:
	movs r0, #0xa
_080E50B6:
	strh r0, [r2, #4]
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, #8]
	strb r5, [r0, #8]
	ldr r0, [r1]
	ldr r1, [r0, #8]
	movs r0, #0xff
	strb r0, [r1, #9]
	bl WasAtLeastOneOpponentJammed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E50DC
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_080E50DC:
	adds r6, #0x1c
	adds r5, #1
	ldr r4, _080E5110
	cmp r5, #3
	ble _080E508C
_080E50E6:
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	mov r0, sb
	cmp r0, #0
	bne _080E5104
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x36
	bl SetContestantEffectStringID2
_080E5104:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E5110: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartleMonWithJudgesAttention

	thumb_func_start ContestEffect_JamsOthersButMissOneTurn
ContestEffect_JamsOthersButMissOneTurn: @ 0x080E5114
	push {r4, lr}
	ldr r4, _080E5148
	ldr r1, [r4]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #0x11]
	bl ContestEffect_StartlePrevMons
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5148: .4byte 0x02039BD4
	thumb_func_end ContestEffect_JamsOthersButMissOneTurn

	thumb_func_start ContestEffect_StartleMonsSameTypeAppeal
ContestEffect_StartleMonsSameTypeAppeal: @ 0x080E514C
	push {r4, lr}
	ldr r4, _080E5184
	ldr r1, [r4]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	ldr r1, _080E5188
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	bl JamByMoveCategory
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5184: .4byte 0x02039BD4
_080E5188: .4byte 0x08565FCC
	thumb_func_end ContestEffect_StartleMonsSameTypeAppeal

	thumb_func_start ContestEffect_StartleMonsCoolAppeal
ContestEffect_StartleMonsCoolAppeal: @ 0x080E518C
	push {lr}
	movs r0, #0
	bl JamByMoveCategory
	ldr r0, _080E51A8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E51A8: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartleMonsCoolAppeal

	thumb_func_start ContestEffect_StartleMonsBeautyAppeal
ContestEffect_StartleMonsBeautyAppeal: @ 0x080E51AC
	push {lr}
	movs r0, #1
	bl JamByMoveCategory
	ldr r0, _080E51C8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E51C8: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartleMonsBeautyAppeal

	thumb_func_start ContestEffect_StartleMonsCuteAppeal
ContestEffect_StartleMonsCuteAppeal: @ 0x080E51CC
	push {lr}
	movs r0, #2
	bl JamByMoveCategory
	ldr r0, _080E51E8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E51E8: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartleMonsCuteAppeal

	thumb_func_start ContestEffect_StartleMonsSmartAppeal
ContestEffect_StartleMonsSmartAppeal: @ 0x080E51EC
	push {lr}
	movs r0, #3
	bl JamByMoveCategory
	ldr r0, _080E5208
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E5208: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartleMonsSmartAppeal

	thumb_func_start ContestEffect_StartleMonsToughAppeal
ContestEffect_StartleMonsToughAppeal: @ 0x080E520C
	push {lr}
	movs r0, #4
	bl JamByMoveCategory
	ldr r0, _080E5228
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r0}
	bx r0
	.align 2, 0
_080E5228: .4byte 0x02039BD4
	thumb_func_end ContestEffect_StartleMonsToughAppeal

	thumb_func_start ContestEffect_MakeFollowingMonNervous
ContestEffect_MakeFollowingMonNervous: @ 0x080E522C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r2, _080E5278
	ldr r0, [r2]
	ldr r0, [r0, #8]
	ldrb r1, [r0, #0x11]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r6, r2, #0
	cmp r0, #3
	beq _080E528C
	movs r5, #0
_080E5244:
	ldr r0, _080E5278
	ldr r0, [r0]
	ldr r1, [r0, #8]
	ldrb r0, [r1, #0x11]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r1, r5
	ldrb r1, [r1]
	cmp r0, r1
	bne _080E5286
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl CanUnnerveContestant
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E527C
	adds r0, r4, #0
	bl MakeContestantNervous
	adds r0, r4, #0
	movs r1, #0xa
	b _080E5280
	.align 2, 0
_080E5278: .4byte 0x02039BD4
_080E527C:
	adds r0, r4, #0
	movs r1, #0x3c
_080E5280:
	bl SetContestantEffectStringID
	movs r4, #1
_080E5286:
	adds r5, #1
	cmp r5, #3
	ble _080E5244
_080E528C:
	ldr r0, [r6]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #9
	bl SetContestantEffectStringID
	cmp r4, #0
	bne _080E52A8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x36
	bl SetContestantEffectStringID2
_080E52A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestEffect_MakeFollowingMonNervous

	thumb_func_start ContestEffect_MakeFollowingMonsNervous
ContestEffect_MakeFollowingMonsNervous: @ 0x080E52B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #0x18]
	mov r0, sp
	movs r1, #0xff
	movs r2, #5
	bl memset
	movs r5, #0
	movs r4, #0
	add r2, sp, #0x10
	mov r8, r2
	add r3, sp, #8
	mov sl, r3
	movs r6, #0
_080E52DC:
	ldr r0, _080E5328
	ldr r2, [r0]
	ldr r1, [r2, #8]
	ldrb r0, [r1, #0x11]
	adds r0, r1, r0
	adds r1, r1, r5
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _080E5314
	ldr r0, [r2, #4]
	adds r0, r6, r0
	ldrb r1, [r0, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080E5314
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl Contest_IsMonsTurnDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E5314
	mov r1, sp
	adds r0, r1, r4
	strb r5, [r0]
	adds r4, #1
_080E5314:
	adds r6, #0x1c
	adds r5, #1
	cmp r5, #3
	ble _080E52DC
	cmp r4, #1
	bne _080E532C
	movs r0, #0x3c
	mov r2, r8
	strh r0, [r2]
	b _080E535A
	.align 2, 0
_080E5328: .4byte 0x02039BD4
_080E532C:
	cmp r4, #2
	bne _080E533A
	movs r0, #0x1e
	mov r3, r8
	strh r0, [r3]
	strh r0, [r3, #2]
	b _080E535A
_080E533A:
	cmp r4, #3
	bne _080E534A
	movs r0, #0x14
	mov r6, r8
	strh r0, [r6]
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	b _080E535A
_080E534A:
	mov r1, r8
	movs r2, #0
	mov r0, r8
	adds r0, #6
_080E5352:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _080E5352
_080E535A:
	movs r5, #0
	ldr r7, _080E53A0
	movs r6, #0
	mov r4, sl
_080E5362:
	ldr r0, [r7]
	ldr r0, [r0, #4]
	adds r0, r6, r0
	ldrb r1, [r0, #0x15]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080E53AC
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_080DD94C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E53AC
	ldr r0, [r7]
	ldr r0, [r0, #4]
	adds r0, r6, r0
	ldrh r0, [r0, #8]
	lsls r0, r0, #3
	ldr r1, _080E53A4
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	ldr r2, _080E53A8
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	b _080E53AE
	.align 2, 0
_080E53A0: .4byte 0x02039BD4
_080E53A4: .4byte 0x08565FCC
_080E53A8: .4byte 0x08566BA4
_080E53AC:
	movs r0, #0
_080E53AE:
	strh r0, [r4]
	ldr r0, [r7]
	ldr r0, [r0, #4]
	adds r0, r6, r0
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r4]
	adds r6, #0x1c
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _080E5362
	mov r3, r8
	movs r6, #0
	ldrsh r0, [r3, r6]
	cmp r0, #0
	beq _080E547C
	movs r5, #0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080E547C
	mov r4, sp
_080E53F2:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r5, #1
	add r1, r8
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldrb r3, [r4]
	lsls r1, r3, #1
	add r1, sl
	movs r6, #0
	ldrsh r1, [r1, r6]
	adds r2, r2, r1
	cmp r0, r2
	bge _080E5442
	adds r0, r3, #0
	bl CanUnnerveContestant
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E544C
	ldrb r0, [r4]
	bl MakeContestantNervous
	ldrb r0, [r4]
	movs r1, #0xa
	bl SetContestantEffectStringID
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _080E5446
_080E5442:
	movs r0, #1
	str r0, [sp, #0x18]
_080E5446:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq _080E5462
_080E544C:
	movs r2, #0
	str r2, [sp, #0x18]
	ldrb r0, [r4]
	movs r1, #0x3c
	bl SetContestantEffectStringID
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_080E5462:
	ldr r0, _080E54AC
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, #0xd
	ldrb r3, [r4]
	adds r0, r0, r3
	movs r1, #1
	strb r1, [r0]
	adds r4, #1
	adds r5, #1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _080E53F2
_080E547C:
	ldr r6, _080E54AC
	ldr r0, [r6]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0xb
	bl SetContestantEffectStringID
	mov r0, sb
	cmp r0, #0
	bne _080E549C
	ldr r0, [r6]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x36
	bl SetContestantEffectStringID2
_080E549C:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E54AC: .4byte 0x02039BD4
	thumb_func_end ContestEffect_MakeFollowingMonsNervous

	thumb_func_start ContestEffect_WorsenConditionOfPrevMons
ContestEffect_WorsenConditionOfPrevMons: @ 0x080E54B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldr r7, _080E5554
	movs r5, #0
_080E54C0:
	ldr r2, [r7]
	ldr r0, [r2, #8]
	ldrb r1, [r0, #0x11]
	adds r1, r0, r1
	adds r0, r0, r6
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _080E5522
	ldr r0, [r2, #4]
	adds r0, r5, r0
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080E5522
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl CanUnnerveContestant
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E5522
	ldr r0, [r7]
	ldr r0, [r0, #4]
	adds r0, r5, r0
	movs r1, #0
	strb r1, [r0, #0xd]
	ldr r0, [r7]
	ldr r2, [r0, #4]
	adds r2, r5, r2
	ldrb r1, [r2, #0x10]
	movs r3, #0x31
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r1, r0
	movs r0, #0x20
	orrs r1, r0
	strb r1, [r2, #0x10]
	adds r0, r4, #0
	movs r1, #0xd
	bl SetContestantEffectStringID
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080E5522:
	adds r5, #0x1c
	adds r6, #1
	cmp r6, #3
	ble _080E54C0
	ldr r4, _080E5554
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0xc
	bl SetContestantEffectStringID
	mov r0, r8
	cmp r0, #0
	bne _080E554A
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x39
	bl SetContestantEffectStringID2
_080E554A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E5554: .4byte 0x02039BD4
	thumb_func_end ContestEffect_WorsenConditionOfPrevMons

	thumb_func_start ContestEffect_BadlyStartlesMonsInGoodCondition
ContestEffect_BadlyStartlesMonsInGoodCondition: @ 0x080E5558
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r4, #0
	ldr r5, _080E5588
	movs r6, #0
_080E5562:
	ldr r3, [r5]
	ldr r2, [r3, #8]
	ldrb r0, [r2, #0x11]
	adds r0, r2, r0
	adds r1, r2, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080E55AE
	ldr r0, [r3, #4]
	adds r0, r6, r0
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080E558C
	movs r0, #0x28
	b _080E558E
	.align 2, 0
_080E5588: .4byte 0x02039BD4
_080E558C:
	movs r0, #0xa
_080E558E:
	strh r0, [r2, #4]
	ldr r0, [r5]
	ldr r0, [r0, #8]
	strb r4, [r0, #8]
	ldr r0, [r5]
	ldr r1, [r0, #8]
	movs r0, #0xff
	strb r0, [r1, #9]
	bl WasAtLeastOneOpponentJammed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E55AE
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_080E55AE:
	adds r6, #0x1c
	adds r4, #1
	cmp r4, #3
	ble _080E5562
	ldr r4, _080E55DC
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0xe
	bl SetContestantEffectStringID
	cmp r7, #0
	bne _080E55D4
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x39
	bl SetContestantEffectStringID2
_080E55D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E55DC: .4byte 0x02039BD4
	thumb_func_end ContestEffect_BadlyStartlesMonsInGoodCondition

	thumb_func_start ContestEffect_BetterIfFirst
ContestEffect_BetterIfFirst: @ 0x080E55E0
	push {r4, lr}
	ldr r1, _080E5628
	ldr r0, _080E562C
	ldr r4, [r0]
	ldr r0, [r4, #8]
	ldrb r2, [r0, #0x11]
	adds r1, r2, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080E5622
	ldr r0, [r4, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #6]
	ldr r3, _080E5630
	ldr r2, _080E5634
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #1
	ldrh r2, [r1, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	ldr r0, [r4, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0xf
	bl SetContestantEffectStringID
_080E5622:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5628: .4byte 0x02039BC6
_080E562C: .4byte 0x02039BD4
_080E5630: .4byte 0x08566AE4
_080E5634: .4byte 0x08565FCC
	thumb_func_end ContestEffect_BetterIfFirst

	thumb_func_start ContestEffect_BetterIfLast
ContestEffect_BetterIfLast: @ 0x080E5638
	push {r4, lr}
	ldr r1, _080E5680
	ldr r0, _080E5684
	ldr r4, [r0]
	ldr r0, [r4, #8]
	ldrb r2, [r0, #0x11]
	adds r1, r2, r1
	ldrb r0, [r1]
	cmp r0, #3
	bne _080E567A
	ldr r0, [r4, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #6]
	ldr r3, _080E5688
	ldr r2, _080E568C
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #1
	ldrh r2, [r1, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	ldr r0, [r4, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x10
	bl SetContestantEffectStringID
_080E567A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5680: .4byte 0x02039BC6
_080E5684: .4byte 0x02039BD4
_080E5688: .4byte 0x08566AE4
_080E568C: .4byte 0x08565FCC
	thumb_func_end ContestEffect_BetterIfLast

	thumb_func_start ContestEffect_AppealAsGoodAsPrevOnes
ContestEffect_AppealAsGoodAsPrevOnes: @ 0x080E5690
	push {r4, r5, r6, r7, lr}
	movs r1, #0
	movs r5, #0
	ldr r0, _080E56E4
	ldr r4, [r0]
	ldr r2, [r4, #8]
	ldrb r0, [r2, #0x11]
	adds r0, r2, r0
	ldrb r6, [r0]
	movs r3, #0
_080E56A4:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r6, r0
	bls _080E56B6
	ldr r0, [r4, #4]
	adds r0, r3, r0
	movs r7, #2
	ldrsh r0, [r0, r7]
	adds r5, r5, r0
_080E56B6:
	adds r3, #0x1c
	adds r1, #1
	cmp r1, #3
	ble _080E56A4
	cmp r5, #0
	bge _080E56C4
	movs r5, #0
_080E56C4:
	ldr r0, _080E56E4
	ldr r3, [r0]
	ldr r0, [r3, #8]
	ldrb r2, [r0, #0x11]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E56D8
	cmp r5, #0
	bne _080E56E8
_080E56D8:
	adds r0, r2, #0
	movs r1, #0x12
	bl SetContestantEffectStringID
	b _080E5708
	.align 2, 0
_080E56E4: .4byte 0x02039BD4
_080E56E8:
	ldr r0, [r3, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r0, r0, #1
	ldrh r2, [r1, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	ldr r0, [r3, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x11
	bl SetContestantEffectStringID
_080E5708:
	ldr r4, _080E573C
	ldr r1, [r4]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r7, #2
	ldrsh r0, [r0, r7]
	bl RoundTowardsZero
	ldr r2, [r4]
	ldr r1, [r2, #8]
	ldrb r3, [r1, #0x11]
	ldr r2, [r2, #4]
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	strh r0, [r1, #2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E573C: .4byte 0x02039BD4
	thumb_func_end ContestEffect_AppealAsGoodAsPrevOnes

	thumb_func_start ContestEffect_AppealAsGoodAsPrevOne
ContestEffect_AppealAsGoodAsPrevOne: @ 0x080E5740
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _080E579C
	ldr r4, [r0]
	ldr r2, [r4, #8]
	ldrb r1, [r2, #0x11]
	adds r3, r2, r1
	ldrb r1, [r3]
	adds r7, r0, #0
	cmp r1, #0
	beq _080E578E
	movs r1, #0
	adds r5, r4, #0
	adds r4, r2, #0
	ldrb r0, [r3]
	subs r3, r0, #1
	movs r2, #0
_080E5762:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r3, r0
	bne _080E5770
	ldr r0, [r5, #4]
	adds r0, r2, r0
	ldrh r6, [r0, #2]
_080E5770:
	adds r2, #0x1c
	adds r1, #1
	cmp r1, #3
	ble _080E5762
	ldr r3, [r7]
	ldr r0, [r3, #8]
	ldrb r2, [r0, #0x11]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E578E
	lsls r0, r6, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	bgt _080E57A0
_080E578E:
	ldr r0, [r7]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x14
	bl SetContestantEffectStringID
	b _080E57BA
	.align 2, 0
_080E579C: .4byte 0x02039BD4
_080E57A0:
	ldr r1, [r3, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #2]
	adds r1, r4, r1
	strh r1, [r0, #2]
	ldr r0, [r3, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x13
	bl SetContestantEffectStringID
_080E57BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_AppealAsGoodAsPrevOne

	thumb_func_start ContestEffect_BetterWhenLater
ContestEffect_BetterWhenLater: @ 0x080E57C0
	push {r4, r5, lr}
	ldr r1, _080E57E4
	ldr r3, [r1]
	ldr r0, [r3, #8]
	ldrb r2, [r0, #0x11]
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r5, r1, #0
	cmp r4, #0
	bne _080E57E8
	ldr r0, [r3, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0xa
	b _080E57F8
	.align 2, 0
_080E57E4: .4byte 0x02039BD4
_080E57E8:
	ldr r0, [r3, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
_080E57F8:
	strh r0, [r1, #2]
	cmp r4, #0
	bne _080E580C
	ldr r0, [r5]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x15
	bl SetContestantEffectStringID
	b _080E583C
_080E580C:
	cmp r4, #1
	bne _080E581E
	ldr r0, [r5]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x16
	bl SetContestantEffectStringID
	b _080E583C
_080E581E:
	cmp r4, #2
	bne _080E5830
	ldr r0, [r5]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x17
	bl SetContestantEffectStringID
	b _080E583C
_080E5830:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x18
	bl SetContestantEffectStringID
_080E583C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestEffect_BetterWhenLater

	thumb_func_start ContestEffect_QualityDependsOnTiming
ContestEffect_QualityDependsOnTiming: @ 0x080E5844
	push {r4, lr}
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	bhi _080E5874
	movs r4, #0xa
	ldr r0, _080E5870
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1a
	bl SetContestantEffectStringID
	b _080E58D8
	.align 2, 0
_080E5870: .4byte 0x02039BD4
_080E5874:
	cmp r0, #5
	bhi _080E5890
	movs r4, #0x14
	ldr r0, _080E588C
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1b
	bl SetContestantEffectStringID
	b _080E58D8
	.align 2, 0
_080E588C: .4byte 0x02039BD4
_080E5890:
	cmp r0, #7
	bhi _080E58AC
	movs r4, #0x28
	ldr r0, _080E58A8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1c
	bl SetContestantEffectStringID
	b _080E58D8
	.align 2, 0
_080E58A8: .4byte 0x02039BD4
_080E58AC:
	cmp r1, #8
	bhi _080E58C8
	movs r4, #0x3c
	ldr r0, _080E58C4
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1d
	bl SetContestantEffectStringID
	b _080E58D8
	.align 2, 0
_080E58C4: .4byte 0x02039BD4
_080E58C8:
	movs r4, #0x50
	ldr r0, _080E58F4
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1e
	bl SetContestantEffectStringID
_080E58D8:
	ldr r0, _080E58F4
	ldr r1, [r0]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strh r4, [r0, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E58F4: .4byte 0x02039BD4
	thumb_func_end ContestEffect_QualityDependsOnTiming

	thumb_func_start ContestEffect_BetterIfSameType
ContestEffect_BetterIfSameType: @ 0x080E58F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _080E597C
	ldr r0, [r2]
	ldr r3, [r0, #8]
	ldrb r0, [r3, #0x11]
	adds r0, r3, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r2
	cmp r1, #0
	beq _080E59D4
	mov r7, r8
	ldrb r6, [r3]
_080E591C:
	movs r2, #0
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	adds r5, r0, #0
	cmp r6, r1
	beq _080E5946
	ldr r4, _080E597C
_080E592A:
	lsls r0, r2, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r2, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #3
	bgt _080E5946
	ldr r0, [r4]
	ldr r0, [r0, #8]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _080E592A
_080E5946:
	ldr r0, [r7]
	lsls r3, r2, #0x18
	asrs r1, r3, #0x18
	ldr r2, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r1, [r2, #0xb]
	movs r0, #0x80
	ands r0, r1
	mov ip, r3
	cmp r0, #0
	bne _080E596C
	ldrb r1, [r2, #0xc]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _080E5980
_080E596C:
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r5, r1
	lsrs r4, r0, #0x18
	cmp r0, #0
	blt _080E59D4
	b _080E591C
	.align 2, 0
_080E597C: .4byte 0x02039BD4
_080E5980:
	mov r2, r8
	ldr r6, [r2]
	ldr r0, [r6, #8]
	ldrb r1, [r0, #0x11]
	ldr r4, [r6, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r5, r0, r4
	ldrh r0, [r5, #6]
	ldr r3, _080E59E0
	lsls r0, r0, #3
	adds r7, r0, r3
	ldrb r2, [r7, #1]
	lsls r2, r2, #0x1d
	mov r0, ip
	asrs r1, r0, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #6]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	cmp r2, r0
	bne _080E59D4
	ldr r1, _080E59E4
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	lsls r0, r0, #1
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	strh r0, [r5, #2]
	ldr r0, [r6, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1f
	bl SetContestantEffectStringID
_080E59D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E59E0: .4byte 0x08565FCC
_080E59E4: .4byte 0x08566AE4
	thumb_func_end ContestEffect_BetterIfSameType

	thumb_func_start ContestEffect_BetterIfDiffType
ContestEffect_BetterIfDiffType: @ 0x080E59E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080E5A74
	ldr r3, [r0]
	ldr r1, [r3, #8]
	ldrb r2, [r1, #0x11]
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sb, r0
	cmp r1, #0
	beq _080E5A88
	ldr r1, [r3, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r6, #0
	ldr r0, _080E5A78
	mov ip, r0
	movs r7, #0
_080E5A18:
	mov r1, sb
	ldr r4, [r1]
	ldr r0, [r4, #8]
	ldrb r2, [r0, #0x11]
	adds r1, r0, r2
	ldrb r1, [r1]
	subs r1, #1
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r1, r0
	bne _080E5A80
	mov r1, r8
	lsls r0, r1, #3
	mov r1, ip
	adds r5, r0, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #0x1d
	ldr r3, [r4, #4]
	adds r0, r7, r3
	ldrh r0, [r0, #6]
	lsls r0, r0, #3
	add r0, ip
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	cmp r1, r0
	beq _080E5A80
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _080E5A7C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #1
	ldrh r2, [r1, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	ldr r0, [r4, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x20
	bl SetContestantEffectStringID
	b _080E5A88
	.align 2, 0
_080E5A74: .4byte 0x02039BD4
_080E5A78: .4byte 0x08565FCC
_080E5A7C: .4byte 0x08566AE4
_080E5A80:
	adds r7, #0x1c
	adds r6, #1
	cmp r6, #3
	ble _080E5A18
_080E5A88:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_BetterIfDiffType

	thumb_func_start ContestEffect_AffectedByPrevAppeal
ContestEffect_AffectedByPrevAppeal: @ 0x080E5A94
	push {r4, r5, r6, r7, lr}
	ldr r0, _080E5AEC
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r1, [r0, #0x11]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E5B0A
	movs r5, #0
	movs r6, #0
_080E5AAA:
	ldr r0, _080E5AEC
	ldr r4, [r0]
	ldr r1, [r4, #8]
	ldrb r2, [r1, #0x11]
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, #1
	adds r1, r1, r5
	ldrb r1, [r1]
	cmp r0, r1
	bne _080E5B02
	ldr r1, [r4, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	adds r1, r6, r1
	movs r0, #2
	ldrsh r2, [r3, r0]
	movs r7, #2
	ldrsh r0, [r1, r7]
	cmp r2, r0
	ble _080E5AF0
	adds r0, r2, #0
	lsls r0, r0, #1
	strh r0, [r3, #2]
	ldr r0, [r4, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x21
	bl SetContestantEffectStringID
	b _080E5B02
	.align 2, 0
_080E5AEC: .4byte 0x02039BD4
_080E5AF0:
	cmp r2, r0
	bge _080E5B02
	movs r0, #0
	strh r0, [r3, #2]
	ldr r0, [r4, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x22
	bl SetContestantEffectStringID
_080E5B02:
	adds r6, #0x1c
	adds r5, #1
	cmp r5, #3
	ble _080E5AAA
_080E5B0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_AffectedByPrevAppeal

	thumb_func_start ContestEffect_ImproveConditionPreventNervousness
ContestEffect_ImproveConditionPreventNervousness: @ 0x080E5B10
	push {r4, lr}
	ldr r4, _080E5B60
	ldr r1, [r4]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r3, [r1, #0xd]
	movs r0, #0xd
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _080E5B64
	adds r0, r3, #0
	adds r0, #0xa
	strb r0, [r1, #0xd]
	ldr r1, [r4]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #0x10]
	movs r1, #0x31
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r0, #0x10]
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x23
	bl SetContestantEffectStringID
	b _080E5B6C
	.align 2, 0
_080E5B60: .4byte 0x02039BD4
_080E5B64:
	adds r0, r2, #0
	movs r1, #0x3a
	bl SetContestantEffectStringID
_080E5B6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestEffect_ImproveConditionPreventNervousness

	thumb_func_start ContestEffect_BetterWithGoodCondition
ContestEffect_BetterWithGoodCondition: @ 0x080E5B74
	push {lr}
	ldr r3, _080E5BB4
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #0x11]
	ldr r1, [r3]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080E5BB8
	adds r0, r2, #0
	movs r1, #0x24
	bl SetContestantEffectStringID
	b _080E5BC0
	.align 2, 0
_080E5BB4: .4byte 0x02039BD4
_080E5BB8:
	adds r0, r2, #0
	movs r1, #0x3b
	bl SetContestantEffectStringID
_080E5BC0:
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_BetterWithGoodCondition

	thumb_func_start ContestEffect_NextAppealEarlier
ContestEffect_NextAppealEarlier: @ 0x080E5BC4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _080E5C4C
	ldr r2, [r0]
	ldr r1, [r2]
	ldrb r1, [r1, #1]
	mov ip, r0
	cmp r1, #4
	bne _080E5BD8
	b _080E5CF4
_080E5BD8:
	movs r6, #0
	adds r4, r2, #0
_080E5BDC:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	mov r0, sp
	adds r3, r0, r1
	ldr r2, [r4, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x19]
	strb r0, [r3]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #3
	ble _080E5BDC
	mov r1, ip
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r6, #0
	mov r3, ip
	ldr r7, [r3]
_080E5C14:
	movs r5, #0
_080E5C16:
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	ldr r0, [r7, #8]
	ldrb r0, [r0, #0x11]
	cmp r2, r0
	beq _080E5C50
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	mov r0, sp
	adds r4, r0, r2
	ldrb r1, [r4]
	cmp r3, r1
	bne _080E5C50
	ldr r0, [r7, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #0x19]
	cmp r0, r1
	bne _080E5C50
	adds r0, r3, #1
	strb r0, [r4]
	b _080E5C60
	.align 2, 0
_080E5C4C: .4byte 0x02039BD4
_080E5C50:
	lsls r0, r5, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r5, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _080E5C16
_080E5C60:
	cmp r5, #4
	beq _080E5C74
	lsls r0, r6, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	lsrs r6, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _080E5C14
_080E5C74:
	mov r4, ip
	ldr r1, [r4]
	ldr r0, [r1, #8]
	ldrb r0, [r0, #0x11]
	mov r3, sp
	adds r2, r3, r0
	movs r0, #0
	strb r0, [r2]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #0x10]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0, #0x10]
	movs r6, #0
	mov r3, ip
_080E5CA2:
	ldr r0, [r3]
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	ldr r2, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r4, sp
	adds r2, r4, r1
	ldrb r2, [r2]
	strb r2, [r0, #0x19]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #3
	ble _080E5CA2
	mov r0, ip
	ldr r1, [r0]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #0x11]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #0x11]
	mov r1, ip
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x25
	bl SetContestantEffectStringID
_080E5CF4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_NextAppealEarlier

	thumb_func_start ContestEffect_NextAppealLater
ContestEffect_NextAppealLater: @ 0x080E5CFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _080E5D8C
	ldr r2, [r0]
	ldr r1, [r2]
	ldrb r1, [r1, #1]
	mov ip, r0
	cmp r1, #4
	bne _080E5D14
	b _080E5E34
_080E5D14:
	movs r6, #0
	adds r4, r2, #0
_080E5D18:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	mov r0, sp
	adds r3, r0, r1
	ldr r2, [r4, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x19]
	strb r0, [r3]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #3
	ble _080E5D18
	mov r1, ip
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r6, #3
	mov r3, ip
	ldr r7, [r3]
	movs r4, #1
	rsbs r4, r4, #0
	mov r8, r4
_080E5D56:
	movs r5, #0
_080E5D58:
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	ldr r0, [r7, #8]
	ldrb r0, [r0, #0x11]
	cmp r2, r0
	beq _080E5D90
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	mov r0, sp
	adds r4, r0, r2
	ldrb r1, [r4]
	cmp r3, r1
	bne _080E5D90
	ldr r0, [r7, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #0x19]
	cmp r0, r1
	bne _080E5D90
	subs r0, r3, #1
	strb r0, [r4]
	b _080E5DA0
	.align 2, 0
_080E5D8C: .4byte 0x02039BD4
_080E5D90:
	lsls r0, r5, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r5, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _080E5D58
_080E5DA0:
	cmp r5, #4
	beq _080E5DB4
	lsls r0, r6, #0x18
	movs r3, #0xff
	lsls r3, r3, #0x18
	adds r0, r0, r3
	lsrs r6, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bgt _080E5D56
_080E5DB4:
	mov r4, ip
	ldr r1, [r4]
	ldr r0, [r1, #8]
	ldrb r0, [r0, #0x11]
	mov r3, sp
	adds r2, r3, r0
	movs r0, #3
	strb r0, [r2]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #0x10]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0, #0x10]
	movs r6, #0
	mov r3, ip
_080E5DE2:
	ldr r0, [r3]
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	ldr r2, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r4, sp
	adds r2, r4, r1
	ldrb r2, [r2]
	strb r2, [r0, #0x19]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #3
	ble _080E5DE2
	mov r0, ip
	ldr r1, [r0]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #0x11]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	strb r1, [r0, #0x11]
	mov r1, ip
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x26
	bl SetContestantEffectStringID
_080E5E34:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_NextAppealLater

	thumb_func_start ContestEffect_HighlyAppealing
ContestEffect_HighlyAppealing: @ 0x080E5E40
	bx lr
	.align 2, 0
	thumb_func_end ContestEffect_HighlyAppealing

	thumb_func_start ContestEffect_ScrambleNextTurnOrder
ContestEffect_ScrambleNextTurnOrder: @ 0x080E5E44
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _080E5EC0
	ldr r1, [r0]
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	cmp r0, #4
	beq _080E5F48
	movs r6, #0
	add r5, sp, #4
	adds r4, r1, #0
	adds r7, r5, #0
_080E5E5C:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	mov r0, sp
	adds r3, r0, r1
	ldr r2, [r4, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x19]
	strb r0, [r3]
	adds r0, r7, r1
	strb r6, [r0]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #3
	ble _080E5E5C
	movs r6, #0
	adds r7, r5, #0
_080E5E86:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r6, #0x18
	asrs r2, r2, #0x18
	movs r1, #4
	subs r1, r1, r2
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0
_080E5EA0:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	adds r3, r7, r2
	ldrb r1, [r3]
	adds r5, r0, #0
	cmp r1, #0xff
	beq _080E5ECA
	cmp r4, #0
	bne _080E5EC4
	mov r1, sp
	adds r0, r1, r2
	strb r6, [r0]
	movs r0, #0xff
	strb r0, [r3]
	b _080E5ED8
	.align 2, 0
_080E5EC0: .4byte 0x02039BD4
_080E5EC4:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080E5ECA:
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r5, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _080E5EA0
_080E5ED8:
	lsls r0, r6, #0x18
	movs r6, #0x80
	lsls r6, r6, #0x11
	adds r0, r0, r6
	lsrs r6, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _080E5E86
	movs r6, #0
	ldr r5, _080E5F50
	adds r4, r5, #0
_080E5EEE:
	ldr r0, [r4]
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	ldr r1, [r0, #4]
	lsls r2, r3, #3
	subs r2, r2, r3
	lsls r2, r2, #2
	adds r1, r2, r1
	mov r6, sp
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1, #0x19]
	ldr r0, [r4]
	ldr r0, [r0, #4]
	adds r2, r2, r0
	ldrb r1, [r2, #0x10]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #0x10]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #3
	ble _080E5EEE
	ldr r1, [r5]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	movs r2, #3
	orrs r1, r2
	strb r1, [r0, #0x11]
	ldr r0, [r5]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x27
	bl SetContestantEffectStringID
_080E5F48:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E5F50: .4byte 0x02039BD4
	thumb_func_end ContestEffect_ScrambleNextTurnOrder

	thumb_func_start ContestEffect_ExciteAudienceInAnyContest
ContestEffect_ExciteAudienceInAnyContest: @ 0x080E5F54
	push {lr}
	ldr r3, _080E5F8C
	ldr r0, _080E5F90
	ldr r1, [r0]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrh r0, [r2, #6]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	ldr r1, _080E5F94
	lsrs r0, r0, #0x1d
	ldrh r1, [r1]
	cmp r0, r1
	beq _080E5F86
	ldrb r0, [r2, #0x11]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #0x11]
_080E5F86:
	pop {r0}
	bx r0
	.align 2, 0
_080E5F8C: .4byte 0x08565FCC
_080E5F90: .4byte 0x02039BD4
_080E5F94: .4byte 0x02039BCC
	thumb_func_end ContestEffect_ExciteAudienceInAnyContest

	thumb_func_start ContestEffect_BadlyStartleMonsWithGoodAppeals
ContestEffect_BadlyStartleMonsWithGoodAppeals: @ 0x080E5F98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	movs r4, #0
	ldr r5, _080E5FE0
	movs r6, #0
_080E5FA8:
	ldr r3, [r5]
	ldr r2, [r3, #8]
	ldrb r0, [r2, #0x11]
	adds r0, r2, r0
	adds r1, r2, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080E600A
	ldr r0, [r3, #4]
	adds r1, r6, r0
	movs r7, #2
	ldrsh r0, [r1, r7]
	cmp r0, #0
	ble _080E5FE4
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r2, #4]
	ldr r0, [r3, #8]
	movs r1, #4
	ldrsh r0, [r0, r1]
	bl RoundUp
	ldr r1, [r5]
	ldr r1, [r1, #8]
	strh r0, [r1, #4]
	b _080E5FE8
	.align 2, 0
_080E5FE0: .4byte 0x02039BD4
_080E5FE4:
	movs r0, #0xa
	strh r0, [r2, #4]
_080E5FE8:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	strb r4, [r0, #8]
	ldr r0, [r5]
	ldr r1, [r0, #8]
	movs r0, #0xff
	strb r0, [r1, #9]
	bl WasAtLeastOneOpponentJammed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E600A
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080E600A:
	adds r6, #0x1c
	adds r4, #1
	cmp r4, #3
	ble _080E5FA8
	mov r7, r8
	cmp r7, #0
	bne _080E6026
	ldr r0, _080E6040
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x36
	bl SetContestantEffectStringID2
_080E6026:
	ldr r0, _080E6040
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x30
	bl SetContestantEffectStringID
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E6040: .4byte 0x02039BD4
	thumb_func_end ContestEffect_BadlyStartleMonsWithGoodAppeals

	thumb_func_start ContestEffect_BetterWhenAudienceExcited
ContestEffect_BetterWhenAudienceExcited: @ 0x080E6044
	push {r4, lr}
	ldr r0, _080E6064
	ldr r1, [r0]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080E6068
	movs r4, #0xa
	ldr r0, [r1, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1a
	bl SetContestantEffectStringID
	b _080E60AA
	.align 2, 0
_080E6064: .4byte 0x02039BD4
_080E6068:
	cmp r0, #1
	bne _080E607A
	movs r4, #0x14
	ldr r0, [r1, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1b
	bl SetContestantEffectStringID
	b _080E60AA
_080E607A:
	cmp r0, #2
	bne _080E608C
	movs r4, #0x1e
	ldr r0, [r1, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1c
	bl SetContestantEffectStringID
	b _080E60AA
_080E608C:
	cmp r0, #3
	bne _080E609E
	movs r4, #0x32
	ldr r0, [r1, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1d
	bl SetContestantEffectStringID
	b _080E60AA
_080E609E:
	movs r4, #0x3c
	ldr r0, [r1, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x1e
	bl SetContestantEffectStringID
_080E60AA:
	ldr r0, _080E60C4
	ldr r1, [r0]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strh r4, [r0, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E60C4: .4byte 0x02039BD4
	thumb_func_end ContestEffect_BetterWhenAudienceExcited

	thumb_func_start ContestEffect_DontExciteAudience
ContestEffect_DontExciteAudience: @ 0x080E60C8
	push {r4, lr}
	ldr r4, _080E610C
	ldr r0, [r4]
	ldr r2, [r0, #0x10]
	ldrb r1, [r2, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080E6106
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, [r4]
	ldr r3, [r0, #0x10]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r3, #1]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x3d
	bl SetContestantEffectStringID
_080E6106:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E610C: .4byte 0x02039BD4
	thumb_func_end ContestEffect_DontExciteAudience

	thumb_func_start JamByMoveCategory
JamByMoveCategory: @ 0x080E6110
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r7, #0
	movs r4, #0
	ldr r6, _080E6154
	ldr r0, _080E6158
	mov sb, r0
	movs r5, #0
_080E612A:
	ldr r3, [r6]
	ldr r2, [r3, #8]
	ldrb r0, [r2, #0x11]
	adds r0, r2, r0
	adds r1, r2, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080E617A
	ldr r0, [r3, #4]
	adds r0, r5, r0
	ldrh r0, [r0, #6]
	lsls r0, r0, #3
	add r0, sb
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r8, r0
	bne _080E615C
	movs r0, #0x28
	b _080E615E
	.align 2, 0
_080E6154: .4byte 0x02039BD4
_080E6158: .4byte 0x08565FCC
_080E615C:
	movs r0, #0xa
_080E615E:
	strh r0, [r2, #4]
	ldr r0, [r6]
	ldr r0, [r0, #8]
	strb r4, [r0, #8]
	ldr r0, [r6]
	ldr r1, [r0, #8]
	movs r0, #0xff
	strb r0, [r1, #9]
	bl WasAtLeastOneOpponentJammed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E617A
	adds r7, #1
_080E617A:
	adds r5, #0x1c
	adds r4, #1
	cmp r4, #3
	ble _080E612A
	cmp r7, #0
	bne _080E6194
	ldr r0, _080E61A0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x11]
	movs r1, #0x36
	bl SetContestantEffectStringID2
_080E6194:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E61A0: .4byte 0x02039BD4
	thumb_func_end JamByMoveCategory

	thumb_func_start CanUnnerveContestant
CanUnnerveContestant: @ 0x080E61A4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _080E61D4
	ldr r0, [r2]
	ldr r0, [r0, #8]
	adds r0, #0xd
	adds r0, r0, r3
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, [r0, #4]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r1, [r2, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080E61D8
	adds r0, r3, #0
	movs r1, #0x2d
	b _080E61FE
	.align 2, 0
_080E61D4: .4byte 0x02039BD4
_080E61D8:
	ldrb r0, [r2, #0x12]
	cmp r0, #0
	bne _080E61F6
	ldrb r1, [r2, #0xb]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080E6202
	ldrb r1, [r2, #0xc]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080E6202
	movs r0, #1
	b _080E6204
_080E61F6:
	subs r0, #1
	strb r0, [r2, #0x12]
	adds r0, r3, #0
	movs r1, #0x2c
_080E61FE:
	bl SetContestantEffectStringID
_080E6202:
	movs r0, #0
_080E6204:
	pop {r1}
	bx r1
	thumb_func_end CanUnnerveContestant

	thumb_func_start WasAtLeastOneOpponentJammed
WasAtLeastOneOpponentJammed: @ 0x080E6208
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r7, #0
	ldr r4, _080E628C
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #8]
	cmp r0, #0xff
	beq _080E62EC
	mov r8, r4
_080E622A:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, #8]
	adds r0, #8
	adds r0, r0, r7
	ldrb r5, [r0]
	adds r6, r5, #0
	adds r0, r5, #0
	bl CanUnnerveContestant
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E62DA
	ldr r2, [r4]
	ldr r1, [r2, #8]
	ldrh r0, [r1, #4]
	strh r0, [r1, #6]
	ldr r1, [r2, #4]
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r4, r0, #2
	adds r1, r4, r1
	ldrb r1, [r1, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080E626A
	ldr r1, [r2, #8]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #1
	strh r0, [r1, #6]
_080E626A:
	mov r0, r8
	ldr r3, [r0]
	ldr r0, [r3, #4]
	adds r1, r4, r0
	ldrb r0, [r1, #0x10]
	movs r4, #1
	ands r4, r0
	cmp r4, #0
	beq _080E6290
	ldr r1, [r3, #8]
	movs r0, #0xa
	strh r0, [r1, #6]
	adds r0, r5, #0
	movs r1, #0x2f
	bl SetContestantEffectStringID
	b _080E62DA
	.align 2, 0
_080E628C: .4byte 0x02039BD4
_080E6290:
	ldr r2, [r3, #8]
	ldrb r1, [r1, #0xf]
	ldrh r0, [r2, #6]
	subs r0, r0, r1
	strh r0, [r2, #6]
	ldr r2, [r3, #8]
	ldrh r1, [r2, #6]
	movs r3, #6
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bgt _080E62B2
	strh r4, [r2, #6]
	adds r0, r5, #0
	movs r1, #0x2e
	bl SetContestantEffectStringID
	b _080E62DA
_080E62B2:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl JamContestant
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r1, [r0, #6]
	adds r0, r6, #0
	bl SetStartledString
	lsls r0, r6, #1
	mov r2, sp
	adds r1, r2, r0
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0, #8]
	ldrh r0, [r0, #6]
	strh r0, [r1]
_080E62DA:
	adds r7, #1
	ldr r4, _080E62FC
	ldr r0, [r4]
	ldr r0, [r0, #8]
	adds r0, #8
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080E622A
_080E62EC:
	movs r7, #0
	mov r1, sp
_080E62F0:
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080E6300
	movs r0, #1
	b _080E630A
	.align 2, 0
_080E62FC: .4byte 0x02039BD4
_080E6300:
	adds r1, #2
	adds r7, #1
	cmp r7, #3
	ble _080E62F0
	movs r0, #0
_080E630A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WasAtLeastOneOpponentJammed

	thumb_func_start JamContestant
JamContestant: @ 0x080E6318
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080E6348
	ldr r4, [r2]
	ldr r3, [r4, #4]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r3, r2, r3
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #2]
	ldr r0, [r4, #4]
	adds r2, r2, r0
	ldrb r0, [r2, #0xe]
	adds r1, r1, r0
	strb r1, [r2, #0xe]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6348: .4byte 0x02039BD4
	thumb_func_end JamContestant

	thumb_func_start RoundTowardsZero
RoundTowardsZero: @ 0x080E634C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	cmp r4, #0
	bge _080E635C
	rsbs r0, r4, #0
_080E635C:
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, #0
	bge _080E637A
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _080E6384
	adds r0, r4, #0
	subs r0, #0xa
	adds r0, r1, r0
	b _080E6380
_080E637A:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, r4, r0
_080E6380:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080E6384:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RoundTowardsZero

	thumb_func_start RoundUp
RoundUp: @ 0x080E6390
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	cmp r4, #0
	bge _080E63A0
	rsbs r0, r4, #0
_080E63A0:
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _080E63B8
	adds r0, r4, #0
	adds r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080E63B8:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RoundUp

