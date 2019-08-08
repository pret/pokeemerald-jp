.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AllocateBattleResources
AllocateBattleResources: @ 0x08056B38
	push {r4, r5, r6, lr}
	ldr r5, _08056C10
	ldr r6, _08056C14
	ldr r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ands r0, r1
	cmp r0, #0
	beq _08056B4E
	bl InitTrainerHillBattleStruct
_08056B4E:
	ldr r4, _08056C18
	movs r0, #0xa9
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r4]
	movs r0, #0x20
	bl AllocZeroed
	str r0, [r5]
	movs r0, #0xa0
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1]
	movs r0, #0x10
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, #4]
	movs r0, #0x24
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, #8]
	movs r0, #0x24
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, #0xc]
	movs r0, #0xc
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, #0x10]
	movs r0, #0x1c
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, #0x14]
	movs r0, #0x54
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, #0x18]
	movs r0, #0x24
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, #0x1c]
	ldr r4, _08056C1C
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	bl AllocZeroed
	str r0, [r4]
	ldr r4, _08056C20
	adds r0, r5, #0
	bl AllocZeroed
	str r0, [r4]
	ldr r4, _08056C24
	movs r0, #0x80
	lsls r0, r0, #6
	bl AllocZeroed
	str r0, [r4]
	ldr r4, _08056C28
	adds r0, r5, #0
	bl AllocZeroed
	str r0, [r4]
	ldr r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08056C0A
	ldr r0, _08056C2C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08056C30
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r0, _08056C34
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	bl CreateSecretBaseEnemyParty
_08056C0A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056C10: .4byte 0x0202414C
_08056C14: .4byte 0x02022C90
_08056C18: .4byte 0x02024140
_08056C1C: .4byte 0x02024144
_08056C20: .4byte 0x02024148
_08056C24: .4byte 0x02022D00
_08056C28: .4byte 0x02022D04
_08056C2C: .4byte 0x00004054
_08056C30: .4byte 0x03005AEC
_08056C34: .4byte 0x00001A9C
	thumb_func_end AllocateBattleResources

	thumb_func_start FreeBattleResources
FreeBattleResources: @ 0x08056C38
	push {r4, r5, r6, lr}
	ldr r0, _08056CE8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ands r0, r1
	cmp r0, #0
	beq _08056C4C
	bl FreeDataStruct
_08056C4C:
	ldr r6, _08056CEC
	ldr r0, [r6]
	cmp r0, #0
	beq _08056CE0
	ldr r4, _08056CF0
	ldr r0, [r4]
	bl Free
	movs r5, #0
	str r5, [r4]
	ldr r0, [r6]
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	str r5, [r0]
	ldr r0, [r0, #4]
	bl Free
	ldr r0, [r6]
	str r5, [r0, #4]
	ldr r0, [r0, #8]
	bl Free
	ldr r0, [r6]
	str r5, [r0, #8]
	ldr r0, [r0, #0xc]
	bl Free
	ldr r0, [r6]
	str r5, [r0, #0xc]
	ldr r0, [r0, #0x10]
	bl Free
	ldr r0, [r6]
	str r5, [r0, #0x10]
	ldr r0, [r0, #0x14]
	bl Free
	ldr r0, [r6]
	str r5, [r0, #0x14]
	ldr r0, [r0, #0x18]
	bl Free
	ldr r0, [r6]
	str r5, [r0, #0x18]
	ldr r0, [r0, #0x1c]
	bl Free
	ldr r0, [r6]
	str r5, [r0, #0x1c]
	bl Free
	str r5, [r6]
	ldr r4, _08056CF4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _08056CF8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _08056CFC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _08056D00
	ldr r0, [r4]
	bl Free
	str r5, [r4]
_08056CE0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056CE8: .4byte 0x02022C90
_08056CEC: .4byte 0x0202414C
_08056CF0: .4byte 0x02024140
_08056CF4: .4byte 0x02024144
_08056CF8: .4byte 0x02024148
_08056CFC: .4byte 0x02022D00
_08056D00: .4byte 0x02022D04
	thumb_func_end FreeBattleResources

	thumb_func_start AdjustFriendshipOnBattleFaint
AdjustFriendshipOnBattleFaint: @ 0x08056D04
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08056D48
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08056D50
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #3
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _08056D4C
	movs r0, #0x58
	adds r1, r3, #0
	muls r1, r0, r1
	adds r1, r1, r2
	adds r1, #0x2a
	muls r0, r4, r0
	adds r0, r0, r2
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08056D5A
	adds r4, r3, #0
	b _08056D5A
	.align 2, 0
_08056D48: .4byte 0x02022C90
_08056D4C: .4byte 0x02023D28
_08056D50:
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08056D5A:
	ldr r2, _08056D9C
	movs r1, #0x58
	adds r0, r4, #0
	muls r0, r1, r0
	adds r0, r0, r2
	adds r3, r0, #0
	adds r3, #0x2a
	adds r0, r5, #0
	muls r0, r1, r0
	adds r0, r0, r2
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r0, [r3]
	ldrb r2, [r1]
	cmp r0, r2
	bls _08056DC8
	ldrb r1, [r1]
	subs r0, r0, r1
	cmp r0, #0x1d
	ble _08056DA8
	ldr r1, _08056DA0
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08056DA4
	adds r0, r0, r1
	movs r1, #8
	bl AdjustFriendship
	b _08056DDE
	.align 2, 0
_08056D9C: .4byte 0x02023D28
_08056DA0: .4byte 0x02023D12
_08056DA4: .4byte 0x02024190
_08056DA8:
	ldr r1, _08056DC0
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08056DC4
	adds r0, r0, r1
	movs r1, #6
	bl AdjustFriendship
	b _08056DDE
	.align 2, 0
_08056DC0: .4byte 0x02023D12
_08056DC4: .4byte 0x02024190
_08056DC8:
	ldr r1, _08056DE4
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08056DE8
	adds r0, r0, r1
	movs r1, #6
	bl AdjustFriendship
_08056DDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056DE4: .4byte 0x02023D12
_08056DE8: .4byte 0x02024190
	thumb_func_end AdjustFriendshipOnBattleFaint

	thumb_func_start sub_08056DEC
sub_08056DEC: @ 0x08056DEC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08056E58
	movs r2, #0
	ldr r6, _08056E60
	lsls r3, r4, #1
	ldr r5, _08056E64
	ldr r4, _08056E68
_08056E0E:
	adds r0, r2, r5
	ldr r1, [r4]
	adds r1, r2, r1
	adds r1, #0x60
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #2
	ble _08056E0E
	adds r0, r3, r6
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	bl pokemon_order_func
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_081B8C50
	movs r2, #0
	ldr r4, _08056E68
	ldr r3, _08056E64
_08056E46:
	ldr r0, [r4]
	adds r0, r2, r0
	adds r0, #0x60
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #2
	ble _08056E46
_08056E58:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056E60: .4byte 0x02023D12
_08056E64: .4byte 0x0203CBCC
_08056E68: .4byte 0x02024140
	thumb_func_end sub_08056DEC

	thumb_func_start sub_08056E6C
sub_08056E6C: @ 0x08056E6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r0, #0
	mov r8, r0
	ldr r1, _08056E88
	mov sl, r1
	b _08056E94
	.align 2, 0
_08056E88: .4byte 0x02023FD6
_08056E8C:
	mov r2, r8
	cmp r2, #0
	beq _08056E94
	b _08057016
_08056E94:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #1
	bne _08056E9E
	b _08056FA0
_08056E9E:
	cmp r0, #1
	ble _08056EA4
	b _0805700C
_08056EA4:
	cmp r0, #0
	beq _08056EAA
	b _0805700C
_08056EAA:
	ldr r6, _08056EFC
	movs r0, #0x58
	mov r5, sb
	muls r5, r0, r5
	adds r0, r6, #0
	adds r0, #0x4c
	adds r4, r5, r0
	ldr r0, [r4]
	movs r7, #7
	ands r0, r7
	cmp r0, #0
	beq _08056F82
	mov r0, sb
	bl UproarWakeUpCheck
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08056F0C
	ldr r0, [r4]
	movs r1, #8
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	adds r2, r6, #0
	adds r2, #0x50
	adds r2, r5, r2
	ldr r0, [r2]
	ldr r1, _08056F00
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	movs r0, #1
	mov r2, sl
	strb r0, [r2, #5]
	ldr r1, _08056F04
	ldr r0, _08056F08
	str r0, [r1]
	movs r0, #2
	mov r8, r0
	b _08056F82
	.align 2, 0
_08056EFC: .4byte 0x02023D28
_08056F00: .4byte 0xF7FFFFFF
_08056F04: .4byte 0x02023EB8
_08056F08: .4byte 0x082897A8
_08056F0C:
	adds r0, r5, r6
	adds r0, #0x20
	ldrb r0, [r0]
	movs r2, #1
	cmp r0, #0x30
	bne _08056F1A
	movs r2, #2
_08056F1A:
	ldr r1, [r4]
	adds r0, r1, #0
	ands r0, r7
	cmp r0, r2
	bhs _08056F2E
	movs r0, #8
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4]
	b _08056F32
_08056F2E:
	subs r0, r1, r2
	str r0, [r4]
_08056F32:
	ldr r2, _08056F58
	movs r0, #0x58
	mov r1, sb
	muls r1, r0, r1
	adds r0, r2, #0
	adds r0, #0x4c
	adds r0, r1, r0
	ldr r4, [r0]
	movs r0, #7
	ands r4, r0
	cmp r4, #0
	beq _08056F64
	ldr r1, _08056F5C
	ldr r0, _08056F60
	str r0, [r1]
	movs r1, #2
	mov r8, r1
	b _08056F82
	.align 2, 0
_08056F58: .4byte 0x02023D28
_08056F5C: .4byte 0x02023EB8
_08056F60: .4byte 0x0828979B
_08056F64:
	adds r2, #0x50
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r1, _08056F90
	ands r0, r1
	str r0, [r2]
	bl BattleScriptPushCursor
	ldr r0, _08056F94
	strb r4, [r0, #5]
	ldr r1, _08056F98
	ldr r0, _08056F9C
	str r0, [r1]
	movs r2, #2
	mov r8, r2
_08056F82:
	ldr r1, _08056F94
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov sl, r1
	b _0805700C
	.align 2, 0
_08056F90: .4byte 0xF7FFFFFF
_08056F94: .4byte 0x02023FD6
_08056F98: .4byte 0x02023EB8
_08056F9C: .4byte 0x082897A8
_08056FA0:
	ldr r1, _08056FD8
	movs r0, #0x58
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, #0x4c
	adds r4, r0, r1
	ldr r0, [r4]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08057004
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08056FE4
	ldr r1, _08056FDC
	ldr r0, _08056FE0
	str r0, [r1]
	b _08056FFC
	.align 2, 0
_08056FD8: .4byte 0x02023D28
_08056FDC: .4byte 0x02023EB8
_08056FE0: .4byte 0x082897F2
_08056FE4:
	ldr r0, [r4]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	bl BattleScriptPushCursor
	ldr r1, _08057054
	ldr r0, _08057058
	str r0, [r1]
	mov r0, sl
	strb r5, [r0, #5]
_08056FFC:
	movs r1, #2
	mov r8, r1
	ldr r2, _0805705C
	mov sl, r2
_08057004:
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0805700C:
	mov r2, sl
	ldrb r0, [r2]
	cmp r0, #2
	beq _08057016
	b _08056E8C
_08057016:
	mov r0, r8
	cmp r0, #2
	bne _08057040
	ldr r4, _08057060
	mov r1, sb
	strb r1, [r4]
	ldrb r1, [r4]
	movs r0, #0x58
	muls r0, r1, r0
	ldr r1, _08057064
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #0x28
	movs r2, #0
	movs r3, #4
	bl BtlController_EmitSetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_08057040:
	mov r0, r8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08057054: .4byte 0x02023EB8
_08057058: .4byte 0x082897FF
_0805705C: .4byte 0x02023FD6
_08057060: .4byte 0x02023D08
_08057064: .4byte 0x02023D74
	thumb_func_end sub_08056E6C

