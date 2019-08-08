.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08158A6C
sub_08158A6C: @ 0x08158A6C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08158AC8
	lsls r6, r0, #2
	adds r6, r6, r0
	lsls r6, r6, #3
	adds r6, r6, r1
	ldr r1, _08158ACC
	ldrh r0, [r1]
	strh r0, [r6, #8]
	ldrh r0, [r1, #2]
	strh r0, [r6, #0xa]
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r5, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl CalculatePanIncrement
	strh r4, [r6, #0xc]
	strh r5, [r6, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r6, #0x10]
	movs r0, #0xa
	strh r0, [r6, #0x1c]
	ldr r0, _08158AD0
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08158AC8: .4byte 0x03005B60
_08158ACC: .4byte 0x020380BE
_08158AD0: .4byte 0x08158AD5
	thumb_func_end sub_08158A6C

	thumb_func_start sub_08158AD4
sub_08158AD4: @ 0x08158AD4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08158B04
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r5, [r4, #0xc]
	ldrb r6, [r4, #0x10]
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6f
	bne _08158B0C
	movs r0, #5
	strh r0, [r4, #0x1c]
	strh r1, [r4, #0x1e]
	ldr r0, _08158B08
	str r0, [r4]
	b _08158B3A
	.align 2, 0
_08158B04: .4byte 0x03005B60
_08158B08: .4byte 0x08158B41
_08158B0C:
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	bne _08158B26
	strh r1, [r4, #0x1c]
	ldrh r0, [r4, #8]
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl PlaySE12WithPanning
_08158B26:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl KeepPanInRange
	strh r0, [r4, #0xc]
_08158B3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08158AD4

	thumb_func_start sub_08158B40
sub_08158B40: @ 0x08158B40
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08158B90
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _08158B88
	movs r0, #0
	strh r0, [r4, #0x1c]
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	ldrh r0, [r4, #0xa]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl PlaySE12WithPanning
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08158B88
	adds r0, r5, #0
	bl DestroyAnimSoundTask
_08158B88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08158B90: .4byte 0x03005B60
	thumb_func_end sub_08158B40

	thumb_func_start sub_08158B94
sub_08158B94: @ 0x08158B94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08158C38
	ldrh r1, [r0]
	str r1, [sp]
	ldrb r5, [r0, #4]
	ldrb r6, [r0, #6]
	ldrb r3, [r0, #8]
	mov sl, r3
	ldrb r7, [r0, #0xa]
	ldrb r1, [r0, #0xc]
	mov sb, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl BattleAnimAdjustPanning
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r0, r5, #0
	bl BattleAnimAdjustPanning
	adds r5, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CalculatePanIncrement
	ldr r2, _08158C3C
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	mov r6, sp
	ldrh r6, [r6]
	strh r6, [r1, #8]
	strh r4, [r1, #0xa]
	strh r5, [r1, #0xc]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0xe]
	mov r0, sl
	strh r0, [r1, #0x10]
	strh r7, [r1, #0x12]
	mov r3, sb
	strh r3, [r1, #0x14]
	strh r2, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r3, [r1, #0x20]
	ldr r2, _08158C40
	str r2, [r1]
	mov r0, r8
	bl _call_via_r2
	add sp, #4
	thumb_func_end sub_08158B94

	thumb_func_start sub_08158C28
sub_08158C28: @ 0x08158C28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08158C38: .4byte 0x020380BE
_08158C3C: .4byte 0x03005B60
_08158C40: .4byte 0x08158C45
	thumb_func_end sub_08158C28

	thumb_func_start sub_08158C44
sub_08158C44: @ 0x08158C44
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08158C88
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x20]
	adds r1, r0, #1
	strh r1, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08158C8C
	movs r0, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #8]
	movs r1, #0x1e
	ldrsb r1, [r4, r1]
	bl PlaySE12WithPanning
	ldrh r0, [r4, #0x10]
	subs r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08158C8C
	adds r0, r5, #0
	bl DestroyAnimSoundTask
	b _08158CBE
	.align 2, 0
_08158C88: .4byte 0x03005B60
_08158C8C:
	ldr r1, _08158CC4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x1c]
	adds r1, r0, #1
	strh r1, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08158CBE
	movs r0, #0
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0xe]
	ldrh r1, [r4, #0x1e]
	adds r0, r0, r1
	strh r0, [r4, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r4, r2]
	bl KeepPanInRange
	strh r0, [r4, #0x1e]
_08158CBE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08158CC4: .4byte 0x03005B60
	thumb_func_end sub_08158C44

	thumb_func_start sub_08158CC8
sub_08158CC8: @ 0x08158CC8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08158D0C
	ldr r0, _08158CFC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08158D04
	ldr r0, _08158D00
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r4, [r0]
	b _08158DB2
	.align 2, 0
_08158CFC: .4byte 0x020380BE
_08158D00: .4byte 0x02039BD4
_08158D04:
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _08158DB2
_08158D0C:
	ldr r0, _08158D20
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #0
	bne _08158D28
	ldr r0, _08158D24
	ldrb r4, [r0]
	b _08158D4E
	.align 2, 0
_08158D20: .4byte 0x020380BE
_08158D24: .4byte 0x020380D6
_08158D28:
	cmp r1, #1
	bne _08158D38
	ldr r0, _08158D34
	ldrb r4, [r0]
	b _08158D4E
	.align 2, 0
_08158D34: .4byte 0x020380D7
_08158D38:
	cmp r1, #2
	bne _08158D44
	ldr r0, _08158D40
	b _08158D46
	.align 2, 0
_08158D40: .4byte 0x020380D6
_08158D44:
	ldr r0, _08158D70
_08158D46:
	ldrb r1, [r0]
	movs r0, #2
	adds r4, r0, #0
	eors r4, r1
_08158D4E:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #1
	beq _08158D5A
	cmp r0, #3
	bne _08158D74
_08158D5A:
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08158D74
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _08158DC8
	.align 2, 0
_08158D70: .4byte 0x020380D7
_08158D74:
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08158D98
	ldr r1, _08158D90
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08158D94
	b _08158DA6
	.align 2, 0
_08158D90: .4byte 0x02023D12
_08158D94: .4byte 0x020243E8
_08158D98:
	ldr r1, _08158DD0
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08158DD4
_08158DA6:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08158DB2:
	cmp r4, #0
	beq _08158DC2
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	movs r2, #3
	bl PlayCry3
_08158DC2:
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08158DC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08158DD0: .4byte 0x02023D12
_08158DD4: .4byte 0x02024190
	thumb_func_end sub_08158CC8

	thumb_func_start sub_08158DD8
sub_08158DD8: @ 0x08158DD8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08158E1C
	ldr r0, _08158E0C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08158E14
	ldr r0, _08158E10
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r4, [r0]
	b _08158EC2
	.align 2, 0
_08158E0C: .4byte 0x020380BE
_08158E10: .4byte 0x02039BD4
_08158E14:
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	b _08158EC2
_08158E1C:
	ldr r0, _08158E30
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #0
	bne _08158E38
	ldr r0, _08158E34
	ldrb r4, [r0]
	b _08158E5E
	.align 2, 0
_08158E30: .4byte 0x020380BE
_08158E34: .4byte 0x020380D6
_08158E38:
	cmp r1, #1
	bne _08158E48
	ldr r0, _08158E44
	ldrb r4, [r0]
	b _08158E5E
	.align 2, 0
_08158E44: .4byte 0x020380D7
_08158E48:
	cmp r1, #2
	bne _08158E54
	ldr r0, _08158E50
	b _08158E56
	.align 2, 0
_08158E50: .4byte 0x020380D6
_08158E54:
	ldr r0, _08158E80
_08158E56:
	ldrb r1, [r0]
	movs r0, #2
	adds r4, r0, #0
	eors r4, r1
_08158E5E:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #1
	beq _08158E6A
	cmp r0, #3
	bne _08158E84
_08158E6A:
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08158E84
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	b _08158F2A
	.align 2, 0
_08158E80: .4byte 0x020380D7
_08158E84:
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08158EA8
	ldr r1, _08158EA0
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08158EA4
	b _08158EB6
	.align 2, 0
_08158EA0: .4byte 0x02023D12
_08158EA4: .4byte 0x020243E8
_08158EA8:
	ldr r1, _08158EF4
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08158EF8
_08158EB6:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08158EC2:
	ldr r1, _08158EFC
	lsls r2, r6, #2
	adds r0, r2, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, _08158F00
	ldrh r1, [r3, #2]
	strh r1, [r0, #8]
	strh r4, [r0, #0xa]
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0, #0xc]
	adds r5, r2, #0
	cmp r4, #0
	beq _08158F24
	movs r2, #2
	ldrsh r0, [r3, r2]
	cmp r0, #0xff
	bne _08158F04
	adds r0, r4, #0
	movs r2, #9
	bl PlayCry3
	b _08158F0C
	.align 2, 0
_08158EF4: .4byte 0x02023D12
_08158EF8: .4byte 0x02024190
_08158EFC: .4byte 0x03005B60
_08158F00: .4byte 0x020380BE
_08158F04:
	adds r0, r4, #0
	movs r2, #7
	bl PlayCry3
_08158F0C:
	ldr r0, _08158F1C
	adds r1, r5, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08158F20
	str r0, [r1]
	b _08158F2A
	.align 2, 0
_08158F1C: .4byte 0x03005B60
_08158F20: .4byte 0x08158F31
_08158F24:
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_08158F2A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08158DD8

	thumb_func_start sub_08158F30
sub_08158F30: @ 0x08158F30
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	ldr r1, _08158F60
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r6, [r1, #0xa]
	mov r8, r6
	ldrb r5, [r1, #0xc]
	adds r7, r5, #0
	ldrh r2, [r1, #0x1a]
	movs r3, #0x1a
	ldrsh r0, [r1, r3]
	cmp r0, #1
	bgt _08158F64
	adds r0, r2, #1
	strh r0, [r1, #0x1a]
	b _08158FA6
	.align 2, 0
_08158F60: .4byte 0x03005B60
_08158F64:
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	bne _08158F8A
	bl IsCryPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08158FA6
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r0, r6, #0
	movs r2, #0xa
	bl PlayCry3
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _08158FA6
_08158F8A:
	bl IsCryPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08158FA6
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	mov r0, r8
	movs r2, #8
	bl PlayCry3
	mov r0, sb
	bl DestroyAnimVisualTask
_08158FA6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08158F30

	thumb_func_start sub_08158FB4
sub_08158FB4: @ 0x08158FB4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	ldr r1, _08158FD8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #0x1a]
	movs r3, #0x1a
	ldrsh r0, [r1, r3]
	cmp r0, #1
	bgt _08158FDC
	adds r0, r2, #1
	strh r0, [r1, #0x1a]
	b _08158FEC
	.align 2, 0
_08158FD8: .4byte 0x03005B60
_08158FDC:
	bl IsCryPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08158FEC
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08158FEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08158FB4

	thumb_func_start sub_08158FF4
sub_08158FF4: @ 0x08158FF4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08159028
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0815902C
	ldrh r1, [r1]
	strh r1, [r0, #0x1c]
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08159034
	ldr r0, _08159030
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	b _0815903E
	.align 2, 0
_08159028: .4byte 0x03005B60
_0815902C: .4byte 0x020380BE
_08159030: .4byte 0x02039BD4
_08159034:
	ldr r1, _0815905C
	ldr r0, _08159060
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
_0815903E:
	ldrh r2, [r0]
	ldr r0, _08159064
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r2, [r1, #0xa]
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0xc]
	cmp r2, #0
	beq _0815906C
	ldr r0, _08159068
	str r0, [r1]
	b _08159072
	.align 2, 0
_0815905C: .4byte 0x020380D8
_08159060: .4byte 0x020380D6
_08159064: .4byte 0x03005B60
_08159068: .4byte 0x08159079
_0815906C:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08159072:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08158FF4

	thumb_func_start sub_08159078
sub_08159078: @ 0x08159078
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _081590A8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r6, [r0, #0xa]
	mov r8, r6
	ldrb r3, [r0, #0xc]
	adds r5, r3, #0
	movs r7, #0x1a
	ldrsh r2, [r0, r7]
	mov ip, r1
	cmp r2, #5
	bhi _08159118
	lsls r0, r2, #2
	ldr r1, _081590AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081590A8: .4byte 0x03005B60
_081590AC: .4byte 0x081590B0
_081590B0: @ jump table
	.4byte _081590FE @ case 0
	.4byte _081590E4 @ case 1
	.4byte _081590C8 @ case 2
	.4byte _081590E4 @ case 3
	.4byte _081590E4 @ case 4
	.4byte _081590F4 @ case 5
_081590C8:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	mov r0, r8
	movs r2, #4
	bl PlayCry6
	ldr r1, _081590E0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	b _081590EC
	.align 2, 0
_081590E0: .4byte 0x03005B60
_081590E4:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	add r0, ip
_081590EC:
	ldrh r1, [r0, #0x1a]
	adds r1, #1
	strh r1, [r0, #0x1a]
	b _08159140
_081590F4:
	bl IsCryPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08159140
_081590FE:
	bl StopCryAndClearCrySongs
	ldr r0, _08159114
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x1a]
	adds r0, #1
	strh r0, [r1, #0x1a]
	b _08159140
	.align 2, 0
_08159114: .4byte 0x03005B60
_08159118:
	movs r1, #0x1c
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0815912E
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	adds r0, r6, #0
	movs r2, #6
	bl PlayCry6
	b _0815913A
_0815912E:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	mov r0, r8
	movs r2, #6
	bl PlayCry3
_0815913A:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08159140:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08159078

	thumb_func_start sub_0815914C
sub_0815914C: @ 0x0815914C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0815917C
	ldrh r5, [r0]
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl PlaySE1WithPanning
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815917C: .4byte 0x020380BE
	thumb_func_end sub_0815914C

	thumb_func_start sub_08159180
sub_08159180: @ 0x08159180
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081591B0
	ldrh r5, [r0]
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl PlaySE2WithPanning
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081591B0: .4byte 0x020380BE
	thumb_func_end sub_08159180

	thumb_func_start sub_081591B4
sub_081591B4: @ 0x081591B4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08159238
	ldrb r5, [r0, #2]
	ldrb r6, [r0, #4]
	ldrh r1, [r0, #6]
	mov sb, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl BattleAnimAdjustPanning
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r0, r5, #0
	bl BattleAnimAdjustPanning
	adds r5, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CalculatePanIncrement
	ldr r2, _0815923C
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	strh r4, [r1, #0xa]
	strh r5, [r1, #0xc]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0xe]
	mov r0, sb
	strh r0, [r1, #0x12]
	strh r2, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	ldr r2, _08159240
	str r2, [r1]
	mov r0, r8
	bl _call_via_r2
	pop {r3, r4}
	thumb_func_end sub_081591B4

	thumb_func_start sub_0815922C
sub_0815922C: @ 0x0815922C
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08159238: .4byte 0x020380BE
_0815923C: .4byte 0x03005B60
_08159240: .4byte 0x08159245
	thumb_func_end sub_0815922C

	thumb_func_start sub_08159244
sub_08159244: @ 0x08159244
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _0815929C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r2, [r4, #0xe]
	ldrh r0, [r4, #0x1c]
	adds r1, r0, #1
	strh r1, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0815927E
	movs r0, #0
	strh r0, [r4, #0x1c]
	ldrh r1, [r4, #0x1e]
	adds r0, r2, r1
	strh r0, [r4, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r4, r2]
	bl KeepPanInRange
	strh r0, [r4, #0x1e]
_0815927E:
	ldr r1, _081592A0
	ldrh r0, [r4, #0x1e]
	strb r0, [r1]
	movs r3, #0x1e
	ldrsh r1, [r4, r3]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08159296
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08159296:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815929C: .4byte 0x03005B60
_081592A0: .4byte 0x020380E0
	thumb_func_end sub_08159244

