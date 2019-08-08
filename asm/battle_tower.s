.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08161E88
sub_08161E88: @ 0x08161E88
	push {lr}
	ldr r1, _08161EA0
	ldr r0, _08161EA4
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end sub_08161E88

	thumb_func_start nullsub_61
nullsub_61: @ 0x08161E9C
	bx r0
	.align 2, 0
_08161EA0: .4byte 0x085BE8B0
_08161EA4: .4byte 0x02037280
	thumb_func_end nullsub_61

	thumb_func_start sub_08161EA8
sub_08161EA8: @ 0x08161EA8
	push {r4, r5, r6, r7, lr}
	ldr r4, _08161F48
	ldr r0, [r4]
	ldr r1, _08161F4C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _08161F50
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r4]
	ldr r2, _08161F54
	adds r0, r0, r2
	movs r7, #0
	movs r1, #1
	strb r1, [r0]
	ldr r1, [r4]
	adds r2, #0xa
	adds r0, r1, r2
	strh r7, [r0]
	ldr r0, _08161F4C
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	ldr r2, _08161F4C
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	bl sub_081A3864
	ldr r4, [r4]
	ldr r0, _08161F58
	adds r3, r4, r0
	ldr r2, _08161F5C
	lsls r1, r5, #2
	lsls r0, r6, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r0, [r3]
	ldr r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08161F22
	lsls r0, r5, #1
	lsls r1, r6, #2
	adds r0, r0, r1
	movs r2, #0xce
	lsls r2, r2, #4
	adds r1, r4, r2
	adds r1, r1, r0
	strh r7, [r1]
_08161F22:
	bl ValidateBattleTowerRecordChecksums
	ldr r0, _08161F60
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	ldr r0, _08161F64
	strh r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08161F48: .4byte 0x03005AF0
_08161F4C: .4byte 0x00000CA9
_08161F50: .4byte 0x000040CE
_08161F54: .4byte 0x00000CA8
_08161F58: .4byte 0x00000CDC
_08161F5C: .4byte 0x085BE8F0
_08161F60: .4byte 0x03005AEC
_08161F64: .4byte 0x0203886A
	thumb_func_end sub_08161EA8

	thumb_func_start sub_08161F68
sub_08161F68: @ 0x08161F68
	push {r4, r5, r6, lr}
	ldr r5, _08161F98
	ldr r0, [r5]
	ldr r4, _08161F9C
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r6, r0, #0x1e
	ldr r0, _08161FA0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08161FA4
	ldrh r0, [r0]
	cmp r0, #1
	beq _08161FA8
	cmp r0, #1
	ble _08161FFC
	cmp r0, #2
	beq _08161FBC
	cmp r0, #3
	beq _08161FEC
	b _08161FFC
	.align 2, 0
_08161F98: .4byte 0x03005AF0
_08161F9C: .4byte 0x00000CA9
_08161FA0: .4byte 0x000040CE
_08161FA4: .4byte 0x02037282
_08161FA8:
	adds r0, r6, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl GetCurrentBattleTowerWinStreak
	ldr r1, _08161FB8
	strh r0, [r1]
	b _08161FFC
	.align 2, 0
_08161FB8: .4byte 0x02037290
_08161FBC:
	ldr r4, _08161FE0
	ldr r2, [r5]
	ldr r0, _08161FE4
	adds r2, r2, r0
	ldr r3, _08161FE8
	lsls r0, r6, #2
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	strh r0, [r4]
	b _08161FFC
	.align 2, 0
_08161FE0: .4byte 0x02037290
_08161FE4: .4byte 0x00000CDC
_08161FE8: .4byte 0x085BE8F0
_08161FEC:
	ldr r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	ldr r2, _08162004
	adds r1, r1, r2
	strb r0, [r1]
_08161FFC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08162004: .4byte 0x00000D07
	thumb_func_end sub_08161F68

	thumb_func_start sub_08162008
sub_08162008: @ 0x08162008
	push {r4, r5, r6, r7, lr}
	ldr r6, _08162038
	ldr r0, [r6]
	ldr r7, _0816203C
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _08162040
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08162044
	ldrh r0, [r0]
	cmp r0, #1
	beq _08162048
	cmp r0, #1
	ble _081620C8
	cmp r0, #2
	beq _08162064
	cmp r0, #3
	beq _081620B8
	b _081620C8
	.align 2, 0
_08162038: .4byte 0x03005AF0
_0816203C: .4byte 0x00000CA9
_08162040: .4byte 0x000040CE
_08162044: .4byte 0x02037282
_08162048:
	ldr r2, [r6]
	lsls r0, r5, #1
	lsls r1, r4, #2
	adds r0, r0, r1
	movs r1, #0xce
	lsls r1, r1, #4
	adds r2, r2, r1
	adds r2, r2, r0
	ldr r0, _08162060
	ldrh r0, [r0]
	strh r0, [r2]
	b _081620C8
	.align 2, 0
_08162060: .4byte 0x02037284
_08162064:
	ldr r0, _08162088
	ldrh r0, [r0]
	cmp r0, #0
	beq _08162094
	ldr r2, [r6]
	ldr r0, _0816208C
	adds r2, r2, r0
	ldr r3, _08162090
	lsls r1, r5, #2
	lsls r0, r4, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r2]
	ldr r1, [r1]
	orrs r0, r1
	str r0, [r2]
	b _081620C8
	.align 2, 0
_08162088: .4byte 0x02037284
_0816208C: .4byte 0x00000CDC
_08162090: .4byte 0x085BE8F0
_08162094:
	ldr r2, [r6]
	ldr r1, _081620B0
	adds r2, r2, r1
	ldr r3, _081620B4
	lsls r1, r5, #2
	lsls r0, r4, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r2]
	ldr r1, [r1]
	ands r0, r1
	str r0, [r2]
	b _081620C8
	.align 2, 0
_081620B0: .4byte 0x00000CDC
_081620B4: .4byte 0x085BE910
_081620B8:
	ldr r1, [r6]
	adds r0, r1, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	ldr r2, _081620D0
	adds r1, r1, r2
	strb r0, [r1]
_081620C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081620D0: .4byte 0x00000D07
	thumb_func_end sub_08162008

	thumb_func_start sub_081620D4
sub_081620D4: @ 0x081620D4
	push {r4, r5, lr}
	ldr r0, _08162124
	ldrh r1, [r0]
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r1, r0
	bne _081620EE
	ldr r0, _08162128
	ldr r0, [r0]
	ldr r1, _0816212C
	adds r0, r0, r1
	bl ClearEReaderTrainer
_081620EE:
	ldr r5, _08162128
	ldr r0, [r5]
	ldr r1, _08162130
	adds r2, r0, r1
	ldrh r1, [r2]
	ldr r0, _08162134
	cmp r1, r0
	bhi _08162102
	adds r0, r1, #1
	strh r0, [r2]
_08162102:
	ldr r1, [r5]
	ldr r4, _08162138
	adds r1, r1, r4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bl SaveCurrentWinStreak
	ldr r1, _0816213C
	ldr r0, [r5]
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08162124: .4byte 0x0203886A
_08162128: .4byte 0x03005AF0
_0816212C: .4byte 0x00000BEC
_08162130: .4byte 0x00000D04
_08162134: .4byte 0x0000270E
_08162138: .4byte 0x00000CB2
_0816213C: .4byte 0x02037290
	thumb_func_end sub_081620D4

	thumb_func_start ChooseSpecialBattleTowerTrainer
ChooseSpecialBattleTowerTrainer: @ 0x08162140
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	movs r0, #0
	str r0, [sp, #0x24]
	ldr r4, _081622B4
	ldr r0, [r4]
	ldr r1, _081622B8
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	mov sl, r0
	ldr r0, _081622BC
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	ldr r0, _081622C0
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816217A
	b _081622B0
_0816217A:
	mov r0, sl
	ldr r1, [sp, #0x2c]
	bl GetCurrentBattleTowerWinStreak
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	movs r7, #0
	mov r2, sp
	str r2, [sp, #0x34]
_0816218E:
	movs r3, #0xec
	adds r0, r7, #0
	muls r0, r3, r0
	movs r4, #0xe7
	lsls r4, r4, #3
	adds r0, r0, r4
	ldr r5, _081622B4
	ldr r1, [r5]
	movs r2, #0
	mov r8, r2
	mov sb, r2
	movs r5, #0
	adds r3, r7, #1
	str r3, [sp, #0x30]
	adds r1, r1, r0
_081621AC:
	ldm r1!, {r0}
	mov r4, r8
	orrs r4, r0
	mov r8, r4
	add sb, r0
	adds r5, #1
	cmp r5, #0x39
	bls _081621AC
	movs r6, #0
	movs r5, #0
	movs r0, #0xec
	adds r2, r7, #0
	muls r2, r0, r2
_081621C6:
	ldr r3, _081622B4
	ldr r1, [r3]
	movs r0, #0x2c
	muls r0, r5, r0
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r4, _081622C4
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, #0
	beq _081621F8
	movs r0, #0xef
	lsls r0, r0, #3
	adds r4, r1, r0
	mov r0, sl
	str r2, [sp, #0x38]
	bl GetFrontierEnemyMonLevel
	ldrb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x38]
	cmp r1, r0
	bhi _081621F8
	adds r6, #1
_081621F8:
	adds r5, #1
	cmp r5, #3
	ble _081621C6
	ldr r0, _081622C8
	ldr r1, [sp, #0x2c]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r6, r0
	blt _08162252
	ldr r3, _081622B4
	ldr r2, [r3]
	movs r4, #0xec
	adds r3, r7, #0
	muls r3, r4, r3
	adds r1, r2, r3
	ldr r5, _081622CC
	adds r0, r1, r5
	ldrh r0, [r0]
	ldr r4, [sp, #0x28]
	cmp r0, r4
	bne _08162252
	subs r5, #2
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, sl
	bne _08162252
	mov r0, r8
	cmp r0, #0
	beq _08162252
	movs r1, #0x82
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, sb
	bne _08162252
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r3, [sp, #0x34]
	stm r3!, {r0}
	str r3, [sp, #0x34]
	ldr r4, [sp, #0x24]
	adds r4, #1
	str r4, [sp, #0x24]
_08162252:
	ldr r7, [sp, #0x30]
	cmp r7, #4
	ble _0816218E
	ldr r5, [sp, #0x2c]
	cmp r5, #0
	bne _081622AA
	bl ValidateApprenticesChecksums
	movs r7, #0
	ldr r0, _081622B4
	ldr r0, [r0]
	ldr r4, _081622D0
	adds r2, r0, #0
	adds r2, #0xdc
	ldr r1, [sp, #0x24]
	lsls r0, r1, #2
	mov r5, sp
	adds r3, r0, r5
_08162276:
	ldrb r0, [r2]
	lsls r1, r0, #0x19
	lsrs r0, r1, #0x1e
	cmp r0, #0
	beq _081622A2
	ldrb r0, [r2, #1]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r5, [sp, #0x28]
	cmp r0, r5
	bne _081622A2
	lsrs r0, r1, #0x1e
	subs r0, #1
	cmp r0, sl
	bne _081622A2
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r7, r1
	stm r3!, {r0}
	ldr r5, [sp, #0x24]
	adds r5, #1
	str r5, [sp, #0x24]
_081622A2:
	adds r2, #0x44
	adds r7, #1
	cmp r7, #3
	ble _08162276
_081622AA:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _081622D4
_081622B0:
	movs r0, #0
	b _081622EE
	.align 2, 0
_081622B4: .4byte 0x03005AF0
_081622B8: .4byte 0x00000CA9
_081622BC: .4byte 0x000040CE
_081622C0: .4byte 0x000040CF
_081622C4: .4byte 0x0000076C
_081622C8: .4byte 0x085BE93A
_081622CC: .4byte 0x0000073A
_081622D0: .4byte 0x085BE930
_081622D4:
	ldr r4, _08162300
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #0x24]
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r4]
	movs r0, #1
_081622EE:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08162300: .4byte 0x0203886A
	thumb_func_end ChooseSpecialBattleTowerTrainer

	thumb_func_start ChooseNextBattleTowerTrainer
ChooseNextBattleTowerTrainer: @ 0x08162304
	push {r4, r5, r6, r7, lr}
	ldr r6, _08162320
	ldr r0, [r6]
	ldr r1, _08162324
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _08162328
	bl sub_08165C24
	b _08162444
	.align 2, 0
_08162320: .4byte 0x03005AF0
_08162324: .4byte 0x00000CA9
_08162328:
	ldr r0, _08162388
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl GetCurrentFacilityWinStreak
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	bl SetFacilityPtrsGetLevel
	subs r4, #2
	cmp r4, #1
	bhi _0816239C
	ldr r1, [r6]
	ldr r2, _0816238C
	adds r0, r1, r2
	ldrh r3, [r0]
	ldr r2, _08162390
	lsls r0, r3, #2
	ldr r4, _08162394
	adds r1, r1, r4
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r4, _08162398
	lsls r0, r3, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r2]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	ldrh r0, [r4]
	movs r1, #1
	bl SetBattleFacilityTrainerGfxId
	b _08162444
	.align 2, 0
_08162388: .4byte 0x000040CE
_0816238C: .4byte 0x00000CB2
_08162390: .4byte 0x0203886A
_08162394: .4byte 0x00000CB4
_08162398: .4byte 0x0203886C
_0816239C:
	bl ChooseSpecialBattleTowerTrainer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081623C8
	ldr r4, _081623C0
	ldrh r0, [r4]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	ldr r1, [r6]
	ldr r2, _081623C4
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r2, #2
	b _0816243C
	.align 2, 0
_081623C0: .4byte 0x0203886A
_081623C4: .4byte 0x00000CB2
_081623C8:
	lsls r7, r5, #0x18
	adds r5, r6, #0
	ldr r6, _0816244C
_081623CE:
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsrs r0, r7, #0x18
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r4, #0
	ldr r1, [r5]
	adds r0, r1, r6
	ldrh r0, [r0]
	cmp r4, r0
	bge _08162410
	ldr r2, _08162450
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, r3
	beq _08162410
	ldr r0, _08162454
	ldr r1, [r0]
	subs r2, #2
	adds r0, r1, r2
	ldrh r2, [r0]
	ldr r0, _08162450
	adds r1, r1, r0
_08162402:
	adds r1, #2
	adds r4, #1
	cmp r4, r2
	bge _08162410
	ldrh r0, [r1]
	cmp r0, r3
	bne _08162402
_08162410:
	ldr r0, [r5]
	ldr r1, _0816244C
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _081623CE
	ldr r4, _08162458
	strh r3, [r4]
	ldrh r0, [r4]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	ldr r0, _08162454
	ldr r1, [r0]
	ldr r2, _0816244C
	adds r0, r1, r2
	ldrh r2, [r0]
	adds r0, r2, #1
	cmp r0, #6
	bgt _08162444
	lsls r0, r2, #1
	ldr r2, _08162450
_0816243C:
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r4]
	strh r0, [r1]
_08162444:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816244C: .4byte 0x00000CB2
_08162450: .4byte 0x00000CB4
_08162454: .4byte 0x03005AF0
_08162458: .4byte 0x0203886A
	thumb_func_end ChooseNextBattleTowerTrainer

	thumb_func_start sub_0816245C
sub_0816245C: @ 0x0816245C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, #7
	bhi _08162498
	cmp r1, #6
	bne _08162484
	ldr r2, _08162480
	lsls r1, r0, #2
	adds r0, r2, #2
	adds r0, r1, r0
	adds r1, r1, r2
	ldrh r0, [r0]
	ldrh r4, [r1]
	b _0816249E
	.align 2, 0
_08162480: .4byte 0x085BE95E
_08162484:
	ldr r2, _08162494
	lsls r1, r3, #2
	adds r0, r2, #2
	adds r0, r1, r0
	adds r1, r1, r2
	ldrh r0, [r0]
	ldrh r4, [r1]
	b _0816249E
	.align 2, 0
_08162494: .4byte 0x085BE93E
_08162498:
	ldr r1, _081624C4
	ldrh r0, [r1, #0x1e]
	ldrh r4, [r1, #0x1c]
_0816249E:
	subs r0, r0, r4
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __umodsi3
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081624C4: .4byte 0x085BE93E
	thumb_func_end sub_0816245C

	thumb_func_start sub_081624C8
sub_081624C8: @ 0x081624C8
	push {r4, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, #7
	bhi _08162508
	cmp r1, #6
	bne _081624E8
	ldr r1, _081624E4
	lsls r2, r0, #2
	b _081624EC
	.align 2, 0
_081624E4: .4byte 0x085BE95E
_081624E8:
	ldr r1, _08162504
	lsls r2, r2, #2
_081624EC:
	adds r0, r1, #2
	adds r0, r2, r0
	adds r2, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r0, r1
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2]
	b _08162518
	.align 2, 0
_08162504: .4byte 0x085BE93E
_08162508:
	ldr r0, _08162524
	ldrh r1, [r0, #0x1e]
	ldrh r2, [r0, #0x1c]
	subs r1, r1, r2
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r0, #0x1c]
_08162518:
	strh r0, [r4]
	strb r1, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08162524: .4byte 0x085BE93E
	thumb_func_end sub_081624C8

	thumb_func_start SetBattleFacilityTrainerGfxId
SetBattleFacilityTrainerGfxId: @ 0x08162528
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r6, r4, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl SetFacilityPtrsGetLevel
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r4, r0
	bne _08162550
	ldr r0, _08162548
	ldr r0, [r0]
	ldr r1, _0816254C
	b _0816258E
	.align 2, 0
_08162548: .4byte 0x03005AF0
_0816254C: .4byte 0x00000BED
_08162550:
	ldr r0, _0816255C
	cmp r4, r0
	bne _08162560
	bl SetFrontierBrainEventObjGfx_2
	b _08162694
	.align 2, 0
_0816255C: .4byte 0x000003FE
_08162560:
	ldr r0, _08162570
	cmp r4, r0
	bhi _08162578
	ldr r0, _08162574
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r4, r0
	b _0816258E
	.align 2, 0
_08162570: .4byte 0x0000012B
_08162574: .4byte 0x0203B954
_08162578:
	ldr r0, _08162594
	cmp r4, r0
	bhi _081625A4
	ldr r0, _08162598
	ldr r0, [r0]
	ldr r1, _0816259C
	adds r2, r4, r1
	movs r1, #0xec
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, _081625A0
_0816258E:
	adds r0, r0, r1
	ldrb r2, [r0]
	b _081625C8
	.align 2, 0
_08162594: .4byte 0x0000018F
_08162598: .4byte 0x03005AF0
_0816259C: .4byte 0xFFFFFED4
_081625A0: .4byte 0x00000739
_081625A4:
	ldr r3, _081625F8
	ldr r0, _081625FC
	ldr r1, [r0]
	ldr r0, _08162600
	adds r2, r6, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xdc
	ldrb r1, [r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r3
	ldrb r2, [r0, #0xa]
_081625C8:
	movs r1, #0
	ldr r3, _08162604
	ldrb r0, [r3]
	cmp r0, r2
	beq _081625E0
_081625D2:
	adds r1, #1
	cmp r1, #0x1d
	bhi _081625E0
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _081625D2
_081625E0:
	cmp r1, #0x1e
	beq _0816260C
	ldr r0, _08162608
	adds r0, r1, r0
	ldrb r1, [r0]
	cmp r5, #1
	beq _08162650
	cmp r5, #1
	ble _0816263A
	cmp r5, #0xf
	bne _0816263A
	b _0816265C
	.align 2, 0
_081625F8: .4byte 0x085DC21C
_081625FC: .4byte 0x03005AF0
_08162600: .4byte 0xFFFFFE70
_08162604: .4byte 0x085BBE20
_08162608: .4byte 0x085BBE52
_0816260C:
	movs r1, #0
	ldr r3, _08162644
	ldrb r0, [r3]
	cmp r0, r2
	beq _08162624
_08162616:
	adds r1, #1
	cmp r1, #0x13
	bhi _08162624
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08162616
_08162624:
	cmp r1, #0x14
	beq _08162668
	ldr r0, _08162648
	adds r0, r1, r0
	ldrb r1, [r0]
	cmp r5, #1
	beq _08162650
	cmp r5, #1
	ble _0816263A
	cmp r5, #0xf
	beq _0816265C
_0816263A:
	ldr r0, _0816264C
	bl VarSet
	b _08162694
	.align 2, 0
_08162644: .4byte 0x085BBE3E
_08162648: .4byte 0x085BBE70
_0816264C: .4byte 0x00004010
_08162650:
	ldr r0, _08162658
	bl VarSet
	b _08162694
	.align 2, 0
_08162658: .4byte 0x00004011
_0816265C:
	ldr r0, _08162664
	bl VarSet
	b _08162694
	.align 2, 0
_08162664: .4byte 0x0000401E
_08162668:
	cmp r5, #1
	beq _0816267C
	cmp r5, #1
	ble _08162674
	cmp r5, #0xf
	beq _0816268C
_08162674:
	ldr r0, _08162678
	b _0816267E
	.align 2, 0
_08162678: .4byte 0x00004010
_0816267C:
	ldr r0, _08162688
_0816267E:
	movs r1, #7
	bl VarSet
	b _08162694
	.align 2, 0
_08162688: .4byte 0x00004011
_0816268C:
	ldr r0, _0816269C
	movs r1, #7
	bl VarSet
_08162694:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816269C: .4byte 0x0000401E
	thumb_func_end SetBattleFacilityTrainerGfxId

	thumb_func_start SetEReaderTrainerGfxId
SetEReaderTrainerGfxId: @ 0x081626A0
	push {lr}
	movs r0, #0xfa
	lsls r0, r0, #1
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	pop {r0}
	bx r0
	thumb_func_end SetEReaderTrainerGfxId

	thumb_func_start GetBattleFacilityTrainerGfxId
GetBattleFacilityTrainerGfxId: @ 0x081626B0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	bl SetFacilityPtrsGetLevel
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r4, r0
	bne _081626D4
	ldr r0, _081626CC
	ldr r0, [r0]
	ldr r1, _081626D0
	b _08162702
	.align 2, 0
_081626CC: .4byte 0x03005AF0
_081626D0: .4byte 0x00000BED
_081626D4:
	ldr r0, _081626E4
	cmp r4, r0
	bhi _081626EC
	ldr r0, _081626E8
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r4, r0
	b _08162702
	.align 2, 0
_081626E4: .4byte 0x0000012B
_081626E8: .4byte 0x0203B954
_081626EC:
	ldr r0, _08162708
	cmp r4, r0
	bhi _08162718
	ldr r0, _0816270C
	ldr r0, [r0]
	ldr r1, _08162710
	adds r2, r4, r1
	movs r1, #0xec
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, _08162714
_08162702:
	adds r0, r0, r1
	ldrb r2, [r0]
	b _0816273C
	.align 2, 0
_08162708: .4byte 0x0000018F
_0816270C: .4byte 0x03005AF0
_08162710: .4byte 0xFFFFFED4
_08162714: .4byte 0x00000739
_08162718:
	ldr r3, _0816275C
	ldr r0, _08162760
	ldr r1, [r0]
	ldr r0, _08162764
	adds r2, r5, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xdc
	ldrb r1, [r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r3
	ldrb r2, [r0, #0xa]
_0816273C:
	movs r1, #0
	ldr r3, _08162768
	ldrb r0, [r3]
	cmp r0, r2
	beq _08162754
_08162746:
	adds r1, #1
	cmp r1, #0x1d
	bhi _08162754
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08162746
_08162754:
	cmp r1, #0x1e
	beq _08162770
	ldr r0, _0816276C
	b _08162796
	.align 2, 0
_0816275C: .4byte 0x085DC21C
_08162760: .4byte 0x03005AF0
_08162764: .4byte 0xFFFFFE70
_08162768: .4byte 0x085BBE20
_0816276C: .4byte 0x085BBE52
_08162770:
	movs r1, #0
	ldr r3, _08162790
	ldrb r0, [r3]
	cmp r0, r2
	beq _08162788
_0816277A:
	adds r1, #1
	cmp r1, #0x13
	bhi _08162788
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _0816277A
_08162788:
	cmp r1, #0x14
	bne _08162794
	movs r0, #7
	b _0816279A
	.align 2, 0
_08162790: .4byte 0x085BBE3E
_08162794:
	ldr r0, _081627A0
_08162796:
	adds r0, r1, r0
	ldrb r0, [r0]
_0816279A:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081627A0: .4byte 0x085BBE70
	thumb_func_end GetBattleFacilityTrainerGfxId

	thumb_func_start PutNewBattleTowerRecord
PutNewBattleTowerRecord: @ 0x081627A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	movs r1, #0
	mov r8, r1
	mov sl, r0
	movs r5, #0
	ldr r2, _08162828
	ldr r0, [r2]
	mov r4, sl
	ldrb r4, [r4, #0xc]
	str r4, [sp, #0x18]
	mov sb, r5
	movs r7, #4
	str r7, [sp, #0x1c]
	ldr r1, _0816282C
	adds r1, r1, r0
	mov ip, r1
_081627CE:
	movs r6, #0
	movs r3, #0
	mov r2, ip
	ldrb r0, [r2]
	ldr r4, [sp, #0x18]
	cmp r0, r4
	bne _081627FE
	mov r4, sb
	mov r2, sl
	adds r2, #0xc
_081627E2:
	adds r3, #1
	cmp r3, #3
	bgt _081627FE
	ldr r7, _08162828
	ldr r0, [r7]
	adds r1, r3, r4
	ldr r7, _0816282C
	adds r0, r0, r7
	adds r0, r0, r1
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _081627E2
_081627FE:
	cmp r3, #4
	bne _08162848
	movs r6, #0
	ldr r1, _08162828
	ldr r0, [r1]
	ldr r3, _08162830
	adds r0, r0, r3
	ldr r2, [sp, #0x1c]
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r4, sl
	ldrb r4, [r4, #8]
	cmp r0, r4
	bne _08162848
	adds r1, r0, #0
	mov r2, sb
	adds r2, #4
_08162820:
	cmp r1, #0xff
	bne _08162834
	movs r6, #7
	b _08162848
	.align 2, 0
_08162828: .4byte 0x03005AF0
_0816282C: .4byte 0x00000744
_08162830: .4byte 0x0000073C
_08162834:
	adds r6, #1
	cmp r6, #6
	bgt _08162848
	ldr r7, _08162874
	ldr r0, [r7]
	adds r0, r0, r3
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r1
	beq _08162820
_08162848:
	cmp r6, #7
	beq _0816285E
	movs r0, #0xec
	add sb, r0
	ldr r1, [sp, #0x1c]
	adds r1, #0xec
	str r1, [sp, #0x1c]
	add ip, r0
	adds r5, #1
	cmp r5, #4
	ble _081627CE
_0816285E:
	cmp r5, #4
	bgt _08162878
	ldr r2, _08162874
	ldr r0, [r2]
	movs r1, #0xec
	muls r1, r5, r1
	adds r0, r0, r1
	movs r4, #0xe7
	lsls r4, r4, #3
	adds r0, r0, r4
	b _081628B6
	.align 2, 0
_08162874: .4byte 0x03005AF0
_08162878:
	movs r5, #0
	ldr r7, _081628C0
	ldr r0, [r7]
	ldr r1, _081628C4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _081628A2
	adds r3, r7, #0
	adds r2, r1, #0
	movs r1, #0
_0816288E:
	adds r1, #0xec
	adds r5, #1
	cmp r5, #4
	bgt _081628C8
	ldr r0, [r3]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0
	bne _0816288E
_081628A2:
	cmp r5, #4
	bgt _081628C8
	ldr r1, _081628C0
	ldr r0, [r1]
	movs r1, #0xec
	muls r1, r5, r1
	adds r0, r0, r1
	movs r2, #0xe7
	lsls r2, r2, #3
	adds r0, r0, r2
_081628B6:
	mov r1, sl
	movs r2, #0xec
	bl memcpy
	b _0816298E
	.align 2, 0
_081628C0: .4byte 0x03005AF0
_081628C4: .4byte 0x0000073A
_081628C8:
	mov r2, sp
	ldr r4, _08162920
	ldr r0, [r4]
	ldr r3, _08162924
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2]
	add r0, sp, #0xc
	strh r1, [r0]
	movs r7, #1
	add r8, r7
	movs r5, #1
	add r0, sp, #0xc
	mov sb, r0
	mov ip, r3
_081628E8:
	movs r3, #0
	adds r7, r5, #1
	cmp r3, r8
	bge _08162932
	ldr r1, _08162920
	ldr r0, [r1]
	movs r2, #0xec
	adds r1, r5, #0
	muls r1, r2, r1
	adds r0, r0, r1
	mov r1, ip
	adds r4, r0, r1
	mov r6, sp
_08162902:
	lsls r0, r3, #1
	add r0, sp
	ldrh r2, [r4]
	adds r1, r2, #0
	ldrh r0, [r0]
	cmp r1, r0
	bhs _08162928
	movs r3, #0
	movs r4, #1
	mov r8, r4
	strh r2, [r6]
	mov r0, sb
	strh r5, [r0]
	b _08162932
	.align 2, 0
_08162920: .4byte 0x03005AF0
_08162924: .4byte 0x0000073A
_08162928:
	cmp r1, r0
	bhi _08162932
	adds r3, #1
	cmp r3, r8
	blt _08162902
_08162932:
	cmp r3, r8
	bne _08162958
	mov r1, r8
	lsls r2, r1, #1
	mov r4, sp
	adds r3, r4, r2
	ldr r1, _081629A0
	ldr r0, [r1]
	movs r4, #0xec
	adds r1, r5, #0
	muls r1, r4, r1
	adds r0, r0, r1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r3]
	add r2, sb
	strh r5, [r2]
	movs r0, #1
	add r8, r0
_08162958:
	adds r5, r7, #0
	cmp r5, #4
	ble _081628E8
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, r8
	bl __modsi3
	adds r5, r0, #0
	ldr r0, _081629A0
	ldr r0, [r0]
	lsls r1, r5, #1
	add r1, sp
	adds r1, #0xc
	ldrh r2, [r1]
	movs r1, #0xec
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xe7
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r1, sl
	movs r2, #0xec
	bl memcpy
_0816298E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081629A0: .4byte 0x03005AF0
	thumb_func_end PutNewBattleTowerRecord

	thumb_func_start GetFrontierTrainerFrontSpriteId
GetFrontierTrainerFrontSpriteId: @ 0x081629A4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	bl SetFacilityPtrsGetLevel
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r4, r0
	bne _081629D4
	ldr r1, _081629C8
	ldr r0, _081629CC
	ldr r0, [r0]
	ldr r2, _081629D0
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	b _08162ACC
	.align 2, 0
_081629C8: .4byte 0x082EFF00
_081629CC: .4byte 0x03005AF0
_081629D0: .4byte 0x00000BED
_081629D4:
	ldr r0, _081629E4
	cmp r4, r0
	bne _081629E8
	bl PrintHyphens
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08162ACE
	.align 2, 0
_081629E4: .4byte 0x000003FE
_081629E8:
	ldr r0, _08162A00
	cmp r4, r0
	bhi _08162A0C
	ldr r2, _08162A04
	ldr r0, _08162A08
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, r0, r2
	b _08162ACC
	.align 2, 0
_08162A00: .4byte 0x0000012B
_08162A04: .4byte 0x082EFF00
_08162A08: .4byte 0x0203B954
_08162A0C:
	ldr r0, _08162A30
	cmp r4, r0
	bhi _08162A68
	ldr r0, _08162A34
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08162A3C
	ldr r4, _08162A38
	bl GetRecordedBattleRecordMixFriendLanguage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	b _08162ACC
	.align 2, 0
_08162A30: .4byte 0x0000018F
_08162A34: .4byte 0x02022C90
_08162A38: .4byte 0x082EFF00
_08162A3C:
	ldr r3, _08162A58
	ldr r0, _08162A5C
	ldr r0, [r0]
	ldr r1, _08162A60
	adds r2, r4, r1
	movs r1, #0xec
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, _08162A64
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, r0, r3
	b _08162ACC
	.align 2, 0
_08162A58: .4byte 0x082EFF00
_08162A5C: .4byte 0x03005AF0
_08162A60: .4byte 0xFFFFFED4
_08162A64: .4byte 0x00000739
_08162A68:
	ldr r0, _08162AA0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _08162AB4
	ldr r4, _08162AA4
	ldr r3, _08162AA8
	ldr r0, _08162AAC
	ldr r1, [r0]
	ldr r0, _08162AB0
	adds r2, r5, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xdc
	ldrb r1, [r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r3
	ldrb r0, [r0, #0xa]
	adds r0, r0, r4
	b _08162ACC
	.align 2, 0
_08162AA0: .4byte 0x02022C90
_08162AA4: .4byte 0x082EFF00
_08162AA8: .4byte 0x085DC21C
_08162AAC: .4byte 0x03005AF0
_08162AB0: .4byte 0xFFFFFE70
_08162AB4:
	ldr r5, _08162AD4
	ldr r4, _08162AD8
	bl GetTextSpeedInRecordedBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r1, r4
	ldrb r0, [r1, #0xa]
	adds r0, r0, r5
_08162ACC:
	ldrb r0, [r0]
_08162ACE:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08162AD4: .4byte 0x082EFF00
_08162AD8: .4byte 0x085DC21C
	thumb_func_end GetFrontierTrainerFrontSpriteId

	thumb_func_start GetFrontierOpponentClass
GetFrontierOpponentClass: @ 0x08162ADC
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	bl SetFacilityPtrsGetLevel
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r4, r0
	bne _08162B0C
	ldr r1, _08162B00
	ldr r0, _08162B04
	ldr r0, [r0]
	ldr r2, _08162B08
	adds r0, r0, r2
	ldrb r0, [r0]
	b _08162B2A
	.align 2, 0
_08162B00: .4byte 0x082EFF52
_08162B04: .4byte 0x03005AF0
_08162B08: .4byte 0x00000BED
_08162B0C:
	ldr r0, _08162B1C
	cmp r4, r0
	bne _08162B20
	bl sub_081A48F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08162C22
	.align 2, 0
_08162B1C: .4byte 0x000003FE
_08162B20:
	ldr r0, _08162B30
	cmp r4, r0
	bne _08162B3C
	ldr r0, _08162B34
	ldr r1, _08162B38
_08162B2A:
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08162C22
	.align 2, 0
_08162B30: .4byte 0x00000C03
_08162B34: .4byte 0x082E383C
_08162B38: .4byte 0x00006481
_08162B3C:
	ldr r0, _08162B58
	cmp r4, r0
	bhi _08162B64
	ldr r2, _08162B5C
	ldr r0, _08162B60
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	b _08162C22
	.align 2, 0
_08162B58: .4byte 0x0000012B
_08162B5C: .4byte 0x082EFF52
_08162B60: .4byte 0x0203B954
_08162B64:
	ldr r0, _08162B88
	cmp r4, r0
	bhi _08162BC0
	ldr r0, _08162B8C
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08162B94
	ldr r4, _08162B90
	bl GetRecordedBattleRecordMixFriendLanguage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r0, [r0]
	b _08162C22
	.align 2, 0
_08162B88: .4byte 0x0000018F
_08162B8C: .4byte 0x02022C90
_08162B90: .4byte 0x082EFF52
_08162B94:
	ldr r3, _08162BB0
	ldr r0, _08162BB4
	ldr r0, [r0]
	ldr r1, _08162BB8
	adds r2, r4, r1
	movs r1, #0xec
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, _08162BBC
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	b _08162C22
	.align 2, 0
_08162BB0: .4byte 0x082EFF52
_08162BB4: .4byte 0x03005AF0
_08162BB8: .4byte 0xFFFFFED4
_08162BBC: .4byte 0x00000739
_08162BC0:
	ldr r0, _08162BEC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08162BF8
	ldr r5, _08162BF0
	ldr r4, _08162BF4
	bl GetTextSpeedInRecordedBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r1, r4
	ldrb r0, [r1, #0xa]
	adds r0, r0, r5
	ldrb r0, [r0]
	b _08162C22
	.align 2, 0
_08162BEC: .4byte 0x02022C90
_08162BF0: .4byte 0x082EFF52
_08162BF4: .4byte 0x085DC21C
_08162BF8:
	ldr r4, _08162C28
	ldr r3, _08162C2C
	ldr r0, _08162C30
	ldr r1, [r0]
	ldr r0, _08162C34
	adds r2, r5, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xdc
	ldrb r1, [r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r3
	ldrb r0, [r0, #0xa]
	adds r0, r0, r4
	ldrb r0, [r0]
_08162C22:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08162C28: .4byte 0x082EFF52
_08162C2C: .4byte 0x085DC21C
_08162C30: .4byte 0x03005AF0
_08162C34: .4byte 0xFFFFFE70
	thumb_func_end GetFrontierOpponentClass

	thumb_func_start GetFrontierTrainerFacilityClass
GetFrontierTrainerFacilityClass: @ 0x08162C38
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	bl SetFacilityPtrsGetLevel
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r4, r0
	bne _08162C5C
	ldr r0, _08162C54
	ldr r0, [r0]
	ldr r1, _08162C58
	b _08162CAC
	.align 2, 0
_08162C54: .4byte 0x03005AF0
_08162C58: .4byte 0x00000BED
_08162C5C:
	ldr r0, _08162C6C
	cmp r4, r0
	bhi _08162C74
	ldr r0, _08162C70
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r4, r0
	b _08162CAC
	.align 2, 0
_08162C6C: .4byte 0x0000012B
_08162C70: .4byte 0x0203B954
_08162C74:
	ldr r0, _08162C94
	cmp r4, r0
	bhi _08162CC0
	ldr r0, _08162C98
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08162C9C
	bl GetRecordedBattleRecordMixFriendLanguage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08162D10
	.align 2, 0
_08162C94: .4byte 0x0000018F
_08162C98: .4byte 0x02022C90
_08162C9C:
	ldr r0, _08162CB4
	ldr r0, [r0]
	ldr r1, _08162CB8
	adds r2, r4, r1
	movs r1, #0xec
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, _08162CBC
_08162CAC:
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08162D10
	.align 2, 0
_08162CB4: .4byte 0x03005AF0
_08162CB8: .4byte 0xFFFFFED4
_08162CBC: .4byte 0x00000739
_08162CC0:
	ldr r0, _08162CE4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08162CEC
	ldr r4, _08162CE8
	bl GetTextSpeedInRecordedBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r1, r4
	ldrb r0, [r1, #0xa]
	b _08162D10
	.align 2, 0
_08162CE4: .4byte 0x02022C90
_08162CE8: .4byte 0x085DC21C
_08162CEC:
	ldr r3, _08162D18
	ldr r0, _08162D1C
	ldr r1, [r0]
	ldr r0, _08162D20
	adds r2, r5, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xdc
	ldrb r1, [r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r3
	ldrb r0, [r0, #0xa]
_08162D10:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08162D18: .4byte 0x085DC21C
_08162D1C: .4byte 0x03005AF0
_08162D20: .4byte 0xFFFFFE70
	thumb_func_end GetFrontierTrainerFacilityClass

	thumb_func_start GetFrontierTrainerName
GetFrontierTrainerName: @ 0x08162D24
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r4, #0
	bl SetFacilityPtrsGetLevel
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r5, r0
	bne _08162D58
	ldr r0, _08162D54
	ldr r0, [r0]
	movs r1, #0xbf
	lsls r1, r1, #4
	adds r2, r0, r1
_08162D44:
	adds r0, r6, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #6
	ble _08162D44
	b _08162E76
	.align 2, 0
_08162D54: .4byte 0x03005AF0
_08162D58:
	ldr r0, _08162D68
	cmp r5, r0
	bne _08162D6C
	adds r0, r6, #0
	bl CopyFrontierBrainTrainerName
	b _08162E7C
	.align 2, 0
_08162D68: .4byte 0x000003FE
_08162D6C:
	ldr r0, _08162D84
	cmp r5, r0
	bne _08162D8C
	ldr r2, _08162D88
_08162D74:
	adds r0, r6, r4
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #6
	ble _08162D74
	b _08162E76
	.align 2, 0
_08162D84: .4byte 0x00000C03
_08162D88: .4byte 0x082E9CC0
_08162D8C:
	ldr r0, _08162DB0
	cmp r5, r0
	bhi _08162DB8
	ldr r0, _08162DB4
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r5, r0
	adds r0, r0, r1
	adds r2, r0, #4
_08162D9E:
	adds r0, r6, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #6
	ble _08162D9E
	b _08162E76
	.align 2, 0
_08162DB0: .4byte 0x0000012B
_08162DB4: .4byte 0x0203B954
_08162DB8:
	ldr r0, _08162DD4
	cmp r5, r0
	bhi _08162E0C
	ldr r0, _08162DD8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08162DDC
	adds r0, r6, #0
	bl sub_081861C0
	b _08162E7C
	.align 2, 0
_08162DD4: .4byte 0x0000018F
_08162DD8: .4byte 0x02022C90
_08162DDC:
	ldr r0, _08162E00
	ldr r1, [r0]
	ldr r0, _08162E04
	adds r2, r5, r0
	movs r0, #0xec
	muls r0, r2, r0
	ldr r2, _08162E08
	adds r1, r1, r2
	adds r2, r0, r1
_08162DEE:
	adds r1, r6, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r4, #1
	cmp r4, #6
	ble _08162DEE
	b _08162E76
	.align 2, 0
_08162E00: .4byte 0x03005AF0
_08162E04: .4byte 0xFFFFFED4
_08162E08: .4byte 0x0000073C
_08162E0C:
	ldr r0, _08162E3C
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08162E44
	ldr r5, _08162E40
_08162E1C:
	bl GetTextSpeedInRecordedBattle
	adds r2, r6, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	adds r1, r1, r5
	ldrb r0, [r1]
	strb r0, [r2]
	adds r4, #1
	cmp r4, #6
	ble _08162E1C
	b _08162E76
	.align 2, 0
_08162E3C: .4byte 0x02022C90
_08162E40: .4byte 0x085DC21C
_08162E44:
	ldr r7, _08162E84
	ldr r0, _08162E88
	ldr r2, [r0]
	ldr r0, _08162E8C
	adds r1, r5, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0xdc
_08162E5A:
	adds r2, r6, r4
	ldrb r1, [r3]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r0, r0, r7
	ldrb r0, [r0]
	strb r0, [r2]
	adds r4, #1
	cmp r4, #6
	ble _08162E5A
_08162E76:
	adds r1, r6, r4
	movs r0, #0xff
	strb r0, [r1]
_08162E7C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08162E84: .4byte 0x085DC21C
_08162E88: .4byte 0x03005AF0
_08162E8C: .4byte 0xFFFFFE70
	thumb_func_end GetFrontierTrainerName

	thumb_func_start IsFrontierTrainerFemale
IsFrontierTrainerFemale: @ 0x08162E90
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	bl SetFacilityPtrsGetLevel
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r4, r0
	bne _08162EB4
	ldr r0, _08162EAC
	ldr r0, [r0]
	ldr r1, _08162EB0
	b _08162EF6
	.align 2, 0
_08162EAC: .4byte 0x03005AF0
_08162EB0: .4byte 0x00000BED
_08162EB4:
	ldr r0, _08162EC4
	cmp r4, r0
	bne _08162EC8
	bl IsFrontierBrainFemale
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08162F62
	.align 2, 0
_08162EC4: .4byte 0x000003FE
_08162EC8:
	ldr r0, _08162ED8
	cmp r4, r0
	bhi _08162EE0
	ldr r0, _08162EDC
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r4, r0
	b _08162EF6
	.align 2, 0
_08162ED8: .4byte 0x0000012B
_08162EDC: .4byte 0x0203B954
_08162EE0:
	ldr r0, _08162EFC
	cmp r4, r0
	bhi _08162F0C
	ldr r0, _08162F00
	ldr r0, [r0]
	ldr r1, _08162F04
	adds r2, r4, r1
	movs r1, #0xec
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, _08162F08
_08162EF6:
	adds r0, r0, r1
	ldrb r2, [r0]
	b _08162F30
	.align 2, 0
_08162EFC: .4byte 0x0000018F
_08162F00: .4byte 0x03005AF0
_08162F04: .4byte 0xFFFFFED4
_08162F08: .4byte 0x00000739
_08162F0C:
	ldr r3, _08162F50
	ldr r0, _08162F54
	ldr r1, [r0]
	ldr r0, _08162F58
	adds r2, r5, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xdc
	ldrb r1, [r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r3
	ldrb r2, [r0, #0xa]
_08162F30:
	movs r1, #0
	ldr r3, _08162F5C
	ldrb r0, [r3]
	cmp r0, r2
	beq _08162F48
_08162F3A:
	adds r1, #1
	cmp r1, #0x13
	bhi _08162F48
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08162F3A
_08162F48:
	cmp r1, #0x14
	bne _08162F60
	movs r0, #0
	b _08162F62
	.align 2, 0
_08162F50: .4byte 0x085DC21C
_08162F54: .4byte 0x03005AF0
_08162F58: .4byte 0xFFFFFE70
_08162F5C: .4byte 0x085BBE3E
_08162F60:
	movs r0, #1
_08162F62:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsFrontierTrainerFemale

	thumb_func_start FillFrontierTrainerParty
FillFrontierTrainerParty: @ 0x08162F68
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ZeroEnemyPartyMons
	ldr r0, _08162F88
	ldrh r0, [r0]
	movs r1, #0
	adds r2, r4, #0
	bl FillTrainerParty
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08162F88: .4byte 0x0203886A
	thumb_func_end FillFrontierTrainerParty

	thumb_func_start FillFrontierTrainersParties
FillFrontierTrainersParties: @ 0x08162F8C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ZeroEnemyPartyMons
	ldr r0, _08162FB8
	ldrh r0, [r0]
	movs r1, #0
	adds r2, r4, #0
	bl FillTrainerParty
	ldr r0, _08162FBC
	ldrh r0, [r0]
	movs r1, #3
	adds r2, r4, #0
	bl FillTrainerParty
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08162FB8: .4byte 0x0203886A
_08162FBC: .4byte 0x0203886C
	thumb_func_end FillFrontierTrainersParties

	thumb_func_start FillTentTrainerParty
FillTentTrainerParty: @ 0x08162FC0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ZeroEnemyPartyMons
	ldr r0, _08162FE0
	ldrh r0, [r0]
	movs r1, #0
	adds r2, r4, #0
	bl FillTentTrainerParty_
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08162FE0: .4byte 0x0203886A
	thumb_func_end FillTentTrainerParty

	thumb_func_start FillTrainerParty
FillTrainerParty: @ 0x08162FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x1c]
	add r4, sp, #0x14
	movs r0, #0xff
	strb r0, [r4]
	bl SetFacilityPtrsGetLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	ldr r0, _08163048
	cmp r5, r0
	bhi _08163058
	adds r0, r5, #0
	bl GetFrontierTrainerFixedIvs
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	ldr r0, _0816304C
	ldrh r2, [r0]
	ldr r0, _08163050
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r2, r0
	adds r0, r0, r1
	ldr r0, [r0, #0x30]
	str r0, [sp, #0x2c]
	movs r0, #0
	str r0, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldrh r1, [r2]
	ldr r0, _08163054
	cmp r1, r0
	bne _08163044
	b _08163198
_08163044:
	b _08163180
	.align 2, 0
_08163048: .4byte 0x0000012B
_0816304C: .4byte 0x0203886A
_08163050: .4byte 0x0203B954
_08163054: .4byte 0x0000FFFF
_08163058:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r5, r0
	bne _081630A0
	ldr r7, [sp, #0x18]
	adds r0, r7, #3
	cmp r7, r0
	blt _0816306A
	b _08163346
_0816306A:
	ldr r4, _08163098
_0816306C:
	movs r0, #0x64
	muls r0, r7, r0
	ldr r1, _0816309C
	adds r0, r0, r1
	ldr r5, [sp, #0x18]
	subs r2, r7, r5
	movs r1, #0x2c
	muls r2, r1, r2
	movs r6, #0xc2
	lsls r6, r6, #4
	adds r2, r2, r6
	ldr r1, [r4]
	adds r1, r1, r2
	bl CreateBattleTowerMon
	adds r7, #1
	adds r0, r5, #0
	adds r0, #3
	cmp r7, r0
	blt _0816306C
	b _08163346
	.align 2, 0
_08163098: .4byte 0x03005AF0
_0816309C: .4byte 0x020243E8
_081630A0:
	ldr r0, _081630AC
	cmp r5, r0
	bne _081630B0
	bl CreateFrontierBrainPokemon
	b _08163346
	.align 2, 0
_081630AC: .4byte 0x000003FE
_081630B0:
	ldr r0, _08163120
	cmp r5, r0
	bhi _08163138
	movs r6, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	adds r0, r7, r1
	cmp r7, r0
	blt _081630C4
	b _08163346
_081630C4:
	ldr r2, _08163124
	adds r1, r5, r2
	movs r0, #0xec
	adds r2, r1, #0
	muls r2, r0, r2
	mov r8, r2
	muls r0, r5, r0
	ldr r5, _08163128
	adds r4, r0, r5
_081630D6:
	ldr r0, _0816312C
	ldr r3, [r0]
	movs r0, #0x2c
	adds r2, r6, #0
	muls r2, r0, r2
	mov r1, r8
	adds r0, r2, r1
	adds r1, r3, r0
	ldr r5, _08163130
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r0, #0
	beq _08163110
	adds r5, #0xc
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r1, [sp, #0x20]
	cmp r0, r1
	bhi _08163110
	movs r0, #0x64
	muls r0, r7, r0
	ldr r1, _08163134
	adds r0, r0, r1
	adds r1, r3, r4
	adds r2, #0x34
	adds r1, r1, r2
	movs r2, #0
	bl CreateBattleTowerMon2
_08163110:
	adds r6, #1
	adds r7, #1
	ldr r2, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	adds r0, r2, r5
	cmp r7, r0
	blt _081630D6
	b _08163346
	.align 2, 0
_08163120: .4byte 0x0000018F
_08163124: .4byte 0xFFFFFED4
_08163128: .4byte 0xFFFEF2A8
_0816312C: .4byte 0x03005AF0
_08163130: .4byte 0x0000076C
_08163134: .4byte 0x020243E8
_08163138:
	ldr r7, [sp, #0x18]
	adds r0, r7, #3
	cmp r7, r0
	blt _08163142
	b _08163346
_08163142:
	ldr r6, _08163174
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08163178
	adds r5, r0, r1
	movs r4, #0
_08163150:
	movs r0, #0x64
	muls r0, r7, r0
	ldr r1, _0816317C
	adds r0, r0, r1
	ldr r1, [r6]
	adds r1, r1, r5
	lsrs r2, r4, #0x18
	bl CreateApprenticeMon
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r4, r4, r2
	adds r7, #1
	ldr r0, [sp, #0x18]
	adds r0, #3
	cmp r7, r0
	blt _08163150
	b _08163346
	.align 2, 0
_08163174: .4byte 0x03005AF0
_08163178: .4byte 0xFFFF969C
_0816317C: .4byte 0x020243E8
_08163180:
	ldr r0, [sp, #0x28]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
	lsls r0, r0, #1
	ldr r5, [sp, #0x2c]
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r0, _081631E8
	cmp r1, r0
	bne _08163180
_08163198:
	movs r7, #0
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	str r4, [sp, #0x30]
	ldr r6, [sp, #0x1c]
	cmp r7, r6
	bne _081631B6
	b _08163346
_081631B6:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #0x28]
	bl __modsi3
	lsls r0, r0, #1
	ldr r1, [sp, #0x2c]
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r2, [sp, #0x20]
	cmp r2, #0x32
	beq _081631D6
	cmp r2, #0x14
	bne _081631DE
_081631D6:
	ldr r0, _081631EC
	cmp r4, r0
	bls _081631DE
	b _0816333E
_081631DE:
	movs r6, #0
	ldr r5, [sp, #0x18]
	adds r5, r5, r7
	mov r8, r5
	b _081631F2
	.align 2, 0
_081631E8: .4byte 0x0000FFFF
_081631EC: .4byte 0x00000351
_081631F0:
	adds r6, #1
_081631F2:
	cmp r6, r8
	bge _08163216
	movs r1, #0x64
	adds r0, r6, #0
	muls r0, r1, r0
	ldr r2, _08163358
	adds r0, r0, r2
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	ldr r1, _0816335C
	ldr r2, [r1]
	lsls r1, r4, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	cmp r0, r1
	bne _081631F0
_08163216:
	cmp r6, r8
	beq _0816321C
	b _0816333E
_0816321C:
	movs r6, #0
	cmp r6, r8
	bge _08163266
	ldr r5, _08163360
	mov sb, r5
	movs r3, #0
_08163228:
	ldr r0, _08163358
	adds r5, r3, r0
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #0
	str r3, [sp, #0x38]
	bl GetMonData
	ldr r3, [sp, #0x38]
	cmp r0, #0
	beq _0816325E
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #0
	bl GetMonData
	ldr r1, _0816335C
	ldr r2, [r1]
	lsls r1, r4, #4
	adds r1, r1, r2
	ldrb r1, [r1, #0xa]
	lsls r1, r1, #1
	add r1, sb
	ldr r3, [sp, #0x38]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08163266
_0816325E:
	adds r3, #0x64
	adds r6, #1
	cmp r6, r8
	blt _08163228
_08163266:
	cmp r6, r8
	bne _0816333E
	movs r6, #0
	cmp r6, r7
	bge _08163288
	add r0, sp, #0xc
	ldrh r0, [r0]
	cmp r0, r4
	beq _08163288
	add r1, sp, #0xc
_0816327A:
	adds r1, #2
	adds r6, #1
	cmp r6, r7
	bge _08163288
	ldrh r0, [r1]
	cmp r0, r4
	bne _0816327A
_08163288:
	cmp r6, r7
	bne _0816333E
	lsls r0, r7, #1
	add r0, sp
	adds r0, #0xc
	strh r4, [r0]
	movs r1, #0x64
	mov r0, r8
	muls r0, r1, r0
	ldr r2, _08163358
	adds r0, r0, r2
	ldr r5, _0816335C
	ldr r2, [r5]
	lsls r4, r4, #4
	adds r2, r4, r2
	ldrh r1, [r2]
	ldrb r3, [r2, #0xc]
	ldr r6, [sp, #0x24]
	str r6, [sp]
	ldrb r2, [r2, #0xb]
	str r2, [sp, #4]
	ldr r2, [sp, #0x30]
	str r2, [sp, #8]
	ldr r2, [sp, #0x20]
	bl CreateMonWithEVSpreadNatureOTID
	movs r0, #0xff
	mov r6, sp
	strb r0, [r6, #0x14]
	movs r6, #0
	adds r0, r7, #1
	str r0, [sp, #0x34]
	mov sb, r4
	movs r0, #0x64
	mov r3, r8
	muls r3, r0, r3
	mov r1, sb
	str r1, [sp, #0x3c]
	ldr r2, _08163358
	mov sl, r2
_081632D8:
	ldr r0, [r5]
	ldr r7, [sp, #0x3c]
	adds r0, r7, r0
	lsls r4, r6, #1
	adds r0, #2
	adds r0, r0, r4
	ldrh r1, [r0]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	mov r7, sl
	adds r0, r3, r7
	str r3, [sp, #0x38]
	bl SetMonMoveSlot
	ldr r0, [r5]
	ldr r1, [sp, #0x3c]
	adds r0, r1, r0
	adds r0, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r3, [sp, #0x38]
	cmp r0, #0xda
	bne _0816330C
	movs r0, #0
	mov r2, sp
	strb r0, [r2, #0x14]
_0816330C:
	adds r6, #1
	cmp r6, #3
	ble _081632D8
	movs r5, #0x64
	mov r4, r8
	muls r4, r5, r4
	ldr r6, _08163358
	adds r4, r4, r6
	adds r0, r4, #0
	movs r1, #0x20
	add r2, sp, #0x14
	bl SetMonData
	ldr r0, _0816335C
	ldr r0, [r0]
	add r0, sb
	ldrb r2, [r0, #0xa]
	lsls r2, r2, #1
	ldr r0, _08163360
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	ldr r7, [sp, #0x34]
_0816333E:
	ldr r0, [sp, #0x1c]
	cmp r7, r0
	beq _08163346
	b _081631B6
_08163346:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08163358: .4byte 0x020243E8
_0816335C: .4byte 0x0203B958
_08163360: .4byte 0x085ADBF4
	thumb_func_end FillTrainerParty

	thumb_func_start Unused_CreateApprenticeMons
Unused_CreateApprenticeMons: @ 0x08163364
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	movs r1, #0xff
	add r0, sp, #4
	strb r1, [r0]
	ldr r0, _08163438
	ldr r2, [r0]
	movs r0, #0xdc
	adds r0, r0, r2
	mov sl, r0
	ldrb r0, [r0, #1]
	movs r1, #9
	str r1, [sp, #0x10]
	cmp r0, #4
	bhi _08163394
	movs r0, #6
	str r0, [sp, #0x10]
_08163394:
	ldr r1, _0816343C
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r1, #0x32
	str r1, [sp, #0xc]
	cmp r0, #0
	beq _081633AA
	movs r0, #0x64
	str r0, [sp, #0xc]
_081633AA:
	movs r7, #0
	adds r2, #0xe2
	str r2, [sp, #0x14]
	add r1, sp, #4
	mov sb, r1
_081633B4:
	ldr r2, [sp, #8]
	adds r6, r2, r7
	movs r0, #0x64
	muls r0, r6, r0
	ldr r1, _08163440
	adds r0, r0, r1
	lsls r5, r7, #1
	adds r4, r5, r7
	lsls r4, r4, #2
	mov r2, sl
	adds r1, r2, r4
	ldrh r1, [r1, #4]
	movs r2, #8
	str r2, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	bl CreateMonWithEVSpread
	movs r0, #0xff
	mov r1, sb
	strb r0, [r1]
	adds r2, r7, #1
	mov r8, r2
	movs r1, #3
_081633E4:
	ldr r2, [sp, #0x14]
	adds r0, r2, r4
	ldrh r0, [r0]
	cmp r0, #0xda
	bne _081633F4
	movs r2, #0
	mov r0, sb
	strb r2, [r0]
_081633F4:
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bge _081633E4
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _08163440
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	add r2, sp, #4
	bl SetMonData
	adds r2, r5, r7
	lsls r2, r2, #2
	add r2, sl
	adds r2, #0xe
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	mov r7, r8
	cmp r7, #3
	bne _081633B4
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08163438: .4byte 0x03005AF0
_0816343C: .4byte 0x00000CA9
_08163440: .4byte 0x020243E8
	thumb_func_end Unused_CreateApprenticeMons

	thumb_func_start RandomizeFacilityTrainerMonSet
RandomizeFacilityTrainerMonSet: @ 0x08163444
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl SetFacilityPtrsGetLevel
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08163468
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, r0, r1
	ldr r5, [r0, #0x30]
	movs r4, #0
	ldrh r1, [r5]
	b _08163478
	.align 2, 0
_08163468: .4byte 0x0203B954
_0816346C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
_08163478:
	ldr r0, _081634A8
	cmp r1, r0
	bne _0816346C
_0816347E:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	cmp r6, #0x32
	beq _0816349A
	cmp r6, #0x14
	bne _081634A0
_0816349A:
	ldr r0, _081634AC
	cmp r1, r0
	bhi _0816347E
_081634A0:
	adds r0, r1, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081634A8: .4byte 0x0000FFFF
_081634AC: .4byte 0x00000351
	thumb_func_end RandomizeFacilityTrainerMonSet

	thumb_func_start FillFactoryTrainerParty
FillFactoryTrainerParty: @ 0x081634B0
	push {lr}
	bl ZeroEnemyPartyMons
	ldr r0, _081634D4
	ldr r0, [r0]
	ldr r1, _081634D8
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _081634E0
	ldr r0, _081634DC
	ldrh r0, [r0]
	movs r1, #0
	bl FillFactoryFrontierTrainerParty
	b _081634EA
	.align 2, 0
_081634D4: .4byte 0x03005AF0
_081634D8: .4byte 0x00000CA9
_081634DC: .4byte 0x0203886A
_081634E0:
	ldr r0, _081634F0
	ldrh r0, [r0]
	movs r1, #0
	bl FillFactoryTentTrainerParty
_081634EA:
	pop {r0}
	bx r0
	.align 2, 0
_081634F0: .4byte 0x0203886A
	thumb_func_end FillFactoryTrainerParty

	thumb_func_start FillFactoryFrontierTrainerParty
FillFactoryFrontierTrainerParty: @ 0x081634F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x10]
	ldr r0, _0816354C
	cmp r2, r0
	bhi _0816356A
	ldr r4, _08163550
	ldr r0, _08163554
	bl VarGet
	lsls r0, r0, #0x18
	ldr r4, [r4]
	lsrs r0, r0, #0x16
	movs r2, #0xce
	lsls r2, r2, #4
	adds r1, r4, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08163558
	adds r4, r4, r3
	ldrh r0, [r4]
	cmp r0, #5
	bhi _0816355C
	adds r0, r1, #0
	movs r1, #0
	bl GetFactoryMonFixedIV
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081635C6
	.align 2, 0
_0816354C: .4byte 0x0000012B
_08163550: .4byte 0x03005AF0
_08163554: .4byte 0x000040CE
_08163558: .4byte 0x00000CB2
_0816355C:
	adds r0, r1, #0
	movs r1, #1
	bl GetFactoryMonFixedIV
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081635C6
_0816356A:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r2, r0
	bne _081635B4
	ldr r7, [sp, #0x10]
	adds r0, r7, #3
	cmp r7, r0
	blt _0816357C
	b _08163696
_0816357C:
	ldr r4, _081635AC
_0816357E:
	movs r0, #0x64
	muls r0, r7, r0
	ldr r1, _081635B0
	adds r0, r0, r1
	ldr r1, [sp, #0x10]
	subs r2, r7, r1
	movs r1, #0x2c
	muls r2, r1, r2
	movs r3, #0xc2
	lsls r3, r3, #4
	adds r2, r2, r3
	ldr r1, [r4]
	adds r1, r1, r2
	bl CreateBattleTowerMon
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [sp, #0x10]
	adds r0, #3
	cmp r7, r0
	blt _0816357E
	b _08163696
	.align 2, 0
_081635AC: .4byte 0x03005AF0
_081635B0: .4byte 0x020243E8
_081635B4:
	ldr r0, _081635C0
	cmp r3, r0
	bne _081635C4
	bl FillFactoryBrainParty
	b _08163696
	.align 2, 0
_081635C0: .4byte 0x000003FE
_081635C4:
	movs r0, #0x1f
_081635C6:
	str r0, [sp, #0x18]
	bl SetFacilityPtrsGetLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, _081636A8
	ldr r1, [r0]
	ldrb r2, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	lsls r0, r0, #8
	orrs r2, r0
	ldrb r0, [r1, #0xc]
	lsls r0, r0, #0x10
	orrs r2, r0
	ldrb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	orrs r2, r0
	mov r8, r2
	movs r7, #0
_081635EE:
	ldr r1, _081636AC
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	mov sb, r0
	ldr r3, [sp, #0x10]
	adds r5, r3, r7
	movs r0, #0x64
	adds r6, r5, #0
	muls r6, r0, r6
	ldr r1, _081636B0
	adds r0, r6, r1
	ldr r3, _081636B4
	ldr r2, [r3]
	mov r1, sb
	lsls r4, r1, #4
	adds r2, r4, r2
	ldrh r1, [r2]
	ldrb r3, [r2, #0xc]
	mov sl, r3
	ldr r3, [sp, #0x18]
	str r3, [sp]
	ldrb r2, [r2, #0xb]
	str r2, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	ldr r2, [sp, #0x14]
	mov r3, sl
	bl CreateMonWithEVSpreadNatureOTID
	movs r1, #0
	add r0, sp, #0xc
	strb r1, [r0]
	movs r3, #0
	adds r7, #1
	mov sl, r7
	adds r7, r4, #0
_08163638:
	ldr r0, _081636B4
	ldr r1, [r0]
	mov r2, sb
	lsls r0, r2, #4
	adds r0, r0, r1
	lsls r1, r3, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r2, _081636B0
	adds r0, r6, r2
	adds r2, r3, #0
	str r3, [sp, #0x1c]
	bl SetMonMoveAvoidReturn
	ldr r3, [sp, #0x1c]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08163638
	movs r3, #0x64
	adds r4, r5, #0
	muls r4, r3, r4
	ldr r0, _081636B0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	add r2, sp, #0xc
	bl SetMonData
	ldr r1, _081636B4
	ldr r0, [r1]
	adds r0, r7, r0
	ldrb r2, [r0, #0xa]
	lsls r2, r2, #1
	ldr r0, _081636B8
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	mov r2, sl
	lsls r0, r2, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _081635EE
_08163696:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081636A8: .4byte 0x03005AF0
_081636AC: .4byte 0x03005FD8
_081636B0: .4byte 0x020243E8
_081636B4: .4byte 0x0203B958
_081636B8: .4byte 0x085ADBF4
	thumb_func_end FillFactoryFrontierTrainerParty

	thumb_func_start FillFactoryTentTrainerParty
FillFactoryTentTrainerParty: @ 0x081636BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x10]
	ldr r0, _081637B8
	ldr r1, [r0]
	ldrb r0, [r1, #0xa]
	mov sb, r0
	ldrb r0, [r1, #0xb]
	lsls r0, r0, #8
	mov r2, sb
	orrs r2, r0
	ldrb r0, [r1, #0xc]
	lsls r0, r0, #0x10
	orrs r2, r0
	ldrb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	orrs r2, r0
	mov sb, r2
	movs r7, #0
	mov r8, r7
_081636F0:
	ldr r1, _081637BC
	mov r2, r8
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r5, [sp, #0x10]
	add r5, r8
	movs r7, #0x64
	adds r6, r5, #0
	muls r6, r7, r6
	ldr r1, _081637C0
	adds r0, r6, r1
	ldr r7, _081637C4
	ldr r2, [r7]
	lsls r4, r4, #4
	adds r2, r4, r2
	ldrh r1, [r2]
	ldrb r3, [r2, #0xc]
	movs r7, #0
	str r7, [sp]
	ldrb r2, [r2, #0xb]
	str r2, [sp, #4]
	mov r2, sb
	str r2, [sp, #8]
	movs r2, #0x1e
	bl CreateMonWithEVSpreadNatureOTID
	movs r1, #0
	add r0, sp, #0xc
	strb r1, [r0]
	mov sl, r5
	mov r0, r8
	adds r0, #1
	str r0, [sp, #0x14]
	mov r8, r4
	mov r5, r8
_08163738:
	ldr r1, _081637C4
	ldr r0, [r1]
	adds r0, r5, r0
	lsls r4, r7, #1
	adds r0, #2
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r2, _081637C0
	adds r0, r6, r2
	adds r2, r7, #0
	bl SetMonMoveAvoidReturn
	ldr r1, _081637C4
	ldr r0, [r1]
	adds r0, r5, r0
	adds r0, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0xda
	bne _08163766
	movs r1, #0
	add r0, sp, #0xc
	strb r1, [r0]
_08163766:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _08163738
	movs r2, #0x64
	mov r4, sl
	muls r4, r2, r4
	ldr r7, _081637C0
	adds r4, r4, r7
	adds r0, r4, #0
	movs r1, #0x20
	add r2, sp, #0xc
	bl SetMonData
	ldr r1, _081637C4
	ldr r0, [r1]
	add r0, r8
	ldrb r2, [r0, #0xa]
	lsls r2, r2, #1
	ldr r0, _081637C8
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	ldr r2, [sp, #0x14]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _081636F0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081637B8: .4byte 0x03005AF0
_081637BC: .4byte 0x03005FD8
_081637C0: .4byte 0x020243E8
_081637C4: .4byte 0x0203B958
_081637C8: .4byte 0x085ADBF4
	thumb_func_end FillFactoryTentTrainerParty

	thumb_func_start FrontierSpeechToString
FrontierSpeechToString: @ 0x081637CC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #3
	movs r2, #2
	movs r3, #0x14
	bl sub_0811F2A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08163824
	ldr r5, _08163820
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	movs r3, #3
	bl ConvertEasyChatWordsToString
	ldrb r0, [r5]
	movs r1, #1
	cmp r0, #0xfe
	beq _08163802
	adds r2, r5, #0
_081637F8:
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r1, #1
	cmp r0, #0xfe
	bne _081637F8
_08163802:
	ldr r2, _08163820
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r2, #0
	cmp r0, #0xfe
	beq _08163818
_0816380E:
	adds r1, #1
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xfe
	bne _0816380E
_08163818:
	adds r1, r1, r3
	movs r0, #0xfa
	strb r0, [r1]
	b _08163830
	.align 2, 0
_08163820: .4byte 0x02021C7C
_08163824:
	ldr r0, _08163838
	adds r1, r4, #0
	movs r2, #3
	movs r3, #2
	bl ConvertEasyChatWordsToString
_08163830:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08163838: .4byte 0x02021C7C
	thumb_func_end FrontierSpeechToString

	thumb_func_start sub_0816383C
sub_0816383C: @ 0x0816383C
	push {lr}
	bl SetFacilityPtrsGetLevel
	ldr r0, _08163850
	ldrh r0, [r0]
	cmp r0, #0
	beq _08163858
	ldr r0, _08163854
	b _0816385A
	.align 2, 0
_08163850: .4byte 0x02037282
_08163854: .4byte 0x0203886C
_08163858:
	ldr r0, _0816386C
_0816385A:
	ldrh r3, [r0]
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r3, r0
	bne _08163878
	ldr r0, _08163870
	ldr r0, [r0]
	ldr r1, _08163874
	b _081638AE
	.align 2, 0
_0816386C: .4byte 0x0203886A
_08163870: .4byte 0x03005AF0
_08163874: .4byte 0x00000BFC
_08163878:
	ldr r0, _08163894
	cmp r3, r0
	bhi _0816389C
	ldr r2, _08163898
	movs r0, #0x34
	adds r1, r3, #0
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0xc
	bl FrontierSpeechToString
	b _081638D0
	.align 2, 0
_08163894: .4byte 0x0000012B
_08163898: .4byte 0x0203B954
_0816389C:
	ldr r0, _081638B8
	cmp r3, r0
	bhi _081638C4
	ldr r1, _081638BC
	movs r0, #0xec
	muls r0, r3, r0
	ldr r1, [r1]
	adds r0, r0, r1
	ldr r1, _081638C0
_081638AE:
	adds r0, r0, r1
	bl FrontierSpeechToString
	b _081638D0
	.align 2, 0
_081638B8: .4byte 0x0000018F
_081638BC: .4byte 0x03005AF0
_081638C0: .4byte 0xFFFEF2B8
_081638C4:
	adds r0, r3, #0
	adds r0, #0x70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl CopyFriendsApprenticeChallengeText
_081638D0:
	pop {r0}
	bx r0
	thumb_func_end sub_0816383C

	thumb_func_start HandleSpecialTrainerBattleEnd
HandleSpecialTrainerBattleEnd: @ 0x081638D4
	push {r4, r5, r6, lr}
	sub sp, #4
	bl RecordedBattle_SaveBattleOutcome
	ldr r0, _081638F0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _081639A0
	lsls r0, r0, #2
	ldr r1, _081638F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081638F0: .4byte 0x02024118
_081638F4: .4byte 0x081638F8
_081638F8: @ jump table
	.4byte _08163924 @ case 0
	.4byte _08163960 @ case 1
	.4byte _0816399C @ case 2
	.4byte _08163924 @ case 3
	.4byte _08163924 @ case 4
	.4byte _08163924 @ case 5
	.4byte _08163924 @ case 6
	.4byte _08163924 @ case 7
	.4byte _081639A0 @ case 8
	.4byte _08163924 @ case 9
	.4byte _08163924 @ case 10
_08163924:
	ldr r0, _08163948
	ldr r0, [r0]
	ldr r2, _0816394C
	adds r1, r0, r2
	ldr r2, [r1]
	ldr r0, _08163950
	cmp r2, r0
	bhi _08163954
	adds r0, r2, #1
	str r0, [r1]
	movs r1, #0x14
	bl __umodsi3
	cmp r0, #0
	bne _081639A0
	bl UpdateGymLeaderRematch
	b _081639A0
	.align 2, 0
_08163948: .4byte 0x03005AF0
_0816394C: .4byte 0x00000EBC
_08163950: .4byte 0x00FFFFFE
_08163954:
	ldr r0, _0816395C
	str r0, [r1]
	b _081639A0
	.align 2, 0
_0816395C: .4byte 0x00FFFFFF
_08163960:
	movs r5, #0
	ldr r6, _08163994
_08163964:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, [r6]
	adds r0, r0, r1
	movs r1, #0xc
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _08163998
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	adds r5, #1
	cmp r5, #5
	ble _08163964
	b _081639A0
	.align 2, 0
_08163994: .4byte 0x03005AEC
_08163998: .4byte 0x02024190
_0816399C:
	bl CopyEReaderTrainerFarewellMessage
_081639A0:
	ldr r0, _081639B0
	bl SetMainCallback2
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081639B0: .4byte 0x08085B35
	thumb_func_end HandleSpecialTrainerBattleEnd

	thumb_func_start Task_StartBattleAfterTransition
Task_StartBattleAfterTransition: @ 0x081639B4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsBattleTransitionDone
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081639D8
	ldr r0, _081639E0
	ldr r1, _081639E4
	str r1, [r0, #8]
	ldr r0, _081639E8
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_081639D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081639E0: .4byte 0x03002360
_081639E4: .4byte 0x081638D5
_081639E8: .4byte 0x080365B5
	thumb_func_end Task_StartBattleAfterTransition

	thumb_func_start DoSpecialTrainerBattle
DoSpecialTrainerBattle: @ 0x081639EC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08163A0C
	ldr r2, _08163A10
	ldrh r1, [r2]
	adds r0, #0x26
	strb r1, [r0]
	ldrh r0, [r2]
	cmp r0, #0xa
	bls _08163A02
	b _08163D90
_08163A02:
	lsls r0, r0, #2
	ldr r1, _08163A14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08163A0C: .4byte 0x02024118
_08163A10: .4byte 0x02037280
_08163A14: .4byte 0x08163A18
_08163A18: @ jump table
	.4byte _08163A44 @ case 0
	.4byte _08163AE8 @ case 1
	.4byte _08163B38 @ case 2
	.4byte _08163B98 @ case 3
	.4byte _08163BEC @ case 4
	.4byte _08163C50 @ case 5
	.4byte _08163C9C @ case 6
	.4byte _08163CDC @ case 7
	.4byte _08163D54 @ case 8
	.4byte _08163D1C @ case 9
	.4byte _08163CF0 @ case 10
_08163A44:
	ldr r5, _08163A64
	movs r0, #0x84
	lsls r0, r0, #1
	str r0, [r5]
	ldr r0, _08163A68
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	beq _08163A7E
	cmp r4, #1
	bgt _08163A6C
	cmp r4, #0
	beq _08163A76
	b _08163ACE
	.align 2, 0
_08163A64: .4byte 0x02022C90
_08163A68: .4byte 0x000040CE
_08163A6C:
	cmp r4, #2
	beq _08163A8C
	cmp r4, #3
	beq _08163AC0
	b _08163ACE
_08163A76:
	movs r0, #3
	bl FillFrontierTrainerParty
	b _08163ACE
_08163A7E:
	movs r0, #4
	bl FillFrontierTrainerParty
	ldr r0, [r5]
	orrs r0, r4
	str r0, [r5]
	b _08163ACE
_08163A8C:
	movs r0, #2
	bl FillFrontierTrainersParties
	ldr r1, _08163AB0
	ldr r0, _08163AB4
	ldr r0, [r0]
	ldr r2, _08163AB8
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r1]
	bl FillPartnerParty
	ldr r0, [r5]
	ldr r1, _08163ABC
	orrs r0, r1
	str r0, [r5]
	b _08163ACE
	.align 2, 0
_08163AB0: .4byte 0x0203886E
_08163AB4: .4byte 0x03005AF0
_08163AB8: .4byte 0x00000CD6
_08163ABC: .4byte 0x00408041
_08163AC0:
	ldr r0, [r5]
	ldr r1, _08163AE0
	orrs r0, r1
	str r0, [r5]
	movs r0, #2
	bl FillFrontierTrainersParties
_08163ACE:
	ldr r0, _08163AE4
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	movs r0, #0
	b _08163D38
	.align 2, 0
_08163AE0: .4byte 0x00800043
_08163AE4: .4byte 0x081639B5
_08163AE8:
	movs r5, #0
	ldr r6, _08163B2C
_08163AEC:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08163B30
	adds r0, r4, r0
	movs r1, #0xc
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r6]
	adds r0, r0, r4
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	adds r5, #1
	cmp r5, #5
	ble _08163AEC
	ldr r0, _08163B34
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	movs r0, #0xc
	b _08163D38
	.align 2, 0
_08163B2C: .4byte 0x03005AEC
_08163B30: .4byte 0x02024190
_08163B34: .4byte 0x081639B5
_08163B38:
	bl ZeroEnemyPartyMons
	movs r5, #0
	ldr r4, _08163B80
_08163B40:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08163B84
	adds r0, r0, r1
	movs r1, #0x2c
	adds r2, r5, #0
	muls r2, r1, r2
	movs r1, #0xc2
	lsls r1, r1, #4
	adds r2, r2, r1
	ldr r1, [r4]
	adds r1, r1, r2
	bl CreateBattleTowerMon
	adds r5, #1
	cmp r5, #2
	ble _08163B40
	ldr r1, _08163B88
	ldr r0, _08163B8C
	str r0, [r1]
	ldr r1, _08163B90
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08163B94
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	movs r0, #0xd
	b _08163D38
	.align 2, 0
_08163B80: .4byte 0x03005AF0
_08163B84: .4byte 0x020243E8
_08163B88: .4byte 0x02022C90
_08163B8C: .4byte 0x00000808
_08163B90: .4byte 0x0203886A
_08163B94: .4byte 0x081639B5
_08163B98:
	ldr r4, _08163BD4
	ldr r0, _08163BD8
	str r0, [r4]
	ldr r0, _08163BDC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #1
	bne _08163BB2
	ldr r0, [r4]
	orrs r0, r1
	str r0, [r4]
_08163BB2:
	ldr r0, _08163BE0
	ldrh r1, [r0]
	ldr r0, _08163BE4
	cmp r1, r0
	bne _08163BC2
	movs r0, #2
	bl FillFrontierTrainerParty
_08163BC2:
	ldr r0, _08163BE8
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl GetMonFlavorRelation
	movs r0, #3
	b _08163D38
	.align 2, 0
_08163BD4: .4byte 0x02022C90
_08163BD8: .4byte 0x00010008
_08163BDC: .4byte 0x000040CE
_08163BE0: .4byte 0x0203886A
_08163BE4: .4byte 0x000003FE
_08163BE8: .4byte 0x081639B5
_08163BEC:
	ldr r4, _08163C20
	ldr r0, _08163C24
	str r0, [r4]
	ldr r0, _08163C28
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #1
	bne _08163C06
	ldr r0, [r4]
	orrs r0, r1
	str r0, [r4]
_08163C06:
	ldr r0, _08163C2C
	ldr r0, [r0]
	ldr r2, _08163C30
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08163C34
	movs r0, #3
	bl FillFrontierTrainerParty
	b _08163C3A
	.align 2, 0
_08163C20: .4byte 0x02022C90
_08163C24: .4byte 0x00020008
_08163C28: .4byte 0x000040CE
_08163C2C: .4byte 0x03005AF0
_08163C30: .4byte 0x00000CA9
_08163C34:
	movs r0, #3
	bl FillTentTrainerParty
_08163C3A:
	ldr r0, _08163C4C
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	movs r0, #4
	b _08163D38
	.align 2, 0
_08163C4C: .4byte 0x081639B5
_08163C50:
	ldr r1, _08163C70
	ldr r0, _08163C74
	str r0, [r1]
	ldr r0, _08163C78
	ldr r0, [r0]
	ldr r1, _08163C7C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08163C80
	movs r0, #3
	bl FillFrontierTrainerParty
	b _08163C86
	.align 2, 0
_08163C70: .4byte 0x02022C90
_08163C74: .4byte 0x00040008
_08163C78: .4byte 0x03005AF0
_08163C7C: .4byte 0x00000CA9
_08163C80:
	movs r0, #3
	bl FillTentTrainerParty
_08163C86:
	ldr r0, _08163C98
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	movs r0, #5
	b _08163D38
	.align 2, 0
_08163C98: .4byte 0x081639B5
_08163C9C:
	ldr r4, _08163CCC
	ldr r0, _08163CD0
	str r0, [r4]
	ldr r0, _08163CD4
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #1
	bne _08163CB6
	ldr r0, [r4]
	orrs r0, r1
	str r0, [r4]
_08163CB6:
	bl FillFactoryTrainerParty
	ldr r0, _08163CD8
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	movs r0, #6
	b _08163D38
	.align 2, 0
_08163CCC: .4byte 0x02022C90
_08163CD0: .4byte 0x00080008
_08163CD4: .4byte 0x000040CE
_08163CD8: .4byte 0x081639B5
_08163CDC:
	ldr r1, _08163CEC
	movs r0, #0x84
	lsls r0, r0, #1
	str r0, [r1]
	movs r0, #3
	bl FillFrontierTrainerParty
	b _08163D28
	.align 2, 0
_08163CEC: .4byte 0x02022C90
_08163CF0:
	ldr r1, _08163D10
	ldr r0, _08163D14
	str r0, [r1]
	movs r0, #3
	bl FillFrontierTrainerParty
	ldr r0, _08163D18
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	movs r0, #0xa
	b _08163D38
	.align 2, 0
_08163D10: .4byte 0x02022C90
_08163D14: .4byte 0x00200008
_08163D18: .4byte 0x081639B5
_08163D1C:
	ldr r1, _08163D48
	ldr r0, _08163D4C
	str r0, [r1]
	movs r0, #1
	bl FillFrontierTrainersParties
_08163D28:
	ldr r0, _08163D50
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	movs r0, #7
_08163D38:
	bl sub_080B08F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl BattleTransition_StartOnField
	b _08163D90
	.align 2, 0
_08163D48: .4byte 0x02022C90
_08163D4C: .4byte 0x00008109
_08163D50: .4byte 0x081639B5
_08163D54:
	ldr r1, _08163D98
	ldr r0, _08163D9C
	str r0, [r1]
	ldr r5, _08163DA0
	adds r0, r5, #0
	bl FillPartnerParty
	ldr r4, _08163DA4
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08163DA8
	bl BattleSetup_ConfigureTrainerBattle
	movs r0, #1
	strb r0, [r4]
	ldr r0, _08163DAC
	bl BattleSetup_ConfigureTrainerBattle
	ldr r0, _08163DB0
	strh r5, [r0]
	ldr r0, _08163DB4
	movs r1, #1
	bl CreateTask
	movs r0, #0
	bl PlayMapChosenOrBattleBGM
	movs r0, #0x12
	bl BattleTransition_StartOnField
_08163D90:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08163D98: .4byte 0x02022C90
_08163D9C: .4byte 0x00408049
_08163DA0: .4byte 0x00000C03
_08163DA4: .4byte 0x0203889C
_08163DA8: .4byte 0x0820DA82
_08163DAC: .4byte 0x0820DA91
_08163DB0: .4byte 0x0203886E
_08163DB4: .4byte 0x081639B5
	thumb_func_end DoSpecialTrainerBattle

	thumb_func_start SaveCurrentWinStreak
SaveCurrentWinStreak: @ 0x08163DB8
	push {r4, r5, r6, lr}
	ldr r6, _08163E00
	ldr r0, [r6]
	ldr r1, _08163E04
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r5, r5, #0x1e
	lsrs r5, r5, #0x1e
	ldr r0, _08163E08
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetCurrentBattleTowerWinStreak
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r6]
	lsls r5, r5, #1
	lsls r4, r4, #2
	adds r5, r5, r4
	movs r1, #0xce
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, r2
	bhs _08163DF8
	strh r2, [r1]
_08163DF8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08163E00: .4byte 0x03005AF0
_08163E04: .4byte 0x00000CA9
_08163E08: .4byte 0x000040CE
	thumb_func_end SaveCurrentWinStreak

	thumb_func_start sub_08163E0C
sub_08163E0C: @ 0x08163E0C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _08163E54
	ldr r0, [r4]
	ldr r1, _08163E58
	adds r5, r0, r1
	adds r0, r5, #0
	bl ClearBattleTowerRecord
	ldr r0, [r4]
	ldr r2, _08163E5C
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r6, r0, #0x1e
	ldr r0, _08163E60
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, [r4]
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _08163E68
	ldr r4, _08163E64
	ldrb r0, [r2, #0xa]
	ldrb r1, [r2, #0xb]
	adds r0, r0, r1
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	ldrb r1, [r2, #0xd]
	adds r0, r0, r1
	movs r1, #0x14
	b _08163E7A
	.align 2, 0
_08163E54: .4byte 0x03005AF0
_08163E58: .4byte 0x0000064C
_08163E5C: .4byte 0x00000CA9
_08163E60: .4byte 0x000040CE
_08163E64: .4byte 0x085BBE3E
_08163E68:
	ldr r4, _08163F44
	ldrb r0, [r2, #0xa]
	ldrb r1, [r2, #0xb]
	adds r0, r0, r1
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	ldrb r1, [r2, #0xd]
	adds r0, r0, r1
	movs r1, #0x1e
_08163E7A:
	bl __umodsi3
	adds r0, r0, r4
	ldrb r0, [r0]
	strb r6, [r5]
	strb r0, [r5, #1]
	adds r0, r5, #0
	adds r0, #0xc
	ldr r4, _08163F48
	ldr r1, [r4]
	adds r1, #0xa
	bl CopyTrainerId
	adds r0, r5, #4
	ldr r1, [r4]
	bl StringCopy7
	adds r0, r6, #0
	adds r1, r7, #0
	bl GetCurrentBattleTowerWinStreak
	strh r0, [r5, #2]
	movs r4, #0
	movs r2, #0x10
	adds r2, r2, r5
	mov ip, r2
	movs r7, #0x1c
	adds r7, r7, r5
	mov sb, r7
	adds r6, r5, #0
	adds r6, #0x28
	movs r0, #0xe4
	adds r0, r0, r5
	mov r8, r0
_08163EBE:
	lsls r2, r4, #1
	mov r1, ip
	adds r3, r1, r2
	ldr r0, _08163F4C
	ldr r1, [r0]
	ldr r7, _08163F50
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	mov r0, sb
	adds r3, r0, r2
	adds r7, #0xc
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, r6, r2
	ldr r0, _08163F54
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	strh r0, [r3]
	adds r4, #1
	cmp r4, #5
	ble _08163EBE
	movs r4, #0
_08163EF4:
	ldr r6, _08163F48
	ldr r0, [r6]
	lsls r1, r4, #1
	ldr r2, _08163F58
	adds r0, r0, r2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	beq _08163F1C
	adds r1, r0, #0
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08163F5C
	adds r0, r0, r1
	movs r1, #0x2c
	muls r1, r4, r1
	adds r1, #0x34
	adds r1, r5, r1
	bl sub_0806823C
_08163F1C:
	adds r4, #1
	cmp r4, #3
	ble _08163EF4
	ldr r0, _08163F60
	ldrb r0, [r0]
	mov r7, r8
	strb r0, [r7]
	ldr r0, [r6]
	ldr r1, _08163F64
	adds r0, r0, r1
	bl CalcEmeraldBattleTowerChecksum
	bl SaveCurrentWinStreak
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08163F44: .4byte 0x085BBE20
_08163F48: .4byte 0x03005AF0
_08163F4C: .4byte 0x03005AEC
_08163F50: .4byte 0x00002BBC
_08163F54: .4byte 0x00002BD4
_08163F58: .4byte 0x00000CAA
_08163F5C: .4byte 0x0202412C
_08163F60: .4byte 0x0829BDA5
_08163F64: .4byte 0x0000064C
	thumb_func_end sub_08163E0C

	thumb_func_start SaveBattleTowerProgress
SaveBattleTowerProgress: @ 0x08163F68
	push {r4, r5, lr}
	ldr r5, _08163FE8
	ldr r0, [r5]
	ldr r1, _08163FEC
	adds r0, r0, r1
	ldrb r4, [r0]
	lsls r4, r4, #0x1e
	lsrs r4, r4, #0x1e
	ldr r0, _08163FF0
	bl VarGet
	lsls r0, r0, #0x10
	ldr r5, [r5]
	lsls r4, r4, #1
	lsrs r0, r0, #0xe
	adds r4, r4, r0
	movs r2, #0xce
	lsls r2, r2, #4
	adds r0, r5, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08163FF4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08163FB6
	cmp r1, #1
	bgt _08163FB2
	ldr r1, _08163FF8
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _08163FB6
_08163FB2:
	bl sub_08163E0C
_08163FB6:
	ldr r4, _08163FE8
	ldr r0, [r4]
	ldr r1, _08163FF4
	ldrh r1, [r1]
	ldr r2, _08163FFC
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _08163FEC
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	bl sub_081A482C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08163FE8: .4byte 0x03005AF0
_08163FEC: .4byte 0x00000CA9
_08163FF0: .4byte 0x000040CE
_08163FF4: .4byte 0x02037282
_08163FF8: .4byte 0x00000CB2
_08163FFC: .4byte 0x00000CA8
	thumb_func_end SaveBattleTowerProgress

	thumb_func_start SpriteCB_Null6
SpriteCB_Null6: @ 0x08164000
	bx lr
	.align 2, 0
	thumb_func_end SpriteCB_Null6

	thumb_func_start GetEreaderTrainerFrontSpriteId
GetEreaderTrainerFrontSpriteId: @ 0x08164004
	bx lr
	.align 2, 0
	thumb_func_end GetEreaderTrainerFrontSpriteId

	thumb_func_start sub_08164008
sub_08164008: @ 0x08164008
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r4, _081640A0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r4, #0x64
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	movs r2, #0
	ldr r0, _081640A4
	ldr r1, [r0]
	ldr r0, _081640A8
	adds r5, r5, r0
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, #0xe0
	adds r0, r0, r1
	mov r3, sp
_0816404A:
	ldrh r1, [r0]
	cmp r1, r7
	beq _08164058
	cmp r1, r4
	beq _08164058
	stm r3!, {r2}
	adds r6, #1
_08164058:
	adds r0, #0xc
	adds r2, #1
	cmp r2, #2
	ble _0816404A
	bl Random
	ldr r4, _081640AC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r4]
_08164078:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r4, #2]
	ldrh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	beq _08164078
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081640A0: .4byte 0x02024190
_081640A4: .4byte 0x03005AF0
_081640A8: .4byte 0xFFFFFE70
_081640AC: .4byte 0x03005FD8
	thumb_func_end sub_08164008

	thumb_func_start sub_081640B0
sub_081640B0: @ 0x081640B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r6, _081641B0
	ldr r0, [r6]
	ldr r1, _081641B4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	str r0, [sp, #0xc]
	ldr r4, _081641B8
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r4, #0x64
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	movs r3, #0
	mov r8, r3
	movs r7, #0
	adds r2, r6, #0
	ldr r0, _081641BC
	adds r5, r5, r0
	ldr r6, _081641C0
	mov sl, sp
	movs r0, #0xec
	adds r1, r5, #0
	muls r1, r0, r1
	mov sb, r1
_0816410E:
	ldr r1, [r2]
	movs r0, #0x2c
	muls r0, r7, r0
	mov r3, sb
	adds r5, r0, r3
	adds r1, r1, r5
	adds r0, r1, r6
	ldrh r0, [r0]
	ldr r3, [sp, #0x10]
	cmp r0, r3
	beq _08164162
	ldr r3, [sp, #0x14]
	cmp r0, r3
	beq _08164162
	movs r0, #0xef
	lsls r0, r0, #3
	adds r4, r1, r0
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r2, [sp, #0x18]
	bl GetFrontierEnemyMonLevel
	ldrb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x18]
	cmp r1, r0
	bhi _08164162
	ldr r0, [r2]
	adds r0, r0, r5
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0
	beq _08164162
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	stm r3!, {r7}
	movs r0, #1
	add r8, r0
_08164162:
	adds r7, #1
	cmp r7, #3
	ble _0816410E
	bl Random
	ldr r4, _081641C4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, r8
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r4, #4]
_08164180:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, r8
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r4, #6]
	ldrh r1, [r4, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	beq _08164180
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081641B0: .4byte 0x03005AF0
_081641B4: .4byte 0x00000CA9
_081641B8: .4byte 0x02024190
_081641BC: .4byte 0xFFFFFED4
_081641C0: .4byte 0x0000076C
_081641C4: .4byte 0x03005FD8
	thumb_func_end sub_081640B0

	thumb_func_start sub_081641C8
sub_081641C8: @ 0x081641C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	ldr r0, _08164530
	ldr r0, [r0]
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r1, r0, r1
	str r1, [sp, #0x24]
	ldr r5, _08164534
	ldr r0, [r5]
	ldr r2, _08164538
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	str r0, [sp, #0x14]
	ldr r0, _0816453C
	bl VarGet
	lsls r0, r0, #0x10
	ldr r1, [r5]
	ldr r3, [sp, #0x14]
	lsls r2, r3, #1
	lsrs r0, r0, #0xe
	adds r2, r2, r0
	movs r4, #0xce
	lsls r4, r4, #4
	adds r1, r1, r4
	adds r1, r1, r2
	ldrh r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	ldr r4, _08164540
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x1c]
	adds r4, #0x64
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x20]
	bl SetFacilityPtrsGetLevel
	movs r7, #0
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x18
	mov sl, r0
_08164240:
	lsls r6, r7, #1
_08164242:
	mov r1, sl
	lsrs r0, r1, #0x18
	movs r1, #0
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r2, #0
	mov sb, r2
	cmp sb, r7
	bge _08164290
	ldr r0, [r5]
	ldr r3, _08164544
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, r8
	beq _08164290
	ldr r0, _08164548
	ldr r2, [r0]
	movs r4, #0x34
	mov r0, r8
	muls r0, r4, r0
	adds r0, r0, r2
	ldrb r3, [r0]
_08164274:
	ldrh r0, [r1]
	muls r0, r4, r0
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r3
	beq _08164290
	adds r1, #2
	movs r0, #1
	add sb, r0
	cmp sb, r7
	bge _08164290
	ldrh r0, [r1]
	cmp r0, r8
	bne _08164274
_08164290:
	cmp sb, r7
	bne _08164242
	ldr r0, [r5]
	ldr r1, _08164544
	adds r0, r0, r1
	adds r0, r0, r6
	mov r2, r8
	strh r2, [r0]
	mov r7, sb
	adds r7, #1
	cmp r7, #5
	ble _08164240
	movs r3, #8
	mov sl, r3
	movs r4, #0
	mov sb, r4
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x40]
_081642B4:
	ldr r1, _08164534
	ldr r0, [r1]
	mov r2, sb
	lsls r1, r2, #1
	ldr r3, _08164544
	adds r0, r0, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	bl GetBattleFacilityTrainerGfxId
	ldr r4, [sp, #0x40]
	strb r0, [r4, #0x19]
	movs r7, #0
_081642D0:
	adds r0, r7, #1
	str r0, [sp, #0x30]
	mov r1, sl
	lsls r1, r1, #1
	str r1, [sp, #0x38]
	mov r2, sl
	adds r2, #1
	str r2, [sp, #0x34]
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #1
	str r0, [sp, #0x28]
_081642E8:
	mov r0, r8
	bl RandomizeFacilityTrainerMonSet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _0816431C
	ldr r3, _08164534
	ldr r0, [r3]
	ldr r4, _08164544
	adds r0, r0, r4
	ldr r1, [sp, #0x28]
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r0, _0816454C
	ldr r0, [r0]
	lsls r2, r2, #4
	adds r2, r2, r0
	lsls r1, r6, #4
	adds r1, r1, r0
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	beq _081642E8
_0816431C:
	movs r5, #8
	cmp r5, sl
	bge _08164358
	ldr r2, _08164534
	ldr r0, [r2]
	ldr r1, _0816454C
	ldr r3, [r1]
	lsls r1, r6, #4
	adds r1, r1, r3
	ldr r4, _08164550
	adds r2, r0, r4
	ldrh r0, [r1]
	mov ip, r0
_08164336:
	ldrh r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, ip
	beq _08164358
	ldrh r0, [r1]
	ldr r4, [sp, #0x1c]
	cmp r4, r0
	beq _08164358
	ldr r4, [sp, #0x20]
	cmp r4, r0
	beq _08164358
	adds r2, #2
	adds r5, #1
	cmp r5, sl
	blt _08164336
_08164358:
	cmp r5, sl
	bne _081642E8
	ldr r1, _08164534
	ldr r0, [r1]
	ldr r2, _08164544
	adds r0, r0, r2
	ldr r3, [sp, #0x38]
	adds r0, r0, r3
	strh r6, [r0]
	ldr r4, [sp, #0x34]
	mov sl, r4
	ldr r7, [sp, #0x30]
	cmp r7, #1
	ble _081642D0
	ldr r0, [sp, #0x40]
	adds r0, #0x18
	str r0, [sp, #0x40]
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #5
	ble _081642B4
	movs r3, #0
	mov sl, r3
	bl ValidateApprenticesChecksums
	movs r4, #0
	mov sb, r4
	ldr r0, _08164534
	ldr r0, [r0]
	movs r2, #0
	adds r6, r0, #0
	adds r6, #0xdc
	mov r8, sp
_0816439C:
	ldrb r0, [r6]
	lsls r4, r0, #0x19
	lsrs r0, r4, #0x1e
	cmp r0, #0
	beq _08164408
	ldr r1, _08164554
	ldrb r0, [r6, #1]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #7
	str r2, [sp, #0x44]
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x44]
	ldr r1, [sp, #0x18]
	cmp r0, r1
	bgt _08164408
	lsrs r0, r4, #0x1e
	subs r0, #1
	ldr r3, [sp, #0x14]
	cmp r0, r3
	bne _08164408
	movs r5, #0
	ldr r0, _08164534
	ldr r0, [r0]
	adds r0, #0xe0
	adds r1, r2, r0
	movs r7, #2
_081643D8:
	ldrh r0, [r1]
	ldr r4, [sp, #0x1c]
	cmp r4, r0
	beq _081643E8
	ldr r3, [sp, #0x20]
	cmp r3, r0
	beq _081643E8
	adds r5, #1
_081643E8:
	adds r1, #0xc
	subs r7, #1
	cmp r7, #0
	bge _081643D8
	cmp r5, #2
	ble _08164408
	movs r0, #0xc8
	lsls r0, r0, #1
	add r0, sb
	mov r4, r8
	adds r4, #4
	mov r8, r4
	subs r4, #4
	stm r4!, {r0}
	movs r0, #1
	add sl, r0
_08164408:
	adds r2, #0x44
	adds r6, #0x44
	movs r1, #1
	add sb, r1
	mov r3, sb
	cmp r3, #3
	ble _0816439C
	mov r4, sl
	cmp r4, #0
	beq _0816445A
	bl Random
	ldr r6, _08164534
	ldr r4, [r6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	movs r5, #0xcc
	lsls r5, r5, #4
	adds r4, r4, r5
	strh r0, [r4]
	ldrh r0, [r4]
	bl GetBattleFacilityTrainerGfxId
	ldr r1, [sp, #0x24]
	adds r1, #0xa8
	strb r0, [r1, #1]
	movs r0, #0xd8
	lsls r0, r0, #2
	bl FlagClear
	ldr r0, [r6]
	adds r0, r0, r5
	ldrh r0, [r0]
	bl sub_08164008
_0816445A:
	movs r0, #0
	mov sl, r0
	mov sb, r0
	mov r1, sp
	str r1, [sp, #0x3c]
_08164464:
	ldr r0, _08164534
	movs r2, #0xec
	mov r1, sb
	muls r1, r2, r1
	movs r3, #0xe7
	lsls r3, r3, #3
	adds r1, r1, r3
	ldr r0, [r0]
	movs r2, #0
	movs r3, #0
	movs r7, #0
	mov r4, sb
	adds r4, #1
	str r4, [sp, #0x2c]
	adds r1, r0, r1
_08164482:
	ldm r1!, {r0}
	orrs r2, r0
	adds r3, r3, r0
	adds r7, #1
	cmp r7, #0x39
	bls _08164482
	ldr r0, _08164534
	ldr r5, [r0]
	movs r1, #0xec
	mov r6, sb
	muls r6, r1, r6
	adds r4, r5, r6
	ldr r1, _08164558
	adds r0, r4, r1
	ldrh r0, [r0]
	movs r1, #7
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp, #0x44]
	ldr r3, [sp, #0x48]
	ldr r1, [sp, #0x18]
	cmp r0, r1
	bgt _0816457E
	movs r1, #0xe7
	lsls r1, r1, #3
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r4, [sp, #0x14]
	cmp r0, r4
	bne _0816457E
	cmp r2, #0
	beq _0816457E
	adds r1, #0xe8
	adds r0, r5, r1
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, r3
	bne _0816457E
	movs r5, #0
	movs r7, #0
	ldr r2, _08164534
	mov r8, r2
	ldr r3, _0816455C
_081644E0:
	mov r4, r8
	ldr r2, [r4]
	movs r0, #0x2c
	adds r1, r7, #0
	muls r1, r0, r1
	movs r4, #0xec
	mov r0, sb
	muls r0, r4, r0
	adds r6, r1, r0
	adds r2, r2, r6
	adds r0, r2, r3
	ldrh r0, [r0]
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	beq _08164564
	ldr r4, [sp, #0x20]
	cmp r4, r0
	beq _08164564
	movs r0, #0xef
	lsls r0, r0, #3
	adds r4, r2, r0
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp, #0x48]
	bl GetFrontierEnemyMonLevel
	ldrb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x48]
	cmp r1, r0
	bhi _08164564
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r6
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, #0
	b _08164560
	.align 2, 0
_08164530: .4byte 0x03005AEC
_08164534: .4byte 0x03005AF0
_08164538: .4byte 0x00000CA9
_0816453C: .4byte 0x000040CE
_08164540: .4byte 0x02024190
_08164544: .4byte 0x00000CB4
_08164548: .4byte 0x0203B954
_0816454C: .4byte 0x0203B958
_08164550: .4byte 0x00000CC4
_08164554: .4byte 0x085BE930
_08164558: .4byte 0x0000073A
_0816455C: .4byte 0x0000076C
_08164560:
	beq _08164564
	adds r5, #1
_08164564:
	adds r7, #1
	cmp r7, #3
	ble _081644E0
	cmp r5, #1
	ble _0816457E
	movs r0, #0x96
	lsls r0, r0, #1
	add r0, sb
	ldr r3, [sp, #0x3c]
	stm r3!, {r0}
	str r3, [sp, #0x3c]
	movs r4, #1
	add sl, r4
_0816457E:
	ldr r0, [sp, #0x2c]
	mov sb, r0
	cmp r0, #4
	bgt _08164588
	b _08164464
_08164588:
	mov r1, sl
	cmp r1, #0
	beq _081645C8
	bl Random
	ldr r6, _081645D8
	ldr r4, [r6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	ldr r5, _081645DC
	adds r4, r4, r5
	strh r0, [r4]
	ldrh r0, [r4]
	bl GetBattleFacilityTrainerGfxId
	ldr r1, [sp, #0x24]
	adds r1, #0xc0
	strb r0, [r1, #1]
	ldr r0, _081645E0
	bl FlagClear
	ldr r0, [r6]
	adds r0, r0, r5
	ldrh r0, [r0]
	bl sub_081640B0
_081645C8:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081645D8: .4byte 0x03005AF0
_081645DC: .4byte 0x00000CC2
_081645E0: .4byte 0x00000361
	thumb_func_end sub_081641C8

	thumb_func_start sub_081645E4
sub_081645E4: @ 0x081645E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r7, #0
	movs r6, #0
	bl SetFacilityPtrsGetLevel
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r5, r0
	beq _081646CC
	subs r0, #0xc9
	cmp r5, r0
	bhi _0816461C
	ldr r0, _08164618
	ldr r1, [r0]
	lsls r0, r4, #4
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldrh r6, [r0]
	b _081646CC
	.align 2, 0
_08164618: .4byte 0x0203B958
_0816461C:
	ldr r0, _08164654
	cmp r5, r0
	bhi _0816466C
	ldr r0, _08164658
	ldr r3, [r0]
	ldr r1, _0816465C
	ldr r0, _08164660
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x2c
	muls r1, r0, r1
	ldr r0, _08164664
	adds r2, r5, r0
	movs r0, #0xec
	muls r0, r2, r0
	adds r1, r1, r0
	adds r3, r3, r1
	movs r1, #0xee
	lsls r1, r1, #3
	adds r0, r3, r1
	ldrh r7, [r0]
	ldr r2, _08164668
	adds r3, r3, r2
	ldrh r6, [r3]
	b _081646CC
	.align 2, 0
_08164654: .4byte 0x0000018F
_08164658: .4byte 0x03005AF0
_0816465C: .4byte 0x03005FD8
_08164660: .4byte 0x02037282
_08164664: .4byte 0xFFFFFED4
_08164668: .4byte 0x0000076C
_0816466C:
	ldr r4, _081646F4
	ldr r3, [r4]
	ldr r1, _081646F8
	ldr r0, _081646FC
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _08164700
	adds r1, r5, r2
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r3, r3, r0
	adds r0, r3, #0
	adds r0, #0xe2
	ldrh r7, [r0]
	adds r3, #0xe0
	ldrh r6, [r3]
	movs r3, #0
	ldr r0, _08164704
	mov sb, r0
	mov r8, sb
	mov ip, r4
	adds r5, r2, #0
	movs r4, #0x8a
	lsls r4, r4, #1
_081646AC:
	mov r1, r8
	adds r2, r3, r1
	mov r1, ip
	ldr r0, [r1]
	adds r1, r3, r5
	adds r0, r0, r4
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	cmp r3, #6
	ble _081646AC
	mov r2, sb
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
_081646CC:
	ldr r0, _08164708
	lsls r1, r7, #3
	ldr r2, _0816470C
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _08164710
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	ldr r2, _08164714
	adds r1, r1, r2
	bl StringCopy
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081646F4: .4byte 0x03005AF0
_081646F8: .4byte 0x03005FD8
_081646FC: .4byte 0x02037282
_08164700: .4byte 0xFFFFFE70
_08164704: .4byte 0x02021C68
_08164708: .4byte 0x02021C40
_0816470C: .4byte 0x082EACC4
_08164710: .4byte 0x02021C54
_08164714: .4byte 0x082EA31C
	thumb_func_end sub_081645E4

	thumb_func_start sub_08164718
sub_08164718: @ 0x08164718
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	bl SetFacilityPtrsGetLevel
	bl GetCurrentFacilityWinStreak
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0816475C
	ldrh r0, [r0]
	subs r5, r0, #2
	ldr r0, _08164760
	ldr r0, [r0]
	lsls r1, r5, #1
	ldr r2, _08164764
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r7, [r0]
	movs r3, #0
	str r3, [sp]
	ldr r4, _08164768
	lsls r6, r7, #0x10
	b _08164774
	.align 2, 0
_0816475C: .4byte 0x02037292
_08164760: .4byte 0x03005AF0
_08164764: .4byte 0x00000CB4
_08164768: .4byte 0x085BC444
_0816476C:
	adds r4, #8
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
_08164774:
	ldr r1, [sp]
	cmp r1, #0x31
	bhi _0816478A
	lsrs r0, r6, #0x10
	bl GetFrontierTrainerFacilityClass
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	cmp r1, r0
	bne _0816476C
_0816478A:
	ldr r0, _081647A0
	ldrh r0, [r0]
	cmp r0, #4
	bls _08164794
	b _081649A2
_08164794:
	lsls r0, r0, #2
	ldr r1, _081647A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081647A0: .4byte 0x02037282
_081647A4: .4byte 0x081647A8
_081647A8: @ jump table
	.4byte _081647BC @ case 0
	.4byte _08164864 @ case 1
	.4byte _0816487C @ case 2
	.4byte _0816489C @ case 3
	.4byte _081649A2 @ case 4
_081647BC:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r7, r0
	bne _081647C6
	b _08164A34
_081647C6:
	subs r0, #0xc9
	cmp r7, r0
	ble _081647D2
	ldr r0, _081647DC
	cmp r7, r0
	bgt _081647E4
_081647D2:
	ldr r0, _081647E0
	adds r1, r7, #0
	bl GetFrontierTrainerName
	b _081649A2
	.align 2, 0
_081647DC: .4byte 0x0000018F
_081647E0: .4byte 0x02021C40
_081647E4:
	movs r3, #0
	ldr r6, _08164850
	lsls r2, r7, #0x10
	str r2, [sp, #4]
	ldr r4, _08164854
	mov sl, r4
	ldr r5, _08164858
	mov ip, r5
	mov sb, sl
	mov r8, r6
	ldr r0, _0816485C
	adds r1, r7, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r4, r0, #2
	movs r5, #0x8a
	lsls r5, r5, #1
_08164806:
	mov r1, sb
	adds r2, r3, r1
	mov r1, r8
	ldr r0, [r1]
	adds r1, r3, r4
	adds r0, r0, r5
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	cmp r3, #6
	ble _08164806
	mov r2, sl
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r6]
	ldr r3, _0816485C
	adds r2, r7, r3
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xde
	ldrb r1, [r1]
	mov r0, ip
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, _08164860
	ldr r4, [sp, #4]
	lsrs r1, r4, #0x10
	bl GetFrontierTrainerName
	b _081649A2
	.align 2, 0
_08164850: .4byte 0x03005AF0
_08164854: .4byte 0x02021C40
_08164858: .4byte 0x02021C54
_0816485C: .4byte 0xFFFFFE70
_08164860: .4byte 0x02021C68
_08164864:
	ldr r0, _08164874
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r1, r0
	ldr r5, _08164878
	adds r1, r1, r5
	b _08164888
	.align 2, 0
_08164874: .4byte 0x03005AF0
_08164878: .4byte 0x00000CC4
_0816487C:
	ldr r0, _08164894
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r1, r0
	ldr r0, _08164898
	adds r1, r1, r0
_08164888:
	adds r0, r7, #0
	ldrh r1, [r1]
	bl sub_081645E4
	b _081649A2
	.align 2, 0
_08164894: .4byte 0x03005AF0
_08164898: .4byte 0x00000CC6
_0816489C:
	ldr r0, _081648D0
	strh r7, [r0]
	ldr r0, _081648D4
	cmp r7, r0
	bgt _081648E8
	ldr r0, _081648D8
	ldr r4, [r0]
	lsls r1, r5, #1
	adds r0, r1, #0
	adds r0, #8
	lsls r0, r0, #1
	ldr r3, _081648DC
	adds r2, r4, r3
	adds r0, r2, r0
	ldrh r3, [r0]
	ldr r5, _081648E0
	adds r0, r4, r5
	strh r3, [r0]
	adds r1, #9
	lsls r1, r1, #1
	adds r2, r2, r1
	ldrh r0, [r2]
	ldr r1, _081648E4
	adds r4, r4, r1
	strh r0, [r4]
	b _08164926
	.align 2, 0
_081648D0: .4byte 0x0203886E
_081648D4: .4byte 0x0000012B
_081648D8: .4byte 0x03005AF0
_081648DC: .4byte 0x00000CB4
_081648E0: .4byte 0x00000CD8
_081648E4: .4byte 0x00000CDA
_081648E8:
	ldr r0, _08164900
	cmp r7, r0
	bgt _08164910
	ldr r0, _08164904
	ldr r1, [r0]
	ldr r3, _08164908
	ldrh r2, [r3, #4]
	ldr r4, _0816490C
	adds r0, r1, r4
	strh r2, [r0]
	ldrh r0, [r3, #6]
	b _08164920
	.align 2, 0
_08164900: .4byte 0x0000018F
_08164904: .4byte 0x03005AF0
_08164908: .4byte 0x03005FD8
_0816490C: .4byte 0x00000CD8
_08164910:
	ldr r0, _081649B8
	ldr r1, [r0]
	ldr r3, _081649BC
	ldrh r2, [r3]
	ldr r4, _081649C0
	adds r0, r1, r4
	strh r2, [r0]
	ldrh r0, [r3, #2]
_08164920:
	ldr r5, _081649C4
	adds r1, r1, r5
	strh r0, [r1]
_08164926:
	movs r5, #0
	mov r0, r8
	lsls r0, r0, #0x18
	str r0, [sp, #8]
_0816492E:
	lsls r1, r5, #1
	mov sl, r1
	adds r2, r5, #1
	mov sb, r2
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r0, r0, #1
	lsls r0, r0, #0x18
	mov r8, r0
_08164940:
	ldr r3, [sp, #8]
	lsrs r0, r3, #0x18
	mov r4, r8
	lsrs r1, r4, #0x18
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _081649C8
	ldrh r0, [r0]
	cmp r0, r3
	beq _08164940
	movs r2, #0
	cmp r2, r5
	bge _08164982
	ldr r1, _081649B8
	ldr r0, [r1]
	ldr r4, _081649CC
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r6, r1, #0
	cmp r0, r3
	beq _08164982
_0816496E:
	adds r2, #1
	cmp r2, r5
	bge _08164982
	ldr r0, [r6]
	lsls r1, r2, #1
	adds r0, r0, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _0816496E
_08164982:
	cmp r2, r5
	bne _08164940
	ldr r5, _081649B8
	ldr r0, [r5]
	ldr r1, _081649CC
	adds r0, r0, r1
	add r0, sl
	strh r3, [r0]
	mov r5, sb
	ldr r6, _081649B8
	cmp r5, #0xd
	ble _0816492E
	ldr r0, [r6]
	ldr r2, _081649D0
	adds r0, r0, r2
	strh r7, [r0]
_081649A2:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r7, r0
	beq _08164A34
	subs r0, #0xc9
	cmp r7, r0
	bgt _081649D8
	ldr r0, _081649D4
	ldr r3, [sp]
	lsls r1, r3, #3
	b _081649E4
	.align 2, 0
_081649B8: .4byte 0x03005AF0
_081649BC: .4byte 0x03005FD8
_081649C0: .4byte 0x00000CD8
_081649C4: .4byte 0x00000CDA
_081649C8: .4byte 0x0203886E
_081649CC: .4byte 0x00000CB4
_081649D0: .4byte 0x00000CD6
_081649D4: .4byte 0x085BC444
_081649D8:
	ldr r0, _081649FC
	cmp r7, r0
	bgt _08164A08
	ldr r0, _08164A00
	ldr r4, [sp]
	lsls r1, r4, #3
_081649E4:
	adds r0, #4
	adds r1, r1, r0
	ldr r0, _08164A04
	ldrh r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	b _08164A34
	.align 2, 0
_081649FC: .4byte 0x0000018F
_08164A00: .4byte 0x085BC444
_08164A04: .4byte 0x02037282
_08164A08:
	ldr r0, _08164A44
	ldr r1, [r0]
	ldr r5, _08164A48
	adds r2, r7, r5
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xdc
	ldrb r0, [r1]
	lsls r0, r0, #0x1b
	ldr r1, _08164A4C
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldr r1, _08164A50
	ldrh r1, [r1]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
_08164A34:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08164A44: .4byte 0x03005AF0
_08164A48: .4byte 0xFFFFFE70
_08164A4C: .4byte 0x085BC5D4
_08164A50: .4byte 0x02037282
	thumb_func_end sub_08164718

	thumb_func_start sub_08164A54
sub_08164A54: @ 0x08164A54
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r4, _08164A98
	ldr r0, [r4]
	ldr r1, _08164A9C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r7, r0, #0x1e
	ldr r0, _08164AA0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4]
	ldr r2, _08164AA4
	adds r0, r0, r2
	ldrh r6, [r0]
	bl GetMultiplayerId
	ldr r0, _08164AA8
	ldrh r0, [r0]
	cmp r0, #6
	bls _08164A8C
	b _08164C96
_08164A8C:
	lsls r0, r0, #2
	ldr r1, _08164AAC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08164A98: .4byte 0x03005AF0
_08164A9C: .4byte 0x00000CA9
_08164AA0: .4byte 0x000040CE
_08164AA4: .4byte 0x00000CB2
_08164AA8: .4byte 0x02037290
_08164AAC: .4byte 0x08164AB0
_08164AB0: @ jump table
	.4byte _08164ACC @ case 0
	.4byte _08164B1C @ case 1
	.4byte _08164BC0 @ case 2
	.4byte _08164BF4 @ case 3
	.4byte _08164C78 @ case 4
	.4byte _08164C88 @ case 5
	.4byte _08164C96 @ case 6
_08164ACC:
	cmp r5, #3
	beq _08164AD2
	b _08164C90
_08164AD2:
	ldr r0, _08164B10
	ldr r0, [r0]
	lsls r1, r7, #1
	adds r0, r0, r1
	ldr r3, _08164B14
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08164AF8
	b _08164C96
_08164AF8:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	movs r2, #4
	bl SendBlock
	ldr r1, _08164B18
	movs r0, #1
	b _08164C94
	.align 2, 0
_08164B10: .4byte 0x03005AF0
_08164B14: .4byte 0x00000CEC
_08164B18: .4byte 0x02037290
_08164B1C:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	beq _08164B2A
	b _08164C96
_08164B2A:
	bl ResetBlockReceivedFlags
	ldr r1, _08164BB0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r1, r0
	ldrh r0, [r1]
	ldrh r3, [r2]
	cmp r0, r3
	bhi _08164B40
	ldrh r0, [r2]
_08164B40:
	str r0, [sp]
	movs r4, #0
	ldr r0, _08164BB4
	mov sb, r0
_08164B48:
	adds r1, r4, #1
	mov r8, r1
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	lsls r7, r0, #0x18
_08164B54:
	ldr r0, [sp]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r7, #0x18
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	cmp r2, r4
	bge _08164B90
	mov r1, sb
	ldr r0, [r1]
	ldr r1, _08164BB8
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r3
	beq _08164B90
	ldr r6, _08164BB4
	adds r5, r1, #0
_08164B7C:
	adds r2, #1
	cmp r2, r4
	bge _08164B90
	ldr r0, [r6]
	lsls r1, r2, #1
	adds r0, r0, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _08164B7C
_08164B90:
	cmp r4, r2
	bne _08164B54
	mov r2, sb
	ldr r0, [r2]
	lsls r1, r4, #1
	ldr r2, _08164BB8
	adds r0, r0, r2
	adds r0, r0, r1
	strh r3, [r0]
	mov r4, r8
	cmp r4, #0xd
	ble _08164B48
	ldr r1, _08164BBC
	movs r0, #2
	b _08164C94
	.align 2, 0
_08164BB0: .4byte 0x0202207C
_08164BB4: .4byte 0x03005AF0
_08164BB8: .4byte 0x00000CB4
_08164BBC: .4byte 0x02037290
_08164BC0:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08164C96
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08164BE8
	ldr r1, [r1]
	ldr r3, _08164BEC
	adds r1, r1, r3
	movs r2, #0x28
	bl SendBlock
	ldr r1, _08164BF0
	movs r0, #3
	b _08164C94
	.align 2, 0
_08164BE8: .4byte 0x03005AF0
_08164BEC: .4byte 0x00000CB4
_08164BF0: .4byte 0x02037290
_08164BF4:
	bl GetBlockReceivedStatus
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	bne _08164C96
	bl ResetBlockReceivedFlags
	ldr r4, _08164C58
	ldr r0, [r4]
	ldr r5, _08164C5C
	adds r0, r0, r5
	ldr r1, _08164C60
	movs r2, #0x28
	bl memcpy
	ldr r2, _08164C64
	ldr r1, [r4]
	lsls r0, r6, #2
	adds r1, r1, r5
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r4, _08164C68
	lsls r0, r6, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r2]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	ldrh r0, [r4]
	movs r1, #1
	bl SetBattleFacilityTrainerGfxId
	ldr r0, _08164C6C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08164C90
	ldr r0, _08164C70
	ldrb r0, [r0]
	cmp r0, #0
	bne _08164C90
	ldr r1, _08164C74
	movs r0, #4
	b _08164C94
	.align 2, 0
_08164C58: .4byte 0x03005AF0
_08164C5C: .4byte 0x00000CB4
_08164C60: .4byte 0x0202207C
_08164C64: .4byte 0x0203886A
_08164C68: .4byte 0x0203886C
_08164C6C: .4byte 0x030031C4
_08164C70: .4byte 0x0300319C
_08164C74: .4byte 0x02037290
_08164C78:
	bl sub_0800A7F8
	ldr r1, _08164C84
	movs r0, #5
	b _08164C94
	.align 2, 0
_08164C84: .4byte 0x02037290
_08164C88:
	ldr r0, _08164CA4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08164C96
_08164C90:
	ldr r1, _08164CA8
	movs r0, #6
_08164C94:
	strh r0, [r1]
_08164C96:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08164CA4: .4byte 0x030031C4
_08164CA8: .4byte 0x02037290
	thumb_func_end sub_08164A54

	thumb_func_start sub_08164CAC
sub_08164CAC: @ 0x08164CAC
	push {lr}
	ldr r0, _08164CC0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08164CBA
	bl sub_0800A7F8
_08164CBA:
	pop {r0}
	bx r0
	.align 2, 0
_08164CC0: .4byte 0x0300319C
	thumb_func_end sub_08164CAC

	thumb_func_start sub_08164CC4
sub_08164CC4: @ 0x08164CC4
	push {lr}
	ldr r0, _08164CDC
	ldr r0, [r0]
	ldr r1, _08164CE0
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0xf
	bl SetBattleFacilityTrainerGfxId
	pop {r0}
	bx r0
	.align 2, 0
_08164CDC: .4byte 0x03005AF0
_08164CE0: .4byte 0x00000CD6
	thumb_func_end sub_08164CC4

	thumb_func_start sub_08164CE4
sub_08164CE4: @ 0x08164CE4
	push {r4, r5, r6, lr}
	ldr r0, _08164D70
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08164D6A
	ldr r5, _08164D74
	ldr r0, [r5]
	ldr r1, _08164D78
	adds r0, r0, r1
	ldr r4, _08164D7C
	ldrh r1, [r4]
	bl GetFrontierTrainerName
	ldr r0, [r5]
	ldr r2, _08164D80
	adds r0, r0, r2
	ldrh r1, [r4]
	bl GetBattleTowerTrainerLanguage
	ldr r6, _08164D84
	ldrh r0, [r6, #2]
	movs r4, #0x64
	muls r0, r4, r0
	ldr r1, _08164D88
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	ldr r1, [r5]
	ldr r2, _08164D8C
	adds r1, r1, r2
	strh r0, [r1]
	ldrh r0, [r6]
	muls r0, r4, r0
	ldr r1, _08164D90
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	ldr r1, [r5]
	ldr r2, _08164D94
	adds r1, r1, r2
	strh r0, [r1]
	movs r2, #0
	movs r4, #0xbe
	lsls r4, r4, #4
	ldr r3, _08164D98
	adds r6, r5, #0
_08164D4C:
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, r0, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #9
	ble _08164D4C
	ldr r0, [r6]
	ldr r1, _08164D9C
	ldrb r1, [r1]
	ldr r2, _08164DA0
	adds r0, r0, r2
	strb r1, [r0]
_08164D6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08164D70: .4byte 0x000040CE
_08164D74: .4byte 0x03005AF0
_08164D78: .4byte 0x00000BD8
_08164D7C: .4byte 0x0203886A
_08164D80: .4byte 0x00000BEB
_08164D84: .4byte 0x02023D12
_08164D88: .4byte 0x020243E8
_08164D8C: .4byte 0x00000BD6
_08164D90: .4byte 0x02024190
_08164D94: .4byte 0x00000BD4
_08164D98: .4byte 0x02023D58
_08164D9C: .4byte 0x02023FDE
_08164DA0: .4byte 0x00000D06
	thumb_func_end sub_08164CE4

	thumb_func_start ValidateBattleTowerRecordChecksums
ValidateBattleTowerRecordChecksums: @ 0x08164DA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08164E30
	ldr r0, [r0]
	movs r3, #0
	movs r2, #0
	ldr r4, _08164E34
	adds r1, r0, r4
_08164DB6:
	ldm r1!, {r0}
	adds r3, r3, r0
	adds r2, #1
	cmp r2, #0x39
	bls _08164DB6
	ldr r5, _08164E30
	ldr r1, [r5]
	ldr r2, _08164E38
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, r3
	beq _08164DD6
	ldr r3, _08164E34
	adds r0, r1, r3
	bl ClearBattleTowerRecord
_08164DD6:
	movs r4, #0
	adds r7, r5, #0
	movs r6, #0xec
	mov r8, r7
_08164DDE:
	adds r0, r4, #0
	muls r0, r6, r0
	movs r1, #0xe7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r1, [r7]
	movs r3, #0
	movs r2, #0
	adds r5, r4, #1
	adds r1, r1, r0
_08164DF2:
	ldm r1!, {r0}
	adds r3, r3, r0
	adds r2, #1
	cmp r2, #0x39
	bls _08164DF2
	mov r0, r8
	ldr r2, [r0]
	adds r1, r4, #0
	muls r1, r6, r1
	movs r4, #0x82
	lsls r4, r4, #4
	adds r0, r2, r4
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r3
	beq _08164E1E
	movs r3, #0xe7
	lsls r3, r3, #3
	adds r0, r1, r3
	adds r0, r2, r0
	bl ClearBattleTowerRecord
_08164E1E:
	adds r4, r5, #0
	cmp r4, #4
	ble _08164DDE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08164E30: .4byte 0x03005AF0
_08164E34: .4byte 0x0000064C
_08164E38: .4byte 0x00000734
	thumb_func_end ValidateBattleTowerRecordChecksums

	thumb_func_start CalcEmeraldBattleTowerChecksum
CalcEmeraldBattleTowerChecksum: @ 0x08164E3C
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0xe8
	movs r1, #0
	str r1, [r2]
	movs r3, #0
	adds r4, r0, #0
_08164E4A:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r0, r1
	str r0, [r2]
	adds r3, #1
	cmp r3, #0x39
	bls _08164E4A
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CalcEmeraldBattleTowerChecksum

	thumb_func_start CalcRubyBattleTowerChecksum
CalcRubyBattleTowerChecksum: @ 0x08164E60
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0xa0
	movs r1, #0
	str r1, [r2]
	movs r3, #0
	adds r4, r0, #0
_08164E6E:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r0, r1
	str r0, [r2]
	adds r3, #1
	cmp r3, #0x27
	bls _08164E6E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CalcRubyBattleTowerChecksum

	thumb_func_start ClearBattleTowerRecord
ClearBattleTowerRecord: @ 0x08164E84
	push {lr}
	movs r1, #0
	movs r2, #0
_08164E8A:
	stm r0!, {r2}
	adds r1, #1
	cmp r1, #0x3a
	bls _08164E8A
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearBattleTowerRecord

	thumb_func_start GetCurrentBattleTowerWinStreak
GetCurrentBattleTowerWinStreak: @ 0x08164E98
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _08164EC0
	ldr r2, [r2]
	lsrs r0, r0, #0x17
	lsrs r1, r1, #0x16
	adds r0, r0, r1
	movs r1, #0xce
	lsls r1, r1, #4
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r0, [r2]
	ldr r1, _08164EC4
	cmp r0, r1
	bls _08164EBA
	adds r0, r1, #0
_08164EBA:
	pop {r1}
	bx r1
	.align 2, 0
_08164EC0: .4byte 0x03005AF0
_08164EC4: .4byte 0x0000270F
	thumb_func_end GetCurrentBattleTowerWinStreak

	thumb_func_start AwardBattleTowerRibbons
AwardBattleTowerRibbons: @ 0x08164EC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r0, _08164FC0
	ldr r0, [r0]
	ldr r1, _08164FC4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	adds r4, r0, #0
	ldr r0, _08164FC8
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0x44
	mov sb, r2
	cmp r4, #0
	beq _08164EF8
	movs r0, #0x45
	mov sb, r0
_08164EF8:
	ldr r5, _08164FCC
	movs r0, #0
	strh r0, [r5]
	adds r0, r4, #0
	bl GetCurrentBattleTowerWinStreak
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x37
	bls _08164F64
	movs r6, #0
	ldr r7, _08164FD0
	mov r8, r5
	mov r5, sp
_08164F14:
	ldr r0, _08164FC0
	ldr r0, [r0]
	lsls r1, r6, #1
	ldr r2, _08164FD4
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	subs r1, #1
	movs r0, #0
	strb r1, [r5]
	strb r0, [r5, #1]
	movs r0, #0x64
	muls r0, r1, r0
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r0, [r7]
	adds r0, r0, r4
	mov r1, sb
	bl GetMonData
	cmp r0, #0
	bne _08164F5C
	movs r0, #1
	mov r2, r8
	strh r0, [r2]
	ldr r0, [r7]
	adds r0, r0, r4
	mov r1, sb
	bl SetMonData
	ldr r0, [r7]
	adds r0, r0, r4
	bl GetRibbonCount
	strb r0, [r5, #1]
_08164F5C:
	adds r5, #4
	adds r6, #1
	cmp r6, #2
	ble _08164F14
_08164F64:
	ldr r0, _08164FCC
	ldrh r0, [r0]
	cmp r0, #0
	beq _08164FB2
	movs r0, #0x2a
	bl IncrementGameStat
	mov r3, sp
	add r2, sp, #4
	movs r6, #1
_08164F78:
	ldrb r1, [r3, #1]
	ldrb r0, [r2, #1]
	cmp r0, r1
	bls _08164F88
	ldr r1, [sp]
	ldr r0, [r2]
	str r0, [sp]
	str r1, [r2]
_08164F88:
	adds r2, #4
	subs r6, #1
	cmp r6, #0
	bge _08164F78
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r0, #4
	bls _08164FB2
	ldr r2, _08164FD0
	mov r0, sp
	ldrb r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	mov r1, sb
	bl sub_080EEFFC
_08164FB2:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08164FC0: .4byte 0x03005AF0
_08164FC4: .4byte 0x00000CA9
_08164FC8: .4byte 0x000040CE
_08164FCC: .4byte 0x02037290
_08164FD0: .4byte 0x03005AEC
_08164FD4: .4byte 0x00000CAA
	thumb_func_end AwardBattleTowerRibbons

	thumb_func_start FillEReaderTrainerWithPlayerData
FillEReaderTrainerWithPlayerData: @ 0x08164FD8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _08165004
	ldr r2, [r1]
	ldr r0, _08165008
	adds r7, r2, r0
	ldrb r0, [r2, #8]
	adds r5, r1, #0
	cmp r0, #0
	beq _08165010
	ldr r4, _0816500C
	ldrb r0, [r2, #0xa]
	ldrb r1, [r2, #0xb]
	adds r0, r0, r1
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	ldrb r1, [r2, #0xd]
	adds r0, r0, r1
	movs r1, #0x14
	b _08165022
	.align 2, 0
_08165004: .4byte 0x03005AF0
_08165008: .4byte 0x00000BEC
_0816500C: .4byte 0x085BBE3E
_08165010:
	ldr r4, _081650B0
	ldrb r0, [r2, #0xa]
	ldrb r1, [r2, #0xb]
	adds r0, r0, r1
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	ldrb r1, [r2, #0xd]
	adds r0, r0, r1
	movs r1, #0x1e
_08165022:
	bl __umodsi3
	adds r0, r0, r4
	ldrb r0, [r0]
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r5]
	adds r1, #0xa
	bl CopyTrainerId
	adds r0, r7, #4
	ldr r1, [r5]
	bl StringCopy7
	movs r0, #1
	strh r0, [r7, #2]
	movs r6, #7
	movs r4, #0
	ldr r0, _081650B4
	mov r8, r0
	adds r5, r7, #0
	adds r5, #0x10
	ldr r1, _081650B8
	mov ip, r1
	adds r3, r7, #0
	adds r3, #0x28
	adds r2, r7, #0
	adds r2, #0x1c
_0816505C:
	lsls r0, r4, #1
	mov sb, r0
	mov r1, r8
	ldr r0, [r1]
	add r0, ip
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r5]
	strh r6, [r2]
	adds r0, r6, #6
	strh r0, [r3]
	adds r6, #1
	adds r5, #2
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #5
	ble _0816505C
	movs r4, #0
_08165082:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081650BC
	adds r0, r0, r1
	movs r1, #0x2c
	muls r1, r4, r1
	adds r1, #0x34
	adds r1, r7, r1
	bl sub_0806823C
	adds r4, #1
	cmp r4, #2
	ble _08165082
	adds r0, r7, #0
	bl SetEReaderTrainerChecksum
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081650B0: .4byte 0x085BBE20
_081650B4: .4byte 0x03005AEC
_081650B8: .4byte 0x00002BBC
_081650BC: .4byte 0x02024190
	thumb_func_end FillEReaderTrainerWithPlayerData

	thumb_func_start GetMonCountForBattleMode
GetMonCountForBattleMode: @ 0x081650C0
	ldr r1, _081650D4
	ldr r0, _081650D8
	ldr r0, [r0]
	ldr r2, _081650DC
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081650D4: .4byte 0x082EFF00
_081650D8: .4byte 0x03005AF0
_081650DC: .4byte 0x00000BED
	thumb_func_end GetMonCountForBattleMode

	thumb_func_start GetEreaderTrainerClassId
GetEreaderTrainerClassId: @ 0x081650E0
	ldr r1, _081650F4
	ldr r0, _081650F8
	ldr r0, [r0]
	ldr r2, _081650FC
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081650F4: .4byte 0x082EFF52
_081650F8: .4byte 0x03005AF0
_081650FC: .4byte 0x00000BED
	thumb_func_end GetEreaderTrainerClassId

	thumb_func_start GetEreaderTrainerName
GetEreaderTrainerName: @ 0x08165100
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r0, _0816512C
	ldr r0, [r0]
	movs r1, #0xbf
	lsls r1, r1, #4
	adds r4, r0, r1
_08165110:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #4
	ble _08165110
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816512C: .4byte 0x03005AF0
	thumb_func_end GetEreaderTrainerName

	thumb_func_start ValidateEReaderTrainer
ValidateEReaderTrainer: @ 0x08165130
	push {r4, r5, r6, lr}
	ldr r2, _0816515C
	movs r0, #0
	strh r0, [r2]
	ldr r1, _08165160
	ldr r0, [r1]
	ldr r3, _08165164
	adds r5, r0, r3
	movs r4, #0
	movs r3, #0
	adds r6, r1, #0
	adds r1, r5, #0
_08165148:
	ldm r1!, {r0}
	orrs r4, r0
	adds r3, #1
	cmp r3, #0x2d
	bls _08165148
	cmp r4, #0
	bne _08165168
	movs r0, #1
	strh r0, [r2]
	b _08165192
	.align 2, 0
_0816515C: .4byte 0x02037290
_08165160: .4byte 0x03005AF0
_08165164: .4byte 0x00000BEC
_08165168:
	movs r4, #0
	movs r3, #0
	adds r2, r5, #0
_0816516E:
	ldm r2!, {r0}
	adds r4, r4, r0
	adds r3, #1
	cmp r3, #0x2d
	bls _0816516E
	ldr r1, [r6]
	ldr r2, _08165198
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, r4
	beq _08165192
	ldr r3, _0816519C
	adds r0, r1, r3
	bl ClearEReaderTrainer
	ldr r1, _081651A0
	movs r0, #1
	strh r0, [r1]
_08165192:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08165198: .4byte 0x00000CA4
_0816519C: .4byte 0x00000BEC
_081651A0: .4byte 0x02037290
	thumb_func_end ValidateEReaderTrainer

	thumb_func_start SetEReaderTrainerChecksum
SetEReaderTrainerChecksum: @ 0x081651A4
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0xb8
	movs r1, #0
	str r1, [r2]
	movs r3, #0
	adds r4, r0, #0
_081651B2:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r0, r1
	str r0, [r2]
	adds r3, #1
	cmp r3, #0x2d
	bls _081651B2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetEReaderTrainerChecksum

	thumb_func_start ClearEReaderTrainer
ClearEReaderTrainer: @ 0x081651C8
	push {lr}
	movs r1, #0
	movs r2, #0
_081651CE:
	stm r0!, {r2}
	adds r1, #1
	cmp r1, #0x2e
	bls _081651CE
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearEReaderTrainer

	thumb_func_start CopyEReaderTrainerGreeting
CopyEReaderTrainerGreeting: @ 0x081651DC
	push {lr}
	ldr r0, _081651F0
	ldr r0, [r0]
	ldr r1, _081651F4
	adds r0, r0, r1
	bl FrontierSpeechToString
	pop {r0}
	bx r0
	.align 2, 0
_081651F0: .4byte 0x03005AF0
_081651F4: .4byte 0x00000BFC
	thumb_func_end CopyEReaderTrainerGreeting

	thumb_func_start CopyEReaderTrainerFarewellMessage
CopyEReaderTrainerFarewellMessage: @ 0x081651F8
	push {lr}
	ldr r0, _0816520C
	ldrb r0, [r0]
	cmp r0, #3
	bne _08165214
	ldr r1, _08165210
	movs r0, #0xff
	strb r0, [r1]
	b _0816523C
	.align 2, 0
_0816520C: .4byte 0x02023FDE
_08165210: .4byte 0x02021C7C
_08165214:
	cmp r0, #1
	bne _08165230
	ldr r0, _08165228
	ldr r0, [r0]
	ldr r1, _0816522C
	adds r0, r0, r1
	bl FrontierSpeechToString
	b _0816523C
	.align 2, 0
_08165228: .4byte 0x03005AF0
_0816522C: .4byte 0x00000C14
_08165230:
	ldr r0, _08165240
	ldr r0, [r0]
	ldr r1, _08165244
	adds r0, r0, r1
	bl FrontierSpeechToString
_0816523C:
	pop {r0}
	bx r0
	.align 2, 0
_08165240: .4byte 0x03005AF0
_08165244: .4byte 0x00000C08
	thumb_func_end CopyEReaderTrainerFarewellMessage

	thumb_func_start sub_08165248
sub_08165248: @ 0x08165248
	push {lr}
	ldr r0, _08165278
	ldr r0, [r0]
	ldr r1, _0816527C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0816525C
	bl sub_080F0C84
_0816525C:
	movs r0, #0x77
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08165274
	bl sub_080F0C84
	movs r0, #0x77
	bl FlagClear
_08165274:
	pop {r0}
	bx r0
	.align 2, 0
_08165278: .4byte 0x03005AF0
_0816527C: .4byte 0x00000CA8
	thumb_func_end sub_08165248

	thumb_func_start FillPartnerParty
FillPartnerParty: @ 0x08165280
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	bl SetFacilityPtrsGetLevel
	ldr r0, _081653AC
	cmp r7, r0
	beq _0816529C
	b _081653C8
_0816529C:
	movs r0, #0
	mov sl, r0
	mov r1, sp
	adds r1, #0x18
	str r1, [sp, #0x30]
_081652A6:
	mov r2, sl
	lsls r2, r2, #2
	mov sb, r2
	mov r3, sl
	adds r3, #1
	str r3, [sp, #0x38]
	mov r0, sb
	add r0, sl
	lsls r0, r0, #2
	ldr r4, _081653B0
	adds r5, r0, r4
_081652BC:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	str r4, [sp, #0x18]
	ldr r0, _081653B4
	adds r1, r4, #0
	bl IsShinyOtIdPersonality
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	bne _081652BC
	ldr r0, [sp, #0x18]
	bl GetNatureFromPersonality
	ldrb r1, [r5, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _081652BC
	movs r0, #0x64
	mov r6, sl
	muls r6, r0, r6
	ldr r1, _081653B8
	mov r8, r1
	adds r0, r6, r1
	mov r5, sb
	add r5, sl
	lsls r5, r5, #2
	ldr r2, _081653B0
	adds r3, r5, r2
	ldrh r1, [r3]
	ldrb r2, [r3, #3]
	ldrb r3, [r3, #2]
	mov ip, r3
	movs r4, #1
	str r4, [sp]
	mov r3, sl
	str r3, [sp, #4]
	str r4, [sp, #8]
	ldr r4, _081653B4
	str r4, [sp, #0xc]
	mov r3, ip
	bl CreateMon
	str r7, [sp, #0x18]
	movs r3, #0
	mov r4, r8
	ldr r0, _081653BC
	adds r5, r5, r0
_0816532C:
	adds r1, r3, #0
	adds r1, #0x1a
	adds r2, r5, r3
	adds r0, r6, r4
	bl SetMonData
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x18]
	adds r3, r0, #0
	cmp r3, #5
	ble _0816532C
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	movs r0, #0x64
	mov r4, sl
	muls r4, r0, r4
	ldr r7, _081653C0
	ldr r6, _081653B8
	mov r0, sb
	add r0, sl
	lsls r5, r0, #2
_0816535A:
	lsls r0, r1, #1
	adds r0, r0, r5
	adds r0, r0, r7
	ldrh r1, [r0]
	ldr r3, [sp, #0x30]
	ldrb r2, [r3]
	adds r0, r4, r6
	bl SetMonMoveSlot
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x18]
	adds r1, r0, #0
	cmp r1, #3
	ble _0816535A
	movs r0, #0x64
	mov r4, sl
	muls r4, r0, r4
	ldr r0, _081653B8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #7
	ldr r2, _081653C4
	bl SetMonData
	movs r0, #0
	str r0, [sp, #0x18]
	adds r0, r4, #0
	movs r1, #0x31
	ldr r2, [sp, #0x30]
	bl SetMonData
	adds r0, r4, #0
	bl CalculateMonStats
	ldr r1, [sp, #0x38]
	mov sl, r1
	cmp r1, #2
	bgt _081653AA
	b _081652A6
_081653AA:
	b _081656A6
	.align 2, 0
_081653AC: .4byte 0x00000C03
_081653B0: .4byte 0x085BC614
_081653B4: .4byte 0x0000EF2A
_081653B8: .4byte 0x020242BC
_081653BC: .4byte 0x085BC619
_081653C0: .4byte 0x085BC620
_081653C4: .4byte 0x082E9CC0
_081653C8:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r7, r0
	bne _081653E0
	add r0, sp, #0x10
	ldr r1, _081653DC
	ldrb r1, [r1]
	strb r1, [r0]
	b _081656A6
	.align 2, 0
_081653DC: .4byte 0x0829BDA5
_081653E0:
	ldr r0, _08165548
	cmp r7, r0
	bls _081653E8
	b _08165564
_081653E8:
	bl SetFacilityPtrsGetLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	adds r0, r7, #0
	bl GetFrontierTrainerFixedIvs
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	str r4, [sp, #0x2c]
	movs r2, #0
	mov sl, r2
	mov r3, sp
	adds r3, #0x18
	str r3, [sp, #0x30]
	mov r4, sp
	adds r4, #0x1c
	str r4, [sp, #0x34]
_08165422:
	ldr r0, _0816554C
	ldr r1, [r0]
	mov r0, sl
	adds r0, #0x12
	lsls r0, r0, #1
	ldr r2, _08165550
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #0x28]
	movs r4, #0x64
	mov r3, sl
	muls r3, r4, r3
	mov r8, r3
	ldr r0, _08165554
	mov sb, r0
	mov r0, r8
	add r0, sb
	ldr r6, _08165558
	ldr r4, [r6]
	lsls r5, r1, #4
	adds r4, r5, r4
	ldrh r1, [r4]
	ldr r3, [sp, #0x24]
	lsls r2, r3, #0x18
	ldrb r3, [r4, #0xc]
	mov ip, r3
	ldr r3, [sp, #0x20]
	str r3, [sp]
	ldrb r4, [r4, #0xb]
	str r4, [sp, #4]
	ldr r4, [sp, #0x2c]
	str r4, [sp, #8]
	lsrs r2, r2, #0x18
	mov r3, ip
	bl CreateMonWithEVSpreadNatureOTID
	movs r0, #0xff
	str r0, [sp, #0x1c]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r2, #0
	mov r0, sl
	adds r0, #1
	str r0, [sp, #0x38]
	mov r4, r8
	mov r3, sb
_08165480:
	ldr r0, [r6]
	adds r0, r5, r0
	lsls r1, r2, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, r3
	str r3, [sp, #0x3c]
	bl SetMonMoveSlot
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r2, [sp, #0x18]
	lsls r1, r2, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r3, [sp, #0x3c]
	cmp r0, #0xda
	bne _081654B0
	movs r0, #0
	str r0, [sp, #0x1c]
_081654B0:
	adds r0, r2, #1
	str r0, [sp, #0x18]
	adds r2, r0, #0
	cmp r2, #3
	ble _08165480
	movs r1, #0x64
	mov r4, sl
	muls r4, r1, r4
	ldr r0, _08165554
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	ldr r2, [sp, #0x34]
	bl SetMonData
	ldr r0, _08165558
	ldr r1, [r0]
	ldr r2, [sp, #0x28]
	lsls r0, r2, #4
	adds r0, r0, r1
	ldrb r2, [r0, #0xa]
	lsls r2, r2, #1
	ldr r0, _0816555C
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	movs r0, #0
	str r0, [sp, #0x18]
	movs r2, #0
	ldr r0, _08165560
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r7, r0
	adds r0, r0, r1
	adds r3, r0, #4
_081654FA:
	mov r1, sp
	adds r1, r1, r2
	adds r1, #0x10
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x18]
	adds r2, r0, #0
	cmp r2, #7
	ble _081654FA
	movs r3, #0x64
	mov r4, sl
	muls r4, r3, r4
	ldr r0, _08165554
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #7
	add r2, sp, #0x10
	bl SetMonData
	adds r0, r7, #0
	bl IsFrontierTrainerFemale
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	adds r0, r4, #0
	movs r1, #0x31
	ldr r2, [sp, #0x30]
	bl SetMonData
	ldr r4, [sp, #0x38]
	mov sl, r4
	cmp r4, #1
	bgt _08165546
	b _08165422
_08165546:
	b _081656A6
	.align 2, 0
_08165548: .4byte 0x0000012B
_0816554C: .4byte 0x03005AF0
_08165550: .4byte 0x00000CB4
_08165554: .4byte 0x020242BC
_08165558: .4byte 0x0203B958
_0816555C: .4byte 0x085ADBF4
_08165560: .4byte 0x0203B954
_08165564:
	ldr r0, _08165624
	cmp r7, r0
	bhi _0816563C
	ldr r1, _08165628
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r2, #0
	mov sl, r2
	mov r3, sp
	adds r3, #0x18
	str r3, [sp, #0x30]
	movs r0, #0xec
	muls r0, r7, r0
	movs r4, #0xe7
	lsls r4, r4, #3
	adds r6, r0, r4
	ldr r5, _0816562C
_08165588:
	movs r0, #0x64
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r1, _08165630
	adds r0, r0, r1
	ldr r3, [r5]
	adds r1, r3, r6
	mov r2, sl
	adds r2, #0x12
	lsls r2, r2, #1
	ldr r4, _08165634
	adds r3, r3, r4
	adds r3, r3, r2
	ldrh r3, [r3]
	movs r2, #0x2c
	muls r2, r3, r2
	adds r2, #0x34
	adds r1, r1, r2
	movs r2, #1
	bl CreateBattleTowerMon2
	movs r0, #0
	str r0, [sp, #0x18]
	movs r2, #0
	mov r0, sl
	adds r0, #1
	str r0, [sp, #0x38]
	ldr r1, [r5]
	movs r0, #0xec
	adds r4, r7, #0
	muls r4, r0, r4
	ldr r0, _08165638
	adds r3, r1, r0
_081655CC:
	mov r1, sp
	adds r1, r1, r2
	adds r1, #0x10
	adds r0, r2, r4
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x18]
	adds r2, r0, #0
	cmp r2, #7
	ble _081655CC
	movs r0, #0x64
	mov r4, sl
	muls r4, r0, r4
	ldr r0, _08165630
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #7
	add r2, sp, #0x10
	bl SetMonData
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl IsFrontierTrainerFemale
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	adds r0, r4, #0
	movs r1, #0x31
	ldr r2, [sp, #0x30]
	bl SetMonData
	ldr r2, [sp, #0x38]
	mov sl, r2
	cmp r2, #1
	ble _08165588
	b _081656A6
	.align 2, 0
_08165624: .4byte 0x0000018F
_08165628: .4byte 0xFFFFFED4
_0816562C: .4byte 0x03005AF0
_08165630: .4byte 0x020242BC
_08165634: .4byte 0x00000CB4
_08165638: .4byte 0x0000073C
_0816563C:
	ldr r3, _081656B8
	adds r0, r7, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r4, #0
	mov sl, r4
	mov r0, sp
	adds r0, #0x18
	str r0, [sp, #0x30]
	ldr r1, _081656BC
	mov r8, r1
	movs r5, #0x24
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r6, r0, #0
	adds r6, #0xdc
_0816565E:
	movs r0, #0x64
	mov r4, sl
	muls r4, r0, r4
	ldr r0, _081656C0
	adds r4, r4, r0
	mov r2, r8
	ldr r0, [r2]
	adds r1, r0, r6
	ldr r3, _081656C4
	adds r0, r0, r3
	adds r0, r0, r5
	ldrb r2, [r0]
	adds r0, r4, #0
	bl CreateApprenticeMon
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl IsFrontierTrainerFemale
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	adds r0, r4, #0
	movs r1, #0x31
	ldr r2, [sp, #0x30]
	bl SetMonData
	adds r5, #2
	movs r2, #1
	add sl, r2
	mov r3, sl
	cmp r3, #1
	ble _0816565E
_081656A6:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081656B8: .4byte 0xFFFFFE70
_081656BC: .4byte 0x03005AF0
_081656C0: .4byte 0x020242BC
_081656C4: .4byte 0x00000CB4
	thumb_func_end FillPartnerParty

	thumb_func_start RubyBattleTowerRecordToEmerald
RubyBattleTowerRecordToEmerald: @ 0x081656C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	adds r5, r1, #0
	movs r2, #0
	adds r1, r6, #0
	adds r3, r6, #0
	adds r3, #0x58
_081656E0:
	ldrh r0, [r1, #0x1c]
	cmp r0, #0
	beq _081656E8
	adds r2, #1
_081656E8:
	adds r1, #0x2c
	cmp r1, r3
	ble _081656E0
	cmp r2, #3
	beq _081656F6
	movs r0, #0
	b _08165802
_081656F6:
	ldrb r0, [r6]
	strb r0, [r5]
	ldrh r0, [r6, #2]
	strh r0, [r5, #2]
	movs r2, #0
	ldr r0, _08165758
	ldrb r1, [r0]
	ldrb r3, [r6, #1]
	mov ip, r0
	adds r4, r5, #4
	adds r7, r6, #4
	movs r0, #0xc
	adds r0, r0, r5
	mov sb, r0
	movs r0, #0xc
	adds r0, r0, r6
	mov r8, r0
	adds r0, r5, #0
	adds r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x10
	adds r0, r0, r6
	mov sl, r0
	adds r0, r5, #0
	adds r0, #0x1c
	str r0, [sp, #8]
	adds r0, #0xc
	str r0, [sp, #0xc]
	adds r0, #0x90
	str r0, [sp, #0x10]
	cmp r1, r3
	beq _08165746
	mov r1, ip
_08165738:
	adds r1, #2
	adds r2, #1
	cmp r2, #0x51
	bgt _08165746
	ldrb r0, [r1]
	cmp r0, r3
	bne _08165738
_08165746:
	cmp r2, #0x52
	beq _0816575C
	lsls r0, r2, #1
	mov r1, ip
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	b _0816575E
	.align 2, 0
_08165758: .4byte 0x085BBE84
_0816575C:
	movs r0, #0x2b
_0816575E:
	strb r0, [r5, #1]
	movs r2, #0
	adds r3, r7, #0
_08165764:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08165764
	movs r2, #0
	mov r4, sb
	mov r3, r8
_08165778:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _08165778
	mov r3, sl
	ldr r1, [sp, #4]
	movs r2, #5
_0816578C:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _0816578C
	ldr r3, _08165814
	ldr r1, [sp, #8]
	movs r2, #5
_081657A0:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _081657A0
	ldr r3, _08165818
	ldr r1, [sp, #0xc]
	movs r2, #5
_081657B4:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _081657B4
	adds r2, r6, #0
	adds r3, r5, #0
	movs r4, #0x58
	adds r4, r4, r2
	mov r8, r4
_081657CC:
	adds r1, r3, #0
	adds r1, #0x34
	adds r0, r2, #0
	adds r0, #0x1c
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldm r0!, {r6, r7}
	stm r1!, {r6, r7}
	adds r2, #0x2c
	adds r3, #0x2c
	cmp r2, r8
	ble _081657CC
	movs r0, #0
	str r0, [sp]
	ldr r2, _0816581C
	mov r0, sp
	ldr r1, [sp, #0x10]
	bl CpuSet
	adds r0, r5, #0
	bl CalcEmeraldBattleTowerChecksum
	movs r0, #1
_08165802:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08165814: .4byte 0x085BE986
_08165818: .4byte 0x085BE992
_0816581C: .4byte 0x0500000B
	thumb_func_end RubyBattleTowerRecordToEmerald

	thumb_func_start EmeraldBattleTowerRecordToRuby
EmeraldBattleTowerRecordToRuby: @ 0x08165820
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	movs r2, #0
	adds r1, r4, #0
	adds r3, r4, #0
	adds r3, #0x58
_08165838:
	ldrh r0, [r1, #0x34]
	cmp r0, #0
	beq _08165840
	adds r2, #1
_08165840:
	adds r1, #0x2c
	cmp r1, r3
	ble _08165838
	cmp r2, #3
	beq _0816584E
	movs r0, #0
	b _08165914
_0816584E:
	ldrb r0, [r4]
	strb r0, [r6]
	ldrh r0, [r4, #2]
	strh r0, [r6, #2]
	movs r2, #0
	ldr r0, _081658A0
	ldrb r1, [r0, #1]
	ldrb r3, [r4, #1]
	mov ip, r0
	adds r5, r6, #4
	adds r7, r4, #4
	movs r0, #0xc
	adds r0, r0, r6
	mov sb, r0
	movs r0, #0xc
	adds r0, r0, r4
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x10
	str r0, [sp]
	movs r0, #0x10
	adds r0, r0, r4
	mov sl, r0
	cmp r1, r3
	beq _08165892
	mov r1, ip
	adds r1, #1
_08165884:
	adds r1, #2
	adds r2, #1
	cmp r2, #0x51
	bgt _08165892
	ldrb r0, [r1]
	cmp r0, r3
	bne _08165884
_08165892:
	cmp r2, #0x52
	beq _081658A4
	lsls r0, r2, #1
	add r0, ip
	ldrb r0, [r0]
	b _081658A6
	.align 2, 0
_081658A0: .4byte 0x085BBE84
_081658A4:
	movs r0, #0x24
_081658A6:
	strb r0, [r6, #1]
	movs r2, #0
	adds r3, r7, #0
_081658AC:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _081658AC
	movs r2, #0
	mov r5, sb
	mov r3, r8
_081658C0:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #3
	ble _081658C0
	mov r3, sl
	ldr r1, [sp]
	movs r2, #5
_081658D4:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _081658D4
	adds r2, r4, #0
	adds r3, r6, #0
	movs r4, #0x58
	adds r4, r4, r2
	mov r8, r4
_081658EC:
	adds r1, r3, #0
	adds r1, #0x1c
	adds r0, r2, #0
	adds r0, #0x34
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldm r0!, {r5, r7}
	stm r1!, {r5, r7}
	adds r2, #0x2c
	adds r3, #0x2c
	cmp r2, r8
	ble _081658EC
	adds r0, r6, #0
	bl CalcRubyBattleTowerChecksum
	movs r0, #1
_08165914:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end EmeraldBattleTowerRecordToRuby

	thumb_func_start CalcApprenticeChecksum
CalcApprenticeChecksum: @ 0x08165924
	push {r4, lr}
	adds r2, r0, #0
	movs r0, #0
	str r0, [r2, #0x40]
	movs r3, #0
	adds r4, r2, #0
_08165930:
	ldr r0, [r2, #0x40]
	ldm r4!, {r1}
	adds r0, r0, r1
	str r0, [r2, #0x40]
	adds r3, #1
	cmp r3, #0xf
	bls _08165930
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CalcApprenticeChecksum

	thumb_func_start ClearApprentice
ClearApprentice: @ 0x08165944
	push {lr}
	movs r1, #0
	movs r3, #0
	adds r2, r0, #0
_0816594C:
	stm r2!, {r3}
	adds r1, #1
	cmp r1, #0x10
	bls _0816594C
	bl ResetApprenticeStruct
	pop {r0}
	bx r0
	thumb_func_end ClearApprentice

	thumb_func_start ValidateApprenticesChecksums
ValidateApprenticesChecksums: @ 0x0816595C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r0, _081659C0
	mov r8, r0
	mov sb, r8
_0816596C:
	lsls r0, r5, #4
	adds r1, r0, r5
	lsls r1, r1, #2
	adds r1, #0xdc
	mov r3, sb
	ldr r2, [r3]
	movs r4, #0
	movs r3, #0
	adds r6, r0, #0
	adds r7, r5, #1
	adds r2, r2, r1
_08165982:
	ldm r2!, {r0}
	adds r4, r4, r0
	adds r3, #1
	cmp r3, #0xf
	bls _08165982
	mov r0, r8
	ldr r2, [r0]
	adds r0, r6, r5
	lsls r1, r0, #2
	movs r3, #0x8e
	lsls r3, r3, #1
	adds r0, r2, r3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r4
	beq _081659AC
	adds r0, r1, #0
	adds r0, #0xdc
	adds r0, r2, r0
	bl ClearApprentice
_081659AC:
	adds r5, r7, #0
	cmp r5, #3
	ble _0816596C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081659C0: .4byte 0x03005AF0
	thumb_func_end ValidateApprenticesChecksums

	thumb_func_start GetBattleTowerTrainerLanguage
GetBattleTowerTrainerLanguage: @ 0x081659C4
	push {r4, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r4, r1, #0
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r1, r0
	bne _081659E0
	ldr r0, _081659DC
	b _08165A34
	.align 2, 0
_081659DC: .4byte 0x0829BDA5
_081659E0:
	ldr r0, _081659EC
	cmp r1, r0
	bhi _081659F4
	ldr r0, _081659F0
	b _08165A34
	.align 2, 0
_081659EC: .4byte 0x0000012B
_081659F0: .4byte 0x0829BDA5
_081659F4:
	ldr r0, _08165A10
	cmp r1, r0
	bhi _08165A20
	ldr r0, _08165A14
	ldr r0, [r0]
	ldr r4, _08165A18
	adds r2, r1, r4
	movs r1, #0xec
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, _08165A1C
	adds r0, r0, r1
	b _08165A34
	.align 2, 0
_08165A10: .4byte 0x0000018F
_08165A14: .4byte 0x03005AF0
_08165A18: .4byte 0xFFFFFED4
_08165A1C: .4byte 0x0000081C
_08165A20:
	ldr r0, _08165A40
	ldr r2, [r0]
	ldr r0, _08165A44
	adds r1, r4, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r1, _08165A48
	adds r0, r2, r1
_08165A34:
	ldrb r0, [r0]
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08165A40: .4byte 0x03005AF0
_08165A44: .4byte 0xFFFFFE70
_08165A48: .4byte 0x0000011B
	thumb_func_end GetBattleTowerTrainerLanguage

	thumb_func_start SetFacilityPtrsGetLevel
SetFacilityPtrsGetLevel: @ 0x08165A4C
	push {lr}
	ldr r0, _08165A78
	ldr r0, [r0]
	ldr r1, _08165A7C
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08165A90
	ldr r1, _08165A80
	ldr r0, _08165A84
	str r0, [r1]
	ldr r1, _08165A88
	ldr r0, _08165A8C
	str r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	bl GetFrontierEnemyMonLevel
	b _08165A94
	.align 2, 0
_08165A78: .4byte 0x03005AF0
_08165A7C: .4byte 0x00000CA9
_08165A80: .4byte 0x0203B954
_08165A84: .4byte 0x085B4A10
_08165A88: .4byte 0x0203B958
_08165A8C: .4byte 0x085B8700
_08165A90:
	bl SetTentPtrsGetLevel
_08165A94:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end SetFacilityPtrsGetLevel

	thumb_func_start GetFrontierEnemyMonLevel
GetFrontierEnemyMonLevel: @ 0x08165A9C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08165AAA
	cmp r0, #1
	beq _08165AAE
_08165AAA:
	movs r0, #0x32
	b _08165ABC
_08165AAE:
	bl GetHighestLevelInPlayerParty
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bhi _08165ABC
	movs r0, #0x3c
_08165ABC:
	pop {r1}
	bx r1
	thumb_func_end GetFrontierEnemyMonLevel

	thumb_func_start GetHighestLevelInPlayerParty
GetHighestLevelInPlayerParty: @ 0x08165AC0
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0
_08165AC6:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08165B10
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _08165B00
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _08165B00
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	cmp r0, r6
	ble _08165B00
	adds r6, r0, #0
_08165B00:
	adds r5, #1
	cmp r5, #5
	ble _08165AC6
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08165B10: .4byte 0x02024190
	thumb_func_end GetHighestLevelInPlayerParty

	thumb_func_start GetFrontierTrainerFixedIvs
GetFrontierTrainerFixedIvs: @ 0x08165B14
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	cmp r0, #0x63
	bls _08165B46
	movs r1, #6
	cmp r0, #0x77
	bls _08165B46
	movs r1, #9
	cmp r0, #0x8b
	bls _08165B46
	movs r1, #0xc
	cmp r0, #0x9f
	bls _08165B46
	movs r1, #0xf
	cmp r0, #0xb3
	bls _08165B46
	movs r1, #0x12
	cmp r0, #0xc7
	bls _08165B46
	movs r1, #0x1f
	cmp r0, #0xdb
	bhi _08165B46
	movs r1, #0x15
_08165B46:
	adds r0, r1, #0
	pop {r1}
	bx r1
	thumb_func_end GetFrontierTrainerFixedIvs

	thumb_func_start sub_08165B4C
sub_08165B4C: @ 0x08165B4C
	push {lr}
	ldr r0, _08165B78
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	beq _08165B64
	cmp r0, #3
	beq _08165B64
	cmp r0, #4
	bne _08165B7C
_08165B64:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x1e
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08165B7E
	.align 2, 0
_08165B78: .4byte 0x000040CF
_08165B7C:
	movs r0, #0
_08165B7E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08165B4C

	thumb_func_start SetTentPtrsGetLevel
SetTentPtrsGetLevel: @ 0x08165B84
	push {lr}
	ldr r0, _08165BA0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bne _08165BB4
	ldr r1, _08165BA4
	ldr r0, _08165BA8
	str r0, [r1]
	ldr r1, _08165BAC
	ldr r0, _08165BB0
	b _08165BFE
	.align 2, 0
_08165BA0: .4byte 0x000040CF
_08165BA4: .4byte 0x0203B954
_08165BA8: .4byte 0x085BC958
_08165BAC: .4byte 0x0203B958
_08165BB0: .4byte 0x085BCF70
_08165BB4:
	cmp r0, #2
	bne _08165BD4
	ldr r1, _08165BC4
	ldr r0, _08165BC8
	str r0, [r1]
	ldr r1, _08165BCC
	ldr r0, _08165BD0
	b _08165BFE
	.align 2, 0
_08165BC4: .4byte 0x0203B954
_08165BC8: .4byte 0x085BD554
_08165BCC: .4byte 0x0203B958
_08165BD0: .4byte 0x085BDB6C
_08165BD4:
	cmp r0, #3
	bne _08165BF4
	ldr r1, _08165BE4
	ldr r0, _08165BE8
	str r0, [r1]
	ldr r1, _08165BEC
	ldr r0, _08165BF0
	b _08165BFE
	.align 2, 0
_08165BE4: .4byte 0x0203B954
_08165BE8: .4byte 0x085BDFC8
_08165BEC: .4byte 0x0203B958
_08165BF0: .4byte 0x085BE5E0
_08165BF4:
	ldr r1, _08165C14
	ldr r0, _08165C18
	str r0, [r1]
	ldr r1, _08165C1C
	ldr r0, _08165C20
_08165BFE:
	str r0, [r1]
	bl GetHighestLevelInPlayerParty
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bhi _08165C0E
	movs r0, #0x1e
_08165C0E:
	pop {r1}
	bx r1
	.align 2, 0
_08165C14: .4byte 0x0203B954
_08165C18: .4byte 0x085B4A10
_08165C1C: .4byte 0x0203B958
_08165C20: .4byte 0x085B8700
	thumb_func_end SetTentPtrsGetLevel

	thumb_func_start sub_08165C24
sub_08165C24: @ 0x08165C24
	push {r4, r5, lr}
	ldr r5, _08165CA0
_08165C28:
	bl sub_08165B4C
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	ldr r1, [r5]
	ldr r2, _08165CA4
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r3, r0
	bge _08165C64
	adds r2, #2
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, r4
	beq _08165C64
	ldr r0, _08165CA0
	ldr r1, [r0]
	subs r2, #2
	adds r0, r1, r2
	ldrh r2, [r0]
	ldr r0, _08165CA8
	adds r1, r1, r0
_08165C56:
	adds r1, #2
	adds r3, #1
	cmp r3, r2
	bge _08165C64
	ldrh r0, [r1]
	cmp r0, r4
	bne _08165C56
_08165C64:
	ldr r0, [r5]
	ldr r1, _08165CA4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r3, r0
	bne _08165C28
	ldr r5, _08165CAC
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	ldr r0, _08165CA0
	ldr r1, [r0]
	ldr r2, _08165CA4
	adds r0, r1, r2
	ldrh r2, [r0]
	adds r0, r2, #1
	cmp r0, #2
	bgt _08165C98
	lsls r0, r2, #1
	ldr r2, _08165CA8
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r5]
	strh r0, [r1]
_08165C98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08165CA0: .4byte 0x03005AF0
_08165CA4: .4byte 0x00000CB2
_08165CA8: .4byte 0x00000CB4
_08165CAC: .4byte 0x0203886A
	thumb_func_end sub_08165C24

	thumb_func_start FillTentTrainerParty_
FillTentTrainerParty_: @ 0x08165CB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x1c]
	bl SetTentPtrsGetLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	ldr r0, _08165CF0
	ldrh r2, [r0]
	ldr r0, _08165CF4
	ldr r1, [r0]
	movs r0, #0x34
	muls r0, r2, r0
	adds r0, r0, r1
	ldr r0, [r0, #0x30]
	str r0, [sp, #0x28]
	movs r0, #0
	str r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	ldrh r1, [r2]
	b _08165D0A
	.align 2, 0
_08165CF0: .4byte 0x0203886A
_08165CF4: .4byte 0x0203B954
_08165CF8:
	ldr r0, [sp, #0x24]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	lsls r0, r0, #1
	ldr r6, [sp, #0x28]
	adds r0, r0, r6
	ldrh r1, [r0]
_08165D0A:
	ldr r0, _08165D2C
	cmp r1, r0
	bne _08165CF8
	movs r0, #0
	mov r8, r0
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	str r4, [sp, #0x2c]
	b _08165E9E
	.align 2, 0
_08165D2C: .4byte 0x0000FFFF
_08165D30:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #0x24]
	bl __modsi3
	lsls r0, r0, #1
	ldr r2, [sp, #0x28]
	adds r0, r0, r2
	ldrh r4, [r0]
	movs r6, #0
	ldr r7, [sp, #0x18]
	add r7, r8
	b _08165D50
_08165D4E:
	adds r6, #1
_08165D50:
	cmp r6, r7
	bge _08165D74
	movs r1, #0x64
	adds r0, r6, #0
	muls r0, r1, r0
	ldr r2, _08165EB8
	adds r0, r0, r2
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	ldr r1, _08165EBC
	ldr r2, [r1]
	lsls r1, r4, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	cmp r0, r1
	bne _08165D4E
_08165D74:
	cmp r6, r7
	beq _08165D7A
	b _08165E9E
_08165D7A:
	movs r6, #0
	cmp r6, r7
	bge _08165DC4
	ldr r0, _08165EC0
	mov sb, r0
	movs r3, #0
_08165D86:
	ldr r1, _08165EB8
	adds r5, r3, r1
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #0
	str r3, [sp, #0x34]
	bl GetMonData
	ldr r3, [sp, #0x34]
	cmp r0, #0
	beq _08165DBC
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #0
	bl GetMonData
	ldr r1, _08165EBC
	ldr r2, [r1]
	lsls r1, r4, #4
	adds r1, r1, r2
	ldrb r1, [r1, #0xa]
	lsls r1, r1, #1
	add r1, sb
	ldr r3, [sp, #0x34]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08165DC4
_08165DBC:
	adds r3, #0x64
	adds r6, #1
	cmp r6, r7
	blt _08165D86
_08165DC4:
	cmp r6, r7
	bne _08165E9E
	movs r6, #0
	cmp r6, r8
	bge _08165DE6
	add r0, sp, #0xc
	ldrh r0, [r0]
	cmp r0, r4
	beq _08165DE6
	add r1, sp, #0xc
_08165DD8:
	adds r1, #2
	adds r6, #1
	cmp r6, r8
	bge _08165DE6
	ldrh r0, [r1]
	cmp r0, r4
	bne _08165DD8
_08165DE6:
	cmp r6, r8
	bne _08165E9E
	mov r2, r8
	lsls r0, r2, #1
	add r0, sp
	adds r0, #0xc
	strh r4, [r0]
	movs r6, #0x64
	adds r0, r7, #0
	muls r0, r6, r0
	ldr r1, _08165EB8
	adds r0, r0, r1
	ldr r5, _08165EBC
	ldr r2, [r5]
	lsls r4, r4, #4
	adds r2, r4, r2
	ldrh r1, [r2]
	ldrb r3, [r2, #0xc]
	movs r6, #0
	str r6, [sp]
	ldrb r2, [r2, #0xb]
	str r2, [sp, #4]
	ldr r2, [sp, #0x2c]
	str r2, [sp, #8]
	ldr r2, [sp, #0x20]
	bl CreateMonWithEVSpreadNatureOTID
	add r1, sp, #0x14
	movs r0, #0xff
	strb r0, [r1]
	mov sb, r4
	mov r0, r8
	adds r0, #1
	str r0, [sp, #0x30]
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	mov r8, r1
	adds r3, r5, #0
	mov r5, sb
	ldr r2, _08165EB8
	mov sl, r2
_08165E3A:
	ldr r0, [r3]
	adds r0, r5, r0
	lsls r4, r6, #1
	adds r0, #2
	adds r0, r0, r4
	ldrh r1, [r0]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	mov r0, r8
	add r0, sl
	str r3, [sp, #0x34]
	bl SetMonMoveSlot
	ldr r3, [sp, #0x34]
	ldr r0, [r3]
	adds r0, r5, r0
	adds r0, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0xda
	bne _08165E6A
	movs r0, #0
	mov r1, sp
	strb r0, [r1, #0x14]
_08165E6A:
	adds r6, #1
	cmp r6, #3
	ble _08165E3A
	movs r2, #0x64
	adds r4, r7, #0
	muls r4, r2, r4
	ldr r6, _08165EB8
	adds r4, r4, r6
	adds r0, r4, #0
	movs r1, #0x20
	add r2, sp, #0x14
	bl SetMonData
	ldr r0, _08165EBC
	ldr r0, [r0]
	add r0, sb
	ldrb r2, [r0, #0xa]
	lsls r2, r2, #1
	ldr r0, _08165EC0
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	ldr r0, [sp, #0x30]
	mov r8, r0
_08165E9E:
	ldr r1, [sp, #0x1c]
	cmp r8, r1
	beq _08165EA6
	b _08165D30
_08165EA6:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08165EB8: .4byte 0x020243E8
_08165EBC: .4byte 0x0203B958
_08165EC0: .4byte 0x085ADBF4
	thumb_func_end FillTentTrainerParty_

	thumb_func_start FacilityClassToGraphicsId
FacilityClassToGraphicsId: @ 0x08165EC4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _08165EF0
	ldrb r0, [r3]
	cmp r0, r2
	beq _08165EE6
_08165ED4:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1d
	bhi _08165EE6
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08165ED4
_08165EE6:
	cmp r1, #0x1e
	beq _08165EF8
	ldr r0, _08165EF4
	b _08165F22
	.align 2, 0
_08165EF0: .4byte 0x085BBE20
_08165EF4: .4byte 0x085BBE52
_08165EF8:
	movs r1, #0
	ldr r3, _08165F1C
	ldrb r0, [r3]
	cmp r0, r2
	beq _08165F14
_08165F02:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bhi _08165F14
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08165F02
_08165F14:
	cmp r1, #0x14
	bne _08165F20
	movs r0, #7
	b _08165F26
	.align 2, 0
_08165F1C: .4byte 0x085BBE3E
_08165F20:
	ldr r0, _08165F2C
_08165F22:
	adds r0, r1, r0
	ldrb r0, [r0]
_08165F26:
	pop {r1}
	bx r1
	.align 2, 0
_08165F2C: .4byte 0x085BBE70
	thumb_func_end FacilityClassToGraphicsId

	thumb_func_start ValidateBattleTowerRecord
ValidateBattleTowerRecord: @ 0x08165F30
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _08165F7C
	movs r0, #0xec
	muls r0, r6, r0
	movs r1, #0xe7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r1, [r2]
	movs r5, #0
	movs r4, #0
	movs r3, #0
	adds r1, r1, r0
_08165F4C:
	ldm r1!, {r0}
	adds r5, r5, r0
	orrs r4, r0
	adds r3, #1
	cmp r3, #0x39
	bls _08165F4C
	cmp r5, #0
	bne _08165F60
	cmp r4, #0
	beq _08165F8C
_08165F60:
	ldr r2, [r2]
	movs r0, #0xec
	adds r1, r6, #0
	muls r1, r0, r1
	movs r3, #0x82
	lsls r3, r3, #4
	adds r0, r2, r3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r5
	bne _08165F80
	movs r0, #1
	b _08165F8E
	.align 2, 0
_08165F7C: .4byte 0x03005AF0
_08165F80:
	movs r3, #0xe7
	lsls r3, r3, #3
	adds r0, r1, r3
	adds r0, r2, r0
	bl ClearBattleTowerRecord
_08165F8C:
	movs r0, #0
_08165F8E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end ValidateBattleTowerRecord

	thumb_func_start sub_08165F94
sub_08165F94: @ 0x08165F94
	push {r4, r5, r6, r7, lr}
	ldr r0, _08165FFC
	ldr r0, [r0]
	ldr r1, _08166000
	ands r0, r1
	cmp r0, #0
	beq _08165FF4
	bl SetFacilityPtrsGetLevel
	lsls r0, r0, #0x18
	movs r5, #0
	ldr r7, _08166004
	lsrs r0, r0, #0x16
	ldr r1, _08166008
	adds r6, r0, r1
_08165FB2:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0816600C
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	cmp r1, #0
	beq _08165FEE
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrb r1, [r0, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	adds r2, r1, #0
	muls r2, r0, r2
	adds r2, r2, r6
	adds r0, r4, #0
	movs r1, #0x19
	bl SetMonData
	adds r0, r4, #0
	bl CalculateMonStats
_08165FEE:
	adds r5, #1
	cmp r5, #5
	ble _08165FB2
_08165FF4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08165FFC: .4byte 0x02022C90
_08166000: .4byte 0x02000002
_08166004: .4byte 0x082F0D54
_08166008: .4byte 0x082F00B4
_0816600C: .4byte 0x020243E8
	thumb_func_end sub_08165F94

