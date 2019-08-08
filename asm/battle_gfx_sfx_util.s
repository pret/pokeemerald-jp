.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AllocateBattleSpritesData
AllocateBattleSpritesData: @ 0x0805CD34
	push {r4, lr}
	ldr r4, _0805CD70
	movs r0, #0x10
	bl AllocZeroed
	str r0, [r4]
	movs r0, #0x10
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1]
	movs r0, #0x30
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #4]
	movs r0, #0x10
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #8]
	movs r0, #0x50
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CD70: .4byte 0x02024174
	thumb_func_end AllocateBattleSpritesData

	thumb_func_start FreeBattleSpritesData
FreeBattleSpritesData: @ 0x0805CD74
	push {r4, r5, lr}
	ldr r5, _0805CDB4
	ldr r0, [r5]
	cmp r0, #0
	beq _0805CDAE
	ldr r0, [r0, #0xc]
	bl Free
	ldr r0, [r5]
	movs r4, #0
	str r4, [r0, #0xc]
	ldr r0, [r0, #8]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #8]
	ldr r0, [r0, #4]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #4]
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	str r4, [r0]
	bl Free
	str r4, [r5]
_0805CDAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CDB4: .4byte 0x02024174
	thumb_func_end FreeBattleSpritesData

	thumb_func_start ChooseMoveAndTargetInBattlePalace
ChooseMoveAndTargetInBattlePalace: @ 0x0805CDB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	ldr r4, _0805CE18
	ldrb r0, [r4]
	lsls r2, r0, #9
	ldr r1, _0805CE1C
	adds r2, r2, r1
	mov sl, r2
	movs r1, #0
	movs r2, #0xff
	bl CheckMoveLimitations
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0805CE20
	ldr r0, [r0]
	adds r0, #0x92
	ldrb r1, [r0]
	ldr r2, _0805CE24
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r4, r0, #0x1f
	movs r0, #2
	ands r4, r0
	adds r6, r4, #0
	adds r5, r4, #2
	b _0805CE2A
	.align 2, 0
_0805CE18: .4byte 0x02023D08
_0805CE1C: .4byte 0x02022D0C
_0805CE20: .4byte 0x02024140
_0805CE24: .4byte 0x082FACB4
_0805CE28:
	adds r4, #1
_0805CE2A:
	cmp r4, r5
	bge _0805CE50
	ldr r0, _0805CF8C
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	ldr r1, _0805CF90
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetNatureFromPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r4, r0
	ldr r2, _0805CF94
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r7
	ble _0805CE28
_0805CE50:
	subs r7, r4, r6
	cmp r4, r5
	bne _0805CE58
	movs r7, #2
_0805CE58:
	movs r6, #0
	movs r4, #0
	mov r1, sl
	ldrh r0, [r1]
	cmp r0, #0
	beq _0805CE98
	mov r5, sl
_0805CE66:
	ldrh r0, [r5]
	bl sub_0805D0C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	bne _0805CE8A
	mov r0, sl
	adds r0, #8
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805CE8A
	ldr r0, _0805CF98
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	orrs r6, r0
_0805CE8A:
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	bgt _0805CE98
	ldrh r0, [r5]
	cmp r0, #0
	bne _0805CE66
_0805CE98:
	cmp r6, #0
	beq _0805CEC8
	ldr r3, _0805CF9C
	ldr r1, [r3]
	adds r1, #0x92
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, #0x92
	lsls r0, r6, #4
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl BattleAI_SetupAIData
	bl BattleAI_ChooseMoveOrAction
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0805CEC8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	beq _0805CED2
	b _0805D028
_0805CED2:
	mov r2, r8
	cmp r2, #0xf
	bne _0805CEDA
	b _0805D006
_0805CEDA:
	movs r5, #0
	movs r6, #0
	ldr r7, _0805CF98
	mov r4, sl
_0805CEE2:
	ldrh r0, [r4]
	bl sub_0805D0C4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805CEFA
	ldr r0, [r7]
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _0805CEFA
	adds r5, #1
_0805CEFA:
	ldrh r0, [r4]
	bl sub_0805D0C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805CF14
	ldr r0, [r7]
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	bne _0805CF14
	adds r5, #0x10
_0805CF14:
	ldrh r0, [r4]
	bl sub_0805D0C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0805CF32
	ldr r0, [r7]
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _0805CF32
	movs r2, #0x80
	lsls r2, r2, #1
	adds r5, r5, r2
_0805CF32:
	adds r7, #4
	adds r4, #2
	ldr r0, _0805CF98
	adds r0, #0xc
	cmp r7, r0
	ble _0805CEE2
	movs r1, #0xf
	ands r1, r5
	cmp r1, #1
	ble _0805CF48
	adds r6, #1
_0805CF48:
	movs r0, #0xf0
	ands r0, r5
	cmp r0, #0x1f
	ble _0805CF52
	adds r6, #1
_0805CF52:
	ldr r2, _0805CFA0
	cmp r0, r2
	ble _0805CF5A
	adds r6, #1
_0805CF5A:
	cmp r6, #1
	bgt _0805CF62
	cmp r6, #0
	bne _0805CFA4
_0805CF62:
	ldr r5, _0805CF98
_0805CF64:
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsrs r4, r1, #0x10
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _0805CF82
	mov sb, r4
_0805CF82:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	beq _0805CF64
	b _0805CFF0
	.align 2, 0
_0805CF8C: .4byte 0x02023D08
_0805CF90: .4byte 0x02023D70
_0805CF94: .4byte 0x082ECE18
_0805CF98: .4byte 0x082FACB4
_0805CF9C: .4byte 0x02024140
_0805CFA0: .4byte 0x000001FF
_0805CFA4:
	cmp r1, #1
	ble _0805CFAA
	movs r6, #0
_0805CFAA:
	cmp r0, #0x1f
	ble _0805CFB0
	movs r6, #1
_0805CFB0:
	cmp r0, r2
	ble _0805CFB6
	movs r6, #2
_0805CFB6:
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsrs r4, r1, #0x10
	ldr r1, _0805D01C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	bne _0805CFE8
	lsls r0, r4, #1
	add r0, sl
	ldrh r0, [r0]
	bl sub_0805D0C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bne _0805CFE8
	mov sb, r4
_0805CFE8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	beq _0805CFB6
_0805CFF0:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bls _0805D028
_0805D006:
	ldr r2, _0805D020
	ldr r0, _0805D024
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, r1, r2
	ldrb r0, [r1, #2]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1, #2]
	movs r0, #0
	b _0805D0B2
	.align 2, 0
_0805D01C: .4byte 0x082FACB4
_0805D020: .4byte 0x02023FE0
_0805D024: .4byte 0x02023D08
_0805D028:
	mov r1, sb
	lsls r0, r1, #1
	mov r2, sl
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, #0xae
	bne _0805D050
	ldrb r0, [r2, #0x12]
	movs r5, #0
	cmp r0, #7
	beq _0805D05E
	ldrb r1, [r2, #0x13]
	movs r0, #7
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r5, r0, #0x1f
	movs r0, #0x10
	ands r5, r0
	b _0805D05E
_0805D050:
	ldr r2, _0805D070
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r5, [r0, #6]
_0805D05E:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0805D078
	ldr r0, _0805D074
	ldrb r0, [r0]
	lsls r0, r0, #8
	b _0805D0A6
	.align 2, 0
_0805D070: .4byte 0x082ED220
_0805D074: .4byte 0x02023D08
_0805D078:
	cmp r5, #0
	bne _0805D08C
	bl BattlePalaceGetTargetRetValue
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sb
	orrs r2, r0
	mov sb, r2
	b _0805D0AC
_0805D08C:
	ldr r0, _0805D0C0
	ldrb r0, [r0]
	bl GetBattlerPosition
	adds r1, r0, #0
	movs r2, #1
	movs r0, #1
	ands r0, r1
	eors r0, r2
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
_0805D0A6:
	mov r1, sb
	orrs r1, r0
	mov sb, r1
_0805D0AC:
	mov r2, sb
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
_0805D0B2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D0C0: .4byte 0x02023D08
	thumb_func_end ChooseMoveAndTargetInBattlePalace

	thumb_func_start sub_0805D0C4
sub_0805D0C4: @ 0x0805D0C4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _0805D0E8
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #6]
	adds r3, r1, #0
	cmp r0, #0x40
	bls _0805D0DE
	b _0805D20A
_0805D0DE:
	lsls r0, r0, #2
	ldr r1, _0805D0EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D0E8: .4byte 0x082ED220
_0805D0EC: .4byte 0x0805D0F0
_0805D0F0: @ jump table
	.4byte _0805D1F4 @ case 0
	.4byte _0805D202 @ case 1
	.4byte _0805D1F4 @ case 2
	.4byte _0805D20A @ case 3
	.4byte _0805D1F4 @ case 4
	.4byte _0805D20A @ case 5
	.4byte _0805D20A @ case 6
	.4byte _0805D20A @ case 7
	.4byte _0805D1F4 @ case 8
	.4byte _0805D20A @ case 9
	.4byte _0805D20A @ case 10
	.4byte _0805D20A @ case 11
	.4byte _0805D20A @ case 12
	.4byte _0805D20A @ case 13
	.4byte _0805D20A @ case 14
	.4byte _0805D20A @ case 15
	.4byte _0805D206 @ case 16
	.4byte _0805D20A @ case 17
	.4byte _0805D20A @ case 18
	.4byte _0805D20A @ case 19
	.4byte _0805D20A @ case 20
	.4byte _0805D20A @ case 21
	.4byte _0805D20A @ case 22
	.4byte _0805D20A @ case 23
	.4byte _0805D20A @ case 24
	.4byte _0805D20A @ case 25
	.4byte _0805D20A @ case 26
	.4byte _0805D20A @ case 27
	.4byte _0805D20A @ case 28
	.4byte _0805D20A @ case 29
	.4byte _0805D20A @ case 30
	.4byte _0805D20A @ case 31
	.4byte _0805D1F4 @ case 32
	.4byte _0805D20A @ case 33
	.4byte _0805D20A @ case 34
	.4byte _0805D20A @ case 35
	.4byte _0805D20A @ case 36
	.4byte _0805D20A @ case 37
	.4byte _0805D20A @ case 38
	.4byte _0805D20A @ case 39
	.4byte _0805D20A @ case 40
	.4byte _0805D20A @ case 41
	.4byte _0805D20A @ case 42
	.4byte _0805D20A @ case 43
	.4byte _0805D20A @ case 44
	.4byte _0805D20A @ case 45
	.4byte _0805D20A @ case 46
	.4byte _0805D20A @ case 47
	.4byte _0805D20A @ case 48
	.4byte _0805D20A @ case 49
	.4byte _0805D20A @ case 50
	.4byte _0805D20A @ case 51
	.4byte _0805D20A @ case 52
	.4byte _0805D20A @ case 53
	.4byte _0805D20A @ case 54
	.4byte _0805D20A @ case 55
	.4byte _0805D20A @ case 56
	.4byte _0805D20A @ case 57
	.4byte _0805D20A @ case 58
	.4byte _0805D20A @ case 59
	.4byte _0805D20A @ case 60
	.4byte _0805D20A @ case 61
	.4byte _0805D20A @ case 62
	.4byte _0805D20A @ case 63
	.4byte _0805D202 @ case 64
_0805D1F4:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0805D20A
_0805D202:
	movs r0, #2
	b _0805D20C
_0805D206:
	movs r0, #1
	b _0805D20C
_0805D20A:
	movs r0, #0
_0805D20C:
	pop {r1}
	bx r1
	thumb_func_end sub_0805D0C4

	thumb_func_start BattlePalaceGetTargetRetValue
BattlePalaceGetTargetRetValue: @ 0x0805D210
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0805D244
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805D316
	ldr r0, _0805D248
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805D24C
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #3
	b _0805D25A
	.align 2, 0
_0805D244: .4byte 0x02022C90
_0805D248: .4byte 0x02023D08
_0805D24C:
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #2
_0805D25A:
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0805D294
	movs r2, #0x58
	mov r0, r8
	muls r0, r2, r0
	adds r5, r0, r1
	adds r0, r7, #0
	muls r0, r2, r0
	adds r6, r0, r1
	ldrh r0, [r5, #0x28]
	ldrh r3, [r6, #0x28]
	cmp r0, r3
	bne _0805D29C
	bl Random
	adds r3, r0, #0
	ldr r0, _0805D298
	ldrb r1, [r0]
	movs r2, #1
	movs r0, #1
	ands r0, r1
	eors r0, r2
	movs r1, #2
	ands r1, r3
	adds r0, r0, r1
	b _0805D31E
	.align 2, 0
_0805D294: .4byte 0x02023D28
_0805D298: .4byte 0x02023D08
_0805D29C:
	ldr r4, _0805D2C8
	ldr r0, _0805D2CC
	mov sb, r0
	ldrb r0, [r0]
	muls r0, r2, r0
	adds r1, #0x48
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetNatureFromPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r4, [r0]
	cmp r4, #1
	beq _0805D2E8
	cmp r4, #1
	bgt _0805D2D0
	cmp r4, #0
	beq _0805D2D6
	b _0805D316
	.align 2, 0
_0805D2C8: .4byte 0x082ECF8C
_0805D2CC: .4byte 0x02023D08
_0805D2D0:
	cmp r4, #2
	beq _0805D2FA
	b _0805D316
_0805D2D6:
	ldrh r0, [r5, #0x28]
	ldrh r6, [r6, #0x28]
	cmp r0, r6
	bls _0805D2E4
	mov r1, r8
	lsls r0, r1, #8
	b _0805D320
_0805D2E4:
	lsls r0, r7, #8
	b _0805D320
_0805D2E8:
	ldrh r0, [r5, #0x28]
	ldrh r6, [r6, #0x28]
	cmp r0, r6
	bhs _0805D2F6
	mov r3, r8
	lsls r0, r3, #8
	b _0805D320
_0805D2F6:
	lsls r0, r7, #8
	b _0805D320
_0805D2FA:
	bl Random
	adds r3, r0, #0
	mov r0, sb
	ldrb r1, [r0]
	movs r2, #1
	movs r0, #1
	ands r0, r1
	eors r0, r2
	ands r4, r3
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	b _0805D320
_0805D316:
	ldr r0, _0805D32C
	ldrb r1, [r0]
	movs r0, #1
	eors r0, r1
_0805D31E:
	lsls r0, r0, #8
_0805D320:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D32C: .4byte 0x02023D08
	thumb_func_end BattlePalaceGetTargetRetValue

	thumb_func_start sub_0805D330
sub_0805D330: @ 0x0805D330
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0805D374
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r3, [r0]
	lsls r0, r3, #0x1a
	cmp r0, #0
	bge _0805D382
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _0805D382
	adds r2, r1, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	lsls r0, r1, #0x19
	cmp r0, #0
	bge _0805D378
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _0805D382
	.align 2, 0
_0805D374: .4byte 0x020205AC
_0805D378:
	lsls r0, r3, #0x1b
	cmp r0, #0
	bge _0805D382
	ldr r0, _0805D388
	str r0, [r4, #0x1c]
_0805D382:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D388: .4byte 0x08007141
	thumb_func_end sub_0805D330

	thumb_func_start sub_0805D38C
sub_0805D38C: @ 0x0805D38C
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	adds r3, r4, #0
	adds r3, #0x2c
	ldrb r0, [r3]
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r3]
	ldr r0, _0805D3B0
	str r0, [r4, #0x1c]
	cmp r1, #0
	bne _0805D3B4
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	b _0805D3BC
	.align 2, 0
_0805D3B0: .4byte 0x08007141
_0805D3B4:
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
_0805D3BC:
	adds r0, r4, #0
	bl AnimateSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0805D38C

	thumb_func_start sub_0805D3C8
sub_0805D3C8: @ 0x0805D3C8
	push {lr}
	adds r2, r0, #0
	ldr r0, _0805D3F4
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805D400
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805D400
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0805D3FC
	ldr r0, _0805D3F8
	b _0805D3FE
	.align 2, 0
_0805D3F4: .4byte 0x020240A0
_0805D3F8: .4byte 0x0805D409
_0805D3FC:
	ldr r0, _0805D404
_0805D3FE:
	str r0, [r2, #0x1c]
_0805D400:
	pop {r0}
	bx r0
	.align 2, 0
_0805D404: .4byte 0x08007141
	thumb_func_end sub_0805D3C8

	thumb_func_start sub_0805D408
sub_0805D408: @ 0x0805D408
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x26]
	subs r0, #2
	strh r0, [r1, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805D41C
	ldr r0, _0805D420
	str r0, [r1, #0x1c]
_0805D41C:
	pop {r0}
	bx r0
	.align 2, 0
_0805D420: .4byte 0x08007141
	thumb_func_end sub_0805D408

	thumb_func_start InitAndLaunchChosenStatusAnimation
InitAndLaunchChosenStatusAnimation: @ 0x0805D424
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	ldr r6, _0805D458
	ldr r1, [r6]
	ldr r5, _0805D45C
	ldrb r2, [r5]
	ldr r3, [r1, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r3, #0x10
	orrs r2, r3
	strb r2, [r1]
	cmp r0, #0
	bne _0805D4A4
	cmp r4, #0x20
	bne _0805D460
	ldrb r0, [r5]
	movs r1, #6
	bl LaunchStatusAnimation
	b _0805D51E
	.align 2, 0
_0805D458: .4byte 0x02024174
_0805D45C: .4byte 0x02023D08
_0805D460:
	cmp r4, #8
	beq _0805D46C
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0805D476
_0805D46C:
	ldrb r0, [r5]
	movs r1, #0
	bl LaunchStatusAnimation
	b _0805D51E
_0805D476:
	cmp r4, #0x10
	bne _0805D484
	ldrb r0, [r5]
	movs r1, #2
	bl LaunchStatusAnimation
	b _0805D51E
_0805D484:
	movs r0, #7
	ands r0, r4
	cmp r0, #0
	beq _0805D496
	ldrb r0, [r5]
	movs r1, #4
	bl LaunchStatusAnimation
	b _0805D51E
_0805D496:
	cmp r4, #0x40
	bne _0805D506
	ldrb r0, [r5]
	movs r1, #5
	bl LaunchStatusAnimation
	b _0805D51E
_0805D4A4:
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r4
	cmp r0, #0
	beq _0805D4B8
	ldrb r0, [r5]
	movs r1, #3
	bl LaunchStatusAnimation
	b _0805D51E
_0805D4B8:
	movs r0, #7
	ands r0, r4
	cmp r0, #0
	beq _0805D4CA
	ldrb r0, [r5]
	movs r1, #1
	bl LaunchStatusAnimation
	b _0805D51E
_0805D4CA:
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r4
	cmp r0, #0
	beq _0805D4DE
	ldrb r0, [r5]
	movs r1, #7
	bl LaunchStatusAnimation
	b _0805D51E
_0805D4DE:
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r4
	cmp r0, #0
	beq _0805D4F2
	ldrb r0, [r5]
	movs r1, #8
	bl LaunchStatusAnimation
	b _0805D51E
_0805D4F2:
	movs r0, #0xe0
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0805D506
	ldrb r0, [r5]
	movs r1, #9
	bl LaunchStatusAnimation
	b _0805D51E
_0805D506:
	ldr r0, [r6]
	ldrb r2, [r5]
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
_0805D51E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end InitAndLaunchChosenStatusAnimation

	thumb_func_start TryHandleLaunchBattleTableAnimation
TryHandleLaunchBattleTableAnimation: @ 0x0805D524
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	cmp r5, #0
	bne _0805D56C
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0805D56C
	ldr r0, _0805D568
	adds r0, r6, r0
	movs r2, #0x7f
	adds r1, r7, #0
	ands r1, r2
	strb r1, [r0]
	movs r0, #1
	b _0805D63A
	.align 2, 0
_0805D568: .4byte 0x02024188
_0805D56C:
	ldr r0, _0805D598
	mov sb, r0
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r4, r6, #2
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r2, #4
	mov r8, r2
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _0805D5E8
	adds r0, r5, #0
	bl ShouldAnimBeDoneRegardlessOfSubsitute
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805D59C
	movs r0, #1
	b _0805D63A
	.align 2, 0
_0805D598: .4byte 0x02024174
_0805D59C:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r1, [r0]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _0805D5E8
	cmp r5, #2
	bne _0805D5E8
	ldr r1, _0805D5E0
	ldr r0, _0805D5E4
	adds r0, r6, r0
	ldrb r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _0805D5E8
	adds r0, r6, #0
	movs r1, #1
	bl LoadBattleMonGfxAndAnimate
	adds r0, r6, #0
	bl ClearBehindSubstituteBit
	movs r0, #1
	b _0805D63A
	.align 2, 0
_0805D5E0: .4byte 0x020205AC
_0805D5E4: .4byte 0x02023E88
_0805D5E8:
	ldr r0, _0805D64C
	mov r2, sl
	strb r2, [r0]
	ldr r0, _0805D650
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r4, _0805D654
	ldr r0, [r4]
	ldr r0, [r0, #8]
	strh r7, [r0]
	ldr r0, _0805D658
	adds r1, r5, #0
	movs r2, #0
	bl LaunchBattleAnimation
	ldr r0, _0805D65C
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0805D660
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r6, [r1, #8]
	ldr r0, [r4]
	movs r2, #8
	ldrsh r1, [r1, r2]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0
_0805D63A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D64C: .4byte 0x020380D6
_0805D650: .4byte 0x020380D7
_0805D654: .4byte 0x02024174
_0805D658: .4byte 0x082778AC
_0805D65C: .4byte 0x0805D665
_0805D660: .4byte 0x03005B60
	thumb_func_end TryHandleLaunchBattleTableAnimation

	thumb_func_start nullsub_23
nullsub_23: @ 0x0805D664
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0805D6AC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0805D6B0
	thumb_func_end nullsub_23

	thumb_func_start Task_ClearBitWhenBattleTableAnimDone
Task_ClearBitWhenBattleTableAnimDone: @ 0x0805D674
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D6A6
	ldr r0, _0805D6B4
	ldr r2, [r0]
	ldr r1, _0805D6B8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	ldr r2, [r2, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl DestroyTask
_0805D6A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D6AC: .4byte 0x02038098
_0805D6B0: .4byte 0x0203809D
_0805D6B4: .4byte 0x02024174
_0805D6B8: .4byte 0x03005B60
	thumb_func_end Task_ClearBitWhenBattleTableAnimDone

	thumb_func_start ShouldAnimBeDoneRegardlessOfSubsitute
ShouldAnimBeDoneRegardlessOfSubsitute: @ 0x0805D6BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd
	bgt _0805D6D0
	cmp r0, #0xa
	bge _0805D6D4
	cmp r0, #2
	beq _0805D6D4
	b _0805D6D8
_0805D6D0:
	cmp r0, #0x11
	bne _0805D6D8
_0805D6D4:
	movs r0, #1
	b _0805D6DA
_0805D6D8:
	movs r0, #0
_0805D6DA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldAnimBeDoneRegardlessOfSubsitute

	thumb_func_start InitAndLaunchSpecialAnimation
InitAndLaunchSpecialAnimation: @ 0x0805D6E0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _0805D738
	strb r1, [r0]
	ldr r0, _0805D73C
	strb r2, [r0]
	ldr r0, _0805D740
	adds r1, r3, #0
	movs r2, #0
	bl LaunchBattleAnimation
	ldr r0, _0805D744
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0805D748
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	ldr r0, _0805D74C
	ldr r0, [r0]
	movs r2, #8
	ldrsh r1, [r1, r2]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D738: .4byte 0x020380D6
_0805D73C: .4byte 0x020380D7
_0805D740: .4byte 0x08277908
_0805D744: .4byte 0x0805D751
_0805D748: .4byte 0x03005B60
_0805D74C: .4byte 0x02024174
	thumb_func_end InitAndLaunchSpecialAnimation

	thumb_func_start nullsub_24
nullsub_24: @ 0x0805D750
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0805D798
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0805D79C
	thumb_func_end nullsub_24

	thumb_func_start Task_ClearBitWhenSpecialAnimDone
Task_ClearBitWhenSpecialAnimDone: @ 0x0805D760
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D792
	ldr r0, _0805D7A0
	ldr r2, [r0]
	ldr r1, _0805D7A4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	ldr r2, [r2, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl DestroyTask
_0805D792:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D798: .4byte 0x02038098
_0805D79C: .4byte 0x0203809D
_0805D7A0: .4byte 0x02024174
_0805D7A4: .4byte 0x03005B60
	thumb_func_end Task_ClearBitWhenSpecialAnimDone

	thumb_func_start IsMoveWithoutAnimation
IsMoveWithoutAnimation: @ 0x0805D7A8
	movs r0, #0
	bx lr
	thumb_func_end IsMoveWithoutAnimation

	thumb_func_start mplay_80342A4
mplay_80342A4: @ 0x0805D7AC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805D7F4
	ldr r2, _0805D7FC
	ldr r0, [r2]
	ldr r1, [r0, #4]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	adds r1, #1
	strb r1, [r0, #8]
	ldr r2, [r2]
	ldr r0, _0805D800
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0x1d
	bls _0805D7F8
	ldr r0, _0805D804
	bl m4aMPlayStop
	ldr r0, _0805D808
	bl m4aMPlayStop
_0805D7F4:
	cmp r5, #0
	beq _0805D80C
_0805D7F8:
	movs r0, #1
	b _0805D81E
	.align 2, 0
_0805D7FC: .4byte 0x02024174
_0805D800: .4byte 0x02023D08
_0805D804: .4byte 0x03007510
_0805D808: .4byte 0x03007550
_0805D80C:
	ldr r0, _0805D824
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r5, [r0, #8]
	movs r0, #0
_0805D81E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D824: .4byte 0x02024174
	thumb_func_end mplay_80342A4

	thumb_func_start BattleLoadOpponentMonSpriteGfx
BattleLoadOpponentMonSpriteGfx: @ 0x0805D828
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r1, #0
	bl GetMonData
	str r0, [sp]
	ldr r0, _0805D868
	ldr r0, [r0]
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, #2
	adds r2, r1, r0
	ldrh r0, [r2, #2]
	cmp r0, #0
	bne _0805D86C
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r6, [sp]
	b _0805D874
	.align 2, 0
_0805D868: .4byte 0x02024174
_0805D86C:
	ldrh r5, [r2, #2]
	ldr r0, _0805D8C8
	adds r0, r1, r0
	ldr r6, [r0]
_0805D874:
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	mov sl, r0
	mov r0, r8
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsls r2, r5, #3
	ldr r1, _0805D8CC
	adds r2, r2, r1
	ldr r1, _0805D8D0
	ldr r1, [r1]
	lsrs r0, r0, #0x16
	adds r1, #4
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	mov r3, r8
	lsls r2, r3, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r2, r0
	ldr r0, _0805D8D4
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldrh r0, [r0, #2]
	str r1, [sp, #4]
	mov sb, r2
	cmp r0, #0
	bne _0805D8D8
	adds r0, r4, #0
	bl GetMonFrontSpritePal
	b _0805D8E2
	.align 2, 0
_0805D8C8: .4byte 0x02024160
_0805D8CC: .4byte 0x082DDA1C
_0805D8D0: .4byte 0x02024178
_0805D8D4: .4byte 0x02024174
_0805D8D8:
	adds r0, r5, #0
	mov r1, sl
	ldr r2, [sp]
	bl GetMonSpritePalFromSpeciesAndPersonality
_0805D8E2:
	adds r6, r0, #0
	ldr r4, _0805D974
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZDecompressVram
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x20
	bl LoadPalette
	mov r1, sb
	adds r1, #0x80
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0805D978
	cmp r5, r0
	bne _0805D936
	movs r7, #0x80
	lsls r7, r7, #1
	add r7, sb
	ldr r5, _0805D97C
	ldr r1, [r5]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	adds r0, r6, #0
	bl LZDecompressVram
	ldr r0, _0805D980
	add r0, r8
	ldrb r1, [r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	ldr r0, [r5]
	adds r0, r0, r1
	adds r1, r7, #0
	movs r2, #0x20
	bl LoadPalette
_0805D936:
	ldr r0, _0805D984
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [sp, #4]
	adds r0, r1, r0
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0805D962
	ldr r3, _0805D988
	adds r0, r7, #0
	movs r1, #0x10
	movs r2, #6
	bl BlendPalette
	lsls r1, r7, #1
	ldr r0, _0805D98C
	adds r0, r1, r0
	ldr r2, _0805D990
	adds r1, r1, r2
	ldr r2, _0805D994
	bl CpuSet
_0805D962:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D974: .4byte 0x0201C000
_0805D978: .4byte 0x00000181
_0805D97C: .4byte 0x02024140
_0805D980: .4byte 0x02024188
_0805D984: .4byte 0x02024174
_0805D988: .4byte 0x00007FFF
_0805D98C: .4byte 0x020377B4
_0805D990: .4byte 0x020373B4
_0805D994: .4byte 0x04000008
	thumb_func_end BattleLoadOpponentMonSpriteGfx

	thumb_func_start BattleLoadPlayerMonSpriteGfx
BattleLoadPlayerMonSpriteGfx: @ 0x0805D998
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r1, #0
	bl GetMonData
	str r0, [sp]
	ldr r0, _0805D9D8
	ldr r0, [r0]
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, #2
	adds r2, r1, r0
	ldrh r0, [r2, #2]
	cmp r0, #0
	bne _0805D9DC
	adds r0, r6, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r4, [sp]
	b _0805D9E4
	.align 2, 0
_0805D9D8: .4byte 0x02024174
_0805D9DC:
	ldrh r5, [r2, #2]
	ldr r0, _0805DA38
	adds r0, r1, r0
	ldr r4, [r0]
_0805D9E4:
	adds r0, r6, #0
	movs r1, #1
	bl GetMonData
	str r0, [sp, #4]
	mov r0, r8
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #1
	mov r1, r8
	bl sub_08068438
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	lsls r1, r1, #2
	mov sl, r1
	cmp r0, #1
	beq _0805DA1C
	ldr r0, _0805DA3C
	ldr r0, [r0]
	ldr r0, [r0]
	add r0, sl
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0805DA48
_0805DA1C:
	lsls r0, r5, #3
	ldr r1, _0805DA40
	adds r0, r0, r1
	ldr r1, _0805DA44
	ldr r1, [r1]
	lsls r2, r7, #2
	adds r1, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r2, r5, #0
	adds r3, r4, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	b _0805DA62
	.align 2, 0
_0805DA38: .4byte 0x02024160
_0805DA3C: .4byte 0x02024174
_0805DA40: .4byte 0x082D6148
_0805DA44: .4byte 0x02024178
_0805DA48:
	lsls r0, r5, #3
	ldr r1, _0805DA84
	adds r0, r0, r1
	ldr r1, _0805DA88
	ldr r1, [r1]
	lsls r2, r7, #2
	adds r1, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r2, r5, #0
	adds r3, r4, #0
	bl HandleLoadSpecialPokePic
_0805DA62:
	mov r2, r8
	lsls r1, r2, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r1, r0
	ldr r0, _0805DA8C
	ldr r0, [r0]
	ldr r0, [r0]
	add r0, sl
	ldrh r0, [r0, #2]
	mov sb, r1
	cmp r0, #0
	bne _0805DA90
	adds r0, r6, #0
	bl GetMonFrontSpritePal
	b _0805DA9A
	.align 2, 0
_0805DA84: .4byte 0x082D6148
_0805DA88: .4byte 0x02024178
_0805DA8C: .4byte 0x02024174
_0805DA90:
	adds r0, r5, #0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl GetMonSpritePalFromSpeciesAndPersonality
_0805DA9A:
	adds r6, r0, #0
	ldr r4, _0805DB28
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZDecompressVram
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x20
	bl LoadPalette
	mov r1, sb
	adds r1, #0x80
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0805DB2C
	cmp r5, r0
	bne _0805DAEE
	movs r7, #0x80
	lsls r7, r7, #1
	add r7, sb
	ldr r5, _0805DB30
	ldr r1, [r5]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	adds r0, r6, #0
	bl LZDecompressVram
	ldr r0, _0805DB34
	add r0, r8
	ldrb r1, [r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	ldr r0, [r5]
	adds r0, r0, r1
	adds r1, r7, #0
	movs r2, #0x20
	bl LoadPalette
_0805DAEE:
	ldr r0, _0805DB38
	ldr r0, [r0]
	ldr r0, [r0]
	add r0, sl
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0805DB18
	ldr r3, _0805DB3C
	adds r0, r7, #0
	movs r1, #0x10
	movs r2, #6
	bl BlendPalette
	lsls r1, r7, #1
	ldr r0, _0805DB40
	adds r0, r1, r0
	ldr r2, _0805DB44
	adds r1, r1, r2
	ldr r2, _0805DB48
	bl CpuSet
_0805DB18:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DB28: .4byte 0x0201C000
_0805DB2C: .4byte 0x00000181
_0805DB30: .4byte 0x02024140
_0805DB34: .4byte 0x02024188
_0805DB38: .4byte 0x02024174
_0805DB3C: .4byte 0x00007FFF
_0805DB40: .4byte 0x020377B4
_0805DB44: .4byte 0x020373B4
_0805DB48: .4byte 0x04000008
	thumb_func_end BattleLoadPlayerMonSpriteGfx

	thumb_func_start nullsub_25
nullsub_25: @ 0x0805DB4C
	bx lr
	.align 2, 0
	thumb_func_end nullsub_25

	thumb_func_start sub_0805DB50
sub_0805DB50: @ 0x0805DB50
	bx lr
	.align 2, 0
	thumb_func_end sub_0805DB50

	thumb_func_start DecompressTrainerFrontPic
DecompressTrainerFrontPic: @ 0x0805DB54
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsls r4, r4, #3
	ldr r2, _0805DB94
	adds r2, r4, r2
	ldr r1, _0805DB98
	ldr r1, [r1]
	lsrs r0, r0, #0x16
	adds r1, #4
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	movs r2, #0
	bl DecompressPicFromTable_2
	ldr r0, _0805DB9C
	adds r4, r4, r0
	adds r0, r4, #0
	bl LoadCompressedSpritePalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DB94: .4byte 0x082D8EE4
_0805DB98: .4byte 0x02024178
_0805DB9C: .4byte 0x082D91CC
	thumb_func_end DecompressTrainerFrontPic

	thumb_func_start DecompressTrainerBackPic
DecompressTrainerBackPic: @ 0x0805DBA0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsls r5, r5, #3
	ldr r2, _0805DBF0
	adds r2, r5, r2
	ldr r1, _0805DBF4
	ldr r1, [r1]
	lsrs r0, r0, #0x16
	adds r1, #4
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	movs r2, #0
	bl DecompressPicFromTable_2
	ldr r0, _0805DBF8
	adds r5, r5, r0
	ldr r0, [r5]
	lsls r4, r4, #0x14
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r4, r4, r1
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	movs r2, #0x20
	bl LoadCompressedPalette
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DBF0: .4byte 0x082D95DC
_0805DBF4: .4byte 0x02024178
_0805DBF8: .4byte 0x082D961C
	thumb_func_end DecompressTrainerBackPic

	thumb_func_start sub_0805DBFC
sub_0805DBFC: @ 0x0805DBFC
	bx lr
	.align 2, 0
	thumb_func_end sub_0805DBFC

	thumb_func_start FreeTrainerFrontPicPalette
FreeTrainerFrontPicPalette: @ 0x0805DC00
	push {lr}
	lsls r0, r0, #0x10
	ldr r1, _0805DC14
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0805DC14: .4byte 0x082D91CC
	thumb_func_end FreeTrainerFrontPicPalette

	thumb_func_start BattleLoadAllHealthBoxesGfxAtOnce
BattleLoadAllHealthBoxesGfxAtOnce: @ 0x0805DC18
	push {r4, r5, r6, r7, lr}
	ldr r4, _0805DC44
	adds r0, r4, #0
	bl LoadSpritePalette
	adds r4, #8
	adds r0, r4, #0
	bl LoadSpritePalette
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805DC50
	ldr r0, _0805DC48
	bl LoadCompressedSpriteSheet
	ldr r0, _0805DC4C
	bl LoadCompressedSpriteSheet
	movs r5, #2
	b _0805DC72
	.align 2, 0
_0805DC44: .4byte 0x082FCB20
_0805DC48: .4byte 0x082FCAC8
_0805DC4C: .4byte 0x082FCAD0
_0805DC50:
	ldr r4, _0805DC98
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	adds r4, #8
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	ldr r4, _0805DC9C
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	adds r4, #8
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	movs r5, #4
_0805DC72:
	movs r4, #0
	cmp r4, r5
	bhs _0805DC92
	ldr r7, _0805DCA0
	ldr r6, _0805DCA4
_0805DC7C:
	adds r0, r4, r7
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r6
	bl LoadCompressedSpriteSheet
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _0805DC7C
_0805DC92:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DC98: .4byte 0x082FCAD8
_0805DC9C: .4byte 0x082FCAE8
_0805DCA0: .4byte 0x02023D1A
_0805DCA4: .4byte 0x082FCB00
	thumb_func_end BattleLoadAllHealthBoxesGfxAtOnce

	thumb_func_start BattleLoadAllHealthBoxesGfx
BattleLoadAllHealthBoxesGfx: @ 0x0805DCA8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	movs r6, #0
	cmp r4, #0
	bne _0805DCB8
	b _0805DDCA
_0805DCB8:
	cmp r4, #1
	bne _0805DCD4
	ldr r4, _0805DCD0
	adds r0, r4, #0
	bl LoadSpritePalette
	adds r4, #8
	adds r0, r4, #0
	bl LoadSpritePalette
	b _0805DDCA
	.align 2, 0
_0805DCD0: .4byte 0x082FCB20
_0805DCD4:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805DD3C
	cmp r4, #2
	bne _0805DD0C
	ldr r0, _0805DCF8
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805DD00
	ldr r0, _0805DCFC
	bl LoadCompressedSpriteSheet
	b _0805DDCA
	.align 2, 0
_0805DCF8: .4byte 0x02022C90
_0805DCFC: .4byte 0x082FCAF8
_0805DD00:
	ldr r0, _0805DD08
	bl LoadCompressedSpriteSheet
	b _0805DDCA
	.align 2, 0
_0805DD08: .4byte 0x082FCAC8
_0805DD0C:
	cmp r4, #3
	bne _0805DD1C
	ldr r0, _0805DD18
	bl LoadCompressedSpriteSheet
	b _0805DDCA
	.align 2, 0
_0805DD18: .4byte 0x082FCAD0
_0805DD1C:
	cmp r4, #4
	bne _0805DD2C
	ldr r0, _0805DD28
	ldrb r0, [r0]
	b _0805DDB4
	.align 2, 0
_0805DD28: .4byte 0x02023D1A
_0805DD2C:
	cmp r4, #5
	bne _0805DDC8
	ldr r0, _0805DD38
	ldrb r0, [r0, #1]
	b _0805DDB4
	.align 2, 0
_0805DD38: .4byte 0x02023D1A
_0805DD3C:
	cmp r4, #2
	bne _0805DD4C
	ldr r0, _0805DD48
	bl LoadCompressedSpriteSheet
	b _0805DDCA
	.align 2, 0
_0805DD48: .4byte 0x082FCAD8
_0805DD4C:
	cmp r4, #3
	bne _0805DD5C
	ldr r0, _0805DD58
	bl LoadCompressedSpriteSheet
	b _0805DDCA
	.align 2, 0
_0805DD58: .4byte 0x082FCAE0
_0805DD5C:
	cmp r4, #4
	bne _0805DD6C
	ldr r0, _0805DD68
	bl LoadCompressedSpriteSheet
	b _0805DDCA
	.align 2, 0
_0805DD68: .4byte 0x082FCAE8
_0805DD6C:
	cmp r4, #5
	bne _0805DD7C
	ldr r0, _0805DD78
	bl LoadCompressedSpriteSheet
	b _0805DDCA
	.align 2, 0
_0805DD78: .4byte 0x082FCAF0
_0805DD7C:
	cmp r4, #6
	bne _0805DD8C
	ldr r0, _0805DD88
	ldrb r0, [r0]
	b _0805DDB4
	.align 2, 0
_0805DD88: .4byte 0x02023D1A
_0805DD8C:
	cmp r4, #7
	bne _0805DD9C
	ldr r0, _0805DD98
	ldrb r0, [r0, #1]
	b _0805DDB4
	.align 2, 0
_0805DD98: .4byte 0x02023D1A
_0805DD9C:
	cmp r4, #8
	bne _0805DDAC
	ldr r0, _0805DDA8
	ldrb r0, [r0, #2]
	b _0805DDB4
	.align 2, 0
_0805DDA8: .4byte 0x02023D1A
_0805DDAC:
	cmp r5, #9
	bne _0805DDC8
	ldr r0, _0805DDC0
	ldrb r0, [r0, #3]
_0805DDB4:
	lsls r0, r0, #3
	ldr r1, _0805DDC4
	adds r0, r0, r1
	bl LoadCompressedSpriteSheet
	b _0805DDCA
	.align 2, 0
_0805DDC0: .4byte 0x02023D1A
_0805DDC4: .4byte 0x082FCB00
_0805DDC8:
	movs r6, #1
_0805DDCA:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end BattleLoadAllHealthBoxesGfx

	thumb_func_start LoadBattleBarGfx
LoadBattleBarGfx: @ 0x0805DDD4
	push {lr}
	ldr r0, _0805DDEC
	ldr r1, _0805DDF0
	ldr r1, [r1]
	movs r2, #0xba
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r1, [r1]
	bl LZDecompressVram
	pop {r0}
	bx r0
	.align 2, 0
_0805DDEC: .4byte 0x08C093F8
_0805DDF0: .4byte 0x02024178
	thumb_func_end LoadBattleBarGfx

	thumb_func_start BattleInitAllSprites
BattleInitAllSprites: @ 0x0805DDF4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #0
	ldrb r0, [r5]
	cmp r0, #6
	bls _0805DE04
	b _0805DF62
_0805DE04:
	lsls r0, r0, #2
	ldr r1, _0805DE10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805DE10: .4byte 0x0805DE14
_0805DE14: @ jump table
	.4byte _0805DE30 @ case 0
	.4byte _0805DE36 @ case 1
	.4byte _0805DF40 @ case 2
	.4byte _0805DE4C @ case 3
	.4byte _0805DE7C @ case 4
	.4byte _0805DEB8 @ case 5
	.4byte _0805DF58 @ case 6
_0805DE30:
	bl ClearSpritesBattlerHealthboxAnimData
	b _0805DF40
_0805DE36:
	ldrb r0, [r4]
	bl BattleLoadAllHealthBoxesGfx
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DE44
	b _0805DF3C
_0805DE44:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _0805DF62
_0805DE4C:
	ldr r0, _0805DE64
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805DE68
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805DE68
	bl CreateSafariPlayerHealthboxSprites
	b _0805DE6E
	.align 2, 0
_0805DE64: .4byte 0x02022C90
_0805DE68:
	ldrb r0, [r4]
	bl CreateBattlerHealthboxSprites
_0805DE6E:
	ldr r2, _0805DE78
	ldrb r1, [r4]
	adds r1, r1, r2
	strb r0, [r1]
	b _0805DF2A
	.align 2, 0
_0805DE78: .4byte 0x03005AD0
_0805DE7C:
	ldrb r0, [r4]
	bl InitBattlerHealthboxCoords
	ldr r0, _0805DE9C
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0805DEA4
	ldr r0, _0805DEA0
	adds r0, r1, r0
	ldrb r0, [r0]
	movs r1, #0
	bl DummyBattleInterfaceFunc
	b _0805DF2A
	.align 2, 0
_0805DE9C: .4byte 0x02023D1A
_0805DEA0: .4byte 0x03005AD0
_0805DEA4:
	ldr r0, _0805DEB4
	adds r0, r1, r0
	ldrb r0, [r0]
	movs r1, #1
	bl DummyBattleInterfaceFunc
	b _0805DF2A
	.align 2, 0
_0805DEB4: .4byte 0x03005AD0
_0805DEB8:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805DF00
	ldr r0, _0805DEF0
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0805DF1E
	ldr r0, _0805DEF4
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0805DEF8
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0805DEFC
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	b _0805DF1E
	.align 2, 0
_0805DEF0: .4byte 0x02022C90
_0805DEF4: .4byte 0x03005AD0
_0805DEF8: .4byte 0x02023D12
_0805DEFC: .4byte 0x02024190
_0805DF00:
	ldr r0, _0805DF48
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0805DF4C
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0805DF50
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
_0805DF1E:
	ldr r1, _0805DF48
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
_0805DF2A:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _0805DF54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _0805DF62
_0805DF3C:
	movs r0, #0
	strb r0, [r4]
_0805DF40:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0805DF62
	.align 2, 0
_0805DF48: .4byte 0x03005AD0
_0805DF4C: .4byte 0x02023D12
_0805DF50: .4byte 0x020243E8
_0805DF54: .4byte 0x02023D10
_0805DF58:
	bl LoadAndCreateEnemyShadowSprites
	bl sub_081B8908
	movs r6, #1
_0805DF62:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end BattleInitAllSprites

	thumb_func_start ClearSpritesHealthboxAnimData
ClearSpritesHealthboxAnimData: @ 0x0805DF6C
	push {r4, lr}
	ldr r4, _0805DF90
	ldr r0, [r4]
	ldr r0, [r0, #4]
	movs r1, #0
	movs r2, #0x30
	bl memset
	ldr r0, [r4]
	ldr r0, [r0, #8]
	movs r1, #0
	movs r2, #0x10
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DF90: .4byte 0x02024174
	thumb_func_end ClearSpritesHealthboxAnimData

	thumb_func_start ClearSpritesBattlerHealthboxAnimData
ClearSpritesBattlerHealthboxAnimData: @ 0x0805DF94
	push {lr}
	bl ClearSpritesHealthboxAnimData
	ldr r0, _0805DFAC
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_0805DFAC: .4byte 0x02024174
	thumb_func_end ClearSpritesBattlerHealthboxAnimData

	thumb_func_start CopyAllBattleSpritesInvisibilities
CopyAllBattleSpritesInvisibilities: @ 0x0805DFB0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r4, #0
	ldr r5, _0805E014
	ldrb r0, [r5]
	cmp r4, r0
	bge _0805E006
	ldr r0, _0805E018
	mov sb, r0
	movs r0, #1
	mov ip, r0
	movs r0, #2
	rsbs r0, r0, #0
	mov r8, r0
	ldr r7, _0805E01C
	ldr r6, _0805E020
_0805DFD4:
	ldr r0, [r7]
	ldr r0, [r0]
	lsls r3, r4, #2
	adds r3, r3, r0
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	mov r0, ip
	ands r1, r0
	ldrb r2, [r3]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r4, #1
	ldrb r0, [r5]
	cmp r4, r0
	blt _0805DFD4
_0805E006:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E014: .4byte 0x02023D10
_0805E018: .4byte 0x020205AC
_0805E01C: .4byte 0x02024174
_0805E020: .4byte 0x02023E88
	thumb_func_end CopyAllBattleSpritesInvisibilities

	thumb_func_start CopyBattleSpriteInvisibility
CopyBattleSpriteInvisibility: @ 0x0805E024
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0805E058
	ldr r1, [r1]
	ldr r1, [r1]
	lsls r3, r0, #2
	adds r3, r3, r1
	ldr r2, _0805E05C
	ldr r1, _0805E060
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	ldrb r2, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_0805E058: .4byte 0x02024174
_0805E05C: .4byte 0x020205AC
_0805E060: .4byte 0x02023E88
	thumb_func_end CopyBattleSpriteInvisibility

	thumb_func_start HandleSpeciesGfxDataChange
HandleSpeciesGfxDataChange: @ 0x0805E064
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _0805E138
	ldr r0, _0805E114
	adds r5, r7, r0
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0805E118
	mov r8, r1
	add r0, r8
	ldr r4, _0805E11C
	ldr r1, [r4]
	ldr r1, [r1, #8]
	ldrb r1, [r1]
	bl StartSpriteAnim
	lsls r0, r7, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r6, r0, #0x10
	ldr r2, _0805E120
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrh r1, [r0]
	lsls r1, r1, #5
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	ldr r0, [r2]
	adds r0, r0, r1
	adds r1, r6, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _0805E124
	adds r1, r7, r1
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0805E0FA
	ldr r3, _0805E128
	adds r0, r6, #0
	movs r1, #0x10
	movs r2, #6
	bl BlendPalette
	lsls r1, r6, #1
	ldr r0, _0805E12C
	adds r0, r1, r0
	ldr r2, _0805E130
	adds r1, r1, r2
	ldr r2, _0805E134
	bl CpuSet
_0805E0FA:
	adds r0, r7, #0
	bl GetBattlerSpriteDefault_Y
	ldrb r2, [r5]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x22]
	b _0805E396
	.align 2, 0
_0805E114: .4byte 0x02023E88
_0805E118: .4byte 0x020205AC
_0805E11C: .4byte 0x02024174
_0805E120: .4byte 0x02024140
_0805E124: .4byte 0x02024188
_0805E128: .4byte 0x00007FFF
_0805E12C: .4byte 0x020377B4
_0805E130: .4byte 0x020373B4
_0805E134: .4byte 0x04000008
_0805E138:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E174
	movs r0, #0
	mov sl, r0
	ldr r0, _0805E168
	ldr r0, [r0]
	ldr r2, [r0, #0x18]
	ldrh r1, [r2, #2]
	mov r8, r1
	ldr r3, [r2, #8]
	mov sb, r3
	ldr r4, [r2, #0xc]
	lsls r0, r1, #3
	ldr r1, _0805E16C
	adds r0, r0, r1
	ldr r1, _0805E170
	ldr r1, [r1]
	ldr r1, [r1, #4]
	ldr r3, [r2, #0x10]
	b _0805E216
	.align 2, 0
_0805E168: .4byte 0x02039BD4
_0805E16C: .4byte 0x082D6148
_0805E170: .4byte 0x02024178
_0805E174:
	adds r0, r7, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, [sp]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805E1A8
	ldr r1, _0805E1A0
	ldr r2, [sp]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805E1A4
	b _0805E1B8
	.align 2, 0
_0805E1A0: .4byte 0x02023D12
_0805E1A4: .4byte 0x020243E8
_0805E1A8:
	ldr r1, _0805E220
	ldr r3, [sp]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805E224
_0805E1B8:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E234
	ldr r0, _0805E220
	lsls r4, r7, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0805E224
	adds r0, r0, r5
	movs r1, #0
	bl GetMonData
	mov sb, r0
	ldrh r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #1
	bl GetMonData
	adds r4, r0, #0
	mov r1, r8
	lsls r0, r1, #3
	ldr r1, _0805E228
	adds r0, r0, r1
	ldr r1, _0805E22C
	ldr r1, [r1]
	mov r3, sl
	lsls r2, r3, #2
	adds r1, #4
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, _0805E230
	lsls r2, r7, #2
	adds r2, r2, r3
	ldr r3, [r2]
_0805E216:
	mov r2, r8
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	b _0805E27E
	.align 2, 0
_0805E220: .4byte 0x02023D12
_0805E224: .4byte 0x02024190
_0805E228: .4byte 0x082D6148
_0805E22C: .4byte 0x02024178
_0805E230: .4byte 0x02024160
_0805E234:
	ldr r0, _0805E3A8
	lsls r4, r7, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0805E3AC
	adds r0, r0, r5
	movs r1, #0
	bl GetMonData
	mov sb, r0
	ldrh r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #1
	bl GetMonData
	adds r4, r0, #0
	mov r1, r8
	lsls r0, r1, #3
	ldr r1, _0805E3B0
	adds r0, r0, r1
	ldr r1, _0805E3B4
	ldr r1, [r1]
	mov r3, sl
	lsls r2, r3, #2
	adds r1, #4
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, _0805E3B8
	lsls r2, r7, #2
	adds r2, r2, r3
	ldr r3, [r2]
	mov r2, r8
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
_0805E27E:
	ldr r0, _0805E3B4
	ldr r0, [r0]
	mov r2, sl
	lsls r1, r2, #2
	adds r0, #4
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, _0805E3BC
	adds r0, r0, r7
	mov sl, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _0805E3C0
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x11
	ldr r1, _0805E3C4
	adds r0, r0, r1
	ldr r1, _0805E3C8
	str r2, [r1]
	str r0, [r1, #4]
	ldr r0, _0805E3CC
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	lsls r0, r7, #0x14
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	mov r0, r8
	adds r1, r4, #0
	mov r2, sb
	bl GetMonSpritePalFromSpeciesAndPersonality
	mov sb, r0
	ldr r4, _0805E3D0
	adds r1, r4, #0
	bl LZDecompressVram
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0805E3D4
	cmp r8, r0
	bne _0805E326
	mov r2, sl
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0805E3C0
	adds r1, #8
	adds r0, r0, r1
	ldr r1, _0805E3D8
	mov r3, r8
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0]
	ldr r5, _0805E3DC
	ldr r1, [r5]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	mov r0, sb
	bl LZDecompressVram
	ldr r0, _0805E3E0
	ldr r1, [sp]
	adds r0, r1, r0
	ldrb r1, [r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	ldr r0, [r5]
	adds r0, r0, r1
	adds r1, r6, #0
	movs r2, #0x20
	bl LoadPalette
_0805E326:
	ldr r3, _0805E3E4
	adds r0, r6, #0
	movs r1, #0x10
	movs r2, #6
	bl BlendPalette
	lsls r1, r6, #1
	ldr r0, _0805E3E8
	adds r0, r1, r0
	ldr r2, _0805E3EC
	adds r1, r1, r2
	ldr r2, _0805E3F0
	bl CpuSet
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E366
	ldr r0, _0805E3F4
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0, #2]
	ldr r0, _0805E3E0
	adds r1, r7, r0
	ldr r3, [sp]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r1]
_0805E366:
	adds r0, r7, #0
	bl GetBattlerSpriteDefault_Y
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _0805E3C0
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x22]
	mov r3, sl
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _0805E3E0
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
_0805E396:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3A8: .4byte 0x02023D12
_0805E3AC: .4byte 0x020243E8
_0805E3B0: .4byte 0x082DDA1C
_0805E3B4: .4byte 0x02024178
_0805E3B8: .4byte 0x02024160
_0805E3BC: .4byte 0x02023E88
_0805E3C0: .4byte 0x020205AC
_0805E3C4: .4byte 0x06010000
_0805E3C8: .4byte 0x040000D4
_0805E3CC: .4byte 0x84000200
_0805E3D0: .4byte 0x0201C000
_0805E3D4: .4byte 0x00000181
_0805E3D8: .4byte 0x082DD33C
_0805E3DC: .4byte 0x02024140
_0805E3E0: .4byte 0x02024188
_0805E3E4: .4byte 0x00007FFF
_0805E3E8: .4byte 0x020377B4
_0805E3EC: .4byte 0x020373B4
_0805E3F0: .4byte 0x04000008
_0805E3F4: .4byte 0x02024174
	thumb_func_end HandleSpeciesGfxDataChange

	thumb_func_start BattleLoadSubstituteOrMonSpriteGfx
BattleLoadSubstituteOrMonSpriteGfx: @ 0x0805E3F8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _0805E4B4
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E414
	movs r4, #0
	b _0805E41E
_0805E414:
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0805E41E:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E430
	ldr r0, _0805E42C
	b _0805E43E
	.align 2, 0
_0805E42C: .4byte 0x08C2D1C4
_0805E430:
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E458
	ldr r0, _0805E450
_0805E43E:
	ldr r1, _0805E454
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #4
	adds r1, r1, r4
	ldr r1, [r1]
	bl LZDecompressWram
	b _0805E46A
	.align 2, 0
_0805E450: .4byte 0x08C2CF84
_0805E454: .4byte 0x02024178
_0805E458:
	ldr r0, _0805E4A0
	ldr r1, _0805E4A4
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #4
	adds r1, r1, r4
	ldr r1, [r1]
	bl LZDecompressWram
_0805E46A:
	movs r3, #1
	lsls r6, r5, #4
	ldr r0, _0805E4A4
	ldr r0, [r0]
	adds r0, #4
	adds r4, r0, r4
	ldr r2, _0805E4A8
	ldr r5, _0805E4AC
_0805E47A:
	ldr r0, [r4]
	lsls r1, r3, #0xb
	adds r1, r0, r1
	str r0, [r2]
	str r1, [r2, #4]
	str r5, [r2, #8]
	ldr r0, [r2, #8]
	adds r3, #1
	cmp r3, #3
	ble _0805E47A
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r6, r0
	ldr r0, _0805E4B0
	movs r2, #0x20
	bl LoadCompressedPalette
	b _0805E502
	.align 2, 0
_0805E4A0: .4byte 0x08C2D1C4
_0805E4A4: .4byte 0x02024178
_0805E4A8: .4byte 0x040000D4
_0805E4AC: .4byte 0x84000200
_0805E4B0: .4byte 0x08C2CF60
_0805E4B4:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E502
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E4EC
	ldr r1, _0805E4E4
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805E4E8
	adds r0, r0, r1
	adds r1, r4, #0
	bl BattleLoadOpponentMonSpriteGfx
	b _0805E502
	.align 2, 0
_0805E4E4: .4byte 0x02023D12
_0805E4E8: .4byte 0x020243E8
_0805E4EC:
	ldr r1, _0805E508
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0805E50C
	adds r0, r0, r1
	adds r1, r5, #0
	bl BattleLoadPlayerMonSpriteGfx
_0805E502:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805E508: .4byte 0x02023D12
_0805E50C: .4byte 0x02024190
	thumb_func_end BattleLoadSubstituteOrMonSpriteGfx

	thumb_func_start LoadBattleMonGfxAndAnimate
LoadBattleMonGfxAndAnimate: @ 0x0805E510
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	adds r1, r5, #0
	bl BattleLoadSubstituteOrMonSpriteGfx
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0805E54C
	adds r4, r0, r1
	ldr r0, _0805E550
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartSpriteAnim
	cmp r5, #0
	bne _0805E554
	adds r0, r6, #0
	bl GetSubstituteSpriteDefault_Y
	b _0805E55A
	.align 2, 0
_0805E54C: .4byte 0x020205AC
_0805E550: .4byte 0x02024188
_0805E554:
	adds r0, r6, #0
	bl GetBattlerSpriteDefault_Y
_0805E55A:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadBattleMonGfxAndAnimate

	thumb_func_start TrySetBehindSubstituteSpriteBit
TrySetBehindSubstituteSpriteBit: @ 0x0805E568
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xa4
	bne _0805E588
	ldr r0, _0805E58C
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
_0805E588:
	pop {r0}
	bx r0
	.align 2, 0
_0805E58C: .4byte 0x02024174
	thumb_func_end TrySetBehindSubstituteSpriteBit

	thumb_func_start ClearBehindSubstituteBit
ClearBehindSubstituteBit: @ 0x0805E590
	lsls r0, r0, #0x18
	ldr r1, _0805E5A8
	ldr r1, [r1]
	ldr r1, [r1]
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805E5A8: .4byte 0x02024174
	thumb_func_end ClearBehindSubstituteBit

	thumb_func_start HandleLowHpMusicChange
HandleLowHpMusicChange: @ 0x0805E5AC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	adds r7, r6, #0
	movs r1, #0x39
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x3a
	bl GetMonData
	adds r1, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl GetHPBarLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805E624
	ldr r7, _0805E620
	ldr r0, [r7]
	ldr r2, [r0]
	lsls r4, r6, #2
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r5, #2
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0805E676
	adds r0, r6, #0
	eors r0, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0805E612
	movs r0, #0x5a
	bl PlaySE
_0805E612:
	ldr r0, [r7]
	ldr r1, [r0]
	adds r1, r4, r1
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	b _0805E676
	.align 2, 0
_0805E620: .4byte 0x02024174
_0805E624:
	ldr r4, _0805E64C
	ldr r0, [r4]
	ldr r0, [r0]
	lsls r1, r6, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E650
	movs r0, #0x5a
	bl m4aSongNumStop
	b _0805E676
	.align 2, 0
_0805E64C: .4byte 0x02024174
_0805E650:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E676
	ldr r1, [r4]
	movs r0, #2
	eors r7, r0
	ldr r1, [r1]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0805E676
	movs r0, #0x5a
	bl m4aSongNumStop
_0805E676:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end HandleLowHpMusicChange

	thumb_func_start BattleStopLowHpSound
BattleStopLowHpSound: @ 0x0805E67C
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _0805E6CC
	ldr r0, [r5]
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r6, #3
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E6BE
	ldr r2, [r5]
	movs r0, #2
	adds r1, r4, #0
	eors r1, r0
	ldr r0, [r2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1]
_0805E6BE:
	movs r0, #0x5a
	bl m4aSongNumStop
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805E6CC: .4byte 0x02024174
	thumb_func_end BattleStopLowHpSound

	thumb_func_start GetMonHPBarLevel
GetMonHPBarLevel: @ 0x0805E6D0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x39
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x3a
	bl GetMonData
	adds r1, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl GetHPBarLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetMonHPBarLevel

	thumb_func_start HandleBattleLowHpMusicChange
HandleBattleLowHpMusicChange: @ 0x0805E704
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0805E7A8
	ldr r1, _0805E7AC
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805E79A
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #2
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r5, _0805E7B0
	mov r1, r8
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, sb
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrb r0, [r0]
	bl pokemon_order_func
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r7, #0x64
	adds r0, r4, #0
	muls r0, r7, r0
	ldr r6, _0805E7B4
	adds r4, r0, r6
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _0805E776
	adds r0, r4, #0
	mov r1, r8
	bl HandleLowHpMusicChange
_0805E776:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E79A
	adds r0, r5, #0
	muls r0, r7, r0
	adds r4, r0, r6
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _0805E79A
	adds r0, r4, #0
	mov r1, sb
	bl HandleLowHpMusicChange
_0805E79A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E7A8: .4byte 0x03002360
_0805E7AC: .4byte 0x00000439
_0805E7B0: .4byte 0x02023D12
_0805E7B4: .4byte 0x02024190
	thumb_func_end HandleBattleLowHpMusicChange

	thumb_func_start sub_0805E7B8
sub_0805E7B8: @ 0x0805E7B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	ldr r0, _0805E848
	ldrb r0, [r0]
	cmp r5, r0
	bge _0805E888
	movs r0, #3
	mov sl, r8
	mov r1, sl
	ands r1, r0
	mov sl, r1
	movs r6, #0
	movs r2, #0x3f
	rsbs r2, r2, #0
	mov sb, r2
_0805E7E4:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E87C
	ldr r4, _0805E84C
	ldr r0, _0805E850
	adds r3, r5, r0
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	movs r7, #4
	rsbs r7, r7, #0
	adds r2, r7, #0
	ands r1, r2
	mov r2, sl
	orrs r1, r2
	strb r1, [r0, #1]
	mov r7, r8
	cmp r7, #0
	bne _0805E858
	ldr r0, _0805E854
	ldr r0, [r0]
	ldr r2, [r0, #4]
	adds r2, r6, r2
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r2, #6]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #3]
	mov r2, sb
	ands r1, r2
	strb r1, [r0, #3]
	b _0805E87C
	.align 2, 0
_0805E848: .4byte 0x02023D10
_0805E84C: .4byte 0x020205AC
_0805E850: .4byte 0x02023E88
_0805E854: .4byte 0x02024174
_0805E858:
	ldrb r0, [r3]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	ldr r0, _0805E898
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r6, r0
	ldrb r1, [r0, #6]
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r0, [r2, #3]
	mov r3, sb
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #3]
_0805E87C:
	adds r6, #0xc
	adds r5, #1
	ldr r0, _0805E89C
	ldrb r0, [r0]
	cmp r5, r0
	blt _0805E7E4
_0805E888:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E898: .4byte 0x02024174
_0805E89C: .4byte 0x02023D10
	thumb_func_end sub_0805E7B8

	thumb_func_start LoadAndCreateEnemyShadowSprites
LoadAndCreateEnemyShadowSprites: @ 0x0805E8A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0805E97C
	bl LoadCompressedSpriteSheet
	movs r0, #1
	bl GetBattlerAtPosition
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0805E980
	mov r8, r0
	adds r0, r5, #0
	movs r1, #0
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #1
	bl GetBattlerSpriteCoord
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #8
	movs r0, #0xe8
	lsls r0, r0, #0xd
	adds r2, r2, r0
	asrs r2, r2, #0x10
	mov r0, r8
	adds r1, r4, #0
	movs r3, #0xc8
	bl CreateSprite
	ldr r6, _0805E984
	ldr r1, [r6]
	ldr r2, [r1, #4]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r2, r1, r2
	strb r0, [r2, #7]
	ldr r7, _0805E988
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	ldrb r1, [r1, #7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r5, [r0, #0x2e]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805E972
	movs r0, #3
	bl GetBattlerAtPosition
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	movs r1, #0
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #1
	bl GetBattlerSpriteCoord
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #8
	movs r0, #0xe8
	lsls r0, r0, #0xd
	adds r2, r2, r0
	asrs r2, r2, #0x10
	mov r0, r8
	adds r1, r4, #0
	movs r3, #0xc8
	bl CreateSprite
	ldr r1, [r6]
	ldr r2, [r1, #4]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r2, r1, r2
	strb r0, [r2, #7]
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	ldrb r1, [r1, #7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r5, [r0, #0x2e]
_0805E972:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E97C: .4byte 0x082ED028
_0805E980: .4byte 0x082ED038
_0805E984: .4byte 0x02024174
_0805E988: .4byte 0x020205AC
	thumb_func_end LoadAndCreateEnemyShadowSprites

	thumb_func_start SpriteCB_EnemyShadow
SpriteCB_EnemyShadow: @ 0x0805E98C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	ldrh r0, [r5, #0x2e]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0805E9D0
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0805E9D4
	adds r7, r0, r1
	adds r6, r7, #0
	adds r6, #0x3e
	ldrb r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805E9C8
	adds r0, r4, #0
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E9DC
_0805E9C8:
	ldr r0, _0805E9D8
	str r0, [r5, #0x1c]
	b _0805EA52
	.align 2, 0
_0805E9D0: .4byte 0x02023E88
_0805E9D4: .4byte 0x020205AC
_0805E9D8: .4byte 0x0805EA65
_0805E9DC:
	ldr r0, _0805E9F8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805E9EE
	ldrb r1, [r6]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0805EA00
_0805E9EE:
	movs r0, #1
	mov r8, r0
	ldr r2, _0805E9FC
	lsls r4, r4, #2
	b _0805EA22
	.align 2, 0
_0805E9F8: .4byte 0x0203809D
_0805E9FC: .4byte 0x02024174
_0805EA00:
	ldr r2, _0805EA5C
	ldr r0, [r2]
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r3, r1, r0
	ldrh r0, [r3, #2]
	adds r4, r1, #0
	cmp r0, #0
	beq _0805EA22
	ldr r0, _0805EA60
	ldrh r1, [r3, #2]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805EA22
	movs r0, #1
	mov r8, r0
_0805EA22:
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0805EA36
	movs r0, #1
	mov r8, r0
_0805EA36:
	ldrh r0, [r7, #0x20]
	strh r0, [r5, #0x20]
	ldrh r0, [r7, #0x24]
	strh r0, [r5, #0x24]
	adds r2, r5, #0
	adds r2, #0x3e
	mov r0, r8
	lsls r3, r0, #2
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_0805EA52:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EA5C: .4byte 0x02024174
_0805EA60: .4byte 0x082D965C
	thumb_func_end SpriteCB_EnemyShadow

	thumb_func_start SpriteCB_SetInvisible
SpriteCB_SetInvisible: @ 0x0805EA64
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end SpriteCB_SetInvisible

	thumb_func_start SetBattlerShadowSpriteCallback
SetBattlerShadowSpriteCallback: @ 0x0805EA70
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805EAEC
	ldr r0, _0805EAC0
	ldr r3, [r0]
	ldr r1, [r3]
	lsls r0, r4, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0805EA9A
	adds r5, r0, #0
_0805EA9A:
	ldr r0, _0805EAC4
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805EAD0
	ldr r2, _0805EAC8
	ldr r1, [r3, #4]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _0805EACC
	b _0805EAEA
	.align 2, 0
_0805EAC0: .4byte 0x02024174
_0805EAC4: .4byte 0x082D965C
_0805EAC8: .4byte 0x020205AC
_0805EACC: .4byte 0x0805E98D
_0805EAD0:
	ldr r2, _0805EAF4
	ldr r1, [r3, #4]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _0805EAF8
_0805EAEA:
	str r1, [r0]
_0805EAEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805EAF4: .4byte 0x020205AC
_0805EAF8: .4byte 0x0805EA65
	thumb_func_end SetBattlerShadowSpriteCallback

	thumb_func_start HideBattlerShadowSprite
HideBattlerShadowSprite: @ 0x0805EAFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0805EB24
	ldr r1, _0805EB28
	ldr r1, [r1]
	ldr r3, [r1, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r1, [r1, #7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _0805EB2C
	str r1, [r0]
	bx lr
	.align 2, 0
_0805EB24: .4byte 0x020205AC
_0805EB28: .4byte 0x02024174
_0805EB2C: .4byte 0x0805EA65
	thumb_func_end HideBattlerShadowSprite

	thumb_func_start sub_0805EB30
sub_0805EB30: @ 0x0805EB30
	push {r4, r5, r6, lr}
	ldr r3, _0805EB9C
	movs r0, #0
	movs r6, #0xf0
	lsls r6, r6, #8
_0805EB3A:
	adds r5, r0, #1
	movs r4, #0xf
_0805EB3E:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0805EB4E
	adds r0, r6, #0
	orrs r0, r1
	strh r0, [r3]
_0805EB4E:
	ldrh r1, [r3]
	movs r2, #0xf0
	lsls r2, r2, #4
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0805EB62
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r3]
_0805EB62:
	ldrh r1, [r3]
	movs r2, #0xf0
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0805EB74
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r3]
_0805EB74:
	ldrh r1, [r3]
	movs r2, #0xf
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0805EB86
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r3]
_0805EB86:
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _0805EB3E
	adds r0, r5, #0
	cmp r0, #8
	ble _0805EB3A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB9C: .4byte 0x06000240
	thumb_func_end sub_0805EB30

	thumb_func_start ClearTemporarySpeciesSpriteData
ClearTemporarySpeciesSpriteData: @ 0x0805EBA0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	ldr r0, _0805EBD0
	ldr r0, [r0]
	ldr r2, [r0]
	lsls r0, r4, #2
	adds r0, r0, r2
	movs r3, #0
	movs r2, #0
	strh r2, [r0, #2]
	ldr r0, _0805EBD4
	adds r0, r4, r0
	strb r3, [r0]
	cmp r1, #0
	bne _0805EBC8
	adds r0, r4, #0
	bl ClearBehindSubstituteBit
_0805EBC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EBD0: .4byte 0x02024174
_0805EBD4: .4byte 0x02024188
	thumb_func_end ClearTemporarySpeciesSpriteData

	thumb_func_start AllocateMonSpritesGfx
AllocateMonSpritesGfx: @ 0x0805EBD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	ldr r4, _0805ECA8
	str r6, [r4]
	movs r0, #0xc0
	lsls r0, r0, #1
	bl AllocZeroed
	str r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #8
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1]
_0805EBFE:
	ldr r0, _0805ECA8
	ldr r1, [r0]
	lsls r4, r6, #2
	adds r2, r1, #4
	adds r2, r2, r4
	lsls r3, r6, #0xd
	ldr r0, [r1]
	adds r0, r0, r3
	str r0, [r2]
	lsls r3, r6, #1
	adds r0, r3, r6
	lsls r0, r0, #3
	adds r1, r0, r1
	ldr r2, _0805ECAC
	adds r1, #0x14
	adds r0, r0, r2
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
	movs r5, #0
	mov sb, r3
	lsls r0, r6, #5
	mov r8, r0
	adds r1, r6, #1
	mov sl, r1
	mov ip, r8
	adds r7, r4, #0
_0805EC36:
	ldr r2, _0805ECA8
	ldr r1, [r2]
	lsls r4, r5, #3
	add r4, ip
	adds r3, r1, #0
	adds r3, #0x74
	adds r3, r3, r4
	adds r0, r1, #4
	adds r0, r0, r7
	lsls r2, r5, #0xb
	ldr r0, [r0]
	adds r0, r0, r2
	str r0, [r3]
	adds r1, r1, r4
	adds r1, #0x78
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _0805EC36
	ldr r1, _0805ECA8
	ldr r2, [r1]
	mov r5, sb
	adds r0, r5, r6
	lsls r0, r0, #3
	adds r1, r2, #0
	adds r1, #0x20
	adds r1, r1, r0
	mov r0, r8
	adds r0, #0x74
	adds r2, r2, r0
	str r2, [r1]
	mov r7, sl
	lsls r0, r7, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _0805EBFE
	movs r0, #0x80
	lsls r0, r0, #5
	bl AllocZeroed
	ldr r1, _0805ECA8
	ldr r1, [r1]
	movs r2, #0xba
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805ECA8: .4byte 0x02024178
_0805ECAC: .4byte 0x082FA724
	thumb_func_end AllocateMonSpritesGfx

	thumb_func_start FreeMonSpritesGfx
FreeMonSpritesGfx: @ 0x0805ECB0
	push {r4, r5, r6, lr}
	ldr r6, _0805ED28
	ldr r0, [r6]
	cmp r0, #0
	beq _0805ED22
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0805ECD6
	bl Free
	ldr r0, [r6]
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
_0805ECD6:
	ldr r0, [r6]
	movs r1, #0xbc
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0805ECF4
	bl Free
	ldr r0, [r6]
	movs r1, #0xbc
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
_0805ECF4:
	ldr r0, [r6]
	movs r5, #0xba
	lsls r5, r5, #1
	adds r0, r0, r5
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	adds r5, r0, r5
	movs r4, #0
	str r4, [r5]
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	str r4, [r0, #0xc]
	str r4, [r0, #0x10]
	bl Free
	str r4, [r6]
_0805ED22:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805ED28: .4byte 0x02024178
	thumb_func_end FreeMonSpritesGfx

	thumb_func_start ShouldPlayNormalMonCry
ShouldPlayNormalMonCry: @ 0x0805ED2C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x37
	bl GetMonData
	ldr r1, _0805ED70
	ands r1, r0
	cmp r1, #0
	bne _0805ED74
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x3a
	bl GetMonData
	adds r1, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl GetHPBarLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	ble _0805ED74
	movs r0, #1
	b _0805ED76
	.align 2, 0
_0805ED70: .4byte 0x00000FFF
_0805ED74:
	movs r0, #0
_0805ED76:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ShouldPlayNormalMonCry

