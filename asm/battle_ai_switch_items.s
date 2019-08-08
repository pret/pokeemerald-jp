.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ShouldSwitchIfPerishSong
ShouldSwitchIfPerishSong: @ 0x080627DC
	push {lr}
	ldr r1, _08062824
	ldr r0, _08062828
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08062834
	ldr r0, _0806282C
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0xf]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bne _08062834
	ldr r0, _08062830
	ldr r0, [r0]
	adds r0, r2, r0
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #6
	strb r1, [r0]
	movs r0, #1
	movs r1, #2
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	movs r0, #1
	b _08062836
	.align 2, 0
_08062824: .4byte 0x02023F50
_08062828: .4byte 0x02023D08
_0806282C: .4byte 0x02023F60
_08062830: .4byte 0x02024140
_08062834:
	movs r0, #0
_08062836:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldSwitchIfPerishSong

	thumb_func_start ShouldSwitchIfWonderGuard
ShouldSwitchIfWonderGuard: @ 0x0806283C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080628F4
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08062856
	b _08062A10
_08062856:
	ldr r0, _080628F8
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r4, _080628FC
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x58
	muls r0, r1, r0
	adds r0, r0, r4
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x19
	beq _08062882
	b _08062A10
_08062882:
	mov r0, sl
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r6, #0
	mov r8, r4
	movs r7, #0x58
	adds r0, r2, #0
	muls r0, r7, r0
	adds r4, r0, r4
	movs r0, #0x20
	adds r0, r0, r4
	mov sb, r0
_0806289E:
	lsls r1, r6, #1
	ldr r5, _080628F8
	ldrb r0, [r5]
	muls r0, r7, r0
	adds r1, r1, r0
	mov r0, r8
	adds r0, #0xc
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080628CC
	ldrh r1, [r4]
	mov r3, sb
	ldrb r2, [r3]
	bl AI_TypeCalc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080628CC
	b _08062A10
_080628CC:
	adds r6, #1
	cmp r6, #3
	ble _0806289E
	ldr r0, _080628F4
	ldr r0, [r0]
	ldr r1, _08062900
	ands r0, r1
	cmp r0, #0
	beq _08062934
	ldrb r1, [r5]
	movs r0, #2
	ands r0, r1
	adds r1, r5, #0
	cmp r0, #0
	bne _08062904
	movs r4, #0
	movs r0, #3
	str r0, [sp]
	b _0806293C
	.align 2, 0
_080628F4: .4byte 0x02022C90
_080628F8: .4byte 0x02023D08
_080628FC: .4byte 0x02023D28
_08062900: .4byte 0x00808000
_08062904:
	movs r4, #3
	movs r3, #6
	str r3, [sp]
	b _0806293C
_0806290C:
	ldr r0, _0806292C
	ldrb r0, [r0]
	ldr r1, _08062930
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r0, r1
	strb r6, [r0]
	movs r0, #1
	movs r1, #2
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	movs r0, #1
	b _08062A12
	.align 2, 0
_0806292C: .4byte 0x02023D08
_08062930: .4byte 0x02024140
_08062934:
	movs r4, #0
	movs r3, #6
	str r3, [sp]
	adds r1, r5, #0
_0806293C:
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _08062A24
	mov sb, r1
	cmp r0, #0
	bne _08062950
	ldr r3, _08062A28
	mov sb, r3
_08062950:
	adds r6, r4, #0
	ldr r0, [sp]
	cmp r6, r0
	bge _08062A10
_08062958:
	movs r0, #0x64
	adds r5, r6, #0
	muls r5, r0, r5
	mov r1, sb
	adds r4, r1, r5
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _08062A08
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _08062A08
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _08062A08
	ldr r1, _08062A2C
	ldr r0, _08062A30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _08062A08
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	adds r0, r4, #0
	movs r1, #0x2e
	bl GetMonData
	mov r0, sl
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r4, #0
	mov r8, r5
	ldr r1, _08062A34
	movs r0, #0x58
	muls r0, r2, r0
	adds r5, r0, r1
	adds r7, r5, #0
	adds r7, #0x20
_080629C4:
	adds r1, r4, #0
	adds r1, #0xd
	mov r0, sb
	add r0, r8
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08062A02
	ldrh r1, [r5]
	ldrb r2, [r7]
	bl AI_TypeCalc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08062A02
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0806290C
_08062A02:
	adds r4, #1
	cmp r4, #3
	ble _080629C4
_08062A08:
	adds r6, #1
	ldr r3, [sp]
	cmp r6, r3
	blt _08062958
_08062A10:
	movs r0, #0
_08062A12:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062A24: .4byte 0x020243E8
_08062A28: .4byte 0x02024190
_08062A2C: .4byte 0x02023D12
_08062A30: .4byte 0x02023D08
_08062A34: .4byte 0x02023D28
	thumb_func_end ShouldSwitchIfWonderGuard

	thumb_func_start FindMonThatAbsorbsOpponentsMove
FindMonThatAbsorbsOpponentsMove: @ 0x08062A38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #1
	bl HasSuperEffectiveMoveAgainstOpponents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08062A66
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08062A66
	b _08062C90
_08062A66:
	ldr r1, _08062ACC
	ldr r5, _08062AD0
	ldrb r3, [r5]
	lsls r0, r3, #1
	adds r4, r0, r1
	ldrh r1, [r4]
	cmp r1, #0
	bne _08062A78
	b _08062C90
_08062A78:
	ldr r0, _08062AD4
	cmp r1, r0
	bne _08062A80
	b _08062C90
_08062A80:
	ldr r2, _08062AD8
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08062A94
	b _08062C90
_08062A94:
	ldr r0, _08062ADC
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08062AFE
	mov r8, r3
	mov r0, r8
	bl GetBattlerPosition
	movs r4, #2
	eors r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	ldr r1, _08062AE0
	ldrb r1, [r1]
	ldr r2, _08062AE4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08062AE8
	ldrb r7, [r5]
	b _08062B02
	.align 2, 0
_08062ACC: .4byte 0x02023EF4
_08062AD0: .4byte 0x02023D08
_08062AD4: .4byte 0x0000FFFF
_08062AD8: .4byte 0x082ED220
_08062ADC: .4byte 0x02022C90
_08062AE0: .4byte 0x02023EB4
_08062AE4: .4byte 0x082FACB4
_08062AE8:
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08062B02
_08062AFE:
	adds r7, r3, #0
	mov r8, r7
_08062B02:
	ldr r3, _08062B24
	ldr r1, _08062B28
	ldr r2, _08062B2C
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	cmp r0, #0xa
	bne _08062B30
	movs r0, #0x12
	b _08062B42
	.align 2, 0
_08062B24: .4byte 0x082ED220
_08062B28: .4byte 0x02023EF4
_08062B2C: .4byte 0x02023D08
_08062B30:
	cmp r0, #0xb
	bne _08062B3A
	movs r1, #0xb
	str r1, [sp]
	b _08062B44
_08062B3A:
	cmp r0, #0xd
	beq _08062B40
	b _08062C90
_08062B40:
	movs r0, #0xa
_08062B42:
	str r0, [sp]
_08062B44:
	ldr r1, _08062B74
	ldrb r3, [r2]
	movs r0, #0x58
	muls r0, r3, r0
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	ldr r1, [sp]
	cmp r0, r1
	bne _08062B5A
	b _08062C90
_08062B5A:
	ldr r0, _08062B78
	ldr r0, [r0]
	ldr r1, _08062B7C
	ands r0, r1
	cmp r0, #0
	beq _08062BB0
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	bne _08062B80
	movs r4, #0
	movs r0, #3
	b _08062BB4
	.align 2, 0
_08062B74: .4byte 0x02023D28
_08062B78: .4byte 0x02022C90
_08062B7C: .4byte 0x00808000
_08062B80:
	movs r4, #3
	movs r1, #6
	mov sl, r1
	b _08062BB6
_08062B88:
	ldr r0, _08062BA8
	ldrb r0, [r0]
	ldr r1, _08062BAC
	ldr r1, [r1]
	adds r0, r0, r1
	movs r2, #0xa5
	lsls r2, r2, #2
	adds r0, r0, r2
	strb r5, [r0]
	movs r0, #1
	movs r1, #2
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	movs r0, #1
	b _08062C92
	.align 2, 0
_08062BA8: .4byte 0x02023D08
_08062BAC: .4byte 0x02024140
_08062BB0:
	movs r4, #0
	movs r0, #6
_08062BB4:
	mov sl, r0
_08062BB6:
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _08062C58
	str r1, [sp, #4]
	cmp r0, #0
	bne _08062BCA
	ldr r2, _08062C5C
	str r2, [sp, #4]
_08062BCA:
	adds r5, r4, #0
	cmp r5, sl
	bge _08062C90
	ldr r0, _08062C60
	mov sb, r0
_08062BD4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, [sp, #4]
	adds r6, r1, r0
	adds r0, r6, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _08062C8A
	adds r0, r6, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _08062C8A
	adds r0, r6, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _08062C8A
	ldr r1, _08062C64
	mov r2, r8
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _08062C8A
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _08062C8A
	ldr r0, _08062C68
	ldr r1, [r0]
	adds r0, r2, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r5, r0
	beq _08062C8A
	adds r0, r7, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r5, r0
	beq _08062C8A
	adds r0, r6, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r6, #0
	movs r1, #0x2e
	bl GetMonData
	cmp r0, #0
	beq _08062C6C
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0, #0x17]
	b _08062C76
	.align 2, 0
_08062C58: .4byte 0x020243E8
_08062C5C: .4byte 0x02024190
_08062C60: .4byte 0x082F0D54
_08062C64: .4byte 0x02023D12
_08062C68: .4byte 0x02024140
_08062C6C:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0, #0x16]
_08062C76:
	ldr r1, [sp]
	cmp r1, r0
	bne _08062C8A
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08062C8A
	b _08062B88
_08062C8A:
	adds r5, #1
	cmp r5, sl
	blt _08062BD4
_08062C90:
	movs r0, #0
_08062C92:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FindMonThatAbsorbsOpponentsMove

	thumb_func_start ShouldSwitchIfNaturalCure
ShouldSwitchIfNaturalCure: @ 0x08062CA4
	push {r4, r5, lr}
	ldr r3, _08062CFC
	ldr r5, _08062D00
	ldrb r4, [r5]
	movs r0, #0x58
	adds r2, r4, #0
	muls r2, r0, r2
	adds r0, r3, #0
	adds r0, #0x4c
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08062D6C
	adds r1, r2, r3
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _08062D6C
	ldrh r0, [r1, #0x2c]
	ldrh r1, [r1, #0x28]
	lsrs r0, r0, #1
	cmp r1, r0
	blo _08062D6C
	ldr r1, _08062D04
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _08062CEA
	ldr r0, _08062D08
	cmp r1, r0
	bne _08062D0C
_08062CEA:
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08062D0C
	ldrb r0, [r5]
	b _08062D74
	.align 2, 0
_08062CFC: .4byte 0x02023D28
_08062D00: .4byte 0x02023D08
_08062D04: .4byte 0x02023EF4
_08062D08: .4byte 0x0000FFFF
_08062D0C:
	ldr r2, _08062D38
	ldr r1, _08062D3C
	ldr r4, _08062D40
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08062D44
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08062D44
	ldrb r0, [r4]
	b _08062D74
	.align 2, 0
_08062D38: .4byte 0x082ED220
_08062D3C: .4byte 0x02023EF4
_08062D40: .4byte 0x02023D08
_08062D44:
	movs r0, #8
	movs r1, #1
	bl FindMonWithFlagsAndSuperEffective
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08062D8E
	movs r0, #4
	movs r1, #1
	bl FindMonWithFlagsAndSuperEffective
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08062D8E
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08062D70
_08062D6C:
	movs r0, #0
	b _08062D90
_08062D70:
	ldr r0, _08062D98
	ldrb r0, [r0]
_08062D74:
	ldr r1, _08062D9C
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #6
	strb r1, [r0]
	movs r0, #1
	movs r1, #2
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
_08062D8E:
	movs r0, #1
_08062D90:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062D98: .4byte 0x02023D08
_08062D9C: .4byte 0x02024140
	thumb_func_end ShouldSwitchIfNaturalCure

	thumb_func_start HasSuperEffectiveMoveAgainstOpponents
HasSuperEffectiveMoveAgainstOpponents: @ 0x08062DA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08062E48
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08062E4C
	ldrb r1, [r0]
	ldr r2, _08062E50
	lsls r0, r3, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08062E3A
	movs r4, #0
	ldr r6, _08062E54
	movs r7, #0x58
	adds r0, r3, #0
	muls r0, r7, r0
	adds r5, r0, r6
	movs r0, #0x20
	adds r0, r0, r5
	mov r8, r0
_08062DEE:
	lsls r1, r4, #1
	ldr r0, _08062E48
	ldrb r0, [r0]
	muls r0, r7, r0
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0xc
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08062E34
	ldrh r1, [r5]
	mov r3, r8
	ldrb r2, [r3]
	bl AI_TypeCalc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08062E34
	mov r0, sb
	cmp r0, #0
	bne _08062E5C
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08062E5C
_08062E34:
	adds r4, #1
	cmp r4, #3
	ble _08062DEE
_08062E3A:
	ldr r0, _08062E58
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08062E60
	b _08062EDE
	.align 2, 0
_08062E48: .4byte 0x02023D08
_08062E4C: .4byte 0x02023EB4
_08062E50: .4byte 0x082FACB4
_08062E54: .4byte 0x02023D28
_08062E58: .4byte 0x02022C90
_08062E5C:
	movs r0, #1
	b _08062EE0
_08062E60:
	movs r1, #2
	mov r0, sl
	eors r0, r1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08062EF0
	ldrb r1, [r0]
	ldr r2, _08062EF4
	lsls r0, r3, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08062EDE
	movs r4, #0
	ldr r6, _08062EF8
	movs r7, #0x58
	adds r0, r3, #0
	muls r0, r7, r0
	adds r5, r0, r6
	movs r3, #0x20
	adds r3, r3, r5
	mov r8, r3
_08062E92:
	lsls r1, r4, #1
	ldr r0, _08062EFC
	ldrb r0, [r0]
	muls r0, r7, r0
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0xc
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08062ED8
	ldrh r1, [r5]
	mov r3, r8
	ldrb r2, [r3]
	bl AI_TypeCalc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08062ED8
	mov r0, sb
	cmp r0, #0
	bne _08062E5C
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08062E5C
_08062ED8:
	adds r4, #1
	cmp r4, #3
	ble _08062E92
_08062EDE:
	movs r0, #0
_08062EE0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062EF0: .4byte 0x02023EB4
_08062EF4: .4byte 0x082FACB4
_08062EF8: .4byte 0x02023D28
_08062EFC: .4byte 0x02023D08
	thumb_func_end HasSuperEffectiveMoveAgainstOpponents

	thumb_func_start AreStatsRaised
AreStatsRaised: @ 0x08062F00
	push {r4, lr}
	movs r4, #0
	ldr r1, _08062F40
	ldr r0, _08062F44
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x18
	adds r2, r0, r1
	movs r3, #7
_08062F14:
	ldrb r1, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #6
	ble _08062F2A
	subs r1, #6
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08062F2A:
	adds r2, #1
	subs r3, #1
	cmp r3, #0
	bge _08062F14
	movs r0, #0
	cmp r4, #3
	bls _08062F3A
	movs r0, #1
_08062F3A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062F40: .4byte 0x02023D28
_08062F44: .4byte 0x02023D08
	thumb_func_end AreStatsRaised

	thumb_func_start FindMonWithFlagsAndSuperEffective
FindMonWithFlagsAndSuperEffective: @ 0x08062F48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	ldr r2, _08062FD8
	ldr r1, _08062FDC
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r4, r0, r2
	ldrh r2, [r4]
	adds r5, r1, #0
	cmp r2, #0
	bne _08062F74
	b _080631D2
_08062F74:
	ldr r0, _08062FE0
	cmp r2, r0
	bne _08062F7C
	b _080631D2
_08062F7C:
	ldr r0, _08062FE4
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08062F88
	b _080631D2
_08062F88:
	ldr r2, _08062FE8
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08062F9C
	b _080631D2
_08062F9C:
	ldr r0, _08062FEC
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08063010
	mov sb, r3
	mov r0, sb
	bl GetBattlerPosition
	movs r4, #2
	eors r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	ldr r1, _08062FF0
	ldrb r1, [r1]
	ldr r2, _08062FF4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08062FF8
	ldrb r5, [r5]
	mov sl, r5
	b _08063014
	.align 2, 0
_08062FD8: .4byte 0x02023EF4
_08062FDC: .4byte 0x02023D08
_08062FE0: .4byte 0x0000FFFF
_08062FE4: .4byte 0x02023F14
_08062FE8: .4byte 0x082ED220
_08062FEC: .4byte 0x02022C90
_08062FF0: .4byte 0x02023EB4
_08062FF4: .4byte 0x082FACB4
_08062FF8:
	ldrb r0, [r5]
	bl GetBattlerPosition
	eors r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	b _08063014
_08063010:
	mov sb, r3
	mov sl, sb
_08063014:
	ldr r0, _08063038
	ldr r0, [r0]
	ldr r1, _0806303C
	ands r0, r1
	cmp r0, #0
	beq _08063074
	ldr r2, _08063040
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	bne _08063044
	movs r4, #0
	movs r0, #3
	str r0, [sp, #8]
	b _0806307C
	.align 2, 0
_08063038: .4byte 0x02022C90
_0806303C: .4byte 0x00808000
_08063040: .4byte 0x02023D08
_08063044:
	movs r4, #3
	movs r1, #6
	str r1, [sp, #8]
	b _0806307C
_0806304C:
	ldr r0, _0806306C
	ldrb r0, [r0]
	ldr r1, _08063070
	ldr r1, [r1]
	adds r0, r0, r1
	movs r2, #0xa5
	lsls r2, r2, #2
	adds r0, r0, r2
	strb r6, [r0]
	movs r0, #1
	movs r1, #2
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	movs r0, #1
	b _080631D4
	.align 2, 0
_0806306C: .4byte 0x02023D08
_08063070: .4byte 0x02024140
_08063074:
	movs r4, #0
	movs r0, #6
	str r0, [sp, #8]
	ldr r5, _08063094
_0806307C:
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _08063098
	str r1, [sp, #0xc]
	cmp r0, #0
	bne _08063090
	ldr r2, _0806309C
	str r2, [sp, #0xc]
_08063090:
	adds r6, r4, #0
	b _080631CA
	.align 2, 0
_08063094: .4byte 0x02023D08
_08063098: .4byte 0x020243E8
_0806309C: .4byte 0x02024190
_080630A0:
	movs r0, #0x64
	muls r0, r6, r0
	ldr r1, [sp, #0xc]
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _080630B6
	b _080631C8
_080630B6:
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	bne _080630C4
	b _080631C8
_080630C4:
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _080631C8
	ldr r1, _08063130
	mov r2, sb
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _080631C8
	mov r2, sl
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _080631C8
	ldr r0, _08063134
	ldr r1, [r0]
	mov r2, sb
	adds r0, r2, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r6, r0
	beq _080631C8
	mov r2, sl
	adds r0, r2, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r6, r0
	beq _080631C8
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	movs r1, #0x2e
	bl GetMonData
	cmp r0, #0
	beq _0806313C
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _08063138
	adds r0, r0, r1
	ldrb r2, [r0, #0x17]
	b _08063148
	.align 2, 0
_08063130: .4byte 0x02023D12
_08063134: .4byte 0x02024140
_08063138: .4byte 0x082F0D54
_0806313C:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r2, _080631E4
	adds r0, r0, r2
	ldrb r2, [r0, #0x16]
_08063148:
	ldr r1, _080631E8
	ldr r5, _080631EC
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r4, #0
	bl AI_TypeCalc
	ldr r1, [sp]
	ands r1, r0
	cmp r1, #0
	beq _080631C8
	ldr r1, _080631F0
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	movs r4, #0
	movs r0, #0x64
	adds r1, r6, #0
	muls r1, r0, r1
	mov r8, r1
	ldr r1, _080631F4
	movs r0, #0x58
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r5, r0, r1
	adds r7, r5, #0
	adds r7, #0x20
_08063186:
	adds r1, r4, #0
	adds r1, #0xd
	ldr r0, [sp, #0xc]
	add r0, r8
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080631C2
	ldrh r1, [r5]
	ldrb r2, [r7]
	bl AI_TypeCalc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080631C2
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #4]
	bl __modsi3
	cmp r0, #0
	bne _080631C2
	b _0806304C
_080631C2:
	adds r4, #1
	cmp r4, #3
	ble _08063186
_080631C8:
	adds r6, #1
_080631CA:
	ldr r0, [sp, #8]
	cmp r6, r0
	bge _080631D2
	b _080630A0
_080631D2:
	movs r0, #0
_080631D4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080631E4: .4byte 0x082F0D54
_080631E8: .4byte 0x02023EF4
_080631EC: .4byte 0x02023D08
_080631F0: .4byte 0x02023F14
_080631F4: .4byte 0x02023D28
	thumb_func_end FindMonWithFlagsAndSuperEffective

	thumb_func_start ShouldSwitch
ShouldSwitch: @ 0x080631F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r6, _080632E0
	ldr r4, _080632E4
	ldrb r2, [r4]
	movs r5, #0x58
	adds r0, r2, #0
	muls r0, r5, r0
	adds r1, r6, #0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080632E8
	ands r0, r1
	cmp r0, #0
	beq _08063222
	b _08063450
_08063222:
	ldr r0, _080632EC
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	beq _08063236
	b _08063450
_08063236:
	str r1, [sp]
	movs r0, #0xc
	adds r1, r2, #0
	movs r2, #0x17
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0806324E
	b _08063450
_0806324E:
	ldrb r1, [r4]
	str r0, [sp]
	movs r0, #0xc
	movs r2, #0x47
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08063266
	b _08063450
_08063266:
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0x2a
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08063298
	ldrb r0, [r4]
	muls r0, r5, r0
	adds r1, r0, r6
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #8
	bne _0806328C
	b _08063450
_0806328C:
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #8
	bne _08063298
	b _08063450
_08063298:
	ldr r0, _080632F0
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080632A8
	b _08063450
_080632A8:
	movs r0, #0
	mov sl, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08063312
	ldrb r7, [r4]
	adds r0, r7, #0
	bl GetBattlerPosition
	movs r5, #2
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	ldr r1, _080632F4
	ldrb r1, [r1]
	ldr r2, _080632F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080632FC
	ldrb r6, [r4]
	b _08063316
	.align 2, 0
_080632E0: .4byte 0x02023D28
_080632E4: .4byte 0x02023D08
_080632E8: .4byte 0x0400E000
_080632EC: .4byte 0x02023F50
_080632F0: .4byte 0x02022C90
_080632F4: .4byte 0x02023EB4
_080632F8: .4byte 0x082FACB4
_080632FC:
	ldrb r0, [r4]
	bl GetBattlerPosition
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _08063316
_08063312:
	ldrb r6, [r4]
	adds r7, r6, #0
_08063316:
	ldr r0, _08063338
	ldr r0, [r0]
	ldr r1, _0806333C
	ands r0, r1
	cmp r0, #0
	beq _0806334C
	ldr r2, _08063340
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08063344
	movs r4, #0
	movs r1, #3
	mov r8, r1
	b _08063354
	.align 2, 0
_08063338: .4byte 0x02022C90
_0806333C: .4byte 0x00808000
_08063340: .4byte 0x02023D08
_08063344:
	movs r4, #3
	movs r0, #6
	mov r8, r0
	b _08063354
_0806334C:
	movs r4, #0
	movs r1, #6
	mov r8, r1
	ldr r2, _0806343C
_08063354:
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _08063440
	mov sb, r1
	cmp r0, #0
	bne _08063368
	ldr r0, _08063444
	mov sb, r0
_08063368:
	adds r5, r4, #0
	cmp r5, r8
	bge _080633D6
_0806336E:
	movs r0, #0x64
	muls r0, r5, r0
	mov r1, sb
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080633D0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _080633D0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _080633D0
	ldr r1, _08063448
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _080633D0
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _080633D0
	ldr r0, _0806344C
	ldr r1, [r0]
	adds r0, r7, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r5, r0
	beq _080633D0
	adds r0, r6, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r5, r0
	beq _080633D0
	movs r0, #1
	add sl, r0
_080633D0:
	adds r5, #1
	cmp r5, r8
	blt _0806336E
_080633D6:
	mov r1, sl
	cmp r1, #0
	beq _08063450
	bl ShouldSwitchIfPerishSong
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063436
	bl ShouldSwitchIfWonderGuard
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063436
	bl FindMonThatAbsorbsOpponentsMove
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063436
	bl ShouldSwitchIfNaturalCure
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063436
	movs r0, #0
	bl HasSuperEffectiveMoveAgainstOpponents
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063450
	bl AreStatsRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063450
	movs r0, #8
	movs r1, #2
	bl FindMonWithFlagsAndSuperEffective
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063436
	movs r0, #4
	movs r1, #3
	bl FindMonWithFlagsAndSuperEffective
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08063450
_08063436:
	movs r0, #1
	b _08063452
	.align 2, 0
_0806343C: .4byte 0x02023D08
_08063440: .4byte 0x020243E8
_08063444: .4byte 0x02024190
_08063448: .4byte 0x02023D12
_0806344C: .4byte 0x02024140
_08063450:
	movs r0, #0
_08063452:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldSwitch

	thumb_func_start AI_TrySwitchOrUseItem
AI_TrySwitchOrUseItem: @ 0x08063464
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _080634E0
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, r6, #0
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r1, _080634E4
	mov r8, r1
	cmp r0, #0
	bne _0806348C
	ldr r2, _080634E8
	mov r8, r2
_0806348C:
	ldr r7, _080634EC
	ldr r0, [r7]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0806349A
	b _080635CA
_0806349A:
	bl ShouldSwitch
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080634A6
	b _080635C0
_080634A6:
	ldrb r0, [r4]
	ldr r2, _080634F0
	ldr r1, [r2]
	adds r0, r0, r1
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #6
	bne _0806359C
	bl GetMostSuitableMonToSwitchInto
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bne _0806358A
	ldr r0, [r7]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080634F4
	adds r0, r6, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	b _0806350C
	.align 2, 0
_080634E0: .4byte 0x02023D08
_080634E4: .4byte 0x020243E8
_080634E8: .4byte 0x02024190
_080634EC: .4byte 0x02022C90
_080634F0: .4byte 0x02024140
_080634F4:
	adds r0, r5, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #2
	eors r5, r0
	adds r0, r5, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0806350C:
	ldr r0, _0806352C
	ldr r0, [r0]
	ldr r1, _08063530
	ands r0, r1
	cmp r0, #0
	beq _0806353C
	ldr r0, _08063534
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08063538
	movs r0, #0
	movs r7, #3
	b _08063540
	.align 2, 0
_0806352C: .4byte 0x02022C90
_08063530: .4byte 0x00808000
_08063534: .4byte 0x02023D08
_08063538:
	movs r0, #3
	b _0806353E
_0806353C:
	movs r0, #0
_0806353E:
	movs r7, #6
_08063540:
	adds r4, r0, #0
	cmp r4, r7
	bge _0806358A
_08063546:
	movs r0, #0x64
	muls r0, r4, r0
	add r0, r8
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _08063584
	ldr r1, _080635B4
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _08063584
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _08063584
	ldr r0, _080635B8
	ldr r1, [r0]
	adds r0, r6, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r4, r0
	beq _08063584
	adds r0, r5, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r4, r0
	bne _0806358A
_08063584:
	adds r4, #1
	cmp r4, r7
	blt _08063546
_0806358A:
	ldr r0, _080635BC
	ldrb r0, [r0]
	ldr r2, _080635B8
	ldr r1, [r2]
	adds r0, r0, r1
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r0, r1
	strb r4, [r0]
_0806359C:
	ldr r0, _080635BC
	ldrb r1, [r0]
	ldr r0, [r2]
	adds r0, r1, r0
	adds r1, r0, #0
	adds r1, #0x5c
	movs r2, #0xa5
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	b _080635DC
	.align 2, 0
_080635B4: .4byte 0x02023D12
_080635B8: .4byte 0x02024140
_080635BC: .4byte 0x02023D08
_080635C0:
	bl ShouldUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080635DC
_080635CA:
	ldr r0, _080635E8
	ldrb r0, [r0]
	movs r2, #1
	eors r2, r0
	lsls r2, r2, #8
	movs r0, #1
	movs r1, #0
	bl BtlController_EmitTwoReturnValues
_080635DC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080635E8: .4byte 0x02023D08
	thumb_func_end AI_TrySwitchOrUseItem

	thumb_func_start ModulateByTypeEffectiveness
ModulateByTypeEffectiveness: @ 0x080635EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r7, #0
	ldr r0, _08063670
	mov sl, r0
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0806365E
	mov r5, sl
_0806361A:
	ldrb r0, [r5]
	cmp r0, #0xfe
	beq _08063650
	ldr r1, [sp]
	cmp r0, r1
	bne _08063650
	ldrb r4, [r5, #1]
	cmp r4, sb
	bne _0806363A
	ldrb r1, [r6]
	ldrb r0, [r5, #2]
	muls r0, r1, r0
	movs r1, #0xa
	bl __divsi3
	strb r0, [r6]
_0806363A:
	cmp r4, r8
	bne _08063650
	cmp sb, r8
	beq _08063650
	ldrb r1, [r6]
	ldrb r0, [r5, #2]
	muls r0, r1, r0
	movs r1, #0xa
	bl __divsi3
	strb r0, [r6]
_08063650:
	adds r5, #3
	adds r7, #3
	mov r1, sl
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0806361A
_0806365E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063670: .4byte 0x082EBB38
	thumb_func_end ModulateByTypeEffectiveness

	thumb_func_start GetMostSuitableMonToSwitchInto
GetMostSuitableMonToSwitchInto: @ 0x08063674
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r4, _080636B4
	ldrb r2, [r4]
	ldr r0, _080636B8
	ldr r0, [r0]
	adds r0, r2, r0
	adds r1, r0, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	cmp r0, #6
	beq _08063696
	b _08063A34
_08063696:
	ldr r0, _080636BC
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080636C4
	ldr r1, _080636C0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08063A34
	.align 2, 0
_080636B4: .4byte 0x02023D08
_080636B8: .4byte 0x02024140
_080636BC: .4byte 0x02022C90
_080636C0: .4byte 0x02023D12
_080636C4:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08063750
	str r2, [sp, #0x10]
	adds r0, r2, #0
	bl GetBattlerPosition
	movs r5, #2
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	ldr r1, _080636FC
	ldrb r1, [r1]
	ldr r2, _08063700
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08063704
	ldrb r4, [r4]
	str r4, [sp, #0x14]
	b _0806371A
	.align 2, 0
_080636FC: .4byte 0x02023EB4
_08063700: .4byte 0x082FACB4
_08063704:
	ldrb r0, [r4]
	bl GetBattlerPosition
	eors r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
_0806371A:
	bl Random
	movs r3, #2
	ands r0, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, _08063748
	ldrb r1, [r0]
	ldr r2, _0806374C
	ldr r4, [sp, #4]
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0806376E
	eors r4, r3
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	b _0806376E
	.align 2, 0
_08063748: .4byte 0x02023EB4
_0806374C: .4byte 0x082FACB4
_08063750:
	adds r0, r2, #0
	bl GetBattlerPosition
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrb r4, [r4]
	str r4, [sp, #0x14]
	str r4, [sp, #0x10]
_0806376E:
	ldr r0, _08063790
	ldr r0, [r0]
	ldr r1, _08063794
	ands r0, r1
	cmp r0, #0
	beq _080637A6
	ldr r2, _08063798
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0806379C
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #3
	str r1, [sp, #0x1c]
	b _080637B0
	.align 2, 0
_08063790: .4byte 0x02022C90
_08063794: .4byte 0x00808000
_08063798: .4byte 0x02023D08
_0806379C:
	movs r4, #3
	str r4, [sp, #0x18]
	movs r0, #6
	str r0, [sp, #0x1c]
	b _080637B0
_080637A6:
	movs r1, #0
	str r1, [sp, #0x18]
	movs r2, #6
	str r2, [sp, #0x1c]
	ldr r2, _0806389C
_080637B0:
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r4, _080638A0
	str r4, [sp, #0x20]
	cmp r0, #0
	bne _080637C4
	ldr r0, _080638A4
	str r0, [sp, #0x20]
_080637C4:
	movs r1, #0
	mov sb, r1
_080637C8:
	movs r2, #0
	str r2, [sp, #8]
	movs r4, #6
	str r4, [sp, #0xc]
	ldr r7, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	cmp r7, r0
	blt _080637DA
	b _080638D6
_080637DA:
	lsls r0, r7, #2
	ldr r1, _080638A8
	adds r0, r0, r1
	mov r8, r0
	mov sl, sp
_080637E4:
	movs r0, #0x64
	muls r0, r7, r0
	ldr r2, [sp, #0x20]
	adds r4, r2, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080638BC
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _080638BC
	mov r4, r8
	ldr r0, [r4]
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	bne _080638BC
	ldr r1, _080638AC
	ldr r2, [sp, #0x10]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _080638BC
	ldr r4, [sp, #0x14]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _080638BC
	ldr r0, _080638B0
	ldr r1, [r0]
	adds r0, r2, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r7, r0
	beq _080638BC
	adds r0, r4, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r7, r0
	beq _080638BC
	ldr r1, _080638B4
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r5, [r0, #6]
	ldrb r6, [r0, #7]
	movs r0, #0xa
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x58
	ldr r2, [sp, #4]
	adds r4, r2, #0
	muls r4, r0, r4
	ldr r0, _080638B8
	adds r4, r4, r0
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, sp
	bl ModulateByTypeEffectiveness
	adds r4, #0x22
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, sp
	bl ModulateByTypeEffectiveness
	ldr r2, [sp, #8]
	mov r1, sl
	ldrb r1, [r1]
	cmp r2, r1
	bhs _080638CA
	mov r2, sl
	ldrb r2, [r2]
	str r2, [sp, #8]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	b _080638CA
	.align 2, 0
_0806389C: .4byte 0x02023D08
_080638A0: .4byte 0x020243E8
_080638A4: .4byte 0x02024190
_080638A8: .4byte 0x082FACB4
_080638AC: .4byte 0x02023D12
_080638B0: .4byte 0x02024140
_080638B4: .4byte 0x082F0D54
_080638B8: .4byte 0x02023D28
_080638BC:
	mov r4, r8
	ldr r0, [r4]
	mov r1, sb
	orrs r1, r0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_080638CA:
	movs r2, #4
	add r8, r2
	adds r7, #1
	ldr r4, [sp, #0x1c]
	cmp r7, r4
	blt _080637E4
_080638D6:
	ldr r0, [sp, #0xc]
	cmp r0, #6
	beq _08063938
	movs r7, #0
	movs r0, #0x64
	ldr r1, [sp, #0xc]
	adds r5, r1, #0
	muls r5, r0, r5
_080638E6:
	adds r1, r7, #0
	adds r1, #0xd
	ldr r2, [sp, #0x20]
	adds r0, r2, r5
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0806390E
	ldr r0, _08063930
	ldrb r1, [r0]
	adds r0, r4, #0
	ldr r2, [sp, #4]
	bl TypeCalc
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne _08063914
_0806390E:
	adds r7, #1
	cmp r7, #3
	ble _080638E6
_08063914:
	cmp r7, #4
	beq _0806391A
	b _08063A32
_0806391A:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #2
	ldr r1, _08063934
	adds r0, r0, r1
	ldr r0, [r0]
	mov r2, sb
	orrs r2, r0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _0806393C
	.align 2, 0
_08063930: .4byte 0x02023D08
_08063934: .4byte 0x082FACB4
_08063938:
	movs r4, #0x3f
	mov sb, r4
_0806393C:
	mov r0, sb
	cmp r0, #0x3f
	beq _08063944
	b _080637C8
_08063944:
	ldr r0, _08063A44
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08063A48
	ldr r0, [r0]
	strb r1, [r0, #0x13]
	ldr r0, _08063A4C
	movs r2, #1
	strb r2, [r0, #0xe]
	ldr r0, _08063A50
	strb r1, [r0]
	ldr r0, _08063A54
	strb r2, [r0]
	movs r1, #0
	str r1, [sp, #8]
	movs r2, #6
	str r2, [sp, #0xc]
	ldr r7, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	cmp r7, r4
	bge _08063A32
_0806396E:
	movs r0, #0x64
	adds r6, r7, #0
	muls r6, r0, r6
	ldr r0, [sp, #0x20]
	adds r4, r0, r6
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	adds r1, r7, #1
	mov sl, r1
	cmp r0, #0
	beq _08063A2A
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _08063A2A
	ldr r1, _08063A58
	ldr r2, [sp, #0x10]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _08063A2A
	ldr r4, [sp, #0x14]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _08063A2A
	ldr r0, _08063A48
	ldr r1, [r0]
	adds r0, r2, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r7, r0
	beq _08063A2A
	adds r0, r4, r1
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r7, r0
	beq _08063A2A
	movs r5, #0
	mov sb, r6
	ldr r0, _08063A5C
	mov r8, r0
	ldr r6, _08063A60
_080639D2:
	adds r1, r5, #0
	adds r1, #0xd
	ldr r0, [sp, #0x20]
	add r0, sb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0
	mov r1, r8
	str r0, [r1]
	cmp r4, #0
	beq _08063A0E
	ldr r0, _08063A64
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	cmp r0, #1
	beq _08063A0E
	ldrb r0, [r6]
	ldr r1, [sp, #4]
	bl AI_CalcDmg
	ldrb r1, [r6]
	adds r0, r4, #0
	ldr r2, [sp, #4]
	bl TypeCalc
_08063A0E:
	mov r2, r8
	ldr r0, [r2]
	ldr r4, [sp, #8]
	cmp r4, r0
	bge _08063A24
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
_08063A24:
	adds r5, #1
	cmp r5, #3
	ble _080639D2
_08063A2A:
	mov r7, sl
	ldr r0, [sp, #0x1c]
	cmp r7, r0
	blt _0806396E
_08063A32:
	ldr r0, [sp, #0xc]
_08063A34:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08063A44: .4byte 0x020240A4
_08063A48: .4byte 0x02024140
_08063A4C: .4byte 0x02024118
_08063A50: .4byte 0x02023F20
_08063A54: .4byte 0x02023EB5
_08063A58: .4byte 0x02023D12
_08063A5C: .4byte 0x02023E94
_08063A60: .4byte 0x02023D08
_08063A64: .4byte 0x082ED220
	thumb_func_end GetMostSuitableMonToSwitchInto

	thumb_func_start GetAI_ItemType
GetAI_ItemType: @ 0x08063A68
	push {r4, lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bne _08063A78
	movs r0, #1
	b _08063ABE
_08063A78:
	ldrb r1, [r2, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08063A86
	movs r0, #2
	b _08063ABE
_08063A86:
	ldrb r4, [r2, #3]
	movs r3, #0x3f
	adds r0, r3, #0
	ands r0, r4
	cmp r0, #0
	beq _08063A96
	movs r0, #3
	b _08063ABE
_08063A96:
	ldrb r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08063AAC
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _08063AAC
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08063AB0
_08063AAC:
	movs r0, #4
	b _08063ABE
_08063AB0:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	bne _08063ABC
	movs r0, #6
	b _08063ABE
_08063ABC:
	movs r0, #5
_08063ABE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetAI_ItemType

	thumb_func_start ShouldUseItem
ShouldUseItem: @ 0x08063AC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	mov sl, r0
	movs r7, #0
	ldr r0, _08063BAC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08063AF6
	ldr r0, _08063BB0
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08063AF6
	b _08063F60
_08063AF6:
	ldr r0, _08063BB0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r5, _08063BB4
	cmp r0, #0
	bne _08063B08
	ldr r5, _08063BB8
_08063B08:
	movs r1, #0
	mov r8, r1
_08063B0C:
	movs r0, #0x64
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _08063B48
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0
	beq _08063B48
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _08063B48
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_08063B48:
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #5
	ble _08063B0C
	movs r2, #0
	mov r8, r2
_08063B56:
	ldr r1, _08063BBC
	mov r0, r8
	cmp r0, #0
	beq _08063B72
	ldr r0, [r1]
	ldr r0, [r0, #0x18]
	adds r0, #0x50
	ldrb r0, [r0]
	mov r2, r8
	subs r0, r0, r2
	adds r0, #1
	cmp sl, r0
	ble _08063B72
	b _08063F54
_08063B72:
	ldr r0, [r1]
	ldr r0, [r0, #0x18]
	mov r2, r8
	lsls r1, r2, #1
	adds r0, #0x48
	adds r0, r0, r1
	ldrh r0, [r0]
	mov sb, r0
	str r1, [sp]
	cmp r0, #0
	bne _08063B8A
	b _08063F54
_08063B8A:
	ldr r1, _08063BC0
	subs r0, #0xd
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	bne _08063B9A
	b _08063F54
_08063B9A:
	mov r0, sb
	cmp r0, #0xaf
	bne _08063BCC
	ldr r0, _08063BC4
	ldr r0, [r0]
	ldr r1, _08063BC8
	adds r5, r0, r1
	b _08063BCE
	.align 2, 0
_08063BAC: .4byte 0x02022C90
_08063BB0: .4byte 0x02023D08
_08063BB4: .4byte 0x020243E8
_08063BB8: .4byte 0x02024190
_08063BBC: .4byte 0x0202414C
_08063BC0: .4byte 0x082EEF14
_08063BC4: .4byte 0x03005AEC
_08063BC8: .4byte 0x00003214
_08063BCC:
	adds r5, r1, #0
_08063BCE:
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAI_ItemType
	ldr r4, _08063C08
	ldrb r1, [r4]
	lsrs r1, r1, #1
	ldr r3, _08063C0C
	ldr r2, [r3]
	adds r1, r1, r2
	adds r1, #0xc4
	strb r0, [r1]
	ldrb r0, [r4]
	lsrs r0, r0, #1
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0xc4
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #5
	bls _08063BFE
	b _08063F08
_08063BFE:
	lsls r0, r0, #2
	ldr r1, _08063C10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08063C08: .4byte 0x02023D08
_08063C0C: .4byte 0x02024140
_08063C10: .4byte 0x08063C14
_08063C14: @ jump table
	.4byte _08063C2C @ case 0
	.4byte _08063C58 @ case 1
	.4byte _08063CA0 @ case 2
	.4byte _08063DF8 @ case 3
	.4byte _08063ED8 @ case 4
	.4byte _08063F60 @ case 5
_08063C2C:
	ldr r2, _08063C50
	ldr r0, _08063C54
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #0x2c]
	ldrh r0, [r0, #0x28]
	lsrs r1, r1, #2
	cmp r0, r1
	blo _08063C44
	b _08063F08
_08063C44:
	cmp r0, #0
	bne _08063C4A
	b _08063F08
_08063C4A:
	movs r7, #1
	b _08063F0C
	.align 2, 0
_08063C50: .4byte 0x02023D28
_08063C54: .4byte 0x02023D08
_08063C58:
	mov r0, sb
	movs r1, #4
	movs r2, #4
	bl GetItemEffectParamOffset
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08063C6C
	b _08063F08
_08063C6C:
	ldr r2, _08063C98
	ldr r0, _08063C9C
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r1, r0, r2
	ldrh r2, [r1, #0x28]
	cmp r2, #0
	bne _08063C80
	b _08063F08
_08063C80:
	ldrh r3, [r1, #0x2c]
	lsrs r0, r3, #2
	cmp r2, r0
	blo _08063C4A
	adds r0, r2, #0
	subs r0, r3, r0
	adds r1, r5, r4
	ldrb r1, [r1]
	cmp r0, r1
	bgt _08063C96
	b _08063F08
_08063C96:
	b _08063C4A
	.align 2, 0
_08063C98: .4byte 0x02023D28
_08063C9C: .4byte 0x02023D08
_08063CA0:
	ldr r3, _08063DEC
	ldrb r0, [r3]
	lsrs r0, r0, #1
	ldr r2, _08063DF0
	ldr r1, [r2]
	adds r0, r0, r1
	adds r0, #0xc6
	movs r1, #0
	strb r1, [r0]
	ldrb r1, [r5, #3]
	movs r6, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08063CE4
	ldr r1, _08063DF4
	ldrb r4, [r3]
	movs r0, #0x58
	muls r0, r4, r0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08063CE4
	lsrs r1, r4, #1
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0xc6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, #1
_08063CE4:
	ldrb r1, [r5, #3]
	movs r6, #0x10
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08063D1E
	ldr r1, _08063DF4
	ldrb r4, [r3]
	movs r0, #0x58
	muls r0, r4, r0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08063D0E
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08063D1E
_08063D0E:
	lsrs r1, r4, #1
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0xc6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, #1
_08063D1E:
	ldrb r1, [r5, #3]
	movs r6, #8
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08063D50
	ldr r1, _08063DF4
	ldrb r4, [r3]
	movs r0, #0x58
	muls r0, r4, r0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08063D50
	lsrs r1, r4, #1
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0xc6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, #1
_08063D50:
	ldrb r1, [r5, #3]
	movs r6, #4
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08063D82
	ldr r1, _08063DF4
	ldrb r4, [r3]
	movs r0, #0x58
	muls r0, r4, r0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08063D82
	lsrs r1, r4, #1
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0xc6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, #1
_08063D82:
	ldrb r1, [r5, #3]
	movs r6, #2
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08063DB4
	ldr r1, _08063DF4
	ldrb r4, [r3]
	movs r0, #0x58
	muls r0, r4, r0
	adds r1, #0x4c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08063DB4
	lsrs r1, r4, #1
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0xc6
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r7, #1
_08063DB4:
	ldrb r1, [r5, #3]
	movs r4, #1
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08063DC2
	b _08063F08
_08063DC2:
	ldr r1, _08063DF4
	ldrb r3, [r3]
	movs r0, #0x58
	muls r0, r3, r0
	adds r1, #0x50
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _08063DDA
	b _08063F08
_08063DDA:
	lsrs r1, r3, #1
	ldr r0, [r2]
	adds r1, r1, r0
	adds r1, #0xc6
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	b _08063C4A
	.align 2, 0
_08063DEC: .4byte 0x02023D08
_08063DF0: .4byte 0x02024140
_08063DF4: .4byte 0x02023D28
_08063DF8:
	ldr r4, _08063ECC
	ldrb r0, [r4]
	lsrs r0, r0, #1
	ldr r3, _08063ED0
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0xc6
	movs r1, #0
	strb r1, [r0]
	ldr r1, _08063ED4
	ldrb r2, [r4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	beq _08063F08
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08063E38
	lsrs r2, r2, #1
	ldr r0, [r3]
	adds r2, r2, r0
	adds r2, #0xc6
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_08063E38:
	ldrb r1, [r5, #1]
	movs r7, #0xf0
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08063E56
	ldrb r0, [r4]
	lsrs r0, r0, #1
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0xc6
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
_08063E56:
	ldrb r1, [r5, #1]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08063E72
	ldrb r0, [r4]
	lsrs r0, r0, #1
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0xc6
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_08063E72:
	ldrb r1, [r5, #2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08063E8E
	ldrb r0, [r4]
	lsrs r0, r0, #1
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0xc6
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0]
_08063E8E:
	ldrb r1, [r5, #2]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08063EAA
	ldrb r0, [r4]
	lsrs r0, r0, #1
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0xc6
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0]
_08063EAA:
	ldrb r1, [r5]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08063EB6
	b _08063C4A
_08063EB6:
	ldrb r0, [r4]
	lsrs r0, r0, #1
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0xc6
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	b _08063C4A
	.align 2, 0
_08063ECC: .4byte 0x02023D08
_08063ED0: .4byte 0x02024140
_08063ED4: .4byte 0x02023F60
_08063ED8:
	ldr r4, _08063F40
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _08063F44
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	beq _08063F08
	ldr r0, _08063F48
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	cmp r0, #0
	bne _08063F08
	b _08063C4A
_08063F08:
	cmp r7, #0
	beq _08063F54
_08063F0C:
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	ldr r0, _08063F40
	ldrb r0, [r0]
	lsrs r0, r0, #1
	ldr r1, _08063F4C
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, #0xc0
	mov r1, sb
	strb r1, [r0]
	ldr r0, _08063F50
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	adds r0, #0x48
	ldr r2, [sp]
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0]
	adds r0, r7, #0
	b _08063F62
	.align 2, 0
_08063F40: .4byte 0x02023D08
_08063F44: .4byte 0x02023F60
_08063F48: .4byte 0x02023F38
_08063F4C: .4byte 0x02024140
_08063F50: .4byte 0x0202414C
_08063F54:
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #3
	bgt _08063F60
	b _08063B56
_08063F60:
	movs r0, #0
_08063F62:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldUseItem

