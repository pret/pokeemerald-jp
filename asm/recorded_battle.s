.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08184C50
sub_08184C50: @ 0x08184C50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	ldr r0, _08184CDC
	mov r1, ip
	strb r1, [r0]
	ldr r1, _08184CE0
	movs r0, #0
	strb r0, [r1]
	movs r2, #0
	movs r7, #0
	ldr r3, _08184CE4
	mov sl, r3
	ldr r6, _08184CE8
	mov sb, r6
	ldr r0, _08184CEC
	mov r8, r0
_08184C7C:
	lsls r0, r2, #1
	mov r3, sb
	adds r1, r0, r3
	strh r7, [r1]
	ldr r6, _08184CF0
	adds r1, r0, r6
	strh r7, [r1]
	ldr r1, _08184CF4
	adds r0, r0, r1
	strh r7, [r0]
	adds r4, r2, #1
	mov r3, ip
	cmp r3, #1
	bne _08184CC8
	ldr r5, _08184CF8
	movs r3, #0xff
	movs r1, #0xa6
	lsls r1, r1, #2
	adds r0, r2, #0
	muls r0, r1, r0
	mov r6, r8
	adds r2, r0, r6
_08184CA8:
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	adds r2, #1
	subs r1, #1
	cmp r1, #0
	bne _08184CA8
	ldr r0, [r5]
	ldr r1, _08184CFC
	str r0, [r1]
	ldr r3, _08184D00
	ldr r0, [r3]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0xc]
	mov r6, sl
	str r0, [r6]
_08184CC8:
	adds r2, r4, #0
	cmp r2, #3
	ble _08184C7C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08184CDC: .4byte 0x0203C478
_08184CE0: .4byte 0x0203C99C
_08184CE4: .4byte 0x0203C488
_08184CE8: .4byte 0x0203C460
_08184CEC: .4byte 0x0203BA00
_08184CF0: .4byte 0x0203C468
_08184CF4: .4byte 0x0203C470
_08184CF8: .4byte 0x02022C90
_08184CFC: .4byte 0x0203C484
_08184D00: .4byte 0x0202414C
	thumb_func_end sub_08184C50

	thumb_func_start sub_08184D04
sub_08184D04: @ 0x08184D04
	push {r4, r5, r6, r7, lr}
	ldr r0, _08184D2C
	ldrb r0, [r0]
	cmp r0, #1
	bne _08184D44
	ldr r1, _08184D30
	ldr r0, _08184D34
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _08184D38
	ldr r0, _08184D3C
	bl VarGet
	strb r0, [r4]
	ldr r4, _08184D40
	bl GetFronterBrainSymbol
	strb r0, [r4]
	b _08184D50
	.align 2, 0
_08184D2C: .4byte 0x0203C478
_08184D30: .4byte 0x0203B9F8
_08184D34: .4byte 0x03005AE0
_08184D38: .4byte 0x0203C47A
_08184D3C: .4byte 0x000040CF
_08184D40: .4byte 0x0203C47B
_08184D44:
	cmp r0, #2
	bne _08184D50
	ldr r0, _08184DB4
	ldr r1, _08184DB8
	ldr r1, [r1]
	str r1, [r0]
_08184D50:
	ldr r0, _08184DBC
	ldr r5, [r0]
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _08184DCC
	bl GetMultiplayerId
	ldr r1, _08184DC0
	strb r0, [r1]
	movs r5, #0
	ldr r7, _08184DC4
	ldr r6, _08184DC8
_08184D6A:
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r3, r4, r7
	lsls r2, r5, #3
	subs r2, r2, r5
	lsls r2, r2, #2
	adds r0, r6, #4
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r3]
	adds r1, r2, r6
	ldrb r0, [r1, #0x13]
	strb r0, [r3, #0xc]
	ldrh r0, [r1, #0x18]
	strh r0, [r3, #0xe]
	ldrh r0, [r1, #0x1a]
	strh r0, [r3, #0x10]
	adds r3, r5, #1
	adds r0, r6, #0
	adds r0, #8
	adds r2, r2, r0
	adds r0, r7, #4
	adds r4, r4, r0
	movs r1, #7
_08184D9C:
	ldrb r0, [r2]
	strb r0, [r4]
	adds r2, #1
	adds r4, #1
	subs r1, #1
	cmp r1, #0
	bge _08184D9C
	adds r5, r3, #0
	cmp r5, #3
	ble _08184D6A
	b _08184E08
	.align 2, 0
_08184DB4: .4byte 0x03005AE0
_08184DB8: .4byte 0x0203B9F8
_08184DBC: .4byte 0x02022C90
_08184DC0: .4byte 0x0203C480
_08184DC4: .4byte 0x0203C94C
_08184DC8: .4byte 0x020226A0
_08184DCC:
	ldr r3, _08184E10
	ldr r4, _08184E14
	ldr r2, [r4]
	ldrb r1, [r2, #0xa]
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #0xc]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #0xd]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	ldrb r0, [r2, #8]
	strb r0, [r3, #0xc]
	strh r5, [r3, #0xe]
	ldr r0, _08184E18
	ldrb r0, [r0]
	strh r0, [r3, #0x10]
	movs r5, #0
	adds r3, #4
_08184DF8:
	adds r0, r5, r3
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r5, #1
	cmp r5, #7
	ble _08184DF8
_08184E08:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08184E10: .4byte 0x0203C94C
_08184E14: .4byte 0x03005AF0
_08184E18: .4byte 0x0829BDA5
	thumb_func_end sub_08184D04

	thumb_func_start RecordedBattle_SetBattlerAction
RecordedBattle_SetBattlerAction: @ 0x08184E1C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r1, _08184E58
	lsls r0, r5, #1
	adds r4, r0, r1
	ldrh r2, [r4]
	adds r3, r2, #0
	ldr r0, _08184E5C
	cmp r3, r0
	bhi _08184E50
	ldr r0, _08184E60
	ldrb r0, [r0]
	cmp r0, #2
	beq _08184E50
	ldr r1, _08184E64
	adds r0, r2, #1
	strh r0, [r4]
	movs r0, #0xa6
	lsls r0, r0, #2
	muls r0, r5, r0
	adds r0, r3, r0
	adds r0, r0, r1
	strb r6, [r0]
_08184E50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08184E58: .4byte 0x0203C460
_08184E5C: .4byte 0x00000297
_08184E60: .4byte 0x0203C478
_08184E64: .4byte 0x0203BA00
	thumb_func_end RecordedBattle_SetBattlerAction

	thumb_func_start RecordedBattle_ClearBattlerAction
RecordedBattle_ClearBattlerAction: @ 0x08184E68
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	cmp r3, r4
	bge _08184EA6
	ldr r0, _08184EAC
	lsls r1, r5, #1
	adds r2, r1, r0
	ldr r7, _08184EB0
	movs r0, #0xa6
	lsls r0, r0, #2
	muls r5, r0, r5
	movs r6, #0xff
_08184E88:
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	ldrh r1, [r2]
	adds r1, r1, r5
	adds r1, r1, r7
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	ldrh r0, [r2]
	cmp r0, #0
	beq _08184EA6
	adds r3, #1
	cmp r3, r4
	blt _08184E88
_08184EA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08184EAC: .4byte 0x0203C460
_08184EB0: .4byte 0x0203BA00
	thumb_func_end RecordedBattle_ClearBattlerAction

	thumb_func_start RecordedBattle_GetBattlerAction
RecordedBattle_GetBattlerAction: @ 0x08184EB4
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _08184F04
	lsls r0, r3, #1
	adds r2, r0, r1
	ldrh r1, [r2]
	ldr r0, _08184F08
	cmp r1, r0
	bhi _08184EDA
	ldr r4, _08184F0C
	adds r0, #1
	muls r3, r0, r3
	adds r0, r1, r3
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08184F1C
_08184EDA:
	ldr r2, _08184F10
	ldr r1, _08184F14
	movs r0, #5
	strb r0, [r1]
	movs r0, #5
	strh r0, [r2]
	bl ResetPaletteFadeControl
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _08184F18
	bl SetMainCallback2
	movs r0, #0xff
	b _08184F26
	.align 2, 0
_08184F04: .4byte 0x0203C460
_08184F08: .4byte 0x00000297
_08184F0C: .4byte 0x0203BA00
_08184F10: .4byte 0x02037290
_08184F14: .4byte 0x02023FDE
_08184F18: .4byte 0x080381C1
_08184F1C:
	adds r0, r1, #1
	strh r0, [r2]
	adds r0, r1, r3
	adds r0, r0, r4
	ldrb r0, [r0]
_08184F26:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RecordedBattle_GetBattlerAction

	thumb_func_start GetRecordedBattleApprenticeId
GetRecordedBattleApprenticeId: @ 0x08184F30
	ldr r0, _08184F38
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08184F38: .4byte 0x0203C478
	thumb_func_end GetRecordedBattleApprenticeId

	thumb_func_start sub_08184F3C
sub_08184F3C: @ 0x08184F3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	movs r7, #0
	movs r0, #0
	mov ip, r0
_08184F50:
	mov r1, ip
	lsls r3, r1, #1
	ldr r0, _08184FFC
	adds r5, r3, r0
	ldr r1, _08185000
	adds r6, r3, r1
	ldrh r0, [r5]
	mov sb, r3
	mov r1, ip
	adds r1, #1
	str r1, [sp]
	ldrh r1, [r6]
	cmp r0, r1
	beq _08184FDE
	adds r1, r7, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r2, r7, #0
	add r1, r8
	mov r0, ip
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	add r2, r8
	ldrb r0, [r5]
	ldrb r1, [r6]
	subs r0, r0, r1
	strb r0, [r2]
	movs r4, #0
	ldrh r0, [r5]
	ldrh r1, [r6]
	subs r0, r0, r1
	cmp r4, r0
	bge _08184FD2
	ldr r1, _08185004
	mov sl, r1
	ldr r6, _08185000
	movs r0, #0xa6
	lsls r0, r0, #2
	mov r5, ip
	muls r5, r0, r5
_08184FA6:
	adds r1, r7, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	add r1, r8
	adds r2, r3, r6
	ldrh r0, [r2]
	adds r0, r0, r4
	adds r0, r0, r5
	add r0, sl
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08184FFC
	adds r0, r3, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	subs r1, r1, r0
	cmp r4, r1
	blt _08184FA6
_08184FD2:
	ldr r0, _08185000
	add r0, sb
	ldr r1, _08184FFC
	add r1, sb
	ldrh r1, [r1]
	strh r1, [r0]
_08184FDE:
	ldr r1, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #3
	bls _08184F50
	adds r0, r7, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08184FFC: .4byte 0x0203C460
_08185000: .4byte 0x0203C468
_08185004: .4byte 0x0203BA00
	thumb_func_end sub_08184F3C

	thumb_func_start sub_08185008
sub_08185008: @ 0x08185008
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	movs r1, #2
	mov r0, sp
	strb r1, [r0]
	ldr r0, _08185028
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _081850BE
	movs r5, #0
	ldr r4, _0818502C
	b _0818503A
	.align 2, 0
_08185028: .4byte 0x02022C90
_0818502C: .4byte 0x020226A0
_08185030:
	ldrb r0, [r4]
	cmp r0, #3
	bne _081850BE
	adds r4, #0x1c
	adds r5, #1
_0818503A:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	blt _08185030
	ldr r0, _081850CC
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _081850BE
	ldrb r0, [r7]
	mov r4, sp
	adds r4, #1
	strb r0, [r4]
	ldrb r0, [r4]
	mov r8, r4
	cmp r0, #0
	beq _081850BE
_08185062:
	adds r0, r7, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_081850D8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r7, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_081850D8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _081850B6
	ldr r3, _081850D0
	ldr r0, _081850D4
	lsls r1, r6, #1
	adds r4, r1, r0
	adds r5, r2, #0
	movs r0, #0xa6
	lsls r0, r0, #2
	muls r6, r0, r6
_08185092:
	adds r0, r7, #0
	mov r1, sp
	mov r2, r8
	str r3, [sp, #4]
	bl sub_081850D8
	ldrh r1, [r4]
	adds r2, r1, #1
	strh r2, [r4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r1, r1, r6
	ldr r3, [sp, #4]
	adds r1, r1, r3
	strb r0, [r1]
	subs r5, #1
	cmp r5, #0
	bne _08185092
_081850B6:
	mov r4, r8
	ldrb r0, [r4]
	cmp r0, #0
	bne _08185062
_081850BE:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081850CC: .4byte 0x02022C90
_081850D0: .4byte 0x0203BA00
_081850D4: .4byte 0x0203C470
	thumb_func_end sub_08185008

	thumb_func_start sub_081850D8
sub_081850D8: @ 0x081850D8
	ldrb r3, [r2]
	subs r3, #1
	strb r3, [r2]
	ldrb r2, [r1]
	adds r3, r2, #1
	strb r3, [r1]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r0, r2
	ldrb r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end sub_081850D8

	thumb_func_start CanCopyRecordedBattleSaveData
CanCopyRecordedBattleSaveData: @ 0x081850F0
	push {r4, r5, lr}
	movs r0, #0xf8
	lsls r0, r0, #4
	bl AllocZeroed
	adds r4, r0, #0
	bl CopyRecordedBattleFromSave
	adds r5, r0, #0
	adds r0, r4, #0
	bl Free
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CanCopyRecordedBattleSaveData

	thumb_func_start IsRecordedBattleSaveValid
IsRecordedBattleSaveValid: @ 0x08185110
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0818513C
	adds r0, r5, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08185148
	ldr r0, _08185140
	ands r1, r0
	cmp r1, #0
	bne _08185148
	ldr r4, _08185144
	adds r0, r5, #0
	adds r1, r4, #0
	bl CalcByteArraySum
	adds r4, r5, r4
	ldr r1, [r4]
	cmp r0, r1
	bne _08185148
	movs r0, #1
	b _0818514A
	.align 2, 0
_0818513C: .4byte 0x000004EC
_08185140: .4byte 0x7D007E92
_08185144: .4byte 0x00000F7C
_08185148:
	movs r0, #0
_0818514A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsRecordedBattleSaveValid

	thumb_func_start RecordedBattleToSave
RecordedBattleToSave: @ 0x08185150
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r5, #0
	movs r1, #0
	bl memset
	movs r2, #0xf8
	lsls r2, r2, #4
	adds r0, r5, #0
	adds r1, r4, #0
	bl memcpy
	ldr r4, _0818518C
	adds r0, r5, #0
	adds r1, r4, #0
	bl CalcByteArraySum
	adds r4, r5, r4
	str r0, [r4]
	movs r0, #0x1f
	adds r1, r5, #0
	bl TryWriteSpecialSaveSection
	cmp r0, #1
	bne _08185190
	movs r0, #1
	b _08185192
	.align 2, 0
_0818518C: .4byte 0x00000F7C
_08185190:
	movs r0, #0
_08185192:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end RecordedBattleToSave

	thumb_func_start MoveRecordedBattleToSaveData
MoveRecordedBattleToSaveData: @ 0x08185198
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0xf8
	lsls r0, r0, #4
	bl AllocZeroed
	adds r7, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	bl AllocZeroed
	str r0, [sp]
	movs r6, #0
_081851BE:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	adds r5, r7, r4
	ldr r1, _08185290
	adds r1, r4, r1
	adds r0, r5, #0
	movs r2, #0x64
	bl memcpy
	movs r1, #0x96
	lsls r1, r1, #2
	adds r5, r5, r1
	ldr r0, _08185294
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x64
	bl memcpy
	adds r6, #1
	cmp r6, #5
	ble _081851BE
	movs r6, #0
	ldr r2, _08185298
	mov sl, r2
	movs r3, #0x9a
	lsls r3, r3, #3
	adds r3, r7, r3
	str r3, [sp, #8]
	ldr r5, _0818529C
	mov r8, r6
	mov ip, r6
	movs r0, #0x96
	lsls r0, r0, #3
	adds r0, r0, r7
	mov sb, r0
	ldr r1, _081852A0
	adds r4, r7, r1
_0818520C:
	lsls r1, r6, #3
	ldr r0, _0818529C
	adds r0, #4
	mov r3, r8
	adds r2, r3, r0
	add r1, sb
	movs r3, #7
_0818521A:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0818521A
	ldr r0, [sp, #8]
	adds r1, r0, r6
	ldrb r0, [r5, #0xc]
	strb r0, [r1]
	ldrh r0, [r5, #0x10]
	strb r0, [r4]
	ldrh r0, [r5, #0xe]
	strb r0, [r4, #0xc]
	ldr r1, _081852A4
	adds r0, r7, r1
	add r0, ip
	ldr r1, [r5]
	str r1, [r0]
	adds r5, #0x14
	movs r2, #0x14
	add r8, r2
	movs r3, #4
	add ip, r3
	adds r4, #1
	adds r6, #1
	cmp r6, #3
	ble _0818520C
	movs r5, #0x9d
	lsls r5, r5, #3
	adds r1, r7, r5
	ldr r2, _081852A8
	ldr r0, [r2]
	str r0, [r1]
	ldr r3, _081852AC
	ldr r2, [r3]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08185338
	adds r5, #4
	adds r3, r7, r5
	movs r1, #0x23
	rsbs r1, r1, #0
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #0x12
	orrs r1, r0
	str r1, [r3]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _081852B0
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0818533E
	.align 2, 0
_08185290: .4byte 0x0203C48C
_08185294: .4byte 0x0203C6E4
_08185298: .4byte 0x03005AF0
_0818529C: .4byte 0x0203C94C
_081852A0: .4byte 0x000004E4
_081852A4: .4byte 0x000004D4
_081852A8: .4byte 0x0203B9F8
_081852AC: .4byte 0x0203C484
_081852B0:
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	beq _0818533E
	ldr r1, _081852CC
	ldrh r0, [r1, #0xe]
	cmp r0, #1
	beq _08185304
	cmp r0, #1
	bgt _081852D0
	cmp r0, #0
	beq _081852DA
	b _0818533E
	.align 2, 0
_081852CC: .4byte 0x0203C94C
_081852D0:
	cmp r0, #2
	beq _081852DA
	cmp r0, #3
	beq _08185304
	b _0818533E
_081852DA:
	ldr r2, _081852F8
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _081852FC
	adds r0, r0, r3
	ldrh r1, [r0, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0818533E
	ldr r5, _08185300
	adds r0, r7, r5
	b _08185320
	.align 2, 0
_081852F8: .4byte 0x0203C480
_081852FC: .4byte 0x0203C94C
_08185300: .4byte 0x000004EC
_08185304:
	ldr r0, _0818532C
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08185330
	adds r0, r0, r1
	ldrh r1, [r0, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0818533E
	ldr r2, _08185334
	adds r0, r7, r2
_08185320:
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #0x18
	orrs r1, r2
	str r1, [r0]
	b _0818533E
	.align 2, 0
_0818532C: .4byte 0x0203C480
_08185330: .4byte 0x0203C94C
_08185334: .4byte 0x000004EC
_08185338:
	ldr r3, _0818546C
	adds r0, r7, r3
	str r2, [r0]
_0818533E:
	ldr r5, _08185470
	ldrh r1, [r5]
	ldr r2, _08185474
	adds r0, r7, r2
	strh r1, [r0]
	ldr r3, _08185478
	ldrh r1, [r3]
	ldr r5, _0818547C
	adds r0, r7, r5
	strh r1, [r0]
	ldr r0, _08185480
	ldrh r1, [r0]
	adds r2, #4
	adds r0, r7, r2
	strh r1, [r0]
	ldr r3, _08185484
	ldrb r1, [r3]
	adds r5, #4
	adds r0, r7, r5
	strh r1, [r0]
	mov r1, sl
	ldr r0, [r1]
	ldr r2, _08185488
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	ldr r3, _0818548C
	adds r1, r7, r3
	strb r0, [r1]
	ldr r5, _08185490
	ldrb r1, [r5]
	ldr r2, _08185494
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, _08185498
	ldrb r1, [r3]
	ldr r5, _0818549C
	adds r0, r7, r5
	strb r1, [r0]
	mov r1, sl
	ldr r0, [r1]
	ldrb r1, [r0, #0x15]
	lsls r1, r1, #0x1d
	adds r2, #2
	adds r3, r7, r2
	lsrs r1, r1, #0x1f
	ldrb r2, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r5, sl
	ldr r1, [r5]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1c
	movs r2, #0xf
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r1, r7, r0
	ldr r2, _081854A0
	ldr r0, [r2]
	str r0, [r1]
	ldr r3, _081854A4
	adds r1, r3, #0
	ldr r5, _08185470
	ldrh r5, [r5]
	adds r0, r1, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x63
	bls _081853DC
	b _08185500
_081853DC:
	movs r6, #0
	ldr r0, _081854A8
	adds r3, r7, r0
	mov sb, sl
	ldr r1, _08185470
	mov ip, r1
	ldr r2, _081854A4
	mov r8, r2
	ldr r4, _081854AC
_081853EE:
	adds r2, r3, r6
	mov r5, sb
	ldr r1, [r5]
	mov r5, ip
	ldrh r0, [r5]
	add r0, r8
	movs r5, #0xec
	muls r0, r5, r0
	adds r0, r6, r0
	adds r1, r1, r4
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	adds r6, #1
	cmp r6, #7
	ble _081853EE
	mov r0, sl
	ldr r2, [r0]
	ldr r1, _08185470
	ldrh r0, [r1]
	ldr r3, _081854A4
	adds r0, r0, r3
	movs r1, #0xec
	muls r0, r1, r0
	adds r2, r2, r0
	ldr r5, _081854B0
	adds r2, r2, r5
	ldrb r1, [r2]
	ldr r2, _081854B4
	adds r0, r7, r2
	strb r1, [r0]
	ldr r5, _081854B8
	ldrb r0, [r5]
	cmp r0, #1
	bne _081854C0
	movs r6, #0
	ldr r0, _081854BC
	adds r4, r7, r0
	mov sb, sl
	ldr r1, _08185470
	mov r8, r1
	adds r5, r3, #0
_08185442:
	lsls r3, r6, #1
	mov r0, sb
	ldr r2, [r0]
	mov r1, r8
	ldrh r0, [r1]
	adds r0, r0, r5
	movs r1, #0xec
	muls r0, r1, r0
	adds r3, r3, r0
	movs r0, #0xec
	lsls r0, r0, #3
	adds r2, r2, r0
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #5
	ble _08185442
	b _0818565A
	.align 2, 0
_0818546C: .4byte 0x000004EC
_08185470: .4byte 0x0203886A
_08185474: .4byte 0x000004F4
_08185478: .4byte 0x0203886C
_0818547C: .4byte 0x000004F6
_08185480: .4byte 0x0203886E
_08185484: .4byte 0x0203C480
_08185488: .4byte 0x00000CA9
_0818548C: .4byte 0x000004FC
_08185490: .4byte 0x0203C47A
_08185494: .4byte 0x000004FD
_08185498: .4byte 0x0203C47B
_0818549C: .4byte 0x000004FE
_081854A0: .4byte 0x0203C488
_081854A4: .4byte 0xFFFFFED4
_081854A8: .4byte 0x00000504
_081854AC: .4byte 0x0000073C
_081854B0: .4byte 0x00000739
_081854B4: .4byte 0x0000050C
_081854B8: .4byte 0x0203C9B4
_081854BC: .4byte 0x0000050E
_081854C0:
	movs r6, #0
	ldr r1, _081854F4
	adds r4, r7, r1
	mov sb, sl
	ldr r2, _081854F8
	mov r8, r2
	adds r5, r3, #0
_081854CE:
	lsls r3, r6, #1
	mov r0, sb
	ldr r2, [r0]
	mov r1, r8
	ldrh r0, [r1]
	adds r0, r0, r5
	movs r1, #0xec
	muls r0, r1, r0
	adds r3, r3, r0
	ldr r0, _081854FC
	adds r2, r2, r0
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #5
	ble _081854CE
	b _0818565A
	.align 2, 0
_081854F4: .4byte 0x0000050E
_081854F8: .4byte 0x0203886A
_081854FC: .4byte 0x00000754
_08185500:
	ldr r2, _0818559C
	ldrh r2, [r2]
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x63
	bhi _081855FC
	movs r6, #0
	ldr r5, _081855A0
	adds r3, r7, r5
	mov sb, sl
	ldr r0, _0818559C
	mov ip, r0
	ldr r1, _081855A4
	mov r8, r1
	ldr r4, _081855A8
_08185520:
	adds r2, r3, r6
	mov r5, sb
	ldr r1, [r5]
	mov r5, ip
	ldrh r0, [r5]
	add r0, r8
	movs r5, #0xec
	muls r0, r5, r0
	adds r0, r6, r0
	adds r1, r1, r4
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	adds r6, #1
	cmp r6, #7
	ble _08185520
	mov r0, sl
	ldr r2, [r0]
	ldr r1, _0818559C
	ldrh r0, [r1]
	ldr r3, _081855A4
	adds r0, r0, r3
	movs r1, #0xec
	muls r0, r1, r0
	adds r2, r2, r0
	ldr r5, _081855AC
	adds r2, r2, r5
	ldrb r1, [r2]
	ldr r2, _081855B0
	adds r0, r7, r2
	strb r1, [r0]
	ldr r5, _081855B4
	ldrb r0, [r5]
	cmp r0, #1
	bne _081855BC
	movs r6, #0
	ldr r0, _081855B8
	adds r4, r7, r0
	mov sb, sl
	ldr r1, _0818559C
	mov r8, r1
	adds r5, r3, #0
_08185574:
	lsls r3, r6, #1
	mov r0, sb
	ldr r2, [r0]
	mov r1, r8
	ldrh r0, [r1]
	adds r0, r0, r5
	movs r1, #0xec
	muls r0, r1, r0
	adds r3, r3, r0
	movs r0, #0xec
	lsls r0, r0, #3
	adds r2, r2, r0
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #5
	ble _08185574
	b _0818565A
	.align 2, 0
_0818559C: .4byte 0x0203886C
_081855A0: .4byte 0x00000504
_081855A4: .4byte 0xFFFFFED4
_081855A8: .4byte 0x0000073C
_081855AC: .4byte 0x00000739
_081855B0: .4byte 0x0000050C
_081855B4: .4byte 0x0203C9B4
_081855B8: .4byte 0x0000050E
_081855BC:
	movs r6, #0
	ldr r1, _081855F0
	adds r4, r7, r1
	mov sb, sl
	ldr r2, _081855F4
	mov r8, r2
	adds r5, r3, #0
_081855CA:
	lsls r3, r6, #1
	mov r0, sb
	ldr r2, [r0]
	mov r1, r8
	ldrh r0, [r1]
	adds r0, r0, r5
	movs r1, #0xec
	muls r0, r1, r0
	adds r3, r3, r0
	ldr r0, _081855F8
	adds r2, r2, r0
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #5
	ble _081855CA
	b _0818565A
	.align 2, 0
_081855F0: .4byte 0x0000050E
_081855F4: .4byte 0x0203886C
_081855F8: .4byte 0x00000754
_081855FC:
	ldr r2, _081856BC
	ldrh r2, [r2]
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x63
	bhi _0818565A
	movs r6, #0
	ldr r5, _081856C0
	adds r3, r7, r5
	mov sb, sl
	ldr r0, _081856BC
	mov ip, r0
	ldr r1, _081856C4
	mov r8, r1
	ldr r4, _081856C8
_0818561C:
	adds r2, r3, r6
	mov r5, sb
	ldr r1, [r5]
	mov r5, ip
	ldrh r0, [r5]
	add r0, r8
	movs r5, #0xec
	muls r0, r5, r0
	adds r0, r6, r0
	adds r1, r1, r4
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	adds r6, #1
	cmp r6, #7
	ble _0818561C
	mov r0, sl
	ldr r2, [r0]
	ldr r1, _081856BC
	ldrh r0, [r1]
	ldr r3, _081856C4
	adds r0, r0, r3
	movs r1, #0xec
	muls r0, r1, r0
	adds r2, r2, r0
	ldr r5, _081856CC
	adds r2, r2, r5
	ldrb r1, [r2]
	ldr r2, _081856D0
	adds r0, r7, r2
	strb r1, [r0]
_0818565A:
	ldr r3, _081856D4
	ldrh r0, [r3]
	ldr r1, _081856D8
	cmp r0, r1
	bls _081856E8
	mov r5, sl
	ldr r2, [r5]
	adds r1, r0, #0
	ldr r3, _081856DC
	adds r1, r1, r3
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r2, #0xdc
	ldrb r0, [r2]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	ldr r2, _081856E0
	adds r1, r7, r2
	strb r0, [r1]
	movs r6, #0
	ldr r5, _081856E4
	adds r4, r7, r5
	mov sb, sl
	ldr r0, _081856D4
	mov r8, r0
	adds r5, r3, #0
_08185692:
	lsls r3, r6, #1
	mov r1, sb
	ldr r2, [r1]
	mov r0, r8
	ldrh r1, [r0]
	adds r1, r1, r5
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	movs r1, #0x82
	lsls r1, r1, #1
	adds r2, r2, r1
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #5
	ble _08185692
	b _08185786
	.align 2, 0
_081856BC: .4byte 0x0203886E
_081856C0: .4byte 0x00000504
_081856C4: .4byte 0xFFFFFED4
_081856C8: .4byte 0x0000073C
_081856CC: .4byte 0x00000739
_081856D0: .4byte 0x0000050C
_081856D4: .4byte 0x0203886A
_081856D8: .4byte 0x0000018F
_081856DC: .4byte 0xFFFFFE70
_081856E0: .4byte 0x0000050D
_081856E4: .4byte 0x0000050E
_081856E8:
	ldr r2, _0818574C
	ldrh r0, [r2]
	cmp r0, r1
	bls _0818575C
	mov r3, sl
	ldr r2, [r3]
	ldr r5, _0818574C
	ldrh r1, [r5]
	ldr r3, _08185750
	adds r1, r1, r3
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r2, #0xdc
	ldrb r0, [r2]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	ldr r2, _08185754
	adds r1, r7, r2
	strb r0, [r1]
	movs r6, #0
	ldr r5, _08185758
	adds r4, r7, r5
	mov sb, sl
	ldr r0, _0818574C
	mov r8, r0
	adds r5, r3, #0
_08185720:
	lsls r3, r6, #1
	mov r1, sb
	ldr r2, [r1]
	mov r0, r8
	ldrh r1, [r0]
	adds r1, r1, r5
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	movs r1, #0x82
	lsls r1, r1, #1
	adds r2, r2, r1
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #5
	ble _08185720
	b _08185786
	.align 2, 0
_0818574C: .4byte 0x0203886C
_08185750: .4byte 0xFFFFFE70
_08185754: .4byte 0x0000050D
_08185758: .4byte 0x0000050E
_0818575C:
	ldr r2, _081857F8
	ldrh r0, [r2]
	cmp r0, r1
	bls _08185786
	mov r3, sl
	ldr r2, [r3]
	ldr r5, _081857F8
	ldrh r1, [r5]
	ldr r0, _081857FC
	adds r1, r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r2, #0xdc
	ldrb r0, [r2]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	ldr r2, _08185800
	adds r1, r7, r2
	strb r0, [r1]
_08185786:
	movs r6, #0
	ldr r3, _08185804
	mov sl, r3
	ldr r5, _08185808
	mov sb, r5
	movs r0, #0xa6
	lsls r0, r0, #2
	mov r8, r0
	ldr r1, _0818580C
	adds r5, r7, r1
_0818579A:
	adds r4, r6, #1
	mov r0, r8
	muls r0, r6, r0
	mov r3, sb
	adds r2, r0, r3
	adds r1, r0, r5
	mov r3, sl
	adds r3, #1
_081857AA:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bne _081857AA
	adds r6, r4, #0
	cmp r6, #3
	ble _0818579A
_081857BE:
	adds r0, r7, #0
	ldr r1, [sp]
	bl RecordedBattleToSave
	adds r4, r0, #0
	cmp r4, #1
	beq _081857DA
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #2
	bls _081857BE
_081857DA:
	adds r0, r7, #0
	bl Free
	ldr r0, [sp]
	bl Free
	adds r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081857F8: .4byte 0x0203886E
_081857FC: .4byte 0xFFFFFE70
_08185800: .4byte 0x0000050D
_08185804: .4byte 0x00000297
_08185808: .4byte 0x0203BA00
_0818580C: .4byte 0x0000051C
	thumb_func_end MoveRecordedBattleToSaveData

	thumb_func_start TryCopyRecordedBattleSaveData
TryCopyRecordedBattleSaveData: @ 0x08185810
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x1f
	bl TryReadSpecialSaveSection
	cmp r0, #1
	bne _0818583A
	movs r2, #0xf8
	lsls r2, r2, #4
	adds r0, r5, #0
	adds r1, r4, #0
	bl memcpy
	adds r0, r5, #0
	bl IsRecordedBattleSaveValid
	cmp r0, #0
	beq _0818583A
	movs r0, #1
	b _0818583C
_0818583A:
	movs r0, #0
_0818583C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryCopyRecordedBattleSaveData

	thumb_func_start CopyRecordedBattleFromSave
CopyRecordedBattleFromSave: @ 0x08185844
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	bl AllocZeroed
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl TryCopyRecordedBattleSaveData
	adds r4, r0, #0
	adds r0, r5, #0
	bl Free
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CopyRecordedBattleFromSave

	thumb_func_start CB2_RecordedBattleEnd
CB2_RecordedBattleEnd: @ 0x0818586C
	push {lr}
	ldr r0, _081858B4
	ldr r2, [r0]
	ldr r0, _081858B8
	ldrb r0, [r0]
	ldr r1, _081858BC
	adds r2, r2, r1
	movs r1, #3
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _081858C0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _081858C4
	movs r1, #0
	str r1, [r0]
	ldr r0, _081858C8
	strh r1, [r0]
	ldr r0, _081858CC
	strh r1, [r0]
	ldr r0, _081858D0
	strh r1, [r0]
	bl RecordedBattle_SaveParties
	ldr r0, _081858D4
	ldr r0, [r0]
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081858B4: .4byte 0x03005AF0
_081858B8: .4byte 0x0203C479
_081858BC: .4byte 0x00000CA9
_081858C0: .4byte 0x02023FDE
_081858C4: .4byte 0x02022C90
_081858C8: .4byte 0x0203886A
_081858CC: .4byte 0x0203886C
_081858D0: .4byte 0x0203886E
_081858D4: .4byte 0x0203C47C
	thumb_func_end CB2_RecordedBattleEnd

	thumb_func_start Task_StartAfterCountdown
Task_StartAfterCountdown: @ 0x081858D8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0818590C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	subs r1, #1
	strh r1, [r0, #8]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _08185906
	ldr r0, _08185910
	ldr r1, _08185914
	str r1, [r0, #8]
	ldr r0, _08185918
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_08185906:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818590C: .4byte 0x03005B60
_08185910: .4byte 0x03002360
_08185914: .4byte 0x0818586D
_08185918: .4byte 0x080365B5
	thumb_func_end Task_StartAfterCountdown

	thumb_func_start SetVariablesForRecordedBattle
SetVariablesForRecordedBattle: @ 0x0818591C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	movs r6, #0
	ldr r0, _08185B04
	mov r8, r0
_08185938:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	mov r1, r8
	adds r0, r4, r1
	adds r5, r7, r4
	adds r1, r5, #0
	movs r2, #0x64
	bl memcpy
	ldr r0, _08185B08
	adds r4, r4, r0
	movs r2, #0x96
	lsls r2, r2, #2
	adds r5, r5, r2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x64
	bl memcpy
	adds r6, #1
	cmp r6, #5
	ble _08185938
	movs r6, #0
	ldr r0, _08185B0C
	mov r8, r0
	mov r5, r8
	adds r5, #4
	mov sl, r6
	mov sb, r6
	movs r1, #0x96
	lsls r1, r1, #3
	adds r1, r7, r1
	str r1, [sp]
	movs r2, #0x9a
	lsls r2, r2, #3
	adds r4, r7, r2
_08185982:
	lsls r0, r6, #2
	mov ip, r0
	ldr r3, [sp]
	add r3, sb
	mov r2, sl
	lsls r1, r2, #2
	mov r0, r8
	adds r0, #8
	adds r1, r1, r0
	movs r2, #7
_08185996:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, #1
	adds r1, #1
	subs r2, #1
	cmp r2, #0
	bge _08185996
	ldrb r0, [r4]
	strb r0, [r5, #0xf]
	ldrb r0, [r4, #0x14]
	strh r0, [r5, #0x16]
	movs r1, #0x9e
	lsls r1, r1, #3
	adds r0, r7, r1
	adds r0, r0, r6
	ldrb r0, [r0]
	strh r0, [r5, #0x14]
	ldr r2, _08185B10
	adds r0, r7, r2
	add r0, ip
	ldr r0, [r0]
	str r0, [r5]
	adds r5, #0x1c
	movs r0, #7
	add sl, r0
	movs r1, #8
	add sb, r1
	adds r4, #1
	adds r6, #1
	cmp r6, #3
	ble _08185982
	adds r2, #0x14
	adds r0, r7, r2
	ldr r0, [r0]
	ldr r1, _08185B14
	str r0, [r1]
	adds r2, #4
	adds r0, r7, r2
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	orrs r0, r1
	ldr r1, _08185B18
	str r0, [r1]
	adds r2, #8
	adds r0, r7, r2
	ldrh r0, [r0]
	ldr r1, _08185B1C
	strh r0, [r1]
	adds r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	ldr r1, _08185B20
	strh r0, [r1]
	adds r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	ldr r1, _08185B24
	strh r0, [r1]
	adds r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	ldr r1, _08185B28
	strb r0, [r1]
	ldr r2, _08185B2C
	ldr r0, [r2]
	ldr r1, _08185B30
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	ldr r2, _08185B34
	strb r0, [r2]
	ldr r1, _08185B38
	adds r0, r7, r1
	ldrb r0, [r0]
	ldr r2, _08185B3C
	strb r0, [r2]
	adds r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	ldr r2, _08185B40
	strb r0, [r2]
	adds r1, #1
	adds r0, r7, r1
	ldrb r1, [r0]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	ldr r2, _08185B44
	strb r0, [r2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1d
	ldr r0, _08185B48
	strb r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r7, r1
	ldr r0, [r0]
	ldr r2, _08185B4C
	str r0, [r2]
	movs r6, #0
	ldr r4, _08185B50
	ldr r0, _08185B54
	adds r3, r7, r0
_08185A66:
	adds r0, r6, r4
	adds r1, r3, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #7
	ble _08185A66
	ldr r1, _08185B58
	adds r0, r7, r1
	ldrb r0, [r0]
	ldr r2, _08185B5C
	strb r0, [r2]
	adds r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	ldr r2, _08185B60
	strb r0, [r2]
	ldr r0, _08185B64
	adds r1, r7, r0
	ldr r3, _08185B68
	movs r6, #5
_08185A90:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r6, #1
	cmp r6, #0
	bge _08185A90
	ldr r1, _08185B2C
	ldr r2, [r1]
	ldr r1, _08185B6C
	adds r0, r7, r1
	ldrb r0, [r0]
	ldr r1, _08185B30
	adds r2, r2, r1
	movs r1, #3
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r6, #0
	ldr r2, _08185B70
	mov sl, r2
	ldr r0, _08185B74
	mov sb, r0
	movs r1, #0xa6
	lsls r1, r1, #2
	mov r8, r1
	ldr r2, _08185B78
	adds r5, r7, r2
_08185AD0:
	adds r3, r6, #1
	mov r0, r8
	muls r0, r6, r0
	adds r1, r0, r5
	mov r2, sb
	adds r4, r0, r2
	mov r2, sl
	adds r2, #1
_08185AE0:
	ldrb r0, [r1]
	strb r0, [r4]
	adds r1, #1
	adds r4, #1
	subs r2, #1
	cmp r2, #0
	bne _08185AE0
	adds r6, r3, #0
	cmp r6, #3
	ble _08185AD0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08185B04: .4byte 0x02024190
_08185B08: .4byte 0x020243E8
_08185B0C: .4byte 0x020226A0
_08185B10: .4byte 0x000004D4
_08185B14: .4byte 0x0203B9F8
_08185B18: .4byte 0x02022C90
_08185B1C: .4byte 0x0203886A
_08185B20: .4byte 0x0203886C
_08185B24: .4byte 0x0203886E
_08185B28: .4byte 0x0203C480
_08185B2C: .4byte 0x03005AF0
_08185B30: .4byte 0x00000CA9
_08185B34: .4byte 0x0203C479
_08185B38: .4byte 0x000004FD
_08185B3C: .4byte 0x0203C47A
_08185B40: .4byte 0x0203C47B
_08185B44: .4byte 0x0203C482
_08185B48: .4byte 0x0203C483
_08185B4C: .4byte 0x0203C488
_08185B50: .4byte 0x0203C99D
_08185B54: .4byte 0x00000504
_08185B58: .4byte 0x0000050C
_08185B5C: .4byte 0x0203C9A5
_08185B60: .4byte 0x0203C9A6
_08185B64: .4byte 0x0000050E
_08185B68: .4byte 0x0203C9A8
_08185B6C: .4byte 0x000004FC
_08185B70: .4byte 0x00000297
_08185B74: .4byte 0x0203BA00
_08185B78: .4byte 0x0000051C
	thumb_func_end SetVariablesForRecordedBattle

	thumb_func_start PlayRecordedBattle
PlayRecordedBattle: @ 0x08185B7C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xf8
	lsls r0, r0, #4
	bl AllocZeroed
	adds r4, r0, #0
	bl CopyRecordedBattleFromSave
	cmp r0, #1
	bne _08185BC6
	bl RecordedBattle_RestoreSavedParties
	adds r0, r4, #0
	bl SetVariablesForRecordedBattle
	ldr r0, _08185BD4
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08185BD8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0x80
	strh r0, [r1, #8]
	ldr r0, _08185BDC
	str r5, [r0]
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	ldr r0, _08185BE0
	bl SetMainCallback2
_08185BC6:
	adds r0, r4, #0
	bl Free
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08185BD4: .4byte 0x081858D9
_08185BD8: .4byte 0x03005B60
_08185BDC: .4byte 0x0203C47C
_08185BE0: .4byte 0x08185BE5
	thumb_func_end PlayRecordedBattle

	thumb_func_start CB2_RecordedBattle
CB2_RecordedBattle: @ 0x08185BE4
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_RecordedBattle

	thumb_func_start GetRecordedBattleApprenticeLanguage
GetRecordedBattleApprenticeLanguage: @ 0x08185BF8
	ldr r0, _08185C00
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08185C00: .4byte 0x0203C47A
	thumb_func_end GetRecordedBattleApprenticeLanguage

	thumb_func_start GetRecordedBattleFronterBrainSymbol
GetRecordedBattleFronterBrainSymbol: @ 0x08185C04
	ldr r0, _08185C0C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08185C0C: .4byte 0x0203C47B
	thumb_func_end GetRecordedBattleFronterBrainSymbol

	thumb_func_start RecordedBattle_RestoreSavedParties
RecordedBattle_RestoreSavedParties: @ 0x08185C10
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _08185C44
_08185C16:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	adds r0, r4, r6
	ldr r1, _08185C48
	adds r1, r4, r1
	movs r2, #0x64
	bl memcpy
	ldr r0, _08185C4C
	adds r0, r4, r0
	ldr r1, _08185C50
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #0x64
	bl memcpy
	adds r5, #1
	cmp r5, #5
	ble _08185C16
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08185C44: .4byte 0x0203C48C
_08185C48: .4byte 0x02024190
_08185C4C: .4byte 0x0203C6E4
_08185C50: .4byte 0x020243E8
	thumb_func_end RecordedBattle_RestoreSavedParties

	thumb_func_start RecordedBattle_SaveParties
RecordedBattle_SaveParties: @ 0x08185C54
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _08185C88
_08185C5A:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	adds r0, r4, r6
	ldr r1, _08185C8C
	adds r1, r4, r1
	movs r2, #0x64
	bl memcpy
	ldr r0, _08185C90
	adds r0, r4, r0
	ldr r1, _08185C94
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #0x64
	bl memcpy
	adds r5, #1
	cmp r5, #5
	ble _08185C5A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08185C88: .4byte 0x02024190
_08185C8C: .4byte 0x0203C48C
_08185C90: .4byte 0x020243E8
_08185C94: .4byte 0x0203C6E4
	thumb_func_end RecordedBattle_SaveParties

	thumb_func_start GetActiveBattlerLinkPlayerGender
GetActiveBattlerLinkPlayerGender: @ 0x08185C98
	push {r4, r5, lr}
	movs r2, #0
	ldr r0, _08185CC4
	ldr r3, _08185CC8
	ldrh r1, [r0, #0x18]
	adds r4, r0, #0
	ldrb r0, [r3]
	cmp r1, r0
	beq _08185CBC
	adds r1, r4, #0
_08185CAC:
	adds r1, #0x1c
	adds r2, #1
	cmp r2, #3
	bgt _08185CBC
	ldrh r0, [r1, #0x18]
	ldrb r5, [r3]
	cmp r0, r5
	bne _08185CAC
_08185CBC:
	cmp r2, #4
	bne _08185CCC
	movs r0, #0
	b _08185CD6
	.align 2, 0
_08185CC4: .4byte 0x020226A0
_08185CC8: .4byte 0x02023D08
_08185CCC:
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #0x13]
_08185CD6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetActiveBattlerLinkPlayerGender

	thumb_func_start sub_08185CDC
sub_08185CDC: @ 0x08185CDC
	ldr r1, _08185CE4
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08185CE4: .4byte 0x0203C481
	thumb_func_end sub_08185CDC

	thumb_func_start sub_08185CE8
sub_08185CE8: @ 0x08185CE8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08185D00
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1f
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08185D00: .4byte 0x0203C481
	thumb_func_end sub_08185CE8

	thumb_func_start GetRecordedBattleFrontierFacility
GetRecordedBattleFrontierFacility: @ 0x08185D04
	ldr r0, _08185D0C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08185D0C: .4byte 0x0203C481
	thumb_func_end GetRecordedBattleFrontierFacility

	thumb_func_start GetRecordedBattleRecordMixFriendClass
GetRecordedBattleRecordMixFriendClass: @ 0x08185D10
	ldr r0, _08185D18
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08185D18: .4byte 0x0203C482
	thumb_func_end GetRecordedBattleRecordMixFriendClass

	thumb_func_start GetBattleSceneInRecordedBattle
GetBattleSceneInRecordedBattle: @ 0x08185D1C
	ldr r0, _08185D24
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08185D24: .4byte 0x0203C483
	thumb_func_end GetBattleSceneInRecordedBattle

	thumb_func_start RecordedBattle_CopyBattlerMoves
RecordedBattle_CopyBattlerMoves: @ 0x08185D28
	push {r4, r5, r6, r7, lr}
	ldr r4, _08185D7C
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08185D74
	ldr r0, _08185D80
	ldr r0, [r0]
	ldr r1, _08185D84
	ands r0, r1
	cmp r0, #0
	bne _08185D74
	ldr r0, _08185D88
	ldrb r0, [r0]
	cmp r0, #2
	beq _08185D74
	movs r3, #0
	ldr r7, _08185D8C
	adds r6, r4, #0
	ldr r5, _08185D90
	movs r4, #0x58
_08185D58:
	lsls r2, r3, #1
	ldrb r1, [r6]
	lsrs r0, r1, #1
	lsls r0, r0, #3
	adds r0, r2, r0
	adds r0, r0, r7
	muls r1, r4, r1
	adds r2, r2, r1
	adds r2, r2, r5
	ldrh r1, [r2]
	strh r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble _08185D58
_08185D74:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08185D7C: .4byte 0x02023D08
_08185D80: .4byte 0x02022C90
_08185D84: .4byte 0x02000002
_08185D88: .4byte 0x0203C478
_08185D8C: .4byte 0x0203C93C
_08185D90: .4byte 0x02023D34
	thumb_func_end RecordedBattle_CopyBattlerMoves

	thumb_func_start sub_08185D94
sub_08185D94: @ 0x08185D94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	ldr r0, _08185DBC
	ldr r0, [r0]
	ldr r1, _08185DC0
	ands r0, r1
	cmp r0, #0
	beq _08185DB4
	b _08186154
_08185DB4:
	movs r0, #0
	mov sl, r0
	b _0818614A
	.align 2, 0
_08185DBC: .4byte 0x02022C90
_08185DC0: .4byte 0x02000002
_08185DC4:
	mov r1, sl
	lsls r4, r1, #0x18
	lsrs r5, r4, #0x18
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r4, [sp, #0x4c]
	mov r2, sl
	adds r2, #1
	str r2, [sp, #0x38]
	cmp r0, #1
	bne _08185DE2
	b _08186146
_08185DE2:
	ldr r3, [sp, #0x24]
	cmp r3, #1
	bne _08185E76
	movs r5, #0
	ldr r4, _08185E60
	mov r0, sl
	asrs r6, r0, #0x1f
	subs r0, r0, r6
	asrs r0, r0, #1
	lsls r0, r0, #3
	adds r2, r0, r4
	movs r1, #0x58
	mov r0, sl
	muls r0, r1, r0
	ldr r3, _08185E64
	adds r1, r0, r3
_08185E02:
	ldrh r0, [r1]
	ldrh r4, [r2]
	cmp r0, r4
	bne _08185E14
	adds r2, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #3
	ble _08185E02
_08185E14:
	cmp r5, #4
	bne _08185E1A
	b _08186146
_08185E1A:
	ldr r1, [sp, #0x4c]
	lsrs r0, r1, #0x18
	movs r1, #6
	bl RecordedBattle_SetBattlerAction
	movs r5, #0
	ldr r2, _08185E60
	mov r8, r2
	movs r3, #0x58
	mov r7, sl
	muls r7, r3, r7
	mov r4, sl
	subs r0, r4, r6
	asrs r4, r0, #1
_08185E36:
	movs r2, #0
	lsls r0, r5, #1
	adds r5, #1
	adds r0, r0, r7
	ldr r1, _08185E64
	adds r3, r0, r1
	lsls r0, r4, #3
	mov r6, r8
	adds r1, r0, r6
_08185E48:
	ldrh r0, [r3]
	ldrh r6, [r1]
	cmp r0, r6
	bne _08185E68
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [sp, #0x4c]
	lsrs r0, r2, #0x18
	bl RecordedBattle_SetBattlerAction
	b _08185E70
	.align 2, 0
_08185E60: .4byte 0x0203C93C
_08185E64: .4byte 0x02023D34
_08185E68:
	adds r1, #2
	adds r2, #1
	cmp r2, #3
	ble _08185E48
_08185E70:
	cmp r5, #3
	ble _08185E36
	b _08186146
_08185E76:
	ldr r3, _08186164
	ldr r1, _08186168
	mov r4, sl
	lsls r2, r4, #1
	adds r1, r2, r1
	movs r0, #0xa6
	lsls r0, r0, #2
	mov r6, sl
	muls r6, r0, r6
	adds r0, r6, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	str r2, [sp, #0x44]
	cmp r0, #6
	beq _08185E9A
	b _08186146
_08185E9A:
	adds r0, r5, #0
	bl RecordedBattle_GetBattlerAction
	movs r5, #0
	mov r0, sp
	adds r0, #4
	str r0, [sp, #0x28]
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x30]
	mov r2, sp
	adds r2, #0x14
	str r2, [sp, #0x34]
	mov r3, sp
	adds r3, #0x18
	str r3, [sp, #0x3c]
	mov r4, sp
	adds r4, #8
	str r4, [sp, #0x2c]
	mov r6, sl
	lsls r6, r6, #3
	str r6, [sp, #0x48]
	movs r1, #0x58
	mov r0, sl
	muls r0, r1, r0
	ldr r2, _0818616C
	adds r0, r0, r2
	adds r6, r0, #0
	adds r6, #0x3b
	movs r4, #3
_08185ED6:
	mov r0, sp
	adds r3, r0, r5
	ldrb r1, [r6]
	lsls r2, r5, #1
	adds r0, r4, #0
	lsls r0, r2
	ands r1, r0
	asrs r1, r2
	strb r1, [r3]
	adds r5, #1
	cmp r5, #3
	ble _08185ED6
	movs r5, #0
	ldr r1, _0818616C
	mov sb, r1
	movs r2, #0x58
	mov r7, sl
	muls r7, r2, r7
	ldr r4, [sp, #0x28]
	ldr r6, [sp, #0x30]
_08185EFE:
	ldr r3, [sp, #0x4c]
	lsrs r0, r3, #0x18
	bl RecordedBattle_GetBattlerAction
	strb r0, [r4]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r1, #0xc
	add r1, sb
	mov r8, r1
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r2, [sp, #0x34]
	adds r1, r2, r5
	ldrb r0, [r4]
	adds r0, r0, r7
	ldr r3, _08186170
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [sp, #0x3c]
	adds r1, r0, r5
	ldrb r0, [r4]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, [sp, #0x2c]
	adds r3, r1, r5
	ldr r2, [sp, #0x48]
	mov r1, sl
	subs r0, r2, r1
	lsls r0, r0, #2
	ldr r2, _08186174
	adds r0, r0, r2
	ldrb r1, [r0, #0x18]
	lsrs r1, r1, #4
	ldr r2, _08186178
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	lsrs r1, r5
	strb r1, [r3]
	adds r4, #1
	adds r6, #2
	adds r5, #1
	cmp r5, #3
	ble _08185EFE
	movs r5, #0
	movs r3, #0xc
	rsbs r3, r3, #0
	add r3, r8
	mov ip, r3
	ldr r4, _08186174
	mov sb, r4
	movs r6, #0x58
	mov r1, sl
	muls r1, r6, r1
	mov r0, r8
	adds r0, #0x18
	adds r4, r1, r0
	adds r3, r1, #0
	mov r7, r8
	ldr r6, [sp, #0x34]
	ldr r2, [sp, #0x30]
_08185F84:
	adds r1, r3, r7
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r6, r5
	ldrb r0, [r0]
	strb r0, [r4]
	adds r4, #1
	adds r3, #2
	adds r2, #2
	adds r5, #1
	cmp r5, #3
	ble _08185F84
	movs r0, #0x58
	mov r4, sl
	muls r4, r0, r4
	mov r1, ip
	adds r0, r4, r1
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	ldr r2, [sp, #0x48]
	mov r6, sl
	subs r3, r2, r6
	lsls r3, r3, #2
	mov r0, sb
	adds r2, r3, r0
	ldrb r1, [r2, #0x18]
	movs r0, #0xf
	ands r0, r1
	strb r0, [r2, #0x18]
	movs r5, #0
	ldr r1, _0818616C
	adds r4, r4, r1
	adds r4, #0x3b
	ldr r0, _08186174
	adds r6, r3, r0
_08185FCC:
	ldr r2, [sp, #0x3c]
	adds r0, r2, r5
	ldrb r0, [r0]
	lsls r1, r5, #1
	lsls r0, r1
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	ldrb r2, [r6, #0x18]
	lsrs r3, r2, #4
	ldr r1, [sp, #0x2c]
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r1, r5
	orrs r1, r3
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #0x18]
	adds r5, #1
	cmp r5, #3
	ble _08185FCC
	movs r2, #0x58
	mov r0, sl
	muls r0, r2, r0
	mov r1, ip
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08186014
	b _08186122
_08186014:
	movs r5, #0
	mov r3, sp
	adds r3, #0x20
	str r3, [sp, #0x40]
	ldr r0, _0818617C
	ldr r4, [sp, #0x44]
	adds r6, r4, r0
_08186022:
	ldrh r1, [r6]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r4, _08186180
	adds r0, r0, r4
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	mov r1, sp
	adds r3, r1, r5
	lsls r2, r5, #1
	movs r1, #3
	lsls r1, r2
	ands r0, r1
	lsrs r0, r2
	strb r0, [r3]
	adds r5, #1
	cmp r5, #3
	ble _08186022
	movs r5, #0
	ldr r0, _0818617C
	ldr r2, [sp, #0x44]
	adds r7, r2, r0
	movs r3, #0x64
	mov sb, r3
	mov r8, r4
	ldr r4, [sp, #0x28]
	ldr r6, [sp, #0x30]
_0818605C:
	ldrh r0, [r7]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, r8
	ldrb r1, [r4]
	adds r1, #0xd
	movs r2, #0
	bl GetMonData
	strh r0, [r6]
	ldrh r0, [r7]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	add r0, r8
	ldrb r1, [r4]
	adds r1, #0x11
	movs r2, #0
	bl GetMonData
	ldr r3, [sp, #0x34]
	adds r1, r3, r5
	strb r0, [r1]
	ldr r0, [sp, #0x3c]
	adds r1, r0, r5
	ldrb r0, [r4]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	adds r4, #1
	adds r6, #2
	adds r5, #1
	cmp r5, #3
	ble _0818605C
	movs r5, #0
	ldr r0, _0818617C
	ldr r1, [sp, #0x44]
	adds r7, r1, r0
	movs r2, #0x64
	mov sb, r2
	ldr r3, _08186180
	mov r8, r3
	ldr r6, [sp, #0x30]
	adds r6, #8
	ldr r4, [sp, #0x30]
_081860B8:
	ldrh r0, [r7]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, r8
	adds r1, r5, #0
	adds r1, #0xd
	adds r2, r4, #0
	bl SetMonData
	ldrh r0, [r7]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	add r0, r8
	adds r1, r5, #0
	adds r1, #0x11
	adds r2, r6, #0
	bl SetMonData
	adds r6, #1
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _081860B8
	movs r0, #0
	ldr r3, [sp, #0x40]
	strb r0, [r3]
	movs r5, #0
	ldr r4, _0818617C
	ldr r6, _08186180
	ldr r3, [sp, #0x3c]
	ldr r2, [sp, #0x40]
_081860FA:
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r5, #1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r5, #1
	cmp r5, #3
	ble _081860FA
	ldr r1, [sp, #0x44]
	adds r0, r1, r4
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	adds r0, r0, r6
	movs r1, #0x15
	ldr r2, [sp, #0x40]
	bl SetMonData
_08186122:
	ldr r2, _08186184
	ldr r3, [sp, #0x44]
	adds r2, r3, r2
	ldr r0, _08186188
	ldr r0, [r0]
	add r0, sl
	adds r0, #0x80
	ldrb r0, [r0]
	lsls r0, r0, #1
	movs r4, #0x58
	mov r1, sl
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r1, _0818616C
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_08186146:
	ldr r6, [sp, #0x38]
	mov sl, r6
_0818614A:
	ldr r0, _0818618C
	ldrb r0, [r0]
	cmp sl, r0
	bge _08186154
	b _08185DC4
_08186154:
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08186164: .4byte 0x0203BA00
_08186168: .4byte 0x0203C460
_0818616C: .4byte 0x02023D28
_08186170: .4byte 0x02023D4C
_08186174: .4byte 0x02023F60
_08186178: .4byte 0x082FACB4
_0818617C: .4byte 0x02023D12
_08186180: .4byte 0x02024190
_08186184: .4byte 0x02023F18
_08186188: .4byte 0x02024140
_0818618C: .4byte 0x02023D10
	thumb_func_end sub_08185D94

	thumb_func_start GetAiScriptsInRecordedBattle
GetAiScriptsInRecordedBattle: @ 0x08186190
	ldr r0, _08186198
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08186198: .4byte 0x0203C488
	thumb_func_end GetAiScriptsInRecordedBattle

	thumb_func_start sub_0818619C
sub_0818619C: @ 0x0818619C
	ldr r1, _081861A4
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_081861A4: .4byte 0x0203C99C
	thumb_func_end sub_0818619C

	thumb_func_start sub_081861A8
sub_081861A8: @ 0x081861A8
	push {lr}
	movs r1, #0
	ldr r0, _081861BC
	ldrb r0, [r0]
	cmp r0, #0
	bne _081861B6
	movs r1, #1
_081861B6:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_081861BC: .4byte 0x0203C99C
	thumb_func_end sub_081861A8

	thumb_func_start sub_081861C0
sub_081861C0: @ 0x081861C0
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r4, _081861DC
_081861C8:
	adds r0, r3, r2
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _081861C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081861DC: .4byte 0x0203C99D
	thumb_func_end sub_081861C0

	thumb_func_start GetRecordedBattleRecordMixFriendLanguage
GetRecordedBattleRecordMixFriendLanguage: @ 0x081861E0
	ldr r0, _081861E8
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081861E8: .4byte 0x0203C9A5
	thumb_func_end GetRecordedBattleRecordMixFriendLanguage

	thumb_func_start GetTextSpeedInRecordedBattle
GetTextSpeedInRecordedBattle: @ 0x081861EC
	ldr r0, _081861F4
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081861F4: .4byte 0x0203C9A6
	thumb_func_end GetTextSpeedInRecordedBattle

	thumb_func_start RecordedBattle_SaveBattleOutcome
RecordedBattle_SaveBattleOutcome: @ 0x081861F8
	ldr r0, _08186204
	ldr r1, _08186208
	ldrb r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_08186204: .4byte 0x0203C9B4
_08186208: .4byte 0x02023FDE
	thumb_func_end RecordedBattle_SaveBattleOutcome

	thumb_func_start GetRecordedBattleEasyChatSpeech
GetRecordedBattleEasyChatSpeech: @ 0x0818620C
	ldr r0, _08186210
	bx lr
	.align 2, 0
_08186210: .4byte 0x0203C9A8
	thumb_func_end GetRecordedBattleEasyChatSpeech

	thumb_func_start sub_08186214
sub_08186214: @ 0x08186214
	bx lr
	.align 2, 0
	thumb_func_end sub_08186214

	thumb_func_start sub_08186218
sub_08186218: @ 0x08186218
	ldr r1, _08186228
	ldr r0, _0818622C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08186230
	str r1, [r0]
	bx lr
	.align 2, 0
_08186228: .4byte 0x03005AC0
_0818622C: .4byte 0x02023D08
_08186230: .4byte 0x08186235
	thumb_func_end sub_08186218

	thumb_func_start sub_08186234
sub_08186234: @ 0x08186234
	push {lr}
	ldr r2, _08186268
	ldr r1, _0818626C
	ldr r0, _08186270
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08186280
	ldr r0, _08186274
	lsls r1, r3, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x38
	bhi _0818627C
	ldr r0, _08186278
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _08186280
	.align 2, 0
_08186268: .4byte 0x02023D0C
_0818626C: .4byte 0x082FACB4
_08186270: .4byte 0x02023D08
_08186274: .4byte 0x02022D08
_08186278: .4byte 0x085D38F0
_0818627C:
	bl RecordedOpponentBufferExecCompleted
_08186280:
	pop {r0}
	bx r0
	thumb_func_end sub_08186234

	thumb_func_start sub_08186284
sub_08186284: @ 0x08186284
	push {lr}
	ldr r2, _081862AC
	ldr r1, _081862B0
	ldr r0, _081862B4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081862B8
	cmp r1, r0
	bne _081862A8
	bl RecordedOpponentBufferExecCompleted
_081862A8:
	pop {r0}
	bx r0
	.align 2, 0
_081862AC: .4byte 0x020205AC
_081862B0: .4byte 0x02023E88
_081862B4: .4byte 0x02023D08
_081862B8: .4byte 0x08007141
	thumb_func_end sub_08186284

	thumb_func_start sub_081862BC
sub_081862BC: @ 0x081862BC
	push {lr}
	ldr r2, _081862E4
	ldr r1, _081862E8
	ldr r0, _081862EC
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081862F0
	cmp r1, r0
	bne _081862E0
	bl RecordedOpponentBufferExecCompleted
_081862E0:
	pop {r0}
	bx r0
	.align 2, 0
_081862E4: .4byte 0x020205AC
_081862E8: .4byte 0x02023E88
_081862EC: .4byte 0x02023D08
_081862F0: .4byte 0x08007141
	thumb_func_end sub_081862BC

	thumb_func_start sub_081862F4
sub_081862F4: @ 0x081862F4
	push {r4, r5, r6, lr}
	ldr r5, _0818634C
	ldr r6, _08186350
	ldr r4, _08186354
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r2, r0, #2
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _08186358
	cmp r1, r0
	bne _08186346
	adds r0, r2, r5
	ldrh r0, [r0, #6]
	bl FreeTrainerFrontPicPalette
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl FreeSpriteOamMatrix
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	bl RecordedOpponentBufferExecCompleted
_08186346:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818634C: .4byte 0x020205AC
_08186350: .4byte 0x02023E88
_08186354: .4byte 0x02023D08
_08186358: .4byte 0x08007141
	thumb_func_end sub_081862F4

	thumb_func_start sub_0818635C
sub_0818635C: @ 0x0818635C
	push {r4, lr}
	ldr r4, _0818639C
	ldr r1, [r4]
	ldr r3, _081863A0
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
	bne _08186394
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #9]
	bl RecordedOpponentBufferExecCompleted
_08186394:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818639C: .4byte 0x02024174
_081863A0: .4byte 0x02023D08
	thumb_func_end sub_0818635C

	thumb_func_start sub_081863A4
sub_081863A4: @ 0x081863A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov sb, r0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081863D0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08186424
	ldr r0, _0818640C
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08186424
_081863D0:
	ldr r4, _08186410
	ldr r0, _08186414
	ldr r2, _08186418
	ldrb r3, [r2]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0818641C
	mov r8, r2
	cmp r1, r0
	bne _08186490
	ldr r0, _08186420
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _08186490
	b _08186496
	.align 2, 0
_0818640C: .4byte 0x02022C90
_08186410: .4byte 0x020205AC
_08186414: .4byte 0x03005AD0
_08186418: .4byte 0x02023D08
_0818641C: .4byte 0x08007141
_08186420: .4byte 0x02023E88
_08186424:
	ldr r6, _08186574
	ldr r7, _08186578
	ldr r2, _0818657C
	ldrb r3, [r2]
	adds r0, r3, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r6, #0
	adds r5, #0x1c
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, _08186580
	mov r8, r2
	cmp r4, r0
	bne _08186490
	movs r0, #2
	adds r2, r3, #0
	eors r2, r0
	adds r0, r2, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r4
	bne _08186490
	ldr r4, _08186584
	adds r0, r3, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _08186490
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _08186490
	movs r1, #1
	mov sb, r1
_08186490:
	mov r2, sb
	cmp r2, #0
	beq _08186566
_08186496:
	mov r6, r8
	ldrb r0, [r6]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _08186542
	ldr r0, _08186588
	mov ip, r0
	ldr r0, [r0]
	ldrb r2, [r6]
	ldr r5, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r5
	ldrb r1, [r4, #1]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08186566
	movs r7, #2
	adds r1, r7, #0
	eors r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r0, #1]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08186566
	ldrb r1, [r4]
	movs r3, #0x7f
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r4]
	mov r1, ip
	ldr r0, [r1]
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
	mov r0, ip
	ldr r2, [r0]
	ldrb r0, [r6]
	adds r1, r7, #0
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	mov r1, ip
	ldr r2, [r1]
	ldrb r0, [r6]
	adds r1, r7, #0
	eors r1, r0
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	ands r4, r1
	strb r4, [r0, #1]
	ldr r4, _0818658C
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
_08186542:
	ldr r0, _08186588
	ldr r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #9]
	ldr r1, _08186590
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08186594
	str r1, [r0]
_08186566:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08186574: .4byte 0x020205AC
_08186578: .4byte 0x03005AD0
_0818657C: .4byte 0x02023D08
_08186580: .4byte 0x08007141
_08186584: .4byte 0x02023E88
_08186588: .4byte 0x02024174
_0818658C: .4byte 0x000027F9
_08186590: .4byte 0x03005AC0
_08186594: .4byte 0x0818635D
	thumb_func_end sub_081863A4

	thumb_func_start sub_08186598
sub_08186598: @ 0x08186598
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov sb, r0
	mov r8, r0
	ldr r4, _08186750
	ldr r0, [r4]
	ldr r7, _08186754
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
	bne _081865D8
	ldr r0, _08186758
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0818675C
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_081865D8:
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
	bne _0818660A
	ldr r0, _08186758
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0818675C
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_0818660A:
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
	bne _081866DA
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
	bne _081866DA
	ldrb r1, [r4, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081866C0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08186690
	ldr r0, _08186760
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08186690
	ldr r4, _08186764
	ldrb r0, [r7]
	adds r1, r6, #0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08186758
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0818675C
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
_08186690:
	ldr r5, _08186764
	ldr r4, _08186754
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08186758
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0818675C
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_08076320
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_081866C0:
	ldr r0, _08186750
	ldr r2, [r0]
	ldr r0, _08186754
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
_081866DA:
	ldr r5, _08186750
	ldr r0, [r5]
	ldr r4, _08186754
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
	bne _08186796
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
	bne _08186796
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08186796
	ldr r0, [r5]
	ldrb r2, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08186778
	ldr r0, _08186760
	ldr r0, [r0]
	movs r1, #0x42
	ands r0, r1
	cmp r0, #0x42
	bne _0818676C
	adds r0, r2, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08186778
	ldr r0, _08186768
	bl m4aMPlayContinue
	b _08186778
	.align 2, 0
_08186750: .4byte 0x02024174
_08186754: .4byte 0x02023D08
_08186758: .4byte 0x02023D12
_0818675C: .4byte 0x020243E8
_08186760: .4byte 0x02022C90
_08186764: .4byte 0x03005AD0
_08186768: .4byte 0x030074D0
_0818676C:
	ldr r0, _081867D4
	ldr r1, _081867D8
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
_08186778:
	ldr r0, _081867DC
	ldr r2, [r0]
	ldr r0, _081867E0
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
_08186796:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081867F4
	ldr r2, _081867E4
	ldr r0, _081867E8
	ldr r1, _081867E0
	ldrb r4, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r3, [r0]
	ldr r0, _081867EC
	cmp r3, r0
	bne _08186852
	ldr r0, _081867F0
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r3
	bne _08186852
	b _0818684E
	.align 2, 0
_081867D4: .4byte 0x030074D0
_081867D8: .4byte 0x0000FFFF
_081867DC: .4byte 0x02024174
_081867E0: .4byte 0x02023D08
_081867E4: .4byte 0x020205AC
_081867E8: .4byte 0x03005ADC
_081867EC: .4byte 0x08007141
_081867F0: .4byte 0x02023E88
_081867F4:
	ldr r2, _08186948
	ldr r7, _0818694C
	ldr r0, _08186950
	ldrb r3, [r0]
	adds r0, r3, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r4, [r0]
	ldr r0, _08186954
	cmp r4, r0
	bne _08186852
	ldr r6, _08186958
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	cmp r5, r4
	bne _08186852
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
	bne _08186852
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _08186852
_0818684E:
	movs r0, #1
	mov r8, r0
_08186852:
	mov r0, sb
	cmp r0, #0
	beq _0818693C
	mov r0, r8
	cmp r0, #0
	beq _0818693C
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081868B6
	ldr r0, _0818695C
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _081868B6
	ldr r1, _0818694C
	ldr r5, _08186950
	ldrb r0, [r5]
	movs r4, #2
	eors r0, r4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08186948
	adds r0, r0, r1
	bl DestroySprite
	ldrb r0, [r5]
	eors r4, r0
	ldr r1, _08186960
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08186964
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
_081868B6:
	ldr r1, _0818694C
	ldr r4, _08186950
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08186948
	adds r0, r0, r1
	bl DestroySprite
	ldrb r5, [r4]
	ldr r1, _08186960
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08186964
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	bl SetBattlerShadowSpriteCallback
	ldr r3, _08186968
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
	ldr r1, _0818696C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08186970
	str r1, [r0]
_0818693C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08186948: .4byte 0x020205AC
_0818694C: .4byte 0x03005ADC
_08186950: .4byte 0x02023D08
_08186954: .4byte 0x08007141
_08186958: .4byte 0x02023E88
_0818695C: .4byte 0x02022C90
_08186960: .4byte 0x02023D12
_08186964: .4byte 0x020243E8
_08186968: .4byte 0x02024174
_0818696C: .4byte 0x03005AC0
_08186970: .4byte 0x081863A5
	thumb_func_end sub_08186598

	thumb_func_start sub_08186974
sub_08186974: @ 0x08186974
	push {r4, r5, r6, r7, lr}
	ldr r4, _081869D0
	ldr r0, _081869D4
	ldr r7, _081869D8
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r2, r0, #2
	adds r0, r4, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _081869DC
	cmp r1, r0
	bne _08186A26
	adds r0, r2, r4
	movs r1, #0x24
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08186A26
	ldr r6, _081869E0
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r4, r3, #1
	adds r0, r4, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r5, [r2]
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _081869EC
	ldr r0, _081869E4
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081869E8
	adds r1, r1, r0
	adds r0, r3, #0
	bl sub_08172CD4
	b _08186A26
	.align 2, 0
_081869D0: .4byte 0x020205AC
_081869D4: .4byte 0x02023E88
_081869D8: .4byte 0x02023D08
_081869DC: .4byte 0x08007141
_081869E0: .4byte 0x02024174
_081869E4: .4byte 0x02023D12
_081869E8: .4byte 0x020243E8
_081869EC:
	ldrb r1, [r2, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08186A26
	movs r0, #0x7f
	ands r0, r5
	strb r0, [r2]
	ldr r0, [r6]
	ldrb r2, [r7]
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
	ldr r4, _08186A2C
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	bl RecordedOpponentBufferExecCompleted
_08186A26:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08186A2C: .4byte 0x000027F9
	thumb_func_end sub_08186974

	thumb_func_start sub_08186A30
sub_08186A30: @ 0x08186A30
	push {r4, r5, r6, lr}
	ldr r6, _08186A70
	ldrb r0, [r6]
	ldr r5, _08186A74
	adds r1, r0, r5
	ldrb r1, [r1]
	movs r2, #0
	movs r3, #0
	bl MoveBattleBar
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08186A78
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r2, #0
	bl sub_080726F4
	b _08186A7C
	.align 2, 0
_08186A70: .4byte 0x02023D08
_08186A74: .4byte 0x03005AD0
_08186A78:
	bl RecordedOpponentBufferExecCompleted
_08186A7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08186A30

	thumb_func_start sub_08186A84
sub_08186A84: @ 0x08186A84
	push {lr}
	ldr r2, _08186AB8
	ldr r0, _08186ABC
	ldr r1, _08186AC0
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08186AB2
	ldr r0, _08186AC4
	adds r0, r3, r0
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl RecordedOpponentBufferExecCompleted
_08186AB2:
	pop {r0}
	bx r0
	.align 2, 0
_08186AB8: .4byte 0x020205AC
_08186ABC: .4byte 0x02023E88
_08186AC0: .4byte 0x02023D08
_08186AC4: .4byte 0x03005AD0
	thumb_func_end sub_08186A84

	thumb_func_start sub_08186AC8
sub_08186AC8: @ 0x08186AC8
	push {r4, r5, r6, lr}
	ldr r0, _08186B28
	ldr r0, [r0]
	ldr r6, _08186B2C
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
	bne _08186B22
	ldr r5, _08186B30
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08186B34
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
	ldrb r0, [r6]
	bl HideBattlerShadowSprite
	ldr r1, _08186B38
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl RecordedOpponentBufferExecCompleted
_08186B22:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08186B28: .4byte 0x02024174
_08186B2C: .4byte 0x02023D08
_08186B30: .4byte 0x02023E88
_08186B34: .4byte 0x020205AC
_08186B38: .4byte 0x03005AD0
	thumb_func_end sub_08186AC8

	thumb_func_start sub_08186B3C
sub_08186B3C: @ 0x08186B3C
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08186B4E
	bl RecordedOpponentBufferExecCompleted
_08186B4E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08186B3C

	thumb_func_start sub_08186B54
sub_08186B54: @ 0x08186B54
	push {r4, lr}
	ldr r1, _08186B90
	ldr r0, _08186B94
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _08186B98
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _08186BA0
	movs r3, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08186B9C
	strb r3, [r0]
	bl RecordedOpponentBufferExecCompleted
	b _08186BCA
	.align 2, 0
_08186B90: .4byte 0x02023E88
_08186B94: .4byte 0x02023D08
_08186B98: .4byte 0x020205AC
_08186B9C: .4byte 0x0202415D
_08186BA0:
	ldrh r0, [r4, #0x30]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08186BC4
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
_08186BC4:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_08186BCA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08186B54

	thumb_func_start sub_08186BD0
sub_08186BD0: @ 0x08186BD0
	push {r4, lr}
	ldr r2, _08186C24
	ldr r0, _08186C28
	ldr r4, _08186C2C
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08186C30
	cmp r1, r0
	bne _08186C1C
	ldr r0, _08186C34
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08186C10
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
_08186C10:
	ldr r0, _08186C38
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _08186C3C
	str r0, [r1]
_08186C1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08186C24: .4byte 0x020205AC
_08186C28: .4byte 0x03005AD0
_08186C2C: .4byte 0x02023D08
_08186C30: .4byte 0x08007141
_08186C34: .4byte 0x02024174
_08186C38: .4byte 0x03005AC0
_08186C3C: .4byte 0x08186C41
	thumb_func_end sub_08186BD0

	thumb_func_start sub_08186C40
sub_08186C40: @ 0x08186C40
	push {r4, lr}
	ldr r0, _08186CA0
	ldr r0, [r0]
	ldr r4, _08186CA4
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
	bne _08186C9A
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08186C9A
	ldr r2, _08186CA8
	ldr r1, _08186CAC
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08186CB0
	cmp r1, r0
	beq _08186C8A
	ldr r0, _08186CB4
	cmp r1, r0
	bne _08186C9A
_08186C8A:
	ldr r0, _08186CB8
	ldr r1, _08186CBC
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	bl RecordedOpponentBufferExecCompleted
_08186C9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08186CA0: .4byte 0x02024174
_08186CA4: .4byte 0x02023D08
_08186CA8: .4byte 0x020205AC
_08186CAC: .4byte 0x02023E88
_08186CB0: .4byte 0x08007141
_08186CB4: .4byte 0x080394FD
_08186CB8: .4byte 0x030074D0
_08186CBC: .4byte 0x0000FFFF
	thumb_func_end sub_08186C40

	thumb_func_start sub_08186CC0
sub_08186CC0: @ 0x08186CC0
	push {r4, r5, r6, r7, lr}
	ldr r4, _08186D84
	ldr r0, [r4]
	ldr r5, _08186D88
	ldrb r2, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r1, [r3, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08186D7C
	ldr r7, _08186D8C
	ldr r6, _08186D90
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08186D94
	cmp r1, r0
	bne _08186D7C
	ldrb r1, [r3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
	ldr r0, [r4]
	ldrb r2, [r5]
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
	ldr r4, _08186D98
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	movs r1, #0
	bl StartSpriteAnim
	ldr r4, _08186D9C
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08186DA0
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08186DA4
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	bl sub_08076320
	ldrb r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldrb r0, [r5]
	bl CopyBattleSpriteInvisibility
	ldr r1, _08186DA8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08186DAC
	str r1, [r0]
_08186D7C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08186D84: .4byte 0x02024174
_08186D88: .4byte 0x02023D08
_08186D8C: .4byte 0x020205AC
_08186D90: .4byte 0x02023E88
_08186D94: .4byte 0x08007141
_08186D98: .4byte 0x000027F9
_08186D9C: .4byte 0x03005AD0
_08186DA0: .4byte 0x02023D12
_08186DA4: .4byte 0x020243E8
_08186DA8: .4byte 0x03005AC0
_08186DAC: .4byte 0x08186BD1
	thumb_func_end sub_08186CC0

	thumb_func_start sub_08186DB0
sub_08186DB0: @ 0x08186DB0
	push {r4, r5, r6, lr}
	ldr r6, _08186E54
	ldr r0, [r6]
	ldr r5, _08186E58
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
	bne _08186DE2
	ldr r0, _08186E5C
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _08186E60
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_08186DE2:
	ldr r4, _08186E64
	ldr r0, _08186E68
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
	ldr r0, _08186E6C
	cmp r1, r0
	bne _08186E4C
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
	bne _08186E4C
	adds r0, r3, r4
	bl DestroySprite
	ldrb r4, [r5]
	ldr r1, _08186E5C
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08186E60
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
	ldr r1, _08186E70
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08186E74
	str r1, [r0]
_08186E4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08186E54: .4byte 0x02024174
_08186E58: .4byte 0x02023D08
_08186E5C: .4byte 0x02023D12
_08186E60: .4byte 0x020243E8
_08186E64: .4byte 0x020205AC
_08186E68: .4byte 0x03005ADC
_08186E6C: .4byte 0x08007141
_08186E70: .4byte 0x03005AC0
_08186E74: .4byte 0x08186CC1
	thumb_func_end sub_08186DB0

	thumb_func_start sub_08186E78
sub_08186E78: @ 0x08186E78
	push {lr}
	ldr r0, _08186EA0
	ldr r2, [r0]
	ldr r0, _08186EA4
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
	bne _08186E9A
	bl RecordedOpponentBufferExecCompleted
_08186E9A:
	pop {r0}
	bx r0
	.align 2, 0
_08186EA0: .4byte 0x02024174
_08186EA4: .4byte 0x02023D08
	thumb_func_end sub_08186E78

	thumb_func_start sub_08186EA8
sub_08186EA8: @ 0x08186EA8
	push {lr}
	ldr r0, _08186ED0
	ldr r2, [r0]
	ldr r0, _08186ED4
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
	bne _08186ECA
	bl RecordedOpponentBufferExecCompleted
_08186ECA:
	pop {r0}
	bx r0
	.align 2, 0
_08186ED0: .4byte 0x02024174
_08186ED4: .4byte 0x02023D08
	thumb_func_end sub_08186EA8

