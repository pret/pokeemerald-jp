.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start BattleAI_HandleItemUseBeforeAISetup
BattleAI_HandleItemUseBeforeAISetup: @ 0x08130920
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08130990
	ldr r0, [r1]
	ldr r3, [r0, #0x18]
	movs r4, #0
	mov ip, r1
	ldr r2, _08130994
	movs r1, #0
_08130934:
	adds r0, r3, r4
	strb r1, [r0]
	adds r4, #1
	cmp r4, #0x53
	bls _08130934
	ldr r0, [r2]
	ldr r1, _08130998
	ands r0, r1
	cmp r0, #8
	bne _08130982
	movs r4, #0
	ldr r6, _0813099C
	ldr r5, _081309A0
_0813094E:
	lsls r1, r4, #1
	ldrh r0, [r6]
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r5
	ldrh r3, [r1]
	cmp r3, #0
	beq _0813097C
	mov r0, ip
	ldr r2, [r0]
	ldr r1, [r2, #0x18]
	adds r0, r1, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x48
	adds r1, r1, r0
	strh r3, [r1]
	ldr r1, [r2, #0x18]
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0813097C:
	adds r4, #1
	cmp r4, #3
	ble _0813094E
_08130982:
	adds r0, r7, #0
	bl BattleAI_SetupAIData
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08130990: .4byte 0x0202414C
_08130994: .4byte 0x02022C90
_08130998: .4byte 0x0A7F098A
_0813099C: .4byte 0x0203886A
_081309A0: .4byte 0x082E3846
	thumb_func_end BattleAI_HandleItemUseBeforeAISetup

	thumb_func_start BattleAI_SetupAIData
BattleAI_SetupAIData: @ 0x081309A4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081309DC
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r4, #0
	ldr r6, _081309E0
	movs r3, #0
_081309B6:
	adds r0, r1, r4
	strb r3, [r0]
	adds r4, #1
	cmp r4, #0x1b
	bls _081309B6
	movs r4, #0
	ldr r3, _081309DC
	movs r5, #1
_081309C6:
	adds r1, r2, #0
	ands r1, r5
	cmp r1, #0
	beq _081309E4
	ldr r0, [r3]
	ldr r0, [r0, #0x14]
	adds r0, #4
	adds r0, r0, r4
	movs r1, #0x64
	b _081309EC
	.align 2, 0
_081309DC: .4byte 0x0202414C
_081309E0: .4byte 0x02023D08
_081309E4:
	ldr r0, [r3]
	ldr r0, [r0, #0x14]
	adds r0, #4
	adds r0, r0, r4
_081309EC:
	strb r1, [r0]
	lsrs r2, r2, #1
	adds r4, #1
	cmp r4, #3
	ble _081309C6
	ldrb r0, [r6]
	movs r1, #0
	movs r2, #0xff
	bl CheckMoveLimitations
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	ldr r5, _08130A98
_08130A08:
	ldr r7, _08130A9C
	lsls r0, r4, #2
	adds r0, r0, r7
	ldr r0, [r0]
	ands r0, r6
	cmp r0, #0
	beq _08130A22
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	adds r0, #4
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_08130A22:
	bl Random
	ldr r1, [r5]
	ldr r2, [r1, #0x14]
	adds r2, #0x18
	adds r2, r2, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf
	ands r0, r1
	movs r1, #0x64
	subs r1, r1, r0
	strb r1, [r2]
	adds r4, #1
	cmp r4, #3
	ble _08130A08
	ldr r0, _08130A98
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08130AA0
	ldr r6, _08130AA4
	ldrb r2, [r6]
	strb r2, [r0]
	ldr r0, _08130AA8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08130AB4
	ldr r5, _08130AAC
	bl Random
	adds r4, r0, #0
	ldrb r0, [r6]
	bl GetBattlerSide
	movs r3, #2
	adds r1, r3, #0
	ands r1, r4
	movs r2, #1
	eors r0, r2
	adds r1, r1, r0
	strb r1, [r5]
	ldr r0, _08130AB0
	ldrb r1, [r0]
	ldrb r2, [r5]
	lsls r0, r2, #2
	adds r0, r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08130ABC
	eors r2, r3
	strb r2, [r5]
	b _08130ABC
	.align 2, 0
_08130A98: .4byte 0x0202414C
_08130A9C: .4byte 0x082FACB4
_08130AA0: .4byte 0x0203A808
_08130AA4: .4byte 0x02023D08
_08130AA8: .4byte 0x02022C90
_08130AAC: .4byte 0x02023EB0
_08130AB0: .4byte 0x02023EB4
_08130AB4:
	ldr r0, _08130AD0
	movs r1, #1
	eors r1, r2
	strb r1, [r0]
_08130ABC:
	ldr r0, _08130AD4
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08130AD8
	bl GetAiScriptsInRecordedBattle
	b _08130B3A
	.align 2, 0
_08130AD0: .4byte 0x02023EB0
_08130AD4: .4byte 0x02022C90
_08130AD8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08130AF4
	ldr r0, _08130AF0
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x17
	str r0, [r1, #0xc]
	b _08130BBA
	.align 2, 0
_08130AF0: .4byte 0x0202414C
_08130AF4:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08130B10
	ldr r0, _08130B0C
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x16
	str r0, [r1, #0xc]
	b _08130BBA
	.align 2, 0
_08130B0C: .4byte 0x0202414C
_08130B10:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08130B2C
	ldr r0, _08130B28
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r1, #0xc]
	b _08130BBA
	.align 2, 0
_08130B28: .4byte 0x0202414C
_08130B2C:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _08130B48
	bl GetAiScriptsInBattleFactory
_08130B3A:
	ldr r1, _08130B44
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	str r0, [r1, #0xc]
	b _08130BBA
	.align 2, 0
_08130B44: .4byte 0x0202414C
_08130B48:
	ldr r0, _08130B5C
	ands r0, r1
	cmp r0, #0
	beq _08130B64
	ldr r0, _08130B60
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #7
	str r0, [r1, #0xc]
	b _08130BBA
	.align 2, 0
_08130B5C: .4byte 0x0C3F0900
_08130B60: .4byte 0x0202414C
_08130B64:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08130BA4
	ldr r0, _08130B94
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _08130B98
	ldr r0, _08130B9C
	ldrh r1, [r0]
	lsls r1, r1, #5
	adds r2, #0x14
	adds r1, r1, r2
	ldr r0, _08130BA0
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r3, #0xc]
	b _08130BBA
	.align 2, 0
_08130B94: .4byte 0x0202414C
_08130B98: .4byte 0x082E383C
_08130B9C: .4byte 0x0203886A
_08130BA0: .4byte 0x0203886C
_08130BA4:
	ldr r0, _08130BDC
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r1, _08130BE0
	ldr r0, _08130BE4
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0xc]
_08130BBA:
	ldr r0, _08130BE8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08130BD4
	ldr r0, _08130BDC
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2, #0xc]
_08130BD4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08130BDC: .4byte 0x0202414C
_08130BE0: .4byte 0x082E383C
_08130BE4: .4byte 0x0203886A
_08130BE8: .4byte 0x02022C90
	thumb_func_end BattleAI_SetupAIData

	thumb_func_start BattleAI_ChooseMoveOrAction
BattleAI_ChooseMoveOrAction: @ 0x08130BEC
	push {lr}
	ldr r0, _08130C00
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08130C04
	bl ChooseMoveOrAction_Doubles
	b _08130C08
	.align 2, 0
_08130C00: .4byte 0x02022C90
_08130C04:
	bl ChooseMoveOrAction_Singles
_08130C08:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end BattleAI_ChooseMoveOrAction

	thumb_func_start ChooseMoveOrAction_Singles
ChooseMoveOrAction_Singles: @ 0x08130C10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	bl RecordLastUsedMoveByTarget
	ldr r1, _08130C78
	ldr r0, [r1]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _08130C60
	adds r4, r1, #0
	movs r5, #0
_08130C2C:
	ldr r0, [r4]
	ldr r2, [r0, #0x14]
	ldr r0, [r2, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08130C40
	strb r5, [r2]
	bl BattleAI_DoAIProcessing
_08130C40:
	ldr r0, [r4]
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #0xc]
	lsrs r0, r0, #1
	str r0, [r1, #0xc]
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	strb r5, [r0, #1]
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _08130C2C
_08130C60:
	ldr r1, _08130C78
	ldr r0, [r1]
	ldr r3, [r0, #0x14]
	ldrb r2, [r3, #0x10]
	movs r0, #2
	ands r0, r2
	mov ip, r1
	cmp r0, #0
	beq _08130C7C
	movs r0, #4
	b _08130D14
	.align 2, 0
_08130C78: .4byte 0x0202414C
_08130C7C:
	movs r0, #4
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08130C8C
	movs r0, #5
	b _08130D14
_08130C8C:
	movs r6, #1
	mov r1, sp
	ldrb r0, [r3, #4]
	strb r0, [r1]
	add r0, sp, #4
	strb r2, [r0]
	movs r3, #1
	mov r8, r0
	ldr r1, _08130D20
	ldr r0, _08130D24
	ldrb r2, [r0]
	mov r5, sp
	mov r7, r8
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, r1, r0
	adds r4, r1, #0
	adds r4, #0xe
_08130CB0:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08130CFA
	ldrb r1, [r5]
	mov r2, ip
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	adds r0, #4
	adds r2, r0, r3
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08130CDE
	mov r0, sp
	adds r1, r0, r6
	ldrb r0, [r2]
	strb r0, [r1]
	adds r1, r6, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r1, r7, r1
	strb r3, [r1]
_08130CDE:
	ldrb r1, [r5]
	mov r2, ip
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	adds r0, #4
	adds r2, r0, r3
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bge _08130CFA
	movs r6, #1
	ldrb r0, [r2]
	strb r0, [r5]
	strb r3, [r7]
_08130CFA:
	adds r4, #2
	adds r3, #1
	cmp r3, #3
	ble _08130CB0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	add r0, r8
	ldrb r0, [r0]
_08130D14:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08130D20: .4byte 0x02023D28
_08130D24: .4byte 0x0203A808
	thumb_func_end ChooseMoveOrAction_Singles

	thumb_func_start ChooseMoveOrAction_Doubles
ChooseMoveOrAction_Doubles: @ 0x08130D28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	mov r8, r0
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x1c]
	mov r2, sp
	adds r2, #8
	str r2, [sp, #0x18]
	str r1, [sp, #0x20]
	mov sl, sp
_08130D48:
	ldr r0, _08130D70
	ldrb r0, [r0]
	cmp r8, r0
	beq _08130D62
	movs r0, #0x58
	mov r7, r8
	muls r7, r0, r7
	adds r0, r7, #0
	ldr r1, _08130D74
	adds r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08130D7C
_08130D62:
	movs r0, #0xff
	ldr r2, [sp, #0x20]
	strb r0, [r2]
	ldr r0, _08130D78
	mov r7, sl
	strh r0, [r7]
	b _08130EE2
	.align 2, 0
_08130D70: .4byte 0x0203A808
_08130D74: .4byte 0x02023D28
_08130D78: .4byte 0x0000FFFF
_08130D7C:
	ldr r0, _08130D9C
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08130DA4
	ldr r0, _08130DA0
	ldr r0, [r0]
	adds r0, #0x92
	ldrb r0, [r0]
	lsrs r0, r0, #4
	bl BattleAI_SetupAIData
	b _08130DAA
	.align 2, 0
_08130D9C: .4byte 0x02022C90
_08130DA0: .4byte 0x02024140
_08130DA4:
	movs r0, #0xf
	bl BattleAI_SetupAIData
_08130DAA:
	ldr r0, _08130E24
	mov r1, r8
	strb r1, [r0]
	movs r1, #1
	mov r2, r8
	ands r2, r1
	ldr r0, _08130E28
	ldrb r0, [r0]
	ands r1, r0
	cmp r2, r1
	beq _08130DC4
	bl RecordLastUsedMoveByTarget
_08130DC4:
	ldr r2, _08130E2C
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	movs r1, #0
	strb r1, [r0, #0x11]
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	strb r1, [r0, #1]
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	ldr r4, [r0, #0xc]
	mov sb, r2
	cmp r4, #0
	beq _08130E0C
	mov r5, sb
	movs r6, #0
_08130DE4:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08130DF6
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	strb r6, [r0]
	bl BattleAI_DoAIProcessing
_08130DF6:
	asrs r4, r4, #1
	ldr r0, [r5]
	ldr r1, [r0, #0x14]
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	strb r6, [r0, #1]
	cmp r4, #0
	bne _08130DE4
_08130E0C:
	mov r2, sb
	ldr r0, [r2]
	ldr r3, [r0, #0x14]
	ldrb r1, [r3, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08130E30
	movs r0, #4
	ldr r7, [sp, #0x20]
	strb r0, [r7]
	b _08130EE2
	.align 2, 0
_08130E24: .4byte 0x02023EB0
_08130E28: .4byte 0x0203A808
_08130E2C: .4byte 0x0202414C
_08130E30:
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08130E44
	movs r0, #5
	ldr r1, [sp, #0x20]
	strb r0, [r1]
	b _08130EE2
_08130E44:
	add r1, sp, #0x10
	ldrb r0, [r3, #4]
	strb r0, [r1]
	add r0, sp, #0x14
	strb r2, [r0]
	movs r5, #1
	movs r3, #1
	adds r6, r1, #0
	ldr r0, _08130F6C
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	ldr r2, _08130F70
	adds r0, r0, r2
	adds r4, r0, #2
	add r7, sp, #0x14
_08130E64:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08130EA6
	ldrb r1, [r6]
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	adds r0, #4
	adds r2, r0, r3
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08130E8A
	adds r0, r6, r5
	ldrb r1, [r2]
	strb r1, [r0]
	adds r0, r7, r5
	strb r3, [r0]
	adds r5, #1
_08130E8A:
	ldrb r1, [r6]
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	adds r0, #4
	adds r2, r0, r3
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bge _08130EA6
	ldrb r0, [r2]
	strb r0, [r6]
	strb r3, [r7]
	movs r5, #1
_08130EA6:
	adds r4, #2
	adds r3, #1
	cmp r3, #3
	ble _08130E64
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __modsi3
	add r0, sp
	adds r0, #0x14
	ldrb r0, [r0]
	ldr r7, [sp, #0x20]
	strb r0, [r7]
	ldrb r2, [r6]
	mov r0, sl
	strh r2, [r0]
	ldr r0, _08130F6C
	ldrb r1, [r0]
	movs r0, #2
	eors r0, r1
	cmp r8, r0
	bne _08130EE2
	cmp r2, #0x63
	bgt _08130EE2
	ldr r0, _08130F74
	mov r1, sl
	strh r0, [r1]
_08130EE2:
	ldr r2, [sp, #0x20]
	adds r2, #1
	str r2, [sp, #0x20]
	movs r7, #2
	add sl, r7
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #3
	bgt _08130EF8
	b _08130D48
_08130EF8:
	mov r0, sp
	ldrh r5, [r0]
	movs r0, #0
	ldr r2, [sp, #0x18]
	strb r0, [r2]
	movs r4, #1
	mov r8, r4
	ldr r6, _08130F78
	ldr r3, [sp, #0x18]
	mov r1, sp
	adds r1, #2
_08130F0E:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r2, r0
	bne _08130F22
	adds r0, r3, r4
	mov r7, r8
	strb r7, [r0]
	adds r4, #1
_08130F22:
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r2, r0
	bge _08130F32
	ldrh r5, [r1]
	mov r0, r8
	strb r0, [r3]
	movs r4, #1
_08130F32:
	adds r1, #2
	movs r2, #1
	add r8, r2
	mov r7, r8
	cmp r7, #3
	ble _08130F0E
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	ldr r1, [sp, #0x18]
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r6]
	ldrb r0, [r6]
	ldr r2, [sp, #0x1c]
	adds r0, r2, r0
	ldrb r0, [r0]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08130F6C: .4byte 0x0203A808
_08130F70: .4byte 0x02023D34
_08130F74: .4byte 0x0000FFFF
_08130F78: .4byte 0x02023EB0
	thumb_func_end ChooseMoveOrAction_Doubles

	thumb_func_start BattleAI_DoAIProcessing
BattleAI_DoAIProcessing: @ 0x08130F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r7, _08130FF4
	ldr r0, [r7]
	ldr r0, [r0, #0x14]
	ldrb r0, [r0]
	adds r6, r7, #0
	cmp r0, #2
	bne _08130F94
	b _0813109A
_08130F94:
	mov sb, r7
	ldr r0, _08130FF8
	mov r8, r0
_08130F9A:
	mov r1, sb
	ldr r0, [r1]
	ldr r2, [r0, #0x14]
	ldrb r0, [r2]
	cmp r0, #1
	beq _08131008
	cmp r0, #1
	bgt _0813108E
	cmp r0, #0
	bne _0813108E
	ldr r1, _08130FFC
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r1, r8
	str r0, [r1]
	ldr r5, _08131000
	ldrb r4, [r2, #1]
	ldr r0, _08131004
	ldrb r1, [r0]
	movs r0, #0x58
	adds r3, r1, #0
	muls r3, r0, r3
	adds r0, r4, r3
	adds r1, r5, #0
	adds r1, #0x24
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08130FE4
	lsls r0, r4, #1
	adds r0, r0, r3
	adds r1, r5, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r0, [r0]
_08130FE4:
	strh r0, [r2, #2]
	ldr r0, [r6]
	ldr r1, [r0, #0x14]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0813108E
	.align 2, 0
_08130FF4: .4byte 0x0202414C
_08130FF8: .4byte 0x0203A804
_08130FFC: .4byte 0x0828A480
_08131000: .4byte 0x02023D28
_08131004: .4byte 0x0203A808
_08131008:
	ldrh r1, [r2, #2]
	cmp r1, #0
	beq _08131028
	ldr r1, _08131024
	mov r2, r8
	ldr r0, [r2]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _0813103E
	.align 2, 0
_08131024: .4byte 0x0858F64C
_08131028:
	adds r0, r2, #4
	ldrb r2, [r2, #1]
	adds r0, r0, r2
	strb r1, [r0]
	mov r1, sb
	ldr r0, [r1]
	ldr r2, [r0, #0x14]
	ldrb r1, [r2, #0x10]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #0x10]
_0813103E:
	ldr r2, _08131074
	ldr r0, [r2]
	ldr r3, [r0, #0x14]
	ldrb r1, [r3, #0x10]
	movs r0, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _0813108E
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldr r0, [r6]
	ldr r2, [r0, #0x14]
	ldrb r0, [r2, #1]
	cmp r0, #3
	bhi _08131078
	ldrb r1, [r2, #0x10]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08131078
	strb r0, [r2]
	b _08131082
	.align 2, 0
_08131074: .4byte 0x0202414C
_08131078:
	ldr r0, [r6]
	ldr r1, [r0, #0x14]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08131082:
	ldr r0, [r6]
	ldr r2, [r0, #0x14]
	ldrb r1, [r2, #0x10]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2, #0x10]
_0813108E:
	ldr r0, [r7]
	ldr r0, [r0, #0x14]
	ldrb r0, [r0]
	cmp r0, #2
	beq _0813109A
	b _08130F9A
_0813109A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAI_DoAIProcessing

	thumb_func_start RecordLastUsedMoveByTarget
RecordLastUsedMoveByTarget: @ 0x081310A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r4, _081310F4
	ldr r0, [r4]
	ldr r2, [r0, #0x18]
	ldr r3, _081310F8
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r2, r2, r0
	ldr r5, _081310FC
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2]
	mov r8, r4
	mov ip, r3
	ldrh r1, [r1]
	cmp r0, r1
	beq _08131118
	adds r6, r5, #0
	movs r5, #0
_081310D4:
	mov r1, r8
	ldr r0, [r1]
	ldr r4, [r0, #0x18]
	mov r0, ip
	ldrb r1, [r0]
	lsls r3, r1, #4
	adds r0, r5, r3
	adds r2, r4, r0
	ldrh r0, [r2]
	cmp r0, #0
	bne _08131100
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	b _08131118
	.align 2, 0
_081310F4: .4byte 0x0202414C
_081310F8: .4byte 0x02023EB0
_081310FC: .4byte 0x02023EEC
_08131100:
	adds r5, #2
	adds r7, #1
	cmp r7, #3
	bgt _08131118
	adds r0, r5, r3
	adds r0, r4, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bne _081310D4
_08131118:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordLastUsedMoveByTarget

	thumb_func_start ClearBattlerMoveHistory
ClearBattlerMoveHistory: @ 0x08131124
	push {r4, lr}
	lsls r0, r0, #0x18
	ldr r4, _08131148
	movs r3, #0
	lsrs r1, r0, #0x14
	movs r2, #3
_08131130:
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	adds r0, r0, r1
	strh r3, [r0]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _08131130
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08131148: .4byte 0x0202414C
	thumb_func_end ClearBattlerMoveHistory

	thumb_func_start RecordAbilityBattle
RecordAbilityBattle: @ 0x0813114C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08131160
	ldr r2, [r2]
	ldr r2, [r2, #0x18]
	adds r2, #0x40
	adds r2, r2, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08131160: .4byte 0x0202414C
	thumb_func_end RecordAbilityBattle

	thumb_func_start ClearBattlerAbilityHistory
ClearBattlerAbilityHistory: @ 0x08131164
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08131178
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	adds r1, #0x40
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08131178: .4byte 0x0202414C
	thumb_func_end ClearBattlerAbilityHistory

	thumb_func_start RecordItemEffectBattle
RecordItemEffectBattle: @ 0x0813117C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08131190
	ldr r2, [r2]
	ldr r2, [r2, #0x18]
	adds r2, #0x44
	adds r2, r2, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08131190: .4byte 0x0202414C
	thumb_func_end RecordItemEffectBattle

	thumb_func_start ClearBattlerItemEffectHistory
ClearBattlerItemEffectHistory: @ 0x08131194
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081311A8
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	adds r1, #0x44
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_081311A8: .4byte 0x0202414C
	thumb_func_end ClearBattlerItemEffectHistory

	thumb_func_start BattleAICmd_if_random_less_than
BattleAICmd_if_random_less_than: @ 0x081311AC
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x10
	ldr r3, _081311E0
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, r1, #0x10
	ldrb r0, [r2, #1]
	cmp r1, r0
	bhs _081311E4
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081311E8
	.align 2, 0
_081311E0: .4byte 0x0203A804
_081311E4:
	adds r0, r2, #6
	str r0, [r3]
_081311E8:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_random_less_than

	thumb_func_start BattleAICmd_if_random_greater_than
BattleAICmd_if_random_greater_than: @ 0x081311EC
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x10
	ldr r3, _08131220
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, r1, #0x10
	ldrb r0, [r2, #1]
	cmp r1, r0
	bls _08131224
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08131228
	.align 2, 0
_08131220: .4byte 0x0203A804
_08131224:
	adds r0, r2, #6
	str r0, [r3]
_08131228:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_random_greater_than

	thumb_func_start BattleAICmd_if_random_equal
BattleAICmd_if_random_equal: @ 0x0813122C
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x10
	ldr r3, _08131260
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, r1, #0x10
	ldrb r0, [r2, #1]
	cmp r1, r0
	bne _08131264
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08131268
	.align 2, 0
_08131260: .4byte 0x0203A804
_08131264:
	adds r0, r2, #6
	str r0, [r3]
_08131268:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_random_equal

	thumb_func_start BattleAICmd_if_random_not_equal
BattleAICmd_if_random_not_equal: @ 0x0813126C
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x10
	ldr r3, _081312A0
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, r1, #0x10
	ldrb r0, [r2, #1]
	cmp r1, r0
	beq _081312A4
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081312A8
	.align 2, 0
_081312A0: .4byte 0x0203A804
_081312A4:
	adds r0, r2, #6
	str r0, [r3]
_081312A8:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_random_not_equal

	thumb_func_start BattleAICmd_score
BattleAICmd_score: @ 0x081312AC
	push {r4, lr}
	ldr r2, _081312E8
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	adds r1, r0, #4
	ldrb r0, [r0, #1]
	adds r1, r1, r0
	ldr r3, _081312EC
	ldr r0, [r3]
	ldrb r0, [r0, #1]
	ldrb r4, [r1]
	adds r0, r0, r4
	strb r0, [r1]
	ldr r0, [r2]
	ldr r1, [r0, #0x14]
	adds r0, r1, #4
	ldrb r1, [r1, #1]
	adds r1, r0, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _081312DC
	movs r0, #0
	strb r0, [r1]
_081312DC:
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081312E8: .4byte 0x0202414C
_081312EC: .4byte 0x0203A804
	thumb_func_end BattleAICmd_score

	thumb_func_start BattleAICmd_if_hp_less_than
BattleAICmd_if_hp_less_than: @ 0x081312F0
	push {r4, lr}
	ldr r0, _08131304
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _0813130C
	ldr r0, _08131308
	b _0813130E
	.align 2, 0
_08131304: .4byte 0x0203A804
_08131308: .4byte 0x0203A808
_0813130C:
	ldr r0, _08131344
_0813130E:
	ldrb r1, [r0]
	ldr r2, _08131348
	movs r0, #0x58
	muls r1, r0, r1
	adds r1, r1, r2
	ldrh r2, [r1, #0x28]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r1, #0x2c]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, #2]
	cmp r0, r1
	bhs _0813134C
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08131350
	.align 2, 0
_08131344: .4byte 0x02023EB0
_08131348: .4byte 0x02023D28
_0813134C:
	adds r0, r2, #7
	str r0, [r4]
_08131350:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_hp_less_than

	thumb_func_start BattleAICmd_if_hp_more_than
BattleAICmd_if_hp_more_than: @ 0x08131358
	push {r4, lr}
	ldr r0, _0813136C
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _08131374
	ldr r0, _08131370
	b _08131376
	.align 2, 0
_0813136C: .4byte 0x0203A804
_08131370: .4byte 0x0203A808
_08131374:
	ldr r0, _081313AC
_08131376:
	ldrb r1, [r0]
	ldr r2, _081313B0
	movs r0, #0x58
	muls r1, r0, r1
	adds r1, r1, r2
	ldrh r2, [r1, #0x28]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r1, #0x2c]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, #2]
	cmp r0, r1
	bls _081313B4
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _081313B8
	.align 2, 0
_081313AC: .4byte 0x02023EB0
_081313B0: .4byte 0x02023D28
_081313B4:
	adds r0, r2, #7
	str r0, [r4]
_081313B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_hp_more_than

	thumb_func_start BattleAICmd_if_hp_equal
BattleAICmd_if_hp_equal: @ 0x081313C0
	push {r4, lr}
	ldr r0, _081313D4
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _081313DC
	ldr r0, _081313D8
	b _081313DE
	.align 2, 0
_081313D4: .4byte 0x0203A804
_081313D8: .4byte 0x0203A808
_081313DC:
	ldr r0, _08131414
_081313DE:
	ldrb r1, [r0]
	ldr r2, _08131418
	movs r0, #0x58
	muls r1, r0, r1
	adds r1, r1, r2
	ldrh r2, [r1, #0x28]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r1, #0x2c]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, #2]
	cmp r0, r1
	bne _0813141C
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08131420
	.align 2, 0
_08131414: .4byte 0x02023EB0
_08131418: .4byte 0x02023D28
_0813141C:
	adds r0, r2, #7
	str r0, [r4]
_08131420:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_hp_equal

	thumb_func_start BattleAICmd_if_hp_not_equal
BattleAICmd_if_hp_not_equal: @ 0x08131428
	push {r4, lr}
	ldr r0, _0813143C
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _08131444
	ldr r0, _08131440
	b _08131446
	.align 2, 0
_0813143C: .4byte 0x0203A804
_08131440: .4byte 0x0203A808
_08131444:
	ldr r0, _0813147C
_08131446:
	ldrb r1, [r0]
	ldr r2, _08131480
	movs r0, #0x58
	muls r1, r0, r1
	adds r1, r1, r2
	ldrh r2, [r1, #0x28]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r1, #0x2c]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, #2]
	cmp r0, r1
	beq _08131484
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08131488
	.align 2, 0
_0813147C: .4byte 0x02023EB0
_08131480: .4byte 0x02023D28
_08131484:
	adds r0, r2, #7
	str r0, [r4]
_08131488:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_hp_not_equal

	thumb_func_start BattleAICmd_if_status
BattleAICmd_if_status: @ 0x08131490
	push {r4, r5, lr}
	ldr r0, _081314A4
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r5, r0, #0
	cmp r1, #1
	bne _081314AC
	ldr r0, _081314A8
	b _081314AE
	.align 2, 0
_081314A4: .4byte 0x0203A804
_081314A8: .4byte 0x0203A808
_081314AC:
	ldr r0, _081314F0
_081314AE:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r2, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r2, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r2, r0
	ldr r1, _081314F4
	movs r0, #0x58
	muls r0, r4, r0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, #0
	beq _081314F8
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
	b _081314FE
	.align 2, 0
_081314F0: .4byte 0x02023EB0
_081314F4: .4byte 0x02023D28
_081314F8:
	adds r0, r3, #0
	adds r0, #0xa
	str r0, [r5]
_081314FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_status

	thumb_func_start BattleAICmd_if_not_status
BattleAICmd_if_not_status: @ 0x08131504
	push {r4, r5, lr}
	ldr r0, _08131518
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r5, r0, #0
	cmp r1, #1
	bne _08131520
	ldr r0, _0813151C
	b _08131522
	.align 2, 0
_08131518: .4byte 0x0203A804
_0813151C: .4byte 0x0203A808
_08131520:
	ldr r0, _08131564
_08131522:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r2, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r2, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r2, r0
	ldr r1, _08131568
	movs r0, #0x58
	muls r0, r4, r0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, #0
	bne _0813156C
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
	b _08131572
	.align 2, 0
_08131564: .4byte 0x02023EB0
_08131568: .4byte 0x02023D28
_0813156C:
	adds r0, r3, #0
	adds r0, #0xa
	str r0, [r5]
_08131572:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_status

	thumb_func_start BattleAICmd_if_status2
BattleAICmd_if_status2: @ 0x08131578
	push {r4, r5, lr}
	ldr r0, _0813158C
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r5, r0, #0
	cmp r1, #1
	bne _08131594
	ldr r0, _08131590
	b _08131596
	.align 2, 0
_0813158C: .4byte 0x0203A804
_08131590: .4byte 0x0203A808
_08131594:
	ldr r0, _081315D8
_08131596:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r2, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r2, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r2, r0
	ldr r1, _081315DC
	movs r0, #0x58
	muls r0, r4, r0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, #0
	beq _081315E0
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
	b _081315E6
	.align 2, 0
_081315D8: .4byte 0x02023EB0
_081315DC: .4byte 0x02023D28
_081315E0:
	adds r0, r3, #0
	adds r0, #0xa
	str r0, [r5]
_081315E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_status2

	thumb_func_start BattleAICmd_if_not_status2
BattleAICmd_if_not_status2: @ 0x081315EC
	push {r4, r5, lr}
	ldr r0, _08131600
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r5, r0, #0
	cmp r1, #1
	bne _08131608
	ldr r0, _08131604
	b _0813160A
	.align 2, 0
_08131600: .4byte 0x0203A804
_08131604: .4byte 0x0203A808
_08131608:
	ldr r0, _0813164C
_0813160A:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r2, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r2, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r2, r0
	ldr r1, _08131650
	movs r0, #0x58
	muls r0, r4, r0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, #0
	bne _08131654
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
	b _0813165A
	.align 2, 0
_0813164C: .4byte 0x02023EB0
_08131650: .4byte 0x02023D28
_08131654:
	adds r0, r3, #0
	adds r0, #0xa
	str r0, [r5]
_0813165A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_status2

	thumb_func_start BattleAICmd_if_status3
BattleAICmd_if_status3: @ 0x08131660
	push {r4, r5, lr}
	ldr r0, _08131674
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r5, r0, #0
	cmp r1, #1
	bne _0813167C
	ldr r0, _08131678
	b _0813167E
	.align 2, 0
_08131674: .4byte 0x0203A804
_08131678: .4byte 0x0203A808
_0813167C:
	ldr r0, _081316BC
_0813167E:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	ldr r2, _081316C0
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _081316C4
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
	b _081316CA
	.align 2, 0
_081316BC: .4byte 0x02023EB0
_081316C0: .4byte 0x02023F50
_081316C4:
	adds r0, r3, #0
	adds r0, #0xa
	str r0, [r5]
_081316CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_status3

	thumb_func_start BattleAICmd_if_not_status3
BattleAICmd_if_not_status3: @ 0x081316D0
	push {r4, r5, lr}
	ldr r0, _081316E4
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r5, r0, #0
	cmp r1, #1
	bne _081316EC
	ldr r0, _081316E8
	b _081316EE
	.align 2, 0
_081316E4: .4byte 0x0203A804
_081316E8: .4byte 0x0203A808
_081316EC:
	ldr r0, _0813172C
_081316EE:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	ldr r2, _08131730
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08131734
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
	b _0813173A
	.align 2, 0
_0813172C: .4byte 0x02023EB0
_08131730: .4byte 0x02023F50
_08131734:
	adds r0, r3, #0
	adds r0, #0xa
	str r0, [r5]
_0813173A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_status3

	thumb_func_start BattleAICmd_if_side_affecting
BattleAICmd_if_side_affecting: @ 0x08131740
	push {r4, lr}
	ldr r0, _08131750
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _08131758
	ldr r0, _08131754
	b _0813175A
	.align 2, 0
_08131750: .4byte 0x0203A804
_08131754: .4byte 0x0203A808
_08131758:
	ldr r0, _081317A4
_0813175A:
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r2, #1
	ands r2, r0
	ldr r4, _081317A8
	ldr r3, [r4]
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	ldr r0, _081317AC
	lsls r2, r2, #1
	adds r2, r2, r0
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _081317B0
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _081317B6
	.align 2, 0
_081317A4: .4byte 0x02023EB0
_081317A8: .4byte 0x0203A804
_081317AC: .4byte 0x02023F32
_081317B0:
	adds r0, r3, #0
	adds r0, #0xa
	str r0, [r4]
_081317B6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_side_affecting

	thumb_func_start BattleAICmd_if_not_side_affecting
BattleAICmd_if_not_side_affecting: @ 0x081317BC
	push {r4, lr}
	ldr r0, _081317CC
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _081317D4
	ldr r0, _081317D0
	b _081317D6
	.align 2, 0
_081317CC: .4byte 0x0203A804
_081317D0: .4byte 0x0203A808
_081317D4:
	ldr r0, _08131820
_081317D6:
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r2, #1
	ands r2, r0
	ldr r4, _08131824
	ldr r3, [r4]
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	ldr r0, _08131828
	lsls r2, r2, #1
	adds r2, r2, r0
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _0813182C
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08131832
	.align 2, 0
_08131820: .4byte 0x02023EB0
_08131824: .4byte 0x0203A804
_08131828: .4byte 0x02023F32
_0813182C:
	adds r0, r3, #0
	adds r0, #0xa
	str r0, [r4]
_08131832:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_side_affecting

	thumb_func_start BattleAICmd_if_less_than
BattleAICmd_if_less_than: @ 0x08131838
	push {lr}
	ldr r0, _08131864
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r3, _08131868
	ldr r2, [r3]
	ldr r0, [r0, #8]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bhs _0813186C
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08131870
	.align 2, 0
_08131864: .4byte 0x0202414C
_08131868: .4byte 0x0203A804
_0813186C:
	adds r0, r2, #6
	str r0, [r3]
_08131870:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_less_than

	thumb_func_start BattleAICmd_if_more_than
BattleAICmd_if_more_than: @ 0x08131874
	push {lr}
	ldr r0, _081318A0
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r3, _081318A4
	ldr r2, [r3]
	ldr r0, [r0, #8]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bls _081318A8
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081318AC
	.align 2, 0
_081318A0: .4byte 0x0202414C
_081318A4: .4byte 0x0203A804
_081318A8:
	adds r0, r2, #6
	str r0, [r3]
_081318AC:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_more_than

	thumb_func_start BattleAICmd_if_equal
BattleAICmd_if_equal: @ 0x081318B0
	push {lr}
	ldr r0, _081318DC
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r3, _081318E0
	ldr r2, [r3]
	ldr r0, [r0, #8]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _081318E4
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081318E8
	.align 2, 0
_081318DC: .4byte 0x0202414C
_081318E0: .4byte 0x0203A804
_081318E4:
	adds r0, r2, #6
	str r0, [r3]
_081318E8:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_equal

	thumb_func_start BattleAICmd_if_not_equal
BattleAICmd_if_not_equal: @ 0x081318EC
	push {lr}
	ldr r0, _08131918
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r3, _0813191C
	ldr r2, [r3]
	ldr r0, [r0, #8]
	ldrb r1, [r2, #1]
	cmp r0, r1
	beq _08131920
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08131924
	.align 2, 0
_08131918: .4byte 0x0202414C
_0813191C: .4byte 0x0203A804
_08131920:
	adds r0, r2, #6
	str r0, [r3]
_08131924:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_equal

	thumb_func_start BattleAICmd_if_less_than_ptr
BattleAICmd_if_less_than_ptr: @ 0x08131928
	push {lr}
	ldr r3, _08131968
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	ldr r0, _0813196C
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #8]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08131970
	ldrb r1, [r2, #5]
	ldrb r0, [r2, #6]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08131976
	.align 2, 0
_08131968: .4byte 0x0203A804
_0813196C: .4byte 0x0202414C
_08131970:
	adds r0, r2, #0
	adds r0, #9
	str r0, [r3]
_08131976:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_less_than_ptr

	thumb_func_start BattleAICmd_if_more_than_ptr
BattleAICmd_if_more_than_ptr: @ 0x0813197C
	push {lr}
	ldr r3, _081319BC
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	ldr r0, _081319C0
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #8]
	ldrb r1, [r1]
	cmp r0, r1
	bls _081319C4
	ldrb r1, [r2, #5]
	ldrb r0, [r2, #6]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081319CA
	.align 2, 0
_081319BC: .4byte 0x0203A804
_081319C0: .4byte 0x0202414C
_081319C4:
	adds r0, r2, #0
	adds r0, #9
	str r0, [r3]
_081319CA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_more_than_ptr

	thumb_func_start BattleAICmd_if_equal_ptr
BattleAICmd_if_equal_ptr: @ 0x081319D0
	push {lr}
	ldr r3, _08131A10
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	ldr r0, _08131A14
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #8]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08131A18
	ldrb r1, [r2, #5]
	ldrb r0, [r2, #6]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08131A1E
	.align 2, 0
_08131A10: .4byte 0x0203A804
_08131A14: .4byte 0x0202414C
_08131A18:
	adds r0, r2, #0
	adds r0, #9
	str r0, [r3]
_08131A1E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_equal_ptr

	thumb_func_start BattleAICmd_if_not_equal_ptr
BattleAICmd_if_not_equal_ptr: @ 0x08131A24
	push {lr}
	ldr r3, _08131A64
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	ldr r0, _08131A68
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #8]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08131A6C
	ldrb r1, [r2, #5]
	ldrb r0, [r2, #6]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08131A72
	.align 2, 0
_08131A64: .4byte 0x0203A804
_08131A68: .4byte 0x0202414C
_08131A6C:
	adds r0, r2, #0
	adds r0, #9
	str r0, [r3]
_08131A72:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_not_equal_ptr

	thumb_func_start BattleAICmd_if_move
BattleAICmd_if_move: @ 0x08131A78
	push {lr}
	ldr r3, _08131AAC
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _08131AB0
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldrh r0, [r0, #2]
	cmp r0, r1
	bne _08131AB4
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08131AB8
	.align 2, 0
_08131AAC: .4byte 0x0203A804
_08131AB0: .4byte 0x0202414C
_08131AB4:
	adds r0, r2, #7
	str r0, [r3]
_08131AB8:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_move

	thumb_func_start BattleAICmd_if_not_move
BattleAICmd_if_not_move: @ 0x08131ABC
	push {lr}
	ldr r3, _08131AF0
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _08131AF4
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldrh r0, [r0, #2]
	cmp r0, r1
	beq _08131AF8
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08131AFC
	.align 2, 0
_08131AF0: .4byte 0x0203A804
_08131AF4: .4byte 0x0202414C
_08131AF8:
	adds r0, r2, #7
	str r0, [r3]
_08131AFC:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_move

	thumb_func_start BattleAICmd_if_in_bytes
BattleAICmd_if_in_bytes: @ 0x08131B00
	push {r4, lr}
	ldr r2, _08131B4C
	ldr r1, [r2]
	ldrb r3, [r1, #1]
	ldrb r0, [r1, #2]
	lsls r0, r0, #8
	orrs r3, r0
	ldrb r0, [r1, #3]
	lsls r0, r0, #0x10
	orrs r3, r0
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x18
	orrs r3, r0
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _08131B5C
	ldr r0, _08131B50
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r1, [r0, #8]
	adds r4, r2, #0
_08131B2A:
	ldrb r0, [r3]
	cmp r1, r0
	bne _08131B54
	ldr r2, [r4]
	ldrb r1, [r2, #5]
	ldrb r0, [r2, #6]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08131B62
	.align 2, 0
_08131B4C: .4byte 0x0203A804
_08131B50: .4byte 0x0202414C
_08131B54:
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0xff
	bne _08131B2A
_08131B5C:
	ldr r0, [r2]
	adds r0, #9
	str r0, [r2]
_08131B62:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_in_bytes

	thumb_func_start BattleAICmd_if_not_in_bytes
BattleAICmd_if_not_in_bytes: @ 0x08131B68
	push {r4, lr}
	ldr r2, _08131BA4
	ldr r1, [r2]
	ldrb r3, [r1, #1]
	ldrb r0, [r1, #2]
	lsls r0, r0, #8
	orrs r3, r0
	ldrb r0, [r1, #3]
	lsls r0, r0, #0x10
	orrs r3, r0
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x18
	orrs r3, r0
	ldrb r0, [r3]
	adds r4, r2, #0
	cmp r0, #0xff
	beq _08131BB4
	ldr r0, _08131BA8
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r2, [r0, #8]
	adds r1, r4, #0
_08131B94:
	ldrb r0, [r3]
	cmp r2, r0
	bne _08131BAC
	ldr r0, [r1]
	adds r0, #9
	str r0, [r1]
	b _08131BCC
	.align 2, 0
_08131BA4: .4byte 0x0203A804
_08131BA8: .4byte 0x0202414C
_08131BAC:
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0xff
	bne _08131B94
_08131BB4:
	ldr r2, [r4]
	ldrb r1, [r2, #5]
	ldrb r0, [r2, #6]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
_08131BCC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_not_in_bytes

	thumb_func_start BattleAICmd_if_in_hwords
BattleAICmd_if_in_hwords: @ 0x08131BD4
	push {r4, r5, lr}
	ldr r2, _08131C20
	ldr r1, [r2]
	ldrb r3, [r1, #1]
	ldrb r0, [r1, #2]
	lsls r0, r0, #8
	orrs r3, r0
	ldrb r0, [r1, #3]
	lsls r0, r0, #0x10
	orrs r3, r0
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x18
	orrs r3, r0
	ldrh r0, [r3]
	ldr r5, _08131C24
	cmp r0, r5
	beq _08131C34
	ldr r0, _08131C28
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r1, [r0, #8]
	adds r4, r2, #0
_08131C00:
	ldrh r0, [r3]
	cmp r1, r0
	bne _08131C2C
	ldr r2, [r4]
	ldrb r1, [r2, #5]
	ldrb r0, [r2, #6]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08131C3A
	.align 2, 0
_08131C20: .4byte 0x0203A804
_08131C24: .4byte 0x0000FFFF
_08131C28: .4byte 0x0202414C
_08131C2C:
	adds r3, #2
	ldrh r0, [r3]
	cmp r0, r5
	bne _08131C00
_08131C34:
	ldr r0, [r2]
	adds r0, #9
	str r0, [r2]
_08131C3A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_in_hwords

	thumb_func_start BattleAICmd_if_not_in_hwords
BattleAICmd_if_not_in_hwords: @ 0x08131C40
	push {r4, r5, lr}
	ldr r2, _08131C7C
	ldr r1, [r2]
	ldrb r3, [r1, #1]
	ldrb r0, [r1, #2]
	lsls r0, r0, #8
	orrs r3, r0
	ldrb r0, [r1, #3]
	lsls r0, r0, #0x10
	orrs r3, r0
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x18
	orrs r3, r0
	ldrh r0, [r3]
	ldr r4, _08131C80
	adds r5, r2, #0
	cmp r0, r4
	beq _08131C90
	ldr r0, _08131C84
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r2, [r0, #8]
	adds r1, r5, #0
_08131C6E:
	ldrh r0, [r3]
	cmp r2, r0
	bne _08131C88
	ldr r0, [r1]
	adds r0, #9
	str r0, [r1]
	b _08131CA8
	.align 2, 0
_08131C7C: .4byte 0x0203A804
_08131C80: .4byte 0x0000FFFF
_08131C84: .4byte 0x0202414C
_08131C88:
	adds r3, #2
	ldrh r0, [r3]
	cmp r0, r4
	bne _08131C6E
_08131C90:
	ldr r2, [r5]
	ldrb r1, [r2, #5]
	ldrb r0, [r2, #6]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
_08131CA8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_not_in_hwords

	thumb_func_start BattleAICmd_if_user_has_attacking_move
BattleAICmd_if_user_has_attacking_move: @ 0x08131CB0
	push {r4, r5, lr}
	movs r3, #0
	ldr r4, _08131CF0
	ldr r1, _08131CF4
	ldr r0, _08131CF8
	ldrb r2, [r0]
	ldr r5, _08131CFC
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0xc
	adds r2, r0, r1
_08131CC6:
	ldrh r0, [r2]
	cmp r0, #0
	beq _08131CDA
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _08131CE2
_08131CDA:
	adds r2, #2
	adds r3, #1
	cmp r3, #3
	ble _08131CC6
_08131CE2:
	cmp r3, #4
	bne _08131D00
	ldr r0, [r4]
	adds r0, #5
	str r0, [r4]
	b _08131D18
	.align 2, 0
_08131CF0: .4byte 0x0203A804
_08131CF4: .4byte 0x02023D28
_08131CF8: .4byte 0x0203A808
_08131CFC: .4byte 0x082ED220
_08131D00:
	ldr r2, [r4]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
_08131D18:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_user_has_attacking_move

	thumb_func_start BattleAICmd_if_user_has_no_attacking_moves
BattleAICmd_if_user_has_no_attacking_moves: @ 0x08131D20
	push {r4, r5, lr}
	movs r3, #0
	ldr r4, _08131D60
	ldr r1, _08131D64
	ldr r0, _08131D68
	ldrb r2, [r0]
	ldr r5, _08131D6C
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0xc
	adds r2, r0, r1
_08131D36:
	ldrh r0, [r2]
	cmp r0, #0
	beq _08131D4A
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _08131D52
_08131D4A:
	adds r2, #2
	adds r3, #1
	cmp r3, #3
	ble _08131D36
_08131D52:
	cmp r3, #4
	beq _08131D70
	ldr r0, [r4]
	adds r0, #5
	str r0, [r4]
	b _08131D88
	.align 2, 0
_08131D60: .4byte 0x0203A804
_08131D64: .4byte 0x02023D28
_08131D68: .4byte 0x0203A808
_08131D6C: .4byte 0x082ED220
_08131D70:
	ldr r2, [r4]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
_08131D88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_user_has_no_attacking_moves

	thumb_func_start BattleAICmd_get_turn_count
BattleAICmd_get_turn_count: @ 0x08131D90
	ldr r0, _08131DA8
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	ldr r0, _08131DAC
	ldrb r0, [r0, #0x13]
	str r0, [r1, #8]
	ldr r1, _08131DB0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08131DA8: .4byte 0x0202414C
_08131DAC: .4byte 0x03005A70
_08131DB0: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_turn_count

	thumb_func_start BattleAICmd_get_type
BattleAICmd_get_type: @ 0x08131DB4
	push {r4, lr}
	ldr r1, _08131DCC
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	adds r4, r1, #0
	cmp r0, #4
	bhi _08131E8E
	lsls r0, r0, #2
	ldr r1, _08131DD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08131DCC: .4byte 0x0203A804
_08131DD0: .4byte 0x08131DD4
_08131DD4: @ jump table
	.4byte _08131E0C @ case 0
	.4byte _08131DE8 @ case 1
	.4byte _08131E54 @ case 2
	.4byte _08131E30 @ case 3
	.4byte _08131E78 @ case 4
_08131DE8:
	ldr r0, _08131E00
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _08131E04
	ldr r0, _08131E08
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x21
	ldrb r0, [r0]
	b _08131E8C
	.align 2, 0
_08131E00: .4byte 0x0202414C
_08131E04: .4byte 0x02023D28
_08131E08: .4byte 0x0203A808
_08131E0C:
	ldr r0, _08131E24
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _08131E28
	ldr r0, _08131E2C
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x21
	ldrb r0, [r0]
	b _08131E8C
	.align 2, 0
_08131E24: .4byte 0x0202414C
_08131E28: .4byte 0x02023D28
_08131E2C: .4byte 0x02023EB0
_08131E30:
	ldr r0, _08131E48
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _08131E4C
	ldr r0, _08131E50
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x22
	ldrb r0, [r0]
	b _08131E8C
	.align 2, 0
_08131E48: .4byte 0x0202414C
_08131E4C: .4byte 0x02023D28
_08131E50: .4byte 0x0203A808
_08131E54:
	ldr r0, _08131E6C
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _08131E70
	ldr r0, _08131E74
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x22
	ldrb r0, [r0]
	b _08131E8C
	.align 2, 0
_08131E6C: .4byte 0x0202414C
_08131E70: .4byte 0x02023D28
_08131E74: .4byte 0x02023EB0
_08131E78:
	ldr r0, _08131E9C
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _08131EA0
	ldrh r1, [r3, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #2]
_08131E8C:
	str r0, [r3, #8]
_08131E8E:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08131E9C: .4byte 0x0202414C
_08131EA0: .4byte 0x082ED220
	thumb_func_end BattleAICmd_get_type

	thumb_func_start BattleAI_GetWantedBattler
BattleAI_GetWantedBattler: @ 0x08131EA4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08131EB8
	ldr r0, _08131EB4
	ldrb r0, [r0]
	b _08131EE0
	.align 2, 0
_08131EB4: .4byte 0x0203A808
_08131EB8:
	cmp r0, #1
	ble _08131EC4
	cmp r0, #2
	beq _08131ED8
	cmp r0, #3
	beq _08131ED0
_08131EC4:
	ldr r0, _08131ECC
	ldrb r0, [r0]
	b _08131EE0
	.align 2, 0
_08131ECC: .4byte 0x02023EB0
_08131ED0:
	ldr r0, _08131ED4
	b _08131EDA
	.align 2, 0
_08131ED4: .4byte 0x0203A808
_08131ED8:
	ldr r0, _08131EE4
_08131EDA:
	ldrb r1, [r0]
	movs r0, #2
	eors r0, r1
_08131EE0:
	pop {r1}
	bx r1
	.align 2, 0
_08131EE4: .4byte 0x02023EB0
	thumb_func_end BattleAI_GetWantedBattler

	thumb_func_start BattleAICmd_is_of_type
BattleAICmd_is_of_type: @ 0x08131EE8
	push {r4, lr}
	ldr r4, _08131F24
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl BattleAI_GetWantedBattler
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08131F28
	movs r1, #0x58
	muls r0, r1, r0
	adds r3, r0, r2
	adds r1, r3, #0
	adds r1, #0x21
	ldr r0, [r4]
	ldrb r1, [r1]
	ldrb r2, [r0, #2]
	cmp r1, r2
	beq _08131F18
	adds r0, r3, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, r2
	bne _08131F30
_08131F18:
	ldr r0, _08131F2C
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #1
	b _08131F38
	.align 2, 0
_08131F24: .4byte 0x0203A804
_08131F28: .4byte 0x02023D28
_08131F2C: .4byte 0x0202414C
_08131F30:
	ldr r0, _08131F48
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #0
_08131F38:
	str r0, [r1, #8]
	ldr r1, _08131F4C
	ldr r0, [r1]
	adds r0, #3
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08131F48: .4byte 0x0202414C
_08131F4C: .4byte 0x0203A804
	thumb_func_end BattleAICmd_is_of_type

	thumb_func_start BattleAICmd_get_considered_move_power
BattleAICmd_get_considered_move_power: @ 0x08131F50
	ldr r0, _08131F70
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _08131F74
	ldrh r1, [r3, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	str r0, [r3, #8]
	ldr r1, _08131F78
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08131F70: .4byte 0x0202414C
_08131F74: .4byte 0x082ED220
_08131F78: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_considered_move_power

	thumb_func_start BattleAICmd_get_how_powerful_move_is
BattleAICmd_get_how_powerful_move_is: @ 0x08131F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r3, #0
	ldr r0, _081320BC
	ldrh r1, [r0]
	ldr r5, _081320C0
	ldr r6, _081320C4
	ldr r2, _081320C8
	cmp r1, r5
	beq _08131FBA
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r4, [r0]
	ldr r1, _081320BC
_08131FAA:
	ldrh r0, [r1]
	cmp r4, r0
	beq _08131FBA
	adds r1, #2
	adds r3, #1
	ldrh r0, [r1]
	cmp r0, r5
	bne _08131FAA
_08131FBA:
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #1]
	cmp r0, #1
	bhi _08131FD0
	b _0813215A
_08131FD0:
	lsls r0, r3, #1
	ldr r1, _081320BC
	adds r0, r0, r1
	ldrh r3, [r0]
	ldr r0, _081320C0
	cmp r3, r0
	beq _08131FE0
	b _0813215A
_08131FE0:
	ldr r0, _081320CC
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081320D0
	ldr r0, [r0]
	strb r1, [r0, #0x13]
	ldr r0, _081320D4
	movs r2, #1
	strb r2, [r0, #0xe]
	ldr r0, _081320D8
	strb r1, [r0]
	ldr r0, _081320DC
	strb r2, [r0]
	movs r6, #0
	mov sb, r3
	ldr r2, _081320BC
	ldrh r2, [r2]
	str r2, [sp, #0x10]
_08132004:
	movs r3, #0
	ldr r5, _081320E0
	lsls r4, r6, #1
	ldr r7, _081320E4
	lsls r0, r6, #2
	mov r8, r0
	adds r1, r6, #1
	mov sl, r1
	ldr r2, [sp, #0x10]
	cmp r2, sb
	beq _08132048
	ldr r2, _081320C4
	ldrb r1, [r7]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r4, r0
	adds r1, r5, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r1, _081320BC
_08132038:
	ldrh r0, [r1]
	cmp r2, r0
	beq _08132048
	adds r1, #2
	adds r3, #1
	ldrh r0, [r1]
	cmp r0, sb
	bne _08132038
_08132048:
	ldrb r1, [r7]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r4, r0
	adds r1, r5, #0
	adds r1, #0xc
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	beq _081320F4
	lsls r0, r3, #1
	ldr r2, _081320BC
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, sb
	bne _081320F4
	ldr r0, _081320C4
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	cmp r0, #1
	bls _081320F4
	ldr r5, _081320E8
	strh r2, [r5]
	ldrb r0, [r7]
	ldr r4, _081320EC
	ldrb r1, [r4]
	bl AI_CalcDmg
	ldrh r0, [r5]
	ldrb r1, [r7]
	ldrb r2, [r4]
	bl TypeCalc
	mov r4, sp
	add r4, r8
	ldr r2, _081320F0
	ldr r0, _081320C8
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	adds r0, #0x18
	adds r0, r0, r6
	ldrb r1, [r0]
	ldr r0, [r2]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, #0
	bne _081320FC
	movs r0, #1
	str r0, [r4]
	b _081320FC
	.align 2, 0
_081320BC: .4byte 0x0858F7D8
_081320C0: .4byte 0x0000FFFF
_081320C4: .4byte 0x082ED220
_081320C8: .4byte 0x0202414C
_081320CC: .4byte 0x020240A4
_081320D0: .4byte 0x02024140
_081320D4: .4byte 0x02024118
_081320D8: .4byte 0x02023F20
_081320DC: .4byte 0x02023EB5
_081320E0: .4byte 0x02023D28
_081320E4: .4byte 0x0203A808
_081320E8: .4byte 0x02023E8E
_081320EC: .4byte 0x02023EB0
_081320F0: .4byte 0x02023E94
_081320F4:
	mov r1, sp
	add r1, r8
	movs r0, #0
	str r0, [r1]
_081320FC:
	mov r6, sl
	cmp r6, #3
	bgt _08132104
	b _08132004
_08132104:
	movs r6, #0
	ldr r2, _08132148
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	ldrb r0, [r0, #1]
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r5, _0813214C
	cmp r1, r0
	bgt _0813213A
	adds r4, r2, #0
	mov r3, sp
_08132120:
	adds r3, #4
	adds r6, #1
	cmp r6, #3
	bgt _0813213A
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	ldrb r0, [r0, #1]
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	ble _08132120
_0813213A:
	cmp r6, #4
	bne _08132150
	ldr r0, [r2]
	ldr r1, [r0, #0x14]
	movs r0, #2
	str r0, [r1, #8]
	b _08132164
	.align 2, 0
_08132148: .4byte 0x0202414C
_0813214C: .4byte 0x0203A804
_08132150:
	ldr r0, [r2]
	ldr r1, [r0, #0x14]
	movs r0, #1
	str r0, [r1, #8]
	b _08132164
_0813215A:
	ldr r0, [r2]
	ldr r1, [r0, #0x14]
	movs r0, #0
	str r0, [r1, #8]
	ldr r5, _0813217C
_08132164:
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813217C: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_how_powerful_move_is

	thumb_func_start BattleAICmd_get_last_used_battler_move
BattleAICmd_get_last_used_battler_move: @ 0x08132180
	push {lr}
	ldr r0, _0813219C
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r3, r0, #0
	cmp r1, #1
	bne _081321AC
	ldr r0, _081321A0
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r1, _081321A4
	ldr r0, _081321A8
	b _081321B6
	.align 2, 0
_0813219C: .4byte 0x0203A804
_081321A0: .4byte 0x0202414C
_081321A4: .4byte 0x02023EEC
_081321A8: .4byte 0x0203A808
_081321AC:
	ldr r0, _081321CC
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r1, _081321D0
	ldr r0, _081321D4
_081321B6:
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r2, #8]
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_081321CC: .4byte 0x0202414C
_081321D0: .4byte 0x02023EEC
_081321D4: .4byte 0x02023EB0
	thumb_func_end BattleAICmd_get_last_used_battler_move

	thumb_func_start BattleAICmd_if_equal_
BattleAICmd_if_equal_: @ 0x081321D8
	push {lr}
	ldr r3, _08132204
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldr r0, _08132208
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #8]
	cmp r1, r0
	bne _0813220C
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08132210
	.align 2, 0
_08132204: .4byte 0x0203A804
_08132208: .4byte 0x0202414C
_0813220C:
	adds r0, r2, #6
	str r0, [r3]
_08132210:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_equal_

	thumb_func_start BattleAICmd_if_not_equal_
BattleAICmd_if_not_equal_: @ 0x08132214
	push {lr}
	ldr r3, _08132240
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldr r0, _08132244
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #8]
	cmp r1, r0
	beq _08132248
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _0813224C
	.align 2, 0
_08132240: .4byte 0x0203A804
_08132244: .4byte 0x0202414C
_08132248:
	adds r0, r2, #6
	str r0, [r3]
_0813224C:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_equal_

	thumb_func_start BattleAICmd_if_user_goes
BattleAICmd_if_user_goes: @ 0x08132250
	push {lr}
	ldr r0, _08132288
	ldrb r0, [r0]
	ldr r1, _0813228C
	ldrb r1, [r1]
	movs r2, #1
	bl GetWhoStrikesFirst
	ldr r3, _08132290
	ldr r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _08132294
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08132298
	.align 2, 0
_08132288: .4byte 0x0203A808
_0813228C: .4byte 0x02023EB0
_08132290: .4byte 0x0203A804
_08132294:
	adds r0, r2, #6
	str r0, [r3]
_08132298:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_user_goes

	thumb_func_start BattleAICmd_if_user_doesnt_go
BattleAICmd_if_user_doesnt_go: @ 0x0813229C
	push {lr}
	ldr r0, _081322D4
	ldrb r0, [r0]
	ldr r1, _081322D8
	ldrb r1, [r1]
	movs r2, #1
	bl GetWhoStrikesFirst
	ldr r3, _081322DC
	ldr r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r2, #1]
	cmp r0, r1
	beq _081322E0
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081322E4
	.align 2, 0
_081322D4: .4byte 0x0203A808
_081322D8: .4byte 0x02023EB0
_081322DC: .4byte 0x0203A804
_081322E0:
	adds r0, r2, #6
	str r0, [r3]
_081322E4:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_user_doesnt_go

	thumb_func_start BattleAICmd_nullsub_2B
BattleAICmd_nullsub_2B: @ 0x081322E8
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_2B

	thumb_func_start BattleAICmd_nullsub_32
BattleAICmd_nullsub_32: @ 0x081322EC
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_32

	thumb_func_start BattleAICmd_count_usable_party_mons
BattleAICmd_count_usable_party_mons: @ 0x081322F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08132310
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #0
	str r0, [r1, #8]
	ldr r0, _08132314
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0813231C
	ldr r0, _08132318
	b _0813231E
	.align 2, 0
_08132310: .4byte 0x0202414C
_08132314: .4byte 0x0203A804
_08132318: .4byte 0x0203A808
_0813231C:
	ldr r0, _08132364
_0813231E:
	ldrb r5, [r0]
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _08132368
	mov r8, r1
	cmp r0, #0
	bne _08132334
	ldr r0, _0813236C
	mov r8, r0
_08132334:
	ldr r0, _08132370
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08132378
	ldr r4, _08132374
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrb r7, [r0]
	adds r0, r5, #0
	bl GetBattlerPosition
	movs r1, #2
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r4
	ldrb r6, [r0]
	b _08132382
	.align 2, 0
_08132364: .4byte 0x02023EB0
_08132368: .4byte 0x020243E8
_0813236C: .4byte 0x02024190
_08132370: .4byte 0x02022C90
_08132374: .4byte 0x02023D12
_08132378:
	ldr r1, _081323E0
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrb r6, [r0]
	adds r7, r6, #0
_08132382:
	movs r5, #0
_08132384:
	cmp r5, r7
	beq _081323C8
	cmp r5, r6
	beq _081323C8
	movs r0, #0x64
	muls r0, r5, r0
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _081323C8
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _081323C8
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _081323C8
	ldr r0, _081323E4
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
_081323C8:
	adds r5, #1
	cmp r5, #5
	ble _08132384
	ldr r1, _081323E8
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081323E0: .4byte 0x02023D12
_081323E4: .4byte 0x0202414C
_081323E8: .4byte 0x0203A804
	thumb_func_end BattleAICmd_count_usable_party_mons

	thumb_func_start BattleAICmd_get_considered_move
BattleAICmd_get_considered_move: @ 0x081323EC
	ldr r0, _08132400
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	ldrh r0, [r1, #2]
	str r0, [r1, #8]
	ldr r1, _08132404
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08132400: .4byte 0x0202414C
_08132404: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_considered_move

	thumb_func_start BattleAICmd_get_considered_move_effect
BattleAICmd_get_considered_move_effect: @ 0x08132408
	ldr r0, _08132428
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _0813242C
	ldrh r1, [r3, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	str r0, [r3, #8]
	ldr r1, _08132430
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08132428: .4byte 0x0202414C
_0813242C: .4byte 0x082ED220
_08132430: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_considered_move_effect

	thumb_func_start BattleAICmd_get_ability
BattleAICmd_get_ability: @ 0x08132434
	push {r4, r5, r6, r7, lr}
	ldr r0, _08132448
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	mov ip, r0
	cmp r1, #1
	bne _08132450
	ldr r0, _0813244C
	b _08132452
	.align 2, 0
_08132448: .4byte 0x0203A804
_0813244C: .4byte 0x0203A808
_08132450:
	ldr r0, _08132474
_08132452:
	ldrb r3, [r0]
	ldr r0, _08132478
	ldrb r0, [r0]
	cmp r0, r3
	beq _08132524
	ldr r7, _0813247C
	ldr r5, [r7]
	ldr r0, [r5, #0x18]
	adds r0, #0x40
	adds r2, r0, r3
	ldrb r0, [r2]
	adds r6, r7, #0
	cmp r0, #0
	beq _08132480
	ldr r1, [r5, #0x14]
	str r0, [r1, #8]
	b _08132538
	.align 2, 0
_08132474: .4byte 0x02023EB0
_08132478: .4byte 0x02023D08
_0813247C: .4byte 0x0202414C
_08132480:
	ldr r1, _081324B0
	movs r0, #0x58
	muls r0, r3, r0
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x17
	beq _0813249C
	cmp r0, #0x2a
	beq _0813249C
	cmp r0, #0x47
	bne _081324B4
_0813249C:
	ldr r0, [r6]
	ldr r1, [r0, #0x14]
	movs r0, #0x58
	muls r0, r3, r0
	adds r0, r0, r2
	adds r0, #0x20
	ldrb r0, [r0]
	str r0, [r1, #8]
	b _08132538
	.align 2, 0
_081324B0: .4byte 0x02023D28
_081324B4:
	ldr r6, _081324F0
	ldrh r0, [r4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r6
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	beq _0813251C
	ldrb r0, [r2, #0x17]
	cmp r0, #0
	beq _08132514
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _081324F8
	ldr r0, [r7]
	ldr r2, [r0, #0x14]
	ldrh r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #0x16]
	str r0, [r2, #8]
	ldr r0, _081324F4
	mov ip, r0
	b _08132538
	.align 2, 0
_081324F0: .4byte 0x082F0D54
_081324F4: .4byte 0x0203A804
_081324F8:
	ldr r0, [r7]
	ldr r2, [r0, #0x14]
	ldrh r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #0x17]
	str r0, [r2, #8]
	ldr r1, _08132510
	mov ip, r1
	b _08132538
	.align 2, 0
_08132510: .4byte 0x0203A804
_08132514:
	ldr r1, [r5, #0x14]
	ldrb r0, [r2, #0x16]
	str r0, [r1, #8]
	b _08132538
_0813251C:
	ldr r1, [r5, #0x14]
	ldrb r0, [r2, #0x17]
	str r0, [r1, #8]
	b _08132538
_08132524:
	ldr r0, _08132548
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r1, _0813254C
	movs r0, #0x58
	muls r0, r3, r0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	str r0, [r2, #8]
_08132538:
	mov r1, ip
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08132548: .4byte 0x0202414C
_0813254C: .4byte 0x02023D28
	thumb_func_end BattleAICmd_get_ability

	thumb_func_start BattleAICmd_check_ability
BattleAICmd_check_ability: @ 0x08132550
	push {r4, r5, r6, lr}
	ldr r4, _08132588
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl BattleAI_GetWantedBattler
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4]
	ldrb r3, [r0, #2]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0813256E
	cmp r0, #2
	bne _081325F0
_0813256E:
	ldr r0, _0813258C
	ldr r4, [r0]
	ldr r1, [r4, #0x18]
	adds r1, #0x40
	adds r2, r1, r5
	ldrb r1, [r2]
	adds r6, r0, #0
	cmp r1, #0
	beq _08132590
	adds r3, r1, #0
	ldr r0, [r4, #0x14]
	str r3, [r0, #8]
	b _081325FE
	.align 2, 0
_08132588: .4byte 0x0203A804
_0813258C: .4byte 0x0202414C
_08132590:
	ldr r1, _081325B8
	movs r0, #0x58
	muls r0, r5, r0
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _081325AA
	cmp r0, #0x2a
	beq _081325AA
	cmp r0, #0x47
	bne _081325BC
_081325AA:
	movs r0, #0x58
	muls r0, r5, r0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r3, [r0]
	b _081325FE
	.align 2, 0
_081325B8: .4byte 0x02023D28
_081325BC:
	ldr r2, _081325E4
	ldrh r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r4, [r1, #0x16]
	cmp r4, #0
	beq _081325EC
	ldrb r2, [r1, #0x17]
	cmp r2, #0
	beq _081325E8
	adds r0, r3, #0
	cmp r4, r0
	beq _08132602
	cmp r2, r0
	beq _08132602
	adds r3, r4, #0
	b _081325FE
	.align 2, 0
_081325E4: .4byte 0x082F0D54
_081325E8:
	ldrb r3, [r1, #0x16]
	b _081325FE
_081325EC:
	ldrb r3, [r1, #0x17]
	b _081325FE
_081325F0:
	ldr r1, _08132610
	movs r0, #0x58
	muls r0, r5, r0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r3, [r0]
	ldr r6, _08132614
_081325FE:
	cmp r3, #0
	bne _0813261C
_08132602:
	ldr r0, [r6]
	ldr r1, [r0, #0x14]
	movs r0, #2
	str r0, [r1, #8]
	ldr r2, _08132618
	b _0813263C
	.align 2, 0
_08132610: .4byte 0x02023D28
_08132614: .4byte 0x0202414C
_08132618: .4byte 0x0203A804
_0813261C:
	ldr r0, _08132630
	ldr r1, [r0]
	adds r2, r0, #0
	ldrb r1, [r1, #2]
	cmp r3, r1
	bne _08132634
	ldr r0, [r6]
	ldr r1, [r0, #0x14]
	movs r0, #1
	b _0813263A
	.align 2, 0
_08132630: .4byte 0x0203A804
_08132634:
	ldr r0, [r6]
	ldr r1, [r0, #0x14]
	movs r0, #0
_0813263A:
	str r0, [r1, #8]
_0813263C:
	ldr r0, [r2]
	adds r0, #3
	str r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_check_ability

	thumb_func_start BattleAICmd_get_highest_type_effectiveness
BattleAICmd_get_highest_type_effectiveness: @ 0x08132648
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08132704
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08132708
	ldr r0, [r0]
	strb r1, [r0, #0x13]
	ldr r0, _0813270C
	movs r3, #0
	movs r2, #1
	strb r2, [r0, #0xe]
	ldr r0, _08132710
	strb r1, [r0]
	ldr r0, _08132714
	strb r2, [r0]
	ldr r0, _08132718
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	str r3, [r0, #8]
	movs r5, #0
	ldr r4, _0813271C
	ldr r7, _08132720
	ldr r0, _08132724
	mov r8, r0
	ldr r6, _08132728
_0813267E:
	movs r0, #0x28
	str r0, [r4]
	lsls r1, r5, #1
	ldrb r2, [r6]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, r1, r0
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r7]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081326EC
	ldrh r0, [r7]
	ldrb r1, [r6]
	ldr r2, _0813272C
	ldrb r2, [r2]
	bl TypeCalc
	ldr r0, [r4]
	cmp r0, #0x78
	bne _081326AE
	movs r0, #0x50
	str r0, [r4]
_081326AE:
	ldr r0, [r4]
	cmp r0, #0xf0
	bne _081326B8
	movs r0, #0xa0
	str r0, [r4]
_081326B8:
	ldr r0, [r4]
	cmp r0, #0x1e
	bne _081326C2
	movs r0, #0x14
	str r0, [r4]
_081326C2:
	ldr r0, [r4]
	cmp r0, #0xf
	bne _081326CC
	movs r0, #0xa
	str r0, [r4]
_081326CC:
	ldr r0, _08132710
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081326DC
	movs r0, #0
	str r0, [r4]
_081326DC:
	ldr r0, _08132718
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r0, [r2, #8]
	ldr r1, [r4]
	cmp r0, r1
	bhs _081326EC
	str r1, [r2, #8]
_081326EC:
	adds r5, #1
	cmp r5, #3
	ble _0813267E
	ldr r1, _08132730
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08132704: .4byte 0x020240A4
_08132708: .4byte 0x02024140
_0813270C: .4byte 0x02024118
_08132710: .4byte 0x02023F20
_08132714: .4byte 0x02023EB5
_08132718: .4byte 0x0202414C
_0813271C: .4byte 0x02023E94
_08132720: .4byte 0x02023E8E
_08132724: .4byte 0x02023D34
_08132728: .4byte 0x0203A808
_0813272C: .4byte 0x02023EB0
_08132730: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_highest_type_effectiveness

	thumb_func_start BattleAICmd_if_type_effectiveness
BattleAICmd_if_type_effectiveness: @ 0x08132734
	push {r4, r5, lr}
	ldr r0, _081327CC
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081327D0
	ldr r0, [r0]
	strb r1, [r0, #0x13]
	ldr r0, _081327D4
	movs r2, #1
	strb r2, [r0, #0xe]
	ldr r5, _081327D8
	strb r1, [r5]
	ldr r0, _081327DC
	strb r2, [r0]
	ldr r4, _081327E0
	movs r0, #0x28
	str r0, [r4]
	ldr r1, _081327E4
	ldr r0, _081327E8
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldrh r0, [r1]
	ldr r1, _081327EC
	ldrb r1, [r1]
	ldr r2, _081327F0
	ldrb r2, [r2]
	bl TypeCalc
	ldr r0, [r4]
	cmp r0, #0x78
	bne _0813277A
	movs r0, #0x50
	str r0, [r4]
_0813277A:
	ldr r0, [r4]
	cmp r0, #0xf0
	bne _08132784
	movs r0, #0xa0
	str r0, [r4]
_08132784:
	ldr r0, [r4]
	cmp r0, #0x1e
	bne _0813278E
	movs r0, #0x14
	str r0, [r4]
_0813278E:
	ldr r0, [r4]
	cmp r0, #0xf
	bne _08132798
	movs r0, #0xa
	str r0, [r4]
_08132798:
	ldrb r1, [r5]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081327A6
	movs r0, #0
	str r0, [r4]
_081327A6:
	ldrb r0, [r4]
	ldr r3, _081327F4
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _081327F8
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081327FC
	.align 2, 0
_081327CC: .4byte 0x020240A4
_081327D0: .4byte 0x02024140
_081327D4: .4byte 0x02024118
_081327D8: .4byte 0x02023F20
_081327DC: .4byte 0x02023EB5
_081327E0: .4byte 0x02023E94
_081327E4: .4byte 0x02023E8E
_081327E8: .4byte 0x0202414C
_081327EC: .4byte 0x0203A808
_081327F0: .4byte 0x02023EB0
_081327F4: .4byte 0x0203A804
_081327F8:
	adds r0, r2, #6
	str r0, [r3]
_081327FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_type_effectiveness

	thumb_func_start BattleAICmd_nullsub_33
BattleAICmd_nullsub_33: @ 0x08132804
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_33

	thumb_func_start BattleAICmd_nullsub_52
BattleAICmd_nullsub_52: @ 0x08132808
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_52

	thumb_func_start BattleAICmd_if_status_in_party
BattleAICmd_if_status_in_party: @ 0x0813280C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08132824
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0813284C
	ldr r0, _08132828
	b _0813284E
	.align 2, 0
_08132824: .4byte 0x0203A804
_08132828: .4byte 0x0203A808
_0813282C:
	ldr r3, _08132848
	ldr r2, [r3]
	ldrb r1, [r2, #6]
	ldrb r0, [r2, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081328CE
	.align 2, 0
_08132848: .4byte 0x0203A804
_0813284C:
	ldr r0, _081328DC
_0813284E:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _081328E0
	mov sb, r1
	cmp r0, #0
	bne _08132862
	ldr r0, _081328E4
	mov sb, r0
_08132862:
	ldr r0, _081328E8
	ldr r1, [r0]
	ldrb r7, [r1, #2]
	ldrb r0, [r1, #3]
	lsls r0, r0, #8
	orrs r7, r0
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x10
	orrs r7, r0
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x18
	orrs r7, r0
	movs r1, #0
	mov r8, r1
	movs r0, #0xce
	lsls r0, r0, #1
	mov sl, r0
_08132884:
	movs r0, #0x64
	mov r4, r8
	muls r4, r0, r4
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	cmp r5, #0
	beq _081328BC
	cmp r5, sl
	beq _081328BC
	cmp r6, #0
	beq _081328BC
	cmp r0, r7
	beq _0813282C
_081328BC:
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #5
	ble _08132884
	ldr r1, _081328E8
	ldr r0, [r1]
	adds r0, #0xa
	str r0, [r1]
_081328CE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081328DC: .4byte 0x02023EB0
_081328E0: .4byte 0x020243E8
_081328E4: .4byte 0x02024190
_081328E8: .4byte 0x0203A804
	thumb_func_end BattleAICmd_if_status_in_party

	thumb_func_start BattleAICmd_if_status_not_in_party
BattleAICmd_if_status_not_in_party: @ 0x081328EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08132904
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0813290C
	ldr r0, _08132908
	b _0813290E
	.align 2, 0
_08132904: .4byte 0x0203A804
_08132908: .4byte 0x0203A808
_0813290C:
	ldr r0, _081329B8
_0813290E:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _081329BC
	mov sl, r1
	cmp r0, #0
	bne _08132922
	ldr r0, _081329C0
	mov sl, r0
_08132922:
	ldr r2, _081329C4
	ldr r1, [r2]
	ldrb r7, [r1, #2]
	ldrb r0, [r1, #3]
	lsls r0, r0, #8
	orrs r7, r0
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x10
	orrs r7, r0
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x18
	orrs r7, r0
	movs r1, #0
	mov r8, r1
	mov sb, r2
_08132940:
	movs r0, #0x64
	mov r4, r8
	muls r4, r0, r4
	add r4, sl
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	cmp r5, #0
	beq _08132984
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r5, r1
	beq _08132984
	cmp r6, #0
	beq _08132984
	cmp r0, r7
	bne _08132984
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0xa
	str r0, [r1]
_08132984:
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #5
	ble _08132940
	ldr r3, _081329C4
	ldr r2, [r3]
	ldrb r1, [r2, #6]
	ldrb r0, [r2, #7]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #9]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081329B8: .4byte 0x02023EB0
_081329BC: .4byte 0x020243E8
_081329C0: .4byte 0x02024190
_081329C4: .4byte 0x0203A804
	thumb_func_end BattleAICmd_if_status_not_in_party

	thumb_func_start BattleAICmd_get_weather
BattleAICmd_get_weather: @ 0x081329C8
	push {lr}
	ldr r2, _08132A28
	ldrh r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _081329E0
	ldr r0, _08132A2C
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #1
	str r0, [r1, #8]
_081329E0:
	ldrh r1, [r2]
	movs r0, #0x18
	ands r0, r1
	cmp r0, #0
	beq _081329F4
	ldr r0, _08132A2C
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #2
	str r0, [r1, #8]
_081329F4:
	ldrh r1, [r2]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _08132A08
	ldr r0, _08132A2C
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #0
	str r0, [r1, #8]
_08132A08:
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08132A1C
	ldr r0, _08132A2C
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #3
	str r0, [r1, #8]
_08132A1C:
	ldr r1, _08132A30
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08132A28: .4byte 0x02024070
_08132A2C: .4byte 0x0202414C
_08132A30: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_weather

	thumb_func_start BattleAICmd_if_effect
BattleAICmd_if_effect: @ 0x08132A34
	push {lr}
	ldr r2, _08132A6C
	ldr r0, _08132A70
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, _08132A74
	ldr r2, [r3]
	ldrb r0, [r0]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _08132A78
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08132A7C
	.align 2, 0
_08132A6C: .4byte 0x082ED220
_08132A70: .4byte 0x0202414C
_08132A74: .4byte 0x0203A804
_08132A78:
	adds r0, r2, #6
	str r0, [r3]
_08132A7C:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_effect

	thumb_func_start BattleAICmd_if_not_effect
BattleAICmd_if_not_effect: @ 0x08132A80
	push {lr}
	ldr r2, _08132AB8
	ldr r0, _08132ABC
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, _08132AC0
	ldr r2, [r3]
	ldrb r0, [r0]
	ldrb r1, [r2, #1]
	cmp r0, r1
	beq _08132AC4
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08132AC8
	.align 2, 0
_08132AB8: .4byte 0x082ED220
_08132ABC: .4byte 0x0202414C
_08132AC0: .4byte 0x0203A804
_08132AC4:
	adds r0, r2, #6
	str r0, [r3]
_08132AC8:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_effect

	thumb_func_start BattleAICmd_if_stat_level_less_than
BattleAICmd_if_stat_level_less_than: @ 0x08132ACC
	push {r4, lr}
	ldr r0, _08132AE0
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _08132AE8
	ldr r0, _08132AE4
	b _08132AEA
	.align 2, 0
_08132AE0: .4byte 0x0203A804
_08132AE4: .4byte 0x0203A808
_08132AE8:
	ldr r0, _08132B20
_08132AEA:
	ldrb r3, [r0]
	ldr r1, _08132B24
	ldr r2, [r4]
	movs r0, #0x58
	muls r0, r3, r0
	ldrb r3, [r2, #2]
	adds r0, r0, r3
	adds r1, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r2, #3]
	cmp r0, r1
	bge _08132B28
	ldrb r1, [r2, #4]
	ldrb r0, [r2, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08132B2E
	.align 2, 0
_08132B20: .4byte 0x02023EB0
_08132B24: .4byte 0x02023D28
_08132B28:
	adds r0, r2, #0
	adds r0, #8
	str r0, [r4]
_08132B2E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_less_than

	thumb_func_start BattleAICmd_if_stat_level_more_than
BattleAICmd_if_stat_level_more_than: @ 0x08132B34
	push {r4, lr}
	ldr r0, _08132B48
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _08132B50
	ldr r0, _08132B4C
	b _08132B52
	.align 2, 0
_08132B48: .4byte 0x0203A804
_08132B4C: .4byte 0x0203A808
_08132B50:
	ldr r0, _08132B88
_08132B52:
	ldrb r3, [r0]
	ldr r1, _08132B8C
	ldr r2, [r4]
	movs r0, #0x58
	muls r0, r3, r0
	ldrb r3, [r2, #2]
	adds r0, r0, r3
	adds r1, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r2, #3]
	cmp r0, r1
	ble _08132B90
	ldrb r1, [r2, #4]
	ldrb r0, [r2, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08132B96
	.align 2, 0
_08132B88: .4byte 0x02023EB0
_08132B8C: .4byte 0x02023D28
_08132B90:
	adds r0, r2, #0
	adds r0, #8
	str r0, [r4]
_08132B96:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_more_than

	thumb_func_start BattleAICmd_if_stat_level_equal
BattleAICmd_if_stat_level_equal: @ 0x08132B9C
	push {r4, lr}
	ldr r0, _08132BB0
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _08132BB8
	ldr r0, _08132BB4
	b _08132BBA
	.align 2, 0
_08132BB0: .4byte 0x0203A804
_08132BB4: .4byte 0x0203A808
_08132BB8:
	ldr r0, _08132BF0
_08132BBA:
	ldrb r3, [r0]
	ldr r1, _08132BF4
	ldr r2, [r4]
	movs r0, #0x58
	muls r0, r3, r0
	ldrb r3, [r2, #2]
	adds r0, r0, r3
	adds r1, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r2, #3]
	cmp r0, r1
	bne _08132BF8
	ldrb r1, [r2, #4]
	ldrb r0, [r2, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08132BFE
	.align 2, 0
_08132BF0: .4byte 0x02023EB0
_08132BF4: .4byte 0x02023D28
_08132BF8:
	adds r0, r2, #0
	adds r0, #8
	str r0, [r4]
_08132BFE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_equal

	thumb_func_start BattleAICmd_if_stat_level_not_equal
BattleAICmd_if_stat_level_not_equal: @ 0x08132C04
	push {r4, lr}
	ldr r0, _08132C18
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _08132C20
	ldr r0, _08132C1C
	b _08132C22
	.align 2, 0
_08132C18: .4byte 0x0203A804
_08132C1C: .4byte 0x0203A808
_08132C20:
	ldr r0, _08132C58
_08132C22:
	ldrb r3, [r0]
	ldr r1, _08132C5C
	ldr r2, [r4]
	movs r0, #0x58
	muls r0, r3, r0
	ldrb r3, [r2, #2]
	adds r0, r0, r3
	adds r1, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r2, #3]
	cmp r0, r1
	beq _08132C60
	ldrb r1, [r2, #4]
	ldrb r0, [r2, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08132C66
	.align 2, 0
_08132C58: .4byte 0x02023EB0
_08132C5C: .4byte 0x02023D28
_08132C60:
	adds r0, r2, #0
	adds r0, #8
	str r0, [r4]
_08132C66:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_not_equal

	thumb_func_start BattleAICmd_if_can_faint
BattleAICmd_if_can_faint: @ 0x08132C6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _08132D1C
	ldr r0, _08132D20
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #1
	bls _08132D50
	ldr r0, _08132D24
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08132D28
	ldr r0, [r0]
	strb r1, [r0, #0x13]
	ldr r0, _08132D2C
	movs r7, #1
	strb r7, [r0, #0xe]
	ldr r0, _08132D30
	strb r1, [r0]
	ldr r0, _08132D34
	strb r7, [r0]
	ldr r5, _08132D38
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, #0x14]
	ldrh r0, [r0, #2]
	strh r0, [r5]
	ldr r4, _08132D3C
	ldrb r0, [r4]
	ldr r6, _08132D40
	ldrb r1, [r6]
	bl AI_CalcDmg
	ldrh r0, [r5]
	ldrb r1, [r4]
	ldrb r2, [r6]
	bl TypeCalc
	ldr r4, _08132D44
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r0, #0x18
	ldrb r1, [r1, #1]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, [r4]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, #0
	bne _08132CEC
	str r7, [r4]
_08132CEC:
	ldr r2, _08132D48
	ldrb r1, [r6]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #0x28]
	ldr r0, [r4]
	cmp r1, r0
	bgt _08132D50
	ldr r3, _08132D4C
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08132D58
	.align 2, 0
_08132D1C: .4byte 0x082ED220
_08132D20: .4byte 0x0202414C
_08132D24: .4byte 0x020240A4
_08132D28: .4byte 0x02024140
_08132D2C: .4byte 0x02024118
_08132D30: .4byte 0x02023F20
_08132D34: .4byte 0x02023EB5
_08132D38: .4byte 0x02023E8E
_08132D3C: .4byte 0x0203A808
_08132D40: .4byte 0x02023EB0
_08132D44: .4byte 0x02023E94
_08132D48: .4byte 0x02023D28
_08132D4C: .4byte 0x0203A804
_08132D50:
	ldr r1, _08132D64
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
_08132D58:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08132D64: .4byte 0x0203A804
	thumb_func_end BattleAICmd_if_can_faint

	thumb_func_start BattleAICmd_if_cant_faint
BattleAICmd_if_cant_faint: @ 0x08132D68
	push {r4, r5, r6, r7, lr}
	ldr r2, _08132E04
	ldr r7, _08132E08
	ldr r0, [r7]
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #1
	bls _08132E38
	ldr r0, _08132E0C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08132E10
	ldr r0, [r0]
	strb r1, [r0, #0x13]
	ldr r0, _08132E14
	movs r2, #1
	strb r2, [r0, #0xe]
	ldr r0, _08132E18
	strb r1, [r0]
	ldr r0, _08132E1C
	strb r2, [r0]
	ldr r6, _08132E20
	ldr r0, [r7]
	ldr r0, [r0, #0x14]
	ldrh r0, [r0, #2]
	strh r0, [r6]
	ldr r4, _08132E24
	ldrb r0, [r4]
	ldr r5, _08132E28
	ldrb r1, [r5]
	bl AI_CalcDmg
	ldrh r0, [r6]
	ldrb r1, [r4]
	ldrb r2, [r5]
	bl TypeCalc
	ldr r4, _08132E2C
	ldr r0, [r7]
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r0, #0x18
	ldrb r1, [r1, #1]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, [r4]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	str r0, [r4]
	ldr r3, _08132E30
	ldrb r2, [r5]
	movs r1, #0x58
	muls r1, r2, r1
	adds r1, r1, r3
	ldrh r1, [r1, #0x28]
	cmp r1, r0
	ble _08132E38
	ldr r3, _08132E34
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08132E40
	.align 2, 0
_08132E04: .4byte 0x082ED220
_08132E08: .4byte 0x0202414C
_08132E0C: .4byte 0x020240A4
_08132E10: .4byte 0x02024140
_08132E14: .4byte 0x02024118
_08132E18: .4byte 0x02023F20
_08132E1C: .4byte 0x02023EB5
_08132E20: .4byte 0x02023E8E
_08132E24: .4byte 0x0203A808
_08132E28: .4byte 0x02023EB0
_08132E2C: .4byte 0x02023E94
_08132E30: .4byte 0x02023D28
_08132E34: .4byte 0x0203A804
_08132E38:
	ldr r1, _08132E48
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
_08132E40:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08132E48: .4byte 0x0203A804
	thumb_func_end BattleAICmd_if_cant_faint

	thumb_func_start BattleAICmd_if_has_move
BattleAICmd_if_has_move: @ 0x08132E4C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08132E68
	ldr r5, [r0]
	adds r7, r5, #2
	ldrb r1, [r5, #1]
	adds r6, r0, #0
	cmp r1, #1
	beq _08132E76
	cmp r1, #1
	bgt _08132E6C
	cmp r1, #0
	beq _08132F10
	b _08132F74
	.align 2, 0
_08132E68: .4byte 0x0203A804
_08132E6C:
	cmp r1, #2
	beq _08132F10
	cmp r1, #3
	beq _08132EB8
	b _08132F74
_08132E76:
	movs r4, #0
	ldr r3, _08132EB0
	ldr r2, _08132EB4
	ldrb r1, [r2]
	movs r0, #0x58
	muls r0, r1, r0
	adds r3, #0xc
	adds r0, r0, r3
	ldrh r0, [r0]
	ldrh r5, [r5, #2]
	cmp r0, r5
	beq _08132EA8
	movs r5, #0x58
_08132E90:
	adds r4, #1
	cmp r4, #3
	bgt _08132EA8
	lsls r1, r4, #1
	ldrb r0, [r2]
	muls r0, r5, r0
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	ldrh r1, [r7]
	cmp r0, r1
	bne _08132E90
_08132EA8:
	cmp r4, #4
	beq _08132F4C
	b _08132F5C
	.align 2, 0
_08132EB0: .4byte 0x02023D28
_08132EB4: .4byte 0x0203A808
_08132EB8:
	ldr r3, _08132ED4
	ldr r2, _08132ED8
	ldrb r1, [r2]
	movs r0, #2
	eors r0, r1
	movs r1, #0x58
	muls r1, r0, r1
	adds r0, r1, r3
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _08132EDC
	adds r0, r5, #0
	b _08132F4E
	.align 2, 0
_08132ED4: .4byte 0x02023D28
_08132ED8: .4byte 0x0203A808
_08132EDC:
	movs r4, #0
	adds r3, #0xc
	adds r0, r1, r3
	ldrh r0, [r0]
	ldrh r5, [r5, #2]
	cmp r0, r5
	beq _08132EA8
	mov ip, r3
	adds r5, r2, #0
	movs r3, #2
_08132EF0:
	adds r4, #1
	cmp r4, #3
	bgt _08132EA8
	lsls r1, r4, #1
	ldrb r0, [r5]
	adds r2, r3, #0
	eors r2, r0
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, r1, r0
	add r1, ip
	ldrh r0, [r1]
	ldrh r1, [r7]
	cmp r0, r1
	bne _08132EF0
	b _08132EA8
_08132F10:
	movs r4, #0
	ldr r3, _08132F54
	ldr r0, [r3]
	ldr r1, [r0, #0x18]
	ldr r2, _08132F58
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r1, [r7]
	cmp r0, r1
	beq _08132F48
	adds r7, r3, #0
	adds r5, r2, #0
	adds r3, r1, #0
_08132F2E:
	adds r4, #1
	cmp r4, #3
	bgt _08132F48
	ldr r0, [r7]
	ldr r2, [r0, #0x18]
	lsls r1, r4, #1
	ldrb r0, [r5]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	cmp r0, r3
	bne _08132F2E
_08132F48:
	cmp r4, #4
	bne _08132F5C
_08132F4C:
	ldr r0, [r6]
_08132F4E:
	adds r0, #8
	str r0, [r6]
	b _08132F74
	.align 2, 0
_08132F54: .4byte 0x0202414C
_08132F58: .4byte 0x02023EB0
_08132F5C:
	ldr r2, [r6]
	ldrb r1, [r2, #4]
	ldrb r0, [r2, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r6]
_08132F74:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_has_move

	thumb_func_start BattleAICmd_if_doesnt_have_move
BattleAICmd_if_doesnt_have_move: @ 0x08132F7C
	push {r4, r5, r6, r7, lr}
	ldr r1, _08132F98
	ldr r0, [r1]
	adds r6, r0, #2
	ldrb r0, [r0, #1]
	adds r5, r1, #0
	cmp r0, #1
	beq _08132FA4
	cmp r0, #1
	bgt _08132F9C
	cmp r0, #0
	beq _08132FE8
	b _0813304C
	.align 2, 0
_08132F98: .4byte 0x0203A804
_08132F9C:
	cmp r0, #2
	beq _08132FE8
	cmp r0, #3
	bne _0813304C
_08132FA4:
	movs r3, #0
	ldr r2, _08132FE0
	ldr r4, _08132FE4
	ldrb r1, [r4]
	movs r0, #0x58
	muls r0, r1, r0
	adds r2, #0xc
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r1, [r6]
	cmp r0, r1
	beq _08132FDA
	adds r7, r4, #0
	movs r6, #0x58
	adds r4, r2, #0
	adds r2, r1, #0
_08132FC4:
	adds r3, #1
	cmp r3, #3
	bgt _08132FDA
	lsls r1, r3, #1
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, r2
	bne _08132FC4
_08132FDA:
	cmp r3, #4
	bne _08133024
	b _08133034
	.align 2, 0
_08132FE0: .4byte 0x02023D28
_08132FE4: .4byte 0x0203A808
_08132FE8:
	movs r3, #0
	ldr r4, _0813302C
	ldr r0, [r4]
	ldr r1, [r0, #0x18]
	ldr r2, _08133030
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r1, [r6]
	cmp r0, r1
	beq _08133020
	adds r7, r4, #0
	adds r6, r2, #0
	adds r4, r1, #0
_08133006:
	adds r3, #1
	cmp r3, #3
	bgt _08133020
	ldr r0, [r7]
	ldr r2, [r0, #0x18]
	lsls r1, r3, #1
	ldrb r0, [r6]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	cmp r0, r4
	bne _08133006
_08133020:
	cmp r3, #4
	beq _08133034
_08133024:
	ldr r0, [r5]
	adds r0, #8
	str r0, [r5]
	b _0813304C
	.align 2, 0
_0813302C: .4byte 0x0202414C
_08133030: .4byte 0x02023EB0
_08133034:
	ldr r2, [r5]
	ldrb r1, [r2, #4]
	ldrb r0, [r2, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
_0813304C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_doesnt_have_move

	thumb_func_start BattleAICmd_if_has_move_with_effect
BattleAICmd_if_has_move_with_effect: @ 0x08133054
	push {r4, r5, r6, r7, lr}
	ldr r1, _0813306C
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	adds r5, r1, #0
	cmp r0, #1
	beq _08133078
	cmp r0, #1
	bgt _08133070
	cmp r0, #0
	beq _081330C4
	b _08133144
	.align 2, 0
_0813306C: .4byte 0x0203A804
_08133070:
	cmp r0, #2
	beq _081330C4
	cmp r0, #3
	bne _08133144
_08133078:
	movs r3, #0
	ldr r1, _081330B4
	ldr r0, _081330B8
	ldrb r2, [r0]
	ldr r6, _081330BC
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0xc
	adds r2, r0, r1
	ldr r4, _081330C0
_0813308C:
	ldrh r0, [r2]
	cmp r0, #0
	beq _081330A6
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r4]
	ldrb r0, [r0]
	ldrb r1, [r1, #2]
	cmp r0, r1
	beq _081330AE
_081330A6:
	adds r2, #2
	adds r3, #1
	cmp r3, #3
	ble _0813308C
_081330AE:
	cmp r3, #4
	beq _08133110
	b _0813312C
	.align 2, 0
_081330B4: .4byte 0x02023D28
_081330B8: .4byte 0x0203A808
_081330BC: .4byte 0x082ED220
_081330C0: .4byte 0x0203A804
_081330C4:
	movs r3, #0
	ldr r1, _08133118
	ldr r0, _0813311C
	ldrb r2, [r0]
	ldr r0, _08133120
	mov ip, r0
	ldr r7, _08133124
	ldr r6, _08133128
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0xc
	adds r4, r0, r1
_081330DC:
	lsls r2, r3, #1
	ldrh r0, [r4]
	cmp r0, #0
	beq _08133104
	ldr r0, [r7]
	ldr r1, [r0, #0x18]
	ldrb r0, [r6]
	lsls r0, r0, #4
	adds r0, r2, r0
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r5]
	ldrb r0, [r0]
	ldrb r1, [r1, #2]
	cmp r0, r1
	beq _0813310C
_08133104:
	adds r4, #2
	adds r3, #1
	cmp r3, #3
	ble _081330DC
_0813310C:
	cmp r3, #4
	bne _0813312C
_08133110:
	ldr r0, [r5]
	adds r0, #7
	str r0, [r5]
	b _08133144
	.align 2, 0
_08133118: .4byte 0x02023D28
_0813311C: .4byte 0x0203A808
_08133120: .4byte 0x082ED220
_08133124: .4byte 0x0202414C
_08133128: .4byte 0x02023EB0
_0813312C:
	ldr r2, [r5]
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
_08133144:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_has_move_with_effect

	thumb_func_start BattleAICmd_if_doesnt_have_move_with_effect
BattleAICmd_if_doesnt_have_move_with_effect: @ 0x0813314C
	push {r4, r5, r6, lr}
	ldr r1, _08133164
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	adds r4, r1, #0
	cmp r0, #1
	beq _08133170
	cmp r0, #1
	bgt _08133168
	cmp r0, #0
	beq _081331BC
	b _08133228
	.align 2, 0
_08133164: .4byte 0x0203A804
_08133168:
	cmp r0, #2
	beq _081331BC
	cmp r0, #3
	bne _08133228
_08133170:
	movs r3, #0
	ldr r1, _081331AC
	ldr r0, _081331B0
	ldrb r2, [r0]
	ldr r6, _081331B4
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0xc
	adds r2, r0, r1
	ldr r5, _081331B8
_08133184:
	ldrh r0, [r2]
	cmp r0, #0
	beq _0813319E
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r5]
	ldrb r0, [r0]
	ldrb r1, [r1, #2]
	cmp r0, r1
	beq _081331A6
_0813319E:
	adds r2, #2
	adds r3, #1
	cmp r3, #3
	ble _08133184
_081331A6:
	cmp r3, #4
	bne _081331F6
	b _08133210
	.align 2, 0
_081331AC: .4byte 0x02023D28
_081331B0: .4byte 0x0203A808
_081331B4: .4byte 0x082ED220
_081331B8: .4byte 0x0203A804
_081331BC:
	movs r3, #0
	ldr r0, _08133200
	ldr r0, [r0]
	ldr r1, [r0, #0x18]
	ldr r0, _08133204
	ldrb r0, [r0]
	ldr r6, _08133208
	lsls r0, r0, #4
	adds r2, r0, r1
	ldr r5, _0813320C
_081331D0:
	ldrh r0, [r2]
	cmp r0, #0
	beq _081331EA
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r5]
	ldrb r0, [r0]
	ldrb r1, [r1, #2]
	cmp r0, r1
	beq _081331F2
_081331EA:
	adds r2, #2
	adds r3, #1
	cmp r3, #3
	ble _081331D0
_081331F2:
	cmp r3, #4
	beq _08133210
_081331F6:
	ldr r0, [r4]
	adds r0, #7
	str r0, [r4]
	b _08133228
	.align 2, 0
_08133200: .4byte 0x0202414C
_08133204: .4byte 0x02023EB0
_08133208: .4byte 0x082ED220
_0813320C: .4byte 0x0203A804
_08133210:
	ldr r2, [r4]
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
_08133228:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_doesnt_have_move_with_effect

	thumb_func_start BattleAICmd_if_any_move_disabled_or_encored
BattleAICmd_if_any_move_disabled_or_encored: @ 0x08133230
	push {r4, r5, lr}
	ldr r0, _08133244
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r5, r0, #0
	cmp r1, #1
	bne _0813324C
	ldr r0, _08133248
	b _0813324E
	.align 2, 0
_08133244: .4byte 0x0203A804
_08133248: .4byte 0x0203A808
_0813324C:
	ldr r0, _0813326C
_0813324E:
	ldrb r3, [r0]
	adds r4, r5, #0
	ldr r2, [r4]
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _08133274
	ldr r0, _08133270
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _08133278
	b _0813328E
	.align 2, 0
_0813326C: .4byte 0x02023EB0
_08133270: .4byte 0x02023F60
_08133274:
	cmp r0, #1
	beq _0813327E
_08133278:
	adds r0, r2, #7
	str r0, [r4]
	b _081332B0
_0813327E:
	ldr r0, _081332A8
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #6]
	cmp r0, #0
	beq _081332AC
_0813328E:
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _081332B0
	.align 2, 0
_081332A8: .4byte 0x02023F60
_081332AC:
	adds r0, r2, #7
	str r0, [r5]
_081332B0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_any_move_disabled_or_encored

	thumb_func_start BattleAICmd_if_curr_move_disabled_or_encored
BattleAICmd_if_curr_move_disabled_or_encored: @ 0x081332B8
	push {r4, lr}
	ldr r4, _081332CC
	ldr r3, [r4]
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _081332D0
	cmp r0, #1
	beq _081332FC
	b _0813333C
	.align 2, 0
_081332CC: .4byte 0x0203A804
_081332D0:
	ldr r2, _081332F0
	ldr r0, _081332F4
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _081332F8
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	ldrh r0, [r0, #4]
	ldrh r1, [r1, #2]
	cmp r0, r1
	beq _08133318
	b _0813333C
	.align 2, 0
_081332F0: .4byte 0x02023F60
_081332F4: .4byte 0x02023D08
_081332F8: .4byte 0x0202414C
_081332FC:
	ldr r2, _08133330
	ldr r0, _08133334
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _08133338
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	ldrh r0, [r0, #6]
	ldrh r1, [r1, #2]
	cmp r0, r1
	bne _0813333C
_08133318:
	ldrb r1, [r3, #2]
	ldrb r0, [r3, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _08133340
	.align 2, 0
_08133330: .4byte 0x02023F60
_08133334: .4byte 0x02023D08
_08133338: .4byte 0x0202414C
_0813333C:
	adds r0, r3, #6
	str r0, [r4]
_08133340:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_curr_move_disabled_or_encored

	thumb_func_start BattleAICmd_flee
BattleAICmd_flee: @ 0x08133348
	ldr r0, _08133358
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldrb r1, [r2, #0x10]
	movs r0, #0xb
	orrs r0, r1
	strb r0, [r2, #0x10]
	bx lr
	.align 2, 0
_08133358: .4byte 0x0202414C
	thumb_func_end BattleAICmd_flee

	thumb_func_start BattleAICmd_if_random_safari_flee
BattleAICmd_if_random_safari_flee: @ 0x0813335C
	push {r4, lr}
	ldr r0, _081333A0
	ldr r0, [r0]
	adds r0, #0x7b
	ldrb r0, [r0]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r4
	bhs _081333A8
	ldr r3, _081333A4
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081333B0
	.align 2, 0
_081333A0: .4byte 0x02024140
_081333A4: .4byte 0x0203A804
_081333A8:
	ldr r1, _081333B8
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
_081333B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081333B8: .4byte 0x0203A804
	thumb_func_end BattleAICmd_if_random_safari_flee

	thumb_func_start BattleAICmd_watch
BattleAICmd_watch: @ 0x081333BC
	ldr r0, _081333CC
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldrb r1, [r2, #0x10]
	movs r0, #0xd
	orrs r0, r1
	strb r0, [r2, #0x10]
	bx lr
	.align 2, 0
_081333CC: .4byte 0x0202414C
	thumb_func_end BattleAICmd_watch

	thumb_func_start BattleAICmd_get_hold_effect
BattleAICmd_get_hold_effect: @ 0x081333D0
	push {r4, lr}
	ldr r0, _081333E0
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _081333E8
	ldr r0, _081333E4
	b _081333EA
	.align 2, 0
_081333E0: .4byte 0x0203A804
_081333E4: .4byte 0x0203A808
_081333E8:
	ldr r0, _08133408
_081333EA:
	ldrb r2, [r0]
	ldr r0, _0813340C
	ldrb r0, [r0]
	cmp r0, r2
	beq _08133414
	ldr r4, _08133410
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	adds r0, #0x44
	adds r0, r0, r2
	ldrb r0, [r0]
	bl sub_080D6CF8
	ldr r1, [r4]
	b _08133426
	.align 2, 0
_08133408: .4byte 0x02023EB0
_0813340C: .4byte 0x02023D08
_08133410: .4byte 0x0202414C
_08133414:
	ldr r1, _0813343C
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0, #0x2e]
	bl sub_080D6CF8
	ldr r1, _08133440
	ldr r1, [r1]
_08133426:
	ldr r1, [r1, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1, #8]
	ldr r1, _08133444
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813343C: .4byte 0x02023D28
_08133440: .4byte 0x0202414C
_08133444: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_hold_effect

	thumb_func_start BattleAICmd_if_holds_item
BattleAICmd_if_holds_item: @ 0x08133448
	push {r4, lr}
	ldr r0, _08133474
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	bl BattleAI_GetWantedBattler
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r0, #1
	ldr r1, _08133478
	ldrb r2, [r1]
	adds r1, r3, #0
	ands r1, r0
	ands r0, r2
	cmp r1, r0
	bne _08133480
	ldr r1, _0813347C
	movs r0, #0x58
	muls r0, r3, r0
	adds r0, r0, r1
	ldrh r3, [r0, #0x2e]
	b _0813348C
	.align 2, 0
_08133474: .4byte 0x0203A804
_08133478: .4byte 0x0203A808
_0813347C: .4byte 0x02023D28
_08133480:
	ldr r0, _081334B4
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	adds r0, #0x44
	adds r0, r0, r3
	ldrb r3, [r0]
_0813348C:
	ldr r4, _081334B8
	ldr r2, [r4]
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	orrs r0, r1
	cmp r0, r3
	bne _081334BC
	ldrb r1, [r2, #4]
	ldrb r0, [r2, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #7]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _081334C2
	.align 2, 0
_081334B4: .4byte 0x0202414C
_081334B8: .4byte 0x0203A804
_081334BC:
	adds r0, r2, #0
	adds r0, #8
	str r0, [r4]
_081334C2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_holds_item

	thumb_func_start BattleAICmd_get_gender
BattleAICmd_get_gender: @ 0x081334C8
	push {lr}
	ldr r0, _081334D8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _081334E0
	ldr r0, _081334DC
	b _081334E2
	.align 2, 0
_081334D8: .4byte 0x0203A804
_081334DC: .4byte 0x0203A808
_081334E0:
	ldr r0, _08133510
_081334E2:
	ldrb r1, [r0]
	ldr r2, _08133514
	movs r0, #0x58
	muls r1, r0, r1
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, #0x48
	adds r1, r1, r2
	ldr r1, [r1]
	bl GetGenderFromSpeciesAndPersonality
	ldr r1, _08133518
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1, #8]
	ldr r1, _0813351C
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08133510: .4byte 0x02023EB0
_08133514: .4byte 0x02023D28
_08133518: .4byte 0x0202414C
_0813351C: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_gender

	thumb_func_start BattleAICmd_is_first_turn_for
BattleAICmd_is_first_turn_for: @ 0x08133520
	push {r4, lr}
	ldr r0, _08133534
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _0813353C
	ldr r0, _08133538
	b _0813353E
	.align 2, 0
_08133534: .4byte 0x0203A804
_08133538: .4byte 0x0203A808
_0813353C:
	ldr r0, _08133560
_0813353E:
	ldrb r3, [r0]
	ldr r0, _08133564
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r1, _08133568
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x16]
	str r0, [r2, #8]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133560: .4byte 0x02023EB0
_08133564: .4byte 0x0202414C
_08133568: .4byte 0x02023F60
	thumb_func_end BattleAICmd_is_first_turn_for

	thumb_func_start BattleAICmd_get_stockpile_count
BattleAICmd_get_stockpile_count: @ 0x0813356C
	push {r4, lr}
	ldr r0, _08133580
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _08133588
	ldr r0, _08133584
	b _0813358A
	.align 2, 0
_08133580: .4byte 0x0203A804
_08133584: .4byte 0x0203A808
_08133588:
	ldr r0, _081335AC
_0813358A:
	ldrb r3, [r0]
	ldr r0, _081335B0
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r1, _081335B4
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #9]
	str r0, [r2, #8]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081335AC: .4byte 0x02023EB0
_081335B0: .4byte 0x0202414C
_081335B4: .4byte 0x02023F60
	thumb_func_end BattleAICmd_get_stockpile_count

	thumb_func_start BattleAICmd_is_double_battle
BattleAICmd_is_double_battle: @ 0x081335B8
	ldr r0, _081335D4
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r0, _081335D8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	str r0, [r2, #8]
	ldr r1, _081335DC
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_081335D4: .4byte 0x0202414C
_081335D8: .4byte 0x02022C90
_081335DC: .4byte 0x0203A804
	thumb_func_end BattleAICmd_is_double_battle

	thumb_func_start BattleAICmd_get_used_held_item
BattleAICmd_get_used_held_item: @ 0x081335E0
	push {r4, lr}
	ldr r0, _081335F4
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _081335FC
	ldr r0, _081335F8
	b _081335FE
	.align 2, 0
_081335F4: .4byte 0x0203A804
_081335F8: .4byte 0x0203A808
_081335FC:
	ldr r0, _08133620
_081335FE:
	ldrb r3, [r0]
	ldr r0, _08133624
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r0, _08133628
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	adds r0, #0xb8
	ldrb r0, [r0]
	str r0, [r2, #8]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133620: .4byte 0x02023EB0
_08133624: .4byte 0x0202414C
_08133628: .4byte 0x02024140
	thumb_func_end BattleAICmd_get_used_held_item

	thumb_func_start BattleAICmd_get_move_type_from_result
BattleAICmd_get_move_type_from_result: @ 0x0813362C
	ldr r0, _0813364C
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _08133650
	ldr r1, [r3, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	str r0, [r3, #8]
	ldr r1, _08133654
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0813364C: .4byte 0x0202414C
_08133650: .4byte 0x082ED220
_08133654: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_move_type_from_result

	thumb_func_start BattleAICmd_get_move_power_from_result
BattleAICmd_get_move_power_from_result: @ 0x08133658
	ldr r0, _08133678
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _0813367C
	ldr r1, [r3, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	str r0, [r3, #8]
	ldr r1, _08133680
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08133678: .4byte 0x0202414C
_0813367C: .4byte 0x082ED220
_08133680: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_move_power_from_result

	thumb_func_start BattleAICmd_get_move_effect_from_result
BattleAICmd_get_move_effect_from_result: @ 0x08133684
	ldr r0, _081336A4
	ldr r0, [r0]
	ldr r3, [r0, #0x14]
	ldr r2, _081336A8
	ldr r1, [r3, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	str r0, [r3, #8]
	ldr r1, _081336AC
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_081336A4: .4byte 0x0202414C
_081336A8: .4byte 0x082ED220
_081336AC: .4byte 0x0203A804
	thumb_func_end BattleAICmd_get_move_effect_from_result

	thumb_func_start BattleAICmd_get_protect_count
BattleAICmd_get_protect_count: @ 0x081336B0
	push {r4, lr}
	ldr r0, _081336C4
	ldr r1, [r0]
	ldrb r1, [r1, #1]
	adds r4, r0, #0
	cmp r1, #1
	bne _081336CC
	ldr r0, _081336C8
	b _081336CE
	.align 2, 0
_081336C4: .4byte 0x0203A804
_081336C8: .4byte 0x0203A808
_081336CC:
	ldr r0, _081336F0
_081336CE:
	ldrb r3, [r0]
	ldr r0, _081336F4
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldr r1, _081336F8
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	str r0, [r2, #8]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081336F0: .4byte 0x02023EB0
_081336F4: .4byte 0x0202414C
_081336F8: .4byte 0x02023F60
	thumb_func_end BattleAICmd_get_protect_count

	thumb_func_start BattleAICmd_nullsub_53
BattleAICmd_nullsub_53: @ 0x081336FC
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_53

	thumb_func_start BattleAICmd_nullsub_54
BattleAICmd_nullsub_54: @ 0x08133700
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_54

	thumb_func_start BattleAICmd_nullsub_55
BattleAICmd_nullsub_55: @ 0x08133704
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_55

	thumb_func_start BattleAICmd_nullsub_56
BattleAICmd_nullsub_56: @ 0x08133708
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_56

	thumb_func_start BattleAICmd_nullsub_57
BattleAICmd_nullsub_57: @ 0x0813370C
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_57

	thumb_func_start BattleAICmd_nullsub_2A
BattleAICmd_nullsub_2A: @ 0x08133710
	bx lr
	.align 2, 0
	thumb_func_end BattleAICmd_nullsub_2A

	thumb_func_start BattleAICmd_call
BattleAICmd_call: @ 0x08133714
	push {r4, lr}
	ldr r4, _08133740
	ldr r0, [r4]
	adds r0, #5
	bl sub_081339A0
	ldr r2, [r4]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133740: .4byte 0x0203A804
	thumb_func_end BattleAICmd_call

	thumb_func_start BattleAICmd_goto
BattleAICmd_goto: @ 0x08133744
	ldr r3, _08133760
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_08133760: .4byte 0x0203A804
	thumb_func_end BattleAICmd_goto

	thumb_func_start BattleAICmd_end
BattleAICmd_end: @ 0x08133764
	push {lr}
	bl ScrSpecial_TraderMenuGiveDecoration
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813377E
	ldr r0, _08133784
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	ldrb r1, [r2, #0x10]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #0x10]
_0813377E:
	pop {r0}
	bx r0
	.align 2, 0
_08133784: .4byte 0x0202414C
	thumb_func_end BattleAICmd_end

	thumb_func_start BattleAICmd_if_level_cond
BattleAICmd_if_level_cond: @ 0x08133788
	push {r4, r5, lr}
	ldr r5, _081337A0
	ldr r4, [r5]
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _081337DC
	cmp r0, #1
	bgt _081337A4
	cmp r0, #0
	beq _081337AA
	b _08133858
	.align 2, 0
_081337A0: .4byte 0x0203A804
_081337A4:
	cmp r0, #2
	beq _0813380C
	b _08133858
_081337AA:
	ldr r3, _081337D0
	ldr r0, _081337D4
	ldrb r0, [r0]
	movs r2, #0x58
	adds r1, r0, #0
	muls r1, r2, r1
	adds r1, r1, r3
	adds r1, #0x2a
	ldr r0, _081337D8
	ldrb r0, [r0]
	muls r0, r2, r0
	adds r0, r0, r3
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhi _0813382E
	b _08133854
	.align 2, 0
_081337D0: .4byte 0x02023D28
_081337D4: .4byte 0x0203A808
_081337D8: .4byte 0x02023EB0
_081337DC:
	ldr r3, _08133800
	ldr r0, _08133804
	ldrb r0, [r0]
	movs r2, #0x58
	adds r1, r0, #0
	muls r1, r2, r1
	adds r1, r1, r3
	adds r1, #0x2a
	ldr r0, _08133808
	ldrb r0, [r0]
	muls r0, r2, r0
	adds r0, r0, r3
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	blo _0813382E
	b _08133854
	.align 2, 0
_08133800: .4byte 0x02023D28
_08133804: .4byte 0x0203A808
_08133808: .4byte 0x02023EB0
_0813380C:
	ldr r3, _08133848
	ldr r0, _0813384C
	ldrb r0, [r0]
	movs r2, #0x58
	adds r1, r0, #0
	muls r1, r2, r1
	adds r1, r1, r3
	adds r1, #0x2a
	ldr r0, _08133850
	ldrb r0, [r0]
	muls r0, r2, r0
	adds r0, r0, r3
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08133854
_0813382E:
	ldrb r1, [r4, #2]
	ldrb r0, [r4, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r4, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r5]
	b _08133858
	.align 2, 0
_08133848: .4byte 0x02023D28
_0813384C: .4byte 0x0203A808
_08133850: .4byte 0x02023EB0
_08133854:
	adds r0, r4, #6
	str r0, [r5]
_08133858:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAICmd_if_level_cond

	thumb_func_start BattleAICmd_if_target_taunted
BattleAICmd_if_target_taunted: @ 0x08133860
	push {lr}
	ldr r2, _08133894
	ldr r0, _08133898
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _081338A0
	ldr r3, _0813389C
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081338A8
	.align 2, 0
_08133894: .4byte 0x02023F60
_08133898: .4byte 0x02023EB0
_0813389C: .4byte 0x0203A804
_081338A0:
	ldr r1, _081338AC
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
_081338A8:
	pop {r0}
	bx r0
	.align 2, 0
_081338AC: .4byte 0x0203A804
	thumb_func_end BattleAICmd_if_target_taunted

	thumb_func_start BattleAICmd_if_target_not_taunted
BattleAICmd_if_target_not_taunted: @ 0x081338B0
	push {lr}
	ldr r2, _081338E4
	ldr r0, _081338E8
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bne _081338F0
	ldr r3, _081338EC
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _081338F8
	.align 2, 0
_081338E4: .4byte 0x02023F60
_081338E8: .4byte 0x02023EB0
_081338EC: .4byte 0x0203A804
_081338F0:
	ldr r1, _081338FC
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
_081338F8:
	pop {r0}
	bx r0
	.align 2, 0
_081338FC: .4byte 0x0203A804
	thumb_func_end BattleAICmd_if_target_not_taunted

	thumb_func_start BattleAICmd_if_target_is_ally
BattleAICmd_if_target_is_ally: @ 0x08133900
	push {lr}
	ldr r0, _08133934
	ldrb r3, [r0]
	movs r0, #1
	ldr r1, _08133938
	ldrb r2, [r1]
	adds r1, r0, #0
	ands r1, r3
	ands r0, r2
	cmp r1, r0
	bne _08133940
	ldr r3, _0813393C
	ldr r2, [r3]
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r3]
	b _08133948
	.align 2, 0
_08133934: .4byte 0x0203A808
_08133938: .4byte 0x02023EB0
_0813393C: .4byte 0x0203A804
_08133940:
	ldr r1, _0813394C
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
_08133948:
	pop {r0}
	bx r0
	.align 2, 0
_0813394C: .4byte 0x0203A804
	thumb_func_end BattleAICmd_if_target_is_ally

	thumb_func_start BattleAICmd_if_flash_fired
BattleAICmd_if_flash_fired: @ 0x08133950
	push {r4, lr}
	ldr r4, _0813398C
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl BattleAI_GetWantedBattler
	lsls r0, r0, #0x18
	ldr r1, _08133990
	ldr r1, [r1]
	ldr r1, [r1, #4]
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08133994
	ldr r2, [r4]
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4]
	b _0813399A
	.align 2, 0
_0813398C: .4byte 0x0203A804
_08133990: .4byte 0x0202414C
_08133994:
	ldr r0, [r4]
	adds r0, #6
	str r0, [r4]
_0813399A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_flash_fired

	thumb_func_start sub_081339A0
sub_081339A0: @ 0x081339A0
	push {r4, lr}
	ldr r1, _081339C0
	ldr r1, [r1]
	ldr r3, [r1, #0x1c]
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
_081339C0: .4byte 0x0202414C
	thumb_func_end sub_081339A0

	thumb_func_start AIStackPushVar_cursor
AIStackPushVar_cursor: @ 0x081339C4
	ldr r0, _081339E4
	ldr r0, [r0]
	ldr r2, [r0, #0x1c]
	adds r3, r2, #0
	adds r3, #0x20
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r2, r2, r0
	ldr r0, _081339E8
	ldr r0, [r0]
	str r0, [r2]
	bx lr
	.align 2, 0
_081339E4: .4byte 0x0202414C
_081339E8: .4byte 0x0203A804
	thumb_func_end AIStackPushVar_cursor

